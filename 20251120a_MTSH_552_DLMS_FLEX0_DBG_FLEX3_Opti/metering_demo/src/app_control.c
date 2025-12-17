/*******************************************************************************
  MPLAB Harmony Application Source File

  Company:
    Microchip Technology Inc.

  File Name:
    app_control.c

  Summary:
    This file contains the source code for the MPLAB Harmony application.

  Description:
    This file contains the source code for the MPLAB Harmony application.  It
    implements the logic of the application's state machine and it may call
    API routines of other MPLAB Harmony modules in the system, such as drivers,
    system services, and middleware.  However, it does not call any of the
    system interfaces (such as the "Initialize" and "Tasks" functions) of any of
    the modules in the system or make any assumptions about when those functions
    are called.  That is the responsibility of the configuration-specific system
    files.
 *******************************************************************************/

// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************

#include "app_control.h"
#include "definitions.h"
// *****************************************************************************
// *****************************************************************************
// Section: Global Data Definitions
// *****************************************************************************
// *****************************************************************************

// *****************************************************************************
/* Application Data

  Summary:
    Holds application data

  Description:
    This structure holds the application's data.

  Remarks:
    This structure should be initialized by the APP_CONTROL_Initialize function.

    Application strings and buffers are be defined outside this structure.
*/

APP_CONTROL_DATA app_controlData;

// *****************************************************************************
// *****************************************************************************
// Section: Application Callback Functions
// *****************************************************************************
// *****************************************************************************
void _APP_CONTROL_SysTick_Callback(void)
{
    app_controlData.systick_1ms_cnt++;
}
/* TODO:  Add any necessary callback functions.
*/

// *****************************************************************************
// *****************************************************************************
// Section: Application Local Functions
// *****************************************************************************
// *****************************************************************************

bool APP_CONTROL_Relay_On(void)
{
    app_controlData.state = APP_CONTROL_STATE_RELAY_ON;
    return true;
}
bool APP_CONTROL_Relay_Off(void)
{
    app_controlData.state = APP_CONTROL_STATE_RELAY_OFF;
    return true;
}


// *****************************************************************************
// *****************************************************************************
// Section: Application Initialization and State Machine Functions
// *****************************************************************************
// *****************************************************************************

/*******************************************************************************
  Function:
    void APP_CONTROL_Initialize ( void )

  Remarks:
    See prototype in app_control.h.
 */

void APP_CONTROL_Initialize ( void )
{
    /* Place the App state machine in its initial state. */
    app_controlData.state = APP_CONTROL_STATE_INIT;

    app_controlData.relay_on_flag = false;    
    app_controlData.relay_off_flag = false;
    app_controlData.zero_crossing_flag = false;
    
    /* TODO: Initialize your application's state machine and other
     * parameters.
     */
}


/******************************************************************************
  Function:
    void APP_CONTROL_Tasks ( void )

  Remarks:
    See prototype in app_control.h.
 */

void APP_CONTROL_Tasks ( void )
{

    /* Check the application's current state. */
    switch ( app_controlData.state )
    {
        /* Application's initial state. */
        case APP_CONTROL_STATE_INIT:
        {
            bool appInitialized = true;


            if (appInitialized)
            {

                app_controlData.state = APP_CONTROL_STATE_SERVICE_TASKS;
                
                switch (RSTC_ResetCauseGet()) {
                    case RSTC_SR_RSTTYP_GENERAL_RST:
                        app_controlData.prtlen = sprintf((char *) app_controlData.prtbuf, (const char *) "\r\n0.RSTC_SR_RSTTYP_GENERAL_RST \r\n");
                        //FLEXCOM0_USART_Write(app_controlData.prtbuf, app_controlData.prtlen);
                        while (!(FLEXCOM0_USART_TransmitComplete()));
                        break;
                    case RSTC_SR_RSTTYP_BACKUP_RST:
                        app_controlData.prtlen = sprintf((char *) app_controlData.prtbuf, (const char *) "\r\n1.RSTC_SR_RSTTYP_BACKUP_RST \r\n");
                        //FLEXCOM0_USART_Write(app_controlData.prtbuf, app_controlData.prtlen);
                        while (!(FLEXCOM0_USART_TransmitComplete()));
                        break;
                    case RSTC_SR_RSTTYP_WDT0_RST:
                        app_controlData.prtlen = sprintf((char *) app_controlData.prtbuf, (const char *) "\r\n2.RSTC_SR_RSTTYP_WDT0_RST \r\n");
                        //FLEXCOM0_USART_Write(app_controlData.prtbuf, app_controlData.prtlen);
                        while (!(FLEXCOM0_USART_TransmitComplete()));
                        break;
                    case RSTC_SR_RSTTYP_SOFT_RST:
                        app_controlData.prtlen = sprintf((char *) app_controlData.prtbuf, (const char *) "\r\n3.RSTC_SR_RSTTYP_SOFT_RST \r\n");
                        //FLEXCOM0_USART_Write(app_controlData.prtbuf, app_controlData.prtlen);
                        while (!(FLEXCOM0_USART_TransmitComplete()));
                        break;
                    case RSTC_SR_RSTTYP_USER_RST:
                        app_controlData.prtlen = sprintf((char *) app_controlData.prtbuf, (const char *) "\r\n4.RSTC_SR_RSTTYP_USER_RST \r\n");
                        //FLEXCOM0_USART_Write(app_controlData.prtbuf, app_controlData.prtlen);
                        while (!(FLEXCOM0_USART_TransmitComplete()));
                        break;
                    case RSTC_SR_RSTTYP_CORE_SM_RST:
                        app_controlData.prtlen = sprintf((char *) app_controlData.prtbuf, (const char *) "\r\n5.RSTC_SR_RSTTYP_CORE_SM_RST \r\n");
                        //FLEXCOM0_USART_Write(app_controlData.prtbuf, app_controlData.prtlen);
                        while (!(FLEXCOM0_USART_TransmitComplete()));
                        break;
                    case RSTC_SR_RSTTYP_CPU_FAIL_RST:
                        app_controlData.prtlen = sprintf((char *) app_controlData.prtbuf, (const char *) "\r\n6.RSTC_SR_RSTTYP_CPU_FAIL_RST \r\n");
                        //FLEXCOM0_USART_Write(app_controlData.prtbuf, app_controlData.prtlen);
                        while (!(FLEXCOM0_USART_TransmitComplete()));
                        break;
                    case RSTC_SR_RSTTYP_SLCK_XTAL_RST:
                        app_controlData.prtlen = sprintf((char *) app_controlData.prtbuf, (const char *) "\r\n7.RSTC_SR_RSTTYP_SLCK_XTAL_RST \r\n");
                        //FLEXCOM0_USART_Write(app_controlData.prtbuf, app_controlData.prtlen);
                        while (!(FLEXCOM0_USART_TransmitComplete()));
                        break;
                    case RSTC_SR_RSTTYP_WDT1_RST:
                        app_controlData.prtlen = sprintf((char *) app_controlData.prtbuf, (const char *) "\r\n8.RSTC_SR_RSTTYP_WDT1_RST \r\n");
                        //FLEXCOM0_USART_Write(app_controlData.prtbuf, app_controlData.prtlen);
                        while (!(FLEXCOM0_USART_TransmitComplete()));
                        break;
                    case RSTC_SR_RSTTYP_PORVDD3V3_RST:
                        app_controlData.prtlen = sprintf((char *) app_controlData.prtbuf, (const char *) "\r\n9.RSTC_SR_RSTTYP_PORVDD3V3_RST \r\n");
                        //FLEXCOM0_USART_Write(app_controlData.prtbuf, app_controlData.prtlen);
                        while (!(FLEXCOM0_USART_TransmitComplete()));
                        break;
                 
                    }
                RTC_TimeGet(&app_controlData.current_time);
                app_controlData.prtlen=sprintf((char *)app_controlData.prtbuf, (const char *) "Time: %02u:%02u:%02u \r\n", (unsigned int)app_controlData.current_time.tm_hour, 
                        (unsigned int)app_controlData.current_time.tm_min, (unsigned int)app_controlData.current_time.tm_sec);
                //FLEXCOM0_USART_Write(app_controlData.prtbuf,app_controlData.prtlen); while(!(FLEXCOM0_USART_TransmitComplete()));
                
            }
            break;
        }

        case APP_CONTROL_STATE_SERVICE_TASKS:
        {

            break;
        }
        
        case APP_CONTROL_STATE_RELAY_ON:
        {
            Relay_OnOff_Set();
            app_controlData.relay_on_flag = true; 
            app_controlData.relay_off_flag = false;
            app_controlData.systick_1ms_cnt = 0;
            app_controlData.state = APP_CONTROL_START_WAIT_RELAY_TIME;
            break;
        }
        
        case APP_CONTROL_STATE_RELAY_OFF:
        {
            Relay_OnOff_Clear();
            app_controlData.relay_off_flag = true; 
            app_controlData.relay_on_flag = false; 
            app_controlData.systick_1ms_cnt = 0;
            app_controlData.state = APP_CONTROL_START_WAIT_RELAY_TIME;
            break;
        }
        
        case APP_CONTROL_START_WAIT_RELAY_TIME:
        {
            if(app_controlData.systick_1ms_cnt > 200)       //200ms
            {
                if((app_controlData.relay_on_flag == true) || (app_controlData.relay_off_flag == true))
                {
                    //reach 200ms time, check zero crossing
                    app_controlData.zero_crossing_flag = false;
                    app_controlData.state = APP_CONTROL_START_WAIT_ZERO_CROSSING_TIME;
                }
                else
                    app_controlData.state = APP_CONTROL_STATE_SERVICE_TASKS;
            }
            break;
        }
        
        case APP_CONTROL_START_WAIT_ZERO_CROSSING_TIME:
        {
            if(app_controlData.zero_crossing_flag == true)
            {
                if(app_controlData.relay_on_flag == true)
                {
                      Relay_Enable_Set();  
                      app_controlData.relay_on_flag = false;
                }
                if(app_controlData.relay_off_flag == true)
                {
                      Relay_Enable_Clear();  
                      app_controlData.relay_off_flag = false;
                }
                app_controlData.state = APP_CONTROL_STATE_SERVICE_TASKS;
            }
            break;
        }
        

        /* TODO: implement your application state machine.*/


        /* The default state should never be executed. */
        default:
        {
            /* TODO: Handle error in application's state machine. */
            break;
        }
    }
}


/*******************************************************************************
 End of File
 */
