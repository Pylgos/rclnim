import "."/[rcl, errors, handles, waitsets, nodes, qosprofiles, typesupports, rosinterfaces, utils, typesupports]
import concurrent/smartptrs
import std/[locks, options]


type
  ServiceBaseObj = object of RootObj
    handle: ServiceHandle
    waitable: Waitable
  
  ServiceBase* = SharedPtr[ServiceBaseObj]

  ServiceObj[T] = object of ServiceBaseObj
    typesupport*: ServiceTypesupport[T]

  Service*[T] = SharedPtr[ServiceObj[T]]

  ServiceSend*[T] = object
    service: Service[T]
    requestId: rmw_request_id_t

proc createService*[T: SomeService](node: Node, serviceName: string, qos: QoSProfile): Service[T] =
  result = newSharedPtr(ServiceObj[T])
  result[].typesupport = getServiceTypesupport[T]()
  result[].handle = newServiceHandle(node.handle, result[].typesupport.rosidlTypesupport, serviceName, qos)
  result[].waitable = result[].handle.toWaitable()

proc createService*(node: Node, T: typedesc[SomeService], serviceName: string, qos: QoSProfile): Service[T] =
  createService[T](node, serviceName, qos)

proc handle*(self: ServiceBase | Service): ServiceHandle =
  self[].handle

proc waitable*(self: ServiceBase | Service): Waitable =
  self[].waitable

proc takeRequest*[T: SomeService](self: Service[T], req: var T.Request): Option[ServiceSend[T]] =
  var
    rosReq = self[].typesupport.createRequest()
    info = default(rmw_service_info_t)
  var ret: rcl_ret_t
  withLock self[].handle.getLock():
    withLock getRclGlobalLock():
      ret = rcl_take_request_with_info(self[].handle.getRclService(), addr info, rosReq)
  case ret
  of RCL_RET_OK:
    req = self[].typesupport.decodeRequest(rosReq)
    some ServiceSend[T](
      service: self,
      requestId: info.request_id
    )
  of RCL_RET_SERVICE_TAKE_FAILED:
    self[].typesupport.deleteRequest(rosReq)
    none ServiceSend[T]
  else:
    self[].typesupport.deleteRequest(rosReq)
    wrapError ret
    unreachable()

proc send*[T: SomeService](self: ServiceSend[T], resp: T.Response) =
  let rosResp = self.service[].typesupport.encodeResponse(resp)
  defer: self.service[].typesupport.deleteResponse(rosResp)
  wrapError rcl_send_response(self.service.handle.getRclService(), unsafeAddr self.requestId, rosResp)
