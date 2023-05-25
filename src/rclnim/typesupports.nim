import ./rosinterfaces

proc getMessageTypeSupport*(T: typedesc[SomeMessage]): MessageTypeSupport =
  T.getCTypeSupport()

proc getServiceTypeSupport*(T: typedesc[SomeService]): ServiceTypeSupport =
  T.getCTypeSupport()
