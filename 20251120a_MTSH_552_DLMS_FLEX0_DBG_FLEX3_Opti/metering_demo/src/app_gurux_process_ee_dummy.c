
#include "app_gurux_process_ee_dummy.h"
#include "definitions.h"

#include "gurux/include/errorcodes.h"

//Because the is no EEPROM in all the Nordic board serializer settings and profile generic data are saved for the memory at the moment.
//2000 bytes is for settings.
//1000 bytes is for load profile 
//1000 bytes is for event profile 



unsigned char SETTINGS_BUFFER[SETTINGS_BUFFER_SIZE + LOAD_PROFILE_BUFFER_SIZE + EVENT_PROFILE_BUFFER_SIZE + INSTANTANEOUS_PROFILE_BUFFEER_SIZE];

// *****************************************************************************
// *****************************************************************************
uint32_t SERIALIZER_SIZE()
{
    return SETTINGS_BUFFER_SIZE;
}

// *****************************************************************************
// *****************************************************************************
int SERIALIZER_LOAD(uint32_t index, uint32_t size, void* value)
{
    if (index + size > sizeof(SETTINGS_BUFFER))
    {
        return DLMS_ERROR_CODE_SERIALIZATION_LOAD_FAILURE;
    }
    unsigned char* p = (unsigned char*)value;
    uint32_t pos;
    for (pos = 0; pos != size; ++pos)
    {
        *p = SETTINGS_BUFFER[index + pos];
        ++p;
    }
    return  0;
}

// *****************************************************************************
// *****************************************************************************
int SERIALIZER_SAVE(uint32_t index, uint32_t size, const void* value)
{
    if (index + size > sizeof(SETTINGS_BUFFER))
    {
        return DLMS_ERROR_CODE_SERIALIZATION_SAVE_FAILURE;
    }
    unsigned char* p = (unsigned char*)value;
    uint32_t pos;
    for (pos = 0; pos != size; ++pos)
    {
        SETTINGS_BUFFER[index + pos] = *p;
        ++p;
    }
    return  0;
}
