/*
    Dummy programs to demonstrate scheduler
*/
#include "../include/print.h"
#include "../include/process.h"

void dummy_a(void)
{
    while (1)
    {
        printChar('a');
    }
}

void dummy_process_one(void) 
{
    char stringOne[] = "\r\nThis is from process 1.";
    char stringTwo[] = "\r\nProcess 1 ended.";

    printString(&stringOne[0]);

    yield();

    printString(&stringTwo[0]);
    while (1)
    {
        yield();
    };
}

void dummy_process_two(void) 
{
    char stringOne[] = "\r\nThis is from process 2.";
    char stringTwo[] = "\r\nProcess 2 ended.";
    
    printString(&stringOne[0]);

    yield();


    printString(&stringTwo[0]);
    while (1)
    {
        yield();
    };
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






