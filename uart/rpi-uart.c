/*
    Part of the Raspberry-Pi Bare Metal Tutorials
    https://www.valvers.com/rpi/bare-metal/
    Copyright (c) 2013-2018, Brian Sidebotham

    This software is licensed under the MIT License.
    Please see the LICENSE file included with this software.

*/

#include <stdint.h>
#include "rpi-uart.h"

static rpi_aux_t* rpiAux = (rpi_aux_t*)RPI_AUX_BASE;
static rpi_uart_t* rpiMiniUart = (rpi_uart_t*)RPI_UART_BASE;

rpi_aux_t* RPI_GetAux(void)
{
    return rpiAux;
}

rpi_uart_t* RPI_GetMiniUart(void)
{
    return rpiMiniUart;
}

void RPI_UartInit(void)
{

}
