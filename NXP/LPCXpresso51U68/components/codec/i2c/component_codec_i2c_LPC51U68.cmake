include_guard()
message("component_codec_i2c component is included.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/fsl_codec_i2c.c
)


target_include_directories(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/.
)


#OR Logic component
if(CONFIG_USE_component_flexcomm_i2c_adapter_LPC51U68)
     include(component_flexcomm_i2c_adapter_LPC51U68)
endif()
if(CONFIG_USE_component_i2c_adapter_LPC51U68)
     include(component_i2c_adapter_LPC51U68)
endif()
if(CONFIG_USE_component_ii2c_adapter_LPC51U68)
     include(component_ii2c_adapter_LPC51U68)
endif()
if(CONFIG_USE_component_lpc_i2c_adapter_LPC51U68)
     include(component_lpc_i2c_adapter_LPC51U68)
endif()
if(CONFIG_USE_component_lpi2c_adapter_LPC51U68)
     include(component_lpi2c_adapter_LPC51U68)
endif()
if(CONFIG_USE_component_i3c_adapter_LPC51U68)
     include(component_i3c_adapter_LPC51U68)
endif()
if(NOT (CONFIG_USE_component_flexcomm_i2c_adapter_LPC51U68 OR CONFIG_USE_component_i2c_adapter_LPC51U68 OR CONFIG_USE_component_ii2c_adapter_LPC51U68 OR CONFIG_USE_component_lpc_i2c_adapter_LPC51U68 OR CONFIG_USE_component_lpi2c_adapter_LPC51U68 OR CONFIG_USE_component_i3c_adapter_LPC51U68))
    message(WARNING "Since component_flexcomm_i2c_adapter_LPC51U68/component_i2c_adapter_LPC51U68/component_ii2c_adapter_LPC51U68/component_lpc_i2c_adapter_LPC51U68/component_lpi2c_adapter_LPC51U68/component_i3c_adapter_LPC51U68 is not included at first or config in config.cmake file, use component_i2c_adapter_LPC51U68 by default.")
    include(component_i2c_adapter_LPC51U68)
endif()

include(driver_common_LPC51U68)
