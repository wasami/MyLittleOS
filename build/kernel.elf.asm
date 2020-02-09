
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
    803c:	000081dc 	ldrdeq	r8, [r0], -ip

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
    80f0:	eb000155 	bl	864c <kernel_main>
    80f4:	eafffffe 	b	80f4 <_cstartup+0x60>
    80f8:	00008aff 	strdeq	r8, [r0], -pc	; <UNPREDICTABLE>
    80fc:	00008b1c 	andeq	r8, r0, ip, lsl fp

00008100 <RPI_GetGpio>:
    8100:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8104:	e28db000 	add	fp, sp, #0
    8108:	e59f3010 	ldr	r3, [pc, #16]	; 8120 <RPI_GetGpio+0x20>
    810c:	e5933000 	ldr	r3, [r3]
    8110:	e1a00003 	mov	r0, r3
    8114:	e28bd000 	add	sp, fp, #0
    8118:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    811c:	e12fff1e 	bx	lr
    8120:	00008ad8 	ldrdeq	r8, [r0], -r8	; <UNPREDICTABLE>

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
    815c:	00008adc 	ldrdeq	r8, [r0], -ip

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
    81c4:	e92d581f 	push	{r0, r1, r2, r3, r4, fp, ip, lr}
    81c8:	e28db01c 	add	fp, sp, #28
    81cc:	eb0000be 	bl	84cc <RPI_MiniUart_ISR>
    81d0:	e320f000 	nop	{0}
    81d4:	e24bd01c 	sub	sp, fp, #28
    81d8:	e8fd981f 	ldm	sp!, {r0, r1, r2, r3, r4, fp, ip, pc}^

000081dc <fast_interrupt_vector>:
    81dc:	e24db004 	sub	fp, sp, #4
    81e0:	e320f000 	nop	{0}
    81e4:	e28bd004 	add	sp, fp, #4
    81e8:	e25ef004 	subs	pc, lr, #4

000081ec <RPI_GetAux>:
    81ec:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    81f0:	e28db000 	add	fp, sp, #0
    81f4:	e59f3010 	ldr	r3, [pc, #16]	; 820c <RPI_GetAux+0x20>
    81f8:	e5933000 	ldr	r3, [r3]
    81fc:	e1a00003 	mov	r0, r3
    8200:	e28bd000 	add	sp, fp, #0
    8204:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8208:	e12fff1e 	bx	lr
    820c:	00008ae0 	andeq	r8, r0, r0, ror #21

00008210 <RPI_GetMiniUart>:
    8210:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8214:	e28db000 	add	fp, sp, #0
    8218:	e59f3010 	ldr	r3, [pc, #16]	; 8230 <RPI_GetMiniUart+0x20>
    821c:	e5933000 	ldr	r3, [r3]
    8220:	e1a00003 	mov	r0, r3
    8224:	e28bd000 	add	sp, fp, #0
    8228:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    822c:	e12fff1e 	bx	lr
    8230:	00008ae4 	andeq	r8, r0, r4, ror #21

00008234 <RPI_MiniUartInit>:
    8234:	e92d4800 	push	{fp, lr}
    8238:	e28db004 	add	fp, sp, #4
    823c:	e24dd008 	sub	sp, sp, #8
    8240:	ebfffff2 	bl	8210 <RPI_GetMiniUart>
    8244:	e50b0008 	str	r0, [fp, #-8]
    8248:	ebffffac 	bl	8100 <RPI_GetGpio>
    824c:	e50b000c 	str	r0, [fp, #-12]
    8250:	ebffffe5 	bl	81ec <RPI_GetAux>
    8254:	e1a03000 	mov	r3, r0
    8258:	e5932004 	ldr	r2, [r3, #4]
    825c:	e3822001 	orr	r2, r2, #1
    8260:	e5832004 	str	r2, [r3, #4]
    8264:	e51b3008 	ldr	r3, [fp, #-8]
    8268:	e3a02000 	mov	r2, #0
    826c:	e5832020 	str	r2, [r3, #32]
    8270:	e51b3008 	ldr	r3, [fp, #-8]
    8274:	e3a02000 	mov	r2, #0
    8278:	e5832004 	str	r2, [r3, #4]
    827c:	e51b3008 	ldr	r3, [fp, #-8]
    8280:	e3a02003 	mov	r2, #3
    8284:	e583200c 	str	r2, [r3, #12]
    8288:	e51b3008 	ldr	r3, [fp, #-8]
    828c:	e3a02000 	mov	r2, #0
    8290:	e5832010 	str	r2, [r3, #16]
    8294:	e51b3008 	ldr	r3, [fp, #-8]
    8298:	e59f2128 	ldr	r2, [pc, #296]	; 83c8 <RPI_MiniUartInit+0x194>
    829c:	e5832028 	str	r2, [r3, #40]	; 0x28
    82a0:	e51b300c 	ldr	r3, [fp, #-12]
    82a4:	e5933004 	ldr	r3, [r3, #4]
    82a8:	e59f211c 	ldr	r2, [pc, #284]	; 83cc <RPI_MiniUartInit+0x198>
    82ac:	e5823000 	str	r3, [r2]
    82b0:	e59f3114 	ldr	r3, [pc, #276]	; 83cc <RPI_MiniUartInit+0x198>
    82b4:	e5933000 	ldr	r3, [r3]
    82b8:	e3c33a07 	bic	r3, r3, #28672	; 0x7000
    82bc:	e59f2108 	ldr	r2, [pc, #264]	; 83cc <RPI_MiniUartInit+0x198>
    82c0:	e5823000 	str	r3, [r2]
    82c4:	e59f3100 	ldr	r3, [pc, #256]	; 83cc <RPI_MiniUartInit+0x198>
    82c8:	e5933000 	ldr	r3, [r3]
    82cc:	e3833a02 	orr	r3, r3, #8192	; 0x2000
    82d0:	e59f20f4 	ldr	r2, [pc, #244]	; 83cc <RPI_MiniUartInit+0x198>
    82d4:	e5823000 	str	r3, [r2]
    82d8:	e59f30ec 	ldr	r3, [pc, #236]	; 83cc <RPI_MiniUartInit+0x198>
    82dc:	e5933000 	ldr	r3, [r3]
    82e0:	e3c3390e 	bic	r3, r3, #229376	; 0x38000
    82e4:	e59f20e0 	ldr	r2, [pc, #224]	; 83cc <RPI_MiniUartInit+0x198>
    82e8:	e5823000 	str	r3, [r2]
    82ec:	e59f30d8 	ldr	r3, [pc, #216]	; 83cc <RPI_MiniUartInit+0x198>
    82f0:	e5933000 	ldr	r3, [r3]
    82f4:	e3833801 	orr	r3, r3, #65536	; 0x10000
    82f8:	e59f20cc 	ldr	r2, [pc, #204]	; 83cc <RPI_MiniUartInit+0x198>
    82fc:	e5823000 	str	r3, [r2]
    8300:	e59f30c4 	ldr	r3, [pc, #196]	; 83cc <RPI_MiniUartInit+0x198>
    8304:	e5932000 	ldr	r2, [r3]
    8308:	e51b300c 	ldr	r3, [fp, #-12]
    830c:	e5832004 	str	r2, [r3, #4]
    8310:	e51b300c 	ldr	r3, [fp, #-12]
    8314:	e3a02000 	mov	r2, #0
    8318:	e5832094 	str	r2, [r3, #148]	; 0x94
    831c:	e59f30a8 	ldr	r3, [pc, #168]	; 83cc <RPI_MiniUartInit+0x198>
    8320:	e3a02000 	mov	r2, #0
    8324:	e5832000 	str	r2, [r3]
    8328:	ea000004 	b	8340 <RPI_MiniUartInit+0x10c>
    832c:	e59f3098 	ldr	r3, [pc, #152]	; 83cc <RPI_MiniUartInit+0x198>
    8330:	e5933000 	ldr	r3, [r3]
    8334:	e2833001 	add	r3, r3, #1
    8338:	e59f208c 	ldr	r2, [pc, #140]	; 83cc <RPI_MiniUartInit+0x198>
    833c:	e5823000 	str	r3, [r2]
    8340:	e59f3084 	ldr	r3, [pc, #132]	; 83cc <RPI_MiniUartInit+0x198>
    8344:	e5933000 	ldr	r3, [r3]
    8348:	e3530095 	cmp	r3, #149	; 0x95
    834c:	9afffff6 	bls	832c <RPI_MiniUartInit+0xf8>
    8350:	e51b300c 	ldr	r3, [fp, #-12]
    8354:	e3a02903 	mov	r2, #49152	; 0xc000
    8358:	e5832098 	str	r2, [r3, #152]	; 0x98
    835c:	e59f3068 	ldr	r3, [pc, #104]	; 83cc <RPI_MiniUartInit+0x198>
    8360:	e3a02000 	mov	r2, #0
    8364:	e5832000 	str	r2, [r3]
    8368:	ea000004 	b	8380 <RPI_MiniUartInit+0x14c>
    836c:	e59f3058 	ldr	r3, [pc, #88]	; 83cc <RPI_MiniUartInit+0x198>
    8370:	e5933000 	ldr	r3, [r3]
    8374:	e2833001 	add	r3, r3, #1
    8378:	e59f204c 	ldr	r2, [pc, #76]	; 83cc <RPI_MiniUartInit+0x198>
    837c:	e5823000 	str	r3, [r2]
    8380:	e59f3044 	ldr	r3, [pc, #68]	; 83cc <RPI_MiniUartInit+0x198>
    8384:	e5933000 	ldr	r3, [r3]
    8388:	e3530095 	cmp	r3, #149	; 0x95
    838c:	9afffff6 	bls	836c <RPI_MiniUartInit+0x138>
    8390:	e51b300c 	ldr	r3, [fp, #-12]
    8394:	e3a02000 	mov	r2, #0
    8398:	e5832098 	str	r2, [r3, #152]	; 0x98
    839c:	e51b3008 	ldr	r3, [fp, #-8]
    83a0:	e3a02002 	mov	r2, #2
    83a4:	e5832004 	str	r2, [r3, #4]
    83a8:	e59f0020 	ldr	r0, [pc, #32]	; 83d0 <RPI_MiniUartInit+0x19c>
    83ac:	eb0000b5 	bl	8688 <fifo_init>
    83b0:	e51b3008 	ldr	r3, [fp, #-8]
    83b4:	e3a02003 	mov	r2, #3
    83b8:	e5832020 	str	r2, [r3, #32]
    83bc:	e320f000 	nop	{0}
    83c0:	e24bd004 	sub	sp, fp, #4
    83c4:	e8bd8800 	pop	{fp, pc}
    83c8:	0000010e 	andeq	r0, r0, lr, lsl #2
    83cc:	00008b18 	andeq	r8, r0, r8, lsl fp
    83d0:	00008b00 	andeq	r8, r0, r0, lsl #22

000083d4 <RPI_WriteToMiniUart>:
    83d4:	e92d4800 	push	{fp, lr}
    83d8:	e28db004 	add	fp, sp, #4
    83dc:	e24dd018 	sub	sp, sp, #24
    83e0:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    83e4:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    83e8:	ebffff88 	bl	8210 <RPI_GetMiniUart>
    83ec:	e50b0014 	str	r0, [fp, #-20]	; 0xffffffec
    83f0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    83f4:	e50b3010 	str	r3, [fp, #-16]
    83f8:	e3a03000 	mov	r3, #0
    83fc:	e50b300c 	str	r3, [fp, #-12]
    8400:	e3a03000 	mov	r3, #0
    8404:	e50b3008 	str	r3, [fp, #-8]
    8408:	ea000014 	b	8460 <RPI_WriteToMiniUart+0x8c>
    840c:	e51b3010 	ldr	r3, [fp, #-16]
    8410:	e3a02000 	mov	r2, #0
    8414:	e5c32000 	strb	r2, [r3]
    8418:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    841c:	e5933014 	ldr	r3, [r3, #20]
    8420:	e2033020 	and	r3, r3, #32
    8424:	e3530000 	cmp	r3, #0
    8428:	0a000009 	beq	8454 <RPI_WriteToMiniUart+0x80>
    842c:	e51b3010 	ldr	r3, [fp, #-16]
    8430:	e2832001 	add	r2, r3, #1
    8434:	e50b2010 	str	r2, [fp, #-16]
    8438:	e5d33000 	ldrb	r3, [r3]
    843c:	e1a02003 	mov	r2, r3
    8440:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8444:	e5832000 	str	r2, [r3]
    8448:	e51b300c 	ldr	r3, [fp, #-12]
    844c:	e2833001 	add	r3, r3, #1
    8450:	e50b300c 	str	r3, [fp, #-12]
    8454:	e51b3008 	ldr	r3, [fp, #-8]
    8458:	e2833001 	add	r3, r3, #1
    845c:	e50b3008 	str	r3, [fp, #-8]
    8460:	e51b2008 	ldr	r2, [fp, #-8]
    8464:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    8468:	e1520003 	cmp	r2, r3
    846c:	baffffe6 	blt	840c <RPI_WriteToMiniUart+0x38>
    8470:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8474:	e5933004 	ldr	r3, [r3, #4]
    8478:	e3832001 	orr	r2, r3, #1
    847c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8480:	e5832004 	str	r2, [r3, #4]
    8484:	e51b300c 	ldr	r3, [fp, #-12]
    8488:	e1a00003 	mov	r0, r3
    848c:	e24bd004 	sub	sp, fp, #4
    8490:	e8bd8800 	pop	{fp, pc}

00008494 <RPI_ReadFromMiniUart>:
    8494:	e92d4800 	push	{fp, lr}
    8498:	e28db004 	add	fp, sp, #4
    849c:	e24dd008 	sub	sp, sp, #8
    84a0:	e50b0008 	str	r0, [fp, #-8]
    84a4:	e50b100c 	str	r1, [fp, #-12]
    84a8:	e51b200c 	ldr	r2, [fp, #-12]
    84ac:	e51b1008 	ldr	r1, [fp, #-8]
    84b0:	e59f0010 	ldr	r0, [pc, #16]	; 84c8 <RPI_ReadFromMiniUart+0x34>
    84b4:	eb000084 	bl	86cc <fifo_read>
    84b8:	e1a03000 	mov	r3, r0
    84bc:	e1a00003 	mov	r0, r3
    84c0:	e24bd004 	sub	sp, fp, #4
    84c4:	e8bd8800 	pop	{fp, pc}
    84c8:	00008b00 	andeq	r8, r0, r0, lsl #22

000084cc <RPI_MiniUart_ISR>:
    84cc:	e92d4800 	push	{fp, lr}
    84d0:	e28db004 	add	fp, sp, #4
    84d4:	e24dd010 	sub	sp, sp, #16
    84d8:	ebffff4c 	bl	8210 <RPI_GetMiniUart>
    84dc:	e50b0008 	str	r0, [fp, #-8]
    84e0:	e51b3008 	ldr	r3, [fp, #-8]
    84e4:	e5933008 	ldr	r3, [r3, #8]
    84e8:	e2033004 	and	r3, r3, #4
    84ec:	e3530000 	cmp	r3, #0
    84f0:	0a000012 	beq	8540 <RPI_MiniUart_ISR+0x74>
    84f4:	e51b3008 	ldr	r3, [fp, #-8]
    84f8:	e5933000 	ldr	r3, [r3]
    84fc:	e50b300c 	str	r3, [fp, #-12]
    8500:	e51b200c 	ldr	r2, [fp, #-12]
    8504:	e51b3008 	ldr	r3, [fp, #-8]
    8508:	e5832000 	str	r2, [r3]
    850c:	e51b3008 	ldr	r3, [fp, #-8]
    8510:	e5933004 	ldr	r3, [r3, #4]
    8514:	e3832001 	orr	r2, r3, #1
    8518:	e51b3008 	ldr	r3, [fp, #-8]
    851c:	e5832004 	str	r2, [r3, #4]
    8520:	e51b300c 	ldr	r3, [fp, #-12]
    8524:	e6ef3073 	uxtb	r3, r3
    8528:	e54b300d 	strb	r3, [fp, #-13]
    852c:	e24b300d 	sub	r3, fp, #13
    8530:	e3a02001 	mov	r2, #1
    8534:	e1a01003 	mov	r1, r3
    8538:	e59f0048 	ldr	r0, [pc, #72]	; 8588 <RPI_MiniUart_ISR+0xbc>
    853c:	eb00009b 	bl	87b0 <fifo_write>
    8540:	e51b3008 	ldr	r3, [fp, #-8]
    8544:	e5933008 	ldr	r3, [r3, #8]
    8548:	e2033002 	and	r3, r3, #2
    854c:	e3530000 	cmp	r3, #0
    8550:	0a000009 	beq	857c <RPI_MiniUart_ISR+0xb0>
    8554:	e51b3008 	ldr	r3, [fp, #-8]
    8558:	e5933014 	ldr	r3, [r3, #20]
    855c:	e2033040 	and	r3, r3, #64	; 0x40
    8560:	e3530000 	cmp	r3, #0
    8564:	0a000004 	beq	857c <RPI_MiniUart_ISR+0xb0>
    8568:	e51b3008 	ldr	r3, [fp, #-8]
    856c:	e5933004 	ldr	r3, [r3, #4]
    8570:	e3c32001 	bic	r2, r3, #1
    8574:	e51b3008 	ldr	r3, [fp, #-8]
    8578:	e5832004 	str	r2, [r3, #4]
    857c:	e320f000 	nop	{0}
    8580:	e24bd004 	sub	sp, fp, #4
    8584:	e8bd8800 	pop	{fp, pc}
    8588:	00008b00 	andeq	r8, r0, r0, lsl #22

0000858c <shell_main>:
    858c:	e92d4800 	push	{fp, lr}
    8590:	e28db004 	add	fp, sp, #4
    8594:	e24dd010 	sub	sp, sp, #16
    8598:	e3a01001 	mov	r1, #1
    859c:	e51b0010 	ldr	r0, [fp, #-16]
    85a0:	ebffffbb 	bl	8494 <RPI_ReadFromMiniUart>
    85a4:	e50b000c 	str	r0, [fp, #-12]
    85a8:	e51b3010 	ldr	r3, [fp, #-16]
    85ac:	e50b3008 	str	r3, [fp, #-8]
    85b0:	e3a01004 	mov	r1, #4
    85b4:	e59f0084 	ldr	r0, [pc, #132]	; 8640 <shell_main+0xb4>
    85b8:	ebffff85 	bl	83d4 <RPI_WriteToMiniUart>
    85bc:	e50b0014 	str	r0, [fp, #-20]	; 0xffffffec
    85c0:	ea000006 	b	85e0 <shell_main+0x54>
    85c4:	e3a01001 	mov	r1, #1
    85c8:	e51b0008 	ldr	r0, [fp, #-8]
    85cc:	ebffffb0 	bl	8494 <RPI_ReadFromMiniUart>
    85d0:	e1a02000 	mov	r2, r0
    85d4:	e51b300c 	ldr	r3, [fp, #-12]
    85d8:	e0833002 	add	r3, r3, r2
    85dc:	e50b300c 	str	r3, [fp, #-12]
    85e0:	e51b3008 	ldr	r3, [fp, #-8]
    85e4:	e2832001 	add	r2, r3, #1
    85e8:	e50b2008 	str	r2, [fp, #-8]
    85ec:	e5d33000 	ldrb	r3, [r3]
    85f0:	e353003b 	cmp	r3, #59	; 0x3b
    85f4:	1afffff2 	bne	85c4 <shell_main+0x38>
    85f8:	e3a03000 	mov	r3, #0
    85fc:	e50b300c 	str	r3, [fp, #-12]
    8600:	e59f1038 	ldr	r1, [pc, #56]	; 8640 <shell_main+0xb4>
    8604:	e51b0010 	ldr	r0, [fp, #-16]
    8608:	eb0000a9 	bl	88b4 <strcmp>
    860c:	e1a03000 	mov	r3, r0
    8610:	e3530000 	cmp	r3, #0
    8614:	1a000004 	bne	862c <shell_main+0xa0>
    8618:	e3a01008 	mov	r1, #8
    861c:	e59f0020 	ldr	r0, [pc, #32]	; 8644 <shell_main+0xb8>
    8620:	ebffff6b 	bl	83d4 <RPI_WriteToMiniUart>
    8624:	e50b0014 	str	r0, [fp, #-20]	; 0xffffffec
    8628:	eaffffec 	b	85e0 <shell_main+0x54>
    862c:	e3a01007 	mov	r1, #7
    8630:	e59f0010 	ldr	r0, [pc, #16]	; 8648 <shell_main+0xbc>
    8634:	ebffff66 	bl	83d4 <RPI_WriteToMiniUart>
    8638:	e50b0014 	str	r0, [fp, #-20]	; 0xffffffec
    863c:	eaffffe7 	b	85e0 <shell_main+0x54>
    8640:	00008ae8 	andeq	r8, r0, r8, ror #21
    8644:	00008af0 	strdeq	r8, [r0], -r0
    8648:	00008af8 	strdeq	r8, [r0], -r8	; <UNPREDICTABLE>

0000864c <kernel_main>:
    864c:	e92d4800 	push	{fp, lr}
    8650:	e28db004 	add	fp, sp, #4
    8654:	e24dd010 	sub	sp, sp, #16
    8658:	e50b0008 	str	r0, [fp, #-8]
    865c:	e50b100c 	str	r1, [fp, #-12]
    8660:	e50b2010 	str	r2, [fp, #-16]
    8664:	ebfffef2 	bl	8234 <RPI_MiniUartInit>
    8668:	ebfffeb3 	bl	813c <RPI_GetIrqController>
    866c:	e1a03000 	mov	r3, r0
    8670:	e5932010 	ldr	r2, [r3, #16]
    8674:	e3822202 	orr	r2, r2, #536870912	; 0x20000000
    8678:	e5832010 	str	r2, [r3, #16]
    867c:	ebfffe80 	bl	8084 <_enable_interrupts>
    8680:	ebffffc1 	bl	858c <shell_main>
    8684:	eafffffe 	b	8684 <kernel_main+0x38>

00008688 <fifo_init>:
    8688:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    868c:	e28db000 	add	fp, sp, #0
    8690:	e24dd00c 	sub	sp, sp, #12
    8694:	e50b0008 	str	r0, [fp, #-8]
    8698:	e51b3008 	ldr	r3, [fp, #-8]
    869c:	e3a02000 	mov	r2, #0
    86a0:	e583200c 	str	r2, [r3, #12]
    86a4:	e51b3008 	ldr	r3, [fp, #-8]
    86a8:	e3a02000 	mov	r2, #0
    86ac:	e5832010 	str	r2, [r3, #16]
    86b0:	e51b3008 	ldr	r3, [fp, #-8]
    86b4:	e3a0200a 	mov	r2, #10
    86b8:	e5832014 	str	r2, [r3, #20]
    86bc:	e320f000 	nop	{0}
    86c0:	e28bd000 	add	sp, fp, #0
    86c4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    86c8:	e12fff1e 	bx	lr

000086cc <fifo_read>:
    86cc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    86d0:	e28db000 	add	fp, sp, #0
    86d4:	e24dd01c 	sub	sp, sp, #28
    86d8:	e50b0010 	str	r0, [fp, #-16]
    86dc:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    86e0:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    86e4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    86e8:	e50b300c 	str	r3, [fp, #-12]
    86ec:	e3a03000 	mov	r3, #0
    86f0:	e50b3008 	str	r3, [fp, #-8]
    86f4:	ea000024 	b	878c <fifo_read+0xc0>
    86f8:	e51b3010 	ldr	r3, [fp, #-16]
    86fc:	e5932010 	ldr	r2, [r3, #16]
    8700:	e51b3010 	ldr	r3, [fp, #-16]
    8704:	e593300c 	ldr	r3, [r3, #12]
    8708:	e1520003 	cmp	r2, r3
    870c:	0a000019 	beq	8778 <fifo_read+0xac>
    8710:	e51b300c 	ldr	r3, [fp, #-12]
    8714:	e2832001 	add	r2, r3, #1
    8718:	e50b200c 	str	r2, [fp, #-12]
    871c:	e51b2010 	ldr	r2, [fp, #-16]
    8720:	e5922010 	ldr	r2, [r2, #16]
    8724:	e51b1010 	ldr	r1, [fp, #-16]
    8728:	e7d12002 	ldrb	r2, [r1, r2]
    872c:	e5c32000 	strb	r2, [r3]
    8730:	e51b3010 	ldr	r3, [fp, #-16]
    8734:	e5933010 	ldr	r3, [r3, #16]
    8738:	e2832001 	add	r2, r3, #1
    873c:	e51b3010 	ldr	r3, [fp, #-16]
    8740:	e5832010 	str	r2, [r3, #16]
    8744:	e51b3010 	ldr	r3, [fp, #-16]
    8748:	e5932010 	ldr	r2, [r3, #16]
    874c:	e51b3010 	ldr	r3, [fp, #-16]
    8750:	e5933014 	ldr	r3, [r3, #20]
    8754:	e1520003 	cmp	r2, r3
    8758:	1a000002 	bne	8768 <fifo_read+0x9c>
    875c:	e51b3010 	ldr	r3, [fp, #-16]
    8760:	e3a02000 	mov	r2, #0
    8764:	e5832010 	str	r2, [r3, #16]
    8768:	e51b3008 	ldr	r3, [fp, #-8]
    876c:	e2833001 	add	r3, r3, #1
    8770:	e50b3008 	str	r3, [fp, #-8]
    8774:	ea000001 	b	8780 <fifo_read+0xb4>
    8778:	e51b3008 	ldr	r3, [fp, #-8]
    877c:	ea000007 	b	87a0 <fifo_read+0xd4>
    8780:	e51b3008 	ldr	r3, [fp, #-8]
    8784:	e2833001 	add	r3, r3, #1
    8788:	e50b3008 	str	r3, [fp, #-8]
    878c:	e51b2008 	ldr	r2, [fp, #-8]
    8790:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8794:	e1520003 	cmp	r2, r3
    8798:	baffffd6 	blt	86f8 <fifo_read+0x2c>
    879c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    87a0:	e1a00003 	mov	r0, r3
    87a4:	e28bd000 	add	sp, fp, #0
    87a8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    87ac:	e12fff1e 	bx	lr

000087b0 <fifo_write>:
    87b0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    87b4:	e28db000 	add	fp, sp, #0
    87b8:	e24dd01c 	sub	sp, sp, #28
    87bc:	e50b0010 	str	r0, [fp, #-16]
    87c0:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    87c4:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    87c8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    87cc:	e50b300c 	str	r3, [fp, #-12]
    87d0:	e3a03000 	mov	r3, #0
    87d4:	e50b3008 	str	r3, [fp, #-8]
    87d8:	ea00002c 	b	8890 <fifo_write+0xe0>
    87dc:	e51b3010 	ldr	r3, [fp, #-16]
    87e0:	e593300c 	ldr	r3, [r3, #12]
    87e4:	e2832001 	add	r2, r3, #1
    87e8:	e51b3010 	ldr	r3, [fp, #-16]
    87ec:	e5933010 	ldr	r3, [r3, #16]
    87f0:	e1520003 	cmp	r2, r3
    87f4:	0a00000a 	beq	8824 <fifo_write+0x74>
    87f8:	e51b3010 	ldr	r3, [fp, #-16]
    87fc:	e593300c 	ldr	r3, [r3, #12]
    8800:	e2832001 	add	r2, r3, #1
    8804:	e51b3010 	ldr	r3, [fp, #-16]
    8808:	e5933014 	ldr	r3, [r3, #20]
    880c:	e1520003 	cmp	r2, r3
    8810:	1a000005 	bne	882c <fifo_write+0x7c>
    8814:	e51b3010 	ldr	r3, [fp, #-16]
    8818:	e5933010 	ldr	r3, [r3, #16]
    881c:	e3530000 	cmp	r3, #0
    8820:	1a000001 	bne	882c <fifo_write+0x7c>
    8824:	e51b3008 	ldr	r3, [fp, #-8]
    8828:	ea00001d 	b	88a4 <fifo_write+0xf4>
    882c:	e51b3010 	ldr	r3, [fp, #-16]
    8830:	e593200c 	ldr	r2, [r3, #12]
    8834:	e51b300c 	ldr	r3, [fp, #-12]
    8838:	e2831001 	add	r1, r3, #1
    883c:	e50b100c 	str	r1, [fp, #-12]
    8840:	e5d31000 	ldrb	r1, [r3]
    8844:	e51b3010 	ldr	r3, [fp, #-16]
    8848:	e7c31002 	strb	r1, [r3, r2]
    884c:	e51b3010 	ldr	r3, [fp, #-16]
    8850:	e593300c 	ldr	r3, [r3, #12]
    8854:	e2832001 	add	r2, r3, #1
    8858:	e51b3010 	ldr	r3, [fp, #-16]
    885c:	e583200c 	str	r2, [r3, #12]
    8860:	e51b3010 	ldr	r3, [fp, #-16]
    8864:	e593200c 	ldr	r2, [r3, #12]
    8868:	e51b3010 	ldr	r3, [fp, #-16]
    886c:	e5933014 	ldr	r3, [r3, #20]
    8870:	e1520003 	cmp	r2, r3
    8874:	1a000002 	bne	8884 <fifo_write+0xd4>
    8878:	e51b3010 	ldr	r3, [fp, #-16]
    887c:	e3a02000 	mov	r2, #0
    8880:	e583200c 	str	r2, [r3, #12]
    8884:	e51b3008 	ldr	r3, [fp, #-8]
    8888:	e2833001 	add	r3, r3, #1
    888c:	e50b3008 	str	r3, [fp, #-8]
    8890:	e51b2008 	ldr	r2, [fp, #-8]
    8894:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8898:	e1520003 	cmp	r2, r3
    889c:	baffffce 	blt	87dc <fifo_write+0x2c>
    88a0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    88a4:	e1a00003 	mov	r0, r3
    88a8:	e28bd000 	add	sp, fp, #0
    88ac:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    88b0:	e12fff1e 	bx	lr

000088b4 <strcmp>:
    88b4:	e020c001 	eor	ip, r0, r1
    88b8:	e31c0003 	tst	ip, #3
    88bc:	1a000021 	bne	8948 <strcmp+0x94>
    88c0:	e210c003 	ands	ip, r0, #3
    88c4:	e3c00003 	bic	r0, r0, #3
    88c8:	e3c11003 	bic	r1, r1, #3
    88cc:	e4902004 	ldr	r2, [r0], #4
    88d0:	04913004 	ldreq	r3, [r1], #4
    88d4:	0a000006 	beq	88f4 <strcmp+0x40>
    88d8:	e22cc003 	eor	ip, ip, #3
    88dc:	e3e034ff 	mvn	r3, #-16777216	; 0xff000000
    88e0:	e1a0c18c 	lsl	ip, ip, #3
    88e4:	e1a0cc33 	lsr	ip, r3, ip
    88e8:	e4913004 	ldr	r3, [r1], #4
    88ec:	e182200c 	orr	r2, r2, ip
    88f0:	e183300c 	orr	r3, r3, ip
    88f4:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
    88f8:	e3a04001 	mov	r4, #1
    88fc:	e1844404 	orr	r4, r4, r4, lsl #8
    8900:	e1844804 	orr	r4, r4, r4, lsl #16
    8904:	e042c004 	sub	ip, r2, r4
    8908:	e1520003 	cmp	r2, r3
    890c:	01ccc002 	biceq	ip, ip, r2
    8910:	011c0384 	tsteq	ip, r4, lsl #7
    8914:	04902004 	ldreq	r2, [r0], #4
    8918:	04913004 	ldreq	r3, [r1], #4
    891c:	0afffff8 	beq	8904 <strcmp+0x50>
    8920:	e1a00c02 	lsl	r0, r2, #24
    8924:	e1a02422 	lsr	r2, r2, #8
    8928:	e3500001 	cmp	r0, #1
    892c:	21500c03 	cmpcs	r0, r3, lsl #24
    8930:	01a03423 	lsreq	r3, r3, #8
    8934:	0afffff9 	beq	8920 <strcmp+0x6c>
    8938:	e20330ff 	and	r3, r3, #255	; 0xff
    893c:	e0630c20 	rsb	r0, r3, r0, lsr #24
    8940:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
    8944:	e12fff1e 	bx	lr
    8948:	e3100003 	tst	r0, #3
    894c:	0a000006 	beq	896c <strcmp+0xb8>
    8950:	e4d02001 	ldrb	r2, [r0], #1
    8954:	e4d13001 	ldrb	r3, [r1], #1
    8958:	e3520001 	cmp	r2, #1
    895c:	21520003 	cmpcs	r2, r3
    8960:	0afffff8 	beq	8948 <strcmp+0x94>
    8964:	e0420003 	sub	r0, r2, r3
    8968:	e12fff1e 	bx	lr
    896c:	e92d0030 	push	{r4, r5}
    8970:	e3a04001 	mov	r4, #1
    8974:	e1844404 	orr	r4, r4, r4, lsl #8
    8978:	e1844804 	orr	r4, r4, r4, lsl #16
    897c:	e4902004 	ldr	r2, [r0], #4
    8980:	e2015003 	and	r5, r1, #3
    8984:	e3c11003 	bic	r1, r1, #3
    8988:	e4913004 	ldr	r3, [r1], #4
    898c:	e3550002 	cmp	r5, #2
    8990:	0a000017 	beq	89f4 <strcmp+0x140>
    8994:	8a00002d 	bhi	8a50 <strcmp+0x19c>
    8998:	e3c254ff 	bic	r5, r2, #-16777216	; 0xff000000
    899c:	e1550423 	cmp	r5, r3, lsr #8
    89a0:	e042c004 	sub	ip, r2, r4
    89a4:	e1ccc002 	bic	ip, ip, r2
    89a8:	1a000007 	bne	89cc <strcmp+0x118>
    89ac:	e01cc384 	ands	ip, ip, r4, lsl #7
    89b0:	04913004 	ldreq	r3, [r1], #4
    89b4:	1a000006 	bne	89d4 <strcmp+0x120>
    89b8:	e0255002 	eor	r5, r5, r2
    89bc:	e1550c03 	cmp	r5, r3, lsl #24
    89c0:	1a000008 	bne	89e8 <strcmp+0x134>
    89c4:	e4902004 	ldr	r2, [r0], #4
    89c8:	eafffff2 	b	8998 <strcmp+0xe4>
    89cc:	e1a03423 	lsr	r3, r3, #8
    89d0:	ea000036 	b	8ab0 <strcmp+0x1fc>
    89d4:	e3dcc4ff 	bics	ip, ip, #-16777216	; 0xff000000
    89d8:	1a000031 	bne	8aa4 <strcmp+0x1f0>
    89dc:	e5d13000 	ldrb	r3, [r1]
    89e0:	e1a05c22 	lsr	r5, r2, #24
    89e4:	ea000031 	b	8ab0 <strcmp+0x1fc>
    89e8:	e1a05c22 	lsr	r5, r2, #24
    89ec:	e20330ff 	and	r3, r3, #255	; 0xff
    89f0:	ea00002e 	b	8ab0 <strcmp+0x1fc>
    89f4:	e1a05802 	lsl	r5, r2, #16
    89f8:	e042c004 	sub	ip, r2, r4
    89fc:	e1a05825 	lsr	r5, r5, #16
    8a00:	e1ccc002 	bic	ip, ip, r2
    8a04:	e1550823 	cmp	r5, r3, lsr #16
    8a08:	1a00000e 	bne	8a48 <strcmp+0x194>
    8a0c:	e01cc384 	ands	ip, ip, r4, lsl #7
    8a10:	04913004 	ldreq	r3, [r1], #4
    8a14:	1a000004 	bne	8a2c <strcmp+0x178>
    8a18:	e0255002 	eor	r5, r5, r2
    8a1c:	e1550803 	cmp	r5, r3, lsl #16
    8a20:	1a000006 	bne	8a40 <strcmp+0x18c>
    8a24:	e4902004 	ldr	r2, [r0], #4
    8a28:	eafffff1 	b	89f4 <strcmp+0x140>
    8a2c:	e1b0c80c 	lsls	ip, ip, #16
    8a30:	1a00001b 	bne	8aa4 <strcmp+0x1f0>
    8a34:	e1d130b0 	ldrh	r3, [r1]
    8a38:	e1a05822 	lsr	r5, r2, #16
    8a3c:	ea00001b 	b	8ab0 <strcmp+0x1fc>
    8a40:	e1a03803 	lsl	r3, r3, #16
    8a44:	e1a05822 	lsr	r5, r2, #16
    8a48:	e1a03823 	lsr	r3, r3, #16
    8a4c:	ea000017 	b	8ab0 <strcmp+0x1fc>
    8a50:	e20250ff 	and	r5, r2, #255	; 0xff
    8a54:	e1550c23 	cmp	r5, r3, lsr #24
    8a58:	e042c004 	sub	ip, r2, r4
    8a5c:	e1ccc002 	bic	ip, ip, r2
    8a60:	1a000007 	bne	8a84 <strcmp+0x1d0>
    8a64:	e01cc384 	ands	ip, ip, r4, lsl #7
    8a68:	04913004 	ldreq	r3, [r1], #4
    8a6c:	1a000006 	bne	8a8c <strcmp+0x1d8>
    8a70:	e0255002 	eor	r5, r5, r2
    8a74:	e1550403 	cmp	r5, r3, lsl #8
    8a78:	1a000006 	bne	8a98 <strcmp+0x1e4>
    8a7c:	e4902004 	ldr	r2, [r0], #4
    8a80:	eafffff2 	b	8a50 <strcmp+0x19c>
    8a84:	e1a03c23 	lsr	r3, r3, #24
    8a88:	ea000008 	b	8ab0 <strcmp+0x1fc>
    8a8c:	e31200ff 	tst	r2, #255	; 0xff
    8a90:	0a000003 	beq	8aa4 <strcmp+0x1f0>
    8a94:	e4913004 	ldr	r3, [r1], #4
    8a98:	e1a05422 	lsr	r5, r2, #8
    8a9c:	e3c334ff 	bic	r3, r3, #-16777216	; 0xff000000
    8aa0:	ea000002 	b	8ab0 <strcmp+0x1fc>
    8aa4:	e3a00000 	mov	r0, #0
    8aa8:	e8bd0030 	pop	{r4, r5}
    8aac:	e12fff1e 	bx	lr
    8ab0:	e20520ff 	and	r2, r5, #255	; 0xff
    8ab4:	e20300ff 	and	r0, r3, #255	; 0xff
    8ab8:	e3500001 	cmp	r0, #1
    8abc:	21500002 	cmpcs	r0, r2
    8ac0:	01a05425 	lsreq	r5, r5, #8
    8ac4:	01a03423 	lsreq	r3, r3, #8
    8ac8:	0afffff8 	beq	8ab0 <strcmp+0x1fc>
    8acc:	e0420000 	sub	r0, r2, r0
    8ad0:	e8bd0030 	pop	{r4, r5}
    8ad4:	e12fff1e 	bx	lr

Disassembly of section .data:

00008ad8 <__data_start>:
    8ad8:	20200000 	eorcs	r0, r0, r0

00008adc <rpiIRQController>:
    8adc:	2000b200 	andcs	fp, r0, r0, lsl #4

00008ae0 <rpiAux>:
    8ae0:	20215000 	eorcs	r5, r1, r0

00008ae4 <rpiMiniUart>:
    8ae4:	20215040 	eorcs	r5, r1, r0, asr #32

00008ae8 <test_cmd>:
    8ae8:	74736554 	ldrbtvc	r6, [r3], #-1364	; 0xfffffaac
    8aec:	00000000 	andeq	r0, r0, r0

00008af0 <test_success>:
    8af0:	63637553 	cmnvs	r3, #348127232	; 0x14c00000
    8af4:	00737365 	rsbseq	r7, r3, r5, ror #6

00008af8 <test_fail>:
    8af8:	6c696146 	stfvse	f6, [r9], #-280	; 0xfffffee8
    8afc:	Address 0x0000000000008afc is out of bounds.


Disassembly of section .bss:

00008b00 <fifo_buffer>:
	...

00008b18 <ra>:
    8b18:	00000000 	andeq	r0, r0, r0

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
  44:	038b0002 	orreq	r0, fp, #2
  48:	00040000 	andeq	r0, r4, r0
  4c:	00000000 	andeq	r0, r0, r0
  50:	0000813c 	andeq	r8, r0, ip, lsr r1
  54:	000000b0 	strheq	r0, [r0], -r0	; <UNPREDICTABLE>
	...
  60:	0000001c 	andeq	r0, r0, ip, lsl r0
  64:	053d0002 	ldreq	r0, [sp, #-2]!
  68:	00040000 	andeq	r0, r4, r0
  6c:	00000000 	andeq	r0, r0, r0
  70:	000081ec 	andeq	r8, r0, ip, ror #3
  74:	000003a0 	andeq	r0, r0, r0, lsr #7
	...
  80:	0000001c 	andeq	r0, r0, ip, lsl r0
  84:	0aaa0002 	beq	fea80094 <_heap+0xfea00090>
  88:	00040000 	andeq	r0, r4, r0
  8c:	00000000 	andeq	r0, r0, r0
  90:	0000858c 	andeq	r8, r0, ip, lsl #11
  94:	000000c0 	andeq	r0, r0, r0, asr #1
	...
  a0:	0000001c 	andeq	r0, r0, ip, lsl r0
  a4:	13cd0002 	bicne	r0, sp, #2
  a8:	00040000 	andeq	r0, r4, r0
  ac:	00000000 	andeq	r0, r0, r0
  b0:	0000864c 	andeq	r8, r0, ip, asr #12
  b4:	0000003c 	andeq	r0, r0, ip, lsr r0
	...
  c0:	0000001c 	andeq	r0, r0, ip, lsl r0
  c4:	147d0002 	ldrbtne	r0, [sp], #-2
  c8:	00040000 	andeq	r0, r4, r0
  cc:	00000000 	andeq	r0, r0, r0
  d0:	00008688 	andeq	r8, r0, r8, lsl #13
  d4:	0000022c 	andeq	r0, r0, ip, lsr #4
	...
  e0:	0000001c 	andeq	r0, r0, ip, lsl r0
  e4:	163d0002 	ldrtne	r0, [sp], -r2
  e8:	00040000 	andeq	r0, r4, r0
  ec:	00000000 	andeq	r0, r0, r0
  f0:	00008000 	andeq	r8, r0, r0
  f4:	00000094 	muleq	r0, r4, r0
	...
 100:	0000001c 	andeq	r0, r0, ip, lsl r0
 104:	16ad0002 	strtne	r0, [sp], r2
 108:	00040000 	andeq	r0, r4, r0
 10c:	00000000 	andeq	r0, r0, r0
 110:	000088b4 			; <UNDEFINED> instruction: 0x000088b4
 114:	00000224 	andeq	r0, r0, r4, lsr #4
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
      d4:	fb050202 	blx	1408e6 <_heap+0xc08e2>
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
     188:	4a050000 	bmi	140190 <_heap+0xc018c>
     18c:	00000087 	andeq	r0, r0, r7, lsl #1
     190:	00ec0810 	rsceq	r0, ip, r0, lsl r8
     194:	4b050000 	blmi	14019c <_heap+0xc0198>
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
     248:	5a050000 	bpl	140250 <_heap+0xc024c>
     24c:	0000009d 	muleq	r0, sp, r0
     250:	01670850 	cmneq	r7, r0, asr r8
     254:	5b050000 	blpl	14025c <_heap+0xc0258>
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
     308:	6a050000 	bvs	140310 <_heap+0xc030c>
     30c:	00000092 	muleq	r0, r2, r0
     310:	01a80890 			; <UNDEFINED> instruction: 0x01a80890
     314:	6b050000 	blvs	14031c <_heap+0xc0318>
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
     358:	8ad80305 	bhi	ff600f74 <_heap+0xff580f70>
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
     388:	ae009c01 	cdpge	12, 0, cr9, cr0, cr1, {0}
     38c:	04000001 	streq	r0, [r0], #-1
     390:	00013200 	andeq	r3, r1, r0, lsl #4
     394:	44010400 	strmi	r0, [r1], #-1024	; 0xfffffc00
     398:	0c000000 	stceq	0, cr0, [r0], {-0}
     39c:	000002e6 	andeq	r0, r0, r6, ror #5
     3a0:	0000813c 	andeq	r8, r0, ip, lsr r1
     3a4:	000000b0 	strheq	r0, [r0], -r0	; <UNPREDICTABLE>
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
     414:	045e0700 	ldrbeq	r0, [lr], #-1792	; 0xfffff900
     418:	26040000 	strcs	r0, [r4], -r0
     41c:	0000007d 	andeq	r0, r0, sp, ror r0
     420:	04500700 	ldrbeq	r0, [r0], #-1792	; 0xfffff900
     424:	27040000 	strcs	r0, [r4, -r0]
     428:	0000007d 	andeq	r0, r0, sp, ror r0
     42c:	03e50704 	mvneq	r0, #4, 14	; 0x100000
     430:	28040000 	stmdacs	r4, {}	; <UNPREDICTABLE>
     434:	0000007d 	andeq	r0, r0, sp, ror r0
     438:	033f0708 	teqeq	pc, #8, 14	; 0x200000
     43c:	29040000 	stmdbcs	r4, {}	; <UNPREDICTABLE>
     440:	0000007d 	andeq	r0, r0, sp, ror r0
     444:	03a9070c 			; <UNDEFINED> instruction: 0x03a9070c
     448:	2a040000 	bcs	100450 <_heap+0x8044c>
     44c:	0000007d 	andeq	r0, r0, sp, ror r0
     450:	03b70710 			; <UNDEFINED> instruction: 0x03b70710
     454:	2b040000 	blcs	10045c <_heap+0x80458>
     458:	0000007d 	andeq	r0, r0, sp, ror r0
     45c:	04020714 	streq	r0, [r2], #-1812	; 0xfffff8ec
     460:	2c040000 	stccs	0, cr0, [r4], {-0}
     464:	0000007d 	andeq	r0, r0, sp, ror r0
     468:	03f30718 	mvnseq	r0, #24, 14	; 0x600000
     46c:	2d040000 	stccs	0, cr0, [r4, #-0]
     470:	0000007d 	andeq	r0, r0, sp, ror r0
     474:	0330071c 	teqeq	r0, #28, 14	; 0x700000
     478:	2e040000 	cdpcs	0, 0, cr0, cr4, cr0, {0}
     47c:	0000007d 	andeq	r0, r0, sp, ror r0
     480:	03c50720 	biceq	r0, r5, #32, 14	; 0x800000
     484:	2f040000 	svccs	0x00040000
     488:	0000007d 	andeq	r0, r0, sp, ror r0
     48c:	14030024 	strne	r0, [r3], #-36	; 0xffffffdc
     490:	04000004 	streq	r0, [r0], #-4
     494:	00008230 	andeq	r8, r0, r0, lsr r2
     498:	034b0800 	movteq	r0, #47104	; 0xb800
     49c:	15010000 	strne	r0, [r1, #-0]
     4a0:	0000011f 	andeq	r0, r0, pc, lsl r1
     4a4:	8adc0305 	bhi	ff7010c0 <_heap+0xff6810bc>
     4a8:	04090000 	streq	r0, [r9], #-0
     4ac:	00000103 	andeq	r0, r0, r3, lsl #2
     4b0:	0003930a 	andeq	r9, r3, sl, lsl #6
     4b4:	dc890100 	stfles	f0, [r9], {0}
     4b8:	10000081 	andne	r0, r0, r1, lsl #1
     4bc:	01000000 	mrseq	r0, (UNDEF: 0)
     4c0:	03650b9c 	cmneq	r5, #156, 22	; 0x27000
     4c4:	6b010000 	blvs	404cc <__bss_end__+0x379b0>
     4c8:	000081c0 	andeq	r8, r0, r0, asr #3
     4cc:	0000001c 	andeq	r0, r0, ip, lsl r0
     4d0:	3e0a9c01 	cdpcc	12, 0, cr9, cr10, cr1, {0}
     4d4:	01000004 	tsteq	r0, r4
     4d8:	0081a85e 	addeq	sl, r1, lr, asr r8
     4dc:	00001800 	andeq	r1, r0, r0, lsl #16
     4e0:	0a9c0100 	beq	fe7008e8 <_heap+0xfe6808e4>
     4e4:	0000031a 	andeq	r0, r0, sl, lsl r3
     4e8:	81905201 	orrshi	r5, r0, r1, lsl #4
     4ec:	00180000 	andseq	r0, r8, r0
     4f0:	9c010000 	stcls	0, cr0, [r1], {-0}
     4f4:	00035c0a 	andeq	r5, r3, sl, lsl #24
     4f8:	84430100 	strbhi	r0, [r3], #-256	; 0xffffff00
     4fc:	0c000081 	stceq	0, cr0, [r0], {129}	; 0x81
     500:	01000000 	mrseq	r0, (UNDEF: 0)
     504:	03760a9c 	cmneq	r6, #156, 20	; 0x9c000
     508:	34010000 	strcc	r0, [r1], #-0
     50c:	00008178 	andeq	r8, r0, r8, ror r1
     510:	0000000c 	andeq	r0, r0, ip
     514:	d80a9c01 	stmdale	sl, {r0, sl, fp, ip, pc}
     518:	01000003 	tsteq	r0, r3
     51c:	00816029 	addeq	r6, r1, r9, lsr #32
     520:	00001800 	andeq	r1, r0, r0, lsl #16
     524:	0c9c0100 	ldfeqs	f0, [ip], {0}
     528:	00000429 	andeq	r0, r0, r9, lsr #8
     52c:	011f1c01 	tsteq	pc, r1, lsl #24
     530:	813c0000 	teqhi	ip, r0
     534:	00240000 	eoreq	r0, r4, r0
     538:	9c010000 	stcls	0, cr0, [r1], {-0}
     53c:	00056900 	andeq	r6, r5, r0, lsl #18
     540:	ea000400 	b	1548 <CPSR_IRQ_INHIBIT+0x14c8>
     544:	04000001 	streq	r0, [r0], #-1
     548:	00004401 	andeq	r4, r0, r1, lsl #8
     54c:	04970c00 	ldreq	r0, [r7], #3072	; 0xc00
     550:	81ec0000 	mvnhi	r0, r0
     554:	03a00000 	moveq	r0, #0
     558:	02890000 	addeq	r0, r9, #0
     55c:	01020000 	mrseq	r0, (UNDEF: 2)
     560:	0001cc06 	andeq	ip, r1, r6, lsl #24
     564:	08010200 	stmdaeq	r1, {r9}
     568:	000001ca 	andeq	r0, r0, sl, asr #3
     56c:	fb050202 	blx	140d7e <_heap+0xc0d7a>
     570:	02000000 	andeq	r0, r0, #0
     574:	02370702 	eorseq	r0, r7, #524288	; 0x80000
     578:	04020000 	streq	r0, [r2], #-0
     57c:	00019f05 	andeq	r9, r1, r5, lsl #30
     580:	01260300 			; <UNDEFINED> instruction: 0x01260300
     584:	41020000 	mrsmi	r0, (UNDEF: 2)
     588:	0000004f 	andeq	r0, r0, pc, asr #32
     58c:	dd070402 	cfstrsle	mvf0, [r7, #-8]
     590:	02000001 	andeq	r0, r0, #1
     594:	019a0508 	orrseq	r0, sl, r8, lsl #10
     598:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
     59c:	0001d807 	andeq	sp, r1, r7, lsl #16
     5a0:	05040400 	streq	r0, [r4, #-1024]	; 0xfffffc00
     5a4:	00746e69 	rsbseq	r6, r4, r9, ror #28
     5a8:	e2070402 	and	r0, r7, #33554432	; 0x2000000
     5ac:	05000001 	streq	r0, [r0, #-1]
     5b0:	0000006b 	andeq	r0, r0, fp, rrx
     5b4:	00012803 	andeq	r2, r1, r3, lsl #16
     5b8:	44300300 	ldrtmi	r0, [r0], #-768	; 0xfffffd00
     5bc:	05000000 	streq	r0, [r0, #-0]
     5c0:	00000077 	andeq	r0, r0, r7, ror r0
     5c4:	00008206 	andeq	r8, r0, r6, lsl #4
     5c8:	02510300 	subseq	r0, r1, #0, 6
     5cc:	12040000 	andne	r0, r4, #0
     5d0:	00000082 	andeq	r0, r0, r2, lsl #1
     5d4:	0001f603 	andeq	pc, r1, r3, lsl #12
     5d8:	87130400 	ldrhi	r0, [r3, -r0, lsl #8]
     5dc:	03000000 	movweq	r0, #0
     5e0:	000002c0 	andeq	r0, r0, r0, asr #5
     5e4:	00821404 	addeq	r1, r2, r4, lsl #8
     5e8:	2c070000 	stccs	0, cr0, [r7], {-0}
     5ec:	013a0a05 	teqeq	sl, r5, lsl #20
     5f0:	60080000 	andvs	r0, r8, r0
     5f4:	05000005 	streq	r0, [r0, #-5]
     5f8:	00008c0b 	andeq	r8, r0, fp, lsl #24
     5fc:	4a080000 	bmi	200604 <_heap+0x180600>
     600:	05000006 	streq	r0, [r0, #-6]
     604:	00008c0c 	andeq	r8, r0, ip, lsl #24
     608:	2d080400 	cfstrscs	mvf0, [r8, #-0]
     60c:	05000006 	streq	r0, [r0, #-6]
     610:	00008c0d 	andeq	r8, r0, sp, lsl #24
     614:	6e080800 	cdpvs	8, 0, cr0, cr8, cr0, {0}
     618:	05000005 	streq	r0, [r0, #-5]
     61c:	00008c0e 	andeq	r8, r0, lr, lsl #24
     620:	c5080c00 	strgt	r0, [r8, #-3072]	; 0xfffff400
     624:	05000004 	streq	r0, [r0, #-4]
     628:	00008c0f 	andeq	r8, r0, pc, lsl #24
     62c:	70081000 	andvc	r1, r8, r0
     630:	05000004 	streq	r0, [r0, #-4]
     634:	00009710 	andeq	r9, r0, r0, lsl r7
     638:	41081400 	tstmi	r8, r0, lsl #8
     63c:	05000005 	streq	r0, [r0, #-5]
     640:	00009711 	andeq	r9, r0, r1, lsl r7
     644:	f4081800 	vst2.8	{d1-d2}, [r8], r0
     648:	05000005 	streq	r0, [r0, #-5]
     64c:	00008c12 	andeq	r8, r0, r2, lsl ip
     650:	50081c00 	andpl	r1, r8, r0, lsl #24
     654:	05000005 	streq	r0, [r0, #-5]
     658:	00008c13 	andeq	r8, r0, r3, lsl ip
     65c:	bb082000 	bllt	208664 <_heap+0x188660>
     660:	05000005 	streq	r0, [r0, #-5]
     664:	00009714 	andeq	r9, r0, r4, lsl r7
     668:	1e082400 	cfcpysne	mvf2, mvf8
     66c:	05000005 	streq	r0, [r0, #-5]
     670:	00008c15 	andeq	r8, r0, r5, lsl ip
     674:	03002800 	movweq	r2, #2048	; 0x800
     678:	000005d5 	ldrdeq	r0, [r0], -r5
     67c:	00ad1605 	adceq	r1, sp, r5, lsl #12
     680:	08070000 	stmdaeq	r7, {}	; <UNPREDICTABLE>
     684:	01661805 	cmneq	r6, r5, lsl #16
     688:	14080000 	strne	r0, [r8], #-0
     68c:	05000006 	streq	r0, [r0, #-6]
     690:	00009719 	andeq	r9, r0, r9, lsl r7
     694:	7f080000 	svcvc	0x00080000
     698:	05000004 	streq	r0, [r0, #-4]
     69c:	00008c1a 	andeq	r8, r0, sl, lsl ip
     6a0:	03000400 	movweq	r0, #1024	; 0x400
     6a4:	000005cb 	andeq	r0, r0, fp, asr #11
     6a8:	01451b05 	cmpeq	r5, r5, lsl #22
     6ac:	a4070000 	strge	r0, [r7], #-0
     6b0:	03664506 	cmneq	r6, #25165824	; 0x1800000
     6b4:	c4080000 	strgt	r0, [r8], #-0
     6b8:	06000000 	streq	r0, [r0], -r0
     6bc:	00008c46 	andeq	r8, r0, r6, asr #24
     6c0:	cc080000 	stcgt	0, cr0, [r8], {-0}
     6c4:	06000000 	streq	r0, [r0], -r0
     6c8:	00008c47 	andeq	r8, r0, r7, asr #24
     6cc:	d4080400 	strle	r0, [r8], #-1024	; 0xfffffc00
     6d0:	06000000 	streq	r0, [r0], -r0
     6d4:	00008c48 	andeq	r8, r0, r8, asr #24
     6d8:	dc080800 	stcle	8, cr0, [r8], {-0}
     6dc:	06000000 	streq	r0, [r0], -r0
     6e0:	00008c49 	andeq	r8, r0, r9, asr #24
     6e4:	e4080c00 	str	r0, [r8], #-3072	; 0xfffff400
     6e8:	06000000 	streq	r0, [r0], -r0
     6ec:	00008c4a 	andeq	r8, r0, sl, asr #24
     6f0:	ec081000 	stc	0, cr1, [r8], {-0}
     6f4:	06000000 	streq	r0, [r0], -r0
     6f8:	00008c4b 	andeq	r8, r0, fp, asr #24
     6fc:	3f081400 	svccc	0x00081400
     700:	06000001 	streq	r0, [r0], -r1
     704:	0000974c 	andeq	r9, r0, ip, asr #14
     708:	b6081800 	strlt	r1, [r8], -r0, lsl #16
     70c:	06000000 	streq	r0, [r0], -r0
     710:	0000a24d 	andeq	sl, r0, sp, asr #4
     714:	bd081c00 	stclt	12, cr1, [r8, #-0]
     718:	06000000 	streq	r0, [r0], -r0
     71c:	0000a24e 	andeq	sl, r0, lr, asr #4
     720:	49082000 	stmdbmi	r8, {sp}
     724:	06000001 	streq	r0, [r0], -r1
     728:	0000974f 	andeq	r9, r0, pc, asr #14
     72c:	df082400 	svcle	0x00082400
     730:	06000002 	streq	r0, [r0], -r2
     734:	0000a250 	andeq	sl, r0, r0, asr r2
     738:	ef082800 	svc	0x00082800
     73c:	06000001 	streq	r0, [r0], -r1
     740:	0000a251 	andeq	sl, r0, r1, asr r2
     744:	53082c00 	movwpl	r2, #35840	; 0x8c00
     748:	06000001 	streq	r0, [r0], -r1
     74c:	00009752 	andeq	r9, r0, r2, asr r7
     750:	8c083000 	stchi	0, cr3, [r8], {-0}
     754:	06000002 	streq	r0, [r0], -r2
     758:	0000a253 	andeq	sl, r0, r3, asr r2
     75c:	93083400 	movwls	r3, #33792	; 0x8400
     760:	06000002 	streq	r0, [r0], -r2
     764:	0000a254 	andeq	sl, r0, r4, asr r2
     768:	5d083800 	stcpl	8, cr3, [r8, #-0]
     76c:	06000001 	streq	r0, [r0], -r1
     770:	00009755 	andeq	r9, r0, r5, asr r7
     774:	71083c00 	tstvc	r8, r0, lsl #24
     778:	06000001 	streq	r0, [r0], -r1
     77c:	0000a256 	andeq	sl, r0, r6, asr r2
     780:	78084000 	stmdavc	r8, {lr}
     784:	06000001 	streq	r0, [r0], -r1
     788:	0000a257 	andeq	sl, r0, r7, asr r2
     78c:	9a084400 	bls	211794 <_heap+0x191790>
     790:	06000002 	streq	r0, [r0], -r2
     794:	00009758 	andeq	r9, r0, r8, asr r7
     798:	31084800 	tstcc	r8, r0, lsl #16
     79c:	06000001 	streq	r0, [r0], -r1
     7a0:	0000a259 	andeq	sl, r0, r9, asr r2
     7a4:	38084c00 	stmdacc	r8, {sl, fp, lr}
     7a8:	06000001 	streq	r0, [r0], -r1
     7ac:	0000a25a 	andeq	sl, r0, sl, asr r2
     7b0:	67085000 	strvs	r5, [r8, -r0]
     7b4:	06000001 	streq	r0, [r0], -r1
     7b8:	0000975b 	andeq	r9, r0, fp, asr r7
     7bc:	cd085400 	cfstrsgt	mvf5, [r8, #-0]
     7c0:	06000002 	streq	r0, [r0], -r2
     7c4:	0000a25c 	andeq	sl, r0, ip, asr r2
     7c8:	f4085800 	vst2.8	{d5-d6}, [r8], r0
     7cc:	06000000 	streq	r0, [r0], -r0
     7d0:	0000a25d 	andeq	sl, r0, sp, asr r2
     7d4:	a4085c00 	strge	r5, [r8], #-3072	; 0xfffff400
     7d8:	06000002 	streq	r0, [r0], -r2
     7dc:	0000975e 	andeq	r9, r0, lr, asr r7
     7e0:	0b086000 	bleq	2187e8 <_heap+0x1987e4>
     7e4:	06000002 	streq	r0, [r0], -r2
     7e8:	0000a25f 	andeq	sl, r0, pc, asr r2
     7ec:	12086400 	andne	r6, r8, #0, 8
     7f0:	06000002 	streq	r0, [r0], -r2
     7f4:	0000a260 	andeq	sl, r0, r0, ror #4
     7f8:	ae086800 	cdpge	8, 0, cr6, cr8, cr0, {0}
     7fc:	06000002 	streq	r0, [r0], -r2
     800:	00009761 	andeq	r9, r0, r1, ror #14
     804:	93086c00 	movwls	r6, #35840	; 0x8c00
     808:	06000001 	streq	r0, [r0], -r1
     80c:	0000a262 	andeq	sl, r0, r2, ror #4
     810:	4a087000 	bmi	21c818 <_heap+0x19c814>
     814:	06000002 	streq	r0, [r0], -r2
     818:	0000a263 	andeq	sl, r0, r3, ror #4
     81c:	7f087400 	svcvc	0x00087400
     820:	06000001 	streq	r0, [r0], -r1
     824:	00009764 	andeq	r9, r0, r4, ror #14
     828:	2f087800 	svccs	0x00087800
     82c:	06000002 	streq	r0, [r0], -r2
     830:	0000a265 	andeq	sl, r0, r5, ror #4
     834:	03087c00 	movweq	r7, #35840	; 0x8c00
     838:	06000002 	streq	r0, [r0], -r2
     83c:	0000a266 	andeq	sl, r0, r6, ror #4
     840:	89088000 	stmdbhi	r8, {pc}
     844:	06000001 	streq	r0, [r0], -r1
     848:	00009767 	andeq	r9, r0, r7, ror #14
     84c:	ba088400 	blt	221854 <_heap+0x1a1850>
     850:	06000001 	streq	r0, [r0], -r1
     854:	0000a268 	andeq	sl, r0, r8, ror #4
     858:	c2088800 	andgt	r8, r8, #0, 16
     85c:	06000001 	streq	r0, [r0], -r1
     860:	0000a269 	andeq	sl, r0, r9, ror #4
     864:	19088c00 	stmdbne	r8, {sl, fp, pc}
     868:	06000002 	streq	r0, [r0], -r2
     86c:	0000976a 	andeq	r9, r0, sl, ror #14
     870:	a8089000 	stmdage	r8, {ip, pc}
     874:	06000001 	streq	r0, [r0], -r1
     878:	0000a26b 	andeq	sl, r0, fp, ror #4
     87c:	05089400 	streq	r9, [r8, #-1024]	; 0xfffffc00
     880:	06000001 	streq	r0, [r0], -r1
     884:	0000a26c 	andeq	sl, r0, ip, ror #4
     888:	0f089800 	svceq	0x00089800
     88c:	06000001 	streq	r0, [r0], -r1
     890:	0000a26d 	andeq	sl, r0, sp, ror #4
     894:	24089c00 	strcs	r9, [r8], #-3072	; 0xfffff400
     898:	06000002 	streq	r0, [r0], -r2
     89c:	0000976e 	andeq	r9, r0, lr, ror #14
     8a0:	0300a000 	movweq	sl, #0
     8a4:	000002d4 	ldrdeq	r0, [r0], -r4
     8a8:	01716f06 	cmneq	r1, r6, lsl #30
     8ac:	18070000 	stmdane	r7, {}	; <UNPREDICTABLE>
     8b0:	03aa0207 			; <UNDEFINED> instruction: 0x03aa0207
     8b4:	97080000 	strls	r0, [r8, -r0]
     8b8:	07000005 	streq	r0, [r0, -r5]
     8bc:	0003aa04 	andeq	sl, r3, r4, lsl #20
     8c0:	e0080000 	and	r0, r8, r0
     8c4:	07000004 	streq	r0, [r0, -r4]
     8c8:	00006405 	andeq	r6, r0, r5, lsl #8
     8cc:	35080c00 	strcc	r0, [r8, #-3072]	; 0xfffff400
     8d0:	07000005 	streq	r0, [r0, -r5]
     8d4:	00006406 	andeq	r6, r0, r6, lsl #8
     8d8:	6f081000 	svcvs	0x00081000
     8dc:	07000006 	streq	r0, [r0, -r6]
     8e0:	00006407 	andeq	r6, r0, r7, lsl #8
     8e4:	09001400 	stmdbeq	r0, {sl, ip}
     8e8:	000003c1 	andeq	r0, r0, r1, asr #7
     8ec:	000003ba 			; <UNDEFINED> instruction: 0x000003ba
     8f0:	0003ba0a 	andeq	fp, r3, sl, lsl #20
     8f4:	02000900 	andeq	r0, r0, #0, 18
     8f8:	05eb0704 	strbeq	r0, [fp, #1796]!	; 0x704
     8fc:	01020000 	mrseq	r0, (UNDEF: 2)
     900:	0001d308 	andeq	sp, r1, r8, lsl #6
     904:	05170300 	ldreq	r0, [r7, #-768]	; 0xfffffd00
     908:	08070000 	stmdaeq	r7, {}	; <UNPREDICTABLE>
     90c:	00000371 	andeq	r0, r0, r1, ror r3
     910:	00058b0b 	andeq	r8, r5, fp, lsl #22
     914:	e4100100 	ldr	r0, [r0], #-256	; 0xffffff00
     918:	05000003 	streq	r0, [r0, #-3]
     91c:	008ae003 	addeq	lr, sl, r3
     920:	66040c00 	strvs	r0, [r4], -r0, lsl #24
     924:	0b000001 	bleq	930 <CPSR_IRQ_INHIBIT+0x8b0>
     928:	0000048b 	andeq	r0, r0, fp, lsl #9
     92c:	03fb1101 	mvnseq	r1, #1073741824	; 0x40000000
     930:	03050000 	movweq	r0, #20480	; 0x5000
     934:	00008ae4 	andeq	r8, r0, r4, ror #21
     938:	013a040c 	teqeq	sl, ip, lsl #8
     93c:	920b0000 	andls	r0, fp, #0
     940:	01000005 	tsteq	r0, r5
     944:	0003c812 	andeq	ip, r3, r2, lsl r8
     948:	00030500 	andeq	r0, r3, r0, lsl #10
     94c:	0d00008b 	stceq	0, cr0, [r0, #-556]	; 0xfffffdd4
     950:	01006172 	tsteq	r0, r2, ror r1
     954:	00007214 	andeq	r7, r0, r4, lsl r2
     958:	18030500 	stmdane	r3, {r8, sl}
     95c:	0e00008b 	cdpeq	0, 0, cr0, cr0, cr11, {4}
     960:	00000603 	andeq	r0, r0, r3, lsl #12
     964:	84cc7201 	strbhi	r7, [ip], #513	; 0x201
     968:	00c00000 	sbceq	r0, r0, r0
     96c:	9c010000 	stcls	0, cr0, [r1], {-0}
     970:	00000462 	andeq	r0, r0, r2, ror #8
     974:	0004d40b 	andeq	sp, r4, fp, lsl #8
     978:	fb740100 	blx	1d00d82 <_heap+0x1c80d7e>
     97c:	02000003 	andeq	r0, r0, #3
     980:	e50b7491 	str	r7, [fp, #-1169]	; 0xfffffb6f
     984:	01000004 	tsteq	r0, r4
     988:	00008275 	andeq	r8, r0, r5, ror r2
     98c:	70910200 	addsvc	r0, r1, r0, lsl #4
     990:	00063c0b 	andeq	r3, r6, fp, lsl #24
     994:	c1760100 	cmngt	r6, r0, lsl #2
     998:	02000003 	andeq	r0, r0, #3
     99c:	0f006f91 	svceq	0x00006f91
     9a0:	0000059e 	muleq	r0, lr, r5
     9a4:	00646d01 	rsbeq	r6, r4, r1, lsl #26
     9a8:	84940000 	ldrhi	r0, [r4], #0
     9ac:	00380000 	eorseq	r0, r8, r0
     9b0:	9c010000 	stcls	0, cr0, [r1], {-0}
     9b4:	00000498 	muleq	r0, r8, r4
     9b8:	0004ee10 	andeq	lr, r4, r0, lsl lr
     9bc:	986d0100 	stmdals	sp!, {r8}^
     9c0:	02000004 	andeq	r0, r0, #4
     9c4:	3a107491 	bcc	41dc10 <_heap+0x39dc0c>
     9c8:	01000005 	tsteq	r0, r5
     9cc:	0000646d 	andeq	r6, r0, sp, ror #8
     9d0:	70910200 	addsvc	r0, r1, r0, lsl #4
     9d4:	c1040c00 	tstgt	r4, r0, lsl #24
     9d8:	0f000003 	svceq	0x00000003
     9dc:	00000503 	andeq	r0, r0, r3, lsl #10
     9e0:	00644d01 	rsbeq	r4, r4, r1, lsl #26
     9e4:	83d40000 	bicshi	r0, r4, #0
     9e8:	00c00000 	sbceq	r0, r0, r0
     9ec:	9c010000 	stcls	0, cr0, [r1], {-0}
     9f0:	0000050a 	andeq	r0, r0, sl, lsl #10
     9f4:	00052e10 	andeq	r2, r5, r0, lsl lr
     9f8:	984d0100 	stmdals	sp, {r8}^
     9fc:	02000004 	andeq	r0, r0, #4
     a00:	3a106491 	bcc	419c4c <_heap+0x399c48>
     a04:	01000005 	tsteq	r0, r5
     a08:	0000644d 	andeq	r6, r0, sp, asr #8
     a0c:	60910200 	addsvs	r0, r1, r0, lsl #4
     a10:	0004d40b 	andeq	sp, r4, fp, lsl #8
     a14:	fb4f0100 	blx	13c0e1e <_heap+0x1340e1a>
     a18:	02000003 	andeq	r0, r0, #3
     a1c:	69116891 	ldmdbvs	r1, {r0, r4, r7, fp, sp, lr}
     a20:	64510100 	ldrbvs	r0, [r1], #-256	; 0xffffff00
     a24:	02000000 	andeq	r0, r0, #0
     a28:	7d0b7491 	cfstrsvc	mvf7, [fp, #-580]	; 0xfffffdbc
     a2c:	01000005 	tsteq	r0, r5
     a30:	00006452 	andeq	r6, r0, r2, asr r4
     a34:	70910200 	addsvc	r0, r1, r0, lsl #4
     a38:	72747011 	rsbsvc	r7, r4, #17
     a3c:	98540100 	ldmdals	r4, {r8}^
     a40:	02000004 	andeq	r0, r0, #4
     a44:	0e006c91 	mcreq	12, 0, r6, cr0, cr1, {4}
     a48:	0000061c 	andeq	r0, r0, ip, lsl r6
     a4c:	82342001 	eorshi	r2, r4, #1
     a50:	01a00000 	moveq	r0, r0
     a54:	9c010000 	stcls	0, cr0, [r1], {-0}
     a58:	0000053c 	andeq	r0, r0, ip, lsr r5
     a5c:	0004d40b 	andeq	sp, r4, fp, lsl #8
     a60:	fb220100 	blx	880e6a <_heap+0x800e66>
     a64:	02000003 	andeq	r0, r0, #3
     a68:	b30b7491 	movwlt	r7, #46225	; 0xb491
     a6c:	01000005 	tsteq	r0, r5
     a70:	00053c23 	andeq	r3, r5, r3, lsr #24
     a74:	70910200 	addsvc	r0, r1, r0, lsl #4
     a78:	66040c00 	strvs	r0, [r4], -r0, lsl #24
     a7c:	12000003 	andne	r0, r0, #3
     a80:	000004f3 	strdeq	r0, [r0], -r3
     a84:	03fb1b01 	mvnseq	r1, #1024	; 0x400
     a88:	82100000 	andshi	r0, r0, #0
     a8c:	00240000 	eoreq	r0, r4, r0
     a90:	9c010000 	stcls	0, cr0, [r1], {-0}
     a94:	0005e012 	andeq	lr, r5, r2, lsl r0
     a98:	e4160100 	ldr	r0, [r6], #-256	; 0xffffff00
     a9c:	ec000003 	stc	0, cr0, [r0], {3}
     aa0:	24000081 	strcs	r0, [r0], #-129	; 0xffffff7f
     aa4:	01000000 	mrseq	r0, (UNDEF: 0)
     aa8:	091f009c 	ldmdbeq	pc, {r2, r3, r4, r7}	; <UNPREDICTABLE>
     aac:	00040000 	andeq	r0, r4, r0
     ab0:	000002f2 	strdeq	r0, [r0], -r2
     ab4:	00440104 	subeq	r0, r4, r4, lsl #2
     ab8:	a70c0000 	strge	r0, [ip, -r0]
     abc:	8c000006 	stchi	0, cr0, [r0], {6}
     ac0:	c0000085 	andgt	r0, r0, r5, lsl #1
     ac4:	fd000000 	stc2	0, cr0, [r0, #-0]
     ac8:	02000003 	andeq	r0, r0, #3
     acc:	6e690504 	cdpvs	5, 6, cr0, cr9, cr4, {0}
     ad0:	04030074 	streq	r0, [r3], #-116	; 0xffffff8c
     ad4:	0001e207 	andeq	lr, r1, r7, lsl #4
     ad8:	05080300 	streq	r0, [r8, #-768]	; 0xfffffd00
     adc:	0000019a 	muleq	r0, sl, r1
     ae0:	6a040803 	bvs	102af4 <_heap+0x82af0>
     ae4:	03000008 	movweq	r0, #8
     ae8:	01cc0601 	biceq	r0, ip, r1, lsl #12
     aec:	01030000 	mrseq	r0, (UNDEF: 3)
     af0:	0001ca08 	andeq	ip, r1, r8, lsl #20
     af4:	05020300 	streq	r0, [r2, #-768]	; 0xfffffd00
     af8:	000000fb 	strdeq	r0, [r0], -fp
     afc:	37070203 	strcc	r0, [r7, -r3, lsl #4]
     b00:	03000002 	movweq	r0, #2
     b04:	019f0504 	orrseq	r0, pc, r4, lsl #10
     b08:	04030000 	streq	r0, [r3], #-0
     b0c:	0001dd07 	andeq	sp, r1, r7, lsl #26
     b10:	07080300 	streq	r0, [r8, -r0, lsl #6]
     b14:	000001d8 	ldrdeq	r0, [r0], -r8
     b18:	0008aa04 	andeq	sl, r8, r4, lsl #20
     b1c:	21070200 	mrscs	r0, (UNDEF: 39)
     b20:	04000000 	streq	r0, [r0], #-0
     b24:	00000899 	muleq	r0, r9, r8
     b28:	00592c03 	subseq	r2, r9, r3, lsl #24
     b2c:	6b040000 	blvs	100b34 <_heap+0x80b30>
     b30:	03000009 	movweq	r0, #9
     b34:	00005972 	andeq	r5, r0, r2, ror r9
     b38:	082b0500 	stmdaeq	fp!, {r8, sl}
     b3c:	65040000 	strvs	r0, [r4, #-0]
     b40:	00002801 	andeq	r2, r0, r1, lsl #16
     b44:	03040600 	movweq	r0, #17920	; 0x4600
     b48:	0000baa6 	andeq	fp, r0, r6, lsr #21
     b4c:	08250700 	stmdaeq	r5!, {r8, r9, sl}
     b50:	a8030000 	stmdage	r3, {}	; <UNPREDICTABLE>
     b54:	0000008f 	andeq	r0, r0, pc, lsl #1
     b58:	0007d707 	andeq	sp, r7, r7, lsl #14
     b5c:	baa90300 	blt	fea41764 <_heap+0xfe9c1760>
     b60:	00000000 	andeq	r0, r0, r0
     b64:	00004408 	andeq	r4, r0, r8, lsl #8
     b68:	0000ca00 	andeq	ip, r0, r0, lsl #20
     b6c:	00ca0900 	sbceq	r0, sl, r0, lsl #18
     b70:	00030000 	andeq	r0, r3, r0
     b74:	eb070403 	bl	1c1b88 <_heap+0x141b84>
     b78:	0a000005 	beq	b94 <CPSR_IRQ_INHIBIT+0xb14>
     b7c:	f2a30308 	vsubw.s32	q0, <illegal reg q1.5>, d8
     b80:	0b000000 	bleq	b88 <CPSR_IRQ_INHIBIT+0xb08>
     b84:	00000955 	andeq	r0, r0, r5, asr r9
     b88:	0021a503 	eoreq	sl, r1, r3, lsl #10
     b8c:	0b000000 	bleq	b94 <CPSR_IRQ_INHIBIT+0xb14>
     b90:	0000095d 	andeq	r0, r0, sp, asr r9
     b94:	009baa03 	addseq	sl, fp, r3, lsl #20
     b98:	00040000 	andeq	r0, r4, r0
     b9c:	0008e804 	andeq	lr, r8, r4, lsl #16
     ba0:	d1ab0300 			; <UNDEFINED> instruction: 0xd1ab0300
     ba4:	04000000 	streq	r0, [r0], #-0
     ba8:	00000795 	muleq	r0, r5, r7
     bac:	006eaf03 	rsbeq	sl, lr, r3, lsl #30
     bb0:	040c0000 	streq	r0, [ip], #-0
     bb4:	0110040d 	tsteq	r0, sp, lsl #8
     bb8:	01030000 	mrseq	r0, (UNDEF: 3)
     bbc:	0001d308 	andeq	sp, r1, r8, lsl #6
     bc0:	01100e00 	tsteq	r0, r0, lsl #28
     bc4:	9d040000 	stcls	0, cr0, [r4, #-0]
     bc8:	05000009 	streq	r0, [r0, #-9]
     bcc:	00006016 	andeq	r6, r0, r6, lsl r0
     bd0:	07a60f00 	streq	r0, [r6, r0, lsl #30]!
     bd4:	05180000 	ldreq	r0, [r8, #-0]
     bd8:	00017a2d 	andeq	r7, r1, sp, lsr #20
     bdc:	09090b00 	stmdbeq	r9, {r8, r9, fp}
     be0:	2f050000 	svccs	0x00050000
     be4:	0000017a 	andeq	r0, r0, sl, ror r1
     be8:	6b5f1000 	blvs	17c4bf0 <_heap+0x1744bec>
     bec:	21300500 	teqcs	r0, r0, lsl #10
     bf0:	04000000 	streq	r0, [r0], #-0
     bf4:	0009400b 	andeq	r4, r9, fp
     bf8:	21300500 	teqcs	r0, r0, lsl #10
     bfc:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
     c00:	00078f0b 	andeq	r8, r7, fp, lsl #30
     c04:	21300500 	teqcs	r0, r0, lsl #10
     c08:	0c000000 	stceq	0, cr0, [r0], {-0}
     c0c:	0009e40b 	andeq	lr, r9, fp, lsl #8
     c10:	21300500 	teqcs	r0, r0, lsl #10
     c14:	10000000 	andne	r0, r0, r0
     c18:	00785f10 	rsbseq	r5, r8, r0, lsl pc
     c1c:	01803105 	orreq	r3, r0, r5, lsl #2
     c20:	00140000 	andseq	r0, r4, r0
     c24:	0127040d 			; <UNDEFINED> instruction: 0x0127040d
     c28:	1c080000 	stcne	0, cr0, [r8], {-0}
     c2c:	90000001 	andls	r0, r0, r1
     c30:	09000001 	stmdbeq	r0, {r0}
     c34:	000000ca 	andeq	r0, r0, sl, asr #1
     c38:	d20f0000 	andle	r0, pc, #0
     c3c:	24000007 	strcs	r0, [r0], #-7
     c40:	02093505 	andeq	r3, r9, #20971520	; 0x1400000
     c44:	f80b0000 			; <UNDEFINED> instruction: 0xf80b0000
     c48:	05000006 	streq	r0, [r0, #-6]
     c4c:	00002137 	andeq	r2, r0, r7, lsr r1
     c50:	730b0000 	movwvc	r0, #45056	; 0xb000
     c54:	05000009 	streq	r0, [r0, #-9]
     c58:	00002138 	andeq	r2, r0, r8, lsr r1
     c5c:	070b0400 	streq	r0, [fp, -r0, lsl #8]
     c60:	05000007 	streq	r0, [r0, #-7]
     c64:	00002139 	andeq	r2, r0, r9, lsr r1
     c68:	640b0800 	strvs	r0, [fp], #-2048	; 0xfffff800
     c6c:	0500000a 	streq	r0, [r0, #-10]
     c70:	0000213a 	andeq	r2, r0, sl, lsr r1
     c74:	7d0b0c00 	stcvc	12, cr0, [fp, #-0]
     c78:	05000008 	streq	r0, [r0, #-8]
     c7c:	0000213b 	andeq	r2, r0, fp, lsr r1
     c80:	400b1000 	andmi	r1, fp, r0
     c84:	05000008 	streq	r0, [r0, #-8]
     c88:	0000213c 	andeq	r2, r0, ip, lsr r1
     c8c:	e90b1400 	stmdb	fp, {sl, ip}
     c90:	05000009 	streq	r0, [r0, #-9]
     c94:	0000213d 	andeq	r2, r0, sp, lsr r1
     c98:	ca0b1800 	bgt	2c6ca0 <_heap+0x246c9c>
     c9c:	05000008 	streq	r0, [r0, #-8]
     ca0:	0000213e 	andeq	r2, r0, lr, lsr r1
     ca4:	2b0b1c00 	blcs	2c7cac <_heap+0x247ca8>
     ca8:	0500000a 	streq	r0, [r0, #-10]
     cac:	0000213f 	andeq	r2, r0, pc, lsr r1
     cb0:	11002000 	mrsne	r2, (UNDEF: 0)
     cb4:	00000716 	andeq	r0, r0, r6, lsl r7
     cb8:	48050108 	stmdami	r5, {r3, r8}
     cbc:	00000249 	andeq	r0, r0, r9, asr #4
     cc0:	0007820b 	andeq	r8, r7, fp, lsl #4
     cc4:	49490500 	stmdbmi	r9, {r8, sl}^
     cc8:	00000002 	andeq	r0, r0, r2
     ccc:	0006590b 	andeq	r5, r6, fp, lsl #18
     cd0:	494a0500 	stmdbmi	sl, {r8, sl}^
     cd4:	80000002 	andhi	r0, r0, r2
     cd8:	00098f12 	andeq	r8, r9, r2, lsl pc
     cdc:	1c4c0500 	cfstr64ne	mvdx0, [ip], {-0}
     ce0:	00000001 	andeq	r0, r0, r1
     ce4:	073b1201 	ldreq	r1, [fp, -r1, lsl #4]!
     ce8:	4f050000 	svcmi	0x00050000
     cec:	0000011c 	andeq	r0, r0, ip, lsl r1
     cf0:	08000104 	stmdaeq	r0, {r2, r8}
     cf4:	00000108 	andeq	r0, r0, r8, lsl #2
     cf8:	00000259 	andeq	r0, r0, r9, asr r2
     cfc:	0000ca09 	andeq	ip, r0, r9, lsl #20
     d00:	11001f00 	tstne	r0, r0, lsl #30
     d04:	00000886 	andeq	r0, r0, r6, lsl #17
     d08:	5b050190 	blpl	141350 <_heap+0xc134c>
     d0c:	00000297 	muleq	r0, r7, r2
     d10:	0009090b 	andeq	r0, r9, fp, lsl #18
     d14:	975c0500 	ldrbls	r0, [ip, -r0, lsl #10]
     d18:	00000002 	andeq	r0, r0, r2
     d1c:	0009210b 	andeq	r2, r9, fp, lsl #2
     d20:	215d0500 	cmpcs	sp, r0, lsl #10
     d24:	04000000 	streq	r0, [r0], #-0
     d28:	00078a0b 	andeq	r8, r7, fp, lsl #20
     d2c:	9d5f0500 	cfldr64ls	mvdx0, [pc, #-0]	; d34 <CPSR_IRQ_INHIBIT+0xcb4>
     d30:	08000002 	stmdaeq	r0, {r1}
     d34:	0007160b 	andeq	r1, r7, fp, lsl #12
     d38:	09600500 	stmdbeq	r0!, {r8, sl}^
     d3c:	88000002 	stmdahi	r0, {r1}
     d40:	59040d00 	stmdbpl	r4, {r8, sl, fp}
     d44:	08000002 	stmdaeq	r0, {r1}
     d48:	000002ad 	andeq	r0, r0, sp, lsr #5
     d4c:	000002ad 	andeq	r0, r0, sp, lsr #5
     d50:	0000ca09 	andeq	ip, r0, r9, lsl #20
     d54:	0d001f00 	stceq	15, cr1, [r0, #-0]
     d58:	0002b304 	andeq	fp, r2, r4, lsl #6
     d5c:	d40f1300 	strle	r1, [pc], #-768	; d64 <CPSR_IRQ_INHIBIT+0xce4>
     d60:	08000008 	stmdaeq	r0, {r3}
     d64:	02d97305 	sbcseq	r7, r9, #335544320	; 0x14000000
     d68:	030b0000 	movweq	r0, #45056	; 0xb000
     d6c:	0500000a 	streq	r0, [r0, #-10]
     d70:	0002d974 	andeq	sp, r2, r4, ror r9
     d74:	6e0b0000 	cdpvs	0, 0, cr0, cr11, cr0, {0}
     d78:	05000006 	streq	r0, [r0, #-6]
     d7c:	00002175 	andeq	r2, r0, r5, ror r1
     d80:	0d000400 	cfstrseq	mvf0, [r0, #-0]
     d84:	00004404 	andeq	r4, r0, r4, lsl #8
     d88:	08f30f00 	ldmeq	r3!, {r8, r9, sl, fp}^
     d8c:	05680000 	strbeq	r0, [r8, #-0]!
     d90:	000409b3 			; <UNDEFINED> instruction: 0x000409b3
     d94:	705f1000 	subsvc	r1, pc, r0
     d98:	d9b40500 	ldmible	r4!, {r8, sl}
     d9c:	00000002 	andeq	r0, r0, r2
     da0:	00725f10 	rsbseq	r5, r2, r0, lsl pc
     da4:	0021b505 	eoreq	fp, r1, r5, lsl #10
     da8:	10040000 	andne	r0, r4, r0
     dac:	0500775f 	streq	r7, [r0, #-1887]	; 0xfffff8a1
     db0:	000021b6 			; <UNDEFINED> instruction: 0x000021b6
     db4:	340b0800 	strcc	r0, [fp], #-2048	; 0xfffff800
     db8:	05000007 	streq	r0, [r0, #-7]
     dbc:	00004bb7 			; <UNDEFINED> instruction: 0x00004bb7
     dc0:	ee0b0c00 	cdp	12, 0, cr0, cr11, cr0, {0}
     dc4:	05000007 	streq	r0, [r0, #-7]
     dc8:	00004bb8 			; <UNDEFINED> instruction: 0x00004bb8
     dcc:	5f100e00 	svcpl	0x00100e00
     dd0:	05006662 	streq	r6, [r0, #-1634]	; 0xfffff99e
     dd4:	0002b4b9 			; <UNDEFINED> instruction: 0x0002b4b9
     dd8:	d20b1000 	andle	r1, fp, #0
     ddc:	05000006 	streq	r0, [r0, #-6]
     de0:	000021ba 			; <UNDEFINED> instruction: 0x000021ba
     de4:	240b1800 	strcs	r1, [fp], #-2048	; 0xfffff800
     de8:	05000007 	streq	r0, [r0, #-7]
     dec:	000108c1 	andeq	r0, r1, r1, asr #17
     df0:	fe0b1c00 	cdp2	12, 0, cr1, cr11, cr0, {0}
     df4:	0500000a 	streq	r0, [r0, #-10]
     df8:	000564c3 	andeq	r6, r5, r3, asr #9
     dfc:	e90b2000 	stmdb	fp, {sp}
     e00:	0500000a 	streq	r0, [r0, #-10]
     e04:	00058ec5 	andeq	r8, r5, r5, asr #29
     e08:	650b2400 	strvs	r2, [fp, #-1024]	; 0xfffffc00
     e0c:	05000009 	streq	r0, [r0, #-9]
     e10:	0005b2c8 	andeq	fp, r5, r8, asr #5
     e14:	450b2800 	strmi	r2, [fp, #-2048]	; 0xfffff800
     e18:	0500000a 	streq	r0, [r0, #-10]
     e1c:	0005ccc9 	andeq	ip, r5, r9, asr #25
     e20:	5f102c00 	svcpl	0x00102c00
     e24:	05006275 	streq	r6, [r0, #-629]	; 0xfffffd8b
     e28:	0002b4cc 	andeq	fp, r2, ip, asr #9
     e2c:	5f103000 	svcpl	0x00103000
     e30:	05007075 	streq	r7, [r0, #-117]	; 0xffffff8b
     e34:	0002d9cd 	andeq	sp, r2, sp, asr #19
     e38:	5f103800 	svcpl	0x00103800
     e3c:	05007275 	streq	r7, [r0, #-629]	; 0xfffffd8b
     e40:	000021ce 	andeq	r2, r0, lr, asr #3
     e44:	010b3c00 	tsteq	fp, r0, lsl #24
     e48:	05000007 	streq	r0, [r0, #-7]
     e4c:	0005d2d1 	ldrdeq	sp, [r5], -r1
     e50:	1d0b4000 	stcne	0, cr4, [fp, #-0]
     e54:	0500000a 	streq	r0, [r0, #-10]
     e58:	0005e2d2 	ldrdeq	lr, [r5], -r2
     e5c:	5f104300 	svcpl	0x00104300
     e60:	0500626c 	streq	r6, [r0, #-620]	; 0xfffffd94
     e64:	0002b4d5 	ldrdeq	fp, [r2], -r5
     e68:	4a0b4400 	bmi	2d1e70 <_heap+0x251e6c>
     e6c:	05000007 	streq	r0, [r0, #-7]
     e70:	000021d8 	ldrdeq	r2, [r0], -r8
     e74:	5b0b4c00 	blpl	2d3e7c <_heap+0x253e78>
     e78:	05000007 	streq	r0, [r0, #-7]
     e7c:	000079d9 	ldrdeq	r7, [r0], -r9
     e80:	ed0b5000 	stc	0, cr5, [fp, #-0]
     e84:	05000004 	streq	r0, [r0, #-4]
     e88:	000427dc 	ldrdeq	r2, [r4], -ip
     e8c:	320b5400 	andcc	r5, fp, #0, 8
     e90:	05000008 	streq	r0, [r0, #-8]
     e94:	0000fde0 	andeq	pc, r0, r0, ror #27
     e98:	fb0b5800 	blx	2d6ea2 <_heap+0x256e9e>
     e9c:	05000008 	streq	r0, [r0, #-8]
     ea0:	0000f2e2 	andeq	pc, r0, r2, ror #5
     ea4:	380b5c00 	stmdacc	fp, {sl, fp, ip, lr}
     ea8:	05000008 	streq	r0, [r0, #-8]
     eac:	000021e3 	andeq	r2, r0, r3, ror #3
     eb0:	14006400 	strne	r6, [r0], #-1024	; 0xfffffc00
     eb4:	00000021 	andeq	r0, r0, r1, lsr #32
     eb8:	00000427 	andeq	r0, r0, r7, lsr #8
     ebc:	00042715 	andeq	r2, r4, r5, lsl r7
     ec0:	01081500 	tsteq	r8, r0, lsl #10
     ec4:	0a150000 	beq	540ecc <_heap+0x4c0ec8>
     ec8:	15000001 	strne	r0, [r0, #-1]
     ecc:	00000021 	andeq	r0, r0, r1, lsr #32
     ed0:	32040d00 	andcc	r0, r4, #0, 26
     ed4:	0e000004 	cdpeq	0, 0, cr0, cr0, cr4, {0}
     ed8:	00000427 	andeq	r0, r0, r7, lsr #8
     edc:	00094816 	andeq	r4, r9, r6, lsl r8
     ee0:	05042800 	streq	r2, [r4, #-2048]	; 0xfffff800
     ee4:	05640238 	strbeq	r0, [r4, #-568]!	; 0xfffffdc8
     ee8:	c3170000 	tstgt	r7, #0
     eec:	05000008 	streq	r0, [r0, #-8]
     ef0:	0021023a 	eoreq	r0, r1, sl, lsr r2
     ef4:	17000000 	strne	r0, [r0, -r0]
     ef8:	00000743 	andeq	r0, r0, r3, asr #14
     efc:	39023f05 	stmdbcc	r2, {r0, r2, r8, r9, sl, fp, ip, sp}
     f00:	04000006 	streq	r0, [r0], #-6
     f04:	0007de17 	andeq	sp, r7, r7, lsl lr
     f08:	023f0500 	eorseq	r0, pc, #0, 10
     f0c:	00000639 	andeq	r0, r0, r9, lsr r6
     f10:	079e1708 	ldreq	r1, [lr, r8, lsl #14]
     f14:	3f050000 	svccc	0x00050000
     f18:	00063902 	andeq	r3, r6, r2, lsl #18
     f1c:	1c170c00 	ldcne	12, cr0, [r7], {-0}
     f20:	05000009 	streq	r0, [r0, #-9]
     f24:	00210241 	eoreq	r0, r1, r1, asr #4
     f28:	17100000 	ldrne	r0, [r0, -r0]
     f2c:	0000067c 	andeq	r0, r0, ip, ror r6
     f30:	1b024205 	blne	9174c <_heap+0x11748>
     f34:	14000008 	strne	r0, [r0], #-8
     f38:	0009c517 	andeq	ip, r9, r7, lsl r5
     f3c:	02440500 	subeq	r0, r4, #0, 10
     f40:	00000021 	andeq	r0, r0, r1, lsr #32
     f44:	09261730 	stmdbeq	r6!, {r4, r5, r8, r9, sl, ip}
     f48:	45050000 	strmi	r0, [r5, #-0]
     f4c:	00058802 	andeq	r8, r5, r2, lsl #16
     f50:	8e173400 	cfmulshi	mvf3, mvf7, mvf0
     f54:	05000008 	streq	r0, [r0, #-8]
     f58:	00210247 	eoreq	r0, r1, r7, asr #4
     f5c:	17380000 	ldrne	r0, [r8, -r0]!
     f60:	00000936 	andeq	r0, r0, r6, lsr r9
     f64:	36024905 	strcc	r4, [r2], -r5, lsl #18
     f68:	3c000008 	stccc	0, cr0, [r0], {8}
     f6c:	00081d17 	andeq	r1, r8, r7, lsl sp
     f70:	024c0500 	subeq	r0, ip, #0, 10
     f74:	0000017a 	andeq	r0, r0, sl, ror r1
     f78:	07c81740 	strbeq	r1, [r8, r0, asr #14]
     f7c:	4d050000 	stcmi	0, cr0, [r5, #-0]
     f80:	00002102 	andeq	r2, r0, r2, lsl #2
     f84:	5f174400 	svcpl	0x00174400
     f88:	0500000a 	streq	r0, [r0, #-10]
     f8c:	017a024e 	cmneq	sl, lr, asr #4
     f90:	17480000 	strbne	r0, [r8, -r0]
     f94:	000008a0 	andeq	r0, r0, r0, lsr #17
     f98:	3c024f05 	stccc	15, cr4, [r2], {5}
     f9c:	4c000008 	stcmi	0, cr0, [r0], {8}
     fa0:	0007e617 	andeq	lr, r7, r7, lsl r6
     fa4:	02520500 	subseq	r0, r2, #0, 10
     fa8:	00000021 	andeq	r0, r0, r1, lsr #32
     fac:	07531750 			; <UNDEFINED> instruction: 0x07531750
     fb0:	53050000 	movwpl	r0, #20480	; 0x5000
     fb4:	00010a02 	andeq	r0, r1, r2, lsl #20
     fb8:	bc175400 	cfldrslt	mvf5, [r7], {-0}
     fbc:	05000008 	streq	r0, [r0, #-8]
     fc0:	07f90276 			; <UNDEFINED> instruction: 0x07f90276
     fc4:	18580000 	ldmdane	r8, {}^	; <UNPREDICTABLE>
     fc8:	00000886 	andeq	r0, r0, r6, lsl #17
     fcc:	97027a05 	strls	r7, [r2, -r5, lsl #20]
     fd0:	48000002 	stmdami	r0, {r1}
     fd4:	07fb1801 	ldrbeq	r1, [fp, r1, lsl #16]!
     fd8:	7b050000 	blvc	140fe0 <_heap+0xc0fdc>
     fdc:	00025902 	andeq	r5, r2, r2, lsl #18
     fe0:	18014c00 	stmdane	r1, {sl, fp, lr}
     fe4:	00000a13 	andeq	r0, r0, r3, lsl sl
     fe8:	4d027f05 	stcmi	15, cr7, [r2, #-20]	; 0xffffffec
     fec:	dc000008 	stcle	0, cr0, [r0], {8}
     ff0:	072c1802 	streq	r1, [ip, -r2, lsl #16]!
     ff4:	84050000 	strhi	r0, [r5], #-0
     ff8:	0005fe02 	andeq	pc, r5, r2, lsl #28
     ffc:	1802e000 	stmdane	r2, {sp, lr, pc}
    1000:	00000711 	andeq	r0, r0, r1, lsl r7
    1004:	59028505 	stmdbpl	r2, {r0, r2, r8, sl, pc}
    1008:	ec000008 	stc	0, cr0, [r0], {8}
    100c:	040d0002 	streq	r0, [sp], #-2
    1010:	00000409 	andeq	r0, r0, r9, lsl #8
    1014:	00002114 	andeq	r2, r0, r4, lsl r1
    1018:	00058800 	andeq	r8, r5, r0, lsl #16
    101c:	04271500 	strteq	r1, [r7], #-1280	; 0xfffffb00
    1020:	08150000 	ldmdaeq	r5, {}	; <UNPREDICTABLE>
    1024:	15000001 	strne	r0, [r0, #-1]
    1028:	00000588 	andeq	r0, r0, r8, lsl #11
    102c:	00002115 	andeq	r2, r0, r5, lsl r1
    1030:	040d0000 	streq	r0, [sp], #-0
    1034:	00000117 	andeq	r0, r0, r7, lsl r1
    1038:	056a040d 	strbeq	r0, [sl, #-1037]!	; 0xfffffbf3
    103c:	84140000 	ldrhi	r0, [r4], #-0
    1040:	b2000000 	andlt	r0, r0, #0
    1044:	15000005 	strne	r0, [r0, #-5]
    1048:	00000427 	andeq	r0, r0, r7, lsr #8
    104c:	00010815 	andeq	r0, r1, r5, lsl r8
    1050:	00841500 	addeq	r1, r4, r0, lsl #10
    1054:	21150000 	tstcs	r5, r0
    1058:	00000000 	andeq	r0, r0, r0
    105c:	0594040d 	ldreq	r0, [r4, #1037]	; 0x40d
    1060:	21140000 	tstcs	r4, r0
    1064:	cc000000 	stcgt	0, cr0, [r0], {-0}
    1068:	15000005 	strne	r0, [r0, #-5]
    106c:	00000427 	andeq	r0, r0, r7, lsr #8
    1070:	00010815 	andeq	r0, r1, r5, lsl r8
    1074:	040d0000 	streq	r0, [sp], #-0
    1078:	000005b8 			; <UNDEFINED> instruction: 0x000005b8
    107c:	00004408 	andeq	r4, r0, r8, lsl #8
    1080:	0005e200 	andeq	lr, r5, r0, lsl #4
    1084:	00ca0900 	sbceq	r0, sl, r0, lsl #18
    1088:	00020000 	andeq	r0, r2, r0
    108c:	00004408 	andeq	r4, r0, r8, lsl #8
    1090:	0005f200 	andeq	pc, r5, r0, lsl #4
    1094:	00ca0900 	sbceq	r0, sl, r0, lsl #18
    1098:	00000000 	andeq	r0, r0, r0
    109c:	0008e105 	andeq	lr, r8, r5, lsl #2
    10a0:	011d0500 	tsteq	sp, r0, lsl #10
    10a4:	000002df 	ldrdeq	r0, [r0], -pc	; <UNPREDICTABLE>
    10a8:	0009f319 	andeq	pc, r9, r9, lsl r3	; <UNPREDICTABLE>
    10ac:	21050c00 	tstcs	r5, r0, lsl #24
    10b0:	00063301 	andeq	r3, r6, r1, lsl #6
    10b4:	09091700 	stmdbeq	r9, {r8, r9, sl, ip}
    10b8:	23050000 	movwcs	r0, #20480	; 0x5000
    10bc:	00063301 	andeq	r3, r6, r1, lsl #6
    10c0:	f4170000 			; <UNDEFINED> instruction: 0xf4170000
    10c4:	05000007 	streq	r0, [r0, #-7]
    10c8:	00210124 	eoreq	r0, r1, r4, lsr #2
    10cc:	17040000 	strne	r0, [r4, -r0]
    10d0:	000008db 	ldrdeq	r0, [r0], -fp
    10d4:	39012505 	stmdbcc	r1, {r0, r2, r8, sl, sp}
    10d8:	08000006 	stmdaeq	r0, {r1, r2}
    10dc:	fe040d00 	cdp2	13, 0, cr0, cr4, cr0, {0}
    10e0:	0d000005 	stceq	0, cr0, [r0, #-20]	; 0xffffffec
    10e4:	0005f204 	andeq	pc, r5, r4, lsl #4
    10e8:	06741900 	ldrbteq	r1, [r4], -r0, lsl #18
    10ec:	050e0000 	streq	r0, [lr, #-0]
    10f0:	0674013d 			; <UNDEFINED> instruction: 0x0674013d
    10f4:	4f170000 	svcmi	0x00170000
    10f8:	05000009 	streq	r0, [r0, #-9]
    10fc:	0674013e 			; <UNDEFINED> instruction: 0x0674013e
    1100:	17000000 	strne	r0, [r0, -r0]
    1104:	0000097c 	andeq	r0, r0, ip, ror r9
    1108:	74013f05 	strvc	r3, [r1], #-3845	; 0xfffff0fb
    110c:	06000006 	streq	r0, [r0], -r6
    1110:	00099817 	andeq	r9, r9, r7, lsl r8
    1114:	01400500 	cmpeq	r0, r0, lsl #10
    1118:	00000052 	andeq	r0, r0, r2, asr r0
    111c:	5208000c 	andpl	r0, r8, #12
    1120:	84000000 	strhi	r0, [r0], #-0
    1124:	09000006 	stmdbeq	r0, {r1, r2}
    1128:	000000ca 	andeq	r0, r0, sl, asr #1
    112c:	d01a0002 	andsle	r0, sl, r2
    1130:	85025705 	strhi	r5, [r2, #-1797]	; 0xfffff8fb
    1134:	17000007 	strne	r0, [r0, -r7]
    1138:	000009d7 	ldrdeq	r0, [r0], -r7
    113c:	28025905 	stmdacs	r2, {r0, r2, r8, fp, ip, lr}
    1140:	00000000 	andeq	r0, r0, r0
    1144:	00098217 	andeq	r8, r9, r7, lsl r2
    1148:	025a0500 	subseq	r0, sl, #0, 10
    114c:	0000010a 	andeq	r0, r0, sl, lsl #2
    1150:	08101704 	ldmdaeq	r0, {r2, r8, r9, sl, ip}
    1154:	5b050000 	blpl	14115c <_heap+0xc1158>
    1158:	00078502 	andeq	r8, r7, r2, lsl #10
    115c:	36170800 	ldrcc	r0, [r7], -r0, lsl #16
    1160:	0500000a 	streq	r0, [r0, #-10]
    1164:	0190025c 	orrseq	r0, r0, ip, asr r2
    1168:	17240000 	strne	r0, [r4, -r0]!
    116c:	000007ae 	andeq	r0, r0, lr, lsr #15
    1170:	21025d05 	tstcs	r2, r5, lsl #26
    1174:	48000000 	stmdami	r0, {}	; <UNPREDICTABLE>
    1178:	00090417 	andeq	r0, r9, r7, lsl r4
    117c:	025e0500 	subseq	r0, lr, #0, 10
    1180:	00000067 	andeq	r0, r0, r7, rrx
    1184:	0a4c1750 	beq	1306ecc <_heap+0x1286ec8>
    1188:	5f050000 	svcpl	0x00050000
    118c:	00063f02 	andeq	r3, r6, r2, lsl #30
    1190:	0f175800 	svceq	0x00175800
    1194:	05000009 	streq	r0, [r0, #-9]
    1198:	00f20260 	rscseq	r0, r2, r0, ror #4
    119c:	17680000 	strbne	r0, [r8, -r0]!
    11a0:	00000a51 	andeq	r0, r0, r1, asr sl
    11a4:	f2026105 	vrhadd.s8	d6, d2, d5
    11a8:	70000000 	andvc	r0, r0, r0
    11ac:	0006ea17 	andeq	lr, r6, r7, lsl sl
    11b0:	02620500 	rsbeq	r0, r2, #0, 10
    11b4:	000000f2 	strdeq	r0, [r0], -r2
    11b8:	0a091778 	beq	246fa0 <_heap+0x1c6f9c>
    11bc:	63050000 	movwvs	r0, #20480	; 0x5000
    11c0:	00079502 	andeq	r9, r7, r2, lsl #10
    11c4:	04178000 	ldreq	r8, [r7], #-0
    11c8:	05000008 	streq	r0, [r0, #-8]
    11cc:	07a50264 	streq	r0, [r5, r4, ror #4]!
    11d0:	17880000 	strne	r0, [r8, r0]
    11d4:	000009a5 	andeq	r0, r0, r5, lsr #19
    11d8:	21026505 	tstcs	r2, r5, lsl #10
    11dc:	a0000000 	andge	r0, r0, r0
    11e0:	00077417 	andeq	r7, r7, r7, lsl r4
    11e4:	02660500 	rsbeq	r0, r6, #0, 10
    11e8:	000000f2 	strdeq	r0, [r0], -r2
    11ec:	06db17a4 	ldrbeq	r1, [fp], r4, lsr #15
    11f0:	67050000 	strvs	r0, [r5, -r0]
    11f4:	0000f202 	andeq	pc, r0, r2, lsl #4
    11f8:	6317ac00 	tstvs	r7, #0, 24
    11fc:	05000007 	streq	r0, [r0, #-7]
    1200:	00f20268 	rscseq	r0, r2, r8, ror #4
    1204:	17b40000 	ldrne	r0, [r4, r0]!
    1208:	00000687 	andeq	r0, r0, r7, lsl #13
    120c:	f2026905 	vmla.i8	d6, d2, d5
    1210:	bc000000 	stclt	0, cr0, [r0], {-0}
    1214:	00069617 	andeq	r9, r6, r7, lsl r6
    1218:	026a0500 	rsbeq	r0, sl, #0, 10
    121c:	000000f2 	strdeq	r0, [r0], -r2
    1220:	08c117c4 	stmiaeq	r1, {r2, r6, r7, r8, r9, sl, ip}^
    1224:	6b050000 	blvs	14122c <_heap+0xc1228>
    1228:	00002102 	andeq	r2, r0, r2, lsl #2
    122c:	0800cc00 	stmdaeq	r0, {sl, fp, lr, pc}
    1230:	00000110 	andeq	r0, r0, r0, lsl r1
    1234:	00000795 	muleq	r0, r5, r7
    1238:	0000ca09 	andeq	ip, r0, r9, lsl #20
    123c:	08001900 	stmdaeq	r0, {r8, fp, ip}
    1240:	00000110 	andeq	r0, r0, r0, lsl r1
    1244:	000007a5 	andeq	r0, r0, r5, lsr #15
    1248:	0000ca09 	andeq	ip, r0, r9, lsl #20
    124c:	08000700 	stmdaeq	r0, {r8, r9, sl}
    1250:	00000110 	andeq	r0, r0, r0, lsl r1
    1254:	000007b5 			; <UNDEFINED> instruction: 0x000007b5
    1258:	0000ca09 	andeq	ip, r0, r9, lsl #20
    125c:	1a001700 	bne	6e64 <CPSR_IRQ_INHIBIT+0x6de4>
    1260:	027005f0 	rsbseq	r0, r0, #240, 10	; 0x3c000000
    1264:	000007d9 	ldrdeq	r0, [r0], -r9
    1268:	00087617 	andeq	r7, r8, r7, lsl r6
    126c:	02730500 	rsbseq	r0, r3, #0, 10
    1270:	000007d9 	ldrdeq	r0, [r0], -r9
    1274:	084a1700 	stmdaeq	sl, {r8, r9, sl, ip}^
    1278:	74050000 	strvc	r0, [r5], #-0
    127c:	0007e902 	andeq	lr, r7, r2, lsl #18
    1280:	08007800 	stmdaeq	r0, {fp, ip, sp, lr}
    1284:	000002d9 	ldrdeq	r0, [r0], -r9
    1288:	000007e9 	andeq	r0, r0, r9, ror #15
    128c:	0000ca09 	andeq	ip, r0, r9, lsl #20
    1290:	08001d00 	stmdaeq	r0, {r8, sl, fp, ip}
    1294:	00000028 	andeq	r0, r0, r8, lsr #32
    1298:	000007f9 	strdeq	r0, [r0], -r9
    129c:	0000ca09 	andeq	ip, r0, r9, lsl #20
    12a0:	1b001d00 	blne	86a8 <fifo_init+0x20>
    12a4:	025505f0 	subseq	r0, r5, #240, 10	; 0x3c000000
    12a8:	0000081b 	andeq	r0, r0, fp, lsl r8
    12ac:	0009481c 	andeq	r4, r9, ip, lsl r8
    12b0:	026c0500 	rsbeq	r0, ip, #0, 10
    12b4:	00000684 	andeq	r0, r0, r4, lsl #13
    12b8:	000a231c 	andeq	r2, sl, ip, lsl r3
    12bc:	02750500 	rsbseq	r0, r5, #0, 10
    12c0:	000007b5 			; <UNDEFINED> instruction: 0x000007b5
    12c4:	01100800 	tsteq	r0, r0, lsl #16
    12c8:	082b0000 	stmdaeq	fp!, {}	; <UNPREDICTABLE>
    12cc:	ca090000 	bgt	2412d4 <_heap+0x1c12d0>
    12d0:	18000000 	stmdane	r0, {}	; <UNPREDICTABLE>
    12d4:	08361d00 	ldmdaeq	r6!, {r8, sl, fp, ip}
    12d8:	27150000 	ldrcs	r0, [r5, -r0]
    12dc:	00000004 	andeq	r0, r0, r4
    12e0:	082b040d 	stmdaeq	fp!, {r0, r2, r3, sl}
    12e4:	040d0000 	streq	r0, [sp], #-0
    12e8:	0000017a 	andeq	r0, r0, sl, ror r1
    12ec:	00084d1d 	andeq	r4, r8, sp, lsl sp
    12f0:	00211500 	eoreq	r1, r1, r0, lsl #10
    12f4:	0d000000 	stceq	0, cr0, [r0, #-0]
    12f8:	00085304 	andeq	r5, r8, r4, lsl #6
    12fc:	42040d00 	andmi	r0, r4, #0, 26
    1300:	08000008 	stmdaeq	r0, {r3}
    1304:	000005f2 	strdeq	r0, [r0], -r2
    1308:	00000869 	andeq	r0, r0, r9, ror #16
    130c:	0000ca09 	andeq	ip, r0, r9, lsl #20
    1310:	1e000200 	cdpne	2, 0, cr0, cr0, cr0, {0}
    1314:	000009b9 			; <UNDEFINED> instruction: 0x000009b9
    1318:	2702fd05 	strcs	pc, [r2, -r5, lsl #26]
    131c:	1e000004 	cdpne	0, 0, cr0, cr0, cr4, {0}
    1320:	000009b2 			; <UNDEFINED> instruction: 0x000009b2
    1324:	2d02fe05 	stccs	14, cr15, [r2, #-20]	; 0xffffffec
    1328:	08000004 	stmdaeq	r0, {r2}
    132c:	00000110 	andeq	r0, r0, r0, lsl r1
    1330:	00000891 	muleq	r0, r1, r8
    1334:	0000ca09 	andeq	ip, r0, r9, lsl #20
    1338:	1f000400 	svcne	0x00000400
    133c:	00000665 	andeq	r0, r0, r5, ror #12
    1340:	08810501 	stmeq	r1, {r0, r8, sl}
    1344:	03050000 	movweq	r0, #20480	; 0x5000
    1348:	00008ae8 	andeq	r8, r0, r8, ror #21
    134c:	0008531f 	andeq	r5, r8, pc, lsl r3
    1350:	95060100 	strls	r0, [r6, #-256]	; 0xffffff00
    1354:	05000007 	streq	r0, [r0, #-7]
    1358:	008af003 	addeq	pc, sl, r3
    135c:	01100800 	tsteq	r0, r0, lsl #16
    1360:	08c30000 	stmiaeq	r3, {}^	; <UNPREDICTABLE>
    1364:	ca090000 	bgt	24136c <_heap+0x1c1368>
    1368:	06000000 	streq	r0, [r0], -r0
    136c:	09f91f00 	ldmibeq	r9!, {r8, r9, sl, fp, ip}^
    1370:	07010000 	streq	r0, [r1, -r0]
    1374:	000008b3 			; <UNDEFINED> instruction: 0x000008b3
    1378:	8af80305 	bhi	ffe01f94 <_heap+0xffd81f90>
    137c:	6e200000 	cdpvs	0, 2, cr0, cr0, cr0, {0}
    1380:	0100000a 	tsteq	r0, sl
    1384:	0000210a 	andeq	r2, r0, sl, lsl #2
    1388:	00858c00 	addeq	r8, r5, r0, lsl #24
    138c:	0000c000 	andeq	ip, r0, r0
    1390:	1f9c0100 	svcne	0x009c0100
    1394:	000004ee 	andeq	r0, r0, lr, ror #9
    1398:	010a0c01 	tsteq	sl, r1, lsl #24
    139c:	91020000 	mrsls	r0, (UNDEF: 2)
    13a0:	08601f6c 	stmdaeq	r0!, {r2, r3, r5, r6, r8, r9, sl, fp, ip}^
    13a4:	0d010000 	stceq	0, cr0, [r1, #-0]
    13a8:	0000010a 	andeq	r0, r0, sl, lsl #2
    13ac:	1f749102 	svcne	0x00749102
    13b0:	000007bd 			; <UNDEFINED> instruction: 0x000007bd
    13b4:	00210e01 	eoreq	r0, r1, r1, lsl #28
    13b8:	91020000 	mrsls	r0, (UNDEF: 2)
    13bc:	057d1f70 	ldrbeq	r1, [sp, #-3952]!	; 0xfffff090
    13c0:	0f010000 	svceq	0x00010000
    13c4:	00000021 	andeq	r0, r0, r1, lsr #32
    13c8:	00689102 	rsbeq	r9, r8, r2, lsl #2
    13cc:	0000ac00 	andeq	sl, r0, r0, lsl #24
    13d0:	8e000400 	cfcpyshi	mvf0, mvf0
    13d4:	04000004 	streq	r0, [r0], #-4
    13d8:	00004401 	andeq	r4, r0, r1, lsl #8
    13dc:	0a8b0c00 	beq	fe2c43e4 <_heap+0xfe2443e0>
    13e0:	864c0000 	strbhi	r0, [ip], -r0
    13e4:	003c0000 	eorseq	r0, ip, r0
    13e8:	04d20000 	ldrbeq	r0, [r2], #0
    13ec:	01020000 	mrseq	r0, (UNDEF: 2)
    13f0:	0001cc06 	andeq	ip, r1, r6, lsl #24
    13f4:	08010200 	stmdaeq	r1, {r9}
    13f8:	000001ca 	andeq	r0, r0, sl, asr #3
    13fc:	fb050202 	blx	141c0e <_heap+0xc1c0a>
    1400:	02000000 	andeq	r0, r0, #0
    1404:	02370702 	eorseq	r0, r7, #524288	; 0x80000
    1408:	04020000 	streq	r0, [r2], #-0
    140c:	00019f05 	andeq	r9, r1, r5, lsl #30
    1410:	07040200 	streq	r0, [r4, -r0, lsl #4]
    1414:	000001dd 	ldrdeq	r0, [r0], -sp
    1418:	9a050802 	bls	143428 <_heap+0xc3424>
    141c:	02000001 	andeq	r0, r0, #1
    1420:	01d80708 	bicseq	r0, r8, r8, lsl #14
    1424:	04030000 	streq	r0, [r3], #-0
    1428:	746e6905 	strbtvc	r6, [lr], #-2309	; 0xfffff6fb
    142c:	07040200 	streq	r0, [r4, -r0, lsl #4]
    1430:	000001e2 	andeq	r0, r0, r2, ror #3
    1434:	eb070402 	bl	1c2444 <_heap+0x142440>
    1438:	02000005 	andeq	r0, r0, #5
    143c:	01d30801 	bicseq	r0, r3, r1, lsl #16
    1440:	7f040000 	svcvc	0x00040000
    1444:	0100000a 	tsteq	r0, sl
    1448:	00864c12 	addeq	r4, r6, r2, lsl ip
    144c:	00003c00 	andeq	r3, r0, r0, lsl #24
    1450:	059c0100 	ldreq	r0, [ip, #256]	; 0x100
    1454:	01003072 	tsteq	r0, r2, ror r0
    1458:	00006012 	andeq	r6, r0, r2, lsl r0
    145c:	74910200 	ldrvc	r0, [r1], #512	; 0x200
    1460:	00317205 	eorseq	r7, r1, r5, lsl #4
    1464:	00601201 	rsbeq	r1, r0, r1, lsl #4
    1468:	91020000 	mrsls	r0, (UNDEF: 2)
    146c:	0a790670 	beq	1e42e34 <_heap+0x1dc2e30>
    1470:	12010000 	andne	r0, r1, #0
    1474:	00000060 	andeq	r0, r0, r0, rrx
    1478:	006c9102 	rsbeq	r9, ip, r2, lsl #2
    147c:	0001bc00 	andeq	fp, r1, r0, lsl #24
    1480:	ec000400 	cfstrs	mvf0, [r0], {-0}
    1484:	04000004 	streq	r0, [r0], #-4
    1488:	00004401 	andeq	r4, r0, r1, lsl #8
    148c:	0abb0c00 	beq	feec4494 <_heap+0xfee44490>
    1490:	86880000 	strhi	r0, [r8], r0
    1494:	022c0000 	eoreq	r0, ip, #0
    1498:	053c0000 	ldreq	r0, [ip, #-0]!
    149c:	01020000 	mrseq	r0, (UNDEF: 2)
    14a0:	0001cc06 	andeq	ip, r1, r6, lsl #24
    14a4:	08010200 	stmdaeq	r1, {r9}
    14a8:	000001ca 	andeq	r0, r0, sl, asr #3
    14ac:	fb050202 	blx	141cbe <_heap+0xc1cba>
    14b0:	02000000 	andeq	r0, r0, #0
    14b4:	02370702 	eorseq	r0, r7, #524288	; 0x80000
    14b8:	04020000 	streq	r0, [r2], #-0
    14bc:	00019f05 	andeq	r9, r1, r5, lsl #30
    14c0:	07040200 	streq	r0, [r4, -r0, lsl #4]
    14c4:	000001dd 	ldrdeq	r0, [r0], -sp
    14c8:	9a050802 	bls	1434d8 <_heap+0xc34d4>
    14cc:	02000001 	andeq	r0, r0, #1
    14d0:	01d80708 	bicseq	r0, r8, r8, lsl #14
    14d4:	04030000 	streq	r0, [r3], #-0
    14d8:	746e6905 	strbtvc	r6, [lr], #-2309	; 0xfffff6fb
    14dc:	07040200 	streq	r0, [r4, -r0, lsl #4]
    14e0:	000001e2 	andeq	r0, r0, r2, ror #3
    14e4:	02021804 	andeq	r1, r2, #4, 16	; 0x40000
    14e8:	000000a0 	andeq	r0, r0, r0, lsr #1
    14ec:	00059705 	andeq	r9, r5, r5, lsl #14
    14f0:	a0040200 	andge	r0, r4, r0, lsl #4
    14f4:	00000000 	andeq	r0, r0, r0
    14f8:	0004e005 	andeq	lr, r4, r5
    14fc:	59050200 	stmdbpl	r5, {r9}
    1500:	0c000000 	stceq	0, cr0, [r0], {-0}
    1504:	00053505 	andeq	r3, r5, r5, lsl #10
    1508:	59060200 	stmdbpl	r6, {r9}
    150c:	10000000 	andne	r0, r0, r0
    1510:	00066f05 	andeq	r6, r6, r5, lsl #30
    1514:	59070200 	stmdbpl	r7, {r9}
    1518:	14000000 	strne	r0, [r0], #-0
    151c:	00b70600 	adcseq	r0, r7, r0, lsl #12
    1520:	00b00000 	adcseq	r0, r0, r0
    1524:	b0070000 	andlt	r0, r7, r0
    1528:	09000000 	stmdbeq	r0, {}	; <UNPREDICTABLE>
    152c:	07040200 	streq	r0, [r4, -r0, lsl #4]
    1530:	000005eb 	andeq	r0, r0, fp, ror #11
    1534:	d3080102 	movwle	r0, #33026	; 0x8102
    1538:	08000001 	stmdaeq	r0, {r0}
    153c:	000000b7 	strheq	r0, [r0], -r7
    1540:	00051709 	andeq	r1, r5, r9, lsl #14
    1544:	67080200 	strvs	r0, [r8, -r0, lsl #4]
    1548:	0a000000 	beq	1550 <CPSR_IRQ_INHIBIT+0x14d0>
    154c:	00000ae5 	andeq	r0, r0, r5, ror #21
    1550:	00592f01 	subseq	r2, r9, r1, lsl #30
    1554:	87b00000 	ldrhi	r0, [r0, r0]!
    1558:	01040000 	mrseq	r0, (UNDEF: 4)
    155c:	9c010000 	stcls	0, cr0, [r1], {-0}
    1560:	0000012a 	andeq	r0, r0, sl, lsr #2
    1564:	0100660b 	tsteq	r0, fp, lsl #12
    1568:	00012a2f 	andeq	r2, r1, pc, lsr #20
    156c:	6c910200 	lfmvs	f0, 4, [r1], {0}
    1570:	0004ee0c 	andeq	lr, r4, ip, lsl #28
    1574:	302f0100 	eorcc	r0, pc, r0, lsl #2
    1578:	02000001 	andeq	r0, r0, #1
    157c:	3a0c6891 	bcc	31b7c8 <_heap+0x29b7c4>
    1580:	01000005 	tsteq	r0, r5
    1584:	0000592f 	andeq	r5, r0, pc, lsr #18
    1588:	64910200 	ldrvs	r0, [r1], #512	; 0x200
    158c:	0100690d 	tsteq	r0, sp, lsl #18
    1590:	00005931 	andeq	r5, r0, r1, lsr r9
    1594:	74910200 	ldrvc	r0, [r1], #512	; 0x200
    1598:	7274700d 	rsbsvc	r7, r4, #13
    159c:	37320100 	ldrcc	r0, [r2, -r0, lsl #2]!
    15a0:	02000001 	andeq	r0, r0, #1
    15a4:	0e007091 	mcreq	0, 0, r7, cr0, cr1, {4}
    15a8:	0000c304 	andeq	ip, r0, r4, lsl #6
    15ac:	36040e00 	strcc	r0, [r4], -r0, lsl #28
    15b0:	0f000001 	svceq	0x00000001
    15b4:	00be040e 	adcseq	r0, lr, lr, lsl #8
    15b8:	fa0a0000 	blx	2815c0 <_heap+0x2015bc>
    15bc:	0100000a 	tsteq	r0, sl
    15c0:	00005913 	andeq	r5, r0, r3, lsl r9
    15c4:	0086cc00 	addeq	ip, r6, r0, lsl #24
    15c8:	0000e400 	andeq	lr, r0, r0, lsl #8
    15cc:	999c0100 	ldmibls	ip, {r8}
    15d0:	0b000001 	bleq	15dc <CPSR_IRQ_INHIBIT+0x155c>
    15d4:	13010066 	movwne	r0, #4198	; 0x1066
    15d8:	0000012a 	andeq	r0, r0, sl, lsr #2
    15dc:	0c6c9102 	stfeqp	f1, [ip], #-8
    15e0:	00000b04 	andeq	r0, r0, r4, lsl #22
    15e4:	01991301 	orrseq	r1, r9, r1, lsl #6
    15e8:	91020000 	mrsls	r0, (UNDEF: 2)
    15ec:	053a0c68 	ldreq	r0, [sl, #-3176]!	; 0xfffff398
    15f0:	13010000 	movwne	r0, #4096	; 0x1000
    15f4:	00000059 	andeq	r0, r0, r9, asr r0
    15f8:	0d649102 	stfeqp	f1, [r4, #-8]!
    15fc:	15010069 	strne	r0, [r1, #-105]	; 0xffffff97
    1600:	00000059 	andeq	r0, r0, r9, asr r0
    1604:	0d749102 	ldfeqp	f1, [r4, #-8]!
    1608:	00727470 	rsbseq	r7, r2, r0, ror r4
    160c:	019b1601 	orrseq	r1, fp, r1, lsl #12
    1610:	91020000 	mrsls	r0, (UNDEF: 2)
    1614:	04100070 	ldreq	r0, [r0], #-112	; 0xffffff90
    1618:	00b7040e 	adcseq	r0, r7, lr, lsl #8
    161c:	f0110000 			; <UNDEFINED> instruction: 0xf0110000
    1620:	0100000a 	tsteq	r0, sl
    1624:	0086880a 	addeq	r8, r6, sl, lsl #16
    1628:	00004400 	andeq	r4, r0, r0, lsl #8
    162c:	0b9c0100 	bleq	fe701a34 <_heap+0xfe681a30>
    1630:	0a010066 	beq	417d0 <__bss_end__+0x38cb4>
    1634:	0000012a 	andeq	r0, r0, sl, lsr #2
    1638:	00749102 	rsbseq	r9, r4, r2, lsl #2
    163c:	00006c00 	andeq	r6, r0, r0, lsl #24
    1640:	cc000200 	sfmgt	f0, 4, [r0], {-0}
    1644:	04000005 	streq	r0, [r0], #-5
    1648:	00061401 	andeq	r1, r6, r1, lsl #8
    164c:	00800000 	addeq	r0, r0, r0
    1650:	00809400 	addeq	r9, r0, r0, lsl #8
    1654:	6f682f00 	svcvs	0x00682f00
    1658:	612f656d 			; <UNDEFINED> instruction: 0x612f656d
    165c:	6b696462 	blvs	1a5a7ec <_heap+0x19da7e8>
    1660:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
    1664:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
    1668:	4c794d2f 	ldclmi	13, cr4, [r9], #-188	; 0xffffff44
    166c:	6c747469 	cfldrdvs	mvd7, [r4], #-420	; 0xfffffe5c
    1670:	2f534f65 	svccs	0x00534f65
    1674:	2f637273 	svccs	0x00637273
    1678:	72617473 	rsbvc	r7, r1, #1929379840	; 0x73000000
    167c:	00732e74 	rsbseq	r2, r3, r4, ror lr
    1680:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; 15cc <CPSR_IRQ_INHIBIT+0x154c>
    1684:	62612f65 	rsbvs	r2, r1, #404	; 0x194
    1688:	616b6964 	cmnvs	fp, r4, ror #18
    168c:	2f6d6972 	svccs	0x006d6972
    1690:	2f766564 	svccs	0x00766564
    1694:	694c794d 	stmdbvs	ip, {r0, r2, r3, r6, r8, fp, ip, sp, lr}^
    1698:	656c7474 	strbvs	r7, [ip, #-1140]!	; 0xfffffb8c
    169c:	4700534f 	strmi	r5, [r0, -pc, asr #6]
    16a0:	4120554e 			; <UNDEFINED> instruction: 0x4120554e
    16a4:	2e322053 	mrccs	0, 1, r2, cr2, cr3, {2}
    16a8:	01003732 	tsteq	r0, r2, lsr r7
    16ac:	0000ba80 	andeq	fp, r0, r0, lsl #21
    16b0:	e0000200 	and	r0, r0, r0, lsl #4
    16b4:	04000005 	streq	r0, [r0], #-5
    16b8:	00068d01 	andeq	r8, r6, r1, lsl #26
    16bc:	0088b400 	addeq	fp, r8, r0, lsl #8
    16c0:	008ad800 	addeq	sp, sl, r0, lsl #16
    16c4:	2f2e2e00 	svccs	0x002e2e00
    16c8:	2e2f2e2e 	cdpcs	14, 2, cr2, cr15, cr14, {1}
    16cc:	2e2e2f2e 	cdpcs	15, 2, cr2, cr14, cr14, {1}
    16d0:	2f2e2e2f 	svccs	0x002e2e2f
    16d4:	2e2f2e2e 	cdpcs	14, 2, cr2, cr15, cr14, {1}
    16d8:	656e2f2e 	strbvs	r2, [lr, #-3886]!	; 0xfffff0d2
    16dc:	62696c77 	rsbvs	r6, r9, #30464	; 0x7700
    16e0:	62696c2f 	rsbvs	r6, r9, #12032	; 0x2f00
    16e4:	616d2f63 	cmnvs	sp, r3, ror #30
    16e8:	6e696863 	cdpvs	8, 6, cr6, cr9, cr3, {3}
    16ec:	72612f65 	rsbvc	r2, r1, #404	; 0x194
    16f0:	74732f6d 	ldrbtvc	r2, [r3], #-3949	; 0xfffff093
    16f4:	706d6372 	rsbvc	r6, sp, r2, ror r3
    16f8:	6d72612d 	ldfvse	f6, [r2, #-180]!	; 0xffffff4c
    16fc:	532e3476 			; <UNDEFINED> instruction: 0x532e3476
    1700:	75622f00 	strbvc	r2, [r2, #-3840]!	; 0xfffff100
    1704:	2f646c69 	svccs	0x00646c69
    1708:	6c77656e 	cfldr64vs	mvdx6, [r7], #-440	; 0xfffffe48
    170c:	6a2d6269 	bvs	b5a0b8 <_heap+0xada0b4>
    1710:	5778336f 	ldrbpl	r3, [r8, -pc, ror #6]!
    1714:	656e2f31 	strbvs	r2, [lr, #-3889]!	; 0xfffff0cf
    1718:	62696c77 	rsbvs	r6, r9, #30464	; 0x7700
    171c:	342e322d 	strtcc	r3, [lr], #-557	; 0xfffffdd3
    1720:	322e302e 	eorcc	r3, lr, #46	; 0x2e
    1724:	30363130 	eorscc	r3, r6, r0, lsr r1
    1728:	2f373235 	svccs	0x00373235
    172c:	6c697562 	cfstr64vs	mvdx7, [r9], #-392	; 0xfffffe78
    1730:	72612f64 	rsbvc	r2, r1, #100, 30	; 0x190
    1734:	6f6e2d6d 	svcvs	0x006e2d6d
    1738:	652d656e 	strvs	r6, [sp, #-1390]!	; 0xfffffa92
    173c:	2f696261 	svccs	0x00696261
    1740:	64726168 	ldrbtvs	r6, [r2], #-360	; 0xfffffe98
    1744:	77656e2f 	strbvc	r6, [r5, -pc, lsr #28]!
    1748:	2f62696c 	svccs	0x0062696c
    174c:	6362696c 	cmnvs	r2, #108, 18	; 0x1b0000
    1750:	63616d2f 	cmnvs	r1, #3008	; 0xbc0
    1754:	656e6968 	strbvs	r6, [lr, #-2408]!	; 0xfffff698
    1758:	6d72612f 	ldfvse	f6, [r2, #-188]!	; 0xffffff44
    175c:	554e4700 	strbpl	r4, [lr, #-1792]	; 0xfffff900
    1760:	20534120 	subscs	r4, r3, r0, lsr #2
    1764:	37322e32 			; <UNDEFINED> instruction: 0x37322e32
    1768:	Address 0x0000000000001768 is out of bounds.


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
  74:	0b002408 	bleq	909c <__bss_end__+0x580>
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
  c4:	49002606 	stmdbmi	r0, {r1, r2, r9, sl, sp}
  c8:	07000013 	smladeq	r0, r3, r0, r0
  cc:	0b0b0113 	bleq	2c0520 <_heap+0x24051c>
  d0:	0b3b0b3a 	bleq	ec2dc0 <_heap+0xe42dbc>
  d4:	00001301 	andeq	r1, r0, r1, lsl #6
  d8:	03000d08 	movweq	r0, #3336	; 0xd08
  dc:	3b0b3a0e 	blcc	2ce91c <_heap+0x24e918>
  e0:	3813490b 	ldmdacc	r3, {r0, r1, r3, r8, fp, lr}
  e4:	0900000b 	stmdbeq	r0, {r0, r1, r3}
  e8:	0e030034 	mcreq	0, 0, r0, cr3, cr4, {1}
  ec:	0b3b0b3a 	bleq	ec2ddc <_heap+0xe42dd8>
  f0:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
  f4:	0f0a0000 	svceq	0x000a0000
  f8:	490b0b00 	stmdbmi	fp, {r8, r9, fp}
  fc:	0b000013 	bleq	150 <CPSR_IRQ_INHIBIT+0xd0>
 100:	193f002e 	ldmdbne	pc!, {r1, r2, r3, r5}	; <UNPREDICTABLE>
 104:	0b3a0e03 	bleq	e83918 <_heap+0xe03914>
 108:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 10c:	06120111 			; <UNDEFINED> instruction: 0x06120111
 110:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 114:	0c000019 	stceq	0, cr0, [r0], {25}
 118:	193f002e 	ldmdbne	pc!, {r1, r2, r3, r5}	; <UNPREDICTABLE>
 11c:	0b3a0e03 	bleq	e83930 <_heap+0xe0392c>
 120:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 124:	01111349 	tsteq	r1, r9, asr #6
 128:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 12c:	00194297 	mulseq	r9, r7, r2
 130:	11010000 	mrsne	r0, (UNDEF: 1)
 134:	130e2501 	movwne	r2, #58625	; 0xe501
 138:	110e030b 	tstne	lr, fp, lsl #6
 13c:	10061201 	andne	r1, r6, r1, lsl #4
 140:	02000017 	andeq	r0, r0, #23
 144:	0b0b0024 	bleq	2c01dc <_heap+0x2401d8>
 148:	0e030b3e 	vmoveq.16	d3[0], r0
 14c:	16030000 	strne	r0, [r3], -r0
 150:	3a0e0300 	bcc	380d58 <_heap+0x300d54>
 154:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 158:	04000013 	streq	r0, [r0], #-19	; 0xffffffed
 15c:	0b0b0024 	bleq	2c01f4 <_heap+0x2401f0>
 160:	08030b3e 	stmdaeq	r3, {r1, r2, r3, r4, r5, r8, r9, fp}
 164:	35050000 	strcc	r0, [r5, #-0]
 168:	00134900 	andseq	r4, r3, r0, lsl #18
 16c:	01130600 	tsteq	r3, r0, lsl #12
 170:	0b3a0b0b 	bleq	e82da4 <_heap+0xe02da0>
 174:	13010b3b 	movwne	r0, #6971	; 0x1b3b
 178:	0d070000 	stceq	0, cr0, [r7, #-0]
 17c:	3a0e0300 	bcc	380d84 <_heap+0x300d80>
 180:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 184:	000b3813 	andeq	r3, fp, r3, lsl r8
 188:	00340800 	eorseq	r0, r4, r0, lsl #16
 18c:	0b3a0e03 	bleq	e839a0 <_heap+0xe0399c>
 190:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 194:	00001802 	andeq	r1, r0, r2, lsl #16
 198:	0b000f09 	bleq	3dc4 <CPSR_IRQ_INHIBIT+0x3d44>
 19c:	0013490b 	andseq	r4, r3, fp, lsl #18
 1a0:	002e0a00 	eoreq	r0, lr, r0, lsl #20
 1a4:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
 1a8:	0b3b0b3a 	bleq	ec2e98 <_heap+0xe42e94>
 1ac:	01111927 	tsteq	r1, r7, lsr #18
 1b0:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 1b4:	00194297 	mulseq	r9, r7, r2
 1b8:	002e0b00 	eoreq	r0, lr, r0, lsl #22
 1bc:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
 1c0:	0b3b0b3a 	bleq	ec2eb0 <_heap+0xe42eac>
 1c4:	06120111 			; <UNDEFINED> instruction: 0x06120111
 1c8:	42961840 	addsmi	r1, r6, #64, 16	; 0x400000
 1cc:	0c000019 	stceq	0, cr0, [r0], {25}
 1d0:	193f002e 	ldmdbne	pc!, {r1, r2, r3, r5}	; <UNPREDICTABLE>
 1d4:	0b3a0e03 	bleq	e839e8 <_heap+0xe039e4>
 1d8:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 1dc:	01111349 	tsteq	r1, r9, asr #6
 1e0:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 1e4:	00194297 	mulseq	r9, r7, r2
 1e8:	11010000 	mrsne	r0, (UNDEF: 1)
 1ec:	130e2501 	movwne	r2, #58625	; 0xe501
 1f0:	110e030b 	tstne	lr, fp, lsl #6
 1f4:	10061201 	andne	r1, r6, r1, lsl #4
 1f8:	02000017 	andeq	r0, r0, #23
 1fc:	0b0b0024 	bleq	2c0294 <_heap+0x240290>
 200:	0e030b3e 	vmoveq.16	d3[0], r0
 204:	16030000 	strne	r0, [r3], -r0
 208:	3a0e0300 	bcc	380e10 <_heap+0x300e0c>
 20c:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 210:	04000013 	streq	r0, [r0], #-19	; 0xffffffed
 214:	0b0b0024 	bleq	2c02ac <_heap+0x2402a8>
 218:	08030b3e 	stmdaeq	r3, {r1, r2, r3, r4, r5, r8, r9, fp}
 21c:	35050000 	strcc	r0, [r5, #-0]
 220:	00134900 	andseq	r4, r3, r0, lsl #18
 224:	00260600 	eoreq	r0, r6, r0, lsl #12
 228:	00001349 	andeq	r1, r0, r9, asr #6
 22c:	0b011307 	bleq	44e50 <__bss_end__+0x3c334>
 230:	3b0b3a0b 	blcc	2cea64 <_heap+0x24ea60>
 234:	0013010b 	andseq	r0, r3, fp, lsl #2
 238:	000d0800 	andeq	r0, sp, r0, lsl #16
 23c:	0b3a0e03 	bleq	e83a50 <_heap+0xe03a4c>
 240:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 244:	00000b38 	andeq	r0, r0, r8, lsr fp
 248:	49010109 	stmdbmi	r1, {r0, r3, r8}
 24c:	00130113 	andseq	r0, r3, r3, lsl r1
 250:	00210a00 	eoreq	r0, r1, r0, lsl #20
 254:	0b2f1349 	bleq	bc4f80 <_heap+0xb44f7c>
 258:	340b0000 	strcc	r0, [fp], #-0
 25c:	3a0e0300 	bcc	380e64 <_heap+0x300e60>
 260:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 264:	00180213 	andseq	r0, r8, r3, lsl r2
 268:	000f0c00 	andeq	r0, pc, r0, lsl #24
 26c:	13490b0b 	movtne	r0, #39691	; 0x9b0b
 270:	340d0000 	strcc	r0, [sp], #-0
 274:	3a080300 	bcc	200e7c <_heap+0x180e78>
 278:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 27c:	02193f13 	andseq	r3, r9, #19, 30	; 0x4c
 280:	0e000018 	mcreq	0, 0, r0, cr0, cr8, {0}
 284:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 288:	0b3a0e03 	bleq	e83a9c <_heap+0xe03a98>
 28c:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 290:	06120111 			; <UNDEFINED> instruction: 0x06120111
 294:	42961840 	addsmi	r1, r6, #64, 16	; 0x400000
 298:	00130119 	andseq	r0, r3, r9, lsl r1
 29c:	012e0f00 			; <UNDEFINED> instruction: 0x012e0f00
 2a0:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
 2a4:	0b3b0b3a 	bleq	ec2f94 <_heap+0xe42f90>
 2a8:	13491927 	movtne	r1, #39207	; 0x9927
 2ac:	06120111 			; <UNDEFINED> instruction: 0x06120111
 2b0:	42961840 	addsmi	r1, r6, #64, 16	; 0x400000
 2b4:	00130119 	andseq	r0, r3, r9, lsl r1
 2b8:	00051000 	andeq	r1, r5, r0
 2bc:	0b3a0e03 	bleq	e83ad0 <_heap+0xe03acc>
 2c0:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 2c4:	00001802 	andeq	r1, r0, r2, lsl #16
 2c8:	03003411 	movweq	r3, #1041	; 0x411
 2cc:	3b0b3a08 	blcc	2ceaf4 <_heap+0x24eaf0>
 2d0:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 2d4:	12000018 	andne	r0, r0, #24
 2d8:	193f002e 	ldmdbne	pc!, {r1, r2, r3, r5}	; <UNPREDICTABLE>
 2dc:	0b3a0e03 	bleq	e83af0 <_heap+0xe03aec>
 2e0:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 2e4:	01111349 	tsteq	r1, r9, asr #6
 2e8:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 2ec:	00194297 	mulseq	r9, r7, r2
 2f0:	11010000 	mrsne	r0, (UNDEF: 1)
 2f4:	130e2501 	movwne	r2, #58625	; 0xe501
 2f8:	110e030b 	tstne	lr, fp, lsl #6
 2fc:	10061201 	andne	r1, r6, r1, lsl #4
 300:	02000017 	andeq	r0, r0, #23
 304:	0b0b0024 	bleq	2c039c <_heap+0x240398>
 308:	08030b3e 	stmdaeq	r3, {r1, r2, r3, r4, r5, r8, r9, fp}
 30c:	24030000 	strcs	r0, [r3], #-0
 310:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 314:	000e030b 	andeq	r0, lr, fp, lsl #6
 318:	00160400 	andseq	r0, r6, r0, lsl #8
 31c:	0b3a0e03 	bleq	e83b30 <_heap+0xe03b2c>
 320:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 324:	16050000 	strne	r0, [r5], -r0
 328:	3a0e0300 	bcc	380f30 <_heap+0x300f2c>
 32c:	49053b0b 	stmdbmi	r5, {r0, r1, r3, r8, r9, fp, ip, sp}
 330:	06000013 			; <UNDEFINED> instruction: 0x06000013
 334:	0b0b0117 	bleq	2c0798 <_heap+0x240794>
 338:	0b3b0b3a 	bleq	ec3028 <_heap+0xe43024>
 33c:	00001301 	andeq	r1, r0, r1, lsl #6
 340:	03000d07 	movweq	r0, #3335	; 0xd07
 344:	3b0b3a0e 	blcc	2ceb84 <_heap+0x24eb80>
 348:	0013490b 	andseq	r4, r3, fp, lsl #18
 34c:	01010800 	tsteq	r1, r0, lsl #16
 350:	13011349 	movwne	r1, #4937	; 0x1349
 354:	21090000 	mrscs	r0, (UNDEF: 9)
 358:	2f134900 	svccs	0x00134900
 35c:	0a00000b 	beq	390 <CPSR_IRQ_INHIBIT+0x310>
 360:	0b0b0113 	bleq	2c07b4 <_heap+0x2407b0>
 364:	0b3b0b3a 	bleq	ec3054 <_heap+0xe43050>
 368:	00001301 	andeq	r1, r0, r1, lsl #6
 36c:	03000d0b 	movweq	r0, #3339	; 0xd0b
 370:	3b0b3a0e 	blcc	2cebb0 <_heap+0x24ebac>
 374:	3813490b 	ldmdacc	r3, {r0, r1, r3, r8, fp, lr}
 378:	0c00000b 	stceq	0, cr0, [r0], {11}
 37c:	0b0b000f 	bleq	2c03c0 <_heap+0x2403bc>
 380:	0f0d0000 	svceq	0x000d0000
 384:	490b0b00 	stmdbmi	fp, {r8, r9, fp}
 388:	0e000013 	mcreq	0, 0, r0, cr0, cr3, {0}
 38c:	13490026 	movtne	r0, #36902	; 0x9026
 390:	130f0000 	movwne	r0, #61440	; 0xf000
 394:	0b0e0301 	bleq	380fa0 <_heap+0x300f9c>
 398:	3b0b3a0b 	blcc	2cebcc <_heap+0x24ebc8>
 39c:	0013010b 	andseq	r0, r3, fp, lsl #2
 3a0:	000d1000 	andeq	r1, sp, r0
 3a4:	0b3a0803 	bleq	e823b8 <_heap+0xe023b4>
 3a8:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 3ac:	00000b38 	andeq	r0, r0, r8, lsr fp
 3b0:	03011311 	movweq	r1, #4881	; 0x1311
 3b4:	3a050b0e 	bcc	142ff4 <_heap+0xc2ff0>
 3b8:	010b3b0b 	tsteq	fp, fp, lsl #22
 3bc:	12000013 	andne	r0, r0, #19
 3c0:	0e03000d 	cdpeq	0, 0, cr0, cr3, cr13, {0}
 3c4:	0b3b0b3a 	bleq	ec30b4 <_heap+0xe430b0>
 3c8:	05381349 	ldreq	r1, [r8, #-841]!	; 0xfffffcb7
 3cc:	15130000 	ldrne	r0, [r3, #-0]
 3d0:	00192700 	andseq	r2, r9, r0, lsl #14
 3d4:	01151400 	tsteq	r5, r0, lsl #8
 3d8:	13491927 	movtne	r1, #39207	; 0x9927
 3dc:	00001301 	andeq	r1, r0, r1, lsl #6
 3e0:	49000515 	stmdbmi	r0, {r0, r2, r4, r8, sl}
 3e4:	16000013 			; <UNDEFINED> instruction: 0x16000013
 3e8:	0e030113 	mcreq	1, 0, r0, cr3, cr3, {0}
 3ec:	0b3a050b 	bleq	e81820 <_heap+0xe0181c>
 3f0:	1301053b 	movwne	r0, #5435	; 0x153b
 3f4:	0d170000 	ldceq	0, cr0, [r7, #-0]
 3f8:	3a0e0300 	bcc	381000 <_heap+0x300ffc>
 3fc:	49053b0b 	stmdbmi	r5, {r0, r1, r3, r8, r9, fp, ip, sp}
 400:	000b3813 	andeq	r3, fp, r3, lsl r8
 404:	000d1800 	andeq	r1, sp, r0, lsl #16
 408:	0b3a0e03 	bleq	e83c1c <_heap+0xe03c18>
 40c:	1349053b 	movtne	r0, #38203	; 0x953b
 410:	00000538 	andeq	r0, r0, r8, lsr r5
 414:	03011319 	movweq	r1, #4889	; 0x1319
 418:	3a0b0b0e 	bcc	2c3058 <_heap+0x243054>
 41c:	01053b0b 	tsteq	r5, fp, lsl #22
 420:	1a000013 	bne	474 <CPSR_IRQ_INHIBIT+0x3f4>
 424:	0b0b0113 	bleq	2c0878 <_heap+0x240874>
 428:	053b0b3a 	ldreq	r0, [fp, #-2874]!	; 0xfffff4c6
 42c:	00001301 	andeq	r1, r0, r1, lsl #6
 430:	0b01171b 	bleq	460a4 <__bss_end__+0x3d588>
 434:	3b0b3a0b 	blcc	2cec68 <_heap+0x24ec64>
 438:	00130105 	andseq	r0, r3, r5, lsl #2
 43c:	000d1c00 	andeq	r1, sp, r0, lsl #24
 440:	0b3a0e03 	bleq	e83c54 <_heap+0xe03c50>
 444:	1349053b 	movtne	r0, #38203	; 0x953b
 448:	151d0000 	ldrne	r0, [sp, #-0]
 44c:	01192701 	tsteq	r9, r1, lsl #14
 450:	1e000013 	mcrne	0, 0, r0, cr0, cr3, {0}
 454:	0e030034 	mcreq	0, 0, r0, cr3, cr4, {1}
 458:	053b0b3a 	ldreq	r0, [fp, #-2874]!	; 0xfffff4c6
 45c:	193f1349 	ldmdbne	pc!, {r0, r3, r6, r8, r9, ip}	; <UNPREDICTABLE>
 460:	0000193c 	andeq	r1, r0, ip, lsr r9
 464:	0300341f 	movweq	r3, #1055	; 0x41f
 468:	3b0b3a0e 	blcc	2ceca8 <_heap+0x24eca4>
 46c:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 470:	20000018 	andcs	r0, r0, r8, lsl r0
 474:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 478:	0b3a0e03 	bleq	e83c8c <_heap+0xe03c88>
 47c:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 480:	01111349 	tsteq	r1, r9, asr #6
 484:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 488:	00194296 	mulseq	r9, r6, r2
 48c:	11010000 	mrsne	r0, (UNDEF: 1)
 490:	130e2501 	movwne	r2, #58625	; 0xe501
 494:	110e030b 	tstne	lr, fp, lsl #6
 498:	10061201 	andne	r1, r6, r1, lsl #4
 49c:	02000017 	andeq	r0, r0, #23
 4a0:	0b0b0024 	bleq	2c0538 <_heap+0x240534>
 4a4:	0e030b3e 	vmoveq.16	d3[0], r0
 4a8:	24030000 	strcs	r0, [r3], #-0
 4ac:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 4b0:	0008030b 	andeq	r0, r8, fp, lsl #6
 4b4:	012e0400 			; <UNDEFINED> instruction: 0x012e0400
 4b8:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
 4bc:	0b3b0b3a 	bleq	ec31ac <_heap+0xe431a8>
 4c0:	01111927 	tsteq	r1, r7, lsr #18
 4c4:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 4c8:	00194296 	mulseq	r9, r6, r2
 4cc:	00050500 	andeq	r0, r5, r0, lsl #10
 4d0:	0b3a0803 	bleq	e824e4 <_heap+0xe024e0>
 4d4:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 4d8:	00001802 	andeq	r1, r0, r2, lsl #16
 4dc:	03000506 	movweq	r0, #1286	; 0x506
 4e0:	3b0b3a0e 	blcc	2ced20 <_heap+0x24ed1c>
 4e4:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 4e8:	00000018 	andeq	r0, r0, r8, lsl r0
 4ec:	25011101 	strcs	r1, [r1, #-257]	; 0xfffffeff
 4f0:	030b130e 	movweq	r1, #45838	; 0xb30e
 4f4:	1201110e 	andne	r1, r1, #-2147483645	; 0x80000003
 4f8:	00171006 	andseq	r1, r7, r6
 4fc:	00240200 	eoreq	r0, r4, r0, lsl #4
 500:	0b3e0b0b 	bleq	f83134 <_heap+0xf03130>
 504:	00000e03 	andeq	r0, r0, r3, lsl #28
 508:	0b002403 	bleq	951c <__bss_end__+0xa00>
 50c:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 510:	04000008 	streq	r0, [r0], #-8
 514:	0b0b0113 	bleq	2c0968 <_heap+0x240964>
 518:	0b3b0b3a 	bleq	ec3208 <_heap+0xe43204>
 51c:	00001301 	andeq	r1, r0, r1, lsl #6
 520:	03000d05 	movweq	r0, #3333	; 0xd05
 524:	3b0b3a0e 	blcc	2ced64 <_heap+0x24ed60>
 528:	3813490b 	ldmdacc	r3, {r0, r1, r3, r8, fp, lr}
 52c:	0600000b 	streq	r0, [r0], -fp
 530:	13490101 	movtne	r0, #37121	; 0x9101
 534:	00001301 	andeq	r1, r0, r1, lsl #6
 538:	49002107 	stmdbmi	r0, {r0, r1, r2, r8, sp}
 53c:	000b2f13 	andeq	r2, fp, r3, lsl pc
 540:	00260800 	eoreq	r0, r6, r0, lsl #16
 544:	00001349 	andeq	r1, r0, r9, asr #6
 548:	03001609 	movweq	r1, #1545	; 0x609
 54c:	3b0b3a0e 	blcc	2ced8c <_heap+0x24ed88>
 550:	0013490b 	andseq	r4, r3, fp, lsl #18
 554:	012e0a00 			; <UNDEFINED> instruction: 0x012e0a00
 558:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
 55c:	0b3b0b3a 	bleq	ec324c <_heap+0xe43248>
 560:	13491927 	movtne	r1, #39207	; 0x9927
 564:	06120111 			; <UNDEFINED> instruction: 0x06120111
 568:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 56c:	00130119 	andseq	r0, r3, r9, lsl r1
 570:	00050b00 	andeq	r0, r5, r0, lsl #22
 574:	0b3a0803 	bleq	e82588 <_heap+0xe02584>
 578:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 57c:	00001802 	andeq	r1, r0, r2, lsl #16
 580:	0300050c 	movweq	r0, #1292	; 0x50c
 584:	3b0b3a0e 	blcc	2cedc4 <_heap+0x24edc0>
 588:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 58c:	0d000018 	stceq	0, cr0, [r0, #-96]	; 0xffffffa0
 590:	08030034 	stmdaeq	r3, {r2, r4, r5}
 594:	0b3b0b3a 	bleq	ec3284 <_heap+0xe43280>
 598:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 59c:	0f0e0000 	svceq	0x000e0000
 5a0:	490b0b00 	stmdbmi	fp, {r8, r9, fp}
 5a4:	0f000013 	svceq	0x00000013
 5a8:	00000026 	andeq	r0, r0, r6, lsr #32
 5ac:	0b000f10 	bleq	41f4 <CPSR_IRQ_INHIBIT+0x4174>
 5b0:	1100000b 	tstne	r0, fp
 5b4:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 5b8:	0b3a0e03 	bleq	e83dcc <_heap+0xe03dc8>
 5bc:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 5c0:	06120111 			; <UNDEFINED> instruction: 0x06120111
 5c4:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 5c8:	00000019 	andeq	r0, r0, r9, lsl r0
 5cc:	10001101 	andne	r1, r0, r1, lsl #2
 5d0:	12011106 	andne	r1, r1, #-2147483647	; 0x80000001
 5d4:	1b080301 	blne	2011e0 <_heap+0x1811dc>
 5d8:	13082508 	movwne	r2, #34056	; 0x8508
 5dc:	00000005 	andeq	r0, r0, r5
 5e0:	10001101 	andne	r1, r0, r1, lsl #2
 5e4:	12011106 	andne	r1, r1, #-2147483647	; 0x80000001
 5e8:	1b080301 	blne	2011f4 <_heap+0x1811f0>
 5ec:	13082508 	movwne	r2, #34056	; 0x8508
 5f0:	00000005 	andeq	r0, r0, r5

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
 15c:	4b011003 	blmi	44170 <__bss_end__+0x3b654>
 160:	024ca14b 	subeq	sl, ip, #-1073741806	; 0xc0000012
 164:	01010008 	tsteq	r1, r8
 168:	0000011d 	andeq	r0, r0, sp, lsl r1
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
 27c:	2f67820b 	svccs	0x0067820b
 280:	30661c03 	rsbcc	r1, r6, r3, lsl #24
 284:	01000602 	tsteq	r0, r2, lsl #12
 288:	00017001 	andeq	r7, r1, r1
 28c:	fb000200 	blx	a96 <CPSR_IRQ_INHIBIT+0xa16>
 290:	02000000 	andeq	r0, r0, #0
 294:	0d0efb01 	vstreq	d15, [lr, #-4]
 298:	01010100 	mrseq	r0, (UNDEF: 17)
 29c:	00000001 	andeq	r0, r0, r1
 2a0:	01000001 	tsteq	r0, r1
 2a4:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; 1f0 <CPSR_IRQ_INHIBIT+0x170>
 2a8:	62612f65 	rsbvs	r2, r1, #404	; 0x194
 2ac:	616b6964 	cmnvs	fp, r4, ror #18
 2b0:	2f6d6972 	svccs	0x006d6972
 2b4:	2f766564 	svccs	0x00766564
 2b8:	694c794d 	stmdbvs	ip, {r0, r2, r3, r6, r8, fp, ip, sp, lr}^
 2bc:	656c7474 	strbvs	r7, [ip, #-1140]!	; 0xfffffb8c
 2c0:	732f534f 			; <UNDEFINED> instruction: 0x732f534f
 2c4:	2f006372 	svccs	0x00006372
 2c8:	2f727375 	svccs	0x00727375
 2cc:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 2d0:	2f656475 	svccs	0x00656475
 2d4:	6c77656e 	cfldr64vs	mvdx6, [r7], #-440	; 0xfffffe48
 2d8:	6d2f6269 	sfmvs	f6, 4, [pc, #-420]!	; 13c <CPSR_IRQ_INHIBIT+0xbc>
 2dc:	69686361 	stmdbvs	r8!, {r0, r5, r6, r8, r9, sp, lr}^
 2e0:	2f00656e 	svccs	0x0000656e
 2e4:	2f727375 	svccs	0x00727375
 2e8:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 2ec:	2f656475 	svccs	0x00656475
 2f0:	6c77656e 	cfldr64vs	mvdx6, [r7], #-440	; 0xfffffe48
 2f4:	732f6269 			; <UNDEFINED> instruction: 0x732f6269
 2f8:	2f007379 	svccs	0x00007379
 2fc:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
 300:	6462612f 	strbtvs	r6, [r2], #-303	; 0xfffffed1
 304:	72616b69 	rsbvc	r6, r1, #107520	; 0x1a400
 308:	642f6d69 	strtvs	r6, [pc], #-3433	; 310 <CPSR_IRQ_INHIBIT+0x290>
 30c:	4d2f7665 	stcmi	6, cr7, [pc, #-404]!	; 180 <CPSR_IRQ_INHIBIT+0x100>
 310:	74694c79 	strbtvc	r4, [r9], #-3193	; 0xfffff387
 314:	4f656c74 	svcmi	0x00656c74
 318:	72732f53 	rsbsvc	r2, r3, #332	; 0x14c
 31c:	2e2e2f63 	cdpcs	15, 2, cr2, cr14, cr3, {3}
 320:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 324:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0xfffffa94
 328:	70720000 	rsbsvc	r0, r2, r0
 32c:	61752d69 	cmnvs	r5, r9, ror #26
 330:	632e7472 			; <UNDEFINED> instruction: 0x632e7472
 334:	00000100 	andeq	r0, r0, r0, lsl #2
 338:	6665645f 			; <UNDEFINED> instruction: 0x6665645f
 33c:	746c7561 	strbtvc	r7, [ip], #-1377	; 0xfffffa9f
 340:	7079745f 	rsbsvc	r7, r9, pc, asr r4
 344:	682e7365 	stmdavs	lr!, {r0, r2, r5, r6, r8, r9, ip, sp, lr}
 348:	00000200 	andeq	r0, r0, r0, lsl #4
 34c:	6474735f 	ldrbtvs	r7, [r4], #-863	; 0xfffffca1
 350:	2e746e69 	cdpcs	14, 7, cr6, cr4, cr9, {3}
 354:	00030068 	andeq	r0, r3, r8, rrx
 358:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
 35c:	7361622d 	cmnvc	r1, #-805306366	; 0xd0000002
 360:	00682e65 	rsbeq	r2, r8, r5, ror #28
 364:	72000004 	andvc	r0, r0, #4
 368:	752d6970 	strvc	r6, [sp, #-2416]!	; 0xfffff690
 36c:	2e747261 	cdpcs	2, 7, cr7, cr4, cr1, {3}
 370:	00040068 	andeq	r0, r4, r8, rrx
 374:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
 378:	6970672d 	ldmdbvs	r0!, {r0, r2, r3, r5, r8, r9, sl, sp, lr}^
 37c:	00682e6f 	rsbeq	r2, r8, pc, ror #28
 380:	66000004 	strvs	r0, [r0], -r4
 384:	2e6f6669 	cdpcs	6, 6, cr6, cr15, cr9, {3}
 388:	00040068 	andeq	r0, r4, r8, rrx
 38c:	05000000 	streq	r0, [r0, #-0]
 390:	0081ec02 	addeq	lr, r1, r2, lsl #24
 394:	01160300 	tsteq	r6, r0, lsl #6
 398:	4ba14b4b 	blmi	fe8530cc <_heap+0xfe7d30c8>
 39c:	4b67a14b 	blmi	19e88d0 <_heap+0x19688cc>
 3a0:	6767a04c 	strbvs	sl, [r7, -ip, asr #32]!
 3a4:	83686767 	cmnhi	r8, #27000832	; 0x19c0000
 3a8:	9f9f9f9f 	svcls	0x009f9f9f
 3ac:	02006985 	andeq	r6, r0, #2179072	; 0x214000
 3b0:	82060304 	andhi	r0, r6, #4, 6	; 0x10000000
 3b4:	01040200 	mrseq	r0, R12_usr
 3b8:	6985069e 	stmibvs	r5, {r1, r2, r3, r4, r7, r9, sl}
 3bc:	03040200 	movweq	r0, #16896	; 0x4200
 3c0:	02008206 	andeq	r8, r0, #1610612736	; 0x60000000
 3c4:	069e0104 	ldreq	r0, [lr], r4, lsl #2
 3c8:	4d696985 			; <UNDEFINED> instruction: 0x4d696985
 3cc:	509fbd67 	addspl	fp, pc, r7, ror #26
 3d0:	6c684c4c 	stclvs	12, cr4, [r8], #-304	; 0xfffffed0
 3d4:	0200d7a0 	andeq	sp, r0, #160, 14	; 0x2800000
 3d8:	75030204 	strvc	r0, [r3, #-516]	; 0xfffffdfc
 3dc:	04020066 	streq	r0, [r2], #-102	; 0xffffff9a
 3e0:	06660601 	strbteq	r0, [r6], -r1, lsl #12
 3e4:	a0820f03 	addge	r0, r2, r3, lsl #30
 3e8:	9f9f692f 	svcls	0x009f692f
 3ec:	a04f6785 	subge	r6, pc, r5, lsl #15
 3f0:	68a16769 	stmiavs	r1!, {r0, r3, r5, r6, r8, r9, sl, sp, lr}
 3f4:	a1a0a3a2 	lsrge	sl, r2, #7
 3f8:	01000802 	tsteq	r0, r2, lsl #16
 3fc:	0000d101 	andeq	sp, r0, r1, lsl #2
 400:	af000200 	svcge	0x00000200
 404:	02000000 	andeq	r0, r0, #0
 408:	0d0efb01 	vstreq	d15, [lr, #-4]
 40c:	01010100 	mrseq	r0, (UNDEF: 17)
 410:	00000001 	andeq	r0, r0, r1
 414:	01000001 	tsteq	r0, r1
 418:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; 364 <CPSR_IRQ_INHIBIT+0x2e4>
 41c:	62612f65 	rsbvs	r2, r1, #404	; 0x194
 420:	616b6964 	cmnvs	fp, r4, ror #18
 424:	2f6d6972 	svccs	0x006d6972
 428:	2f766564 	svccs	0x00766564
 42c:	694c794d 	stmdbvs	ip, {r0, r2, r3, r6, r8, fp, ip, sp, lr}^
 430:	656c7474 	strbvs	r7, [ip, #-1140]!	; 0xfffffb8c
 434:	732f534f 			; <UNDEFINED> instruction: 0x732f534f
 438:	2f006372 	svccs	0x00006372
 43c:	2f727375 	svccs	0x00727375
 440:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 444:	2f656475 	svccs	0x00656475
 448:	6c77656e 	cfldr64vs	mvdx6, [r7], #-440	; 0xfffffe48
 44c:	732f6269 			; <UNDEFINED> instruction: 0x732f6269
 450:	2f007379 	svccs	0x00007379
 454:	2f727375 	svccs	0x00727375
 458:	2f62696c 	svccs	0x0062696c
 45c:	2f636367 	svccs	0x00636367
 460:	2d6d7261 	sfmcs	f7, 2, [sp, #-388]!	; 0xfffffe7c
 464:	656e6f6e 	strbvs	r6, [lr, #-3950]!	; 0xfffff092
 468:	6261652d 	rsbvs	r6, r1, #188743680	; 0xb400000
 46c:	2e362f69 	cdpcs	15, 3, cr2, cr6, cr9, {3}
 470:	2f312e33 	svccs	0x00312e33
 474:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 478:	00656475 	rsbeq	r6, r5, r5, ror r4
 47c:	65687300 	strbvs	r7, [r8, #-768]!	; 0xfffffd00
 480:	632e6c6c 			; <UNDEFINED> instruction: 0x632e6c6c
 484:	00000100 	andeq	r0, r0, r0, lsl #2
 488:	6b636f6c 	blvs	18dc240 <_heap+0x185c23c>
 48c:	0200682e 	andeq	r6, r0, #3014656	; 0x2e0000
 490:	745f0000 	ldrbvc	r0, [pc], #-0	; 498 <CPSR_IRQ_INHIBIT+0x418>
 494:	73657079 	cmnvc	r5, #121	; 0x79
 498:	0200682e 	andeq	r6, r0, #3014656	; 0x2e0000
 49c:	74730000 	ldrbtvc	r0, [r3], #-0
 4a0:	66656464 	strbtvs	r6, [r5], -r4, ror #8
 4a4:	0300682e 	movweq	r6, #2094	; 0x82e
 4a8:	65720000 	ldrbvs	r0, [r2, #-0]!
 4ac:	2e746e65 	cdpcs	14, 7, cr6, cr4, cr5, {3}
 4b0:	00020068 	andeq	r0, r2, r8, rrx
 4b4:	05000000 	streq	r0, [r0, #-0]
 4b8:	00858c02 	addeq	r8, r5, r2, lsl #24
 4bc:	010a0300 	mrseq	r0, (UNDEF: 58)
 4c0:	884c846d 	stmdahi	ip, {r0, r2, r3, r5, r6, sl, pc}^
 4c4:	4cc1d430 	cfstrdmi	mvd13, [r1], {48}	; 0x30
 4c8:	7303a0bc 	movwvc	sl, #12476	; 0x30bc
 4cc:	00080282 	andeq	r0, r8, r2, lsl #5
 4d0:	00660101 	rsbeq	r0, r6, r1, lsl #2
 4d4:	00020000 	andeq	r0, r2, r0
 4d8:	00000046 	andeq	r0, r0, r6, asr #32
 4dc:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 4e0:	0101000d 	tsteq	r1, sp
 4e4:	00000101 	andeq	r0, r0, r1, lsl #2
 4e8:	00000100 	andeq	r0, r0, r0, lsl #2
 4ec:	6f682f01 	svcvs	0x00682f01
 4f0:	612f656d 			; <UNDEFINED> instruction: 0x612f656d
 4f4:	6b696462 	blvs	1a59684 <_heap+0x19d9680>
 4f8:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
 4fc:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
 500:	4c794d2f 	ldclmi	13, cr4, [r9], #-188	; 0xffffff44
 504:	6c747469 	cfldrdvs	mvd7, [r4], #-420	; 0xfffffe5c
 508:	2f534f65 	svccs	0x00534f65
 50c:	00637273 	rsbeq	r7, r3, r3, ror r2
 510:	72617500 	rsbvc	r7, r1, #0, 10
 514:	72654b74 	rsbvc	r4, r5, #116, 22	; 0x1d000
 518:	2e6c656e 	cdpcs	5, 6, cr6, cr12, cr14, {3}
 51c:	00010063 	andeq	r0, r1, r3, rrx
 520:	05000000 	streq	r0, [r0, #-0]
 524:	00864c02 	addeq	r4, r6, r2, lsl #24
 528:	01120300 	tsteq	r2, r0, lsl #6
 52c:	34ba2403 	ldrtcc	r2, [sl], #1027	; 0x403
 530:	020033a1 	andeq	r3, r0, #-2080374782	; 0x84000002
 534:	02300104 	eorseq	r0, r0, #4, 2
 538:	01010002 	tsteq	r1, r2
 53c:	000000d4 	ldrdeq	r0, [r0], -r4
 540:	00780002 	rsbseq	r0, r8, r2
 544:	01020000 	mrseq	r0, (UNDEF: 2)
 548:	000d0efb 	strdeq	r0, [sp], -fp
 54c:	01010101 	tsteq	r1, r1, lsl #2
 550:	01000000 	mrseq	r0, (UNDEF: 0)
 554:	2f010000 	svccs	0x00010000
 558:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
 55c:	6462612f 	strbtvs	r6, [r2], #-303	; 0xfffffed1
 560:	72616b69 	rsbvc	r6, r1, #107520	; 0x1a400
 564:	642f6d69 	strtvs	r6, [pc], #-3433	; 56c <CPSR_IRQ_INHIBIT+0x4ec>
 568:	4d2f7665 	stcmi	6, cr7, [pc, #-404]!	; 3dc <CPSR_IRQ_INHIBIT+0x35c>
 56c:	74694c79 	strbtvc	r4, [r9], #-3193	; 0xfffff387
 570:	4f656c74 	svcmi	0x00656c74
 574:	696c2f53 	stmdbvs	ip!, {r0, r1, r4, r6, r8, r9, sl, fp, sp}^
 578:	682f0062 	stmdavs	pc!, {r1, r5, r6}	; <UNPREDICTABLE>
 57c:	2f656d6f 	svccs	0x00656d6f
 580:	69646261 	stmdbvs	r4!, {r0, r5, r6, r9, sp, lr}^
 584:	6972616b 	ldmdbvs	r2!, {r0, r1, r3, r5, r6, r8, sp, lr}^
 588:	65642f6d 	strbvs	r2, [r4, #-3949]!	; 0xfffff093
 58c:	794d2f76 	stmdbvc	sp, {r1, r2, r4, r5, r6, r8, r9, sl, fp, sp}^
 590:	7474694c 	ldrbtvc	r6, [r4], #-2380	; 0xfffff6b4
 594:	534f656c 	movtpl	r6, #62828	; 0xf56c
 598:	62696c2f 	rsbvs	r6, r9, #12032	; 0x2f00
 59c:	2f2e2e2f 	svccs	0x002e2e2f
 5a0:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 5a4:	00656475 	rsbeq	r6, r5, r5, ror r4
 5a8:	66696600 	strbtvs	r6, [r9], -r0, lsl #12
 5ac:	00632e6f 	rsbeq	r2, r3, pc, ror #28
 5b0:	66000001 	strvs	r0, [r0], -r1
 5b4:	2e6f6669 	cdpcs	6, 6, cr6, cr15, cr9, {3}
 5b8:	00020068 	andeq	r0, r2, r8, rrx
 5bc:	05000000 	streq	r0, [r0, #-0]
 5c0:	00868802 	addeq	r8, r6, r2, lsl #16
 5c4:	010a0300 	mrseq	r0, (UNDEF: 58)
 5c8:	67676783 	strbvs	r6, [r7, -r3, lsl #15]!
 5cc:	694cbd87 	stmdbvs	ip, {r0, r1, r2, r7, r8, sl, fp, ip, sp, pc}^
 5d0:	bc9ff3bc 	ldclt	3, cr15, [pc], {188}	; 0xbc
 5d4:	02008468 	andeq	r8, r0, #104, 8	; 0x68000000
 5d8:	73030204 	movwvc	r0, #12804	; 0x3204
 5dc:	0402004a 	streq	r0, [r2], #-74	; 0xffffffb6
 5e0:	06660601 	strbteq	r0, [r6], -r1, lsl #12
 5e4:	2f821103 	svccs	0x00821103
 5e8:	694cbd87 	stmdbvs	ip, {r0, r1, r2, r7, r8, sl, fp, ip, sp, pc}^
 5ec:	01040200 	mrseq	r0, R12_usr
 5f0:	0200d606 	andeq	sp, r0, #6291456	; 0x600000
 5f4:	06d60204 	ldrbeq	r0, [r6], r4, lsl #4
 5f8:	9ff34c84 	svcls	0x00f34c84
 5fc:	040200bc 	streq	r0, [r2], #-188	; 0xffffff44
 600:	66750302 	ldrbtvs	r0, [r5], -r2, lsl #6
 604:	01040200 	mrseq	r0, R12_usr
 608:	03066606 	movweq	r6, #26118	; 0x6606
 60c:	022f8210 	eoreq	r8, pc, #16, 4
 610:	01010008 	tsteq	r1, r8
 614:	00000075 	andeq	r0, r0, r5, ror r0
 618:	00410002 	subeq	r0, r1, r2
 61c:	01020000 	mrseq	r0, (UNDEF: 2)
 620:	000d0efb 	strdeq	r0, [sp], -fp
 624:	01010101 	tsteq	r1, r1, lsl #2
 628:	01000000 	mrseq	r0, (UNDEF: 0)
 62c:	2f010000 	svccs	0x00010000
 630:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
 634:	6462612f 	strbtvs	r6, [r2], #-303	; 0xfffffed1
 638:	72616b69 	rsbvc	r6, r1, #107520	; 0x1a400
 63c:	642f6d69 	strtvs	r6, [pc], #-3433	; 644 <CPSR_IRQ_INHIBIT+0x5c4>
 640:	4d2f7665 	stcmi	6, cr7, [pc, #-404]!	; 4b4 <CPSR_IRQ_INHIBIT+0x434>
 644:	74694c79 	strbtvc	r4, [r9], #-3193	; 0xfffff387
 648:	4f656c74 	svcmi	0x00656c74
 64c:	72732f53 	rsbsvc	r2, r3, #332	; 0x14c
 650:	73000063 	movwvc	r0, #99	; 0x63
 654:	74726174 	ldrbtvc	r6, [r2], #-372	; 0xfffffe8c
 658:	0100732e 	tsteq	r0, lr, lsr #6
 65c:	00000000 	andeq	r0, r0, r0
 660:	80000205 	andhi	r0, r0, r5, lsl #4
 664:	16030000 	strne	r0, [r3], -r0
 668:	2f2f2f01 	svccs	0x002f2f01
 66c:	2f2f2f2f 	svccs	0x002f2f2f
 670:	20080f03 	andcs	r0, r8, r3, lsl #30
 674:	2f2f2f2f 	svccs	0x002f2f2f
 678:	2f2f322f 	svccs	0x002f322f
 67c:	31352f34 	teqcc	r5, r4, lsr pc
 680:	312f3331 			; <UNDEFINED> instruction: 0x312f3331
 684:	302f2f31 	eorcc	r2, pc, r1, lsr pc	; <UNPREDICTABLE>
 688:	01000202 	tsteq	r0, r2, lsl #4
 68c:	0000f801 	andeq	pc, r0, r1, lsl #16
 690:	52000200 	andpl	r0, r0, #0, 4
 694:	02000000 	andeq	r0, r0, #0
 698:	0d0efb01 	vstreq	d15, [lr, #-4]
 69c:	01010100 	mrseq	r0, (UNDEF: 17)
 6a0:	00000001 	andeq	r0, r0, r1
 6a4:	01000001 	tsteq	r0, r1
 6a8:	2e2f2e2e 	cdpcs	14, 2, cr2, cr15, cr14, {1}
 6ac:	2e2e2f2e 	cdpcs	15, 2, cr2, cr14, cr14, {1}
 6b0:	2f2e2e2f 	svccs	0x002e2e2f
 6b4:	2e2f2e2e 	cdpcs	14, 2, cr2, cr15, cr14, {1}
 6b8:	2e2e2f2e 	cdpcs	15, 2, cr2, cr14, cr14, {1}
 6bc:	77656e2f 	strbvc	r6, [r5, -pc, lsr #28]!
 6c0:	2f62696c 	svccs	0x0062696c
 6c4:	6362696c 	cmnvs	r2, #108, 18	; 0x1b0000
 6c8:	63616d2f 	cmnvs	r1, #3008	; 0xbc0
 6cc:	656e6968 	strbvs	r6, [lr, #-2408]!	; 0xfffff698
 6d0:	6d72612f 	ldfvse	f6, [r2, #-188]!	; 0xffffff44
 6d4:	74730000 	ldrbtvc	r0, [r3], #-0
 6d8:	706d6372 	rsbvc	r6, sp, r2, ror r3
 6dc:	6d72612d 	ldfvse	f6, [r2, #-180]!	; 0xffffff4c
 6e0:	532e3476 			; <UNDEFINED> instruction: 0x532e3476
 6e4:	00000100 	andeq	r0, r0, r0, lsl #2
 6e8:	02050000 	andeq	r0, r5, #0
 6ec:	000088b4 			; <UNDEFINED> instruction: 0x000088b4
 6f0:	2f013103 	svccs	0x00013103
 6f4:	2f2f2f30 	svccs	0x002f2f30
 6f8:	342f2f2f 	strtcc	r2, [pc], #-3887	; 700 <CPSR_IRQ_INHIBIT+0x680>
 6fc:	2f2f2f2f 	svccs	0x002f2f2f
 700:	31312f2f 	teqcc	r1, pc, lsr #30
 704:	2f312f2f 	svccs	0x00312f2f
 708:	2f2f2f30 	svccs	0x002f2f30
 70c:	2f2f312f 	svccs	0x002f312f
 710:	032f2f2f 			; <UNDEFINED> instruction: 0x032f2f2f
 714:	302f2e0c 	eorcc	r2, pc, ip, lsl #28
 718:	00e30331 	rsceq	r0, r3, r1, lsr r3
 71c:	2f2f2f2e 	svccs	0x002f2f2e
 720:	2f2f2f2f 	svccs	0x002f2f2f
 724:	2f32312f 	svccs	0x0032312f
 728:	2f2f302f 	svccs	0x002f302f
 72c:	2f2f2f2f 	svccs	0x002f2f2f
 730:	2f2f2f33 	svccs	0x002f2f33
 734:	2f2f2f2f 	svccs	0x002f2f2f
 738:	2f2f2f2f 	svccs	0x002f2f2f
 73c:	032f302f 			; <UNDEFINED> instruction: 0x032f302f
 740:	302f2e0b 	eorcc	r2, pc, fp, lsl #28
 744:	2f31322f 	svccs	0x0031322f
 748:	2f2f332f 	svccs	0x002f332f
 74c:	2f2f2f2f 	svccs	0x002f2f2f
 750:	2f2f2f2f 	svccs	0x002f2f2f
 754:	032f2f2f 			; <UNDEFINED> instruction: 0x032f2f2f
 758:	302f2e0a 	eorcc	r2, pc, sl, lsl #28
 75c:	2f31322f 	svccs	0x0031322f
 760:	2f332f30 	svccs	0x00332f30
 764:	2f2f2f2f 	svccs	0x002f2f2f
 768:	2f2f2f2f 	svccs	0x002f2f2f
 76c:	302f2f2f 	eorcc	r2, pc, pc, lsr #30
 770:	2f2f322f 	svccs	0x002f322f
 774:	302f2f30 	eorcc	r2, pc, r0, lsr pc	; <UNPREDICTABLE>
 778:	2f323230 	svccs	0x00323230
 77c:	2f2f2f2f 	svccs	0x002f2f2f
 780:	322f2f2f 	eorcc	r2, pc, #47, 30	; 0xbc
 784:	01000202 	tsteq	r0, r2, lsl #4
 788:	Address 0x0000000000000788 is out of bounds.


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
  cc:	00000014 	andeq	r0, r0, r4, lsl r0
  d0:	0000007c 	andeq	r0, r0, ip, ror r0
  d4:	00008178 	andeq	r8, r0, r8, ror r1
  d8:	0000000c 	andeq	r0, r0, ip
  dc:	8b040e42 	blhi	1039ec <_heap+0x839e8>
  e0:	0b0d4201 	bleq	3508ec <_heap+0x2d08e8>
  e4:	00000014 	andeq	r0, r0, r4, lsl r0
  e8:	0000007c 	andeq	r0, r0, ip, ror r0
  ec:	00008184 	andeq	r8, r0, r4, lsl #3
  f0:	0000000c 	andeq	r0, r0, ip
  f4:	8b040e42 	blhi	103a04 <_heap+0x83a00>
  f8:	0b0d4201 	bleq	350904 <_heap+0x2d0900>
  fc:	0000001c 	andeq	r0, r0, ip, lsl r0
 100:	0000007c 	andeq	r0, r0, ip, ror r0
 104:	00008190 	muleq	r0, r0, r1
 108:	00000018 	andeq	r0, r0, r8, lsl r0
 10c:	8b040e42 	blhi	103a1c <_heap+0x83a18>
 110:	0b0d4201 	bleq	35091c <_heap+0x2d0918>
 114:	420d0d44 	andmi	r0, sp, #68, 26	; 0x1100
 118:	00000ecb 	andeq	r0, r0, fp, asr #29
 11c:	0000001c 	andeq	r0, r0, ip, lsl r0
 120:	0000007c 	andeq	r0, r0, ip, ror r0
 124:	000081a8 	andeq	r8, r0, r8, lsr #3
 128:	00000018 	andeq	r0, r0, r8, lsl r0
 12c:	8b040e42 	blhi	103a3c <_heap+0x83a38>
 130:	0b0d4201 	bleq	35093c <_heap+0x2d0938>
 134:	420d0d44 	andmi	r0, sp, #68, 26	; 0x1100
 138:	00000ecb 	andeq	r0, r0, fp, asr #29
 13c:	00000028 	andeq	r0, r0, r8, lsr #32
 140:	0000007c 	andeq	r0, r0, ip, ror r0
 144:	000081c0 	andeq	r8, r0, r0, asr #3
 148:	0000001c 	andeq	r0, r0, ip, lsl r0
 14c:	80200e44 	eorhi	r0, r0, r4, asr #28
 150:	82078108 	andhi	r8, r7, #8, 2
 154:	84058306 	strhi	r8, [r5], #-774	; 0xfffffcfa
 158:	8c038b04 			; <UNDEFINED> instruction: 0x8c038b04
 15c:	42018e02 	andmi	r8, r1, #2, 28
 160:	46040b0c 	strmi	r0, [r4], -ip, lsl #22
 164:	00200d0c 	eoreq	r0, r0, ip, lsl #26
 168:	00000014 	andeq	r0, r0, r4, lsl r0
 16c:	0000007c 	andeq	r0, r0, ip, ror r0
 170:	000081dc 	ldrdeq	r8, [r0], -ip
 174:	00000010 	andeq	r0, r0, r0, lsl r0
 178:	040b0c42 	streq	r0, [fp], #-3138	; 0xfffff3be
 17c:	000d0c44 	andeq	r0, sp, r4, asr #24
 180:	0000000c 	andeq	r0, r0, ip
 184:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 188:	7c020001 	stcvc	0, cr0, [r2], {1}
 18c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 190:	0000001c 	andeq	r0, r0, ip, lsl r0
 194:	00000180 	andeq	r0, r0, r0, lsl #3
 198:	000081ec 	andeq	r8, r0, ip, ror #3
 19c:	00000024 	andeq	r0, r0, r4, lsr #32
 1a0:	8b040e42 	blhi	103ab0 <_heap+0x83aac>
 1a4:	0b0d4201 	bleq	3509b0 <_heap+0x2d09ac>
 1a8:	420d0d48 	andmi	r0, sp, #72, 26	; 0x1200
 1ac:	00000ecb 	andeq	r0, r0, fp, asr #29
 1b0:	0000001c 	andeq	r0, r0, ip, lsl r0
 1b4:	00000180 	andeq	r0, r0, r0, lsl #3
 1b8:	00008210 	andeq	r8, r0, r0, lsl r2
 1bc:	00000024 	andeq	r0, r0, r4, lsr #32
 1c0:	8b040e42 	blhi	103ad0 <_heap+0x83acc>
 1c4:	0b0d4201 	bleq	3509d0 <_heap+0x2d09cc>
 1c8:	420d0d48 	andmi	r0, sp, #72, 26	; 0x1200
 1cc:	00000ecb 	andeq	r0, r0, fp, asr #29
 1d0:	0000001c 	andeq	r0, r0, ip, lsl r0
 1d4:	00000180 	andeq	r0, r0, r0, lsl #3
 1d8:	00008234 	andeq	r8, r0, r4, lsr r2
 1dc:	000001a0 	andeq	r0, r0, r0, lsr #3
 1e0:	8b080e42 	blhi	203af0 <_heap+0x183aec>
 1e4:	42018e02 	andmi	r8, r1, #2, 28
 1e8:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
 1ec:	080d0cc4 	stmdaeq	sp, {r2, r6, r7, sl, fp}
 1f0:	0000001c 	andeq	r0, r0, ip, lsl r0
 1f4:	00000180 	andeq	r0, r0, r0, lsl #3
 1f8:	000083d4 	ldrdeq	r8, [r0], -r4
 1fc:	000000c0 	andeq	r0, r0, r0, asr #1
 200:	8b080e42 	blhi	203b10 <_heap+0x183b0c>
 204:	42018e02 	andmi	r8, r1, #2, 28
 208:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
 20c:	080d0c5a 	stmdaeq	sp, {r1, r3, r4, r6, sl, fp}
 210:	0000001c 	andeq	r0, r0, ip, lsl r0
 214:	00000180 	andeq	r0, r0, r0, lsl #3
 218:	00008494 	muleq	r0, r4, r4
 21c:	00000038 	andeq	r0, r0, r8, lsr r0
 220:	8b080e42 	blhi	203b30 <_heap+0x183b2c>
 224:	42018e02 	andmi	r8, r1, #2, 28
 228:	54040b0c 	strpl	r0, [r4], #-2828	; 0xfffff4f4
 22c:	00080d0c 	andeq	r0, r8, ip, lsl #26
 230:	0000001c 	andeq	r0, r0, ip, lsl r0
 234:	00000180 	andeq	r0, r0, r0, lsl #3
 238:	000084cc 	andeq	r8, r0, ip, asr #9
 23c:	000000c0 	andeq	r0, r0, r0, asr #1
 240:	8b080e42 	blhi	203b50 <_heap+0x183b4c>
 244:	42018e02 	andmi	r8, r1, #2, 28
 248:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
 24c:	080d0c58 	stmdaeq	sp, {r3, r4, r6, sl, fp}
 250:	0000000c 	andeq	r0, r0, ip
 254:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 258:	7c020001 	stcvc	0, cr0, [r2], {1}
 25c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 260:	00000018 	andeq	r0, r0, r8, lsl r0
 264:	00000250 	andeq	r0, r0, r0, asr r2
 268:	0000858c 	andeq	r8, r0, ip, lsl #11
 26c:	000000c0 	andeq	r0, r0, r0, asr #1
 270:	8b080e42 	blhi	203b80 <_heap+0x183b7c>
 274:	42018e02 	andmi	r8, r1, #2, 28
 278:	00040b0c 	andeq	r0, r4, ip, lsl #22
 27c:	0000000c 	andeq	r0, r0, ip
 280:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 284:	7c020001 	stcvc	0, cr0, [r2], {1}
 288:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 28c:	00000018 	andeq	r0, r0, r8, lsl r0
 290:	0000027c 	andeq	r0, r0, ip, ror r2
 294:	0000864c 	andeq	r8, r0, ip, asr #12
 298:	0000003c 	andeq	r0, r0, ip, lsr r0
 29c:	8b080e42 	blhi	203bac <_heap+0x183ba8>
 2a0:	42018e02 	andmi	r8, r1, #2, 28
 2a4:	00040b0c 	andeq	r0, r4, ip, lsl #22
 2a8:	0000000c 	andeq	r0, r0, ip
 2ac:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 2b0:	7c020001 	stcvc	0, cr0, [r2], {1}
 2b4:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 2b8:	0000001c 	andeq	r0, r0, ip, lsl r0
 2bc:	000002a8 	andeq	r0, r0, r8, lsr #5
 2c0:	00008688 	andeq	r8, r0, r8, lsl #13
 2c4:	00000044 	andeq	r0, r0, r4, asr #32
 2c8:	8b040e42 	blhi	103bd8 <_heap+0x83bd4>
 2cc:	0b0d4201 	bleq	350ad8 <_heap+0x2d0ad4>
 2d0:	420d0d5a 	andmi	r0, sp, #5760	; 0x1680
 2d4:	00000ecb 	andeq	r0, r0, fp, asr #29
 2d8:	0000001c 	andeq	r0, r0, ip, lsl r0
 2dc:	000002a8 	andeq	r0, r0, r8, lsr #5
 2e0:	000086cc 	andeq	r8, r0, ip, asr #13
 2e4:	000000e4 	andeq	r0, r0, r4, ror #1
 2e8:	8b040e42 	blhi	103bf8 <_heap+0x83bf4>
 2ec:	0b0d4201 	bleq	350af8 <_heap+0x2d0af4>
 2f0:	0d0d6a02 	vstreq	s12, [sp, #-8]
 2f4:	000ecb42 	andeq	ip, lr, r2, asr #22
 2f8:	0000001c 	andeq	r0, r0, ip, lsl r0
 2fc:	000002a8 	andeq	r0, r0, r8, lsr #5
 300:	000087b0 			; <UNDEFINED> instruction: 0x000087b0
 304:	00000104 	andeq	r0, r0, r4, lsl #2
 308:	8b040e42 	blhi	103c18 <_heap+0x83c14>
 30c:	0b0d4201 	bleq	350b18 <_heap+0x2d0b14>
 310:	0d0d7a02 	vstreq	s14, [sp, #-8]
 314:	000ecb42 	andeq	ip, lr, r2, asr #22
 318:	0000000c 	andeq	r0, r0, ip
 31c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 320:	7c020001 	stcvc	0, cr0, [r2], {1}
 324:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 328:	0000002c 	andeq	r0, r0, ip, lsr #32
 32c:	00000318 	andeq	r0, r0, r8, lsl r3
 330:	000088b4 			; <UNDEFINED> instruction: 0x000088b4
 334:	00000224 	andeq	r0, r0, r4, lsr #4
 338:	84040e62 	strhi	r0, [r4], #-3682	; 0xfffff19e
 33c:	0ec46601 	cdpeq	6, 12, cr6, cr4, cr1, {0}
 340:	080e5600 	stmdaeq	lr, {r9, sl, ip, lr}
 344:	01850284 	orreq	r0, r5, r4, lsl #5
 348:	420a9c02 	andmi	r9, sl, #512	; 0x200
 34c:	000ec5c4 	andeq	ip, lr, r4, asr #11
 350:	c4520b42 	ldrbgt	r0, [r2], #-2882	; 0xfffff4be
 354:	00000ec5 	andeq	r0, r0, r5, asr #29

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
 3a8:	616e4500 	cmnvs	lr, r0, lsl #10
 3ac:	5f656c62 	svcpl	0x00656c62
 3b0:	73515249 	cmpvc	r1, #-1879048188	; 0x90000004
 3b4:	4500315f 	strmi	r3, [r0, #-351]	; 0xfffffea1
 3b8:	6c62616e 	stfvse	f6, [r2], #-440	; 0xfffffe48
 3bc:	52495f65 	subpl	r5, r9, #404	; 0x194
 3c0:	325f7351 	subscc	r7, pc, #1140850689	; 0x44000001
 3c4:	73694400 	cmnvc	r9, #0, 8
 3c8:	656c6261 	strbvs	r6, [ip, #-609]!	; 0xfffffd9f
 3cc:	7361425f 	cmnvc	r1, #-268435451	; 0xf0000005
 3d0:	495f6369 	ldmdbmi	pc, {r0, r3, r5, r6, r8, r9, sp, lr}^	; <UNPREDICTABLE>
 3d4:	00735152 	rsbseq	r5, r3, r2, asr r1
 3d8:	65736572 	ldrbvs	r6, [r3, #-1394]!	; 0xfffffa8e
 3dc:	65765f74 	ldrbvs	r5, [r6, #-3956]!	; 0xfffff08c
 3e0:	726f7463 	rsbvc	r7, pc, #1660944384	; 0x63000000
 3e4:	51524900 	cmppl	r2, r0, lsl #18
 3e8:	6e65705f 	mcrvs	0, 3, r7, cr5, cr15, {2}
 3ec:	676e6964 	strbvs	r6, [lr, -r4, ror #18]!
 3f0:	4400325f 	strmi	r3, [r0], #-607	; 0xfffffda1
 3f4:	62617369 	rsbvs	r7, r1, #-1543503871	; 0xa4000001
 3f8:	495f656c 	ldmdbmi	pc, {r2, r3, r5, r6, r8, sl, sp, lr}^	; <UNPREDICTABLE>
 3fc:	5f735152 	svcpl	0x00735152
 400:	6e450031 	mcrvs	0, 2, r0, cr5, cr1, {1}
 404:	656c6261 	strbvs	r6, [ip, #-609]!	; 0xfffffd9f
 408:	7361425f 	cmnvc	r1, #-268435451	; 0xf0000005
 40c:	495f6369 	ldmdbmi	pc, {r0, r3, r5, r6, r8, r9, sp, lr}^	; <UNPREDICTABLE>
 410:	00735152 	rsbseq	r5, r3, r2, asr r1
 414:	5f697072 	svcpl	0x00697072
 418:	5f717269 	svcpl	0x00717269
 41c:	746e6f63 	strbtvc	r6, [lr], #-3939	; 0xfffff09d
 420:	6c6c6f72 	stclvs	15, cr6, [ip], #-456	; 0xfffffe38
 424:	745f7265 	ldrbvc	r7, [pc], #-613	; 42c <CPSR_IRQ_INHIBIT+0x3ac>
 428:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
 42c:	7465475f 	strbtvc	r4, [r5], #-1887	; 0xfffff8a1
 430:	43717249 	cmnmi	r1, #-1879048188	; 0x90000004
 434:	72746e6f 	rsbsvc	r6, r4, #1776	; 0x6f0
 438:	656c6c6f 	strbvs	r6, [ip, #-3183]!	; 0xfffff391
 43c:	61640072 	smcvs	16386	; 0x4002
 440:	615f6174 	cmpvs	pc, r4, ror r1	; <UNPREDICTABLE>
 444:	74726f62 	ldrbtvc	r6, [r2], #-3938	; 0xfffff09e
 448:	6365765f 	cmnvs	r5, #99614720	; 0x5f00000
 44c:	00726f74 	rsbseq	r6, r2, r4, ror pc
 450:	5f515249 	svcpl	0x00515249
 454:	646e6570 	strbtvs	r6, [lr], #-1392	; 0xfffffa90
 458:	5f676e69 	svcpl	0x00676e69
 45c:	52490031 	subpl	r0, r9, #49	; 0x31
 460:	61625f51 	cmnvs	r2, r1, asr pc
 464:	5f636973 	svcpl	0x00636973
 468:	646e6570 	strbtvs	r6, [lr], #-1392	; 0xfffffa90
 46c:	00676e69 	rsbeq	r6, r7, r9, ror #28
 470:	5f585541 	svcpl	0x00585541
 474:	4c5f554d 	cfldr64mi	mvdx5, [pc], {77}	; 0x4d
 478:	525f5253 	subspl	r5, pc, #805306373	; 0x30000005
 47c:	41004745 	tstmi	r0, r5, asr #14
 480:	455f5855 	ldrbmi	r5, [pc, #-2133]	; fffffc33 <_heap+0xfff7fc2f>
 484:	4c42414e 	stfmie	f4, [r2], {78}	; 0x4e
 488:	72005345 	andvc	r5, r0, #335544321	; 0x14000001
 48c:	694d6970 	stmdbvs	sp, {r4, r5, r6, r8, fp, sp, lr}^
 490:	6155696e 	cmpvs	r5, lr, ror #18
 494:	2f007472 	svccs	0x00007472
 498:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
 49c:	6462612f 	strbtvs	r6, [r2], #-303	; 0xfffffed1
 4a0:	72616b69 	rsbvc	r6, r1, #107520	; 0x1a400
 4a4:	642f6d69 	strtvs	r6, [pc], #-3433	; 4ac <CPSR_IRQ_INHIBIT+0x42c>
 4a8:	4d2f7665 	stcmi	6, cr7, [pc, #-404]!	; 31c <CPSR_IRQ_INHIBIT+0x29c>
 4ac:	74694c79 	strbtvc	r4, [r9], #-3193	; 0xfffff387
 4b0:	4f656c74 	svcmi	0x00656c74
 4b4:	72732f53 	rsbsvc	r2, r3, #332	; 0x14c
 4b8:	70722f63 	rsbsvc	r2, r2, r3, ror #30
 4bc:	61752d69 	cmnvs	r5, r9, ror #26
 4c0:	632e7472 			; <UNDEFINED> instruction: 0x632e7472
 4c4:	58554100 	ldmdapl	r5, {r8, lr}^
 4c8:	5f554d5f 	svcpl	0x00554d5f
 4cc:	5f52434d 	svcpl	0x0052434d
 4d0:	00474552 	subeq	r4, r7, r2, asr r5
 4d4:	696e696d 	stmdbvs	lr!, {r0, r2, r3, r5, r6, r8, fp, sp, lr}^
 4d8:	74726155 	ldrbtvc	r6, [r2], #-341	; 0xfffffeab
 4dc:	00676552 	rsbeq	r6, r7, r2, asr r5
 4e0:	64616568 	strbtvs	r6, [r1], #-1384	; 0xfffffa98
 4e4:	636e6900 	cmnvs	lr, #0, 18
 4e8:	6e696d6f 	cdpvs	13, 6, cr6, cr9, cr15, {3}
 4ec:	61645f67 	cmnvs	r4, r7, ror #30
 4f0:	52006174 	andpl	r6, r0, #116, 2
 4f4:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
 4f8:	694d7465 	stmdbvs	sp, {r0, r2, r5, r6, sl, ip, sp, lr}^
 4fc:	6155696e 	cmpvs	r5, lr, ror #18
 500:	52007472 	andpl	r7, r0, #1912602624	; 0x72000000
 504:	575f4950 			; <UNDEFINED> instruction: 0x575f4950
 508:	65746972 	ldrbvs	r6, [r4, #-2418]!	; 0xfffff68e
 50c:	694d6f54 	stmdbvs	sp, {r2, r4, r6, r8, r9, sl, fp, sp, lr}^
 510:	6155696e 	cmpvs	r5, lr, ror #18
 514:	66007472 			; <UNDEFINED> instruction: 0x66007472
 518:	5f6f6669 	svcpl	0x006f6669
 51c:	55410074 	strbpl	r0, [r1, #-116]	; 0xffffff8c
 520:	554d5f58 	strbpl	r5, [sp, #-3928]	; 0xfffff0a8
 524:	5541425f 	strbpl	r4, [r1, #-607]	; 0xfffffda1
 528:	45525f44 	ldrbmi	r5, [r2, #-3908]	; 0xfffff0bc
 52c:	74730047 	ldrbtvc	r0, [r3], #-71	; 0xffffffb9
 530:	676e6972 			; <UNDEFINED> instruction: 0x676e6972
 534:	69617400 	stmdbvs	r1!, {sl, ip, sp, lr}^
 538:	626e006c 	rsbvs	r0, lr, #108	; 0x6c
 53c:	73657479 	cmnvc	r5, #2030043136	; 0x79000000
 540:	58554100 	ldmdapl	r5, {r8, lr}^
 544:	5f554d5f 	svcpl	0x00554d5f
 548:	5f52534d 	svcpl	0x0052534d
 54c:	00474552 	subeq	r4, r7, r2, asr r5
 550:	5f585541 	svcpl	0x00585541
 554:	435f554d 	cmpmi	pc, #322961408	; 0x13400000
 558:	5f4c544e 	svcpl	0x004c544e
 55c:	00474552 	subeq	r4, r7, r2, asr r5
 560:	5f585541 	svcpl	0x00585541
 564:	495f554d 	ldmdbmi	pc, {r0, r2, r3, r6, r8, sl, ip, lr}^	; <UNPREDICTABLE>
 568:	45525f4f 	ldrbmi	r5, [r2, #-3919]	; 0xfffff0b1
 56c:	55410047 	strbpl	r0, [r1, #-71]	; 0xffffffb9
 570:	554d5f58 	strbpl	r5, [sp, #-3928]	; 0xfffff0a8
 574:	52434c5f 	subpl	r4, r3, #24320	; 0x5f00
 578:	4745525f 	smlsldmi	r5, r5, pc, r2	; <UNPREDICTABLE>
 57c:	74796200 	ldrbtvc	r6, [r9], #-512	; 0xfffffe00
 580:	775f7365 	ldrbvc	r7, [pc, -r5, ror #6]
 584:	74746972 	ldrbtvc	r6, [r4], #-2418	; 0xfffff68e
 588:	72006e65 	andvc	r6, r0, #1616	; 0x650
 58c:	75416970 	strbvc	r6, [r1, #-2416]	; 0xfffff690
 590:	69660078 	stmdbvs	r6!, {r3, r4, r5, r6}^
 594:	625f6f66 	subsvs	r6, pc, #408	; 0x198
 598:	65666675 	strbvs	r6, [r6, #-1653]!	; 0xfffff98b
 59c:	50520072 	subspl	r0, r2, r2, ror r0
 5a0:	65525f49 	ldrbvs	r5, [r2, #-3913]	; 0xfffff0b7
 5a4:	72466461 	subvc	r6, r6, #1627389952	; 0x61000000
 5a8:	694d6d6f 	stmdbvs	sp, {r0, r1, r2, r3, r5, r6, r8, sl, fp, sp, lr}^
 5ac:	6155696e 	cmpvs	r5, lr, ror #18
 5b0:	67007472 	smlsdxvs	r0, r2, r4, r7
 5b4:	526f6970 	rsbpl	r6, pc, #112, 18	; 0x1c0000
 5b8:	41006765 	tstmi	r0, r5, ror #14
 5bc:	4d5f5855 	ldclmi	8, cr5, [pc, #-340]	; 470 <CPSR_IRQ_INHIBIT+0x3f0>
 5c0:	54535f55 	ldrbpl	r5, [r3], #-3925	; 0xfffff0ab
 5c4:	525f5441 	subspl	r5, pc, #1090519040	; 0x41000000
 5c8:	72004745 	andvc	r4, r0, #18087936	; 0x1140000
 5cc:	615f6970 	cmpvs	pc, r0, ror r9	; <UNPREDICTABLE>
 5d0:	745f7875 	ldrbvc	r7, [pc], #-2165	; 5d8 <CPSR_IRQ_INHIBIT+0x558>
 5d4:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
 5d8:	7261755f 	rsbvc	r7, r1, #398458880	; 0x17c00000
 5dc:	00745f74 	rsbseq	r5, r4, r4, ror pc
 5e0:	5f495052 	svcpl	0x00495052
 5e4:	41746547 	cmnmi	r4, r7, asr #10
 5e8:	73007875 	movwvc	r7, #2165	; 0x875
 5ec:	74657a69 	strbtvc	r7, [r5], #-2665	; 0xfffff597
 5f0:	00657079 	rsbeq	r7, r5, r9, ror r0
 5f4:	5f585541 	svcpl	0x00585541
 5f8:	535f554d 	cmppl	pc, #322961408	; 0x13400000
 5fc:	54415243 	strbpl	r5, [r1], #-579	; 0xfffffdbd
 600:	52004843 	andpl	r4, r0, #4390912	; 0x430000
 604:	4d5f4950 	vldrmi.16	s9, [pc, #-160]	; 56c <CPSR_IRQ_INHIBIT+0x4ec>	; <UNPREDICTABLE>
 608:	55696e69 	strbpl	r6, [r9, #-3689]!	; 0xfffff197
 60c:	5f747261 	svcpl	0x00747261
 610:	00525349 	subseq	r5, r2, r9, asr #6
 614:	5f585541 	svcpl	0x00585541
 618:	00515249 	subseq	r5, r1, r9, asr #4
 61c:	5f495052 	svcpl	0x00495052
 620:	696e694d 	stmdbvs	lr!, {r0, r2, r3, r6, r8, fp, sp, lr}^
 624:	74726155 	ldrbtvc	r6, [r2], #-341	; 0xfffffeab
 628:	74696e49 	strbtvc	r6, [r9], #-3657	; 0xfffff1b7
 62c:	58554100 	ldmdapl	r5, {r8, lr}^
 630:	5f554d5f 	svcpl	0x00554d5f
 634:	5f524949 	svcpl	0x00524949
 638:	00474552 	subeq	r4, r7, r2, asr r5
 63c:	6f636e69 	svcvs	0x00636e69
 640:	676e696d 	strbvs	r6, [lr, -sp, ror #18]!
 644:	7479625f 	ldrbtvc	r6, [r9], #-607	; 0xfffffda1
 648:	55410065 	strbpl	r0, [r1, #-101]	; 0xffffff9b
 64c:	554d5f58 	strbpl	r5, [sp, #-3928]	; 0xfffff0a8
 650:	5245495f 	subpl	r4, r5, #1556480	; 0x17c000
 654:	4745525f 	smlsldmi	r5, r5, pc, r2	; <UNPREDICTABLE>
 658:	73645f00 	cmnvc	r4, #0, 30
 65c:	61685f6f 	cmnvs	r8, pc, ror #30
 660:	656c646e 	strbvs	r6, [ip, #-1134]!	; 0xfffffb92
 664:	73657400 	cmnvc	r5, #0, 8
 668:	6d635f74 	stclvs	15, cr5, [r3, #-464]!	; 0xfffffe30
 66c:	735f0064 	cmpvc	pc, #100	; 0x64
 670:	00657a69 	rsbeq	r7, r5, r9, ror #20
 674:	6e61725f 	mcrvs	2, 3, r7, cr1, cr15, {2}
 678:	00383464 	eorseq	r3, r8, r4, ror #8
 67c:	656d655f 	strbvs	r6, [sp, #-1375]!	; 0xfffffaa1
 680:	6e656772 	mcrvs	7, 3, r6, cr5, cr2, {3}
 684:	5f007963 	svcpl	0x00007963
 688:	74726377 	ldrbtvc	r6, [r2], #-887	; 0xfffffc89
 68c:	5f626d6f 	svcpl	0x00626d6f
 690:	74617473 	strbtvc	r7, [r1], #-1139	; 0xfffffb8d
 694:	775f0065 	ldrbvc	r0, [pc, -r5, rrx]
 698:	74727363 	ldrbtvc	r7, [r2], #-867	; 0xfffffc9d
 69c:	73626d6f 	cmnvc	r2, #7104	; 0x1bc0
 6a0:	6174735f 	cmnvs	r4, pc, asr r3
 6a4:	2f006574 	svccs	0x00006574
 6a8:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
 6ac:	6462612f 	strbtvs	r6, [r2], #-303	; 0xfffffed1
 6b0:	72616b69 	rsbvc	r6, r1, #107520	; 0x1a400
 6b4:	642f6d69 	strtvs	r6, [pc], #-3433	; 6bc <CPSR_IRQ_INHIBIT+0x63c>
 6b8:	4d2f7665 	stcmi	6, cr7, [pc, #-404]!	; 52c <CPSR_IRQ_INHIBIT+0x4ac>
 6bc:	74694c79 	strbtvc	r4, [r9], #-3193	; 0xfffff387
 6c0:	4f656c74 	svcmi	0x00656c74
 6c4:	72732f53 	rsbsvc	r2, r3, #332	; 0x14c
 6c8:	68732f63 	ldmdavs	r3!, {r0, r1, r5, r6, r8, r9, sl, fp, sp}^
 6cc:	2e6c6c65 	cdpcs	12, 6, cr6, cr12, cr5, {3}
 6d0:	6c5f0063 	mrrcvs	0, 6, r0, pc, cr3	; <UNPREDICTABLE>
 6d4:	69736662 	ldmdbvs	r3!, {r1, r5, r6, r9, sl, sp, lr}^
 6d8:	5f00657a 	svcpl	0x0000657a
 6dc:	7472626d 	ldrbtvc	r6, [r2], #-621	; 0xfffffd93
 6e0:	5f63776f 	svcpl	0x0063776f
 6e4:	74617473 	strbtvc	r7, [r1], #-1139	; 0xfffffb8d
 6e8:	775f0065 	ldrbvc	r0, [pc, -r5, rrx]
 6ec:	6d6f7463 	cfstrdvs	mvd7, [pc, #-396]!	; 568 <CPSR_IRQ_INHIBIT+0x4e8>
 6f0:	74735f62 	ldrbtvc	r5, [r3], #-3938	; 0xfffff09e
 6f4:	00657461 	rsbeq	r7, r5, r1, ror #8
 6f8:	6d745f5f 	ldclvs	15, cr5, [r4, #-380]!	; 0xfffffe84
 6fc:	6365735f 	cmnvs	r5, #2080374785	; 0x7c000001
 700:	62755f00 	rsbsvs	r5, r5, #0, 30
 704:	5f006675 	svcpl	0x00006675
 708:	5f6d745f 	svcpl	0x006d745f
 70c:	72756f68 	rsbsvc	r6, r5, #104, 30	; 0x1a0
 710:	735f5f00 	cmpvc	pc, #0, 30
 714:	6f5f0066 	svcvs	0x005f0066
 718:	78655f6e 	stmdavc	r5!, {r1, r2, r3, r5, r6, r8, r9, sl, fp, ip, lr}^
 71c:	615f7469 	cmpvs	pc, r9, ror #8
 720:	00736772 	rsbseq	r6, r3, r2, ror r7
 724:	6f6f635f 	svcvs	0x006f635f
 728:	0065696b 	rsbeq	r6, r5, fp, ror #18
 72c:	67735f5f 			; <UNDEFINED> instruction: 0x67735f5f
 730:	0065756c 	rsbeq	r7, r5, ip, ror #10
 734:	616c665f 	cmnvs	ip, pc, asr r6
 738:	5f007367 	svcpl	0x00007367
 73c:	635f7369 	cmpvs	pc, #-1543503871	; 0xa4000001
 740:	5f006178 	svcpl	0x00006178
 744:	69647473 	stmdbvs	r4!, {r0, r1, r4, r5, r6, sl, ip, sp, lr}^
 748:	625f006e 	subsvs	r0, pc, #110	; 0x6e
 74c:	69736b6c 	ldmdbvs	r3!, {r2, r3, r5, r6, r8, r9, fp, sp, lr}^
 750:	5f00657a 	svcpl	0x0000657a
 754:	62747663 	rsbsvs	r7, r4, #103809024	; 0x6300000
 758:	5f006675 	svcpl	0x00006675
 75c:	7366666f 	cmnvc	r6, #116391936	; 0x6f00000
 760:	5f007465 	svcpl	0x00007465
 764:	7273626d 	rsbsvc	r6, r3, #-805306362	; 0xd0000006
 768:	63776f74 	cmnvs	r7, #116, 30	; 0x1d0
 76c:	74735f73 	ldrbtvc	r5, [r3], #-3955	; 0xfffff08d
 770:	00657461 	rsbeq	r7, r5, r1, ror #8
 774:	72626d5f 	rsbvc	r6, r2, #6080	; 0x17c0
 778:	5f6e656c 	svcpl	0x006e656c
 77c:	74617473 	strbtvc	r7, [r1], #-1139	; 0xfffffb8d
 780:	665f0065 	ldrbvs	r0, [pc], -r5, rrx
 784:	6772616e 	ldrbvs	r6, [r2, -lr, ror #2]!
 788:	665f0073 			; <UNDEFINED> instruction: 0x665f0073
 78c:	5f00736e 	svcpl	0x0000736e
 790:	6e676973 			; <UNDEFINED> instruction: 0x6e676973
 794:	6c665f00 	stclvs	15, cr5, [r6], #-0
 798:	5f6b636f 	svcpl	0x006b636f
 79c:	735f0074 	cmpvc	pc, #116	; 0x74
 7a0:	72656474 	rsbvc	r6, r5, #116, 8	; 0x74000000
 7a4:	425f0072 	subsmi	r0, pc, #114	; 0x72
 7a8:	6e696769 	cdpvs	7, 6, cr6, cr9, cr9, {3}
 7ac:	675f0074 			; <UNDEFINED> instruction: 0x675f0074
 7b0:	616d6d61 	cmnvs	sp, r1, ror #26
 7b4:	6769735f 			; <UNDEFINED> instruction: 0x6769735f
 7b8:	6d61676e 	stclvs	7, cr6, [r1, #-440]!	; 0xfffffe48
 7bc:	74796200 	ldrbtvc	r6, [r9], #-512	; 0xfffffe00
 7c0:	725f7365 	subsvc	r7, pc, #-1811939327	; 0x94000001
 7c4:	00646165 	rsbeq	r6, r4, r5, ror #2
 7c8:	7365725f 	cmnvc	r5, #-268435451	; 0xf0000005
 7cc:	5f746c75 	svcpl	0x00746c75
 7d0:	5f5f006b 	svcpl	0x005f006b
 7d4:	5f006d74 	svcpl	0x00006d74
 7d8:	6863775f 	stmdavs	r3!, {r0, r1, r2, r3, r4, r6, r8, r9, sl, ip, sp, lr}^
 7dc:	735f0062 	cmpvc	pc, #98	; 0x62
 7e0:	756f6474 	strbvc	r6, [pc, #-1140]!	; 374 <CPSR_IRQ_INHIBIT+0x2f4>
 7e4:	635f0074 	cmpvs	pc, #116	; 0x74
 7e8:	656c7476 	strbvs	r7, [ip, #-1142]!	; 0xfffffb8a
 7ec:	665f006e 	ldrbvs	r0, [pc], -lr, rrx
 7f0:	00656c69 	rsbeq	r6, r5, r9, ror #24
 7f4:	6f696e5f 	svcvs	0x00696e5f
 7f8:	5f007362 	svcpl	0x00007362
 7fc:	78657461 	stmdavc	r5!, {r0, r5, r6, sl, ip, sp, lr}^
 800:	00307469 	eorseq	r7, r0, r9, ror #8
 804:	6769735f 			; <UNDEFINED> instruction: 0x6769735f
 808:	5f6c616e 	svcpl	0x006c616e
 80c:	00667562 	rsbeq	r7, r6, r2, ror #10
 810:	6373615f 	cmnvs	r3, #-1073741801	; 0xc0000017
 814:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0xfffff68c
 818:	6675625f 			; <UNDEFINED> instruction: 0x6675625f
 81c:	65725f00 	ldrbvs	r5, [r2, #-3840]!	; 0xfffff100
 820:	746c7573 	strbtvc	r7, [ip], #-1395	; 0xfffffa8d
 824:	775f5f00 	ldrbvc	r5, [pc, -r0, lsl #30]
 828:	77006863 	strvc	r6, [r0, -r3, ror #16]
 82c:	5f746e69 	svcpl	0x00746e69
 830:	6c5f0074 	mrrcvs	0, 7, r0, pc, cr4	; <UNPREDICTABLE>
 834:	006b636f 	rsbeq	r6, fp, pc, ror #6
 838:	616c665f 	cmnvs	ip, pc, asr r6
 83c:	00327367 	eorseq	r7, r2, r7, ror #6
 840:	6d745f5f 	ldclvs	15, cr5, [r4, #-380]!	; 0xfffffe84
 844:	6165795f 	cmnvs	r5, pc, asr r9
 848:	6e5f0072 	mrcvs	0, 2, r0, cr15, cr2, {3}
 84c:	6c6c616d 	stfvse	f6, [ip], #-436	; 0xfffffe4c
 850:	7400636f 	strvc	r6, [r0], #-879	; 0xfffffc91
 854:	5f747365 	svcpl	0x00747365
 858:	63637573 	cmnvs	r3, #482344960	; 0x1cc00000
 85c:	00737365 	rsbseq	r7, r3, r5, ror #6
 860:	72616863 	rsbvc	r6, r1, #6488064	; 0x630000
 864:	65746361 	ldrbvs	r6, [r4, #-865]!	; 0xfffffc9f
 868:	6f6c0072 	svcvs	0x006c0072
 86c:	6420676e 	strtvs	r6, [r0], #-1902	; 0xfffff892
 870:	6c62756f 	cfstr64vs	mvdx7, [r2], #-444	; 0xfffffe44
 874:	6e5f0065 	cdpvs	0, 5, cr0, cr15, cr5, {3}
 878:	66747865 	ldrbtvs	r7, [r4], -r5, ror #16
 87c:	745f5f00 	ldrbvc	r5, [pc], #-3840	; 884 <CPSR_IRQ_INHIBIT+0x804>
 880:	6f6d5f6d 	svcvs	0x006d5f6d
 884:	615f006e 	cmpvs	pc, lr, rrx
 888:	69786574 	ldmdbvs	r8!, {r2, r4, r5, r6, r8, sl, sp, lr}^
 88c:	5f5f0074 	svcpl	0x005f0074
 890:	64696473 	strbtvs	r6, [r9], #-1139	; 0xfffffb8d
 894:	74696e69 	strbtvc	r6, [r9], #-3689	; 0xfffff197
 898:	666f5f00 	strbtvs	r5, [pc], -r0, lsl #30
 89c:	00745f66 	rsbseq	r5, r4, r6, ror #30
 8a0:	6572665f 	ldrbvs	r6, [r2, #-1631]!	; 0xfffff9a1
 8a4:	73696c65 	cmnvc	r9, #25856	; 0x6500
 8a8:	4c5f0074 	mrrcmi	0, 7, r0, pc, cr4	; <UNPREDICTABLE>
 8ac:	5f4b434f 	svcpl	0x004b434f
 8b0:	55434552 	strbpl	r4, [r3, #-1362]	; 0xfffffaae
 8b4:	56495352 			; <UNDEFINED> instruction: 0x56495352
 8b8:	00545f45 	subseq	r5, r4, r5, asr #30
 8bc:	77656e5f 			; <UNDEFINED> instruction: 0x77656e5f
 8c0:	5f685f00 	svcpl	0x00685f00
 8c4:	6e727265 	cdpvs	2, 7, cr7, cr2, cr5, {3}
 8c8:	5f5f006f 	svcpl	0x005f006f
 8cc:	795f6d74 	ldmdbvc	pc, {r2, r4, r5, r6, r8, sl, fp, sp, lr}^	; <UNPREDICTABLE>
 8d0:	00796164 	rsbseq	r6, r9, r4, ror #2
 8d4:	62735f5f 	rsbsvs	r5, r3, #380	; 0x17c
 8d8:	5f006675 	svcpl	0x00006675
 8dc:	73626f69 	cmnvc	r2, #420	; 0x1a4
 8e0:	465f5f00 	ldrbmi	r5, [pc], -r0, lsl #30
 8e4:	00454c49 	subeq	r4, r5, r9, asr #24
 8e8:	73626d5f 	cmnvc	r2, #6080	; 0x17c0
 8ec:	65746174 	ldrbvs	r6, [r4, #-372]!	; 0xfffffe8c
 8f0:	5f00745f 	svcpl	0x0000745f
 8f4:	4946735f 	stmdbmi	r6, {r0, r1, r2, r3, r4, r6, r8, r9, ip, sp, lr}^
 8f8:	5f00454c 	svcpl	0x0000454c
 8fc:	7473626d 	ldrbtvc	r6, [r3], #-621	; 0xfffffd93
 900:	00657461 	rsbeq	r7, r5, r1, ror #8
 904:	6e61725f 	mcrvs	2, 3, r7, cr1, cr15, {2}
 908:	656e5f64 	strbvs	r5, [lr, #-3940]!	; 0xfffff09c
 90c:	5f007478 	svcpl	0x00007478
 910:	656c626d 	strbvs	r6, [ip, #-621]!	; 0xfffffd93
 914:	74735f6e 	ldrbtvc	r5, [r3], #-3950	; 0xfffff092
 918:	00657461 	rsbeq	r7, r5, r1, ror #8
 91c:	636e695f 	cmnvs	lr, #1556480	; 0x17c000
 920:	6e695f00 	cdpvs	15, 6, cr5, cr9, cr0, {0}
 924:	635f0064 	cmpvs	pc, #100	; 0x64
 928:	65727275 	ldrbvs	r7, [r2, #-629]!	; 0xfffffd8b
 92c:	6c5f746e 	cfldrdvs	mvd7, [pc], {110}	; 0x6e
 930:	6c61636f 	stclvs	3, cr6, [r1], #-444	; 0xfffffe44
 934:	5f5f0065 	svcpl	0x005f0065
 938:	61656c63 	cmnvs	r5, r3, ror #24
 93c:	0070756e 	rsbseq	r7, r0, lr, ror #10
 940:	78616d5f 	stmdavc	r1!, {r0, r1, r2, r3, r4, r6, r8, sl, fp, sp, lr}^
 944:	00736477 	rsbseq	r6, r3, r7, ror r4
 948:	6565725f 	strbvs	r7, [r5, #-607]!	; 0xfffffda1
 94c:	5f00746e 	svcpl	0x0000746e
 950:	64656573 	strbtvs	r6, [r5], #-1395	; 0xfffffa8d
 954:	635f5f00 	cmpvs	pc, #0, 30
 958:	746e756f 	strbtvc	r7, [lr], #-1391	; 0xfffffa91
 95c:	765f5f00 	ldrbvc	r5, [pc], -r0, lsl #30
 960:	65756c61 	ldrbvs	r6, [r5, #-3169]!	; 0xfffff39f
 964:	65735f00 	ldrbvs	r5, [r3, #-3840]!	; 0xfffff100
 968:	5f006b65 	svcpl	0x00006b65
 96c:	736f7066 	cmnvc	pc, #102	; 0x66
 970:	5f00745f 	svcpl	0x0000745f
 974:	5f6d745f 	svcpl	0x006d745f
 978:	006e696d 	rsbeq	r6, lr, sp, ror #18
 97c:	6c756d5f 	ldclvs	13, cr6, [r5], #-380	; 0xfffffe84
 980:	735f0074 	cmpvc	pc, #116	; 0x74
 984:	6f747274 	svcvs	0x00747274
 988:	616c5f6b 	cmnvs	ip, fp, ror #30
 98c:	5f007473 	svcpl	0x00007473
 990:	79746e66 	ldmdbvc	r4!, {r1, r2, r5, r6, r9, sl, fp, sp, lr}^
 994:	00736570 	rsbseq	r6, r3, r0, ror r5
 998:	6464615f 	strbtvs	r6, [r4], #-351	; 0xfffffea1
 99c:	555f5f00 	ldrbpl	r5, [pc, #-3840]	; fffffaa4 <_heap+0xfff7faa0>
 9a0:	676e6f4c 	strbvs	r6, [lr, -ip, asr #30]!
 9a4:	65675f00 	strbvs	r5, [r7, #-3840]!	; 0xfffff100
 9a8:	74616474 	strbtvc	r6, [r1], #-1140	; 0xfffffb8c
 9ac:	72655f65 	rsbvc	r5, r5, #404	; 0x194
 9b0:	675f0072 			; <UNDEFINED> instruction: 0x675f0072
 9b4:	61626f6c 	cmnvs	r2, ip, ror #30
 9b8:	6d695f6c 	stclvs	15, cr5, [r9, #-432]!	; 0xfffffe50
 9bc:	65727570 	ldrbvs	r7, [r2, #-1392]!	; 0xfffffa90
 9c0:	7274705f 	rsbsvc	r7, r4, #95	; 0x5f
 9c4:	75635f00 	strbvc	r5, [r3, #-3840]!	; 0xfffff100
 9c8:	6e657272 	mcrvs	2, 3, r7, cr5, cr2, {3}
 9cc:	61635f74 	smcvs	13812	; 0x35f4
 9d0:	6f676574 	svcvs	0x00676574
 9d4:	5f007972 	svcpl	0x00007972
 9d8:	73756e75 	cmnvc	r5, #1872	; 0x750
 9dc:	725f6465 	subsvc	r6, pc, #1694498816	; 0x65000000
 9e0:	00646e61 	rsbeq	r6, r4, r1, ror #28
 9e4:	7364775f 	cmnvc	r4, #24903680	; 0x17c0000
 9e8:	745f5f00 	ldrbvc	r5, [pc], #-3840	; 9f0 <CPSR_IRQ_INHIBIT+0x970>
 9ec:	64775f6d 	ldrbtvs	r5, [r7], #-3949	; 0xfffff093
 9f0:	5f007961 	svcpl	0x00007961
 9f4:	65756c67 	ldrbvs	r6, [r5, #-3175]!	; 0xfffff399
 9f8:	73657400 	cmnvc	r5, #0, 8
 9fc:	61665f74 	smcvs	26100	; 0x65f4
 a00:	5f006c69 	svcpl	0x00006c69
 a04:	65736162 	ldrbvs	r6, [r3, #-354]!	; 0xfffffe9e
 a08:	366c5f00 	strbtcc	r5, [ip], -r0, lsl #30
 a0c:	625f6134 	subsvs	r6, pc, #52, 2
 a10:	5f006675 	svcpl	0x00006675
 a14:	5f676973 	svcpl	0x00676973
 a18:	636e7566 	cmnvs	lr, #427819008	; 0x19800000
 a1c:	626e5f00 	rsbvs	r5, lr, #0, 30
 a20:	5f006675 	svcpl	0x00006675
 a24:	73756e75 	cmnvc	r5, #1872	; 0x750
 a28:	5f006465 	svcpl	0x00006465
 a2c:	5f6d745f 	svcpl	0x006d745f
 a30:	73647369 	cmnvc	r4, #-1543503871	; 0xa4000001
 a34:	6c5f0074 	mrrcvs	0, 7, r0, pc, cr4	; <UNPREDICTABLE>
 a38:	6c61636f 	stclvs	3, cr6, [r1], #-444	; 0xfffffe44
 a3c:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0xfffff68c
 a40:	6675625f 			; <UNDEFINED> instruction: 0x6675625f
 a44:	6c635f00 	stclvs	15, cr5, [r3], #-0
 a48:	0065736f 	rsbeq	r7, r5, pc, ror #6
 a4c:	3834725f 	ldmdacc	r4!, {r0, r1, r2, r3, r4, r6, r9, ip, sp, lr}
 a50:	626d5f00 	rsbvs	r5, sp, #0, 30
 a54:	63776f74 	cmnvs	r7, #116, 30	; 0x1d0
 a58:	6174735f 	cmnvs	r4, pc, asr r3
 a5c:	5f006574 	svcpl	0x00006574
 a60:	00733570 	rsbseq	r3, r3, r0, ror r5
 a64:	6d745f5f 	ldclvs	15, cr5, [r4, #-380]!	; 0xfffffe84
 a68:	61646d5f 	cmnvs	r4, pc, asr sp
 a6c:	68730079 	ldmdavs	r3!, {r0, r3, r4, r5, r6}^
 a70:	5f6c6c65 	svcpl	0x006c6c65
 a74:	6e69616d 	powvsez	f6, f1, #5.0
 a78:	61746100 	cmnvs	r4, r0, lsl #2
 a7c:	6b007367 	blvs	1d820 <__bss_end__+0x14d04>
 a80:	656e7265 	strbvs	r7, [lr, #-613]!	; 0xfffffd9b
 a84:	616d5f6c 	cmnvs	sp, ip, ror #30
 a88:	2f006e69 	svccs	0x00006e69
 a8c:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
 a90:	6462612f 	strbtvs	r6, [r2], #-303	; 0xfffffed1
 a94:	72616b69 	rsbvc	r6, r1, #107520	; 0x1a400
 a98:	642f6d69 	strtvs	r6, [pc], #-3433	; aa0 <CPSR_IRQ_INHIBIT+0xa20>
 a9c:	4d2f7665 	stcmi	6, cr7, [pc, #-404]!	; 910 <CPSR_IRQ_INHIBIT+0x890>
 aa0:	74694c79 	strbtvc	r4, [r9], #-3193	; 0xfffff387
 aa4:	4f656c74 	svcmi	0x00656c74
 aa8:	72732f53 	rsbsvc	r2, r3, #332	; 0x14c
 aac:	61752f63 	cmnvs	r5, r3, ror #30
 ab0:	654b7472 	strbvs	r7, [fp, #-1138]	; 0xfffffb8e
 ab4:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 ab8:	2f00632e 	svccs	0x0000632e
 abc:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
 ac0:	6462612f 	strbtvs	r6, [r2], #-303	; 0xfffffed1
 ac4:	72616b69 	rsbvc	r6, r1, #107520	; 0x1a400
 ac8:	642f6d69 	strtvs	r6, [pc], #-3433	; ad0 <CPSR_IRQ_INHIBIT+0xa50>
 acc:	4d2f7665 	stcmi	6, cr7, [pc, #-404]!	; 940 <CPSR_IRQ_INHIBIT+0x8c0>
 ad0:	74694c79 	strbtvc	r4, [r9], #-3193	; 0xfffff387
 ad4:	4f656c74 	svcmi	0x00656c74
 ad8:	696c2f53 	stmdbvs	ip!, {r0, r1, r4, r6, r8, r9, sl, fp, sp}^
 adc:	69662f62 	stmdbvs	r6!, {r1, r5, r6, r8, r9, sl, fp, sp}^
 ae0:	632e6f66 			; <UNDEFINED> instruction: 0x632e6f66
 ae4:	66696600 	strbtvs	r6, [r9], -r0, lsl #12
 ae8:	72775f6f 	rsbsvc	r5, r7, #444	; 0x1bc
 aec:	00657469 	rsbeq	r7, r5, r9, ror #8
 af0:	6f666966 	svcvs	0x00666966
 af4:	696e695f 	stmdbvs	lr!, {r0, r1, r2, r3, r4, r6, r8, fp, sp, lr}^
 af8:	69660074 	stmdbvs	r6!, {r2, r4, r5, r6}^
 afc:	725f6f66 	subsvc	r6, pc, #408	; 0x198
 b00:	00646165 	rsbeq	r6, r4, r5, ror #2
 b04:	726f7473 	rsbvc	r7, pc, #1929379840	; 0x73000000
 b08:	00656761 	rsbeq	r6, r5, r1, ror #14

Disassembly of section .ARM.attributes:

00000000 <.ARM.attributes>:
   0:	00003041 	andeq	r3, r0, r1, asr #32
   4:	61656100 	cmnvs	r5, r0, lsl #2
   8:	01006962 	tsteq	r0, r2, ror #18
   c:	00000026 	andeq	r0, r0, r6, lsr #32
  10:	4b5a3605 	blmi	168d82c <_heap+0x160d828>
  14:	08070600 	stmdaeq	r7, {r9, sl}
  18:	0a010901 	beq	42424 <__bss_end__+0x39908>
  1c:	14041202 	strne	r1, [r4], #-514	; 0xfffffdfe
  20:	17011501 	strne	r1, [r1, -r1, lsl #10]
  24:	1a011803 	bne	46038 <__bss_end__+0x3d51c>
  28:	1e011c01 	cdpne	12, 0, cr1, cr1, cr1, {0}
  2c:	44012206 	strmi	r2, [r1], #-518	; 0xfffffdfa
  30:	Address 0x0000000000000030 is out of bounds.

