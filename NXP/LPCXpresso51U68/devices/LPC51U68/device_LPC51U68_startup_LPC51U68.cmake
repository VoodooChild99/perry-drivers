include_guard()
message("device_LPC51U68_startup component is included.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/gcc/startup_LPC51U68.S
)


include(device_LPC51U68_system_LPC51U68)

