import utils, rcl
import std/strutils

type
  Logger* = object
    name*: string
  
  Severity* = enum
    Unset = RCUTILS_LOG_SEVERITY_UNSET
    Debug = RCUTILS_LOG_SEVERITY_DEBUG
    Info = RCUTILS_LOG_SEVERITY_INFO
    Warn = RCUTILS_LOG_SEVERITY_WARN
    Error = RCUTILS_LOG_SEVERITY_ERROR
    Fatal = RCUTILS_LOG_SEVERITY_FATAL
  
  LogLocationInfo* = object
    functionName, filename: string 
    lineNo: Natural

template getLogLocationInfo*(): LogLocationInfo =
  let info = instantiationInfo()
  LogLocationInfo(
    functionName: getCurrentProcName(),
    filename: info.filename,
    lineNo: info.line
  )

proc initLogger*(name: string): Logger {.initProc.} =
  result.name = name

proc write*(self: Logger, loc: LogLocationInfo, severity: Severity, msg: string) =
  let rcutilsLoc = rcutils_log_location_t(function_name: loc.functionName.cstring, file_name: loc.filename.cstring, line_number: loc.lineNo.csize_t)
  if rcutils_logging_logger_is_enabled_for(self.name.cstring, severity.cint):
    rcutils_log(addr rcutilsLoc, severity.cint, self.name.cstring, "%s", msg)

proc write*(self: Logger, loc: LogLocationInfo, severity: Severity, msg: varargs[string, `$`]) =
  write(self, loc, severity, msg.join(""))

template write*(self: Logger, severity: Severity, msg: varargs[string, `$`]) =
  write(self, getLogLocationInfo(), severity, msg)

template debug*(self: Logger, msg: varargs[string, `$`]) =
  write(self, Debug, msg)

template info*(self: Logger, msg: varargs[string, `$`]) =
  write(self, Info, msg)

template warn*(self: Logger, msg: varargs[string, `$`]) =
  write(self, Warn, msg)

template error*(self: Logger, msg: varargs[string, `$`]) =
  write(self, Error, msg)

template fatal*(self: Logger, msg: varargs[string, `$`]) =
  write(self, Fatal, msg)

