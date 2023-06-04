import std/[stats, strformat, os]

func addLine(a: var string, b = "") =
  a.add b
  a.add '\n'

proc showLatency*(name: string, s: RunningStat) =
  var res: string
  res.addLine fmt"latency of async_pubsub_single_thread.nim | {s.n} samples"
  res.addLine fmt"mean:   {s.mean() * 1e-3 : 9.2f} μs"
  res.addLine fmt"stddiv: {s.standardDeviation() * 1e-3 : 9.2f} μs"
  res.addLine fmt"max:    {s.max * 1e-3 : 9.2f} μs"
  res.addLine fmt"min:    {s.min * 1e-3 : 9.2f} μs"
  res.addLine()
  echo res
  let f = open(getAppDir()/"result.txt", fmAppend)
  f.write(res)
  f.close()
