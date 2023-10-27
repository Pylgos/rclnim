import ../rcl
import ../rosinterfaceimporters
import ../private/actioninternaltypes
importInterface action_msgs/msg/goal_status_array


# HACK: compiler bug workaround
type
  Request[T] = T.Request
  Response[T] = T.Response
  Feedback[T] = T.Feedback

type
  TypesupportVTable*[T] = object
    encode*: proc(msg: T): pointer {.nimcall, gcsafe, raises: [].}
    decode*: proc(encoded: pointer): T {.nimcall, gcsafe, raises: [].}
    create*: proc(): pointer {.nimcall, gcsafe, raises: [].}
    delete*: proc(encoded: pointer) {.nimcall, gcsafe, raises: [].}

type
  MessageTypesupport*[T] = object
    name*: string
    rosidlTypesupport*: ptr rosidl_message_type_support_t
    vtable*: ptr TypesupportVTable[T]

  ServiceTypesupport*[T] = object
    name*: string
    rosidlTypesupport*: ptr rosidl_service_type_support_t
    requestVTable*: ptr TypesupportVTable[Request[T]]
    responseVTable*: ptr TypesupportVTable[Response[T]]

  ActionTypesupport*[T] = object
    name*: string
    rosidlTypesupport*: ptr rosidl_action_type_support_t
    sendGoalRequestVTable*: ptr TypesupportVTable[SendGoalRequest[T]]
    sendGoalResponseVTable*: ptr TypesupportVTable[SendGoalResponse]
    getResultRequestVTable*: ptr TypesupportVTable[GetResultRequest]
    getResultResponseVTable*: ptr TypesupportVTable[GetResultResponse[T]]
    feedbackVTable*: ptr TypesupportVTable[Feedback[T]]
    goalStatusArrayVTable*: ptr TypesupportVTable[GoalStatusArray]

template genHelperMethods(typ: typedesc, vtableName: untyped, msgType: untyped, encodeName, decodeName, createName, deleteName: untyped): untyped =
  proc encodeName*[T](self: typ[T], msg: msgType): pointer =
    self.vtableName.encode(msg)

  proc decodeName*[T](self: typ[T], encoded: pointer): msgType =
    self.vtableName.decode(encoded)

  proc createName*[T](self: typ[T]): pointer =
    self.vtableName.create()

  proc deleteName*[T](self: typ[T], encoded: pointer) =
    self.vtableName.delete(encoded)

genHelperMethods(MessageTypesupport, vtable, T, encode, decode, create, delete)

genHelperMethods(ServiceTypesupport, requestVTable, T.Request, encodeRequest, decodeRequest, createRequest, deleteRequest)
genHelperMethods(ServiceTypesupport, responseVTable, T.Response, encodeResponse, decodeResponse, createResponse, deleteResponse)

genHelperMethods(ActionTypesupport, sendGoalRequestVTable, SendGoalRequest[T], encodeSendGoalRequest, decodeSendGoalRequest, createSendGoalRequest, deleteSendGoalRequest)
genHelperMethods(ActionTypesupport, sendGoalResponseVTable, SendGoalRequest[T], encodeSendGoalRequest, decodeSendGoalRequest, createSendGoalRequest, deleteSendGoalRequest)
genHelperMethods(ActionTypesupport, getResultRequestVTable, SendGoalRequest[T], encodeSendGoalRequest, decodeSendGoalRequest, createSendGoalRequest, deleteSendGoalRequest)
genHelperMethods(ActionTypesupport, getResultResponseVTable, SendGoalRequest[T], encodeSendGoalRequest, decodeSendGoalRequest, createSendGoalRequest, deleteSendGoalRequest)
genHelperMethods(ActionTypesupport, feedbackVTable, SendGoalRequest[T], encodeSendGoalRequest, decodeSendGoalRequest, createSendGoalRequest, deleteSendGoalRequest)
