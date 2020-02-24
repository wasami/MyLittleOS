#include <stdint.h>

#define svc_zero() __asm("SVC #0")

extern void SVC_Handler_Main(unsigned int number, unsigned int *svc_args );