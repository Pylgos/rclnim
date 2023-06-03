import std/[strutils, locks]
import rospkgfinder

static:
  configureRosPackage("rcl")
  configureRosPackage("rmw")
  configureRosPackage("rcutils")

const rmwHasBestAvailableQoS* = false

import distro/humble

proc rcl_get_default_allocator*: rcl_allocator_t {.inline.} =
  rcutils_get_default_allocator()

proc rcl_reallocf*(p: pointer, size: csize_t, allocator: ptr rcl_allocator_t): pointer {.inline.} =
  rcutils_reallocf(p, size, allocator)

var gRclLock: Lock
initLock(gRclLock)

proc getRclGlobalLock*(): var Lock =
  gRclLock

export humble
