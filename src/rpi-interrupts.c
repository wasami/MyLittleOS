/*
    Part of the Raspberry-Pi Bare Metal Tutorials
    https://www.valvers.com/rpi/bare-metal/
    Copyright (c) 2013-2018, Brian Sidebotham

    This software is licensed under the MIT License.
    Please see the LICENSE file included with this software.

*/

#include <stdint.h>
#include <stdbool.h>

#include "../include/rpi-uart.h"
#include "../include/rpi-base.h"
#include "../include/rpi-gpio.h"
#include "../include/rpi-interrupts.h"
#include "../include/rpi-armtimer.h"
#include "../include/rpi-systimer.h"

/** @brief The BCM2835 Interupt controller peripheral at it's base address */
static rpi_irq_controller_t* rpiIRQController =
        (rpi_irq_controller_t*)RPI_INTERRUPT_CONTROLLER_BASE;


/**
    @brief Return the IRQ Controller register set
*/
rpi_irq_controller_t* RPI_GetIrqController( void )
{
    return rpiIRQController;
}


/**
    @brief The Reset vector interrupt handler

    This can never be called, since an ARM core reset would also reset the
    GPU and therefore cause the GPU to start running code again until
    the ARM is handed control at the end of boot loading
*/
void __attribute__((interrupt("ABORT"))) reset_vector(void)
{
    char string = '1';
    
    while( 1 )
    {
        LED_ON();
        RPI_WriteToMiniUart(string);
    }
}

/**
    @brief The undefined instruction interrupt handler

    If an undefined intstruction is encountered, the CPU will start
    executing this function. Just trap here as a debug solution.
*/
void __attribute__((interrupt("UNDEF"))) undefined_instruction_vector(void)
{
    char string = '2';
    while( 1 )
    {
        LED_ON();
        RPI_WriteToMiniUart(string);
    }
}


/**
    @brief The supervisor call interrupt handler

    The CPU will start executing this function.
*/
void __attribute__((interrupt("SWI"))) software_interrupt_vector(unsigned int number, unsigned int* svc_args)
{
    //unsigned int svc_number;    
    /*    * Stack contains:    * r0, r1, r2, r3, r12, r14, the return address and xPSR    * First argument (r0) is svc_args[0]    */    
    //svc_number = ((char *)svc_args[6])[-2];
     
    // switch(number)    
    // {        
    //     /* SVC number 0 - Write character to mini UART */
    //     case 0:            
    //         unsigned int value_in_reg_0 = svc_args[0];           // Get char to print
    //         rpi_uart_t* rpiMiniUart = RPI_GetMiniUart();    

    //         /* Wait until the UART has an empty space in the FIFO */
    //         while( ( rpiMiniUart->AUX_MU_LSR_REG & AUX_MULSR_TX_EMPTY ) == 0 ) { }

    //         /* Write the character to the FIFO for transmission */
    //         rpiMiniUart->AUX_MU_IO_REG = value_in_reg_0;         
    //         break;

    //     /* Handle SVC 01 */
    //     case 1:       
    //         LED_ON();     
    //         break;
    //     /* Unknown SVC - Report error */
    //     default:          
    //         break;    
    // }

    char string = '3';
    while( 1 )
    {
        LED_ON();
        RPI_WriteToMiniUart(string);
    }
}


/**
    @brief The prefetch abort interrupt handler

    The CPU will start executing this function. Just trap here as a debug
    solution.
*/
void __attribute__((interrupt("ABORT"))) prefetch_abort_vector(void)
{
    char string = '4';
    while( 1 )
    {
        LED_ON();
        RPI_WriteToMiniUart(string);
    }
}


/**
    @brief The Data Abort interrupt handler

    The CPU will start executing this function. Just trap here as a debug
    solution.
*/
void __attribute__((interrupt("ABORT"))) data_abort_vector(void)
{
    char string = '5';
    while( 1 )
    {
        LED_ON();
        RPI_WriteToMiniUart(string);
    }
}

/**
    @brief The IRQ Interrupt handler

    This handler is run every time an interrupt source is triggered. It's
    up to the handler to determine the source of the interrupt and most
    importantly clear the interrupt flag so that the interrupt won't
    immediately put us back into the start of the handler again.
*/
void  __attribute__ ((interrupt ("IRQ")))  interrupt_vector()
{
    static int lit = 0;
    static int msCounter = 0;

    /* ISR for system timer */
    if(RPI_GetSystemTimer()->control_status && RPI_SYSTIMER_1_IRQ)
    {
        /* Clear the System timer channel 1 interrupt */
        RPI_GetSystemTimer()->control_status &= ~(RPI_SYSTIMER_1_IRQ);

        /* Update Compare register to trigger interrupt in tenth of a second */
        RPI_GetSystemTimer()->compare1 += TENTH_OF_SECOND;

        /* Check if 1 second has passed by */
        if(msCounter >= 10)
        {
            msCounter = 0;

            // TO-DO: Increment global counter/timer
            // char test = 'a';
            // RPI_WriteToMiniUart(test);
        }
        msCounter++;
    }

    /* ISR for ARM timer */
    if(rpiIRQController->IRQ_basic_pending && RPI_BASIC_ARM_TIMER_IRQ)
    {
        /* Clear the ARM Timer interrupt */
        RPI_GetArmTimer()->IRQClear = 1;

        /* Flip the LED */
        if( lit )
        {
            LED_OFF();
            lit = 0;
        }
        else
        {
            LED_ON();
            lit = 1;
        }
    }

    // //RPI_MiniUart_ISR();
    // volatile uint32_t incoming_data;
    // rpi_uart_t* rpiMiniUart = RPI_GetMiniUart();
    // //rpi_aux_t* aux = RPI_GetAux();
    // char incoming_byte;
    // char byte_read;

    // // Code executed if Mini UART receiver holds data
    // if (rpiMiniUart->AUX_MU_LSR_REG & 1) 
    // {
    //     incoming_data = rpiMiniUart->AUX_MU_IO_REG;

        
    //     //rpiMiniUart->AUX_MU_IER_REG |= 1 << 0;      // Enable transmit interrupt

    //     // add to buffer
    //     incoming_byte = incoming_data;

    //     fifo_write(&fifo_buffer, &incoming_byte, 1);

    //     fifo_read(&fifo_buffer, &byte_read, 1);

    //     // Echo
    //     rpiMiniUart->AUX_MU_IO_REG =  byte_read;
    // }

    // Interupt generated by transmit register being empty
    // if (rpiMiniUart->AUX_MU_IIR_REG & 2) 
    // {
    //     // If transmit register is empty then check if transmit FIFO is empty
    //     // If transmit FIFO is empty the disable transmit interupt
    //     // Bit 6 in AUX_MU_LSR_REG is set high if transmit FIFO is empty
    //     if (rpiMiniUart->AUX_MU_LSR_REG & 64) 
    //     {
    //         rpiMiniUart->AUX_MU_IER_REG &= ~(1 << 0);      // Disable transmit interrupt
    //     }
    // }
}

/**
    @brief The FIQ Interrupt Handler

    The FIQ handler can only be allocated to one interrupt source. The FIQ has
    a full CPU shadow register set. Upon entry to this function the CPU
    switches to the shadow register set so that there is no need to save
    registers before using them in the interrupt.

    In C you can't see the difference between the IRQ and the FIQ interrupt
    handlers except for the FIQ knowing it's source of interrupt as there can
    only be one source, but the prologue and epilogue code is quite different.
    It's much faster on the FIQ interrupt handler.

    The prologue is the code that the compiler inserts at the start of the
    function, if you like, think of the opening curly brace of the function as
    being the prologue code. For the FIQ interrupt handler this is nearly
    empty because the CPU has switched to a fresh set of registers, there's
    nothing we need to save.

    The epilogue is the code that the compiler inserts at the end of the
    function, if you like, think of the closing curly brace of the function as
    being the epilogue code. For the FIQ interrupt handler this is nearly
    empty because the CPU has switched to a fresh set of registers and so has
    not altered the main set of registers.
*/
void __attribute__((interrupt("FIQ"))) fast_interrupt_vector(void)
{

}