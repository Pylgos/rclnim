import "."/[rcl, errors, utils, qosprofiles, rosinterfaces, clocks]
import concurrent/smartptrs
import std/locks

type
  ContextHandleObj = object
    initialized: bool
    rclContext: rcl_context_t

  GuardConditionHandleObj = object
    initialized: bool
    context: ContextHandle
    rclGuardCondition: rcl_guard_condition_t

  WaitSetHandleObj = object
    initialized: bool
    context: ContextHandle
    rclWaitSet: rcl_wait_set_t

  NodeHandleObj = object
    initialized: bool
    context: ContextHandle
    rclNode: rcl_node_t

  SubscriptionHandleObj = object
    initialized: bool
    node: NodeHandle
    rclSubscription: rcl_subscription_t

  PublisherHandleObj = object
    initialized: bool
    node: NodeHandle
    rclPublisher: rcl_publisher_t

  ServiceHandleObj = object
    initialized: bool
    lock: ptr Lock
    node: NodeHandle
    rclService: rcl_service_t
  
  ClientHandleObj = object
    initialized: bool
    lock: ptr Lock
    node: NodeHandle
    rclCLient: rcl_client_t
  
  ActionClientHandleObj = object
    initialized: bool
    lock: ptr Lock
    node: NodeHandle
    rclActionClient: rcl_action_client_t
  
  ActionServerHandleObj = object
    initialized: bool
    lock: ptr Lock
    node: NodeHandle
    rclActionServer: rcl_action_server_t

  ContextHandle* = SharedPtr[ContextHandleObj]

  GuardConditionHandle* = SharedPtr[GuardConditionHandleObj]

  WaitSetHandle* = SharedPtr[WaitSetHandleObj]

  NodeHandle* = SharedPtr[NodeHandleObj]

  SubscriptionHandle* = SharedPtr[SubscriptionHandleObj]

  PublisherHandle* = SharedPtr[PublisherHandleObj]

  ServiceHandle* = SharedPtr[ServiceHandleObj]

  ClientHandle* = SharedPtr[ClientHandleObj]

  ActionClientHandle* = SharedPtr[ActionClientHandleObj]

  ActionServerHandle* = SharedPtr[ActionServerHandleObj]

disallowCopy ContextHandleObj
disallowCopy GuardConditionHandleObj
disallowCopy WaitSetHandleObj
disallowCopy NodeHandleObj
disallowCopy SubscriptionHandleObj
disallowCopy PublisherHandleObj
disallowCopy ServiceHandleObj
disallowCopy ClientHandleObj
disallowCopy ActionClientHandleObj
disallowCopy ActionServerHandleObj

proc `=destroy`(self: ContextHandleObj) {.wrapDestructorError.} =
  if self.initialized:
    withLock getRclGlobalLock():
      if rcl_context_is_valid(addr self.rclContext):
        wrapError rcl_shutdown(addr self.rclContext)
      wrapError rcl_context_fini(addr self.rclContext)

proc `=destroy`(self: GuardConditionHandleObj) {.wrapDestructorError.} =
  if self.initialized:
    withLock getRclGlobalLock():
      wrapError rcl_guard_condition_fini(addr self.rclGuardCondition)
  `=destroy`(self.context)

proc `=destroy`(self: WaitSetHandleObj) {.wrapDestructorError.} =
  if self.initialized:
    withLock getRclGlobalLock():
      wrapError rcl_wait_set_fini(addr self.rclWaitSet)
  `=destroy`(self.context)

proc `=destroy`(self: NodeHandleObj) {.wrapDestructorError.} =
  if self.initialized:
    withLock getRclGlobalLock():
      wrapError rcl_node_fini(addr self.rclNode)
  `=destroy`(self.context)

proc `=destroy`(self: SubscriptionHandleObj) {.wrapDestructorError.} =
  if self.initialized:
    withLock getRclGlobalLock():
      wrapError rcl_subscription_fini(addr self.rclSubscription, addr self.node.rclNode)
  `=destroy`(self.node)

proc `=destroy`(self: PublisherHandleObj) {.wrapDestructorError.} =
  if self.initialized:
    withLock getRclGlobalLock():
      wrapError rcl_publisher_fini(addr self.rclPublisher, addr self.node.rclNode)
  `=destroy`(self.node)

proc `=destroy`(self: ServiceHandleObj) {.wrapDestructorError.} =
  if self.initialized:
    withLock getRclGlobalLock():
      wrapError rcl_service_fini(addr self.rclService, addr self.node.rclNode)
    self.lock[].deinitLock()
    self.lock.deallocShared()
  `=destroy`(self.node)

proc `=destroy`(self: ClientHandleObj) {.wrapDestructorError.} =
  if self.initialized:
    withLock getRclGlobalLock():
      wrapError rcl_client_fini(addr self.rclClient, addr self.node.rclNode)
    self.lock[].deinitLock()
    self.lock.deallocShared()
  `=destroy`(self.node)

proc `=destroy`(self: ActionClientHandleObj) {.wrapDestructorError.} =
  if self.initialized:
    withLock getRclGlobalLock():
      wrapError rcl_action_client_fini(addr self.rclActionClient, addr self.node.rclNode)
      self.lock[].deinitLock()
      self.lock.deallocShared()
    `=destroy`(self.node)

proc `=destroy`(self: ActionServerHandleObj) {.wrapDestructorError.} =
  if self.initialized:
    withLock getRclGlobalLock():
      wrapError rcl_action_server_fini(addr self.rclActionServer, addr self.node.rclNode)
      self.lock[].deinitLock()
      self.lock.deallocShared()
    `=destroy`(self.node)


proc newContextHandle*(
    args: openArray[string],
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

proc getRclContext*(c: ContextHandle): ptr rcl_context_t =
  addr c.rclContext


proc newGuardConditionHandle*(context: ContextHandle): GuardConditionHandle =
  result = newSharedPtr(GuardConditionHandleObj)
  result.context = context
  result.rclGuardCondition = rcl_get_zero_initialized_guard_condition()
  withLock getRclGlobalLock():
    wrapError rcl_guard_condition_init(
      addr result.rclGuardCondition, context.getRclContext(), rcl_guard_condition_get_default_options())
  result.initialized = true

proc getRclGuardCondition*(self: GuardConditionHandle): ptr rcl_guard_condition_t =
  addr self.rclGuardCondition


proc newWaitSetHandle*(context: ContextHandle): WaitSetHandle =
  result = newSharedPtr(WaitSetHandleObj)
  result.context = context
  result.rclWaitSet = rcl_get_zero_initialized_wait_set()
  withLock getRclGlobalLock():
    wrapError rcl_wait_set_init(addr result.rclWaitSet, 0, 0, 0, 0, 0, 0, context.getRclContext(), rcl_get_default_allocator())
  result.initialized = true

proc getRclWaitSet*(w: WaitSetHandle): ptr rcl_wait_set_t =
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

proc getRclNode*(n: NodeHandle): ptr rcl_node_t =
  addr n.rclNode


proc newSubscriptionHandle*(
    node: NodeHandle,
    typesupport: ptr rosidl_message_type_support_t,
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
        addr result.rclSubscription, node.getRclNode(), typesupport, topicName, addr opts)
    finally:
      wrapError rcl_subscription_options_fini(addr opts)
  # result.lock.initLock()
  result.initialized = true

proc getRclSubscription*(s: SubscriptionHandle): ptr rcl_subscription_t =
  addr s.rclSubscription

# proc lock*(s: var SubscriptionHandleObj): var Lock =
#   s.lock


proc newPublisherHandle*(
    node: NodeHandle,
    typesupport: ptr rosidl_message_type_support_t,
    topicName: string,
    qos: QoSProfile): PublisherHandle =
  result = newSharedPtr(PublisherHandleObj)
  result.node = node
  result.rclPublisher = rcl_get_zero_initialized_publisher()
  withLock getRclGlobalLock():
    var opts = rcl_publisher_get_default_options()
    opts.qos = qos.toRmw()
    wrapError rcl_publisher_init(
      addr result.rclPublisher, node.getRclNode(), typesupport, topicName, addr opts)
  result.initialized = true

proc getRclPublisher*(s: PublisherHandle): ptr rcl_publisher_t =
  addr s.rclPublisher


proc newServiceHandle*(
    node: NodeHandle,
    typesupport: ptr rosidl_service_type_support_t,
    serviceName: string,
    qos: QoSProfile): ServiceHandle =
  result = newSharedPtr(ServiceHandleObj)
  result.node = node
  result.rclService = rcl_get_zero_initialized_service()
  withLock getRclGlobalLock():
    var opts = rcl_service_get_default_options()
    opts.qos = qos.toRmw()
    wrapError rcl_service_init(
      addr result.rclService, node.getRclNode(), typesupport, serviceName, addr opts)
  result.lock = createShared(Lock)
  result.lock[].initLock()
  result.initialized = true

proc getRclService*(s: ServiceHandle): ptr rcl_service_t =
  addr s.rclService

proc getLock*(s: ServiceHandle): var Lock =
  s.lock[]


proc newClientHandle*(
    node: NodeHandle,
    typesupport: ptr rosidl_service_type_support_t,
    serviceName: string,
    qos: QoSProfile): ClientHandle =
  result = newSharedPtr(ClientHandleObj)
  result.node = node
  result.rclClient = rcl_get_zero_initialized_client()
  withLock getRclGlobalLock():
    var opts = rcl_client_get_default_options()
    opts.qos = qos.toRmw()
    wrapError rcl_client_init(
      addr result.rclClient, node.getRclNode(), typesupport, serviceName, addr opts)
  result.lock = createShared(Lock)
  result.lock[].initLock()
  result.initialized = true

proc getRclClient*(s: ClientHandle): ptr rcl_client_t =
  addr s.rclClient

proc getLock*(s: ClientHandle): var Lock =
  s.lock[]


proc newActionClientHandle*(
    node: NodeHandle,
    typeSupport: ActionTypeSupport,
    actionName: string): ActionClientHandle =
  result = newSharedPtr(ActionClientHandleObj)
  result.node = node
  result.rclActionClient = rcl_action_get_zero_initialized_client()
  withLock getRclGlobalLock():
    var opts = rcl_action_client_get_default_options()
    wrapError rcl_action_client_init(
      addr result.rclActionClient, node.getRclNode(), cast[ptr rosidl_action_type_support_t](typeSupport), actionName, addr opts)
  result.lock = createShared(Lock)
  result.lock[].initLock()
  result.initialized = true

proc getRclActionClient*(s: ActionClientHandle): ptr rcl_action_client_t =
  addr s.rclActionClient

proc getLock*(s: ActionClientHandle): var Lock =
  s.lock[]


proc newActionServerHandle*(
    node: NodeHandle,
    clock: Clock,
    typeSupport: ActionTypeSupport,
    actionName: string): ActionServerHandle =
  result = newSharedPtr(ActionServerHandleObj)
  result.node = node
  result.rclActionServer = rcl_action_get_zero_initialized_server()
  withLock getRclGlobalLock():
    var opts = rcl_action_server_get_default_options()
    wrapError rcl_action_server_init(
      addr result.rclActionServer, node.getRclNode(), clock.getRclClock, cast[ptr rosidl_action_type_support_t](typeSupport), actionName, addr opts)
  result.lock = createShared(Lock)
  result.lock[].initLock()
  result.initialized = true

proc getRclActionServer*(s: ActionServerHandle): ptr rcl_action_server_t =
  addr s.rclActionServer

proc getLock*(s: ActionServerHandle): var Lock =
  s.lock[]
