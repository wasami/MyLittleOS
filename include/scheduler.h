#include <stdint.h>
#include "../include/rpi-base.h"

#define MAX_NUMBER_OF_PROCESS   2
#define PROCESS_RUNNING         0
#define PROCESS_READY           1
#define PROCESS_BLOCKED         2

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

typedef struct process_block {
    rpi_reg_rw_t regs[13];
    volatile uint32_t pc;
    volatile uint32_t psr;
    volatile uint32_t sp;
    volatile uint32_t state;
    volatile uint32_t time_lived;
    process_block* next_proc;
} process_block;

typedef struct {
    process proc;
    process* next;
} process_queue;

extern void contextSwitch();
extern void schedule();