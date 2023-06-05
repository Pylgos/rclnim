import std/[macros, strformat, typetraits]
import system/ansi_c

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
    size: uint
    capacity: uint

proc `=copy`[T](dest: var CMessageSequence[T], src: CMessageSequence[T]) {.error.}

proc `=destroy`[T](s: var CMessageSequence[T]) =
  if s.data == nil: return
  for i in 0..<s.size:
    `=destroy`(s.data[i])
  c_free(s.data)
  s.data = nil

proc initCMessageSequence[T](size, cap: Natural): CMessageSequence[T] =
  doAssert cap >= size
  if cap != 0:
    result.data = cast[ptr UncheckedArray[T]](c_malloc(csize_t(sizeof(T) * cap)))
    c_memset(result.data, 0, csize_t(sizeof(T) * cap))
  result.capacity = cap.csize_t
  result.size = size.csize_t

proc initCMessageSequence[T](size: Natural): CMessageSequence[T] =
  initCMessageSequence[T](size, size)

proc len*[T](s: CMessageSequence[T]): int =
  s.size.int

proc high*[T](s: CMessageSequence[T]): int =
  s.size.int - 1

proc low*[T](s: CMessageSequence[T]): int =
  0

proc `[]`*[T](s: CMessageSequence[T], idx: int): var T =
  s.data[idx]

proc `[]=`*[T](s: CMessageSequence[T], idx: int, e: sink T) =
  s.data[idx] = e

proc `[]`*[T](s: CMessageSequence[T], idx: BackwardsIndex): var T =
  s.data[s.len - idx.int]

proc `[]=`*[T](s: CMessageSequence[T], idx: BackwardsIndex, e: sink T) =
  s.data[s.len - idx.int] = e

macro accessField(obj: object, name: string): untyped =
  newDotExpr(obj, newIdentNode(name.strVal))

proc nimMessageToC*[T, U](src: T, dest: var U) =
  when T is U:
    dest = src
  
  elif src is seq and dest is CMessageSequence:
    dest = initCMessageSequence[dest.T](src.len)
    for i, v in src:
      v.nimMessageToC(dest[i])
  
  elif src is string and dest is CMessageSequence[char]:
    dest = initCMessageSequence[char](src.len, src.len + 1)
    for i, v in src:
      dest[i] = v
    dest[^0] = '\0'
  
  elif src is object and dest is object:
    for name, value in src.fieldPairs:
      value.nimMessageToC(dest.accessField(name))
  
  else:
    static: doAssert false

proc cMessageToNim*[T, U](src: T, dest: var U) =
  when T is U:
    dest = src
  
  elif src is CMessageSequence and dest is seq:
    dest = newSeq[dest.elementType](src.len)
    for i in 0..<src.len:
      cMessageToNim(src[i], dest[i])
  
  elif src is CMessageSequence[char] and dest is string:
    dest = newString(src.len)
    for i in 0..<src.len:
      dest[i] = src[i]

  elif src is object and dest is object:
    for name, value in src.fieldPairs:
      cMessageToNim(value, dest.accessField(name))

  else:
    static:
      error fmt"cannot convert {$T} to {$U}"


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
