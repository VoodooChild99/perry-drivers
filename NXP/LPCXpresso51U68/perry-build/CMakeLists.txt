# CROSS COMPILER SETTING
SET(CMAKE_SYSTEM_NAME Generic)
CMAKE_MINIMUM_REQUIRED (VERSION 3.10.0)

# THE VERSION NUMBER
SET (Tutorial_VERSION_MAJOR 1)
SET (Tutorial_VERSION_MINOR 0)

# ENABLE ASM
ENABLE_LANGUAGE(ASM)

SET(CMAKE_STATIC_LIBRARY_PREFIX)
SET(CMAKE_STATIC_LIBRARY_SUFFIX)

SET(CMAKE_EXECUTABLE_LIBRARY_PREFIX)
SET(CMAKE_EXECUTABLE_LIBRARY_SUFFIX)

# CURRENT DIRECTORY
SET(ProjDirPath ${CMAKE_CURRENT_SOURCE_DIR})

SET(EXECUTABLE_OUTPUT_PATH ${ProjDirPath}/${CMAKE_BUILD_TYPE})
SET(LIBRARY_OUTPUT_PATH ${ProjDirPath}/${CMAKE_BUILD_TYPE})


project(libhal-LPC51U68)

set(MCUX_SDK_PROJECT_NAME libhal-LPC51U68)

include(${ProjDirPath}/flags.cmake)

include(${ProjDirPath}/config.cmake)

add_library(${MCUX_SDK_PROJECT_NAME} OBJECT)

add_custom_target(copy_bc_target ALL
    COMMAND ${CMAKE_COMMAND} -E copy $<TARGET_OBJECTS:${MCUX_SDK_PROJECT_NAME}> ${LIBRARY_OUTPUT_PATH}
    COMMAND_EXPAND_LISTS)
add_dependencies(copy_bc_target ${MCUX_SDK_PROJECT_NAME})
add_library(${MCUX_SDK_PROJECT_NAME}.bca STATIC $<TARGET_OBJECTS:${MCUX_SDK_PROJECT_NAME}>)
target_compile_options(${MCUX_SDK_PROJECT_NAME} PRIVATE
    -emit-llvm --target=${triple} --sysroot=${ARM_CROSS_COMPILE_SYSROOT})

set(CMAKE_MODULE_PATH
    ${ProjDirPath}/../devices/LPC51U68/utilities
    ${ProjDirPath}/../devices/LPC51U68/drivers
    ${ProjDirPath}/../devices/LPC51U68
    ${ProjDirPath}/../components/uart
    ${ProjDirPath}/../components/serial_manager
    ${ProjDirPath}/../components/lists
    ${ProjDirPath}/../CMSIS/Core/Include
)

# include modules
include(utility_shell_LPC51U68)

include(driver_common_LPC51U68)

include(driver_clock_LPC51U68)

include(driver_power_LPC51U68)

include(driver_reset_LPC51U68)

include(device_LPC51U68_CMSIS_LPC51U68)

include(utility_debug_console_LPC51U68)

include(component_usart_adapter_LPC51U68)

include(component_serial_manager_LPC51U68)

include(component_lists_LPC51U68)

include(component_serial_manager_uart_LPC51U68)

include(driver_flexcomm_usart_LPC51U68)

include(driver_flexcomm_LPC51U68)

include(driver_lpc_iocon_LPC51U68)

include(driver_lpc_gpio_LPC51U68)

include(driver_lpc_adc_LPC51U68)

include(driver_flexcomm_i2c_LPC51U68)

include(driver_flexcomm_spi_LPC51U68)

include(utility_assert_LPC51U68)

include(CMSIS_Include_core_cm_LPC51U68)

include(utilities_misc_utilities_LPC51U68)

include(device_LPC51U68_system_LPC51U68)
