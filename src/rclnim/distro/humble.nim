
const
  RMW_QOS_POLICY_DEPTH_SYSTEM_DEFAULT* = cuint(0)
type
  enum_rmw_localhost_only_e* {.size: sizeof(cuint).} = enum
    RMW_LOCALHOST_ONLY_DEFAULT = 0, RMW_LOCALHOST_ONLY_ENABLED = 1,
    RMW_LOCALHOST_ONLY_DISABLED = 2
type
  enum_rmw_security_enforcement_policy_e* {.size: sizeof(cuint).} = enum
    RMW_SECURITY_ENFORCEMENT_PERMISSIVE = 0,
    RMW_SECURITY_ENFORCEMENT_ENFORCE = 1
type
  enum_RCUTILS_LOG_SEVERITY* {.size: sizeof(cuint).} = enum
    RCUTILS_LOG_SEVERITY_UNSET = 0, RCUTILS_LOG_SEVERITY_DEBUG = 10,
    RCUTILS_LOG_SEVERITY_INFO = 20, RCUTILS_LOG_SEVERITY_WARN = 30,
    RCUTILS_LOG_SEVERITY_ERROR = 40, RCUTILS_LOG_SEVERITY_FATAL = 50
type
  enum_rmw_qos_policy_kind_e* {.size: sizeof(cuint).} = enum
    RMW_QOS_POLICY_INVALID = 1, RMW_QOS_POLICY_DURABILITY = 2,
    RMW_QOS_POLICY_DEADLINE = 4, RMW_QOS_POLICY_LIVELINESS = 8,
    RMW_QOS_POLICY_RELIABILITY = 16, RMW_QOS_POLICY_HISTORY = 32,
    RMW_QOS_POLICY_LIFESPAN = 64, RMW_QOS_POLICY_DEPTH = 128,
    RMW_QOS_POLICY_LIVELINESS_LEASE_DURATION = 256,
    RMW_QOS_POLICY_AVOID_ROS_NAMESPACE_CONVENTIONS = 512
type
  enum_rmw_endpoint_type_e* {.size: sizeof(cuint).} = enum
    RMW_ENDPOINT_INVALID = 0, RMW_ENDPOINT_PUBLISHER = 1,
    RMW_ENDPOINT_SUBSCRIPTION = 2
type
  enum_rmw_unique_network_flow_endpoints_requirement_e* {.size: sizeof(cuint).} = enum
    RMW_UNIQUE_NETWORK_FLOW_ENDPOINTS_NOT_REQUIRED = 0,
    RMW_UNIQUE_NETWORK_FLOW_ENDPOINTS_STRICTLY_REQUIRED = 1,
    RMW_UNIQUE_NETWORK_FLOW_ENDPOINTS_OPTIONALLY_REQUIRED = 2,
    RMW_UNIQUE_NETWORK_FLOW_ENDPOINTS_SYSTEM_DEFAULT = 3
type
  enum_rmw_qos_reliability_policy_e* {.size: sizeof(cuint).} = enum
    RMW_QOS_POLICY_RELIABILITY_SYSTEM_DEFAULT = 0,
    RMW_QOS_POLICY_RELIABILITY_RELIABLE = 1,
    RMW_QOS_POLICY_RELIABILITY_BEST_EFFORT = 2,
    RMW_QOS_POLICY_RELIABILITY_UNKNOWN = 3
type
  enum_rmw_qos_history_policy_e* {.size: sizeof(cuint).} = enum
    RMW_QOS_POLICY_HISTORY_SYSTEM_DEFAULT = 0,
    RMW_QOS_POLICY_HISTORY_KEEP_LAST = 1, RMW_QOS_POLICY_HISTORY_KEEP_ALL = 2,
    RMW_QOS_POLICY_HISTORY_UNKNOWN = 3
type
  enum_rmw_qos_durability_policy_e* {.size: sizeof(cuint).} = enum
    RMW_QOS_POLICY_DURABILITY_SYSTEM_DEFAULT = 0,
    RMW_QOS_POLICY_DURABILITY_TRANSIENT_LOCAL = 1,
    RMW_QOS_POLICY_DURABILITY_VOLATILE = 2,
    RMW_QOS_POLICY_DURABILITY_UNKNOWN = 3
type
  enum_rmw_qos_liveliness_policy_e* {.size: sizeof(cuint).} = enum
    RMW_QOS_POLICY_LIVELINESS_SYSTEM_DEFAULT = 0,
    RMW_QOS_POLICY_LIVELINESS_AUTOMATIC = 1,
    RMW_QOS_POLICY_LIVELINESS_MANUAL_BY_NODE = 2,
    RMW_QOS_POLICY_LIVELINESS_MANUAL_BY_TOPIC = 3,
    RMW_QOS_POLICY_LIVELINESS_UNKNOWN = 4
type
  rmw_log_severity_t* {.size: sizeof(cuint).} = enum
    RMW_LOG_SEVERITY_DEBUG = 10, RMW_LOG_SEVERITY_INFO = 20,
    RMW_LOG_SEVERITY_WARN = 30, RMW_LOG_SEVERITY_ERROR = 40,
    RMW_LOG_SEVERITY_FATAL = 50
type
  enum_rcl_clock_type_e* {.size: sizeof(cuint).} = enum
    RCL_CLOCK_UNINITIALIZED = 0, RCL_ROS_TIME = 1, RCL_SYSTEM_TIME = 2,
    RCL_STEADY_TIME = 3
type
  enum_rcl_clock_change_e* {.size: sizeof(cuint).} = enum
    RCL_ROS_TIME_NO_CHANGE = 1, RCL_ROS_TIME_ACTIVATED = 2,
    RCL_ROS_TIME_DEACTIVATED = 3, RCL_SYSTEM_TIME_NO_CHANGE = 4
type
  enum_rmw_event_type_e* {.size: sizeof(cuint).} = enum
    RMW_EVENT_LIVELINESS_CHANGED = 0, RMW_EVENT_REQUESTED_DEADLINE_MISSED = 1,
    RMW_EVENT_REQUESTED_QOS_INCOMPATIBLE = 2, RMW_EVENT_MESSAGE_LOST = 3,
    RMW_EVENT_LIVELINESS_LOST = 4, RMW_EVENT_OFFERED_DEADLINE_MISSED = 5,
    RMW_EVENT_OFFERED_QOS_INCOMPATIBLE = 6, RMW_EVENT_INVALID = 7
type
  enum_rmw_qos_compatibility_type_e* {.size: sizeof(cuint).} = enum
    RMW_QOS_COMPATIBILITY_OK = 0, RMW_QOS_COMPATIBILITY_WARNING = 1,
    RMW_QOS_COMPATIBILITY_ERROR = 2
type
  enum_rcl_publisher_event_type_e* {.size: sizeof(cuint).} = enum
    RCL_PUBLISHER_OFFERED_DEADLINE_MISSED = 0,
    RCL_PUBLISHER_LIVELINESS_LOST = 1,
    RCL_PUBLISHER_OFFERED_INCOMPATIBLE_QOS = 2
type
  enum_rcl_subscription_event_type_e* {.size: sizeof(cuint).} = enum
    RCL_SUBSCRIPTION_REQUESTED_DEADLINE_MISSED = 0,
    RCL_SUBSCRIPTION_LIVELINESS_CHANGED = 1,
    RCL_SUBSCRIPTION_REQUESTED_INCOMPATIBLE_QOS = 2,
    RCL_SUBSCRIPTION_MESSAGE_LOST = 3
type
  struct_rcl_timer_impl_s* = distinct object
type
  struct_rcl_wait_set_impl_s* = distinct object
type
  struct_rcl_subscription_impl_s* = distinct object
type
  struct_rcutils_string_map_impl_s* = distinct object
type
  RMW_DURATION_UNSPECIFIED* = distinct object
type
  struct_rcl_publisher_impl_s* = distinct object
type
  struct_rmw_context_impl_s* = distinct object
type
  RCUTILS_WARN_UNUSED* = distinct object
type
  struct_rcl_service_impl_s* = distinct object
type
  UINT64_MAX* = distinct object
type
  RCUTILS_SAFE_FWRITE_TO_STDERR* = distinct object
type
  struct_rmw_init_options_impl_s* = distinct object
type
  struct_rcl_context_impl_s* = distinct object
type
  struct_rcl_node_impl_s* = distinct object
type
  Thread_local* = distinct object
type
  struct_rcl_client_impl_s* = distinct object
type
  struct_rcutils_array_list_impl_s* = distinct object
type
  SIZE_MAX* = distinct object
type
  struct_rcl_init_options_impl_s* = distinct object
type
  RCUTILS_US_TO_NS* = distinct object
type
  RCUTILS_MS_TO_NS* = distinct object
type
  struct_rcl_arguments_impl_s* = distinct object
type
  RCUTILS_S_TO_NS* = distinct object
type
  RCUTILS_NS_TO_S* = distinct object
type
  struct_rcutils_hash_map_impl_s* = distinct object
type
  RCUTILS_NS_TO_MS* = distinct object
type
  struct_rcl_event_impl_s* = distinct object
type
  RCUTILS_NS_TO_US* = distinct object
type
  RCUTILS_IMPORT* = distinct object
type
  builtin_va_list* = distinct object
type
  struct_rcl_guard_condition_impl_s* = distinct object
type
  rcutils_ret_t* = cint      ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/rcutils_ret.h:26:13
  struct_rcutils_allocator_s* {.pure, inheritable, bycopy.} = object
    allocate*: proc (a0: csize_t; a1: pointer): pointer {.cdecl.} ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/allocator.h:47:16
    deallocate*: proc (a0: pointer; a1: pointer): void {.cdecl.}
    reallocate*: proc (a0: pointer; a1: csize_t; a2: pointer): pointer {.cdecl.}
    zero_allocate*: proc (a0: csize_t; a1: csize_t; a2: pointer): pointer {.
        cdecl.}
    state*: pointer

  rcutils_allocator_t* = struct_rcutils_allocator_s ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/allocator.h:77:3
  rcl_allocator_t* = rcutils_allocator_t ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/allocator.h:31:29
  rmw_localhost_only_t* = enum_rmw_localhost_only_e ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/localhost.h:34:3
  rmw_ret_t* = int32         ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/ret_types.h:26:17
  rmw_security_enforcement_policy_t* = enum_rmw_security_enforcement_policy_e ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/security_options.h:34:3
  struct_rmw_security_options_s* {.pure, inheritable, bycopy.} = object
    enforce_security*: rmw_security_enforcement_policy_t ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/security_options.h:36:32
    security_root_path*: cstring

  rmw_security_options_t* = struct_rmw_security_options_s ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/security_options.h:40:3
  rmw_init_options_impl_t* = struct_rmw_init_options_impl_s ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/init_options.h:37:40
  struct_rmw_init_options_s* {.pure, inheritable, bycopy.} = object
    instance_id*: uint64     ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/init_options.h:40:32
    implementation_identifier*: cstring
    domain_id*: csize_t
    security_options*: rmw_security_options_t
    localhost_only*: rmw_localhost_only_t
    enclave*: cstring
    allocator*: rcutils_allocator_t
    impl*: ptr rmw_init_options_impl_t

  rmw_init_options_t* = struct_rmw_init_options_s ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/init_options.h:66:3
  rmw_context_impl_t* = struct_rmw_context_impl_s ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/init.h:34:35
  struct_rmw_context_s* {.pure, inheritable, bycopy.} = object
    instance_id*: uint64     ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/init.h:37:32
    implementation_identifier*: cstring
    options*: rmw_init_options_t
    actual_domain_id*: csize_t
    impl*: ptr rmw_context_impl_t

  rmw_context_t* = struct_rmw_context_s ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/init.h:50:3
  int_least64_t* = int_least64_ttypedef ## Generated based on /usr/include/stdint.h:46:25
  struct_rcutils_error_string_s* {.pure, inheritable, bycopy.} = object
    str*: array[1024'i64, cschar] ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/error_handling.h:105:16
  
  rcutils_error_string_t* = struct_rcutils_error_string_s ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/error_handling.h:109:3
  struct_rcutils_error_state_s* {.pure, inheritable, bycopy.} = object
    message*: array[768'i64, cschar] ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/error_handling.h:112:16
    file*: array[229'i64, cschar]
    line_number*: uint64

  rcutils_error_state_t* = struct_rcutils_error_state_s ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/error_handling.h:121:3
  struct_rcutils_array_list_s* {.pure, inheritable, bycopy.} = object
    impl*: ptr struct_rcutils_array_list_impl_s ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/array_list.h:35:36
  
  rcutils_array_list_t* = struct_rcutils_array_list_s ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/array_list.h:39:3
  struct_rcutils_char_array_s* {.pure, inheritable, bycopy.} = object
    buffer*: cstring         ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/char_array.h:32:36
    owns_buffer*: bool
    buffer_length*: csize_t
    buffer_capacity*: csize_t
    allocator*: rcutils_allocator_t

  rcutils_char_array_t* = struct_rcutils_char_array_s ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/char_array.h:52:3
  struct_rcutils_hash_map_s* {.pure, inheritable, bycopy.} = object
    impl*: ptr struct_rcutils_hash_map_impl_s ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/hash_map.h:35:36
  
  rcutils_hash_map_t* = struct_rcutils_hash_map_s ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/hash_map.h:39:3
  rcutils_hash_map_key_hasher_t* = proc (a0: pointer): csize_t {.cdecl.} ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/hash_map.h:46:19
  rcutils_hash_map_key_cmp_t* = proc (a0: pointer; a1: pointer): cint {.cdecl.} ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/hash_map.h:58:16
  struct_rcutils_string_array_s* {.pure, inheritable, bycopy.} = object
    size*: csize_t           ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/string_array.h:35:36
    data*: ptr ptr cschar
    allocator*: rcutils_allocator_t

  rcutils_string_array_t* = struct_rcutils_string_array_s ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/string_array.h:45:3
  struct_rcutils_string_map_s* {.pure, inheritable, bycopy.} = object
    impl*: ptr struct_rcutils_string_map_impl_s ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/string_map.h:35:36
  
  rcutils_string_map_t* = struct_rcutils_string_map_s ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/string_map.h:39:3
  struct_rcutils_uint8_array_s* {.pure, inheritable, bycopy.} = object
    buffer*: ptr uint8       ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/uint8_array.h:32:36
    buffer_length*: csize_t
    buffer_capacity*: csize_t
    allocator*: rcutils_allocator_t

  rcutils_uint8_array_t* = struct_rcutils_uint8_array_s ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/uint8_array.h:45:3
  rcutils_time_point_value_t* = int64 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/time.h:48:17
  rcutils_duration_value_t* = int64 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/time.h:50:17
  struct_rcutils_log_location_s* {.pure, inheritable, bycopy.} = object
    function_name*: cstring  ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/logging.h:156:16
    file_name*: cstring
    line_number*: csize_t

  rcutils_log_location_t* = struct_rcutils_log_location_s ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/logging.h:164:3
  rcutils_logging_output_handler_t* = proc (a0: ptr rcutils_log_location_t;
      a1: cint; a2: cstring; a3: rcutils_time_point_value_t; a4: cstring;
      a5: ptr va_list): void {.cdecl.} ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/logging.h:213:17
  va_list* = gnuc_va_list    ## Generated based on /usr/include/stdio.h:52:24
  rmw_qos_policy_kind_t* = enum_rmw_qos_policy_kind_e ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/qos_policy_kind.h:39:3
  struct_rmw_qos_incompatible_event_status_s* {.pure, inheritable, bycopy.} = object
    total_count*: int32      ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/events_statuses/incompatible_qos.h:28:32
    total_count_change*: int32
    last_policy_kind*: rmw_qos_policy_kind_t

  rmw_qos_incompatible_event_status_t* = struct_rmw_qos_incompatible_event_status_s ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/events_statuses/incompatible_qos.h:45:3
  rmw_requested_qos_incompatible_event_status_t* = rmw_qos_incompatible_event_status_t ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/events_statuses/incompatible_qos.h:48:45
  rmw_offered_qos_incompatible_event_status_t* = rmw_qos_incompatible_event_status_t ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/events_statuses/incompatible_qos.h:51:45
  struct_rmw_liveliness_changed_status_s* {.pure, inheritable, bycopy.} = object
    alive_count*: int32      ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/events_statuses/liveliness_changed.h:28:32
    not_alive_count*: int32
    alive_count_change*: int32
    not_alive_count_change*: int32

  rmw_liveliness_changed_status_t* = struct_rmw_liveliness_changed_status_s ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/events_statuses/liveliness_changed.h:52:3
  struct_rmw_liveliness_lost_status_s* {.pure, inheritable, bycopy.} = object
    total_count*: int32      ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/events_statuses/liveliness_lost.h:28:32
    total_count_change*: int32

  rmw_liveliness_lost_status_t* = struct_rmw_liveliness_lost_status_s ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/events_statuses/liveliness_lost.h:39:3
  struct_rmw_message_lost_status_s* {.pure, inheritable, bycopy.} = object
    total_count*: csize_t    ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/events_statuses/message_lost.h:27:32
    total_count_change*: csize_t

  rmw_message_lost_status_t* = struct_rmw_message_lost_status_s ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/events_statuses/message_lost.h:33:3
  struct_rmw_offered_deadline_missed_status_s* {.pure, inheritable, bycopy.} = object
    total_count*: int32      ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/events_statuses/offered_deadline_missed.h:28:32
    total_count_change*: int32

  rmw_offered_deadline_missed_status_t* = struct_rmw_offered_deadline_missed_status_s ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/events_statuses/offered_deadline_missed.h:39:3
  struct_rmw_requested_deadline_missed_status_s* {.pure, inheritable, bycopy.} = object
    total_count*: int32      ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/events_statuses/requested_deadline_missed.h:28:32
    total_count_change*: int32

  rmw_requested_deadline_missed_status_t* = struct_rmw_requested_deadline_missed_status_s ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/events_statuses/requested_deadline_missed.h:39:3
  rmw_serialized_message_t* = rcutils_uint8_array_t ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/serialized_message.h:37:31
  struct_rmw_subscription_content_filter_options_s* {.pure, inheritable, bycopy.} = object
    filter_expression*: cstring ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/subscription_content_filter_options.h:30:32
    expression_parameters*: rcutils_string_array_t

  rmw_subscription_content_filter_options_t* = struct_rmw_subscription_content_filter_options_s ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/subscription_content_filter_options.h:46:3
  struct_rmw_time_s* {.pure, inheritable, bycopy.} = object
    sec*: uint64             ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/time.h:31:32
    nsec*: uint64

  rmw_time_t* = struct_rmw_time_s ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/time.h:38:3
  rmw_time_point_value_t* = rcutils_time_point_value_t ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/time.h:40:36
  rmw_duration_t* = rcutils_duration_value_t ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/time.h:41:34
  struct_rmw_node_s* {.pure, inheritable, bycopy.} = object
    implementation_identifier*: cstring ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:45:32
    data*: pointer
    name*: cstring
    namespace*: cstring
    context*: ptr rmw_context_t

  rmw_node_t* = struct_rmw_node_s ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:61:3
  rmw_endpoint_type_t* = enum_rmw_endpoint_type_e ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:74:3
  rmw_unique_network_flow_endpoints_requirement_t* = enum_rmw_unique_network_flow_endpoints_requirement_e ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:92:3
  struct_rmw_publisher_options_s* {.pure, inheritable, bycopy.} = object
    rmw_specific_publisher_payload*: pointer ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:95:32
    require_unique_network_flow_endpoints*: rmw_unique_network_flow_endpoints_requirement_t

  rmw_publisher_options_t* = struct_rmw_publisher_options_s ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:117:3
  struct_rmw_publisher_s* {.pure, inheritable, bycopy.} = object
    implementation_identifier*: cstring ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:120:32
    data*: pointer
    topic_name*: cstring
    options*: rmw_publisher_options_t
    can_loan_messages*: bool

  rmw_publisher_t* = struct_rmw_publisher_s ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:144:3
  struct_rmw_subscription_options_s* {.pure, inheritable, bycopy.} = object
    rmw_specific_subscription_payload*: pointer ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:147:32
    ignore_local_publications*: bool
    require_unique_network_flow_endpoints*: rmw_unique_network_flow_endpoints_requirement_t
    content_filter_options*: ptr rmw_subscription_content_filter_options_t

  rmw_subscription_options_t* = struct_rmw_subscription_options_s ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:184:3
  struct_rmw_subscription_s* {.pure, inheritable, bycopy.} = object
    implementation_identifier*: cstring ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:186:32
    data*: pointer
    topic_name*: cstring
    options*: rmw_subscription_options_t
    can_loan_messages*: bool
    is_cft_enabled*: bool

  rmw_subscription_t* = struct_rmw_subscription_s ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:213:3
  struct_rmw_service_s* {.pure, inheritable, bycopy.} = object
    implementation_identifier*: cstring ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:216:32
    data*: pointer
    service_name*: cstring

  rmw_service_t* = struct_rmw_service_s ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:226:3
  struct_rmw_client_s* {.pure, inheritable, bycopy.} = object
    implementation_identifier*: cstring ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:229:32
    data*: pointer
    service_name*: cstring

  rmw_client_t* = struct_rmw_client_s ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:239:3
  struct_rmw_guard_condition_s* {.pure, inheritable, bycopy.} = object
    implementation_identifier*: cstring ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:242:32
    data*: pointer
    context*: ptr rmw_context_t

  rmw_guard_condition_t* = struct_rmw_guard_condition_s ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:252:3
  struct_rmw_publisher_allocation_s* {.pure, inheritable, bycopy.} = object
    implementation_identifier*: cstring ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:255:32
    data*: pointer

  rmw_publisher_allocation_t* = struct_rmw_publisher_allocation_s ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:262:3
  struct_rmw_subscription_allocation_s* {.pure, inheritable, bycopy.} = object
    implementation_identifier*: cstring ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:265:32
    data*: pointer

  rmw_subscription_allocation_t* = struct_rmw_subscription_allocation_s ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:272:3
  struct_rmw_subscriptions_s* {.pure, inheritable, bycopy.} = object
    subscriber_count*: csize_t ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:281:32
    subscribers*: ptr pointer

  rmw_subscriptions_t* = struct_rmw_subscriptions_s ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:287:3
  struct_rmw_services_s* {.pure, inheritable, bycopy.} = object
    service_count*: csize_t  ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:296:32
    services*: ptr pointer

  rmw_services_t* = struct_rmw_services_s ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:302:3
  struct_rmw_clients_s* {.pure, inheritable, bycopy.} = object
    client_count*: csize_t   ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:311:32
    clients*: ptr pointer

  rmw_clients_t* = struct_rmw_clients_s ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:317:3
  struct_rmw_events_s* {.pure, inheritable, bycopy.} = object
    event_count*: csize_t    ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:319:32
    events*: ptr pointer

  rmw_events_t* = struct_rmw_events_s ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:325:3
  struct_rmw_guard_conditions_s* {.pure, inheritable, bycopy.} = object
    guard_condition_count*: csize_t ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:334:32
    guard_conditions*: ptr pointer

  rmw_guard_conditions_t* = struct_rmw_guard_conditions_s ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:340:3
  struct_rmw_wait_set_s* {.pure, inheritable, bycopy.} = object
    implementation_identifier*: cstring ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:343:32
    guard_conditions*: ptr rmw_guard_conditions_t
    data*: pointer

  rmw_wait_set_t* = struct_rmw_wait_set_s ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:353:3
  struct_rmw_request_id_s* {.pure, inheritable, bycopy.} = object
    writer_guid*: array[16'i64, int8] ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:356:32
    sequence_number*: int64

  rmw_request_id_t* = struct_rmw_request_id_s ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:363:3
  struct_rmw_service_info_s* {.pure, inheritable, bycopy.} = object
    source_timestamp*: rmw_time_point_value_t ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:366:32
    received_timestamp*: rmw_time_point_value_t
    request_id*: rmw_request_id_t

  rmw_service_info_t* = struct_rmw_service_info_s ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:371:3
  rmw_qos_reliability_policy_t* = enum_rmw_qos_reliability_policy_e ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:386:3
  rmw_qos_history_policy_t* = enum_rmw_qos_history_policy_e ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:402:3
  rmw_qos_durability_policy_t* = enum_rmw_qos_durability_policy_e ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:418:3
  rmw_qos_liveliness_policy_t* = enum_rmw_qos_liveliness_policy_e ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:457:3
  struct_rmw_qos_profile_s* {.pure, inheritable, bycopy.} = object
    history*: enum_rmw_qos_history_policy_e ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:469:32
    depth*: csize_t
    reliability*: enum_rmw_qos_reliability_policy_e
    durability*: enum_rmw_qos_durability_policy_e
    deadline*: struct_rmw_time_s
    lifespan*: struct_rmw_time_s
    liveliness*: enum_rmw_qos_liveliness_policy_e
    liveliness_lease_duration*: struct_rmw_time_s
    avoid_ros_namespace_conventions*: bool

  rmw_qos_profile_t* = struct_rmw_qos_profile_s ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:513:3
  struct_rmw_gid_s* {.pure, inheritable, bycopy.} = object
    implementation_identifier*: cstring ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:516:32
    data*: array[24'i64, uint8]

  rmw_gid_t* = struct_rmw_gid_s ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:523:3
  struct_rmw_message_info_s* {.pure, inheritable, bycopy.} = object
    source_timestamp*: rmw_time_point_value_t ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:528:32
    received_timestamp*: rmw_time_point_value_t
    publication_sequence_number*: uint64
    reception_sequence_number*: uint64
    publisher_gid*: rmw_gid_t
    from_intra_process*: bool

  rmw_message_info_t* = struct_rmw_message_info_s ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:612:3
  rcl_ret_t* = rmw_ret_t     ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:23:19
  rcl_serialized_message_t* = rmw_serialized_message_t ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:127:34
  rcl_log_severity_t* = enum_RCUTILS_LOG_SEVERITY ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/log_level.h:31:35
  struct_rcl_logger_setting_s* {.pure, inheritable, bycopy.} = object
    name*: cstring           ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/log_level.h:34:16
    level*: rcl_log_severity_t

  rcl_logger_setting_t* = struct_rcl_logger_setting_s ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/log_level.h:40:3
  struct_rcl_log_levels_s* {.pure, inheritable, bycopy.} = object
    default_logger_level*: rcl_log_severity_t ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/log_level.h:43:16
    logger_settings*: ptr rcl_logger_setting_t
    num_logger_settings*: csize_t
    capacity_logger_settings*: csize_t
    allocator*: rcl_allocator_t

  rcl_log_levels_t* = struct_rcl_log_levels_s ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/log_level.h:55:3
  rcl_arguments_impl_t* = struct_rcl_arguments_impl_s ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/arguments.h:32:37
  struct_rcl_arguments_s* {.pure, inheritable, bycopy.} = object
    impl*: ptr rcl_arguments_impl_t ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/arguments.h:35:16
  
  rcl_arguments_t* = struct_rcl_arguments_s ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/arguments.h:39:3
  rcl_params_t* = struct_rcl_params_s ## Generated based on /nix/store/4yca7gxc8wbj0d7mw594azdf3i2pck19-rcl_yaml_param_parser-5.3.2/include/rcl_yaml_param_parser/rcl_yaml_param_parser/types.h:109:3
  rcl_init_options_impl_t* = struct_rcl_init_options_impl_s ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/init_options.h:32:40
  struct_rcl_init_options_s* {.pure, inheritable, bycopy.} = object
    impl*: ptr rcl_init_options_impl_t ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/init_options.h:35:16
  
  rcl_init_options_t* = struct_rcl_init_options_s ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/init_options.h:39:3
  rcl_context_instance_id_t* = uint64 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/context.h:44:18
  rcl_context_impl_t* = struct_rcl_context_impl_s ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/context.h:46:35
  struct_rcl_context_s* {.pure, inheritable, bycopy.} = object
    global_arguments*: rcl_arguments_t ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/context.h:113:16
    impl*: ptr rcl_context_impl_t
    instance_id_storage*: array[8'i64, uint8]

  rcl_context_t* = struct_rcl_context_s ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/context.h:150:3
  rcl_guard_condition_impl_t* = struct_rcl_guard_condition_impl_s ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/guard_condition.h:32:43
  struct_rcl_guard_condition_s* {.pure, inheritable, bycopy.} = object
    context*: ptr rcl_context_t ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/guard_condition.h:35:16
    impl*: ptr rcl_guard_condition_impl_t

  rcl_guard_condition_t* = struct_rcl_guard_condition_s ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/guard_condition.h:42:3
  struct_rcl_guard_condition_options_s* {.pure, inheritable, bycopy.} = object
    allocator*: rcl_allocator_t ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/guard_condition.h:45:16
  
  rcl_guard_condition_options_t* = struct_rcl_guard_condition_options_s ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/guard_condition.h:49:3
  struct_rcl_node_options_s* {.pure, inheritable, bycopy.} = object
    allocator*: rcl_allocator_t ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/node_options.h:34:16
    use_global_arguments*: bool
    arguments*: rcl_arguments_t
    enable_rosout*: bool
    rosout_qos*: rmw_qos_profile_t

  rcl_node_options_t* = struct_rcl_node_options_s ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/node_options.h:57:3
  rcl_node_impl_t* = struct_rcl_node_impl_s ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/node.h:38:32
  struct_rcl_node_s* {.pure, inheritable, bycopy.} = object
    context*: ptr rcl_context_t ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/node.h:41:16
    impl*: ptr rcl_node_impl_t

  rcl_node_t* = struct_rcl_node_s ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/node.h:48:3
  rcl_time_point_value_t* = rcutils_time_point_value_t ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:46:36
  rcl_duration_value_t* = rcutils_duration_value_t ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:48:34
  rcl_clock_type_t* = enum_rcl_clock_type_e ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:71:3
  struct_rcl_duration_s* {.pure, inheritable, bycopy.} = object
    nanoseconds*: rcl_duration_value_t ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:74:16
  
  rcl_duration_t* = struct_rcl_duration_s ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:78:3
  rcl_clock_change_t* = enum_rcl_clock_change_e ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:91:3
  struct_rcl_time_jump_s* {.pure, inheritable, bycopy.} = object
    clock_change*: rcl_clock_change_t ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:94:16
    delta*: rcl_duration_t

  rcl_time_jump_t* = struct_rcl_time_jump_s ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:100:3
  rcl_jump_callback_t* = proc (a0: ptr rcl_time_jump_t; a1: bool; a2: pointer): void {.
      cdecl.}                ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:107:17
  struct_rcl_jump_threshold_s* {.pure, inheritable, bycopy.} = object
    on_clock_change*: bool   ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:113:16
    min_forward*: rcl_duration_t
    min_backward*: rcl_duration_t

  rcl_jump_threshold_t* = struct_rcl_jump_threshold_s ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:123:3
  struct_rcl_jump_callback_info_s* {.pure, inheritable, bycopy.} = object
    callback*: rcl_jump_callback_t ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:126:16
    threshold*: rcl_jump_threshold_t
    user_data*: pointer

  rcl_jump_callback_info_t* = struct_rcl_jump_callback_info_s ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:134:3
  struct_rcl_clock_s* {.pure, inheritable, bycopy.} = object
    typefield*: rcl_clock_type_t ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:137:16
    jump_callbacks*: ptr rcl_jump_callback_info_t
    num_jump_callbacks*: csize_t
    get_now*: proc (a0: pointer; a1: ptr rcl_time_point_value_t): rcl_ret_t {.
        cdecl.}
    data*: pointer
    allocator*: rcl_allocator_t

  rcl_clock_t* = struct_rcl_clock_s ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:152:3
  struct_rcl_time_point_s* {.pure, inheritable, bycopy.} = object
    nanoseconds*: rcl_time_point_value_t ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:155:16
    clock_type*: rcl_clock_type_t

  rcl_time_point_t* = struct_rcl_time_point_s ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:161:3
  rcl_publisher_impl_t* = struct_rcl_publisher_impl_s ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/publisher.h:33:37
  struct_rcl_publisher_s* {.pure, inheritable, bycopy.} = object
    impl*: ptr rcl_publisher_impl_t ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/publisher.h:36:16
  
  rcl_publisher_t* = struct_rcl_publisher_s ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/publisher.h:40:3
  struct_rcl_publisher_options_s* {.pure, inheritable, bycopy.} = object
    qos*: rmw_qos_profile_t  ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/publisher.h:43:16
    allocator*: rcl_allocator_t
    rmw_publisher_options*: rmw_publisher_options_t

  rcl_publisher_options_t* = struct_rcl_publisher_options_s ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/publisher.h:52:3
  rosidl_message_type_support_t* = struct_rosidl_message_type_support_t ## Generated based on /nix/store/l5n428nlcyhhwzxy3s7albghm1xhss0j-rosidl_runtime_c-3.1.4/include/rosidl_runtime_c/rosidl_runtime_c/message_type_support_struct.h:26:46
  rmw_event_callback_t* = proc (a0: pointer; a1: csize_t): void {.cdecl.} ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/event_callback_type.h:46:17
  rcl_event_callback_t* = rmw_event_callback_t ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/event_callback.h:25:30
  struct_rmw_message_sequence_s* {.pure, inheritable, bycopy.} = object
    data*: ptr pointer       ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/message_sequence.h:30:32
    size*: csize_t
    capacity*: csize_t
    allocator*: ptr rcutils_allocator_t

  rmw_message_sequence_t* = struct_rmw_message_sequence_s ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/message_sequence.h:40:3
  struct_rmw_message_info_sequence_s* {.pure, inheritable, bycopy.} = object
    data*: ptr rmw_message_info_t ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/message_sequence.h:43:32
    size*: csize_t
    capacity*: csize_t
    allocator*: ptr rcutils_allocator_t

  rmw_message_info_sequence_t* = struct_rmw_message_info_sequence_s ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/message_sequence.h:53:3
  rcl_subscription_impl_t* = struct_rcl_subscription_impl_s ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/subscription.h:35:40
  struct_rcl_subscription_s* {.pure, inheritable, bycopy.} = object
    impl*: ptr rcl_subscription_impl_t ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/subscription.h:38:16
  
  rcl_subscription_t* = struct_rcl_subscription_s ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/subscription.h:42:3
  struct_rcl_subscription_options_s* {.pure, inheritable, bycopy.} = object
    qos*: rmw_qos_profile_t  ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/subscription.h:45:16
    allocator*: rcl_allocator_t
    rmw_subscription_options*: rmw_subscription_options_t

  rcl_subscription_options_t* = struct_rcl_subscription_options_s ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/subscription.h:54:3
  struct_rcl_subscription_content_filter_options_s* {.pure, inheritable, bycopy.} = object
    rmw_subscription_content_filter_options*: rmw_subscription_content_filter_options_t ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/subscription.h:56:16
  
  rcl_subscription_content_filter_options_t* = struct_rcl_subscription_content_filter_options_s ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/subscription.h:59:3
  rcl_client_impl_t* = struct_rcl_client_impl_s ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/client.h:33:34
  struct_rcl_client_s* {.pure, inheritable, bycopy.} = object
    impl*: ptr rcl_client_impl_t ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/client.h:36:16
  
  rcl_client_t* = struct_rcl_client_s ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/client.h:40:3
  struct_rcl_client_options_s* {.pure, inheritable, bycopy.} = object
    qos*: rmw_qos_profile_t  ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/client.h:43:16
    allocator*: rcl_allocator_t

  rcl_client_options_t* = struct_rcl_client_options_s ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/client.h:50:3
  rosidl_service_type_support_t* = struct_rosidl_service_type_support_t ## Generated based on /nix/store/l5n428nlcyhhwzxy3s7albghm1xhss0j-rosidl_runtime_c-3.1.4/include/rosidl_runtime_c/rosidl_runtime_c/service_type_support_struct.h:27:46
  rcl_service_impl_t* = struct_rcl_service_impl_s ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/service.h:33:35
  struct_rcl_service_s* {.pure, inheritable, bycopy.} = object
    impl*: ptr rcl_service_impl_t ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/service.h:36:16
  
  rcl_service_t* = struct_rcl_service_s ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/service.h:40:3
  struct_rcl_service_options_s* {.pure, inheritable, bycopy.} = object
    qos*: rmw_qos_profile_t  ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/service.h:43:16
    allocator*: rcl_allocator_t

  rcl_service_options_t* = struct_rcl_service_options_s ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/service.h:50:3
  rmw_event_type_t* = enum_rmw_event_type_e ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/event.h:48:3
  struct_rmw_event_s* {.pure, inheritable, bycopy.} = object
    implementation_identifier*: cstring ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/event.h:51:32
    data*: pointer
    event_type*: rmw_event_type_t

  rmw_event_t* = struct_rmw_event_s ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/event.h:59:3
  rmw_qos_compatibility_type_t* = enum_rmw_qos_compatibility_type_e ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/qos_profiles.h:126:3
  rosidl_runtime_c_Sequence_bound* = struct_rosidl_runtime_c_Sequence_bound ## Generated based on /nix/store/l5n428nlcyhhwzxy3s7albghm1xhss0j-rosidl_runtime_c-3.1.4/include/rosidl_runtime_c/rosidl_runtime_c/sequence_bound.h:26:50
  rcl_timer_impl_t* = struct_rcl_timer_impl_s ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/timer.h:35:33
  struct_rcl_timer_s* {.pure, inheritable, bycopy.} = object
    impl*: ptr rcl_timer_impl_t ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/timer.h:38:16
  
  rcl_timer_t* = struct_rcl_timer_s ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/timer.h:42:3
  rcl_timer_callback_t* = proc (a0: ptr rcl_timer_t; a1: int64): void {.cdecl.} ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/timer.h:57:17
  rcl_publisher_event_type_t* = enum_rcl_publisher_event_type_e ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/event.h:41:3
  rcl_subscription_event_type_t* = enum_rcl_subscription_event_type_e ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/event.h:50:3
  rcl_event_impl_t* = struct_rcl_event_impl_s ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/event.h:53:33
  struct_rcl_event_s* {.pure, inheritable, bycopy.} = object
    impl*: ptr rcl_event_impl_t ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/event.h:56:16
  
  rcl_event_t* = struct_rcl_event_s ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/event.h:60:3
  rcl_wait_set_impl_t* = struct_rcl_wait_set_impl_s ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/wait.h:38:36
  struct_rcl_wait_set_s* {.pure, inheritable, bycopy.} = object
    subscriptions*: ptr ptr rcl_subscription_t ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/wait.h:41:16
    size_of_subscriptions*: csize_t
    guard_conditions*: ptr ptr rcl_guard_condition_t
    size_of_guard_conditions*: csize_t
    timers*: ptr ptr rcl_timer_t
    size_of_timers*: csize_t
    clients*: ptr ptr rcl_client_t
    size_of_clients*: csize_t
    services*: ptr ptr rcl_service_t
    size_of_services*: csize_t
    events*: ptr ptr rcl_event_t
    size_of_events*: csize_t
    impl*: ptr rcl_wait_set_impl_t

  rcl_wait_set_t* = struct_rcl_wait_set_s ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/wait.h:69:3
  rcl_logging_output_handler_t* = rcutils_logging_output_handler_t ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/logging.h:34:42
  rmw_error_string_t* = rcutils_error_string_t ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/error_handling.h:34:32
  rmw_error_state_t* = rcutils_error_state_t ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/error_handling.h:37:31
  int_least64_ttypedef* = int64_t ## Generated based on /usr/include/bits/types.h:58:19
  gnuc_va_list* = builtin_va_list ## Generated based on /usr/lib/clang/15.0.7/include/stdarg.h:32:27
  struct_rcl_params_s* {.pure, inheritable, bycopy.} = object
    node_names*: ptr ptr cschar ## Generated based on /nix/store/4yca7gxc8wbj0d7mw594azdf3i2pck19-rcl_yaml_param_parser-5.3.2/include/rcl_yaml_param_parser/rcl_yaml_param_parser/types.h:102:16
    params*: ptr rcl_node_params_t
    num_nodes*: csize_t
    capacity_nodes*: csize_t
    allocator*: rcutils_allocator_t

  struct_rosidl_message_type_support_t* {.pure, inheritable, bycopy.} = object
    typesupport_identifier*: cstring ## Generated based on /nix/store/l5n428nlcyhhwzxy3s7albghm1xhss0j-rosidl_runtime_c-3.1.4/include/rosidl_runtime_c/rosidl_runtime_c/message_type_support_struct.h:32:8
    data*: pointer
    funcfield*: rosidl_message_typesupport_handle_function

  struct_rosidl_service_type_support_t* {.pure, inheritable, bycopy.} = object
    typesupport_identifier*: cstring ## Generated based on /nix/store/l5n428nlcyhhwzxy3s7albghm1xhss0j-rosidl_runtime_c-3.1.4/include/rosidl_runtime_c/rosidl_runtime_c/service_type_support_struct.h:33:8
    data*: pointer
    funcfield*: rosidl_service_typesupport_handle_function

  struct_rosidl_runtime_c_Sequence_bound* {.pure, inheritable, bycopy.} = object
    typesupport_identifier*: cstring ## Generated based on /nix/store/l5n428nlcyhhwzxy3s7albghm1xhss0j-rosidl_runtime_c-3.1.4/include/rosidl_runtime_c/rosidl_runtime_c/sequence_bound.h:31:8
    data*: pointer
    funcfield*: rosidl_runtime_c_bound_handle_function

  int64_t* = clong           ## Generated based on /usr/include/bits/types.h:44:25
  rcl_node_params_t* = struct_rcl_node_params_s ## Generated based on /nix/store/4yca7gxc8wbj0d7mw594azdf3i2pck19-rcl_yaml_param_parser-5.3.2/include/rcl_yaml_param_parser/rcl_yaml_param_parser/types.h:96:3
  rosidl_message_typesupport_handle_function* = proc (
      a0: ptr rosidl_message_type_support_t; a1: cstring): ptr rosidl_message_type_support_t {.
      cdecl.}                ## Generated based on /nix/store/l5n428nlcyhhwzxy3s7albghm1xhss0j-rosidl_runtime_c-3.1.4/include/rosidl_runtime_c/rosidl_runtime_c/message_type_support_struct.h:28:50
  rosidl_service_typesupport_handle_function* = proc (
      a0: ptr rosidl_service_type_support_t; a1: cstring): ptr rosidl_service_type_support_t {.
      cdecl.}                ## Generated based on /nix/store/l5n428nlcyhhwzxy3s7albghm1xhss0j-rosidl_runtime_c-3.1.4/include/rosidl_runtime_c/rosidl_runtime_c/service_type_support_struct.h:29:50
  rosidl_runtime_c_bound_handle_function* = proc (
      a0: ptr rosidl_runtime_c_Sequence_bound; a1: cstring): ptr rosidl_runtime_c_Sequence_bound {.
      cdecl.}                ## Generated based on /nix/store/l5n428nlcyhhwzxy3s7albghm1xhss0j-rosidl_runtime_c-3.1.4/include/rosidl_runtime_c/rosidl_runtime_c/sequence_bound.h:28:54
  struct_rcl_node_params_s* {.pure, inheritable, bycopy.} = object
    parameter_names*: ptr ptr cschar ## Generated based on /nix/store/4yca7gxc8wbj0d7mw594azdf3i2pck19-rcl_yaml_param_parser-5.3.2/include/rcl_yaml_param_parser/rcl_yaml_param_parser/types.h:90:16
    parameter_values*: ptr rcl_variant_t
    num_params*: csize_t
    capacity_params*: csize_t

  rcl_variant_t* = struct_rcl_variant_s ## Generated based on /nix/store/4yca7gxc8wbj0d7mw594azdf3i2pck19-rcl_yaml_param_parser-5.3.2/include/rcl_yaml_param_parser/rcl_yaml_param_parser/types.h:84:3
  struct_rcl_variant_s* {.pure, inheritable, bycopy.} = object
    bool_value*: ptr bool    ## Generated based on /nix/store/4yca7gxc8wbj0d7mw594azdf3i2pck19-rcl_yaml_param_parser-5.3.2/include/rcl_yaml_param_parser/rcl_yaml_param_parser/types.h:73:16
    integer_value*: ptr int64
    double_value*: ptr cdouble
    string_value*: cstring
    byte_array_value*: ptr rcl_byte_array_t
    bool_array_value*: ptr rcl_bool_array_t
    integer_array_value*: ptr rcl_int64_array_t
    double_array_value*: ptr rcl_double_array_t
    string_array_value*: ptr rcutils_string_array_t

  rcl_byte_array_t* = struct_rcl_byte_array_s ## Generated based on /nix/store/4yca7gxc8wbj0d7mw594azdf3i2pck19-rcl_yaml_param_parser-5.3.2/include/rcl_yaml_param_parser/rcl_yaml_param_parser/types.h:66:3
  rcl_bool_array_t* = struct_rcl_bool_array_s ## Generated based on /nix/store/4yca7gxc8wbj0d7mw594azdf3i2pck19-rcl_yaml_param_parser-5.3.2/include/rcl_yaml_param_parser/rcl_yaml_param_parser/types.h:30:3
  rcl_int64_array_t* = struct_rcl_int64_array_s ## Generated based on /nix/store/4yca7gxc8wbj0d7mw594azdf3i2pck19-rcl_yaml_param_parser-5.3.2/include/rcl_yaml_param_parser/rcl_yaml_param_parser/types.h:42:3
  rcl_double_array_t* = struct_rcl_double_array_s ## Generated based on /nix/store/4yca7gxc8wbj0d7mw594azdf3i2pck19-rcl_yaml_param_parser-5.3.2/include/rcl_yaml_param_parser/rcl_yaml_param_parser/types.h:54:3
  struct_rcl_byte_array_s* {.pure, inheritable, bycopy.} = object
    values*: ptr uint8       ## Generated based on /nix/store/4yca7gxc8wbj0d7mw594azdf3i2pck19-rcl_yaml_param_parser-5.3.2/include/rcl_yaml_param_parser/rcl_yaml_param_parser/types.h:60:16
    size*: csize_t

  struct_rcl_bool_array_s* {.pure, inheritable, bycopy.} = object
    values*: ptr bool        ## Generated based on /nix/store/4yca7gxc8wbj0d7mw594azdf3i2pck19-rcl_yaml_param_parser-5.3.2/include/rcl_yaml_param_parser/rcl_yaml_param_parser/types.h:24:16
    size*: csize_t

  struct_rcl_int64_array_s* {.pure, inheritable, bycopy.} = object
    values*: ptr int64       ## Generated based on /nix/store/4yca7gxc8wbj0d7mw594azdf3i2pck19-rcl_yaml_param_parser-5.3.2/include/rcl_yaml_param_parser/rcl_yaml_param_parser/types.h:36:16
    size*: csize_t

  struct_rcl_double_array_s* {.pure, inheritable, bycopy.} = object
    values*: ptr cdouble     ## Generated based on /nix/store/4yca7gxc8wbj0d7mw594azdf3i2pck19-rcl_yaml_param_parser-5.3.2/include/rcl_yaml_param_parser/rcl_yaml_param_parser/types.h:48:16
    size*: csize_t

when 0 is static:
  const
    RCUTILS_RET_OK* = 0      ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/rcutils_ret.h:29:9
else:
  let RCUTILS_RET_OK* = 0    ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/rcutils_ret.h:29:9
when 1 is static:
  const
    RCUTILS_RET_WARN* = 1    ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/rcutils_ret.h:31:9
else:
  let RCUTILS_RET_WARN* = 1  ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/rcutils_ret.h:31:9
when 2 is static:
  const
    RCUTILS_RET_ERROR* = 2   ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/rcutils_ret.h:33:9
else:
  let RCUTILS_RET_ERROR* = 2 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/rcutils_ret.h:33:9
when 10 is static:
  const
    RCUTILS_RET_BAD_ALLOC* = 10 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/rcutils_ret.h:36:9
else:
  let RCUTILS_RET_BAD_ALLOC* = 10 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/rcutils_ret.h:36:9
when 11 is static:
  const
    RCUTILS_RET_INVALID_ARGUMENT* = 11 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/rcutils_ret.h:38:9
else:
  let RCUTILS_RET_INVALID_ARGUMENT* = 11 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/rcutils_ret.h:38:9
when 12 is static:
  const
    RCUTILS_RET_NOT_ENOUGH_SPACE* = 12 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/rcutils_ret.h:40:9
else:
  let RCUTILS_RET_NOT_ENOUGH_SPACE* = 12 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/rcutils_ret.h:40:9
when 13 is static:
  const
    RCUTILS_RET_NOT_INITIALIZED* = 13 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/rcutils_ret.h:42:9
else:
  let RCUTILS_RET_NOT_INITIALIZED* = 13 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/rcutils_ret.h:42:9
when 14 is static:
  const
    RCUTILS_RET_NOT_FOUND* = 14 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/rcutils_ret.h:44:9
else:
  let RCUTILS_RET_NOT_FOUND* = 14 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/rcutils_ret.h:44:9
when 30 is static:
  const
    RCUTILS_RET_STRING_MAP_ALREADY_INIT* = 30 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/rcutils_ret.h:47:9
else:
  let RCUTILS_RET_STRING_MAP_ALREADY_INIT* = 30 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/rcutils_ret.h:47:9
when 31 is static:
  const
    RCUTILS_RET_STRING_MAP_INVALID* = 31 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/rcutils_ret.h:49:9
else:
  let RCUTILS_RET_STRING_MAP_INVALID* = 31 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/rcutils_ret.h:49:9
when 32 is static:
  const
    RCUTILS_RET_STRING_KEY_NOT_FOUND* = 32 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/rcutils_ret.h:51:9
else:
  let RCUTILS_RET_STRING_KEY_NOT_FOUND* = 32 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/rcutils_ret.h:51:9
when 40 is static:
  const
    RCUTILS_RET_LOGGING_SEVERITY_MAP_INVALID* = 40 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/rcutils_ret.h:54:9
else:
  let RCUTILS_RET_LOGGING_SEVERITY_MAP_INVALID* = 40 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/rcutils_ret.h:54:9
when 41 is static:
  const
    RCUTILS_RET_LOGGING_SEVERITY_STRING_INVALID* = 41 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/rcutils_ret.h:56:9
else:
  let RCUTILS_RET_LOGGING_SEVERITY_STRING_INVALID* = 41 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/rcutils_ret.h:56:9
when 50 is static:
  const
    RCUTILS_RET_HASH_MAP_NO_MORE_ENTRIES* = 50 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/rcutils_ret.h:59:9
else:
  let RCUTILS_RET_HASH_MAP_NO_MORE_ENTRIES* = 50 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/types/rcutils_ret.h:59:9
when RCUTILS_IMPORT is typedesc:
  type
    RCUTILS_PUBLIC* = RCUTILS_IMPORT ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/visibility_control.h:23:10
else:
  when RCUTILS_IMPORT is static:
    const
      RCUTILS_PUBLIC* = RCUTILS_IMPORT ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/visibility_control.h:23:10
  else:
    let RCUTILS_PUBLIC* = RCUTILS_IMPORT ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/visibility_control.h:23:10
proc rcutils_get_default_allocator*(): rcutils_allocator_t {.cdecl,
    importc: "rcutils_get_default_allocator".}
proc rcutils_reallocf*(pointer: pointer; size: csize_t;
                       allocator: ptr rcutils_allocator_t): pointer {.cdecl,
    importc: "rcutils_reallocf".}
when SIZE_MAX is typedesc:
  type
    RMW_DEFAULT_DOMAIN_ID* = SIZE_MAX ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/domain_id.h:19:9
else:
  when SIZE_MAX is static:
    const
      RMW_DEFAULT_DOMAIN_ID* = SIZE_MAX ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/domain_id.h:19:9
  else:
    let RMW_DEFAULT_DOMAIN_ID* = SIZE_MAX ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/domain_id.h:19:9
when RCUTILS_WARN_UNUSED is typedesc:
  type
    RMW_WARN_UNUSED* = RCUTILS_WARN_UNUSED ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/macros.h:24:9
else:
  when RCUTILS_WARN_UNUSED is static:
    const
      RMW_WARN_UNUSED* = RCUTILS_WARN_UNUSED ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/macros.h:24:9
  else:
    let RMW_WARN_UNUSED* = RCUTILS_WARN_UNUSED ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/macros.h:24:9
when 0 is static:
  const
    RMW_RET_OK* = 0          ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/ret_types.h:28:9
else:
  let RMW_RET_OK* = 0        ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/ret_types.h:28:9
when 1 is static:
  const
    RMW_RET_ERROR* = 1       ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/ret_types.h:30:9
else:
  let RMW_RET_ERROR* = 1     ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/ret_types.h:30:9
when 2 is static:
  const
    RMW_RET_TIMEOUT* = 2     ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/ret_types.h:32:9
else:
  let RMW_RET_TIMEOUT* = 2   ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/ret_types.h:32:9
when 3 is static:
  const
    RMW_RET_UNSUPPORTED* = 3 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/ret_types.h:34:9
else:
  let RMW_RET_UNSUPPORTED* = 3 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/ret_types.h:34:9
when 10 is static:
  const
    RMW_RET_BAD_ALLOC* = 10  ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/ret_types.h:37:9
else:
  let RMW_RET_BAD_ALLOC* = 10 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/ret_types.h:37:9
when 11 is static:
  const
    RMW_RET_INVALID_ARGUMENT* = 11 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/ret_types.h:39:9
else:
  let RMW_RET_INVALID_ARGUMENT* = 11 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/ret_types.h:39:9
when 12 is static:
  const
    RMW_RET_INCORRECT_RMW_IMPLEMENTATION* = 12 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/ret_types.h:41:9
else:
  let RMW_RET_INCORRECT_RMW_IMPLEMENTATION* = 12 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/ret_types.h:41:9
when 203 is static:
  const
    RMW_RET_NODE_NAME_NON_EXISTENT* = 203 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/ret_types.h:46:9
else:
  let RMW_RET_NODE_NAME_NON_EXISTENT* = 203 ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/ret_types.h:46:9
when RCUTILS_WARN_UNUSED is typedesc:
  type
    RCL_WARN_UNUSED* = RCUTILS_WARN_UNUSED ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/macros.h:26:9
else:
  when RCUTILS_WARN_UNUSED is static:
    const
      RCL_WARN_UNUSED* = RCUTILS_WARN_UNUSED ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/macros.h:26:9
  else:
    let RCL_WARN_UNUSED* = RCUTILS_WARN_UNUSED ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/macros.h:26:9
when 1 is static:
  const
    STDC_WANT_LIB_EXT1* = 1  ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/error_handling.h:26:9
else:
  let STDC_WANT_LIB_EXT1* = 1 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/error_handling.h:26:9
when -1 is static:
  const
    RCUTILS_FAULT_INJECTION_NEVER_FAIL* = -1 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/testing/fault_injection.h:29:9
else:
  let RCUTILS_FAULT_INJECTION_NEVER_FAIL* = -1 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/testing/fault_injection.h:29:9
when 0 is static:
  const
    RCUTILS_FAULT_INJECTION_FAIL_NOW* = 0 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/testing/fault_injection.h:31:9
else:
  let RCUTILS_FAULT_INJECTION_FAIL_NOW* = 0 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/testing/fault_injection.h:31:9
when 20 is static:
  const
    RCUTILS_ERROR_STATE_LINE_NUMBER_STR_MAX_LENGTH* = 20 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/error_handling.h:78:9
else:
  let RCUTILS_ERROR_STATE_LINE_NUMBER_STR_MAX_LENGTH* = 20 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/error_handling.h:78:9
when 6 is static:
  const
    RCUTILS_ERROR_FORMATTING_CHARACTERS* = 6 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/error_handling.h:81:9
else:
  let RCUTILS_ERROR_FORMATTING_CHARACTERS* = 6 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/error_handling.h:81:9
when 1024 is static:
  const
    RCUTILS_ERROR_MESSAGE_MAX_LENGTH* = 1024 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/error_handling.h:84:9
else:
  let RCUTILS_ERROR_MESSAGE_MAX_LENGTH* = 1024 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/error_handling.h:84:9
when 768 is static:
  const
    RCUTILS_ERROR_STATE_MESSAGE_MAX_LENGTH* = 768 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/error_handling.h:91:9
else:
  let RCUTILS_ERROR_STATE_MESSAGE_MAX_LENGTH* = 768 ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/error_handling.h:91:9
proc rcutils_steady_time_now*(now: ptr rcutils_time_point_value_t): rcutils_ret_t {.
    cdecl, importc: "rcutils_steady_time_now".}
when RCUTILS_LOG_SEVERITY_INFO is typedesc:
  type
    RCUTILS_DEFAULT_LOGGER_DEFAULT_LEVEL* = RCUTILS_LOG_SEVERITY_INFO ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/logging.h:43:9
else:
  when RCUTILS_LOG_SEVERITY_INFO is static:
    const
      RCUTILS_DEFAULT_LOGGER_DEFAULT_LEVEL* = RCUTILS_LOG_SEVERITY_INFO ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/logging.h:43:9
  else:
    let RCUTILS_DEFAULT_LOGGER_DEFAULT_LEVEL* = RCUTILS_LOG_SEVERITY_INFO ## Generated based on /nix/store/7d317fh17jfd2pymkvpyxdl9x8sdlcns-rcutils-5.1.2/include/rcutils/rcutils/logging.h:43:9
proc rcutils_get_zero_initialized_uint8_array*(): rcutils_uint8_array_t {.cdecl,
    importc: "rcutils_get_zero_initialized_uint8_array".}
when cast[cuint](24'i64) is static:
  const
    RMW_GID_STORAGE_SIZE* = cast[cuint](24'i64) ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:42:9
else:
  let RMW_GID_STORAGE_SIZE* = cast[cuint](24'i64) ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:42:9
when RMW_DURATION_UNSPECIFIED is typedesc:
  type
    RMW_QOS_DEADLINE_DEFAULT* = RMW_DURATION_UNSPECIFIED ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:460:9
else:
  when RMW_DURATION_UNSPECIFIED is static:
    const
      RMW_QOS_DEADLINE_DEFAULT* = RMW_DURATION_UNSPECIFIED ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:460:9
  else:
    let RMW_QOS_DEADLINE_DEFAULT* = RMW_DURATION_UNSPECIFIED ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:460:9
when RMW_DURATION_UNSPECIFIED is typedesc:
  type
    RMW_QOS_LIFESPAN_DEFAULT* = RMW_DURATION_UNSPECIFIED ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:463:9
else:
  when RMW_DURATION_UNSPECIFIED is static:
    const
      RMW_QOS_LIFESPAN_DEFAULT* = RMW_DURATION_UNSPECIFIED ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:463:9
  else:
    let RMW_QOS_LIFESPAN_DEFAULT* = RMW_DURATION_UNSPECIFIED ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:463:9
when RMW_DURATION_UNSPECIFIED is typedesc:
  type
    RMW_QOS_LIVELINESS_LEASE_DURATION_DEFAULT* = RMW_DURATION_UNSPECIFIED ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:466:9
else:
  when RMW_DURATION_UNSPECIFIED is static:
    const
      RMW_QOS_LIVELINESS_LEASE_DURATION_DEFAULT* = RMW_DURATION_UNSPECIFIED ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:466:9
  else:
    let RMW_QOS_LIVELINESS_LEASE_DURATION_DEFAULT* = RMW_DURATION_UNSPECIFIED ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:466:9
when UINT64_MAX is typedesc:
  type
    RMW_MESSAGE_INFO_SEQUENCE_NUMBER_UNSUPPORTED* = UINT64_MAX ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:525:9
else:
  when UINT64_MAX is static:
    const
      RMW_MESSAGE_INFO_SEQUENCE_NUMBER_UNSUPPORTED* = UINT64_MAX ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:525:9
  else:
    let RMW_MESSAGE_INFO_SEQUENCE_NUMBER_UNSUPPORTED* = UINT64_MAX ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/types.h:525:9
when RMW_RET_OK is typedesc:
  type
    RCL_RET_OK* = RMW_RET_OK ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:26:9
else:
  when RMW_RET_OK is static:
    const
      RCL_RET_OK* = RMW_RET_OK ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:26:9
  else:
    let RCL_RET_OK* = RMW_RET_OK ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:26:9
when RMW_RET_ERROR is typedesc:
  type
    RCL_RET_ERROR* = RMW_RET_ERROR ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:28:9
else:
  when RMW_RET_ERROR is static:
    const
      RCL_RET_ERROR* = RMW_RET_ERROR ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:28:9
  else:
    let RCL_RET_ERROR* = RMW_RET_ERROR ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:28:9
when RMW_RET_TIMEOUT is typedesc:
  type
    RCL_RET_TIMEOUT* = RMW_RET_TIMEOUT ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:30:9
else:
  when RMW_RET_TIMEOUT is static:
    const
      RCL_RET_TIMEOUT* = RMW_RET_TIMEOUT ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:30:9
  else:
    let RCL_RET_TIMEOUT* = RMW_RET_TIMEOUT ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:30:9
when RMW_RET_BAD_ALLOC is typedesc:
  type
    RCL_RET_BAD_ALLOC* = RMW_RET_BAD_ALLOC ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:32:9
else:
  when RMW_RET_BAD_ALLOC is static:
    const
      RCL_RET_BAD_ALLOC* = RMW_RET_BAD_ALLOC ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:32:9
  else:
    let RCL_RET_BAD_ALLOC* = RMW_RET_BAD_ALLOC ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:32:9
when RMW_RET_INVALID_ARGUMENT is typedesc:
  type
    RCL_RET_INVALID_ARGUMENT* = RMW_RET_INVALID_ARGUMENT ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:34:9
else:
  when RMW_RET_INVALID_ARGUMENT is static:
    const
      RCL_RET_INVALID_ARGUMENT* = RMW_RET_INVALID_ARGUMENT ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:34:9
  else:
    let RCL_RET_INVALID_ARGUMENT* = RMW_RET_INVALID_ARGUMENT ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:34:9
when RMW_RET_UNSUPPORTED is typedesc:
  type
    RCL_RET_UNSUPPORTED* = RMW_RET_UNSUPPORTED ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:36:9
else:
  when RMW_RET_UNSUPPORTED is static:
    const
      RCL_RET_UNSUPPORTED* = RMW_RET_UNSUPPORTED ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:36:9
  else:
    let RCL_RET_UNSUPPORTED* = RMW_RET_UNSUPPORTED ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:36:9
when 100 is static:
  const
    RCL_RET_ALREADY_INIT* = 100 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:40:9
else:
  let RCL_RET_ALREADY_INIT* = 100 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:40:9
when 101 is static:
  const
    RCL_RET_NOT_INIT* = 101  ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:42:9
else:
  let RCL_RET_NOT_INIT* = 101 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:42:9
when 102 is static:
  const
    RCL_RET_MISMATCHED_RMW_ID* = 102 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:44:9
else:
  let RCL_RET_MISMATCHED_RMW_ID* = 102 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:44:9
when 103 is static:
  const
    RCL_RET_TOPIC_NAME_INVALID* = 103 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:46:9
else:
  let RCL_RET_TOPIC_NAME_INVALID* = 103 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:46:9
when 104 is static:
  const
    RCL_RET_SERVICE_NAME_INVALID* = 104 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:48:9
else:
  let RCL_RET_SERVICE_NAME_INVALID* = 104 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:48:9
when 105 is static:
  const
    RCL_RET_UNKNOWN_SUBSTITUTION* = 105 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:50:9
else:
  let RCL_RET_UNKNOWN_SUBSTITUTION* = 105 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:50:9
when 106 is static:
  const
    RCL_RET_ALREADY_SHUTDOWN* = 106 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:52:9
else:
  let RCL_RET_ALREADY_SHUTDOWN* = 106 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:52:9
when 200 is static:
  const
    RCL_RET_NODE_INVALID* = 200 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:56:9
else:
  let RCL_RET_NODE_INVALID* = 200 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:56:9
when 201 is static:
  const
    RCL_RET_NODE_INVALID_NAME* = 201 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:58:9
else:
  let RCL_RET_NODE_INVALID_NAME* = 201 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:58:9
when 202 is static:
  const
    RCL_RET_NODE_INVALID_NAMESPACE* = 202 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:60:9
else:
  let RCL_RET_NODE_INVALID_NAMESPACE* = 202 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:60:9
when 203 is static:
  const
    RCL_RET_NODE_NAME_NON_EXISTENT* = 203 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:62:9
else:
  let RCL_RET_NODE_NAME_NON_EXISTENT* = 203 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:62:9
when 300 is static:
  const
    RCL_RET_PUBLISHER_INVALID* = 300 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:66:9
else:
  let RCL_RET_PUBLISHER_INVALID* = 300 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:66:9
when 400 is static:
  const
    RCL_RET_SUBSCRIPTION_INVALID* = 400 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:70:9
else:
  let RCL_RET_SUBSCRIPTION_INVALID* = 400 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:70:9
when 401 is static:
  const
    RCL_RET_SUBSCRIPTION_TAKE_FAILED* = 401 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:72:9
else:
  let RCL_RET_SUBSCRIPTION_TAKE_FAILED* = 401 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:72:9
when 500 is static:
  const
    RCL_RET_CLIENT_INVALID* = 500 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:76:9
else:
  let RCL_RET_CLIENT_INVALID* = 500 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:76:9
when 501 is static:
  const
    RCL_RET_CLIENT_TAKE_FAILED* = 501 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:78:9
else:
  let RCL_RET_CLIENT_TAKE_FAILED* = 501 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:78:9
when 600 is static:
  const
    RCL_RET_SERVICE_INVALID* = 600 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:82:9
else:
  let RCL_RET_SERVICE_INVALID* = 600 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:82:9
when 601 is static:
  const
    RCL_RET_SERVICE_TAKE_FAILED* = 601 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:84:9
else:
  let RCL_RET_SERVICE_TAKE_FAILED* = 601 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:84:9
when 800 is static:
  const
    RCL_RET_TIMER_INVALID* = 800 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:90:9
else:
  let RCL_RET_TIMER_INVALID* = 800 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:90:9
when 801 is static:
  const
    RCL_RET_TIMER_CANCELED* = 801 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:92:9
else:
  let RCL_RET_TIMER_CANCELED* = 801 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:92:9
when 900 is static:
  const
    RCL_RET_WAIT_SET_INVALID* = 900 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:96:9
else:
  let RCL_RET_WAIT_SET_INVALID* = 900 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:96:9
when 901 is static:
  const
    RCL_RET_WAIT_SET_EMPTY* = 901 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:98:9
else:
  let RCL_RET_WAIT_SET_EMPTY* = 901 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:98:9
when 902 is static:
  const
    RCL_RET_WAIT_SET_FULL* = 902 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:100:9
else:
  let RCL_RET_WAIT_SET_FULL* = 902 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:100:9
when 1001 is static:
  const
    RCL_RET_INVALID_REMAP_RULE* = 1001 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:104:9
else:
  let RCL_RET_INVALID_REMAP_RULE* = 1001 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:104:9
when 1002 is static:
  const
    RCL_RET_WRONG_LEXEME* = 1002 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:106:9
else:
  let RCL_RET_WRONG_LEXEME* = 1002 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:106:9
when 1003 is static:
  const
    RCL_RET_INVALID_ROS_ARGS* = 1003 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:108:9
else:
  let RCL_RET_INVALID_ROS_ARGS* = 1003 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:108:9
when 1010 is static:
  const
    RCL_RET_INVALID_PARAM_RULE* = 1010 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:110:9
else:
  let RCL_RET_INVALID_PARAM_RULE* = 1010 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:110:9
when 1020 is static:
  const
    RCL_RET_INVALID_LOG_LEVEL_RULE* = 1020 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:112:9
else:
  let RCL_RET_INVALID_LOG_LEVEL_RULE* = 1020 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:112:9
when 2000 is static:
  const
    RCL_RET_EVENT_INVALID* = 2000 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:116:9
else:
  let RCL_RET_EVENT_INVALID* = 2000 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:116:9
when 2001 is static:
  const
    RCL_RET_EVENT_TAKE_FAILED* = 2001 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:118:9
else:
  let RCL_RET_EVENT_TAKE_FAILED* = 2001 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:118:9
when 3000 is static:
  const
    RCL_RET_LIFECYCLE_STATE_REGISTERED* = 3000 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:122:9
else:
  let RCL_RET_LIFECYCLE_STATE_REGISTERED* = 3000 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:122:9
when 3001 is static:
  const
    RCL_RET_LIFECYCLE_STATE_NOT_REGISTERED* = 3001 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:124:9
else:
  let RCL_RET_LIFECYCLE_STATE_NOT_REGISTERED* = 3001 ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/types.h:124:9
when RCUTILS_S_TO_NS is typedesc:
  type
    RCL_S_TO_NS* = RCUTILS_S_TO_NS ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:32:9
else:
  when RCUTILS_S_TO_NS is static:
    const
      RCL_S_TO_NS* = RCUTILS_S_TO_NS ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:32:9
  else:
    let RCL_S_TO_NS* = RCUTILS_S_TO_NS ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:32:9
when RCUTILS_MS_TO_NS is typedesc:
  type
    RCL_MS_TO_NS* = RCUTILS_MS_TO_NS ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:34:9
else:
  when RCUTILS_MS_TO_NS is static:
    const
      RCL_MS_TO_NS* = RCUTILS_MS_TO_NS ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:34:9
  else:
    let RCL_MS_TO_NS* = RCUTILS_MS_TO_NS ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:34:9
when RCUTILS_US_TO_NS is typedesc:
  type
    RCL_US_TO_NS* = RCUTILS_US_TO_NS ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:36:9
else:
  when RCUTILS_US_TO_NS is static:
    const
      RCL_US_TO_NS* = RCUTILS_US_TO_NS ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:36:9
  else:
    let RCL_US_TO_NS* = RCUTILS_US_TO_NS ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:36:9
when RCUTILS_NS_TO_S is typedesc:
  type
    RCL_NS_TO_S* = RCUTILS_NS_TO_S ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:39:9
else:
  when RCUTILS_NS_TO_S is static:
    const
      RCL_NS_TO_S* = RCUTILS_NS_TO_S ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:39:9
  else:
    let RCL_NS_TO_S* = RCUTILS_NS_TO_S ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:39:9
when RCUTILS_NS_TO_MS is typedesc:
  type
    RCL_NS_TO_MS* = RCUTILS_NS_TO_MS ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:41:9
else:
  when RCUTILS_NS_TO_MS is static:
    const
      RCL_NS_TO_MS* = RCUTILS_NS_TO_MS ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:41:9
  else:
    let RCL_NS_TO_MS* = RCUTILS_NS_TO_MS ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:41:9
when RCUTILS_NS_TO_US is typedesc:
  type
    RCL_NS_TO_US* = RCUTILS_NS_TO_US ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:43:9
else:
  when RCUTILS_NS_TO_US is static:
    const
      RCL_NS_TO_US* = RCUTILS_NS_TO_US ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:43:9
  else:
    let RCL_NS_TO_US* = RCUTILS_NS_TO_US ## Generated based on /nix/store/7p89ilikmjhbgkgv1qr4qcbfcb8v5cs9-rcl-5.3.2/include/rcl/rcl/time.h:43:9
when RCUTILS_SAFE_FWRITE_TO_STDERR is typedesc:
  type
    RMW_SAFE_FWRITE_TO_STDERR* = RCUTILS_SAFE_FWRITE_TO_STDERR ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/error_handling.h:41:9
else:
  when RCUTILS_SAFE_FWRITE_TO_STDERR is static:
    const
      RMW_SAFE_FWRITE_TO_STDERR* = RCUTILS_SAFE_FWRITE_TO_STDERR ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/error_handling.h:41:9
  else:
    let RMW_SAFE_FWRITE_TO_STDERR* = RCUTILS_SAFE_FWRITE_TO_STDERR ## Generated based on /nix/store/djrk4ma78vcizb82q7pha3zqnj95b68m-rmw-6.1.1/include/rmw/rmw/error_handling.h:41:9
proc rcutils_set_error_state*(error_string: cstring; file: cstring;
                              line_number: csize_t): void {.cdecl,
    importc: "rcutils_set_error_state".}
proc rcutils_error_is_set*(): bool {.cdecl, importc: "rcutils_error_is_set".}
proc rcutils_get_error_state*(): ptr rcutils_error_state_t {.cdecl,
    importc: "rcutils_get_error_state".}
proc rcutils_get_error_string*(): rcutils_error_string_t {.cdecl,
    importc: "rcutils_get_error_string".}
proc rcutils_reset_error*(): void {.cdecl, importc: "rcutils_reset_error".}
proc rcutils_get_zero_initialized_allocator*(): rcutils_allocator_t {.cdecl,
    importc: "rcutils_get_zero_initialized_allocator".}
proc rcutils_allocator_is_valid*(allocator: ptr rcutils_allocator_t): bool {.
    cdecl, importc: "rcutils_allocator_is_valid".}
proc rmw_get_zero_initialized_security_options*(): rmw_security_options_t {.
    cdecl, importc: "rmw_get_zero_initialized_security_options".}
proc rmw_get_default_security_options*(): rmw_security_options_t {.cdecl,
    importc: "rmw_get_default_security_options".}
proc rmw_security_options_copy*(src: ptr rmw_security_options_t;
                                allocator: ptr rcutils_allocator_t;
                                dst: ptr rmw_security_options_t): rmw_ret_t {.
    cdecl, importc: "rmw_security_options_copy".}
proc rmw_security_options_set_root_path*(security_root_path: cstring;
    allocator: ptr rcutils_allocator_t;
    security_options: ptr rmw_security_options_t): rmw_ret_t {.cdecl,
    importc: "rmw_security_options_set_root_path".}
proc rmw_security_options_fini*(security_options: ptr rmw_security_options_t;
                                allocator: ptr rcutils_allocator_t): rmw_ret_t {.
    cdecl, importc: "rmw_security_options_fini".}
proc rmw_get_zero_initialized_init_options*(): rmw_init_options_t {.cdecl,
    importc: "rmw_get_zero_initialized_init_options".}
proc rmw_init_options_init*(init_options: ptr rmw_init_options_t;
                            allocator: rcutils_allocator_t): rmw_ret_t {.cdecl,
    importc: "rmw_init_options_init".}
proc rmw_init_options_copy*(src: ptr rmw_init_options_t;
                            dst: ptr rmw_init_options_t): rmw_ret_t {.cdecl,
    importc: "rmw_init_options_copy".}
proc rmw_init_options_fini*(init_options: ptr rmw_init_options_t): rmw_ret_t {.
    cdecl, importc: "rmw_init_options_fini".}
proc rmw_get_zero_initialized_context*(): rmw_context_t {.cdecl,
    importc: "rmw_get_zero_initialized_context".}
proc rmw_init*(options: ptr rmw_init_options_t; context: ptr rmw_context_t): rmw_ret_t {.
    cdecl, importc: "rmw_init".}
proc rmw_shutdown*(context: ptr rmw_context_t): rmw_ret_t {.cdecl,
    importc: "rmw_shutdown".}
proc rmw_context_fini*(context: ptr rmw_context_t): rmw_ret_t {.cdecl,
    importc: "rmw_context_fini".}
proc rcutils_snprintf*(buffer: cstring; buffer_size: csize_t; format: cstring): cint {.
    cdecl, varargs, importc: "rcutils_snprintf".}
proc rcutils_vsnprintf*(buffer: cstring; buffer_size: csize_t; format: cstring): cint {.
    cdecl, varargs, importc: "rcutils_vsnprintf".}
proc rcutils_fault_injection_is_test_complete*(): bool {.cdecl,
    importc: "rcutils_fault_injection_is_test_complete".}
proc rcutils_fault_injection_set_count*(count: int_least64_t): void {.cdecl,
    importc: "rcutils_fault_injection_set_count".}
proc rcutils_fault_injection_get_count*(): int_least64_t {.cdecl,
    importc: "rcutils_fault_injection_get_count".}
proc rcutils_fault_injection_maybe_fail*(): int_least64_t {.cdecl,
    importc: "_rcutils_fault_injection_maybe_fail".}
proc rcutils_initialize_error_handling_thread_local_storage*(
    allocator: rcutils_allocator_t): rcutils_ret_t {.cdecl,
    importc: "rcutils_initialize_error_handling_thread_local_storage".}
proc rcutils_get_zero_initialized_array_list*(): rcutils_array_list_t {.cdecl,
    importc: "rcutils_get_zero_initialized_array_list".}
proc rcutils_array_list_init*(array_list: ptr rcutils_array_list_t;
                              initial_capacity: csize_t; data_size: csize_t;
                              allocator: ptr rcutils_allocator_t): rcutils_ret_t {.
    cdecl, importc: "rcutils_array_list_init".}
proc rcutils_array_list_fini*(array_list: ptr rcutils_array_list_t): rcutils_ret_t {.
    cdecl, importc: "rcutils_array_list_fini".}
proc rcutils_array_list_add*(array_list: ptr rcutils_array_list_t; data: pointer): rcutils_ret_t {.
    cdecl, importc: "rcutils_array_list_add".}
proc rcutils_array_list_set*(array_list: ptr rcutils_array_list_t;
                             index: csize_t; data: pointer): rcutils_ret_t {.
    cdecl, importc: "rcutils_array_list_set".}
proc rcutils_array_list_remove*(array_list: ptr rcutils_array_list_t;
                                index: csize_t): rcutils_ret_t {.cdecl,
    importc: "rcutils_array_list_remove".}
proc rcutils_array_list_get*(array_list: ptr rcutils_array_list_t;
                             index: csize_t; data: pointer): rcutils_ret_t {.
    cdecl, importc: "rcutils_array_list_get".}
proc rcutils_array_list_get_size*(array_list: ptr rcutils_array_list_t;
                                  size: ptr csize_t): rcutils_ret_t {.cdecl,
    importc: "rcutils_array_list_get_size".}
proc rcutils_get_zero_initialized_char_array*(): rcutils_char_array_t {.cdecl,
    importc: "rcutils_get_zero_initialized_char_array".}
proc rcutils_char_array_init*(char_array: ptr rcutils_char_array_t;
                              buffer_capacity: csize_t;
                              allocator: ptr rcutils_allocator_t): rcutils_ret_t {.
    cdecl, importc: "rcutils_char_array_init".}
proc rcutils_char_array_fini*(char_array: ptr rcutils_char_array_t): rcutils_ret_t {.
    cdecl, importc: "rcutils_char_array_fini".}
proc rcutils_char_array_resize*(char_array: ptr rcutils_char_array_t;
                                new_size: csize_t): rcutils_ret_t {.cdecl,
    importc: "rcutils_char_array_resize".}
proc rcutils_char_array_expand_as_needed*(char_array: ptr rcutils_char_array_t;
    new_size: csize_t): rcutils_ret_t {.cdecl, importc: "rcutils_char_array_expand_as_needed".}
proc rcutils_char_array_vsprintf*(char_array: ptr rcutils_char_array_t;
                                  format: cstring): rcutils_ret_t {.cdecl,
    varargs, importc: "rcutils_char_array_vsprintf".}
proc rcutils_char_array_strncat*(char_array: ptr rcutils_char_array_t;
                                 src: cstring; n: csize_t): rcutils_ret_t {.
    cdecl, importc: "rcutils_char_array_strncat".}
proc rcutils_char_array_strcat*(char_array: ptr rcutils_char_array_t;
                                src: cstring): rcutils_ret_t {.cdecl,
    importc: "rcutils_char_array_strcat".}
proc rcutils_char_array_memcpy*(char_array: ptr rcutils_char_array_t;
                                src: cstring; n: csize_t): rcutils_ret_t {.
    cdecl, importc: "rcutils_char_array_memcpy".}
proc rcutils_char_array_strcpy*(char_array: ptr rcutils_char_array_t;
                                src: cstring): rcutils_ret_t {.cdecl,
    importc: "rcutils_char_array_strcpy".}
proc rcutils_hash_map_string_hash_func*(key_str: pointer): csize_t {.cdecl,
    importc: "rcutils_hash_map_string_hash_func".}
proc rcutils_hash_map_string_cmp_func*(val1: pointer; val2: pointer): cint {.
    cdecl, importc: "rcutils_hash_map_string_cmp_func".}
proc rcutils_get_zero_initialized_hash_map*(): rcutils_hash_map_t {.cdecl,
    importc: "rcutils_get_zero_initialized_hash_map".}
proc rcutils_hash_map_init*(hash_map: ptr rcutils_hash_map_t;
                            initial_capacity: csize_t; key_size: csize_t;
                            data_size: csize_t;
                            key_hashing_func: rcutils_hash_map_key_hasher_t;
                            key_cmp_func: rcutils_hash_map_key_cmp_t;
                            allocator: ptr rcutils_allocator_t): rcutils_ret_t {.
    cdecl, importc: "rcutils_hash_map_init".}
proc rcutils_hash_map_fini*(hash_map: ptr rcutils_hash_map_t): rcutils_ret_t {.
    cdecl, importc: "rcutils_hash_map_fini".}
proc rcutils_hash_map_get_capacity*(hash_map: ptr rcutils_hash_map_t;
                                    capacity: ptr csize_t): rcutils_ret_t {.
    cdecl, importc: "rcutils_hash_map_get_capacity".}
proc rcutils_hash_map_get_size*(hash_map: ptr rcutils_hash_map_t;
                                size: ptr csize_t): rcutils_ret_t {.cdecl,
    importc: "rcutils_hash_map_get_size".}
proc rcutils_hash_map_set*(hash_map: ptr rcutils_hash_map_t; key: pointer;
                           value: pointer): rcutils_ret_t {.cdecl,
    importc: "rcutils_hash_map_set".}
proc rcutils_hash_map_unset*(hash_map: ptr rcutils_hash_map_t; key: pointer): rcutils_ret_t {.
    cdecl, importc: "rcutils_hash_map_unset".}
proc rcutils_hash_map_key_exists*(hash_map: ptr rcutils_hash_map_t; key: pointer): bool {.
    cdecl, importc: "rcutils_hash_map_key_exists".}
proc rcutils_hash_map_get*(hash_map: ptr rcutils_hash_map_t; key: pointer;
                           data: pointer): rcutils_ret_t {.cdecl,
    importc: "rcutils_hash_map_get".}
proc rcutils_hash_map_get_next_key_and_data*(hash_map: ptr rcutils_hash_map_t;
    previous_key: pointer; key: pointer; data: pointer): rcutils_ret_t {.cdecl,
    importc: "rcutils_hash_map_get_next_key_and_data".}
proc rcutils_qsort*(ptrarg: pointer; count: csize_t; size: csize_t;
                    comp: proc (a0: pointer; a1: pointer): cint {.cdecl.}): rcutils_ret_t {.
    cdecl, importc: "rcutils_qsort".}
proc rcutils_get_zero_initialized_string_array*(): rcutils_string_array_t {.
    cdecl, importc: "rcutils_get_zero_initialized_string_array".}
proc rcutils_string_array_init*(string_array: ptr rcutils_string_array_t;
                                size: csize_t;
                                allocator: ptr rcutils_allocator_t): rcutils_ret_t {.
    cdecl, importc: "rcutils_string_array_init".}
proc rcutils_string_array_fini*(string_array: ptr rcutils_string_array_t): rcutils_ret_t {.
    cdecl, importc: "rcutils_string_array_fini".}
proc rcutils_string_array_cmp*(lhs: ptr rcutils_string_array_t;
                               rhs: ptr rcutils_string_array_t; res: ptr cint): rcutils_ret_t {.
    cdecl, importc: "rcutils_string_array_cmp".}
proc rcutils_string_array_resize*(string_array: ptr rcutils_string_array_t;
                                  new_size: csize_t): rcutils_ret_t {.cdecl,
    importc: "rcutils_string_array_resize".}
proc rcutils_string_array_sort_compare*(lhs: pointer; rhs: pointer): cint {.
    cdecl, importc: "rcutils_string_array_sort_compare".}
proc rcutils_get_zero_initialized_string_map*(): rcutils_string_map_t {.cdecl,
    importc: "rcutils_get_zero_initialized_string_map".}
proc rcutils_string_map_init*(string_map: ptr rcutils_string_map_t;
                              initial_capacity: csize_t;
                              allocator: rcutils_allocator_t): rcutils_ret_t {.
    cdecl, importc: "rcutils_string_map_init".}
proc rcutils_string_map_fini*(string_map: ptr rcutils_string_map_t): rcutils_ret_t {.
    cdecl, importc: "rcutils_string_map_fini".}
proc rcutils_string_map_get_capacity*(string_map: ptr rcutils_string_map_t;
                                      capacity: ptr csize_t): rcutils_ret_t {.
    cdecl, importc: "rcutils_string_map_get_capacity".}
proc rcutils_string_map_get_size*(string_map: ptr rcutils_string_map_t;
                                  size: ptr csize_t): rcutils_ret_t {.cdecl,
    importc: "rcutils_string_map_get_size".}
proc rcutils_string_map_reserve*(string_map: ptr rcutils_string_map_t;
                                 capacity: csize_t): rcutils_ret_t {.cdecl,
    importc: "rcutils_string_map_reserve".}
proc rcutils_string_map_clear*(string_map: ptr rcutils_string_map_t): rcutils_ret_t {.
    cdecl, importc: "rcutils_string_map_clear".}
proc rcutils_string_map_set*(string_map: ptr rcutils_string_map_t; key: cstring;
                             value: cstring): rcutils_ret_t {.cdecl,
    importc: "rcutils_string_map_set".}
proc rcutils_string_map_set_no_resize*(string_map: ptr rcutils_string_map_t;
                                       key: cstring; value: cstring): rcutils_ret_t {.
    cdecl, importc: "rcutils_string_map_set_no_resize".}
proc rcutils_string_map_unset*(string_map: ptr rcutils_string_map_t;
                               key: cstring): rcutils_ret_t {.cdecl,
    importc: "rcutils_string_map_unset".}
proc rcutils_string_map_key_exists*(string_map: ptr rcutils_string_map_t;
                                    key: cstring): bool {.cdecl,
    importc: "rcutils_string_map_key_exists".}
proc rcutils_string_map_key_existsn*(string_map: ptr rcutils_string_map_t;
                                     key: cstring; key_length: csize_t): bool {.
    cdecl, importc: "rcutils_string_map_key_existsn".}
proc rcutils_string_map_get*(string_map: ptr rcutils_string_map_t; key: cstring): cstring {.
    cdecl, importc: "rcutils_string_map_get".}
proc rcutils_string_map_getn*(string_map: ptr rcutils_string_map_t;
                              key: cstring; key_length: csize_t): cstring {.
    cdecl, importc: "rcutils_string_map_getn".}
proc rcutils_string_map_get_next_key*(string_map: ptr rcutils_string_map_t;
                                      key: cstring): cstring {.cdecl,
    importc: "rcutils_string_map_get_next_key".}
proc rcutils_string_map_copy*(src_string_map: ptr rcutils_string_map_t;
                              dst_string_map: ptr rcutils_string_map_t): rcutils_ret_t {.
    cdecl, importc: "rcutils_string_map_copy".}
proc rcutils_uint8_array_init*(uint8_array: ptr rcutils_uint8_array_t;
                               buffer_capacity: csize_t;
                               allocator: ptr rcutils_allocator_t): rcutils_ret_t {.
    cdecl, importc: "rcutils_uint8_array_init".}
proc rcutils_uint8_array_fini*(uint8_array: ptr rcutils_uint8_array_t): rcutils_ret_t {.
    cdecl, importc: "rcutils_uint8_array_fini".}
proc rcutils_uint8_array_resize*(uint8_array: ptr rcutils_uint8_array_t;
                                 new_size: csize_t): rcutils_ret_t {.cdecl,
    importc: "rcutils_uint8_array_resize".}
proc rcutils_system_time_now*(now: ptr rcutils_time_point_value_t): rcutils_ret_t {.
    cdecl, importc: "rcutils_system_time_now".}
proc rcutils_time_point_value_as_nanoseconds_string*(
    time_point: ptr rcutils_time_point_value_t; str: cstring; str_size: csize_t): rcutils_ret_t {.
    cdecl, importc: "rcutils_time_point_value_as_nanoseconds_string".}
proc rcutils_time_point_value_as_seconds_string*(
    time_point: ptr rcutils_time_point_value_t; str: cstring; str_size: csize_t): rcutils_ret_t {.
    cdecl, importc: "rcutils_time_point_value_as_seconds_string".}
var g_rcutils_logging_initialized* {.importc: "g_rcutils_logging_initialized".}: bool
proc rcutils_logging_initialize_with_allocator*(allocator: rcutils_allocator_t): rcutils_ret_t {.
    cdecl, importc: "rcutils_logging_initialize_with_allocator".}
proc rcutils_logging_initialize*(): rcutils_ret_t {.cdecl,
    importc: "rcutils_logging_initialize".}
proc rcutils_logging_shutdown*(): rcutils_ret_t {.cdecl,
    importc: "rcutils_logging_shutdown".}
var g_rcutils_log_severity_names* {.importc: "g_rcutils_log_severity_names".}: array[
    51'i64, cstring]
proc rcutils_logging_severity_level_from_string*(severity_string: cstring;
    allocator: rcutils_allocator_t; severity: ptr cint): rcutils_ret_t {.cdecl,
    importc: "rcutils_logging_severity_level_from_string".}
var g_rcutils_logging_output_handler* {.importc: "g_rcutils_logging_output_handler".}: rcutils_logging_output_handler_t
proc rcutils_logging_get_output_handler*(): rcutils_logging_output_handler_t {.
    cdecl, importc: "rcutils_logging_get_output_handler".}
proc rcutils_logging_set_output_handler*(
    function: rcutils_logging_output_handler_t): void {.cdecl,
    importc: "rcutils_logging_set_output_handler".}
proc rcutils_logging_format_message*(location: ptr rcutils_log_location_t;
                                     severity: cint; name: cstring;
                                     timestamp: rcutils_time_point_value_t;
                                     msg: cstring;
                                     logging_output: ptr rcutils_char_array_t): rcutils_ret_t {.
    cdecl, importc: "rcutils_logging_format_message".}
var g_rcutils_logging_default_logger_level*
    {.importc: "g_rcutils_logging_default_logger_level".}: cint
proc rcutils_logging_get_default_logger_level*(): cint {.cdecl,
    importc: "rcutils_logging_get_default_logger_level".}
proc rcutils_logging_set_default_logger_level*(level: cint): void {.cdecl,
    importc: "rcutils_logging_set_default_logger_level".}
proc rcutils_logging_get_logger_level*(name: cstring): cint {.cdecl,
    importc: "rcutils_logging_get_logger_level".}
proc rcutils_logging_get_logger_leveln*(name: cstring; name_length: csize_t): cint {.
    cdecl, importc: "rcutils_logging_get_logger_leveln".}
proc rcutils_logging_set_logger_level*(name: cstring; level: cint): rcutils_ret_t {.
    cdecl, importc: "rcutils_logging_set_logger_level".}
proc rcutils_logging_logger_is_enabled_for*(name: cstring; severity: cint): bool {.
    cdecl, importc: "rcutils_logging_logger_is_enabled_for".}
proc rcutils_logging_get_logger_effective_level*(name: cstring): cint {.cdecl,
    importc: "rcutils_logging_get_logger_effective_level".}
proc rcutils_log*(location: ptr rcutils_log_location_t; severity: cint;
                  name: cstring; format: cstring): void {.cdecl, varargs,
    importc: "rcutils_log".}
proc rcutils_logging_console_output_handler*(
    location: ptr rcutils_log_location_t; severity: cint; name: cstring;
    timestamp: rcutils_time_point_value_t; format: cstring; args: ptr va_list): void {.
    cdecl, importc: "rcutils_logging_console_output_handler".}
proc rmw_get_zero_initialized_content_filter_options*(): rmw_subscription_content_filter_options_t {.
    cdecl, importc: "rmw_get_zero_initialized_content_filter_options".}
proc rmw_subscription_content_filter_options_init*(filter_expression: cstring;
    expression_parameters_argc: csize_t;
    expression_parameter_argv: ptr UncheckedArray[cstring];
    allocator: ptr rcutils_allocator_t;
    options: ptr rmw_subscription_content_filter_options_t): rmw_ret_t {.cdecl,
    importc: "rmw_subscription_content_filter_options_init".}
proc rmw_subscription_content_filter_options_set*(filter_expression: cstring;
    expression_parameters_argc: csize_t;
    expression_parameter_argv: ptr UncheckedArray[cstring];
    allocator: ptr rcutils_allocator_t;
    options: ptr rmw_subscription_content_filter_options_t): rmw_ret_t {.cdecl,
    importc: "rmw_subscription_content_filter_options_set".}
proc rmw_subscription_content_filter_options_copy*(
    src: ptr rmw_subscription_content_filter_options_t;
    allocator: ptr rcutils_allocator_t;
    dst: ptr rmw_subscription_content_filter_options_t): rmw_ret_t {.cdecl,
    importc: "rmw_subscription_content_filter_options_copy".}
proc rmw_subscription_content_filter_options_fini*(
    options: ptr rmw_subscription_content_filter_options_t;
    allocator: ptr rcutils_allocator_t): rmw_ret_t {.cdecl,
    importc: "rmw_subscription_content_filter_options_fini".}
proc rmw_time_equal*(left: rmw_time_t; right: rmw_time_t): bool {.cdecl,
    importc: "rmw_time_equal".}
proc rmw_time_total_nsec*(time: rmw_time_t): rmw_duration_t {.cdecl,
    importc: "rmw_time_total_nsec".}
proc rmw_time_from_nsec*(nanoseconds: rmw_duration_t): rmw_time_t {.cdecl,
    importc: "rmw_time_from_nsec".}
proc rmw_time_normalize*(time: rmw_time_t): rmw_time_t {.cdecl,
    importc: "rmw_time_normalize".}
proc rmw_get_zero_initialized_message_info*(): rmw_message_info_t {.cdecl,
    importc: "rmw_get_zero_initialized_message_info".}
proc rcl_get_zero_initialized_log_levels*(): rcl_log_levels_t {.cdecl,
    importc: "rcl_get_zero_initialized_log_levels".}
proc rcl_log_levels_init*(log_levels: ptr rcl_log_levels_t;
                          allocator: ptr rcl_allocator_t; logger_count: csize_t): rcl_ret_t {.
    cdecl, importc: "rcl_log_levels_init".}
proc rcl_log_levels_copy*(src: ptr rcl_log_levels_t; dst: ptr rcl_log_levels_t): rcl_ret_t {.
    cdecl, importc: "rcl_log_levels_copy".}
proc rcl_log_levels_fini*(log_levels: ptr rcl_log_levels_t): rcl_ret_t {.cdecl,
    importc: "rcl_log_levels_fini".}
proc rcl_log_levels_shrink_to_size*(log_levels: ptr rcl_log_levels_t): rcl_ret_t {.
    cdecl, importc: "rcl_log_levels_shrink_to_size".}
proc rcl_log_levels_add_logger_setting*(log_levels: ptr rcl_log_levels_t;
                                        logger_name: cstring;
                                        log_level: rcl_log_severity_t): rcl_ret_t {.
    cdecl, importc: "rcl_log_levels_add_logger_setting".}
proc rcl_get_zero_initialized_arguments*(): rcl_arguments_t {.cdecl,
    importc: "rcl_get_zero_initialized_arguments".}
proc rcl_parse_arguments*(argc: cint; argv: ptr ptr cschar;
                          allocator: rcl_allocator_t;
                          args_output: ptr rcl_arguments_t): rcl_ret_t {.cdecl,
    importc: "rcl_parse_arguments".}
proc rcl_arguments_get_count_unparsed*(args: ptr rcl_arguments_t): cint {.cdecl,
    importc: "rcl_arguments_get_count_unparsed".}
proc rcl_arguments_get_unparsed*(args: ptr rcl_arguments_t;
                                 allocator: rcl_allocator_t;
                                 output_unparsed_indices: ptr ptr cint): rcl_ret_t {.
    cdecl, importc: "rcl_arguments_get_unparsed".}
proc rcl_arguments_get_count_unparsed_ros*(args: ptr rcl_arguments_t): cint {.
    cdecl, importc: "rcl_arguments_get_count_unparsed_ros".}
proc rcl_arguments_get_unparsed_ros*(args: ptr rcl_arguments_t;
                                     allocator: rcl_allocator_t;
                                     output_unparsed_ros_indices: ptr ptr cint): rcl_ret_t {.
    cdecl, importc: "rcl_arguments_get_unparsed_ros".}
proc rcl_arguments_get_param_files_count*(args: ptr rcl_arguments_t): cint {.
    cdecl, importc: "rcl_arguments_get_param_files_count".}
proc rcl_arguments_get_param_files*(arguments: ptr rcl_arguments_t;
                                    allocator: rcl_allocator_t;
                                    parameter_files: ptr ptr ptr cschar): rcl_ret_t {.
    cdecl, importc: "rcl_arguments_get_param_files".}
proc rcl_arguments_get_param_overrides*(arguments: ptr rcl_arguments_t;
    parameter_overrides: ptr ptr rcl_params_t): rcl_ret_t {.cdecl,
    importc: "rcl_arguments_get_param_overrides".}
proc rcl_remove_ros_arguments*(argv: ptr ptr cschar; args: ptr rcl_arguments_t;
                               allocator: rcl_allocator_t;
                               nonros_argc: ptr cint;
                               nonros_argv: ptr ptr ptr cschar): rcl_ret_t {.
    cdecl, importc: "rcl_remove_ros_arguments".}
proc rcl_arguments_get_log_levels*(arguments: ptr rcl_arguments_t;
                                   log_levels: ptr rcl_log_levels_t): rcl_ret_t {.
    cdecl, importc: "rcl_arguments_get_log_levels".}
proc rcl_arguments_copy*(args: ptr rcl_arguments_t;
                         args_out: ptr rcl_arguments_t): rcl_ret_t {.cdecl,
    importc: "rcl_arguments_copy".}
proc rcl_arguments_fini*(args: ptr rcl_arguments_t): rcl_ret_t {.cdecl,
    importc: "rcl_arguments_fini".}
proc rcl_get_zero_initialized_init_options*(): rcl_init_options_t {.cdecl,
    importc: "rcl_get_zero_initialized_init_options".}
proc rcl_init_options_init*(init_options: ptr rcl_init_options_t;
                            allocator: rcl_allocator_t): rcl_ret_t {.cdecl,
    importc: "rcl_init_options_init".}
proc rcl_init_options_copy*(src: ptr rcl_init_options_t;
                            dst: ptr rcl_init_options_t): rcl_ret_t {.cdecl,
    importc: "rcl_init_options_copy".}
proc rcl_init_options_fini*(init_options: ptr rcl_init_options_t): rcl_ret_t {.
    cdecl, importc: "rcl_init_options_fini".}
proc rcl_init_options_get_domain_id*(init_options: ptr rcl_init_options_t;
                                     domain_id: ptr csize_t): rcl_ret_t {.cdecl,
    importc: "rcl_init_options_get_domain_id".}
proc rcl_init_options_set_domain_id*(init_options: ptr rcl_init_options_t;
                                     domain_id: csize_t): rcl_ret_t {.cdecl,
    importc: "rcl_init_options_set_domain_id".}
proc rcl_init_options_get_rmw_init_options*(init_options: ptr rcl_init_options_t): ptr rmw_init_options_t {.
    cdecl, importc: "rcl_init_options_get_rmw_init_options".}
proc rcl_init_options_get_allocator*(init_options: ptr rcl_init_options_t): ptr rcl_allocator_t {.
    cdecl, importc: "rcl_init_options_get_allocator".}
proc rcl_get_zero_initialized_context*(): rcl_context_t {.cdecl,
    importc: "rcl_get_zero_initialized_context".}
proc rcl_context_fini*(context: ptr rcl_context_t): rcl_ret_t {.cdecl,
    importc: "rcl_context_fini".}
proc rcl_context_get_init_options*(context: ptr rcl_context_t): ptr rcl_init_options_t {.
    cdecl, importc: "rcl_context_get_init_options".}
proc rcl_context_get_instance_id*(context: ptr rcl_context_t): rcl_context_instance_id_t {.
    cdecl, importc: "rcl_context_get_instance_id".}
proc rcl_context_get_domain_id*(context: ptr rcl_context_t;
                                domain_id: ptr csize_t): rcl_ret_t {.cdecl,
    importc: "rcl_context_get_domain_id".}
proc rcl_context_is_valid*(context: ptr rcl_context_t): bool {.cdecl,
    importc: "rcl_context_is_valid".}
proc rcl_context_get_rmw_context*(context: ptr rcl_context_t): ptr rmw_context_t {.
    cdecl, importc: "rcl_context_get_rmw_context".}
proc rcl_init*(argc: cint; argv: ptr ptr cschar;
               options: ptr rcl_init_options_t; context: ptr rcl_context_t): rcl_ret_t {.
    cdecl, importc: "rcl_init".}
proc rcl_shutdown*(context: ptr rcl_context_t): rcl_ret_t {.cdecl,
    importc: "rcl_shutdown".}
proc rcl_get_zero_initialized_guard_condition*(): rcl_guard_condition_t {.cdecl,
    importc: "rcl_get_zero_initialized_guard_condition".}
proc rcl_guard_condition_init*(guard_condition: ptr rcl_guard_condition_t;
                               context: ptr rcl_context_t;
                               options: rcl_guard_condition_options_t): rcl_ret_t {.
    cdecl, importc: "rcl_guard_condition_init".}
proc rcl_guard_condition_init_from_rmw*(guard_condition: ptr rcl_guard_condition_t;
    rmw_guard_condition: ptr rmw_guard_condition_t; context: ptr rcl_context_t;
                                        options: rcl_guard_condition_options_t): rcl_ret_t {.
    cdecl, importc: "rcl_guard_condition_init_from_rmw".}
proc rcl_guard_condition_fini*(guard_condition: ptr rcl_guard_condition_t): rcl_ret_t {.
    cdecl, importc: "rcl_guard_condition_fini".}
proc rcl_guard_condition_get_default_options*(): rcl_guard_condition_options_t {.
    cdecl, importc: "rcl_guard_condition_get_default_options".}
proc rcl_trigger_guard_condition*(guard_condition: ptr rcl_guard_condition_t): rcl_ret_t {.
    cdecl, importc: "rcl_trigger_guard_condition".}
proc rcl_guard_condition_get_options*(guard_condition: ptr rcl_guard_condition_t): ptr rcl_guard_condition_options_t {.
    cdecl, importc: "rcl_guard_condition_get_options".}
proc rcl_guard_condition_get_rmw_handle*(
    guard_condition: ptr rcl_guard_condition_t): ptr rmw_guard_condition_t {.
    cdecl, importc: "rcl_guard_condition_get_rmw_handle".}
var RCL_DOMAIN_ID_ENV_VAR* {.importc: "RCL_DOMAIN_ID_ENV_VAR".}: cstring
proc rcl_get_default_domain_id*(domain_id: ptr csize_t): rcl_ret_t {.cdecl,
    importc: "rcl_get_default_domain_id".}
proc rcl_node_get_default_options*(): rcl_node_options_t {.cdecl,
    importc: "rcl_node_get_default_options".}
proc rcl_node_options_copy*(options: ptr rcl_node_options_t;
                            options_out: ptr rcl_node_options_t): rcl_ret_t {.
    cdecl, importc: "rcl_node_options_copy".}
proc rcl_node_options_fini*(options: ptr rcl_node_options_t): rcl_ret_t {.cdecl,
    importc: "rcl_node_options_fini".}
var RCL_DISABLE_LOANED_MESSAGES_ENV_VAR* {.
    importc: "RCL_DISABLE_LOANED_MESSAGES_ENV_VAR".}: cstring
proc rcl_get_zero_initialized_node*(): rcl_node_t {.cdecl,
    importc: "rcl_get_zero_initialized_node".}
proc rcl_node_init*(node: ptr rcl_node_t; name: cstring; namespace: cstring;
                    context: ptr rcl_context_t; options: ptr rcl_node_options_t): rcl_ret_t {.
    cdecl, importc: "rcl_node_init".}
proc rcl_node_fini*(node: ptr rcl_node_t): rcl_ret_t {.cdecl,
    importc: "rcl_node_fini".}
proc rcl_node_is_valid*(node: ptr rcl_node_t): bool {.cdecl,
    importc: "rcl_node_is_valid".}
proc rcl_node_is_valid_except_context*(node: ptr rcl_node_t): bool {.cdecl,
    importc: "rcl_node_is_valid_except_context".}
proc rcl_node_get_name*(node: ptr rcl_node_t): cstring {.cdecl,
    importc: "rcl_node_get_name".}
proc rcl_node_get_namespace*(node: ptr rcl_node_t): cstring {.cdecl,
    importc: "rcl_node_get_namespace".}
proc rcl_node_get_fully_qualified_name*(node: ptr rcl_node_t): cstring {.cdecl,
    importc: "rcl_node_get_fully_qualified_name".}
proc rcl_node_get_options*(node: ptr rcl_node_t): ptr rcl_node_options_t {.
    cdecl, importc: "rcl_node_get_options".}
proc rcl_node_get_domain_id*(node: ptr rcl_node_t; domain_id: ptr csize_t): rcl_ret_t {.
    cdecl, importc: "rcl_node_get_domain_id".}
proc rcl_node_get_rmw_handle*(node: ptr rcl_node_t): ptr rmw_node_t {.cdecl,
    importc: "rcl_node_get_rmw_handle".}
proc rcl_node_get_rcl_instance_id*(node: ptr rcl_node_t): uint64 {.cdecl,
    importc: "rcl_node_get_rcl_instance_id".}
proc rcl_node_get_graph_guard_condition*(node: ptr rcl_node_t): ptr rcl_guard_condition_t {.
    cdecl, importc: "rcl_node_get_graph_guard_condition".}
proc rcl_node_get_logger_name*(node: ptr rcl_node_t): cstring {.cdecl,
    importc: "rcl_node_get_logger_name".}
proc rcl_node_resolve_name*(node: ptr rcl_node_t; input_name: cstring;
                            allocator: rcl_allocator_t; is_service: bool;
                            only_expand: bool; output_name: ptr ptr cschar): rcl_ret_t {.
    cdecl, importc: "rcl_node_resolve_name".}
proc rcl_get_disable_loaned_message*(disable_loaned_message: ptr bool): rcl_ret_t {.
    cdecl, importc: "rcl_get_disable_loaned_message".}
proc rcl_clock_valid*(clock: ptr rcl_clock_t): bool {.cdecl,
    importc: "rcl_clock_valid".}
proc rcl_clock_init*(clock_type: rcl_clock_type_t; clock: ptr rcl_clock_t;
                     allocator: ptr rcl_allocator_t): rcl_ret_t {.cdecl,
    importc: "rcl_clock_init".}
proc rcl_clock_fini*(clock: ptr rcl_clock_t): rcl_ret_t {.cdecl,
    importc: "rcl_clock_fini".}
proc rcl_ros_clock_init*(clock: ptr rcl_clock_t; allocator: ptr rcl_allocator_t): rcl_ret_t {.
    cdecl, importc: "rcl_ros_clock_init".}
proc rcl_ros_clock_fini*(clock: ptr rcl_clock_t): rcl_ret_t {.cdecl,
    importc: "rcl_ros_clock_fini".}
proc rcl_steady_clock_init*(clock: ptr rcl_clock_t;
                            allocator: ptr rcl_allocator_t): rcl_ret_t {.cdecl,
    importc: "rcl_steady_clock_init".}
proc rcl_steady_clock_fini*(clock: ptr rcl_clock_t): rcl_ret_t {.cdecl,
    importc: "rcl_steady_clock_fini".}
proc rcl_system_clock_init*(clock: ptr rcl_clock_t;
                            allocator: ptr rcl_allocator_t): rcl_ret_t {.cdecl,
    importc: "rcl_system_clock_init".}
proc rcl_system_clock_fini*(clock: ptr rcl_clock_t): rcl_ret_t {.cdecl,
    importc: "rcl_system_clock_fini".}
proc rcl_difference_times*(start: ptr rcl_time_point_t;
                           finish: ptr rcl_time_point_t;
                           delta: ptr rcl_duration_t): rcl_ret_t {.cdecl,
    importc: "rcl_difference_times".}
proc rcl_clock_get_now*(clock: ptr rcl_clock_t;
                        time_point_value: ptr rcl_time_point_value_t): rcl_ret_t {.
    cdecl, importc: "rcl_clock_get_now".}
proc rcl_enable_ros_time_override*(clock: ptr rcl_clock_t): rcl_ret_t {.cdecl,
    importc: "rcl_enable_ros_time_override".}
proc rcl_disable_ros_time_override*(clock: ptr rcl_clock_t): rcl_ret_t {.cdecl,
    importc: "rcl_disable_ros_time_override".}
proc rcl_is_enabled_ros_time_override*(clock: ptr rcl_clock_t;
                                       is_enabled: ptr bool): rcl_ret_t {.cdecl,
    importc: "rcl_is_enabled_ros_time_override".}
proc rcl_set_ros_time_override*(clock: ptr rcl_clock_t;
                                time_value: rcl_time_point_value_t): rcl_ret_t {.
    cdecl, importc: "rcl_set_ros_time_override".}
proc rcl_clock_add_jump_callback*(clock: ptr rcl_clock_t;
                                  threshold: rcl_jump_threshold_t;
                                  callback: rcl_jump_callback_t;
                                  user_data: pointer): rcl_ret_t {.cdecl,
    importc: "rcl_clock_add_jump_callback".}
proc rcl_clock_remove_jump_callback*(clock: ptr rcl_clock_t;
                                     callback: rcl_jump_callback_t;
                                     user_data: pointer): rcl_ret_t {.cdecl,
    importc: "rcl_clock_remove_jump_callback".}
proc rcl_get_zero_initialized_publisher*(): rcl_publisher_t {.cdecl,
    importc: "rcl_get_zero_initialized_publisher".}
proc rcl_publisher_init*(publisher: ptr rcl_publisher_t; node: ptr rcl_node_t;
                         type_support: ptr rosidl_message_type_support_t;
                         topic_name: cstring;
                         options: ptr rcl_publisher_options_t): rcl_ret_t {.
    cdecl, importc: "rcl_publisher_init".}
proc rcl_publisher_fini*(publisher: ptr rcl_publisher_t; node: ptr rcl_node_t): rcl_ret_t {.
    cdecl, importc: "rcl_publisher_fini".}
proc rcl_publisher_get_default_options*(): rcl_publisher_options_t {.cdecl,
    importc: "rcl_publisher_get_default_options".}
proc rcl_borrow_loaned_message*(publisher: ptr rcl_publisher_t; type_support: ptr rosidl_message_type_support_t;
                                ros_message: ptr pointer): rcl_ret_t {.cdecl,
    importc: "rcl_borrow_loaned_message".}
proc rcl_return_loaned_message_from_publisher*(publisher: ptr rcl_publisher_t;
    loaned_message: pointer): rcl_ret_t {.cdecl,
    importc: "rcl_return_loaned_message_from_publisher".}
proc rcl_publish*(publisher: ptr rcl_publisher_t; ros_message: pointer;
                  allocation: ptr rmw_publisher_allocation_t): rcl_ret_t {.
    cdecl, importc: "rcl_publish".}
proc rcl_publish_serialized_message*(publisher: ptr rcl_publisher_t;
    serialized_message: ptr rcl_serialized_message_t;
                                     allocation: ptr rmw_publisher_allocation_t): rcl_ret_t {.
    cdecl, importc: "rcl_publish_serialized_message".}
proc rcl_publish_loaned_message*(publisher: ptr rcl_publisher_t;
                                 ros_message: pointer;
                                 allocation: ptr rmw_publisher_allocation_t): rcl_ret_t {.
    cdecl, importc: "rcl_publish_loaned_message".}
proc rcl_publisher_assert_liveliness*(publisher: ptr rcl_publisher_t): rcl_ret_t {.
    cdecl, importc: "rcl_publisher_assert_liveliness".}
proc rcl_publisher_wait_for_all_acked*(publisher: ptr rcl_publisher_t;
                                       timeout: rcl_duration_value_t): rcl_ret_t {.
    cdecl, importc: "rcl_publisher_wait_for_all_acked".}
proc rcl_publisher_get_topic_name*(publisher: ptr rcl_publisher_t): cstring {.
    cdecl, importc: "rcl_publisher_get_topic_name".}
proc rcl_publisher_get_options*(publisher: ptr rcl_publisher_t): ptr rcl_publisher_options_t {.
    cdecl, importc: "rcl_publisher_get_options".}
proc rcl_publisher_get_rmw_handle*(publisher: ptr rcl_publisher_t): ptr rmw_publisher_t {.
    cdecl, importc: "rcl_publisher_get_rmw_handle".}
proc rcl_publisher_get_context*(publisher: ptr rcl_publisher_t): ptr rcl_context_t {.
    cdecl, importc: "rcl_publisher_get_context".}
proc rcl_publisher_is_valid*(publisher: ptr rcl_publisher_t): bool {.cdecl,
    importc: "rcl_publisher_is_valid".}
proc rcl_publisher_is_valid_except_context*(publisher: ptr rcl_publisher_t): bool {.
    cdecl, importc: "rcl_publisher_is_valid_except_context".}
proc rcl_publisher_get_subscription_count*(publisher: ptr rcl_publisher_t;
    subscription_count: ptr csize_t): rcl_ret_t {.cdecl,
    importc: "rcl_publisher_get_subscription_count".}
proc rcl_publisher_get_actual_qos*(publisher: ptr rcl_publisher_t): ptr rmw_qos_profile_t {.
    cdecl, importc: "rcl_publisher_get_actual_qos".}
proc rcl_publisher_can_loan_messages*(publisher: ptr rcl_publisher_t): bool {.
    cdecl, importc: "rcl_publisher_can_loan_messages".}
proc rmw_get_zero_initialized_message_sequence*(): rmw_message_sequence_t {.
    cdecl, importc: "rmw_get_zero_initialized_message_sequence".}
proc rmw_message_sequence_init*(sequence: ptr rmw_message_sequence_t;
                                size: csize_t;
                                allocator: ptr rcutils_allocator_t): rmw_ret_t {.
    cdecl, importc: "rmw_message_sequence_init".}
proc rmw_message_sequence_fini*(sequence: ptr rmw_message_sequence_t): rmw_ret_t {.
    cdecl, importc: "rmw_message_sequence_fini".}
proc rmw_get_zero_initialized_message_info_sequence*(): rmw_message_info_sequence_t {.
    cdecl, importc: "rmw_get_zero_initialized_message_info_sequence".}
proc rmw_message_info_sequence_init*(sequence: ptr rmw_message_info_sequence_t;
                                     size: csize_t;
                                     allocator: ptr rcutils_allocator_t): rmw_ret_t {.
    cdecl, importc: "rmw_message_info_sequence_init".}
proc rmw_message_info_sequence_fini*(sequence: ptr rmw_message_info_sequence_t): rmw_ret_t {.
    cdecl, importc: "rmw_message_info_sequence_fini".}
proc rcl_get_zero_initialized_subscription*(): rcl_subscription_t {.cdecl,
    importc: "rcl_get_zero_initialized_subscription".}
proc rcl_subscription_init*(subscription: ptr rcl_subscription_t;
                            node: ptr rcl_node_t;
                            type_support: ptr rosidl_message_type_support_t;
                            topic_name: cstring;
                            options: ptr rcl_subscription_options_t): rcl_ret_t {.
    cdecl, importc: "rcl_subscription_init".}
proc rcl_subscription_fini*(subscription: ptr rcl_subscription_t;
                            node: ptr rcl_node_t): rcl_ret_t {.cdecl,
    importc: "rcl_subscription_fini".}
proc rcl_subscription_get_default_options*(): rcl_subscription_options_t {.
    cdecl, importc: "rcl_subscription_get_default_options".}
proc rcl_subscription_options_fini*(option: ptr rcl_subscription_options_t): rcl_ret_t {.
    cdecl, importc: "rcl_subscription_options_fini".}
proc rcl_subscription_options_set_content_filter_options*(
    filter_expression: cstring; expression_parameters_argc: csize_t;
    expression_parameter_argv: ptr UncheckedArray[cstring];
    options: ptr rcl_subscription_options_t): rcl_ret_t {.cdecl,
    importc: "rcl_subscription_options_set_content_filter_options".}
proc rcl_get_zero_initialized_subscription_content_filter_options*(): rcl_subscription_content_filter_options_t {.
    cdecl,
    importc: "rcl_get_zero_initialized_subscription_content_filter_options".}
proc rcl_subscription_content_filter_options_init*(
    subscription: ptr rcl_subscription_t; filter_expression: cstring;
    expression_parameters_argc: csize_t;
    expression_parameter_argv: ptr UncheckedArray[cstring];
    options: ptr rcl_subscription_content_filter_options_t): rcl_ret_t {.cdecl,
    importc: "rcl_subscription_content_filter_options_init".}
proc rcl_subscription_content_filter_options_set*(
    subscription: ptr rcl_subscription_t; filter_expression: cstring;
    expression_parameters_argc: csize_t;
    expression_parameter_argv: ptr UncheckedArray[cstring];
    options: ptr rcl_subscription_content_filter_options_t): rcl_ret_t {.cdecl,
    importc: "rcl_subscription_content_filter_options_set".}
proc rcl_subscription_content_filter_options_fini*(
    subscription: ptr rcl_subscription_t;
    options: ptr rcl_subscription_content_filter_options_t): rcl_ret_t {.cdecl,
    importc: "rcl_subscription_content_filter_options_fini".}
proc rcl_subscription_is_cft_enabled*(subscription: ptr rcl_subscription_t): bool {.
    cdecl, importc: "rcl_subscription_is_cft_enabled".}
proc rcl_subscription_set_content_filter*(subscription: ptr rcl_subscription_t;
    options: ptr rcl_subscription_content_filter_options_t): rcl_ret_t {.cdecl,
    importc: "rcl_subscription_set_content_filter".}
proc rcl_subscription_get_content_filter*(subscription: ptr rcl_subscription_t;
    options: ptr rcl_subscription_content_filter_options_t): rcl_ret_t {.cdecl,
    importc: "rcl_subscription_get_content_filter".}
proc rcl_take*(subscription: ptr rcl_subscription_t; ros_message: pointer;
               message_info: ptr rmw_message_info_t;
               allocation: ptr rmw_subscription_allocation_t): rcl_ret_t {.
    cdecl, importc: "rcl_take".}
proc rcl_take_sequence*(subscription: ptr rcl_subscription_t; count: csize_t;
                        message_sequence: ptr rmw_message_sequence_t;
                        message_info_sequence: ptr rmw_message_info_sequence_t;
                        allocation: ptr rmw_subscription_allocation_t): rcl_ret_t {.
    cdecl, importc: "rcl_take_sequence".}
proc rcl_take_serialized_message*(subscription: ptr rcl_subscription_t;
    serialized_message: ptr rcl_serialized_message_t;
                                  message_info: ptr rmw_message_info_t;
                                  allocation: ptr rmw_subscription_allocation_t): rcl_ret_t {.
    cdecl, importc: "rcl_take_serialized_message".}
proc rcl_take_loaned_message*(subscription: ptr rcl_subscription_t;
                              loaned_message: ptr pointer;
                              message_info: ptr rmw_message_info_t;
                              allocation: ptr rmw_subscription_allocation_t): rcl_ret_t {.
    cdecl, importc: "rcl_take_loaned_message".}
proc rcl_return_loaned_message_from_subscription*(
    subscription: ptr rcl_subscription_t; loaned_message: pointer): rcl_ret_t {.
    cdecl, importc: "rcl_return_loaned_message_from_subscription".}
proc rcl_subscription_get_topic_name*(subscription: ptr rcl_subscription_t): cstring {.
    cdecl, importc: "rcl_subscription_get_topic_name".}
proc rcl_subscription_get_options*(subscription: ptr rcl_subscription_t): ptr rcl_subscription_options_t {.
    cdecl, importc: "rcl_subscription_get_options".}
proc rcl_subscription_get_rmw_handle*(subscription: ptr rcl_subscription_t): ptr rmw_subscription_t {.
    cdecl, importc: "rcl_subscription_get_rmw_handle".}
proc rcl_subscription_is_valid*(subscription: ptr rcl_subscription_t): bool {.
    cdecl, importc: "rcl_subscription_is_valid".}
proc rcl_subscription_get_publisher_count*(subscription: ptr rcl_subscription_t;
    publisher_count: ptr csize_t): rmw_ret_t {.cdecl,
    importc: "rcl_subscription_get_publisher_count".}
proc rcl_subscription_get_actual_qos*(subscription: ptr rcl_subscription_t): ptr rmw_qos_profile_t {.
    cdecl, importc: "rcl_subscription_get_actual_qos".}
proc rcl_subscription_can_loan_messages*(subscription: ptr rcl_subscription_t): bool {.
    cdecl, importc: "rcl_subscription_can_loan_messages".}
proc rcl_subscription_set_on_new_message_callback*(
    subscription: ptr rcl_subscription_t; callback: rcl_event_callback_t;
    user_data: pointer): rcl_ret_t {.cdecl, importc: "rcl_subscription_set_on_new_message_callback".}
proc rcl_get_zero_initialized_client*(): rcl_client_t {.cdecl,
    importc: "rcl_get_zero_initialized_client".}
proc rcl_client_init*(client: ptr rcl_client_t; node: ptr rcl_node_t;
                      type_support: ptr rosidl_service_type_support_t;
                      service_name: cstring; options: ptr rcl_client_options_t): rcl_ret_t {.
    cdecl, importc: "rcl_client_init".}
proc rcl_client_fini*(client: ptr rcl_client_t; node: ptr rcl_node_t): rcl_ret_t {.
    cdecl, importc: "rcl_client_fini".}
proc rcl_client_get_default_options*(): rcl_client_options_t {.cdecl,
    importc: "rcl_client_get_default_options".}
proc rcl_send_request*(client: ptr rcl_client_t; ros_request: pointer;
                       sequence_number: ptr int64): rcl_ret_t {.cdecl,
    importc: "rcl_send_request".}
proc rcl_take_response_with_info*(client: ptr rcl_client_t;
                                  request_header: ptr rmw_service_info_t;
                                  ros_response: pointer): rcl_ret_t {.cdecl,
    importc: "rcl_take_response_with_info".}
proc rcl_take_response*(client: ptr rcl_client_t;
                        request_header: ptr rmw_request_id_t;
                        ros_response: pointer): rcl_ret_t {.cdecl,
    importc: "rcl_take_response".}
proc rcl_client_get_service_name*(client: ptr rcl_client_t): cstring {.cdecl,
    importc: "rcl_client_get_service_name".}
proc rcl_client_get_options*(client: ptr rcl_client_t): ptr rcl_client_options_t {.
    cdecl, importc: "rcl_client_get_options".}
proc rcl_client_get_rmw_handle*(client: ptr rcl_client_t): ptr rmw_client_t {.
    cdecl, importc: "rcl_client_get_rmw_handle".}
proc rcl_client_is_valid*(client: ptr rcl_client_t): bool {.cdecl,
    importc: "rcl_client_is_valid".}
proc rcl_client_request_publisher_get_actual_qos*(client: ptr rcl_client_t): ptr rmw_qos_profile_t {.
    cdecl, importc: "rcl_client_request_publisher_get_actual_qos".}
proc rcl_client_response_subscription_get_actual_qos*(client: ptr rcl_client_t): ptr rmw_qos_profile_t {.
    cdecl, importc: "rcl_client_response_subscription_get_actual_qos".}
proc rcl_client_set_on_new_response_callback*(client: ptr rcl_client_t;
    callback: rcl_event_callback_t; user_data: pointer): rcl_ret_t {.cdecl,
    importc: "rcl_client_set_on_new_response_callback".}
proc rcl_get_zero_initialized_service*(): rcl_service_t {.cdecl,
    importc: "rcl_get_zero_initialized_service".}
proc rcl_service_init*(service: ptr rcl_service_t; node: ptr rcl_node_t;
                       type_support: ptr rosidl_service_type_support_t;
                       service_name: cstring; options: ptr rcl_service_options_t): rcl_ret_t {.
    cdecl, importc: "rcl_service_init".}
proc rcl_service_fini*(service: ptr rcl_service_t; node: ptr rcl_node_t): rcl_ret_t {.
    cdecl, importc: "rcl_service_fini".}
proc rcl_service_get_default_options*(): rcl_service_options_t {.cdecl,
    importc: "rcl_service_get_default_options".}
proc rcl_take_request_with_info*(service: ptr rcl_service_t;
                                 request_header: ptr rmw_service_info_t;
                                 ros_request: pointer): rcl_ret_t {.cdecl,
    importc: "rcl_take_request_with_info".}
proc rcl_take_request*(service: ptr rcl_service_t;
                       request_header: ptr rmw_request_id_t;
                       ros_request: pointer): rcl_ret_t {.cdecl,
    importc: "rcl_take_request".}
proc rcl_send_response*(service: ptr rcl_service_t;
                        response_header: ptr rmw_request_id_t;
                        ros_response: pointer): rcl_ret_t {.cdecl,
    importc: "rcl_send_response".}
proc rcl_service_get_service_name*(service: ptr rcl_service_t): cstring {.cdecl,
    importc: "rcl_service_get_service_name".}
proc rcl_service_get_options*(service: ptr rcl_service_t): ptr rcl_service_options_t {.
    cdecl, importc: "rcl_service_get_options".}
proc rcl_service_get_rmw_handle*(service: ptr rcl_service_t): ptr rmw_service_t {.
    cdecl, importc: "rcl_service_get_rmw_handle".}
proc rcl_service_is_valid*(service: ptr rcl_service_t): bool {.cdecl,
    importc: "rcl_service_is_valid".}
proc rcl_service_request_subscription_get_actual_qos*(service: ptr rcl_service_t): ptr rmw_qos_profile_t {.
    cdecl, importc: "rcl_service_request_subscription_get_actual_qos".}
proc rcl_service_response_publisher_get_actual_qos*(service: ptr rcl_service_t): ptr rmw_qos_profile_t {.
    cdecl, importc: "rcl_service_response_publisher_get_actual_qos".}
proc rcl_service_set_on_new_request_callback*(service: ptr rcl_service_t;
    callback: rcl_event_callback_t; user_data: pointer): rcl_ret_t {.cdecl,
    importc: "rcl_service_set_on_new_request_callback".}
proc rmw_get_zero_initialized_event*(): rmw_event_t {.cdecl,
    importc: "rmw_get_zero_initialized_event".}
proc rmw_publisher_event_init*(rmw_event: ptr rmw_event_t;
                               publisher: ptr rmw_publisher_t;
                               event_type: rmw_event_type_t): rmw_ret_t {.cdecl,
    importc: "rmw_publisher_event_init".}
proc rmw_subscription_event_init*(rmw_event: ptr rmw_event_t;
                                  subscription: ptr rmw_subscription_t;
                                  event_type: rmw_event_type_t): rmw_ret_t {.
    cdecl, importc: "rmw_subscription_event_init".}
proc rmw_take_event*(event_handle: ptr rmw_event_t; event_info: pointer;
                     taken: ptr bool): rmw_ret_t {.cdecl,
    importc: "rmw_take_event".}
proc rmw_event_fini*(event: ptr rmw_event_t): rmw_ret_t {.cdecl,
    importc: "rmw_event_fini".}
proc rmw_get_default_publisher_options*(): rmw_publisher_options_t {.cdecl,
    importc: "rmw_get_default_publisher_options".}
var rmw_qos_profile_sensor_data*: rmw_qos_profile_t
var rmw_qos_profile_parameters*: rmw_qos_profile_t
var rmw_qos_profile_default*: rmw_qos_profile_t
var rmw_qos_profile_services_default*: rmw_qos_profile_t
var rmw_qos_profile_parameter_events*: rmw_qos_profile_t
var rmw_qos_profile_system_default*: rmw_qos_profile_t
var rmw_qos_profile_unknown*: rmw_qos_profile_t
proc rmw_qos_profile_check_compatible*(publisher_profile: rmw_qos_profile_t;
                                       subscription_profile: rmw_qos_profile_t;
    compatibility: ptr rmw_qos_compatibility_type_t; reason: cstring;
                                       reason_size: csize_t): rmw_ret_t {.cdecl,
    importc: "rmw_qos_profile_check_compatible".}
proc rmw_get_default_subscription_options*(): rmw_subscription_options_t {.
    cdecl, importc: "rmw_get_default_subscription_options".}
proc rmw_get_implementation_identifier*(): cstring {.cdecl,
    importc: "rmw_get_implementation_identifier".}
proc rmw_get_serialization_format*(): cstring {.cdecl,
    importc: "rmw_get_serialization_format".}
proc rmw_create_node*(context: ptr rmw_context_t; name: cstring;
                      namespace: cstring): ptr rmw_node_t {.cdecl,
    importc: "rmw_create_node".}
proc rmw_destroy_node*(node: ptr rmw_node_t): rmw_ret_t {.cdecl,
    importc: "rmw_destroy_node".}
proc rmw_node_assert_liveliness*(node: ptr rmw_node_t): rmw_ret_t {.cdecl,
    importc: "rmw_node_assert_liveliness".}
proc rmw_node_get_graph_guard_condition*(node: ptr rmw_node_t): ptr rmw_guard_condition_t {.
    cdecl, importc: "rmw_node_get_graph_guard_condition".}
proc rmw_init_publisher_allocation*(type_support: ptr rosidl_message_type_support_t;
    message_bounds: ptr rosidl_runtime_c_Sequence_bound;
                                    allocation: ptr rmw_publisher_allocation_t): rmw_ret_t {.
    cdecl, importc: "rmw_init_publisher_allocation".}
proc rmw_fini_publisher_allocation*(allocation: ptr rmw_publisher_allocation_t): rmw_ret_t {.
    cdecl, importc: "rmw_fini_publisher_allocation".}
proc rmw_create_publisher*(node: ptr rmw_node_t;
                           type_support: ptr rosidl_message_type_support_t;
                           topic_name: cstring;
                           qos_profile: ptr rmw_qos_profile_t;
                           publisher_options: ptr rmw_publisher_options_t): ptr rmw_publisher_t {.
    cdecl, importc: "rmw_create_publisher".}
proc rmw_destroy_publisher*(node: ptr rmw_node_t; publisher: ptr rmw_publisher_t): rmw_ret_t {.
    cdecl, importc: "rmw_destroy_publisher".}
proc rmw_borrow_loaned_message*(publisher: ptr rmw_publisher_t; type_support: ptr rosidl_message_type_support_t;
                                ros_message: ptr pointer): rmw_ret_t {.cdecl,
    importc: "rmw_borrow_loaned_message".}
proc rmw_return_loaned_message_from_publisher*(publisher: ptr rmw_publisher_t;
    loaned_message: pointer): rmw_ret_t {.cdecl,
    importc: "rmw_return_loaned_message_from_publisher".}
proc rmw_publish*(publisher: ptr rmw_publisher_t; ros_message: pointer;
                  allocation: ptr rmw_publisher_allocation_t): rmw_ret_t {.
    cdecl, importc: "rmw_publish".}
proc rmw_publish_loaned_message*(publisher: ptr rmw_publisher_t;
                                 ros_message: pointer;
                                 allocation: ptr rmw_publisher_allocation_t): rmw_ret_t {.
    cdecl, importc: "rmw_publish_loaned_message".}
proc rmw_publisher_count_matched_subscriptions*(publisher: ptr rmw_publisher_t;
    subscription_count: ptr csize_t): rmw_ret_t {.cdecl,
    importc: "rmw_publisher_count_matched_subscriptions".}
proc rmw_publisher_get_actual_qos*(publisher: ptr rmw_publisher_t;
                                   qos: ptr rmw_qos_profile_t): rmw_ret_t {.
    cdecl, importc: "rmw_publisher_get_actual_qos".}
proc rmw_publish_serialized_message*(publisher: ptr rmw_publisher_t;
    serialized_message: ptr rmw_serialized_message_t;
                                     allocation: ptr rmw_publisher_allocation_t): rmw_ret_t {.
    cdecl, importc: "rmw_publish_serialized_message".}
proc rmw_get_serialized_message_size*(type_support: ptr rosidl_message_type_support_t;
    message_bounds: ptr rosidl_runtime_c_Sequence_bound; size: ptr csize_t): rmw_ret_t {.
    cdecl, importc: "rmw_get_serialized_message_size".}
proc rmw_publisher_assert_liveliness*(publisher: ptr rmw_publisher_t): rmw_ret_t {.
    cdecl, importc: "rmw_publisher_assert_liveliness".}
proc rmw_publisher_wait_for_all_acked*(publisher: ptr rmw_publisher_t;
                                       wait_timeout: rmw_time_t): rmw_ret_t {.
    cdecl, importc: "rmw_publisher_wait_for_all_acked".}
proc rmw_serialize*(ros_message: pointer;
                    type_support: ptr rosidl_message_type_support_t;
                    serialized_message: ptr rmw_serialized_message_t): rmw_ret_t {.
    cdecl, importc: "rmw_serialize".}
proc rmw_deserialize*(serialized_message: ptr rmw_serialized_message_t;
                      type_support: ptr rosidl_message_type_support_t;
                      ros_message: pointer): rmw_ret_t {.cdecl,
    importc: "rmw_deserialize".}
proc rmw_init_subscription_allocation*(type_support: ptr rosidl_message_type_support_t;
    message_bounds: ptr rosidl_runtime_c_Sequence_bound; allocation: ptr rmw_subscription_allocation_t): rmw_ret_t {.
    cdecl, importc: "rmw_init_subscription_allocation".}
proc rmw_fini_subscription_allocation*(allocation: ptr rmw_subscription_allocation_t): rmw_ret_t {.
    cdecl, importc: "rmw_fini_subscription_allocation".}
proc rmw_create_subscription*(node: ptr rmw_node_t;
                              type_support: ptr rosidl_message_type_support_t;
                              topic_name: cstring;
                              qos_policies: ptr rmw_qos_profile_t;
    subscription_options: ptr rmw_subscription_options_t): ptr rmw_subscription_t {.
    cdecl, importc: "rmw_create_subscription".}
proc rmw_destroy_subscription*(node: ptr rmw_node_t;
                               subscription: ptr rmw_subscription_t): rmw_ret_t {.
    cdecl, importc: "rmw_destroy_subscription".}
proc rmw_subscription_count_matched_publishers*(
    subscription: ptr rmw_subscription_t; publisher_count: ptr csize_t): rmw_ret_t {.
    cdecl, importc: "rmw_subscription_count_matched_publishers".}
proc rmw_subscription_get_actual_qos*(subscription: ptr rmw_subscription_t;
                                      qos: ptr rmw_qos_profile_t): rmw_ret_t {.
    cdecl, importc: "rmw_subscription_get_actual_qos".}
proc rmw_subscription_set_content_filter*(subscription: ptr rmw_subscription_t;
    options: ptr rmw_subscription_content_filter_options_t): rmw_ret_t {.cdecl,
    importc: "rmw_subscription_set_content_filter".}
proc rmw_subscription_get_content_filter*(subscription: ptr rmw_subscription_t;
    allocator: ptr rcutils_allocator_t;
    options: ptr rmw_subscription_content_filter_options_t): rmw_ret_t {.cdecl,
    importc: "rmw_subscription_get_content_filter".}
proc rmw_take*(subscription: ptr rmw_subscription_t; ros_message: pointer;
               taken: ptr bool; allocation: ptr rmw_subscription_allocation_t): rmw_ret_t {.
    cdecl, importc: "rmw_take".}
proc rmw_take_with_info*(subscription: ptr rmw_subscription_t;
                         ros_message: pointer; taken: ptr bool;
                         message_info: ptr rmw_message_info_t;
                         allocation: ptr rmw_subscription_allocation_t): rmw_ret_t {.
    cdecl, importc: "rmw_take_with_info".}
proc rmw_take_sequence*(subscription: ptr rmw_subscription_t; count: csize_t;
                        message_sequence: ptr rmw_message_sequence_t;
                        message_info_sequence: ptr rmw_message_info_sequence_t;
                        taken: ptr csize_t;
                        allocation: ptr rmw_subscription_allocation_t): rmw_ret_t {.
    cdecl, importc: "rmw_take_sequence".}
proc rmw_take_serialized_message*(subscription: ptr rmw_subscription_t;
    serialized_message: ptr rmw_serialized_message_t; taken: ptr bool;
                                  allocation: ptr rmw_subscription_allocation_t): rmw_ret_t {.
    cdecl, importc: "rmw_take_serialized_message".}
proc rmw_take_serialized_message_with_info*(
    subscription: ptr rmw_subscription_t;
    serialized_message: ptr rmw_serialized_message_t; taken: ptr bool;
    message_info: ptr rmw_message_info_t;
    allocation: ptr rmw_subscription_allocation_t): rmw_ret_t {.cdecl,
    importc: "rmw_take_serialized_message_with_info".}
proc rmw_take_loaned_message*(subscription: ptr rmw_subscription_t;
                              loaned_message: ptr pointer; taken: ptr bool;
                              allocation: ptr rmw_subscription_allocation_t): rmw_ret_t {.
    cdecl, importc: "rmw_take_loaned_message".}
proc rmw_take_loaned_message_with_info*(subscription: ptr rmw_subscription_t;
                                        loaned_message: ptr pointer;
                                        taken: ptr bool;
                                        message_info: ptr rmw_message_info_t;
    allocation: ptr rmw_subscription_allocation_t): rmw_ret_t {.cdecl,
    importc: "rmw_take_loaned_message_with_info".}
proc rmw_return_loaned_message_from_subscription*(
    subscription: ptr rmw_subscription_t; loaned_message: pointer): rmw_ret_t {.
    cdecl, importc: "rmw_return_loaned_message_from_subscription".}
proc rmw_create_client*(node: ptr rmw_node_t;
                        type_support: ptr rosidl_service_type_support_t;
                        service_name: cstring;
                        qos_policies: ptr rmw_qos_profile_t): ptr rmw_client_t {.
    cdecl, importc: "rmw_create_client".}
proc rmw_destroy_client*(node: ptr rmw_node_t; client: ptr rmw_client_t): rmw_ret_t {.
    cdecl, importc: "rmw_destroy_client".}
proc rmw_send_request*(client: ptr rmw_client_t; ros_request: pointer;
                       sequence_id: ptr int64): rmw_ret_t {.cdecl,
    importc: "rmw_send_request".}
proc rmw_take_response*(client: ptr rmw_client_t;
                        request_header: ptr rmw_service_info_t;
                        ros_response: pointer; taken: ptr bool): rmw_ret_t {.
    cdecl, importc: "rmw_take_response".}
proc rmw_client_request_publisher_get_actual_qos*(client: ptr rmw_client_t;
    qos: ptr rmw_qos_profile_t): rmw_ret_t {.cdecl,
    importc: "rmw_client_request_publisher_get_actual_qos".}
proc rmw_client_response_subscription_get_actual_qos*(client: ptr rmw_client_t;
    qos: ptr rmw_qos_profile_t): rmw_ret_t {.cdecl,
    importc: "rmw_client_response_subscription_get_actual_qos".}
proc rmw_create_service*(node: ptr rmw_node_t;
                         type_support: ptr rosidl_service_type_support_t;
                         service_name: cstring;
                         qos_profile: ptr rmw_qos_profile_t): ptr rmw_service_t {.
    cdecl, importc: "rmw_create_service".}
proc rmw_destroy_service*(node: ptr rmw_node_t; service: ptr rmw_service_t): rmw_ret_t {.
    cdecl, importc: "rmw_destroy_service".}
proc rmw_take_request*(service: ptr rmw_service_t;
                       request_header: ptr rmw_service_info_t;
                       ros_request: pointer; taken: ptr bool): rmw_ret_t {.
    cdecl, importc: "rmw_take_request".}
proc rmw_send_response*(service: ptr rmw_service_t;
                        request_header: ptr rmw_request_id_t;
                        ros_response: pointer): rmw_ret_t {.cdecl,
    importc: "rmw_send_response".}
proc rmw_service_request_subscription_get_actual_qos*(
    service: ptr rmw_service_t; qos: ptr rmw_qos_profile_t): rmw_ret_t {.cdecl,
    importc: "rmw_service_request_subscription_get_actual_qos".}
proc rmw_service_response_publisher_get_actual_qos*(service: ptr rmw_service_t;
    qos: ptr rmw_qos_profile_t): rmw_ret_t {.cdecl,
    importc: "rmw_service_response_publisher_get_actual_qos".}
proc rmw_create_guard_condition*(context: ptr rmw_context_t): ptr rmw_guard_condition_t {.
    cdecl, importc: "rmw_create_guard_condition".}
proc rmw_destroy_guard_condition*(guard_condition: ptr rmw_guard_condition_t): rmw_ret_t {.
    cdecl, importc: "rmw_destroy_guard_condition".}
proc rmw_trigger_guard_condition*(guard_condition: ptr rmw_guard_condition_t): rmw_ret_t {.
    cdecl, importc: "rmw_trigger_guard_condition".}
proc rmw_create_wait_set*(context: ptr rmw_context_t; max_conditions: csize_t): ptr rmw_wait_set_t {.
    cdecl, importc: "rmw_create_wait_set".}
proc rmw_destroy_wait_set*(wait_set: ptr rmw_wait_set_t): rmw_ret_t {.cdecl,
    importc: "rmw_destroy_wait_set".}
proc rmw_wait*(subscriptions: ptr rmw_subscriptions_t;
               guard_conditions: ptr rmw_guard_conditions_t;
               services: ptr rmw_services_t; clients: ptr rmw_clients_t;
               events: ptr rmw_events_t; wait_set: ptr rmw_wait_set_t;
               wait_timeout: ptr rmw_time_t): rmw_ret_t {.cdecl,
    importc: "rmw_wait".}
proc rmw_get_node_names*(node: ptr rmw_node_t;
                         node_names: ptr rcutils_string_array_t;
                         node_namespaces: ptr rcutils_string_array_t): rmw_ret_t {.
    cdecl, importc: "rmw_get_node_names".}
proc rmw_get_node_names_with_enclaves*(node: ptr rmw_node_t;
                                       node_names: ptr rcutils_string_array_t;
    node_namespaces: ptr rcutils_string_array_t;
                                       enclaves: ptr rcutils_string_array_t): rmw_ret_t {.
    cdecl, importc: "rmw_get_node_names_with_enclaves".}
proc rmw_count_publishers*(node: ptr rmw_node_t; topic_name: cstring;
                           count: ptr csize_t): rmw_ret_t {.cdecl,
    importc: "rmw_count_publishers".}
proc rmw_count_subscribers*(node: ptr rmw_node_t; topic_name: cstring;
                            count: ptr csize_t): rmw_ret_t {.cdecl,
    importc: "rmw_count_subscribers".}
proc rmw_get_gid_for_publisher*(publisher: ptr rmw_publisher_t;
                                gid: ptr rmw_gid_t): rmw_ret_t {.cdecl,
    importc: "rmw_get_gid_for_publisher".}
proc rmw_compare_gids_equal*(gid1: ptr rmw_gid_t; gid2: ptr rmw_gid_t;
                             result: ptr bool): rmw_ret_t {.cdecl,
    importc: "rmw_compare_gids_equal".}
proc rmw_service_server_is_available*(node: ptr rmw_node_t;
                                      client: ptr rmw_client_t;
                                      is_available: ptr bool): rmw_ret_t {.
    cdecl, importc: "rmw_service_server_is_available".}
proc rmw_set_log_severity*(severity: rmw_log_severity_t): rmw_ret_t {.cdecl,
    importc: "rmw_set_log_severity".}
proc rmw_subscription_set_on_new_message_callback*(
    subscription: ptr rmw_subscription_t; callback: rmw_event_callback_t;
    user_data: pointer): rmw_ret_t {.cdecl, importc: "rmw_subscription_set_on_new_message_callback".}
proc rmw_service_set_on_new_request_callback*(service: ptr rmw_service_t;
    callback: rmw_event_callback_t; user_data: pointer): rmw_ret_t {.cdecl,
    importc: "rmw_service_set_on_new_request_callback".}
proc rmw_client_set_on_new_response_callback*(client: ptr rmw_client_t;
    callback: rmw_event_callback_t; user_data: pointer): rmw_ret_t {.cdecl,
    importc: "rmw_client_set_on_new_response_callback".}
proc rmw_event_set_callback*(event: ptr rmw_event_t;
                             callback: rmw_event_callback_t; user_data: pointer): rmw_ret_t {.
    cdecl, importc: "rmw_event_set_callback".}
proc rcl_get_zero_initialized_timer*(): rcl_timer_t {.cdecl,
    importc: "rcl_get_zero_initialized_timer".}
proc rcl_timer_init*(timer: ptr rcl_timer_t; clock: ptr rcl_clock_t;
                     context: ptr rcl_context_t; period: int64;
                     callback: rcl_timer_callback_t; allocator: rcl_allocator_t): rcl_ret_t {.
    cdecl, importc: "rcl_timer_init".}
proc rcl_timer_fini*(timer: ptr rcl_timer_t): rcl_ret_t {.cdecl,
    importc: "rcl_timer_fini".}
proc rcl_timer_call*(timer: ptr rcl_timer_t): rcl_ret_t {.cdecl,
    importc: "rcl_timer_call".}
proc rcl_timer_clock*(timer: ptr rcl_timer_t; clock: ptr ptr rcl_clock_t): rcl_ret_t {.
    cdecl, importc: "rcl_timer_clock".}
proc rcl_timer_is_ready*(timer: ptr rcl_timer_t; is_ready: ptr bool): rcl_ret_t {.
    cdecl, importc: "rcl_timer_is_ready".}
proc rcl_timer_get_time_until_next_call*(timer: ptr rcl_timer_t;
    time_until_next_call: ptr int64): rcl_ret_t {.cdecl,
    importc: "rcl_timer_get_time_until_next_call".}
proc rcl_timer_get_time_since_last_call*(timer: ptr rcl_timer_t;
    time_since_last_call: ptr int64): rcl_ret_t {.cdecl,
    importc: "rcl_timer_get_time_since_last_call".}
proc rcl_timer_get_period*(timer: ptr rcl_timer_t; period: ptr int64): rcl_ret_t {.
    cdecl, importc: "rcl_timer_get_period".}
proc rcl_timer_exchange_period*(timer: ptr rcl_timer_t; new_period: int64;
                                old_period: ptr int64): rcl_ret_t {.cdecl,
    importc: "rcl_timer_exchange_period".}
proc rcl_timer_get_callback*(timer: ptr rcl_timer_t): rcl_timer_callback_t {.
    cdecl, importc: "rcl_timer_get_callback".}
proc rcl_timer_exchange_callback*(timer: ptr rcl_timer_t;
                                  new_callback: rcl_timer_callback_t): rcl_timer_callback_t {.
    cdecl, importc: "rcl_timer_exchange_callback".}
proc rcl_timer_cancel*(timer: ptr rcl_timer_t): rcl_ret_t {.cdecl,
    importc: "rcl_timer_cancel".}
proc rcl_timer_is_canceled*(timer: ptr rcl_timer_t; is_canceled: ptr bool): rcl_ret_t {.
    cdecl, importc: "rcl_timer_is_canceled".}
proc rcl_timer_reset*(timer: ptr rcl_timer_t): rcl_ret_t {.cdecl,
    importc: "rcl_timer_reset".}
proc rcl_timer_get_allocator*(timer: ptr rcl_timer_t): ptr rcl_allocator_t {.
    cdecl, importc: "rcl_timer_get_allocator".}
proc rcl_timer_get_guard_condition*(timer: ptr rcl_timer_t): ptr rcl_guard_condition_t {.
    cdecl, importc: "rcl_timer_get_guard_condition".}
proc rcl_get_zero_initialized_event*(): rcl_event_t {.cdecl,
    importc: "rcl_get_zero_initialized_event".}
proc rcl_publisher_event_init*(event: ptr rcl_event_t;
                               publisher: ptr rcl_publisher_t;
                               event_type: rcl_publisher_event_type_t): rcl_ret_t {.
    cdecl, importc: "rcl_publisher_event_init".}
proc rcl_subscription_event_init*(event: ptr rcl_event_t;
                                  subscription: ptr rcl_subscription_t;
                                  event_type: rcl_subscription_event_type_t): rcl_ret_t {.
    cdecl, importc: "rcl_subscription_event_init".}
proc rcl_take_event*(event: ptr rcl_event_t; event_info: pointer): rcl_ret_t {.
    cdecl, importc: "rcl_take_event".}
proc rcl_event_fini*(event: ptr rcl_event_t): rcl_ret_t {.cdecl,
    importc: "rcl_event_fini".}
proc rcl_event_get_rmw_handle*(event: ptr rcl_event_t): ptr rmw_event_t {.cdecl,
    importc: "rcl_event_get_rmw_handle".}
proc rcl_event_is_valid*(event: ptr rcl_event_t): bool {.cdecl,
    importc: "rcl_event_is_valid".}
proc rcl_event_set_callback*(event: ptr rcl_event_t;
                             callback: rcl_event_callback_t; user_data: pointer): rcl_ret_t {.
    cdecl, importc: "rcl_event_set_callback".}
proc rcl_get_zero_initialized_wait_set*(): rcl_wait_set_t {.cdecl,
    importc: "rcl_get_zero_initialized_wait_set".}
proc rcl_wait_set_init*(wait_set: ptr rcl_wait_set_t;
                        number_of_subscriptions: csize_t;
                        number_of_guard_conditions: csize_t;
                        number_of_timers: csize_t; number_of_clients: csize_t;
                        number_of_services: csize_t; number_of_events: csize_t;
                        context: ptr rcl_context_t; allocator: rcl_allocator_t): rcl_ret_t {.
    cdecl, importc: "rcl_wait_set_init".}
proc rcl_wait_set_fini*(wait_set: ptr rcl_wait_set_t): rcl_ret_t {.cdecl,
    importc: "rcl_wait_set_fini".}
proc rcl_wait_set_get_allocator*(wait_set: ptr rcl_wait_set_t;
                                 allocator: ptr rcl_allocator_t): rcl_ret_t {.
    cdecl, importc: "rcl_wait_set_get_allocator".}
proc rcl_wait_set_add_subscription*(wait_set: ptr rcl_wait_set_t;
                                    subscription: ptr rcl_subscription_t;
                                    index: ptr csize_t): rcl_ret_t {.cdecl,
    importc: "rcl_wait_set_add_subscription".}
proc rcl_wait_set_clear*(wait_set: ptr rcl_wait_set_t): rcl_ret_t {.cdecl,
    importc: "rcl_wait_set_clear".}
proc rcl_wait_set_resize*(wait_set: ptr rcl_wait_set_t;
                          subscriptions_size: csize_t;
                          guard_conditions_size: csize_t; timers_size: csize_t;
                          clients_size: csize_t; services_size: csize_t;
                          events_size: csize_t): rcl_ret_t {.cdecl,
    importc: "rcl_wait_set_resize".}
proc rcl_wait_set_add_guard_condition*(wait_set: ptr rcl_wait_set_t;
    guard_condition: ptr rcl_guard_condition_t; index: ptr csize_t): rcl_ret_t {.
    cdecl, importc: "rcl_wait_set_add_guard_condition".}
proc rcl_wait_set_add_timer*(wait_set: ptr rcl_wait_set_t;
                             timer: ptr rcl_timer_t; index: ptr csize_t): rcl_ret_t {.
    cdecl, importc: "rcl_wait_set_add_timer".}
proc rcl_wait_set_add_client*(wait_set: ptr rcl_wait_set_t;
                              client: ptr rcl_client_t; index: ptr csize_t): rcl_ret_t {.
    cdecl, importc: "rcl_wait_set_add_client".}
proc rcl_wait_set_add_service*(wait_set: ptr rcl_wait_set_t;
                               service: ptr rcl_service_t; index: ptr csize_t): rcl_ret_t {.
    cdecl, importc: "rcl_wait_set_add_service".}
proc rcl_wait_set_add_event*(wait_set: ptr rcl_wait_set_t;
                             event: ptr rcl_event_t; index: ptr csize_t): rcl_ret_t {.
    cdecl, importc: "rcl_wait_set_add_event".}
proc rcl_wait*(wait_set: ptr rcl_wait_set_t; timeout: int64): rcl_ret_t {.cdecl,
    importc: "rcl_wait".}
proc rcl_wait_set_is_valid*(wait_set: ptr rcl_wait_set_t): bool {.cdecl,
    importc: "rcl_wait_set_is_valid".}
proc rcl_logging_configure*(global_args: ptr rcl_arguments_t;
                            allocator: ptr rcl_allocator_t): rcl_ret_t {.cdecl,
    importc: "rcl_logging_configure".}
proc rcl_logging_configure_with_output_handler*(
    global_args: ptr rcl_arguments_t; allocator: ptr rcl_allocator_t;
    output_handler: rcl_logging_output_handler_t): rcl_ret_t {.cdecl,
    importc: "rcl_logging_configure_with_output_handler".}
proc rcl_logging_fini*(): rcl_ret_t {.cdecl, importc: "rcl_logging_fini".}
proc rcl_logging_rosout_enabled*(): bool {.cdecl,
    importc: "rcl_logging_rosout_enabled".}
proc rcl_logging_multiple_output_handler*(location: ptr rcutils_log_location_t;
    severity: cint; name: cstring; timestamp: rcutils_time_point_value_t;
    format: cstring; args: ptr va_list): void {.cdecl,
    importc: "rcl_logging_multiple_output_handler".}