import "."/[rcl, handles, contexts, init, locks, errors, loggers]
import concurrent/[smartptrs]
import system/ansi_c


type
  NodeObj = object
    context: Context
    handle: NodeHandle
    name, namespace, fullyQualifiedName, loggerName: string

  Node* = SharedPtr[NodeObj]

exportDerefConverter Node

proc `=destroy`(self: var NodeObj) =
  `=destroy`(self.handle)

proc newNode*(name: string, namespace = "", context = getGlobalContext()): Node =
  result = newSharedPtr(NodeObj)
  result[].context = context
  result[].handle = newNodeHandle(context.handle, name, namespace)
  withLock getRclGlobalLock():
    result[].name = $rcl_node_get_name(result.handle.getRclNode())
    result[].namespace = $rcl_node_get_namespace(result.handle.getRclNode())
    result[].fullyQualifiedName = $rcl_node_get_fully_qualified_name(result.handle.getRclNode())
    result[].loggerName = $rcl_node_get_logger_name(result.handle.getRclNode())

proc handle*(self: Node): NodeHandle =
  self[].handle

proc context*(self: Node): Context =
  self[].context

proc name*(self: Node): string =
  self[].name

proc namespace*(self: Node): string =
  self[].namespace

proc fullyQualifiedName*(self: Node): string =
  self[].fullyQualifiedName

proc loggerName*(self: Node): string =
  self[].loggerName

proc getLogger*(self: Node): Logger =
  initLogger(self.loggerName)

proc resolveName(self: Node, input: string, isService, onlyExpand: bool): string =
  let output: cstring = nil
  withLock getRclGlobalLock():
    wrapError rcl_node_resolve_name(
      self.handle.getRclNode(),
      input.cstring,
      rcl_get_default_allocator(),
      isService,
      onlyExpand,
      cast[ptr ptr cschar](addr output))
  result = $output
  c_free(output)

proc resolveTopicName*(self: Node, input: string, onlyExpand = false): string =
  self.resolveName(input, false, onlyExpand)

proc resolveServiceName*(self: Node, input: string, onlyExpand = false): string =
  self.resolveName(input, true, onlyExpand)
