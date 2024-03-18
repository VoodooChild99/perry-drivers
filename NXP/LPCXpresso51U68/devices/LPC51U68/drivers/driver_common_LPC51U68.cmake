include_guard()
message("driver_common component is included.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/fsl_common.c
    ${CMAKE_CURRENT_LIST_DIR}/fsl_common_arm.c
)


target_include_directories(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/.
)


include(driver_reset_LPC51U68)

include(driver_clock_LPC51U68)

include(device_LPC51U68_CMSIS_LPC51U68)
