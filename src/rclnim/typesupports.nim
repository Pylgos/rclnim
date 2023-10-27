import ./typesupports/[types, typesupport_c]
export types

proc getMessageTypesupport*[T](): MessageTypesupport[T] =
  getCMessageTypesupport[T]()

proc getServiceTypesupport*[T](): ServiceTypesupport[T] =
  getCServiceTypesupport[T]()

proc getActionTypesupport*[T](): ActionTypesupport[T] =
  getActionTypesupport[T]()
