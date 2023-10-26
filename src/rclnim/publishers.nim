import "."/[rcl, errors, handles, nodes, qosprofiles, typesupports, rosinterfaces, typesupports]
import concurrent/[smartptrs]


type
  PublisherBaseObj = object of RootObj
    handle: PublisherHandle

  PublisherBase* = SharedPtr[PublisherBaseObj]

  PublisherObj[T] = object of PublisherBaseObj
    typesupport: MessageTypesupport[T]

  Publisher*[T] = SharedPtr[PublisherObj[T]]

proc createPublisher*[T: SomeMessage](node: Node, topicName: string, qos: QoSProfile): Publisher[T] =
  result = newSharedPtr(PublisherObj[T])
  result[].typesupport = getMessageTypesupport[T]()
  result[].handle = newPublisherHandle(node.handle, result[].typesupport.rosidlTypesupport, topicName, qos)

proc createPublisher*(node: Node, T: typedesc[SomeMessage], topicName: string, qos: QoSProfile): Publisher[T] =
  createPublisher[T](node, topicName, qos)

proc handle*(self: PublisherBase | Publisher): PublisherHandle =
  self[].handle

proc publish*[T](pub: Publisher[T], msg: T) =
  let encoded = pub[].typesupport.encode(msg)
  defer: pub[].typesupport.delete(encoded)
  wrapError rcl_publish(pub.handle.getRclPublisher(), encoded, nil)
