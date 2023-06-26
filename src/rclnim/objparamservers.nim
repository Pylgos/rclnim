import "."/[nodes, parameters]
import concurrent/smartptrs
import std/[tables, macros]

type
  ObjParamServerObj[T] = object
    params: ParamServer

  ObjParamServer*[T] = SharedPtr[ObjParamServerObj[T]]

proc createObjParamServer[T](node: Node): ObjParamServer[T] =
  result = newSharedPtr(ObjParamServerObj)
  result[].params = node.createParamServer()

proc createObjParamServer(node: Node, T: typedesc[object]): ObjParamServer[T] =
  createObjParamServer[T](node)

proc objToDescriptorsImpl(n: NimNode, res: var Table[string, ParamDescriptor]) =
  case n.kind
  of nnkTypeDef:
    let impl = n.getImpl()
    let fields = impl[2][2]
    objToDescriptorsImpl(fields, res)
  of nnkRecList:
    for 

macro objToDescriptors(t: typed) =
  var res: Table[string, ParamDescriptor]
  discard objToDescriptorsImpl(t, res)

when isMainModule:
  type ParamObj = object
    intParam: int
    floatParam: float
    strParam: string
  
  objToDescriptors(ParamObj)
