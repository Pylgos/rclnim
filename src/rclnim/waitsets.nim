import rcl, errors, handles, contexts, init
import concurrent/[smartptrs, isolatedclosures]
import threading/atomics
import std/[options, times, locks, strformat]


type
  WaitableKind* {.pure.} = enum
    GuardCondition
    Subscription
    Service
    Client

  WaitableObj* = object
    case kind*: WaitableKind
    of WaitableKind.GuardCondition:
      guardCondition*: GuardConditionHandle
    of WaitableKind.Subscription:
      subscription*: SubscriptionHandle
    of WaitableKind.Service:
      service*: ServiceHandle
    of WaitableKind.Client:
      client*: ClientHandle
    waiting: Atomic[bool]

  Waitable* = SharedPtr[WaitableObj]

  WaitSetObj* {.byref.} = object
    handle: WaitSetHandle
    interruptCond: GuardConditionHandle
    interruptCondWaitable: Waitable
    interrupted: Atomic[bool]
    context: Context
    callbackId: PreShutdownCallbackId

  WaitSet* = SharedPtr[WaitSetObj]

  WaitResult* = enum
    Ready
    Interrupted
    Shutdown
    Timeout

  AlreadyWaitingDefect* = object of Defect

exportDerefConverter Waitable
exportDerefConverter WaitSet

proc toWaitable*(s: GuardConditionHandle): Waitable =
  result = newSharedPtr(WaitableObj)
  result[] = WaitableObj(kind: WaitableKind.GuardCondition, guardCondition: s)

proc toWaitable*(s: SubscriptionHandle): Waitable =
  result = newSharedPtr(WaitableObj)
  result[] = WaitableObj(kind: WaitableKind.Subscription, subscription: s)

proc toWaitable*(s: ServiceHandle): Waitable =
  result = newSharedPtr(WaitableObj)
  result[] = WaitableObj(kind: WaitableKind.Service, service: s)

proc toWaitable*(s: ClientHandle): Waitable =
  result = newSharedPtr(WaitableObj)
  result[] = WaitableObj(kind: WaitableKind.Client, client: s)

proc count*(waitables: openArray[Waitable]): tuple[guardConditions, subscriptions, services, clients: Natural] =
  for waitable in waitables:
    case waitable.kind
    of WaitableKind.GuardCondition:
      inc result.guardConditions
    of WaitableKind.Subscription:
      inc result.subscriptions
    of WaitableKind.Service:
      inc result.services
    of WaitableKind.Client:
      inc result.clients

proc addToRclWaitSet(waitSet: ptr rcl_wait_set_t, waitable: Waitable) =
  case waitable.kind
  of WaitableKind.GuardCondition:
    wrapError rcl_wait_set_add_guard_condition(waitSet, waitable.guardCondition.getRclGuardCondition(), nil)
  of WaitableKind.Subscription:
    wrapError rcl_wait_set_add_subscription(waitSet, waitable.subscription.getRclSubscription(), nil)
  of WaitableKind.Service:
    wrapError rcl_wait_set_add_service(waitSet, waitable.service.getRclService(), nil)
  of WaitableKind.Client:
    wrapError rcl_wait_set_add_client(waitSet, waitable.client.getRclClient(), nil)

proc fillWaitSet(waitSet: WaitSetHandle, waitables: openArray[Waitable]) =
  let c = waitables.count()
  wrapError rcl_wait_set_resize(
    waitSet.getRclWaitSet(),
    csize_t c.subscriptions,
    csize_t c.guardConditions,
    csize_t 0,
    csize_t c.clients,
    csize_t c.services,
    csize_t 0)
  for waitable in waitables:
    addToRclWaitSet(waitSet.getRclWaitSet(), waitable)

proc `=destroy`(self: var WaitSetObj) =
  if self.handle != nil:
    self.context.removePreShutdownCallback(self.callbackId)
  `=destroy`(self.handle)
  `=destroy`(self.interruptCond)
  `=destroy`(self.interruptCondWaitable)
  `=destroy`(self.context)

proc interrupt*(self: var WaitSetObj) =
  self.interrupted.store(true)
  withLock getRclGlobalLock():
    wrapError rcl_trigger_guard_condition(self.interruptCond.getRclGuardCondition())

proc newWaitSet*(context = getGlobalContext()): WaitSet =
  result = newSharedPtr(WaitSetObj)
  result.handle = newWaitSetHandle(context.handle)
  result.interruptCond = newGuardConditionHandle(context.handle)
  result.interruptCondWaitable = result.interruptCond.toWaitable()
  result.interrupted.store(false)
  result.context = context
  let p = addr result[]
  result.callbackId = context.addPreShutdownCallback do() {.isolatedClosure.}:
    p[].interrupt()

proc handle*(self: WaitSetObj): WaitSetHandle =
  self.handle

proc lockWaitables(waitables: openArray[Waitable]) =
  var
    failedPos = 0
    failed = false
  for i, waitable in waitables:
    var expected = false
    if not waitable.waiting.compareExchange(expected, true, AcqRel):
      failedPos = i
      failed = true
  if failed:
    for i in 0..<failedPos:
      waitables[i].waiting.store(false, Release)
    raise newException(AlreadyWaitingDefect):
      fmt"The {failedPos}'th waitable is already waiting by another thread."
  
  for i, waitable in waitables:
    case waitable.kind
    of WaitableKind.Client:
      waitable.client.getLock().acquire()
    of WaitableKind.Service:
      waitable.service.getLock().acquire()
    else:
      discard
  

proc unlockWaitables(waitables: openArray[Waitable]) =
  for waitable in waitables:
    waitable.waiting.store(false, Release)
  
  for i, waitable in waitables:
    case waitable.kind
    of WaitableKind.Client:
      waitable.client.getLock().release()
    of WaitableKind.Service:
      waitable.service.getLock().release()
    else:
      discard

proc wait*(self: WaitSet, waitables: openArray[Waitable], timeout = none(Duration)): WaitResult =
  var ret: rcl_ret_t
  var interrupted = false

  lockWaitables(waitables)
  defer: unlockWaitables(waitables)

  withLock getRclGlobalLock():
    self.handle.fillWaitSet(@waitables & self.interruptCondWaitable)
  
  let timeoutNs =
    if timeout.isSome:
      timeout.get.inNanoseconds
    else:
      -1
  
  ret = rcl_wait(self.handle.getRclWaitSet(), timeoutNs)
  interrupted = self.interrupted.exchange(false)

  case ret
  of RCL_RET_OK:
    if interrupted:
      if self.context.isShuttingDown:
        result = Shutdown
      else:
        result = Interrupted
    else:
      result = Ready
  of RCL_RET_TIMEOUT:
    result = Timeout
  else:
    wrapError ret
