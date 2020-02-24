/*
    Dummy programs to demonstrate scheduler
*/
#include "../include/print.h"

void dummy_a(void)
{
    while (1)
    {
        printChar('a');
    }
}

void dummy_print_string(void) 
{
    char string[] = "\r\nThis is a test.";
    printString(&string[0]);
}

// void dummy_b(void)
// {
//     char character = 'b';
//     uint32_t microSeconds = 1000000;
//     //print a
//     while (1)
//     {
//         RPI_WriteToMiniUart(character);
//         RPI_WaitMicroSeconds(microSeconds);
//     }
// }






