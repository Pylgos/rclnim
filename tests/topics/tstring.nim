import rclnim
import std/asyncdispatch
importInterface std_msgs/msg/string

rclnim.init()

let node = newNode("test_node")
var qos = SystemDefaultQoS
qos.reliability = Reliable
qos.depth = 100
let pub = node.createPublisher(String, "test_topic", qos)
let sub = node.createSubscription(String, "test_topic", qos)

proc pubMain() {.async.} =
  for i in 0..<100:
    let msg = String.init(data = $i & "'th message!")
    pub.publish(msg)
    echo "published: ", msg
    await sleepAsync 1

proc subMain() {.async.} =
  for i in 0..<100:
    let msg = await sub.recv()
    echo "received: ", msg
    doAssert msg.data == $i & "'th message!"

proc main() {.async.} =
  await all [pubMain(), subMain()]

waitFor main()
setGlobalDispatcher(nil)
GC_fullCollect()
