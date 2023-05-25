import std/[sets, os, strutils, algorithm, tables, strformat, options]
import nint128
import ./rosidlparser

type
  Package = object
    name: string
    prefix: string

  PackageNotFoundError* = object of CatchableError
    pkgName*: string


# proc toSnakeCase(s: string): string =
#   result = s.replace(re"(.)([A-Z][a-z]+)", "$1_$2")
#   result = result.replace(re"([a-z0-9])([A-Z])", "$1_$2")
#   result = result.toLowerAscii

proc camelCaseToSnakeCase(s: string): string =
  var tmp1 = ""
  tmp1.add s[0]
  for i in 1 .. s.high-1:
    let cur = s[i]
    let next = s[i+1]
    if cur.isUpperAscii and next.isLowerAscii:
      tmp1.add '_'
    tmp1.add cur
  tmp1.add s[^1]

  var tmp2 = ""
  for i in 0 .. tmp1.high-1:
    let cur = tmp1[i]
    let next = tmp1[i+1]
    tmp2.add cur
    if (cur.isLowerAscii or cur.isDigit) and next.isUpperAscii:
      tmp2.add '_'
  tmp2.add tmp1[^1]
  
  result  = tmp2.toLowerAscii()

proc addLine(s: var string, ss: string) =
  s.add ss
  s.add '\n'

proc addLine(s: var string) =
  s.add '\n'

proc getPackages(): Table[string, Package] =
  for prefix in getEnv("AMENT_PREFIX_PATH").split(":").reversed():
    let resourcePath = prefix/"share/ament_index/resource_index/packages"
    if not resourcePath.dirExists: continue
    for p in walkDir(resourcePath):
      if p.kind notin {pcFile, pcLinkToFile}: continue
      let name = p.path.splitPath.tail
      result[name] = Package(name: name, prefix: prefix)

proc mangledModuleName(pkgName, typName: string): string =
  fmt"module_{pkgName}_{typName}"

proc mangledTypeName(pkgName, typName: string): string =
  fmt"{mangledModuleName(pkgName, typName)}.{typName}"

proc toNimType(t: Type): string =
  case t.kind
  of tkBool: "bool"
  of tkByte: "byte"
  of tkChar: "uint8"
  of tkF32: "float32"
  of tkF64: "float64"
  of tkU8: "uint8"
  of tkU16: "uint16"
  of tkU32: "uint32"
  of tkU64: "uint64"
  of tkI8: "int8"
  of tkI16: "int16"
  of tkI32: "int32"
  of tkI64: "int64"
  of tkStr: "string"
  of tkObject: mangledTypeName(t.packageName, t.typeName)
  of tkFixedArray: fmt"array[{t.length}, {t.elemType[].toNimType}]"
  of tkBoundedArray, tkUnboundedArray: fmt"seq[{t.elemType[].toNimType}]"

proc toCType(t: Type): string =
  case t.kind
  of tkBool: "bool"
  of tkByte: "byte"
  of tkChar: "uint8"
  of tkF32: "float32"
  of tkF64: "float64"
  of tkU8: "uint8"
  of tkU16: "uint16"
  of tkU32: "uint32"
  of tkU64: "uint64"
  of tkI8: "int8"
  of tkI16: "int16"
  of tkI32: "int32"
  of tkI64: "int64"
  of tkStr: fmt"module_rclnim_rosinterfaces.CMessageSequence[char]"
  of tkObject: fmt"{mangledTypeName(t.packageName, t.typeName)}.CMessageType"
  of tkFixedArray: fmt"array[{t.length}, {t.elemType[].toCType}]"
  of tkBoundedArray, tkUnboundedArray: fmt"module_rclnim_rosinterfaces.CMessageSequence[{t.elemType[].toCType}]"

proc toNimLiteral(v: Literal, t: Type): string =
  case v.kind
  of litBool:
    if v.intVal == i128(0): "false" else: "true"
  of litInt: fmt"{t.toNimType()}({$v.intVal})"
  of litFloat: fmt"{t.toNimType()}({$v.floatVal})"
  of litStr: v.strVal.escape
  of litArray:
    if t.kind in {tkBoundedArray, tkUnboundedArray}:
      result.add '@'
    result.add '['
    for v in v.arrayVal:
      result.add v.toNimLiteral(t.elemType[])
      result.add ','
    result.add ']'
    result

proc toFieldDefaultValue(f: FieldDecl): string =
  if f.default.isSome:
    f.default.get.toNimLiteral(f.typ)
  else:
    case f.typ.kind
    of tkObject: fmt"{toNimType(f.typ)}.init()"
    of tkF32: "0'f32"
    of tkF64: "0'f64"
    of tkI8: "0'i8"
    of tkI16: "0'i16"
    of tkI32: "0'i32"
    of tkI64: "0'i64"
    of tkU8: "0'u8"
    of tkU16: "0'u16"
    of tkU32: "0'u32"
    of tkU64: "0'u64"
    of tkBool: "false"
    of tkStr: "\"\""
    of tkChar: "'\0'"
    else: fmt"default({toNimType(f.typ)})"

proc genImports(idl: RosInterfaceDef, outDir, libPath: string): string =
  for dep in idl.dependencyTypes:
    let
      path = outDir/dep.pkgName/"msg"/dep.typeName.camelCaseToSnakeCase
      mangledName = mangledModuleName(dep.pkgName, dep.typeName)
    result.addLine fmt"import {path.escape()} as {mangledName}"
  result.addLine fmt"import {libPath.escape} as module_rclnim_rosinterfaces"
  result.addLine "from ../detail/typesupport import nil"

proc genDetail(outDir: string, pkg: Package) =
  createDir(outDir/pkg.name/"detail")
  let libPath = pkg.prefix/"lib/lib" & pkg.name & "__rosidl_typesupport_c.so"
  let content = "{.passL:" & libPath.escape & ".}"
  writeFile(outDir/pkg.name/"detail/typesupport.nim", content)

proc genDoc(doc: string): string =
  for line in doc.splitLines():
    result.addLine fmt"  ## {line}"
  result.removeSuffix('\n')

proc genObj(msg: RosMsgDef, moduleName, typeName: string, doExport: bool): string =
  if doExport:
    result.addLine fmt"type {typeName}* = object"
  else:
    result.addLine fmt"type {typeName} = object"
  result.addLine genDoc(msg.doc)
  for f in msg.fields:
    result.add fmt"  {f.name}*: {f.typ.toNimType}"
    if f.doc != "":
      result.addLine " ## \\"
      result.addLine genDoc(f.doc).indent(2)
    else:
      result.addLine

  result.addLine

  let qualifiedTypeName = fmt"{moduleName}.{typeName}"

  for c in msg.constants:
    result.addLine fmt"template {c.name}*(_: typedesc[{qualifiedTypeName}]): {c.typ.toNimType} ="
    result.addLine fmt"  {toNimLiteral(c.value, c.typ)}"
  
  result.addLine fmt"func init*("
  result.addLine fmt"    _: typedesc[{qualifiedTypeName}],"
  for f in msg.fields:
    result.addLine fmt"    {f.name}: {f.typ.toNimType} = {f.toFieldDefaultValue},"
  result.addLine fmt"  ): {qualifiedTypeName} ="
  result.addLine fmt"  {qualifiedTypeName}("
  for f in msg.fields:
    result.addLine fmt"    {f.name}: {f.name},"
  result.addLine "  )"

  result.addLine

  result.addLine fmt"type {typeName}_CType = object"
  for f in msg.fields:
    result.addLine fmt"  {f.name}*: {f.typ.toCType}"

  result.addLine

  result.addLine fmt"template CType*(_: typedesc[{qualifiedTypeName}]): untyped ="
  result.addLine fmt"  {moduleName}.{typeName}_CType"

  result.addLine

proc genTypeTraitTemplate(typeName: string, funcName: string, value: bool): string =
  result.addLine fmt"template {funcName}*(_: typedesc[{typeName}]): bool ="
  result.addLine fmt"  {value}"

proc genGetCTypeSupport(idl: RosInterfaceDef, typ: string): string =
  let (funcName, subDir, typeSupportType) =
    case idl.kind
    of rikMessage: ("get_message_type_support_handle", "msg", "MessageTypeSupport")
    of rikService: ("get_service_type_support_handle", "srv", "ServiceTypeSupport")
    else:
      doAssert false
      ("", "", "")
  let typeSupportPragma = "{." & &"importc: \"rosidl_typesupport_c__{funcName}__{idl.pkgName}__{subDir}__{idl.typeName}\", cdecl" & ".}"
  result.addLine fmt"proc getCTypeSupport*(_: typedesc[{typ}]): module_rclnim_rosinterfaces.{typeSupportType} {typeSupportPragma}"

proc processMsg(idl: RosInterfaceDef, outDir, libPath: string) =
  let
    moduleName = idl.typeName.camelCaseToSnakeCase
    path = outDir/idl.pkgName/"msg"/moduleName & ".nim"
    qualifiedTypeName = fmt"{moduleName}.{idl.typeName}"
  
  var s = ""
  
  s.addLine genImports(idl, outDir, libPath)
  
  s.addLine genObj(idl.message, moduleName, idl.typeName, true)
  s.addLine genGetCTypeSupport(idl, qualifiedTypeName)
  s.addLine genTypeTraitTemplate(qualifiedTypeName, "isRosMessageType", true)
  
  createDir(path.parentDir)
  writeFile(path, s)

proc processSrv(idl: RosInterfaceDef, outDir, libPath: string) =
  let
    moduleName = idl.typeName.camelCaseToSnakeCase
    path = outDir/idl.pkgName/"srv"/moduleName & ".nim"
    requestName = idl.typeName & "_Request"
    responseName = idl.typeName & "_Response"
    typeName = idl.typeName
    qualifiedTypeName = fmt"{typeName.camelCaseToSnakeCase}.{typeName}"
  
  var s = ""
  s.addLine genImports(idl, outDir, libPath)

  s.add genObj(idl.request, moduleName, requestName, false)
  s.add genObj(idl.response, moduleName, responseName, false)
  
  s.addLine fmt"type {typeName}* = object"
  s.addLine
  s.addLine fmt"template Request*(_: typedesc[{qualifiedTypeName}]): untyped ="
  s.addLine fmt"  {qualifiedTypeName}_Request"
  s.addLine
  s.addLine fmt"template Response*(_: typedesc[{qualifiedTypeName}]): untyped ="
  s.addLine fmt"  {qualifiedTypeName}_Response"
  s.addLine
  s.addLine genGetCTypeSupport(idl, qualifiedTypeName)
  s.addLine genTypeTraitTemplate(qualifiedTypeName, "isRosServiceType", true)
  createDir(path.parentDir)
  writeFile(path, s)

proc processType(idl: RosInterfaceDef, outDir, libPath: string) =
  case idl.kind
  of rikMessage:
    processMsg(idl, outDir, libPath)
  of rikService:
    processSrv(idl, outDir, libPath)
  of rikAction:
    discard

proc processPkg(p: Package, outDir, libPath: string): HashSet[string] =
  let resourcePath = p.prefix/"share/ament_index/resource_index/rosidl_interfaces"/p.name
  for relPath in resourcePath.lines:
    let
      path = p.prefix/"share"/p.name/relPath
      (_, typeName, ext) = path.splitFile
      subDir = path.parentDir.normalizedPath.splitPath.tail
    if (subDir == "msg" and ext == ".msg") or (subDir == "srv" and ext == ".srv") or (subDir == "action" and ext == ".action"):
      let idl = parseRosIdl(readFile(path), p.name, typeName)
      processType(idl, outDir, libPath)
      genDetail(outDir, p)
      result.incl idl.dependencyPkgs

proc generateInterfaceBindings*(pkgName, outDir, libPath: string) =
  let pkgs = getPackages()

  var
    pending = [pkgName].toHashSet()
    built: HashSet[string]

  while pending.len != 0:
    let p = pending.pop()
    if p notin pkgs:
      raise newException(PackageNotFoundError):
        fmt"package '{p}' not found"
    let deps = pkgs[p].processPkg(outDir, libPath)
    pending.incl deps - built
    built.incl p
