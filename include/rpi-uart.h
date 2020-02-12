#ifndef RPI_UART_H
#define RPI_UART_H

#include "rpi-base.h"

/** The base address of the GPIO peripheral (ARM Physical Address) */
#define RPI_AUX_BASE       ( PERIPHERAL_BASE + 0x215000UL )
#define RPI_UART_BASE       ( PERIPHERAL_BASE + 0x215040UL )

#define AUX_ENA_MINIUART            ( 1 << 0 )
#define AUX_ENA_SPI1                ( 1 << 1 )
#define AUX_ENA_SPI2                ( 1 << 2 )

#define AUX_IRQ_SPI2                ( 1 << 2 )
#define AUX_IRQ_SPI1                ( 1 << 1 )
#define AUX_IRQ_MU                  ( 1 << 0 )

#define AUX_MULCR_8BIT_MODE         ( 3 << 0 )  /* See errata for this value */
#define AUX_MULCR_BREAK             ( 1 << 6 )
#define AUX_MULCR_DLAB_ACCESS       ( 1 << 7 )

#define AUX_MUMCR_RTS               ( 1 << 1 )

#define AUX_MULSR_DATA_READY        ( 1 << 0 )
#define AUX_MULSR_RX_OVERRUN        ( 1 << 1 )
#define AUX_MULSR_TX_EMPTY          ( 1 << 5 )
#define AUX_MULSR_TX_IDLE           ( 1 << 6 )

#define AUX_MUMSR_CTS               ( 1 << 5 )

#define AUX_MUCNTL_RX_ENABLE        ( 1 << 0 )
#define AUX_MUCNTL_TX_ENABLE        ( 1 << 1 )
#define AUX_MUCNTL_RTS_FLOW         ( 1 << 2 )
#define AUX_MUCNTL_CTS_FLOW         ( 1 << 3 )
#define AUX_MUCNTL_RTS_FIFO         ( 3 << 4 )
#define AUX_MUCNTL_RTS_ASSERT       ( 1 << 6 )
#define AUX_MUCNTL_CTS_ASSERT       ( 1 << 7 )

#define AUX_MUSTAT_SYMBOL_AV        ( 1 << 0 )
#define AUX_MUSTAT_SPACE_AV         ( 1 << 1 )
#define AUX_MUSTAT_RX_IDLE          ( 1 << 2 )
#define AUX_MUSTAT_TX_IDLE          ( 1 << 3 )
#define AUX_MUSTAT_RX_OVERRUN       ( 1 << 4 )
#define AUX_MUSTAT_TX_FIFO_FULL     ( 1 << 5 )
#define AUX_MUSTAT_RTS              ( 1 << 6 )
#define AUX_MUSTAT_CTS              ( 1 << 7 )
#define AUX_MUSTAT_TX_EMPTY         ( 1 << 8 )
#define AUX_MUSTAT_TX_DONE          ( 1 << 9 )
#define AUX_MUSTAT_RX_FIFO_LEVEL    ( 7 << 16 )
#define AUX_MUSTAT_TX_FIFO_LEVEL    ( 7 << 24 )

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


extern rpi_uart_t* RPI_GetMiniUart( void );
extern void RPI_UartInit( void );
extern rpi_aux_t* RPI_GetAux( void );
extern void RPI_MiniUartInit( void );
extern void RPI_WriteToMiniUart( char c );
extern int RPI_printString( char* string, int len );
extern int RPI_ReadFromMiniUart( char* data, int nbytes );
extern void RPI_MiniUart_ISR( void );

#endif
