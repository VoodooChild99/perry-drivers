include_guard()
message("driver_fro_calib component is included.")


target_include_directories(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/drivers
)

include(driver_common_LPC51U68)

