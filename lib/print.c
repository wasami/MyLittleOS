#include "../include/rpi-uart.h"
#include "../include/rpi-systimer.h"
#include "../include/svc.h"

void printChar(char c)
{
    svc_zero();
}

void printString(char* string) 
{
    while (*string != '\0') 
    {
        printChar(*string++);
    }
}
