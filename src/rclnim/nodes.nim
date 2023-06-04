import handles, contexts, init
import concurrent/[smartptrs]


type
  NodeObj = object
    handle: NodeHandle

  Node* = SharedPtr[NodeObj]

exportDerefConverter Node

proc `=destroy`(self: var NodeObj) =
  `=destroy`(self.handle)

proc newNode*(name: string, namespace = "", context = getGlobalContext()): Node =
  result = newSharedPtr(NodeObj)
  result.handle = newNodeHandle(context.handle, name, namespace)

proc handle*(c: Node): NodeHandle =
  c[].handle
