const asyncBackend {.define.} = "chronos"

when asyncBackend == "chronos":
  import ./chronossupports, chronos
  export chronos, chronossupports
elif asyncBackend == "asyncdispatch":
  import ./asyncdispatchsupports, std/asyncdispatch
  export asyncdispatchsupports, asyncdispatch
