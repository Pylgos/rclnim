import "."/[utils, init, contexts, subscriptions, services, clients, waitsets, parameters]
import std/[asyncdispatch, sets, locks, sequtils, tables, options]
import concurrent/[smartptrs, channels, threaddestructors]


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
  
  AsyncWaitSetEventKind* = enum
    Ready
    Shutdown
  
  AsyncWaitSetEvent* = object
    case kind*: AsyncWaitSetEventKind
    of Ready:
      waitables: seq[Waitable]
    of Shutdown:
      discard

  AsyncWaitSet* = object
    waitSet: WaitSet
    event: AsyncEvent
    waiters: Table[Waitable, Future[void]]
    commandChannel: Chan[Command]
    eventChannel: Chan[AsyncWaitSetEvent]
    thread: Thread[ptr AsyncWaitSet]
    shutdown: bool

  ShutdownError* = object of CatchableError

disallowCopy AsyncWaitSet

proc `=destroy`(self: var AsyncWaitSet) {.wrapDestructorError.} =
  if self.waitSet != nil:
    self.event.close()
    self.commandChannel.send Command(kind: Stop)
    self.waitSet.interrupt()
    self.thread.joinThread()
  `=destroy`(self.waitSet)
  `=destroy`(self.waiters)
  `=destroy`(self.commandChannel)
  `=destroy`(self.eventChannel)

var gAsyncWaitSet {.threadvar.}: AsyncWaitSet

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
        self.event.trigger()
    of WaitResultKind.Shutdown:
      self.eventChannel.send(AsyncWaitSetEvent(kind: Shutdown))
      self.event.trigger()
      return
    of WaitResultKind.Timeout:
      discard

proc initThreadAsyncWaitSet(context: Context) =
  gAsyncWaitSet.waitSet = newWaitSet(context)
  gAsyncWaitSet.event = newAsyncEvent()
  gAsyncWaitSet.eventChannel = initChan(AsyncWaitSetEvent, 1)
  gAsyncWaitSet.commandChannel = initChan(Command)
  addEvent(gAsyncWaitSet.event) do(fd: AsyncFd) -> bool:
    let ev = gAsyncWaitSet.eventChannel.recv()
    case ev.kind
    of Ready:
      for waitable in ev.waitables:
        gAsyncWaitSet.waiters[waitable].complete()
        gAsyncWaitSet.waiters.del waitable
    of Shutdown:
      for waiter in gAsyncWaitSet.waiters.mvalues:
        waiter.fail(newException(ShutdownError, "context was shutdown"))
      gAsyncWaitSet.waiters.clear()
      gAsyncWaitSet.shutdown = true
  gAsyncWaitSet.thread.createThread(waitLoop, addr gAsyncWaitSet)
  addThreadDestructor() do():
    {.cast(gcsafe).}:
      `=destroy`(gAsyncWaitSet)

proc prepareThreadAsyncWaitSet(context = getGlobalContext()) =
  if gAsyncWaitSet.waitSet == nil:
    initThreadAsyncWaitSet(context)

proc wait*(waitable: Waitable): Future[void] =
  prepareThreadAsyncWaitSet()

  if gAsyncWaitSet.shutdown:
    result = newFuture[void]("asyncsupport.wait")
    result.fail(newException(ShutdownError, "context was shutdown"))
    return
  
  if waitable in gAsyncWaitSet.waiters:
    result = gAsyncWaitSet.waiters[waitable]
    return
  
  result = newFuture[void]("asyncsupport.wait")
  gAsyncWaitSet.waiters[waitable] = result
  gAsyncWaitSet.commandChannel.send Command(kind: Add, waitable: waitable)
  gAsyncWaitSet.waitSet.interrupt()

proc recv*[T](self: Subscription[T]): Future[T] {.async.} =
  while true:
    await self.toBase.waitable.wait()
    if self.take(result):
      return

proc recv*[T](self: Service[T]): Future[tuple[request: T.Request, sender: ServiceSend[T]]] {.async.} =
  while true:
    let sender = self.takeRequest(result.request)
    if sender.isSome:
      result.sender = sender.get()
      break
    else:
      await self.toBase.waitable.wait()

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
