import std/[os, macros, compilesettings, strformat, tables, sequtils]

type
  Module = object
    pkg, kind, name: string
    alias: NimNode
    typeAliases: Table[string, NimNode]

proc expect(n: NimNode, kind: set[NiMNodeKind]): NimNode =
  expectKind n, kind
  n

proc expect(n: NimNode, kind: NiMNodeKind): NimNode =
  expectKind n, kind
  n

proc toKey(n: NimNode): string =
  case n.kind
  of nnkIdent:
    $n
  of nnkNilLit:
    ":nil"
  else:
    doAssert false
    ""

proc parseModulePath(n: NimNode): tuple[pkg, kind, name: NimNode] =
  expectKind n, nnkInfix
  let
    pkgIdent = n[1][1].expect(nnkIdent)
    kindIdent = n[1][2].expect(nnkIdent)
    nameIdent = n[2].expect({nnkIdent, nnkBracket})
  if $kindIdent notin ["msg", "srv", "action"]:
    error("invalid interface type. expected: {msg, srv, action}", kindIdent)
  (pkgIdent, kindIdent, nameIdent)


proc parseImport(nodes: seq[NimNode]): seq[Module] =
  var modules = initTable[string, Module]()
  var typeAliases = initTable[string, Table[string, NimNode]]()
  var typNodeByAliasNode = initTable[string, NimNode]() # just for better diagnostics

  proc addModule(name: string, m: Module) =
    if name in modules:
      error("you have already imported another module with the same name", m.alias)
    else:
      modules[name] = m
  
  proc addTypeAlias(module, typ, alias: NimNode) =
    let
      moduleName = $module
      typName = $typ
    if moduleName != "" and moduleName notin modules:
      error(fmt"module '{$module}' not found", module)
    if moduleName in typeAliases:
      if typName notin typeAliases[moduleName]:
        typeAliases[moduleName][typName] = alias
        typNodeByAliasNode[alias.toKey] = typ
      else:
        error("multiple aliases to same type are not allowed", alias)
    else:
      typeAliases[moduleName] = initTable[string, NimNode]()
      typeAliases[moduleName][typName] = alias
      typNodeByAliasNode[alias.toKey] = typ

  for n in nodes:
    if n.kind == nnkInfix and eqIdent(n[0], "as"):
      expectKind n[1], {nnkDotExpr, nnkIdent, nnkInfix}
      if n[1].kind == nnkDotExpr:
        # my_msg.MyMsg as MyAlias
        let
          moduleIdent = n[1][0].expect(nnkIdent)
          typeIdent = n[1][1].expect(nnkIdent)
          typeAliasIdent = n[2].expect({nnkIdent, nnkNilLit})
        addTypeAlias moduleIdent, typeIdent, typeAliasIdent
      elif n[1].kind == nnkIdent:
        # MyMsg as MyAlias
        let
          typeIdent = n[1].expect(nnkIdent)
          typeAliasIdent = n[2].expect({nnkIdent, nnkNilLit})
        addTypeAlias ident(""), typeIdent, typeAliasIdent
      elif n[1].kind == nnkInfix and eqIdent(n[1][0], "/") and
           n[1][1].kind == nnkInfix and eqIdent(n[1][1][0], "/") and n[1][2].kind == nnkIdent:
        # my_package/msg/my_msg as my_alias
        let
          (pkg, kind, name) = parseModulePath(n[1])
          alias = n[2].expect(nnkIdent)
        addModule $alias, Module(pkg: $pkg, kind: $kind, name: $name, alias: alias)
      else:
        error("invalid syntax", n)
    elif n.kind == nnkInfix and eqIdent(n[0], "/") and
         n[1].kind == nnkInfix and eqIdent(n[1][0], "/"):
      expectKind n[2], {nnkIdent, nnkBracket}
      if n[2].kind == nnkIdent:
        # my_package/msg/my_msg
        let (pkg, kind, name) = parseModulePath(n)
        addModule $name, Module(pkg: $pkg, kind: $kind, name: $name, alias: name)
      elif n[2].kind == nnkBracket:
        # my_package/msg/[my_msg, another_msg, yet_another_msg as my_alias]
        let (pkg, kind, names) = parseModulePath(n)
        for name in names:
          if name.kind == nnkIdent:
            addModule $name, Module(pkg: $pkg, kind: $kind, name: $name, alias: name)
          elif name.kind == nnkInfix and eqIdent(name[0], "as"):
            let
              origName = name[1].expect(nnkIdent)
              alias = name[2].expect(nnkIdent)
            addModule $alias, Module(pkg: $pkg, kind: $kind, name: $origName, alias: alias)
    else:
      error("invalid syntax", n)
  if "" in typeAliases:
    let alias = typeAliases[""]
    if modules.len == 0:
      for a in alias.values:
        error("invalid syntax", typNodeByAliasNode[a.toKey])
    elif modules.len > 1:
      for a in alias.values:
        error("The interface name must be specified explicitly, e.g., my_msg.MyType", typNodeByAliasNode[a.toKey])
    let m = modules.values.toSeq[0]
    typeAliases[$m.alias] = alias
    typeAliases.del ""
  for (moduleName, typeAlias) in typeAliases.pairs():
    if moduleName notin modules:
      for a in typeAlias.values:
        error("invalid syntax", a)
    modules[moduleName].typeAliases = typeAlias
  modules.values.toSeq()

proc getBindingDir(): string =
  querySetting(SingleValueSetting.nimcacheDir)/"rclnim_interface_bindings"

proc getAltBindingDir(): string =
  when defined(linux):
    "/var/tmp/rclnim_interface_bindings"
  else:
    getTempDir()/"rclnim_interface_bindings"

const helperExePath =
  if fileExists currentSourcePath()/"../../_rclnim_import_interface_helper":
    currentSourcePath()/"../../_rclnim_import_interface_helper"
  elif fileExists currentSourcePath()/"../../../_rclnim_import_interface_helper":
    currentSourcePath()/"../../../_rclnim_import_interface_helper"
  else:
    "_rclnim_import_interface_helper"

proc writeImportStmt(path: string, module: Module, res: var NimNode) =
  let moduleNode = nnkInfix.newTree(ident"as", newLit path, module.alias)

  var impNode: NimNode
  if module.typeAliases.len == 0:
    impNode = nnkImportStmt.newTree(moduleNode)
  else:
    impNode = nnkImportExceptStmt.newTree(moduleNode)
    for (typ, alias) in module.typeAliases.pairs:
      impNode.add ident(typ)
  
  res.add impNode

  if module.typeAliases.len > 0:
    let typSection = nnkTypeSection.newNimNode()
    for (typ, alias) in module.typeAliases.pairs:
      let qualifiedTyp = newDotExpr(module.alias, ident typ)
      if alias.kind != nnkNilLit:
        typSection.add nnkTypeDef.newTree(alias, newEmptyNode(), qualifiedTyp)
    res.add typSection

macro importInterface*(first: untyped, rest: varargs[untyped]): untyped =
  let modules = parseImport(first & rest.toSeq)
  let pkgName = modules[0].pkg
  let libPath = currentSourcePath.parentDir()
  
  let res = gorgeEx(fmt"{helperExePath.quoteShell} {pkgName.quoteShell} {getBindingDir().quoteShell} {getAltBindingDir().quoteShell} {libPath.quoteShell}")
  if res.exitCode != 0:
    error(res.output, first)
  
  let isInterfaceGenerated = res.output != ""
  
  result = newStmtList()
  for module in modules:
    let
      path = getBindingDir()/module.pkg/module.kind/module.name & ".nim"
      altPath = getAltBindingDir()/module.pkg/module.kind/module.name & ".nim"
    if isInterfaceGenerated:
      if fileExists path:
        writeImportStmt(path, module, result)
      else:
        error(fmt"interface '{module.name}' not found", module.alias)
    else:
      if fileExists path:
        writeImportStmt(path, module, result)
      elif fileExists altPath:
        writeImportStmt(altPath, module, result)
      elif dirExists altPath.parentDir:
        error(fmt"interface '{module.name}' not found", module.alias)
      else:
        error("interface has not yet been generated. code analysis is not available until you compile your program.", module.alias)
