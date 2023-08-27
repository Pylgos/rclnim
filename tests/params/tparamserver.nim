discard """
  targets: "c cpp"
"""

import rclnim
import std/os

rclnim.init(@["yay", "--ros-args", "--params-file", currentSourcePath()/../"test_params.yaml"])

block:
  let node = newNode("param_test_node_a")
  let params = node.createParamServer()
  params.declare("some_int", 0)
  params.declare("a_string", "")
  params.declare("some_lists.some_integers", newSeq[int64]())
  params.declare("some_lists.some_doubles", newSeq[float64]())
  params.endDeclaration()

  doAssert params.get("some_int").intVal == 42
  doAssert params.get("a_string").strVal == "Hello world"
  doAssert params.get("some_lists.some_integers").intArrayVal == @[1'i64, 2, 3, 4]
  doAssert params.get("some_lists.some_doubles").doubleArrayVal == @[3.14'f64, 2.718]
  doAssertRaises(ValueError):
    discard params.get("yay")

block:
  let node = newNode("param_test_node_b", "some_namespace")
  let params = node.createParamServer()
  params.declare("some_int", 0)
  params.endDeclaration()
  doAssert params.get("some_int").intVal == 43

block:
  let node = newNode("param_test_node_c")
  let params = node.createParamServer()
  doAssertRaises(UndeclaredParamError):
    params.endDeclaration()

block:
  let node = newNode("param_test_node_d", "another_namespace")
  let params = node.createParamServer()
  params.declare("some_int", 0)
  params.endDeclaration()
  doAssert params.get("some_int").intVal == 45

block:
  let node = newNode("param_test_node_e", "yet_another_namespace/nested")
  let params = node.createParamServer()
  params.declare("some_int", 0)
  params.endDeclaration()
  doAssert params.get("some_int").intVal == 46
