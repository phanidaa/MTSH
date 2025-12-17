
#ifndef APP_GURUX_PROCESS_TIME_H
#define APP_GURUX_PROCESS_TIME_H



void dlms_usart_data_cb(uint16_t len, uint8_t *dlms_rec_data);
void init_dlms_process(void);
void process_dlms_rec_data(void);
void dlms_set_read_buffer(void);

#endif
