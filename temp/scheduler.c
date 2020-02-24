/*
    Scheduler
*/

#include "../include/scheduler.h"

static process process_control_block[MAX_NUMBER_OF_PROCESS];

void contextSwitch()
{
    
}

void createProcess(process* proc, void(*main)())
{
    int i;

    for( i=0; i < 13; i++ )
    {
        &(proc->regs)[i] = 0;
    }
    
    proc->pc = (uint32_t) main;
    //TO-DO: Assign memory
    //TO-DO: set flags
    proc->next = 0;
}

void schedule()
{
    int i, int nextProcIndex, int runningProcIndex;
    process* processTablePtr = &processes[0];

    for( i=0; i < MAX_NUMBER_OF_PROCESS; i++)
    {
        if (*processTablePtr->state == PROCESS_RUNNING)
        {
            runningProcIndex = i;
        }
        else if (*processTablePtr->state == PROCESS_READY)
        {
            nextProcIndex = i;
        }

        processTablePtr++;
    }
    
    contextSwitch(&processes[runningProcIndex], &process[nextProcIndex]);
}