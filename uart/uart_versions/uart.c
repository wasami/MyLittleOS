extern void put32 ( unsigned int, unsigned int );
extern unsigned int get32 ( unsigned int );
extern void dummy ( unsigned int );

#define GPIO_BASE   0x20200000UL

#define GPFSEL1     0x20200004
#define GPSET0      0x2020001C
#define GPCLR0      0x20200028
#define GPPUD       0x20200094
#define GPPUDCLK0   0x20200098

#define AUX_ENABLES     0x20215004
#define AUX_MU_IO_REG   0x20215040
#define AUX_MU_IER_REG  0x20215044
#define AUX_MU_IIR_REG  0x20215048
#define AUX_MU_LCR_REG  0x2021504C
#define AUX_MU_MCR_REG  0x20215050
#define AUX_MU_LSR_REG  0x20215054
#define AUX_MU_MSR_REG  0x20215058
#define AUX_MU_SCRATCH  0x2021505C
#define AUX_MU_CNTL_REG 0x20215060
#define AUX_MU_STAT_REG 0x20215064
#define AUX_MU_BAUD_REG 0x20215068

//GPIO14  TXD0 and TXD1
//GPIO15  RXD0 and RXD1
//alt function 5 for uart1
//alt function 0 for uart0

// baud rate
//((250,000,000/115200)/8)-1 = 270

volatile unsigned int ra;

/** Main function - we'll never return from here */
int main ( void )
{
    put32(AUX_ENABLES,1);                   //Enable mini uart (this also enables access to its registers)
    put32(AUX_MU_CNTL_REG,0);               //Disable auto flow control and disable receiver and transmitter (for now)
    put32(AUX_MU_IER_REG,0);                //Disable receive and transmit interrupts
    put32(AUX_MU_LCR_REG,3);                //Enable 8 bit mode
    put32(AUX_MU_MCR_REG,0);                //Set RTS line to be always high
    put32(AUX_MU_BAUD_REG,270);             //Set baud rate to 115200

    ra = get32(GPFSEL1);
    ra &= ~(7<<12); //gpio14
    ra |= 2<<12;    //alt5
    ra &= ~(7<<15);  // clean gpio15
    ra |= 2<<15;      // set alt5 for gpio 15
    put32(GPFSEL1,ra);

    put32(GPPUD,0);
    for(ra=0;ra<150;ra++) dummy(ra);
    put32(GPPUDCLK0,(1<<14)|(1<<15));
    for(ra=0;ra<150;ra++) dummy(ra);
    put32(GPPUDCLK0,0);

    put32(AUX_MU_CNTL_REG,3);               //Finally, enable transmitter and receiver


    ra = 0;
    while(1)
    {
        while(1)
        {
            if(get32(AUX_MU_LSR_REG) & 0x20) break;
        }
        put32(AUX_MU_IO_REG,0x30+(ra++&7));
    }

    return(0);
}