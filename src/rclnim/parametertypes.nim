import ./rosinterfaceimporters
import std/[strformat, strutils]

importInterface rcl_interfaces/msg/[
  parameter_value,
  parameter_type,
  parameter_descriptor,
  integer_range,
  floating_point_range]

type
  ParamValueKind* = enum
    Bool
    Int
    Double
    Str
    ByteArray
    BoolArray
    IntArray
    DoubleArray
    StringArray

  ParamValue* = object
    case kind*: ParamValueKind
    of Bool:
      boolVal*: bool
    of Int:
      intVal*: int
    of Double:
      doubleVal*: float64
    of Str:
      strVal*: string
    of ByteArray:
      byteArrayVal*: seq[byte]
    of BoolArray:
      boolArrayVal*: seq[bool]
    of IntArray:
      intArrayVal*: seq[int64]
    of DoubleArray:
      doubleArrayVal*: seq[float64]
    of StringArray:
      strArrayVal*: seq[string]
  
  RangeConstraintKind* = enum
    NoConstraint
    FloatRangeConstraint
    IntRangeConstraint
  
  RangeConstraint* = object
    case kind*: RangeConstraintKind
    of FloatRangeConstraint:
      fromFloat*, toFloat*, stepFloat*: float64
    of IntRangeConstraint:
      fromInt*, toInt*, stepInt*: int64
    of NoConstraint:
      discard

  ParamDescriptor* = object
    name*: string
    kind*: ParamValueKind
    description*: string
    additionalConstraints*: string
    readOnly*: bool
    dynamicTyping*: bool
    rangeConstraint*: RangeConstraint
  
  ParamInfo* = object
    value*: ParamValue
    desc*: ParamDescriptor
  
  ParamEventKind* = enum
    Added
    Removed
    Changed
  
  ParamEvent* = object
    kind*: ParamEventKind
    name*: string
    param*: ParamValue

func to*(p: sink ParamValue, _: typedesc[ParameterValue]): ParameterValue =
  case p.kind
  of Bool:
    result.type = ParameterType.PARAMETER_BOOL
    result.boolValue = p.boolVal
  of Int:
    result.type = ParameterType.PARAMETER_INTEGER
    result.integerValue = p.intVal
  of Double:
    result.type = ParameterType.PARAMETER_DOUBLE
    result.doubleValue = p.doubleVal
  of Str:
    result.type = ParameterType.PARAMETER_STRING
    result.stringValue = p.strVal
  of ByteArray:
    result.type = ParameterType.PARAMETER_BYTE_ARRAY
    result.byteArrayValue = p.byteArrayVal
  of BoolArray:
    result.type = ParameterType.PARAMETER_BOOL_ARRAY
    result.boolArrayValue = p.boolArrayVal
  of IntArray:
    result.type = ParameterType.PARAMETER_INTEGER_ARRAY
    result.integerArrayValue = p.intArrayVal
  of DoubleArray:
    result.type = ParameterType.PARAMETER_DOUBLE_ARRAY
    result.doubleArrayValue = p.doubleArrayVal
  of StringArray:
    result.type = ParameterType.PARAMETER_STRING_ARRAY
    result.stringArrayValue = p.strArrayVal

func to*(v: bool, _: typedesc[ParamValue]): ParamValue = ParamValue(kind: Bool, boolVal: v)
func to*(v: int64, _: typedesc[ParamValue]): ParamValue = ParamValue(kind: Int, intVal: v)
func to*(v: float64, _: typedesc[ParamValue]): ParamValue = ParamValue(kind: Double, doubleVal: v)
func to*(v: sink string, _: typedesc[ParamValue]): ParamValue = ParamValue(kind: Str, strVal: v)
func to*(v: sink seq[byte], _: typedesc[ParamValue]): ParamValue = ParamValue(kind: ByteArray, byteArrayVal: v)
func to*(v: sink seq[bool], _: typedesc[ParamValue]): ParamValue = ParamValue(kind: BoolArray, boolArrayVal: v)
func to*(v: sink seq[int64], _: typedesc[ParamValue]): ParamValue = ParamValue(kind: IntArray, intArrayVal: v)
func to*(v: sink seq[float64], _: typedesc[ParamValue]): ParamValue = ParamValue(kind: DoubleArray, doubleArrayVal: v)
func to*(v: sink seq[string], _: typedesc[ParamValue]): ParamValue = ParamValue(kind: StringArray, strArrayVal: v)

func to*(msg: ParameterValue, _: typedesc[ParamValue]): ParamValue =
  case msg.type
  of ParameterType.PARAMETER_BOOL: msg.boolValue.to(ParamValue)
  of ParameterType.PARAMETER_INTEGER: msg.integerValue.to(ParamValue)
  of ParameterType.PARAMETER_DOUBLE: msg.doubleValue.to(ParamValue)
  of ParameterType.PARAMETER_STRING: msg.stringValue.to(ParamValue)
  of ParameterType.PARAMETER_BYTE_ARRAY: msg.byteArrayValue.to(ParamValue)
  of ParameterType.PARAMETER_BOOL_ARRAY: msg.boolArrayValue.to(ParamValue)
  of ParameterType.PARAMETER_INTEGER_ARRAY: msg.integerArrayValue.to(ParamValue)
  of ParameterType.PARAMETER_DOUBLE_ARRAY: msg.doubleArrayValue.to(ParamValue)
  of ParameterType.PARAMETER_STRING_ARRAY: msg.stringArrayValue.to(ParamValue)
  of ParameterType.PARAMETER_NOT_SET:
    raise newException(ValueError):
      "parameter type not set"
  else:
    raise newException(ValueError):
      fmt"invalid parameter type '{msg.type}'"

func to*(desc: ParamDescriptor, _: typedesc[ParameterDescriptor]): ParameterDescriptor =
  result.name = desc.name
  result.type = ParamValue(kind: desc.kind).to(ParameterValue).type
  result.description = desc.description
  result.additionalConstraints = desc.additionalConstraints
  result.readOnly = desc.readOnly
  result.dynamicTyping = desc.dynamicTyping
  case desc.rangeConstraint.kind
  of IntRangeConstraint:
    result.integerRange.add IntegerRange(fromValue: desc.rangeConstraint.fromInt, toValue: desc.rangeConstraint.toInt)
  of FloatRangeConstraint:
    result.floatingPointRange.add FloatingPointRange(fromValue: desc.rangeConstraint.fromFloat, toValue: desc.rangeConstraint.toFloat)
  of NoConstraint:
    discard

template defaultStep(T: typedesc[range]): untyped =
  when T.low is SomeFloat:
    0'f64
  elif T.low is SomeInteger:
    0'i64

proc toRangeConstraint*(T: typedesc[range], step = defaultStep(T)): RangeConstraint =
  when T.low is SomeFloat:
    RangeConstraint(kind: FloatRangeConstraint, fromFloat: T.low, toFloat: T.high, stepFloat: step)
  elif T.low is SomeInteger:
    RangeConstraint(kind: IntRangeConstraint, fromInt: T.low, toInt: T.high, stepInt: step)
  else:
    doAssert false

proc toRangeConstraint*(T: not typedesc[range]): RangeConstraint =
  RangeConstraint(kind: NoConstraint)
