import std/[tables, macros]
import concurrent/isolatedclosures


type
  CallbackStorage*[Callback: IsolatedClosure, Id] = object
    data: OrderedTable[int, Callback]
    counter: int

proc add*[Callback, Id](s: var CallbackStorage[Callback, Id], callback: sink Callback): Id =
  s.data[s.counter] = callback
  result = s.counter.Id
  inc s.counter

proc remove*[Callback, Id](s: var CallbackStorage[Callback, Id], id: Id) =
  s.data.del(id.int)

template invokeAll*(s: CallbackStorage, args: varargs[untyped]) =
  for cb in s.data.values:
    unpackVarargs(cb, args)

when isMainModule:
  var s: CallbackStorage[proc() {.isolatedClosure.}, int]
  let id1 =
    s.add do() {.isolatedClosure.}:
      echo "hi"
  let id2 =
    s.add do() {.isolatedClosure.}:
      echo "yo"
  s.invokeAll()
  s.remove(id2)
  s.invokeAll()
