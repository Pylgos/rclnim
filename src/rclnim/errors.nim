import rcl

type
  RclError* = object of CatchableError
    errorCode: rcl_ret_t

proc getErrorMessage*(ret: rcl_ret_t): string =
  case ret
  of RCL_RET_OK:
    "Success"
  of RCL_RET_ERROR:
    "Unspecified error"
  of RCL_RET_TIMEOUT:
    "Timeout occurred"
  of RCL_RET_BAD_ALLOC:
    "Failed to allocate memory"
  of RCL_RET_INVALID_ARGUMENT:
    "Invalid argument"
  of RCL_RET_UNSUPPORTED:
    "Unsupported"
  
  of RCL_RET_ALREADY_INIT:
    "rcl_init() already called"
  of RCL_RET_NOT_INIT:
    "rcl_init() not yet called"
  of RCL_RET_MISMATCHED_RMW_ID:
    "Mismatched rmw identifier"
  of RCL_RET_TOPIC_NAME_INVALID:
    "Topic name does not pass validation"
  of RCL_RET_SERVICE_NAME_INVALID:
    "Service name (same as topic name) does not pass validation"
  of RCL_RET_UNKNOWN_SUBSTITUTION:
    "Topic name substitution is unknown"
  of RCL_RET_ALREADY_SHUTDOWN:
    "rcl_shutdown() already called"
  
  of RCL_RET_NODE_INVALID:
    "Invalid rcl_node_t given"
  of RCL_RET_NODE_INVALID_NAME:
    "Invalid node name"
  of RCL_RET_NODE_INVALID_NAMESPACE:
    "Invalid node namespace"
  of RCL_RET_NODE_NAME_NON_EXISTENT:
    "Failed to find node name"
  
  of RCL_RET_PUBLISHER_INVALID:
    "Invalid rcl_publisher_t given"
  
  of RCL_RET_SUBSCRIPTION_INVALID:
    "Invalid rcl_subscription_t given"
  of RCL_RET_SUBSCRIPTION_TAKE_FAILED:
    "Failed to take a message from the subscription"
  
  of RCL_RET_CLIENT_INVALID:
    "Invalid rcl_client_t given"
  of RCL_RET_CLIENT_TAKE_FAILED:
    "Failed to take a response from the client"
  
  of RCL_RET_SERVICE_INVALID:
    "Invalid rcl_service_t given"
  of RCL_RET_SERVICE_TAKE_FAILED:
    "Failed to take a request from the service"
  
  of RCL_RET_TIMER_INVALID:
    "Invalid rcl_timer_t given"
  of RCL_RET_TIMER_CANCELED:
    "Given timer was canceled"
  
  of RCL_RET_WAIT_SET_INVALID:
    "Invalid rcl_wait_set_t given"
  of RCL_RET_WAIT_SET_EMPTY:
    "Given rcl_wait_set_t is empty"
  of RCL_RET_WAIT_SET_FULL:
    "Given rcl_wait_set_t is full"
  
  of RCL_RET_INVALID_REMAP_RULE:
    "Argument is not a valid remap rule"
  of RCL_RET_WRONG_LEXEME:
    "Expected one type of lexeme but got another"
  of RCL_RET_INVALID_ROS_ARGS:
    "Found invalid ros argument while parsing"
  of RCL_RET_INVALID_PARAM_RULE:
    "Argument is not a valid parameter rule"
  of RCL_RET_INVALID_LOG_LEVEL_RULE:
    "Argument is not a valid log level rule"
  
  of RCL_RET_EVENT_INVALID:
    "Invalid rcl_event_t given"
  of RCL_RET_EVENT_TAKE_FAILED:
    "Failed to take an event from the event handle"
  
  of RCL_RET_LIFECYCLE_STATE_REGISTERED:
    "rcl_lifecycle state registered"
  of RCL_RET_LIFECYCLE_STATE_NOT_REGISTERED:
    "rcl_lifecycle state not registered"

  else:
    "Unknown error"

proc toError*(ret: rcl_ret_t): ref RclError =
  doAssert ret != RCL_RET_OK
  newException(RclError, ret.getErrorMessage())

proc wrapError*(ret: rcl_ret_t) =
  if ret != RCL_RET_OK:
    raise ret.toError()
