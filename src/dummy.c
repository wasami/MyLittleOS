/*
    Dummy programs to demonstrate scheduler
*/

#include "../include/rpi-uart.h"
#include "../include/rpi-systimer.h"
#include "../include/svc.h"

//unsigned *svc_vec = (unsigned *)0x08;
//extern void SVC_Handler(void);

void dummy_a(void)
{
    //Install_Handler( (unsigned) SVC_Handler, svc_vec );
    //print a
    while (1)
    {
        /* Write 'a' to mini UART */
        svc_zero('a');
    }
}

void dummy_b(void)
{
    char character = 'b';
    uint32_t microSeconds = 1000000;
    //print a
    while (1)
    {
        RPI_WriteToMiniUart(character);
        RPI_WaitMicroSeconds(microSeconds);
    }
}






