import "."/[nodes, rosinterfaceimporters, contexts, services, publishers, singlethreadexecutors, qosprofiles, guardconditions, waitsets, parametertypes, utils]
import concurrent/[smartptrs, isolatedclosures]
import std/[strformat, tables, locks, strutils]

export parametertypes

importInterface rcl_interfaces/srv/[
  get_parameters,
  get_parameter_types,
  set_parameters,
  set_parameters_atomically,
  describe_parameters,
  list_parameters]

importInterface rcl_interfaces/msg/[
  parameter,
  parameter_event,
  parameter_value,
  parameter_type,
  parameter_descriptor,
  set_parameters_result,
  integer_range,
  floating_point_range]

type
  ParamServerObj = object
    context: Context
    node: Node
    fullyQualifiedNodeName: string
    paramsDeclared: bool
    qos, eventQoS: QoSProfile
    getSrv: Service[GetParameters]
    getTypesSrv: Service[GetParameterTypes]
    setSrv: Service[SetParameters]
    setAtomicallySrv: Service[SetParametersAtomically]
    describeSrv: Service[DescribeParameters]
    listSrv: Service[ListParameters]
    eventsPub: Publisher[ParameterEvent]
    thread: Thread[ptr ParamServerObj]
    updatedCond: GuardCondition
    waitable: Waitable
    paramsLock: Lock
    executor: SingleThreadExecutor
    params: Table[string, ParamInfo]
    events: seq[ParamEvent]

  ParamServer* = SharedPtr[ParamServerObj]

const
  getParamsName = "get_parameters"
  getParamTypesName = "get_parameter_types"
  setParamsName = "set_parameters"
  setParamsAtomicallyName = "set_parameters_atomically"
  describeParamsName = "describe_parameters"
  listParamsName = "list_parameters"
  paramEventsName = "parameter_events"

proc publishParamEvent(self: var ParamServerObj, ev: ParamEvent) =
  var msg = ParameterEvent(node: self.fullyQualifiedNodeName)
  let p = Parameter(name: ev.name, value: ev.param.toMsg())
  case ev.kind
  of Added:
    msg.newParameters.add p
  of Removed:
    msg.deletedParameters.add p
  of Changed:
    msg.changedParameters.add p
  self.eventsPub.publish(msg)

proc setParam(self: var ParamServerObj, name: string, value: sink ParamValue, checkOnly = false, notifySelf = false) =
  if not self.paramsDeclared:
    raise newException(ValueError):
      "cannot set parameter before finishDeclaration is called"
  if name in self.params:
    let info = self.params[name]
    if info.desc.readOnly:
      raise newException(ValueError):
        "parameter is read only"
    if (not info.desc.dynamicTyping) and value.kind != info.desc.kind:
      raise newException(ValueError):
        fmt"parameter type mismatch. expected '{info.desc.kind}' given '{value.kind}'"
    if not checkOnly:
      self.params[name].value = value
      let ev = ParamEvent(kind: Changed, name: name, param: value)
      self.publishParamEvent(ev)
      if notifySelf:
        self.events.add ev
        self.updatedCond.trigger()
  else:
    raise newException(ValueError):
      "attempted to set undeclared parameter"

proc getParam(self: var ParamServerObj, name: string): ParamValue =
  if not self.paramsDeclared:
    raise newException(ValueError):
      "cannot set parameter before finishDeclaration is called"
  try:
    result = self.params[name].value
  except KeyError:
    raise newException(ValueError):
      "attempted to get undeclared parameter"

proc task(self: ptr ParamServerObj) =
  self.executor.onRequest(self.getSrv):
    withLock self.paramsLock:
      for name in request.names:
        if name in self.params:
          result.values.add self[].getParam(name).toMsg()
        else:
          result.values.add ParameterValue(type: ParameterType.PARAMETER_NOT_SET)
  
  self.executor.onRequest(self.getTypesSrv):
    withLock self.paramsLock:
      for name in request.names:
        if name in self.params:
          result.types.add self[].getParam(name).toMsg().type
        else:
          result.types.add ParameterType.PARAMETER_NOT_SET
  
  self.executor.onRequest(self.setSrv):
    withLock self.paramsLock:
      for p in request.parameters:
        if p.name in self.params:
          try:
            self[].setParam(p.name, p.value.toParam(), notifySelf = true)
            result.results.add SetParametersResult(successful: true)
          except ValueError as e:
            result.results.add SetParametersResult(successful: false, reason: e.msg)
        else:
          result.results.add SetParametersResult(successful: false, reason: "parameter is not declared")

  self.executor.onRequest(self.setAtomicallySrv):
    withLock self.paramsLock:
      var
        canSet = true
        reason = ""

      for p in request.parameters:
        if p.name in self.params:
          try:
            self[].setParam(p.name, p.value.toParam(), checkOnly = true)
          except ValueError as e:
            canSet = false
            reason = e.msg
        else:
          canSet = false
          reason = "parameter is not declared"
      if canSet:
        result.result = SetParametersResult(successful: true)
        for p in request.parameters:
          self[].setParam(p.name, p.value.toParam(), notifySelf = true)
      else:
        result.result = SetParametersResult(successful: false, reason: reason)

  self.executor.onRequest(self.describeSrv):
    withLock self.paramsLock:
      for name in request.names:
        if name in self.params:
          result.descriptors.add self.params[name].desc.toMsg()
        else:
          result.descriptors.add ParameterDescriptor()
  
  self.executor.onRequest(self.listSrv):
    const sep = '.'
    withLock self.paramsLock:
      for (name, info) in self.params.pairs:
        let getAll =
          request.prefixes.len == 0 and
          request.depth == ListParametersRequest.DEPTH_RECURSIVE or (name.count(sep).uint64 < request.depth)
        
        var matches = false
        for prefix in request.prefixes:
          if name == prefix:
            matches = true
          elif name.startsWith(sep):
            if request.depth == 0:
              matches = true
            else:
              let cnt = name[0..prefix.high].count(sep)
              if request.depth == 0 or cnt.uint64 < request.depth:
                matches = true
          if matches:
            break
        
        if getAll or matches:
          result.result.names.add name
          let lastSep = name.rfind('.')
          if lastSep != -1:
            let prefix = name[0..<lastSep]
            if prefix notin result.result.prefixes:
              result.result.prefixes.add prefix

  while self.executor.spinSome():
    discard

proc `=destroy`(self: var ParamServerObj) {.wrapDestructorError.} =
  if self.executor != nil:
    self.executor.interrupt()
    self.thread.joinThread()
    self.paramsLock.deinitLock()
  destroyFields(self)

proc createParamServer*(node: Node, qos = ParametersQoS, eventQoS = ParameterEventQoS): ParamServer =
  result = newSharedPtr(ParamServerObj)
  result[].node = node
  result[].fullyQualifiedNodeName = node.fullyQualifiedName
  result[].context = node.context
  result[].paramsLock.initLock()
  result[].executor = newSingleThreadExecutor(node.context)
  result[].updatedCond = newGuardCondition(node.context)
  result[].waitable = result[].updatedCond.handle.toWaitable()
  result[].qos = qos
  result[].eventQoS = eventQoS

using self: ParamServer

proc finishDeclaration*(self) =
  let
    node = self[].node
    base = node.name & '/'
    qos = self[].qos
    eventQoS = self[].eventQoS
  self[].getSrv = node.createService(GetParameters, base & getParamsName, qos)
  self[].getTypesSrv = node.createService(GetParameterTypes, base & getParamTypesName, qos)
  self[].setSrv = node.createService(SetParameters, base & setParamsName, qos)
  self[].setAtomicallySrv = node.createService(SetParametersAtomically, base & setParamsAtomicallyName, qos)
  self[].describeSrv = node.createService(DescribeParameters, base & describeParamsName, qos)
  self[].listSrv = node.createService(ListParameters, base & listParamsName, qos)
  self[].eventsPub = node.createPublisher(ParameterEvent, base & paramEventsName, eventQoS)
  self[].paramsDeclared = true
  createThread(self[].thread, task, self.get())

proc waitable*(self): Waitable =
  self[].waitable

proc takeEvents*(self): seq[ParamEvent] =
  withLock self[].paramsLock:
    result = self[].events
    self[].events.setLen(0)

proc declare*(self; desc: ParamDescriptor, defaultVal: ParamValue) =
  withLock self[].paramsLock:
    if self[].paramsDeclared:
      raise newException(ValueError, "cannot declare new parameters after finishDeclaration has been called")
    if defaultVal.kind != desc.kind:
      raise newException(ValueError, "parameter type mismatch")
    if desc.name in self[].params:
      raise newException(ValueError, "parameter already declared")
    self[].params[desc.name] = ParamInfo(value: defaultVal, desc: desc)

proc declare*[T](self; name: string, defaultVal: T, description = "", readOnly = false, constraint = T.toRangeConstraint()) =
  let
    val = defaultVal.toParam()
    desc = ParamDescriptor(name: name, kind: val.kind, description: description, readOnly: readOnly, rangeConstraint: constraint)
  self.declare(desc, val)

proc isParamsDeclared*(self): bool =
  withLock self[].paramsLock:
    result = self[].paramsDeclared

proc set*(self; name: string, value: sink ParamValue, checkOnly = false, notifySelf = false) =
  withLock self[].paramsLock:
    self[].setParam(name, value, checkOnly, notifySelf)

proc set*[T](self; name: string, value: sink T, checkOnly = false, notifySelf = false) =
  withLock self[].paramsLock:
    self[].setParam(name, value.toParam(), checkOnly, notifySelf)

proc get*(self; name: string): ParamValue =
  withLock self[].paramsLock:
    result = self[].getParam(name)
