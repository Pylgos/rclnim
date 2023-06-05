import rclnim
import std/[asyncdispatch, monotimes, stats, os]
importInterface std_msgs/msg/int64

import ./helper

const sampleCount = 10000

rclnim.init()

let node = newNode("test_node")
let qos = SystemDefaultQoS.withPolicies(reliability = Reliable, depth = 100)
let pub = node.createPublisher(Int64, "test_topic", qos)
let sub = node.createSubscription(Int64, "test_topic", qos)

var statistics: RunningStat

proc pubMain() {.async.} =
  for i in 0..<sampleCount:
    let now = getMonoTime()
    let msg = Int64.init(data = now.ticks)
    pub.publish(msg)
    await sleepAsync 1

proc subMain() {.async.} =
  for i in 0..<sampleCount:
    let msg = await sub.recv()
    let nowNs = getMonoTime().ticks
    let pubNs = msg.data
    statistics.push(nowNs - pubNs)

var pubThread: Thread[void]
pubThread.createThread() do():
  sleep 100
  waitFor pubMain()

waitFor subMain()

joinThread(pubThread)

showLatency("async_pubsub_multi_thread", statistics)
