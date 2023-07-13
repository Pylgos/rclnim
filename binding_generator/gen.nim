import std/[strutils, macros, os]
import futhark
import cpkgfinder

const rclPkg = findCPackage("rcl")

const rclIncludeDir = block:
  var res = ""
  for arg in rclPkg.compilerArgs:
    if arg.startsWith("-I") and arg.endsWith("include/rcl"):
      res = arg
      res.removePrefix("-I")
  doAssert res != ""
  res

const rclYamlParamParserIncludeDir = block:
  var res = ""
  for arg in rclPkg.compilerArgs:
    if arg.startsWith("-I") and arg.endsWith("include/rcl_yaml_param_parser"):
      res = arg
      res.removePrefix("-I")
  doAssert res != ""
  res

const rmwIncludeDir = block:
  var res = ""
  for arg in rclPkg.compilerArgs:
    if arg.endsWith("include/rmw"):
      res = arg
  doAssert res != ""
  res

const rcutilsIncludeDir = block:
  var res = ""
  for arg in rclPkg.compilerArgs:
    if arg.endsWith("include/rcutils"):
      res = arg
  doAssert res != ""
  res

macro myImportC(compilerArgs: static openArray[string], args: untyped): untyped =
  for carg in compilerArgs.join(" ").replace("-isystem ", "-I").splitWhitespace():
    args.add nnkCall.newTree(
      ident"compilerArg",
      carg.newLit
    )
  quote do:
    importc(`args`)

myImportC(rclPkg.compilerArgs):
  outputPath getProjectPath()/../"src/rclnim/distro/humble.nim"
  path rclIncludeDir
  path rclYamlParamParserIncludeDir
  path rmwIncludeDir
  path rcutilsIncludeDir
  keepCase()
  "rcl/init.h"
  "rcl/node.h"
  "rcl/publisher.h"
  "rcl/subscription.h"
  "rcl/wait.h"
  "rcl/logging.h"
  "rcl_yaml_param_parser/parser.h"
  "rmw/error_handling.h"
