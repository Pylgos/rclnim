import ../rosinterfaceimporters
importInterface unique_identifier_msgs/msg/uuid
importInterface builtin_interfaces/msg/time
importInterface action_msgs/msg/goal_status_array


type
  SendGoalRequest*[T] = object
    goalId*: UUID
    goal*: T.Goal

  SendGoalResponse* = object
    accepted*: bool
    stamp*: Time

  GetResultRequest* = object
    goalId*: UUID
  
  GetResultResponse*[T] = object
    status*: int8
    result*: T.Result
