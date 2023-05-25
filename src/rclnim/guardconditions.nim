import rcl, allocators, errors, handles, contexts, init, waitsets
import concurrent/[smartptrs]


type
  GuardConditionObj* = object
    handle: GuardConditionHandle
    waitable: Waitable

  GuardCondition* = SharedPtr[GuardConditionObj]

declareDerefConverter GuardCondition

proc newGuardCondition*(context = getGlobalContext()): GuardCondition =
  result = newSharedPtr(GuardConditionObj)
  result.handle = newGuardConditionHandle(context.handle)
  result.waitable = result.handle.toWaitable()

proc handle*(self: var GuardConditionObj): GuardCOnditionHandle =
  self.handle

proc waitable*(self: var GuardConditionObj): Waitable =
  self.waitable
