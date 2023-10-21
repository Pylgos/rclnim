discard """
  targets: "c cpp"
"""

import chronos
import rclnim
import rclnim/objparamservers
import std/os

rclnim.init(@["yay", "--ros-args", "--params-file", currentSourcePath()/../"test_params.yaml"])

block:
  type
    SomeLists = object
      some_integers: seq[int64]
      some_doubles: seq[float64]

    Parameter = object
      some_int: int64
      a_string: string
      some_lists: SomeLists

  let node = newNode("param_test_objparamserver")
  let params = node.createObjParamServer(Parameter())

  echo params.value

  doAssert params.value.some_int == 42
  doAssert params.value.a_string == "Hello world"
  doAssert params.value.some_lists.some_integers == @[1'i64, 2, 3, 4]
  doAssert params.value.some_lists.some_doubles == @[3.14'f64, 2.718]
