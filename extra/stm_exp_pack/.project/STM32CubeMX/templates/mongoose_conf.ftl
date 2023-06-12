[#ftl]

// If we could guess an MG_ARCH so far, preserve it, otherwise try GCC-based
#if defined(MG_ARCH)
#define MG_STMPACK_ARCH MG_ARCH
#undef MG_ARCH
#elif defined(__GNUC__)
#define MG_STMPACK_ARCH MG_ARCH_NEWLIB
#endif

[#list SWIPdatas as SWIP]  
  [#if SWIP.defines??]
    [#list SWIP.defines as def]
#define ${def.name} [#if def.value == "true"] 1 [#elseif def.value == "false"] 0 [#else]${def.value}[/#if]

    [/#list]
  [/#if]
[/#list]

// Translate to Mongoose macros
#if MG_STMPACK_NET == 0
#define MG_ENABLE_TCPIP 1
#elif MG_STMPACK_NET == 1
#define MG_ENABLE_LWIP 1
#elif MG_STMPACK_NET == 2
#define MG_ENABLE_FREERTOS_TCP 1
#elif MG_STMPACK_NET == 3
#define MG_ENABLE_RL 1
#endif

#if MG_ENABLE_PACKED_FS
#define MG_ENABLE_FILE 0
#endif

// See https://mongoose.ws/documentation/#build-options
