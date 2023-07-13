import std/[tables, os, strutils, strformat, macros, compilesettings]

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

proc findRosPackage*(name: static string): RosPackage =
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
  const pkg = findRosPackage(name)
  pkg.configure()
