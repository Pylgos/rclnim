import std/[os, macros, compilesettings, strformat]

proc parseImportStmt(n: NimNode): tuple[pkgName, typeName, kind: string, alias: NimNode] =
  if n.kind == nnkInfix and eqIdent(n[0], "as"):
    result = parseImportStmt(n[1])
    result.alias = n[2]
  else:
    result.pkgName = $n[1][1]
    result.kind = $n[1][2]
    result.typeName = $n[2]
    result.alias = nil

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
  let (pkgName, typeName, kind, alias) = parseImportStmt(arg)

  let
    modulePath = pkgName/kind/typeName & ".nim"
    libPath = currentSourcePath/../"rosinterfaces.nim"

  if (not fileExists getBindingDir()/modulePath) or (not fileExists getAltBindingDir()/modulePath) or true:
    let res = gorgeEx(fmt"{helperExePath.quoteShell} {pkgName.quoteShell} {getBindingDir().quoteShell} {getAltBindingDir().quoteShell} {libPath.quoteShell}")
    if res.exitCode != 0:
      error(res.output, arg)

  if fileExists getBindingDir()/modulePath:
    let path = getBindingDir()/modulePath
    result = getImport(path, alias)
  elif fileExists getAltBindingDir()/modulePath:
    let path = getAltBindingDir()/modulePath
    result = getImport(path, alias)
  else:
    error("The rosidl interface for Nim has not yet been generated. IntelliSense is not available until you compile your program.", arg)

  copyLineInfo(result, arg)
