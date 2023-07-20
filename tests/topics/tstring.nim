import rclnim
import rclnim/chronossupport
import chronos
importInterface std_msgs/msg/string, String as StringMsg

rclnim.init()

let node = newNode("test_node")
var qos = SystemDefaultQoS
qos.reliability = Reliable
qos.depth = 100
let pub = node.createPublisher(StringMsg, "test_topic", qos)
let sub = node.createSubscription(StringMsg, "test_topic", qos)

proc pubMain() {.async.} =
  for i in 0..<100:
    let msg = StringMsg(data: $i & "'th message!")
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
