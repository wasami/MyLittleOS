.global _svc_handler
.global _svc_return

.equ    Num_Of_SVC,     2
.equ    Extract_SVC,    0xFF000000

_svc_handler:
    push	{r0-r12, lr}
	
	// Load the call instruction to determine SVC routine
	ldr		r14, [lr, #-4]
	bic		r14, r14, #Extract_SVC

    cmp		r14, #Num_Of_SVC			// Check if SVC entry is within range
	
	// Exploits the PC prefetch which points to table
	ldrle	pc, [pc, r14, lsl #2]	// Load PC with address of chosen SVC call
	b		_svc_return				// No

SVC_Jump_Table:
_svc_zero:	.word	svc_zero
_svc_one:	.word	svc_one


_svc_return:
    ldm         sp!, {r0-r12, pc}^      // Restore registers and return.