discard """
  targets: "c cpp"
"""

import rclnim
import std/[os, times]
importInterface builtin_interfaces/msg/time as time_msgs, Time as TimeMsg

rclnim.init()

let node = newNode("tclock")

block:
  let startTime = node.clock.now()
  sleep 1000
  let endTime = node.clock.now()
  let elapsedTime = (endTime - startTime).inMilliseconds()
  doAssert 950 < elapsedTime and elapsedTime < 1050

block:
  let t = node.clock.now()
  doAssert t.to(TimeMsg).to(RosTime) == t
