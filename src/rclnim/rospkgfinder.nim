import std/[
  tables, os, strutils, strformat, macros, compilesettings,
  sets, options, genasts, sequtils, xmlparser, xmltree]

type
  RosPackage* = object
    name*: string
    prefix*: string
  
  RosPackageTable* = Table[string, RosPackage]


proc collectAllRosPackages(): RosPackageTable =
  result = initTable[string, RosPackage]()
  let prefixes = getEnv("AMENT_PREFIX_PATH").split(':')
  for prefix in prefixes:
    let resourceDir = prefix/"share/ament_index/resource_index/packages"
    if dirExists(resourceDir):
      for pc in resourceDir.walkDir():
        let packageName = pc.path.splitFile().name
        result[packageName] = RosPackage(name: packageName, prefix: prefix)

const rosPackages = collectAllRosPackages()

proc findRosPackage*(name: string): RosPackage =
  result = default(RosPackage)
  if name in rosPackages:
    result = rosPackages[name]
  else:
    let prefixPath = getEnv("AMENT_PREFIX_PATH")
    let msg =
      if not existsEnv("AMENT_PREFIX_PATH"):
        fmt"""
        ros2 package '{name}' not found.
        It appears that the ros2 environment has not been set up.
        Please set up the ros2 environment before compiling.
        see: https://docs.ros.org/en/humble/Tutorials/Beginner-CLI-Tools/Configuring-ROS2-Environment.html#source-the-setup-files
        """.dedent
      else:
        fmt"""
        ros2 package '{name}' not found.
        AMENT_PREFIX_PATH: {prefixPath}
        """.dedent
    error(msg)

proc findRosPackageOpt*(name: string): Option[RosPackage] =
  if name in rosPackages:
    some rosPackages[name]
  else:
    none RosPackage

proc getDeps*(p: RosPackage): HashSet[RosPackage] =
  result = initHashSet[RosPackage]()
  let xmlPath = p.prefix/"share"/p.name/"package.xml"
  if fileExists(xmlPath):
    let x = parseXml(readFile(xmlPath))
    for c in x.items:
      if c.kind != xnElement: continue
      case c.tag
      of "depend", "build_depend", "build_export_depend":
        let depPkg = c.innerText.findRosPackageOpt()
        if depPkg.isSome:
          result.incl depPkg.get
  else:
    result = initHashSet[RosPackage]()

proc getRecursiveDepsAux(p: RosPackage, res: var HashSet[RosPackage]) =
  let deps = getDeps(p)
  for dep in deps - res:
    getRecursiveDepsAux(dep, res)
  res.incl deps

proc getRecursiveDeps*(p: RosPackage): seq[RosPackage] =
  var deps = initHashSet[RosPackage]()
  getRecursiveDepsAux(p, deps)
  deps.toSeq()

proc includeDir*(p: RosPackage): string =
  p.prefix/"include"/p.name

proc libDir*(p: RosPackage): string =
  p.prefix/"lib"

proc newPragma(pragma, arg: string): NimNode =
  nnkPragma.newTree(
    nnkExprColonExpr.newTree(
      ident(pragma),
      newLit(arg)
    )
  )

macro configure*(p: static RosPackage, libName: static string = ""): untyped =
  result = newStmtList()
  if dirExists(p.includeDir):
    let cFlag = "-I" & p.includeDir
    if not SingleValueSetting.compileOptions.querySetting.contains(cFlag):
      result.add newPragma("passC", cFlag)

  if dirExists(p.libDir):
    let libDirFlag = "-L" & p.libDir
    if not SingleValueSetting.linkOptions.querySetting.contains(libDirFlag):
      result.add newPragma("passL", libDirFlag)
  
  let libName = if libName == "": p.name else: libName
  if fileExists(p.libDir/"lib" & libName & ".so"):
    let linkFlag = "-l" & libName
    result.add newPragma("passL", linkFlag)

macro configureRecursive*(p: static RosPackage): untyped =
  result = newStmtList()
  result.add genAst(p) do:
    p.configure()
  let deps = p.getRecursiveDeps()
  for dep in deps.items:
    result.add genAst(dep) do:
      dep.configure()

macro configureRosPackage*(name: static string): untyped =
  let pkg = findRosPackage(name)
  genAst(pkg) do:
    pkg.configureRecursive()


when isMainModule:
  static:
    echo findRosPackage("rcl").getRecursiveDeps()
