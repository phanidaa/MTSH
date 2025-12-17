/*******************************************************************************
  MPLAB Harmony Application Source File

  Company:
    Microchip Technology Inc.

  File Name:
    app_optouart.c

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

#include "app_optouart.h"
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
    This structure should be initialized by the APP_OPTOUART_Initialize function.

    Application strings and buffers are be defined outside this structure.
*/

APP_OPTOUART_DATA app_optouartData;

// *****************************************************************************
// *****************************************************************************
// Section: Application Callback Functions
// *****************************************************************************
// *****************************************************************************
void _APP_OPTOUART_ReadCallback(uintptr_t context)
{
    app_optouartData.optical_rx_buf[0] = app_optouartData.optical_rx_byte;
    
    app_optouartData.state = APP_OPTOUART_STATE_OPTIC_RX_RECEIVE;
    
    UART_Read(&app_optouartData.optical_rx_byte,1 );
}


// *****************************************************************************
// *****************************************************************************
// Section: Application Local Functions
// *****************************************************************************
// *****************************************************************************
static bool APP_OPTOUART_PeripheralClockStatus(uint32_t periph_id)
{
    bool retval = false;
    uint32_t status = 0U;
    const uint32_t csr_offset[] = { PMC_CSR0_REG_OFST,
                                    PMC_CSR1_REG_OFST,
                                    PMC_CSR2_REG_OFST,
                                    PMC_CSR3_REG_OFST
                                    };
    uint32_t index = periph_id / 32U;
    if (index < (sizeof(csr_offset)/sizeof(csr_offset[0])))
    {
        status = (*(volatile uint32_t* const)((PMC_BASE_ADDRESS + csr_offset[index])));
        retval = ((status & ((uint32_t)1U << (periph_id % 32U))) != 0U);
    }
    return retval;
}
void APP_OPTOUART_ReInitialized_UART(void)
{
    PMC_REGS->PMC_PCR = PMC_PCR_CMD_Msk |\
                            PMC_PCR_GCLKEN(0) |\
                            PMC_PCR_EN(1) |\
                            PMC_PCR_GCLKDIV(0) |\
                            PMC_PCR_GCLKCSS(0) |\
                            PMC_PCR_PID(ID_UART);
    
    while(APP_OPTOUART_PeripheralClockStatus(ID_UART) == false)
    {
        /* Wait for clock to be initialized */
    }
    
    //reinitialize UART TX and RX PIN.
    /* Port D Peripheral function A configuration */
    PIOD_REGS->PIO_MSKR = 0x6U;
    PIOD_REGS->PIO_CFGR = 0x1U;
    
    UART_Initialize();
    
    //Enable UART optical interface and set the IR carrier to 38Khz
    //UART_REGS->UART_MR |= (UART_MR_OPT_EN_Msk | 0x00130000);
    //UART_REGS->UART_MR |= UART_MR_ACON_Msk|UART_MR_OPT_DMOD_Msk;
    
    //if optical receive is inverted, then need to enable this setting.
    //UART_REGS->UART_MR |= UART_MR_OPT_RXINV_Msk;
    
    //UART_REGS->UART_IER = UART_SR_RXRDY_Msk;
    
    //    NVIC_SetPriority(UART_IRQn, 8);
    //    NVIC_EnableIRQ(UART_IRQn);
}

// *****************************************************************************
// *****************************************************************************
// Section: Application Initialization and State Machine Functions
// *****************************************************************************
// *****************************************************************************

/*******************************************************************************
  Function:
    void APP_OPTOUART_Initialize ( void )

  Remarks:
    See prototype in app_optouart.h.
 */

void APP_OPTOUART_Initialize ( void )
{
    /* Place the App state machine in its initial state. */
    app_optouartData.state = APP_OPTOUART_STATE_INIT;
    
    //need to re-init UART here
    APP_OPTOUART_ReInitialized_UART();
    
    UART_ReadCallbackRegister(_APP_OPTOUART_ReadCallback, 0);
    UART_Read(&app_optouartData.optical_rx_byte, 1);
    
    UART_Write("Opto UART OK\r\n", sizeof ("Opto UART OK\r\n"));
    
    /* TODO: Initialize your application's state machine and other
     * parameters.
     */
}


/******************************************************************************
  Function:
    void APP_OPTOUART_Tasks ( void )

  Remarks:
    See prototype in app_optouart.h.
 */

void APP_OPTOUART_Tasks ( void )
{
    /* Check the application's current state. */
    switch ( app_optouartData.state )
    {
        /* Application's initial state. */
        case APP_OPTOUART_STATE_INIT:
        {
            bool appInitialized = true;

            if (appInitialized)
            {
                app_optouartData.state = APP_OPTOUART_STATE_SERVICE_TASKS;
            }
            break;
        }

        case APP_OPTOUART_STATE_SERVICE_TASKS:
        {

            break;
        }
        
        case APP_OPTOUART_STATE_OPTIC_RX_RECEIVE:
        {
//            FLEXCOM0_USART_Write((uint8_t *) &app_optouartData.optical_rx_buf[0],1); 
//            while(!(FLEXCOM0_USART_TransmitComplete()));
                    
            app_optouartData.state = APP_OPTOUART_STATE_SERVICE_TASKS;
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
