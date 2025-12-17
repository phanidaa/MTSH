/**
 * \file
 *
 * \brief Default configuration of CL010 LCD Segment Map.
 *
 * Copyright (c) 2020 Microchip Corporation. All rights reserved.
 *
 * \asf_license_start
 *
 * \page License
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 *
 * 3. The name of Microchip may not be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 * 4. This software may only be redistributed and used in connection with an
 *    Microchip microcontroller product.
 *
 * THIS SOFTWARE IS PROVIDED BY MICROCHIP "AS IS" AND ANY EXPRESS OR IMPLIED
 * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT ARE
 * EXPRESSLY AND SPECIFICALLY DISCLAIMED. IN NO EVENT SHALL MICROCHIP BE LIABLE FOR
 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
 * ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 *
 * \asf_license_stop
 *
 */

/*
 * Support and FAQ: visit <a href="http://www.atmel.com/design-support/">Microchip Support</a>
 */

#ifndef CL010_SEGMAP_H_INCLUDED
#define CL010_SEGMAP_H_INCLUDED




/**
 * \name LCD component CL010 segment map definitions in PIC32CXMTSH_DB
 * @{
 */
/* [(COM - 1), SEG] ICON Definition */
#define CL010_ICON_P1                   (8 - 1), 12
#define CL010_ICON_P2                   (8 - 1), 14
#define CL010_ICON_P3                   (8 - 1), 16
#define CL010_ICON_P4                   (8 - 1), 18
#define CL010_ICON_P5                   (8 - 1), 20
#define CL010_ICON_P6                   (1 - 1), 7
#define CL010_ICON_P7                   (1 - 1), 22
#define CL010_ICON_P8                   (1 - 1), 15
#define CL010_ICON_P9                   (1 - 1), 17
#define CL010_ICON_P10                  (1 - 1), 19
 
#define CL010_ICON_S1                    (8 - 1), 23
#define CL010_ICON_S2                    (8 - 1), 26
#define CL010_ICON_S3                    (7 - 1), 26
#define CL010_ICON_S4                    (6 - 1), 26
#define CL010_ICON_S5                    (5 - 1), 26
#define CL010_ICON_S6                    (4 - 1), 26
#define CL010_ICON_S7                    (3 - 1), 26
#define CL010_ICON_S8                    (2 - 1), 26
#define CL010_ICON_S9                    (1 - 1), 26
#define CL010_ICON_S10                   (1 - 1), 27
#define CL010_ICON_S11                   (2 - 1), 27
#define CL010_ICON_S12                   (3 - 1), 27

#define CL010_ICON_S13                   (4 - 1), 27 // h back

#define CL010_ICON_S14                   (5 - 1), 27 // Hz

#define CL010_ICON_S15                   (6 - 1), 27 //4G four
#define CL010_ICON_S16                   (7 - 1), 27 //4G three
#define CL010_ICON_S17                   (8 - 1), 27 //4G two
#define CL010_ICON_S18                   (8 - 1), 21 //4G one
#define CL010_ICON_S19                   (7 - 1), 21 //4G icon

#define CL010_ICON_S20                   (6 - 1), 21 //SerialCommunication
#define CL010_ICON_S21                   (5 - 1), 21 // relay
#define CL010_ICON_S22                   (4 - 1), 21 // relay
#define CL010_ICON_S23                   (3 - 1), 21 // LOW battary
#define CL010_ICON_S24                   (2 - 1), 21 // UNlock
#define CL010_ICON_S25                   (1 - 1), 21 //unlock black

#define CL010_ICON_S26                  (1 - 1), 6 // M
#define CL010_ICON_S27                  (1 - 1), 8 //glove
#define CL010_ICON_S28                  (1 - 1), 9 // pulse
#define CL010_ICON_S29                  (1 - 1), 10 //pulse 1
#define CL010_ICON_S30                  (2 - 1), 10 //pulse 2
#define CL010_ICON_S31                  (3 - 1), 10 //pulse 3
#define CL010_ICON_S32                  (4 - 1), 10 //pulse 4
#define CL010_ICON_S33                  (5 - 1), 10 //pulse 5
#define CL010_ICON_S34                  (6 - 1), 10 // -
#define CL010_ICON_S35                  (7 - 1), 10 // --->
#define CL010_ICON_S36                  (8 - 1), 10 // -----
#define CL010_ICON_S37                  (8 - 1), 11 // <---



#define CL010_ICON_SerialCom    CL010_ICON_S20
#define CL010_ICON_relay() \
    do { \
        cl010_show_icon(CL010_ICON_S21); \
        cl010_show_icon(CL010_ICON_S22); \
    } while(0)
#define CL010_ICON_COMM_ICON             CL010_ICON_S19
#define CL010_ICON_COMM_SIGNAL_LOW       CL010_ICON_S18    
#define CL010_ICON_COMM_SIGNAL_MED       CL010_ICON_S17    
#define CL010_ICON_COMM_SIGNAL_HIG       CL010_ICON_S16    
#define CL010_ICON_COMM_SIGNAL_MAX       CL010_ICON_S15
#define CL010_ICON_BATTERY_LOW           CL010_ICON_S23
#define CL010_ICON_PQ                    CL010_ICON_S36
#define CL010_ICON_P_PLUS                CL010_ICON_S35
//#define CL010_ICON_Q_PLUS             (5 - 1), 6
#define CL010_ICON_P_MINUS               CL010_ICON_S37
//#define CL010_ICON_Q_MINUS            (8 - 1), 6



#define CL010_ICON_COL_1              (1 - 1), 21 //LOCK BLACK
#define CL010_ICON_COL_2              (1 - 1), 17
#define CL010_ICON_DOT_1              (1 - 1), 15
#define CL010_ICON_DOT_2              (1 - 1), 12
#define CL010_ICON_DOT_3              (1 - 1), 11
#define CL010_ICON_DOT_4              (8 - 1), 16
#define CL010_ICON_DOT_5              (8 - 1), 20
#define CL010_ICON_DOT_6              (8 - 1), 23




/* ((SEG << 3) | (COM - 1)) Symbol Definition */
#define CL010_D1A_SEG_NUM             ((11 << 3) | (1 - 1))
#define CL010_D1B_SEG_NUM             ((11 << 3) | (2 - 1))
#define CL010_D1C_SEG_NUM             ((11 << 3) | (5 - 1))
#define CL010_D1D_SEG_NUM             ((11 << 3) | (7 - 1))
#define CL010_D1E_SEG_NUM             ((11 << 3) | (6 - 1))
#define CL010_D1F_SEG_NUM             ((11 << 3) | (3 - 1))
#define CL010_D1G_SEG_NUM             ((11 << 3) | (4 - 1))

#define CL010_D2A_SEG_NUM             ((12 << 3) | (1 - 1))
#define CL010_D2B_SEG_NUM             ((12 << 3) | (2 - 1))
#define CL010_D2C_SEG_NUM             ((12 << 3) | (5 - 1))
#define CL010_D2D_SEG_NUM             ((12 << 3) | (7 - 1))
#define CL010_D2E_SEG_NUM             ((12 << 3) | (6 - 1))
#define CL010_D2F_SEG_NUM             ((12 << 3) | (3 - 1))
#define CL010_D2G_SEG_NUM             ((12 << 3) | (4 - 1))

#define CL010_D3A_SEG_NUM             ((14 << 3) | (1 - 1))
#define CL010_D3B_SEG_NUM             ((14 << 3) | (2 - 1))
#define CL010_D3C_SEG_NUM             ((14 << 3) | (5 - 1))
#define CL010_D3D_SEG_NUM             ((14 << 3) | (7 - 1))
#define CL010_D3E_SEG_NUM             ((14 << 3) | (6 - 1))
#define CL010_D3F_SEG_NUM             ((14 << 3) | (3 - 1))
#define CL010_D3G_SEG_NUM             ((14 << 3) | (4 - 1))

#define CL010_D4A_SEG_NUM             ((16 << 3) | (1 - 1))
#define CL010_D4B_SEG_NUM             ((16 << 3) | (2 - 1))
#define CL010_D4C_SEG_NUM             ((16 << 3) | (5 - 1))
#define CL010_D4D_SEG_NUM             ((16 << 3) | (7 - 1))
#define CL010_D4E_SEG_NUM             ((16 << 3) | (6 - 1))
#define CL010_D4F_SEG_NUM             ((16 << 3) | (3 - 1))
#define CL010_D4G_SEG_NUM             ((16 << 3) | (4 - 1))

#define CL010_D5A_SEG_NUM             ((18 << 3) | (1 - 1))
#define CL010_D5B_SEG_NUM             ((18 << 3) | (2 - 1))
#define CL010_D5C_SEG_NUM             ((18 << 3) | (5 - 1))
#define CL010_D5D_SEG_NUM             ((18 << 3) | (7 - 1))
#define CL010_D5E_SEG_NUM             ((18 << 3) | (6 - 1))
#define CL010_D5F_SEG_NUM             ((18 << 3) | (3 - 1))
#define CL010_D5G_SEG_NUM             ((18 << 3) | (4 - 1))

#define CL010_D6A_SEG_NUM             ((20 << 3) | (1 - 1))
#define CL010_D6B_SEG_NUM             ((20 << 3) | (2 - 1))
#define CL010_D6C_SEG_NUM             ((20 << 3) | (5 - 1))
#define CL010_D6D_SEG_NUM             ((20 << 3) | (7 - 1))
#define CL010_D6E_SEG_NUM             ((20 << 3) | (6 - 1))
#define CL010_D6F_SEG_NUM             ((20 << 3) | (3 - 1))
#define CL010_D6G_SEG_NUM             ((20 << 3) | (4 - 1))

#define CL010_D7A_SEG_NUM             ((23 << 3) | (1 - 1))
#define CL010_D7B_SEG_NUM             ((23 << 3) | (2 - 1))
#define CL010_D7C_SEG_NUM             ((23 << 3) | (5 - 1))
#define CL010_D7D_SEG_NUM             ((23 << 3) | (7 - 1))
#define CL010_D7E_SEG_NUM             ((23 << 3) | (6 - 1))
#define CL010_D7F_SEG_NUM             ((23 << 3) | (3 - 1))
#define CL010_D7G_SEG_NUM             ((23 << 3) | (4 - 1))

#define CL010_D8A_SEG_NUM             ((9 << 3) | (8 - 1))
#define CL010_D8B_SEG_NUM             ((9 << 3) | (7 - 1))
#define CL010_D8C_SEG_NUM             ((9 << 3) | (4 - 1))
#define CL010_D8D_SEG_NUM             ((9 << 3) | (2 - 1))
#define CL010_D8E_SEG_NUM             ((9 << 3) | (3 - 1))
#define CL010_D8F_SEG_NUM             ((9 << 3) | (6 - 1))
#define CL010_D8G_SEG_NUM             ((9 << 3) | (5 - 1))

#define CL010_D9A_SEG_NUM             ((8 << 3) | (8 - 1))
#define CL010_D9B_SEG_NUM             ((8 << 3) | (7 - 1))
#define CL010_D9C_SEG_NUM             ((8 << 3) | (4 - 1))
#define CL010_D9D_SEG_NUM             ((8 << 3) | (2 - 1))
#define CL010_D9E_SEG_NUM             ((8 << 3) | (3 - 1))
#define CL010_D9F_SEG_NUM             ((8 << 3) | (6 - 1))
#define CL010_D9G_SEG_NUM             ((8 << 3) | (5 - 1))

#define CL010_D10A_SEG_NUM            ((7 << 3) | (8 - 1))
#define CL010_D10B_SEG_NUM            ((7 << 3) | (7 - 1))
#define CL010_D10C_SEG_NUM            ((7 << 3) | (4 - 1))
#define CL010_D10D_SEG_NUM            ((7 << 3) | (2 - 1))
#define CL010_D10E_SEG_NUM            ((7 << 3) | (3 - 1))
#define CL010_D10F_SEG_NUM            ((7 << 3) | (6 - 1))
#define CL010_D10G_SEG_NUM            ((7 << 3) | (5 - 1))

#define CL010_D11A_SEG_NUM            ((6 << 3) | (8 - 1))
#define CL010_D11B_SEG_NUM            ((6 << 3) | (7 - 1))
#define CL010_D11C_SEG_NUM            ((6 << 3) | (4 - 1))
#define CL010_D11D_SEG_NUM            ((6 << 3) | (2 - 1))
#define CL010_D11E_SEG_NUM            ((6 << 3) | (3 - 1))
#define CL010_D11F_SEG_NUM            ((6 << 3) | (6 - 1))
#define CL010_D11G_SEG_NUM            ((6 << 3) | (5 - 1))

#define CL010_D12A_SEG_NUM            ((22 << 3) | (8 - 1))
#define CL010_D12B_SEG_NUM            ((22 << 3) | (7 - 1))
#define CL010_D12C_SEG_NUM            ((22 << 3) | (4 - 1))
#define CL010_D12D_SEG_NUM            ((22 << 3) | (2 - 1))
#define CL010_D12E_SEG_NUM            ((22 << 3) | (3 - 1))
#define CL010_D12F_SEG_NUM            ((22 << 3) | (6 - 1))
#define CL010_D12G_SEG_NUM            ((22 << 3) | (5 - 1))

#define CL010_D13A_SEG_NUM            ((15 << 3) | (8 - 1))
#define CL010_D13B_SEG_NUM            ((15 << 3) | (7 - 1))
#define CL010_D13C_SEG_NUM            ((15 << 3) | (4 - 1))
#define CL010_D13D_SEG_NUM            ((15 << 3) | (2 - 1))
#define CL010_D13E_SEG_NUM            ((15 << 3) | (3 - 1))
#define CL010_D13F_SEG_NUM            ((15 << 3) | (6 - 1))
#define CL010_D13G_SEG_NUM            ((15 << 3) | (5 - 1))

#define CL010_D14A_SEG_NUM            ((17 << 3) | (8 - 1))
#define CL010_D14B_SEG_NUM            ((17 << 3) | (7 - 1))
#define CL010_D14C_SEG_NUM            ((17 << 3) | (4 - 1))
#define CL010_D14D_SEG_NUM            ((17 << 3) | (2 - 1))
#define CL010_D14E_SEG_NUM            ((17 << 3) | (3 - 1))
#define CL010_D14F_SEG_NUM            ((17 << 3) | (6 - 1))
#define CL010_D14G_SEG_NUM            ((17 << 3) | (5 - 1))

#define CL010_D15A_SEG_NUM            ((19 << 3) | (8 - 1))
#define CL010_D15B_SEG_NUM            ((19 << 3) | (7 - 1))
#define CL010_D15C_SEG_NUM            ((19 << 3) | (4 - 1))
#define CL010_D15D_SEG_NUM            ((19 << 3) | (2 - 1))
#define CL010_D15E_SEG_NUM            ((19 << 3) | (3 - 1))
#define CL010_D15F_SEG_NUM            ((19 << 3) | (6 - 1))
#define CL010_D15G_SEG_NUM            ((19 << 3) | (5 - 1))


//***************************************************************************************************************************************
/* The LCD segment map number */
#define CL010_SEGMAP_NUM_0     0x0CFFDFC0 //0x0EBFFFC0
/* @} */
//***************************************************************************************************************************************



#define CL010_ICONS_UNIT_W      CL010_ICON_S6, CL010_ICON_S7, CL010_ICON_S8 //CL010_ICON_UNITS_6, CL010_ICON_UNITS_7, CL010_ICON_UNITS_8
#define CL010_ICONS_UNIT_h      CL010_ICON_S10, CL010_ICON_S11, CL010_ICON_S12 //CL010_ICON_UNITS_10, CL010_ICON_UNITS_11, CL010_ICON_UNITS_11_BIS
#define CL010_ICONS_UNIT_h1     CL010_ICON_S13
#define CL010_ICONS_UNIT_k      CL010_ICON_S3, CL010_ICON_S4 //CL010_ICON_UNITS_1, CL010_ICON_UNITS_3, CL010_ICON_UNITS_4
#define CL010_ICONS_UNIT_M      CL010_ICON_S3, CL010_ICON_S5 //CL010_ICON_UNITS_1, CL010_ICON_UNITS_2, CL010_ICON_UNITS_4, CL010_ICON_UNITS_5
#define CL010_ICONS_UNIT_r      CL010_ICON_S11 //CL010_ICON_UNITS_10
#define CL010_ICONS_UNIT_H      CL010_ICON_S14 //CL010_ICON_UNITS_12, CL010_ICON_UNITS_13
#define CL010_ICONS_UNIT_z      CL010_ICON_S14 //CL010_ICON_UNITS_14
#define CL010_ICONS_UNIT_V      CL010_ICON_S6 //CL010_ICON_UNITS_6
#define CL010_ICONS_UNIT_A      CL010_ICON_S8, CL010_ICON_S9 //CL010_ICON_UNITS_8, CL010_ICON_UNITS_9
#define CL010_ICONS_UNIT_kW     CL010_ICONS_UNIT_k, CL010_ICONS_UNIT_W
#define CL010_ICONS_UNIT_Wh     CL010_ICONS_UNIT_W, CL010_ICONS_UNIT_h
#define CL010_ICONS_UNIT_kWh    CL010_ICONS_UNIT_k, CL010_ICONS_UNIT_W, CL010_ICONS_UNIT_h
#define CL010_ICONS_UNIT_MWh    CL010_ICONS_UNIT_M, CL010_ICONS_UNIT_W, CL010_ICONS_UNIT_h
#define CL010_ICONS_UNIT_VAh    CL010_ICONS_UNIT_V, CL010_ICONS_UNIT_A, CL010_ICONS_UNIT_h
#define CL010_ICONS_UNIT_kVAh   CL010_ICONS_UNIT_k, CL010_ICONS_UNIT_V, CL010_ICONS_UNIT_A, CL010_ICONS_UNIT_h
#define CL010_ICONS_UNIT_MVAh   CL010_ICONS_UNIT_M, CL010_ICONS_UNIT_V, CL010_ICONS_UNIT_A, CL010_ICONS_UNIT_h
#define CL010_ICONS_UNIT_Ah     CL010_ICONS_UNIT_A, CL010_ICONS_UNIT_h
#define CL010_ICONS_UNIT_kAh    CL010_ICONS_UNIT_k, CL010_ICONS_UNIT_A, CL010_ICONS_UNIT_h
#define CL010_ICONS_UNIT_MAh    CL010_ICONS_UNIT_M, CL010_ICONS_UNIT_A, CL010_ICONS_UNIT_h
#define CL010_ICONS_UNIT_VA     CL010_ICONS_UNIT_V, CL010_ICONS_UNIT_A
#define CL010_ICONS_UNIT_VAr    CL010_ICONS_UNIT_V, CL010_ICONS_UNIT_A, CL010_ICONS_UNIT_r
#define CL010_ICONS_UNIT_VArh   CL010_ICONS_UNIT_V, CL010_ICONS_UNIT_A, CL010_ICONS_UNIT_r, CL010_ICONS_UNIT_h1
#define CL010_ICONS_UNIT_kVArh  CL010_ICONS_UNIT_k, CL010_ICONS_UNIT_V, CL010_ICONS_UNIT_A, CL010_ICONS_UNIT_r, CL010_ICONS_UNIT_h1
#define CL010_ICONS_UNIT_MVArh  CL010_ICONS_UNIT_M, CL010_ICONS_UNIT_V, CL010_ICONS_UNIT_A, CL010_ICONS_UNIT_r, CL010_ICONS_UNIT_h1
#define CL010_ICONS_UNIT_Hz     CL010_ICONS_UNIT_H, CL010_ICONS_UNIT_z
#define CL010_ICONS_UNIT_kHz    CL010_ICONS_UNIT_k, CL010_ICONS_UNIT_H, CL010_ICONS_UNIT_z
#define CL010_ICONS_UNIT_MHz    CL010_ICONS_UNIT_M, CL010_ICONS_UNIT_H, CL010_ICONS_UNIT_z

#define CL010_ICONS_T           CL010_ICON_S1 //T
#define CL010_ICONS_M           CL010_ICON_S26 //M

#endif  /* CL010_SEGMAP_H_INCLUDED */
