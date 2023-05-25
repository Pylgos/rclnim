import std/macros


template disallowCopy*(T: untyped): untyped =
  proc `=copy`(dest: var T, src: T) {.error.}

macro wrapDestructorError*(procDef: untyped): untyped =
  procDef.expectKind nnkProcDef
  result = copyNimTree procDef
  let procBody = result.body
  let argTy = result.params[1][1]
  result.body = quote do:
    try:
      `procBody`
    except CatchableError as e:
      writeStackTrace()
      echo "An error was raised in the destructor of ", `argTy`, ": ", e.msg, " [", e.name, "]"
      # quit QuitFailure

proc initProcImpl(body: NimNode, name: string): NimNode =
  result = nnkStmtList.newNimNode()
  result.add body
  let init = nnkProcDef.newNimNode()
  for i in 0..5:
    init.add body[i].copyNimTree()
  init.name = name.ident
  init.params.insert(
    1,
    nnkIdentDefs.newTree(
      ident"_",
      nnkCommand.newTree(
        ident"type",
        body.params[0]
      ),
      newEmptyNode()
    )
  )
  let call = nnkCall.newTree(body.name)
  init.add nnkStmtList.newTree(call)
  if body.params.len > 1:
    for p in body.params[1..^1]:
      call.add p[0].copyNimTree()
  result.add init

macro initProc*(body: untyped): untyped =
  initProcImpl(body, "init")

macro newProc*(body: untyped): untyped =
  initProcImpl(body, "new")

macro getProcNameAux(n: typed): untyped =
  newLit $n[0][0].owner

macro getCurrentProcName*(): untyped =
  newCall(bindSym"getProcNameAux"):
    quote do:
      var dummy: int

when isMainModule:
  type Something = object
    f1: string
    f2: int
  
  proc initSomething(): Something {.initProc.} =
    discard

  echo Something.init()

  proc someProc() =
    echo getProcName()
  
  someProc()

  echo getProcName()
