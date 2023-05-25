import rcl, allocators, contexts, utils, errors, handles
import std/[os, posix, strformat, selectors, locks]
import concurrent/smartptrs

type
  SignalHandler* = object
    initialized: bool
    signalHandlerThread: Thread[ptr SignalHandler]
    threadStopEvent: SelectEvent

proc `=destroy`(s: var SignalHandler) {.wrapDestructorError.} =
  if s.initialized:
    s.threadStopEvent.trigger()
    s.signalHandlerThread.joinThread()
    s.threadStopEvent.close()
    s.initialized = false
  `=destroy`(s.signalHandlerThread)

disallowCopy SignalHandler

var gSignalHandler: SignalHandler
var gContext: Context
var gInitialized: bool

proc getGlobalContext*(): Context =
  doAssert gContext != nil
  gContext

proc signalHandlingThreadProc(h: ptr SignalHandler) {.thread.} =
  let sel = newSelector[int]()
  defer: sel.close()
  sel.registerSignal(SIGTERM, SIGTERM)
  sel.registerSignal(SIGINT, SIGINT)
  sel.registerEvent(h.threadStopEvent, -1)
  for key in sel.select(-1):
    let sigNo = sel.getData(key.fd)
    if sigNo == -1:
      return

    case sigNo
    of SIGTERM, SIGINT:
      let sigName =
        case sigNo
        of SIGTERM: "SIGTERM"
        of SIGINT: "SIGINT"
        else: ""

      echo fmt"[rclnim]: {sigName} received. Shutting down..."
      getGlobalContext().shutdown()
    else:
      doAssert false

proc installSignalHandler*() =
  gSignalHandler.initialized = true
  var s = Sigset()
  var ss = Sigset()
  doAssert sigemptyset(s) == 0
  doAssert sigaddset(s, SIGTERM) == 0
  doAssert sigaddset(s, SIGINT) == 0
  doAssert sigprocmask(SIG_SETMASK, s, ss) == 0
  gSignalHandler.threadStopEvent = newSelectEvent()
  gSignalHandler.signalHandlerThread.createThread(signalHandlingThreadProc, addr gSignalHandler)

proc init*(
    args =  @[paramStr(0)] & commandLineParams(),
    allocator = getDefaultAllocator()) =
  gContext = newContext(args, allocator)
  installSignalHandler()
  var rclAlloc = allocator.getRclAllocator()
  withLock getRclGlobalLock():
    wrapError rcl_logging_configure(addr gContext.handle.getRclContext().global_arguments, addr rclAlloc)
  gInitialized = true
