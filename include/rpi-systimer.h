/*
    Part of the Raspberry-Pi Bare Metal Tutorials
    https://www.valvers.com/rpi/bare-metal/
    Copyright (c) 2013-2018, Brian Sidebotham

    This software is licensed under the MIT License.
    Please see the LICENSE file included with this software.

*/

#include <stdint.h>

#include "rpi-base.h"

#define RPI_SYSTIMER_BASE       ( PERIPHERAL_BASE + 0x3000 )

#define RPI_SYSTIMER_0_IRQ      (1 << 0)
#define RPI_SYSTIMER_1_IRQ      (1 << 1) 
#define RPI_SYSTIMER_2_IRQ      (1 << 2) 
#define RPI_SYSTIMER_3_IRQ      (1 << 3)       

#define QUARTER_OF_SECOND       250000
#define TENTH_OF_SECOND         100000


typedef struct {
    volatile uint32_t control_status;
    volatile uint32_t counter_lo;
    volatile uint32_t counter_hi;
    volatile uint32_t compare0;
    volatile uint32_t compare1;
    volatile uint32_t compare2;
    volatile uint32_t compare3;
    } rpi_sys_timer_t;


extern rpi_sys_timer_t* RPI_GetSystemTimer(void);
extern void RPI_WaitMicroSeconds( uint32_t us );
