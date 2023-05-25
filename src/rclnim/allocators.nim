import rcl

type
  Allocator* = object
    rclAllocator: rcl_allocator_t

proc getDefaultAllocator*(): Allocator =
  result.rclAllocator = rcl_get_default_allocator()

proc getRclAllocator*(self: Allocator): rcl_allocator_t =
  self.rclAllocator

proc getRclAllocator*(self: var Allocator): var rcl_allocator_t =
  self.rclAllocator
