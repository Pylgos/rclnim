import rcl, utils, rostimes
import std/times

{.experimental: "overloadableEnums".}

type
  HistoryPolicy* = enum
    SystemDefault
    KeepLast
    KeepAll
    Unknown

when rmwHasBestAvailableQoS:
  type
    ReliabilityPolicy* = enum
      SystemDefault
      BestEffort
      Reliable
      BestAvailable
      Unknown
    
    DurabilityPolicy* = enum
      SystemDefault
      Volatile
      TransientLocal
      BestAvailable
      Unknown
    
    LivelinessPolicy* = enum
      SystemDefault
      Automatic
      ManualByTopic
      BestAvailable
      Unknown
else:
  type
    ReliabilityPolicy* = enum
      SystemDefault
      BestEffort
      Reliable
      Unknown
    
    DurabilityPolicy* = enum
      SystemDefault
      Volatile
      TransientLocal
      Unknown
    
    LivelinessPolicy* = enum
      SystemDefault
      Automatic
      ManualByTopic
      Unknown

func toRmw*(p: HistoryPolicy): rmw_qos_history_policy_t =
  case p
  of KeepLast: RMW_QOS_POLICY_HISTORY_KEEP_LAST
  of KeepAll: RMW_QOS_POLICY_HISTORY_KEEP_ALL
  of SystemDefault: RMW_QOS_POLICY_HISTORY_SYSTEM_DEFAULT
  of Unknown: RMW_QOS_POLICY_HISTORY_UNKNOWN

func fromRmw*(p: rmw_qos_history_policy_t): HistoryPolicy =
  when rmwHasBestAvailableQoS:
    case p
    of RMW_QOS_POLICY_HISTORY_KEEP_LAST: KeepLast
    of RMW_QOS_POLICY_HISTORY_KEEP_ALL: KeepAll
    of RMW_QOS_POLICY_HISTORY_SYSTEM_DEFAULT: SystemDefault
    of RMW_QOS_POLICY_HISTORY_UNKNOWN: Unknown
    of RMW_QOS_POLICY_HISTORY_BEST_AVAILABLE: BestAvailable
  else:
    case p
    of RMW_QOS_POLICY_HISTORY_KEEP_LAST: KeepLast
    of RMW_QOS_POLICY_HISTORY_KEEP_ALL: KeepAll
    of RMW_QOS_POLICY_HISTORY_SYSTEM_DEFAULT: SystemDefault
    of RMW_QOS_POLICY_HISTORY_UNKNOWN: Unknown

func toRmw*(p: ReliabilityPolicy): rmw_qos_reliability_policy_t =
  when rmwHasBestAvailableQoS:
    case p
    of BestEffort: RMW_QOS_POLICY_RELIABILITY_BEST_EFFORT
    of Reliable: RMW_QOS_POLICY_RELIABILITY_RELIABLE
    of SystemDefault: RMW_QOS_POLICY_RELIABILITY_SYSTEM_DEFAULT
    of Unknown: RMW_QOS_POLICY_RELIABILITY_UNKNOWN
    of BestAvailable: RMW_QOS_POLICY_RELIABILITY_BEST_AVAILABLE
  else:
    case p
    of BestEffort: RMW_QOS_POLICY_RELIABILITY_BEST_EFFORT
    of Reliable: RMW_QOS_POLICY_RELIABILITY_RELIABLE
    of SystemDefault: RMW_QOS_POLICY_RELIABILITY_SYSTEM_DEFAULT
    of Unknown: RMW_QOS_POLICY_RELIABILITY_UNKNOWN

func fromRmw*(p: rmw_qos_reliability_policy_t): ReliabilityPolicy =
  when rmwHasBestAvailableQoS:
    case p
    of RMW_QOS_POLICY_RELIABILITY_BEST_EFFORT: BestEffort
    of RMW_QOS_POLICY_RELIABILITY_RELIABLE: Reliable
    of RMW_QOS_POLICY_RELIABILITY_SYSTEM_DEFAULT: SystemDefault
    of RMW_QOS_POLICY_RELIABILITY_UNKNOWN: Unknown
    of RMW_QOS_POLICY_RELIABILITY_BEST_AVAILABLE: BestAvailable
  else:
    case p
    of RMW_QOS_POLICY_RELIABILITY_BEST_EFFORT: BestEffort
    of RMW_QOS_POLICY_RELIABILITY_RELIABLE: Reliable
    of RMW_QOS_POLICY_RELIABILITY_SYSTEM_DEFAULT: SystemDefault
    of RMW_QOS_POLICY_RELIABILITY_UNKNOWN: Unknown

func toRmw*(p: DurabilityPolicy): rmw_qos_durability_policy_t =
  when rmwHasBestAvailableQoS:
    case p
    of Volatile: RMW_QOS_POLICY_DURABILITY_VOLATILE
    of TransientLocal: RMW_QOS_POLICY_DURABILITY_TRANSIENT_LOCAL
    of SystemDefault: RMW_QOS_POLICY_DURABILITY_SYSTEM_DEFAULT
    of Unknown: RMW_QOS_POLICY_DURABILITY_UNKNOWN
    of BestAvailable: RMW_QOS_POLICY_DURABILITY_BEST_AVAILABLE
  else:
    case p
    of Volatile: RMW_QOS_POLICY_DURABILITY_VOLATILE
    of TransientLocal: RMW_QOS_POLICY_DURABILITY_TRANSIENT_LOCAL
    of SystemDefault: RMW_QOS_POLICY_DURABILITY_SYSTEM_DEFAULT
    of Unknown: RMW_QOS_POLICY_DURABILITY_UNKNOWN

func fromRmw*(p: rmw_qos_durability_policy_t): DurabilityPolicy =
  when rmwHasBestAvailableQoS:
    case p
    of RMW_QOS_POLICY_DURABILITY_VOLATILE: Volatile
    of RMW_QOS_POLICY_DURABILITY_TRANSIENT_LOCAL: TransientLocal
    of RMW_QOS_POLICY_DURABILITY_SYSTEM_DEFAULT: SystemDefault
    of RMW_QOS_POLICY_DURABILITY_UNKNOWN: Unknown
    of RMW_QOS_POLICY_DURABILITY_BEST_AVAILABLE: BestAvailable
  else:
    case p
    of RMW_QOS_POLICY_DURABILITY_VOLATILE: Volatile
    of RMW_QOS_POLICY_DURABILITY_TRANSIENT_LOCAL: TransientLocal
    of RMW_QOS_POLICY_DURABILITY_SYSTEM_DEFAULT: SystemDefault
    of RMW_QOS_POLICY_DURABILITY_UNKNOWN: Unknown

func toRmw*(p: LivelinessPolicy): rmw_qos_liveliness_policy_t =
  when rmwHasBestAvailableQoS:
    case p
    of SystemDefault: RMW_QOS_POLICY_LIVELINESS_SYSTEM_DEFAULT
    of Automatic: RMW_QOS_POLICY_LIVELINESS_AUTOMATIC
    of ManualByTopic: RMW_QOS_POLICY_LIVELINESS_MANUAL_BY_TOPIC
    of Unknown: RMW_QOS_POLICY_LIVELINESS_UNKNOWN
    of BestAvailable: RMW_QOS_POLICY_LIVELINESS_BEST_AVAILABLE
  else:
    case p
    of SystemDefault: RMW_QOS_POLICY_LIVELINESS_SYSTEM_DEFAULT
    of Automatic: RMW_QOS_POLICY_LIVELINESS_AUTOMATIC
    of ManualByTopic: RMW_QOS_POLICY_LIVELINESS_MANUAL_BY_TOPIC
    of Unknown: RMW_QOS_POLICY_LIVELINESS_UNKNOWN

func fromRmw*(p: rmw_qos_liveliness_policy_t): LivelinessPolicy =
  when rmwHasBestAvailableQoS:
    case p
    of RMW_QOS_POLICY_LIVELINESS_SYSTEM_DEFAULT: LivelinessPolicy.SystemDefault
    of RMW_QOS_POLICY_LIVELINESS_AUTOMATIC: Automatic
    of RMW_QOS_POLICY_LIVELINESS_MANUAL_BY_TOPIC: ManualByTopic
    of RMW_QOS_POLICY_LIVELINESS_UNKNOWN: Unknown
    of RMW_QOS_POLICY_LIVELINESS_BEST_AVAILABLE: BestAvailable
    else: Unknown
  else:
    case p
    of RMW_QOS_POLICY_LIVELINESS_SYSTEM_DEFAULT: LivelinessPolicy.SystemDefault
    of RMW_QOS_POLICY_LIVELINESS_AUTOMATIC: Automatic
    of RMW_QOS_POLICY_LIVELINESS_MANUAL_BY_TOPIC: ManualByTopic
    of RMW_QOS_POLICY_LIVELINESS_UNKNOWN: Unknown
    else: Unknown

type QoSProfile* = object
  history*: HistoryPolicy
  reliability*: ReliabilityPolicy
  durability*: DurabilityPolicy
  liveliness*: LivelinessPolicy
  depth*: Natural
  deadline*: Duration
  lifespan*: Duration
  livelinessLeaseDuration*: Duration
  avoidRosNamespaceConventions*: bool

func toRmw*(self: QoSProfile): rmw_qos_profile_t =
  result.history = self.history.toRmw()
  result.reliability = self.reliability.toRmw()
  result.durability = self.durability.toRmw()
  result.liveliness = self.liveliness.toRmw()
  result.depth = self.depth.csize_t
  result.deadline = self.deadline.toRmw()
  result.lifespan = self.lifespan.toRmw()
  result.livelinessLeaseDuration = self.livelinessLeaseDuration.toRmw()
  result.avoidRosNamespaceConventions = self.avoidRosNamespaceConventions

func initQoSProfile*(
    history = HistoryPolicy.SystemDefault,
    reliability = ReliabilityPolicy.SystemDefault,
    durability = DurabilityPolicy.SystemDefault,
    liveliness = LivelinessPolicy.SystemDefault,
    depth = 10,
    deadline = DurationZero,
    lifespan = DurationZero,
    livelinessLeaseDuration = DurationZero,
    avoidRosNamespaceConventions = false): QoSProfile {.initProc.} =
  result.history = history
  result.reliability = reliability
  result.durability = durability
  result.liveliness = liveliness
  result.depth = depth
  result.deadline = deadline
  result.lifespan = lifespan
  result.livelinessLeaseDuration = livelinessLeaseDuration
  result.avoidRosNamespaceConventions = avoidRosNamespaceConventions

func withPolicies*(
    self: QoSProfile,
    history = self.history,
    reliability = self.reliability,
    durability = self.durability,
    liveliness = self.liveliness,
    depth = self.depth,
    deadline = self.deadline,
    lifespan = self.lifespan,
    livelinessLeaseDuration = self.livelinessLeaseDuration,
    avoidRosNamespaceConventions = self.avoidRosNamespaceConventions): QoSProfile =
  result.history = history
  result.reliability = reliability
  result.durability = durability
  result.liveliness = liveliness
  result.depth = depth
  result.deadline = deadline
  result.lifespan = lifespan
  result.livelinessLeaseDuration = livelinessLeaseDuration
  result.avoidRosNamespaceConventions = avoidRosNamespaceConventions

type
  QoSCompatibility* = enum
    Error
    Warning
    Ok

func checkCompatible*(
    publisherQoS, subscriptionQoS: QoSProfile): tuple[compatibility: QoSCompatibility, reason: string] =
  var
    compatible = RMW_QOS_COMPATIBILITY_OK
    reason = newString(2048)
  let ret = rmw_qos_profile_check_compatible(
    publisherQoS.toRmw(),
    subscriptionQoS.toRmw(),
    addr compatible,
    reason.cstring,
    reason.len.csize_t)
  doAssert ret == RMW_RET_OK
  result.reason = $cstring(reason)
  case compatible
  of RMW_QOS_COMPATIBILITY_OK:
    result.compatibility = Ok
  of RMW_QOS_COMPATIBILITY_WARNING:
    result.compatibility = Warning
  of RMW_QOS_COMPATIBILITY_ERROR:
    result.compatibility = Error

const
  SystemDefaultQoS* = QoSProfile(
    history: SystemDefault,
    depth: 0,
    reliability: SystemDefault,
    durability: SystemDefault,
    deadline: DurationZero,
    lifespan: DurationZero,
    liveliness: SystemDefault,
    livelinessLeaseDuration: DurationZero,
    avoidRosNamespaceConventions: false
  )
  SensorDataQoS* = QoSProfile(
    history: KeepLast,
    depth: 5,
    reliability: BestEffort,
    durability: Volatile,
    deadline: DurationZero,
    lifespan: DurationZero,
    liveliness: SystemDefault,
    livelinessLeaseDuration: DurationZero,
    avoidRosNamespaceConventions: false
  )
  ParametersQoS* = QoSProfile(
    history: KeepLast,
    depth: 1000,
    reliability: Reliable,
    durability: Volatile,
    deadline: DurationZero,
    lifespan: DurationZero,
    liveliness: SystemDefault,
    livelinessLeaseDuration: DurationZero,
    avoidRosNamespaceConventions: false
  )
  ServiceDefaultQoS* = QoSProfile(
    history: KeepLast,
    depth: 10,
    reliability: Reliable,
    durability: Volatile,
    deadline: DurationZero,
    lifespan: DurationZero,
    liveliness: SystemDefault,
    livelinessLeaseDuration: DurationZero,
    avoidRosNamespaceConventions: false
  )
  ParameterEventQoS* = QoSProfile(
    history: KeepLast,
    depth: 1000,
    reliability: Reliable,
    durability: Volatile,
    deadline: DurationZero,
    lifespan: DurationZero,
    liveliness: SystemDefault,
    livelinessLeaseDuration: DurationZero,
    avoidRosNamespaceConventions: false
  )
