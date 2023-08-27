discard """
  targets: "c cpp"
"""

import rclnim
import rclnim/chronossupport
import chronos
importInterface builtin_interfaces/msg/time

rclnim.init()

let node = newNode("test_node")
var qos = SystemDefaultQoS
qos.reliability = Reliable
qos.depth = 100
let pub = node.createPublisher(Time, "test_topic", qos)
let sub1 = node.createSubscription(Time, "test_topic", qos)
let sub2 = node.createSubscription(Time, "test_topic", qos)

proc pubMain() {.async.} =
  for i in 0..<100:
    let msg = Time(sec: i.int32, nanosec: 0'u32)
    pub.publish(msg)
    echo "published: ", msg

proc sub1Main() {.async.} =
  for i in 0..<100:
    let msg = await sub1.recv()
    echo "received: ", msg
    doAssert msg.sec == i

proc sub2Main() {.async.} =
  for i in 0..<100:
    let msg = await sub2.recv()
    echo "received: ", msg
    doAssert msg.sec == i

proc hi() {.async.} =
  while true:
    echo "hi"
    await sleepAsync 1000

proc main() {.async.} =
  asyncCheck hi()
  await all [pubMain(), sub1Main(), sub2Main()]

waitFor main()
