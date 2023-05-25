import ./[rcl, errors, handles, nodes, qosprofiles, typesupports, rosinterfaces]
import concurrent/[smartptrs]


type
  PublisherBaseObj* = object of RootObj
    handle: PublisherHandle

  PublisherBase* = SharedPtr[PublisherBaseObj]

  PublisherObj*[T] = object of PublisherBaseObj

  Publisher*[T] = SharedPtr[PublisherObj[T]]

converter `[]`*[T](self: Publisher[T]): var PublisherObj[T] =
  smartptrs.`[]`(self)

exportDerefConverter PublisherBase

converter toPublisherBase*(p: Publisher): PublisherBase =
  p.toBase()

proc createPublisher*[T: SomeMessage](node: Node, topicName: string, qos: QoSProfile): Publisher[T] =
  result = newSharedPtr(PublisherObj[T])
  result[].handle = newPublisherHandle(node.handle, getMessageTypeSupport(T), topicName, qos)

proc createPublisher*(node: Node, T: typedesc[SomeMessage], topicName: string, qos: QoSProfile): Publisher[T] =
  createPublisher[T](node, topicName, qos)

proc handle*(self: var PublisherBaseObj | var PublisherObj): PublisherHandle =
  self.handle

proc publish*[T](pub: var PublisherObj[T], msg: T) =
  var cMsg: T.CType
  nimMessageToC(msg, cMsg)
  wrapError rcl_publish(pub.handle.getRclPublisher(), addr cMsg, nil)
