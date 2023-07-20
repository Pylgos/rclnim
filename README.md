# rclnim

ROS2 client library for Nim language.
> **Note** (Alpha Stage Software) This software is under development and the API is subject to change.

## Example

```nim
import rclnim
import rclnim/chronossupport
import chronos
importInterface std_msgs/msg/int64

rclnim.init()

let node = newNode("test_node")
var qos = SystemDefaultQoS.withPolicies(depth=100, reliability=Reliable)
let pub = node.createPublisher(Int64, "test_topic", qos)
let sub = node.createSubscription(Int64, "test_topic", qos)

proc pubMain() {.async.} =
  for i in 0..<100:
    let msg = Int64(data: i)
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
```

## Dependencies

* Nim >=1.9.5
* ROS2 Humble
* Linux (Tested on Ubuntu 22.04)
## Documentation
* [API Reference](https://pylgos.github.io/rclnim/)

## Features

- Topic
  - Publisher
  - Subscription
- Service
  - Service
  - Client
- Executors
  - Async executor
- Signal handling
  - Linux
- Typesupport
  - rosidl_typesupport_c wrapper (slow because it converts Nim objects to C structures)
- ROS Distributions
  - Humble

## TODO
- Support Action
- Implement Parameter client
- Implement Callback-based executor
- Generate FastDDS typesupport for nim objects with macros
- Support component
- Support allocator
- Implement zero-copy intra-process communications
- Support ROS2 Iron
- Support colcon

## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details
