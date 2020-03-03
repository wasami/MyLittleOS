#include "../include/svc.h"
#include "../include/rpi-uart.h"
#include "../include/rpi-gpio.h"
#include "../include/process.h"

extern void _context_switch(process* current_proc, process* next_proc, unsigned int* svc_args);

void SVC_Handler_Main(unsigned int number, unsigned int *svc_args )
{
    // SVC 0 - Write char to mini UART
    if(number == 0) {
        unsigned int value_in_reg_0 = svc_args[0];           // Get char to print
        rpi_uart_t* rpiMiniUart = RPI_GetMiniUart();    

        /* Wait until the UART has an empty space in the FIFO */
        while( ( rpiMiniUart->AUX_MU_LSR_REG & AUX_MULSR_TX_EMPTY ) == 0 ) { }

        /* Write the character to the FIFO for transmission */
        rpiMiniUart->AUX_MU_IO_REG = value_in_reg_0;  
    } 
    // SVC 1 - Process yields, Switch context
    else if(number == 1) {
        // First write current process context to PCB
        process* current_proc = getRunningProcess();
        process* next_proc = getNextProcess();

        //set states currently manually setting to ready
        current_proc->state = 2;
        next_proc->state = 1;

        setRunningProcess(next_proc);

        //Call contextSwitch function and pass pointers to pcb for the processes and pointer to user registers on stack
        _context_switch(current_proc, next_proc, svc_args);
    } else {
        char string = '3';
        while( 1 )
        {
            RPI_WriteToMiniUart(string);
        }
    }
}