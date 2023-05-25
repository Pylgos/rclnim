import rcl, allocators, errors, handles, os, callbackstorages, utils
import concurrent/[smartptrs, isolatedclosures]
import std/[locks]
import threading/atomics


type
  PreShutdownCallbackId* = distinct int

  ContextObj* = object
    handle: ContextHandle
    callbackLock: Lock
    preShutdownCallbacks*: CallbackStorage[proc(){.isolatedClosure, raises: [Defect, CatchableError].}, PreShutdownCallbackId]
    shuttingDown: Atomic[bool]

  Context* = SharedPtr[ContextObj]

exportDerefConverter Context

proc shutdown*(self: var ContextObj) =
  self.shuttingDown.store(true, Release)
  withLock self.callbackLock:
    self.preShutdownCallbacks.invokeAll()
  withLock getRclGlobalLock():
    wrapError rcl_shutdown(self.handle.getRclContext())

proc isValid*(self: var ContextObj): bool =
  withLock getRclGlobalLock():
    result = rcl_context_is_valid(self.handle.getRclContext())

proc `=destroy`(self: var ContextObj) {.wrapDestructorError.} =
  if self.handle != nil:
    if self.isValid:
      self.shutdown()
    self.callbackLock.deinitLock()
  `=destroy`(self.handle)
  `=destroy`(self.preShutdownCallbacks)

proc newContext*(
    args =  @[paramStr(0)] & commandLineParams(),
    allocator = getDefaultAllocator()): Context =
  result = newSharedPtr(ContextObj)
  result.handle = newContextHandle(args, allocator.getRclAllocator())
  result.callbackLock.initLock()
  result.shuttingDown.store(false)

proc handle*(self: ContextObj): ContextHandle =
  self.handle

proc addPreShutdownCallback*(self: var ContextObj, callback: sink proc(){.isolatedClosure.}): PreShutdownCallbackId =
  withLock self.callbackLock:
    result = self.preShutdownCallbacks.add callback

proc removePreShutdownCallback*(self: var ContextObj, id: PreShutdownCallbackId) =
  withLock self.callbackLock:
    self.preShutdownCallbacks.remove id

proc isShuttingDown*(self: var ContextObj): bool =
  self.shuttingDown.load(Acquire)
