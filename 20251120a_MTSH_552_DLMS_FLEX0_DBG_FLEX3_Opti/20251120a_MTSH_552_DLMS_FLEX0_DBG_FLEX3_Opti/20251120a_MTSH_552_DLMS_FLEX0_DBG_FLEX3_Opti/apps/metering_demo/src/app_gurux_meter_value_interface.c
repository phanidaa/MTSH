
#include "app_gurux_meter_value_interface.h"
#include "definitions.h"

// *****************************************************************************
// *****************************************************************************
void read_serial_numner(uint8_t *serialnumber)
{
    // need to check if 72bit serial number we can take from Security engine.
  
    memcpy(serialnumber, "12345678", 8);  
}

// *****************************************************************************
// *****************************************************************************
uint32_t read_voltage(uint32_t *scaler, PHASE phase)
{
    uint32_t voltage = 0;
    
    switch (phase)
    {
        case A_Phase:
            APP_METROLOGY_GetMeasure(MEASURE_UA_RMS, &voltage, NULL);
            break;
        case B_Phase:
            APP_METROLOGY_GetMeasure(MEASURE_UB_RMS, &voltage, NULL);
            break;
        case C_Phase:
            APP_METROLOGY_GetMeasure(MEASURE_UB_RMS, &voltage, NULL);
            break;
        case Total_value:
            voltage = 0;
            break;
        default:
            break;
    }
    *scaler = 10;
    return voltage;
}

// *****************************************************************************
// *****************************************************************************
uint32_t read_current(uint32_t *scaler,  PHASE phase)
{
    uint32_t current = 0;
    
    switch (phase)
    {
        case A_Phase:
            APP_METROLOGY_GetMeasure(MEASURE_IA_RMS, &current, NULL);
            break;
        case B_Phase:
            APP_METROLOGY_GetMeasure(MEASURE_IB_RMS, &current, NULL);
            break;
        case C_Phase:
            APP_METROLOGY_GetMeasure(MEASURE_IC_RMS, &current, NULL);
            break;
        case Total_value:
            current = 0;
            break;
        default:
            break;
    }
    *scaler = 10;
    return current;
}

// *****************************************************************************
// *****************************************************************************
uint32_t read_active_power(uint32_t *scaler,  PHASE phase)
{
    uint32_t active_power = 0;
    
    switch (phase)
    {
        case A_Phase:
            APP_METROLOGY_GetMeasure(MEASURE_PA, &active_power, NULL);
            break;
        case B_Phase:
            APP_METROLOGY_GetMeasure(MEASURE_PB,&active_power, NULL);
            break;
        case C_Phase:
            APP_METROLOGY_GetMeasure(MEASURE_PC, &active_power, NULL);
            break;
        case Total_value:
            active_power = 0;
            break;
        default:
            break;
    }
    *scaler = 1;
    return active_power;
}

// *****************************************************************************
// *****************************************************************************
uint32_t read_reactive_power(uint32_t *scaler,  PHASE phase)
{
    uint32_t reactive_power = 0;
    
    switch (phase)
    {
        case A_Phase:
            APP_METROLOGY_GetMeasure(MEASURE_QA, &reactive_power, NULL);
            break;
        case B_Phase:
            APP_METROLOGY_GetMeasure(MEASURE_QB, &reactive_power, NULL);
            break;
        case C_Phase:
            APP_METROLOGY_GetMeasure(MEASURE_QC, &reactive_power, NULL);
            break;
        case Total_value:
            reactive_power = 0;
            break;
        default:
            break;
    }
    *scaler = 1;
    return reactive_power;
}

// *****************************************************************************
// *****************************************************************************
uint32_t read_apparent_power(uint32_t *scaler,  PHASE phase)
{
    uint32_t apparent_power = 0;
    
    switch (phase)
    {
        case A_Phase:
            APP_METROLOGY_GetMeasure(MEASURE_SA, &apparent_power, NULL);
            break;
        case B_Phase:
            APP_METROLOGY_GetMeasure(MEASURE_SB, &apparent_power, NULL);
            break;
        case C_Phase:
            APP_METROLOGY_GetMeasure(MEASURE_SC, &apparent_power, NULL);
            break;
        case Total_value:
            apparent_power = 0;
            break;
        default:
            break;
    }
    *scaler = 1;
    return apparent_power;
}

// *****************************************************************************
// *****************************************************************************
uint32_t read_frequency(uint32_t *scaler)
{
    uint32_t frequency = 0;
    APP_METROLOGY_GetMeasure(MEASURE_FREQ, &frequency, NULL);
    *scaler = 1;
    return frequency;
}

// *****************************************************************************
// *****************************************************************************
uint32_t read_angles(uint32_t *scaler,  PHASE phase)
{
    uint32_t angle = 0;
    switch (phase)
    {
        case A_Phase:
            APP_METROLOGY_GetMeasure(MEASURE_ANGLEA, &angle, NULL);
            break;
        case B_Phase:
            APP_METROLOGY_GetMeasure(MEASURE_ANGLEB, &angle, NULL);
            break;
        case C_Phase:
            APP_METROLOGY_GetMeasure(MEASURE_ANGLEC, &angle, NULL);
            break;
        case Total_value:
            angle = 0;
            break;
        default:
            break;
    }
    *scaler =1000;
    return angle;
}

// *****************************************************************************
// *****************************************************************************
uint32_t read_active_energy(uint32_t *scaler)
{
    uint8_t i;
    uint64_t active_energy = 0;
    APP_ENERGY_ACCUMULATORS total_active_energy;
    
    APP_ENERGY_GetCurrentEnergy(&total_active_energy);
    
    for (i = 0; i < TARIFF_NUM_TYPE; i++)
    {
        active_energy += total_active_energy.tariff[i];
    }
    
    *scaler = 10000000;
    return active_energy;
}

// *****************************************************************************
// *****************************************************************************
uint32_t read_rective_energy(uint32_t *scaler)
{
    uint32_t reactive_energy = 0;
    //APP_ENERGY_GetCurrentEnergy(&reactive_energy);
    return reactive_energy;
}

// *****************************************************************************
// *****************************************************************************
float read_abs_active_energy(uint32_t *scaler)
{
    float abs_active_energy = 0;
    //APP_ENERGY_GetCurrentEnergy(&abs_active_energy);
    return abs_active_energy;
}

// *****************************************************************************
// *****************************************************************************
float read_net_active_energy(uint32_t *scaler)
{
    float net_active_energy = 0;
    //APP_ENERGY_GetCurrentEnergy(&net_active_energy);
    return net_active_energy;
}

// *****************************************************************************
// *****************************************************************************
