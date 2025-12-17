![Microchip logo](https://raw.githubusercontent.com/wiki/Microchip-MPLAB-Harmony/Microchip-MPLAB-Harmony.github.io/images/microchip_logo.png)
![Harmony logo small](https://raw.githubusercontent.com/wiki/Microchip-MPLAB-Harmony/Microchip-MPLAB-Harmony.github.io/images/microchip_mplab_harmony_logo_small.png)

# Microchip MPLAB® Harmony 3 Release Notes

## Smart Energy Metrology Apps Release v1.0.0

### New Features

- **Applications**

  - Demo Meter application is provided in this release as an example of the most common functionalities included in an electricity meter. It allows the user to evaluate the features and to test the high accuracy that can be achieved with the Microchip Smart Metering solutions.
  - Demo Multi-channel Meter application is provided in this release. It allows the user to evaluate the multi channel features and to test the high accuracy that can be achieved with the Microchip Smart Metering solutions.
  - Examples of EMAFE peripheral usage. EMAFE consists of high resolution ADCs for Voltage and Current sensing, including Voltage reference and Temperature sensor. Examples for DMA and Polled versions are provided.
  - Examples of ICM peripheral usage. ICM is used to calculate Hash and monitor the integrity of a user defined memory region. Examples for Compare Mode and Monitor Mode are provided.

- **New Features and Enhancements**
  - EMAFE and ICM examples are new to this version.
  - Events App of Demo Meter Applications adapted to new Events reporting from Metrology Driver.

- **Metrology Library Versions**
  - This release uses the following versions of the Metrology Library binaries:
    - Traditional Metrology Library v3.03.00
    - Multi-Channel Metrology Library v4.00.00

- **Backup Mode Test**

  - When Backup mode is to be used with a battery, a line of code has to be modified in the *SUPC_BackupModeEnter* function, on the *Switch off voltage regulator* section, as seen on the following code block:
    ```c
    void SUPC_BackupModeEnter(void)
    {
        SCB->SCR |= SCB_SCR_SLEEPDEEP_Msk;

        /* Switch off voltage regulator */
        //SUPC_REGS->SUPC_CR = SUPC_CR_KEY_PASSWD | SUPC_CR_VROFF_Msk;
        SUPC_REGS->SUPC_CR = SUPC_CR_KEY_PASSWD | SUPC_CR_SHDW_Msk;

        /* Enable CPU Interrupt */
        __DMB();
        __enable_irq();

        /* Enter Backup */
        __DSB();
        __WFI();
    }
    ```

### Bug fixes

- Corrected implementation of Backup Mode entering and associated wake-up.

### Known Issues

- None.

### Development Tools

- [MPLAB® X IDE v6.25](https://www.microchip.com/mplab/mplab-x-ide)
- [MPLAB® XC32 C/C++ Compiler v4.60](https://www.microchip.com/mplab/compilers)
- MPLAB® X IDE plug-ins:
  - MPLAB® Code Configurator 5.5.3 or higher
- PIC32CX-MT family (MCUs):
  - PIC32CX-MT DFP 1.3.132 or higher

### Notes

- This is the first Metrology Apps Release in this smartenergy_metrology_apps independent repository. Previous versions were released along with Metrology Drivers as part of smartenergy_metrology repository.
