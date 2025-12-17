/*******************************************************************************
  MPLAB Harmony Application Source File

  Company:
    Microchip Technology Inc.

  File Name:
    app_pulse.c

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

#include "app_pulse.h"
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
    This structure should be initialized by the APP_PULSE_Initialize function.

    Application strings and buffers are be defined outside this structure.
*/

APP_PULSE_DATA app_pulseData;

// *****************************************************************************
// *****************************************************************************
// Section: Application Callback Functions
// *****************************************************************************
// *****************************************************************************

/* TODO:  Add any necessary callback functions.
*/
void APP_PULSE_Pulse0_Timer_Callback ( uintptr_t context) 
{
    if (app_pulseData.pulse_output_clear_flag == false) 
    {
        if (--app_pulseData.pulse_timer == 0) 
        {
            app_pulseData.pulse_output_clear_flag = true;
            Pulse_Output_Clear();
            //SYSTICK_TimerStop();
        }
    }
}

void APP_PULSE_Pulse0_Input_Callback ( PIO_PIN pin, uintptr_t context)
{
    app_pulseData.pulse_cnt++;
    
    if(app_pulseData.pulse_cnt > 10)
    {
        Pulse_Output_Set();
        app_pulseData.pulse_cnt /= 10;
        app_pulseData.pulse_timer = 2;              // value x 500us
        app_pulseData.pulse_output_clear_flag = false;
        //SYSTICK_TimerRestart();
    }
    app_displayData.update_pulse_progress_flag = true;

}


// *****************************************************************************
// *****************************************************************************
// Section: Application Local Functions
// *****************************************************************************
// *****************************************************************************


/* TODO:  Add any necessary local functions.
*/


// *****************************************************************************
// *****************************************************************************
// Section: Application Initialization and State Machine Functions
// *****************************************************************************
// *****************************************************************************

/*******************************************************************************
  Function:
    void APP_PULSE_Initialize ( void )

  Remarks:
    See prototype in app_pulse.h.
 */

void APP_PULSE_Initialize ( void )
{
    /* Place the App state machine in its initial state. */
    app_pulseData.state = APP_PULSE_STATE_INIT;

    PIO_PinInterruptCallbackRegister(Pulse_Input_PIN, APP_PULSE_Pulse0_Input_Callback, (uintptr_t)NULL);
    PIO_PinInterruptEnable(Pulse_Input_PIN);
    
    app_pulseData.pulse_cnt = 0;
    app_pulseData.pulse_timer = 00;
    app_pulseData.pulse0_timer_handle = SYS_TIME_CallbackRegisterUS(APP_PULSE_Pulse0_Timer_Callback, 0,500, SYS_TIME_PERIODIC);
    //SYSTICK_TimerCallbackSet(APP_PULSE_Pulse0_Timer_Callback,0);
    /* TODO: Initialize your application's state machine and other
     * parameters.
     */
}


/******************************************************************************
  Function:
    void APP_PULSE_Tasks ( void )

  Remarks:
    See prototype in app_pulse.h.
 */

void APP_PULSE_Tasks ( void )
{

    /* Check the application's current state. */
    switch ( app_pulseData.state )
    {
        /* Application's initial state. */
        case APP_PULSE_STATE_INIT:
        {
            bool appInitialized = true;


            if (appInitialized)
            {

                app_pulseData.state = APP_PULSE_STATE_SERVICE_TASKS;
            }
            break;
        }

        case APP_PULSE_STATE_SERVICE_TASKS:
        {
            
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
