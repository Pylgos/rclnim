import "."/[
  nodes, rosinterfaceimporters, contexts, services, publishers, 
  singlethreadexecutors, qosprofiles, guardconditions, waitsets,
  parametertypes, utils, handles, rcl, errors]
import concurrent/[smartptrs, isolatedclosures]
import std/[strformat, tables, locks, strutils, sequtils, algorithm]
import tinyre

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

  UndeclaredParamError* = object of ValueError

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
      "cannot set parameter before endDeclaration is called"
  if name in self.params:
    let info = self.params[name]
    if info.desc.readOnly:
      raise newException(ValueError):
        fmt"parameter '{name}' is read only"
    if (not info.desc.dynamicTyping) and value.kind != info.desc.kind:
      raise newException(ValueError):
        fmt"parameter '{name}' type mismatch. expected '{info.desc.kind}' given '{value.kind}'"
    if not checkOnly:
      self.params[name].value = value
      let ev = ParamEvent(kind: Changed, name: name, param: value)
      self.publishParamEvent(ev)
      if notifySelf:
        self.events.add ev
        self.updatedCond.trigger()
  else:
    raise newException(UndeclaredParamError):
      fmt"attempted to set undeclared parameter '{name}'"

proc getParam(self: var ParamServerObj, name: string): ParamValue =
  if not self.paramsDeclared:
    raise newException(ValueError):
      "cannot get parameter before endDeclaration is called"
  try:
    self.params[name].value
  except KeyError:
    raise newException(UndeclaredParamError):
      "attempted to get undeclared parameter"

proc task(self: ptr ParamServerObj) =
  self.executor.onRequest(self.getSrv):
    withLock self.paramsLock:
      result.values = newSeq[ParameterValue](request.names.len)
      for i, name in request.names:
        if name in self.params:
          result.values[i] = self[].getParam(name).toMsg()
        else:
          result.values[i] = ParameterValue(type: ParameterType.PARAMETER_NOT_SET)
  
  self.executor.onRequest(self.getTypesSrv):
    withLock self.paramsLock:
      result.types = newSeq[uint8](request.names.len)
      for i, name in request.names:
        if name in self.params:
          result.types[i] = self[].getParam(name).toMsg().type
        else:
          result.types[i] = ParameterType.PARAMETER_NOT_SET
  
  self.executor.onRequest(self.setSrv):
    withLock self.paramsLock:
      result.results = newSeq[SetParametersResult](request.parameters.len)
      for i, p in request.parameters:
        if p.name in self.params:
          try:
            self[].setParam(p.name, p.value.toParam(), notifySelf = true)
            result.results[i] = SetParametersResult(successful: true)
          except ValueError as e:
            result.results[i] = SetParametersResult(successful: false, reason: e.msg)
        else:
          result.results[i] = SetParametersResult(successful: false, reason: "parameter is not declared")

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
        for p in request.parameters:
          self[].setParam(p.name, p.value.toParam(), notifySelf = true)
        result.result = SetParametersResult(successful: true)
      else:
        result.result = SetParametersResult(successful: false, reason: reason)

  self.executor.onRequest(self.describeSrv):
    withLock self.paramsLock:
      result.descriptors = newSeq[ParameterDescriptor](request.names.len)
      for i, name in request.names:
        if name in self.params:
          result.descriptors[i] = self.params[name].desc.toMsg()
        else:
          result.descriptors[i] = ParameterDescriptor()
  
  self.executor.onRequest(self.listSrv):
    const sep = '.'
    withLock self.paramsLock:
      result.result.names = newSeq[string]()
      result.result.prefixes = newSeq[string]()
      for name in self.params.keys.toSeq.sorted():
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
    if self.thread.running:
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

template ptrToUncheckedArray[T](p: ptr T): ptr UncheckedArray[T] =
  cast[ptr UncheckedArray[T]](p)

template ptrToUncheckedArray(p: ptr ptr cschar): ptr UncheckedArray[cstring] =
  cast[ptr UncheckedArray[cstring]](p)

proc paramValueFrom(v: ptr rcl_variant_t): ParamValue =
  template toArray(field: untyped, T: typedesc): seq[T] =
    let arr = v.field
    var res = newSeq[T](arr.size)
    for i in 0..<arr.size:
      when T is string:
        var ss = arr.ptrToUncheckedArray()[i]
        res[i] = newString(ss.size)
        for j in 0..<ss.size:
          res[i][j] = ss.data[].ptrToUncheckedArray[j].char
      else:
        res[i] = T(arr.values.ptrToUncheckedArray[i])
    res

  if v.bool_value != nil:
    return ParamValue(kind: Bool, boolVal: v.bool_value[])
  elif v.integer_value != nil:
    return ParamValue(kind: Int, intVal: v.integer_value[])
  elif v.double_value != nil:
    return ParamValue(kind: Double, doubleVal: v.double_value[])
  elif v.string_value != nil:
    return ParamValue(kind: Str, strVal: $v.string_value)
  elif v.byte_array_value != nil:
    return ParamValue(kind: ByteArray, byteArrayVal: toArray(byte_array_value, uint8))
  elif v.bool_array_value != nil:
    return ParamValue(kind: BoolArray, boolArrayVal: toArray(bool_array_value, bool))
  elif v.integer_array_value != nil:
    return ParamValue(kind: IntArray, intArrayVal: toArray(integer_array_value, int64))
  elif v.double_array_value != nil:
    return ParamValue(kind: DoubleArray, doubleArrayVal: toArray(double_array_value, float64))
  elif v.string_array_value != nil:
    return ParamValue(kind: StringArray, strArrayVal: toArray(string_array_value, string))
  else:
    doAssert false

func matchNodeName*(pattern, fqn: string): bool =
  # https://github.com/ros2/rclcpp/blob/6e97990a32afa17ab98ef4c800783c5cce801786/rclcpp/src/rclcpp/parameter_map.cpp#L28
  let pattern = pattern.replace("/*", "(/\\w+)")
  match(fqn, pattern.re).len != 0

proc getParamsFromArgs(args: ptr rcl_arguments_t, fullyQualifiedNodeName: string): Table[string, ParamValue] =
  var params: ptr rcl_params_t = nil
  wrapError rcl_arguments_get_param_overrides(args, addr params)
  if params == nil: return

  defer: rcl_yaml_node_struct_fini(params)
  doAssert params.node_names != nil
  doAssert params.params != nil
  let rawNodeNames = params.node_names.ptrToUncheckedArray
  for i in 0..<params.num_nodes:
    doAssert rawNodeNames[i] != nil
    let nodeName = block:
      let tmp = $rawNodeNames[i]
      if tmp.startsWith("/"):
        tmp
      else:
        "/" & tmp
    if matchNodeName(nodeName, fullyQualifiedNodeName):
      let paramsNode = addr params.params.ptrToUncheckedArray[i]
      for j in 0..<paramsNode.num_params:
        let paramName = paramsNode.parameter_names.ptrToUncheckedArray[j]
        doAssert paramName != nil
        let val = addr paramsNode.parameter_values.ptrToUncheckedArray[j]
        doAssert val != nil
        result[$paramName] = paramValueFrom(val)

proc setParamFromArgs(self) =
  let params = getParamsFromArgs(addr self.context.handle.getRclContext().global_arguments, self.fullyQualifiedNodeName)
  for (name, value) in params.pairs:
    self.setParam(name, value)

proc endDeclaration*(self) =
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
  self[].eventsPub = node.createPublisher(ParameterEvent, "/" & paramEventsName, eventQoS)
  self[].paramsDeclared = true
  self.setParamFromArgs()
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

proc declare*[T](self; name: string, defaultVal: sink T, description = "", readOnly = false, constraint = T.toRangeConstraint()) =
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
