/*******************************************************************************
  MPLAB Harmony Application Header File

  Company:
    Microchip Technology Inc.

  File Name:
    app_control.h

  Summary:
    This header file provides prototypes and definitions for the application.

  Description:
    This header file provides function prototypes and data type definitions for
    the application.  Some of these are required by the system (such as the
    "APP_CONTROL_Initialize" and "APP_CONTROL_Tasks" prototypes) and some of them are only used
    internally by the application (such as the "APP_CONTROL_STATES" definition).  Both
    are defined here for convenience.
*******************************************************************************/

#ifndef _APP_CONTROL_H
#define _APP_CONTROL_H

// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************

#include <stdint.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdlib.h>
#include "configuration.h"
#include "definitions.h"
// DOM-IGNORE-BEGIN
#ifdef __cplusplus  // Provide C++ Compatibility

extern "C" {

#endif
// DOM-IGNORE-END

// *****************************************************************************
// *****************************************************************************
// Section: Type Definitions
// *****************************************************************************
// *****************************************************************************

// *****************************************************************************
/* Application states

  Summary:
    Application states enumeration

  Description:
    This enumeration defines the valid application states.  These states
    determine the behavior of the application at various times.
*/

typedef enum
{
    /* Application's state machine's initial state. */
    APP_CONTROL_STATE_INIT=0,
    APP_CONTROL_STATE_SERVICE_TASKS,
    APP_CONTROL_STATE_RELAY_ON,
    APP_CONTROL_STATE_RELAY_OFF, 
    APP_CONTROL_START_WAIT_RELAY_TIME,
    APP_CONTROL_START_WAIT_ZERO_CROSSING_TIME,
    /* TODO: Define states used by the application state machine. */

} APP_CONTROL_STATES;


// *****************************************************************************
/* Application Data

  Summary:
    Holds application data

  Description:
    This structure holds the application's data.

  Remarks:
    Application strings and buffers are be defined outside this structure.
 */

typedef struct
{
    /* The application's current state */
    APP_CONTROL_STATES state;
    bool        relay_on_flag;
    bool        relay_off_flag;
    bool        zero_crossing_flag;
    uint32_t    systick_1ms_cnt;
    /* TODO: Define any additional data used by the application. */
    
    uint8_t prtbuf[0xff];
    uint8_t prtlen;
    struct tm current_time;

} APP_CONTROL_DATA;

// *****************************************************************************
// *****************************************************************************
// Section: Application Callback Routines
// *****************************************************************************
// *****************************************************************************
/* These routines are called by drivers when certain events occur.
*/

// *****************************************************************************
// *****************************************************************************
// Section: Application Initialization and State Machine Functions
// *****************************************************************************
// *****************************************************************************

/*******************************************************************************
  Function:
    void APP_CONTROL_Initialize ( void )

  Summary:
     MPLAB Harmony application initialization routine.

  Description:
    This function initializes the Harmony application.  It places the
    application in its initial state and prepares it to run so that its
    APP_CONTROL_Tasks function can be called.

  Precondition:
    All other system initialization routines should be called before calling
    this routine (in "SYS_Initialize").

  Parameters:
    None.

  Returns:
    None.

  Example:
    <code>
    APP_CONTROL_Initialize();
    </code>

  Remarks:
    This routine must be called from the SYS_Initialize function.
*/

void APP_CONTROL_Initialize ( void );


/*******************************************************************************
  Function:
    void APP_CONTROL_Tasks ( void )

  Summary:
    MPLAB Harmony Demo application tasks function

  Description:
    This routine is the Harmony Demo application's tasks function.  It
    defines the application's state machine and core logic.

  Precondition:
    The system and application initialization ("SYS_Initialize") should be
    called before calling this.

  Parameters:
    None.

  Returns:
    None.

  Example:
    <code>
    APP_CONTROL_Tasks();
    </code>

  Remarks:
    This routine must be called from SYS_Tasks() routine.
 */

void APP_CONTROL_Tasks( void );
bool APP_CONTROL_Relay_On(void);
bool APP_CONTROL_Relay_Off(void);
extern APP_CONTROL_DATA app_controlData;

//DOM-IGNORE-BEGIN
#ifdef __cplusplus
}
#endif
//DOM-IGNORE-END

#endif /* _APP_CONTROL_H */

/*******************************************************************************
 End of File
 */

