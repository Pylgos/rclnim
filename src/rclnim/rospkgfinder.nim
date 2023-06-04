import std/[tables, os, strutils, compilesettings]

type
  RosPackage* = object
    name*: string
    prefix*: string
  
  RosPackageTable* = Table[string, RosPackage]


proc findAllRosPackages(): RosPackageTable =
  let prefixes = getEnv("AMENT_PREFIX_PATH").split(':')
  for prefix in prefixes:
    let resourceDir = prefix/"share/ament_index/resource_index/packages"
    if dirExists(resourceDir):
      for pc in resourceDir.walkDir():
        let packageName = pc.path.splitFile().name
        result[packageName] = RosPackage(name: packageName, prefix: prefix)


const rosPackages = findAllRosPackages()

proc findRosPackage*(name: string): RosPackage =
  rosPackages[name]

proc includeDir*(p: RosPackage): string =
  p.prefix/"include"/p.name

proc libDir*(p: RosPackage): string =
  p.prefix/"lib"

proc configure*(p: static RosPackage, libName: static string = "") {.compileTime.} =
  const cFlag = "-I" & p.includeDir
  when not SingleValueSetting.compileOptions.querySetting.contains(cFlag):
    {.passC: cFlag.}

  const libDirFlag = "-L" & p.libDir
  when not SingleValueSetting.linkOptions.querySetting.contains(libDirFlag):
    {.passL: libDirFlag.}
  
  const libName = if libName == "": p.name else: libName
  when fileExists(p.libDir/"lib" & libName & ".so"):
    const linkFlag = "-l" & libName
    {.passL: linkFlag.}

proc configureRosPackage*(name: static string) {.compileTime.} =
  findRosPackage(name).configure()

