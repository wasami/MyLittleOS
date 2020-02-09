#include <stdio.h>
#include <stdint.h>
#include "../include/fifo.h"

static fifo_t fifo;

//Returns 1 if passed else 0
int fifo_write_test(fifo_t* f, void* dataToWrite, int nbytes) 
{
    int i;
    int bytes_written;
    char* byte;

    bytes_written = fifo_write(f, dataToWrite, nbytes);

    // print buffer;
    printf("Buffer content:\n");
    for ( i=0; i < f->size; i++ )
    {
        if( f->head == i )
            printf("[H]");

        if( f->tail == i)
            printf("[T]");

        printf("%c, ", f->buffer[i]);
    }

    if (bytes_written != nbytes)
        return 0;
    else
        return 1;
    
}

//Returns 1 if passed else 0
int fifo_read_test()
{
    return 0;
}

int main ()
{
    uint32_t int_value = 'a';
    char byte;

    // Initialise the fifo
    fifo_t* fifo_ptr = &fifo;
    fifo_init(fifo_ptr);

    byte = int_value;

    if( fifo_write_test(fifo_ptr, &byte, 1) )
    {
        printf("FIFO write test passed!");
    } else {
        printf("FIFO wirte test failed!");
    }

    // if( fifo_read_test(fifo) )
    // {

    // } else {

    // }
}