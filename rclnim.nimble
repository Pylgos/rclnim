# Package

version       = "0.5.0"
author        = "Pylgos"
description   = "Nim bindings for ROS2"
license       = "MIT"
srcDir        = "src"
installExt    = @["nim"]
namedBin      = {"rclnim/private/importinterfacehelper": "_rclnim_import_interface_helper"}.toTable

# Dependencies

requires "nim >= 2.0"
requires "tinyre"
requires "https://github.com/Pylgos/nim-concurrent.git#head"
requires "chronos#head"

import std/[os, strformat, strutils]

task bench, "run behchmarks":
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
  exec "nimble --verbose c --compileOnly -d:futharkRebuild -d:nodeclguards gen"

task reinstall, "reinstall rclnim":
  exec "nimble -y uninstall rclnim"
  exec "nimble install"
