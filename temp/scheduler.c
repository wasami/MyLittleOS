/*
    Scheduler
*/

#include "../include/scheduler.h"

static process process_control_block[MAX_NUMBER_OF_PROCESS];

void contextSwitch()
{
    
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