#include "../include/svc.h"
#include "../include/rpi-uart.h"
#include "../include/rpi-gpio.h"

void SVC_Handler_Main(unsigned int number, unsigned int *svc_args )
{
  if(number == 0) {
        unsigned int value_in_reg_0 = svc_args[0];           // Get char to print
        rpi_uart_t* rpiMiniUart = RPI_GetMiniUart();    

        /* Wait until the UART has an empty space in the FIFO */
        while( ( rpiMiniUart->AUX_MU_LSR_REG & AUX_MULSR_TX_EMPTY ) == 0 ) { }

        /* Write the character to the FIFO for transmission */
        rpiMiniUart->AUX_MU_IO_REG = value_in_reg_0;  
    } else if(number == 1) {
        LED_ON();
    } else {
        char string = '3';
        while( 1 )
        {
            RPI_WriteToMiniUart(string);
        }
    }


}