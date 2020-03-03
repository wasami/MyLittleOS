#include <stdint.h>
#include "../include/rpi-base.h"

#define MAX_NUMBER_OF_PROCESS   2
#define PROCESS_INACTIVE        0
#define PROCESS_RUNNING         1
#define PROCESS_READY           2
#define PROCESS_BLOCKED         3

#define yield() __asm("SVC #1")

typedef struct {
    rpi_reg_rw_t r0;
    rpi_reg_rw_t r1;
    rpi_reg_rw_t r2;
    rpi_reg_rw_t r3;
    rpi_reg_rw_t r4;
    rpi_reg_rw_t r5;
    rpi_reg_rw_t r6;
    rpi_reg_rw_t r7;
    rpi_reg_rw_t r8;
    rpi_reg_rw_t r9;
    rpi_reg_rw_t r10;
    rpi_reg_rw_t r11;
    rpi_reg_rw_t r12;
} registers;

typedef struct {
    rpi_reg_rw_t        flags;
    registers           regs;
    rpi_reg_rw_t        sp;
    rpi_reg_rw_t        lr;
    rpi_reg_rw_t        pc;
    volatile uint32_t   state;
} process;

extern void createProcess(process* proc, void(*main)());
extern void setRunningProcess(process* proc);
extern process* getRunningProcess(void);
extern process* getNextProcess(void);
extern process* getAvailablePCB(void);