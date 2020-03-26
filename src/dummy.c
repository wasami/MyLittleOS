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
    char strOne[] = "\r\nprocess one yadayada.";
    char strTwo[] = "\r\n one is lonely.";
    char strThree[] = "\r\none.";

    printString(&strOne[0]);

    yield();

    printString(&strThree[0]);

    yield();

    printString(&strTwo[0]);
    while (1)
    {
        yield();
    };
}

void dummy_process_two(void) 
{
    char stringOne[] = "\r\nprocess 2.";
    char stringTwo[] = "\r\ntwo ended.";
    char stringThree[] = "\r\nSomething from two.";
    
    printString(&stringOne[0]);

    yield();

    printString(&stringThree[0]);

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






