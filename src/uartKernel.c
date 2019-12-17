#include "rpi-uart.h"
#include "rpi-gpio.h"
#include "rpi-interrupts.h"

//GPIO14  TXD0 and TXD1
//GPIO15  RXD0 and RXD1
//alt function 5 for uart1
//alt function 0 for uart0

// baud rate
//((250,000,000/115200)/8)-1 = 270

extern void _enable_interrupts(void);

volatile unsigned int ra;

/** Main function - we'll never return from here */
void kernel_main ( unsigned int r0, unsigned int r1, unsigned int atags )
{         

    rpi_uart_t* miniUartReg =  RPI_GetMiniUart();
    rpi_gpio_t* gpioReg = RPI_GetGpio();

    RPI_GetAux()->AUX_ENABLES |= 1;

    miniUartReg->AUX_MU_CNTL_REG = 0;      //Enable mini uart (this also enables access to its registers)
    miniUartReg->AUX_MU_IER_REG = 0;        //Disable receive and transmit interrupts
    miniUartReg->AUX_MU_LCR_REG = 3;        //Enable 8 bit mode
    miniUartReg->AUX_MU_MCR_REG = 0;        //Set RTS line to be always high
    miniUartReg->AUX_MU_BAUD_REG = 270;     //Set baud rate to 115200

    ra = gpioReg->GPFSEL1;
    ra &= ~(7<<12); //gpio14
    ra |= 2<<12;    //alt5
    ra &= ~(7<<15);  // clean gpio15
    ra |= 2<<15;      // set alt5 for gpio 15
    gpioReg->GPFSEL1 = ra;

    //_put32(GPPUD,0);
    gpioReg->GPPUD = 0;
    
    //wait 150 cycles
    for(ra=0;ra<150;ra++);

    //_put32(GPPUDCLK0,(1<<14)|(1<<15));
    gpioReg->GPPUDCLK0 = (1<<14)|(1<<15);

    //wait 150 cycles
    for(ra=0;ra<150;ra++);

    //_put32(GPPUDCLK0,0);
    gpioReg->GPPUDCLK0 = 0;

    /* enable reciever interrupt only */
    miniUartReg->AUX_MU_IER_REG = 2;

    /* Enable the UART interrupt IRQ */
    RPI_GetIrqController()->Enable_IRQs_1 |= (1 << 29);

    /* Enable interrupts! */
    _enable_interrupts();

    /* Enable receiver and transmitter */
    miniUartReg->AUX_MU_CNTL_REG = 3;

    while(1)
    {

    }
}