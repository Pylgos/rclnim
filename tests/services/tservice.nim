discard """
  timeout: 60
"""

import rclnim
import std/[asyncdispatch, random]

randomize()

importInterface std_srvs/srv/empty

rclnim.init()

let node = newNode("my_node")
let srv = node.createService(Empty, "my_service", ServiceDefaultQoS)
let cli = node.createClient(Empty, "my_service", ServiceDefaultQoS)

const NumIteration = 1000

proc serviceTask {.async.} =
  for i in 0..<NumIteration:
    if i mod 100 == 0: echo i * 100 div NumIteration, "%"
    let (_, sender) = await srv.recv()
    sender.send(Empty.Response()())
    await sleepAsync rand(10)
  echo "service done"

proc clientTask {.async.} =
  for i in 0..<NumIteration:
    let receiver = cli.send(Empty.Request()())
    let _ = await receiver.recv()
    await sleepAsync rand(10)
  echo "client done"

proc asyncMain {.async.} =
  await all [serviceTask(), clientTask()]

try:
  waitFor asyncMain()
except ShutdownError:
  echo "shutting down"

setGlobalDispatcher(nil)
GC_fullCollect()
