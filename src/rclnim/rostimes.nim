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

func `-=`*(a: var RosTime, b: Duration) =
  a = a - b

func `+`*(a: RosTime, b: Duration): RosTime =
  RosTime.init(a.nanoseconds + b.inNanoseconds)

func `+=`*(a: var RosTime, b: Duration) =
  a = a + b

func `<`*(a, b: RosTime): bool =
  a.nanoseconds < b.nanoseconds

func `<=`*(a, b: RosTime): bool =
  a.nanoseconds <= b.nanoseconds

func `==`*(a, b: RosTime): bool =
  a.nanoseconds == b.nanoseconds

func to*(t: rcl_time_point_t, _: typedesc[RosTime]): RosTime =
  if t.clock_type != RCL_ROS_TIME:
    raise newException(ValueError):
      fmt"invalid source clock type '{t.clock_type}' != RCL_ROS_TIME"
  RosTime.init(t.nanoseconds)

func to*(t: RosTime, _: typedesc[rcl_time_point_t]): rcl_time_point_t =
  result.nanoseconds = t.nanoseconds
  result.clock_type = RCL_ROS_TIME

func to*(d: Duration, _: typedesc[rmw_time_t]): rmw_time_t =
  rmw_time_from_nsec(d.inNanoseconds)

func to*(d: rmw_time_t, _: typedesc[Duration]): Duration =
  initDuration(nanoseconds = rmw_time_total_nsec(d))

func to*(t: RosTime, _: typedesc[TimeMsg]): TimeMsg =
  let
    sec = t.nanoseconds div 1_000_000_000
    nanosec = t.nanoseconds - sec * 1_000_000_000
  result.sec = sec.int32
  result.nanosec = nanosec.uint32

func to*(m: TimeMsg, _: typedesc[RosTime]): RosTime =
  RosTime.init(int64(m.sec) * 1_000_000_000 + int64(m.nanosec))
