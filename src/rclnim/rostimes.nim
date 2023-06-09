import std/[times, strformat]
import rcl, rosinterfaceimporters
import utils

importInterface builtin_interfaces/msg/time, Time as TimeMsg

type
  RosTime* = object
    nanoseconds*: int64

func initRosTime*(nanoseconds: int64): RosTime {.initProc.} =
  result.nanoseconds = nanoseconds

func `-`*(a, b: RosTime): Duration =
  initDuration(nanoseconds = a.nanoseconds - b.nanoseconds)

func `-`*(a: RosTime, b: Duration): RosTime =
  RosTime.init(a.nanoseconds - b.inNanoseconds)

func `-=`*(a: var RosTime, b: Duration): RosTime =
  a = a - b

func `+`*(a: RosTime, b: Duration): RosTime =
  RosTime.init(a.nanoseconds + b.inNanoseconds)

func `+=`*(a: var RosTime, b: Duration): RosTime =
  a = a + b

func `<`*(a, b: RosTime): bool =
  a.nanoseconds < b.nanoseconds

func `<=`*(a, b: RosTime): bool =
  a.nanoseconds <= b.nanoseconds

func `==`*(a, b: RosTime): bool =
  a.nanoseconds == b.nanoseconds

func fromRcl*(t: rcl_time_point_t): RosTime =
  if t.clock_type != RCL_ROS_TIME:
    raise newException(ValueError):
      fmt"invalid source clock type '{t.clock_type}' != RCL_ROS_TIME"
  RosTime.init(t.nanoseconds)

func toRcl*(t: RosTime): rcl_time_point_t =
  result.nanoseconds = t.nanoseconds
  result.clock_type = RCL_ROS_TIME

func toRmw*(d: Duration): rmw_time_t =
  rmw_time_from_nsec(d.inNanoseconds)

func fromRmw*(d: rmw_time_t): Duration =
  initDuration(nanoseconds = rmw_time_total_nsec(d))

func toMsg*(t: RosTime): TimeMsg =
  let
    sec = t.nanoseconds div 1_000_000_000
    nanosec = t.nanoseconds - sec * 1_000_000_000
  result.sec = sec.int32
  result.nanosec = nanosec.uint32
