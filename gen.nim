import std/[strutils, macros, os]
import futhark
import cpkgfinder


const rclPkg = findCPackage("rcl")
{.passL: rclPkg.linkerArgs.join(" ").}
{.passC: rclPkg.compilerArgs.join(" ").}


const rclIncludeDir = block:
  var res = ""
  for arg in rclPkg.compilerArgs:
    if arg.startsWith("-I") and arg.endsWith("include/rcl"):
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

proc renameCallback(name, kind, partof: string): string =
  result = name
  while result.endsWith("_"):
    result.removeSuffix("_")
  while result.startsWith("_"):
    result.removePrefix("_")
  while result.find("__") != -1:
    result = result.replace("__", "_")
  result = "!" & result

macro myImportC(compilerArgs: static openArray[string], args: untyped): untyped =
  for carg in compilerArgs.join(" ").replace("-isystem ", "-I").splitWhitespace():
    args.add nnkCall.newTree(
      ident"compilerArg",
      carg.newLit
    )
  quote do:
    importc(`args`)


myImportC(rclPkg.compilerArgs):
  outputPath getProjectPath()/"src/rclnim/distro/humble.nim"
  path rclIncludeDir
  path rmwIncludeDir
  path rcutilsIncludeDir
  renameCallback renameCallback
  "rcl/init.h"
  "rcl/node.h"
  "rcl/publisher.h"
  "rcl/subscription.h"
  "rcl/wait.h"
  "rcl/logging.h"
  "rmw/error_handling.h"
