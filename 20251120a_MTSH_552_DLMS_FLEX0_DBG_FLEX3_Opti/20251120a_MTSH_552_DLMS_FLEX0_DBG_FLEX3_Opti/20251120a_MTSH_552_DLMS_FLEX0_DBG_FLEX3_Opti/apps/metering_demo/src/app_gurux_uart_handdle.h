
#ifndef APP_GURUX_PROCESS_TIME_H
#define APP_GURUX_PROCESS_TIME_H

#include <stdint.h>
#include "definitions.h"
#include "gurux/include/gxobjects.h"

#define MAX_BUFFER_LEN          512

typedef void (*dlms_usart_callback)(uint16_t usart_len, uint8_t *usart_data);


typedef struct {
    uint8_t rec_data[MAX_BUFFER_LEN];
    uint8_t rec_data_len; 
    uint8_t dlms_rec_data[MAX_BUFFER_LEN];
    uint16_t dlms_rec_data_len;
}DLMS_DATA;

void write_dlms_data(uint8_t *data, uint16_t len);
void process_dlms_rec_data(void);
void dlms_usart_task(void);
void DLMS_USART_Handler(void);
void dlms_usart_inint(void);
void register_dlms_usart_cb(dlms_usart_callback ucb);

extern DLMS_DATA dlms_data;


#endif