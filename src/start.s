/*
    Start Code
    
    Contains code executed after boot process is complete.
    Loads interupt vector to appropriate location in memory
    Continues to initialise stacks for different modes vefore jumping to cstartup code
 */
.section ".text.startup"

.global _start
.global _enable_interrupts
.global _jump_to_user_code
.global _test

// See ARM section A2.2 (Processor Modes)

.equ    CPSR_MODE_USER,         0x10
.equ    CPSR_MODE_FIQ,          0x11
.equ    CPSR_MODE_IRQ,          0x12
.equ    CPSR_MODE_SVR,          0x13
.equ    CPSR_MODE_ABORT,        0x17
.equ    CPSR_MODE_UNDEFINED,    0x1B
.equ    CPSR_MODE_SYSTEM,       0x1F

// See ARM section A2.5 (Program status registers)
.equ    CPSR_IRQ_INHIBIT,       0x80
.equ    CPSR_FIQ_INHIBIT,       0x40
.equ    CPSR_THUMB,             0x20

_start:
    ldr pc, _reset_h
    ldr pc, _undefined_instruction_vector_h
    ldr pc, _software_interrupt_vector_h
    ldr pc, _prefetch_abort_vector_h
    ldr pc, _data_abort_vector_h
    ldr pc, _unused_handler_h
    ldr pc, _interrupt_vector_h
    ldr pc, _fast_interrupt_vector_h

_reset_h:                           .word   _reset_
_undefined_instruction_vector_h:    .word   undefined_instruction_vector
_software_interrupt_vector_h:       .word   _svc_handler
_prefetch_abort_vector_h:           .word   prefetch_abort_vector
_data_abort_vector_h:               .word   data_abort_vector
_unused_handler_h:                  .word   _reset_
_interrupt_vector_h:                .word   interrupt_vector
_fast_interrupt_vector_h:           .word   fast_interrupt_vector

_reset_:
    // We enter execution in supervisor mode. For more information on
    // processor modes see ARM Section A2.2 (Processor Modes)
    mov     r0, #0x8000
    mov     r1, #0x0000
    ldmia   r0!,{r2, r3, r4, r5, r6, r7, r8, r9}
    stmia   r1!,{r2, r3, r4, r5, r6, r7, r8, r9}
    ldmia   r0!,{r2, r3, r4, r5, r6, r7, r8, r9}
    stmia   r1!,{r2, r3, r4, r5, r6, r7, r8, r9}

    // We're going to use interrupt mode, so setup the interrupt mode
    // stack pointer which differs to the application stack pointer
    mov     r0, #(CPSR_MODE_IRQ | CPSR_IRQ_INHIBIT | CPSR_FIQ_INHIBIT )
    msr     cpsr_c, r0
    mov     sp, #0x7000

    // Switch back to supervisor mode (our application mode) and
    // set the stack pointer towards the end of RAM. Remember that the
    // stack works its way down memory, our heap will work it's way
    // up memory toward the application stack.
    mov     r0, #(CPSR_MODE_SVR | CPSR_IRQ_INHIBIT | CPSR_FIQ_INHIBIT )
    msr     cpsr_c, r0
    mov     sp, #0x8000

    // Run the c startup function - should not return and will call kernel_main
    b       _cstartup

_inf_loop:
    b       _inf_loop


/*--TODO---------------------------------/*
    Function to get Stack pointer
    Parameters  :None
    Currupts    :R0
    Returns     :Stack Pointer in R0
 /*--------------------------------------*/


/*---------------------------------------/*
    Function to enable interrupts
    Parameters  :None
    Currupts    :R0
    Returns     :Nothing
 /*--------------------------------------*/
_enable_interrupts:
    mrs     r0, cpsr
    bic     r0, r0, #0x80
    msr     cpsr_c, r0
    mov     pc, lr


/*---------------------------------------/*
    Function to jump to code in user mode
    Parameters  :R0 points to instruction to jump to
    Currupts    :R1
    Returns     :None
 /*--------------------------------------*/
_jump_to_user_code:
    mov     r1, #(CPSR_MODE_USER)
    msr     spsr, r1
    movs    pc, r0      

_test:
    svc     0