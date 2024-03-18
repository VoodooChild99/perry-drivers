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


project(libhal-FRDM-K22F)

set(MCUX_SDK_PROJECT_NAME libhal-FRDM-K22F)

include(${ProjDirPath}/flags.cmake)

include(${ProjDirPath}/config.cmake)

add_library(${MCUX_SDK_PROJECT_NAME} OBJECT)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${ProjDirPath}/..
)

add_custom_target(copy_bc_target ALL
    COMMAND ${CMAKE_COMMAND} -E copy $<TARGET_OBJECTS:${MCUX_SDK_PROJECT_NAME}> ${LIBRARY_OUTPUT_PATH}
    COMMAND_EXPAND_LISTS)
add_dependencies(copy_bc_target ${MCUX_SDK_PROJECT_NAME})
add_library(${MCUX_SDK_PROJECT_NAME}.bca STATIC $<TARGET_OBJECTS:${MCUX_SDK_PROJECT_NAME}>)
target_compile_options(${MCUX_SDK_PROJECT_NAME} PRIVATE
    -emit-llvm --target=${triple} --sysroot=${ARM_CROSS_COMPILE_SYSROOT})

set(CMAKE_MODULE_PATH
    ${ProjDirPath}/../devices/MK22F51212/drivers
    ${ProjDirPath}/../devices/MK22F51212/utilities
    ${ProjDirPath}/../devices/MK22F51212
    ${ProjDirPath}/../components/uart
    ${ProjDirPath}/../components/serial_manager
    ${ProjDirPath}/../components/lists
    ${ProjDirPath}/../CMSIS/Core/Include
    ${ProjDirPath}/../components/gpio
)

# include modules
include(driver_port_MK22F51212)

include(utility_shell_MK22F51212)

include(driver_gpio_MK22F51212)

include(driver_clock_MK22F51212)

include(driver_common_MK22F51212)

include(driver_dspi_MK22F51212)

include(device_MK22F51212_CMSIS_MK22F51212)

include(utility_debug_console_MK22F51212)

include(component_uart_adapter_MK22F51212)

include(component_serial_manager_MK22F51212)

include(component_lists_MK22F51212)

include(component_serial_manager_uart_MK22F51212)

include(driver_uart_MK22F51212)

include(driver_i2c_MK22F51212)

include(driver_adc16_MK22F51212)

include(driver_dac_MK22F51212)

include(driver_pit_MK22F51212)

include(driver_dspi_MK22F51212)

include(component_gpio_adapter_MK22F51212)

include(driver_lpuart_MK22F51212)

include(driver_smc_MK22F51212)

include(utility_assert_MK22F51212)

include(CMSIS_Include_core_cm_MK22F51212)

include(device_MK22F51212_system_MK22F51212)
