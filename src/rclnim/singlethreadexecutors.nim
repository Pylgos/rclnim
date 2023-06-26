import "."/[waitsets, subscriptions, services, clients, init, utils]
import concurrent/[smartptrs, isolatedclosures]
import std/[options, locks, tables, times]


type
  SingleThreadExecutorObj = object
    waitSet: WaitSet
    subscriptions: Table[Waitable, proc(){.isolatedClosure.}]
    services: Table[Waitable, proc(){.isolatedClosure.}]

  SingleThreadExecutor* = SharedPtr[SingleThreadExecutorObj]

using self: SingleThreadExecutor

proc newSingleThreadExecutor*(context = getGlobalContext()): SingleThreadExecutor {.newProc.} =
  result = newSharedPtr(SingleThreadExecutorObj)
  result[].waitSet = newWaitSet(context)

proc spinSome*(self; timeout = none(Duration)): bool =
  var toWait = newSeqOfCap[Waitable](self[].subscriptions.len + self[].services.len)
  for w in self[].subscriptions.keys: toWait.add w
  for w in self[].services.keys: toWait.add w
  let res = self[].waitSet.wait(toWait, timeout)
  case res.kind
  of Ready:
    if res.readyWaitables.len == 0:
      return false

    for ready in res.readyWaitables:
      if ready in self[].subscriptions:
        self[].subscriptions[ready]()
      elif ready in self[].services:
        self[].services[ready]()
    return true
  of Timeout:
    return true
  of Shutdown:
    return false

proc addSubscription*[T](self; sub: Subscription[T], cb: proc(msg: sink T)) =
  if sub.waitable in self[].subscriptions:
    raise newException(ValueError):
      "subscription is already registered"
  self[].subscriptions[sub.waitable] =
    proc() =
      var msg: T
      if sub.take(msg):
        cb(msg)

proc removeSubscription*[T](self; sub: Subscription[T]) =
  self[].subscriptions.del sub.waitable

proc addService*[T](self; srv: Service[T], cb: sink proc(req: sink T.Request): T.Response {.isolatedClosure.}) =
  if srv.waitable in self[].services:
    raise newException(ValueError):
      "service is already registered"
  self[].services[srv.waitable] =
    proc() {.isolatedClosure.} =
      var req: T.Request
      let sender = srv.takeRequest(req)
      if sender.isSome():
        let resp = cb(req)
        let sender = sender.get()
        sender.send(resp)

template onRequest*[T](self; srv: Service[T], body: untyped) =
  let cb =
    proc(request{.inject.}: sink T.Request): T.Response {.isolatedClosure.} =
      body
  addService[T](self, srv, cb)

proc removeService*[T](self; srv: Service[T]) =
  self[].services.del srv.waitable

proc interrupt*(self) =
  self[].waitSet.interrupt()
