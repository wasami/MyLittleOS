#include "../include/rpi-uart.h"
#include "../include/rpi-gpio.h"
#include "../include/rpi-interrupts.h"
#include "../include/rpi-systimer.h"
#include "../include/rpi-armtimer.h"
#include "../include/shell.h"
#include "../include/fifo.h"
#include "../include/process.h"
#include "../include/print.h"
#include "../include/dummy.h"

extern void _enable_interrupts(void);
extern void _start_user_program(void* func);
extern void _start_user_process(void* func);

void exception(char* message)
{
    RPI_printString(message);
    while(1)
    {

    }
}

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
    
    //char createProcessStr[] = "\r\nCreating New Process";
    //char startingProcessStr[] = "\r\nStarting User Program";
    char err[] = "\r\nNo space on pcb!";

    /* Create process */
    //RPI_printString(&createProcessStr[0]);
    process* newProc = getAvailablePCB();
    
    if (newProc == 0) 
    {
        exception(&err[0]);
    }
    createProcess(newProc, &dummy_process_one);

    /* Create process  */
    //RPI_printString(&createProcessStr[0]);
    newProc = getAvailablePCB();

    if (newProc == 0) 
    {
        exception(&err[0]);
    }
    createProcess(newProc, &dummy_process_two);
    setRunningProcess(newProc);

    /* Execute first user dummy_process_two */
    //RPI_printString(&startingProcessStr[0]);

    newProc->state = PROCESS_RUNNING;
    _start_user_process(newProc);
    
    //_start_user_program(&dummy_process_two);

    while(1)
    {

    }
}