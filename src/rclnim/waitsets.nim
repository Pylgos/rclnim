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

  WaitableObj = object
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

  WaitSetObj = object
    handle: WaitSetHandle
    interruptCond: GuardConditionHandle
    interruptCondWaitable: Waitable
    interrupted: Atomic[bool]
    context: Context
    callbackId: PreShutdownCallbackId

  WaitSet* = SharedPtr[WaitSetObj]

  WaitResultKind* = enum
    Ready
    Shutdown
    Timeout
  
  WaitResult* = object
    case kind*: WaitResultKind
    of Ready:
      readyWaitables*: seq[Waitable]
    else:
      discard

  AlreadyWaitingDefect* = object of Defect

  WaitableIdxPairSeq = seq[tuple[waitable: Waitable, idx: int]]

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

proc addToRclWaitSet(waitSet: ptr rcl_wait_set_t, waitable: Waitable): int =
  var idx: csize_t
  case waitable.kind
  of WaitableKind.GuardCondition:
    wrapError rcl_wait_set_add_guard_condition(waitSet, waitable.guardCondition.getRclGuardCondition(), addr idx)
  of WaitableKind.Subscription:
    wrapError rcl_wait_set_add_subscription(waitSet, waitable.subscription.getRclSubscription(), addr idx)
  of WaitableKind.Service:
    wrapError rcl_wait_set_add_service(waitSet, waitable.service.getRclService(), addr idx)
  of WaitableKind.Client:
    wrapError rcl_wait_set_add_client(waitSet, waitable.client.getRclClient(), addr idx)
  result = idx.int

proc fillWaitSet(self: WaitSet, waitables: openArray[Waitable]): WaitableIdxPairSeq =
  let c = waitables.count()
  wrapError rcl_wait_set_resize(
    self.handle.getRclWaitSet(),
    csize_t c.subscriptions,
    csize_t c.guardConditions + 1,
    csize_t 0,
    csize_t c.clients,
    csize_t c.services,
    csize_t 0)
  discard addToRclWaitSet(self.handle.getRclWaitSet(), self.interruptCondWaitable)
  for waitable in waitables:
    let idx = addToRclWaitSet(self.handle.getRclWaitSet(), waitable)
    result.add (waitable, idx)

template ptrAsArray[T](p: ptr T): ptr UncheckedArray[T] =
  cast[ptr UncheckedArray[T]](p)

proc getReadyWaitables(waitSet: ptr rcl_wait_set_t, waitableIdxPair: WaitableIdxPairSeq): seq[Waitable] =
  for (waitable, idx) in waitableIdxPair:
    var isReady = false

    case waitable.kind
    of WaitableKind.Subscription:
      isReady = waitSet.subscriptions.ptrAsArray[idx] != nil
    of WaitableKind.GuardCondition:
      isReady = waitSet.guard_conditions.ptrAsArray[idx] != nil
    of WaitableKind.Client:
      isReady = waitSet.clients.ptrAsArray[idx] != nil
    of WaitableKind.Service:
      isReady = waitSet.services.ptrAsArray[idx] != nil

    if isReady:
      result.add waitable

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

proc handle*(self: WaitSet): WaitSetHandle =
  self[].handle

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

  lockWaitables(waitables)
  defer: unlockWaitables(waitables)

  var waitableIdxPair: WaitableIdxPairSeq

  withLock getRclGlobalLock():
    waitableIdxPair = self.fillWaitSet(waitables)
  
  let timeoutNs =
    if timeout.isSome:
      timeout.get.inNanoseconds
    else:
      -1
  
  ret = rcl_wait(self.handle.getRclWaitSet(), timeoutNs)

  var readyWaitables = getReadyWaitables(self.handle.getRclWaitSet(), waitableIdxPair)

  case ret
  of RCL_RET_OK:
    if self.context.isShuttingDown:
      result = WaitResult(kind: Shutdown)
    else:
      result = WaitResult(kind: Ready, readyWaitables: readyWaitables)
  of RCL_RET_TIMEOUT:
    result = WaitResult(kind: Timeout)
  else:
    wrapError ret
