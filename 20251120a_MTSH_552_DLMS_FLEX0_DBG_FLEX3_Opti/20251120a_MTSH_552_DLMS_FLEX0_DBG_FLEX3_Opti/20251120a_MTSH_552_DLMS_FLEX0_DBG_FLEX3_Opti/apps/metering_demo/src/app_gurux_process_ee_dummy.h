

#ifndef APP_GURUX_PROCESS_EE_DUMMY_H
#define APP_GURUX_PROCESS_EE_DUMMY_H
#include <stdint.h>

#include "definitions.h"


#define SETTINGS_BUFFER_SIZE 3000
#define LOAD_PROFILE_BUFFER_SIZE 1000
#define EVENT_PROFILE_BUFFER_SIZE 1000
#define INSTANTANEOUS_PROFILE_BUFFEER_SIZE 1000

uint32_t SERIALIZER_SIZE();
int SERIALIZER_LOAD(uint32_t index, uint32_t size, void* value);
int SERIALIZER_SAVE(uint32_t index, uint32_t size, const void* value);




#endif
