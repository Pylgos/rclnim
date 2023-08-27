discard """
  targets: "c cpp"
"""

import rclnim
import std/[os, times]

rclnim.init()

let node = newNode("tclock")

let startTime = node.clock.now()
sleep 1000
let endTime = node.clock.now()
let elapsedTime = (endTime - startTime).inMilliseconds()
doAssert 950 < elapsedTime and elapsedTime < 1050
