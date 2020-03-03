.global _svc_handler

.equ    Num_Of_SVC,     2
.equ    Extract_SVC,    0xFF000000

_svc_handler:
    push	{r0-r12, lr}
	
	// Load the call instruction to determine SVC routine
	ldr		r0, [lr, #-4]
	bic		r0, r0, #Extract_SVC

	mov		r1, sp

    cmp		r0, #Num_Of_SVC			// Check if SVC entry is within range
	
	blle	SVC_Handler_Main
	pop		{r0-r12, lr}      // Restore registers and return.
	movs	pc, lr
    