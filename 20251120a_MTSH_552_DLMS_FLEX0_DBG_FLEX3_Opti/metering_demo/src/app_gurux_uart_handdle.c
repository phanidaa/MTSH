
#include "app_gurux_uart_handdle.h"
#include "definitions.h"

DLMS_DATA dlms_data;

uint8_t check_timer = 0;
dlms_usart_callback dlms_usart_cb = NULL;

// *****************************************************************************
// *****************************************************************************
void write_dlms_data(uint8_t *data, uint16_t len)
{
    FLEXCOM0_USART_Write(data,len);
    
}
// *****************************************************************************
// *****************************************************************************
void dlms_set_read_buffer(void)
{
    FLEXCOM0_USART_Read(dlms_data.rec_data, 1);
}
// *****************************************************************************
// *****************************************************************************
void process_dlms_rec_data(void)
{
    dlms_data.rec_data_len = FLEXCOM0_USART_ReadCountGet();
    if(dlms_data.rec_data_len > 0)
    {
        dlms_data.dlms_rec_data_len = dlms_data.rec_data_len;
        memcpy(dlms_data.dlms_rec_data, dlms_data.rec_data, dlms_data.dlms_rec_data_len);
    }
    else
    {
        return;
    }
	check_timer = 1;
}

// *****************************************************************************
// *****************************************************************************
void dlms_usart_task(void)
{
	if(check_timer == 1)
	{
		if (dlms_usart_cb != NULL) 
        {
            dlms_usart_cb(dlms_data.dlms_rec_data_len, dlms_data.dlms_rec_data);
        }
        dlms_data.dlms_rec_data_len = 0;
        check_timer = 0;
		
	}
}

// *****************************************************************************
// *****************************************************************************
void DLMS_USART_Handler(void)
{
    process_dlms_rec_data();
	dlms_set_read_buffer();
}

// *****************************************************************************
// *****************************************************************************
void register_dlms_usart_cb(dlms_usart_callback ucb)
{
	dlms_usart_cb = ucb;
}

// *****************************************************************************
// *****************************************************************************
void dlms_usart_inint(void)
{
	dlms_data.dlms_rec_data_len = 0;
	check_timer = 0;
}
