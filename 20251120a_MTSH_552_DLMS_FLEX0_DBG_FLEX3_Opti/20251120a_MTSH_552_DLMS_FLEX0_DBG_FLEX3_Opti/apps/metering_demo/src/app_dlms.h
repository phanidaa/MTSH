/*******************************************************************************
  MPLAB Harmony Application Header File

  Company:
    Microchip Technology Inc.

  File Name:
    app_dlms.h

  Summary:
    This header file provides prototypes and definitions for the application.

  Description:
    This header file provides function prototypes and data type definitions for
    the application.  Some of these are required by the system (such as the
    "APP_DLMS_Initialize" and "APP_DLMS_Tasks" prototypes) and some of them are only used
    internally by the application (such as the "APP_DLMS_STATES" definition).  Both
    are defined here for convenience.
*******************************************************************************/

#ifndef _APP_DLMS_H
#define _APP_DLMS_H

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
    APP_DLMS_STATE_INIT=0,
    APP_DLMS_STATE_SERVICE_TASKS,
    /* TODO: Define states used by the application state machine. */

} APP_DLMS_STATES;


// *****************************************************************************
/* Application Data

  Summary:
    Holds application data

  Description:
    This structure holds the application's data.

  Remarks:
    Application strings and buffers are be defined outside this structure.
 */
#define UART_TXRX_BUF_SIZE         1024

typedef struct
{
    /* The application's current state */
    APP_DLMS_STATES state;

    uint8_t        dlms_uart_rx_buf[UART_TXRX_BUF_SIZE];
    uint8_t        dlms_uart_tx_buf[UART_TXRX_BUF_SIZE];
    uint16_t       dlms_uart_rx_buf_idx;
    uint16_t       dlms_uart_tx_buf_idx;
    uint16_t       dlms_uart_rx_buf_len;
    uint16_t       dlms_uart_tx_buf_len;
    uint8_t        dlms_uart_rx_byte;
    uint8_t        dlms_uart_tx_byte;
    uint16_t       dlms_uart_rx_buf_gurux_idx; 
    
    uint8_t        dlms_uart_rx_byte_gurux;

} APP_DLMS_DATA;

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
    void APP_DLMS_Initialize ( void )

  Summary:
     MPLAB Harmony application initialization routine.

  Description:
    This function initializes the Harmony application.  It places the
    application in its initial state and prepares it to run so that its
    APP_DLMS_Tasks function can be called.

  Precondition:
    All other system initialization routines should be called before calling
    this routine (in "SYS_Initialize").

  Parameters:
    None.

  Returns:
    None.

  Example:
    <code>
    APP_DLMS_Initialize();
    </code>

  Remarks:
    This routine must be called from the SYS_Initialize function.
*/

void APP_DLMS_Initialize ( void );


/*******************************************************************************
  Function:
    void APP_DLMS_Tasks ( void )

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
    APP_DLMS_Tasks();
    </code>

  Remarks:
    This routine must be called from SYS_Tasks() routine.
 */

void APP_DLMS_Tasks( void );

//DOM-IGNORE-BEGIN
#ifdef __cplusplus
}
#endif
//DOM-IGNORE-END

#endif /* _APP_DLMS_H */

/*******************************************************************************
 End of File
 */

