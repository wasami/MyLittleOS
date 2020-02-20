
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
    8024:	0000834c 	andeq	r8, r0, ip, asr #6

00008028 <_software_interrupt_vector_h>:
    8028:	00008380 	andeq	r8, r0, r0, lsl #7

0000802c <_prefetch_abort_vector_h>:
    802c:	000083b4 			; <UNDEFINED> instruction: 0x000083b4

00008030 <_data_abort_vector_h>:
    8030:	000083ec 	andeq	r8, r0, ip, ror #7

00008034 <_unused_handler_h>:
    8034:	00008040 	andeq	r8, r0, r0, asr #32

00008038 <_interrupt_vector_h>:
    8038:	00008424 	andeq	r8, r0, r4, lsr #8

0000803c <_fast_interrupt_vector_h>:
    803c:	00008528 	andeq	r8, r0, r8, lsr #10

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
    80f0:	eb000240 	bl	89f8 <kernel_main>
    80f4:	eafffffe 	b	80f4 <_cstartup+0x60>
    80f8:	00008d9a 	muleq	r0, sl, sp
    80fc:	00008dbc 			; <UNDEFINED> instruction: 0x00008dbc

00008100 <dummy_a>:
    8100:	e92d4800 	push	{fp, lr}
    8104:	e28db004 	add	fp, sp, #4
    8108:	e24dd008 	sub	sp, sp, #8
    810c:	e3a03061 	mov	r3, #97	; 0x61
    8110:	e54b3005 	strb	r3, [fp, #-5]
    8114:	e55b3005 	ldrb	r3, [fp, #-5]
    8118:	e1a00003 	mov	r0, r3
    811c:	eb000185 	bl	8738 <RPI_WriteToMiniUart>
    8120:	eafffffb 	b	8114 <dummy_a+0x14>

00008124 <dummy_b>:
    8124:	e92d4800 	push	{fp, lr}
    8128:	e28db004 	add	fp, sp, #4
    812c:	e24dd008 	sub	sp, sp, #8
    8130:	e3a03062 	mov	r3, #98	; 0x62
    8134:	e54b3005 	strb	r3, [fp, #-5]
    8138:	e59f3018 	ldr	r3, [pc, #24]	; 8158 <dummy_b+0x34>
    813c:	e50b300c 	str	r3, [fp, #-12]
    8140:	e55b3005 	ldrb	r3, [fp, #-5]
    8144:	e1a00003 	mov	r0, r3
    8148:	eb00017a 	bl	8738 <RPI_WriteToMiniUart>
    814c:	e51b000c 	ldr	r0, [fp, #-12]
    8150:	eb000101 	bl	855c <RPI_WaitMicroSeconds>
    8154:	eafffff9 	b	8140 <dummy_b+0x1c>
    8158:	000f4240 	andeq	r4, pc, r0, asr #4

0000815c <RPI_GetArmTimer>:
    815c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8160:	e28db000 	add	fp, sp, #0
    8164:	e59f3010 	ldr	r3, [pc, #16]	; 817c <RPI_GetArmTimer+0x20>
    8168:	e5933000 	ldr	r3, [r3]
    816c:	e1a00003 	mov	r0, r3
    8170:	e28bd000 	add	sp, fp, #0
    8174:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8178:	e12fff1e 	bx	lr
    817c:	00008d44 	andeq	r8, r0, r4, asr #26

00008180 <RPI_ArmTimerInit>:
    8180:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8184:	e28db000 	add	fp, sp, #0
    8188:	e320f000 	nop	{0}
    818c:	e28bd000 	add	sp, fp, #0
    8190:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8194:	e12fff1e 	bx	lr

00008198 <RPI_GetGpio>:
    8198:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    819c:	e28db000 	add	fp, sp, #0
    81a0:	e59f3010 	ldr	r3, [pc, #16]	; 81b8 <RPI_GetGpio+0x20>
    81a4:	e5933000 	ldr	r3, [r3]
    81a8:	e1a00003 	mov	r0, r3
    81ac:	e28bd000 	add	sp, fp, #0
    81b0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    81b4:	e12fff1e 	bx	lr
    81b8:	00008d48 	andeq	r8, r0, r8, asr #26

000081bc <RPI_SetGpioPinFunction>:
    81bc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    81c0:	e28db000 	add	fp, sp, #0
    81c4:	e24dd014 	sub	sp, sp, #20
    81c8:	e1a03000 	mov	r3, r0
    81cc:	e1a02001 	mov	r2, r1
    81d0:	e54b300d 	strb	r3, [fp, #-13]
    81d4:	e1a03002 	mov	r3, r2
    81d8:	e54b300e 	strb	r3, [fp, #-14]
    81dc:	e59f30ec 	ldr	r3, [pc, #236]	; 82d0 <RPI_SetGpioPinFunction+0x114>
    81e0:	e5932000 	ldr	r2, [r3]
    81e4:	e55b300d 	ldrb	r3, [fp, #-13]
    81e8:	e59f10e4 	ldr	r1, [pc, #228]	; 82d4 <RPI_SetGpioPinFunction+0x118>
    81ec:	e0831391 	umull	r1, r3, r1, r3
    81f0:	e1a031a3 	lsr	r3, r3, #3
    81f4:	e6ef3073 	uxtb	r3, r3
    81f8:	e1a03103 	lsl	r3, r3, #2
    81fc:	e0823003 	add	r3, r2, r3
    8200:	e50b3008 	str	r3, [fp, #-8]
    8204:	e51b3008 	ldr	r3, [fp, #-8]
    8208:	e5933000 	ldr	r3, [r3]
    820c:	e50b300c 	str	r3, [fp, #-12]
    8210:	e55b200d 	ldrb	r2, [fp, #-13]
    8214:	e59f30b8 	ldr	r3, [pc, #184]	; 82d4 <RPI_SetGpioPinFunction+0x118>
    8218:	e0831293 	umull	r1, r3, r3, r2
    821c:	e1a011a3 	lsr	r1, r3, #3
    8220:	e1a03001 	mov	r3, r1
    8224:	e1a03103 	lsl	r3, r3, #2
    8228:	e0833001 	add	r3, r3, r1
    822c:	e1a03083 	lsl	r3, r3, #1
    8230:	e0423003 	sub	r3, r2, r3
    8234:	e6ef3073 	uxtb	r3, r3
    8238:	e1a02003 	mov	r2, r3
    823c:	e1a03002 	mov	r3, r2
    8240:	e1a03083 	lsl	r3, r3, #1
    8244:	e0833002 	add	r3, r3, r2
    8248:	e3a02007 	mov	r2, #7
    824c:	e1a03312 	lsl	r3, r2, r3
    8250:	e1e03003 	mvn	r3, r3
    8254:	e1a02003 	mov	r2, r3
    8258:	e51b300c 	ldr	r3, [fp, #-12]
    825c:	e0033002 	and	r3, r3, r2
    8260:	e50b300c 	str	r3, [fp, #-12]
    8264:	e55b000e 	ldrb	r0, [fp, #-14]
    8268:	e55b200d 	ldrb	r2, [fp, #-13]
    826c:	e59f3060 	ldr	r3, [pc, #96]	; 82d4 <RPI_SetGpioPinFunction+0x118>
    8270:	e0831293 	umull	r1, r3, r3, r2
    8274:	e1a011a3 	lsr	r1, r3, #3
    8278:	e1a03001 	mov	r3, r1
    827c:	e1a03103 	lsl	r3, r3, #2
    8280:	e0833001 	add	r3, r3, r1
    8284:	e1a03083 	lsl	r3, r3, #1
    8288:	e0423003 	sub	r3, r2, r3
    828c:	e6ef3073 	uxtb	r3, r3
    8290:	e1a02003 	mov	r2, r3
    8294:	e1a03002 	mov	r3, r2
    8298:	e1a03083 	lsl	r3, r3, #1
    829c:	e0833002 	add	r3, r3, r2
    82a0:	e1a03310 	lsl	r3, r0, r3
    82a4:	e1a02003 	mov	r2, r3
    82a8:	e51b300c 	ldr	r3, [fp, #-12]
    82ac:	e1823003 	orr	r3, r2, r3
    82b0:	e50b300c 	str	r3, [fp, #-12]
    82b4:	e51b200c 	ldr	r2, [fp, #-12]
    82b8:	e51b3008 	ldr	r3, [fp, #-8]
    82bc:	e5832000 	str	r2, [r3]
    82c0:	e320f000 	nop	{0}
    82c4:	e28bd000 	add	sp, fp, #0
    82c8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    82cc:	e12fff1e 	bx	lr
    82d0:	00008d48 	andeq	r8, r0, r8, asr #26
    82d4:	cccccccd 	stclgt	12, cr12, [ip], {205}	; 0xcd

000082d8 <RPI_GpioInit>:
    82d8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    82dc:	e28db000 	add	fp, sp, #0
    82e0:	e320f000 	nop	{0}
    82e4:	e28bd000 	add	sp, fp, #0
    82e8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    82ec:	e12fff1e 	bx	lr

000082f0 <RPI_GetIrqController>:
    82f0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    82f4:	e28db000 	add	fp, sp, #0
    82f8:	e59f3010 	ldr	r3, [pc, #16]	; 8310 <RPI_GetIrqController+0x20>
    82fc:	e5933000 	ldr	r3, [r3]
    8300:	e1a00003 	mov	r0, r3
    8304:	e28bd000 	add	sp, fp, #0
    8308:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    830c:	e12fff1e 	bx	lr
    8310:	00008d4c 	andeq	r8, r0, ip, asr #26

00008314 <reset_vector>:
    8314:	e24ee004 	sub	lr, lr, #4
    8318:	e92d580f 	push	{r0, r1, r2, r3, fp, ip, lr}
    831c:	e28db018 	add	fp, sp, #24
    8320:	e24dd00c 	sub	sp, sp, #12
    8324:	e3a03031 	mov	r3, #49	; 0x31
    8328:	e54b301d 	strb	r3, [fp, #-29]	; 0xffffffe3
    832c:	ebffff99 	bl	8198 <RPI_GetGpio>
    8330:	e1a02000 	mov	r2, r0
    8334:	e3a03801 	mov	r3, #65536	; 0x10000
    8338:	e5823028 	str	r3, [r2, #40]	; 0x28
    833c:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
    8340:	e1a00003 	mov	r0, r3
    8344:	eb0000fb 	bl	8738 <RPI_WriteToMiniUart>
    8348:	eafffff7 	b	832c <reset_vector+0x18>

0000834c <undefined_instruction_vector>:
    834c:	e92d580f 	push	{r0, r1, r2, r3, fp, ip, lr}
    8350:	e28db018 	add	fp, sp, #24
    8354:	e24dd00c 	sub	sp, sp, #12
    8358:	e3a03032 	mov	r3, #50	; 0x32
    835c:	e54b301d 	strb	r3, [fp, #-29]	; 0xffffffe3
    8360:	ebffff8c 	bl	8198 <RPI_GetGpio>
    8364:	e1a02000 	mov	r2, r0
    8368:	e3a03801 	mov	r3, #65536	; 0x10000
    836c:	e5823028 	str	r3, [r2, #40]	; 0x28
    8370:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
    8374:	e1a00003 	mov	r0, r3
    8378:	eb0000ee 	bl	8738 <RPI_WriteToMiniUart>
    837c:	eafffff7 	b	8360 <undefined_instruction_vector+0x14>

00008380 <software_interrupt_vector>:
    8380:	e92d580f 	push	{r0, r1, r2, r3, fp, ip, lr}
    8384:	e28db018 	add	fp, sp, #24
    8388:	e24dd00c 	sub	sp, sp, #12
    838c:	e3a03033 	mov	r3, #51	; 0x33
    8390:	e54b301d 	strb	r3, [fp, #-29]	; 0xffffffe3
    8394:	ebffff7f 	bl	8198 <RPI_GetGpio>
    8398:	e1a02000 	mov	r2, r0
    839c:	e3a03801 	mov	r3, #65536	; 0x10000
    83a0:	e5823028 	str	r3, [r2, #40]	; 0x28
    83a4:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
    83a8:	e1a00003 	mov	r0, r3
    83ac:	eb0000e1 	bl	8738 <RPI_WriteToMiniUart>
    83b0:	eafffff7 	b	8394 <software_interrupt_vector+0x14>

000083b4 <prefetch_abort_vector>:
    83b4:	e24ee004 	sub	lr, lr, #4
    83b8:	e92d580f 	push	{r0, r1, r2, r3, fp, ip, lr}
    83bc:	e28db018 	add	fp, sp, #24
    83c0:	e24dd00c 	sub	sp, sp, #12
    83c4:	e3a03034 	mov	r3, #52	; 0x34
    83c8:	e54b301d 	strb	r3, [fp, #-29]	; 0xffffffe3
    83cc:	ebffff71 	bl	8198 <RPI_GetGpio>
    83d0:	e1a02000 	mov	r2, r0
    83d4:	e3a03801 	mov	r3, #65536	; 0x10000
    83d8:	e5823028 	str	r3, [r2, #40]	; 0x28
    83dc:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
    83e0:	e1a00003 	mov	r0, r3
    83e4:	eb0000d3 	bl	8738 <RPI_WriteToMiniUart>
    83e8:	eafffff7 	b	83cc <prefetch_abort_vector+0x18>

000083ec <data_abort_vector>:
    83ec:	e24ee004 	sub	lr, lr, #4
    83f0:	e92d580f 	push	{r0, r1, r2, r3, fp, ip, lr}
    83f4:	e28db018 	add	fp, sp, #24
    83f8:	e24dd00c 	sub	sp, sp, #12
    83fc:	e3a03035 	mov	r3, #53	; 0x35
    8400:	e54b301d 	strb	r3, [fp, #-29]	; 0xffffffe3
    8404:	ebffff63 	bl	8198 <RPI_GetGpio>
    8408:	e1a02000 	mov	r2, r0
    840c:	e3a03801 	mov	r3, #65536	; 0x10000
    8410:	e5823028 	str	r3, [r2, #40]	; 0x28
    8414:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
    8418:	e1a00003 	mov	r0, r3
    841c:	eb0000c5 	bl	8738 <RPI_WriteToMiniUart>
    8420:	eafffff7 	b	8404 <data_abort_vector+0x18>

00008424 <interrupt_vector>:
    8424:	e24ee004 	sub	lr, lr, #4
    8428:	e92d581f 	push	{r0, r1, r2, r3, r4, fp, ip, lr}
    842c:	e28db01c 	add	fp, sp, #28
    8430:	eb000040 	bl	8538 <RPI_GetSystemTimer>
    8434:	e1a03000 	mov	r3, r0
    8438:	e5933000 	ldr	r3, [r3]
    843c:	e3530000 	cmp	r3, #0
    8440:	0a000016 	beq	84a0 <interrupt_vector+0x7c>
    8444:	eb00003b 	bl	8538 <RPI_GetSystemTimer>
    8448:	e1a03000 	mov	r3, r0
    844c:	e5932000 	ldr	r2, [r3]
    8450:	e3c22002 	bic	r2, r2, #2
    8454:	e5832000 	str	r2, [r3]
    8458:	eb000036 	bl	8538 <RPI_GetSystemTimer>
    845c:	e1a02000 	mov	r2, r0
    8460:	e5923010 	ldr	r3, [r2, #16]
    8464:	e2833b61 	add	r3, r3, #99328	; 0x18400
    8468:	e2833e2a 	add	r3, r3, #672	; 0x2a0
    846c:	e5823010 	str	r3, [r2, #16]
    8470:	e59f30a4 	ldr	r3, [pc, #164]	; 851c <interrupt_vector+0xf8>
    8474:	e5933000 	ldr	r3, [r3]
    8478:	e3530009 	cmp	r3, #9
    847c:	da000002 	ble	848c <interrupt_vector+0x68>
    8480:	e59f3094 	ldr	r3, [pc, #148]	; 851c <interrupt_vector+0xf8>
    8484:	e3a02000 	mov	r2, #0
    8488:	e5832000 	str	r2, [r3]
    848c:	e59f3088 	ldr	r3, [pc, #136]	; 851c <interrupt_vector+0xf8>
    8490:	e5933000 	ldr	r3, [r3]
    8494:	e2833001 	add	r3, r3, #1
    8498:	e59f207c 	ldr	r2, [pc, #124]	; 851c <interrupt_vector+0xf8>
    849c:	e5823000 	str	r3, [r2]
    84a0:	e59f3078 	ldr	r3, [pc, #120]	; 8520 <interrupt_vector+0xfc>
    84a4:	e5933000 	ldr	r3, [r3]
    84a8:	e5933000 	ldr	r3, [r3]
    84ac:	e3530000 	cmp	r3, #0
    84b0:	0a000016 	beq	8510 <interrupt_vector+0xec>
    84b4:	ebffff28 	bl	815c <RPI_GetArmTimer>
    84b8:	e1a02000 	mov	r2, r0
    84bc:	e3a03001 	mov	r3, #1
    84c0:	e582300c 	str	r3, [r2, #12]
    84c4:	e59f3058 	ldr	r3, [pc, #88]	; 8524 <interrupt_vector+0x100>
    84c8:	e5933000 	ldr	r3, [r3]
    84cc:	e3530000 	cmp	r3, #0
    84d0:	0a000007 	beq	84f4 <interrupt_vector+0xd0>
    84d4:	ebffff2f 	bl	8198 <RPI_GetGpio>
    84d8:	e1a02000 	mov	r2, r0
    84dc:	e3a03801 	mov	r3, #65536	; 0x10000
    84e0:	e582301c 	str	r3, [r2, #28]
    84e4:	e59f3038 	ldr	r3, [pc, #56]	; 8524 <interrupt_vector+0x100>
    84e8:	e3a02000 	mov	r2, #0
    84ec:	e5832000 	str	r2, [r3]
    84f0:	ea000006 	b	8510 <interrupt_vector+0xec>
    84f4:	ebffff27 	bl	8198 <RPI_GetGpio>
    84f8:	e1a02000 	mov	r2, r0
    84fc:	e3a03801 	mov	r3, #65536	; 0x10000
    8500:	e5823028 	str	r3, [r2, #40]	; 0x28
    8504:	e59f3018 	ldr	r3, [pc, #24]	; 8524 <interrupt_vector+0x100>
    8508:	e3a02001 	mov	r2, #1
    850c:	e5832000 	str	r2, [r3]
    8510:	e320f000 	nop	{0}
    8514:	e24bd01c 	sub	sp, fp, #28
    8518:	e8fd981f 	ldm	sp!, {r0, r1, r2, r3, r4, fp, ip, pc}^
    851c:	00008d9c 	muleq	r0, ip, sp
    8520:	00008d4c 	andeq	r8, r0, ip, asr #26
    8524:	00008da0 	andeq	r8, r0, r0, lsr #27

00008528 <fast_interrupt_vector>:
    8528:	e24db004 	sub	fp, sp, #4
    852c:	e320f000 	nop	{0}
    8530:	e28bd004 	add	sp, fp, #4
    8534:	e25ef004 	subs	pc, lr, #4

00008538 <RPI_GetSystemTimer>:
    8538:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    853c:	e28db000 	add	fp, sp, #0
    8540:	e59f3010 	ldr	r3, [pc, #16]	; 8558 <RPI_GetSystemTimer+0x20>
    8544:	e5933000 	ldr	r3, [r3]
    8548:	e1a00003 	mov	r0, r3
    854c:	e28bd000 	add	sp, fp, #0
    8550:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8554:	e12fff1e 	bx	lr
    8558:	00008d50 	andeq	r8, r0, r0, asr sp

0000855c <RPI_WaitMicroSeconds>:
    855c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8560:	e28db000 	add	fp, sp, #0
    8564:	e24dd014 	sub	sp, sp, #20
    8568:	e50b0010 	str	r0, [fp, #-16]
    856c:	e59f303c 	ldr	r3, [pc, #60]	; 85b0 <RPI_WaitMicroSeconds+0x54>
    8570:	e5933000 	ldr	r3, [r3]
    8574:	e5933004 	ldr	r3, [r3, #4]
    8578:	e50b3008 	str	r3, [fp, #-8]
    857c:	e320f000 	nop	{0}
    8580:	e59f3028 	ldr	r3, [pc, #40]	; 85b0 <RPI_WaitMicroSeconds+0x54>
    8584:	e5933000 	ldr	r3, [r3]
    8588:	e5932004 	ldr	r2, [r3, #4]
    858c:	e51b3008 	ldr	r3, [fp, #-8]
    8590:	e0422003 	sub	r2, r2, r3
    8594:	e51b3010 	ldr	r3, [fp, #-16]
    8598:	e1520003 	cmp	r2, r3
    859c:	3afffff7 	bcc	8580 <RPI_WaitMicroSeconds+0x24>
    85a0:	e320f000 	nop	{0}
    85a4:	e28bd000 	add	sp, fp, #0
    85a8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    85ac:	e12fff1e 	bx	lr
    85b0:	00008d50 	andeq	r8, r0, r0, asr sp

000085b4 <RPI_GetAux>:
    85b4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    85b8:	e28db000 	add	fp, sp, #0
    85bc:	e59f3010 	ldr	r3, [pc, #16]	; 85d4 <RPI_GetAux+0x20>
    85c0:	e5933000 	ldr	r3, [r3]
    85c4:	e1a00003 	mov	r0, r3
    85c8:	e28bd000 	add	sp, fp, #0
    85cc:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    85d0:	e12fff1e 	bx	lr
    85d4:	00008d54 	andeq	r8, r0, r4, asr sp

000085d8 <RPI_GetMiniUart>:
    85d8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    85dc:	e28db000 	add	fp, sp, #0
    85e0:	e59f3010 	ldr	r3, [pc, #16]	; 85f8 <RPI_GetMiniUart+0x20>
    85e4:	e5933000 	ldr	r3, [r3]
    85e8:	e1a00003 	mov	r0, r3
    85ec:	e28bd000 	add	sp, fp, #0
    85f0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    85f4:	e12fff1e 	bx	lr
    85f8:	00008d58 	andeq	r8, r0, r8, asr sp

000085fc <RPI_MiniUartInit>:
    85fc:	e92d4800 	push	{fp, lr}
    8600:	e28db004 	add	fp, sp, #4
    8604:	e24dd008 	sub	sp, sp, #8
    8608:	ebfffee2 	bl	8198 <RPI_GetGpio>
    860c:	e50b0008 	str	r0, [fp, #-8]
    8610:	e59f3114 	ldr	r3, [pc, #276]	; 872c <RPI_MiniUartInit+0x130>
    8614:	e5933000 	ldr	r3, [r3]
    8618:	e59f210c 	ldr	r2, [pc, #268]	; 872c <RPI_MiniUartInit+0x130>
    861c:	e5922000 	ldr	r2, [r2]
    8620:	e5922004 	ldr	r2, [r2, #4]
    8624:	e3822001 	orr	r2, r2, #1
    8628:	e5832004 	str	r2, [r3, #4]
    862c:	e59f30fc 	ldr	r3, [pc, #252]	; 8730 <RPI_MiniUartInit+0x134>
    8630:	e5933000 	ldr	r3, [r3]
    8634:	e3a02000 	mov	r2, #0
    8638:	e5832004 	str	r2, [r3, #4]
    863c:	e59f30ec 	ldr	r3, [pc, #236]	; 8730 <RPI_MiniUartInit+0x134>
    8640:	e5933000 	ldr	r3, [r3]
    8644:	e3a02000 	mov	r2, #0
    8648:	e5832020 	str	r2, [r3, #32]
    864c:	e59f30dc 	ldr	r3, [pc, #220]	; 8730 <RPI_MiniUartInit+0x134>
    8650:	e5933000 	ldr	r3, [r3]
    8654:	e3a02003 	mov	r2, #3
    8658:	e583200c 	str	r2, [r3, #12]
    865c:	e59f30cc 	ldr	r3, [pc, #204]	; 8730 <RPI_MiniUartInit+0x134>
    8660:	e5933000 	ldr	r3, [r3]
    8664:	e3a02000 	mov	r2, #0
    8668:	e5832010 	str	r2, [r3, #16]
    866c:	e59f30bc 	ldr	r3, [pc, #188]	; 8730 <RPI_MiniUartInit+0x134>
    8670:	e5933000 	ldr	r3, [r3]
    8674:	e3a020c6 	mov	r2, #198	; 0xc6
    8678:	e5832008 	str	r2, [r3, #8]
    867c:	e59f30ac 	ldr	r3, [pc, #172]	; 8730 <RPI_MiniUartInit+0x134>
    8680:	e5933000 	ldr	r3, [r3]
    8684:	e59f20a8 	ldr	r2, [pc, #168]	; 8734 <RPI_MiniUartInit+0x138>
    8688:	e5832028 	str	r2, [r3, #40]	; 0x28
    868c:	e3a01002 	mov	r1, #2
    8690:	e3a0000e 	mov	r0, #14
    8694:	ebfffec8 	bl	81bc <RPI_SetGpioPinFunction>
    8698:	e3a01002 	mov	r1, #2
    869c:	e3a0000f 	mov	r0, #15
    86a0:	ebfffec5 	bl	81bc <RPI_SetGpioPinFunction>
    86a4:	e51b3008 	ldr	r3, [fp, #-8]
    86a8:	e3a02000 	mov	r2, #0
    86ac:	e5832094 	str	r2, [r3, #148]	; 0x94
    86b0:	e3a03000 	mov	r3, #0
    86b4:	e50b300c 	str	r3, [fp, #-12]
    86b8:	ea000002 	b	86c8 <RPI_MiniUartInit+0xcc>
    86bc:	e51b300c 	ldr	r3, [fp, #-12]
    86c0:	e2833001 	add	r3, r3, #1
    86c4:	e50b300c 	str	r3, [fp, #-12]
    86c8:	e51b300c 	ldr	r3, [fp, #-12]
    86cc:	e3530095 	cmp	r3, #149	; 0x95
    86d0:	dafffff9 	ble	86bc <RPI_MiniUartInit+0xc0>
    86d4:	e51b3008 	ldr	r3, [fp, #-8]
    86d8:	e3a02903 	mov	r2, #49152	; 0xc000
    86dc:	e5832098 	str	r2, [r3, #152]	; 0x98
    86e0:	e3a03000 	mov	r3, #0
    86e4:	e50b300c 	str	r3, [fp, #-12]
    86e8:	ea000002 	b	86f8 <RPI_MiniUartInit+0xfc>
    86ec:	e51b300c 	ldr	r3, [fp, #-12]
    86f0:	e2833001 	add	r3, r3, #1
    86f4:	e50b300c 	str	r3, [fp, #-12]
    86f8:	e51b300c 	ldr	r3, [fp, #-12]
    86fc:	e3530095 	cmp	r3, #149	; 0x95
    8700:	dafffff9 	ble	86ec <RPI_MiniUartInit+0xf0>
    8704:	e51b3008 	ldr	r3, [fp, #-8]
    8708:	e3a02000 	mov	r2, #0
    870c:	e5832098 	str	r2, [r3, #152]	; 0x98
    8710:	e59f3018 	ldr	r3, [pc, #24]	; 8730 <RPI_MiniUartInit+0x134>
    8714:	e5933000 	ldr	r3, [r3]
    8718:	e3a02003 	mov	r2, #3
    871c:	e5832020 	str	r2, [r3, #32]
    8720:	e320f000 	nop	{0}
    8724:	e24bd004 	sub	sp, fp, #4
    8728:	e8bd8800 	pop	{fp, pc}
    872c:	00008d54 	andeq	r8, r0, r4, asr sp
    8730:	00008d58 	andeq	r8, r0, r8, asr sp
    8734:	0000010e 	andeq	r0, r0, lr, lsl #2

00008738 <RPI_WriteToMiniUart>:
    8738:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    873c:	e28db000 	add	fp, sp, #0
    8740:	e24dd00c 	sub	sp, sp, #12
    8744:	e1a03000 	mov	r3, r0
    8748:	e54b3005 	strb	r3, [fp, #-5]
    874c:	e320f000 	nop	{0}
    8750:	e59f3030 	ldr	r3, [pc, #48]	; 8788 <RPI_WriteToMiniUart+0x50>
    8754:	e5933000 	ldr	r3, [r3]
    8758:	e5933014 	ldr	r3, [r3, #20]
    875c:	e2033020 	and	r3, r3, #32
    8760:	e3530000 	cmp	r3, #0
    8764:	0afffff9 	beq	8750 <RPI_WriteToMiniUart+0x18>
    8768:	e59f3018 	ldr	r3, [pc, #24]	; 8788 <RPI_WriteToMiniUart+0x50>
    876c:	e5933000 	ldr	r3, [r3]
    8770:	e55b2005 	ldrb	r2, [fp, #-5]
    8774:	e5832000 	str	r2, [r3]
    8778:	e320f000 	nop	{0}
    877c:	e28bd000 	add	sp, fp, #0
    8780:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8784:	e12fff1e 	bx	lr
    8788:	00008d58 	andeq	r8, r0, r8, asr sp

0000878c <RPI_printStringOfLen>:
    878c:	e92d4800 	push	{fp, lr}
    8790:	e28db004 	add	fp, sp, #4
    8794:	e24dd010 	sub	sp, sp, #16
    8798:	e50b0010 	str	r0, [fp, #-16]
    879c:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    87a0:	e3a03000 	mov	r3, #0
    87a4:	e50b3008 	str	r3, [fp, #-8]
    87a8:	ea000008 	b	87d0 <RPI_printStringOfLen+0x44>
    87ac:	e51b3010 	ldr	r3, [fp, #-16]
    87b0:	e2832001 	add	r2, r3, #1
    87b4:	e50b2010 	str	r2, [fp, #-16]
    87b8:	e5d33000 	ldrb	r3, [r3]
    87bc:	e1a00003 	mov	r0, r3
    87c0:	ebffffdc 	bl	8738 <RPI_WriteToMiniUart>
    87c4:	e51b3008 	ldr	r3, [fp, #-8]
    87c8:	e2833001 	add	r3, r3, #1
    87cc:	e50b3008 	str	r3, [fp, #-8]
    87d0:	e51b2008 	ldr	r2, [fp, #-8]
    87d4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    87d8:	e1520003 	cmp	r2, r3
    87dc:	bafffff2 	blt	87ac <RPI_printStringOfLen+0x20>
    87e0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    87e4:	e1a00003 	mov	r0, r3
    87e8:	e24bd004 	sub	sp, fp, #4
    87ec:	e8bd8800 	pop	{fp, pc}

000087f0 <RPI_printString>:
    87f0:	e92d4800 	push	{fp, lr}
    87f4:	e28db004 	add	fp, sp, #4
    87f8:	e24dd008 	sub	sp, sp, #8
    87fc:	e50b0008 	str	r0, [fp, #-8]
    8800:	ea000005 	b	881c <RPI_printString+0x2c>
    8804:	e51b3008 	ldr	r3, [fp, #-8]
    8808:	e2832001 	add	r2, r3, #1
    880c:	e50b2008 	str	r2, [fp, #-8]
    8810:	e5d33000 	ldrb	r3, [r3]
    8814:	e1a00003 	mov	r0, r3
    8818:	ebffffc6 	bl	8738 <RPI_WriteToMiniUart>
    881c:	e51b3008 	ldr	r3, [fp, #-8]
    8820:	e5d33000 	ldrb	r3, [r3]
    8824:	e3530000 	cmp	r3, #0
    8828:	1afffff5 	bne	8804 <RPI_printString+0x14>
    882c:	e320f000 	nop	{0}
    8830:	e24bd004 	sub	sp, fp, #4
    8834:	e8bd8800 	pop	{fp, pc}

00008838 <RPI_ReadFromMiniUart>:
    8838:	e92d4800 	push	{fp, lr}
    883c:	e28db004 	add	fp, sp, #4
    8840:	e24dd008 	sub	sp, sp, #8
    8844:	e50b0008 	str	r0, [fp, #-8]
    8848:	e50b100c 	str	r1, [fp, #-12]
    884c:	e51b200c 	ldr	r2, [fp, #-12]
    8850:	e51b1008 	ldr	r1, [fp, #-8]
    8854:	e59f0010 	ldr	r0, [pc, #16]	; 886c <RPI_ReadFromMiniUart+0x34>
    8858:	eb0000b5 	bl	8b34 <fifo_read>
    885c:	e1a03000 	mov	r3, r0
    8860:	e1a00003 	mov	r0, r3
    8864:	e24bd004 	sub	sp, fp, #4
    8868:	e8bd8800 	pop	{fp, pc}
    886c:	00008da4 	andeq	r8, r0, r4, lsr #27

00008870 <RPI_MiniUart_ISR>:
    8870:	e92d4800 	push	{fp, lr}
    8874:	e28db004 	add	fp, sp, #4
    8878:	e24dd008 	sub	sp, sp, #8
    887c:	e59f30c4 	ldr	r3, [pc, #196]	; 8948 <RPI_MiniUart_ISR+0xd8>
    8880:	e5933000 	ldr	r3, [r3]
    8884:	e5933008 	ldr	r3, [r3, #8]
    8888:	e2033004 	and	r3, r3, #4
    888c:	e3530000 	cmp	r3, #0
    8890:	0a000016 	beq	88f0 <RPI_MiniUart_ISR+0x80>
    8894:	e59f30ac 	ldr	r3, [pc, #172]	; 8948 <RPI_MiniUart_ISR+0xd8>
    8898:	e5933000 	ldr	r3, [r3]
    889c:	e5933000 	ldr	r3, [r3]
    88a0:	e50b3008 	str	r3, [fp, #-8]
    88a4:	e59f309c 	ldr	r3, [pc, #156]	; 8948 <RPI_MiniUart_ISR+0xd8>
    88a8:	e5933000 	ldr	r3, [r3]
    88ac:	e51b2008 	ldr	r2, [fp, #-8]
    88b0:	e5832000 	str	r2, [r3]
    88b4:	e59f308c 	ldr	r3, [pc, #140]	; 8948 <RPI_MiniUart_ISR+0xd8>
    88b8:	e5933000 	ldr	r3, [r3]
    88bc:	e59f2084 	ldr	r2, [pc, #132]	; 8948 <RPI_MiniUart_ISR+0xd8>
    88c0:	e5922000 	ldr	r2, [r2]
    88c4:	e5922004 	ldr	r2, [r2, #4]
    88c8:	e3822001 	orr	r2, r2, #1
    88cc:	e5832004 	str	r2, [r3, #4]
    88d0:	e51b3008 	ldr	r3, [fp, #-8]
    88d4:	e6ef3073 	uxtb	r3, r3
    88d8:	e54b3009 	strb	r3, [fp, #-9]
    88dc:	e24b3009 	sub	r3, fp, #9
    88e0:	e3a02001 	mov	r2, #1
    88e4:	e1a01003 	mov	r1, r3
    88e8:	e59f005c 	ldr	r0, [pc, #92]	; 894c <RPI_MiniUart_ISR+0xdc>
    88ec:	eb0000c9 	bl	8c18 <fifo_write>
    88f0:	e59f3050 	ldr	r3, [pc, #80]	; 8948 <RPI_MiniUart_ISR+0xd8>
    88f4:	e5933000 	ldr	r3, [r3]
    88f8:	e5933008 	ldr	r3, [r3, #8]
    88fc:	e2033002 	and	r3, r3, #2
    8900:	e3530000 	cmp	r3, #0
    8904:	0a00000c 	beq	893c <RPI_MiniUart_ISR+0xcc>
    8908:	e59f3038 	ldr	r3, [pc, #56]	; 8948 <RPI_MiniUart_ISR+0xd8>
    890c:	e5933000 	ldr	r3, [r3]
    8910:	e5933014 	ldr	r3, [r3, #20]
    8914:	e2033040 	and	r3, r3, #64	; 0x40
    8918:	e3530000 	cmp	r3, #0
    891c:	0a000006 	beq	893c <RPI_MiniUart_ISR+0xcc>
    8920:	e59f3020 	ldr	r3, [pc, #32]	; 8948 <RPI_MiniUart_ISR+0xd8>
    8924:	e5933000 	ldr	r3, [r3]
    8928:	e59f2018 	ldr	r2, [pc, #24]	; 8948 <RPI_MiniUart_ISR+0xd8>
    892c:	e5922000 	ldr	r2, [r2]
    8930:	e5922004 	ldr	r2, [r2, #4]
    8934:	e3c22001 	bic	r2, r2, #1
    8938:	e5832004 	str	r2, [r3, #4]
    893c:	e320f000 	nop	{0}
    8940:	e24bd004 	sub	sp, fp, #4
    8944:	e8bd8800 	pop	{fp, pc}
    8948:	00008d58 	andeq	r8, r0, r8, asr sp
    894c:	00008da4 	andeq	r8, r0, r4, lsr #27

00008950 <shell_main>:
    8950:	e92d4800 	push	{fp, lr}
    8954:	e28db004 	add	fp, sp, #4
    8958:	e24dd018 	sub	sp, sp, #24
    895c:	ebffff1d 	bl	85d8 <RPI_GetMiniUart>
    8960:	e50b0010 	str	r0, [fp, #-16]
    8964:	e24b301c 	sub	r3, fp, #28
    8968:	e50b300c 	str	r3, [fp, #-12]
    896c:	e59f007c 	ldr	r0, [pc, #124]	; 89f0 <shell_main+0xa0>
    8970:	ebffff9e 	bl	87f0 <RPI_printString>
    8974:	e3a03000 	mov	r3, #0
    8978:	e50b3008 	str	r3, [fp, #-8]
    897c:	ea000015 	b	89d8 <shell_main+0x88>
    8980:	e320f000 	nop	{0}
    8984:	e51b3010 	ldr	r3, [fp, #-16]
    8988:	e5933014 	ldr	r3, [r3, #20]
    898c:	e2033001 	and	r3, r3, #1
    8990:	e3530000 	cmp	r3, #0
    8994:	0afffffa 	beq	8984 <shell_main+0x34>
    8998:	e51b3010 	ldr	r3, [fp, #-16]
    899c:	e5933000 	ldr	r3, [r3]
    89a0:	e6ef2073 	uxtb	r2, r3
    89a4:	e51b300c 	ldr	r3, [fp, #-12]
    89a8:	e5c32000 	strb	r2, [r3]
    89ac:	e51b300c 	ldr	r3, [fp, #-12]
    89b0:	e5d33000 	ldrb	r3, [r3]
    89b4:	e1a02003 	mov	r2, r3
    89b8:	e51b3010 	ldr	r3, [fp, #-16]
    89bc:	e5832000 	str	r2, [r3]
    89c0:	e51b300c 	ldr	r3, [fp, #-12]
    89c4:	e2833001 	add	r3, r3, #1
    89c8:	e50b300c 	str	r3, [fp, #-12]
    89cc:	e51b3008 	ldr	r3, [fp, #-8]
    89d0:	e2833001 	add	r3, r3, #1
    89d4:	e50b3008 	str	r3, [fp, #-8]
    89d8:	e51b3008 	ldr	r3, [fp, #-8]
    89dc:	e3530009 	cmp	r3, #9
    89e0:	daffffe6 	ble	8980 <shell_main+0x30>
    89e4:	e59f0008 	ldr	r0, [pc, #8]	; 89f4 <shell_main+0xa4>
    89e8:	ebffff80 	bl	87f0 <RPI_printString>
    89ec:	eaffffde 	b	896c <shell_main+0x1c>
    89f0:	00008d5c 	andeq	r8, r0, ip, asr sp
    89f4:	00008d80 	andeq	r8, r0, r0, lsl #27

000089f8 <kernel_main>:
    89f8:	e92d4800 	push	{fp, lr}
    89fc:	e28db004 	add	fp, sp, #4
    8a00:	e24dd040 	sub	sp, sp, #64	; 0x40
    8a04:	e50b0038 	str	r0, [fp, #-56]	; 0xffffffc8
    8a08:	e50b103c 	str	r1, [fp, #-60]	; 0xffffffc4
    8a0c:	e50b2040 	str	r2, [fp, #-64]	; 0xffffffc0
    8a10:	ebfffde0 	bl	8198 <RPI_GetGpio>
    8a14:	e1a03000 	mov	r3, r0
    8a18:	e5932004 	ldr	r2, [r3, #4]
    8a1c:	e3822701 	orr	r2, r2, #262144	; 0x40000
    8a20:	e5832004 	str	r2, [r3, #4]
    8a24:	ebfffe31 	bl	82f0 <RPI_GetIrqController>
    8a28:	e1a02000 	mov	r2, r0
    8a2c:	e3a03001 	mov	r3, #1
    8a30:	e5823018 	str	r3, [r2, #24]
    8a34:	ebfffdc8 	bl	815c <RPI_GetArmTimer>
    8a38:	e1a02000 	mov	r2, r0
    8a3c:	e3a03b01 	mov	r3, #1024	; 0x400
    8a40:	e5823000 	str	r3, [r2]
    8a44:	ebfffdc4 	bl	815c <RPI_GetArmTimer>
    8a48:	e1a02000 	mov	r2, r0
    8a4c:	e3a030aa 	mov	r3, #170	; 0xaa
    8a50:	e5823008 	str	r3, [r2, #8]
    8a54:	ebfffe25 	bl	82f0 <RPI_GetIrqController>
    8a58:	e1a02000 	mov	r2, r0
    8a5c:	e3a03002 	mov	r3, #2
    8a60:	e5823010 	str	r3, [r2, #16]
    8a64:	ebfffeb3 	bl	8538 <RPI_GetSystemTimer>
    8a68:	e1a02000 	mov	r2, r0
    8a6c:	e59f306c 	ldr	r3, [pc, #108]	; 8ae0 <kernel_main+0xe8>
    8a70:	e5823010 	str	r3, [r2, #16]
    8a74:	ebfffee0 	bl	85fc <RPI_MiniUartInit>
    8a78:	ebfffd81 	bl	8084 <_enable_interrupts>
    8a7c:	e59f3060 	ldr	r3, [pc, #96]	; 8ae4 <kernel_main+0xec>
    8a80:	e24bc028 	sub	ip, fp, #40	; 0x28
    8a84:	e1a0e003 	mov	lr, r3
    8a88:	e8be000f 	ldm	lr!, {r0, r1, r2, r3}
    8a8c:	e8ac000f 	stmia	ip!, {r0, r1, r2, r3}
    8a90:	e89e000f 	ldm	lr, {r0, r1, r2, r3}
    8a94:	e8ac0007 	stmia	ip!, {r0, r1, r2}
    8a98:	e1cc30b0 	strh	r3, [ip]
    8a9c:	e59f2044 	ldr	r2, [pc, #68]	; 8ae8 <kernel_main+0xf0>
    8aa0:	e24b3030 	sub	r3, fp, #48	; 0x30
    8aa4:	e8920003 	ldm	r2, {r0, r1}
    8aa8:	e8830003 	stm	r3, {r0, r1}
    8aac:	e59f3038 	ldr	r3, [pc, #56]	; 8aec <kernel_main+0xf4>
    8ab0:	e50b3008 	str	r3, [fp, #-8]
    8ab4:	e24b3028 	sub	r3, fp, #40	; 0x28
    8ab8:	e3a0100a 	mov	r1, #10
    8abc:	e1a00003 	mov	r0, r3
    8ac0:	ebffff31 	bl	878c <RPI_printStringOfLen>
    8ac4:	e51b0008 	ldr	r0, [fp, #-8]
    8ac8:	ebfffea3 	bl	855c <RPI_WaitMicroSeconds>
    8acc:	e24b3030 	sub	r3, fp, #48	; 0x30
    8ad0:	e3a01002 	mov	r1, #2
    8ad4:	e1a00003 	mov	r0, r3
    8ad8:	ebffff2b 	bl	878c <RPI_printStringOfLen>
    8adc:	eafffffe 	b	8adc <kernel_main+0xe4>
    8ae0:	000186a0 	andeq	r8, r1, r0, lsr #13
    8ae4:	00008d1c 	andeq	r8, r0, ip, lsl sp
    8ae8:	00008d3c 	andeq	r8, r0, ip, lsr sp
    8aec:	004c4b40 	subeq	r4, ip, r0, asr #22

00008af0 <fifo_init>:
    8af0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8af4:	e28db000 	add	fp, sp, #0
    8af8:	e24dd00c 	sub	sp, sp, #12
    8afc:	e50b0008 	str	r0, [fp, #-8]
    8b00:	e51b3008 	ldr	r3, [fp, #-8]
    8b04:	e3a02000 	mov	r2, #0
    8b08:	e583200c 	str	r2, [r3, #12]
    8b0c:	e51b3008 	ldr	r3, [fp, #-8]
    8b10:	e3a02000 	mov	r2, #0
    8b14:	e5832010 	str	r2, [r3, #16]
    8b18:	e51b3008 	ldr	r3, [fp, #-8]
    8b1c:	e3a0200a 	mov	r2, #10
    8b20:	e5832014 	str	r2, [r3, #20]
    8b24:	e320f000 	nop	{0}
    8b28:	e28bd000 	add	sp, fp, #0
    8b2c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8b30:	e12fff1e 	bx	lr

00008b34 <fifo_read>:
    8b34:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8b38:	e28db000 	add	fp, sp, #0
    8b3c:	e24dd01c 	sub	sp, sp, #28
    8b40:	e50b0010 	str	r0, [fp, #-16]
    8b44:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    8b48:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    8b4c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8b50:	e50b300c 	str	r3, [fp, #-12]
    8b54:	e3a03000 	mov	r3, #0
    8b58:	e50b3008 	str	r3, [fp, #-8]
    8b5c:	ea000024 	b	8bf4 <fifo_read+0xc0>
    8b60:	e51b3010 	ldr	r3, [fp, #-16]
    8b64:	e5932010 	ldr	r2, [r3, #16]
    8b68:	e51b3010 	ldr	r3, [fp, #-16]
    8b6c:	e593300c 	ldr	r3, [r3, #12]
    8b70:	e1520003 	cmp	r2, r3
    8b74:	0a000019 	beq	8be0 <fifo_read+0xac>
    8b78:	e51b300c 	ldr	r3, [fp, #-12]
    8b7c:	e2832001 	add	r2, r3, #1
    8b80:	e50b200c 	str	r2, [fp, #-12]
    8b84:	e51b2010 	ldr	r2, [fp, #-16]
    8b88:	e5922010 	ldr	r2, [r2, #16]
    8b8c:	e51b1010 	ldr	r1, [fp, #-16]
    8b90:	e7d12002 	ldrb	r2, [r1, r2]
    8b94:	e5c32000 	strb	r2, [r3]
    8b98:	e51b3010 	ldr	r3, [fp, #-16]
    8b9c:	e5933010 	ldr	r3, [r3, #16]
    8ba0:	e2832001 	add	r2, r3, #1
    8ba4:	e51b3010 	ldr	r3, [fp, #-16]
    8ba8:	e5832010 	str	r2, [r3, #16]
    8bac:	e51b3010 	ldr	r3, [fp, #-16]
    8bb0:	e5932010 	ldr	r2, [r3, #16]
    8bb4:	e51b3010 	ldr	r3, [fp, #-16]
    8bb8:	e5933014 	ldr	r3, [r3, #20]
    8bbc:	e1520003 	cmp	r2, r3
    8bc0:	1a000002 	bne	8bd0 <fifo_read+0x9c>
    8bc4:	e51b3010 	ldr	r3, [fp, #-16]
    8bc8:	e3a02000 	mov	r2, #0
    8bcc:	e5832010 	str	r2, [r3, #16]
    8bd0:	e51b3008 	ldr	r3, [fp, #-8]
    8bd4:	e2833001 	add	r3, r3, #1
    8bd8:	e50b3008 	str	r3, [fp, #-8]
    8bdc:	ea000001 	b	8be8 <fifo_read+0xb4>
    8be0:	e51b3008 	ldr	r3, [fp, #-8]
    8be4:	ea000007 	b	8c08 <fifo_read+0xd4>
    8be8:	e51b3008 	ldr	r3, [fp, #-8]
    8bec:	e2833001 	add	r3, r3, #1
    8bf0:	e50b3008 	str	r3, [fp, #-8]
    8bf4:	e51b2008 	ldr	r2, [fp, #-8]
    8bf8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8bfc:	e1520003 	cmp	r2, r3
    8c00:	baffffd6 	blt	8b60 <fifo_read+0x2c>
    8c04:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8c08:	e1a00003 	mov	r0, r3
    8c0c:	e28bd000 	add	sp, fp, #0
    8c10:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8c14:	e12fff1e 	bx	lr

00008c18 <fifo_write>:
    8c18:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8c1c:	e28db000 	add	fp, sp, #0
    8c20:	e24dd01c 	sub	sp, sp, #28
    8c24:	e50b0010 	str	r0, [fp, #-16]
    8c28:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    8c2c:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    8c30:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8c34:	e50b300c 	str	r3, [fp, #-12]
    8c38:	e3a03000 	mov	r3, #0
    8c3c:	e50b3008 	str	r3, [fp, #-8]
    8c40:	ea00002c 	b	8cf8 <fifo_write+0xe0>
    8c44:	e51b3010 	ldr	r3, [fp, #-16]
    8c48:	e593300c 	ldr	r3, [r3, #12]
    8c4c:	e2832001 	add	r2, r3, #1
    8c50:	e51b3010 	ldr	r3, [fp, #-16]
    8c54:	e5933010 	ldr	r3, [r3, #16]
    8c58:	e1520003 	cmp	r2, r3
    8c5c:	0a00000a 	beq	8c8c <fifo_write+0x74>
    8c60:	e51b3010 	ldr	r3, [fp, #-16]
    8c64:	e593300c 	ldr	r3, [r3, #12]
    8c68:	e2832001 	add	r2, r3, #1
    8c6c:	e51b3010 	ldr	r3, [fp, #-16]
    8c70:	e5933014 	ldr	r3, [r3, #20]
    8c74:	e1520003 	cmp	r2, r3
    8c78:	1a000005 	bne	8c94 <fifo_write+0x7c>
    8c7c:	e51b3010 	ldr	r3, [fp, #-16]
    8c80:	e5933010 	ldr	r3, [r3, #16]
    8c84:	e3530000 	cmp	r3, #0
    8c88:	1a000001 	bne	8c94 <fifo_write+0x7c>
    8c8c:	e51b3008 	ldr	r3, [fp, #-8]
    8c90:	ea00001d 	b	8d0c <fifo_write+0xf4>
    8c94:	e51b3010 	ldr	r3, [fp, #-16]
    8c98:	e593200c 	ldr	r2, [r3, #12]
    8c9c:	e51b300c 	ldr	r3, [fp, #-12]
    8ca0:	e2831001 	add	r1, r3, #1
    8ca4:	e50b100c 	str	r1, [fp, #-12]
    8ca8:	e5d31000 	ldrb	r1, [r3]
    8cac:	e51b3010 	ldr	r3, [fp, #-16]
    8cb0:	e7c31002 	strb	r1, [r3, r2]
    8cb4:	e51b3010 	ldr	r3, [fp, #-16]
    8cb8:	e593300c 	ldr	r3, [r3, #12]
    8cbc:	e2832001 	add	r2, r3, #1
    8cc0:	e51b3010 	ldr	r3, [fp, #-16]
    8cc4:	e583200c 	str	r2, [r3, #12]
    8cc8:	e51b3010 	ldr	r3, [fp, #-16]
    8ccc:	e593200c 	ldr	r2, [r3, #12]
    8cd0:	e51b3010 	ldr	r3, [fp, #-16]
    8cd4:	e5933014 	ldr	r3, [r3, #20]
    8cd8:	e1520003 	cmp	r2, r3
    8cdc:	1a000002 	bne	8cec <fifo_write+0xd4>
    8ce0:	e51b3010 	ldr	r3, [fp, #-16]
    8ce4:	e3a02000 	mov	r2, #0
    8ce8:	e583200c 	str	r2, [r3, #12]
    8cec:	e51b3008 	ldr	r3, [fp, #-8]
    8cf0:	e2833001 	add	r3, r3, #1
    8cf4:	e50b3008 	str	r3, [fp, #-8]
    8cf8:	e51b2008 	ldr	r2, [fp, #-8]
    8cfc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8d00:	e1520003 	cmp	r2, r3
    8d04:	baffffce 	blt	8c44 <fifo_write+0x2c>
    8d08:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8d0c:	e1a00003 	mov	r0, r3
    8d10:	e28bd000 	add	sp, fp, #0
    8d14:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8d18:	e12fff1e 	bx	lr

Disassembly of section .rodata:

00008d1c <.rodata>:
    8d1c:	74530d0a 	ldrbvc	r0, [r3], #-3338	; 0xfffff2f6
    8d20:	69747261 	ldmdbvs	r4!, {r0, r5, r6, r9, ip, sp, lr}^
    8d24:	7320676e 			; <UNDEFINED> instruction: 0x7320676e
    8d28:	6c6c6568 	cfstr64vs	mvdx6, [ip], #-416	; 0xfffffe60
    8d2c:	6f727020 	svcvs	0x00727020
    8d30:	6d617267 	sfmvs	f7, 2, [r1, #-412]!	; 0xfffffe64
    8d34:	0a2e2e2e 	beq	b945f4 <_heap+0xb145f0>
    8d38:	0000000d 	andeq	r0, r0, sp
    8d3c:	74736574 	ldrbtvc	r6, [r3], #-1396	; 0xfffffa8c
    8d40:	00676e69 	rsbeq	r6, r7, r9, ror #28

Disassembly of section .data:

00008d44 <__data_start>:
    8d44:	2000b400 	andcs	fp, r0, r0, lsl #8

00008d48 <rpiGpio>:
    8d48:	20200000 	eorcs	r0, r0, r0

00008d4c <rpiIRQController>:
    8d4c:	2000b200 	andcs	fp, r0, r0, lsl #4

00008d50 <rpiSystemTimer>:
    8d50:	20003000 	andcs	r3, r0, r0

00008d54 <rpiAux>:
    8d54:	20215000 	eorcs	r5, r1, r0

00008d58 <rpiMiniUart>:
    8d58:	20215040 	eorcs	r5, r1, r0, asr #32

00008d5c <enter_command_text.6883>:
    8d5c:	65746e45 	ldrbvs	r6, [r4, #-3653]!	; 0xfffff1bb
    8d60:	6f632072 	svcvs	0x00632072
    8d64:	6e616d6d 	cdpvs	13, 6, cr6, cr1, cr13, {3}
    8d68:	61282064 			; <UNDEFINED> instruction: 0x61282064
    8d6c:	6520646e 	strvs	r6, [r0, #-1134]!	; 0xfffffb92
    8d70:	7720646e 	strvc	r6, [r0, -lr, ror #8]!
    8d74:	20687469 	rsbcs	r7, r8, r9, ror #8
    8d78:	203a293b 	eorscs	r2, sl, fp, lsr r9
    8d7c:	00000000 	andeq	r0, r0, r0

00008d80 <command_not_found_text.6882>:
    8d80:	206f4e0a 	rsbcs	r4, pc, sl, lsl #28
    8d84:	68637573 	stmdavs	r3!, {r0, r1, r4, r5, r6, r8, sl, ip, sp, lr}^
    8d88:	6d6f6320 	stclvs	3, cr6, [pc, #-128]!	; 8d10 <fifo_write+0xf8>
    8d8c:	646e616d 	strbtvs	r6, [lr], #-365	; 0xfffffe93
    8d90:	756f6620 	strbvc	r6, [pc, #-1568]!	; 8778 <RPI_WriteToMiniUart+0x40>
    8d94:	0d2e646e 	cfstrseq	mvf6, [lr, #-440]!	; 0xfffffe48
    8d98:	Address 0x0000000000008d98 is out of bounds.


Disassembly of section .bss:

00008d9c <msCounter.5513>:
    8d9c:	00000000 	andeq	r0, r0, r0

00008da0 <lit.5512>:
    8da0:	00000000 	andeq	r0, r0, r0

00008da4 <fifo_buffer>:
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
  34:	0000005c 	andeq	r0, r0, ip, asr r0
	...
  40:	0000001c 	andeq	r0, r0, ip, lsl r0
  44:	017c0002 	cmneq	ip, r2
  48:	00040000 	andeq	r0, r4, r0
  4c:	00000000 	andeq	r0, r0, r0
  50:	0000815c 	andeq	r8, r0, ip, asr r1
  54:	0000003c 	andeq	r0, r0, ip, lsr r0
	...
  60:	0000001c 	andeq	r0, r0, ip, lsl r0
  64:	02bc0002 	adcseq	r0, ip, #2
  68:	00040000 	andeq	r0, r4, r0
  6c:	00000000 	andeq	r0, r0, r0
  70:	00008198 	muleq	r0, r8, r1
  74:	00000158 	andeq	r0, r0, r8, asr r1
	...
  80:	0000001c 	andeq	r0, r0, ip, lsl r0
  84:	079a0002 	ldreq	r0, [sl, r2]
  88:	00040000 	andeq	r0, r4, r0
  8c:	00000000 	andeq	r0, r0, r0
  90:	000082f0 	strdeq	r8, [r0], -r0
  94:	00000248 	andeq	r0, r0, r8, asr #4
	...
  a0:	0000001c 	andeq	r0, r0, ip, lsl r0
  a4:	09d90002 	ldmibeq	r9, {r1}^
  a8:	00040000 	andeq	r0, r4, r0
  ac:	00000000 	andeq	r0, r0, r0
  b0:	00008538 	andeq	r8, r0, r8, lsr r5
  b4:	0000007c 	andeq	r0, r0, ip, ror r0
	...
  c0:	0000001c 	andeq	r0, r0, ip, lsl r0
  c4:	0b200002 	bleq	8000d4 <_heap+0x7800d0>
  c8:	00040000 	andeq	r0, r4, r0
  cc:	00000000 	andeq	r0, r0, r0
  d0:	000085b4 			; <UNDEFINED> instruction: 0x000085b4
  d4:	0000039c 	muleq	r0, ip, r3
	...
  e0:	0000001c 	andeq	r0, r0, ip, lsl r0
  e4:	12170002 	andsne	r0, r7, #2
  e8:	00040000 	andeq	r0, r4, r0
  ec:	00000000 	andeq	r0, r0, r0
  f0:	00008950 	andeq	r8, r0, r0, asr r9
  f4:	000000a8 	andeq	r0, r0, r8, lsr #1
	...
 100:	0000001c 	andeq	r0, r0, ip, lsl r0
 104:	1c0e0002 	stcne	0, cr0, [lr], {2}
 108:	00040000 	andeq	r0, r4, r0
 10c:	00000000 	andeq	r0, r0, r0
 110:	000089f8 	strdeq	r8, [r0], -r8	; <UNPREDICTABLE>
 114:	000000f8 	strdeq	r0, [r0], -r8
	...
 120:	0000001c 	andeq	r0, r0, ip, lsl r0
 124:	1d1f0002 	ldcne	0, cr0, [pc, #-8]	; 124 <CPSR_IRQ_INHIBIT+0xa4>
 128:	00040000 	andeq	r0, r4, r0
 12c:	00000000 	andeq	r0, r0, r0
 130:	00008af0 	strdeq	r8, [r0], -r0
 134:	0000022c 	andeq	r0, r0, ip, lsr #4
	...
 140:	0000001c 	andeq	r0, r0, ip, lsl r0
 144:	1edf0002 	cdpne	0, 13, cr0, cr15, cr2, {0}
 148:	00040000 	andeq	r0, r4, r0
 14c:	00000000 	andeq	r0, r0, r0
 150:	00008000 	andeq	r8, r0, r0
 154:	00000094 	muleq	r0, r4, r0
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
      98:	01130704 	tsteq	r3, r4, lsl #14
      9c:	04090000 	streq	r0, [r9], #-0
      a0:	0000002c 	andeq	r0, r0, ip, lsr #32
      a4:	0000d300 	andeq	sp, r0, r0, lsl #6
      a8:	89000400 	stmdbhi	r0, {sl}
      ac:	04000000 	streq	r0, [r0], #-0
      b0:	00004401 	andeq	r4, r0, r1, lsl #8
      b4:	01380c00 	teqeq	r8, r0, lsl #24
      b8:	81000000 	mrshi	r0, (UNDEF: 0)
      bc:	005c0000 	subseq	r0, ip, r0
      c0:	00680000 	rsbeq	r0, r8, r0
      c4:	01020000 	mrseq	r0, (UNDEF: 2)
      c8:	0000c206 	andeq	ip, r0, r6, lsl #4
      cc:	08010200 	stmdaeq	r1, {r9}
      d0:	000000c0 	andeq	r0, r0, r0, asr #1
      d4:	2e050202 	cdpcs	2, 0, cr0, cr5, cr2, {0}
      d8:	02000001 	andeq	r0, r0, #1
      dc:	00ce0702 	sbceq	r0, lr, r2, lsl #14
      e0:	04020000 	streq	r0, [r2], #-0
      e4:	00012505 	andeq	r2, r1, r5, lsl #10
      e8:	00e10300 	rsceq	r0, r1, r0, lsl #6
      ec:	41020000 	mrsmi	r0, (UNDEF: 2)
      f0:	0000004f 	andeq	r0, r0, pc, asr #32
      f4:	0e070402 	cdpeq	4, 0, cr0, cr7, cr2, {0}
      f8:	02000001 	andeq	r0, r0, #1
      fc:	01200508 			; <UNDEFINED> instruction: 0x01200508
     100:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
     104:	00010907 	andeq	r0, r1, r7, lsl #18
     108:	05040400 	streq	r0, [r4, #-1024]	; 0xfffffc00
     10c:	00746e69 	rsbseq	r6, r4, r9, ror #28
     110:	13070402 	movwne	r0, #29698	; 0x7402
     114:	03000001 	movweq	r0, #1
     118:	000000e3 	andeq	r0, r0, r3, ror #1
     11c:	00443003 	subeq	r3, r4, r3
     120:	f4050000 	vst4.8	{d0-d3}, [r5], r0
     124:	01000000 	mrseq	r0, (UNDEF: 0)
     128:	00812412 	addeq	r2, r1, r2, lsl r4
     12c:	00003800 	andeq	r3, r0, r0, lsl #16
     130:	af9c0100 	svcge	0x009c0100
     134:	06000000 	streq	r0, [r0], -r0
     138:	000000b6 	strheq	r0, [r0], -r6
     13c:	00af1401 	adceq	r1, pc, r1, lsl #8
     140:	91020000 	mrsls	r0, (UNDEF: 2)
     144:	00fc0677 	rscseq	r0, ip, r7, ror r6
     148:	15010000 	strne	r0, [r1, #-0]
     14c:	00000072 	andeq	r0, r0, r2, ror r0
     150:	00709102 	rsbseq	r9, r0, r2, lsl #2
     154:	c9080102 	stmdbgt	r8, {r1, r8}
     158:	07000000 	streq	r0, [r0, -r0]
     15c:	000000ec 	andeq	r0, r0, ip, ror #1
     160:	81000801 	tsthi	r0, r1, lsl #16
     164:	00240000 	eoreq	r0, r4, r0
     168:	9c010000 	stcls	0, cr0, [r1], {-0}
     16c:	0000b606 	andeq	fp, r0, r6, lsl #12
     170:	af0a0100 	svcge	0x000a0100
     174:	02000000 	andeq	r0, r0, #0
     178:	00007791 	muleq	r0, r1, r7
     17c:	0000013c 	andeq	r0, r0, ip, lsr r1
     180:	00ff0004 	rscseq	r0, pc, r4
     184:	01040000 	mrseq	r0, (UNDEF: 4)
     188:	00000044 	andeq	r0, r0, r4, asr #32
     18c:	00017f0c 	andeq	r7, r1, ip, lsl #30
     190:	00815c00 	addeq	r5, r1, r0, lsl #24
     194:	00003c00 	andeq	r3, r0, r0, lsl #24
     198:	00012d00 	andeq	r2, r1, r0, lsl #26
     19c:	06010200 	streq	r0, [r1], -r0, lsl #4
     1a0:	000000c2 	andeq	r0, r0, r2, asr #1
     1a4:	c0080102 	andgt	r0, r8, r2, lsl #2
     1a8:	02000000 	andeq	r0, r0, #0
     1ac:	012e0502 			; <UNDEFINED> instruction: 0x012e0502
     1b0:	02020000 	andeq	r0, r2, #0
     1b4:	0000ce07 	andeq	ip, r0, r7, lsl #28
     1b8:	05040200 	streq	r0, [r4, #-512]	; 0xfffffe00
     1bc:	00000125 	andeq	r0, r0, r5, lsr #2
     1c0:	0000e103 	andeq	lr, r0, r3, lsl #2
     1c4:	4f410200 	svcmi	0x00410200
     1c8:	02000000 	andeq	r0, r0, #0
     1cc:	010e0704 	tsteq	lr, r4, lsl #14
     1d0:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
     1d4:	00012005 	andeq	r2, r1, r5
     1d8:	07080200 	streq	r0, [r8, -r0, lsl #4]
     1dc:	00000109 	andeq	r0, r0, r9, lsl #2
     1e0:	69050404 	stmdbvs	r5, {r2, sl}
     1e4:	0200746e 	andeq	r7, r0, #1845493760	; 0x6e000000
     1e8:	01130704 	tsteq	r3, r4, lsl #14
     1ec:	e3030000 	movw	r0, #12288	; 0x3000
     1f0:	03000000 	movweq	r0, #0
     1f4:	00004430 	andeq	r4, r0, r0, lsr r4
     1f8:	00720500 	rsbseq	r0, r2, r0, lsl #10
     1fc:	24060000 	strcs	r0, [r6], #-0
     200:	00f72804 	rscseq	r2, r7, r4, lsl #16
     204:	63070000 	movwvs	r0, #28672	; 0x7000
     208:	04000001 	streq	r0, [r0], #-1
     20c:	00007d2e 	andeq	r7, r0, lr, lsr #26
     210:	de070000 	cdple	0, 0, cr0, cr7, cr0, {0}
     214:	04000001 	streq	r0, [r0], #-1
     218:	00007d35 	andeq	r7, r0, r5, lsr sp
     21c:	02070400 	andeq	r0, r7, #0, 8
     220:	04000002 	streq	r0, [r0], #-2
     224:	00007d3c 	andeq	r7, r0, ip, lsr sp
     228:	1b070800 	blne	1c2230 <_heap+0x14222c>
     22c:	04000002 	streq	r0, [r0], #-2
     230:	00007d41 	andeq	r7, r0, r1, asr #26
     234:	cd070c00 	stcgt	12, cr0, [r7, #-0]
     238:	04000001 	streq	r0, [r0], #-1
     23c:	00007d4b 	andeq	r7, r0, fp, asr #26
     240:	d4071000 	strle	r1, [r7], #-0
     244:	04000001 	streq	r0, [r0], #-1
     248:	00007d52 	andeq	r7, r0, r2, asr sp
     24c:	68071400 	stmdavs	r7, {sl, ip}
     250:	04000001 	streq	r0, [r0], #-1
     254:	00007d59 	andeq	r7, r0, r9, asr sp
     258:	e4071800 	str	r1, [r7], #-2048	; 0xfffff800
     25c:	04000001 	streq	r0, [r0], #-1
     260:	00007d64 	andeq	r7, r0, r4, ror #26
     264:	ef071c00 	svc	0x00071c00
     268:	04000001 	streq	r0, [r0], #-1
     26c:	00007d72 	andeq	r7, r0, r2, ror sp
     270:	03002000 	movweq	r2, #0
     274:	000001b1 			; <UNDEFINED> instruction: 0x000001b1
     278:	00827404 	addeq	r7, r2, r4, lsl #8
     27c:	c1080000 	mrsgt	r0, (UNDEF: 8)
     280:	01000001 	tsteq	r0, r1
     284:	0001130e 	andeq	r1, r1, lr, lsl #6
     288:	44030500 	strmi	r0, [r3], #-1280	; 0xfffffb00
     28c:	0900008d 	stmdbeq	r0, {r0, r2, r3, r7}
     290:	0000f704 	andeq	pc, r0, r4, lsl #14
     294:	020a0a00 	andeq	r0, sl, #0, 20
     298:	15010000 	strne	r0, [r1, #-0]
     29c:	00008180 	andeq	r8, r0, r0, lsl #3
     2a0:	00000018 	andeq	r0, r0, r8, lsl r0
     2a4:	6f0b9c01 	svcvs	0x000b9c01
     2a8:	01000001 	tsteq	r0, r1
     2ac:	00011310 	andeq	r1, r1, r0, lsl r3
     2b0:	00815c00 	addeq	r5, r1, r0, lsl #24
     2b4:	00002400 	andeq	r2, r0, r0, lsl #8
     2b8:	009c0100 	addseq	r0, ip, r0, lsl #2
     2bc:	000004da 	ldrdeq	r0, [r0], -sl
     2c0:	01a10004 			; <UNDEFINED> instruction: 0x01a10004
     2c4:	01040000 	mrseq	r0, (UNDEF: 4)
     2c8:	00000044 	andeq	r0, r0, r4, asr #32
     2cc:	0005910c 	andeq	r9, r5, ip, lsl #2
     2d0:	00819800 	addeq	r9, r1, r0, lsl #16
     2d4:	00015800 	andeq	r5, r1, r0, lsl #16
     2d8:	00022700 	andeq	r2, r2, r0, lsl #14
     2dc:	06010200 	streq	r0, [r1], -r0, lsl #4
     2e0:	000000c2 	andeq	r0, r0, r2, asr #1
     2e4:	c0080102 	andgt	r0, r8, r2, lsl #2
     2e8:	02000000 	andeq	r0, r0, #0
     2ec:	012e0502 			; <UNDEFINED> instruction: 0x012e0502
     2f0:	02020000 	andeq	r0, r2, #0
     2f4:	0000ce07 	andeq	ip, r0, r7, lsl #28
     2f8:	05040200 	streq	r0, [r4, #-512]	; 0xfffffe00
     2fc:	00000125 	andeq	r0, r0, r5, lsr #2
     300:	0000e103 	andeq	lr, r0, r3, lsl #2
     304:	4f410200 	svcmi	0x00410200
     308:	02000000 	andeq	r0, r0, #0
     30c:	010e0704 	tsteq	lr, r4, lsl #14
     310:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
     314:	00012005 	andeq	r2, r1, r5
     318:	07080200 	streq	r0, [r8, -r0, lsl #4]
     31c:	00000109 	andeq	r0, r0, r9, lsl #2
     320:	69050404 	stmdbvs	r5, {r2, sl}
     324:	0200746e 	andeq	r7, r0, #1845493760	; 0x6e000000
     328:	01130704 	tsteq	r3, r4, lsl #14
     32c:	e3030000 	movw	r0, #12288	; 0x3000
     330:	03000000 	movweq	r0, #0
     334:	00004430 	andeq	r4, r0, r0, lsr r4
     338:	00720500 	rsbseq	r0, r2, r0, lsl #10
     33c:	7d060000 	stcvc	0, cr0, [r6, #-0]
     340:	03000000 	movweq	r0, #0
     344:	00000532 	andeq	r0, r0, r2, lsr r5
     348:	007d1204 	rsbseq	r1, sp, r4, lsl #4
     34c:	a8030000 	stmdage	r3, {}	; <UNPREDICTABLE>
     350:	04000004 	streq	r0, [r0], #-4
     354:	00008213 	andeq	r8, r0, r3, lsl r2
     358:	06550300 	ldrbeq	r0, [r5], -r0, lsl #6
     35c:	14040000 	strne	r0, [r4], #-0
     360:	0000007d 	andeq	r0, r0, sp, ror r0
     364:	00280107 	eoreq	r0, r8, r7, lsl #2
     368:	42050000 	andmi	r0, r5, #0
     36c:	000000e5 	andeq	r0, r0, r5, ror #1
     370:	00057e08 	andeq	r7, r5, r8, lsl #28
     374:	83080000 	movwhi	r0, #32768	; 0x8000
     378:	01000004 	tsteq	r0, r4
     37c:	0006c008 	andeq	ip, r6, r8
     380:	b8080200 	stmdalt	r8, {r9}
     384:	03000006 	movweq	r0, #6
     388:	00069808 	andeq	r9, r6, r8, lsl #16
     38c:	a0080400 	andge	r0, r8, r0, lsl #8
     390:	05000006 	streq	r0, [r0, #-6]
     394:	0006a808 	andeq	sl, r6, r8, lsl #16
     398:	b0080600 	andlt	r0, r8, r0, lsl #12
     39c:	07000006 	streq	r0, [r0, -r6]
     3a0:	055c0300 	ldrbeq	r0, [ip, #-768]	; 0xfffffd00
     3a4:	4b050000 	blmi	1403ac <_heap+0xc03a8>
     3a8:	000000a8 	andeq	r0, r0, r8, lsr #1
     3ac:	00280107 	eoreq	r0, r8, r7, lsl #2
     3b0:	51050000 	mrspl	r0, (UNDEF: 5)
     3b4:	00000241 	andeq	r0, r0, r1, asr #4
     3b8:	00044708 	andeq	r4, r4, r8, lsl #14
     3bc:	51080000 	mrspl	r0, (UNDEF: 8)
     3c0:	01000004 	tsteq	r0, r4
     3c4:	00045b08 	andeq	r5, r4, r8, lsl #22
     3c8:	2a080200 	bcs	200bd0 <_heap+0x180bcc>
     3cc:	03000006 	movweq	r0, #6
     3d0:	00046508 	andeq	r6, r4, r8, lsl #10
     3d4:	6f080400 	svcvs	0x00080400
     3d8:	05000004 	streq	r0, [r0, #-4]
     3dc:	00047908 	andeq	r7, r4, r8, lsl #18
     3e0:	74080600 	strvc	r0, [r8], #-1536	; 0xfffffa00
     3e4:	07000005 	streq	r0, [r0, -r5]
     3e8:	00048d08 	andeq	r8, r4, r8, lsl #26
     3ec:	97080800 	strls	r0, [r8, -r0, lsl #16]
     3f0:	09000004 	stmdbeq	r0, {r2}
     3f4:	00037708 	andeq	r7, r3, r8, lsl #14
     3f8:	82080a00 	andhi	r0, r8, #0, 20
     3fc:	0b000003 	bleq	410 <CPSR_IRQ_INHIBIT+0x390>
     400:	00038d08 	andeq	r8, r3, r8, lsl #26
     404:	98080c00 	stmdals	r8, {sl, fp}
     408:	0d000003 	stceq	0, cr0, [r0, #-12]
     40c:	0003a308 	andeq	sl, r3, r8, lsl #6
     410:	ae080e00 	cdpge	14, 0, cr0, cr8, cr0, {0}
     414:	0f000003 	svceq	0x00000003
     418:	0003b908 	andeq	fp, r3, r8, lsl #18
     41c:	c4081000 	strgt	r1, [r8], #-0
     420:	11000003 	tstne	r0, r3
     424:	0003cf08 	andeq	ip, r3, r8, lsl #30
     428:	da081200 	ble	204c30 <_heap+0x184c2c>
     42c:	13000003 	movwne	r0, #3
     430:	0002f608 	andeq	pc, r2, r8, lsl #12
     434:	b5081400 	strlt	r1, [r8, #-1024]	; 0xfffffc00
     438:	15000004 	strne	r0, [r0, #-4]
     43c:	0004c008 	andeq	ip, r4, r8
     440:	cb081600 	blgt	205c48 <_heap+0x185c44>
     444:	17000004 	strne	r0, [r0, -r4]
     448:	0004d608 	andeq	sp, r4, r8, lsl #12
     44c:	e1081800 	tst	r8, r0, lsl #16
     450:	19000004 	stmdbne	r0, {r2}
     454:	0004ec08 	andeq	lr, r4, r8, lsl #24
     458:	f7081a00 			; <UNDEFINED> instruction: 0xf7081a00
     45c:	1b000004 	blne	474 <CPSR_IRQ_INHIBIT+0x3f4>
     460:	00050208 	andeq	r0, r5, r8, lsl #4
     464:	0d081c00 	stceq	12, cr1, [r8, #-0]
     468:	1d000005 	stcne	0, cr0, [r0, #-20]	; 0xffffffec
     46c:	00060908 	andeq	r0, r6, r8, lsl #18
     470:	14081e00 	strne	r1, [r8], #-3584	; 0xfffff200
     474:	1f000006 	svcne	0x00000006
     478:	00061f08 	andeq	r1, r6, r8, lsl #30
     47c:	bf082000 	svclt	0x00082000
     480:	21000005 	tstcs	r0, r5
     484:	00063408 	andeq	r3, r6, r8, lsl #8
     488:	3f082200 	svccc	0x00082200
     48c:	23000006 	movwcs	r0, #6
     490:	00064a08 	andeq	r4, r6, r8, lsl #20
     494:	e2082400 	and	r2, r8, #0, 8
     498:	25000005 	strcs	r0, [r0, #-5]
     49c:	00066208 	andeq	r6, r6, r8, lsl #4
     4a0:	6d082600 	stcvs	6, cr2, [r8, #-0]
     4a4:	27000006 	strcs	r0, [r0, -r6]
     4a8:	00027108 	andeq	r7, r2, r8, lsl #2
     4ac:	6c082800 	stcvs	8, cr2, [r8], {-0}
     4b0:	29000003 	stmdbcs	r0, {r0, r1}
     4b4:	00027c08 	andeq	r7, r2, r8, lsl #24
     4b8:	87082a00 	strhi	r2, [r8, -r0, lsl #20]
     4bc:	2b000002 	blcs	4cc <CPSR_IRQ_INHIBIT+0x44c>
     4c0:	00029208 	andeq	r9, r2, r8, lsl #4
     4c4:	9d082c00 	stcls	12, cr2, [r8, #-0]
     4c8:	2d000002 	stccs	0, cr0, [r0, #-8]
     4cc:	0002a808 	andeq	sl, r2, r8, lsl #16
     4d0:	b3082e00 	movwlt	r2, #36352	; 0x8e00
     4d4:	2f000002 	svccs	0x00000002
     4d8:	0002be08 	andeq	fp, r2, r8, lsl #28
     4dc:	c9083000 	stmdbgt	r8, {ip, sp}
     4e0:	31000002 	tstcc	r0, r2
     4e4:	0003ee08 	andeq	lr, r3, r8, lsl #28
     4e8:	f9083200 			; <UNDEFINED> instruction: 0xf9083200
     4ec:	33000003 	movwcc	r0, #3
     4f0:	0005fe08 	andeq	pc, r5, r8, lsl #28
     4f4:	04083400 	streq	r3, [r8], #-1024	; 0xfffffc00
     4f8:	35000004 	strcc	r0, [r0, #-4]
     4fc:	04210300 	strteq	r0, [r1], #-768	; 0xfffffd00
     500:	88050000 	stmdahi	r5, {}	; <UNPREDICTABLE>
     504:	000000f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>
     508:	9b05a409 	blls	169534 <_heap+0xe9530>
     50c:	00000441 	andeq	r0, r0, r1, asr #8
     510:	0002320a 	andeq	r3, r2, sl, lsl #4
     514:	879c0500 	ldrhi	r0, [ip, r0, lsl #10]
     518:	00000000 	andeq	r0, r0, r0
     51c:	00023a0a 	andeq	r3, r2, sl, lsl #20
     520:	879d0500 	ldrhi	r0, [sp, r0, lsl #10]
     524:	04000000 	streq	r0, [r0], #-0
     528:	0002420a 	andeq	r4, r2, sl, lsl #4
     52c:	879e0500 	ldrhi	r0, [lr, r0, lsl #10]
     530:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
     534:	00024a0a 	andeq	r4, r2, sl, lsl #20
     538:	879f0500 	ldrhi	r0, [pc, r0, lsl #10]
     53c:	0c000000 	stceq	0, cr0, [r0], {-0}
     540:	0002520a 	andeq	r5, r2, sl, lsl #4
     544:	87a00500 	strhi	r0, [r0, r0, lsl #10]!
     548:	10000000 	andne	r0, r0, r0
     54c:	00025a0a 	andeq	r5, r2, sl, lsl #20
     550:	87a10500 	strhi	r0, [r1, r0, lsl #10]!
     554:	14000000 	strne	r0, [r0], #-0
     558:	0003180a 	andeq	r1, r3, sl, lsl #16
     55c:	92a20500 	adcls	r0, r2, #0, 10
     560:	18000000 	stmdane	r0, {}	; <UNPREDICTABLE>
     564:	0002240a 	andeq	r2, r2, sl, lsl #8
     568:	9da30500 	cfstr32ls	mvfx0, [r3]
     56c:	1c000000 	stcne	0, cr0, [r0], {-0}
     570:	00022b0a 	andeq	r2, r2, sl, lsl #22
     574:	9da40500 	cfstr32ls	mvfx0, [r4]
     578:	20000000 	andcs	r0, r0, r0
     57c:	0003220a 	andeq	r2, r3, sl, lsl #4
     580:	92a50500 	adcls	r0, r5, #0, 10
     584:	24000000 	strcs	r0, [r0], #-0
     588:	0006d30a 	andeq	sp, r6, sl, lsl #6
     58c:	9da60500 	cfstr32ls	mvfx0, [r6]
     590:	28000000 	stmdacs	r0, {}	; <UNPREDICTABLE>
     594:	0004a10a 	andeq	sl, r4, sl, lsl #2
     598:	9da70500 	cfstr32ls	mvfx0, [r7]
     59c:	2c000000 	stccs	0, cr0, [r0], {-0}
     5a0:	00032c0a 	andeq	r2, r3, sl, lsl #24
     5a4:	92a80500 	adcls	r0, r8, #0, 10
     5a8:	30000000 	andcc	r0, r0, r0
     5ac:	0005ca0a 	andeq	ip, r5, sl, lsl #20
     5b0:	9da90500 	cfstr32ls	mvfx0, [r9]
     5b4:	34000000 	strcc	r0, [r0], #-0
     5b8:	0005d10a 	andeq	sp, r5, sl, lsl #2
     5bc:	9daa0500 	cfstr32ls	mvfx0, [sl]
     5c0:	38000000 	stmdacc	r0, {}	; <UNPREDICTABLE>
     5c4:	0003360a 	andeq	r3, r3, sl, lsl #12
     5c8:	92ab0500 	adcls	r0, fp, #0, 10
     5cc:	3c000000 	stccc	0, cr0, [r0], {-0}
     5d0:	00034a0a 	andeq	r4, r3, sl, lsl #20
     5d4:	9dac0500 	cfstr32ls	mvfx0, [ip]
     5d8:	40000000 	andmi	r0, r0, r0
     5dc:	0003510a 	andeq	r5, r3, sl, lsl #2
     5e0:	9dad0500 	cfstr32ls	mvfx0, [sp]
     5e4:	44000000 	strmi	r0, [r0], #-0
     5e8:	0005d80a 	andeq	sp, r5, sl, lsl #16
     5ec:	92ae0500 	adcls	r0, lr, #0, 10
     5f0:	48000000 	stmdami	r0, {}	; <UNPREDICTABLE>
     5f4:	0002e10a 	andeq	lr, r2, sl, lsl #2
     5f8:	9daf0500 	cfstr32ls	mvfx0, [pc]	; 600 <CPSR_IRQ_INHIBIT+0x580>
     5fc:	4c000000 	stcmi	0, cr0, [r0], {-0}
     600:	0002e80a 	andeq	lr, r2, sl, lsl #16
     604:	9db00500 	cfldr32ls	mvfx0, [r0]
     608:	50000000 	andpl	r0, r0, r0
     60c:	0003400a 	andeq	r4, r3, sl
     610:	92b10500 	adcsls	r0, r1, #0, 10
     614:	54000000 	strpl	r0, [r0], #-0
     618:	0006910a 	andeq	r9, r6, sl, lsl #2
     61c:	9db20500 	cfldr32ls	mvfx0, [r2]
     620:	58000000 	stmdapl	r0, {}	; <UNPREDICTABLE>
     624:	0002620a 	andeq	r6, r2, sl, lsl #4
     628:	9db30500 	cfldr32ls	mvfx0, [r3]
     62c:	5c000000 	stcpl	0, cr0, [r0], {-0}
     630:	0005ed0a 	andeq	lr, r5, sl, lsl #26
     634:	92b40500 	adcsls	r0, r4, #0, 10
     638:	60000000 	andvs	r0, r0, r0
     63c:	0002ef0a 	andeq	lr, r2, sl, lsl #30
     640:	9db50500 	cfldr32ls	mvfx0, [r5]
     644:	64000000 	strvs	r0, [r0], #-0
     648:	0005f70a 	andeq	pc, r5, sl, lsl #14
     64c:	9db60500 	cfldr32ls	mvfx0, [r6]
     650:	68000000 	stmdavs	r0, {}	; <UNPREDICTABLE>
     654:	0006780a 	andeq	r7, r6, sl, lsl #16
     658:	92b70500 	adcsls	r0, r7, #0, 10
     65c:	6c000000 	stcvs	0, cr0, [r0], {-0}
     660:	0004300a 	andeq	r3, r4, sl
     664:	9db80500 	cfldr32ls	mvfx0, [r8]
     668:	70000000 	andvc	r0, r0, r0
     66c:	00052b0a 	andeq	r2, r5, sl, lsl #22
     670:	9db90500 	cfldr32ls	mvfx0, [r9]
     674:	74000000 	strvc	r0, [r0], #-0
     678:	0003580a 	andeq	r5, r3, sl, lsl #16
     67c:	92ba0500 	adcsls	r0, sl, #0, 10
     680:	78000000 	stmdavc	r0, {}	; <UNPREDICTABLE>
     684:	0005230a 	andeq	r2, r5, sl, lsl #6
     688:	9dbb0500 	cfldr32ls	mvfx0, [fp]
     68c:	7c000000 	stcvc	0, cr0, [r0], {-0}
     690:	0005540a 	andeq	r5, r5, sl, lsl #8
     694:	9dbc0500 	cfldr32ls	mvfx0, [ip]
     698:	80000000 	andhi	r0, r0, r0
     69c:	0003620a 	andeq	r6, r3, sl, lsl #4
     6a0:	92bd0500 	adcsls	r0, sp, #0, 10
     6a4:	84000000 	strhi	r0, [r0], #-0
     6a8:	0004370a 	andeq	r3, r4, sl, lsl #14
     6ac:	9dbe0500 	cfldr32ls	mvfx0, [lr]
     6b0:	88000000 	stmdahi	r0, {}	; <UNPREDICTABLE>
     6b4:	00043f0a 	andeq	r3, r4, sl, lsl #30
     6b8:	9dbf0500 	cfldr32ls	mvfx0, [pc]	; 6c0 <CPSR_IRQ_INHIBIT+0x640>
     6bc:	8c000000 	stchi	0, cr0, [r0], {-0}
     6c0:	0005490a 	andeq	r4, r5, sl, lsl #18
     6c4:	92c00500 	sbcls	r0, r0, #0, 10
     6c8:	90000000 	andls	r0, r0, r0
     6cc:	00040f0a 	andeq	r0, r4, sl, lsl #30
     6d0:	9dc10500 	cfstr64ls	mvdx0, [r1]
     6d4:	94000000 	strls	r0, [r0], #-0
     6d8:	00053f0a 	andeq	r3, r5, sl, lsl #30
     6dc:	9dc20500 	cfstr64ls	mvdx0, [r2]
     6e0:	98000000 	stmdals	r0, {}	; <UNPREDICTABLE>
     6e4:	0005870a 	andeq	r8, r5, sl, lsl #14
     6e8:	9dc30500 	cfstr64ls	mvdx0, [r3]
     6ec:	9c000000 	stcls	0, cr0, [r0], {-0}
     6f0:	0005180a 	andeq	r1, r5, sl, lsl #16
     6f4:	92c40500 	sbcls	r0, r4, #0, 10
     6f8:	a0000000 	andge	r0, r0, r0
     6fc:	06c80300 	strbeq	r0, [r8], r0, lsl #6
     700:	c5050000 	strgt	r0, [r5, #-0]
     704:	0000024c 	andeq	r0, r0, ip, asr #4
     708:	0002690b 	andeq	r6, r2, fp, lsl #18
     70c:	5d0e0100 	stfpls	f0, [lr, #-0]
     710:	05000004 	streq	r0, [r0, #-4]
     714:	008d4803 	addeq	r4, sp, r3, lsl #16
     718:	41040c00 	tstmi	r4, r0, lsl #24
     71c:	0d000004 	stceq	0, cr0, [r0, #-16]
     720:	000002d4 	ldrdeq	r0, [r0], -r4
     724:	82d81e01 	sbcshi	r1, r8, #1, 28
     728:	00180000 	andseq	r0, r8, r0
     72c:	9c010000 	stcls	0, cr0, [r1], {-0}
     730:	0003010e 	andeq	r0, r3, lr, lsl #2
     734:	bc150100 	ldflts	f0, [r5], {-0}
     738:	1c000081 	stcne	0, cr0, [r0], {129}	; 0x81
     73c:	01000001 	tsteq	r0, r1
     740:	0004c29c 	muleq	r4, ip, r2
     744:	068c0f00 	streq	r0, [ip], r0, lsl #30
     748:	15010000 	strne	r0, [r1, #-0]
     74c:	00000241 	andeq	r0, r0, r1, asr #4
     750:	0f6f9102 	svceq	0x006f9102
     754:	00000f07 	andeq	r0, r0, r7, lsl #30
     758:	00e51501 	rsceq	r1, r5, r1, lsl #10
     75c:	91020000 	mrsls	r0, (UNDEF: 2)
     760:	03e50b6e 	mvneq	r0, #112640	; 0x1b800
     764:	17010000 	strne	r0, [r1, -r0]
     768:	000004c2 	andeq	r0, r0, r2, asr #9
     76c:	0b749102 	bleq	1d24b7c <_heap+0x1ca4b78>
     770:	00000682 	andeq	r0, r0, r2, lsl #13
     774:	00871801 	addeq	r1, r7, r1, lsl #16
     778:	91020000 	mrsls	r0, (UNDEF: 2)
     77c:	040c0070 	streq	r0, [ip], #-112	; 0xffffff90
     780:	00000087 	andeq	r0, r0, r7, lsl #1
     784:	00041510 	andeq	r1, r4, r0, lsl r5
     788:	5d100100 	ldfpls	f0, [r0, #-0]
     78c:	98000004 	stmdals	r0, {r2}
     790:	24000081 	strcs	r0, [r0], #-129	; 0xffffff7f
     794:	01000000 	mrseq	r0, (UNDEF: 0)
     798:	023b009c 	eorseq	r0, fp, #156	; 0x9c
     79c:	00040000 	andeq	r0, r4, r0
     7a0:	0000028b 	andeq	r0, r0, fp, lsl #5
     7a4:	00440104 	subeq	r0, r4, r4, lsl #2
     7a8:	910c0000 	mrsls	r0, (UNDEF: 12)
     7ac:	f0000007 			; <UNDEFINED> instruction: 0xf0000007
     7b0:	48000082 	stmdami	r0, {r1, r7}
     7b4:	33000002 	movwcc	r0, #2
     7b8:	02000003 	andeq	r0, r0, #3
     7bc:	00c20601 	sbceq	r0, r2, r1, lsl #12
     7c0:	01020000 	mrseq	r0, (UNDEF: 2)
     7c4:	0000c008 	andeq	ip, r0, r8
     7c8:	05020200 	streq	r0, [r2, #-512]	; 0xfffffe00
     7cc:	0000012e 	andeq	r0, r0, lr, lsr #2
     7d0:	ce070202 	cdpgt	2, 0, cr0, cr7, cr2, {0}
     7d4:	02000000 	andeq	r0, r0, #0
     7d8:	01250504 			; <UNDEFINED> instruction: 0x01250504
     7dc:	e1030000 	mrs	r0, (UNDEF: 3)
     7e0:	02000000 	andeq	r0, r0, #0
     7e4:	00004f41 	andeq	r4, r0, r1, asr #30
     7e8:	07040200 	streq	r0, [r4, -r0, lsl #4]
     7ec:	0000010e 	andeq	r0, r0, lr, lsl #2
     7f0:	20050802 	andcs	r0, r5, r2, lsl #16
     7f4:	02000001 	andeq	r0, r0, #1
     7f8:	01090708 	tsteq	r9, r8, lsl #14
     7fc:	04040000 	streq	r0, [r4], #-0
     800:	746e6905 	strbtvc	r6, [lr], #-2309	; 0xfffff6fb
     804:	07040200 	streq	r0, [r4, -r0, lsl #4]
     808:	00000113 	andeq	r0, r0, r3, lsl r1
     80c:	0000e303 	andeq	lr, r0, r3, lsl #6
     810:	44300300 	ldrtmi	r0, [r0], #-768	; 0xfffffd00
     814:	05000000 	streq	r0, [r0, #-0]
     818:	00000072 	andeq	r0, r0, r2, ror r0
     81c:	2f042806 	svccs	0x00042806
     820:	00000103 	andeq	r0, r0, r3, lsl #2
     824:	00074a07 	andeq	r4, r7, r7, lsl #20
     828:	7d300400 	cfldrsvc	mvf0, [r0, #-0]
     82c:	00000000 	andeq	r0, r0, r0
     830:	00086707 	andeq	r6, r8, r7, lsl #14
     834:	7d310400 	cfldrsvc	mvf0, [r1, #-0]
     838:	04000000 	streq	r0, [r0], #-0
     83c:	0007e107 	andeq	lr, r7, r7, lsl #2
     840:	7d320400 	cfldrsvc	mvf0, [r2, #-0]
     844:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
     848:	00073e07 	andeq	r3, r7, r7, lsl #28
     84c:	7d330400 	cfldrsvc	mvf0, [r3, #-0]
     850:	0c000000 	stceq	0, cr0, [r0], {-0}
     854:	00077507 	andeq	r7, r7, r7, lsl #10
     858:	7d340400 	cfldrsvc	mvf0, [r4, #-0]
     85c:	10000000 	andne	r0, r0, r0
     860:	00078307 	andeq	r8, r7, r7, lsl #6
     864:	7d350400 	cfldrsvc	mvf0, [r5, #-0]
     868:	14000000 	strne	r0, [r0], #-0
     86c:	00076307 	andeq	r6, r7, r7, lsl #6
     870:	7d360400 	cfldrsvc	mvf0, [r6, #-0]
     874:	18000000 	stmdane	r0, {}	; <UNPREDICTABLE>
     878:	00083307 	andeq	r3, r8, r7, lsl #6
     87c:	7d370400 	cfldrsvc	mvf0, [r7, #-0]
     880:	1c000000 	stcne	0, cr0, [r0], {-0}
     884:	00084207 	andeq	r4, r8, r7, lsl #4
     888:	7d380400 	cfldrsvc	mvf0, [r8, #-0]
     88c:	20000000 	andcs	r0, r0, r0
     890:	00072b07 	andeq	r2, r7, r7, lsl #22
     894:	7d390400 	cfldrsvc	mvf0, [r9, #-0]
     898:	24000000 	strcs	r0, [r0], #-0
     89c:	07050300 	streq	r0, [r5, -r0, lsl #6]
     8a0:	3a040000 	bcc	1008a8 <_heap+0x808a4>
     8a4:	00000082 	andeq	r0, r0, r2, lsl #1
     8a8:	00071a08 	andeq	r1, r7, r8, lsl #20
     8ac:	1f160100 	svcne	0x00160100
     8b0:	05000001 	streq	r0, [r0, #-1]
     8b4:	008d4c03 	addeq	r4, sp, r3, lsl #24
     8b8:	03040900 	movweq	r0, #18688	; 0x4900
     8bc:	0a000001 	beq	8c8 <CPSR_IRQ_INHIBIT+0x848>
     8c0:	00000851 	andeq	r0, r0, r1, asr r8
     8c4:	8528ed01 	strhi	lr, [r8, #-3329]!	; 0xfffff2ff
     8c8:	00100000 	andseq	r0, r0, r0
     8cc:	9c010000 	stcls	0, cr0, [r1], {-0}
     8d0:	0008220b 	andeq	r2, r8, fp, lsl #4
     8d4:	24800100 	strcs	r0, [r0], #256	; 0x100
     8d8:	04000084 	streq	r0, [r0], #-132	; 0xffffff7c
     8dc:	01000001 	tsteq	r0, r1
     8e0:	00016e9c 	muleq	r1, ip, lr
     8e4:	696c0c00 	stmdbvs	ip!, {sl, fp}^
     8e8:	82010074 	andhi	r0, r1, #116	; 0x74
     8ec:	00000064 	andeq	r0, r0, r4, rrx
     8f0:	8da00305 	stchi	3, cr0, [r0, #20]!
     8f4:	d7080000 	strle	r0, [r8, -r0]
     8f8:	01000007 	tsteq	r0, r7
     8fc:	00006483 	andeq	r6, r0, r3, lsl #9
     900:	9c030500 	cfstr32ls	mvfx0, [r3], {-0}
     904:	0000008d 	andeq	r0, r0, sp, lsl #1
     908:	0007c50d 	andeq	ip, r7, sp, lsl #10
     90c:	ec6e0100 	stfe	f0, [lr], #-0
     910:	38000083 	stmdacc	r0, {r0, r1, r7}
     914:	01000000 	mrseq	r0, (UNDEF: 0)
     918:	0001929c 	muleq	r1, ip, r2
     91c:	075c0800 	ldrbeq	r0, [ip, -r0, lsl #16]
     920:	70010000 	andvc	r0, r1, r0
     924:	00000192 	muleq	r0, r2, r1
     928:	005f9102 	subseq	r9, pc, r2, lsl #2
     92c:	c9080102 	stmdbgt	r8, {r1, r8}
     930:	0d000000 	stceq	0, cr0, [r0, #-0]
     934:	000006da 	ldrdeq	r0, [r0], -sl
     938:	83b45d01 			; <UNDEFINED> instruction: 0x83b45d01
     93c:	00380000 	eorseq	r0, r8, r0
     940:	9c010000 	stcls	0, cr0, [r1], {-0}
     944:	000001bd 			; <UNDEFINED> instruction: 0x000001bd
     948:	00075c08 	andeq	r5, r7, r8, lsl #24
     94c:	925f0100 	subsls	r0, pc, #0, 2
     950:	02000001 	andeq	r0, r0, #1
     954:	0d005f91 	stceq	15, cr5, [r0, #-580]	; 0xfffffdbc
     958:	00000819 	andeq	r0, r0, r9, lsl r8
     95c:	83804c01 	orrhi	r4, r0, #256	; 0x100
     960:	00340000 	eorseq	r0, r4, r0
     964:	9c010000 	stcls	0, cr0, [r1], {-0}
     968:	000001e1 	andeq	r0, r0, r1, ror #3
     96c:	00075c08 	andeq	r5, r7, r8, lsl #24
     970:	924e0100 	subls	r0, lr, #0, 2
     974:	02000001 	andeq	r0, r0, #1
     978:	0d005f91 	stceq	15, cr5, [r0, #-580]	; 0xfffffdbc
     97c:	000007ef 	andeq	r0, r0, pc, ror #15
     980:	834c3b01 	movthi	r3, #51969	; 0xcb01
     984:	00340000 	eorseq	r0, r4, r0
     988:	9c010000 	stcls	0, cr0, [r1], {-0}
     98c:	00000205 	andeq	r0, r0, r5, lsl #4
     990:	00075c08 	andeq	r5, r7, r8, lsl #24
     994:	923d0100 	eorsls	r0, sp, #0, 2
     998:	02000001 	andeq	r0, r0, #1
     99c:	0d005f91 	stceq	15, cr5, [r0, #-580]	; 0xfffffdbc
     9a0:	0000080c 	andeq	r0, r0, ip, lsl #16
     9a4:	83142a01 	tsthi	r4, #4096	; 0x1000
     9a8:	00380000 	eorseq	r0, r8, r0
     9ac:	9c010000 	stcls	0, cr0, [r1], {-0}
     9b0:	00000229 	andeq	r0, r0, r9, lsr #4
     9b4:	00075c08 	andeq	r5, r7, r8, lsl #24
     9b8:	922c0100 	eorls	r0, ip, #0, 2
     9bc:	02000001 	andeq	r0, r0, #1
     9c0:	0e005f91 	mcreq	15, 0, r5, cr0, cr1, {4}
     9c4:	000006f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>
     9c8:	011f1d01 	tsteq	pc, r1, lsl #26
     9cc:	82f00000 	rscshi	r0, r0, #0
     9d0:	00240000 	eoreq	r0, r4, r0
     9d4:	9c010000 	stcls	0, cr0, [r1], {-0}
     9d8:	00014300 	andeq	r4, r1, r0, lsl #6
     9dc:	6e000400 	cfcpysvs	mvf0, mvf0
     9e0:	04000003 	streq	r0, [r0], #-3
     9e4:	00004401 	andeq	r4, r0, r1, lsl #8
     9e8:	08990c00 	ldmeq	r9, {sl, fp}
     9ec:	85380000 	ldrhi	r0, [r8, #-0]!
     9f0:	007c0000 	rsbseq	r0, ip, r0
     9f4:	04aa0000 	strteq	r0, [sl], #0
     9f8:	01020000 	mrseq	r0, (UNDEF: 2)
     9fc:	0000c206 	andeq	ip, r0, r6, lsl #4
     a00:	08010200 	stmdaeq	r1, {r9}
     a04:	000000c0 	andeq	r0, r0, r0, asr #1
     a08:	2e050202 	cdpcs	2, 0, cr0, cr5, cr2, {0}
     a0c:	02000001 	andeq	r0, r0, #1
     a10:	00ce0702 	sbceq	r0, lr, r2, lsl #14
     a14:	04020000 	streq	r0, [r2], #-0
     a18:	00012505 	andeq	r2, r1, r5, lsl #10
     a1c:	00e10300 	rsceq	r0, r1, r0, lsl #6
     a20:	41020000 	mrsmi	r0, (UNDEF: 2)
     a24:	0000004f 	andeq	r0, r0, pc, asr #32
     a28:	0e070402 	cdpeq	4, 0, cr0, cr7, cr2, {0}
     a2c:	02000001 	andeq	r0, r0, #1
     a30:	01200508 			; <UNDEFINED> instruction: 0x01200508
     a34:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
     a38:	00010907 	andeq	r0, r1, r7, lsl #18
     a3c:	05040400 	streq	r0, [r4, #-1024]	; 0xfffffc00
     a40:	00746e69 	rsbseq	r6, r4, r9, ror #28
     a44:	13070402 	movwne	r0, #29698	; 0x7402
     a48:	03000001 	movweq	r0, #1
     a4c:	000000e3 	andeq	r0, r0, r3, ror #1
     a50:	00443003 	subeq	r3, r4, r3
     a54:	72050000 	andvc	r0, r5, #0
     a58:	06000000 	streq	r0, [r0], -r0
     a5c:	df1a041c 	svcle	0x001a041c
     a60:	07000000 	streq	r0, [r0, -r0]
     a64:	000008d6 	ldrdeq	r0, [r0], -r6
     a68:	007d1b04 	rsbseq	r1, sp, r4, lsl #22
     a6c:	07000000 	streq	r0, [r0, -r0]
     a70:	000008e5 	andeq	r0, r0, r5, ror #17
     a74:	007d1c04 	rsbseq	r1, sp, r4, lsl #24
     a78:	07040000 	streq	r0, [r4, -r0]
     a7c:	000008cb 	andeq	r0, r0, fp, asr #17
     a80:	007d1d04 	rsbseq	r1, sp, r4, lsl #26
     a84:	07080000 	streq	r0, [r8, -r0]
     a88:	00000875 	andeq	r0, r0, r5, ror r8
     a8c:	007d1e04 	rsbseq	r1, sp, r4, lsl #28
     a90:	070c0000 	streq	r0, [ip, -r0]
     a94:	0000087e 	andeq	r0, r0, lr, ror r8
     a98:	007d1f04 	rsbseq	r1, sp, r4, lsl #30
     a9c:	07100000 	ldreq	r0, [r0, -r0]
     aa0:	00000887 	andeq	r0, r0, r7, lsl #17
     aa4:	007d2004 	rsbseq	r2, sp, r4
     aa8:	07140000 	ldreq	r0, [r4, -r0]
     aac:	00000890 	muleq	r0, r0, r8
     ab0:	007d2104 	rsbseq	r2, sp, r4, lsl #2
     ab4:	00180000 	andseq	r0, r8, r0
     ab8:	00091803 	andeq	r1, r9, r3, lsl #16
     abc:	82220400 	eorhi	r0, r2, #0, 8
     ac0:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
     ac4:	00000928 	andeq	r0, r0, r8, lsr #18
     ac8:	00fb0e01 	rscseq	r0, fp, r1, lsl #28
     acc:	03050000 	movweq	r0, #20480	; 0x5000
     ad0:	00008d50 	andeq	r8, r0, r0, asr sp
     ad4:	00df0409 	sbcseq	r0, pc, r9, lsl #8
     ad8:	030a0000 	movweq	r0, #40960	; 0xa000
     adc:	01000009 	tsteq	r0, r9
     ae0:	00855c15 	addeq	r5, r5, r5, lsl ip
     ae4:	00005800 	andeq	r5, r0, r0, lsl #16
     ae8:	319c0100 	orrscc	r0, ip, r0, lsl #2
     aec:	0b000001 	bleq	af8 <CPSR_IRQ_INHIBIT+0xa78>
     af0:	01007375 	tsteq	r0, r5, ror r3
     af4:	00007215 	andeq	r7, r0, r5, lsl r2
     af8:	6c910200 	lfmvs	f0, 4, [r1], {0}
     afc:	0073740c 	rsbseq	r7, r3, ip, lsl #8
     b00:	007d1701 	rsbseq	r1, sp, r1, lsl #14
     b04:	91020000 	mrsls	r0, (UNDEF: 2)
     b08:	f00d0074 			; <UNDEFINED> instruction: 0xf00d0074
     b0c:	01000008 	tsteq	r0, r8
     b10:	0000fb10 	andeq	pc, r0, r0, lsl fp	; <UNPREDICTABLE>
     b14:	00853800 	addeq	r3, r5, r0, lsl #16
     b18:	00002400 	andeq	r2, r0, r0, lsl #8
     b1c:	009c0100 	addseq	r0, ip, r0, lsl #2
     b20:	000006f3 	strdeq	r0, [r0], -r3
     b24:	04300004 	ldrteq	r0, [r0], #-4
     b28:	01040000 	mrseq	r0, (UNDEF: 4)
     b2c:	00000044 	andeq	r0, r0, r4, asr #32
     b30:	0009d20c 	andeq	sp, r9, ip, lsl #4
     b34:	0085b400 	addeq	fp, r5, r0, lsl #8
     b38:	00039c00 	andeq	r9, r3, r0, lsl #24
     b3c:	0005ad00 	andeq	sl, r5, r0, lsl #26
     b40:	06010200 	streq	r0, [r1], -r0, lsl #4
     b44:	000000c2 	andeq	r0, r0, r2, asr #1
     b48:	c0080102 	andgt	r0, r8, r2, lsl #2
     b4c:	02000000 	andeq	r0, r0, #0
     b50:	012e0502 			; <UNDEFINED> instruction: 0x012e0502
     b54:	02020000 	andeq	r0, r2, #0
     b58:	0000ce07 	andeq	ip, r0, r7, lsl #28
     b5c:	05040200 	streq	r0, [r4, #-512]	; 0xfffffe00
     b60:	00000125 	andeq	r0, r0, r5, lsr #2
     b64:	0000e103 	andeq	lr, r0, r3, lsl #2
     b68:	4f410200 	svcmi	0x00410200
     b6c:	02000000 	andeq	r0, r0, #0
     b70:	010e0704 	tsteq	lr, r4, lsl #14
     b74:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
     b78:	00012005 	andeq	r2, r1, r5
     b7c:	07080200 	streq	r0, [r8, -r0, lsl #4]
     b80:	00000109 	andeq	r0, r0, r9, lsl #2
     b84:	69050404 	stmdbvs	r5, {r2, sl}
     b88:	0500746e 	streq	r7, [r0, #-1134]	; 0xfffffb92
     b8c:	00000064 	andeq	r0, r0, r4, rrx
     b90:	13070402 	movwne	r0, #29698	; 0x7402
     b94:	03000001 	movweq	r0, #1
     b98:	000000e3 	andeq	r0, r0, r3, ror #1
     b9c:	00443003 	subeq	r3, r4, r3
     ba0:	77050000 	strvc	r0, [r5, -r0]
     ba4:	06000000 	streq	r0, [r0], -r0
     ba8:	00000082 	andeq	r0, r0, r2, lsl #1
     bac:	00053203 	andeq	r3, r5, r3, lsl #4
     bb0:	82120400 	andshi	r0, r2, #0, 8
     bb4:	03000000 	movweq	r0, #0
     bb8:	000004a8 	andeq	r0, r0, r8, lsr #9
     bbc:	00871304 	addeq	r1, r7, r4, lsl #6
     bc0:	55030000 	strpl	r0, [r3, #-0]
     bc4:	04000006 	streq	r0, [r0], #-6
     bc8:	00008214 	andeq	r8, r0, r4, lsl r2
     bcc:	052c0700 	streq	r0, [ip, #-1792]!	; 0xfffff900
     bd0:	00013a39 	andeq	r3, r1, r9, lsr sl
     bd4:	09b80800 	ldmibeq	r8!, {fp}
     bd8:	3a050000 	bcc	140be0 <_heap+0xc0bdc>
     bdc:	0000008c 	andeq	r0, r0, ip, lsl #1
     be0:	0a240800 	beq	902be8 <_heap+0x882be4>
     be4:	3b050000 	blcc	140bec <_heap+0xc0be8>
     be8:	0000008c 	andeq	r0, r0, ip, lsl #1
     bec:	0a3f0804 	beq	fc2c04 <_heap+0xf42c00>
     bf0:	3c050000 	stccc	0, cr0, [r5], {-0}
     bf4:	0000008c 	andeq	r0, r0, ip, lsl #1
     bf8:	0acb0808 	beq	ff2c2c20 <_heap+0xff242c1c>
     bfc:	3d050000 	stccc	0, cr0, [r5, #-0]
     c00:	0000008c 	andeq	r0, r0, ip, lsl #1
     c04:	09a9080c 	stmibeq	r9!, {r2, r3, fp}
     c08:	3e050000 	cdpcc	0, 0, cr0, cr5, cr0, {0}
     c0c:	0000008c 	andeq	r0, r0, ip, lsl #1
     c10:	09690810 	stmdbeq	r9!, {r4, fp}^
     c14:	3f050000 	svccc	0x00050000
     c18:	00000097 	muleq	r0, r7, r0
     c1c:	0a100814 	beq	402c74 <_heap+0x382c70>
     c20:	40050000 	andmi	r0, r5, r0
     c24:	00000097 	muleq	r0, r7, r0
     c28:	09370818 	ldmdbeq	r7!, {r3, r4, fp}
     c2c:	41050000 	mrsmi	r0, (UNDEF: 5)
     c30:	0000008c 	andeq	r0, r0, ip, lsl #1
     c34:	0b04081c 	bleq	102cac <_heap+0x82ca8>
     c38:	42050000 	andmi	r0, r5, #0
     c3c:	0000008c 	andeq	r0, r0, ip, lsl #1
     c40:	0aad0820 	beq	feb42cc8 <_heap+0xfeac2cc4>
     c44:	43050000 	movwmi	r0, #20480	; 0x5000
     c48:	00000097 	muleq	r0, r7, r0
     c4c:	0a000824 	beq	2ce4 <CPSR_IRQ_INHIBIT+0x2c64>
     c50:	44050000 	strmi	r0, [r5], #-0
     c54:	0000008c 	andeq	r0, r0, ip, lsl #1
     c58:	46030028 	strmi	r0, [r3], -r8, lsr #32
     c5c:	05000009 	streq	r0, [r0, #-9]
     c60:	0000ad45 	andeq	sl, r0, r5, asr #26
     c64:	05080700 	streq	r0, [r8, #-1792]	; 0xfffff900
     c68:	00016647 	andeq	r6, r1, r7, asr #12
     c6c:	0a550800 	beq	1542c74 <_heap+0x14c2c70>
     c70:	48050000 	stmdami	r5, {}	; <UNPREDICTABLE>
     c74:	00000097 	muleq	r0, r7, r0
     c78:	09780800 	ldmdbeq	r8!, {fp}^
     c7c:	49050000 	stmdbmi	r5, {}	; <UNPREDICTABLE>
     c80:	0000008c 	andeq	r0, r0, ip, lsl #1
     c84:	e5030004 	str	r0, [r3, #-4]
     c88:	0500000a 	streq	r0, [r0, #-10]
     c8c:	0001454a 	andeq	r4, r1, sl, asr #10
     c90:	28010900 	stmdacs	r1, {r8, fp}
     c94:	06000000 	streq	r0, [r0], -r0
     c98:	0001ae42 	andeq	sl, r1, r2, asr #28
     c9c:	057e0a00 	ldrbeq	r0, [lr, #-2560]!	; 0xfffff600
     ca0:	0a000000 	beq	ca8 <CPSR_IRQ_INHIBIT+0xc28>
     ca4:	00000483 	andeq	r0, r0, r3, lsl #9
     ca8:	06c00a01 	strbeq	r0, [r0], r1, lsl #20
     cac:	0a020000 	beq	80cb4 <_heap+0xcb0>
     cb0:	000006b8 			; <UNDEFINED> instruction: 0x000006b8
     cb4:	06980a03 	ldreq	r0, [r8], r3, lsl #20
     cb8:	0a040000 	beq	100cc0 <_heap+0x80cbc>
     cbc:	000006a0 	andeq	r0, r0, r0, lsr #13
     cc0:	06a80a05 	strteq	r0, [r8], r5, lsl #20
     cc4:	0a060000 	beq	180ccc <_heap+0x100cc8>
     cc8:	000006b0 			; <UNDEFINED> instruction: 0x000006b0
     ccc:	01090007 	tsteq	r9, r7
     cd0:	00000028 	andeq	r0, r0, r8, lsr #32
     cd4:	02ff5106 	rscseq	r5, pc, #-2147483647	; 0x80000001
     cd8:	470a0000 	strmi	r0, [sl, -r0]
     cdc:	00000004 	andeq	r0, r0, r4
     ce0:	0004510a 	andeq	r5, r4, sl, lsl #2
     ce4:	5b0a0100 	blpl	2810ec <_heap+0x2010e8>
     ce8:	02000004 	andeq	r0, r0, #4
     cec:	00062a0a 	andeq	r2, r6, sl, lsl #20
     cf0:	650a0300 	strvs	r0, [sl, #-768]	; 0xfffffd00
     cf4:	04000004 	streq	r0, [r0], #-4
     cf8:	00046f0a 	andeq	r6, r4, sl, lsl #30
     cfc:	790a0500 	stmdbvc	sl, {r8, sl}
     d00:	06000004 	streq	r0, [r0], -r4
     d04:	0005740a 	andeq	r7, r5, sl, lsl #8
     d08:	8d0a0700 	stchi	7, cr0, [sl, #-0]
     d0c:	08000004 	stmdaeq	r0, {r2}
     d10:	0004970a 	andeq	r9, r4, sl, lsl #14
     d14:	770a0900 	strvc	r0, [sl, -r0, lsl #18]
     d18:	0a000003 	beq	d2c <CPSR_IRQ_INHIBIT+0xcac>
     d1c:	0003820a 	andeq	r8, r3, sl, lsl #4
     d20:	8d0a0b00 	vstrhi	d0, [sl, #-0]
     d24:	0c000003 	stceq	0, cr0, [r0], {3}
     d28:	0003980a 	andeq	r9, r3, sl, lsl #16
     d2c:	a30a0d00 	movwge	r0, #44288	; 0xad00
     d30:	0e000003 	cdpeq	0, 0, cr0, cr0, cr3, {0}
     d34:	0003ae0a 	andeq	sl, r3, sl, lsl #28
     d38:	b90a0f00 	stmdblt	sl, {r8, r9, sl, fp}
     d3c:	10000003 	andne	r0, r0, r3
     d40:	0003c40a 	andeq	ip, r3, sl, lsl #8
     d44:	cf0a1100 	svcgt	0x000a1100
     d48:	12000003 	andne	r0, r0, #3
     d4c:	0003da0a 	andeq	sp, r3, sl, lsl #20
     d50:	f60a1300 			; <UNDEFINED> instruction: 0xf60a1300
     d54:	14000002 	strne	r0, [r0], #-2
     d58:	0004b50a 	andeq	fp, r4, sl, lsl #10
     d5c:	c00a1500 	andgt	r1, sl, r0, lsl #10
     d60:	16000004 	strne	r0, [r0], -r4
     d64:	0004cb0a 	andeq	ip, r4, sl, lsl #22
     d68:	d60a1700 	strle	r1, [sl], -r0, lsl #14
     d6c:	18000004 	stmdane	r0, {r2}
     d70:	0004e10a 	andeq	lr, r4, sl, lsl #2
     d74:	ec0a1900 			; <UNDEFINED> instruction: 0xec0a1900
     d78:	1a000004 	bne	d90 <CPSR_IRQ_INHIBIT+0xd10>
     d7c:	0004f70a 	andeq	pc, r4, sl, lsl #14
     d80:	020a1b00 	andeq	r1, sl, #0, 22
     d84:	1c000005 	stcne	0, cr0, [r0], {5}
     d88:	00050d0a 	andeq	r0, r5, sl, lsl #26
     d8c:	090a1d00 	stmdbeq	sl, {r8, sl, fp, ip}
     d90:	1e000006 	cdpne	0, 0, cr0, cr0, cr6, {0}
     d94:	0006140a 	andeq	r1, r6, sl, lsl #8
     d98:	1f0a1f00 	svcne	0x000a1f00
     d9c:	20000006 	andcs	r0, r0, r6
     da0:	0005bf0a 	andeq	fp, r5, sl, lsl #30
     da4:	340a2100 	strcc	r2, [sl], #-256	; 0xffffff00
     da8:	22000006 	andcs	r0, r0, #6
     dac:	00063f0a 	andeq	r3, r6, sl, lsl #30
     db0:	4a0a2300 	bmi	2899b8 <_heap+0x2099b4>
     db4:	24000006 	strcs	r0, [r0], #-6
     db8:	0005e20a 	andeq	lr, r5, sl, lsl #4
     dbc:	620a2500 	andvs	r2, sl, #0, 10
     dc0:	26000006 	strcs	r0, [r0], -r6
     dc4:	00066d0a 	andeq	r6, r6, sl, lsl #26
     dc8:	710a2700 	tstvc	sl, r0, lsl #14
     dcc:	28000002 	stmdacs	r0, {r1}
     dd0:	00036c0a 	andeq	r6, r3, sl, lsl #24
     dd4:	7c0a2900 			; <UNDEFINED> instruction: 0x7c0a2900
     dd8:	2a000002 	bcs	de8 <CPSR_IRQ_INHIBIT+0xd68>
     ddc:	0002870a 	andeq	r8, r2, sl, lsl #14
     de0:	920a2b00 	andls	r2, sl, #0, 22
     de4:	2c000002 	stccs	0, cr0, [r0], {2}
     de8:	00029d0a 	andeq	r9, r2, sl, lsl #26
     dec:	a80a2d00 	stmdage	sl, {r8, sl, fp, sp}
     df0:	2e000002 	cdpcs	0, 0, cr0, cr0, cr2, {0}
     df4:	0002b30a 	andeq	fp, r2, sl, lsl #6
     df8:	be0a2f00 	cdplt	15, 0, cr2, cr10, cr0, {0}
     dfc:	30000002 	andcc	r0, r0, r2
     e00:	0002c90a 	andeq	ip, r2, sl, lsl #18
     e04:	ee0a3100 	adfe	f3, f2, f0
     e08:	32000003 	andcc	r0, r0, #3
     e0c:	0003f90a 	andeq	pc, r3, sl, lsl #18
     e10:	fe0a3300 	cdp2	3, 0, cr3, cr10, cr0, {0}
     e14:	34000005 	strcc	r0, [r0], #-5
     e18:	0004040a 	andeq	r0, r4, sl, lsl #8
     e1c:	07003500 	streq	r3, [r0, -r0, lsl #10]
     e20:	f49b06a4 			; <UNDEFINED> instruction: 0xf49b06a4
     e24:	08000004 	stmdaeq	r0, {r2}
     e28:	00000232 	andeq	r0, r0, r2, lsr r2
     e2c:	008c9c06 	addeq	r9, ip, r6, lsl #24
     e30:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
     e34:	0000023a 	andeq	r0, r0, sl, lsr r2
     e38:	008c9d06 	addeq	r9, ip, r6, lsl #26
     e3c:	08040000 	stmdaeq	r4, {}	; <UNPREDICTABLE>
     e40:	00000242 	andeq	r0, r0, r2, asr #4
     e44:	008c9e06 	addeq	r9, ip, r6, lsl #28
     e48:	08080000 	stmdaeq	r8, {}	; <UNPREDICTABLE>
     e4c:	0000024a 	andeq	r0, r0, sl, asr #4
     e50:	008c9f06 	addeq	r9, ip, r6, lsl #30
     e54:	080c0000 	stmdaeq	ip, {}	; <UNPREDICTABLE>
     e58:	00000252 	andeq	r0, r0, r2, asr r2
     e5c:	008ca006 	addeq	sl, ip, r6
     e60:	08100000 	ldmdaeq	r0, {}	; <UNPREDICTABLE>
     e64:	0000025a 	andeq	r0, r0, sl, asr r2
     e68:	008ca106 	addeq	sl, ip, r6, lsl #2
     e6c:	08140000 	ldmdaeq	r4, {}	; <UNPREDICTABLE>
     e70:	00000318 	andeq	r0, r0, r8, lsl r3
     e74:	0097a206 	addseq	sl, r7, r6, lsl #4
     e78:	08180000 	ldmdaeq	r8, {}	; <UNPREDICTABLE>
     e7c:	00000224 	andeq	r0, r0, r4, lsr #4
     e80:	00a2a306 	adceq	sl, r2, r6, lsl #6
     e84:	081c0000 	ldmdaeq	ip, {}	; <UNPREDICTABLE>
     e88:	0000022b 	andeq	r0, r0, fp, lsr #4
     e8c:	00a2a406 	adceq	sl, r2, r6, lsl #8
     e90:	08200000 	stmdaeq	r0!, {}	; <UNPREDICTABLE>
     e94:	00000322 	andeq	r0, r0, r2, lsr #6
     e98:	0097a506 	addseq	sl, r7, r6, lsl #10
     e9c:	08240000 	stmdaeq	r4!, {}	; <UNPREDICTABLE>
     ea0:	000006d3 	ldrdeq	r0, [r0], -r3
     ea4:	00a2a606 	adceq	sl, r2, r6, lsl #12
     ea8:	08280000 	stmdaeq	r8!, {}	; <UNPREDICTABLE>
     eac:	000004a1 	andeq	r0, r0, r1, lsr #9
     eb0:	00a2a706 	adceq	sl, r2, r6, lsl #14
     eb4:	082c0000 	stmdaeq	ip!, {}	; <UNPREDICTABLE>
     eb8:	0000032c 	andeq	r0, r0, ip, lsr #6
     ebc:	0097a806 	addseq	sl, r7, r6, lsl #16
     ec0:	08300000 	ldmdaeq	r0!, {}	; <UNPREDICTABLE>
     ec4:	000005ca 	andeq	r0, r0, sl, asr #11
     ec8:	00a2a906 	adceq	sl, r2, r6, lsl #18
     ecc:	08340000 	ldmdaeq	r4!, {}	; <UNPREDICTABLE>
     ed0:	000005d1 	ldrdeq	r0, [r0], -r1
     ed4:	00a2aa06 	adceq	sl, r2, r6, lsl #20
     ed8:	08380000 	ldmdaeq	r8!, {}	; <UNPREDICTABLE>
     edc:	00000336 	andeq	r0, r0, r6, lsr r3
     ee0:	0097ab06 	addseq	sl, r7, r6, lsl #22
     ee4:	083c0000 	ldmdaeq	ip!, {}	; <UNPREDICTABLE>
     ee8:	0000034a 	andeq	r0, r0, sl, asr #6
     eec:	00a2ac06 	adceq	sl, r2, r6, lsl #24
     ef0:	08400000 	stmdaeq	r0, {}^	; <UNPREDICTABLE>
     ef4:	00000351 	andeq	r0, r0, r1, asr r3
     ef8:	00a2ad06 	adceq	sl, r2, r6, lsl #26
     efc:	08440000 	stmdaeq	r4, {}^	; <UNPREDICTABLE>
     f00:	000005d8 	ldrdeq	r0, [r0], -r8
     f04:	0097ae06 	addseq	sl, r7, r6, lsl #28
     f08:	08480000 	stmdaeq	r8, {}^	; <UNPREDICTABLE>
     f0c:	000002e1 	andeq	r0, r0, r1, ror #5
     f10:	00a2af06 	adceq	sl, r2, r6, lsl #30
     f14:	084c0000 	stmdaeq	ip, {}^	; <UNPREDICTABLE>
     f18:	000002e8 	andeq	r0, r0, r8, ror #5
     f1c:	00a2b006 	adceq	fp, r2, r6
     f20:	08500000 	ldmdaeq	r0, {}^	; <UNPREDICTABLE>
     f24:	00000340 	andeq	r0, r0, r0, asr #6
     f28:	0097b106 	addseq	fp, r7, r6, lsl #2
     f2c:	08540000 	ldmdaeq	r4, {}^	; <UNPREDICTABLE>
     f30:	00000691 	muleq	r0, r1, r6
     f34:	00a2b206 	adceq	fp, r2, r6, lsl #4
     f38:	08580000 	ldmdaeq	r8, {}^	; <UNPREDICTABLE>
     f3c:	00000262 	andeq	r0, r0, r2, ror #4
     f40:	00a2b306 	adceq	fp, r2, r6, lsl #6
     f44:	085c0000 	ldmdaeq	ip, {}^	; <UNPREDICTABLE>
     f48:	000005ed 	andeq	r0, r0, sp, ror #11
     f4c:	0097b406 	addseq	fp, r7, r6, lsl #8
     f50:	08600000 	stmdaeq	r0!, {}^	; <UNPREDICTABLE>
     f54:	000002ef 	andeq	r0, r0, pc, ror #5
     f58:	00a2b506 	adceq	fp, r2, r6, lsl #10
     f5c:	08640000 	stmdaeq	r4!, {}^	; <UNPREDICTABLE>
     f60:	000005f7 	strdeq	r0, [r0], -r7
     f64:	00a2b606 	adceq	fp, r2, r6, lsl #12
     f68:	08680000 	stmdaeq	r8!, {}^	; <UNPREDICTABLE>
     f6c:	00000678 	andeq	r0, r0, r8, ror r6
     f70:	0097b706 	addseq	fp, r7, r6, lsl #14
     f74:	086c0000 	stmdaeq	ip!, {}^	; <UNPREDICTABLE>
     f78:	00000430 	andeq	r0, r0, r0, lsr r4
     f7c:	00a2b806 	adceq	fp, r2, r6, lsl #16
     f80:	08700000 	ldmdaeq	r0!, {}^	; <UNPREDICTABLE>
     f84:	0000052b 	andeq	r0, r0, fp, lsr #10
     f88:	00a2b906 	adceq	fp, r2, r6, lsl #18
     f8c:	08740000 	ldmdaeq	r4!, {}^	; <UNPREDICTABLE>
     f90:	00000358 	andeq	r0, r0, r8, asr r3
     f94:	0097ba06 	addseq	fp, r7, r6, lsl #20
     f98:	08780000 	ldmdaeq	r8!, {}^	; <UNPREDICTABLE>
     f9c:	00000523 	andeq	r0, r0, r3, lsr #10
     fa0:	00a2bb06 	adceq	fp, r2, r6, lsl #22
     fa4:	087c0000 	ldmdaeq	ip!, {}^	; <UNPREDICTABLE>
     fa8:	00000554 	andeq	r0, r0, r4, asr r5
     fac:	00a2bc06 	adceq	fp, r2, r6, lsl #24
     fb0:	08800000 	stmeq	r0, {}	; <UNPREDICTABLE>
     fb4:	00000362 	andeq	r0, r0, r2, ror #6
     fb8:	0097bd06 	addseq	fp, r7, r6, lsl #26
     fbc:	08840000 	stmeq	r4, {}	; <UNPREDICTABLE>
     fc0:	00000437 	andeq	r0, r0, r7, lsr r4
     fc4:	00a2be06 	adceq	fp, r2, r6, lsl #28
     fc8:	08880000 	stmeq	r8, {}	; <UNPREDICTABLE>
     fcc:	0000043f 	andeq	r0, r0, pc, lsr r4
     fd0:	00a2bf06 	adceq	fp, r2, r6, lsl #30
     fd4:	088c0000 	stmeq	ip, {}	; <UNPREDICTABLE>
     fd8:	00000549 	andeq	r0, r0, r9, asr #10
     fdc:	0097c006 	addseq	ip, r7, r6
     fe0:	08900000 	ldmeq	r0, {}	; <UNPREDICTABLE>
     fe4:	0000040f 	andeq	r0, r0, pc, lsl #8
     fe8:	00a2c106 	adceq	ip, r2, r6, lsl #2
     fec:	08940000 	ldmeq	r4, {}	; <UNPREDICTABLE>
     ff0:	0000053f 	andeq	r0, r0, pc, lsr r5
     ff4:	00a2c206 	adceq	ip, r2, r6, lsl #4
     ff8:	08980000 	ldmeq	r8, {}	; <UNPREDICTABLE>
     ffc:	00000587 	andeq	r0, r0, r7, lsl #11
    1000:	00a2c306 	adceq	ip, r2, r6, lsl #6
    1004:	089c0000 	ldmeq	ip, {}	; <UNPREDICTABLE>
    1008:	00000518 	andeq	r0, r0, r8, lsl r5
    100c:	0097c406 	addseq	ip, r7, r6, lsl #8
    1010:	00a00000 	adceq	r0, r0, r0
    1014:	0006c803 	andeq	ip, r6, r3, lsl #16
    1018:	ffc50600 			; <UNDEFINED> instruction: 0xffc50600
    101c:	07000002 	streq	r0, [r0, -r2]
    1020:	38020718 	stmdacc	r2, {r3, r4, r8, r9, sl}
    1024:	08000005 	stmdaeq	r0, {r0, r2}
    1028:	000009cb 	andeq	r0, r0, fp, asr #19
    102c:	05380407 	ldreq	r0, [r8, #-1031]!	; 0xfffffbf9
    1030:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
    1034:	00000abd 			; <UNDEFINED> instruction: 0x00000abd
    1038:	00640507 	rsbeq	r0, r4, r7, lsl #10
    103c:	080c0000 	stmdaeq	ip, {}	; <UNPREDICTABLE>
    1040:	00000a1f 	andeq	r0, r0, pc, lsl sl
    1044:	00640607 	rsbeq	r0, r4, r7, lsl #12
    1048:	08100000 	ldmdaeq	r0, {}	; <UNPREDICTABLE>
    104c:	00000b31 	andeq	r0, r0, r1, lsr fp
    1050:	00640707 	rsbeq	r0, r4, r7, lsl #14
    1054:	00140000 	andseq	r0, r4, r0
    1058:	00054f0b 	andeq	r4, r5, fp, lsl #30
    105c:	00054800 	andeq	r4, r5, r0, lsl #16
    1060:	05480c00 	strbeq	r0, [r8, #-3072]	; 0xfffff400
    1064:	00090000 	andeq	r0, r9, r0
    1068:	c2070402 	andgt	r0, r7, #33554432	; 0x2000000
    106c:	0200000a 	andeq	r0, r0, #10
    1070:	00c90801 	sbceq	r0, r9, r1, lsl #16
    1074:	73030000 	movwvc	r0, #12288	; 0x3000
    1078:	0700000a 	streq	r0, [r0, -sl]
    107c:	0004ff08 	andeq	pc, r4, r8, lsl #30
    1080:	0a4e0d00 	beq	1384488 <_heap+0x1304484>
    1084:	16010000 	strne	r0, [r1], -r0
    1088:	00000572 	andeq	r0, r0, r2, ror r5
    108c:	8d540305 	ldclhi	3, cr0, [r4, #-20]	; 0xffffffec
    1090:	040e0000 	streq	r0, [lr], #-0
    1094:	00000166 	andeq	r0, r0, r6, ror #2
    1098:	000a330d 	andeq	r3, sl, sp, lsl #6
    109c:	89170100 	ldmdbhi	r7, {r8}
    10a0:	05000005 	streq	r0, [r0, #-5]
    10a4:	008d5803 	addeq	r5, sp, r3, lsl #16
    10a8:	3a040e00 	bcc	1048b0 <_heap+0x848ac>
    10ac:	0d000001 	stceq	0, cr0, [r0, #-4]
    10b0:	000009c6 	andeq	r0, r0, r6, asr #19
    10b4:	05561801 	ldrbeq	r1, [r6, #-2049]	; 0xfffff7ff
    10b8:	03050000 	movweq	r0, #20480	; 0x5000
    10bc:	00008da4 	andeq	r8, r0, r4, lsr #27
    10c0:	0009510f 	andeq	r5, r9, pc, lsl #2
    10c4:	70750100 	rsbsvc	r0, r5, r0, lsl #2
    10c8:	e0000088 	and	r0, r0, r8, lsl #1
    10cc:	01000000 	mrseq	r0, (UNDEF: 0)
    10d0:	0005d29c 	muleq	r5, ip, r2
    10d4:	0a5d0d00 	beq	17444dc <_heap+0x16c44d8>
    10d8:	77010000 	strvc	r0, [r1, -r0]
    10dc:	00000082 	andeq	r0, r0, r2, lsl #1
    10e0:	0d749102 	ldfeqp	f1, [r4, #-8]!
    10e4:	00000a7a 	andeq	r0, r0, sl, ror sl
    10e8:	054f7801 	strbeq	r7, [pc, #-2049]	; 8ef <CPSR_IRQ_INHIBIT+0x86f>
    10ec:	91020000 	mrsls	r0, (UNDEF: 2)
    10f0:	88100073 	ldmdahi	r0, {r0, r1, r4, r5, r6}
    10f4:	0100000a 	tsteq	r0, sl
    10f8:	00006470 	andeq	r6, r0, r0, ror r4
    10fc:	00883800 	addeq	r3, r8, r0, lsl #16
    1100:	00003800 	andeq	r3, r0, r0, lsl #16
    1104:	089c0100 	ldmeq	ip, {r8}
    1108:	11000006 	tstne	r0, r6
    110c:	00000a66 	andeq	r0, r0, r6, ror #20
    1110:	06087001 	streq	r7, [r8], -r1
    1114:	91020000 	mrsls	r0, (UNDEF: 2)
    1118:	09621174 	stmdbeq	r2!, {r2, r4, r5, r6, r8, ip}^
    111c:	70010000 	andvc	r0, r1, r0
    1120:	00000064 	andeq	r0, r0, r4, rrx
    1124:	00709102 	rsbseq	r9, r0, r2, lsl #2
    1128:	054f040e 	strbeq	r0, [pc, #-1038]	; d22 <CPSR_IRQ_INHIBIT+0xca2>
    112c:	140f0000 	strne	r0, [pc], #-0	; 1134 <CPSR_IRQ_INHIBIT+0x10b4>
    1130:	0100000b 	tsteq	r0, fp
    1134:	0087f067 	addeq	pc, r7, r7, rrx
    1138:	00004800 	andeq	r4, r0, r0, lsl #16
    113c:	329c0100 	addscc	r0, ip, #0, 2
    1140:	11000006 	tstne	r0, r6
    1144:	0000075c 	andeq	r0, r0, ip, asr r7
    1148:	06086701 	streq	r6, [r8], -r1, lsl #14
    114c:	91020000 	mrsls	r0, (UNDEF: 2)
    1150:	ef100074 	svc	0x00100074
    1154:	0100000a 	tsteq	r0, sl
    1158:	0000645d 	andeq	r6, r0, sp, asr r4
    115c:	00878c00 	addeq	r8, r7, r0, lsl #24
    1160:	00006400 	andeq	r6, r0, r0, lsl #8
    1164:	749c0100 	ldrvc	r0, [ip], #256	; 0x100
    1168:	11000006 	tstne	r0, r6
    116c:	0000075c 	andeq	r0, r0, ip, asr r7
    1170:	06085d01 	streq	r5, [r8], -r1, lsl #26
    1174:	91020000 	mrsls	r0, (UNDEF: 2)
    1178:	656c126c 	strbvs	r1, [ip, #-620]!	; 0xfffffd94
    117c:	5d01006e 	stcpl	0, cr0, [r1, #-440]	; 0xfffffe48
    1180:	00000064 	andeq	r0, r0, r4, rrx
    1184:	13689102 	cmnne	r8, #-2147483648	; 0x80000000
    1188:	5f010069 	svcpl	0x00010069
    118c:	00000064 	andeq	r0, r0, r4, rrx
    1190:	00749102 	rsbseq	r9, r4, r2, lsl #2
    1194:	00098414 	andeq	r8, r9, r4, lsl r4
    1198:	38540100 	ldmdacc	r4, {r8}^
    119c:	54000087 	strpl	r0, [r0], #-135	; 0xffffff79
    11a0:	01000000 	mrseq	r0, (UNDEF: 0)
    11a4:	0006969c 	muleq	r6, ip, r6
    11a8:	00631200 	rsbeq	r1, r3, r0, lsl #4
    11ac:	054f5401 	strbeq	r5, [pc, #-1025]	; db3 <CPSR_IRQ_INHIBIT+0xd33>
    11b0:	91020000 	mrsls	r0, (UNDEF: 2)
    11b4:	980f0077 	stmdals	pc, {r0, r1, r2, r4, r5, r6}	; <UNPREDICTABLE>
    11b8:	01000009 	tsteq	r0, r9
    11bc:	0085fc24 	addeq	pc, r5, r4, lsr #24
    11c0:	00013c00 	andeq	r3, r1, r0, lsl #24
    11c4:	c69c0100 	ldrgt	r0, [ip], r0, lsl #2
    11c8:	13000006 	movwne	r0, #6
    11cc:	26010069 	strcs	r0, [r1], -r9, rrx
    11d0:	0000006b 	andeq	r0, r0, fp, rrx
    11d4:	0d709102 	ldfeqp	f1, [r0, #-8]!
    11d8:	00000a6b 	andeq	r0, r0, fp, ror #20
    11dc:	06c62801 	strbeq	r2, [r6], r1, lsl #16
    11e0:	91020000 	mrsls	r0, (UNDEF: 2)
    11e4:	040e0074 	streq	r0, [lr], #-116	; 0xffffff8c
    11e8:	000004f4 	strdeq	r0, [r0], -r4
    11ec:	000a9d15 	andeq	r9, sl, r5, lsl sp
    11f0:	891f0100 	ldmdbhi	pc, {r8}	; <UNPREDICTABLE>
    11f4:	d8000005 	stmdale	r0, {r0, r2}
    11f8:	24000085 	strcs	r0, [r0], #-133	; 0xffffff7b
    11fc:	01000000 	mrseq	r0, (UNDEF: 0)
    1200:	0ada159c 	beq	ff686878 <_heap+0xff606874>
    1204:	1a010000 	bne	4120c <__bss_end__+0x38450>
    1208:	00000572 	andeq	r0, r0, r2, ror r5
    120c:	000085b4 			; <UNDEFINED> instruction: 0x000085b4
    1210:	00000024 	andeq	r0, r0, r4, lsr #32
    1214:	f3009c01 			; <UNDEFINED> instruction: 0xf3009c01
    1218:	04000009 	streq	r0, [r0], #-9
    121c:	00056800 	andeq	r6, r5, r0, lsl #16
    1220:	44010400 	strmi	r0, [r1], #-1024	; 0xfffffc00
    1224:	0c000000 	stceq	0, cr0, [r0], {-0}
    1228:	00000b80 	andeq	r0, r0, r0, lsl #23
    122c:	00000d61 	andeq	r0, r0, r1, ror #26
    1230:	00008950 	andeq	r8, r0, r0, asr r9
    1234:	000000a8 	andeq	r0, r0, r8, lsr #1
    1238:	00000727 	andeq	r0, r0, r7, lsr #14
    123c:	c2060102 	andgt	r0, r6, #-2147483648	; 0x80000000
    1240:	02000000 	andeq	r0, r0, #0
    1244:	00c00801 	sbceq	r0, r0, r1, lsl #16
    1248:	02020000 	andeq	r0, r2, #0
    124c:	00012e05 	andeq	r2, r1, r5, lsl #28
    1250:	07020200 	streq	r0, [r2, -r0, lsl #4]
    1254:	000000ce 	andeq	r0, r0, lr, asr #1
    1258:	25050402 	strcs	r0, [r5, #-1026]	; 0xfffffbfe
    125c:	03000001 	movweq	r0, #1
    1260:	000000e1 	andeq	r0, r0, r1, ror #1
    1264:	00534102 	subseq	r4, r3, r2, lsl #2
    1268:	04020000 	streq	r0, [r2], #-0
    126c:	00010e07 	andeq	r0, r1, r7, lsl #28
    1270:	05080200 	streq	r0, [r8, #-512]	; 0xfffffe00
    1274:	00000120 	andeq	r0, r0, r0, lsr #2
    1278:	09070802 	stmdbeq	r7, {r1, fp}
    127c:	04000001 	streq	r0, [r0], #-1
    1280:	6e690504 	cdpvs	5, 6, cr0, cr9, cr4, {0}
    1284:	04020074 	streq	r0, [r2], #-116	; 0xffffff8c
    1288:	00011307 	andeq	r1, r1, r7, lsl #6
    128c:	04080200 	streq	r0, [r8], #-512	; 0xfffffe00
    1290:	00000d21 	andeq	r0, r0, r1, lsr #26
    1294:	8a030405 	bhi	c22b0 <_heap+0x422ac>
    1298:	0300000d 	movweq	r0, #13
    129c:	00006807 	andeq	r6, r0, r7, lsl #16
    12a0:	0d5a0300 	ldcleq	3, cr0, [sl, #-0]
    12a4:	2c040000 	stccs	0, cr0, [r4], {-0}
    12a8:	00000041 	andeq	r0, r0, r1, asr #32
    12ac:	000e5103 	andeq	r5, lr, r3, lsl #2
    12b0:	41720400 	cmnmi	r2, r0, lsl #8
    12b4:	06000000 	streq	r0, [r0], -r0
    12b8:	00000cf9 	strdeq	r0, [r0], -r9
    12bc:	6f016505 	svcvs	0x00016505
    12c0:	07000000 	streq	r0, [r0, -r0]
    12c4:	cba60404 	blgt	fe9822dc <_heap+0xfe9022d8>
    12c8:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
    12cc:	00000cf3 	strdeq	r0, [r0], -r3
    12d0:	00a0a804 	adceq	sl, r0, r4, lsl #16
    12d4:	a5080000 	strge	r0, [r8, #-0]
    12d8:	0400000c 	streq	r0, [r0], #-12
    12dc:	0000cba9 	andeq	ip, r0, r9, lsr #23
    12e0:	2c090000 	stccs	0, cr0, [r9], {-0}
    12e4:	db000000 	blle	12ec <CPSR_IRQ_INHIBIT+0x126c>
    12e8:	0a000000 	beq	12f0 <CPSR_IRQ_INHIBIT+0x1270>
    12ec:	000000db 	ldrdeq	r0, [r0], -fp
    12f0:	04020003 	streq	r0, [r2], #-3
    12f4:	000ac207 	andeq	ip, sl, r7, lsl #4
    12f8:	04080b00 	streq	r0, [r8], #-2816	; 0xfffff500
    12fc:	000103a3 	andeq	r0, r1, r3, lsr #7
    1300:	0e3b0c00 	cdpeq	12, 3, cr0, cr11, cr0, {0}
    1304:	a5040000 	strge	r0, [r4, #-0]
    1308:	00000068 	andeq	r0, r0, r8, rrx
    130c:	0e430c00 	cdpeq	12, 4, cr0, cr3, cr0, {0}
    1310:	aa040000 	bge	101318 <_heap+0x81314>
    1314:	000000ac 	andeq	r0, r0, ip, lsr #1
    1318:	c8030004 	stmdagt	r3, {r2}
    131c:	0400000d 	streq	r0, [r0], #-13
    1320:	0000e2ab 	andeq	lr, r0, fp, lsr #5
    1324:	0c6e0300 	stcleq	3, cr0, [lr], #-0
    1328:	af040000 	svcge	0x00040000
    132c:	0000007f 	andeq	r0, r0, pc, ror r0
    1330:	000e9603 	andeq	r9, lr, r3, lsl #12
    1334:	53160600 	tstpl	r6, #0, 12
    1338:	0d000000 	stceq	0, cr0, [r0, #-0]
    133c:	00000c7f 	andeq	r0, r0, pc, ror ip
    1340:	772d0618 			; <UNDEFINED> instruction: 0x772d0618
    1344:	0c000001 	stceq	0, cr0, [r0], {1}
    1348:	00000de9 	andeq	r0, r0, r9, ror #27
    134c:	01772f06 	cmneq	r7, r6, lsl #30
    1350:	0e000000 	cdpeq	0, 0, cr0, cr0, cr0, {0}
    1354:	06006b5f 			; <UNDEFINED> instruction: 0x06006b5f
    1358:	00006830 	andeq	r6, r0, r0, lsr r8
    135c:	260c0400 	strcs	r0, [ip], -r0, lsl #8
    1360:	0600000e 	streq	r0, [r0], -lr
    1364:	00006830 	andeq	r6, r0, r0, lsr r8
    1368:	680c0800 	stmdavs	ip, {fp}
    136c:	0600000c 	streq	r0, [r0], -ip
    1370:	00006830 	andeq	r6, r0, r0, lsr r8
    1374:	dd0c0c00 	stcle	12, cr0, [ip, #-0]
    1378:	0600000e 	streq	r0, [r0], -lr
    137c:	00006830 	andeq	r6, r0, r0, lsr r8
    1380:	5f0e1000 	svcpl	0x000e1000
    1384:	31060078 	tstcc	r6, r8, ror r0
    1388:	0000017d 	andeq	r0, r0, sp, ror r1
    138c:	040f0014 	streq	r0, [pc], #-20	; 1394 <CPSR_IRQ_INHIBIT+0x1314>
    1390:	00000124 	andeq	r0, r0, r4, lsr #2
    1394:	00011909 	andeq	r1, r1, r9, lsl #18
    1398:	00018d00 	andeq	r8, r1, r0, lsl #26
    139c:	00db0a00 	sbcseq	r0, fp, r0, lsl #20
    13a0:	00000000 	andeq	r0, r0, r0
    13a4:	000ca00d 	andeq	sl, ip, sp
    13a8:	35062400 	strcc	r2, [r6, #-1024]	; 0xfffffc00
    13ac:	00000206 	andeq	r0, r0, r6, lsl #4
    13b0:	000bd10c 	andeq	sp, fp, ip, lsl #2
    13b4:	68370600 	ldmdavs	r7!, {r9, sl}
    13b8:	00000000 	andeq	r0, r0, r0
    13bc:	000e590c 	andeq	r5, lr, ip, lsl #18
    13c0:	68380600 	ldmdavs	r8!, {r9, sl}
    13c4:	04000000 	streq	r0, [r0], #-0
    13c8:	000be00c 	andeq	lr, fp, ip
    13cc:	68390600 	ldmdavs	r9!, {r9, sl}
    13d0:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
    13d4:	000f530c 	andeq	r5, pc, ip, lsl #6
    13d8:	683a0600 	ldmdavs	sl!, {r9, sl}
    13dc:	0c000000 	stceq	0, cr0, [r0], {-0}
    13e0:	000d340c 	andeq	r3, sp, ip, lsl #8
    13e4:	683b0600 	ldmdavs	fp!, {r9, sl}
    13e8:	10000000 	andne	r0, r0, r0
    13ec:	000d0e0c 	andeq	r0, sp, ip, lsl #28
    13f0:	683c0600 	ldmdavs	ip!, {r9, sl}
    13f4:	14000000 	strne	r0, [r0], #-0
    13f8:	000ee20c 	andeq	lr, lr, ip, lsl #4
    13fc:	683d0600 	ldmdavs	sp!, {r9, sl}
    1400:	18000000 	stmdane	r0, {}	; <UNPREDICTABLE>
    1404:	000daa0c 	andeq	sl, sp, ip, lsl #20
    1408:	683e0600 	ldmdavs	lr!, {r9, sl}
    140c:	1c000000 	stcne	0, cr0, [r0], {-0}
    1410:	000f1a0c 	andeq	r1, pc, ip, lsl #20
    1414:	683f0600 	ldmdavs	pc!, {r9, sl}	; <UNPREDICTABLE>
    1418:	20000000 	andcs	r0, r0, r0
    141c:	0bef1000 	bleq	ffbc5424 <_heap+0xffb45420>
    1420:	01080000 	mrseq	r0, (UNDEF: 8)
    1424:	02464806 	subeq	r4, r6, #393216	; 0x60000
    1428:	5b0c0000 	blpl	301430 <_heap+0x28142c>
    142c:	0600000c 	streq	r0, [r0], -ip
    1430:	00024649 	andeq	r4, r2, r9, asr #12
    1434:	240c0000 	strcs	r0, [ip], #-0
    1438:	0600000b 	streq	r0, [r0], -fp
    143c:	0002464a 	andeq	r4, r2, sl, asr #12
    1440:	88118000 	ldmdahi	r1, {pc}
    1444:	0600000e 	streq	r0, [r0], -lr
    1448:	0001194c 	andeq	r1, r1, ip, asr #18
    144c:	11010000 	mrsne	r0, (UNDEF: 1)
    1450:	00000c14 	andeq	r0, r0, r4, lsl ip
    1454:	01194f06 	tsteq	r9, r6, lsl #30
    1458:	01040000 	mrseq	r0, (UNDEF: 4)
    145c:	007d0900 	rsbseq	r0, sp, r0, lsl #18
    1460:	02560000 	subseq	r0, r6, #0
    1464:	db0a0000 	blle	28146c <_heap+0x201468>
    1468:	1f000000 	svcne	0x00000000
    146c:	0d3d1000 	ldceq	0, cr1, [sp, #-0]
    1470:	01900000 	orrseq	r0, r0, r0
    1474:	02945b06 	addseq	r5, r4, #6144	; 0x1800
    1478:	e90c0000 	stmdb	ip, {}	; <UNPREDICTABLE>
    147c:	0600000d 	streq	r0, [r0], -sp
    1480:	0002945c 	andeq	r9, r2, ip, asr r4
    1484:	010c0000 	mrseq	r0, (UNDEF: 12)
    1488:	0600000e 	streq	r0, [r0], -lr
    148c:	0000685d 	andeq	r6, r0, sp, asr r8
    1490:	630c0400 	movwvs	r0, #50176	; 0xc400
    1494:	0600000c 	streq	r0, [r0], -ip
    1498:	00029a5f 	andeq	r9, r2, pc, asr sl
    149c:	ef0c0800 	svc	0x000c0800
    14a0:	0600000b 	streq	r0, [r0], -fp
    14a4:	00020660 	andeq	r0, r2, r0, ror #12
    14a8:	0f008800 	svceq	0x00008800
    14ac:	00025604 	andeq	r5, r2, r4, lsl #12
    14b0:	02aa0900 	adceq	r0, sl, #0, 18
    14b4:	02aa0000 	adceq	r0, sl, #0
    14b8:	db0a0000 	blle	2814c0 <_heap+0x2014bc>
    14bc:	1f000000 	svcne	0x00000000
    14c0:	b0040f00 	andlt	r0, r4, r0, lsl #30
    14c4:	12000002 	andne	r0, r0, #2
    14c8:	000db40d 	andeq	fp, sp, sp, lsl #8
    14cc:	73060800 	movwvc	r0, #26624	; 0x6800
    14d0:	000002d6 	ldrdeq	r0, [r0], -r6
    14d4:	000ef20c 	andeq	pc, lr, ip, lsl #4
    14d8:	d6740600 	ldrbtle	r0, [r4], -r0, lsl #12
    14dc:	00000002 	andeq	r0, r0, r2
    14e0:	000b300c 	andeq	r3, fp, ip
    14e4:	68750600 	ldmdavs	r5!, {r9, sl}^
    14e8:	04000000 	streq	r0, [r0], #-0
    14ec:	2c040f00 	stccs	15, cr0, [r4], {-0}
    14f0:	0d000000 	stceq	0, cr0, [r0, #-0]
    14f4:	00000dd3 	ldrdeq	r0, [r0], -r3
    14f8:	06b30668 	ldrteq	r0, [r3], r8, ror #12
    14fc:	0e000004 	cdpeq	0, 0, cr0, cr0, cr4, {0}
    1500:	0600705f 			; <UNDEFINED> instruction: 0x0600705f
    1504:	0002d6b4 			; <UNDEFINED> instruction: 0x0002d6b4
    1508:	5f0e0000 	svcpl	0x000e0000
    150c:	b5060072 	strlt	r0, [r6, #-114]	; 0xffffff8e
    1510:	00000068 	andeq	r0, r0, r8, rrx
    1514:	775f0e04 	ldrbvc	r0, [pc, -r4, lsl #28]
    1518:	68b60600 	ldmvs	r6!, {r9, sl}
    151c:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
    1520:	000c0d0c 	andeq	r0, ip, ip, lsl #26
    1524:	33b70600 			; <UNDEFINED> instruction: 0x33b70600
    1528:	0c000000 	stceq	0, cr0, [r0], {-0}
    152c:	000cbc0c 	andeq	fp, ip, ip, lsl #24
    1530:	33b80600 			; <UNDEFINED> instruction: 0x33b80600
    1534:	0e000000 	cdpeq	0, 0, cr0, cr0, cr0, {0}
    1538:	66625f0e 	strbtvs	r5, [r2], -lr, lsl #30
    153c:	b1b90600 			; <UNDEFINED> instruction: 0xb1b90600
    1540:	10000002 	andne	r0, r0, r2
    1544:	000bab0c 	andeq	sl, fp, ip, lsl #22
    1548:	68ba0600 	ldmvs	sl!, {r9, sl}
    154c:	18000000 	stmdane	r0, {}	; <UNPREDICTABLE>
    1550:	000bfd0c 	andeq	pc, fp, ip, lsl #26
    1554:	7dc10600 	stclvc	6, cr0, [r1]
    1558:	1c000000 	stcne	0, cr0, [r0], {-0}
    155c:	0010080c 	andseq	r0, r0, ip, lsl #16
    1560:	73c30600 	bicvc	r0, r3, #0, 12
    1564:	20000005 	andcs	r0, r0, r5
    1568:	000ff30c 	andeq	pc, pc, ip, lsl #6
    156c:	9dc50600 	stclls	6, cr0, [r5]
    1570:	24000005 	strcs	r0, [r0], #-5
    1574:	000e4b0c 	andeq	r4, lr, ip, lsl #22
    1578:	c1c80600 	bicgt	r0, r8, r0, lsl #12
    157c:	28000005 	stmdacs	r0, {r0, r2}
    1580:	000f340c 	andeq	r3, pc, ip, lsl #8
    1584:	dbc90600 	blle	ff242d8c <_heap+0xff1c2d88>
    1588:	2c000005 	stccs	0, cr0, [r0], {5}
    158c:	62755f0e 	rsbsvs	r5, r5, #14, 30	; 0x38
    1590:	b1cc0600 	biclt	r0, ip, r0, lsl #12
    1594:	30000002 	andcc	r0, r0, r2
    1598:	70755f0e 	rsbsvc	r5, r5, lr, lsl #30
    159c:	d6cd0600 	strble	r0, [sp], r0, lsl #12
    15a0:	38000002 	stmdacc	r0, {r1}
    15a4:	72755f0e 	rsbsvc	r5, r5, #14, 30	; 0x38
    15a8:	68ce0600 	stmiavs	lr, {r9, sl}^
    15ac:	3c000000 	stccc	0, cr0, [r0], {-0}
    15b0:	000bda0c 	andeq	sp, fp, ip, lsl #20
    15b4:	e1d10600 	bics	r0, r1, r0, lsl #12
    15b8:	40000005 	andmi	r0, r0, r5
    15bc:	000f0c0c 	andeq	r0, pc, ip, lsl #24
    15c0:	f1d20600 			; <UNDEFINED> instruction: 0xf1d20600
    15c4:	43000005 	movwmi	r0, #5
    15c8:	626c5f0e 	rsbvs	r5, ip, #14, 30	; 0x38
    15cc:	b1d50600 	bicslt	r0, r5, r0, lsl #12
    15d0:	44000002 	strmi	r0, [r0], #-2
    15d4:	000c230c 	andeq	r2, ip, ip, lsl #6
    15d8:	68d80600 	ldmvs	r8, {r9, sl}^
    15dc:	4c000000 	stcmi	0, cr0, [r0], {-0}
    15e0:	000c340c 	andeq	r3, ip, ip, lsl #8
    15e4:	8ad90600 	bhi	ff642dec <_heap+0xff5c2de8>
    15e8:	50000000 	andpl	r0, r0, r0
    15ec:	000a650c 	andeq	r6, sl, ip, lsl #10
    15f0:	24dc0600 	ldrbcs	r0, [ip], #1536	; 0x600
    15f4:	54000004 	strpl	r0, [r0], #-4
    15f8:	000d000c 	andeq	r0, sp, ip
    15fc:	0ee00600 	cdpeq	6, 14, cr0, cr0, cr0, {0}
    1600:	58000001 	stmdapl	r0, {r0}
    1604:	000ddb0c 	andeq	sp, sp, ip, lsl #22
    1608:	03e20600 	mvneq	r0, #0, 12
    160c:	5c000001 	stcpl	0, cr0, [r0], {1}
    1610:	000d060c 	andeq	r0, sp, ip, lsl #12
    1614:	68e30600 	stmiavs	r3!, {r9, sl}^
    1618:	64000000 	strvs	r0, [r0], #-0
    161c:	00681300 	rsbeq	r1, r8, r0, lsl #6
    1620:	04240000 	strteq	r0, [r4], #-0
    1624:	24140000 	ldrcs	r0, [r4], #-0
    1628:	14000004 	strne	r0, [r0], #-4
    162c:	0000007d 	andeq	r0, r0, sp, ror r0
    1630:	00056114 	andeq	r6, r5, r4, lsl r1
    1634:	00681400 	rsbeq	r1, r8, r0, lsl #8
    1638:	0f000000 	svceq	0x00000000
    163c:	00042f04 	andeq	r2, r4, r4, lsl #30
    1640:	04241500 	strteq	r1, [r4], #-1280	; 0xfffffb00
    1644:	2e160000 	cdpcs	0, 1, cr0, cr6, cr0, {0}
    1648:	2800000e 	stmdacs	r0, {r1, r2, r3}
    164c:	02380604 	eorseq	r0, r8, #4, 12	; 0x400000
    1650:	00000561 	andeq	r0, r0, r1, ror #10
    1654:	000da317 	andeq	sl, sp, r7, lsl r3
    1658:	023a0600 	eorseq	r0, sl, #0, 12
    165c:	00000068 	andeq	r0, r0, r8, rrx
    1660:	0c1c1700 	ldceq	7, cr1, [ip], {-0}
    1664:	3f060000 	svccc	0x00060000
    1668:	00064802 	andeq	r4, r6, r2, lsl #16
    166c:	ac170400 	cfldrsge	mvf0, [r7], {-0}
    1670:	0600000c 	streq	r0, [r0], -ip
    1674:	0648023f 			; <UNDEFINED> instruction: 0x0648023f
    1678:	17080000 	strne	r0, [r8, -r0]
    167c:	00000c77 	andeq	r0, r0, r7, ror ip
    1680:	48023f06 	stmdami	r2, {r1, r2, r8, r9, sl, fp, ip, sp}
    1684:	0c000006 	stceq	0, cr0, [r0], {6}
    1688:	000dfc17 	andeq	pc, sp, r7, lsl ip	; <UNPREDICTABLE>
    168c:	02410600 	subeq	r0, r1, #0, 12
    1690:	00000068 	andeq	r0, r0, r8, rrx
    1694:	0b551710 	bleq	15472dc <_heap+0x14c72d8>
    1698:	42060000 	andmi	r0, r6, #0
    169c:	00082a02 	andeq	r2, r8, r2, lsl #20
    16a0:	be171400 	cfmulslt	mvf1, mvf7, mvf0
    16a4:	0600000e 	streq	r0, [r0], -lr
    16a8:	00680244 	rsbeq	r0, r8, r4, asr #4
    16ac:	17300000 	ldrne	r0, [r0, -r0]!
    16b0:	00000e06 	andeq	r0, r0, r6, lsl #28
    16b4:	97024506 	strls	r4, [r2, -r6, lsl #10]
    16b8:	34000005 	strcc	r0, [r0], #-5
    16bc:	000d4f17 	andeq	r4, sp, r7, lsl pc
    16c0:	02470600 	subeq	r0, r7, #0, 12
    16c4:	00000068 	andeq	r0, r0, r8, rrx
    16c8:	0e1c1738 	mrceq	7, 0, r1, cr12, cr8, {1}
    16cc:	49060000 	stmdbmi	r6, {}	; <UNPREDICTABLE>
    16d0:	00084502 	andeq	r4, r8, r2, lsl #10
    16d4:	eb173c00 	bl	5d06dc <_heap+0x5506d8>
    16d8:	0600000c 	streq	r0, [r0], -ip
    16dc:	0177024c 	cmneq	r7, ip, asr #4
    16e0:	17400000 	strbne	r0, [r0, -r0]
    16e4:	00000c96 	muleq	r0, r6, ip
    16e8:	68024d06 	stmdavs	r2, {r1, r2, r8, sl, fp, lr}
    16ec:	44000000 	strmi	r0, [r0], #-0
    16f0:	000f4e17 	andeq	r4, pc, r7, lsl lr	; <UNPREDICTABLE>
    16f4:	024e0600 	subeq	r0, lr, #0, 12
    16f8:	00000177 	andeq	r0, r0, r7, ror r1
    16fc:	0d801748 	stceq	7, cr1, [r0, #288]	; 0x120
    1700:	4f060000 	svcmi	0x00060000
    1704:	00084b02 	andeq	r4, r8, r2, lsl #22
    1708:	b4174c00 	ldrlt	r4, [r7], #-3072	; 0xfffff400
    170c:	0600000c 	streq	r0, [r0], -ip
    1710:	00680252 	rsbeq	r0, r8, r2, asr r2
    1714:	17500000 	ldrbne	r0, [r0, -r0]
    1718:	00000c2c 	andeq	r0, r0, ip, lsr #24
    171c:	61025306 	tstvs	r2, r6, lsl #6
    1720:	54000005 	strpl	r0, [r0], #-5
    1724:	000d9c17 	andeq	r9, sp, r7, lsl ip
    1728:	02760600 	rsbseq	r0, r6, #0, 12
    172c:	00000808 	andeq	r0, r0, r8, lsl #16
    1730:	0d3d1858 	ldceq	8, cr1, [sp, #-352]!	; 0xfffffea0
    1734:	7a060000 	bvc	18173c <_heap+0x101738>
    1738:	00029402 	andeq	r9, r2, r2, lsl #8
    173c:	18014800 	stmdane	r1, {fp, lr}
    1740:	00000cc9 	andeq	r0, r0, r9, asr #25
    1744:	56027b06 	strpl	r7, [r2], -r6, lsl #22
    1748:	4c000002 	stcmi	0, cr0, [r0], {2}
    174c:	0f021801 	svceq	0x00021801
    1750:	7f060000 	svcvc	0x00060000
    1754:	00085c02 	andeq	r5, r8, r2, lsl #24
    1758:	1802dc00 	stmdane	r2, {sl, fp, ip, lr, pc}
    175c:	00000c05 	andeq	r0, r0, r5, lsl #24
    1760:	0d028406 	cfstrseq	mvf8, [r2, #-24]	; 0xffffffe8
    1764:	e0000006 	and	r0, r0, r6
    1768:	0bea1802 	bleq	ffa87778 <_heap+0xffa07774>
    176c:	85060000 	strhi	r0, [r6, #-0]
    1770:	00086802 	andeq	r6, r8, r2, lsl #16
    1774:	0002ec00 	andeq	lr, r2, r0, lsl #24
    1778:	0567040f 	strbeq	r0, [r7, #-1039]!	; 0xfffffbf1
    177c:	01020000 	mrseq	r0, (UNDEF: 2)
    1780:	0000c908 	andeq	ip, r0, r8, lsl #18
    1784:	05671500 	strbeq	r1, [r7, #-1280]!	; 0xfffffb00
    1788:	040f0000 	streq	r0, [pc], #-0	; 1790 <CPSR_IRQ_INHIBIT+0x1710>
    178c:	00000406 	andeq	r0, r0, r6, lsl #8
    1790:	00006813 	andeq	r6, r0, r3, lsl r8
    1794:	00059700 	andeq	r9, r5, r0, lsl #14
    1798:	04241400 	strteq	r1, [r4], #-1024	; 0xfffffc00
    179c:	7d140000 	ldcvc	0, cr0, [r4, #-0]
    17a0:	14000000 	strne	r0, [r0], #-0
    17a4:	00000597 	muleq	r0, r7, r5
    17a8:	00006814 	andeq	r6, r0, r4, lsl r8
    17ac:	040f0000 	streq	r0, [pc], #-0	; 17b4 <CPSR_IRQ_INHIBIT+0x1734>
    17b0:	0000056e 	andeq	r0, r0, lr, ror #10
    17b4:	0579040f 	ldrbeq	r0, [r9, #-1039]!	; 0xfffffbf1
    17b8:	95130000 	ldrls	r0, [r3, #-0]
    17bc:	c1000000 	mrsgt	r0, (UNDEF: 0)
    17c0:	14000005 	strne	r0, [r0], #-5
    17c4:	00000424 	andeq	r0, r0, r4, lsr #8
    17c8:	00007d14 	andeq	r7, r0, r4, lsl sp
    17cc:	00951400 	addseq	r1, r5, r0, lsl #8
    17d0:	68140000 	ldmdavs	r4, {}	; <UNPREDICTABLE>
    17d4:	00000000 	andeq	r0, r0, r0
    17d8:	05a3040f 	streq	r0, [r3, #1039]!	; 0x40f
    17dc:	68130000 	ldmdavs	r3, {}	; <UNPREDICTABLE>
    17e0:	db000000 	blle	17e8 <CPSR_IRQ_INHIBIT+0x1768>
    17e4:	14000005 	strne	r0, [r0], #-5
    17e8:	00000424 	andeq	r0, r0, r4, lsr #8
    17ec:	00007d14 	andeq	r7, r0, r4, lsl sp
    17f0:	040f0000 	streq	r0, [pc], #-0	; 17f8 <CPSR_IRQ_INHIBIT+0x1778>
    17f4:	000005c7 	andeq	r0, r0, r7, asr #11
    17f8:	00002c09 	andeq	r2, r0, r9, lsl #24
    17fc:	0005f100 	andeq	pc, r5, r0, lsl #2
    1800:	00db0a00 	sbcseq	r0, fp, r0, lsl #20
    1804:	00020000 	andeq	r0, r2, r0
    1808:	00002c09 	andeq	r2, r0, r9, lsl #24
    180c:	00060100 	andeq	r0, r6, r0, lsl #2
    1810:	00db0a00 	sbcseq	r0, fp, r0, lsl #20
    1814:	00000000 	andeq	r0, r0, r0
    1818:	000dc106 	andeq	ip, sp, r6, lsl #2
    181c:	011d0600 	tsteq	sp, r0, lsl #12
    1820:	000002dc 	ldrdeq	r0, [r0], -ip
    1824:	000eec19 	andeq	lr, lr, r9, lsl ip
    1828:	21060c00 	tstcs	r6, r0, lsl #24
    182c:	00064201 	andeq	r4, r6, r1, lsl #4
    1830:	0de91700 	stcleq	7, cr1, [r9]
    1834:	23060000 	movwcs	r0, #24576	; 0x6000
    1838:	00064201 	andeq	r4, r6, r1, lsl #4
    183c:	c2170000 	andsgt	r0, r7, #0
    1840:	0600000c 	streq	r0, [r0], -ip
    1844:	00680124 	rsbeq	r0, r8, r4, lsr #2
    1848:	17040000 	strne	r0, [r4, -r0]
    184c:	00000dbb 			; <UNDEFINED> instruction: 0x00000dbb
    1850:	48012506 	stmdami	r1, {r1, r2, r8, sl, sp}
    1854:	08000006 	stmdaeq	r0, {r1, r2}
    1858:	0d040f00 	stceq	15, cr0, [r4, #-0]
    185c:	0f000006 	svceq	0x00000006
    1860:	00060104 	andeq	r0, r6, r4, lsl #2
    1864:	0b4d1900 	bleq	1347c6c <_heap+0x12c7c68>
    1868:	060e0000 	streq	r0, [lr], -r0
    186c:	0683013d 			; <UNDEFINED> instruction: 0x0683013d
    1870:	35170000 	ldrcc	r0, [r7, #-0]
    1874:	0600000e 	streq	r0, [r0], -lr
    1878:	0683013e 			; <UNDEFINED> instruction: 0x0683013e
    187c:	17000000 	strne	r0, [r0, -r0]
    1880:	00000e62 	andeq	r0, r0, r2, ror #28
    1884:	83013f06 	movwhi	r3, #7942	; 0x1f06
    1888:	06000006 	streq	r0, [r0], -r6
    188c:	000e9117 	andeq	r9, lr, r7, lsl r1
    1890:	01400600 	cmpeq	r0, r0, lsl #12
    1894:	0000003a 	andeq	r0, r0, sl, lsr r0
    1898:	3a09000c 	bcc	2418d0 <_heap+0x1c18cc>
    189c:	93000000 	movwls	r0, #0
    18a0:	0a000006 	beq	18c0 <CPSR_IRQ_INHIBIT+0x1840>
    18a4:	000000db 	ldrdeq	r0, [r0], -fp
    18a8:	d01a0002 	andsle	r0, sl, r2
    18ac:	94025706 	strls	r5, [r2], #-1798	; 0xfffff8fa
    18b0:	17000007 	strne	r0, [r0, -r7]
    18b4:	00000ed0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
    18b8:	6f025906 	svcvs	0x00025906
    18bc:	00000000 	andeq	r0, r0, r0
    18c0:	000e7b17 	andeq	r7, lr, r7, lsl fp
    18c4:	025a0600 	subseq	r0, sl, #0, 12
    18c8:	00000561 	andeq	r0, r0, r1, ror #10
    18cc:	0cde1704 	ldcleq	7, cr1, [lr], {4}
    18d0:	5b060000 	blpl	1818d8 <_heap+0x1018d4>
    18d4:	00079402 	andeq	r9, r7, r2, lsl #8
    18d8:	25170800 	ldrcs	r0, [r7, #-2048]	; 0xfffff800
    18dc:	0600000f 	streq	r0, [r0], -pc
    18e0:	018d025c 	orreq	r0, sp, ip, asr r2
    18e4:	17240000 	strne	r0, [r4, -r0]!
    18e8:	00000c87 	andeq	r0, r0, r7, lsl #25
    18ec:	68025d06 	stmdavs	r2, {r1, r2, r8, sl, fp, ip, lr}
    18f0:	48000000 	stmdami	r0, {}	; <UNPREDICTABLE>
    18f4:	000de417 	andeq	lr, sp, r7, lsl r4
    18f8:	025e0600 	subseq	r0, lr, #0, 12
    18fc:	00000061 	andeq	r0, r0, r1, rrx
    1900:	0f3b1750 	svceq	0x003b1750
    1904:	5f060000 	svcpl	0x00060000
    1908:	00064e02 	andeq	r4, r6, r2, lsl #28
    190c:	ef175800 	svc	0x00175800
    1910:	0600000d 	streq	r0, [r0], -sp
    1914:	01030260 	tsteq	r3, r0, ror #4
    1918:	17680000 	strbne	r0, [r8, -r0]!
    191c:	00000f40 	andeq	r0, r0, r0, asr #30
    1920:	03026106 	movweq	r6, #8454	; 0x2106
    1924:	70000001 	andvc	r0, r0, r1
    1928:	000bc317 	andeq	ip, fp, r7, lsl r3
    192c:	02620600 	rsbeq	r0, r2, #0, 12
    1930:	00000103 	andeq	r0, r0, r3, lsl #2
    1934:	0ef81778 	mrceq	7, 7, r1, cr8, cr8, {3}
    1938:	63060000 	movwvs	r0, #24576	; 0x6000
    193c:	0007a402 	andeq	sl, r7, r2, lsl #8
    1940:	d2178000 	andsle	r8, r7, #0
    1944:	0600000c 	streq	r0, [r0], -ip
    1948:	07b40264 	ldreq	r0, [r4, r4, ror #4]!
    194c:	17880000 	strne	r0, [r8, r0]
    1950:	00000e9e 	muleq	r0, lr, lr
    1954:	68026506 	stmdavs	r2, {r1, r2, r8, sl, sp, lr}
    1958:	a0000000 	andge	r0, r0, r0
    195c:	000c4d17 	andeq	r4, ip, r7, lsl sp
    1960:	02660600 	rsbeq	r0, r6, #0, 12
    1964:	00000103 	andeq	r0, r0, r3, lsl #2
    1968:	0bb417a4 	bleq	fed07800 <_heap+0xfec877fc>
    196c:	67060000 	strvs	r0, [r6, -r0]
    1970:	00010302 	andeq	r0, r1, r2, lsl #6
    1974:	3c17ac00 	ldccc	12, cr10, [r7], {-0}
    1978:	0600000c 	streq	r0, [r0], -ip
    197c:	01030268 	tsteq	r3, r8, ror #4
    1980:	17b40000 	ldrne	r0, [r4, r0]!
    1984:	00000b60 	andeq	r0, r0, r0, ror #22
    1988:	03026906 	movweq	r6, #10502	; 0x2906
    198c:	bc000001 	stclt	0, cr0, [r0], {1}
    1990:	000b6f17 	andeq	r6, fp, r7, lsl pc
    1994:	026a0600 	rsbeq	r0, sl, #0, 12
    1998:	00000103 	andeq	r0, r0, r3, lsl #2
    199c:	0da117c4 	stceq	7, cr1, [r1, #784]!	; 0x310
    19a0:	6b060000 	blvs	1819a8 <_heap+0x1019a4>
    19a4:	00006802 	andeq	r6, r0, r2, lsl #16
    19a8:	0900cc00 	stmdbeq	r0, {sl, fp, lr, pc}
    19ac:	00000567 	andeq	r0, r0, r7, ror #10
    19b0:	000007a4 	andeq	r0, r0, r4, lsr #15
    19b4:	0000db0a 	andeq	sp, r0, sl, lsl #22
    19b8:	09001900 	stmdbeq	r0, {r8, fp, ip}
    19bc:	00000567 	andeq	r0, r0, r7, ror #10
    19c0:	000007b4 			; <UNDEFINED> instruction: 0x000007b4
    19c4:	0000db0a 	andeq	sp, r0, sl, lsl #22
    19c8:	09000700 	stmdbeq	r0, {r8, r9, sl}
    19cc:	00000567 	andeq	r0, r0, r7, ror #10
    19d0:	000007c4 	andeq	r0, r0, r4, asr #15
    19d4:	0000db0a 	andeq	sp, r0, sl, lsl #22
    19d8:	1a001700 	bne	75e0 <CPSR_IRQ_INHIBIT+0x7560>
    19dc:	027006f0 	rsbseq	r0, r0, #240, 12	; 0xf000000
    19e0:	000007e8 	andeq	r0, r0, r8, ror #15
    19e4:	000d2d17 	andeq	r2, sp, r7, lsl sp
    19e8:	02730600 	rsbseq	r0, r3, #0, 12
    19ec:	000007e8 	andeq	r0, r0, r8, ror #15
    19f0:	0d181700 	ldceq	7, cr1, [r8, #-0]
    19f4:	74060000 	strvc	r0, [r6], #-0
    19f8:	0007f802 	andeq	pc, r7, r2, lsl #16
    19fc:	09007800 	stmdbeq	r0, {fp, ip, sp, lr}
    1a00:	000002d6 	ldrdeq	r0, [r0], -r6
    1a04:	000007f8 	strdeq	r0, [r0], -r8
    1a08:	0000db0a 	andeq	sp, r0, sl, lsl #22
    1a0c:	09001d00 	stmdbeq	r0, {r8, sl, fp, ip}
    1a10:	0000006f 	andeq	r0, r0, pc, rrx
    1a14:	00000808 	andeq	r0, r0, r8, lsl #16
    1a18:	0000db0a 	andeq	sp, r0, sl, lsl #22
    1a1c:	1b001d00 	blne	8e24 <__bss_end__+0x68>
    1a20:	025506f0 	subseq	r0, r5, #240, 12	; 0xf000000
    1a24:	0000082a 	andeq	r0, r0, sl, lsr #16
    1a28:	000e2e1c 	andeq	r2, lr, ip, lsl lr
    1a2c:	026c0600 	rsbeq	r0, ip, #0, 12
    1a30:	00000693 	muleq	r0, r3, r6
    1a34:	000f121c 	andeq	r1, pc, ip, lsl r2	; <UNPREDICTABLE>
    1a38:	02750600 	rsbseq	r0, r5, #0, 12
    1a3c:	000007c4 	andeq	r0, r0, r4, asr #15
    1a40:	05670900 	strbeq	r0, [r7, #-2304]!	; 0xfffff700
    1a44:	083a0000 	ldmdaeq	sl!, {}	; <UNPREDICTABLE>
    1a48:	db0a0000 	blle	281a50 <_heap+0x201a4c>
    1a4c:	18000000 	stmdane	r0, {}	; <UNPREDICTABLE>
    1a50:	08451d00 	stmdaeq	r5, {r8, sl, fp, ip}^
    1a54:	24140000 	ldrcs	r0, [r4], #-0
    1a58:	00000004 	andeq	r0, r0, r4
    1a5c:	083a040f 	ldmdaeq	sl!, {r0, r1, r2, r3, sl}
    1a60:	040f0000 	streq	r0, [pc], #-0	; 1a68 <CPSR_IRQ_INHIBIT+0x19e8>
    1a64:	00000177 	andeq	r0, r0, r7, ror r1
    1a68:	00085c1d 	andeq	r5, r8, sp, lsl ip
    1a6c:	00681400 	rsbeq	r1, r8, r0, lsl #8
    1a70:	0f000000 	svceq	0x00000000
    1a74:	00086204 	andeq	r6, r8, r4, lsl #4
    1a78:	51040f00 	tstpl	r4, r0, lsl #30
    1a7c:	09000008 	stmdbeq	r0, {r3}
    1a80:	00000601 	andeq	r0, r0, r1, lsl #12
    1a84:	00000878 	andeq	r0, r0, r8, ror r8
    1a88:	0000db0a 	andeq	sp, r0, sl, lsl #22
    1a8c:	1e000200 	cdpne	2, 0, cr0, cr0, cr0, {0}
    1a90:	00000eb2 			; <UNDEFINED> instruction: 0x00000eb2
    1a94:	2402fd06 	strcs	pc, [r2], #-3334	; 0xfffff2fa
    1a98:	1e000004 	cdpne	0, 0, cr0, cr0, cr4, {0}
    1a9c:	00000eab 	andeq	r0, r0, fp, lsr #29
    1aa0:	2a02fe06 	bcs	c12c0 <_heap+0x412bc>
    1aa4:	03000004 	movweq	r0, #4
    1aa8:	000000e3 	andeq	r0, r0, r3, ror #1
    1aac:	00483007 	subeq	r3, r8, r7
    1ab0:	901f0000 	andsls	r0, pc, r0
    1ab4:	15000008 	strne	r0, [r0, #-8]
    1ab8:	0000089b 	muleq	r0, fp, r8
    1abc:	000d4520 	andeq	r4, sp, r0, lsr #10
    1ac0:	615f0800 	cmpvs	pc, r0, lsl #16
    1ac4:	09000005 	stmdbeq	r0, {r0, r2}
    1ac8:	00000567 	andeq	r0, r0, r7, ror #10
    1acc:	000008c0 	andeq	r0, r0, r0, asr #17
    1ad0:	0000db0a 	andeq	sp, r0, sl, lsl #22
    1ad4:	03000900 	movweq	r0, #2304	; 0x900
    1ad8:	00000532 	andeq	r0, r0, r2, lsr r5
    1adc:	089b1209 	ldmeq	fp, {r0, r3, r9, ip}
    1ae0:	a8030000 	stmdage	r3, {}	; <UNPREDICTABLE>
    1ae4:	09000004 	stmdbeq	r0, {r2}
    1ae8:	0008a013 	andeq	sl, r8, r3, lsl r0
    1aec:	0a2c0b00 	beq	b046f4 <_heap+0xa846f0>
    1af0:	00096339 	andeq	r6, r9, r9, lsr r3
    1af4:	09b80c00 	ldmibeq	r8!, {sl, fp}
    1af8:	3a0a0000 	bcc	281b00 <_heap+0x201afc>
    1afc:	000008c0 	andeq	r0, r0, r0, asr #17
    1b00:	0a240c00 	beq	904b08 <_heap+0x884b04>
    1b04:	3b0a0000 	blcc	281b0c <_heap+0x201b08>
    1b08:	000008c0 	andeq	r0, r0, r0, asr #17
    1b0c:	0a3f0c04 	beq	fc4b24 <_heap+0xf44b20>
    1b10:	3c0a0000 	stccc	0, cr0, [sl], {-0}
    1b14:	000008c0 	andeq	r0, r0, r0, asr #17
    1b18:	0acb0c08 	beq	ff2c4b40 <_heap+0xff244b3c>
    1b1c:	3d0a0000 	stccc	0, cr0, [sl, #-0]
    1b20:	000008c0 	andeq	r0, r0, r0, asr #17
    1b24:	09a90c0c 	stmibeq	r9!, {r2, r3, sl, fp}
    1b28:	3e0a0000 	cdpcc	0, 0, cr0, cr10, cr0, {0}
    1b2c:	000008c0 	andeq	r0, r0, r0, asr #17
    1b30:	09690c10 	stmdbeq	r9!, {r4, sl, fp}^
    1b34:	3f0a0000 	svccc	0x000a0000
    1b38:	000008cb 	andeq	r0, r0, fp, asr #17
    1b3c:	0a100c14 	beq	404b94 <_heap+0x384b90>
    1b40:	400a0000 	andmi	r0, sl, r0
    1b44:	000008cb 	andeq	r0, r0, fp, asr #17
    1b48:	09370c18 	ldmdbeq	r7!, {r3, r4, sl, fp}
    1b4c:	410a0000 	mrsmi	r0, (UNDEF: 10)
    1b50:	000008c0 	andeq	r0, r0, r0, asr #17
    1b54:	0b040c1c 	bleq	104bcc <_heap+0x84bc8>
    1b58:	420a0000 	andmi	r0, sl, #0
    1b5c:	000008c0 	andeq	r0, r0, r0, asr #17
    1b60:	0aad0c20 	beq	feb44be8 <_heap+0xfeac4be4>
    1b64:	430a0000 	movwmi	r0, #40960	; 0xa000
    1b68:	000008cb 	andeq	r0, r0, fp, asr #17
    1b6c:	0a000c24 	beq	4c04 <CPSR_IRQ_INHIBIT+0x4b84>
    1b70:	440a0000 	strmi	r0, [sl], #-0
    1b74:	000008c0 	andeq	r0, r0, r0, asr #17
    1b78:	46030028 	strmi	r0, [r3], -r8, lsr #32
    1b7c:	0a000009 	beq	1ba8 <CPSR_IRQ_INHIBIT+0x1b28>
    1b80:	0008d645 	andeq	sp, r8, r5, asr #12
    1b84:	0f5d2100 	svceq	0x005d2100
    1b88:	09010000 	stmdbeq	r1, {}	; <UNPREDICTABLE>
    1b8c:	00000068 	andeq	r0, r0, r8, rrx
    1b90:	00008950 	andeq	r8, r0, r0, asr r9
    1b94:	000000a8 	andeq	r0, r0, r8, lsr #1
    1b98:	09e09c01 	stmibeq	r0!, {r0, sl, fp, ip, pc}^
    1b9c:	36220000 	strtcc	r0, [r2], -r0
    1ba0:	0100000b 	tsteq	r0, fp
    1ba4:	0007940b 	andeq	r9, r7, fp, lsl #8
    1ba8:	80030500 	andhi	r0, r3, r0, lsl #10
    1bac:	2200008d 	andcs	r0, r0, #141	; 0x8d
    1bb0:	00000e68 	andeq	r0, r0, r8, ror #28
    1bb4:	09e00c01 	stmibeq	r0!, {r0, sl, fp}^
    1bb8:	03050000 	movweq	r0, #20480	; 0x5000
    1bbc:	00008d5c 	andeq	r8, r0, ip, asr sp
    1bc0:	01006923 	tsteq	r0, r3, lsr #18
    1bc4:	0000680e 	andeq	r6, r0, lr, lsl #16
    1bc8:	74910200 	ldrvc	r0, [r1], #512	; 0x200
    1bcc:	000a3322 	andeq	r3, sl, r2, lsr #6
    1bd0:	f00f0100 			; <UNDEFINED> instruction: 0xf00f0100
    1bd4:	02000009 	andeq	r0, r0, #9
    1bd8:	16226c91 			; <UNDEFINED> instruction: 0x16226c91
    1bdc:	0100000e 	tsteq	r0, lr
    1be0:	0008b011 	andeq	fp, r8, r1, lsl r0
    1be4:	60910200 	addsvs	r0, r1, r0, lsl #4
    1be8:	0000b622 	andeq	fp, r0, r2, lsr #12
    1bec:	61120100 	tstvs	r2, r0, lsl #2
    1bf0:	02000005 	andeq	r0, r0, #5
    1bf4:	09007091 	stmdbeq	r0, {r0, r4, r7, ip, sp, lr}
    1bf8:	00000567 	andeq	r0, r0, r7, ror #10
    1bfc:	000009f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>
    1c00:	0000db0a 	andeq	sp, r0, sl, lsl #22
    1c04:	0f002000 	svceq	0x00002000
    1c08:	00096304 	andeq	r6, r9, r4, lsl #6
    1c0c:	010d0000 	mrseq	r0, (UNDEF: 13)
    1c10:	00040000 	andeq	r0, r4, r0
    1c14:	0000072f 	andeq	r0, r0, pc, lsr #14
    1c18:	00440104 	subeq	r0, r4, r4, lsl #2
    1c1c:	950c0000 	strls	r0, [ip, #-0]
    1c20:	f800000f 			; <UNDEFINED> instruction: 0xf800000f
    1c24:	f8000089 			; <UNDEFINED> instruction: 0xf8000089
    1c28:	c5000000 	strgt	r0, [r0, #-0]
    1c2c:	02000008 	andeq	r0, r0, #8
    1c30:	00c20601 	sbceq	r0, r2, r1, lsl #12
    1c34:	01020000 	mrseq	r0, (UNDEF: 2)
    1c38:	0000c008 	andeq	ip, r0, r8
    1c3c:	05020200 	streq	r0, [r2, #-512]	; 0xfffffe00
    1c40:	0000012e 	andeq	r0, r0, lr, lsr #2
    1c44:	ce070202 	cdpgt	2, 0, cr0, cr7, cr2, {0}
    1c48:	02000000 	andeq	r0, r0, #0
    1c4c:	01250504 			; <UNDEFINED> instruction: 0x01250504
    1c50:	e1030000 	mrs	r0, (UNDEF: 3)
    1c54:	02000000 	andeq	r0, r0, #0
    1c58:	00004f41 	andeq	r4, r0, r1, asr #30
    1c5c:	07040200 	streq	r0, [r4, -r0, lsl #4]
    1c60:	0000010e 	andeq	r0, r0, lr, lsl #2
    1c64:	20050802 	andcs	r0, r5, r2, lsl #16
    1c68:	02000001 	andeq	r0, r0, #1
    1c6c:	01090708 	tsteq	r9, r8, lsl #14
    1c70:	04040000 	streq	r0, [r4], #-0
    1c74:	746e6905 	strbtvc	r6, [lr], #-2309	; 0xfffff6fb
    1c78:	07040200 	streq	r0, [r4, -r0, lsl #4]
    1c7c:	00000113 	andeq	r0, r0, r3, lsl r1
    1c80:	0000e303 	andeq	lr, r0, r3, lsl #6
    1c84:	44300300 	ldrtmi	r0, [r0], #-768	; 0xfffffd00
    1c88:	02000000 	andeq	r0, r0, #0
    1c8c:	0ac20704 	beq	ff0838a4 <_heap+0xff0038a0>
    1c90:	01020000 	mrseq	r0, (UNDEF: 2)
    1c94:	0000c908 	andeq	ip, r0, r8, lsl #18
    1c98:	0f890500 	svceq	0x00890500
    1c9c:	0e010000 	cdpeq	0, 0, cr0, cr1, cr0, {0}
    1ca0:	000089f8 	strdeq	r8, [r0], -r8	; <UNPREDICTABLE>
    1ca4:	000000f8 	strdeq	r0, [r0], -r8
    1ca8:	00f49c01 	rscseq	r9, r4, r1, lsl #24
    1cac:	72060000 	andvc	r0, r6, #0
    1cb0:	0e010030 	mcreq	0, 0, r0, cr1, cr0, {1}
    1cb4:	0000006b 	andeq	r0, r0, fp, rrx
    1cb8:	06449102 	strbeq	r9, [r4], -r2, lsl #2
    1cbc:	01003172 	tsteq	r0, r2, ror r1
    1cc0:	00006b0e 	andeq	r6, r0, lr, lsl #22
    1cc4:	40910200 	addsmi	r0, r1, r0, lsl #4
    1cc8:	000f7207 	andeq	r7, pc, r7, lsl #4
    1ccc:	6b0e0100 	blvs	3820d4 <_heap+0x3020d0>
    1cd0:	03000000 	movweq	r0, #0
    1cd4:	087fbc91 	ldmdaeq	pc!, {r0, r4, r7, sl, fp, ip, sp, pc}^	; <UNPREDICTABLE>
    1cd8:	00000f78 	andeq	r0, r0, r8, ror pc
    1cdc:	00f43201 	rscseq	r3, r4, r1, lsl #4
    1ce0:	91020000 	mrsls	r0, (UNDEF: 2)
    1ce4:	0f680854 	svceq	0x00680854
    1ce8:	33010000 	movwcc	r0, #4096	; 0x1000
    1cec:	00000104 	andeq	r0, r0, r4, lsl #2
    1cf0:	084c9102 	stmdaeq	ip, {r1, r8, ip, pc}^
    1cf4:	000000fc 	strdeq	r0, [r0], -ip
    1cf8:	00723401 	rsbseq	r3, r2, r1, lsl #8
    1cfc:	91020000 	mrsls	r0, (UNDEF: 2)
    1d00:	84090074 	strhi	r0, [r9], #-116	; 0xffffff8c
    1d04:	04000000 	streq	r0, [r0], #-0
    1d08:	0a000001 	beq	1d14 <CPSR_IRQ_INHIBIT+0x1c94>
    1d0c:	0000007d 	andeq	r0, r0, sp, ror r0
    1d10:	840b001d 	strhi	r0, [fp], #-29	; 0xffffffe3
    1d14:	0a000000 	beq	1d1c <CPSR_IRQ_INHIBIT+0x1c9c>
    1d18:	0000007d 	andeq	r0, r0, sp, ror r0
    1d1c:	bc000007 	stclt	0, cr0, [r0], {7}
    1d20:	04000001 	streq	r0, [r0], #-1
    1d24:	0007c400 	andeq	ip, r7, r0, lsl #8
    1d28:	44010400 	strmi	r0, [r1], #-1024	; 0xfffffc00
    1d2c:	0c000000 	stceq	0, cr0, [r0], {-0}
    1d30:	00000fc5 	andeq	r0, r0, r5, asr #31
    1d34:	00008af0 	strdeq	r8, [r0], -r0
    1d38:	0000022c 	andeq	r0, r0, ip, lsr #4
    1d3c:	0000098c 	andeq	r0, r0, ip, lsl #19
    1d40:	c2060102 	andgt	r0, r6, #-2147483648	; 0x80000000
    1d44:	02000000 	andeq	r0, r0, #0
    1d48:	00c00801 	sbceq	r0, r0, r1, lsl #16
    1d4c:	02020000 	andeq	r0, r2, #0
    1d50:	00012e05 	andeq	r2, r1, r5, lsl #28
    1d54:	07020200 	streq	r0, [r2, -r0, lsl #4]
    1d58:	000000ce 	andeq	r0, r0, lr, asr #1
    1d5c:	25050402 	strcs	r0, [r5, #-1026]	; 0xfffffbfe
    1d60:	02000001 	andeq	r0, r0, #1
    1d64:	010e0704 	tsteq	lr, r4, lsl #14
    1d68:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
    1d6c:	00012005 	andeq	r2, r1, r5
    1d70:	07080200 	streq	r0, [r8, -r0, lsl #4]
    1d74:	00000109 	andeq	r0, r0, r9, lsl #2
    1d78:	69050403 	stmdbvs	r5, {r0, r1, sl}
    1d7c:	0200746e 	andeq	r7, r0, #1845493760	; 0x6e000000
    1d80:	01130704 	tsteq	r3, r4, lsl #14
    1d84:	18040000 	stmdane	r4, {}	; <UNPREDICTABLE>
    1d88:	00a00202 	adceq	r0, r0, r2, lsl #4
    1d8c:	cb050000 	blgt	141d94 <_heap+0xc1d90>
    1d90:	02000009 	andeq	r0, r0, #9
    1d94:	0000a004 	andeq	sl, r0, r4
    1d98:	bd050000 	stclt	0, cr0, [r5, #-0]
    1d9c:	0200000a 	andeq	r0, r0, #10
    1da0:	00005905 	andeq	r5, r0, r5, lsl #18
    1da4:	1f050c00 	svcne	0x00050c00
    1da8:	0200000a 	andeq	r0, r0, #10
    1dac:	00005906 	andeq	r5, r0, r6, lsl #18
    1db0:	31051000 	mrscc	r1, (UNDEF: 5)
    1db4:	0200000b 	andeq	r0, r0, #11
    1db8:	00005907 	andeq	r5, r0, r7, lsl #18
    1dbc:	06001400 	streq	r1, [r0], -r0, lsl #8
    1dc0:	000000b7 	strheq	r0, [r0], -r7
    1dc4:	000000b0 	strheq	r0, [r0], -r0	; <UNPREDICTABLE>
    1dc8:	0000b007 	andeq	fp, r0, r7
    1dcc:	02000900 	andeq	r0, r0, #0, 18
    1dd0:	0ac20704 	beq	ff0839e8 <_heap+0xff0039e4>
    1dd4:	01020000 	mrseq	r0, (UNDEF: 2)
    1dd8:	0000c908 	andeq	ip, r0, r8, lsl #18
    1ddc:	00b70800 	adcseq	r0, r7, r0, lsl #16
    1de0:	73090000 	movwvc	r0, #36864	; 0x9000
    1de4:	0200000a 	andeq	r0, r0, #10
    1de8:	00006708 	andeq	r6, r0, r8, lsl #14
    1dec:	0fef0a00 	svceq	0x00ef0a00
    1df0:	2f010000 	svccs	0x00010000
    1df4:	00000059 	andeq	r0, r0, r9, asr r0
    1df8:	00008c18 	andeq	r8, r0, r8, lsl ip
    1dfc:	00000104 	andeq	r0, r0, r4, lsl #2
    1e00:	012a9c01 			; <UNDEFINED> instruction: 0x012a9c01
    1e04:	660b0000 	strvs	r0, [fp], -r0
    1e08:	2a2f0100 	bcs	bc2210 <_heap+0xb4220c>
    1e0c:	02000001 	andeq	r0, r0, #1
    1e10:	660c6c91 			; <UNDEFINED> instruction: 0x660c6c91
    1e14:	0100000a 	tsteq	r0, sl
    1e18:	0001302f 	andeq	r3, r1, pc, lsr #32
    1e1c:	68910200 	ldmvs	r1, {r9}
    1e20:	0009620c 	andeq	r6, r9, ip, lsl #4
    1e24:	592f0100 	stmdbpl	pc!, {r8}	; <UNPREDICTABLE>
    1e28:	02000000 	andeq	r0, r0, #0
    1e2c:	690d6491 	stmdbvs	sp, {r0, r4, r7, sl, sp, lr}
    1e30:	59310100 	ldmdbpl	r1!, {r8}
    1e34:	02000000 	andeq	r0, r0, #0
    1e38:	700d7491 	mulvc	sp, r1, r4
    1e3c:	01007274 	tsteq	r0, r4, ror r2
    1e40:	00013732 	andeq	r3, r1, r2, lsr r7
    1e44:	70910200 	addsvc	r0, r1, r0, lsl #4
    1e48:	c3040e00 	movwgt	r0, #19968	; 0x4e00
    1e4c:	0e000000 	cdpeq	0, 0, cr0, cr0, cr0, {0}
    1e50:	00013604 	andeq	r3, r1, r4, lsl #12
    1e54:	040e0f00 	streq	r0, [lr], #-3840	; 0xfffff100
    1e58:	000000be 	strheq	r0, [r0], -lr
    1e5c:	0010040a 	andseq	r0, r0, sl, lsl #8
    1e60:	59130100 	ldmdbpl	r3, {r8}
    1e64:	34000000 	strcc	r0, [r0], #-0
    1e68:	e400008b 	str	r0, [r0], #-139	; 0xffffff75
    1e6c:	01000000 	mrseq	r0, (UNDEF: 0)
    1e70:	0001999c 	muleq	r1, ip, r9
    1e74:	00660b00 	rsbeq	r0, r6, r0, lsl #22
    1e78:	012a1301 			; <UNDEFINED> instruction: 0x012a1301
    1e7c:	91020000 	mrsls	r0, (UNDEF: 2)
    1e80:	100e0c6c 	andne	r0, lr, ip, ror #24
    1e84:	13010000 	movwne	r0, #4096	; 0x1000
    1e88:	00000199 	muleq	r0, r9, r1
    1e8c:	0c689102 	stfeqp	f1, [r8], #-8
    1e90:	00000962 	andeq	r0, r0, r2, ror #18
    1e94:	00591301 	subseq	r1, r9, r1, lsl #6
    1e98:	91020000 	mrsls	r0, (UNDEF: 2)
    1e9c:	00690d64 	rsbeq	r0, r9, r4, ror #26
    1ea0:	00591501 	subseq	r1, r9, r1, lsl #10
    1ea4:	91020000 	mrsls	r0, (UNDEF: 2)
    1ea8:	74700d74 	ldrbtvc	r0, [r0], #-3444	; 0xfffff28c
    1eac:	16010072 			; <UNDEFINED> instruction: 0x16010072
    1eb0:	0000019b 	muleq	r0, fp, r1
    1eb4:	00709102 	rsbseq	r9, r0, r2, lsl #2
    1eb8:	040e0410 	streq	r0, [lr], #-1040	; 0xfffffbf0
    1ebc:	000000b7 	strheq	r0, [r0], -r7
    1ec0:	000ffa11 	andeq	pc, pc, r1, lsl sl	; <UNPREDICTABLE>
    1ec4:	f00a0100 			; <UNDEFINED> instruction: 0xf00a0100
    1ec8:	4400008a 	strmi	r0, [r0], #-138	; 0xffffff76
    1ecc:	01000000 	mrseq	r0, (UNDEF: 0)
    1ed0:	00660b9c 	mlseq	r6, ip, fp, r0
    1ed4:	012a0a01 			; <UNDEFINED> instruction: 0x012a0a01
    1ed8:	91020000 	mrsls	r0, (UNDEF: 2)
    1edc:	6c000074 	stcvs	0, cr0, [r0], {116}	; 0x74
    1ee0:	02000000 	andeq	r0, r0, #0
    1ee4:	0008a400 	andeq	sl, r8, r0, lsl #8
    1ee8:	64010400 	strvs	r0, [r1], #-1024	; 0xfffffc00
    1eec:	0000000a 	andeq	r0, r0, sl
    1ef0:	94000080 	strls	r0, [r0], #-128	; 0xffffff80
    1ef4:	2f000080 	svccs	0x00000080
    1ef8:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
    1efc:	6462612f 	strbtvs	r6, [r2], #-303	; 0xfffffed1
    1f00:	72616b69 	rsbvc	r6, r1, #107520	; 0x1a400
    1f04:	642f6d69 	strtvs	r6, [pc], #-3433	; 1f0c <CPSR_IRQ_INHIBIT+0x1e8c>
    1f08:	4d2f7665 	stcmi	6, cr7, [pc, #-404]!	; 1d7c <CPSR_IRQ_INHIBIT+0x1cfc>
    1f0c:	74694c79 	strbtvc	r4, [r9], #-3193	; 0xfffff387
    1f10:	4f656c74 	svcmi	0x00656c74
    1f14:	72732f53 	rsbsvc	r2, r3, #332	; 0x14c
    1f18:	74732f63 	ldrbtvc	r2, [r3], #-3939	; 0xfffff09d
    1f1c:	2e747261 	cdpcs	2, 7, cr7, cr4, cr1, {3}
    1f20:	682f0073 	stmdavs	pc!, {r0, r1, r4, r5, r6}	; <UNPREDICTABLE>
    1f24:	2f656d6f 	svccs	0x00656d6f
    1f28:	69646261 	stmdbvs	r4!, {r0, r5, r6, r9, sp, lr}^
    1f2c:	6972616b 	ldmdbvs	r2!, {r0, r1, r3, r5, r6, r8, sp, lr}^
    1f30:	65642f6d 	strbvs	r2, [r4, #-3949]!	; 0xfffff093
    1f34:	794d2f76 	stmdbvc	sp, {r1, r2, r4, r5, r6, r8, r9, sl, fp, sp}^
    1f38:	7474694c 	ldrbtvc	r6, [r4], #-2380	; 0xfffff6b4
    1f3c:	534f656c 	movtpl	r6, #62828	; 0xf56c
    1f40:	554e4700 	strbpl	r4, [lr, #-1792]	; 0xfffff900
    1f44:	20534120 	subscs	r4, r3, r0, lsr #2
    1f48:	37322e32 			; <UNDEFINED> instruction: 0x37322e32
    1f4c:	Address 0x0000000000001f4c is out of bounds.


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
  74:	0b002408 	bleq	909c <__bss_end__+0x2e0>
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
  bc:	012e0500 			; <UNDEFINED> instruction: 0x012e0500
  c0:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
  c4:	0b3b0b3a 	bleq	ec2db4 <_heap+0xe42db0>
  c8:	01111927 	tsteq	r1, r7, lsr #18
  cc:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
  d0:	01194296 			; <UNDEFINED> instruction: 0x01194296
  d4:	06000013 			; <UNDEFINED> instruction: 0x06000013
  d8:	0e030034 	mcreq	0, 0, r0, cr3, cr4, {1}
  dc:	0b3b0b3a 	bleq	ec2dcc <_heap+0xe42dc8>
  e0:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
  e4:	2e070000 	cdpcs	0, 0, cr0, cr7, cr0, {0}
  e8:	03193f01 	tsteq	r9, #1, 30
  ec:	3b0b3a0e 	blcc	2ce92c <_heap+0x24e928>
  f0:	1119270b 	tstne	r9, fp, lsl #14
  f4:	40061201 	andmi	r1, r6, r1, lsl #4
  f8:	19429618 	stmdbne	r2, {r3, r4, r9, sl, ip, pc}^
  fc:	01000000 	mrseq	r0, (UNDEF: 0)
 100:	0e250111 	mcreq	1, 1, r0, cr5, cr1, {0}
 104:	0e030b13 	vmoveq.32	d3[0], r0
 108:	06120111 			; <UNDEFINED> instruction: 0x06120111
 10c:	00001710 	andeq	r1, r0, r0, lsl r7
 110:	0b002402 	bleq	9120 <__bss_end__+0x364>
 114:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 118:	0300000e 	movweq	r0, #14
 11c:	0e030016 	mcreq	0, 0, r0, cr3, cr6, {0}
 120:	0b3b0b3a 	bleq	ec2e10 <_heap+0xe42e0c>
 124:	00001349 	andeq	r1, r0, r9, asr #6
 128:	0b002404 	bleq	9140 <__bss_end__+0x384>
 12c:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 130:	05000008 	streq	r0, [r0, #-8]
 134:	13490035 	movtne	r0, #36917	; 0x9035
 138:	13060000 	movwne	r0, #24576	; 0x6000
 13c:	3a0b0b01 	bcc	2c2d48 <_heap+0x242d44>
 140:	010b3b0b 	tsteq	fp, fp, lsl #22
 144:	07000013 	smladeq	r0, r3, r0, r0
 148:	0e03000d 	cdpeq	0, 0, cr0, cr3, cr13, {0}
 14c:	0b3b0b3a 	bleq	ec2e3c <_heap+0xe42e38>
 150:	0b381349 	bleq	e04e7c <_heap+0xd84e78>
 154:	34080000 	strcc	r0, [r8], #-0
 158:	3a0e0300 	bcc	380d60 <_heap+0x300d5c>
 15c:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 160:	00180213 	andseq	r0, r8, r3, lsl r2
 164:	000f0900 	andeq	r0, pc, r0, lsl #18
 168:	13490b0b 	movtne	r0, #39691	; 0x9b0b
 16c:	2e0a0000 	cdpcs	0, 0, cr0, cr10, cr0, {0}
 170:	03193f00 	tsteq	r9, #0, 30
 174:	3b0b3a0e 	blcc	2ce9b4 <_heap+0x24e9b0>
 178:	1119270b 	tstne	r9, fp, lsl #14
 17c:	40061201 	andmi	r1, r6, r1, lsl #4
 180:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 184:	2e0b0000 	cdpcs	0, 0, cr0, cr11, cr0, {0}
 188:	03193f00 	tsteq	r9, #0, 30
 18c:	3b0b3a0e 	blcc	2ce9cc <_heap+0x24e9c8>
 190:	4919270b 	ldmdbmi	r9, {r0, r1, r3, r8, r9, sl, sp}
 194:	12011113 	andne	r1, r1, #-1073741820	; 0xc0000004
 198:	97184006 	ldrls	r4, [r8, -r6]
 19c:	00001942 	andeq	r1, r0, r2, asr #18
 1a0:	01110100 	tsteq	r1, r0, lsl #2
 1a4:	0b130e25 	bleq	4c3a40 <_heap+0x443a3c>
 1a8:	01110e03 	tsteq	r1, r3, lsl #28
 1ac:	17100612 			; <UNDEFINED> instruction: 0x17100612
 1b0:	24020000 	strcs	r0, [r2], #-0
 1b4:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 1b8:	000e030b 	andeq	r0, lr, fp, lsl #6
 1bc:	00160300 	andseq	r0, r6, r0, lsl #6
 1c0:	0b3a0e03 	bleq	e839d4 <_heap+0xe039d0>
 1c4:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 1c8:	24040000 	strcs	r0, [r4], #-0
 1cc:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 1d0:	0008030b 	andeq	r0, r8, fp, lsl #6
 1d4:	00350500 	eorseq	r0, r5, r0, lsl #10
 1d8:	00001349 	andeq	r1, r0, r9, asr #6
 1dc:	49002606 	stmdbmi	r0, {r1, r2, r9, sl, sp}
 1e0:	07000013 	smladeq	r0, r3, r0, r0
 1e4:	0b0b0104 	bleq	2c05fc <_heap+0x2405f8>
 1e8:	0b3a1349 	bleq	e84f14 <_heap+0xe04f10>
 1ec:	13010b3b 	movwne	r0, #6971	; 0x1b3b
 1f0:	28080000 	stmdacs	r8, {}	; <UNPREDICTABLE>
 1f4:	1c0e0300 	stcne	3, cr0, [lr], {-0}
 1f8:	0900000b 	stmdbeq	r0, {r0, r1, r3}
 1fc:	0b0b0113 	bleq	2c0650 <_heap+0x24064c>
 200:	0b3b0b3a 	bleq	ec2ef0 <_heap+0xe42eec>
 204:	00001301 	andeq	r1, r0, r1, lsl #6
 208:	03000d0a 	movweq	r0, #3338	; 0xd0a
 20c:	3b0b3a0e 	blcc	2cea4c <_heap+0x24ea48>
 210:	3813490b 	ldmdacc	r3, {r0, r1, r3, r8, fp, lr}
 214:	0b00000b 	bleq	248 <CPSR_IRQ_INHIBIT+0x1c8>
 218:	0e030034 	mcreq	0, 0, r0, cr3, cr4, {1}
 21c:	0b3b0b3a 	bleq	ec2f0c <_heap+0xe42f08>
 220:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 224:	0f0c0000 	svceq	0x000c0000
 228:	490b0b00 	stmdbmi	fp, {r8, r9, fp}
 22c:	0d000013 	stceq	0, cr0, [r0, #-76]	; 0xffffffb4
 230:	193f002e 	ldmdbne	pc!, {r1, r2, r3, r5}	; <UNPREDICTABLE>
 234:	0b3a0e03 	bleq	e83a48 <_heap+0xe03a44>
 238:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 23c:	06120111 			; <UNDEFINED> instruction: 0x06120111
 240:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 244:	0e000019 	mcreq	0, 0, r0, cr0, cr9, {0}
 248:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 24c:	0b3a0e03 	bleq	e83a60 <_heap+0xe03a5c>
 250:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 254:	06120111 			; <UNDEFINED> instruction: 0x06120111
 258:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 25c:	00130119 	andseq	r0, r3, r9, lsl r1
 260:	00050f00 	andeq	r0, r5, r0, lsl #30
 264:	0b3a0e03 	bleq	e83a78 <_heap+0xe03a74>
 268:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 26c:	00001802 	andeq	r1, r0, r2, lsl #16
 270:	3f002e10 	svccc	0x00002e10
 274:	3a0e0319 	bcc	380ee0 <_heap+0x300edc>
 278:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 27c:	11134919 	tstne	r3, r9, lsl r9
 280:	40061201 	andmi	r1, r6, r1, lsl #4
 284:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 288:	01000000 	mrseq	r0, (UNDEF: 0)
 28c:	0e250111 	mcreq	1, 1, r0, cr5, cr1, {0}
 290:	0e030b13 	vmoveq.32	d3[0], r0
 294:	06120111 			; <UNDEFINED> instruction: 0x06120111
 298:	00001710 	andeq	r1, r0, r0, lsl r7
 29c:	0b002402 	bleq	92ac <__bss_end__+0x4f0>
 2a0:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 2a4:	0300000e 	movweq	r0, #14
 2a8:	0e030016 	mcreq	0, 0, r0, cr3, cr6, {0}
 2ac:	0b3b0b3a 	bleq	ec2f9c <_heap+0xe42f98>
 2b0:	00001349 	andeq	r1, r0, r9, asr #6
 2b4:	0b002404 	bleq	92cc <__bss_end__+0x510>
 2b8:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 2bc:	05000008 	streq	r0, [r0, #-8]
 2c0:	13490035 	movtne	r0, #36917	; 0x9035
 2c4:	13060000 	movwne	r0, #24576	; 0x6000
 2c8:	3a0b0b01 	bcc	2c2ed4 <_heap+0x242ed0>
 2cc:	010b3b0b 	tsteq	fp, fp, lsl #22
 2d0:	07000013 	smladeq	r0, r3, r0, r0
 2d4:	0e03000d 	cdpeq	0, 0, cr0, cr3, cr13, {0}
 2d8:	0b3b0b3a 	bleq	ec2fc8 <_heap+0xe42fc4>
 2dc:	0b381349 	bleq	e05008 <_heap+0xd85004>
 2e0:	34080000 	strcc	r0, [r8], #-0
 2e4:	3a0e0300 	bcc	380eec <_heap+0x300ee8>
 2e8:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 2ec:	00180213 	andseq	r0, r8, r3, lsl r2
 2f0:	000f0900 	andeq	r0, pc, r0, lsl #18
 2f4:	13490b0b 	movtne	r0, #39691	; 0x9b0b
 2f8:	2e0a0000 	cdpcs	0, 0, cr0, cr10, cr0, {0}
 2fc:	03193f00 	tsteq	r9, #0, 30
 300:	3b0b3a0e 	blcc	2ceb40 <_heap+0x24eb3c>
 304:	1119270b 	tstne	r9, fp, lsl #14
 308:	40061201 	andmi	r1, r6, r1, lsl #4
 30c:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 310:	2e0b0000 	cdpcs	0, 0, cr0, cr11, cr0, {0}
 314:	03193f01 	tsteq	r9, #1, 30
 318:	3b0b3a0e 	blcc	2ceb58 <_heap+0x24eb54>
 31c:	1201110b 	andne	r1, r1, #-1073741822	; 0xc0000002
 320:	96184006 	ldrls	r4, [r8], -r6
 324:	13011942 	movwne	r1, #6466	; 0x1942
 328:	340c0000 	strcc	r0, [ip], #-0
 32c:	3a080300 	bcc	200f34 <_heap+0x180f30>
 330:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 334:	00180213 	andseq	r0, r8, r3, lsl r2
 338:	012e0d00 			; <UNDEFINED> instruction: 0x012e0d00
 33c:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
 340:	0b3b0b3a 	bleq	ec3030 <_heap+0xe4302c>
 344:	01111927 	tsteq	r1, r7, lsr #18
 348:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 34c:	01194296 			; <UNDEFINED> instruction: 0x01194296
 350:	0e000013 	mcreq	0, 0, r0, cr0, cr3, {0}
 354:	193f002e 	ldmdbne	pc!, {r1, r2, r3, r5}	; <UNPREDICTABLE>
 358:	0b3a0e03 	bleq	e83b6c <_heap+0xe03b68>
 35c:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 360:	01111349 	tsteq	r1, r9, asr #6
 364:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 368:	00194297 	mulseq	r9, r7, r2
 36c:	11010000 	mrsne	r0, (UNDEF: 1)
 370:	130e2501 	movwne	r2, #58625	; 0xe501
 374:	110e030b 	tstne	lr, fp, lsl #6
 378:	10061201 	andne	r1, r6, r1, lsl #4
 37c:	02000017 	andeq	r0, r0, #23
 380:	0b0b0024 	bleq	2c0418 <_heap+0x240414>
 384:	0e030b3e 	vmoveq.16	d3[0], r0
 388:	16030000 	strne	r0, [r3], -r0
 38c:	3a0e0300 	bcc	380f94 <_heap+0x300f90>
 390:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 394:	04000013 	streq	r0, [r0], #-19	; 0xffffffed
 398:	0b0b0024 	bleq	2c0430 <_heap+0x24042c>
 39c:	08030b3e 	stmdaeq	r3, {r1, r2, r3, r4, r5, r8, r9, fp}
 3a0:	35050000 	strcc	r0, [r5, #-0]
 3a4:	00134900 	andseq	r4, r3, r0, lsl #18
 3a8:	01130600 	tsteq	r3, r0, lsl #12
 3ac:	0b3a0b0b 	bleq	e82fe0 <_heap+0xe02fdc>
 3b0:	13010b3b 	movwne	r0, #6971	; 0x1b3b
 3b4:	0d070000 	stceq	0, cr0, [r7, #-0]
 3b8:	3a0e0300 	bcc	380fc0 <_heap+0x300fbc>
 3bc:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 3c0:	000b3813 	andeq	r3, fp, r3, lsl r8
 3c4:	00340800 	eorseq	r0, r4, r0, lsl #16
 3c8:	0b3a0e03 	bleq	e83bdc <_heap+0xe03bd8>
 3cc:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 3d0:	00001802 	andeq	r1, r0, r2, lsl #16
 3d4:	0b000f09 	bleq	4000 <CPSR_IRQ_INHIBIT+0x3f80>
 3d8:	0013490b 	andseq	r4, r3, fp, lsl #18
 3dc:	012e0a00 			; <UNDEFINED> instruction: 0x012e0a00
 3e0:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
 3e4:	0b3b0b3a 	bleq	ec30d4 <_heap+0xe430d0>
 3e8:	01111927 	tsteq	r1, r7, lsr #18
 3ec:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 3f0:	01194297 			; <UNDEFINED> instruction: 0x01194297
 3f4:	0b000013 	bleq	448 <CPSR_IRQ_INHIBIT+0x3c8>
 3f8:	08030005 	stmdaeq	r3, {r0, r2}
 3fc:	0b3b0b3a 	bleq	ec30ec <_heap+0xe430e8>
 400:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 404:	340c0000 	strcc	r0, [ip], #-0
 408:	3a080300 	bcc	201010 <_heap+0x18100c>
 40c:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 410:	00180213 	andseq	r0, r8, r3, lsl r2
 414:	002e0d00 	eoreq	r0, lr, r0, lsl #26
 418:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
 41c:	0b3b0b3a 	bleq	ec310c <_heap+0xe43108>
 420:	13491927 	movtne	r1, #39207	; 0x9927
 424:	06120111 			; <UNDEFINED> instruction: 0x06120111
 428:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 42c:	00000019 	andeq	r0, r0, r9, lsl r0
 430:	25011101 	strcs	r1, [r1, #-257]	; 0xfffffeff
 434:	030b130e 	movweq	r1, #45838	; 0xb30e
 438:	1201110e 	andne	r1, r1, #-2147483645	; 0x80000003
 43c:	00171006 	andseq	r1, r7, r6
 440:	00240200 	eoreq	r0, r4, r0, lsl #4
 444:	0b3e0b0b 	bleq	f83078 <_heap+0xf03074>
 448:	00000e03 	andeq	r0, r0, r3, lsl #28
 44c:	03001603 	movweq	r1, #1539	; 0x603
 450:	3b0b3a0e 	blcc	2cec90 <_heap+0x24ec8c>
 454:	0013490b 	andseq	r4, r3, fp, lsl #18
 458:	00240400 	eoreq	r0, r4, r0, lsl #8
 45c:	0b3e0b0b 	bleq	f83090 <_heap+0xf0308c>
 460:	00000803 	andeq	r0, r0, r3, lsl #16
 464:	49003505 	stmdbmi	r0, {r0, r2, r8, sl, ip, sp}
 468:	06000013 			; <UNDEFINED> instruction: 0x06000013
 46c:	13490026 	movtne	r0, #36902	; 0x9026
 470:	13070000 	movwne	r0, #28672	; 0x7000
 474:	3a0b0b01 	bcc	2c3080 <_heap+0x24307c>
 478:	010b3b0b 	tsteq	fp, fp, lsl #22
 47c:	08000013 	stmdaeq	r0, {r0, r1, r4}
 480:	0e03000d 	cdpeq	0, 0, cr0, cr3, cr13, {0}
 484:	0b3b0b3a 	bleq	ec3174 <_heap+0xe43170>
 488:	0b381349 	bleq	e051b4 <_heap+0xd851b0>
 48c:	04090000 	streq	r0, [r9], #-0
 490:	490b0b01 	stmdbmi	fp, {r0, r8, r9, fp}
 494:	3b0b3a13 	blcc	2cece8 <_heap+0x24ece4>
 498:	0013010b 	andseq	r0, r3, fp, lsl #2
 49c:	00280a00 	eoreq	r0, r8, r0, lsl #20
 4a0:	0b1c0e03 	bleq	703cb4 <_heap+0x683cb0>
 4a4:	010b0000 	mrseq	r0, (UNDEF: 11)
 4a8:	01134901 	tsteq	r3, r1, lsl #18
 4ac:	0c000013 	stceq	0, cr0, [r0], {19}
 4b0:	13490021 	movtne	r0, #36897	; 0x9021
 4b4:	00000b2f 	andeq	r0, r0, pc, lsr #22
 4b8:	0300340d 	movweq	r3, #1037	; 0x40d
 4bc:	3b0b3a0e 	blcc	2cecfc <_heap+0x24ecf8>
 4c0:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 4c4:	0e000018 	mcreq	0, 0, r0, cr0, cr8, {0}
 4c8:	0b0b000f 	bleq	2c050c <_heap+0x240508>
 4cc:	00001349 	andeq	r1, r0, r9, asr #6
 4d0:	3f012e0f 	svccc	0x00012e0f
 4d4:	3a0e0319 	bcc	381140 <_heap+0x30113c>
 4d8:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 4dc:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 4e0:	96184006 	ldrls	r4, [r8], -r6
 4e4:	13011942 	movwne	r1, #6466	; 0x1942
 4e8:	2e100000 	cdpcs	0, 1, cr0, cr0, cr0, {0}
 4ec:	03193f01 	tsteq	r9, #1, 30
 4f0:	3b0b3a0e 	blcc	2ced30 <_heap+0x24ed2c>
 4f4:	4919270b 	ldmdbmi	r9, {r0, r1, r3, r8, r9, sl, sp}
 4f8:	12011113 	andne	r1, r1, #-1073741820	; 0xc0000004
 4fc:	96184006 	ldrls	r4, [r8], -r6
 500:	13011942 	movwne	r1, #6466	; 0x1942
 504:	05110000 	ldreq	r0, [r1, #-0]
 508:	3a0e0300 	bcc	381110 <_heap+0x30110c>
 50c:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 510:	00180213 	andseq	r0, r8, r3, lsl r2
 514:	00051200 	andeq	r1, r5, r0, lsl #4
 518:	0b3a0803 	bleq	e8252c <_heap+0xe02528>
 51c:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 520:	00001802 	andeq	r1, r0, r2, lsl #16
 524:	03003413 	movweq	r3, #1043	; 0x413
 528:	3b0b3a08 	blcc	2ced50 <_heap+0x24ed4c>
 52c:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 530:	14000018 	strne	r0, [r0], #-24	; 0xffffffe8
 534:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 538:	0b3a0e03 	bleq	e83d4c <_heap+0xe03d48>
 53c:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 540:	06120111 			; <UNDEFINED> instruction: 0x06120111
 544:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 548:	00130119 	andseq	r0, r3, r9, lsl r1
 54c:	002e1500 	eoreq	r1, lr, r0, lsl #10
 550:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
 554:	0b3b0b3a 	bleq	ec3244 <_heap+0xe43240>
 558:	13491927 	movtne	r1, #39207	; 0x9927
 55c:	06120111 			; <UNDEFINED> instruction: 0x06120111
 560:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 564:	00000019 	andeq	r0, r0, r9, lsl r0
 568:	25011101 	strcs	r1, [r1, #-257]	; 0xfffffeff
 56c:	030b130e 	movweq	r1, #45838	; 0xb30e
 570:	110e1b0e 	tstne	lr, lr, lsl #22
 574:	10061201 	andne	r1, r6, r1, lsl #4
 578:	02000017 	andeq	r0, r0, #23
 57c:	0b0b0024 	bleq	2c0614 <_heap+0x240610>
 580:	0e030b3e 	vmoveq.16	d3[0], r0
 584:	16030000 	strne	r0, [r3], -r0
 588:	3a0e0300 	bcc	381190 <_heap+0x30118c>
 58c:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 590:	04000013 	streq	r0, [r0], #-19	; 0xffffffed
 594:	0b0b0024 	bleq	2c062c <_heap+0x240628>
 598:	08030b3e 	stmdaeq	r3, {r1, r2, r3, r4, r5, r8, r9, fp}
 59c:	0f050000 	svceq	0x00050000
 5a0:	000b0b00 	andeq	r0, fp, r0, lsl #22
 5a4:	00160600 	andseq	r0, r6, r0, lsl #12
 5a8:	0b3a0e03 	bleq	e83dbc <_heap+0xe03db8>
 5ac:	1349053b 	movtne	r0, #38203	; 0x953b
 5b0:	17070000 	strne	r0, [r7, -r0]
 5b4:	3a0b0b01 	bcc	2c31c0 <_heap+0x2431bc>
 5b8:	010b3b0b 	tsteq	fp, fp, lsl #22
 5bc:	08000013 	stmdaeq	r0, {r0, r1, r4}
 5c0:	0e03000d 	cdpeq	0, 0, cr0, cr3, cr13, {0}
 5c4:	0b3b0b3a 	bleq	ec32b4 <_heap+0xe432b0>
 5c8:	00001349 	andeq	r1, r0, r9, asr #6
 5cc:	49010109 	stmdbmi	r1, {r0, r3, r8}
 5d0:	00130113 	andseq	r0, r3, r3, lsl r1
 5d4:	00210a00 	eoreq	r0, r1, r0, lsl #20
 5d8:	0b2f1349 	bleq	bc5304 <_heap+0xb45300>
 5dc:	130b0000 	movwne	r0, #45056	; 0xb000
 5e0:	3a0b0b01 	bcc	2c31ec <_heap+0x2431e8>
 5e4:	010b3b0b 	tsteq	fp, fp, lsl #22
 5e8:	0c000013 	stceq	0, cr0, [r0], {19}
 5ec:	0e03000d 	cdpeq	0, 0, cr0, cr3, cr13, {0}
 5f0:	0b3b0b3a 	bleq	ec32e0 <_heap+0xe432dc>
 5f4:	0b381349 	bleq	e05320 <_heap+0xd8531c>
 5f8:	130d0000 	movwne	r0, #53248	; 0xd000
 5fc:	0b0e0301 	bleq	381208 <_heap+0x301204>
 600:	3b0b3a0b 	blcc	2cee34 <_heap+0x24ee30>
 604:	0013010b 	andseq	r0, r3, fp, lsl #2
 608:	000d0e00 	andeq	r0, sp, r0, lsl #28
 60c:	0b3a0803 	bleq	e82620 <_heap+0xe0261c>
 610:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 614:	00000b38 	andeq	r0, r0, r8, lsr fp
 618:	0b000f0f 	bleq	425c <CPSR_IRQ_INHIBIT+0x41dc>
 61c:	0013490b 	andseq	r4, r3, fp, lsl #18
 620:	01131000 	tsteq	r3, r0
 624:	050b0e03 	streq	r0, [fp, #-3587]	; 0xfffff1fd
 628:	0b3b0b3a 	bleq	ec3318 <_heap+0xe43314>
 62c:	00001301 	andeq	r1, r0, r1, lsl #6
 630:	03000d11 	movweq	r0, #3345	; 0xd11
 634:	3b0b3a0e 	blcc	2cee74 <_heap+0x24ee70>
 638:	3813490b 	ldmdacc	r3, {r0, r1, r3, r8, fp, lr}
 63c:	12000005 	andne	r0, r0, #5
 640:	19270015 	stmdbne	r7!, {r0, r2, r4}
 644:	15130000 	ldrne	r0, [r3, #-0]
 648:	49192701 	ldmdbmi	r9, {r0, r8, r9, sl, sp}
 64c:	00130113 	andseq	r0, r3, r3, lsl r1
 650:	00051400 	andeq	r1, r5, r0, lsl #8
 654:	00001349 	andeq	r1, r0, r9, asr #6
 658:	49002615 	stmdbmi	r0, {r0, r2, r4, r9, sl, sp}
 65c:	16000013 			; <UNDEFINED> instruction: 0x16000013
 660:	0e030113 	mcreq	1, 0, r0, cr3, cr3, {0}
 664:	0b3a050b 	bleq	e81a98 <_heap+0xe01a94>
 668:	1301053b 	movwne	r0, #5435	; 0x153b
 66c:	0d170000 	ldceq	0, cr0, [r7, #-0]
 670:	3a0e0300 	bcc	381278 <_heap+0x301274>
 674:	49053b0b 	stmdbmi	r5, {r0, r1, r3, r8, r9, fp, ip, sp}
 678:	000b3813 	andeq	r3, fp, r3, lsl r8
 67c:	000d1800 	andeq	r1, sp, r0, lsl #16
 680:	0b3a0e03 	bleq	e83e94 <_heap+0xe03e90>
 684:	1349053b 	movtne	r0, #38203	; 0x953b
 688:	00000538 	andeq	r0, r0, r8, lsr r5
 68c:	03011319 	movweq	r1, #4889	; 0x1319
 690:	3a0b0b0e 	bcc	2c32d0 <_heap+0x2432cc>
 694:	01053b0b 	tsteq	r5, fp, lsl #22
 698:	1a000013 	bne	6ec <CPSR_IRQ_INHIBIT+0x66c>
 69c:	0b0b0113 	bleq	2c0af0 <_heap+0x240aec>
 6a0:	053b0b3a 	ldreq	r0, [fp, #-2874]!	; 0xfffff4c6
 6a4:	00001301 	andeq	r1, r0, r1, lsl #6
 6a8:	0b01171b 	bleq	4631c <__bss_end__+0x3d560>
 6ac:	3b0b3a0b 	blcc	2ceee0 <_heap+0x24eedc>
 6b0:	00130105 	andseq	r0, r3, r5, lsl #2
 6b4:	000d1c00 	andeq	r1, sp, r0, lsl #24
 6b8:	0b3a0e03 	bleq	e83ecc <_heap+0xe03ec8>
 6bc:	1349053b 	movtne	r0, #38203	; 0x953b
 6c0:	151d0000 	ldrne	r0, [sp, #-0]
 6c4:	01192701 	tsteq	r9, r1, lsl #14
 6c8:	1e000013 	mcrne	0, 0, r0, cr0, cr3, {0}
 6cc:	0e030034 	mcreq	0, 0, r0, cr3, cr4, {1}
 6d0:	053b0b3a 	ldreq	r0, [fp, #-2874]!	; 0xfffff4c6
 6d4:	193f1349 	ldmdbne	pc!, {r0, r3, r6, r8, r9, ip}	; <UNPREDICTABLE>
 6d8:	0000193c 	andeq	r1, r0, ip, lsr r9
 6dc:	4900351f 	stmdbmi	r0, {r0, r1, r2, r3, r4, r8, sl, ip, sp}
 6e0:	20000013 	andcs	r0, r0, r3, lsl r0
 6e4:	0e030034 	mcreq	0, 0, r0, cr3, cr4, {1}
 6e8:	0b3b0b3a 	bleq	ec33d8 <_heap+0xe433d4>
 6ec:	193f1349 	ldmdbne	pc!, {r0, r3, r6, r8, r9, ip}	; <UNPREDICTABLE>
 6f0:	0000193c 	andeq	r1, r0, ip, lsr r9
 6f4:	3f012e21 	svccc	0x00012e21
 6f8:	3a0e0319 	bcc	381364 <_heap+0x301360>
 6fc:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 700:	11134919 	tstne	r3, r9, lsl r9
 704:	40061201 	andmi	r1, r6, r1, lsl #4
 708:	19429618 	stmdbne	r2, {r3, r4, r9, sl, ip, pc}^
 70c:	00001301 	andeq	r1, r0, r1, lsl #6
 710:	03003422 	movweq	r3, #1058	; 0x422
 714:	3b0b3a0e 	blcc	2cef54 <_heap+0x24ef50>
 718:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 71c:	23000018 	movwcs	r0, #24
 720:	08030034 	stmdaeq	r3, {r2, r4, r5}
 724:	0b3b0b3a 	bleq	ec3414 <_heap+0xe43410>
 728:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 72c:	01000000 	mrseq	r0, (UNDEF: 0)
 730:	0e250111 	mcreq	1, 1, r0, cr5, cr1, {0}
 734:	0e030b13 	vmoveq.32	d3[0], r0
 738:	06120111 			; <UNDEFINED> instruction: 0x06120111
 73c:	00001710 	andeq	r1, r0, r0, lsl r7
 740:	0b002402 	bleq	9750 <__bss_end__+0x994>
 744:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 748:	0300000e 	movweq	r0, #14
 74c:	0e030016 	mcreq	0, 0, r0, cr3, cr6, {0}
 750:	0b3b0b3a 	bleq	ec3440 <_heap+0xe4343c>
 754:	00001349 	andeq	r1, r0, r9, asr #6
 758:	0b002404 	bleq	9770 <__bss_end__+0x9b4>
 75c:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 760:	05000008 	streq	r0, [r0, #-8]
 764:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 768:	0b3a0e03 	bleq	e83f7c <_heap+0xe03f78>
 76c:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 770:	06120111 			; <UNDEFINED> instruction: 0x06120111
 774:	42961840 	addsmi	r1, r6, #64, 16	; 0x400000
 778:	00130119 	andseq	r0, r3, r9, lsl r1
 77c:	00050600 	andeq	r0, r5, r0, lsl #12
 780:	0b3a0803 	bleq	e82794 <_heap+0xe02790>
 784:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 788:	00001802 	andeq	r1, r0, r2, lsl #16
 78c:	03000507 	movweq	r0, #1287	; 0x507
 790:	3b0b3a0e 	blcc	2cefd0 <_heap+0x24efcc>
 794:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 798:	08000018 	stmdaeq	r0, {r3, r4}
 79c:	0e030034 	mcreq	0, 0, r0, cr3, cr4, {1}
 7a0:	0b3b0b3a 	bleq	ec3490 <_heap+0xe4348c>
 7a4:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 7a8:	01090000 	mrseq	r0, (UNDEF: 9)
 7ac:	01134901 	tsteq	r3, r1, lsl #18
 7b0:	0a000013 	beq	804 <CPSR_IRQ_INHIBIT+0x784>
 7b4:	13490021 	movtne	r0, #36897	; 0x9021
 7b8:	00000b2f 	andeq	r0, r0, pc, lsr #22
 7bc:	4901010b 	stmdbmi	r1, {r0, r1, r3, r8}
 7c0:	00000013 	andeq	r0, r0, r3, lsl r0
 7c4:	25011101 	strcs	r1, [r1, #-257]	; 0xfffffeff
 7c8:	030b130e 	movweq	r1, #45838	; 0xb30e
 7cc:	1201110e 	andne	r1, r1, #-2147483645	; 0x80000003
 7d0:	00171006 	andseq	r1, r7, r6
 7d4:	00240200 	eoreq	r0, r4, r0, lsl #4
 7d8:	0b3e0b0b 	bleq	f8340c <_heap+0xf03408>
 7dc:	00000e03 	andeq	r0, r0, r3, lsl #28
 7e0:	0b002403 	bleq	97f4 <__bss_end__+0xa38>
 7e4:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 7e8:	04000008 	streq	r0, [r0], #-8
 7ec:	0b0b0113 	bleq	2c0c40 <_heap+0x240c3c>
 7f0:	0b3b0b3a 	bleq	ec34e0 <_heap+0xe434dc>
 7f4:	00001301 	andeq	r1, r0, r1, lsl #6
 7f8:	03000d05 	movweq	r0, #3333	; 0xd05
 7fc:	3b0b3a0e 	blcc	2cf03c <_heap+0x24f038>
 800:	3813490b 	ldmdacc	r3, {r0, r1, r3, r8, fp, lr}
 804:	0600000b 	streq	r0, [r0], -fp
 808:	13490101 	movtne	r0, #37121	; 0x9101
 80c:	00001301 	andeq	r1, r0, r1, lsl #6
 810:	49002107 	stmdbmi	r0, {r0, r1, r2, r8, sp}
 814:	000b2f13 	andeq	r2, fp, r3, lsl pc
 818:	00260800 	eoreq	r0, r6, r0, lsl #16
 81c:	00001349 	andeq	r1, r0, r9, asr #6
 820:	03001609 	movweq	r1, #1545	; 0x609
 824:	3b0b3a0e 	blcc	2cf064 <_heap+0x24f060>
 828:	0013490b 	andseq	r4, r3, fp, lsl #18
 82c:	012e0a00 			; <UNDEFINED> instruction: 0x012e0a00
 830:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
 834:	0b3b0b3a 	bleq	ec3524 <_heap+0xe43520>
 838:	13491927 	movtne	r1, #39207	; 0x9927
 83c:	06120111 			; <UNDEFINED> instruction: 0x06120111
 840:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 844:	00130119 	andseq	r0, r3, r9, lsl r1
 848:	00050b00 	andeq	r0, r5, r0, lsl #22
 84c:	0b3a0803 	bleq	e82860 <_heap+0xe0285c>
 850:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 854:	00001802 	andeq	r1, r0, r2, lsl #16
 858:	0300050c 	movweq	r0, #1292	; 0x50c
 85c:	3b0b3a0e 	blcc	2cf09c <_heap+0x24f098>
 860:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 864:	0d000018 	stceq	0, cr0, [r0, #-96]	; 0xffffffa0
 868:	08030034 	stmdaeq	r3, {r2, r4, r5}
 86c:	0b3b0b3a 	bleq	ec355c <_heap+0xe43558>
 870:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 874:	0f0e0000 	svceq	0x000e0000
 878:	490b0b00 	stmdbmi	fp, {r8, r9, fp}
 87c:	0f000013 	svceq	0x00000013
 880:	00000026 	andeq	r0, r0, r6, lsr #32
 884:	0b000f10 	bleq	44cc <CPSR_IRQ_INHIBIT+0x444c>
 888:	1100000b 	tstne	r0, fp
 88c:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 890:	0b3a0e03 	bleq	e840a4 <_heap+0xe040a0>
 894:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 898:	06120111 			; <UNDEFINED> instruction: 0x06120111
 89c:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 8a0:	00000019 	andeq	r0, r0, r9, lsl r0
 8a4:	10001101 	andne	r1, r0, r1, lsl #2
 8a8:	12011106 	andne	r1, r1, #-2147483647	; 0x80000001
 8ac:	1b080301 	blne	2014b8 <_heap+0x1814b4>
 8b0:	13082508 	movwne	r2, #34056	; 0x8508
 8b4:	00000005 	andeq	r0, r0, r5

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
  68:	000000c1 	andeq	r0, r0, r1, asr #1
  6c:	00960002 	addseq	r0, r6, r2
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
  d8:	64000073 	strvs	r0, [r0], #-115	; 0xffffff8d
  dc:	796d6d75 	stmdbvc	sp!, {r0, r2, r4, r5, r6, r8, sl, fp, sp, lr}^
  e0:	0100632e 	tsteq	r0, lr, lsr #6
  e4:	645f0000 	ldrbvs	r0, [pc], #-0	; ec <CPSR_IRQ_INHIBIT+0x6c>
  e8:	75616665 	strbvc	r6, [r1, #-1637]!	; 0xfffff99b
  ec:	745f746c 	ldrbvc	r7, [pc], #-1132	; f4 <CPSR_IRQ_INHIBIT+0x74>
  f0:	73657079 	cmnvc	r5, #121	; 0x79
  f4:	0200682e 	andeq	r6, r0, #3014656	; 0x2e0000
  f8:	735f0000 	cmpvc	pc, #0
  fc:	6e696474 	mcrvs	4, 3, r6, cr9, cr4, {3}
 100:	00682e74 	rsbeq	r2, r8, r4, ror lr
 104:	00000003 	andeq	r0, r0, r3
 108:	00020500 	andeq	r0, r2, r0, lsl #10
 10c:	1a000081 	bne	318 <CPSR_IRQ_INHIBIT+0x298>
 110:	04020067 	streq	r0, [r2], #-103	; 0xffffff99
 114:	67874e01 	strvs	r4, [r7, r1, lsl #28]
 118:	0402004b 	streq	r0, [r2], #-75	; 0xffffffb5
 11c:	02004e01 	andeq	r4, r0, #1, 28
 120:	00670104 	rsbeq	r0, r7, r4, lsl #2
 124:	49010402 	stmdbmi	r1, {r1, sl}
 128:	01000402 	tsteq	r0, r2, lsl #8
 12c:	0000f601 	andeq	pc, r0, r1, lsl #12
 130:	dd000200 	sfmle	f0, 4, [r0, #-0]
 134:	02000000 	andeq	r0, r0, #0
 138:	0d0efb01 	vstreq	d15, [lr, #-4]
 13c:	01010100 	mrseq	r0, (UNDEF: 17)
 140:	00000001 	andeq	r0, r0, r1
 144:	01000001 	tsteq	r0, r1
 148:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; 94 <CPSR_IRQ_INHIBIT+0x14>
 14c:	62612f65 	rsbvs	r2, r1, #404	; 0x194
 150:	616b6964 	cmnvs	fp, r4, ror #18
 154:	2f6d6972 	svccs	0x006d6972
 158:	2f766564 	svccs	0x00766564
 15c:	694c794d 	stmdbvs	ip, {r0, r2, r3, r6, r8, fp, ip, sp, lr}^
 160:	656c7474 	strbvs	r7, [ip, #-1140]!	; 0xfffffb8c
 164:	732f534f 			; <UNDEFINED> instruction: 0x732f534f
 168:	2f006372 	svccs	0x00006372
 16c:	2f727375 	svccs	0x00727375
 170:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 174:	2f656475 	svccs	0x00656475
 178:	6c77656e 	cfldr64vs	mvdx6, [r7], #-440	; 0xfffffe48
 17c:	6d2f6269 	sfmvs	f6, 4, [pc, #-420]!	; ffffffe0 <_heap+0xfff7ffdc>
 180:	69686361 	stmdbvs	r8!, {r0, r5, r6, r8, r9, sp, lr}^
 184:	2f00656e 	svccs	0x0000656e
 188:	2f727375 	svccs	0x00727375
 18c:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 190:	2f656475 	svccs	0x00656475
 194:	6c77656e 	cfldr64vs	mvdx6, [r7], #-440	; 0xfffffe48
 198:	732f6269 			; <UNDEFINED> instruction: 0x732f6269
 19c:	2f007379 	svccs	0x00007379
 1a0:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
 1a4:	6462612f 	strbtvs	r6, [r2], #-303	; 0xfffffed1
 1a8:	72616b69 	rsbvc	r6, r1, #107520	; 0x1a400
 1ac:	642f6d69 	strtvs	r6, [pc], #-3433	; 1b4 <CPSR_IRQ_INHIBIT+0x134>
 1b0:	4d2f7665 	stcmi	6, cr7, [pc, #-404]!	; 24 <CPSR_THUMB+0x4>
 1b4:	74694c79 	strbtvc	r4, [r9], #-3193	; 0xfffff387
 1b8:	4f656c74 	svcmi	0x00656c74
 1bc:	72732f53 	rsbsvc	r2, r3, #332	; 0x14c
 1c0:	2e2e2f63 	cdpcs	15, 2, cr2, cr14, cr3, {3}
 1c4:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 1c8:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0xfffffa94
 1cc:	70720000 	rsbsvc	r0, r2, r0
 1d0:	72612d69 	rsbvc	r2, r1, #6720	; 0x1a40
 1d4:	6d69746d 	cfstrdvs	mvd7, [r9, #-436]!	; 0xfffffe4c
 1d8:	632e7265 			; <UNDEFINED> instruction: 0x632e7265
 1dc:	00000100 	andeq	r0, r0, r0, lsl #2
 1e0:	6665645f 			; <UNDEFINED> instruction: 0x6665645f
 1e4:	746c7561 	strbtvc	r7, [ip], #-1377	; 0xfffffa9f
 1e8:	7079745f 	rsbsvc	r7, r9, pc, asr r4
 1ec:	682e7365 	stmdavs	lr!, {r0, r2, r5, r6, r8, r9, ip, sp, lr}
 1f0:	00000200 	andeq	r0, r0, r0, lsl #4
 1f4:	6474735f 	ldrbtvs	r7, [r4], #-863	; 0xfffffca1
 1f8:	2e746e69 	cdpcs	14, 7, cr6, cr4, cr9, {3}
 1fc:	00030068 	andeq	r0, r3, r8, rrx
 200:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
 204:	6d72612d 	ldfvse	f6, [r2, #-180]!	; 0xffffff4c
 208:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0xfffff68c
 20c:	00682e72 	rsbeq	r2, r8, r2, ror lr
 210:	00000004 	andeq	r0, r0, r4
 214:	5c020500 	cfstr32pl	mvfx0, [r2], {-0}
 218:	03000081 	movweq	r0, #129	; 0x81
 21c:	4b4b0110 	blmi	12c0664 <_heap+0x1240660>
 220:	08024ca1 	stmdaeq	r2, {r0, r5, r7, sl, fp, lr}
 224:	08010100 	stmdaeq	r1, {r8}
 228:	02000001 	andeq	r0, r0, #1
 22c:	0000e300 	andeq	lr, r0, r0, lsl #6
 230:	fb010200 	blx	40a3a <__bss_end__+0x37c7e>
 234:	01000d0e 	tsteq	r0, lr, lsl #26
 238:	00010101 	andeq	r0, r1, r1, lsl #2
 23c:	00010000 	andeq	r0, r1, r0
 240:	682f0100 	stmdavs	pc!, {r8}	; <UNPREDICTABLE>
 244:	2f656d6f 	svccs	0x00656d6f
 248:	69646261 	stmdbvs	r4!, {r0, r5, r6, r9, sp, lr}^
 24c:	6972616b 	ldmdbvs	r2!, {r0, r1, r3, r5, r6, r8, sp, lr}^
 250:	65642f6d 	strbvs	r2, [r4, #-3949]!	; 0xfffff093
 254:	794d2f76 	stmdbvc	sp, {r1, r2, r4, r5, r6, r8, r9, sl, fp, sp}^
 258:	7474694c 	ldrbtvc	r6, [r4], #-2380	; 0xfffff6b4
 25c:	534f656c 	movtpl	r6, #62828	; 0xf56c
 260:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 264:	73752f00 	cmnvc	r5, #0, 30
 268:	6e692f72 	mcrvs	15, 3, r2, cr9, cr2, {3}
 26c:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xfffff39d
 270:	656e2f65 	strbvs	r2, [lr, #-3941]!	; 0xfffff09b
 274:	62696c77 	rsbvs	r6, r9, #30464	; 0x7700
 278:	63616d2f 	cmnvs	r1, #3008	; 0xbc0
 27c:	656e6968 	strbvs	r6, [lr, #-2408]!	; 0xfffff698
 280:	73752f00 	cmnvc	r5, #0, 30
 284:	6e692f72 	mcrvs	15, 3, r2, cr9, cr2, {3}
 288:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xfffff39d
 28c:	656e2f65 	strbvs	r2, [lr, #-3941]!	; 0xfffff09b
 290:	62696c77 	rsbvs	r6, r9, #30464	; 0x7700
 294:	7379732f 	cmnvc	r9, #-1140850688	; 0xbc000000
 298:	6f682f00 	svcvs	0x00682f00
 29c:	612f656d 			; <UNDEFINED> instruction: 0x612f656d
 2a0:	6b696462 	blvs	1a59430 <_heap+0x19d942c>
 2a4:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
 2a8:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
 2ac:	4c794d2f 	ldclmi	13, cr4, [r9], #-188	; 0xffffff44
 2b0:	6c747469 	cfldrdvs	mvd7, [r4], #-420	; 0xfffffe5c
 2b4:	2f534f65 	svccs	0x00534f65
 2b8:	2f637273 	svccs	0x00637273
 2bc:	692f2e2e 	stmdbvs	pc!, {r1, r2, r3, r5, r9, sl, fp, sp}	; <UNPREDICTABLE>
 2c0:	756c636e 	strbvc	r6, [ip, #-878]!	; 0xfffffc92
 2c4:	00006564 	andeq	r6, r0, r4, ror #10
 2c8:	2d697072 	stclcs	0, cr7, [r9, #-456]!	; 0xfffffe38
 2cc:	6f697067 	svcvs	0x00697067
 2d0:	0100632e 	tsteq	r0, lr, lsr #6
 2d4:	645f0000 	ldrbvs	r0, [pc], #-0	; 2dc <CPSR_IRQ_INHIBIT+0x25c>
 2d8:	75616665 	strbvc	r6, [r1, #-1637]!	; 0xfffff99b
 2dc:	745f746c 	ldrbvc	r7, [pc], #-1132	; 2e4 <CPSR_IRQ_INHIBIT+0x264>
 2e0:	73657079 	cmnvc	r5, #121	; 0x79
 2e4:	0200682e 	andeq	r6, r0, #3014656	; 0x2e0000
 2e8:	735f0000 	cmpvc	pc, #0
 2ec:	6e696474 	mcrvs	4, 3, r6, cr9, cr4, {3}
 2f0:	00682e74 	rsbeq	r2, r8, r4, ror lr
 2f4:	72000003 	andvc	r0, r0, #3
 2f8:	622d6970 	eorvs	r6, sp, #112, 18	; 0x1c0000
 2fc:	2e657361 	cdpcs	3, 6, cr7, cr5, cr1, {3}
 300:	00040068 	andeq	r0, r4, r8, rrx
 304:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
 308:	6970672d 	ldmdbvs	r0!, {r0, r2, r3, r5, r8, r9, sl, sp, lr}^
 30c:	00682e6f 	rsbeq	r2, r8, pc, ror #28
 310:	00000004 	andeq	r0, r0, r4
 314:	98020500 	stmdals	r2, {r8, sl}
 318:	03000081 	movweq	r0, #129	; 0x81
 31c:	4b4b0110 	blmi	12c0764 <_heap+0x1240760>
 320:	3d08f3a1 	stccc	3, cr15, [r8, #-644]	; 0xfffffd7c
 324:	132a0267 			; <UNDEFINED> instruction: 0x132a0267
 328:	67132802 	ldrvs	r2, [r3, -r2, lsl #16]
 32c:	08024cbd 	stmdaeq	r2, {r0, r2, r3, r4, r5, r7, sl, fp, lr}
 330:	73010100 	movwvc	r0, #4352	; 0x1100
 334:	02000001 	andeq	r0, r0, #1
 338:	0000e100 	andeq	lr, r0, r0, lsl #2
 33c:	fb010200 	blx	40b46 <__bss_end__+0x37d8a>
 340:	01000d0e 	tsteq	r0, lr, lsl #26
 344:	00010101 	andeq	r0, r1, r1, lsl #2
 348:	00010000 	andeq	r0, r1, r0
 34c:	682f0100 	stmdavs	pc!, {r8}	; <UNPREDICTABLE>
 350:	2f656d6f 	svccs	0x00656d6f
 354:	69646261 	stmdbvs	r4!, {r0, r5, r6, r9, sp, lr}^
 358:	6972616b 	ldmdbvs	r2!, {r0, r1, r3, r5, r6, r8, sp, lr}^
 35c:	65642f6d 	strbvs	r2, [r4, #-3949]!	; 0xfffff093
 360:	794d2f76 	stmdbvc	sp, {r1, r2, r4, r5, r6, r8, r9, sl, fp, sp}^
 364:	7474694c 	ldrbtvc	r6, [r4], #-2380	; 0xfffff6b4
 368:	534f656c 	movtpl	r6, #62828	; 0xf56c
 36c:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 370:	73752f00 	cmnvc	r5, #0, 30
 374:	6e692f72 	mcrvs	15, 3, r2, cr9, cr2, {3}
 378:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xfffff39d
 37c:	656e2f65 	strbvs	r2, [lr, #-3941]!	; 0xfffff09b
 380:	62696c77 	rsbvs	r6, r9, #30464	; 0x7700
 384:	63616d2f 	cmnvs	r1, #3008	; 0xbc0
 388:	656e6968 	strbvs	r6, [lr, #-2408]!	; 0xfffff698
 38c:	73752f00 	cmnvc	r5, #0, 30
 390:	6e692f72 	mcrvs	15, 3, r2, cr9, cr2, {3}
 394:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xfffff39d
 398:	656e2f65 	strbvs	r2, [lr, #-3941]!	; 0xfffff09b
 39c:	62696c77 	rsbvs	r6, r9, #30464	; 0x7700
 3a0:	7379732f 	cmnvc	r9, #-1140850688	; 0xbc000000
 3a4:	6f682f00 	svcvs	0x00682f00
 3a8:	612f656d 			; <UNDEFINED> instruction: 0x612f656d
 3ac:	6b696462 	blvs	1a5953c <_heap+0x19d9538>
 3b0:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
 3b4:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
 3b8:	4c794d2f 	ldclmi	13, cr4, [r9], #-188	; 0xffffff44
 3bc:	6c747469 	cfldrdvs	mvd7, [r4], #-420	; 0xfffffe5c
 3c0:	2f534f65 	svccs	0x00534f65
 3c4:	2f637273 	svccs	0x00637273
 3c8:	692f2e2e 	stmdbvs	pc!, {r1, r2, r3, r5, r9, sl, fp, sp}	; <UNPREDICTABLE>
 3cc:	756c636e 	strbvc	r6, [ip, #-878]!	; 0xfffffc92
 3d0:	00006564 	andeq	r6, r0, r4, ror #10
 3d4:	2d697072 	stclcs	0, cr7, [r9, #-456]!	; 0xfffffe38
 3d8:	65746e69 	ldrbvs	r6, [r4, #-3689]!	; 0xfffff197
 3dc:	70757272 	rsbsvc	r7, r5, r2, ror r2
 3e0:	632e7374 			; <UNDEFINED> instruction: 0x632e7374
 3e4:	00000100 	andeq	r0, r0, r0, lsl #2
 3e8:	6665645f 			; <UNDEFINED> instruction: 0x6665645f
 3ec:	746c7561 	strbtvc	r7, [ip], #-1377	; 0xfffffa9f
 3f0:	7079745f 	rsbsvc	r7, r9, pc, asr r4
 3f4:	682e7365 	stmdavs	lr!, {r0, r2, r5, r6, r8, r9, ip, sp, lr}
 3f8:	00000200 	andeq	r0, r0, r0, lsl #4
 3fc:	6474735f 	ldrbtvs	r7, [r4], #-863	; 0xfffffca1
 400:	2e746e69 	cdpcs	14, 7, cr6, cr4, cr9, {3}
 404:	00030068 	andeq	r0, r3, r8, rrx
 408:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
 40c:	746e692d 	strbtvc	r6, [lr], #-2349	; 0xfffff6d3
 410:	75727265 	ldrbvc	r7, [r2, #-613]!	; 0xfffffd9b
 414:	2e737470 	mrccs	4, 3, r7, cr3, cr0, {3}
 418:	00040068 	andeq	r0, r4, r8, rrx
 41c:	05000000 	streq	r0, [r0, #-0]
 420:	0082f002 	addeq	pc, r2, r2
 424:	011d0300 	tsteq	sp, r0, lsl #6
 428:	0b034b4b 	bleq	d315c <_heap+0x53158>
 42c:	0200839e 	andeq	r8, r0, #2013265922	; 0x78000002
 430:	004e0104 	subeq	r0, lr, r4, lsl #2
 434:	83010402 	movwhi	r0, #5122	; 0x1402
 438:	01040200 	mrseq	r0, R12_usr
 43c:	2e0c0365 	cdpcs	3, 0, cr0, cr12, cr5, {3}
 440:	04020067 	streq	r0, [r2], #-103	; 0xffffff99
 444:	02004d01 	andeq	r4, r0, #1, 26	; 0x40
 448:	00830104 	addeq	r0, r3, r4, lsl #2
 44c:	65010402 	strvs	r0, [r1, #-1026]	; 0xfffffbfe
 450:	672e0d03 	strvs	r0, [lr, -r3, lsl #26]!
 454:	01040200 	mrseq	r0, R12_usr
 458:	0402004d 	streq	r0, [r2], #-77	; 0xffffffb3
 45c:	02008301 	andeq	r8, r0, #67108864	; 0x4000000
 460:	03650104 	cmneq	r5, #4, 2
 464:	00832e0d 	addeq	r2, r3, sp, lsl #28
 468:	4d010402 	cfstrsmi	mvf0, [r1, #-8]
 46c:	01040200 	mrseq	r0, R12_usr
 470:	04020083 	streq	r0, [r2], #-131	; 0xffffff7d
 474:	0d036501 	cfstr32eq	mvfx6, [r3, #-4]
 478:	0200832e 	andeq	r8, r0, #-1207959552	; 0xb8000000
 47c:	004d0104 	subeq	r0, sp, r4, lsl #2
 480:	83010402 	movwhi	r0, #5122	; 0x1402
 484:	01040200 	mrseq	r0, R12_usr
 488:	2e0e0365 	cdpcs	3, 0, cr0, cr14, cr5, {3}
 48c:	bda1a16b 	stfltd	f2, [r1, #428]!	; 0x1ac
 490:	a1a26c84 			; <UNDEFINED> instruction: 0xa1a26c84
 494:	03838485 	orreq	r8, r3, #-2063597568	; 0x85000000
 498:	5603662e 	strpl	r6, [r3], -lr, lsr #12
 49c:	2903832e 	stmdbcs	r3, {r1, r2, r3, r5, r8, r9, pc}
 4a0:	ba1c0366 	blt	701240 <_heap+0x68123c>
 4a4:	00060230 	andeq	r0, r6, r0, lsr r2
 4a8:	00ff0101 	rscseq	r0, pc, r1, lsl #2
 4ac:	00020000 	andeq	r0, r2, r0
 4b0:	000000dd 	ldrdeq	r0, [r0], -sp
 4b4:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 4b8:	0101000d 	tsteq	r1, sp
 4bc:	00000101 	andeq	r0, r0, r1, lsl #2
 4c0:	00000100 	andeq	r0, r0, r0, lsl #2
 4c4:	6f682f01 	svcvs	0x00682f01
 4c8:	612f656d 			; <UNDEFINED> instruction: 0x612f656d
 4cc:	6b696462 	blvs	1a5965c <_heap+0x19d9658>
 4d0:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
 4d4:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
 4d8:	4c794d2f 	ldclmi	13, cr4, [r9], #-188	; 0xffffff44
 4dc:	6c747469 	cfldrdvs	mvd7, [r4], #-420	; 0xfffffe5c
 4e0:	2f534f65 	svccs	0x00534f65
 4e4:	00637273 	rsbeq	r7, r3, r3, ror r2
 4e8:	7273752f 	rsbsvc	r7, r3, #197132288	; 0xbc00000
 4ec:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 4f0:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0xfffffa94
 4f4:	77656e2f 	strbvc	r6, [r5, -pc, lsr #28]!
 4f8:	2f62696c 	svccs	0x0062696c
 4fc:	6863616d 	stmdavs	r3!, {r0, r2, r3, r5, r6, r8, sp, lr}^
 500:	00656e69 	rsbeq	r6, r5, r9, ror #28
 504:	7273752f 	rsbsvc	r7, r3, #197132288	; 0xbc00000
 508:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 50c:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0xfffffa94
 510:	77656e2f 	strbvc	r6, [r5, -pc, lsr #28]!
 514:	2f62696c 	svccs	0x0062696c
 518:	00737973 	rsbseq	r7, r3, r3, ror r9
 51c:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; 468 <CPSR_IRQ_INHIBIT+0x3e8>
 520:	62612f65 	rsbvs	r2, r1, #404	; 0x194
 524:	616b6964 	cmnvs	fp, r4, ror #18
 528:	2f6d6972 	svccs	0x006d6972
 52c:	2f766564 	svccs	0x00766564
 530:	694c794d 	stmdbvs	ip, {r0, r2, r3, r6, r8, fp, ip, sp, lr}^
 534:	656c7474 	strbvs	r7, [ip, #-1140]!	; 0xfffffb8c
 538:	732f534f 			; <UNDEFINED> instruction: 0x732f534f
 53c:	2e2f6372 	mcrcs	3, 1, r6, cr15, cr2, {3}
 540:	6e692f2e 	cdpvs	15, 6, cr2, cr9, cr14, {1}
 544:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xfffff39d
 548:	72000065 	andvc	r0, r0, #101	; 0x65
 54c:	732d6970 			; <UNDEFINED> instruction: 0x732d6970
 550:	69747379 	ldmdbvs	r4!, {r0, r3, r4, r5, r6, r8, r9, ip, sp, lr}^
 554:	2e72656d 	cdpcs	5, 7, cr6, cr2, cr13, {3}
 558:	00010063 	andeq	r0, r1, r3, rrx
 55c:	65645f00 	strbvs	r5, [r4, #-3840]!	; 0xfffff100
 560:	6c756166 	ldfvse	f6, [r5], #-408	; 0xfffffe68
 564:	79745f74 	ldmdbvc	r4!, {r2, r4, r5, r6, r8, r9, sl, fp, ip, lr}^
 568:	2e736570 	mrccs	5, 3, r6, cr3, cr0, {3}
 56c:	00020068 	andeq	r0, r2, r8, rrx
 570:	74735f00 	ldrbtvc	r5, [r3], #-3840	; 0xfffff100
 574:	746e6964 	strbtvc	r6, [lr], #-2404	; 0xfffff69c
 578:	0300682e 	movweq	r6, #2094	; 0x82e
 57c:	70720000 	rsbsvc	r0, r2, r0
 580:	79732d69 	ldmdbvc	r3!, {r0, r3, r5, r6, r8, sl, fp, sp}^
 584:	6d697473 	cfstrdvs	mvd7, [r9, #-460]!	; 0xfffffe34
 588:	682e7265 	stmdavs	lr!, {r0, r2, r5, r6, r9, ip, sp, lr}
 58c:	00000400 	andeq	r0, r0, r0, lsl #8
 590:	02050000 	andeq	r0, r5, #0
 594:	00008538 	andeq	r8, r0, r8, lsr r5
 598:	4b011003 	blmi	445ac <__bss_end__+0x3b7f0>
 59c:	8483a14b 	strhi	sl, [r3], #331	; 0x14b
 5a0:	01040200 	mrseq	r0, R12_usr
 5a4:	f6062e06 			; <UNDEFINED> instruction: 0xf6062e06
 5a8:	01000a02 	tsteq	r0, r2, lsl #20
 5ac:	00017601 	andeq	r7, r1, r1, lsl #12
 5b0:	fb000200 	blx	dba <CPSR_IRQ_INHIBIT+0xd3a>
 5b4:	02000000 	andeq	r0, r0, #0
 5b8:	0d0efb01 	vstreq	d15, [lr, #-4]
 5bc:	01010100 	mrseq	r0, (UNDEF: 17)
 5c0:	00000001 	andeq	r0, r0, r1
 5c4:	01000001 	tsteq	r0, r1
 5c8:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; 514 <CPSR_IRQ_INHIBIT+0x494>
 5cc:	62612f65 	rsbvs	r2, r1, #404	; 0x194
 5d0:	616b6964 	cmnvs	fp, r4, ror #18
 5d4:	2f6d6972 	svccs	0x006d6972
 5d8:	2f766564 	svccs	0x00766564
 5dc:	694c794d 	stmdbvs	ip, {r0, r2, r3, r6, r8, fp, ip, sp, lr}^
 5e0:	656c7474 	strbvs	r7, [ip, #-1140]!	; 0xfffffb8c
 5e4:	732f534f 			; <UNDEFINED> instruction: 0x732f534f
 5e8:	2f006372 	svccs	0x00006372
 5ec:	2f727375 	svccs	0x00727375
 5f0:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 5f4:	2f656475 	svccs	0x00656475
 5f8:	6c77656e 	cfldr64vs	mvdx6, [r7], #-440	; 0xfffffe48
 5fc:	6d2f6269 	sfmvs	f6, 4, [pc, #-420]!	; 460 <CPSR_IRQ_INHIBIT+0x3e0>
 600:	69686361 	stmdbvs	r8!, {r0, r5, r6, r8, r9, sp, lr}^
 604:	2f00656e 	svccs	0x0000656e
 608:	2f727375 	svccs	0x00727375
 60c:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 610:	2f656475 	svccs	0x00656475
 614:	6c77656e 	cfldr64vs	mvdx6, [r7], #-440	; 0xfffffe48
 618:	732f6269 			; <UNDEFINED> instruction: 0x732f6269
 61c:	2f007379 	svccs	0x00007379
 620:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
 624:	6462612f 	strbtvs	r6, [r2], #-303	; 0xfffffed1
 628:	72616b69 	rsbvc	r6, r1, #107520	; 0x1a400
 62c:	642f6d69 	strtvs	r6, [pc], #-3433	; 634 <CPSR_IRQ_INHIBIT+0x5b4>
 630:	4d2f7665 	stcmi	6, cr7, [pc, #-404]!	; 4a4 <CPSR_IRQ_INHIBIT+0x424>
 634:	74694c79 	strbtvc	r4, [r9], #-3193	; 0xfffff387
 638:	4f656c74 	svcmi	0x00656c74
 63c:	72732f53 	rsbsvc	r2, r3, #332	; 0x14c
 640:	2e2e2f63 	cdpcs	15, 2, cr2, cr14, cr3, {3}
 644:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 648:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0xfffffa94
 64c:	70720000 	rsbsvc	r0, r2, r0
 650:	61752d69 	cmnvs	r5, r9, ror #26
 654:	632e7472 			; <UNDEFINED> instruction: 0x632e7472
 658:	00000100 	andeq	r0, r0, r0, lsl #2
 65c:	6665645f 			; <UNDEFINED> instruction: 0x6665645f
 660:	746c7561 	strbtvc	r7, [ip], #-1377	; 0xfffffa9f
 664:	7079745f 	rsbsvc	r7, r9, pc, asr r4
 668:	682e7365 	stmdavs	lr!, {r0, r2, r5, r6, r8, r9, ip, sp, lr}
 66c:	00000200 	andeq	r0, r0, r0, lsl #4
 670:	6474735f 	ldrbtvs	r7, [r4], #-863	; 0xfffffca1
 674:	2e746e69 	cdpcs	14, 7, cr6, cr4, cr9, {3}
 678:	00030068 	andeq	r0, r3, r8, rrx
 67c:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
 680:	7361622d 	cmnvc	r1, #-805306366	; 0xd0000002
 684:	00682e65 	rsbeq	r2, r8, r5, ror #28
 688:	72000004 	andvc	r0, r0, #4
 68c:	752d6970 	strvc	r6, [sp, #-2416]!	; 0xfffff690
 690:	2e747261 	cdpcs	2, 7, cr7, cr4, cr1, {3}
 694:	00040068 	andeq	r0, r4, r8, rrx
 698:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
 69c:	6970672d 	ldmdbvs	r0!, {r0, r2, r3, r5, r8, r9, sl, sp, lr}^
 6a0:	00682e6f 	rsbeq	r2, r8, pc, ror #28
 6a4:	66000004 	strvs	r0, [r0], -r4
 6a8:	2e6f6669 	cdpcs	6, 6, cr6, cr15, cr9, {3}
 6ac:	00040068 	andeq	r0, r4, r8, rrx
 6b0:	05000000 	streq	r0, [r0, #-0]
 6b4:	0085b402 	addeq	fp, r5, r2, lsl #8
 6b8:	011a0300 	tsteq	sl, r0, lsl #6
 6bc:	4ba14b4b 	blmi	fe8533f0 <_heap+0xfe7d33ec>
 6c0:	4c69a14b 	stfmip	f2, [r9], #-300	; 0xfffffed4
 6c4:	838383d8 	orrhi	r8, r3, #216, 6	; 0x60000003
 6c8:	0f038483 	svceq	0x00038483
 6cc:	67686782 	strbvs	r6, [r8, -r2, lsl #15]!
 6d0:	03040200 	movweq	r0, #16896	; 0x4200
 6d4:	02006606 	andeq	r6, r0, #6291456	; 0x600000
 6d8:	06660104 	strbteq	r0, [r6], -r4, lsl #2
 6dc:	02006767 	andeq	r6, r0, #27000832	; 0x19c0000
 6e0:	66060304 	strvs	r0, [r6], -r4, lsl #6
 6e4:	01040200 	mrseq	r0, R12_usr
 6e8:	03670666 	cmneq	r7, #106954752	; 0x6600000
 6ec:	bd836609 	stclt	6, cr6, [r3, #36]	; 0x24
 6f0:	040200a0 	streq	r0, [r2], #-160	; 0xffffff60
 6f4:	062e0601 	strteq	r0, [lr], -r1, lsl #12
 6f8:	a1a183bd 			; <UNDEFINED> instruction: 0xa1a183bd
 6fc:	03040200 	movweq	r0, #16896	; 0x4200
 700:	04020067 	streq	r0, [r2], #-103	; 0xffffff99
 704:	0200b903 	andeq	fp, r0, #49152	; 0xc000
 708:	66060104 	strvs	r0, [r6], -r4, lsl #2
 70c:	692f8506 	stmdbvs	pc!, {r1, r2, r8, sl, pc}	; <UNPREDICTABLE>
 710:	86b83083 	ldrthi	r3, [r8], r3, lsl #1
 714:	859f9f6a 	ldrhi	r9, [pc, #3946]	; 1686 <CPSR_IRQ_INHIBIT+0x1606>
 718:	8385bc6b 	orrhi	fp, r5, #27392	; 0x6b00
 71c:	bfa268d9 	svclt	0x00a268d9
 720:	0a02d9bc 	beq	b6e18 <_heap+0x36e14>
 724:	9a010100 	bls	40b2c <__bss_end__+0x37d70>
 728:	02000001 	andeq	r0, r0, #1
 72c:	00015600 	andeq	r5, r1, r0, lsl #12
 730:	fb010200 	blx	40f3a <__bss_end__+0x3817e>
 734:	01000d0e 	tsteq	r0, lr, lsl #26
 738:	00010101 	andeq	r0, r1, r1, lsl #2
 73c:	00010000 	andeq	r0, r1, r0
 740:	682f0100 	stmdavs	pc!, {r8}	; <UNPREDICTABLE>
 744:	2f656d6f 	svccs	0x00656d6f
 748:	69646261 	stmdbvs	r4!, {r0, r5, r6, r9, sp, lr}^
 74c:	6972616b 	ldmdbvs	r2!, {r0, r1, r3, r5, r6, r8, sp, lr}^
 750:	65642f6d 	strbvs	r2, [r4, #-3949]!	; 0xfffff093
 754:	794d2f76 	stmdbvc	sp, {r1, r2, r4, r5, r6, r8, r9, sl, fp, sp}^
 758:	7474694c 	ldrbtvc	r6, [r4], #-2380	; 0xfffff6b4
 75c:	534f656c 	movtpl	r6, #62828	; 0xf56c
 760:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 764:	73752f00 	cmnvc	r5, #0, 30
 768:	6e692f72 	mcrvs	15, 3, r2, cr9, cr2, {3}
 76c:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xfffff39d
 770:	656e2f65 	strbvs	r2, [lr, #-3941]!	; 0xfffff09b
 774:	62696c77 	rsbvs	r6, r9, #30464	; 0x7700
 778:	63616d2f 	cmnvs	r1, #3008	; 0xbc0
 77c:	656e6968 	strbvs	r6, [lr, #-2408]!	; 0xfffff698
 780:	73752f00 	cmnvc	r5, #0, 30
 784:	6e692f72 	mcrvs	15, 3, r2, cr9, cr2, {3}
 788:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xfffff39d
 78c:	656e2f65 	strbvs	r2, [lr, #-3941]!	; 0xfffff09b
 790:	62696c77 	rsbvs	r6, r9, #30464	; 0x7700
 794:	7379732f 	cmnvc	r9, #-1140850688	; 0xbc000000
 798:	73752f00 	cmnvc	r5, #0, 30
 79c:	696c2f72 	stmdbvs	ip!, {r1, r4, r5, r6, r8, r9, sl, fp, sp}^
 7a0:	63672f62 	cmnvs	r7, #392	; 0x188
 7a4:	72612f63 	rsbvc	r2, r1, #396	; 0x18c
 7a8:	6f6e2d6d 	svcvs	0x006e2d6d
 7ac:	652d656e 	strvs	r6, [sp, #-1390]!	; 0xfffffa92
 7b0:	2f696261 	svccs	0x00696261
 7b4:	2e332e36 	mrccs	14, 1, r2, cr3, cr6, {1}
 7b8:	6e692f31 	mcrvs	15, 3, r2, cr9, cr1, {1}
 7bc:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xfffff39d
 7c0:	752f0065 	strvc	r0, [pc, #-101]!	; 763 <CPSR_IRQ_INHIBIT+0x6e3>
 7c4:	692f7273 	stmdbvs	pc!, {r0, r1, r4, r5, r6, r9, ip, sp, lr}	; <UNPREDICTABLE>
 7c8:	756c636e 	strbvc	r6, [ip, #-878]!	; 0xfffffc92
 7cc:	6e2f6564 	cfsh64vs	mvdx6, mvdx15, #52
 7d0:	696c7765 	stmdbvs	ip!, {r0, r2, r5, r6, r8, r9, sl, ip, sp, lr}^
 7d4:	682f0062 	stmdavs	pc!, {r1, r5, r6}	; <UNPREDICTABLE>
 7d8:	2f656d6f 	svccs	0x00656d6f
 7dc:	69646261 	stmdbvs	r4!, {r0, r5, r6, r9, sp, lr}^
 7e0:	6972616b 	ldmdbvs	r2!, {r0, r1, r3, r5, r6, r8, sp, lr}^
 7e4:	65642f6d 	strbvs	r2, [r4, #-3949]!	; 0xfffff093
 7e8:	794d2f76 	stmdbvc	sp, {r1, r2, r4, r5, r6, r8, r9, sl, fp, sp}^
 7ec:	7474694c 	ldrbtvc	r6, [r4], #-2380	; 0xfffff6b4
 7f0:	534f656c 	movtpl	r6, #62828	; 0xf56c
 7f4:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 7f8:	2f2e2e2f 	svccs	0x002e2e2f
 7fc:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 800:	00656475 	rsbeq	r6, r5, r5, ror r4
 804:	65687300 	strbvs	r7, [r8, #-768]!	; 0xfffffd00
 808:	632e6c6c 			; <UNDEFINED> instruction: 0x632e6c6c
 80c:	00000100 	andeq	r0, r0, r0, lsl #2
 810:	6665645f 			; <UNDEFINED> instruction: 0x6665645f
 814:	746c7561 	strbtvc	r7, [ip], #-1377	; 0xfffffa9f
 818:	7079745f 	rsbsvc	r7, r9, pc, asr r4
 81c:	682e7365 	stmdavs	lr!, {r0, r2, r5, r6, r8, r9, ip, sp, lr}
 820:	00000200 	andeq	r0, r0, r0, lsl #4
 824:	6b636f6c 	blvs	18dc5dc <_heap+0x185c5d8>
 828:	0300682e 	movweq	r6, #2094	; 0x82e
 82c:	745f0000 	ldrbvc	r0, [pc], #-0	; 834 <CPSR_IRQ_INHIBIT+0x7b4>
 830:	73657079 	cmnvc	r5, #121	; 0x79
 834:	0300682e 	movweq	r6, #2094	; 0x82e
 838:	74730000 	ldrbtvc	r0, [r3], #-0
 83c:	66656464 	strbtvs	r6, [r5], -r4, ror #8
 840:	0400682e 	streq	r6, [r0], #-2094	; 0xfffff7d2
 844:	65720000 	ldrbvs	r0, [r2, #-0]!
 848:	2e746e65 	cdpcs	14, 7, cr6, cr4, cr5, {3}
 84c:	00030068 	andeq	r0, r3, r8, rrx
 850:	74735f00 	ldrbtvc	r5, [r3], #-3840	; 0xfffff100
 854:	746e6964 	strbtvc	r6, [lr], #-2404	; 0xfffff69c
 858:	0300682e 	movweq	r6, #2094	; 0x82e
 85c:	74730000 	ldrbtvc	r0, [r3], #-0
 860:	62696c64 	rsbvs	r6, r9, #100, 24	; 0x6400
 864:	0500682e 	streq	r6, [r0, #-2094]	; 0xfffff7d2
 868:	70720000 	rsbsvc	r0, r2, r0
 86c:	61622d69 	cmnvs	r2, r9, ror #26
 870:	682e6573 	stmdavs	lr!, {r0, r1, r4, r5, r6, r8, sl, sp, lr}
 874:	00000600 	andeq	r0, r0, r0, lsl #12
 878:	2d697072 	stclcs	0, cr7, [r9, #-456]!	; 0xfffffe38
 87c:	74726175 	ldrbtvc	r6, [r2], #-373	; 0xfffffe8b
 880:	0600682e 	streq	r6, [r0], -lr, lsr #16
 884:	00000000 	andeq	r0, r0, r0
 888:	89500205 	ldmdbhi	r0, {r0, r2, r9}^
 88c:	09030000 	stmdbeq	r3, {}	; <UNPREDICTABLE>
 890:	4f4f6b01 	svcmi	0x004f6b01
 894:	0200684d 	andeq	r6, r0, #5046272	; 0x4d0000
 898:	2e060104 	adfcss	f0, f6, f4
 89c:	02040200 	andeq	r0, r4, #0, 4
 8a0:	0200a006 	andeq	sl, r0, #6
 8a4:	00a10204 	adceq	r0, r1, r4, lsl #4
 8a8:	a0020402 	andge	r0, r2, r2, lsl #8
 8ac:	02040200 	andeq	r0, r4, #0, 4
 8b0:	00667703 	rsbeq	r7, r6, r3, lsl #14
 8b4:	06010402 	streq	r0, [r1], -r2, lsl #8
 8b8:	0c030666 	stceq	6, cr0, [r3], {102}	; 0x66
 8bc:	4a710366 	bmi	1c4165c <_heap+0x1bc1658>
 8c0:	01000602 	tsteq	r0, r2, lsl #12
 8c4:	0000c301 	andeq	ip, r0, r1, lsl #6
 8c8:	9b000200 	blls	10d0 <CPSR_IRQ_INHIBIT+0x1050>
 8cc:	02000000 	andeq	r0, r0, #0
 8d0:	0d0efb01 	vstreq	d15, [lr, #-4]
 8d4:	01010100 	mrseq	r0, (UNDEF: 17)
 8d8:	00000001 	andeq	r0, r0, r1
 8dc:	01000001 	tsteq	r0, r1
 8e0:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; 82c <CPSR_IRQ_INHIBIT+0x7ac>
 8e4:	62612f65 	rsbvs	r2, r1, #404	; 0x194
 8e8:	616b6964 	cmnvs	fp, r4, ror #18
 8ec:	2f6d6972 	svccs	0x006d6972
 8f0:	2f766564 	svccs	0x00766564
 8f4:	694c794d 	stmdbvs	ip, {r0, r2, r3, r6, r8, fp, ip, sp, lr}^
 8f8:	656c7474 	strbvs	r7, [ip, #-1140]!	; 0xfffffb8c
 8fc:	732f534f 			; <UNDEFINED> instruction: 0x732f534f
 900:	2f006372 	svccs	0x00006372
 904:	2f727375 	svccs	0x00727375
 908:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 90c:	2f656475 	svccs	0x00656475
 910:	6c77656e 	cfldr64vs	mvdx6, [r7], #-440	; 0xfffffe48
 914:	6d2f6269 	sfmvs	f6, 4, [pc, #-420]!	; 778 <CPSR_IRQ_INHIBIT+0x6f8>
 918:	69686361 	stmdbvs	r8!, {r0, r5, r6, r8, r9, sp, lr}^
 91c:	2f00656e 	svccs	0x0000656e
 920:	2f727375 	svccs	0x00727375
 924:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 928:	2f656475 	svccs	0x00656475
 92c:	6c77656e 	cfldr64vs	mvdx6, [r7], #-440	; 0xfffffe48
 930:	732f6269 			; <UNDEFINED> instruction: 0x732f6269
 934:	00007379 	andeq	r7, r0, r9, ror r3
 938:	74726175 	ldrbtvc	r6, [r2], #-373	; 0xfffffe8b
 93c:	6e72654b 	cdpvs	5, 7, cr6, cr2, cr11, {2}
 940:	632e6c65 			; <UNDEFINED> instruction: 0x632e6c65
 944:	00000100 	andeq	r0, r0, r0, lsl #2
 948:	6665645f 			; <UNDEFINED> instruction: 0x6665645f
 94c:	746c7561 	strbtvc	r7, [ip], #-1377	; 0xfffffa9f
 950:	7079745f 	rsbsvc	r7, r9, pc, asr r4
 954:	682e7365 	stmdavs	lr!, {r0, r2, r5, r6, r8, r9, ip, sp, lr}
 958:	00000200 	andeq	r0, r0, r0, lsl #4
 95c:	6474735f 	ldrbtvs	r7, [r4], #-863	; 0xfffffca1
 960:	2e746e69 	cdpcs	14, 7, cr6, cr4, cr9, {3}
 964:	00030068 	andeq	r0, r3, r8, rrx
 968:	05000000 	streq	r0, [r0, #-0]
 96c:	0089f802 	addeq	pc, r9, r2, lsl #16
 970:	010e0300 	mrseq	r0, ELR_hyp
 974:	8586a1be 	strhi	sl, [r6, #446]	; 0x1be
 978:	34858589 	strcc	r8, [r5], #1417	; 0x589
 97c:	4c83f330 	stcmi	3, cr15, [r3], {48}	; 0x30
 980:	02004c84 	andeq	r4, r0, #132, 24	; 0x8400
 984:	02880104 	addeq	r0, r8, #4, 2
 988:	0101000a 	tsteq	r1, sl
 98c:	000000d4 	ldrdeq	r0, [r0], -r4
 990:	00780002 	rsbseq	r0, r8, r2
 994:	01020000 	mrseq	r0, (UNDEF: 2)
 998:	000d0efb 	strdeq	r0, [sp], -fp
 99c:	01010101 	tsteq	r1, r1, lsl #2
 9a0:	01000000 	mrseq	r0, (UNDEF: 0)
 9a4:	2f010000 	svccs	0x00010000
 9a8:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
 9ac:	6462612f 	strbtvs	r6, [r2], #-303	; 0xfffffed1
 9b0:	72616b69 	rsbvc	r6, r1, #107520	; 0x1a400
 9b4:	642f6d69 	strtvs	r6, [pc], #-3433	; 9bc <CPSR_IRQ_INHIBIT+0x93c>
 9b8:	4d2f7665 	stcmi	6, cr7, [pc, #-404]!	; 82c <CPSR_IRQ_INHIBIT+0x7ac>
 9bc:	74694c79 	strbtvc	r4, [r9], #-3193	; 0xfffff387
 9c0:	4f656c74 	svcmi	0x00656c74
 9c4:	696c2f53 	stmdbvs	ip!, {r0, r1, r4, r6, r8, r9, sl, fp, sp}^
 9c8:	682f0062 	stmdavs	pc!, {r1, r5, r6}	; <UNPREDICTABLE>
 9cc:	2f656d6f 	svccs	0x00656d6f
 9d0:	69646261 	stmdbvs	r4!, {r0, r5, r6, r9, sp, lr}^
 9d4:	6972616b 	ldmdbvs	r2!, {r0, r1, r3, r5, r6, r8, sp, lr}^
 9d8:	65642f6d 	strbvs	r2, [r4, #-3949]!	; 0xfffff093
 9dc:	794d2f76 	stmdbvc	sp, {r1, r2, r4, r5, r6, r8, r9, sl, fp, sp}^
 9e0:	7474694c 	ldrbtvc	r6, [r4], #-2380	; 0xfffff6b4
 9e4:	534f656c 	movtpl	r6, #62828	; 0xf56c
 9e8:	62696c2f 	rsbvs	r6, r9, #12032	; 0x2f00
 9ec:	2f2e2e2f 	svccs	0x002e2e2f
 9f0:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 9f4:	00656475 	rsbeq	r6, r5, r5, ror r4
 9f8:	66696600 	strbtvs	r6, [r9], -r0, lsl #12
 9fc:	00632e6f 	rsbeq	r2, r3, pc, ror #28
 a00:	66000001 	strvs	r0, [r0], -r1
 a04:	2e6f6669 	cdpcs	6, 6, cr6, cr15, cr9, {3}
 a08:	00020068 	andeq	r0, r2, r8, rrx
 a0c:	05000000 	streq	r0, [r0, #-0]
 a10:	008af002 	addeq	pc, sl, r2
 a14:	010a0300 	mrseq	r0, (UNDEF: 58)
 a18:	67676783 	strbvs	r6, [r7, -r3, lsl #15]!
 a1c:	694cbd87 	stmdbvs	ip, {r0, r1, r2, r7, r8, sl, fp, ip, sp, pc}^
 a20:	bc9ff3bc 	ldclt	3, cr15, [pc], {188}	; 0xbc
 a24:	02008468 	andeq	r8, r0, #104, 8	; 0x68000000
 a28:	73030204 	movwvc	r0, #12804	; 0x3204
 a2c:	0402004a 	streq	r0, [r2], #-74	; 0xffffffb6
 a30:	06660601 	strbteq	r0, [r6], -r1, lsl #12
 a34:	2f821103 	svccs	0x00821103
 a38:	694cbd87 	stmdbvs	ip, {r0, r1, r2, r7, r8, sl, fp, ip, sp, pc}^
 a3c:	01040200 	mrseq	r0, R12_usr
 a40:	0200d606 	andeq	sp, r0, #6291456	; 0x600000
 a44:	06d60204 	ldrbeq	r0, [r6], r4, lsl #4
 a48:	9ff34c84 	svcls	0x00f34c84
 a4c:	040200bc 	streq	r0, [r2], #-188	; 0xffffff44
 a50:	66750302 	ldrbtvs	r0, [r5], -r2, lsl #6
 a54:	01040200 	mrseq	r0, R12_usr
 a58:	03066606 	movweq	r6, #26118	; 0x6606
 a5c:	022f8210 	eoreq	r8, pc, #16, 4
 a60:	01010008 	tsteq	r1, r8
 a64:	0000007b 	andeq	r0, r0, fp, ror r0
 a68:	00410002 	subeq	r0, r1, r2
 a6c:	01020000 	mrseq	r0, (UNDEF: 2)
 a70:	000d0efb 	strdeq	r0, [sp], -fp
 a74:	01010101 	tsteq	r1, r1, lsl #2
 a78:	01000000 	mrseq	r0, (UNDEF: 0)
 a7c:	2f010000 	svccs	0x00010000
 a80:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
 a84:	6462612f 	strbtvs	r6, [r2], #-303	; 0xfffffed1
 a88:	72616b69 	rsbvc	r6, r1, #107520	; 0x1a400
 a8c:	642f6d69 	strtvs	r6, [pc], #-3433	; a94 <CPSR_IRQ_INHIBIT+0xa14>
 a90:	4d2f7665 	stcmi	6, cr7, [pc, #-404]!	; 904 <CPSR_IRQ_INHIBIT+0x884>
 a94:	74694c79 	strbtvc	r4, [r9], #-3193	; 0xfffff387
 a98:	4f656c74 	svcmi	0x00656c74
 a9c:	72732f53 	rsbsvc	r2, r3, #332	; 0x14c
 aa0:	73000063 	movwvc	r0, #99	; 0x63
 aa4:	74726174 	ldrbtvc	r6, [r2], #-372	; 0xfffffe8c
 aa8:	0100732e 	tsteq	r0, lr, lsr #6
 aac:	00000000 	andeq	r0, r0, r0
 ab0:	80000205 	andhi	r0, r0, r5, lsl #4
 ab4:	1d030000 	stcne	0, cr0, [r3, #-0]
 ab8:	2f2f2f01 	svccs	0x002f2f01
 abc:	2f2f2f2f 	svccs	0x002f2f2f
 ac0:	20080e03 	andcs	r0, r8, r3, lsl #28
 ac4:	2f2f2f2f 	svccs	0x002f2f2f
 ac8:	2f2f322f 	svccs	0x002f322f
 acc:	032f2f34 			; <UNDEFINED> instruction: 0x032f2f34
 ad0:	03312e0a 	teqeq	r1, #10, 28	; 0xa0
 ad4:	312f2e0b 			; <UNDEFINED> instruction: 0x312f2e0b
 ad8:	2f2e0a03 	svccs	0x002e0a03
 adc:	0202302f 	andeq	r3, r2, #47	; 0x2f
 ae0:	Address 0x0000000000000ae0 is out of bounds.


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
  3c:	00000018 	andeq	r0, r0, r8, lsl r0
  40:	0000002c 	andeq	r0, r0, ip, lsr #32
  44:	00008100 	andeq	r8, r0, r0, lsl #2
  48:	00000024 	andeq	r0, r0, r4, lsr #32
  4c:	8b080e42 	blhi	20395c <_heap+0x183958>
  50:	42018e02 	andmi	r8, r1, #2, 28
  54:	00040b0c 	andeq	r0, r4, ip, lsl #22
  58:	00000018 	andeq	r0, r0, r8, lsl r0
  5c:	0000002c 	andeq	r0, r0, ip, lsr #32
  60:	00008124 	andeq	r8, r0, r4, lsr #2
  64:	00000038 	andeq	r0, r0, r8, lsr r0
  68:	8b080e42 	blhi	203978 <_heap+0x183974>
  6c:	42018e02 	andmi	r8, r1, #2, 28
  70:	00040b0c 	andeq	r0, r4, ip, lsl #22
  74:	0000000c 	andeq	r0, r0, ip
  78:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  7c:	7c020001 	stcvc	0, cr0, [r2], {1}
  80:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  84:	0000001c 	andeq	r0, r0, ip, lsl r0
  88:	00000074 	andeq	r0, r0, r4, ror r0
  8c:	0000815c 	andeq	r8, r0, ip, asr r1
  90:	00000024 	andeq	r0, r0, r4, lsr #32
  94:	8b040e42 	blhi	1039a4 <_heap+0x839a0>
  98:	0b0d4201 	bleq	3508a4 <_heap+0x2d08a0>
  9c:	420d0d48 	andmi	r0, sp, #72, 26	; 0x1200
  a0:	00000ecb 	andeq	r0, r0, fp, asr #29
  a4:	0000001c 	andeq	r0, r0, ip, lsl r0
  a8:	00000074 	andeq	r0, r0, r4, ror r0
  ac:	00008180 	andeq	r8, r0, r0, lsl #3
  b0:	00000018 	andeq	r0, r0, r8, lsl r0
  b4:	8b040e42 	blhi	1039c4 <_heap+0x839c0>
  b8:	0b0d4201 	bleq	3508c4 <_heap+0x2d08c0>
  bc:	420d0d44 	andmi	r0, sp, #68, 26	; 0x1100
  c0:	00000ecb 	andeq	r0, r0, fp, asr #29
  c4:	0000000c 	andeq	r0, r0, ip
  c8:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  cc:	7c020001 	stcvc	0, cr0, [r2], {1}
  d0:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  d4:	0000001c 	andeq	r0, r0, ip, lsl r0
  d8:	000000c4 	andeq	r0, r0, r4, asr #1
  dc:	00008198 	muleq	r0, r8, r1
  e0:	00000024 	andeq	r0, r0, r4, lsr #32
  e4:	8b040e42 	blhi	1039f4 <_heap+0x839f0>
  e8:	0b0d4201 	bleq	3508f4 <_heap+0x2d08f0>
  ec:	420d0d48 	andmi	r0, sp, #72, 26	; 0x1200
  f0:	00000ecb 	andeq	r0, r0, fp, asr #29
  f4:	0000001c 	andeq	r0, r0, ip, lsl r0
  f8:	000000c4 	andeq	r0, r0, r4, asr #1
  fc:	000081bc 			; <UNDEFINED> instruction: 0x000081bc
 100:	0000011c 	andeq	r0, r0, ip, lsl r1
 104:	8b040e42 	blhi	103a14 <_heap+0x83a10>
 108:	0b0d4201 	bleq	350914 <_heap+0x2d0910>
 10c:	0d0d8202 	sfmeq	f0, 1, [sp, #-8]
 110:	000ecb42 	andeq	ip, lr, r2, asr #22
 114:	0000001c 	andeq	r0, r0, ip, lsl r0
 118:	000000c4 	andeq	r0, r0, r4, asr #1
 11c:	000082d8 	ldrdeq	r8, [r0], -r8	; <UNPREDICTABLE>
 120:	00000018 	andeq	r0, r0, r8, lsl r0
 124:	8b040e42 	blhi	103a34 <_heap+0x83a30>
 128:	0b0d4201 	bleq	350934 <_heap+0x2d0930>
 12c:	420d0d44 	andmi	r0, sp, #68, 26	; 0x1100
 130:	00000ecb 	andeq	r0, r0, fp, asr #29
 134:	0000000c 	andeq	r0, r0, ip
 138:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 13c:	7c020001 	stcvc	0, cr0, [r2], {1}
 140:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 144:	0000001c 	andeq	r0, r0, ip, lsl r0
 148:	00000134 	andeq	r0, r0, r4, lsr r1
 14c:	000082f0 	strdeq	r8, [r0], -r0
 150:	00000024 	andeq	r0, r0, r4, lsr #32
 154:	8b040e42 	blhi	103a64 <_heap+0x83a60>
 158:	0b0d4201 	bleq	350964 <_heap+0x2d0960>
 15c:	420d0d48 	andmi	r0, sp, #72, 26	; 0x1200
 160:	00000ecb 	andeq	r0, r0, fp, asr #29
 164:	00000024 	andeq	r0, r0, r4, lsr #32
 168:	00000134 	andeq	r0, r0, r4, lsr r1
 16c:	00008314 	andeq	r8, r0, r4, lsl r3
 170:	00000038 	andeq	r0, r0, r8, lsr r0
 174:	801c0e44 	andshi	r0, ip, r4, asr #28
 178:	82068107 	andhi	r8, r6, #-1073741823	; 0xc0000001
 17c:	8b048305 	blhi	120d98 <_heap+0xa0d94>
 180:	8e028c03 	cdphi	12, 0, cr8, cr2, cr3, {0}
 184:	0b0c4201 	bleq	310990 <_heap+0x29098c>
 188:	00000004 	andeq	r0, r0, r4
 18c:	00000024 	andeq	r0, r0, r4, lsr #32
 190:	00000134 	andeq	r0, r0, r4, lsr r1
 194:	0000834c 	andeq	r8, r0, ip, asr #6
 198:	00000034 	andeq	r0, r0, r4, lsr r0
 19c:	801c0e42 	andshi	r0, ip, r2, asr #28
 1a0:	82068107 	andhi	r8, r6, #-1073741823	; 0xc0000001
 1a4:	8b048305 	blhi	120dc0 <_heap+0xa0dbc>
 1a8:	8e028c03 	cdphi	12, 0, cr8, cr2, cr3, {0}
 1ac:	0b0c4201 	bleq	3109b8 <_heap+0x2909b4>
 1b0:	00000004 	andeq	r0, r0, r4
 1b4:	00000024 	andeq	r0, r0, r4, lsr #32
 1b8:	00000134 	andeq	r0, r0, r4, lsr r1
 1bc:	00008380 	andeq	r8, r0, r0, lsl #7
 1c0:	00000034 	andeq	r0, r0, r4, lsr r0
 1c4:	801c0e42 	andshi	r0, ip, r2, asr #28
 1c8:	82068107 	andhi	r8, r6, #-1073741823	; 0xc0000001
 1cc:	8b048305 	blhi	120de8 <_heap+0xa0de4>
 1d0:	8e028c03 	cdphi	12, 0, cr8, cr2, cr3, {0}
 1d4:	0b0c4201 	bleq	3109e0 <_heap+0x2909dc>
 1d8:	00000004 	andeq	r0, r0, r4
 1dc:	00000024 	andeq	r0, r0, r4, lsr #32
 1e0:	00000134 	andeq	r0, r0, r4, lsr r1
 1e4:	000083b4 			; <UNDEFINED> instruction: 0x000083b4
 1e8:	00000038 	andeq	r0, r0, r8, lsr r0
 1ec:	801c0e44 	andshi	r0, ip, r4, asr #28
 1f0:	82068107 	andhi	r8, r6, #-1073741823	; 0xc0000001
 1f4:	8b048305 	blhi	120e10 <_heap+0xa0e0c>
 1f8:	8e028c03 	cdphi	12, 0, cr8, cr2, cr3, {0}
 1fc:	0b0c4201 	bleq	310a08 <_heap+0x290a04>
 200:	00000004 	andeq	r0, r0, r4
 204:	00000024 	andeq	r0, r0, r4, lsr #32
 208:	00000134 	andeq	r0, r0, r4, lsr r1
 20c:	000083ec 	andeq	r8, r0, ip, ror #7
 210:	00000038 	andeq	r0, r0, r8, lsr r0
 214:	801c0e44 	andshi	r0, ip, r4, asr #28
 218:	82068107 	andhi	r8, r6, #-1073741823	; 0xc0000001
 21c:	8b048305 	blhi	120e38 <_heap+0xa0e34>
 220:	8e028c03 	cdphi	12, 0, cr8, cr2, cr3, {0}
 224:	0b0c4201 	bleq	310a30 <_heap+0x290a2c>
 228:	00000004 	andeq	r0, r0, r4
 22c:	00000028 	andeq	r0, r0, r8, lsr #32
 230:	00000134 	andeq	r0, r0, r4, lsr r1
 234:	00008424 	andeq	r8, r0, r4, lsr #8
 238:	00000104 	andeq	r0, r0, r4, lsl #2
 23c:	80200e44 	eorhi	r0, r0, r4, asr #28
 240:	82078108 	andhi	r8, r7, #8, 2
 244:	84058306 	strhi	r8, [r5], #-774	; 0xfffffcfa
 248:	8c038b04 			; <UNDEFINED> instruction: 0x8c038b04
 24c:	42018e02 	andmi	r8, r1, #2, 28
 250:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
 254:	200d0c74 	andcs	r0, sp, r4, ror ip
 258:	00000014 	andeq	r0, r0, r4, lsl r0
 25c:	00000134 	andeq	r0, r0, r4, lsr r1
 260:	00008528 	andeq	r8, r0, r8, lsr #10
 264:	00000010 	andeq	r0, r0, r0, lsl r0
 268:	040b0c42 	streq	r0, [fp], #-3138	; 0xfffff3be
 26c:	000d0c44 	andeq	r0, sp, r4, asr #24
 270:	0000000c 	andeq	r0, r0, ip
 274:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 278:	7c020001 	stcvc	0, cr0, [r2], {1}
 27c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 280:	0000001c 	andeq	r0, r0, ip, lsl r0
 284:	00000270 	andeq	r0, r0, r0, ror r2
 288:	00008538 	andeq	r8, r0, r8, lsr r5
 28c:	00000024 	andeq	r0, r0, r4, lsr #32
 290:	8b040e42 	blhi	103ba0 <_heap+0x83b9c>
 294:	0b0d4201 	bleq	350aa0 <_heap+0x2d0a9c>
 298:	420d0d48 	andmi	r0, sp, #72, 26	; 0x1200
 29c:	00000ecb 	andeq	r0, r0, fp, asr #29
 2a0:	0000001c 	andeq	r0, r0, ip, lsl r0
 2a4:	00000270 	andeq	r0, r0, r0, ror r2
 2a8:	0000855c 	andeq	r8, r0, ip, asr r5
 2ac:	00000058 	andeq	r0, r0, r8, asr r0
 2b0:	8b040e42 	blhi	103bc0 <_heap+0x83bbc>
 2b4:	0b0d4201 	bleq	350ac0 <_heap+0x2d0abc>
 2b8:	420d0d62 	andmi	r0, sp, #6272	; 0x1880
 2bc:	00000ecb 	andeq	r0, r0, fp, asr #29
 2c0:	0000000c 	andeq	r0, r0, ip
 2c4:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 2c8:	7c020001 	stcvc	0, cr0, [r2], {1}
 2cc:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 2d0:	0000001c 	andeq	r0, r0, ip, lsl r0
 2d4:	000002c0 	andeq	r0, r0, r0, asr #5
 2d8:	000085b4 			; <UNDEFINED> instruction: 0x000085b4
 2dc:	00000024 	andeq	r0, r0, r4, lsr #32
 2e0:	8b040e42 	blhi	103bf0 <_heap+0x83bec>
 2e4:	0b0d4201 	bleq	350af0 <_heap+0x2d0aec>
 2e8:	420d0d48 	andmi	r0, sp, #72, 26	; 0x1200
 2ec:	00000ecb 	andeq	r0, r0, fp, asr #29
 2f0:	0000001c 	andeq	r0, r0, ip, lsl r0
 2f4:	000002c0 	andeq	r0, r0, r0, asr #5
 2f8:	000085d8 	ldrdeq	r8, [r0], -r8	; <UNPREDICTABLE>
 2fc:	00000024 	andeq	r0, r0, r4, lsr #32
 300:	8b040e42 	blhi	103c10 <_heap+0x83c0c>
 304:	0b0d4201 	bleq	350b10 <_heap+0x2d0b0c>
 308:	420d0d48 	andmi	r0, sp, #72, 26	; 0x1200
 30c:	00000ecb 	andeq	r0, r0, fp, asr #29
 310:	0000001c 	andeq	r0, r0, ip, lsl r0
 314:	000002c0 	andeq	r0, r0, r0, asr #5
 318:	000085fc 	strdeq	r8, [r0], -ip
 31c:	0000013c 	andeq	r0, r0, ip, lsr r1
 320:	8b080e42 	blhi	203c30 <_heap+0x183c2c>
 324:	42018e02 	andmi	r8, r1, #2, 28
 328:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
 32c:	080d0c92 	stmdaeq	sp, {r1, r4, r7, sl, fp}
 330:	0000001c 	andeq	r0, r0, ip, lsl r0
 334:	000002c0 	andeq	r0, r0, r0, asr #5
 338:	00008738 	andeq	r8, r0, r8, lsr r7
 33c:	00000054 	andeq	r0, r0, r4, asr r0
 340:	8b040e42 	blhi	103c50 <_heap+0x83c4c>
 344:	0b0d4201 	bleq	350b50 <_heap+0x2d0b4c>
 348:	420d0d60 	andmi	r0, sp, #96, 26	; 0x1800
 34c:	00000ecb 	andeq	r0, r0, fp, asr #29
 350:	0000001c 	andeq	r0, r0, ip, lsl r0
 354:	000002c0 	andeq	r0, r0, r0, asr #5
 358:	0000878c 	andeq	r8, r0, ip, lsl #15
 35c:	00000064 	andeq	r0, r0, r4, rrx
 360:	8b080e42 	blhi	203c70 <_heap+0x183c6c>
 364:	42018e02 	andmi	r8, r1, #2, 28
 368:	6c040b0c 			; <UNDEFINED> instruction: 0x6c040b0c
 36c:	00080d0c 	andeq	r0, r8, ip, lsl #26
 370:	0000001c 	andeq	r0, r0, ip, lsl r0
 374:	000002c0 	andeq	r0, r0, r0, asr #5
 378:	000087f0 	strdeq	r8, [r0], -r0
 37c:	00000048 	andeq	r0, r0, r8, asr #32
 380:	8b080e42 	blhi	203c90 <_heap+0x183c8c>
 384:	42018e02 	andmi	r8, r1, #2, 28
 388:	5e040b0c 	vmlapl.f64	d0, d4, d12
 38c:	00080d0c 	andeq	r0, r8, ip, lsl #26
 390:	0000001c 	andeq	r0, r0, ip, lsl r0
 394:	000002c0 	andeq	r0, r0, r0, asr #5
 398:	00008838 	andeq	r8, r0, r8, lsr r8
 39c:	00000038 	andeq	r0, r0, r8, lsr r0
 3a0:	8b080e42 	blhi	203cb0 <_heap+0x183cac>
 3a4:	42018e02 	andmi	r8, r1, #2, 28
 3a8:	54040b0c 	strpl	r0, [r4], #-2828	; 0xfffff4f4
 3ac:	00080d0c 	andeq	r0, r8, ip, lsl #26
 3b0:	0000001c 	andeq	r0, r0, ip, lsl r0
 3b4:	000002c0 	andeq	r0, r0, r0, asr #5
 3b8:	00008870 	andeq	r8, r0, r0, ror r8
 3bc:	000000e0 	andeq	r0, r0, r0, ror #1
 3c0:	8b080e42 	blhi	203cd0 <_heap+0x183ccc>
 3c4:	42018e02 	andmi	r8, r1, #2, 28
 3c8:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
 3cc:	080d0c66 	stmdaeq	sp, {r1, r2, r5, r6, sl, fp}
 3d0:	0000000c 	andeq	r0, r0, ip
 3d4:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 3d8:	7c020001 	stcvc	0, cr0, [r2], {1}
 3dc:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 3e0:	00000018 	andeq	r0, r0, r8, lsl r0
 3e4:	000003d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
 3e8:	00008950 	andeq	r8, r0, r0, asr r9
 3ec:	000000a8 	andeq	r0, r0, r8, lsr #1
 3f0:	8b080e42 	blhi	203d00 <_heap+0x183cfc>
 3f4:	42018e02 	andmi	r8, r1, #2, 28
 3f8:	00040b0c 	andeq	r0, r4, ip, lsl #22
 3fc:	0000000c 	andeq	r0, r0, ip
 400:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 404:	7c020001 	stcvc	0, cr0, [r2], {1}
 408:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 40c:	00000018 	andeq	r0, r0, r8, lsl r0
 410:	000003fc 	strdeq	r0, [r0], -ip
 414:	000089f8 	strdeq	r8, [r0], -r8	; <UNPREDICTABLE>
 418:	000000f8 	strdeq	r0, [r0], -r8
 41c:	8b080e42 	blhi	203d2c <_heap+0x183d28>
 420:	42018e02 	andmi	r8, r1, #2, 28
 424:	00040b0c 	andeq	r0, r4, ip, lsl #22
 428:	0000000c 	andeq	r0, r0, ip
 42c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 430:	7c020001 	stcvc	0, cr0, [r2], {1}
 434:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 438:	0000001c 	andeq	r0, r0, ip, lsl r0
 43c:	00000428 	andeq	r0, r0, r8, lsr #8
 440:	00008af0 	strdeq	r8, [r0], -r0
 444:	00000044 	andeq	r0, r0, r4, asr #32
 448:	8b040e42 	blhi	103d58 <_heap+0x83d54>
 44c:	0b0d4201 	bleq	350c58 <_heap+0x2d0c54>
 450:	420d0d5a 	andmi	r0, sp, #5760	; 0x1680
 454:	00000ecb 	andeq	r0, r0, fp, asr #29
 458:	0000001c 	andeq	r0, r0, ip, lsl r0
 45c:	00000428 	andeq	r0, r0, r8, lsr #8
 460:	00008b34 	andeq	r8, r0, r4, lsr fp
 464:	000000e4 	andeq	r0, r0, r4, ror #1
 468:	8b040e42 	blhi	103d78 <_heap+0x83d74>
 46c:	0b0d4201 	bleq	350c78 <_heap+0x2d0c74>
 470:	0d0d6a02 	vstreq	s12, [sp, #-8]
 474:	000ecb42 	andeq	ip, lr, r2, asr #22
 478:	0000001c 	andeq	r0, r0, ip, lsl r0
 47c:	00000428 	andeq	r0, r0, r8, lsr #8
 480:	00008c18 	andeq	r8, r0, r8, lsl ip
 484:	00000104 	andeq	r0, r0, r4, lsl #2
 488:	8b040e42 	blhi	103d98 <_heap+0x83d94>
 48c:	0b0d4201 	bleq	350c98 <_heap+0x2d0c94>
 490:	0d0d7a02 	vstreq	s14, [sp, #-8]
 494:	000ecb42 	andeq	ip, lr, r2, asr #22

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
      b4:	6863005f 	stmdavs	r3!, {r0, r1, r2, r3, r4, r6}^
      b8:	63617261 	cmnvs	r1, #268435462	; 0x10000006
      bc:	00726574 	rsbseq	r6, r2, r4, ror r5
      c0:	69736e75 	ldmdbvs	r3!, {r0, r2, r4, r5, r6, r9, sl, fp, sp, lr}^
      c4:	64656e67 	strbtvs	r6, [r5], #-3687	; 0xfffff199
      c8:	61686320 	cmnvs	r8, r0, lsr #6
      cc:	68730072 	ldmdavs	r3!, {r1, r4, r5, r6}^
      d0:	2074726f 	rsbscs	r7, r4, pc, ror #4
      d4:	69736e75 	ldmdbvs	r3!, {r0, r2, r4, r5, r6, r9, sl, fp, sp, lr}^
      d8:	64656e67 	strbtvs	r6, [r5], #-3687	; 0xfffff199
      dc:	746e6920 	strbtvc	r6, [lr], #-2336	; 0xfffff6e0
      e0:	755f5f00 	ldrbvc	r5, [pc, #-3840]	; fffff1e8 <_heap+0xfff7f1e4>
      e4:	33746e69 	cmncc	r4, #1680	; 0x690
      e8:	00745f32 	rsbseq	r5, r4, r2, lsr pc
      ec:	6d6d7564 	cfstr64vs	mvdx7, [sp, #-400]!	; 0xfffffe70
      f0:	00615f79 	rsbeq	r5, r1, r9, ror pc
      f4:	6d6d7564 	cfstr64vs	mvdx7, [sp, #-400]!	; 0xfffffe70
      f8:	00625f79 	rsbeq	r5, r2, r9, ror pc
      fc:	7263696d 	rsbvc	r6, r3, #1785856	; 0x1b4000
     100:	6365536f 	cmnvs	r5, #-1140850687	; 0xbc000001
     104:	73646e6f 	cmnvc	r4, #1776	; 0x6f0
     108:	6e6f6c00 	cdpvs	12, 6, cr6, cr15, cr0, {0}
     10c:	6f6c2067 	svcvs	0x006c2067
     110:	7520676e 	strvc	r6, [r0, #-1902]!	; 0xfffff892
     114:	6769736e 	strbvs	r7, [r9, -lr, ror #6]!
     118:	2064656e 	rsbcs	r6, r4, lr, ror #10
     11c:	00746e69 	rsbseq	r6, r4, r9, ror #28
     120:	676e6f6c 	strbvs	r6, [lr, -ip, ror #30]!
     124:	6e6f6c20 	cdpvs	12, 6, cr6, cr15, cr0, {1}
     128:	6e692067 	cdpvs	0, 6, cr2, cr9, cr7, {3}
     12c:	68730074 	ldmdavs	r3!, {r2, r4, r5, r6}^
     130:	2074726f 	rsbscs	r7, r4, pc, ror #4
     134:	00746e69 	rsbseq	r6, r4, r9, ror #28
     138:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; 84 <CPSR_IRQ_INHIBIT+0x4>
     13c:	62612f65 	rsbvs	r2, r1, #404	; 0x194
     140:	616b6964 	cmnvs	fp, r4, ror #18
     144:	2f6d6972 	svccs	0x006d6972
     148:	2f766564 	svccs	0x00766564
     14c:	694c794d 	stmdbvs	ip, {r0, r2, r3, r6, r8, fp, ip, sp, lr}^
     150:	656c7474 	strbvs	r7, [ip, #-1140]!	; 0xfffffb8c
     154:	732f534f 			; <UNDEFINED> instruction: 0x732f534f
     158:	642f6372 	strtvs	r6, [pc], #-882	; 160 <CPSR_IRQ_INHIBIT+0xe0>
     15c:	796d6d75 	stmdbvc	sp!, {r0, r2, r4, r5, r6, r8, sl, fp, sp, lr}^
     160:	4c00632e 	stcmi	3, cr6, [r0], {46}	; 0x2e
     164:	0064616f 	rsbeq	r6, r4, pc, ror #2
     168:	6f6c6552 	svcvs	0x006c6552
     16c:	52006461 	andpl	r6, r0, #1627389952	; 0x61000000
     170:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     174:	72417465 	subvc	r7, r1, #1694498816	; 0x65000000
     178:	6d69546d 	cfstrdvs	mvd5, [r9, #-436]!	; 0xfffffe4c
     17c:	2f007265 	svccs	0x00007265
     180:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
     184:	6462612f 	strbtvs	r6, [r2], #-303	; 0xfffffed1
     188:	72616b69 	rsbvc	r6, r1, #107520	; 0x1a400
     18c:	642f6d69 	strtvs	r6, [pc], #-3433	; 194 <CPSR_IRQ_INHIBIT+0x114>
     190:	4d2f7665 	stcmi	6, cr7, [pc, #-404]!	; 4 <CPSR_MODE_USER-0xc>
     194:	74694c79 	strbtvc	r4, [r9], #-3193	; 0xfffff387
     198:	4f656c74 	svcmi	0x00656c74
     19c:	72732f53 	rsbsvc	r2, r3, #332	; 0x14c
     1a0:	70722f63 	rsbsvc	r2, r2, r3, ror #30
     1a4:	72612d69 	rsbvc	r2, r1, #6720	; 0x1a40
     1a8:	6d69746d 	cfstrdvs	mvd7, [r9, #-436]!	; 0xfffffe4c
     1ac:	632e7265 			; <UNDEFINED> instruction: 0x632e7265
     1b0:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
     1b4:	6d72615f 	ldfvse	f6, [r2, #-380]!	; 0xfffffe84
     1b8:	6d69745f 	cfstrdvs	mvd7, [r9, #-380]!	; 0xfffffe84
     1bc:	745f7265 	ldrbvc	r7, [pc], #-613	; 1c4 <CPSR_IRQ_INHIBIT+0x144>
     1c0:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
     1c4:	546d7241 	strbtpl	r7, [sp], #-577	; 0xfffffdbf
     1c8:	72656d69 	rsbvc	r6, r5, #6720	; 0x1a40
     1cc:	57415200 	strbpl	r5, [r1, -r0, lsl #4]
     1d0:	00515249 	subseq	r5, r1, r9, asr #4
     1d4:	6b73614d 	blvs	1cd8710 <_heap+0x1c5870c>
     1d8:	52496465 	subpl	r6, r9, #1694498816	; 0x65000000
     1dc:	61560051 	cmpvs	r6, r1, asr r0
     1e0:	0065756c 	rsbeq	r7, r5, ip, ror #10
     1e4:	44657250 	strbtmi	r7, [r5], #-592	; 0xfffffdb0
     1e8:	64697669 	strbtvs	r7, [r9], #-1641	; 0xfffff997
     1ec:	46007265 	strmi	r7, [r0], -r5, ror #4
     1f0:	52656572 	rsbpl	r6, r5, #478150656	; 0x1c800000
     1f4:	696e6e75 	stmdbvs	lr!, {r0, r2, r4, r5, r6, r9, sl, fp, sp, lr}^
     1f8:	6f43676e 	svcvs	0x0043676e
     1fc:	65746e75 	ldrbvs	r6, [r4, #-3701]!	; 0xfffff18b
     200:	6f430072 	svcvs	0x00430072
     204:	6f72746e 	svcvs	0x0072746e
     208:	5052006c 	subspl	r0, r2, ip, rrx
     20c:	72415f49 	subvc	r5, r1, #292	; 0x124
     210:	6d69546d 	cfstrdvs	mvd5, [r9, #-436]!	; 0xfffffe4c
     214:	6e497265 	cdpvs	2, 4, cr7, cr9, cr5, {3}
     218:	49007469 	stmdbmi	r0, {r0, r3, r5, r6, sl, ip, sp, lr}
     21c:	6c435152 	stfvse	f5, [r3], {82}	; 0x52
     220:	00726165 	rsbseq	r6, r2, r5, ror #2
     224:	45535047 	ldrbmi	r5, [r3, #-71]	; 0xffffffb9
     228:	47003054 	smlsdmi	r0, r4, r0, r3
     22c:	54455350 	strbpl	r5, [r5], #-848	; 0xfffffcb0
     230:	50470031 	subpl	r0, r7, r1, lsr r0
     234:	4c455346 	mcrrmi	3, 4, r5, r5, cr6
     238:	50470030 	subpl	r0, r7, r0, lsr r0
     23c:	4c455346 	mcrrmi	3, 4, r5, r5, cr6
     240:	50470031 	subpl	r0, r7, r1, lsr r0
     244:	4c455346 	mcrrmi	3, 4, r5, r5, cr6
     248:	50470032 	subpl	r0, r7, r2, lsr r0
     24c:	4c455346 	mcrrmi	3, 4, r5, r5, cr6
     250:	50470033 	subpl	r0, r7, r3, lsr r0
     254:	4c455346 	mcrrmi	3, 4, r5, r5, cr6
     258:	50470034 	subpl	r0, r7, r4, lsr r0
     25c:	4c455346 	mcrrmi	3, 4, r5, r5, cr6
     260:	50470035 	subpl	r0, r7, r5, lsr r0
     264:	314e4546 	cmpcc	lr, r6, asr #10
     268:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
     26c:	6f697047 	svcvs	0x00697047
     270:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     274:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     278:	0030344f 	eorseq	r3, r0, pc, asr #8
     27c:	5f495052 	svcpl	0x00495052
     280:	4f495047 	svcmi	0x00495047
     284:	52003234 	andpl	r3, r0, #52, 4	; 0x40000003
     288:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     28c:	344f4950 	strbcc	r4, [pc], #-2384	; 294 <CPSR_IRQ_INHIBIT+0x214>
     290:	50520033 	subspl	r0, r2, r3, lsr r0
     294:	50475f49 	subpl	r5, r7, r9, asr #30
     298:	34344f49 	ldrtcc	r4, [r4], #-3913	; 0xfffff0b7
     29c:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     2a0:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     2a4:	0035344f 	eorseq	r3, r5, pc, asr #8
     2a8:	5f495052 	svcpl	0x00495052
     2ac:	4f495047 	svcmi	0x00495047
     2b0:	52003634 	andpl	r3, r0, #52, 12	; 0x3400000
     2b4:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     2b8:	344f4950 	strbcc	r4, [pc], #-2384	; 2c0 <CPSR_IRQ_INHIBIT+0x240>
     2bc:	50520037 	subspl	r0, r2, r7, lsr r0
     2c0:	50475f49 	subpl	r5, r7, r9, asr #30
     2c4:	38344f49 	ldmdacc	r4!, {r0, r3, r6, r8, r9, sl, fp, lr}
     2c8:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     2cc:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     2d0:	0039344f 	eorseq	r3, r9, pc, asr #8
     2d4:	5f495052 	svcpl	0x00495052
     2d8:	6f697047 	svcvs	0x00697047
     2dc:	74696e49 	strbtvc	r6, [r9], #-3657	; 0xfffff1b7
     2e0:	52504700 	subspl	r4, r0, #0, 14
     2e4:	00304e45 	eorseq	r4, r0, r5, asr #28
     2e8:	45525047 	ldrbmi	r5, [r2, #-71]	; 0xffffffb9
     2ec:	4700314e 	strmi	r3, [r0, -lr, asr #2]
     2f0:	4e454850 	mcrmi	8, 2, r4, cr5, cr0, {2}
     2f4:	50520030 	subspl	r0, r2, r0, lsr r0
     2f8:	50475f49 	subpl	r5, r7, r9, asr #30
     2fc:	30324f49 	eorscc	r4, r2, r9, asr #30
     300:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     304:	7465535f 	strbtvc	r5, [r5], #-863	; 0xfffffca1
     308:	6f697047 	svcvs	0x00697047
     30c:	466e6950 			; <UNDEFINED> instruction: 0x466e6950
     310:	74636e75 	strbtvc	r6, [r3], #-3701	; 0xfffff18b
     314:	006e6f69 	rsbeq	r6, lr, r9, ror #30
     318:	65736552 	ldrbvs	r6, [r3, #-1362]!	; 0xfffffaae
     31c:	64657672 	strbtvs	r7, [r5], #-1650	; 0xfffff98e
     320:	65520030 	ldrbvs	r0, [r2, #-48]	; 0xffffffd0
     324:	76726573 			; <UNDEFINED> instruction: 0x76726573
     328:	00316465 	eorseq	r6, r1, r5, ror #8
     32c:	65736552 	ldrbvs	r6, [r3, #-1362]!	; 0xfffffaae
     330:	64657672 	strbtvs	r7, [r5], #-1650	; 0xfffff98e
     334:	65520032 	ldrbvs	r0, [r2, #-50]	; 0xffffffce
     338:	76726573 			; <UNDEFINED> instruction: 0x76726573
     33c:	00336465 	eorseq	r6, r3, r5, ror #8
     340:	65736552 	ldrbvs	r6, [r3, #-1362]!	; 0xfffffaae
     344:	64657672 	strbtvs	r7, [r5], #-1650	; 0xfffff98e
     348:	50470035 	subpl	r0, r7, r5, lsr r0
     34c:	30534445 	subscc	r4, r3, r5, asr #8
     350:	45504700 	ldrbmi	r4, [r0, #-1792]	; 0xfffff900
     354:	00315344 	eorseq	r5, r1, r4, asr #6
     358:	65736552 	ldrbvs	r6, [r3, #-1362]!	; 0xfffffaae
     35c:	64657672 	strbtvs	r7, [r5], #-1650	; 0xfffff98e
     360:	65520038 	ldrbvs	r0, [r2, #-56]	; 0xffffffc8
     364:	76726573 			; <UNDEFINED> instruction: 0x76726573
     368:	00396465 	eorseq	r6, r9, r5, ror #8
     36c:	5f495052 	svcpl	0x00495052
     370:	4f495047 	svcmi	0x00495047
     374:	52003134 	andpl	r3, r0, #52, 2
     378:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     37c:	314f4950 	cmpcc	pc, r0, asr r9	; <UNPREDICTABLE>
     380:	50520030 	subspl	r0, r2, r0, lsr r0
     384:	50475f49 	subpl	r5, r7, r9, asr #30
     388:	31314f49 	teqcc	r1, r9, asr #30
     38c:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     390:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     394:	0032314f 	eorseq	r3, r2, pc, asr #2
     398:	5f495052 	svcpl	0x00495052
     39c:	4f495047 	svcmi	0x00495047
     3a0:	52003331 	andpl	r3, r0, #-1006632960	; 0xc4000000
     3a4:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     3a8:	314f4950 	cmpcc	pc, r0, asr r9	; <UNPREDICTABLE>
     3ac:	50520034 	subspl	r0, r2, r4, lsr r0
     3b0:	50475f49 	subpl	r5, r7, r9, asr #30
     3b4:	35314f49 	ldrcc	r4, [r1, #-3913]!	; 0xfffff0b7
     3b8:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     3bc:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     3c0:	0036314f 	eorseq	r3, r6, pc, asr #2
     3c4:	5f495052 	svcpl	0x00495052
     3c8:	4f495047 	svcmi	0x00495047
     3cc:	52003731 	andpl	r3, r0, #12845056	; 0xc40000
     3d0:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     3d4:	314f4950 	cmpcc	pc, r0, asr r9	; <UNPREDICTABLE>
     3d8:	50520038 	subspl	r0, r2, r8, lsr r0
     3dc:	50475f49 	subpl	r5, r7, r9, asr #30
     3e0:	39314f49 	ldmdbcc	r1!, {r0, r3, r6, r8, r9, sl, fp, lr}
     3e4:	65736600 	ldrbvs	r6, [r3, #-1536]!	; 0xfffffa00
     3e8:	65725f6c 	ldrbvs	r5, [r2, #-3948]!	; 0xfffff094
     3ec:	50520067 	subspl	r0, r2, r7, rrx
     3f0:	50475f49 	subpl	r5, r7, r9, asr #30
     3f4:	30354f49 	eorscc	r4, r5, r9, asr #30
     3f8:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     3fc:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     400:	0031354f 	eorseq	r3, r1, pc, asr #10
     404:	5f495052 	svcpl	0x00495052
     408:	4f495047 	svcmi	0x00495047
     40c:	47003335 	smladxmi	r0, r5, r3, r3
     410:	44555050 	ldrbmi	r5, [r5], #-80	; 0xffffffb0
     414:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     418:	7465475f 	strbtvc	r4, [r5], #-1887	; 0xfffff8a1
     41c:	6f697047 	svcvs	0x00697047
     420:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
     424:	6970675f 	ldmdbvs	r0!, {r0, r1, r2, r3, r4, r6, r8, r9, sl, sp, lr}^
     428:	69705f6f 	ldmdbvs	r0!, {r0, r1, r2, r3, r5, r6, r8, r9, sl, fp, ip, lr}^
     42c:	00745f6e 	rsbseq	r5, r4, lr, ror #30
     430:	454c5047 	strbmi	r5, [ip, #-71]	; 0xffffffb9
     434:	4700304e 	strmi	r3, [r0, -lr, asr #32]
     438:	45464150 	strbmi	r4, [r6, #-336]	; 0xfffffeb0
     43c:	4700304e 	strmi	r3, [r0, -lr, asr #32]
     440:	45464150 	strbmi	r4, [r6, #-336]	; 0xfffffeb0
     444:	5200314e 	andpl	r3, r0, #-2147483629	; 0x80000013
     448:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     44c:	304f4950 	subcc	r4, pc, r0, asr r9	; <UNPREDICTABLE>
     450:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     454:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     458:	5200314f 	andpl	r3, r0, #-1073741805	; 0xc0000013
     45c:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     460:	324f4950 	subcc	r4, pc, #80, 18	; 0x140000
     464:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     468:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     46c:	5200344f 	andpl	r3, r0, #1325400064	; 0x4f000000
     470:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     474:	354f4950 	strbcc	r4, [pc, #-2384]	; fffffb2c <_heap+0xfff7fb28>
     478:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     47c:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     480:	4600364f 	strmi	r3, [r0], -pc, asr #12
     484:	554f5f53 	strbpl	r5, [pc, #-3923]	; fffff539 <_heap+0xfff7f535>
     488:	54555054 	ldrbpl	r5, [r5], #-84	; 0xffffffac
     48c:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     490:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     494:	5200384f 	andpl	r3, r0, #5177344	; 0x4f0000
     498:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     49c:	394f4950 	stmdbcc	pc, {r4, r6, r8, fp, lr}^	; <UNPREDICTABLE>
     4a0:	43504700 	cmpmi	r0, #0, 14
     4a4:	0031524c 	eorseq	r5, r1, ip, asr #4
     4a8:	5f697072 	svcpl	0x00697072
     4ac:	5f676572 	svcpl	0x00676572
     4b0:	745f6f72 	ldrbvc	r6, [pc], #-3954	; 4b8 <CPSR_IRQ_INHIBIT+0x438>
     4b4:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     4b8:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     4bc:	0031324f 	eorseq	r3, r1, pc, asr #4
     4c0:	5f495052 	svcpl	0x00495052
     4c4:	4f495047 	svcmi	0x00495047
     4c8:	52003232 	andpl	r3, r0, #536870915	; 0x20000003
     4cc:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     4d0:	324f4950 	subcc	r4, pc, #80, 18	; 0x140000
     4d4:	50520033 	subspl	r0, r2, r3, lsr r0
     4d8:	50475f49 	subpl	r5, r7, r9, asr #30
     4dc:	34324f49 	ldrtcc	r4, [r2], #-3913	; 0xfffff0b7
     4e0:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     4e4:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     4e8:	0035324f 	eorseq	r3, r5, pc, asr #4
     4ec:	5f495052 	svcpl	0x00495052
     4f0:	4f495047 	svcmi	0x00495047
     4f4:	52003632 	andpl	r3, r0, #52428800	; 0x3200000
     4f8:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     4fc:	324f4950 	subcc	r4, pc, #80, 18	; 0x140000
     500:	50520037 	subspl	r0, r2, r7, lsr r0
     504:	50475f49 	subpl	r5, r7, r9, asr #30
     508:	38324f49 	ldmdacc	r2!, {r0, r3, r6, r8, r9, sl, fp, lr}
     50c:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     510:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     514:	0039324f 	eorseq	r3, r9, pc, asr #4
     518:	65736552 	ldrbvs	r6, [r3, #-1362]!	; 0xfffffaae
     51c:	64657672 	strbtvs	r7, [r5], #-1650	; 0xfffff98e
     520:	47003131 	smladxmi	r0, r1, r1, r3
     524:	45524150 	ldrbmi	r4, [r2, #-336]	; 0xfffffeb0
     528:	4700304e 	strmi	r3, [r0, -lr, asr #32]
     52c:	4e454c50 	mcrmi	12, 2, r4, cr5, cr0, {2}
     530:	70720031 	rsbsvc	r0, r2, r1, lsr r0
     534:	65725f69 	ldrbvs	r5, [r2, #-3945]!	; 0xfffff097
     538:	77725f67 	ldrbvc	r5, [r2, -r7, ror #30]!
     53c:	4700745f 	smlsdmi	r0, pc, r4, r7	; <UNPREDICTABLE>
     540:	44555050 	ldrbmi	r5, [r5], #-80	; 0xffffffb0
     544:	304b4c43 	subcc	r4, fp, r3, asr #24
     548:	73655200 	cmnvc	r5, #0, 4
     54c:	65767265 	ldrbvs	r7, [r6, #-613]!	; 0xfffffd9b
     550:	00303164 	eorseq	r3, r0, r4, ror #2
     554:	52415047 	subpl	r5, r1, #71	; 0x47
     558:	00314e45 	eorseq	r4, r1, r5, asr #28
     55c:	5f697072 	svcpl	0x00697072
     560:	6f697067 	svcvs	0x00697067
     564:	746c615f 	strbtvc	r6, [ip], #-351	; 0xfffffea1
     568:	6e75665f 	mrcvs	6, 3, r6, cr5, cr15, {2}
     56c:	6f697463 	svcvs	0x00697463
     570:	00745f6e 	rsbseq	r5, r4, lr, ror #30
     574:	5f495052 	svcpl	0x00495052
     578:	4f495047 	svcmi	0x00495047
     57c:	53460037 	movtpl	r0, #24631	; 0x6037
     580:	504e495f 	subpl	r4, lr, pc, asr r9
     584:	47005455 	smlsdmi	r0, r5, r4, r5
     588:	44555050 	ldrbmi	r5, [r5], #-80	; 0xffffffb0
     58c:	314b4c43 	cmpcc	fp, r3, asr #24
     590:	6f682f00 	svcvs	0x00682f00
     594:	612f656d 			; <UNDEFINED> instruction: 0x612f656d
     598:	6b696462 	blvs	1a59728 <_heap+0x19d9724>
     59c:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
     5a0:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
     5a4:	4c794d2f 	ldclmi	13, cr4, [r9], #-188	; 0xffffff44
     5a8:	6c747469 	cfldrdvs	mvd7, [r4], #-420	; 0xfffffe5c
     5ac:	2f534f65 	svccs	0x00534f65
     5b0:	2f637273 	svccs	0x00637273
     5b4:	2d697072 	stclcs	0, cr7, [r9, #-456]!	; 0xfffffe38
     5b8:	6f697067 	svcvs	0x00697067
     5bc:	5200632e 	andpl	r6, r0, #-1207959552	; 0xb8000000
     5c0:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     5c4:	334f4950 	movtcc	r4, #63824	; 0xf950
     5c8:	50470033 	subpl	r0, r7, r3, lsr r0
     5cc:	3056454c 	subscc	r4, r6, ip, asr #10
     5d0:	4c504700 	mrrcmi	7, 0, r4, r0, cr0
     5d4:	00315645 	eorseq	r5, r1, r5, asr #12
     5d8:	65736552 	ldrbvs	r6, [r3, #-1362]!	; 0xfffffaae
     5dc:	64657672 	strbtvs	r7, [r5], #-1650	; 0xfffff98e
     5e0:	50520034 	subspl	r0, r2, r4, lsr r0
     5e4:	50475f49 	subpl	r5, r7, r9, asr #30
     5e8:	37334f49 	ldrcc	r4, [r3, -r9, asr #30]!
     5ec:	73655200 	cmnvc	r5, #0, 4
     5f0:	65767265 	ldrbvs	r7, [r6, #-613]!	; 0xfffffd9b
     5f4:	47003664 	strmi	r3, [r0, -r4, ror #12]
     5f8:	4e454850 	mcrmi	8, 2, r4, cr5, cr0, {2}
     5fc:	50520031 	subspl	r0, r2, r1, lsr r0
     600:	50475f49 	subpl	r5, r7, r9, asr #30
     604:	32354f49 	eorscc	r4, r5, #292	; 0x124
     608:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     60c:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     610:	0030334f 	eorseq	r3, r0, pc, asr #6
     614:	5f495052 	svcpl	0x00495052
     618:	4f495047 	svcmi	0x00495047
     61c:	52003133 	andpl	r3, r0, #-1073741812	; 0xc000000c
     620:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     624:	334f4950 	movtcc	r4, #63824	; 0xf950
     628:	50520032 	subspl	r0, r2, r2, lsr r0
     62c:	50475f49 	subpl	r5, r7, r9, asr #30
     630:	00334f49 	eorseq	r4, r3, r9, asr #30
     634:	5f495052 	svcpl	0x00495052
     638:	4f495047 	svcmi	0x00495047
     63c:	52003433 	andpl	r3, r0, #855638016	; 0x33000000
     640:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     644:	334f4950 	movtcc	r4, #63824	; 0xf950
     648:	50520035 	subspl	r0, r2, r5, lsr r0
     64c:	50475f49 	subpl	r5, r7, r9, asr #30
     650:	36334f49 	ldrtcc	r4, [r3], -r9, asr #30
     654:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
     658:	6765725f 			; <UNDEFINED> instruction: 0x6765725f
     65c:	5f6f775f 	svcpl	0x006f775f
     660:	50520074 	subspl	r0, r2, r4, ror r0
     664:	50475f49 	subpl	r5, r7, r9, asr #30
     668:	38334f49 	ldmdacc	r3!, {r0, r3, r6, r8, r9, sl, fp, lr}
     66c:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     670:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     674:	0039334f 	eorseq	r3, r9, pc, asr #6
     678:	65736552 	ldrbvs	r6, [r3, #-1362]!	; 0xfffffaae
     67c:	64657672 	strbtvs	r7, [r5], #-1650	; 0xfffff98e
     680:	73660037 	cmnvc	r6, #55	; 0x37
     684:	635f6c65 	cmpvs	pc, #25856	; 0x6500
     688:	0079706f 	rsbseq	r7, r9, pc, rrx
     68c:	6f697067 	svcvs	0x00697067
     690:	46504700 	ldrbmi	r4, [r0], -r0, lsl #14
     694:	00304e45 	eorseq	r4, r0, r5, asr #28
     698:	415f5346 	cmpmi	pc, r6, asr #6
     69c:	0030544c 	eorseq	r5, r0, ip, asr #8
     6a0:	415f5346 	cmpmi	pc, r6, asr #6
     6a4:	0031544c 	eorseq	r5, r1, ip, asr #8
     6a8:	415f5346 	cmpmi	pc, r6, asr #6
     6ac:	0032544c 	eorseq	r5, r2, ip, asr #8
     6b0:	415f5346 	cmpmi	pc, r6, asr #6
     6b4:	0033544c 	eorseq	r5, r3, ip, asr #8
     6b8:	415f5346 	cmpmi	pc, r6, asr #6
     6bc:	0034544c 	eorseq	r5, r4, ip, asr #8
     6c0:	415f5346 	cmpmi	pc, r6, asr #6
     6c4:	0035544c 	eorseq	r5, r5, ip, asr #8
     6c8:	5f697072 	svcpl	0x00697072
     6cc:	6f697067 	svcvs	0x00697067
     6d0:	4700745f 	smlsdmi	r0, pc, r4, r7	; <UNPREDICTABLE>
     6d4:	524c4350 	subpl	r4, ip, #80, 6	; 0x40000001
     6d8:	72700030 	rsbsvc	r0, r0, #48	; 0x30
     6dc:	74656665 	strbtvc	r6, [r5], #-1637	; 0xfffff99b
     6e0:	615f6863 	cmpvs	pc, r3, ror #16
     6e4:	74726f62 	ldrbtvc	r6, [r2], #-3938	; 0xfffff09e
     6e8:	6365765f 	cmnvs	r5, #99614720	; 0x5f00000
     6ec:	00726f74 	rsbseq	r6, r2, r4, ror pc
     6f0:	5f495052 	svcpl	0x00495052
     6f4:	49746547 	ldmdbmi	r4!, {r0, r1, r2, r6, r8, sl, sp, lr}^
     6f8:	6f437172 	svcvs	0x00437172
     6fc:	6f72746e 	svcvs	0x0072746e
     700:	72656c6c 	rsbvc	r6, r5, #108, 24	; 0x6c00
     704:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
     708:	7172695f 	cmnvc	r2, pc, asr r9
     70c:	6e6f635f 	mcrvs	3, 3, r6, cr15, cr15, {2}
     710:	6c6f7274 	sfmvs	f7, 2, [pc], #-464	; 548 <CPSR_IRQ_INHIBIT+0x4c8>
     714:	5f72656c 	svcpl	0x0072656c
     718:	70720074 	rsbsvc	r0, r2, r4, ror r0
     71c:	51524969 	cmppl	r2, r9, ror #18
     720:	746e6f43 	strbtvc	r6, [lr], #-3907	; 0xfffff0bd
     724:	6c6c6f72 	stclvs	15, cr6, [ip], #-456	; 0xfffffe38
     728:	44007265 	strmi	r7, [r0], #-613	; 0xfffffd9b
     72c:	62617369 	rsbvs	r7, r1, #-1543503871	; 0xa4000001
     730:	425f656c 	subsmi	r6, pc, #108, 10	; 0x1b000000
     734:	63697361 	cmnvs	r9, #-2080374783	; 0x84000001
     738:	5152495f 	cmppl	r2, pc, asr r9
     73c:	49460073 	stmdbmi	r6, {r0, r1, r4, r5, r6}^
     740:	6f635f51 	svcvs	0x00635f51
     744:	6f72746e 	svcvs	0x0072746e
     748:	5249006c 	subpl	r0, r9, #108	; 0x6c
     74c:	61625f51 	cmnvs	r2, r1, asr pc
     750:	5f636973 	svcpl	0x00636973
     754:	646e6570 	strbtvs	r6, [lr], #-1392	; 0xfffffa90
     758:	00676e69 	rsbeq	r6, r7, r9, ror #28
     75c:	69727473 	ldmdbvs	r2!, {r0, r1, r4, r5, r6, sl, ip, sp, lr}^
     760:	4500676e 	strmi	r6, [r0, #-1902]	; 0xfffff892
     764:	6c62616e 	stfvse	f6, [r2], #-440	; 0xfffffe48
     768:	61425f65 	cmpvs	r2, r5, ror #30
     76c:	5f636973 	svcpl	0x00636973
     770:	73515249 	cmpvc	r1, #-1879048188	; 0x90000004
     774:	616e4500 	cmnvs	lr, r0, lsl #10
     778:	5f656c62 	svcpl	0x00656c62
     77c:	73515249 	cmpvc	r1, #-1879048188	; 0x90000004
     780:	4500315f 	strmi	r3, [r0, #-351]	; 0xfffffea1
     784:	6c62616e 	stfvse	f6, [r2], #-440	; 0xfffffe48
     788:	52495f65 	subpl	r5, r9, #404	; 0x194
     78c:	325f7351 	subscc	r7, pc, #1140850689	; 0x44000001
     790:	6f682f00 	svcvs	0x00682f00
     794:	612f656d 			; <UNDEFINED> instruction: 0x612f656d
     798:	6b696462 	blvs	1a59928 <_heap+0x19d9924>
     79c:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
     7a0:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
     7a4:	4c794d2f 	ldclmi	13, cr4, [r9], #-188	; 0xffffff44
     7a8:	6c747469 	cfldrdvs	mvd7, [r4], #-420	; 0xfffffe5c
     7ac:	2f534f65 	svccs	0x00534f65
     7b0:	2f637273 	svccs	0x00637273
     7b4:	2d697072 	stclcs	0, cr7, [r9, #-456]!	; 0xfffffe38
     7b8:	65746e69 	ldrbvs	r6, [r4, #-3689]!	; 0xfffff197
     7bc:	70757272 	rsbsvc	r7, r5, r2, ror r2
     7c0:	632e7374 			; <UNDEFINED> instruction: 0x632e7374
     7c4:	74616400 	strbtvc	r6, [r1], #-1024	; 0xfffffc00
     7c8:	62615f61 	rsbvs	r5, r1, #388	; 0x184
     7cc:	5f74726f 	svcpl	0x0074726f
     7d0:	74636576 	strbtvc	r6, [r3], #-1398	; 0xfffffa8a
     7d4:	6d00726f 	sfmvs	f7, 4, [r0, #-444]	; 0xfffffe44
     7d8:	756f4373 	strbvc	r4, [pc, #-883]!	; 46d <CPSR_IRQ_INHIBIT+0x3ed>
     7dc:	7265746e 	rsbvc	r7, r5, #1845493760	; 0x6e000000
     7e0:	51524900 	cmppl	r2, r0, lsl #18
     7e4:	6e65705f 	mcrvs	0, 3, r7, cr5, cr15, {2}
     7e8:	676e6964 	strbvs	r6, [lr, -r4, ror #18]!
     7ec:	7500325f 	strvc	r3, [r0, #-607]	; 0xfffffda1
     7f0:	6665646e 	strbtvs	r6, [r5], -lr, ror #8
     7f4:	64656e69 	strbtvs	r6, [r5], #-3689	; 0xfffff197
     7f8:	736e695f 	cmnvc	lr, #1556480	; 0x17c000
     7fc:	63757274 	cmnvs	r5, #116, 4	; 0x40000007
     800:	6e6f6974 			; <UNDEFINED> instruction: 0x6e6f6974
     804:	6365765f 	cmnvs	r5, #99614720	; 0x5f00000
     808:	00726f74 	rsbseq	r6, r2, r4, ror pc
     80c:	65736572 	ldrbvs	r6, [r3, #-1394]!	; 0xfffffa8e
     810:	65765f74 	ldrbvs	r5, [r6, #-3956]!	; 0xfffff08c
     814:	726f7463 	rsbvc	r7, pc, #1660944384	; 0x63000000
     818:	666f7300 	strbtvs	r7, [pc], -r0, lsl #6
     81c:	72617774 	rsbvc	r7, r1, #116, 14	; 0x1d00000
     820:	6e695f65 	cdpvs	15, 6, cr5, cr9, cr5, {3}
     824:	72726574 	rsbsvc	r6, r2, #116, 10	; 0x1d000000
     828:	5f747075 	svcpl	0x00747075
     82c:	74636576 	strbtvc	r6, [r3], #-1398	; 0xfffffa8a
     830:	4400726f 	strmi	r7, [r0], #-623	; 0xfffffd91
     834:	62617369 	rsbvs	r7, r1, #-1543503871	; 0xa4000001
     838:	495f656c 	ldmdbmi	pc, {r2, r3, r5, r6, r8, sl, sp, lr}^	; <UNPREDICTABLE>
     83c:	5f735152 	svcpl	0x00735152
     840:	69440031 	stmdbvs	r4, {r0, r4, r5}^
     844:	6c626173 	stfvse	f6, [r2], #-460	; 0xfffffe34
     848:	52495f65 	subpl	r5, r9, #404	; 0x194
     84c:	325f7351 	subscc	r7, pc, #1140850689	; 0x44000001
     850:	73616600 	cmnvc	r1, #0, 12
     854:	6e695f74 	mcrvs	15, 3, r5, cr9, cr4, {3}
     858:	72726574 	rsbsvc	r6, r2, #116, 10	; 0x1d000000
     85c:	5f747075 	svcpl	0x00747075
     860:	74636576 	strbtvc	r6, [r3], #-1398	; 0xfffffa8a
     864:	4900726f 	stmdbmi	r0, {r0, r1, r2, r3, r5, r6, r9, ip, sp, lr}
     868:	705f5152 	subsvc	r5, pc, r2, asr r1	; <UNPREDICTABLE>
     86c:	69646e65 	stmdbvs	r4!, {r0, r2, r5, r6, r9, sl, fp, sp, lr}^
     870:	315f676e 	cmpcc	pc, lr, ror #14
     874:	6d6f6300 	stclvs	3, cr6, [pc, #-0]	; 87c <CPSR_IRQ_INHIBIT+0x7fc>
     878:	65726170 	ldrbvs	r6, [r2, #-368]!	; 0xfffffe90
     87c:	6f630030 	svcvs	0x00630030
     880:	7261706d 	rsbvc	r7, r1, #109	; 0x6d
     884:	63003165 	movwvs	r3, #357	; 0x165
     888:	61706d6f 	cmnvs	r0, pc, ror #26
     88c:	00326572 	eorseq	r6, r2, r2, ror r5
     890:	706d6f63 	rsbvc	r6, sp, r3, ror #30
     894:	33657261 	cmncc	r5, #268435462	; 0x10000006
     898:	6f682f00 	svcvs	0x00682f00
     89c:	612f656d 			; <UNDEFINED> instruction: 0x612f656d
     8a0:	6b696462 	blvs	1a59a30 <_heap+0x19d9a2c>
     8a4:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
     8a8:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
     8ac:	4c794d2f 	ldclmi	13, cr4, [r9], #-188	; 0xffffff44
     8b0:	6c747469 	cfldrdvs	mvd7, [r4], #-420	; 0xfffffe5c
     8b4:	2f534f65 	svccs	0x00534f65
     8b8:	2f637273 	svccs	0x00637273
     8bc:	2d697072 	stclcs	0, cr7, [r9, #-456]!	; 0xfffffe38
     8c0:	74737973 	ldrbtvc	r7, [r3], #-2419	; 0xfffff68d
     8c4:	72656d69 	rsbvc	r6, r5, #6720	; 0x1a40
     8c8:	6300632e 	movwvs	r6, #814	; 0x32e
     8cc:	746e756f 	strbtvc	r7, [lr], #-1391	; 0xfffffa91
     8d0:	685f7265 	ldmdavs	pc, {r0, r2, r5, r6, r9, ip, sp, lr}^	; <UNPREDICTABLE>
     8d4:	6f630069 	svcvs	0x00630069
     8d8:	6f72746e 	svcvs	0x0072746e
     8dc:	74735f6c 	ldrbtvc	r5, [r3], #-3948	; 0xfffff094
     8e0:	73757461 	cmnvc	r5, #1627389952	; 0x61000000
     8e4:	756f6300 	strbvc	r6, [pc, #-768]!	; 5ec <CPSR_IRQ_INHIBIT+0x56c>
     8e8:	7265746e 	rsbvc	r7, r5, #1845493760	; 0x6e000000
     8ec:	006f6c5f 	rsbeq	r6, pc, pc, asr ip	; <UNPREDICTABLE>
     8f0:	5f495052 	svcpl	0x00495052
     8f4:	53746547 	cmnpl	r4, #297795584	; 0x11c00000
     8f8:	65747379 	ldrbvs	r7, [r4, #-889]!	; 0xfffffc87
     8fc:	6d69546d 	cfstrdvs	mvd5, [r9, #-436]!	; 0xfffffe4c
     900:	52007265 	andpl	r7, r0, #1342177286	; 0x50000006
     904:	575f4950 			; <UNDEFINED> instruction: 0x575f4950
     908:	4d746961 			; <UNDEFINED> instruction: 0x4d746961
     90c:	6f726369 	svcvs	0x00726369
     910:	6f636553 	svcvs	0x00636553
     914:	0073646e 	rsbseq	r6, r3, lr, ror #8
     918:	5f697072 	svcpl	0x00697072
     91c:	5f737973 	svcpl	0x00737973
     920:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0xfffff68c
     924:	00745f72 	rsbseq	r5, r4, r2, ror pc
     928:	53697072 	cmnpl	r9, #114	; 0x72
     92c:	65747379 	ldrbvs	r7, [r4, #-889]!	; 0xfffffc87
     930:	6d69546d 	cfstrdvs	mvd5, [r9, #-436]!	; 0xfffffe4c
     934:	41007265 	tstmi	r0, r5, ror #4
     938:	4d5f5855 	ldclmi	8, cr5, [pc, #-340]	; 7ec <CPSR_IRQ_INHIBIT+0x76c>
     93c:	43535f55 	cmpmi	r3, #340	; 0x154
     940:	43544152 	cmpmi	r4, #-2147483628	; 0x80000014
     944:	70720048 	rsbsvc	r0, r2, r8, asr #32
     948:	61755f69 	cmnvs	r5, r9, ror #30
     94c:	745f7472 	ldrbvc	r7, [pc], #-1138	; 954 <CPSR_IRQ_INHIBIT+0x8d4>
     950:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     954:	6e694d5f 	mcrvs	13, 3, r4, cr9, cr15, {2}
     958:	72615569 	rsbvc	r5, r1, #440401920	; 0x1a400000
     95c:	53495f74 	movtpl	r5, #40820	; 0x9f74
     960:	626e0052 	rsbvs	r0, lr, #82	; 0x52
     964:	73657479 	cmnvc	r5, #2030043136	; 0x79000000
     968:	58554100 	ldmdapl	r5, {r8, lr}^
     96c:	5f554d5f 	svcpl	0x00554d5f
     970:	5f52534c 	svcpl	0x0052534c
     974:	00474552 	subeq	r4, r7, r2, asr r5
     978:	5f585541 	svcpl	0x00585541
     97c:	42414e45 	submi	r4, r1, #1104	; 0x450
     980:	0053454c 	subseq	r4, r3, ip, asr #10
     984:	5f495052 	svcpl	0x00495052
     988:	74697257 	strbtvc	r7, [r9], #-599	; 0xfffffda9
     98c:	4d6f5465 	cfstrdmi	mvd5, [pc, #-404]!	; 800 <CPSR_IRQ_INHIBIT+0x780>
     990:	55696e69 	strbpl	r6, [r9, #-3689]!	; 0xfffff197
     994:	00747261 	rsbseq	r7, r4, r1, ror #4
     998:	5f495052 	svcpl	0x00495052
     99c:	696e694d 	stmdbvs	lr!, {r0, r2, r3, r6, r8, fp, sp, lr}^
     9a0:	74726155 	ldrbtvc	r6, [r2], #-341	; 0xfffffeab
     9a4:	74696e49 	strbtvc	r6, [r9], #-3657	; 0xfffff1b7
     9a8:	58554100 	ldmdapl	r5, {r8, lr}^
     9ac:	5f554d5f 	svcpl	0x00554d5f
     9b0:	5f52434d 	svcpl	0x0052434d
     9b4:	00474552 	subeq	r4, r7, r2, asr r5
     9b8:	5f585541 	svcpl	0x00585541
     9bc:	495f554d 	ldmdbmi	pc, {r0, r2, r3, r6, r8, sl, ip, lr}^	; <UNPREDICTABLE>
     9c0:	45525f4f 	ldrbmi	r5, [r2, #-3919]	; 0xfffff0b1
     9c4:	69660047 	stmdbvs	r6!, {r0, r1, r2, r6}^
     9c8:	625f6f66 	subsvs	r6, pc, #408	; 0x198
     9cc:	65666675 	strbvs	r6, [r6, #-1653]!	; 0xfffff98b
     9d0:	682f0072 	stmdavs	pc!, {r1, r4, r5, r6}	; <UNPREDICTABLE>
     9d4:	2f656d6f 	svccs	0x00656d6f
     9d8:	69646261 	stmdbvs	r4!, {r0, r5, r6, r9, sp, lr}^
     9dc:	6972616b 	ldmdbvs	r2!, {r0, r1, r3, r5, r6, r8, sp, lr}^
     9e0:	65642f6d 	strbvs	r2, [r4, #-3949]!	; 0xfffff093
     9e4:	794d2f76 	stmdbvc	sp, {r1, r2, r4, r5, r6, r8, r9, sl, fp, sp}^
     9e8:	7474694c 	ldrbtvc	r6, [r4], #-2380	; 0xfffff6b4
     9ec:	534f656c 	movtpl	r6, #62828	; 0xf56c
     9f0:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
     9f4:	6970722f 	ldmdbvs	r0!, {r0, r1, r2, r3, r5, r9, ip, sp, lr}^
     9f8:	7261752d 	rsbvc	r7, r1, #188743680	; 0xb400000
     9fc:	00632e74 	rsbeq	r2, r3, r4, ror lr
     a00:	5f585541 	svcpl	0x00585541
     a04:	425f554d 	subsmi	r5, pc, #322961408	; 0x13400000
     a08:	5f445541 	svcpl	0x00445541
     a0c:	00474552 	subeq	r4, r7, r2, asr r5
     a10:	5f585541 	svcpl	0x00585541
     a14:	4d5f554d 	cfldr64mi	mvdx5, [pc, #-308]	; 8e8 <CPSR_IRQ_INHIBIT+0x868>
     a18:	525f5253 	subspl	r5, pc, #805306373	; 0x30000005
     a1c:	74004745 	strvc	r4, [r0], #-1861	; 0xfffff8bb
     a20:	006c6961 	rsbeq	r6, ip, r1, ror #18
     a24:	5f585541 	svcpl	0x00585541
     a28:	495f554d 	ldmdbmi	pc, {r0, r2, r3, r6, r8, sl, ip, lr}^	; <UNPREDICTABLE>
     a2c:	525f5245 	subspl	r5, pc, #1342177284	; 0x50000004
     a30:	72004745 	andvc	r4, r0, #18087936	; 0x1140000
     a34:	694d6970 	stmdbvs	sp, {r4, r5, r6, r8, fp, sp, lr}^
     a38:	6155696e 	cmpvs	r5, lr, ror #18
     a3c:	41007472 	tstmi	r0, r2, ror r4
     a40:	4d5f5855 	ldclmi	8, cr5, [pc, #-340]	; 8f4 <CPSR_IRQ_INHIBIT+0x874>
     a44:	49495f55 	stmdbmi	r9, {r0, r2, r4, r6, r8, r9, sl, fp, ip, lr}^
     a48:	45525f52 	ldrbmi	r5, [r2, #-3922]	; 0xfffff0ae
     a4c:	70720047 	rsbsvc	r0, r2, r7, asr #32
     a50:	78754169 	ldmdavc	r5!, {r0, r3, r5, r6, r8, lr}^
     a54:	58554100 	ldmdapl	r5, {r8, lr}^
     a58:	5152495f 	cmppl	r2, pc, asr r9
     a5c:	636e6900 	cmnvs	lr, #0, 18
     a60:	6e696d6f 	cdpvs	13, 6, cr6, cr9, cr15, {3}
     a64:	61645f67 	cmnvs	r4, r7, ror #30
     a68:	67006174 	smlsdxvs	r0, r4, r1, r6
     a6c:	526f6970 	rsbpl	r6, pc, #112, 18	; 0x1c0000
     a70:	66006765 	strvs	r6, [r0], -r5, ror #14
     a74:	5f6f6669 	svcpl	0x006f6669
     a78:	6e690074 	mcrvs	0, 3, r0, cr9, cr4, {3}
     a7c:	696d6f63 	stmdbvs	sp!, {r0, r1, r5, r6, r8, r9, sl, fp, sp, lr}^
     a80:	625f676e 	subsvs	r6, pc, #28835840	; 0x1b80000
     a84:	00657479 	rsbeq	r7, r5, r9, ror r4
     a88:	5f495052 	svcpl	0x00495052
     a8c:	64616552 	strbtvs	r6, [r1], #-1362	; 0xfffffaae
     a90:	6d6f7246 	sfmvs	f7, 2, [pc, #-280]!	; 980 <CPSR_IRQ_INHIBIT+0x900>
     a94:	696e694d 	stmdbvs	lr!, {r0, r2, r3, r6, r8, fp, sp, lr}^
     a98:	74726155 	ldrbtvc	r6, [r2], #-341	; 0xfffffeab
     a9c:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     aa0:	7465475f 	strbtvc	r4, [r5], #-1887	; 0xfffff8a1
     aa4:	696e694d 	stmdbvs	lr!, {r0, r2, r3, r6, r8, fp, sp, lr}^
     aa8:	74726155 	ldrbtvc	r6, [r2], #-341	; 0xfffffeab
     aac:	58554100 	ldmdapl	r5, {r8, lr}^
     ab0:	5f554d5f 	svcpl	0x00554d5f
     ab4:	54415453 	strbpl	r5, [r1], #-1107	; 0xfffffbad
     ab8:	4745525f 	smlsldmi	r5, r5, pc, r2	; <UNPREDICTABLE>
     abc:	61656800 	cmnvs	r5, r0, lsl #16
     ac0:	69730064 	ldmdbvs	r3!, {r2, r5, r6}^
     ac4:	7974657a 	ldmdbvc	r4!, {r1, r3, r4, r5, r6, r8, sl, sp, lr}^
     ac8:	41006570 	tstmi	r0, r0, ror r5
     acc:	4d5f5855 	ldclmi	8, cr5, [pc, #-340]	; 980 <CPSR_IRQ_INHIBIT+0x900>
     ad0:	434c5f55 	movtmi	r5, #53077	; 0xcf55
     ad4:	45525f52 	ldrbmi	r5, [r2, #-3922]	; 0xfffff0ae
     ad8:	50520047 	subspl	r0, r2, r7, asr #32
     adc:	65475f49 	strbvs	r5, [r7, #-3913]	; 0xfffff0b7
     ae0:	78754174 	ldmdavc	r5!, {r2, r4, r5, r6, r8, lr}^
     ae4:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
     ae8:	7875615f 	ldmdavc	r5!, {r0, r1, r2, r3, r4, r6, r8, sp, lr}^
     aec:	5200745f 	andpl	r7, r0, #1593835520	; 0x5f000000
     af0:	705f4950 	subsvc	r4, pc, r0, asr r9	; <UNPREDICTABLE>
     af4:	746e6972 	strbtvc	r6, [lr], #-2418	; 0xfffff68e
     af8:	69727453 	ldmdbvs	r2!, {r0, r1, r4, r6, sl, ip, sp, lr}^
     afc:	664f676e 	strbvs	r6, [pc], -lr, ror #14
     b00:	006e654c 	rsbeq	r6, lr, ip, asr #10
     b04:	5f585541 	svcpl	0x00585541
     b08:	435f554d 	cmpmi	pc, #322961408	; 0x13400000
     b0c:	5f4c544e 	svcpl	0x004c544e
     b10:	00474552 	subeq	r4, r7, r2, asr r5
     b14:	5f495052 	svcpl	0x00495052
     b18:	6e697270 	mcrvs	2, 3, r7, cr9, cr0, {3}
     b1c:	72745374 	rsbsvc	r5, r4, #116, 6	; 0xd0000001
     b20:	00676e69 	rsbeq	r6, r7, r9, ror #28
     b24:	6f73645f 	svcvs	0x0073645f
     b28:	6e61685f 	mcrvs	8, 3, r6, cr1, cr15, {2}
     b2c:	00656c64 	rsbeq	r6, r5, r4, ror #24
     b30:	7a69735f 	bvc	1a5d8b4 <_heap+0x19dd8b0>
     b34:	6f630065 	svcvs	0x00630065
     b38:	6e616d6d 	cdpvs	13, 6, cr6, cr1, cr13, {3}
     b3c:	6f6e5f64 	svcvs	0x006e5f64
     b40:	6f665f74 	svcvs	0x00665f74
     b44:	5f646e75 	svcpl	0x00646e75
     b48:	74786574 	ldrbtvc	r6, [r8], #-1396	; 0xfffffa8c
     b4c:	61725f00 	cmnvs	r2, r0, lsl #30
     b50:	3834646e 	ldmdacc	r4!, {r1, r2, r3, r5, r6, sl, sp, lr}
     b54:	6d655f00 	stclvs	15, cr5, [r5, #-0]
     b58:	65677265 	strbvs	r7, [r7, #-613]!	; 0xfffffd9b
     b5c:	0079636e 	rsbseq	r6, r9, lr, ror #6
     b60:	7263775f 	rsbvc	r7, r3, #24903680	; 0x17c0000
     b64:	626d6f74 	rsbvs	r6, sp, #116, 30	; 0x1d0
     b68:	6174735f 	cmnvs	r4, pc, asr r3
     b6c:	5f006574 	svcpl	0x00006574
     b70:	72736377 	rsbsvc	r6, r3, #-603979775	; 0xdc000001
     b74:	626d6f74 	rsbvs	r6, sp, #116, 30	; 0x1d0
     b78:	74735f73 	ldrbtvc	r5, [r3], #-3955	; 0xfffff08d
     b7c:	00657461 	rsbeq	r7, r5, r1, ror #8
     b80:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; acc <CPSR_IRQ_INHIBIT+0xa4c>
     b84:	62612f65 	rsbvs	r2, r1, #404	; 0x194
     b88:	616b6964 	cmnvs	fp, r4, ror #18
     b8c:	2f6d6972 	svccs	0x006d6972
     b90:	2f766564 	svccs	0x00766564
     b94:	694c794d 	stmdbvs	ip, {r0, r2, r3, r6, r8, fp, ip, sp, lr}^
     b98:	656c7474 	strbvs	r7, [ip, #-1140]!	; 0xfffffb8c
     b9c:	732f534f 			; <UNDEFINED> instruction: 0x732f534f
     ba0:	732f6372 			; <UNDEFINED> instruction: 0x732f6372
     ba4:	6c6c6568 	cfstr64vs	mvdx6, [ip], #-416	; 0xfffffe60
     ba8:	5f00632e 	svcpl	0x0000632e
     bac:	7366626c 	cmnvc	r6, #108, 4	; 0xc0000006
     bb0:	00657a69 	rsbeq	r7, r5, r9, ror #20
     bb4:	72626d5f 	rsbvc	r6, r2, #6080	; 0x17c0
     bb8:	63776f74 	cmnvs	r7, #116, 30	; 0x1d0
     bbc:	6174735f 	cmnvs	r4, pc, asr r3
     bc0:	5f006574 	svcpl	0x00006574
     bc4:	6f746377 	svcvs	0x00746377
     bc8:	735f626d 	cmpvc	pc, #-805306362	; 0xd0000006
     bcc:	65746174 	ldrbvs	r6, [r4, #-372]!	; 0xfffffe8c
     bd0:	745f5f00 	ldrbvc	r5, [pc], #-3840	; bd8 <CPSR_IRQ_INHIBIT+0xb58>
     bd4:	65735f6d 	ldrbvs	r5, [r3, #-3949]!	; 0xfffff093
     bd8:	755f0063 	ldrbvc	r0, [pc, #-99]	; b7d <CPSR_IRQ_INHIBIT+0xafd>
     bdc:	00667562 	rsbeq	r7, r6, r2, ror #10
     be0:	6d745f5f 	ldclvs	15, cr5, [r4, #-380]!	; 0xfffffe84
     be4:	756f685f 	strbvc	r6, [pc, #-2143]!	; 38d <CPSR_IRQ_INHIBIT+0x30d>
     be8:	5f5f0072 	svcpl	0x005f0072
     bec:	5f006673 	svcpl	0x00006673
     bf0:	655f6e6f 	ldrbvs	r6, [pc, #-3695]	; fffffd89 <_heap+0xfff7fd85>
     bf4:	5f746978 	svcpl	0x00746978
     bf8:	73677261 	cmnvc	r7, #268435462	; 0x10000006
     bfc:	6f635f00 	svcvs	0x00635f00
     c00:	65696b6f 	strbvs	r6, [r9, #-2927]!	; 0xfffff491
     c04:	735f5f00 	cmpvc	pc, #0, 30
     c08:	65756c67 	ldrbvs	r6, [r5, #-3175]!	; 0xfffff399
     c0c:	6c665f00 	stclvs	15, cr5, [r6], #-0
     c10:	00736761 	rsbseq	r6, r3, r1, ror #14
     c14:	5f73695f 	svcpl	0x0073695f
     c18:	00617863 	rsbeq	r7, r1, r3, ror #16
     c1c:	6474735f 	ldrbtvs	r7, [r4], #-863	; 0xfffffca1
     c20:	5f006e69 	svcpl	0x00006e69
     c24:	736b6c62 	cmnvc	fp, #25088	; 0x6200
     c28:	00657a69 	rsbeq	r7, r5, r9, ror #20
     c2c:	7476635f 	ldrbtvc	r6, [r6], #-863	; 0xfffffca1
     c30:	00667562 	rsbeq	r7, r6, r2, ror #10
     c34:	66666f5f 	uqsaxvs	r6, r6, pc	; <UNPREDICTABLE>
     c38:	00746573 	rsbseq	r6, r4, r3, ror r5
     c3c:	73626d5f 	cmnvc	r2, #6080	; 0x17c0
     c40:	776f7472 			; <UNDEFINED> instruction: 0x776f7472
     c44:	735f7363 	cmpvc	pc, #-1946157055	; 0x8c000001
     c48:	65746174 	ldrbvs	r6, [r4, #-372]!	; 0xfffffe8c
     c4c:	626d5f00 	rsbvs	r5, sp, #0, 30
     c50:	6e656c72 	mcrvs	12, 3, r6, cr5, cr2, {3}
     c54:	6174735f 	cmnvs	r4, pc, asr r3
     c58:	5f006574 	svcpl	0x00006574
     c5c:	72616e66 	rsbvc	r6, r1, #1632	; 0x660
     c60:	5f007367 	svcpl	0x00007367
     c64:	00736e66 	rsbseq	r6, r3, r6, ror #28
     c68:	6769735f 			; <UNDEFINED> instruction: 0x6769735f
     c6c:	665f006e 	ldrbvs	r0, [pc], -lr, rrx
     c70:	6b636f6c 	blvs	18dca28 <_heap+0x185ca24>
     c74:	5f00745f 	svcpl	0x0000745f
     c78:	65647473 	strbvs	r7, [r4, #-1139]!	; 0xfffffb8d
     c7c:	5f007272 	svcpl	0x00007272
     c80:	69676942 	stmdbvs	r7!, {r1, r6, r8, fp, sp, lr}^
     c84:	5f00746e 	svcpl	0x0000746e
     c88:	6d6d6167 	stfvse	f6, [sp, #-412]!	; 0xfffffe64
     c8c:	69735f61 	ldmdbvs	r3!, {r0, r5, r6, r8, r9, sl, fp, ip, lr}^
     c90:	61676e67 	cmnvs	r7, r7, ror #28
     c94:	725f006d 	subsvc	r0, pc, #109	; 0x6d
     c98:	6c757365 	ldclvs	3, cr7, [r5], #-404	; 0xfffffe6c
     c9c:	006b5f74 	rsbeq	r5, fp, r4, ror pc
     ca0:	6d745f5f 	ldclvs	15, cr5, [r4, #-380]!	; 0xfffffe84
     ca4:	775f5f00 	ldrbvc	r5, [pc, -r0, lsl #30]
     ca8:	00626863 	rsbeq	r6, r2, r3, ror #16
     cac:	6474735f 	ldrbtvs	r7, [r4], #-863	; 0xfffffca1
     cb0:	0074756f 	rsbseq	r7, r4, pc, ror #10
     cb4:	7476635f 	ldrbtvc	r6, [r6], #-863	; 0xfffffca1
     cb8:	006e656c 	rsbeq	r6, lr, ip, ror #10
     cbc:	6c69665f 	stclvs	6, cr6, [r9], #-380	; 0xfffffe84
     cc0:	6e5f0065 	cdpvs	0, 5, cr0, cr15, cr5, {3}
     cc4:	73626f69 	cmnvc	r2, #420	; 0x1a4
     cc8:	74615f00 	strbtvc	r5, [r1], #-3840	; 0xfffff100
     ccc:	74697865 	strbtvc	r7, [r9], #-2149	; 0xfffff79b
     cd0:	735f0030 	cmpvc	pc, #48	; 0x30
     cd4:	616e6769 	cmnvs	lr, r9, ror #14
     cd8:	75625f6c 	strbvc	r5, [r2, #-3948]!	; 0xfffff094
     cdc:	615f0066 	cmpvs	pc, r6, rrx
     ce0:	69746373 	ldmdbvs	r4!, {r0, r1, r4, r5, r6, r8, r9, sp, lr}^
     ce4:	625f656d 	subsvs	r6, pc, #457179136	; 0x1b400000
     ce8:	5f006675 	svcpl	0x00006675
     cec:	75736572 	ldrbvc	r6, [r3, #-1394]!	; 0xfffffa8e
     cf0:	5f00746c 	svcpl	0x0000746c
     cf4:	6863775f 	stmdavs	r3!, {r0, r1, r2, r3, r4, r6, r8, r9, sl, ip, sp, lr}^
     cf8:	6e697700 	cdpvs	7, 6, cr7, cr9, cr0, {0}
     cfc:	00745f74 	rsbseq	r5, r4, r4, ror pc
     d00:	636f6c5f 	cmnvs	pc, #24320	; 0x5f00
     d04:	665f006b 	ldrbvs	r0, [pc], -fp, rrx
     d08:	7367616c 	cmnvc	r7, #108, 2
     d0c:	5f5f0032 	svcpl	0x005f0032
     d10:	795f6d74 	ldmdbvc	pc, {r2, r4, r5, r6, r8, sl, fp, sp, lr}^	; <UNPREDICTABLE>
     d14:	00726165 	rsbseq	r6, r2, r5, ror #2
     d18:	616d6e5f 	cmnvs	sp, pc, asr lr
     d1c:	636f6c6c 	cmnvs	pc, #108, 24	; 0x6c00
     d20:	6e6f6c00 	cdpvs	12, 6, cr6, cr15, cr0, {0}
     d24:	6f642067 	svcvs	0x00642067
     d28:	656c6275 	strbvs	r6, [ip, #-629]!	; 0xfffffd8b
     d2c:	656e5f00 	strbvs	r5, [lr, #-3840]!	; 0xfffff100
     d30:	00667478 	rsbeq	r7, r6, r8, ror r4
     d34:	6d745f5f 	ldclvs	15, cr5, [r4, #-380]!	; 0xfffffe84
     d38:	6e6f6d5f 	mcrvs	13, 3, r6, cr15, cr15, {2}
     d3c:	74615f00 	strbtvc	r5, [r1], #-3840	; 0xfffff100
     d40:	74697865 	strbtvc	r7, [r9], #-2149	; 0xfffff79b
     d44:	62757300 	rsbsvs	r7, r5, #0, 6
     d48:	6174706f 	cmnvs	r4, pc, rrx
     d4c:	5f006772 	svcpl	0x00006772
     d50:	6964735f 	stmdbvs	r4!, {r0, r1, r2, r3, r4, r6, r8, r9, ip, sp, lr}^
     d54:	696e6964 	stmdbvs	lr!, {r2, r5, r6, r8, fp, sp, lr}^
     d58:	6f5f0074 	svcvs	0x005f0074
     d5c:	745f6666 	ldrbvc	r6, [pc], #-1638	; d64 <CPSR_IRQ_INHIBIT+0xce4>
     d60:	6f682f00 	svcvs	0x00682f00
     d64:	612f656d 			; <UNDEFINED> instruction: 0x612f656d
     d68:	6b696462 	blvs	1a59ef8 <_heap+0x19d9ef4>
     d6c:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
     d70:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
     d74:	4c794d2f 	ldclmi	13, cr4, [r9], #-188	; 0xffffff44
     d78:	6c747469 	cfldrdvs	mvd7, [r4], #-420	; 0xfffffe5c
     d7c:	00534f65 	subseq	r4, r3, r5, ror #30
     d80:	6572665f 	ldrbvs	r6, [r2, #-1631]!	; 0xfffff9a1
     d84:	73696c65 	cmnvc	r9, #25856	; 0x6500
     d88:	4c5f0074 	mrrcmi	0, 7, r0, pc, cr4	; <UNPREDICTABLE>
     d8c:	5f4b434f 	svcpl	0x004b434f
     d90:	55434552 	strbpl	r4, [r3, #-1362]	; 0xfffffaae
     d94:	56495352 			; <UNDEFINED> instruction: 0x56495352
     d98:	00545f45 	subseq	r5, r4, r5, asr #30
     d9c:	77656e5f 			; <UNDEFINED> instruction: 0x77656e5f
     da0:	5f685f00 	svcpl	0x00685f00
     da4:	6e727265 	cdpvs	2, 7, cr7, cr2, cr5, {3}
     da8:	5f5f006f 	svcpl	0x005f006f
     dac:	795f6d74 	ldmdbvc	pc, {r2, r4, r5, r6, r8, sl, fp, sp, lr}^	; <UNPREDICTABLE>
     db0:	00796164 	rsbseq	r6, r9, r4, ror #2
     db4:	62735f5f 	rsbsvs	r5, r3, #380	; 0x17c
     db8:	5f006675 	svcpl	0x00006675
     dbc:	73626f69 	cmnvc	r2, #420	; 0x1a4
     dc0:	465f5f00 	ldrbmi	r5, [pc], -r0, lsl #30
     dc4:	00454c49 	subeq	r4, r5, r9, asr #24
     dc8:	73626d5f 	cmnvc	r2, #6080	; 0x17c0
     dcc:	65746174 	ldrbvs	r6, [r4, #-372]!	; 0xfffffe8c
     dd0:	5f00745f 	svcpl	0x0000745f
     dd4:	4946735f 	stmdbmi	r6, {r0, r1, r2, r3, r4, r6, r8, r9, ip, sp, lr}^
     dd8:	5f00454c 	svcpl	0x0000454c
     ddc:	7473626d 	ldrbtvc	r6, [r3], #-621	; 0xfffffd93
     de0:	00657461 	rsbeq	r7, r5, r1, ror #8
     de4:	6e61725f 	mcrvs	2, 3, r7, cr1, cr15, {2}
     de8:	656e5f64 	strbvs	r5, [lr, #-3940]!	; 0xfffff09c
     dec:	5f007478 	svcpl	0x00007478
     df0:	656c626d 	strbvs	r6, [ip, #-621]!	; 0xfffffd93
     df4:	74735f6e 	ldrbtvc	r5, [r3], #-3950	; 0xfffff092
     df8:	00657461 	rsbeq	r7, r5, r1, ror #8
     dfc:	636e695f 	cmnvs	lr, #1556480	; 0x17c000
     e00:	6e695f00 	cdpvs	15, 6, cr5, cr9, cr0, {0}
     e04:	635f0064 	cmpvs	pc, #100	; 0x64
     e08:	65727275 	ldrbvs	r7, [r2, #-629]!	; 0xfffffd8b
     e0c:	6c5f746e 	cfldrdvs	mvd7, [pc], {110}	; 0x6e
     e10:	6c61636f 	stclvs	3, cr6, [r1], #-444	; 0xfffffe44
     e14:	6e690065 	cdpvs	0, 6, cr0, cr9, cr5, {3}
     e18:	00747570 	rsbseq	r7, r4, r0, ror r5
     e1c:	6c635f5f 	stclvs	15, cr5, [r3], #-380	; 0xfffffe84
     e20:	756e6165 	strbvc	r6, [lr, #-357]!	; 0xfffffe9b
     e24:	6d5f0070 	ldclvs	0, cr0, [pc, #-448]	; c6c <CPSR_IRQ_INHIBIT+0xbec>
     e28:	64777861 	ldrbtvs	r7, [r7], #-2145	; 0xfffff79f
     e2c:	725f0073 	subsvc	r0, pc, #115	; 0x73
     e30:	746e6565 	strbtvc	r6, [lr], #-1381	; 0xfffffa9b
     e34:	65735f00 	ldrbvs	r5, [r3, #-3840]!	; 0xfffff100
     e38:	5f006465 	svcpl	0x00006465
     e3c:	756f635f 	strbvc	r6, [pc, #-863]!	; ae5 <CPSR_IRQ_INHIBIT+0xa65>
     e40:	5f00746e 	svcpl	0x0000746e
     e44:	6c61765f 	stclvs	6, cr7, [r1], #-380	; 0xfffffe84
     e48:	5f006575 	svcpl	0x00006575
     e4c:	6b656573 	blvs	195a420 <_heap+0x18da41c>
     e50:	70665f00 	rsbvc	r5, r6, r0, lsl #30
     e54:	745f736f 	ldrbvc	r7, [pc], #-879	; e5c <CPSR_IRQ_INHIBIT+0xddc>
     e58:	745f5f00 	ldrbvc	r5, [pc], #-3840	; e60 <CPSR_IRQ_INHIBIT+0xde0>
     e5c:	696d5f6d 	stmdbvs	sp!, {r0, r2, r3, r5, r6, r8, r9, sl, fp, ip, lr}^
     e60:	6d5f006e 	ldclvs	0, cr0, [pc, #-440]	; cb0 <CPSR_IRQ_INHIBIT+0xc30>
     e64:	00746c75 	rsbseq	r6, r4, r5, ror ip
     e68:	65746e65 	ldrbvs	r6, [r4, #-3685]!	; 0xfffff19b
     e6c:	6f635f72 	svcvs	0x00635f72
     e70:	6e616d6d 	cdpvs	13, 6, cr6, cr1, cr13, {3}
     e74:	65745f64 	ldrbvs	r5, [r4, #-3940]!	; 0xfffff09c
     e78:	5f007478 	svcpl	0x00007478
     e7c:	74727473 	ldrbtvc	r7, [r2], #-1139	; 0xfffffb8d
     e80:	6c5f6b6f 	mrrcvs	11, 6, r6, pc, cr15	; <UNPREDICTABLE>
     e84:	00747361 	rsbseq	r7, r4, r1, ror #6
     e88:	746e665f 	strbtvc	r6, [lr], #-1631	; 0xfffff9a1
     e8c:	73657079 	cmnvc	r5, #121	; 0x79
     e90:	64615f00 	strbtvs	r5, [r1], #-3840	; 0xfffff100
     e94:	5f5f0064 	svcpl	0x005f0064
     e98:	6e6f4c55 	mcrvs	12, 3, r4, cr15, cr5, {2}
     e9c:	675f0067 	ldrbvs	r0, [pc, -r7, rrx]
     ea0:	61647465 	cmnvs	r4, r5, ror #8
     ea4:	655f6574 	ldrbvs	r6, [pc, #-1396]	; 938 <CPSR_IRQ_INHIBIT+0x8b8>
     ea8:	5f007272 	svcpl	0x00007272
     eac:	626f6c67 	rsbvs	r6, pc, #26368	; 0x6700
     eb0:	695f6c61 	ldmdbvs	pc, {r0, r5, r6, sl, fp, sp, lr}^	; <UNPREDICTABLE>
     eb4:	7275706d 	rsbsvc	r7, r5, #109	; 0x6d
     eb8:	74705f65 	ldrbtvc	r5, [r0], #-3941	; 0xfffff09b
     ebc:	635f0072 	cmpvs	pc, #114	; 0x72
     ec0:	65727275 	ldrbvs	r7, [r2, #-629]!	; 0xfffffd8b
     ec4:	635f746e 	cmpvs	pc, #1845493760	; 0x6e000000
     ec8:	67657461 	strbvs	r7, [r5, -r1, ror #8]!
     ecc:	0079726f 	rsbseq	r7, r9, pc, ror #4
     ed0:	756e755f 	strbvc	r7, [lr, #-1375]!	; 0xfffffaa1
     ed4:	5f646573 	svcpl	0x00646573
     ed8:	646e6172 	strbtvs	r6, [lr], #-370	; 0xfffffe8e
     edc:	64775f00 	ldrbtvs	r5, [r7], #-3840	; 0xfffff100
     ee0:	5f5f0073 	svcpl	0x005f0073
     ee4:	775f6d74 			; <UNDEFINED> instruction: 0x775f6d74
     ee8:	00796164 	rsbseq	r6, r9, r4, ror #2
     eec:	756c675f 	strbvc	r6, [ip, #-1887]!	; 0xfffff8a1
     ef0:	625f0065 	subsvs	r0, pc, #101	; 0x65
     ef4:	00657361 	rsbeq	r7, r5, r1, ror #6
     ef8:	34366c5f 	ldrtcc	r6, [r6], #-3167	; 0xfffff3a1
     efc:	75625f61 	strbvc	r5, [r2, #-3937]!	; 0xfffff09f
     f00:	735f0066 	cmpvc	pc, #102	; 0x66
     f04:	665f6769 	ldrbvs	r6, [pc], -r9, ror #14
     f08:	00636e75 	rsbeq	r6, r3, r5, ror lr
     f0c:	75626e5f 	strbvc	r6, [r2, #-3679]!	; 0xfffff1a1
     f10:	755f0066 	ldrbvc	r0, [pc, #-102]	; eb2 <CPSR_IRQ_INHIBIT+0xe32>
     f14:	6573756e 	ldrbvs	r7, [r3, #-1390]!	; 0xfffffa92
     f18:	5f5f0064 	svcpl	0x005f0064
     f1c:	695f6d74 	ldmdbvs	pc, {r2, r4, r5, r6, r8, sl, fp, sp, lr}^	; <UNPREDICTABLE>
     f20:	74736473 	ldrbtvc	r6, [r3], #-1139	; 0xfffffb8d
     f24:	6f6c5f00 	svcvs	0x006c5f00
     f28:	746c6163 	strbtvc	r6, [ip], #-355	; 0xfffffe9d
     f2c:	5f656d69 	svcpl	0x00656d69
     f30:	00667562 	rsbeq	r7, r6, r2, ror #10
     f34:	6f6c635f 	svcvs	0x006c635f
     f38:	5f006573 	svcpl	0x00006573
     f3c:	00383472 	eorseq	r3, r8, r2, ror r4
     f40:	74626d5f 	strbtvc	r6, [r2], #-3423	; 0xfffff2a1
     f44:	5f63776f 	svcpl	0x0063776f
     f48:	74617473 	strbtvc	r7, [r1], #-1139	; 0xfffffb8d
     f4c:	705f0065 	subsvc	r0, pc, r5, rrx
     f50:	5f007335 	svcpl	0x00007335
     f54:	5f6d745f 	svcpl	0x006d745f
     f58:	7961646d 	stmdbvc	r1!, {r0, r2, r3, r5, r6, sl, sp, lr}^
     f5c:	65687300 	strbvs	r7, [r8, #-768]!	; 0xfffffd00
     f60:	6d5f6c6c 	ldclvs	12, cr6, [pc, #-432]	; db8 <CPSR_IRQ_INHIBIT+0xd38>
     f64:	006e6961 	rsbeq	r6, lr, r1, ror #18
     f68:	656d6f73 	strbvs	r6, [sp, #-3955]!	; 0xfffff08d
     f6c:	6e696874 	mcrvs	8, 3, r6, cr9, cr4, {3}
     f70:	74610067 	strbtvc	r0, [r1], #-103	; 0xffffff99
     f74:	00736761 	rsbseq	r6, r3, r1, ror #14
     f78:	6c656873 	stclvs	8, cr6, [r5], #-460	; 0xfffffe34
     f7c:	74735f6c 	ldrbtvc	r5, [r3], #-3948	; 0xfffff094
     f80:	5f747261 	svcpl	0x00747261
     f84:	74786574 	ldrbtvc	r6, [r8], #-1396	; 0xfffffa8c
     f88:	72656b00 	rsbvc	r6, r5, #0, 22
     f8c:	5f6c656e 	svcpl	0x006c656e
     f90:	6e69616d 	powvsez	f6, f1, #5.0
     f94:	6f682f00 	svcvs	0x00682f00
     f98:	612f656d 			; <UNDEFINED> instruction: 0x612f656d
     f9c:	6b696462 	blvs	1a5a12c <_heap+0x19da128>
     fa0:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
     fa4:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
     fa8:	4c794d2f 	ldclmi	13, cr4, [r9], #-188	; 0xffffff44
     fac:	6c747469 	cfldrdvs	mvd7, [r4], #-420	; 0xfffffe5c
     fb0:	2f534f65 	svccs	0x00534f65
     fb4:	2f637273 	svccs	0x00637273
     fb8:	74726175 	ldrbtvc	r6, [r2], #-373	; 0xfffffe8b
     fbc:	6e72654b 	cdpvs	5, 7, cr6, cr2, cr11, {2}
     fc0:	632e6c65 			; <UNDEFINED> instruction: 0x632e6c65
     fc4:	6f682f00 	svcvs	0x00682f00
     fc8:	612f656d 			; <UNDEFINED> instruction: 0x612f656d
     fcc:	6b696462 	blvs	1a5a15c <_heap+0x19da158>
     fd0:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
     fd4:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
     fd8:	4c794d2f 	ldclmi	13, cr4, [r9], #-188	; 0xffffff44
     fdc:	6c747469 	cfldrdvs	mvd7, [r4], #-420	; 0xfffffe5c
     fe0:	2f534f65 	svccs	0x00534f65
     fe4:	2f62696c 	svccs	0x0062696c
     fe8:	6f666966 	svcvs	0x00666966
     fec:	6600632e 	strvs	r6, [r0], -lr, lsr #6
     ff0:	5f6f6669 	svcpl	0x006f6669
     ff4:	74697277 	strbtvc	r7, [r9], #-631	; 0xfffffd89
     ff8:	69660065 	stmdbvs	r6!, {r0, r2, r5, r6}^
     ffc:	695f6f66 	ldmdbvs	pc, {r1, r2, r5, r6, r8, r9, sl, fp, sp, lr}^	; <UNPREDICTABLE>
    1000:	0074696e 	rsbseq	r6, r4, lr, ror #18
    1004:	6f666966 	svcvs	0x00666966
    1008:	6165725f 	cmnvs	r5, pc, asr r2
    100c:	74730064 	ldrbtvc	r0, [r3], #-100	; 0xffffff9c
    1010:	6761726f 	strbvs	r7, [r1, -pc, ror #4]!
    1014:	Address 0x0000000000001014 is out of bounds.


Disassembly of section .ARM.attributes:

00000000 <.ARM.attributes>:
   0:	00003041 	andeq	r3, r0, r1, asr #32
   4:	61656100 	cmnvs	r5, r0, lsl #2
   8:	01006962 	tsteq	r0, r2, ror #18
   c:	00000026 	andeq	r0, r0, r6, lsr #32
  10:	4b5a3605 	blmi	168d82c <_heap+0x160d828>
  14:	08070600 	stmdaeq	r7, {r9, sl}
  18:	0a010901 	beq	42424 <__bss_end__+0x39668>
  1c:	14041202 	strne	r1, [r4], #-514	; 0xfffffdfe
  20:	17011501 	strne	r1, [r1, -r1, lsl #10]
  24:	1a011803 	bne	46038 <__bss_end__+0x3d27c>
  28:	1e011c01 	cdpne	12, 0, cr1, cr1, cr1, {0}
  2c:	44012206 	strmi	r2, [r1], #-518	; 0xfffffdfa
  30:	Address 0x0000000000000030 is out of bounds.

