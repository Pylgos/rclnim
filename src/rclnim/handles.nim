import "."/[rcl, errors, utils, qosprofiles, rosinterfaces]
import concurrent/smartptrs
import std/locks

type
  ContextHandleObj* = object
    initialized: bool
    rclContext: rcl_context_t

  GuardConditionHandleObj* = object
    initialized: bool
    context: ContextHandle
    rclGuardCondition: rcl_guard_condition_t

  WaitSetHandleObj* = object
    initialized: bool
    context: ContextHandle
    rclWaitSet: rcl_wait_set_t

  NodeHandleObj* = object
    initialized: bool
    context: ContextHandle
    rclNode: rcl_node_t

  SubscriptionHandleObj* = object
    initialized: bool
    node: NodeHandle
    rclSubscription: rcl_subscription_t

  PublisherHandleObj* = object
    initialized: bool
    node: NodeHandle
    rclPublisher: rcl_publisher_t

  ServiceHandleObj* = object
    initialized: bool
    lock: Lock
    node: NodeHandle
    rclService: rcl_service_t
  
  ClientHandleObj* = object
    initialized: bool
    lock: Lock
    node: NodeHandle
    rclCLient: rcl_client_t

  ContextHandle* = SharedPtr[ContextHandleObj]

  GuardConditionHandle* = SharedPtr[GuardConditionHandleObj]

  WaitSetHandle* = SharedPtr[WaitSetHandleObj]

  NodeHandle* = SharedPtr[NodeHandleObj]

  SubscriptionHandle* = SharedPtr[SubscriptionHandleObj]

  PublisherHandle* = SharedPtr[PublisherHandleObj]

  ServiceHandle* = SharedPtr[ServiceHandleObj]

  ClientHandle* = SharedPtr[ClientHandleObj]

disallowCopy ContextHandleObj
disallowCopy GuardConditionHandleObj
disallowCopy WaitSetHandleObj
disallowCopy NodeHandleObj
disallowCopy SubscriptionHandleObj
disallowCopy PublisherHandleObj
disallowCopy ServiceHandleObj
disallowCopy ClientHandleObj

exportDerefConverter ContextHandle
exportDerefConverter GuardConditionHandle
exportDerefConverter WaitSetHandle
exportDerefConverter NodeHandle
exportDerefConverter SubscriptionHandle
exportDerefConverter PublisherHandle
exportDerefConverter ServiceHandle
exportDerefConverter ClientHandle

proc `=destroy`(self: var ContextHandleObj) {.wrapDestructorError.} =
  if self.initialized:
    withLock getRclGlobalLock():
      if rcl_context_is_valid(addr self.rclContext):
        wrapError rcl_shutdown(addr self.rclContext)
      wrapError rcl_context_fini(addr self.rclContext)
  self.initialized = false

proc `=destroy`(self: var GuardConditionHandleObj) {.wrapDestructorError.} =
  if self.initialized:
    withLock getRclGlobalLock():
      wrapError rcl_guard_condition_fini(addr self.rclGuardCondition)
  self.initialized = false
  `=destroy`(self.context)

proc `=destroy`(self: var WaitSetHandleObj) {.wrapDestructorError.} =
  if self.initialized:
    withLock getRclGlobalLock():
      wrapError rcl_wait_set_fini(addr self.rclWaitSet)
  self.initialized = false
  `=destroy`(self.context)

proc `=destroy`(self: var NodeHandleObj) {.wrapDestructorError.} =
  if self.initialized:
    withLock getRclGlobalLock():
      wrapError rcl_node_fini(addr self.rclNode)
  self.initialized = false
  `=destroy`(self.context)

proc `=destroy`(self: var SubscriptionHandleObj) {.wrapDestructorError.} =
  if self.initialized:
    withLock getRclGlobalLock():
      wrapError rcl_subscription_fini(addr self.rclSubscription, addr self.node.rclNode)
    # self.lock.deinitLock()
  self.initialized = false
  `=destroy`(self.node)

proc `=destroy`(self: var PublisherHandleObj) {.wrapDestructorError.} =
  if self.initialized:
    withLock getRclGlobalLock():
      wrapError rcl_publisher_fini(addr self.rclPublisher, addr self.node.rclNode)
  self.initialized = false
  `=destroy`(self.node)

proc `=destroy`(self: var ServiceHandleObj) {.wrapDestructorError.} =
  if self.initialized:
    withLock getRclGlobalLock():
      wrapError rcl_service_fini(addr self.rclService, addr self.node.rclNode)
    self.lock.deinitLock()
  self.initialized = false
  `=destroy`(self.node)

proc `=destroy`(self: var ClientHandleObj) {.wrapDestructorError.} =
  if self.initialized:
    withLock getRclGlobalLock():
      wrapError rcl_client_fini(addr self.rclClient, addr self.node.rclNode)
    self.lock.deinitLock()
  self.initialized = false
  `=destroy`(self.node)

proc newContextHandle*(
    args: seq[string],
    allocator = rcl_get_default_allocator()): ContextHandle =
  result = newSharedPtr(ContextHandleObj)
  result.rclContext = rcl_get_zero_initialized_context()
  let cArgs = allocCStringArray(args)
  defer: deallocCStringArray(cArgs)
  var initOpts = rcl_get_zero_initialized_init_options()
  withLock getRclGlobalLock():
    wrapError rcl_init_options_init(addr initOpts, allocator)
    try:
      wrapError rcl_init(args.len.cint, cast[ptr ptr cschar](cArgs), addr initOpts, addr result.rclContext)
    finally:
      wrapError rcl_init_options_fini(addr initOpts)
  result.initialized = true

proc getRclContext*(c: var ContextHandleObj): ptr rcl_context_t =
  addr c.rclContext


proc newGuardConditionHandle*(context: ContextHandle): GuardConditionHandle =
  result = newSharedPtr(GuardConditionHandleObj)
  result.context = context
  result.rclGuardCondition = rcl_get_zero_initialized_guard_condition()
  withLock getRclGlobalLock():
    wrapError rcl_guard_condition_init(
      addr result.rclGuardCondition, context.getRclContext(), rcl_guard_condition_get_default_options())
  result.initialized = true

proc getRclGuardCondition*(self: var GuardConditionHandleObj): ptr rcl_guard_condition_t =
  addr self.rclGuardCondition


proc newWaitSetHandle*(context: ContextHandle): WaitSetHandle =
  result = newSharedPtr(WaitSetHandleObj)
  result.context = context
  result.rclWaitSet = rcl_get_zero_initialized_wait_set()
  withLock getRclGlobalLock():
    wrapError rcl_wait_set_init(addr result.rclWaitSet, 0, 0, 0, 0, 0, 0, context.getRclContext(), rcl_get_default_allocator())
  result.initialized = true

proc getRclWaitSet*(w: var WaitSetHandleObj): ptr rcl_wait_set_t =
  addr w.rclWaitSet


proc newNodeHandle*(context: ContextHandle, name, namespace: string): NodeHandle =
  result = newSharedPtr(NodeHandleObj)
  result.context = context
  result.rclNode = rcl_get_zero_initialized_node()
  withLock getRclGlobalLock():
    var opts = rcl_node_get_default_options()
    try:
      wrapError rcl_node_init(addr result.rclNode, name, namespace, context.getRclContext(), addr opts)
    finally:
      wrapError rcl_node_options_fini(addr opts)
  result.initialized = true

proc getRclNode*(n: var NodeHandleObj): ptr rcl_node_t =
  addr n.rclNode


proc newSubscriptionHandle*(
    node: NodeHandle,
    typeSupport: MessageTypeSupport,
    topicName: string,
    qos: QoSProfile): SubscriptionHandle =
  result = newSharedPtr(SubscriptionHandleObj)
  result.node = node
  result.rclSubscription = rcl_get_zero_initialized_subscription()
  
  withLock getRclGlobalLock():
    var opts = rcl_subscription_get_default_options()
    opts.qos = qos.toRmw()
    try:
      wrapError rcl_subscription_init(
        addr result.rclSubscription, node.getRclNode(), cast[ptr rosidl_message_type_support_t](typeSupport), topicName, addr opts)
    finally:
      wrapError rcl_subscription_options_fini(addr opts)
  # result.lock.initLock()
  result.initialized = true

proc getRclSubscription*(s: var SubscriptionHandleObj): ptr rcl_subscription_t =
  addr s.rclSubscription

# proc lock*(s: var SubscriptionHandleObj): var Lock =
#   s.lock


proc newPublisherHandle*(
    node: NodeHandle,
    typeSupport: MessageTypeSupport,
    topicName: string,
    qos: QoSProfile): PublisherHandle =
  result = newSharedPtr(PublisherHandleObj)
  result.node = node
  result.rclPublisher = rcl_get_zero_initialized_publisher()
  withLock getRclGlobalLock():
    var opts = rcl_publisher_get_default_options()
    opts.qos = qos.toRmw()
    wrapError rcl_publisher_init(
      addr result.rclPublisher, node.getRclNode(), cast[ptr rosidl_message_type_support_t](typeSupport), topicName, addr opts)
  result.initialized = true

proc getRclPublisher*(s: var PublisherHandleObj): ptr rcl_publisher_t =
  addr s.rclPublisher


proc newServiceHandle*(
    node: NodeHandle,
    typeSupport: ServiceTypeSupport,
    serviceName: string,
    qos: QoSProfile): ServiceHandle =
  result = newSharedPtr(ServiceHandleObj)
  result.node = node
  result.rclService = rcl_get_zero_initialized_service()
  withLock getRclGlobalLock():
    var opts = rcl_service_get_default_options()
    opts.qos = qos.toRmw()
    wrapError rcl_service_init(
      addr result.rclService, node.getRclNode(), cast[ptr rosidl_service_type_support_t](typeSupport), serviceName, addr opts)
  result.lock.initLock()
  result.initialized = true

proc getRclService*(s: var ServiceHandleObj): ptr rcl_service_t =
  addr s.rclService

proc getLock*(s: var ServiceHandleObj): var Lock =
  s.lock


proc newClientHandle*(
    node: NodeHandle,
    typeSupport: ServiceTypeSupport,
    serviceName: string,
    qos: QoSProfile): ClientHandle =
  result = newSharedPtr(ClientHandleObj)
  result.node = node
  result.rclClient = rcl_get_zero_initialized_client()
  withLock getRclGlobalLock():
    var opts = rcl_client_get_default_options()
    opts.qos = qos.toRmw()
    wrapError rcl_client_init(
      addr result.rclClient, node.getRclNode(), cast[ptr rosidl_service_type_support_t](typeSupport), serviceName, addr opts)
  result.lock.initLock()
  result.initialized = true

proc getRclClient*(s: var ClientHandleObj): ptr rcl_client_t =
  addr s.rclClient

proc getLock*(s: var ClientHandleObj): var Lock =
  s.lock
