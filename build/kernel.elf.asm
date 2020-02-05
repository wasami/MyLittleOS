
kernel.elf:     file format elf32-littlearm


Disassembly of section .text:

00008000 <_start>:
    8000:	e59ff018 	ldr	pc, [pc, #24]	; 8020 <_reset_h>
    8004:	e59ff018 	ldr	pc, [pc, #24]	; 8024 <_undefined_instruction_vector_h>
    8008:	e59ff018 	ldr	pc, [pc, #24]	; 8028 <_software_interrupt_vector_h>
    800c:	e59ff018 	ldr	pc, [pc, #24]	; 802c <_prefetch_abort_vector_h>
    8010:	e59ff018 	ldr	pc, [pc, #24]	; 8030 <_data_abort_vector_h>
    8014:	e59ff018 	ldr	pc, [pc, #24]	; 8034 <_unused_handler_h>
    8018:	e59ff018 	ldr	pc, [pc, #24]	; 8038 <_interrupt_vector_h>
    801c:	e59ff018 	ldr	pc, [pc, #24]	; 803c <_fast_interrupt_vector_h>

00008020 <_reset_h>:
    8020:	00008040 	andeq	r8, r0, r0, asr #32

00008024 <_undefined_instruction_vector_h>:
    8024:	00008178 	andeq	r8, r0, r8, ror r1

00008028 <_software_interrupt_vector_h>:
    8028:	00008184 	andeq	r8, r0, r4, lsl #3

0000802c <_prefetch_abort_vector_h>:
    802c:	00008190 	muleq	r0, r0, r1

00008030 <_data_abort_vector_h>:
    8030:	000081a8 	andeq	r8, r0, r8, lsr #3

00008034 <_unused_handler_h>:
    8034:	00008040 	andeq	r8, r0, r0, asr #32

00008038 <_interrupt_vector_h>:
    8038:	000081c0 	andeq	r8, r0, r0, asr #3

0000803c <_fast_interrupt_vector_h>:
    803c:	00008214 	andeq	r8, r0, r4, lsl r2

00008040 <_reset_>:
    8040:	e3a00902 	mov	r0, #32768	; 0x8000
    8044:	e3a01000 	mov	r1, #0
    8048:	e8b003fc 	ldm	r0!, {r2, r3, r4, r5, r6, r7, r8, r9}
    804c:	e8a103fc 	stmia	r1!, {r2, r3, r4, r5, r6, r7, r8, r9}
    8050:	e8b003fc 	ldm	r0!, {r2, r3, r4, r5, r6, r7, r8, r9}
    8054:	e8a103fc 	stmia	r1!, {r2, r3, r4, r5, r6, r7, r8, r9}
    8058:	e3a000d2 	mov	r0, #210	; 0xd2
    805c:	e121f000 	msr	CPSR_c, r0
    8060:	e3a0d63f 	mov	sp, #66060288	; 0x3f00000
    8064:	e3a000d3 	mov	r0, #211	; 0xd3
    8068:	e121f000 	msr	CPSR_c, r0
    806c:	e3a0d902 	mov	sp, #32768	; 0x8000
    8070:	ea000007 	b	8094 <_cstartup>

00008074 <_inf_loop>:
    8074:	eafffffe 	b	8074 <_inf_loop>

00008078 <_get_stack_pointer>:
    8078:	e58dd000 	str	sp, [sp]
    807c:	e59d0000 	ldr	r0, [sp]
    8080:	e1a0f00e 	mov	pc, lr

00008084 <_enable_interrupts>:
    8084:	e10f0000 	mrs	r0, CPSR
    8088:	e3c00080 	bic	r0, r0, #128	; 0x80
    808c:	e121f000 	msr	CPSR_c, r0
    8090:	e1a0f00e 	mov	pc, lr

00008094 <_cstartup>:
    8094:	e92d4800 	push	{fp, lr}
    8098:	e28db004 	add	fp, sp, #4
    809c:	e24dd018 	sub	sp, sp, #24
    80a0:	e50b0010 	str	r0, [fp, #-16]
    80a4:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    80a8:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    80ac:	e59f3044 	ldr	r3, [pc, #68]	; 80f8 <_cstartup+0x64>
    80b0:	e50b3008 	str	r3, [fp, #-8]
    80b4:	e59f3040 	ldr	r3, [pc, #64]	; 80fc <_cstartup+0x68>
    80b8:	e50b300c 	str	r3, [fp, #-12]
    80bc:	ea000004 	b	80d4 <_cstartup+0x40>
    80c0:	e51b3008 	ldr	r3, [fp, #-8]
    80c4:	e2832004 	add	r2, r3, #4
    80c8:	e50b2008 	str	r2, [fp, #-8]
    80cc:	e3a02000 	mov	r2, #0
    80d0:	e5832000 	str	r2, [r3]
    80d4:	e51b2008 	ldr	r2, [fp, #-8]
    80d8:	e51b300c 	ldr	r3, [fp, #-12]
    80dc:	e1520003 	cmp	r2, r3
    80e0:	3afffff6 	bcc	80c0 <_cstartup+0x2c>
    80e4:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    80e8:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
    80ec:	e51b0010 	ldr	r0, [fp, #-16]
    80f0:	eb000063 	bl	8284 <kernel_main>
    80f4:	eafffffe 	b	80f4 <_cstartup+0x60>
    80f8:	00008444 	andeq	r8, r0, r4, asr #8
    80fc:	00008448 	andeq	r8, r0, r8, asr #8

00008100 <RPI_GetGpio>:
    8100:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8104:	e28db000 	add	fp, sp, #0
    8108:	e59f3010 	ldr	r3, [pc, #16]	; 8120 <RPI_GetGpio+0x20>
    810c:	e5933000 	ldr	r3, [r3]
    8110:	e1a00003 	mov	r0, r3
    8114:	e28bd000 	add	sp, fp, #0
    8118:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    811c:	e12fff1e 	bx	lr
    8120:	00008434 	andeq	r8, r0, r4, lsr r4

00008124 <RPI_GpioInit>:
    8124:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8128:	e28db000 	add	fp, sp, #0
    812c:	e320f000 	nop	{0}
    8130:	e28bd000 	add	sp, fp, #0
    8134:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8138:	e12fff1e 	bx	lr

0000813c <RPI_GetIrqController>:
    813c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8140:	e28db000 	add	fp, sp, #0
    8144:	e59f3010 	ldr	r3, [pc, #16]	; 815c <RPI_GetIrqController+0x20>
    8148:	e5933000 	ldr	r3, [r3]
    814c:	e1a00003 	mov	r0, r3
    8150:	e28bd000 	add	sp, fp, #0
    8154:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8158:	e12fff1e 	bx	lr
    815c:	00008438 	andeq	r8, r0, r8, lsr r4

00008160 <reset_vector>:
    8160:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8164:	e28db000 	add	fp, sp, #0
    8168:	e320f000 	nop	{0}
    816c:	e28bd000 	add	sp, fp, #0
    8170:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8174:	e25ef004 	subs	pc, lr, #4

00008178 <undefined_instruction_vector>:
    8178:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    817c:	e28db000 	add	fp, sp, #0
    8180:	eafffffe 	b	8180 <undefined_instruction_vector+0x8>

00008184 <software_interrupt_vector>:
    8184:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8188:	e28db000 	add	fp, sp, #0
    818c:	eafffffe 	b	818c <software_interrupt_vector+0x8>

00008190 <prefetch_abort_vector>:
    8190:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8194:	e28db000 	add	fp, sp, #0
    8198:	e320f000 	nop	{0}
    819c:	e28bd000 	add	sp, fp, #0
    81a0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    81a4:	e25ef004 	subs	pc, lr, #4

000081a8 <data_abort_vector>:
    81a8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    81ac:	e28db000 	add	fp, sp, #0
    81b0:	e320f000 	nop	{0}
    81b4:	e28bd000 	add	sp, fp, #0
    81b8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    81bc:	e25ef004 	subs	pc, lr, #4

000081c0 <interrupt_vector>:
    81c0:	e24ee004 	sub	lr, lr, #4
    81c4:	e92d580f 	push	{r0, r1, r2, r3, fp, ip, lr}
    81c8:	e28db018 	add	fp, sp, #24
    81cc:	e24dd00c 	sub	sp, sp, #12
    81d0:	eb00001c 	bl	8248 <RPI_GetMiniUart>
    81d4:	e1a03000 	mov	r3, r0
    81d8:	e5933008 	ldr	r3, [r3, #8]
    81dc:	e2033004 	and	r3, r3, #4
    81e0:	e3530000 	cmp	r3, #0
    81e4:	0a000007 	beq	8208 <interrupt_vector+0x48>
    81e8:	eb000016 	bl	8248 <RPI_GetMiniUart>
    81ec:	e1a03000 	mov	r3, r0
    81f0:	e5933000 	ldr	r3, [r3]
    81f4:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    81f8:	eb000012 	bl	8248 <RPI_GetMiniUart>
    81fc:	e1a02000 	mov	r2, r0
    8200:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    8204:	e5823000 	str	r3, [r2]
    8208:	e320f000 	nop	{0}
    820c:	e24bd018 	sub	sp, fp, #24
    8210:	e8fd980f 	ldm	sp!, {r0, r1, r2, r3, fp, ip, pc}^

00008214 <fast_interrupt_vector>:
    8214:	e24db004 	sub	fp, sp, #4
    8218:	e320f000 	nop	{0}
    821c:	e28bd004 	add	sp, fp, #4
    8220:	e25ef004 	subs	pc, lr, #4

00008224 <RPI_GetAux>:
    8224:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8228:	e28db000 	add	fp, sp, #0
    822c:	e59f3010 	ldr	r3, [pc, #16]	; 8244 <RPI_GetAux+0x20>
    8230:	e5933000 	ldr	r3, [r3]
    8234:	e1a00003 	mov	r0, r3
    8238:	e28bd000 	add	sp, fp, #0
    823c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8240:	e12fff1e 	bx	lr
    8244:	0000843c 	andeq	r8, r0, ip, lsr r4

00008248 <RPI_GetMiniUart>:
    8248:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    824c:	e28db000 	add	fp, sp, #0
    8250:	e59f3010 	ldr	r3, [pc, #16]	; 8268 <RPI_GetMiniUart+0x20>
    8254:	e5933000 	ldr	r3, [r3]
    8258:	e1a00003 	mov	r0, r3
    825c:	e28bd000 	add	sp, fp, #0
    8260:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8264:	e12fff1e 	bx	lr
    8268:	00008440 	andeq	r8, r0, r0, asr #8

0000826c <RPI_UartInit>:
    826c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8270:	e28db000 	add	fp, sp, #0
    8274:	e320f000 	nop	{0}
    8278:	e28bd000 	add	sp, fp, #0
    827c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8280:	e12fff1e 	bx	lr

00008284 <kernel_main>:
    8284:	e92d4800 	push	{fp, lr}
    8288:	e28db004 	add	fp, sp, #4
    828c:	e24dd018 	sub	sp, sp, #24
    8290:	e50b0010 	str	r0, [fp, #-16]
    8294:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    8298:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    829c:	ebffffe9 	bl	8248 <RPI_GetMiniUart>
    82a0:	e50b0008 	str	r0, [fp, #-8]
    82a4:	ebffff95 	bl	8100 <RPI_GetGpio>
    82a8:	e50b000c 	str	r0, [fp, #-12]
    82ac:	ebffffdc 	bl	8224 <RPI_GetAux>
    82b0:	e1a03000 	mov	r3, r0
    82b4:	e5932004 	ldr	r2, [r3, #4]
    82b8:	e3822001 	orr	r2, r2, #1
    82bc:	e5832004 	str	r2, [r3, #4]
    82c0:	e51b3008 	ldr	r3, [fp, #-8]
    82c4:	e3a02000 	mov	r2, #0
    82c8:	e5832020 	str	r2, [r3, #32]
    82cc:	e51b3008 	ldr	r3, [fp, #-8]
    82d0:	e3a02000 	mov	r2, #0
    82d4:	e5832004 	str	r2, [r3, #4]
    82d8:	e51b3008 	ldr	r3, [fp, #-8]
    82dc:	e3a02003 	mov	r2, #3
    82e0:	e583200c 	str	r2, [r3, #12]
    82e4:	e51b3008 	ldr	r3, [fp, #-8]
    82e8:	e3a02000 	mov	r2, #0
    82ec:	e5832010 	str	r2, [r3, #16]
    82f0:	e51b3008 	ldr	r3, [fp, #-8]
    82f4:	e59f2130 	ldr	r2, [pc, #304]	; 842c <kernel_main+0x1a8>
    82f8:	e5832028 	str	r2, [r3, #40]	; 0x28
    82fc:	e51b300c 	ldr	r3, [fp, #-12]
    8300:	e5933004 	ldr	r3, [r3, #4]
    8304:	e59f2124 	ldr	r2, [pc, #292]	; 8430 <kernel_main+0x1ac>
    8308:	e5823000 	str	r3, [r2]
    830c:	e59f311c 	ldr	r3, [pc, #284]	; 8430 <kernel_main+0x1ac>
    8310:	e5933000 	ldr	r3, [r3]
    8314:	e3c33a07 	bic	r3, r3, #28672	; 0x7000
    8318:	e59f2110 	ldr	r2, [pc, #272]	; 8430 <kernel_main+0x1ac>
    831c:	e5823000 	str	r3, [r2]
    8320:	e59f3108 	ldr	r3, [pc, #264]	; 8430 <kernel_main+0x1ac>
    8324:	e5933000 	ldr	r3, [r3]
    8328:	e3833a02 	orr	r3, r3, #8192	; 0x2000
    832c:	e59f20fc 	ldr	r2, [pc, #252]	; 8430 <kernel_main+0x1ac>
    8330:	e5823000 	str	r3, [r2]
    8334:	e59f30f4 	ldr	r3, [pc, #244]	; 8430 <kernel_main+0x1ac>
    8338:	e5933000 	ldr	r3, [r3]
    833c:	e3c3390e 	bic	r3, r3, #229376	; 0x38000
    8340:	e59f20e8 	ldr	r2, [pc, #232]	; 8430 <kernel_main+0x1ac>
    8344:	e5823000 	str	r3, [r2]
    8348:	e59f30e0 	ldr	r3, [pc, #224]	; 8430 <kernel_main+0x1ac>
    834c:	e5933000 	ldr	r3, [r3]
    8350:	e3833801 	orr	r3, r3, #65536	; 0x10000
    8354:	e59f20d4 	ldr	r2, [pc, #212]	; 8430 <kernel_main+0x1ac>
    8358:	e5823000 	str	r3, [r2]
    835c:	e59f30cc 	ldr	r3, [pc, #204]	; 8430 <kernel_main+0x1ac>
    8360:	e5932000 	ldr	r2, [r3]
    8364:	e51b300c 	ldr	r3, [fp, #-12]
    8368:	e5832004 	str	r2, [r3, #4]
    836c:	e51b300c 	ldr	r3, [fp, #-12]
    8370:	e3a02000 	mov	r2, #0
    8374:	e5832094 	str	r2, [r3, #148]	; 0x94
    8378:	e59f30b0 	ldr	r3, [pc, #176]	; 8430 <kernel_main+0x1ac>
    837c:	e3a02000 	mov	r2, #0
    8380:	e5832000 	str	r2, [r3]
    8384:	ea000004 	b	839c <kernel_main+0x118>
    8388:	e59f30a0 	ldr	r3, [pc, #160]	; 8430 <kernel_main+0x1ac>
    838c:	e5933000 	ldr	r3, [r3]
    8390:	e2833001 	add	r3, r3, #1
    8394:	e59f2094 	ldr	r2, [pc, #148]	; 8430 <kernel_main+0x1ac>
    8398:	e5823000 	str	r3, [r2]
    839c:	e59f308c 	ldr	r3, [pc, #140]	; 8430 <kernel_main+0x1ac>
    83a0:	e5933000 	ldr	r3, [r3]
    83a4:	e3530095 	cmp	r3, #149	; 0x95
    83a8:	9afffff6 	bls	8388 <kernel_main+0x104>
    83ac:	e51b300c 	ldr	r3, [fp, #-12]
    83b0:	e3a02903 	mov	r2, #49152	; 0xc000
    83b4:	e5832098 	str	r2, [r3, #152]	; 0x98
    83b8:	e59f3070 	ldr	r3, [pc, #112]	; 8430 <kernel_main+0x1ac>
    83bc:	e3a02000 	mov	r2, #0
    83c0:	e5832000 	str	r2, [r3]
    83c4:	ea000004 	b	83dc <kernel_main+0x158>
    83c8:	e59f3060 	ldr	r3, [pc, #96]	; 8430 <kernel_main+0x1ac>
    83cc:	e5933000 	ldr	r3, [r3]
    83d0:	e2833001 	add	r3, r3, #1
    83d4:	e59f2054 	ldr	r2, [pc, #84]	; 8430 <kernel_main+0x1ac>
    83d8:	e5823000 	str	r3, [r2]
    83dc:	e59f304c 	ldr	r3, [pc, #76]	; 8430 <kernel_main+0x1ac>
    83e0:	e5933000 	ldr	r3, [r3]
    83e4:	e3530095 	cmp	r3, #149	; 0x95
    83e8:	9afffff6 	bls	83c8 <kernel_main+0x144>
    83ec:	e51b300c 	ldr	r3, [fp, #-12]
    83f0:	e3a02000 	mov	r2, #0
    83f4:	e5832098 	str	r2, [r3, #152]	; 0x98
    83f8:	e51b3008 	ldr	r3, [fp, #-8]
    83fc:	e3a02002 	mov	r2, #2
    8400:	e5832004 	str	r2, [r3, #4]
    8404:	ebffff4c 	bl	813c <RPI_GetIrqController>
    8408:	e1a03000 	mov	r3, r0
    840c:	e5932010 	ldr	r2, [r3, #16]
    8410:	e3822202 	orr	r2, r2, #536870912	; 0x20000000
    8414:	e5832010 	str	r2, [r3, #16]
    8418:	ebffff19 	bl	8084 <_enable_interrupts>
    841c:	e51b3008 	ldr	r3, [fp, #-8]
    8420:	e3a02003 	mov	r2, #3
    8424:	e5832020 	str	r2, [r3, #32]
    8428:	eafffffe 	b	8428 <kernel_main+0x1a4>
    842c:	0000010e 	andeq	r0, r0, lr, lsl #2
    8430:	00008444 	andeq	r8, r0, r4, asr #8

Disassembly of section .data:

00008434 <__data_start>:
    8434:	20200000 	eorcs	r0, r0, r0

00008438 <rpiIRQController>:
    8438:	2000b200 	andcs	fp, r0, r0, lsl #4

0000843c <rpiAux>:
    843c:	20215000 	eorcs	r5, r1, r0

00008440 <rpiMiniUart>:
    8440:	20215040 	eorcs	r5, r1, r0, asr #32

Disassembly of section .bss:

00008444 <__bss_start>:
    8444:	00000000 	andeq	r0, r0, r0

Disassembly of section .comment:

00000000 <_stack-0x80000>:
   0:	3a434347 	bcc	10d0d24 <_stack+0x1050d24>
   4:	35312820 	ldrcc	r2, [r1, #-2080]!	; 0xfffff7e0
   8:	332e363a 			; <UNDEFINED> instruction: 0x332e363a
   c:	732b312e 			; <UNDEFINED> instruction: 0x732b312e
  10:	35326e76 	ldrcc	r6, [r2, #-3702]!	; 0xfffff18a
  14:	39333033 	ldmdbcc	r3!, {r0, r1, r4, r5, ip, sp}
  18:	7562312d 	strbvc	r3, [r2, #-301]!	; 0xfffffed3
  1c:	31646c69 	cmncc	r4, r9, ror #24
  20:	2e362029 	cdpcs	0, 3, cr2, cr6, cr9, {1}
  24:	20312e33 	eorscs	r2, r1, r3, lsr lr
  28:	37313032 			; <UNDEFINED> instruction: 0x37313032
  2c:	30323630 	eorscc	r3, r2, r0, lsr r6
	...

Disassembly of section .debug_aranges:

00000000 <.debug_aranges>:
   0:	0000001c 	andeq	r0, r0, ip, lsl r0
   4:	00000002 	andeq	r0, r0, r2
   8:	00040000 	andeq	r0, r4, r0
   c:	00000000 	andeq	r0, r0, r0
  10:	00008094 	muleq	r0, r4, r0
  14:	0000006c 	andeq	r0, r0, ip, rrx
	...
  20:	0000001c 	andeq	r0, r0, ip, lsl r0
  24:	00a50002 	adceq	r0, r5, r2
  28:	00040000 	andeq	r0, r4, r0
  2c:	00000000 	andeq	r0, r0, r0
  30:	00008100 	andeq	r8, r0, r0, lsl #2
  34:	0000003c 	andeq	r0, r0, ip, lsr r0
	...
  40:	0000001c 	andeq	r0, r0, ip, lsl r0
  44:	038b0002 	orreq	r0, fp, #2
  48:	00040000 	andeq	r0, r4, r0
  4c:	00000000 	andeq	r0, r0, r0
  50:	0000813c 	andeq	r8, r0, ip, lsr r1
  54:	000000e8 	andeq	r0, r0, r8, ror #1
	...
  60:	0000001c 	andeq	r0, r0, ip, lsl r0
  64:	05500002 	ldrbeq	r0, [r0, #-2]
  68:	00040000 	andeq	r0, r4, r0
  6c:	00000000 	andeq	r0, r0, r0
  70:	00008224 	andeq	r8, r0, r4, lsr #4
  74:	00000060 	andeq	r0, r0, r0, rrx
	...
  80:	0000001c 	andeq	r0, r0, ip, lsl r0
  84:	071b0002 	ldreq	r0, [fp, -r2]
  88:	00040000 	andeq	r0, r4, r0
  8c:	00000000 	andeq	r0, r0, r0
  90:	00008284 	andeq	r8, r0, r4, lsl #5
  94:	000001b0 			; <UNDEFINED> instruction: 0x000001b0
	...
  a0:	0000001c 	andeq	r0, r0, ip, lsl r0
  a4:	0ad70002 	beq	ff5c00b4 <_stack+0xff5400b4>
  a8:	00040000 	andeq	r0, r4, r0
  ac:	00000000 	andeq	r0, r0, r0
  b0:	00008000 	andeq	r8, r0, r0
  b4:	00000094 	muleq	r0, r4, r0
	...

Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	000000a1 	andeq	r0, r0, r1, lsr #1
   4:	00000004 	andeq	r0, r0, r4
   8:	01040000 	mrseq	r0, (UNDEF: 4)
   c:	00000044 	andeq	r0, r0, r4, asr #32
  10:	00000c0c 	andeq	r0, r0, ip, lsl #24
  14:	00809400 	addeq	r9, r0, r0, lsl #8
  18:	00006c00 	andeq	r6, r0, r0, lsl #24
  1c:	00000000 	andeq	r0, r0, r0
  20:	00a80200 	adceq	r0, r8, r0, lsl #4
  24:	01010000 	mrseq	r0, (UNDEF: 1)
  28:	0000002c 	andeq	r0, r0, ip, lsr #32
  2c:	69050403 	stmdbvs	r5, {r0, r1, sl}
  30:	0200746e 	andeq	r7, r0, #1845493760	; 0x6e000000
  34:	00000000 	andeq	r0, r0, r0
  38:	002c0201 	eoreq	r0, ip, r1, lsl #4
  3c:	3a040000 	bcc	100044 <_stack+0x80044>
  40:	01000000 	mrseq	r0, (UNDEF: 0)
  44:	00809406 	addeq	r9, r0, r6, lsl #8
  48:	00006c00 	andeq	r6, r0, r0, lsl #24
  4c:	979c0100 	ldrls	r0, [ip, r0, lsl #2]
  50:	05000000 	streq	r0, [r0, #-0]
  54:	01003072 	tsteq	r0, r2, ror r0
  58:	00009706 	andeq	r9, r0, r6, lsl #14
  5c:	6c910200 	lfmvs	f0, 4, [r1], {0}
  60:	00317205 	eorseq	r7, r1, r5, lsl #4
  64:	00970601 	addseq	r0, r7, r1, lsl #12
  68:	91020000 	mrsls	r0, (UNDEF: 2)
  6c:	32720568 	rsbscc	r0, r2, #104, 10	; 0x1a000000
  70:	97060100 	strls	r0, [r6, -r0, lsl #2]
  74:	02000000 	andeq	r0, r0, #0
  78:	62066491 	andvs	r6, r6, #-1862270976	; 0x91000000
  7c:	01007373 	tsteq	r0, r3, ror r3
  80:	00009e09 	andeq	r9, r0, r9, lsl #28
  84:	74910200 	ldrvc	r0, [r1], #512	; 0x200
  88:	0000a007 	andeq	sl, r0, r7
  8c:	9e0a0100 	adflse	f0, f2, f0
  90:	02000000 	andeq	r0, r0, #0
  94:	08007091 	stmdaeq	r0, {r0, r4, r7, ip, sp, lr}
  98:	01e20704 	mvneq	r0, r4, lsl #14
  9c:	04090000 	streq	r0, [r9], #-0
  a0:	0000002c 	andeq	r0, r0, ip, lsr #32
  a4:	0002e200 	andeq	lr, r2, r0, lsl #4
  a8:	89000400 	stmdbhi	r0, {sl}
  ac:	04000000 	streq	r0, [r0], #-0
  b0:	00004401 	andeq	r4, r0, r1, lsl #8
  b4:	025e0c00 	subseq	r0, lr, #0, 24
  b8:	81000000 	mrshi	r0, (UNDEF: 0)
  bc:	003c0000 	eorseq	r0, ip, r0
  c0:	00680000 	rsbeq	r0, r8, r0
  c4:	01020000 	mrseq	r0, (UNDEF: 2)
  c8:	0001cc06 	andeq	ip, r1, r6, lsl #24
  cc:	08010200 	stmdaeq	r1, {r9}
  d0:	000001ca 	andeq	r0, r0, sl, asr #3
  d4:	fb050202 	blx	1408e6 <_stack+0xc08e6>
  d8:	02000000 	andeq	r0, r0, #0
  dc:	02370702 	eorseq	r0, r7, #524288	; 0x80000
  e0:	04020000 	streq	r0, [r2], #-0
  e4:	00019f05 	andeq	r9, r1, r5, lsl #30
  e8:	01260300 			; <UNDEFINED> instruction: 0x01260300
  ec:	41020000 	mrsmi	r0, (UNDEF: 2)
  f0:	0000004f 	andeq	r0, r0, pc, asr #32
  f4:	dd070402 	cfstrsle	mvf0, [r7, #-8]
  f8:	02000001 	andeq	r0, r0, #1
  fc:	019a0508 	orrseq	r0, sl, r8, lsl #10
 100:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
 104:	0001d807 	andeq	sp, r1, r7, lsl #16
 108:	05040400 	streq	r0, [r4, #-1024]	; 0xfffffc00
 10c:	00746e69 	rsbseq	r6, r4, r9, ror #28
 110:	e2070402 	and	r0, r7, #33554432	; 0x2000000
 114:	03000001 	movweq	r0, #1
 118:	00000128 	andeq	r0, r0, r8, lsr #2
 11c:	00443003 	subeq	r3, r4, r3
 120:	72050000 	andvc	r0, r5, #0
 124:	06000000 	streq	r0, [r0], -r0
 128:	0000007d 	andeq	r0, r0, sp, ror r0
 12c:	00025103 	andeq	r5, r2, r3, lsl #2
 130:	7d120400 	cfldrsvc	mvf0, [r2, #-0]
 134:	03000000 	movweq	r0, #0
 138:	000001f6 	strdeq	r0, [r0], -r6
 13c:	00821304 	addeq	r1, r2, r4, lsl #6
 140:	c0030000 	andgt	r0, r3, r0
 144:	04000002 	streq	r0, [r0], #-2
 148:	00007d14 	andeq	r7, r0, r4, lsl sp
 14c:	05a40700 	streq	r0, [r4, #1792]!	; 0x700
 150:	00029d45 	andeq	r9, r2, r5, asr #26
 154:	00c40800 	sbceq	r0, r4, r0, lsl #16
 158:	46050000 	strmi	r0, [r5], -r0
 15c:	00000087 	andeq	r0, r0, r7, lsl #1
 160:	00cc0800 	sbceq	r0, ip, r0, lsl #16
 164:	47050000 	strmi	r0, [r5, -r0]
 168:	00000087 	andeq	r0, r0, r7, lsl #1
 16c:	00d40804 	sbcseq	r0, r4, r4, lsl #16
 170:	48050000 	stmdami	r5, {}	; <UNPREDICTABLE>
 174:	00000087 	andeq	r0, r0, r7, lsl #1
 178:	00dc0808 	sbcseq	r0, ip, r8, lsl #16
 17c:	49050000 	stmdbmi	r5, {}	; <UNPREDICTABLE>
 180:	00000087 	andeq	r0, r0, r7, lsl #1
 184:	00e4080c 	rsceq	r0, r4, ip, lsl #16
 188:	4a050000 	bmi	140190 <_stack+0xc0190>
 18c:	00000087 	andeq	r0, r0, r7, lsl #1
 190:	00ec0810 	rsceq	r0, ip, r0, lsl r8
 194:	4b050000 	blmi	14019c <_stack+0xc019c>
 198:	00000087 	andeq	r0, r0, r7, lsl #1
 19c:	013f0814 	teqeq	pc, r4, lsl r8	; <UNPREDICTABLE>
 1a0:	4c050000 	stcmi	0, cr0, [r5], {-0}
 1a4:	00000092 	muleq	r0, r2, r0
 1a8:	00b60818 	adcseq	r0, r6, r8, lsl r8
 1ac:	4d050000 	stcmi	0, cr0, [r5, #-0]
 1b0:	0000009d 	muleq	r0, sp, r0
 1b4:	00bd081c 	adcseq	r0, sp, ip, lsl r8
 1b8:	4e050000 	cdpmi	0, 0, cr0, cr5, cr0, {0}
 1bc:	0000009d 	muleq	r0, sp, r0
 1c0:	01490820 	cmpeq	r9, r0, lsr #16
 1c4:	4f050000 	svcmi	0x00050000
 1c8:	00000092 	muleq	r0, r2, r0
 1cc:	02df0824 	sbcseq	r0, pc, #36, 16	; 0x240000
 1d0:	50050000 	andpl	r0, r5, r0
 1d4:	0000009d 	muleq	r0, sp, r0
 1d8:	01ef0828 	mvneq	r0, r8, lsr #16
 1dc:	51050000 	mrspl	r0, (UNDEF: 5)
 1e0:	0000009d 	muleq	r0, sp, r0
 1e4:	0153082c 	cmpeq	r3, ip, lsr #16
 1e8:	52050000 	andpl	r0, r5, #0
 1ec:	00000092 	muleq	r0, r2, r0
 1f0:	028c0830 	addeq	r0, ip, #48, 16	; 0x300000
 1f4:	53050000 	movwpl	r0, #20480	; 0x5000
 1f8:	0000009d 	muleq	r0, sp, r0
 1fc:	02930834 	addseq	r0, r3, #52, 16	; 0x340000
 200:	54050000 	strpl	r0, [r5], #-0
 204:	0000009d 	muleq	r0, sp, r0
 208:	015d0838 	cmpeq	sp, r8, lsr r8
 20c:	55050000 	strpl	r0, [r5, #-0]
 210:	00000092 	muleq	r0, r2, r0
 214:	0171083c 	cmneq	r1, ip, lsr r8
 218:	56050000 	strpl	r0, [r5], -r0
 21c:	0000009d 	muleq	r0, sp, r0
 220:	01780840 	cmneq	r8, r0, asr #16
 224:	57050000 	strpl	r0, [r5, -r0]
 228:	0000009d 	muleq	r0, sp, r0
 22c:	029a0844 	addseq	r0, sl, #68, 16	; 0x440000
 230:	58050000 	stmdapl	r5, {}	; <UNPREDICTABLE>
 234:	00000092 	muleq	r0, r2, r0
 238:	01310848 	teqeq	r1, r8, asr #16
 23c:	59050000 	stmdbpl	r5, {}	; <UNPREDICTABLE>
 240:	0000009d 	muleq	r0, sp, r0
 244:	0138084c 	teqeq	r8, ip, asr #16
 248:	5a050000 	bpl	140250 <_stack+0xc0250>
 24c:	0000009d 	muleq	r0, sp, r0
 250:	01670850 	cmneq	r7, r0, asr r8
 254:	5b050000 	blpl	14025c <_stack+0xc025c>
 258:	00000092 	muleq	r0, r2, r0
 25c:	02cd0854 	sbceq	r0, sp, #84, 16	; 0x540000
 260:	5c050000 	stcpl	0, cr0, [r5], {-0}
 264:	0000009d 	muleq	r0, sp, r0
 268:	00f40858 	rscseq	r0, r4, r8, asr r8
 26c:	5d050000 	stcpl	0, cr0, [r5, #-0]
 270:	0000009d 	muleq	r0, sp, r0
 274:	02a4085c 	adceq	r0, r4, #92, 16	; 0x5c0000
 278:	5e050000 	cdppl	0, 0, cr0, cr5, cr0, {0}
 27c:	00000092 	muleq	r0, r2, r0
 280:	020b0860 	andeq	r0, fp, #96, 16	; 0x600000
 284:	5f050000 	svcpl	0x00050000
 288:	0000009d 	muleq	r0, sp, r0
 28c:	02120864 	andseq	r0, r2, #100, 16	; 0x640000
 290:	60050000 	andvs	r0, r5, r0
 294:	0000009d 	muleq	r0, sp, r0
 298:	02ae0868 	adceq	r0, lr, #104, 16	; 0x680000
 29c:	61050000 	mrsvs	r0, (UNDEF: 5)
 2a0:	00000092 	muleq	r0, r2, r0
 2a4:	0193086c 	orrseq	r0, r3, ip, ror #16
 2a8:	62050000 	andvs	r0, r5, #0
 2ac:	0000009d 	muleq	r0, sp, r0
 2b0:	024a0870 	subeq	r0, sl, #112, 16	; 0x700000
 2b4:	63050000 	movwvs	r0, #20480	; 0x5000
 2b8:	0000009d 	muleq	r0, sp, r0
 2bc:	017f0874 	cmneq	pc, r4, ror r8	; <UNPREDICTABLE>
 2c0:	64050000 	strvs	r0, [r5], #-0
 2c4:	00000092 	muleq	r0, r2, r0
 2c8:	022f0878 	eoreq	r0, pc, #120, 16	; 0x780000
 2cc:	65050000 	strvs	r0, [r5, #-0]
 2d0:	0000009d 	muleq	r0, sp, r0
 2d4:	0203087c 	andeq	r0, r3, #124, 16	; 0x7c0000
 2d8:	66050000 	strvs	r0, [r5], -r0
 2dc:	0000009d 	muleq	r0, sp, r0
 2e0:	01890880 	orreq	r0, r9, r0, lsl #17
 2e4:	67050000 	strvs	r0, [r5, -r0]
 2e8:	00000092 	muleq	r0, r2, r0
 2ec:	01ba0884 			; <UNDEFINED> instruction: 0x01ba0884
 2f0:	68050000 	stmdavs	r5, {}	; <UNPREDICTABLE>
 2f4:	0000009d 	muleq	r0, sp, r0
 2f8:	01c20888 	biceq	r0, r2, r8, lsl #17
 2fc:	69050000 	stmdbvs	r5, {}	; <UNPREDICTABLE>
 300:	0000009d 	muleq	r0, sp, r0
 304:	0219088c 	andseq	r0, r9, #140, 16	; 0x8c0000
 308:	6a050000 	bvs	140310 <_stack+0xc0310>
 30c:	00000092 	muleq	r0, r2, r0
 310:	01a80890 			; <UNDEFINED> instruction: 0x01a80890
 314:	6b050000 	blvs	14031c <_stack+0xc031c>
 318:	0000009d 	muleq	r0, sp, r0
 31c:	01050894 			; <UNDEFINED> instruction: 0x01050894
 320:	6c050000 	stcvs	0, cr0, [r5], {-0}
 324:	0000009d 	muleq	r0, sp, r0
 328:	010f0898 			; <UNDEFINED> instruction: 0x010f0898
 32c:	6d050000 	stcvs	0, cr0, [r5, #-0]
 330:	0000009d 	muleq	r0, sp, r0
 334:	0224089c 	eoreq	r0, r4, #156, 16	; 0x9c0000
 338:	6e050000 	cdpvs	0, 0, cr0, cr5, cr0, {0}
 33c:	00000092 	muleq	r0, r2, r0
 340:	d40300a0 	strle	r0, [r3], #-160	; 0xffffff60
 344:	05000002 	streq	r0, [r0, #-2]
 348:	0000a86f 	andeq	sl, r0, pc, ror #16
 34c:	02b80900 	adcseq	r0, r8, #0, 18
 350:	0e010000 	cdpeq	0, 0, cr0, cr1, cr0, {0}
 354:	000002b9 			; <UNDEFINED> instruction: 0x000002b9
 358:	84340305 	ldrthi	r0, [r4], #-773	; 0xfffffcfb
 35c:	040a0000 	streq	r0, [sl], #-0
 360:	0000029d 	muleq	r0, sp, r2
 364:	0001190b 	andeq	r1, r1, fp, lsl #18
 368:	24150100 	ldrcs	r0, [r5], #-256	; 0xffffff00
 36c:	18000081 	stmdane	r0, {r0, r7}
 370:	01000000 	mrseq	r0, (UNDEF: 0)
 374:	01ae0c9c 			; <UNDEFINED> instruction: 0x01ae0c9c
 378:	10010000 	andne	r0, r1, r0
 37c:	000002b9 			; <UNDEFINED> instruction: 0x000002b9
 380:	00008100 	andeq	r8, r0, r0, lsl #2
 384:	00000024 	andeq	r0, r0, r4, lsr #32
 388:	c1009c01 	tstgt	r0, r1, lsl #24
 38c:	04000001 	streq	r0, [r0], #-1
 390:	00013200 	andeq	r3, r1, r0, lsl #4
 394:	44010400 	strmi	r0, [r1], #-1024	; 0xfffffc00
 398:	0c000000 	stceq	0, cr0, [r0], {-0}
 39c:	000002e6 	andeq	r0, r0, r6, ror #5
 3a0:	0000813c 	andeq	r8, r0, ip, lsr r1
 3a4:	000000e8 	andeq	r0, r0, r8, ror #1
 3a8:	00000168 	andeq	r0, r0, r8, ror #2
 3ac:	cc060102 	stfgts	f0, [r6], {2}
 3b0:	02000001 	andeq	r0, r0, #1
 3b4:	01ca0801 	biceq	r0, sl, r1, lsl #16
 3b8:	02020000 	andeq	r0, r2, #0
 3bc:	0000fb05 	andeq	pc, r0, r5, lsl #22
 3c0:	07020200 	streq	r0, [r2, -r0, lsl #4]
 3c4:	00000237 	andeq	r0, r0, r7, lsr r2
 3c8:	9f050402 	svcls	0x00050402
 3cc:	03000001 	movweq	r0, #1
 3d0:	00000126 	andeq	r0, r0, r6, lsr #2
 3d4:	004f4102 	subeq	r4, pc, r2, lsl #2
 3d8:	04020000 	streq	r0, [r2], #-0
 3dc:	0001dd07 	andeq	sp, r1, r7, lsl #26
 3e0:	05080200 	streq	r0, [r8, #-512]	; 0xfffffe00
 3e4:	0000019a 	muleq	r0, sl, r1
 3e8:	d8070802 	stmdale	r7, {r1, fp}
 3ec:	04000001 	streq	r0, [r0], #-1
 3f0:	6e690504 	cdpvs	5, 6, cr0, cr9, cr4, {0}
 3f4:	04020074 	streq	r0, [r2], #-116	; 0xffffff8c
 3f8:	0001e207 	andeq	lr, r1, r7, lsl #4
 3fc:	01280300 			; <UNDEFINED> instruction: 0x01280300
 400:	30030000 	andcc	r0, r3, r0
 404:	00000044 	andeq	r0, r0, r4, asr #32
 408:	00007205 	andeq	r7, r0, r5, lsl #4
 40c:	04280600 	strteq	r0, [r8], #-1536	; 0xfffffa00
 410:	00010325 	andeq	r0, r1, r5, lsr #6
 414:	04680700 	strbteq	r0, [r8], #-1792	; 0xfffff900
 418:	26040000 	strcs	r0, [r4], -r0
 41c:	0000007d 	andeq	r0, r0, sp, ror r0
 420:	045a0700 	ldrbeq	r0, [sl], #-1792	; 0xfffff900
 424:	27040000 	strcs	r0, [r4, -r0]
 428:	0000007d 	andeq	r0, r0, sp, ror r0
 42c:	03ef0704 	mvneq	r0, #4, 14	; 0x100000
 430:	28040000 	stmdacs	r4, {}	; <UNPREDICTABLE>
 434:	0000007d 	andeq	r0, r0, sp, ror r0
 438:	033f0708 	teqeq	pc, #8, 14	; 0x200000
 43c:	29040000 	stmdbcs	r4, {}	; <UNPREDICTABLE>
 440:	0000007d 	andeq	r0, r0, sp, ror r0
 444:	03b3070c 			; <UNDEFINED> instruction: 0x03b3070c
 448:	2a040000 	bcs	100450 <_stack+0x80450>
 44c:	0000007d 	andeq	r0, r0, sp, ror r0
 450:	03c10710 	biceq	r0, r1, #16, 14	; 0x400000
 454:	2b040000 	blcs	10045c <_stack+0x8045c>
 458:	0000007d 	andeq	r0, r0, sp, ror r0
 45c:	040c0714 	streq	r0, [ip], #-1812	; 0xfffff8ec
 460:	2c040000 	stccs	0, cr0, [r4], {-0}
 464:	0000007d 	andeq	r0, r0, sp, ror r0
 468:	03fd0718 	mvnseq	r0, #24, 14	; 0x600000
 46c:	2d040000 	stccs	0, cr0, [r4, #-0]
 470:	0000007d 	andeq	r0, r0, sp, ror r0
 474:	0330071c 	teqeq	r0, #28, 14	; 0x700000
 478:	2e040000 	cdpcs	0, 0, cr0, cr4, cr0, {0}
 47c:	0000007d 	andeq	r0, r0, sp, ror r0
 480:	03cf0720 	biceq	r0, pc, #32, 14	; 0x800000
 484:	2f040000 	svccs	0x00040000
 488:	0000007d 	andeq	r0, r0, sp, ror r0
 48c:	1e030024 	cdpne	0, 0, cr0, cr3, cr4, {1}
 490:	04000004 	streq	r0, [r0], #-4
 494:	00008230 	andeq	r8, r0, r0, lsr r2
 498:	034b0800 	movteq	r0, #47104	; 0xb800
 49c:	15010000 	strne	r0, [r1, #-0]
 4a0:	0000011f 	andeq	r0, r0, pc, lsl r1
 4a4:	84380305 	ldrthi	r0, [r8], #-773	; 0xfffffcfb
 4a8:	04090000 	streq	r0, [r9], #-0
 4ac:	00000103 	andeq	r0, r0, r3, lsl #2
 4b0:	0003930a 	andeq	r9, r3, sl, lsl #6
 4b4:	148f0100 	strne	r0, [pc], #256	; 4bc <CPSR_IRQ_INHIBIT+0x43c>
 4b8:	10000082 	andne	r0, r0, r2, lsl #1
 4bc:	01000000 	mrseq	r0, (UNDEF: 0)
 4c0:	03650b9c 	cmneq	r5, #156, 22	; 0x27000
 4c4:	6b010000 	blvs	404cc <__bss_end__+0x38084>
 4c8:	000081c0 	andeq	r8, r0, r0, asr #3
 4cc:	00000054 	andeq	r0, r0, r4, asr r0
 4d0:	015a9c01 	cmpeq	sl, r1, lsl #24
 4d4:	a9080000 	stmdbge	r8, {}	; <UNPREDICTABLE>
 4d8:	01000003 	tsteq	r0, r3
 4dc:	00007d6d 	andeq	r7, r0, sp, ror #26
 4e0:	5c910200 	lfmpl	f0, 4, [r1], {0}
 4e4:	04480a00 	strbeq	r0, [r8], #-2560	; 0xfffff600
 4e8:	5e010000 	cdppl	0, 0, cr0, cr1, cr0, {0}
 4ec:	000081a8 	andeq	r8, r0, r8, lsr #3
 4f0:	00000018 	andeq	r0, r0, r8, lsl r0
 4f4:	1a0a9c01 	bne	2a7500 <_stack+0x227500>
 4f8:	01000003 	tsteq	r0, r3
 4fc:	00819052 	addeq	r9, r1, r2, asr r0
 500:	00001800 	andeq	r1, r0, r0, lsl #16
 504:	0a9c0100 	beq	fe70090c <_stack+0xfe68090c>
 508:	0000035c 	andeq	r0, r0, ip, asr r3
 50c:	81844301 	orrhi	r4, r4, r1, lsl #6
 510:	000c0000 	andeq	r0, ip, r0
 514:	9c010000 	stcls	0, cr0, [r1], {-0}
 518:	0003760a 	andeq	r7, r3, sl, lsl #12
 51c:	78340100 	ldmdavc	r4!, {r8}
 520:	0c000081 	stceq	0, cr0, [r0], {129}	; 0x81
 524:	01000000 	mrseq	r0, (UNDEF: 0)
 528:	03e20a9c 	mvneq	r0, #156, 20	; 0x9c000
 52c:	29010000 	stmdbcs	r1, {}	; <UNPREDICTABLE>
 530:	00008160 	andeq	r8, r0, r0, ror #2
 534:	00000018 	andeq	r0, r0, r8, lsl r0
 538:	330c9c01 	movwcc	r9, #52225	; 0xcc01
 53c:	01000004 	tsteq	r0, r4
 540:	00011f1c 	andeq	r1, r1, ip, lsl pc
 544:	00813c00 	addeq	r3, r1, r0, lsl #24
 548:	00002400 	andeq	r2, r0, r0, lsl #8
 54c:	009c0100 	addseq	r0, ip, r0, lsl #2
 550:	000001c7 	andeq	r0, r0, r7, asr #3
 554:	01ec0004 	mvneq	r0, r4
 558:	01040000 	mrseq	r0, (UNDEF: 4)
 55c:	00000044 	andeq	r0, r0, r4, asr #32
 560:	0005850c 	andeq	r8, r5, ip, lsl #10
 564:	00822400 	addeq	r2, r2, r0, lsl #8
 568:	00006000 	andeq	r6, r0, r0
 56c:	00028b00 	andeq	r8, r2, r0, lsl #22
 570:	06010200 	streq	r0, [r1], -r0, lsl #4
 574:	000001cc 	andeq	r0, r0, ip, asr #3
 578:	ca080102 	bgt	200988 <_stack+0x180988>
 57c:	02000001 	andeq	r0, r0, #1
 580:	00fb0502 	rscseq	r0, fp, r2, lsl #10
 584:	02020000 	andeq	r0, r2, #0
 588:	00023707 	andeq	r3, r2, r7, lsl #14
 58c:	05040200 	streq	r0, [r4, #-512]	; 0xfffffe00
 590:	0000019f 	muleq	r0, pc, r1	; <UNPREDICTABLE>
 594:	00012603 	andeq	r2, r1, r3, lsl #12
 598:	4f410200 	svcmi	0x00410200
 59c:	02000000 	andeq	r0, r0, #0
 5a0:	01dd0704 	bicseq	r0, sp, r4, lsl #14
 5a4:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
 5a8:	00019a05 	andeq	r9, r1, r5, lsl #20
 5ac:	07080200 	streq	r0, [r8, -r0, lsl #4]
 5b0:	000001d8 	ldrdeq	r0, [r0], -r8
 5b4:	69050404 	stmdbvs	r5, {r2, sl}
 5b8:	0200746e 	andeq	r7, r0, #1845493760	; 0x6e000000
 5bc:	01e20704 	mvneq	r0, r4, lsl #14
 5c0:	28030000 	stmdacs	r3, {}	; <UNPREDICTABLE>
 5c4:	03000001 	movweq	r0, #1
 5c8:	00004430 	andeq	r4, r0, r0, lsr r4
 5cc:	00720500 	rsbseq	r0, r2, r0, lsl #10
 5d0:	7d060000 	stcvc	0, cr0, [r6, #-0]
 5d4:	03000000 	movweq	r0, #0
 5d8:	00000251 	andeq	r0, r0, r1, asr r2
 5dc:	007d1204 	rsbseq	r1, sp, r4, lsl #4
 5e0:	f6030000 			; <UNDEFINED> instruction: 0xf6030000
 5e4:	04000001 	streq	r0, [r0], #-1
 5e8:	00008213 	andeq	r8, r0, r3, lsl r2
 5ec:	052c0700 	streq	r0, [ip, #-1792]!	; 0xfffff900
 5f0:	00012a0a 	andeq	r2, r1, sl, lsl #20
 5f4:	05590800 	ldrbeq	r0, [r9, #-2048]	; 0xfffff800
 5f8:	0b050000 	bleq	140600 <_stack+0xc0600>
 5fc:	00000087 	andeq	r0, r0, r7, lsl #1
 600:	04cb0800 	strbeq	r0, [fp], #2048	; 0x800
 604:	0c050000 	stceq	0, cr0, [r5], {-0}
 608:	00000087 	andeq	r0, r0, r7, lsl #1
 60c:	04f00804 	ldrbteq	r0, [r0], #2052	; 0x804
 610:	0d050000 	stceq	0, cr0, [r5, #-0]
 614:	00000087 	andeq	r0, r0, r7, lsl #1
 618:	05670808 	strbeq	r0, [r7, #-2056]!	; 0xfffff7f8
 61c:	0e050000 	cdpeq	0, 0, cr0, cr5, cr0, {0}
 620:	00000087 	andeq	r0, r0, r7, lsl #1
 624:	047a080c 	ldrbteq	r0, [sl], #-2060	; 0xfffff7f4
 628:	0f050000 	svceq	0x00050000
 62c:	00000087 	andeq	r0, r0, r7, lsl #1
 630:	05760810 	ldrbeq	r0, [r6, #-2064]!	; 0xfffff7f0
 634:	10050000 	andne	r0, r5, r0
 638:	00000092 	muleq	r0, r2, r0
 63c:	04890814 	streq	r0, [r9], #2068	; 0x814
 640:	11050000 	mrsne	r0, (UNDEF: 5)
 644:	00000092 	muleq	r0, r2, r0
 648:	04da0818 	ldrbeq	r0, [sl], #2072	; 0x818
 64c:	12050000 	andne	r0, r5, #0
 650:	00000087 	andeq	r0, r0, r7, lsl #1
 654:	04a4081c 	strteq	r0, [r4], #2076	; 0x81c
 658:	13050000 	movwne	r0, #20480	; 0x5000
 65c:	00000087 	andeq	r0, r0, r7, lsl #1
 660:	05310820 	ldreq	r0, [r1, #-2080]!	; 0xfffff7e0
 664:	14050000 	strne	r0, [r5], #-0
 668:	00000092 	muleq	r0, r2, r0
 66c:	05210824 	streq	r0, [r1, #-2084]!	; 0xfffff7dc
 670:	15050000 	strne	r0, [r5, #-0]
 674:	00000087 	andeq	r0, r0, r7, lsl #1
 678:	16030028 	strne	r0, [r3], -r8, lsr #32
 67c:	05000005 	streq	r0, [r0, #-5]
 680:	00009d16 	andeq	r9, r0, r6, lsl sp
 684:	05080700 	streq	r0, [r8, #-1792]	; 0xfffff900
 688:	00015618 	andeq	r5, r1, r8, lsl r6
 68c:	05510800 	ldrbeq	r0, [r1, #-2048]	; 0xfffff800
 690:	19050000 	stmdbne	r5, {}	; <UNPREDICTABLE>
 694:	00000092 	muleq	r0, r2, r0
 698:	04ff0800 	ldrbteq	r0, [pc], #2048	; 6a0 <CPSR_IRQ_INHIBIT+0x620>
 69c:	1a050000 	bne	1406a4 <_stack+0xc06a4>
 6a0:	00000087 	andeq	r0, r0, r7, lsl #1
 6a4:	b4030004 	strlt	r0, [r3], #-4
 6a8:	05000004 	streq	r0, [r0, #-4]
 6ac:	0001351b 	andeq	r3, r1, fp, lsl r5
 6b0:	04e90900 	strbteq	r0, [r9], #2304	; 0x900
 6b4:	0e010000 	cdpeq	0, 0, cr0, cr1, cr0, {0}
 6b8:	00000172 	andeq	r0, r0, r2, ror r1
 6bc:	843c0305 	ldrthi	r0, [ip], #-773	; 0xfffffcfb
 6c0:	040a0000 	streq	r0, [sl], #-0
 6c4:	00000156 	andeq	r0, r0, r6, asr r1
 6c8:	00049809 	andeq	r9, r4, r9, lsl #16
 6cc:	890f0100 	stmdbhi	pc, {r8}	; <UNPREDICTABLE>
 6d0:	05000001 	streq	r0, [r0, #-1]
 6d4:	00844003 	addeq	r4, r4, r3
 6d8:	2a040a00 	bcs	102ee0 <_stack+0x82ee0>
 6dc:	0b000001 	bleq	6e8 <CPSR_IRQ_INHIBIT+0x668>
 6e0:	000004be 			; <UNDEFINED> instruction: 0x000004be
 6e4:	826c1b01 	rsbhi	r1, ip, #1024	; 0x400
 6e8:	00180000 	andseq	r0, r8, r0
 6ec:	9c010000 	stcls	0, cr0, [r1], {-0}
 6f0:	0005410c 	andeq	r4, r5, ip, lsl #2
 6f4:	89160100 	ldmdbhi	r6, {r8}
 6f8:	48000001 	stmdami	r0, {r0}
 6fc:	24000082 	strcs	r0, [r0], #-130	; 0xffffff7e
 700:	01000000 	mrseq	r0, (UNDEF: 0)
 704:	050b0c9c 	streq	r0, [fp, #-3228]	; 0xfffff364
 708:	11010000 	mrsne	r0, (UNDEF: 1)
 70c:	00000172 	andeq	r0, r0, r2, ror r1
 710:	00008224 	andeq	r8, r0, r4, lsr #4
 714:	00000024 	andeq	r0, r0, r4, lsr #32
 718:	b8009c01 	stmdalt	r0, {r0, sl, fp, ip, pc}
 71c:	04000003 	streq	r0, [r0], #-3
 720:	00029500 	andeq	r9, r2, r0, lsl #10
 724:	44010400 	strmi	r0, [r1], #-1024	; 0xfffffc00
 728:	0c000000 	stceq	0, cr0, [r0], {-0}
 72c:	000005cb 	andeq	r0, r0, fp, asr #11
 730:	00008284 	andeq	r8, r0, r4, lsl #5
 734:	000001b0 			; <UNDEFINED> instruction: 0x000001b0
 738:	0000038e 	andeq	r0, r0, lr, lsl #7
 73c:	cc060102 	stfgts	f0, [r6], {2}
 740:	02000001 	andeq	r0, r0, #1
 744:	01ca0801 	biceq	r0, sl, r1, lsl #16
 748:	02020000 	andeq	r0, r2, #0
 74c:	0000fb05 	andeq	pc, r0, r5, lsl #22
 750:	07020200 	streq	r0, [r2, -r0, lsl #4]
 754:	00000237 	andeq	r0, r0, r7, lsr r2
 758:	9f050402 	svcls	0x00050402
 75c:	03000001 	movweq	r0, #1
 760:	00000126 	andeq	r0, r0, r6, lsr #2
 764:	004f4102 	subeq	r4, pc, r2, lsl #2
 768:	04020000 	streq	r0, [r2], #-0
 76c:	0001dd07 	andeq	sp, r1, r7, lsl #26
 770:	05080200 	streq	r0, [r8, #-512]	; 0xfffffe00
 774:	0000019a 	muleq	r0, sl, r1
 778:	d8070802 	stmdale	r7, {r1, fp}
 77c:	04000001 	streq	r0, [r0], #-1
 780:	6e690504 	cdpvs	5, 6, cr0, cr9, cr4, {0}
 784:	04020074 	streq	r0, [r2], #-116	; 0xffffff8c
 788:	0001e207 	andeq	lr, r1, r7, lsl #4
 78c:	006b0500 	rsbeq	r0, fp, r0, lsl #10
 790:	28030000 	stmdacs	r3, {}	; <UNPREDICTABLE>
 794:	03000001 	movweq	r0, #1
 798:	00004430 	andeq	r4, r0, r0, lsr r4
 79c:	00770500 	rsbseq	r0, r7, r0, lsl #10
 7a0:	82060000 	andhi	r0, r6, #0
 7a4:	03000000 	movweq	r0, #0
 7a8:	00000251 	andeq	r0, r0, r1, asr r2
 7ac:	00821204 	addeq	r1, r2, r4, lsl #4
 7b0:	f6030000 			; <UNDEFINED> instruction: 0xf6030000
 7b4:	04000001 	streq	r0, [r0], #-1
 7b8:	00008713 	andeq	r8, r0, r3, lsl r7
 7bc:	02c00300 	sbceq	r0, r0, #0, 6
 7c0:	14040000 	strne	r0, [r4], #-0
 7c4:	00000082 	andeq	r0, r0, r2, lsl #1
 7c8:	0a052c07 	beq	14b7ec <_stack+0xcb7ec>
 7cc:	0000013a 	andeq	r0, r0, sl, lsr r1
 7d0:	00055908 	andeq	r5, r5, r8, lsl #18
 7d4:	8c0b0500 	cfstr32hi	mvfx0, [fp], {-0}
 7d8:	00000000 	andeq	r0, r0, r0
 7dc:	0004cb08 	andeq	ip, r4, r8, lsl #22
 7e0:	8c0c0500 	cfstr32hi	mvfx0, [ip], {-0}
 7e4:	04000000 	streq	r0, [r0], #-0
 7e8:	0004f008 	andeq	pc, r4, r8
 7ec:	8c0d0500 	cfstr32hi	mvfx0, [sp], {-0}
 7f0:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
 7f4:	00056708 	andeq	r6, r5, r8, lsl #14
 7f8:	8c0e0500 	cfstr32hi	mvfx0, [lr], {-0}
 7fc:	0c000000 	stceq	0, cr0, [r0], {-0}
 800:	00047a08 	andeq	r7, r4, r8, lsl #20
 804:	8c0f0500 	cfstr32hi	mvfx0, [pc], {-0}
 808:	10000000 	andne	r0, r0, r0
 80c:	00057608 	andeq	r7, r5, r8, lsl #12
 810:	97100500 	ldrls	r0, [r0, -r0, lsl #10]
 814:	14000000 	strne	r0, [r0], #-0
 818:	00048908 	andeq	r8, r4, r8, lsl #18
 81c:	97110500 	ldrls	r0, [r1, -r0, lsl #10]
 820:	18000000 	stmdane	r0, {}	; <UNPREDICTABLE>
 824:	0004da08 	andeq	sp, r4, r8, lsl #20
 828:	8c120500 	cfldr32hi	mvfx0, [r2], {-0}
 82c:	1c000000 	stcne	0, cr0, [r0], {-0}
 830:	0004a408 	andeq	sl, r4, r8, lsl #8
 834:	8c130500 	cfldr32hi	mvfx0, [r3], {-0}
 838:	20000000 	andcs	r0, r0, r0
 83c:	00053108 	andeq	r3, r5, r8, lsl #2
 840:	97140500 	ldrls	r0, [r4, -r0, lsl #10]
 844:	24000000 	strcs	r0, [r0], #-0
 848:	00052108 	andeq	r2, r5, r8, lsl #2
 84c:	8c150500 	cfldr32hi	mvfx0, [r5], {-0}
 850:	28000000 	stmdacs	r0, {}	; <UNPREDICTABLE>
 854:	05160300 	ldreq	r0, [r6, #-768]	; 0xfffffd00
 858:	16050000 	strne	r0, [r5], -r0
 85c:	000000ad 	andeq	r0, r0, sp, lsr #1
 860:	4506a407 	strmi	sl, [r6, #-1031]	; 0xfffffbf9
 864:	0000033a 	andeq	r0, r0, sl, lsr r3
 868:	0000c408 	andeq	ip, r0, r8, lsl #8
 86c:	8c460600 	mcrrhi	6, 0, r0, r6, cr0
 870:	00000000 	andeq	r0, r0, r0
 874:	0000cc08 	andeq	ip, r0, r8, lsl #24
 878:	8c470600 	mcrrhi	6, 0, r0, r7, cr0
 87c:	04000000 	streq	r0, [r0], #-0
 880:	0000d408 	andeq	sp, r0, r8, lsl #8
 884:	8c480600 	mcrrhi	6, 0, r0, r8, cr0
 888:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
 88c:	0000dc08 	andeq	sp, r0, r8, lsl #24
 890:	8c490600 	mcrrhi	6, 0, r0, r9, cr0
 894:	0c000000 	stceq	0, cr0, [r0], {-0}
 898:	0000e408 	andeq	lr, r0, r8, lsl #8
 89c:	8c4a0600 	mcrrhi	6, 0, r0, sl, cr0
 8a0:	10000000 	andne	r0, r0, r0
 8a4:	0000ec08 	andeq	lr, r0, r8, lsl #24
 8a8:	8c4b0600 	mcrrhi	6, 0, r0, fp, cr0
 8ac:	14000000 	strne	r0, [r0], #-0
 8b0:	00013f08 	andeq	r3, r1, r8, lsl #30
 8b4:	974c0600 	strbls	r0, [ip, -r0, lsl #12]
 8b8:	18000000 	stmdane	r0, {}	; <UNPREDICTABLE>
 8bc:	0000b608 	andeq	fp, r0, r8, lsl #12
 8c0:	a24d0600 	subge	r0, sp, #0, 12
 8c4:	1c000000 	stcne	0, cr0, [r0], {-0}
 8c8:	0000bd08 	andeq	fp, r0, r8, lsl #26
 8cc:	a24e0600 	subge	r0, lr, #0, 12
 8d0:	20000000 	andcs	r0, r0, r0
 8d4:	00014908 	andeq	r4, r1, r8, lsl #18
 8d8:	974f0600 	strbls	r0, [pc, -r0, lsl #12]
 8dc:	24000000 	strcs	r0, [r0], #-0
 8e0:	0002df08 	andeq	sp, r2, r8, lsl #30
 8e4:	a2500600 	subsge	r0, r0, #0, 12
 8e8:	28000000 	stmdacs	r0, {}	; <UNPREDICTABLE>
 8ec:	0001ef08 	andeq	lr, r1, r8, lsl #30
 8f0:	a2510600 	subsge	r0, r1, #0, 12
 8f4:	2c000000 	stccs	0, cr0, [r0], {-0}
 8f8:	00015308 	andeq	r5, r1, r8, lsl #6
 8fc:	97520600 	ldrbls	r0, [r2, -r0, lsl #12]
 900:	30000000 	andcc	r0, r0, r0
 904:	00028c08 	andeq	r8, r2, r8, lsl #24
 908:	a2530600 	subsge	r0, r3, #0, 12
 90c:	34000000 	strcc	r0, [r0], #-0
 910:	00029308 	andeq	r9, r2, r8, lsl #6
 914:	a2540600 	subsge	r0, r4, #0, 12
 918:	38000000 	stmdacc	r0, {}	; <UNPREDICTABLE>
 91c:	00015d08 	andeq	r5, r1, r8, lsl #26
 920:	97550600 	ldrbls	r0, [r5, -r0, lsl #12]
 924:	3c000000 	stccc	0, cr0, [r0], {-0}
 928:	00017108 	andeq	r7, r1, r8, lsl #2
 92c:	a2560600 	subsge	r0, r6, #0, 12
 930:	40000000 	andmi	r0, r0, r0
 934:	00017808 	andeq	r7, r1, r8, lsl #16
 938:	a2570600 	subsge	r0, r7, #0, 12
 93c:	44000000 	strmi	r0, [r0], #-0
 940:	00029a08 	andeq	r9, r2, r8, lsl #20
 944:	97580600 	ldrbls	r0, [r8, -r0, lsl #12]
 948:	48000000 	stmdami	r0, {}	; <UNPREDICTABLE>
 94c:	00013108 	andeq	r3, r1, r8, lsl #2
 950:	a2590600 	subsge	r0, r9, #0, 12
 954:	4c000000 	stcmi	0, cr0, [r0], {-0}
 958:	00013808 	andeq	r3, r1, r8, lsl #16
 95c:	a25a0600 	subsge	r0, sl, #0, 12
 960:	50000000 	andpl	r0, r0, r0
 964:	00016708 	andeq	r6, r1, r8, lsl #14
 968:	975b0600 	ldrbls	r0, [fp, -r0, lsl #12]
 96c:	54000000 	strpl	r0, [r0], #-0
 970:	0002cd08 	andeq	ip, r2, r8, lsl #26
 974:	a25c0600 	subsge	r0, ip, #0, 12
 978:	58000000 	stmdapl	r0, {}	; <UNPREDICTABLE>
 97c:	0000f408 	andeq	pc, r0, r8, lsl #8
 980:	a25d0600 	subsge	r0, sp, #0, 12
 984:	5c000000 	stcpl	0, cr0, [r0], {-0}
 988:	0002a408 	andeq	sl, r2, r8, lsl #8
 98c:	975e0600 	ldrbls	r0, [lr, -r0, lsl #12]
 990:	60000000 	andvs	r0, r0, r0
 994:	00020b08 	andeq	r0, r2, r8, lsl #22
 998:	a25f0600 	subsge	r0, pc, #0, 12
 99c:	64000000 	strvs	r0, [r0], #-0
 9a0:	00021208 	andeq	r1, r2, r8, lsl #4
 9a4:	a2600600 	rsbge	r0, r0, #0, 12
 9a8:	68000000 	stmdavs	r0, {}	; <UNPREDICTABLE>
 9ac:	0002ae08 	andeq	sl, r2, r8, lsl #28
 9b0:	97610600 	strbls	r0, [r1, -r0, lsl #12]!
 9b4:	6c000000 	stcvs	0, cr0, [r0], {-0}
 9b8:	00019308 	andeq	r9, r1, r8, lsl #6
 9bc:	a2620600 	rsbge	r0, r2, #0, 12
 9c0:	70000000 	andvc	r0, r0, r0
 9c4:	00024a08 	andeq	r4, r2, r8, lsl #20
 9c8:	a2630600 	rsbge	r0, r3, #0, 12
 9cc:	74000000 	strvc	r0, [r0], #-0
 9d0:	00017f08 	andeq	r7, r1, r8, lsl #30
 9d4:	97640600 	strbls	r0, [r4, -r0, lsl #12]!
 9d8:	78000000 	stmdavc	r0, {}	; <UNPREDICTABLE>
 9dc:	00022f08 	andeq	r2, r2, r8, lsl #30
 9e0:	a2650600 	rsbge	r0, r5, #0, 12
 9e4:	7c000000 	stcvc	0, cr0, [r0], {-0}
 9e8:	00020308 	andeq	r0, r2, r8, lsl #6
 9ec:	a2660600 	rsbge	r0, r6, #0, 12
 9f0:	80000000 	andhi	r0, r0, r0
 9f4:	00018908 	andeq	r8, r1, r8, lsl #18
 9f8:	97670600 	strbls	r0, [r7, -r0, lsl #12]!
 9fc:	84000000 	strhi	r0, [r0], #-0
 a00:	0001ba08 	andeq	fp, r1, r8, lsl #20
 a04:	a2680600 	rsbge	r0, r8, #0, 12
 a08:	88000000 	stmdahi	r0, {}	; <UNPREDICTABLE>
 a0c:	0001c208 	andeq	ip, r1, r8, lsl #4
 a10:	a2690600 	rsbge	r0, r9, #0, 12
 a14:	8c000000 	stchi	0, cr0, [r0], {-0}
 a18:	00021908 	andeq	r1, r2, r8, lsl #18
 a1c:	976a0600 	strbls	r0, [sl, -r0, lsl #12]!
 a20:	90000000 	andls	r0, r0, r0
 a24:	0001a808 	andeq	sl, r1, r8, lsl #16
 a28:	a26b0600 	rsbge	r0, fp, #0, 12
 a2c:	94000000 	strls	r0, [r0], #-0
 a30:	00010508 	andeq	r0, r1, r8, lsl #10
 a34:	a26c0600 	rsbge	r0, ip, #0, 12
 a38:	98000000 	stmdals	r0, {}	; <UNPREDICTABLE>
 a3c:	00010f08 	andeq	r0, r1, r8, lsl #30
 a40:	a26d0600 	rsbge	r0, sp, #0, 12
 a44:	9c000000 	stcls	0, cr0, [r0], {-0}
 a48:	00022408 	andeq	r2, r2, r8, lsl #8
 a4c:	976e0600 	strbls	r0, [lr, -r0, lsl #12]!
 a50:	a0000000 	andge	r0, r0, r0
 a54:	02d40300 	sbcseq	r0, r4, #0, 6
 a58:	6f060000 	svcvs	0x00060000
 a5c:	00000145 	andeq	r0, r0, r5, asr #2
 a60:	00617209 	rsbeq	r7, r1, r9, lsl #4
 a64:	00720f01 	rsbseq	r0, r2, r1, lsl #30
 a68:	03050000 	movweq	r0, #20480	; 0x5000
 a6c:	00008444 	andeq	r8, r0, r4, asr #8
 a70:	0005b30a 	andeq	fp, r5, sl, lsl #6
 a74:	84120100 	ldrhi	r0, [r2], #-256	; 0xffffff00
 a78:	b0000082 	andlt	r0, r0, r2, lsl #1
 a7c:	01000001 	tsteq	r0, r1
 a80:	0003af9c 	muleq	r3, ip, pc	; <UNPREDICTABLE>
 a84:	30720b00 	rsbscc	r0, r2, r0, lsl #22
 a88:	6b120100 	blvs	480e90 <_stack+0x400e90>
 a8c:	02000000 	andeq	r0, r0, #0
 a90:	720b6c91 	andvc	r6, fp, #37120	; 0x9100
 a94:	12010031 	andne	r0, r1, #49	; 0x31
 a98:	0000006b 	andeq	r0, r0, fp, rrx
 a9c:	0c689102 	stfeqp	f1, [r8], #-8
 aa0:	00000603 	andeq	r0, r0, r3, lsl #12
 aa4:	006b1201 	rsbeq	r1, fp, r1, lsl #4
 aa8:	91020000 	mrsls	r0, (UNDEF: 2)
 aac:	05bf0d64 	ldreq	r0, [pc, #3428]!	; 1818 <CPSR_IRQ_INHIBIT+0x1798>
 ab0:	15010000 	strne	r0, [r1, #-0]
 ab4:	000003af 	andeq	r0, r0, pc, lsr #7
 ab8:	0d749102 	ldfeqp	f1, [r4, #-8]!
 abc:	000005fb 	strdeq	r0, [r0], -fp
 ac0:	03b51601 			; <UNDEFINED> instruction: 0x03b51601
 ac4:	91020000 	mrsls	r0, (UNDEF: 2)
 ac8:	040e0070 	streq	r0, [lr], #-112	; 0xffffff90
 acc:	0000013a 	andeq	r0, r0, sl, lsr r1
 ad0:	033a040e 	teqeq	sl, #234881024	; 0xe000000
 ad4:	6c000000 	stcvs	0, cr0, [r0], {-0}
 ad8:	02000000 	andeq	r0, r0, #0
 adc:	00035500 	andeq	r5, r3, r0, lsl #10
 ae0:	ce010400 	cfcpysgt	mvf0, mvf1
 ae4:	00000004 	andeq	r0, r0, r4
 ae8:	94000080 	strls	r0, [r0], #-128	; 0xffffff80
 aec:	2f000080 	svccs	0x00000080
 af0:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
 af4:	6462612f 	strbtvs	r6, [r2], #-303	; 0xfffffed1
 af8:	72616b69 	rsbvc	r6, r1, #107520	; 0x1a400
 afc:	642f6d69 	strtvs	r6, [pc], #-3433	; b04 <CPSR_IRQ_INHIBIT+0xa84>
 b00:	4d2f7665 	stcmi	6, cr7, [pc, #-404]!	; 974 <CPSR_IRQ_INHIBIT+0x8f4>
 b04:	74694c79 	strbtvc	r4, [r9], #-3193	; 0xfffff387
 b08:	4f656c74 	svcmi	0x00656c74
 b0c:	72732f53 	rsbsvc	r2, r3, #332	; 0x14c
 b10:	74732f63 	ldrbtvc	r2, [r3], #-3939	; 0xfffff09d
 b14:	2e747261 	cdpcs	2, 7, cr7, cr4, cr1, {3}
 b18:	682f0073 	stmdavs	pc!, {r0, r1, r4, r5, r6}	; <UNPREDICTABLE>
 b1c:	2f656d6f 	svccs	0x00656d6f
 b20:	69646261 	stmdbvs	r4!, {r0, r5, r6, r9, sp, lr}^
 b24:	6972616b 	ldmdbvs	r2!, {r0, r1, r3, r5, r6, r8, sp, lr}^
 b28:	65642f6d 	strbvs	r2, [r4, #-3949]!	; 0xfffff093
 b2c:	794d2f76 	stmdbvc	sp, {r1, r2, r4, r5, r6, r8, r9, sl, fp, sp}^
 b30:	7474694c 	ldrbtvc	r6, [r4], #-2380	; 0xfffff6b4
 b34:	534f656c 	movtpl	r6, #62828	; 0xf56c
 b38:	554e4700 	strbpl	r4, [lr, #-1792]	; 0xfffff900
 b3c:	20534120 	subscs	r4, r3, r0, lsr #2
 b40:	37322e32 			; <UNDEFINED> instruction: 0x37322e32
 b44:	Address 0x0000000000000b44 is out of bounds.


Disassembly of section .debug_abbrev:

00000000 <.debug_abbrev>:
   0:	25011101 	strcs	r1, [r1, #-257]	; 0xfffffeff
   4:	030b130e 	movweq	r1, #45838	; 0xb30e
   8:	1201110e 	andne	r1, r1, #-2147483645	; 0x80000003
   c:	00171006 	andseq	r1, r7, r6
  10:	00340200 	eorseq	r0, r4, r0, lsl #4
  14:	0b3a0e03 	bleq	e83828 <_stack+0xe03828>
  18:	13490b3b 	movtne	r0, #39739	; 0x9b3b
  1c:	193c193f 	ldmdbne	ip!, {r0, r1, r2, r3, r4, r5, r8, fp, ip}
  20:	24030000 	strcs	r0, [r3], #-0
  24:	3e0b0b00 	vmlacc.f64	d0, d11, d0
  28:	0008030b 	andeq	r0, r8, fp, lsl #6
  2c:	012e0400 			; <UNDEFINED> instruction: 0x012e0400
  30:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
  34:	0b3b0b3a 	bleq	ec2d24 <_stack+0xe42d24>
  38:	01111927 	tsteq	r1, r7, lsr #18
  3c:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
  40:	01194296 			; <UNDEFINED> instruction: 0x01194296
  44:	05000013 	streq	r0, [r0, #-19]	; 0xffffffed
  48:	08030005 	stmdaeq	r3, {r0, r2}
  4c:	0b3b0b3a 	bleq	ec2d3c <_stack+0xe42d3c>
  50:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
  54:	34060000 	strcc	r0, [r6], #-0
  58:	3a080300 	bcc	200c60 <_stack+0x180c60>
  5c:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
  60:	00180213 	andseq	r0, r8, r3, lsl r2
  64:	00340700 	eorseq	r0, r4, r0, lsl #14
  68:	0b3a0e03 	bleq	e8387c <_stack+0xe0387c>
  6c:	13490b3b 	movtne	r0, #39739	; 0x9b3b
  70:	00001802 	andeq	r1, r0, r2, lsl #16
  74:	0b002408 	bleq	909c <__bss_end__+0xc54>
  78:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
  7c:	0900000e 	stmdbeq	r0, {r1, r2, r3}
  80:	0b0b000f 	bleq	2c00c4 <_stack+0x2400c4>
  84:	00001349 	andeq	r1, r0, r9, asr #6
  88:	01110100 	tsteq	r1, r0, lsl #2
  8c:	0b130e25 	bleq	4c3928 <_stack+0x443928>
  90:	01110e03 	tsteq	r1, r3, lsl #28
  94:	17100612 			; <UNDEFINED> instruction: 0x17100612
  98:	24020000 	strcs	r0, [r2], #-0
  9c:	3e0b0b00 	vmlacc.f64	d0, d11, d0
  a0:	000e030b 	andeq	r0, lr, fp, lsl #6
  a4:	00160300 	andseq	r0, r6, r0, lsl #6
  a8:	0b3a0e03 	bleq	e838bc <_stack+0xe038bc>
  ac:	13490b3b 	movtne	r0, #39739	; 0x9b3b
  b0:	24040000 	strcs	r0, [r4], #-0
  b4:	3e0b0b00 	vmlacc.f64	d0, d11, d0
  b8:	0008030b 	andeq	r0, r8, fp, lsl #6
  bc:	00350500 	eorseq	r0, r5, r0, lsl #10
  c0:	00001349 	andeq	r1, r0, r9, asr #6
  c4:	49002606 	stmdbmi	r0, {r1, r2, r9, sl, sp}
  c8:	07000013 	smladeq	r0, r3, r0, r0
  cc:	0b0b0113 	bleq	2c0520 <_stack+0x240520>
  d0:	0b3b0b3a 	bleq	ec2dc0 <_stack+0xe42dc0>
  d4:	00001301 	andeq	r1, r0, r1, lsl #6
  d8:	03000d08 	movweq	r0, #3336	; 0xd08
  dc:	3b0b3a0e 	blcc	2ce91c <_stack+0x24e91c>
  e0:	3813490b 	ldmdacc	r3, {r0, r1, r3, r8, fp, lr}
  e4:	0900000b 	stmdbeq	r0, {r0, r1, r3}
  e8:	0e030034 	mcreq	0, 0, r0, cr3, cr4, {1}
  ec:	0b3b0b3a 	bleq	ec2ddc <_stack+0xe42ddc>
  f0:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
  f4:	0f0a0000 	svceq	0x000a0000
  f8:	490b0b00 	stmdbmi	fp, {r8, r9, fp}
  fc:	0b000013 	bleq	150 <CPSR_IRQ_INHIBIT+0xd0>
 100:	193f002e 	ldmdbne	pc!, {r1, r2, r3, r5}	; <UNPREDICTABLE>
 104:	0b3a0e03 	bleq	e83918 <_stack+0xe03918>
 108:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 10c:	06120111 			; <UNDEFINED> instruction: 0x06120111
 110:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 114:	0c000019 	stceq	0, cr0, [r0], {25}
 118:	193f002e 	ldmdbne	pc!, {r1, r2, r3, r5}	; <UNPREDICTABLE>
 11c:	0b3a0e03 	bleq	e83930 <_stack+0xe03930>
 120:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 124:	01111349 	tsteq	r1, r9, asr #6
 128:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 12c:	00194297 	mulseq	r9, r7, r2
 130:	11010000 	mrsne	r0, (UNDEF: 1)
 134:	130e2501 	movwne	r2, #58625	; 0xe501
 138:	110e030b 	tstne	lr, fp, lsl #6
 13c:	10061201 	andne	r1, r6, r1, lsl #4
 140:	02000017 	andeq	r0, r0, #23
 144:	0b0b0024 	bleq	2c01dc <_stack+0x2401dc>
 148:	0e030b3e 	vmoveq.16	d3[0], r0
 14c:	16030000 	strne	r0, [r3], -r0
 150:	3a0e0300 	bcc	380d58 <_stack+0x300d58>
 154:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 158:	04000013 	streq	r0, [r0], #-19	; 0xffffffed
 15c:	0b0b0024 	bleq	2c01f4 <_stack+0x2401f4>
 160:	08030b3e 	stmdaeq	r3, {r1, r2, r3, r4, r5, r8, r9, fp}
 164:	35050000 	strcc	r0, [r5, #-0]
 168:	00134900 	andseq	r4, r3, r0, lsl #18
 16c:	01130600 	tsteq	r3, r0, lsl #12
 170:	0b3a0b0b 	bleq	e82da4 <_stack+0xe02da4>
 174:	13010b3b 	movwne	r0, #6971	; 0x1b3b
 178:	0d070000 	stceq	0, cr0, [r7, #-0]
 17c:	3a0e0300 	bcc	380d84 <_stack+0x300d84>
 180:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 184:	000b3813 	andeq	r3, fp, r3, lsl r8
 188:	00340800 	eorseq	r0, r4, r0, lsl #16
 18c:	0b3a0e03 	bleq	e839a0 <_stack+0xe039a0>
 190:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 194:	00001802 	andeq	r1, r0, r2, lsl #16
 198:	0b000f09 	bleq	3dc4 <CPSR_IRQ_INHIBIT+0x3d44>
 19c:	0013490b 	andseq	r4, r3, fp, lsl #18
 1a0:	002e0a00 	eoreq	r0, lr, r0, lsl #20
 1a4:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
 1a8:	0b3b0b3a 	bleq	ec2e98 <_stack+0xe42e98>
 1ac:	01111927 	tsteq	r1, r7, lsr #18
 1b0:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 1b4:	00194297 	mulseq	r9, r7, r2
 1b8:	012e0b00 			; <UNDEFINED> instruction: 0x012e0b00
 1bc:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
 1c0:	0b3b0b3a 	bleq	ec2eb0 <_stack+0xe42eb0>
 1c4:	06120111 			; <UNDEFINED> instruction: 0x06120111
 1c8:	42961840 	addsmi	r1, r6, #64, 16	; 0x400000
 1cc:	00130119 	andseq	r0, r3, r9, lsl r1
 1d0:	002e0c00 	eoreq	r0, lr, r0, lsl #24
 1d4:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
 1d8:	0b3b0b3a 	bleq	ec2ec8 <_stack+0xe42ec8>
 1dc:	13491927 	movtne	r1, #39207	; 0x9927
 1e0:	06120111 			; <UNDEFINED> instruction: 0x06120111
 1e4:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 1e8:	00000019 	andeq	r0, r0, r9, lsl r0
 1ec:	25011101 	strcs	r1, [r1, #-257]	; 0xfffffeff
 1f0:	030b130e 	movweq	r1, #45838	; 0xb30e
 1f4:	1201110e 	andne	r1, r1, #-2147483645	; 0x80000003
 1f8:	00171006 	andseq	r1, r7, r6
 1fc:	00240200 	eoreq	r0, r4, r0, lsl #4
 200:	0b3e0b0b 	bleq	f82e34 <_stack+0xf02e34>
 204:	00000e03 	andeq	r0, r0, r3, lsl #28
 208:	03001603 	movweq	r1, #1539	; 0x603
 20c:	3b0b3a0e 	blcc	2cea4c <_stack+0x24ea4c>
 210:	0013490b 	andseq	r4, r3, fp, lsl #18
 214:	00240400 	eoreq	r0, r4, r0, lsl #8
 218:	0b3e0b0b 	bleq	f82e4c <_stack+0xf02e4c>
 21c:	00000803 	andeq	r0, r0, r3, lsl #16
 220:	49003505 	stmdbmi	r0, {r0, r2, r8, sl, ip, sp}
 224:	06000013 			; <UNDEFINED> instruction: 0x06000013
 228:	13490026 	movtne	r0, #36902	; 0x9026
 22c:	13070000 	movwne	r0, #28672	; 0x7000
 230:	3a0b0b01 	bcc	2c2e3c <_stack+0x242e3c>
 234:	010b3b0b 	tsteq	fp, fp, lsl #22
 238:	08000013 	stmdaeq	r0, {r0, r1, r4}
 23c:	0e03000d 	cdpeq	0, 0, cr0, cr3, cr13, {0}
 240:	0b3b0b3a 	bleq	ec2f30 <_stack+0xe42f30>
 244:	0b381349 	bleq	e04f70 <_stack+0xd84f70>
 248:	34090000 	strcc	r0, [r9], #-0
 24c:	3a0e0300 	bcc	380e54 <_stack+0x300e54>
 250:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 254:	00180213 	andseq	r0, r8, r3, lsl r2
 258:	000f0a00 	andeq	r0, pc, r0, lsl #20
 25c:	13490b0b 	movtne	r0, #39691	; 0x9b0b
 260:	2e0b0000 	cdpcs	0, 0, cr0, cr11, cr0, {0}
 264:	03193f00 	tsteq	r9, #0, 30
 268:	3b0b3a0e 	blcc	2ceaa8 <_stack+0x24eaa8>
 26c:	1119270b 	tstne	r9, fp, lsl #14
 270:	40061201 	andmi	r1, r6, r1, lsl #4
 274:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 278:	2e0c0000 	cdpcs	0, 0, cr0, cr12, cr0, {0}
 27c:	03193f00 	tsteq	r9, #0, 30
 280:	3b0b3a0e 	blcc	2ceac0 <_stack+0x24eac0>
 284:	4919270b 	ldmdbmi	r9, {r0, r1, r3, r8, r9, sl, sp}
 288:	12011113 	andne	r1, r1, #-1073741820	; 0xc0000004
 28c:	97184006 	ldrls	r4, [r8, -r6]
 290:	00001942 	andeq	r1, r0, r2, asr #18
 294:	01110100 	tsteq	r1, r0, lsl #2
 298:	0b130e25 	bleq	4c3b34 <_stack+0x443b34>
 29c:	01110e03 	tsteq	r1, r3, lsl #28
 2a0:	17100612 			; <UNDEFINED> instruction: 0x17100612
 2a4:	24020000 	strcs	r0, [r2], #-0
 2a8:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 2ac:	000e030b 	andeq	r0, lr, fp, lsl #6
 2b0:	00160300 	andseq	r0, r6, r0, lsl #6
 2b4:	0b3a0e03 	bleq	e83ac8 <_stack+0xe03ac8>
 2b8:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 2bc:	24040000 	strcs	r0, [r4], #-0
 2c0:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 2c4:	0008030b 	andeq	r0, r8, fp, lsl #6
 2c8:	00350500 	eorseq	r0, r5, r0, lsl #10
 2cc:	00001349 	andeq	r1, r0, r9, asr #6
 2d0:	49002606 	stmdbmi	r0, {r1, r2, r9, sl, sp}
 2d4:	07000013 	smladeq	r0, r3, r0, r0
 2d8:	0b0b0113 	bleq	2c072c <_stack+0x24072c>
 2dc:	0b3b0b3a 	bleq	ec2fcc <_stack+0xe42fcc>
 2e0:	00001301 	andeq	r1, r0, r1, lsl #6
 2e4:	03000d08 	movweq	r0, #3336	; 0xd08
 2e8:	3b0b3a0e 	blcc	2ceb28 <_stack+0x24eb28>
 2ec:	3813490b 	ldmdacc	r3, {r0, r1, r3, r8, fp, lr}
 2f0:	0900000b 	stmdbeq	r0, {r0, r1, r3}
 2f4:	08030034 	stmdaeq	r3, {r2, r4, r5}
 2f8:	0b3b0b3a 	bleq	ec2fe8 <_stack+0xe42fe8>
 2fc:	193f1349 	ldmdbne	pc!, {r0, r3, r6, r8, r9, ip}	; <UNPREDICTABLE>
 300:	00001802 	andeq	r1, r0, r2, lsl #16
 304:	3f012e0a 	svccc	0x00012e0a
 308:	3a0e0319 	bcc	380f74 <_stack+0x300f74>
 30c:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 310:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 314:	96184006 	ldrls	r4, [r8], -r6
 318:	13011942 	movwne	r1, #6466	; 0x1942
 31c:	050b0000 	streq	r0, [fp, #-0]
 320:	3a080300 	bcc	200f28 <_stack+0x180f28>
 324:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 328:	00180213 	andseq	r0, r8, r3, lsl r2
 32c:	00050c00 	andeq	r0, r5, r0, lsl #24
 330:	0b3a0e03 	bleq	e83b44 <_stack+0xe03b44>
 334:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 338:	00001802 	andeq	r1, r0, r2, lsl #16
 33c:	0300340d 	movweq	r3, #1037	; 0x40d
 340:	3b0b3a0e 	blcc	2ceb80 <_stack+0x24eb80>
 344:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 348:	0e000018 	mcreq	0, 0, r0, cr0, cr8, {0}
 34c:	0b0b000f 	bleq	2c0390 <_stack+0x240390>
 350:	00001349 	andeq	r1, r0, r9, asr #6
 354:	00110100 	andseq	r0, r1, r0, lsl #2
 358:	01110610 	tsteq	r1, r0, lsl r6
 35c:	08030112 	stmdaeq	r3, {r1, r4, r8}
 360:	0825081b 	stmdaeq	r5!, {r0, r1, r3, r4, fp}
 364:	00000513 	andeq	r0, r0, r3, lsl r5
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	00000064 	andeq	r0, r0, r4, rrx
   4:	00440002 	subeq	r0, r4, r2
   8:	01020000 	mrseq	r0, (UNDEF: 2)
   c:	000d0efb 	strdeq	r0, [sp], -fp
  10:	01010101 	tsteq	r1, r1, lsl #2
  14:	01000000 	mrseq	r0, (UNDEF: 0)
  18:	2f010000 	svccs	0x00010000
  1c:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
  20:	6462612f 	strbtvs	r6, [r2], #-303	; 0xfffffed1
  24:	72616b69 	rsbvc	r6, r1, #107520	; 0x1a400
  28:	642f6d69 	strtvs	r6, [pc], #-3433	; 30 <CPSR_THUMB+0x10>
  2c:	4d2f7665 	stcmi	6, cr7, [pc, #-404]!	; fffffea0 <_stack+0xfff7fea0>
  30:	74694c79 	strbtvc	r4, [r9], #-3193	; 0xfffff387
  34:	4f656c74 	svcmi	0x00656c74
  38:	72732f53 	rsbsvc	r2, r3, #332	; 0x14c
  3c:	63000063 	movwvs	r0, #99	; 0x63
  40:	72617473 	rsbvc	r7, r1, #1929379840	; 0x73000000
  44:	2e707574 	mrccs	5, 3, r7, cr0, cr4, {3}
  48:	00010063 	andeq	r0, r1, r3, rrx
  4c:	05000000 	streq	r0, [r0, #-0]
  50:	00809402 	addeq	r9, r0, r2, lsl #8
  54:	4bbc1800 	blmi	fef0605c <_stack+0xfee8605c>
  58:	2f4a0b03 	svccs	0x004a0b03
  5c:	0200869d 	andeq	r8, r0, #164626432	; 0x9d00000
  60:	02850104 	addeq	r0, r5, #4, 2
  64:	01010006 	tsteq	r1, r6
  68:	000000fc 	strdeq	r0, [r0], -ip
  6c:	00e30002 	rsceq	r0, r3, r2
  70:	01020000 	mrseq	r0, (UNDEF: 2)
  74:	000d0efb 	strdeq	r0, [sp], -fp
  78:	01010101 	tsteq	r1, r1, lsl #2
  7c:	01000000 	mrseq	r0, (UNDEF: 0)
  80:	2f010000 	svccs	0x00010000
  84:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
  88:	6462612f 	strbtvs	r6, [r2], #-303	; 0xfffffed1
  8c:	72616b69 	rsbvc	r6, r1, #107520	; 0x1a400
  90:	642f6d69 	strtvs	r6, [pc], #-3433	; 98 <CPSR_IRQ_INHIBIT+0x18>
  94:	4d2f7665 	stcmi	6, cr7, [pc, #-404]!	; ffffff08 <_stack+0xfff7ff08>
  98:	74694c79 	strbtvc	r4, [r9], #-3193	; 0xfffff387
  9c:	4f656c74 	svcmi	0x00656c74
  a0:	72732f53 	rsbsvc	r2, r3, #332	; 0x14c
  a4:	752f0063 	strvc	r0, [pc, #-99]!	; 49 <CPSR_FIQ_INHIBIT+0x9>
  a8:	692f7273 	stmdbvs	pc!, {r0, r1, r4, r5, r6, r9, ip, sp, lr}	; <UNPREDICTABLE>
  ac:	756c636e 	strbvc	r6, [ip, #-878]!	; 0xfffffc92
  b0:	6e2f6564 	cfsh64vs	mvdx6, mvdx15, #52
  b4:	696c7765 	stmdbvs	ip!, {r0, r2, r5, r6, r8, r9, sl, ip, sp, lr}^
  b8:	616d2f62 	cmnvs	sp, r2, ror #30
  bc:	6e696863 	cdpvs	8, 6, cr6, cr9, cr3, {3}
  c0:	752f0065 	strvc	r0, [pc, #-101]!	; 63 <CPSR_FIQ_INHIBIT+0x23>
  c4:	692f7273 	stmdbvs	pc!, {r0, r1, r4, r5, r6, r9, ip, sp, lr}	; <UNPREDICTABLE>
  c8:	756c636e 	strbvc	r6, [ip, #-878]!	; 0xfffffc92
  cc:	6e2f6564 	cfsh64vs	mvdx6, mvdx15, #52
  d0:	696c7765 	stmdbvs	ip!, {r0, r2, r5, r6, r8, r9, sl, ip, sp, lr}^
  d4:	79732f62 	ldmdbvc	r3!, {r1, r5, r6, r8, r9, sl, fp, sp}^
  d8:	682f0073 	stmdavs	pc!, {r0, r1, r4, r5, r6}	; <UNPREDICTABLE>
  dc:	2f656d6f 	svccs	0x00656d6f
  e0:	69646261 	stmdbvs	r4!, {r0, r5, r6, r9, sp, lr}^
  e4:	6972616b 	ldmdbvs	r2!, {r0, r1, r3, r5, r6, r8, sp, lr}^
  e8:	65642f6d 	strbvs	r2, [r4, #-3949]!	; 0xfffff093
  ec:	794d2f76 	stmdbvc	sp, {r1, r2, r4, r5, r6, r8, r9, sl, fp, sp}^
  f0:	7474694c 	ldrbtvc	r6, [r4], #-2380	; 0xfffff6b4
  f4:	534f656c 	movtpl	r6, #62828	; 0xf56c
  f8:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
  fc:	2f2e2e2f 	svccs	0x002e2e2f
 100:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 104:	00656475 	rsbeq	r6, r5, r5, ror r4
 108:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
 10c:	6970672d 	ldmdbvs	r0!, {r0, r2, r3, r5, r8, r9, sl, sp, lr}^
 110:	00632e6f 	rsbeq	r2, r3, pc, ror #28
 114:	5f000001 	svcpl	0x00000001
 118:	61666564 	cmnvs	r6, r4, ror #10
 11c:	5f746c75 	svcpl	0x00746c75
 120:	65707974 	ldrbvs	r7, [r0, #-2420]!	; 0xfffff68c
 124:	00682e73 	rsbeq	r2, r8, r3, ror lr
 128:	5f000002 	svcpl	0x00000002
 12c:	69647473 	stmdbvs	r4!, {r0, r1, r4, r5, r6, sl, ip, sp, lr}^
 130:	682e746e 	stmdavs	lr!, {r1, r2, r3, r5, r6, sl, ip, sp, lr}
 134:	00000300 	andeq	r0, r0, r0, lsl #6
 138:	2d697072 	stclcs	0, cr7, [r9, #-456]!	; 0xfffffe38
 13c:	65736162 	ldrbvs	r6, [r3, #-354]!	; 0xfffffe9e
 140:	0400682e 	streq	r6, [r0], #-2094	; 0xfffff7d2
 144:	70720000 	rsbsvc	r0, r2, r0
 148:	70672d69 	rsbvc	r2, r7, r9, ror #26
 14c:	682e6f69 	stmdavs	lr!, {r0, r3, r5, r6, r8, r9, sl, fp, sp, lr}
 150:	00000400 	andeq	r0, r0, r0, lsl #8
 154:	02050000 	andeq	r0, r5, #0
 158:	00008100 	andeq	r8, r0, r0, lsl #2
 15c:	4b011003 	blmi	44170 <__bss_end__+0x3bd28>
 160:	024ca14b 	subeq	sl, ip, #-1073741806	; 0xc0000012
 164:	01010008 	tsteq	r1, r8
 168:	0000011f 	andeq	r0, r0, pc, lsl r1
 16c:	00e10002 	rsceq	r0, r1, r2
 170:	01020000 	mrseq	r0, (UNDEF: 2)
 174:	000d0efb 	strdeq	r0, [sp], -fp
 178:	01010101 	tsteq	r1, r1, lsl #2
 17c:	01000000 	mrseq	r0, (UNDEF: 0)
 180:	2f010000 	svccs	0x00010000
 184:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
 188:	6462612f 	strbtvs	r6, [r2], #-303	; 0xfffffed1
 18c:	72616b69 	rsbvc	r6, r1, #107520	; 0x1a400
 190:	642f6d69 	strtvs	r6, [pc], #-3433	; 198 <CPSR_IRQ_INHIBIT+0x118>
 194:	4d2f7665 	stcmi	6, cr7, [pc, #-404]!	; 8 <CPSR_MODE_USER-0x8>
 198:	74694c79 	strbtvc	r4, [r9], #-3193	; 0xfffff387
 19c:	4f656c74 	svcmi	0x00656c74
 1a0:	72732f53 	rsbsvc	r2, r3, #332	; 0x14c
 1a4:	752f0063 	strvc	r0, [pc, #-99]!	; 149 <CPSR_IRQ_INHIBIT+0xc9>
 1a8:	692f7273 	stmdbvs	pc!, {r0, r1, r4, r5, r6, r9, ip, sp, lr}	; <UNPREDICTABLE>
 1ac:	756c636e 	strbvc	r6, [ip, #-878]!	; 0xfffffc92
 1b0:	6e2f6564 	cfsh64vs	mvdx6, mvdx15, #52
 1b4:	696c7765 	stmdbvs	ip!, {r0, r2, r5, r6, r8, r9, sl, ip, sp, lr}^
 1b8:	616d2f62 	cmnvs	sp, r2, ror #30
 1bc:	6e696863 	cdpvs	8, 6, cr6, cr9, cr3, {3}
 1c0:	752f0065 	strvc	r0, [pc, #-101]!	; 163 <CPSR_IRQ_INHIBIT+0xe3>
 1c4:	692f7273 	stmdbvs	pc!, {r0, r1, r4, r5, r6, r9, ip, sp, lr}	; <UNPREDICTABLE>
 1c8:	756c636e 	strbvc	r6, [ip, #-878]!	; 0xfffffc92
 1cc:	6e2f6564 	cfsh64vs	mvdx6, mvdx15, #52
 1d0:	696c7765 	stmdbvs	ip!, {r0, r2, r5, r6, r8, r9, sl, ip, sp, lr}^
 1d4:	79732f62 	ldmdbvc	r3!, {r1, r5, r6, r8, r9, sl, fp, sp}^
 1d8:	682f0073 	stmdavs	pc!, {r0, r1, r4, r5, r6}	; <UNPREDICTABLE>
 1dc:	2f656d6f 	svccs	0x00656d6f
 1e0:	69646261 	stmdbvs	r4!, {r0, r5, r6, r9, sp, lr}^
 1e4:	6972616b 	ldmdbvs	r2!, {r0, r1, r3, r5, r6, r8, sp, lr}^
 1e8:	65642f6d 	strbvs	r2, [r4, #-3949]!	; 0xfffff093
 1ec:	794d2f76 	stmdbvc	sp, {r1, r2, r4, r5, r6, r8, r9, sl, fp, sp}^
 1f0:	7474694c 	ldrbtvc	r6, [r4], #-2380	; 0xfffff6b4
 1f4:	534f656c 	movtpl	r6, #62828	; 0xf56c
 1f8:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 1fc:	2f2e2e2f 	svccs	0x002e2e2f
 200:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 204:	00656475 	rsbeq	r6, r5, r5, ror r4
 208:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
 20c:	746e692d 	strbtvc	r6, [lr], #-2349	; 0xfffff6d3
 210:	75727265 	ldrbvc	r7, [r2, #-613]!	; 0xfffffd9b
 214:	2e737470 	mrccs	4, 3, r7, cr3, cr0, {3}
 218:	00010063 	andeq	r0, r1, r3, rrx
 21c:	65645f00 	strbvs	r5, [r4, #-3840]!	; 0xfffff100
 220:	6c756166 	ldfvse	f6, [r5], #-408	; 0xfffffe68
 224:	79745f74 	ldmdbvc	r4!, {r2, r4, r5, r6, r8, r9, sl, fp, ip, lr}^
 228:	2e736570 	mrccs	5, 3, r6, cr3, cr0, {3}
 22c:	00020068 	andeq	r0, r2, r8, rrx
 230:	74735f00 	ldrbtvc	r5, [r3], #-3840	; 0xfffff100
 234:	746e6964 	strbtvc	r6, [lr], #-2404	; 0xfffff69c
 238:	0300682e 	movweq	r6, #2094	; 0x82e
 23c:	70720000 	rsbsvc	r0, r2, r0
 240:	6e692d69 	cdpvs	13, 6, cr2, cr9, cr9, {3}
 244:	72726574 	rsbsvc	r6, r2, #116, 10	; 0x1d000000
 248:	73747075 	cmnvc	r4, #117	; 0x75
 24c:	0400682e 	streq	r6, [r0], #-2094	; 0xfffff7d2
 250:	00000000 	andeq	r0, r0, r0
 254:	813c0205 	teqhi	ip, r5, lsl #4
 258:	1c030000 	stcne	0, cr0, [r3], {-0}
 25c:	034b4b01 	movteq	r4, #47873	; 0xbb01
 260:	034c9e0b 	movteq	r9, #52747	; 0xce0b
 264:	02008209 	andeq	r8, r0, #-1879048192	; 0x90000000
 268:	034b0104 	movteq	r0, #45316	; 0xb104
 26c:	02002e0e 	andeq	r2, r0, #14, 28	; 0xe0
 270:	034b0104 	movteq	r0, #45316	; 0xb104
 274:	034c2e0e 	movteq	r2, #52750	; 0xce0e
 278:	034c820a 	movteq	r8, #49674	; 0xc20a
 27c:	bb85820b 	bllt	fe160ab0 <_stack+0xfe0e0ab0>
 280:	1c038484 	cfstrsne	mvf8, [r3], {132}	; 0x84
 284:	06023066 	streq	r3, [r2], -r6, rrx
 288:	ff010100 			; <UNDEFINED> instruction: 0xff010100
 28c:	02000000 	andeq	r0, r0, #0
 290:	0000e300 	andeq	lr, r0, r0, lsl #6
 294:	fb010200 	blx	40a9e <__bss_end__+0x38656>
 298:	01000d0e 	tsteq	r0, lr, lsl #26
 29c:	00010101 	andeq	r0, r1, r1, lsl #2
 2a0:	00010000 	andeq	r0, r1, r0
 2a4:	682f0100 	stmdavs	pc!, {r8}	; <UNPREDICTABLE>
 2a8:	2f656d6f 	svccs	0x00656d6f
 2ac:	69646261 	stmdbvs	r4!, {r0, r5, r6, r9, sp, lr}^
 2b0:	6972616b 	ldmdbvs	r2!, {r0, r1, r3, r5, r6, r8, sp, lr}^
 2b4:	65642f6d 	strbvs	r2, [r4, #-3949]!	; 0xfffff093
 2b8:	794d2f76 	stmdbvc	sp, {r1, r2, r4, r5, r6, r8, r9, sl, fp, sp}^
 2bc:	7474694c 	ldrbtvc	r6, [r4], #-2380	; 0xfffff6b4
 2c0:	534f656c 	movtpl	r6, #62828	; 0xf56c
 2c4:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 2c8:	73752f00 	cmnvc	r5, #0, 30
 2cc:	6e692f72 	mcrvs	15, 3, r2, cr9, cr2, {3}
 2d0:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xfffff39d
 2d4:	656e2f65 	strbvs	r2, [lr, #-3941]!	; 0xfffff09b
 2d8:	62696c77 	rsbvs	r6, r9, #30464	; 0x7700
 2dc:	63616d2f 	cmnvs	r1, #3008	; 0xbc0
 2e0:	656e6968 	strbvs	r6, [lr, #-2408]!	; 0xfffff698
 2e4:	73752f00 	cmnvc	r5, #0, 30
 2e8:	6e692f72 	mcrvs	15, 3, r2, cr9, cr2, {3}
 2ec:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xfffff39d
 2f0:	656e2f65 	strbvs	r2, [lr, #-3941]!	; 0xfffff09b
 2f4:	62696c77 	rsbvs	r6, r9, #30464	; 0x7700
 2f8:	7379732f 	cmnvc	r9, #-1140850688	; 0xbc000000
 2fc:	6f682f00 	svcvs	0x00682f00
 300:	612f656d 			; <UNDEFINED> instruction: 0x612f656d
 304:	6b696462 	blvs	1a59494 <_stack+0x19d9494>
 308:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
 30c:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
 310:	4c794d2f 	ldclmi	13, cr4, [r9], #-188	; 0xffffff44
 314:	6c747469 	cfldrdvs	mvd7, [r4], #-420	; 0xfffffe5c
 318:	2f534f65 	svccs	0x00534f65
 31c:	2f637273 	svccs	0x00637273
 320:	692f2e2e 	stmdbvs	pc!, {r1, r2, r3, r5, r9, sl, fp, sp}	; <UNPREDICTABLE>
 324:	756c636e 	strbvc	r6, [ip, #-878]!	; 0xfffffc92
 328:	00006564 	andeq	r6, r0, r4, ror #10
 32c:	2d697072 	stclcs	0, cr7, [r9, #-456]!	; 0xfffffe38
 330:	74726175 	ldrbtvc	r6, [r2], #-373	; 0xfffffe8b
 334:	0100632e 	tsteq	r0, lr, lsr #6
 338:	645f0000 	ldrbvs	r0, [pc], #-0	; 340 <CPSR_IRQ_INHIBIT+0x2c0>
 33c:	75616665 	strbvc	r6, [r1, #-1637]!	; 0xfffff99b
 340:	745f746c 	ldrbvc	r7, [pc], #-1132	; 348 <CPSR_IRQ_INHIBIT+0x2c8>
 344:	73657079 	cmnvc	r5, #121	; 0x79
 348:	0200682e 	andeq	r6, r0, #3014656	; 0x2e0000
 34c:	735f0000 	cmpvc	pc, #0
 350:	6e696474 	mcrvs	4, 3, r6, cr9, cr4, {3}
 354:	00682e74 	rsbeq	r2, r8, r4, ror lr
 358:	72000003 	andvc	r0, r0, #3
 35c:	622d6970 	eorvs	r6, sp, #112, 18	; 0x1c0000
 360:	2e657361 	cdpcs	3, 6, cr7, cr5, cr1, {3}
 364:	00040068 	andeq	r0, r4, r8, rrx
 368:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
 36c:	7261752d 	rsbvc	r7, r1, #188743680	; 0xb400000
 370:	00682e74 	rsbeq	r2, r8, r4, ror lr
 374:	00000004 	andeq	r0, r0, r4
 378:	24020500 	strcs	r0, [r2], #-1280	; 0xfffffb00
 37c:	03000082 	movweq	r0, #130	; 0x82
 380:	4b4b0111 	blmi	12c07cc <_stack+0x12407cc>
 384:	a14b4ba1 	smlaltbge	r4, fp, r1, fp
 388:	0008024c 	andeq	r0, r8, ip, asr #4
 38c:	013c0101 	teqeq	ip, r1, lsl #2
 390:	00020000 	andeq	r0, r2, r0
 394:	000000f3 	strdeq	r0, [r0], -r3
 398:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 39c:	0101000d 	tsteq	r1, sp
 3a0:	00000101 	andeq	r0, r0, r1, lsl #2
 3a4:	00000100 	andeq	r0, r0, r0, lsl #2
 3a8:	6f682f01 	svcvs	0x00682f01
 3ac:	612f656d 			; <UNDEFINED> instruction: 0x612f656d
 3b0:	6b696462 	blvs	1a59540 <_stack+0x19d9540>
 3b4:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
 3b8:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
 3bc:	4c794d2f 	ldclmi	13, cr4, [r9], #-188	; 0xffffff44
 3c0:	6c747469 	cfldrdvs	mvd7, [r4], #-420	; 0xfffffe5c
 3c4:	2f534f65 	svccs	0x00534f65
 3c8:	00637273 	rsbeq	r7, r3, r3, ror r2
 3cc:	7273752f 	rsbsvc	r7, r3, #197132288	; 0xbc00000
 3d0:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 3d4:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0xfffffa94
 3d8:	77656e2f 	strbvc	r6, [r5, -pc, lsr #28]!
 3dc:	2f62696c 	svccs	0x0062696c
 3e0:	6863616d 	stmdavs	r3!, {r0, r2, r3, r5, r6, r8, sp, lr}^
 3e4:	00656e69 	rsbeq	r6, r5, r9, ror #28
 3e8:	7273752f 	rsbsvc	r7, r3, #197132288	; 0xbc00000
 3ec:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 3f0:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0xfffffa94
 3f4:	77656e2f 	strbvc	r6, [r5, -pc, lsr #28]!
 3f8:	2f62696c 	svccs	0x0062696c
 3fc:	00737973 	rsbseq	r7, r3, r3, ror r9
 400:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; 34c <CPSR_IRQ_INHIBIT+0x2cc>
 404:	62612f65 	rsbvs	r2, r1, #404	; 0x194
 408:	616b6964 	cmnvs	fp, r4, ror #18
 40c:	2f6d6972 	svccs	0x006d6972
 410:	2f766564 	svccs	0x00766564
 414:	694c794d 	stmdbvs	ip, {r0, r2, r3, r6, r8, fp, ip, sp, lr}^
 418:	656c7474 	strbvs	r7, [ip, #-1140]!	; 0xfffffb8c
 41c:	732f534f 			; <UNDEFINED> instruction: 0x732f534f
 420:	2e2f6372 	mcrcs	3, 1, r6, cr15, cr2, {3}
 424:	6e692f2e 	cdpvs	15, 6, cr2, cr9, cr14, {1}
 428:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xfffff39d
 42c:	75000065 	strvc	r0, [r0, #-101]	; 0xffffff9b
 430:	4b747261 	blmi	1d1cdbc <_stack+0x1c9cdbc>
 434:	656e7265 	strbvs	r7, [lr, #-613]!	; 0xfffffd9b
 438:	00632e6c 	rsbeq	r2, r3, ip, ror #28
 43c:	5f000001 	svcpl	0x00000001
 440:	61666564 	cmnvs	r6, r4, ror #10
 444:	5f746c75 	svcpl	0x00746c75
 448:	65707974 	ldrbvs	r7, [r0, #-2420]!	; 0xfffff68c
 44c:	00682e73 	rsbeq	r2, r8, r3, ror lr
 450:	5f000002 	svcpl	0x00000002
 454:	69647473 	stmdbvs	r4!, {r0, r1, r4, r5, r6, sl, ip, sp, lr}^
 458:	682e746e 	stmdavs	lr!, {r1, r2, r3, r5, r6, sl, ip, sp, lr}
 45c:	00000300 	andeq	r0, r0, r0, lsl #6
 460:	2d697072 	stclcs	0, cr7, [r9, #-456]!	; 0xfffffe38
 464:	65736162 	ldrbvs	r6, [r3, #-354]!	; 0xfffffe9e
 468:	0400682e 	streq	r6, [r0], #-2094	; 0xfffff7d2
 46c:	70720000 	rsbsvc	r0, r2, r0
 470:	61752d69 	cmnvs	r5, r9, ror #26
 474:	682e7472 	stmdavs	lr!, {r1, r4, r5, r6, sl, ip, sp, lr}
 478:	00000400 	andeq	r0, r0, r0, lsl #8
 47c:	2d697072 	stclcs	0, cr7, [r9, #-456]!	; 0xfffffe38
 480:	6f697067 	svcvs	0x00697067
 484:	0400682e 	streq	r6, [r0], #-2094	; 0xfffff7d2
 488:	00000000 	andeq	r0, r0, r0
 48c:	82840205 	addhi	r0, r4, #1342177280	; 0x50000000
 490:	12030000 	andne	r0, r3, #0
 494:	4c4bbc01 	mcrrmi	12, 0, fp, fp, cr1
 498:	676767a0 	strbvs	r6, [r7, -r0, lsr #15]!
 49c:	9f836867 	svcls	0x00836867
 4a0:	859f9f9f 	ldrhi	r9, [pc, #3999]	; 1447 <CPSR_IRQ_INHIBIT+0x13c7>
 4a4:	04020069 	streq	r0, [r2], #-105	; 0xffffff97
 4a8:	00820603 	addeq	r0, r2, r3, lsl #12
 4ac:	9e010402 	cdpls	4, 0, cr0, cr1, cr2, {0}
 4b0:	00698506 	rsbeq	r8, r9, r6, lsl #10
 4b4:	06030402 	streq	r0, [r3], -r2, lsl #8
 4b8:	04020082 	streq	r0, [r2], #-130	; 0xffffff7e
 4bc:	85069e01 	strhi	r9, [r6, #-3585]	; 0xfffff1ff
 4c0:	31a16969 			; <UNDEFINED> instruction: 0x31a16969
 4c4:	01040200 	mrseq	r0, R12_usr
 4c8:	00060268 	andeq	r0, r6, r8, ror #4
 4cc:	00750101 	rsbseq	r0, r5, r1, lsl #2
 4d0:	00020000 	andeq	r0, r2, r0
 4d4:	00000041 	andeq	r0, r0, r1, asr #32
 4d8:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 4dc:	0101000d 	tsteq	r1, sp
 4e0:	00000101 	andeq	r0, r0, r1, lsl #2
 4e4:	00000100 	andeq	r0, r0, r0, lsl #2
 4e8:	6f682f01 	svcvs	0x00682f01
 4ec:	612f656d 			; <UNDEFINED> instruction: 0x612f656d
 4f0:	6b696462 	blvs	1a59680 <_stack+0x19d9680>
 4f4:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
 4f8:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
 4fc:	4c794d2f 	ldclmi	13, cr4, [r9], #-188	; 0xffffff44
 500:	6c747469 	cfldrdvs	mvd7, [r4], #-420	; 0xfffffe5c
 504:	2f534f65 	svccs	0x00534f65
 508:	00637273 	rsbeq	r7, r3, r3, ror r2
 50c:	61747300 	cmnvs	r4, r0, lsl #6
 510:	732e7472 			; <UNDEFINED> instruction: 0x732e7472
 514:	00000100 	andeq	r0, r0, r0, lsl #2
 518:	02050000 	andeq	r0, r5, #0
 51c:	00008000 	andeq	r8, r0, r0
 520:	2f011603 	svccs	0x00011603
 524:	2f2f2f2f 	svccs	0x002f2f2f
 528:	0f032f2f 	svceq	0x00032f2f
 52c:	2f2f2008 	svccs	0x002f2008
 530:	322f2f2f 	eorcc	r2, pc, #47, 30	; 0xbc
 534:	2f342f2f 	svccs	0x00342f2f
 538:	33313135 	teqcc	r1, #1073741837	; 0x4000000d
 53c:	2f31312f 	svccs	0x0031312f
 540:	0202302f 	andeq	r3, r2, #47	; 0x2f
 544:	Address 0x0000000000000544 is out of bounds.


Disassembly of section .debug_frame:

00000000 <.debug_frame>:
   0:	0000000c 	andeq	r0, r0, ip
   4:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
   8:	7c020001 	stcvc	0, cr0, [r2], {1}
   c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  10:	00000018 	andeq	r0, r0, r8, lsl r0
  14:	00000000 	andeq	r0, r0, r0
  18:	00008094 	muleq	r0, r4, r0
  1c:	0000006c 	andeq	r0, r0, ip, rrx
  20:	8b080e42 	blhi	203930 <_stack+0x183930>
  24:	42018e02 	andmi	r8, r1, #2, 28
  28:	00040b0c 	andeq	r0, r4, ip, lsl #22
  2c:	0000000c 	andeq	r0, r0, ip
  30:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  34:	7c020001 	stcvc	0, cr0, [r2], {1}
  38:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  3c:	0000001c 	andeq	r0, r0, ip, lsl r0
  40:	0000002c 	andeq	r0, r0, ip, lsr #32
  44:	00008100 	andeq	r8, r0, r0, lsl #2
  48:	00000024 	andeq	r0, r0, r4, lsr #32
  4c:	8b040e42 	blhi	10395c <_stack+0x8395c>
  50:	0b0d4201 	bleq	35085c <_stack+0x2d085c>
  54:	420d0d48 	andmi	r0, sp, #72, 26	; 0x1200
  58:	00000ecb 	andeq	r0, r0, fp, asr #29
  5c:	0000001c 	andeq	r0, r0, ip, lsl r0
  60:	0000002c 	andeq	r0, r0, ip, lsr #32
  64:	00008124 	andeq	r8, r0, r4, lsr #2
  68:	00000018 	andeq	r0, r0, r8, lsl r0
  6c:	8b040e42 	blhi	10397c <_stack+0x8397c>
  70:	0b0d4201 	bleq	35087c <_stack+0x2d087c>
  74:	420d0d44 	andmi	r0, sp, #68, 26	; 0x1100
  78:	00000ecb 	andeq	r0, r0, fp, asr #29
  7c:	0000000c 	andeq	r0, r0, ip
  80:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  84:	7c020001 	stcvc	0, cr0, [r2], {1}
  88:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  8c:	0000001c 	andeq	r0, r0, ip, lsl r0
  90:	0000007c 	andeq	r0, r0, ip, ror r0
  94:	0000813c 	andeq	r8, r0, ip, lsr r1
  98:	00000024 	andeq	r0, r0, r4, lsr #32
  9c:	8b040e42 	blhi	1039ac <_stack+0x839ac>
  a0:	0b0d4201 	bleq	3508ac <_stack+0x2d08ac>
  a4:	420d0d48 	andmi	r0, sp, #72, 26	; 0x1200
  a8:	00000ecb 	andeq	r0, r0, fp, asr #29
  ac:	0000001c 	andeq	r0, r0, ip, lsl r0
  b0:	0000007c 	andeq	r0, r0, ip, ror r0
  b4:	00008160 	andeq	r8, r0, r0, ror #2
  b8:	00000018 	andeq	r0, r0, r8, lsl r0
  bc:	8b040e42 	blhi	1039cc <_stack+0x839cc>
  c0:	0b0d4201 	bleq	3508cc <_stack+0x2d08cc>
  c4:	420d0d44 	andmi	r0, sp, #68, 26	; 0x1100
  c8:	00000ecb 	andeq	r0, r0, fp, asr #29
  cc:	00000014 	andeq	r0, r0, r4, lsl r0
  d0:	0000007c 	andeq	r0, r0, ip, ror r0
  d4:	00008178 	andeq	r8, r0, r8, ror r1
  d8:	0000000c 	andeq	r0, r0, ip
  dc:	8b040e42 	blhi	1039ec <_stack+0x839ec>
  e0:	0b0d4201 	bleq	3508ec <_stack+0x2d08ec>
  e4:	00000014 	andeq	r0, r0, r4, lsl r0
  e8:	0000007c 	andeq	r0, r0, ip, ror r0
  ec:	00008184 	andeq	r8, r0, r4, lsl #3
  f0:	0000000c 	andeq	r0, r0, ip
  f4:	8b040e42 	blhi	103a04 <_stack+0x83a04>
  f8:	0b0d4201 	bleq	350904 <_stack+0x2d0904>
  fc:	0000001c 	andeq	r0, r0, ip, lsl r0
 100:	0000007c 	andeq	r0, r0, ip, ror r0
 104:	00008190 	muleq	r0, r0, r1
 108:	00000018 	andeq	r0, r0, r8, lsl r0
 10c:	8b040e42 	blhi	103a1c <_stack+0x83a1c>
 110:	0b0d4201 	bleq	35091c <_stack+0x2d091c>
 114:	420d0d44 	andmi	r0, sp, #68, 26	; 0x1100
 118:	00000ecb 	andeq	r0, r0, fp, asr #29
 11c:	0000001c 	andeq	r0, r0, ip, lsl r0
 120:	0000007c 	andeq	r0, r0, ip, ror r0
 124:	000081a8 	andeq	r8, r0, r8, lsr #3
 128:	00000018 	andeq	r0, r0, r8, lsl r0
 12c:	8b040e42 	blhi	103a3c <_stack+0x83a3c>
 130:	0b0d4201 	bleq	35093c <_stack+0x2d093c>
 134:	420d0d44 	andmi	r0, sp, #68, 26	; 0x1100
 138:	00000ecb 	andeq	r0, r0, fp, asr #29
 13c:	00000028 	andeq	r0, r0, r8, lsr #32
 140:	0000007c 	andeq	r0, r0, ip, ror r0
 144:	000081c0 	andeq	r8, r0, r0, asr #3
 148:	00000054 	andeq	r0, r0, r4, asr r0
 14c:	801c0e44 	andshi	r0, ip, r4, asr #28
 150:	82068107 	andhi	r8, r6, #-1073741823	; 0xc0000001
 154:	8b048305 	blhi	120d70 <_stack+0xa0d70>
 158:	8e028c03 	cdphi	12, 0, cr8, cr2, cr3, {0}
 15c:	0b0c4201 	bleq	310968 <_stack+0x290968>
 160:	0d0c6204 	sfmeq	f6, 4, [ip, #-16]
 164:	0000001c 	andeq	r0, r0, ip, lsl r0
 168:	00000014 	andeq	r0, r0, r4, lsl r0
 16c:	0000007c 	andeq	r0, r0, ip, ror r0
 170:	00008214 	andeq	r8, r0, r4, lsl r2
 174:	00000010 	andeq	r0, r0, r0, lsl r0
 178:	040b0c42 	streq	r0, [fp], #-3138	; 0xfffff3be
 17c:	000d0c44 	andeq	r0, sp, r4, asr #24
 180:	0000000c 	andeq	r0, r0, ip
 184:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 188:	7c020001 	stcvc	0, cr0, [r2], {1}
 18c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 190:	0000001c 	andeq	r0, r0, ip, lsl r0
 194:	00000180 	andeq	r0, r0, r0, lsl #3
 198:	00008224 	andeq	r8, r0, r4, lsr #4
 19c:	00000024 	andeq	r0, r0, r4, lsr #32
 1a0:	8b040e42 	blhi	103ab0 <_stack+0x83ab0>
 1a4:	0b0d4201 	bleq	3509b0 <_stack+0x2d09b0>
 1a8:	420d0d48 	andmi	r0, sp, #72, 26	; 0x1200
 1ac:	00000ecb 	andeq	r0, r0, fp, asr #29
 1b0:	0000001c 	andeq	r0, r0, ip, lsl r0
 1b4:	00000180 	andeq	r0, r0, r0, lsl #3
 1b8:	00008248 	andeq	r8, r0, r8, asr #4
 1bc:	00000024 	andeq	r0, r0, r4, lsr #32
 1c0:	8b040e42 	blhi	103ad0 <_stack+0x83ad0>
 1c4:	0b0d4201 	bleq	3509d0 <_stack+0x2d09d0>
 1c8:	420d0d48 	andmi	r0, sp, #72, 26	; 0x1200
 1cc:	00000ecb 	andeq	r0, r0, fp, asr #29
 1d0:	0000001c 	andeq	r0, r0, ip, lsl r0
 1d4:	00000180 	andeq	r0, r0, r0, lsl #3
 1d8:	0000826c 	andeq	r8, r0, ip, ror #4
 1dc:	00000018 	andeq	r0, r0, r8, lsl r0
 1e0:	8b040e42 	blhi	103af0 <_stack+0x83af0>
 1e4:	0b0d4201 	bleq	3509f0 <_stack+0x2d09f0>
 1e8:	420d0d44 	andmi	r0, sp, #68, 26	; 0x1100
 1ec:	00000ecb 	andeq	r0, r0, fp, asr #29
 1f0:	0000000c 	andeq	r0, r0, ip
 1f4:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 1f8:	7c020001 	stcvc	0, cr0, [r2], {1}
 1fc:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 200:	00000018 	andeq	r0, r0, r8, lsl r0
 204:	000001f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>
 208:	00008284 	andeq	r8, r0, r4, lsl #5
 20c:	000001b0 			; <UNDEFINED> instruction: 0x000001b0
 210:	8b080e42 	blhi	203b20 <_stack+0x183b20>
 214:	42018e02 	andmi	r8, r1, #2, 28
 218:	00040b0c 	andeq	r0, r4, ip, lsl #22

Disassembly of section .debug_str:

00000000 <.debug_str>:
   0:	73625f5f 	cmnvc	r2, #380	; 0x17c
   4:	6e655f73 	mcrvs	15, 3, r5, cr5, cr3, {3}
   8:	005f5f64 	subseq	r5, pc, r4, ror #30
   c:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; ffffff58 <_stack+0xfff7ff58>
  10:	62612f65 	rsbvs	r2, r1, #404	; 0x194
  14:	616b6964 	cmnvs	fp, r4, ror #18
  18:	2f6d6972 	svccs	0x006d6972
  1c:	2f766564 	svccs	0x00766564
  20:	694c794d 	stmdbvs	ip, {r0, r2, r3, r6, r8, fp, ip, sp, lr}^
  24:	656c7474 	strbvs	r7, [ip, #-1140]!	; 0xfffffb8c
  28:	732f534f 			; <UNDEFINED> instruction: 0x732f534f
  2c:	632f6372 			; <UNDEFINED> instruction: 0x632f6372
  30:	72617473 	rsbvc	r7, r1, #1929379840	; 0x73000000
  34:	2e707574 	mrccs	5, 3, r7, cr0, cr4, {3}
  38:	635f0063 	cmpvs	pc, #99	; 0x63
  3c:	72617473 	rsbvc	r7, r1, #1929379840	; 0x73000000
  40:	00707574 	rsbseq	r7, r0, r4, ror r5
  44:	20554e47 	subscs	r4, r5, r7, asr #28
  48:	20313143 	eorscs	r3, r1, r3, asr #2
  4c:	2e332e36 	mrccs	14, 1, r2, cr3, cr6, {1}
  50:	30322031 	eorscc	r2, r2, r1, lsr r0
  54:	36303731 			; <UNDEFINED> instruction: 0x36303731
  58:	2d203032 	stccs	0, cr3, [r0, #-200]!	; 0xffffff38
  5c:	6f6c666d 	svcvs	0x006c666d
  60:	612d7461 			; <UNDEFINED> instruction: 0x612d7461
  64:	683d6962 	ldmdavs	sp!, {r1, r5, r6, r8, fp, sp, lr}
  68:	20647261 	rsbcs	r7, r4, r1, ror #4
  6c:	70666d2d 	rsbvc	r6, r6, sp, lsr #26
  70:	66763d75 			; <UNDEFINED> instruction: 0x66763d75
  74:	6d2d2070 	stcvs	0, cr2, [sp, #-448]!	; 0xfffffe40
  78:	68637261 	stmdavs	r3!, {r0, r5, r6, r9, ip, sp, lr}^
  7c:	6d72613d 	ldfvse	f6, [r2, #-244]!	; 0xffffff0c
  80:	6b7a3676 	blvs	1e8da60 <_stack+0x1e0da60>
  84:	746d2d20 	strbtvc	r2, [sp], #-3360	; 0xfffff2e0
  88:	3d656e75 	stclcc	14, cr6, [r5, #-468]!	; 0xfffffe2c
  8c:	316d7261 	cmncc	sp, r1, ror #4
  90:	6a363731 	bvs	d8dd5c <_stack+0xd0dd5c>
  94:	732d667a 			; <UNDEFINED> instruction: 0x732d667a
  98:	20672d20 	rsbcs	r2, r7, r0, lsr #26
  9c:	00304f2d 	eorseq	r4, r0, sp, lsr #30
  a0:	5f737362 	svcpl	0x00737362
  a4:	00646e65 	rsbeq	r6, r4, r5, ror #28
  a8:	73625f5f 	cmnvc	r2, #380	; 0x17c
  ac:	74735f73 	ldrbtvc	r5, [r3], #-3955	; 0xfffff08d
  b0:	5f747261 	svcpl	0x00747261
  b4:	5047005f 	subpl	r0, r7, pc, asr r0
  b8:	30544553 	subscc	r4, r4, r3, asr r5
  bc:	53504700 	cmppl	r0, #0, 14
  c0:	00315445 	eorseq	r5, r1, r5, asr #8
  c4:	53465047 	movtpl	r5, #24647	; 0x6047
  c8:	00304c45 	eorseq	r4, r0, r5, asr #24
  cc:	53465047 	movtpl	r5, #24647	; 0x6047
  d0:	00314c45 	eorseq	r4, r1, r5, asr #24
  d4:	53465047 	movtpl	r5, #24647	; 0x6047
  d8:	00324c45 	eorseq	r4, r2, r5, asr #24
  dc:	53465047 	movtpl	r5, #24647	; 0x6047
  e0:	00334c45 	eorseq	r4, r3, r5, asr #24
  e4:	53465047 	movtpl	r5, #24647	; 0x6047
  e8:	00344c45 	eorseq	r4, r4, r5, asr #24
  ec:	53465047 	movtpl	r5, #24647	; 0x6047
  f0:	00354c45 	eorseq	r4, r5, r5, asr #24
  f4:	45465047 	strbmi	r5, [r6, #-71]	; 0xffffffb9
  f8:	7300314e 	movwvc	r3, #334	; 0x14e
  fc:	74726f68 	ldrbtvc	r6, [r2], #-3944	; 0xfffff098
 100:	746e6920 	strbtvc	r6, [lr], #-2336	; 0xfffff6e0
 104:	50504700 	subspl	r4, r0, r0, lsl #14
 108:	4c434455 	cfstrdmi	mvd4, [r3], {85}	; 0x55
 10c:	4700304b 	strmi	r3, [r0, -fp, asr #32]
 110:	44555050 	ldrbmi	r5, [r5], #-80	; 0xffffffb0
 114:	314b4c43 	cmpcc	fp, r3, asr #24
 118:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
 11c:	6970475f 	ldmdbvs	r0!, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
 120:	696e496f 	stmdbvs	lr!, {r0, r1, r2, r3, r5, r6, r8, fp, lr}^
 124:	5f5f0074 	svcpl	0x005f0074
 128:	746e6975 	strbtvc	r6, [lr], #-2421	; 0xfffff68b
 12c:	745f3233 	ldrbvc	r3, [pc], #-563	; 134 <CPSR_IRQ_INHIBIT+0xb4>
 130:	52504700 	subspl	r4, r0, #0, 14
 134:	00304e45 	eorseq	r4, r0, r5, asr #28
 138:	45525047 	ldrbmi	r5, [r2, #-71]	; 0xffffffb9
 13c:	5200314e 	andpl	r3, r0, #-2147483629	; 0x80000013
 140:	72657365 	rsbvc	r7, r5, #-1811939327	; 0x94000001
 144:	30646576 	rsbcc	r6, r4, r6, ror r5
 148:	73655200 	cmnvc	r5, #0, 4
 14c:	65767265 	ldrbvs	r7, [r6, #-613]!	; 0xfffffd9b
 150:	52003164 	andpl	r3, r0, #100, 2
 154:	72657365 	rsbvc	r7, r5, #-1811939327	; 0x94000001
 158:	32646576 	rsbcc	r6, r4, #494927872	; 0x1d800000
 15c:	73655200 	cmnvc	r5, #0, 4
 160:	65767265 	ldrbvs	r7, [r6, #-613]!	; 0xfffffd9b
 164:	52003364 	andpl	r3, r0, #100, 6	; 0x90000001
 168:	72657365 	rsbvc	r7, r5, #-1811939327	; 0x94000001
 16c:	35646576 	strbcc	r6, [r4, #-1398]!	; 0xfffffa8a
 170:	45504700 	ldrbmi	r4, [r0, #-1792]	; 0xfffff900
 174:	00305344 	eorseq	r5, r0, r4, asr #6
 178:	44455047 	strbmi	r5, [r5], #-71	; 0xffffffb9
 17c:	52003153 	andpl	r3, r0, #-1073741804	; 0xc0000014
 180:	72657365 	rsbvc	r7, r5, #-1811939327	; 0x94000001
 184:	38646576 	stmdacc	r4!, {r1, r2, r4, r5, r6, r8, sl, sp, lr}^
 188:	73655200 	cmnvc	r5, #0, 4
 18c:	65767265 	ldrbvs	r7, [r6, #-613]!	; 0xfffffd9b
 190:	47003964 	strmi	r3, [r0, -r4, ror #18]
 194:	4e454c50 	mcrmi	12, 2, r4, cr5, cr0, {2}
 198:	6f6c0030 	svcvs	0x006c0030
 19c:	6c20676e 	stcvs	7, cr6, [r0], #-440	; 0xfffffe48
 1a0:	20676e6f 	rsbcs	r6, r7, pc, ror #28
 1a4:	00746e69 	rsbseq	r6, r4, r9, ror #28
 1a8:	55505047 	ldrbpl	r5, [r0, #-71]	; 0xffffffb9
 1ac:	50520044 	subspl	r0, r2, r4, asr #32
 1b0:	65475f49 	strbvs	r5, [r7, #-3913]	; 0xfffff0b7
 1b4:	69704774 	ldmdbvs	r0!, {r2, r4, r5, r6, r8, r9, sl, lr}^
 1b8:	5047006f 	subpl	r0, r7, pc, rrx
 1bc:	4e454641 	cdpmi	6, 4, cr4, cr5, cr1, {2}
 1c0:	50470030 	subpl	r0, r7, r0, lsr r0
 1c4:	4e454641 	cdpmi	6, 4, cr4, cr5, cr1, {2}
 1c8:	6e750031 	mrcvs	0, 3, r0, cr5, cr1, {1}
 1cc:	6e676973 			; <UNDEFINED> instruction: 0x6e676973
 1d0:	63206465 			; <UNDEFINED> instruction: 0x63206465
 1d4:	00726168 	rsbseq	r6, r2, r8, ror #2
 1d8:	676e6f6c 	strbvs	r6, [lr, -ip, ror #30]!
 1dc:	6e6f6c20 	cdpvs	12, 6, cr6, cr15, cr0, {1}
 1e0:	6e752067 	cdpvs	0, 7, cr2, cr5, cr7, {3}
 1e4:	6e676973 			; <UNDEFINED> instruction: 0x6e676973
 1e8:	69206465 	stmdbvs	r0!, {r0, r2, r5, r6, sl, sp, lr}
 1ec:	4700746e 	strmi	r7, [r0, -lr, ror #8]
 1f0:	524c4350 	subpl	r4, ip, #80, 6	; 0x40000001
 1f4:	70720031 	rsbsvc	r0, r2, r1, lsr r0
 1f8:	65725f69 	ldrbvs	r5, [r2, #-3945]!	; 0xfffff097
 1fc:	6f725f67 	svcvs	0x00725f67
 200:	4700745f 	smlsdmi	r0, pc, r4, r7	; <UNPREDICTABLE>
 204:	45524150 	ldrbmi	r4, [r2, #-336]	; 0xfffffeb0
 208:	4700314e 	strmi	r3, [r0, -lr, asr #2]
 20c:	4e454850 	mcrmi	8, 2, r4, cr5, cr0, {2}
 210:	50470030 	subpl	r0, r7, r0, lsr r0
 214:	314e4548 	cmpcc	lr, r8, asr #10
 218:	73655200 	cmnvc	r5, #0, 4
 21c:	65767265 	ldrbvs	r7, [r6, #-613]!	; 0xfffffd9b
 220:	00303164 	eorseq	r3, r0, r4, ror #2
 224:	65736552 	ldrbvs	r6, [r3, #-1362]!	; 0xfffffaae
 228:	64657672 	strbtvs	r7, [r5], #-1650	; 0xfffff98e
 22c:	47003131 	smladxmi	r0, r1, r1, r3
 230:	45524150 	ldrbmi	r4, [r2, #-336]	; 0xfffffeb0
 234:	7300304e 	movwvc	r3, #78	; 0x4e
 238:	74726f68 	ldrbtvc	r6, [r2], #-3944	; 0xfffff098
 23c:	736e7520 	cmnvc	lr, #32, 10	; 0x8000000
 240:	656e6769 	strbvs	r6, [lr, #-1897]!	; 0xfffff897
 244:	6e692064 	cdpvs	0, 6, cr2, cr9, cr4, {3}
 248:	50470074 	subpl	r0, r7, r4, ror r0
 24c:	314e454c 	cmpcc	lr, ip, asr #10
 250:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
 254:	6765725f 			; <UNDEFINED> instruction: 0x6765725f
 258:	5f77725f 	svcpl	0x0077725f
 25c:	682f0074 	stmdavs	pc!, {r2, r4, r5, r6}	; <UNPREDICTABLE>
 260:	2f656d6f 	svccs	0x00656d6f
 264:	69646261 	stmdbvs	r4!, {r0, r5, r6, r9, sp, lr}^
 268:	6972616b 	ldmdbvs	r2!, {r0, r1, r3, r5, r6, r8, sp, lr}^
 26c:	65642f6d 	strbvs	r2, [r4, #-3949]!	; 0xfffff093
 270:	794d2f76 	stmdbvc	sp, {r1, r2, r4, r5, r6, r8, r9, sl, fp, sp}^
 274:	7474694c 	ldrbtvc	r6, [r4], #-2380	; 0xfffff6b4
 278:	534f656c 	movtpl	r6, #62828	; 0xf56c
 27c:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 280:	6970722f 	ldmdbvs	r0!, {r0, r1, r2, r3, r5, r9, ip, sp, lr}^
 284:	6970672d 	ldmdbvs	r0!, {r0, r2, r3, r5, r8, r9, sl, sp, lr}^
 288:	00632e6f 	rsbeq	r2, r3, pc, ror #28
 28c:	454c5047 	strbmi	r5, [ip, #-71]	; 0xffffffb9
 290:	47003056 	smlsdmi	r0, r6, r0, r3
 294:	56454c50 			; <UNDEFINED> instruction: 0x56454c50
 298:	65520031 	ldrbvs	r0, [r2, #-49]	; 0xffffffcf
 29c:	76726573 			; <UNDEFINED> instruction: 0x76726573
 2a0:	00346465 	eorseq	r6, r4, r5, ror #8
 2a4:	65736552 	ldrbvs	r6, [r3, #-1362]!	; 0xfffffaae
 2a8:	64657672 	strbtvs	r7, [r5], #-1650	; 0xfffff98e
 2ac:	65520036 	ldrbvs	r0, [r2, #-54]	; 0xffffffca
 2b0:	76726573 			; <UNDEFINED> instruction: 0x76726573
 2b4:	00376465 	eorseq	r6, r7, r5, ror #8
 2b8:	47697072 			; <UNDEFINED> instruction: 0x47697072
 2bc:	006f6970 	rsbeq	r6, pc, r0, ror r9	; <UNPREDICTABLE>
 2c0:	5f697072 	svcpl	0x00697072
 2c4:	5f676572 	svcpl	0x00676572
 2c8:	745f6f77 	ldrbvc	r6, [pc], #-3959	; 2d0 <CPSR_IRQ_INHIBIT+0x250>
 2cc:	46504700 	ldrbmi	r4, [r0], -r0, lsl #14
 2d0:	00304e45 	eorseq	r4, r0, r5, asr #28
 2d4:	5f697072 	svcpl	0x00697072
 2d8:	6f697067 	svcvs	0x00697067
 2dc:	4700745f 	smlsdmi	r0, pc, r4, r7	; <UNPREDICTABLE>
 2e0:	524c4350 	subpl	r4, ip, #80, 6	; 0x40000001
 2e4:	682f0030 	stmdavs	pc!, {r4, r5}	; <UNPREDICTABLE>
 2e8:	2f656d6f 	svccs	0x00656d6f
 2ec:	69646261 	stmdbvs	r4!, {r0, r5, r6, r9, sp, lr}^
 2f0:	6972616b 	ldmdbvs	r2!, {r0, r1, r3, r5, r6, r8, sp, lr}^
 2f4:	65642f6d 	strbvs	r2, [r4, #-3949]!	; 0xfffff093
 2f8:	794d2f76 	stmdbvc	sp, {r1, r2, r4, r5, r6, r8, r9, sl, fp, sp}^
 2fc:	7474694c 	ldrbtvc	r6, [r4], #-2380	; 0xfffff6b4
 300:	534f656c 	movtpl	r6, #62828	; 0xf56c
 304:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 308:	6970722f 	ldmdbvs	r0!, {r0, r1, r2, r3, r5, r9, ip, sp, lr}^
 30c:	746e692d 	strbtvc	r6, [lr], #-2349	; 0xfffff6d3
 310:	75727265 	ldrbvc	r7, [r2, #-613]!	; 0xfffffd9b
 314:	2e737470 	mrccs	4, 3, r7, cr3, cr0, {3}
 318:	72700063 	rsbsvc	r0, r0, #99	; 0x63
 31c:	74656665 	strbtvc	r6, [r5], #-1637	; 0xfffff99b
 320:	615f6863 	cmpvs	pc, r3, ror #16
 324:	74726f62 	ldrbtvc	r6, [r2], #-3938	; 0xfffff09e
 328:	6365765f 	cmnvs	r5, #99614720	; 0x5f00000
 32c:	00726f74 	rsbseq	r6, r2, r4, ror pc
 330:	61736944 	cmnvs	r3, r4, asr #18
 334:	5f656c62 	svcpl	0x00656c62
 338:	73515249 	cmpvc	r1, #-1879048188	; 0x90000004
 33c:	4600325f 			; <UNDEFINED> instruction: 0x4600325f
 340:	635f5149 	cmpvs	pc, #1073741842	; 0x40000012
 344:	72746e6f 	rsbsvc	r6, r4, #1776	; 0x6f0
 348:	72006c6f 	andvc	r6, r0, #28416	; 0x6f00
 34c:	52496970 	subpl	r6, r9, #112, 18	; 0x1c0000
 350:	6e6f4351 	mcrvs	3, 3, r4, cr15, cr1, {2}
 354:	6c6f7274 	sfmvs	f7, 2, [pc], #-464	; 18c <CPSR_IRQ_INHIBIT+0x10c>
 358:	0072656c 	rsbseq	r6, r2, ip, ror #10
 35c:	74666f73 	strbtvc	r6, [r6], #-3955	; 0xfffff08d
 360:	65726177 	ldrbvs	r6, [r2, #-375]!	; 0xfffffe89
 364:	746e695f 	strbtvc	r6, [lr], #-2399	; 0xfffff6a1
 368:	75727265 	ldrbvc	r7, [r2, #-613]!	; 0xfffffd9b
 36c:	765f7470 			; <UNDEFINED> instruction: 0x765f7470
 370:	6f746365 	svcvs	0x00746365
 374:	6e750072 	mrcvs	0, 3, r0, cr5, cr2, {3}
 378:	69666564 	stmdbvs	r6!, {r2, r5, r6, r8, sl, sp, lr}^
 37c:	5f64656e 	svcpl	0x0064656e
 380:	74736e69 	ldrbtvc	r6, [r3], #-3689	; 0xfffff197
 384:	74637572 	strbtvc	r7, [r3], #-1394	; 0xfffffa8e
 388:	5f6e6f69 	svcpl	0x006e6f69
 38c:	74636576 	strbtvc	r6, [r3], #-1398	; 0xfffffa8a
 390:	6600726f 	strvs	r7, [r0], -pc, ror #4
 394:	5f747361 	svcpl	0x00747361
 398:	65746e69 	ldrbvs	r6, [r4, #-3689]!	; 0xfffff197
 39c:	70757272 	rsbsvc	r7, r5, r2, ror r2
 3a0:	65765f74 	ldrbvs	r5, [r6, #-3956]!	; 0xfffff08c
 3a4:	726f7463 	rsbvc	r7, pc, #1660944384	; 0x63000000
 3a8:	61686300 	cmnvs	r8, r0, lsl #6
 3ac:	74636172 	strbtvc	r6, [r3], #-370	; 0xfffffe8e
 3b0:	45007265 	strmi	r7, [r0, #-613]	; 0xfffffd9b
 3b4:	6c62616e 	stfvse	f6, [r2], #-440	; 0xfffffe48
 3b8:	52495f65 	subpl	r5, r9, #404	; 0x194
 3bc:	315f7351 	cmpcc	pc, r1, asr r3	; <UNPREDICTABLE>
 3c0:	616e4500 	cmnvs	lr, r0, lsl #10
 3c4:	5f656c62 	svcpl	0x00656c62
 3c8:	73515249 	cmpvc	r1, #-1879048188	; 0x90000004
 3cc:	4400325f 	strmi	r3, [r0], #-607	; 0xfffffda1
 3d0:	62617369 	rsbvs	r7, r1, #-1543503871	; 0xa4000001
 3d4:	425f656c 	subsmi	r6, pc, #108, 10	; 0x1b000000
 3d8:	63697361 	cmnvs	r9, #-2080374783	; 0x84000001
 3dc:	5152495f 	cmppl	r2, pc, asr r9
 3e0:	65720073 	ldrbvs	r0, [r2, #-115]!	; 0xffffff8d
 3e4:	5f746573 	svcpl	0x00746573
 3e8:	74636576 	strbtvc	r6, [r3], #-1398	; 0xfffffa8a
 3ec:	4900726f 	stmdbmi	r0, {r0, r1, r2, r3, r5, r6, r9, ip, sp, lr}
 3f0:	705f5152 	subsvc	r5, pc, r2, asr r1	; <UNPREDICTABLE>
 3f4:	69646e65 	stmdbvs	r4!, {r0, r2, r5, r6, r9, sl, fp, sp, lr}^
 3f8:	325f676e 	subscc	r6, pc, #28835840	; 0x1b80000
 3fc:	73694400 	cmnvc	r9, #0, 8
 400:	656c6261 	strbvs	r6, [ip, #-609]!	; 0xfffffd9f
 404:	5152495f 	cmppl	r2, pc, asr r9
 408:	00315f73 	eorseq	r5, r1, r3, ror pc
 40c:	62616e45 	rsbvs	r6, r1, #1104	; 0x450
 410:	425f656c 	subsmi	r6, pc, #108, 10	; 0x1b000000
 414:	63697361 	cmnvs	r9, #-2080374783	; 0x84000001
 418:	5152495f 	cmppl	r2, pc, asr r9
 41c:	70720073 	rsbsvc	r0, r2, r3, ror r0
 420:	72695f69 	rsbvc	r5, r9, #420	; 0x1a4
 424:	6f635f71 	svcvs	0x00635f71
 428:	6f72746e 	svcvs	0x0072746e
 42c:	72656c6c 	rsbvc	r6, r5, #108, 24	; 0x6c00
 430:	5200745f 	andpl	r7, r0, #1593835520	; 0x5f000000
 434:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
 438:	72497465 	subvc	r7, r9, #1694498816	; 0x65000000
 43c:	6e6f4371 	mcrvs	3, 3, r4, cr15, cr1, {3}
 440:	6c6f7274 	sfmvs	f7, 2, [pc], #-464	; 278 <CPSR_IRQ_INHIBIT+0x1f8>
 444:	0072656c 	rsbseq	r6, r2, ip, ror #10
 448:	61746164 	cmnvs	r4, r4, ror #2
 44c:	6f62615f 	svcvs	0x0062615f
 450:	765f7472 			; <UNDEFINED> instruction: 0x765f7472
 454:	6f746365 	svcvs	0x00746365
 458:	52490072 	subpl	r0, r9, #114	; 0x72
 45c:	65705f51 	ldrbvs	r5, [r0, #-3921]!	; 0xfffff0af
 460:	6e69646e 	cdpvs	4, 6, cr6, cr9, cr14, {3}
 464:	00315f67 	eorseq	r5, r1, r7, ror #30
 468:	5f515249 	svcpl	0x00515249
 46c:	69736162 	ldmdbvs	r3!, {r1, r5, r6, r8, sp, lr}^
 470:	65705f63 	ldrbvs	r5, [r0, #-3939]!	; 0xfffff09d
 474:	6e69646e 	cdpvs	4, 6, cr6, cr9, cr14, {3}
 478:	55410067 	strbpl	r0, [r1, #-103]	; 0xffffff99
 47c:	554d5f58 	strbpl	r5, [sp, #-3928]	; 0xfffff0a8
 480:	52434d5f 	subpl	r4, r3, #6080	; 0x17c0
 484:	4745525f 	smlsldmi	r5, r5, pc, r2	; <UNPREDICTABLE>
 488:	58554100 	ldmdapl	r5, {r8, lr}^
 48c:	5f554d5f 	svcpl	0x00554d5f
 490:	5f52534d 	svcpl	0x0052534d
 494:	00474552 	subeq	r4, r7, r2, asr r5
 498:	4d697072 	stclmi	0, cr7, [r9, #-456]!	; 0xfffffe38
 49c:	55696e69 	strbpl	r6, [r9, #-3689]!	; 0xfffff197
 4a0:	00747261 	rsbseq	r7, r4, r1, ror #4
 4a4:	5f585541 	svcpl	0x00585541
 4a8:	435f554d 	cmpmi	pc, #322961408	; 0x13400000
 4ac:	5f4c544e 	svcpl	0x004c544e
 4b0:	00474552 	subeq	r4, r7, r2, asr r5
 4b4:	5f697072 	svcpl	0x00697072
 4b8:	5f787561 	svcpl	0x00787561
 4bc:	50520074 	subspl	r0, r2, r4, ror r0
 4c0:	61555f49 	cmpvs	r5, r9, asr #30
 4c4:	6e497472 	mcrvs	4, 2, r7, cr9, cr2, {3}
 4c8:	41007469 	tstmi	r0, r9, ror #8
 4cc:	4d5f5855 	ldclmi	8, cr5, [pc, #-340]	; 380 <CPSR_IRQ_INHIBIT+0x300>
 4d0:	45495f55 	strbmi	r5, [r9, #-3925]	; 0xfffff0ab
 4d4:	45525f52 	ldrbmi	r5, [r2, #-3922]	; 0xfffff0ae
 4d8:	55410047 	strbpl	r0, [r1, #-71]	; 0xffffffb9
 4dc:	554d5f58 	strbpl	r5, [sp, #-3928]	; 0xfffff0a8
 4e0:	5243535f 	subpl	r5, r3, #2080374785	; 0x7c000001
 4e4:	48435441 	stmdami	r3, {r0, r6, sl, ip, lr}^
 4e8:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
 4ec:	00787541 	rsbseq	r7, r8, r1, asr #10
 4f0:	5f585541 	svcpl	0x00585541
 4f4:	495f554d 	ldmdbmi	pc, {r0, r2, r3, r6, r8, sl, ip, lr}^	; <UNPREDICTABLE>
 4f8:	525f5249 	subspl	r5, pc, #-1879048188	; 0x90000004
 4fc:	41004745 	tstmi	r0, r5, asr #14
 500:	455f5855 	ldrbmi	r5, [pc, #-2133]	; fffffcb3 <_stack+0xfff7fcb3>
 504:	4c42414e 	stfmie	f4, [r2], {78}	; 0x4e
 508:	52005345 	andpl	r5, r0, #335544321	; 0x14000001
 50c:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
 510:	75417465 	strbvc	r7, [r1, #-1125]	; 0xfffffb9b
 514:	70720078 	rsbsvc	r0, r2, r8, ror r0
 518:	61755f69 	cmnvs	r5, r9, ror #30
 51c:	745f7472 	ldrbvc	r7, [pc], #-1138	; 524 <CPSR_IRQ_INHIBIT+0x4a4>
 520:	58554100 	ldmdapl	r5, {r8, lr}^
 524:	5f554d5f 	svcpl	0x00554d5f
 528:	44554142 	ldrbmi	r4, [r5], #-322	; 0xfffffebe
 52c:	4745525f 	smlsldmi	r5, r5, pc, r2	; <UNPREDICTABLE>
 530:	58554100 	ldmdapl	r5, {r8, lr}^
 534:	5f554d5f 	svcpl	0x00554d5f
 538:	54415453 	strbpl	r5, [r1], #-1107	; 0xfffffbad
 53c:	4745525f 	smlsldmi	r5, r5, pc, r2	; <UNPREDICTABLE>
 540:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
 544:	7465475f 	strbtvc	r4, [r5], #-1887	; 0xfffff8a1
 548:	696e694d 	stmdbvs	lr!, {r0, r2, r3, r6, r8, fp, sp, lr}^
 54c:	74726155 	ldrbtvc	r6, [r2], #-341	; 0xfffffeab
 550:	58554100 	ldmdapl	r5, {r8, lr}^
 554:	5152495f 	cmppl	r2, pc, asr r9
 558:	58554100 	ldmdapl	r5, {r8, lr}^
 55c:	5f554d5f 	svcpl	0x00554d5f
 560:	525f4f49 	subspl	r4, pc, #292	; 0x124
 564:	41004745 	tstmi	r0, r5, asr #14
 568:	4d5f5855 	ldclmi	8, cr5, [pc, #-340]	; 41c <CPSR_IRQ_INHIBIT+0x39c>
 56c:	434c5f55 	movtmi	r5, #53077	; 0xcf55
 570:	45525f52 	ldrbmi	r5, [r2, #-3922]	; 0xfffff0ae
 574:	55410047 	strbpl	r0, [r1, #-71]	; 0xffffffb9
 578:	554d5f58 	strbpl	r5, [sp, #-3928]	; 0xfffff0a8
 57c:	52534c5f 	subspl	r4, r3, #24320	; 0x5f00
 580:	4745525f 	smlsldmi	r5, r5, pc, r2	; <UNPREDICTABLE>
 584:	6f682f00 	svcvs	0x00682f00
 588:	612f656d 			; <UNDEFINED> instruction: 0x612f656d
 58c:	6b696462 	blvs	1a5971c <_stack+0x19d971c>
 590:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
 594:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
 598:	4c794d2f 	ldclmi	13, cr4, [r9], #-188	; 0xffffff44
 59c:	6c747469 	cfldrdvs	mvd7, [r4], #-420	; 0xfffffe5c
 5a0:	2f534f65 	svccs	0x00534f65
 5a4:	2f637273 	svccs	0x00637273
 5a8:	2d697072 	stclcs	0, cr7, [r9, #-456]!	; 0xfffffe38
 5ac:	74726175 	ldrbtvc	r6, [r2], #-373	; 0xfffffe8b
 5b0:	6b00632e 	blvs	19270 <__bss_end__+0x10e28>
 5b4:	656e7265 	strbvs	r7, [lr, #-613]!	; 0xfffffd9b
 5b8:	616d5f6c 	cmnvs	sp, ip, ror #30
 5bc:	6d006e69 	stcvs	14, cr6, [r0, #-420]	; 0xfffffe5c
 5c0:	55696e69 	strbpl	r6, [r9, #-3689]!	; 0xfffff197
 5c4:	52747261 	rsbspl	r7, r4, #268435462	; 0x10000006
 5c8:	2f006765 	svccs	0x00006765
 5cc:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
 5d0:	6462612f 	strbtvs	r6, [r2], #-303	; 0xfffffed1
 5d4:	72616b69 	rsbvc	r6, r1, #107520	; 0x1a400
 5d8:	642f6d69 	strtvs	r6, [pc], #-3433	; 5e0 <CPSR_IRQ_INHIBIT+0x560>
 5dc:	4d2f7665 	stcmi	6, cr7, [pc, #-404]!	; 450 <CPSR_IRQ_INHIBIT+0x3d0>
 5e0:	74694c79 	strbtvc	r4, [r9], #-3193	; 0xfffff387
 5e4:	4f656c74 	svcmi	0x00656c74
 5e8:	72732f53 	rsbsvc	r2, r3, #332	; 0x14c
 5ec:	61752f63 	cmnvs	r5, r3, ror #30
 5f0:	654b7472 	strbvs	r7, [fp, #-1138]	; 0xfffffb8e
 5f4:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 5f8:	6700632e 	strvs	r6, [r0, -lr, lsr #6]
 5fc:	526f6970 	rsbpl	r6, pc, #112, 18	; 0x1c0000
 600:	61006765 	tstvs	r0, r5, ror #14
 604:	73676174 	cmnvc	r7, #116, 2
	...

Disassembly of section .ARM.attributes:

00000000 <.ARM.attributes>:
   0:	00003041 	andeq	r3, r0, r1, asr #32
   4:	61656100 	cmnvs	r5, r0, lsl #2
   8:	01006962 	tsteq	r0, r2, ror #18
   c:	00000026 	andeq	r0, r0, r6, lsr #32
  10:	4b5a3605 	blmi	168d82c <_stack+0x160d82c>
  14:	08070600 	stmdaeq	r7, {r9, sl}
  18:	0a010901 	beq	42424 <__bss_end__+0x39fdc>
  1c:	14041202 	strne	r1, [r4], #-514	; 0xfffffdfe
  20:	17011501 	strne	r1, [r1, -r1, lsl #10]
  24:	1a011803 	bne	46038 <__bss_end__+0x3dbf0>
  28:	1e011c01 	cdpne	12, 0, cr1, cr1, cr1, {0}
  2c:	44012206 	strmi	r2, [r1], #-518	; 0xfffffdfa
  30:	Address 0x0000000000000030 is out of bounds.

