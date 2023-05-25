import rclnim/[init, nodes, qosprofiles, rosinterfaceimporters, subscriptions, services, clients, asyncsupports]
import std/[asyncdispatch, random]

randomize()

importInterface builtin_interfaces/msg/time
importInterface std_srvs/srv/empty

proc main =
  initRclnim()

  let node = newNode("my_node")
  let sub = node.createSubscription(Time, "my_topic", SystemDefaultQoS)
  let srv = node.createService(Empty, "my_service", ServiceDefaultQoS)
  let cli = node.createClient(Empty, "my_service", ServiceDefaultQoS)

  proc recvTask {.async.} =
    for i in 0..<1000:
      let msg = await sub.recv()
      echo msg

  proc shutdownTask {.async.} =
    await sleepAsync 1000
    # getGlobalContext().shutdown()
  
  proc serviceTask {.async.} =
    for i in 0..<100:
      let (req, sender) = await srv.recv()
      sender.send(Empty.Response()())
      await sleepAsync rand(10)
  
  proc clientTask {.async.} =
    # await sleepAsync 1000
    for i in 0..<100:
      let receiver = cli.send(Empty.Request()())
      let resp = await receiver.recv()
      await sleepAsync rand(10)

  proc asyncMain {.async.} =
    await all [serviceTask(), clientTask()]
  
  try:
    waitFor asyncMain()
  except ShutdownError:
    discard

main()
setGlobalDispatcher(nil)
GC_fullCollect()
