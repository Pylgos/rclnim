# rclnim

ROS2 client library for Nim language.

Note: (Alpha Stage Software) This software is under development and the API is subject to change.

## Example

```nim
import rclnim
import std/asyncdispatch
importInterface std_msgs/msg/int64

rclnim.init()

let node = newNode("test_node")
var qos = SystemDefaultQoS.withPolicies(depth=100, reliability=Reliable)
let pub = node.createPublisher(Int64, "test_topic", qos)
let sub = node.createSubscription(Int64, "test_topic", qos)

proc pubMain() {.async.} =
  for i in 0..<100:
    let msg = Int64.init(data = i)
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

## Getting Started

### Dependencies

* Nim >=1.9.3
* ROS2 Humble
* Linux (Tested on Ubuntu 22.04)

### Installing

The installation procedure is the same as for the regular Nimble package.

```bash
nimble install https://github.com/Pylgos/rclnim.git
```

### Build

1. Create your nimble package.
  ```bash
  nimble init [your-package-name]
  ```
  Select `binary` as the package type.

2. Add rclnim to the package requirement.
  ```bash
  echo 'requires "https://github.com/Pylgos/rclnim.git"' >> [your-package-name].nimble
  ```

3. Setup your ROS2 environment.
  ```bash
  source /opt/ros/humble/setup.bash
  ```

4. Edit the source code as you like.

5. Build.
  ```bash
  nimble build
  ```

## Documentation
* [API Reference](https://pylgos.github.io/rclnim/)

## Features

- [x] Topic
  - [x] Publisher
  - [x] Subscription
- [x] Service
  - [x] Service
  - [x] Client
- [ ] Action
- [ ] Parameter
- [x] Executors
  - [x] Async executor
  - [ ] Callback-based executor
- [x] Signal handling
  - [x] Linux
  - [x] MacOS (Untested)
  - [ ] Windows
- [ ] Allocator support
- [x] Typesupport
  - [x] rosidl_typesupport_c wrapper (slow because it converts  Nim objects to C structures)
  - [ ] Generate FastDDS typesupport for nim objects with macros
- [ ] Component support
- [ ] Zero-copy intra-process communications
- [x] ROS Distributions
  - [x] Humble
  - [ ] Iron
- [ ] Colcon support

## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details
