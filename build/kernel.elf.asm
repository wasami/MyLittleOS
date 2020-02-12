
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
    8024:	000081bc 			; <UNDEFINED> instruction: 0x000081bc

00008028 <_software_interrupt_vector_h>:
    8028:	000081d8 	ldrdeq	r8, [r0], -r8	; <UNPREDICTABLE>

0000802c <_prefetch_abort_vector_h>:
    802c:	000081f4 	strdeq	r8, [r0], -r4

00008030 <_data_abort_vector_h>:
    8030:	00008214 	andeq	r8, r0, r4, lsl r2

00008034 <_unused_handler_h>:
    8034:	00008040 	andeq	r8, r0, r0, asr #32

00008038 <_interrupt_vector_h>:
    8038:	00008234 	andeq	r8, r0, r4, lsr r2

0000803c <_fast_interrupt_vector_h>:
    803c:	00008348 	andeq	r8, r0, r8, asr #6

00008040 <_reset_>:
    8040:	e3a00902 	mov	r0, #32768	; 0x8000
    8044:	e3a01000 	mov	r1, #0
    8048:	e8b003fc 	ldm	r0!, {r2, r3, r4, r5, r6, r7, r8, r9}
    804c:	e8a103fc 	stmia	r1!, {r2, r3, r4, r5, r6, r7, r8, r9}
    8050:	e8b003fc 	ldm	r0!, {r2, r3, r4, r5, r6, r7, r8, r9}
    8054:	e8a103fc 	stmia	r1!, {r2, r3, r4, r5, r6, r7, r8, r9}
    8058:	e3a000d2 	mov	r0, #210	; 0xd2
    805c:	e121f000 	msr	CPSR_c, r0
    8060:	e3a0da07 	mov	sp, #28672	; 0x7000
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
    80f0:	eb0001c0 	bl	87f8 <kernel_main>
    80f4:	eafffffe 	b	80f4 <_cstartup+0x60>
    80f8:	00008b4a 	andeq	r8, r0, sl, asr #22
    80fc:	00008b68 	andeq	r8, r0, r8, ror #22

00008100 <RPI_GetArmTimer>:
    8100:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8104:	e28db000 	add	fp, sp, #0
    8108:	e59f3010 	ldr	r3, [pc, #16]	; 8120 <RPI_GetArmTimer+0x20>
    810c:	e5933000 	ldr	r3, [r3]
    8110:	e1a00003 	mov	r0, r3
    8114:	e28bd000 	add	sp, fp, #0
    8118:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    811c:	e12fff1e 	bx	lr
    8120:	00008af4 	strdeq	r8, [r0], -r4

00008124 <RPI_ArmTimerInit>:
    8124:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8128:	e28db000 	add	fp, sp, #0
    812c:	e320f000 	nop	{0}
    8130:	e28bd000 	add	sp, fp, #0
    8134:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8138:	e12fff1e 	bx	lr

0000813c <RPI_GetGpio>:
    813c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8140:	e28db000 	add	fp, sp, #0
    8144:	e59f3010 	ldr	r3, [pc, #16]	; 815c <RPI_GetGpio+0x20>
    8148:	e5933000 	ldr	r3, [r3]
    814c:	e1a00003 	mov	r0, r3
    8150:	e28bd000 	add	sp, fp, #0
    8154:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8158:	e12fff1e 	bx	lr
    815c:	00008af8 	strdeq	r8, [r0], -r8	; <UNPREDICTABLE>

00008160 <RPI_GpioInit>:
    8160:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8164:	e28db000 	add	fp, sp, #0
    8168:	e320f000 	nop	{0}
    816c:	e28bd000 	add	sp, fp, #0
    8170:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8174:	e12fff1e 	bx	lr

00008178 <RPI_GetIrqController>:
    8178:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    817c:	e28db000 	add	fp, sp, #0
    8180:	e59f3010 	ldr	r3, [pc, #16]	; 8198 <RPI_GetIrqController+0x20>
    8184:	e5933000 	ldr	r3, [r3]
    8188:	e1a00003 	mov	r0, r3
    818c:	e28bd000 	add	sp, fp, #0
    8190:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8194:	e12fff1e 	bx	lr
    8198:	00008afc 	strdeq	r8, [r0], -ip

0000819c <reset_vector>:
    819c:	e24ee004 	sub	lr, lr, #4
    81a0:	e92d581f 	push	{r0, r1, r2, r3, r4, fp, ip, lr}
    81a4:	e28db01c 	add	fp, sp, #28
    81a8:	ebffffe3 	bl	813c <RPI_GetGpio>
    81ac:	e1a02000 	mov	r2, r0
    81b0:	e3a03801 	mov	r3, #65536	; 0x10000
    81b4:	e5823028 	str	r3, [r2, #40]	; 0x28
    81b8:	eafffffa 	b	81a8 <reset_vector+0xc>

000081bc <undefined_instruction_vector>:
    81bc:	e92d581f 	push	{r0, r1, r2, r3, r4, fp, ip, lr}
    81c0:	e28db01c 	add	fp, sp, #28
    81c4:	ebffffdc 	bl	813c <RPI_GetGpio>
    81c8:	e1a02000 	mov	r2, r0
    81cc:	e3a03801 	mov	r3, #65536	; 0x10000
    81d0:	e5823028 	str	r3, [r2, #40]	; 0x28
    81d4:	eafffffa 	b	81c4 <undefined_instruction_vector+0x8>

000081d8 <software_interrupt_vector>:
    81d8:	e92d581f 	push	{r0, r1, r2, r3, r4, fp, ip, lr}
    81dc:	e28db01c 	add	fp, sp, #28
    81e0:	ebffffd5 	bl	813c <RPI_GetGpio>
    81e4:	e1a02000 	mov	r2, r0
    81e8:	e3a03801 	mov	r3, #65536	; 0x10000
    81ec:	e5823028 	str	r3, [r2, #40]	; 0x28
    81f0:	eafffffa 	b	81e0 <software_interrupt_vector+0x8>

000081f4 <prefetch_abort_vector>:
    81f4:	e24ee004 	sub	lr, lr, #4
    81f8:	e92d581f 	push	{r0, r1, r2, r3, r4, fp, ip, lr}
    81fc:	e28db01c 	add	fp, sp, #28
    8200:	ebffffcd 	bl	813c <RPI_GetGpio>
    8204:	e1a02000 	mov	r2, r0
    8208:	e3a03801 	mov	r3, #65536	; 0x10000
    820c:	e5823028 	str	r3, [r2, #40]	; 0x28
    8210:	eafffffa 	b	8200 <prefetch_abort_vector+0xc>

00008214 <data_abort_vector>:
    8214:	e24ee004 	sub	lr, lr, #4
    8218:	e92d581f 	push	{r0, r1, r2, r3, r4, fp, ip, lr}
    821c:	e28db01c 	add	fp, sp, #28
    8220:	ebffffc5 	bl	813c <RPI_GetGpio>
    8224:	e1a02000 	mov	r2, r0
    8228:	e3a03801 	mov	r3, #65536	; 0x10000
    822c:	e5823028 	str	r3, [r2, #40]	; 0x28
    8230:	eafffffa 	b	8220 <data_abort_vector+0xc>

00008234 <interrupt_vector>:
    8234:	e24ee004 	sub	lr, lr, #4
    8238:	e92d580f 	push	{r0, r1, r2, r3, fp, ip, lr}
    823c:	e28db018 	add	fp, sp, #24
    8240:	e24dd00c 	sub	sp, sp, #12
    8244:	ebffffad 	bl	8100 <RPI_GetArmTimer>
    8248:	e1a03000 	mov	r3, r0
    824c:	e5933010 	ldr	r3, [r3, #16]
    8250:	e3530001 	cmp	r3, #1
    8254:	1a000016 	bne	82b4 <interrupt_vector+0x80>
    8258:	ebffffa8 	bl	8100 <RPI_GetArmTimer>
    825c:	e1a02000 	mov	r2, r0
    8260:	e3a03001 	mov	r3, #1
    8264:	e582300c 	str	r3, [r2, #12]
    8268:	e59f30d4 	ldr	r3, [pc, #212]	; 8344 <interrupt_vector+0x110>
    826c:	e5933000 	ldr	r3, [r3]
    8270:	e3530000 	cmp	r3, #0
    8274:	0a000007 	beq	8298 <interrupt_vector+0x64>
    8278:	ebffffaf 	bl	813c <RPI_GetGpio>
    827c:	e1a02000 	mov	r2, r0
    8280:	e3a03801 	mov	r3, #65536	; 0x10000
    8284:	e582301c 	str	r3, [r2, #28]
    8288:	e59f30b4 	ldr	r3, [pc, #180]	; 8344 <interrupt_vector+0x110>
    828c:	e3a02000 	mov	r2, #0
    8290:	e5832000 	str	r2, [r3]
    8294:	ea000006 	b	82b4 <interrupt_vector+0x80>
    8298:	ebffffa7 	bl	813c <RPI_GetGpio>
    829c:	e1a02000 	mov	r2, r0
    82a0:	e3a03801 	mov	r3, #65536	; 0x10000
    82a4:	e5823028 	str	r3, [r2, #40]	; 0x28
    82a8:	e59f3094 	ldr	r3, [pc, #148]	; 8344 <interrupt_vector+0x110>
    82ac:	e3a02001 	mov	r2, #1
    82b0:	e5832000 	str	r2, [r3]
    82b4:	eb00004f 	bl	83f8 <RPI_GetMiniUart>
    82b8:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
    82bc:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    82c0:	e5933008 	ldr	r3, [r3, #8]
    82c4:	e2033004 	and	r3, r3, #4
    82c8:	e3530000 	cmp	r3, #0
    82cc:	0a00000a 	beq	82fc <interrupt_vector+0xc8>
    82d0:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    82d4:	e5933000 	ldr	r3, [r3]
    82d8:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    82dc:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    82e0:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    82e4:	e5832000 	str	r2, [r3]
    82e8:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    82ec:	e5933004 	ldr	r3, [r3, #4]
    82f0:	e3832001 	orr	r2, r3, #1
    82f4:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    82f8:	e5832004 	str	r2, [r3, #4]
    82fc:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    8300:	e5933008 	ldr	r3, [r3, #8]
    8304:	e2033002 	and	r3, r3, #2
    8308:	e3530000 	cmp	r3, #0
    830c:	0a000009 	beq	8338 <interrupt_vector+0x104>
    8310:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    8314:	e5933014 	ldr	r3, [r3, #20]
    8318:	e2033040 	and	r3, r3, #64	; 0x40
    831c:	e3530000 	cmp	r3, #0
    8320:	0a000004 	beq	8338 <interrupt_vector+0x104>
    8324:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    8328:	e5933004 	ldr	r3, [r3, #4]
    832c:	e3c32001 	bic	r2, r3, #1
    8330:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    8334:	e5832004 	str	r2, [r3, #4]
    8338:	e320f000 	nop	{0}
    833c:	e24bd018 	sub	sp, fp, #24
    8340:	e8fd980f 	ldm	sp!, {r0, r1, r2, r3, fp, ip, pc}^
    8344:	00008b4c 	andeq	r8, r0, ip, asr #22

00008348 <fast_interrupt_vector>:
    8348:	e24db004 	sub	fp, sp, #4
    834c:	e320f000 	nop	{0}
    8350:	e28bd004 	add	sp, fp, #4
    8354:	e25ef004 	subs	pc, lr, #4

00008358 <RPI_GetSystemTimer>:
    8358:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    835c:	e28db000 	add	fp, sp, #0
    8360:	e59f3010 	ldr	r3, [pc, #16]	; 8378 <RPI_GetSystemTimer+0x20>
    8364:	e5933000 	ldr	r3, [r3]
    8368:	e1a00003 	mov	r0, r3
    836c:	e28bd000 	add	sp, fp, #0
    8370:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8374:	e12fff1e 	bx	lr
    8378:	00008b00 	andeq	r8, r0, r0, lsl #22

0000837c <RPI_WaitMicroSeconds>:
    837c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8380:	e28db000 	add	fp, sp, #0
    8384:	e24dd014 	sub	sp, sp, #20
    8388:	e50b0010 	str	r0, [fp, #-16]
    838c:	e59f303c 	ldr	r3, [pc, #60]	; 83d0 <RPI_WaitMicroSeconds+0x54>
    8390:	e5933000 	ldr	r3, [r3]
    8394:	e5933004 	ldr	r3, [r3, #4]
    8398:	e50b3008 	str	r3, [fp, #-8]
    839c:	e320f000 	nop	{0}
    83a0:	e59f3028 	ldr	r3, [pc, #40]	; 83d0 <RPI_WaitMicroSeconds+0x54>
    83a4:	e5933000 	ldr	r3, [r3]
    83a8:	e5932004 	ldr	r2, [r3, #4]
    83ac:	e51b3008 	ldr	r3, [fp, #-8]
    83b0:	e0422003 	sub	r2, r2, r3
    83b4:	e51b3010 	ldr	r3, [fp, #-16]
    83b8:	e1520003 	cmp	r2, r3
    83bc:	3afffff7 	bcc	83a0 <RPI_WaitMicroSeconds+0x24>
    83c0:	e320f000 	nop	{0}
    83c4:	e28bd000 	add	sp, fp, #0
    83c8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    83cc:	e12fff1e 	bx	lr
    83d0:	00008b00 	andeq	r8, r0, r0, lsl #22

000083d4 <RPI_GetAux>:
    83d4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    83d8:	e28db000 	add	fp, sp, #0
    83dc:	e59f3010 	ldr	r3, [pc, #16]	; 83f4 <RPI_GetAux+0x20>
    83e0:	e5933000 	ldr	r3, [r3]
    83e4:	e1a00003 	mov	r0, r3
    83e8:	e28bd000 	add	sp, fp, #0
    83ec:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    83f0:	e12fff1e 	bx	lr
    83f4:	00008b04 	andeq	r8, r0, r4, lsl #22

000083f8 <RPI_GetMiniUart>:
    83f8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    83fc:	e28db000 	add	fp, sp, #0
    8400:	e59f3010 	ldr	r3, [pc, #16]	; 8418 <RPI_GetMiniUart+0x20>
    8404:	e5933000 	ldr	r3, [r3]
    8408:	e1a00003 	mov	r0, r3
    840c:	e28bd000 	add	sp, fp, #0
    8410:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8414:	e12fff1e 	bx	lr
    8418:	00008b08 	andeq	r8, r0, r8, lsl #22

0000841c <RPI_MiniUartInit>:
    841c:	e92d4800 	push	{fp, lr}
    8420:	e28db004 	add	fp, sp, #4
    8424:	e24dd008 	sub	sp, sp, #8
    8428:	ebffff43 	bl	813c <RPI_GetGpio>
    842c:	e50b0008 	str	r0, [fp, #-8]
    8430:	e59f3150 	ldr	r3, [pc, #336]	; 8588 <RPI_MiniUartInit+0x16c>
    8434:	e5933000 	ldr	r3, [r3]
    8438:	e59f2148 	ldr	r2, [pc, #328]	; 8588 <RPI_MiniUartInit+0x16c>
    843c:	e5922000 	ldr	r2, [r2]
    8440:	e5922004 	ldr	r2, [r2, #4]
    8444:	e3822001 	orr	r2, r2, #1
    8448:	e5832004 	str	r2, [r3, #4]
    844c:	e59f3138 	ldr	r3, [pc, #312]	; 858c <RPI_MiniUartInit+0x170>
    8450:	e5933000 	ldr	r3, [r3]
    8454:	e3a02000 	mov	r2, #0
    8458:	e5832020 	str	r2, [r3, #32]
    845c:	e59f3128 	ldr	r3, [pc, #296]	; 858c <RPI_MiniUartInit+0x170>
    8460:	e5933000 	ldr	r3, [r3]
    8464:	e3a02000 	mov	r2, #0
    8468:	e5832004 	str	r2, [r3, #4]
    846c:	e59f3118 	ldr	r3, [pc, #280]	; 858c <RPI_MiniUartInit+0x170>
    8470:	e5933000 	ldr	r3, [r3]
    8474:	e3a02003 	mov	r2, #3
    8478:	e583200c 	str	r2, [r3, #12]
    847c:	e59f3108 	ldr	r3, [pc, #264]	; 858c <RPI_MiniUartInit+0x170>
    8480:	e5933000 	ldr	r3, [r3]
    8484:	e3a02000 	mov	r2, #0
    8488:	e5832010 	str	r2, [r3, #16]
    848c:	e59f30f8 	ldr	r3, [pc, #248]	; 858c <RPI_MiniUartInit+0x170>
    8490:	e5933000 	ldr	r3, [r3]
    8494:	e59f20f4 	ldr	r2, [pc, #244]	; 8590 <RPI_MiniUartInit+0x174>
    8498:	e5832028 	str	r2, [r3, #40]	; 0x28
    849c:	e51b3008 	ldr	r3, [fp, #-8]
    84a0:	e5933004 	ldr	r3, [r3, #4]
    84a4:	e50b300c 	str	r3, [fp, #-12]
    84a8:	e51b300c 	ldr	r3, [fp, #-12]
    84ac:	e3c33a07 	bic	r3, r3, #28672	; 0x7000
    84b0:	e50b300c 	str	r3, [fp, #-12]
    84b4:	e51b300c 	ldr	r3, [fp, #-12]
    84b8:	e3833a02 	orr	r3, r3, #8192	; 0x2000
    84bc:	e50b300c 	str	r3, [fp, #-12]
    84c0:	e51b300c 	ldr	r3, [fp, #-12]
    84c4:	e3c3390e 	bic	r3, r3, #229376	; 0x38000
    84c8:	e50b300c 	str	r3, [fp, #-12]
    84cc:	e51b300c 	ldr	r3, [fp, #-12]
    84d0:	e3833801 	orr	r3, r3, #65536	; 0x10000
    84d4:	e50b300c 	str	r3, [fp, #-12]
    84d8:	e51b300c 	ldr	r3, [fp, #-12]
    84dc:	e1a02003 	mov	r2, r3
    84e0:	e51b3008 	ldr	r3, [fp, #-8]
    84e4:	e5832004 	str	r2, [r3, #4]
    84e8:	e51b3008 	ldr	r3, [fp, #-8]
    84ec:	e3a02000 	mov	r2, #0
    84f0:	e5832094 	str	r2, [r3, #148]	; 0x94
    84f4:	e3a03000 	mov	r3, #0
    84f8:	e50b300c 	str	r3, [fp, #-12]
    84fc:	ea000002 	b	850c <RPI_MiniUartInit+0xf0>
    8500:	e51b300c 	ldr	r3, [fp, #-12]
    8504:	e2833001 	add	r3, r3, #1
    8508:	e50b300c 	str	r3, [fp, #-12]
    850c:	e51b300c 	ldr	r3, [fp, #-12]
    8510:	e3530095 	cmp	r3, #149	; 0x95
    8514:	dafffff9 	ble	8500 <RPI_MiniUartInit+0xe4>
    8518:	e51b3008 	ldr	r3, [fp, #-8]
    851c:	e3a02903 	mov	r2, #49152	; 0xc000
    8520:	e5832098 	str	r2, [r3, #152]	; 0x98
    8524:	e3a03000 	mov	r3, #0
    8528:	e50b300c 	str	r3, [fp, #-12]
    852c:	ea000002 	b	853c <RPI_MiniUartInit+0x120>
    8530:	e51b300c 	ldr	r3, [fp, #-12]
    8534:	e2833001 	add	r3, r3, #1
    8538:	e50b300c 	str	r3, [fp, #-12]
    853c:	e51b300c 	ldr	r3, [fp, #-12]
    8540:	e3530095 	cmp	r3, #149	; 0x95
    8544:	dafffff9 	ble	8530 <RPI_MiniUartInit+0x114>
    8548:	e51b3008 	ldr	r3, [fp, #-8]
    854c:	e3a02000 	mov	r2, #0
    8550:	e5832098 	str	r2, [r3, #152]	; 0x98
    8554:	e59f3030 	ldr	r3, [pc, #48]	; 858c <RPI_MiniUartInit+0x170>
    8558:	e5933000 	ldr	r3, [r3]
    855c:	e3a02002 	mov	r2, #2
    8560:	e5832004 	str	r2, [r3, #4]
    8564:	e59f0028 	ldr	r0, [pc, #40]	; 8594 <RPI_MiniUartInit+0x178>
    8568:	eb0000ce 	bl	88a8 <fifo_init>
    856c:	e59f3018 	ldr	r3, [pc, #24]	; 858c <RPI_MiniUartInit+0x170>
    8570:	e5933000 	ldr	r3, [r3]
    8574:	e3a02003 	mov	r2, #3
    8578:	e5832020 	str	r2, [r3, #32]
    857c:	e320f000 	nop	{0}
    8580:	e24bd004 	sub	sp, fp, #4
    8584:	e8bd8800 	pop	{fp, pc}
    8588:	00008b04 	andeq	r8, r0, r4, lsl #22
    858c:	00008b08 	andeq	r8, r0, r8, lsl #22
    8590:	0000010e 	andeq	r0, r0, lr, lsl #2
    8594:	00008b50 	andeq	r8, r0, r0, asr fp

00008598 <RPI_WriteToMiniUart>:
    8598:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    859c:	e28db000 	add	fp, sp, #0
    85a0:	e24dd00c 	sub	sp, sp, #12
    85a4:	e1a03000 	mov	r3, r0
    85a8:	e54b3005 	strb	r3, [fp, #-5]
    85ac:	e320f000 	nop	{0}
    85b0:	e59f3030 	ldr	r3, [pc, #48]	; 85e8 <RPI_WriteToMiniUart+0x50>
    85b4:	e5933000 	ldr	r3, [r3]
    85b8:	e5933014 	ldr	r3, [r3, #20]
    85bc:	e2033020 	and	r3, r3, #32
    85c0:	e3530000 	cmp	r3, #0
    85c4:	0afffff9 	beq	85b0 <RPI_WriteToMiniUart+0x18>
    85c8:	e59f3018 	ldr	r3, [pc, #24]	; 85e8 <RPI_WriteToMiniUart+0x50>
    85cc:	e5933000 	ldr	r3, [r3]
    85d0:	e55b2005 	ldrb	r2, [fp, #-5]
    85d4:	e5832000 	str	r2, [r3]
    85d8:	e320f000 	nop	{0}
    85dc:	e28bd000 	add	sp, fp, #0
    85e0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    85e4:	e12fff1e 	bx	lr
    85e8:	00008b08 	andeq	r8, r0, r8, lsl #22

000085ec <RPI_printString>:
    85ec:	e92d4800 	push	{fp, lr}
    85f0:	e28db004 	add	fp, sp, #4
    85f4:	e24dd010 	sub	sp, sp, #16
    85f8:	e50b0010 	str	r0, [fp, #-16]
    85fc:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    8600:	e3a03000 	mov	r3, #0
    8604:	e50b3008 	str	r3, [fp, #-8]
    8608:	ea000008 	b	8630 <RPI_printString+0x44>
    860c:	e51b3010 	ldr	r3, [fp, #-16]
    8610:	e2832001 	add	r2, r3, #1
    8614:	e50b2010 	str	r2, [fp, #-16]
    8618:	e5d33000 	ldrb	r3, [r3]
    861c:	e1a00003 	mov	r0, r3
    8620:	ebffffdc 	bl	8598 <RPI_WriteToMiniUart>
    8624:	e51b3008 	ldr	r3, [fp, #-8]
    8628:	e2833001 	add	r3, r3, #1
    862c:	e50b3008 	str	r3, [fp, #-8]
    8630:	e51b2008 	ldr	r2, [fp, #-8]
    8634:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8638:	e1520003 	cmp	r2, r3
    863c:	bafffff2 	blt	860c <RPI_printString+0x20>
    8640:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8644:	e1a00003 	mov	r0, r3
    8648:	e24bd004 	sub	sp, fp, #4
    864c:	e8bd8800 	pop	{fp, pc}

00008650 <RPI_ReadFromMiniUart>:
    8650:	e92d4800 	push	{fp, lr}
    8654:	e28db004 	add	fp, sp, #4
    8658:	e24dd008 	sub	sp, sp, #8
    865c:	e50b0008 	str	r0, [fp, #-8]
    8660:	e50b100c 	str	r1, [fp, #-12]
    8664:	e51b200c 	ldr	r2, [fp, #-12]
    8668:	e51b1008 	ldr	r1, [fp, #-8]
    866c:	e59f0010 	ldr	r0, [pc, #16]	; 8684 <RPI_ReadFromMiniUart+0x34>
    8670:	eb00009d 	bl	88ec <fifo_read>
    8674:	e1a03000 	mov	r3, r0
    8678:	e1a00003 	mov	r0, r3
    867c:	e24bd004 	sub	sp, fp, #4
    8680:	e8bd8800 	pop	{fp, pc}
    8684:	00008b50 	andeq	r8, r0, r0, asr fp

00008688 <RPI_MiniUart_ISR>:
    8688:	e92d4800 	push	{fp, lr}
    868c:	e28db004 	add	fp, sp, #4
    8690:	e24dd008 	sub	sp, sp, #8
    8694:	e59f30c4 	ldr	r3, [pc, #196]	; 8760 <RPI_MiniUart_ISR+0xd8>
    8698:	e5933000 	ldr	r3, [r3]
    869c:	e5933008 	ldr	r3, [r3, #8]
    86a0:	e2033004 	and	r3, r3, #4
    86a4:	e3530000 	cmp	r3, #0
    86a8:	0a000016 	beq	8708 <RPI_MiniUart_ISR+0x80>
    86ac:	e59f30ac 	ldr	r3, [pc, #172]	; 8760 <RPI_MiniUart_ISR+0xd8>
    86b0:	e5933000 	ldr	r3, [r3]
    86b4:	e5933000 	ldr	r3, [r3]
    86b8:	e50b3008 	str	r3, [fp, #-8]
    86bc:	e59f309c 	ldr	r3, [pc, #156]	; 8760 <RPI_MiniUart_ISR+0xd8>
    86c0:	e5933000 	ldr	r3, [r3]
    86c4:	e51b2008 	ldr	r2, [fp, #-8]
    86c8:	e5832000 	str	r2, [r3]
    86cc:	e59f308c 	ldr	r3, [pc, #140]	; 8760 <RPI_MiniUart_ISR+0xd8>
    86d0:	e5933000 	ldr	r3, [r3]
    86d4:	e59f2084 	ldr	r2, [pc, #132]	; 8760 <RPI_MiniUart_ISR+0xd8>
    86d8:	e5922000 	ldr	r2, [r2]
    86dc:	e5922004 	ldr	r2, [r2, #4]
    86e0:	e3822001 	orr	r2, r2, #1
    86e4:	e5832004 	str	r2, [r3, #4]
    86e8:	e51b3008 	ldr	r3, [fp, #-8]
    86ec:	e6ef3073 	uxtb	r3, r3
    86f0:	e54b3009 	strb	r3, [fp, #-9]
    86f4:	e24b3009 	sub	r3, fp, #9
    86f8:	e3a02001 	mov	r2, #1
    86fc:	e1a01003 	mov	r1, r3
    8700:	e59f005c 	ldr	r0, [pc, #92]	; 8764 <RPI_MiniUart_ISR+0xdc>
    8704:	eb0000b1 	bl	89d0 <fifo_write>
    8708:	e59f3050 	ldr	r3, [pc, #80]	; 8760 <RPI_MiniUart_ISR+0xd8>
    870c:	e5933000 	ldr	r3, [r3]
    8710:	e5933008 	ldr	r3, [r3, #8]
    8714:	e2033002 	and	r3, r3, #2
    8718:	e3530000 	cmp	r3, #0
    871c:	0a00000c 	beq	8754 <RPI_MiniUart_ISR+0xcc>
    8720:	e59f3038 	ldr	r3, [pc, #56]	; 8760 <RPI_MiniUart_ISR+0xd8>
    8724:	e5933000 	ldr	r3, [r3]
    8728:	e5933014 	ldr	r3, [r3, #20]
    872c:	e2033040 	and	r3, r3, #64	; 0x40
    8730:	e3530000 	cmp	r3, #0
    8734:	0a000006 	beq	8754 <RPI_MiniUart_ISR+0xcc>
    8738:	e59f3020 	ldr	r3, [pc, #32]	; 8760 <RPI_MiniUart_ISR+0xd8>
    873c:	e5933000 	ldr	r3, [r3]
    8740:	e59f2018 	ldr	r2, [pc, #24]	; 8760 <RPI_MiniUart_ISR+0xd8>
    8744:	e5922000 	ldr	r2, [r2]
    8748:	e5922004 	ldr	r2, [r2, #4]
    874c:	e3c22001 	bic	r2, r2, #1
    8750:	e5832004 	str	r2, [r3, #4]
    8754:	e320f000 	nop	{0}
    8758:	e24bd004 	sub	sp, fp, #4
    875c:	e8bd8800 	pop	{fp, pc}
    8760:	00008b08 	andeq	r8, r0, r8, lsl #22
    8764:	00008b50 	andeq	r8, r0, r0, asr fp

00008768 <shell_main>:
    8768:	e92d4800 	push	{fp, lr}
    876c:	e28db004 	add	fp, sp, #4
    8770:	e24dd010 	sub	sp, sp, #16
    8774:	e3a01001 	mov	r1, #1
    8778:	e51b0010 	ldr	r0, [fp, #-16]
    877c:	ebffffb3 	bl	8650 <RPI_ReadFromMiniUart>
    8780:	e50b000c 	str	r0, [fp, #-12]
    8784:	e51b3010 	ldr	r3, [fp, #-16]
    8788:	e50b3008 	str	r3, [fp, #-8]
    878c:	e3a01020 	mov	r1, #32
    8790:	e59f0058 	ldr	r0, [pc, #88]	; 87f0 <shell_main+0x88>
    8794:	ebffff94 	bl	85ec <RPI_printString>
    8798:	ea000006 	b	87b8 <shell_main+0x50>
    879c:	e3a01001 	mov	r1, #1
    87a0:	e51b0008 	ldr	r0, [fp, #-8]
    87a4:	ebffffa9 	bl	8650 <RPI_ReadFromMiniUart>
    87a8:	e1a02000 	mov	r2, r0
    87ac:	e51b300c 	ldr	r3, [fp, #-12]
    87b0:	e0833002 	add	r3, r3, r2
    87b4:	e50b300c 	str	r3, [fp, #-12]
    87b8:	e51b3008 	ldr	r3, [fp, #-8]
    87bc:	e2832001 	add	r2, r3, #1
    87c0:	e50b2008 	str	r2, [fp, #-8]
    87c4:	e5d33000 	ldrb	r3, [r3]
    87c8:	e353003b 	cmp	r3, #59	; 0x3b
    87cc:	1afffff2 	bne	879c <shell_main+0x34>
    87d0:	e3a03000 	mov	r3, #0
    87d4:	e50b300c 	str	r3, [fp, #-12]
    87d8:	e3a01019 	mov	r1, #25
    87dc:	e59f0010 	ldr	r0, [pc, #16]	; 87f4 <shell_main+0x8c>
    87e0:	ebffff81 	bl	85ec <RPI_printString>
    87e4:	e51b3010 	ldr	r3, [fp, #-16]
    87e8:	e50b3008 	str	r3, [fp, #-8]
    87ec:	eaffffe6 	b	878c <shell_main+0x24>
    87f0:	00008b0c 	andeq	r8, r0, ip, lsl #22
    87f4:	00008b30 	andeq	r8, r0, r0, lsr fp

000087f8 <kernel_main>:
    87f8:	e92d4800 	push	{fp, lr}
    87fc:	e28db004 	add	fp, sp, #4
    8800:	e24dd030 	sub	sp, sp, #48	; 0x30
    8804:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
    8808:	e50b102c 	str	r1, [fp, #-44]	; 0xffffffd4
    880c:	e50b2030 	str	r2, [fp, #-48]	; 0xffffffd0
    8810:	ebfffe49 	bl	813c <RPI_GetGpio>
    8814:	e1a03000 	mov	r3, r0
    8818:	e5932004 	ldr	r2, [r3, #4]
    881c:	e3822701 	orr	r2, r2, #262144	; 0x40000
    8820:	e5832004 	str	r2, [r3, #4]
    8824:	ebfffe53 	bl	8178 <RPI_GetIrqController>
    8828:	e1a02000 	mov	r2, r0
    882c:	e3a03001 	mov	r3, #1
    8830:	e5823018 	str	r3, [r2, #24]
    8834:	ebfffe31 	bl	8100 <RPI_GetArmTimer>
    8838:	e1a02000 	mov	r2, r0
    883c:	e3a03b01 	mov	r3, #1024	; 0x400
    8840:	e5823000 	str	r3, [r2]
    8844:	ebfffe2d 	bl	8100 <RPI_GetArmTimer>
    8848:	e1a02000 	mov	r2, r0
    884c:	e3a030aa 	mov	r3, #170	; 0xaa
    8850:	e5823008 	str	r3, [r2, #8]
    8854:	ebfffef0 	bl	841c <RPI_MiniUartInit>
    8858:	ebfffe46 	bl	8178 <RPI_GetIrqController>
    885c:	e1a03000 	mov	r3, r0
    8860:	e5932010 	ldr	r2, [r3, #16]
    8864:	e3822202 	orr	r2, r2, #536870912	; 0x20000000
    8868:	e5832010 	str	r2, [r3, #16]
    886c:	ebfffe04 	bl	8084 <_enable_interrupts>
    8870:	e59f302c 	ldr	r3, [pc, #44]	; 88a4 <kernel_main+0xac>
    8874:	e24bc024 	sub	ip, fp, #36	; 0x24
    8878:	e1a0e003 	mov	lr, r3
    887c:	e8be000f 	ldm	lr!, {r0, r1, r2, r3}
    8880:	e8ac000f 	stmia	ip!, {r0, r1, r2, r3}
    8884:	e89e000f 	ldm	lr, {r0, r1, r2, r3}
    8888:	e8ac0007 	stmia	ip!, {r0, r1, r2}
    888c:	e1cc30b0 	strh	r3, [ip]
    8890:	e24b3024 	sub	r3, fp, #36	; 0x24
    8894:	e3a0101c 	mov	r1, #28
    8898:	e1a00003 	mov	r0, r3
    889c:	ebffff52 	bl	85ec <RPI_printString>
    88a0:	eafffffe 	b	88a0 <kernel_main+0xa8>
    88a4:	00008ad4 	ldrdeq	r8, [r0], -r4

000088a8 <fifo_init>:
    88a8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    88ac:	e28db000 	add	fp, sp, #0
    88b0:	e24dd00c 	sub	sp, sp, #12
    88b4:	e50b0008 	str	r0, [fp, #-8]
    88b8:	e51b3008 	ldr	r3, [fp, #-8]
    88bc:	e3a02000 	mov	r2, #0
    88c0:	e583200c 	str	r2, [r3, #12]
    88c4:	e51b3008 	ldr	r3, [fp, #-8]
    88c8:	e3a02000 	mov	r2, #0
    88cc:	e5832010 	str	r2, [r3, #16]
    88d0:	e51b3008 	ldr	r3, [fp, #-8]
    88d4:	e3a0200a 	mov	r2, #10
    88d8:	e5832014 	str	r2, [r3, #20]
    88dc:	e320f000 	nop	{0}
    88e0:	e28bd000 	add	sp, fp, #0
    88e4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    88e8:	e12fff1e 	bx	lr

000088ec <fifo_read>:
    88ec:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    88f0:	e28db000 	add	fp, sp, #0
    88f4:	e24dd01c 	sub	sp, sp, #28
    88f8:	e50b0010 	str	r0, [fp, #-16]
    88fc:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    8900:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    8904:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8908:	e50b300c 	str	r3, [fp, #-12]
    890c:	e3a03000 	mov	r3, #0
    8910:	e50b3008 	str	r3, [fp, #-8]
    8914:	ea000024 	b	89ac <fifo_read+0xc0>
    8918:	e51b3010 	ldr	r3, [fp, #-16]
    891c:	e5932010 	ldr	r2, [r3, #16]
    8920:	e51b3010 	ldr	r3, [fp, #-16]
    8924:	e593300c 	ldr	r3, [r3, #12]
    8928:	e1520003 	cmp	r2, r3
    892c:	0a000019 	beq	8998 <fifo_read+0xac>
    8930:	e51b300c 	ldr	r3, [fp, #-12]
    8934:	e2832001 	add	r2, r3, #1
    8938:	e50b200c 	str	r2, [fp, #-12]
    893c:	e51b2010 	ldr	r2, [fp, #-16]
    8940:	e5922010 	ldr	r2, [r2, #16]
    8944:	e51b1010 	ldr	r1, [fp, #-16]
    8948:	e7d12002 	ldrb	r2, [r1, r2]
    894c:	e5c32000 	strb	r2, [r3]
    8950:	e51b3010 	ldr	r3, [fp, #-16]
    8954:	e5933010 	ldr	r3, [r3, #16]
    8958:	e2832001 	add	r2, r3, #1
    895c:	e51b3010 	ldr	r3, [fp, #-16]
    8960:	e5832010 	str	r2, [r3, #16]
    8964:	e51b3010 	ldr	r3, [fp, #-16]
    8968:	e5932010 	ldr	r2, [r3, #16]
    896c:	e51b3010 	ldr	r3, [fp, #-16]
    8970:	e5933014 	ldr	r3, [r3, #20]
    8974:	e1520003 	cmp	r2, r3
    8978:	1a000002 	bne	8988 <fifo_read+0x9c>
    897c:	e51b3010 	ldr	r3, [fp, #-16]
    8980:	e3a02000 	mov	r2, #0
    8984:	e5832010 	str	r2, [r3, #16]
    8988:	e51b3008 	ldr	r3, [fp, #-8]
    898c:	e2833001 	add	r3, r3, #1
    8990:	e50b3008 	str	r3, [fp, #-8]
    8994:	ea000001 	b	89a0 <fifo_read+0xb4>
    8998:	e51b3008 	ldr	r3, [fp, #-8]
    899c:	ea000007 	b	89c0 <fifo_read+0xd4>
    89a0:	e51b3008 	ldr	r3, [fp, #-8]
    89a4:	e2833001 	add	r3, r3, #1
    89a8:	e50b3008 	str	r3, [fp, #-8]
    89ac:	e51b2008 	ldr	r2, [fp, #-8]
    89b0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    89b4:	e1520003 	cmp	r2, r3
    89b8:	baffffd6 	blt	8918 <fifo_read+0x2c>
    89bc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    89c0:	e1a00003 	mov	r0, r3
    89c4:	e28bd000 	add	sp, fp, #0
    89c8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    89cc:	e12fff1e 	bx	lr

000089d0 <fifo_write>:
    89d0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    89d4:	e28db000 	add	fp, sp, #0
    89d8:	e24dd01c 	sub	sp, sp, #28
    89dc:	e50b0010 	str	r0, [fp, #-16]
    89e0:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    89e4:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    89e8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    89ec:	e50b300c 	str	r3, [fp, #-12]
    89f0:	e3a03000 	mov	r3, #0
    89f4:	e50b3008 	str	r3, [fp, #-8]
    89f8:	ea00002c 	b	8ab0 <fifo_write+0xe0>
    89fc:	e51b3010 	ldr	r3, [fp, #-16]
    8a00:	e593300c 	ldr	r3, [r3, #12]
    8a04:	e2832001 	add	r2, r3, #1
    8a08:	e51b3010 	ldr	r3, [fp, #-16]
    8a0c:	e5933010 	ldr	r3, [r3, #16]
    8a10:	e1520003 	cmp	r2, r3
    8a14:	0a00000a 	beq	8a44 <fifo_write+0x74>
    8a18:	e51b3010 	ldr	r3, [fp, #-16]
    8a1c:	e593300c 	ldr	r3, [r3, #12]
    8a20:	e2832001 	add	r2, r3, #1
    8a24:	e51b3010 	ldr	r3, [fp, #-16]
    8a28:	e5933014 	ldr	r3, [r3, #20]
    8a2c:	e1520003 	cmp	r2, r3
    8a30:	1a000005 	bne	8a4c <fifo_write+0x7c>
    8a34:	e51b3010 	ldr	r3, [fp, #-16]
    8a38:	e5933010 	ldr	r3, [r3, #16]
    8a3c:	e3530000 	cmp	r3, #0
    8a40:	1a000001 	bne	8a4c <fifo_write+0x7c>
    8a44:	e51b3008 	ldr	r3, [fp, #-8]
    8a48:	ea00001d 	b	8ac4 <fifo_write+0xf4>
    8a4c:	e51b3010 	ldr	r3, [fp, #-16]
    8a50:	e593200c 	ldr	r2, [r3, #12]
    8a54:	e51b300c 	ldr	r3, [fp, #-12]
    8a58:	e2831001 	add	r1, r3, #1
    8a5c:	e50b100c 	str	r1, [fp, #-12]
    8a60:	e5d31000 	ldrb	r1, [r3]
    8a64:	e51b3010 	ldr	r3, [fp, #-16]
    8a68:	e7c31002 	strb	r1, [r3, r2]
    8a6c:	e51b3010 	ldr	r3, [fp, #-16]
    8a70:	e593300c 	ldr	r3, [r3, #12]
    8a74:	e2832001 	add	r2, r3, #1
    8a78:	e51b3010 	ldr	r3, [fp, #-16]
    8a7c:	e583200c 	str	r2, [r3, #12]
    8a80:	e51b3010 	ldr	r3, [fp, #-16]
    8a84:	e593200c 	ldr	r2, [r3, #12]
    8a88:	e51b3010 	ldr	r3, [fp, #-16]
    8a8c:	e5933014 	ldr	r3, [r3, #20]
    8a90:	e1520003 	cmp	r2, r3
    8a94:	1a000002 	bne	8aa4 <fifo_write+0xd4>
    8a98:	e51b3010 	ldr	r3, [fp, #-16]
    8a9c:	e3a02000 	mov	r2, #0
    8aa0:	e583200c 	str	r2, [r3, #12]
    8aa4:	e51b3008 	ldr	r3, [fp, #-8]
    8aa8:	e2833001 	add	r3, r3, #1
    8aac:	e50b3008 	str	r3, [fp, #-8]
    8ab0:	e51b2008 	ldr	r2, [fp, #-8]
    8ab4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8ab8:	e1520003 	cmp	r2, r3
    8abc:	baffffce 	blt	89fc <fifo_write+0x2c>
    8ac0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8ac4:	e1a00003 	mov	r0, r3
    8ac8:	e28bd000 	add	sp, fp, #0
    8acc:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8ad0:	e12fff1e 	bx	lr

Disassembly of section .rodata:

00008ad4 <.rodata>:
    8ad4:	74530a0d 	ldrbvc	r0, [r3], #-2573	; 0xfffff5f3
    8ad8:	69747261 	ldmdbvs	r4!, {r0, r5, r6, r9, ip, sp, lr}^
    8adc:	7320676e 			; <UNDEFINED> instruction: 0x7320676e
    8ae0:	6c6c6568 	cfstr64vs	mvdx6, [ip], #-416	; 0xfffffe60
    8ae4:	6f727020 	svcvs	0x00727020
    8ae8:	6d617267 	sfmvs	f7, 2, [r1, #-412]!	; 0xfffffe64
    8aec:	0d2e2e2e 	stceq	14, cr2, [lr, #-184]!	; 0xffffff48
    8af0:	Address 0x0000000000008af0 is out of bounds.


Disassembly of section .data:

00008af4 <__data_start>:
    8af4:	2000b400 	andcs	fp, r0, r0, lsl #8

00008af8 <rpiGpio>:
    8af8:	20200000 	eorcs	r0, r0, r0

00008afc <rpiIRQController>:
    8afc:	2000b200 	andcs	fp, r0, r0, lsl #4

00008b00 <rpiSystemTimer>:
    8b00:	20003000 	andcs	r3, r0, r0

00008b04 <rpiAux>:
    8b04:	20215000 	eorcs	r5, r1, r0

00008b08 <rpiMiniUart>:
    8b08:	20215040 	eorcs	r5, r1, r0, asr #32

00008b0c <enter_command_text.6881>:
    8b0c:	65746e45 	ldrbvs	r6, [r4, #-3653]!	; 0xfffff1bb
    8b10:	6f632072 	svcvs	0x00632072
    8b14:	6e616d6d 	cdpvs	13, 6, cr6, cr1, cr13, {3}
    8b18:	61282064 			; <UNDEFINED> instruction: 0x61282064
    8b1c:	6520646e 	strvs	r6, [r0, #-1134]!	; 0xfffffb92
    8b20:	7720646e 	strvc	r6, [r0, -lr, ror #8]!
    8b24:	20687469 	rsbcs	r7, r8, r9, ror #8
    8b28:	203a293b 	eorscs	r2, sl, fp, lsr r9
    8b2c:	00000000 	andeq	r0, r0, r0

00008b30 <command_not_found_text.6880>:
    8b30:	206f4e0a 	rsbcs	r4, pc, sl, lsl #28
    8b34:	68637573 	stmdavs	r3!, {r0, r1, r4, r5, r6, r8, sl, ip, sp, lr}^
    8b38:	6d6f6320 	stclvs	3, cr6, [pc, #-128]!	; 8ac0 <fifo_write+0xf0>
    8b3c:	646e616d 	strbtvs	r6, [lr], #-365	; 0xfffffe93
    8b40:	756f6620 	strbvc	r6, [pc, #-1568]!	; 8528 <RPI_MiniUartInit+0x10c>
    8b44:	0d2e646e 	cfstrseq	mvf6, [lr, #-440]!	; 0xfffffe48
    8b48:	Address 0x0000000000008b48 is out of bounds.


Disassembly of section .bss:

00008b4c <lit.5423>:
    8b4c:	00000000 	andeq	r0, r0, r0

00008b50 <fifo_buffer>:
	...

Disassembly of section .comment:

00000000 <_stack-0x80000>:
   0:	3a434347 	bcc	10d0d24 <_heap+0x1050d20>
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
  44:	01e50002 	mvneq	r0, r2
  48:	00040000 	andeq	r0, r4, r0
  4c:	00000000 	andeq	r0, r0, r0
  50:	0000813c 	andeq	r8, r0, ip, lsr r1
  54:	0000003c 	andeq	r0, r0, ip, lsr r0
	...
  60:	0000001c 	andeq	r0, r0, ip, lsl r0
  64:	04cb0002 	strbeq	r0, [fp], #2
  68:	00040000 	andeq	r0, r4, r0
  6c:	00000000 	andeq	r0, r0, r0
  70:	00008178 	andeq	r8, r0, r8, ror r1
  74:	000001e0 	andeq	r0, r0, r0, ror #3
	...
  80:	0000001c 	andeq	r0, r0, ip, lsl r0
  84:	07680002 	strbeq	r0, [r8, -r2]!
  88:	00040000 	andeq	r0, r4, r0
  8c:	00000000 	andeq	r0, r0, r0
  90:	00008358 	andeq	r8, r0, r8, asr r3
  94:	0000007c 	andeq	r0, r0, ip, ror r0
	...
  a0:	0000001c 	andeq	r0, r0, ip, lsl r0
  a4:	08af0002 	stmiaeq	pc!, {r1}	; <UNPREDICTABLE>
  a8:	00040000 	andeq	r0, r4, r0
  ac:	00000000 	andeq	r0, r0, r0
  b0:	000083d4 	ldrdeq	r8, [r0], -r4
  b4:	00000394 	muleq	r0, r4, r3
	...
  c0:	0000001c 	andeq	r0, r0, ip, lsl r0
  c4:	0df40002 	ldcleq	0, cr0, [r4, #8]!
  c8:	00040000 	andeq	r0, r4, r0
  cc:	00000000 	andeq	r0, r0, r0
  d0:	00008768 	andeq	r8, r0, r8, ror #14
  d4:	00000090 	muleq	r0, r0, r0
	...
  e0:	0000001c 	andeq	r0, r0, ip, lsl r0
  e4:	17020002 	strne	r0, [r2, -r2]
  e8:	00040000 	andeq	r0, r4, r0
  ec:	00000000 	andeq	r0, r0, r0
  f0:	000087f8 	strdeq	r8, [r0], -r8	; <UNPREDICTABLE>
  f4:	000000b0 	strheq	r0, [r0], -r0	; <UNPREDICTABLE>
	...
 100:	0000001c 	andeq	r0, r0, ip, lsl r0
 104:	17d00002 	ldrbne	r0, [r0, r2]
 108:	00040000 	andeq	r0, r4, r0
 10c:	00000000 	andeq	r0, r0, r0
 110:	000088a8 	andeq	r8, r0, r8, lsr #17
 114:	0000022c 	andeq	r0, r0, ip, lsr #4
	...
 120:	0000001c 	andeq	r0, r0, ip, lsl r0
 124:	19900002 	ldmibne	r0, {r1}
 128:	00040000 	andeq	r0, r4, r0
 12c:	00000000 	andeq	r0, r0, r0
 130:	00008000 	andeq	r8, r0, r0
 134:	00000094 	muleq	r0, r4, r0
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
      3c:	3a040000 	bcc	100044 <_heap+0x80040>
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
      98:	018b0704 	orreq	r0, fp, r4, lsl #14
      9c:	04090000 	streq	r0, [r9], #-0
      a0:	0000002c 	andeq	r0, r0, ip, lsr #32
      a4:	00013c00 	andeq	r3, r1, r0, lsl #24
      a8:	89000400 	stmdbhi	r0, {sl}
      ac:	04000000 	streq	r0, [r0], #-0
      b0:	00004401 	andeq	r4, r0, r1, lsl #8
      b4:	00d20c00 	sbcseq	r0, r2, r0, lsl #24
      b8:	81000000 	mrshi	r0, (UNDEF: 0)
      bc:	003c0000 	eorseq	r0, ip, r0
      c0:	00680000 	rsbeq	r0, r8, r0
      c4:	01020000 	mrseq	r0, (UNDEF: 2)
      c8:	00013306 	andeq	r3, r1, r6, lsl #6
      cc:	08010200 	stmdaeq	r1, {r9}
      d0:	00000131 	andeq	r0, r0, r1, lsr r1
      d4:	bf050202 	svclt	0x00050202
      d8:	02000001 	andeq	r0, r0, #1
      dc:	013f0702 	teqeq	pc, r2, lsl #14
      e0:	04020000 	streq	r0, [r2], #-0
      e4:	0001b605 	andeq	fp, r1, r5, lsl #12
      e8:	01580300 	cmpeq	r8, r0, lsl #6
      ec:	41020000 	mrsmi	r0, (UNDEF: 2)
      f0:	0000004f 	andeq	r0, r0, pc, asr #32
      f4:	86070402 	strhi	r0, [r7], -r2, lsl #8
      f8:	02000001 	andeq	r0, r0, #1
      fc:	01b10508 			; <UNDEFINED> instruction: 0x01b10508
     100:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
     104:	00018107 	andeq	r8, r1, r7, lsl #2
     108:	05040400 	streq	r0, [r4, #-1024]	; 0xfffffc00
     10c:	00746e69 	rsbseq	r6, r4, r9, ror #28
     110:	8b070402 	blhi	1c1120 <_heap+0x14111c>
     114:	03000001 	movweq	r0, #1
     118:	0000015a 	andeq	r0, r0, sl, asr r1
     11c:	00443003 	subeq	r3, r4, r3
     120:	72050000 	andvc	r0, r5, #0
     124:	06000000 	streq	r0, [r0], -r0
     128:	f7280424 			; <UNDEFINED> instruction: 0xf7280424
     12c:	07000000 	streq	r0, [r0, -r0]
     130:	000000b6 	strheq	r0, [r0], -r6
     134:	007d2e04 	rsbseq	r2, sp, r4, lsl #28
     138:	07000000 	streq	r0, [r0, -r0]
     13c:	00000152 	andeq	r0, r0, r2, asr r1
     140:	007d3504 	rsbseq	r3, sp, r4, lsl #10
     144:	07040000 	streq	r0, [r4, -r0]
     148:	00000198 	muleq	r0, r8, r1
     14c:	007d3c04 	rsbseq	r3, sp, r4, lsl #24
     150:	07080000 	streq	r0, [r8, -r0]
     154:	000001c9 	andeq	r0, r0, r9, asr #3
     158:	007d4104 	rsbseq	r4, sp, r4, lsl #2
     15c:	070c0000 	streq	r0, [ip, -r0]
     160:	00000120 	andeq	r0, r0, r0, lsr #2
     164:	007d4b04 	rsbseq	r4, sp, r4, lsl #22
     168:	07100000 	ldreq	r0, [r0, -r0]
     16c:	00000127 	andeq	r0, r0, r7, lsr #2
     170:	007d5204 	rsbseq	r5, sp, r4, lsl #4
     174:	07140000 	ldreq	r0, [r4, -r0]
     178:	000000bb 	strheq	r0, [r0], -fp
     17c:	007d5904 	rsbseq	r5, sp, r4, lsl #18
     180:	07180000 	ldreq	r0, [r8, -r0]
     184:	00000163 	andeq	r0, r0, r3, ror #2
     188:	007d6404 	rsbseq	r6, sp, r4, lsl #8
     18c:	071c0000 	ldreq	r0, [ip, -r0]
     190:	0000016e 	andeq	r0, r0, lr, ror #2
     194:	007d7204 	rsbseq	r7, sp, r4, lsl #4
     198:	00200000 	eoreq	r0, r0, r0
     19c:	00010403 	andeq	r0, r1, r3, lsl #8
     1a0:	82740400 	rsbshi	r0, r4, #0, 8
     1a4:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
     1a8:	00000114 	andeq	r0, r0, r4, lsl r1
     1ac:	01130e01 	tsteq	r3, r1, lsl #28
     1b0:	03050000 	movweq	r0, #20480	; 0x5000
     1b4:	00008af4 	strdeq	r8, [r0], -r4
     1b8:	00f70409 	rscseq	r0, r7, r9, lsl #8
     1bc:	a00a0000 	andge	r0, sl, r0
     1c0:	01000001 	tsteq	r0, r1
     1c4:	00812415 	addeq	r2, r1, r5, lsl r4
     1c8:	00001800 	andeq	r1, r0, r0, lsl #16
     1cc:	0b9c0100 	bleq	fe7005d4 <_heap+0xfe6805d0>
     1d0:	000000c2 	andeq	r0, r0, r2, asr #1
     1d4:	01131001 	tsteq	r3, r1
     1d8:	81000000 	mrshi	r0, (UNDEF: 0)
     1dc:	00240000 	eoreq	r0, r4, r0
     1e0:	9c010000 	stcls	0, cr0, [r1], {-0}
     1e4:	0002e200 	andeq	lr, r2, r0, lsl #4
     1e8:	2b000400 	blcs	11f0 <CPSR_IRQ_INHIBIT+0x1170>
     1ec:	04000001 	streq	r0, [r0], #-1
     1f0:	00004401 	andeq	r4, r0, r1, lsl #8
     1f4:	031f0c00 	tsteq	pc, #0, 24
     1f8:	813c0000 	teqhi	ip, r0
     1fc:	003c0000 	eorseq	r0, ip, r0
     200:	01620000 	cmneq	r2, r0
     204:	01020000 	mrseq	r0, (UNDEF: 2)
     208:	00013306 	andeq	r3, r1, r6, lsl #6
     20c:	08010200 	stmdaeq	r1, {r9}
     210:	00000131 	andeq	r0, r0, r1, lsr r1
     214:	bf050202 	svclt	0x00050202
     218:	02000001 	andeq	r0, r0, #1
     21c:	013f0702 	teqeq	pc, r2, lsl #14
     220:	04020000 	streq	r0, [r2], #-0
     224:	0001b605 	andeq	fp, r1, r5, lsl #12
     228:	01580300 	cmpeq	r8, r0, lsl #6
     22c:	41020000 	mrsmi	r0, (UNDEF: 2)
     230:	0000004f 	andeq	r0, r0, pc, asr #32
     234:	86070402 	strhi	r0, [r7], -r2, lsl #8
     238:	02000001 	andeq	r0, r0, #1
     23c:	01b10508 			; <UNDEFINED> instruction: 0x01b10508
     240:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
     244:	00018107 	andeq	r8, r1, r7, lsl #2
     248:	05040400 	streq	r0, [r4, #-1024]	; 0xfffffc00
     24c:	00746e69 	rsbseq	r6, r4, r9, ror #28
     250:	8b070402 	blhi	1c1260 <_heap+0x14125c>
     254:	03000001 	movweq	r0, #1
     258:	0000015a 	andeq	r0, r0, sl, asr r1
     25c:	00443003 	subeq	r3, r4, r3
     260:	72050000 	andvc	r0, r5, #0
     264:	06000000 	streq	r0, [r0], -r0
     268:	0000007d 	andeq	r0, r0, sp, ror r0
     26c:	00031203 	andeq	r1, r3, r3, lsl #4
     270:	7d120400 	cfldrsvc	mvf0, [r2, #-0]
     274:	03000000 	movweq	r0, #0
     278:	000002ca 	andeq	r0, r0, sl, asr #5
     27c:	00821304 	addeq	r1, r2, r4, lsl #6
     280:	81030000 	mrshi	r0, (UNDEF: 3)
     284:	04000003 	streq	r0, [r0], #-3
     288:	00007d14 	andeq	r7, r0, r4, lsl sp
     28c:	05a40700 	streq	r0, [r4, #1792]!	; 0x700
     290:	00029d55 	andeq	r9, r2, r5, asr sp
     294:	01e00800 	mvneq	r0, r0, lsl #16
     298:	56050000 	strpl	r0, [r5], -r0
     29c:	00000087 	andeq	r0, r0, r7, lsl #1
     2a0:	01e80800 	mvneq	r0, r0, lsl #16
     2a4:	57050000 	strpl	r0, [r5, -r0]
     2a8:	00000087 	andeq	r0, r0, r7, lsl #1
     2ac:	01f00804 	mvnseq	r0, r4, lsl #16
     2b0:	58050000 	stmdapl	r5, {}	; <UNPREDICTABLE>
     2b4:	00000087 	andeq	r0, r0, r7, lsl #1
     2b8:	01f80808 	mvnseq	r0, r8, lsl #16
     2bc:	59050000 	stmdbpl	r5, {}	; <UNPREDICTABLE>
     2c0:	00000087 	andeq	r0, r0, r7, lsl #1
     2c4:	0200080c 	andeq	r0, r0, #12, 16	; 0xc0000
     2c8:	5a050000 	bpl	1402d0 <_heap+0xc02cc>
     2cc:	00000087 	andeq	r0, r0, r7, lsl #1
     2d0:	02080810 	andeq	r0, r8, #16, 16	; 0x100000
     2d4:	5b050000 	blpl	1402dc <_heap+0xc02d8>
     2d8:	00000087 	andeq	r0, r0, r7, lsl #1
     2dc:	02460814 	subeq	r0, r6, #20, 16	; 0x140000
     2e0:	5c050000 	stcpl	0, cr0, [r5], {-0}
     2e4:	00000092 	muleq	r0, r2, r0
     2e8:	01d20818 	bicseq	r0, r2, r8, lsl r8
     2ec:	5d050000 	stcpl	0, cr0, [r5, #-0]
     2f0:	0000009d 	muleq	r0, sp, r0
     2f4:	01d9081c 	bicseq	r0, r9, ip, lsl r8
     2f8:	5e050000 	cdppl	0, 0, cr0, cr5, cr0, {0}
     2fc:	0000009d 	muleq	r0, sp, r0
     300:	02500820 	subseq	r0, r0, #32, 16	; 0x200000
     304:	5f050000 	svcpl	0x00050000
     308:	00000092 	muleq	r0, r2, r0
     30c:	03a00824 	moveq	r0, #36, 16	; 0x240000
     310:	60050000 	andvs	r0, r5, r0
     314:	0000009d 	muleq	r0, sp, r0
     318:	02c30828 	sbceq	r0, r3, #40, 16	; 0x280000
     31c:	61050000 	mrsvs	r0, (UNDEF: 5)
     320:	0000009d 	muleq	r0, sp, r0
     324:	025a082c 	subseq	r0, sl, #44, 16	; 0x2c0000
     328:	62050000 	andvs	r0, r5, #0
     32c:	00000092 	muleq	r0, r2, r0
     330:	034d0830 	movteq	r0, #55344	; 0xd830
     334:	63050000 	movwvs	r0, #20480	; 0x5000
     338:	0000009d 	muleq	r0, sp, r0
     33c:	03540834 	cmpeq	r4, #52, 16	; 0x340000
     340:	64050000 	strvs	r0, [r5], #-0
     344:	0000009d 	muleq	r0, sp, r0
     348:	02640838 	rsbeq	r0, r4, #56, 16	; 0x380000
     34c:	65050000 	strvs	r0, [r5, #-0]
     350:	00000092 	muleq	r0, r2, r0
     354:	0278083c 	rsbseq	r0, r8, #60, 16	; 0x3c0000
     358:	66050000 	strvs	r0, [r5], -r0
     35c:	0000009d 	muleq	r0, sp, r0
     360:	027f0840 	rsbseq	r0, pc, #64, 16	; 0x400000
     364:	67050000 	strvs	r0, [r5, -r0]
     368:	0000009d 	muleq	r0, sp, r0
     36c:	035b0844 	cmpeq	fp, #68, 16	; 0x440000
     370:	68050000 	stmdavs	r5, {}	; <UNPREDICTABLE>
     374:	00000092 	muleq	r0, r2, r0
     378:	02380848 	eorseq	r0, r8, #72, 16	; 0x480000
     37c:	69050000 	stmdbvs	r5, {}	; <UNPREDICTABLE>
     380:	0000009d 	muleq	r0, sp, r0
     384:	023f084c 	eorseq	r0, pc, #76, 16	; 0x4c0000
     388:	6a050000 	bvs	140390 <_heap+0xc038c>
     38c:	0000009d 	muleq	r0, sp, r0
     390:	026e0850 	rsbeq	r0, lr, #80, 16	; 0x500000
     394:	6b050000 	blvs	14039c <_heap+0xc0398>
     398:	00000092 	muleq	r0, r2, r0
     39c:	038e0854 	orreq	r0, lr, #84, 16	; 0x540000
     3a0:	6c050000 	stcvs	0, cr0, [r5], {-0}
     3a4:	0000009d 	muleq	r0, sp, r0
     3a8:	02100858 	andseq	r0, r0, #88, 16	; 0x580000
     3ac:	6d050000 	stcvs	0, cr0, [r5, #-0]
     3b0:	0000009d 	muleq	r0, sp, r0
     3b4:	0365085c 	cmneq	r5, #92, 16	; 0x5c0000
     3b8:	6e050000 	cdpvs	0, 0, cr0, cr5, cr0, {0}
     3bc:	00000092 	muleq	r0, r2, r0
     3c0:	02df0860 	sbcseq	r0, pc, #96, 16	; 0x600000
     3c4:	6f050000 	svcvs	0x00050000
     3c8:	0000009d 	muleq	r0, sp, r0
     3cc:	02e60864 	rsceq	r0, r6, #100, 16	; 0x640000
     3d0:	70050000 	andvc	r0, r5, r0
     3d4:	0000009d 	muleq	r0, sp, r0
     3d8:	036f0868 	cmneq	pc, #104, 16	; 0x680000
     3dc:	71050000 	mrsvc	r0, (UNDEF: 5)
     3e0:	00000092 	muleq	r0, r2, r0
     3e4:	029a086c 	addseq	r0, sl, #108, 16	; 0x6c0000
     3e8:	72050000 	andvc	r0, r5, #0
     3ec:	0000009d 	muleq	r0, sp, r0
     3f0:	030b0870 	movweq	r0, #47216	; 0xb870
     3f4:	73050000 	movwvc	r0, #20480	; 0x5000
     3f8:	0000009d 	muleq	r0, sp, r0
     3fc:	02860874 	addeq	r0, r6, #116, 16	; 0x740000
     400:	74050000 	strvc	r0, [r5], #-0
     404:	00000092 	muleq	r0, r2, r0
     408:	03030878 	movweq	r0, #14456	; 0x3878
     40c:	75050000 	strvc	r0, [r5, #-0]
     410:	0000009d 	muleq	r0, sp, r0
     414:	02d7087c 	sbcseq	r0, r7, #124, 16	; 0x7c0000
     418:	76050000 	strvc	r0, [r5], -r0
     41c:	0000009d 	muleq	r0, sp, r0
     420:	02900880 	addseq	r0, r0, #128, 16	; 0x800000
     424:	77050000 	strvc	r0, [r5, -r0]
     428:	00000092 	muleq	r0, r2, r0
     42c:	02b30884 	adcseq	r0, r3, #132, 16	; 0x840000
     430:	78050000 	stmdavc	r5, {}	; <UNPREDICTABLE>
     434:	0000009d 	muleq	r0, sp, r0
     438:	02bb0888 	adcseq	r0, fp, #136, 16	; 0x880000
     43c:	79050000 	stmdbvc	r5, {}	; <UNPREDICTABLE>
     440:	0000009d 	muleq	r0, sp, r0
     444:	02ed088c 	rsceq	r0, sp, #140, 16	; 0x8c0000
     448:	7a050000 	bvc	140450 <_heap+0xc044c>
     44c:	00000092 	muleq	r0, r2, r0
     450:	02a10890 	adceq	r0, r1, #144, 16	; 0x900000
     454:	7b050000 	blvc	14045c <_heap+0xc0458>
     458:	0000009d 	muleq	r0, sp, r0
     45c:	02170894 	andseq	r0, r7, #148, 16	; 0x940000
     460:	7c050000 	stcvc	0, cr0, [r5], {-0}
     464:	0000009d 	muleq	r0, sp, r0
     468:	02210898 	eoreq	r0, r1, #152, 16	; 0x980000
     46c:	7d050000 	stcvc	0, cr0, [r5, #-0]
     470:	0000009d 	muleq	r0, sp, r0
     474:	02f8089c 	rscseq	r0, r8, #156, 16	; 0x9c0000
     478:	7e050000 	cdpvc	0, 0, cr0, cr5, cr0, {0}
     47c:	00000092 	muleq	r0, r2, r0
     480:	950300a0 	strls	r0, [r3, #-160]	; 0xffffff60
     484:	05000003 	streq	r0, [r0, #-3]
     488:	0000a87f 	andeq	sl, r0, pc, ror r8
     48c:	03790900 	cmneq	r9, #0, 18
     490:	0e010000 	cdpeq	0, 0, cr0, cr1, cr0, {0}
     494:	000002b9 			; <UNDEFINED> instruction: 0x000002b9
     498:	8af80305 	bhi	ffe010b4 <_heap+0xffd810b0>
     49c:	040a0000 	streq	r0, [sl], #-0
     4a0:	0000029d 	muleq	r0, sp, r2
     4a4:	00022b0b 	andeq	r2, r2, fp, lsl #22
     4a8:	60150100 	andsvs	r0, r5, r0, lsl #2
     4ac:	18000081 	stmdane	r0, {r0, r7}
     4b0:	01000000 	mrseq	r0, (UNDEF: 0)
     4b4:	02a70c9c 	adceq	r0, r7, #156, 24	; 0x9c00
     4b8:	10010000 	andne	r0, r1, r0
     4bc:	000002b9 			; <UNDEFINED> instruction: 0x000002b9
     4c0:	0000813c 	andeq	r8, r0, ip, lsr r1
     4c4:	00000024 	andeq	r0, r0, r4, lsr #32
     4c8:	99009c01 	stmdbls	r0, {r0, sl, fp, ip, pc}
     4cc:	04000002 	streq	r0, [r0], #-2
     4d0:	0001d400 	andeq	sp, r1, r0, lsl #8
     4d4:	44010400 	strmi	r0, [r1], #-1024	; 0xfffffc00
     4d8:	0c000000 	stceq	0, cr0, [r0], {-0}
     4dc:	000003a7 	andeq	r0, r0, r7, lsr #7
     4e0:	00008178 	andeq	r8, r0, r8, ror r1
     4e4:	000001e0 	andeq	r0, r0, r0, ror #3
     4e8:	00000262 	andeq	r0, r0, r2, ror #4
     4ec:	33060102 	movwcc	r0, #24834	; 0x6102
     4f0:	02000001 	andeq	r0, r0, #1
     4f4:	01310801 	teqeq	r1, r1, lsl #16
     4f8:	02020000 	andeq	r0, r2, #0
     4fc:	0001bf05 	andeq	fp, r1, r5, lsl #30
     500:	07020200 	streq	r0, [r2, -r0, lsl #4]
     504:	0000013f 	andeq	r0, r0, pc, lsr r1
     508:	b6050402 	strlt	r0, [r5], -r2, lsl #8
     50c:	03000001 	movweq	r0, #1
     510:	00000158 	andeq	r0, r0, r8, asr r1
     514:	004f4102 	subeq	r4, pc, r2, lsl #2
     518:	04020000 	streq	r0, [r2], #-0
     51c:	00018607 	andeq	r8, r1, r7, lsl #12
     520:	05080200 	streq	r0, [r8, #-512]	; 0xfffffe00
     524:	000001b1 			; <UNDEFINED> instruction: 0x000001b1
     528:	81070802 	tsthi	r7, r2, lsl #16
     52c:	04000001 	streq	r0, [r0], #-1
     530:	6e690504 	cdpvs	5, 6, cr0, cr9, cr4, {0}
     534:	04020074 	streq	r0, [r2], #-116	; 0xffffff8c
     538:	00018b07 	andeq	r8, r1, r7, lsl #22
     53c:	015a0300 	cmpeq	sl, r0, lsl #6
     540:	30030000 	andcc	r0, r3, r0
     544:	00000044 	andeq	r0, r0, r4, asr #32
     548:	00007205 	andeq	r7, r0, r5, lsl #4
     54c:	007d0600 	rsbseq	r0, sp, r0, lsl #12
     550:	12030000 	andne	r0, r3, #0
     554:	04000003 	streq	r0, [r0], #-3
     558:	00007d12 	andeq	r7, r0, r2, lsl sp
     55c:	02ca0300 	sbceq	r0, sl, #0, 6
     560:	13040000 	movwne	r0, #16384	; 0x4000
     564:	00000082 	andeq	r0, r0, r2, lsl #1
     568:	34052c07 	strcc	r2, [r5], #-3079	; 0xfffff3f9
     56c:	0000012a 	andeq	r0, r0, sl, lsr #2
     570:	00051b08 	andeq	r1, r5, r8, lsl #22
     574:	87350500 	ldrhi	r0, [r5, -r0, lsl #10]!
     578:	00000000 	andeq	r0, r0, r0
     57c:	0005ee08 	andeq	lr, r5, r8, lsl #28
     580:	87360500 	ldrhi	r0, [r6, -r0, lsl #10]!
     584:	04000000 	streq	r0, [r0], #-0
     588:	0005df08 	andeq	sp, r5, r8, lsl #30
     58c:	87370500 	ldrhi	r0, [r7, -r0, lsl #10]!
     590:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
     594:	00052908 	andeq	r2, r5, r8, lsl #18
     598:	87380500 	ldrhi	r0, [r8, -r0, lsl #10]!
     59c:	0c000000 	stceq	0, cr0, [r0], {-0}
     5a0:	00041b08 	andeq	r1, r4, r8, lsl #22
     5a4:	87390500 	ldrhi	r0, [r9, -r0, lsl #10]!
     5a8:	10000000 	andne	r0, r0, r0
     5ac:	0003db08 	andeq	sp, r3, r8, lsl #22
     5b0:	923a0500 	eorsls	r0, sl, #0, 10
     5b4:	14000000 	strne	r0, [r0], #-0
     5b8:	0004ef08 	andeq	lr, r4, r8, lsl #30
     5bc:	923b0500 	eorsls	r0, fp, #0, 10
     5c0:	18000000 	stmdane	r0, {}	; <UNPREDICTABLE>
     5c4:	00058908 	andeq	r8, r5, r8, lsl #18
     5c8:	873c0500 	ldrhi	r0, [ip, -r0, lsl #10]!
     5cc:	1c000000 	stcne	0, cr0, [r0], {-0}
     5d0:	00050b08 	andeq	r0, r5, r8, lsl #22
     5d4:	873d0500 	ldrhi	r0, [sp, -r0, lsl #10]!
     5d8:	20000000 	andcs	r0, r0, r0
     5dc:	00054708 	andeq	r4, r5, r8, lsl #14
     5e0:	923e0500 	eorsls	r0, lr, #0, 10
     5e4:	24000000 	strcs	r0, [r0], #-0
     5e8:	0004b008 	andeq	fp, r4, r8
     5ec:	873f0500 	ldrhi	r0, [pc, -r0, lsl #10]!
     5f0:	28000000 	stmdacs	r0, {}	; <UNPREDICTABLE>
     5f4:	057e0300 	ldrbeq	r0, [lr, #-768]!	; 0xfffffd00
     5f8:	40050000 	andmi	r0, r5, r0
     5fc:	0000009d 	muleq	r0, sp, r0
     600:	25062807 	strcs	r2, [r6, #-2055]	; 0xfffff7f9
     604:	000001b6 			; <UNDEFINED> instruction: 0x000001b6
     608:	0005cd08 	andeq	ip, r5, r8, lsl #26
     60c:	7d260600 	stcvc	6, cr0, [r6, #-0]
     610:	00000000 	andeq	r0, r0, r0
     614:	0005bf08 	andeq	fp, r5, r8, lsl #30
     618:	7d270600 	stcvc	6, cr0, [r7, #-0]
     61c:	04000000 	streq	r0, [r0], #-0
     620:	00044408 	andeq	r4, r4, r8, lsl #8
     624:	7d280600 	stcvc	6, cr0, [r8, #-0]
     628:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
     62c:	00042a08 	andeq	r2, r4, r8, lsl #20
     630:	7d290600 	stcvc	6, cr0, [r9, #-0]
     634:	0c000000 	stceq	0, cr0, [r0], {-0}
     638:	0004c008 	andeq	ip, r4, r8
     63c:	7d2a0600 	stcvc	6, cr0, [sl, #-0]
     640:	10000000 	andne	r0, r0, r0
     644:	0004ce08 	andeq	ip, r4, r8, lsl #28
     648:	7d2b0600 	stcvc	6, cr0, [fp, #-0]
     64c:	14000000 	strne	r0, [r0], #-0
     650:	00055708 	andeq	r5, r5, r8, lsl #14
     654:	7d2c0600 	stcvc	6, cr0, [ip, #-0]
     658:	18000000 	stmdane	r0, {}	; <UNPREDICTABLE>
     65c:	00053808 	andeq	r3, r5, r8, lsl #16
     660:	7d2d0600 	stcvc	6, cr0, [sp, #-0]
     664:	1c000000 	stcne	0, cr0, [r0], {-0}
     668:	00040008 	andeq	r0, r4, r8
     66c:	7d2e0600 	stcvc	6, cr0, [lr, #-0]
     670:	20000000 	andcs	r0, r0, r0
     674:	0004dc08 	andeq	sp, r4, r8, lsl #24
     678:	7d2f0600 	stcvc	6, cr0, [pc, #-0]	; 680 <CPSR_IRQ_INHIBIT+0x600>
     67c:	24000000 	strcs	r0, [r0], #-0
     680:	05690300 	strbeq	r0, [r9, #-768]!	; 0xfffffd00
     684:	30060000 	andcc	r0, r6, r0
     688:	00000135 	andeq	r0, r0, r5, lsr r1
     68c:	00045209 	andeq	r5, r4, r9, lsl #4
     690:	d2160100 	andsle	r0, r6, #0, 2
     694:	05000001 	streq	r0, [r0, #-1]
     698:	008afc03 	addeq	pc, sl, r3, lsl #24
     69c:	b6040a00 	strlt	r0, [r4], -r0, lsl #20
     6a0:	0b000001 	bleq	6ac <CPSR_IRQ_INHIBIT+0x62c>
     6a4:	0000049a 	muleq	r0, sl, r4
     6a8:	8348c501 	movthi	ip, #34049	; 0x8501
     6ac:	00100000 	andseq	r0, r0, r0
     6b0:	9c010000 	stcls	0, cr0, [r1], {-0}
     6b4:	00046c0c 	andeq	r6, r4, ip, lsl #24
     6b8:	34750100 	ldrbtcc	r0, [r5], #-256	; 0xffffff00
     6bc:	14000082 	strne	r0, [r0], #-130	; 0xffffff7e
     6c0:	01000001 	tsteq	r0, r1
     6c4:	00022c9c 	muleq	r2, ip, ip
     6c8:	696c0d00 	stmdbvs	ip!, {r8, sl, fp}^
     6cc:	77010074 	smlsdxvc	r1, r4, r0, r0
     6d0:	00000064 	andeq	r0, r0, r4, rrx
     6d4:	8b4c0305 	blhi	13012f0 <_heap+0x12812ec>
     6d8:	36090000 	strcc	r0, [r9], -r0
     6dc:	01000004 	tsteq	r0, r4
     6e0:	00007d8c 	andeq	r7, r0, ip, lsl #27
     6e4:	58910200 	ldmpl	r1, {r9}
     6e8:	00040f09 	andeq	r0, r4, r9, lsl #30
     6ec:	2c8d0100 	stfcss	f0, [sp], {0}
     6f0:	02000002 	andeq	r0, r0, #2
     6f4:	0a005c91 	beq	17940 <__bss_end__+0xedd8>
     6f8:	00012a04 	andeq	r2, r1, r4, lsl #20
     6fc:	05ad0e00 	streq	r0, [sp, #3584]!	; 0xe00
     700:	65010000 	strvs	r0, [r1, #-0]
     704:	00008214 	andeq	r8, r0, r4, lsl r2
     708:	00000020 	andeq	r0, r0, r0, lsr #32
     70c:	ea0e9c01 	b	3a7718 <_heap+0x327714>
     710:	01000003 	tsteq	r0, r3
     714:	0081f456 	addeq	pc, r1, r6, asr r4	; <UNPREDICTABLE>
     718:	00002000 	andeq	r2, r0, r0
     71c:	0e9c0100 	fmleqe	f0, f4, f0
     720:	00000463 	andeq	r0, r0, r3, ror #8
     724:	81d84701 	bicshi	r4, r8, r1, lsl #14
     728:	001c0000 	andseq	r0, ip, r0
     72c:	9c010000 	stcls	0, cr0, [r1], {-0}
     730:	00047d0e 	andeq	r7, r4, lr, lsl #26
     734:	bc380100 	ldflts	f0, [r8], #-0
     738:	1c000081 	stcne	0, cr0, [r0], {129}	; 0x81
     73c:	01000000 	mrseq	r0, (UNDEF: 0)
     740:	04fe0e9c 	ldrbteq	r0, [lr], #3740	; 0xe9c
     744:	2a010000 	bcs	4074c <__bss_end__+0x37be4>
     748:	0000819c 	muleq	r0, ip, r1
     74c:	00000020 	andeq	r0, r0, r0, lsr #32
     750:	980f9c01 	stmdals	pc, {r0, sl, fp, ip, pc}	; <UNPREDICTABLE>
     754:	01000005 	tsteq	r0, r5
     758:	0001d21d 	andeq	sp, r1, sp, lsl r2
     75c:	00817800 	addeq	r7, r1, r0, lsl #16
     760:	00002400 	andeq	r2, r0, r0, lsl #8
     764:	009c0100 	addseq	r0, ip, r0, lsl #2
     768:	00000143 	andeq	r0, r0, r3, asr #2
     76c:	02bc0004 	adcseq	r0, ip, #4
     770:	01040000 	mrseq	r0, (UNDEF: 4)
     774:	00000044 	andeq	r0, r0, r4, asr #32
     778:	0006210c 	andeq	r2, r6, ip, lsl #2
     77c:	00835800 	addeq	r5, r3, r0, lsl #16
     780:	00007c00 	andeq	r7, r0, r0, lsl #24
     784:	0003bb00 	andeq	fp, r3, r0, lsl #22
     788:	06010200 	streq	r0, [r1], -r0, lsl #4
     78c:	00000133 	andeq	r0, r0, r3, lsr r1
     790:	31080102 	tstcc	r8, r2, lsl #2
     794:	02000001 	andeq	r0, r0, #1
     798:	01bf0502 			; <UNDEFINED> instruction: 0x01bf0502
     79c:	02020000 	andeq	r0, r2, #0
     7a0:	00013f07 	andeq	r3, r1, r7, lsl #30
     7a4:	05040200 	streq	r0, [r4, #-512]	; 0xfffffe00
     7a8:	000001b6 			; <UNDEFINED> instruction: 0x000001b6
     7ac:	00015803 	andeq	r5, r1, r3, lsl #16
     7b0:	4f410200 	svcmi	0x00410200
     7b4:	02000000 	andeq	r0, r0, #0
     7b8:	01860704 	orreq	r0, r6, r4, lsl #14
     7bc:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
     7c0:	0001b105 	andeq	fp, r1, r5, lsl #2
     7c4:	07080200 	streq	r0, [r8, -r0, lsl #4]
     7c8:	00000181 	andeq	r0, r0, r1, lsl #3
     7cc:	69050404 	stmdbvs	r5, {r2, sl}
     7d0:	0200746e 	andeq	r7, r0, #1845493760	; 0x6e000000
     7d4:	018b0704 	orreq	r0, fp, r4, lsl #14
     7d8:	5a030000 	bpl	c07e0 <_heap+0x407dc>
     7dc:	03000001 	movweq	r0, #1
     7e0:	00004430 	andeq	r4, r0, r0, lsr r4
     7e4:	00720500 	rsbseq	r0, r2, r0, lsl #10
     7e8:	1c060000 	stcne	0, cr0, [r6], {-0}
     7ec:	00df1504 	sbcseq	r1, pc, r4, lsl #10
     7f0:	5e070000 	cdppl	0, 0, cr0, cr7, cr0, {0}
     7f4:	04000006 	streq	r0, [r0], #-6
     7f8:	00007d16 	andeq	r7, r0, r6, lsl sp
     7fc:	6d070000 	stcvs	0, cr0, [r7, #-0]
     800:	04000006 	streq	r0, [r0], #-6
     804:	00007d17 	andeq	r7, r0, r7, lsl sp
     808:	53070400 	movwpl	r0, #29696	; 0x7400
     80c:	04000006 	streq	r0, [r0], #-6
     810:	00007d18 	andeq	r7, r0, r8, lsl sp
     814:	fd070800 	stc2	8, cr0, [r7, #-0]
     818:	04000005 	streq	r0, [r0], #-5
     81c:	00007d19 	andeq	r7, r0, r9, lsl sp
     820:	06070c00 	streq	r0, [r7], -r0, lsl #24
     824:	04000006 	streq	r0, [r0], #-6
     828:	00007d1a 	andeq	r7, r0, sl, lsl sp
     82c:	0f071000 	svceq	0x00071000
     830:	04000006 	streq	r0, [r0], #-6
     834:	00007d1b 	andeq	r7, r0, fp, lsl sp
     838:	18071400 	stmdane	r7, {sl, ip}
     83c:	04000006 	streq	r0, [r0], #-6
     840:	00007d1c 	andeq	r7, r0, ip, lsl sp
     844:	03001800 	movweq	r1, #2048	; 0x800
     848:	000006a0 	andeq	r0, r0, r0, lsr #13
     84c:	00821d04 	addeq	r1, r2, r4, lsl #26
     850:	b0080000 	andlt	r0, r8, r0
     854:	01000006 	tsteq	r0, r6
     858:	0000fb0e 	andeq	pc, r0, lr, lsl #22
     85c:	00030500 	andeq	r0, r3, r0, lsl #10
     860:	0900008b 	stmdbeq	r0, {r0, r1, r3, r7}
     864:	0000df04 	andeq	sp, r0, r4, lsl #30
     868:	068b0a00 	streq	r0, [fp], r0, lsl #20
     86c:	15010000 	strne	r0, [r1, #-0]
     870:	0000837c 	andeq	r8, r0, ip, ror r3
     874:	00000058 	andeq	r0, r0, r8, asr r0
     878:	01319c01 	teqeq	r1, r1, lsl #24
     87c:	750b0000 	strvc	r0, [fp, #-0]
     880:	15010073 	strne	r0, [r1, #-115]	; 0xffffff8d
     884:	00000072 	andeq	r0, r0, r2, ror r0
     888:	0c6c9102 	stfeqp	f1, [ip], #-8
     88c:	01007374 	tsteq	r0, r4, ror r3
     890:	00007d17 	andeq	r7, r0, r7, lsl sp
     894:	74910200 	ldrvc	r0, [r1], #512	; 0x200
     898:	06780d00 	ldrbteq	r0, [r8], -r0, lsl #26
     89c:	10010000 	andne	r0, r1, r0
     8a0:	000000fb 	strdeq	r0, [r0], -fp
     8a4:	00008358 	andeq	r8, r0, r8, asr r3
     8a8:	00000024 	andeq	r0, r0, r4, lsr #32
     8ac:	41009c01 	tstmi	r0, r1, lsl #24
     8b0:	04000005 	streq	r0, [r0], #-5
     8b4:	00037e00 	andeq	r7, r3, r0, lsl #28
     8b8:	44010400 	strmi	r0, [r1], #-1024	; 0xfffffc00
     8bc:	0c000000 	stceq	0, cr0, [r0], {-0}
     8c0:	000006cb 	andeq	r0, r0, fp, asr #13
     8c4:	000083d4 	ldrdeq	r8, [r0], -r4
     8c8:	00000394 	muleq	r0, r4, r3
     8cc:	000004be 			; <UNDEFINED> instruction: 0x000004be
     8d0:	33060102 	movwcc	r0, #24834	; 0x6102
     8d4:	02000001 	andeq	r0, r0, #1
     8d8:	01310801 	teqeq	r1, r1, lsl #16
     8dc:	02020000 	andeq	r0, r2, #0
     8e0:	0001bf05 	andeq	fp, r1, r5, lsl #30
     8e4:	07020200 	streq	r0, [r2, -r0, lsl #4]
     8e8:	0000013f 	andeq	r0, r0, pc, lsr r1
     8ec:	b6050402 	strlt	r0, [r5], -r2, lsl #8
     8f0:	03000001 	movweq	r0, #1
     8f4:	00000158 	andeq	r0, r0, r8, asr r1
     8f8:	004f4102 	subeq	r4, pc, r2, lsl #2
     8fc:	04020000 	streq	r0, [r2], #-0
     900:	00018607 	andeq	r8, r1, r7, lsl #12
     904:	05080200 	streq	r0, [r8, #-512]	; 0xfffffe00
     908:	000001b1 			; <UNDEFINED> instruction: 0x000001b1
     90c:	81070802 	tsthi	r7, r2, lsl #16
     910:	04000001 	streq	r0, [r0], #-1
     914:	6e690504 	cdpvs	5, 6, cr0, cr9, cr4, {0}
     918:	64050074 	strvs	r0, [r5], #-116	; 0xffffff8c
     91c:	02000000 	andeq	r0, r0, #0
     920:	018b0704 	orreq	r0, fp, r4, lsl #14
     924:	5a030000 	bpl	c092c <_heap+0x40928>
     928:	03000001 	movweq	r0, #1
     92c:	00004430 	andeq	r4, r0, r0, lsr r4
     930:	00770500 	rsbseq	r0, r7, r0, lsl #10
     934:	82060000 	andhi	r0, r6, #0
     938:	03000000 	movweq	r0, #0
     93c:	00000312 	andeq	r0, r0, r2, lsl r3
     940:	00821204 	addeq	r1, r2, r4, lsl #4
     944:	ca030000 	bgt	c094c <_heap+0x40948>
     948:	04000002 	streq	r0, [r0], #-2
     94c:	00008713 	andeq	r8, r0, r3, lsl r7
     950:	03810300 	orreq	r0, r1, #0, 6
     954:	14040000 	strne	r0, [r4], #-0
     958:	00000082 	andeq	r0, r0, r2, lsl #1
     95c:	34052c07 	strcc	r2, [r5], #-3079	; 0xfffff3f9
     960:	0000013a 	andeq	r0, r0, sl, lsr r1
     964:	00051b08 	andeq	r1, r5, r8, lsl #22
     968:	8c350500 	cfldr32hi	mvfx0, [r5], #-0
     96c:	00000000 	andeq	r0, r0, r0
     970:	0005ee08 	andeq	lr, r5, r8, lsl #28
     974:	8c360500 	cfldr32hi	mvfx0, [r6], #-0
     978:	04000000 	streq	r0, [r0], #-0
     97c:	0005df08 	andeq	sp, r5, r8, lsl #30
     980:	8c370500 	cfldr32hi	mvfx0, [r7], #-0
     984:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
     988:	00052908 	andeq	r2, r5, r8, lsl #18
     98c:	8c380500 	cfldr32hi	mvfx0, [r8], #-0
     990:	0c000000 	stceq	0, cr0, [r0], {-0}
     994:	00041b08 	andeq	r1, r4, r8, lsl #22
     998:	8c390500 	cfldr32hi	mvfx0, [r9], #-0
     99c:	10000000 	andne	r0, r0, r0
     9a0:	0003db08 	andeq	sp, r3, r8, lsl #22
     9a4:	973a0500 	ldrls	r0, [sl, -r0, lsl #10]!
     9a8:	14000000 	strne	r0, [r0], #-0
     9ac:	0004ef08 	andeq	lr, r4, r8, lsl #30
     9b0:	973b0500 	ldrls	r0, [fp, -r0, lsl #10]!
     9b4:	18000000 	stmdane	r0, {}	; <UNPREDICTABLE>
     9b8:	00058908 	andeq	r8, r5, r8, lsl #18
     9bc:	8c3c0500 	cfldr32hi	mvfx0, [ip], #-0
     9c0:	1c000000 	stcne	0, cr0, [r0], {-0}
     9c4:	00050b08 	andeq	r0, r5, r8, lsl #22
     9c8:	8c3d0500 	cfldr32hi	mvfx0, [sp], #-0
     9cc:	20000000 	andcs	r0, r0, r0
     9d0:	00054708 	andeq	r4, r5, r8, lsl #14
     9d4:	973e0500 	ldrls	r0, [lr, -r0, lsl #10]!
     9d8:	24000000 	strcs	r0, [r0], #-0
     9dc:	0004b008 	andeq	fp, r4, r8
     9e0:	8c3f0500 	cfldr32hi	mvfx0, [pc], #-0	; 9e8 <CPSR_IRQ_INHIBIT+0x968>
     9e4:	28000000 	stmdacs	r0, {}	; <UNPREDICTABLE>
     9e8:	057e0300 	ldrbeq	r0, [lr, #-768]!	; 0xfffffd00
     9ec:	40050000 	andmi	r0, r5, r0
     9f0:	000000ad 	andeq	r0, r0, sp, lsr #1
     9f4:	42050807 	andmi	r0, r5, #458752	; 0x70000
     9f8:	00000166 	andeq	r0, r0, r6, ror #2
     9fc:	0007ab08 	andeq	sl, r7, r8, lsl #22
     a00:	97430500 	strbls	r0, [r3, -r0, lsl #10]
     a04:	00000000 	andeq	r0, r0, r0
     a08:	0006bf08 	andeq	fp, r6, r8, lsl #30
     a0c:	8c440500 	cfstr64hi	mvdx0, [r4], {-0}
     a10:	04000000 	streq	r0, [r0], #-0
     a14:	077c0300 	ldrbeq	r0, [ip, -r0, lsl #6]!
     a18:	45050000 	strmi	r0, [r5, #-0]
     a1c:	00000145 	andeq	r0, r0, r5, asr #2
     a20:	5506a407 	strpl	sl, [r6, #-1031]	; 0xfffffbf9
     a24:	00000366 	andeq	r0, r0, r6, ror #6
     a28:	0001e008 	andeq	lr, r1, r8
     a2c:	8c560600 	mrrchi	6, 0, r0, r6, cr0
     a30:	00000000 	andeq	r0, r0, r0
     a34:	0001e808 	andeq	lr, r1, r8, lsl #16
     a38:	8c570600 	mrrchi	6, 0, r0, r7, cr0
     a3c:	04000000 	streq	r0, [r0], #-0
     a40:	0001f008 	andeq	pc, r1, r8
     a44:	8c580600 	mrrchi	6, 0, r0, r8, cr0
     a48:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
     a4c:	0001f808 	andeq	pc, r1, r8, lsl #16
     a50:	8c590600 	mrrchi	6, 0, r0, r9, cr0
     a54:	0c000000 	stceq	0, cr0, [r0], {-0}
     a58:	00020008 	andeq	r0, r2, r8
     a5c:	8c5a0600 	mrrchi	6, 0, r0, sl, cr0
     a60:	10000000 	andne	r0, r0, r0
     a64:	00020808 	andeq	r0, r2, r8, lsl #16
     a68:	8c5b0600 	mrrchi	6, 0, r0, fp, cr0
     a6c:	14000000 	strne	r0, [r0], #-0
     a70:	00024608 	andeq	r4, r2, r8, lsl #12
     a74:	975c0600 	ldrbls	r0, [ip, -r0, lsl #12]
     a78:	18000000 	stmdane	r0, {}	; <UNPREDICTABLE>
     a7c:	0001d208 	andeq	sp, r1, r8, lsl #4
     a80:	a25d0600 	subsge	r0, sp, #0, 12
     a84:	1c000000 	stcne	0, cr0, [r0], {-0}
     a88:	0001d908 	andeq	sp, r1, r8, lsl #18
     a8c:	a25e0600 	subsge	r0, lr, #0, 12
     a90:	20000000 	andcs	r0, r0, r0
     a94:	00025008 	andeq	r5, r2, r8
     a98:	975f0600 	ldrbls	r0, [pc, -r0, lsl #12]
     a9c:	24000000 	strcs	r0, [r0], #-0
     aa0:	0003a008 	andeq	sl, r3, r8
     aa4:	a2600600 	rsbge	r0, r0, #0, 12
     aa8:	28000000 	stmdacs	r0, {}	; <UNPREDICTABLE>
     aac:	0002c308 	andeq	ip, r2, r8, lsl #6
     ab0:	a2610600 	rsbge	r0, r1, #0, 12
     ab4:	2c000000 	stccs	0, cr0, [r0], {-0}
     ab8:	00025a08 	andeq	r5, r2, r8, lsl #20
     abc:	97620600 	strbls	r0, [r2, -r0, lsl #12]!
     ac0:	30000000 	andcc	r0, r0, r0
     ac4:	00034d08 	andeq	r4, r3, r8, lsl #26
     ac8:	a2630600 	rsbge	r0, r3, #0, 12
     acc:	34000000 	strcc	r0, [r0], #-0
     ad0:	00035408 	andeq	r5, r3, r8, lsl #8
     ad4:	a2640600 	rsbge	r0, r4, #0, 12
     ad8:	38000000 	stmdacc	r0, {}	; <UNPREDICTABLE>
     adc:	00026408 	andeq	r6, r2, r8, lsl #8
     ae0:	97650600 	strbls	r0, [r5, -r0, lsl #12]!
     ae4:	3c000000 	stccc	0, cr0, [r0], {-0}
     ae8:	00027808 	andeq	r7, r2, r8, lsl #16
     aec:	a2660600 	rsbge	r0, r6, #0, 12
     af0:	40000000 	andmi	r0, r0, r0
     af4:	00027f08 	andeq	r7, r2, r8, lsl #30
     af8:	a2670600 	rsbge	r0, r7, #0, 12
     afc:	44000000 	strmi	r0, [r0], #-0
     b00:	00035b08 	andeq	r5, r3, r8, lsl #22
     b04:	97680600 	strbls	r0, [r8, -r0, lsl #12]!
     b08:	48000000 	stmdami	r0, {}	; <UNPREDICTABLE>
     b0c:	00023808 	andeq	r3, r2, r8, lsl #16
     b10:	a2690600 	rsbge	r0, r9, #0, 12
     b14:	4c000000 	stcmi	0, cr0, [r0], {-0}
     b18:	00023f08 	andeq	r3, r2, r8, lsl #30
     b1c:	a26a0600 	rsbge	r0, sl, #0, 12
     b20:	50000000 	andpl	r0, r0, r0
     b24:	00026e08 	andeq	r6, r2, r8, lsl #28
     b28:	976b0600 	strbls	r0, [fp, -r0, lsl #12]!
     b2c:	54000000 	strpl	r0, [r0], #-0
     b30:	00038e08 	andeq	r8, r3, r8, lsl #28
     b34:	a26c0600 	rsbge	r0, ip, #0, 12
     b38:	58000000 	stmdapl	r0, {}	; <UNPREDICTABLE>
     b3c:	00021008 	andeq	r1, r2, r8
     b40:	a26d0600 	rsbge	r0, sp, #0, 12
     b44:	5c000000 	stcpl	0, cr0, [r0], {-0}
     b48:	00036508 	andeq	r6, r3, r8, lsl #10
     b4c:	976e0600 	strbls	r0, [lr, -r0, lsl #12]!
     b50:	60000000 	andvs	r0, r0, r0
     b54:	0002df08 	andeq	sp, r2, r8, lsl #30
     b58:	a26f0600 	rsbge	r0, pc, #0, 12
     b5c:	64000000 	strvs	r0, [r0], #-0
     b60:	0002e608 	andeq	lr, r2, r8, lsl #12
     b64:	a2700600 	rsbsge	r0, r0, #0, 12
     b68:	68000000 	stmdavs	r0, {}	; <UNPREDICTABLE>
     b6c:	00036f08 	andeq	r6, r3, r8, lsl #30
     b70:	97710600 	ldrbls	r0, [r1, -r0, lsl #12]!
     b74:	6c000000 	stcvs	0, cr0, [r0], {-0}
     b78:	00029a08 	andeq	r9, r2, r8, lsl #20
     b7c:	a2720600 	rsbsge	r0, r2, #0, 12
     b80:	70000000 	andvc	r0, r0, r0
     b84:	00030b08 	andeq	r0, r3, r8, lsl #22
     b88:	a2730600 	rsbsge	r0, r3, #0, 12
     b8c:	74000000 	strvc	r0, [r0], #-0
     b90:	00028608 	andeq	r8, r2, r8, lsl #12
     b94:	97740600 	ldrbls	r0, [r4, -r0, lsl #12]!
     b98:	78000000 	stmdavc	r0, {}	; <UNPREDICTABLE>
     b9c:	00030308 	andeq	r0, r3, r8, lsl #6
     ba0:	a2750600 	rsbsge	r0, r5, #0, 12
     ba4:	7c000000 	stcvc	0, cr0, [r0], {-0}
     ba8:	0002d708 	andeq	sp, r2, r8, lsl #14
     bac:	a2760600 	rsbsge	r0, r6, #0, 12
     bb0:	80000000 	andhi	r0, r0, r0
     bb4:	00029008 	andeq	r9, r2, r8
     bb8:	97770600 	ldrbls	r0, [r7, -r0, lsl #12]!
     bbc:	84000000 	strhi	r0, [r0], #-0
     bc0:	0002b308 	andeq	fp, r2, r8, lsl #6
     bc4:	a2780600 	rsbsge	r0, r8, #0, 12
     bc8:	88000000 	stmdahi	r0, {}	; <UNPREDICTABLE>
     bcc:	0002bb08 	andeq	fp, r2, r8, lsl #22
     bd0:	a2790600 	rsbsge	r0, r9, #0, 12
     bd4:	8c000000 	stchi	0, cr0, [r0], {-0}
     bd8:	0002ed08 	andeq	lr, r2, r8, lsl #26
     bdc:	977a0600 	ldrbls	r0, [sl, -r0, lsl #12]!
     be0:	90000000 	andls	r0, r0, r0
     be4:	0002a108 	andeq	sl, r2, r8, lsl #2
     be8:	a27b0600 	rsbsge	r0, fp, #0, 12
     bec:	94000000 	strls	r0, [r0], #-0
     bf0:	00021708 	andeq	r1, r2, r8, lsl #14
     bf4:	a27c0600 	rsbsge	r0, ip, #0, 12
     bf8:	98000000 	stmdals	r0, {}	; <UNPREDICTABLE>
     bfc:	00022108 	andeq	r2, r2, r8, lsl #2
     c00:	a27d0600 	rsbsge	r0, sp, #0, 12
     c04:	9c000000 	stcls	0, cr0, [r0], {-0}
     c08:	0002f808 	andeq	pc, r2, r8, lsl #16
     c0c:	977e0600 	ldrbls	r0, [lr, -r0, lsl #12]!
     c10:	a0000000 	andge	r0, r0, r0
     c14:	03950300 	orrseq	r0, r5, #0, 6
     c18:	7f060000 	svcvc	0x00060000
     c1c:	00000171 	andeq	r0, r0, r1, ror r1
     c20:	02071807 	andeq	r1, r7, #458752	; 0x70000
     c24:	000003aa 	andeq	r0, r0, sl, lsr #7
     c28:	00075808 	andeq	r5, r7, r8, lsl #16
     c2c:	aa040700 	bge	102834 <_heap+0x82830>
     c30:	00000003 	andeq	r0, r0, r3
     c34:	0006f908 	andeq	pc, r6, r8, lsl #18
     c38:	64050700 	strvs	r0, [r5], #-1792	; 0xfffff900
     c3c:	0c000000 	stceq	0, cr0, [r0], {-0}
     c40:	00073008 	andeq	r3, r7, r8
     c44:	64060700 	strvs	r0, [r6], #-1792	; 0xfffff900
     c48:	10000000 	andne	r0, r0, r0
     c4c:	0007df08 	andeq	sp, r7, r8, lsl #30
     c50:	64070700 	strvs	r0, [r7], #-1792	; 0xfffff900
     c54:	14000000 	strne	r0, [r0], #-0
     c58:	03c10900 	biceq	r0, r1, #0, 18
     c5c:	03ba0000 			; <UNDEFINED> instruction: 0x03ba0000
     c60:	ba0a0000 	blt	280c68 <_heap+0x200c64>
     c64:	09000003 	stmdbeq	r0, {r0, r1}
     c68:	07040200 	streq	r0, [r4, -r0, lsl #4]
     c6c:	00000791 	muleq	r0, r1, r7
     c70:	3a080102 	bcc	201080 <_heap+0x18107c>
     c74:	03000001 	movweq	r0, #1
     c78:	00000722 	andeq	r0, r0, r2, lsr #14
     c7c:	03710807 	cmneq	r1, #458752	; 0x70000
     c80:	4c0b0000 	stcmi	0, cr0, [fp], {-0}
     c84:	01000007 	tsteq	r0, r7
     c88:	0003e418 	andeq	lr, r3, r8, lsl r4
     c8c:	04030500 	streq	r0, [r3], #-1280	; 0xfffffb00
     c90:	0c00008b 	stceq	0, cr0, [r0], {139}	; 0x8b
     c94:	00016604 	andeq	r6, r1, r4, lsl #12
     c98:	040f0b00 	streq	r0, [pc], #-2816	; ca0 <CPSR_IRQ_INHIBIT+0xc20>
     c9c:	19010000 	stmdbne	r1, {}	; <UNPREDICTABLE>
     ca0:	000003fb 	strdeq	r0, [r0], -fp
     ca4:	8b080305 	blhi	2018c0 <_heap+0x1818bc>
     ca8:	040c0000 	streq	r0, [ip], #-0
     cac:	0000013a 	andeq	r0, r0, sl, lsr r1
     cb0:	0007530b 	andeq	r5, r7, fp, lsl #6
     cb4:	c81a0100 	ldmdagt	sl, {r8}
     cb8:	05000003 	streq	r0, [r0, #-3]
     cbc:	008b5003 	addeq	r5, fp, r3
     cc0:	079a0d00 	ldreq	r0, [sl, r0, lsl #26]
     cc4:	6d010000 	stcvs	0, cr0, [r1, #-0]
     cc8:	00008688 	andeq	r8, r0, r8, lsl #13
     ccc:	000000e0 	andeq	r0, r0, r0, ror #1
     cd0:	04449c01 	strbeq	r9, [r4], #-3073	; 0xfffff3ff
     cd4:	360b0000 	strcc	r0, [fp], -r0
     cd8:	01000004 	tsteq	r0, r4
     cdc:	0000826f 	andeq	r8, r0, pc, ror #4
     ce0:	74910200 	ldrvc	r0, [r1], #512	; 0x200
     ce4:	0007c40b 	andeq	ip, r7, fp, lsl #8
     ce8:	c1700100 	cmngt	r0, r0, lsl #2
     cec:	02000003 	andeq	r0, r0, #3
     cf0:	0e007391 	mcreq	3, 0, r7, cr0, cr1, {4}
     cf4:	0000075f 	andeq	r0, r0, pc, asr r7
     cf8:	00646801 	rsbeq	r6, r4, r1, lsl #16
     cfc:	86500000 	ldrbhi	r0, [r0], -r0
     d00:	00380000 	eorseq	r0, r8, r0
     d04:	9c010000 	stcls	0, cr0, [r1], {-0}
     d08:	0000047a 	andeq	r0, r0, sl, ror r4
     d0c:	00043f0f 	andeq	r3, r4, pc, lsl #30
     d10:	7a680100 	bvc	1a01118 <_heap+0x1981114>
     d14:	02000004 	andeq	r0, r0, #4
     d18:	350f7491 	strcc	r7, [pc, #-1169]	; 88f <CPSR_IRQ_INHIBIT+0x80f>
     d1c:	01000007 	tsteq	r0, r7
     d20:	00006468 	andeq	r6, r0, r8, ror #8
     d24:	70910200 	addsvc	r0, r1, r0, lsl #4
     d28:	c1040c00 	tstgt	r4, r0, lsl #24
     d2c:	0e000003 	cdpeq	0, 0, cr0, cr0, cr3, {0}
     d30:	0000073c 	andeq	r0, r0, ip, lsr r7
     d34:	00645d01 	rsbeq	r5, r4, r1, lsl #26
     d38:	85ec0000 	strbhi	r0, [ip, #0]!
     d3c:	00640000 	rsbeq	r0, r4, r0
     d40:	9c010000 	stcls	0, cr0, [r1], {-0}
     d44:	000004c2 	andeq	r0, r0, r2, asr #9
     d48:	0007290f 	andeq	r2, r7, pc, lsl #18
     d4c:	7a5d0100 	bvc	1741154 <_heap+0x16c1150>
     d50:	02000004 	andeq	r0, r0, #4
     d54:	6c106c91 	ldcvs	12, cr6, [r0], {145}	; 0x91
     d58:	01006e65 	tsteq	r0, r5, ror #28
     d5c:	0000645d 	andeq	r6, r0, sp, asr r4
     d60:	68910200 	ldmvs	r1, {r9}
     d64:	01006911 	tsteq	r0, r1, lsl r9
     d68:	0000645f 	andeq	r6, r0, pc, asr r4
     d6c:	74910200 	ldrvc	r0, [r1], #512	; 0x200
     d70:	070e1200 	streq	r1, [lr, -r0, lsl #4]
     d74:	54010000 	strpl	r0, [r1], #-0
     d78:	00008598 	muleq	r0, r8, r5
     d7c:	00000054 	andeq	r0, r0, r4, asr r0
     d80:	04e49c01 	strbteq	r9, [r4], #3073	; 0xc01
     d84:	63100000 	tstvs	r0, #0
     d88:	c1540100 	cmpgt	r4, r0, lsl #2
     d8c:	02000003 	andeq	r0, r0, #3
     d90:	0d007791 	stceq	7, cr7, [r0, #-580]	; 0xfffffdbc
     d94:	000007b3 			; <UNDEFINED> instruction: 0x000007b3
     d98:	841c2601 	ldrhi	r2, [ip], #-1537	; 0xfffff9ff
     d9c:	017c0000 	cmneq	ip, r0
     da0:	9c010000 	stcls	0, cr0, [r1], {-0}
     da4:	00000514 	andeq	r0, r0, r4, lsl r5
     da8:	01006911 	tsteq	r0, r1, lsl r9
     dac:	00006b28 	andeq	r6, r0, r8, lsr #22
     db0:	70910200 	addsvc	r0, r1, r0, lsl #4
     db4:	0007740b 	andeq	r7, r7, fp, lsl #8
     db8:	142a0100 	strtne	r0, [sl], #-256	; 0xffffff00
     dbc:	02000005 	andeq	r0, r0, #5
     dc0:	0c007491 	cfstrseq	mvf7, [r0], {145}	; 0x91
     dc4:	00036604 	andeq	r6, r3, r4, lsl #12
     dc8:	06fe1300 	ldrbteq	r1, [lr], r0, lsl #6
     dcc:	21010000 	mrscs	r0, (UNDEF: 1)
     dd0:	000003fb 	strdeq	r0, [r0], -fp
     dd4:	000083f8 	strdeq	r8, [r0], -r8	; <UNPREDICTABLE>
     dd8:	00000024 	andeq	r0, r0, r4, lsr #32
     ddc:	86139c01 	ldrhi	r9, [r3], -r1, lsl #24
     de0:	01000007 	tsteq	r0, r7
     de4:	0003e41c 	andeq	lr, r3, ip, lsl r4
     de8:	0083d400 	addeq	sp, r3, r0, lsl #8
     dec:	00002400 	andeq	r2, r0, r0, lsl #8
     df0:	009c0100 	addseq	r0, ip, r0, lsl #2
     df4:	0000090a 	andeq	r0, r0, sl, lsl #18
     df8:	049e0004 	ldreq	r0, [lr], #4
     dfc:	01040000 	mrseq	r0, (UNDEF: 4)
     e00:	00000044 	andeq	r0, r0, r4, asr #32
     e04:	00082e0c 	andeq	r2, r8, ip, lsl #28
     e08:	000a2400 	andeq	r2, sl, r0, lsl #8
     e0c:	00876800 	addeq	r6, r7, r0, lsl #16
     e10:	00009000 	andeq	r9, r0, r0
     e14:	00063400 	andeq	r3, r6, r0, lsl #8
     e18:	06010200 	streq	r0, [r1], -r0, lsl #4
     e1c:	00000133 	andeq	r0, r0, r3, lsr r1
     e20:	31080102 	tstcc	r8, r2, lsl #2
     e24:	02000001 	andeq	r0, r0, #1
     e28:	01bf0502 			; <UNDEFINED> instruction: 0x01bf0502
     e2c:	02020000 	andeq	r0, r2, #0
     e30:	00013f07 	andeq	r3, r1, r7, lsl #30
     e34:	05040200 	streq	r0, [r4, #-512]	; 0xfffffe00
     e38:	000001b6 			; <UNDEFINED> instruction: 0x000001b6
     e3c:	86070402 	strhi	r0, [r7], -r2, lsl #8
     e40:	02000001 	andeq	r0, r0, #1
     e44:	01b10508 			; <UNDEFINED> instruction: 0x01b10508
     e48:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
     e4c:	00018107 	andeq	r8, r1, r7, lsl #2
     e50:	05040300 	streq	r0, [r4, #-768]	; 0xfffffd00
     e54:	00746e69 	rsbseq	r6, r4, r9, ror #28
     e58:	8b070402 	blhi	1c1e68 <_heap+0x141e64>
     e5c:	02000001 	andeq	r0, r0, #1
     e60:	09e40408 	stmibeq	r4!, {r3, sl}^
     e64:	04040000 	streq	r0, [r4], #-0
     e68:	000a5b05 	andeq	r5, sl, r5, lsl #22
     e6c:	5d070200 	sfmpl	f0, 4, [r7, #-0]
     e70:	05000000 	streq	r0, [r0, #-0]
     e74:	00000a1d 	andeq	r0, r0, sp, lsl sl
     e78:	00412c03 	subeq	r2, r1, r3, lsl #24
     e7c:	1c050000 	stcne	0, cr0, [r5], {-0}
     e80:	0300000b 	movweq	r0, #11
     e84:	00004172 	andeq	r4, r0, r2, ror r1
     e88:	09b20600 	ldmibeq	r2!, {r9, sl}
     e8c:	65040000 	strvs	r0, [r4, #-0]
     e90:	00006401 	andeq	r6, r0, r1, lsl #8
     e94:	03040700 	movweq	r0, #18176	; 0x4700
     e98:	0000c0a6 	andeq	ip, r0, r6, lsr #1
     e9c:	09ac0800 	stmibeq	ip!, {fp}
     ea0:	a8030000 	stmdage	r3, {}	; <UNPREDICTABLE>
     ea4:	00000095 	muleq	r0, r5, r0
     ea8:	00095e08 	andeq	r5, r9, r8, lsl #28
     eac:	c0a90300 	adcgt	r0, r9, r0, lsl #6
     eb0:	00000000 	andeq	r0, r0, r0
     eb4:	00002c09 	andeq	r2, r0, r9, lsl #24
     eb8:	0000d000 	andeq	sp, r0, r0
     ebc:	00d00a00 	sbcseq	r0, r0, r0, lsl #20
     ec0:	00030000 	andeq	r0, r3, r0
     ec4:	91070402 	tstls	r7, r2, lsl #8
     ec8:	0b000007 	bleq	eec <CPSR_IRQ_INHIBIT+0xe6c>
     ecc:	f8a30308 			; <UNDEFINED> instruction: 0xf8a30308
     ed0:	0c000000 	stceq	0, cr0, [r0], {-0}
     ed4:	00000b06 	andeq	r0, r0, r6, lsl #22
     ed8:	005da503 	subseq	sl, sp, r3, lsl #10
     edc:	0c000000 	stceq	0, cr0, [r0], {-0}
     ee0:	00000b0e 	andeq	r0, r0, lr, lsl #22
     ee4:	00a1aa03 	adceq	sl, r1, r3, lsl #20
     ee8:	00040000 	andeq	r0, r4, r0
     eec:	000a9905 	andeq	r9, sl, r5, lsl #18
     ef0:	d7ab0300 	strle	r0, [fp, r0, lsl #6]!
     ef4:	05000000 	streq	r0, [r0, #-0]
     ef8:	0000091c 	andeq	r0, r0, ip, lsl r9
     efc:	0074af03 	rsbseq	sl, r4, r3, lsl #30
     f00:	61050000 	mrsvs	r0, (UNDEF: 5)
     f04:	0500000b 	streq	r0, [r0, #-11]
     f08:	00004816 	andeq	r4, r0, r6, lsl r8
     f0c:	092d0d00 	pusheq	{r8, sl, fp}
     f10:	05180000 	ldreq	r0, [r8, #-0]
     f14:	00016c2d 	andeq	r6, r1, sp, lsr #24
     f18:	0aba0c00 	beq	fee83f20 <_heap+0xfee03f1c>
     f1c:	2f050000 	svccs	0x00050000
     f20:	0000016c 	andeq	r0, r0, ip, ror #2
     f24:	6b5f0e00 	blvs	17c472c <_heap+0x1744728>
     f28:	5d300500 	cfldr32pl	mvfx0, [r0, #-0]
     f2c:	04000000 	streq	r0, [r0], #-0
     f30:	000af10c 	andeq	pc, sl, ip, lsl #2
     f34:	5d300500 	cfldr32pl	mvfx0, [r0, #-0]
     f38:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
     f3c:	0009160c 	andeq	r1, r9, ip, lsl #12
     f40:	5d300500 	cfldr32pl	mvfx0, [r0, #-0]
     f44:	0c000000 	stceq	0, cr0, [r0], {-0}
     f48:	000ba80c 	andeq	sl, fp, ip, lsl #16
     f4c:	5d300500 	cfldr32pl	mvfx0, [r0, #-0]
     f50:	10000000 	andne	r0, r0, r0
     f54:	00785f0e 	rsbseq	r5, r8, lr, lsl #30
     f58:	01723105 	cmneq	r2, r5, lsl #2
     f5c:	00140000 	andseq	r0, r4, r0
     f60:	0119040f 	tsteq	r9, pc, lsl #8
     f64:	0e090000 	cdpeq	0, 0, cr0, cr9, cr0, {0}
     f68:	82000001 	andhi	r0, r0, #1
     f6c:	0a000001 	beq	f78 <CPSR_IRQ_INHIBIT+0xef8>
     f70:	000000d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
     f74:	590d0000 	stmdbpl	sp, {}	; <UNPREDICTABLE>
     f78:	24000009 	strcs	r0, [r0], #-9
     f7c:	01fb3505 	mvnseq	r3, r5, lsl #10
     f80:	7f0c0000 	svcvc	0x000c0000
     f84:	05000008 	streq	r0, [r0, #-8]
     f88:	00005d37 	andeq	r5, r0, r7, lsr sp
     f8c:	240c0000 	strcs	r0, [ip], #-0
     f90:	0500000b 	streq	r0, [r0, #-11]
     f94:	00005d38 	andeq	r5, r0, r8, lsr sp
     f98:	8e0c0400 	cfcpyshi	mvf0, mvf12
     f9c:	05000008 	streq	r0, [r0, #-8]
     fa0:	00005d39 	andeq	r5, r0, r9, lsr sp
     fa4:	1e0c0800 	cdpne	8, 0, cr0, cr12, cr0, {0}
     fa8:	0500000c 	streq	r0, [r0, #-12]
     fac:	00005d3a 	andeq	r5, r0, sl, lsr sp
     fb0:	f70c0c00 			; <UNDEFINED> instruction: 0xf70c0c00
     fb4:	05000009 	streq	r0, [r0, #-9]
     fb8:	00005d3b 	andeq	r5, r0, fp, lsr sp
     fbc:	c70c1000 	strgt	r1, [ip, -r0]
     fc0:	05000009 	streq	r0, [r0, #-9]
     fc4:	00005d3c 	andeq	r5, r0, ip, lsr sp
     fc8:	ad0c1400 	cfstrsge	mvf1, [ip, #-0]
     fcc:	0500000b 	streq	r0, [r0, #-11]
     fd0:	00005d3d 	andeq	r5, r0, sp, lsr sp
     fd4:	7b0c1800 	blvc	306fdc <_heap+0x286fd8>
     fd8:	0500000a 	streq	r0, [r0, #-10]
     fdc:	00005d3e 	andeq	r5, r0, lr, lsr sp
     fe0:	e50c1c00 	str	r1, [ip, #-3072]	; 0xfffff400
     fe4:	0500000b 	streq	r0, [r0, #-11]
     fe8:	00005d3f 	andeq	r5, r0, pc, lsr sp
     fec:	10002000 	andne	r2, r0, r0
     ff0:	0000089d 	muleq	r0, sp, r8
     ff4:	48050108 	stmdami	r5, {r3, r8}
     ff8:	0000023b 	andeq	r0, r0, fp, lsr r2
     ffc:	0009090c 	andeq	r0, r9, ip, lsl #18
    1000:	3b490500 	blcc	1242408 <_heap+0x11c2404>
    1004:	00000002 	andeq	r0, r0, r2
    1008:	0007d20c 	andeq	sp, r7, ip, lsl #4
    100c:	3b4a0500 	blcc	1282414 <_heap+0x1202410>
    1010:	80000002 	andhi	r0, r0, r2
    1014:	000b5311 	andeq	r5, fp, r1, lsl r3
    1018:	0e4c0500 	cdpeq	5, 4, cr0, cr12, cr0, {0}
    101c:	00000001 	andeq	r0, r0, r1
    1020:	08c21101 	stmiaeq	r2, {r0, r8, ip}^
    1024:	4f050000 	svcmi	0x00050000
    1028:	0000010e 	andeq	r0, r0, lr, lsl #2
    102c:	09000104 	stmdbeq	r0, {r2, r8}
    1030:	00000072 	andeq	r0, r0, r2, ror r0
    1034:	0000024b 	andeq	r0, r0, fp, asr #4
    1038:	0000d00a 	andeq	sp, r0, sl
    103c:	10001f00 	andne	r1, r0, r0, lsl #30
    1040:	00000a00 	andeq	r0, r0, r0, lsl #20
    1044:	5b050190 	blpl	14168c <_heap+0xc1688>
    1048:	00000289 	andeq	r0, r0, r9, lsl #5
    104c:	000aba0c 	andeq	fp, sl, ip, lsl #20
    1050:	895c0500 	ldmdbhi	ip, {r8, sl}^
    1054:	00000002 	andeq	r0, r0, r2
    1058:	000ad20c 	andeq	sp, sl, ip, lsl #4
    105c:	5d5d0500 	cfldr64pl	mvdx0, [sp, #-0]
    1060:	04000000 	streq	r0, [r0], #-0
    1064:	0009110c 	andeq	r1, r9, ip, lsl #2
    1068:	8f5f0500 	svchi	0x005f0500
    106c:	08000002 	stmdaeq	r0, {r1}
    1070:	00089d0c 	andeq	r9, r8, ip, lsl #26
    1074:	fb600500 	blx	180247e <_heap+0x178247a>
    1078:	88000001 	stmdahi	r0, {r0}
    107c:	4b040f00 	blmi	104c84 <_heap+0x84c80>
    1080:	09000002 	stmdbeq	r0, {r1}
    1084:	0000029f 	muleq	r0, pc, r2	; <UNPREDICTABLE>
    1088:	0000029f 	muleq	r0, pc, r2	; <UNPREDICTABLE>
    108c:	0000d00a 	andeq	sp, r0, sl
    1090:	0f001f00 	svceq	0x00001f00
    1094:	0002a504 	andeq	sl, r2, r4, lsl #10
    1098:	850d1200 	strhi	r1, [sp, #-512]	; 0xfffffe00
    109c:	0800000a 	stmdaeq	r0, {r1, r3}
    10a0:	02cb7305 	sbceq	r7, fp, #335544320	; 0x14000000
    10a4:	bd0c0000 	stclt	0, cr0, [ip, #-0]
    10a8:	0500000b 	streq	r0, [r0, #-11]
    10ac:	0002cb74 	andeq	ip, r2, r4, ror fp
    10b0:	de0c0000 	cdple	0, 0, cr0, cr12, cr0, {0}
    10b4:	05000007 	streq	r0, [r0, #-7]
    10b8:	00005d75 	andeq	r5, r0, r5, ror sp
    10bc:	0f000400 	svceq	0x00000400
    10c0:	00002c04 	andeq	r2, r0, r4, lsl #24
    10c4:	0aa40d00 	beq	fe9044cc <_heap+0xfe8844c8>
    10c8:	05680000 	strbeq	r0, [r8, #-0]!
    10cc:	0003fbb3 			; <UNDEFINED> instruction: 0x0003fbb3
    10d0:	705f0e00 	subsvc	r0, pc, r0, lsl #28
    10d4:	cbb40500 	blgt	fed024dc <_heap+0xfec824d8>
    10d8:	00000002 	andeq	r0, r0, r2
    10dc:	00725f0e 	rsbseq	r5, r2, lr, lsl #30
    10e0:	005db505 	subseq	fp, sp, r5, lsl #10
    10e4:	0e040000 	cdpeq	0, 0, cr0, cr4, cr0, {0}
    10e8:	0500775f 	streq	r7, [r0, #-1887]	; 0xfffff8a1
    10ec:	00005db6 			; <UNDEFINED> instruction: 0x00005db6
    10f0:	bb0c0800 	bllt	3030f8 <_heap+0x2830f4>
    10f4:	05000008 	streq	r0, [r0, #-8]
    10f8:	000033b7 			; <UNDEFINED> instruction: 0x000033b7
    10fc:	750c0c00 	strvc	r0, [ip, #-3072]	; 0xfffff400
    1100:	05000009 	streq	r0, [r0, #-9]
    1104:	000033b8 			; <UNDEFINED> instruction: 0x000033b8
    1108:	5f0e0e00 	svcpl	0x000e0e00
    110c:	05006662 	streq	r6, [r0, #-1634]	; 0xfffff99e
    1110:	0002a6b9 			; <UNDEFINED> instruction: 0x0002a6b9
    1114:	590c1000 	stmdbpl	ip, {ip}
    1118:	05000008 	streq	r0, [r0, #-8]
    111c:	00005dba 			; <UNDEFINED> instruction: 0x00005dba
    1120:	ab0c1800 	blge	307128 <_heap+0x287124>
    1124:	05000008 	streq	r0, [r0, #-8]
    1128:	000072c1 	andeq	r7, r0, r1, asr #5
    112c:	c90c1c00 	stmdbgt	ip, {sl, fp, ip}
    1130:	0500000c 	streq	r0, [r0, #-12]
    1134:	000568c3 	andeq	r6, r5, r3, asr #17
    1138:	b40c2000 	strlt	r2, [ip], #-0
    113c:	0500000c 	streq	r0, [r0, #-12]
    1140:	000592c5 	andeq	r9, r5, r5, asr #5
    1144:	160c2400 	strne	r2, [ip], -r0, lsl #8
    1148:	0500000b 	streq	r0, [r0, #-11]
    114c:	0005b6c8 	andeq	fp, r5, r8, asr #13
    1150:	ff0c2800 			; <UNDEFINED> instruction: 0xff0c2800
    1154:	0500000b 	streq	r0, [r0, #-11]
    1158:	0005d0c9 	andeq	sp, r5, r9, asr #1
    115c:	5f0e2c00 	svcpl	0x000e2c00
    1160:	05006275 	streq	r6, [r0, #-629]	; 0xfffffd8b
    1164:	0002a6cc 	andeq	sl, r2, ip, asr #13
    1168:	5f0e3000 	svcpl	0x000e3000
    116c:	05007075 	streq	r7, [r0, #-117]	; 0xffffff8b
    1170:	0002cbcd 	andeq	ip, r2, sp, asr #23
    1174:	5f0e3800 	svcpl	0x000e3800
    1178:	05007275 	streq	r7, [r0, #-629]	; 0xfffffd8b
    117c:	00005dce 	andeq	r5, r0, lr, asr #27
    1180:	880c3c00 	stmdahi	ip, {sl, fp, ip, sp}
    1184:	05000008 	streq	r0, [r0, #-8]
    1188:	0005d6d1 	ldrdeq	sp, [r5], -r1
    118c:	d70c4000 	strle	r4, [ip, -r0]
    1190:	0500000b 	streq	r0, [r0, #-11]
    1194:	0005e6d2 	ldrdeq	lr, [r5], -r2
    1198:	5f0e4300 	svcpl	0x000e4300
    119c:	0500626c 	streq	r6, [r0, #-620]	; 0xfffffd94
    11a0:	0002a6d5 	ldrdeq	sl, [r2], -r5
    11a4:	d10c4400 	tstle	ip, r0, lsl #8
    11a8:	05000008 	streq	r0, [r0, #-8]
    11ac:	00005dd8 	ldrdeq	r5, [r0], -r8
    11b0:	e20c4c00 	and	r4, ip, #0, 24
    11b4:	05000008 	streq	r0, [r0, #-8]
    11b8:	00007fd9 	ldrdeq	r7, [r0], -r9
    11bc:	3e0c5000 	cdpcc	0, 0, cr5, cr12, cr0, {0}
    11c0:	05000004 	streq	r0, [r0, #-4]
    11c4:	000419dc 	ldrdeq	r1, [r4], -ip
    11c8:	b90c5400 	stmdblt	ip, {sl, ip, lr}
    11cc:	05000009 	streq	r0, [r0, #-9]
    11d0:	000103e0 	andeq	r0, r1, r0, ror #7
    11d4:	ac0c5800 	stcge	8, cr5, [ip], {-0}
    11d8:	0500000a 	streq	r0, [r0, #-10]
    11dc:	0000f8e2 	andeq	pc, r0, r2, ror #17
    11e0:	bf0c5c00 	svclt	0x000c5c00
    11e4:	05000009 	streq	r0, [r0, #-9]
    11e8:	00005de3 	andeq	r5, r0, r3, ror #27
    11ec:	13006400 	movwne	r6, #1024	; 0x400
    11f0:	0000005d 	andeq	r0, r0, sp, asr r0
    11f4:	00000419 	andeq	r0, r0, r9, lsl r4
    11f8:	00041914 	andeq	r1, r4, r4, lsl r9
    11fc:	00721400 	rsbseq	r1, r2, r0, lsl #8
    1200:	56140000 	ldrpl	r0, [r4], -r0
    1204:	14000005 	strne	r0, [r0], #-5
    1208:	0000005d 	andeq	r0, r0, sp, asr r0
    120c:	24040f00 	strcs	r0, [r4], #-3840	; 0xfffff100
    1210:	15000004 	strne	r0, [r0, #-4]
    1214:	00000419 	andeq	r0, r0, r9, lsl r4
    1218:	000af916 	andeq	pc, sl, r6, lsl r9	; <UNPREDICTABLE>
    121c:	05042800 	streq	r2, [r4, #-2048]	; 0xfffff800
    1220:	05560238 	ldrbeq	r0, [r6, #-568]	; 0xfffffdc8
    1224:	74170000 	ldrvc	r0, [r7], #-0
    1228:	0500000a 	streq	r0, [r0, #-10]
    122c:	005d023a 	subseq	r0, sp, sl, lsr r2
    1230:	17000000 	strne	r0, [r0, -r0]
    1234:	000008ca 	andeq	r0, r0, sl, asr #17
    1238:	3d023f05 	stccc	15, cr3, [r2, #-20]	; 0xffffffec
    123c:	04000006 	streq	r0, [r0], #-6
    1240:	00096517 	andeq	r6, r9, r7, lsl r5
    1244:	023f0500 	eorseq	r0, pc, #0, 10
    1248:	0000063d 	andeq	r0, r0, sp, lsr r6
    124c:	09251708 	stmdbeq	r5!, {r3, r8, r9, sl, ip}
    1250:	3f050000 	svccc	0x00050000
    1254:	00063d02 	andeq	r3, r6, r2, lsl #26
    1258:	cd170c00 	ldcgt	12, cr0, [r7, #-0]
    125c:	0500000a 	streq	r0, [r0, #-10]
    1260:	005d0241 	subseq	r0, sp, r1, asr #4
    1264:	17100000 	ldrne	r0, [r0, -r0]
    1268:	00000803 	andeq	r0, r0, r3, lsl #16
    126c:	1f024205 	svcne	0x00024205
    1270:	14000008 	strne	r0, [r0], #-8
    1274:	000b8917 	andeq	r8, fp, r7, lsl r9
    1278:	02440500 	subeq	r0, r4, #0, 10
    127c:	0000005d 	andeq	r0, r0, sp, asr r0
    1280:	0ad71730 	beq	ff5c6f48 <_heap+0xff546f44>
    1284:	45050000 	strmi	r0, [r5, #-0]
    1288:	00058c02 	andeq	r8, r5, r2, lsl #24
    128c:	12173400 	andsne	r3, r7, #0, 8
    1290:	0500000a 	streq	r0, [r0, #-10]
    1294:	005d0247 	subseq	r0, sp, r7, asr #4
    1298:	17380000 	ldrne	r0, [r8, -r0]!
    129c:	00000ae7 	andeq	r0, r0, r7, ror #21
    12a0:	3a024905 	bcc	936bc <_heap+0x136b8>
    12a4:	3c000008 	stccc	0, cr0, [r0], {8}
    12a8:	0009a417 	andeq	sl, r9, r7, lsl r4
    12ac:	024c0500 	subeq	r0, ip, #0, 10
    12b0:	0000016c 	andeq	r0, r0, ip, ror #2
    12b4:	094f1740 	stmdbeq	pc, {r6, r8, r9, sl, ip}^	; <UNPREDICTABLE>
    12b8:	4d050000 	stcmi	0, cr0, [r5, #-0]
    12bc:	00005d02 	andeq	r5, r0, r2, lsl #26
    12c0:	19174400 	ldmdbne	r7, {sl, lr}
    12c4:	0500000c 	streq	r0, [r0, #-12]
    12c8:	016c024e 	cmneq	ip, lr, asr #4
    12cc:	17480000 	strbne	r0, [r8, -r0]
    12d0:	00000a51 	andeq	r0, r0, r1, asr sl
    12d4:	40024f05 	andmi	r4, r2, r5, lsl #30
    12d8:	4c000008 	stcmi	0, cr0, [r0], {8}
    12dc:	00096d17 	andeq	r6, r9, r7, lsl sp
    12e0:	02520500 	subseq	r0, r2, #0, 10
    12e4:	0000005d 	andeq	r0, r0, sp, asr r0
    12e8:	08da1750 	ldmeq	sl, {r4, r6, r8, r9, sl, ip}^
    12ec:	53050000 	movwpl	r0, #20480	; 0x5000
    12f0:	00055602 	andeq	r5, r5, r2, lsl #12
    12f4:	6d175400 	cfldrsvs	mvf5, [r7, #-0]
    12f8:	0500000a 	streq	r0, [r0, #-10]
    12fc:	07fd0276 			; <UNDEFINED> instruction: 0x07fd0276
    1300:	18580000 	ldmdane	r8, {}^	; <UNPREDICTABLE>
    1304:	00000a00 	andeq	r0, r0, r0, lsl #20
    1308:	89027a05 	stmdbhi	r2, {r0, r2, r9, fp, ip, sp, lr}
    130c:	48000002 	stmdami	r0, {r1}
    1310:	09821801 	stmibeq	r2, {r0, fp, ip}
    1314:	7b050000 	blvc	14131c <_heap+0xc1318>
    1318:	00024b02 	andeq	r4, r2, r2, lsl #22
    131c:	18014c00 	stmdane	r1, {sl, fp, lr}
    1320:	00000bcd 	andeq	r0, r0, sp, asr #23
    1324:	51027f05 	tstpl	r2, r5, lsl #30
    1328:	dc000008 	stcle	0, cr0, [r0], {8}
    132c:	08b31802 	ldmeq	r3!, {r1, fp, ip}
    1330:	84050000 	strhi	r0, [r5], #-0
    1334:	00060202 	andeq	r0, r6, r2, lsl #4
    1338:	1802e000 	stmdane	r2, {sp, lr, pc}
    133c:	00000898 	muleq	r0, r8, r8
    1340:	5d028505 	cfstr32pl	mvfx8, [r2, #-20]	; 0xffffffec
    1344:	ec000008 	stc	0, cr0, [r0], {8}
    1348:	040f0002 	streq	r0, [pc], #-2	; 1350 <CPSR_IRQ_INHIBIT+0x12d0>
    134c:	0000055c 	andeq	r0, r0, ip, asr r5
    1350:	3a080102 	bcc	201760 <_heap+0x18175c>
    1354:	15000001 	strne	r0, [r0, #-1]
    1358:	0000055c 	andeq	r0, r0, ip, asr r5
    135c:	03fb040f 	mvnseq	r0, #251658240	; 0xf000000
    1360:	5d130000 	ldcpl	0, cr0, [r3, #-0]
    1364:	8c000000 	stchi	0, cr0, [r0], {-0}
    1368:	14000005 	strne	r0, [r0], #-5
    136c:	00000419 	andeq	r0, r0, r9, lsl r4
    1370:	00007214 	andeq	r7, r0, r4, lsl r2
    1374:	058c1400 	streq	r1, [ip, #1024]	; 0x400
    1378:	5d140000 	ldcpl	0, cr0, [r4, #-0]
    137c:	00000000 	andeq	r0, r0, r0
    1380:	0563040f 	strbeq	r0, [r3, #-1039]!	; 0xfffffbf1
    1384:	040f0000 	streq	r0, [pc], #-0	; 138c <CPSR_IRQ_INHIBIT+0x130c>
    1388:	0000056e 	andeq	r0, r0, lr, ror #10
    138c:	00008a13 	andeq	r8, r0, r3, lsl sl
    1390:	0005b600 	andeq	fp, r5, r0, lsl #12
    1394:	04191400 	ldreq	r1, [r9], #-1024	; 0xfffffc00
    1398:	72140000 	andsvc	r0, r4, #0
    139c:	14000000 	strne	r0, [r0], #-0
    13a0:	0000008a 	andeq	r0, r0, sl, lsl #1
    13a4:	00005d14 	andeq	r5, r0, r4, lsl sp
    13a8:	040f0000 	streq	r0, [pc], #-0	; 13b0 <CPSR_IRQ_INHIBIT+0x1330>
    13ac:	00000598 	muleq	r0, r8, r5
    13b0:	00005d13 	andeq	r5, r0, r3, lsl sp
    13b4:	0005d000 	andeq	sp, r5, r0
    13b8:	04191400 	ldreq	r1, [r9], #-1024	; 0xfffffc00
    13bc:	72140000 	andsvc	r0, r4, #0
    13c0:	00000000 	andeq	r0, r0, r0
    13c4:	05bc040f 	ldreq	r0, [ip, #1039]!	; 0x40f
    13c8:	2c090000 	stccs	0, cr0, [r9], {-0}
    13cc:	e6000000 	str	r0, [r0], -r0
    13d0:	0a000005 	beq	13ec <CPSR_IRQ_INHIBIT+0x136c>
    13d4:	000000d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
    13d8:	2c090002 	stccs	0, cr0, [r9], {2}
    13dc:	f6000000 			; <UNDEFINED> instruction: 0xf6000000
    13e0:	0a000005 	beq	13fc <CPSR_IRQ_INHIBIT+0x137c>
    13e4:	000000d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
    13e8:	92060000 	andls	r0, r6, #0
    13ec:	0500000a 	streq	r0, [r0, #-10]
    13f0:	02d1011d 	sbcseq	r0, r1, #1073741831	; 0x40000007
    13f4:	b7190000 	ldrlt	r0, [r9, -r0]
    13f8:	0c00000b 	stceq	0, cr0, [r0], {11}
    13fc:	37012105 	strcc	r2, [r1, -r5, lsl #2]
    1400:	17000006 	strne	r0, [r0, -r6]
    1404:	00000aba 			; <UNDEFINED> instruction: 0x00000aba
    1408:	37012305 	strcc	r2, [r1, -r5, lsl #6]
    140c:	00000006 	andeq	r0, r0, r6
    1410:	00097b17 	andeq	r7, r9, r7, lsl fp
    1414:	01240500 			; <UNDEFINED> instruction: 0x01240500
    1418:	0000005d 	andeq	r0, r0, sp, asr r0
    141c:	0a8c1704 	beq	fe307034 <_heap+0xfe287030>
    1420:	25050000 	strcs	r0, [r5, #-0]
    1424:	00063d01 	andeq	r3, r6, r1, lsl #26
    1428:	0f000800 	svceq	0x00000800
    142c:	00060204 	andeq	r0, r6, r4, lsl #4
    1430:	f6040f00 			; <UNDEFINED> instruction: 0xf6040f00
    1434:	19000005 	stmdbne	r0, {r0, r2}
    1438:	000007fb 	strdeq	r0, [r0], -fp
    143c:	013d050e 	teqeq	sp, lr, lsl #10
    1440:	00000678 	andeq	r0, r0, r8, ror r6
    1444:	000b0017 	andeq	r0, fp, r7, lsl r0
    1448:	013e0500 	teqeq	lr, r0, lsl #10
    144c:	00000678 	andeq	r0, r0, r8, ror r6
    1450:	0b2d1700 	bleq	b47058 <_heap+0xac7054>
    1454:	3f050000 	svccc	0x00050000
    1458:	00067801 	andeq	r7, r6, r1, lsl #16
    145c:	5c170600 	ldcpl	6, cr0, [r7], {-0}
    1460:	0500000b 	streq	r0, [r0, #-11]
    1464:	003a0140 	eorseq	r0, sl, r0, asr #2
    1468:	000c0000 	andeq	r0, ip, r0
    146c:	00003a09 	andeq	r3, r0, r9, lsl #20
    1470:	00068800 	andeq	r8, r6, r0, lsl #16
    1474:	00d00a00 	sbcseq	r0, r0, r0, lsl #20
    1478:	00020000 	andeq	r0, r2, r0
    147c:	5705d01a 	smladpl	r5, sl, r0, sp
    1480:	00078902 	andeq	r8, r7, r2, lsl #18
    1484:	0b9b1700 	bleq	fe6c708c <_heap+0xfe647088>
    1488:	59050000 	stmdbpl	r5, {}	; <UNPREDICTABLE>
    148c:	00006402 	andeq	r6, r0, r2, lsl #8
    1490:	46170000 	ldrmi	r0, [r7], -r0
    1494:	0500000b 	streq	r0, [r0, #-11]
    1498:	0556025a 	ldrbeq	r0, [r6, #-602]	; 0xfffffda6
    149c:	17040000 	strne	r0, [r4, -r0]
    14a0:	00000997 	muleq	r0, r7, r9
    14a4:	89025b05 	stmdbhi	r2, {r0, r2, r8, r9, fp, ip, lr}
    14a8:	08000007 	stmdaeq	r0, {r0, r1, r2}
    14ac:	000bf017 	andeq	pc, fp, r7, lsl r0	; <UNPREDICTABLE>
    14b0:	025c0500 	subseq	r0, ip, #0, 10
    14b4:	00000182 	andeq	r0, r0, r2, lsl #3
    14b8:	09351724 	ldmdbeq	r5!, {r2, r5, r8, r9, sl, ip}
    14bc:	5d050000 	stcpl	0, cr0, [r5, #-0]
    14c0:	00005d02 	andeq	r5, r0, r2, lsl #26
    14c4:	b5174800 	ldrlt	r4, [r7, #-2048]	; 0xfffff800
    14c8:	0500000a 	streq	r0, [r0, #-10]
    14cc:	0056025e 	subseq	r0, r6, lr, asr r2
    14d0:	17500000 	ldrbne	r0, [r0, -r0]
    14d4:	00000c06 	andeq	r0, r0, r6, lsl #24
    14d8:	43025f05 	movwmi	r5, #12037	; 0x2f05
    14dc:	58000006 	stmdapl	r0, {r1, r2}
    14e0:	000ac017 	andeq	ip, sl, r7, lsl r0
    14e4:	02600500 	rsbeq	r0, r0, #0, 10
    14e8:	000000f8 	strdeq	r0, [r0], -r8
    14ec:	0c0b1768 	stceq	7, cr1, [fp], {104}	; 0x68
    14f0:	61050000 	mrsvs	r0, (UNDEF: 5)
    14f4:	0000f802 	andeq	pc, r0, r2, lsl #16
    14f8:	71177000 	tstvc	r7, r0
    14fc:	05000008 	streq	r0, [r0, #-8]
    1500:	00f80262 	rscseq	r0, r8, r2, ror #4
    1504:	17780000 	ldrbne	r0, [r8, -r0]!
    1508:	00000bc3 	andeq	r0, r0, r3, asr #23
    150c:	99026305 	stmdbls	r2, {r0, r2, r8, r9, sp, lr}
    1510:	80000007 	andhi	r0, r0, r7
    1514:	00098b17 	andeq	r8, r9, r7, lsl fp
    1518:	02640500 	rsbeq	r0, r4, #0, 10
    151c:	000007a9 	andeq	r0, r0, r9, lsr #15
    1520:	0b691788 	bleq	1a47348 <_heap+0x19c7344>
    1524:	65050000 	strvs	r0, [r5, #-0]
    1528:	00005d02 	andeq	r5, r0, r2, lsl #26
    152c:	fb17a000 	blx	5e9536 <_heap+0x569532>
    1530:	05000008 	streq	r0, [r0, #-8]
    1534:	00f80266 	rscseq	r0, r8, r6, ror #4
    1538:	17a40000 	strne	r0, [r4, r0]!
    153c:	00000862 	andeq	r0, r0, r2, ror #16
    1540:	f8026705 			; <UNDEFINED> instruction: 0xf8026705
    1544:	ac000000 	stcge	0, cr0, [r0], {-0}
    1548:	0008ea17 	andeq	lr, r8, r7, lsl sl
    154c:	02680500 	rsbeq	r0, r8, #0, 10
    1550:	000000f8 	strdeq	r0, [r0], -r8
    1554:	080e17b4 	stmdaeq	lr, {r2, r4, r5, r7, r8, r9, sl, ip}
    1558:	69050000 	stmdbvs	r5, {}	; <UNPREDICTABLE>
    155c:	0000f802 	andeq	pc, r0, r2, lsl #16
    1560:	1d17bc00 	ldcne	12, cr11, [r7, #-0]
    1564:	05000008 	streq	r0, [r0, #-8]
    1568:	00f8026a 	rscseq	r0, r8, sl, ror #4
    156c:	17c40000 	strbne	r0, [r4, r0]
    1570:	00000a72 	andeq	r0, r0, r2, ror sl
    1574:	5d026b05 	vstrpl	d6, [r2, #-20]	; 0xffffffec
    1578:	cc000000 	stcgt	0, cr0, [r0], {-0}
    157c:	055c0900 	ldrbeq	r0, [ip, #-2304]	; 0xfffff700
    1580:	07990000 	ldreq	r0, [r9, r0]
    1584:	d00a0000 	andle	r0, sl, r0
    1588:	19000000 	stmdbne	r0, {}	; <UNPREDICTABLE>
    158c:	055c0900 	ldrbeq	r0, [ip, #-2304]	; 0xfffff700
    1590:	07a90000 	streq	r0, [r9, r0]!
    1594:	d00a0000 	andle	r0, sl, r0
    1598:	07000000 	streq	r0, [r0, -r0]
    159c:	055c0900 	ldrbeq	r0, [ip, #-2304]	; 0xfffff700
    15a0:	07b90000 	ldreq	r0, [r9, r0]!
    15a4:	d00a0000 	andle	r0, sl, r0
    15a8:	17000000 	strne	r0, [r0, -r0]
    15ac:	05f01a00 	ldrbeq	r1, [r0, #2560]!	; 0xa00
    15b0:	07dd0270 			; <UNDEFINED> instruction: 0x07dd0270
    15b4:	f0170000 			; <UNDEFINED> instruction: 0xf0170000
    15b8:	05000009 	streq	r0, [r0, #-9]
    15bc:	07dd0273 			; <UNDEFINED> instruction: 0x07dd0273
    15c0:	17000000 	strne	r0, [r0, -r0]
    15c4:	000009d1 	ldrdeq	r0, [r0], -r1
    15c8:	ed027405 	cfstrs	mvf7, [r2, #-20]	; 0xffffffec
    15cc:	78000007 	stmdavc	r0, {r0, r1, r2}
    15d0:	02cb0900 	sbceq	r0, fp, #0, 18
    15d4:	07ed0000 	strbeq	r0, [sp, r0]!
    15d8:	d00a0000 	andle	r0, sl, r0
    15dc:	1d000000 	stcne	0, cr0, [r0, #-0]
    15e0:	00640900 	rsbeq	r0, r4, r0, lsl #18
    15e4:	07fd0000 	ldrbeq	r0, [sp, r0]!
    15e8:	d00a0000 	andle	r0, sl, r0
    15ec:	1d000000 	stcne	0, cr0, [r0, #-0]
    15f0:	05f01b00 	ldrbeq	r1, [r0, #2816]!	; 0xb00
    15f4:	081f0255 	ldmdaeq	pc, {r0, r2, r4, r6, r9}	; <UNPREDICTABLE>
    15f8:	f91c0000 			; <UNDEFINED> instruction: 0xf91c0000
    15fc:	0500000a 	streq	r0, [r0, #-10]
    1600:	0688026c 	streq	r0, [r8], ip, ror #4
    1604:	dd1c0000 	ldcle	0, cr0, [ip, #-0]
    1608:	0500000b 	streq	r0, [r0, #-11]
    160c:	07b90275 			; <UNDEFINED> instruction: 0x07b90275
    1610:	09000000 	stmdbeq	r0, {}	; <UNPREDICTABLE>
    1614:	0000055c 	andeq	r0, r0, ip, asr r5
    1618:	0000082f 	andeq	r0, r0, pc, lsr #16
    161c:	0000d00a 	andeq	sp, r0, sl
    1620:	1d001800 	stcne	8, cr1, [r0, #-0]
    1624:	0000083a 	andeq	r0, r0, sl, lsr r8
    1628:	00041914 	andeq	r1, r4, r4, lsl r9
    162c:	040f0000 	streq	r0, [pc], #-0	; 1634 <CPSR_IRQ_INHIBIT+0x15b4>
    1630:	0000082f 	andeq	r0, r0, pc, lsr #16
    1634:	016c040f 	cmneq	ip, pc, lsl #8
    1638:	511d0000 	tstpl	sp, r0
    163c:	14000008 	strne	r0, [r0], #-8
    1640:	0000005d 	andeq	r0, r0, sp, asr r0
    1644:	57040f00 	strpl	r0, [r4, -r0, lsl #30]
    1648:	0f000008 	svceq	0x00000008
    164c:	00084604 	andeq	r4, r8, r4, lsl #12
    1650:	05f60900 	ldrbeq	r0, [r6, #2304]!	; 0x900
    1654:	086d0000 	stmdaeq	sp!, {}^	; <UNPREDICTABLE>
    1658:	d00a0000 	andle	r0, sl, r0
    165c:	02000000 	andeq	r0, r0, #0
    1660:	0b7d1e00 	bleq	1f48e68 <_heap+0x1ec8e64>
    1664:	fd050000 	stc2	0, cr0, [r5, #-0]
    1668:	00041902 	andeq	r1, r4, r2, lsl #18
    166c:	0b761e00 	bleq	1d88e74 <_heap+0x1d08e70>
    1670:	fe050000 	cdp2	0, 0, cr0, cr5, cr0, {0}
    1674:	00041f02 	andeq	r1, r4, r2, lsl #30
    1678:	0a081f00 	beq	209280 <_heap+0x18927c>
    167c:	5f060000 	svcpl	0x00060000
    1680:	00000556 	andeq	r0, r0, r6, asr r5
    1684:	000c2820 	andeq	r2, ip, r0, lsr #16
    1688:	5d090100 	stfpls	f0, [r9, #-0]
    168c:	68000000 	stmdavs	r0, {}	; <UNPREDICTABLE>
    1690:	90000087 	andls	r0, r0, r7, lsl #1
    1694:	01000000 	mrseq	r0, (UNDEF: 0)
    1698:	0009019c 	muleq	r9, ip, r1
    169c:	07e42100 	strbeq	r2, [r4, r0, lsl #2]!
    16a0:	0b010000 	bleq	416a8 <__bss_end__+0x38b40>
    16a4:	00000789 	andeq	r0, r0, r9, lsl #15
    16a8:	8b300305 	blhi	c022c4 <_heap+0xb822c0>
    16ac:	33210000 			; <UNDEFINED> instruction: 0x33210000
    16b0:	0100000b 	tsteq	r0, fp
    16b4:	0009010c 	andeq	r0, r9, ip, lsl #2
    16b8:	0c030500 	cfstr32eq	mvfx0, [r3], {-0}
    16bc:	2100008b 	smlabbcs	r0, fp, r0, r0
    16c0:	0000043f 	andeq	r0, r0, pc, lsr r4
    16c4:	05560e01 	ldrbeq	r0, [r6, #-3585]	; 0xfffff1ff
    16c8:	91020000 	mrsls	r0, (UNDEF: 2)
    16cc:	09da216c 	ldmibeq	sl, {r2, r3, r5, r6, r8, sp}^
    16d0:	0f010000 	svceq	0x00010000
    16d4:	00000556 	andeq	r0, r0, r6, asr r5
    16d8:	21749102 	cmncs	r4, r2, lsl #2
    16dc:	00000944 	andeq	r0, r0, r4, asr #18
    16e0:	005d1001 	subseq	r1, sp, r1
    16e4:	91020000 	mrsls	r0, (UNDEF: 2)
    16e8:	0a432270 	beq	10ca0b0 <_heap+0x104a0ac>
    16ec:	11010000 	mrsne	r0, (UNDEF: 1)
    16f0:	0000005d 	andeq	r0, r0, sp, asr r0
    16f4:	055c2300 	ldrbeq	r2, [ip, #-768]	; 0xfffffd00
    16f8:	d00a0000 	andle	r0, sl, r0
    16fc:	20000000 	andcs	r0, r0, r0
    1700:	00ca0000 	sbceq	r0, sl, r0
    1704:	00040000 	andeq	r0, r4, r0
    1708:	00000663 	andeq	r0, r0, r3, ror #12
    170c:	00440104 	subeq	r0, r4, r4, lsl #2
    1710:	560c0000 	strpl	r0, [ip], -r0
    1714:	f800000c 			; <UNDEFINED> instruction: 0xf800000c
    1718:	b0000087 	andlt	r0, r0, r7, lsl #1
    171c:	2a000000 	bcs	1724 <CPSR_IRQ_INHIBIT+0x16a4>
    1720:	02000007 	andeq	r0, r0, #7
    1724:	01330601 	teqeq	r3, r1, lsl #12
    1728:	01020000 	mrseq	r0, (UNDEF: 2)
    172c:	00013108 	andeq	r3, r1, r8, lsl #2
    1730:	05020200 	streq	r0, [r2, #-512]	; 0xfffffe00
    1734:	000001bf 			; <UNDEFINED> instruction: 0x000001bf
    1738:	3f070202 	svccc	0x00070202
    173c:	02000001 	andeq	r0, r0, #1
    1740:	01b60504 			; <UNDEFINED> instruction: 0x01b60504
    1744:	04020000 	streq	r0, [r2], #-0
    1748:	00018607 	andeq	r8, r1, r7, lsl #12
    174c:	05080200 	streq	r0, [r8, #-512]	; 0xfffffe00
    1750:	000001b1 			; <UNDEFINED> instruction: 0x000001b1
    1754:	81070802 	tsthi	r7, r2, lsl #16
    1758:	03000001 	movweq	r0, #1
    175c:	6e690504 	cdpvs	5, 6, cr0, cr9, cr4, {0}
    1760:	04020074 	streq	r0, [r2], #-116	; 0xffffff8c
    1764:	00018b07 	andeq	r8, r1, r7, lsl #22
    1768:	07040200 	streq	r0, [r4, -r0, lsl #4]
    176c:	00000791 	muleq	r0, r1, r7
    1770:	3a080102 	bcc	201b80 <_heap+0x181b7c>
    1774:	04000001 	streq	r0, [r0], #-1
    1778:	00000c4a 	andeq	r0, r0, sl, asr #24
    177c:	87f80c01 	ldrbhi	r0, [r8, r1, lsl #24]!
    1780:	00b00000 	adcseq	r0, r0, r0
    1784:	9c010000 	stcls	0, cr0, [r1], {-0}
    1788:	000000c1 	andeq	r0, r0, r1, asr #1
    178c:	00307205 	eorseq	r7, r0, r5, lsl #4
    1790:	00600c01 	rsbeq	r0, r0, r1, lsl #24
    1794:	91020000 	mrsls	r0, (UNDEF: 2)
    1798:	31720554 	cmncc	r2, r4, asr r5
    179c:	600c0100 	andvs	r0, ip, r0, lsl #2
    17a0:	02000000 	andeq	r0, r0, #0
    17a4:	33065091 	movwcc	r5, #24721	; 0x6091
    17a8:	0100000c 	tsteq	r0, ip
    17ac:	0000600c 	andeq	r6, r0, ip
    17b0:	4c910200 	lfmmi	f0, 4, [r1], {0}
    17b4:	000c3907 	andeq	r3, ip, r7, lsl #18
    17b8:	c12a0100 			; <UNDEFINED> instruction: 0xc12a0100
    17bc:	02000000 	andeq	r0, r0, #0
    17c0:	08005891 	stmdaeq	r0, {r0, r4, r7, fp, ip, lr}
    17c4:	0000006e 	andeq	r0, r0, lr, rrx
    17c8:	00006709 	andeq	r6, r0, r9, lsl #14
    17cc:	00001d00 	andeq	r1, r0, r0, lsl #26
    17d0:	000001bc 			; <UNDEFINED> instruction: 0x000001bc
    17d4:	06e20004 	strbteq	r0, [r2], r4
    17d8:	01040000 	mrseq	r0, (UNDEF: 4)
    17dc:	00000044 	andeq	r0, r0, r4, asr #32
    17e0:	000c860c 	andeq	r8, ip, ip, lsl #12
    17e4:	0088a800 	addeq	sl, r8, r0, lsl #16
    17e8:	00022c00 	andeq	r2, r2, r0, lsl #24
    17ec:	00079700 	andeq	r9, r7, r0, lsl #14
    17f0:	06010200 	streq	r0, [r1], -r0, lsl #4
    17f4:	00000133 	andeq	r0, r0, r3, lsr r1
    17f8:	31080102 	tstcc	r8, r2, lsl #2
    17fc:	02000001 	andeq	r0, r0, #1
    1800:	01bf0502 			; <UNDEFINED> instruction: 0x01bf0502
    1804:	02020000 	andeq	r0, r2, #0
    1808:	00013f07 	andeq	r3, r1, r7, lsl #30
    180c:	05040200 	streq	r0, [r4, #-512]	; 0xfffffe00
    1810:	000001b6 			; <UNDEFINED> instruction: 0x000001b6
    1814:	86070402 	strhi	r0, [r7], -r2, lsl #8
    1818:	02000001 	andeq	r0, r0, #1
    181c:	01b10508 			; <UNDEFINED> instruction: 0x01b10508
    1820:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
    1824:	00018107 	andeq	r8, r1, r7, lsl #2
    1828:	05040300 	streq	r0, [r4, #-768]	; 0xfffffd00
    182c:	00746e69 	rsbseq	r6, r4, r9, ror #28
    1830:	8b070402 	blhi	1c2840 <_heap+0x14283c>
    1834:	04000001 	streq	r0, [r0], #-1
    1838:	a0020218 	andge	r0, r2, r8, lsl r2
    183c:	05000000 	streq	r0, [r0, #-0]
    1840:	00000758 	andeq	r0, r0, r8, asr r7
    1844:	00a00402 	adceq	r0, r0, r2, lsl #8
    1848:	05000000 	streq	r0, [r0, #-0]
    184c:	000006f9 	strdeq	r0, [r0], -r9
    1850:	00590502 	subseq	r0, r9, r2, lsl #10
    1854:	050c0000 	streq	r0, [ip, #-0]
    1858:	00000730 	andeq	r0, r0, r0, lsr r7
    185c:	00590602 	subseq	r0, r9, r2, lsl #12
    1860:	05100000 	ldreq	r0, [r0, #-0]
    1864:	000007df 	ldrdeq	r0, [r0], -pc	; <UNPREDICTABLE>
    1868:	00590702 	subseq	r0, r9, r2, lsl #14
    186c:	00140000 	andseq	r0, r4, r0
    1870:	0000b706 	andeq	fp, r0, r6, lsl #14
    1874:	0000b000 	andeq	fp, r0, r0
    1878:	00b00700 	adcseq	r0, r0, r0, lsl #14
    187c:	00090000 	andeq	r0, r9, r0
    1880:	91070402 	tstls	r7, r2, lsl #8
    1884:	02000007 	andeq	r0, r0, #7
    1888:	013a0801 	teqeq	sl, r1, lsl #16
    188c:	b7080000 	strlt	r0, [r8, -r0]
    1890:	09000000 	stmdbeq	r0, {}	; <UNPREDICTABLE>
    1894:	00000722 	andeq	r0, r0, r2, lsr #14
    1898:	00670802 	rsbeq	r0, r7, r2, lsl #16
    189c:	b00a0000 	andlt	r0, sl, r0
    18a0:	0100000c 	tsteq	r0, ip
    18a4:	0000592f 	andeq	r5, r0, pc, lsr #18
    18a8:	0089d000 	addeq	sp, r9, r0
    18ac:	00010400 	andeq	r0, r1, r0, lsl #8
    18b0:	2a9c0100 	bcs	fe701cb8 <_heap+0xfe681cb4>
    18b4:	0b000001 	bleq	18c0 <CPSR_IRQ_INHIBIT+0x1840>
    18b8:	2f010066 	svccs	0x00010066
    18bc:	0000012a 	andeq	r0, r0, sl, lsr #2
    18c0:	0c6c9102 	stfeqp	f1, [ip], #-8
    18c4:	0000043f 	andeq	r0, r0, pc, lsr r4
    18c8:	01302f01 	teqeq	r0, r1, lsl #30
    18cc:	91020000 	mrsls	r0, (UNDEF: 2)
    18d0:	07350c68 	ldreq	r0, [r5, -r8, ror #24]!
    18d4:	2f010000 	svccs	0x00010000
    18d8:	00000059 	andeq	r0, r0, r9, asr r0
    18dc:	0d649102 	stfeqp	f1, [r4, #-8]!
    18e0:	31010069 	tstcc	r1, r9, rrx
    18e4:	00000059 	andeq	r0, r0, r9, asr r0
    18e8:	0d749102 	ldfeqp	f1, [r4, #-8]!
    18ec:	00727470 	rsbseq	r7, r2, r0, ror r4
    18f0:	01373201 	teqeq	r7, r1, lsl #4
    18f4:	91020000 	mrsls	r0, (UNDEF: 2)
    18f8:	040e0070 	streq	r0, [lr], #-112	; 0xffffff90
    18fc:	000000c3 	andeq	r0, r0, r3, asr #1
    1900:	0136040e 	teqeq	r6, lr, lsl #8
    1904:	0e0f0000 	cdpeq	0, 0, cr0, cr15, cr0, {0}
    1908:	0000be04 	andeq	fp, r0, r4, lsl #28
    190c:	0cc50a00 	vstmiaeq	r5, {s1-s0}
    1910:	13010000 	movwne	r0, #4096	; 0x1000
    1914:	00000059 	andeq	r0, r0, r9, asr r0
    1918:	000088ec 	andeq	r8, r0, ip, ror #17
    191c:	000000e4 	andeq	r0, r0, r4, ror #1
    1920:	01999c01 	orrseq	r9, r9, r1, lsl #24
    1924:	660b0000 	strvs	r0, [fp], -r0
    1928:	2a130100 	bcs	4c1d30 <_heap+0x441d2c>
    192c:	02000001 	andeq	r0, r0, #1
    1930:	cf0c6c91 	svcgt	0x000c6c91
    1934:	0100000c 	tsteq	r0, ip
    1938:	00019913 	andeq	r9, r1, r3, lsl r9
    193c:	68910200 	ldmvs	r1, {r9}
    1940:	0007350c 	andeq	r3, r7, ip, lsl #10
    1944:	59130100 	ldmdbpl	r3, {r8}
    1948:	02000000 	andeq	r0, r0, #0
    194c:	690d6491 	stmdbvs	sp, {r0, r4, r7, sl, sp, lr}
    1950:	59150100 	ldmdbpl	r5, {r8}
    1954:	02000000 	andeq	r0, r0, #0
    1958:	700d7491 	mulvc	sp, r1, r4
    195c:	01007274 	tsteq	r0, r4, ror r2
    1960:	00019b16 	andeq	r9, r1, r6, lsl fp
    1964:	70910200 	addsvc	r0, r1, r0, lsl #4
    1968:	0e041000 	cdpeq	0, 0, cr1, cr4, cr0, {0}
    196c:	0000b704 	andeq	fp, r0, r4, lsl #14
    1970:	0cbb1100 	ldfeqs	f1, [fp]
    1974:	0a010000 	beq	4197c <__bss_end__+0x38e14>
    1978:	000088a8 	andeq	r8, r0, r8, lsr #17
    197c:	00000044 	andeq	r0, r0, r4, asr #32
    1980:	660b9c01 	strvs	r9, [fp], -r1, lsl #24
    1984:	2a0a0100 	bcs	281d8c <_heap+0x201d88>
    1988:	02000001 	andeq	r0, r0, #1
    198c:	00007491 	muleq	r0, r1, r4
    1990:	0000006c 	andeq	r0, r0, ip, rrx
    1994:	07c20002 	strbeq	r0, [r2, r2]
    1998:	01040000 	mrseq	r0, (UNDEF: 4)
    199c:	0000086f 	andeq	r0, r0, pc, ror #16
    19a0:	00008000 	andeq	r8, r0, r0
    19a4:	00008094 	muleq	r0, r4, r0
    19a8:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; 18f4 <CPSR_IRQ_INHIBIT+0x1874>
    19ac:	62612f65 	rsbvs	r2, r1, #404	; 0x194
    19b0:	616b6964 	cmnvs	fp, r4, ror #18
    19b4:	2f6d6972 	svccs	0x006d6972
    19b8:	2f766564 	svccs	0x00766564
    19bc:	694c794d 	stmdbvs	ip, {r0, r2, r3, r6, r8, fp, ip, sp, lr}^
    19c0:	656c7474 	strbvs	r7, [ip, #-1140]!	; 0xfffffb8c
    19c4:	732f534f 			; <UNDEFINED> instruction: 0x732f534f
    19c8:	732f6372 			; <UNDEFINED> instruction: 0x732f6372
    19cc:	74726174 	ldrbtvc	r6, [r2], #-372	; 0xfffffe8c
    19d0:	2f00732e 	svccs	0x0000732e
    19d4:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
    19d8:	6462612f 	strbtvs	r6, [r2], #-303	; 0xfffffed1
    19dc:	72616b69 	rsbvc	r6, r1, #107520	; 0x1a400
    19e0:	642f6d69 	strtvs	r6, [pc], #-3433	; 19e8 <CPSR_IRQ_INHIBIT+0x1968>
    19e4:	4d2f7665 	stcmi	6, cr7, [pc, #-404]!	; 1858 <CPSR_IRQ_INHIBIT+0x17d8>
    19e8:	74694c79 	strbtvc	r4, [r9], #-3193	; 0xfffff387
    19ec:	4f656c74 	svcmi	0x00656c74
    19f0:	4e470053 	mcrmi	0, 2, r0, cr7, cr3, {2}
    19f4:	53412055 	movtpl	r2, #4181	; 0x1055
    19f8:	322e3220 	eorcc	r3, lr, #32, 4
    19fc:	80010037 	andhi	r0, r1, r7, lsr r0

Disassembly of section .debug_abbrev:

00000000 <.debug_abbrev>:
   0:	25011101 	strcs	r1, [r1, #-257]	; 0xfffffeff
   4:	030b130e 	movweq	r1, #45838	; 0xb30e
   8:	1201110e 	andne	r1, r1, #-2147483645	; 0x80000003
   c:	00171006 	andseq	r1, r7, r6
  10:	00340200 	eorseq	r0, r4, r0, lsl #4
  14:	0b3a0e03 	bleq	e83828 <_heap+0xe03824>
  18:	13490b3b 	movtne	r0, #39739	; 0x9b3b
  1c:	193c193f 	ldmdbne	ip!, {r0, r1, r2, r3, r4, r5, r8, fp, ip}
  20:	24030000 	strcs	r0, [r3], #-0
  24:	3e0b0b00 	vmlacc.f64	d0, d11, d0
  28:	0008030b 	andeq	r0, r8, fp, lsl #6
  2c:	012e0400 			; <UNDEFINED> instruction: 0x012e0400
  30:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
  34:	0b3b0b3a 	bleq	ec2d24 <_heap+0xe42d20>
  38:	01111927 	tsteq	r1, r7, lsr #18
  3c:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
  40:	01194296 			; <UNDEFINED> instruction: 0x01194296
  44:	05000013 	streq	r0, [r0, #-19]	; 0xffffffed
  48:	08030005 	stmdaeq	r3, {r0, r2}
  4c:	0b3b0b3a 	bleq	ec2d3c <_heap+0xe42d38>
  50:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
  54:	34060000 	strcc	r0, [r6], #-0
  58:	3a080300 	bcc	200c60 <_heap+0x180c5c>
  5c:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
  60:	00180213 	andseq	r0, r8, r3, lsl r2
  64:	00340700 	eorseq	r0, r4, r0, lsl #14
  68:	0b3a0e03 	bleq	e8387c <_heap+0xe03878>
  6c:	13490b3b 	movtne	r0, #39739	; 0x9b3b
  70:	00001802 	andeq	r1, r0, r2, lsl #16
  74:	0b002408 	bleq	909c <__bss_end__+0x534>
  78:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
  7c:	0900000e 	stmdbeq	r0, {r1, r2, r3}
  80:	0b0b000f 	bleq	2c00c4 <_heap+0x2400c0>
  84:	00001349 	andeq	r1, r0, r9, asr #6
  88:	01110100 	tsteq	r1, r0, lsl #2
  8c:	0b130e25 	bleq	4c3928 <_heap+0x443924>
  90:	01110e03 	tsteq	r1, r3, lsl #28
  94:	17100612 			; <UNDEFINED> instruction: 0x17100612
  98:	24020000 	strcs	r0, [r2], #-0
  9c:	3e0b0b00 	vmlacc.f64	d0, d11, d0
  a0:	000e030b 	andeq	r0, lr, fp, lsl #6
  a4:	00160300 	andseq	r0, r6, r0, lsl #6
  a8:	0b3a0e03 	bleq	e838bc <_heap+0xe038b8>
  ac:	13490b3b 	movtne	r0, #39739	; 0x9b3b
  b0:	24040000 	strcs	r0, [r4], #-0
  b4:	3e0b0b00 	vmlacc.f64	d0, d11, d0
  b8:	0008030b 	andeq	r0, r8, fp, lsl #6
  bc:	00350500 	eorseq	r0, r5, r0, lsl #10
  c0:	00001349 	andeq	r1, r0, r9, asr #6
  c4:	0b011306 	bleq	44ce4 <__bss_end__+0x3c17c>
  c8:	3b0b3a0b 	blcc	2ce8fc <_heap+0x24e8f8>
  cc:	0013010b 	andseq	r0, r3, fp, lsl #2
  d0:	000d0700 	andeq	r0, sp, r0, lsl #14
  d4:	0b3a0e03 	bleq	e838e8 <_heap+0xe038e4>
  d8:	13490b3b 	movtne	r0, #39739	; 0x9b3b
  dc:	00000b38 	andeq	r0, r0, r8, lsr fp
  e0:	03003408 	movweq	r3, #1032	; 0x408
  e4:	3b0b3a0e 	blcc	2ce924 <_heap+0x24e920>
  e8:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
  ec:	09000018 	stmdbeq	r0, {r3, r4}
  f0:	0b0b000f 	bleq	2c0134 <_heap+0x240130>
  f4:	00001349 	andeq	r1, r0, r9, asr #6
  f8:	3f002e0a 	svccc	0x00002e0a
  fc:	3a0e0319 	bcc	380d68 <_heap+0x300d64>
 100:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 104:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 108:	97184006 	ldrls	r4, [r8, -r6]
 10c:	00001942 	andeq	r1, r0, r2, asr #18
 110:	3f002e0b 	svccc	0x00002e0b
 114:	3a0e0319 	bcc	380d80 <_heap+0x300d7c>
 118:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 11c:	11134919 	tstne	r3, r9, lsl r9
 120:	40061201 	andmi	r1, r6, r1, lsl #4
 124:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 128:	01000000 	mrseq	r0, (UNDEF: 0)
 12c:	0e250111 	mcreq	1, 1, r0, cr5, cr1, {0}
 130:	0e030b13 	vmoveq.32	d3[0], r0
 134:	06120111 			; <UNDEFINED> instruction: 0x06120111
 138:	00001710 	andeq	r1, r0, r0, lsl r7
 13c:	0b002402 	bleq	914c <__bss_end__+0x5e4>
 140:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 144:	0300000e 	movweq	r0, #14
 148:	0e030016 	mcreq	0, 0, r0, cr3, cr6, {0}
 14c:	0b3b0b3a 	bleq	ec2e3c <_heap+0xe42e38>
 150:	00001349 	andeq	r1, r0, r9, asr #6
 154:	0b002404 	bleq	916c <__bss_end__+0x604>
 158:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 15c:	05000008 	streq	r0, [r0, #-8]
 160:	13490035 	movtne	r0, #36917	; 0x9035
 164:	26060000 	strcs	r0, [r6], -r0
 168:	00134900 	andseq	r4, r3, r0, lsl #18
 16c:	01130700 	tsteq	r3, r0, lsl #14
 170:	0b3a0b0b 	bleq	e82da4 <_heap+0xe02da0>
 174:	13010b3b 	movwne	r0, #6971	; 0x1b3b
 178:	0d080000 	stceq	0, cr0, [r8, #-0]
 17c:	3a0e0300 	bcc	380d84 <_heap+0x300d80>
 180:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 184:	000b3813 	andeq	r3, fp, r3, lsl r8
 188:	00340900 	eorseq	r0, r4, r0, lsl #18
 18c:	0b3a0e03 	bleq	e839a0 <_heap+0xe0399c>
 190:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 194:	00001802 	andeq	r1, r0, r2, lsl #16
 198:	0b000f0a 	bleq	3dc8 <CPSR_IRQ_INHIBIT+0x3d48>
 19c:	0013490b 	andseq	r4, r3, fp, lsl #18
 1a0:	002e0b00 	eoreq	r0, lr, r0, lsl #22
 1a4:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
 1a8:	0b3b0b3a 	bleq	ec2e98 <_heap+0xe42e94>
 1ac:	01111927 	tsteq	r1, r7, lsr #18
 1b0:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 1b4:	00194297 	mulseq	r9, r7, r2
 1b8:	002e0c00 	eoreq	r0, lr, r0, lsl #24
 1bc:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
 1c0:	0b3b0b3a 	bleq	ec2eb0 <_heap+0xe42eac>
 1c4:	13491927 	movtne	r1, #39207	; 0x9927
 1c8:	06120111 			; <UNDEFINED> instruction: 0x06120111
 1cc:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 1d0:	00000019 	andeq	r0, r0, r9, lsl r0
 1d4:	25011101 	strcs	r1, [r1, #-257]	; 0xfffffeff
 1d8:	030b130e 	movweq	r1, #45838	; 0xb30e
 1dc:	1201110e 	andne	r1, r1, #-2147483645	; 0x80000003
 1e0:	00171006 	andseq	r1, r7, r6
 1e4:	00240200 	eoreq	r0, r4, r0, lsl #4
 1e8:	0b3e0b0b 	bleq	f82e1c <_heap+0xf02e18>
 1ec:	00000e03 	andeq	r0, r0, r3, lsl #28
 1f0:	03001603 	movweq	r1, #1539	; 0x603
 1f4:	3b0b3a0e 	blcc	2cea34 <_heap+0x24ea30>
 1f8:	0013490b 	andseq	r4, r3, fp, lsl #18
 1fc:	00240400 	eoreq	r0, r4, r0, lsl #8
 200:	0b3e0b0b 	bleq	f82e34 <_heap+0xf02e30>
 204:	00000803 	andeq	r0, r0, r3, lsl #16
 208:	49003505 	stmdbmi	r0, {r0, r2, r8, sl, ip, sp}
 20c:	06000013 			; <UNDEFINED> instruction: 0x06000013
 210:	13490026 	movtne	r0, #36902	; 0x9026
 214:	13070000 	movwne	r0, #28672	; 0x7000
 218:	3a0b0b01 	bcc	2c2e24 <_heap+0x242e20>
 21c:	010b3b0b 	tsteq	fp, fp, lsl #22
 220:	08000013 	stmdaeq	r0, {r0, r1, r4}
 224:	0e03000d 	cdpeq	0, 0, cr0, cr3, cr13, {0}
 228:	0b3b0b3a 	bleq	ec2f18 <_heap+0xe42f14>
 22c:	0b381349 	bleq	e04f58 <_heap+0xd84f54>
 230:	34090000 	strcc	r0, [r9], #-0
 234:	3a0e0300 	bcc	380e3c <_heap+0x300e38>
 238:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 23c:	00180213 	andseq	r0, r8, r3, lsl r2
 240:	000f0a00 	andeq	r0, pc, r0, lsl #20
 244:	13490b0b 	movtne	r0, #39691	; 0x9b0b
 248:	2e0b0000 	cdpcs	0, 0, cr0, cr11, cr0, {0}
 24c:	03193f00 	tsteq	r9, #0, 30
 250:	3b0b3a0e 	blcc	2cea90 <_heap+0x24ea8c>
 254:	1119270b 	tstne	r9, fp, lsl #14
 258:	40061201 	andmi	r1, r6, r1, lsl #4
 25c:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 260:	2e0c0000 	cdpcs	0, 0, cr0, cr12, cr0, {0}
 264:	03193f01 	tsteq	r9, #1, 30
 268:	3b0b3a0e 	blcc	2ceaa8 <_heap+0x24eaa4>
 26c:	1201110b 	andne	r1, r1, #-1073741822	; 0xc0000002
 270:	96184006 	ldrls	r4, [r8], -r6
 274:	13011942 	movwne	r1, #6466	; 0x1942
 278:	340d0000 	strcc	r0, [sp], #-0
 27c:	3a080300 	bcc	200e84 <_heap+0x180e80>
 280:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 284:	00180213 	andseq	r0, r8, r3, lsl r2
 288:	002e0e00 	eoreq	r0, lr, r0, lsl #28
 28c:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
 290:	0b3b0b3a 	bleq	ec2f80 <_heap+0xe42f7c>
 294:	01111927 	tsteq	r1, r7, lsr #18
 298:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 29c:	00194296 	mulseq	r9, r6, r2
 2a0:	002e0f00 	eoreq	r0, lr, r0, lsl #30
 2a4:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
 2a8:	0b3b0b3a 	bleq	ec2f98 <_heap+0xe42f94>
 2ac:	13491927 	movtne	r1, #39207	; 0x9927
 2b0:	06120111 			; <UNDEFINED> instruction: 0x06120111
 2b4:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 2b8:	00000019 	andeq	r0, r0, r9, lsl r0
 2bc:	25011101 	strcs	r1, [r1, #-257]	; 0xfffffeff
 2c0:	030b130e 	movweq	r1, #45838	; 0xb30e
 2c4:	1201110e 	andne	r1, r1, #-2147483645	; 0x80000003
 2c8:	00171006 	andseq	r1, r7, r6
 2cc:	00240200 	eoreq	r0, r4, r0, lsl #4
 2d0:	0b3e0b0b 	bleq	f82f04 <_heap+0xf02f00>
 2d4:	00000e03 	andeq	r0, r0, r3, lsl #28
 2d8:	03001603 	movweq	r1, #1539	; 0x603
 2dc:	3b0b3a0e 	blcc	2ceb1c <_heap+0x24eb18>
 2e0:	0013490b 	andseq	r4, r3, fp, lsl #18
 2e4:	00240400 	eoreq	r0, r4, r0, lsl #8
 2e8:	0b3e0b0b 	bleq	f82f1c <_heap+0xf02f18>
 2ec:	00000803 	andeq	r0, r0, r3, lsl #16
 2f0:	49003505 	stmdbmi	r0, {r0, r2, r8, sl, ip, sp}
 2f4:	06000013 			; <UNDEFINED> instruction: 0x06000013
 2f8:	0b0b0113 	bleq	2c074c <_heap+0x240748>
 2fc:	0b3b0b3a 	bleq	ec2fec <_heap+0xe42fe8>
 300:	00001301 	andeq	r1, r0, r1, lsl #6
 304:	03000d07 	movweq	r0, #3335	; 0xd07
 308:	3b0b3a0e 	blcc	2ceb48 <_heap+0x24eb44>
 30c:	3813490b 	ldmdacc	r3, {r0, r1, r3, r8, fp, lr}
 310:	0800000b 	stmdaeq	r0, {r0, r1, r3}
 314:	0e030034 	mcreq	0, 0, r0, cr3, cr4, {1}
 318:	0b3b0b3a 	bleq	ec3008 <_heap+0xe43004>
 31c:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 320:	0f090000 	svceq	0x00090000
 324:	490b0b00 	stmdbmi	fp, {r8, r9, fp}
 328:	0a000013 	beq	37c <CPSR_IRQ_INHIBIT+0x2fc>
 32c:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 330:	0b3a0e03 	bleq	e83b44 <_heap+0xe03b40>
 334:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 338:	06120111 			; <UNDEFINED> instruction: 0x06120111
 33c:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 340:	00130119 	andseq	r0, r3, r9, lsl r1
 344:	00050b00 	andeq	r0, r5, r0, lsl #22
 348:	0b3a0803 	bleq	e8235c <_heap+0xe02358>
 34c:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 350:	00001802 	andeq	r1, r0, r2, lsl #16
 354:	0300340c 	movweq	r3, #1036	; 0x40c
 358:	3b0b3a08 	blcc	2ceb80 <_heap+0x24eb7c>
 35c:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 360:	0d000018 	stceq	0, cr0, [r0, #-96]	; 0xffffffa0
 364:	193f002e 	ldmdbne	pc!, {r1, r2, r3, r5}	; <UNPREDICTABLE>
 368:	0b3a0e03 	bleq	e83b7c <_heap+0xe03b78>
 36c:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 370:	01111349 	tsteq	r1, r9, asr #6
 374:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 378:	00194297 	mulseq	r9, r7, r2
 37c:	11010000 	mrsne	r0, (UNDEF: 1)
 380:	130e2501 	movwne	r2, #58625	; 0xe501
 384:	110e030b 	tstne	lr, fp, lsl #6
 388:	10061201 	andne	r1, r6, r1, lsl #4
 38c:	02000017 	andeq	r0, r0, #23
 390:	0b0b0024 	bleq	2c0428 <_heap+0x240424>
 394:	0e030b3e 	vmoveq.16	d3[0], r0
 398:	16030000 	strne	r0, [r3], -r0
 39c:	3a0e0300 	bcc	380fa4 <_heap+0x300fa0>
 3a0:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 3a4:	04000013 	streq	r0, [r0], #-19	; 0xffffffed
 3a8:	0b0b0024 	bleq	2c0440 <_heap+0x24043c>
 3ac:	08030b3e 	stmdaeq	r3, {r1, r2, r3, r4, r5, r8, r9, fp}
 3b0:	35050000 	strcc	r0, [r5, #-0]
 3b4:	00134900 	andseq	r4, r3, r0, lsl #18
 3b8:	00260600 	eoreq	r0, r6, r0, lsl #12
 3bc:	00001349 	andeq	r1, r0, r9, asr #6
 3c0:	0b011307 	bleq	44fe4 <__bss_end__+0x3c47c>
 3c4:	3b0b3a0b 	blcc	2cebf8 <_heap+0x24ebf4>
 3c8:	0013010b 	andseq	r0, r3, fp, lsl #2
 3cc:	000d0800 	andeq	r0, sp, r0, lsl #16
 3d0:	0b3a0e03 	bleq	e83be4 <_heap+0xe03be0>
 3d4:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 3d8:	00000b38 	andeq	r0, r0, r8, lsr fp
 3dc:	49010109 	stmdbmi	r1, {r0, r3, r8}
 3e0:	00130113 	andseq	r0, r3, r3, lsl r1
 3e4:	00210a00 	eoreq	r0, r1, r0, lsl #20
 3e8:	0b2f1349 	bleq	bc5114 <_heap+0xb45110>
 3ec:	340b0000 	strcc	r0, [fp], #-0
 3f0:	3a0e0300 	bcc	380ff8 <_heap+0x300ff4>
 3f4:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 3f8:	00180213 	andseq	r0, r8, r3, lsl r2
 3fc:	000f0c00 	andeq	r0, pc, r0, lsl #24
 400:	13490b0b 	movtne	r0, #39691	; 0x9b0b
 404:	2e0d0000 	cdpcs	0, 0, cr0, cr13, cr0, {0}
 408:	03193f01 	tsteq	r9, #1, 30
 40c:	3b0b3a0e 	blcc	2cec4c <_heap+0x24ec48>
 410:	1119270b 	tstne	r9, fp, lsl #14
 414:	40061201 	andmi	r1, r6, r1, lsl #4
 418:	19429618 	stmdbne	r2, {r3, r4, r9, sl, ip, pc}^
 41c:	00001301 	andeq	r1, r0, r1, lsl #6
 420:	3f012e0e 	svccc	0x00012e0e
 424:	3a0e0319 	bcc	381090 <_heap+0x30108c>
 428:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 42c:	11134919 	tstne	r3, r9, lsl r9
 430:	40061201 	andmi	r1, r6, r1, lsl #4
 434:	19429618 	stmdbne	r2, {r3, r4, r9, sl, ip, pc}^
 438:	00001301 	andeq	r1, r0, r1, lsl #6
 43c:	0300050f 	movweq	r0, #1295	; 0x50f
 440:	3b0b3a0e 	blcc	2cec80 <_heap+0x24ec7c>
 444:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 448:	10000018 	andne	r0, r0, r8, lsl r0
 44c:	08030005 	stmdaeq	r3, {r0, r2}
 450:	0b3b0b3a 	bleq	ec3140 <_heap+0xe4313c>
 454:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 458:	34110000 	ldrcc	r0, [r1], #-0
 45c:	3a080300 	bcc	201064 <_heap+0x181060>
 460:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 464:	00180213 	andseq	r0, r8, r3, lsl r2
 468:	012e1200 			; <UNDEFINED> instruction: 0x012e1200
 46c:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
 470:	0b3b0b3a 	bleq	ec3160 <_heap+0xe4315c>
 474:	01111927 	tsteq	r1, r7, lsr #18
 478:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 47c:	01194297 			; <UNDEFINED> instruction: 0x01194297
 480:	13000013 	movwne	r0, #19
 484:	193f002e 	ldmdbne	pc!, {r1, r2, r3, r5}	; <UNPREDICTABLE>
 488:	0b3a0e03 	bleq	e83c9c <_heap+0xe03c98>
 48c:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 490:	01111349 	tsteq	r1, r9, asr #6
 494:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 498:	00194297 	mulseq	r9, r7, r2
 49c:	11010000 	mrsne	r0, (UNDEF: 1)
 4a0:	130e2501 	movwne	r2, #58625	; 0xe501
 4a4:	1b0e030b 	blne	3810d8 <_heap+0x3010d4>
 4a8:	1201110e 	andne	r1, r1, #-2147483645	; 0x80000003
 4ac:	00171006 	andseq	r1, r7, r6
 4b0:	00240200 	eoreq	r0, r4, r0, lsl #4
 4b4:	0b3e0b0b 	bleq	f830e8 <_heap+0xf030e4>
 4b8:	00000e03 	andeq	r0, r0, r3, lsl #28
 4bc:	0b002403 	bleq	94d0 <__bss_end__+0x968>
 4c0:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 4c4:	04000008 	streq	r0, [r0], #-8
 4c8:	0b0b000f 	bleq	2c050c <_heap+0x240508>
 4cc:	16050000 	strne	r0, [r5], -r0
 4d0:	3a0e0300 	bcc	3810d8 <_heap+0x3010d4>
 4d4:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 4d8:	06000013 			; <UNDEFINED> instruction: 0x06000013
 4dc:	0e030016 	mcreq	0, 0, r0, cr3, cr6, {0}
 4e0:	053b0b3a 	ldreq	r0, [fp, #-2874]!	; 0xfffff4c6
 4e4:	00001349 	andeq	r1, r0, r9, asr #6
 4e8:	0b011707 	bleq	4610c <__bss_end__+0x3d5a4>
 4ec:	3b0b3a0b 	blcc	2ced20 <_heap+0x24ed1c>
 4f0:	0013010b 	andseq	r0, r3, fp, lsl #2
 4f4:	000d0800 	andeq	r0, sp, r0, lsl #16
 4f8:	0b3a0e03 	bleq	e83d0c <_heap+0xe03d08>
 4fc:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 500:	01090000 	mrseq	r0, (UNDEF: 9)
 504:	01134901 	tsteq	r3, r1, lsl #18
 508:	0a000013 	beq	55c <CPSR_IRQ_INHIBIT+0x4dc>
 50c:	13490021 	movtne	r0, #36897	; 0x9021
 510:	00000b2f 	andeq	r0, r0, pc, lsr #22
 514:	0b01130b 	bleq	45148 <__bss_end__+0x3c5e0>
 518:	3b0b3a0b 	blcc	2ced4c <_heap+0x24ed48>
 51c:	0013010b 	andseq	r0, r3, fp, lsl #2
 520:	000d0c00 	andeq	r0, sp, r0, lsl #24
 524:	0b3a0e03 	bleq	e83d38 <_heap+0xe03d34>
 528:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 52c:	00000b38 	andeq	r0, r0, r8, lsr fp
 530:	0301130d 	movweq	r1, #4877	; 0x130d
 534:	3a0b0b0e 	bcc	2c3174 <_heap+0x243170>
 538:	010b3b0b 	tsteq	fp, fp, lsl #22
 53c:	0e000013 	mcreq	0, 0, r0, cr0, cr3, {0}
 540:	0803000d 	stmdaeq	r3, {r0, r2, r3}
 544:	0b3b0b3a 	bleq	ec3234 <_heap+0xe43230>
 548:	0b381349 	bleq	e05274 <_heap+0xd85270>
 54c:	0f0f0000 	svceq	0x000f0000
 550:	490b0b00 	stmdbmi	fp, {r8, r9, fp}
 554:	10000013 	andne	r0, r0, r3, lsl r0
 558:	0e030113 	mcreq	1, 0, r0, cr3, cr3, {0}
 55c:	0b3a050b 	bleq	e81990 <_heap+0xe0198c>
 560:	13010b3b 	movwne	r0, #6971	; 0x1b3b
 564:	0d110000 	ldceq	0, cr0, [r1, #-0]
 568:	3a0e0300 	bcc	381170 <_heap+0x30116c>
 56c:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 570:	00053813 	andeq	r3, r5, r3, lsl r8
 574:	00151200 	andseq	r1, r5, r0, lsl #4
 578:	00001927 	andeq	r1, r0, r7, lsr #18
 57c:	27011513 	smladcs	r1, r3, r5, r1
 580:	01134919 	tsteq	r3, r9, lsl r9
 584:	14000013 	strne	r0, [r0], #-19	; 0xffffffed
 588:	13490005 	movtne	r0, #36869	; 0x9005
 58c:	26150000 	ldrcs	r0, [r5], -r0
 590:	00134900 	andseq	r4, r3, r0, lsl #18
 594:	01131600 	tsteq	r3, r0, lsl #12
 598:	050b0e03 	streq	r0, [fp, #-3587]	; 0xfffff1fd
 59c:	053b0b3a 	ldreq	r0, [fp, #-2874]!	; 0xfffff4c6
 5a0:	00001301 	andeq	r1, r0, r1, lsl #6
 5a4:	03000d17 	movweq	r0, #3351	; 0xd17
 5a8:	3b0b3a0e 	blcc	2cede8 <_heap+0x24ede4>
 5ac:	38134905 	ldmdacc	r3, {r0, r2, r8, fp, lr}
 5b0:	1800000b 	stmdane	r0, {r0, r1, r3}
 5b4:	0e03000d 	cdpeq	0, 0, cr0, cr3, cr13, {0}
 5b8:	053b0b3a 	ldreq	r0, [fp, #-2874]!	; 0xfffff4c6
 5bc:	05381349 	ldreq	r1, [r8, #-841]!	; 0xfffffcb7
 5c0:	13190000 	tstne	r9, #0
 5c4:	0b0e0301 	bleq	3811d0 <_heap+0x3011cc>
 5c8:	3b0b3a0b 	blcc	2cedfc <_heap+0x24edf8>
 5cc:	00130105 	andseq	r0, r3, r5, lsl #2
 5d0:	01131a00 	tsteq	r3, r0, lsl #20
 5d4:	0b3a0b0b 	bleq	e83208 <_heap+0xe03204>
 5d8:	1301053b 	movwne	r0, #5435	; 0x153b
 5dc:	171b0000 	ldrne	r0, [fp, -r0]
 5e0:	3a0b0b01 	bcc	2c31ec <_heap+0x2431e8>
 5e4:	01053b0b 	tsteq	r5, fp, lsl #22
 5e8:	1c000013 	stcne	0, cr0, [r0], {19}
 5ec:	0e03000d 	cdpeq	0, 0, cr0, cr3, cr13, {0}
 5f0:	053b0b3a 	ldreq	r0, [fp, #-2874]!	; 0xfffff4c6
 5f4:	00001349 	andeq	r1, r0, r9, asr #6
 5f8:	2701151d 	smladcs	r1, sp, r5, r1
 5fc:	00130119 	andseq	r0, r3, r9, lsl r1
 600:	00341e00 	eorseq	r1, r4, r0, lsl #28
 604:	0b3a0e03 	bleq	e83e18 <_heap+0xe03e14>
 608:	1349053b 	movtne	r0, #38203	; 0x953b
 60c:	193c193f 	ldmdbne	ip!, {r0, r1, r2, r3, r4, r5, r8, fp, ip}
 610:	341f0000 	ldrcc	r0, [pc], #-0	; 618 <CPSR_IRQ_INHIBIT+0x598>
 614:	3a0e0300 	bcc	38121c <_heap+0x301218>
 618:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 61c:	3c193f13 	ldccc	15, cr3, [r9], {19}
 620:	20000019 	andcs	r0, r0, r9, lsl r0
 624:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 628:	0b3a0e03 	bleq	e83e3c <_heap+0xe03e38>
 62c:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 630:	01111349 	tsteq	r1, r9, asr #6
 634:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 638:	01194296 			; <UNDEFINED> instruction: 0x01194296
 63c:	21000013 	tstcs	r0, r3, lsl r0
 640:	0e030034 	mcreq	0, 0, r0, cr3, cr4, {1}
 644:	0b3b0b3a 	bleq	ec3334 <_heap+0xe43330>
 648:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 64c:	34220000 	strtcc	r0, [r2], #-0
 650:	3a0e0300 	bcc	381258 <_heap+0x301254>
 654:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 658:	23000013 	movwcs	r0, #19
 65c:	13490101 	movtne	r0, #37121	; 0x9101
 660:	01000000 	mrseq	r0, (UNDEF: 0)
 664:	0e250111 	mcreq	1, 1, r0, cr5, cr1, {0}
 668:	0e030b13 	vmoveq.32	d3[0], r0
 66c:	06120111 			; <UNDEFINED> instruction: 0x06120111
 670:	00001710 	andeq	r1, r0, r0, lsl r7
 674:	0b002402 	bleq	9684 <__bss_end__+0xb1c>
 678:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 67c:	0300000e 	movweq	r0, #14
 680:	0b0b0024 	bleq	2c0718 <_heap+0x240714>
 684:	08030b3e 	stmdaeq	r3, {r1, r2, r3, r4, r5, r8, r9, fp}
 688:	2e040000 	cdpcs	0, 0, cr0, cr4, cr0, {0}
 68c:	03193f01 	tsteq	r9, #1, 30
 690:	3b0b3a0e 	blcc	2ceed0 <_heap+0x24eecc>
 694:	1119270b 	tstne	r9, fp, lsl #14
 698:	40061201 	andmi	r1, r6, r1, lsl #4
 69c:	19429618 	stmdbne	r2, {r3, r4, r9, sl, ip, pc}^
 6a0:	00001301 	andeq	r1, r0, r1, lsl #6
 6a4:	03000505 	movweq	r0, #1285	; 0x505
 6a8:	3b0b3a08 	blcc	2ceed0 <_heap+0x24eecc>
 6ac:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 6b0:	06000018 			; <UNDEFINED> instruction: 0x06000018
 6b4:	0e030005 	cdpeq	0, 0, cr0, cr3, cr5, {0}
 6b8:	0b3b0b3a 	bleq	ec33a8 <_heap+0xe433a4>
 6bc:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 6c0:	34070000 	strcc	r0, [r7], #-0
 6c4:	3a0e0300 	bcc	3812cc <_heap+0x3012c8>
 6c8:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 6cc:	00180213 	andseq	r0, r8, r3, lsl r2
 6d0:	01010800 	tsteq	r1, r0, lsl #16
 6d4:	00001349 	andeq	r1, r0, r9, asr #6
 6d8:	49002109 	stmdbmi	r0, {r0, r3, r8, sp}
 6dc:	000b2f13 	andeq	r2, fp, r3, lsl pc
 6e0:	11010000 	mrsne	r0, (UNDEF: 1)
 6e4:	130e2501 	movwne	r2, #58625	; 0xe501
 6e8:	110e030b 	tstne	lr, fp, lsl #6
 6ec:	10061201 	andne	r1, r6, r1, lsl #4
 6f0:	02000017 	andeq	r0, r0, #23
 6f4:	0b0b0024 	bleq	2c078c <_heap+0x240788>
 6f8:	0e030b3e 	vmoveq.16	d3[0], r0
 6fc:	24030000 	strcs	r0, [r3], #-0
 700:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 704:	0008030b 	andeq	r0, r8, fp, lsl #6
 708:	01130400 	tsteq	r3, r0, lsl #8
 70c:	0b3a0b0b 	bleq	e83340 <_heap+0xe0333c>
 710:	13010b3b 	movwne	r0, #6971	; 0x1b3b
 714:	0d050000 	stceq	0, cr0, [r5, #-0]
 718:	3a0e0300 	bcc	381320 <_heap+0x30131c>
 71c:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 720:	000b3813 	andeq	r3, fp, r3, lsl r8
 724:	01010600 	tsteq	r1, r0, lsl #12
 728:	13011349 	movwne	r1, #4937	; 0x1349
 72c:	21070000 	mrscs	r0, (UNDEF: 7)
 730:	2f134900 	svccs	0x00134900
 734:	0800000b 	stmdaeq	r0, {r0, r1, r3}
 738:	13490026 	movtne	r0, #36902	; 0x9026
 73c:	16090000 	strne	r0, [r9], -r0
 740:	3a0e0300 	bcc	381348 <_heap+0x301344>
 744:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 748:	0a000013 	beq	79c <CPSR_IRQ_INHIBIT+0x71c>
 74c:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 750:	0b3a0e03 	bleq	e83f64 <_heap+0xe03f60>
 754:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 758:	01111349 	tsteq	r1, r9, asr #6
 75c:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 760:	01194297 			; <UNDEFINED> instruction: 0x01194297
 764:	0b000013 	bleq	7b8 <CPSR_IRQ_INHIBIT+0x738>
 768:	08030005 	stmdaeq	r3, {r0, r2}
 76c:	0b3b0b3a 	bleq	ec345c <_heap+0xe43458>
 770:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 774:	050c0000 	streq	r0, [ip, #-0]
 778:	3a0e0300 	bcc	381380 <_heap+0x30137c>
 77c:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 780:	00180213 	andseq	r0, r8, r3, lsl r2
 784:	00340d00 	eorseq	r0, r4, r0, lsl #26
 788:	0b3a0803 	bleq	e8279c <_heap+0xe02798>
 78c:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 790:	00001802 	andeq	r1, r0, r2, lsl #16
 794:	0b000f0e 	bleq	43d4 <CPSR_IRQ_INHIBIT+0x4354>
 798:	0013490b 	andseq	r4, r3, fp, lsl #18
 79c:	00260f00 	eoreq	r0, r6, r0, lsl #30
 7a0:	0f100000 	svceq	0x00100000
 7a4:	000b0b00 	andeq	r0, fp, r0, lsl #22
 7a8:	012e1100 			; <UNDEFINED> instruction: 0x012e1100
 7ac:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
 7b0:	0b3b0b3a 	bleq	ec34a0 <_heap+0xe4349c>
 7b4:	01111927 	tsteq	r1, r7, lsr #18
 7b8:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 7bc:	00194297 	mulseq	r9, r7, r2
 7c0:	11010000 	mrsne	r0, (UNDEF: 1)
 7c4:	11061000 	mrsne	r1, (UNDEF: 6)
 7c8:	03011201 	movweq	r1, #4609	; 0x1201
 7cc:	25081b08 	strcs	r1, [r8, #-2824]	; 0xfffff4f8
 7d0:	00051308 	andeq	r1, r5, r8, lsl #6
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
  2c:	4d2f7665 	stcmi	6, cr7, [pc, #-404]!	; fffffea0 <_heap+0xfff7fe9c>
  30:	74694c79 	strbtvc	r4, [r9], #-3193	; 0xfffff387
  34:	4f656c74 	svcmi	0x00656c74
  38:	72732f53 	rsbsvc	r2, r3, #332	; 0x14c
  3c:	63000063 	movwvs	r0, #99	; 0x63
  40:	72617473 	rsbvc	r7, r1, #1929379840	; 0x73000000
  44:	2e707574 	mrccs	5, 3, r7, cr0, cr4, {3}
  48:	00010063 	andeq	r0, r1, r3, rrx
  4c:	05000000 	streq	r0, [r0, #-0]
  50:	00809402 	addeq	r9, r0, r2, lsl #8
  54:	4bbc1800 	blmi	fef0605c <_heap+0xfee86058>
  58:	2f4a0b03 	svccs	0x004a0b03
  5c:	0200869d 	andeq	r8, r0, #164626432	; 0x9d00000
  60:	02850104 	addeq	r0, r5, #4, 2
  64:	01010006 	tsteq	r1, r6
  68:	000000f6 	strdeq	r0, [r0], -r6
  6c:	00dd0002 	sbcseq	r0, sp, r2
  70:	01020000 	mrseq	r0, (UNDEF: 2)
  74:	000d0efb 	strdeq	r0, [sp], -fp
  78:	01010101 	tsteq	r1, r1, lsl #2
  7c:	01000000 	mrseq	r0, (UNDEF: 0)
  80:	2f010000 	svccs	0x00010000
  84:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
  88:	6462612f 	strbtvs	r6, [r2], #-303	; 0xfffffed1
  8c:	72616b69 	rsbvc	r6, r1, #107520	; 0x1a400
  90:	642f6d69 	strtvs	r6, [pc], #-3433	; 98 <CPSR_IRQ_INHIBIT+0x18>
  94:	4d2f7665 	stcmi	6, cr7, [pc, #-404]!	; ffffff08 <_heap+0xfff7ff04>
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
 10c:	6d72612d 	ldfvse	f6, [r2, #-180]!	; 0xffffff4c
 110:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0xfffff68c
 114:	00632e72 	rsbeq	r2, r3, r2, ror lr
 118:	5f000001 	svcpl	0x00000001
 11c:	61666564 	cmnvs	r6, r4, ror #10
 120:	5f746c75 	svcpl	0x00746c75
 124:	65707974 	ldrbvs	r7, [r0, #-2420]!	; 0xfffff68c
 128:	00682e73 	rsbeq	r2, r8, r3, ror lr
 12c:	5f000002 	svcpl	0x00000002
 130:	69647473 	stmdbvs	r4!, {r0, r1, r4, r5, r6, sl, ip, sp, lr}^
 134:	682e746e 	stmdavs	lr!, {r1, r2, r3, r5, r6, sl, ip, sp, lr}
 138:	00000300 	andeq	r0, r0, r0, lsl #6
 13c:	2d697072 	stclcs	0, cr7, [r9, #-456]!	; 0xfffffe38
 140:	746d7261 	strbtvc	r7, [sp], #-609	; 0xfffffd9f
 144:	72656d69 	rsbvc	r6, r5, #6720	; 0x1a40
 148:	0400682e 	streq	r6, [r0], #-2094	; 0xfffff7d2
 14c:	00000000 	andeq	r0, r0, r0
 150:	81000205 	tsthi	r0, r5, lsl #4
 154:	10030000 	andne	r0, r3, r0
 158:	a14b4b01 	cmpge	fp, r1, lsl #22
 15c:	0008024c 	andeq	r0, r8, ip, asr #4
 160:	00fc0101 	rscseq	r0, ip, r1, lsl #2
 164:	00020000 	andeq	r0, r2, r0
 168:	000000e3 	andeq	r0, r0, r3, ror #1
 16c:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 170:	0101000d 	tsteq	r1, sp
 174:	00000101 	andeq	r0, r0, r1, lsl #2
 178:	00000100 	andeq	r0, r0, r0, lsl #2
 17c:	6f682f01 	svcvs	0x00682f01
 180:	612f656d 			; <UNDEFINED> instruction: 0x612f656d
 184:	6b696462 	blvs	1a59314 <_heap+0x19d9310>
 188:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
 18c:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
 190:	4c794d2f 	ldclmi	13, cr4, [r9], #-188	; 0xffffff44
 194:	6c747469 	cfldrdvs	mvd7, [r4], #-420	; 0xfffffe5c
 198:	2f534f65 	svccs	0x00534f65
 19c:	00637273 	rsbeq	r7, r3, r3, ror r2
 1a0:	7273752f 	rsbsvc	r7, r3, #197132288	; 0xbc00000
 1a4:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 1a8:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0xfffffa94
 1ac:	77656e2f 	strbvc	r6, [r5, -pc, lsr #28]!
 1b0:	2f62696c 	svccs	0x0062696c
 1b4:	6863616d 	stmdavs	r3!, {r0, r2, r3, r5, r6, r8, sp, lr}^
 1b8:	00656e69 	rsbeq	r6, r5, r9, ror #28
 1bc:	7273752f 	rsbsvc	r7, r3, #197132288	; 0xbc00000
 1c0:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 1c4:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0xfffffa94
 1c8:	77656e2f 	strbvc	r6, [r5, -pc, lsr #28]!
 1cc:	2f62696c 	svccs	0x0062696c
 1d0:	00737973 	rsbseq	r7, r3, r3, ror r9
 1d4:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; 120 <CPSR_IRQ_INHIBIT+0xa0>
 1d8:	62612f65 	rsbvs	r2, r1, #404	; 0x194
 1dc:	616b6964 	cmnvs	fp, r4, ror #18
 1e0:	2f6d6972 	svccs	0x006d6972
 1e4:	2f766564 	svccs	0x00766564
 1e8:	694c794d 	stmdbvs	ip, {r0, r2, r3, r6, r8, fp, ip, sp, lr}^
 1ec:	656c7474 	strbvs	r7, [ip, #-1140]!	; 0xfffffb8c
 1f0:	732f534f 			; <UNDEFINED> instruction: 0x732f534f
 1f4:	2e2f6372 	mcrcs	3, 1, r6, cr15, cr2, {3}
 1f8:	6e692f2e 	cdpvs	15, 6, cr2, cr9, cr14, {1}
 1fc:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xfffff39d
 200:	72000065 	andvc	r0, r0, #101	; 0x65
 204:	672d6970 			; <UNDEFINED> instruction: 0x672d6970
 208:	2e6f6970 			; <UNDEFINED> instruction: 0x2e6f6970
 20c:	00010063 	andeq	r0, r1, r3, rrx
 210:	65645f00 	strbvs	r5, [r4, #-3840]!	; 0xfffff100
 214:	6c756166 	ldfvse	f6, [r5], #-408	; 0xfffffe68
 218:	79745f74 	ldmdbvc	r4!, {r2, r4, r5, r6, r8, r9, sl, fp, ip, lr}^
 21c:	2e736570 	mrccs	5, 3, r6, cr3, cr0, {3}
 220:	00020068 	andeq	r0, r2, r8, rrx
 224:	74735f00 	ldrbtvc	r5, [r3], #-3840	; 0xfffff100
 228:	746e6964 	strbtvc	r6, [lr], #-2404	; 0xfffff69c
 22c:	0300682e 	movweq	r6, #2094	; 0x82e
 230:	70720000 	rsbsvc	r0, r2, r0
 234:	61622d69 	cmnvs	r2, r9, ror #26
 238:	682e6573 	stmdavs	lr!, {r0, r1, r4, r5, r6, r8, sl, sp, lr}
 23c:	00000400 	andeq	r0, r0, r0, lsl #8
 240:	2d697072 	stclcs	0, cr7, [r9, #-456]!	; 0xfffffe38
 244:	6f697067 	svcvs	0x00697067
 248:	0400682e 	streq	r6, [r0], #-2094	; 0xfffff7d2
 24c:	00000000 	andeq	r0, r0, r0
 250:	813c0205 	teqhi	ip, r5, lsl #4
 254:	10030000 	andne	r0, r3, r0
 258:	a14b4b01 	cmpge	fp, r1, lsl #22
 25c:	0008024c 	andeq	r0, r8, ip, asr #4
 260:	01550101 	cmpeq	r5, r1, lsl #2
 264:	00020000 	andeq	r0, r2, r0
 268:	000000fd 	strdeq	r0, [r0], -sp
 26c:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 270:	0101000d 	tsteq	r1, sp
 274:	00000101 	andeq	r0, r0, r1, lsl #2
 278:	00000100 	andeq	r0, r0, r0, lsl #2
 27c:	6f682f01 	svcvs	0x00682f01
 280:	612f656d 			; <UNDEFINED> instruction: 0x612f656d
 284:	6b696462 	blvs	1a59414 <_heap+0x19d9410>
 288:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
 28c:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
 290:	4c794d2f 	ldclmi	13, cr4, [r9], #-188	; 0xffffff44
 294:	6c747469 	cfldrdvs	mvd7, [r4], #-420	; 0xfffffe5c
 298:	2f534f65 	svccs	0x00534f65
 29c:	00637273 	rsbeq	r7, r3, r3, ror r2
 2a0:	7273752f 	rsbsvc	r7, r3, #197132288	; 0xbc00000
 2a4:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 2a8:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0xfffffa94
 2ac:	77656e2f 	strbvc	r6, [r5, -pc, lsr #28]!
 2b0:	2f62696c 	svccs	0x0062696c
 2b4:	6863616d 	stmdavs	r3!, {r0, r2, r3, r5, r6, r8, sp, lr}^
 2b8:	00656e69 	rsbeq	r6, r5, r9, ror #28
 2bc:	7273752f 	rsbsvc	r7, r3, #197132288	; 0xbc00000
 2c0:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 2c4:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0xfffffa94
 2c8:	77656e2f 	strbvc	r6, [r5, -pc, lsr #28]!
 2cc:	2f62696c 	svccs	0x0062696c
 2d0:	00737973 	rsbseq	r7, r3, r3, ror r9
 2d4:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; 220 <CPSR_IRQ_INHIBIT+0x1a0>
 2d8:	62612f65 	rsbvs	r2, r1, #404	; 0x194
 2dc:	616b6964 	cmnvs	fp, r4, ror #18
 2e0:	2f6d6972 	svccs	0x006d6972
 2e4:	2f766564 	svccs	0x00766564
 2e8:	694c794d 	stmdbvs	ip, {r0, r2, r3, r6, r8, fp, ip, sp, lr}^
 2ec:	656c7474 	strbvs	r7, [ip, #-1140]!	; 0xfffffb8c
 2f0:	732f534f 			; <UNDEFINED> instruction: 0x732f534f
 2f4:	2e2f6372 	mcrcs	3, 1, r6, cr15, cr2, {3}
 2f8:	6e692f2e 	cdpvs	15, 6, cr2, cr9, cr14, {1}
 2fc:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xfffff39d
 300:	72000065 	andvc	r0, r0, #101	; 0x65
 304:	692d6970 	pushvs	{r4, r5, r6, r8, fp, sp, lr}
 308:	7265746e 	rsbvc	r7, r5, #1845493760	; 0x6e000000
 30c:	74707572 	ldrbtvc	r7, [r0], #-1394	; 0xfffffa8e
 310:	00632e73 	rsbeq	r2, r3, r3, ror lr
 314:	5f000001 	svcpl	0x00000001
 318:	61666564 	cmnvs	r6, r4, ror #10
 31c:	5f746c75 	svcpl	0x00746c75
 320:	65707974 	ldrbvs	r7, [r0, #-2420]!	; 0xfffff68c
 324:	00682e73 	rsbeq	r2, r8, r3, ror lr
 328:	5f000002 	svcpl	0x00000002
 32c:	69647473 	stmdbvs	r4!, {r0, r1, r4, r5, r6, sl, ip, sp, lr}^
 330:	682e746e 	stmdavs	lr!, {r1, r2, r3, r5, r6, sl, ip, sp, lr}
 334:	00000300 	andeq	r0, r0, r0, lsl #6
 338:	2d697072 	stclcs	0, cr7, [r9, #-456]!	; 0xfffffe38
 33c:	65736162 	ldrbvs	r6, [r3, #-354]!	; 0xfffffe9e
 340:	0400682e 	streq	r6, [r0], #-2094	; 0xfffff7d2
 344:	70720000 	rsbsvc	r0, r2, r0
 348:	61752d69 	cmnvs	r5, r9, ror #26
 34c:	682e7472 	stmdavs	lr!, {r1, r4, r5, r6, sl, ip, sp, lr}
 350:	00000400 	andeq	r0, r0, r0, lsl #8
 354:	2d697072 	stclcs	0, cr7, [r9, #-456]!	; 0xfffffe38
 358:	65746e69 	ldrbvs	r6, [r4, #-3689]!	; 0xfffff197
 35c:	70757272 	rsbsvc	r7, r5, r2, ror r2
 360:	682e7374 	stmdavs	lr!, {r2, r4, r5, r6, r8, r9, ip, sp, lr}
 364:	00000400 	andeq	r0, r0, r0, lsl #8
 368:	02050000 	andeq	r0, r5, #0
 36c:	00008178 	andeq	r8, r0, r8, ror r1
 370:	4b011d03 	blmi	47784 <__bss_end__+0x3ec1c>
 374:	9e0b034b 	cdpls	3, 0, cr0, cr11, cr11, {2}
 378:	01040200 	mrseq	r0, R12_usr
 37c:	9e0b0369 	cdpls	3, 0, cr0, cr11, cr9, {3}
 380:	01040200 	mrseq	r0, R12_usr
 384:	9e0c034d 	cdpls	3, 0, cr0, cr12, cr13, {2}
 388:	01040200 	mrseq	r0, R12_usr
 38c:	9e0c034d 	cdpls	3, 0, cr0, cr12, cr13, {2}
 390:	01040200 	mrseq	r0, R12_usr
 394:	9e0c0369 	cdpls	3, 0, cr0, cr12, cr9, {3}
 398:	01040200 	mrseq	r0, R12_usr
 39c:	9e0d0369 	cdpls	3, 0, cr0, cr13, cr9, {3}
 3a0:	8485a185 	strhi	sl, [r5], #389	; 0x185
 3a4:	6c838683 	stcvs	6, cr8, [r3], {131}	; 0x83
 3a8:	6769a04e 	strbvs	sl, [r9, -lr, asr #32]!
 3ac:	a39e0903 	orrsge	r0, lr, #49152	; 0xc000
 3b0:	1c03a1a0 	stfned	f2, [r3], {160}	; 0xa0
 3b4:	06023082 	streq	r3, [r2], -r2, lsl #1
 3b8:	ff010100 			; <UNDEFINED> instruction: 0xff010100
 3bc:	02000000 	andeq	r0, r0, #0
 3c0:	0000dd00 	andeq	sp, r0, r0, lsl #26
 3c4:	fb010200 	blx	40bce <__bss_end__+0x38066>
 3c8:	01000d0e 	tsteq	r0, lr, lsl #26
 3cc:	00010101 	andeq	r0, r1, r1, lsl #2
 3d0:	00010000 	andeq	r0, r1, r0
 3d4:	682f0100 	stmdavs	pc!, {r8}	; <UNPREDICTABLE>
 3d8:	2f656d6f 	svccs	0x00656d6f
 3dc:	69646261 	stmdbvs	r4!, {r0, r5, r6, r9, sp, lr}^
 3e0:	6972616b 	ldmdbvs	r2!, {r0, r1, r3, r5, r6, r8, sp, lr}^
 3e4:	65642f6d 	strbvs	r2, [r4, #-3949]!	; 0xfffff093
 3e8:	794d2f76 	stmdbvc	sp, {r1, r2, r4, r5, r6, r8, r9, sl, fp, sp}^
 3ec:	7474694c 	ldrbtvc	r6, [r4], #-2380	; 0xfffff6b4
 3f0:	534f656c 	movtpl	r6, #62828	; 0xf56c
 3f4:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 3f8:	73752f00 	cmnvc	r5, #0, 30
 3fc:	6e692f72 	mcrvs	15, 3, r2, cr9, cr2, {3}
 400:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xfffff39d
 404:	656e2f65 	strbvs	r2, [lr, #-3941]!	; 0xfffff09b
 408:	62696c77 	rsbvs	r6, r9, #30464	; 0x7700
 40c:	63616d2f 	cmnvs	r1, #3008	; 0xbc0
 410:	656e6968 	strbvs	r6, [lr, #-2408]!	; 0xfffff698
 414:	73752f00 	cmnvc	r5, #0, 30
 418:	6e692f72 	mcrvs	15, 3, r2, cr9, cr2, {3}
 41c:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xfffff39d
 420:	656e2f65 	strbvs	r2, [lr, #-3941]!	; 0xfffff09b
 424:	62696c77 	rsbvs	r6, r9, #30464	; 0x7700
 428:	7379732f 	cmnvc	r9, #-1140850688	; 0xbc000000
 42c:	6f682f00 	svcvs	0x00682f00
 430:	612f656d 			; <UNDEFINED> instruction: 0x612f656d
 434:	6b696462 	blvs	1a595c4 <_heap+0x19d95c0>
 438:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
 43c:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
 440:	4c794d2f 	ldclmi	13, cr4, [r9], #-188	; 0xffffff44
 444:	6c747469 	cfldrdvs	mvd7, [r4], #-420	; 0xfffffe5c
 448:	2f534f65 	svccs	0x00534f65
 44c:	2f637273 	svccs	0x00637273
 450:	692f2e2e 	stmdbvs	pc!, {r1, r2, r3, r5, r9, sl, fp, sp}	; <UNPREDICTABLE>
 454:	756c636e 	strbvc	r6, [ip, #-878]!	; 0xfffffc92
 458:	00006564 	andeq	r6, r0, r4, ror #10
 45c:	2d697072 	stclcs	0, cr7, [r9, #-456]!	; 0xfffffe38
 460:	74737973 	ldrbtvc	r7, [r3], #-2419	; 0xfffff68d
 464:	72656d69 	rsbvc	r6, r5, #6720	; 0x1a40
 468:	0100632e 	tsteq	r0, lr, lsr #6
 46c:	645f0000 	ldrbvs	r0, [pc], #-0	; 474 <CPSR_IRQ_INHIBIT+0x3f4>
 470:	75616665 	strbvc	r6, [r1, #-1637]!	; 0xfffff99b
 474:	745f746c 	ldrbvc	r7, [pc], #-1132	; 47c <CPSR_IRQ_INHIBIT+0x3fc>
 478:	73657079 	cmnvc	r5, #121	; 0x79
 47c:	0200682e 	andeq	r6, r0, #3014656	; 0x2e0000
 480:	735f0000 	cmpvc	pc, #0
 484:	6e696474 	mcrvs	4, 3, r6, cr9, cr4, {3}
 488:	00682e74 	rsbeq	r2, r8, r4, ror lr
 48c:	72000003 	andvc	r0, r0, #3
 490:	732d6970 			; <UNDEFINED> instruction: 0x732d6970
 494:	69747379 	ldmdbvs	r4!, {r0, r3, r4, r5, r6, r8, r9, ip, sp, lr}^
 498:	2e72656d 	cdpcs	5, 7, cr6, cr2, cr13, {3}
 49c:	00040068 	andeq	r0, r4, r8, rrx
 4a0:	05000000 	streq	r0, [r0, #-0]
 4a4:	00835802 	addeq	r5, r3, r2, lsl #16
 4a8:	01100300 	tsteq	r0, r0, lsl #6
 4ac:	83a14b4b 			; <UNDEFINED> instruction: 0x83a14b4b
 4b0:	04020084 	streq	r0, [r2], #-132	; 0xffffff7c
 4b4:	062e0601 	strteq	r0, [lr], -r1, lsl #12
 4b8:	000a02f6 	strdeq	r0, [sl], -r6
 4bc:	01720101 	cmneq	r2, r1, lsl #2
 4c0:	00020000 	andeq	r0, r2, r0
 4c4:	000000fb 	strdeq	r0, [r0], -fp
 4c8:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 4cc:	0101000d 	tsteq	r1, sp
 4d0:	00000101 	andeq	r0, r0, r1, lsl #2
 4d4:	00000100 	andeq	r0, r0, r0, lsl #2
 4d8:	6f682f01 	svcvs	0x00682f01
 4dc:	612f656d 			; <UNDEFINED> instruction: 0x612f656d
 4e0:	6b696462 	blvs	1a59670 <_heap+0x19d966c>
 4e4:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
 4e8:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
 4ec:	4c794d2f 	ldclmi	13, cr4, [r9], #-188	; 0xffffff44
 4f0:	6c747469 	cfldrdvs	mvd7, [r4], #-420	; 0xfffffe5c
 4f4:	2f534f65 	svccs	0x00534f65
 4f8:	00637273 	rsbeq	r7, r3, r3, ror r2
 4fc:	7273752f 	rsbsvc	r7, r3, #197132288	; 0xbc00000
 500:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 504:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0xfffffa94
 508:	77656e2f 	strbvc	r6, [r5, -pc, lsr #28]!
 50c:	2f62696c 	svccs	0x0062696c
 510:	6863616d 	stmdavs	r3!, {r0, r2, r3, r5, r6, r8, sp, lr}^
 514:	00656e69 	rsbeq	r6, r5, r9, ror #28
 518:	7273752f 	rsbsvc	r7, r3, #197132288	; 0xbc00000
 51c:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 520:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0xfffffa94
 524:	77656e2f 	strbvc	r6, [r5, -pc, lsr #28]!
 528:	2f62696c 	svccs	0x0062696c
 52c:	00737973 	rsbseq	r7, r3, r3, ror r9
 530:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; 47c <CPSR_IRQ_INHIBIT+0x3fc>
 534:	62612f65 	rsbvs	r2, r1, #404	; 0x194
 538:	616b6964 	cmnvs	fp, r4, ror #18
 53c:	2f6d6972 	svccs	0x006d6972
 540:	2f766564 	svccs	0x00766564
 544:	694c794d 	stmdbvs	ip, {r0, r2, r3, r6, r8, fp, ip, sp, lr}^
 548:	656c7474 	strbvs	r7, [ip, #-1140]!	; 0xfffffb8c
 54c:	732f534f 			; <UNDEFINED> instruction: 0x732f534f
 550:	2e2f6372 	mcrcs	3, 1, r6, cr15, cr2, {3}
 554:	6e692f2e 	cdpvs	15, 6, cr2, cr9, cr14, {1}
 558:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xfffff39d
 55c:	72000065 	andvc	r0, r0, #101	; 0x65
 560:	752d6970 	strvc	r6, [sp, #-2416]!	; 0xfffff690
 564:	2e747261 	cdpcs	2, 7, cr7, cr4, cr1, {3}
 568:	00010063 	andeq	r0, r1, r3, rrx
 56c:	65645f00 	strbvs	r5, [r4, #-3840]!	; 0xfffff100
 570:	6c756166 	ldfvse	f6, [r5], #-408	; 0xfffffe68
 574:	79745f74 	ldmdbvc	r4!, {r2, r4, r5, r6, r8, r9, sl, fp, ip, lr}^
 578:	2e736570 	mrccs	5, 3, r6, cr3, cr0, {3}
 57c:	00020068 	andeq	r0, r2, r8, rrx
 580:	74735f00 	ldrbtvc	r5, [r3], #-3840	; 0xfffff100
 584:	746e6964 	strbtvc	r6, [lr], #-2404	; 0xfffff69c
 588:	0300682e 	movweq	r6, #2094	; 0x82e
 58c:	70720000 	rsbsvc	r0, r2, r0
 590:	61622d69 	cmnvs	r2, r9, ror #26
 594:	682e6573 	stmdavs	lr!, {r0, r1, r4, r5, r6, r8, sl, sp, lr}
 598:	00000400 	andeq	r0, r0, r0, lsl #8
 59c:	2d697072 	stclcs	0, cr7, [r9, #-456]!	; 0xfffffe38
 5a0:	74726175 	ldrbtvc	r6, [r2], #-373	; 0xfffffe8b
 5a4:	0400682e 	streq	r6, [r0], #-2094	; 0xfffff7d2
 5a8:	70720000 	rsbsvc	r0, r2, r0
 5ac:	70672d69 	rsbvc	r2, r7, r9, ror #26
 5b0:	682e6f69 	stmdavs	lr!, {r0, r3, r5, r6, r8, r9, sl, fp, sp, lr}
 5b4:	00000400 	andeq	r0, r0, r0, lsl #8
 5b8:	6f666966 	svcvs	0x00666966
 5bc:	0400682e 	streq	r6, [r0], #-2094	; 0xfffff7d2
 5c0:	00000000 	andeq	r0, r0, r0
 5c4:	83d40205 	bicshi	r0, r4, #1342177280	; 0x50000000
 5c8:	1c030000 	stcne	0, cr0, [r3], {-0}
 5cc:	a14b4b01 	cmpge	fp, r1, lsl #22
 5d0:	69a14b4b 	stmibvs	r1!, {r0, r1, r3, r6, r8, r9, fp, lr}
 5d4:	8383d84c 	orrhi	sp, r3, #76, 16	; 0x4c0000
 5d8:	67848383 	strvs	r8, [r4, r3, lsl #7]
 5dc:	67676767 	strbvs	r6, [r7, -r7, ror #14]!
 5e0:	02006985 	andeq	r6, r0, #2179072	; 0x214000
 5e4:	66060304 	strvs	r0, [r6], -r4, lsl #6
 5e8:	01040200 	mrseq	r0, R12_usr
 5ec:	69690666 	stmdbvs	r9!, {r1, r2, r5, r6, r9, sl}^
 5f0:	03040200 	movweq	r0, #16896	; 0x4200
 5f4:	02006606 	andeq	r6, r0, #6291456	; 0x600000
 5f8:	06660104 	strbteq	r0, [r6], -r4, lsl #2
 5fc:	4d856969 	vstrmi.16	s12, [r5, #210]	; 0xd2	; <UNPREDICTABLE>
 600:	00a0d983 	adceq	sp, r0, r3, lsl #19
 604:	06010402 	streq	r0, [r1], -r2, lsl #8
 608:	83bd062e 			; <UNDEFINED> instruction: 0x83bd062e
 60c:	0200a1a1 	andeq	sl, r0, #1073741864	; 0x40000028
 610:	00670304 	rsbeq	r0, r7, r4, lsl #6
 614:	b9030402 	stmdblt	r3, {r1, sl}
 618:	01040200 	mrseq	r0, R12_usr
 61c:	85066606 	strhi	r6, [r6, #-1542]	; 0xfffff9fa
 620:	9f9f6a2f 	svcls	0x009f6a2f
 624:	85bc6b85 	ldrhi	r6, [ip, #2949]!	; 0xb85
 628:	a268d983 	rsbge	sp, r8, #2146304	; 0x20c000
 62c:	02d9bcbf 	sbcseq	fp, r9, #48896	; 0xbf00
 630:	0101000a 	tsteq	r1, sl
 634:	000000f2 	strdeq	r0, [r0], -r2
 638:	00cf0002 	sbceq	r0, pc, r2
 63c:	01020000 	mrseq	r0, (UNDEF: 2)
 640:	000d0efb 	strdeq	r0, [sp], -fp
 644:	01010101 	tsteq	r1, r1, lsl #2
 648:	01000000 	mrseq	r0, (UNDEF: 0)
 64c:	2f010000 	svccs	0x00010000
 650:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
 654:	6462612f 	strbtvs	r6, [r2], #-303	; 0xfffffed1
 658:	72616b69 	rsbvc	r6, r1, #107520	; 0x1a400
 65c:	642f6d69 	strtvs	r6, [pc], #-3433	; 664 <CPSR_IRQ_INHIBIT+0x5e4>
 660:	4d2f7665 	stcmi	6, cr7, [pc, #-404]!	; 4d4 <CPSR_IRQ_INHIBIT+0x454>
 664:	74694c79 	strbtvc	r4, [r9], #-3193	; 0xfffff387
 668:	4f656c74 	svcmi	0x00656c74
 66c:	72732f53 	rsbsvc	r2, r3, #332	; 0x14c
 670:	752f0063 	strvc	r0, [pc, #-99]!	; 615 <CPSR_IRQ_INHIBIT+0x595>
 674:	692f7273 	stmdbvs	pc!, {r0, r1, r4, r5, r6, r9, ip, sp, lr}	; <UNPREDICTABLE>
 678:	756c636e 	strbvc	r6, [ip, #-878]!	; 0xfffffc92
 67c:	6e2f6564 	cfsh64vs	mvdx6, mvdx15, #52
 680:	696c7765 	stmdbvs	ip!, {r0, r2, r5, r6, r8, r9, sl, ip, sp, lr}^
 684:	79732f62 	ldmdbvc	r3!, {r1, r5, r6, r8, r9, sl, fp, sp}^
 688:	752f0073 	strvc	r0, [pc, #-115]!	; 61d <CPSR_IRQ_INHIBIT+0x59d>
 68c:	6c2f7273 	sfmvs	f7, 4, [pc], #-460	; 4c8 <CPSR_IRQ_INHIBIT+0x448>
 690:	672f6269 	strvs	r6, [pc, -r9, ror #4]!
 694:	612f6363 			; <UNDEFINED> instruction: 0x612f6363
 698:	6e2d6d72 	mcrvs	13, 1, r6, cr13, cr2, {3}
 69c:	2d656e6f 	stclcs	14, cr6, [r5, #-444]!	; 0xfffffe44
 6a0:	69626165 	stmdbvs	r2!, {r0, r2, r5, r6, r8, sp, lr}^
 6a4:	332e362f 			; <UNDEFINED> instruction: 0x332e362f
 6a8:	692f312e 	stmdbvs	pc!, {r1, r2, r3, r5, r8, ip, sp}	; <UNPREDICTABLE>
 6ac:	756c636e 	strbvc	r6, [ip, #-878]!	; 0xfffffc92
 6b0:	2f006564 	svccs	0x00006564
 6b4:	2f727375 	svccs	0x00727375
 6b8:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 6bc:	2f656475 	svccs	0x00656475
 6c0:	6c77656e 	cfldr64vs	mvdx6, [r7], #-440	; 0xfffffe48
 6c4:	00006269 	andeq	r6, r0, r9, ror #4
 6c8:	6c656873 	stclvs	8, cr6, [r5], #-460	; 0xfffffe34
 6cc:	00632e6c 	rsbeq	r2, r3, ip, ror #28
 6d0:	6c000001 	stcvs	0, cr0, [r0], {1}
 6d4:	2e6b636f 	cdpcs	3, 6, cr6, cr11, cr15, {3}
 6d8:	00020068 	andeq	r0, r2, r8, rrx
 6dc:	79745f00 	ldmdbvc	r4!, {r8, r9, sl, fp, ip, lr}^
 6e0:	2e736570 	mrccs	5, 3, r6, cr3, cr0, {3}
 6e4:	00020068 	andeq	r0, r2, r8, rrx
 6e8:	64747300 	ldrbtvs	r7, [r4], #-768	; 0xfffffd00
 6ec:	2e666564 	cdpcs	5, 6, cr6, cr6, cr4, {3}
 6f0:	00030068 	andeq	r0, r3, r8, rrx
 6f4:	65657200 	strbvs	r7, [r5, #-512]!	; 0xfffffe00
 6f8:	682e746e 	stmdavs	lr!, {r1, r2, r3, r5, r6, sl, ip, sp, lr}
 6fc:	00000200 	andeq	r0, r0, r0, lsl #4
 700:	6c647473 	cfstrdvs	mvd7, [r4], #-460	; 0xfffffe34
 704:	682e6269 	stmdavs	lr!, {r0, r3, r5, r6, r9, sp, lr}
 708:	00000400 	andeq	r0, r0, r0, lsl #8
 70c:	02050000 	andeq	r0, r5, #0
 710:	00008768 	andeq	r8, r0, r8, ror #14
 714:	03010903 	movweq	r0, #6403	; 0x1903
 718:	4f84660a 	svcmi	0x0084660a
 71c:	c1d43069 	bicsgt	r3, r4, r9, rrx
 720:	7103694c 	tstvc	r3, ip, asr #18
 724:	0006024a 	andeq	r0, r6, sl, asr #4
 728:	00690101 	rsbeq	r0, r9, r1, lsl #2
 72c:	00020000 	andeq	r0, r2, r0
 730:	00000046 	andeq	r0, r0, r6, asr #32
 734:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 738:	0101000d 	tsteq	r1, sp
 73c:	00000101 	andeq	r0, r0, r1, lsl #2
 740:	00000100 	andeq	r0, r0, r0, lsl #2
 744:	6f682f01 	svcvs	0x00682f01
 748:	612f656d 			; <UNDEFINED> instruction: 0x612f656d
 74c:	6b696462 	blvs	1a598dc <_heap+0x19d98d8>
 750:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
 754:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
 758:	4c794d2f 	ldclmi	13, cr4, [r9], #-188	; 0xffffff44
 75c:	6c747469 	cfldrdvs	mvd7, [r4], #-420	; 0xfffffe5c
 760:	2f534f65 	svccs	0x00534f65
 764:	00637273 	rsbeq	r7, r3, r3, ror r2
 768:	72617500 	rsbvc	r7, r1, #0, 10
 76c:	72654b74 	rsbvc	r4, r5, #116, 22	; 0x1d000
 770:	2e6c656e 	cdpcs	5, 6, cr6, cr12, cr14, {3}
 774:	00010063 	andeq	r0, r1, r3, rrx
 778:	05000000 	streq	r0, [r0, #-0]
 77c:	0087f802 	addeq	pc, r7, r2, lsl #16
 780:	010c0300 	mrseq	r0, LR_mon
 784:	8586a1be 	strhi	sl, [r6, #446]	; 0x1be
 788:	30a13189 	adccc	r3, r1, r9, lsl #3
 78c:	040200f4 	streq	r0, [r2], #-244	; 0xffffff0c
 790:	04028601 	streq	r8, [r2], #-1537	; 0xfffff9ff
 794:	d4010100 	strle	r0, [r1], #-256	; 0xffffff00
 798:	02000000 	andeq	r0, r0, #0
 79c:	00007800 	andeq	r7, r0, r0, lsl #16
 7a0:	fb010200 	blx	40faa <__bss_end__+0x38442>
 7a4:	01000d0e 	tsteq	r0, lr, lsl #26
 7a8:	00010101 	andeq	r0, r1, r1, lsl #2
 7ac:	00010000 	andeq	r0, r1, r0
 7b0:	682f0100 	stmdavs	pc!, {r8}	; <UNPREDICTABLE>
 7b4:	2f656d6f 	svccs	0x00656d6f
 7b8:	69646261 	stmdbvs	r4!, {r0, r5, r6, r9, sp, lr}^
 7bc:	6972616b 	ldmdbvs	r2!, {r0, r1, r3, r5, r6, r8, sp, lr}^
 7c0:	65642f6d 	strbvs	r2, [r4, #-3949]!	; 0xfffff093
 7c4:	794d2f76 	stmdbvc	sp, {r1, r2, r4, r5, r6, r8, r9, sl, fp, sp}^
 7c8:	7474694c 	ldrbtvc	r6, [r4], #-2380	; 0xfffff6b4
 7cc:	534f656c 	movtpl	r6, #62828	; 0xf56c
 7d0:	62696c2f 	rsbvs	r6, r9, #12032	; 0x2f00
 7d4:	6f682f00 	svcvs	0x00682f00
 7d8:	612f656d 			; <UNDEFINED> instruction: 0x612f656d
 7dc:	6b696462 	blvs	1a5996c <_heap+0x19d9968>
 7e0:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
 7e4:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
 7e8:	4c794d2f 	ldclmi	13, cr4, [r9], #-188	; 0xffffff44
 7ec:	6c747469 	cfldrdvs	mvd7, [r4], #-420	; 0xfffffe5c
 7f0:	2f534f65 	svccs	0x00534f65
 7f4:	2f62696c 	svccs	0x0062696c
 7f8:	692f2e2e 	stmdbvs	pc!, {r1, r2, r3, r5, r9, sl, fp, sp}	; <UNPREDICTABLE>
 7fc:	756c636e 	strbvc	r6, [ip, #-878]!	; 0xfffffc92
 800:	00006564 	andeq	r6, r0, r4, ror #10
 804:	6f666966 	svcvs	0x00666966
 808:	0100632e 	tsteq	r0, lr, lsr #6
 80c:	69660000 	stmdbvs	r6!, {}^	; <UNPREDICTABLE>
 810:	682e6f66 	stmdavs	lr!, {r1, r2, r5, r6, r8, r9, sl, fp, sp, lr}
 814:	00000200 	andeq	r0, r0, r0, lsl #4
 818:	02050000 	andeq	r0, r5, #0
 81c:	000088a8 	andeq	r8, r0, r8, lsr #17
 820:	83010a03 	movwhi	r0, #6659	; 0x1a03
 824:	87676767 	strbhi	r6, [r7, -r7, ror #14]!
 828:	bc694cbd 	stcllt	12, cr4, [r9], #-756	; 0xfffffd0c
 82c:	68bc9ff3 	ldmvs	ip!, {r0, r1, r4, r5, r6, r7, r8, r9, sl, fp, ip, pc}
 830:	04020084 	streq	r0, [r2], #-132	; 0xffffff7c
 834:	4a730302 	bmi	1cc1444 <_heap+0x1c41440>
 838:	01040200 	mrseq	r0, R12_usr
 83c:	03066606 	movweq	r6, #26118	; 0x6606
 840:	872f8211 			; <UNDEFINED> instruction: 0x872f8211
 844:	00694cbd 	strhteq	r4, [r9], #-205	; 0xffffff33
 848:	06010402 	streq	r0, [r1], -r2, lsl #8
 84c:	040200d6 	streq	r0, [r2], #-214	; 0xffffff2a
 850:	8406d602 	strhi	sp, [r6], #-1538	; 0xfffff9fe
 854:	bc9ff34c 	ldclt	3, cr15, [pc], {76}	; 0x4c
 858:	02040200 	andeq	r0, r4, #0, 4
 85c:	00667503 	rsbeq	r7, r6, r3, lsl #10
 860:	06010402 	streq	r0, [r1], -r2, lsl #8
 864:	10030666 	andne	r0, r3, r6, ror #12
 868:	08022f82 	stmdaeq	r2, {r1, r7, r8, r9, sl, fp, sp}
 86c:	77010100 	strvc	r0, [r1, -r0, lsl #2]
 870:	02000000 	andeq	r0, r0, #0
 874:	00004100 	andeq	r4, r0, r0, lsl #2
 878:	fb010200 	blx	41082 <__bss_end__+0x3851a>
 87c:	01000d0e 	tsteq	r0, lr, lsl #26
 880:	00010101 	andeq	r0, r1, r1, lsl #2
 884:	00010000 	andeq	r0, r1, r0
 888:	682f0100 	stmdavs	pc!, {r8}	; <UNPREDICTABLE>
 88c:	2f656d6f 	svccs	0x00656d6f
 890:	69646261 	stmdbvs	r4!, {r0, r5, r6, r9, sp, lr}^
 894:	6972616b 	ldmdbvs	r2!, {r0, r1, r3, r5, r6, r8, sp, lr}^
 898:	65642f6d 	strbvs	r2, [r4, #-3949]!	; 0xfffff093
 89c:	794d2f76 	stmdbvc	sp, {r1, r2, r4, r5, r6, r8, r9, sl, fp, sp}^
 8a0:	7474694c 	ldrbtvc	r6, [r4], #-2380	; 0xfffff6b4
 8a4:	534f656c 	movtpl	r6, #62828	; 0xf56c
 8a8:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 8ac:	74730000 	ldrbtvc	r0, [r3], #-0
 8b0:	2e747261 	cdpcs	2, 7, cr7, cr4, cr1, {3}
 8b4:	00010073 	andeq	r0, r1, r3, ror r0
 8b8:	05000000 	streq	r0, [r0, #-0]
 8bc:	00800002 	addeq	r0, r0, r2
 8c0:	01160300 	tsteq	r6, r0, lsl #6
 8c4:	2f2f2f2f 	svccs	0x002f2f2f
 8c8:	032f2f2f 			; <UNDEFINED> instruction: 0x032f2f2f
 8cc:	2f20080f 	svccs	0x0020080f
 8d0:	2f2f2f2f 	svccs	0x002f2f2f
 8d4:	342f2f32 	strtcc	r2, [pc], #-3890	; 8dc <CPSR_IRQ_INHIBIT+0x85c>
 8d8:	0a032f2f 	beq	cc59c <_heap+0x4c598>
 8dc:	2f33312e 	svccs	0x0033312e
 8e0:	2f2f3131 	svccs	0x002f3131
 8e4:	00020230 	andeq	r0, r2, r0, lsr r2
 8e8:	Address 0x00000000000008e8 is out of bounds.


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
  20:	8b080e42 	blhi	203930 <_heap+0x18392c>
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
  4c:	8b040e42 	blhi	10395c <_heap+0x83958>
  50:	0b0d4201 	bleq	35085c <_heap+0x2d0858>
  54:	420d0d48 	andmi	r0, sp, #72, 26	; 0x1200
  58:	00000ecb 	andeq	r0, r0, fp, asr #29
  5c:	0000001c 	andeq	r0, r0, ip, lsl r0
  60:	0000002c 	andeq	r0, r0, ip, lsr #32
  64:	00008124 	andeq	r8, r0, r4, lsr #2
  68:	00000018 	andeq	r0, r0, r8, lsl r0
  6c:	8b040e42 	blhi	10397c <_heap+0x83978>
  70:	0b0d4201 	bleq	35087c <_heap+0x2d0878>
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
  9c:	8b040e42 	blhi	1039ac <_heap+0x839a8>
  a0:	0b0d4201 	bleq	3508ac <_heap+0x2d08a8>
  a4:	420d0d48 	andmi	r0, sp, #72, 26	; 0x1200
  a8:	00000ecb 	andeq	r0, r0, fp, asr #29
  ac:	0000001c 	andeq	r0, r0, ip, lsl r0
  b0:	0000007c 	andeq	r0, r0, ip, ror r0
  b4:	00008160 	andeq	r8, r0, r0, ror #2
  b8:	00000018 	andeq	r0, r0, r8, lsl r0
  bc:	8b040e42 	blhi	1039cc <_heap+0x839c8>
  c0:	0b0d4201 	bleq	3508cc <_heap+0x2d08c8>
  c4:	420d0d44 	andmi	r0, sp, #68, 26	; 0x1100
  c8:	00000ecb 	andeq	r0, r0, fp, asr #29
  cc:	0000000c 	andeq	r0, r0, ip
  d0:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  d4:	7c020001 	stcvc	0, cr0, [r2], {1}
  d8:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  dc:	0000001c 	andeq	r0, r0, ip, lsl r0
  e0:	000000cc 	andeq	r0, r0, ip, asr #1
  e4:	00008178 	andeq	r8, r0, r8, ror r1
  e8:	00000024 	andeq	r0, r0, r4, lsr #32
  ec:	8b040e42 	blhi	1039fc <_heap+0x839f8>
  f0:	0b0d4201 	bleq	3508fc <_heap+0x2d08f8>
  f4:	420d0d48 	andmi	r0, sp, #72, 26	; 0x1200
  f8:	00000ecb 	andeq	r0, r0, fp, asr #29
  fc:	00000024 	andeq	r0, r0, r4, lsr #32
 100:	000000cc 	andeq	r0, r0, ip, asr #1
 104:	0000819c 	muleq	r0, ip, r1
 108:	00000020 	andeq	r0, r0, r0, lsr #32
 10c:	80200e44 	eorhi	r0, r0, r4, asr #28
 110:	82078108 	andhi	r8, r7, #8, 2
 114:	84058306 	strhi	r8, [r5], #-774	; 0xfffffcfa
 118:	8c038b04 			; <UNDEFINED> instruction: 0x8c038b04
 11c:	42018e02 	andmi	r8, r1, #2, 28
 120:	00040b0c 	andeq	r0, r4, ip, lsl #22
 124:	00000024 	andeq	r0, r0, r4, lsr #32
 128:	000000cc 	andeq	r0, r0, ip, asr #1
 12c:	000081bc 			; <UNDEFINED> instruction: 0x000081bc
 130:	0000001c 	andeq	r0, r0, ip, lsl r0
 134:	80200e42 	eorhi	r0, r0, r2, asr #28
 138:	82078108 	andhi	r8, r7, #8, 2
 13c:	84058306 	strhi	r8, [r5], #-774	; 0xfffffcfa
 140:	8c038b04 			; <UNDEFINED> instruction: 0x8c038b04
 144:	42018e02 	andmi	r8, r1, #2, 28
 148:	00040b0c 	andeq	r0, r4, ip, lsl #22
 14c:	00000024 	andeq	r0, r0, r4, lsr #32
 150:	000000cc 	andeq	r0, r0, ip, asr #1
 154:	000081d8 	ldrdeq	r8, [r0], -r8	; <UNPREDICTABLE>
 158:	0000001c 	andeq	r0, r0, ip, lsl r0
 15c:	80200e42 	eorhi	r0, r0, r2, asr #28
 160:	82078108 	andhi	r8, r7, #8, 2
 164:	84058306 	strhi	r8, [r5], #-774	; 0xfffffcfa
 168:	8c038b04 			; <UNDEFINED> instruction: 0x8c038b04
 16c:	42018e02 	andmi	r8, r1, #2, 28
 170:	00040b0c 	andeq	r0, r4, ip, lsl #22
 174:	00000024 	andeq	r0, r0, r4, lsr #32
 178:	000000cc 	andeq	r0, r0, ip, asr #1
 17c:	000081f4 	strdeq	r8, [r0], -r4
 180:	00000020 	andeq	r0, r0, r0, lsr #32
 184:	80200e44 	eorhi	r0, r0, r4, asr #28
 188:	82078108 	andhi	r8, r7, #8, 2
 18c:	84058306 	strhi	r8, [r5], #-774	; 0xfffffcfa
 190:	8c038b04 			; <UNDEFINED> instruction: 0x8c038b04
 194:	42018e02 	andmi	r8, r1, #2, 28
 198:	00040b0c 	andeq	r0, r4, ip, lsl #22
 19c:	00000024 	andeq	r0, r0, r4, lsr #32
 1a0:	000000cc 	andeq	r0, r0, ip, asr #1
 1a4:	00008214 	andeq	r8, r0, r4, lsl r2
 1a8:	00000020 	andeq	r0, r0, r0, lsr #32
 1ac:	80200e44 	eorhi	r0, r0, r4, asr #28
 1b0:	82078108 	andhi	r8, r7, #8, 2
 1b4:	84058306 	strhi	r8, [r5], #-774	; 0xfffffcfa
 1b8:	8c038b04 			; <UNDEFINED> instruction: 0x8c038b04
 1bc:	42018e02 	andmi	r8, r1, #2, 28
 1c0:	00040b0c 	andeq	r0, r4, ip, lsl #22
 1c4:	00000028 	andeq	r0, r0, r8, lsr #32
 1c8:	000000cc 	andeq	r0, r0, ip, asr #1
 1cc:	00008234 	andeq	r8, r0, r4, lsr r2
 1d0:	00000114 	andeq	r0, r0, r4, lsl r1
 1d4:	801c0e44 	andshi	r0, ip, r4, asr #28
 1d8:	82068107 	andhi	r8, r6, #-1073741823	; 0xc0000001
 1dc:	8b048305 	blhi	120df8 <_heap+0xa0df4>
 1e0:	8e028c03 	cdphi	12, 0, cr8, cr2, cr3, {0}
 1e4:	0b0c4201 	bleq	3109f0 <_heap+0x2909ec>
 1e8:	0c800204 	sfmeq	f0, 4, [r0], {4}
 1ec:	00001c0d 	andeq	r1, r0, sp, lsl #24
 1f0:	00000014 	andeq	r0, r0, r4, lsl r0
 1f4:	000000cc 	andeq	r0, r0, ip, asr #1
 1f8:	00008348 	andeq	r8, r0, r8, asr #6
 1fc:	00000010 	andeq	r0, r0, r0, lsl r0
 200:	040b0c42 	streq	r0, [fp], #-3138	; 0xfffff3be
 204:	000d0c44 	andeq	r0, sp, r4, asr #24
 208:	0000000c 	andeq	r0, r0, ip
 20c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 210:	7c020001 	stcvc	0, cr0, [r2], {1}
 214:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 218:	0000001c 	andeq	r0, r0, ip, lsl r0
 21c:	00000208 	andeq	r0, r0, r8, lsl #4
 220:	00008358 	andeq	r8, r0, r8, asr r3
 224:	00000024 	andeq	r0, r0, r4, lsr #32
 228:	8b040e42 	blhi	103b38 <_heap+0x83b34>
 22c:	0b0d4201 	bleq	350a38 <_heap+0x2d0a34>
 230:	420d0d48 	andmi	r0, sp, #72, 26	; 0x1200
 234:	00000ecb 	andeq	r0, r0, fp, asr #29
 238:	0000001c 	andeq	r0, r0, ip, lsl r0
 23c:	00000208 	andeq	r0, r0, r8, lsl #4
 240:	0000837c 	andeq	r8, r0, ip, ror r3
 244:	00000058 	andeq	r0, r0, r8, asr r0
 248:	8b040e42 	blhi	103b58 <_heap+0x83b54>
 24c:	0b0d4201 	bleq	350a58 <_heap+0x2d0a54>
 250:	420d0d62 	andmi	r0, sp, #6272	; 0x1880
 254:	00000ecb 	andeq	r0, r0, fp, asr #29
 258:	0000000c 	andeq	r0, r0, ip
 25c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 260:	7c020001 	stcvc	0, cr0, [r2], {1}
 264:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 268:	0000001c 	andeq	r0, r0, ip, lsl r0
 26c:	00000258 	andeq	r0, r0, r8, asr r2
 270:	000083d4 	ldrdeq	r8, [r0], -r4
 274:	00000024 	andeq	r0, r0, r4, lsr #32
 278:	8b040e42 	blhi	103b88 <_heap+0x83b84>
 27c:	0b0d4201 	bleq	350a88 <_heap+0x2d0a84>
 280:	420d0d48 	andmi	r0, sp, #72, 26	; 0x1200
 284:	00000ecb 	andeq	r0, r0, fp, asr #29
 288:	0000001c 	andeq	r0, r0, ip, lsl r0
 28c:	00000258 	andeq	r0, r0, r8, asr r2
 290:	000083f8 	strdeq	r8, [r0], -r8	; <UNPREDICTABLE>
 294:	00000024 	andeq	r0, r0, r4, lsr #32
 298:	8b040e42 	blhi	103ba8 <_heap+0x83ba4>
 29c:	0b0d4201 	bleq	350aa8 <_heap+0x2d0aa4>
 2a0:	420d0d48 	andmi	r0, sp, #72, 26	; 0x1200
 2a4:	00000ecb 	andeq	r0, r0, fp, asr #29
 2a8:	0000001c 	andeq	r0, r0, ip, lsl r0
 2ac:	00000258 	andeq	r0, r0, r8, asr r2
 2b0:	0000841c 	andeq	r8, r0, ip, lsl r4
 2b4:	0000017c 	andeq	r0, r0, ip, ror r1
 2b8:	8b080e42 	blhi	203bc8 <_heap+0x183bc4>
 2bc:	42018e02 	andmi	r8, r1, #2, 28
 2c0:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
 2c4:	080d0cb0 	stmdaeq	sp, {r4, r5, r7, sl, fp}
 2c8:	0000001c 	andeq	r0, r0, ip, lsl r0
 2cc:	00000258 	andeq	r0, r0, r8, asr r2
 2d0:	00008598 	muleq	r0, r8, r5
 2d4:	00000054 	andeq	r0, r0, r4, asr r0
 2d8:	8b040e42 	blhi	103be8 <_heap+0x83be4>
 2dc:	0b0d4201 	bleq	350ae8 <_heap+0x2d0ae4>
 2e0:	420d0d60 	andmi	r0, sp, #96, 26	; 0x1800
 2e4:	00000ecb 	andeq	r0, r0, fp, asr #29
 2e8:	0000001c 	andeq	r0, r0, ip, lsl r0
 2ec:	00000258 	andeq	r0, r0, r8, asr r2
 2f0:	000085ec 	andeq	r8, r0, ip, ror #11
 2f4:	00000064 	andeq	r0, r0, r4, rrx
 2f8:	8b080e42 	blhi	203c08 <_heap+0x183c04>
 2fc:	42018e02 	andmi	r8, r1, #2, 28
 300:	6c040b0c 			; <UNDEFINED> instruction: 0x6c040b0c
 304:	00080d0c 	andeq	r0, r8, ip, lsl #26
 308:	0000001c 	andeq	r0, r0, ip, lsl r0
 30c:	00000258 	andeq	r0, r0, r8, asr r2
 310:	00008650 	andeq	r8, r0, r0, asr r6
 314:	00000038 	andeq	r0, r0, r8, lsr r0
 318:	8b080e42 	blhi	203c28 <_heap+0x183c24>
 31c:	42018e02 	andmi	r8, r1, #2, 28
 320:	54040b0c 	strpl	r0, [r4], #-2828	; 0xfffff4f4
 324:	00080d0c 	andeq	r0, r8, ip, lsl #26
 328:	0000001c 	andeq	r0, r0, ip, lsl r0
 32c:	00000258 	andeq	r0, r0, r8, asr r2
 330:	00008688 	andeq	r8, r0, r8, lsl #13
 334:	000000e0 	andeq	r0, r0, r0, ror #1
 338:	8b080e42 	blhi	203c48 <_heap+0x183c44>
 33c:	42018e02 	andmi	r8, r1, #2, 28
 340:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
 344:	080d0c66 	stmdaeq	sp, {r1, r2, r5, r6, sl, fp}
 348:	0000000c 	andeq	r0, r0, ip
 34c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 350:	7c020001 	stcvc	0, cr0, [r2], {1}
 354:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 358:	00000018 	andeq	r0, r0, r8, lsl r0
 35c:	00000348 	andeq	r0, r0, r8, asr #6
 360:	00008768 	andeq	r8, r0, r8, ror #14
 364:	00000090 	muleq	r0, r0, r0
 368:	8b080e42 	blhi	203c78 <_heap+0x183c74>
 36c:	42018e02 	andmi	r8, r1, #2, 28
 370:	00040b0c 	andeq	r0, r4, ip, lsl #22
 374:	0000000c 	andeq	r0, r0, ip
 378:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 37c:	7c020001 	stcvc	0, cr0, [r2], {1}
 380:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 384:	00000018 	andeq	r0, r0, r8, lsl r0
 388:	00000374 	andeq	r0, r0, r4, ror r3
 38c:	000087f8 	strdeq	r8, [r0], -r8	; <UNPREDICTABLE>
 390:	000000b0 	strheq	r0, [r0], -r0	; <UNPREDICTABLE>
 394:	8b080e42 	blhi	203ca4 <_heap+0x183ca0>
 398:	42018e02 	andmi	r8, r1, #2, 28
 39c:	00040b0c 	andeq	r0, r4, ip, lsl #22
 3a0:	0000000c 	andeq	r0, r0, ip
 3a4:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 3a8:	7c020001 	stcvc	0, cr0, [r2], {1}
 3ac:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 3b0:	0000001c 	andeq	r0, r0, ip, lsl r0
 3b4:	000003a0 	andeq	r0, r0, r0, lsr #7
 3b8:	000088a8 	andeq	r8, r0, r8, lsr #17
 3bc:	00000044 	andeq	r0, r0, r4, asr #32
 3c0:	8b040e42 	blhi	103cd0 <_heap+0x83ccc>
 3c4:	0b0d4201 	bleq	350bd0 <_heap+0x2d0bcc>
 3c8:	420d0d5a 	andmi	r0, sp, #5760	; 0x1680
 3cc:	00000ecb 	andeq	r0, r0, fp, asr #29
 3d0:	0000001c 	andeq	r0, r0, ip, lsl r0
 3d4:	000003a0 	andeq	r0, r0, r0, lsr #7
 3d8:	000088ec 	andeq	r8, r0, ip, ror #17
 3dc:	000000e4 	andeq	r0, r0, r4, ror #1
 3e0:	8b040e42 	blhi	103cf0 <_heap+0x83cec>
 3e4:	0b0d4201 	bleq	350bf0 <_heap+0x2d0bec>
 3e8:	0d0d6a02 	vstreq	s12, [sp, #-8]
 3ec:	000ecb42 	andeq	ip, lr, r2, asr #22
 3f0:	0000001c 	andeq	r0, r0, ip, lsl r0
 3f4:	000003a0 	andeq	r0, r0, r0, lsr #7
 3f8:	000089d0 	ldrdeq	r8, [r0], -r0
 3fc:	00000104 	andeq	r0, r0, r4, lsl #2
 400:	8b040e42 	blhi	103d10 <_heap+0x83d0c>
 404:	0b0d4201 	bleq	350c10 <_heap+0x2d0c0c>
 408:	0d0d7a02 	vstreq	s14, [sp, #-8]
 40c:	000ecb42 	andeq	ip, lr, r2, asr #22

Disassembly of section .debug_str:

00000000 <.debug_str>:
   0:	73625f5f 	cmnvc	r2, #380	; 0x17c
   4:	6e655f73 	mcrvs	15, 3, r5, cr5, cr3, {3}
   8:	005f5f64 	subseq	r5, pc, r4, ror #30
   c:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; ffffff58 <_heap+0xfff7ff54>
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
  80:	6b7a3676 	blvs	1e8da60 <_heap+0x1e0da5c>
  84:	746d2d20 	strbtvc	r2, [sp], #-3360	; 0xfffff2e0
  88:	3d656e75 	stclcc	14, cr6, [r5, #-468]!	; 0xfffffe2c
  8c:	316d7261 	cmncc	sp, r1, ror #4
  90:	6a363731 	bvs	d8dd5c <_heap+0xd0dd58>
  94:	732d667a 			; <UNDEFINED> instruction: 0x732d667a
  98:	20672d20 	rsbcs	r2, r7, r0, lsr #26
  9c:	00304f2d 	eorseq	r4, r0, sp, lsr #30
  a0:	5f737362 	svcpl	0x00737362
  a4:	00646e65 	rsbeq	r6, r4, r5, ror #28
  a8:	73625f5f 	cmnvc	r2, #380	; 0x17c
  ac:	74735f73 	ldrbtvc	r5, [r3], #-3955	; 0xfffff08d
  b0:	5f747261 	svcpl	0x00747261
  b4:	6f4c005f 	svcvs	0x004c005f
  b8:	52006461 	andpl	r6, r0, #1627389952	; 0x61000000
  bc:	616f6c65 	cmnvs	pc, r5, ror #24
  c0:	50520064 	subspl	r0, r2, r4, rrx
  c4:	65475f49 	strbvs	r5, [r7, #-3913]	; 0xfffff0b7
  c8:	6d724174 	ldfvse	f4, [r2, #-464]!	; 0xfffffe30
  cc:	656d6954 	strbvs	r6, [sp, #-2388]!	; 0xfffff6ac
  d0:	682f0072 	stmdavs	pc!, {r1, r4, r5, r6}	; <UNPREDICTABLE>
  d4:	2f656d6f 	svccs	0x00656d6f
  d8:	69646261 	stmdbvs	r4!, {r0, r5, r6, r9, sp, lr}^
  dc:	6972616b 	ldmdbvs	r2!, {r0, r1, r3, r5, r6, r8, sp, lr}^
  e0:	65642f6d 	strbvs	r2, [r4, #-3949]!	; 0xfffff093
  e4:	794d2f76 	stmdbvc	sp, {r1, r2, r4, r5, r6, r8, r9, sl, fp, sp}^
  e8:	7474694c 	ldrbtvc	r6, [r4], #-2380	; 0xfffff6b4
  ec:	534f656c 	movtpl	r6, #62828	; 0xf56c
  f0:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
  f4:	6970722f 	ldmdbvs	r0!, {r0, r1, r2, r3, r5, r9, ip, sp, lr}^
  f8:	6d72612d 	ldfvse	f6, [r2, #-180]!	; 0xffffff4c
  fc:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0xfffff68c
 100:	00632e72 	rsbeq	r2, r3, r2, ror lr
 104:	5f697072 	svcpl	0x00697072
 108:	5f6d7261 	svcpl	0x006d7261
 10c:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0xfffff68c
 110:	00745f72 	rsbseq	r5, r4, r2, ror pc
 114:	41697072 	smcmi	38658	; 0x9702
 118:	69546d72 	ldmdbvs	r4, {r1, r4, r5, r6, r8, sl, fp, sp, lr}^
 11c:	0072656d 	rsbseq	r6, r2, sp, ror #10
 120:	49574152 	ldmdbmi	r7, {r1, r4, r6, r8, lr}^
 124:	4d005152 	stfmis	f5, [r0, #-328]	; 0xfffffeb8
 128:	656b7361 	strbvs	r7, [fp, #-865]!	; 0xfffffc9f
 12c:	51524964 	cmppl	r2, r4, ror #18
 130:	736e7500 	cmnvc	lr, #0, 10
 134:	656e6769 	strbvs	r6, [lr, #-1897]!	; 0xfffff897
 138:	68632064 	stmdavs	r3!, {r2, r5, r6, sp}^
 13c:	73007261 	movwvc	r7, #609	; 0x261
 140:	74726f68 	ldrbtvc	r6, [r2], #-3944	; 0xfffff098
 144:	736e7520 	cmnvc	lr, #32, 10	; 0x8000000
 148:	656e6769 	strbvs	r6, [lr, #-1897]!	; 0xfffff897
 14c:	6e692064 	cdpvs	0, 6, cr2, cr9, cr4, {3}
 150:	61560074 	cmpvs	r6, r4, ror r0
 154:	0065756c 	rsbeq	r7, r5, ip, ror #10
 158:	69755f5f 	ldmdbvs	r5!, {r0, r1, r2, r3, r4, r6, r8, r9, sl, fp, ip, lr}^
 15c:	3233746e 	eorscc	r7, r3, #1845493760	; 0x6e000000
 160:	5000745f 	andpl	r7, r0, pc, asr r4
 164:	69446572 	stmdbvs	r4, {r1, r4, r5, r6, r8, sl, sp, lr}^
 168:	65646976 	strbvs	r6, [r4, #-2422]!	; 0xfffff68a
 16c:	72460072 	subvc	r0, r6, #114	; 0x72
 170:	75526565 	ldrbvc	r6, [r2, #-1381]	; 0xfffffa9b
 174:	6e696e6e 	cdpvs	14, 6, cr6, cr9, cr14, {3}
 178:	756f4367 	strbvc	r4, [pc, #-871]!	; fffffe19 <_heap+0xfff7fe15>
 17c:	7265746e 	rsbvc	r7, r5, #1845493760	; 0x6e000000
 180:	6e6f6c00 	cdpvs	12, 6, cr6, cr15, cr0, {0}
 184:	6f6c2067 	svcvs	0x006c2067
 188:	7520676e 	strvc	r6, [r0, #-1902]!	; 0xfffff892
 18c:	6769736e 	strbvs	r7, [r9, -lr, ror #6]!
 190:	2064656e 	rsbcs	r6, r4, lr, ror #10
 194:	00746e69 	rsbseq	r6, r4, r9, ror #28
 198:	746e6f43 	strbtvc	r6, [lr], #-3907	; 0xfffff0bd
 19c:	006c6f72 	rsbeq	r6, ip, r2, ror pc
 1a0:	5f495052 	svcpl	0x00495052
 1a4:	546d7241 	strbtpl	r7, [sp], #-577	; 0xfffffdbf
 1a8:	72656d69 	rsbvc	r6, r5, #6720	; 0x1a40
 1ac:	74696e49 	strbtvc	r6, [r9], #-3657	; 0xfffff1b7
 1b0:	6e6f6c00 	cdpvs	12, 6, cr6, cr15, cr0, {0}
 1b4:	6f6c2067 	svcvs	0x006c2067
 1b8:	6920676e 	stmdbvs	r0!, {r1, r2, r3, r5, r6, r8, r9, sl, sp, lr}
 1bc:	7300746e 	movwvc	r7, #1134	; 0x46e
 1c0:	74726f68 	ldrbtvc	r6, [r2], #-3944	; 0xfffff098
 1c4:	746e6920 	strbtvc	r6, [lr], #-2336	; 0xfffff6e0
 1c8:	51524900 	cmppl	r2, r0, lsl #18
 1cc:	61656c43 	cmnvs	r5, r3, asr #24
 1d0:	50470072 	subpl	r0, r7, r2, ror r0
 1d4:	30544553 	subscc	r4, r4, r3, asr r5
 1d8:	53504700 	cmppl	r0, #0, 14
 1dc:	00315445 	eorseq	r5, r1, r5, asr #8
 1e0:	53465047 	movtpl	r5, #24647	; 0x6047
 1e4:	00304c45 	eorseq	r4, r0, r5, asr #24
 1e8:	53465047 	movtpl	r5, #24647	; 0x6047
 1ec:	00314c45 	eorseq	r4, r1, r5, asr #24
 1f0:	53465047 	movtpl	r5, #24647	; 0x6047
 1f4:	00324c45 	eorseq	r4, r2, r5, asr #24
 1f8:	53465047 	movtpl	r5, #24647	; 0x6047
 1fc:	00334c45 	eorseq	r4, r3, r5, asr #24
 200:	53465047 	movtpl	r5, #24647	; 0x6047
 204:	00344c45 	eorseq	r4, r4, r5, asr #24
 208:	53465047 	movtpl	r5, #24647	; 0x6047
 20c:	00354c45 	eorseq	r4, r5, r5, asr #24
 210:	45465047 	strbmi	r5, [r6, #-71]	; 0xffffffb9
 214:	4700314e 	strmi	r3, [r0, -lr, asr #2]
 218:	44555050 	ldrbmi	r5, [r5], #-80	; 0xffffffb0
 21c:	304b4c43 	subcc	r4, fp, r3, asr #24
 220:	50504700 	subspl	r4, r0, r0, lsl #14
 224:	4c434455 	cfstrdmi	mvd4, [r3], {85}	; 0x55
 228:	5200314b 	andpl	r3, r0, #-1073741806	; 0xc0000012
 22c:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
 230:	496f6970 	stmdbmi	pc!, {r4, r5, r6, r8, fp, sp, lr}^	; <UNPREDICTABLE>
 234:	0074696e 	rsbseq	r6, r4, lr, ror #18
 238:	45525047 	ldrbmi	r5, [r2, #-71]	; 0xffffffb9
 23c:	4700304e 	strmi	r3, [r0, -lr, asr #32]
 240:	4e455250 	mcrmi	2, 2, r5, cr5, cr0, {2}
 244:	65520031 	ldrbvs	r0, [r2, #-49]	; 0xffffffcf
 248:	76726573 			; <UNDEFINED> instruction: 0x76726573
 24c:	00306465 	eorseq	r6, r0, r5, ror #8
 250:	65736552 	ldrbvs	r6, [r3, #-1362]!	; 0xfffffaae
 254:	64657672 	strbtvs	r7, [r5], #-1650	; 0xfffff98e
 258:	65520031 	ldrbvs	r0, [r2, #-49]	; 0xffffffcf
 25c:	76726573 			; <UNDEFINED> instruction: 0x76726573
 260:	00326465 	eorseq	r6, r2, r5, ror #8
 264:	65736552 	ldrbvs	r6, [r3, #-1362]!	; 0xfffffaae
 268:	64657672 	strbtvs	r7, [r5], #-1650	; 0xfffff98e
 26c:	65520033 	ldrbvs	r0, [r2, #-51]	; 0xffffffcd
 270:	76726573 			; <UNDEFINED> instruction: 0x76726573
 274:	00356465 	eorseq	r6, r5, r5, ror #8
 278:	44455047 	strbmi	r5, [r5], #-71	; 0xffffffb9
 27c:	47003053 	smlsdmi	r0, r3, r0, r3
 280:	53444550 	movtpl	r4, #17744	; 0x4550
 284:	65520031 	ldrbvs	r0, [r2, #-49]	; 0xffffffcf
 288:	76726573 			; <UNDEFINED> instruction: 0x76726573
 28c:	00386465 	eorseq	r6, r8, r5, ror #8
 290:	65736552 	ldrbvs	r6, [r3, #-1362]!	; 0xfffffaae
 294:	64657672 	strbtvs	r7, [r5], #-1650	; 0xfffff98e
 298:	50470039 	subpl	r0, r7, r9, lsr r0
 29c:	304e454c 	subcc	r4, lr, ip, asr #10
 2a0:	50504700 	subspl	r4, r0, r0, lsl #14
 2a4:	52004455 	andpl	r4, r0, #1426063360	; 0x55000000
 2a8:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
 2ac:	70477465 	subvc	r7, r7, r5, ror #8
 2b0:	47006f69 	strmi	r6, [r0, -r9, ror #30]
 2b4:	45464150 	strbmi	r4, [r6, #-336]	; 0xfffffeb0
 2b8:	4700304e 	strmi	r3, [r0, -lr, asr #32]
 2bc:	45464150 	strbmi	r4, [r6, #-336]	; 0xfffffeb0
 2c0:	4700314e 	strmi	r3, [r0, -lr, asr #2]
 2c4:	524c4350 	subpl	r4, ip, #80, 6	; 0x40000001
 2c8:	70720031 	rsbsvc	r0, r2, r1, lsr r0
 2cc:	65725f69 	ldrbvs	r5, [r2, #-3945]!	; 0xfffff097
 2d0:	6f725f67 	svcvs	0x00725f67
 2d4:	4700745f 	smlsdmi	r0, pc, r4, r7	; <UNPREDICTABLE>
 2d8:	45524150 	ldrbmi	r4, [r2, #-336]	; 0xfffffeb0
 2dc:	4700314e 	strmi	r3, [r0, -lr, asr #2]
 2e0:	4e454850 	mcrmi	8, 2, r4, cr5, cr0, {2}
 2e4:	50470030 	subpl	r0, r7, r0, lsr r0
 2e8:	314e4548 	cmpcc	lr, r8, asr #10
 2ec:	73655200 	cmnvc	r5, #0, 4
 2f0:	65767265 	ldrbvs	r7, [r6, #-613]!	; 0xfffffd9b
 2f4:	00303164 	eorseq	r3, r0, r4, ror #2
 2f8:	65736552 	ldrbvs	r6, [r3, #-1362]!	; 0xfffffaae
 2fc:	64657672 	strbtvs	r7, [r5], #-1650	; 0xfffff98e
 300:	47003131 	smladxmi	r0, r1, r1, r3
 304:	45524150 	ldrbmi	r4, [r2, #-336]	; 0xfffffeb0
 308:	4700304e 	strmi	r3, [r0, -lr, asr #32]
 30c:	4e454c50 	mcrmi	12, 2, r4, cr5, cr0, {2}
 310:	70720031 	rsbsvc	r0, r2, r1, lsr r0
 314:	65725f69 	ldrbvs	r5, [r2, #-3945]!	; 0xfffff097
 318:	77725f67 	ldrbvc	r5, [r2, -r7, ror #30]!
 31c:	2f00745f 	svccs	0x0000745f
 320:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
 324:	6462612f 	strbtvs	r6, [r2], #-303	; 0xfffffed1
 328:	72616b69 	rsbvc	r6, r1, #107520	; 0x1a400
 32c:	642f6d69 	strtvs	r6, [pc], #-3433	; 334 <CPSR_IRQ_INHIBIT+0x2b4>
 330:	4d2f7665 	stcmi	6, cr7, [pc, #-404]!	; 1a4 <CPSR_IRQ_INHIBIT+0x124>
 334:	74694c79 	strbtvc	r4, [r9], #-3193	; 0xfffff387
 338:	4f656c74 	svcmi	0x00656c74
 33c:	72732f53 	rsbsvc	r2, r3, #332	; 0x14c
 340:	70722f63 	rsbsvc	r2, r2, r3, ror #30
 344:	70672d69 	rsbvc	r2, r7, r9, ror #26
 348:	632e6f69 			; <UNDEFINED> instruction: 0x632e6f69
 34c:	4c504700 	mrrcmi	7, 0, r4, r0, cr0
 350:	00305645 	eorseq	r5, r0, r5, asr #12
 354:	454c5047 	strbmi	r5, [ip, #-71]	; 0xffffffb9
 358:	52003156 	andpl	r3, r0, #-2147483627	; 0x80000015
 35c:	72657365 	rsbvc	r7, r5, #-1811939327	; 0x94000001
 360:	34646576 	strbtcc	r6, [r4], #-1398	; 0xfffffa8a
 364:	73655200 	cmnvc	r5, #0, 4
 368:	65767265 	ldrbvs	r7, [r6, #-613]!	; 0xfffffd9b
 36c:	52003664 	andpl	r3, r0, #100, 12	; 0x6400000
 370:	72657365 	rsbvc	r7, r5, #-1811939327	; 0x94000001
 374:	37646576 			; <UNDEFINED> instruction: 0x37646576
 378:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
 37c:	6f697047 	svcvs	0x00697047
 380:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
 384:	6765725f 			; <UNDEFINED> instruction: 0x6765725f
 388:	5f6f775f 	svcpl	0x006f775f
 38c:	50470074 	subpl	r0, r7, r4, ror r0
 390:	304e4546 	subcc	r4, lr, r6, asr #10
 394:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
 398:	6970675f 	ldmdbvs	r0!, {r0, r1, r2, r3, r4, r6, r8, r9, sl, sp, lr}^
 39c:	00745f6f 	rsbseq	r5, r4, pc, ror #30
 3a0:	4c435047 	mcrrmi	0, 4, r5, r3, cr7
 3a4:	2f003052 	svccs	0x00003052
 3a8:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
 3ac:	6462612f 	strbtvs	r6, [r2], #-303	; 0xfffffed1
 3b0:	72616b69 	rsbvc	r6, r1, #107520	; 0x1a400
 3b4:	642f6d69 	strtvs	r6, [pc], #-3433	; 3bc <CPSR_IRQ_INHIBIT+0x33c>
 3b8:	4d2f7665 	stcmi	6, cr7, [pc, #-404]!	; 22c <CPSR_IRQ_INHIBIT+0x1ac>
 3bc:	74694c79 	strbtvc	r4, [r9], #-3193	; 0xfffff387
 3c0:	4f656c74 	svcmi	0x00656c74
 3c4:	72732f53 	rsbsvc	r2, r3, #332	; 0x14c
 3c8:	70722f63 	rsbsvc	r2, r2, r3, ror #30
 3cc:	6e692d69 	cdpvs	13, 6, cr2, cr9, cr9, {3}
 3d0:	72726574 	rsbsvc	r6, r2, #116, 10	; 0x1d000000
 3d4:	73747075 	cmnvc	r4, #117	; 0x75
 3d8:	4100632e 	tstmi	r0, lr, lsr #6
 3dc:	4d5f5855 	ldclmi	8, cr5, [pc, #-340]	; 290 <CPSR_IRQ_INHIBIT+0x210>
 3e0:	534c5f55 	movtpl	r5, #53077	; 0xcf55
 3e4:	45525f52 	ldrbmi	r5, [r2, #-3922]	; 0xfffff0ae
 3e8:	72700047 	rsbsvc	r0, r0, #71	; 0x47
 3ec:	74656665 	strbtvc	r6, [r5], #-1637	; 0xfffff99b
 3f0:	615f6863 	cmpvs	pc, r3, ror #16
 3f4:	74726f62 	ldrbtvc	r6, [r2], #-3938	; 0xfffff09e
 3f8:	6365765f 	cmnvs	r5, #99614720	; 0x5f00000
 3fc:	00726f74 	rsbseq	r6, r2, r4, ror pc
 400:	61736944 	cmnvs	r3, r4, asr #18
 404:	5f656c62 	svcpl	0x00656c62
 408:	73515249 	cmpvc	r1, #-1879048188	; 0x90000004
 40c:	7200325f 	andvc	r3, r0, #-268435451	; 0xf0000005
 410:	694d6970 	stmdbvs	sp, {r4, r5, r6, r8, fp, sp, lr}^
 414:	6155696e 	cmpvs	r5, lr, ror #18
 418:	41007472 	tstmi	r0, r2, ror r4
 41c:	4d5f5855 	ldclmi	8, cr5, [pc, #-340]	; 2d0 <CPSR_IRQ_INHIBIT+0x250>
 420:	434d5f55 	movtmi	r5, #57173	; 0xdf55
 424:	45525f52 	ldrbmi	r5, [r2, #-3922]	; 0xfffff0ae
 428:	49460047 	stmdbmi	r6, {r0, r1, r2, r6}^
 42c:	6f635f51 	svcvs	0x00635f51
 430:	6f72746e 	svcvs	0x0072746e
 434:	6e69006c 	cdpvs	0, 6, cr0, cr9, cr12, {3}
 438:	696d6f63 	stmdbvs	sp!, {r0, r1, r5, r6, r8, r9, sl, fp, sp, lr}^
 43c:	645f676e 	ldrbvs	r6, [pc], #-1902	; 444 <CPSR_IRQ_INHIBIT+0x3c4>
 440:	00617461 	rsbeq	r7, r1, r1, ror #8
 444:	5f515249 	svcpl	0x00515249
 448:	646e6570 	strbtvs	r6, [lr], #-1392	; 0xfffffa90
 44c:	5f676e69 	svcpl	0x00676e69
 450:	70720032 	rsbsvc	r0, r2, r2, lsr r0
 454:	51524969 	cmppl	r2, r9, ror #18
 458:	746e6f43 	strbtvc	r6, [lr], #-3907	; 0xfffff0bd
 45c:	6c6c6f72 	stclvs	15, cr6, [ip], #-456	; 0xfffffe38
 460:	73007265 	movwvc	r7, #613	; 0x265
 464:	7774666f 	ldrbvc	r6, [r4, -pc, ror #12]!
 468:	5f657261 	svcpl	0x00657261
 46c:	65746e69 	ldrbvs	r6, [r4, #-3689]!	; 0xfffff197
 470:	70757272 	rsbsvc	r7, r5, r2, ror r2
 474:	65765f74 	ldrbvs	r5, [r6, #-3956]!	; 0xfffff08c
 478:	726f7463 	rsbvc	r7, pc, #1660944384	; 0x63000000
 47c:	646e7500 	strbtvs	r7, [lr], #-1280	; 0xfffffb00
 480:	6e696665 	cdpvs	6, 6, cr6, cr9, cr5, {3}
 484:	695f6465 	ldmdbvs	pc, {r0, r2, r5, r6, sl, sp, lr}^	; <UNPREDICTABLE>
 488:	7274736e 	rsbsvc	r7, r4, #-1207959551	; 0xb8000001
 48c:	69746375 	ldmdbvs	r4!, {r0, r2, r4, r5, r6, r8, r9, sp, lr}^
 490:	765f6e6f 	ldrbvc	r6, [pc], -pc, ror #28
 494:	6f746365 	svcvs	0x00746365
 498:	61660072 	smcvs	24578	; 0x6002
 49c:	695f7473 	ldmdbvs	pc, {r0, r1, r4, r5, r6, sl, ip, sp, lr}^	; <UNPREDICTABLE>
 4a0:	7265746e 	rsbvc	r7, r5, #1845493760	; 0x6e000000
 4a4:	74707572 	ldrbtvc	r7, [r0], #-1394	; 0xfffffa8e
 4a8:	6365765f 	cmnvs	r5, #99614720	; 0x5f00000
 4ac:	00726f74 	rsbseq	r6, r2, r4, ror pc
 4b0:	5f585541 	svcpl	0x00585541
 4b4:	425f554d 	subsmi	r5, pc, #322961408	; 0x13400000
 4b8:	5f445541 	svcpl	0x00445541
 4bc:	00474552 	subeq	r4, r7, r2, asr r5
 4c0:	62616e45 	rsbvs	r6, r1, #1104	; 0x450
 4c4:	495f656c 	ldmdbmi	pc, {r2, r3, r5, r6, r8, sl, sp, lr}^	; <UNPREDICTABLE>
 4c8:	5f735152 	svcpl	0x00735152
 4cc:	6e450031 	mcrvs	0, 2, r0, cr5, cr1, {1}
 4d0:	656c6261 	strbvs	r6, [ip, #-609]!	; 0xfffffd9f
 4d4:	5152495f 	cmppl	r2, pc, asr r9
 4d8:	00325f73 	eorseq	r5, r2, r3, ror pc
 4dc:	61736944 	cmnvs	r3, r4, asr #18
 4e0:	5f656c62 	svcpl	0x00656c62
 4e4:	69736142 	ldmdbvs	r3!, {r1, r6, r8, sp, lr}^
 4e8:	52495f63 	subpl	r5, r9, #396	; 0x18c
 4ec:	41007351 	tstmi	r0, r1, asr r3
 4f0:	4d5f5855 	ldclmi	8, cr5, [pc, #-340]	; 3a4 <CPSR_IRQ_INHIBIT+0x324>
 4f4:	534d5f55 	movtpl	r5, #57173	; 0xdf55
 4f8:	45525f52 	ldrbmi	r5, [r2, #-3922]	; 0xfffff0ae
 4fc:	65720047 	ldrbvs	r0, [r2, #-71]!	; 0xffffffb9
 500:	5f746573 	svcpl	0x00746573
 504:	74636576 	strbtvc	r6, [r3], #-1398	; 0xfffffa8a
 508:	4100726f 	tstmi	r0, pc, ror #4
 50c:	4d5f5855 	ldclmi	8, cr5, [pc, #-340]	; 3c0 <CPSR_IRQ_INHIBIT+0x340>
 510:	4e435f55 	mcrmi	15, 2, r5, cr3, cr5, {2}
 514:	525f4c54 	subspl	r4, pc, #84, 24	; 0x5400
 518:	41004745 	tstmi	r0, r5, asr #14
 51c:	4d5f5855 	ldclmi	8, cr5, [pc, #-340]	; 3d0 <CPSR_IRQ_INHIBIT+0x350>
 520:	4f495f55 	svcmi	0x00495f55
 524:	4745525f 	smlsldmi	r5, r5, pc, r2	; <UNPREDICTABLE>
 528:	58554100 	ldmdapl	r5, {r8, lr}^
 52c:	5f554d5f 	svcpl	0x00554d5f
 530:	5f52434c 	svcpl	0x0052434c
 534:	00474552 	subeq	r4, r7, r2, asr r5
 538:	61736944 	cmnvs	r3, r4, asr #18
 53c:	5f656c62 	svcpl	0x00656c62
 540:	73515249 	cmpvc	r1, #-1879048188	; 0x90000004
 544:	4100315f 	tstmi	r0, pc, asr r1
 548:	4d5f5855 	ldclmi	8, cr5, [pc, #-340]	; 3fc <CPSR_IRQ_INHIBIT+0x37c>
 54c:	54535f55 	ldrbpl	r5, [r3], #-3925	; 0xfffff0ab
 550:	525f5441 	subspl	r5, pc, #1090519040	; 0x41000000
 554:	45004745 	strmi	r4, [r0, #-1861]	; 0xfffff8bb
 558:	6c62616e 	stfvse	f6, [r2], #-440	; 0xfffffe48
 55c:	61425f65 	cmpvs	r2, r5, ror #30
 560:	5f636973 	svcpl	0x00636973
 564:	73515249 	cmpvc	r1, #-1879048188	; 0x90000004
 568:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
 56c:	7172695f 	cmnvc	r2, pc, asr r9
 570:	6e6f635f 	mcrvs	3, 3, r6, cr15, cr15, {2}
 574:	6c6f7274 	sfmvs	f7, 2, [pc], #-464	; 3ac <CPSR_IRQ_INHIBIT+0x32c>
 578:	5f72656c 	svcpl	0x0072656c
 57c:	70720074 	rsbsvc	r0, r2, r4, ror r0
 580:	61755f69 	cmnvs	r5, r9, ror #30
 584:	745f7472 	ldrbvc	r7, [pc], #-1138	; 58c <CPSR_IRQ_INHIBIT+0x50c>
 588:	58554100 	ldmdapl	r5, {r8, lr}^
 58c:	5f554d5f 	svcpl	0x00554d5f
 590:	41524353 	cmpmi	r2, r3, asr r3
 594:	00484354 	subeq	r4, r8, r4, asr r3
 598:	5f495052 	svcpl	0x00495052
 59c:	49746547 	ldmdbmi	r4!, {r0, r1, r2, r6, r8, sl, sp, lr}^
 5a0:	6f437172 	svcvs	0x00437172
 5a4:	6f72746e 	svcvs	0x0072746e
 5a8:	72656c6c 	rsbvc	r6, r5, #108, 24	; 0x6c00
 5ac:	74616400 	strbtvc	r6, [r1], #-1024	; 0xfffffc00
 5b0:	62615f61 	rsbvs	r5, r1, #388	; 0x184
 5b4:	5f74726f 	svcpl	0x0074726f
 5b8:	74636576 	strbtvc	r6, [r3], #-1398	; 0xfffffa8a
 5bc:	4900726f 	stmdbmi	r0, {r0, r1, r2, r3, r5, r6, r9, ip, sp, lr}
 5c0:	705f5152 	subsvc	r5, pc, r2, asr r1	; <UNPREDICTABLE>
 5c4:	69646e65 	stmdbvs	r4!, {r0, r2, r5, r6, r9, sl, fp, sp, lr}^
 5c8:	315f676e 	cmpcc	pc, lr, ror #14
 5cc:	51524900 	cmppl	r2, r0, lsl #18
 5d0:	7361625f 	cmnvc	r1, #-268435451	; 0xf0000005
 5d4:	705f6369 	subsvc	r6, pc, r9, ror #6
 5d8:	69646e65 	stmdbvs	r4!, {r0, r2, r5, r6, r9, sl, fp, sp, lr}^
 5dc:	4100676e 	tstmi	r0, lr, ror #14
 5e0:	4d5f5855 	ldclmi	8, cr5, [pc, #-340]	; 494 <CPSR_IRQ_INHIBIT+0x414>
 5e4:	49495f55 	stmdbmi	r9, {r0, r2, r4, r6, r8, r9, sl, fp, ip, lr}^
 5e8:	45525f52 	ldrbmi	r5, [r2, #-3922]	; 0xfffff0ae
 5ec:	55410047 	strbpl	r0, [r1, #-71]	; 0xffffffb9
 5f0:	554d5f58 	strbpl	r5, [sp, #-3928]	; 0xfffff0a8
 5f4:	5245495f 	subpl	r4, r5, #1556480	; 0x17c000
 5f8:	4745525f 	smlsldmi	r5, r5, pc, r2	; <UNPREDICTABLE>
 5fc:	6d6f6300 	stclvs	3, cr6, [pc, #-0]	; 604 <CPSR_IRQ_INHIBIT+0x584>
 600:	65726170 	ldrbvs	r6, [r2, #-368]!	; 0xfffffe90
 604:	6f630030 	svcvs	0x00630030
 608:	7261706d 	rsbvc	r7, r1, #109	; 0x6d
 60c:	63003165 	movwvs	r3, #357	; 0x165
 610:	61706d6f 	cmnvs	r0, pc, ror #26
 614:	00326572 	eorseq	r6, r2, r2, ror r5
 618:	706d6f63 	rsbvc	r6, sp, r3, ror #30
 61c:	33657261 	cmncc	r5, #268435462	; 0x10000006
 620:	6f682f00 	svcvs	0x00682f00
 624:	612f656d 			; <UNDEFINED> instruction: 0x612f656d
 628:	6b696462 	blvs	1a597b8 <_heap+0x19d97b4>
 62c:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
 630:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
 634:	4c794d2f 	ldclmi	13, cr4, [r9], #-188	; 0xffffff44
 638:	6c747469 	cfldrdvs	mvd7, [r4], #-420	; 0xfffffe5c
 63c:	2f534f65 	svccs	0x00534f65
 640:	2f637273 	svccs	0x00637273
 644:	2d697072 	stclcs	0, cr7, [r9, #-456]!	; 0xfffffe38
 648:	74737973 	ldrbtvc	r7, [r3], #-2419	; 0xfffff68d
 64c:	72656d69 	rsbvc	r6, r5, #6720	; 0x1a40
 650:	6300632e 	movwvs	r6, #814	; 0x32e
 654:	746e756f 	strbtvc	r7, [lr], #-1391	; 0xfffffa91
 658:	685f7265 	ldmdavs	pc, {r0, r2, r5, r6, r9, ip, sp, lr}^	; <UNPREDICTABLE>
 65c:	6f630069 	svcvs	0x00630069
 660:	6f72746e 	svcvs	0x0072746e
 664:	74735f6c 	ldrbtvc	r5, [r3], #-3948	; 0xfffff094
 668:	73757461 	cmnvc	r5, #1627389952	; 0x61000000
 66c:	756f6300 	strbvc	r6, [pc, #-768]!	; 374 <CPSR_IRQ_INHIBIT+0x2f4>
 670:	7265746e 	rsbvc	r7, r5, #1845493760	; 0x6e000000
 674:	006f6c5f 	rsbeq	r6, pc, pc, asr ip	; <UNPREDICTABLE>
 678:	5f495052 	svcpl	0x00495052
 67c:	53746547 	cmnpl	r4, #297795584	; 0x11c00000
 680:	65747379 	ldrbvs	r7, [r4, #-889]!	; 0xfffffc87
 684:	6d69546d 	cfstrdvs	mvd5, [r9, #-436]!	; 0xfffffe4c
 688:	52007265 	andpl	r7, r0, #1342177286	; 0x50000006
 68c:	575f4950 			; <UNDEFINED> instruction: 0x575f4950
 690:	4d746961 			; <UNDEFINED> instruction: 0x4d746961
 694:	6f726369 	svcvs	0x00726369
 698:	6f636553 	svcvs	0x00636553
 69c:	0073646e 	rsbseq	r6, r3, lr, ror #8
 6a0:	5f697072 	svcpl	0x00697072
 6a4:	5f737973 	svcpl	0x00737973
 6a8:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0xfffff68c
 6ac:	00745f72 	rsbseq	r5, r4, r2, ror pc
 6b0:	53697072 	cmnpl	r9, #114	; 0x72
 6b4:	65747379 	ldrbvs	r7, [r4, #-889]!	; 0xfffffc87
 6b8:	6d69546d 	cfstrdvs	mvd5, [r9, #-436]!	; 0xfffffe4c
 6bc:	41007265 	tstmi	r0, r5, ror #4
 6c0:	455f5855 	ldrbmi	r5, [pc, #-2133]	; fffffe73 <_heap+0xfff7fe6f>
 6c4:	4c42414e 	stfmie	f4, [r2], {78}	; 0x4e
 6c8:	2f005345 	svccs	0x00005345
 6cc:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
 6d0:	6462612f 	strbtvs	r6, [r2], #-303	; 0xfffffed1
 6d4:	72616b69 	rsbvc	r6, r1, #107520	; 0x1a400
 6d8:	642f6d69 	strtvs	r6, [pc], #-3433	; 6e0 <CPSR_IRQ_INHIBIT+0x660>
 6dc:	4d2f7665 	stcmi	6, cr7, [pc, #-404]!	; 550 <CPSR_IRQ_INHIBIT+0x4d0>
 6e0:	74694c79 	strbtvc	r4, [r9], #-3193	; 0xfffff387
 6e4:	4f656c74 	svcmi	0x00656c74
 6e8:	72732f53 	rsbsvc	r2, r3, #332	; 0x14c
 6ec:	70722f63 	rsbsvc	r2, r2, r3, ror #30
 6f0:	61752d69 	cmnvs	r5, r9, ror #26
 6f4:	632e7472 			; <UNDEFINED> instruction: 0x632e7472
 6f8:	61656800 	cmnvs	r5, r0, lsl #16
 6fc:	50520064 	subspl	r0, r2, r4, rrx
 700:	65475f49 	strbvs	r5, [r7, #-3913]	; 0xfffff0b7
 704:	6e694d74 	mcrvs	13, 3, r4, cr9, cr4, {3}
 708:	72615569 	rsbvc	r5, r1, #440401920	; 0x1a400000
 70c:	50520074 	subspl	r0, r2, r4, ror r0
 710:	72575f49 	subsvc	r5, r7, #292	; 0x124
 714:	54657469 	strbtpl	r7, [r5], #-1129	; 0xfffffb97
 718:	6e694d6f 	cdpvs	13, 6, cr4, cr9, cr15, {3}
 71c:	72615569 	rsbvc	r5, r1, #440401920	; 0x1a400000
 720:	69660074 	stmdbvs	r6!, {r2, r4, r5, r6}^
 724:	745f6f66 	ldrbvc	r6, [pc], #-3942	; 72c <CPSR_IRQ_INHIBIT+0x6ac>
 728:	72747300 	rsbsvc	r7, r4, #0, 6
 72c:	00676e69 	rsbeq	r6, r7, r9, ror #28
 730:	6c696174 	stfvse	f6, [r9], #-464	; 0xfffffe30
 734:	79626e00 	stmdbvc	r2!, {r9, sl, fp, sp, lr}^
 738:	00736574 	rsbseq	r6, r3, r4, ror r5
 73c:	5f495052 	svcpl	0x00495052
 740:	6e697270 	mcrvs	2, 3, r7, cr9, cr0, {3}
 744:	72745374 	rsbsvc	r5, r4, #116, 6	; 0xd0000001
 748:	00676e69 	rsbeq	r6, r7, r9, ror #28
 74c:	41697072 	smcmi	38658	; 0x9702
 750:	66007875 			; <UNDEFINED> instruction: 0x66007875
 754:	5f6f6669 	svcpl	0x006f6669
 758:	66667562 	strbtvs	r7, [r6], -r2, ror #10
 75c:	52007265 	andpl	r7, r0, #1342177286	; 0x50000006
 760:	525f4950 	subspl	r4, pc, #80, 18	; 0x140000
 764:	46646165 	strbtmi	r6, [r4], -r5, ror #2
 768:	4d6d6f72 	stclmi	15, cr6, [sp, #-456]!	; 0xfffffe38
 76c:	55696e69 	strbpl	r6, [r9, #-3689]!	; 0xfffff197
 770:	00747261 	rsbseq	r7, r4, r1, ror #4
 774:	6f697067 	svcvs	0x00697067
 778:	00676552 	rsbeq	r6, r7, r2, asr r5
 77c:	5f697072 	svcpl	0x00697072
 780:	5f787561 	svcpl	0x00787561
 784:	50520074 	subspl	r0, r2, r4, ror r0
 788:	65475f49 	strbvs	r5, [r7, #-3913]	; 0xfffff0b7
 78c:	78754174 	ldmdavc	r5!, {r2, r4, r5, r6, r8, lr}^
 790:	7a697300 	bvc	1a5d398 <_heap+0x19dd394>
 794:	70797465 	rsbsvc	r7, r9, r5, ror #8
 798:	50520065 	subspl	r0, r2, r5, rrx
 79c:	694d5f49 	stmdbvs	sp, {r0, r3, r6, r8, r9, sl, fp, ip, lr}^
 7a0:	6155696e 	cmpvs	r5, lr, ror #18
 7a4:	495f7472 	ldmdbmi	pc, {r1, r4, r5, r6, sl, ip, sp, lr}^	; <UNPREDICTABLE>
 7a8:	41005253 	tstmi	r0, r3, asr r2
 7ac:	495f5855 	ldmdbmi	pc, {r0, r2, r4, r6, fp, ip, lr}^	; <UNPREDICTABLE>
 7b0:	52005152 	andpl	r5, r0, #-2147483628	; 0x80000014
 7b4:	4d5f4950 	vldrmi.16	s9, [pc, #-160]	; 71c <CPSR_IRQ_INHIBIT+0x69c>	; <UNPREDICTABLE>
 7b8:	55696e69 	strbpl	r6, [r9, #-3689]!	; 0xfffff197
 7bc:	49747261 	ldmdbmi	r4!, {r0, r5, r6, r9, ip, sp, lr}^
 7c0:	0074696e 	rsbseq	r6, r4, lr, ror #18
 7c4:	6f636e69 	svcvs	0x00636e69
 7c8:	676e696d 	strbvs	r6, [lr, -sp, ror #18]!
 7cc:	7479625f 	ldrbtvc	r6, [r9], #-607	; 0xfffffda1
 7d0:	645f0065 	ldrbvs	r0, [pc], #-101	; 7d8 <CPSR_IRQ_INHIBIT+0x758>
 7d4:	685f6f73 	ldmdavs	pc, {r0, r1, r4, r5, r6, r8, r9, sl, fp, sp, lr}^	; <UNPREDICTABLE>
 7d8:	6c646e61 	stclvs	14, cr6, [r4], #-388	; 0xfffffe7c
 7dc:	735f0065 	cmpvc	pc, #101	; 0x65
 7e0:	00657a69 	rsbeq	r7, r5, r9, ror #20
 7e4:	6d6d6f63 	stclvs	15, cr6, [sp, #-396]!	; 0xfffffe74
 7e8:	5f646e61 	svcpl	0x00646e61
 7ec:	5f746f6e 	svcpl	0x00746f6e
 7f0:	6e756f66 	cdpvs	15, 7, cr6, cr5, cr6, {3}
 7f4:	65745f64 	ldrbvs	r5, [r4, #-3940]!	; 0xfffff09c
 7f8:	5f007478 	svcpl	0x00007478
 7fc:	646e6172 	strbtvs	r6, [lr], #-370	; 0xfffffe8e
 800:	5f003834 	svcpl	0x00003834
 804:	72656d65 	rsbvc	r6, r5, #6464	; 0x1940
 808:	636e6567 	cmnvs	lr, #432013312	; 0x19c00000
 80c:	775f0079 			; <UNDEFINED> instruction: 0x775f0079
 810:	6f747263 	svcvs	0x00747263
 814:	735f626d 	cmpvc	pc, #-805306362	; 0xd0000006
 818:	65746174 	ldrbvs	r6, [r4, #-372]!	; 0xfffffe8c
 81c:	63775f00 	cmnvs	r7, #0, 30
 820:	6f747273 	svcvs	0x00747273
 824:	5f73626d 	svcpl	0x0073626d
 828:	74617473 	strbtvc	r7, [r1], #-1139	; 0xfffffb8d
 82c:	682f0065 	stmdavs	pc!, {r0, r2, r5, r6}	; <UNPREDICTABLE>
 830:	2f656d6f 	svccs	0x00656d6f
 834:	69646261 	stmdbvs	r4!, {r0, r5, r6, r9, sp, lr}^
 838:	6972616b 	ldmdbvs	r2!, {r0, r1, r3, r5, r6, r8, sp, lr}^
 83c:	65642f6d 	strbvs	r2, [r4, #-3949]!	; 0xfffff093
 840:	794d2f76 	stmdbvc	sp, {r1, r2, r4, r5, r6, r8, r9, sl, fp, sp}^
 844:	7474694c 	ldrbtvc	r6, [r4], #-2380	; 0xfffff6b4
 848:	534f656c 	movtpl	r6, #62828	; 0xf56c
 84c:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 850:	6568732f 	strbvs	r7, [r8, #-815]!	; 0xfffffcd1
 854:	632e6c6c 			; <UNDEFINED> instruction: 0x632e6c6c
 858:	626c5f00 	rsbvs	r5, ip, #0, 30
 85c:	7a697366 	bvc	1a5d5fc <_heap+0x19dd5f8>
 860:	6d5f0065 	ldclvs	0, cr0, [pc, #-404]	; 6d4 <CPSR_IRQ_INHIBIT+0x654>
 864:	6f747262 	svcvs	0x00747262
 868:	735f6377 	cmpvc	pc, #-603979775	; 0xdc000001
 86c:	65746174 	ldrbvs	r6, [r4, #-372]!	; 0xfffffe8c
 870:	63775f00 	cmnvs	r7, #0, 30
 874:	626d6f74 	rsbvs	r6, sp, #116, 30	; 0x1d0
 878:	6174735f 	cmnvs	r4, pc, asr r3
 87c:	5f006574 	svcpl	0x00006574
 880:	5f6d745f 	svcpl	0x006d745f
 884:	00636573 	rsbeq	r6, r3, r3, ror r5
 888:	7562755f 	strbvc	r7, [r2, #-1375]!	; 0xfffffaa1
 88c:	5f5f0066 	svcpl	0x005f0066
 890:	685f6d74 	ldmdavs	pc, {r2, r4, r5, r6, r8, sl, fp, sp, lr}^	; <UNPREDICTABLE>
 894:	0072756f 	rsbseq	r7, r2, pc, ror #10
 898:	66735f5f 	uhsaxvs	r5, r3, pc	; <UNPREDICTABLE>
 89c:	6e6f5f00 	cdpvs	15, 6, cr5, cr15, cr0, {0}
 8a0:	6978655f 	ldmdbvs	r8!, {r0, r1, r2, r3, r4, r6, r8, sl, sp, lr}^
 8a4:	72615f74 	rsbvc	r5, r1, #116, 30	; 0x1d0
 8a8:	5f007367 	svcpl	0x00007367
 8ac:	6b6f6f63 	blvs	1bdc640 <_heap+0x1b5c63c>
 8b0:	5f006569 	svcpl	0x00006569
 8b4:	6c67735f 	stclvs	3, cr7, [r7], #-380	; 0xfffffe84
 8b8:	5f006575 	svcpl	0x00006575
 8bc:	67616c66 	strbvs	r6, [r1, -r6, ror #24]!
 8c0:	695f0073 	ldmdbvs	pc, {r0, r1, r4, r5, r6}^	; <UNPREDICTABLE>
 8c4:	78635f73 	stmdavc	r3!, {r0, r1, r4, r5, r6, r8, r9, sl, fp, ip, lr}^
 8c8:	735f0061 	cmpvc	pc, #97	; 0x61
 8cc:	6e696474 	mcrvs	4, 3, r6, cr9, cr4, {3}
 8d0:	6c625f00 	stclvs	15, cr5, [r2], #-0
 8d4:	7a69736b 	bvc	1a5d688 <_heap+0x19dd684>
 8d8:	635f0065 	cmpvs	pc, #101	; 0x65
 8dc:	75627476 	strbvc	r7, [r2, #-1142]!	; 0xfffffb8a
 8e0:	6f5f0066 	svcvs	0x005f0066
 8e4:	65736666 	ldrbvs	r6, [r3, #-1638]!	; 0xfffff99a
 8e8:	6d5f0074 	ldclvs	0, cr0, [pc, #-464]	; 720 <CPSR_IRQ_INHIBIT+0x6a0>
 8ec:	74727362 	ldrbtvc	r7, [r2], #-866	; 0xfffffc9e
 8f0:	7363776f 	cmnvc	r3, #29097984	; 0x1bc0000
 8f4:	6174735f 	cmnvs	r4, pc, asr r3
 8f8:	5f006574 	svcpl	0x00006574
 8fc:	6c72626d 	lfmvs	f6, 2, [r2], #-436	; 0xfffffe4c
 900:	735f6e65 	cmpvc	pc, #1616	; 0x650
 904:	65746174 	ldrbvs	r6, [r4, #-372]!	; 0xfffffe8c
 908:	6e665f00 	cdpvs	15, 6, cr5, cr6, cr0, {0}
 90c:	73677261 	cmnvc	r7, #268435462	; 0x10000006
 910:	6e665f00 	cdpvs	15, 6, cr5, cr6, cr0, {0}
 914:	735f0073 	cmpvc	pc, #115	; 0x73
 918:	006e6769 	rsbeq	r6, lr, r9, ror #14
 91c:	6f6c665f 	svcvs	0x006c665f
 920:	745f6b63 	ldrbvc	r6, [pc], #-2915	; 928 <CPSR_IRQ_INHIBIT+0x8a8>
 924:	74735f00 	ldrbtvc	r5, [r3], #-3840	; 0xfffff100
 928:	72726564 	rsbsvc	r6, r2, #100, 10	; 0x19000000
 92c:	69425f00 	stmdbvs	r2, {r8, r9, sl, fp, ip, lr}^
 930:	746e6967 	strbtvc	r6, [lr], #-2407	; 0xfffff699
 934:	61675f00 	cmnvs	r7, r0, lsl #30
 938:	5f616d6d 	svcpl	0x00616d6d
 93c:	6e676973 			; <UNDEFINED> instruction: 0x6e676973
 940:	006d6167 	rsbeq	r6, sp, r7, ror #2
 944:	65747962 	ldrbvs	r7, [r4, #-2402]!	; 0xfffff69e
 948:	65725f73 	ldrbvs	r5, [r2, #-3955]!	; 0xfffff08d
 94c:	5f006461 	svcpl	0x00006461
 950:	75736572 	ldrbvc	r6, [r3, #-1394]!	; 0xfffffa8e
 954:	6b5f746c 	blvs	17ddb0c <_heap+0x175db08>
 958:	745f5f00 	ldrbvc	r5, [pc], #-3840	; 960 <CPSR_IRQ_INHIBIT+0x8e0>
 95c:	5f5f006d 	svcpl	0x005f006d
 960:	62686377 	rsbvs	r6, r8, #-603979775	; 0xdc000001
 964:	74735f00 	ldrbtvc	r5, [r3], #-3840	; 0xfffff100
 968:	74756f64 	ldrbtvc	r6, [r5], #-3940	; 0xfffff09c
 96c:	76635f00 	strbtvc	r5, [r3], -r0, lsl #30
 970:	6e656c74 	mcrvs	12, 3, r6, cr5, cr4, {3}
 974:	69665f00 	stmdbvs	r6!, {r8, r9, sl, fp, ip, lr}^
 978:	5f00656c 	svcpl	0x0000656c
 97c:	626f696e 	rsbvs	r6, pc, #1802240	; 0x1b8000
 980:	615f0073 	cmpvs	pc, r3, ror r0	; <UNPREDICTABLE>
 984:	69786574 	ldmdbvs	r8!, {r2, r4, r5, r6, r8, sl, sp, lr}^
 988:	5f003074 	svcpl	0x00003074
 98c:	6e676973 			; <UNDEFINED> instruction: 0x6e676973
 990:	625f6c61 	subsvs	r6, pc, #24832	; 0x6100
 994:	5f006675 	svcpl	0x00006675
 998:	74637361 	strbtvc	r7, [r3], #-865	; 0xfffffc9f
 99c:	5f656d69 	svcpl	0x00656d69
 9a0:	00667562 	rsbeq	r7, r6, r2, ror #10
 9a4:	7365725f 	cmnvc	r5, #-268435451	; 0xf0000005
 9a8:	00746c75 	rsbseq	r6, r4, r5, ror ip
 9ac:	63775f5f 	cmnvs	r7, #380	; 0x17c
 9b0:	69770068 	ldmdbvs	r7!, {r3, r5, r6}^
 9b4:	745f746e 	ldrbvc	r7, [pc], #-1134	; 9bc <CPSR_IRQ_INHIBIT+0x93c>
 9b8:	6f6c5f00 	svcvs	0x006c5f00
 9bc:	5f006b63 	svcpl	0x00006b63
 9c0:	67616c66 	strbvs	r6, [r1, -r6, ror #24]!
 9c4:	5f003273 	svcpl	0x00003273
 9c8:	5f6d745f 	svcpl	0x006d745f
 9cc:	72616579 	rsbvc	r6, r1, #507510784	; 0x1e400000
 9d0:	6d6e5f00 	stclvs	15, cr5, [lr, #-0]
 9d4:	6f6c6c61 	svcvs	0x006c6c61
 9d8:	68630063 	stmdavs	r3!, {r0, r1, r5, r6}^
 9dc:	63617261 	cmnvs	r1, #268435462	; 0x10000006
 9e0:	00726574 	rsbseq	r6, r2, r4, ror r5
 9e4:	676e6f6c 	strbvs	r6, [lr, -ip, ror #30]!
 9e8:	756f6420 	strbvc	r6, [pc, #-1056]!	; 5d0 <CPSR_IRQ_INHIBIT+0x550>
 9ec:	00656c62 	rsbeq	r6, r5, r2, ror #24
 9f0:	78656e5f 	stmdavc	r5!, {r0, r1, r2, r3, r4, r6, r9, sl, fp, sp, lr}^
 9f4:	5f006674 	svcpl	0x00006674
 9f8:	5f6d745f 	svcpl	0x006d745f
 9fc:	006e6f6d 	rsbeq	r6, lr, sp, ror #30
 a00:	6574615f 	ldrbvs	r6, [r4, #-351]!	; 0xfffffea1
 a04:	00746978 	rsbseq	r6, r4, r8, ror r9
 a08:	6f627573 	svcvs	0x00627573
 a0c:	72617470 	rsbvc	r7, r1, #112, 8	; 0x70000000
 a10:	5f5f0067 	svcpl	0x005f0067
 a14:	64696473 	strbtvs	r6, [r9], #-1139	; 0xfffffb8d
 a18:	74696e69 	strbtvc	r6, [r9], #-3689	; 0xfffff197
 a1c:	666f5f00 	strbtvs	r5, [pc], -r0, lsl #30
 a20:	00745f66 	rsbseq	r5, r4, r6, ror #30
 a24:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; 970 <CPSR_IRQ_INHIBIT+0x8f0>
 a28:	62612f65 	rsbvs	r2, r1, #404	; 0x194
 a2c:	616b6964 	cmnvs	fp, r4, ror #18
 a30:	2f6d6972 	svccs	0x006d6972
 a34:	2f766564 	svccs	0x00766564
 a38:	694c794d 	stmdbvs	ip, {r0, r2, r3, r6, r8, fp, ip, sp, lr}^
 a3c:	656c7474 	strbvs	r7, [ip, #-1140]!	; 0xfffffb8c
 a40:	6200534f 	andvs	r5, r0, #1006632961	; 0x3c000001
 a44:	73657479 	cmnvc	r5, #2030043136	; 0x79000000
 a48:	6972775f 	ldmdbvs	r2!, {r0, r1, r2, r3, r4, r6, r8, r9, sl, ip, sp, lr}^
 a4c:	6e657474 	mcrvs	4, 3, r7, cr5, cr4, {3}
 a50:	72665f00 	rsbvc	r5, r6, #0, 30
 a54:	696c6565 	stmdbvs	ip!, {r0, r2, r5, r6, r8, sl, sp, lr}^
 a58:	5f007473 	svcpl	0x00007473
 a5c:	4b434f4c 	blmi	10d4794 <_heap+0x1054790>
 a60:	4345525f 	movtmi	r5, #21087	; 0x525f
 a64:	49535255 	ldmdbmi	r3, {r0, r2, r4, r6, r9, ip, lr}^
 a68:	545f4556 	ldrbpl	r4, [pc], #-1366	; a70 <CPSR_IRQ_INHIBIT+0x9f0>
 a6c:	656e5f00 	strbvs	r5, [lr, #-3840]!	; 0xfffff100
 a70:	685f0077 	ldmdavs	pc, {r0, r1, r2, r4, r5, r6}^	; <UNPREDICTABLE>
 a74:	7272655f 	rsbsvc	r6, r2, #398458880	; 0x17c00000
 a78:	5f006f6e 	svcpl	0x00006f6e
 a7c:	5f6d745f 	svcpl	0x006d745f
 a80:	79616479 	stmdbvc	r1!, {r0, r3, r4, r5, r6, sl, sp, lr}^
 a84:	735f5f00 	cmpvc	pc, #0, 30
 a88:	00667562 	rsbeq	r7, r6, r2, ror #10
 a8c:	626f695f 	rsbvs	r6, pc, #1556480	; 0x17c000
 a90:	5f5f0073 	svcpl	0x005f0073
 a94:	454c4946 	strbmi	r4, [ip, #-2374]	; 0xfffff6ba
 a98:	626d5f00 	rsbvs	r5, sp, #0, 30
 a9c:	74617473 	strbtvc	r7, [r1], #-1139	; 0xfffffb8d
 aa0:	00745f65 	rsbseq	r5, r4, r5, ror #30
 aa4:	46735f5f 	uhsaxmi	r5, r3, pc	; <UNPREDICTABLE>
 aa8:	00454c49 	subeq	r4, r5, r9, asr #24
 aac:	73626d5f 	cmnvc	r2, #6080	; 0x17c0
 ab0:	65746174 	ldrbvs	r6, [r4, #-372]!	; 0xfffffe8c
 ab4:	61725f00 	cmnvs	r2, r0, lsl #30
 ab8:	6e5f646e 	cdpvs	4, 5, cr6, cr15, cr14, {3}
 abc:	00747865 	rsbseq	r7, r4, r5, ror #16
 ac0:	6c626d5f 	stclvs	13, cr6, [r2], #-380	; 0xfffffe84
 ac4:	735f6e65 	cmpvc	pc, #1616	; 0x650
 ac8:	65746174 	ldrbvs	r6, [r4, #-372]!	; 0xfffffe8c
 acc:	6e695f00 	cdpvs	15, 6, cr5, cr9, cr0, {0}
 ad0:	695f0063 	ldmdbvs	pc, {r0, r1, r5, r6}^	; <UNPREDICTABLE>
 ad4:	5f00646e 	svcpl	0x0000646e
 ad8:	72727563 	rsbsvc	r7, r2, #415236096	; 0x18c00000
 adc:	5f746e65 	svcpl	0x00746e65
 ae0:	61636f6c 	cmnvs	r3, ip, ror #30
 ae4:	5f00656c 	svcpl	0x0000656c
 ae8:	656c635f 	strbvs	r6, [ip, #-863]!	; 0xfffffca1
 aec:	70756e61 	rsbsvc	r6, r5, r1, ror #28
 af0:	616d5f00 	cmnvs	sp, r0, lsl #30
 af4:	73647778 	cmnvc	r4, #120, 14	; 0x1e00000
 af8:	65725f00 	ldrbvs	r5, [r2, #-3840]!	; 0xfffff100
 afc:	00746e65 	rsbseq	r6, r4, r5, ror #28
 b00:	6565735f 	strbvs	r7, [r5, #-863]!	; 0xfffffca1
 b04:	5f5f0064 	svcpl	0x005f0064
 b08:	6e756f63 	cdpvs	15, 7, cr6, cr5, cr3, {3}
 b0c:	5f5f0074 	svcpl	0x005f0074
 b10:	756c6176 	strbvc	r6, [ip, #-374]!	; 0xfffffe8a
 b14:	735f0065 	cmpvc	pc, #101	; 0x65
 b18:	006b6565 	rsbeq	r6, fp, r5, ror #10
 b1c:	6f70665f 	svcvs	0x0070665f
 b20:	00745f73 	rsbseq	r5, r4, r3, ror pc
 b24:	6d745f5f 	ldclvs	15, cr5, [r4, #-380]!	; 0xfffffe84
 b28:	6e696d5f 	mcrvs	13, 3, r6, cr9, cr15, {2}
 b2c:	756d5f00 	strbvc	r5, [sp, #-3840]!	; 0xfffff100
 b30:	6500746c 	strvs	r7, [r0, #-1132]	; 0xfffffb94
 b34:	7265746e 	rsbvc	r7, r5, #1845493760	; 0x6e000000
 b38:	6d6f635f 	stclvs	3, cr6, [pc, #-380]!	; 9c4 <CPSR_IRQ_INHIBIT+0x944>
 b3c:	646e616d 	strbtvs	r6, [lr], #-365	; 0xfffffe93
 b40:	7865745f 	stmdavc	r5!, {r0, r1, r2, r3, r4, r6, sl, ip, sp, lr}^
 b44:	735f0074 	cmpvc	pc, #116	; 0x74
 b48:	6f747274 	svcvs	0x00747274
 b4c:	616c5f6b 	cmnvs	ip, fp, ror #30
 b50:	5f007473 	svcpl	0x00007473
 b54:	79746e66 	ldmdbvc	r4!, {r1, r2, r5, r6, r9, sl, fp, sp, lr}^
 b58:	00736570 	rsbseq	r6, r3, r0, ror r5
 b5c:	6464615f 	strbtvs	r6, [r4], #-351	; 0xfffffea1
 b60:	555f5f00 	ldrbpl	r5, [pc, #-3840]	; fffffc68 <_heap+0xfff7fc64>
 b64:	676e6f4c 	strbvs	r6, [lr, -ip, asr #30]!
 b68:	65675f00 	strbvs	r5, [r7, #-3840]!	; 0xfffff100
 b6c:	74616474 	strbtvc	r6, [r1], #-1140	; 0xfffffb8c
 b70:	72655f65 	rsbvc	r5, r5, #404	; 0x194
 b74:	675f0072 			; <UNDEFINED> instruction: 0x675f0072
 b78:	61626f6c 	cmnvs	r2, ip, ror #30
 b7c:	6d695f6c 	stclvs	15, cr5, [r9, #-432]!	; 0xfffffe50
 b80:	65727570 	ldrbvs	r7, [r2, #-1392]!	; 0xfffffa90
 b84:	7274705f 	rsbsvc	r7, r4, #95	; 0x5f
 b88:	75635f00 	strbvc	r5, [r3, #-3840]!	; 0xfffff100
 b8c:	6e657272 	mcrvs	2, 3, r7, cr5, cr2, {3}
 b90:	61635f74 	smcvs	13812	; 0x35f4
 b94:	6f676574 	svcvs	0x00676574
 b98:	5f007972 	svcpl	0x00007972
 b9c:	73756e75 	cmnvc	r5, #1872	; 0x750
 ba0:	725f6465 	subsvc	r6, pc, #1694498816	; 0x65000000
 ba4:	00646e61 	rsbeq	r6, r4, r1, ror #28
 ba8:	7364775f 	cmnvc	r4, #24903680	; 0x17c0000
 bac:	745f5f00 	ldrbvc	r5, [pc], #-3840	; bb4 <CPSR_IRQ_INHIBIT+0xb34>
 bb0:	64775f6d 	ldrbtvs	r5, [r7], #-3949	; 0xfffff093
 bb4:	5f007961 	svcpl	0x00007961
 bb8:	65756c67 	ldrbvs	r6, [r5, #-3175]!	; 0xfffff399
 bbc:	61625f00 	cmnvs	r2, r0, lsl #30
 bc0:	5f006573 	svcpl	0x00006573
 bc4:	6134366c 	teqvs	r4, ip, ror #12
 bc8:	6675625f 			; <UNDEFINED> instruction: 0x6675625f
 bcc:	69735f00 	ldmdbvs	r3!, {r8, r9, sl, fp, ip, lr}^
 bd0:	75665f67 	strbvc	r5, [r6, #-3943]!	; 0xfffff099
 bd4:	5f00636e 	svcpl	0x0000636e
 bd8:	6675626e 	ldrbtvs	r6, [r5], -lr, ror #4
 bdc:	6e755f00 	cdpvs	15, 7, cr5, cr5, cr0, {0}
 be0:	64657375 	strbtvs	r7, [r5], #-885	; 0xfffffc8b
 be4:	745f5f00 	ldrbvc	r5, [pc], #-3840	; bec <CPSR_IRQ_INHIBIT+0xb6c>
 be8:	73695f6d 	cmnvc	r9, #436	; 0x1b4
 bec:	00747364 	rsbseq	r7, r4, r4, ror #6
 bf0:	636f6c5f 	cmnvs	pc, #24320	; 0x5f00
 bf4:	69746c61 	ldmdbvs	r4!, {r0, r5, r6, sl, fp, sp, lr}^
 bf8:	625f656d 	subsvs	r6, pc, #457179136	; 0x1b400000
 bfc:	5f006675 	svcpl	0x00006675
 c00:	736f6c63 	cmnvc	pc, #25344	; 0x6300
 c04:	725f0065 	subsvc	r0, pc, #101	; 0x65
 c08:	5f003834 	svcpl	0x00003834
 c0c:	6f74626d 	svcvs	0x0074626d
 c10:	735f6377 	cmpvc	pc, #-603979775	; 0xdc000001
 c14:	65746174 	ldrbvs	r6, [r4, #-372]!	; 0xfffffe8c
 c18:	35705f00 	ldrbcc	r5, [r0, #-3840]!	; 0xfffff100
 c1c:	5f5f0073 	svcpl	0x005f0073
 c20:	6d5f6d74 	ldclvs	13, cr6, [pc, #-464]	; a58 <CPSR_IRQ_INHIBIT+0x9d8>
 c24:	00796164 	rsbseq	r6, r9, r4, ror #2
 c28:	6c656873 	stclvs	8, cr6, [r5], #-460	; 0xfffffe34
 c2c:	616d5f6c 	cmnvs	sp, ip, ror #30
 c30:	61006e69 	tstvs	r0, r9, ror #28
 c34:	73676174 	cmnvc	r7, #116, 2
 c38:	65687300 	strbvs	r7, [r8, #-768]!	; 0xfffffd00
 c3c:	735f6c6c 	cmpvc	pc, #108, 24	; 0x6c00
 c40:	74726174 	ldrbtvc	r6, [r2], #-372	; 0xfffffe8c
 c44:	7865745f 	stmdavc	r5!, {r0, r1, r2, r3, r4, r6, sl, ip, sp, lr}^
 c48:	656b0074 	strbvs	r0, [fp, #-116]!	; 0xffffff8c
 c4c:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 c50:	69616d5f 	stmdbvs	r1!, {r0, r1, r2, r3, r4, r6, r8, sl, fp, sp, lr}^
 c54:	682f006e 	stmdavs	pc!, {r1, r2, r3, r5, r6}	; <UNPREDICTABLE>
 c58:	2f656d6f 	svccs	0x00656d6f
 c5c:	69646261 	stmdbvs	r4!, {r0, r5, r6, r9, sp, lr}^
 c60:	6972616b 	ldmdbvs	r2!, {r0, r1, r3, r5, r6, r8, sp, lr}^
 c64:	65642f6d 	strbvs	r2, [r4, #-3949]!	; 0xfffff093
 c68:	794d2f76 	stmdbvc	sp, {r1, r2, r4, r5, r6, r8, r9, sl, fp, sp}^
 c6c:	7474694c 	ldrbtvc	r6, [r4], #-2380	; 0xfffff6b4
 c70:	534f656c 	movtpl	r6, #62828	; 0xf56c
 c74:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 c78:	7261752f 	rsbvc	r7, r1, #197132288	; 0xbc00000
 c7c:	72654b74 	rsbvc	r4, r5, #116, 22	; 0x1d000
 c80:	2e6c656e 	cdpcs	5, 6, cr6, cr12, cr14, {3}
 c84:	682f0063 	stmdavs	pc!, {r0, r1, r5, r6}	; <UNPREDICTABLE>
 c88:	2f656d6f 	svccs	0x00656d6f
 c8c:	69646261 	stmdbvs	r4!, {r0, r5, r6, r9, sp, lr}^
 c90:	6972616b 	ldmdbvs	r2!, {r0, r1, r3, r5, r6, r8, sp, lr}^
 c94:	65642f6d 	strbvs	r2, [r4, #-3949]!	; 0xfffff093
 c98:	794d2f76 	stmdbvc	sp, {r1, r2, r4, r5, r6, r8, r9, sl, fp, sp}^
 c9c:	7474694c 	ldrbtvc	r6, [r4], #-2380	; 0xfffff6b4
 ca0:	534f656c 	movtpl	r6, #62828	; 0xf56c
 ca4:	62696c2f 	rsbvs	r6, r9, #12032	; 0x2f00
 ca8:	6669662f 	strbtvs	r6, [r9], -pc, lsr #12
 cac:	00632e6f 	rsbeq	r2, r3, pc, ror #28
 cb0:	6f666966 	svcvs	0x00666966
 cb4:	6972775f 	ldmdbvs	r2!, {r0, r1, r2, r3, r4, r6, r8, r9, sl, ip, sp, lr}^
 cb8:	66006574 			; <UNDEFINED> instruction: 0x66006574
 cbc:	5f6f6669 	svcpl	0x006f6669
 cc0:	74696e69 	strbtvc	r6, [r9], #-3689	; 0xfffff197
 cc4:	66696600 	strbtvs	r6, [r9], -r0, lsl #12
 cc8:	65725f6f 	ldrbvs	r5, [r2, #-3951]!	; 0xfffff091
 ccc:	73006461 	movwvc	r6, #1121	; 0x461
 cd0:	61726f74 	cmnvs	r2, r4, ror pc
 cd4:	Address 0x0000000000000cd4 is out of bounds.


Disassembly of section .ARM.attributes:

00000000 <.ARM.attributes>:
   0:	00003041 	andeq	r3, r0, r1, asr #32
   4:	61656100 	cmnvs	r5, r0, lsl #2
   8:	01006962 	tsteq	r0, r2, ror #18
   c:	00000026 	andeq	r0, r0, r6, lsr #32
  10:	4b5a3605 	blmi	168d82c <_heap+0x160d828>
  14:	08070600 	stmdaeq	r7, {r9, sl}
  18:	0a010901 	beq	42424 <__bss_end__+0x398bc>
  1c:	14041202 	strne	r1, [r4], #-514	; 0xfffffdfe
  20:	17011501 	strne	r1, [r1, -r1, lsl #10]
  24:	1a011803 	bne	46038 <__bss_end__+0x3d4d0>
  28:	1e011c01 	cdpne	12, 0, cr1, cr1, cr1, {0}
  2c:	44012206 	strmi	r2, [r1], #-518	; 0xfffffdfa
  30:	Address 0x0000000000000030 is out of bounds.

