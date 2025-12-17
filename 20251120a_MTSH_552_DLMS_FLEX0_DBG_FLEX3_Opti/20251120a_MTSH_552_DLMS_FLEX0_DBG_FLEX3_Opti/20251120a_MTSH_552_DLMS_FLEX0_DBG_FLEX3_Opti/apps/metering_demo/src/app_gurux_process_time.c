#include "definitions.h"
#include "app_gurux_process_time.h"
#include "gurux/include/dlmssettings.h"
#include "gurux/include/gxobjects.h"

extern gxClock clock1;
// *****************************************************************************
// *****************************************************************************
long time_current(void)
{
    uint32_t epoch_sec, epoch_hr, epoch_min;
    struct tm tm;

    RTC_TimeGet(&tm);

    // LOG_APP_DEMO_WDG0_DEBUG(("DateTime: %d/%d/%d %d:%d:%d\r\n", 
    // 	tm.tm_mday, tm.tm_mon + 1, tm.tm_year + 1900, 
    // 	tm.tm_hour, tm.tm_min, tm.tm_sec));
        
    epoch_sec = tm.tm_sec;						//1
    epoch_min = tm.tm_min * 60;					//2
    epoch_hr = tm.tm_hour * 3600;				//3
    epoch_sec = epoch_sec + epoch_min + epoch_hr;	//4

    epoch_min = tm.tm_mday * 86400;				//5
    epoch_hr = (tm.tm_year - 70) * 31536000;	//6
    epoch_min = epoch_min + epoch_hr;			//7
    epoch_hr = ((tm.tm_year - 69) / 4) * 86400;	//8
    epoch_min = epoch_min + epoch_hr;			//9
    epoch_sec = epoch_sec + epoch_min;			//10

    epoch_min = ((tm.tm_year - 1) / 100) * 86400;	//11
    epoch_sec = epoch_sec - epoch_min;			//12
    epoch_min = ((tm.tm_year + 299) / 400) * 86400;	//13
    epoch_sec = epoch_sec + epoch_min;			//14

    // Get current time somewhere.
    return (long)epoch_sec;
}

// *****************************************************************************
// *****************************************************************************
time_t presentTime(void)
{
    time_t epoch;
    struct tm tm;

    /* Update RTC timestamp */
    RTC_TimeGet(&tm);

   /* Convert to epoch time */
    epoch = mktime(&tm);

    return epoch;
}

// *****************************************************************************
// *****************************************************************************
uint32_t time_elapsed(void)
{
    return (long)0; // millis();
}

uint8_t Month_DayTable_gx[12] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

// *****************************************************************************
// *****************************************************************************
void time_now(gxtime* value)
{
    struct tm tm;

    RTC_TimeGet(&tm);

    time_init2(value, &tm);
}

