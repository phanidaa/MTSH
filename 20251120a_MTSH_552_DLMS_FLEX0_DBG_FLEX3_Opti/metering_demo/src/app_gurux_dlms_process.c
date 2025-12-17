
#include "definitions.h"
#include "app_gurux_uart_handdle.h"
#include "app_gurux_dlms_process.h"
#include "app_gurux_process_ee_dummy.h"
#include "app_gurux_process_time.h"

#include "gurux/include/dlmssettings.h"
#include "gurux/include/date.h"
#include "gurux/include/variant.h"
#include "gurux/include/cosem.h"
#include "gurux/include/server.h"
#include "gurux/include/notify.h"
#include "gurux/include/gxserializer.h"
#include "gurux/include/cosem.h"

static void applyCipherModeForAuth(dlmsServerSettings* s);
/////////////////////////////////////////////////////////////////////////////
//DLMS settings.
dlmsServerSettings uartSettings;
//Space for client targets.
gxValueEventArg events[10];
//Space for client password.
unsigned char PASSWORD[20];
//Space for client challenge.
unsigned char C2S_CHALLENGE[64];
//Space for server challenge.
unsigned char S2C_CHALLENGE[64];

unsigned char hdlcChanged = 0;
const static char* FLAG_ID = "MCHP";
uint32_t SERIAL_NUMBER = 123456;

#define HDLC_HEADER_SIZE 17
#define HDLC_BUFFER_SIZE 512

#define PDU_BUFFER_SIZE 1024

#define WRAPPER_BUFFER_SIZE 8 + PDU_BUFFER_SIZE

//Buffer where frames are saved.
static unsigned char frameBuff[HDLC_BUFFER_SIZE + HDLC_HEADER_SIZE];
//Buffer where PDUs are saved.
static unsigned char pduBuff[PDU_BUFFER_SIZE];
static unsigned char replyFrame[HDLC_BUFFER_SIZE + HDLC_HEADER_SIZE];
//Define server system title.
static unsigned char SERVER_SYSTEM_TITLE[8] = {0};

#define USE_TIME_INTERRUPT

static gxByteBuffer reply;

static long started;

//Define profile generic buffer row data for Load profile.

typedef struct {
    //Date-time value of the clock.
    uint32_t time;
    //Active power L1 value.
    uint16_t activePowerL1;
    uint8_t status;
} gxLoadProfileData;

/*Profile Generic buffer row data for Meter Information */
typedef struct {
    uint32_t time;
    char *logicalDeviceName; //logical device name
    char *identifier; //meter identifier
    char *manufacturer; //meter manufacturer name
    char *model; //meter model
    char *type; //meter type
    char *barCode; //meter bard code
    char *qrCode; //meter qr code
    char *comm_id; //communication module identifier
    float b_current; //basic current
    float max_current; //maximum current
    float n_frequency; //nominal frequency
    float n_voltage; //nominal voltage
    float mc; //meter constant
    float pulse; //active energy pulse output
    char *acc_class; //meter accuracy class
    char *fw_id; //active firmware identifier
    char *fw_version; //active firmware version
    char *comm_fw_id; //communication module active firmware identifier
    char *comm_fw_version; //communication module active firmware version
    uint32_t numeratorCurrent; //transformer ratio current numerator
    uint32_t denominatorCurrent; //transformer ratio current denominator
    uint32_t numeratorVoltage; //transformer ratio voltage numerator
    uint32_t denominatorVoltage; //transformer ratio voltage denominator
    uint32_t overallNumerator; //overall transformer ratio numerator
    uint32_t overallDenominator; //overall transformer ratio denominator
} gxMeterInfoProfileData;

/* Profile Generic buffer row data for instantaneous registers*/
typedef struct {
    uint32_t time;
    uint32_t voltageL1;
    uint32_t voltageL2; //not used
    uint32_t currentL1;
    uint32_t currentL2; //not used
    uint32_t frequency;
    uint32_t phaseAngleL1;
    uint32_t phaseAngleL2; //not used
    uint32_t activePowerImp; //l1 only
    uint32_t reactivePowerImp; //l1 only
    uint32_t apparentPowerImp; //l1 only
    uint32_t overallPowerFactor;
} gxInstantaneousProfileData;

//Define profile generic buffer row data for event log.

typedef struct {
    //Date-time value of the clock.
    uint32_t time;
    //Occurred event.
    uint16_t event;
} gxEventLogData;

//GMAC KEYS Director) 
static const unsigned char AUTH_KEY[16] = {
    0xD0, 0xD1, 0xD2, 0xD3,
    0xD4, 0xD5, 0xD6, 0xD7,
    0xD8, 0xD9, 0xDA, 0xDB,
    0xDC, 0xDD, 0xDE, 0xDF
};
static const unsigned char BLOCK_KEY[16] = {
    0x00, 0x01, 0x02, 0x03,
    0x04, 0x05, 0x06, 0x07,
    0x08, 0x09, 0x0A, 0x0B,
    0x0C, 0x0D, 0x0E, 0x0F
};

static const unsigned char CLIENT_SYSTEM_TITLE_INIT[8] = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'};

/**
 * Association Objects
 */
static gxAssociationLogicalName associationNone; /* 0.0.43.0.1.255 - */
static gxAssociationLogicalName associationLow; /* 0.0.43.0.2.255 -  */
static gxAssociationLogicalName associationHigh; /* 0.0.40.0.3.255 - */
static gxAssociationLogicalName associationHighGMac; /* 0.0.40.0.4.255 - */
static gxAssociationLogicalName associationHighSha256; /* 0.0.40.0.5.255 - */
/**
 * Meter Information Objects
 */
char LDN[17];
char METER_ID[14];
char MAN_NAME[20];
char MODEL_NAME[25];
char METER_TYPE[3];

static gxData ldn; /* 0.0.42.0.0.255 - Logical Device Name */
static gxData meterID; /* 0.0.96.1.1.255 - Meter Identifier String */
static gxData meterManName; /* 0.0.96.1.2.255 - Manufacturer Name */
static gxData meterModelName; /* 0.0.96.1.3.255 - Meter Model Name */
static gxData meterType; /* 0.0.96.1.4.255 - Meter Type*/
static gxData commModuleID; /* 0.0.96.1.5.255 - Communication Module Identifier */
static gxRegister basicCurrent; /* 1.0.0.6.1.255 - Basic Current */
static gxRegister maximumCurrent; /* 1.0.0.6.3.255 - Maximum Current */
static gxRegister nominalFrequency; /* 1.0.0.6.2.255 - Nominal Frequency */
//static gxRegister minimumVoltage;           /* 1.65.0.0.3.255 - Minimum Voltage */
//static gxRegister maximumVoltage;           /* 1.65.0.0.4.255 - Maximum Voltage */
static gxRegister nominalVoltage; /* 1.0.0.6.0.255 - Nominal Voltage */
static gxData mcActiveEnergyLED; /* 1.0.0.3.0.255 - Meter Constant (Active Energy) Metrological LED */
static gxData mcActiveEnergyPulse; /* 1.0.0.3.3.255 - Meter Constant (Active Energy) Pulse Output */
static gxData meterAccuracyClass; /* 0.65.0.0.0.255 - Meter Accuracy Class */
static gxData meterActiveFWID; /* 0.0.0.2.0.255 - Meter - Active Firmware Identifier */
static gxData meterActiveFWV; /* 0.0.0.2.1.255 - Meter - Active Firmware Version */
static gxData commModuleActiveFWID; /* 0.1.0.2.0.255 - Communication Module - Active Firmware Identifier */
static gxData commModuleActiveFWV; /* 0.1.0.2.1.255 - Communication Module - Active Firmware Version */
static gxData meterBarCode; /* 0.0.96.1.5.255 - Meter Bar Code */
static gxData meterQRCode; /* 0.0.96.1.6.255 - Meter QR Code */
static gxData tratioCurrentNumerator; /* 1.0.0.4.2.255 - Transformer Ratio - Current Numerator */
static gxData tratioVoltageNumerator; /* 1.0.0.4.3.255 - Transformer Ratio - Voltage Numerator */
static gxData overallTRatioNumerator; /* 1.0.0.4.4.255 - Overall Transformer Ratio Numerator */
static gxData tratioCurrentDenominator; /* 1.0.0.4.5.255 - Transformer Ratio - Current Denominator */
static gxData tratioVoltageDenominator; /* 1.0.0.4.6.255 - Transformer Ratio - Voltage Denominator */
static gxData overallTRatioDenominator; /* 1.0.0.4.7.255 - Overall Transformer Ratio Denominator */
static gxData geographicalInfo; /* 0.65.0.0.1.255 - Geographical Information */
static gxData servicePointReference; /* 0.65.0.0.2.255 - Service Point Reference Number */
static gxData transformerID; /* 0.65.0.0.3.255 - Transformer ID */
static gxData lineMagneticLossCoef; /* 1.0.0.10.0.255 - Line Magnetic Losses Coefficient */
static gxData lineIronLossCoef; /* 1.0.0.10.1.255 - Line Iron Losses Coefficient */
static gxData lineResistanceLossCoef; /* 1.0.0.10.2.255 - Line Resistance Losses Coefficient */
static gxData lineReactanceLossCoef; /* 1.0.0.10.3.255 - Line Reactance Losses Coefficient */
static gxProfileGeneric MeterInfoProfile; /* 0.65.0.0.4.255 - Meter Identification Snapshot Profile */
static gxData meterStatus; /*  0.0.96.10.1.255 - Meter Status*/
/**
 * Time Related Objects
 */
static gxClock clock1; /* 0.0.1.0.0.255 - Clock */
static gxRegister timeShiftClock; /* 1.0.0.9.11.255 - Clock time shift event limit */
/**
 * Instantaneous Registers
 */
static gxRegister l1_VoltageInstValue; /* 1.0.32.7.0.255 - L1 Voltage */
//static gxRegister l2_VoltageInstValue;              /* 1.0.52.7.0.255 - L2 Voltage */
static gxRegister l1_CurrentInstValue; /* 1.0.31.7.0.255 - L1 Current */
//static gxRegister l2_CurrentInstValue;              /* 1.0.51.7.0.255 - L2 Current */
static gxRegister li_FrequencyInstValue; /* 1.0.14.7.0.255 - Supply Frequency */
static gxRegister l1_PhaseAngleInstValue; /* 1.0.81.7.4.255 - L1 Phase Angle */
//static gxRegister l2_PhaseAngleInstValue;           /* 1.0.81.7.15.255 - L2 Phase Angle */
static gxRegister li_impActivePowerInstValue; /* 1.0.1.7.0.255 - Li Active Power (import) */
static gxRegister li_impReactivePowerInstValue; /* 1.0.3.7.0.255 - Li Reactive Power (import) */
//static gxRegister li_impApparentPowerInstValue;     /* 1.0.9.7.0.255 - Li Apparent Power (import) */
static gxRegister li_OverallPowerFactorInstValue; /* 1.0.13.7.0.255 Instantaneous Overall Power Factor */
static gxProfileGeneric InstValueProfile; /* 1.65.0.0.15.255 - Instantaneous Registers Snapshot Profile */


/**
 *  Demand and Maximum Registers
 */
//static gxDemandRegister li_impActivePowerDemand;    /* 1.0.1.4.0.255 - Li Demand Active Power (import) */
//static gxDemandRegister li_impReactivePowerDemand;  /* 1.0.3.4.0.255 - Li Demand Reactive Power (import) */
//static gxDemandRegister li_impApparentPowerDemand;  /* 1.0.9.4.0.255 - Li Demand Apparent Power (import) */
static gxExtendedRegister li_impActivePowerMaxim; /* 1.0.1.6.0.255 - Li Maxim Active Power (import) */
static gxExtendedRegister li_impReactivePowerMaxim; /* 1.0.3.6.0.255 - Li Maxim Reactive Power (import) */
static gxExtendedRegister li_impApparentPowerMaxim; /* 1.0.9.6.0.255 - Li Maxim Apparent Power (import) */
static gxProfileGeneric DemandMaximProfile; /* 1.65.0.0.16.255 - Demand and Maximum Demand Registers Snapshot Profile */

/**
 * Energy Registers
 */
static gxRegister li_impActiveEnergyCumulative; /* 1.0.1.8.0.255 - Cumulative Active Energy (import) */
static gxRegister li_expActiveEnergyCumulative; /* 1.0.2.8.0.255 - Cumulative Active Energy (export) */
static gxRegister li_impReactiveEnergyCumulative; /* 1.0.3.8.0.255 - Cumulative Reactive Energy (import) */
static gxRegister li_expReactiveEnergyCumulative; /* 1.0.4.8.0.255 - Cumulative Reactive Energy (export) */
static gxRegister li_impApparentEnergyCumulative; /* 1.0.9.8.0.255 - Cumulative Apparent Energy (import) */
static gxRegister li_expApparentEnergyCumulative; /* 1.0.10.8.0.255 - Cumulative Apparent Energy (export) */
//static gxRegister li_absActiveEnergyCumulative;     /* 1.0.15.8.0.255 - Cumulative Active Energy (absolute/forward) */
//static gxRegister li_netActiveEnergyCumulative;     /* 1.0.16.8.0.2555 - Cumulative Active Energy (net) */
static gxProfileGeneric EnergyProfile; /* 1.65.0.0.17.255 - Energy Registers Snapshot Profile */

//Is meter in test mode. This is used to serialize data and it's not shown in association view.
static gxData testMode;
//blockCipherKey. This is used to serialize data and it's not shown in association view.
static gxData blockCipherKey;
//authenticationKey. This is used to serialize data and it's not shown in association view.
static gxData authenticationKey;
//KEK. This is used to serialize data and it's not shown in association view.
static gxData kek;
//Server invocationCounter. This is used to serialize data and it's not shown in association view.
static gxData serverInvocationCounter;
// static gxData eepromContent;
static gxData eventCode;
static gxData unixTime;
static gxData invocationCounter;
//IEC HDLC Setup.
gxIecHdlcSetup hdlc;

static gxScriptTable scriptTableGlobalMeterReset;
static gxScriptTable scriptTableDisconnectControl;
static gxScriptTable scriptTableActivatetestMode;
static gxScriptTable scriptTableActivateNormalMode;
static gxProfileGeneric eventLog;
static gxActionSchedule actionScheduleDisconnectOpen;
static gxActionSchedule actionScheduleDisconnectClose;
static gxPushSetup pushSetup;
static gxDisconnectControl disconnectControl;
static gxProfileGeneric profileGeneric;
static gxSecuritySetup securitySetupLow;
static gxSecuritySetup securitySetupHigh;
static gxSecuritySetup securitySetupHighGMAC;
static gxSecuritySetup securitySetupHighSha256;

static gxSerializerSettings serializerSettings;

//1.0.10.8.0.255 Cumulative Energy-kVAh - Export
gxRegister cumulativeEnergyKvahExport;

//1.0.2.8.0.255 Cumulative Energy-kWh - Export
gxRegister cumulativeEnergyKwhExport;

//1.0.9.8.0.255 Cumulative Energy-kVAh - Import
gxRegister cumulativeEnergyKvahImport;

//0.0.94.91.8.255 Cumulative power Ã¢â?¬â?? OFF duration in min
gxRegister cumulativePowerOffDurationInMin;

//0.0.0.1.2.255 Billing Date Import Mode
gxRegister billingDateImportMode;

//1.0.16.8.0.255 Ch. 0 Sum Li Active power    (abs(QI+QIV)-abs(QII+QIII)) Time integral 1 Rate 0 (0 is total)
gxRegister sumLiActivePowerTimeIntegral1RateIsTotal;

//1.0.3.7.0.255 Ch. 0 Sum Li Reactive power+ (QI+QII) Inst. value
gxRegister sumLiReactivePowerPlusInstValue;

//1.0.1.8.0.255 Cumulative Energy-kWh
gxRegister cumulativeEnergyKwh;

//0.0.96.7.0.255 Ch. 0 No. of power failures in all three phases
gxData noOfPowerFailuresInAllThreePhases;

//0.0.94.91.0.255 Cumulative Tamper Count
gxData cumulativeTamperCount;

//0.0.0.1.0.255 Cumulative Billing count
gxData cumulativeBillingCount;

//0.0.96.2.0.255 Cumulative Programming Count
gxData cumulativeProgrammingCount;

/////////////////////////////////////////////////////////////////
//Append new COSEM object to the end so serialization will work correctly.
static gxObject* ALL_OBJECTS[] = {
    BASE(associationNone),
    BASE(associationLow),
    BASE(associationHigh),
    BASE(associationHighGMac),
    BASE(associationHighSha256),
    BASE(securitySetupLow),
    BASE(securitySetupHigh),
    BASE(securitySetupHighGMAC),
    BASE(securitySetupHighSha256),
    BASE(ldn),
    BASE(meterID),
    BASE(meterManName),
    BASE(meterModelName),
    BASE(meterType),
    BASE(meterBarCode),
    BASE(meterQRCode),
    BASE(basicCurrent),
    BASE(maximumCurrent),
    BASE(nominalFrequency),
    //BASE(minimumVoltage),
    //BASE(maximumVoltage),
    BASE(nominalVoltage),
    BASE(testMode),
    BASE(eventCode),
    BASE(clock1),
    BASE(l1_VoltageInstValue),
    BASE(l1_CurrentInstValue),
    BASE(li_FrequencyInstValue),
    BASE(l1_PhaseAngleInstValue),
    BASE(li_impActivePowerInstValue),
    BASE(li_impReactivePowerInstValue),
    //BASE(li_impApparentPowerInstValue),
    BASE(li_OverallPowerFactorInstValue),
    BASE(InstValueProfile),
    BASE(li_impActiveEnergyCumulative),
    //BASE(li_absActiveEnergyCumulative),
    //BASE(li_netActiveEnergyCumulative),

    BASE(pushSetup),
    BASE(scriptTableGlobalMeterReset),
    BASE(scriptTableDisconnectControl),
    BASE(scriptTableActivatetestMode),
    BASE(scriptTableActivateNormalMode),
    BASE(profileGeneric),
    BASE(eventLog),
    BASE(hdlc),
    BASE(disconnectControl),
    BASE(actionScheduleDisconnectOpen),
    BASE(actionScheduleDisconnectClose),
    BASE(unixTime),
    BASE(invocationCounter),
    BASE(blockCipherKey),
    BASE(authenticationKey),
    BASE(kek),
    BASE(serverInvocationCounter)
};

/**
 * Object List for Association None
 */
static gxObject* ASSOCIATION_NONE_OBJECTS[] = {
    BASE(associationNone),
    BASE(associationLow),
    BASE(associationHigh),
    BASE(associationHighGMac),
    BASE(associationHighSha256),
    BASE(securitySetupLow),
    BASE(securitySetupHigh),
    BASE(securitySetupHighGMAC),
    BASE(securitySetupHighSha256),
    BASE(invocationCounter),
    BASE(ldn),
    BASE(clock1),
};


//List of COSEM objects that are removed from association view(s).
//Objects can be used to save meter internal data.
static gxObject* INTERNAL_OBJECTS[] = {BASE(testMode), BASE(blockCipherKey), BASE(authenticationKey), BASE(kek), BASE(serverInvocationCounter)};

////////////////////////////////////////////////////
//Define what is serialized to decrease EEPROM usage.
static gxSerializerIgnore NON_SERIALIZED_OBJECTS[] = {
    //Nothing is saved when authentication is not used.
    IGNORE_ATTRIBUTE(BASE(associationNone), GET_ATTRIBUTE_ALL()),
    //Only password is saved for low and high authentication.
    IGNORE_ATTRIBUTE(BASE(associationLow), GET_ATTRIBUTE_EXCEPT(7)),
    IGNORE_ATTRIBUTE(BASE(associationHigh), GET_ATTRIBUTE_EXCEPT(7)),
    //Only scaler and unit are saved for all register objects.
    IGNORE_ATTRIBUTE_BY_TYPE(DLMS_OBJECT_TYPE_REGISTER, GET_ATTRIBUTE(2)),
    //Association object list or association atatus are never saved.
    IGNORE_ATTRIBUTE_BY_TYPE(DLMS_OBJECT_TYPE_ASSOCIATION_LOGICAL_NAME, GET_ATTRIBUTE(2, 8)),
    //Profile generic buffer is not saved.
    IGNORE_ATTRIBUTE_BY_TYPE(DLMS_OBJECT_TYPE_PROFILE_GENERIC, GET_ATTRIBUTE(2)),
    //EEPROM is not serialized.
    // IGNORE_ATTRIBUTE(BASE(eepromContent) , GET_ATTRIBUTE_ALL())
};

#ifndef USE_TIME_INTERRUPT
static uint32_t started = 0;
#endif //USE_TIME_INTERRUPT

static uint32_t executeTime = 0;

static uint16_t activePowerL1Value = 0;

typedef enum {
    //Meter is powered.
    GURUX_EVENT_CODES_POWER_UP = 0x1,
    //User has change the time.
    GURUX_EVENT_CODES_TIME_CHANGE = 0x2,
    //DST status is changed.
    GURUX_EVENT_CODES_DST = 0x4,
    //Push message is sent.
    GURUX_EVENT_CODES_PUSH = 0x8,
    //Meter makes auto connect.
    GURUX_EVENT_CODES_AUTO_CONNECT = 0x10,
    //User has change the password.
    GURUX_EVENT_CODES_PASSWORD_CHANGED = 0x20,
    //Wrong password tried 3 times.
    GURUX_EVENT_CODES_WRONG_PASSWORD = 0x40,
    //Disconnect control state is changed.
    GURUX_EVENT_CODES_OUTPUT_RELAY_STATE = 0x80,
    //User has reset the meter.
    GURUX_EVENT_CODES_GLOBAL_METER_RESET = 0x100
} GURUX_EVENT_CODES;




///////////////////////////////////////////////////////////////////////
// Write trace to the serial port.
//
// This can be used for debugging.
///////////////////////////////////////////////////////////////////////

void GXTRACE(const char* str, const char* data) {
    //Send trace to the serial port in test mode.
    /*if (GX_GET_BOOL(testMode.value))
    {
        if (data == NULL)
        {
            printk("%s\n", str);
        }
        else
        {
            printk("%s %s\n", str, data);
        }
    }*/
}

///////////////////////////////////////////////////////////////////////
// Write trace to the serial port.
//
// This can be used for debugging.
///////////////////////////////////////////////////////////////////////

void GXTRACE_INT(const char* str, int32_t value) {
    char data[10];
    int ret = sprintf(data, " %ld", value);
    if (ret > 0) {
        data[ret] = 0;
        GXTRACE(str, data);
    }
}

///////////////////////////////////////////////////////////////////////
// Write trace to the serial port.
//
// This can be used for debugging.
///////////////////////////////////////////////////////////////////////

void GXTRACE_LN(const char* str, uint16_t type, unsigned char* ln) {
    char buff[30] = {0};
    int ret = sprintf(buff, "%d %d.%d.%d.%d.%d.%d", type, ln[0], ln[1], ln[2], ln[3], ln[4], ln[5]);
    if (ret > 0) {
        buff[ret] = 0;
        GXTRACE(str, buff);
    }
}

/////////////////////////////////////////////////////////////////////////////
// Save data to the EEPROM.
//
// Only updated value is saved. This is done because write to EEPROM is slow
// and there is a limit how many times value can be written to the EEPROM.
/////////////////////////////////////////////////////////////////////////////

int saveSettings(gxObject* savedObject, uint16_t savedAttributes) {
    int ret = 0;
    serializerSettings.savedObject = savedObject;
    serializerSettings.savedAttributes = savedAttributes;
    if ((ret = ser_saveObjects(&serializerSettings, ALL_OBJECTS, sizeof (ALL_OBJECTS) / sizeof (ALL_OBJECTS[0]))) != 0) {
        GXTRACE_INT(GET_STR_FROM_EEPROM("saveObjects failed: "), ret);
    }
    GXTRACE_INT(GET_STR_FROM_EEPROM("saveObjects succeeded. Index: "), serializerSettings.updateStart);
    GXTRACE_INT(GET_STR_FROM_EEPROM("Count: "), serializerSettings.updateEnd - serializerSettings.updateStart);
    return ret;
}

uint16_t eventLogRowIndex = 0;

void captureEventLog(uint16_t value) {
    int ret;
    gxEventLogData row;
    // Profile generic Capture is called. Save data to the buffer.
    // Ring buffer is used here.
    row.time = time_current();
    row.event = value;
    ret = SERIALIZER_SAVE(SETTINGS_BUFFER_SIZE + LOAD_PROFILE_BUFFER_SIZE + (eventLogRowIndex * sizeof (gxEventLogData)), sizeof (gxEventLogData), &row);

    //Update how many entries is used until buffer is full.
    if (eventLog.entriesInUse != eventLog.profileEntries) {
        ++eventLog.entriesInUse;
    }
    //Update row index where next row is added.
    ++eventLogRowIndex;
    eventLogRowIndex = eventLogRowIndex % eventLog.profileEntries;
    //saveSettings(BASE(eventLog), GET_ATTRIBUTE(7));
}

void updateState(uint16_t value) {
    GX_UINT16(eventCode.value) = value;
    captureEventLog(value);
    //Update Entries in use for even log.
    //saveSettings(BASE(eventLog), GET_ATTRIBUTE(7));
}

/////////////////////////////////////////////////////////////////////////////
// Load data from the EEPROM.
// Returns serialization version or zero if data is not saved.
/////////////////////////////////////////////////////////////////////////////

int loadSettings() {
    int ret = 0;
    serializerSettings.position = 0;
    ret = ser_loadObjects(&uartSettings.base, &serializerSettings, ALL_OBJECTS, sizeof (ALL_OBJECTS) / sizeof (ALL_OBJECTS[0]));
    if (ret != 0) {
        GXTRACE_INT(GET_STR_FROM_EEPROM("Failed to load settings from EEPROM."), serializerSettings.position);
    }
    return ret;
}

///////////////////////////////////////////////////////////////////////
//This method adds example Logical Name Association object.
///////////////////////////////////////////////////////////////////////

int addAssociationNone() {
    int ret;
    const unsigned char ln[6] = {0, 0, 40, 0, 16, 255};
    if ((ret = INIT_OBJECT(associationNone, DLMS_OBJECT_TYPE_ASSOCIATION_LOGICAL_NAME, ln)) == 0) {
        //All objects are shown also without authentication.
        OA_ATTACH(associationNone.objectList, ASSOCIATION_NONE_OBJECTS);
        //Uncomment this if you want to show only part of the objects without authentication.
        //OA_ATTACH(associationNone.objectList, NONE_OBJECTS);
        associationNone.authenticationMechanismName.mechanismId = DLMS_AUTHENTICATION_NONE;
        associationNone.applicationContextName.contextId = DLMS_APPLICATION_CONTEXT_NAME_LOGICAL_NAME;
        associationNone.clientSAP = 0x10;
        //Max PDU is half of PDU size. This is for demonstration purposes only.
        associationNone.xDLMSContextInfo.maxSendPduSize = associationNone.xDLMSContextInfo.maxReceivePduSize = PDU_BUFFER_SIZE / 2;
        associationNone.xDLMSContextInfo.conformance = (DLMS_CONFORMANCE) (DLMS_CONFORMANCE_GET |
                DLMS_CONFORMANCE_BLOCK_TRANSFER_WITH_GET_OR_READ);
    }
    return ret;
}

///////////////////////////////////////////////////////////////////////
//This method adds example Logical Name Association object.
///////////////////////////////////////////////////////////////////////

int addAssociationLow() {
    int ret;
    const unsigned char ln[6] = {0, 0, 40, 0, 17, 255};
    static unsigned char SECRET[20];
    if ((ret = INIT_OBJECT(associationLow, DLMS_OBJECT_TYPE_ASSOCIATION_LOGICAL_NAME, ln)) == 0) {
        BB_ATTACH(associationLow.secret, SECRET, 0);
        //Only Logical Device Name is add to this Association View.
        OA_ATTACH(associationLow.objectList, ALL_OBJECTS);
        associationLow.authenticationMechanismName.mechanismId = DLMS_AUTHENTICATION_LOW;
        associationLow.applicationContextName.contextId = DLMS_APPLICATION_CONTEXT_NAME_LOGICAL_NAME;
        associationLow.clientSAP = 0x11;
        associationLow.xDLMSContextInfo.maxSendPduSize = associationLow.xDLMSContextInfo.maxReceivePduSize = PDU_BUFFER_SIZE;
        associationLow.xDLMSContextInfo.conformance = (DLMS_CONFORMANCE) (DLMS_CONFORMANCE_BLOCK_TRANSFER_WITH_GET_OR_READ |
                DLMS_CONFORMANCE_SELECTIVE_ACCESS |
                DLMS_CONFORMANCE_ACTION |
                DLMS_CONFORMANCE_GET);
        memcpy((char*) SECRET, "Gurux", 5);
        associationLow.secret.size = 5;
#ifndef DLMS_IGNORE_OBJECT_POINTERS
        associationLow.securitySetup = &securitySetupLow;
#else
        memcpy(associationLow.securitySetupReference, securitySetupLow.base.logicalName, 6);
#endif //DLMS_IGNORE_OBJECT_POINTERS
    }
    return ret;
}

///////////////////////////////////////////////////////////////////////
//This method adds example Logical Name Association object for High authentication.
// UA in Indian standard.
///////////////////////////////////////////////////////////////////////

int addAssociationHigh() {
    int ret;
    static unsigned char SECRET[20];
    //Dedicated key.
    static unsigned char CYPHERING_INFO[16] = {0};
    const unsigned char ln[6] = {0, 0, 40, 0, 18, 255};
    if ((ret = INIT_OBJECT(associationHigh, DLMS_OBJECT_TYPE_ASSOCIATION_LOGICAL_NAME, ln)) == 0) {
        associationHigh.authenticationMechanismName.mechanismId = DLMS_AUTHENTICATION_HIGH;
        OA_ATTACH(associationHigh.objectList, ALL_OBJECTS);
        BB_ATTACH(associationHigh.xDLMSContextInfo.cypheringInfo, CYPHERING_INFO, 0);
        associationHigh.applicationContextName.contextId = DLMS_APPLICATION_CONTEXT_NAME_LOGICAL_NAME;
        associationHigh.clientSAP = 0x12;
        associationHigh.xDLMSContextInfo.maxSendPduSize = associationHigh.xDLMSContextInfo.maxReceivePduSize = PDU_BUFFER_SIZE;
        associationHigh.xDLMSContextInfo.conformance = (DLMS_CONFORMANCE) (DLMS_CONFORMANCE_BLOCK_TRANSFER_WITH_ACTION |
                DLMS_CONFORMANCE_BLOCK_TRANSFER_WITH_SET_OR_WRITE |
                DLMS_CONFORMANCE_BLOCK_TRANSFER_WITH_GET_OR_READ |
                DLMS_CONFORMANCE_SET |
                DLMS_CONFORMANCE_SELECTIVE_ACCESS |
                DLMS_CONFORMANCE_ACTION |
                DLMS_CONFORMANCE_MULTIPLE_REFERENCES |
                DLMS_CONFORMANCE_GET);
        BB_ATTACH(associationHigh.secret, SECRET, 0);
        memcpy((char*) SECRET, "Gurux", 5);
        associationHigh.secret.size = 5;
#ifndef DLMS_IGNORE_OBJECT_POINTERS
        associationHigh.securitySetup = &securitySetupHigh;
#else
        memcpy(associationHigh.securitySetupReference, securitySetupHigh.base.logicalName, 6);
#endif //DLMS_IGNORE_OBJECT_POINTERS
    }
    return ret;
}


///////////////////////////////////////////////////////////////////////
//This method adds example Logical Name Association object for GMAC High authentication.
// UA in Indian standard.
///////////////////////////////////////////////////////////////////////

int addAssociationHighGMac() {
    int ret;
    static unsigned char CYPHERING_INFO[16] = {0};
    const unsigned char ln[6] = {0, 0, 40, 0, 19, 255};

    if ((ret = INIT_OBJECT(associationHighGMac, DLMS_OBJECT_TYPE_ASSOCIATION_LOGICAL_NAME, ln)) == 0) {
        associationHighGMac.authenticationMechanismName.mechanismId = DLMS_AUTHENTICATION_HIGH_GMAC;
        OA_ATTACH(associationHighGMac.objectList, ALL_OBJECTS);
        BB_ATTACH(associationHighGMac.xDLMSContextInfo.cypheringInfo, CYPHERING_INFO, 0);
        associationHighGMac.applicationContextName.contextId = DLMS_APPLICATION_CONTEXT_NAME_LOGICAL_NAME_WITH_CIPHERING;
        associationHighGMac.clientSAP = 0x13;
        associationHighGMac.xDLMSContextInfo.maxSendPduSize = associationHighGMac.xDLMSContextInfo.maxReceivePduSize = PDU_BUFFER_SIZE;
        associationHighGMac.xDLMSContextInfo.conformance = (DLMS_CONFORMANCE) (
                DLMS_CONFORMANCE_BLOCK_TRANSFER_WITH_ACTION |
                DLMS_CONFORMANCE_BLOCK_TRANSFER_WITH_SET_OR_WRITE |
                DLMS_CONFORMANCE_BLOCK_TRANSFER_WITH_GET_OR_READ |
                DLMS_CONFORMANCE_SET |
                DLMS_CONFORMANCE_SELECTIVE_ACCESS |
                DLMS_CONFORMANCE_ACTION |
                DLMS_CONFORMANCE_MULTIPLE_REFERENCES |
                DLMS_CONFORMANCE_GET
                );
#ifndef DLMS_IGNORE_OBJECT_POINTERS
        associationHighGMac.securitySetup = &securitySetupHighGMAC;
#else
        memcpy(associationHighGMac.securitySetupReference, securitySetupHighGMAC.base.logicalName, 6);
#endif
    }
    return ret;
}

int addAssociationHighSha256() {
    int ret;
    static unsigned char SECRET[20];
    static unsigned char CYPHERING_INFO[16] = {0};
    const unsigned char ln[6] = {0, 0, 40, 0, 20, 255}; 
    if ((ret = INIT_OBJECT(associationHighSha256, DLMS_OBJECT_TYPE_ASSOCIATION_LOGICAL_NAME, ln)) == 0) {
        associationHighSha256.authenticationMechanismName.mechanismId = DLMS_AUTHENTICATION_HIGH_SHA256;
        OA_ATTACH(associationHighSha256.objectList, ALL_OBJECTS);
        BB_ATTACH(associationHighSha256.xDLMSContextInfo.cypheringInfo, CYPHERING_INFO, 0);
        associationHighSha256.applicationContextName.contextId = DLMS_APPLICATION_CONTEXT_NAME_LOGICAL_NAME_WITH_CIPHERING;
        associationHighSha256.clientSAP = 0x14;
        associationHighSha256.xDLMSContextInfo.maxSendPduSize = associationHighSha256.xDLMSContextInfo.maxReceivePduSize = PDU_BUFFER_SIZE;
        associationHighSha256.xDLMSContextInfo.conformance = (DLMS_CONFORMANCE) (
                DLMS_CONFORMANCE_BLOCK_TRANSFER_WITH_ACTION |
                DLMS_CONFORMANCE_BLOCK_TRANSFER_WITH_SET_OR_WRITE |
                DLMS_CONFORMANCE_BLOCK_TRANSFER_WITH_GET_OR_READ |
                DLMS_CONFORMANCE_SET |
                DLMS_CONFORMANCE_SELECTIVE_ACCESS |
                DLMS_CONFORMANCE_ACTION |
                DLMS_CONFORMANCE_MULTIPLE_REFERENCES |
                DLMS_CONFORMANCE_GET);
        BB_ATTACH(associationHighSha256.secret, SECRET, 0);
        memcpy((char*) SECRET, "Gurux", 5);
        associationHighSha256.secret.size = 5;

#ifndef DLMS_IGNORE_OBJECT_POINTERS
        associationHighSha256.securitySetup = &securitySetupHighSha256;
#else
        memcpy(associationHighSha256.securitySetupReference, securitySetupHighSha256.base.logicalName, 6);
#endif
    }
    return ret;
}

///////////////////////////////////////////////////////////////////////
//This method adds security setup object for Low authentication.
///////////////////////////////////////////////////////////////////////

int addSecuritySetupLow() {
    int ret;
    static unsigned char CLIENT_SYSTEM_TITLE[8] = {0};

    const unsigned char ln[6] = {0, 0, 43, 0, 1, 255};
    if ((ret = INIT_OBJECT(securitySetupLow, DLMS_OBJECT_TYPE_SECURITY_SETUP, ln)) == 0) {
        BB_ATTACH(securitySetupLow.serverSystemTitle, SERVER_SYSTEM_TITLE, 8);
        BB_ATTACH(securitySetupLow.clientSystemTitle, CLIENT_SYSTEM_TITLE, 8);
        securitySetupLow.securityPolicy = DLMS_SECURITY_POLICY_NOTHING;
        securitySetupLow.securitySuite = DLMS_SECURITY_SUITE_V0;
    }
    return ret;
}


///////////////////////////////////////////////////////////////////////
//This method adds security setup object for High authentication.
///////////////////////////////////////////////////////////////////////

int addSecuritySetupHigh() {
    int ret;
    static unsigned char CLIENT_SYSTEM_TITLE[8] = {0};

    const unsigned char ln[6] = {0, 0, 43, 0, 2, 255};
    if ((ret = INIT_OBJECT(securitySetupHigh, DLMS_OBJECT_TYPE_SECURITY_SETUP, ln)) == 0) {
        BB_ATTACH(securitySetupHigh.serverSystemTitle, SERVER_SYSTEM_TITLE, 8);
        BB_ATTACH(securitySetupHigh.clientSystemTitle, CLIENT_SYSTEM_TITLE, 8);

        securitySetupHigh.securityPolicy = DLMS_SECURITY_POLICY_NOTHING;
        securitySetupHigh.securitySuite = DLMS_SECURITY_SUITE_V0;
    }
    return ret;
}

///////////////////////////////////////////////////////////////////////
//This method adds security setup object for High authentication.
///////////////////////////////////////////////////////////////////////

int addSecuritySetupHighGMAC() {
    int ret;
    static unsigned char CLIENT_SYSTEM_TITLE[8] = {0};
    memcpy(CLIENT_SYSTEM_TITLE, CLIENT_SYSTEM_TITLE_INIT, sizeof (CLIENT_SYSTEM_TITLE));

    const unsigned char ln[6] = {0, 0, 43, 0, 3, 255};
    if ((ret = INIT_OBJECT(securitySetupHighGMAC, DLMS_OBJECT_TYPE_SECURITY_SETUP, ln)) == 0) {
        BB_ATTACH(securitySetupHighGMAC.serverSystemTitle, SERVER_SYSTEM_TITLE, 8);
        BB_ATTACH(securitySetupHighGMAC.clientSystemTitle, CLIENT_SYSTEM_TITLE, 8);

        securitySetupHighGMAC.securitySuite = DLMS_SECURITY_SUITE_V0;
        securitySetupHighGMAC.securityPolicy = DLMS_SECURITY_POLICY_AUTHENTICATED_ENCRYPTED;
    }
    return ret;
}

int addSecuritySetupHighSha256() {
    int ret;
    static unsigned char CLIENT_SYSTEM_TITLE[8] = {0};
    //memcpy(CLIENT_SYSTEM_TITLE, CLIENT_SYSTEM_TITLE_INIT, sizeof (CLIENT_SYSTEM_TITLE));

    const unsigned char ln[6] = {0, 0, 43, 0, 4, 255};
    if ((ret = INIT_OBJECT(securitySetupHighSha256, DLMS_OBJECT_TYPE_SECURITY_SETUP, ln)) == 0) {
        BB_ATTACH(securitySetupHighSha256.serverSystemTitle, SERVER_SYSTEM_TITLE, 8);
        BB_ATTACH(securitySetupHighSha256.clientSystemTitle, CLIENT_SYSTEM_TITLE, 8);

        securitySetupHighSha256.securitySuite = DLMS_SECURITY_SUITE_V0;
        securitySetupHighSha256.securityPolicy = DLMS_SECURITY_POLICY_NOTHING;
         securitySetupHighSha256.minimumInvocationCounter = 1;
    }
    return ret;
}

///////////////////////////////////////////////////////////////////////
//Add Logical Device Name. 123456 is meter serial number.
///////////////////////////////////////////////////////////////////////
// COSEM Logical Device Name is defined as an octet-string of 16 octets.
// The first three octets uniquely identify the manufacturer of the device and it corresponds
// to the manufacturer's identification in IEC 62056-21.
// The following 13 octets are assigned by the manufacturer.
//The manufacturer is responsible for guaranteeing the uniqueness of these octets.

int addLogicalDeviceName() {
    int ret;
    const unsigned char ln[6] = {0, 0, 42, 0, 0, 255};
    if ((ret = INIT_OBJECT(ldn, DLMS_OBJECT_TYPE_DATA, ln)) == 0) {
        sprintf(LDN, "%s%.13lu", FLAG_ID, SERIAL_NUMBER);
        GX_OCTET_STRING(ldn.value, LDN, sizeof (LDN));
    }
    return ret;
}

/** Meralco Requirement - Meter Identifier */
int obj_MeterIdentifier() {
    int ret;
    const unsigned char ln[6] = {0, 0, 96, 1, 0, 255};

    if ((ret = INIT_OBJECT(meterID, DLMS_OBJECT_TYPE_DATA, ln)) == 0) {
        sprintf(METER_ID, "%s", "523PEI000001");
        GX_OCTET_STRING(meterID.value, METER_ID, sizeof (METER_ID));
    }
    return ret;
}

/** Meralco Requirement - Meter Manufacturer Name */
int obj_MeterManName() {
    int ret;
    const unsigned char ln[6] = {0, 0, 96, 1, 2, 255};

    if ((ret = INIT_OBJECT(meterManName, DLMS_OBJECT_TYPE_DATA, ln)) == 0) {
        sprintf(MAN_NAME, "%s", "Ionics EMS Inc.");
        GX_STRING(meterManName.value, MAN_NAME, sizeof (MAN_NAME));
    }
    return ret;
}

/** Meralco Requirement - Meter Model Name */
int obj_MeterModel() {
    int ret;
    const unsigned char ln[6] = {0, 0, 96, 1, 3, 255};

    if ((ret = INIT_OBJECT(meterModelName, DLMS_OBJECT_TYPE_DATA, ln)) == 0) {
        sprintf(MODEL_NAME, "%s", "Hybrid Smart Meter");
        GX_STRING(meterModelName.value, MODEL_NAME, sizeof (MODEL_NAME));
    }
    return ret;
}

/** Meralco Requirement - Meter Type */
int obj_MeterType() {
    int ret;
    const unsigned char ln[6] = {0, 0, 96, 1, 4, 255};

    if ((ret = INIT_OBJECT(meterType, DLMS_OBJECT_TYPE_DATA, ln)) == 0) {
        GX_STRING(meterType.value, "5", sizeof ("5"));
    }
    return ret;
}

/**
 * Data: Meter Bar Code
 */
int obj_meterBarCode() {
    int ret;
    const unsigned char ln[6] = {0, 0, 96, 1, 5, 255};
    if ((ret = INIT_OBJECT(meterBarCode, DLMS_OBJECT_TYPE_DATA, ln)) == 0) {
        GX_STRING(meterBarCode.value, "Meter Bar Code", sizeof ("Meter Bar Code"));
    }
    return ret;
}

/**
 * Data: Meter QR Code
 */
int obj_meterQRCode() {
    int ret;
    const unsigned char ln[6] = {0, 0, 96, 1, 6, 255};
    if ((ret = INIT_OBJECT(meterQRCode, DLMS_OBJECT_TYPE_DATA, ln)) == 0) {
        GX_STRING(meterQRCode.value, "Meter QR Code", sizeof ("Meter QR Code"));
    }
    return ret;
}

/**
 * Register: Basic/Nominal Current
 */
int obj_basicCurrent() {
    int ret;
    const unsigned char ln[6] = {1, 0, 0, 6, 1, 255};
    if ((ret = INIT_OBJECT(basicCurrent, DLMS_OBJECT_TYPE_REGISTER, ln)) == 0) {
        GX_UINT32(basicCurrent.value) = 5;
        basicCurrent.scaler = 0;
        basicCurrent.unit = DLMS_UNIT_CURRENT;
    }
    return ret;
}

/**
 * Register: Maximum Current
 */
int obj_maximumCurrent() {
    int ret;
    const unsigned char ln[6] = {1, 0, 0, 6, 3, 255};
    if ((ret = INIT_OBJECT(maximumCurrent, DLMS_OBJECT_TYPE_REGISTER, ln)) == 0) {
        GX_UINT32(maximumCurrent.value) = 10;
        maximumCurrent.scaler = 0;
        maximumCurrent.unit = DLMS_UNIT_CURRENT;
    }
    return ret;
}

/**
 * Register: Nominal Frequency
 */
int obj_nominalFrequency() {
    int ret;
    const unsigned char ln[6] = {1, 0, 0, 6, 2, 255};
    if ((ret = INIT_OBJECT(nominalFrequency, DLMS_OBJECT_TYPE_REGISTER, ln)) == 0) {
        GX_UINT32(nominalFrequency.value) = 60;
        nominalFrequency.scaler = 0;
        nominalFrequency.unit = DLMS_UNIT_FREQUENCY;
    }
    return ret;
}

int obj_meterStatus() {
    int ret;
    static unsigned char ln[6] = {0, 0, 96, 10, 1, 255}; // OBIS: 0-0:96.10.1.255
    if ((ret = INIT_OBJECT(meterStatus, DLMS_OBJECT_TYPE_DATA, ln)) == 0) {
        GX_UINT8(meterStatus.value) = 0;
    }
    return ret;
}

/**
 * Register: Minimum Voltage
 */
//int obj_minimumVoltage()
//{
//    int ret;
//    const unsigned char ln[6] = { 1, 65, 0, 0, 3, 255 };
//    if ((ret = INIT_OBJECT(minimumVoltage, DLMS_OBJECT_TYPE_REGISTER, ln)) == 0)
//    {
//        GX_UINT32(minimumVoltage.value) = 198;
//        minimumVoltage.scaler = 0;
//        minimumVoltage.unit = DLMS_UNIT_VOLTAGE;
//    }
//    return ret;
//}

/**
 * Register: Maximum Voltage
 */
//int obj_maximumVoltage()
//{
//    int ret;
//    const unsigned char ln[6] = { 1, 65, 0, 0, 4, 255 };
//    if ((ret = INIT_OBJECT(maximumVoltage, DLMS_OBJECT_TYPE_REGISTER, ln)) == 0)
//    {
//        GX_UINT32(maximumVoltage.value) = 264;
//        maximumVoltage.scaler = 0;
//        maximumVoltage.unit = DLMS_UNIT_VOLTAGE;
//    }
//    return ret;
//}

/**
 * Register: Nominal Voltage
 */
int obj_nominalVoltage() {
    int ret;
    const unsigned char ln[6] = {1, 0, 0, 6, 0, 255};
    if ((ret = INIT_OBJECT(nominalVoltage, DLMS_OBJECT_TYPE_REGISTER, ln)) == 0) {
        GX_UINT32(nominalVoltage.value) = 230;
        nominalVoltage.scaler = 0;
        nominalVoltage.unit = DLMS_UNIT_VOLTAGE;
    }
    return ret;
}


//Add event code object.

int addEventCode() {
    int ret;
    const unsigned char ln[6] = {0, 0, 96, 11, 0, 255};
    if ((ret = INIT_OBJECT(eventCode, DLMS_OBJECT_TYPE_DATA, ln)) == 0) {
        GX_UINT16(eventCode.value) = 0;
    }
    return ret;
}

//Add unix time object.

int addUnixTime() {
    int ret;
    const unsigned char ln[6] = {0, 0, 1, 1, 0, 255};
    if ((ret = INIT_OBJECT(unixTime, DLMS_OBJECT_TYPE_DATA, ln)) == 0) {
        //Set initial value.
        GX_UINT32(unixTime.value) = 0;
    }
    return ret;
}

//Add invocation counter object.

int addInvocationCounter() {
    int ret;
    const unsigned char ln[6] = {0, 0, 43, 1, 0, 255}; // 0.0.43.1.0.255
    if ((ret = INIT_OBJECT(invocationCounter, DLMS_OBJECT_TYPE_DATA, ln)) == 0) {
        GX_UINT32_BYREF(invocationCounter.value, uartSettings.base.cipher.invocationCounter);
    }
    return ret;
}

///////////////////////////////////////////////////////////////////////
// Is meter in test mode.
// This is used to serialize the data and it's not in association view.

int addTestMode() {
    int ret;
    const unsigned char ln[6] = {0, 128, 1, 0, 0, 255};
    if ((ret = INIT_OBJECT(testMode, DLMS_OBJECT_TYPE_DATA, ln)) == 0) {
        GX_BOOL(testMode.value) = 1;
    }
    return ret;
}

///////////////////////////////////////////////////////////////////////
// BlockCipher key.
// This is used to serialize the data and it's not in association view.

int addBlockCipherKey() {
    int ret;
    const unsigned char ln[6] = {0, 128, 2, 0, 0, 255};
    if ((ret = INIT_OBJECT(blockCipherKey, DLMS_OBJECT_TYPE_DATA, ln)) == 0) {
        GX_OCTET_STRING(blockCipherKey.value, uartSettings.base.cipher.blockCipherKey, 16);
    }
    return ret;
}

///////////////////////////////////////////////////////////////////////
// Authentication key.
// This is used to serialize the data and it's not in association view.

int addAuthenticationKey() {
    int ret;
    const unsigned char ln[6] = {0, 128, 3, 0, 0, 255};
    if ((ret = INIT_OBJECT(authenticationKey, DLMS_OBJECT_TYPE_DATA, ln)) == 0) {
        GX_OCTET_STRING(authenticationKey.value, uartSettings.base.cipher.authenticationKey, 16);
    }
    return ret;
}

///////////////////////////////////////////////////////////////////////
// Kek.
// This is used to serialize the data and it's not in association view.

int addKek() {
    int ret;
    const unsigned char ln[6] = {0, 128, 4, 0, 0, 255};
    if ((ret = INIT_OBJECT(kek, DLMS_OBJECT_TYPE_DATA, ln)) == 0) {
        GX_OCTET_STRING(kek.value, uartSettings.base.kek, 16);
    }
    return ret;
}

///////////////////////////////////////////////////////////////////////
// Server Invocation Counter.
// This is used to serialize the data and it's not in association view.

int addServerInvocationCounter() {
    int ret;
    const unsigned char ln[6] = {0, 128, 5, 0, 0, 255};
    if ((ret = INIT_OBJECT(serverInvocationCounter, DLMS_OBJECT_TYPE_DATA, ln)) == 0) {
        GX_UINT32_BYREF(serverInvocationCounter.value, uartSettings.base.cipher.invocationCounter);
    }
    return ret;
}

///////////////////////////////////////////////////////////////////////
//Add push setup object. (On Connectivity)
///////////////////////////////////////////////////////////////////////

int addPushSetup() {
    int ret;
    const unsigned char ln[6] = {0, 0, 25, 9, 0, 255};
    static gxTimePair COMMUNICATION_WINDOW[10];
    static unsigned char DESTINATION[20] = {0};
    static gxTarget PUSH_OBJECTS[6];
    if ((ret = INIT_OBJECT(pushSetup, DLMS_OBJECT_TYPE_PUSH_SETUP, ln)) == 0) {
        pushSetup.service = DLMS_SERVICE_TYPE_HDLC;
        BB_ATTACH(pushSetup.destination, DESTINATION, 0);
        ARR_ATTACH(pushSetup.communicationWindow, COMMUNICATION_WINDOW, 2);
        ARR_ATTACH(pushSetup.pushObjectList, PUSH_OBJECTS, 2);
        //This push is sent every minute, but max 10 seconds over.
        time_init(&COMMUNICATION_WINDOW[0].first, -1, -1, -1, -1, -1, 0, 0, 0);
        time_init(&COMMUNICATION_WINDOW[0].second, -1, -1, -1, -1, -1, 10, 0, 0);
        //This push is sent every half minute, but max 40 seconds over.
        time_init(&COMMUNICATION_WINDOW[1].first, -1, -1, -1, -1, -1, 30, 0, 0);
        time_init(&COMMUNICATION_WINDOW[1].second, -1, -1, -1, -1, -1, 40, 0, 0);
        // Add logical device name.
        PUSH_OBJECTS[0].target = BASE(ldn);
        PUSH_OBJECTS[0].attributeIndex = 2;
        PUSH_OBJECTS[0].dataIndex = 0;
        // Add push object logical name. This is needed to tell structure of data to the Push listener.
        // Also capture object list can be used here.
        PUSH_OBJECTS[1].target = BASE(pushSetup);
        PUSH_OBJECTS[1].attributeIndex = 1;
        PUSH_OBJECTS[1].dataIndex = 0;
    }
    return ret;
}

///////////////////////////////////////////////////////////////////////
//This method adds example clock object.
///////////////////////////////////////////////////////////////////////

int obj_Clock() {
    int ret = 0;
    //Add default clock. Clock's Logical Name is 0.0.1.0.0.255.
    const unsigned char ln[6] = {0, 0, 1, 0, 0, 255};
    if ((ret = INIT_OBJECT(clock1, DLMS_OBJECT_TYPE_CLOCK, ln)) == 0) {
        //Set default values.
        // time_init(&clock1.begin, -1, 3, -1, 2, 0, 0, 0, 0);
        // clock1.begin.extraInfo = DLMS_DATE_TIME_EXTRA_INFO_LAST_DAY;
        // time_init(&clock1.end, -1, 10, -1, 3, 0, 0, 0, 0);
        // clock1.end.extraInfo = DLMS_DATE_TIME_EXTRA_INFO_LAST_DAY;
        //Meter is using UTC time zone.
        clock1.timeZone = 480;
        //Deviation is 60 minutes.
        clock1.deviation = 60;
        clock1.clockBase = DLMS_CLOCK_BASE_CRYSTAL;
    }
    return ret;
}

///////////////////////////////////////////////////////////////////////
//This method adds example register object.
///////////////////////////////////////////////////////////////////////

/**
 * Register: L1 Instantaneous Voltage Value
 */
uint32_t dlms_process_l1Voltage(void) {
    uint32_t scaler;
    uint32_t vt = read_voltage(&scaler, 0);
    vt = vt / scaler;

    GX_UINT32(l1_VoltageInstValue.value) = vt;
    return vt;
}

int obj_l1VoltageInstValue() {
    int ret;
    const unsigned char ln[6] = {1, 0, 32, 7, 0, 255};
    if ((ret = INIT_OBJECT(l1_VoltageInstValue, DLMS_OBJECT_TYPE_REGISTER, ln)) == 0) {
        l1_VoltageInstValue.scaler = -3;
        l1_VoltageInstValue.unit = DLMS_UNIT_VOLTAGE;
    }
    return ret;
}



/**
 * Register: L2 Instantaneous Voltage Value
 */
//uint32_t dlms_process_l2Voltage(void)
//{
//    uint32_t scaler;
//    uint32_t vt = read_voltage(&scaler,1);
//    vt = vt/scaler;
//    GX_UINT32(l2_VoltageInstValue.value) = vt;
//    return vt;
//}

//int obj_l2VoltageInstValue()
//{
//    int ret;
//    const unsigned char ln[6] = { 1, 0, 52, 7, 0, 255 };
//    if ((ret = INIT_OBJECT(l2_VoltageInstValue, DLMS_OBJECT_TYPE_REGISTER, ln)) == 0)
//    {
//        l2_VoltageInstValue.scaler = -3;
//        l2_VoltageInstValue.unit = DLMS_UNIT_VOLTAGE;
//    }
//    return ret;
//}

/**
 * Register: L1 Instantaneous Current Value
 */
uint32_t dlms_process_l1Current(void) {
    uint32_t scaler;
    uint32_t cur = read_current(&scaler, 0);
    cur = cur / scaler;
    GX_UINT32(l1_CurrentInstValue.value) = cur;
    return cur;
}

int obj_l1CurrentInstValue() {
    int ret;
    const unsigned char ln[6] = {1, 0, 31, 7, 0, 255};
    if ((ret = INIT_OBJECT(l1_CurrentInstValue, DLMS_OBJECT_TYPE_REGISTER, ln)) == 0) {
        l1_CurrentInstValue.scaler = -3;
        l1_CurrentInstValue.unit = DLMS_UNIT_CURRENT;
    }
    return ret;
}

/**
 * Register: L2 Instantaneous Current Value
 */
//uint32_t dlms_process_l2Current(void)
//{
//    uint32_t scaler;
//    uint32_t cur = read_current(&scaler,1);
//    cur = cur/scaler;
//    GX_UINT32(l2_CurrentInstValue.value) = cur;
//    return cur;
//}
//
//int obj_l2CurrentInstValue()
//{
//    int ret;
//    const unsigned char ln[6] = { 1, 0, 51, 7, 0, 255 };
//    if ((ret = INIT_OBJECT(l2_CurrentInstValue, DLMS_OBJECT_TYPE_REGISTER, ln)) == 0)
//    {
//        l2_CurrentInstValue.scaler = -3;
//        l2_CurrentInstValue.unit = DLMS_UNIT_CURRENT;
//    }
//    return ret;
//}

/**
 * Register: Instantaneous Supply Frequency
 */
uint32_t dlms_process_supplyFrequency(void) {
    uint32_t scaler;
    uint32_t freq = read_frequency(&scaler);
    freq = freq * scaler;
    GX_UINT32(li_FrequencyInstValue.value) = freq;
    return freq;
}

int obj_lFrequencyInstValue() {
    int ret;
    const unsigned char ln[6] = {1, 0, 14, 7, 0, 255};
    if ((ret = INIT_OBJECT(li_FrequencyInstValue, DLMS_OBJECT_TYPE_REGISTER, ln)) == 0) {
        li_FrequencyInstValue.scaler = -2;
        li_FrequencyInstValue.unit = DLMS_UNIT_FREQUENCY;
    }
    return ret;
}

/**
 * Register: Instantaneous Phase Angle
 */
uint32_t dlms_process_l1PhaseAngle() {
    uint32_t scaler;
    uint32_t angle = read_angles(&scaler, 0);
    //angle = (angle & 0xFFFF)/scaler;
    angle = angle / scaler;
    GX_UINT32(l1_PhaseAngleInstValue.value) = angle;
    return angle;
}

int obj_l1PhaseAngleInstValue() {
    int ret;
    const unsigned char ln[6] = {1, 0, 81, 7, 4, 255};
    if ((ret = INIT_OBJECT(l1_PhaseAngleInstValue, DLMS_OBJECT_TYPE_REGISTER, ln)) == 0) {
        l1_PhaseAngleInstValue.scaler = -2;
        l1_PhaseAngleInstValue.unit = DLMS_UNIT_PHASE_ANGLE_DEGREE;
    }
    return ret;
}

//uint32_t dlms_process_l2PhaseAngle()
//{
//    uint32_t scaler;
//    uint32_t angle = read_angles(&scaler, 1);
//    angle = (angle & 0xFFFF)/scaler;
//    GX_UINT32(l2_PhaseAngleInstValue.value) = angle;
//    return angle;
//}
//
//int obj_l2PhaseAngleInstValue()
//{
//    int ret;
//    const unsigned char ln[6] = { 1, 0, 81, 7, 15, 255 };
//    if((ret = INIT_OBJECT(l2_PhaseAngleInstValue, DLMS_OBJECT_TYPE_REGISTER, ln)) == 0)
//    {
//        l2_PhaseAngleInstValue.scaler = 0;
//        l2_PhaseAngleInstValue.unit = DLMS_UNIT_PHASE_ANGLE_DEGREE;
//    }
//    return ret;
//}

/**
 * Register: Instantaneous Active Power
 */
uint32_t dlms_process_ActivePower() {
    uint32_t scaler;
    uint32_t kw = read_active_power(&scaler, 0);
    kw = kw / scaler;
    GX_UINT32(li_impActivePowerInstValue.value) = kw;
    return kw;
}

int obj_activePowerInstValueImport() {
    int ret;
    const unsigned char ln[6] = {1, 0, 1, 7, 0, 255};
    if ((ret = INIT_OBJECT(li_impActivePowerInstValue, DLMS_OBJECT_TYPE_REGISTER, ln)) == 0) {
        li_impActivePowerInstValue.scaler = -1;
        li_impActivePowerInstValue.unit = DLMS_UNIT_ACTIVE_POWER;
    }
    return ret;
}

/**
 * Register: Instantaneous Reactive Power
 */
uint32_t dlms_process_ReactivePower() {
    uint32_t scaler;
    uint32_t kvar = read_reactive_power(&scaler, 0);
    kvar = kvar / scaler;
    GX_UINT32(li_impReactivePowerInstValue.value) = kvar;
    return kvar;
}

int obj_reactivePowerInstValueImport() {
    int ret;
    const unsigned char ln[6] = {1, 0, 3, 7, 0, 255};
    if ((ret = INIT_OBJECT(li_impReactivePowerInstValue, DLMS_OBJECT_TYPE_REGISTER, ln)) == 0) {
        li_impReactivePowerInstValue.scaler = -1;
        li_impReactivePowerInstValue.unit = DLMS_UNIT_REACTIVE_POWER;
    }
    return ret;
}

/**
 * Register: Instantaneous Apparent Power
 */
//uint32_t dlms_process_ApparentPower()
//{
//    uint32_t scaler;
//    uint32_t kva = read_apparent_power(&scaler, 0);
//    kva = kva/scaler;
//    GX_UINT32(li_impApparentPowerInstValue.value);
//    return kva;
//}

//int obj_apparentPowerInstValueImport()
//{
//    int ret;
//    const unsigned char ln[6] = { 1, 0, 9, 7, 0, 255 };
//    if ((ret = INIT_OBJECT(li_impApparentPowerInstValue, DLMS_OBJECT_TYPE_REGISTER, ln)) == 0)
//    {
//        li_impApparentPowerInstValue.scaler = -1;
//        li_impApparentPowerInstValue.unit = DLMS_UNIT_APPARENT_POWER;
//    }
//    return ret;
//}

/**
 * Register: Instantaneous Overall Power Factor
 */


double dlms_process_overallPowerFactor() {
    uint32_t scaler;
    uint32_t kw = read_active_power(&scaler, 0);
    uint32_t kva = read_apparent_power(&scaler, 0);
    double pf = (double) kw / (double) kva;



    GX_DOUBLE(li_OverallPowerFactorInstValue.value) = pf;
    return pf;
}

int obj_lInstOverallPowerFactor() {
    int ret;
    const unsigned char ln[6] = {1, 0, 13, 7, 0, 255};
    if ((ret = INIT_OBJECT(li_OverallPowerFactorInstValue, DLMS_OBJECT_TYPE_REGISTER, ln)) == 0) {
        li_OverallPowerFactorInstValue.scaler = 0;
        li_OverallPowerFactorInstValue.unit = DLMS_UNIT_NONE;
    }
    return ret;
}


/////////////////////////////////////////////
// Energy Registers
/////////////////////////////////////////////

/**
 * Register: Cumulative Active Energy Import
 */
double dlms_process_ActiveEnergy() {
    uint32_t scaler;
    double kwh = read_active_energy(&scaler);

    kwh = kwh / scaler;
    GX_DOUBLE(li_impActiveEnergyCumulative.value) = kwh;

    return kwh;
}

int obj_lAcitveEnergyCumulative() {
    int ret;
    const unsigned char ln[6] = {1, 0, 1, 8, 0, 255};
    if ((ret = INIT_OBJECT(li_impActiveEnergyCumulative, DLMS_OBJECT_TYPE_REGISTER, ln)) == 0) {
        li_impActiveEnergyCumulative.scaler = -3;
        li_impActiveEnergyCumulative.unit = DLMS_UNIT_ACTIVE_ENERGY; //unit: kWh
    }
    return ret;
}

/**
 * Register Cumulative Reactive Energy Import
 */
uint32_t dlms_process_ReactiveEnergy() {
    return 0;
}

/**
 * Register Cumulative Forward Active Energy
 */
//float dlms_process_ForwardActiveEnergy()
//{
//    uint32_t scaler;
//    float kwh = read_abs_active_energy(&scaler);
//    kwh = kwh / 1000;
//    GX_UINT32(li_absActiveEnergyCumulative.value) = kwh;
//
//    return kwh;
//}

//int obj_liAbsActiveEnergyCumulative()
//{
//    int ret;
//    const unsigned char ln[6] = { 1, 0, 15, 8, 0, 255 };
//    if ((ret = INIT_OBJECT(li_absActiveEnergyCumulative, DLMS_OBJECT_TYPE_REGISTER, ln)) == 0)
//    {
//        li_absActiveEnergyCumulative.scaler = 3;
//        li_absActiveEnergyCumulative.unit = DLMS_UNIT_ACTIVE_ENERGY;
//    }
//
//    return ret;
//}

/**
 * Register Cumulative Forward Active Energy
 */
//float dlms_process_NetActiveEnergy()
//{
//    uint32_t scaler;
//    float kwh = read_net_active_energy(&scaler);
//    kwh = kwh / 1000;
//    GX_UINT32(li_netActiveEnergyCumulative.value) = kwh;
//
//    return kwh;
//}

//int obj_liNetActiveEnergyCumulative()
//{
//    int ret;
//    const unsigned char ln[6] = { 1, 0, 16, 8, 0, 255 };
//    if ((ret = INIT_OBJECT(li_netActiveEnergyCumulative, DLMS_OBJECT_TYPE_REGISTER, ln)) == 0)
//    {
//        li_netActiveEnergyCumulative.scaler = 3;
//        li_netActiveEnergyCumulative.unit = DLMS_UNIT_ACTIVE_ENERGY;
//    }
//
//    return ret;
//}

int addcumulativePowerOffDurationInMin() {
    int ret;
    const unsigned char ln[6] = {0, 0, 94, 91, 8, 255};
    if ((ret = INIT_OBJECT(cumulativePowerOffDurationInMin, DLMS_OBJECT_TYPE_REGISTER, ln)) == 0) {
        GX_UINT32(cumulativePowerOffDurationInMin.value) = 62346;
        cumulativePowerOffDurationInMin.scaler = 0;
        cumulativePowerOffDurationInMin.unit = DLMS_UNIT_MINUTE;
    }
    return ret;
}

int addbillingDateImportMode() {
    int ret;
    const unsigned char ln[6] = {0, 0, 0, 1, 2, 255};
    if ((ret = INIT_OBJECT(billingDateImportMode, DLMS_OBJECT_TYPE_REGISTER, ln)) == 0) {
        static unsigned char data[12];


        //GX_OCTECT_STRING(billingDateImportMode.value, data, 12);
        billingDateImportMode.scaler = 0;
        billingDateImportMode.unit = DLMS_UNIT_NO_UNIT;
    }
    return ret;
}

int addsumLiActivePowerTimeIntegral1RateIsTotal() {
    int ret;
    const unsigned char ln[6] = {1, 0, 16, 8, 0, 255};
    if ((ret = INIT_OBJECT(sumLiActivePowerTimeIntegral1RateIsTotal, DLMS_OBJECT_TYPE_REGISTER, ln)) == 0) {

        sumLiActivePowerTimeIntegral1RateIsTotal.scaler = 0;
        sumLiActivePowerTimeIntegral1RateIsTotal.unit = DLMS_UNIT_NONE;
    }
    return ret;
}

int addsumLiReactivePowerPlusInstValue() {
    int ret;
    const unsigned char ln[6] = {1, 0, 3, 7, 0, 255};
    if ((ret = INIT_OBJECT(sumLiReactivePowerPlusInstValue, DLMS_OBJECT_TYPE_REGISTER, ln)) == 0) {
        GX_INT32(sumLiReactivePowerPlusInstValue.value) = 0;
        sumLiReactivePowerPlusInstValue.scaler = 0;
        sumLiReactivePowerPlusInstValue.unit = DLMS_UNIT_REACTIVE_POWER;
    }
    return ret;
}

int addnoOfPowerFailuresInAllThreePhases() {
    int ret;
    const unsigned char ln[6] = {0, 0, 96, 7, 0, 255};
    if ((ret = INIT_OBJECT(noOfPowerFailuresInAllThreePhases, DLMS_OBJECT_TYPE_DATA, ln)) == 0) {
        GX_UINT16(noOfPowerFailuresInAllThreePhases.value) = 8;
    }
    return ret;
}

int addcumulativeTamperCount() {
    int ret;
    const unsigned char ln[6] = {0, 0, 94, 91, 0, 255};
    if ((ret = INIT_OBJECT(cumulativeTamperCount, DLMS_OBJECT_TYPE_DATA, ln)) == 0) {
        GX_UINT16(cumulativeTamperCount.value) = 0;
    }
    return ret;
}

int addcumulativeBillingCount() {
    int ret;
    const unsigned char ln[6] = {0, 0, 0, 1, 0, 255};
    if ((ret = INIT_OBJECT(cumulativeBillingCount, DLMS_OBJECT_TYPE_DATA, ln)) == 0) {
        GX_UINT32(cumulativeBillingCount.value) = 1;
    }
    return ret;
}

int addcumulativeProgrammingCount() {
    int ret;
    const unsigned char ln[6] = {0, 0, 96, 2, 0, 255};
    if ((ret = INIT_OBJECT(cumulativeProgrammingCount, DLMS_OBJECT_TYPE_DATA, ln)) == 0) {
        GX_UINT16(cumulativeProgrammingCount.value) = 0;
    }
    return ret;
}

/** 
 * Profile Generic for Meter Information 
 */

int obj_meterInformationProfile() {
    int ret;
    static gxTarget CAPTURE_OBJECT[30] = {0};
    const unsigned char ln[6] = {0, 65, 0, 0, 4, 255};
    if ((ret = INIT_OBJECT(MeterInfoProfile, DLMS_OBJECT_TYPE_PROFILE_GENERIC, ln)) == 0) {
        /* Set Capture period to time in seconds */
        InstValueProfile.capturePeriod = 0;
        // InstValueProfile.sortMethod = DLMS_SORT_METHOD_FIFO;

        /* Maximum row count */
        InstValueProfile.profileEntries = 1;
        InstValueProfile.entriesInUse = 1;

        /* Add Columns */
        ARR_ATTACH(InstValueProfile.captureObjects, CAPTURE_OBJECT, 30);
        CAPTURE_OBJECT[0].target = BASE(clock1); /* Timestamp - Channel 0 */
        CAPTURE_OBJECT[0].attributeIndex = 2;
        CAPTURE_OBJECT[0].dataIndex = 0;
        CAPTURE_OBJECT[1].target = BASE(ldn); /* Logical Device Name */
        CAPTURE_OBJECT[1].attributeIndex = 2;
        CAPTURE_OBJECT[1].dataIndex = 0;
        CAPTURE_OBJECT[2].target = BASE(meterID); /* Meter Identifier */
        CAPTURE_OBJECT[2].attributeIndex = 2;
        CAPTURE_OBJECT[2].dataIndex = 0;
        CAPTURE_OBJECT[3].target = BASE(meterManName); /* Meter Manufacturer Name */
        CAPTURE_OBJECT[3].attributeIndex = 2;
        CAPTURE_OBJECT[3].dataIndex = 0;
        CAPTURE_OBJECT[4].target = BASE(meterModelName); /* Meter Model Name */
        CAPTURE_OBJECT[4].attributeIndex = 2;
        CAPTURE_OBJECT[4].dataIndex = 0;
        CAPTURE_OBJECT[5].target = BASE(meterType); /* Meter Type */
        CAPTURE_OBJECT[5].attributeIndex = 2;
        CAPTURE_OBJECT[5].dataIndex = 0;
        CAPTURE_OBJECT[6].target = BASE(commModuleID); /* Meter Communication Module Identifier */
        CAPTURE_OBJECT[6].attributeIndex = 2;
        CAPTURE_OBJECT[6].dataIndex = 0;
        CAPTURE_OBJECT[7].target = BASE(basicCurrent); /* Meter Basic Current */
        CAPTURE_OBJECT[7].attributeIndex = 2;
        CAPTURE_OBJECT[7].dataIndex = 0;
        CAPTURE_OBJECT[8].target = BASE(maximumCurrent); /* Meter Maximum Current */
        CAPTURE_OBJECT[8].attributeIndex = 2;
        CAPTURE_OBJECT[8].dataIndex = 0;
        CAPTURE_OBJECT[9].target = BASE(nominalFrequency); /* Meter Nominal Frequency */
        CAPTURE_OBJECT[9].attributeIndex = 2;
        CAPTURE_OBJECT[9].dataIndex = 0;
        CAPTURE_OBJECT[10].target = BASE(nominalVoltage); /* Meter Nominal Voltage */
        CAPTURE_OBJECT[10].attributeIndex = 2;
        CAPTURE_OBJECT[10].dataIndex = 0;
        CAPTURE_OBJECT[11].target = BASE(mcActiveEnergyLED); /* Meter Constant */
        CAPTURE_OBJECT[11].attributeIndex = 2;
        CAPTURE_OBJECT[11].dataIndex = 0;
        CAPTURE_OBJECT[12].target = BASE(mcActiveEnergyPulse); /* Meter Energy Pulse */
        CAPTURE_OBJECT[12].attributeIndex = 2;
        CAPTURE_OBJECT[12].dataIndex = 0;
        CAPTURE_OBJECT[13].target = BASE(meterActiveFWID); /* Meter Active Firmware Identifier */
        CAPTURE_OBJECT[13].attributeIndex = 2;
        CAPTURE_OBJECT[13].dataIndex = 0;
        CAPTURE_OBJECT[14].target = BASE(meterActiveFWV); /* Meter Active Firmware Version */
        CAPTURE_OBJECT[14].attributeIndex = 2;
        CAPTURE_OBJECT[14].dataIndex = 0;
        CAPTURE_OBJECT[15].target = BASE(commModuleActiveFWID); /* Meter Communication Module Active Firmware Identifier */
        CAPTURE_OBJECT[15].attributeIndex = 2;
        CAPTURE_OBJECT[15].dataIndex = 0;
        CAPTURE_OBJECT[16].target = BASE(commModuleActiveFWV); /* Meter Communication Module Active Firmware Version */
        CAPTURE_OBJECT[16].attributeIndex = 2;
        CAPTURE_OBJECT[16].dataIndex = 0;
        CAPTURE_OBJECT[17].target = BASE(tratioCurrentNumerator); /* Meter Transformer Ratio - Current Numerator */
        CAPTURE_OBJECT[17].attributeIndex = 2;
        CAPTURE_OBJECT[17].dataIndex = 0;
        CAPTURE_OBJECT[18].target = BASE(tratioCurrentDenominator); /* Meter Transformer Ratio - Current Denominator */
        CAPTURE_OBJECT[18].attributeIndex = 2;
        CAPTURE_OBJECT[18].dataIndex = 0;
        CAPTURE_OBJECT[19].target = BASE(tratioVoltageNumerator); /* Meter Transformer Ratio - Voltage Numerator */
        CAPTURE_OBJECT[19].attributeIndex = 2;
        CAPTURE_OBJECT[19].dataIndex = 0;
        CAPTURE_OBJECT[20].target = BASE(tratioVoltageDenominator); /* Meter Transformer Ratio - Voltage Denominator */
        CAPTURE_OBJECT[20].attributeIndex = 2;
        CAPTURE_OBJECT[20].dataIndex = 0;
        CAPTURE_OBJECT[21].target = BASE(overallTRatioNumerator); /* Meter Overall Transformer Ratio Numerator */
        CAPTURE_OBJECT[21].attributeIndex = 2;
        CAPTURE_OBJECT[21].dataIndex = 0;
        CAPTURE_OBJECT[22].target = BASE(overallTRatioDenominator); /* Meter Overall Transformer Ratio Denominator */
        CAPTURE_OBJECT[22].attributeIndex = 2;
        CAPTURE_OBJECT[22].dataIndex = 0;
        CAPTURE_OBJECT[23].target = BASE(geographicalInfo); /* Meter Geographical Information */
        CAPTURE_OBJECT[23].attributeIndex = 2;
        CAPTURE_OBJECT[23].dataIndex = 0;
        CAPTURE_OBJECT[24].target = BASE(servicePointReference); /* Meter Service Point Reference Number */
        CAPTURE_OBJECT[24].attributeIndex = 2;
        CAPTURE_OBJECT[24].dataIndex = 0;
        CAPTURE_OBJECT[25].target = BASE(transformerID); /* Meter Transformer Identifier */
        CAPTURE_OBJECT[25].attributeIndex = 2;
        CAPTURE_OBJECT[25].dataIndex = 0;
        CAPTURE_OBJECT[26].target = BASE(lineMagneticLossCoef); /* Meter Line Magnetic Loss Coefficient */
        CAPTURE_OBJECT[26].attributeIndex = 2;
        CAPTURE_OBJECT[26].dataIndex = 0;
        CAPTURE_OBJECT[27].target = BASE(lineIronLossCoef); /* Meter Line Iron Loss Coefficient */
        CAPTURE_OBJECT[27].attributeIndex = 2;
        CAPTURE_OBJECT[27].dataIndex = 0;
        CAPTURE_OBJECT[28].target = BASE(lineResistanceLossCoef); /* Meter Line Resistance Loss Coefficient */
        CAPTURE_OBJECT[28].attributeIndex = 2;
        CAPTURE_OBJECT[28].dataIndex = 0;
        CAPTURE_OBJECT[29].target = BASE(lineReactanceLossCoef); /* Meter Line Reactance Loss Coefficient */
        CAPTURE_OBJECT[29].attributeIndex = 2;
        CAPTURE_OBJECT[29].dataIndex = 0;
    }
    return ret;
}

int obj_instantaneouRegistersProfile() {
    int ret;
    static gxTarget CAPTURE_OBJECT[8] = {0};
    const unsigned char ln[6] = {1, 65, 0, 0, 15, 255};
    if ((ret = INIT_OBJECT(InstValueProfile, DLMS_OBJECT_TYPE_PROFILE_GENERIC, ln)) == 0) {
        /* Set Capture period to time in seconds */
        InstValueProfile.capturePeriod = 0;
        // InstValueProfile.sortMethod = DLMS_SORT_METHOD_FIFO;

        /* Maximum row count */
        InstValueProfile.profileEntries = 1;
        InstValueProfile.entriesInUse = 1;

        /* Add Columns */
        ARR_ATTACH(InstValueProfile.captureObjects, CAPTURE_OBJECT, 8);
        CAPTURE_OBJECT[0].target = BASE(clock1); /* Timestamp - Channel 0 */
        CAPTURE_OBJECT[0].attributeIndex = 2;
        CAPTURE_OBJECT[0].dataIndex = 0;
        CAPTURE_OBJECT[1].target = BASE(l1_VoltageInstValue); /* L1 Voltage - Channel 1 */
        CAPTURE_OBJECT[1].attributeIndex = 2;
        CAPTURE_OBJECT[1].dataIndex = 0;
        CAPTURE_OBJECT[2].target = BASE(l1_CurrentInstValue); /* L1 Current - Channel 6 */
        CAPTURE_OBJECT[2].attributeIndex = 2;
        CAPTURE_OBJECT[2].dataIndex = 0;
        CAPTURE_OBJECT[3].target = BASE(li_FrequencyInstValue); /* Supply Frequency - Channel 10 */
        CAPTURE_OBJECT[3].attributeIndex = 2;
        CAPTURE_OBJECT[3].dataIndex = 0;
        CAPTURE_OBJECT[4].target = BASE(l1_PhaseAngleInstValue); /* L1 Phase Angle - Channel 11 */
        CAPTURE_OBJECT[4].attributeIndex = 2;
        CAPTURE_OBJECT[4].dataIndex = 0;
        CAPTURE_OBJECT[5].target = BASE(li_impActivePowerInstValue); /* Li Active Power Import - Channel 14 */
        CAPTURE_OBJECT[5].attributeIndex = 2;
        CAPTURE_OBJECT[5].dataIndex = 0;
        CAPTURE_OBJECT[6].target = BASE(li_impReactivePowerInstValue); /* Li Reactive Power Import - Channel 16 */
        CAPTURE_OBJECT[6].attributeIndex = 2;
        CAPTURE_OBJECT[6].dataIndex = 0;
        //CAPTURE_OBJECT[7].target = BASE(li_impApparentPowerInstValue); /* Li Apparent Power Import - Channel 18 */
        //CAPTURE_OBJECT[7].attributeIndex = 2;
        //CAPTURE_OBJECT[7].dataIndex = 0;
        CAPTURE_OBJECT[7].target = BASE(li_OverallPowerFactorInstValue); /* Overall Power Factor - Channel 20 */
        CAPTURE_OBJECT[7].attributeIndex = 2;
        CAPTURE_OBJECT[7].dataIndex = 0;
        // InstValueProfile.sortObject = BASE(clock1);
        // InstValueProfile.sortObjectAttributeIndex = 2;
    }

    return ret;
}

uint16_t readActivePowerValue() {
    return ++activePowerL1Value;
}

uint16_t readEventCode() {
    return eventCode.value.uiVal;
}
///////////////////////////////////////////////////////////////////////
//Add script table object for meter reset. This will erase the EEPROM.
///////////////////////////////////////////////////////////////////////

int addscriptTableGlobalMeterReset() {
    int ret;
    static gxScript SCRIPTS[1] = {0};
    const unsigned char ln[6] = {0, 0, 10, 0, 0, 255};
    if ((ret = INIT_OBJECT(scriptTableGlobalMeterReset, DLMS_OBJECT_TYPE_SCRIPT_TABLE, ln)) == 0) {
        SCRIPTS[0].id = 1;
        ARR_ATTACH(scriptTableGlobalMeterReset.scripts, SCRIPTS, 1);
    }
    return ret;
}

/////////////////////////////////////////////////////////////////////
//Add script table object for disconnect control.
//Action 1 calls remote_disconnect #1 (close).
//Action 2 calls remote_connect #2(open).
///////////////////////////////////////////////////////////////////////

int addscriptTableDisconnectControl() {
    int ret;
    static gxScript SCRIPTS[2] = {0};
    static gxScriptAction ACTIONS1[1] = {0};
    static gxScriptAction ACTIONS2[1] = {0};
    const unsigned char ln[6] = {0, 0, 10, 0, 106, 255};
    if ((ret = INIT_OBJECT(scriptTableDisconnectControl, DLMS_OBJECT_TYPE_SCRIPT_TABLE, ln)) == 0) {
        SCRIPTS[0].id = 1;
        SCRIPTS[1].id = 2;
        ARR_ATTACH(scriptTableDisconnectControl.scripts, SCRIPTS, 2);
        ARR_ATTACH(SCRIPTS[0].actions, ACTIONS1, 1);
        ACTIONS1[0].type = DLMS_SCRIPT_ACTION_TYPE_EXECUTE;
        ACTIONS1[0].target = BASE(disconnectControl);
        ACTIONS1[0].index = 1;
        var_init(&ACTIONS1[0].parameter);
        //Action data is Int8 zero.
        GX_INT8(ACTIONS1[0].parameter) = 0;

        ARR_ATTACH(SCRIPTS[1].actions, ACTIONS2, 1);
        ACTIONS2[0].type = DLMS_SCRIPT_ACTION_TYPE_EXECUTE;
        ACTIONS2[0].target = BASE(disconnectControl);
        ACTIONS2[0].index = 2;
        var_init(&ACTIONS2[0].parameter);
        //Action data is Int8 zero.
        GX_INT8(ACTIONS2[0].parameter) = 0;
    }
    return ret;
}

///////////////////////////////////////////////////////////////////////
//Add script table object for test mode. In test mode meter is sending trace to the serial port.
///////////////////////////////////////////////////////////////////////

int addscriptTableActivatetestMode() {
    int ret;
    static gxScript SCRIPTS[1] = {0};
    const unsigned char ln[6] = {0, 0, 10, 0, 101, 255};
    if ((ret = INIT_OBJECT(scriptTableActivatetestMode, DLMS_OBJECT_TYPE_SCRIPT_TABLE, ln)) == 0) {
        SCRIPTS[0].id = 1;
        ARR_ATTACH(scriptTableActivatetestMode.scripts, SCRIPTS, 1);
    }
    return ret;
}

///////////////////////////////////////////////////////////////////////
//Add script table object for Normal mode. In normal mode meter is NOT sending trace to the serial port.
///////////////////////////////////////////////////////////////////////

int addscriptTableActivateNormalMode() {
    int ret;
    static gxScript SCRIPTS[1];
    const unsigned char ln[6] = {0, 0, 10, 0, 102, 255};
    if ((ret = INIT_OBJECT(scriptTableActivateNormalMode, DLMS_OBJECT_TYPE_SCRIPT_TABLE, ln)) == 0) {
        SCRIPTS[0].id = 1;
        ARR_ATTACH(scriptTableActivateNormalMode.scripts, SCRIPTS, 1);
    }
    return ret;
}

///////////////////////////////////////////////////////////////////////
//Add profile generic (historical data) object.
///////////////////////////////////////////////////////////////////////

int addLoadProfileProfileGeneric() {
    int ret;
    //Two capture objects.
    static gxTarget CAPTURE_OBJECT[3] = {0};
    const unsigned char ln[6] = {1, 0, 99, 1, 0, 255};
    if ((ret = INIT_OBJECT(profileGeneric, DLMS_OBJECT_TYPE_PROFILE_GENERIC, ln)) == 0) {
        profileGeneric.capturePeriod = 60;
        //Maximum row count. One row takes 6 bytes. Allocate 150 rows = 900B.
        profileGeneric.profileEntries = 150;
        profileGeneric.sortMethod = DLMS_SORT_METHOD_FIFO;
        //entries in use.
        profileGeneric.entriesInUse = 0;
        ///////////////////////////////////////////////////////////////////
        //Add 3 columns.
        ARR_ATTACH(profileGeneric.captureObjects, CAPTURE_OBJECT, 3);
        // Column 1: Clock object.
        CAPTURE_OBJECT[0].target = BASE(clock1);
        CAPTURE_OBJECT[0].attributeIndex = 2;
        CAPTURE_OBJECT[0].dataIndex = 0;

        // Column 2: Active power.
        CAPTURE_OBJECT[1].target = BASE(li_impActivePowerInstValue);
        CAPTURE_OBJECT[1].attributeIndex = 2;
        CAPTURE_OBJECT[1].dataIndex = 0;

        // Column 3: Status (0-0:96.10.1.255)
        CAPTURE_OBJECT[2].target = BASE(meterStatus);
        CAPTURE_OBJECT[2].attributeIndex = 2;
        CAPTURE_OBJECT[2].dataIndex = 0;

        //Set clock to sort object.
        profileGeneric.sortObject = BASE(clock1);
        profileGeneric.sortObjectAttributeIndex = 2;
    }
    return 0;
}

///////////////////////////////////////////////////////////////////////
//Add profile generic (historical data) object.
///////////////////////////////////////////////////////////////////////

int addEventLogProfileGeneric() {
    int ret;
    //Two capture objects. Clock and event code
    static gxTarget CAPTURE_OBJECT[2] = {0};
    const unsigned char ln[6] = {1, 0, 99, 98, 0, 255};
    if ((ret = INIT_OBJECT(eventLog, DLMS_OBJECT_TYPE_PROFILE_GENERIC, ln)) == 0) {
        //events are not captured.
        eventLog.capturePeriod = 0;
        //Maximum row count. One row takes 6 bytes. Allocate 150 rows = 900B.
        eventLog.profileEntries = 150;
        eventLog.sortMethod = DLMS_SORT_METHOD_FIFO;
        //entries in use.
        eventLog.entriesInUse = 0;
        ///////////////////////////////////////////////////////////////////
        //Add 2 columns.
        ARR_ATTACH(eventLog.captureObjects, CAPTURE_OBJECT, 2);
        //Add clock object.
        CAPTURE_OBJECT[0].target = BASE(clock1);
        CAPTURE_OBJECT[0].attributeIndex = 2;
        CAPTURE_OBJECT[0].dataIndex = 0;
        //Add active power.
        CAPTURE_OBJECT[1].target = BASE(eventCode);
        CAPTURE_OBJECT[1].attributeIndex = 2;
        CAPTURE_OBJECT[1].dataIndex = 0;
        //Set clock to sort object.
        eventLog.sortObject = BASE(clock1);
        eventLog.sortObjectAttributeIndex = 2;
    }
    return 0;
}
///////////////////////////////////////////////////////////////////////
//Add action schedule object for disconnect control to close the led.
///////////////////////////////////////////////////////////////////////

int addActionScheduleDisconnectClose() {
    int ret;
    const unsigned char ln[6] = {0, 0, 15, 0, 1, 255};
    static gxtime EXECUTION_TIMES[10];
    if ((ret = INIT_OBJECT(actionScheduleDisconnectClose, DLMS_OBJECT_TYPE_ACTION_SCHEDULE, ln)) == 0) {
        actionScheduleDisconnectClose.executedScript = &scriptTableDisconnectControl;
        actionScheduleDisconnectClose.executedScriptSelector = 1;
        actionScheduleDisconnectClose.type = DLMS_SINGLE_ACTION_SCHEDULE_TYPE1;
        ARR_ATTACH(actionScheduleDisconnectClose.executionTime, EXECUTION_TIMES, 0);
    }
    return ret;
}

///////////////////////////////////////////////////////////////////////
//Add action schedule object for disconnect control to open the led.
///////////////////////////////////////////////////////////////////////

int addActionScheduleDisconnectOpen() {
    int ret;
    const unsigned char ln[6] = {0, 0, 15, 0, 3, 255};
    static gxtime EXECUTION_TIMES[10];
    //Action schedule execution times.
    if ((ret = INIT_OBJECT(actionScheduleDisconnectOpen, DLMS_OBJECT_TYPE_ACTION_SCHEDULE, ln)) == 0) {
        actionScheduleDisconnectOpen.executedScript = &scriptTableDisconnectControl;
        actionScheduleDisconnectOpen.executedScriptSelector = 2;
        actionScheduleDisconnectOpen.type = DLMS_SINGLE_ACTION_SCHEDULE_TYPE1;
        ARR_ATTACH(actionScheduleDisconnectOpen.executionTime, EXECUTION_TIMES, 0);
    }
    return ret;
}

///////////////////////////////////////////////////////////////////////
//Add Disconnect control object.
///////////////////////////////////////////////////////////////////////

int addDisconnectControl() {
    int ret;
    const unsigned char ln[6] = {0, 0, 96, 3, 10, 255};
    if ((ret = INIT_OBJECT(disconnectControl, DLMS_OBJECT_TYPE_DISCONNECT_CONTROL, ln)) == 0) {
        //        disconnectControl.outputState
    }
    return ret;
}


///////////////////////////////////////////////////////////////////////
//Add IEC HDLC Setup object.
///////////////////////////////////////////////////////////////////////

int addIecHdlcSetup() {
    int ret = 0;
    unsigned char ln[6] = {0, 0, 22, 0, 0, 255};
    if ((ret = INIT_OBJECT(hdlc, DLMS_OBJECT_TYPE_IEC_HDLC_SETUP, ln)) == 0) {
        hdlc.communicationSpeed = DLMS_BAUD_RATE_9600;
        hdlc.windowSizeReceive = hdlc.windowSizeTransmit = 1;
        hdlc.maximumInfoLengthTransmit = hdlc.maximumInfoLengthReceive = 512;
        hdlc.inactivityTimeout = 120;
        hdlc.deviceAddress = 0x10;
    }
    uartSettings.hdlc = &hdlc;
    return ret;
}

/**
 * Add TCP/UDP setup object
 */
gxTcpUdpSetup udpSetup;

int obj_TcpUdpSetup() {
    int ret = 0;

    // Add TCP/UDP setupda, default logical name: 0.0.25.0.0.255
    const unsigned char ln[6] = {0, 0, 25, 0, 0, 255};
    if ((ret = INIT_OBJECT(udpSetup, DLMS_OBJECT_TYPE_TCP_UDP_SETUP, ln)) == 0) {
        udpSetup.maximumSimultaneousConnections = 1;
        udpSetup.maximumSegmentSize = 40;
        udpSetup.inactivityTimeout = 180;
    }

    return ret;
}

//Create objects and load values from EEPROM.

void createObjects() {
    int ret;
    OA_ATTACH(uartSettings.base.internalObjects, INTERNAL_OBJECTS);
    OA_ATTACH(uartSettings.base.objects, ALL_OBJECTS);

    if ((ret = addAssociationNone()) != 0 ||
            (ret = addAssociationLow()) != 0 ||
            (ret = addAssociationHigh()) != 0 ||
            (ret = addAssociationHighGMac()) != 0 ||
            (ret = addAssociationHighSha256()) != 0 ||
            (ret = addSecuritySetupLow()) != 0 ||
            (ret = addSecuritySetupHigh()) != 0 ||
            (ret = addSecuritySetupHighGMAC()) != 0 ||
            (ret = addSecuritySetupHighSha256()) != 0 ||
            (ret = addLogicalDeviceName()) != 0 ||
            (ret = obj_MeterIdentifier()) != 0 ||
            (ret = obj_MeterManName()) != 0 ||
            (ret = obj_MeterModel()) != 0 ||
            (ret = obj_MeterType()) != 0 ||
            (ret = obj_meterBarCode()) != 0 ||
            (ret = obj_meterQRCode()) != 0 ||
            (ret = obj_basicCurrent()) != 0 ||
            (ret = obj_maximumCurrent()) != 0 ||
            (ret = obj_nominalFrequency()) != 0 ||
            //(ret = obj_minimumVoltage()) != 0 ||
            //(ret = obj_maximumVoltage()) != 0 ||
            (ret = obj_nominalVoltage()) != 0 ||
            (ret = addTestMode()) != 0 ||
            (ret = addEventCode()) != 0 ||
            (ret = obj_Clock()) != 0 ||
            (ret = obj_l1VoltageInstValue()) != 0 ||
            (ret = obj_l1CurrentInstValue()) != 0 ||
            (ret = obj_lFrequencyInstValue()) != 0 ||
            (ret = obj_l1PhaseAngleInstValue()) != 0 ||
            (ret = obj_activePowerInstValueImport()) != 0 ||
            (ret = obj_reactivePowerInstValueImport()) != 0 ||
            //(ret = obj_apparentPowerInstValueImport()) != 0 ||
            (ret = obj_lInstOverallPowerFactor()) != 0 ||
            (ret = obj_instantaneouRegistersProfile()) != 0 ||
            (ret = obj_lAcitveEnergyCumulative()) != 0 ||
            //(ret = obj_liAbsActiveEnergyCumulative()) != 0 ||
            //(ret = obj_liNetActiveEnergyCumulative()) != 0 ||
            (ret = obj_meterStatus()) != 0 ||

            (ret = addPushSetup()) != 0 ||
            (ret = addscriptTableGlobalMeterReset()) != 0 ||
            (ret = addscriptTableDisconnectControl()) != 0 ||
            (ret = addscriptTableActivatetestMode()) != 0 ||
            (ret = addscriptTableActivateNormalMode()) != 0 ||
            (ret = addLoadProfileProfileGeneric()) != 0 ||
            (ret = addEventLogProfileGeneric()) != 0 ||
            (ret = addIecHdlcSetup()) != 0 ||
            (ret = addDisconnectControl()) != 0 ||
            (ret = addActionScheduleDisconnectOpen()) != 0 ||
            (ret = addActionScheduleDisconnectClose()) != 0 ||
            (ret = addUnixTime()) != 0 ||
            (ret = addInvocationCounter()) != 0 ||
            (ret = addBlockCipherKey()) != 0 ||
            (ret = addAuthenticationKey()) != 0 ||
            (ret = addKek()) != 0 ||
            (ret = addServerInvocationCounter()) != 0 ||
            (ret = oa_verify(&uartSettings.base.objects)) != 0 ||
            //Start server
            (ret = svr_initialize(&uartSettings)) != 0) {
        GXTRACE_INT(GET_STR_FROM_EEPROM("Failed to start the meter!"), ret);
        executeTime = 0;
        return;
    }
    /*if ((ret = loadSettings()) != 0)
    {
        ret = saveSettings(NULL, 0xFFFF);
        executeTime = 0;
        if ((ret = loadSettings()) != 0)
        {
            return;
        }
        executeTime = 0;
    }*/
    updateState(GURUX_EVENT_CODES_POWER_UP);
    GXTRACE(GET_STR_FROM_EEPROM("Meter started."), NULL);
}

//Get HDLC communication speed.

int32_t getCommunicationSpeed() {
    int32_t ret = 9600;
    switch (hdlc.communicationSpeed) {
        case DLMS_BAUD_RATE_300:
            ret = 300;
            break;
        case DLMS_BAUD_RATE_600:
            ret = 600;
            break;
        case DLMS_BAUD_RATE_1200:
            ret = 1200;
            break;
        case DLMS_BAUD_RATE_2400:
            ret = 2400;
            break;
        case DLMS_BAUD_RATE_4800:
            ret = 4800;
            break;
        case DLMS_BAUD_RATE_9600:
            ret = 9600;
            break;
        case DLMS_BAUD_RATE_19200:
            ret = 19200;
            break;
        case DLMS_BAUD_RATE_38400:
            ret = 38400;
            break;
        case DLMS_BAUD_RATE_57600:
            ret = 57600;
            break;
        case DLMS_BAUD_RATE_115200:
            ret = 115200;
            break;
    }
    return ret;
}

int svr_findObject(
        dlmsSettings* settings,
        DLMS_OBJECT_TYPE objectType,
        int sn,
        unsigned char* ln,
        gxValueEventArg* e) {
    if (objectType == DLMS_OBJECT_TYPE_ASSOCIATION_LOGICAL_NAME) {
        if (settings->authentication == DLMS_AUTHENTICATION_NONE) {
            switch (settings->clientAddress) {
                case 0x10: // Client SAP = 16
                    e->target = BASE(associationNone);
                    break;
                case 0x11: // Client SAP = 17
                    e->target = BASE(associationLow);
                    break;
                case 0x12: // Client SAP = 18
                    e->target = BASE(associationHigh);
                    break;
                case 0x13: // Client SAP = 19
                    e->target = BASE(associationHighGMac);
                    break;
                case 0x14: // Client SAP = 20
                    e->target = BASE(associationHighSha256);
                    break;
                default:
                    e->target = BASE(associationNone);
                    break;
            }
            return 0;
        }
        switch (settings->authentication) {
            case DLMS_AUTHENTICATION_LOW:
                e->target = BASE(associationLow);
                break;
            case DLMS_AUTHENTICATION_HIGH:
                e->target = BASE(associationHigh);
                break;
            case DLMS_AUTHENTICATION_HIGH_GMAC:
                e->target = BASE(associationHighGMac);
                break;
            case DLMS_AUTHENTICATION_HIGH_SHA256:
                e->target = BASE(associationHighSha256);
                break;
            default: // NONE
                e->target = BASE(associationNone);
                break;
        }
    }
    return 0;
}

/**
  Find restricting object.
 */
int getRestrictingObject(dlmsSettings* settings, gxValueEventArg* e, gxObject** obj, short* index) {
    int ret;
    unsigned char ln[6];
    uint16_t ot;
    signed char aIndex;
    uint16_t dIndex;
    if ((ret = cosem_checkStructure(e->parameters.byteArr, 4)) == 0 &&
            (ret = cosem_checkStructure(e->parameters.byteArr, 4)) == 0 &&
            (ret = cosem_getUInt16(e->parameters.byteArr, &ot)) == 0 &&
            (ret = cosem_getOctetString2(e->parameters.byteArr, ln, 6, NULL)) == 0 &&
            (ret = cosem_getInt8(e->parameters.byteArr, &aIndex)) == 0 &&
            (ret = cosem_getUInt16(e->parameters.byteArr, &dIndex)) == 0) {
    }
    return ret;
}

/**
  Find start index and row count using start and end date time.

  settings: DLMS settings.
             Start time.
  type: Profile Generic type.
  e: Parameters
 */
int getProfileGenericDataByRangeFromRingBuffer(
        dlmsSettings* settings,
        unsigned char type,
        gxValueEventArg* e) {
    gxtime start;
    gxtime end;
    uint32_t pos;
    uint32_t last = 0;
    int ret;
    gxObject* obj = NULL;
    short index;

    uint16_t ser_ret = 0;

    if ((ret = getRestrictingObject(settings, e, &obj, &index)) != 0 ||
            (ret = cosem_getDateTimeFromOctetString(e->parameters.byteArr, &start)) != 0 ||
            (ret = cosem_getDateTimeFromOctetString(e->parameters.byteArr, &end)) != 0) {
        return ret;
    }
    uint32_t s = time_toUnixTime2(&start);
    uint32_t l = time_toUnixTime2(&end);
    uint32_t t = 0;
    gxLoadProfileData lp;
    gxEventLogData event1;
    gxInstantaneousProfileData instData;
    gxProfileGeneric* p = (gxProfileGeneric*) e->target;
    for (pos = 0; pos != p->entriesInUse; ++pos) {
        //Load data from EEPROM.
        if (type == 0) {
            ser_ret = SERIALIZER_LOAD(SETTINGS_BUFFER_SIZE + (pos * sizeof (gxLoadProfileData)), sizeof (gxLoadProfileData), &lp);
            t = lp.time;
        } else if (type == 1) {
            ser_ret = SERIALIZER_LOAD(SETTINGS_BUFFER_SIZE + LOAD_PROFILE_BUFFER_SIZE + (pos * sizeof (gxEventLogData)), sizeof (gxEventLogData), &event1);
            t = event1.time;
        } else if (type == 2) {
            ser_ret = SERIALIZER_LOAD(SETTINGS_BUFFER_SIZE + LOAD_PROFILE_BUFFER_SIZE + EVENT_PROFILE_BUFFER_SIZE + (pos * sizeof (gxInstantaneousProfileData)), sizeof (gxInstantaneousProfileData), &instData);
            t = instData.time;
        }
        //If value is inside of start and end time.
        if (t >= s && t <= l) {
            if (last == 0) {
                //Save end position if we have only one row.
                e->transactionEndIndex = e->transactionStartIndex = 1 + pos;
            } else {
                if (last <= t) {
                    e->transactionEndIndex = pos + 1;
                } else {
                    //Index is one based, not zero.
                    if (e->transactionEndIndex == 0) {
                        ++e->transactionEndIndex;
                    }
                    e->transactionEndIndex += p->entriesInUse - 1;
                    e->transactionStartIndex = pos;
                    break;
                }
            }
            last = t;
        }
    }
    return ret;
}

int readProfileGeneric(dlmsSettings* settings, gxProfileGeneric* pg, unsigned char type, gxValueEventArg* e) {
    unsigned char first = e->transactionEndIndex == 0;
    int ret = 0;
    gxArray captureObjects;
    gxTarget CAPTURE_OBJECT[10] = {0};
    ARR_ATTACH(captureObjects, CAPTURE_OBJECT, 0);

    e->byteArray = 1;
    e->handled = 1;

    uint16_t ser_ret = 0;
    // If reading first time.
    if (first) {
        //Read all.
        if (e->selector == 0) {
            e->transactionStartIndex = 1;
            e->transactionEndIndex = pg->entriesInUse;
        } else if (e->selector == 1) {
            //Read by entry. Find start and end index from the ring buffer.
            if ((ret = getProfileGenericDataByRangeFromRingBuffer(settings, type, e)) != 0 ||
                    (ret = cosem_getColumns(&pg->captureObjects, e->selector, &e->parameters, &captureObjects)) != 0) {
                e->transactionStartIndex = e->transactionEndIndex = 0;
            }
        } else if (e->selector == 2) {
            if ((ret = cosem_checkStructure(e->parameters.byteArr, 4)) != 0 ||
                    (ret = cosem_getUInt32(e->parameters.byteArr, &e->transactionStartIndex)) != 0 ||
                    (ret = cosem_getUInt32(e->parameters.byteArr, &e->transactionEndIndex)) != 0 ||
                    (ret = cosem_getColumns(&pg->captureObjects, e->selector, &e->parameters, &captureObjects)) != 0) {
                e->transactionStartIndex = e->transactionEndIndex = 0;
            } else {
                //If start index is too high.
                if (e->transactionStartIndex > pg->entriesInUse) {
                    e->transactionStartIndex = e->transactionEndIndex = 0;
                }
                //If end index is too high.
                if (e->transactionEndIndex > pg->entriesInUse) {
                    e->transactionEndIndex = pg->entriesInUse;
                }
            }
        }
    }
    bb_clear(e->value.byteArr);
    if (ret == 0 && first) {
        if (e->transactionEndIndex == 0) {
            ret = cosem_setArray(e->value.byteArr, 0);
        } else {
            ret = cosem_setArray(e->value.byteArr, (uint16_t) (e->transactionEndIndex - e->transactionStartIndex + 1));
        }
    }
    if (ret == 0 && e->transactionEndIndex != 0) {
        //Loop items.
        uint32_t pos;
        gxtime tm;
        uint16_t pduSize;
        gxLoadProfileData lp;
        gxEventLogData event1;
        gxInstantaneousProfileData instData;
        for (pos = e->transactionStartIndex - 1; pos != e->transactionEndIndex; ++pos) {
            pduSize = e->value.byteArr->size;
            //Load data from EEPROM.
            if (type == 0) {
                ser_ret = SERIALIZER_LOAD(SETTINGS_BUFFER_SIZE + (pos * sizeof (gxLoadProfileData)), sizeof (gxLoadProfileData), &lp);
                time_initUnix(&tm, lp.time);
                if ((ret = cosem_setStructure(e->value.byteArr, 3)) != 0 ||
                        (ret = cosem_setDateTimeAsOctetString(e->value.byteArr, &tm)) != 0 ||
                        (ret = cosem_setUInt16(e->value.byteArr, lp.activePowerL1)) != 0 ||
                        (ret = cosem_setUInt8(e->value.byteArr, lp.status)) != 0) {
                    //LOG_APP_DEMO_WDG0_DEBUG(("Error here\r\n"));  
                }
            } else if (type == 1) {
                ser_ret = SERIALIZER_LOAD(SETTINGS_BUFFER_SIZE + LOAD_PROFILE_BUFFER_SIZE + (pos * sizeof (gxEventLogData)), sizeof (gxEventLogData), &event1);
                time_initUnix(&tm, event1.time);
                if ((ret = cosem_setStructure(e->value.byteArr, 2)) != 0 ||
                        (ret = cosem_setDateTimeAsOctetString(e->value.byteArr, &tm)) != 0 ||
                        (ret = cosem_setUInt16(e->value.byteArr, event1.event)) != 0) {
                    //LOG_APP_DEMO_WDG0_DEBUG(("Error here\r\n"));  

                }
            } else if (type == 2) {
                ser_ret = SERIALIZER_LOAD(SETTINGS_BUFFER_SIZE + LOAD_PROFILE_BUFFER_SIZE + EVENT_PROFILE_BUFFER_SIZE + (pos * sizeof (gxInstantaneousProfileData)), sizeof (gxInstantaneousProfileData), &instData);
                time_initUnix(&tm, instData.time);

                if ((ret = cosem_setStructure(e->value.byteArr, 9)) != 0 ||
                        (ret = cosem_setDateTimeAsOctetString(e->value.byteArr, &tm)) != 0 ||
                        (ret = cosem_setUInt32(e->value.byteArr, instData.voltageL1)) != 0 ||
                        (ret = cosem_setUInt32(e->value.byteArr, instData.currentL1)) != 0 ||
                        (ret = cosem_setUInt32(e->value.byteArr, instData.frequency)) != 0 ||
                        (ret = cosem_setUInt32(e->value.byteArr, instData.phaseAngleL1)) != 0 ||
                        (ret = cosem_setUInt32(e->value.byteArr, instData.activePowerImp)) != 0 ||
                        (ret = cosem_setUInt32(e->value.byteArr, instData.reactivePowerImp)) != 0 ||
                        (ret = cosem_setUInt32(e->value.byteArr, instData.apparentPowerImp)) != 0 ||
                        (ret = cosem_setUInt32(e->value.byteArr, instData.overallPowerFactor)) != 0) {
                    //LOG_APP_DEMO_WDG0_DEBUG(("Error here\r\n"));  
                }
            }
            if (ret != 0) {
                //Don't set error if PDU is full,
                if (ret == DLMS_ERROR_CODE_OUTOFMEMORY) {
                    e->value.byteArr->size = pduSize;
                    ret = 0;
                } else {
                    break;
                }
                break;
            }
            ++e->transactionStartIndex;
        }
    }
    return ret;
}

/////////////////////////////////////////////////////////////////////////////
//
/////////////////////////////////////////////////////////////////////////////

void svr_preRead(
        dlmsSettings* settings,
        gxValueEventCollection* args) {
    gxValueEventArg* e;
    int ret, pos;
    DLMS_OBJECT_TYPE type;
    for (pos = 0; pos != args->size; ++pos) {
        if ((ret = vec_getByIndex(args, pos, &e)) != 0) {
            return;
        }
        if (!e->action) {
            GXTRACE_LN(GET_STR_FROM_EEPROM("svr_preRead: "), e->target->objectType, e->target->logicalName);
        }
        //Let framework handle Logical Name read.
        if (e->index == 1) {
            continue;
        }

        //Get target type.
        type = (DLMS_OBJECT_TYPE) e->target->objectType;
        //Let Framework will handle Association objects and profile generic automatically.
        if (type == DLMS_OBJECT_TYPE_ASSOCIATION_LOGICAL_NAME ||
                type == DLMS_OBJECT_TYPE_ASSOCIATION_SHORT_NAME) {
            continue;
        }

        //update voltages every time register read
        if (e->target == &l1_VoltageInstValue.base && e->index == 2) {
            dlms_process_l1Voltage();
        }



        //update current every time register read
        if (e->target == &l1_CurrentInstValue.base && e->index == 2) {
            dlms_process_l1Current();
        }

        //update active power every time register read
        if (e->target == &li_impActivePowerInstValue.base && e->index == 2) {
            dlms_process_ActivePower();
        }

        //update reactive power every register read
        if (e->target == &li_impReactivePowerInstValue.base && e->index == 2) {
            dlms_process_ReactivePower();
        }

        //update apparent power every register read
        //        if(e->target == &li_impApparentPowerInstValue.base && e->index == 2)
        //        {
        //            dlms_process_ApparentPower();
        //            
        //        }

        //update phase angle every register read
        if (e->target == &l1_PhaseAngleInstValue.base && e->index == 2) {
            dlms_process_l1PhaseAngle();
        }

        //update power factor every time register read
        if (e->target == &li_OverallPowerFactorInstValue.base && e->index == 2) {
            dlms_process_overallPowerFactor();
        }

        if (e->target == &li_FrequencyInstValue.base && e->index == 2) {
            dlms_process_supplyFrequency();
        }

        if (e->target == &li_impActiveEnergyCumulative.base && e->index == 2) {
            dlms_process_ActiveEnergy();
        }

        //        if(e->target == &li_absActiveEnergyCumulative.base && e->index == 2)
        //        {
        //            dlms_process_ForwardActiveEnergy();
        //        }

        //        if(e->target == &li_netActiveEnergyCumulative.base && e->index == 2)
        //        {
        //            dlms_process_NetActiveEnergy();
        //        }

        //Get time if user want to read date and time.
        if (e->target == BASE(clock1) && e->index == 2) {
            gxtime dt;
            time_now(&dt);
            e->error = cosem_setDateTimeAsOctetString(e->value.byteArr, &dt);
            e->value.vt = DLMS_DATA_TYPE_DATETIME;
            e->handled = 1;
        } else if (e->target == BASE(profileGeneric) && e->index == 2) {
            e->error = (DLMS_ERROR_CODE) readProfileGeneric(settings, &profileGeneric, 0, e);
        } else if (e->target == BASE(eventLog) && e->index == 2) {
            e->error = (DLMS_ERROR_CODE) readProfileGeneric(settings, &eventLog, 1, e);
        } else if (e->target == BASE(InstValueProfile) && e->index == 2) {
            e->error = (DLMS_ERROR_CODE) readProfileGeneric(settings, &InstValueProfile, 2, e);
        }
    }
}

/////////////////////////////////////////////////////////////////////////////
//
/////////////////////////////////////////////////////////////////////////////

void svr_preWrite(
        dlmsSettings* settings,
        gxValueEventCollection* args) {
    gxValueEventArg* e;
    int ret, pos;
    for (pos = 0; pos != args->size; ++pos) {
        if ((ret = vec_getByIndex(args, pos, &e)) != 0) {
            return;
        }
        //Set new base time if user wants to set date and time.
        if (e->target == BASE(clock1) && e->index == 2) {
            updateState(GURUX_EVENT_CODES_TIME_CHANGE);
#ifndef USE_TIME_INTERRUPT
            started = time_elapsed();
#endif //USE_TIME_INTERRUPT
        }
        GXTRACE_LN(GET_STR_FROM_EEPROM("svr_preWrite: "), e->target->objectType, e->target->logicalName);
    }
}

unsigned char PUSH_BUFFER[PDU_BUFFER_SIZE];
unsigned char PUSH_FRAME[PDU_BUFFER_SIZE];

int sendPush(
        dlmsSettings* settings,
        gxPushSetup* push) {
    GXTRACE_LN(GET_STR_FROM_EEPROM("sendPush"), push->base.objectType, push->base.logicalName);
    int ret, pos;
    message messages;
    if (push->pushObjectList.size == 0) {
        GXTRACE(GET_STR_FROM_EEPROM("sendPush Failed. No objects selected."), NULL);
        return DLMS_ERROR_CODE_INVALID_PARAMETER;
    }
    gxByteBuffer pdu;
    bb_attach(&pdu, PUSH_BUFFER, 0, sizeof (PUSH_BUFFER));
    settings->serializedPdu = &pdu;
    gxByteBuffer bb;
    bb_attach(&bb, PUSH_FRAME, 0, sizeof (PUSH_FRAME));
    gxByteBuffer * tmp[] = {&bb};
    mes_attach(&messages, tmp, 1);
    //traces are not send when push messages are generated.
    unsigned char origTestMode = GX_GET_BOOL(testMode.value);
    GX_BOOL(testMode.value) = 1;
    if ((ret = notify_generatePushSetupMessages(settings, 0, push, &messages)) == 0) {
        for (pos = 0; pos != messages.size; ++pos) {
            for (size_t i = 0; i < bb.size; ++i) {
                // NImish not sure what to do uart_poll_out(uart_dev, bb.data[i]);
            }
        }
    }
    GX_BOOL(testMode.value) = origTestMode;
    if (ret != 0) {
        GXTRACE(GET_STR_FROM_EEPROM("generatePushSetupMessages Failed."), NULL);
    } else {
        GXTRACE(GET_STR_FROM_EEPROM("generatePushSetupMessages succeeded."), NULL);
    }
    mes_clear(&messages);
    return ret;
}

void handleLoadProfileActions(gxValueEventArg* it) {
    uint16_t loadProfileRowIndex = 0;
    uint16_t ret = 0;

    if (it->index == 1) {
        // Profile generic clear is called. Clear data.
        profileGeneric.entriesInUse = 0;
        loadProfileRowIndex = 0;
    } else if (it->index == 2) {
        gxLoadProfileData row;
        // Profile generic Capture is called. Save data to the buffer.
        //We are using ring buffer here.
        row.time = time_current();
        row.activePowerL1 = readActivePowerValue();
        row.status = GX_UINT8(meterStatus.value);
        ret = SERIALIZER_SAVE(SETTINGS_BUFFER_SIZE + loadProfileRowIndex * sizeof (gxLoadProfileData), sizeof (gxLoadProfileData), &row);

        //Update how many entries is used until buffer is full.
        if (profileGeneric.entriesInUse != profileGeneric.profileEntries) {
            ++profileGeneric.entriesInUse;
        }
        ++loadProfileRowIndex;
        loadProfileRowIndex = loadProfileRowIndex % profileGeneric.profileEntries;
        //saveSettings(BASE(profileGeneric), GET_ATTRIBUTE(7));
    }
}

void handleMeterInfoProfileActions(gxValueEventArg* it) {
    uint16_t loadProfileRowIndex = 0;
    uint16_t ret = 0;

    if (it->index == 1) {

        //Profile generic clear is called. Clear Data.
        InstValueProfile.entriesInUse = 0;
        loadProfileRowIndex = 0;

    } else if (it->index == 2) {

        gxMeterInfoProfileData row;

        //Profile generic Capture is called. Save data to the buffer.

        ret = SERIALIZER_SAVE(SETTINGS_BUFFER_SIZE + LOAD_PROFILE_BUFFER_SIZE + EVENT_PROFILE_BUFFER_SIZE + (loadProfileRowIndex * sizeof (gxInstantaneousProfileData)), sizeof (gxInstantaneousProfileData), &row);
        if (InstValueProfile.entriesInUse != InstValueProfile.profileEntries) {

            InstValueProfile.entriesInUse++;
        }
        loadProfileRowIndex++;
        loadProfileRowIndex = loadProfileRowIndex % InstValueProfile.profileEntries;
    }
}

void handleInstantaneousProfileActions(gxValueEventArg* it) {
    uint16_t loadProfileRowIndex = 0;
    uint16_t ret = 0;

    if (it->index == 1) {

        //Profile generic clear is called. Clear Data.
        InstValueProfile.entriesInUse = 0;
        loadProfileRowIndex = 0;

    } else if (it->index == 2) {

        gxInstantaneousProfileData row;
        uint32_t scaler;
        //Profile generic Capture is called. Save data to the buffer.
        row.time = presentTime();
        row.voltageL1 = dlms_process_l1Voltage();
        row.currentL1 = dlms_process_l1Current();
        row.frequency = dlms_process_supplyFrequency();
        row.phaseAngleL1 = dlms_process_l1PhaseAngle();
        row.activePowerImp = dlms_process_ActivePower();
        row.reactivePowerImp = dlms_process_ReactivePower();
        //row.apparentPowerImp = dlms_process_ApparentPower();
        row.overallPowerFactor = dlms_process_overallPowerFactor();

        SERIALIZER_SAVE(SETTINGS_BUFFER_SIZE + LOAD_PROFILE_BUFFER_SIZE + EVENT_PROFILE_BUFFER_SIZE + (loadProfileRowIndex * sizeof (gxInstantaneousProfileData)), sizeof (gxInstantaneousProfileData), &row);

        if (InstValueProfile.entriesInUse != InstValueProfile.profileEntries) {

            InstValueProfile.entriesInUse++;
        }
        loadProfileRowIndex++;
        loadProfileRowIndex = loadProfileRowIndex % InstValueProfile.profileEntries;
    }
}

void handleEventLogActions(gxValueEventArg* it) {
    if (it->index == 1) {
        // Profile generic clear is called. Clear data.
        eventLog.entriesInUse = 0;
        eventLogRowIndex = 0;
    } else if (it->index == 2) {
        captureEventLog(readEventCode());
    }
}

/////////////////////////////////////////////////////////////////////////////
//
/////////////////////////////////////////////////////////////////////////////

void svr_preAction(
        dlmsSettings* settings,
        gxValueEventCollection* args) {
    gxValueEventArg* e;
    int ret, pos;
    for (pos = 0; pos != args->size; ++pos) {
        if ((ret = vec_getByIndex(args, pos, &e)) != 0) {
            return;
        }
        GXTRACE_LN(GET_STR_FROM_EEPROM("svr_preAction: "), e->target->objectType, e->target->logicalName);
        if (e->target == BASE(profileGeneric)) {
            handleLoadProfileActions(e);
            e->handled = 1;
        } else if (e->target == BASE(eventLog)) {
            handleEventLogActions(e);
            e->handled = 1;
        } else if (e->target == BASE(InstValueProfile)) {
            handleInstantaneousProfileActions(e);
            e->handled = 1;
        } else if (e->target == BASE(pushSetup) && e->index == 1) {
            updateState(GURUX_EVENT_CODES_PUSH);
            sendPush(settings, (gxPushSetup*) e->target);
            e->handled = 1;
        }//If client wants to clear EEPROM data using Global meter reset script.
        else if (e->target == BASE(scriptTableGlobalMeterReset) && e->index == 1) {
            //Initialize serialization version number so default values are used on next connection.
            SERIALIZER_SAVE(0, 1, 0);
            //Load objects again.
            createObjects();
            updateState(GURUX_EVENT_CODES_GLOBAL_METER_RESET);
            e->handled = 1;
        } else if (e->target == BASE(disconnectControl)) {
            updateState(GURUX_EVENT_CODES_OUTPUT_RELAY_STATE);
            //Disconnect. Turn led OFF.
            if (e->index == 1) {
                // Nimish LED gpio_pin_set(led, PIN, 0);
            } else //Reconnnect. Turn LED ON.
            {
                //Nimish LED gpio_pin_set(led, PIN, 1);
            }
        } else if (e->target == BASE(scriptTableActivatetestMode)) {
            //Activate test mode.
            GX_BOOL(testMode.value) = 1;
            //saveSettings(BASE(testMode), GET_ATTRIBUTE(2));
        } else if (e->target == BASE(scriptTableActivateNormalMode)) {
            //Activate normal mode.
            GX_BOOL(testMode.value) = 0;
            //saveSettings(BASE(testMode), GET_ATTRIBUTE(2));
        }
    }
}

/////////////////////////////////////////////////////////////////////////////
//
/////////////////////////////////////////////////////////////////////////////

void svr_postRead(
        dlmsSettings* settings,
        gxValueEventCollection* args) {
    gxValueEventArg* e;
    int ret, pos;
    for (pos = 0; pos != args->size; ++pos) {
        if ((ret = vec_getByIndex(args, pos, &e)) != 0) {
            return;
        }
        GXTRACE_LN(GET_STR_FROM_EEPROM("svr_postRead: "), e->target->objectType, e->target->logicalName);
    }
}


/////////////////////////////////////////////////////////////////////////////
// Only updated value is saved. This is done because write to EEPROM is slow
// and there is a limit how many times value can be written to the EEPROM.
/////////////////////////////////////////////////////////////////////////////

void svr_postWrite(
        dlmsSettings* settings,
        gxValueEventCollection* args) {
    gxValueEventArg* e;
    int ret, pos;
    for (pos = 0; pos != args->size; ++pos) {
        if ((ret = vec_getByIndex(args, pos, &e)) != 0) {
            return;
        }
        GXTRACE_LN(GET_STR_FROM_EEPROM("svr_postWrite: "), e->target->objectType, e->target->logicalName);
        if (e->error == 0) {
            if (e->target == BASE(securitySetupHigh)) {
                applyCipherModeForAuth(&uartSettings);
            }
            loadSettings();
        } else {
            loadSettings();
        }
    }
    //Reset execute time to update execute time if user add new execute times or changes the time.
    executeTime = 0;
}

/////////////////////////////////////////////////////////////////////////////
//
/////////////////////////////////////////////////////////////////////////////

void svr_postAction(
        dlmsSettings* settings,
        gxValueEventCollection* args) {
    gxValueEventArg* e;
    int ret, pos;
    uint32_t action;
    for (pos = 0; pos != args->size; ++pos) {
        if ((ret = vec_getByIndex(args, pos, &e)) != 0) {
            return;
        }
        GXTRACE_LN(GET_STR_FROM_EEPROM("svr_postAction: "), e->target->objectType, e->target->logicalName);
        if ((action = svr_isChangedWithAction((DLMS_OBJECT_TYPE) e->target->objectType, e->index)) != 0) {
            //Save settings to EEPROM.
            if (e->error == 0) {
                //saveSettings(e->target, action);
            } else {
                //Load default settings if there is an error.
                loadSettings();
            }
        }
    }
}

unsigned char svr_isTarget(
        dlmsSettings* settings,
        uint32_t serverAddress,
        uint32_t clientAddress) {
    GXTRACE(GET_STR_FROM_EEPROM("svr_isTarget."), NULL);
    objectArray objects;
    oa_init(&objects);
    unsigned char ret = 0;
    uint16_t pos;
    gxObject * tmp[6];
    oa_attach(&objects, tmp, sizeof (tmp) / sizeof (tmp[0]));
    objects.size = 0;
    if (oa_getObjects(&settings->objects, DLMS_OBJECT_TYPE_ASSOCIATION_LOGICAL_NAME, &objects) == 0) {
        gxAssociationLogicalName* a;
        for (pos = 0; pos != objects.size; ++pos) {
            if (oa_getByIndex(&objects, pos, (gxObject**) & a) == 0) {
                if (a->clientSAP == clientAddress) {
                    ret = 1;
                    switch (a->authenticationMechanismName.mechanismId) {
                        case DLMS_AUTHENTICATION_NONE:
                            //Client connects without authentication.
                            GXTRACE(GET_STR_FROM_EEPROM("Connecting without authentication."), NULL);
                            break;
                        case DLMS_AUTHENTICATION_LOW:
                            //Client connects using low authentication.
                            GXTRACE(GET_STR_FROM_EEPROM("Connecting using Low authentication."), NULL);
                            break;
                        default:
                            //Client connects using High authentication.
                            GXTRACE(GET_STR_FROM_EEPROM("Connecting using High authentication."), NULL);
                            break;
                    }
                    break;
                }
            }
        }
    }
    if (ret == 0) {
        GXTRACE_INT(GET_STR_FROM_EEPROM("Invalid authentication level."), clientAddress);
        //Authentication is now allowed. Meter is quiet and doesn't return an error.
    } else {
        // If address is not broadcast or serial number.
        if (!(serverAddress == 1 || serverAddress == 0x3FFF || serverAddress == 0x7F ||
                (serverAddress & 0x3FFF) == SERIAL_NUMBER % 10000 + 1000 || serverAddress == hdlc.deviceAddress)) {
            ret = 0;
        }
        if (ret == 0) {
            GXTRACE_INT(GET_STR_FROM_EEPROM("Invalid server address"), serverAddress);
        }
    }
    return ret;
}

DLMS_SOURCE_DIAGNOSTIC svr_validateAuthentication(
        dlmsServerSettings* settings,
        DLMS_AUTHENTICATION authentication,
        gxByteBuffer* password) {
    GXTRACE(GET_STR_FROM_EEPROM("svr_validateAuthentication"), NULL);
    if (authentication == DLMS_AUTHENTICATION_NONE) {
        //Uncomment this if authentication is always required.
        //return DLMS_SOURCE_DIAGNOSTIC_AUTHENTICATION_MECHANISM_NAME_REQUIRED;
        return DLMS_SOURCE_DIAGNOSTIC_NONE;
    }
    //Check Low Level security..
    if (authentication == DLMS_AUTHENTICATION_LOW) {
        if (bb_compare(password, associationLow.secret.data, associationLow.secret.size) == 0) {
            GXTRACE(GET_STR_FROM_EEPROM("Invalid low level password."), (char*) password->data);
            return DLMS_SOURCE_DIAGNOSTIC_AUTHENTICATION_FAILURE;
        }
        GXTRACE(GET_STR_FROM_EEPROM("Valid low level password."), (char*) password->data);
    }
    // High authentication levels are check on phase two.
    return DLMS_SOURCE_DIAGNOSTIC_NONE;
}

//Get attribute access level for profile generic.

DLMS_ACCESS_MODE getProfileGenericAttributeAccess(
        dlmsSettings* settings,
        gxObject* obj,
        unsigned char index) {
    //Only read is allowed for event log.
    if (obj == BASE(eventLog)) {
        return DLMS_ACCESS_MODE_READ;
    }
    //Write is allowed only for High authentication.
    if (settings->authentication > DLMS_AUTHENTICATION_LOW) {
        switch (index) {
            case 4://capturePeriod
                return DLMS_ACCESS_MODE_READ_WRITE;
            default:
                break;
        }
    }
    return DLMS_ACCESS_MODE_READ;
}

//Get attribute access level for Push Setup.

DLMS_ACCESS_MODE getPushSetupAttributeAccess(
        dlmsSettings* settings,
        unsigned char index) {
    //Write is allowed only for High authentication.
    if (settings->authentication > DLMS_AUTHENTICATION_LOW) {
        switch (index) {
            case 2://pushObjectList
            case 4://communicationWindow
                return DLMS_ACCESS_MODE_READ_WRITE;
            default:
                break;
        }
    }
    return DLMS_ACCESS_MODE_READ;
}

//Get attribute access level for Disconnect Control.

DLMS_ACCESS_MODE getDisconnectControlAttributeAccess(
        dlmsSettings* settings,
        unsigned char index) {
    return DLMS_ACCESS_MODE_READ;
}

//Get attribute access level for register schedule.

DLMS_ACCESS_MODE getActionSchduleAttributeAccess(
        dlmsSettings* settings,
        unsigned char index) {
    //Write is allowed only for High authentication.
    if (settings->authentication > DLMS_AUTHENTICATION_LOW) {
        switch (index) {
            case 4://Execution time.
                return DLMS_ACCESS_MODE_READ_WRITE;
            default:
                break;
        }
    }
    return DLMS_ACCESS_MODE_READ;
}

//Get attribute access level for register.

DLMS_ACCESS_MODE getRegisterAttributeAccess(dlmsSettings* settings, unsigned char index, gxObject* obj) {
    uint8_t idx = 0;

    //0.0.96.6.X.255
    if (obj->logicalName[0] == 0 && obj->logicalName[1] == 0 && obj->logicalName[2] == 96
            && obj->logicalName[3] == 6 && obj->logicalName[5] == 255) {
        return DLMS_ACCESS_MODE_READ_WRITE;
    }

    //1.0.0.9.11.255
    if (obj->logicalName[0] == 1 && obj->logicalName[1] == 0 && obj->logicalName[2] == 0
            && obj->logicalName[3] == 9 && obj->logicalName[4] == 11 && obj->logicalName[5] == 255) {
        return DLMS_ACCESS_MODE_READ_WRITE;
    }

    //1.0.0.10.X.255
    if (obj->logicalName[0] == 1 && obj->logicalName[1] == 0 && obj->logicalName[2] == 0
            && obj->logicalName[3] == 10 && obj->logicalName[5] == 255) {
        if (settings->authentication != DLMS_AUTHENTICATION_LOW) {
            return DLMS_ACCESS_MODE_READ_WRITE;
        } else {
            return DLMS_ACCESS_MODE_READ;
        }
    }

    //0.65.0.0.6.255
    if (obj->logicalName[0] == 0 && obj->logicalName[1] == 65 && obj->logicalName[2] == 0
            && obj->logicalName[3] == 0 && obj->logicalName[4] == 6 && obj->logicalName[5] == 255) {
        if (settings->authentication != DLMS_AUTHENTICATION_LOW) {
            return DLMS_ACCESS_MODE_READ_WRITE;
        } else {
            return DLMS_ACCESS_MODE_READ;
        }
    }

    //1.0.12.X.X.255
    if (obj->logicalName[0] == 1 && obj->logicalName[1] == 0 && obj->logicalName[2] == 12 && obj->logicalName[5] == 255) {
        idx = obj->logicalName[3];

        if (idx == 7) {
            return DLMS_ACCESS_MODE_READ;
        } else {
            if (settings->authentication == DLMS_AUTHENTICATION_HIGH_ECDSA) {
                return DLMS_ACCESS_MODE_READ_WRITE;
            } else {
                return DLMS_ACCESS_MODE_READ;
            }
        }

    }

    //1.0.13.X.X.255
    if (obj->logicalName[0] == 1 && obj->logicalName[1] == 0 && obj->logicalName[2] == 13 && obj->logicalName[5] == 255) {
        idx = obj->logicalName[3];

        if (idx == 7) {
            return DLMS_ACCESS_MODE_READ;
        } else {
            if (settings->authentication == DLMS_AUTHENTICATION_HIGH_ECDSA) {
                return DLMS_ACCESS_MODE_READ_WRITE;
            } else {
                return DLMS_ACCESS_MODE_READ;
            }
        }
    }

    //1.0.0.6.X.255
    if (obj->logicalName[0] == 1 && obj->logicalName[1] == 0 && obj->logicalName[2] == 0
            && obj->logicalName[3] == 6 && obj->logicalName[5] == 255) {
        idx = obj->logicalName[4];

        if (idx == 4) {
            return DLMS_ACCESS_MODE_READ;
        } else {
            if (settings->authentication == DLMS_AUTHENTICATION_HIGH_ECDSA) {
                return DLMS_ACCESS_MODE_READ_WRITE;
            } else {
                return DLMS_ACCESS_MODE_READ;
            }
        }
    }

    //X.65.0.0.X.255
    if (obj->logicalName[1] == 65 && obj->logicalName[2] == 0 && obj->logicalName[3] == 0 && obj->logicalName[5] == 255) {
        if (settings->authentication == DLMS_AUTHENTICATION_HIGH_ECDSA) {
            return DLMS_ACCESS_MODE_READ_WRITE;
        } else {
            return DLMS_ACCESS_MODE_READ;
        }
    }

    return DLMS_ACCESS_MODE_READ;
}

//Get attribute access level for data objects.

DLMS_ACCESS_MODE getDataAttributeAccess(dlmsSettings* settings, unsigned char index, gxObject* obj) {
    uint8_t idx = 0;

    //0.65.0.0.X.255
    if (obj->logicalName[0] == 0 && obj->logicalName[1] == 65 && obj->logicalName[2] == 0
            && obj->logicalName[3] == 0 && obj->logicalName[5] == 255) {
        idx = obj->logicalName[4];
        if (idx == 0 || idx == 15 || idx == 16 || idx == 17 || idx == 18 || idx == 8 || idx == 9 || idx == 5 || idx == 11) {
            if (settings->authentication == DLMS_AUTHENTICATION_HIGH_ECDSA) {
                return DLMS_ACCESS_MODE_READ_WRITE;
            } else {
                return DLMS_ACCESS_MODE_READ;
            }
        } else if (idx == 1 || idx == 2 || idx == 3 || idx == 26) {
            return DLMS_ACCESS_MODE_READ_WRITE;
        } else {
            return DLMS_ACCESS_MODE_READ;
        }
    }

    //0.0.96.1.X.255
    if (obj->logicalName[0] == 0 && obj->logicalName[1] == 0 && obj->logicalName[2] == 96
            && obj->logicalName[3] == 1 && obj->logicalName[5] == 255) {
        idx = obj->logicalName[4];
        if (idx == 4 || idx == 7) {
            if (settings->authentication == DLMS_AUTHENTICATION_HIGH_ECDSA) {
                return DLMS_ACCESS_MODE_READ_WRITE;
            } else {
                return DLMS_ACCESS_MODE_READ;
            }
        } else if (idx == 1 || idx == 5 || idx == 6) {
            if (settings->authentication != DLMS_AUTHENTICATION_LOW) {
                return DLMS_ACCESS_MODE_READ_WRITE;
            } else {
                return DLMS_ACCESS_MODE_READ;
            }
            return DLMS_ACCESS_MODE_READ_WRITE;
        } else {
            return DLMS_ACCESS_MODE_READ;
        }
    }

    //1.0.0.4.X.255
    if (obj->logicalName[0] == 1 && obj->logicalName[1] == 0 && obj->logicalName[2] == 0
            && obj->logicalName[3] == 4 && obj->logicalName[5] == 255) {
        if (settings->authentication != DLMS_AUTHENTICATION_LOW) {
            return DLMS_ACCESS_MODE_READ_WRITE;
        } else {
            return DLMS_ACCESS_MODE_READ;
        }
    }

    //0.0.96.10.X.255
    if (obj->logicalName[0] == 0 && obj->logicalName[1] == 0 && obj->logicalName[2] == 96
            && obj->logicalName[3] == 10 && obj->logicalName[5] == 255) {
        if (settings->authentication == DLMS_AUTHENTICATION_HIGH_ECDSA) {
            return DLMS_ACCESS_MODE_READ_WRITE;
        } else {
            return DLMS_ACCESS_MODE_READ;
        }
    }

    //0.0.97.98.X.255
    if (obj->logicalName[0] == 0 && obj->logicalName[1] == 0 && obj->logicalName[2] == 97
            && obj->logicalName[3] == 98 && obj->logicalName[5] == 255) {
        if (settings->authentication == DLMS_AUTHENTICATION_HIGH_ECDSA) {
            return DLMS_ACCESS_MODE_READ_WRITE;
        } else {
            return DLMS_ACCESS_MODE_READ;
        }
    }

    //1.0.0.3.X.255
    if (obj->logicalName[0] == 1 && obj->logicalName[1] == 0 && obj->logicalName[2] == 0
            && obj->logicalName[3] == 3 && obj->logicalName[5] == 255) {
        if (settings->authentication == DLMS_AUTHENTICATION_HIGH_ECDSA) {
            return DLMS_ACCESS_MODE_READ_WRITE;
        } else {
            return DLMS_ACCESS_MODE_READ;
        }
    }

    return DLMS_ACCESS_MODE_READ;

}

//Get attribute access level for script table.

DLMS_ACCESS_MODE getScriptTableAttributeAccess(dlmsSettings* settings, unsigned char index) {
    return DLMS_ACCESS_MODE_READ;
}

//Get attribute access level for IEC HDLS setup.

DLMS_ACCESS_MODE getHdlcSetupAttributeAccess(dlmsSettings* settings, unsigned char index) {
    //Write is allowed only for High authentication.
    if (settings->authentication > DLMS_AUTHENTICATION_LOW) {
        switch (index) {
            case 2: //Communication speed.
            case 7:
            case 8:
                return DLMS_ACCESS_MODE_READ_WRITE;
            default:
                break;
        }
    }
    return DLMS_ACCESS_MODE_READ;
}


//Get attribute access level for association LN.

DLMS_ACCESS_MODE getAssociationAttributeAccess(dlmsSettings* settings, unsigned char index) {
    //If secret
    if (settings->authentication == DLMS_AUTHENTICATION_LOW && index == 7) {
        return DLMS_ACCESS_MODE_READ_WRITE;
    }
    return DLMS_ACCESS_MODE_READ;
}

/**
  Get attribute access level.
 */
DLMS_ACCESS_MODE svr_getAttributeAccess(dlmsSettings* settings, gxObject* obj, unsigned char index) {
    //GXTRACE("svr_getAttributeAccess", NULL);
    // Only read is allowed if authentication is not used.
    if (index == 1 || settings->authentication == DLMS_AUTHENTICATION_NONE) {
        return DLMS_ACCESS_MODE_READ;
    }
    if (obj->objectType == DLMS_OBJECT_TYPE_ASSOCIATION_LOGICAL_NAME) {
        return getAssociationAttributeAccess(settings, index);
    }
    if (obj->objectType == DLMS_OBJECT_TYPE_PROFILE_GENERIC) {
        return getProfileGenericAttributeAccess(settings, obj, index);
    }
    if (obj->objectType == DLMS_OBJECT_TYPE_PUSH_SETUP) {
        return getPushSetupAttributeAccess(settings, index);
    }
    if (obj->objectType == DLMS_OBJECT_TYPE_DISCONNECT_CONTROL) {
        return getDisconnectControlAttributeAccess(settings, index);
    }
    if (obj->objectType == DLMS_OBJECT_TYPE_DISCONNECT_CONTROL) {
        return getDisconnectControlAttributeAccess(settings, index);
    }
    if (obj->objectType == DLMS_OBJECT_TYPE_ACTION_SCHEDULE) {
        return getActionSchduleAttributeAccess(settings, index);
    }
    if (obj->objectType == DLMS_OBJECT_TYPE_SCRIPT_TABLE) {
        return getScriptTableAttributeAccess(settings, index);
    }
    if (obj->objectType == DLMS_OBJECT_TYPE_REGISTER) {
        return getRegisterAttributeAccess(settings, index, obj);
    }
    if (obj->objectType == DLMS_OBJECT_TYPE_DATA) {
        return getDataAttributeAccess(settings, index, obj);
    }
    if (obj->objectType == DLMS_OBJECT_TYPE_IEC_HDLC_SETUP) {
        return getHdlcSetupAttributeAccess(settings, index);
    }

    // Only read is allowed for Low authentication.
    if (settings->authentication == DLMS_AUTHENTICATION_LOW) {
        return DLMS_ACCESS_MODE_READ;
    }
    // All writes are allowed for High authentication.
    return DLMS_ACCESS_MODE_READ_WRITE;
}

/**
  Get method access level.
 */
DLMS_METHOD_ACCESS_MODE svr_getMethodAccess(dlmsSettings* settings, gxObject* obj, unsigned char index) {
    // Methods are not allowed.
    if (settings->authentication == DLMS_AUTHENTICATION_NONE) {
        return DLMS_METHOD_ACCESS_MODE_NONE;
    }
    // Only clock methods are allowed.
    if (settings->authentication == DLMS_AUTHENTICATION_LOW) {
        if (obj->objectType == DLMS_OBJECT_TYPE_CLOCK) {
            return DLMS_METHOD_ACCESS_MODE_ACCESS;
        }
        return DLMS_METHOD_ACCESS_MODE_NONE;
    }
    return DLMS_METHOD_ACCESS_MODE_ACCESS;
}

static void applyCipherModeForAuth(dlmsServerSettings* s) {
    gxSecuritySetup* ss = NULL;

    if (s->base.authentication == DLMS_AUTHENTICATION_HIGH_GMAC) {
        ss = &securitySetupHighGMAC;
    } else if (s->base.authentication == DLMS_AUTHENTICATION_HIGH_SHA256) {
        ss = &securitySetupHighSha256;
    } else if (s->base.authentication == DLMS_AUTHENTICATION_HIGH) {
        ss = &securitySetupHigh;
    }
    if (ss == NULL) {
        s->base.cipher.security = DLMS_SECURITY_NONE;
        return;
    }

    if (ss->securityPolicy == DLMS_SECURITY_POLICY_AUTHENTICATED_ENCRYPTED) {
        s->base.cipher.security = DLMS_SECURITY_AUTHENTICATION_ENCRYPTION;
    } else if (ss->securityPolicy == DLMS_SECURITY_POLICY_AUTHENTICATED) {
        s->base.cipher.security = DLMS_SECURITY_AUTHENTICATION;
    } else {
        s->base.cipher.security = DLMS_SECURITY_NONE;
    }
}


/////////////////////////////////////////////////////////////////////////////
//Client has made connection to the server.
/////////////////////////////////////////////////////////////////////////////

int svr_connected(dlmsServerSettings* settings) {
    if (settings->base.connected == DLMS_CONNECTION_STATE_NONE) {
        GXTRACE(GET_STR_FROM_EEPROM("svr_connected to HDLC level."), NULL);
    } else if ((settings->base.connected & DLMS_CONNECTION_STATE_DLMS) != 0) {
        GXTRACE(GET_STR_FROM_EEPROM("svr_connected DLMS level."), NULL);
        settings->base.cipher.invocationCounter++;
        saveSettings(BASE(serverInvocationCounter), GET_ATTRIBUTE(2));
    }
    applyCipherModeForAuth(settings);
    return 0;
}

/////////////////////////////////////////////////////////////////////////////
// Client has try to made invalid connection. Password is incorrect.
/////////////////////////////////////////////////////////////////////////////

int svr_invalidConnection(dlmsServerSettings* settings) {
    GXTRACE(GET_STR_FROM_EEPROM("svr_invalidConnection"), NULL);
    updateState(GURUX_EVENT_CODES_WRONG_PASSWORD);
    return 0;
}

/////////////////////////////////////////////////////////////////////////////
// Client has close the connection.
/////////////////////////////////////////////////////////////////////////////

int svr_disconnected(dlmsServerSettings* settings) {
    GXTRACE(GET_STR_FROM_EEPROM("svr_disconnected"), NULL);
    settings->base.cipher.security = DLMS_SECURITY_NONE;
    if (hdlcChanged) {
        hdlcChanged = 0;
        GXTRACE_INT(GET_STR_FROM_EEPROM("Communication speed"), getCommunicationSpeed());
    }
    return 0;
}

void svr_preGet(dlmsSettings* settings, gxValueEventCollection* args) {
    gxValueEventArg* e;
    int ret, pos;
    for (pos = 0; pos != args->size; ++pos) {
        if ((ret = vec_getByIndex(args, pos, &e)) != 0) {
            return;
        }
    }
}

void svr_postGet(dlmsSettings* settings, gxValueEventCollection* args) {

}

//Print detailed information to the serial port.

void svr_trace(const char* str, const char* data) {
    GXTRACE(str, data);
}

void dlms_usart_data_cb(uint16_t len, uint8_t *dlms_rec_data) {
    if (svr_handleRequest2(&uartSettings, (unsigned char *) dlms_rec_data, len, &reply) != 0)
        //if (svr_handleRequest3(&settings, dlms_rec_data, &reply) != 0)
    {
        //received all daata
    }

    if (reply.size != 0) {
        write_dlms_data(reply.data, reply.size);
    }
}

/* ==== wrapper to match FLEXCOM USART callback signature ==== */
static void FLEXCOM0_RX_Callback(unsigned int status) {
    (void) status;
    DLMS_USART_Handler();
}

void init_dlms_process(void) {
    //register_dlms_usart_cb(dlms_usart_data_cb);

    int ret, ls = 0;

    FLEXCOM0_USART_ReadCallbackRegister(FLEXCOM0_RX_Callback, 0);
    dlms_set_read_buffer();

    write_dlms_data((uint8_t*) "DLMSSS\r\n", sizeof ("DLMSSS\r\n"));

    register_dlms_usart_cb(dlms_usart_data_cb);

    started = time_elapsed();
    //Initialize serialization settings.
    ser_init(&serializerSettings);
    serializerSettings.ignoredAttributes = NON_SERIALIZED_OBJECTS;
    serializerSettings.count = sizeof (NON_SERIALIZED_OBJECTS) / sizeof (NON_SERIALIZED_OBJECTS[0]);


    memcpy(SERVER_SYSTEM_TITLE, FLAG_ID, 4);
    sprintf((char*) (SERVER_SYSTEM_TITLE + 4), "%04lu", SERIAL_NUMBER % 10000);

    bb_attach(&reply, replyFrame, 0, sizeof (replyFrame));
    //svr_init(&uartSettings, 1, DLMS_INTERFACE_TYPE_HDLC, HDLC_BUFFER_SIZE, PDU_BUFFER_SIZE, frameBuff, sizeof (frameBuff), pduBuff, sizeof (pduBuff));
    svr_init(&uartSettings, 1, DLMS_INTERFACE_TYPE_WRAPPER, WRAPPER_BUFFER_SIZE, PDU_BUFFER_SIZE, frameBuff, sizeof(frameBuff), pduBuff, sizeof(pduBuff));
    //Set master key (KEK) to 1111111111111111.
    unsigned char KEK[16] = {0x31, 0x31, 0x31, 0x31, 0x31, 0x31, 0x31, 0x31, 0x31, 0x31, 0x31, 0x31, 0x31, 0x31, 0x31, 0x31};
#ifdef DLMS_IGNORE_MALLOC
    //Allocate space for read list.
    vec_attach(&uartSettings.transaction.targets, events, 0, sizeof (events) / sizeof (events[0]));
    //Allocate space for client password.
    BB_ATTACH(uartSettings.base.password, PASSWORD, 0);
    //Allocate space for client challenge.
    BB_ATTACH(uartSettings.base.ctoSChallenge, C2S_CHALLENGE, 0);
    //Allocate space for server challenge.
    BB_ATTACH(uartSettings.base.stoCChallenge, S2C_CHALLENGE, 0);

    memcpy(uartSettings.base.kek, KEK, sizeof (KEK));
    uartSettings.base.serializedPdu = &uartSettings.info.data;
    // === GMAC: set keys & titles & counters ===
    memcpy(uartSettings.base.cipher.blockCipherKey, BLOCK_KEY, 16);
    memcpy(uartSettings.base.cipher.authenticationKey, AUTH_KEY, 16);
    memcpy(uartSettings.base.cipher.systemTitle, SERVER_SYSTEM_TITLE, 8);
    
    uartSettings.base.cipher.invocationCounter = 1;

    uartSettings.base.cipher.security = DLMS_SECURITY_NONE;
    uartSettings.base.useLogicalNameReferencing = 1;
#else
    bb_set(&uartSettings.base.kek, KEK, sizeof (KEK));
#endif //DLMS_IGNORE_MALLOC
    createObjects();

    GXTRACE(GET_STR_FROM_EEPROM("LLS password: "), (char*) associationLow.secret.data);
    GXTRACE(GET_STR_FROM_EEPROM("HLS password: "), (char*) associationHigh.secret.data);
    GXTRACE(GET_STR_FROM_EEPROM("GMACLS password: "), (char*) associationHighGMac.secret.data);
    GXTRACE(GET_STR_FROM_EEPROM("Sha256LS password: "), (char*) associationHighSha256.secret.data);
    updateState(GURUX_EVENT_CODES_POWER_UP);
    GXTRACE_INT(GET_STR_FROM_EEPROM("EEPROM size"), SERIALIZER_SIZE());
    executeTime = 0;
    GXTRACE(GET_STR_FROM_EEPROM("Server started."), NULL);
}

