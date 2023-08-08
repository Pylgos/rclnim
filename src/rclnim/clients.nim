import "."/[rcl, errors, handles, waitsets, nodes, qosprofiles, typesupports, utils, rosinterfaces]
import concurrent/smartptrs
import std/locks


type
  ClientBaseObj = object of RootObj
    handle: ClientHandle
    waitable: Waitable
  
  ClientBase* = SharedPtr[ClientBaseObj]

  ClientObj[T: SomeService] = object of ClientBaseObj

  Client*[T: SomeService] = SharedPtr[ClientObj[T]]

  ClientRecv*[T: SomeService] = object
    client: Client[T]
    sequenceNum: int64

disallowCopy ClientBaseObj

proc createClient*[T: SomeService](node: Node, serviceName: string, qos: QoSProfile): Client[T] =
  result = newSharedPtr(ClientObj[T])
  result[].handle = newClientHandle(node.handle, getServiceTypeSupport(T), serviceName, qos)
  result[].waitable = result[].handle.toWaitable()

proc createClient*(node: Node, T: typedesc[SomeService], serviceName: string, qos: QoSProfile): Client[T] =
  createClient[T](node, serviceName, qos)

proc handle*(self: ClientBase): ClientHandle =
  self[].handle

proc waitable*(self: ClientBase): Waitable =
  self[].waitable

proc waitable*[T](self: ClientRecv[T]): Waitable =
  self.client[].waitable

proc send*[T](self: Client[T], req: T.Request): ClientRecv[T] =
  var cReq = default(T.Request.CType)
  nimMessageToC(req, cReq)
  var num: int64 = 0
  wrapError rcl_send_request(self[].handle.getRclClient(), addr cReq, addr num)
  result.client = self
  result.sequenceNum = num

proc takeResponse*[T](self: ClientRecv[T], resp: var T.Response): bool =
  var
    cResp = default(T.Response.CType)
    info = default(rmw_service_info_t)
    ret: rcl_ret_t
  info.request_id.sequence_number = self.sequenceNum.int64
  withLock self.client[].handle.getLock():
    withLock getRclGlobalLock():
      ret = rcl_take_response_with_info(self.client[].handle.getRclClient(), addr info, addr cResp)
  doAssert info.request_id.sequence_number == self.sequenceNum
  case ret
  of RCL_RET_OK:
    cMessageToNim(cResp, resp)
    true
  of RCL_RET_CLIENT_TAKE_FAILED:
    false
  else:
    wrapError ret
    unreachable()
