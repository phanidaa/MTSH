/*******************************************************************************
  MPLAB Harmony Application Source File - DDS26D Single-Phase Energy Meter
 *******************************************************************************/

#include "app_display.h"
#include "definitions.h"

// *****************************************************************************
// Section: Global Data Definitions
// *****************************************************************************
APP_DISPLAY_DATA CACHE_ALIGN app_displayData;

// *****************************************************************************
// Section: Application Callback Functions
// *****************************************************************************

static void _APP_DISPLAY_Debounce_Timer_Callback(uintptr_t context) {
    bool button_state = PIO_PinRead(Select_Btn_PIN);

    if (button_state == 0) {
        app_displayData.debounce_confirmed = true;
        app_displayData.scrup_pressed = true;
    }

    app_displayData.debounce_in_progress = false;
    app_displayData.debounce_timer = SYS_TIME_HANDLE_INVALID;
}

static void _APP_DISPLAY_ScrollUp_Callback(PIO_PIN pin, uintptr_t context) {
    if (app_displayData.debounce_in_progress) {
        return;
    }

    app_displayData.debounce_in_progress = true;
    app_displayData.debounce_confirmed = false;

    app_displayData.debounce_timer = SYS_TIME_CallbackRegisterMS(
            _APP_DISPLAY_Debounce_Timer_Callback,
            0,
            50,
            SYS_TIME_SINGLE
            );
}

static void _APP_DISPLAY_Timer_Callback(uintptr_t context) {
    if (--app_displayData.display_time == 0) {
        app_displayData.timerFlag = true;
        app_displayData.display_time = app_displayData.reload_display_time;
    }
}

static void _APP_DISPLAY_Backlight_Timer_Callback(uintptr_t context) {
    if (--app_displayData.backlight_time == 0) {
        app_displayData.backlightTimerFlag = true;
        app_displayData.backlight_time = app_displayData.reload_backlight_time;
    }
}

static void _APP_DISPLAY_Show_HHMMSS_Callback(uintptr_t context) {
    if (--app_displayData.show_hhmmss_time == 0) {
        app_displayData.show_hhmmss_flag = true;
        app_displayData.show_hhmmss_time = 1;
    }
}

// *****************************************************************************
// Section: Application Local Functions
// *****************************************************************************

static status_code_t APP_DISPLAY_InitLCD(void) {
    status_code_t status;
    status = cl010_init();
    if (status != STATUS_OK) {
        return STATUS_ERR_BUSY;
    }
    cl010_show_all();
    return STATUS_OK;
}

static void _APP_DISPLAY_UpdateComSignal(APP_DISPLAY_COM_SIGNAL signal) {
    if (signal == APP_DISPLAY_COM_SIGNAL_OFF) {
        cl010_show_icon(CL010_ICON_COMM_ICON);
        cl010_clear_icon(CL010_ICON_COMM_SIGNAL_LOW);
        cl010_clear_icon(CL010_ICON_COMM_SIGNAL_MED);
        cl010_clear_icon(CL010_ICON_COMM_SIGNAL_HIG);
        cl010_clear_icon(CL010_ICON_COMM_SIGNAL_MAX);
    } else {
        if (signal >= APP_DISPLAY_COM_SIGNAL_LOW) {
            cl010_show_icon(CL010_ICON_COMM_ICON);
            cl010_show_icon(CL010_ICON_COMM_SIGNAL_LOW);
        }
        if (signal >= APP_DISPLAY_COM_SIGNAL_MED) {
            cl010_show_icon(CL010_ICON_COMM_ICON);
            cl010_show_icon(CL010_ICON_COMM_SIGNAL_LOW);
            cl010_show_icon(CL010_ICON_COMM_SIGNAL_MED);
        }
        if (signal == APP_DISPLAY_COM_SIGNAL_HIG) {
            cl010_show_icon(CL010_ICON_COMM_ICON);
            cl010_show_icon(CL010_ICON_COMM_SIGNAL_LOW);
            cl010_show_icon(CL010_ICON_COMM_SIGNAL_HIG);
            cl010_show_icon(CL010_ICON_COMM_SIGNAL_MED);
        }
        if (signal == APP_DISPLAY_COM_SIGNAL_MAX) {
            cl010_show_icon(CL010_ICON_COMM_ICON);
            cl010_show_icon(CL010_ICON_COMM_SIGNAL_LOW);
            cl010_show_icon(CL010_ICON_COMM_SIGNAL_HIG);
            cl010_show_icon(CL010_ICON_COMM_SIGNAL_MED);
            cl010_show_icon(CL010_ICON_COMM_SIGNAL_MAX);
        }
    }
}

static bool APP_DISPLAY_TaskDelay(uint32_t ms, SYS_TIME_HANDLE* handle) {
    if (*handle == SYS_TIME_HANDLE_INVALID) {
        if (SYS_TIME_DelayMS(ms, handle) != SYS_TIME_SUCCESS) {
            return false;
        }
    } else {
        if (SYS_TIME_DelayIsComplete(*handle) == true) {
            *handle = SYS_TIME_HANDLE_INVALID;
            return true;
        }
    }
    return false;
}

static void APP_DISPLAY_SetTimerLoop(uint32_t time_sec) {
    if (time_sec) {
        app_displayData.display_time = time_sec;
        app_displayData.reload_display_time = time_sec;

        if (app_displayData.timer != SYS_TIME_HANDLE_INVALID) {
            SYS_TIME_TimerDestroy(app_displayData.timer);
            app_displayData.timerFlag = false;
        }

        app_displayData.timer = SYS_TIME_CallbackRegisterMS(_APP_DISPLAY_Timer_Callback, 0,
                1000, SYS_TIME_PERIODIC);
        if (app_displayData.timer == SYS_TIME_HANDLE_INVALID) {
        }
    }
}

static void APP_DISPLAY_SetBacklightTimer(uint32_t time_sec) {
    if (time_sec) {
        app_displayData.backlight_time = time_sec;
        app_displayData.reload_backlight_time = time_sec;

        if (app_displayData.backlight_timer != SYS_TIME_HANDLE_INVALID) {
            SYS_TIME_TimerDestroy(app_displayData.backlight_timer);
            app_displayData.backlightTimerFlag = false;
        }

        app_displayData.backlight_timer = SYS_TIME_CallbackRegisterMS(
                _APP_DISPLAY_Backlight_Timer_Callback, 0, 1000, SYS_TIME_PERIODIC);

        if (app_displayData.backlight_timer == SYS_TIME_HANDLE_INVALID) {
        }
    }
}

static void APP_DISPLAY_AddLoopInfo(APP_DISPLAY_INFO info) {
    if ((info < APP_DISPLAY_MAX_TYPE) && (app_displayData.loop_max < APP_DISPLAY_MAX_TYPE)) {
        app_displayData.loop_info[app_displayData.loop_max++] = info;
    }
}

static void APP_DISPLAY_ChangeInfo(void) {
    if (app_displayData.loop_max <= APP_DISPLAY_MAX_TYPE) {
        if ((app_displayData.direction & APP_DISPLAY_FORWARD) == APP_DISPLAY_FORWARD) {
            if (++app_displayData.loop_idx >= app_displayData.loop_max) {
                app_displayData.loop_idx = 0;
            }
        } else if ((app_displayData.direction & APP_DISPLAY_BACKWARD) == APP_DISPLAY_BACKWARD) {
            if (app_displayData.loop_idx == 0) {
                app_displayData.loop_idx = app_displayData.loop_max - 1;
            } else {
                app_displayData.loop_idx--;
            }
        }
        app_displayData.display_info = app_displayData.loop_info[app_displayData.loop_idx];
    }
}

/*******************************************************************************
  Function: Show Data ID Code on upper line (DDS26D Standard)
 */
static void APP_DISPLAY_ShowDataID(uint16_t code) {
    uint8_t buff[9];
    sprintf((char *) buff, "%03u     ", code);
    cl010_show_numeric_string(CL010_LINE_UP, buff);
}

/*******************************************************************************
  Function: Show Energy data and units
 */
static void APP_DISPLAY_ShowEnergyDataUnits(int64_t value) {
    uint8_t buff1[9];
    int64_t kWh_value;

    cl010_show_units(CL010_UNIT_kWh);

    kWh_value = (value + (ENERGY_ACCURACY_INT / 2)) / ENERGY_ACCURACY_INT;
    kWh_value = abs(kWh_value);
    sprintf((char *) buff1, "%8lld", (long long) kWh_value);
    
//    if (kWh_value >= 0) {
//
//        sprintf((char *) buff1, "%8lld", (long long) kWh_value);
//    } else {
//        sprintf((char *) buff1, "-%7lld", (long long) (-kWh_value));
//    }

    cl010_show_numeric_string(CL010_LINE_DOWN, buff1);
}

/*******************************************************************************
  Function: Show Time in HH:MM:SS format (DDS26D Code 002)
 */
static void APP_DISPLAY_ShowTime_HHMMSS(void) {
    uint8_t buff[9];
    struct tm current_time;

    RTC_TimeGet(&current_time);
    sprintf((char *) buff, "  %02d%02d%02d",
            (uint8_t) current_time.tm_hour,
            (uint8_t) current_time.tm_min,
            (uint8_t) current_time.tm_sec);

    cl010_show_numeric_string(CL010_LINE_DOWN, buff);
    cl010_show_icon(CL010_ICON_P7);
    cl010_show_icon(CL010_ICON_P9);
}

/*******************************************************************************
  Function: Show Date in YYMMDD format (DDS26D Code 001)
 */
static void APP_DISPLAY_ShowDate_YYMMDD(void) {
    uint8_t buff[9];
    struct tm current_time;

    RTC_TimeGet(&current_time);
    sprintf((char *) buff, "%04d%02d%02d",
            (current_time.tm_year + 1900),
            (uint8_t) (current_time.tm_mon + 1),
            (uint8_t) (current_time.tm_mday));

    cl010_show_numeric_string(CL010_LINE_DOWN, buff);
    cl010_show_icon(CL010_ICON_P7);
    cl010_show_icon(CL010_ICON_P9);
}

/*******************************************************************************
  Function: Show Meter Type (DDS26D Code 000)
 */
static void APP_DISPLAY_ShowMeterType(void) {
    uint8_t buff[9];
    int model_number = 23;

    sprintf((char *) buff, "    %03u", model_number);
    cl010_show_numeric_string(CL010_LINE_DOWN, buff);
}

/*******************************************************************************
  Function: Show Voltage RMS (DDS26D Code 111) - Single Phase
 */
static void APP_DISPLAY_ShowVoltage_RMS(void) {
    uint32_t value;
    uint8_t buff[9];
    APP_METROLOGY_GetMeasure(MEASURE_UA_RMS, &value, NULL);
    uint32_t divisor = VI_ACCURACY_INT / 10;
    uint32_t rounded_value = (value + (divisor / 2)) / divisor;
    sprintf((char *) buff, "  %5u%01u",
            (unsigned int) (rounded_value / 10),
            (unsigned int) (rounded_value % 10));
    cl010_show_numeric_string(CL010_LINE_DOWN, buff);
    cl010_show_units(CL010_UNIT_V);
    cl010_show_icon(CL010_ICON_P10);

}

/*******************************************************************************
  Function: Show Current RMS (DDS26D Code 121) - Single Phase
 */
static void APP_DISPLAY_ShowCurrent_RMS(void) {
    uint32_t value;
    uint8_t buff[9];

    APP_METROLOGY_GetMeasure(MEASURE_IA_RMS, &value, NULL);
    sprintf((char *) buff, "%5u%03u",
            (unsigned int) (value / VI_ACCURACY_INT),
            (unsigned int) ((value % VI_ACCURACY_INT) / 10));

    cl010_show_numeric_string(CL010_LINE_DOWN, buff);
    cl010_show_units(CL010_UNIT_A);
    cl010_show_icon(CL010_ICON_P8); // Decimal point
}

/*******************************************************************************
  Function: Show Phase Angle (DDS26D Code 141) - Single Phase
 */
static void APP_DISPLAY_ShowPhaseAngle(void) {
    uint32_t value;
    int32_t angle_tenth;
    int32_t angle_int;
    int32_t angle_dec;
    uint8_t buff[9];

    APP_METROLOGY_GetMeasure(MEASURE_ANGLEA, &value, NULL);

    angle_tenth = (int32_t) value / 10;

    if (angle_tenth < 0) {
        angle_tenth += 3600;
    }
    while (angle_tenth >= 3600) {
        angle_tenth -= 3600;
    }

    angle_int = angle_tenth / 10;
    angle_dec = angle_tenth % 10;

    if (angle_int < 0) {
        sprintf((char *) buff, "   -%02d%1d",
                (int) (-angle_int),
                (int) (angle_dec < 0 ? -angle_dec : angle_dec));
    } else {
        sprintf((char *) buff, "    %2d%1d",
                (int) angle_int,
                (int) angle_dec);
    }

    buff[8] = '\0';

    cl010_show_numeric_string(CL010_LINE_DOWN, buff);
    cl010_show_icon(CL010_ICON_P10);
}

/*******************************************************************************
  Function: Show Power Factor (DDS26D Code 150) - Single Phase
  Calculate from PA / SA (Active Power / Apparent Power)
 */
static void APP_DISPLAY_ShowPowerFactor(void) {
    uint32_t active_power, apparent_power;
    uint32_t power_factor;
    uint32_t pf_int, pf_dec;
    uint8_t buff[9];
    int32_t signed_active_power;

    // Single-phase: Use Phase A
    APP_METROLOGY_GetMeasure(MEASURE_PA, &active_power, NULL);
    APP_METROLOGY_GetMeasure(MEASURE_SA, &apparent_power, NULL);

    signed_active_power = (int32_t) active_power;

    if (signed_active_power < 0) {
        signed_active_power = -signed_active_power;
    }

    if (apparent_power > 0) {
        uint64_t temp = ((uint64_t) signed_active_power * 1000) / apparent_power;
        power_factor = (uint32_t) temp;
        if (power_factor > 1000) {
            power_factor = 1000;
        }
    } else {
        power_factor = 0;
    }

    pf_int = power_factor / 1000;
    pf_dec = power_factor % 1000;

    sprintf((char *) buff, "    %1u%03u",
            (unsigned int) pf_int,
            (unsigned int) pf_dec);

    cl010_show_numeric_string(CL010_LINE_DOWN, buff);
    cl010_show_icon(CL010_ICON_P8);
}

/*******************************************************************************
  Function: Show Active Power (DDS26D Code 151) - Single Phase
 */
static void APP_DISPLAY_ShowActivePower(void) {
    int32_t value;
    int32_t kw_int;
    uint32_t kw_dec;
    uint8_t buff[9];
    DRV_METROLOGY_AFE_EVENTS eventFlags;
    bool is_negative = false;

    // Single-phase: Use Phase A
    APP_METROLOGY_GetMeasure(MEASURE_PA, (uint32_t*) & value, NULL);
    APP_EVENTS_GetLastEventFlags(&eventFlags);

    if (eventFlags.ptDir) {
        is_negative = false;
          value = abs(value);
    } else {
        is_negative = true;
         value = abs(value);
    }

    kw_int = value / 1000;
    kw_dec = (value % 1000);

    if (is_negative) {
        sprintf((char *) buff, "-%4d%03u",
                (int) kw_int,
                (unsigned int) kw_dec);
        cl010_show_icon(CL010_ICON_P_MINUS);
    } else {
        sprintf((char *) buff, " %4d%03u",
                (int) kw_int,
                (unsigned int) kw_dec);
        cl010_show_icon(CL010_ICON_P_PLUS);
    }

    cl010_show_numeric_string(CL010_LINE_DOWN, buff);
    cl010_show_units(CL010_UNIT_kW);
    cl010_show_icon(CL010_ICON_PQ);
    cl010_show_icon(CL010_ICON_P8);
}

/*******************************************************************************
  Function: Show Reactive Power (DDS26D Code 152) - Single Phase
 */
static void APP_DISPLAY_ShowReactivePower(void) {
    int32_t value;
    int32_t kvar_int;
    uint32_t kvar_dec;
    uint8_t buff[9];
    DRV_METROLOGY_AFE_EVENTS eventFlags;
    bool is_negative = false;

    // Single-phase: Use Phase A
    APP_METROLOGY_GetMeasure(MEASURE_QA, (uint32_t*) & value, NULL);
    APP_EVENTS_GetLastEventFlags(&eventFlags);

    if (eventFlags.qtDir) {
        is_negative = true;
          value = abs(value);
    } else {
        is_negative = false;
         value = abs(value);
    }

    kvar_int = value / 1000;
    kvar_dec = (value % 1000);

    if (is_negative) {
        sprintf((char *) buff, "-%4d%03u",
                (int) kvar_int,
                (unsigned int) kvar_dec);
    } else {
        sprintf((char *) buff, " %4d%03u",
                (int) kvar_int,
                (unsigned int) kvar_dec);
    }

    cl010_show_numeric_string(CL010_LINE_DOWN, buff);
    cl010_show_units(CL010_UNIT_kVArh);
    cl010_show_icon(CL010_ICON_P8);
}

/*******************************************************************************
  Function: Show Apparent Power - Single Phase
 */
static void APP_DISPLAY_ShowApparentPower(void) {
    uint32_t value;
    uint8_t buff[9];

    // Single-phase: Use Phase A
    APP_METROLOGY_GetMeasure(MEASURE_SA, &value, NULL);

    // Convert to VA
    value = value / 1000;

    sprintf((char *) buff, " %7u", (unsigned int) value);
    cl010_show_numeric_string(CL010_LINE_DOWN, buff);
    cl010_show_units(CL010_UNIT_VA);
}

/*******************************************************************************
  Function: Show Frequency (DDS26D) - Single Phase
 */
static void APP_DISPLAY_ShowFrequency(void) {
    uint32_t value;
    uint8_t buff[9];

    // Use system frequency (or MEASURE_FREQA for Phase A)
    APP_METROLOGY_GetMeasure(MEASURE_FREQ, &value, NULL);

    sprintf((char *) buff, "%5u%03u",
            (unsigned int) (value / FREQ_ACCURACY_INT),
            (unsigned int) ((value % FREQ_ACCURACY_INT)*10));

    cl010_show_numeric_string(CL010_LINE_DOWN, buff);
    cl010_show_units(CL010_UNIT_Hz);
    cl010_show_icon(CL010_ICON_P8);
}

/*******************************************************************************
  Function: Show Battery Voltage (DDS26D Code 666)
 */
static void APP_DISPLAY_ShowBatteryVoltage(void) {
    uint32_t value;
    uint8_t buff[9];

    // TODO: Read from Battery Monitor IC or ADC
    // value = Battery_GetVoltage_mV();
    value = 3300; // Default 3.3V (replace with real reading)

    // Format: "    3.30" (V)
    sprintf((char *) buff, "    %1u%02u",
            (unsigned int) (value / 1000),
            (unsigned int) ((value % 1000) / 10));

    cl010_show_numeric_string(CL010_LINE_DOWN, buff);
    cl010_show_units(CL010_UNIT_V);
    cl010_show_icon(CL010_ICON_P8);

    // Show low battery warning
    if (value < 3000) {
        cl010_show_icon(CL010_ICON_BATTERY_LOW);
    }
}

/*******************************************************************************
  Function: Process information for display - Single Phase Version
 */
static void APP_DISPLAY_Process(void) {
    int64_t total;
    uint8_t buff1[12];
    uint8_t idx;
    uint8_t currentTariff;
    APP_ENERGY_ACCUMULATORS EnergyAcc;
    APP_ENERGY_MAX_DEMAND MaxDemand;
    DRV_METROLOGY_AFE_EVENTS eventFlags;

    if (app_displayData.display_info != 0xFF) {
        cl010_clear_all();
    }

    memset(buff1, 0, sizeof (buff1));
    APP_DISPLAY_Update_Pulse_bar();

    switch (app_displayData.display_info) {

        case APP_DISPLAY_METER_TYPE: // 000 - Meter Type
        {
            APP_DISPLAY_ShowDataID(0);
            APP_DISPLAY_ShowMeterType();
            break;
        }

        case APP_DISPLAY_RTC_DATE: // 001 - Date (YYMMDD)
        {
            APP_DISPLAY_ShowDataID(1);
            APP_DISPLAY_ShowDate_YYMMDD();
            break;
        }

        case APP_DISPLAY_RTC_TIME: // 002 - Time (HHMMSS)
        {
            APP_DISPLAY_ShowDataID(2);
            APP_DISPLAY_ShowTime_HHMMSS();
            break;
        }

        case APP_DISPLAY_TOTAL_ENERGY: // 010 - Total Energy
        {
            APP_DISPLAY_ShowDataID(10);
            APP_ENERGY_GetCurrentEnergy(&EnergyAcc);
            total = 0;
            for (idx = 0; idx < TARIFF_NUM_TYPE; idx++) {
                total += EnergyAcc.tariff[idx];
            }
            APP_DISPLAY_ShowEnergyDataUnits(total);
            break;
        }

        case APP_DISPLAY_TOU1_ENERGY: // 011 - T1 Energy
        {
            APP_DISPLAY_ShowDataID(11);
            APP_ENERGY_GetCurrentEnergy(&EnergyAcc);
            total = EnergyAcc.tariff[0];
            APP_DISPLAY_ShowEnergyDataUnits(total);
            break;
        }

        case APP_DISPLAY_TOU2_ENERGY: // 012 - T2 Energy
        {
            APP_DISPLAY_ShowDataID(12);
            APP_ENERGY_GetCurrentEnergy(&EnergyAcc);
            total = EnergyAcc.tariff[1];
            APP_DISPLAY_ShowEnergyDataUnits(total);
            break;
        }

        case APP_DISPLAY_TOU3_ENERGY: // 013 - T3 Energy
        {
            APP_DISPLAY_ShowDataID(13);
            APP_ENERGY_GetCurrentEnergy(&EnergyAcc);
            total = EnergyAcc.tariff[2];
            APP_DISPLAY_ShowEnergyDataUnits(total);
            break;
        }

        case APP_DISPLAY_TOU4_ENERGY: // 014 - T4 Energy
        {
            APP_DISPLAY_ShowDataID(14);
            APP_ENERGY_GetCurrentEnergy(&EnergyAcc);
            total = EnergyAcc.tariff[3];
            APP_DISPLAY_ShowEnergyDataUnits(total);
            break;
        }

        case APP_DISPLAY_VA_RMS: // 111 - Voltage (Single Phase)
        {
            APP_DISPLAY_ShowDataID(111);
            APP_DISPLAY_ShowVoltage_RMS();
            break;
        }

        case APP_DISPLAY_IA_RMS: // 121 - Current (Single Phase)
        {
            APP_DISPLAY_ShowDataID(121);
            APP_DISPLAY_ShowCurrent_RMS();
            break;
        }

        case APP_DISPLAY_PHASE_ANGLE: // 141 - Phase Angle
        {
            APP_DISPLAY_ShowDataID(141);
            APP_DISPLAY_ShowPhaseAngle();
            break;
        }

        case APP_DISPLAY_POWER_FACTOR: // 150 - Power Factor
        {
            APP_DISPLAY_ShowDataID(150);
            APP_DISPLAY_ShowPowerFactor();
            break;
        }

        case APP_DISPLAY_ACTIVE_POWER: // 151 - Active Power
        {
            APP_DISPLAY_ShowDataID(151);
            APP_DISPLAY_ShowActivePower();
            break;
        }

        case APP_DISPLAY_REACTIVE_POWER: // 152 - Reactive Power
        {
            APP_DISPLAY_ShowDataID(152);
            APP_DISPLAY_ShowReactivePower();
            break;
        }

        case APP_DISPLAY_APPARENT_POWER: // 153 - Apparent Power
        {
            APP_DISPLAY_ShowDataID(153);
            APP_DISPLAY_ShowApparentPower();
            break;
        }

        case APP_DISPLAY_TOTAL_MAX_DEMAND:
        {
            APP_DISPLAY_ShowDataID(20);
            APP_ENERGY_GetCurrentMaxDemand(&MaxDemand);
            sprintf((char *) buff1, "%8u", (unsigned int) MaxDemand.maxDemad.value);
            cl010_show_numeric_string(CL010_LINE_DOWN, buff1);
            cl010_show_units(CL010_UNIT_W);
            cl010_show_icon(CL010_ICONS_T);
            cl010_show_icon(CL010_ICONS_M);
            break;
        }

        case APP_DISPLAY_TOU1_MAX_DEMAND:
        {
            APP_DISPLAY_ShowDataID(21);
            APP_ENERGY_GetCurrentMaxDemand(&MaxDemand);
            sprintf((char *) buff1, "%8u", (unsigned int) MaxDemand.tariff[0].value);
            cl010_show_numeric_string(CL010_LINE_DOWN, buff1);
            cl010_show_units(CL010_UNIT_W);
            cl010_show_icon(CL010_ICONS_T);
            cl010_show_icon(CL010_ICONS_M);
            break;
        }

        case APP_DISPLAY_TOU2_MAX_DEMAND:
        {
            APP_DISPLAY_ShowDataID(22);
            APP_ENERGY_GetCurrentMaxDemand(&MaxDemand);
            sprintf((char *) buff1, "%8u", (unsigned int) MaxDemand.tariff[1].value);
            cl010_show_numeric_string(CL010_LINE_DOWN, buff1);
            cl010_show_units(CL010_UNIT_W);
            cl010_show_icon(CL010_ICONS_T);
            cl010_show_icon(CL010_ICONS_M);
            break;
        }

        case APP_DISPLAY_TOU3_MAX_DEMAND:
        {
            APP_DISPLAY_ShowDataID(23);
            APP_ENERGY_GetCurrentMaxDemand(&MaxDemand);
            sprintf((char *) buff1, "%8u", (unsigned int) MaxDemand.tariff[2].value);
            cl010_show_numeric_string(CL010_LINE_DOWN, buff1);
            cl010_show_units(CL010_UNIT_W);
            cl010_show_icon(CL010_ICONS_T);
            cl010_show_icon(CL010_ICONS_M);
            break;
        }

        case APP_DISPLAY_TOU4_MAX_DEMAND:
        {
            APP_DISPLAY_ShowDataID(24);
            APP_ENERGY_GetCurrentMaxDemand(&MaxDemand);
            sprintf((char *) buff1, "%8u", (unsigned int) MaxDemand.tariff[3].value);
            cl010_show_numeric_string(CL010_LINE_DOWN, buff1);
            cl010_show_units(CL010_UNIT_W);
            cl010_show_icon(CL010_ICONS_T);
            cl010_show_icon(CL010_ICONS_M);
            break;
        }

        case APP_DISPLAY_FREQUENCY: // Frequency
        {
            APP_DISPLAY_ShowDataID(50);
            APP_DISPLAY_ShowFrequency();
            break;
        }

        case APP_DISPLAY_BATTERY_VOLTAGE: // 666 - Battery
        {
            APP_DISPLAY_ShowDataID(666);
            APP_DISPLAY_ShowBatteryVoltage();
            break;
        }

        case APP_DISPLAY_APP_INFO:
        {
            cl010_show_numeric_string(CL010_LINE_DOWN, app_displayData.app_info);
            break;
        }

        case APP_DISPLAY_BOARD_ID:
        {
            sprintf((char *) buff1, "%08x", APP_DISPLAY_BOARD_VERSION);
            cl010_show_numeric_string(CL010_LINE_DOWN, buff1);
            break;
        }

        case APP_DISPLAY_DEMO_VERSION:
        {
            sprintf((char *) buff1, "%d", DEMO_APP_VERSION);
            cl010_show_numeric_string(CL010_LINE_DOWN, buff1);
            break;
        }

        default:
            break;
    }

    if (app_displayData.display_info != APP_DISPLAY_ACTIVE_POWER) {
        APP_EVENTS_GetLastEventFlags(&eventFlags);

        if (eventFlags.ptDir) {
            cl010_show_icon(CL010_ICON_PQ);
            cl010_show_icon(CL010_ICON_P_PLUS);
        } else {
            cl010_show_icon(CL010_ICON_PQ);
            cl010_show_icon(CL010_ICON_P_MINUS);
        }
    }

    currentTariff = APP_ENERGY_GetCurrentTariffIndex();
    cl010_show_icon(CL010_ICONS_T);
    sprintf((char *) buff1, "%u", currentTariff + 1);
    cl010_show_7th_numeric_string(buff1);
    // Update communication signal
    if (app_displayData.comm_signal > APP_DISPLAY_COM_SIGNAL_OFF) {
        _APP_DISPLAY_UpdateComSignal(app_displayData.comm_signal);
    }


}

// *****************************************************************************
// Section: Application Initialization and State Machine
// *****************************************************************************

void APP_DISPLAY_Initialize(void) {
    app_displayData.state = APP_DISPLAY_STATE_INIT;
    app_displayData.timer = SYS_TIME_HANDLE_INVALID;
    app_displayData.backlight_timer = SYS_TIME_HANDLE_INVALID;

    app_displayData.debounce_timer = SYS_TIME_HANDLE_INVALID;
    app_displayData.debounce_in_progress = false;
    app_displayData.debounce_confirmed = false;

    app_displayData.scrdown_pressed = false;
    app_displayData.scrup_pressed = false;

    APP_DISPLAY_InitLCD();

    app_displayData.loop_max = 0;
    app_displayData.loop_idx = 0;

    app_displayData.app_info_en = false;
    memset(app_displayData.app_info, 0, 8);

    app_displayData.direction = APP_DISPLAY_FORWARD;
    app_displayData.display_info = (APP_DISPLAY_INFO) 0xFF;
    app_displayData.comm_signal = APP_DISPLAY_COM_SIGNAL_OFF;

    PIO_PinInterruptCallbackRegister(Select_Btn_PIN,
            _APP_DISPLAY_ScrollUp_Callback, (uintptr_t) NULL);

    DWDT_WDT0_Clear();
    app_displayData.reloadDWDT0 = true;
}

void APP_DISPLAY_Update_Pulse_bar(void) {
    uint32_t tmp = app_pulseData.pulse_cnt;

    cl010_clear_icon(CL010_ICON_S33);
    cl010_clear_icon(CL010_ICON_S32);
    cl010_clear_icon(CL010_ICON_S31);
    cl010_clear_icon(CL010_ICON_S30);
    cl010_clear_icon(CL010_ICON_S29);

    if (tmp > 0)
        cl010_show_icon(CL010_ICON_S33);
    if (tmp > 2)
        cl010_show_icon(CL010_ICON_S32);
    if (tmp > 4)
        cl010_show_icon(CL010_ICON_S31);
    if (tmp > 6)
        cl010_show_icon(CL010_ICON_S30);
    if (tmp > 8)
        cl010_show_icon(CL010_ICON_S29);

    cl010_show_icon(CL010_ICON_S28);
}

void APP_DISPLAY_Tasks(void) {
    if (app_displayData.reloadDWDT0) {
        DWDT_WDT0_Clear();
    }

    switch (app_displayData.state) {
        case APP_DISPLAY_STATE_INIT:
        {
            if (APP_METROLOGY_GetState() == APP_METROLOGY_STATE_RUNNING) {
                /* Configure display measurements for Single-Phase DDS26D */
                APP_DISPLAY_AddLoopInfo(APP_DISPLAY_METER_TYPE); // 000
                APP_DISPLAY_AddLoopInfo(APP_DISPLAY_RTC_DATE); // 001
                APP_DISPLAY_AddLoopInfo(APP_DISPLAY_RTC_TIME); // 002 
                APP_DISPLAY_AddLoopInfo(APP_DISPLAY_TOTAL_ENERGY); // 010
                APP_DISPLAY_AddLoopInfo(APP_DISPLAY_TOU1_ENERGY); // 011
                APP_DISPLAY_AddLoopInfo(APP_DISPLAY_TOU2_ENERGY); // 012
                APP_DISPLAY_AddLoopInfo(APP_DISPLAY_TOU3_ENERGY); // 013
                APP_DISPLAY_AddLoopInfo(APP_DISPLAY_TOU4_ENERGY); // 014
                // Single-phase measurements only
                APP_DISPLAY_AddLoopInfo(APP_DISPLAY_VA_RMS); // 111 - Voltage
                APP_DISPLAY_AddLoopInfo(APP_DISPLAY_IA_RMS); // 121 - Current
                APP_DISPLAY_AddLoopInfo(APP_DISPLAY_PHASE_ANGLE); // 141 - Phase Angle
                APP_DISPLAY_AddLoopInfo(APP_DISPLAY_POWER_FACTOR); // 150 - Power Factor
                APP_DISPLAY_AddLoopInfo(APP_DISPLAY_ACTIVE_POWER); // 151 - Active Power
                APP_DISPLAY_AddLoopInfo(APP_DISPLAY_REACTIVE_POWER); // 152 - Reactive Power
                APP_DISPLAY_AddLoopInfo(APP_DISPLAY_FREQUENCY); // 50  - Frequency
                APP_DISPLAY_AddLoopInfo(APP_DISPLAY_BATTERY_VOLTAGE); // 666 - Battery

                PIO_PinInterruptEnable(Select_Btn_PIN);
                APP_DISPLAY_SetTimerLoop(10);
                LCD_Backlight_Clear();

                app_displayData.show_hhmmss_time = 1;
                app_displayData.show_hhmmss_handle = SYS_TIME_CallbackRegisterMS(
                        _APP_DISPLAY_Show_HHMMSS_Callback, 0, 1000, SYS_TIME_PERIODIC);

                app_displayData.state = APP_DISPLAY_STATE_SERVICE_TASKS;
            }
            break;
        }

        case APP_DISPLAY_STATE_SERVICE_TASKS:
        {
            bool updateDisplay = false;
            bool Communication_IsConnected = false;
            int Communication_GetSignalLevel = 0;

            if (!Communication_IsConnected) {
                APP_DISPLAY_SetCommnicationSignal(APP_DISPLAY_COM_SIGNAL_OFF);
            } else {
                int level = Communication_GetSignalLevel;
                switch (level) {
                    case 1:
                        APP_DISPLAY_SetCommnicationSignal(APP_DISPLAY_COM_SIGNAL_LOW);
                        break;
                    case 2:
                        APP_DISPLAY_SetCommnicationSignal(APP_DISPLAY_COM_SIGNAL_MED);
                        break;
                    case 3:
                        APP_DISPLAY_SetCommnicationSignal(APP_DISPLAY_COM_SIGNAL_HIG);
                        break;
                    case 4:
                        APP_DISPLAY_SetCommnicationSignal(APP_DISPLAY_COM_SIGNAL_MAX);
                        break;
                    default:
                        APP_DISPLAY_SetCommnicationSignal(APP_DISPLAY_COM_SIGNAL_OFF);
                        break;
                }
            }


            if (app_displayData.scrup_pressed) {
                app_displayData.scrup_pressed = false;
                app_displayData.direction = APP_DISPLAY_FORWARD;
                updateDisplay = true;
                LCD_Backlight_Set();
                APP_DISPLAY_SetBacklightTimer(30);
            }

            if (app_displayData.timerFlag) {
                app_displayData.timerFlag = false; // Clear flag
                app_displayData.direction = APP_DISPLAY_FORWARD;
                updateDisplay = true;

            }

            if (updateDisplay) {
                APP_DISPLAY_ChangeInfo();
                APP_DISPLAY_Process();
                APP_DISPLAY_SetTimerLoop(10);
            }


            if (app_displayData.backlightTimerFlag) {
                app_displayData.backlightTimerFlag = false;
                LCD_Backlight_Clear();
                if (app_displayData.backlight_timer != SYS_TIME_HANDLE_INVALID) {
                    SYS_TIME_TimerDestroy(app_displayData.backlight_timer);
                    app_displayData.backlight_timer = SYS_TIME_HANDLE_INVALID;
                }
            }


            if (app_displayData.show_hhmmss_flag) {
                app_displayData.show_hhmmss_flag = false;
                RTC_TimeGet(&app_displayData.show_hhmmss);

                if (app_displayData.display_info == APP_DISPLAY_RTC_TIME) {
                    APP_DISPLAY_Process();
                }
            }

            if (app_displayData.update_pulse_progress_flag) {
                app_displayData.update_pulse_progress_flag = false;
                APP_DISPLAY_Update_Pulse_bar();
            }

            break;
        }

        case APP_DISPLAY_STATE_DELAY_LOW_POWER:
        {
            if (APP_DISPLAY_TaskDelay(100, &app_displayData.timer)) {
                APP_METROLOGY_SetLowPowerMode();
            }
            break;
        }

        default:
        {
            break;
        }
    }
}

void APP_DISPLAY_SetAppInfo(const char *msg, uint8_t len) {
    if (len > sizeof (app_displayData.app_info)) {
        len = sizeof (app_displayData.app_info);
    }

    memcpy(app_displayData.app_info, msg, len);

    if (!app_displayData.app_info_en) {
        app_displayData.app_info_en = true;
        APP_DISPLAY_AddLoopInfo(APP_DISPLAY_APP_INFO);
    }

    app_displayData.display_time = app_displayData.reload_display_time;
    app_displayData.display_info = APP_DISPLAY_APP_INFO;
}

void APP_DISPLAY_SetSerialCommunication(void) {
    cl010_show_icon(CL010_ICON_SerialCom);
}

void APP_DISPLAY_SetCommnicationSignal(APP_DISPLAY_COM_SIGNAL signal) {
    app_displayData.comm_signal = signal;
    _APP_DISPLAY_UpdateComSignal(signal);
}

void APP_DISPLAY_ShowLowPowerMode(void) {
    cl010_clear_all();
    cl010_show_icon(CL010_ICON_BATTERY_LOW);
}

/*******************************************************************************
 End of File
 */