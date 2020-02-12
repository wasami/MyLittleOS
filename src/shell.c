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

    char* data;
    char* character;
    int bytes_read;
    int bytes_written;

    // Read one byte at a time
    bytes_read = RPI_ReadFromMiniUart(data, 1);

    character = data;

    // Always executing
    while (1)
    {
        RPI_printString(&enter_command_text[0], 32);

        // Keep reading till end of string
        while (*character++ != ';')
        {
            bytes_read += RPI_ReadFromMiniUart(character, 1);

            // If bytes read is 0 sleep
        }

        bytes_read = 0;     // Reset bytes read

        RPI_printString(&command_not_found_text[0], 25);

        //reset character pointer
        character = data;
    }

    return 0;
}