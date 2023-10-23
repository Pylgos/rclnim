import ./[rcl, handles, contexts, nodes, errors, utils, typesupports, rosinterfaces, waitsets, rosinterfaceimporters]
import std/[locks, options]
import concurrent/smartptrs
importInterface action_msgs/msg/goal_info


type
  # ClientWaitables = object
  #   feedback, status, goalResponse, cancelResponse, resultResponse
  
  ActionClientBaseObj = object of RootObj
    handle: ActionClientHandle

    feedbackWaitable, statusWaitable, goalResponseWaitable, cancelResponseWaitable, resultResponseWaitable: Waitable
  
  ActionClientBase* = SharedPtr[ActionClientBaseObj]

  ActionClientObj[T: SomeAction] = object of ActionClientBaseObj

  ActionClient*[T: SomeAction] = SharedPtr[ActionClientObj[T]]

  GoalResponseRecv*[T: SomeAction] = object
    actionClient: ActionClient[T]
    sequenceNum: int64
  
  GoalHandle*[T: SomeAction] = object

disallowCopy ActionClientBaseObj


proc createActionClient*[T: SomeAction](node: Node, actionName: string): ActionClient[T] =
  result = newSharedPtr(ActionClientObj[T])
  result[].handle = newActionClientHandle(node.handle, getActionTypeSupport(T), actionName)
  let w = result[].handle.toWaitables()
  result[].feedbackWaitable = w.feedback
  result[].statusWaitable = w.status
  result[].goalResponseWaitable = w.goalResponse
  result[].cancelResponseWaitable = w.cancelResponse
  result[].resultResponseWaitable = w.resultResponse

proc createActionClient*(node: Node, T: typedesc[SomeAction], actionName: string): ActionClient[T] =
  createActionClient[T](node, actionName)

proc handle*(self: ActionClientBase | ActionClient): ActionClientHandle =
  self[].handle

proc feedbackWaitable*(self: ActionClientBase | ActionClient): Waitable =
  self[].feedbackWaitable

proc statusWaitable*(self: ActionClientBase | ActionClient): Waitable =
  self[].statusWaitable

proc goalResponseWaitable*(self: ActionClientBase | ActionClient): Waitable =
  self[].goalResponseWaitable

proc cancelResponseWaitable*(self: ActionClientBase | ActionClient): Waitable =
  self[].cancelResponseWaitable

proc resultResponseWaitable*(self: ActionClientBase | ActionClient): Waitable =
  self[].resultResponseWaitable

proc sendGoal*[T](self: ActionClient[T], goal: T.Goal): GoalResponseRecv[T] =
  var cReq = default(T.Request.CType)
  nimMessageToC(goal, cReq)
  var num: int64 = 0
  wrapError rcl_action_send_goal_request(self.handle.getRclClient(), addr cReq, addr num)
  GoalResponseRecv[T](
    actionClient: self,
    sequenceNum: int64)

proc takeResponse*[T](recv: GoalResponseRecv[T]): Option[Option[GoalHandle[T]]] =
  var
    cResp = default(GoalInfo.CType)
    respHeader: rmw_request_id_t
  withLock self.actionClient.handle.getLock():
    withLock getRclGlobalLock():
      wrapError rcl_action_take_goal_response(recv.actionClient.handle.getRclActionClient(), addr respHeader, cResp)
  

# import ./rosinterfaceimporters
importInterface nav2_msgs/action/compute_path_through_poses

echo repr ComputePathThroughPoses.getCTypeSupport()

when isMainModule:
  import ./init
  init()

  let node = newNode("test_node")
  let ac = node.createActionClient[:ComputePathThroughPoses]("compute_path_through_poses")
