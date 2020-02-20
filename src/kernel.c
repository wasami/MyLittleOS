#include "../include/rpi-uart.h"
#include "../include/rpi-gpio.h"
#include "../include/rpi-interrupts.h"
#include "../include/rpi-systimer.h"
#include "../include/rpi-armtimer.h"
#include "../include/shell.h"
#include "../include/fifo.h"

extern void _enable_interrupts(void);
extern void _jump_to_user_code(void* func);
extern void _test(void);
extern void dummy_a(void);
extern void dummy_b(void);


/** Main function - we'll never return from here */
void kernel_main ( unsigned int r0, unsigned int r1, unsigned int atags )
{         

    /* Write 1 to the GPIO16 init nibble in the Function Select 1 GPIO
       peripheral register to enable GPIO16 as an output */
    RPI_GetGpio()->LED_GPFSEL |= ( 1 << LED_GPFBIT);

    /* Enable the timer interrupt IRQ */
    RPI_GetIrqController()->Enable_Basic_IRQs = RPI_BASIC_ARM_TIMER_IRQ;

    /* Setup the Arm timer interrupt */
    /* Timer frequency = Clk/256 * 0x400 */
    RPI_GetArmTimer()->Load = 0x400;

    /* Setup the ARM Timer */
    RPI_GetArmTimer()->Control =
            RPI_ARMTIMER_CTRL_23BIT |
            RPI_ARMTIMER_CTRL_ENABLE |
            RPI_ARMTIMER_CTRL_INT_ENABLE |
            RPI_ARMTIMER_CTRL_PRESCALE_256;

    /* Enable the System timer compare 0 interrupt IRQ */
    // RPI_GetIrqController()->Enable_IRQs_1 = RPI_SYS_TIMER_CMP_1_IRQ;

    /* Setup System timer*/
    // RPI_GetSystemTimer()->compare1 = TENTH_OF_SECOND;

    // setup mini UART
    RPI_MiniUartInit();

    /* Enable the UART interrupt IRQ */
    //RPI_GetIrqController()->Enable_IRQs_1 |= (1 << 29);

    /* Enable interrupts! */
    //_enable_interrupts();

    char shell_start_text[] = "\n\rStarting shell program...\n\r";
    RPI_printString(&shell_start_text[0]);
    
    /*
        This causes issues
        uint32_t microSeconds = 5000000;
        RPI_WaitMicroSeconds(microSeconds);
    */

    /*
        char something[] = "testing";
        RPI_printString(&something[0]);
    */

    /* Setup PCB block */

    /* Switch to user mode  */

    /* Execute first user process */
    _jump_to_user_code(&dummy_a);

    while(1)
    {

    }
}