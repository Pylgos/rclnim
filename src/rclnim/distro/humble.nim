
from macros import hint

when not declared(RMW_QOS_POLICY_DEPTH_SYSTEM_DEFAULT):
  const
    RMW_QOS_POLICY_DEPTH_SYSTEM_DEFAULT* = cuint(0)
else:
  static :
    hint("Declaration of " & "RMW_QOS_POLICY_DEPTH_SYSTEM_DEFAULT" &
        " already exists, not redeclaring")
when not declared(enum_rmw_localhost_only_e):
  type
    enum_rmw_localhost_only_e* {.size: sizeof(cuint).} = enum
      RMW_LOCALHOST_ONLY_DEFAULT = 0, RMW_LOCALHOST_ONLY_ENABLED = 1,
      RMW_LOCALHOST_ONLY_DISABLED = 2
else:
  static :
    hint("Declaration of " & "enum_rmw_localhost_only_e" &
        " already exists, not redeclaring")
when not declared(enum_rmw_security_enforcement_policy_e):
  type
    enum_rmw_security_enforcement_policy_e* {.size: sizeof(cuint).} = enum
      RMW_SECURITY_ENFORCEMENT_PERMISSIVE = 0,
      RMW_SECURITY_ENFORCEMENT_ENFORCE = 1
else:
  static :
    hint("Declaration of " & "enum_rmw_security_enforcement_policy_e" &
        " already exists, not redeclaring")
when not declared(enum_RCUTILS_LOG_SEVERITY):
  type
    enum_RCUTILS_LOG_SEVERITY* {.size: sizeof(cuint).} = enum
      RCUTILS_LOG_SEVERITY_UNSET = 0, RCUTILS_LOG_SEVERITY_DEBUG = 10,
      RCUTILS_LOG_SEVERITY_INFO = 20, RCUTILS_LOG_SEVERITY_WARN = 30,
      RCUTILS_LOG_SEVERITY_ERROR = 40, RCUTILS_LOG_SEVERITY_FATAL = 50
else:
  static :
    hint("Declaration of " & "enum_RCUTILS_LOG_SEVERITY" &
        " already exists, not redeclaring")
when not declared(enum_rmw_qos_policy_kind_e):
  type
    enum_rmw_qos_policy_kind_e* {.size: sizeof(cuint).} = enum
      RMW_QOS_POLICY_INVALID = 1, RMW_QOS_POLICY_DURABILITY = 2,
      RMW_QOS_POLICY_DEADLINE = 4, RMW_QOS_POLICY_LIVELINESS = 8,
      RMW_QOS_POLICY_RELIABILITY = 16, RMW_QOS_POLICY_HISTORY = 32,
      RMW_QOS_POLICY_LIFESPAN = 64, RMW_QOS_POLICY_DEPTH = 128,
      RMW_QOS_POLICY_LIVELINESS_LEASE_DURATION = 256,
      RMW_QOS_POLICY_AVOID_ROS_NAMESPACE_CONVENTIONS = 512
else:
  static :
    hint("Declaration of " & "enum_rmw_qos_policy_kind_e" &
        " already exists, not redeclaring")
when not declared(enum_rmw_endpoint_type_e):
  type
    enum_rmw_endpoint_type_e* {.size: sizeof(cuint).} = enum
      RMW_ENDPOINT_INVALID = 0, RMW_ENDPOINT_PUBLISHER = 1,
      RMW_ENDPOINT_SUBSCRIPTION = 2
else:
  static :
    hint("Declaration of " & "enum_rmw_endpoint_type_e" &
        " already exists, not redeclaring")
when not declared(enum_rmw_unique_network_flow_endpoints_requirement_e):
  type
    enum_rmw_unique_network_flow_endpoints_requirement_e* {.size: sizeof(cuint).} = enum
      RMW_UNIQUE_NETWORK_FLOW_ENDPOINTS_NOT_REQUIRED = 0,
      RMW_UNIQUE_NETWORK_FLOW_ENDPOINTS_STRICTLY_REQUIRED = 1,
      RMW_UNIQUE_NETWORK_FLOW_ENDPOINTS_OPTIONALLY_REQUIRED = 2,
      RMW_UNIQUE_NETWORK_FLOW_ENDPOINTS_SYSTEM_DEFAULT = 3
else:
  static :
    hint("Declaration of " &
        "enum_rmw_unique_network_flow_endpoints_requirement_e" &
        " already exists, not redeclaring")
when not declared(enum_rmw_qos_reliability_policy_e):
  type
    enum_rmw_qos_reliability_policy_e* {.size: sizeof(cuint).} = enum
      RMW_QOS_POLICY_RELIABILITY_SYSTEM_DEFAULT = 0,
      RMW_QOS_POLICY_RELIABILITY_RELIABLE = 1,
      RMW_QOS_POLICY_RELIABILITY_BEST_EFFORT = 2,
      RMW_QOS_POLICY_RELIABILITY_UNKNOWN = 3
else:
  static :
    hint("Declaration of " & "enum_rmw_qos_reliability_policy_e" &
        " already exists, not redeclaring")
when not declared(enum_rmw_qos_history_policy_e):
  type
    enum_rmw_qos_history_policy_e* {.size: sizeof(cuint).} = enum
      RMW_QOS_POLICY_HISTORY_SYSTEM_DEFAULT = 0,
      RMW_QOS_POLICY_HISTORY_KEEP_LAST = 1, RMW_QOS_POLICY_HISTORY_KEEP_ALL = 2,
      RMW_QOS_POLICY_HISTORY_UNKNOWN = 3
else:
  static :
    hint("Declaration of " & "enum_rmw_qos_history_policy_e" &
        " already exists, not redeclaring")
when not declared(enum_rmw_qos_durability_policy_e):
  type
    enum_rmw_qos_durability_policy_e* {.size: sizeof(cuint).} = enum
      RMW_QOS_POLICY_DURABILITY_SYSTEM_DEFAULT = 0,
      RMW_QOS_POLICY_DURABILITY_TRANSIENT_LOCAL = 1,
      RMW_QOS_POLICY_DURABILITY_VOLATILE = 2,
      RMW_QOS_POLICY_DURABILITY_UNKNOWN = 3
else:
  static :
    hint("Declaration of " & "enum_rmw_qos_durability_policy_e" &
        " already exists, not redeclaring")
when not declared(enum_rmw_qos_liveliness_policy_e):
  type
    enum_rmw_qos_liveliness_policy_e* {.size: sizeof(cuint).} = enum
      RMW_QOS_POLICY_LIVELINESS_SYSTEM_DEFAULT = 0,
      RMW_QOS_POLICY_LIVELINESS_AUTOMATIC = 1,
      RMW_QOS_POLICY_LIVELINESS_MANUAL_BY_NODE = 2,
      RMW_QOS_POLICY_LIVELINESS_MANUAL_BY_TOPIC = 3,
      RMW_QOS_POLICY_LIVELINESS_UNKNOWN = 4
else:
  static :
    hint("Declaration of " & "enum_rmw_qos_liveliness_policy_e" &
        " already exists, not redeclaring")
when not declared(rmw_log_severity_t):
  type
    rmw_log_severity_t* {.size: sizeof(cuint).} = enum
      RMW_LOG_SEVERITY_DEBUG = 10, RMW_LOG_SEVERITY_INFO = 20,
      RMW_LOG_SEVERITY_WARN = 30, RMW_LOG_SEVERITY_ERROR = 40,
      RMW_LOG_SEVERITY_FATAL = 50
else:
  static :
    hint("Declaration of " & "rmw_log_severity_t" &
        " already exists, not redeclaring")
when not declared(enum_rcl_clock_type_e):
  type
    enum_rcl_clock_type_e* {.size: sizeof(cuint).} = enum
      RCL_CLOCK_UNINITIALIZED = 0, RCL_ROS_TIME = 1, RCL_SYSTEM_TIME = 2,
      RCL_STEADY_TIME = 3
else:
  static :
    hint("Declaration of " & "enum_rcl_clock_type_e" &
        " already exists, not redeclaring")
when not declared(enum_rcl_clock_change_e):
  type
    enum_rcl_clock_change_e* {.size: sizeof(cuint).} = enum
      RCL_ROS_TIME_NO_CHANGE = 1, RCL_ROS_TIME_ACTIVATED = 2,
      RCL_ROS_TIME_DEACTIVATED = 3, RCL_SYSTEM_TIME_NO_CHANGE = 4
else:
  static :
    hint("Declaration of " & "enum_rcl_clock_change_e" &
        " already exists, not redeclaring")
when not declared(enum_rmw_event_type_e):
  type
    enum_rmw_event_type_e* {.size: sizeof(cuint).} = enum
      RMW_EVENT_LIVELINESS_CHANGED = 0, RMW_EVENT_REQUESTED_DEADLINE_MISSED = 1,
      RMW_EVENT_REQUESTED_QOS_INCOMPATIBLE = 2, RMW_EVENT_MESSAGE_LOST = 3,
      RMW_EVENT_LIVELINESS_LOST = 4, RMW_EVENT_OFFERED_DEADLINE_MISSED = 5,
      RMW_EVENT_OFFERED_QOS_INCOMPATIBLE = 6, RMW_EVENT_INVALID = 7
else:
  static :
    hint("Declaration of " & "enum_rmw_event_type_e" &
        " already exists, not redeclaring")
when not declared(enum_rmw_qos_compatibility_type_e):
  type
    enum_rmw_qos_compatibility_type_e* {.size: sizeof(cuint).} = enum
      RMW_QOS_COMPATIBILITY_OK = 0, RMW_QOS_COMPATIBILITY_WARNING = 1,
      RMW_QOS_COMPATIBILITY_ERROR = 2
else:
  static :
    hint("Declaration of " & "enum_rmw_qos_compatibility_type_e" &
        " already exists, not redeclaring")
when not declared(enum_rcl_publisher_event_type_e):
  type
    enum_rcl_publisher_event_type_e* {.size: sizeof(cuint).} = enum
      RCL_PUBLISHER_OFFERED_DEADLINE_MISSED = 0,
      RCL_PUBLISHER_LIVELINESS_LOST = 1,
      RCL_PUBLISHER_OFFERED_INCOMPATIBLE_QOS = 2
else:
  static :
    hint("Declaration of " & "enum_rcl_publisher_event_type_e" &
        " already exists, not redeclaring")
when not declared(enum_rcl_subscription_event_type_e):
  type
    enum_rcl_subscription_event_type_e* {.size: sizeof(cuint).} = enum
      RCL_SUBSCRIPTION_REQUESTED_DEADLINE_MISSED = 0,
      RCL_SUBSCRIPTION_LIVELINESS_CHANGED = 1,
      RCL_SUBSCRIPTION_REQUESTED_INCOMPATIBLE_QOS = 2,
      RCL_SUBSCRIPTION_MESSAGE_LOST = 3
else:
  static :
    hint("Declaration of " & "enum_rcl_subscription_event_type_e" &
        " already exists, not redeclaring")
when not declared(struct_rcl_timer_impl_s):
  type
    struct_rcl_timer_impl_s* = distinct object
else:
  static :
    hint("Declaration of " & "struct_rcl_timer_impl_s" &
        " already exists, not redeclaring")
when not declared(struct_rcl_wait_set_impl_s):
  type
    struct_rcl_wait_set_impl_s* = distinct object
else:
  static :
    hint("Declaration of " & "struct_rcl_wait_set_impl_s" &
        " already exists, not redeclaring")
when not declared(struct_rcl_subscription_impl_s):
  type
    struct_rcl_subscription_impl_s* = distinct object
else:
  static :
    hint("Declaration of " & "struct_rcl_subscription_impl_s" &
        " already exists, not redeclaring")
when not declared(struct_rcutils_string_map_impl_s):
  type
    struct_rcutils_string_map_impl_s* = distinct object
else:
  static :
    hint("Declaration of " & "struct_rcutils_string_map_impl_s" &
        " already exists, not redeclaring")
when not declared(RMW_DURATION_UNSPECIFIED):
  type
    RMW_DURATION_UNSPECIFIED* = distinct object
else:
  static :
    hint("Declaration of " & "RMW_DURATION_UNSPECIFIED" &
        " already exists, not redeclaring")
when not declared(struct_rcl_publisher_impl_s):
  type
    struct_rcl_publisher_impl_s* = distinct object
else:
  static :
    hint("Declaration of " & "struct_rcl_publisher_impl_s" &
        " already exists, not redeclaring")
when not declared(struct_rmw_context_impl_s):
  type
    struct_rmw_context_impl_s* = distinct object
else:
  static :
    hint("Declaration of " & "struct_rmw_context_impl_s" &
        " already exists, not redeclaring")
when not declared(RCUTILS_WARN_UNUSED):
  type
    RCUTILS_WARN_UNUSED* = distinct object
else:
  static :
    hint("Declaration of " & "RCUTILS_WARN_UNUSED" &
        " already exists, not redeclaring")
when not declared(struct_rcl_service_impl_s):
  type
    struct_rcl_service_impl_s* = distinct object
else:
  static :
    hint("Declaration of " & "struct_rcl_service_impl_s" &
        " already exists, not redeclaring")
when not declared(UINT64_MAX):
  type
    UINT64_MAX* = distinct object
else:
  static :
    hint("Declaration of " & "UINT64_MAX" & " already exists, not redeclaring")
when not declared(RCUTILS_SAFE_FWRITE_TO_STDERR):
  type
    RCUTILS_SAFE_FWRITE_TO_STDERR* = distinct object
else:
  static :
    hint("Declaration of " & "RCUTILS_SAFE_FWRITE_TO_STDERR" &
        " already exists, not redeclaring")
when not declared(struct_rmw_init_options_impl_s):
  type
    struct_rmw_init_options_impl_s* = distinct object
else:
  static :
    hint("Declaration of " & "struct_rmw_init_options_impl_s" &
        " already exists, not redeclaring")
when not declared(struct_rcl_context_impl_s):
  type
    struct_rcl_context_impl_s* = distinct object
else:
  static :
    hint("Declaration of " & "struct_rcl_context_impl_s" &
        " already exists, not redeclaring")
when not declared(struct_rcl_node_impl_s):
  type
    struct_rcl_node_impl_s* = distinct object
else:
  static :
    hint("Declaration of " & "struct_rcl_node_impl_s" &
        " already exists, not redeclaring")
when not declared(internal_Thread_local):
  type
    internal_Thread_local* = distinct object
else:
  static :
    hint("Declaration of " & "internal_Thread_local" &
        " already exists, not redeclaring")
when not declared(struct_rcl_client_impl_s):
  type
    struct_rcl_client_impl_s* = distinct object
else:
  static :
    hint("Declaration of " & "struct_rcl_client_impl_s" &
        " already exists, not redeclaring")
when not declared(struct_rcutils_array_list_impl_s):
  type
    struct_rcutils_array_list_impl_s* = distinct object
else:
  static :
    hint("Declaration of " & "struct_rcutils_array_list_impl_s" &
        " already exists, not redeclaring")
when not declared(SIZE_MAX):
  type
    SIZE_MAX* = distinct object
else:
  static :
    hint("Declaration of " & "SIZE_MAX" & " already exists, not redeclaring")
when not declared(struct_rcl_init_options_impl_s):
  type
    struct_rcl_init_options_impl_s* = distinct object
else:
  static :
    hint("Declaration of " & "struct_rcl_init_options_impl_s" &
        " already exists, not redeclaring")
when not declared(RCUTILS_US_TO_NS):
  type
    RCUTILS_US_TO_NS* = distinct object
else:
  static :
    hint("Declaration of " & "RCUTILS_US_TO_NS" &
        " already exists, not redeclaring")
when not declared(RCUTILS_MS_TO_NS):
  type
    RCUTILS_MS_TO_NS* = distinct object
else:
  static :
    hint("Declaration of " & "RCUTILS_MS_TO_NS" &
        " already exists, not redeclaring")
when not declared(struct_rcl_arguments_impl_s):
  type
    struct_rcl_arguments_impl_s* = distinct object
else:
  static :
    hint("Declaration of " & "struct_rcl_arguments_impl_s" &
        " already exists, not redeclaring")
when not declared(RCUTILS_S_TO_NS):
  type
    RCUTILS_S_TO_NS* = distinct object
else:
  static :
    hint("Declaration of " & "RCUTILS_S_TO_NS" &
        " already exists, not redeclaring")
when not declared(RCUTILS_NS_TO_S):
  type
    RCUTILS_NS_TO_S* = distinct object
else:
  static :
    hint("Declaration of " & "RCUTILS_NS_TO_S" &
        " already exists, not redeclaring")
when not declared(struct_rcutils_hash_map_impl_s):
  type
    struct_rcutils_hash_map_impl_s* = distinct object
else:
  static :
    hint("Declaration of " & "struct_rcutils_hash_map_impl_s" &
        " already exists, not redeclaring")
when not declared(RCUTILS_NS_TO_MS):
  type
    RCUTILS_NS_TO_MS* = distinct object
else:
  static :
    hint("Declaration of " & "RCUTILS_NS_TO_MS" &
        " already exists, not redeclaring")
when not declared(struct_rcl_event_impl_s):
  type
    struct_rcl_event_impl_s* = distinct object
else:
  static :
    hint("Declaration of " & "struct_rcl_event_impl_s" &
        " already exists, not redeclaring")
when not declared(RCUTILS_NS_TO_US):
  type
    RCUTILS_NS_TO_US* = distinct object
else:
  static :
    hint("Declaration of " & "RCUTILS_NS_TO_US" &
        " already exists, not redeclaring")
when not declared(RCUTILS_IMPORT):
  type
    RCUTILS_IMPORT* = distinct object
else:
  static :
    hint("Declaration of " & "RCUTILS_IMPORT" &
        " already exists, not redeclaring")
when not declared(compiler_builtin_va_list):
  type
    compiler_builtin_va_list* = distinct object
else:
  static :
    hint("Declaration of " & "compiler_builtin_va_list" &
        " already exists, not redeclaring")
when not declared(struct_rcl_guard_condition_impl_s):
  type
    struct_rcl_guard_condition_impl_s* = distinct object
else:
  static :
    hint("Declaration of " & "struct_rcl_guard_condition_impl_s" &
        " already exists, not redeclaring")
type
  rcutils_ret_t_520094225 = cint ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/rcutils_ret.h:26:13
  struct_rcutils_allocator_s_520094227 {.pure, inheritable, bycopy.} = object
    allocate*: proc (a0: csize_t; a1: pointer): pointer {.cdecl.} ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/allocator.h:47:16
    deallocate*: proc (a0: pointer; a1: pointer): void {.cdecl.}
    reallocate*: proc (a0: pointer; a1: csize_t; a2: pointer): pointer {.cdecl.}
    zero_allocate*: proc (a0: csize_t; a1: csize_t; a2: pointer): pointer {.
        cdecl.}
    state*: pointer

  rcutils_allocator_t_520094229 = struct_rcutils_allocator_s_520094228 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/allocator.h:77:3
  rcl_allocator_t_520094231 = rcutils_allocator_t_520094230 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/allocator.h:31:29
  rmw_localhost_only_t_520094235 = enum_rmw_localhost_only_e_520094234 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/localhost.h:34:3
  rmw_ret_t_520094237 = int32 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/ret_types.h:26:17
  rmw_security_enforcement_policy_t_520094241 = enum_rmw_security_enforcement_policy_e_520094240 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/security_options.h:34:3
  struct_rmw_security_options_s_520094243 {.pure, inheritable, bycopy.} = object
    enforce_security*: rmw_security_enforcement_policy_t_520094242 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/security_options.h:36:32
    security_root_path*: cstring

  rmw_security_options_t_520094245 = struct_rmw_security_options_s_520094244 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/security_options.h:40:3
  rmw_init_options_impl_t_520094247 = struct_rmw_init_options_impl_s ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/init_options.h:37:40
  struct_rmw_init_options_s_520094249 {.pure, inheritable, bycopy.} = object
    instance_id*: uint64     ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/init_options.h:40:32
    implementation_identifier*: cstring
    domain_id*: csize_t
    security_options*: rmw_security_options_t_520094246
    localhost_only*: rmw_localhost_only_t_520094236
    enclave*: cstring
    allocator*: rcutils_allocator_t_520094230
    impl*: ptr rmw_init_options_impl_t_520094248

  rmw_init_options_t_520094251 = struct_rmw_init_options_s_520094250 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/init_options.h:66:3
  rmw_context_impl_t_520094253 = struct_rmw_context_impl_s ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/init.h:34:35
  struct_rmw_context_s_520094255 {.pure, inheritable, bycopy.} = object
    instance_id*: uint64     ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/init.h:37:32
    implementation_identifier*: cstring
    options*: rmw_init_options_t_520094252
    actual_domain_id*: csize_t
    impl*: ptr rmw_context_impl_t_520094254

  rmw_context_t_520094257 = struct_rmw_context_s_520094256 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/init.h:50:3
  int_least64_t_520094259 = compiler_int_least64_t_520094677 ## Generated based on /usr/include/stdint.h:46:25
  struct_rcutils_error_string_s_520094261 {.pure, inheritable, bycopy.} = object
    str*: array[1024'i64, cschar] ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/error_handling.h:105:16
  
  rcutils_error_string_t_520094263 = struct_rcutils_error_string_s_520094262 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/error_handling.h:109:3
  struct_rcutils_error_state_s_520094265 {.pure, inheritable, bycopy.} = object
    message*: array[768'i64, cschar] ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/error_handling.h:112:16
    file*: array[229'i64, cschar]
    line_number*: uint64

  rcutils_error_state_t_520094267 = struct_rcutils_error_state_s_520094266 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/error_handling.h:121:3
  struct_rcutils_array_list_s_520094269 {.pure, inheritable, bycopy.} = object
    impl*: ptr struct_rcutils_array_list_impl_s ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/array_list.h:35:36
  
  rcutils_array_list_t_520094271 = struct_rcutils_array_list_s_520094270 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/array_list.h:39:3
  struct_rcutils_char_array_s_520094273 {.pure, inheritable, bycopy.} = object
    buffer*: cstring         ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/char_array.h:32:36
    owns_buffer*: bool
    buffer_length*: csize_t
    buffer_capacity*: csize_t
    allocator*: rcutils_allocator_t_520094230

  rcutils_char_array_t_520094275 = struct_rcutils_char_array_s_520094274 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/char_array.h:52:3
  struct_rcutils_hash_map_s_520094277 {.pure, inheritable, bycopy.} = object
    impl*: ptr struct_rcutils_hash_map_impl_s ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/hash_map.h:35:36
  
  rcutils_hash_map_t_520094286 = struct_rcutils_hash_map_s_520094278 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/hash_map.h:39:3
  rcutils_hash_map_key_hasher_t_520094288 = proc (a0: pointer): csize_t {.cdecl.} ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/hash_map.h:46:19
  rcutils_hash_map_key_cmp_t_520094290 = proc (a0: pointer; a1: pointer): cint {.
      cdecl.}                ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/hash_map.h:58:16
  struct_rcutils_string_array_s_520094292 {.pure, inheritable, bycopy.} = object
    size*: csize_t           ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/string_array.h:35:36
    data*: ptr ptr cschar
    allocator*: rcutils_allocator_t_520094230

  rcutils_string_array_t_520094294 = struct_rcutils_string_array_s_520094293 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/string_array.h:45:3
  struct_rcutils_string_map_s_520094296 {.pure, inheritable, bycopy.} = object
    impl*: ptr struct_rcutils_string_map_impl_s ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/string_map.h:35:36
  
  rcutils_string_map_t_520094298 = struct_rcutils_string_map_s_520094297 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/string_map.h:39:3
  struct_rcutils_uint8_array_s_520094300 {.pure, inheritable, bycopy.} = object
    buffer*: ptr uint8       ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/uint8_array.h:32:36
    buffer_length*: csize_t
    buffer_capacity*: csize_t
    allocator*: rcutils_allocator_t_520094230

  rcutils_uint8_array_t_520094302 = struct_rcutils_uint8_array_s_520094301 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/uint8_array.h:45:3
  rcutils_time_point_value_t_520094304 = int64 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/time.h:48:17
  rcutils_duration_value_t_520094306 = int64 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/time.h:50:17
  struct_rcutils_log_location_s_520094308 {.pure, inheritable, bycopy.} = object
    function_name*: cstring  ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/logging.h:156:16
    file_name*: cstring
    line_number*: csize_t

  rcutils_log_location_t_520094310 = struct_rcutils_log_location_s_520094309 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/logging.h:164:3
  rcutils_logging_output_handler_t_520094314 = proc (
      a0: ptr rcutils_log_location_t_520094311; a1: cint; a2: cstring;
      a3: rcutils_time_point_value_t_520094305; a4: cstring; a5: ptr va_list_520094317): void {.
      cdecl.}                ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/logging.h:213:17
  va_list_520094316 = compiler_gnuc_va_list_520094679 ## Generated based on /usr/include/stdio.h:52:24
  rmw_qos_policy_kind_t_520094320 = enum_rmw_qos_policy_kind_e_520094319 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/qos_policy_kind.h:39:3
  struct_rmw_qos_incompatible_event_status_s_520094322 {.pure, inheritable,
      bycopy.} = object
    total_count*: int32      ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/events_statuses/incompatible_qos.h:28:32
    total_count_change*: int32
    last_policy_kind*: rmw_qos_policy_kind_t_520094321

  rmw_qos_incompatible_event_status_t_520094324 = struct_rmw_qos_incompatible_event_status_s_520094323 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/events_statuses/incompatible_qos.h:45:3
  rmw_requested_qos_incompatible_event_status_t_520094326 = rmw_qos_incompatible_event_status_t_520094325 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/events_statuses/incompatible_qos.h:48:45
  rmw_offered_qos_incompatible_event_status_t_520094328 = rmw_qos_incompatible_event_status_t_520094325 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/events_statuses/incompatible_qos.h:51:45
  struct_rmw_liveliness_changed_status_s_520094330 {.pure, inheritable, bycopy.} = object
    alive_count*: int32      ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/events_statuses/liveliness_changed.h:28:32
    not_alive_count*: int32
    alive_count_change*: int32
    not_alive_count_change*: int32

  rmw_liveliness_changed_status_t_520094332 = struct_rmw_liveliness_changed_status_s_520094331 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/events_statuses/liveliness_changed.h:52:3
  struct_rmw_liveliness_lost_status_s_520094334 {.pure, inheritable, bycopy.} = object
    total_count*: int32      ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/events_statuses/liveliness_lost.h:28:32
    total_count_change*: int32

  rmw_liveliness_lost_status_t_520094336 = struct_rmw_liveliness_lost_status_s_520094335 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/events_statuses/liveliness_lost.h:39:3
  struct_rmw_message_lost_status_s_520094338 {.pure, inheritable, bycopy.} = object
    total_count*: csize_t    ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/events_statuses/message_lost.h:27:32
    total_count_change*: csize_t

  rmw_message_lost_status_t_520094340 = struct_rmw_message_lost_status_s_520094339 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/events_statuses/message_lost.h:33:3
  struct_rmw_offered_deadline_missed_status_s_520094342 {.pure, inheritable,
      bycopy.} = object
    total_count*: int32      ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/events_statuses/offered_deadline_missed.h:28:32
    total_count_change*: int32

  rmw_offered_deadline_missed_status_t_520094344 = struct_rmw_offered_deadline_missed_status_s_520094343 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/events_statuses/offered_deadline_missed.h:39:3
  struct_rmw_requested_deadline_missed_status_s_520094346 {.pure, inheritable,
      bycopy.} = object
    total_count*: int32      ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/events_statuses/requested_deadline_missed.h:28:32
    total_count_change*: int32

  rmw_requested_deadline_missed_status_t_520094348 = struct_rmw_requested_deadline_missed_status_s_520094347 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/events_statuses/requested_deadline_missed.h:39:3
  rmw_serialized_message_t_520094350 = rcutils_uint8_array_t_520094303 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/serialized_message.h:37:31
  struct_rmw_subscription_content_filter_options_s_520094352 {.pure,
      inheritable, bycopy.} = object
    filter_expression*: cstring ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/subscription_content_filter_options.h:30:32
    expression_parameters*: rcutils_string_array_t_520094295

  rmw_subscription_content_filter_options_t_520094354 = struct_rmw_subscription_content_filter_options_s_520094353 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/subscription_content_filter_options.h:46:3
  struct_rmw_time_s_520094356 {.pure, inheritable, bycopy.} = object
    sec*: uint64             ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/time.h:31:32
    nsec*: uint64

  rmw_time_t_520094358 = struct_rmw_time_s_520094357 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/time.h:38:3
  rmw_time_point_value_t_520094360 = rcutils_time_point_value_t_520094305 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/time.h:40:36
  rmw_duration_t_520094362 = rcutils_duration_value_t_520094307 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/time.h:41:34
  struct_rmw_node_s_520094364 {.pure, inheritable, bycopy.} = object
    implementation_identifier*: cstring ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:45:32
    data*: pointer
    name*: cstring
    namespace*: cstring
    context*: ptr rmw_context_t_520094258

  rmw_node_t_520094366 = struct_rmw_node_s_520094365 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:61:3
  rmw_endpoint_type_t_520094370 = enum_rmw_endpoint_type_e_520094369 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:74:3
  rmw_unique_network_flow_endpoints_requirement_t_520094374 = enum_rmw_unique_network_flow_endpoints_requirement_e_520094373 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:92:3
  struct_rmw_publisher_options_s_520094376 {.pure, inheritable, bycopy.} = object
    rmw_specific_publisher_payload*: pointer ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:95:32
    require_unique_network_flow_endpoints*: rmw_unique_network_flow_endpoints_requirement_t_520094375

  rmw_publisher_options_t_520094378 = struct_rmw_publisher_options_s_520094377 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:117:3
  struct_rmw_publisher_s_520094380 {.pure, inheritable, bycopy.} = object
    implementation_identifier*: cstring ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:120:32
    data*: pointer
    topic_name*: cstring
    options*: rmw_publisher_options_t_520094379
    can_loan_messages*: bool

  rmw_publisher_t_520094382 = struct_rmw_publisher_s_520094381 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:144:3
  struct_rmw_subscription_options_s_520094384 {.pure, inheritable, bycopy.} = object
    rmw_specific_subscription_payload*: pointer ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:147:32
    ignore_local_publications*: bool
    require_unique_network_flow_endpoints*: rmw_unique_network_flow_endpoints_requirement_t_520094375
    content_filter_options*: ptr rmw_subscription_content_filter_options_t_520094355

  rmw_subscription_options_t_520094386 = struct_rmw_subscription_options_s_520094385 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:184:3
  struct_rmw_subscription_s_520094388 {.pure, inheritable, bycopy.} = object
    implementation_identifier*: cstring ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:186:32
    data*: pointer
    topic_name*: cstring
    options*: rmw_subscription_options_t_520094387
    can_loan_messages*: bool
    is_cft_enabled*: bool

  rmw_subscription_t_520094390 = struct_rmw_subscription_s_520094389 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:213:3
  struct_rmw_service_s_520094392 {.pure, inheritable, bycopy.} = object
    implementation_identifier*: cstring ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:216:32
    data*: pointer
    service_name*: cstring

  rmw_service_t_520094394 = struct_rmw_service_s_520094393 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:226:3
  struct_rmw_client_s_520094396 {.pure, inheritable, bycopy.} = object
    implementation_identifier*: cstring ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:229:32
    data*: pointer
    service_name*: cstring

  rmw_client_t_520094398 = struct_rmw_client_s_520094397 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:239:3
  struct_rmw_guard_condition_s_520094400 {.pure, inheritable, bycopy.} = object
    implementation_identifier*: cstring ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:242:32
    data*: pointer
    context*: ptr rmw_context_t_520094258

  rmw_guard_condition_t_520094402 = struct_rmw_guard_condition_s_520094401 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:252:3
  struct_rmw_publisher_allocation_s_520094404 {.pure, inheritable, bycopy.} = object
    implementation_identifier*: cstring ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:255:32
    data*: pointer

  rmw_publisher_allocation_t_520094406 = struct_rmw_publisher_allocation_s_520094405 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:262:3
  struct_rmw_subscription_allocation_s_520094408 {.pure, inheritable, bycopy.} = object
    implementation_identifier*: cstring ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:265:32
    data*: pointer

  rmw_subscription_allocation_t_520094410 = struct_rmw_subscription_allocation_s_520094409 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:272:3
  struct_rmw_subscriptions_s_520094412 {.pure, inheritable, bycopy.} = object
    subscriber_count*: csize_t ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:281:32
    subscribers*: ptr pointer

  rmw_subscriptions_t_520094414 = struct_rmw_subscriptions_s_520094413 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:287:3
  struct_rmw_services_s_520094416 {.pure, inheritable, bycopy.} = object
    service_count*: csize_t  ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:296:32
    services*: ptr pointer

  rmw_services_t_520094418 = struct_rmw_services_s_520094417 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:302:3
  struct_rmw_clients_s_520094420 {.pure, inheritable, bycopy.} = object
    client_count*: csize_t   ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:311:32
    clients*: ptr pointer

  rmw_clients_t_520094422 = struct_rmw_clients_s_520094421 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:317:3
  struct_rmw_events_s_520094424 {.pure, inheritable, bycopy.} = object
    event_count*: csize_t    ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:319:32
    events*: ptr pointer

  rmw_events_t_520094426 = struct_rmw_events_s_520094425 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:325:3
  struct_rmw_guard_conditions_s_520094428 {.pure, inheritable, bycopy.} = object
    guard_condition_count*: csize_t ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:334:32
    guard_conditions*: ptr pointer

  rmw_guard_conditions_t_520094430 = struct_rmw_guard_conditions_s_520094429 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:340:3
  struct_rmw_wait_set_s_520094432 {.pure, inheritable, bycopy.} = object
    implementation_identifier*: cstring ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:343:32
    guard_conditions*: ptr rmw_guard_conditions_t_520094431
    data*: pointer

  rmw_wait_set_t_520094434 = struct_rmw_wait_set_s_520094433 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:353:3
  struct_rmw_request_id_s_520094436 {.pure, inheritable, bycopy.} = object
    writer_guid*: array[16'i64, int8] ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:356:32
    sequence_number*: int64

  rmw_request_id_t_520094438 = struct_rmw_request_id_s_520094437 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:363:3
  struct_rmw_service_info_s_520094440 {.pure, inheritable, bycopy.} = object
    source_timestamp*: rmw_time_point_value_t_520094361 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:366:32
    received_timestamp*: rmw_time_point_value_t_520094361
    request_id*: rmw_request_id_t_520094439

  rmw_service_info_t_520094442 = struct_rmw_service_info_s_520094441 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:371:3
  rmw_qos_reliability_policy_t_520094446 = enum_rmw_qos_reliability_policy_e_520094445 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:386:3
  rmw_qos_history_policy_t_520094450 = enum_rmw_qos_history_policy_e_520094449 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:402:3
  rmw_qos_durability_policy_t_520094454 = enum_rmw_qos_durability_policy_e_520094453 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:418:3
  rmw_qos_liveliness_policy_t_520094458 = enum_rmw_qos_liveliness_policy_e_520094457 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:457:3
  struct_rmw_qos_profile_s_520094460 {.pure, inheritable, bycopy.} = object
    history*: enum_rmw_qos_history_policy_e_520094449 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:469:32
    depth*: csize_t
    reliability*: enum_rmw_qos_reliability_policy_e_520094445
    durability*: enum_rmw_qos_durability_policy_e_520094453
    deadline*: struct_rmw_time_s_520094357
    lifespan*: struct_rmw_time_s_520094357
    liveliness*: enum_rmw_qos_liveliness_policy_e_520094457
    liveliness_lease_duration*: struct_rmw_time_s_520094357
    avoid_ros_namespace_conventions*: bool

  rmw_qos_profile_t_520094462 = struct_rmw_qos_profile_s_520094461 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:513:3
  struct_rmw_gid_s_520094464 {.pure, inheritable, bycopy.} = object
    implementation_identifier*: cstring ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:516:32
    data*: array[24'i64, uint8]

  rmw_gid_t_520094466 = struct_rmw_gid_s_520094465 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:523:3
  struct_rmw_message_info_s_520094468 {.pure, inheritable, bycopy.} = object
    source_timestamp*: rmw_time_point_value_t_520094361 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:528:32
    received_timestamp*: rmw_time_point_value_t_520094361
    publication_sequence_number*: uint64
    reception_sequence_number*: uint64
    publisher_gid*: rmw_gid_t_520094467
    from_intra_process*: bool

  rmw_message_info_t_520094470 = struct_rmw_message_info_s_520094469 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:612:3
  rcl_ret_t_520094474 = rmw_ret_t_520094238 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:23:19
  rcl_serialized_message_t_520094476 = rmw_serialized_message_t_520094351 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:127:34
  rcl_log_severity_t_520094478 = enum_RCUTILS_LOG_SEVERITY_520094313 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/log_level.h:31:35
  struct_rcl_logger_setting_s_520094480 {.pure, inheritable, bycopy.} = object
    name*: cstring           ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/log_level.h:34:16
    level*: rcl_log_severity_t_520094479

  rcl_logger_setting_t_520094482 = struct_rcl_logger_setting_s_520094481 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/log_level.h:40:3
  struct_rcl_log_levels_s_520094484 {.pure, inheritable, bycopy.} = object
    default_logger_level*: rcl_log_severity_t_520094479 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/log_level.h:43:16
    logger_settings*: ptr rcl_logger_setting_t_520094483
    num_logger_settings*: csize_t
    capacity_logger_settings*: csize_t
    allocator*: rcl_allocator_t_520094232

  rcl_log_levels_t_520094486 = struct_rcl_log_levels_s_520094485 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/log_level.h:55:3
  rcl_arguments_impl_t_520094488 = struct_rcl_arguments_impl_s ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/arguments.h:32:37
  struct_rcl_arguments_s_520094490 {.pure, inheritable, bycopy.} = object
    impl*: ptr rcl_arguments_impl_t_520094489 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/arguments.h:35:16
  
  rcl_arguments_t_520094492 = struct_rcl_arguments_s_520094491 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/arguments.h:39:3
  rcl_params_t_520094494 = struct_rcl_params_s_520094681 ## Generated based on /nix/store/4yca7gxc8wbj0d7mw594azdf3i2pck19-rcl_yaml_param_parser-5.3.2/include/rcl_yaml_param_parser/rcl_yaml_param_parser/types.h:109:3
  rcl_init_options_impl_t_520094496 = struct_rcl_init_options_impl_s ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/init_options.h:32:40
  struct_rcl_init_options_s_520094498 {.pure, inheritable, bycopy.} = object
    impl*: ptr rcl_init_options_impl_t_520094497 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/init_options.h:35:16
  
  rcl_init_options_t_520094500 = struct_rcl_init_options_s_520094499 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/init_options.h:39:3
  rcl_context_instance_id_t_520094502 = uint64 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/context.h:44:18
  rcl_context_impl_t_520094504 = struct_rcl_context_impl_s ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/context.h:46:35
  struct_rcl_context_s_520094506 {.pure, inheritable, bycopy.} = object
    global_arguments*: rcl_arguments_t_520094493 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/context.h:113:16
    impl*: ptr rcl_context_impl_t_520094505
    instance_id_storage*: array[8'i64, uint8]

  rcl_context_t_520094508 = struct_rcl_context_s_520094507 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/context.h:150:3
  rcl_guard_condition_impl_t_520094510 = struct_rcl_guard_condition_impl_s ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/guard_condition.h:32:43
  struct_rcl_guard_condition_s_520094512 {.pure, inheritable, bycopy.} = object
    context*: ptr rcl_context_t_520094509 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/guard_condition.h:35:16
    impl*: ptr rcl_guard_condition_impl_t_520094511

  rcl_guard_condition_t_520094514 = struct_rcl_guard_condition_s_520094513 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/guard_condition.h:42:3
  struct_rcl_guard_condition_options_s_520094516 {.pure, inheritable, bycopy.} = object
    allocator*: rcl_allocator_t_520094232 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/guard_condition.h:45:16
  
  rcl_guard_condition_options_t_520094518 = struct_rcl_guard_condition_options_s_520094517 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/guard_condition.h:49:3
  struct_rcl_node_options_s_520094520 {.pure, inheritable, bycopy.} = object
    allocator*: rcl_allocator_t_520094232 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/node_options.h:34:16
    use_global_arguments*: bool
    arguments*: rcl_arguments_t_520094493
    enable_rosout*: bool
    rosout_qos*: rmw_qos_profile_t_520094463

  rcl_node_options_t_520094522 = struct_rcl_node_options_s_520094521 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/node_options.h:57:3
  rcl_node_impl_t_520094524 = struct_rcl_node_impl_s ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/node.h:38:32
  struct_rcl_node_s_520094526 {.pure, inheritable, bycopy.} = object
    context*: ptr rcl_context_t_520094509 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/node.h:41:16
    impl*: ptr rcl_node_impl_t_520094525

  rcl_node_t_520094528 = struct_rcl_node_s_520094527 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/node.h:48:3
  rcl_time_point_value_t_520094530 = rcutils_time_point_value_t_520094305 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:46:36
  rcl_duration_value_t_520094532 = rcutils_duration_value_t_520094307 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:48:34
  rcl_clock_type_t_520094536 = enum_rcl_clock_type_e_520094535 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:71:3
  struct_rcl_duration_s_520094538 {.pure, inheritable, bycopy.} = object
    nanoseconds*: rcl_duration_value_t_520094533 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:74:16
  
  rcl_duration_t_520094540 = struct_rcl_duration_s_520094539 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:78:3
  rcl_clock_change_t_520094544 = enum_rcl_clock_change_e_520094543 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:91:3
  struct_rcl_time_jump_s_520094546 {.pure, inheritable, bycopy.} = object
    clock_change*: rcl_clock_change_t_520094545 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:94:16
    delta*: rcl_duration_t_520094541

  rcl_time_jump_t_520094548 = struct_rcl_time_jump_s_520094547 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:100:3
  rcl_jump_callback_t_520094550 = proc (a0: ptr rcl_time_jump_t_520094549;
                                        a1: bool; a2: pointer): void {.cdecl.} ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:107:17
  struct_rcl_jump_threshold_s_520094552 {.pure, inheritable, bycopy.} = object
    on_clock_change*: bool   ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:113:16
    min_forward*: rcl_duration_t_520094541
    min_backward*: rcl_duration_t_520094541

  rcl_jump_threshold_t_520094554 = struct_rcl_jump_threshold_s_520094553 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:123:3
  struct_rcl_jump_callback_info_s_520094556 {.pure, inheritable, bycopy.} = object
    callback*: rcl_jump_callback_t_520094551 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:126:16
    threshold*: rcl_jump_threshold_t_520094555
    user_data*: pointer

  rcl_jump_callback_info_t_520094558 = struct_rcl_jump_callback_info_s_520094557 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:134:3
  struct_rcl_clock_s_520094560 {.pure, inheritable, bycopy.} = object
    typefield*: rcl_clock_type_t_520094537 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:137:16
    jump_callbacks*: ptr rcl_jump_callback_info_t_520094559
    num_jump_callbacks*: csize_t
    get_now*: proc (a0: pointer; a1: ptr rcl_time_point_value_t_520094531): rcl_ret_t_520094475 {.
        cdecl.}
    data*: pointer
    allocator*: rcl_allocator_t_520094232

  rcl_clock_t_520094562 = struct_rcl_clock_s_520094561 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:152:3
  struct_rcl_time_point_s_520094564 {.pure, inheritable, bycopy.} = object
    nanoseconds*: rcl_time_point_value_t_520094531 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:155:16
    clock_type*: rcl_clock_type_t_520094537

  rcl_time_point_t_520094566 = struct_rcl_time_point_s_520094565 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:161:3
  rcl_publisher_impl_t_520094568 = struct_rcl_publisher_impl_s ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/publisher.h:33:37
  struct_rcl_publisher_s_520094570 {.pure, inheritable, bycopy.} = object
    impl*: ptr rcl_publisher_impl_t_520094569 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/publisher.h:36:16
  
  rcl_publisher_t_520094572 = struct_rcl_publisher_s_520094571 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/publisher.h:40:3
  struct_rcl_publisher_options_s_520094574 {.pure, inheritable, bycopy.} = object
    qos*: rmw_qos_profile_t_520094463 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/publisher.h:43:16
    allocator*: rcl_allocator_t_520094232
    rmw_publisher_options*: rmw_publisher_options_t_520094379

  rcl_publisher_options_t_520094576 = struct_rcl_publisher_options_s_520094575 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/publisher.h:52:3
  rosidl_message_type_support_t_520094578 = struct_rosidl_message_type_support_t_520094683 ## Generated based on /nix/store/l5n428nlcyhhwzxy3s7albghm1xhss0j-rosidl_runtime_c-3.1.4/include/rosidl_runtime_c/rosidl_runtime_c/message_type_support_struct.h:26:46
  rmw_event_callback_t_520094580 = proc (a0: pointer; a1: csize_t): void {.cdecl.} ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/event_callback_type.h:46:17
  rcl_event_callback_t_520094582 = rmw_event_callback_t_520094581 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/event_callback.h:25:30
  struct_rmw_message_sequence_s_520094584 {.pure, inheritable, bycopy.} = object
    data*: ptr pointer       ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/message_sequence.h:30:32
    size*: csize_t
    capacity*: csize_t
    allocator*: ptr rcutils_allocator_t_520094230

  rmw_message_sequence_t_520094586 = struct_rmw_message_sequence_s_520094585 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/message_sequence.h:40:3
  struct_rmw_message_info_sequence_s_520094588 {.pure, inheritable, bycopy.} = object
    data*: ptr rmw_message_info_t_520094471 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/message_sequence.h:43:32
    size*: csize_t
    capacity*: csize_t
    allocator*: ptr rcutils_allocator_t_520094230

  rmw_message_info_sequence_t_520094590 = struct_rmw_message_info_sequence_s_520094589 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/message_sequence.h:53:3
  rcl_subscription_impl_t_520094592 = struct_rcl_subscription_impl_s ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/subscription.h:35:40
  struct_rcl_subscription_s_520094594 {.pure, inheritable, bycopy.} = object
    impl*: ptr rcl_subscription_impl_t_520094593 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/subscription.h:38:16
  
  rcl_subscription_t_520094596 = struct_rcl_subscription_s_520094595 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/subscription.h:42:3
  struct_rcl_subscription_options_s_520094598 {.pure, inheritable, bycopy.} = object
    qos*: rmw_qos_profile_t_520094463 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/subscription.h:45:16
    allocator*: rcl_allocator_t_520094232
    rmw_subscription_options*: rmw_subscription_options_t_520094387

  rcl_subscription_options_t_520094600 = struct_rcl_subscription_options_s_520094599 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/subscription.h:54:3
  struct_rcl_subscription_content_filter_options_s_520094602 {.pure,
      inheritable, bycopy.} = object
    rmw_subscription_content_filter_options*: rmw_subscription_content_filter_options_t_520094355 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/subscription.h:56:16
  
  rcl_subscription_content_filter_options_t_520094604 = struct_rcl_subscription_content_filter_options_s_520094603 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/subscription.h:59:3
  rcl_client_impl_t_520094606 = struct_rcl_client_impl_s ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/client.h:33:34
  struct_rcl_client_s_520094608 {.pure, inheritable, bycopy.} = object
    impl*: ptr rcl_client_impl_t_520094607 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/client.h:36:16
  
  rcl_client_t_520094610 = struct_rcl_client_s_520094609 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/client.h:40:3
  struct_rcl_client_options_s_520094612 {.pure, inheritable, bycopy.} = object
    qos*: rmw_qos_profile_t_520094463 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/client.h:43:16
    allocator*: rcl_allocator_t_520094232

  rcl_client_options_t_520094614 = struct_rcl_client_options_s_520094613 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/client.h:50:3
  rosidl_service_type_support_t_520094616 = struct_rosidl_service_type_support_t_520094685 ## Generated based on /nix/store/l5n428nlcyhhwzxy3s7albghm1xhss0j-rosidl_runtime_c-3.1.4/include/rosidl_runtime_c/rosidl_runtime_c/service_type_support_struct.h:27:46
  rcl_service_impl_t_520094618 = struct_rcl_service_impl_s ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/service.h:33:35
  struct_rcl_service_s_520094620 {.pure, inheritable, bycopy.} = object
    impl*: ptr rcl_service_impl_t_520094619 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/service.h:36:16
  
  rcl_service_t_520094622 = struct_rcl_service_s_520094621 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/service.h:40:3
  struct_rcl_service_options_s_520094624 {.pure, inheritable, bycopy.} = object
    qos*: rmw_qos_profile_t_520094463 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/service.h:43:16
    allocator*: rcl_allocator_t_520094232

  rcl_service_options_t_520094626 = struct_rcl_service_options_s_520094625 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/service.h:50:3
  rmw_event_type_t_520094630 = enum_rmw_event_type_e_520094629 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/event.h:48:3
  struct_rmw_event_s_520094632 {.pure, inheritable, bycopy.} = object
    implementation_identifier*: cstring ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/event.h:51:32
    data*: pointer
    event_type*: rmw_event_type_t_520094631

  rmw_event_t_520094634 = struct_rmw_event_s_520094633 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/event.h:59:3
  rmw_qos_compatibility_type_t_520094638 = enum_rmw_qos_compatibility_type_e_520094637 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/qos_profiles.h:126:3
  rosidl_runtime_c_Sequence_bound_520094640 = struct_rosidl_runtime_c_Sequence_bound_520094687 ## Generated based on /nix/store/l5n428nlcyhhwzxy3s7albghm1xhss0j-rosidl_runtime_c-3.1.4/include/rosidl_runtime_c/rosidl_runtime_c/sequence_bound.h:26:50
  rcl_timer_impl_t_520094642 = struct_rcl_timer_impl_s ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/timer.h:35:33
  struct_rcl_timer_s_520094644 {.pure, inheritable, bycopy.} = object
    impl*: ptr rcl_timer_impl_t_520094643 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/timer.h:38:16
  
  rcl_timer_t_520094646 = struct_rcl_timer_s_520094645 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/timer.h:42:3
  rcl_timer_callback_t_520094648 = proc (a0: ptr rcl_timer_t_520094647;
      a1: int64): void {.cdecl.} ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/timer.h:57:17
  rcl_publisher_event_type_t_520094652 = enum_rcl_publisher_event_type_e_520094651 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/event.h:41:3
  rcl_subscription_event_type_t_520094656 = enum_rcl_subscription_event_type_e_520094655 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/event.h:50:3
  rcl_event_impl_t_520094658 = struct_rcl_event_impl_s ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/event.h:53:33
  struct_rcl_event_s_520094660 {.pure, inheritable, bycopy.} = object
    impl*: ptr rcl_event_impl_t_520094659 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/event.h:56:16
  
  rcl_event_t_520094662 = struct_rcl_event_s_520094661 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/event.h:60:3
  rcl_wait_set_impl_t_520094664 = struct_rcl_wait_set_impl_s ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/wait.h:38:36
  struct_rcl_wait_set_s_520094666 {.pure, inheritable, bycopy.} = object
    subscriptions*: ptr ptr rcl_subscription_t_520094597 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/wait.h:41:16
    size_of_subscriptions*: csize_t
    guard_conditions*: ptr ptr rcl_guard_condition_t_520094515
    size_of_guard_conditions*: csize_t
    timers*: ptr ptr rcl_timer_t_520094647
    size_of_timers*: csize_t
    clients*: ptr ptr rcl_client_t_520094611
    size_of_clients*: csize_t
    services*: ptr ptr rcl_service_t_520094623
    size_of_services*: csize_t
    events*: ptr ptr rcl_event_t_520094663
    size_of_events*: csize_t
    impl*: ptr rcl_wait_set_impl_t_520094665

  rcl_wait_set_t_520094668 = struct_rcl_wait_set_s_520094667 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/wait.h:69:3
  rcl_logging_output_handler_t_520094670 = rcutils_logging_output_handler_t_520094315 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/logging.h:34:42
  rmw_error_string_t_520094672 = rcutils_error_string_t_520094264 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/error_handling.h:34:32
  rmw_error_state_t_520094674 = rcutils_error_state_t_520094268 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/error_handling.h:37:31
  compiler_int_least64_t_520094676 = compiler_int64_t_520094689 ## Generated based on /usr/include/bits/types.h:58:19
  compiler_gnuc_va_list_520094678 = compiler_builtin_va_list ## Generated based on /usr/lib/clang/15.0.7/include/stdarg.h:32:27
  struct_rcl_params_s_520094680 {.pure, inheritable, bycopy.} = object
    node_names*: ptr ptr cschar ## Generated based on /nix/store/4yca7gxc8wbj0d7mw594azdf3i2pck19-rcl_yaml_param_parser-5.3.2/include/rcl_yaml_param_parser/rcl_yaml_param_parser/types.h:102:16
    params*: ptr rcl_node_params_t_520094691
    num_nodes*: csize_t
    capacity_nodes*: csize_t
    allocator*: rcutils_allocator_t_520094230

  struct_rosidl_message_type_support_t_520094682 {.pure, inheritable, bycopy.} = object
    typesupport_identifier*: cstring ## Generated based on /nix/store/l5n428nlcyhhwzxy3s7albghm1xhss0j-rosidl_runtime_c-3.1.4/include/rosidl_runtime_c/rosidl_runtime_c/message_type_support_struct.h:32:8
    data*: pointer
    funcfield*: rosidl_message_typesupport_handle_function_520094693

  struct_rosidl_service_type_support_t_520094684 {.pure, inheritable, bycopy.} = object
    typesupport_identifier*: cstring ## Generated based on /nix/store/l5n428nlcyhhwzxy3s7albghm1xhss0j-rosidl_runtime_c-3.1.4/include/rosidl_runtime_c/rosidl_runtime_c/service_type_support_struct.h:33:8
    data*: pointer
    funcfield*: rosidl_service_typesupport_handle_function_520094695

  struct_rosidl_runtime_c_Sequence_bound_520094686 {.pure, inheritable, bycopy.} = object
    typesupport_identifier*: cstring ## Generated based on /nix/store/l5n428nlcyhhwzxy3s7albghm1xhss0j-rosidl_runtime_c-3.1.4/include/rosidl_runtime_c/rosidl_runtime_c/sequence_bound.h:31:8
    data*: pointer
    funcfield*: rosidl_runtime_c_bound_handle_function_520094697

  compiler_int64_t_520094688 = clong ## Generated based on /usr/include/bits/types.h:44:25
  rcl_node_params_t_520094690 = struct_rcl_node_params_s_520094699 ## Generated based on /nix/store/4yca7gxc8wbj0d7mw594azdf3i2pck19-rcl_yaml_param_parser-5.3.2/include/rcl_yaml_param_parser/rcl_yaml_param_parser/types.h:96:3
  rosidl_message_typesupport_handle_function_520094692 = proc (
      a0: ptr rosidl_message_type_support_t_520094579; a1: cstring): ptr rosidl_message_type_support_t_520094579 {.
      cdecl.}                ## Generated based on /nix/store/l5n428nlcyhhwzxy3s7albghm1xhss0j-rosidl_runtime_c-3.1.4/include/rosidl_runtime_c/rosidl_runtime_c/message_type_support_struct.h:28:50
  rosidl_service_typesupport_handle_function_520094694 = proc (
      a0: ptr rosidl_service_type_support_t_520094617; a1: cstring): ptr rosidl_service_type_support_t_520094617 {.
      cdecl.}                ## Generated based on /nix/store/l5n428nlcyhhwzxy3s7albghm1xhss0j-rosidl_runtime_c-3.1.4/include/rosidl_runtime_c/rosidl_runtime_c/service_type_support_struct.h:29:50
  rosidl_runtime_c_bound_handle_function_520094696 = proc (
      a0: ptr rosidl_runtime_c_Sequence_bound_520094641; a1: cstring): ptr rosidl_runtime_c_Sequence_bound_520094641 {.
      cdecl.}                ## Generated based on /nix/store/l5n428nlcyhhwzxy3s7albghm1xhss0j-rosidl_runtime_c-3.1.4/include/rosidl_runtime_c/rosidl_runtime_c/sequence_bound.h:28:54
  struct_rcl_node_params_s_520094698 {.pure, inheritable, bycopy.} = object
    parameter_names*: ptr ptr cschar ## Generated based on /nix/store/4yca7gxc8wbj0d7mw594azdf3i2pck19-rcl_yaml_param_parser-5.3.2/include/rcl_yaml_param_parser/rcl_yaml_param_parser/types.h:90:16
    parameter_values*: ptr rcl_variant_t_520094701
    num_params*: csize_t
    capacity_params*: csize_t

  rcl_variant_t_520094700 = struct_rcl_variant_s_520094703 ## Generated based on /nix/store/4yca7gxc8wbj0d7mw594azdf3i2pck19-rcl_yaml_param_parser-5.3.2/include/rcl_yaml_param_parser/rcl_yaml_param_parser/types.h:84:3
  struct_rcl_variant_s_520094702 {.pure, inheritable, bycopy.} = object
    bool_value*: ptr bool    ## Generated based on /nix/store/4yca7gxc8wbj0d7mw594azdf3i2pck19-rcl_yaml_param_parser-5.3.2/include/rcl_yaml_param_parser/rcl_yaml_param_parser/types.h:73:16
    integer_value*: ptr int64
    double_value*: ptr cdouble
    string_value*: cstring
    byte_array_value*: ptr rcl_byte_array_t_520094705
    bool_array_value*: ptr rcl_bool_array_t_520094707
    integer_array_value*: ptr rcl_int64_array_t_520094709
    double_array_value*: ptr rcl_double_array_t_520094711
    string_array_value*: ptr rcutils_string_array_t_520094295

  rcl_byte_array_t_520094704 = struct_rcl_byte_array_s_520094713 ## Generated based on /nix/store/4yca7gxc8wbj0d7mw594azdf3i2pck19-rcl_yaml_param_parser-5.3.2/include/rcl_yaml_param_parser/rcl_yaml_param_parser/types.h:66:3
  rcl_bool_array_t_520094706 = struct_rcl_bool_array_s_520094715 ## Generated based on /nix/store/4yca7gxc8wbj0d7mw594azdf3i2pck19-rcl_yaml_param_parser-5.3.2/include/rcl_yaml_param_parser/rcl_yaml_param_parser/types.h:30:3
  rcl_int64_array_t_520094708 = struct_rcl_int64_array_s_520094717 ## Generated based on /nix/store/4yca7gxc8wbj0d7mw594azdf3i2pck19-rcl_yaml_param_parser-5.3.2/include/rcl_yaml_param_parser/rcl_yaml_param_parser/types.h:42:3
  rcl_double_array_t_520094710 = struct_rcl_double_array_s_520094719 ## Generated based on /nix/store/4yca7gxc8wbj0d7mw594azdf3i2pck19-rcl_yaml_param_parser-5.3.2/include/rcl_yaml_param_parser/rcl_yaml_param_parser/types.h:54:3
  struct_rcl_byte_array_s_520094712 {.pure, inheritable, bycopy.} = object
    values*: ptr uint8       ## Generated based on /nix/store/4yca7gxc8wbj0d7mw594azdf3i2pck19-rcl_yaml_param_parser-5.3.2/include/rcl_yaml_param_parser/rcl_yaml_param_parser/types.h:60:16
    size*: csize_t

  struct_rcl_bool_array_s_520094714 {.pure, inheritable, bycopy.} = object
    values*: ptr bool        ## Generated based on /nix/store/4yca7gxc8wbj0d7mw594azdf3i2pck19-rcl_yaml_param_parser-5.3.2/include/rcl_yaml_param_parser/rcl_yaml_param_parser/types.h:24:16
    size*: csize_t

  struct_rcl_int64_array_s_520094716 {.pure, inheritable, bycopy.} = object
    values*: ptr int64       ## Generated based on /nix/store/4yca7gxc8wbj0d7mw594azdf3i2pck19-rcl_yaml_param_parser-5.3.2/include/rcl_yaml_param_parser/rcl_yaml_param_parser/types.h:36:16
    size*: csize_t

  struct_rcl_double_array_s_520094718 {.pure, inheritable, bycopy.} = object
    values*: ptr cdouble     ## Generated based on /nix/store/4yca7gxc8wbj0d7mw594azdf3i2pck19-rcl_yaml_param_parser-5.3.2/include/rcl_yaml_param_parser/rcl_yaml_param_parser/types.h:48:16
    size*: csize_t

  enum_rmw_qos_compatibility_type_e_520094637 = (when declared(
      enum_rmw_qos_compatibility_type_e):
    enum_rmw_qos_compatibility_type_e
   else:
    enum_rmw_qos_compatibility_type_e_520094636)
  struct_rcutils_hash_map_s_520094278 = (when declared(struct_rcutils_hash_map_s):
    struct_rcutils_hash_map_s
   else:
    struct_rcutils_hash_map_s_520094277)
  rmw_time_point_value_t_520094361 = (when declared(rmw_time_point_value_t):
    rmw_time_point_value_t
   else:
    rmw_time_point_value_t_520094360)
  rmw_qos_durability_policy_t_520094455 = (when declared(
      rmw_qos_durability_policy_t):
    rmw_qos_durability_policy_t
   else:
    rmw_qos_durability_policy_t_520094454)
  struct_rmw_publisher_allocation_s_520094405 = (when declared(
      struct_rmw_publisher_allocation_s):
    struct_rmw_publisher_allocation_s
   else:
    struct_rmw_publisher_allocation_s_520094404)
  struct_rcl_service_options_s_520094625 = (when declared(
      struct_rcl_service_options_s):
    struct_rcl_service_options_s
   else:
    struct_rcl_service_options_s_520094624)
  struct_rmw_request_id_s_520094437 = (when declared(struct_rmw_request_id_s):
    struct_rmw_request_id_s
   else:
    struct_rmw_request_id_s_520094436)
  enum_rcl_subscription_event_type_e_520094655 = (when declared(
      enum_rcl_subscription_event_type_e):
    enum_rcl_subscription_event_type_e
   else:
    enum_rcl_subscription_event_type_e_520094654)
  rcl_wait_set_t_520094669 = (when declared(rcl_wait_set_t):
    rcl_wait_set_t
   else:
    rcl_wait_set_t_520094668)
  rmw_event_t_520094635 = (when declared(rmw_event_t):
    rmw_event_t
   else:
    rmw_event_t_520094634)
  struct_rcl_publisher_options_s_520094575 = (when declared(
      struct_rcl_publisher_options_s):
    struct_rcl_publisher_options_s
   else:
    struct_rcl_publisher_options_s_520094574)
  struct_rcl_byte_array_s_520094713 = (when declared(struct_rcl_byte_array_s):
    struct_rcl_byte_array_s
   else:
    struct_rcl_byte_array_s_520094712)
  struct_rmw_wait_set_s_520094433 = (when declared(struct_rmw_wait_set_s):
    struct_rmw_wait_set_s
   else:
    struct_rmw_wait_set_s_520094432)
  struct_rcl_time_jump_s_520094547 = (when declared(struct_rcl_time_jump_s):
    struct_rcl_time_jump_s
   else:
    struct_rcl_time_jump_s_520094546)
  struct_rcl_double_array_s_520094719 = (when declared(struct_rcl_double_array_s):
    struct_rcl_double_array_s
   else:
    struct_rcl_double_array_s_520094718)
  rcl_subscription_options_t_520094601 = (when declared(
      rcl_subscription_options_t):
    rcl_subscription_options_t
   else:
    rcl_subscription_options_t_520094600)
  struct_rmw_subscriptions_s_520094413 = (when declared(
      struct_rmw_subscriptions_s):
    struct_rmw_subscriptions_s
   else:
    struct_rmw_subscriptions_s_520094412)
  struct_rmw_message_lost_status_s_520094339 = (when declared(
      struct_rmw_message_lost_status_s):
    struct_rmw_message_lost_status_s
   else:
    struct_rmw_message_lost_status_s_520094338)
  struct_rcutils_array_list_s_520094270 = (when declared(
      struct_rcutils_array_list_s):
    struct_rcutils_array_list_s
   else:
    struct_rcutils_array_list_s_520094269)
  struct_rosidl_runtime_c_Sequence_bound_520094687 = (when declared(
      struct_rosidl_runtime_c_Sequence_bound):
    struct_rosidl_runtime_c_Sequence_bound
   else:
    struct_rosidl_runtime_c_Sequence_bound_520094686)
  rmw_message_sequence_t_520094587 = (when declared(rmw_message_sequence_t):
    rmw_message_sequence_t
   else:
    rmw_message_sequence_t_520094586)
  rmw_request_id_t_520094439 = (when declared(rmw_request_id_t):
    rmw_request_id_t
   else:
    rmw_request_id_t_520094438)
  rcutils_logging_output_handler_t_520094315 = (when declared(
      rcutils_logging_output_handler_t):
    rcutils_logging_output_handler_t
   else:
    rcutils_logging_output_handler_t_520094314)
  rcl_log_severity_t_520094479 = (when declared(rcl_log_severity_t):
    rcl_log_severity_t
   else:
    rcl_log_severity_t_520094478)
  rcutils_log_location_t_520094311 = (when declared(rcutils_log_location_t):
    rcutils_log_location_t
   else:
    rcutils_log_location_t_520094310)
  rcutils_error_string_t_520094264 = (when declared(rcutils_error_string_t):
    rcutils_error_string_t
   else:
    rcutils_error_string_t_520094263)
  rcl_client_options_t_520094615 = (when declared(rcl_client_options_t):
    rcl_client_options_t
   else:
    rcl_client_options_t_520094614)
  struct_rcl_jump_threshold_s_520094553 = (when declared(
      struct_rcl_jump_threshold_s):
    struct_rcl_jump_threshold_s
   else:
    struct_rcl_jump_threshold_s_520094552)
  struct_rcl_node_options_s_520094521 = (when declared(struct_rcl_node_options_s):
    struct_rcl_node_options_s
   else:
    struct_rcl_node_options_s_520094520)
  compiler_int64_t_520094689 = (when declared(compiler_int64_t):
    compiler_int64_t
   else:
    compiler_int64_t_520094688)
  rcl_guard_condition_impl_t_520094511 = (when declared(
      rcl_guard_condition_impl_t):
    rcl_guard_condition_impl_t
   else:
    rcl_guard_condition_impl_t_520094510)
  compiler_gnuc_va_list_520094679 = (when declared(compiler_gnuc_va_list):
    compiler_gnuc_va_list
   else:
    compiler_gnuc_va_list_520094678)
  rcutils_uint8_array_t_520094303 = (when declared(rcutils_uint8_array_t):
    rcutils_uint8_array_t
   else:
    rcutils_uint8_array_t_520094302)
  rosidl_service_type_support_t_520094617 = (when declared(
      rosidl_service_type_support_t):
    rosidl_service_type_support_t
   else:
    rosidl_service_type_support_t_520094616)
  rcutils_ret_t_520094226 = (when declared(rcutils_ret_t):
    rcutils_ret_t
   else:
    rcutils_ret_t_520094225)
  rmw_guard_condition_t_520094403 = (when declared(rmw_guard_condition_t):
    rmw_guard_condition_t
   else:
    rmw_guard_condition_t_520094402)
  rmw_event_callback_t_520094581 = (when declared(rmw_event_callback_t):
    rmw_event_callback_t
   else:
    rmw_event_callback_t_520094580)
  struct_rcl_event_s_520094661 = (when declared(struct_rcl_event_s):
    struct_rcl_event_s
   else:
    struct_rcl_event_s_520094660)
  rmw_gid_t_520094467 = (when declared(rmw_gid_t):
    rmw_gid_t
   else:
    rmw_gid_t_520094466)
  struct_rcl_time_point_s_520094565 = (when declared(struct_rcl_time_point_s):
    struct_rcl_time_point_s
   else:
    struct_rcl_time_point_s_520094564)
  rcutils_string_map_t_520094299 = (when declared(rcutils_string_map_t):
    rcutils_string_map_t
   else:
    rcutils_string_map_t_520094298)
  rcl_guard_condition_t_520094515 = (when declared(rcl_guard_condition_t):
    rcl_guard_condition_t
   else:
    rcl_guard_condition_t_520094514)
  rmw_init_options_impl_t_520094248 = (when declared(rmw_init_options_impl_t):
    rmw_init_options_impl_t
   else:
    rmw_init_options_impl_t_520094247)
  rmw_liveliness_changed_status_t_520094333 = (when declared(
      rmw_liveliness_changed_status_t):
    rmw_liveliness_changed_status_t
   else:
    rmw_liveliness_changed_status_t_520094332)
  struct_rcl_publisher_s_520094571 = (when declared(struct_rcl_publisher_s):
    struct_rcl_publisher_s
   else:
    struct_rcl_publisher_s_520094570)
  rosidl_message_type_support_t_520094579 = (when declared(
      rosidl_message_type_support_t):
    rosidl_message_type_support_t
   else:
    rosidl_message_type_support_t_520094578)
  rmw_context_impl_t_520094254 = (when declared(rmw_context_impl_t):
    rmw_context_impl_t
   else:
    rmw_context_impl_t_520094253)
  rmw_log_severity_t_520094473 = (when declared(rmw_log_severity_t):
    rmw_log_severity_t
   else:
    rmw_log_severity_t_520094472)
  struct_rcl_log_levels_s_520094485 = (when declared(struct_rcl_log_levels_s):
    struct_rcl_log_levels_s
   else:
    struct_rcl_log_levels_s_520094484)
  rmw_duration_t_520094363 = (when declared(rmw_duration_t):
    rmw_duration_t
   else:
    rmw_duration_t_520094362)
  struct_rmw_subscription_options_s_520094385 = (when declared(
      struct_rmw_subscription_options_s):
    struct_rmw_subscription_options_s
   else:
    struct_rmw_subscription_options_s_520094384)
  rcutils_time_point_value_t_520094305 = (when declared(
      rcutils_time_point_value_t):
    rcutils_time_point_value_t
   else:
    rcutils_time_point_value_t_520094304)
  rcl_clock_change_t_520094545 = (when declared(rcl_clock_change_t):
    rcl_clock_change_t
   else:
    rcl_clock_change_t_520094544)
  struct_rmw_service_info_s_520094441 = (when declared(struct_rmw_service_info_s):
    struct_rmw_service_info_s
   else:
    struct_rmw_service_info_s_520094440)
  rmw_ret_t_520094238 = (when declared(rmw_ret_t):
    rmw_ret_t
   else:
    rmw_ret_t_520094237)
  rcl_jump_callback_t_520094551 = (when declared(rcl_jump_callback_t):
    rcl_jump_callback_t
   else:
    rcl_jump_callback_t_520094550)
  struct_rcl_arguments_s_520094491 = (when declared(struct_rcl_arguments_s):
    struct_rcl_arguments_s
   else:
    struct_rcl_arguments_s_520094490)
  struct_rcl_bool_array_s_520094715 = (when declared(struct_rcl_bool_array_s):
    struct_rcl_bool_array_s
   else:
    struct_rcl_bool_array_s_520094714)
  struct_rmw_security_options_s_520094244 = (when declared(
      struct_rmw_security_options_s):
    struct_rmw_security_options_s
   else:
    struct_rmw_security_options_s_520094243)
  struct_rmw_liveliness_changed_status_s_520094331 = (when declared(
      struct_rmw_liveliness_changed_status_s):
    struct_rmw_liveliness_changed_status_s
   else:
    struct_rmw_liveliness_changed_status_s_520094330)
  struct_rmw_guard_condition_s_520094401 = (when declared(
      struct_rmw_guard_condition_s):
    struct_rmw_guard_condition_s
   else:
    struct_rmw_guard_condition_s_520094400)
  struct_rmw_time_s_520094357 = (when declared(struct_rmw_time_s):
    struct_rmw_time_s
   else:
    struct_rmw_time_s_520094356)
  rcl_time_point_t_520094567 = (when declared(rcl_time_point_t):
    rcl_time_point_t
   else:
    rcl_time_point_t_520094566)
  rcl_allocator_t_520094232 = (when declared(rcl_allocator_t):
    rcl_allocator_t
   else:
    rcl_allocator_t_520094231)
  struct_rosidl_message_type_support_t_520094683 = (when declared(
      struct_rosidl_message_type_support_t):
    struct_rosidl_message_type_support_t
   else:
    struct_rosidl_message_type_support_t_520094682)
  rosidl_message_typesupport_handle_function_520094693 = (when declared(
      rosidl_message_typesupport_handle_function):
    rosidl_message_typesupport_handle_function
   else:
    rosidl_message_typesupport_handle_function_520094692)
  rmw_offered_qos_incompatible_event_status_t_520094329 = (when declared(
      rmw_offered_qos_incompatible_event_status_t):
    rmw_offered_qos_incompatible_event_status_t
   else:
    rmw_offered_qos_incompatible_event_status_t_520094328)
  rmw_wait_set_t_520094435 = (when declared(rmw_wait_set_t):
    rmw_wait_set_t
   else:
    rmw_wait_set_t_520094434)
  struct_rmw_services_s_520094417 = (when declared(struct_rmw_services_s):
    struct_rmw_services_s
   else:
    struct_rmw_services_s_520094416)
  rmw_qos_incompatible_event_status_t_520094325 = (when declared(
      rmw_qos_incompatible_event_status_t):
    rmw_qos_incompatible_event_status_t
   else:
    rmw_qos_incompatible_event_status_t_520094324)
  struct_rcl_init_options_s_520094499 = (when declared(struct_rcl_init_options_s):
    struct_rcl_init_options_s
   else:
    struct_rcl_init_options_s_520094498)
  rcl_wait_set_impl_t_520094665 = (when declared(rcl_wait_set_impl_t):
    rcl_wait_set_impl_t
   else:
    rcl_wait_set_impl_t_520094664)
  rcl_arguments_t_520094493 = (when declared(rcl_arguments_t):
    rcl_arguments_t
   else:
    rcl_arguments_t_520094492)
  rmw_liveliness_lost_status_t_520094337 = (when declared(
      rmw_liveliness_lost_status_t):
    rmw_liveliness_lost_status_t
   else:
    rmw_liveliness_lost_status_t_520094336)
  rmw_subscription_options_t_520094387 = (when declared(
      rmw_subscription_options_t):
    rmw_subscription_options_t
   else:
    rmw_subscription_options_t_520094386)
  struct_rmw_message_sequence_s_520094585 = (when declared(
      struct_rmw_message_sequence_s):
    struct_rmw_message_sequence_s
   else:
    struct_rmw_message_sequence_s_520094584)
  struct_rmw_init_options_s_520094250 = (when declared(struct_rmw_init_options_s):
    struct_rmw_init_options_s
   else:
    struct_rmw_init_options_s_520094249)
  rmw_publisher_allocation_t_520094407 = (when declared(
      rmw_publisher_allocation_t):
    rmw_publisher_allocation_t
   else:
    rmw_publisher_allocation_t_520094406)
  rmw_client_t_520094399 = (when declared(rmw_client_t):
    rmw_client_t
   else:
    rmw_client_t_520094398)
  rcl_timer_callback_t_520094649 = (when declared(rcl_timer_callback_t):
    rcl_timer_callback_t
   else:
    rcl_timer_callback_t_520094648)
  enum_RCUTILS_LOG_SEVERITY_520094313 = (when declared(enum_RCUTILS_LOG_SEVERITY):
    enum_RCUTILS_LOG_SEVERITY
   else:
    enum_RCUTILS_LOG_SEVERITY_520094312)
  rcl_timer_t_520094647 = (when declared(rcl_timer_t):
    rcl_timer_t
   else:
    rcl_timer_t_520094646)
  struct_rmw_subscription_allocation_s_520094409 = (when declared(
      struct_rmw_subscription_allocation_s):
    struct_rmw_subscription_allocation_s
   else:
    struct_rmw_subscription_allocation_s_520094408)
  rcl_bool_array_t_520094707 = (when declared(rcl_bool_array_t):
    rcl_bool_array_t
   else:
    rcl_bool_array_t_520094706)
  struct_rmw_service_s_520094393 = (when declared(struct_rmw_service_s):
    struct_rmw_service_s
   else:
    struct_rmw_service_s_520094392)
  rcl_clock_t_520094563 = (when declared(rcl_clock_t):
    rcl_clock_t
   else:
    rcl_clock_t_520094562)
  rcl_publisher_event_type_t_520094653 = (when declared(
      rcl_publisher_event_type_t):
    rcl_publisher_event_type_t
   else:
    rcl_publisher_event_type_t_520094652)
  struct_rcutils_string_array_s_520094293 = (when declared(
      struct_rcutils_string_array_s):
    struct_rcutils_string_array_s
   else:
    struct_rcutils_string_array_s_520094292)
  rmw_qos_reliability_policy_t_520094447 = (when declared(
      rmw_qos_reliability_policy_t):
    rmw_qos_reliability_policy_t
   else:
    rmw_qos_reliability_policy_t_520094446)
  rmw_error_string_t_520094673 = (when declared(rmw_error_string_t):
    rmw_error_string_t
   else:
    rmw_error_string_t_520094672)
  struct_rcl_int64_array_s_520094717 = (when declared(struct_rcl_int64_array_s):
    struct_rcl_int64_array_s
   else:
    struct_rcl_int64_array_s_520094716)
  enum_rcl_publisher_event_type_e_520094651 = (when declared(
      enum_rcl_publisher_event_type_e):
    enum_rcl_publisher_event_type_e
   else:
    enum_rcl_publisher_event_type_e_520094650)
  enum_rmw_qos_policy_kind_e_520094319 = (when declared(
      enum_rmw_qos_policy_kind_e):
    enum_rmw_qos_policy_kind_e
   else:
    enum_rmw_qos_policy_kind_e_520094318)
  rcl_node_options_t_520094523 = (when declared(rcl_node_options_t):
    rcl_node_options_t
   else:
    rcl_node_options_t_520094522)
  struct_rmw_subscription_s_520094389 = (when declared(struct_rmw_subscription_s):
    struct_rmw_subscription_s
   else:
    struct_rmw_subscription_s_520094388)
  rcl_subscription_impl_t_520094593 = (when declared(rcl_subscription_impl_t):
    rcl_subscription_impl_t
   else:
    rcl_subscription_impl_t_520094592)
  rcl_serialized_message_t_520094477 = (when declared(rcl_serialized_message_t):
    rcl_serialized_message_t
   else:
    rcl_serialized_message_t_520094476)
  struct_rmw_node_s_520094365 = (when declared(struct_rmw_node_s):
    struct_rmw_node_s
   else:
    struct_rmw_node_s_520094364)
  rmw_context_t_520094258 = (when declared(rmw_context_t):
    rmw_context_t
   else:
    rmw_context_t_520094257)
  struct_rcl_logger_setting_s_520094481 = (when declared(
      struct_rcl_logger_setting_s):
    struct_rcl_logger_setting_s
   else:
    struct_rcl_logger_setting_s_520094480)
  struct_rcl_guard_condition_s_520094513 = (when declared(
      struct_rcl_guard_condition_s):
    struct_rcl_guard_condition_s
   else:
    struct_rcl_guard_condition_s_520094512)
  compiler_int_least64_t_520094677 = (when declared(compiler_int_least64_t):
    compiler_int_least64_t
   else:
    compiler_int_least64_t_520094676)
  struct_rmw_subscription_content_filter_options_s_520094353 = (when declared(
      struct_rmw_subscription_content_filter_options_s):
    struct_rmw_subscription_content_filter_options_s
   else:
    struct_rmw_subscription_content_filter_options_s_520094352)
  rcl_publisher_impl_t_520094569 = (when declared(rcl_publisher_impl_t):
    rcl_publisher_impl_t
   else:
    rcl_publisher_impl_t_520094568)
  struct_rcl_variant_s_520094703 = (when declared(struct_rcl_variant_s):
    struct_rcl_variant_s
   else:
    struct_rcl_variant_s_520094702)
  rcutils_string_array_t_520094295 = (when declared(rcutils_string_array_t):
    rcutils_string_array_t
   else:
    rcutils_string_array_t_520094294)
  rmw_subscription_allocation_t_520094411 = (when declared(
      rmw_subscription_allocation_t):
    rmw_subscription_allocation_t
   else:
    rmw_subscription_allocation_t_520094410)
  rcl_subscription_event_type_t_520094657 = (when declared(
      rcl_subscription_event_type_t):
    rcl_subscription_event_type_t
   else:
    rcl_subscription_event_type_t_520094656)
  rmw_qos_history_policy_t_520094451 = (when declared(rmw_qos_history_policy_t):
    rmw_qos_history_policy_t
   else:
    rmw_qos_history_policy_t_520094450)
  rcl_duration_t_520094541 = (when declared(rcl_duration_t):
    rcl_duration_t
   else:
    rcl_duration_t_520094540)
  rmw_security_enforcement_policy_t_520094242 = (when declared(
      rmw_security_enforcement_policy_t):
    rmw_security_enforcement_policy_t
   else:
    rmw_security_enforcement_policy_t_520094241)
  struct_rmw_context_s_520094256 = (when declared(struct_rmw_context_s):
    struct_rmw_context_s
   else:
    struct_rmw_context_s_520094255)
  struct_rcl_subscription_options_s_520094599 = (when declared(
      struct_rcl_subscription_options_s):
    struct_rcl_subscription_options_s
   else:
    struct_rcl_subscription_options_s_520094598)
  rmw_publisher_options_t_520094379 = (when declared(rmw_publisher_options_t):
    rmw_publisher_options_t
   else:
    rmw_publisher_options_t_520094378)
  rmw_requested_qos_incompatible_event_status_t_520094327 = (when declared(
      rmw_requested_qos_incompatible_event_status_t):
    rmw_requested_qos_incompatible_event_status_t
   else:
    rmw_requested_qos_incompatible_event_status_t_520094326)
  rmw_qos_liveliness_policy_t_520094459 = (when declared(
      rmw_qos_liveliness_policy_t):
    rmw_qos_liveliness_policy_t
   else:
    rmw_qos_liveliness_policy_t_520094458)
  enum_rmw_security_enforcement_policy_e_520094240 = (when declared(
      enum_rmw_security_enforcement_policy_e):
    enum_rmw_security_enforcement_policy_e
   else:
    enum_rmw_security_enforcement_policy_e_520094239)
  rcl_subscription_content_filter_options_t_520094605 = (when declared(
      rcl_subscription_content_filter_options_t):
    rcl_subscription_content_filter_options_t
   else:
    rcl_subscription_content_filter_options_t_520094604)
  rmw_event_type_t_520094631 = (when declared(rmw_event_type_t):
    rmw_event_type_t
   else:
    rmw_event_type_t_520094630)
  struct_rcl_guard_condition_options_s_520094517 = (when declared(
      struct_rcl_guard_condition_options_s):
    struct_rcl_guard_condition_options_s
   else:
    struct_rcl_guard_condition_options_s_520094516)
  struct_rcutils_uint8_array_s_520094301 = (when declared(
      struct_rcutils_uint8_array_s):
    struct_rcutils_uint8_array_s
   else:
    struct_rcutils_uint8_array_s_520094300)
  rcl_client_impl_t_520094607 = (when declared(rcl_client_impl_t):
    rcl_client_impl_t
   else:
    rcl_client_impl_t_520094606)
  struct_rcl_wait_set_s_520094667 = (when declared(struct_rcl_wait_set_s):
    struct_rcl_wait_set_s
   else:
    struct_rcl_wait_set_s_520094666)
  rosidl_service_typesupport_handle_function_520094695 = (when declared(
      rosidl_service_typesupport_handle_function):
    rosidl_service_typesupport_handle_function
   else:
    rosidl_service_typesupport_handle_function_520094694)
  rmw_service_info_t_520094443 = (when declared(rmw_service_info_t):
    rmw_service_info_t
   else:
    rmw_service_info_t_520094442)
  rmw_unique_network_flow_endpoints_requirement_t_520094375 = (when declared(
      rmw_unique_network_flow_endpoints_requirement_t):
    rmw_unique_network_flow_endpoints_requirement_t
   else:
    rmw_unique_network_flow_endpoints_requirement_t_520094374)
  rcl_byte_array_t_520094705 = (when declared(rcl_byte_array_t):
    rcl_byte_array_t
   else:
    rcl_byte_array_t_520094704)
  struct_rcutils_log_location_s_520094309 = (when declared(
      struct_rcutils_log_location_s):
    struct_rcutils_log_location_s
   else:
    struct_rcutils_log_location_s_520094308)
  rcutils_array_list_t_520094272 = (when declared(rcutils_array_list_t):
    rcutils_array_list_t
   else:
    rcutils_array_list_t_520094271)
  rmw_time_t_520094359 = (when declared(rmw_time_t):
    rmw_time_t
   else:
    rmw_time_t_520094358)
  struct_rmw_liveliness_lost_status_s_520094335 = (when declared(
      struct_rmw_liveliness_lost_status_s):
    struct_rmw_liveliness_lost_status_s
   else:
    struct_rmw_liveliness_lost_status_s_520094334)
  rmw_offered_deadline_missed_status_t_520094345 = (when declared(
      rmw_offered_deadline_missed_status_t):
    rmw_offered_deadline_missed_status_t
   else:
    rmw_offered_deadline_missed_status_t_520094344)
  enum_rmw_qos_reliability_policy_e_520094445 = (when declared(
      enum_rmw_qos_reliability_policy_e):
    enum_rmw_qos_reliability_policy_e
   else:
    enum_rmw_qos_reliability_policy_e_520094444)
  struct_rcl_timer_s_520094645 = (when declared(struct_rcl_timer_s):
    struct_rcl_timer_s
   else:
    struct_rcl_timer_s_520094644)
  rcl_node_impl_t_520094525 = (when declared(rcl_node_impl_t):
    rcl_node_impl_t
   else:
    rcl_node_impl_t_520094524)
  struct_rcl_client_options_s_520094613 = (when declared(
      struct_rcl_client_options_s):
    struct_rcl_client_options_s
   else:
    struct_rcl_client_options_s_520094612)
  rmw_events_t_520094427 = (when declared(rmw_events_t):
    rmw_events_t
   else:
    rmw_events_t_520094426)
  rcl_publisher_options_t_520094577 = (when declared(rcl_publisher_options_t):
    rcl_publisher_options_t
   else:
    rcl_publisher_options_t_520094576)
  rcl_node_params_t_520094691 = (when declared(rcl_node_params_t):
    rcl_node_params_t
   else:
    rcl_node_params_t_520094690)
  rcl_params_t_520094495 = (when declared(rcl_params_t):
    rcl_params_t
   else:
    rcl_params_t_520094494)
  rmw_guard_conditions_t_520094431 = (when declared(rmw_guard_conditions_t):
    rmw_guard_conditions_t
   else:
    rmw_guard_conditions_t_520094430)
  rcl_arguments_impl_t_520094489 = (when declared(rcl_arguments_impl_t):
    rcl_arguments_impl_t
   else:
    rcl_arguments_impl_t_520094488)
  rcl_subscription_t_520094597 = (when declared(rcl_subscription_t):
    rcl_subscription_t
   else:
    rcl_subscription_t_520094596)
  rcl_int64_array_t_520094709 = (when declared(rcl_int64_array_t):
    rcl_int64_array_t
   else:
    rcl_int64_array_t_520094708)
  rcl_context_impl_t_520094505 = (when declared(rcl_context_impl_t):
    rcl_context_impl_t
   else:
    rcl_context_impl_t_520094504)
  int_least64_t_520094260 = (when declared(int_least64_t):
    int_least64_t
   else:
    int_least64_t_520094259)
  struct_rmw_message_info_s_520094469 = (when declared(struct_rmw_message_info_s):
    struct_rmw_message_info_s
   else:
    struct_rmw_message_info_s_520094468)
  rcl_jump_threshold_t_520094555 = (when declared(rcl_jump_threshold_t):
    rcl_jump_threshold_t
   else:
    rcl_jump_threshold_t_520094554)
  struct_rmw_gid_s_520094465 = (when declared(struct_rmw_gid_s):
    struct_rmw_gid_s
   else:
    struct_rmw_gid_s_520094464)
  struct_rmw_publisher_options_s_520094377 = (when declared(
      struct_rmw_publisher_options_s):
    struct_rmw_publisher_options_s
   else:
    struct_rmw_publisher_options_s_520094376)
  struct_rcl_jump_callback_info_s_520094557 = (when declared(
      struct_rcl_jump_callback_info_s):
    struct_rcl_jump_callback_info_s
   else:
    struct_rcl_jump_callback_info_s_520094556)
  rmw_error_state_t_520094675 = (when declared(rmw_error_state_t):
    rmw_error_state_t
   else:
    rmw_error_state_t_520094674)
  struct_rcutils_char_array_s_520094274 = (when declared(
      struct_rcutils_char_array_s):
    struct_rcutils_char_array_s
   else:
    struct_rcutils_char_array_s_520094273)
  rcutils_allocator_t_520094230 = (when declared(rcutils_allocator_t):
    rcutils_allocator_t
   else:
    rcutils_allocator_t_520094229)
  va_list_520094317 = (when declared(va_list):
    va_list
   else:
    va_list_520094316)
  rcutils_hash_map_key_cmp_t_520094291 = (when declared(
      rcutils_hash_map_key_cmp_t):
    rcutils_hash_map_key_cmp_t
   else:
    rcutils_hash_map_key_cmp_t_520094290)
  struct_rcl_subscription_content_filter_options_s_520094603 = (when declared(
      struct_rcl_subscription_content_filter_options_s):
    struct_rcl_subscription_content_filter_options_s
   else:
    struct_rcl_subscription_content_filter_options_s_520094602)
  rcl_timer_impl_t_520094643 = (when declared(rcl_timer_impl_t):
    rcl_timer_impl_t
   else:
    rcl_timer_impl_t_520094642)
  struct_rcl_node_params_s_520094699 = (when declared(struct_rcl_node_params_s):
    struct_rcl_node_params_s
   else:
    struct_rcl_node_params_s_520094698)
  rcl_variant_t_520094701 = (when declared(rcl_variant_t):
    rcl_variant_t
   else:
    rcl_variant_t_520094700)
  rmw_serialized_message_t_520094351 = (when declared(rmw_serialized_message_t):
    rmw_serialized_message_t
   else:
    rmw_serialized_message_t_520094350)
  rmw_qos_compatibility_type_t_520094639 = (when declared(
      rmw_qos_compatibility_type_t):
    rmw_qos_compatibility_type_t
   else:
    rmw_qos_compatibility_type_t_520094638)
  struct_rmw_qos_incompatible_event_status_s_520094323 = (when declared(
      struct_rmw_qos_incompatible_event_status_s):
    struct_rmw_qos_incompatible_event_status_s
   else:
    struct_rmw_qos_incompatible_event_status_s_520094322)
  struct_rmw_offered_deadline_missed_status_s_520094343 = (when declared(
      struct_rmw_offered_deadline_missed_status_s):
    struct_rmw_offered_deadline_missed_status_s
   else:
    struct_rmw_offered_deadline_missed_status_s_520094342)
  rcl_event_t_520094663 = (when declared(rcl_event_t):
    rcl_event_t
   else:
    rcl_event_t_520094662)
  struct_rcutils_error_state_s_520094266 = (when declared(
      struct_rcutils_error_state_s):
    struct_rcutils_error_state_s
   else:
    struct_rcutils_error_state_s_520094265)
  rmw_message_info_sequence_t_520094591 = (when declared(
      rmw_message_info_sequence_t):
    rmw_message_info_sequence_t
   else:
    rmw_message_info_sequence_t_520094590)
  rcl_event_callback_t_520094583 = (when declared(rcl_event_callback_t):
    rcl_event_callback_t
   else:
    rcl_event_callback_t_520094582)
  enum_rmw_endpoint_type_e_520094369 = (when declared(enum_rmw_endpoint_type_e):
    enum_rmw_endpoint_type_e
   else:
    enum_rmw_endpoint_type_e_520094368)
  rcl_time_jump_t_520094549 = (when declared(rcl_time_jump_t):
    rcl_time_jump_t
   else:
    rcl_time_jump_t_520094548)
  struct_rmw_publisher_s_520094381 = (when declared(struct_rmw_publisher_s):
    struct_rmw_publisher_s
   else:
    struct_rmw_publisher_s_520094380)
  struct_rmw_events_s_520094425 = (when declared(struct_rmw_events_s):
    struct_rmw_events_s
   else:
    struct_rmw_events_s_520094424)
  enum_rmw_qos_liveliness_policy_e_520094457 = (when declared(
      enum_rmw_qos_liveliness_policy_e):
    enum_rmw_qos_liveliness_policy_e
   else:
    enum_rmw_qos_liveliness_policy_e_520094456)
  rmw_message_info_t_520094471 = (when declared(rmw_message_info_t):
    rmw_message_info_t
   else:
    rmw_message_info_t_520094470)
  rcl_service_options_t_520094627 = (when declared(rcl_service_options_t):
    rcl_service_options_t
   else:
    rcl_service_options_t_520094626)
  rmw_subscriptions_t_520094415 = (when declared(rmw_subscriptions_t):
    rmw_subscriptions_t
   else:
    rmw_subscriptions_t_520094414)
  rmw_clients_t_520094423 = (when declared(rmw_clients_t):
    rmw_clients_t
   else:
    rmw_clients_t_520094422)
  struct_rmw_event_s_520094633 = (when declared(struct_rmw_event_s):
    struct_rmw_event_s
   else:
    struct_rmw_event_s_520094632)
  enum_rcl_clock_type_e_520094535 = (when declared(enum_rcl_clock_type_e):
    enum_rcl_clock_type_e
   else:
    enum_rcl_clock_type_e_520094534)
  rcl_context_t_520094509 = (when declared(rcl_context_t):
    rcl_context_t
   else:
    rcl_context_t_520094508)
  struct_rmw_client_s_520094397 = (when declared(struct_rmw_client_s):
    struct_rmw_client_s
   else:
    struct_rmw_client_s_520094396)
  struct_rmw_qos_profile_s_520094461 = (when declared(struct_rmw_qos_profile_s):
    struct_rmw_qos_profile_s
   else:
    struct_rmw_qos_profile_s_520094460)
  struct_rcl_context_s_520094507 = (when declared(struct_rcl_context_s):
    struct_rcl_context_s
   else:
    struct_rcl_context_s_520094506)
  rcl_jump_callback_info_t_520094559 = (when declared(rcl_jump_callback_info_t):
    rcl_jump_callback_info_t
   else:
    rcl_jump_callback_info_t_520094558)
  rcl_service_impl_t_520094619 = (when declared(rcl_service_impl_t):
    rcl_service_impl_t
   else:
    rcl_service_impl_t_520094618)
  rcl_event_impl_t_520094659 = (when declared(rcl_event_impl_t):
    rcl_event_impl_t
   else:
    rcl_event_impl_t_520094658)
  rcl_ret_t_520094475 = (when declared(rcl_ret_t):
    rcl_ret_t
   else:
    rcl_ret_t_520094474)
  struct_rmw_requested_deadline_missed_status_s_520094347 = (when declared(
      struct_rmw_requested_deadline_missed_status_s):
    struct_rmw_requested_deadline_missed_status_s
   else:
    struct_rmw_requested_deadline_missed_status_s_520094346)
  struct_rcl_service_s_520094621 = (when declared(struct_rcl_service_s):
    struct_rcl_service_s
   else:
    struct_rcl_service_s_520094620)
  rcutils_char_array_t_520094276 = (when declared(rcutils_char_array_t):
    rcutils_char_array_t
   else:
    rcutils_char_array_t_520094275)
  struct_rcl_clock_s_520094561 = (when declared(struct_rcl_clock_s):
    struct_rcl_clock_s
   else:
    struct_rcl_clock_s_520094560)
  rmw_service_t_520094395 = (when declared(rmw_service_t):
    rmw_service_t
   else:
    rmw_service_t_520094394)
  rcl_context_instance_id_t_520094503 = (when declared(rcl_context_instance_id_t):
    rcl_context_instance_id_t
   else:
    rcl_context_instance_id_t_520094502)
  rmw_message_lost_status_t_520094341 = (when declared(rmw_message_lost_status_t):
    rmw_message_lost_status_t
   else:
    rmw_message_lost_status_t_520094340)
  struct_rcutils_string_map_s_520094297 = (when declared(
      struct_rcutils_string_map_s):
    struct_rcutils_string_map_s
   else:
    struct_rcutils_string_map_s_520094296)
  enum_rmw_unique_network_flow_endpoints_requirement_e_520094373 = (when declared(
      enum_rmw_unique_network_flow_endpoints_requirement_e):
    enum_rmw_unique_network_flow_endpoints_requirement_e
   else:
    enum_rmw_unique_network_flow_endpoints_requirement_e_520094372)
  rcutils_duration_value_t_520094307 = (when declared(rcutils_duration_value_t):
    rcutils_duration_value_t
   else:
    rcutils_duration_value_t_520094306)
  rcl_log_levels_t_520094487 = (when declared(rcl_log_levels_t):
    rcl_log_levels_t
   else:
    rcl_log_levels_t_520094486)
  rosidl_runtime_c_bound_handle_function_520094697 = (when declared(
      rosidl_runtime_c_bound_handle_function):
    rosidl_runtime_c_bound_handle_function
   else:
    rosidl_runtime_c_bound_handle_function_520094696)
  rmw_requested_deadline_missed_status_t_520094349 = (when declared(
      rmw_requested_deadline_missed_status_t):
    rmw_requested_deadline_missed_status_t
   else:
    rmw_requested_deadline_missed_status_t_520094348)
  rcl_node_t_520094529 = (when declared(rcl_node_t):
    rcl_node_t
   else:
    rcl_node_t_520094528)
  rcl_client_t_520094611 = (when declared(rcl_client_t):
    rcl_client_t
   else:
    rcl_client_t_520094610)
  rcutils_hash_map_key_hasher_t_520094289 = (when declared(
      rcutils_hash_map_key_hasher_t):
    rcutils_hash_map_key_hasher_t
   else:
    rcutils_hash_map_key_hasher_t_520094288)
  struct_rcl_params_s_520094681 = (when declared(struct_rcl_params_s):
    struct_rcl_params_s
   else:
    struct_rcl_params_s_520094680)
  struct_rcutils_error_string_s_520094262 = (when declared(
      struct_rcutils_error_string_s):
    struct_rcutils_error_string_s
   else:
    struct_rcutils_error_string_s_520094261)
  rcl_logger_setting_t_520094483 = (when declared(rcl_logger_setting_t):
    rcl_logger_setting_t
   else:
    rcl_logger_setting_t_520094482)
  struct_rcl_node_s_520094527 = (when declared(struct_rcl_node_s):
    struct_rcl_node_s
   else:
    struct_rcl_node_s_520094526)
  rcl_clock_type_t_520094537 = (when declared(rcl_clock_type_t):
    rcl_clock_type_t
   else:
    rcl_clock_type_t_520094536)
  enum_rmw_event_type_e_520094629 = (when declared(enum_rmw_event_type_e):
    enum_rmw_event_type_e
   else:
    enum_rmw_event_type_e_520094628)
  struct_rosidl_service_type_support_t_520094685 = (when declared(
      struct_rosidl_service_type_support_t):
    struct_rosidl_service_type_support_t
   else:
    struct_rosidl_service_type_support_t_520094684)
  rcl_double_array_t_520094711 = (when declared(rcl_double_array_t):
    rcl_double_array_t
   else:
    rcl_double_array_t_520094710)
  rmw_init_options_t_520094252 = (when declared(rmw_init_options_t):
    rmw_init_options_t
   else:
    rmw_init_options_t_520094251)
  rcl_logging_output_handler_t_520094671 = (when declared(
      rcl_logging_output_handler_t):
    rcl_logging_output_handler_t
   else:
    rcl_logging_output_handler_t_520094670)
  struct_rcl_duration_s_520094539 = (when declared(struct_rcl_duration_s):
    struct_rcl_duration_s
   else:
    struct_rcl_duration_s_520094538)
  rcl_publisher_t_520094573 = (when declared(rcl_publisher_t):
    rcl_publisher_t
   else:
    rcl_publisher_t_520094572)
  struct_rcl_subscription_s_520094595 = (when declared(struct_rcl_subscription_s):
    struct_rcl_subscription_s
   else:
    struct_rcl_subscription_s_520094594)
  rcutils_error_state_t_520094268 = (when declared(rcutils_error_state_t):
    rcutils_error_state_t
   else:
    rcutils_error_state_t_520094267)
  rcl_service_t_520094623 = (when declared(rcl_service_t):
    rcl_service_t
   else:
    rcl_service_t_520094622)
  rmw_qos_policy_kind_t_520094321 = (when declared(rmw_qos_policy_kind_t):
    rmw_qos_policy_kind_t
   else:
    rmw_qos_policy_kind_t_520094320)
  rmw_node_t_520094367 = (when declared(rmw_node_t):
    rmw_node_t
   else:
    rmw_node_t_520094366)
  struct_rmw_guard_conditions_s_520094429 = (when declared(
      struct_rmw_guard_conditions_s):
    struct_rmw_guard_conditions_s
   else:
    struct_rmw_guard_conditions_s_520094428)
  rmw_localhost_only_t_520094236 = (when declared(rmw_localhost_only_t):
    rmw_localhost_only_t
   else:
    rmw_localhost_only_t_520094235)
  enum_rcl_clock_change_e_520094543 = (when declared(enum_rcl_clock_change_e):
    enum_rcl_clock_change_e
   else:
    enum_rcl_clock_change_e_520094542)
  rosidl_runtime_c_Sequence_bound_520094641 = (when declared(
      rosidl_runtime_c_Sequence_bound):
    rosidl_runtime_c_Sequence_bound
   else:
    rosidl_runtime_c_Sequence_bound_520094640)
  rcl_init_options_t_520094501 = (when declared(rcl_init_options_t):
    rcl_init_options_t
   else:
    rcl_init_options_t_520094500)
  rmw_subscription_content_filter_options_t_520094355 = (when declared(
      rmw_subscription_content_filter_options_t):
    rmw_subscription_content_filter_options_t
   else:
    rmw_subscription_content_filter_options_t_520094354)
  struct_rmw_clients_s_520094421 = (when declared(struct_rmw_clients_s):
    struct_rmw_clients_s
   else:
    struct_rmw_clients_s_520094420)
  rcl_guard_condition_options_t_520094519 = (when declared(
      rcl_guard_condition_options_t):
    rcl_guard_condition_options_t
   else:
    rcl_guard_condition_options_t_520094518)
  enum_rmw_qos_history_policy_e_520094449 = (when declared(
      enum_rmw_qos_history_policy_e):
    enum_rmw_qos_history_policy_e
   else:
    enum_rmw_qos_history_policy_e_520094448)
  rmw_endpoint_type_t_520094371 = (when declared(rmw_endpoint_type_t):
    rmw_endpoint_type_t
   else:
    rmw_endpoint_type_t_520094370)
  struct_rcl_client_s_520094609 = (when declared(struct_rcl_client_s):
    struct_rcl_client_s
   else:
    struct_rcl_client_s_520094608)
  rcl_init_options_impl_t_520094497 = (when declared(rcl_init_options_impl_t):
    rcl_init_options_impl_t
   else:
    rcl_init_options_impl_t_520094496)
  rcutils_hash_map_t_520094287 = (when declared(rcutils_hash_map_t):
    rcutils_hash_map_t
   else:
    rcutils_hash_map_t_520094286)
  rmw_qos_profile_t_520094463 = (when declared(rmw_qos_profile_t):
    rmw_qos_profile_t
   else:
    rmw_qos_profile_t_520094462)
  rmw_subscription_t_520094391 = (when declared(rmw_subscription_t):
    rmw_subscription_t
   else:
    rmw_subscription_t_520094390)
  rmw_publisher_t_520094383 = (when declared(rmw_publisher_t):
    rmw_publisher_t
   else:
    rmw_publisher_t_520094382)
  enum_rmw_localhost_only_e_520094234 = (when declared(enum_rmw_localhost_only_e):
    enum_rmw_localhost_only_e
   else:
    enum_rmw_localhost_only_e_520094233)
  struct_rmw_message_info_sequence_s_520094589 = (when declared(
      struct_rmw_message_info_sequence_s):
    struct_rmw_message_info_sequence_s
   else:
    struct_rmw_message_info_sequence_s_520094588)
  rmw_security_options_t_520094246 = (when declared(rmw_security_options_t):
    rmw_security_options_t
   else:
    rmw_security_options_t_520094245)
  rcl_time_point_value_t_520094531 = (when declared(rcl_time_point_value_t):
    rcl_time_point_value_t
   else:
    rcl_time_point_value_t_520094530)
  rcl_duration_value_t_520094533 = (when declared(rcl_duration_value_t):
    rcl_duration_value_t
   else:
    rcl_duration_value_t_520094532)
  rmw_services_t_520094419 = (when declared(rmw_services_t):
    rmw_services_t
   else:
    rmw_services_t_520094418)
  enum_rmw_qos_durability_policy_e_520094453 = (when declared(
      enum_rmw_qos_durability_policy_e):
    enum_rmw_qos_durability_policy_e
   else:
    enum_rmw_qos_durability_policy_e_520094452)
  struct_rcutils_allocator_s_520094228 = (when declared(
      struct_rcutils_allocator_s):
    struct_rcutils_allocator_s
   else:
    struct_rcutils_allocator_s_520094227)
when not declared(struct_rcutils_hash_map_s):
  type
    struct_rcutils_hash_map_s* = struct_rcutils_hash_map_s_520094277
else:
  static :
    hint("Declaration of " & "struct_rcutils_hash_map_s" &
        " already exists, not redeclaring")
when not declared(rmw_time_point_value_t):
  type
    rmw_time_point_value_t* = rmw_time_point_value_t_520094360
else:
  static :
    hint("Declaration of " & "rmw_time_point_value_t" &
        " already exists, not redeclaring")
when not declared(rmw_qos_durability_policy_t):
  type
    rmw_qos_durability_policy_t* = rmw_qos_durability_policy_t_520094454
else:
  static :
    hint("Declaration of " & "rmw_qos_durability_policy_t" &
        " already exists, not redeclaring")
when not declared(struct_rmw_publisher_allocation_s):
  type
    struct_rmw_publisher_allocation_s* = struct_rmw_publisher_allocation_s_520094404
else:
  static :
    hint("Declaration of " & "struct_rmw_publisher_allocation_s" &
        " already exists, not redeclaring")
when not declared(struct_rcl_service_options_s):
  type
    struct_rcl_service_options_s* = struct_rcl_service_options_s_520094624
else:
  static :
    hint("Declaration of " & "struct_rcl_service_options_s" &
        " already exists, not redeclaring")
when not declared(struct_rmw_request_id_s):
  type
    struct_rmw_request_id_s* = struct_rmw_request_id_s_520094436
else:
  static :
    hint("Declaration of " & "struct_rmw_request_id_s" &
        " already exists, not redeclaring")
when not declared(rcl_wait_set_t):
  type
    rcl_wait_set_t* = rcl_wait_set_t_520094668
else:
  static :
    hint("Declaration of " & "rcl_wait_set_t" &
        " already exists, not redeclaring")
when not declared(rmw_event_t):
  type
    rmw_event_t* = rmw_event_t_520094634
else:
  static :
    hint("Declaration of " & "rmw_event_t" & " already exists, not redeclaring")
when not declared(struct_rcl_publisher_options_s):
  type
    struct_rcl_publisher_options_s* = struct_rcl_publisher_options_s_520094574
else:
  static :
    hint("Declaration of " & "struct_rcl_publisher_options_s" &
        " already exists, not redeclaring")
when not declared(struct_rcl_byte_array_s):
  type
    struct_rcl_byte_array_s* = struct_rcl_byte_array_s_520094712
else:
  static :
    hint("Declaration of " & "struct_rcl_byte_array_s" &
        " already exists, not redeclaring")
when not declared(struct_rmw_wait_set_s):
  type
    struct_rmw_wait_set_s* = struct_rmw_wait_set_s_520094432
else:
  static :
    hint("Declaration of " & "struct_rmw_wait_set_s" &
        " already exists, not redeclaring")
when not declared(struct_rcl_time_jump_s):
  type
    struct_rcl_time_jump_s* = struct_rcl_time_jump_s_520094546
else:
  static :
    hint("Declaration of " & "struct_rcl_time_jump_s" &
        " already exists, not redeclaring")
when not declared(struct_rcl_double_array_s):
  type
    struct_rcl_double_array_s* = struct_rcl_double_array_s_520094718
else:
  static :
    hint("Declaration of " & "struct_rcl_double_array_s" &
        " already exists, not redeclaring")
when not declared(rcl_subscription_options_t):
  type
    rcl_subscription_options_t* = rcl_subscription_options_t_520094600
else:
  static :
    hint("Declaration of " & "rcl_subscription_options_t" &
        " already exists, not redeclaring")
when not declared(struct_rmw_subscriptions_s):
  type
    struct_rmw_subscriptions_s* = struct_rmw_subscriptions_s_520094412
else:
  static :
    hint("Declaration of " & "struct_rmw_subscriptions_s" &
        " already exists, not redeclaring")
when not declared(struct_rmw_message_lost_status_s):
  type
    struct_rmw_message_lost_status_s* = struct_rmw_message_lost_status_s_520094338
else:
  static :
    hint("Declaration of " & "struct_rmw_message_lost_status_s" &
        " already exists, not redeclaring")
when not declared(struct_rcutils_array_list_s):
  type
    struct_rcutils_array_list_s* = struct_rcutils_array_list_s_520094269
else:
  static :
    hint("Declaration of " & "struct_rcutils_array_list_s" &
        " already exists, not redeclaring")
when not declared(struct_rosidl_runtime_c_Sequence_bound):
  type
    struct_rosidl_runtime_c_Sequence_bound* = struct_rosidl_runtime_c_Sequence_bound_520094686
else:
  static :
    hint("Declaration of " & "struct_rosidl_runtime_c_Sequence_bound" &
        " already exists, not redeclaring")
when not declared(rmw_message_sequence_t):
  type
    rmw_message_sequence_t* = rmw_message_sequence_t_520094586
else:
  static :
    hint("Declaration of " & "rmw_message_sequence_t" &
        " already exists, not redeclaring")
when not declared(rmw_request_id_t):
  type
    rmw_request_id_t* = rmw_request_id_t_520094438
else:
  static :
    hint("Declaration of " & "rmw_request_id_t" &
        " already exists, not redeclaring")
when not declared(rcutils_logging_output_handler_t):
  type
    rcutils_logging_output_handler_t* = rcutils_logging_output_handler_t_520094314
else:
  static :
    hint("Declaration of " & "rcutils_logging_output_handler_t" &
        " already exists, not redeclaring")
when not declared(rcl_log_severity_t):
  type
    rcl_log_severity_t* = rcl_log_severity_t_520094478
else:
  static :
    hint("Declaration of " & "rcl_log_severity_t" &
        " already exists, not redeclaring")
when not declared(rcutils_log_location_t):
  type
    rcutils_log_location_t* = rcutils_log_location_t_520094310
else:
  static :
    hint("Declaration of " & "rcutils_log_location_t" &
        " already exists, not redeclaring")
when not declared(rcutils_error_string_t):
  type
    rcutils_error_string_t* = rcutils_error_string_t_520094263
else:
  static :
    hint("Declaration of " & "rcutils_error_string_t" &
        " already exists, not redeclaring")
when not declared(rcl_client_options_t):
  type
    rcl_client_options_t* = rcl_client_options_t_520094614
else:
  static :
    hint("Declaration of " & "rcl_client_options_t" &
        " already exists, not redeclaring")
when not declared(struct_rcl_jump_threshold_s):
  type
    struct_rcl_jump_threshold_s* = struct_rcl_jump_threshold_s_520094552
else:
  static :
    hint("Declaration of " & "struct_rcl_jump_threshold_s" &
        " already exists, not redeclaring")
when not declared(struct_rcl_node_options_s):
  type
    struct_rcl_node_options_s* = struct_rcl_node_options_s_520094520
else:
  static :
    hint("Declaration of " & "struct_rcl_node_options_s" &
        " already exists, not redeclaring")
when not declared(compiler_int64_t):
  type
    compiler_int64_t* = compiler_int64_t_520094688
else:
  static :
    hint("Declaration of " & "compiler_int64_t" &
        " already exists, not redeclaring")
when not declared(rcl_guard_condition_impl_t):
  type
    rcl_guard_condition_impl_t* = rcl_guard_condition_impl_t_520094510
else:
  static :
    hint("Declaration of " & "rcl_guard_condition_impl_t" &
        " already exists, not redeclaring")
when not declared(compiler_gnuc_va_list):
  type
    compiler_gnuc_va_list* = compiler_gnuc_va_list_520094678
else:
  static :
    hint("Declaration of " & "compiler_gnuc_va_list" &
        " already exists, not redeclaring")
when not declared(rcutils_uint8_array_t):
  type
    rcutils_uint8_array_t* = rcutils_uint8_array_t_520094302
else:
  static :
    hint("Declaration of " & "rcutils_uint8_array_t" &
        " already exists, not redeclaring")
when not declared(rosidl_service_type_support_t):
  type
    rosidl_service_type_support_t* = rosidl_service_type_support_t_520094616
else:
  static :
    hint("Declaration of " & "rosidl_service_type_support_t" &
        " already exists, not redeclaring")
when not declared(rcutils_ret_t):
  type
    rcutils_ret_t* = rcutils_ret_t_520094225
else:
  static :
    hint("Declaration of " & "rcutils_ret_t" &
        " already exists, not redeclaring")
when not declared(rmw_guard_condition_t):
  type
    rmw_guard_condition_t* = rmw_guard_condition_t_520094402
else:
  static :
    hint("Declaration of " & "rmw_guard_condition_t" &
        " already exists, not redeclaring")
when not declared(rmw_event_callback_t):
  type
    rmw_event_callback_t* = rmw_event_callback_t_520094580
else:
  static :
    hint("Declaration of " & "rmw_event_callback_t" &
        " already exists, not redeclaring")
when not declared(struct_rcl_event_s):
  type
    struct_rcl_event_s* = struct_rcl_event_s_520094660
else:
  static :
    hint("Declaration of " & "struct_rcl_event_s" &
        " already exists, not redeclaring")
when not declared(rmw_gid_t):
  type
    rmw_gid_t* = rmw_gid_t_520094466
else:
  static :
    hint("Declaration of " & "rmw_gid_t" & " already exists, not redeclaring")
when not declared(struct_rcl_time_point_s):
  type
    struct_rcl_time_point_s* = struct_rcl_time_point_s_520094564
else:
  static :
    hint("Declaration of " & "struct_rcl_time_point_s" &
        " already exists, not redeclaring")
when not declared(rcutils_string_map_t):
  type
    rcutils_string_map_t* = rcutils_string_map_t_520094298
else:
  static :
    hint("Declaration of " & "rcutils_string_map_t" &
        " already exists, not redeclaring")
when not declared(rcl_guard_condition_t):
  type
    rcl_guard_condition_t* = rcl_guard_condition_t_520094514
else:
  static :
    hint("Declaration of " & "rcl_guard_condition_t" &
        " already exists, not redeclaring")
when not declared(rmw_init_options_impl_t):
  type
    rmw_init_options_impl_t* = rmw_init_options_impl_t_520094247
else:
  static :
    hint("Declaration of " & "rmw_init_options_impl_t" &
        " already exists, not redeclaring")
when not declared(rmw_liveliness_changed_status_t):
  type
    rmw_liveliness_changed_status_t* = rmw_liveliness_changed_status_t_520094332
else:
  static :
    hint("Declaration of " & "rmw_liveliness_changed_status_t" &
        " already exists, not redeclaring")
when not declared(struct_rcl_publisher_s):
  type
    struct_rcl_publisher_s* = struct_rcl_publisher_s_520094570
else:
  static :
    hint("Declaration of " & "struct_rcl_publisher_s" &
        " already exists, not redeclaring")
when not declared(rosidl_message_type_support_t):
  type
    rosidl_message_type_support_t* = rosidl_message_type_support_t_520094578
else:
  static :
    hint("Declaration of " & "rosidl_message_type_support_t" &
        " already exists, not redeclaring")
when not declared(rmw_context_impl_t):
  type
    rmw_context_impl_t* = rmw_context_impl_t_520094253
else:
  static :
    hint("Declaration of " & "rmw_context_impl_t" &
        " already exists, not redeclaring")
when not declared(struct_rcl_log_levels_s):
  type
    struct_rcl_log_levels_s* = struct_rcl_log_levels_s_520094484
else:
  static :
    hint("Declaration of " & "struct_rcl_log_levels_s" &
        " already exists, not redeclaring")
when not declared(rmw_duration_t):
  type
    rmw_duration_t* = rmw_duration_t_520094362
else:
  static :
    hint("Declaration of " & "rmw_duration_t" &
        " already exists, not redeclaring")
when not declared(struct_rmw_subscription_options_s):
  type
    struct_rmw_subscription_options_s* = struct_rmw_subscription_options_s_520094384
else:
  static :
    hint("Declaration of " & "struct_rmw_subscription_options_s" &
        " already exists, not redeclaring")
when not declared(rcutils_time_point_value_t):
  type
    rcutils_time_point_value_t* = rcutils_time_point_value_t_520094304
else:
  static :
    hint("Declaration of " & "rcutils_time_point_value_t" &
        " already exists, not redeclaring")
when not declared(rcl_clock_change_t):
  type
    rcl_clock_change_t* = rcl_clock_change_t_520094544
else:
  static :
    hint("Declaration of " & "rcl_clock_change_t" &
        " already exists, not redeclaring")
when not declared(struct_rmw_service_info_s):
  type
    struct_rmw_service_info_s* = struct_rmw_service_info_s_520094440
else:
  static :
    hint("Declaration of " & "struct_rmw_service_info_s" &
        " already exists, not redeclaring")
when not declared(rmw_ret_t):
  type
    rmw_ret_t* = rmw_ret_t_520094237
else:
  static :
    hint("Declaration of " & "rmw_ret_t" & " already exists, not redeclaring")
when not declared(rcl_jump_callback_t):
  type
    rcl_jump_callback_t* = rcl_jump_callback_t_520094550
else:
  static :
    hint("Declaration of " & "rcl_jump_callback_t" &
        " already exists, not redeclaring")
when not declared(struct_rcl_arguments_s):
  type
    struct_rcl_arguments_s* = struct_rcl_arguments_s_520094490
else:
  static :
    hint("Declaration of " & "struct_rcl_arguments_s" &
        " already exists, not redeclaring")
when not declared(struct_rcl_bool_array_s):
  type
    struct_rcl_bool_array_s* = struct_rcl_bool_array_s_520094714
else:
  static :
    hint("Declaration of " & "struct_rcl_bool_array_s" &
        " already exists, not redeclaring")
when not declared(struct_rmw_security_options_s):
  type
    struct_rmw_security_options_s* = struct_rmw_security_options_s_520094243
else:
  static :
    hint("Declaration of " & "struct_rmw_security_options_s" &
        " already exists, not redeclaring")
when not declared(struct_rmw_liveliness_changed_status_s):
  type
    struct_rmw_liveliness_changed_status_s* = struct_rmw_liveliness_changed_status_s_520094330
else:
  static :
    hint("Declaration of " & "struct_rmw_liveliness_changed_status_s" &
        " already exists, not redeclaring")
when not declared(struct_rmw_guard_condition_s):
  type
    struct_rmw_guard_condition_s* = struct_rmw_guard_condition_s_520094400
else:
  static :
    hint("Declaration of " & "struct_rmw_guard_condition_s" &
        " already exists, not redeclaring")
when not declared(struct_rmw_time_s):
  type
    struct_rmw_time_s* = struct_rmw_time_s_520094356
else:
  static :
    hint("Declaration of " & "struct_rmw_time_s" &
        " already exists, not redeclaring")
when not declared(rcl_time_point_t):
  type
    rcl_time_point_t* = rcl_time_point_t_520094566
else:
  static :
    hint("Declaration of " & "rcl_time_point_t" &
        " already exists, not redeclaring")
when not declared(rcl_allocator_t):
  type
    rcl_allocator_t* = rcl_allocator_t_520094231
else:
  static :
    hint("Declaration of " & "rcl_allocator_t" &
        " already exists, not redeclaring")
when not declared(struct_rosidl_message_type_support_t):
  type
    struct_rosidl_message_type_support_t* = struct_rosidl_message_type_support_t_520094682
else:
  static :
    hint("Declaration of " & "struct_rosidl_message_type_support_t" &
        " already exists, not redeclaring")
when not declared(rosidl_message_typesupport_handle_function):
  type
    rosidl_message_typesupport_handle_function* = rosidl_message_typesupport_handle_function_520094692
else:
  static :
    hint("Declaration of " & "rosidl_message_typesupport_handle_function" &
        " already exists, not redeclaring")
when not declared(rmw_offered_qos_incompatible_event_status_t):
  type
    rmw_offered_qos_incompatible_event_status_t* = rmw_offered_qos_incompatible_event_status_t_520094328
else:
  static :
    hint("Declaration of " & "rmw_offered_qos_incompatible_event_status_t" &
        " already exists, not redeclaring")
when not declared(rmw_wait_set_t):
  type
    rmw_wait_set_t* = rmw_wait_set_t_520094434
else:
  static :
    hint("Declaration of " & "rmw_wait_set_t" &
        " already exists, not redeclaring")
when not declared(struct_rmw_services_s):
  type
    struct_rmw_services_s* = struct_rmw_services_s_520094416
else:
  static :
    hint("Declaration of " & "struct_rmw_services_s" &
        " already exists, not redeclaring")
when not declared(rmw_qos_incompatible_event_status_t):
  type
    rmw_qos_incompatible_event_status_t* = rmw_qos_incompatible_event_status_t_520094324
else:
  static :
    hint("Declaration of " & "rmw_qos_incompatible_event_status_t" &
        " already exists, not redeclaring")
when not declared(struct_rcl_init_options_s):
  type
    struct_rcl_init_options_s* = struct_rcl_init_options_s_520094498
else:
  static :
    hint("Declaration of " & "struct_rcl_init_options_s" &
        " already exists, not redeclaring")
when not declared(rcl_wait_set_impl_t):
  type
    rcl_wait_set_impl_t* = rcl_wait_set_impl_t_520094664
else:
  static :
    hint("Declaration of " & "rcl_wait_set_impl_t" &
        " already exists, not redeclaring")
when not declared(rcl_arguments_t):
  type
    rcl_arguments_t* = rcl_arguments_t_520094492
else:
  static :
    hint("Declaration of " & "rcl_arguments_t" &
        " already exists, not redeclaring")
when not declared(rmw_liveliness_lost_status_t):
  type
    rmw_liveliness_lost_status_t* = rmw_liveliness_lost_status_t_520094336
else:
  static :
    hint("Declaration of " & "rmw_liveliness_lost_status_t" &
        " already exists, not redeclaring")
when not declared(rmw_subscription_options_t):
  type
    rmw_subscription_options_t* = rmw_subscription_options_t_520094386
else:
  static :
    hint("Declaration of " & "rmw_subscription_options_t" &
        " already exists, not redeclaring")
when not declared(struct_rmw_message_sequence_s):
  type
    struct_rmw_message_sequence_s* = struct_rmw_message_sequence_s_520094584
else:
  static :
    hint("Declaration of " & "struct_rmw_message_sequence_s" &
        " already exists, not redeclaring")
when not declared(struct_rmw_init_options_s):
  type
    struct_rmw_init_options_s* = struct_rmw_init_options_s_520094249
else:
  static :
    hint("Declaration of " & "struct_rmw_init_options_s" &
        " already exists, not redeclaring")
when not declared(rmw_publisher_allocation_t):
  type
    rmw_publisher_allocation_t* = rmw_publisher_allocation_t_520094406
else:
  static :
    hint("Declaration of " & "rmw_publisher_allocation_t" &
        " already exists, not redeclaring")
when not declared(rmw_client_t):
  type
    rmw_client_t* = rmw_client_t_520094398
else:
  static :
    hint("Declaration of " & "rmw_client_t" & " already exists, not redeclaring")
when not declared(rcl_timer_callback_t):
  type
    rcl_timer_callback_t* = rcl_timer_callback_t_520094648
else:
  static :
    hint("Declaration of " & "rcl_timer_callback_t" &
        " already exists, not redeclaring")
when not declared(rcl_timer_t):
  type
    rcl_timer_t* = rcl_timer_t_520094646
else:
  static :
    hint("Declaration of " & "rcl_timer_t" & " already exists, not redeclaring")
when not declared(struct_rmw_subscription_allocation_s):
  type
    struct_rmw_subscription_allocation_s* = struct_rmw_subscription_allocation_s_520094408
else:
  static :
    hint("Declaration of " & "struct_rmw_subscription_allocation_s" &
        " already exists, not redeclaring")
when not declared(rcl_bool_array_t):
  type
    rcl_bool_array_t* = rcl_bool_array_t_520094706
else:
  static :
    hint("Declaration of " & "rcl_bool_array_t" &
        " already exists, not redeclaring")
when not declared(struct_rmw_service_s):
  type
    struct_rmw_service_s* = struct_rmw_service_s_520094392
else:
  static :
    hint("Declaration of " & "struct_rmw_service_s" &
        " already exists, not redeclaring")
when not declared(rcl_clock_t):
  type
    rcl_clock_t* = rcl_clock_t_520094562
else:
  static :
    hint("Declaration of " & "rcl_clock_t" & " already exists, not redeclaring")
when not declared(rcl_publisher_event_type_t):
  type
    rcl_publisher_event_type_t* = rcl_publisher_event_type_t_520094652
else:
  static :
    hint("Declaration of " & "rcl_publisher_event_type_t" &
        " already exists, not redeclaring")
when not declared(struct_rcutils_string_array_s):
  type
    struct_rcutils_string_array_s* = struct_rcutils_string_array_s_520094292
else:
  static :
    hint("Declaration of " & "struct_rcutils_string_array_s" &
        " already exists, not redeclaring")
when not declared(rmw_qos_reliability_policy_t):
  type
    rmw_qos_reliability_policy_t* = rmw_qos_reliability_policy_t_520094446
else:
  static :
    hint("Declaration of " & "rmw_qos_reliability_policy_t" &
        " already exists, not redeclaring")
when not declared(rmw_error_string_t):
  type
    rmw_error_string_t* = rmw_error_string_t_520094672
else:
  static :
    hint("Declaration of " & "rmw_error_string_t" &
        " already exists, not redeclaring")
when not declared(struct_rcl_int64_array_s):
  type
    struct_rcl_int64_array_s* = struct_rcl_int64_array_s_520094716
else:
  static :
    hint("Declaration of " & "struct_rcl_int64_array_s" &
        " already exists, not redeclaring")
when not declared(rcl_node_options_t):
  type
    rcl_node_options_t* = rcl_node_options_t_520094522
else:
  static :
    hint("Declaration of " & "rcl_node_options_t" &
        " already exists, not redeclaring")
when not declared(struct_rmw_subscription_s):
  type
    struct_rmw_subscription_s* = struct_rmw_subscription_s_520094388
else:
  static :
    hint("Declaration of " & "struct_rmw_subscription_s" &
        " already exists, not redeclaring")
when not declared(rcl_subscription_impl_t):
  type
    rcl_subscription_impl_t* = rcl_subscription_impl_t_520094592
else:
  static :
    hint("Declaration of " & "rcl_subscription_impl_t" &
        " already exists, not redeclaring")
when not declared(rcl_serialized_message_t):
  type
    rcl_serialized_message_t* = rcl_serialized_message_t_520094476
else:
  static :
    hint("Declaration of " & "rcl_serialized_message_t" &
        " already exists, not redeclaring")
when not declared(struct_rmw_node_s):
  type
    struct_rmw_node_s* = struct_rmw_node_s_520094364
else:
  static :
    hint("Declaration of " & "struct_rmw_node_s" &
        " already exists, not redeclaring")
when not declared(rmw_context_t):
  type
    rmw_context_t* = rmw_context_t_520094257
else:
  static :
    hint("Declaration of " & "rmw_context_t" &
        " already exists, not redeclaring")
when not declared(struct_rcl_logger_setting_s):
  type
    struct_rcl_logger_setting_s* = struct_rcl_logger_setting_s_520094480
else:
  static :
    hint("Declaration of " & "struct_rcl_logger_setting_s" &
        " already exists, not redeclaring")
when not declared(struct_rcl_guard_condition_s):
  type
    struct_rcl_guard_condition_s* = struct_rcl_guard_condition_s_520094512
else:
  static :
    hint("Declaration of " & "struct_rcl_guard_condition_s" &
        " already exists, not redeclaring")
when not declared(compiler_int_least64_t):
  type
    compiler_int_least64_t* = compiler_int_least64_t_520094676
else:
  static :
    hint("Declaration of " & "compiler_int_least64_t" &
        " already exists, not redeclaring")
when not declared(struct_rmw_subscription_content_filter_options_s):
  type
    struct_rmw_subscription_content_filter_options_s* = struct_rmw_subscription_content_filter_options_s_520094352
else:
  static :
    hint("Declaration of " & "struct_rmw_subscription_content_filter_options_s" &
        " already exists, not redeclaring")
when not declared(rcl_publisher_impl_t):
  type
    rcl_publisher_impl_t* = rcl_publisher_impl_t_520094568
else:
  static :
    hint("Declaration of " & "rcl_publisher_impl_t" &
        " already exists, not redeclaring")
when not declared(struct_rcl_variant_s):
  type
    struct_rcl_variant_s* = struct_rcl_variant_s_520094702
else:
  static :
    hint("Declaration of " & "struct_rcl_variant_s" &
        " already exists, not redeclaring")
when not declared(rcutils_string_array_t):
  type
    rcutils_string_array_t* = rcutils_string_array_t_520094294
else:
  static :
    hint("Declaration of " & "rcutils_string_array_t" &
        " already exists, not redeclaring")
when not declared(rmw_subscription_allocation_t):
  type
    rmw_subscription_allocation_t* = rmw_subscription_allocation_t_520094410
else:
  static :
    hint("Declaration of " & "rmw_subscription_allocation_t" &
        " already exists, not redeclaring")
when not declared(rcl_subscription_event_type_t):
  type
    rcl_subscription_event_type_t* = rcl_subscription_event_type_t_520094656
else:
  static :
    hint("Declaration of " & "rcl_subscription_event_type_t" &
        " already exists, not redeclaring")
when not declared(rmw_qos_history_policy_t):
  type
    rmw_qos_history_policy_t* = rmw_qos_history_policy_t_520094450
else:
  static :
    hint("Declaration of " & "rmw_qos_history_policy_t" &
        " already exists, not redeclaring")
when not declared(rcl_duration_t):
  type
    rcl_duration_t* = rcl_duration_t_520094540
else:
  static :
    hint("Declaration of " & "rcl_duration_t" &
        " already exists, not redeclaring")
when not declared(rmw_security_enforcement_policy_t):
  type
    rmw_security_enforcement_policy_t* = rmw_security_enforcement_policy_t_520094241
else:
  static :
    hint("Declaration of " & "rmw_security_enforcement_policy_t" &
        " already exists, not redeclaring")
when not declared(struct_rmw_context_s):
  type
    struct_rmw_context_s* = struct_rmw_context_s_520094255
else:
  static :
    hint("Declaration of " & "struct_rmw_context_s" &
        " already exists, not redeclaring")
when not declared(struct_rcl_subscription_options_s):
  type
    struct_rcl_subscription_options_s* = struct_rcl_subscription_options_s_520094598
else:
  static :
    hint("Declaration of " & "struct_rcl_subscription_options_s" &
        " already exists, not redeclaring")
when not declared(rmw_publisher_options_t):
  type
    rmw_publisher_options_t* = rmw_publisher_options_t_520094378
else:
  static :
    hint("Declaration of " & "rmw_publisher_options_t" &
        " already exists, not redeclaring")
when not declared(rmw_requested_qos_incompatible_event_status_t):
  type
    rmw_requested_qos_incompatible_event_status_t* = rmw_requested_qos_incompatible_event_status_t_520094326
else:
  static :
    hint("Declaration of " & "rmw_requested_qos_incompatible_event_status_t" &
        " already exists, not redeclaring")
when not declared(rmw_qos_liveliness_policy_t):
  type
    rmw_qos_liveliness_policy_t* = rmw_qos_liveliness_policy_t_520094458
else:
  static :
    hint("Declaration of " & "rmw_qos_liveliness_policy_t" &
        " already exists, not redeclaring")
when not declared(rcl_subscription_content_filter_options_t):
  type
    rcl_subscription_content_filter_options_t* = rcl_subscription_content_filter_options_t_520094604
else:
  static :
    hint("Declaration of " & "rcl_subscription_content_filter_options_t" &
        " already exists, not redeclaring")
when not declared(rmw_event_type_t):
  type
    rmw_event_type_t* = rmw_event_type_t_520094630
else:
  static :
    hint("Declaration of " & "rmw_event_type_t" &
        " already exists, not redeclaring")
when not declared(struct_rcl_guard_condition_options_s):
  type
    struct_rcl_guard_condition_options_s* = struct_rcl_guard_condition_options_s_520094516
else:
  static :
    hint("Declaration of " & "struct_rcl_guard_condition_options_s" &
        " already exists, not redeclaring")
when not declared(struct_rcutils_uint8_array_s):
  type
    struct_rcutils_uint8_array_s* = struct_rcutils_uint8_array_s_520094300
else:
  static :
    hint("Declaration of " & "struct_rcutils_uint8_array_s" &
        " already exists, not redeclaring")
when not declared(rcl_client_impl_t):
  type
    rcl_client_impl_t* = rcl_client_impl_t_520094606
else:
  static :
    hint("Declaration of " & "rcl_client_impl_t" &
        " already exists, not redeclaring")
when not declared(struct_rcl_wait_set_s):
  type
    struct_rcl_wait_set_s* = struct_rcl_wait_set_s_520094666
else:
  static :
    hint("Declaration of " & "struct_rcl_wait_set_s" &
        " already exists, not redeclaring")
when not declared(rosidl_service_typesupport_handle_function):
  type
    rosidl_service_typesupport_handle_function* = rosidl_service_typesupport_handle_function_520094694
else:
  static :
    hint("Declaration of " & "rosidl_service_typesupport_handle_function" &
        " already exists, not redeclaring")
when not declared(rmw_service_info_t):
  type
    rmw_service_info_t* = rmw_service_info_t_520094442
else:
  static :
    hint("Declaration of " & "rmw_service_info_t" &
        " already exists, not redeclaring")
when not declared(rmw_unique_network_flow_endpoints_requirement_t):
  type
    rmw_unique_network_flow_endpoints_requirement_t* = rmw_unique_network_flow_endpoints_requirement_t_520094374
else:
  static :
    hint("Declaration of " & "rmw_unique_network_flow_endpoints_requirement_t" &
        " already exists, not redeclaring")
when not declared(rcl_byte_array_t):
  type
    rcl_byte_array_t* = rcl_byte_array_t_520094704
else:
  static :
    hint("Declaration of " & "rcl_byte_array_t" &
        " already exists, not redeclaring")
when not declared(struct_rcutils_log_location_s):
  type
    struct_rcutils_log_location_s* = struct_rcutils_log_location_s_520094308
else:
  static :
    hint("Declaration of " & "struct_rcutils_log_location_s" &
        " already exists, not redeclaring")
when not declared(rcutils_array_list_t):
  type
    rcutils_array_list_t* = rcutils_array_list_t_520094271
else:
  static :
    hint("Declaration of " & "rcutils_array_list_t" &
        " already exists, not redeclaring")
when not declared(rmw_time_t):
  type
    rmw_time_t* = rmw_time_t_520094358
else:
  static :
    hint("Declaration of " & "rmw_time_t" & " already exists, not redeclaring")
when not declared(struct_rmw_liveliness_lost_status_s):
  type
    struct_rmw_liveliness_lost_status_s* = struct_rmw_liveliness_lost_status_s_520094334
else:
  static :
    hint("Declaration of " & "struct_rmw_liveliness_lost_status_s" &
        " already exists, not redeclaring")
when not declared(rmw_offered_deadline_missed_status_t):
  type
    rmw_offered_deadline_missed_status_t* = rmw_offered_deadline_missed_status_t_520094344
else:
  static :
    hint("Declaration of " & "rmw_offered_deadline_missed_status_t" &
        " already exists, not redeclaring")
when not declared(struct_rcl_timer_s):
  type
    struct_rcl_timer_s* = struct_rcl_timer_s_520094644
else:
  static :
    hint("Declaration of " & "struct_rcl_timer_s" &
        " already exists, not redeclaring")
when not declared(rcl_node_impl_t):
  type
    rcl_node_impl_t* = rcl_node_impl_t_520094524
else:
  static :
    hint("Declaration of " & "rcl_node_impl_t" &
        " already exists, not redeclaring")
when not declared(struct_rcl_client_options_s):
  type
    struct_rcl_client_options_s* = struct_rcl_client_options_s_520094612
else:
  static :
    hint("Declaration of " & "struct_rcl_client_options_s" &
        " already exists, not redeclaring")
when not declared(rmw_events_t):
  type
    rmw_events_t* = rmw_events_t_520094426
else:
  static :
    hint("Declaration of " & "rmw_events_t" & " already exists, not redeclaring")
when not declared(rcl_publisher_options_t):
  type
    rcl_publisher_options_t* = rcl_publisher_options_t_520094576
else:
  static :
    hint("Declaration of " & "rcl_publisher_options_t" &
        " already exists, not redeclaring")
when not declared(rcl_node_params_t):
  type
    rcl_node_params_t* = rcl_node_params_t_520094690
else:
  static :
    hint("Declaration of " & "rcl_node_params_t" &
        " already exists, not redeclaring")
when not declared(rcl_params_t):
  type
    rcl_params_t* = rcl_params_t_520094494
else:
  static :
    hint("Declaration of " & "rcl_params_t" & " already exists, not redeclaring")
when not declared(rmw_guard_conditions_t):
  type
    rmw_guard_conditions_t* = rmw_guard_conditions_t_520094430
else:
  static :
    hint("Declaration of " & "rmw_guard_conditions_t" &
        " already exists, not redeclaring")
when not declared(rcl_arguments_impl_t):
  type
    rcl_arguments_impl_t* = rcl_arguments_impl_t_520094488
else:
  static :
    hint("Declaration of " & "rcl_arguments_impl_t" &
        " already exists, not redeclaring")
when not declared(rcl_subscription_t):
  type
    rcl_subscription_t* = rcl_subscription_t_520094596
else:
  static :
    hint("Declaration of " & "rcl_subscription_t" &
        " already exists, not redeclaring")
when not declared(rcl_int64_array_t):
  type
    rcl_int64_array_t* = rcl_int64_array_t_520094708
else:
  static :
    hint("Declaration of " & "rcl_int64_array_t" &
        " already exists, not redeclaring")
when not declared(rcl_context_impl_t):
  type
    rcl_context_impl_t* = rcl_context_impl_t_520094504
else:
  static :
    hint("Declaration of " & "rcl_context_impl_t" &
        " already exists, not redeclaring")
when not declared(int_least64_t):
  type
    int_least64_t* = int_least64_t_520094259
else:
  static :
    hint("Declaration of " & "int_least64_t" &
        " already exists, not redeclaring")
when not declared(struct_rmw_message_info_s):
  type
    struct_rmw_message_info_s* = struct_rmw_message_info_s_520094468
else:
  static :
    hint("Declaration of " & "struct_rmw_message_info_s" &
        " already exists, not redeclaring")
when not declared(rcl_jump_threshold_t):
  type
    rcl_jump_threshold_t* = rcl_jump_threshold_t_520094554
else:
  static :
    hint("Declaration of " & "rcl_jump_threshold_t" &
        " already exists, not redeclaring")
when not declared(struct_rmw_gid_s):
  type
    struct_rmw_gid_s* = struct_rmw_gid_s_520094464
else:
  static :
    hint("Declaration of " & "struct_rmw_gid_s" &
        " already exists, not redeclaring")
when not declared(struct_rmw_publisher_options_s):
  type
    struct_rmw_publisher_options_s* = struct_rmw_publisher_options_s_520094376
else:
  static :
    hint("Declaration of " & "struct_rmw_publisher_options_s" &
        " already exists, not redeclaring")
when not declared(struct_rcl_jump_callback_info_s):
  type
    struct_rcl_jump_callback_info_s* = struct_rcl_jump_callback_info_s_520094556
else:
  static :
    hint("Declaration of " & "struct_rcl_jump_callback_info_s" &
        " already exists, not redeclaring")
when not declared(rmw_error_state_t):
  type
    rmw_error_state_t* = rmw_error_state_t_520094674
else:
  static :
    hint("Declaration of " & "rmw_error_state_t" &
        " already exists, not redeclaring")
when not declared(struct_rcutils_char_array_s):
  type
    struct_rcutils_char_array_s* = struct_rcutils_char_array_s_520094273
else:
  static :
    hint("Declaration of " & "struct_rcutils_char_array_s" &
        " already exists, not redeclaring")
when not declared(rcutils_allocator_t):
  type
    rcutils_allocator_t* = rcutils_allocator_t_520094229
else:
  static :
    hint("Declaration of " & "rcutils_allocator_t" &
        " already exists, not redeclaring")
when not declared(va_list):
  type
    va_list* = va_list_520094316
else:
  static :
    hint("Declaration of " & "va_list" & " already exists, not redeclaring")
when not declared(rcutils_hash_map_key_cmp_t):
  type
    rcutils_hash_map_key_cmp_t* = rcutils_hash_map_key_cmp_t_520094290
else:
  static :
    hint("Declaration of " & "rcutils_hash_map_key_cmp_t" &
        " already exists, not redeclaring")
when not declared(struct_rcl_subscription_content_filter_options_s):
  type
    struct_rcl_subscription_content_filter_options_s* = struct_rcl_subscription_content_filter_options_s_520094602
else:
  static :
    hint("Declaration of " & "struct_rcl_subscription_content_filter_options_s" &
        " already exists, not redeclaring")
when not declared(rcl_timer_impl_t):
  type
    rcl_timer_impl_t* = rcl_timer_impl_t_520094642
else:
  static :
    hint("Declaration of " & "rcl_timer_impl_t" &
        " already exists, not redeclaring")
when not declared(struct_rcl_node_params_s):
  type
    struct_rcl_node_params_s* = struct_rcl_node_params_s_520094698
else:
  static :
    hint("Declaration of " & "struct_rcl_node_params_s" &
        " already exists, not redeclaring")
when not declared(rcl_variant_t):
  type
    rcl_variant_t* = rcl_variant_t_520094700
else:
  static :
    hint("Declaration of " & "rcl_variant_t" &
        " already exists, not redeclaring")
when not declared(rmw_serialized_message_t):
  type
    rmw_serialized_message_t* = rmw_serialized_message_t_520094350
else:
  static :
    hint("Declaration of " & "rmw_serialized_message_t" &
        " already exists, not redeclaring")
when not declared(rmw_qos_compatibility_type_t):
  type
    rmw_qos_compatibility_type_t* = rmw_qos_compatibility_type_t_520094638
else:
  static :
    hint("Declaration of " & "rmw_qos_compatibility_type_t" &
        " already exists, not redeclaring")
when not declared(struct_rmw_qos_incompatible_event_status_s):
  type
    struct_rmw_qos_incompatible_event_status_s* = struct_rmw_qos_incompatible_event_status_s_520094322
else:
  static :
    hint("Declaration of " & "struct_rmw_qos_incompatible_event_status_s" &
        " already exists, not redeclaring")
when not declared(struct_rmw_offered_deadline_missed_status_s):
  type
    struct_rmw_offered_deadline_missed_status_s* = struct_rmw_offered_deadline_missed_status_s_520094342
else:
  static :
    hint("Declaration of " & "struct_rmw_offered_deadline_missed_status_s" &
        " already exists, not redeclaring")
when not declared(rcl_event_t):
  type
    rcl_event_t* = rcl_event_t_520094662
else:
  static :
    hint("Declaration of " & "rcl_event_t" & " already exists, not redeclaring")
when not declared(struct_rcutils_error_state_s):
  type
    struct_rcutils_error_state_s* = struct_rcutils_error_state_s_520094265
else:
  static :
    hint("Declaration of " & "struct_rcutils_error_state_s" &
        " already exists, not redeclaring")
when not declared(rmw_message_info_sequence_t):
  type
    rmw_message_info_sequence_t* = rmw_message_info_sequence_t_520094590
else:
  static :
    hint("Declaration of " & "rmw_message_info_sequence_t" &
        " already exists, not redeclaring")
when not declared(rcl_event_callback_t):
  type
    rcl_event_callback_t* = rcl_event_callback_t_520094582
else:
  static :
    hint("Declaration of " & "rcl_event_callback_t" &
        " already exists, not redeclaring")
when not declared(rcl_time_jump_t):
  type
    rcl_time_jump_t* = rcl_time_jump_t_520094548
else:
  static :
    hint("Declaration of " & "rcl_time_jump_t" &
        " already exists, not redeclaring")
when not declared(struct_rmw_publisher_s):
  type
    struct_rmw_publisher_s* = struct_rmw_publisher_s_520094380
else:
  static :
    hint("Declaration of " & "struct_rmw_publisher_s" &
        " already exists, not redeclaring")
when not declared(struct_rmw_events_s):
  type
    struct_rmw_events_s* = struct_rmw_events_s_520094424
else:
  static :
    hint("Declaration of " & "struct_rmw_events_s" &
        " already exists, not redeclaring")
when not declared(rmw_message_info_t):
  type
    rmw_message_info_t* = rmw_message_info_t_520094470
else:
  static :
    hint("Declaration of " & "rmw_message_info_t" &
        " already exists, not redeclaring")
when not declared(rcl_service_options_t):
  type
    rcl_service_options_t* = rcl_service_options_t_520094626
else:
  static :
    hint("Declaration of " & "rcl_service_options_t" &
        " already exists, not redeclaring")
when not declared(rmw_subscriptions_t):
  type
    rmw_subscriptions_t* = rmw_subscriptions_t_520094414
else:
  static :
    hint("Declaration of " & "rmw_subscriptions_t" &
        " already exists, not redeclaring")
when not declared(rmw_clients_t):
  type
    rmw_clients_t* = rmw_clients_t_520094422
else:
  static :
    hint("Declaration of " & "rmw_clients_t" &
        " already exists, not redeclaring")
when not declared(struct_rmw_event_s):
  type
    struct_rmw_event_s* = struct_rmw_event_s_520094632
else:
  static :
    hint("Declaration of " & "struct_rmw_event_s" &
        " already exists, not redeclaring")
when not declared(rcl_context_t):
  type
    rcl_context_t* = rcl_context_t_520094508
else:
  static :
    hint("Declaration of " & "rcl_context_t" &
        " already exists, not redeclaring")
when not declared(struct_rmw_client_s):
  type
    struct_rmw_client_s* = struct_rmw_client_s_520094396
else:
  static :
    hint("Declaration of " & "struct_rmw_client_s" &
        " already exists, not redeclaring")
when not declared(struct_rmw_qos_profile_s):
  type
    struct_rmw_qos_profile_s* = struct_rmw_qos_profile_s_520094460
else:
  static :
    hint("Declaration of " & "struct_rmw_qos_profile_s" &
        " already exists, not redeclaring")
when not declared(struct_rcl_context_s):
  type
    struct_rcl_context_s* = struct_rcl_context_s_520094506
else:
  static :
    hint("Declaration of " & "struct_rcl_context_s" &
        " already exists, not redeclaring")
when not declared(rcl_jump_callback_info_t):
  type
    rcl_jump_callback_info_t* = rcl_jump_callback_info_t_520094558
else:
  static :
    hint("Declaration of " & "rcl_jump_callback_info_t" &
        " already exists, not redeclaring")
when not declared(rcl_service_impl_t):
  type
    rcl_service_impl_t* = rcl_service_impl_t_520094618
else:
  static :
    hint("Declaration of " & "rcl_service_impl_t" &
        " already exists, not redeclaring")
when not declared(rcl_event_impl_t):
  type
    rcl_event_impl_t* = rcl_event_impl_t_520094658
else:
  static :
    hint("Declaration of " & "rcl_event_impl_t" &
        " already exists, not redeclaring")
when not declared(rcl_ret_t):
  type
    rcl_ret_t* = rcl_ret_t_520094474
else:
  static :
    hint("Declaration of " & "rcl_ret_t" & " already exists, not redeclaring")
when not declared(struct_rmw_requested_deadline_missed_status_s):
  type
    struct_rmw_requested_deadline_missed_status_s* = struct_rmw_requested_deadline_missed_status_s_520094346
else:
  static :
    hint("Declaration of " & "struct_rmw_requested_deadline_missed_status_s" &
        " already exists, not redeclaring")
when not declared(struct_rcl_service_s):
  type
    struct_rcl_service_s* = struct_rcl_service_s_520094620
else:
  static :
    hint("Declaration of " & "struct_rcl_service_s" &
        " already exists, not redeclaring")
when not declared(rcutils_char_array_t):
  type
    rcutils_char_array_t* = rcutils_char_array_t_520094275
else:
  static :
    hint("Declaration of " & "rcutils_char_array_t" &
        " already exists, not redeclaring")
when not declared(struct_rcl_clock_s):
  type
    struct_rcl_clock_s* = struct_rcl_clock_s_520094560
else:
  static :
    hint("Declaration of " & "struct_rcl_clock_s" &
        " already exists, not redeclaring")
when not declared(rmw_service_t):
  type
    rmw_service_t* = rmw_service_t_520094394
else:
  static :
    hint("Declaration of " & "rmw_service_t" &
        " already exists, not redeclaring")
when not declared(rcl_context_instance_id_t):
  type
    rcl_context_instance_id_t* = rcl_context_instance_id_t_520094502
else:
  static :
    hint("Declaration of " & "rcl_context_instance_id_t" &
        " already exists, not redeclaring")
when not declared(rmw_message_lost_status_t):
  type
    rmw_message_lost_status_t* = rmw_message_lost_status_t_520094340
else:
  static :
    hint("Declaration of " & "rmw_message_lost_status_t" &
        " already exists, not redeclaring")
when not declared(struct_rcutils_string_map_s):
  type
    struct_rcutils_string_map_s* = struct_rcutils_string_map_s_520094296
else:
  static :
    hint("Declaration of " & "struct_rcutils_string_map_s" &
        " already exists, not redeclaring")
when not declared(rcutils_duration_value_t):
  type
    rcutils_duration_value_t* = rcutils_duration_value_t_520094306
else:
  static :
    hint("Declaration of " & "rcutils_duration_value_t" &
        " already exists, not redeclaring")
when not declared(rcl_log_levels_t):
  type
    rcl_log_levels_t* = rcl_log_levels_t_520094486
else:
  static :
    hint("Declaration of " & "rcl_log_levels_t" &
        " already exists, not redeclaring")
when not declared(rosidl_runtime_c_bound_handle_function):
  type
    rosidl_runtime_c_bound_handle_function* = rosidl_runtime_c_bound_handle_function_520094696
else:
  static :
    hint("Declaration of " & "rosidl_runtime_c_bound_handle_function" &
        " already exists, not redeclaring")
when not declared(rmw_requested_deadline_missed_status_t):
  type
    rmw_requested_deadline_missed_status_t* = rmw_requested_deadline_missed_status_t_520094348
else:
  static :
    hint("Declaration of " & "rmw_requested_deadline_missed_status_t" &
        " already exists, not redeclaring")
when not declared(rcl_node_t):
  type
    rcl_node_t* = rcl_node_t_520094528
else:
  static :
    hint("Declaration of " & "rcl_node_t" & " already exists, not redeclaring")
when not declared(rcl_client_t):
  type
    rcl_client_t* = rcl_client_t_520094610
else:
  static :
    hint("Declaration of " & "rcl_client_t" & " already exists, not redeclaring")
when not declared(rcutils_hash_map_key_hasher_t):
  type
    rcutils_hash_map_key_hasher_t* = rcutils_hash_map_key_hasher_t_520094288
else:
  static :
    hint("Declaration of " & "rcutils_hash_map_key_hasher_t" &
        " already exists, not redeclaring")
when not declared(struct_rcl_params_s):
  type
    struct_rcl_params_s* = struct_rcl_params_s_520094680
else:
  static :
    hint("Declaration of " & "struct_rcl_params_s" &
        " already exists, not redeclaring")
when not declared(struct_rcutils_error_string_s):
  type
    struct_rcutils_error_string_s* = struct_rcutils_error_string_s_520094261
else:
  static :
    hint("Declaration of " & "struct_rcutils_error_string_s" &
        " already exists, not redeclaring")
when not declared(rcl_logger_setting_t):
  type
    rcl_logger_setting_t* = rcl_logger_setting_t_520094482
else:
  static :
    hint("Declaration of " & "rcl_logger_setting_t" &
        " already exists, not redeclaring")
when not declared(struct_rcl_node_s):
  type
    struct_rcl_node_s* = struct_rcl_node_s_520094526
else:
  static :
    hint("Declaration of " & "struct_rcl_node_s" &
        " already exists, not redeclaring")
when not declared(rcl_clock_type_t):
  type
    rcl_clock_type_t* = rcl_clock_type_t_520094536
else:
  static :
    hint("Declaration of " & "rcl_clock_type_t" &
        " already exists, not redeclaring")
when not declared(struct_rosidl_service_type_support_t):
  type
    struct_rosidl_service_type_support_t* = struct_rosidl_service_type_support_t_520094684
else:
  static :
    hint("Declaration of " & "struct_rosidl_service_type_support_t" &
        " already exists, not redeclaring")
when not declared(rcl_double_array_t):
  type
    rcl_double_array_t* = rcl_double_array_t_520094710
else:
  static :
    hint("Declaration of " & "rcl_double_array_t" &
        " already exists, not redeclaring")
when not declared(rmw_init_options_t):
  type
    rmw_init_options_t* = rmw_init_options_t_520094251
else:
  static :
    hint("Declaration of " & "rmw_init_options_t" &
        " already exists, not redeclaring")
when not declared(rcl_logging_output_handler_t):
  type
    rcl_logging_output_handler_t* = rcl_logging_output_handler_t_520094670
else:
  static :
    hint("Declaration of " & "rcl_logging_output_handler_t" &
        " already exists, not redeclaring")
when not declared(struct_rcl_duration_s):
  type
    struct_rcl_duration_s* = struct_rcl_duration_s_520094538
else:
  static :
    hint("Declaration of " & "struct_rcl_duration_s" &
        " already exists, not redeclaring")
when not declared(rcl_publisher_t):
  type
    rcl_publisher_t* = rcl_publisher_t_520094572
else:
  static :
    hint("Declaration of " & "rcl_publisher_t" &
        " already exists, not redeclaring")
when not declared(struct_rcl_subscription_s):
  type
    struct_rcl_subscription_s* = struct_rcl_subscription_s_520094594
else:
  static :
    hint("Declaration of " & "struct_rcl_subscription_s" &
        " already exists, not redeclaring")
when not declared(rcutils_error_state_t):
  type
    rcutils_error_state_t* = rcutils_error_state_t_520094267
else:
  static :
    hint("Declaration of " & "rcutils_error_state_t" &
        " already exists, not redeclaring")
when not declared(rcl_service_t):
  type
    rcl_service_t* = rcl_service_t_520094622
else:
  static :
    hint("Declaration of " & "rcl_service_t" &
        " already exists, not redeclaring")
when not declared(rmw_qos_policy_kind_t):
  type
    rmw_qos_policy_kind_t* = rmw_qos_policy_kind_t_520094320
else:
  static :
    hint("Declaration of " & "rmw_qos_policy_kind_t" &
        " already exists, not redeclaring")
when not declared(rmw_node_t):
  type
    rmw_node_t* = rmw_node_t_520094366
else:
  static :
    hint("Declaration of " & "rmw_node_t" & " already exists, not redeclaring")
when not declared(struct_rmw_guard_conditions_s):
  type
    struct_rmw_guard_conditions_s* = struct_rmw_guard_conditions_s_520094428
else:
  static :
    hint("Declaration of " & "struct_rmw_guard_conditions_s" &
        " already exists, not redeclaring")
when not declared(rmw_localhost_only_t):
  type
    rmw_localhost_only_t* = rmw_localhost_only_t_520094235
else:
  static :
    hint("Declaration of " & "rmw_localhost_only_t" &
        " already exists, not redeclaring")
when not declared(rosidl_runtime_c_Sequence_bound):
  type
    rosidl_runtime_c_Sequence_bound* = rosidl_runtime_c_Sequence_bound_520094640
else:
  static :
    hint("Declaration of " & "rosidl_runtime_c_Sequence_bound" &
        " already exists, not redeclaring")
when not declared(rcl_init_options_t):
  type
    rcl_init_options_t* = rcl_init_options_t_520094500
else:
  static :
    hint("Declaration of " & "rcl_init_options_t" &
        " already exists, not redeclaring")
when not declared(rmw_subscription_content_filter_options_t):
  type
    rmw_subscription_content_filter_options_t* = rmw_subscription_content_filter_options_t_520094354
else:
  static :
    hint("Declaration of " & "rmw_subscription_content_filter_options_t" &
        " already exists, not redeclaring")
when not declared(struct_rmw_clients_s):
  type
    struct_rmw_clients_s* = struct_rmw_clients_s_520094420
else:
  static :
    hint("Declaration of " & "struct_rmw_clients_s" &
        " already exists, not redeclaring")
when not declared(rcl_guard_condition_options_t):
  type
    rcl_guard_condition_options_t* = rcl_guard_condition_options_t_520094518
else:
  static :
    hint("Declaration of " & "rcl_guard_condition_options_t" &
        " already exists, not redeclaring")
when not declared(rmw_endpoint_type_t):
  type
    rmw_endpoint_type_t* = rmw_endpoint_type_t_520094370
else:
  static :
    hint("Declaration of " & "rmw_endpoint_type_t" &
        " already exists, not redeclaring")
when not declared(struct_rcl_client_s):
  type
    struct_rcl_client_s* = struct_rcl_client_s_520094608
else:
  static :
    hint("Declaration of " & "struct_rcl_client_s" &
        " already exists, not redeclaring")
when not declared(rcl_init_options_impl_t):
  type
    rcl_init_options_impl_t* = rcl_init_options_impl_t_520094496
else:
  static :
    hint("Declaration of " & "rcl_init_options_impl_t" &
        " already exists, not redeclaring")
when not declared(rcutils_hash_map_t):
  type
    rcutils_hash_map_t* = rcutils_hash_map_t_520094286
else:
  static :
    hint("Declaration of " & "rcutils_hash_map_t" &
        " already exists, not redeclaring")
when not declared(rmw_qos_profile_t):
  type
    rmw_qos_profile_t* = rmw_qos_profile_t_520094462
else:
  static :
    hint("Declaration of " & "rmw_qos_profile_t" &
        " already exists, not redeclaring")
when not declared(rmw_subscription_t):
  type
    rmw_subscription_t* = rmw_subscription_t_520094390
else:
  static :
    hint("Declaration of " & "rmw_subscription_t" &
        " already exists, not redeclaring")
when not declared(rmw_publisher_t):
  type
    rmw_publisher_t* = rmw_publisher_t_520094382
else:
  static :
    hint("Declaration of " & "rmw_publisher_t" &
        " already exists, not redeclaring")
when not declared(struct_rmw_message_info_sequence_s):
  type
    struct_rmw_message_info_sequence_s* = struct_rmw_message_info_sequence_s_520094588
else:
  static :
    hint("Declaration of " & "struct_rmw_message_info_sequence_s" &
        " already exists, not redeclaring")
when not declared(rmw_security_options_t):
  type
    rmw_security_options_t* = rmw_security_options_t_520094245
else:
  static :
    hint("Declaration of " & "rmw_security_options_t" &
        " already exists, not redeclaring")
when not declared(rcl_time_point_value_t):
  type
    rcl_time_point_value_t* = rcl_time_point_value_t_520094530
else:
  static :
    hint("Declaration of " & "rcl_time_point_value_t" &
        " already exists, not redeclaring")
when not declared(rcl_duration_value_t):
  type
    rcl_duration_value_t* = rcl_duration_value_t_520094532
else:
  static :
    hint("Declaration of " & "rcl_duration_value_t" &
        " already exists, not redeclaring")
when not declared(rmw_services_t):
  type
    rmw_services_t* = rmw_services_t_520094418
else:
  static :
    hint("Declaration of " & "rmw_services_t" &
        " already exists, not redeclaring")
when not declared(struct_rcutils_allocator_s):
  type
    struct_rcutils_allocator_s* = struct_rcutils_allocator_s_520094227
else:
  static :
    hint("Declaration of " & "struct_rcutils_allocator_s" &
        " already exists, not redeclaring")
when not declared(RCUTILS_RET_OK):
  when 0 is static:
    const
      RCUTILS_RET_OK* = 0    ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/rcutils_ret.h:29:9
  else:
    let RCUTILS_RET_OK* = 0  ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/rcutils_ret.h:29:9
else:
  static :
    hint("Declaration of " & "RCUTILS_RET_OK" &
        " already exists, not redeclaring")
when not declared(RCUTILS_RET_WARN):
  when 1 is static:
    const
      RCUTILS_RET_WARN* = 1  ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/rcutils_ret.h:31:9
  else:
    let RCUTILS_RET_WARN* = 1 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/rcutils_ret.h:31:9
else:
  static :
    hint("Declaration of " & "RCUTILS_RET_WARN" &
        " already exists, not redeclaring")
when not declared(RCUTILS_RET_ERROR):
  when 2 is static:
    const
      RCUTILS_RET_ERROR* = 2 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/rcutils_ret.h:33:9
  else:
    let RCUTILS_RET_ERROR* = 2 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/rcutils_ret.h:33:9
else:
  static :
    hint("Declaration of " & "RCUTILS_RET_ERROR" &
        " already exists, not redeclaring")
when not declared(RCUTILS_RET_BAD_ALLOC):
  when 10 is static:
    const
      RCUTILS_RET_BAD_ALLOC* = 10 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/rcutils_ret.h:36:9
  else:
    let RCUTILS_RET_BAD_ALLOC* = 10 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/rcutils_ret.h:36:9
else:
  static :
    hint("Declaration of " & "RCUTILS_RET_BAD_ALLOC" &
        " already exists, not redeclaring")
when not declared(RCUTILS_RET_INVALID_ARGUMENT):
  when 11 is static:
    const
      RCUTILS_RET_INVALID_ARGUMENT* = 11 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/rcutils_ret.h:38:9
  else:
    let RCUTILS_RET_INVALID_ARGUMENT* = 11 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/rcutils_ret.h:38:9
else:
  static :
    hint("Declaration of " & "RCUTILS_RET_INVALID_ARGUMENT" &
        " already exists, not redeclaring")
when not declared(RCUTILS_RET_NOT_ENOUGH_SPACE):
  when 12 is static:
    const
      RCUTILS_RET_NOT_ENOUGH_SPACE* = 12 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/rcutils_ret.h:40:9
  else:
    let RCUTILS_RET_NOT_ENOUGH_SPACE* = 12 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/rcutils_ret.h:40:9
else:
  static :
    hint("Declaration of " & "RCUTILS_RET_NOT_ENOUGH_SPACE" &
        " already exists, not redeclaring")
when not declared(RCUTILS_RET_NOT_INITIALIZED):
  when 13 is static:
    const
      RCUTILS_RET_NOT_INITIALIZED* = 13 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/rcutils_ret.h:42:9
  else:
    let RCUTILS_RET_NOT_INITIALIZED* = 13 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/rcutils_ret.h:42:9
else:
  static :
    hint("Declaration of " & "RCUTILS_RET_NOT_INITIALIZED" &
        " already exists, not redeclaring")
when not declared(RCUTILS_RET_NOT_FOUND):
  when 14 is static:
    const
      RCUTILS_RET_NOT_FOUND* = 14 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/rcutils_ret.h:44:9
  else:
    let RCUTILS_RET_NOT_FOUND* = 14 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/rcutils_ret.h:44:9
else:
  static :
    hint("Declaration of " & "RCUTILS_RET_NOT_FOUND" &
        " already exists, not redeclaring")
when not declared(RCUTILS_RET_STRING_MAP_ALREADY_INIT):
  when 30 is static:
    const
      RCUTILS_RET_STRING_MAP_ALREADY_INIT* = 30 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/rcutils_ret.h:47:9
  else:
    let RCUTILS_RET_STRING_MAP_ALREADY_INIT* = 30 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/rcutils_ret.h:47:9
else:
  static :
    hint("Declaration of " & "RCUTILS_RET_STRING_MAP_ALREADY_INIT" &
        " already exists, not redeclaring")
when not declared(RCUTILS_RET_STRING_MAP_INVALID):
  when 31 is static:
    const
      RCUTILS_RET_STRING_MAP_INVALID* = 31 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/rcutils_ret.h:49:9
  else:
    let RCUTILS_RET_STRING_MAP_INVALID* = 31 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/rcutils_ret.h:49:9
else:
  static :
    hint("Declaration of " & "RCUTILS_RET_STRING_MAP_INVALID" &
        " already exists, not redeclaring")
when not declared(RCUTILS_RET_STRING_KEY_NOT_FOUND):
  when 32 is static:
    const
      RCUTILS_RET_STRING_KEY_NOT_FOUND* = 32 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/rcutils_ret.h:51:9
  else:
    let RCUTILS_RET_STRING_KEY_NOT_FOUND* = 32 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/rcutils_ret.h:51:9
else:
  static :
    hint("Declaration of " & "RCUTILS_RET_STRING_KEY_NOT_FOUND" &
        " already exists, not redeclaring")
when not declared(RCUTILS_RET_LOGGING_SEVERITY_MAP_INVALID):
  when 40 is static:
    const
      RCUTILS_RET_LOGGING_SEVERITY_MAP_INVALID* = 40 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/rcutils_ret.h:54:9
  else:
    let RCUTILS_RET_LOGGING_SEVERITY_MAP_INVALID* = 40 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/rcutils_ret.h:54:9
else:
  static :
    hint("Declaration of " & "RCUTILS_RET_LOGGING_SEVERITY_MAP_INVALID" &
        " already exists, not redeclaring")
when not declared(RCUTILS_RET_LOGGING_SEVERITY_STRING_INVALID):
  when 41 is static:
    const
      RCUTILS_RET_LOGGING_SEVERITY_STRING_INVALID* = 41 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/rcutils_ret.h:56:9
  else:
    let RCUTILS_RET_LOGGING_SEVERITY_STRING_INVALID* = 41 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/rcutils_ret.h:56:9
else:
  static :
    hint("Declaration of " & "RCUTILS_RET_LOGGING_SEVERITY_STRING_INVALID" &
        " already exists, not redeclaring")
when not declared(RCUTILS_RET_HASH_MAP_NO_MORE_ENTRIES):
  when 50 is static:
    const
      RCUTILS_RET_HASH_MAP_NO_MORE_ENTRIES* = 50 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/rcutils_ret.h:59:9
  else:
    let RCUTILS_RET_HASH_MAP_NO_MORE_ENTRIES* = 50 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/rcutils_ret.h:59:9
else:
  static :
    hint("Declaration of " & "RCUTILS_RET_HASH_MAP_NO_MORE_ENTRIES" &
        " already exists, not redeclaring")
when not declared(RCUTILS_PUBLIC):
  when RCUTILS_IMPORT is typedesc:
    type
      RCUTILS_PUBLIC* = RCUTILS_IMPORT ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/visibility_control.h:23:10
  else:
    when RCUTILS_IMPORT is static:
      const
        RCUTILS_PUBLIC* = RCUTILS_IMPORT ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/visibility_control.h:23:10
    else:
      let RCUTILS_PUBLIC* = RCUTILS_IMPORT ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/visibility_control.h:23:10
else:
  static :
    hint("Declaration of " & "RCUTILS_PUBLIC" &
        " already exists, not redeclaring")
when not declared(rcutils_get_default_allocator):
  proc rcutils_get_default_allocator*(): rcutils_allocator_t_520094230 {.cdecl,
      importc: "rcutils_get_default_allocator".}
else:
  static :
    hint("Declaration of " & "rcutils_get_default_allocator" &
        " already exists, not redeclaring")
when not declared(rcutils_reallocf):
  proc rcutils_reallocf*(pointer: pointer; size: csize_t;
                         allocator: ptr rcutils_allocator_t_520094230): pointer {.
      cdecl, importc: "rcutils_reallocf".}
else:
  static :
    hint("Declaration of " & "rcutils_reallocf" &
        " already exists, not redeclaring")
when not declared(RMW_DEFAULT_DOMAIN_ID):
  when SIZE_MAX is typedesc:
    type
      RMW_DEFAULT_DOMAIN_ID* = SIZE_MAX ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/domain_id.h:19:9
  else:
    when SIZE_MAX is static:
      const
        RMW_DEFAULT_DOMAIN_ID* = SIZE_MAX ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/domain_id.h:19:9
    else:
      let RMW_DEFAULT_DOMAIN_ID* = SIZE_MAX ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/domain_id.h:19:9
else:
  static :
    hint("Declaration of " & "RMW_DEFAULT_DOMAIN_ID" &
        " already exists, not redeclaring")
when not declared(RMW_WARN_UNUSED):
  when RCUTILS_WARN_UNUSED is typedesc:
    type
      RMW_WARN_UNUSED* = RCUTILS_WARN_UNUSED ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/macros.h:24:9
  else:
    when RCUTILS_WARN_UNUSED is static:
      const
        RMW_WARN_UNUSED* = RCUTILS_WARN_UNUSED ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/macros.h:24:9
    else:
      let RMW_WARN_UNUSED* = RCUTILS_WARN_UNUSED ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/macros.h:24:9
else:
  static :
    hint("Declaration of " & "RMW_WARN_UNUSED" &
        " already exists, not redeclaring")
when not declared(RMW_RET_OK):
  when 0 is static:
    const
      RMW_RET_OK* = 0        ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/ret_types.h:28:9
  else:
    let RMW_RET_OK* = 0      ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/ret_types.h:28:9
else:
  static :
    hint("Declaration of " & "RMW_RET_OK" & " already exists, not redeclaring")
when not declared(RMW_RET_ERROR):
  when 1 is static:
    const
      RMW_RET_ERROR* = 1     ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/ret_types.h:30:9
  else:
    let RMW_RET_ERROR* = 1   ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/ret_types.h:30:9
else:
  static :
    hint("Declaration of " & "RMW_RET_ERROR" &
        " already exists, not redeclaring")
when not declared(RMW_RET_TIMEOUT):
  when 2 is static:
    const
      RMW_RET_TIMEOUT* = 2   ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/ret_types.h:32:9
  else:
    let RMW_RET_TIMEOUT* = 2 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/ret_types.h:32:9
else:
  static :
    hint("Declaration of " & "RMW_RET_TIMEOUT" &
        " already exists, not redeclaring")
when not declared(RMW_RET_UNSUPPORTED):
  when 3 is static:
    const
      RMW_RET_UNSUPPORTED* = 3 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/ret_types.h:34:9
  else:
    let RMW_RET_UNSUPPORTED* = 3 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/ret_types.h:34:9
else:
  static :
    hint("Declaration of " & "RMW_RET_UNSUPPORTED" &
        " already exists, not redeclaring")
when not declared(RMW_RET_BAD_ALLOC):
  when 10 is static:
    const
      RMW_RET_BAD_ALLOC* = 10 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/ret_types.h:37:9
  else:
    let RMW_RET_BAD_ALLOC* = 10 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/ret_types.h:37:9
else:
  static :
    hint("Declaration of " & "RMW_RET_BAD_ALLOC" &
        " already exists, not redeclaring")
when not declared(RMW_RET_INVALID_ARGUMENT):
  when 11 is static:
    const
      RMW_RET_INVALID_ARGUMENT* = 11 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/ret_types.h:39:9
  else:
    let RMW_RET_INVALID_ARGUMENT* = 11 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/ret_types.h:39:9
else:
  static :
    hint("Declaration of " & "RMW_RET_INVALID_ARGUMENT" &
        " already exists, not redeclaring")
when not declared(RMW_RET_INCORRECT_RMW_IMPLEMENTATION):
  when 12 is static:
    const
      RMW_RET_INCORRECT_RMW_IMPLEMENTATION* = 12 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/ret_types.h:41:9
  else:
    let RMW_RET_INCORRECT_RMW_IMPLEMENTATION* = 12 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/ret_types.h:41:9
else:
  static :
    hint("Declaration of " & "RMW_RET_INCORRECT_RMW_IMPLEMENTATION" &
        " already exists, not redeclaring")
when not declared(RMW_RET_NODE_NAME_NON_EXISTENT):
  when 203 is static:
    const
      RMW_RET_NODE_NAME_NON_EXISTENT* = 203 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/ret_types.h:46:9
  else:
    let RMW_RET_NODE_NAME_NON_EXISTENT* = 203 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/ret_types.h:46:9
else:
  static :
    hint("Declaration of " & "RMW_RET_NODE_NAME_NON_EXISTENT" &
        " already exists, not redeclaring")
when not declared(RCL_WARN_UNUSED):
  when RCUTILS_WARN_UNUSED is typedesc:
    type
      RCL_WARN_UNUSED* = RCUTILS_WARN_UNUSED ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/macros.h:26:9
  else:
    when RCUTILS_WARN_UNUSED is static:
      const
        RCL_WARN_UNUSED* = RCUTILS_WARN_UNUSED ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/macros.h:26:9
    else:
      let RCL_WARN_UNUSED* = RCUTILS_WARN_UNUSED ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/macros.h:26:9
else:
  static :
    hint("Declaration of " & "RCL_WARN_UNUSED" &
        " already exists, not redeclaring")
when not declared(compiler_STDC_WANT_LIB_EXT1):
  when 1 is static:
    const
      compiler_STDC_WANT_LIB_EXT1* = 1 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/error_handling.h:26:9
  else:
    let compiler_STDC_WANT_LIB_EXT1* = 1 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/error_handling.h:26:9
else:
  static :
    hint("Declaration of " & "compiler_STDC_WANT_LIB_EXT1" &
        " already exists, not redeclaring")
when not declared(RCUTILS_FAULT_INJECTION_NEVER_FAIL):
  when -1 is static:
    const
      RCUTILS_FAULT_INJECTION_NEVER_FAIL* = -1 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/testing/fault_injection.h:29:9
  else:
    let RCUTILS_FAULT_INJECTION_NEVER_FAIL* = -1 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/testing/fault_injection.h:29:9
else:
  static :
    hint("Declaration of " & "RCUTILS_FAULT_INJECTION_NEVER_FAIL" &
        " already exists, not redeclaring")
when not declared(RCUTILS_FAULT_INJECTION_FAIL_NOW):
  when 0 is static:
    const
      RCUTILS_FAULT_INJECTION_FAIL_NOW* = 0 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/testing/fault_injection.h:31:9
  else:
    let RCUTILS_FAULT_INJECTION_FAIL_NOW* = 0 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/testing/fault_injection.h:31:9
else:
  static :
    hint("Declaration of " & "RCUTILS_FAULT_INJECTION_FAIL_NOW" &
        " already exists, not redeclaring")
when not declared(RCUTILS_ERROR_STATE_LINE_NUMBER_STR_MAX_LENGTH):
  when 20 is static:
    const
      RCUTILS_ERROR_STATE_LINE_NUMBER_STR_MAX_LENGTH* = 20 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/error_handling.h:78:9
  else:
    let RCUTILS_ERROR_STATE_LINE_NUMBER_STR_MAX_LENGTH* = 20 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/error_handling.h:78:9
else:
  static :
    hint("Declaration of " & "RCUTILS_ERROR_STATE_LINE_NUMBER_STR_MAX_LENGTH" &
        " already exists, not redeclaring")
when not declared(RCUTILS_ERROR_FORMATTING_CHARACTERS):
  when 6 is static:
    const
      RCUTILS_ERROR_FORMATTING_CHARACTERS* = 6 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/error_handling.h:81:9
  else:
    let RCUTILS_ERROR_FORMATTING_CHARACTERS* = 6 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/error_handling.h:81:9
else:
  static :
    hint("Declaration of " & "RCUTILS_ERROR_FORMATTING_CHARACTERS" &
        " already exists, not redeclaring")
when not declared(RCUTILS_ERROR_MESSAGE_MAX_LENGTH):
  when 1024 is static:
    const
      RCUTILS_ERROR_MESSAGE_MAX_LENGTH* = 1024 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/error_handling.h:84:9
  else:
    let RCUTILS_ERROR_MESSAGE_MAX_LENGTH* = 1024 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/error_handling.h:84:9
else:
  static :
    hint("Declaration of " & "RCUTILS_ERROR_MESSAGE_MAX_LENGTH" &
        " already exists, not redeclaring")
when not declared(RCUTILS_ERROR_STATE_MESSAGE_MAX_LENGTH):
  when 768 is static:
    const
      RCUTILS_ERROR_STATE_MESSAGE_MAX_LENGTH* = 768 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/error_handling.h:91:9
  else:
    let RCUTILS_ERROR_STATE_MESSAGE_MAX_LENGTH* = 768 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/error_handling.h:91:9
else:
  static :
    hint("Declaration of " & "RCUTILS_ERROR_STATE_MESSAGE_MAX_LENGTH" &
        " already exists, not redeclaring")
when not declared(rcutils_steady_time_now):
  proc rcutils_steady_time_now*(now: ptr rcutils_time_point_value_t_520094305): rcutils_ret_t_520094226 {.
      cdecl, importc: "rcutils_steady_time_now".}
else:
  static :
    hint("Declaration of " & "rcutils_steady_time_now" &
        " already exists, not redeclaring")
when not declared(RCUTILS_DEFAULT_LOGGER_DEFAULT_LEVEL):
  when RCUTILS_LOG_SEVERITY_INFO is typedesc:
    type
      RCUTILS_DEFAULT_LOGGER_DEFAULT_LEVEL* = RCUTILS_LOG_SEVERITY_INFO ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/logging.h:43:9
  else:
    when RCUTILS_LOG_SEVERITY_INFO is static:
      const
        RCUTILS_DEFAULT_LOGGER_DEFAULT_LEVEL* = RCUTILS_LOG_SEVERITY_INFO ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/logging.h:43:9
    else:
      let RCUTILS_DEFAULT_LOGGER_DEFAULT_LEVEL* = RCUTILS_LOG_SEVERITY_INFO ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/logging.h:43:9
else:
  static :
    hint("Declaration of " & "RCUTILS_DEFAULT_LOGGER_DEFAULT_LEVEL" &
        " already exists, not redeclaring")
when not declared(rcutils_get_zero_initialized_uint8_array):
  proc rcutils_get_zero_initialized_uint8_array*(): rcutils_uint8_array_t_520094303 {.
      cdecl, importc: "rcutils_get_zero_initialized_uint8_array".}
else:
  static :
    hint("Declaration of " & "rcutils_get_zero_initialized_uint8_array" &
        " already exists, not redeclaring")
when not declared(RMW_GID_STORAGE_SIZE):
  when cast[cuint](24'i64) is static:
    const
      RMW_GID_STORAGE_SIZE* = cast[cuint](24'i64) ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:42:9
  else:
    let RMW_GID_STORAGE_SIZE* = cast[cuint](24'i64) ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:42:9
else:
  static :
    hint("Declaration of " & "RMW_GID_STORAGE_SIZE" &
        " already exists, not redeclaring")
when not declared(RMW_QOS_DEADLINE_DEFAULT):
  when RMW_DURATION_UNSPECIFIED is typedesc:
    type
      RMW_QOS_DEADLINE_DEFAULT* = RMW_DURATION_UNSPECIFIED ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:460:9
  else:
    when RMW_DURATION_UNSPECIFIED is static:
      const
        RMW_QOS_DEADLINE_DEFAULT* = RMW_DURATION_UNSPECIFIED ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:460:9
    else:
      let RMW_QOS_DEADLINE_DEFAULT* = RMW_DURATION_UNSPECIFIED ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:460:9
else:
  static :
    hint("Declaration of " & "RMW_QOS_DEADLINE_DEFAULT" &
        " already exists, not redeclaring")
when not declared(RMW_QOS_LIFESPAN_DEFAULT):
  when RMW_DURATION_UNSPECIFIED is typedesc:
    type
      RMW_QOS_LIFESPAN_DEFAULT* = RMW_DURATION_UNSPECIFIED ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:463:9
  else:
    when RMW_DURATION_UNSPECIFIED is static:
      const
        RMW_QOS_LIFESPAN_DEFAULT* = RMW_DURATION_UNSPECIFIED ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:463:9
    else:
      let RMW_QOS_LIFESPAN_DEFAULT* = RMW_DURATION_UNSPECIFIED ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:463:9
else:
  static :
    hint("Declaration of " & "RMW_QOS_LIFESPAN_DEFAULT" &
        " already exists, not redeclaring")
when not declared(RMW_QOS_LIVELINESS_LEASE_DURATION_DEFAULT):
  when RMW_DURATION_UNSPECIFIED is typedesc:
    type
      RMW_QOS_LIVELINESS_LEASE_DURATION_DEFAULT* = RMW_DURATION_UNSPECIFIED ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:466:9
  else:
    when RMW_DURATION_UNSPECIFIED is static:
      const
        RMW_QOS_LIVELINESS_LEASE_DURATION_DEFAULT* = RMW_DURATION_UNSPECIFIED ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:466:9
    else:
      let RMW_QOS_LIVELINESS_LEASE_DURATION_DEFAULT* = RMW_DURATION_UNSPECIFIED ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:466:9
else:
  static :
    hint("Declaration of " & "RMW_QOS_LIVELINESS_LEASE_DURATION_DEFAULT" &
        " already exists, not redeclaring")
when not declared(RMW_MESSAGE_INFO_SEQUENCE_NUMBER_UNSUPPORTED):
  when UINT64_MAX is typedesc:
    type
      RMW_MESSAGE_INFO_SEQUENCE_NUMBER_UNSUPPORTED* = UINT64_MAX ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:525:9
  else:
    when UINT64_MAX is static:
      const
        RMW_MESSAGE_INFO_SEQUENCE_NUMBER_UNSUPPORTED* = UINT64_MAX ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:525:9
    else:
      let RMW_MESSAGE_INFO_SEQUENCE_NUMBER_UNSUPPORTED* = UINT64_MAX ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:525:9
else:
  static :
    hint("Declaration of " & "RMW_MESSAGE_INFO_SEQUENCE_NUMBER_UNSUPPORTED" &
        " already exists, not redeclaring")
when not declared(RCL_RET_OK):
  when RMW_RET_OK is typedesc:
    type
      RCL_RET_OK* = RMW_RET_OK ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:26:9
  else:
    when RMW_RET_OK is static:
      const
        RCL_RET_OK* = RMW_RET_OK ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:26:9
    else:
      let RCL_RET_OK* = RMW_RET_OK ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:26:9
else:
  static :
    hint("Declaration of " & "RCL_RET_OK" & " already exists, not redeclaring")
when not declared(RCL_RET_ERROR):
  when RMW_RET_ERROR is typedesc:
    type
      RCL_RET_ERROR* = RMW_RET_ERROR ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:28:9
  else:
    when RMW_RET_ERROR is static:
      const
        RCL_RET_ERROR* = RMW_RET_ERROR ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:28:9
    else:
      let RCL_RET_ERROR* = RMW_RET_ERROR ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:28:9
else:
  static :
    hint("Declaration of " & "RCL_RET_ERROR" &
        " already exists, not redeclaring")
when not declared(RCL_RET_TIMEOUT):
  when RMW_RET_TIMEOUT is typedesc:
    type
      RCL_RET_TIMEOUT* = RMW_RET_TIMEOUT ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:30:9
  else:
    when RMW_RET_TIMEOUT is static:
      const
        RCL_RET_TIMEOUT* = RMW_RET_TIMEOUT ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:30:9
    else:
      let RCL_RET_TIMEOUT* = RMW_RET_TIMEOUT ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:30:9
else:
  static :
    hint("Declaration of " & "RCL_RET_TIMEOUT" &
        " already exists, not redeclaring")
when not declared(RCL_RET_BAD_ALLOC):
  when RMW_RET_BAD_ALLOC is typedesc:
    type
      RCL_RET_BAD_ALLOC* = RMW_RET_BAD_ALLOC ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:32:9
  else:
    when RMW_RET_BAD_ALLOC is static:
      const
        RCL_RET_BAD_ALLOC* = RMW_RET_BAD_ALLOC ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:32:9
    else:
      let RCL_RET_BAD_ALLOC* = RMW_RET_BAD_ALLOC ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:32:9
else:
  static :
    hint("Declaration of " & "RCL_RET_BAD_ALLOC" &
        " already exists, not redeclaring")
when not declared(RCL_RET_INVALID_ARGUMENT):
  when RMW_RET_INVALID_ARGUMENT is typedesc:
    type
      RCL_RET_INVALID_ARGUMENT* = RMW_RET_INVALID_ARGUMENT ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:34:9
  else:
    when RMW_RET_INVALID_ARGUMENT is static:
      const
        RCL_RET_INVALID_ARGUMENT* = RMW_RET_INVALID_ARGUMENT ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:34:9
    else:
      let RCL_RET_INVALID_ARGUMENT* = RMW_RET_INVALID_ARGUMENT ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:34:9
else:
  static :
    hint("Declaration of " & "RCL_RET_INVALID_ARGUMENT" &
        " already exists, not redeclaring")
when not declared(RCL_RET_UNSUPPORTED):
  when RMW_RET_UNSUPPORTED is typedesc:
    type
      RCL_RET_UNSUPPORTED* = RMW_RET_UNSUPPORTED ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:36:9
  else:
    when RMW_RET_UNSUPPORTED is static:
      const
        RCL_RET_UNSUPPORTED* = RMW_RET_UNSUPPORTED ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:36:9
    else:
      let RCL_RET_UNSUPPORTED* = RMW_RET_UNSUPPORTED ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:36:9
else:
  static :
    hint("Declaration of " & "RCL_RET_UNSUPPORTED" &
        " already exists, not redeclaring")
when not declared(RCL_RET_ALREADY_INIT):
  when 100 is static:
    const
      RCL_RET_ALREADY_INIT* = 100 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:40:9
  else:
    let RCL_RET_ALREADY_INIT* = 100 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:40:9
else:
  static :
    hint("Declaration of " & "RCL_RET_ALREADY_INIT" &
        " already exists, not redeclaring")
when not declared(RCL_RET_NOT_INIT):
  when 101 is static:
    const
      RCL_RET_NOT_INIT* = 101 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:42:9
  else:
    let RCL_RET_NOT_INIT* = 101 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:42:9
else:
  static :
    hint("Declaration of " & "RCL_RET_NOT_INIT" &
        " already exists, not redeclaring")
when not declared(RCL_RET_MISMATCHED_RMW_ID):
  when 102 is static:
    const
      RCL_RET_MISMATCHED_RMW_ID* = 102 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:44:9
  else:
    let RCL_RET_MISMATCHED_RMW_ID* = 102 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:44:9
else:
  static :
    hint("Declaration of " & "RCL_RET_MISMATCHED_RMW_ID" &
        " already exists, not redeclaring")
when not declared(RCL_RET_TOPIC_NAME_INVALID):
  when 103 is static:
    const
      RCL_RET_TOPIC_NAME_INVALID* = 103 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:46:9
  else:
    let RCL_RET_TOPIC_NAME_INVALID* = 103 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:46:9
else:
  static :
    hint("Declaration of " & "RCL_RET_TOPIC_NAME_INVALID" &
        " already exists, not redeclaring")
when not declared(RCL_RET_SERVICE_NAME_INVALID):
  when 104 is static:
    const
      RCL_RET_SERVICE_NAME_INVALID* = 104 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:48:9
  else:
    let RCL_RET_SERVICE_NAME_INVALID* = 104 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:48:9
else:
  static :
    hint("Declaration of " & "RCL_RET_SERVICE_NAME_INVALID" &
        " already exists, not redeclaring")
when not declared(RCL_RET_UNKNOWN_SUBSTITUTION):
  when 105 is static:
    const
      RCL_RET_UNKNOWN_SUBSTITUTION* = 105 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:50:9
  else:
    let RCL_RET_UNKNOWN_SUBSTITUTION* = 105 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:50:9
else:
  static :
    hint("Declaration of " & "RCL_RET_UNKNOWN_SUBSTITUTION" &
        " already exists, not redeclaring")
when not declared(RCL_RET_ALREADY_SHUTDOWN):
  when 106 is static:
    const
      RCL_RET_ALREADY_SHUTDOWN* = 106 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:52:9
  else:
    let RCL_RET_ALREADY_SHUTDOWN* = 106 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:52:9
else:
  static :
    hint("Declaration of " & "RCL_RET_ALREADY_SHUTDOWN" &
        " already exists, not redeclaring")
when not declared(RCL_RET_NODE_INVALID):
  when 200 is static:
    const
      RCL_RET_NODE_INVALID* = 200 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:56:9
  else:
    let RCL_RET_NODE_INVALID* = 200 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:56:9
else:
  static :
    hint("Declaration of " & "RCL_RET_NODE_INVALID" &
        " already exists, not redeclaring")
when not declared(RCL_RET_NODE_INVALID_NAME):
  when 201 is static:
    const
      RCL_RET_NODE_INVALID_NAME* = 201 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:58:9
  else:
    let RCL_RET_NODE_INVALID_NAME* = 201 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:58:9
else:
  static :
    hint("Declaration of " & "RCL_RET_NODE_INVALID_NAME" &
        " already exists, not redeclaring")
when not declared(RCL_RET_NODE_INVALID_NAMESPACE):
  when 202 is static:
    const
      RCL_RET_NODE_INVALID_NAMESPACE* = 202 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:60:9
  else:
    let RCL_RET_NODE_INVALID_NAMESPACE* = 202 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:60:9
else:
  static :
    hint("Declaration of " & "RCL_RET_NODE_INVALID_NAMESPACE" &
        " already exists, not redeclaring")
when not declared(RCL_RET_NODE_NAME_NON_EXISTENT):
  when 203 is static:
    const
      RCL_RET_NODE_NAME_NON_EXISTENT* = 203 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:62:9
  else:
    let RCL_RET_NODE_NAME_NON_EXISTENT* = 203 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:62:9
else:
  static :
    hint("Declaration of " & "RCL_RET_NODE_NAME_NON_EXISTENT" &
        " already exists, not redeclaring")
when not declared(RCL_RET_PUBLISHER_INVALID):
  when 300 is static:
    const
      RCL_RET_PUBLISHER_INVALID* = 300 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:66:9
  else:
    let RCL_RET_PUBLISHER_INVALID* = 300 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:66:9
else:
  static :
    hint("Declaration of " & "RCL_RET_PUBLISHER_INVALID" &
        " already exists, not redeclaring")
when not declared(RCL_RET_SUBSCRIPTION_INVALID):
  when 400 is static:
    const
      RCL_RET_SUBSCRIPTION_INVALID* = 400 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:70:9
  else:
    let RCL_RET_SUBSCRIPTION_INVALID* = 400 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:70:9
else:
  static :
    hint("Declaration of " & "RCL_RET_SUBSCRIPTION_INVALID" &
        " already exists, not redeclaring")
when not declared(RCL_RET_SUBSCRIPTION_TAKE_FAILED):
  when 401 is static:
    const
      RCL_RET_SUBSCRIPTION_TAKE_FAILED* = 401 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:72:9
  else:
    let RCL_RET_SUBSCRIPTION_TAKE_FAILED* = 401 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:72:9
else:
  static :
    hint("Declaration of " & "RCL_RET_SUBSCRIPTION_TAKE_FAILED" &
        " already exists, not redeclaring")
when not declared(RCL_RET_CLIENT_INVALID):
  when 500 is static:
    const
      RCL_RET_CLIENT_INVALID* = 500 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:76:9
  else:
    let RCL_RET_CLIENT_INVALID* = 500 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:76:9
else:
  static :
    hint("Declaration of " & "RCL_RET_CLIENT_INVALID" &
        " already exists, not redeclaring")
when not declared(RCL_RET_CLIENT_TAKE_FAILED):
  when 501 is static:
    const
      RCL_RET_CLIENT_TAKE_FAILED* = 501 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:78:9
  else:
    let RCL_RET_CLIENT_TAKE_FAILED* = 501 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:78:9
else:
  static :
    hint("Declaration of " & "RCL_RET_CLIENT_TAKE_FAILED" &
        " already exists, not redeclaring")
when not declared(RCL_RET_SERVICE_INVALID):
  when 600 is static:
    const
      RCL_RET_SERVICE_INVALID* = 600 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:82:9
  else:
    let RCL_RET_SERVICE_INVALID* = 600 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:82:9
else:
  static :
    hint("Declaration of " & "RCL_RET_SERVICE_INVALID" &
        " already exists, not redeclaring")
when not declared(RCL_RET_SERVICE_TAKE_FAILED):
  when 601 is static:
    const
      RCL_RET_SERVICE_TAKE_FAILED* = 601 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:84:9
  else:
    let RCL_RET_SERVICE_TAKE_FAILED* = 601 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:84:9
else:
  static :
    hint("Declaration of " & "RCL_RET_SERVICE_TAKE_FAILED" &
        " already exists, not redeclaring")
when not declared(RCL_RET_TIMER_INVALID):
  when 800 is static:
    const
      RCL_RET_TIMER_INVALID* = 800 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:90:9
  else:
    let RCL_RET_TIMER_INVALID* = 800 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:90:9
else:
  static :
    hint("Declaration of " & "RCL_RET_TIMER_INVALID" &
        " already exists, not redeclaring")
when not declared(RCL_RET_TIMER_CANCELED):
  when 801 is static:
    const
      RCL_RET_TIMER_CANCELED* = 801 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:92:9
  else:
    let RCL_RET_TIMER_CANCELED* = 801 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:92:9
else:
  static :
    hint("Declaration of " & "RCL_RET_TIMER_CANCELED" &
        " already exists, not redeclaring")
when not declared(RCL_RET_WAIT_SET_INVALID):
  when 900 is static:
    const
      RCL_RET_WAIT_SET_INVALID* = 900 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:96:9
  else:
    let RCL_RET_WAIT_SET_INVALID* = 900 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:96:9
else:
  static :
    hint("Declaration of " & "RCL_RET_WAIT_SET_INVALID" &
        " already exists, not redeclaring")
when not declared(RCL_RET_WAIT_SET_EMPTY):
  when 901 is static:
    const
      RCL_RET_WAIT_SET_EMPTY* = 901 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:98:9
  else:
    let RCL_RET_WAIT_SET_EMPTY* = 901 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:98:9
else:
  static :
    hint("Declaration of " & "RCL_RET_WAIT_SET_EMPTY" &
        " already exists, not redeclaring")
when not declared(RCL_RET_WAIT_SET_FULL):
  when 902 is static:
    const
      RCL_RET_WAIT_SET_FULL* = 902 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:100:9
  else:
    let RCL_RET_WAIT_SET_FULL* = 902 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:100:9
else:
  static :
    hint("Declaration of " & "RCL_RET_WAIT_SET_FULL" &
        " already exists, not redeclaring")
when not declared(RCL_RET_INVALID_REMAP_RULE):
  when 1001 is static:
    const
      RCL_RET_INVALID_REMAP_RULE* = 1001 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:104:9
  else:
    let RCL_RET_INVALID_REMAP_RULE* = 1001 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:104:9
else:
  static :
    hint("Declaration of " & "RCL_RET_INVALID_REMAP_RULE" &
        " already exists, not redeclaring")
when not declared(RCL_RET_WRONG_LEXEME):
  when 1002 is static:
    const
      RCL_RET_WRONG_LEXEME* = 1002 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:106:9
  else:
    let RCL_RET_WRONG_LEXEME* = 1002 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:106:9
else:
  static :
    hint("Declaration of " & "RCL_RET_WRONG_LEXEME" &
        " already exists, not redeclaring")
when not declared(RCL_RET_INVALID_ROS_ARGS):
  when 1003 is static:
    const
      RCL_RET_INVALID_ROS_ARGS* = 1003 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:108:9
  else:
    let RCL_RET_INVALID_ROS_ARGS* = 1003 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:108:9
else:
  static :
    hint("Declaration of " & "RCL_RET_INVALID_ROS_ARGS" &
        " already exists, not redeclaring")
when not declared(RCL_RET_INVALID_PARAM_RULE):
  when 1010 is static:
    const
      RCL_RET_INVALID_PARAM_RULE* = 1010 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:110:9
  else:
    let RCL_RET_INVALID_PARAM_RULE* = 1010 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:110:9
else:
  static :
    hint("Declaration of " & "RCL_RET_INVALID_PARAM_RULE" &
        " already exists, not redeclaring")
when not declared(RCL_RET_INVALID_LOG_LEVEL_RULE):
  when 1020 is static:
    const
      RCL_RET_INVALID_LOG_LEVEL_RULE* = 1020 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:112:9
  else:
    let RCL_RET_INVALID_LOG_LEVEL_RULE* = 1020 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:112:9
else:
  static :
    hint("Declaration of " & "RCL_RET_INVALID_LOG_LEVEL_RULE" &
        " already exists, not redeclaring")
when not declared(RCL_RET_EVENT_INVALID):
  when 2000 is static:
    const
      RCL_RET_EVENT_INVALID* = 2000 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:116:9
  else:
    let RCL_RET_EVENT_INVALID* = 2000 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:116:9
else:
  static :
    hint("Declaration of " & "RCL_RET_EVENT_INVALID" &
        " already exists, not redeclaring")
when not declared(RCL_RET_EVENT_TAKE_FAILED):
  when 2001 is static:
    const
      RCL_RET_EVENT_TAKE_FAILED* = 2001 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:118:9
  else:
    let RCL_RET_EVENT_TAKE_FAILED* = 2001 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:118:9
else:
  static :
    hint("Declaration of " & "RCL_RET_EVENT_TAKE_FAILED" &
        " already exists, not redeclaring")
when not declared(RCL_RET_LIFECYCLE_STATE_REGISTERED):
  when 3000 is static:
    const
      RCL_RET_LIFECYCLE_STATE_REGISTERED* = 3000 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:122:9
  else:
    let RCL_RET_LIFECYCLE_STATE_REGISTERED* = 3000 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:122:9
else:
  static :
    hint("Declaration of " & "RCL_RET_LIFECYCLE_STATE_REGISTERED" &
        " already exists, not redeclaring")
when not declared(RCL_RET_LIFECYCLE_STATE_NOT_REGISTERED):
  when 3001 is static:
    const
      RCL_RET_LIFECYCLE_STATE_NOT_REGISTERED* = 3001 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:124:9
  else:
    let RCL_RET_LIFECYCLE_STATE_NOT_REGISTERED* = 3001 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:124:9
else:
  static :
    hint("Declaration of " & "RCL_RET_LIFECYCLE_STATE_NOT_REGISTERED" &
        " already exists, not redeclaring")
when not declared(RCL_S_TO_NS):
  when RCUTILS_S_TO_NS is typedesc:
    type
      RCL_S_TO_NS* = RCUTILS_S_TO_NS ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:32:9
  else:
    when RCUTILS_S_TO_NS is static:
      const
        RCL_S_TO_NS* = RCUTILS_S_TO_NS ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:32:9
    else:
      let RCL_S_TO_NS* = RCUTILS_S_TO_NS ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:32:9
else:
  static :
    hint("Declaration of " & "RCL_S_TO_NS" & " already exists, not redeclaring")
when not declared(RCL_MS_TO_NS):
  when RCUTILS_MS_TO_NS is typedesc:
    type
      RCL_MS_TO_NS* = RCUTILS_MS_TO_NS ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:34:9
  else:
    when RCUTILS_MS_TO_NS is static:
      const
        RCL_MS_TO_NS* = RCUTILS_MS_TO_NS ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:34:9
    else:
      let RCL_MS_TO_NS* = RCUTILS_MS_TO_NS ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:34:9
else:
  static :
    hint("Declaration of " & "RCL_MS_TO_NS" & " already exists, not redeclaring")
when not declared(RCL_US_TO_NS):
  when RCUTILS_US_TO_NS is typedesc:
    type
      RCL_US_TO_NS* = RCUTILS_US_TO_NS ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:36:9
  else:
    when RCUTILS_US_TO_NS is static:
      const
        RCL_US_TO_NS* = RCUTILS_US_TO_NS ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:36:9
    else:
      let RCL_US_TO_NS* = RCUTILS_US_TO_NS ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:36:9
else:
  static :
    hint("Declaration of " & "RCL_US_TO_NS" & " already exists, not redeclaring")
when not declared(RCL_NS_TO_S):
  when RCUTILS_NS_TO_S is typedesc:
    type
      RCL_NS_TO_S* = RCUTILS_NS_TO_S ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:39:9
  else:
    when RCUTILS_NS_TO_S is static:
      const
        RCL_NS_TO_S* = RCUTILS_NS_TO_S ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:39:9
    else:
      let RCL_NS_TO_S* = RCUTILS_NS_TO_S ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:39:9
else:
  static :
    hint("Declaration of " & "RCL_NS_TO_S" & " already exists, not redeclaring")
when not declared(RCL_NS_TO_MS):
  when RCUTILS_NS_TO_MS is typedesc:
    type
      RCL_NS_TO_MS* = RCUTILS_NS_TO_MS ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:41:9
  else:
    when RCUTILS_NS_TO_MS is static:
      const
        RCL_NS_TO_MS* = RCUTILS_NS_TO_MS ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:41:9
    else:
      let RCL_NS_TO_MS* = RCUTILS_NS_TO_MS ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:41:9
else:
  static :
    hint("Declaration of " & "RCL_NS_TO_MS" & " already exists, not redeclaring")
when not declared(RCL_NS_TO_US):
  when RCUTILS_NS_TO_US is typedesc:
    type
      RCL_NS_TO_US* = RCUTILS_NS_TO_US ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:43:9
  else:
    when RCUTILS_NS_TO_US is static:
      const
        RCL_NS_TO_US* = RCUTILS_NS_TO_US ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:43:9
    else:
      let RCL_NS_TO_US* = RCUTILS_NS_TO_US ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:43:9
else:
  static :
    hint("Declaration of " & "RCL_NS_TO_US" & " already exists, not redeclaring")
when not declared(RMW_SAFE_FWRITE_TO_STDERR):
  when RCUTILS_SAFE_FWRITE_TO_STDERR is typedesc:
    type
      RMW_SAFE_FWRITE_TO_STDERR* = RCUTILS_SAFE_FWRITE_TO_STDERR ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/error_handling.h:41:9
  else:
    when RCUTILS_SAFE_FWRITE_TO_STDERR is static:
      const
        RMW_SAFE_FWRITE_TO_STDERR* = RCUTILS_SAFE_FWRITE_TO_STDERR ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/error_handling.h:41:9
    else:
      let RMW_SAFE_FWRITE_TO_STDERR* = RCUTILS_SAFE_FWRITE_TO_STDERR ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/error_handling.h:41:9
else:
  static :
    hint("Declaration of " & "RMW_SAFE_FWRITE_TO_STDERR" &
        " already exists, not redeclaring")
when not declared(rcutils_set_error_state):
  proc rcutils_set_error_state*(error_string: cstring; file: cstring;
                                line_number: csize_t): void {.cdecl,
      importc: "rcutils_set_error_state".}
else:
  static :
    hint("Declaration of " & "rcutils_set_error_state" &
        " already exists, not redeclaring")
when not declared(rcutils_error_is_set):
  proc rcutils_error_is_set*(): bool {.cdecl, importc: "rcutils_error_is_set".}
else:
  static :
    hint("Declaration of " & "rcutils_error_is_set" &
        " already exists, not redeclaring")
when not declared(rcutils_get_error_state):
  proc rcutils_get_error_state*(): ptr rcutils_error_state_t_520094268 {.cdecl,
      importc: "rcutils_get_error_state".}
else:
  static :
    hint("Declaration of " & "rcutils_get_error_state" &
        " already exists, not redeclaring")
when not declared(rcutils_get_error_string):
  proc rcutils_get_error_string*(): rcutils_error_string_t_520094264 {.cdecl,
      importc: "rcutils_get_error_string".}
else:
  static :
    hint("Declaration of " & "rcutils_get_error_string" &
        " already exists, not redeclaring")
when not declared(rcutils_reset_error):
  proc rcutils_reset_error*(): void {.cdecl, importc: "rcutils_reset_error".}
else:
  static :
    hint("Declaration of " & "rcutils_reset_error" &
        " already exists, not redeclaring")
when not declared(rcutils_get_zero_initialized_allocator):
  proc rcutils_get_zero_initialized_allocator*(): rcutils_allocator_t_520094230 {.
      cdecl, importc: "rcutils_get_zero_initialized_allocator".}
else:
  static :
    hint("Declaration of " & "rcutils_get_zero_initialized_allocator" &
        " already exists, not redeclaring")
when not declared(rcutils_allocator_is_valid):
  proc rcutils_allocator_is_valid*(allocator: ptr rcutils_allocator_t_520094230): bool {.
      cdecl, importc: "rcutils_allocator_is_valid".}
else:
  static :
    hint("Declaration of " & "rcutils_allocator_is_valid" &
        " already exists, not redeclaring")
when not declared(rmw_get_zero_initialized_security_options):
  proc rmw_get_zero_initialized_security_options*(): rmw_security_options_t_520094246 {.
      cdecl, importc: "rmw_get_zero_initialized_security_options".}
else:
  static :
    hint("Declaration of " & "rmw_get_zero_initialized_security_options" &
        " already exists, not redeclaring")
when not declared(rmw_get_default_security_options):
  proc rmw_get_default_security_options*(): rmw_security_options_t_520094246 {.
      cdecl, importc: "rmw_get_default_security_options".}
else:
  static :
    hint("Declaration of " & "rmw_get_default_security_options" &
        " already exists, not redeclaring")
when not declared(rmw_security_options_copy):
  proc rmw_security_options_copy*(src: ptr rmw_security_options_t_520094246;
                                  allocator: ptr rcutils_allocator_t_520094230;
                                  dst: ptr rmw_security_options_t_520094246): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_security_options_copy".}
else:
  static :
    hint("Declaration of " & "rmw_security_options_copy" &
        " already exists, not redeclaring")
when not declared(rmw_security_options_set_root_path):
  proc rmw_security_options_set_root_path*(security_root_path: cstring;
      allocator: ptr rcutils_allocator_t_520094230;
      security_options: ptr rmw_security_options_t_520094246): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_security_options_set_root_path".}
else:
  static :
    hint("Declaration of " & "rmw_security_options_set_root_path" &
        " already exists, not redeclaring")
when not declared(rmw_security_options_fini):
  proc rmw_security_options_fini*(security_options: ptr rmw_security_options_t_520094246;
                                  allocator: ptr rcutils_allocator_t_520094230): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_security_options_fini".}
else:
  static :
    hint("Declaration of " & "rmw_security_options_fini" &
        " already exists, not redeclaring")
when not declared(rmw_get_zero_initialized_init_options):
  proc rmw_get_zero_initialized_init_options*(): rmw_init_options_t_520094252 {.
      cdecl, importc: "rmw_get_zero_initialized_init_options".}
else:
  static :
    hint("Declaration of " & "rmw_get_zero_initialized_init_options" &
        " already exists, not redeclaring")
when not declared(rmw_init_options_init):
  proc rmw_init_options_init*(init_options: ptr rmw_init_options_t_520094252;
                              allocator: rcutils_allocator_t_520094230): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_init_options_init".}
else:
  static :
    hint("Declaration of " & "rmw_init_options_init" &
        " already exists, not redeclaring")
when not declared(rmw_init_options_copy):
  proc rmw_init_options_copy*(src: ptr rmw_init_options_t_520094252;
                              dst: ptr rmw_init_options_t_520094252): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_init_options_copy".}
else:
  static :
    hint("Declaration of " & "rmw_init_options_copy" &
        " already exists, not redeclaring")
when not declared(rmw_init_options_fini):
  proc rmw_init_options_fini*(init_options: ptr rmw_init_options_t_520094252): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_init_options_fini".}
else:
  static :
    hint("Declaration of " & "rmw_init_options_fini" &
        " already exists, not redeclaring")
when not declared(rmw_get_zero_initialized_context):
  proc rmw_get_zero_initialized_context*(): rmw_context_t_520094258 {.cdecl,
      importc: "rmw_get_zero_initialized_context".}
else:
  static :
    hint("Declaration of " & "rmw_get_zero_initialized_context" &
        " already exists, not redeclaring")
when not declared(rmw_init):
  proc rmw_init*(options: ptr rmw_init_options_t_520094252;
                 context: ptr rmw_context_t_520094258): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_init".}
else:
  static :
    hint("Declaration of " & "rmw_init" & " already exists, not redeclaring")
when not declared(rmw_shutdown):
  proc rmw_shutdown*(context: ptr rmw_context_t_520094258): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_shutdown".}
else:
  static :
    hint("Declaration of " & "rmw_shutdown" & " already exists, not redeclaring")
when not declared(rmw_context_fini):
  proc rmw_context_fini*(context: ptr rmw_context_t_520094258): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_context_fini".}
else:
  static :
    hint("Declaration of " & "rmw_context_fini" &
        " already exists, not redeclaring")
when not declared(rcutils_snprintf):
  proc rcutils_snprintf*(buffer: cstring; buffer_size: csize_t; format: cstring): cint {.
      cdecl, varargs, importc: "rcutils_snprintf".}
else:
  static :
    hint("Declaration of " & "rcutils_snprintf" &
        " already exists, not redeclaring")
when not declared(rcutils_vsnprintf):
  proc rcutils_vsnprintf*(buffer: cstring; buffer_size: csize_t; format: cstring): cint {.
      cdecl, varargs, importc: "rcutils_vsnprintf".}
else:
  static :
    hint("Declaration of " & "rcutils_vsnprintf" &
        " already exists, not redeclaring")
when not declared(rcutils_fault_injection_is_test_complete):
  proc rcutils_fault_injection_is_test_complete*(): bool {.cdecl,
      importc: "rcutils_fault_injection_is_test_complete".}
else:
  static :
    hint("Declaration of " & "rcutils_fault_injection_is_test_complete" &
        " already exists, not redeclaring")
when not declared(rcutils_fault_injection_set_count):
  proc rcutils_fault_injection_set_count*(count: int_least64_t_520094260): void {.
      cdecl, importc: "rcutils_fault_injection_set_count".}
else:
  static :
    hint("Declaration of " & "rcutils_fault_injection_set_count" &
        " already exists, not redeclaring")
when not declared(rcutils_fault_injection_get_count):
  proc rcutils_fault_injection_get_count*(): int_least64_t_520094260 {.cdecl,
      importc: "rcutils_fault_injection_get_count".}
else:
  static :
    hint("Declaration of " & "rcutils_fault_injection_get_count" &
        " already exists, not redeclaring")
when not declared(internal_rcutils_fault_injection_maybe_fail):
  proc internal_rcutils_fault_injection_maybe_fail*(): int_least64_t_520094260 {.
      cdecl, importc: "_rcutils_fault_injection_maybe_fail".}
else:
  static :
    hint("Declaration of " & "internal_rcutils_fault_injection_maybe_fail" &
        " already exists, not redeclaring")
when not declared(rcutils_initialize_error_handling_thread_local_storage):
  proc rcutils_initialize_error_handling_thread_local_storage*(
      allocator: rcutils_allocator_t_520094230): rcutils_ret_t_520094226 {.
      cdecl, importc: "rcutils_initialize_error_handling_thread_local_storage".}
else:
  static :
    hint("Declaration of " &
        "rcutils_initialize_error_handling_thread_local_storage" &
        " already exists, not redeclaring")
when not declared(rcutils_get_zero_initialized_array_list):
  proc rcutils_get_zero_initialized_array_list*(): rcutils_array_list_t_520094272 {.
      cdecl, importc: "rcutils_get_zero_initialized_array_list".}
else:
  static :
    hint("Declaration of " & "rcutils_get_zero_initialized_array_list" &
        " already exists, not redeclaring")
when not declared(rcutils_array_list_init):
  proc rcutils_array_list_init*(array_list: ptr rcutils_array_list_t_520094272;
                                initial_capacity: csize_t; data_size: csize_t;
                                allocator: ptr rcutils_allocator_t_520094230): rcutils_ret_t_520094226 {.
      cdecl, importc: "rcutils_array_list_init".}
else:
  static :
    hint("Declaration of " & "rcutils_array_list_init" &
        " already exists, not redeclaring")
when not declared(rcutils_array_list_fini):
  proc rcutils_array_list_fini*(array_list: ptr rcutils_array_list_t_520094272): rcutils_ret_t_520094226 {.
      cdecl, importc: "rcutils_array_list_fini".}
else:
  static :
    hint("Declaration of " & "rcutils_array_list_fini" &
        " already exists, not redeclaring")
when not declared(rcutils_array_list_add):
  proc rcutils_array_list_add*(array_list: ptr rcutils_array_list_t_520094272;
                               data: pointer): rcutils_ret_t_520094226 {.cdecl,
      importc: "rcutils_array_list_add".}
else:
  static :
    hint("Declaration of " & "rcutils_array_list_add" &
        " already exists, not redeclaring")
when not declared(rcutils_array_list_set):
  proc rcutils_array_list_set*(array_list: ptr rcutils_array_list_t_520094272;
                               index: csize_t; data: pointer): rcutils_ret_t_520094226 {.
      cdecl, importc: "rcutils_array_list_set".}
else:
  static :
    hint("Declaration of " & "rcutils_array_list_set" &
        " already exists, not redeclaring")
when not declared(rcutils_array_list_remove):
  proc rcutils_array_list_remove*(array_list: ptr rcutils_array_list_t_520094272;
                                  index: csize_t): rcutils_ret_t_520094226 {.
      cdecl, importc: "rcutils_array_list_remove".}
else:
  static :
    hint("Declaration of " & "rcutils_array_list_remove" &
        " already exists, not redeclaring")
when not declared(rcutils_array_list_get):
  proc rcutils_array_list_get*(array_list: ptr rcutils_array_list_t_520094272;
                               index: csize_t; data: pointer): rcutils_ret_t_520094226 {.
      cdecl, importc: "rcutils_array_list_get".}
else:
  static :
    hint("Declaration of " & "rcutils_array_list_get" &
        " already exists, not redeclaring")
when not declared(rcutils_array_list_get_size):
  proc rcutils_array_list_get_size*(array_list: ptr rcutils_array_list_t_520094272;
                                    size: ptr csize_t): rcutils_ret_t_520094226 {.
      cdecl, importc: "rcutils_array_list_get_size".}
else:
  static :
    hint("Declaration of " & "rcutils_array_list_get_size" &
        " already exists, not redeclaring")
when not declared(rcutils_get_zero_initialized_char_array):
  proc rcutils_get_zero_initialized_char_array*(): rcutils_char_array_t_520094276 {.
      cdecl, importc: "rcutils_get_zero_initialized_char_array".}
else:
  static :
    hint("Declaration of " & "rcutils_get_zero_initialized_char_array" &
        " already exists, not redeclaring")
when not declared(rcutils_char_array_init):
  proc rcutils_char_array_init*(char_array: ptr rcutils_char_array_t_520094276;
                                buffer_capacity: csize_t;
                                allocator: ptr rcutils_allocator_t_520094230): rcutils_ret_t_520094226 {.
      cdecl, importc: "rcutils_char_array_init".}
else:
  static :
    hint("Declaration of " & "rcutils_char_array_init" &
        " already exists, not redeclaring")
when not declared(rcutils_char_array_fini):
  proc rcutils_char_array_fini*(char_array: ptr rcutils_char_array_t_520094276): rcutils_ret_t_520094226 {.
      cdecl, importc: "rcutils_char_array_fini".}
else:
  static :
    hint("Declaration of " & "rcutils_char_array_fini" &
        " already exists, not redeclaring")
when not declared(rcutils_char_array_resize):
  proc rcutils_char_array_resize*(char_array: ptr rcutils_char_array_t_520094276;
                                  new_size: csize_t): rcutils_ret_t_520094226 {.
      cdecl, importc: "rcutils_char_array_resize".}
else:
  static :
    hint("Declaration of " & "rcutils_char_array_resize" &
        " already exists, not redeclaring")
when not declared(rcutils_char_array_expand_as_needed):
  proc rcutils_char_array_expand_as_needed*(
      char_array: ptr rcutils_char_array_t_520094276; new_size: csize_t): rcutils_ret_t_520094226 {.
      cdecl, importc: "rcutils_char_array_expand_as_needed".}
else:
  static :
    hint("Declaration of " & "rcutils_char_array_expand_as_needed" &
        " already exists, not redeclaring")
when not declared(rcutils_char_array_vsprintf):
  proc rcutils_char_array_vsprintf*(char_array: ptr rcutils_char_array_t_520094276;
                                    format: cstring): rcutils_ret_t_520094226 {.
      cdecl, varargs, importc: "rcutils_char_array_vsprintf".}
else:
  static :
    hint("Declaration of " & "rcutils_char_array_vsprintf" &
        " already exists, not redeclaring")
when not declared(rcutils_char_array_strncat):
  proc rcutils_char_array_strncat*(char_array: ptr rcutils_char_array_t_520094276;
                                   src: cstring; n: csize_t): rcutils_ret_t_520094226 {.
      cdecl, importc: "rcutils_char_array_strncat".}
else:
  static :
    hint("Declaration of " & "rcutils_char_array_strncat" &
        " already exists, not redeclaring")
when not declared(rcutils_char_array_strcat):
  proc rcutils_char_array_strcat*(char_array: ptr rcutils_char_array_t_520094276;
                                  src: cstring): rcutils_ret_t_520094226 {.
      cdecl, importc: "rcutils_char_array_strcat".}
else:
  static :
    hint("Declaration of " & "rcutils_char_array_strcat" &
        " already exists, not redeclaring")
when not declared(rcutils_char_array_memcpy):
  proc rcutils_char_array_memcpy*(char_array: ptr rcutils_char_array_t_520094276;
                                  src: cstring; n: csize_t): rcutils_ret_t_520094226 {.
      cdecl, importc: "rcutils_char_array_memcpy".}
else:
  static :
    hint("Declaration of " & "rcutils_char_array_memcpy" &
        " already exists, not redeclaring")
when not declared(rcutils_char_array_strcpy):
  proc rcutils_char_array_strcpy*(char_array: ptr rcutils_char_array_t_520094276;
                                  src: cstring): rcutils_ret_t_520094226 {.
      cdecl, importc: "rcutils_char_array_strcpy".}
else:
  static :
    hint("Declaration of " & "rcutils_char_array_strcpy" &
        " already exists, not redeclaring")
when not declared(rcutils_hash_map_string_hash_func):
  proc rcutils_hash_map_string_hash_func*(key_str: pointer): csize_t {.cdecl,
      importc: "rcutils_hash_map_string_hash_func".}
else:
  static :
    hint("Declaration of " & "rcutils_hash_map_string_hash_func" &
        " already exists, not redeclaring")
when not declared(rcutils_hash_map_string_cmp_func):
  proc rcutils_hash_map_string_cmp_func*(val1: pointer; val2: pointer): cint {.
      cdecl, importc: "rcutils_hash_map_string_cmp_func".}
else:
  static :
    hint("Declaration of " & "rcutils_hash_map_string_cmp_func" &
        " already exists, not redeclaring")
when not declared(rcutils_get_zero_initialized_hash_map):
  proc rcutils_get_zero_initialized_hash_map*(): rcutils_hash_map_t_520094287 {.
      cdecl, importc: "rcutils_get_zero_initialized_hash_map".}
else:
  static :
    hint("Declaration of " & "rcutils_get_zero_initialized_hash_map" &
        " already exists, not redeclaring")
when not declared(rcutils_hash_map_init):
  proc rcutils_hash_map_init*(hash_map: ptr rcutils_hash_map_t_520094287;
                              initial_capacity: csize_t; key_size: csize_t;
                              data_size: csize_t;
                              key_hashing_func: rcutils_hash_map_key_hasher_t_520094289;
                              key_cmp_func: rcutils_hash_map_key_cmp_t_520094291;
                              allocator: ptr rcutils_allocator_t_520094230): rcutils_ret_t_520094226 {.
      cdecl, importc: "rcutils_hash_map_init".}
else:
  static :
    hint("Declaration of " & "rcutils_hash_map_init" &
        " already exists, not redeclaring")
when not declared(rcutils_hash_map_fini):
  proc rcutils_hash_map_fini*(hash_map: ptr rcutils_hash_map_t_520094287): rcutils_ret_t_520094226 {.
      cdecl, importc: "rcutils_hash_map_fini".}
else:
  static :
    hint("Declaration of " & "rcutils_hash_map_fini" &
        " already exists, not redeclaring")
when not declared(rcutils_hash_map_get_capacity):
  proc rcutils_hash_map_get_capacity*(hash_map: ptr rcutils_hash_map_t_520094287;
                                      capacity: ptr csize_t): rcutils_ret_t_520094226 {.
      cdecl, importc: "rcutils_hash_map_get_capacity".}
else:
  static :
    hint("Declaration of " & "rcutils_hash_map_get_capacity" &
        " already exists, not redeclaring")
when not declared(rcutils_hash_map_get_size):
  proc rcutils_hash_map_get_size*(hash_map: ptr rcutils_hash_map_t_520094287;
                                  size: ptr csize_t): rcutils_ret_t_520094226 {.
      cdecl, importc: "rcutils_hash_map_get_size".}
else:
  static :
    hint("Declaration of " & "rcutils_hash_map_get_size" &
        " already exists, not redeclaring")
when not declared(rcutils_hash_map_set):
  proc rcutils_hash_map_set*(hash_map: ptr rcutils_hash_map_t_520094287;
                             key: pointer; value: pointer): rcutils_ret_t_520094226 {.
      cdecl, importc: "rcutils_hash_map_set".}
else:
  static :
    hint("Declaration of " & "rcutils_hash_map_set" &
        " already exists, not redeclaring")
when not declared(rcutils_hash_map_unset):
  proc rcutils_hash_map_unset*(hash_map: ptr rcutils_hash_map_t_520094287;
                               key: pointer): rcutils_ret_t_520094226 {.cdecl,
      importc: "rcutils_hash_map_unset".}
else:
  static :
    hint("Declaration of " & "rcutils_hash_map_unset" &
        " already exists, not redeclaring")
when not declared(rcutils_hash_map_key_exists):
  proc rcutils_hash_map_key_exists*(hash_map: ptr rcutils_hash_map_t_520094287;
                                    key: pointer): bool {.cdecl,
      importc: "rcutils_hash_map_key_exists".}
else:
  static :
    hint("Declaration of " & "rcutils_hash_map_key_exists" &
        " already exists, not redeclaring")
when not declared(rcutils_hash_map_get):
  proc rcutils_hash_map_get*(hash_map: ptr rcutils_hash_map_t_520094287;
                             key: pointer; data: pointer): rcutils_ret_t_520094226 {.
      cdecl, importc: "rcutils_hash_map_get".}
else:
  static :
    hint("Declaration of " & "rcutils_hash_map_get" &
        " already exists, not redeclaring")
when not declared(rcutils_hash_map_get_next_key_and_data):
  proc rcutils_hash_map_get_next_key_and_data*(hash_map: ptr rcutils_hash_map_t_520094287;
      previous_key: pointer; key: pointer; data: pointer): rcutils_ret_t_520094226 {.
      cdecl, importc: "rcutils_hash_map_get_next_key_and_data".}
else:
  static :
    hint("Declaration of " & "rcutils_hash_map_get_next_key_and_data" &
        " already exists, not redeclaring")
when not declared(rcutils_qsort):
  proc rcutils_qsort*(ptrarg: pointer; count: csize_t; size: csize_t;
                      comp: proc (a0: pointer; a1: pointer): cint {.cdecl.}): rcutils_ret_t_520094226 {.
      cdecl, importc: "rcutils_qsort".}
else:
  static :
    hint("Declaration of " & "rcutils_qsort" &
        " already exists, not redeclaring")
when not declared(rcutils_get_zero_initialized_string_array):
  proc rcutils_get_zero_initialized_string_array*(): rcutils_string_array_t_520094295 {.
      cdecl, importc: "rcutils_get_zero_initialized_string_array".}
else:
  static :
    hint("Declaration of " & "rcutils_get_zero_initialized_string_array" &
        " already exists, not redeclaring")
when not declared(rcutils_string_array_init):
  proc rcutils_string_array_init*(string_array: ptr rcutils_string_array_t_520094295;
                                  size: csize_t;
                                  allocator: ptr rcutils_allocator_t_520094230): rcutils_ret_t_520094226 {.
      cdecl, importc: "rcutils_string_array_init".}
else:
  static :
    hint("Declaration of " & "rcutils_string_array_init" &
        " already exists, not redeclaring")
when not declared(rcutils_string_array_fini):
  proc rcutils_string_array_fini*(string_array: ptr rcutils_string_array_t_520094295): rcutils_ret_t_520094226 {.
      cdecl, importc: "rcutils_string_array_fini".}
else:
  static :
    hint("Declaration of " & "rcutils_string_array_fini" &
        " already exists, not redeclaring")
when not declared(rcutils_string_array_cmp):
  proc rcutils_string_array_cmp*(lhs: ptr rcutils_string_array_t_520094295;
                                 rhs: ptr rcutils_string_array_t_520094295;
                                 res: ptr cint): rcutils_ret_t_520094226 {.
      cdecl, importc: "rcutils_string_array_cmp".}
else:
  static :
    hint("Declaration of " & "rcutils_string_array_cmp" &
        " already exists, not redeclaring")
when not declared(rcutils_string_array_resize):
  proc rcutils_string_array_resize*(string_array: ptr rcutils_string_array_t_520094295;
                                    new_size: csize_t): rcutils_ret_t_520094226 {.
      cdecl, importc: "rcutils_string_array_resize".}
else:
  static :
    hint("Declaration of " & "rcutils_string_array_resize" &
        " already exists, not redeclaring")
when not declared(rcutils_string_array_sort_compare):
  proc rcutils_string_array_sort_compare*(lhs: pointer; rhs: pointer): cint {.
      cdecl, importc: "rcutils_string_array_sort_compare".}
else:
  static :
    hint("Declaration of " & "rcutils_string_array_sort_compare" &
        " already exists, not redeclaring")
when not declared(rcutils_get_zero_initialized_string_map):
  proc rcutils_get_zero_initialized_string_map*(): rcutils_string_map_t_520094299 {.
      cdecl, importc: "rcutils_get_zero_initialized_string_map".}
else:
  static :
    hint("Declaration of " & "rcutils_get_zero_initialized_string_map" &
        " already exists, not redeclaring")
when not declared(rcutils_string_map_init):
  proc rcutils_string_map_init*(string_map: ptr rcutils_string_map_t_520094299;
                                initial_capacity: csize_t;
                                allocator: rcutils_allocator_t_520094230): rcutils_ret_t_520094226 {.
      cdecl, importc: "rcutils_string_map_init".}
else:
  static :
    hint("Declaration of " & "rcutils_string_map_init" &
        " already exists, not redeclaring")
when not declared(rcutils_string_map_fini):
  proc rcutils_string_map_fini*(string_map: ptr rcutils_string_map_t_520094299): rcutils_ret_t_520094226 {.
      cdecl, importc: "rcutils_string_map_fini".}
else:
  static :
    hint("Declaration of " & "rcutils_string_map_fini" &
        " already exists, not redeclaring")
when not declared(rcutils_string_map_get_capacity):
  proc rcutils_string_map_get_capacity*(string_map: ptr rcutils_string_map_t_520094299;
                                        capacity: ptr csize_t): rcutils_ret_t_520094226 {.
      cdecl, importc: "rcutils_string_map_get_capacity".}
else:
  static :
    hint("Declaration of " & "rcutils_string_map_get_capacity" &
        " already exists, not redeclaring")
when not declared(rcutils_string_map_get_size):
  proc rcutils_string_map_get_size*(string_map: ptr rcutils_string_map_t_520094299;
                                    size: ptr csize_t): rcutils_ret_t_520094226 {.
      cdecl, importc: "rcutils_string_map_get_size".}
else:
  static :
    hint("Declaration of " & "rcutils_string_map_get_size" &
        " already exists, not redeclaring")
when not declared(rcutils_string_map_reserve):
  proc rcutils_string_map_reserve*(string_map: ptr rcutils_string_map_t_520094299;
                                   capacity: csize_t): rcutils_ret_t_520094226 {.
      cdecl, importc: "rcutils_string_map_reserve".}
else:
  static :
    hint("Declaration of " & "rcutils_string_map_reserve" &
        " already exists, not redeclaring")
when not declared(rcutils_string_map_clear):
  proc rcutils_string_map_clear*(string_map: ptr rcutils_string_map_t_520094299): rcutils_ret_t_520094226 {.
      cdecl, importc: "rcutils_string_map_clear".}
else:
  static :
    hint("Declaration of " & "rcutils_string_map_clear" &
        " already exists, not redeclaring")
when not declared(rcutils_string_map_set):
  proc rcutils_string_map_set*(string_map: ptr rcutils_string_map_t_520094299;
                               key: cstring; value: cstring): rcutils_ret_t_520094226 {.
      cdecl, importc: "rcutils_string_map_set".}
else:
  static :
    hint("Declaration of " & "rcutils_string_map_set" &
        " already exists, not redeclaring")
when not declared(rcutils_string_map_set_no_resize):
  proc rcutils_string_map_set_no_resize*(string_map: ptr rcutils_string_map_t_520094299;
      key: cstring; value: cstring): rcutils_ret_t_520094226 {.cdecl,
      importc: "rcutils_string_map_set_no_resize".}
else:
  static :
    hint("Declaration of " & "rcutils_string_map_set_no_resize" &
        " already exists, not redeclaring")
when not declared(rcutils_string_map_unset):
  proc rcutils_string_map_unset*(string_map: ptr rcutils_string_map_t_520094299;
                                 key: cstring): rcutils_ret_t_520094226 {.cdecl,
      importc: "rcutils_string_map_unset".}
else:
  static :
    hint("Declaration of " & "rcutils_string_map_unset" &
        " already exists, not redeclaring")
when not declared(rcutils_string_map_key_exists):
  proc rcutils_string_map_key_exists*(string_map: ptr rcutils_string_map_t_520094299;
                                      key: cstring): bool {.cdecl,
      importc: "rcutils_string_map_key_exists".}
else:
  static :
    hint("Declaration of " & "rcutils_string_map_key_exists" &
        " already exists, not redeclaring")
when not declared(rcutils_string_map_key_existsn):
  proc rcutils_string_map_key_existsn*(string_map: ptr rcutils_string_map_t_520094299;
                                       key: cstring; key_length: csize_t): bool {.
      cdecl, importc: "rcutils_string_map_key_existsn".}
else:
  static :
    hint("Declaration of " & "rcutils_string_map_key_existsn" &
        " already exists, not redeclaring")
when not declared(rcutils_string_map_get):
  proc rcutils_string_map_get*(string_map: ptr rcutils_string_map_t_520094299;
                               key: cstring): cstring {.cdecl,
      importc: "rcutils_string_map_get".}
else:
  static :
    hint("Declaration of " & "rcutils_string_map_get" &
        " already exists, not redeclaring")
when not declared(rcutils_string_map_getn):
  proc rcutils_string_map_getn*(string_map: ptr rcutils_string_map_t_520094299;
                                key: cstring; key_length: csize_t): cstring {.
      cdecl, importc: "rcutils_string_map_getn".}
else:
  static :
    hint("Declaration of " & "rcutils_string_map_getn" &
        " already exists, not redeclaring")
when not declared(rcutils_string_map_get_next_key):
  proc rcutils_string_map_get_next_key*(string_map: ptr rcutils_string_map_t_520094299;
                                        key: cstring): cstring {.cdecl,
      importc: "rcutils_string_map_get_next_key".}
else:
  static :
    hint("Declaration of " & "rcutils_string_map_get_next_key" &
        " already exists, not redeclaring")
when not declared(rcutils_string_map_copy):
  proc rcutils_string_map_copy*(src_string_map: ptr rcutils_string_map_t_520094299;
                                dst_string_map: ptr rcutils_string_map_t_520094299): rcutils_ret_t_520094226 {.
      cdecl, importc: "rcutils_string_map_copy".}
else:
  static :
    hint("Declaration of " & "rcutils_string_map_copy" &
        " already exists, not redeclaring")
when not declared(rcutils_uint8_array_init):
  proc rcutils_uint8_array_init*(uint8_array: ptr rcutils_uint8_array_t_520094303;
                                 buffer_capacity: csize_t;
                                 allocator: ptr rcutils_allocator_t_520094230): rcutils_ret_t_520094226 {.
      cdecl, importc: "rcutils_uint8_array_init".}
else:
  static :
    hint("Declaration of " & "rcutils_uint8_array_init" &
        " already exists, not redeclaring")
when not declared(rcutils_uint8_array_fini):
  proc rcutils_uint8_array_fini*(uint8_array: ptr rcutils_uint8_array_t_520094303): rcutils_ret_t_520094226 {.
      cdecl, importc: "rcutils_uint8_array_fini".}
else:
  static :
    hint("Declaration of " & "rcutils_uint8_array_fini" &
        " already exists, not redeclaring")
when not declared(rcutils_uint8_array_resize):
  proc rcutils_uint8_array_resize*(uint8_array: ptr rcutils_uint8_array_t_520094303;
                                   new_size: csize_t): rcutils_ret_t_520094226 {.
      cdecl, importc: "rcutils_uint8_array_resize".}
else:
  static :
    hint("Declaration of " & "rcutils_uint8_array_resize" &
        " already exists, not redeclaring")
when not declared(rcutils_system_time_now):
  proc rcutils_system_time_now*(now: ptr rcutils_time_point_value_t_520094305): rcutils_ret_t_520094226 {.
      cdecl, importc: "rcutils_system_time_now".}
else:
  static :
    hint("Declaration of " & "rcutils_system_time_now" &
        " already exists, not redeclaring")
when not declared(rcutils_time_point_value_as_nanoseconds_string):
  proc rcutils_time_point_value_as_nanoseconds_string*(
      time_point: ptr rcutils_time_point_value_t_520094305; str: cstring;
      str_size: csize_t): rcutils_ret_t_520094226 {.cdecl,
      importc: "rcutils_time_point_value_as_nanoseconds_string".}
else:
  static :
    hint("Declaration of " & "rcutils_time_point_value_as_nanoseconds_string" &
        " already exists, not redeclaring")
when not declared(rcutils_time_point_value_as_seconds_string):
  proc rcutils_time_point_value_as_seconds_string*(
      time_point: ptr rcutils_time_point_value_t_520094305; str: cstring;
      str_size: csize_t): rcutils_ret_t_520094226 {.cdecl,
      importc: "rcutils_time_point_value_as_seconds_string".}
else:
  static :
    hint("Declaration of " & "rcutils_time_point_value_as_seconds_string" &
        " already exists, not redeclaring")
when not declared(g_rcutils_logging_initialized):
  var g_rcutils_logging_initialized* {.importc: "g_rcutils_logging_initialized".}: bool
else:
  static :
    hint("Declaration of " & "g_rcutils_logging_initialized" &
        " already exists, not redeclaring")
when not declared(rcutils_logging_initialize_with_allocator):
  proc rcutils_logging_initialize_with_allocator*(allocator: rcutils_allocator_t_520094230): rcutils_ret_t_520094226 {.
      cdecl, importc: "rcutils_logging_initialize_with_allocator".}
else:
  static :
    hint("Declaration of " & "rcutils_logging_initialize_with_allocator" &
        " already exists, not redeclaring")
when not declared(rcutils_logging_initialize):
  proc rcutils_logging_initialize*(): rcutils_ret_t_520094226 {.cdecl,
      importc: "rcutils_logging_initialize".}
else:
  static :
    hint("Declaration of " & "rcutils_logging_initialize" &
        " already exists, not redeclaring")
when not declared(rcutils_logging_shutdown):
  proc rcutils_logging_shutdown*(): rcutils_ret_t_520094226 {.cdecl,
      importc: "rcutils_logging_shutdown".}
else:
  static :
    hint("Declaration of " & "rcutils_logging_shutdown" &
        " already exists, not redeclaring")
when not declared(g_rcutils_log_severity_names):
  var g_rcutils_log_severity_names* {.importc: "g_rcutils_log_severity_names".}: array[
      51'i64, cstring]
else:
  static :
    hint("Declaration of " & "g_rcutils_log_severity_names" &
        " already exists, not redeclaring")
when not declared(rcutils_logging_severity_level_from_string):
  proc rcutils_logging_severity_level_from_string*(severity_string: cstring;
      allocator: rcutils_allocator_t_520094230; severity: ptr cint): rcutils_ret_t_520094226 {.
      cdecl, importc: "rcutils_logging_severity_level_from_string".}
else:
  static :
    hint("Declaration of " & "rcutils_logging_severity_level_from_string" &
        " already exists, not redeclaring")
when not declared(g_rcutils_logging_output_handler):
  var g_rcutils_logging_output_handler* {.
      importc: "g_rcutils_logging_output_handler".}: rcutils_logging_output_handler_t_520094315
else:
  static :
    hint("Declaration of " & "g_rcutils_logging_output_handler" &
        " already exists, not redeclaring")
when not declared(rcutils_logging_get_output_handler):
  proc rcutils_logging_get_output_handler*(): rcutils_logging_output_handler_t_520094315 {.
      cdecl, importc: "rcutils_logging_get_output_handler".}
else:
  static :
    hint("Declaration of " & "rcutils_logging_get_output_handler" &
        " already exists, not redeclaring")
when not declared(rcutils_logging_set_output_handler):
  proc rcutils_logging_set_output_handler*(
      function: rcutils_logging_output_handler_t_520094315): void {.cdecl,
      importc: "rcutils_logging_set_output_handler".}
else:
  static :
    hint("Declaration of " & "rcutils_logging_set_output_handler" &
        " already exists, not redeclaring")
when not declared(rcutils_logging_format_message):
  proc rcutils_logging_format_message*(location: ptr rcutils_log_location_t_520094311;
                                       severity: cint; name: cstring;
                                       timestamp: rcutils_time_point_value_t_520094305;
                                       msg: cstring;
                                       logging_output: ptr rcutils_char_array_t_520094276): rcutils_ret_t_520094226 {.
      cdecl, importc: "rcutils_logging_format_message".}
else:
  static :
    hint("Declaration of " & "rcutils_logging_format_message" &
        " already exists, not redeclaring")
when not declared(g_rcutils_logging_default_logger_level):
  var g_rcutils_logging_default_logger_level*
      {.importc: "g_rcutils_logging_default_logger_level".}: cint
else:
  static :
    hint("Declaration of " & "g_rcutils_logging_default_logger_level" &
        " already exists, not redeclaring")
when not declared(rcutils_logging_get_default_logger_level):
  proc rcutils_logging_get_default_logger_level*(): cint {.cdecl,
      importc: "rcutils_logging_get_default_logger_level".}
else:
  static :
    hint("Declaration of " & "rcutils_logging_get_default_logger_level" &
        " already exists, not redeclaring")
when not declared(rcutils_logging_set_default_logger_level):
  proc rcutils_logging_set_default_logger_level*(level: cint): void {.cdecl,
      importc: "rcutils_logging_set_default_logger_level".}
else:
  static :
    hint("Declaration of " & "rcutils_logging_set_default_logger_level" &
        " already exists, not redeclaring")
when not declared(rcutils_logging_get_logger_level):
  proc rcutils_logging_get_logger_level*(name: cstring): cint {.cdecl,
      importc: "rcutils_logging_get_logger_level".}
else:
  static :
    hint("Declaration of " & "rcutils_logging_get_logger_level" &
        " already exists, not redeclaring")
when not declared(rcutils_logging_get_logger_leveln):
  proc rcutils_logging_get_logger_leveln*(name: cstring; name_length: csize_t): cint {.
      cdecl, importc: "rcutils_logging_get_logger_leveln".}
else:
  static :
    hint("Declaration of " & "rcutils_logging_get_logger_leveln" &
        " already exists, not redeclaring")
when not declared(rcutils_logging_set_logger_level):
  proc rcutils_logging_set_logger_level*(name: cstring; level: cint): rcutils_ret_t_520094226 {.
      cdecl, importc: "rcutils_logging_set_logger_level".}
else:
  static :
    hint("Declaration of " & "rcutils_logging_set_logger_level" &
        " already exists, not redeclaring")
when not declared(rcutils_logging_logger_is_enabled_for):
  proc rcutils_logging_logger_is_enabled_for*(name: cstring; severity: cint): bool {.
      cdecl, importc: "rcutils_logging_logger_is_enabled_for".}
else:
  static :
    hint("Declaration of " & "rcutils_logging_logger_is_enabled_for" &
        " already exists, not redeclaring")
when not declared(rcutils_logging_get_logger_effective_level):
  proc rcutils_logging_get_logger_effective_level*(name: cstring): cint {.cdecl,
      importc: "rcutils_logging_get_logger_effective_level".}
else:
  static :
    hint("Declaration of " & "rcutils_logging_get_logger_effective_level" &
        " already exists, not redeclaring")
when not declared(rcutils_log):
  proc rcutils_log*(location: ptr rcutils_log_location_t_520094311;
                    severity: cint; name: cstring; format: cstring): void {.
      cdecl, varargs, importc: "rcutils_log".}
else:
  static :
    hint("Declaration of " & "rcutils_log" & " already exists, not redeclaring")
when not declared(rcutils_logging_console_output_handler):
  proc rcutils_logging_console_output_handler*(
      location: ptr rcutils_log_location_t_520094311; severity: cint;
      name: cstring; timestamp: rcutils_time_point_value_t_520094305;
      format: cstring; args: ptr va_list_520094317): void {.cdecl,
      importc: "rcutils_logging_console_output_handler".}
else:
  static :
    hint("Declaration of " & "rcutils_logging_console_output_handler" &
        " already exists, not redeclaring")
when not declared(rmw_get_zero_initialized_content_filter_options):
  proc rmw_get_zero_initialized_content_filter_options*(): rmw_subscription_content_filter_options_t_520094355 {.
      cdecl, importc: "rmw_get_zero_initialized_content_filter_options".}
else:
  static :
    hint("Declaration of " & "rmw_get_zero_initialized_content_filter_options" &
        " already exists, not redeclaring")
when not declared(rmw_subscription_content_filter_options_init):
  proc rmw_subscription_content_filter_options_init*(filter_expression: cstring;
      expression_parameters_argc: csize_t;
      expression_parameter_argv: ptr UncheckedArray[cstring];
      allocator: ptr rcutils_allocator_t_520094230;
      options: ptr rmw_subscription_content_filter_options_t_520094355): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_subscription_content_filter_options_init".}
else:
  static :
    hint("Declaration of " & "rmw_subscription_content_filter_options_init" &
        " already exists, not redeclaring")
when not declared(rmw_subscription_content_filter_options_set):
  proc rmw_subscription_content_filter_options_set*(filter_expression: cstring;
      expression_parameters_argc: csize_t;
      expression_parameter_argv: ptr UncheckedArray[cstring];
      allocator: ptr rcutils_allocator_t_520094230;
      options: ptr rmw_subscription_content_filter_options_t_520094355): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_subscription_content_filter_options_set".}
else:
  static :
    hint("Declaration of " & "rmw_subscription_content_filter_options_set" &
        " already exists, not redeclaring")
when not declared(rmw_subscription_content_filter_options_copy):
  proc rmw_subscription_content_filter_options_copy*(
      src: ptr rmw_subscription_content_filter_options_t_520094355;
      allocator: ptr rcutils_allocator_t_520094230;
      dst: ptr rmw_subscription_content_filter_options_t_520094355): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_subscription_content_filter_options_copy".}
else:
  static :
    hint("Declaration of " & "rmw_subscription_content_filter_options_copy" &
        " already exists, not redeclaring")
when not declared(rmw_subscription_content_filter_options_fini):
  proc rmw_subscription_content_filter_options_fini*(
      options: ptr rmw_subscription_content_filter_options_t_520094355;
      allocator: ptr rcutils_allocator_t_520094230): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_subscription_content_filter_options_fini".}
else:
  static :
    hint("Declaration of " & "rmw_subscription_content_filter_options_fini" &
        " already exists, not redeclaring")
when not declared(rmw_time_equal):
  proc rmw_time_equal*(left: rmw_time_t_520094359; right: rmw_time_t_520094359): bool {.
      cdecl, importc: "rmw_time_equal".}
else:
  static :
    hint("Declaration of " & "rmw_time_equal" &
        " already exists, not redeclaring")
when not declared(rmw_time_total_nsec):
  proc rmw_time_total_nsec*(time: rmw_time_t_520094359): rmw_duration_t_520094363 {.
      cdecl, importc: "rmw_time_total_nsec".}
else:
  static :
    hint("Declaration of " & "rmw_time_total_nsec" &
        " already exists, not redeclaring")
when not declared(rmw_time_from_nsec):
  proc rmw_time_from_nsec*(nanoseconds: rmw_duration_t_520094363): rmw_time_t_520094359 {.
      cdecl, importc: "rmw_time_from_nsec".}
else:
  static :
    hint("Declaration of " & "rmw_time_from_nsec" &
        " already exists, not redeclaring")
when not declared(rmw_time_normalize):
  proc rmw_time_normalize*(time: rmw_time_t_520094359): rmw_time_t_520094359 {.
      cdecl, importc: "rmw_time_normalize".}
else:
  static :
    hint("Declaration of " & "rmw_time_normalize" &
        " already exists, not redeclaring")
when not declared(rmw_get_zero_initialized_message_info):
  proc rmw_get_zero_initialized_message_info*(): rmw_message_info_t_520094471 {.
      cdecl, importc: "rmw_get_zero_initialized_message_info".}
else:
  static :
    hint("Declaration of " & "rmw_get_zero_initialized_message_info" &
        " already exists, not redeclaring")
when not declared(rcl_get_zero_initialized_log_levels):
  proc rcl_get_zero_initialized_log_levels*(): rcl_log_levels_t_520094487 {.
      cdecl, importc: "rcl_get_zero_initialized_log_levels".}
else:
  static :
    hint("Declaration of " & "rcl_get_zero_initialized_log_levels" &
        " already exists, not redeclaring")
when not declared(rcl_log_levels_init):
  proc rcl_log_levels_init*(log_levels: ptr rcl_log_levels_t_520094487;
                            allocator: ptr rcl_allocator_t_520094232;
                            logger_count: csize_t): rcl_ret_t_520094475 {.cdecl,
      importc: "rcl_log_levels_init".}
else:
  static :
    hint("Declaration of " & "rcl_log_levels_init" &
        " already exists, not redeclaring")
when not declared(rcl_log_levels_copy):
  proc rcl_log_levels_copy*(src: ptr rcl_log_levels_t_520094487;
                            dst: ptr rcl_log_levels_t_520094487): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_log_levels_copy".}
else:
  static :
    hint("Declaration of " & "rcl_log_levels_copy" &
        " already exists, not redeclaring")
when not declared(rcl_log_levels_fini):
  proc rcl_log_levels_fini*(log_levels: ptr rcl_log_levels_t_520094487): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_log_levels_fini".}
else:
  static :
    hint("Declaration of " & "rcl_log_levels_fini" &
        " already exists, not redeclaring")
when not declared(rcl_log_levels_shrink_to_size):
  proc rcl_log_levels_shrink_to_size*(log_levels: ptr rcl_log_levels_t_520094487): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_log_levels_shrink_to_size".}
else:
  static :
    hint("Declaration of " & "rcl_log_levels_shrink_to_size" &
        " already exists, not redeclaring")
when not declared(rcl_log_levels_add_logger_setting):
  proc rcl_log_levels_add_logger_setting*(log_levels: ptr rcl_log_levels_t_520094487;
      logger_name: cstring; log_level: rcl_log_severity_t_520094479): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_log_levels_add_logger_setting".}
else:
  static :
    hint("Declaration of " & "rcl_log_levels_add_logger_setting" &
        " already exists, not redeclaring")
when not declared(rcl_get_zero_initialized_arguments):
  proc rcl_get_zero_initialized_arguments*(): rcl_arguments_t_520094493 {.cdecl,
      importc: "rcl_get_zero_initialized_arguments".}
else:
  static :
    hint("Declaration of " & "rcl_get_zero_initialized_arguments" &
        " already exists, not redeclaring")
when not declared(rcl_parse_arguments):
  proc rcl_parse_arguments*(argc: cint; argv: ptr ptr cschar;
                            allocator: rcl_allocator_t_520094232;
                            args_output: ptr rcl_arguments_t_520094493): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_parse_arguments".}
else:
  static :
    hint("Declaration of " & "rcl_parse_arguments" &
        " already exists, not redeclaring")
when not declared(rcl_arguments_get_count_unparsed):
  proc rcl_arguments_get_count_unparsed*(args: ptr rcl_arguments_t_520094493): cint {.
      cdecl, importc: "rcl_arguments_get_count_unparsed".}
else:
  static :
    hint("Declaration of " & "rcl_arguments_get_count_unparsed" &
        " already exists, not redeclaring")
when not declared(rcl_arguments_get_unparsed):
  proc rcl_arguments_get_unparsed*(args: ptr rcl_arguments_t_520094493;
                                   allocator: rcl_allocator_t_520094232;
                                   output_unparsed_indices: ptr ptr cint): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_arguments_get_unparsed".}
else:
  static :
    hint("Declaration of " & "rcl_arguments_get_unparsed" &
        " already exists, not redeclaring")
when not declared(rcl_arguments_get_count_unparsed_ros):
  proc rcl_arguments_get_count_unparsed_ros*(args: ptr rcl_arguments_t_520094493): cint {.
      cdecl, importc: "rcl_arguments_get_count_unparsed_ros".}
else:
  static :
    hint("Declaration of " & "rcl_arguments_get_count_unparsed_ros" &
        " already exists, not redeclaring")
when not declared(rcl_arguments_get_unparsed_ros):
  proc rcl_arguments_get_unparsed_ros*(args: ptr rcl_arguments_t_520094493;
                                       allocator: rcl_allocator_t_520094232;
      output_unparsed_ros_indices: ptr ptr cint): rcl_ret_t_520094475 {.cdecl,
      importc: "rcl_arguments_get_unparsed_ros".}
else:
  static :
    hint("Declaration of " & "rcl_arguments_get_unparsed_ros" &
        " already exists, not redeclaring")
when not declared(rcl_arguments_get_param_files_count):
  proc rcl_arguments_get_param_files_count*(args: ptr rcl_arguments_t_520094493): cint {.
      cdecl, importc: "rcl_arguments_get_param_files_count".}
else:
  static :
    hint("Declaration of " & "rcl_arguments_get_param_files_count" &
        " already exists, not redeclaring")
when not declared(rcl_arguments_get_param_files):
  proc rcl_arguments_get_param_files*(arguments: ptr rcl_arguments_t_520094493;
                                      allocator: rcl_allocator_t_520094232;
                                      parameter_files: ptr ptr ptr cschar): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_arguments_get_param_files".}
else:
  static :
    hint("Declaration of " & "rcl_arguments_get_param_files" &
        " already exists, not redeclaring")
when not declared(rcl_arguments_get_param_overrides):
  proc rcl_arguments_get_param_overrides*(arguments: ptr rcl_arguments_t_520094493;
      parameter_overrides: ptr ptr rcl_params_t_520094495): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_arguments_get_param_overrides".}
else:
  static :
    hint("Declaration of " & "rcl_arguments_get_param_overrides" &
        " already exists, not redeclaring")
when not declared(rcl_remove_ros_arguments):
  proc rcl_remove_ros_arguments*(argv: ptr ptr cschar;
                                 args: ptr rcl_arguments_t_520094493;
                                 allocator: rcl_allocator_t_520094232;
                                 nonros_argc: ptr cint;
                                 nonros_argv: ptr ptr ptr cschar): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_remove_ros_arguments".}
else:
  static :
    hint("Declaration of " & "rcl_remove_ros_arguments" &
        " already exists, not redeclaring")
when not declared(rcl_arguments_get_log_levels):
  proc rcl_arguments_get_log_levels*(arguments: ptr rcl_arguments_t_520094493;
                                     log_levels: ptr rcl_log_levels_t_520094487): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_arguments_get_log_levels".}
else:
  static :
    hint("Declaration of " & "rcl_arguments_get_log_levels" &
        " already exists, not redeclaring")
when not declared(rcl_arguments_copy):
  proc rcl_arguments_copy*(args: ptr rcl_arguments_t_520094493;
                           args_out: ptr rcl_arguments_t_520094493): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_arguments_copy".}
else:
  static :
    hint("Declaration of " & "rcl_arguments_copy" &
        " already exists, not redeclaring")
when not declared(rcl_arguments_fini):
  proc rcl_arguments_fini*(args: ptr rcl_arguments_t_520094493): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_arguments_fini".}
else:
  static :
    hint("Declaration of " & "rcl_arguments_fini" &
        " already exists, not redeclaring")
when not declared(rcl_get_zero_initialized_init_options):
  proc rcl_get_zero_initialized_init_options*(): rcl_init_options_t_520094501 {.
      cdecl, importc: "rcl_get_zero_initialized_init_options".}
else:
  static :
    hint("Declaration of " & "rcl_get_zero_initialized_init_options" &
        " already exists, not redeclaring")
when not declared(rcl_init_options_init):
  proc rcl_init_options_init*(init_options: ptr rcl_init_options_t_520094501;
                              allocator: rcl_allocator_t_520094232): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_init_options_init".}
else:
  static :
    hint("Declaration of " & "rcl_init_options_init" &
        " already exists, not redeclaring")
when not declared(rcl_init_options_copy):
  proc rcl_init_options_copy*(src: ptr rcl_init_options_t_520094501;
                              dst: ptr rcl_init_options_t_520094501): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_init_options_copy".}
else:
  static :
    hint("Declaration of " & "rcl_init_options_copy" &
        " already exists, not redeclaring")
when not declared(rcl_init_options_fini):
  proc rcl_init_options_fini*(init_options: ptr rcl_init_options_t_520094501): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_init_options_fini".}
else:
  static :
    hint("Declaration of " & "rcl_init_options_fini" &
        " already exists, not redeclaring")
when not declared(rcl_init_options_get_domain_id):
  proc rcl_init_options_get_domain_id*(init_options: ptr rcl_init_options_t_520094501;
                                       domain_id: ptr csize_t): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_init_options_get_domain_id".}
else:
  static :
    hint("Declaration of " & "rcl_init_options_get_domain_id" &
        " already exists, not redeclaring")
when not declared(rcl_init_options_set_domain_id):
  proc rcl_init_options_set_domain_id*(init_options: ptr rcl_init_options_t_520094501;
                                       domain_id: csize_t): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_init_options_set_domain_id".}
else:
  static :
    hint("Declaration of " & "rcl_init_options_set_domain_id" &
        " already exists, not redeclaring")
when not declared(rcl_init_options_get_rmw_init_options):
  proc rcl_init_options_get_rmw_init_options*(
      init_options: ptr rcl_init_options_t_520094501): ptr rmw_init_options_t_520094252 {.
      cdecl, importc: "rcl_init_options_get_rmw_init_options".}
else:
  static :
    hint("Declaration of " & "rcl_init_options_get_rmw_init_options" &
        " already exists, not redeclaring")
when not declared(rcl_init_options_get_allocator):
  proc rcl_init_options_get_allocator*(init_options: ptr rcl_init_options_t_520094501): ptr rcl_allocator_t_520094232 {.
      cdecl, importc: "rcl_init_options_get_allocator".}
else:
  static :
    hint("Declaration of " & "rcl_init_options_get_allocator" &
        " already exists, not redeclaring")
when not declared(rcl_get_zero_initialized_context):
  proc rcl_get_zero_initialized_context*(): rcl_context_t_520094509 {.cdecl,
      importc: "rcl_get_zero_initialized_context".}
else:
  static :
    hint("Declaration of " & "rcl_get_zero_initialized_context" &
        " already exists, not redeclaring")
when not declared(rcl_context_fini):
  proc rcl_context_fini*(context: ptr rcl_context_t_520094509): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_context_fini".}
else:
  static :
    hint("Declaration of " & "rcl_context_fini" &
        " already exists, not redeclaring")
when not declared(rcl_context_get_init_options):
  proc rcl_context_get_init_options*(context: ptr rcl_context_t_520094509): ptr rcl_init_options_t_520094501 {.
      cdecl, importc: "rcl_context_get_init_options".}
else:
  static :
    hint("Declaration of " & "rcl_context_get_init_options" &
        " already exists, not redeclaring")
when not declared(rcl_context_get_instance_id):
  proc rcl_context_get_instance_id*(context: ptr rcl_context_t_520094509): rcl_context_instance_id_t_520094503 {.
      cdecl, importc: "rcl_context_get_instance_id".}
else:
  static :
    hint("Declaration of " & "rcl_context_get_instance_id" &
        " already exists, not redeclaring")
when not declared(rcl_context_get_domain_id):
  proc rcl_context_get_domain_id*(context: ptr rcl_context_t_520094509;
                                  domain_id: ptr csize_t): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_context_get_domain_id".}
else:
  static :
    hint("Declaration of " & "rcl_context_get_domain_id" &
        " already exists, not redeclaring")
when not declared(rcl_context_is_valid):
  proc rcl_context_is_valid*(context: ptr rcl_context_t_520094509): bool {.
      cdecl, importc: "rcl_context_is_valid".}
else:
  static :
    hint("Declaration of " & "rcl_context_is_valid" &
        " already exists, not redeclaring")
when not declared(rcl_context_get_rmw_context):
  proc rcl_context_get_rmw_context*(context: ptr rcl_context_t_520094509): ptr rmw_context_t_520094258 {.
      cdecl, importc: "rcl_context_get_rmw_context".}
else:
  static :
    hint("Declaration of " & "rcl_context_get_rmw_context" &
        " already exists, not redeclaring")
when not declared(rcl_init):
  proc rcl_init*(argc: cint; argv: ptr ptr cschar;
                 options: ptr rcl_init_options_t_520094501;
                 context: ptr rcl_context_t_520094509): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_init".}
else:
  static :
    hint("Declaration of " & "rcl_init" & " already exists, not redeclaring")
when not declared(rcl_shutdown):
  proc rcl_shutdown*(context: ptr rcl_context_t_520094509): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_shutdown".}
else:
  static :
    hint("Declaration of " & "rcl_shutdown" & " already exists, not redeclaring")
when not declared(rcl_get_zero_initialized_guard_condition):
  proc rcl_get_zero_initialized_guard_condition*(): rcl_guard_condition_t_520094515 {.
      cdecl, importc: "rcl_get_zero_initialized_guard_condition".}
else:
  static :
    hint("Declaration of " & "rcl_get_zero_initialized_guard_condition" &
        " already exists, not redeclaring")
when not declared(rcl_guard_condition_init):
  proc rcl_guard_condition_init*(guard_condition: ptr rcl_guard_condition_t_520094515;
                                 context: ptr rcl_context_t_520094509;
                                 options: rcl_guard_condition_options_t_520094519): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_guard_condition_init".}
else:
  static :
    hint("Declaration of " & "rcl_guard_condition_init" &
        " already exists, not redeclaring")
when not declared(rcl_guard_condition_init_from_rmw):
  proc rcl_guard_condition_init_from_rmw*(
      guard_condition: ptr rcl_guard_condition_t_520094515;
      rmw_guard_condition: ptr rmw_guard_condition_t_520094403;
      context: ptr rcl_context_t_520094509;
      options: rcl_guard_condition_options_t_520094519): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_guard_condition_init_from_rmw".}
else:
  static :
    hint("Declaration of " & "rcl_guard_condition_init_from_rmw" &
        " already exists, not redeclaring")
when not declared(rcl_guard_condition_fini):
  proc rcl_guard_condition_fini*(guard_condition: ptr rcl_guard_condition_t_520094515): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_guard_condition_fini".}
else:
  static :
    hint("Declaration of " & "rcl_guard_condition_fini" &
        " already exists, not redeclaring")
when not declared(rcl_guard_condition_get_default_options):
  proc rcl_guard_condition_get_default_options*(): rcl_guard_condition_options_t_520094519 {.
      cdecl, importc: "rcl_guard_condition_get_default_options".}
else:
  static :
    hint("Declaration of " & "rcl_guard_condition_get_default_options" &
        " already exists, not redeclaring")
when not declared(rcl_trigger_guard_condition):
  proc rcl_trigger_guard_condition*(guard_condition: ptr rcl_guard_condition_t_520094515): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_trigger_guard_condition".}
else:
  static :
    hint("Declaration of " & "rcl_trigger_guard_condition" &
        " already exists, not redeclaring")
when not declared(rcl_guard_condition_get_options):
  proc rcl_guard_condition_get_options*(guard_condition: ptr rcl_guard_condition_t_520094515): ptr rcl_guard_condition_options_t_520094519 {.
      cdecl, importc: "rcl_guard_condition_get_options".}
else:
  static :
    hint("Declaration of " & "rcl_guard_condition_get_options" &
        " already exists, not redeclaring")
when not declared(rcl_guard_condition_get_rmw_handle):
  proc rcl_guard_condition_get_rmw_handle*(
      guard_condition: ptr rcl_guard_condition_t_520094515): ptr rmw_guard_condition_t_520094403 {.
      cdecl, importc: "rcl_guard_condition_get_rmw_handle".}
else:
  static :
    hint("Declaration of " & "rcl_guard_condition_get_rmw_handle" &
        " already exists, not redeclaring")
when not declared(RCL_DOMAIN_ID_ENV_VAR):
  var RCL_DOMAIN_ID_ENV_VAR* {.importc: "RCL_DOMAIN_ID_ENV_VAR".}: cstring
else:
  static :
    hint("Declaration of " & "RCL_DOMAIN_ID_ENV_VAR" &
        " already exists, not redeclaring")
when not declared(rcl_get_default_domain_id):
  proc rcl_get_default_domain_id*(domain_id: ptr csize_t): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_get_default_domain_id".}
else:
  static :
    hint("Declaration of " & "rcl_get_default_domain_id" &
        " already exists, not redeclaring")
when not declared(rcl_node_get_default_options):
  proc rcl_node_get_default_options*(): rcl_node_options_t_520094523 {.cdecl,
      importc: "rcl_node_get_default_options".}
else:
  static :
    hint("Declaration of " & "rcl_node_get_default_options" &
        " already exists, not redeclaring")
when not declared(rcl_node_options_copy):
  proc rcl_node_options_copy*(options: ptr rcl_node_options_t_520094523;
                              options_out: ptr rcl_node_options_t_520094523): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_node_options_copy".}
else:
  static :
    hint("Declaration of " & "rcl_node_options_copy" &
        " already exists, not redeclaring")
when not declared(rcl_node_options_fini):
  proc rcl_node_options_fini*(options: ptr rcl_node_options_t_520094523): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_node_options_fini".}
else:
  static :
    hint("Declaration of " & "rcl_node_options_fini" &
        " already exists, not redeclaring")
when not declared(RCL_DISABLE_LOANED_MESSAGES_ENV_VAR):
  var RCL_DISABLE_LOANED_MESSAGES_ENV_VAR*
      {.importc: "RCL_DISABLE_LOANED_MESSAGES_ENV_VAR".}: cstring
else:
  static :
    hint("Declaration of " & "RCL_DISABLE_LOANED_MESSAGES_ENV_VAR" &
        " already exists, not redeclaring")
when not declared(rcl_get_zero_initialized_node):
  proc rcl_get_zero_initialized_node*(): rcl_node_t_520094529 {.cdecl,
      importc: "rcl_get_zero_initialized_node".}
else:
  static :
    hint("Declaration of " & "rcl_get_zero_initialized_node" &
        " already exists, not redeclaring")
when not declared(rcl_node_init):
  proc rcl_node_init*(node: ptr rcl_node_t_520094529; name: cstring;
                      namespace: cstring; context: ptr rcl_context_t_520094509;
                      options: ptr rcl_node_options_t_520094523): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_node_init".}
else:
  static :
    hint("Declaration of " & "rcl_node_init" &
        " already exists, not redeclaring")
when not declared(rcl_node_fini):
  proc rcl_node_fini*(node: ptr rcl_node_t_520094529): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_node_fini".}
else:
  static :
    hint("Declaration of " & "rcl_node_fini" &
        " already exists, not redeclaring")
when not declared(rcl_node_is_valid):
  proc rcl_node_is_valid*(node: ptr rcl_node_t_520094529): bool {.cdecl,
      importc: "rcl_node_is_valid".}
else:
  static :
    hint("Declaration of " & "rcl_node_is_valid" &
        " already exists, not redeclaring")
when not declared(rcl_node_is_valid_except_context):
  proc rcl_node_is_valid_except_context*(node: ptr rcl_node_t_520094529): bool {.
      cdecl, importc: "rcl_node_is_valid_except_context".}
else:
  static :
    hint("Declaration of " & "rcl_node_is_valid_except_context" &
        " already exists, not redeclaring")
when not declared(rcl_node_get_name):
  proc rcl_node_get_name*(node: ptr rcl_node_t_520094529): cstring {.cdecl,
      importc: "rcl_node_get_name".}
else:
  static :
    hint("Declaration of " & "rcl_node_get_name" &
        " already exists, not redeclaring")
when not declared(rcl_node_get_namespace):
  proc rcl_node_get_namespace*(node: ptr rcl_node_t_520094529): cstring {.cdecl,
      importc: "rcl_node_get_namespace".}
else:
  static :
    hint("Declaration of " & "rcl_node_get_namespace" &
        " already exists, not redeclaring")
when not declared(rcl_node_get_fully_qualified_name):
  proc rcl_node_get_fully_qualified_name*(node: ptr rcl_node_t_520094529): cstring {.
      cdecl, importc: "rcl_node_get_fully_qualified_name".}
else:
  static :
    hint("Declaration of " & "rcl_node_get_fully_qualified_name" &
        " already exists, not redeclaring")
when not declared(rcl_node_get_options):
  proc rcl_node_get_options*(node: ptr rcl_node_t_520094529): ptr rcl_node_options_t_520094523 {.
      cdecl, importc: "rcl_node_get_options".}
else:
  static :
    hint("Declaration of " & "rcl_node_get_options" &
        " already exists, not redeclaring")
when not declared(rcl_node_get_domain_id):
  proc rcl_node_get_domain_id*(node: ptr rcl_node_t_520094529;
                               domain_id: ptr csize_t): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_node_get_domain_id".}
else:
  static :
    hint("Declaration of " & "rcl_node_get_domain_id" &
        " already exists, not redeclaring")
when not declared(rcl_node_get_rmw_handle):
  proc rcl_node_get_rmw_handle*(node: ptr rcl_node_t_520094529): ptr rmw_node_t_520094367 {.
      cdecl, importc: "rcl_node_get_rmw_handle".}
else:
  static :
    hint("Declaration of " & "rcl_node_get_rmw_handle" &
        " already exists, not redeclaring")
when not declared(rcl_node_get_rcl_instance_id):
  proc rcl_node_get_rcl_instance_id*(node: ptr rcl_node_t_520094529): uint64 {.
      cdecl, importc: "rcl_node_get_rcl_instance_id".}
else:
  static :
    hint("Declaration of " & "rcl_node_get_rcl_instance_id" &
        " already exists, not redeclaring")
when not declared(rcl_node_get_graph_guard_condition):
  proc rcl_node_get_graph_guard_condition*(node: ptr rcl_node_t_520094529): ptr rcl_guard_condition_t_520094515 {.
      cdecl, importc: "rcl_node_get_graph_guard_condition".}
else:
  static :
    hint("Declaration of " & "rcl_node_get_graph_guard_condition" &
        " already exists, not redeclaring")
when not declared(rcl_node_get_logger_name):
  proc rcl_node_get_logger_name*(node: ptr rcl_node_t_520094529): cstring {.
      cdecl, importc: "rcl_node_get_logger_name".}
else:
  static :
    hint("Declaration of " & "rcl_node_get_logger_name" &
        " already exists, not redeclaring")
when not declared(rcl_node_resolve_name):
  proc rcl_node_resolve_name*(node: ptr rcl_node_t_520094529;
                              input_name: cstring; allocator: rcl_allocator_t_520094232;
                              is_service: bool; only_expand: bool;
                              output_name: ptr ptr cschar): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_node_resolve_name".}
else:
  static :
    hint("Declaration of " & "rcl_node_resolve_name" &
        " already exists, not redeclaring")
when not declared(rcl_get_disable_loaned_message):
  proc rcl_get_disable_loaned_message*(disable_loaned_message: ptr bool): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_get_disable_loaned_message".}
else:
  static :
    hint("Declaration of " & "rcl_get_disable_loaned_message" &
        " already exists, not redeclaring")
when not declared(rcl_clock_valid):
  proc rcl_clock_valid*(clock: ptr rcl_clock_t_520094563): bool {.cdecl,
      importc: "rcl_clock_valid".}
else:
  static :
    hint("Declaration of " & "rcl_clock_valid" &
        " already exists, not redeclaring")
when not declared(rcl_clock_init):
  proc rcl_clock_init*(clock_type: rcl_clock_type_t_520094537;
                       clock: ptr rcl_clock_t_520094563;
                       allocator: ptr rcl_allocator_t_520094232): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_clock_init".}
else:
  static :
    hint("Declaration of " & "rcl_clock_init" &
        " already exists, not redeclaring")
when not declared(rcl_clock_fini):
  proc rcl_clock_fini*(clock: ptr rcl_clock_t_520094563): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_clock_fini".}
else:
  static :
    hint("Declaration of " & "rcl_clock_fini" &
        " already exists, not redeclaring")
when not declared(rcl_ros_clock_init):
  proc rcl_ros_clock_init*(clock: ptr rcl_clock_t_520094563;
                           allocator: ptr rcl_allocator_t_520094232): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_ros_clock_init".}
else:
  static :
    hint("Declaration of " & "rcl_ros_clock_init" &
        " already exists, not redeclaring")
when not declared(rcl_ros_clock_fini):
  proc rcl_ros_clock_fini*(clock: ptr rcl_clock_t_520094563): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_ros_clock_fini".}
else:
  static :
    hint("Declaration of " & "rcl_ros_clock_fini" &
        " already exists, not redeclaring")
when not declared(rcl_steady_clock_init):
  proc rcl_steady_clock_init*(clock: ptr rcl_clock_t_520094563;
                              allocator: ptr rcl_allocator_t_520094232): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_steady_clock_init".}
else:
  static :
    hint("Declaration of " & "rcl_steady_clock_init" &
        " already exists, not redeclaring")
when not declared(rcl_steady_clock_fini):
  proc rcl_steady_clock_fini*(clock: ptr rcl_clock_t_520094563): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_steady_clock_fini".}
else:
  static :
    hint("Declaration of " & "rcl_steady_clock_fini" &
        " already exists, not redeclaring")
when not declared(rcl_system_clock_init):
  proc rcl_system_clock_init*(clock: ptr rcl_clock_t_520094563;
                              allocator: ptr rcl_allocator_t_520094232): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_system_clock_init".}
else:
  static :
    hint("Declaration of " & "rcl_system_clock_init" &
        " already exists, not redeclaring")
when not declared(rcl_system_clock_fini):
  proc rcl_system_clock_fini*(clock: ptr rcl_clock_t_520094563): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_system_clock_fini".}
else:
  static :
    hint("Declaration of " & "rcl_system_clock_fini" &
        " already exists, not redeclaring")
when not declared(rcl_difference_times):
  proc rcl_difference_times*(start: ptr rcl_time_point_t_520094567;
                             finish: ptr rcl_time_point_t_520094567;
                             delta: ptr rcl_duration_t_520094541): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_difference_times".}
else:
  static :
    hint("Declaration of " & "rcl_difference_times" &
        " already exists, not redeclaring")
when not declared(rcl_clock_get_now):
  proc rcl_clock_get_now*(clock: ptr rcl_clock_t_520094563;
                          time_point_value: ptr rcl_time_point_value_t_520094531): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_clock_get_now".}
else:
  static :
    hint("Declaration of " & "rcl_clock_get_now" &
        " already exists, not redeclaring")
when not declared(rcl_enable_ros_time_override):
  proc rcl_enable_ros_time_override*(clock: ptr rcl_clock_t_520094563): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_enable_ros_time_override".}
else:
  static :
    hint("Declaration of " & "rcl_enable_ros_time_override" &
        " already exists, not redeclaring")
when not declared(rcl_disable_ros_time_override):
  proc rcl_disable_ros_time_override*(clock: ptr rcl_clock_t_520094563): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_disable_ros_time_override".}
else:
  static :
    hint("Declaration of " & "rcl_disable_ros_time_override" &
        " already exists, not redeclaring")
when not declared(rcl_is_enabled_ros_time_override):
  proc rcl_is_enabled_ros_time_override*(clock: ptr rcl_clock_t_520094563;
      is_enabled: ptr bool): rcl_ret_t_520094475 {.cdecl,
      importc: "rcl_is_enabled_ros_time_override".}
else:
  static :
    hint("Declaration of " & "rcl_is_enabled_ros_time_override" &
        " already exists, not redeclaring")
when not declared(rcl_set_ros_time_override):
  proc rcl_set_ros_time_override*(clock: ptr rcl_clock_t_520094563;
                                  time_value: rcl_time_point_value_t_520094531): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_set_ros_time_override".}
else:
  static :
    hint("Declaration of " & "rcl_set_ros_time_override" &
        " already exists, not redeclaring")
when not declared(rcl_clock_add_jump_callback):
  proc rcl_clock_add_jump_callback*(clock: ptr rcl_clock_t_520094563;
                                    threshold: rcl_jump_threshold_t_520094555;
                                    callback: rcl_jump_callback_t_520094551;
                                    user_data: pointer): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_clock_add_jump_callback".}
else:
  static :
    hint("Declaration of " & "rcl_clock_add_jump_callback" &
        " already exists, not redeclaring")
when not declared(rcl_clock_remove_jump_callback):
  proc rcl_clock_remove_jump_callback*(clock: ptr rcl_clock_t_520094563;
                                       callback: rcl_jump_callback_t_520094551;
                                       user_data: pointer): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_clock_remove_jump_callback".}
else:
  static :
    hint("Declaration of " & "rcl_clock_remove_jump_callback" &
        " already exists, not redeclaring")
when not declared(rcl_get_zero_initialized_publisher):
  proc rcl_get_zero_initialized_publisher*(): rcl_publisher_t_520094573 {.cdecl,
      importc: "rcl_get_zero_initialized_publisher".}
else:
  static :
    hint("Declaration of " & "rcl_get_zero_initialized_publisher" &
        " already exists, not redeclaring")
when not declared(rcl_publisher_init):
  proc rcl_publisher_init*(publisher: ptr rcl_publisher_t_520094573;
                           node: ptr rcl_node_t_520094529;
                           type_support: ptr rosidl_message_type_support_t_520094579;
                           topic_name: cstring;
                           options: ptr rcl_publisher_options_t_520094577): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_publisher_init".}
else:
  static :
    hint("Declaration of " & "rcl_publisher_init" &
        " already exists, not redeclaring")
when not declared(rcl_publisher_fini):
  proc rcl_publisher_fini*(publisher: ptr rcl_publisher_t_520094573;
                           node: ptr rcl_node_t_520094529): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_publisher_fini".}
else:
  static :
    hint("Declaration of " & "rcl_publisher_fini" &
        " already exists, not redeclaring")
when not declared(rcl_publisher_get_default_options):
  proc rcl_publisher_get_default_options*(): rcl_publisher_options_t_520094577 {.
      cdecl, importc: "rcl_publisher_get_default_options".}
else:
  static :
    hint("Declaration of " & "rcl_publisher_get_default_options" &
        " already exists, not redeclaring")
when not declared(rcl_borrow_loaned_message):
  proc rcl_borrow_loaned_message*(publisher: ptr rcl_publisher_t_520094573;
      type_support: ptr rosidl_message_type_support_t_520094579;
                                  ros_message: ptr pointer): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_borrow_loaned_message".}
else:
  static :
    hint("Declaration of " & "rcl_borrow_loaned_message" &
        " already exists, not redeclaring")
when not declared(rcl_return_loaned_message_from_publisher):
  proc rcl_return_loaned_message_from_publisher*(publisher: ptr rcl_publisher_t_520094573;
      loaned_message: pointer): rcl_ret_t_520094475 {.cdecl,
      importc: "rcl_return_loaned_message_from_publisher".}
else:
  static :
    hint("Declaration of " & "rcl_return_loaned_message_from_publisher" &
        " already exists, not redeclaring")
when not declared(rcl_publish):
  proc rcl_publish*(publisher: ptr rcl_publisher_t_520094573;
                    ros_message: pointer;
                    allocation: ptr rmw_publisher_allocation_t_520094407): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_publish".}
else:
  static :
    hint("Declaration of " & "rcl_publish" & " already exists, not redeclaring")
when not declared(rcl_publish_serialized_message):
  proc rcl_publish_serialized_message*(publisher: ptr rcl_publisher_t_520094573;
      serialized_message: ptr rcl_serialized_message_t_520094477; allocation: ptr rmw_publisher_allocation_t_520094407): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_publish_serialized_message".}
else:
  static :
    hint("Declaration of " & "rcl_publish_serialized_message" &
        " already exists, not redeclaring")
when not declared(rcl_publish_loaned_message):
  proc rcl_publish_loaned_message*(publisher: ptr rcl_publisher_t_520094573;
                                   ros_message: pointer;
                                   allocation: ptr rmw_publisher_allocation_t_520094407): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_publish_loaned_message".}
else:
  static :
    hint("Declaration of " & "rcl_publish_loaned_message" &
        " already exists, not redeclaring")
when not declared(rcl_publisher_assert_liveliness):
  proc rcl_publisher_assert_liveliness*(publisher: ptr rcl_publisher_t_520094573): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_publisher_assert_liveliness".}
else:
  static :
    hint("Declaration of " & "rcl_publisher_assert_liveliness" &
        " already exists, not redeclaring")
when not declared(rcl_publisher_wait_for_all_acked):
  proc rcl_publisher_wait_for_all_acked*(publisher: ptr rcl_publisher_t_520094573;
      timeout: rcl_duration_value_t_520094533): rcl_ret_t_520094475 {.cdecl,
      importc: "rcl_publisher_wait_for_all_acked".}
else:
  static :
    hint("Declaration of " & "rcl_publisher_wait_for_all_acked" &
        " already exists, not redeclaring")
when not declared(rcl_publisher_get_topic_name):
  proc rcl_publisher_get_topic_name*(publisher: ptr rcl_publisher_t_520094573): cstring {.
      cdecl, importc: "rcl_publisher_get_topic_name".}
else:
  static :
    hint("Declaration of " & "rcl_publisher_get_topic_name" &
        " already exists, not redeclaring")
when not declared(rcl_publisher_get_options):
  proc rcl_publisher_get_options*(publisher: ptr rcl_publisher_t_520094573): ptr rcl_publisher_options_t_520094577 {.
      cdecl, importc: "rcl_publisher_get_options".}
else:
  static :
    hint("Declaration of " & "rcl_publisher_get_options" &
        " already exists, not redeclaring")
when not declared(rcl_publisher_get_rmw_handle):
  proc rcl_publisher_get_rmw_handle*(publisher: ptr rcl_publisher_t_520094573): ptr rmw_publisher_t_520094383 {.
      cdecl, importc: "rcl_publisher_get_rmw_handle".}
else:
  static :
    hint("Declaration of " & "rcl_publisher_get_rmw_handle" &
        " already exists, not redeclaring")
when not declared(rcl_publisher_get_context):
  proc rcl_publisher_get_context*(publisher: ptr rcl_publisher_t_520094573): ptr rcl_context_t_520094509 {.
      cdecl, importc: "rcl_publisher_get_context".}
else:
  static :
    hint("Declaration of " & "rcl_publisher_get_context" &
        " already exists, not redeclaring")
when not declared(rcl_publisher_is_valid):
  proc rcl_publisher_is_valid*(publisher: ptr rcl_publisher_t_520094573): bool {.
      cdecl, importc: "rcl_publisher_is_valid".}
else:
  static :
    hint("Declaration of " & "rcl_publisher_is_valid" &
        " already exists, not redeclaring")
when not declared(rcl_publisher_is_valid_except_context):
  proc rcl_publisher_is_valid_except_context*(publisher: ptr rcl_publisher_t_520094573): bool {.
      cdecl, importc: "rcl_publisher_is_valid_except_context".}
else:
  static :
    hint("Declaration of " & "rcl_publisher_is_valid_except_context" &
        " already exists, not redeclaring")
when not declared(rcl_publisher_get_subscription_count):
  proc rcl_publisher_get_subscription_count*(publisher: ptr rcl_publisher_t_520094573;
      subscription_count: ptr csize_t): rcl_ret_t_520094475 {.cdecl,
      importc: "rcl_publisher_get_subscription_count".}
else:
  static :
    hint("Declaration of " & "rcl_publisher_get_subscription_count" &
        " already exists, not redeclaring")
when not declared(rcl_publisher_get_actual_qos):
  proc rcl_publisher_get_actual_qos*(publisher: ptr rcl_publisher_t_520094573): ptr rmw_qos_profile_t_520094463 {.
      cdecl, importc: "rcl_publisher_get_actual_qos".}
else:
  static :
    hint("Declaration of " & "rcl_publisher_get_actual_qos" &
        " already exists, not redeclaring")
when not declared(rcl_publisher_can_loan_messages):
  proc rcl_publisher_can_loan_messages*(publisher: ptr rcl_publisher_t_520094573): bool {.
      cdecl, importc: "rcl_publisher_can_loan_messages".}
else:
  static :
    hint("Declaration of " & "rcl_publisher_can_loan_messages" &
        " already exists, not redeclaring")
when not declared(rmw_get_zero_initialized_message_sequence):
  proc rmw_get_zero_initialized_message_sequence*(): rmw_message_sequence_t_520094587 {.
      cdecl, importc: "rmw_get_zero_initialized_message_sequence".}
else:
  static :
    hint("Declaration of " & "rmw_get_zero_initialized_message_sequence" &
        " already exists, not redeclaring")
when not declared(rmw_message_sequence_init):
  proc rmw_message_sequence_init*(sequence: ptr rmw_message_sequence_t_520094587;
                                  size: csize_t;
                                  allocator: ptr rcutils_allocator_t_520094230): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_message_sequence_init".}
else:
  static :
    hint("Declaration of " & "rmw_message_sequence_init" &
        " already exists, not redeclaring")
when not declared(rmw_message_sequence_fini):
  proc rmw_message_sequence_fini*(sequence: ptr rmw_message_sequence_t_520094587): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_message_sequence_fini".}
else:
  static :
    hint("Declaration of " & "rmw_message_sequence_fini" &
        " already exists, not redeclaring")
when not declared(rmw_get_zero_initialized_message_info_sequence):
  proc rmw_get_zero_initialized_message_info_sequence*(): rmw_message_info_sequence_t_520094591 {.
      cdecl, importc: "rmw_get_zero_initialized_message_info_sequence".}
else:
  static :
    hint("Declaration of " & "rmw_get_zero_initialized_message_info_sequence" &
        " already exists, not redeclaring")
when not declared(rmw_message_info_sequence_init):
  proc rmw_message_info_sequence_init*(sequence: ptr rmw_message_info_sequence_t_520094591;
                                       size: csize_t;
                                       allocator: ptr rcutils_allocator_t_520094230): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_message_info_sequence_init".}
else:
  static :
    hint("Declaration of " & "rmw_message_info_sequence_init" &
        " already exists, not redeclaring")
when not declared(rmw_message_info_sequence_fini):
  proc rmw_message_info_sequence_fini*(sequence: ptr rmw_message_info_sequence_t_520094591): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_message_info_sequence_fini".}
else:
  static :
    hint("Declaration of " & "rmw_message_info_sequence_fini" &
        " already exists, not redeclaring")
when not declared(rcl_get_zero_initialized_subscription):
  proc rcl_get_zero_initialized_subscription*(): rcl_subscription_t_520094597 {.
      cdecl, importc: "rcl_get_zero_initialized_subscription".}
else:
  static :
    hint("Declaration of " & "rcl_get_zero_initialized_subscription" &
        " already exists, not redeclaring")
when not declared(rcl_subscription_init):
  proc rcl_subscription_init*(subscription: ptr rcl_subscription_t_520094597;
                              node: ptr rcl_node_t_520094529;
                              type_support: ptr rosidl_message_type_support_t_520094579;
                              topic_name: cstring;
                              options: ptr rcl_subscription_options_t_520094601): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_subscription_init".}
else:
  static :
    hint("Declaration of " & "rcl_subscription_init" &
        " already exists, not redeclaring")
when not declared(rcl_subscription_fini):
  proc rcl_subscription_fini*(subscription: ptr rcl_subscription_t_520094597;
                              node: ptr rcl_node_t_520094529): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_subscription_fini".}
else:
  static :
    hint("Declaration of " & "rcl_subscription_fini" &
        " already exists, not redeclaring")
when not declared(rcl_subscription_get_default_options):
  proc rcl_subscription_get_default_options*(): rcl_subscription_options_t_520094601 {.
      cdecl, importc: "rcl_subscription_get_default_options".}
else:
  static :
    hint("Declaration of " & "rcl_subscription_get_default_options" &
        " already exists, not redeclaring")
when not declared(rcl_subscription_options_fini):
  proc rcl_subscription_options_fini*(option: ptr rcl_subscription_options_t_520094601): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_subscription_options_fini".}
else:
  static :
    hint("Declaration of " & "rcl_subscription_options_fini" &
        " already exists, not redeclaring")
when not declared(rcl_subscription_options_set_content_filter_options):
  proc rcl_subscription_options_set_content_filter_options*(
      filter_expression: cstring; expression_parameters_argc: csize_t;
      expression_parameter_argv: ptr UncheckedArray[cstring];
      options: ptr rcl_subscription_options_t_520094601): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_subscription_options_set_content_filter_options".}
else:
  static :
    hint("Declaration of " &
        "rcl_subscription_options_set_content_filter_options" &
        " already exists, not redeclaring")
when not declared(rcl_get_zero_initialized_subscription_content_filter_options):
  proc rcl_get_zero_initialized_subscription_content_filter_options*(): rcl_subscription_content_filter_options_t_520094605 {.
      cdecl,
      importc: "rcl_get_zero_initialized_subscription_content_filter_options".}
else:
  static :
    hint("Declaration of " &
        "rcl_get_zero_initialized_subscription_content_filter_options" &
        " already exists, not redeclaring")
when not declared(rcl_subscription_content_filter_options_init):
  proc rcl_subscription_content_filter_options_init*(
      subscription: ptr rcl_subscription_t_520094597;
      filter_expression: cstring; expression_parameters_argc: csize_t;
      expression_parameter_argv: ptr UncheckedArray[cstring];
      options: ptr rcl_subscription_content_filter_options_t_520094605): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_subscription_content_filter_options_init".}
else:
  static :
    hint("Declaration of " & "rcl_subscription_content_filter_options_init" &
        " already exists, not redeclaring")
when not declared(rcl_subscription_content_filter_options_set):
  proc rcl_subscription_content_filter_options_set*(
      subscription: ptr rcl_subscription_t_520094597;
      filter_expression: cstring; expression_parameters_argc: csize_t;
      expression_parameter_argv: ptr UncheckedArray[cstring];
      options: ptr rcl_subscription_content_filter_options_t_520094605): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_subscription_content_filter_options_set".}
else:
  static :
    hint("Declaration of " & "rcl_subscription_content_filter_options_set" &
        " already exists, not redeclaring")
when not declared(rcl_subscription_content_filter_options_fini):
  proc rcl_subscription_content_filter_options_fini*(
      subscription: ptr rcl_subscription_t_520094597;
      options: ptr rcl_subscription_content_filter_options_t_520094605): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_subscription_content_filter_options_fini".}
else:
  static :
    hint("Declaration of " & "rcl_subscription_content_filter_options_fini" &
        " already exists, not redeclaring")
when not declared(rcl_subscription_is_cft_enabled):
  proc rcl_subscription_is_cft_enabled*(subscription: ptr rcl_subscription_t_520094597): bool {.
      cdecl, importc: "rcl_subscription_is_cft_enabled".}
else:
  static :
    hint("Declaration of " & "rcl_subscription_is_cft_enabled" &
        " already exists, not redeclaring")
when not declared(rcl_subscription_set_content_filter):
  proc rcl_subscription_set_content_filter*(
      subscription: ptr rcl_subscription_t_520094597;
      options: ptr rcl_subscription_content_filter_options_t_520094605): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_subscription_set_content_filter".}
else:
  static :
    hint("Declaration of " & "rcl_subscription_set_content_filter" &
        " already exists, not redeclaring")
when not declared(rcl_subscription_get_content_filter):
  proc rcl_subscription_get_content_filter*(
      subscription: ptr rcl_subscription_t_520094597;
      options: ptr rcl_subscription_content_filter_options_t_520094605): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_subscription_get_content_filter".}
else:
  static :
    hint("Declaration of " & "rcl_subscription_get_content_filter" &
        " already exists, not redeclaring")
when not declared(rcl_take):
  proc rcl_take*(subscription: ptr rcl_subscription_t_520094597;
                 ros_message: pointer; message_info: ptr rmw_message_info_t_520094471;
                 allocation: ptr rmw_subscription_allocation_t_520094411): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_take".}
else:
  static :
    hint("Declaration of " & "rcl_take" & " already exists, not redeclaring")
when not declared(rcl_take_sequence):
  proc rcl_take_sequence*(subscription: ptr rcl_subscription_t_520094597;
                          count: csize_t;
                          message_sequence: ptr rmw_message_sequence_t_520094587;
      message_info_sequence: ptr rmw_message_info_sequence_t_520094591;
                          allocation: ptr rmw_subscription_allocation_t_520094411): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_take_sequence".}
else:
  static :
    hint("Declaration of " & "rcl_take_sequence" &
        " already exists, not redeclaring")
when not declared(rcl_take_serialized_message):
  proc rcl_take_serialized_message*(subscription: ptr rcl_subscription_t_520094597;
      serialized_message: ptr rcl_serialized_message_t_520094477;
                                    message_info: ptr rmw_message_info_t_520094471;
      allocation: ptr rmw_subscription_allocation_t_520094411): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_take_serialized_message".}
else:
  static :
    hint("Declaration of " & "rcl_take_serialized_message" &
        " already exists, not redeclaring")
when not declared(rcl_take_loaned_message):
  proc rcl_take_loaned_message*(subscription: ptr rcl_subscription_t_520094597;
                                loaned_message: ptr pointer;
                                message_info: ptr rmw_message_info_t_520094471;
                                allocation: ptr rmw_subscription_allocation_t_520094411): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_take_loaned_message".}
else:
  static :
    hint("Declaration of " & "rcl_take_loaned_message" &
        " already exists, not redeclaring")
when not declared(rcl_return_loaned_message_from_subscription):
  proc rcl_return_loaned_message_from_subscription*(
      subscription: ptr rcl_subscription_t_520094597; loaned_message: pointer): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_return_loaned_message_from_subscription".}
else:
  static :
    hint("Declaration of " & "rcl_return_loaned_message_from_subscription" &
        " already exists, not redeclaring")
when not declared(rcl_subscription_get_topic_name):
  proc rcl_subscription_get_topic_name*(subscription: ptr rcl_subscription_t_520094597): cstring {.
      cdecl, importc: "rcl_subscription_get_topic_name".}
else:
  static :
    hint("Declaration of " & "rcl_subscription_get_topic_name" &
        " already exists, not redeclaring")
when not declared(rcl_subscription_get_options):
  proc rcl_subscription_get_options*(subscription: ptr rcl_subscription_t_520094597): ptr rcl_subscription_options_t_520094601 {.
      cdecl, importc: "rcl_subscription_get_options".}
else:
  static :
    hint("Declaration of " & "rcl_subscription_get_options" &
        " already exists, not redeclaring")
when not declared(rcl_subscription_get_rmw_handle):
  proc rcl_subscription_get_rmw_handle*(subscription: ptr rcl_subscription_t_520094597): ptr rmw_subscription_t_520094391 {.
      cdecl, importc: "rcl_subscription_get_rmw_handle".}
else:
  static :
    hint("Declaration of " & "rcl_subscription_get_rmw_handle" &
        " already exists, not redeclaring")
when not declared(rcl_subscription_is_valid):
  proc rcl_subscription_is_valid*(subscription: ptr rcl_subscription_t_520094597): bool {.
      cdecl, importc: "rcl_subscription_is_valid".}
else:
  static :
    hint("Declaration of " & "rcl_subscription_is_valid" &
        " already exists, not redeclaring")
when not declared(rcl_subscription_get_publisher_count):
  proc rcl_subscription_get_publisher_count*(
      subscription: ptr rcl_subscription_t_520094597;
      publisher_count: ptr csize_t): rmw_ret_t_520094238 {.cdecl,
      importc: "rcl_subscription_get_publisher_count".}
else:
  static :
    hint("Declaration of " & "rcl_subscription_get_publisher_count" &
        " already exists, not redeclaring")
when not declared(rcl_subscription_get_actual_qos):
  proc rcl_subscription_get_actual_qos*(subscription: ptr rcl_subscription_t_520094597): ptr rmw_qos_profile_t_520094463 {.
      cdecl, importc: "rcl_subscription_get_actual_qos".}
else:
  static :
    hint("Declaration of " & "rcl_subscription_get_actual_qos" &
        " already exists, not redeclaring")
when not declared(rcl_subscription_can_loan_messages):
  proc rcl_subscription_can_loan_messages*(subscription: ptr rcl_subscription_t_520094597): bool {.
      cdecl, importc: "rcl_subscription_can_loan_messages".}
else:
  static :
    hint("Declaration of " & "rcl_subscription_can_loan_messages" &
        " already exists, not redeclaring")
when not declared(rcl_subscription_set_on_new_message_callback):
  proc rcl_subscription_set_on_new_message_callback*(
      subscription: ptr rcl_subscription_t_520094597;
      callback: rcl_event_callback_t_520094583; user_data: pointer): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_subscription_set_on_new_message_callback".}
else:
  static :
    hint("Declaration of " & "rcl_subscription_set_on_new_message_callback" &
        " already exists, not redeclaring")
when not declared(rcl_get_zero_initialized_client):
  proc rcl_get_zero_initialized_client*(): rcl_client_t_520094611 {.cdecl,
      importc: "rcl_get_zero_initialized_client".}
else:
  static :
    hint("Declaration of " & "rcl_get_zero_initialized_client" &
        " already exists, not redeclaring")
when not declared(rcl_client_init):
  proc rcl_client_init*(client: ptr rcl_client_t_520094611;
                        node: ptr rcl_node_t_520094529;
                        type_support: ptr rosidl_service_type_support_t_520094617;
                        service_name: cstring; options: ptr rcl_client_options_t_520094615): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_client_init".}
else:
  static :
    hint("Declaration of " & "rcl_client_init" &
        " already exists, not redeclaring")
when not declared(rcl_client_fini):
  proc rcl_client_fini*(client: ptr rcl_client_t_520094611; node: ptr rcl_node_t_520094529): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_client_fini".}
else:
  static :
    hint("Declaration of " & "rcl_client_fini" &
        " already exists, not redeclaring")
when not declared(rcl_client_get_default_options):
  proc rcl_client_get_default_options*(): rcl_client_options_t_520094615 {.
      cdecl, importc: "rcl_client_get_default_options".}
else:
  static :
    hint("Declaration of " & "rcl_client_get_default_options" &
        " already exists, not redeclaring")
when not declared(rcl_send_request):
  proc rcl_send_request*(client: ptr rcl_client_t_520094611;
                         ros_request: pointer; sequence_number: ptr int64): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_send_request".}
else:
  static :
    hint("Declaration of " & "rcl_send_request" &
        " already exists, not redeclaring")
when not declared(rcl_take_response_with_info):
  proc rcl_take_response_with_info*(client: ptr rcl_client_t_520094611;
                                    request_header: ptr rmw_service_info_t_520094443;
                                    ros_response: pointer): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_take_response_with_info".}
else:
  static :
    hint("Declaration of " & "rcl_take_response_with_info" &
        " already exists, not redeclaring")
when not declared(rcl_take_response):
  proc rcl_take_response*(client: ptr rcl_client_t_520094611;
                          request_header: ptr rmw_request_id_t_520094439;
                          ros_response: pointer): rcl_ret_t_520094475 {.cdecl,
      importc: "rcl_take_response".}
else:
  static :
    hint("Declaration of " & "rcl_take_response" &
        " already exists, not redeclaring")
when not declared(rcl_client_get_service_name):
  proc rcl_client_get_service_name*(client: ptr rcl_client_t_520094611): cstring {.
      cdecl, importc: "rcl_client_get_service_name".}
else:
  static :
    hint("Declaration of " & "rcl_client_get_service_name" &
        " already exists, not redeclaring")
when not declared(rcl_client_get_options):
  proc rcl_client_get_options*(client: ptr rcl_client_t_520094611): ptr rcl_client_options_t_520094615 {.
      cdecl, importc: "rcl_client_get_options".}
else:
  static :
    hint("Declaration of " & "rcl_client_get_options" &
        " already exists, not redeclaring")
when not declared(rcl_client_get_rmw_handle):
  proc rcl_client_get_rmw_handle*(client: ptr rcl_client_t_520094611): ptr rmw_client_t_520094399 {.
      cdecl, importc: "rcl_client_get_rmw_handle".}
else:
  static :
    hint("Declaration of " & "rcl_client_get_rmw_handle" &
        " already exists, not redeclaring")
when not declared(rcl_client_is_valid):
  proc rcl_client_is_valid*(client: ptr rcl_client_t_520094611): bool {.cdecl,
      importc: "rcl_client_is_valid".}
else:
  static :
    hint("Declaration of " & "rcl_client_is_valid" &
        " already exists, not redeclaring")
when not declared(rcl_client_request_publisher_get_actual_qos):
  proc rcl_client_request_publisher_get_actual_qos*(client: ptr rcl_client_t_520094611): ptr rmw_qos_profile_t_520094463 {.
      cdecl, importc: "rcl_client_request_publisher_get_actual_qos".}
else:
  static :
    hint("Declaration of " & "rcl_client_request_publisher_get_actual_qos" &
        " already exists, not redeclaring")
when not declared(rcl_client_response_subscription_get_actual_qos):
  proc rcl_client_response_subscription_get_actual_qos*(client: ptr rcl_client_t_520094611): ptr rmw_qos_profile_t_520094463 {.
      cdecl, importc: "rcl_client_response_subscription_get_actual_qos".}
else:
  static :
    hint("Declaration of " & "rcl_client_response_subscription_get_actual_qos" &
        " already exists, not redeclaring")
when not declared(rcl_client_set_on_new_response_callback):
  proc rcl_client_set_on_new_response_callback*(client: ptr rcl_client_t_520094611;
      callback: rcl_event_callback_t_520094583; user_data: pointer): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_client_set_on_new_response_callback".}
else:
  static :
    hint("Declaration of " & "rcl_client_set_on_new_response_callback" &
        " already exists, not redeclaring")
when not declared(rcl_get_zero_initialized_service):
  proc rcl_get_zero_initialized_service*(): rcl_service_t_520094623 {.cdecl,
      importc: "rcl_get_zero_initialized_service".}
else:
  static :
    hint("Declaration of " & "rcl_get_zero_initialized_service" &
        " already exists, not redeclaring")
when not declared(rcl_service_init):
  proc rcl_service_init*(service: ptr rcl_service_t_520094623;
                         node: ptr rcl_node_t_520094529;
                         type_support: ptr rosidl_service_type_support_t_520094617;
                         service_name: cstring;
                         options: ptr rcl_service_options_t_520094627): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_service_init".}
else:
  static :
    hint("Declaration of " & "rcl_service_init" &
        " already exists, not redeclaring")
when not declared(rcl_service_fini):
  proc rcl_service_fini*(service: ptr rcl_service_t_520094623;
                         node: ptr rcl_node_t_520094529): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_service_fini".}
else:
  static :
    hint("Declaration of " & "rcl_service_fini" &
        " already exists, not redeclaring")
when not declared(rcl_service_get_default_options):
  proc rcl_service_get_default_options*(): rcl_service_options_t_520094627 {.
      cdecl, importc: "rcl_service_get_default_options".}
else:
  static :
    hint("Declaration of " & "rcl_service_get_default_options" &
        " already exists, not redeclaring")
when not declared(rcl_take_request_with_info):
  proc rcl_take_request_with_info*(service: ptr rcl_service_t_520094623;
                                   request_header: ptr rmw_service_info_t_520094443;
                                   ros_request: pointer): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_take_request_with_info".}
else:
  static :
    hint("Declaration of " & "rcl_take_request_with_info" &
        " already exists, not redeclaring")
when not declared(rcl_take_request):
  proc rcl_take_request*(service: ptr rcl_service_t_520094623;
                         request_header: ptr rmw_request_id_t_520094439;
                         ros_request: pointer): rcl_ret_t_520094475 {.cdecl,
      importc: "rcl_take_request".}
else:
  static :
    hint("Declaration of " & "rcl_take_request" &
        " already exists, not redeclaring")
when not declared(rcl_send_response):
  proc rcl_send_response*(service: ptr rcl_service_t_520094623;
                          response_header: ptr rmw_request_id_t_520094439;
                          ros_response: pointer): rcl_ret_t_520094475 {.cdecl,
      importc: "rcl_send_response".}
else:
  static :
    hint("Declaration of " & "rcl_send_response" &
        " already exists, not redeclaring")
when not declared(rcl_service_get_service_name):
  proc rcl_service_get_service_name*(service: ptr rcl_service_t_520094623): cstring {.
      cdecl, importc: "rcl_service_get_service_name".}
else:
  static :
    hint("Declaration of " & "rcl_service_get_service_name" &
        " already exists, not redeclaring")
when not declared(rcl_service_get_options):
  proc rcl_service_get_options*(service: ptr rcl_service_t_520094623): ptr rcl_service_options_t_520094627 {.
      cdecl, importc: "rcl_service_get_options".}
else:
  static :
    hint("Declaration of " & "rcl_service_get_options" &
        " already exists, not redeclaring")
when not declared(rcl_service_get_rmw_handle):
  proc rcl_service_get_rmw_handle*(service: ptr rcl_service_t_520094623): ptr rmw_service_t_520094395 {.
      cdecl, importc: "rcl_service_get_rmw_handle".}
else:
  static :
    hint("Declaration of " & "rcl_service_get_rmw_handle" &
        " already exists, not redeclaring")
when not declared(rcl_service_is_valid):
  proc rcl_service_is_valid*(service: ptr rcl_service_t_520094623): bool {.
      cdecl, importc: "rcl_service_is_valid".}
else:
  static :
    hint("Declaration of " & "rcl_service_is_valid" &
        " already exists, not redeclaring")
when not declared(rcl_service_request_subscription_get_actual_qos):
  proc rcl_service_request_subscription_get_actual_qos*(
      service: ptr rcl_service_t_520094623): ptr rmw_qos_profile_t_520094463 {.
      cdecl, importc: "rcl_service_request_subscription_get_actual_qos".}
else:
  static :
    hint("Declaration of " & "rcl_service_request_subscription_get_actual_qos" &
        " already exists, not redeclaring")
when not declared(rcl_service_response_publisher_get_actual_qos):
  proc rcl_service_response_publisher_get_actual_qos*(service: ptr rcl_service_t_520094623): ptr rmw_qos_profile_t_520094463 {.
      cdecl, importc: "rcl_service_response_publisher_get_actual_qos".}
else:
  static :
    hint("Declaration of " & "rcl_service_response_publisher_get_actual_qos" &
        " already exists, not redeclaring")
when not declared(rcl_service_set_on_new_request_callback):
  proc rcl_service_set_on_new_request_callback*(service: ptr rcl_service_t_520094623;
      callback: rcl_event_callback_t_520094583; user_data: pointer): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_service_set_on_new_request_callback".}
else:
  static :
    hint("Declaration of " & "rcl_service_set_on_new_request_callback" &
        " already exists, not redeclaring")
when not declared(rmw_get_zero_initialized_event):
  proc rmw_get_zero_initialized_event*(): rmw_event_t_520094635 {.cdecl,
      importc: "rmw_get_zero_initialized_event".}
else:
  static :
    hint("Declaration of " & "rmw_get_zero_initialized_event" &
        " already exists, not redeclaring")
when not declared(rmw_publisher_event_init):
  proc rmw_publisher_event_init*(rmw_event: ptr rmw_event_t_520094635;
                                 publisher: ptr rmw_publisher_t_520094383;
                                 event_type: rmw_event_type_t_520094631): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_publisher_event_init".}
else:
  static :
    hint("Declaration of " & "rmw_publisher_event_init" &
        " already exists, not redeclaring")
when not declared(rmw_subscription_event_init):
  proc rmw_subscription_event_init*(rmw_event: ptr rmw_event_t_520094635;
                                    subscription: ptr rmw_subscription_t_520094391;
                                    event_type: rmw_event_type_t_520094631): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_subscription_event_init".}
else:
  static :
    hint("Declaration of " & "rmw_subscription_event_init" &
        " already exists, not redeclaring")
when not declared(rmw_take_event):
  proc rmw_take_event*(event_handle: ptr rmw_event_t_520094635;
                       event_info: pointer; taken: ptr bool): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_take_event".}
else:
  static :
    hint("Declaration of " & "rmw_take_event" &
        " already exists, not redeclaring")
when not declared(rmw_event_fini):
  proc rmw_event_fini*(event: ptr rmw_event_t_520094635): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_event_fini".}
else:
  static :
    hint("Declaration of " & "rmw_event_fini" &
        " already exists, not redeclaring")
when not declared(rmw_get_default_publisher_options):
  proc rmw_get_default_publisher_options*(): rmw_publisher_options_t_520094379 {.
      cdecl, importc: "rmw_get_default_publisher_options".}
else:
  static :
    hint("Declaration of " & "rmw_get_default_publisher_options" &
        " already exists, not redeclaring")
when not declared(rmw_qos_profile_sensor_data):
  var rmw_qos_profile_sensor_data*: rmw_qos_profile_t_520094463
else:
  static :
    hint("Declaration of " & "rmw_qos_profile_sensor_data" &
        " already exists, not redeclaring")
when not declared(rmw_qos_profile_parameters):
  var rmw_qos_profile_parameters*: rmw_qos_profile_t_520094463
else:
  static :
    hint("Declaration of " & "rmw_qos_profile_parameters" &
        " already exists, not redeclaring")
when not declared(rmw_qos_profile_default):
  var rmw_qos_profile_default*: rmw_qos_profile_t_520094463
else:
  static :
    hint("Declaration of " & "rmw_qos_profile_default" &
        " already exists, not redeclaring")
when not declared(rmw_qos_profile_services_default):
  var rmw_qos_profile_services_default*: rmw_qos_profile_t_520094463
else:
  static :
    hint("Declaration of " & "rmw_qos_profile_services_default" &
        " already exists, not redeclaring")
when not declared(rmw_qos_profile_parameter_events):
  var rmw_qos_profile_parameter_events*: rmw_qos_profile_t_520094463
else:
  static :
    hint("Declaration of " & "rmw_qos_profile_parameter_events" &
        " already exists, not redeclaring")
when not declared(rmw_qos_profile_system_default):
  var rmw_qos_profile_system_default*: rmw_qos_profile_t_520094463
else:
  static :
    hint("Declaration of " & "rmw_qos_profile_system_default" &
        " already exists, not redeclaring")
when not declared(rmw_qos_profile_unknown):
  var rmw_qos_profile_unknown*: rmw_qos_profile_t_520094463
else:
  static :
    hint("Declaration of " & "rmw_qos_profile_unknown" &
        " already exists, not redeclaring")
when not declared(rmw_qos_profile_check_compatible):
  proc rmw_qos_profile_check_compatible*(publisher_profile: rmw_qos_profile_t_520094463;
      subscription_profile: rmw_qos_profile_t_520094463;
      compatibility: ptr rmw_qos_compatibility_type_t_520094639;
      reason: cstring; reason_size: csize_t): rmw_ret_t_520094238 {.cdecl,
      importc: "rmw_qos_profile_check_compatible".}
else:
  static :
    hint("Declaration of " & "rmw_qos_profile_check_compatible" &
        " already exists, not redeclaring")
when not declared(rmw_get_default_subscription_options):
  proc rmw_get_default_subscription_options*(): rmw_subscription_options_t_520094387 {.
      cdecl, importc: "rmw_get_default_subscription_options".}
else:
  static :
    hint("Declaration of " & "rmw_get_default_subscription_options" &
        " already exists, not redeclaring")
when not declared(rmw_get_implementation_identifier):
  proc rmw_get_implementation_identifier*(): cstring {.cdecl,
      importc: "rmw_get_implementation_identifier".}
else:
  static :
    hint("Declaration of " & "rmw_get_implementation_identifier" &
        " already exists, not redeclaring")
when not declared(rmw_get_serialization_format):
  proc rmw_get_serialization_format*(): cstring {.cdecl,
      importc: "rmw_get_serialization_format".}
else:
  static :
    hint("Declaration of " & "rmw_get_serialization_format" &
        " already exists, not redeclaring")
when not declared(rmw_create_node):
  proc rmw_create_node*(context: ptr rmw_context_t_520094258; name: cstring;
                        namespace: cstring): ptr rmw_node_t_520094367 {.cdecl,
      importc: "rmw_create_node".}
else:
  static :
    hint("Declaration of " & "rmw_create_node" &
        " already exists, not redeclaring")
when not declared(rmw_destroy_node):
  proc rmw_destroy_node*(node: ptr rmw_node_t_520094367): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_destroy_node".}
else:
  static :
    hint("Declaration of " & "rmw_destroy_node" &
        " already exists, not redeclaring")
when not declared(rmw_node_assert_liveliness):
  proc rmw_node_assert_liveliness*(node: ptr rmw_node_t_520094367): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_node_assert_liveliness".}
else:
  static :
    hint("Declaration of " & "rmw_node_assert_liveliness" &
        " already exists, not redeclaring")
when not declared(rmw_node_get_graph_guard_condition):
  proc rmw_node_get_graph_guard_condition*(node: ptr rmw_node_t_520094367): ptr rmw_guard_condition_t_520094403 {.
      cdecl, importc: "rmw_node_get_graph_guard_condition".}
else:
  static :
    hint("Declaration of " & "rmw_node_get_graph_guard_condition" &
        " already exists, not redeclaring")
when not declared(rmw_init_publisher_allocation):
  proc rmw_init_publisher_allocation*(type_support: ptr rosidl_message_type_support_t_520094579;
      message_bounds: ptr rosidl_runtime_c_Sequence_bound_520094641; allocation: ptr rmw_publisher_allocation_t_520094407): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_init_publisher_allocation".}
else:
  static :
    hint("Declaration of " & "rmw_init_publisher_allocation" &
        " already exists, not redeclaring")
when not declared(rmw_fini_publisher_allocation):
  proc rmw_fini_publisher_allocation*(allocation: ptr rmw_publisher_allocation_t_520094407): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_fini_publisher_allocation".}
else:
  static :
    hint("Declaration of " & "rmw_fini_publisher_allocation" &
        " already exists, not redeclaring")
when not declared(rmw_create_publisher):
  proc rmw_create_publisher*(node: ptr rmw_node_t_520094367;
                             type_support: ptr rosidl_message_type_support_t_520094579;
                             topic_name: cstring;
                             qos_profile: ptr rmw_qos_profile_t_520094463;
                             publisher_options: ptr rmw_publisher_options_t_520094379): ptr rmw_publisher_t_520094383 {.
      cdecl, importc: "rmw_create_publisher".}
else:
  static :
    hint("Declaration of " & "rmw_create_publisher" &
        " already exists, not redeclaring")
when not declared(rmw_destroy_publisher):
  proc rmw_destroy_publisher*(node: ptr rmw_node_t_520094367;
                              publisher: ptr rmw_publisher_t_520094383): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_destroy_publisher".}
else:
  static :
    hint("Declaration of " & "rmw_destroy_publisher" &
        " already exists, not redeclaring")
when not declared(rmw_borrow_loaned_message):
  proc rmw_borrow_loaned_message*(publisher: ptr rmw_publisher_t_520094383;
      type_support: ptr rosidl_message_type_support_t_520094579;
                                  ros_message: ptr pointer): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_borrow_loaned_message".}
else:
  static :
    hint("Declaration of " & "rmw_borrow_loaned_message" &
        " already exists, not redeclaring")
when not declared(rmw_return_loaned_message_from_publisher):
  proc rmw_return_loaned_message_from_publisher*(publisher: ptr rmw_publisher_t_520094383;
      loaned_message: pointer): rmw_ret_t_520094238 {.cdecl,
      importc: "rmw_return_loaned_message_from_publisher".}
else:
  static :
    hint("Declaration of " & "rmw_return_loaned_message_from_publisher" &
        " already exists, not redeclaring")
when not declared(rmw_publish):
  proc rmw_publish*(publisher: ptr rmw_publisher_t_520094383;
                    ros_message: pointer;
                    allocation: ptr rmw_publisher_allocation_t_520094407): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_publish".}
else:
  static :
    hint("Declaration of " & "rmw_publish" & " already exists, not redeclaring")
when not declared(rmw_publish_loaned_message):
  proc rmw_publish_loaned_message*(publisher: ptr rmw_publisher_t_520094383;
                                   ros_message: pointer;
                                   allocation: ptr rmw_publisher_allocation_t_520094407): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_publish_loaned_message".}
else:
  static :
    hint("Declaration of " & "rmw_publish_loaned_message" &
        " already exists, not redeclaring")
when not declared(rmw_publisher_count_matched_subscriptions):
  proc rmw_publisher_count_matched_subscriptions*(
      publisher: ptr rmw_publisher_t_520094383; subscription_count: ptr csize_t): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_publisher_count_matched_subscriptions".}
else:
  static :
    hint("Declaration of " & "rmw_publisher_count_matched_subscriptions" &
        " already exists, not redeclaring")
when not declared(rmw_publisher_get_actual_qos):
  proc rmw_publisher_get_actual_qos*(publisher: ptr rmw_publisher_t_520094383;
                                     qos: ptr rmw_qos_profile_t_520094463): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_publisher_get_actual_qos".}
else:
  static :
    hint("Declaration of " & "rmw_publisher_get_actual_qos" &
        " already exists, not redeclaring")
when not declared(rmw_publish_serialized_message):
  proc rmw_publish_serialized_message*(publisher: ptr rmw_publisher_t_520094383;
      serialized_message: ptr rmw_serialized_message_t_520094351; allocation: ptr rmw_publisher_allocation_t_520094407): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_publish_serialized_message".}
else:
  static :
    hint("Declaration of " & "rmw_publish_serialized_message" &
        " already exists, not redeclaring")
when not declared(rmw_get_serialized_message_size):
  proc rmw_get_serialized_message_size*(type_support: ptr rosidl_message_type_support_t_520094579;
      message_bounds: ptr rosidl_runtime_c_Sequence_bound_520094641;
                                        size: ptr csize_t): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_get_serialized_message_size".}
else:
  static :
    hint("Declaration of " & "rmw_get_serialized_message_size" &
        " already exists, not redeclaring")
when not declared(rmw_publisher_assert_liveliness):
  proc rmw_publisher_assert_liveliness*(publisher: ptr rmw_publisher_t_520094383): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_publisher_assert_liveliness".}
else:
  static :
    hint("Declaration of " & "rmw_publisher_assert_liveliness" &
        " already exists, not redeclaring")
when not declared(rmw_publisher_wait_for_all_acked):
  proc rmw_publisher_wait_for_all_acked*(publisher: ptr rmw_publisher_t_520094383;
      wait_timeout: rmw_time_t_520094359): rmw_ret_t_520094238 {.cdecl,
      importc: "rmw_publisher_wait_for_all_acked".}
else:
  static :
    hint("Declaration of " & "rmw_publisher_wait_for_all_acked" &
        " already exists, not redeclaring")
when not declared(rmw_serialize):
  proc rmw_serialize*(ros_message: pointer;
                      type_support: ptr rosidl_message_type_support_t_520094579;
                      serialized_message: ptr rmw_serialized_message_t_520094351): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_serialize".}
else:
  static :
    hint("Declaration of " & "rmw_serialize" &
        " already exists, not redeclaring")
when not declared(rmw_deserialize):
  proc rmw_deserialize*(serialized_message: ptr rmw_serialized_message_t_520094351;
                        type_support: ptr rosidl_message_type_support_t_520094579;
                        ros_message: pointer): rmw_ret_t_520094238 {.cdecl,
      importc: "rmw_deserialize".}
else:
  static :
    hint("Declaration of " & "rmw_deserialize" &
        " already exists, not redeclaring")
when not declared(rmw_init_subscription_allocation):
  proc rmw_init_subscription_allocation*(
      type_support: ptr rosidl_message_type_support_t_520094579;
      message_bounds: ptr rosidl_runtime_c_Sequence_bound_520094641;
      allocation: ptr rmw_subscription_allocation_t_520094411): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_init_subscription_allocation".}
else:
  static :
    hint("Declaration of " & "rmw_init_subscription_allocation" &
        " already exists, not redeclaring")
when not declared(rmw_fini_subscription_allocation):
  proc rmw_fini_subscription_allocation*(
      allocation: ptr rmw_subscription_allocation_t_520094411): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_fini_subscription_allocation".}
else:
  static :
    hint("Declaration of " & "rmw_fini_subscription_allocation" &
        " already exists, not redeclaring")
when not declared(rmw_create_subscription):
  proc rmw_create_subscription*(node: ptr rmw_node_t_520094367; type_support: ptr rosidl_message_type_support_t_520094579;
                                topic_name: cstring;
                                qos_policies: ptr rmw_qos_profile_t_520094463;
      subscription_options: ptr rmw_subscription_options_t_520094387): ptr rmw_subscription_t_520094391 {.
      cdecl, importc: "rmw_create_subscription".}
else:
  static :
    hint("Declaration of " & "rmw_create_subscription" &
        " already exists, not redeclaring")
when not declared(rmw_destroy_subscription):
  proc rmw_destroy_subscription*(node: ptr rmw_node_t_520094367;
                                 subscription: ptr rmw_subscription_t_520094391): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_destroy_subscription".}
else:
  static :
    hint("Declaration of " & "rmw_destroy_subscription" &
        " already exists, not redeclaring")
when not declared(rmw_subscription_count_matched_publishers):
  proc rmw_subscription_count_matched_publishers*(
      subscription: ptr rmw_subscription_t_520094391;
      publisher_count: ptr csize_t): rmw_ret_t_520094238 {.cdecl,
      importc: "rmw_subscription_count_matched_publishers".}
else:
  static :
    hint("Declaration of " & "rmw_subscription_count_matched_publishers" &
        " already exists, not redeclaring")
when not declared(rmw_subscription_get_actual_qos):
  proc rmw_subscription_get_actual_qos*(subscription: ptr rmw_subscription_t_520094391;
                                        qos: ptr rmw_qos_profile_t_520094463): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_subscription_get_actual_qos".}
else:
  static :
    hint("Declaration of " & "rmw_subscription_get_actual_qos" &
        " already exists, not redeclaring")
when not declared(rmw_subscription_set_content_filter):
  proc rmw_subscription_set_content_filter*(
      subscription: ptr rmw_subscription_t_520094391;
      options: ptr rmw_subscription_content_filter_options_t_520094355): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_subscription_set_content_filter".}
else:
  static :
    hint("Declaration of " & "rmw_subscription_set_content_filter" &
        " already exists, not redeclaring")
when not declared(rmw_subscription_get_content_filter):
  proc rmw_subscription_get_content_filter*(
      subscription: ptr rmw_subscription_t_520094391;
      allocator: ptr rcutils_allocator_t_520094230;
      options: ptr rmw_subscription_content_filter_options_t_520094355): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_subscription_get_content_filter".}
else:
  static :
    hint("Declaration of " & "rmw_subscription_get_content_filter" &
        " already exists, not redeclaring")
when not declared(rmw_take):
  proc rmw_take*(subscription: ptr rmw_subscription_t_520094391;
                 ros_message: pointer; taken: ptr bool;
                 allocation: ptr rmw_subscription_allocation_t_520094411): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_take".}
else:
  static :
    hint("Declaration of " & "rmw_take" & " already exists, not redeclaring")
when not declared(rmw_take_with_info):
  proc rmw_take_with_info*(subscription: ptr rmw_subscription_t_520094391;
                           ros_message: pointer; taken: ptr bool;
                           message_info: ptr rmw_message_info_t_520094471;
                           allocation: ptr rmw_subscription_allocation_t_520094411): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_take_with_info".}
else:
  static :
    hint("Declaration of " & "rmw_take_with_info" &
        " already exists, not redeclaring")
when not declared(rmw_take_sequence):
  proc rmw_take_sequence*(subscription: ptr rmw_subscription_t_520094391;
                          count: csize_t;
                          message_sequence: ptr rmw_message_sequence_t_520094587;
      message_info_sequence: ptr rmw_message_info_sequence_t_520094591;
                          taken: ptr csize_t;
                          allocation: ptr rmw_subscription_allocation_t_520094411): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_take_sequence".}
else:
  static :
    hint("Declaration of " & "rmw_take_sequence" &
        " already exists, not redeclaring")
when not declared(rmw_take_serialized_message):
  proc rmw_take_serialized_message*(subscription: ptr rmw_subscription_t_520094391;
      serialized_message: ptr rmw_serialized_message_t_520094351;
                                    taken: ptr bool; allocation: ptr rmw_subscription_allocation_t_520094411): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_take_serialized_message".}
else:
  static :
    hint("Declaration of " & "rmw_take_serialized_message" &
        " already exists, not redeclaring")
when not declared(rmw_take_serialized_message_with_info):
  proc rmw_take_serialized_message_with_info*(
      subscription: ptr rmw_subscription_t_520094391;
      serialized_message: ptr rmw_serialized_message_t_520094351;
      taken: ptr bool; message_info: ptr rmw_message_info_t_520094471;
      allocation: ptr rmw_subscription_allocation_t_520094411): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_take_serialized_message_with_info".}
else:
  static :
    hint("Declaration of " & "rmw_take_serialized_message_with_info" &
        " already exists, not redeclaring")
when not declared(rmw_take_loaned_message):
  proc rmw_take_loaned_message*(subscription: ptr rmw_subscription_t_520094391;
                                loaned_message: ptr pointer; taken: ptr bool;
                                allocation: ptr rmw_subscription_allocation_t_520094411): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_take_loaned_message".}
else:
  static :
    hint("Declaration of " & "rmw_take_loaned_message" &
        " already exists, not redeclaring")
when not declared(rmw_take_loaned_message_with_info):
  proc rmw_take_loaned_message_with_info*(subscription: ptr rmw_subscription_t_520094391;
      loaned_message: ptr pointer; taken: ptr bool;
      message_info: ptr rmw_message_info_t_520094471;
      allocation: ptr rmw_subscription_allocation_t_520094411): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_take_loaned_message_with_info".}
else:
  static :
    hint("Declaration of " & "rmw_take_loaned_message_with_info" &
        " already exists, not redeclaring")
when not declared(rmw_return_loaned_message_from_subscription):
  proc rmw_return_loaned_message_from_subscription*(
      subscription: ptr rmw_subscription_t_520094391; loaned_message: pointer): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_return_loaned_message_from_subscription".}
else:
  static :
    hint("Declaration of " & "rmw_return_loaned_message_from_subscription" &
        " already exists, not redeclaring")
when not declared(rmw_create_client):
  proc rmw_create_client*(node: ptr rmw_node_t_520094367;
                          type_support: ptr rosidl_service_type_support_t_520094617;
                          service_name: cstring;
                          qos_policies: ptr rmw_qos_profile_t_520094463): ptr rmw_client_t_520094399 {.
      cdecl, importc: "rmw_create_client".}
else:
  static :
    hint("Declaration of " & "rmw_create_client" &
        " already exists, not redeclaring")
when not declared(rmw_destroy_client):
  proc rmw_destroy_client*(node: ptr rmw_node_t_520094367;
                           client: ptr rmw_client_t_520094399): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_destroy_client".}
else:
  static :
    hint("Declaration of " & "rmw_destroy_client" &
        " already exists, not redeclaring")
when not declared(rmw_send_request):
  proc rmw_send_request*(client: ptr rmw_client_t_520094399;
                         ros_request: pointer; sequence_id: ptr int64): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_send_request".}
else:
  static :
    hint("Declaration of " & "rmw_send_request" &
        " already exists, not redeclaring")
when not declared(rmw_take_response):
  proc rmw_take_response*(client: ptr rmw_client_t_520094399;
                          request_header: ptr rmw_service_info_t_520094443;
                          ros_response: pointer; taken: ptr bool): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_take_response".}
else:
  static :
    hint("Declaration of " & "rmw_take_response" &
        " already exists, not redeclaring")
when not declared(rmw_client_request_publisher_get_actual_qos):
  proc rmw_client_request_publisher_get_actual_qos*(client: ptr rmw_client_t_520094399;
      qos: ptr rmw_qos_profile_t_520094463): rmw_ret_t_520094238 {.cdecl,
      importc: "rmw_client_request_publisher_get_actual_qos".}
else:
  static :
    hint("Declaration of " & "rmw_client_request_publisher_get_actual_qos" &
        " already exists, not redeclaring")
when not declared(rmw_client_response_subscription_get_actual_qos):
  proc rmw_client_response_subscription_get_actual_qos*(
      client: ptr rmw_client_t_520094399; qos: ptr rmw_qos_profile_t_520094463): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_client_response_subscription_get_actual_qos".}
else:
  static :
    hint("Declaration of " & "rmw_client_response_subscription_get_actual_qos" &
        " already exists, not redeclaring")
when not declared(rmw_create_service):
  proc rmw_create_service*(node: ptr rmw_node_t_520094367;
                           type_support: ptr rosidl_service_type_support_t_520094617;
                           service_name: cstring;
                           qos_profile: ptr rmw_qos_profile_t_520094463): ptr rmw_service_t_520094395 {.
      cdecl, importc: "rmw_create_service".}
else:
  static :
    hint("Declaration of " & "rmw_create_service" &
        " already exists, not redeclaring")
when not declared(rmw_destroy_service):
  proc rmw_destroy_service*(node: ptr rmw_node_t_520094367;
                            service: ptr rmw_service_t_520094395): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_destroy_service".}
else:
  static :
    hint("Declaration of " & "rmw_destroy_service" &
        " already exists, not redeclaring")
when not declared(rmw_take_request):
  proc rmw_take_request*(service: ptr rmw_service_t_520094395;
                         request_header: ptr rmw_service_info_t_520094443;
                         ros_request: pointer; taken: ptr bool): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_take_request".}
else:
  static :
    hint("Declaration of " & "rmw_take_request" &
        " already exists, not redeclaring")
when not declared(rmw_send_response):
  proc rmw_send_response*(service: ptr rmw_service_t_520094395;
                          request_header: ptr rmw_request_id_t_520094439;
                          ros_response: pointer): rmw_ret_t_520094238 {.cdecl,
      importc: "rmw_send_response".}
else:
  static :
    hint("Declaration of " & "rmw_send_response" &
        " already exists, not redeclaring")
when not declared(rmw_service_request_subscription_get_actual_qos):
  proc rmw_service_request_subscription_get_actual_qos*(
      service: ptr rmw_service_t_520094395; qos: ptr rmw_qos_profile_t_520094463): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_service_request_subscription_get_actual_qos".}
else:
  static :
    hint("Declaration of " & "rmw_service_request_subscription_get_actual_qos" &
        " already exists, not redeclaring")
when not declared(rmw_service_response_publisher_get_actual_qos):
  proc rmw_service_response_publisher_get_actual_qos*(
      service: ptr rmw_service_t_520094395; qos: ptr rmw_qos_profile_t_520094463): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_service_response_publisher_get_actual_qos".}
else:
  static :
    hint("Declaration of " & "rmw_service_response_publisher_get_actual_qos" &
        " already exists, not redeclaring")
when not declared(rmw_create_guard_condition):
  proc rmw_create_guard_condition*(context: ptr rmw_context_t_520094258): ptr rmw_guard_condition_t_520094403 {.
      cdecl, importc: "rmw_create_guard_condition".}
else:
  static :
    hint("Declaration of " & "rmw_create_guard_condition" &
        " already exists, not redeclaring")
when not declared(rmw_destroy_guard_condition):
  proc rmw_destroy_guard_condition*(guard_condition: ptr rmw_guard_condition_t_520094403): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_destroy_guard_condition".}
else:
  static :
    hint("Declaration of " & "rmw_destroy_guard_condition" &
        " already exists, not redeclaring")
when not declared(rmw_trigger_guard_condition):
  proc rmw_trigger_guard_condition*(guard_condition: ptr rmw_guard_condition_t_520094403): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_trigger_guard_condition".}
else:
  static :
    hint("Declaration of " & "rmw_trigger_guard_condition" &
        " already exists, not redeclaring")
when not declared(rmw_create_wait_set):
  proc rmw_create_wait_set*(context: ptr rmw_context_t_520094258;
                            max_conditions: csize_t): ptr rmw_wait_set_t_520094435 {.
      cdecl, importc: "rmw_create_wait_set".}
else:
  static :
    hint("Declaration of " & "rmw_create_wait_set" &
        " already exists, not redeclaring")
when not declared(rmw_destroy_wait_set):
  proc rmw_destroy_wait_set*(wait_set: ptr rmw_wait_set_t_520094435): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_destroy_wait_set".}
else:
  static :
    hint("Declaration of " & "rmw_destroy_wait_set" &
        " already exists, not redeclaring")
when not declared(rmw_wait):
  proc rmw_wait*(subscriptions: ptr rmw_subscriptions_t_520094415;
                 guard_conditions: ptr rmw_guard_conditions_t_520094431;
                 services: ptr rmw_services_t_520094419;
                 clients: ptr rmw_clients_t_520094423; events: ptr rmw_events_t_520094427;
                 wait_set: ptr rmw_wait_set_t_520094435;
                 wait_timeout: ptr rmw_time_t_520094359): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_wait".}
else:
  static :
    hint("Declaration of " & "rmw_wait" & " already exists, not redeclaring")
when not declared(rmw_get_node_names):
  proc rmw_get_node_names*(node: ptr rmw_node_t_520094367;
                           node_names: ptr rcutils_string_array_t_520094295;
                           node_namespaces: ptr rcutils_string_array_t_520094295): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_get_node_names".}
else:
  static :
    hint("Declaration of " & "rmw_get_node_names" &
        " already exists, not redeclaring")
when not declared(rmw_get_node_names_with_enclaves):
  proc rmw_get_node_names_with_enclaves*(node: ptr rmw_node_t_520094367;
      node_names: ptr rcutils_string_array_t_520094295;
      node_namespaces: ptr rcutils_string_array_t_520094295;
      enclaves: ptr rcutils_string_array_t_520094295): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_get_node_names_with_enclaves".}
else:
  static :
    hint("Declaration of " & "rmw_get_node_names_with_enclaves" &
        " already exists, not redeclaring")
when not declared(rmw_count_publishers):
  proc rmw_count_publishers*(node: ptr rmw_node_t_520094367;
                             topic_name: cstring; count: ptr csize_t): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_count_publishers".}
else:
  static :
    hint("Declaration of " & "rmw_count_publishers" &
        " already exists, not redeclaring")
when not declared(rmw_count_subscribers):
  proc rmw_count_subscribers*(node: ptr rmw_node_t_520094367;
                              topic_name: cstring; count: ptr csize_t): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_count_subscribers".}
else:
  static :
    hint("Declaration of " & "rmw_count_subscribers" &
        " already exists, not redeclaring")
when not declared(rmw_get_gid_for_publisher):
  proc rmw_get_gid_for_publisher*(publisher: ptr rmw_publisher_t_520094383;
                                  gid: ptr rmw_gid_t_520094467): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_get_gid_for_publisher".}
else:
  static :
    hint("Declaration of " & "rmw_get_gid_for_publisher" &
        " already exists, not redeclaring")
when not declared(rmw_compare_gids_equal):
  proc rmw_compare_gids_equal*(gid1: ptr rmw_gid_t_520094467;
                               gid2: ptr rmw_gid_t_520094467; result: ptr bool): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_compare_gids_equal".}
else:
  static :
    hint("Declaration of " & "rmw_compare_gids_equal" &
        " already exists, not redeclaring")
when not declared(rmw_service_server_is_available):
  proc rmw_service_server_is_available*(node: ptr rmw_node_t_520094367;
                                        client: ptr rmw_client_t_520094399;
                                        is_available: ptr bool): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_service_server_is_available".}
else:
  static :
    hint("Declaration of " & "rmw_service_server_is_available" &
        " already exists, not redeclaring")
when not declared(rmw_set_log_severity):
  proc rmw_set_log_severity*(severity: rmw_log_severity_t_520094473): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_set_log_severity".}
else:
  static :
    hint("Declaration of " & "rmw_set_log_severity" &
        " already exists, not redeclaring")
when not declared(rmw_subscription_set_on_new_message_callback):
  proc rmw_subscription_set_on_new_message_callback*(
      subscription: ptr rmw_subscription_t_520094391;
      callback: rmw_event_callback_t_520094581; user_data: pointer): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_subscription_set_on_new_message_callback".}
else:
  static :
    hint("Declaration of " & "rmw_subscription_set_on_new_message_callback" &
        " already exists, not redeclaring")
when not declared(rmw_service_set_on_new_request_callback):
  proc rmw_service_set_on_new_request_callback*(service: ptr rmw_service_t_520094395;
      callback: rmw_event_callback_t_520094581; user_data: pointer): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_service_set_on_new_request_callback".}
else:
  static :
    hint("Declaration of " & "rmw_service_set_on_new_request_callback" &
        " already exists, not redeclaring")
when not declared(rmw_client_set_on_new_response_callback):
  proc rmw_client_set_on_new_response_callback*(client: ptr rmw_client_t_520094399;
      callback: rmw_event_callback_t_520094581; user_data: pointer): rmw_ret_t_520094238 {.
      cdecl, importc: "rmw_client_set_on_new_response_callback".}
else:
  static :
    hint("Declaration of " & "rmw_client_set_on_new_response_callback" &
        " already exists, not redeclaring")
when not declared(rmw_event_set_callback):
  proc rmw_event_set_callback*(event: ptr rmw_event_t_520094635;
                               callback: rmw_event_callback_t_520094581;
                               user_data: pointer): rmw_ret_t_520094238 {.cdecl,
      importc: "rmw_event_set_callback".}
else:
  static :
    hint("Declaration of " & "rmw_event_set_callback" &
        " already exists, not redeclaring")
when not declared(rcl_get_zero_initialized_timer):
  proc rcl_get_zero_initialized_timer*(): rcl_timer_t_520094647 {.cdecl,
      importc: "rcl_get_zero_initialized_timer".}
else:
  static :
    hint("Declaration of " & "rcl_get_zero_initialized_timer" &
        " already exists, not redeclaring")
when not declared(rcl_timer_init):
  proc rcl_timer_init*(timer: ptr rcl_timer_t_520094647; clock: ptr rcl_clock_t_520094563;
                       context: ptr rcl_context_t_520094509; period: int64;
                       callback: rcl_timer_callback_t_520094649;
                       allocator: rcl_allocator_t_520094232): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_timer_init".}
else:
  static :
    hint("Declaration of " & "rcl_timer_init" &
        " already exists, not redeclaring")
when not declared(rcl_timer_fini):
  proc rcl_timer_fini*(timer: ptr rcl_timer_t_520094647): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_timer_fini".}
else:
  static :
    hint("Declaration of " & "rcl_timer_fini" &
        " already exists, not redeclaring")
when not declared(rcl_timer_call):
  proc rcl_timer_call*(timer: ptr rcl_timer_t_520094647): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_timer_call".}
else:
  static :
    hint("Declaration of " & "rcl_timer_call" &
        " already exists, not redeclaring")
when not declared(rcl_timer_clock):
  proc rcl_timer_clock*(timer: ptr rcl_timer_t_520094647;
                        clock: ptr ptr rcl_clock_t_520094563): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_timer_clock".}
else:
  static :
    hint("Declaration of " & "rcl_timer_clock" &
        " already exists, not redeclaring")
when not declared(rcl_timer_is_ready):
  proc rcl_timer_is_ready*(timer: ptr rcl_timer_t_520094647; is_ready: ptr bool): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_timer_is_ready".}
else:
  static :
    hint("Declaration of " & "rcl_timer_is_ready" &
        " already exists, not redeclaring")
when not declared(rcl_timer_get_time_until_next_call):
  proc rcl_timer_get_time_until_next_call*(timer: ptr rcl_timer_t_520094647;
      time_until_next_call: ptr int64): rcl_ret_t_520094475 {.cdecl,
      importc: "rcl_timer_get_time_until_next_call".}
else:
  static :
    hint("Declaration of " & "rcl_timer_get_time_until_next_call" &
        " already exists, not redeclaring")
when not declared(rcl_timer_get_time_since_last_call):
  proc rcl_timer_get_time_since_last_call*(timer: ptr rcl_timer_t_520094647;
      time_since_last_call: ptr int64): rcl_ret_t_520094475 {.cdecl,
      importc: "rcl_timer_get_time_since_last_call".}
else:
  static :
    hint("Declaration of " & "rcl_timer_get_time_since_last_call" &
        " already exists, not redeclaring")
when not declared(rcl_timer_get_period):
  proc rcl_timer_get_period*(timer: ptr rcl_timer_t_520094647; period: ptr int64): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_timer_get_period".}
else:
  static :
    hint("Declaration of " & "rcl_timer_get_period" &
        " already exists, not redeclaring")
when not declared(rcl_timer_exchange_period):
  proc rcl_timer_exchange_period*(timer: ptr rcl_timer_t_520094647;
                                  new_period: int64; old_period: ptr int64): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_timer_exchange_period".}
else:
  static :
    hint("Declaration of " & "rcl_timer_exchange_period" &
        " already exists, not redeclaring")
when not declared(rcl_timer_get_callback):
  proc rcl_timer_get_callback*(timer: ptr rcl_timer_t_520094647): rcl_timer_callback_t_520094649 {.
      cdecl, importc: "rcl_timer_get_callback".}
else:
  static :
    hint("Declaration of " & "rcl_timer_get_callback" &
        " already exists, not redeclaring")
when not declared(rcl_timer_exchange_callback):
  proc rcl_timer_exchange_callback*(timer: ptr rcl_timer_t_520094647;
                                    new_callback: rcl_timer_callback_t_520094649): rcl_timer_callback_t_520094649 {.
      cdecl, importc: "rcl_timer_exchange_callback".}
else:
  static :
    hint("Declaration of " & "rcl_timer_exchange_callback" &
        " already exists, not redeclaring")
when not declared(rcl_timer_cancel):
  proc rcl_timer_cancel*(timer: ptr rcl_timer_t_520094647): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_timer_cancel".}
else:
  static :
    hint("Declaration of " & "rcl_timer_cancel" &
        " already exists, not redeclaring")
when not declared(rcl_timer_is_canceled):
  proc rcl_timer_is_canceled*(timer: ptr rcl_timer_t_520094647;
                              is_canceled: ptr bool): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_timer_is_canceled".}
else:
  static :
    hint("Declaration of " & "rcl_timer_is_canceled" &
        " already exists, not redeclaring")
when not declared(rcl_timer_reset):
  proc rcl_timer_reset*(timer: ptr rcl_timer_t_520094647): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_timer_reset".}
else:
  static :
    hint("Declaration of " & "rcl_timer_reset" &
        " already exists, not redeclaring")
when not declared(rcl_timer_get_allocator):
  proc rcl_timer_get_allocator*(timer: ptr rcl_timer_t_520094647): ptr rcl_allocator_t_520094232 {.
      cdecl, importc: "rcl_timer_get_allocator".}
else:
  static :
    hint("Declaration of " & "rcl_timer_get_allocator" &
        " already exists, not redeclaring")
when not declared(rcl_timer_get_guard_condition):
  proc rcl_timer_get_guard_condition*(timer: ptr rcl_timer_t_520094647): ptr rcl_guard_condition_t_520094515 {.
      cdecl, importc: "rcl_timer_get_guard_condition".}
else:
  static :
    hint("Declaration of " & "rcl_timer_get_guard_condition" &
        " already exists, not redeclaring")
when not declared(rcl_get_zero_initialized_event):
  proc rcl_get_zero_initialized_event*(): rcl_event_t_520094663 {.cdecl,
      importc: "rcl_get_zero_initialized_event".}
else:
  static :
    hint("Declaration of " & "rcl_get_zero_initialized_event" &
        " already exists, not redeclaring")
when not declared(rcl_publisher_event_init):
  proc rcl_publisher_event_init*(event: ptr rcl_event_t_520094663;
                                 publisher: ptr rcl_publisher_t_520094573;
                                 event_type: rcl_publisher_event_type_t_520094653): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_publisher_event_init".}
else:
  static :
    hint("Declaration of " & "rcl_publisher_event_init" &
        " already exists, not redeclaring")
when not declared(rcl_subscription_event_init):
  proc rcl_subscription_event_init*(event: ptr rcl_event_t_520094663;
                                    subscription: ptr rcl_subscription_t_520094597;
                                    event_type: rcl_subscription_event_type_t_520094657): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_subscription_event_init".}
else:
  static :
    hint("Declaration of " & "rcl_subscription_event_init" &
        " already exists, not redeclaring")
when not declared(rcl_take_event):
  proc rcl_take_event*(event: ptr rcl_event_t_520094663; event_info: pointer): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_take_event".}
else:
  static :
    hint("Declaration of " & "rcl_take_event" &
        " already exists, not redeclaring")
when not declared(rcl_event_fini):
  proc rcl_event_fini*(event: ptr rcl_event_t_520094663): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_event_fini".}
else:
  static :
    hint("Declaration of " & "rcl_event_fini" &
        " already exists, not redeclaring")
when not declared(rcl_event_get_rmw_handle):
  proc rcl_event_get_rmw_handle*(event: ptr rcl_event_t_520094663): ptr rmw_event_t_520094635 {.
      cdecl, importc: "rcl_event_get_rmw_handle".}
else:
  static :
    hint("Declaration of " & "rcl_event_get_rmw_handle" &
        " already exists, not redeclaring")
when not declared(rcl_event_is_valid):
  proc rcl_event_is_valid*(event: ptr rcl_event_t_520094663): bool {.cdecl,
      importc: "rcl_event_is_valid".}
else:
  static :
    hint("Declaration of " & "rcl_event_is_valid" &
        " already exists, not redeclaring")
when not declared(rcl_event_set_callback):
  proc rcl_event_set_callback*(event: ptr rcl_event_t_520094663;
                               callback: rcl_event_callback_t_520094583;
                               user_data: pointer): rcl_ret_t_520094475 {.cdecl,
      importc: "rcl_event_set_callback".}
else:
  static :
    hint("Declaration of " & "rcl_event_set_callback" &
        " already exists, not redeclaring")
when not declared(rcl_get_zero_initialized_wait_set):
  proc rcl_get_zero_initialized_wait_set*(): rcl_wait_set_t_520094669 {.cdecl,
      importc: "rcl_get_zero_initialized_wait_set".}
else:
  static :
    hint("Declaration of " & "rcl_get_zero_initialized_wait_set" &
        " already exists, not redeclaring")
when not declared(rcl_wait_set_init):
  proc rcl_wait_set_init*(wait_set: ptr rcl_wait_set_t_520094669;
                          number_of_subscriptions: csize_t;
                          number_of_guard_conditions: csize_t;
                          number_of_timers: csize_t; number_of_clients: csize_t;
                          number_of_services: csize_t;
                          number_of_events: csize_t; context: ptr rcl_context_t_520094509;
                          allocator: rcl_allocator_t_520094232): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_wait_set_init".}
else:
  static :
    hint("Declaration of " & "rcl_wait_set_init" &
        " already exists, not redeclaring")
when not declared(rcl_wait_set_fini):
  proc rcl_wait_set_fini*(wait_set: ptr rcl_wait_set_t_520094669): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_wait_set_fini".}
else:
  static :
    hint("Declaration of " & "rcl_wait_set_fini" &
        " already exists, not redeclaring")
when not declared(rcl_wait_set_get_allocator):
  proc rcl_wait_set_get_allocator*(wait_set: ptr rcl_wait_set_t_520094669;
                                   allocator: ptr rcl_allocator_t_520094232): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_wait_set_get_allocator".}
else:
  static :
    hint("Declaration of " & "rcl_wait_set_get_allocator" &
        " already exists, not redeclaring")
when not declared(rcl_wait_set_add_subscription):
  proc rcl_wait_set_add_subscription*(wait_set: ptr rcl_wait_set_t_520094669;
                                      subscription: ptr rcl_subscription_t_520094597;
                                      index: ptr csize_t): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_wait_set_add_subscription".}
else:
  static :
    hint("Declaration of " & "rcl_wait_set_add_subscription" &
        " already exists, not redeclaring")
when not declared(rcl_wait_set_clear):
  proc rcl_wait_set_clear*(wait_set: ptr rcl_wait_set_t_520094669): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_wait_set_clear".}
else:
  static :
    hint("Declaration of " & "rcl_wait_set_clear" &
        " already exists, not redeclaring")
when not declared(rcl_wait_set_resize):
  proc rcl_wait_set_resize*(wait_set: ptr rcl_wait_set_t_520094669;
                            subscriptions_size: csize_t;
                            guard_conditions_size: csize_t;
                            timers_size: csize_t; clients_size: csize_t;
                            services_size: csize_t; events_size: csize_t): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_wait_set_resize".}
else:
  static :
    hint("Declaration of " & "rcl_wait_set_resize" &
        " already exists, not redeclaring")
when not declared(rcl_wait_set_add_guard_condition):
  proc rcl_wait_set_add_guard_condition*(wait_set: ptr rcl_wait_set_t_520094669;
      guard_condition: ptr rcl_guard_condition_t_520094515; index: ptr csize_t): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_wait_set_add_guard_condition".}
else:
  static :
    hint("Declaration of " & "rcl_wait_set_add_guard_condition" &
        " already exists, not redeclaring")
when not declared(rcl_wait_set_add_timer):
  proc rcl_wait_set_add_timer*(wait_set: ptr rcl_wait_set_t_520094669;
                               timer: ptr rcl_timer_t_520094647;
                               index: ptr csize_t): rcl_ret_t_520094475 {.cdecl,
      importc: "rcl_wait_set_add_timer".}
else:
  static :
    hint("Declaration of " & "rcl_wait_set_add_timer" &
        " already exists, not redeclaring")
when not declared(rcl_wait_set_add_client):
  proc rcl_wait_set_add_client*(wait_set: ptr rcl_wait_set_t_520094669;
                                client: ptr rcl_client_t_520094611;
                                index: ptr csize_t): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_wait_set_add_client".}
else:
  static :
    hint("Declaration of " & "rcl_wait_set_add_client" &
        " already exists, not redeclaring")
when not declared(rcl_wait_set_add_service):
  proc rcl_wait_set_add_service*(wait_set: ptr rcl_wait_set_t_520094669;
                                 service: ptr rcl_service_t_520094623;
                                 index: ptr csize_t): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_wait_set_add_service".}
else:
  static :
    hint("Declaration of " & "rcl_wait_set_add_service" &
        " already exists, not redeclaring")
when not declared(rcl_wait_set_add_event):
  proc rcl_wait_set_add_event*(wait_set: ptr rcl_wait_set_t_520094669;
                               event: ptr rcl_event_t_520094663;
                               index: ptr csize_t): rcl_ret_t_520094475 {.cdecl,
      importc: "rcl_wait_set_add_event".}
else:
  static :
    hint("Declaration of " & "rcl_wait_set_add_event" &
        " already exists, not redeclaring")
when not declared(rcl_wait):
  proc rcl_wait*(wait_set: ptr rcl_wait_set_t_520094669; timeout: int64): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_wait".}
else:
  static :
    hint("Declaration of " & "rcl_wait" & " already exists, not redeclaring")
when not declared(rcl_wait_set_is_valid):
  proc rcl_wait_set_is_valid*(wait_set: ptr rcl_wait_set_t_520094669): bool {.
      cdecl, importc: "rcl_wait_set_is_valid".}
else:
  static :
    hint("Declaration of " & "rcl_wait_set_is_valid" &
        " already exists, not redeclaring")
when not declared(rcl_logging_configure):
  proc rcl_logging_configure*(global_args: ptr rcl_arguments_t_520094493;
                              allocator: ptr rcl_allocator_t_520094232): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_logging_configure".}
else:
  static :
    hint("Declaration of " & "rcl_logging_configure" &
        " already exists, not redeclaring")
when not declared(rcl_logging_configure_with_output_handler):
  proc rcl_logging_configure_with_output_handler*(
      global_args: ptr rcl_arguments_t_520094493;
      allocator: ptr rcl_allocator_t_520094232;
      output_handler: rcl_logging_output_handler_t_520094671): rcl_ret_t_520094475 {.
      cdecl, importc: "rcl_logging_configure_with_output_handler".}
else:
  static :
    hint("Declaration of " & "rcl_logging_configure_with_output_handler" &
        " already exists, not redeclaring")
when not declared(rcl_logging_fini):
  proc rcl_logging_fini*(): rcl_ret_t_520094475 {.cdecl,
      importc: "rcl_logging_fini".}
else:
  static :
    hint("Declaration of " & "rcl_logging_fini" &
        " already exists, not redeclaring")
when not declared(rcl_logging_rosout_enabled):
  proc rcl_logging_rosout_enabled*(): bool {.cdecl,
      importc: "rcl_logging_rosout_enabled".}
else:
  static :
    hint("Declaration of " & "rcl_logging_rosout_enabled" &
        " already exists, not redeclaring")
when not declared(rcl_logging_multiple_output_handler):
  proc rcl_logging_multiple_output_handler*(
      location: ptr rcutils_log_location_t_520094311; severity: cint;
      name: cstring; timestamp: rcutils_time_point_value_t_520094305;
      format: cstring; args: ptr va_list_520094317): void {.cdecl,
      importc: "rcl_logging_multiple_output_handler".}
else:
  static :
    hint("Declaration of " & "rcl_logging_multiple_output_handler" &
        " already exists, not redeclaring")