#include "rpi-gpio.h"

/** GPIO Register set */
volatile unsigned int* gpio;

/** Simple loop variable */
volatile unsigned int tim;

volatile unsigned int ra;

/** Main function - we'll never return from here */
//int main(void) __attribute__((naked));
int main(void)
{
    /* Assign the address of the GPIO peripheral (Using ARM Physical Address) */
    gpio = (unsigned int*)GPIO_BASE;

    /* Write 1 to the GPIO16 init nibble in the Function Select 1 GPIO
       peripheral register to enable GPIO16 as an output */
    //gpio[LED_GPFSEL] |= (1 << LED_GPFBIT);

    ra = get32(LED_GPFSEL);
    ra |= (1 << LED_GPFBIT);
    put32(LED_GPFSEL, ra);

    /* Never exit as there is no OS to exit to! */
    while(1)
    {
        for(tim = 0; tim < 500000; tim++)
            ;

        /* Set the LED GPIO pin low ( Turn OK LED on for original Pi, and off
           for plus models )*/
        //gpio[LED_GPCLR] = (1 << LED_GPIO_BIT);

        put32(LED_GPCLR, (1 << LED_GPIO_BIT));

        for(tim = 0; tim < 500000; tim++)
            ;

        /* Set the LED GPIO pin high ( Turn OK LED off for original Pi, and on
           for plus models )*/
        //gpio[LED_GPSET] = (1 << LED_GPIO_BIT);

        put32(LED_GPSET, (1 << LED_GPIO_BIT));
    }
    return 0;
}