import ./[rcl, utils, errors, rostimes]
import concurrent/smartptrs


type
  ClockObj = object
    rclClock: rcl_clock_t
  
  Clock* = SharedPtr[ClockObj]

proc `=copy`(dest: var ClockObj, src: ClockObj) {.error.}

proc `=destroy`(self: var ClockObj) {.wrapDestructorError.} =
  if rcl_clock_valid(addr self.rclClock):
    wrapError rcl_clock_fini(addr self.rclClock)

proc newClock*(): Clock {.newProc.} =
  result = newSharedPtr(ClockObj)
  var allocator = rcl_get_default_allocator()
  wrapError rcl_clock_init(RCL_ROS_TIME, addr result[].rclClock, addr allocator)

using self: Clock

template rclClk: ptr rcl_clock_t {.dirty.} = addr self[].rclClock

proc now*(self): RosTime =
  var res: rcl_time_point_value_t
  wrapError rcl_clock_get_now(rclClk, addr res)
  initRosTime(res)

proc enableRosTimeOverride*(self) =
  wrapError rcl_enable_ros_time_override(rclClk)

proc disableRosTimeOverride*(self) =
  wrapError rcl_disable_ros_time_override(rclClk)

proc isEnabledRosTimeOverride*(self): bool =
  wrapError rcl_is_enabled_ros_time_override(rclClk, addr result)

proc setRosTimeOverride*(self; time: RosTime) =
  wrapError rcl_set_ros_time_override(rclClk, time.nanoseconds)

proc getRclClock*(self): ptr rcl_clock_t =
  rclClk
