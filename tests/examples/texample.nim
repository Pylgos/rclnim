import rclnim
import std/asyncdispatch
importInterface std_msgs/msg/int64

rclnim.init()

let node = newNode("test_node")
var qos = SystemDefaultQoS.withPolicies(depth=100, reliability=Reliable)
let pub = node.createPublisher(Int64, "test_topic", qos)
let sub = node.createSubscription(Int64, "test_topic", qos)

proc pubMain() {.async.} =
  for i in 0..<100:
    let msg = Int64.init(data = i)
    pub.publish(msg)
    echo "published: ", msg
    await sleepAsync 10

proc subMain() {.async.} =
  for i in 0..<100:
    let msg = await sub.recv()
    echo "received: ", msg

proc main() {.async.} =
  await all [pubMain(), subMain()]

try:
  waitFor main()
except ShutdownError:
  echo "Shutting down"
