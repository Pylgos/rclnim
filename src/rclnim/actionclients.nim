import ./[rcl, handles, contexts, nodes, errors]
import concurrent/smartptrs


type
  ActionClientObj[T] = object
    handle*: ActionClientHandle


import ./rosinterfaceimporters
importInterface nav2_msgs/action/compute_path_through_poses

echo repr ComputePathThroughPoses.getCTypeSupport()
