import "."/[rcl, errors, handles, nodes, qosprofiles, typesupports, rosinterfaces]
import concurrent/[smartptrs]


type
  PublisherBaseObj = object of RootObj
    handle: PublisherHandle

  PublisherBase* = SharedPtr[PublisherBaseObj]

  PublisherObj[T] = object of PublisherBaseObj

  Publisher*[T] = SharedPtr[PublisherObj[T]]

proc createPublisher*[T: SomeMessage](node: Node, topicName: string, qos: QoSProfile): Publisher[T] =
  result = newSharedPtr(PublisherObj[T])
  result[].handle = newPublisherHandle(node.handle, getMessageTypeSupport(T), topicName, qos)

proc createPublisher*(node: Node, T: typedesc[SomeMessage], topicName: string, qos: QoSProfile): Publisher[T] =
  createPublisher[T](node, topicName, qos)

proc handle*(self: PublisherBase | Publisher): PublisherHandle =
  self[].handle

proc publish*[T](pub: Publisher[T], msg: T) =
  var cMsg: T.CType
  nimMessageToC(msg, cMsg)
  wrapError rcl_publish(pub.handle.getRclPublisher(), addr cMsg, nil)
