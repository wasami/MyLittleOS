.section ".text.startup"

.global _start
.global _get_stack_pointer
.global _put32
.global _get32

_start:
    // Set the stack pointer, which progresses downwards through memory
    ldr     sp, =0x8000

    // Run the c startup function - should not return and will call kernel_main
    b       _cstartup

_inf_loop:
    b       _inf_loop


_get_stack_pointer:
    // Return the stack pointer value
    str     sp, [sp]
    ldr     r0, [sp]

    // Return from the function
    mov     pc, lr

//function to store 32 bit value r1 to address in r0
_put32:
    str r1,[r0]
    bx lr

// function to get 32 bit value from address in r0
_get32:
    ldr r0,[r0]
    bx lr