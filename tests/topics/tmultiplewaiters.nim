discard """
  timeout: 10
"""

import std/[asyncdispatch]
import rclnim
importInterface builtin_interfaces/msg/time

rclnim.init()

let
  node = newNode("t_multiple_waiters")
  qos = SystemDefaultQoS.withPolicies(reliability = Reliable)
  topic = "/t_multiple_waiters/test_topic"
  pub = node.createPublisher(Time, topic, qos)
  sub = node.createSubscription(Time, topic, qos)

proc asyncMain {.async.} =
  let fut1 = sub.recv()
  let fut2 = sub.waitable.wait()

  pub.publish(Time.init())

  echo await fut1
  await fut2

waitFor asyncMain()
setGlobalDispatcher(nil)
GC_fullCollect()
