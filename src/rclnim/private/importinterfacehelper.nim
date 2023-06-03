import ./interfacebindgen


when isMainModule:
  import std/os
  doAssert paramCount() == 4
  let
    pkgName = paramStr(1)
    outDir = paramStr(2)
    altDir = paramStr(3)
    libPath = paramStr(4)
  
  try:
    generateInterfaceBindings(pkgName, outDir, libPath)
  except PackageNotFoundError as e:
    echo e.msg
    quit QuitFailure

  copyDir outDir, altDir

  echo "ok"
