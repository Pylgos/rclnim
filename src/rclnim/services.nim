import "."/[rcl, errors, handles, waitsets, nodes, qosprofiles, typesupports, rosinterfaces]
import concurrent/smartptrs
import std/[locks, options]


type
  ServiceBaseObj* = object of RootObj
    handle: ServiceHandle
    waitable: Waitable
  
  ServiceBase* = SharedPtr[ServiceBaseObj]

  ServiceObj*[T] = object of ServiceBaseObj

  Service*[T] = SharedPtr[ServiceObj[T]]

  ServiceSend*[T] = object
    service: Service[T]
    requestId: rmw_request_id_t

converter `[]`*[T](self: Service[T]): var ServiceObj[T] =
  smartptrs.`[]`(self)

exportDerefConverter ServiceBase

converter toBase*[T](p: Service[T]): ServiceBase =
  smartptrs.toBase(p)


proc createService*[T: SomeService](node: Node, serviceName: string, qos: QoSProfile): Service[T] =
  result = newSharedPtr(ServiceObj[T])
  result[].handle = newServiceHandle(node.handle, getServiceTypeSupport(T), serviceName, qos)
  result[].waitable = result[].handle.toWaitable()

proc createService*(node: Node, T: typedesc[SomeService], serviceName: string, qos: QoSProfile): Service[T] =
  createService[T](node, serviceName, qos)

proc handle*(self: var ServiceBaseObj): ServiceHandle =
  self.handle

proc waitable*(self: var ServiceBaseObj): Waitable =
  self.waitable

proc takeRequest*[T: SomeService](self: Service[T], req: var T.Request): Option[ServiceSend[T]] =
  var
    cReq: T.Request.CType
    info: rmw_service_info_t
  var ret: rcl_ret_t
  withLock self[].handle.getLock():
    withLock getRclGlobalLock():
      ret = rcl_take_request_with_info(self[].handle.getRclService(), addr info, addr cReq)
  case ret
  of RCL_RET_OK:
    cMessageToNim(cReq, req)
    result = some ServiceSend[T](
      service: self,
      requestId: info.request_id
    )
  of RCL_RET_SERVICE_TAKE_FAILED:
    result = none ServiceSend[T]
  else:
    wrapError ret

proc send*[T: SomeService](self: ServiceSend[T], resp: T.Response) =
  var cResp: T.Response.CType
  nimMessageToC(resp, cResp)
  wrapError rcl_send_response(self.service[].handle.getRclService(), unsafeAddr self.requestId, addr cResp)
