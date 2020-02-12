#include "../include/rpi-uart.h"
#include "../include/rpi-gpio.h"
#include "../include/rpi-interrupts.h"
#include "../include/rpi-systimer.h"
#include "../include/rpi-armtimer.h"
#include "../include/shell.h"
#include "../include/fifo.h"

extern void _enable_interrupts(void);

/** Main function - we'll never return from here */
void kernel_main ( unsigned int r0, unsigned int r1, unsigned int atags )
{         

    /* Write 1 to the GPIO16 init nibble in the Function Select 1 GPIO
       peripheral register to enable GPIO16 as an output */
    RPI_GetGpio()->LED_GPFSEL |= ( 1 << LED_GPFBIT);

    /* Enable the timer interrupt IRQ */
    RPI_GetIrqController()->Enable_Basic_IRQs = RPI_BASIC_ARM_TIMER_IRQ;

    /* Setup the system timer interrupt */
    /* Timer frequency = Clk/256 * 0x400 */
    RPI_GetArmTimer()->Load = 0x400;

    /* Setup the ARM Timer */
    RPI_GetArmTimer()->Control =
            RPI_ARMTIMER_CTRL_23BIT |
            RPI_ARMTIMER_CTRL_ENABLE |
            RPI_ARMTIMER_CTRL_INT_ENABLE |
            RPI_ARMTIMER_CTRL_PRESCALE_256;

    // setup mini UART
    RPI_MiniUartInit();

    /* Enable the UART interrupt IRQ */
    RPI_GetIrqController()->Enable_IRQs_1 |= (1 << 29);

    /* Enable interrupts! */
    _enable_interrupts();

    char shell_start_text[] = "\r\nStarting shell program...\r\n";

    RPI_printString(&shell_start_text[0], 28);

    //shell_main();

    while(1)
    {

    }
}