#include "../include/svc.h"
#include "../include/rpi-uart.h"

extern void _svc_return(void);

void svc_zero(char c)
{
    rpi_uart_t* rpiMiniUart = RPI_GetMiniUart(); 

    /* Wait until the UART has an empty space in the FIFO */
    while( ( rpiMiniUart->AUX_MU_LSR_REG & AUX_MULSR_TX_EMPTY ) == 0 ) { }

    /* Write the character to the FIFO for transmission */
    rpiMiniUart->AUX_MU_IO_REG = c;

    _svc_return();
}

void svc_one(void)
{

}