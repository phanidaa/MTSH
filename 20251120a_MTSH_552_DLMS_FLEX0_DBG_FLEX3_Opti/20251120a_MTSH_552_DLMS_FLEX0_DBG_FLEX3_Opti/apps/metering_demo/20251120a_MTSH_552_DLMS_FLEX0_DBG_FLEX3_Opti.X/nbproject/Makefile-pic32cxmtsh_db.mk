#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-pic32cxmtsh_db.mk)" "nbproject/Makefile-local-pic32cxmtsh_db.mk"
include nbproject/Makefile-local-pic32cxmtsh_db.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=pic32cxmtsh_db
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/20251120a_MTSH_552_DLMS_FLEX0_DBG_FLEX3_Opti.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/20251120a_MTSH_552_DLMS_FLEX0_DBG_FLEX3_Opti.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../src/config/pic32cxmtsh_db/driver/memory/src/drv_memory.c ../src/config/pic32cxmtsh_db/driver/memory/src/drv_memory_file_system.c ../src/config/pic32cxmtsh_db/driver/metrology/bin/met_bin.S ../src/config/pic32cxmtsh_db/driver/metrology/drv_metrology.c ../src/config/pic32cxmtsh_db/driver/sst26/src/drv_sst26.c ../src/config/pic32cxmtsh_db/gfx/driver/controller/slcdc/cl010_slcdc.c ../src/config/pic32cxmtsh_db/gfx/driver/controller/slcdc/drv_gfx_slcdc.c ../src/config/pic32cxmtsh_db/peripheral/clk/plib_clk.c ../src/config/pic32cxmtsh_db/peripheral/cmcc/plib_cmcc.c ../src/config/pic32cxmtsh_db/peripheral/dwdt/plib_dwdt.c ../src/config/pic32cxmtsh_db/peripheral/flexcom/usart/plib_flexcom0_usart.c ../src/config/pic32cxmtsh_db/peripheral/flexcom/usart/plib_flexcom6_usart.c ../src/config/pic32cxmtsh_db/peripheral/flexcom/usart/plib_flexcom3_usart.c ../src/config/pic32cxmtsh_db/peripheral/icm/plib_icm.c ../src/config/pic32cxmtsh_db/peripheral/nvic/plib_nvic.c ../src/config/pic32cxmtsh_db/peripheral/pio/plib_pio.c ../src/config/pic32cxmtsh_db/peripheral/qspi/plib_qspi.c ../src/config/pic32cxmtsh_db/peripheral/rstc/plib_rstc.c ../src/config/pic32cxmtsh_db/peripheral/rtc/plib_rtc.c ../src/config/pic32cxmtsh_db/peripheral/sefc/plib_sefc1.c ../src/config/pic32cxmtsh_db/peripheral/sefc/plib_sefc0.c ../src/config/pic32cxmtsh_db/peripheral/sefc/plib_sefc_common.c ../src/config/pic32cxmtsh_db/peripheral/supc/plib_supc.c ../src/config/pic32cxmtsh_db/peripheral/systick/plib_systick.c ../src/config/pic32cxmtsh_db/peripheral/tc/plib_tc0.c ../src/config/pic32cxmtsh_db/peripheral/uart/plib_uart.c ../src/config/pic32cxmtsh_db/stdio/xc32_monitor.c ../src/config/pic32cxmtsh_db/system/cache/sys_cache.c ../src/config/pic32cxmtsh_db/system/command/src/sys_command.c ../src/config/pic32cxmtsh_db/system/console/src/sys_console.c ../src/config/pic32cxmtsh_db/system/console/src/sys_console_uart.c ../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system/ff.c ../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system/ffunicode.c ../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access/diskio.c ../src/config/pic32cxmtsh_db/system/fs/src/sys_fs.c ../src/config/pic32cxmtsh_db/system/fs/src/sys_fs_media_manager.c ../src/config/pic32cxmtsh_db/system/fs/src/sys_fs_fat_interface.c ../src/config/pic32cxmtsh_db/system/int/src/sys_int.c ../src/config/pic32cxmtsh_db/system/reset/sys_reset.c ../src/config/pic32cxmtsh_db/system/time/src/sys_time.c ../src/config/pic32cxmtsh_db/libc_syscalls.c ../src/config/pic32cxmtsh_db/startup_xc32.c ../src/config/pic32cxmtsh_db/exceptions.c ../src/config/pic32cxmtsh_db/interrupts.c ../src/config/pic32cxmtsh_db/tasks.c ../src/config/pic32cxmtsh_db/initialization.c ../src/gurux/src/apdu.c ../src/gurux/src/bitarray.c ../src/gurux/src/bytebuffer.c ../src/gurux/src/ciphering.c ../src/gurux/src/client.c ../src/gurux/src/converters.c ../src/gurux/src/cosem.c ../src/gurux/src/datainfo.c ../src/gurux/src/date.c ../src/gurux/src/dlms.c ../src/gurux/src/dlmsSettings.c ../src/gurux/src/gxaes.c ../src/gurux/src/gxarray.c ../src/gurux/src/gxget.c ../src/gurux/src/gxinvoke.c ../src/gurux/src/gxkey.c ../src/gurux/src/gxmd5.c ../src/gurux/src/gxobjects.c ../src/gurux/src/gxserializer.c ../src/gurux/src/gxset.c ../src/gurux/src/gxsetignoremalloc.c ../src/gurux/src/gxsetmalloc.c ../src/gurux/src/gxsha1.c ../src/gurux/src/gxsha256.c ../src/gurux/src/gxvalueeventargs.c ../src/gurux/src/helpers.c ../src/gurux/src/message.c ../src/gurux/src/notify.c ../src/gurux/src/objectarray.c ../src/gurux/src/parameters.c ../src/gurux/src/replydata.c ../src/gurux/src/server.c ../src/gurux/src/serverevents.c ../src/gurux/src/variant.c ../src/app_console.c ../src/app_metrology.c ../src/main.c ../src/app_display.c ../src/app_datalog.c ../src/app_energy.c ../src/app_events.c ../src/app_control.c ../src/app_dlms.c ../src/app_lte.c ../src/app_plc.c ../src/app_gurux_dlms_process.c ../src/app_gurux_meter_value_interface.c ../src/app_gurux_process_ee_dummy.c ../src/app_gurux_process_time.c ../src/app_gurux_uart_handdle.c ../src/app_pulse.c ../src/app_optouart.c ../src/app_pwr_offset.c ../src/app_multi_cal.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/2059779260/drv_memory.o ${OBJECTDIR}/_ext/2059779260/drv_memory_file_system.o ${OBJECTDIR}/_ext/396652648/met_bin.o ${OBJECTDIR}/_ext/271336736/drv_metrology.o ${OBJECTDIR}/_ext/945666689/drv_sst26.o ${OBJECTDIR}/_ext/1066932174/cl010_slcdc.o ${OBJECTDIR}/_ext/1066932174/drv_gfx_slcdc.o ${OBJECTDIR}/_ext/1559253944/plib_clk.o ${OBJECTDIR}/_ext/1092231196/plib_cmcc.o ${OBJECTDIR}/_ext/1092191747/plib_dwdt.o ${OBJECTDIR}/_ext/212878140/plib_flexcom0_usart.o ${OBJECTDIR}/_ext/212878140/plib_flexcom6_usart.o ${OBJECTDIR}/_ext/212878140/plib_flexcom3_usart.o ${OBJECTDIR}/_ext/1559248455/plib_icm.o ${OBJECTDIR}/_ext/1091894660/plib_nvic.o ${OBJECTDIR}/_ext/1559241540/plib_pio.o ${OBJECTDIR}/_ext/1091807947/plib_qspi.o ${OBJECTDIR}/_ext/1091778038/plib_rstc.o ${OBJECTDIR}/_ext/1559239289/plib_rtc.o ${OBJECTDIR}/_ext/1091762135/plib_sefc1.o ${OBJECTDIR}/_ext/1091762135/plib_sefc0.o ${OBJECTDIR}/_ext/1091762135/plib_sefc_common.o ${OBJECTDIR}/_ext/1091746449/plib_supc.o ${OBJECTDIR}/_ext/1686768144/plib_systick.o ${OBJECTDIR}/_ext/780985993/plib_tc0.o ${OBJECTDIR}/_ext/1091706008/plib_uart.o ${OBJECTDIR}/_ext/1469502512/xc32_monitor.o ${OBJECTDIR}/_ext/1808853019/sys_cache.o ${OBJECTDIR}/_ext/1516896519/sys_command.o ${OBJECTDIR}/_ext/1973608699/sys_console.o ${OBJECTDIR}/_ext/1973608699/sys_console_uart.o ${OBJECTDIR}/_ext/1316136687/ff.o ${OBJECTDIR}/_ext/1316136687/ffunicode.o ${OBJECTDIR}/_ext/330030374/diskio.o ${OBJECTDIR}/_ext/340841513/sys_fs.o ${OBJECTDIR}/_ext/340841513/sys_fs_media_manager.o ${OBJECTDIR}/_ext/340841513/sys_fs_fat_interface.o ${OBJECTDIR}/_ext/262248989/sys_int.o ${OBJECTDIR}/_ext/1822840296/sys_reset.o ${OBJECTDIR}/_ext/1235719273/sys_time.o ${OBJECTDIR}/_ext/1772662538/libc_syscalls.o ${OBJECTDIR}/_ext/1772662538/startup_xc32.o ${OBJECTDIR}/_ext/1772662538/exceptions.o ${OBJECTDIR}/_ext/1772662538/interrupts.o ${OBJECTDIR}/_ext/1772662538/tasks.o ${OBJECTDIR}/_ext/1772662538/initialization.o ${OBJECTDIR}/_ext/1550770622/apdu.o ${OBJECTDIR}/_ext/1550770622/bitarray.o ${OBJECTDIR}/_ext/1550770622/bytebuffer.o ${OBJECTDIR}/_ext/1550770622/ciphering.o ${OBJECTDIR}/_ext/1550770622/client.o ${OBJECTDIR}/_ext/1550770622/converters.o ${OBJECTDIR}/_ext/1550770622/cosem.o ${OBJECTDIR}/_ext/1550770622/datainfo.o ${OBJECTDIR}/_ext/1550770622/date.o ${OBJECTDIR}/_ext/1550770622/dlms.o ${OBJECTDIR}/_ext/1550770622/dlmsSettings.o ${OBJECTDIR}/_ext/1550770622/gxaes.o ${OBJECTDIR}/_ext/1550770622/gxarray.o ${OBJECTDIR}/_ext/1550770622/gxget.o ${OBJECTDIR}/_ext/1550770622/gxinvoke.o ${OBJECTDIR}/_ext/1550770622/gxkey.o ${OBJECTDIR}/_ext/1550770622/gxmd5.o ${OBJECTDIR}/_ext/1550770622/gxobjects.o ${OBJECTDIR}/_ext/1550770622/gxserializer.o ${OBJECTDIR}/_ext/1550770622/gxset.o ${OBJECTDIR}/_ext/1550770622/gxsetignoremalloc.o ${OBJECTDIR}/_ext/1550770622/gxsetmalloc.o ${OBJECTDIR}/_ext/1550770622/gxsha1.o ${OBJECTDIR}/_ext/1550770622/gxsha256.o ${OBJECTDIR}/_ext/1550770622/gxvalueeventargs.o ${OBJECTDIR}/_ext/1550770622/helpers.o ${OBJECTDIR}/_ext/1550770622/message.o ${OBJECTDIR}/_ext/1550770622/notify.o ${OBJECTDIR}/_ext/1550770622/objectarray.o ${OBJECTDIR}/_ext/1550770622/parameters.o ${OBJECTDIR}/_ext/1550770622/replydata.o ${OBJECTDIR}/_ext/1550770622/server.o ${OBJECTDIR}/_ext/1550770622/serverevents.o ${OBJECTDIR}/_ext/1550770622/variant.o ${OBJECTDIR}/_ext/1360937237/app_console.o ${OBJECTDIR}/_ext/1360937237/app_metrology.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/app_display.o ${OBJECTDIR}/_ext/1360937237/app_datalog.o ${OBJECTDIR}/_ext/1360937237/app_energy.o ${OBJECTDIR}/_ext/1360937237/app_events.o ${OBJECTDIR}/_ext/1360937237/app_control.o ${OBJECTDIR}/_ext/1360937237/app_dlms.o ${OBJECTDIR}/_ext/1360937237/app_lte.o ${OBJECTDIR}/_ext/1360937237/app_plc.o ${OBJECTDIR}/_ext/1360937237/app_gurux_dlms_process.o ${OBJECTDIR}/_ext/1360937237/app_gurux_meter_value_interface.o ${OBJECTDIR}/_ext/1360937237/app_gurux_process_ee_dummy.o ${OBJECTDIR}/_ext/1360937237/app_gurux_process_time.o ${OBJECTDIR}/_ext/1360937237/app_gurux_uart_handdle.o ${OBJECTDIR}/_ext/1360937237/app_pulse.o ${OBJECTDIR}/_ext/1360937237/app_optouart.o ${OBJECTDIR}/_ext/1360937237/app_pwr_offset.o ${OBJECTDIR}/_ext/1360937237/app_multi_cal.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/2059779260/drv_memory.o.d ${OBJECTDIR}/_ext/2059779260/drv_memory_file_system.o.d ${OBJECTDIR}/_ext/396652648/met_bin.o.d ${OBJECTDIR}/_ext/271336736/drv_metrology.o.d ${OBJECTDIR}/_ext/945666689/drv_sst26.o.d ${OBJECTDIR}/_ext/1066932174/cl010_slcdc.o.d ${OBJECTDIR}/_ext/1066932174/drv_gfx_slcdc.o.d ${OBJECTDIR}/_ext/1559253944/plib_clk.o.d ${OBJECTDIR}/_ext/1092231196/plib_cmcc.o.d ${OBJECTDIR}/_ext/1092191747/plib_dwdt.o.d ${OBJECTDIR}/_ext/212878140/plib_flexcom0_usart.o.d ${OBJECTDIR}/_ext/212878140/plib_flexcom6_usart.o.d ${OBJECTDIR}/_ext/212878140/plib_flexcom3_usart.o.d ${OBJECTDIR}/_ext/1559248455/plib_icm.o.d ${OBJECTDIR}/_ext/1091894660/plib_nvic.o.d ${OBJECTDIR}/_ext/1559241540/plib_pio.o.d ${OBJECTDIR}/_ext/1091807947/plib_qspi.o.d ${OBJECTDIR}/_ext/1091778038/plib_rstc.o.d ${OBJECTDIR}/_ext/1559239289/plib_rtc.o.d ${OBJECTDIR}/_ext/1091762135/plib_sefc1.o.d ${OBJECTDIR}/_ext/1091762135/plib_sefc0.o.d ${OBJECTDIR}/_ext/1091762135/plib_sefc_common.o.d ${OBJECTDIR}/_ext/1091746449/plib_supc.o.d ${OBJECTDIR}/_ext/1686768144/plib_systick.o.d ${OBJECTDIR}/_ext/780985993/plib_tc0.o.d ${OBJECTDIR}/_ext/1091706008/plib_uart.o.d ${OBJECTDIR}/_ext/1469502512/xc32_monitor.o.d ${OBJECTDIR}/_ext/1808853019/sys_cache.o.d ${OBJECTDIR}/_ext/1516896519/sys_command.o.d ${OBJECTDIR}/_ext/1973608699/sys_console.o.d ${OBJECTDIR}/_ext/1973608699/sys_console_uart.o.d ${OBJECTDIR}/_ext/1316136687/ff.o.d ${OBJECTDIR}/_ext/1316136687/ffunicode.o.d ${OBJECTDIR}/_ext/330030374/diskio.o.d ${OBJECTDIR}/_ext/340841513/sys_fs.o.d ${OBJECTDIR}/_ext/340841513/sys_fs_media_manager.o.d ${OBJECTDIR}/_ext/340841513/sys_fs_fat_interface.o.d ${OBJECTDIR}/_ext/262248989/sys_int.o.d ${OBJECTDIR}/_ext/1822840296/sys_reset.o.d ${OBJECTDIR}/_ext/1235719273/sys_time.o.d ${OBJECTDIR}/_ext/1772662538/libc_syscalls.o.d ${OBJECTDIR}/_ext/1772662538/startup_xc32.o.d ${OBJECTDIR}/_ext/1772662538/exceptions.o.d ${OBJECTDIR}/_ext/1772662538/interrupts.o.d ${OBJECTDIR}/_ext/1772662538/tasks.o.d ${OBJECTDIR}/_ext/1772662538/initialization.o.d ${OBJECTDIR}/_ext/1550770622/apdu.o.d ${OBJECTDIR}/_ext/1550770622/bitarray.o.d ${OBJECTDIR}/_ext/1550770622/bytebuffer.o.d ${OBJECTDIR}/_ext/1550770622/ciphering.o.d ${OBJECTDIR}/_ext/1550770622/client.o.d ${OBJECTDIR}/_ext/1550770622/converters.o.d ${OBJECTDIR}/_ext/1550770622/cosem.o.d ${OBJECTDIR}/_ext/1550770622/datainfo.o.d ${OBJECTDIR}/_ext/1550770622/date.o.d ${OBJECTDIR}/_ext/1550770622/dlms.o.d ${OBJECTDIR}/_ext/1550770622/dlmsSettings.o.d ${OBJECTDIR}/_ext/1550770622/gxaes.o.d ${OBJECTDIR}/_ext/1550770622/gxarray.o.d ${OBJECTDIR}/_ext/1550770622/gxget.o.d ${OBJECTDIR}/_ext/1550770622/gxinvoke.o.d ${OBJECTDIR}/_ext/1550770622/gxkey.o.d ${OBJECTDIR}/_ext/1550770622/gxmd5.o.d ${OBJECTDIR}/_ext/1550770622/gxobjects.o.d ${OBJECTDIR}/_ext/1550770622/gxserializer.o.d ${OBJECTDIR}/_ext/1550770622/gxset.o.d ${OBJECTDIR}/_ext/1550770622/gxsetignoremalloc.o.d ${OBJECTDIR}/_ext/1550770622/gxsetmalloc.o.d ${OBJECTDIR}/_ext/1550770622/gxsha1.o.d ${OBJECTDIR}/_ext/1550770622/gxsha256.o.d ${OBJECTDIR}/_ext/1550770622/gxvalueeventargs.o.d ${OBJECTDIR}/_ext/1550770622/helpers.o.d ${OBJECTDIR}/_ext/1550770622/message.o.d ${OBJECTDIR}/_ext/1550770622/notify.o.d ${OBJECTDIR}/_ext/1550770622/objectarray.o.d ${OBJECTDIR}/_ext/1550770622/parameters.o.d ${OBJECTDIR}/_ext/1550770622/replydata.o.d ${OBJECTDIR}/_ext/1550770622/server.o.d ${OBJECTDIR}/_ext/1550770622/serverevents.o.d ${OBJECTDIR}/_ext/1550770622/variant.o.d ${OBJECTDIR}/_ext/1360937237/app_console.o.d ${OBJECTDIR}/_ext/1360937237/app_metrology.o.d ${OBJECTDIR}/_ext/1360937237/main.o.d ${OBJECTDIR}/_ext/1360937237/app_display.o.d ${OBJECTDIR}/_ext/1360937237/app_datalog.o.d ${OBJECTDIR}/_ext/1360937237/app_energy.o.d ${OBJECTDIR}/_ext/1360937237/app_events.o.d ${OBJECTDIR}/_ext/1360937237/app_control.o.d ${OBJECTDIR}/_ext/1360937237/app_dlms.o.d ${OBJECTDIR}/_ext/1360937237/app_lte.o.d ${OBJECTDIR}/_ext/1360937237/app_plc.o.d ${OBJECTDIR}/_ext/1360937237/app_gurux_dlms_process.o.d ${OBJECTDIR}/_ext/1360937237/app_gurux_meter_value_interface.o.d ${OBJECTDIR}/_ext/1360937237/app_gurux_process_ee_dummy.o.d ${OBJECTDIR}/_ext/1360937237/app_gurux_process_time.o.d ${OBJECTDIR}/_ext/1360937237/app_gurux_uart_handdle.o.d ${OBJECTDIR}/_ext/1360937237/app_pulse.o.d ${OBJECTDIR}/_ext/1360937237/app_optouart.o.d ${OBJECTDIR}/_ext/1360937237/app_pwr_offset.o.d ${OBJECTDIR}/_ext/1360937237/app_multi_cal.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/2059779260/drv_memory.o ${OBJECTDIR}/_ext/2059779260/drv_memory_file_system.o ${OBJECTDIR}/_ext/396652648/met_bin.o ${OBJECTDIR}/_ext/271336736/drv_metrology.o ${OBJECTDIR}/_ext/945666689/drv_sst26.o ${OBJECTDIR}/_ext/1066932174/cl010_slcdc.o ${OBJECTDIR}/_ext/1066932174/drv_gfx_slcdc.o ${OBJECTDIR}/_ext/1559253944/plib_clk.o ${OBJECTDIR}/_ext/1092231196/plib_cmcc.o ${OBJECTDIR}/_ext/1092191747/plib_dwdt.o ${OBJECTDIR}/_ext/212878140/plib_flexcom0_usart.o ${OBJECTDIR}/_ext/212878140/plib_flexcom6_usart.o ${OBJECTDIR}/_ext/212878140/plib_flexcom3_usart.o ${OBJECTDIR}/_ext/1559248455/plib_icm.o ${OBJECTDIR}/_ext/1091894660/plib_nvic.o ${OBJECTDIR}/_ext/1559241540/plib_pio.o ${OBJECTDIR}/_ext/1091807947/plib_qspi.o ${OBJECTDIR}/_ext/1091778038/plib_rstc.o ${OBJECTDIR}/_ext/1559239289/plib_rtc.o ${OBJECTDIR}/_ext/1091762135/plib_sefc1.o ${OBJECTDIR}/_ext/1091762135/plib_sefc0.o ${OBJECTDIR}/_ext/1091762135/plib_sefc_common.o ${OBJECTDIR}/_ext/1091746449/plib_supc.o ${OBJECTDIR}/_ext/1686768144/plib_systick.o ${OBJECTDIR}/_ext/780985993/plib_tc0.o ${OBJECTDIR}/_ext/1091706008/plib_uart.o ${OBJECTDIR}/_ext/1469502512/xc32_monitor.o ${OBJECTDIR}/_ext/1808853019/sys_cache.o ${OBJECTDIR}/_ext/1516896519/sys_command.o ${OBJECTDIR}/_ext/1973608699/sys_console.o ${OBJECTDIR}/_ext/1973608699/sys_console_uart.o ${OBJECTDIR}/_ext/1316136687/ff.o ${OBJECTDIR}/_ext/1316136687/ffunicode.o ${OBJECTDIR}/_ext/330030374/diskio.o ${OBJECTDIR}/_ext/340841513/sys_fs.o ${OBJECTDIR}/_ext/340841513/sys_fs_media_manager.o ${OBJECTDIR}/_ext/340841513/sys_fs_fat_interface.o ${OBJECTDIR}/_ext/262248989/sys_int.o ${OBJECTDIR}/_ext/1822840296/sys_reset.o ${OBJECTDIR}/_ext/1235719273/sys_time.o ${OBJECTDIR}/_ext/1772662538/libc_syscalls.o ${OBJECTDIR}/_ext/1772662538/startup_xc32.o ${OBJECTDIR}/_ext/1772662538/exceptions.o ${OBJECTDIR}/_ext/1772662538/interrupts.o ${OBJECTDIR}/_ext/1772662538/tasks.o ${OBJECTDIR}/_ext/1772662538/initialization.o ${OBJECTDIR}/_ext/1550770622/apdu.o ${OBJECTDIR}/_ext/1550770622/bitarray.o ${OBJECTDIR}/_ext/1550770622/bytebuffer.o ${OBJECTDIR}/_ext/1550770622/ciphering.o ${OBJECTDIR}/_ext/1550770622/client.o ${OBJECTDIR}/_ext/1550770622/converters.o ${OBJECTDIR}/_ext/1550770622/cosem.o ${OBJECTDIR}/_ext/1550770622/datainfo.o ${OBJECTDIR}/_ext/1550770622/date.o ${OBJECTDIR}/_ext/1550770622/dlms.o ${OBJECTDIR}/_ext/1550770622/dlmsSettings.o ${OBJECTDIR}/_ext/1550770622/gxaes.o ${OBJECTDIR}/_ext/1550770622/gxarray.o ${OBJECTDIR}/_ext/1550770622/gxget.o ${OBJECTDIR}/_ext/1550770622/gxinvoke.o ${OBJECTDIR}/_ext/1550770622/gxkey.o ${OBJECTDIR}/_ext/1550770622/gxmd5.o ${OBJECTDIR}/_ext/1550770622/gxobjects.o ${OBJECTDIR}/_ext/1550770622/gxserializer.o ${OBJECTDIR}/_ext/1550770622/gxset.o ${OBJECTDIR}/_ext/1550770622/gxsetignoremalloc.o ${OBJECTDIR}/_ext/1550770622/gxsetmalloc.o ${OBJECTDIR}/_ext/1550770622/gxsha1.o ${OBJECTDIR}/_ext/1550770622/gxsha256.o ${OBJECTDIR}/_ext/1550770622/gxvalueeventargs.o ${OBJECTDIR}/_ext/1550770622/helpers.o ${OBJECTDIR}/_ext/1550770622/message.o ${OBJECTDIR}/_ext/1550770622/notify.o ${OBJECTDIR}/_ext/1550770622/objectarray.o ${OBJECTDIR}/_ext/1550770622/parameters.o ${OBJECTDIR}/_ext/1550770622/replydata.o ${OBJECTDIR}/_ext/1550770622/server.o ${OBJECTDIR}/_ext/1550770622/serverevents.o ${OBJECTDIR}/_ext/1550770622/variant.o ${OBJECTDIR}/_ext/1360937237/app_console.o ${OBJECTDIR}/_ext/1360937237/app_metrology.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/app_display.o ${OBJECTDIR}/_ext/1360937237/app_datalog.o ${OBJECTDIR}/_ext/1360937237/app_energy.o ${OBJECTDIR}/_ext/1360937237/app_events.o ${OBJECTDIR}/_ext/1360937237/app_control.o ${OBJECTDIR}/_ext/1360937237/app_dlms.o ${OBJECTDIR}/_ext/1360937237/app_lte.o ${OBJECTDIR}/_ext/1360937237/app_plc.o ${OBJECTDIR}/_ext/1360937237/app_gurux_dlms_process.o ${OBJECTDIR}/_ext/1360937237/app_gurux_meter_value_interface.o ${OBJECTDIR}/_ext/1360937237/app_gurux_process_ee_dummy.o ${OBJECTDIR}/_ext/1360937237/app_gurux_process_time.o ${OBJECTDIR}/_ext/1360937237/app_gurux_uart_handdle.o ${OBJECTDIR}/_ext/1360937237/app_pulse.o ${OBJECTDIR}/_ext/1360937237/app_optouart.o ${OBJECTDIR}/_ext/1360937237/app_pwr_offset.o ${OBJECTDIR}/_ext/1360937237/app_multi_cal.o

# Source Files
SOURCEFILES=../src/config/pic32cxmtsh_db/driver/memory/src/drv_memory.c ../src/config/pic32cxmtsh_db/driver/memory/src/drv_memory_file_system.c ../src/config/pic32cxmtsh_db/driver/metrology/bin/met_bin.S ../src/config/pic32cxmtsh_db/driver/metrology/drv_metrology.c ../src/config/pic32cxmtsh_db/driver/sst26/src/drv_sst26.c ../src/config/pic32cxmtsh_db/gfx/driver/controller/slcdc/cl010_slcdc.c ../src/config/pic32cxmtsh_db/gfx/driver/controller/slcdc/drv_gfx_slcdc.c ../src/config/pic32cxmtsh_db/peripheral/clk/plib_clk.c ../src/config/pic32cxmtsh_db/peripheral/cmcc/plib_cmcc.c ../src/config/pic32cxmtsh_db/peripheral/dwdt/plib_dwdt.c ../src/config/pic32cxmtsh_db/peripheral/flexcom/usart/plib_flexcom0_usart.c ../src/config/pic32cxmtsh_db/peripheral/flexcom/usart/plib_flexcom6_usart.c ../src/config/pic32cxmtsh_db/peripheral/flexcom/usart/plib_flexcom3_usart.c ../src/config/pic32cxmtsh_db/peripheral/icm/plib_icm.c ../src/config/pic32cxmtsh_db/peripheral/nvic/plib_nvic.c ../src/config/pic32cxmtsh_db/peripheral/pio/plib_pio.c ../src/config/pic32cxmtsh_db/peripheral/qspi/plib_qspi.c ../src/config/pic32cxmtsh_db/peripheral/rstc/plib_rstc.c ../src/config/pic32cxmtsh_db/peripheral/rtc/plib_rtc.c ../src/config/pic32cxmtsh_db/peripheral/sefc/plib_sefc1.c ../src/config/pic32cxmtsh_db/peripheral/sefc/plib_sefc0.c ../src/config/pic32cxmtsh_db/peripheral/sefc/plib_sefc_common.c ../src/config/pic32cxmtsh_db/peripheral/supc/plib_supc.c ../src/config/pic32cxmtsh_db/peripheral/systick/plib_systick.c ../src/config/pic32cxmtsh_db/peripheral/tc/plib_tc0.c ../src/config/pic32cxmtsh_db/peripheral/uart/plib_uart.c ../src/config/pic32cxmtsh_db/stdio/xc32_monitor.c ../src/config/pic32cxmtsh_db/system/cache/sys_cache.c ../src/config/pic32cxmtsh_db/system/command/src/sys_command.c ../src/config/pic32cxmtsh_db/system/console/src/sys_console.c ../src/config/pic32cxmtsh_db/system/console/src/sys_console_uart.c ../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system/ff.c ../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system/ffunicode.c ../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access/diskio.c ../src/config/pic32cxmtsh_db/system/fs/src/sys_fs.c ../src/config/pic32cxmtsh_db/system/fs/src/sys_fs_media_manager.c ../src/config/pic32cxmtsh_db/system/fs/src/sys_fs_fat_interface.c ../src/config/pic32cxmtsh_db/system/int/src/sys_int.c ../src/config/pic32cxmtsh_db/system/reset/sys_reset.c ../src/config/pic32cxmtsh_db/system/time/src/sys_time.c ../src/config/pic32cxmtsh_db/libc_syscalls.c ../src/config/pic32cxmtsh_db/startup_xc32.c ../src/config/pic32cxmtsh_db/exceptions.c ../src/config/pic32cxmtsh_db/interrupts.c ../src/config/pic32cxmtsh_db/tasks.c ../src/config/pic32cxmtsh_db/initialization.c ../src/gurux/src/apdu.c ../src/gurux/src/bitarray.c ../src/gurux/src/bytebuffer.c ../src/gurux/src/ciphering.c ../src/gurux/src/client.c ../src/gurux/src/converters.c ../src/gurux/src/cosem.c ../src/gurux/src/datainfo.c ../src/gurux/src/date.c ../src/gurux/src/dlms.c ../src/gurux/src/dlmsSettings.c ../src/gurux/src/gxaes.c ../src/gurux/src/gxarray.c ../src/gurux/src/gxget.c ../src/gurux/src/gxinvoke.c ../src/gurux/src/gxkey.c ../src/gurux/src/gxmd5.c ../src/gurux/src/gxobjects.c ../src/gurux/src/gxserializer.c ../src/gurux/src/gxset.c ../src/gurux/src/gxsetignoremalloc.c ../src/gurux/src/gxsetmalloc.c ../src/gurux/src/gxsha1.c ../src/gurux/src/gxsha256.c ../src/gurux/src/gxvalueeventargs.c ../src/gurux/src/helpers.c ../src/gurux/src/message.c ../src/gurux/src/notify.c ../src/gurux/src/objectarray.c ../src/gurux/src/parameters.c ../src/gurux/src/replydata.c ../src/gurux/src/server.c ../src/gurux/src/serverevents.c ../src/gurux/src/variant.c ../src/app_console.c ../src/app_metrology.c ../src/main.c ../src/app_display.c ../src/app_datalog.c ../src/app_energy.c ../src/app_events.c ../src/app_control.c ../src/app_dlms.c ../src/app_lte.c ../src/app_plc.c ../src/app_gurux_dlms_process.c ../src/app_gurux_meter_value_interface.c ../src/app_gurux_process_ee_dummy.c ../src/app_gurux_process_time.c ../src/app_gurux_uart_handdle.c ../src/app_pulse.c ../src/app_optouart.c ../src/app_pwr_offset.c ../src/app_multi_cal.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-pic32cxmtsh_db.mk ${DISTDIR}/20251120a_MTSH_552_DLMS_FLEX0_DBG_FLEX3_Opti.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32CX2051MTSH128
MP_LINKER_FILE_OPTION=,--script="..\src\config\pic32cxmtsh_db\PIC32CX2051MTSH128.ld"
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/396652648/met_bin.o: ../src/config/pic32cxmtsh_db/driver/metrology/bin/met_bin.S  .generated_files/flags/pic32cxmtsh_db/e7505ed6778a67e3bd2b1a8c036661de0cf5c1bd .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/396652648" 
	@${RM} ${OBJECTDIR}/_ext/396652648/met_bin.o.d 
	@${RM} ${OBJECTDIR}/_ext/396652648/met_bin.o 
	@${RM} ${OBJECTDIR}/_ext/396652648/met_bin.o.ok ${OBJECTDIR}/_ext/396652648/met_bin.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/396652648/met_bin.o.d"  -o ${OBJECTDIR}/_ext/396652648/met_bin.o ../src/config/pic32cxmtsh_db/driver/metrology/bin/met_bin.S  -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/_ext/396652648/met_bin.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,-I"../src/config/pic32cxmtsh_db/driver/metrology/bin" -mdfp="${DFP_DIR}/PIC32CX-MTSH"
	@${FIXDEPS} "${OBJECTDIR}/_ext/396652648/met_bin.o.d" "${OBJECTDIR}/_ext/396652648/met_bin.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/_ext/396652648/met_bin.o: ../src/config/pic32cxmtsh_db/driver/metrology/bin/met_bin.S  .generated_files/flags/pic32cxmtsh_db/f63dafa548d7685b2850d3582a1d686c171c9605 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/396652648" 
	@${RM} ${OBJECTDIR}/_ext/396652648/met_bin.o.d 
	@${RM} ${OBJECTDIR}/_ext/396652648/met_bin.o 
	@${RM} ${OBJECTDIR}/_ext/396652648/met_bin.o.ok ${OBJECTDIR}/_ext/396652648/met_bin.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/396652648/met_bin.o.d"  -o ${OBJECTDIR}/_ext/396652648/met_bin.o ../src/config/pic32cxmtsh_db/driver/metrology/bin/met_bin.S  -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/_ext/396652648/met_bin.o.asm.d",--gdwarf-2,-I"../src/config/pic32cxmtsh_db/driver/metrology/bin" -mdfp="${DFP_DIR}/PIC32CX-MTSH"
	@${FIXDEPS} "${OBJECTDIR}/_ext/396652648/met_bin.o.d" "${OBJECTDIR}/_ext/396652648/met_bin.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/2059779260/drv_memory.o: ../src/config/pic32cxmtsh_db/driver/memory/src/drv_memory.c  .generated_files/flags/pic32cxmtsh_db/320b29c68e3d66919e5881b800b167ead9b7235b .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2059779260" 
	@${RM} ${OBJECTDIR}/_ext/2059779260/drv_memory.o.d 
	@${RM} ${OBJECTDIR}/_ext/2059779260/drv_memory.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2059779260/drv_memory.o.d" -o ${OBJECTDIR}/_ext/2059779260/drv_memory.o ../src/config/pic32cxmtsh_db/driver/memory/src/drv_memory.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/2059779260/drv_memory_file_system.o: ../src/config/pic32cxmtsh_db/driver/memory/src/drv_memory_file_system.c  .generated_files/flags/pic32cxmtsh_db/7d4cb153ff59c3a1fcb027e0bfa449159552ee46 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2059779260" 
	@${RM} ${OBJECTDIR}/_ext/2059779260/drv_memory_file_system.o.d 
	@${RM} ${OBJECTDIR}/_ext/2059779260/drv_memory_file_system.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2059779260/drv_memory_file_system.o.d" -o ${OBJECTDIR}/_ext/2059779260/drv_memory_file_system.o ../src/config/pic32cxmtsh_db/driver/memory/src/drv_memory_file_system.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/271336736/drv_metrology.o: ../src/config/pic32cxmtsh_db/driver/metrology/drv_metrology.c  .generated_files/flags/pic32cxmtsh_db/437b72c805c6e651723a33a1385dd3d39f366451 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/271336736" 
	@${RM} ${OBJECTDIR}/_ext/271336736/drv_metrology.o.d 
	@${RM} ${OBJECTDIR}/_ext/271336736/drv_metrology.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/271336736/drv_metrology.o.d" -o ${OBJECTDIR}/_ext/271336736/drv_metrology.o ../src/config/pic32cxmtsh_db/driver/metrology/drv_metrology.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/945666689/drv_sst26.o: ../src/config/pic32cxmtsh_db/driver/sst26/src/drv_sst26.c  .generated_files/flags/pic32cxmtsh_db/8b17b9fdc4fc53124de03cf55fd94c9723b9cb1d .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/945666689" 
	@${RM} ${OBJECTDIR}/_ext/945666689/drv_sst26.o.d 
	@${RM} ${OBJECTDIR}/_ext/945666689/drv_sst26.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/945666689/drv_sst26.o.d" -o ${OBJECTDIR}/_ext/945666689/drv_sst26.o ../src/config/pic32cxmtsh_db/driver/sst26/src/drv_sst26.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1066932174/cl010_slcdc.o: ../src/config/pic32cxmtsh_db/gfx/driver/controller/slcdc/cl010_slcdc.c  .generated_files/flags/pic32cxmtsh_db/3c11cd747b142f25f5c0c86a4199000d621ff4a1 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1066932174" 
	@${RM} ${OBJECTDIR}/_ext/1066932174/cl010_slcdc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1066932174/cl010_slcdc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1066932174/cl010_slcdc.o.d" -o ${OBJECTDIR}/_ext/1066932174/cl010_slcdc.o ../src/config/pic32cxmtsh_db/gfx/driver/controller/slcdc/cl010_slcdc.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1066932174/drv_gfx_slcdc.o: ../src/config/pic32cxmtsh_db/gfx/driver/controller/slcdc/drv_gfx_slcdc.c  .generated_files/flags/pic32cxmtsh_db/27d9b64e223851cc4dda4f1c9e10ba9d47084a6a .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1066932174" 
	@${RM} ${OBJECTDIR}/_ext/1066932174/drv_gfx_slcdc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1066932174/drv_gfx_slcdc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1066932174/drv_gfx_slcdc.o.d" -o ${OBJECTDIR}/_ext/1066932174/drv_gfx_slcdc.o ../src/config/pic32cxmtsh_db/gfx/driver/controller/slcdc/drv_gfx_slcdc.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1559253944/plib_clk.o: ../src/config/pic32cxmtsh_db/peripheral/clk/plib_clk.c  .generated_files/flags/pic32cxmtsh_db/899571044edff85c21d8ca507423065cbb74cdc2 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1559253944" 
	@${RM} ${OBJECTDIR}/_ext/1559253944/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/1559253944/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1559253944/plib_clk.o.d" -o ${OBJECTDIR}/_ext/1559253944/plib_clk.o ../src/config/pic32cxmtsh_db/peripheral/clk/plib_clk.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1092231196/plib_cmcc.o: ../src/config/pic32cxmtsh_db/peripheral/cmcc/plib_cmcc.c  .generated_files/flags/pic32cxmtsh_db/1801a558bc4c668c0586e4baed44fac6a998ed98 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1092231196" 
	@${RM} ${OBJECTDIR}/_ext/1092231196/plib_cmcc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1092231196/plib_cmcc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1092231196/plib_cmcc.o.d" -o ${OBJECTDIR}/_ext/1092231196/plib_cmcc.o ../src/config/pic32cxmtsh_db/peripheral/cmcc/plib_cmcc.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1092191747/plib_dwdt.o: ../src/config/pic32cxmtsh_db/peripheral/dwdt/plib_dwdt.c  .generated_files/flags/pic32cxmtsh_db/c84d2cd2222e0534538c4b5d1178da24122a6f18 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1092191747" 
	@${RM} ${OBJECTDIR}/_ext/1092191747/plib_dwdt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1092191747/plib_dwdt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1092191747/plib_dwdt.o.d" -o ${OBJECTDIR}/_ext/1092191747/plib_dwdt.o ../src/config/pic32cxmtsh_db/peripheral/dwdt/plib_dwdt.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/212878140/plib_flexcom0_usart.o: ../src/config/pic32cxmtsh_db/peripheral/flexcom/usart/plib_flexcom0_usart.c  .generated_files/flags/pic32cxmtsh_db/aa4545aed16a65ed24eda429c44f12b344dcbc7a .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/212878140" 
	@${RM} ${OBJECTDIR}/_ext/212878140/plib_flexcom0_usart.o.d 
	@${RM} ${OBJECTDIR}/_ext/212878140/plib_flexcom0_usart.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/212878140/plib_flexcom0_usart.o.d" -o ${OBJECTDIR}/_ext/212878140/plib_flexcom0_usart.o ../src/config/pic32cxmtsh_db/peripheral/flexcom/usart/plib_flexcom0_usart.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/212878140/plib_flexcom6_usart.o: ../src/config/pic32cxmtsh_db/peripheral/flexcom/usart/plib_flexcom6_usart.c  .generated_files/flags/pic32cxmtsh_db/74a33bd7608c0a83d22426003c4ca7cc4a68b6a6 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/212878140" 
	@${RM} ${OBJECTDIR}/_ext/212878140/plib_flexcom6_usart.o.d 
	@${RM} ${OBJECTDIR}/_ext/212878140/plib_flexcom6_usart.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/212878140/plib_flexcom6_usart.o.d" -o ${OBJECTDIR}/_ext/212878140/plib_flexcom6_usart.o ../src/config/pic32cxmtsh_db/peripheral/flexcom/usart/plib_flexcom6_usart.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/212878140/plib_flexcom3_usart.o: ../src/config/pic32cxmtsh_db/peripheral/flexcom/usart/plib_flexcom3_usart.c  .generated_files/flags/pic32cxmtsh_db/bed402299c57ab88a27b272045d730309ff1a41 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/212878140" 
	@${RM} ${OBJECTDIR}/_ext/212878140/plib_flexcom3_usart.o.d 
	@${RM} ${OBJECTDIR}/_ext/212878140/plib_flexcom3_usart.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/212878140/plib_flexcom3_usart.o.d" -o ${OBJECTDIR}/_ext/212878140/plib_flexcom3_usart.o ../src/config/pic32cxmtsh_db/peripheral/flexcom/usart/plib_flexcom3_usart.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1559248455/plib_icm.o: ../src/config/pic32cxmtsh_db/peripheral/icm/plib_icm.c  .generated_files/flags/pic32cxmtsh_db/18ad6e71cae78c6094a4641dccab26ab0450d06a .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1559248455" 
	@${RM} ${OBJECTDIR}/_ext/1559248455/plib_icm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1559248455/plib_icm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1559248455/plib_icm.o.d" -o ${OBJECTDIR}/_ext/1559248455/plib_icm.o ../src/config/pic32cxmtsh_db/peripheral/icm/plib_icm.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1091894660/plib_nvic.o: ../src/config/pic32cxmtsh_db/peripheral/nvic/plib_nvic.c  .generated_files/flags/pic32cxmtsh_db/ca8b2d7b5f4df1f59b5737075e216524743e093c .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1091894660" 
	@${RM} ${OBJECTDIR}/_ext/1091894660/plib_nvic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1091894660/plib_nvic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1091894660/plib_nvic.o.d" -o ${OBJECTDIR}/_ext/1091894660/plib_nvic.o ../src/config/pic32cxmtsh_db/peripheral/nvic/plib_nvic.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1559241540/plib_pio.o: ../src/config/pic32cxmtsh_db/peripheral/pio/plib_pio.c  .generated_files/flags/pic32cxmtsh_db/ee41ba6bfd358bb7e3e25d619d33d895786ddb6a .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1559241540" 
	@${RM} ${OBJECTDIR}/_ext/1559241540/plib_pio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1559241540/plib_pio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1559241540/plib_pio.o.d" -o ${OBJECTDIR}/_ext/1559241540/plib_pio.o ../src/config/pic32cxmtsh_db/peripheral/pio/plib_pio.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1091807947/plib_qspi.o: ../src/config/pic32cxmtsh_db/peripheral/qspi/plib_qspi.c  .generated_files/flags/pic32cxmtsh_db/b4552824951af5e3c7b5012ff00b349cf9a86968 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1091807947" 
	@${RM} ${OBJECTDIR}/_ext/1091807947/plib_qspi.o.d 
	@${RM} ${OBJECTDIR}/_ext/1091807947/plib_qspi.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1091807947/plib_qspi.o.d" -o ${OBJECTDIR}/_ext/1091807947/plib_qspi.o ../src/config/pic32cxmtsh_db/peripheral/qspi/plib_qspi.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1091778038/plib_rstc.o: ../src/config/pic32cxmtsh_db/peripheral/rstc/plib_rstc.c  .generated_files/flags/pic32cxmtsh_db/499ba996b20533d724f63e5c528ecae604b752f5 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1091778038" 
	@${RM} ${OBJECTDIR}/_ext/1091778038/plib_rstc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1091778038/plib_rstc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1091778038/plib_rstc.o.d" -o ${OBJECTDIR}/_ext/1091778038/plib_rstc.o ../src/config/pic32cxmtsh_db/peripheral/rstc/plib_rstc.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1559239289/plib_rtc.o: ../src/config/pic32cxmtsh_db/peripheral/rtc/plib_rtc.c  .generated_files/flags/pic32cxmtsh_db/f8ed4991f2dc175437e739ab78dec2b56e124bb1 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1559239289" 
	@${RM} ${OBJECTDIR}/_ext/1559239289/plib_rtc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1559239289/plib_rtc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1559239289/plib_rtc.o.d" -o ${OBJECTDIR}/_ext/1559239289/plib_rtc.o ../src/config/pic32cxmtsh_db/peripheral/rtc/plib_rtc.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1091762135/plib_sefc1.o: ../src/config/pic32cxmtsh_db/peripheral/sefc/plib_sefc1.c  .generated_files/flags/pic32cxmtsh_db/dc9cda8265535c1049a1048d182a68b05f09cb4d .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1091762135" 
	@${RM} ${OBJECTDIR}/_ext/1091762135/plib_sefc1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1091762135/plib_sefc1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1091762135/plib_sefc1.o.d" -o ${OBJECTDIR}/_ext/1091762135/plib_sefc1.o ../src/config/pic32cxmtsh_db/peripheral/sefc/plib_sefc1.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1091762135/plib_sefc0.o: ../src/config/pic32cxmtsh_db/peripheral/sefc/plib_sefc0.c  .generated_files/flags/pic32cxmtsh_db/b79788a74aa9c136e2881ba783b0b68c12107771 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1091762135" 
	@${RM} ${OBJECTDIR}/_ext/1091762135/plib_sefc0.o.d 
	@${RM} ${OBJECTDIR}/_ext/1091762135/plib_sefc0.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1091762135/plib_sefc0.o.d" -o ${OBJECTDIR}/_ext/1091762135/plib_sefc0.o ../src/config/pic32cxmtsh_db/peripheral/sefc/plib_sefc0.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1091762135/plib_sefc_common.o: ../src/config/pic32cxmtsh_db/peripheral/sefc/plib_sefc_common.c  .generated_files/flags/pic32cxmtsh_db/eee6dbf5356c49dd4713f74905c155eebba96567 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1091762135" 
	@${RM} ${OBJECTDIR}/_ext/1091762135/plib_sefc_common.o.d 
	@${RM} ${OBJECTDIR}/_ext/1091762135/plib_sefc_common.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1091762135/plib_sefc_common.o.d" -o ${OBJECTDIR}/_ext/1091762135/plib_sefc_common.o ../src/config/pic32cxmtsh_db/peripheral/sefc/plib_sefc_common.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1091746449/plib_supc.o: ../src/config/pic32cxmtsh_db/peripheral/supc/plib_supc.c  .generated_files/flags/pic32cxmtsh_db/b7c98bcd1f59b3fee392b72b401959e35fe829cb .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1091746449" 
	@${RM} ${OBJECTDIR}/_ext/1091746449/plib_supc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1091746449/plib_supc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1091746449/plib_supc.o.d" -o ${OBJECTDIR}/_ext/1091746449/plib_supc.o ../src/config/pic32cxmtsh_db/peripheral/supc/plib_supc.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1686768144/plib_systick.o: ../src/config/pic32cxmtsh_db/peripheral/systick/plib_systick.c  .generated_files/flags/pic32cxmtsh_db/a39bcd84511e0642f23eb138f50f8321e0714bf9 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686768144" 
	@${RM} ${OBJECTDIR}/_ext/1686768144/plib_systick.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686768144/plib_systick.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1686768144/plib_systick.o.d" -o ${OBJECTDIR}/_ext/1686768144/plib_systick.o ../src/config/pic32cxmtsh_db/peripheral/systick/plib_systick.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/780985993/plib_tc0.o: ../src/config/pic32cxmtsh_db/peripheral/tc/plib_tc0.c  .generated_files/flags/pic32cxmtsh_db/57aa82f448156af7963ecb91941a620e4a801955 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/780985993" 
	@${RM} ${OBJECTDIR}/_ext/780985993/plib_tc0.o.d 
	@${RM} ${OBJECTDIR}/_ext/780985993/plib_tc0.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/780985993/plib_tc0.o.d" -o ${OBJECTDIR}/_ext/780985993/plib_tc0.o ../src/config/pic32cxmtsh_db/peripheral/tc/plib_tc0.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1091706008/plib_uart.o: ../src/config/pic32cxmtsh_db/peripheral/uart/plib_uart.c  .generated_files/flags/pic32cxmtsh_db/32b7a94d8e868409fef3063afae75f2461f6a0a8 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1091706008" 
	@${RM} ${OBJECTDIR}/_ext/1091706008/plib_uart.o.d 
	@${RM} ${OBJECTDIR}/_ext/1091706008/plib_uart.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1091706008/plib_uart.o.d" -o ${OBJECTDIR}/_ext/1091706008/plib_uart.o ../src/config/pic32cxmtsh_db/peripheral/uart/plib_uart.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1469502512/xc32_monitor.o: ../src/config/pic32cxmtsh_db/stdio/xc32_monitor.c  .generated_files/flags/pic32cxmtsh_db/22cbe6e592544325efe657ec6b5b6076e8f7c83f .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1469502512" 
	@${RM} ${OBJECTDIR}/_ext/1469502512/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/1469502512/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1469502512/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/1469502512/xc32_monitor.o ../src/config/pic32cxmtsh_db/stdio/xc32_monitor.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1808853019/sys_cache.o: ../src/config/pic32cxmtsh_db/system/cache/sys_cache.c  .generated_files/flags/pic32cxmtsh_db/29e3fc25be943e48409d544442f46760338358fa .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1808853019" 
	@${RM} ${OBJECTDIR}/_ext/1808853019/sys_cache.o.d 
	@${RM} ${OBJECTDIR}/_ext/1808853019/sys_cache.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1808853019/sys_cache.o.d" -o ${OBJECTDIR}/_ext/1808853019/sys_cache.o ../src/config/pic32cxmtsh_db/system/cache/sys_cache.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1516896519/sys_command.o: ../src/config/pic32cxmtsh_db/system/command/src/sys_command.c  .generated_files/flags/pic32cxmtsh_db/2ed62c93fb69f09c8b8dc7ba7b05cc1a8be2ab50 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1516896519" 
	@${RM} ${OBJECTDIR}/_ext/1516896519/sys_command.o.d 
	@${RM} ${OBJECTDIR}/_ext/1516896519/sys_command.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1516896519/sys_command.o.d" -o ${OBJECTDIR}/_ext/1516896519/sys_command.o ../src/config/pic32cxmtsh_db/system/command/src/sys_command.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1973608699/sys_console.o: ../src/config/pic32cxmtsh_db/system/console/src/sys_console.c  .generated_files/flags/pic32cxmtsh_db/2525a3a1ed1aa02582786f5874a64fb279bbfd1a .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1973608699" 
	@${RM} ${OBJECTDIR}/_ext/1973608699/sys_console.o.d 
	@${RM} ${OBJECTDIR}/_ext/1973608699/sys_console.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1973608699/sys_console.o.d" -o ${OBJECTDIR}/_ext/1973608699/sys_console.o ../src/config/pic32cxmtsh_db/system/console/src/sys_console.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1973608699/sys_console_uart.o: ../src/config/pic32cxmtsh_db/system/console/src/sys_console_uart.c  .generated_files/flags/pic32cxmtsh_db/80323f6d5b26ecd3266a094cf1ec760390f8d6fd .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1973608699" 
	@${RM} ${OBJECTDIR}/_ext/1973608699/sys_console_uart.o.d 
	@${RM} ${OBJECTDIR}/_ext/1973608699/sys_console_uart.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1973608699/sys_console_uart.o.d" -o ${OBJECTDIR}/_ext/1973608699/sys_console_uart.o ../src/config/pic32cxmtsh_db/system/console/src/sys_console_uart.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1316136687/ff.o: ../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system/ff.c  .generated_files/flags/pic32cxmtsh_db/ea63e0917141c56c1b6ad952a934485cdf0ed68b .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1316136687" 
	@${RM} ${OBJECTDIR}/_ext/1316136687/ff.o.d 
	@${RM} ${OBJECTDIR}/_ext/1316136687/ff.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1316136687/ff.o.d" -o ${OBJECTDIR}/_ext/1316136687/ff.o ../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system/ff.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1316136687/ffunicode.o: ../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system/ffunicode.c  .generated_files/flags/pic32cxmtsh_db/4e7fcd2c2fe10299ee0eb21753ffcee66fe048cb .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1316136687" 
	@${RM} ${OBJECTDIR}/_ext/1316136687/ffunicode.o.d 
	@${RM} ${OBJECTDIR}/_ext/1316136687/ffunicode.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1316136687/ffunicode.o.d" -o ${OBJECTDIR}/_ext/1316136687/ffunicode.o ../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system/ffunicode.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/330030374/diskio.o: ../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access/diskio.c  .generated_files/flags/pic32cxmtsh_db/73ce7724ef6f41970e309f3adf3a398c649ff474 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/330030374" 
	@${RM} ${OBJECTDIR}/_ext/330030374/diskio.o.d 
	@${RM} ${OBJECTDIR}/_ext/330030374/diskio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/330030374/diskio.o.d" -o ${OBJECTDIR}/_ext/330030374/diskio.o ../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access/diskio.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/340841513/sys_fs.o: ../src/config/pic32cxmtsh_db/system/fs/src/sys_fs.c  .generated_files/flags/pic32cxmtsh_db/f0291b5d92db5d1e3ec79feeff65c306079dd67e .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/340841513" 
	@${RM} ${OBJECTDIR}/_ext/340841513/sys_fs.o.d 
	@${RM} ${OBJECTDIR}/_ext/340841513/sys_fs.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/340841513/sys_fs.o.d" -o ${OBJECTDIR}/_ext/340841513/sys_fs.o ../src/config/pic32cxmtsh_db/system/fs/src/sys_fs.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/340841513/sys_fs_media_manager.o: ../src/config/pic32cxmtsh_db/system/fs/src/sys_fs_media_manager.c  .generated_files/flags/pic32cxmtsh_db/29fa8487f2a3ef381cb47175296d66c3922c1082 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/340841513" 
	@${RM} ${OBJECTDIR}/_ext/340841513/sys_fs_media_manager.o.d 
	@${RM} ${OBJECTDIR}/_ext/340841513/sys_fs_media_manager.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/340841513/sys_fs_media_manager.o.d" -o ${OBJECTDIR}/_ext/340841513/sys_fs_media_manager.o ../src/config/pic32cxmtsh_db/system/fs/src/sys_fs_media_manager.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/340841513/sys_fs_fat_interface.o: ../src/config/pic32cxmtsh_db/system/fs/src/sys_fs_fat_interface.c  .generated_files/flags/pic32cxmtsh_db/129d0a376887e39037bd3e666285bb39c2d026e6 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/340841513" 
	@${RM} ${OBJECTDIR}/_ext/340841513/sys_fs_fat_interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/340841513/sys_fs_fat_interface.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/340841513/sys_fs_fat_interface.o.d" -o ${OBJECTDIR}/_ext/340841513/sys_fs_fat_interface.o ../src/config/pic32cxmtsh_db/system/fs/src/sys_fs_fat_interface.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/262248989/sys_int.o: ../src/config/pic32cxmtsh_db/system/int/src/sys_int.c  .generated_files/flags/pic32cxmtsh_db/de997df2483e182856406635bfa3c476f59412ad .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/262248989" 
	@${RM} ${OBJECTDIR}/_ext/262248989/sys_int.o.d 
	@${RM} ${OBJECTDIR}/_ext/262248989/sys_int.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/262248989/sys_int.o.d" -o ${OBJECTDIR}/_ext/262248989/sys_int.o ../src/config/pic32cxmtsh_db/system/int/src/sys_int.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1822840296/sys_reset.o: ../src/config/pic32cxmtsh_db/system/reset/sys_reset.c  .generated_files/flags/pic32cxmtsh_db/a4d1edc8f4f0a4275a35eded7aaeca898ba8604a .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1822840296" 
	@${RM} ${OBJECTDIR}/_ext/1822840296/sys_reset.o.d 
	@${RM} ${OBJECTDIR}/_ext/1822840296/sys_reset.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1822840296/sys_reset.o.d" -o ${OBJECTDIR}/_ext/1822840296/sys_reset.o ../src/config/pic32cxmtsh_db/system/reset/sys_reset.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1235719273/sys_time.o: ../src/config/pic32cxmtsh_db/system/time/src/sys_time.c  .generated_files/flags/pic32cxmtsh_db/e8a9463254aa616cc44a163ded5ab457ae1c5762 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1235719273" 
	@${RM} ${OBJECTDIR}/_ext/1235719273/sys_time.o.d 
	@${RM} ${OBJECTDIR}/_ext/1235719273/sys_time.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1235719273/sys_time.o.d" -o ${OBJECTDIR}/_ext/1235719273/sys_time.o ../src/config/pic32cxmtsh_db/system/time/src/sys_time.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1772662538/libc_syscalls.o: ../src/config/pic32cxmtsh_db/libc_syscalls.c  .generated_files/flags/pic32cxmtsh_db/867fd74ccf16fccbf4450507132522f4da86af38 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1772662538" 
	@${RM} ${OBJECTDIR}/_ext/1772662538/libc_syscalls.o.d 
	@${RM} ${OBJECTDIR}/_ext/1772662538/libc_syscalls.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1772662538/libc_syscalls.o.d" -o ${OBJECTDIR}/_ext/1772662538/libc_syscalls.o ../src/config/pic32cxmtsh_db/libc_syscalls.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1772662538/startup_xc32.o: ../src/config/pic32cxmtsh_db/startup_xc32.c  .generated_files/flags/pic32cxmtsh_db/39b4edd7704042e985eb132c494dd0209c6fb1f8 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1772662538" 
	@${RM} ${OBJECTDIR}/_ext/1772662538/startup_xc32.o.d 
	@${RM} ${OBJECTDIR}/_ext/1772662538/startup_xc32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1772662538/startup_xc32.o.d" -o ${OBJECTDIR}/_ext/1772662538/startup_xc32.o ../src/config/pic32cxmtsh_db/startup_xc32.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1772662538/exceptions.o: ../src/config/pic32cxmtsh_db/exceptions.c  .generated_files/flags/pic32cxmtsh_db/d44a34c98c8b3a362e338866dc4edf39326f6a8f .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1772662538" 
	@${RM} ${OBJECTDIR}/_ext/1772662538/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1772662538/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1772662538/exceptions.o.d" -o ${OBJECTDIR}/_ext/1772662538/exceptions.o ../src/config/pic32cxmtsh_db/exceptions.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1772662538/interrupts.o: ../src/config/pic32cxmtsh_db/interrupts.c  .generated_files/flags/pic32cxmtsh_db/bde736ba2b8a840897cd7964e5c1da97ffb6a762 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1772662538" 
	@${RM} ${OBJECTDIR}/_ext/1772662538/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1772662538/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1772662538/interrupts.o.d" -o ${OBJECTDIR}/_ext/1772662538/interrupts.o ../src/config/pic32cxmtsh_db/interrupts.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1772662538/tasks.o: ../src/config/pic32cxmtsh_db/tasks.c  .generated_files/flags/pic32cxmtsh_db/842cd09621e81ab1bc23f260d80a5b1437ca57a5 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1772662538" 
	@${RM} ${OBJECTDIR}/_ext/1772662538/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1772662538/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1772662538/tasks.o.d" -o ${OBJECTDIR}/_ext/1772662538/tasks.o ../src/config/pic32cxmtsh_db/tasks.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1772662538/initialization.o: ../src/config/pic32cxmtsh_db/initialization.c  .generated_files/flags/pic32cxmtsh_db/4c01f40947a04fd6b10e8e375c39fefd2438fab5 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1772662538" 
	@${RM} ${OBJECTDIR}/_ext/1772662538/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/1772662538/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1772662538/initialization.o.d" -o ${OBJECTDIR}/_ext/1772662538/initialization.o ../src/config/pic32cxmtsh_db/initialization.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/apdu.o: ../src/gurux/src/apdu.c  .generated_files/flags/pic32cxmtsh_db/55a0ae13528529503b5c7fe4c7b1008a344d753a .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/apdu.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/apdu.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/apdu.o.d" -o ${OBJECTDIR}/_ext/1550770622/apdu.o ../src/gurux/src/apdu.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/bitarray.o: ../src/gurux/src/bitarray.c  .generated_files/flags/pic32cxmtsh_db/15c0871e4e5e864dd6651624ea58e897472f662 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/bitarray.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/bitarray.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/bitarray.o.d" -o ${OBJECTDIR}/_ext/1550770622/bitarray.o ../src/gurux/src/bitarray.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/bytebuffer.o: ../src/gurux/src/bytebuffer.c  .generated_files/flags/pic32cxmtsh_db/c163599b120ba3454a04bcfd4c42e8b4f97e42d7 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/bytebuffer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/bytebuffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/bytebuffer.o.d" -o ${OBJECTDIR}/_ext/1550770622/bytebuffer.o ../src/gurux/src/bytebuffer.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/ciphering.o: ../src/gurux/src/ciphering.c  .generated_files/flags/pic32cxmtsh_db/b76592351674f23a3877ebe767b34823486d7752 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/ciphering.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/ciphering.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/ciphering.o.d" -o ${OBJECTDIR}/_ext/1550770622/ciphering.o ../src/gurux/src/ciphering.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/client.o: ../src/gurux/src/client.c  .generated_files/flags/pic32cxmtsh_db/be9cca96dc78472f2207993e7d9c1594aee67eaa .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/client.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/client.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/client.o.d" -o ${OBJECTDIR}/_ext/1550770622/client.o ../src/gurux/src/client.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/converters.o: ../src/gurux/src/converters.c  .generated_files/flags/pic32cxmtsh_db/70bee1cb9f1d212e98156f6db092c435ae7bc9a1 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/converters.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/converters.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/converters.o.d" -o ${OBJECTDIR}/_ext/1550770622/converters.o ../src/gurux/src/converters.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/cosem.o: ../src/gurux/src/cosem.c  .generated_files/flags/pic32cxmtsh_db/4b55309b841399556c1109ee60adabb427bd4a11 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/cosem.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/cosem.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/cosem.o.d" -o ${OBJECTDIR}/_ext/1550770622/cosem.o ../src/gurux/src/cosem.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/datainfo.o: ../src/gurux/src/datainfo.c  .generated_files/flags/pic32cxmtsh_db/16b148b490dd4ab42d0833ab9ec05bd28c6e65fd .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/datainfo.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/datainfo.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/datainfo.o.d" -o ${OBJECTDIR}/_ext/1550770622/datainfo.o ../src/gurux/src/datainfo.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/date.o: ../src/gurux/src/date.c  .generated_files/flags/pic32cxmtsh_db/58ba7072ffc5a0918395bf71e37907c200f6cfa2 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/date.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/date.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/date.o.d" -o ${OBJECTDIR}/_ext/1550770622/date.o ../src/gurux/src/date.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/dlms.o: ../src/gurux/src/dlms.c  .generated_files/flags/pic32cxmtsh_db/a40333b8717ba87e87aadd250a86168d46a1927c .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/dlms.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/dlms.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/dlms.o.d" -o ${OBJECTDIR}/_ext/1550770622/dlms.o ../src/gurux/src/dlms.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/dlmsSettings.o: ../src/gurux/src/dlmsSettings.c  .generated_files/flags/pic32cxmtsh_db/d602e0bb0b074db99eb88196086be733f3220d3e .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/dlmsSettings.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/dlmsSettings.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/dlmsSettings.o.d" -o ${OBJECTDIR}/_ext/1550770622/dlmsSettings.o ../src/gurux/src/dlmsSettings.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/gxaes.o: ../src/gurux/src/gxaes.c  .generated_files/flags/pic32cxmtsh_db/722f810aaa702f9f0b60e61e7264c3b4117a48dd .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/gxaes.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/gxaes.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/gxaes.o.d" -o ${OBJECTDIR}/_ext/1550770622/gxaes.o ../src/gurux/src/gxaes.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/gxarray.o: ../src/gurux/src/gxarray.c  .generated_files/flags/pic32cxmtsh_db/da2f3cdc51a6eabce277f96730573a673b5dcfe7 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/gxarray.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/gxarray.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/gxarray.o.d" -o ${OBJECTDIR}/_ext/1550770622/gxarray.o ../src/gurux/src/gxarray.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/gxget.o: ../src/gurux/src/gxget.c  .generated_files/flags/pic32cxmtsh_db/97ec23215befd2272bde9b690d0a54892fbf0707 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/gxget.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/gxget.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/gxget.o.d" -o ${OBJECTDIR}/_ext/1550770622/gxget.o ../src/gurux/src/gxget.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/gxinvoke.o: ../src/gurux/src/gxinvoke.c  .generated_files/flags/pic32cxmtsh_db/37b133bbdccac7df2f929f78eb92ea363bb63767 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/gxinvoke.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/gxinvoke.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/gxinvoke.o.d" -o ${OBJECTDIR}/_ext/1550770622/gxinvoke.o ../src/gurux/src/gxinvoke.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/gxkey.o: ../src/gurux/src/gxkey.c  .generated_files/flags/pic32cxmtsh_db/2ccc5677872d5179e6f3e0d8c708ada269990ca6 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/gxkey.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/gxkey.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/gxkey.o.d" -o ${OBJECTDIR}/_ext/1550770622/gxkey.o ../src/gurux/src/gxkey.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/gxmd5.o: ../src/gurux/src/gxmd5.c  .generated_files/flags/pic32cxmtsh_db/436d9e5f95d877d3c1c24c4547091003fe15cd10 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/gxmd5.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/gxmd5.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/gxmd5.o.d" -o ${OBJECTDIR}/_ext/1550770622/gxmd5.o ../src/gurux/src/gxmd5.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/gxobjects.o: ../src/gurux/src/gxobjects.c  .generated_files/flags/pic32cxmtsh_db/82bbeacd30177f3e8049531d6a81168ed0f9f013 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/gxobjects.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/gxobjects.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/gxobjects.o.d" -o ${OBJECTDIR}/_ext/1550770622/gxobjects.o ../src/gurux/src/gxobjects.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/gxserializer.o: ../src/gurux/src/gxserializer.c  .generated_files/flags/pic32cxmtsh_db/789de7882d60ac200147c178243052248f78b3a0 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/gxserializer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/gxserializer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/gxserializer.o.d" -o ${OBJECTDIR}/_ext/1550770622/gxserializer.o ../src/gurux/src/gxserializer.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/gxset.o: ../src/gurux/src/gxset.c  .generated_files/flags/pic32cxmtsh_db/893ac9432548b168893b6d8584387718966e2ee5 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/gxset.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/gxset.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/gxset.o.d" -o ${OBJECTDIR}/_ext/1550770622/gxset.o ../src/gurux/src/gxset.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/gxsetignoremalloc.o: ../src/gurux/src/gxsetignoremalloc.c  .generated_files/flags/pic32cxmtsh_db/613a34efb3b1057103c66f0450ba1280f231ef55 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/gxsetignoremalloc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/gxsetignoremalloc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/gxsetignoremalloc.o.d" -o ${OBJECTDIR}/_ext/1550770622/gxsetignoremalloc.o ../src/gurux/src/gxsetignoremalloc.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/gxsetmalloc.o: ../src/gurux/src/gxsetmalloc.c  .generated_files/flags/pic32cxmtsh_db/1e118eac24130f9aeb7d3294d8955b50cfe8bf0b .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/gxsetmalloc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/gxsetmalloc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/gxsetmalloc.o.d" -o ${OBJECTDIR}/_ext/1550770622/gxsetmalloc.o ../src/gurux/src/gxsetmalloc.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/gxsha1.o: ../src/gurux/src/gxsha1.c  .generated_files/flags/pic32cxmtsh_db/de0950f78ea5d404af8ff2f36dc81b88df14e153 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/gxsha1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/gxsha1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/gxsha1.o.d" -o ${OBJECTDIR}/_ext/1550770622/gxsha1.o ../src/gurux/src/gxsha1.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/gxsha256.o: ../src/gurux/src/gxsha256.c  .generated_files/flags/pic32cxmtsh_db/10101f551852e293f5c45147f8649af749624239 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/gxsha256.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/gxsha256.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/gxsha256.o.d" -o ${OBJECTDIR}/_ext/1550770622/gxsha256.o ../src/gurux/src/gxsha256.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/gxvalueeventargs.o: ../src/gurux/src/gxvalueeventargs.c  .generated_files/flags/pic32cxmtsh_db/8e2e70973289663dc421d8c727c42bbae2bd7c9 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/gxvalueeventargs.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/gxvalueeventargs.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/gxvalueeventargs.o.d" -o ${OBJECTDIR}/_ext/1550770622/gxvalueeventargs.o ../src/gurux/src/gxvalueeventargs.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/helpers.o: ../src/gurux/src/helpers.c  .generated_files/flags/pic32cxmtsh_db/307dd42f7d3e3d48b9b9985d70c6b08880489d6 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/helpers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/helpers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/helpers.o.d" -o ${OBJECTDIR}/_ext/1550770622/helpers.o ../src/gurux/src/helpers.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/message.o: ../src/gurux/src/message.c  .generated_files/flags/pic32cxmtsh_db/dea158cb75bb5abfd607c251dd3f972cc5fa681 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/message.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/message.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/message.o.d" -o ${OBJECTDIR}/_ext/1550770622/message.o ../src/gurux/src/message.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/notify.o: ../src/gurux/src/notify.c  .generated_files/flags/pic32cxmtsh_db/20797f8acb9048ce02642b97622d6d9d05899531 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/notify.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/notify.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/notify.o.d" -o ${OBJECTDIR}/_ext/1550770622/notify.o ../src/gurux/src/notify.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/objectarray.o: ../src/gurux/src/objectarray.c  .generated_files/flags/pic32cxmtsh_db/7725922d3a52004c63659561c0ed2cea4617edac .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/objectarray.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/objectarray.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/objectarray.o.d" -o ${OBJECTDIR}/_ext/1550770622/objectarray.o ../src/gurux/src/objectarray.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/parameters.o: ../src/gurux/src/parameters.c  .generated_files/flags/pic32cxmtsh_db/2c1d5e6963810c7e67c1e97f3a39d58302607a4 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/parameters.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/parameters.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/parameters.o.d" -o ${OBJECTDIR}/_ext/1550770622/parameters.o ../src/gurux/src/parameters.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/replydata.o: ../src/gurux/src/replydata.c  .generated_files/flags/pic32cxmtsh_db/fb5a0db92b48da723b6c89db4c4fae4062572a86 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/replydata.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/replydata.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/replydata.o.d" -o ${OBJECTDIR}/_ext/1550770622/replydata.o ../src/gurux/src/replydata.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/server.o: ../src/gurux/src/server.c  .generated_files/flags/pic32cxmtsh_db/5f4c8959bde136bed047958b7c54b5092847dafa .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/server.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/server.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/server.o.d" -o ${OBJECTDIR}/_ext/1550770622/server.o ../src/gurux/src/server.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/serverevents.o: ../src/gurux/src/serverevents.c  .generated_files/flags/pic32cxmtsh_db/10c2ef616b88eb4a8acd38009f885b3314c4cf66 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/serverevents.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/serverevents.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/serverevents.o.d" -o ${OBJECTDIR}/_ext/1550770622/serverevents.o ../src/gurux/src/serverevents.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/variant.o: ../src/gurux/src/variant.c  .generated_files/flags/pic32cxmtsh_db/1893688f6b9b4a353d399d34b51df5b995844f50 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/variant.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/variant.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/variant.o.d" -o ${OBJECTDIR}/_ext/1550770622/variant.o ../src/gurux/src/variant.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app_console.o: ../src/app_console.c  .generated_files/flags/pic32cxmtsh_db/5992cb7963729cf9e59bcb1af20b0ea409530a41 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_console.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_console.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app_console.o.d" -o ${OBJECTDIR}/_ext/1360937237/app_console.o ../src/app_console.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app_metrology.o: ../src/app_metrology.c  .generated_files/flags/pic32cxmtsh_db/e9788b44a0cc26f1e3fd368afe3d7251ebeb1b28 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_metrology.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_metrology.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app_metrology.o.d" -o ${OBJECTDIR}/_ext/1360937237/app_metrology.o ../src/app_metrology.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/pic32cxmtsh_db/82e0da0d412cad2d1860cdb106a9e1fe8068b675 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app_display.o: ../src/app_display.c  .generated_files/flags/pic32cxmtsh_db/7574b1fcf7a6473d71c6c57349a19b525f602f69 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_display.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_display.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app_display.o.d" -o ${OBJECTDIR}/_ext/1360937237/app_display.o ../src/app_display.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app_datalog.o: ../src/app_datalog.c  .generated_files/flags/pic32cxmtsh_db/13ad520ee5367400f9d1e474678b49ba2c1a2f54 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_datalog.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_datalog.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app_datalog.o.d" -o ${OBJECTDIR}/_ext/1360937237/app_datalog.o ../src/app_datalog.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app_energy.o: ../src/app_energy.c  .generated_files/flags/pic32cxmtsh_db/9c9e0c0f1f60eeada5f1b3594c187722fab0748b .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_energy.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_energy.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app_energy.o.d" -o ${OBJECTDIR}/_ext/1360937237/app_energy.o ../src/app_energy.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app_events.o: ../src/app_events.c  .generated_files/flags/pic32cxmtsh_db/cdd5c7c3710de1229d11554ea13badc1bff37371 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_events.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_events.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app_events.o.d" -o ${OBJECTDIR}/_ext/1360937237/app_events.o ../src/app_events.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app_control.o: ../src/app_control.c  .generated_files/flags/pic32cxmtsh_db/e954d75a163972e9ca259297517ae3d590c77773 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_control.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_control.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app_control.o.d" -o ${OBJECTDIR}/_ext/1360937237/app_control.o ../src/app_control.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app_dlms.o: ../src/app_dlms.c  .generated_files/flags/pic32cxmtsh_db/d8b75ce4c9f9c72fd841b386fb5295f7a3d7e79c .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_dlms.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_dlms.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app_dlms.o.d" -o ${OBJECTDIR}/_ext/1360937237/app_dlms.o ../src/app_dlms.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app_lte.o: ../src/app_lte.c  .generated_files/flags/pic32cxmtsh_db/407554ee86b439118559859c93934fa78f771fec .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_lte.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_lte.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app_lte.o.d" -o ${OBJECTDIR}/_ext/1360937237/app_lte.o ../src/app_lte.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app_plc.o: ../src/app_plc.c  .generated_files/flags/pic32cxmtsh_db/578cd1b714c606d18ef4839c865df25e03611966 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_plc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_plc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app_plc.o.d" -o ${OBJECTDIR}/_ext/1360937237/app_plc.o ../src/app_plc.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app_gurux_dlms_process.o: ../src/app_gurux_dlms_process.c  .generated_files/flags/pic32cxmtsh_db/ea7837571825402e7c1f813f7a7756899df37441 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_gurux_dlms_process.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_gurux_dlms_process.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app_gurux_dlms_process.o.d" -o ${OBJECTDIR}/_ext/1360937237/app_gurux_dlms_process.o ../src/app_gurux_dlms_process.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app_gurux_meter_value_interface.o: ../src/app_gurux_meter_value_interface.c  .generated_files/flags/pic32cxmtsh_db/693b23277214497bde602aeb9c095421d354af29 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_gurux_meter_value_interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_gurux_meter_value_interface.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app_gurux_meter_value_interface.o.d" -o ${OBJECTDIR}/_ext/1360937237/app_gurux_meter_value_interface.o ../src/app_gurux_meter_value_interface.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app_gurux_process_ee_dummy.o: ../src/app_gurux_process_ee_dummy.c  .generated_files/flags/pic32cxmtsh_db/ce84a207a853257a4832d02f095732f2cdc60ae .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_gurux_process_ee_dummy.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_gurux_process_ee_dummy.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app_gurux_process_ee_dummy.o.d" -o ${OBJECTDIR}/_ext/1360937237/app_gurux_process_ee_dummy.o ../src/app_gurux_process_ee_dummy.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app_gurux_process_time.o: ../src/app_gurux_process_time.c  .generated_files/flags/pic32cxmtsh_db/7a0e900527c8cac2a98a694520a030f3155b1c4f .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_gurux_process_time.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_gurux_process_time.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app_gurux_process_time.o.d" -o ${OBJECTDIR}/_ext/1360937237/app_gurux_process_time.o ../src/app_gurux_process_time.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app_gurux_uart_handdle.o: ../src/app_gurux_uart_handdle.c  .generated_files/flags/pic32cxmtsh_db/522404ad11f1b20ce9bd4679f2a71110acbe0c34 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_gurux_uart_handdle.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_gurux_uart_handdle.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app_gurux_uart_handdle.o.d" -o ${OBJECTDIR}/_ext/1360937237/app_gurux_uart_handdle.o ../src/app_gurux_uart_handdle.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app_pulse.o: ../src/app_pulse.c  .generated_files/flags/pic32cxmtsh_db/925bc1e45c3eee5c1d648c0c6d3bfcbbfe4fa371 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_pulse.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_pulse.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app_pulse.o.d" -o ${OBJECTDIR}/_ext/1360937237/app_pulse.o ../src/app_pulse.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app_optouart.o: ../src/app_optouart.c  .generated_files/flags/pic32cxmtsh_db/ba4baa13efe2462d8a33803549e925987b44c0f8 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_optouart.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_optouart.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app_optouart.o.d" -o ${OBJECTDIR}/_ext/1360937237/app_optouart.o ../src/app_optouart.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app_pwr_offset.o: ../src/app_pwr_offset.c  .generated_files/flags/pic32cxmtsh_db/182ca3afa5eeab5ec960146b6f36370353354d94 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_pwr_offset.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_pwr_offset.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app_pwr_offset.o.d" -o ${OBJECTDIR}/_ext/1360937237/app_pwr_offset.o ../src/app_pwr_offset.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app_multi_cal.o: ../src/app_multi_cal.c  .generated_files/flags/pic32cxmtsh_db/2aa58c0ae4e4bad1d61b6ba4ebd0cef659e6089f .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_multi_cal.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_multi_cal.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app_multi_cal.o.d" -o ${OBJECTDIR}/_ext/1360937237/app_multi_cal.o ../src/app_multi_cal.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
else
${OBJECTDIR}/_ext/2059779260/drv_memory.o: ../src/config/pic32cxmtsh_db/driver/memory/src/drv_memory.c  .generated_files/flags/pic32cxmtsh_db/ec2e17df9190e81bd2dd12fe64abdba61cb0da45 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2059779260" 
	@${RM} ${OBJECTDIR}/_ext/2059779260/drv_memory.o.d 
	@${RM} ${OBJECTDIR}/_ext/2059779260/drv_memory.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2059779260/drv_memory.o.d" -o ${OBJECTDIR}/_ext/2059779260/drv_memory.o ../src/config/pic32cxmtsh_db/driver/memory/src/drv_memory.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/2059779260/drv_memory_file_system.o: ../src/config/pic32cxmtsh_db/driver/memory/src/drv_memory_file_system.c  .generated_files/flags/pic32cxmtsh_db/112a2b845156b914f2259428afe14e2f8bed76e8 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2059779260" 
	@${RM} ${OBJECTDIR}/_ext/2059779260/drv_memory_file_system.o.d 
	@${RM} ${OBJECTDIR}/_ext/2059779260/drv_memory_file_system.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2059779260/drv_memory_file_system.o.d" -o ${OBJECTDIR}/_ext/2059779260/drv_memory_file_system.o ../src/config/pic32cxmtsh_db/driver/memory/src/drv_memory_file_system.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/271336736/drv_metrology.o: ../src/config/pic32cxmtsh_db/driver/metrology/drv_metrology.c  .generated_files/flags/pic32cxmtsh_db/a4add94ac7855643e1d1d5ea00c250d65031ca97 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/271336736" 
	@${RM} ${OBJECTDIR}/_ext/271336736/drv_metrology.o.d 
	@${RM} ${OBJECTDIR}/_ext/271336736/drv_metrology.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/271336736/drv_metrology.o.d" -o ${OBJECTDIR}/_ext/271336736/drv_metrology.o ../src/config/pic32cxmtsh_db/driver/metrology/drv_metrology.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/945666689/drv_sst26.o: ../src/config/pic32cxmtsh_db/driver/sst26/src/drv_sst26.c  .generated_files/flags/pic32cxmtsh_db/d65a9340ba7382ec6e12673a53de45c10ddef0f5 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/945666689" 
	@${RM} ${OBJECTDIR}/_ext/945666689/drv_sst26.o.d 
	@${RM} ${OBJECTDIR}/_ext/945666689/drv_sst26.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/945666689/drv_sst26.o.d" -o ${OBJECTDIR}/_ext/945666689/drv_sst26.o ../src/config/pic32cxmtsh_db/driver/sst26/src/drv_sst26.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1066932174/cl010_slcdc.o: ../src/config/pic32cxmtsh_db/gfx/driver/controller/slcdc/cl010_slcdc.c  .generated_files/flags/pic32cxmtsh_db/7b62a4c9f6ebc1fd446700e6a4e2448997f2ba9d .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1066932174" 
	@${RM} ${OBJECTDIR}/_ext/1066932174/cl010_slcdc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1066932174/cl010_slcdc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1066932174/cl010_slcdc.o.d" -o ${OBJECTDIR}/_ext/1066932174/cl010_slcdc.o ../src/config/pic32cxmtsh_db/gfx/driver/controller/slcdc/cl010_slcdc.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1066932174/drv_gfx_slcdc.o: ../src/config/pic32cxmtsh_db/gfx/driver/controller/slcdc/drv_gfx_slcdc.c  .generated_files/flags/pic32cxmtsh_db/4a55732650ea123a69cc90b586c717e6bc4f4abd .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1066932174" 
	@${RM} ${OBJECTDIR}/_ext/1066932174/drv_gfx_slcdc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1066932174/drv_gfx_slcdc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1066932174/drv_gfx_slcdc.o.d" -o ${OBJECTDIR}/_ext/1066932174/drv_gfx_slcdc.o ../src/config/pic32cxmtsh_db/gfx/driver/controller/slcdc/drv_gfx_slcdc.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1559253944/plib_clk.o: ../src/config/pic32cxmtsh_db/peripheral/clk/plib_clk.c  .generated_files/flags/pic32cxmtsh_db/dd141dc9fefd90e4747b5f48123b7cc4b4ac2081 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1559253944" 
	@${RM} ${OBJECTDIR}/_ext/1559253944/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/1559253944/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1559253944/plib_clk.o.d" -o ${OBJECTDIR}/_ext/1559253944/plib_clk.o ../src/config/pic32cxmtsh_db/peripheral/clk/plib_clk.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1092231196/plib_cmcc.o: ../src/config/pic32cxmtsh_db/peripheral/cmcc/plib_cmcc.c  .generated_files/flags/pic32cxmtsh_db/1546c0eeab0b1ca4a71558f57f64880faca82df8 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1092231196" 
	@${RM} ${OBJECTDIR}/_ext/1092231196/plib_cmcc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1092231196/plib_cmcc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1092231196/plib_cmcc.o.d" -o ${OBJECTDIR}/_ext/1092231196/plib_cmcc.o ../src/config/pic32cxmtsh_db/peripheral/cmcc/plib_cmcc.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1092191747/plib_dwdt.o: ../src/config/pic32cxmtsh_db/peripheral/dwdt/plib_dwdt.c  .generated_files/flags/pic32cxmtsh_db/3bc2551d083405d112bc61a4a7a40c6933dc6f02 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1092191747" 
	@${RM} ${OBJECTDIR}/_ext/1092191747/plib_dwdt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1092191747/plib_dwdt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1092191747/plib_dwdt.o.d" -o ${OBJECTDIR}/_ext/1092191747/plib_dwdt.o ../src/config/pic32cxmtsh_db/peripheral/dwdt/plib_dwdt.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/212878140/plib_flexcom0_usart.o: ../src/config/pic32cxmtsh_db/peripheral/flexcom/usart/plib_flexcom0_usart.c  .generated_files/flags/pic32cxmtsh_db/1c079c38c1b9f036b3ceae0a3c8ed739da526d3e .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/212878140" 
	@${RM} ${OBJECTDIR}/_ext/212878140/plib_flexcom0_usart.o.d 
	@${RM} ${OBJECTDIR}/_ext/212878140/plib_flexcom0_usart.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/212878140/plib_flexcom0_usart.o.d" -o ${OBJECTDIR}/_ext/212878140/plib_flexcom0_usart.o ../src/config/pic32cxmtsh_db/peripheral/flexcom/usart/plib_flexcom0_usart.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/212878140/plib_flexcom6_usart.o: ../src/config/pic32cxmtsh_db/peripheral/flexcom/usart/plib_flexcom6_usart.c  .generated_files/flags/pic32cxmtsh_db/205d4eb7752918fe9e764d715f5e8af280abd8a1 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/212878140" 
	@${RM} ${OBJECTDIR}/_ext/212878140/plib_flexcom6_usart.o.d 
	@${RM} ${OBJECTDIR}/_ext/212878140/plib_flexcom6_usart.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/212878140/plib_flexcom6_usart.o.d" -o ${OBJECTDIR}/_ext/212878140/plib_flexcom6_usart.o ../src/config/pic32cxmtsh_db/peripheral/flexcom/usart/plib_flexcom6_usart.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/212878140/plib_flexcom3_usart.o: ../src/config/pic32cxmtsh_db/peripheral/flexcom/usart/plib_flexcom3_usart.c  .generated_files/flags/pic32cxmtsh_db/a9b86e81e44363ce238718f6cd2ac7856e9c7ef1 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/212878140" 
	@${RM} ${OBJECTDIR}/_ext/212878140/plib_flexcom3_usart.o.d 
	@${RM} ${OBJECTDIR}/_ext/212878140/plib_flexcom3_usart.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/212878140/plib_flexcom3_usart.o.d" -o ${OBJECTDIR}/_ext/212878140/plib_flexcom3_usart.o ../src/config/pic32cxmtsh_db/peripheral/flexcom/usart/plib_flexcom3_usart.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1559248455/plib_icm.o: ../src/config/pic32cxmtsh_db/peripheral/icm/plib_icm.c  .generated_files/flags/pic32cxmtsh_db/40b1e2b036d7522cf8fcc1bfd17035b1790c6d21 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1559248455" 
	@${RM} ${OBJECTDIR}/_ext/1559248455/plib_icm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1559248455/plib_icm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1559248455/plib_icm.o.d" -o ${OBJECTDIR}/_ext/1559248455/plib_icm.o ../src/config/pic32cxmtsh_db/peripheral/icm/plib_icm.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1091894660/plib_nvic.o: ../src/config/pic32cxmtsh_db/peripheral/nvic/plib_nvic.c  .generated_files/flags/pic32cxmtsh_db/d1090681692d999acd58a1f9a639b8f4922c1dbf .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1091894660" 
	@${RM} ${OBJECTDIR}/_ext/1091894660/plib_nvic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1091894660/plib_nvic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1091894660/plib_nvic.o.d" -o ${OBJECTDIR}/_ext/1091894660/plib_nvic.o ../src/config/pic32cxmtsh_db/peripheral/nvic/plib_nvic.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1559241540/plib_pio.o: ../src/config/pic32cxmtsh_db/peripheral/pio/plib_pio.c  .generated_files/flags/pic32cxmtsh_db/e7ae316c6a86def76f04831897a1c491e6a37123 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1559241540" 
	@${RM} ${OBJECTDIR}/_ext/1559241540/plib_pio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1559241540/plib_pio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1559241540/plib_pio.o.d" -o ${OBJECTDIR}/_ext/1559241540/plib_pio.o ../src/config/pic32cxmtsh_db/peripheral/pio/plib_pio.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1091807947/plib_qspi.o: ../src/config/pic32cxmtsh_db/peripheral/qspi/plib_qspi.c  .generated_files/flags/pic32cxmtsh_db/8106aa8f68ab644bdf9da2f08b7cf5343e28309a .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1091807947" 
	@${RM} ${OBJECTDIR}/_ext/1091807947/plib_qspi.o.d 
	@${RM} ${OBJECTDIR}/_ext/1091807947/plib_qspi.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1091807947/plib_qspi.o.d" -o ${OBJECTDIR}/_ext/1091807947/plib_qspi.o ../src/config/pic32cxmtsh_db/peripheral/qspi/plib_qspi.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1091778038/plib_rstc.o: ../src/config/pic32cxmtsh_db/peripheral/rstc/plib_rstc.c  .generated_files/flags/pic32cxmtsh_db/6e36113cb1fc26cb597a937fb5d045e8b43da910 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1091778038" 
	@${RM} ${OBJECTDIR}/_ext/1091778038/plib_rstc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1091778038/plib_rstc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1091778038/plib_rstc.o.d" -o ${OBJECTDIR}/_ext/1091778038/plib_rstc.o ../src/config/pic32cxmtsh_db/peripheral/rstc/plib_rstc.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1559239289/plib_rtc.o: ../src/config/pic32cxmtsh_db/peripheral/rtc/plib_rtc.c  .generated_files/flags/pic32cxmtsh_db/2a8ae0c08ea555350b654185d10eb94db2019873 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1559239289" 
	@${RM} ${OBJECTDIR}/_ext/1559239289/plib_rtc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1559239289/plib_rtc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1559239289/plib_rtc.o.d" -o ${OBJECTDIR}/_ext/1559239289/plib_rtc.o ../src/config/pic32cxmtsh_db/peripheral/rtc/plib_rtc.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1091762135/plib_sefc1.o: ../src/config/pic32cxmtsh_db/peripheral/sefc/plib_sefc1.c  .generated_files/flags/pic32cxmtsh_db/5e4c07b6294e2c8fd1847b744b145c353c83138e .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1091762135" 
	@${RM} ${OBJECTDIR}/_ext/1091762135/plib_sefc1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1091762135/plib_sefc1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1091762135/plib_sefc1.o.d" -o ${OBJECTDIR}/_ext/1091762135/plib_sefc1.o ../src/config/pic32cxmtsh_db/peripheral/sefc/plib_sefc1.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1091762135/plib_sefc0.o: ../src/config/pic32cxmtsh_db/peripheral/sefc/plib_sefc0.c  .generated_files/flags/pic32cxmtsh_db/fdb253780cbf113dedeb6cc4d210fd739e25d14e .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1091762135" 
	@${RM} ${OBJECTDIR}/_ext/1091762135/plib_sefc0.o.d 
	@${RM} ${OBJECTDIR}/_ext/1091762135/plib_sefc0.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1091762135/plib_sefc0.o.d" -o ${OBJECTDIR}/_ext/1091762135/plib_sefc0.o ../src/config/pic32cxmtsh_db/peripheral/sefc/plib_sefc0.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1091762135/plib_sefc_common.o: ../src/config/pic32cxmtsh_db/peripheral/sefc/plib_sefc_common.c  .generated_files/flags/pic32cxmtsh_db/67d5eb69f5be035d7e6a7380ec9d2a0bca0d91a7 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1091762135" 
	@${RM} ${OBJECTDIR}/_ext/1091762135/plib_sefc_common.o.d 
	@${RM} ${OBJECTDIR}/_ext/1091762135/plib_sefc_common.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1091762135/plib_sefc_common.o.d" -o ${OBJECTDIR}/_ext/1091762135/plib_sefc_common.o ../src/config/pic32cxmtsh_db/peripheral/sefc/plib_sefc_common.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1091746449/plib_supc.o: ../src/config/pic32cxmtsh_db/peripheral/supc/plib_supc.c  .generated_files/flags/pic32cxmtsh_db/5f43540d6e627c5d5c86821dc2bdd8a4f40e608a .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1091746449" 
	@${RM} ${OBJECTDIR}/_ext/1091746449/plib_supc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1091746449/plib_supc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1091746449/plib_supc.o.d" -o ${OBJECTDIR}/_ext/1091746449/plib_supc.o ../src/config/pic32cxmtsh_db/peripheral/supc/plib_supc.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1686768144/plib_systick.o: ../src/config/pic32cxmtsh_db/peripheral/systick/plib_systick.c  .generated_files/flags/pic32cxmtsh_db/ae99f9b6973577f9b8ae3112ad21bf28b77e457d .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686768144" 
	@${RM} ${OBJECTDIR}/_ext/1686768144/plib_systick.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686768144/plib_systick.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1686768144/plib_systick.o.d" -o ${OBJECTDIR}/_ext/1686768144/plib_systick.o ../src/config/pic32cxmtsh_db/peripheral/systick/plib_systick.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/780985993/plib_tc0.o: ../src/config/pic32cxmtsh_db/peripheral/tc/plib_tc0.c  .generated_files/flags/pic32cxmtsh_db/8320b8a0521179c7227e2fa732c7b0c0b96b43fc .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/780985993" 
	@${RM} ${OBJECTDIR}/_ext/780985993/plib_tc0.o.d 
	@${RM} ${OBJECTDIR}/_ext/780985993/plib_tc0.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/780985993/plib_tc0.o.d" -o ${OBJECTDIR}/_ext/780985993/plib_tc0.o ../src/config/pic32cxmtsh_db/peripheral/tc/plib_tc0.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1091706008/plib_uart.o: ../src/config/pic32cxmtsh_db/peripheral/uart/plib_uart.c  .generated_files/flags/pic32cxmtsh_db/c0ccb4c84d5d5cbaca2281fbba18671b3549b71 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1091706008" 
	@${RM} ${OBJECTDIR}/_ext/1091706008/plib_uart.o.d 
	@${RM} ${OBJECTDIR}/_ext/1091706008/plib_uart.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1091706008/plib_uart.o.d" -o ${OBJECTDIR}/_ext/1091706008/plib_uart.o ../src/config/pic32cxmtsh_db/peripheral/uart/plib_uart.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1469502512/xc32_monitor.o: ../src/config/pic32cxmtsh_db/stdio/xc32_monitor.c  .generated_files/flags/pic32cxmtsh_db/ee3df1dae3212d3a5570017569f57de7b98ca6ea .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1469502512" 
	@${RM} ${OBJECTDIR}/_ext/1469502512/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/1469502512/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1469502512/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/1469502512/xc32_monitor.o ../src/config/pic32cxmtsh_db/stdio/xc32_monitor.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1808853019/sys_cache.o: ../src/config/pic32cxmtsh_db/system/cache/sys_cache.c  .generated_files/flags/pic32cxmtsh_db/16de40011d8efb84c573a96b6a5b3b663224419c .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1808853019" 
	@${RM} ${OBJECTDIR}/_ext/1808853019/sys_cache.o.d 
	@${RM} ${OBJECTDIR}/_ext/1808853019/sys_cache.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1808853019/sys_cache.o.d" -o ${OBJECTDIR}/_ext/1808853019/sys_cache.o ../src/config/pic32cxmtsh_db/system/cache/sys_cache.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1516896519/sys_command.o: ../src/config/pic32cxmtsh_db/system/command/src/sys_command.c  .generated_files/flags/pic32cxmtsh_db/2602a133fb7a692caf0d515b1e4b27e08ea7bc3f .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1516896519" 
	@${RM} ${OBJECTDIR}/_ext/1516896519/sys_command.o.d 
	@${RM} ${OBJECTDIR}/_ext/1516896519/sys_command.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1516896519/sys_command.o.d" -o ${OBJECTDIR}/_ext/1516896519/sys_command.o ../src/config/pic32cxmtsh_db/system/command/src/sys_command.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1973608699/sys_console.o: ../src/config/pic32cxmtsh_db/system/console/src/sys_console.c  .generated_files/flags/pic32cxmtsh_db/5fe16da4d3f53ac1c51b53d7c7671b638c150e42 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1973608699" 
	@${RM} ${OBJECTDIR}/_ext/1973608699/sys_console.o.d 
	@${RM} ${OBJECTDIR}/_ext/1973608699/sys_console.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1973608699/sys_console.o.d" -o ${OBJECTDIR}/_ext/1973608699/sys_console.o ../src/config/pic32cxmtsh_db/system/console/src/sys_console.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1973608699/sys_console_uart.o: ../src/config/pic32cxmtsh_db/system/console/src/sys_console_uart.c  .generated_files/flags/pic32cxmtsh_db/804671a29578f93c08eb967232d7b657ee399cd1 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1973608699" 
	@${RM} ${OBJECTDIR}/_ext/1973608699/sys_console_uart.o.d 
	@${RM} ${OBJECTDIR}/_ext/1973608699/sys_console_uart.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1973608699/sys_console_uart.o.d" -o ${OBJECTDIR}/_ext/1973608699/sys_console_uart.o ../src/config/pic32cxmtsh_db/system/console/src/sys_console_uart.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1316136687/ff.o: ../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system/ff.c  .generated_files/flags/pic32cxmtsh_db/854d5554d4873443402681835fbd845662273e97 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1316136687" 
	@${RM} ${OBJECTDIR}/_ext/1316136687/ff.o.d 
	@${RM} ${OBJECTDIR}/_ext/1316136687/ff.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1316136687/ff.o.d" -o ${OBJECTDIR}/_ext/1316136687/ff.o ../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system/ff.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1316136687/ffunicode.o: ../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system/ffunicode.c  .generated_files/flags/pic32cxmtsh_db/601c9702702f9276980dd6a77d7ec78b2e8f7d89 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1316136687" 
	@${RM} ${OBJECTDIR}/_ext/1316136687/ffunicode.o.d 
	@${RM} ${OBJECTDIR}/_ext/1316136687/ffunicode.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1316136687/ffunicode.o.d" -o ${OBJECTDIR}/_ext/1316136687/ffunicode.o ../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system/ffunicode.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/330030374/diskio.o: ../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access/diskio.c  .generated_files/flags/pic32cxmtsh_db/b11cf4bc13265ed0a1f6b3f8a44de9e0e2592041 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/330030374" 
	@${RM} ${OBJECTDIR}/_ext/330030374/diskio.o.d 
	@${RM} ${OBJECTDIR}/_ext/330030374/diskio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/330030374/diskio.o.d" -o ${OBJECTDIR}/_ext/330030374/diskio.o ../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access/diskio.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/340841513/sys_fs.o: ../src/config/pic32cxmtsh_db/system/fs/src/sys_fs.c  .generated_files/flags/pic32cxmtsh_db/e1d1f0ab1f835ab7c0345c3568e8dbb3add62495 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/340841513" 
	@${RM} ${OBJECTDIR}/_ext/340841513/sys_fs.o.d 
	@${RM} ${OBJECTDIR}/_ext/340841513/sys_fs.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/340841513/sys_fs.o.d" -o ${OBJECTDIR}/_ext/340841513/sys_fs.o ../src/config/pic32cxmtsh_db/system/fs/src/sys_fs.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/340841513/sys_fs_media_manager.o: ../src/config/pic32cxmtsh_db/system/fs/src/sys_fs_media_manager.c  .generated_files/flags/pic32cxmtsh_db/f9be53997156c9c9895b4a913d7415909ff8a81d .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/340841513" 
	@${RM} ${OBJECTDIR}/_ext/340841513/sys_fs_media_manager.o.d 
	@${RM} ${OBJECTDIR}/_ext/340841513/sys_fs_media_manager.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/340841513/sys_fs_media_manager.o.d" -o ${OBJECTDIR}/_ext/340841513/sys_fs_media_manager.o ../src/config/pic32cxmtsh_db/system/fs/src/sys_fs_media_manager.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/340841513/sys_fs_fat_interface.o: ../src/config/pic32cxmtsh_db/system/fs/src/sys_fs_fat_interface.c  .generated_files/flags/pic32cxmtsh_db/3ca86549bbc7e1e3fd096ce36d6677176158d2ff .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/340841513" 
	@${RM} ${OBJECTDIR}/_ext/340841513/sys_fs_fat_interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/340841513/sys_fs_fat_interface.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/340841513/sys_fs_fat_interface.o.d" -o ${OBJECTDIR}/_ext/340841513/sys_fs_fat_interface.o ../src/config/pic32cxmtsh_db/system/fs/src/sys_fs_fat_interface.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/262248989/sys_int.o: ../src/config/pic32cxmtsh_db/system/int/src/sys_int.c  .generated_files/flags/pic32cxmtsh_db/19287a93b3f1642c94d53cf2e54082a6f5793073 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/262248989" 
	@${RM} ${OBJECTDIR}/_ext/262248989/sys_int.o.d 
	@${RM} ${OBJECTDIR}/_ext/262248989/sys_int.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/262248989/sys_int.o.d" -o ${OBJECTDIR}/_ext/262248989/sys_int.o ../src/config/pic32cxmtsh_db/system/int/src/sys_int.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1822840296/sys_reset.o: ../src/config/pic32cxmtsh_db/system/reset/sys_reset.c  .generated_files/flags/pic32cxmtsh_db/4830d71b63b00729fbdea7cd11f09719324c93ab .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1822840296" 
	@${RM} ${OBJECTDIR}/_ext/1822840296/sys_reset.o.d 
	@${RM} ${OBJECTDIR}/_ext/1822840296/sys_reset.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1822840296/sys_reset.o.d" -o ${OBJECTDIR}/_ext/1822840296/sys_reset.o ../src/config/pic32cxmtsh_db/system/reset/sys_reset.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1235719273/sys_time.o: ../src/config/pic32cxmtsh_db/system/time/src/sys_time.c  .generated_files/flags/pic32cxmtsh_db/8c8bee473952b53ed1804d57ba68f99214d1f1c4 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1235719273" 
	@${RM} ${OBJECTDIR}/_ext/1235719273/sys_time.o.d 
	@${RM} ${OBJECTDIR}/_ext/1235719273/sys_time.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1235719273/sys_time.o.d" -o ${OBJECTDIR}/_ext/1235719273/sys_time.o ../src/config/pic32cxmtsh_db/system/time/src/sys_time.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1772662538/libc_syscalls.o: ../src/config/pic32cxmtsh_db/libc_syscalls.c  .generated_files/flags/pic32cxmtsh_db/3ca10939ab6b2a1acae482ed0cfbacd48dadfe99 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1772662538" 
	@${RM} ${OBJECTDIR}/_ext/1772662538/libc_syscalls.o.d 
	@${RM} ${OBJECTDIR}/_ext/1772662538/libc_syscalls.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1772662538/libc_syscalls.o.d" -o ${OBJECTDIR}/_ext/1772662538/libc_syscalls.o ../src/config/pic32cxmtsh_db/libc_syscalls.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1772662538/startup_xc32.o: ../src/config/pic32cxmtsh_db/startup_xc32.c  .generated_files/flags/pic32cxmtsh_db/f2806c21efbd8b8734b71b2d180c985e423b406e .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1772662538" 
	@${RM} ${OBJECTDIR}/_ext/1772662538/startup_xc32.o.d 
	@${RM} ${OBJECTDIR}/_ext/1772662538/startup_xc32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1772662538/startup_xc32.o.d" -o ${OBJECTDIR}/_ext/1772662538/startup_xc32.o ../src/config/pic32cxmtsh_db/startup_xc32.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1772662538/exceptions.o: ../src/config/pic32cxmtsh_db/exceptions.c  .generated_files/flags/pic32cxmtsh_db/d08a534f4fcaf110275846465318cf55d4f39d8c .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1772662538" 
	@${RM} ${OBJECTDIR}/_ext/1772662538/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1772662538/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1772662538/exceptions.o.d" -o ${OBJECTDIR}/_ext/1772662538/exceptions.o ../src/config/pic32cxmtsh_db/exceptions.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1772662538/interrupts.o: ../src/config/pic32cxmtsh_db/interrupts.c  .generated_files/flags/pic32cxmtsh_db/c8780ea05d1ca9df148c8ba2a706f8934d05f921 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1772662538" 
	@${RM} ${OBJECTDIR}/_ext/1772662538/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1772662538/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1772662538/interrupts.o.d" -o ${OBJECTDIR}/_ext/1772662538/interrupts.o ../src/config/pic32cxmtsh_db/interrupts.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1772662538/tasks.o: ../src/config/pic32cxmtsh_db/tasks.c  .generated_files/flags/pic32cxmtsh_db/a14d672460454b8bbb37e811c5822a7faf71dc70 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1772662538" 
	@${RM} ${OBJECTDIR}/_ext/1772662538/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1772662538/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1772662538/tasks.o.d" -o ${OBJECTDIR}/_ext/1772662538/tasks.o ../src/config/pic32cxmtsh_db/tasks.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1772662538/initialization.o: ../src/config/pic32cxmtsh_db/initialization.c  .generated_files/flags/pic32cxmtsh_db/23a4bf4be98e7fe97ae89fa73d23144b94823641 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1772662538" 
	@${RM} ${OBJECTDIR}/_ext/1772662538/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/1772662538/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1772662538/initialization.o.d" -o ${OBJECTDIR}/_ext/1772662538/initialization.o ../src/config/pic32cxmtsh_db/initialization.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/apdu.o: ../src/gurux/src/apdu.c  .generated_files/flags/pic32cxmtsh_db/6a2fac3df71de3787cc080753717ab8d0e7fc06f .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/apdu.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/apdu.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/apdu.o.d" -o ${OBJECTDIR}/_ext/1550770622/apdu.o ../src/gurux/src/apdu.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/bitarray.o: ../src/gurux/src/bitarray.c  .generated_files/flags/pic32cxmtsh_db/3a2b426949157f80a89b60608f1cdb7db666b80e .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/bitarray.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/bitarray.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/bitarray.o.d" -o ${OBJECTDIR}/_ext/1550770622/bitarray.o ../src/gurux/src/bitarray.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/bytebuffer.o: ../src/gurux/src/bytebuffer.c  .generated_files/flags/pic32cxmtsh_db/a155c51559e330b3d909d24d0793f44df11774f0 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/bytebuffer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/bytebuffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/bytebuffer.o.d" -o ${OBJECTDIR}/_ext/1550770622/bytebuffer.o ../src/gurux/src/bytebuffer.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/ciphering.o: ../src/gurux/src/ciphering.c  .generated_files/flags/pic32cxmtsh_db/e06b3df0db08f37e95b350facc1bc22e3e89ce72 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/ciphering.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/ciphering.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/ciphering.o.d" -o ${OBJECTDIR}/_ext/1550770622/ciphering.o ../src/gurux/src/ciphering.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/client.o: ../src/gurux/src/client.c  .generated_files/flags/pic32cxmtsh_db/f5ed23ad05f9b09bc938627085f1253dc123ba33 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/client.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/client.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/client.o.d" -o ${OBJECTDIR}/_ext/1550770622/client.o ../src/gurux/src/client.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/converters.o: ../src/gurux/src/converters.c  .generated_files/flags/pic32cxmtsh_db/cceb53c5b1c896e5a9a3aecfa0bef14b4e5dd438 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/converters.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/converters.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/converters.o.d" -o ${OBJECTDIR}/_ext/1550770622/converters.o ../src/gurux/src/converters.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/cosem.o: ../src/gurux/src/cosem.c  .generated_files/flags/pic32cxmtsh_db/ed06f2ec3fbf226e7033c3a570f0539740203fee .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/cosem.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/cosem.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/cosem.o.d" -o ${OBJECTDIR}/_ext/1550770622/cosem.o ../src/gurux/src/cosem.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/datainfo.o: ../src/gurux/src/datainfo.c  .generated_files/flags/pic32cxmtsh_db/24ecd7a63277372de54ddaeee321761b4cd25ef7 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/datainfo.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/datainfo.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/datainfo.o.d" -o ${OBJECTDIR}/_ext/1550770622/datainfo.o ../src/gurux/src/datainfo.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/date.o: ../src/gurux/src/date.c  .generated_files/flags/pic32cxmtsh_db/c7b72b75a12bfcd6dcdd67914a5e0995f203dd3 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/date.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/date.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/date.o.d" -o ${OBJECTDIR}/_ext/1550770622/date.o ../src/gurux/src/date.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/dlms.o: ../src/gurux/src/dlms.c  .generated_files/flags/pic32cxmtsh_db/4e8f2be9b19d4c756ebf7d7a06efc5b49316152e .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/dlms.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/dlms.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/dlms.o.d" -o ${OBJECTDIR}/_ext/1550770622/dlms.o ../src/gurux/src/dlms.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/dlmsSettings.o: ../src/gurux/src/dlmsSettings.c  .generated_files/flags/pic32cxmtsh_db/31cf29a39387d92c12ea121baea22eae26302056 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/dlmsSettings.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/dlmsSettings.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/dlmsSettings.o.d" -o ${OBJECTDIR}/_ext/1550770622/dlmsSettings.o ../src/gurux/src/dlmsSettings.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/gxaes.o: ../src/gurux/src/gxaes.c  .generated_files/flags/pic32cxmtsh_db/49f39a8fdca3eac77c7b323e6446ab5c904763d5 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/gxaes.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/gxaes.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/gxaes.o.d" -o ${OBJECTDIR}/_ext/1550770622/gxaes.o ../src/gurux/src/gxaes.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/gxarray.o: ../src/gurux/src/gxarray.c  .generated_files/flags/pic32cxmtsh_db/64d80505d42b11fd7f997f661a0751965656141a .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/gxarray.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/gxarray.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/gxarray.o.d" -o ${OBJECTDIR}/_ext/1550770622/gxarray.o ../src/gurux/src/gxarray.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/gxget.o: ../src/gurux/src/gxget.c  .generated_files/flags/pic32cxmtsh_db/7ef411d516bfb460d55188f687fe6cf64ad88b27 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/gxget.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/gxget.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/gxget.o.d" -o ${OBJECTDIR}/_ext/1550770622/gxget.o ../src/gurux/src/gxget.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/gxinvoke.o: ../src/gurux/src/gxinvoke.c  .generated_files/flags/pic32cxmtsh_db/4a48615a0a120e447bf7c645daa5c2151aa32247 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/gxinvoke.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/gxinvoke.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/gxinvoke.o.d" -o ${OBJECTDIR}/_ext/1550770622/gxinvoke.o ../src/gurux/src/gxinvoke.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/gxkey.o: ../src/gurux/src/gxkey.c  .generated_files/flags/pic32cxmtsh_db/f2380bb25c25103f7c5225fb0b4eb2e6afa02f56 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/gxkey.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/gxkey.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/gxkey.o.d" -o ${OBJECTDIR}/_ext/1550770622/gxkey.o ../src/gurux/src/gxkey.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/gxmd5.o: ../src/gurux/src/gxmd5.c  .generated_files/flags/pic32cxmtsh_db/562c1acb07821c6593e618c74599efe65290c46e .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/gxmd5.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/gxmd5.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/gxmd5.o.d" -o ${OBJECTDIR}/_ext/1550770622/gxmd5.o ../src/gurux/src/gxmd5.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/gxobjects.o: ../src/gurux/src/gxobjects.c  .generated_files/flags/pic32cxmtsh_db/2131ac56ae669532c50b72dea4a3ad953a6b83e3 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/gxobjects.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/gxobjects.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/gxobjects.o.d" -o ${OBJECTDIR}/_ext/1550770622/gxobjects.o ../src/gurux/src/gxobjects.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/gxserializer.o: ../src/gurux/src/gxserializer.c  .generated_files/flags/pic32cxmtsh_db/edd4f2d2c0e8a4892a6f8716d768962426a120d1 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/gxserializer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/gxserializer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/gxserializer.o.d" -o ${OBJECTDIR}/_ext/1550770622/gxserializer.o ../src/gurux/src/gxserializer.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/gxset.o: ../src/gurux/src/gxset.c  .generated_files/flags/pic32cxmtsh_db/684de6640463974ff794a684f60de750509f7b80 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/gxset.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/gxset.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/gxset.o.d" -o ${OBJECTDIR}/_ext/1550770622/gxset.o ../src/gurux/src/gxset.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/gxsetignoremalloc.o: ../src/gurux/src/gxsetignoremalloc.c  .generated_files/flags/pic32cxmtsh_db/c661e2bd0689adc7036c52619dd40598df6a759 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/gxsetignoremalloc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/gxsetignoremalloc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/gxsetignoremalloc.o.d" -o ${OBJECTDIR}/_ext/1550770622/gxsetignoremalloc.o ../src/gurux/src/gxsetignoremalloc.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/gxsetmalloc.o: ../src/gurux/src/gxsetmalloc.c  .generated_files/flags/pic32cxmtsh_db/ef305618a773965794073e94fa35f93ef290e74a .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/gxsetmalloc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/gxsetmalloc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/gxsetmalloc.o.d" -o ${OBJECTDIR}/_ext/1550770622/gxsetmalloc.o ../src/gurux/src/gxsetmalloc.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/gxsha1.o: ../src/gurux/src/gxsha1.c  .generated_files/flags/pic32cxmtsh_db/9cf5345562018f4132e4d87d126434c9fa31eb0f .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/gxsha1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/gxsha1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/gxsha1.o.d" -o ${OBJECTDIR}/_ext/1550770622/gxsha1.o ../src/gurux/src/gxsha1.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/gxsha256.o: ../src/gurux/src/gxsha256.c  .generated_files/flags/pic32cxmtsh_db/daaf86d605b19988ff0d84c02420acd86c86f0e .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/gxsha256.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/gxsha256.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/gxsha256.o.d" -o ${OBJECTDIR}/_ext/1550770622/gxsha256.o ../src/gurux/src/gxsha256.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/gxvalueeventargs.o: ../src/gurux/src/gxvalueeventargs.c  .generated_files/flags/pic32cxmtsh_db/86df51a723320671973139f70595a0c318030b55 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/gxvalueeventargs.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/gxvalueeventargs.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/gxvalueeventargs.o.d" -o ${OBJECTDIR}/_ext/1550770622/gxvalueeventargs.o ../src/gurux/src/gxvalueeventargs.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/helpers.o: ../src/gurux/src/helpers.c  .generated_files/flags/pic32cxmtsh_db/aeaf421bbbc4d45b85617b7288d950f147386db6 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/helpers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/helpers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/helpers.o.d" -o ${OBJECTDIR}/_ext/1550770622/helpers.o ../src/gurux/src/helpers.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/message.o: ../src/gurux/src/message.c  .generated_files/flags/pic32cxmtsh_db/3de9d6a924de25895cbdddbbb6aa58c61ae05391 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/message.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/message.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/message.o.d" -o ${OBJECTDIR}/_ext/1550770622/message.o ../src/gurux/src/message.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/notify.o: ../src/gurux/src/notify.c  .generated_files/flags/pic32cxmtsh_db/b7ffb9ec4fca77d5475f3060dbd112ed419d1808 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/notify.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/notify.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/notify.o.d" -o ${OBJECTDIR}/_ext/1550770622/notify.o ../src/gurux/src/notify.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/objectarray.o: ../src/gurux/src/objectarray.c  .generated_files/flags/pic32cxmtsh_db/bd3eca3972746bddbc001c607866277101fa3b25 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/objectarray.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/objectarray.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/objectarray.o.d" -o ${OBJECTDIR}/_ext/1550770622/objectarray.o ../src/gurux/src/objectarray.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/parameters.o: ../src/gurux/src/parameters.c  .generated_files/flags/pic32cxmtsh_db/e583844e44868fc88226f03db8a867c12ae5b804 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/parameters.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/parameters.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/parameters.o.d" -o ${OBJECTDIR}/_ext/1550770622/parameters.o ../src/gurux/src/parameters.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/replydata.o: ../src/gurux/src/replydata.c  .generated_files/flags/pic32cxmtsh_db/88fe24274707d91ef3dfab5bac5dd5e271d21c9c .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/replydata.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/replydata.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/replydata.o.d" -o ${OBJECTDIR}/_ext/1550770622/replydata.o ../src/gurux/src/replydata.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/server.o: ../src/gurux/src/server.c  .generated_files/flags/pic32cxmtsh_db/22ef67afb919bc0fbb015b720613554e2b1a97ec .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/server.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/server.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/server.o.d" -o ${OBJECTDIR}/_ext/1550770622/server.o ../src/gurux/src/server.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/serverevents.o: ../src/gurux/src/serverevents.c  .generated_files/flags/pic32cxmtsh_db/a75da7068cafafb5a710792567a8d7cf4a828410 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/serverevents.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/serverevents.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/serverevents.o.d" -o ${OBJECTDIR}/_ext/1550770622/serverevents.o ../src/gurux/src/serverevents.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1550770622/variant.o: ../src/gurux/src/variant.c  .generated_files/flags/pic32cxmtsh_db/8e97919b06b68ac6738168f8acdb35e906a3b30f .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1550770622" 
	@${RM} ${OBJECTDIR}/_ext/1550770622/variant.o.d 
	@${RM} ${OBJECTDIR}/_ext/1550770622/variant.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1550770622/variant.o.d" -o ${OBJECTDIR}/_ext/1550770622/variant.o ../src/gurux/src/variant.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app_console.o: ../src/app_console.c  .generated_files/flags/pic32cxmtsh_db/480cb5df98fafbe35ca682ca4b061f27d52b250 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_console.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_console.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app_console.o.d" -o ${OBJECTDIR}/_ext/1360937237/app_console.o ../src/app_console.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app_metrology.o: ../src/app_metrology.c  .generated_files/flags/pic32cxmtsh_db/e596ec5928934bc2bbed9638c5a34a8e9902b9ce .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_metrology.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_metrology.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app_metrology.o.d" -o ${OBJECTDIR}/_ext/1360937237/app_metrology.o ../src/app_metrology.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/pic32cxmtsh_db/ebb8a6fe0d75bc7dbe8901884283373fadb92c53 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app_display.o: ../src/app_display.c  .generated_files/flags/pic32cxmtsh_db/3b7102d48504e5caed786f9622900c6f1fa7425d .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_display.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_display.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app_display.o.d" -o ${OBJECTDIR}/_ext/1360937237/app_display.o ../src/app_display.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app_datalog.o: ../src/app_datalog.c  .generated_files/flags/pic32cxmtsh_db/9c84818fc2164f1da79364c3f6552624052b4436 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_datalog.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_datalog.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app_datalog.o.d" -o ${OBJECTDIR}/_ext/1360937237/app_datalog.o ../src/app_datalog.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app_energy.o: ../src/app_energy.c  .generated_files/flags/pic32cxmtsh_db/fd67f9ac3c2f68abf572b74adadcdb875d54545d .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_energy.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_energy.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app_energy.o.d" -o ${OBJECTDIR}/_ext/1360937237/app_energy.o ../src/app_energy.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app_events.o: ../src/app_events.c  .generated_files/flags/pic32cxmtsh_db/659d51a50cf7efd24d919ed46d91e2fafdee0916 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_events.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_events.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app_events.o.d" -o ${OBJECTDIR}/_ext/1360937237/app_events.o ../src/app_events.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app_control.o: ../src/app_control.c  .generated_files/flags/pic32cxmtsh_db/309d6680b2d4c601a138f77766eec9e3cb6d6d32 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_control.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_control.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app_control.o.d" -o ${OBJECTDIR}/_ext/1360937237/app_control.o ../src/app_control.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app_dlms.o: ../src/app_dlms.c  .generated_files/flags/pic32cxmtsh_db/19ebe2a43e0ca35b19ac07482c2a26593d82ff41 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_dlms.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_dlms.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app_dlms.o.d" -o ${OBJECTDIR}/_ext/1360937237/app_dlms.o ../src/app_dlms.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app_lte.o: ../src/app_lte.c  .generated_files/flags/pic32cxmtsh_db/e68dbc647fefd6f97c4bca11338f0369f9b4bd2c .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_lte.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_lte.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app_lte.o.d" -o ${OBJECTDIR}/_ext/1360937237/app_lte.o ../src/app_lte.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app_plc.o: ../src/app_plc.c  .generated_files/flags/pic32cxmtsh_db/920cbf50bfbd1547a1372d7bce892ef92c2e78c2 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_plc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_plc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app_plc.o.d" -o ${OBJECTDIR}/_ext/1360937237/app_plc.o ../src/app_plc.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app_gurux_dlms_process.o: ../src/app_gurux_dlms_process.c  .generated_files/flags/pic32cxmtsh_db/80e415b176bf5c1c83a335c8a697df767d806db .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_gurux_dlms_process.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_gurux_dlms_process.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app_gurux_dlms_process.o.d" -o ${OBJECTDIR}/_ext/1360937237/app_gurux_dlms_process.o ../src/app_gurux_dlms_process.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app_gurux_meter_value_interface.o: ../src/app_gurux_meter_value_interface.c  .generated_files/flags/pic32cxmtsh_db/e6c34655b7a926585711a8a0a443374139da0bef .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_gurux_meter_value_interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_gurux_meter_value_interface.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app_gurux_meter_value_interface.o.d" -o ${OBJECTDIR}/_ext/1360937237/app_gurux_meter_value_interface.o ../src/app_gurux_meter_value_interface.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app_gurux_process_ee_dummy.o: ../src/app_gurux_process_ee_dummy.c  .generated_files/flags/pic32cxmtsh_db/eb918b418acf115f7ba4c0c9abe0d91ef6cda18d .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_gurux_process_ee_dummy.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_gurux_process_ee_dummy.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app_gurux_process_ee_dummy.o.d" -o ${OBJECTDIR}/_ext/1360937237/app_gurux_process_ee_dummy.o ../src/app_gurux_process_ee_dummy.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app_gurux_process_time.o: ../src/app_gurux_process_time.c  .generated_files/flags/pic32cxmtsh_db/f4917573e83fc0707b8ebd9cf985713a7df53bbf .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_gurux_process_time.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_gurux_process_time.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app_gurux_process_time.o.d" -o ${OBJECTDIR}/_ext/1360937237/app_gurux_process_time.o ../src/app_gurux_process_time.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app_gurux_uart_handdle.o: ../src/app_gurux_uart_handdle.c  .generated_files/flags/pic32cxmtsh_db/ba0accd189f58f52e69a82957cae820499578f64 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_gurux_uart_handdle.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_gurux_uart_handdle.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app_gurux_uart_handdle.o.d" -o ${OBJECTDIR}/_ext/1360937237/app_gurux_uart_handdle.o ../src/app_gurux_uart_handdle.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app_pulse.o: ../src/app_pulse.c  .generated_files/flags/pic32cxmtsh_db/565c2b94cd5be0b768191314ec6565492b7e14c1 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_pulse.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_pulse.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app_pulse.o.d" -o ${OBJECTDIR}/_ext/1360937237/app_pulse.o ../src/app_pulse.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app_optouart.o: ../src/app_optouart.c  .generated_files/flags/pic32cxmtsh_db/1c4684c1e51d4efceb6ac02e750745094e205f2f .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_optouart.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_optouart.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app_optouart.o.d" -o ${OBJECTDIR}/_ext/1360937237/app_optouart.o ../src/app_optouart.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app_pwr_offset.o: ../src/app_pwr_offset.c  .generated_files/flags/pic32cxmtsh_db/7787c7ef38251355fcbfb66149c3771e14e5b1bf .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_pwr_offset.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_pwr_offset.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app_pwr_offset.o.d" -o ${OBJECTDIR}/_ext/1360937237/app_pwr_offset.o ../src/app_pwr_offset.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app_multi_cal.o: ../src/app_multi_cal.c  .generated_files/flags/pic32cxmtsh_db/bf73001ac109444df1f2db5239be408a0cab3026 .generated_files/flags/pic32cxmtsh_db/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_multi_cal.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_multi_cal.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/pic32cxmtsh_db" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/file_system" -I"../src/config/pic32cxmtsh_db/system/fs/fat_fs/hardware_access" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/PIC32CX2051MTSH128_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app_multi_cal.o.d" -o ${OBJECTDIR}/_ext/1360937237/app_multi_cal.o ../src/app_multi_cal.c    -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/PIC32CX-MTSH" ${PACK_COMMON_OPTIONS} 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/20251120a_MTSH_552_DLMS_FLEX0_DBG_FLEX3_Opti.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    ../src/config/pic32cxmtsh_db/PIC32CX2051MTSH128.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -mno-device-startup-code -o ${DISTDIR}/20251120a_MTSH_552_DLMS_FLEX0_DBG_FLEX3_Opti.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=4096,--gc-sections,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}/PIC32CX-MTSH"
	
else
${DISTDIR}/20251120a_MTSH_552_DLMS_FLEX0_DBG_FLEX3_Opti.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   ../src/config/pic32cxmtsh_db/PIC32CX2051MTSH128.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -mno-device-startup-code -o ${DISTDIR}/20251120a_MTSH_552_DLMS_FLEX0_DBG_FLEX3_Opti.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_pic32cxmtsh_db=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=4096,--gc-sections,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}/PIC32CX-MTSH"
	${MP_CC_DIR}\\xc32-bin2hex ${DISTDIR}/20251120a_MTSH_552_DLMS_FLEX0_DBG_FLEX3_Opti.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
	@echo Normalizing hex file
	@"C:/Program Files/Microchip/MPLABX/v6.25/mplab_platform/platform/../mplab_ide/modules/../../bin/hexmate" --edf="C:/Program Files/Microchip/MPLABX/v6.25/mplab_platform/platform/../mplab_ide/modules/../../dat/en_msgs.txt" ${DISTDIR}/20251120a_MTSH_552_DLMS_FLEX0_DBG_FLEX3_Opti.X.${IMAGE_TYPE}.hex -o${DISTDIR}/20251120a_MTSH_552_DLMS_FLEX0_DBG_FLEX3_Opti.X.${IMAGE_TYPE}.hex

endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(wildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
