#include <stdint.h>

#define BLOCK_MAGIC	        0x424C4D43

typedef volatile uint32_t size_t;

typedef struct block_header {
    unsigned int magic;
    unsigned int size;
    struct block_header *next;
    unsigned char data[0];
} block_header;

typedef struct block_bucket {
    unsigned int size;
    struct block_header *free_header;
} block_bucket;

extern void* malloc(size_t size);