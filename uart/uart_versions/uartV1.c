#include "rpi-uart.h"

//GPIO14  TXD0 and TXD1
//GPIO15  RXD0 and RXD1
//alt function 5 for uart1
//alt function 0 for uart0

// baud rate
//((250,000,000/115200)/8)-1 = 270

volatile unsigned int ra;

volatile unsigned int character;

/** Main function - we'll never return from here */
void kernel_main ( unsigned int r0, unsigned int r1, unsigned int atags )
{
    _put32(AUX_ENABLES,1);                   //Enable mini uart (this also enables access to its registers)
    _put32(AUX_MU_CNTL_REG,0);               //Disable auto flow control and disable receiver and transmitter (for now)
    _put32(AUX_MU_IER_REG,0);                //Disable receive and transmit interrupts
    _put32(AUX_MU_LCR_REG,3);                //Enable 8 bit mode
    _put32(AUX_MU_MCR_REG,0);                //Set RTS line to be always high
    _put32(AUX_MU_BAUD_REG,270);             //Set baud rate to 115200

    ra = _get32(GPFSEL1);
    ra &= ~(7<<12); //gpio14
    ra |= 2<<12;    //alt5
    ra &= ~(7<<15);  // clean gpio15
    ra |= 2<<15;      // set alt5 for gpio 15
    _put32(GPFSEL1,ra);

    _put32(GPPUD,0);

    for(ra=0;ra<150;ra++);

    _put32(GPPUDCLK0,(1<<14)|(1<<15));

    for(ra=0;ra<150;ra++);

    _put32(GPPUDCLK0,0);

    ra = 0;
    while(1)
    {
        _put32(AUX_MU_CNTL_REG,1);        //enable receiver only for now

        while(1)
        {
            if(_get32(AUX_MU_LSR_REG) & 0x01) break;
        }

        character = _get32(AUX_MU_IO_REG);
        
        _put32(AUX_MU_CNTL_REG,2);  //disable reciever and enable transmitter

        while(1)
        {
            if(_get32(AUX_MU_LSR_REG) & 0x20) break;
        }

        _put32(AUX_MU_IO_REG,character);

        //wait till transmitted
        while(1)
        {
            if(_get32(AUX_MU_LSR_REG) & 0x20) break;
        }
    }
}