import "."/[rcl, errors, handles, nodes, typesupports, waitsets, qosprofiles, rosinterfaces]
import concurrent/[smartptrs]
import std/locks

type
  SubscriptionBaseObj = object of RootObj
    handle: SubscriptionHandle
    waitable: Waitable

  SubscriptionBase* = SharedPtr[SubscriptionBaseObj]

  SubscriptionObj[T] = object of SubscriptionBaseObj

  Subscription*[T] = SharedPtr[SubscriptionObj[T]]

proc createSubscription*[T: SomeMessage](node: Node, topicName: string, qos: QoSProfile): Subscription[T] =
  result = newSharedPtr(SubscriptionObj[T])
  result[].handle = newSubscriptionHandle(node.handle, getMessageTypeSupport(T), topicName, qos)
  result[].waitable = result[].handle.toWaitable()

proc createSubscription*(node: Node, T: typedesc[SomeMessage], topicName: string, qos: QoSProfile): Subscription[T] =
  createSubscription[T](node, topicName, qos)

proc handle*(self: SubscriptionBase | Subscription): SubscriptionHandle =
  self[].handle

proc waitable*(self: SubscriptionBase | Subscription): Waitable =
  self[].waitable

proc take*[T](self: Subscription[T], msg: var T): bool =
  var cMsg: T.CType
  var ret: rcl_ret_t
  withLock getRclGlobalLock():
    ret = rcl_take(self.handle.getRclSubscription(), addr cMsg, nil, nil)
  case ret
  of RCL_RET_OK:
    cMessageToNim(cMsg, msg)
    result = true
  of RCL_RET_SUBSCRIPTION_TAKE_FAILED:
    result = false
  else:
    wrapError ret
