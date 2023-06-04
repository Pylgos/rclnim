# Package

version       = "0.2.0"
author        = "Pylgos"
description   = "Nim bindings for ROS2"
license       = "MIT"
srcDir        = "src"
installExt    = @["nim"]
namedBin      = {"rclnim/private/importinterfacehelper": "_rclnim_import_interface_helper"}.toTable

# Dependencies

requires "nim >= 1.9"
requires "https://github.com/Pylgos/nim-concurrent.git"

import std/[os, strformat, strutils]

task runBenchmarks, "run behchmarks":
  cd thisDir()
  writeFile(thisDir()/"benchmarks/result.txt", "")
  for file in listFiles(thisDir()/"benchmarks"):
    let (_, name, ext) = file.splitFile()
    if name.startsWith("bench_") and ext == ".nim":
      exec fmt"nimble c -r {file.quoteShell}"
  echo readFile(thisDir()/"benchmarks/result.txt")

task test, "test":
  exec "ROS_LOCALHOST_ONLY=1 testament --megatest:off all"

task generateBindings, "generate rcl binding with futhark":
  cd "binding_generator"
  exec "nimble --verbose c --compileOnly -d:futharkRebuild gen"
