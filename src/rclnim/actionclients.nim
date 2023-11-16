import ./[rcl, handles, contexts, nodes, errors, utils, typesupports, rosinterfaces, waitsets, rosinterfaceimporters]
import ./private/actioninternaltypes
import std/[locks, options, random]
import concurrent/smartptrs
importInterface action_msgs/msg/goal_info
importInterface unique_identifier_msgs/msg/uuid


type
  # ClientWaitables = object
  #   feedback, status, goalResponse, cancelResponse, resultResponse
  
  ActionClientBaseObj = object of RootObj
    handle: ActionClientHandle

    feedbackWaitable, statusWaitable, goalResponseWaitable, cancelResponseWaitable, resultResponseWaitable: Waitable
  
  ActionClientBase* = SharedPtr[ActionClientBaseObj]

  ActionClientObj[T: SomeAction] = object of ActionClientBaseObj
    typesupport: ActionTypesupport[T]

  ActionClient*[T: SomeAction] = SharedPtr[ActionClientObj[T]]

  GoalResponseRecv*[T: SomeAction] = object
    actionClient: ActionClient[T]
    sequenceNum: int64
  
  GoalHandle*[T: SomeAction] = object

disallowCopy ActionClientBaseObj


proc createActionClient*[T: SomeAction](node: Node, actionName: string): ActionClient[T] =
  result = newSharedPtr(ActionClientObj[T])
  result[].typesupport = getActionTypesupport[T]()
  result[].handle = newActionClientHandle(node.handle, result[].typesupport.rosidlTypesupport, actionName)
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

proc generateUUID(): UUID =
  var rng = initRand()
  for i in 0..<result.uuid.len:
    result.uuid[i] = rng.rand(uint8)

proc sendGoal*[T](self: ActionClient[T], goal: T.Goal): GoalResponseRecv[T] =
  var req = SendGoalRequest[T](
    uuid: generateUUID(),
    goal: goal
  )
  var rosReq = self.typesupport.encodeSendGoalRequest(goal)
  var num: int64 = 0
  wrapError rcl_action_send_goal_request(self.handle.getRclClient(), rosReq, addr num)
  GoalResponseRecv[T](
    actionClient: self,
    sequenceNum: int64)

proc takeGoalResponse*[T](recv: GoalResponseRecv[T]): Option[GoalHandle[T]] =
  var
    respHeader: rmw_request_id_t
    rosResp = recv.actionClient[].typesupport.createSendGoalResponse()
    ret: rcl_ret_t
  withLock self.actionClient.handle.getLock():
    withLock getRclGlobalLock():
      ret = rcl_action_take_goal_response(recv.actionClient.handle.getRclActionClient(), addr respHeader, rosResp)
  doAssert respHeader.request_id.sequence_number == self.sequenceNum
  case ret
  of RCL_RET_OK:
    let resp = recv.actionClient[].typesupport.decodeSendGoalResponse(rosResp)
    true
  of RCL_RET_CLIENT_TAKE_FAILED:
    recv.actionClient[].typesupport.deleteSendGoalResponse(rosResp)
    false
  else:
    recv.actionClient[].typesupport.deleteSendGoalResponse(rosResp)
    wrapError ret
    unreachable()

# import ./rosinterfaceimporters
importInterface nav2_msgs/action/compute_path_through_poses

echo repr ComputePathThroughPoses.getCTypeSupport()

when isMainModule:
  import ./init
  init()

  let node = newNode("test_node")
  let ac = node.createActionClient[:ComputePathThroughPoses]("compute_path_through_poses")
