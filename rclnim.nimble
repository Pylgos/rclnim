# Package

version       = "0.1.0"
author        = "Pylgos"
description   = "Nim bindings for ROS2"
license       = "MIT"
srcDir        = "src"
installExt    = @["nim"]
namedBin      = {"rclnim/private/importinterfacehelper": "_rclnim_import_interface_helper"}.toTable

# Dependencies

requires "nim >= 1.6"
requires "https://github.com/Pylgos/nim-concurrent.git"
