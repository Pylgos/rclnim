import rclnim
import rclnim/chronossupport
import chronos
importInterface sensor_msgs/msg/[point_cloud2, point_field]
importInterface std_msgs/msg/header
importInterface builtin_interfaces/msg/time

rclnim.init()

let node = newNode("test_node")
var qos = SystemDefaultQoS
qos.reliability = Reliable
qos.depth = 100
let pub = node.createPublisher(PointCloud2, "test_topic", qos)
let sub = node.createSubscription(PointCloud2, "test_topic", qos)

proc pubMain() {.async.} =
  for i in 0..<100:
    var msg = PointCloud2(fields: @[PointField(name: "x", offset: 0, datatype: PointField.UINT8, count: 1)])
    pub.publish(msg)
    echo "published: ", msg

proc subMain() {.async.} =
  for i in 0..<100:
    let msg = await sub.recv()
    echo "received: ", msg

proc main() {.async.} =
  await all [pubMain(), subMain()]

waitFor main()
