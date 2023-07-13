import rclnim
import rclnim/asyncdispatchsupports
import std/asyncdispatch
importInterface builtin_interfaces/msg/time

rclnim.init()

let node = newNode("test_node")
var qos = SystemDefaultQoS
qos.reliability = Reliable
qos.depth = 100
let pub = node.createPublisher(Time, "test_topic", qos)
let sub = node.createSubscription(Time, "test_topic", qos)

proc pubMain() {.async.} =
  for i in 0..<100:
    let msg = Time(sec: i.int32, nanosec: 0'u32)
    pub.publish(msg)
    echo "published: ", msg

proc subMain() {.async.} =
  for i in 0..<100:
    let msg = await sub.recv()
    echo "received: ", msg
    doAssert msg.sec == i

proc main() {.async.} =
  await all [pubMain(), subMain()]

waitFor main()
setGlobalDispatcher(nil)
GC_fullCollect()
