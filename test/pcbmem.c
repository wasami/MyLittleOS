#include <stdio.h>
#include <string.h>
#include "../include/process.h"
#include "../include/rpi-base.h"

int main(void)
{
    process newProc;
    process* ptr;
    uint32_t* tempPtr;
    char* charPtr;
    
    ptr = &newProc;
    tempPtr = (uint32_t*)ptr;
    charPtr = (char*)ptr;

    printf("Size of newProc is %lu\n", sizeof(process));

    ptr->flags = 1;
    ptr->regs.r0 = 2;
    ptr->regs.r1 = 3;
    ptr->regs.r2 = 4;
    ptr->regs.r3 = 5;
    ptr->regs.r4 = 6;
    ptr->regs.r5 = 7;
    ptr->regs.r6 = 8;
    ptr->regs.r7 = 9;
    ptr->regs.r8 = 10;
    ptr->regs.r9 = 11;
    ptr->regs.r10 = 12;
    ptr->regs.r11 = 13;
    ptr->regs.r12 = 14;
    ptr->sp = 15;
    ptr->lr = 16;
    ptr->pc = 17;

    printf("Pointer to process->flags: %p\n", tempPtr++);
    printf("Pointer to process->r0: %p\n", tempPtr++);
    printf("Pointer to process->r1: %p\n", tempPtr++);
    printf("Pointer to process->r2: %p\n", tempPtr++);
    printf("Pointer to process->r3: %p\n", tempPtr++);
    printf("Pointer to process->r4: %p\n", tempPtr++);
    printf("Pointer to process->r5: %p\n", tempPtr++);
    printf("Pointer to process->r6: %p\n", tempPtr++);
    printf("Pointer to process->r7: %p\n", tempPtr++);
    printf("Pointer to process->r8: %p\n", tempPtr++);
    printf("Pointer to process->r9: %p\n", tempPtr++);
    printf("Pointer to process->r10: %p\n", tempPtr++);
    printf("Pointer to process->r11: %p\n", tempPtr++);
    printf("Pointer to process->r12: %p\n", tempPtr++);
    printf("Pointer to process->sp: %p\n", tempPtr++);
    printf("Pointer to process->lr: %p\n", tempPtr++);
    printf("Pointer to process->pc: %p\n", tempPtr++);
    printf("Pointer to process->state: %p\n", tempPtr++);

    tempPtr = (uint32_t*)ptr;
    printf("process->flags: %u\n", *tempPtr);
    tempPtr += 16;
    printf("process->pc: %u\n", *tempPtr);
    charPtr += 16*4;
    printf("process->pc: %u\n", *charPtr);

    long unsigned int test = (long unsigned int)ptr;
    printf("Testing pointer to process->pc: %lu\n", test);
}