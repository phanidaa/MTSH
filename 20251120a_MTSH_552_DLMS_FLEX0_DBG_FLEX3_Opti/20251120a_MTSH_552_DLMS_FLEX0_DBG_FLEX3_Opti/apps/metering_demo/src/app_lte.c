/*******************************************************************************
  MPLAB Harmony Application Source File

  Company:
    PEA AMI Project

  File Name:
    app_lte.c

  Summary:
    LTE A7683E Module - DLMS Meter TCP Server Implementation

  Description:
    Based on SIMCom A76XX Series TCPIP Application Note V1.05
    
    Flow:
    1. AT+CGDCONT=1,"IP","pea.ami.poc"   - Configure APN
    2. AT+NETOPEN                         - Start socket service
    3. +NETOPEN: 0                        - Success
    4. AT+IPADDR                          - Get assigned IP
    5. AT+CIPRXGET=1                      - Buffer access mode
    6. AT+SERVERSTART=4059,0              - Start TCP Server
    7. +CLIENT: 0,0,x.x.x.x:port          - HES connected
    8. AT+CIPSEND / AT+CIPRXGET           - Data exchange
*******************************************************************************/

#include "app_lte.h"
#include "definitions.h"
#include "app_gurux_dlms_process.h"

// *****************************************************************************
// Section: Global Data
// *****************************************************************************

LTE_DATA lteData;

// *****************************************************************************
// Section: Local Function Prototypes
// *****************************************************************************

static void LTE_UartCallback(uintptr_t context);
static void LTE_SendAT(const char* cmd);
static void LTE_SendATF(const char* fmt, ...);
static void LTE_SendRaw(uint8_t* data, uint16_t len);
static void LTE_ClearRx(void);
static uint32_t LTE_Tick(void);
static void LTE_HexDump(const char* prefix, uint8_t* data, uint16_t len);
static bool LTE_IsTimeout(uint32_t start, uint32_t timeout);
static LTE_RESP_STATUS LTE_ParseResponse(void);
static void LTE_ParseIP(void);
static void LTE_ParseSignal(void);
static void LTE_ParseClient(void);
static void LTE_ParseRxData(void);
static const char* LTE_StateStr(LTE_STATE state);

// *****************************************************************************
// Section: UART Callback
// *****************************************************************************

static void LTE_UartCallback(uintptr_t context)
{
    if (lteData.rxIndex < LTE_RX_BUFFER_SIZE - 1)
    {
        lteData.rxBuffer[lteData.rxIndex++] = lteData.rxByte;
        lteData.rxBuffer[lteData.rxIndex] = '\0';
    }
    LTE_USART_READ(&lteData.rxByte, 1);
}

// *****************************************************************************
// Section: Utility Functions
// *****************************************************************************

static uint32_t LTE_Tick(void)
{
    return SYS_TIME_CounterGet() / (SYS_TIME_FrequencyGet() / 1000);
}

// Debug hex dump
static void LTE_HexDump(const char* prefix, uint8_t* data, uint16_t len)
{
#if LTE_DEBUG_LEVEL >= 1
    char hexLine[80];
    char ascLine[20];
    int pos = 0;
    
    SYS_CONSOLE_Print(SYS_CONSOLE_INDEX_0, "[LTE] %s (%d bytes):\r\n", prefix, len);
    
    for (int i = 0; i < len && i < 128; i++)  // Limit to 128 bytes
    {
        if (pos == 0)
        {
            sprintf(hexLine, "  %04X: ", i);
        }
        
        sprintf(hexLine + strlen(hexLine), "%02X ", data[i]);
        ascLine[pos] = (data[i] >= 32 && data[i] < 127) ? data[i] : '.';
        pos++;
        
        if (pos == 16 || i == len - 1)
        {
            // Pad if not full line
            while (pos < 16)
            {
                strcat(hexLine, "   ");
                ascLine[pos] = ' ';
                pos++;
            }
            ascLine[16] = '\0';
            SYS_CONSOLE_Print(SYS_CONSOLE_INDEX_0, "%s |%s|\r\n", hexLine, ascLine);
            pos = 0;
        }
    }
    
    if (len > 128)
    {
        SYS_CONSOLE_Print(SYS_CONSOLE_INDEX_0, "  ... (truncated, %d more bytes)\r\n", len - 128);
    }
#endif
}

static bool LTE_IsTimeout(uint32_t start, uint32_t timeout)
{
    return (LTE_Tick() - start) >= timeout;
}

static void LTE_ClearRx(void)
{
    memset(lteData.rxBuffer, 0, LTE_RX_BUFFER_SIZE);
    lteData.rxIndex = 0;
    lteData.response = LTE_RESP_NONE;
}

static void LTE_SendAT(const char* cmd)
{
    LTE_ClearRx();
    
    uint16_t len = strlen(cmd);
    memcpy(lteData.txBuffer, cmd, len);
    lteData.txBuffer[len++] = '\r';
    lteData.txBuffer[len++] = '\n';
    
    LTE_DEBUG("TX: %s", cmd);
    LTE_USART_WRITE(lteData.txBuffer, len);
    
    lteData.startTime = LTE_Tick();
}

static void LTE_SendATF(const char* fmt, ...)
{
    char cmd[256];
    va_list args;
    va_start(args, fmt);
    vsnprintf(cmd, sizeof(cmd), fmt, args);
    va_end(args);
    LTE_SendAT(cmd);
}

static void LTE_SendRaw(uint8_t* data, uint16_t len)
{
    LTE_DEBUG("TX RAW: %d bytes", len);
    LTE_USART_WRITE(data, len);
}

// *****************************************************************************
// Section: Response Parser
// *****************************************************************************

// Static flag to prevent duplicate CLIENT parsing
static bool g_clientParsed = false;

static LTE_RESP_STATUS LTE_ParseResponse(void)
{
    char* resp = (char*)lteData.rxBuffer;
    static LTE_RESP_STATUS lastResp = LTE_RESP_NONE;
    LTE_RESP_STATUS currentResp = LTE_RESP_NONE;
    
    // ==========================================================
    // IMPORTANT: Check URC responses FIRST before OK/ERROR!
    // Priority: IPCLOSE > CLIENT > others
    // Query (AT+NETOPEN?): +NETOPEN: X comes BEFORE OK
    // URC (AT+NETOPEN):    OK comes BEFORE +NETOPEN: X
    // ==========================================================
    
    // +IPCLOSE: <link>,<reason> - HIGHEST PRIORITY!
    if (strstr(resp, "+IPCLOSE:"))
    {
        currentResp = LTE_RESP_IPCLOSE;
        g_clientParsed = false;  // Reset flag on disconnect
    }
    // +NETOPEN: 0/1 - Could be query response or URC
    else if (strstr(resp, "+NETOPEN:"))
    {
        char* p_netopen = strstr(resp, "+NETOPEN:");
        char* p_ok = strstr(resp, "OK");
        int result = atoi(p_netopen + 9);
        
        // Check position: OK before +NETOPEN = URC, +NETOPEN before OK = Query
        if (p_ok && p_ok < p_netopen)
        {
            // OK came FIRST ? This is URC from AT+NETOPEN command
            // 0 = success, 1 = error
            currentResp = (result == 0) ? LTE_RESP_NETOPEN_OK : LTE_RESP_NETOPEN_FAIL;
        }
        else if (p_ok)
        {
            // +NETOPEN: came FIRST ? This is query response (AT+NETOPEN?)
            // Return OK, let state machine parse the value
            currentResp = LTE_RESP_OK;
        }
        else
        {
            // No OK yet, just +NETOPEN: alone - treat as URC
            currentResp = (result == 0) ? LTE_RESP_NETOPEN_OK : LTE_RESP_NETOPEN_FAIL;
        }
    }
    // +CLIENT: <link_num>,<server_index>,<client_IP>:<port>
    // Example: +CLIENT: 0,0,172.20.10.5:54321\r\n
    else if (strstr(resp, "+CLIENT:") && !g_clientParsed)
    {
        // Check if we have complete line (ends with \r\n after IP:port)
        char* p_client = strstr(resp, "+CLIENT:");
        char* p_newline = strstr(p_client, "\r\n");
        
        if (p_newline)
        {
            // Complete line received - parse it ONCE
            LTE_ParseClient();
            currentResp = LTE_RESP_CLIENT;
            g_clientParsed = true;  // Mark as parsed
        }
        // else: Incomplete - wait for more data
    }
    // +CIPRXGET: 2,<link>,<len>,<remain> - actual data (CHECK BEFORE +CIPRXGET: 1!)
    // Response format: +CIPRXGET: 2,<link>,<len>,<remain>\r\n<data>\r\n\r\nOK\r\n
    // IMPORTANT: DLMS data may contain 0x00 bytes, so strstr() won't work!
    // Check from END of buffer instead
    else if (strstr(resp, "+CIPRXGET: 2,"))
    {
        // Check if buffer ends with "OK\r\n" (last 4 bytes)
        // This works even if DLMS data contains 0x00 bytes
        if (lteData.rxIndex >= 4)
        {
            uint8_t* tail = &lteData.rxBuffer[lteData.rxIndex - 4];
            if (tail[0] == 'O' && tail[1] == 'K' && tail[2] == '\r' && tail[3] == '\n')
            {
                LTE_DEBUG(">>> Parser: +CIPRXGET: 2 + OK (tail check) found!");
                currentResp = LTE_RESP_RECV_DATA;
            }
            // else: No OK yet - keep waiting
        }
    }
    // +CIPRXGET: 1,<link_num> - data available notification
    else if (strstr(resp, "+CIPRXGET: 1,"))
    {
        currentResp = LTE_RESP_CIPRXGET;
    }
    // +CIPSEND: <link>,<req>,<ack>
    else if (strstr(resp, "+CIPSEND:"))
    {
        currentResp = LTE_RESP_CIPSEND_OK;
    }
    // Standard responses - check from tail for binary safety
    else if (lteData.rxIndex >= 4)
    {
        uint8_t* tail = &lteData.rxBuffer[lteData.rxIndex - 4];
        if (tail[0] == 'O' && tail[1] == 'K' && tail[2] == '\r' && tail[3] == '\n')
        {
            currentResp = LTE_RESP_OK;
        }
        else if (lteData.rxIndex >= 7)
        {
            tail = &lteData.rxBuffer[lteData.rxIndex - 7];
            if (memcmp(tail, "ERROR\r\n", 7) == 0)
            {
                currentResp = LTE_RESP_ERROR;
            }
        }
    }
    // Data prompt ">"
    if (currentResp == LTE_RESP_NONE && strstr(resp, ">"))
    {
        currentResp = LTE_RESP_PROMPT;
    }
    
    // Only print when response changes (avoid flooding)
    if (currentResp != LTE_RESP_NONE && currentResp != lastResp)
    {
        lastResp = currentResp;
        switch(currentResp)
        {
            case LTE_RESP_OK:           LTE_DEBUG_VERBOSE("RX: OK"); break;
            case LTE_RESP_ERROR:        LTE_DEBUG("RX: ERROR"); break;
            case LTE_RESP_PROMPT:       LTE_DEBUG_VERBOSE("RX: >"); break;
            case LTE_RESP_NETOPEN_OK:   LTE_DEBUG("RX: +NETOPEN: 0 (Success)"); break;
            case LTE_RESP_NETOPEN_FAIL: LTE_DEBUG("RX: +NETOPEN: 1 (Failed)"); break;
            case LTE_RESP_CLIENT:       LTE_DEBUG("RX: +CLIENT (HES Connected!)"); break;
            case LTE_RESP_CIPRXGET:     LTE_DEBUG("RX: +CIPRXGET (Data Available)"); break;
            case LTE_RESP_RECV_DATA:    LTE_DEBUG("RX: +CIPRXGET Data"); break;
            case LTE_RESP_CIPSEND_OK:   LTE_DEBUG("RX: +CIPSEND OK"); break;
            case LTE_RESP_IPCLOSE:      LTE_DEBUG("RX: +IPCLOSE (Disconnected)"); break;
            default: break;
        }
    }
    
    // Reset lastResp when buffer is cleared
    if (lteData.rxIndex == 0)
    {
        lastResp = LTE_RESP_NONE;
        g_clientParsed = false;  // Reset parse flag when buffer cleared
    }
    
    return currentResp;
}

// *****************************************************************************
// Section: Parse Specific Responses
// *****************************************************************************

static void LTE_ParseIP(void)
{
    // +IPADDR: 10.x.x.x
    char* p = strstr((char*)lteData.rxBuffer, "+IPADDR:");
    if (p)
    {
        p += 8;
        while (*p == ' ') p++;
        
        int i = 0;
        while (*p && *p != '\r' && *p != '\n' && i < 39)
        {
            lteData.ipAddress[i++] = *p++;
        }
        lteData.ipAddress[i] = '\0';
        LTE_DEBUG("IP Address: %s", lteData.ipAddress);
    }
}

static void LTE_ParseSignal(void)
{
    // +CSQ: <rssi>,<ber>
    char* p = strstr((char*)lteData.rxBuffer, "+CSQ:");
    if (p)
    {
        p += 5;
        while (*p == ' ') p++;
        lteData.signalQuality = atoi(p);
        LTE_DEBUG("Signal: %d", lteData.signalQuality);
    }
}

static void LTE_ParseClient(void)
{
    // +CLIENT: <link_num>,<server_index>,<client_IP>:<port>
    // Example formats:
    //   +CLIENT: 0,0,192.168.1.100:54321
    //   +CLIENT: 0,"192.168.1.100",54321
    LTE_DEBUG(">>> Parsing +CLIENT from buffer (rxIndex=%d)...", lteData.rxIndex);
    LTE_HexDump("+CLIENT RAW", lteData.rxBuffer, lteData.rxIndex > 100 ? 100 : lteData.rxIndex);
    
    char* p = strstr((char*)lteData.rxBuffer, "+CLIENT:");
    if (p)
    {
        LTE_DEBUG(">>> Found +CLIENT at offset %d", (int)(p - (char*)lteData.rxBuffer));
        p += 8;
        while (*p == ' ') p++;
        
        // Parse link_num
        lteData.client.linkNum = atoi(p);
        LTE_DEBUG(">>> link_num=%d (char='%c')", lteData.client.linkNum, *p);
        
        // Find next comma
        char* comma1 = strchr(p, ',');
        if (comma1)
        {
            LTE_DEBUG(">>> 1st comma at offset %d", (int)(comma1 - (char*)lteData.rxBuffer));
            p = comma1 + 1;
            
            // Parse server_index
            lteData.client.serverIndex = atoi(p);
            LTE_DEBUG(">>> server_index=%d (char='%c')", lteData.client.serverIndex, *p);
            
            // Find next comma (for IP:port)
            char* comma2 = strchr(p, ',');
            if (comma2)
            {
                LTE_DEBUG(">>> 2nd comma at offset %d", (int)(comma2 - (char*)lteData.rxBuffer));
                p = comma2 + 1;
                
                // Skip any quotes and spaces
                while (*p == '"' || *p == ' ') p++;
                
                // Parse IP (until ':' or '"' or ',')
                int i = 0;
                while (*p && *p != ':' && *p != '"' && *p != ',' && *p != '\r' && *p != '\n' && i < 19)
                {
                    lteData.client.clientIP[i++] = *p++;
                }
                lteData.client.clientIP[i] = '\0';
                
                // Parse port
                if (*p == ':')
                {
                    p++;
                    lteData.client.clientPort = atoi(p);
                }
                else if (*p == '"')
                {
                    // Format: +CLIENT: 0,"192.168.1.100",54321
                    p++; // Skip closing quote
                    if (*p == ',') p++; // Skip comma
                    lteData.client.clientPort = atoi(p);
                }
            }
            else
            {
                LTE_DEBUG(">>> No 2nd comma! Trying alternate format...");
                // Try alternate format: +CLIENT: <link>,"<IP>",<port>
                // or: +CLIENT: <link>,<IP>:<port> (without server_index)
                
                // Check if this field contains IP (has dots)
                if (strchr(p, '.'))
                {
                    LTE_DEBUG(">>> Found IP in 2nd field (alternate format)!");
                    // Skip quotes and spaces
                    while (*p == '"' || *p == ' ') p++;
                    
                    // Parse IP
                    int i = 0;
                    while (*p && *p != ':' && *p != '"' && *p != ',' && *p != '\r' && *p != '\n' && i < 19)
                    {
                        lteData.client.clientIP[i++] = *p++;
                    }
                    lteData.client.clientIP[i] = '\0';
                    
                    // Parse port
                    if (*p == ':')
                    {
                        p++; // skip colon
                        lteData.client.clientPort = atoi(p);
                    }
                    else if (*p == '"')
                    {
                        p++; // skip closing quote
                        if (*p == ',') p++; // skip comma
                        lteData.client.clientPort = atoi(p);
                    }
                    else if (*p == ',')
                    {
                        p++; // skip comma
                        lteData.client.clientPort = atoi(p);
                    }
                    
                    LTE_DEBUG(">>> Alt parse: IP=%s, port=%d", 
                        lteData.client.clientIP, lteData.client.clientPort);
                }
            }
        }
        else
        {
            LTE_DEBUG(">>> No 1st comma found!");
        }
        
        lteData.client.connected = true;
        
        // Validate parsed data
        if (strlen(lteData.client.clientIP) > 0 && lteData.client.clientPort > 0)
        {
            LTE_DEBUG("? Client FINAL: link=%d, server=%d, IP=%s:%d",
                lteData.client.linkNum,
                lteData.client.serverIndex,
                lteData.client.clientIP,
                lteData.client.clientPort);
        }
        else
        {
            LTE_DEBUG("?? Client parsed but incomplete: link=%d, server=%d, IP=%s:%d",
                lteData.client.linkNum,
                lteData.client.serverIndex,
                lteData.client.clientIP,
                lteData.client.clientPort);
            // Print raw string for debugging
            char rawStr[128];
            int len = 0;
            for (int i = 0; i < lteData.rxIndex && i < 127 && len < 127; i++)
            {
                if (lteData.rxBuffer[i] >= 32 && lteData.rxBuffer[i] < 127)
                    rawStr[len++] = lteData.rxBuffer[i];
            }
            rawStr[len] = '\0';
            LTE_DEBUG("Raw string: %s", rawStr);
        }
    }
    else
    {
        LTE_DEBUG(">>> +CLIENT not found in buffer!");
        LTE_HexDump("SEARCH FAILED", lteData.rxBuffer, lteData.rxIndex > 64 ? 64 : lteData.rxIndex);
    }
}

static void LTE_ParseRxData(void)
{
    // +CIPRXGET: 2,<link>,<len>,<remain>\r\n<data>\r\n\r\nOK\r\n
    // Format: header is ASCII, data may contain 0x00 bytes
    LTE_DEBUG(">>> Parsing RX data from buffer (rxIndex=%d)...", lteData.rxIndex);
    
    // Find header start - this part is safe with strstr since it's before binary data
    char* p = strstr((char*)lteData.rxBuffer, "+CIPRXGET: 2,");
    if (p)
    {
        // Parse: +CIPRXGET: 2,<link>,<len>,<remain>
        p += 13;  // Skip "+CIPRXGET: 2,"
        
        // Skip link number
        while (*p && *p != ',') p++;
        if (*p == ',') p++;
        
        // Get length
        int len = atoi(p);
        LTE_DEBUG(">>> +CIPRXGET: 2 found, data len=%d", len);
        
        // Skip to after <remain> (find \r\n)
        while (*p && *p != '\r') p++;
        if (*p == '\r' && *(p+1) == '\n')
        {
            p += 2;  // Skip \r\n, now pointing to data start
            
            // Calculate actual data offset from buffer start
            int dataOffset = p - (char*)lteData.rxBuffer;
            
            // Verify we have enough data
            // Buffer should be: header + data + \r\n\r\nOK\r\n (6 bytes trailer)
            if (len > 0 && (dataOffset + len) <= lteData.rxIndex)
            {
                LTE_DEBUG("<<< RX from HES (%d bytes at offset %d)", len, dataOffset);
                LTE_HexDump("RX DATA", (uint8_t*)p, len);
                
                // Store in ring buffer (like app_optouart)
                for (int i = 0; i < len; i++)
                {
                    lteData.dlmsRxBuffer[lteData.dlmsRxWriteIdx++] = (uint8_t)p[i];
                    
                    if (lteData.dlmsRxWriteIdx >= LTE_DLMS_BUFFER_SIZE)
                        lteData.dlmsRxWriteIdx = 0;
                }
                
                lteData.dlmsRxLen = len;
                lteData.dlmsDataReady = true;
                
                LTE_DEBUG(">>> Stored %d bytes in ring buffer (writeIdx=%d)", 
                    len, lteData.dlmsRxWriteIdx);
            }
            else
            {
                LTE_DEBUG(">>> Data length mismatch: len=%d, offset=%d, rxIndex=%d",
                    len, dataOffset, lteData.rxIndex);
            }
        }
        else
        {
            LTE_DEBUG(">>> \\r\\n not found after header");
        }
    }
    else
    {
        LTE_DEBUG(">>> +CIPRXGET: 2 not found in buffer");
        LTE_HexDump("BUFFER", lteData.rxBuffer, lteData.rxIndex > 64 ? 64 : lteData.rxIndex);
    }
}

// *****************************************************************************
// Section: State String (Debug)
// *****************************************************************************

static const char* LTE_StateStr(LTE_STATE state)
{
    switch(state)
    {
        case LTE_STATE_INIT:            return "INIT";
        case LTE_STATE_WAIT_POWERUP:    return "WAIT_POWERUP";
        case LTE_STATE_CHECK_AT:        return "CHECK_AT";
        case LTE_STATE_DISABLE_ECHO:    return "DISABLE_ECHO";
        case LTE_STATE_CHECK_SIM:       return "CHECK_SIM";
        case LTE_STATE_CHECK_NETWORK:   return "CHECK_NETWORK";
        case LTE_STATE_CHECK_SIGNAL:    return "CHECK_SIGNAL";
        case LTE_STATE_CONFIG_APN:      return "CONFIG_APN";
        case LTE_STATE_CHECK_NETOPEN:   return "CHECK_NETOPEN";
        case LTE_STATE_NETCLOSE:        return "NETCLOSE";
        case LTE_STATE_NETOPEN:         return "NETOPEN";
        case LTE_STATE_WAIT_NETOPEN:    return "WAIT_NETOPEN";
        case LTE_STATE_GET_IP:          return "GET_IP";
        case LTE_STATE_SET_RXGET_MODE:  return "SET_RXGET_MODE";
        case LTE_STATE_SERVER_START:    return "SERVER_START";
        case LTE_STATE_WAIT_SERVER:     return "WAIT_SERVER";
        case LTE_STATE_SERVER_READY:    return "SERVER_READY";
        case LTE_STATE_CLIENT_CONNECTED:return "CLIENT_CONNECTED";
        case LTE_STATE_IDLE:            return "IDLE";
        case LTE_STATE_SEND_DATA:       return "SEND_DATA";
        case LTE_STATE_WAIT_SEND_PROMPT:return "WAIT_SEND_PROMPT";
        case LTE_STATE_SENDING:         return "SENDING";
        case LTE_STATE_READ_DATA:       return "READ_DATA";
        case LTE_STATE_PROCESS_TASKS:   return "PROCESS_TASKS";
        case LTE_STATE_ERROR:           return "ERROR";
        case LTE_STATE_RECONNECT:       return "RECONNECT";
        default:                        return "UNKNOWN";
    }
}

// *****************************************************************************
// Section: Initialize
// *****************************************************************************

void APP_LTE_Initialize(void)
{
    LTE_DEBUG("=== LTE Module Init (TCP Server Mode) ===");
    
    memset(&lteData, 0, sizeof(LTE_DATA));
    
    lteData.state = LTE_STATE_INIT;
    lteData.prevState = LTE_STATE_INIT;
    lteData.connStatus = LTE_CONN_DISCONNECTED;
    
    // Initialize DLMS ring buffer indices
    lteData.dlmsRxWriteIdx = 0;
    lteData.dlmsRxReadIdx = 0;
    
    // Register UART callback
    LTE_USART_READ_CALLBACK(LTE_UartCallback, 0);
    LTE_USART_READ(&lteData.rxByte, 1);
    
    LTE_DEBUG("Initialized. APN=%s, Port=%d", LTE_APN, LTE_SERVER_PORT);
}

// *****************************************************************************
// Section: State Machine
// *****************************************************************************

void APP_LTE_Tasks(void)
{
    // Log state changes
    if (lteData.state != lteData.prevState)
    {
        LTE_DEBUG("State: %s -> %s", 
            LTE_StateStr(lteData.prevState), 
            LTE_StateStr(lteData.state));
        lteData.prevState = lteData.state;
    }
    
    // Check for async events (client connect/disconnect)
    LTE_RESP_STATUS asyncResp = LTE_ParseResponse();
    if (asyncResp == LTE_RESP_CLIENT && lteData.state == LTE_STATE_SERVER_READY)
    {
        // HES just connected!
        lteData.state = LTE_STATE_CLIENT_CONNECTED;
        LTE_ClearRx();
    }
    else if (asyncResp == LTE_RESP_IPCLOSE)
    {
        // Client disconnected
        lteData.client.connected = false;
        lteData.connStatus = LTE_CONN_SERVER_READY;
        if (lteData.state == LTE_STATE_IDLE || lteData.state == LTE_STATE_CLIENT_CONNECTED)
        {
            lteData.state = LTE_STATE_SERVER_READY;
        }
        LTE_ClearRx();
    }
    else if (asyncResp == LTE_RESP_CIPRXGET && 
             (lteData.state == LTE_STATE_IDLE || lteData.state == LTE_STATE_CLIENT_CONNECTED))
    {
        // Data available from HES
        LTE_DEBUG(">>> Data available from HES! Going to READ_DATA");
        lteData.state = LTE_STATE_READ_DATA;
        LTE_ClearRx();
    }
    
    // =============================================================
    // Process DLMS RX ring buffer (like app_optouart)
    // Send one byte at a time to dlms_usart_data_cb
    // =============================================================
    if (lteData.dlmsRxReadIdx != lteData.dlmsRxWriteIdx)
    {
        // Send one byte to DLMS layer
        dlms_usart_data_cb(1, &lteData.dlmsRxBuffer[lteData.dlmsRxReadIdx]);
        
        lteData.dlmsRxReadIdx++;
        if (lteData.dlmsRxReadIdx >= LTE_DLMS_BUFFER_SIZE)
            lteData.dlmsRxReadIdx = 0;
    }

    switch (lteData.state)
    {
        // =============================================================
        // INIT
        // =============================================================
        case LTE_STATE_INIT:
        {
            lteData.startTime = LTE_Tick();
            lteData.retryCount = 0;
            lteData.state = LTE_STATE_WAIT_POWERUP;
            break;
        }
        
        // =============================================================
        // WAIT POWERUP (3 seconds)
        // =============================================================
        case LTE_STATE_WAIT_POWERUP:
        {
            if (LTE_IsTimeout(lteData.startTime, 3000))
            {
                LTE_DEBUG("Power up complete");
                lteData.state = LTE_STATE_CHECK_AT;
            }
            break;
        }
        
        // =============================================================
        // CHECK AT
        // =============================================================
        case LTE_STATE_CHECK_AT:
        {
            LTE_SendAT("AT");
            lteData.pendingState = LTE_STATE_CHECK_AT;
            lteData.timeout = LTE_TIMEOUT_SHORT;
            lteData.state = LTE_STATE_PROCESS_TASKS;
            break;
        }
        
        // =============================================================
        // DISABLE ECHO
        // =============================================================
        case LTE_STATE_DISABLE_ECHO:
        {
            LTE_SendAT("ATE0");
            lteData.pendingState = LTE_STATE_DISABLE_ECHO;
            lteData.timeout = LTE_TIMEOUT_SHORT;
            lteData.state = LTE_STATE_PROCESS_TASKS;
            break;
        }
        
        // =============================================================
        // CHECK SIM
        // =============================================================
        case LTE_STATE_CHECK_SIM:
        {
            LTE_SendAT("AT+CPIN?");
            lteData.pendingState = LTE_STATE_CHECK_SIM;
            lteData.timeout = LTE_TIMEOUT_SHORT;
            lteData.state = LTE_STATE_PROCESS_TASKS;
            break;
        }
        
        // =============================================================
        // CHECK NETWORK REGISTRATION
        // =============================================================
        case LTE_STATE_CHECK_NETWORK:
        {
            LTE_SendAT("AT+CGREG?");
            lteData.pendingState = LTE_STATE_CHECK_NETWORK;
            lteData.timeout = LTE_TIMEOUT_MEDIUM;
            lteData.state = LTE_STATE_PROCESS_TASKS;
            break;
        }
        
        // =============================================================
        // CHECK SIGNAL
        // =============================================================
        case LTE_STATE_CHECK_SIGNAL:
        {
            LTE_SendAT("AT+CSQ");
            lteData.pendingState = LTE_STATE_CHECK_SIGNAL;
            lteData.timeout = LTE_TIMEOUT_SHORT;
            lteData.state = LTE_STATE_PROCESS_TASKS;
            break;
        }
        
        // =============================================================
        // CONFIG APN
        // =============================================================
        case LTE_STATE_CONFIG_APN:
        {
            LTE_DEBUG("Configuring APN: %s", LTE_APN);
            LTE_SendATF("AT+CGDCONT=1,\"IP\",\"%s\"", LTE_APN);
            lteData.pendingState = LTE_STATE_CONFIG_APN;
            lteData.timeout = LTE_TIMEOUT_SHORT;
            lteData.state = LTE_STATE_PROCESS_TASKS;
            break;
        }
        
        // =============================================================
        // CHECK IF NETWORK ALREADY OPEN
        // =============================================================
        case LTE_STATE_CHECK_NETOPEN:
        {
            LTE_DEBUG("Checking if network already open...");
            LTE_SendAT("AT+NETOPEN?");
            lteData.pendingState = LTE_STATE_CHECK_NETOPEN;
            lteData.timeout = LTE_TIMEOUT_SHORT;
            lteData.state = LTE_STATE_PROCESS_TASKS;
            break;
        }
        
        // =============================================================
        // CLOSE NETWORK FIRST (if already open)
        // =============================================================
        case LTE_STATE_NETCLOSE:
        {
            LTE_DEBUG("Closing network first...");
            LTE_SendAT("AT+NETCLOSE");
            lteData.pendingState = LTE_STATE_NETCLOSE;
            lteData.timeout = LTE_TIMEOUT_MEDIUM;
            lteData.state = LTE_STATE_PROCESS_TASKS;
            break;
        }
        
        // =============================================================
        // NETOPEN - Start socket service
        // =============================================================
        case LTE_STATE_NETOPEN:
        {
            LTE_DEBUG("Opening network (AT+NETOPEN)...");
            LTE_SendAT("AT+NETOPEN");
            lteData.pendingState = LTE_STATE_NETOPEN;
            lteData.timeout = LTE_TIMEOUT_NETOPEN;
            lteData.state = LTE_STATE_WAIT_NETOPEN;
            break;
        }
        
        // =============================================================
        // WAIT NETOPEN - Wait for +NETOPEN: 0
        // =============================================================
        case LTE_STATE_WAIT_NETOPEN:
        {
            LTE_RESP_STATUS resp = LTE_ParseResponse();
            
            if (resp == LTE_RESP_NETOPEN_OK)
            {
                LTE_DEBUG("Network opened successfully!");
                lteData.pdpActive = true;
                lteData.state = LTE_STATE_GET_IP;
                LTE_ClearRx();
            }
            else if (resp == LTE_RESP_NETOPEN_FAIL)
            {
                LTE_DEBUG("Network open failed!");
                lteData.state = LTE_STATE_ERROR;
            }
            else if (resp == LTE_RESP_ERROR)
            {
                // ERROR ???????????? "Network is already opened" (error 4)
                // ??????????? GET_IP ???
                LTE_DEBUG("NETOPEN error (maybe already open), trying GET_IP...");
                lteData.pdpActive = true;
                lteData.state = LTE_STATE_GET_IP;
                LTE_ClearRx();
            }
            else if (LTE_IsTimeout(lteData.startTime, lteData.timeout))
            {
                LTE_DEBUG("Network open timeout!");
                lteData.state = LTE_STATE_ERROR;
            }
            break;
        }
        
        // =============================================================
        // GET IP ADDRESS
        // =============================================================
        case LTE_STATE_GET_IP:
        {
            LTE_SendAT("AT+IPADDR");
            lteData.pendingState = LTE_STATE_GET_IP;
            lteData.timeout = LTE_TIMEOUT_SHORT;
            lteData.state = LTE_STATE_PROCESS_TASKS;
            break;
        }
        
        // =============================================================
        // SET BUFFER ACCESS MODE
        // =============================================================
        case LTE_STATE_SET_RXGET_MODE:
        {
            LTE_DEBUG("Setting buffer access mode...");
            LTE_SendAT("AT+CIPRXGET=1");
            lteData.pendingState = LTE_STATE_SET_RXGET_MODE;
            lteData.timeout = LTE_TIMEOUT_SHORT;
            lteData.state = LTE_STATE_PROCESS_TASKS;
            break;
        }
        
        // =============================================================
        // START TCP SERVER
        // =============================================================
        case LTE_STATE_SERVER_START:
        {
            LTE_DEBUG("Starting TCP Server on port %d...", LTE_SERVER_PORT);
            LTE_SendATF("AT+SERVERSTART=%d,%d", LTE_SERVER_PORT, LTE_SERVER_INDEX);
            lteData.pendingState = LTE_STATE_SERVER_START;
            lteData.timeout = LTE_TIMEOUT_SHORT;
            lteData.state = LTE_STATE_PROCESS_TASKS;
            break;
        }
        
        // =============================================================
        // SERVER READY - Waiting for HES to connect
        // =============================================================
        case LTE_STATE_SERVER_READY:
        {
            // Just wait for +CLIENT: URC
            // The async check at the top handles this
            lteData.connStatus = LTE_CONN_SERVER_READY;
            lteData.serverRunning = true;
            
            // Check for data to send if client was previously connected
            // but this state means no client right now
            break;
        }
        
        // =============================================================
        // CLIENT CONNECTED - HES just connected
        // =============================================================
        case LTE_STATE_CLIENT_CONNECTED:
        {
            LTE_DEBUG("HES Connected! link=%d, IP=%s:%d",
                lteData.client.linkNum,
                lteData.client.clientIP,
                lteData.client.clientPort);
            
            lteData.connStatus = LTE_CONN_CLIENT_CONNECTED;
            lteData.state = LTE_STATE_IDLE;
            break;
        }
        
        // =============================================================
        // IDLE - Ready for data exchange
        // =============================================================
        case LTE_STATE_IDLE:
        {
            // Check if we have data to send
            if (lteData.txQueue.pending && lteData.client.connected)
            {
                lteData.state = LTE_STATE_SEND_DATA;
            }
            // Data receive is handled by async check at top
            break;
        }
        
        // =============================================================
        // SEND DATA - AT+CIPSEND
        // =============================================================
        case LTE_STATE_SEND_DATA:
        {
            LTE_DEBUG(">>> TX to HES (%d bytes)", lteData.txQueue.length);
            LTE_HexDump("TX DATA", lteData.txQueue.data, lteData.txQueue.length);
            LTE_SendATF("AT+CIPSEND=%d,%d", lteData.client.linkNum, lteData.txQueue.length);
            lteData.timeout = LTE_TIMEOUT_SHORT;
            lteData.state = LTE_STATE_WAIT_SEND_PROMPT;
            lteData.startTime = LTE_Tick();
            break;
        }
        
        // =============================================================
        // WAIT FOR ">" PROMPT
        // =============================================================
        case LTE_STATE_WAIT_SEND_PROMPT:
        {
            LTE_RESP_STATUS resp = LTE_ParseResponse();
            
            if (resp == LTE_RESP_PROMPT)
            {
                // Send actual data
                LTE_DEBUG(">>> Got prompt, sending raw data...");
                LTE_SendRaw(lteData.txQueue.data, lteData.txQueue.length);
                lteData.state = LTE_STATE_SENDING;
                lteData.startTime = LTE_Tick();
                lteData.timeout = LTE_TIMEOUT_SEND;
                LTE_ClearRx();
            }
            else if (resp == LTE_RESP_ERROR)
            {
                LTE_DEBUG(">>> Send failed - ERROR response!");
                lteData.txQueue.pending = false;
                lteData.state = LTE_STATE_IDLE;
            }
            else if (LTE_IsTimeout(lteData.startTime, lteData.timeout))
            {
                LTE_DEBUG(">>> Send prompt timeout!");
                lteData.txQueue.pending = false;
                lteData.state = LTE_STATE_IDLE;
            }
            break;
        }
        
        // =============================================================
        // SENDING - Wait for +CIPSEND response
        // =============================================================
        case LTE_STATE_SENDING:
        {
            LTE_RESP_STATUS resp = LTE_ParseResponse();
            
            if (resp == LTE_RESP_CIPSEND_OK || resp == LTE_RESP_OK)
            {
                LTE_DEBUG(">>> TX complete!");
                lteData.txQueue.pending = false;
                lteData.state = LTE_STATE_IDLE;
                LTE_ClearRx();
            }
            else if (resp == LTE_RESP_ERROR)
            {
                LTE_DEBUG(">>> TX failed - ERROR!");
                lteData.txQueue.pending = false;
                lteData.state = LTE_STATE_IDLE;
            }
            else if (LTE_IsTimeout(lteData.startTime, lteData.timeout))
            {
                LTE_DEBUG(">>> TX timeout!");
                lteData.txQueue.pending = false;
                lteData.state = LTE_STATE_IDLE;
            }
            break;
        }
        
        // =============================================================
        // READ DATA - AT+CIPRXGET=2
        // =============================================================
        case LTE_STATE_READ_DATA:
        {
            LTE_DEBUG(">>> Reading data from HES (link=%d, maxLen=%d)...",
                lteData.client.linkNum, LTE_DLMS_BUFFER_SIZE);
            LTE_SendATF("AT+CIPRXGET=2,%d,%d", lteData.client.linkNum, LTE_DLMS_BUFFER_SIZE);
            lteData.pendingState = LTE_STATE_READ_DATA;
            lteData.timeout = LTE_TIMEOUT_SHORT;
            lteData.state = LTE_STATE_PROCESS_TASKS;
            break;
        }
        
        // =============================================================
        // PROCESS TASKS - Wait for AT response
        // =============================================================
        case LTE_STATE_PROCESS_TASKS:
        {
            LTE_RESP_STATUS resp = LTE_ParseResponse();
            
            // Handle response based on pending state
            if (resp == LTE_RESP_OK || resp == LTE_RESP_RECV_DATA)
            {
                // Process state-specific response
                switch (lteData.pendingState)
                {
                    case LTE_STATE_CHECK_AT:
                        LTE_DEBUG("Module OK");
                        lteData.moduleReady = true;
                        lteData.state = LTE_STATE_DISABLE_ECHO;
                        break;
                        
                    case LTE_STATE_DISABLE_ECHO:
                        LTE_DEBUG("Echo disabled");
                        lteData.state = LTE_STATE_CHECK_SIM;
                        break;
                        
                    case LTE_STATE_CHECK_SIM:
                        if (strstr((char*)lteData.rxBuffer, "READY"))
                        {
                            LTE_DEBUG("SIM Ready");
                            lteData.simReady = true;
                            lteData.state = LTE_STATE_CHECK_NETWORK;
                        }
                        else
                        {
                            LTE_DEBUG("SIM not ready!");
                            lteData.state = LTE_STATE_ERROR;
                        }
                        break;
                        
                    case LTE_STATE_CHECK_NETWORK:
                    {
                        // Parse +CGREG: <n>,<stat>
                        char* p = strstr((char*)lteData.rxBuffer, "+CGREG:");
                        if (p)
                        {
                            p = strchr(p, ',');
                            if (p)
                            {
                                int stat = atoi(p + 1);
                                lteData.netStatus = (LTE_NET_STATUS)stat;
                                
                                if (stat == 1 || stat == 5) // Home or Roaming
                                {
                                    LTE_DEBUG("Network registered (stat=%d)", stat);
                                    lteData.networkReady = true;
                                    lteData.state = LTE_STATE_CHECK_SIGNAL;
                                }
                                else
                                {
                                    LTE_DEBUG("Network not ready (stat=%d), retrying...", stat);
                                    lteData.retryCount++;
                                    if (lteData.retryCount > LTE_MAX_RETRIES * 3)
                                    {
                                        lteData.state = LTE_STATE_ERROR;
                                    }
                                    else
                                    {
                                        // Wait and retry
                                        lteData.startTime = LTE_Tick();
                                        lteData.timeout = 2000;
                                        // Stay in PROCESS_TASKS but will timeout and retry
                                    }
                                }
                            }
                        }
                        break;
                    }
                        
                    case LTE_STATE_CHECK_SIGNAL:
                        LTE_ParseSignal();
                        lteData.state = LTE_STATE_CONFIG_APN;
                        break;
                        
                    case LTE_STATE_CONFIG_APN:
                        LTE_DEBUG("APN configured");
                        lteData.state = LTE_STATE_CHECK_NETOPEN;
                        break;
                    
                    case LTE_STATE_CHECK_NETOPEN:
                        // ??????? +NETOPEN: 1 (????????) ???? +NETOPEN: 0 (???????)
                        if (strstr((char*)lteData.rxBuffer, "+NETOPEN: 1"))
                        {
                            LTE_DEBUG("Network already open, closing first...");
                            lteData.state = LTE_STATE_NETCLOSE;
                        }
                        else
                        {
                            LTE_DEBUG("Network closed, opening...");
                            lteData.state = LTE_STATE_NETOPEN;
                        }
                        break;
                    
                    case LTE_STATE_NETCLOSE:
                        // ???????? OK ???? ERROR ??????? NETOPEN
                        LTE_DEBUG("Network closed (or was already closed)");
                        lteData.state = LTE_STATE_NETOPEN;
                        break;
                        
                    case LTE_STATE_GET_IP:
                        LTE_ParseIP();
                        lteData.state = LTE_STATE_SET_RXGET_MODE;
                        break;
                        
                    case LTE_STATE_SET_RXGET_MODE:
                        LTE_DEBUG("Buffer mode set");
                        lteData.state = LTE_STATE_SERVER_START;
                        break;
                        
                    case LTE_STATE_SERVER_START:
                        LTE_DEBUG("TCP Server started on port %d!", LTE_SERVER_PORT);
                        lteData.serverRunning = true;
                        lteData.state = LTE_STATE_SERVER_READY;
                        break;
                        
                    case LTE_STATE_READ_DATA:
                        LTE_ParseRxData();
                        lteData.state = LTE_STATE_IDLE;
                        break;
                        
                    default:
                        lteData.state = LTE_STATE_IDLE;
                        break;
                }
                
                lteData.retryCount = 0;
                LTE_ClearRx();
            }
            else if (resp == LTE_RESP_ERROR)
            {
                // NETCLOSE ??? ERROR ?????????????? - ????????? ?????
                if (lteData.pendingState == LTE_STATE_NETCLOSE)
                {
                    LTE_DEBUG("NETCLOSE error (already closed), continue...");
                    lteData.state = LTE_STATE_NETOPEN;
                    lteData.retryCount = 0;
                }
                // CHECK_NETOPEN ??? ERROR - ????????????? ?? NETOPEN ???
                else if (lteData.pendingState == LTE_STATE_CHECK_NETOPEN)
                {
                    LTE_DEBUG("NETOPEN? error, assume closed, opening...");
                    lteData.state = LTE_STATE_NETOPEN;
                    lteData.retryCount = 0;
                }
                else
                {
                    LTE_DEBUG("AT Command Error!");
                    lteData.retryCount++;
                    if (lteData.retryCount > LTE_MAX_RETRIES)
                    {
                        lteData.state = LTE_STATE_ERROR;
                    }
                    else
                    {
                        // Retry current command
                        lteData.state = lteData.pendingState;
                    }
                }
                LTE_ClearRx();
            }
            else if (LTE_IsTimeout(lteData.startTime, lteData.timeout))
            {
                LTE_DEBUG("Timeout! pendingState=%s, buffer=%d bytes", 
                    LTE_StateStr(lteData.pendingState), lteData.rxIndex);
                if (lteData.rxIndex > 0)
                {
                    LTE_HexDump("TIMEOUT BUFFER", lteData.rxBuffer, 
                        lteData.rxIndex > 128 ? 128 : lteData.rxIndex);
                }
                
                // Special handling for network check - keep retrying
                if (lteData.pendingState == LTE_STATE_CHECK_NETWORK)
                {
                    lteData.retryCount++;
                    if (lteData.retryCount > LTE_MAX_RETRIES * 3)
                    {
                        lteData.state = LTE_STATE_ERROR;
                    }
                    else
                    {
                        lteData.state = LTE_STATE_CHECK_NETWORK;
                    }
                }
                else
                {
                    lteData.retryCount++;
                    if (lteData.retryCount > LTE_MAX_RETRIES)
                    {
                        lteData.state = LTE_STATE_ERROR;
                    }
                    else
                    {
                        lteData.state = lteData.pendingState;
                    }
                }
                LTE_ClearRx();
            }
            break;
        }
        
        // =============================================================
        // ERROR
        // =============================================================
        case LTE_STATE_ERROR:
        {
            LTE_DEBUG("ERROR! Reconnecting in %d ms...", LTE_RECONNECT_DELAY);
            lteData.connStatus = LTE_CONN_ERROR;
            lteData.startTime = LTE_Tick();
            lteData.state = LTE_STATE_RECONNECT;
            break;
        }
        
        // =============================================================
        // RECONNECT
        // =============================================================
        case LTE_STATE_RECONNECT:
        {
            if (LTE_IsTimeout(lteData.startTime, LTE_RECONNECT_DELAY))
            {
                LTE_DEBUG("Reconnecting...");
                
                // Close network first
                LTE_SendAT("AT+NETCLOSE");
                
                // Reset state
                lteData.retryCount = 0;
                lteData.pdpActive = false;
                lteData.serverRunning = false;
                lteData.client.connected = false;
                lteData.connStatus = LTE_CONN_DISCONNECTED;
                
                // Small delay then restart
                lteData.startTime = LTE_Tick();
                lteData.timeout = 2000;
                
                // Go back to init
                lteData.state = LTE_STATE_INIT;
            }
            break;
        }
        
        default:
            lteData.state = LTE_STATE_INIT;
            break;
    }
}

// *****************************************************************************
// Section: API Functions
// *****************************************************************************

bool APP_LTE_IsConnected(void)
{
    return lteData.serverRunning;
}

bool APP_LTE_IsClientConnected(void)
{
    return lteData.client.connected;
}

LTE_CONN_STATUS APP_LTE_GetStatus(void)
{
    return lteData.connStatus;
}

int8_t APP_LTE_GetSignal(void)
{
    return lteData.signalQuality;
}

const char* APP_LTE_GetIP(void)
{
    return lteData.ipAddress;
}

void APP_LTE_SendData(uint8_t* data, uint16_t len)
{
    LTE_DEBUG(">>> APP_LTE_SendData called: len=%d, pending=%d, connected=%d",
        len, lteData.txQueue.pending, lteData.client.connected);
    
    if (len > 0 && len <= LTE_TX_BUFFER_SIZE && !lteData.txQueue.pending)
    {
        memcpy(lteData.txQueue.data, data, len);
        lteData.txQueue.length = len;
        lteData.txQueue.pending = true;
        LTE_DEBUG(">>> Queued %d bytes for TX to HES", len);
        LTE_HexDump("QUEUED TX", data, len);
    }
    else
    {
        LTE_DEBUG(">>> SendData REJECTED: len=%d (max=%d), pending=%d",
            len, LTE_TX_BUFFER_SIZE, lteData.txQueue.pending);
    }
}

bool APP_LTE_HasData(void)
{
    return lteData.dlmsDataReady;
}

uint16_t APP_LTE_GetData(uint8_t* buffer, uint16_t maxLen)
{
    if (!lteData.dlmsDataReady || lteData.dlmsRxLen == 0)
    {
        return 0;
    }
    
    uint16_t copyLen = (lteData.dlmsRxLen > maxLen) ? maxLen : lteData.dlmsRxLen;
    memcpy(buffer, lteData.dlmsRxBuffer, copyLen);
    
    lteData.dlmsDataReady = false;
    lteData.dlmsRxLen = 0;
    
    return copyLen;
}

void APP_LTE_Reconnect(void)
{
    LTE_DEBUG("Manual reconnect requested");
    lteData.state = LTE_STATE_ERROR;
}

void APP_LTE_CloseClient(void)
{
    if (lteData.client.connected)
    {
        LTE_DEBUG("Closing client connection...");
        LTE_SendATF("AT+CIPCLOSE=%d", lteData.client.linkNum);
        lteData.client.connected = false;
    }
}

/*******************************************************************************
 End of File
 */