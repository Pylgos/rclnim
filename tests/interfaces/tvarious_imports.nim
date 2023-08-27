discard """
  targets: "c cpp"
"""

import rclnim/rosinterfaceimporters


importInterface builtin_interfaces/msg/time, Time as TimeMsg
block:
  doAssert not declared(Time)
  var t: TimeMsg

importInterface builtin_interfaces/msg/duration, Duration as nil
block:
  doAssert not declared(Duration)
  var t: duration.Duration

importInterface rcl_interfaces/msg/[floating_point_range, integer_range as int_range, parameter_event], rcl_interfaces/srv/describe_parameters
block:
  var a: FloatingPointRange
  var b: IntegerRange
  var c: int_range.IntegerRange
  var d: ParameterEvent
  doAssert not declared(integer_range)
  var e: DescribeParameters

importInterface rcl_interfaces/msg/parameter_type
block:
  var a: ParameterType
