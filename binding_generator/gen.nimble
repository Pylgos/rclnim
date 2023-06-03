# Package

version       = "0.1.0"
author        = "Pylgos"
description   = "binding generator"
license       = "MIT"
bin           = @["gen"]

# Dependencies

requires "nim >= 1.6"
requires "https://github.com/Pylgos/nim-cpkgfinder"
requires "https://github.com/Pylgos/futhark#keep-case"
