
#ifndef APP_GURUX_METER_VALUE_INTERFACE_H
#define APP_GURUX_METER_VALUE_INTERFACE_H

#include <stdint.h>

typedef enum {
  A_Phase,
  B_Phase,
  C_Phase,
  Total_value
  
}PHASE;

void read_serial_numner(uint8_t *serialnumber);
uint32_t read_voltage(uint32_t *scaler, PHASE phase);
uint32_t read_current(uint32_t *scaler,  PHASE phase);
uint32_t read_active_power(uint32_t *scaler,  PHASE phase);
uint32_t read_reactive_power(uint32_t *scaler,  PHASE phase);
uint32_t read_apparent_power(uint32_t *scaler,  PHASE phase);
uint32_t read_frequency(uint32_t *scaler);
uint32_t read_angles(uint32_t *scaler,  PHASE phase);
uint32_t read_active_energy(uint32_t *scaler);
uint32_t read_rective_energy(uint32_t *scaler);
float read_abs_active_energy(uint32_t *scaler);
float read_net_active_energy(uint32_t *scaler);
//void read_rtc(rtc_t* rtc);




#endif // #ifndef APP_GURUX_METER_VALUE_INTERFACE_H