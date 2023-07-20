discard """
  matrix: "-d:asyncBackend=asyncdispatch; -d:asyncBackend=chronos"
"""

import rclnim
import rclnim/defaultasync
importInterface std_msgs/msg/int64_multi_array

rclnim.init()

let node = newNode("test_node")
var qos = SystemDefaultQoS
qos.reliability = Reliable
qos.depth = 100
let pub = node.createPublisher(Int64MultiArray, "test_topic", qos)
let sub = node.createSubscription(Int64MultiArray, "test_topic", qos)

proc pubMain() {.async.} =
  for i in 0..<100:
    let msg = Int64MultiArray(data: @[i.int64, i+1, i+2, i+3])
    pub.publish(msg)
    echo "published: ", msg
    await sleepAsync 1

proc subMain() {.async.} =
  for i in 0..<100:
    let msg = await sub.recv()
    echo "received: ", msg
    doAssert msg.data == @[i.int64, i+1, i+2, i+3]

proc main() {.async.} =
  await all [pubMain(), subMain()]

waitFor main()
