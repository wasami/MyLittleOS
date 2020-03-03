/* includes here */
#include "../include/malloc.h"

extern unsigned char _heap_low;      // Defined by linker
extern unsigned char _heap_low;      // Defined by linker

static unsigned char *next_block = &_heap_low;
static unsigned char *block_limit = &_heap_low;

static struct block_bucket s_block_bucket[] __attribute__((aligned(4))) = {{0x40}, {0x400}, {0x1000}, {0x2000}};

void* malloc(size_t size) {
    struct block_bucket *bucket;
    struct block_header *header;

    if(size == 0)
        return 0;
    
    for(bucket = s_block_bucket; bucket->size > 0; bucket++) 
    {
        if(size <= bucket->size) 
        {
            size = bucket->size;
            break;
        }
    }

    header = bucket->free_header;

    if( bucket->size > 0 && header != 0 )
    {
        bucket->free_header = header->next;
    } else {
        header = (struct block_header *) next_block;

        const size_t block_size = sizeof(struct block_header) + size;
        const size_t rounded_block_size = (block_size + (size_t) 15) & ~(size_t) 15;

        unsigned char* next = next_block + rounded_block_size;

        if(next > block_limit) {
            return 0;
        } else {
            next_block = next;
        }

        header->magic = BLOCK_MAGIC;
        header->size = (unsigned) size;
    }

    header->next = 0;
    return (void *)header->data;
}