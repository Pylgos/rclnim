import utils, handles, init, contexts, publishers, subscriptions, services, clients, waitsets
import std/[asyncdispatch, sets, locks, sequtils, tables, options]
import concurrent/[smartptrs, isolatedclosures, channels, threaddestructors]


type
  CommandKind = enum
    Add
    Remove
    Stop

  Command = object
    case kind: CommandKind
    of Add, Remove:
      waitable: Waitable
      onReadyCallback: proc() {.isolatedClosure.}
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

  # AsyncWaitSet* = ref AsyncWaitSetObj

  ShutdownError* = object of CatchableError

var gAsyncWaitSet {.threadvar.}: AsyncWaitSet

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

addThreadDestructor() do():
  {.cast(gcsafe).}:
    `=destroy`(gAsyncWaitSet)

proc waitLoop(self: ptr AsyncWaitSet) {.thread.} =
  var waitableCallbackPair: Table[Waitable, proc() {.isolatedClosure.}]
  while true:
    while true:
      var cmd: Command
      if self.commandChannel.tryRecv(cmd):
        case cmd.kind
        of Add:
          waitableCallbackPair[cmd.waitable] = cmd.onReadyCallback
        of Remove:
          waitableCallbackPair.del cmd.waitable
        of Stop:
          return
      else:
        break

    let res = self.waitSet.wait(waitableCallbackPair.keys.toSeq)

    case res
    of Ready:
      for callback in waitableCallbackPair.values:
        callback()
      self.eventChannel.send(AsyncWaitSetEvent(kind: Ready, waitables: waitableCallbackPair.keys.toSeq))
      self.event.trigger()
    of Shutdown:
      self.eventChannel.send(AsyncWaitSetEvent(kind: Shutdown))
      self.event.trigger()
      return
    of Timeout, Interrupted:
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

proc prepareThreadAsyncWaitSet(context = getGlobalContext()) =
  if gAsyncWaitSet.waitSet == nil:
    initThreadAsyncWaitSet(context)

proc wait*(waitable: Waitable): Future[void] =
  prepareThreadAsyncWaitSet()
  result = newFuture[void]("asyncsupport.wait")
  if gAsyncWaitSet.shutdown:
    result.fail(newException(ShutdownError, "context was shutdown"))
    return
  gAsyncWaitSet.waiters[waitable] = result
  let commandChannelPtr = addr gAsyncWaitSet.commandChannel
  gAsyncWaitSet.commandChannel.send Command(
    kind: Add,
    waitable: waitable,
    onReadyCallback:
      proc() {.isolatedClosure.} =
        commandChannelPtr[].send Command(kind: Remove, waitable: waitable)
  )
  gAsyncWaitSet.waitSet.interrupt()

# template raiseShutdownError: untyped =
#   raise newException(ShutdownError):
#     "context was shutdown"

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

when isMainModule:
  import ./[nodes, qosprofiles, rosinterfaceimporters]
  import std/random

  randomize()

  importInterface builtin_interfaces/msg/time
  importInterface std_srvs/srv/empty

  proc main =
    initRclnim()

    let node = newNode("my_node")
    let sub = node.createSubscription(Time, "my_topic", SystemDefaultQoS)
    let srv = node.createService(Empty, "my_service", ServiceDefaultQoS)
    let cli = node.createClient(Empty, "my_service", ServiceDefaultQoS)

    proc recvTask {.async.} =
      for i in 0..<1000:
        echo "ready"
        let msg = await sub.recv()
        echo msg

    proc shutdownTask {.async.} =
      await sleepAsync 1000
      # getGlobalContext().shutdown()
    
    proc serviceTask {.async.} =
      for i in 0..<10000:
        # await sleepAsync 100
        echo "waiting for request"
        let (req, sender) = await srv.recv()
        echo "got request ", i
        # echo req
        sender.send(Empty.Response()())
        echo "response sent ", i
        await sleepAsync rand(10)
      echo "service done"
    
    proc clientTask {.async.} =
      # await sleepAsync 1000
      for i in 0..<10000:
        let receiver = cli.send(Empty.Request()())
        echo "request sent ", i
        echo "waiting for response"
        let resp = await receiver.recv()
        echo "got response ", i
        # echo resp
        await sleepAsync rand(10)
      echo "client done"

    proc asyncMain {.async.} =
      await all [serviceTask(), clientTask()]
    
    waitFor asyncMain()

  main()

  setGlobalDispatcher(nil)
  GC_fullCollect()
