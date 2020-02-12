/* includes here */
#include <stdint.h>

extern unsigned char __bss_start__;
extern unsigned char __bss_end__;

static unsigned char *next_block = &__bss_end__;
static unsigned char *block_limit = &__bss_start__;

struct block_header {
    unsigned int magic;
    unsigned int size;
    struct block_header *next;
    unsigned char data[0];
} PACKED;

struct block_bucket {
    unsigned int size;
    struct block_header *free_list;
};

static struct block_bucket s_block_bucket[] __attribute__((aligned(4))) = {{0x40}, {0x400}, {0x1000}, {0x4000}, {0x40000}, {0x80000}, {0}};

void *malloc(size_t size) {
    struct block_bucket *bucket;
    struct block_header *header;

    if (size == 0) {
        return NULL;
    }

    //round up size to nearest 8
    size += 7;
    size &= ~(7);
    
     
}