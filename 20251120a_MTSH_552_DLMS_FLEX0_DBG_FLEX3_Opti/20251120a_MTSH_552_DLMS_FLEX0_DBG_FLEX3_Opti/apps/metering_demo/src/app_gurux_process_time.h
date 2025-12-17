
#ifndef APP_GURUX_PROCESS_TIME_H
#define APP_GURUX_PROCESS_TIME_H

#include <stdint.h>

#include "definitions.h"

#include "gurux/include/gxobjects.h"


long time_current(void);
time_t presentTime(void);
uint32_t time_elapsed(void);
//void time_now(gxtime* value, unsigned char meterTime);
void time_now(gxtime* value);
long time_current(void);


#endif // APP_GURUX_PROCESS_TIME_H