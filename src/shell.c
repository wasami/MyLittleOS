#include <string.h>
#include "../include/fifo.h"
#include "../include/rpi-uart.h"

static char test_cmd[] = {'T','e','s','t', 0};
static char test_success[] = {'S', 'u', 'c', 'c', 'e', 's', 's', 0};
static char test_fail[] = {'F', 'a', 'i', 'l', 'e', 'd', 0};

// Waits and listens to commands
int shell_main(void)
{
    char* data;
    char* character;
    int bytes_read;
    int bytes_written;

    // Read one byte at a time
    bytes_read = RPI_ReadFromMiniUart(data, 1);

    character = data;

    bytes_written = RPI_WriteToMiniUart(&test_cmd[0], 4);

    // Always executing
    while (1)
    {
        // Keep reading till end of string
        while (*character++ != ';')
        {
            bytes_read += RPI_ReadFromMiniUart(character, 1);

            // If bytes read is 0 sleep
        }

        bytes_read = 0;     // Reset bytes read

        if ( strcmp(data, &test_cmd[0]) == 0)
        {
            bytes_written = RPI_WriteToMiniUart(&test_success[0], 8);
        } else {
            bytes_written = RPI_WriteToMiniUart(&test_fail[0], 7);
        }
    }

    return 0;
}