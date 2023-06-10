import "."/[rcl, errors, handles, contexts, init, waitsets]
import concurrent/[smartptrs]


type
  GuardConditionObj = object
    handle: GuardConditionHandle
    waitable: Waitable

  GuardCondition* = SharedPtr[GuardConditionObj]

proc newGuardCondition*(context = getGlobalContext()): GuardCondition =
  result = newSharedPtr(GuardConditionObj)
  result.handle = newGuardConditionHandle(context.handle)
  result.waitable = result.handle.toWaitable()

proc handle*(self: GuardCondition): GuardCOnditionHandle =
  self[].handle

proc waitable*(self: GuardCondition): Waitable =
  self[].waitable

proc trigger*(self: GuardCondition) =
  wrapError rcl_trigger_guard_condition(self[].handle.getRclGuardCondition())
