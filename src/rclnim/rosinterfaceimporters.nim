import std/[os, macros, compilesettings, strformat]

proc parseImportStmt(n: NimNode): tuple[pkgName, kind: string, typeNames: seq[string], alias: NimNode] =
  if n.kind == nnkInfix and eqIdent(n[0], "as"):
    result = parseImportStmt(n[1])
    result.alias = n[2]
  else:
    result.pkgName = $n[1][1]
    result.kind = $n[1][2]
    case n[2].kind:
    of nnkBracket:
      for typeNameNode in n[2]:
        if typeNameNode.kind == nnkIdent:
          result.typeNames.add $typeNameNode
        else:
          error("invalid syntax", typeNameNode)
    of nnkIdent:
      result.typeNames = @[$n[2]]
    else:
      error("invalid syntax", n[2])
    result.alias = nil
  
  if result.typeNames.len != 1 and result.alias != nil:
    error("alias names are not allowed when importing multiple interfaces at the same time", result.alias)

proc getBindingDir(): string =
  querySetting(SingleValueSetting.nimcacheDir)/"ros2_interface_bindings"

proc getAltBindingDir(): string =
  getTempDir()/"ros2_interface_bindings"

proc getImport(path: string, alias: NimNode): NimNode =
  if alias == nil:
    nnkImportStmt.newTree(path.newLit)
  else:
    nnkImportStmt.newTree(
      nnkInfix.newTree(
        ident"as",
        newLit path,
        alias
      )
    )

const helperExePath =
  if fileExists currentSourcePath()/"../../_rclnim_import_interface_helper":
    currentSourcePath()/"../../_rclnim_import_interface_helper"
  else:
    "_rclnim_import_interface_helper"

macro importInterface*(arg: untyped): untyped =
  let (pkgName, kind, typeNames, alias) = parseImportStmt(arg)

  let libPath = currentSourcePath/../"rosinterfaces.nim"

  let res = gorgeEx(fmt"{helperExePath.quoteShell} {pkgName.quoteShell} {getBindingDir().quoteShell} {getAltBindingDir().quoteShell} {libPath.quoteShell}")
  if res.exitCode != 0:
    error(res.output, arg)
  
  let interfaceGenerated = res.output != ""

  result = nnkStmtList.newNimNode()

  for typeName in typeNames:
    let modulePath = pkgName/kind/typeName & ".nim"
    if fileExists getBindingDir()/modulePath:
      let path = getBindingDir()/modulePath
      result.add getImport(path, alias)
    else:
      if interfaceGenerated:
        error(fmt"interface '{modulePath}' not found", arg)
      elif fileExists getAltBindingDir()/modulePath:
        let path = getAltBindingDir()/modulePath
        result.add getImport(path, alias)
      else:
        error("The rosidl interface for Nim has not yet been generated. IntelliSense is not available until you compile your program.", arg)

    copyLineInfo(result, arg)
