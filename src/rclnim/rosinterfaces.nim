import std/[macros, strformat, typetraits]
import system/ansi_c
import ./private/interfacepragmas

template isRosMessageType*(T: typedesc): bool =
  false

template isRosServiceType*(T: typedesc): bool =
  false

type
  SomeMessage* = concept type T
    T.isRosMessageType

  SomeService* = concept type T
    T.isRosServiceType

proc packageName*(T: typedesc[SomeMessage | SomeService]): string =
  getCustomPragmaVal(T, packageNamePragma).name

proc typeName*(T: typedesc[SomeMessage | SomeService]): string =
  getCustomPragmaVal(T, typeNamePragma).name

# when isMainModule:
#   block:
#     var s: CMessageSequence[int]
#     var n: seq[int]
#     n.nimMessageToC(s)
  
#   block:
#     var src = 44
#     var dest: int
#     src.cMessageToNim(dest)
#     echo dest
