/*******************************************************************************
  MPLAB Harmony Application Header File

  Company:
    PEA AMI Project

  File Name:
    app_lte.h

  Summary:
    LTE A7683E Module - DLMS Meter TCP Server (PEA AMI Network)

  Description:
    Based on SIMCom A76XX Series TCPIP Application Note V1.05
    
    DLMS Meter = TCP SERVER (?? HES ?? connect)
    HES = TCP CLIENT (connect ???? meter)
    
    APN: pea.ami.poc (No authentication required)
    Server Port: 4059 (DLMS default)
*******************************************************************************/

#ifndef _APP_LTE_H
#define _APP_LTE_H

#include <stdint.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#include <stdio.h>
#include "configuration.h"

#ifdef __cplusplus
extern "C" {
#endif

// *****************************************************************************
// Section: Hardware Configuration
// *****************************************************************************

#define LTE_USART_WRITE             FLEXCOM6_USART_Write
#define LTE_USART_READ              FLEXCOM6_USART_Read
#define LTE_USART_READ_CALLBACK     FLEXCOM6_USART_ReadCallbackRegister
#define LTE_USART_IS_BUSY           FLEXCOM6_USART_WriteIsBusy

// *****************************************************************************
// Section: Buffer Configuration
// *****************************************************************************

#define LTE_TX_BUFFER_SIZE          512
#define LTE_RX_BUFFER_SIZE          512
#define LTE_DLMS_BUFFER_SIZE        256

// *****************************************************************************
// Section: Timeout Configuration (milliseconds)
// *****************************************************************************

#define LTE_TIMEOUT_SHORT           3000
#define LTE_TIMEOUT_MEDIUM          10000
#define LTE_TIMEOUT_LONG            30000
#define LTE_TIMEOUT_NETOPEN         120000
#define LTE_TIMEOUT_SEND            120000

// *****************************************************************************
// Section: Retry Configuration
// *****************************************************************************

#define LTE_MAX_RETRIES             3
#define LTE_RECONNECT_DELAY         5000

// *****************************************************************************
// Section: PEA AMI Network Configuration
// *****************************************************************************

// APN - PEA Private Network (No username/password)
#define LTE_APN                     "pea.ami.poc"

// TCP Server Configuration (Meter listens on this port)
#define LTE_SERVER_PORT             4059        // DLMS default port
#define LTE_SERVER_INDEX            0           // Server index 0

// *****************************************************************************
// Section: Debug Configuration
// *****************************************************************************

// Debug Levels: 0=Off, 1=Minimal (errors/important), 2=Full
#define LTE_DEBUG_LEVEL             1

#if LTE_DEBUG_LEVEL >= 2
    // Full debug - all messages
    #define LTE_DEBUG(fmt, ...)     SYS_CONSOLE_Print(SYS_CONSOLE_INDEX_0, "[LTE] " fmt "\r\n", ##__VA_ARGS__)
    #define LTE_DEBUG_VERBOSE(fmt, ...) SYS_CONSOLE_Print(SYS_CONSOLE_INDEX_0, "[LTE] " fmt "\r\n", ##__VA_ARGS__)
#elif LTE_DEBUG_LEVEL == 1
    // Minimal debug - important messages only
    #define LTE_DEBUG(fmt, ...)     SYS_CONSOLE_Print(SYS_CONSOLE_INDEX_0, "[LTE] " fmt "\r\n", ##__VA_ARGS__)
    #define LTE_DEBUG_VERBOSE(fmt, ...)  // Disabled
#else
    // All debug off
    #define LTE_DEBUG(fmt, ...)
    #define LTE_DEBUG_VERBOSE(fmt, ...)
#endif

// *****************************************************************************
// Section: Type Definitions
// *****************************************************************************

// State Machine
typedef enum
{
    LTE_STATE_INIT = 0,
    LTE_STATE_WAIT_POWERUP,
    LTE_STATE_CHECK_AT,
    LTE_STATE_DISABLE_ECHO,
    LTE_STATE_CHECK_SIM,
    LTE_STATE_CHECK_NETWORK,
    LTE_STATE_CHECK_SIGNAL,
    LTE_STATE_CONFIG_APN,
    LTE_STATE_CHECK_NETOPEN,    // ?????????? network ???????????
    LTE_STATE_NETCLOSE,         // ??? network ???? (???????????)
    LTE_STATE_NETOPEN,
    LTE_STATE_WAIT_NETOPEN,
    LTE_STATE_GET_IP,
    LTE_STATE_SET_RXGET_MODE,
    LTE_STATE_SERVER_START,
    LTE_STATE_WAIT_SERVER,
    LTE_STATE_SERVER_READY,         // TCP Server running, waiting for HES
    LTE_STATE_CLIENT_CONNECTED,     // HES connected
    LTE_STATE_IDLE,                 // Ready for data exchange
    LTE_STATE_SEND_DATA,
    LTE_STATE_WAIT_SEND_PROMPT,
    LTE_STATE_SENDING,
    LTE_STATE_READ_DATA,
    LTE_STATE_PROCESS_TASKS,
    LTE_STATE_ERROR,
    LTE_STATE_RECONNECT
} LTE_STATE;

// AT Response Status
typedef enum
{
    LTE_RESP_NONE = 0,
    LTE_RESP_OK,
    LTE_RESP_ERROR,
    LTE_RESP_TIMEOUT,
    LTE_RESP_PROMPT,            // ">"
    LTE_RESP_NETOPEN_OK,        // +NETOPEN: 0
    LTE_RESP_NETOPEN_FAIL,      // +NETOPEN: 1
    LTE_RESP_CLIENT,            // +CLIENT: <link>,<server>,<ip>:<port>
    LTE_RESP_CIPRXGET,          // +CIPRXGET: 1,<link>
    LTE_RESP_IPCLOSE,           // +IPCLOSE: <link>,<reason>
    LTE_RESP_CIPSEND_OK,        // +CIPSEND: <link>,<req>,<ack>
    LTE_RESP_RECV_DATA          // +CIPRXGET: 2,<link>,<len>,<remain>
} LTE_RESP_STATUS;

// Network Status
typedef enum
{
    LTE_NET_NOT_REGISTERED = 0,
    LTE_NET_REGISTERED_HOME = 1,
    LTE_NET_SEARCHING = 2,
    LTE_NET_DENIED = 3,
    LTE_NET_UNKNOWN = 4,
    LTE_NET_REGISTERED_ROAMING = 5
} LTE_NET_STATUS;

// Connection Status
typedef enum
{
    LTE_CONN_DISCONNECTED = 0,
    LTE_CONN_CONNECTING,
    LTE_CONN_SERVER_READY,      // Server listening
    LTE_CONN_CLIENT_CONNECTED,  // HES connected
    LTE_CONN_ERROR
} LTE_CONN_STATUS;

// TX Data Queue
typedef struct
{
    uint8_t  data[LTE_TX_BUFFER_SIZE];
    uint16_t length;
    bool     pending;
} LTE_TX_QUEUE;

// Client Info (HES connection)
typedef struct
{
    uint8_t  linkNum;
    uint8_t  serverIndex;
    char     clientIP[20];
    uint16_t clientPort;
    bool     connected;
} LTE_CLIENT_INFO;

// Application Data
typedef struct
{
    // State machine
    LTE_STATE           state;
    LTE_STATE           prevState;
    LTE_STATE           pendingState;
    
    // UART buffers
    uint8_t             txBuffer[LTE_TX_BUFFER_SIZE];
    uint8_t             rxBuffer[LTE_RX_BUFFER_SIZE];
    uint16_t            rxIndex;
    uint8_t             rxByte;
    
    // Response handling
    LTE_RESP_STATUS     response;
    
    // Timing
    uint32_t            startTime;
    uint32_t            timeout;
    
    // Status
    bool                moduleReady;
    bool                simReady;
    bool                networkReady;
    bool                pdpActive;
    bool                serverRunning;
    
    LTE_NET_STATUS      netStatus;
    LTE_CONN_STATUS     connStatus;
    int8_t              signalQuality;
    char                ipAddress[40];
    
    // Client (HES) info
    LTE_CLIENT_INFO     client;
    
    // Retry
    uint8_t             retryCount;
    
    // TX queue
    LTE_TX_QUEUE        txQueue;
    
    // RX data (DLMS from HES) - Ring buffer like app_optouart
    uint8_t             dlmsRxBuffer[LTE_DLMS_BUFFER_SIZE];
    uint16_t            dlmsRxWriteIdx;     // Write index (from LTE module)
    uint16_t            dlmsRxReadIdx;      // Read index (for DLMS processing)
    uint16_t            dlmsRxLen;
    bool                dlmsDataReady;
    
} LTE_DATA;

// *****************************************************************************
// Section: Global Variable
// *****************************************************************************

extern LTE_DATA lteData;

// *****************************************************************************
// Section: Function Prototypes
// *****************************************************************************

void APP_LTE_Initialize(void);
void APP_LTE_Tasks(void);

// API Functions
bool APP_LTE_IsConnected(void);
bool APP_LTE_IsClientConnected(void);
LTE_CONN_STATUS APP_LTE_GetStatus(void);
int8_t APP_LTE_GetSignal(void);
const char* APP_LTE_GetIP(void);

// Data Functions
void APP_LTE_SendData(uint8_t* data, uint16_t len);
bool APP_LTE_HasData(void);
uint16_t APP_LTE_GetData(uint8_t* buffer, uint16_t maxLen);

// Control
void APP_LTE_Reconnect(void);
void APP_LTE_CloseClient(void);

#ifdef __cplusplus
}
#endif

#endif /* _APP_LTE_H */