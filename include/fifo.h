
typedef struct 
{
    char buffer[50];
    int head;
    int tail;
    int size = 50;
} fifo_t;

extern void fifo_init(fifo_t* f);
extern void fifo_read(fifo_t* f, void* storage);
extern void fifo_write(fifo_t* f, const void* data, int nbytes);