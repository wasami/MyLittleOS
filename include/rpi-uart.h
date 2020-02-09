#ifndef RPI_UART_H
#define RPI_UART_H

#include "rpi-base.h"

/** The base address of the GPIO peripheral (ARM Physical Address) */
#define RPI_AUX_BASE       ( PERIPHERAL_BASE + 0x215000UL )
#define RPI_UART_BASE       ( PERIPHERAL_BASE + 0x215040UL )

typedef struct {
    rpi_reg_rw_t    AUX_MU_IO_REG;      //0x20215040
    rpi_reg_rw_t    AUX_MU_IER_REG;     //0x20215044
    rpi_reg_rw_t    AUX_MU_IIR_REG;
    rpi_reg_rw_t    AUX_MU_LCR_REG;
    rpi_reg_rw_t    AUX_MU_MCR_REG;
    rpi_reg_ro_t    AUX_MU_LSR_REG;
    rpi_reg_ro_t    AUX_MU_MSR_REG;
    rpi_reg_rw_t    AUX_MU_SCRATCH;
    rpi_reg_rw_t    AUX_MU_CNTL_REG;
    rpi_reg_ro_t    AUX_MU_STAT_REG;
    rpi_reg_rw_t    AUX_MU_BAUD_REG;    //215068
} rpi_uart_t;

typedef struct {
    rpi_reg_ro_t    AUX_IRQ;            //215000
    rpi_reg_rw_t    AUX_ENABLES;        //215004
} rpi_aux_t;


extern rpi_uart_t* RPI_GetMiniUart(void);
extern void RPI_UartInit(void);
extern rpi_aux_t* RPI_GetAux(void);
extern void RPI_MiniUartInit(void);
extern int RPI_WriteToMiniUart(char* string, int nbytes);
extern int RPI_ReadFromMiniUart(char* data, int nbytes);
extern void RPI_MiniUart_ISR(void);

#endif
