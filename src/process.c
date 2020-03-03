/*
    Scheduler
*/

#include "../include/process.h"
#include "../include/malloc.h"

static process pcb[MAX_NUMBER_OF_PROCESS];
static process* current_running_proc = 0;

void createProcess(process* proc, void(*main)())
{
    int i;
    rpi_reg_rw_t* registers = (rpi_reg_rw_t*)&proc->regs;

    for( i=0; i < 13; i++ )
    {
        registers[i] = 0;
    }
    
    proc->pc = (uint32_t) main;
    proc->sp = (uint32_t) malloc((size_t) 0x400) + 0x400;
    proc->flags = 0x10;
    proc->state = PROCESS_READY;
}

void setRunningProcess(process* proc)
{
    current_running_proc = proc;
}

process* getRunningProcess()
{
    return current_running_proc;
}

process* getNextProcess()
{
    int i;
    process* procPtr = (process*)&pcb[0];

    for( i=0; i < MAX_NUMBER_OF_PROCESS; i++)
    {
        if (procPtr->state == PROCESS_READY)
        {
            break;
        }
        procPtr++;
    }
    return procPtr;
}

process* getAvailablePCB()
{
    int i;

    process* pcbPtr = (process*)&pcb[0];

    for( i=0; i < MAX_NUMBER_OF_PROCESS; i++)
    {
        if (pcbPtr->state == PROCESS_INACTIVE)
        {
            break;
        }
        pcbPtr++;
    }

    if( i>MAX_NUMBER_OF_PROCESS )
        return 0;

    return pcbPtr;
}