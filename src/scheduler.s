.global _context_switch
.global _start_user_process

// Context switch function
// Parameters   : r0(pointer to pcb of current process), r1(pointer to pcb of next process), r2(pointer to user registers on stack)
// Corrupts	    : None all reg used are reserved
// Returns	    : None
_context_switch:
    mrs     r3, spsr
    str     r3, [r0], #4
    push    {r0-r1}             // Store on stack    
    mov     lr, r2              // Set lr to contain pointer to user registers on stack
    ldm     lr!, {r0-r12}       // Load user registers
    push    {lr}                  // Store pointer to user pc
    ldr     lr, [sp, #4]        // Load pointer to pcb of current running process
    stmia   lr, {r0-lr}^       // Store user registers to pcb
    add     lr, lr, #(4*15)
    ldr     r0, [sp]           // get pointer to user pc
    ldr     r1, [r0]
    str     r1, [lr]

    // Now load next process context
    ldr     lr, [sp, #8]
    ldr     r0, [lr], #4              // Load spsr
    msr     spsr_c, r0            // restore new process status
    ldmia   lr, {r0-lr}^
    add     lr, lr, #(4*15)
    ldr     sp, [sp]            // sp now pointing to lr value pushed from beginning svc call
    add     sp, sp, #4          // sp now points to where it was originally be svc call
    ldr     lr, [lr]            // Load pc of next process
    movs    pc, lr


// Function to start user process
// Parameters   : r0(pointer to pcb of process)
// Corrupts	    : None all reg used are reserved
// Returns	    : None
_start_user_process:
    mov     lr, r0
    ldr     r0, [lr], #4        // load process spsr
    msr     spsr_c, r0          // store the user process status
    ldmia   lr, {r0-lr}^
    add     lr, lr, #(4*15)     // Set lr to point to user pc
    ldr     lr, [lr]            // Load pc of next process
    movs    pc, lr