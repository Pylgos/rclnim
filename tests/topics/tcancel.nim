discard """
  targets: "c cpp"
"""

import rclnim
import rclnim/chronossupport
import chronos
importInterface builtin_interfaces/msg/time

rclnim.init()

let node = newNode("test_node")
let qos = SystemDefaultQoS.withPolicies(reliability = Reliable, depth = 100)
let pub = node.createPublisher(Time, "test_topic", qos)
let sub = node.createSubscription(Time, "test_topic", qos)

proc pubMain() {.async.} =
  for i in 0..<1000:
    let msg = Time(sec: i.int32, nanosec: 0'u32)
    pub.publish(msg)
    echo "published: ", msg
    await sleepAsync 10.milliseconds

proc withTimeoutCancel[T](fut: Future[T], timeout: Duration): Future[bool] {.async.} =
  if await withTimeout(fut, timeout):
    return true
  else:
    await fut.cancelAndWait()
    return fut.completed()

proc subMain() {.async.} =
  var i = 0
  while true:
    let msgFut = sub.recv()
    if await withTimeoutCancel(msgFut, 2.milliseconds):
      let msg = msgFut.read()
      echo "received: ", msg
      doAssert msg.sec == i
      if msg.sec == 999:
        return
      inc i
    else:
      echo "timeout"

proc main() {.async.} =
  await allFutures [pubMain(), subMain()]

waitFor main()
