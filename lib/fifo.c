/*
    Code I got from https://blog.stratifylabs.co/device/2013-10-02-A-FIFO-Buffer-Implementation/

    Changed it a little to suit my needs.
*/

#include <stdint.h>
#include "../include/fifo.h"

void fifo_init(fifo_t* f)
{
    f->head = 0;
    f->tail = 0;
}

// Reads all bytes in FIFO
// Returns the number of bytes read
int fifo_read(fifo_t* f, void* storage)
{
    int i = 0;
    char* ptr;
    ptr = storage;

    // While there is any data available
    while ( f->tail != f->head )
    {
        *p++ = f->buffer[f->tail];      // Grab a byte from buffer and store it
        f->tail++;
        if ( f->tail == f->size )       // Cycle tail back for cyclic buffer
        {
            f->tail = 0;
        }
        i++;
    }

    return i;
}

// Writes nbytes to FIFO
// Returns the number of bytes written
int fifo_write(fifo_t* f, const void* data, int nbytes) 
{
    int i;
    const char* ptr;
    ptr = data;

    for ( i=0; i < nbytes; i++ ) 
    {
        // First check if there is space in FIFO
        if( (f->head + 1 == f->tail) || ( (f->head + 1 == f->size) && (f->tail == 0) )
        {
            return i; //no more room
        } else {
            f->buffer[f->head] = *ptr++;
            f->head++;  // increment the head
            if( f->head == f->size ){  // check for wrap-around
                f->head = 0;
            }
        }
    }

    return nbytes;
}
