discard """
  timeout: 10
  exitcode: 1
"""

import rclnim
import rclnim/chronossupport
import chronos
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

  pub.publish(Time())

  echo await fut1
  await fut2

waitFor asyncMain()
