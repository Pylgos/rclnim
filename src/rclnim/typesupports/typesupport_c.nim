import system/ansi_c
import std/[strformat, genasts, macros, macrocache, typetraits]
import ../[rosinterfaces, rospkgfinder, rcl]
import ./types


const
  linkedPackages = CacheTable"rclnim.typesupport_c.linkedPackages"

macro getCTypeSupportImpl(packageName, namespace, typeName, funcName: static string): untyped =
  result = newStmtList()
  let qualifiedFuncName = fmt"rosidl_typesupport_c__{funcName}__{packageName}__{namespace}__{typeName}"
  if packageName notin linkedPackages:
    linkedPackages[packageName] = newEmptyNode()
    let libPath = fmt"{findRosPackage(packageName).libDir}/lib{packageName}__rosidl_typesupport_c.so"
    result.add genAst(libPath) do:
      {.passL: libPath.}
  result.add genAst(qualifiedFuncName) do:
    proc getCTypeSupportCFunc(): pointer {.importc: qualifiedFuncName, cdecl.}
    getCTypeSupportCFunc()


proc getRosidlMessageTypesupport[T](): ptr rosidl_message_type_support_t =
  cast[ptr rosidl_message_type_support_t](getCTypeSupportImpl(T.packageName, "msg", T.typeName, "get_message_type_support_handle"))

proc getRosidlServiceTypesupport[T](): ptr rosidl_service_type_support_t =
  cast[ptr rosidl_service_type_support_t](getCTypeSupportImpl(T.packageName, "srv", T.typeName, "get_service_type_support_handle"))


type
  CMessageSequence*[T] = object
    data: ptr UncheckedArray[T]
    size: uint
    capacity: uint

proc `=copy`[T](dest: var CMessageSequence[T], src: CMessageSequence[T]) {.error.}

proc `=destroy`[T](s: CMessageSequence[T]) =
  if s.data == nil: return
  for i in 0..<s.size:
    {.cast(raises: []).}:
      `=destroy`(s.data[i])
  c_free(s.data)

proc initCMessageSequence[T](size, cap: Natural): CMessageSequence[T] {.nodestroy.} =
  doAssert cap >= size
  if cap != 0:
    result.data = cast[ptr UncheckedArray[T]](c_malloc(csize_t(sizeof(T) * cap)))
  for i in 0..<size:
    # If there is no {.nodestroy.} pragma, this assignment creates `=sink`(result.data[i], default(T)),
    # inside which `=destroy`(result.data[i]) is called.
    # At this point, result.data[i] is not initialized, so undefined behavior occurs.
    result.data[i] = default(T)
  result.capacity = cap.csize_t
  result.size = size.csize_t

proc initCMessageSequence[T](size: Natural): CMessageSequence[T] =
  initCMessageSequence[T](size, size)

proc len*[T](s: CMessageSequence[T]): int =
  s.size.int

proc high*[T](s: CMessageSequence[T]): int =
  s.size.int - 1

proc low*[T](s: CMessageSequence[T]): int =
  0

proc `[]`*[T](s: CMessageSequence[T], idx: int): var T =
  s.data[idx]

proc `[]=`*[T](s: CMessageSequence[T], idx: int, e: sink T) =
  s.data[idx] = e

proc `[]`*[T](s: CMessageSequence[T], idx: BackwardsIndex): var T =
  s.data[s.len - idx.int]

proc `[]=`*[T](s: CMessageSequence[T], idx: BackwardsIndex, e: sink T) =
  s.data[s.len - idx.int] = e

var ctypeTemplateSyms{.compileTime.}: NimNode

macro genCTypeImpl(val: typed): untyped =
  let typImpl = val.getTypeImpl()
  let recList = nnkRecList.newNimNode()
  for f in typImpl[2]:
    f.expectKind nnkIdentDefs
    recList.add nnkIdentDefs.newTree(
      ident f[0].strVal,
      nnkCall.newTree(ctypeTemplateSyms, newCall(bindSym"typeof", f[1].copyNimTree)),
      newEmptyNode(),
    )

  let typeIdent = ident("CType")
  result = newStmtList(
    nnkTypeSection.newTree(
      nnkTypeDef.newTree(
        typeIdent,
        newEmptyNode(),
        nnkObjectTy.newTree(
          newEmptyNode(), newEmptyNode(), recList
        )
      ),
    ),
    nnkObjConstr.newTree(
      typeIdent
    )
  )

func genCTypeAux(T: typedesc): auto {.gcsafe, raises: [].} =
  type Ty = T
  genCTypeImpl(Ty())

macro CTypeHack(T: untyped): untyped =
  newCall(ctypeTemplateSyms, T)

template CType(T: typedesc[bool]): typedesc = bool
template CType(T: typedesc[SomeNumber]): typedesc = T
template CType(T: typedesc[uint8]): typedesc = T
template CType(T: typedesc[string]): typedesc = CMessageSequence[char]
template CType[R, U](T: typedesc[array[R, U]]): typedesc = array[R, CTypeHack(U)]
template CType[U](T: typedesc[seq[U]]): typedesc = CMessageSequence[CTypeHack(U)]
template CType(T: typedesc[object]): typedesc = typeof(genCTypeAux(T))

static:
  ctypeTemplateSyms = bindSym"CType"

macro accessField(obj: object, name: string): untyped =
  newDotExpr(obj, newIdentNode(name.strVal))

proc nimMessageToC[T, U](src: T, dest: var U) {.gcsafe, raises: [].} =
  when T is U:
    dest = src
  
  elif src is seq and dest is CMessageSequence:
    dest = initCMessageSequence[dest.T](src.len)
    for i, v in src:
      v.nimMessageToC(dest[i])
  
  elif src is string and dest is CMessageSequence[char]:
    dest = initCMessageSequence[char](src.len, src.len + 1)
    for i, v in src:
      dest[i] = v
    dest[^0] = '\0'
  
  elif src is object and dest is object:
    for name, value in src.fieldPairs:
      value.nimMessageToC(dest.accessField(name))
  
  else:
    static: raiseAssert "cannot happen"

proc cMessageToNim[T, U](src: T, dest: var U) {.gcsafe, raises: [].} =
  when T is U:
    dest = src
  
  elif src is CMessageSequence and dest is seq:
    dest = newSeq[dest.elementType](src.len)
    for i in 0..<src.len:
      cMessageToNim(src[i], dest[i])
  
  elif src is CMessageSequence[char] and dest is string:
    dest = newString(src.len)
    for i in 0..<src.len:
      dest[i] = src[i]

  elif src is object and dest is object:
    for name, value in src.fieldPairs:
      cMessageToNim(value, dest.accessField(name))

  else:
    static:
      error fmt"cannot convert {$T} to {$U}"

proc getVTable[T](): ptr TypesupportVTable[T] =
  let vtable {.global.} = TypesupportVTable[T](
    encode:
      proc(msg: T): pointer =
        var encoded = create(T.CType)
        nimMessageToC(msg, encoded[])
        encoded
    ,
    delete:
      proc(encoded: pointer) =
        {.cast(gcsafe), cast(raises: []).}:
          `=destroy`(cast[ptr T.CType](encoded)[])
        dealloc(encoded)
    ,
    create:
      proc(): pointer =
        create(T.CType)
    ,
    decode:
      proc(encoded: pointer): T {.gcsafe.} =
        let p = cast[ptr T.CType](encoded)
        cMessageToNim(p[], result)
        {.cast(gcsafe), cast(raises: []).}:
          `=destroy`(p[])
        dealloc(p)
  )
  addr vtable

proc getCMessageTypesupport*[T](): MessageTypesupport[T] =
  MessageTypesupport[T](
    name: "c",
    rosidlTypesupport: getRosidlMessageTypesupport[T](),
    vtable: getVTable[T](),
  )

proc getCServiceTypesupport*[T](): ServiceTypesupport[T] =
  ServiceTypesupport[T](
    name: "c",
    rosidlTypesupport: getRosidlServiceTypesupport[T](),
    requestVTable: getVTable[T.Request](),
    responseVTable: getVTable[T.Response](),
  )
