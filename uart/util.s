.globl _start
_start:
    mov sp,#0x8000
    bl main
hang: b hang

.globl put32
put32:
    str r1,[r0]
    bx lr

.globl get32
get32:
    ldr r0,[r0]
    bx lr
