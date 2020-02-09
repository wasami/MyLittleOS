
typedef struct 
{
    char buffer[10];
    int head;
    int tail;
    int size;
} fifo_t;

extern void fifo_init(fifo_t* f);
extern int fifo_read(fifo_t* f, void* storage, int nbytes);
extern int fifo_write(fifo_t* f, const void* data, int nbytes);