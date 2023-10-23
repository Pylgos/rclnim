import std/[macros, strformat, typetraits]
import system/ansi_c
import ./private/interfacepragmas

template isRosMessageType*(T: typedesc): bool =
  false

template isRosServiceType*(T: typedesc): bool =
  false

template isRosActionType*(T: typedesc): bool =
  false

type
  SomeMessage* = concept type T
    T.isRosMessageType

  SomeService* = concept type T
    T.isRosServiceType

  SomeAction* = concept type T
    T.isRosActionType

proc packageName*(T: typedesc[SomeMessage | SomeService]): string =
  getCustomPragmaVal(T, packageNamePragma).name

proc typeName*(T: typedesc[SomeMessage | SomeService]): string =
  getCustomPragmaVal(T, typeNamePragma).name
