import std/[options, strutils, sequtils, sets]
import npeg, nint128

# https://design.ros2.org/articles/legacy_interface_definition.html


type
  RosInterfaceKind* = enum
    rikMessage = "msg"
    rikService = "srv"
    rikAction = "action"

  RosMsgDef* = object
    doc*: string
    constants*: seq[ConstDef]
    fields*: seq[FieldDecl]
    dependencyPkgs*: HashSet[string]
    dependencyTypes*: HashSet[tuple[pkgName, typeName: string]]

  RosInterfaceDef* = object
    pkgName*, typeName*: string
    dependencyPkgs*: HashSet[string]
    dependencyTypes*: HashSet[tuple[pkgName, typeName: string]]
    case kind*: RosInterfaceKind
    of rikMessage:
      message*: RosMsgDef
    of rikService:
      request*, response*: RosMsgDef
    of rikAction:
      goal*, result*, feedback*: RosMsgDef

  LineKind* = enum
    lkBlank
    lkComment
    lkField
    lkConst
    lkSep

  Line* = object
    case kind*: LineKind
    of lkField:
      fieldDecl*: FieldDecl
    of lkConst:
      constDef*: ConstDef
    of lkSep, lkComment, lkBlank: discard
    comment*: string
  
  FieldDecl* = object
    typ*: Type
    name*: string
    default*: Option[Literal]
    doc*: string
  
  ConstDef* = object
    typ*: Type
    name*: string
    value*: Literal
    doc*: string
  
  TypeKind* = enum
    # Builtin types
    tkBool
    tkByte
    tkChar
    tkF32, tkF64
    tkI8, tkI16, tkI32, tkI64
    tkU8, tkU16, tkU32, tkU64
    tkStr

    # User-defined types
    tkObject

    tkFixedArray
    tkBoundedArray
    tkUnboundedArray

  Type* = object
    case kind*: TypeKind
    of tkBool..tkU64: discard
    of tkStr:
      strBound*: Option[Int128]
    of tkObject:
      packageName*, typeName*: string
    of tkFixedArray, tkBoundedArray, tkUnboundedArray:
      length*: Int128
      elemType*: ref Type

  LiteralKind* = enum
    litBool, litInt, litFloat, litStr, litArray

  Literal* = object
    case kind*: LiteralKind
    of litBool, litInt:
      intVal*: Int128
    of litFloat:
      floatVal*: float64
    of litStr:
      strVal*: string
    of litArray:
      arrayVal*: seq[Literal]
  
  ParseError* = object of ValueError


template raiseParseError(msg=""): untyped =
  raise newException(ParseError, msg)


proc parseTypeName(s: string): TypeKind =
  case s
  of "bool": tkBool
  of "byte": tkByte
  of "char": tkChar
  of "float32": tkF32
  of "float64": tkF64
  of "int8": tkI8
  of "int16": tkI16
  of "int32": tkI32
  of "int64": tkI64
  of "uint8": tkU8
  of "uint16": tkU16
  of "uint32": tkU32
  of "uint64": tkU64
  of "string": tkStr
  else: tkObject


proc parseLine(s: string): Line =
  var
    kind = lkComment
    name = "" # field name or const name
    isArrayLit = false # is default value of field or const value is literal?
    isBoundedStr = false # is field type is bounded string?
    strBound = i128(-1) # bounded string upper boundary
    arrayLen = i128(-1)
    isBoundedArray = false
    isFixedArray = false
    isUnboundedArray = false
    values: seq[Literal]
    hasValue = false
    hasType = false # true when kind is lkField or lkConst
    packageName = "" # ex. geometry_msgs
    typeName = "" # ex. Vector3
    comment = ""
  
  let parser = peg("line"):
    line <- (constDef | fieldDecl | commentLine | sep | blank) * eof

    eof <- !1
    
    blank <- s:
      kind = lkBlank
    
    sep <- "---":
      kind = lkSep
    
    commentLine <- s * comment:
      kind = lkComment
    
    constDef <- typ * s * >ident * s * '=' * s * literal * s * ?comment:
      kind = lkConst
      name = $1

    fieldDecl <- typ * s * >ident * s * ?defaultValue * s * ?comment:
      kind = lkField
      name = $1
    
    comment <- '#' * >(*1):
      comment = $1
    
    defaultValue <- literal:
      hasValue = true
    
    typ <- >ident * ?('/' * >ident) * ?boundedStrSpec * ?arraySpec:
      hasType = true
      if capture.len == 2:
        typeName = $1
      elif capture.len == 3:
        packageName = $1
        typeName = $2
      else:
        doAssert false
    
    boundedStrSpec <- "<=" * >intLitAux:
      isBoundedStr = true
      strBound = parseInt128($1)
    
    arraySpec <- '[' * ?(?boundedArrayMarker * arrayLen) * ']':
      if not isBoundedArray:
        if arrayLen != i128(-1):
          isFixedArray = true
        else:
          isUnboundedArray = true
    
    boundedArrayMarker <- "<=":
      isBoundedArray = true
    
    ident <- Alpha * *(Alnum | {'_'})
    
    literal <- arrayLit | nonArrayLit:
      hasValue = true
    
    list(item, sep) <- item * *( sep * item )
    
    commaList(item) <- list(item, s * ',' * s)
    
    arrayLit <- '[' * s * commaList(nonArrayLit) * s * ']':
      isArrayLit = true
    
    nonArrayLit <- floatLit | intLit | strLit | boolLit
    
    intLitAux <- ?('+' | '-') * {'1'..'9'} * *Digit | '0'
    
    intLit <- intLitAux:
      values.add Literal(kind: litInt, intVal: parseInt128($0))
    
    boolLit <- "true" | "false":
      let val = if $0 == "true": i128(1) else: i128(0)
      values.add Literal(kind: litBool, intVal: val)
    
    floatLit <- ?(intLitAux | '+' | '-') * '.' * *Digit * ?(('e' | 'E') * ?('+' | '-') * intLitAux):
      values.add Literal(kind: litFloat, floatVal: parseFloat($0))
    
    strLitWithCustomQuote(quote) <- quote * *(!quote * ("\\\\" | '\\' * quote | 1)) * quote
    
    strLit <- strLitWithCustomQuote('\'') | strLitWithCustomQuote('"'):
      let q = $($0)[0]
      values.add Literal(kind: litStr, strVal: unescape($0, prefix=q, suffix=q))

    arrayLen <- intLitAux:
      arrayLen = parseInt128($0)
    
    s <- *Space
  
  let res = parser.match(s)
  if not res.ok:
    raiseParseError(s)

  var value: Literal
  if hasValue:
    if isArrayLit:
      value = Literal(kind: litArray)
      value.arrayVal.add values
    else:
      value = values[0]
  
  var typ: Type
  if hasType:
    var kind: TypeKind
    if packageName != "":
      kind = tkObject
    else:
      kind = parseTypeName(typeName)
    
    if kind == tkObject:
      typ = Type(kind: tkObject, packageName: packageName, typeName: typeName)
    else:
      typ = Type(kind: kind)

    if typ.kind == tkStr and isBoundedStr:
      typ.strBound = some strBound
    elif isBoundedStr:
      raiseParseError("illegal length boundary")
    
    if isUnboundedArray:
      let elemType = new Type
      elemType[] = typ
      typ = Type(
        kind: tkUnboundedArray,
        length: arrayLen,
        elemType: elemType
      )
    if isBoundedArray:
      let elemType = new Type
      elemType[] = typ
      typ = Type(
        kind: tkBoundedArray,
        length: arrayLen,
        elemType: elemType
      )
    if isFixedArray:
      let elemType = new Type
      elemType[] = typ
      typ = Type(
        kind: tkFixedArray,
        length: arrayLen,
        elemType: elemType
      )

  case kind
  of lkField:
    let defVal =
      if hasValue:
        some value
      else:
        none(Literal)
    result = Line(
      kind: lkField,
      fieldDecl: FieldDecl(
        typ: typ, name: name, default: defVal
      )
    )
  of lkConst:
    result = Line(
      kind: lkConst,
      constDef: ConstDef(
        typ: typ, name: name, value: value
      )
    )
  of lkBlank:
    result = Line(kind: lkBlank)
  of lkComment:
    result = Line(kind: lkComment)
  of lkSep:
    result = Line(kind: lkSep)

  result.comment = comment


proc parseMsgDef(lines: seq[Line], pkgName: string): RosMsgDef =
  var
    isMsgDoc = true
    doc = ""
  
  for line in lines:
    case line.kind
    of lkComment:
      if doc != "": doc.add '\n'
      doc.add line.comment
    of lkBlank:
      if isMsgDoc:
        result.doc = doc.dedent
        isMsgDoc = false
      doc = ""
    of lkField:
      isMsgDoc = false
      var f = line.fieldDecl
      if doc != "" and line.comment != "":
        doc.add '\n'
        doc.add line.comment
      f.doc = dedent(doc)
      if f.typ.kind == tkObject:
        if f.typ.packageName == "":
          f.typ.packageName = pkgName
          result.dependencyTypes.incl (f.typ.packageName, f.typ.typeName)
        else:
          result.dependencyPkgs.incl f.typ.packageName
          result.dependencyTypes.incl (f.typ.packageName, f.typ.typeName)
      elif f.typ.kind in {tkUnboundedArray, tkBoundedArray, tkFixedArray} and f.typ.elemType.kind == tkObject:
        if f.typ.elemType.packageName == "":
          f.typ.elemType.packageName = pkgName
          result.dependencyTypes.incl (pkgName, f.typ.elemType.typeName)
        else:
          result.dependencyPkgs.incl f.typ.elemType.packageName
          result.dependencyTypes.incl (f.typ.elemType.packageName, f.typ.elemType.typeName)
      result.fields.add f
      doc = ""
    of lkConst:
      isMsgDoc = false
      var c = line.constDef
      if doc != "" and line.comment != "":
        doc.add '\n'
        doc.add line.comment
      c.doc = dedent(doc)
      result.constants.add c
      doc = ""
    of lkSep:
      doAssert false 


proc parseRosIdl*(content, pkgName, typeName: string): RosInterfaceDef =
  var lines = content.splitLines.map(parseLine)
  var separated: seq[seq[Line]] = block:
    var res: seq[seq[Line]]
    var acc: seq[Line]
    for line in lines:
      if line.kind == lkSep:
        res.add acc
        acc.setLen(0)
      else:
        acc.add line
    res.add acc
    res
  case separated.len
  of 1:
    result = RosInterfaceDef(
      kind: rikMessage,
      pkgName: pkgName,
      typeName: typeName,
      message: parseMsgDef(separated[0], pkgName)
    )
    result.dependencyPkgs = result.message.dependencyPkgs
    result.dependencyTypes = result.message.dependencyTypes
  of 2:
    result = RosInterfaceDef(
      kind: rikService,
      pkgName: pkgName,
      typeName: typeName,
      request: parseMsgDef(separated[0], pkgName),
      response: parseMsgDef(separated[1], pkgName)
    )
    result.dependencyPkgs = result.request.dependencyPkgs + result.response.dependencyPkgs
    result.dependencyTypes = result.request.dependencyTypes + result.response.dependencyTypes
  of 3:
    result = RosInterfaceDef(
      kind: rikAction,
      pkgName: pkgName,
      typeName: typeName,
      goal: parseMsgDef(separated[0], pkgName),
      result: parseMsgDef(separated[1], pkgName),
      feedback: parseMsgDef(separated[2], pkgName),
    )
    result.dependencyPkgs = result.goal.dependencyPkgs + result.feedback.dependencyPkgs + result.result.dependencyPkgs
    result.dependencyTypes = result.goal.dependencyTypes + result.feedback.dependencyTypes + result.result.dependencyTypes
  else:
    doAssert false

when isMainModule:
  let ret = parseLine("""SomeCustomMsg[] some_array""")
  echo ret
  echo ret.fieldDecl.typ.elemType[]
