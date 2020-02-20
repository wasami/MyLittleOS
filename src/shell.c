#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "../include/fifo.h"
#include "../include/rpi-uart.h"

// Waits and listens to commands
int shell_main(void)
{
    static char command_not_found_text[] = "\nNo such command found.\r\n";
    static char enter_command_text[] = "Enter command (and end with ;): ";

    int i;
    rpi_uart_t* rpiMiniUart = RPI_GetMiniUart();

    char input[10];
    char* character;
    
    character = &input[0];

    // Always executing
    while (1)
    {
        RPI_printString(&enter_command_text[0]);

        // Poll MiniUART for characters
        for( i=0; i < 10; i++)
        {
            while ((rpiMiniUart->AUX_MU_LSR_REG & 1) == 0) {}

            *character = rpiMiniUart->AUX_MU_IO_REG;

            //Echo 
            rpiMiniUart->AUX_MU_IO_REG = *character;

            character++;
        }

        RPI_printString(&command_not_found_text[0]);
    }

    return 0;
}