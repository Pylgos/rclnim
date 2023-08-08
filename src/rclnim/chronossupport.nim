import "."/[utils, init, contexts, subscriptions, services, clients, waitsets, parameters]
import std/[sets, locks, sequtils, tables, options, os]
import concurrent/[smartptrs, threaddestructors, channels]
import threading/atomics
import chronos
import chronos/[osutils, oserrno, threadsync]


type
  CommandKind = enum
    Add
    Stop

  Command = object
    case kind: CommandKind
    of Add:
      waitable: Waitable
    of Stop:
      discard
  
  AsyncWaitSetEventKind = enum
    Ready
    Shutdown
    Stop
  
  AsyncWaitSetEvent = object
    case kind*: AsyncWaitSetEventKind
    of Ready:
      waitables: seq[Waitable]
    of Shutdown, Stop:
      discard

  AsyncWaitSet = object
    waitSet: WaitSet
    event: ThreadSignalPtr
    waiters: Table[Waitable, Future[void]]
    commandChannel: Chan[Command]
    eventChannel: Chan[AsyncWaitSetEvent]
    thread: Thread[ptr AsyncWaitSet]
    halting: Atomic[bool]
    eventLoop: Future[void]

disallowCopy AsyncWaitSet

proc `=destroy`(self: var AsyncWaitSet) {.wrapDestructorError.} =
  if self.waitSet != nil:
    self.commandChannel.send Command(kind: Stop)
    self.halting.store(true, Release)
    self.waitSet.interrupt()
    self.thread.joinThread()
    waitFor(self.eventLoop)
    discard self.event.close()
  destroyFields(self)

var gAsyncWaitSet {.threadvar.}: AsyncWaitSet

proc destroyAsyncWaitSet*() =
  `=destroy`(gAsyncWaitSet)
  wasMoved(gAsyncWaitSet)

proc waitLoop(self: ptr AsyncWaitSet) {.thread.} =
  var waitables: HashSet[Waitable]
  while true:
    while true:
      var cmd: Command
      if self.commandChannel.tryRecv(cmd):
        case cmd.kind
        of Add:
          waitables.incl cmd.waitable
        of Stop:
          self.eventChannel.send(AsyncWaitSetEvent(kind: Stop))
          discard self.event.fireSync()
          return
      else:
        break

    let res = self.waitSet.wait(waitables.toSeq)

    case res.kind
    of WaitResultKind.Ready:
      if res.readyWaitables.len > 0:
        for readyWaitable in res.readyWaitables:
          waitables.excl readyWaitable
        self.eventChannel.send(AsyncWaitSetEvent(kind: Ready, waitables: res.readyWaitables))
        discard self.event.fireSync()
    of WaitResultKind.Shutdown:
      self.eventChannel.send(AsyncWaitSetEvent(kind: Shutdown))
      discard self.event.fireSync()
      return
    of WaitResultKind.Timeout:
      discard

proc eventLoop(p: ptr AsyncWaitSet) =
  proc continuation(userdata: pointer) {.nimcall, gcsafe, raises: [].} =
    let p = cast[ptr AsyncWaitSet](userdata)
    try:
      var ev = p.eventChannel.recv()
      case ev.kind
      of Ready:
        for waitable in ev.waitables:
          if waitable in p.waiters:
            p.waiters[waitable].complete()
            p.waiters.del waitable
        p.event.wait().addCallback(continuation, userdata)
      of Shutdown:
        for waiter in p.waiters.mvalues:
          waiter.fail(newException(ShutdownError, "halting"))
        p.waiters.clear()
        p.eventLoop.complete()
        return
      of Stop:
        for waiter in p.waiters.mvalues:
          waiter.fail(newException(ShutdownError, "halting"))
        p.waiters.clear()
        p.eventLoop.complete()
        return
    except CatchableError as e:
      for waiter in p.waiters.mvalues:
        waiter.fail(e)
      p.waiters.clear()
      p.eventLoop.complete()
  p.eventLoop = newFuture[void]("chronossupports.eventLoop")
  p.event.wait().addCallback(continuation, p)

proc initThreadAsyncWaitSet(context: Context) =
  gAsyncWaitSet.waitSet = newWaitSet(context)
  gAsyncWaitSet.event = ThreadSignalPtr.new().tryGet()
  gAsyncWaitSet.eventChannel = initChan(AsyncWaitSetEvent, 1)
  gAsyncWaitSet.commandChannel = initChan(Command)
  eventLoop(addr gAsyncWaitSet)
  gAsyncWaitSet.thread.createThread(waitLoop, addr gAsyncWaitSet)
  addThreadDestructor() do():
    {.cast(gcsafe).}:
      `=destroy`(gAsyncWaitSet)
      wasMoved(gAsyncWaitSet)

proc prepareThreadAsyncWaitSet(context = getGlobalContext()) =
  if gAsyncWaitSet.waitSet == nil:
    initThreadAsyncWaitSet(context)

proc wait*(waitable: Waitable): Future[void] =
  prepareThreadAsyncWaitSet()

  if gAsyncWaitSet.halting.load(Acquire):
    result = newFuture[void]("asyncsupport.wait")
    result.fail(newException(ShutdownError, "halting"))
    return

  if waitable in gAsyncWaitSet.waiters:
    raise newException(AlreadyWaitingDefect):
      "given waitable is already waiting by current thread"

  result = newFuture[void]("asyncsupport.wait")

  proc cancellation(udata: pointer) {.gcsafe, raises: [].} =
    gAsyncWaitSet.waiters.del waitable

  result.cancelCallback = cancellation
  gAsyncWaitSet.waiters[waitable] = result
  gAsyncWaitSet.commandChannel.send Command(kind: Add, waitable: waitable)
  gAsyncWaitSet.waitSet.interrupt()

proc recv*[T](self: Subscription[T]): Future[T] {.async.} =
  while true:
    if self.take(result):
      return
    else:
      await self.waitable.wait()

proc recv*[T](self: Service[T]): Future[tuple[request: T.Request, sender: ServiceSend[T]]] {.async.} =
  result = default((T.Request, ServiceSend[T]))
  while true:
    let sender = self.takeRequest(result.request)
    if sender.isSome:
      result.sender = sender.get()
      break
    else:
      await self.waitable.wait()

proc recv*[T](self: ClientRecv[T]): Future[T.Response] {.async.} =
  while true:
    if self.takeResponse(result):
      return
    else:
      await self.waitable.wait()

proc waitForUpdate*(self: ParamServer): Future[seq[ParamEvent]] {.async.} =
  while true:
    let events = self.takeEvents()
    if events.len > 0:
      return events
    else:
      await self.waitable.wait()
