####################################################################
# Automatically-generated file. Do not edit!                       #
####################################################################

set(SDK_PATH "C:/Users/leo-computador/.silabs/slt/installs/conan/p/simpl965e19baece23/p")
set(COPIED_SDK_PATH "simplicity_sdk_2025.12.2")
set(PKG_PATH "C:/Users/leo-computador/.silabs/slt/installs")

add_library(slc OBJECT
    "../${COPIED_SDK_PATH}/board_drivers/hardware/driver/mx25_flash_shutdown/src/sl_mx25_flash_shutdown_eusart/sl_mx25_flash_shutdown.c"
    "../${COPIED_SDK_PATH}/boards/hardware/board/src/sl_board_control_gpio.c"
    "../${COPIED_SDK_PATH}/boards/hardware/board/src/sl_board_init.c"
    "../${COPIED_SDK_PATH}/devices/platform/Device/SiliconLabs/EFR32MG24/Source/startup_efr32mg24.c"
    "../${COPIED_SDK_PATH}/devices/platform/Device/SiliconLabs/EFR32MG24/Source/system_efr32mg24.c"
    "../${COPIED_SDK_PATH}/platform_common/platform/common/src/sl_assert.c"
    "../${COPIED_SDK_PATH}/platform_common/platform/common/src/sl_slist.c"
    "../${COPIED_SDK_PATH}/platform_common/platform/common/src/sl_string.c"
    "../${COPIED_SDK_PATH}/platform_common/platform/common/src/sl_syscalls.c"
    "../${COPIED_SDK_PATH}/platform_common_apps/app/common/util/app_log/app_log.c"
    "../${COPIED_SDK_PATH}/platform_core/hardware/driver/configuration_over_swo/src/sl_cos.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/common/src/sl_core_cortexm.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/driver/button/src/sl_button.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/driver/button/src/sl_simple_button.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/driver/debug/src/sl_debug_swo.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/driver/gpio/src/sl_gpio.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/driver/leddrv/src/sl_led.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/driver/leddrv/src/sl_simple_led.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/emdrv/dmadrv/src/dmadrv.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/emlib/src/em_burtc.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/emlib/src/em_cmu.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/emlib/src/em_emu.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/emlib/src/em_eusart.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/emlib/src/em_gpio.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/emlib/src/em_ldma.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/emlib/src/em_msc.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/emlib/src/em_prs.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/emlib/src/em_system.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/emlib/src/em_timer.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/peripheral/src/sl_hal_eusart.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/peripheral/src/sl_hal_gpio.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/peripheral/src/sl_hal_prs.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/peripheral/src/sl_hal_syscfg.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/peripheral/src/sl_hal_sysrtc.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/peripheral/src/sl_hal_sysrtc_subsystem.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/peripheral/src/sl_hal_system.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/clock_manager/src/sl_clock_manager.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/clock_manager/src/sl_clock_manager_hal_s2.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/clock_manager/src/sl_clock_manager_init.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/clock_manager/src/sl_clock_manager_init_hal_s2.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/device_init/src/sl_device_init_dcdc_s2.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/device_manager/clocks/sl_device_clock_efr32xg24.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/device_manager/devices/sl_device_peripheral_hal_efr32xg24.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/device_manager/dma/sl_device_dma_s2.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/device_manager/src/sl_device_clock.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/device_manager/src/sl_device_dma.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/device_manager/src/sl_device_gpio.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/device_manager/src/sl_device_peripheral.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/hfxo_manager/src/sl_hfxo_manager.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/hfxo_manager/src/sl_hfxo_manager_hal_s2.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/interrupt_manager/src/sl_interrupt_manager_cortexm.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/iostream/src/sl_iostream.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/iostream/src/sl_iostream_eusart.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/iostream/src/sl_iostream_retarget_stdio.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/iostream/src/sl_iostream_stdlib_config.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/iostream/src/sl_iostream_uart.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/memory_manager/src/sl_memory_manager_region.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/power_manager/src/common/sl_power_manager_common.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/power_manager/src/common/sl_power_manager_em4.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/power_manager/src/sleep_loop/sl_power_manager.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/power_manager/src/sleep_loop/sl_power_manager_debug.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/power_manager/src/sleep_loop/sl_power_manager_hal_s2.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/sl_main/src/sl_main_init.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/sl_main/src/sl_main_init_memory.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/sl_main/src/sl_main_process_action.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/sleeptimer/src/sl_sleeptimer.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/sleeptimer/src/sl_sleeptimer_hal_burtc.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/sleeptimer/src/sl_sleeptimer_hal_sysrtc.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/sleeptimer/src/sl_sleeptimer_hal_timer.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/udelay/src/sl_udelay.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/udelay/src/sl_udelay_armv6m_gcc.S"
    "../autogen/sl_board_default_init.c"
    "../autogen/sl_event_handler.c"
    "../autogen/sl_iostream_handles.c"
    "../autogen/sl_iostream_init_eusart_instances.c"
    "../autogen/sl_power_manager_handler.c"
    "../button_fsm.c"
    "../main.c"
    
)

target_include_directories(slc PUBLIC
   "../config"
   "../autogen"
   "../."
    "../${COPIED_SDK_PATH}/devices/platform/Device/SiliconLabs/EFR32MG24/Include"
    "../${COPIED_SDK_PATH}/platform_common_apps/app/common/util/app_log"
    "../${COPIED_SDK_PATH}/platform_common/platform/common/inc"
    "../${COPIED_SDK_PATH}/boards/hardware/board/inc"
    "../${COPIED_SDK_PATH}/platform_core/platform/driver/button/inc"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/clock_manager/inc"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/clock_manager/src"
    "../${COPIED_SDK_PATH}/cmsis/Core/Include"
    "../${COPIED_SDK_PATH}/platform_core/hardware/driver/configuration_over_swo/inc"
    "../${COPIED_SDK_PATH}/platform_core/platform/driver/debug/inc"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/device_manager/inc"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/device_init/inc"
    "../${COPIED_SDK_PATH}/platform_core/platform/emdrv/dmadrv/inc"
    "../${COPIED_SDK_PATH}/platform_core/platform/emdrv/dmadrv/inc/s2_signals"
    "../${COPIED_SDK_PATH}/platform_core/platform/emdrv/common/inc"
    "../${COPIED_SDK_PATH}/platform_core/platform/emlib/inc"
    "../${COPIED_SDK_PATH}/platform_core/platform/driver/gpio/inc"
    "../${COPIED_SDK_PATH}/platform_core/platform/peripheral/inc"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/hfxo_manager/inc"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/hfxo_manager/src"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/interrupt_manager/inc"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/interrupt_manager/src"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/interrupt_manager/inc/arm"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/iostream/inc"
    "../${COPIED_SDK_PATH}/platform_core/platform/driver/leddrv/inc"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/memory_manager/inc"
    "../${COPIED_SDK_PATH}/board_drivers/hardware/driver/mx25_flash_shutdown/inc/sl_mx25_flash_shutdown_eusart"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/power_manager/inc"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/power_manager/src/common"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/power_manager/src/sleep_loop"
    "../${COPIED_SDK_PATH}/platform_core/platform/common/inc"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/sl_main/inc"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/sl_main/src"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/sleeptimer/inc"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/sleeptimer/src"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/udelay/inc"
)

target_compile_definitions(slc PUBLIC
    "DEBUG_EFM=1"
    "EFR32MG24B310F1536IM48=1"
    "SL_CODE_COMPONENT_SYSTEM=system"
    "HARDWARE_BOARD_DEFAULT_RF_BAND_2400=1"
    "HARDWARE_BOARD_SUPPORTS_1_RF_BAND=1"
    "HARDWARE_BOARD_SUPPORTS_RF_BAND_2400=1"
    "HFXO_FREQ=39000000"
    "SL_BOARD_NAME=\"BRD2601B\""
    "SL_BOARD_REV=\"A01\""
    "SL_CODE_COMPONENT_CLOCK_MANAGER=clock_manager"
    "SL_COMPONENT_CATALOG_PRESENT=1"
    "SL_CODE_COMPONENT_DEVICE_PERIPHERAL=device_peripheral"
    "SL_CODE_COMPONENT_DMADRV=dmadrv"
    "SL_CODE_COMPONENT_GPIO=gpio"
    "SL_CODE_COMPONENT_HAL_COMMON=hal_common"
    "SL_CODE_COMPONENT_HAL_GPIO=hal_gpio"
    "SL_CODE_COMPONENT_HAL_SYSRTC=hal_sysrtc"
    "SL_CODE_COMPONENT_INTERRUPT_MANAGER=interrupt_manager"
    "CMSIS_NVIC_VIRTUAL=1"
    "CMSIS_NVIC_VIRTUAL_HEADER_FILE=\"cmsis_nvic_virtual.h\""
    "SL_CODE_COMPONENT_POWER_MANAGER=power_manager"
    "SL_CODE_COMPONENT_CORE=core"
    "SL_CODE_COMPONENT_SLEEPTIMER=sleeptimer"
)

target_link_libraries(slc PUBLIC
    "-Wl,--start-group"
    "gcc"
    "c"
    "m"
    "nosys"
    "-Wl,--end-group"
)
target_compile_options(slc PUBLIC
    $<$<COMPILE_LANGUAGE:C>:-mcpu=cortex-m33>
    $<$<COMPILE_LANGUAGE:C>:-mthumb>
    $<$<COMPILE_LANGUAGE:C>:-mfpu=fpv5-sp-d16>
    $<$<COMPILE_LANGUAGE:C>:-mfloat-abi=hard>
    $<$<COMPILE_LANGUAGE:C>:-mcmse>
    $<$<COMPILE_LANGUAGE:C>:-Wall>
    $<$<COMPILE_LANGUAGE:C>:-Wextra>
    $<$<COMPILE_LANGUAGE:C>:-Os>
    $<$<COMPILE_LANGUAGE:C>:-fdata-sections>
    $<$<COMPILE_LANGUAGE:C>:-ffunction-sections>
    $<$<COMPILE_LANGUAGE:C>:-fomit-frame-pointer>
    $<$<COMPILE_LANGUAGE:C>:-g>
    $<$<COMPILE_LANGUAGE:C>:--specs=nano.specs>
    $<$<COMPILE_LANGUAGE:C>:-fno-lto>
    $<$<COMPILE_LANGUAGE:CXX>:-mcpu=cortex-m33>
    $<$<COMPILE_LANGUAGE:CXX>:-mthumb>
    $<$<COMPILE_LANGUAGE:CXX>:-mfpu=fpv5-sp-d16>
    $<$<COMPILE_LANGUAGE:CXX>:-mfloat-abi=hard>
    $<$<COMPILE_LANGUAGE:CXX>:-fno-rtti>
    $<$<COMPILE_LANGUAGE:CXX>:-fno-exceptions>
    $<$<COMPILE_LANGUAGE:CXX>:-mcmse>
    $<$<COMPILE_LANGUAGE:CXX>:-Wall>
    $<$<COMPILE_LANGUAGE:CXX>:-Wextra>
    $<$<COMPILE_LANGUAGE:CXX>:-Os>
    $<$<COMPILE_LANGUAGE:CXX>:-fdata-sections>
    $<$<COMPILE_LANGUAGE:CXX>:-ffunction-sections>
    $<$<COMPILE_LANGUAGE:CXX>:-fomit-frame-pointer>
    $<$<COMPILE_LANGUAGE:CXX>:-g>
    $<$<COMPILE_LANGUAGE:CXX>:--specs=nano.specs>
    $<$<COMPILE_LANGUAGE:CXX>:-fno-lto>
    $<$<COMPILE_LANGUAGE:ASM>:-mcpu=cortex-m33>
    $<$<COMPILE_LANGUAGE:ASM>:-mthumb>
    $<$<COMPILE_LANGUAGE:ASM>:-mfpu=fpv5-sp-d16>
    $<$<COMPILE_LANGUAGE:ASM>:-mfloat-abi=hard>
    "$<$<COMPILE_LANGUAGE:ASM>:SHELL:-x assembler-with-cpp>"
)

set(post_build_command )
set_property(TARGET slc PROPERTY C_STANDARD 17)
set_property(TARGET slc PROPERTY CXX_STANDARD 17)
set_property(TARGET slc PROPERTY CXX_EXTENSIONS OFF)

target_link_options(slc INTERFACE
    -mcpu=cortex-m33
    -mthumb
    -mfpu=fpv5-sp-d16
    -mfloat-abi=hard
    -T${CMAKE_CURRENT_LIST_DIR}/../autogen/linkerfile.ld
    --specs=nano.specs
    "SHELL:-Xlinker -Map=$<TARGET_FILE_DIR:Question-2>/Question-2.map"
    -fno-lto
    -Wl,--gc-sections
)

# BEGIN_SIMPLICITY_STUDIO_METADATA=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END_SIMPLICITY_STUDIO_METADATA