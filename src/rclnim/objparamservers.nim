import rclnim
import rclnim/chronossupport
import chronos
import std/[macros, genasts]

proc to(p: ParamValue, To: typedesc[bool]): To = p.boolVal
proc to(p: ParamValue, To: typedesc[int64]): To = p.intVal
proc to(p: ParamValue, To: typedesc[float64]): To = p.doubleVal
proc to(p: ParamValue, To: typedesc[string]): To = p.strVal
proc to(p: ParamValue, To: typedesc[seq[byte]]): To = p.byteArrayVal
proc to(p: ParamValue, To: typedesc[seq[int64]]): To = p.intArrayVal
proc to(p: ParamValue, To: typedesc[seq[float64]]): To = p.doubleArrayVal
proc to(p: ParamValue, To: typedesc[seq[string]]): To = p.strArrayVal

type
  ObjParamServer*[T: object] = ref object
    internalValue*: T
    server: ParamServer
    eventQueue: AsyncEventQueue[ParamEvent]

proc genFieldDispatchImpl(obj: NimNode, n: NimNode, body: NimNode, base: string, caseStmt: NimNode, field: NimNode) =
  case n.kind
  of nnkObjectTy:
    genFieldDispatchImpl(obj, n[2], body, base, caseStmt, field)
  of nnkRecList:
    for child in n.children:
      genFieldDispatchImpl(obj, child, body, base, caseStmt, field)
  of nnkIdentDefs:
    let typKind = n[1].typeKind
    if typKind == ntyObject:
      genFieldDispatchImpl(obj, n[0].getTypeImpl(), body, base & n[0].strVal & ".", caseStmt, field)
    else:
      let fieldName = base & n[0].strVal
      let fieldAccess = parseExpr(repr(obj) & "." & fieldName)
      caseStmt.add nnkOfBranch.newTree(
        newLit(base & n[0].strVal),
        newStmtList(
          genAst(field, fieldAccess) do:
            template field: untyped {.inject.} = fieldAccess
          ,
          body.copyNimTree()
        )
      )
  else:
    raiseAssert "unreachable"

macro genFieldDispatch[T](obj: T, name: string, field: untyped, body: untyped): untyped =
  let typ = obj.getTypeImpl()
  result = nnkCaseStmt.newTree(name)
  genFieldDispatchImpl(obj, typ, body, "", result, field)

proc updateParamLoop[T](self: ObjParamServer[T]) {.async.} =
  try:
    while true:
      let events = await self.server.waitForUpdate()
      if events.len == 0:
        return
      for ev in events:
        genFieldDispatch(self.internalValue, ev.name, field):
          field = ev.param.to(typeof(field))
        self.eventQueue.emit(ev)
  except ShutdownError:
    discard

proc value*[T](self: ObjParamServer[T]): lent T =
  self.internalValue

proc server*[T](self: ObjParamServer[T]): ParamServer =
  self.server

proc eventQueue*[T](self: ObjParamServer[T]): AsyncEventQueue[ParamEvent] =
  self.eventQueue

macro set*[T](self: ObjParamServer[T], fld: untyped, value: untyped): untyped =
  result = newStmtList()
  let fieldName = repr(fld)
  let access = parseExpr(repr(self) & ".internalValue." & fieldName)
  let asgn = nnkAsgn.newTree(access, value)
  result.add asgn
  result.add genAst(self, fieldName, access) do:
    self.server.set(fieldName, access)

proc declareParam[T](server: ParamServer, name: string, val: T) =
  when compiles(toParam(val)):
    server.declare(name, val)
  elif val is object:
    for fieldName, fieldVal in val.fieldPairs:
      let base =
        if name == "": ""
        else: name & "."
      declareParam(server, base & fieldName, fieldVal)
  else:
    static: raiseAssert "type " & $T & " is not supported"

proc createObjParamServer*[T](node: Node, default: T): ObjParamServer[T] =
  let server = node.createParamServer()
  
  declareParam(server, "", default)
  server.endDeclaration()

  result = ObjParamServer[T](
    internalValue: default,
    server: server,
    eventQueue: newAsyncEventQueue[ParamEvent]()
  )

  asyncSpawn result.updateParamLoop()


when isMainModule:
  type
    TestB = object
      fieldD: string


    Test = object
      fieldA: int
      fieldB: float
      fieldC: TestB

  rclnim.init()
  let node = Node.new("test_node")
  let p = createObjParamServer(node, Test())
  p.set(fieldB, 14)
