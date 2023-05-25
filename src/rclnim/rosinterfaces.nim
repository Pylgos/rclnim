import std/macros

template isRosMessageType*(T: typedesc): bool =
  false

template isRosServiceType*(T: typedesc): bool =
  false

type
  MessageTypeSupport* = distinct pointer
  ServiceTypeSupport* = distinct pointer

  SomeMessage* = concept type T
    T.isRosMessageType

  SomeService* = concept type T
    T.isRosServiceType

type
  CMessageSequence*[T] = object
    data: ptr UncheckedArray[T]
    size: csize_t
    capacity: csize_t

proc `=copy`[T](dest: var CMessageSequence[T], src: CMessageSequence[T]) {.error.}

proc `=destroy`[T](s: var CMessageSequence[T]) =
  if s.data == nil: return
  for i in 0..<s.size:
    `=destroy`(s.data[i])
  deallocShared(s.data)

proc initCMessageSequence[T](size: Natural): CMessageSequence[T] =
  if size != 0:
    result.data = cast[ptr UncheckedArray[T]](createShared(T, size))
    result.capacity = size.csize_t
  result.size = size.csize_t

proc `[]`*[T](s: CMessageSequence[T], idx: int): var T =
  s.data[idx]

proc `[]=`*[T](s: CMessageSequence[T], idx: int, e: sink T) =
  s.data[idx] = e

macro accessField(obj: object, name: string): untyped =
  newDotExpr(obj, newIdentNode(name.strVal))

proc nimMessageToC*[T, U](src: T, dest: var U) =
  when T is U:
    dest = src
  
  elif src is seq and dest is CMessageSequence:
    dest = initCMessageSequence[dest.T](src.len)
    if src.len == 0: return
    for i, v in src:
      v.nimMessageToC(dest[i])
  
  elif src is string and dest is CMessageSequence[cchar]:
    dest = initCMessageSequence[cchar](src.len)
    if src.len == 0: return
    for i, v in src:
      v.nimMessageToC(dest[i])
  
  elif src is object and dest is object:
    for name, value in src.fieldPairs:
      value.nimMessageToC(dest.accessField(name))
  
  else:
    static: doAssert false

proc cMessageToNim*[T, U](dest: var T, src: U) =
  when T is U:
    dest = src
  
  elif src is CMessageSequence and dest is seq:
    dest = newSeq[dest.T](src.len)
    if src.len == 0: return
    for i, v in dest.mitems:
      v.cMessageToNim(src[i])
  
  elif src is CMessageSequence[cchar] and dest is string:
    dest = newString(src.len)
    for c in src:
      dest[i] = c

  elif src is object and dest is object:
    for name, value in src.fieldPairs:
      dest.accessField(name).cMessageToNim(value)

  else:
    static: doAssert false


when isMainModule:
  block:
    var s: CMessageSequence[int]
    var n: seq[int]
    n.nimMessageToC(s)
  
  block:
    var src = 44
    var dest: int
    src.cMessageToNim(dest)
    echo dest
