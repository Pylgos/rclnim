import "."/[utils, init, contexts, subscriptions, services, clients, waitsets, parameters]
import std/[sets, locks, sequtils, tables, options, os]
import concurrent/[smartptrs, threaddestructors]
import threading/[channels, atomics]
import chronos
import chronos/[osutils]
from posix import EINVAL, EAGAIN, read, write, close


type EventFD = distinct cint

proc eventfd(initVal: cuint, flags: cint): cint {.importc, header: "<sys/eventfd.h>"}

proc createEventfd(): EventFD =
  eventfd(0, 0).EventFd

proc write(e: EventFD, val: uint64) =
  var v = val
  if write(e.cint, addr v, 8) < 0:
    raiseOsError(osLastError())

proc close(e: EventFD) =
  discard close(e.cint)
  if getThreadDispatcher().contains(e.AsyncFD):
    discard unregister2(e.AsyncFD)

proc readAsync(e: EventFD): Future[uint64] =
    var retFuture = newFuture[uint64]("chronossupports.readAsync")
    let eventFd = e.cint
    proc continuation(udata: pointer) {.gcsafe, raises: [].} =
      if not(retFuture.finished()):
        var data: uint64
        let res = handleEintr(read(eventFd, addr data, sizeof(uint64)))
        if res < 0:
          let errorCode = osLastError()
          # If errorCode == EAGAIN it means that reading operation is already
          # pending and so some other consumer reading eventfd or pipe end, in
          # this case we going to ignore error and wait for another event.
          if errorCode.cint != EAGAIN:
            discard removeReader2(AsyncFD(eventFd))
            retFuture.fail(newException(AsyncError, osErrorMsg(errorCode)))
        elif res != sizeof(data):
          discard removeReader2(AsyncFD(eventFd))
          retFuture.fail(newException(AsyncError, osErrorMsg(EINVAL.OSErrorCode)))
        else:
          let eres = removeReader2(AsyncFD(eventFd))
          if eres.isErr():
            retFuture.fail(newException(AsyncError, osErrorMsg(eres.error)))
          else:
            retFuture.complete(data)

    proc cancellation(udata: pointer) {.gcsafe, raises: [].} =
      if not(retFuture.finished()):
        # Future is already cancelled so we ignore errors.
        discard removeReader2(AsyncFD(eventFd))

    let loop = getThreadDispatcher()
    if not(loop.contains(AsyncFD(eventFd))):
      let res = register2(AsyncFD(eventFd))
      if res.isErr():
        retFuture.fail(newException(AsyncError, osErrorMsg(res.error)))
        return retFuture
    let res = addReader2(AsyncFD(eventFd), continuation)
    if res.isErr():
      retFuture.fail(newException(AsyncError, osErrorMsg(res.error)))
      return retFuture
    retFuture.cancelCallback = cancellation
    retFuture

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
    Stop
  
  AsyncWaitSetEvent* = object
    case kind*: AsyncWaitSetEventKind
    of Ready:
      waitables: seq[Waitable]
    of Shutdown, Stop:
      discard

  AsyncWaitSet* = object
    waitSet: WaitSet
    event: EventFD
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
    self.event.close()
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
          self.event.write(1)
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
        self.event.write(1)
    of WaitResultKind.Shutdown:
      self.eventChannel.send(AsyncWaitSetEvent(kind: Shutdown))
      self.event.write(1)
      return
    of WaitResultKind.Timeout:
      discard

proc eventLoop(p: ptr AsyncWaitSet) =
  proc continuation(userdata: pointer) {.nimcall, gcsafe, raises: [].} =
    let p = cast[ptr AsyncWaitSet](userdata)
    try:
      var ev: AsyncWaitSetEvent
      p.eventChannel.recv(ev)
      case ev.kind
      of Ready:
        for waitable in ev.waitables:
          p.waiters[waitable].complete()
          p.waiters.del waitable
          p.event.readAsync().addCallback(continuation, userdata)
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
    except CatchableError:
      discard
  p.eventLoop = newFuture[void]("chronossupports.eventLoop")
  p.event.readAsync().addCallback(continuation, p)

proc initThreadAsyncWaitSet(context: Context) =
  gAsyncWaitSet.waitSet = newWaitSet(context)
  gAsyncWaitSet.event = createEventfd()
  gAsyncWaitSet.eventChannel = newChan[AsyncWaitSetEvent](1)
  gAsyncWaitSet.commandChannel = newChan[Command]()
  eventLoop(addr gAsyncWaitSet)
  gAsyncWaitSet.thread.createThread(waitLoop, addr gAsyncWaitSet)
  {.cast(gcsafe).}:
    addThreadDestructor() do():
      {.cast(gcsafe).}:
        `=destroy`(gAsyncWaitSet)

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
