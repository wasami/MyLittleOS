// Context switch function
// Parameters   : R? (Pointer to location in memory)
// Corrupts	    : None all reg used are reserved
// Returns	    : None
_context_switch:
    STM     sp, {r0-lr}^            ; Dump user registers above R13
    MRS     r0, spsr                ; Pick up the user status
    STMDB   sp, {r0, lr}            ; and dump with return address below.
    LDR     sp, [r12], #4           ; Load next process info pointer.
    CMP     sp, #0                  ; If it is zero, it is invalid
    LDMDBNE sp, {r0, lr}            ; Pick up status and return address.
    MSRNE   spsr_c, r0              ; Restore the status.
    LDMNE   sp, {r0 - lr}^          ; Get the rest of the registers
    NOP
    SUBSNE pc, lr, #4               ; and return and restore CPSR.
                                    ; Insert "no next process code" here.


// Function to store registers R0-R13 in user mode
// Parameters   : 
// Corrupts     :
// Returns      : None
_store_user_registers:

    
