
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
    8024:	000083e4 	andeq	r8, r0, r4, ror #7

00008028 <_software_interrupt_vector_h>:
    8028:	00008d58 	andeq	r8, r0, r8, asr sp

0000802c <_prefetch_abort_vector_h>:
    802c:	0000844c 	andeq	r8, r0, ip, asr #8

00008030 <_data_abort_vector_h>:
    8030:	00008484 	andeq	r8, r0, r4, lsl #9

00008034 <_unused_handler_h>:
    8034:	00008040 	andeq	r8, r0, r0, asr #32

00008038 <_interrupt_vector_h>:
    8038:	000084bc 			; <UNDEFINED> instruction: 0x000084bc

0000803c <_fast_interrupt_vector_h>:
    803c:	000085c0 	andeq	r8, r0, r0, asr #11

00008040 <_reset_>:
    8040:	e3a00902 	mov	r0, #32768	; 0x8000
    8044:	e3a01000 	mov	r1, #0
    8048:	e8b003fc 	ldm	r0!, {r2, r3, r4, r5, r6, r7, r8, r9}
    804c:	e8a103fc 	stmia	r1!, {r2, r3, r4, r5, r6, r7, r8, r9}
    8050:	e8b003fc 	ldm	r0!, {r2, r3, r4, r5, r6, r7, r8, r9}
    8054:	e8a103fc 	stmia	r1!, {r2, r3, r4, r5, r6, r7, r8, r9}
    8058:	e3a000d2 	mov	r0, #210	; 0xd2
    805c:	e121f000 	msr	CPSR_c, r0
    8060:	e3a0da06 	mov	sp, #24576	; 0x6000
    8064:	e3a000df 	mov	r0, #223	; 0xdf
    8068:	e121f000 	msr	CPSR_c, r0
    806c:	e3a0d901 	mov	sp, #16384	; 0x4000
    8070:	e3a000d3 	mov	r0, #211	; 0xd3
    8074:	e121f000 	msr	CPSR_c, r0
    8078:	e3a0d902 	mov	sp, #32768	; 0x8000
    807c:	ea000009 	b	80a8 <_cstartup>

00008080 <_inf_loop>:
    8080:	eafffffe 	b	8080 <_inf_loop>

00008084 <_enable_interrupts>:
    8084:	e10f0000 	mrs	r0, CPSR
    8088:	e3c00080 	bic	r0, r0, #128	; 0x80
    808c:	e121f000 	msr	CPSR_c, r0
    8090:	e1a0f00e 	mov	pc, lr

00008094 <dummy_a_h>:
    8094:	00008114 	andeq	r8, r0, r4, lsl r1

00008098 <_init>:
    8098:	e3a0e010 	mov	lr, #16
    809c:	e161f00e 	msr	SPSR_c, lr
    80a0:	e51fe014 	ldr	lr, [pc, #-20]	; 8094 <dummy_a_h>
    80a4:	e1b0f00e 	movs	pc, lr

000080a8 <_cstartup>:
    80a8:	e92d4800 	push	{fp, lr}
    80ac:	e28db004 	add	fp, sp, #4
    80b0:	e24dd018 	sub	sp, sp, #24
    80b4:	e50b0010 	str	r0, [fp, #-16]
    80b8:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    80bc:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    80c0:	e59f3044 	ldr	r3, [pc, #68]	; 810c <_cstartup+0x64>
    80c4:	e50b3008 	str	r3, [fp, #-8]
    80c8:	e59f3040 	ldr	r3, [pc, #64]	; 8110 <_cstartup+0x68>
    80cc:	e50b300c 	str	r3, [fp, #-12]
    80d0:	ea000004 	b	80e8 <_cstartup+0x40>
    80d4:	e51b3008 	ldr	r3, [fp, #-8]
    80d8:	e2832004 	add	r2, r3, #4
    80dc:	e50b2008 	str	r2, [fp, #-8]
    80e0:	e3a02000 	mov	r2, #0
    80e4:	e5832000 	str	r2, [r3]
    80e8:	e51b2008 	ldr	r2, [fp, #-8]
    80ec:	e51b300c 	ldr	r3, [fp, #-12]
    80f0:	e1520003 	cmp	r2, r3
    80f4:	3afffff6 	bcc	80d4 <_cstartup+0x2c>
    80f8:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    80fc:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
    8100:	e51b0010 	ldr	r0, [fp, #-16]
    8104:	eb000014 	bl	815c <kernel_main>
    8108:	eafffffe 	b	8108 <_cstartup+0x60>
    810c:	00008dea 	andeq	r8, r0, sl, ror #27
    8110:	00008e0c 	andeq	r8, r0, ip, lsl #28

00008114 <dummy_a>:
    8114:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8118:	e28db000 	add	fp, sp, #0
    811c:	ef000000 	svc	0x00000000
    8120:	eafffffd 	b	811c <dummy_a+0x8>

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
    8148:	eb0001a0 	bl	87d0 <RPI_WriteToMiniUart>
    814c:	e51b000c 	ldr	r0, [fp, #-12]
    8150:	eb000127 	bl	85f4 <RPI_WaitMicroSeconds>
    8154:	eafffff9 	b	8140 <dummy_b+0x1c>
    8158:	000f4240 	andeq	r4, pc, r0, asr #4

0000815c <kernel_main>:
    815c:	e92d4800 	push	{fp, lr}
    8160:	e28db004 	add	fp, sp, #4
    8164:	e24dd030 	sub	sp, sp, #48	; 0x30
    8168:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
    816c:	e50b102c 	str	r1, [fp, #-44]	; 0xffffffd4
    8170:	e50b2030 	str	r2, [fp, #-48]	; 0xffffffd0
    8174:	eb00002d 	bl	8230 <RPI_GetGpio>
    8178:	e1a03000 	mov	r3, r0
    817c:	e5932004 	ldr	r2, [r3, #4]
    8180:	e3822701 	orr	r2, r2, #262144	; 0x40000
    8184:	e5832004 	str	r2, [r3, #4]
    8188:	eb00007e 	bl	8388 <RPI_GetIrqController>
    818c:	e1a02000 	mov	r2, r0
    8190:	e3a03001 	mov	r3, #1
    8194:	e5823018 	str	r3, [r2, #24]
    8198:	eb000015 	bl	81f4 <RPI_GetArmTimer>
    819c:	e1a02000 	mov	r2, r0
    81a0:	e3a03b01 	mov	r3, #1024	; 0x400
    81a4:	e5823000 	str	r3, [r2]
    81a8:	eb000011 	bl	81f4 <RPI_GetArmTimer>
    81ac:	e1a02000 	mov	r2, r0
    81b0:	e3a030aa 	mov	r3, #170	; 0xaa
    81b4:	e5823008 	str	r3, [r2, #8]
    81b8:	eb000135 	bl	8694 <RPI_MiniUartInit>
    81bc:	ebffffb0 	bl	8084 <_enable_interrupts>
    81c0:	e59f3028 	ldr	r3, [pc, #40]	; 81f0 <kernel_main+0x94>
    81c4:	e24bc020 	sub	ip, fp, #32
    81c8:	e1a0e003 	mov	lr, r3
    81cc:	e8be000f 	ldm	lr!, {r0, r1, r2, r3}
    81d0:	e8ac000f 	stmia	ip!, {r0, r1, r2, r3}
    81d4:	e89e0007 	ldm	lr, {r0, r1, r2}
    81d8:	e88c0007 	stm	ip, {r0, r1, r2}
    81dc:	e24b3020 	sub	r3, fp, #32
    81e0:	e1a00003 	mov	r0, r3
    81e4:	eb0001a7 	bl	8888 <RPI_printString>
    81e8:	ebffffaa 	bl	8098 <_init>
    81ec:	eafffffe 	b	81ec <kernel_main+0x90>
    81f0:	00008d78 	andeq	r8, r0, r8, ror sp

000081f4 <RPI_GetArmTimer>:
    81f4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    81f8:	e28db000 	add	fp, sp, #0
    81fc:	e59f3010 	ldr	r3, [pc, #16]	; 8214 <RPI_GetArmTimer+0x20>
    8200:	e5933000 	ldr	r3, [r3]
    8204:	e1a00003 	mov	r0, r3
    8208:	e28bd000 	add	sp, fp, #0
    820c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8210:	e12fff1e 	bx	lr
    8214:	00008d94 	muleq	r0, r4, sp

00008218 <RPI_ArmTimerInit>:
    8218:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    821c:	e28db000 	add	fp, sp, #0
    8220:	e320f000 	nop	{0}
    8224:	e28bd000 	add	sp, fp, #0
    8228:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    822c:	e12fff1e 	bx	lr

00008230 <RPI_GetGpio>:
    8230:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8234:	e28db000 	add	fp, sp, #0
    8238:	e59f3010 	ldr	r3, [pc, #16]	; 8250 <RPI_GetGpio+0x20>
    823c:	e5933000 	ldr	r3, [r3]
    8240:	e1a00003 	mov	r0, r3
    8244:	e28bd000 	add	sp, fp, #0
    8248:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    824c:	e12fff1e 	bx	lr
    8250:	00008d98 	muleq	r0, r8, sp

00008254 <RPI_SetGpioPinFunction>:
    8254:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8258:	e28db000 	add	fp, sp, #0
    825c:	e24dd014 	sub	sp, sp, #20
    8260:	e1a03000 	mov	r3, r0
    8264:	e1a02001 	mov	r2, r1
    8268:	e54b300d 	strb	r3, [fp, #-13]
    826c:	e1a03002 	mov	r3, r2
    8270:	e54b300e 	strb	r3, [fp, #-14]
    8274:	e59f30ec 	ldr	r3, [pc, #236]	; 8368 <RPI_SetGpioPinFunction+0x114>
    8278:	e5932000 	ldr	r2, [r3]
    827c:	e55b300d 	ldrb	r3, [fp, #-13]
    8280:	e59f10e4 	ldr	r1, [pc, #228]	; 836c <RPI_SetGpioPinFunction+0x118>
    8284:	e0831391 	umull	r1, r3, r1, r3
    8288:	e1a031a3 	lsr	r3, r3, #3
    828c:	e6ef3073 	uxtb	r3, r3
    8290:	e1a03103 	lsl	r3, r3, #2
    8294:	e0823003 	add	r3, r2, r3
    8298:	e50b3008 	str	r3, [fp, #-8]
    829c:	e51b3008 	ldr	r3, [fp, #-8]
    82a0:	e5933000 	ldr	r3, [r3]
    82a4:	e50b300c 	str	r3, [fp, #-12]
    82a8:	e55b200d 	ldrb	r2, [fp, #-13]
    82ac:	e59f30b8 	ldr	r3, [pc, #184]	; 836c <RPI_SetGpioPinFunction+0x118>
    82b0:	e0831293 	umull	r1, r3, r3, r2
    82b4:	e1a011a3 	lsr	r1, r3, #3
    82b8:	e1a03001 	mov	r3, r1
    82bc:	e1a03103 	lsl	r3, r3, #2
    82c0:	e0833001 	add	r3, r3, r1
    82c4:	e1a03083 	lsl	r3, r3, #1
    82c8:	e0423003 	sub	r3, r2, r3
    82cc:	e6ef3073 	uxtb	r3, r3
    82d0:	e1a02003 	mov	r2, r3
    82d4:	e1a03002 	mov	r3, r2
    82d8:	e1a03083 	lsl	r3, r3, #1
    82dc:	e0833002 	add	r3, r3, r2
    82e0:	e3a02007 	mov	r2, #7
    82e4:	e1a03312 	lsl	r3, r2, r3
    82e8:	e1e03003 	mvn	r3, r3
    82ec:	e1a02003 	mov	r2, r3
    82f0:	e51b300c 	ldr	r3, [fp, #-12]
    82f4:	e0033002 	and	r3, r3, r2
    82f8:	e50b300c 	str	r3, [fp, #-12]
    82fc:	e55b000e 	ldrb	r0, [fp, #-14]
    8300:	e55b200d 	ldrb	r2, [fp, #-13]
    8304:	e59f3060 	ldr	r3, [pc, #96]	; 836c <RPI_SetGpioPinFunction+0x118>
    8308:	e0831293 	umull	r1, r3, r3, r2
    830c:	e1a011a3 	lsr	r1, r3, #3
    8310:	e1a03001 	mov	r3, r1
    8314:	e1a03103 	lsl	r3, r3, #2
    8318:	e0833001 	add	r3, r3, r1
    831c:	e1a03083 	lsl	r3, r3, #1
    8320:	e0423003 	sub	r3, r2, r3
    8324:	e6ef3073 	uxtb	r3, r3
    8328:	e1a02003 	mov	r2, r3
    832c:	e1a03002 	mov	r3, r2
    8330:	e1a03083 	lsl	r3, r3, #1
    8334:	e0833002 	add	r3, r3, r2
    8338:	e1a03310 	lsl	r3, r0, r3
    833c:	e1a02003 	mov	r2, r3
    8340:	e51b300c 	ldr	r3, [fp, #-12]
    8344:	e1823003 	orr	r3, r2, r3
    8348:	e50b300c 	str	r3, [fp, #-12]
    834c:	e51b200c 	ldr	r2, [fp, #-12]
    8350:	e51b3008 	ldr	r3, [fp, #-8]
    8354:	e5832000 	str	r2, [r3]
    8358:	e320f000 	nop	{0}
    835c:	e28bd000 	add	sp, fp, #0
    8360:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8364:	e12fff1e 	bx	lr
    8368:	00008d98 	muleq	r0, r8, sp
    836c:	cccccccd 	stclgt	12, cr12, [ip], {205}	; 0xcd

00008370 <RPI_GpioInit>:
    8370:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8374:	e28db000 	add	fp, sp, #0
    8378:	e320f000 	nop	{0}
    837c:	e28bd000 	add	sp, fp, #0
    8380:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8384:	e12fff1e 	bx	lr

00008388 <RPI_GetIrqController>:
    8388:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    838c:	e28db000 	add	fp, sp, #0
    8390:	e59f3010 	ldr	r3, [pc, #16]	; 83a8 <RPI_GetIrqController+0x20>
    8394:	e5933000 	ldr	r3, [r3]
    8398:	e1a00003 	mov	r0, r3
    839c:	e28bd000 	add	sp, fp, #0
    83a0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    83a4:	e12fff1e 	bx	lr
    83a8:	00008d9c 	muleq	r0, ip, sp

000083ac <reset_vector>:
    83ac:	e24ee004 	sub	lr, lr, #4
    83b0:	e92d580f 	push	{r0, r1, r2, r3, fp, ip, lr}
    83b4:	e28db018 	add	fp, sp, #24
    83b8:	e24dd00c 	sub	sp, sp, #12
    83bc:	e3a03031 	mov	r3, #49	; 0x31
    83c0:	e54b301d 	strb	r3, [fp, #-29]	; 0xffffffe3
    83c4:	ebffff99 	bl	8230 <RPI_GetGpio>
    83c8:	e1a02000 	mov	r2, r0
    83cc:	e3a03801 	mov	r3, #65536	; 0x10000
    83d0:	e5823028 	str	r3, [r2, #40]	; 0x28
    83d4:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
    83d8:	e1a00003 	mov	r0, r3
    83dc:	eb0000fb 	bl	87d0 <RPI_WriteToMiniUart>
    83e0:	eafffff7 	b	83c4 <reset_vector+0x18>

000083e4 <undefined_instruction_vector>:
    83e4:	e92d580f 	push	{r0, r1, r2, r3, fp, ip, lr}
    83e8:	e28db018 	add	fp, sp, #24
    83ec:	e24dd00c 	sub	sp, sp, #12
    83f0:	e3a03032 	mov	r3, #50	; 0x32
    83f4:	e54b301d 	strb	r3, [fp, #-29]	; 0xffffffe3
    83f8:	ebffff8c 	bl	8230 <RPI_GetGpio>
    83fc:	e1a02000 	mov	r2, r0
    8400:	e3a03801 	mov	r3, #65536	; 0x10000
    8404:	e5823028 	str	r3, [r2, #40]	; 0x28
    8408:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
    840c:	e1a00003 	mov	r0, r3
    8410:	eb0000ee 	bl	87d0 <RPI_WriteToMiniUart>
    8414:	eafffff7 	b	83f8 <undefined_instruction_vector+0x14>

00008418 <software_interrupt_vector>:
    8418:	e92d580f 	push	{r0, r1, r2, r3, fp, ip, lr}
    841c:	e28db018 	add	fp, sp, #24
    8420:	e24dd00c 	sub	sp, sp, #12
    8424:	e3a03033 	mov	r3, #51	; 0x33
    8428:	e54b301d 	strb	r3, [fp, #-29]	; 0xffffffe3
    842c:	ebffff7f 	bl	8230 <RPI_GetGpio>
    8430:	e1a02000 	mov	r2, r0
    8434:	e3a03801 	mov	r3, #65536	; 0x10000
    8438:	e5823028 	str	r3, [r2, #40]	; 0x28
    843c:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
    8440:	e1a00003 	mov	r0, r3
    8444:	eb0000e1 	bl	87d0 <RPI_WriteToMiniUart>
    8448:	eafffff7 	b	842c <software_interrupt_vector+0x14>

0000844c <prefetch_abort_vector>:
    844c:	e24ee004 	sub	lr, lr, #4
    8450:	e92d580f 	push	{r0, r1, r2, r3, fp, ip, lr}
    8454:	e28db018 	add	fp, sp, #24
    8458:	e24dd00c 	sub	sp, sp, #12
    845c:	e3a03034 	mov	r3, #52	; 0x34
    8460:	e54b301d 	strb	r3, [fp, #-29]	; 0xffffffe3
    8464:	ebffff71 	bl	8230 <RPI_GetGpio>
    8468:	e1a02000 	mov	r2, r0
    846c:	e3a03801 	mov	r3, #65536	; 0x10000
    8470:	e5823028 	str	r3, [r2, #40]	; 0x28
    8474:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
    8478:	e1a00003 	mov	r0, r3
    847c:	eb0000d3 	bl	87d0 <RPI_WriteToMiniUart>
    8480:	eafffff7 	b	8464 <prefetch_abort_vector+0x18>

00008484 <data_abort_vector>:
    8484:	e24ee004 	sub	lr, lr, #4
    8488:	e92d580f 	push	{r0, r1, r2, r3, fp, ip, lr}
    848c:	e28db018 	add	fp, sp, #24
    8490:	e24dd00c 	sub	sp, sp, #12
    8494:	e3a03035 	mov	r3, #53	; 0x35
    8498:	e54b301d 	strb	r3, [fp, #-29]	; 0xffffffe3
    849c:	ebffff63 	bl	8230 <RPI_GetGpio>
    84a0:	e1a02000 	mov	r2, r0
    84a4:	e3a03801 	mov	r3, #65536	; 0x10000
    84a8:	e5823028 	str	r3, [r2, #40]	; 0x28
    84ac:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
    84b0:	e1a00003 	mov	r0, r3
    84b4:	eb0000c5 	bl	87d0 <RPI_WriteToMiniUart>
    84b8:	eafffff7 	b	849c <data_abort_vector+0x18>

000084bc <interrupt_vector>:
    84bc:	e24ee004 	sub	lr, lr, #4
    84c0:	e92d581f 	push	{r0, r1, r2, r3, r4, fp, ip, lr}
    84c4:	e28db01c 	add	fp, sp, #28
    84c8:	eb000040 	bl	85d0 <RPI_GetSystemTimer>
    84cc:	e1a03000 	mov	r3, r0
    84d0:	e5933000 	ldr	r3, [r3]
    84d4:	e3530000 	cmp	r3, #0
    84d8:	0a000016 	beq	8538 <interrupt_vector+0x7c>
    84dc:	eb00003b 	bl	85d0 <RPI_GetSystemTimer>
    84e0:	e1a03000 	mov	r3, r0
    84e4:	e5932000 	ldr	r2, [r3]
    84e8:	e3c22002 	bic	r2, r2, #2
    84ec:	e5832000 	str	r2, [r3]
    84f0:	eb000036 	bl	85d0 <RPI_GetSystemTimer>
    84f4:	e1a02000 	mov	r2, r0
    84f8:	e5923010 	ldr	r3, [r2, #16]
    84fc:	e2833b61 	add	r3, r3, #99328	; 0x18400
    8500:	e2833e2a 	add	r3, r3, #672	; 0x2a0
    8504:	e5823010 	str	r3, [r2, #16]
    8508:	e59f30a4 	ldr	r3, [pc, #164]	; 85b4 <interrupt_vector+0xf8>
    850c:	e5933000 	ldr	r3, [r3]
    8510:	e3530009 	cmp	r3, #9
    8514:	da000002 	ble	8524 <interrupt_vector+0x68>
    8518:	e59f3094 	ldr	r3, [pc, #148]	; 85b4 <interrupt_vector+0xf8>
    851c:	e3a02000 	mov	r2, #0
    8520:	e5832000 	str	r2, [r3]
    8524:	e59f3088 	ldr	r3, [pc, #136]	; 85b4 <interrupt_vector+0xf8>
    8528:	e5933000 	ldr	r3, [r3]
    852c:	e2833001 	add	r3, r3, #1
    8530:	e59f207c 	ldr	r2, [pc, #124]	; 85b4 <interrupt_vector+0xf8>
    8534:	e5823000 	str	r3, [r2]
    8538:	e59f3078 	ldr	r3, [pc, #120]	; 85b8 <interrupt_vector+0xfc>
    853c:	e5933000 	ldr	r3, [r3]
    8540:	e5933000 	ldr	r3, [r3]
    8544:	e3530000 	cmp	r3, #0
    8548:	0a000016 	beq	85a8 <interrupt_vector+0xec>
    854c:	ebffff28 	bl	81f4 <RPI_GetArmTimer>
    8550:	e1a02000 	mov	r2, r0
    8554:	e3a03001 	mov	r3, #1
    8558:	e582300c 	str	r3, [r2, #12]
    855c:	e59f3058 	ldr	r3, [pc, #88]	; 85bc <interrupt_vector+0x100>
    8560:	e5933000 	ldr	r3, [r3]
    8564:	e3530000 	cmp	r3, #0
    8568:	0a000007 	beq	858c <interrupt_vector+0xd0>
    856c:	ebffff2f 	bl	8230 <RPI_GetGpio>
    8570:	e1a02000 	mov	r2, r0
    8574:	e3a03801 	mov	r3, #65536	; 0x10000
    8578:	e582301c 	str	r3, [r2, #28]
    857c:	e59f3038 	ldr	r3, [pc, #56]	; 85bc <interrupt_vector+0x100>
    8580:	e3a02000 	mov	r2, #0
    8584:	e5832000 	str	r2, [r3]
    8588:	ea000006 	b	85a8 <interrupt_vector+0xec>
    858c:	ebffff27 	bl	8230 <RPI_GetGpio>
    8590:	e1a02000 	mov	r2, r0
    8594:	e3a03801 	mov	r3, #65536	; 0x10000
    8598:	e5823028 	str	r3, [r2, #40]	; 0x28
    859c:	e59f3018 	ldr	r3, [pc, #24]	; 85bc <interrupt_vector+0x100>
    85a0:	e3a02001 	mov	r2, #1
    85a4:	e5832000 	str	r2, [r3]
    85a8:	e320f000 	nop	{0}
    85ac:	e24bd01c 	sub	sp, fp, #28
    85b0:	e8fd981f 	ldm	sp!, {r0, r1, r2, r3, r4, fp, ip, pc}^
    85b4:	00008dec 	andeq	r8, r0, ip, ror #27
    85b8:	00008d9c 	muleq	r0, ip, sp
    85bc:	00008df0 	strdeq	r8, [r0], -r0

000085c0 <fast_interrupt_vector>:
    85c0:	e24db004 	sub	fp, sp, #4
    85c4:	e320f000 	nop	{0}
    85c8:	e28bd004 	add	sp, fp, #4
    85cc:	e25ef004 	subs	pc, lr, #4

000085d0 <RPI_GetSystemTimer>:
    85d0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    85d4:	e28db000 	add	fp, sp, #0
    85d8:	e59f3010 	ldr	r3, [pc, #16]	; 85f0 <RPI_GetSystemTimer+0x20>
    85dc:	e5933000 	ldr	r3, [r3]
    85e0:	e1a00003 	mov	r0, r3
    85e4:	e28bd000 	add	sp, fp, #0
    85e8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    85ec:	e12fff1e 	bx	lr
    85f0:	00008da0 	andeq	r8, r0, r0, lsr #27

000085f4 <RPI_WaitMicroSeconds>:
    85f4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    85f8:	e28db000 	add	fp, sp, #0
    85fc:	e24dd014 	sub	sp, sp, #20
    8600:	e50b0010 	str	r0, [fp, #-16]
    8604:	e59f303c 	ldr	r3, [pc, #60]	; 8648 <RPI_WaitMicroSeconds+0x54>
    8608:	e5933000 	ldr	r3, [r3]
    860c:	e5933004 	ldr	r3, [r3, #4]
    8610:	e50b3008 	str	r3, [fp, #-8]
    8614:	e320f000 	nop	{0}
    8618:	e59f3028 	ldr	r3, [pc, #40]	; 8648 <RPI_WaitMicroSeconds+0x54>
    861c:	e5933000 	ldr	r3, [r3]
    8620:	e5932004 	ldr	r2, [r3, #4]
    8624:	e51b3008 	ldr	r3, [fp, #-8]
    8628:	e0422003 	sub	r2, r2, r3
    862c:	e51b3010 	ldr	r3, [fp, #-16]
    8630:	e1520003 	cmp	r2, r3
    8634:	3afffff7 	bcc	8618 <RPI_WaitMicroSeconds+0x24>
    8638:	e320f000 	nop	{0}
    863c:	e28bd000 	add	sp, fp, #0
    8640:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8644:	e12fff1e 	bx	lr
    8648:	00008da0 	andeq	r8, r0, r0, lsr #27

0000864c <RPI_GetAux>:
    864c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8650:	e28db000 	add	fp, sp, #0
    8654:	e59f3010 	ldr	r3, [pc, #16]	; 866c <RPI_GetAux+0x20>
    8658:	e5933000 	ldr	r3, [r3]
    865c:	e1a00003 	mov	r0, r3
    8660:	e28bd000 	add	sp, fp, #0
    8664:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8668:	e12fff1e 	bx	lr
    866c:	00008da4 	andeq	r8, r0, r4, lsr #27

00008670 <RPI_GetMiniUart>:
    8670:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8674:	e28db000 	add	fp, sp, #0
    8678:	e59f3010 	ldr	r3, [pc, #16]	; 8690 <RPI_GetMiniUart+0x20>
    867c:	e5933000 	ldr	r3, [r3]
    8680:	e1a00003 	mov	r0, r3
    8684:	e28bd000 	add	sp, fp, #0
    8688:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    868c:	e12fff1e 	bx	lr
    8690:	00008da8 	andeq	r8, r0, r8, lsr #27

00008694 <RPI_MiniUartInit>:
    8694:	e92d4800 	push	{fp, lr}
    8698:	e28db004 	add	fp, sp, #4
    869c:	e24dd008 	sub	sp, sp, #8
    86a0:	ebfffee2 	bl	8230 <RPI_GetGpio>
    86a4:	e50b0008 	str	r0, [fp, #-8]
    86a8:	e59f3114 	ldr	r3, [pc, #276]	; 87c4 <RPI_MiniUartInit+0x130>
    86ac:	e5933000 	ldr	r3, [r3]
    86b0:	e59f210c 	ldr	r2, [pc, #268]	; 87c4 <RPI_MiniUartInit+0x130>
    86b4:	e5922000 	ldr	r2, [r2]
    86b8:	e5922004 	ldr	r2, [r2, #4]
    86bc:	e3822001 	orr	r2, r2, #1
    86c0:	e5832004 	str	r2, [r3, #4]
    86c4:	e59f30fc 	ldr	r3, [pc, #252]	; 87c8 <RPI_MiniUartInit+0x134>
    86c8:	e5933000 	ldr	r3, [r3]
    86cc:	e3a02000 	mov	r2, #0
    86d0:	e5832004 	str	r2, [r3, #4]
    86d4:	e59f30ec 	ldr	r3, [pc, #236]	; 87c8 <RPI_MiniUartInit+0x134>
    86d8:	e5933000 	ldr	r3, [r3]
    86dc:	e3a02000 	mov	r2, #0
    86e0:	e5832020 	str	r2, [r3, #32]
    86e4:	e59f30dc 	ldr	r3, [pc, #220]	; 87c8 <RPI_MiniUartInit+0x134>
    86e8:	e5933000 	ldr	r3, [r3]
    86ec:	e3a02003 	mov	r2, #3
    86f0:	e583200c 	str	r2, [r3, #12]
    86f4:	e59f30cc 	ldr	r3, [pc, #204]	; 87c8 <RPI_MiniUartInit+0x134>
    86f8:	e5933000 	ldr	r3, [r3]
    86fc:	e3a02000 	mov	r2, #0
    8700:	e5832010 	str	r2, [r3, #16]
    8704:	e59f30bc 	ldr	r3, [pc, #188]	; 87c8 <RPI_MiniUartInit+0x134>
    8708:	e5933000 	ldr	r3, [r3]
    870c:	e3a020c6 	mov	r2, #198	; 0xc6
    8710:	e5832008 	str	r2, [r3, #8]
    8714:	e59f30ac 	ldr	r3, [pc, #172]	; 87c8 <RPI_MiniUartInit+0x134>
    8718:	e5933000 	ldr	r3, [r3]
    871c:	e59f20a8 	ldr	r2, [pc, #168]	; 87cc <RPI_MiniUartInit+0x138>
    8720:	e5832028 	str	r2, [r3, #40]	; 0x28
    8724:	e3a01002 	mov	r1, #2
    8728:	e3a0000e 	mov	r0, #14
    872c:	ebfffec8 	bl	8254 <RPI_SetGpioPinFunction>
    8730:	e3a01002 	mov	r1, #2
    8734:	e3a0000f 	mov	r0, #15
    8738:	ebfffec5 	bl	8254 <RPI_SetGpioPinFunction>
    873c:	e51b3008 	ldr	r3, [fp, #-8]
    8740:	e3a02000 	mov	r2, #0
    8744:	e5832094 	str	r2, [r3, #148]	; 0x94
    8748:	e3a03000 	mov	r3, #0
    874c:	e50b300c 	str	r3, [fp, #-12]
    8750:	ea000002 	b	8760 <RPI_MiniUartInit+0xcc>
    8754:	e51b300c 	ldr	r3, [fp, #-12]
    8758:	e2833001 	add	r3, r3, #1
    875c:	e50b300c 	str	r3, [fp, #-12]
    8760:	e51b300c 	ldr	r3, [fp, #-12]
    8764:	e3530095 	cmp	r3, #149	; 0x95
    8768:	dafffff9 	ble	8754 <RPI_MiniUartInit+0xc0>
    876c:	e51b3008 	ldr	r3, [fp, #-8]
    8770:	e3a02903 	mov	r2, #49152	; 0xc000
    8774:	e5832098 	str	r2, [r3, #152]	; 0x98
    8778:	e3a03000 	mov	r3, #0
    877c:	e50b300c 	str	r3, [fp, #-12]
    8780:	ea000002 	b	8790 <RPI_MiniUartInit+0xfc>
    8784:	e51b300c 	ldr	r3, [fp, #-12]
    8788:	e2833001 	add	r3, r3, #1
    878c:	e50b300c 	str	r3, [fp, #-12]
    8790:	e51b300c 	ldr	r3, [fp, #-12]
    8794:	e3530095 	cmp	r3, #149	; 0x95
    8798:	dafffff9 	ble	8784 <RPI_MiniUartInit+0xf0>
    879c:	e51b3008 	ldr	r3, [fp, #-8]
    87a0:	e3a02000 	mov	r2, #0
    87a4:	e5832098 	str	r2, [r3, #152]	; 0x98
    87a8:	e59f3018 	ldr	r3, [pc, #24]	; 87c8 <RPI_MiniUartInit+0x134>
    87ac:	e5933000 	ldr	r3, [r3]
    87b0:	e3a02003 	mov	r2, #3
    87b4:	e5832020 	str	r2, [r3, #32]
    87b8:	e320f000 	nop	{0}
    87bc:	e24bd004 	sub	sp, fp, #4
    87c0:	e8bd8800 	pop	{fp, pc}
    87c4:	00008da4 	andeq	r8, r0, r4, lsr #27
    87c8:	00008da8 	andeq	r8, r0, r8, lsr #27
    87cc:	0000010e 	andeq	r0, r0, lr, lsl #2

000087d0 <RPI_WriteToMiniUart>:
    87d0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    87d4:	e28db000 	add	fp, sp, #0
    87d8:	e24dd00c 	sub	sp, sp, #12
    87dc:	e1a03000 	mov	r3, r0
    87e0:	e54b3005 	strb	r3, [fp, #-5]
    87e4:	e320f000 	nop	{0}
    87e8:	e59f3030 	ldr	r3, [pc, #48]	; 8820 <RPI_WriteToMiniUart+0x50>
    87ec:	e5933000 	ldr	r3, [r3]
    87f0:	e5933014 	ldr	r3, [r3, #20]
    87f4:	e2033020 	and	r3, r3, #32
    87f8:	e3530000 	cmp	r3, #0
    87fc:	0afffff9 	beq	87e8 <RPI_WriteToMiniUart+0x18>
    8800:	e59f3018 	ldr	r3, [pc, #24]	; 8820 <RPI_WriteToMiniUart+0x50>
    8804:	e5933000 	ldr	r3, [r3]
    8808:	e55b2005 	ldrb	r2, [fp, #-5]
    880c:	e5832000 	str	r2, [r3]
    8810:	e320f000 	nop	{0}
    8814:	e28bd000 	add	sp, fp, #0
    8818:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    881c:	e12fff1e 	bx	lr
    8820:	00008da8 	andeq	r8, r0, r8, lsr #27

00008824 <RPI_printStringOfLen>:
    8824:	e92d4800 	push	{fp, lr}
    8828:	e28db004 	add	fp, sp, #4
    882c:	e24dd010 	sub	sp, sp, #16
    8830:	e50b0010 	str	r0, [fp, #-16]
    8834:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    8838:	e3a03000 	mov	r3, #0
    883c:	e50b3008 	str	r3, [fp, #-8]
    8840:	ea000008 	b	8868 <RPI_printStringOfLen+0x44>
    8844:	e51b3010 	ldr	r3, [fp, #-16]
    8848:	e2832001 	add	r2, r3, #1
    884c:	e50b2010 	str	r2, [fp, #-16]
    8850:	e5d33000 	ldrb	r3, [r3]
    8854:	e1a00003 	mov	r0, r3
    8858:	ebffffdc 	bl	87d0 <RPI_WriteToMiniUart>
    885c:	e51b3008 	ldr	r3, [fp, #-8]
    8860:	e2833001 	add	r3, r3, #1
    8864:	e50b3008 	str	r3, [fp, #-8]
    8868:	e51b2008 	ldr	r2, [fp, #-8]
    886c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8870:	e1520003 	cmp	r2, r3
    8874:	bafffff2 	blt	8844 <RPI_printStringOfLen+0x20>
    8878:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    887c:	e1a00003 	mov	r0, r3
    8880:	e24bd004 	sub	sp, fp, #4
    8884:	e8bd8800 	pop	{fp, pc}

00008888 <RPI_printString>:
    8888:	e92d4800 	push	{fp, lr}
    888c:	e28db004 	add	fp, sp, #4
    8890:	e24dd008 	sub	sp, sp, #8
    8894:	e50b0008 	str	r0, [fp, #-8]
    8898:	ea000005 	b	88b4 <RPI_printString+0x2c>
    889c:	e51b3008 	ldr	r3, [fp, #-8]
    88a0:	e2832001 	add	r2, r3, #1
    88a4:	e50b2008 	str	r2, [fp, #-8]
    88a8:	e5d33000 	ldrb	r3, [r3]
    88ac:	e1a00003 	mov	r0, r3
    88b0:	ebffffc6 	bl	87d0 <RPI_WriteToMiniUart>
    88b4:	e51b3008 	ldr	r3, [fp, #-8]
    88b8:	e5d33000 	ldrb	r3, [r3]
    88bc:	e3530000 	cmp	r3, #0
    88c0:	1afffff5 	bne	889c <RPI_printString+0x14>
    88c4:	e320f000 	nop	{0}
    88c8:	e24bd004 	sub	sp, fp, #4
    88cc:	e8bd8800 	pop	{fp, pc}

000088d0 <RPI_ReadFromMiniUart>:
    88d0:	e92d4800 	push	{fp, lr}
    88d4:	e28db004 	add	fp, sp, #4
    88d8:	e24dd008 	sub	sp, sp, #8
    88dc:	e50b0008 	str	r0, [fp, #-8]
    88e0:	e50b100c 	str	r1, [fp, #-12]
    88e4:	e51b200c 	ldr	r2, [fp, #-12]
    88e8:	e51b1008 	ldr	r1, [fp, #-8]
    88ec:	e59f0010 	ldr	r0, [pc, #16]	; 8904 <RPI_ReadFromMiniUart+0x34>
    88f0:	eb00009e 	bl	8b70 <fifo_read>
    88f4:	e1a03000 	mov	r3, r0
    88f8:	e1a00003 	mov	r0, r3
    88fc:	e24bd004 	sub	sp, fp, #4
    8900:	e8bd8800 	pop	{fp, pc}
    8904:	00008df4 	strdeq	r8, [r0], -r4

00008908 <RPI_MiniUart_ISR>:
    8908:	e92d4800 	push	{fp, lr}
    890c:	e28db004 	add	fp, sp, #4
    8910:	e24dd008 	sub	sp, sp, #8
    8914:	e59f30c4 	ldr	r3, [pc, #196]	; 89e0 <RPI_MiniUart_ISR+0xd8>
    8918:	e5933000 	ldr	r3, [r3]
    891c:	e5933008 	ldr	r3, [r3, #8]
    8920:	e2033004 	and	r3, r3, #4
    8924:	e3530000 	cmp	r3, #0
    8928:	0a000016 	beq	8988 <RPI_MiniUart_ISR+0x80>
    892c:	e59f30ac 	ldr	r3, [pc, #172]	; 89e0 <RPI_MiniUart_ISR+0xd8>
    8930:	e5933000 	ldr	r3, [r3]
    8934:	e5933000 	ldr	r3, [r3]
    8938:	e50b3008 	str	r3, [fp, #-8]
    893c:	e59f309c 	ldr	r3, [pc, #156]	; 89e0 <RPI_MiniUart_ISR+0xd8>
    8940:	e5933000 	ldr	r3, [r3]
    8944:	e51b2008 	ldr	r2, [fp, #-8]
    8948:	e5832000 	str	r2, [r3]
    894c:	e59f308c 	ldr	r3, [pc, #140]	; 89e0 <RPI_MiniUart_ISR+0xd8>
    8950:	e5933000 	ldr	r3, [r3]
    8954:	e59f2084 	ldr	r2, [pc, #132]	; 89e0 <RPI_MiniUart_ISR+0xd8>
    8958:	e5922000 	ldr	r2, [r2]
    895c:	e5922004 	ldr	r2, [r2, #4]
    8960:	e3822001 	orr	r2, r2, #1
    8964:	e5832004 	str	r2, [r3, #4]
    8968:	e51b3008 	ldr	r3, [fp, #-8]
    896c:	e6ef3073 	uxtb	r3, r3
    8970:	e54b3009 	strb	r3, [fp, #-9]
    8974:	e24b3009 	sub	r3, fp, #9
    8978:	e3a02001 	mov	r2, #1
    897c:	e1a01003 	mov	r1, r3
    8980:	e59f005c 	ldr	r0, [pc, #92]	; 89e4 <RPI_MiniUart_ISR+0xdc>
    8984:	eb0000b2 	bl	8c54 <fifo_write>
    8988:	e59f3050 	ldr	r3, [pc, #80]	; 89e0 <RPI_MiniUart_ISR+0xd8>
    898c:	e5933000 	ldr	r3, [r3]
    8990:	e5933008 	ldr	r3, [r3, #8]
    8994:	e2033002 	and	r3, r3, #2
    8998:	e3530000 	cmp	r3, #0
    899c:	0a00000c 	beq	89d4 <RPI_MiniUart_ISR+0xcc>
    89a0:	e59f3038 	ldr	r3, [pc, #56]	; 89e0 <RPI_MiniUart_ISR+0xd8>
    89a4:	e5933000 	ldr	r3, [r3]
    89a8:	e5933014 	ldr	r3, [r3, #20]
    89ac:	e2033040 	and	r3, r3, #64	; 0x40
    89b0:	e3530000 	cmp	r3, #0
    89b4:	0a000006 	beq	89d4 <RPI_MiniUart_ISR+0xcc>
    89b8:	e59f3020 	ldr	r3, [pc, #32]	; 89e0 <RPI_MiniUart_ISR+0xd8>
    89bc:	e5933000 	ldr	r3, [r3]
    89c0:	e59f2018 	ldr	r2, [pc, #24]	; 89e0 <RPI_MiniUart_ISR+0xd8>
    89c4:	e5922000 	ldr	r2, [r2]
    89c8:	e5922004 	ldr	r2, [r2, #4]
    89cc:	e3c22001 	bic	r2, r2, #1
    89d0:	e5832004 	str	r2, [r3, #4]
    89d4:	e320f000 	nop	{0}
    89d8:	e24bd004 	sub	sp, fp, #4
    89dc:	e8bd8800 	pop	{fp, pc}
    89e0:	00008da8 	andeq	r8, r0, r8, lsr #27
    89e4:	00008df4 	strdeq	r8, [r0], -r4

000089e8 <shell_main>:
    89e8:	e92d4800 	push	{fp, lr}
    89ec:	e28db004 	add	fp, sp, #4
    89f0:	e24dd018 	sub	sp, sp, #24
    89f4:	ebffff1d 	bl	8670 <RPI_GetMiniUart>
    89f8:	e50b0010 	str	r0, [fp, #-16]
    89fc:	e24b301c 	sub	r3, fp, #28
    8a00:	e50b300c 	str	r3, [fp, #-12]
    8a04:	e59f007c 	ldr	r0, [pc, #124]	; 8a88 <shell_main+0xa0>
    8a08:	ebffff9e 	bl	8888 <RPI_printString>
    8a0c:	e3a03000 	mov	r3, #0
    8a10:	e50b3008 	str	r3, [fp, #-8]
    8a14:	ea000015 	b	8a70 <shell_main+0x88>
    8a18:	e320f000 	nop	{0}
    8a1c:	e51b3010 	ldr	r3, [fp, #-16]
    8a20:	e5933014 	ldr	r3, [r3, #20]
    8a24:	e2033001 	and	r3, r3, #1
    8a28:	e3530000 	cmp	r3, #0
    8a2c:	0afffffa 	beq	8a1c <shell_main+0x34>
    8a30:	e51b3010 	ldr	r3, [fp, #-16]
    8a34:	e5933000 	ldr	r3, [r3]
    8a38:	e6ef2073 	uxtb	r2, r3
    8a3c:	e51b300c 	ldr	r3, [fp, #-12]
    8a40:	e5c32000 	strb	r2, [r3]
    8a44:	e51b300c 	ldr	r3, [fp, #-12]
    8a48:	e5d33000 	ldrb	r3, [r3]
    8a4c:	e1a02003 	mov	r2, r3
    8a50:	e51b3010 	ldr	r3, [fp, #-16]
    8a54:	e5832000 	str	r2, [r3]
    8a58:	e51b300c 	ldr	r3, [fp, #-12]
    8a5c:	e2833001 	add	r3, r3, #1
    8a60:	e50b300c 	str	r3, [fp, #-12]
    8a64:	e51b3008 	ldr	r3, [fp, #-8]
    8a68:	e2833001 	add	r3, r3, #1
    8a6c:	e50b3008 	str	r3, [fp, #-8]
    8a70:	e51b3008 	ldr	r3, [fp, #-8]
    8a74:	e3530009 	cmp	r3, #9
    8a78:	daffffe6 	ble	8a18 <shell_main+0x30>
    8a7c:	e59f0008 	ldr	r0, [pc, #8]	; 8a8c <shell_main+0xa4>
    8a80:	ebffff80 	bl	8888 <RPI_printString>
    8a84:	eaffffde 	b	8a04 <shell_main+0x1c>
    8a88:	00008dac 	andeq	r8, r0, ip, lsr #27
    8a8c:	00008dd0 	ldrdeq	r8, [r0], -r0

00008a90 <SVC_Handler_Main>:
    8a90:	e92d4800 	push	{fp, lr}
    8a94:	e28db004 	add	fp, sp, #4
    8a98:	e24dd018 	sub	sp, sp, #24
    8a9c:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    8aa0:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    8aa4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8aa8:	e3530000 	cmp	r3, #0
    8aac:	1a00000e 	bne	8aec <SVC_Handler_Main+0x5c>
    8ab0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    8ab4:	e5933000 	ldr	r3, [r3]
    8ab8:	e50b3008 	str	r3, [fp, #-8]
    8abc:	ebfffeeb 	bl	8670 <RPI_GetMiniUart>
    8ac0:	e50b000c 	str	r0, [fp, #-12]
    8ac4:	e320f000 	nop	{0}
    8ac8:	e51b300c 	ldr	r3, [fp, #-12]
    8acc:	e5933014 	ldr	r3, [r3, #20]
    8ad0:	e2033020 	and	r3, r3, #32
    8ad4:	e3530000 	cmp	r3, #0
    8ad8:	0afffffa 	beq	8ac8 <SVC_Handler_Main+0x38>
    8adc:	e51b300c 	ldr	r3, [fp, #-12]
    8ae0:	e51b2008 	ldr	r2, [fp, #-8]
    8ae4:	e5832000 	str	r2, [r3]
    8ae8:	ea00000d 	b	8b24 <SVC_Handler_Main+0x94>
    8aec:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8af0:	e3530001 	cmp	r3, #1
    8af4:	1a000004 	bne	8b0c <SVC_Handler_Main+0x7c>
    8af8:	ebfffdcc 	bl	8230 <RPI_GetGpio>
    8afc:	e1a02000 	mov	r2, r0
    8b00:	e3a03801 	mov	r3, #65536	; 0x10000
    8b04:	e5823028 	str	r3, [r2, #40]	; 0x28
    8b08:	ea000005 	b	8b24 <SVC_Handler_Main+0x94>
    8b0c:	e3a03033 	mov	r3, #51	; 0x33
    8b10:	e54b300d 	strb	r3, [fp, #-13]
    8b14:	e55b300d 	ldrb	r3, [fp, #-13]
    8b18:	e1a00003 	mov	r0, r3
    8b1c:	ebffff2b 	bl	87d0 <RPI_WriteToMiniUart>
    8b20:	eafffffb 	b	8b14 <SVC_Handler_Main+0x84>
    8b24:	e24bd004 	sub	sp, fp, #4
    8b28:	e8bd8800 	pop	{fp, pc}

00008b2c <fifo_init>:
    8b2c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8b30:	e28db000 	add	fp, sp, #0
    8b34:	e24dd00c 	sub	sp, sp, #12
    8b38:	e50b0008 	str	r0, [fp, #-8]
    8b3c:	e51b3008 	ldr	r3, [fp, #-8]
    8b40:	e3a02000 	mov	r2, #0
    8b44:	e583200c 	str	r2, [r3, #12]
    8b48:	e51b3008 	ldr	r3, [fp, #-8]
    8b4c:	e3a02000 	mov	r2, #0
    8b50:	e5832010 	str	r2, [r3, #16]
    8b54:	e51b3008 	ldr	r3, [fp, #-8]
    8b58:	e3a0200a 	mov	r2, #10
    8b5c:	e5832014 	str	r2, [r3, #20]
    8b60:	e320f000 	nop	{0}
    8b64:	e28bd000 	add	sp, fp, #0
    8b68:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8b6c:	e12fff1e 	bx	lr

00008b70 <fifo_read>:
    8b70:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8b74:	e28db000 	add	fp, sp, #0
    8b78:	e24dd01c 	sub	sp, sp, #28
    8b7c:	e50b0010 	str	r0, [fp, #-16]
    8b80:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    8b84:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    8b88:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8b8c:	e50b300c 	str	r3, [fp, #-12]
    8b90:	e3a03000 	mov	r3, #0
    8b94:	e50b3008 	str	r3, [fp, #-8]
    8b98:	ea000024 	b	8c30 <fifo_read+0xc0>
    8b9c:	e51b3010 	ldr	r3, [fp, #-16]
    8ba0:	e5932010 	ldr	r2, [r3, #16]
    8ba4:	e51b3010 	ldr	r3, [fp, #-16]
    8ba8:	e593300c 	ldr	r3, [r3, #12]
    8bac:	e1520003 	cmp	r2, r3
    8bb0:	0a000019 	beq	8c1c <fifo_read+0xac>
    8bb4:	e51b300c 	ldr	r3, [fp, #-12]
    8bb8:	e2832001 	add	r2, r3, #1
    8bbc:	e50b200c 	str	r2, [fp, #-12]
    8bc0:	e51b2010 	ldr	r2, [fp, #-16]
    8bc4:	e5922010 	ldr	r2, [r2, #16]
    8bc8:	e51b1010 	ldr	r1, [fp, #-16]
    8bcc:	e7d12002 	ldrb	r2, [r1, r2]
    8bd0:	e5c32000 	strb	r2, [r3]
    8bd4:	e51b3010 	ldr	r3, [fp, #-16]
    8bd8:	e5933010 	ldr	r3, [r3, #16]
    8bdc:	e2832001 	add	r2, r3, #1
    8be0:	e51b3010 	ldr	r3, [fp, #-16]
    8be4:	e5832010 	str	r2, [r3, #16]
    8be8:	e51b3010 	ldr	r3, [fp, #-16]
    8bec:	e5932010 	ldr	r2, [r3, #16]
    8bf0:	e51b3010 	ldr	r3, [fp, #-16]
    8bf4:	e5933014 	ldr	r3, [r3, #20]
    8bf8:	e1520003 	cmp	r2, r3
    8bfc:	1a000002 	bne	8c0c <fifo_read+0x9c>
    8c00:	e51b3010 	ldr	r3, [fp, #-16]
    8c04:	e3a02000 	mov	r2, #0
    8c08:	e5832010 	str	r2, [r3, #16]
    8c0c:	e51b3008 	ldr	r3, [fp, #-8]
    8c10:	e2833001 	add	r3, r3, #1
    8c14:	e50b3008 	str	r3, [fp, #-8]
    8c18:	ea000001 	b	8c24 <fifo_read+0xb4>
    8c1c:	e51b3008 	ldr	r3, [fp, #-8]
    8c20:	ea000007 	b	8c44 <fifo_read+0xd4>
    8c24:	e51b3008 	ldr	r3, [fp, #-8]
    8c28:	e2833001 	add	r3, r3, #1
    8c2c:	e50b3008 	str	r3, [fp, #-8]
    8c30:	e51b2008 	ldr	r2, [fp, #-8]
    8c34:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8c38:	e1520003 	cmp	r2, r3
    8c3c:	baffffd6 	blt	8b9c <fifo_read+0x2c>
    8c40:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8c44:	e1a00003 	mov	r0, r3
    8c48:	e28bd000 	add	sp, fp, #0
    8c4c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8c50:	e12fff1e 	bx	lr

00008c54 <fifo_write>:
    8c54:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8c58:	e28db000 	add	fp, sp, #0
    8c5c:	e24dd01c 	sub	sp, sp, #28
    8c60:	e50b0010 	str	r0, [fp, #-16]
    8c64:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    8c68:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    8c6c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8c70:	e50b300c 	str	r3, [fp, #-12]
    8c74:	e3a03000 	mov	r3, #0
    8c78:	e50b3008 	str	r3, [fp, #-8]
    8c7c:	ea00002c 	b	8d34 <fifo_write+0xe0>
    8c80:	e51b3010 	ldr	r3, [fp, #-16]
    8c84:	e593300c 	ldr	r3, [r3, #12]
    8c88:	e2832001 	add	r2, r3, #1
    8c8c:	e51b3010 	ldr	r3, [fp, #-16]
    8c90:	e5933010 	ldr	r3, [r3, #16]
    8c94:	e1520003 	cmp	r2, r3
    8c98:	0a00000a 	beq	8cc8 <fifo_write+0x74>
    8c9c:	e51b3010 	ldr	r3, [fp, #-16]
    8ca0:	e593300c 	ldr	r3, [r3, #12]
    8ca4:	e2832001 	add	r2, r3, #1
    8ca8:	e51b3010 	ldr	r3, [fp, #-16]
    8cac:	e5933014 	ldr	r3, [r3, #20]
    8cb0:	e1520003 	cmp	r2, r3
    8cb4:	1a000005 	bne	8cd0 <fifo_write+0x7c>
    8cb8:	e51b3010 	ldr	r3, [fp, #-16]
    8cbc:	e5933010 	ldr	r3, [r3, #16]
    8cc0:	e3530000 	cmp	r3, #0
    8cc4:	1a000001 	bne	8cd0 <fifo_write+0x7c>
    8cc8:	e51b3008 	ldr	r3, [fp, #-8]
    8ccc:	ea00001d 	b	8d48 <fifo_write+0xf4>
    8cd0:	e51b3010 	ldr	r3, [fp, #-16]
    8cd4:	e593200c 	ldr	r2, [r3, #12]
    8cd8:	e51b300c 	ldr	r3, [fp, #-12]
    8cdc:	e2831001 	add	r1, r3, #1
    8ce0:	e50b100c 	str	r1, [fp, #-12]
    8ce4:	e5d31000 	ldrb	r1, [r3]
    8ce8:	e51b3010 	ldr	r3, [fp, #-16]
    8cec:	e7c31002 	strb	r1, [r3, r2]
    8cf0:	e51b3010 	ldr	r3, [fp, #-16]
    8cf4:	e593300c 	ldr	r3, [r3, #12]
    8cf8:	e2832001 	add	r2, r3, #1
    8cfc:	e51b3010 	ldr	r3, [fp, #-16]
    8d00:	e583200c 	str	r2, [r3, #12]
    8d04:	e51b3010 	ldr	r3, [fp, #-16]
    8d08:	e593200c 	ldr	r2, [r3, #12]
    8d0c:	e51b3010 	ldr	r3, [fp, #-16]
    8d10:	e5933014 	ldr	r3, [r3, #20]
    8d14:	e1520003 	cmp	r2, r3
    8d18:	1a000002 	bne	8d28 <fifo_write+0xd4>
    8d1c:	e51b3010 	ldr	r3, [fp, #-16]
    8d20:	e3a02000 	mov	r2, #0
    8d24:	e583200c 	str	r2, [r3, #12]
    8d28:	e51b3008 	ldr	r3, [fp, #-8]
    8d2c:	e2833001 	add	r3, r3, #1
    8d30:	e50b3008 	str	r3, [fp, #-8]
    8d34:	e51b2008 	ldr	r2, [fp, #-8]
    8d38:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8d3c:	e1520003 	cmp	r2, r3
    8d40:	baffffce 	blt	8c80 <fifo_write+0x2c>
    8d44:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8d48:	e1a00003 	mov	r0, r3
    8d4c:	e28bd000 	add	sp, fp, #0
    8d50:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8d54:	e12fff1e 	bx	lr

00008d58 <_svc_handler>:
    8d58:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
    8d5c:	e51e0004 	ldr	r0, [lr, #-4]
    8d60:	e3c004ff 	bic	r0, r0, #-16777216	; 0xff000000
    8d64:	e1a0100d 	mov	r1, sp
    8d68:	e3500002 	cmp	r0, #2
    8d6c:	dbffff47 	blle	8a90 <SVC_Handler_Main>
    8d70:	e8bd5fff 	pop	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
    8d74:	e1b0f00e 	movs	pc, lr

Disassembly of section .rodata:

00008d78 <.rodata>:
    8d78:	74530d0a 	ldrbvc	r0, [r3], #-3338	; 0xfffff2f6
    8d7c:	69747261 	ldmdbvs	r4!, {r0, r5, r6, r9, ip, sp, lr}^
    8d80:	7320676e 			; <UNDEFINED> instruction: 0x7320676e
    8d84:	6c6c6568 	cfstr64vs	mvdx6, [ip], #-416	; 0xfffffe60
    8d88:	6f727020 	svcvs	0x00727020
    8d8c:	6d617267 	sfmvs	f7, 2, [r1, #-412]!	; 0xfffffe64
    8d90:	002e2e2e 	eoreq	r2, lr, lr, lsr #28

Disassembly of section .data:

00008d94 <__data_start>:
    8d94:	2000b400 	andcs	fp, r0, r0, lsl #8

00008d98 <rpiGpio>:
    8d98:	20200000 	eorcs	r0, r0, r0

00008d9c <rpiIRQController>:
    8d9c:	2000b200 	andcs	fp, r0, r0, lsl #4

00008da0 <rpiSystemTimer>:
    8da0:	20003000 	andcs	r3, r0, r0

00008da4 <rpiAux>:
    8da4:	20215000 	eorcs	r5, r1, r0

00008da8 <rpiMiniUart>:
    8da8:	20215040 	eorcs	r5, r1, r0, asr #32

00008dac <enter_command_text.6883>:
    8dac:	65746e45 	ldrbvs	r6, [r4, #-3653]!	; 0xfffff1bb
    8db0:	6f632072 	svcvs	0x00632072
    8db4:	6e616d6d 	cdpvs	13, 6, cr6, cr1, cr13, {3}
    8db8:	61282064 			; <UNDEFINED> instruction: 0x61282064
    8dbc:	6520646e 	strvs	r6, [r0, #-1134]!	; 0xfffffb92
    8dc0:	7720646e 	strvc	r6, [r0, -lr, ror #8]!
    8dc4:	20687469 	rsbcs	r7, r8, r9, ror #8
    8dc8:	203a293b 	eorscs	r2, sl, fp, lsr r9
    8dcc:	00000000 	andeq	r0, r0, r0

00008dd0 <command_not_found_text.6882>:
    8dd0:	206f4e0a 	rsbcs	r4, pc, sl, lsl #28
    8dd4:	68637573 	stmdavs	r3!, {r0, r1, r4, r5, r6, r8, sl, ip, sp, lr}^
    8dd8:	6d6f6320 	stclvs	3, cr6, [pc, #-128]!	; 8d60 <_svc_handler+0x8>
    8ddc:	646e616d 	strbtvs	r6, [lr], #-365	; 0xfffffe93
    8de0:	756f6620 	strbvc	r6, [pc, #-1568]!	; 87c8 <RPI_MiniUartInit+0x134>
    8de4:	0d2e646e 	cfstrseq	mvf6, [lr, #-440]!	; 0xfffffe48
    8de8:	Address 0x0000000000008de8 is out of bounds.


Disassembly of section .bss:

00008dec <msCounter.5513>:
    8dec:	00000000 	andeq	r0, r0, r0

00008df0 <lit.5512>:
    8df0:	00000000 	andeq	r0, r0, r0

00008df4 <fifo_buffer>:
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
  10:	000080a8 	andeq	r8, r0, r8, lsr #1
  14:	0000006c 	andeq	r0, r0, ip, rrx
	...
  20:	0000001c 	andeq	r0, r0, ip, lsl r0
  24:	00a50002 	adceq	r0, r5, r2
  28:	00040000 	andeq	r0, r4, r0
  2c:	00000000 	andeq	r0, r0, r0
  30:	00008114 	andeq	r8, r0, r4, lsl r1
  34:	00000048 	andeq	r0, r0, r8, asr #32
	...
  40:	0000001c 	andeq	r0, r0, ip, lsl r0
  44:	016d0002 	cmneq	sp, r2
  48:	00040000 	andeq	r0, r4, r0
  4c:	00000000 	andeq	r0, r0, r0
  50:	0000815c 	andeq	r8, r0, ip, asr r1
  54:	00000098 	muleq	r0, r8, r0
	...
  60:	0000001c 	andeq	r0, r0, ip, lsl r0
  64:	023b0002 	eorseq	r0, fp, #2
  68:	00040000 	andeq	r0, r4, r0
  6c:	00000000 	andeq	r0, r0, r0
  70:	000081f4 	strdeq	r8, [r0], -r4
  74:	0000003c 	andeq	r0, r0, ip, lsr r0
	...
  80:	0000001c 	andeq	r0, r0, ip, lsl r0
  84:	037b0002 	cmneq	fp, #2
  88:	00040000 	andeq	r0, r4, r0
  8c:	00000000 	andeq	r0, r0, r0
  90:	00008230 	andeq	r8, r0, r0, lsr r2
  94:	00000158 	andeq	r0, r0, r8, asr r1
	...
  a0:	0000001c 	andeq	r0, r0, ip, lsl r0
  a4:	08590002 	ldmdaeq	r9, {r1}^
  a8:	00040000 	andeq	r0, r4, r0
  ac:	00000000 	andeq	r0, r0, r0
  b0:	00008388 	andeq	r8, r0, r8, lsl #7
  b4:	00000248 	andeq	r0, r0, r8, asr #4
	...
  c0:	0000001c 	andeq	r0, r0, ip, lsl r0
  c4:	0a980002 	beq	fe6000d4 <CPSR_UNAFFECTED_BITS+0xfe6001d4>
  c8:	00040000 	andeq	r0, r4, r0
  cc:	00000000 	andeq	r0, r0, r0
  d0:	000085d0 	ldrdeq	r8, [r0], -r0
  d4:	0000007c 	andeq	r0, r0, ip, ror r0
	...
  e0:	0000001c 	andeq	r0, r0, ip, lsl r0
  e4:	0bdf0002 	bleq	ff7c00f4 <CPSR_UNAFFECTED_BITS+0xff7c01f4>
  e8:	00040000 	andeq	r0, r4, r0
  ec:	00000000 	andeq	r0, r0, r0
  f0:	0000864c 	andeq	r8, r0, ip, asr #12
  f4:	0000039c 	muleq	r0, ip, r3
	...
 100:	0000001c 	andeq	r0, r0, ip, lsl r0
 104:	12d60002 	sbcsne	r0, r6, #2
 108:	00040000 	andeq	r0, r4, r0
 10c:	00000000 	andeq	r0, r0, r0
 110:	000089e8 	andeq	r8, r0, r8, ror #19
 114:	000000a8 	andeq	r0, r0, r8, lsr #1
	...
 120:	0000001c 	andeq	r0, r0, ip, lsl r0
 124:	1ccd0002 	stclne	0, cr0, [sp], {2}
 128:	00040000 	andeq	r0, r4, r0
 12c:	00000000 	andeq	r0, r0, r0
 130:	00008a90 	muleq	r0, r0, sl
 134:	0000009c 	muleq	r0, ip, r0
	...
 140:	0000001c 	andeq	r0, r0, ip, lsl r0
 144:	1e8a0002 	cdpne	0, 8, cr0, cr10, cr2, {0}
 148:	00040000 	andeq	r0, r4, r0
 14c:	00000000 	andeq	r0, r0, r0
 150:	00008b2c 	andeq	r8, r0, ip, lsr #22
 154:	0000022c 	andeq	r0, r0, ip, lsr #4
	...
 160:	0000001c 	andeq	r0, r0, ip, lsl r0
 164:	204a0002 	subcs	r0, sl, r2
 168:	00040000 	andeq	r0, r4, r0
 16c:	00000000 	andeq	r0, r0, r0
 170:	00008000 	andeq	r8, r0, r0
 174:	000000a8 	andeq	r0, r0, r8, lsr #1
	...
 180:	0000001c 	andeq	r0, r0, ip, lsl r0
 184:	20ba0002 	adcscs	r0, sl, r2
 188:	00040000 	andeq	r0, r4, r0
 18c:	00000000 	andeq	r0, r0, r0
 190:	00008d58 	andeq	r8, r0, r8, asr sp
 194:	00000020 	andeq	r0, r0, r0, lsr #32
	...

Disassembly of section .debug_info:

00000000 <.debug_info>:
       0:	000000a1 	andeq	r0, r0, r1, lsr #1
       4:	00000004 	andeq	r0, r0, r4
       8:	01040000 	mrseq	r0, (UNDEF: 4)
       c:	00000044 	andeq	r0, r0, r4, asr #32
      10:	00000c0c 	andeq	r0, r0, ip, lsl #24
      14:	0080a800 	addeq	sl, r0, r0, lsl #16
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
      44:	0080a806 	addeq	sl, r0, r6, lsl #16
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
      a4:	0000c400 	andeq	ip, r0, r0, lsl #8
      a8:	89000400 	stmdbhi	r0, {sl}
      ac:	04000000 	streq	r0, [r0], #-0
      b0:	00004401 	andeq	r4, r0, r1, lsl #8
      b4:	01380c00 	teqeq	r8, r0, lsl #24
      b8:	81140000 	tsthi	r4, r0
      bc:	00480000 	subeq	r0, r8, r0
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
     128:	00812418 	addeq	r2, r1, r8, lsl r4
     12c:	00003800 	andeq	r3, r0, r0, lsl #16
     130:	af9c0100 	svcge	0x009c0100
     134:	06000000 	streq	r0, [r0], -r0
     138:	000000b6 	strheq	r0, [r0], -r6
     13c:	00af1a01 	adceq	r1, pc, r1, lsl #20
     140:	91020000 	mrsls	r0, (UNDEF: 2)
     144:	00fc0677 	rscseq	r0, ip, r7, ror r6
     148:	1b010000 	blne	40150 <__bss_end__+0x37344>
     14c:	00000072 	andeq	r0, r0, r2, ror r0
     150:	00709102 	rsbseq	r9, r0, r2, lsl #2
     154:	c9080102 	stmdbgt	r8, {r1, r8}
     158:	07000000 	streq	r0, [r0, -r0]
     15c:	000000ec 	andeq	r0, r0, ip, ror #1
     160:	81140c01 	tsthi	r4, r1, lsl #24
     164:	00100000 	andseq	r0, r0, r0
     168:	9c010000 	stcls	0, cr0, [r1], {-0}
     16c:	0000ca00 	andeq	ip, r0, r0, lsl #20
     170:	ff000400 			; <UNDEFINED> instruction: 0xff000400
     174:	04000000 	streq	r0, [r0], #-0
     178:	00004401 	andeq	r4, r0, r1, lsl #8
     17c:	017a0c00 	cmneq	sl, r0, lsl #24
     180:	815c0000 	cmphi	ip, r0
     184:	00980000 	addseq	r0, r8, r0
     188:	012e0000 			; <UNDEFINED> instruction: 0x012e0000
     18c:	01020000 	mrseq	r0, (UNDEF: 2)
     190:	0000c206 	andeq	ip, r0, r6, lsl #4
     194:	08010200 	stmdaeq	r1, {r9}
     198:	000000c0 	andeq	r0, r0, r0, asr #1
     19c:	2e050202 	cdpcs	2, 0, cr0, cr5, cr2, {0}
     1a0:	02000001 	andeq	r0, r0, #1
     1a4:	00ce0702 	sbceq	r0, lr, r2, lsl #14
     1a8:	04020000 	streq	r0, [r2], #-0
     1ac:	00012505 	andeq	r2, r1, r5, lsl #10
     1b0:	07040200 	streq	r0, [r4, -r0, lsl #4]
     1b4:	0000010e 	andeq	r0, r0, lr, lsl #2
     1b8:	20050802 	andcs	r0, r5, r2, lsl #16
     1bc:	02000001 	andeq	r0, r0, #1
     1c0:	01090708 	tsteq	r9, r8, lsl #14
     1c4:	04030000 	streq	r0, [r3], #-0
     1c8:	746e6905 	strbtvc	r6, [lr], #-2309	; 0xfffff6fb
     1cc:	07040200 	streq	r0, [r4, -r0, lsl #4]
     1d0:	00000113 	andeq	r0, r0, r3, lsl r1
     1d4:	b2070402 	andlt	r0, r7, #33554432	; 0x2000000
     1d8:	02000001 	andeq	r0, r0, #1
     1dc:	00c90801 	sbceq	r0, r9, r1, lsl #16
     1e0:	a6040000 	strge	r0, [r4], -r0
     1e4:	01000001 	tsteq	r0, r1
     1e8:	00815c10 	addeq	r5, r1, r0, lsl ip
     1ec:	00009800 	andeq	r9, r0, r0, lsl #16
     1f0:	c19c0100 	orrsgt	r0, ip, r0, lsl #2
     1f4:	05000000 	streq	r0, [r0, #-0]
     1f8:	01003072 	tsteq	r0, r2, ror r0
     1fc:	00006010 	andeq	r6, r0, r0, lsl r0
     200:	54910200 	ldrpl	r0, [r1], #512	; 0x200
     204:	00317205 	eorseq	r7, r1, r5, lsl #4
     208:	00601001 	rsbeq	r1, r0, r1
     20c:	91020000 	mrsls	r0, (UNDEF: 2)
     210:	01630650 	cmneq	r3, r0, asr r6
     214:	10010000 	andne	r0, r1, r0
     218:	00000060 	andeq	r0, r0, r0, rrx
     21c:	074c9102 	strbeq	r9, [ip, -r2, lsl #2]
     220:	00000169 	andeq	r0, r0, r9, ror #2
     224:	00c13401 	sbceq	r3, r1, r1, lsl #8
     228:	91020000 	mrsls	r0, (UNDEF: 2)
     22c:	6e08005c 	mcrvs	0, 0, r0, cr8, cr12, {2}
     230:	09000000 	stmdbeq	r0, {}	; <UNPREDICTABLE>
     234:	00000067 	andeq	r0, r0, r7, rrx
     238:	3c00001b 	stccc	0, cr0, [r0], {27}
     23c:	04000001 	streq	r0, [r0], #-1
     240:	00017e00 	andeq	r7, r1, r0, lsl #28
     244:	44010400 	strmi	r0, [r1], #-1024	; 0xfffffc00
     248:	0c000000 	stceq	0, cr0, [r0], {-0}
     24c:	000001d7 	ldrdeq	r0, [r0], -r7
     250:	000081f4 	strdeq	r8, [r0], -r4
     254:	0000003c 	andeq	r0, r0, ip, lsr r0
     258:	0000019d 	muleq	r0, sp, r1
     25c:	c2060102 	andgt	r0, r6, #-2147483648	; 0x80000000
     260:	02000000 	andeq	r0, r0, #0
     264:	00c00801 	sbceq	r0, r0, r1, lsl #16
     268:	02020000 	andeq	r0, r2, #0
     26c:	00012e05 	andeq	r2, r1, r5, lsl #28
     270:	07020200 	streq	r0, [r2, -r0, lsl #4]
     274:	000000ce 	andeq	r0, r0, lr, asr #1
     278:	25050402 	strcs	r0, [r5, #-1026]	; 0xfffffbfe
     27c:	03000001 	movweq	r0, #1
     280:	000000e1 	andeq	r0, r0, r1, ror #1
     284:	004f4102 	subeq	r4, pc, r2, lsl #2
     288:	04020000 	streq	r0, [r2], #-0
     28c:	00010e07 	andeq	r0, r1, r7, lsl #28
     290:	05080200 	streq	r0, [r8, #-512]	; 0xfffffe00
     294:	00000120 	andeq	r0, r0, r0, lsr #2
     298:	09070802 	stmdbeq	r7, {r1, fp}
     29c:	04000001 	streq	r0, [r0], #-1
     2a0:	6e690504 	cdpvs	5, 6, cr0, cr9, cr4, {0}
     2a4:	04020074 	streq	r0, [r2], #-116	; 0xffffff8c
     2a8:	00011307 	andeq	r1, r1, r7, lsl #6
     2ac:	00e30300 	rsceq	r0, r3, r0, lsl #6
     2b0:	30030000 	andcc	r0, r3, r0
     2b4:	00000044 	andeq	r0, r0, r4, asr #32
     2b8:	00007205 	andeq	r7, r0, r5, lsl #4
     2bc:	04240600 	strteq	r0, [r4], #-1536	; 0xfffffa00
     2c0:	0000f728 	andeq	pc, r0, r8, lsr #14
     2c4:	01bb0700 			; <UNDEFINED> instruction: 0x01bb0700
     2c8:	2e040000 	cdpcs	0, 0, cr0, cr4, cr0, {0}
     2cc:	0000007d 	andeq	r0, r0, sp, ror r0
     2d0:	02360700 	eorseq	r0, r6, #0, 14
     2d4:	35040000 	strcc	r0, [r4, #-0]
     2d8:	0000007d 	andeq	r0, r0, sp, ror r0
     2dc:	025a0704 	subseq	r0, sl, #4, 14	; 0x100000
     2e0:	3c040000 	stccc	0, cr0, [r4], {-0}
     2e4:	0000007d 	andeq	r0, r0, sp, ror r0
     2e8:	02730708 	rsbseq	r0, r3, #8, 14	; 0x200000
     2ec:	41040000 	mrsmi	r0, (UNDEF: 4)
     2f0:	0000007d 	andeq	r0, r0, sp, ror r0
     2f4:	0225070c 	eoreq	r0, r5, #12, 14	; 0x300000
     2f8:	4b040000 	blmi	100300 <_heap+0x802fc>
     2fc:	0000007d 	andeq	r0, r0, sp, ror r0
     300:	022c0710 	eoreq	r0, ip, #16, 14	; 0x400000
     304:	52040000 	andpl	r0, r4, #0
     308:	0000007d 	andeq	r0, r0, sp, ror r0
     30c:	01c00714 	biceq	r0, r0, r4, lsl r7
     310:	59040000 	stmdbpl	r4, {}	; <UNPREDICTABLE>
     314:	0000007d 	andeq	r0, r0, sp, ror r0
     318:	023c0718 	eorseq	r0, ip, #24, 14	; 0x600000
     31c:	64040000 	strvs	r0, [r4], #-0
     320:	0000007d 	andeq	r0, r0, sp, ror r0
     324:	0247071c 	subeq	r0, r7, #28, 14	; 0x700000
     328:	72040000 	andvc	r0, r4, #0
     32c:	0000007d 	andeq	r0, r0, sp, ror r0
     330:	09030020 	stmdbeq	r3, {r5}
     334:	04000002 	streq	r0, [r0], #-2
     338:	00008274 	andeq	r8, r0, r4, ror r2
     33c:	02190800 	andseq	r0, r9, #0, 16
     340:	0e010000 	cdpeq	0, 0, cr0, cr1, cr0, {0}
     344:	00000113 	andeq	r0, r0, r3, lsl r1
     348:	8d940305 	ldchi	3, cr0, [r4, #20]
     34c:	04090000 	streq	r0, [r9], #-0
     350:	000000f7 	strdeq	r0, [r0], -r7
     354:	0002620a 	andeq	r6, r2, sl, lsl #4
     358:	18150100 	ldmdane	r5, {r8}
     35c:	18000082 	stmdane	r0, {r1, r7}
     360:	01000000 	mrseq	r0, (UNDEF: 0)
     364:	01c70b9c 			; <UNDEFINED> instruction: 0x01c70b9c
     368:	10010000 	andne	r0, r1, r0
     36c:	00000113 	andeq	r0, r0, r3, lsl r1
     370:	000081f4 	strdeq	r8, [r0], -r4
     374:	00000024 	andeq	r0, r0, r4, lsr #32
     378:	da009c01 	ble	27384 <__bss_end__+0x1e578>
     37c:	04000004 	streq	r0, [r0], #-4
     380:	00022000 	andeq	r2, r2, r0
     384:	44010400 	strmi	r0, [r1], #-1024	; 0xfffffc00
     388:	0c000000 	stceq	0, cr0, [r0], {-0}
     38c:	000005e9 	andeq	r0, r0, r9, ror #11
     390:	00008230 	andeq	r8, r0, r0, lsr r2
     394:	00000158 	andeq	r0, r0, r8, asr r1
     398:	00000297 	muleq	r0, r7, r2
     39c:	c2060102 	andgt	r0, r6, #-2147483648	; 0x80000000
     3a0:	02000000 	andeq	r0, r0, #0
     3a4:	00c00801 	sbceq	r0, r0, r1, lsl #16
     3a8:	02020000 	andeq	r0, r2, #0
     3ac:	00012e05 	andeq	r2, r1, r5, lsl #28
     3b0:	07020200 	streq	r0, [r2, -r0, lsl #4]
     3b4:	000000ce 	andeq	r0, r0, lr, asr #1
     3b8:	25050402 	strcs	r0, [r5, #-1026]	; 0xfffffbfe
     3bc:	03000001 	movweq	r0, #1
     3c0:	000000e1 	andeq	r0, r0, r1, ror #1
     3c4:	004f4102 	subeq	r4, pc, r2, lsl #2
     3c8:	04020000 	streq	r0, [r2], #-0
     3cc:	00010e07 	andeq	r0, r1, r7, lsl #28
     3d0:	05080200 	streq	r0, [r8, #-512]	; 0xfffffe00
     3d4:	00000120 	andeq	r0, r0, r0, lsr #2
     3d8:	09070802 	stmdbeq	r7, {r1, fp}
     3dc:	04000001 	streq	r0, [r0], #-1
     3e0:	6e690504 	cdpvs	5, 6, cr0, cr9, cr4, {0}
     3e4:	04020074 	streq	r0, [r2], #-116	; 0xffffff8c
     3e8:	00011307 	andeq	r1, r1, r7, lsl #6
     3ec:	00e30300 	rsceq	r0, r3, r0, lsl #6
     3f0:	30030000 	andcc	r0, r3, r0
     3f4:	00000044 	andeq	r0, r0, r4, asr #32
     3f8:	00007205 	andeq	r7, r0, r5, lsl #4
     3fc:	007d0600 	rsbseq	r0, sp, r0, lsl #12
     400:	8a030000 	bhi	c0408 <_heap+0x40404>
     404:	04000005 	streq	r0, [r0], #-5
     408:	00007d12 	andeq	r7, r0, r2, lsl sp
     40c:	05000300 	streq	r0, [r0, #-768]	; 0xfffffd00
     410:	13040000 	movwne	r0, #16384	; 0x4000
     414:	00000082 	andeq	r0, r0, r2, lsl #1
     418:	0006ad03 	andeq	sl, r6, r3, lsl #26
     41c:	7d140400 	cfldrsvc	mvf0, [r4, #-0]
     420:	07000000 	streq	r0, [r0, -r0]
     424:	00002801 	andeq	r2, r0, r1, lsl #16
     428:	e5420500 	strb	r0, [r2, #-1280]	; 0xfffffb00
     42c:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
     430:	000005d6 	ldrdeq	r0, [r0], -r6
     434:	04db0800 	ldrbeq	r0, [fp], #2048	; 0x800
     438:	08010000 	stmdaeq	r1, {}	; <UNPREDICTABLE>
     43c:	00000718 	andeq	r0, r0, r8, lsl r7
     440:	07100802 	ldreq	r0, [r0, -r2, lsl #16]
     444:	08030000 	stmdaeq	r3, {}	; <UNPREDICTABLE>
     448:	000006f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>
     44c:	06f80804 	ldrbteq	r0, [r8], r4, lsl #16
     450:	08050000 	stmdaeq	r5, {}	; <UNPREDICTABLE>
     454:	00000700 	andeq	r0, r0, r0, lsl #14
     458:	07080806 	streq	r0, [r8, -r6, lsl #16]
     45c:	00070000 	andeq	r0, r7, r0
     460:	0005b403 	andeq	fp, r5, r3, lsl #8
     464:	a84b0500 	stmdage	fp, {r8, sl}^
     468:	07000000 	streq	r0, [r0, -r0]
     46c:	00002801 	andeq	r2, r0, r1, lsl #16
     470:	41510500 	cmpmi	r1, r0, lsl #10
     474:	08000002 	stmdaeq	r0, {r1}
     478:	0000049f 	muleq	r0, pc, r4	; <UNPREDICTABLE>
     47c:	04a90800 	strteq	r0, [r9], #2048	; 0x800
     480:	08010000 	stmdaeq	r1, {}	; <UNPREDICTABLE>
     484:	000004b3 			; <UNDEFINED> instruction: 0x000004b3
     488:	06820802 	streq	r0, [r2], r2, lsl #16
     48c:	08030000 	stmdaeq	r3, {}	; <UNPREDICTABLE>
     490:	000004bd 			; <UNDEFINED> instruction: 0x000004bd
     494:	04c70804 	strbeq	r0, [r7], #2052	; 0x804
     498:	08050000 	stmdaeq	r5, {}	; <UNPREDICTABLE>
     49c:	000004d1 	ldrdeq	r0, [r0], -r1
     4a0:	05cc0806 	strbeq	r0, [ip, #2054]	; 0x806
     4a4:	08070000 	stmdaeq	r7, {}	; <UNPREDICTABLE>
     4a8:	000004e5 	andeq	r0, r0, r5, ror #9
     4ac:	04ef0808 	strbteq	r0, [pc], #2056	; 4b4 <CPSR_IRQ_INHIBIT+0x434>
     4b0:	08090000 	stmdaeq	r9, {}	; <UNPREDICTABLE>
     4b4:	000003cf 	andeq	r0, r0, pc, asr #7
     4b8:	03da080a 	bicseq	r0, sl, #655360	; 0xa0000
     4bc:	080b0000 	stmdaeq	fp, {}	; <UNPREDICTABLE>
     4c0:	000003e5 	andeq	r0, r0, r5, ror #7
     4c4:	03f0080c 	mvnseq	r0, #12, 16	; 0xc0000
     4c8:	080d0000 	stmdaeq	sp, {}	; <UNPREDICTABLE>
     4cc:	000003fb 	strdeq	r0, [r0], -fp
     4d0:	0406080e 	streq	r0, [r6], #-2062	; 0xfffff7f2
     4d4:	080f0000 	stmdaeq	pc, {}	; <UNPREDICTABLE>
     4d8:	00000411 	andeq	r0, r0, r1, lsl r4
     4dc:	041c0810 	ldreq	r0, [ip], #-2064	; 0xfffff7f0
     4e0:	08110000 	ldmdaeq	r1, {}	; <UNPREDICTABLE>
     4e4:	00000427 	andeq	r0, r0, r7, lsr #8
     4e8:	04320812 	ldrteq	r0, [r2], #-2066	; 0xfffff7ee
     4ec:	08130000 	ldmdaeq	r3, {}	; <UNPREDICTABLE>
     4f0:	0000034e 	andeq	r0, r0, lr, asr #6
     4f4:	050d0814 	streq	r0, [sp, #-2068]	; 0xfffff7ec
     4f8:	08150000 	ldmdaeq	r5, {}	; <UNPREDICTABLE>
     4fc:	00000518 	andeq	r0, r0, r8, lsl r5
     500:	05230816 	streq	r0, [r3, #-2070]!	; 0xfffff7ea
     504:	08170000 	ldmdaeq	r7, {}	; <UNPREDICTABLE>
     508:	0000052e 	andeq	r0, r0, lr, lsr #10
     50c:	05390818 	ldreq	r0, [r9, #-2072]!	; 0xfffff7e8
     510:	08190000 	ldmdaeq	r9, {}	; <UNPREDICTABLE>
     514:	00000544 	andeq	r0, r0, r4, asr #10
     518:	054f081a 	strbeq	r0, [pc, #-2074]	; fffffd06 <CPSR_UNAFFECTED_BITS+0xfffffe06>
     51c:	081b0000 	ldmdaeq	fp, {}	; <UNPREDICTABLE>
     520:	0000055a 	andeq	r0, r0, sl, asr r5
     524:	0565081c 	strbeq	r0, [r5, #-2076]!	; 0xfffff7e4
     528:	081d0000 	ldmdaeq	sp, {}	; <UNPREDICTABLE>
     52c:	00000661 	andeq	r0, r0, r1, ror #12
     530:	066c081e 			; <UNDEFINED> instruction: 0x066c081e
     534:	081f0000 	ldmdaeq	pc, {}	; <UNPREDICTABLE>
     538:	00000677 	andeq	r0, r0, r7, ror r6
     53c:	06170820 	ldreq	r0, [r7], -r0, lsr #16
     540:	08210000 	stmdaeq	r1!, {}	; <UNPREDICTABLE>
     544:	0000068c 	andeq	r0, r0, ip, lsl #13
     548:	06970822 	ldreq	r0, [r7], r2, lsr #16
     54c:	08230000 	stmdaeq	r3!, {}	; <UNPREDICTABLE>
     550:	000006a2 	andeq	r0, r0, r2, lsr #13
     554:	063a0824 	ldrteq	r0, [sl], -r4, lsr #16
     558:	08250000 	stmdaeq	r5!, {}	; <UNPREDICTABLE>
     55c:	000006ba 			; <UNDEFINED> instruction: 0x000006ba
     560:	06c50826 	strbeq	r0, [r5], r6, lsr #16
     564:	08270000 	stmdaeq	r7!, {}	; <UNPREDICTABLE>
     568:	000002c9 	andeq	r0, r0, r9, asr #5
     56c:	03c40828 	biceq	r0, r4, #40, 16	; 0x280000
     570:	08290000 	stmdaeq	r9!, {}	; <UNPREDICTABLE>
     574:	000002d4 	ldrdeq	r0, [r0], -r4
     578:	02df082a 	sbcseq	r0, pc, #2752512	; 0x2a0000
     57c:	082b0000 	stmdaeq	fp!, {}	; <UNPREDICTABLE>
     580:	000002ea 	andeq	r0, r0, sl, ror #5
     584:	02f5082c 	rscseq	r0, r5, #44, 16	; 0x2c0000
     588:	082d0000 	stmdaeq	sp!, {}	; <UNPREDICTABLE>
     58c:	00000300 	andeq	r0, r0, r0, lsl #6
     590:	030b082e 	movweq	r0, #47150	; 0xb82e
     594:	082f0000 	stmdaeq	pc!, {}	; <UNPREDICTABLE>
     598:	00000316 	andeq	r0, r0, r6, lsl r3
     59c:	03210830 			; <UNDEFINED> instruction: 0x03210830
     5a0:	08310000 	ldmdaeq	r1!, {}	; <UNPREDICTABLE>
     5a4:	00000446 	andeq	r0, r0, r6, asr #8
     5a8:	04510832 	ldrbeq	r0, [r1], #-2098	; 0xfffff7ce
     5ac:	08330000 	ldmdaeq	r3!, {}	; <UNPREDICTABLE>
     5b0:	00000656 	andeq	r0, r0, r6, asr r6
     5b4:	045c0834 	ldrbeq	r0, [ip], #-2100	; 0xfffff7cc
     5b8:	00350000 	eorseq	r0, r5, r0
     5bc:	00047903 	andeq	r7, r4, r3, lsl #18
     5c0:	f0880500 			; <UNDEFINED> instruction: 0xf0880500
     5c4:	09000000 	stmdbeq	r0, {}	; <UNPREDICTABLE>
     5c8:	419b05a4 	orrsmi	r0, fp, r4, lsr #11
     5cc:	0a000004 	beq	5e4 <CPSR_IRQ_INHIBIT+0x564>
     5d0:	0000028a 	andeq	r0, r0, sl, lsl #5
     5d4:	00879c05 	addeq	r9, r7, r5, lsl #24
     5d8:	0a000000 	beq	5e0 <CPSR_IRQ_INHIBIT+0x560>
     5dc:	00000292 	muleq	r0, r2, r2
     5e0:	00879d05 	addeq	r9, r7, r5, lsl #26
     5e4:	0a040000 	beq	1005ec <_heap+0x805e8>
     5e8:	0000029a 	muleq	r0, sl, r2
     5ec:	00879e05 	addeq	r9, r7, r5, lsl #28
     5f0:	0a080000 	beq	2005f8 <_heap+0x1805f4>
     5f4:	000002a2 	andeq	r0, r0, r2, lsr #5
     5f8:	00879f05 	addeq	r9, r7, r5, lsl #30
     5fc:	0a0c0000 	beq	300604 <_heap+0x280600>
     600:	000002aa 	andeq	r0, r0, sl, lsr #5
     604:	0087a005 	addeq	sl, r7, r5
     608:	0a100000 	beq	400610 <_heap+0x38060c>
     60c:	000002b2 			; <UNDEFINED> instruction: 0x000002b2
     610:	0087a105 	addeq	sl, r7, r5, lsl #2
     614:	0a140000 	beq	50061c <_heap+0x480618>
     618:	00000370 	andeq	r0, r0, r0, ror r3
     61c:	0092a205 	addseq	sl, r2, r5, lsl #4
     620:	0a180000 	beq	600628 <_heap+0x580624>
     624:	0000027c 	andeq	r0, r0, ip, ror r2
     628:	009da305 	addseq	sl, sp, r5, lsl #6
     62c:	0a1c0000 	beq	700634 <_heap+0x680630>
     630:	00000283 	andeq	r0, r0, r3, lsl #5
     634:	009da405 	addseq	sl, sp, r5, lsl #8
     638:	0a200000 	beq	800640 <_heap+0x78063c>
     63c:	0000037a 	andeq	r0, r0, sl, ror r3
     640:	0092a505 	addseq	sl, r2, r5, lsl #10
     644:	0a240000 	beq	90064c <_heap+0x880648>
     648:	0000072b 	andeq	r0, r0, fp, lsr #14
     64c:	009da605 	addseq	sl, sp, r5, lsl #12
     650:	0a280000 	beq	a00658 <_heap+0x980654>
     654:	000004f9 	strdeq	r0, [r0], -r9
     658:	009da705 	addseq	sl, sp, r5, lsl #14
     65c:	0a2c0000 	beq	b00664 <_heap+0xa80660>
     660:	00000384 	andeq	r0, r0, r4, lsl #7
     664:	0092a805 	addseq	sl, r2, r5, lsl #16
     668:	0a300000 	beq	c00670 <_heap+0xb8066c>
     66c:	00000622 	andeq	r0, r0, r2, lsr #12
     670:	009da905 	addseq	sl, sp, r5, lsl #18
     674:	0a340000 	beq	d0067c <_heap+0xc80678>
     678:	00000629 	andeq	r0, r0, r9, lsr #12
     67c:	009daa05 	addseq	sl, sp, r5, lsl #20
     680:	0a380000 	beq	e00688 <_heap+0xd80684>
     684:	0000038e 	andeq	r0, r0, lr, lsl #7
     688:	0092ab05 	addseq	sl, r2, r5, lsl #22
     68c:	0a3c0000 	beq	f00694 <_heap+0xe80690>
     690:	000003a2 	andeq	r0, r0, r2, lsr #7
     694:	009dac05 	addseq	sl, sp, r5, lsl #24
     698:	0a400000 	beq	10006a0 <_heap+0xf8069c>
     69c:	000003a9 	andeq	r0, r0, r9, lsr #7
     6a0:	009dad05 	addseq	sl, sp, r5, lsl #26
     6a4:	0a440000 	beq	11006ac <_heap+0x10806a8>
     6a8:	00000630 	andeq	r0, r0, r0, lsr r6
     6ac:	0092ae05 	addseq	sl, r2, r5, lsl #28
     6b0:	0a480000 	beq	12006b8 <_heap+0x11806b4>
     6b4:	00000339 	andeq	r0, r0, r9, lsr r3
     6b8:	009daf05 	addseq	sl, sp, r5, lsl #30
     6bc:	0a4c0000 	beq	13006c4 <_heap+0x12806c0>
     6c0:	00000340 	andeq	r0, r0, r0, asr #6
     6c4:	009db005 	addseq	fp, sp, r5
     6c8:	0a500000 	beq	14006d0 <_heap+0x13806cc>
     6cc:	00000398 	muleq	r0, r8, r3
     6d0:	0092b105 	addseq	fp, r2, r5, lsl #2
     6d4:	0a540000 	beq	15006dc <_heap+0x14806d8>
     6d8:	000006e9 	andeq	r0, r0, r9, ror #13
     6dc:	009db205 	addseq	fp, sp, r5, lsl #4
     6e0:	0a580000 	beq	16006e8 <_heap+0x15806e4>
     6e4:	000002ba 			; <UNDEFINED> instruction: 0x000002ba
     6e8:	009db305 	addseq	fp, sp, r5, lsl #6
     6ec:	0a5c0000 	beq	17006f4 <_heap+0x16806f0>
     6f0:	00000645 	andeq	r0, r0, r5, asr #12
     6f4:	0092b405 	addseq	fp, r2, r5, lsl #8
     6f8:	0a600000 	beq	1800700 <_heap+0x17806fc>
     6fc:	00000347 	andeq	r0, r0, r7, asr #6
     700:	009db505 	addseq	fp, sp, r5, lsl #10
     704:	0a640000 	beq	190070c <_heap+0x1880708>
     708:	0000064f 	andeq	r0, r0, pc, asr #12
     70c:	009db605 	addseq	fp, sp, r5, lsl #12
     710:	0a680000 	beq	1a00718 <_heap+0x1980714>
     714:	000006d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
     718:	0092b705 	addseq	fp, r2, r5, lsl #14
     71c:	0a6c0000 	beq	1b00724 <_heap+0x1a80720>
     720:	00000488 	andeq	r0, r0, r8, lsl #9
     724:	009db805 	addseq	fp, sp, r5, lsl #16
     728:	0a700000 	beq	1c00730 <_heap+0x1b8072c>
     72c:	00000583 	andeq	r0, r0, r3, lsl #11
     730:	009db905 	addseq	fp, sp, r5, lsl #18
     734:	0a740000 	beq	1d0073c <_heap+0x1c80738>
     738:	000003b0 			; <UNDEFINED> instruction: 0x000003b0
     73c:	0092ba05 	addseq	fp, r2, r5, lsl #20
     740:	0a780000 	beq	1e00748 <_heap+0x1d80744>
     744:	0000057b 	andeq	r0, r0, fp, ror r5
     748:	009dbb05 	addseq	fp, sp, r5, lsl #22
     74c:	0a7c0000 	beq	1f00754 <_heap+0x1e80750>
     750:	000005ac 	andeq	r0, r0, ip, lsr #11
     754:	009dbc05 	addseq	fp, sp, r5, lsl #24
     758:	0a800000 	beq	fe000760 <CPSR_UNAFFECTED_BITS+0xfe000860>
     75c:	000003ba 			; <UNDEFINED> instruction: 0x000003ba
     760:	0092bd05 	addseq	fp, r2, r5, lsl #26
     764:	0a840000 	beq	fe10076c <CPSR_UNAFFECTED_BITS+0xfe10086c>
     768:	0000048f 	andeq	r0, r0, pc, lsl #9
     76c:	009dbe05 	addseq	fp, sp, r5, lsl #28
     770:	0a880000 	beq	fe200778 <CPSR_UNAFFECTED_BITS+0xfe200878>
     774:	00000497 	muleq	r0, r7, r4
     778:	009dbf05 	addseq	fp, sp, r5, lsl #30
     77c:	0a8c0000 	beq	fe300784 <CPSR_UNAFFECTED_BITS+0xfe300884>
     780:	000005a1 	andeq	r0, r0, r1, lsr #11
     784:	0092c005 	addseq	ip, r2, r5
     788:	0a900000 	beq	fe400790 <CPSR_UNAFFECTED_BITS+0xfe400890>
     78c:	00000467 	andeq	r0, r0, r7, ror #8
     790:	009dc105 	addseq	ip, sp, r5, lsl #2
     794:	0a940000 	beq	fe50079c <CPSR_UNAFFECTED_BITS+0xfe50089c>
     798:	00000597 	muleq	r0, r7, r5
     79c:	009dc205 	addseq	ip, sp, r5, lsl #4
     7a0:	0a980000 	beq	fe6007a8 <CPSR_UNAFFECTED_BITS+0xfe6008a8>
     7a4:	000005df 	ldrdeq	r0, [r0], -pc	; <UNPREDICTABLE>
     7a8:	009dc305 	addseq	ip, sp, r5, lsl #6
     7ac:	0a9c0000 	beq	fe7007b4 <CPSR_UNAFFECTED_BITS+0xfe7008b4>
     7b0:	00000570 	andeq	r0, r0, r0, ror r5
     7b4:	0092c405 	addseq	ip, r2, r5, lsl #8
     7b8:	00a00000 	adceq	r0, r0, r0
     7bc:	00072003 	andeq	r2, r7, r3
     7c0:	4cc50500 	cfstr64mi	mvdx0, [r5], {0}
     7c4:	0b000002 	bleq	7d4 <CPSR_IRQ_INHIBIT+0x754>
     7c8:	000002c1 	andeq	r0, r0, r1, asr #5
     7cc:	045d0e01 	ldrbeq	r0, [sp], #-3585	; 0xfffff1ff
     7d0:	03050000 	movweq	r0, #20480	; 0x5000
     7d4:	00008d98 	muleq	r0, r8, sp
     7d8:	0441040c 	strbeq	r0, [r1], #-1036	; 0xfffffbf4
     7dc:	2c0d0000 	stccs	0, cr0, [sp], {-0}
     7e0:	01000003 	tsteq	r0, r3
     7e4:	00837020 	addeq	r7, r3, r0, lsr #32
     7e8:	00001800 	andeq	r1, r0, r0, lsl #16
     7ec:	0e9c0100 	fmleqe	f0, f4, f0
     7f0:	00000359 	andeq	r0, r0, r9, asr r3
     7f4:	82541701 	subshi	r1, r4, #262144	; 0x40000
     7f8:	011c0000 	tsteq	ip, r0
     7fc:	9c010000 	stcls	0, cr0, [r1], {-0}
     800:	000004c2 	andeq	r0, r0, r2, asr #9
     804:	0006e40f 	andeq	lr, r6, pc, lsl #8
     808:	41170100 	tstmi	r7, r0, lsl #2
     80c:	02000002 	andeq	r0, r0, #2
     810:	560f6f91 			; <UNDEFINED> instruction: 0x560f6f91
     814:	0100000f 	tsteq	r0, pc
     818:	0000e517 	andeq	lr, r0, r7, lsl r5
     81c:	6e910200 	cdpvs	2, 9, cr0, cr1, cr0, {0}
     820:	00043d0b 	andeq	r3, r4, fp, lsl #26
     824:	c2190100 	andsgt	r0, r9, #0, 2
     828:	02000004 	andeq	r0, r0, #4
     82c:	da0b7491 	ble	2dda78 <_heap+0x25da74>
     830:	01000006 	tsteq	r0, r6
     834:	0000871a 	andeq	r8, r0, sl, lsl r7
     838:	70910200 	addsvc	r0, r1, r0, lsl #4
     83c:	87040c00 	strhi	r0, [r4, -r0, lsl #24]
     840:	10000000 	andne	r0, r0, r0
     844:	0000046d 	andeq	r0, r0, sp, ror #8
     848:	045d1001 	ldrbeq	r1, [sp], #-1
     84c:	82300000 	eorshi	r0, r0, #0
     850:	00240000 	eoreq	r0, r4, r0
     854:	9c010000 	stcls	0, cr0, [r1], {-0}
     858:	00023b00 	andeq	r3, r2, r0, lsl #22
     85c:	0a000400 	beq	1864 <CPSR_IRQ_INHIBIT+0x17e4>
     860:	04000003 	streq	r0, [r0], #-3
     864:	00004401 	andeq	r4, r0, r1, lsl #8
     868:	07e90c00 	strbeq	r0, [r9, r0, lsl #24]!
     86c:	83880000 	orrhi	r0, r8, #0
     870:	02480000 	subeq	r0, r8, #0
     874:	03a30000 			; <UNDEFINED> instruction: 0x03a30000
     878:	01020000 	mrseq	r0, (UNDEF: 2)
     87c:	0000c206 	andeq	ip, r0, r6, lsl #4
     880:	08010200 	stmdaeq	r1, {r9}
     884:	000000c0 	andeq	r0, r0, r0, asr #1
     888:	2e050202 	cdpcs	2, 0, cr0, cr5, cr2, {0}
     88c:	02000001 	andeq	r0, r0, #1
     890:	00ce0702 	sbceq	r0, lr, r2, lsl #14
     894:	04020000 	streq	r0, [r2], #-0
     898:	00012505 	andeq	r2, r1, r5, lsl #10
     89c:	00e10300 	rsceq	r0, r1, r0, lsl #6
     8a0:	41020000 	mrsmi	r0, (UNDEF: 2)
     8a4:	0000004f 	andeq	r0, r0, pc, asr #32
     8a8:	0e070402 	cdpeq	4, 0, cr0, cr7, cr2, {0}
     8ac:	02000001 	andeq	r0, r0, #1
     8b0:	01200508 			; <UNDEFINED> instruction: 0x01200508
     8b4:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
     8b8:	00010907 	andeq	r0, r1, r7, lsl #18
     8bc:	05040400 	streq	r0, [r4, #-1024]	; 0xfffffc00
     8c0:	00746e69 	rsbseq	r6, r4, r9, ror #28
     8c4:	13070402 	movwne	r0, #29698	; 0x7402
     8c8:	03000001 	movweq	r0, #1
     8cc:	000000e3 	andeq	r0, r0, r3, ror #1
     8d0:	00443003 	subeq	r3, r4, r3
     8d4:	72050000 	andvc	r0, r5, #0
     8d8:	06000000 	streq	r0, [r0], -r0
     8dc:	032f0428 			; <UNDEFINED> instruction: 0x032f0428
     8e0:	07000001 	streq	r0, [r0, -r1]
     8e4:	000007a2 	andeq	r0, r0, r2, lsr #15
     8e8:	007d3004 	rsbseq	r3, sp, r4
     8ec:	07000000 	streq	r0, [r0, -r0]
     8f0:	000008bf 			; <UNDEFINED> instruction: 0x000008bf
     8f4:	007d3104 	rsbseq	r3, sp, r4, lsl #2
     8f8:	07040000 	streq	r0, [r4, -r0]
     8fc:	00000839 	andeq	r0, r0, r9, lsr r8
     900:	007d3204 	rsbseq	r3, sp, r4, lsl #4
     904:	07080000 	streq	r0, [r8, -r0]
     908:	00000796 	muleq	r0, r6, r7
     90c:	007d3304 	rsbseq	r3, sp, r4, lsl #6
     910:	070c0000 	streq	r0, [ip, -r0]
     914:	000007cd 	andeq	r0, r0, sp, asr #15
     918:	007d3404 	rsbseq	r3, sp, r4, lsl #8
     91c:	07100000 	ldreq	r0, [r0, -r0]
     920:	000007db 	ldrdeq	r0, [r0], -fp
     924:	007d3504 	rsbseq	r3, sp, r4, lsl #10
     928:	07140000 	ldreq	r0, [r4, -r0]
     92c:	000007bb 			; <UNDEFINED> instruction: 0x000007bb
     930:	007d3604 	rsbseq	r3, sp, r4, lsl #12
     934:	07180000 	ldreq	r0, [r8, -r0]
     938:	0000088b 	andeq	r0, r0, fp, lsl #17
     93c:	007d3704 	rsbseq	r3, sp, r4, lsl #14
     940:	071c0000 	ldreq	r0, [ip, -r0]
     944:	0000089a 	muleq	r0, sl, r8
     948:	007d3804 	rsbseq	r3, sp, r4, lsl #16
     94c:	07200000 	streq	r0, [r0, -r0]!
     950:	00000783 	andeq	r0, r0, r3, lsl #15
     954:	007d3904 	rsbseq	r3, sp, r4, lsl #18
     958:	00240000 	eoreq	r0, r4, r0
     95c:	00075d03 	andeq	r5, r7, r3, lsl #26
     960:	823a0400 	eorshi	r0, sl, #0, 8
     964:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
     968:	00000772 	andeq	r0, r0, r2, ror r7
     96c:	011f1601 	tsteq	pc, r1, lsl #12
     970:	03050000 	movweq	r0, #20480	; 0x5000
     974:	00008d9c 	muleq	r0, ip, sp
     978:	01030409 	tsteq	r3, r9, lsl #8
     97c:	a90a0000 	stmdbge	sl, {}	; <UNPREDICTABLE>
     980:	01000008 	tsteq	r0, r8
     984:	0085c0ec 	addeq	ip, r5, ip, ror #1
     988:	00001000 	andeq	r1, r0, r0
     98c:	0b9c0100 	bleq	fe700d94 <CPSR_UNAFFECTED_BITS+0xfe700e94>
     990:	0000087a 	andeq	r0, r0, sl, ror r8
     994:	84bc7f01 	ldrthi	r7, [ip], #3841	; 0xf01
     998:	01040000 	mrseq	r0, (UNDEF: 4)
     99c:	9c010000 	stcls	0, cr0, [r1], {-0}
     9a0:	0000016e 	andeq	r0, r0, lr, ror #2
     9a4:	74696c0c 	strbtvc	r6, [r9], #-3084	; 0xfffff3f4
     9a8:	64810100 	strvs	r0, [r1], #256	; 0x100
     9ac:	05000000 	streq	r0, [r0, #-0]
     9b0:	008df003 	addeq	pc, sp, r3
     9b4:	082f0800 	stmdaeq	pc!, {fp}	; <UNPREDICTABLE>
     9b8:	82010000 	andhi	r0, r1, #0
     9bc:	00000064 	andeq	r0, r0, r4, rrx
     9c0:	8dec0305 	stclhi	3, cr0, [ip, #20]!
     9c4:	0d000000 	stceq	0, cr0, [r0, #-0]
     9c8:	0000081d 	andeq	r0, r0, sp, lsl r8
     9cc:	84846d01 	strhi	r6, [r4], #3329	; 0xd01
     9d0:	00380000 	eorseq	r0, r8, r0
     9d4:	9c010000 	stcls	0, cr0, [r1], {-0}
     9d8:	00000192 	muleq	r0, r2, r1
     9dc:	0007b408 	andeq	fp, r7, r8, lsl #8
     9e0:	926f0100 	rsbls	r0, pc, #0, 2
     9e4:	02000001 	andeq	r0, r0, #1
     9e8:	02005f91 	andeq	r5, r0, #580	; 0x244
     9ec:	00c90801 	sbceq	r0, r9, r1, lsl #16
     9f0:	320d0000 	andcc	r0, sp, #0
     9f4:	01000007 	tsteq	r0, r7
     9f8:	00844c5c 	addeq	r4, r4, ip, asr ip
     9fc:	00003800 	andeq	r3, r0, r0, lsl #16
     a00:	bd9c0100 	ldflts	f0, [ip]
     a04:	08000001 	stmdaeq	r0, {r0}
     a08:	000007b4 			; <UNDEFINED> instruction: 0x000007b4
     a0c:	01925e01 	orrseq	r5, r2, r1, lsl #28
     a10:	91020000 	mrsls	r0, (UNDEF: 2)
     a14:	710d005f 	qaddvc	r0, pc, sp	; <UNPREDICTABLE>
     a18:	01000008 	tsteq	r0, r8
     a1c:	0084184b 	addeq	r1, r4, fp, asr #16
     a20:	00003400 	andeq	r3, r0, r0, lsl #8
     a24:	e19c0100 	orrs	r0, ip, r0, lsl #2
     a28:	08000001 	stmdaeq	r0, {r0}
     a2c:	000007b4 			; <UNDEFINED> instruction: 0x000007b4
     a30:	01924d01 	orrseq	r4, r2, r1, lsl #26
     a34:	91020000 	mrsls	r0, (UNDEF: 2)
     a38:	470d005f 	smlsdmi	sp, pc, r0, r0	; <UNPREDICTABLE>
     a3c:	01000008 	tsteq	r0, r8
     a40:	0083e43b 	addeq	lr, r3, fp, lsr r4
     a44:	00003400 	andeq	r3, r0, r0, lsl #8
     a48:	059c0100 	ldreq	r0, [ip, #256]	; 0x100
     a4c:	08000002 	stmdaeq	r0, {r1}
     a50:	000007b4 			; <UNDEFINED> instruction: 0x000007b4
     a54:	01923d01 	orrseq	r3, r2, r1, lsl #26
     a58:	91020000 	mrsls	r0, (UNDEF: 2)
     a5c:	640d005f 	strvs	r0, [sp], #-95	; 0xffffffa1
     a60:	01000008 	tsteq	r0, r8
     a64:	0083ac2a 	addeq	sl, r3, sl, lsr #24
     a68:	00003800 	andeq	r3, r0, r0, lsl #16
     a6c:	299c0100 	ldmibcs	ip, {r8}
     a70:	08000002 	stmdaeq	r0, {r1}
     a74:	000007b4 			; <UNDEFINED> instruction: 0x000007b4
     a78:	01922c01 	orrseq	r2, r2, r1, lsl #24
     a7c:	91020000 	mrsls	r0, (UNDEF: 2)
     a80:	480e005f 	stmdami	lr, {r0, r1, r2, r3, r4, r6}
     a84:	01000007 	tsteq	r0, r7
     a88:	00011f1d 	andeq	r1, r1, sp, lsl pc
     a8c:	00838800 	addeq	r8, r3, r0, lsl #16
     a90:	00002400 	andeq	r2, r0, r0, lsl #8
     a94:	009c0100 	addseq	r0, ip, r0, lsl #2
     a98:	00000143 	andeq	r0, r0, r3, asr #2
     a9c:	03ed0004 	mvneq	r0, #4
     aa0:	01040000 	mrseq	r0, (UNDEF: 4)
     aa4:	00000044 	andeq	r0, r0, r4, asr #32
     aa8:	0008f10c 	andeq	pc, r8, ip, lsl #2
     aac:	0085d000 	addeq	sp, r5, r0
     ab0:	00007c00 	andeq	r7, r0, r0, lsl #24
     ab4:	00051a00 	andeq	r1, r5, r0, lsl #20
     ab8:	06010200 	streq	r0, [r1], -r0, lsl #4
     abc:	000000c2 	andeq	r0, r0, r2, asr #1
     ac0:	c0080102 	andgt	r0, r8, r2, lsl #2
     ac4:	02000000 	andeq	r0, r0, #0
     ac8:	012e0502 			; <UNDEFINED> instruction: 0x012e0502
     acc:	02020000 	andeq	r0, r2, #0
     ad0:	0000ce07 	andeq	ip, r0, r7, lsl #28
     ad4:	05040200 	streq	r0, [r4, #-512]	; 0xfffffe00
     ad8:	00000125 	andeq	r0, r0, r5, lsr #2
     adc:	0000e103 	andeq	lr, r0, r3, lsl #2
     ae0:	4f410200 	svcmi	0x00410200
     ae4:	02000000 	andeq	r0, r0, #0
     ae8:	010e0704 	tsteq	lr, r4, lsl #14
     aec:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
     af0:	00012005 	andeq	r2, r1, r5
     af4:	07080200 	streq	r0, [r8, -r0, lsl #4]
     af8:	00000109 	andeq	r0, r0, r9, lsl #2
     afc:	69050404 	stmdbvs	r5, {r2, sl}
     b00:	0200746e 	andeq	r7, r0, #1845493760	; 0x6e000000
     b04:	01130704 	tsteq	r3, r4, lsl #14
     b08:	e3030000 	movw	r0, #12288	; 0x3000
     b0c:	03000000 	movweq	r0, #0
     b10:	00004430 	andeq	r4, r0, r0, lsr r4
     b14:	00720500 	rsbseq	r0, r2, r0, lsl #10
     b18:	1c060000 	stcne	0, cr0, [r6], {-0}
     b1c:	00df1a04 	sbcseq	r1, pc, r4, lsl #20
     b20:	2e070000 	cdpcs	0, 0, cr0, cr7, cr0, {0}
     b24:	04000009 	streq	r0, [r0], #-9
     b28:	00007d1b 	andeq	r7, r0, fp, lsl sp
     b2c:	3d070000 	stccc	0, cr0, [r7, #-0]
     b30:	04000009 	streq	r0, [r0], #-9
     b34:	00007d1c 	andeq	r7, r0, ip, lsl sp
     b38:	23070400 	movwcs	r0, #29696	; 0x7400
     b3c:	04000009 	streq	r0, [r0], #-9
     b40:	00007d1d 	andeq	r7, r0, sp, lsl sp
     b44:	cd070800 	stcgt	8, cr0, [r7, #-0]
     b48:	04000008 	streq	r0, [r0], #-8
     b4c:	00007d1e 	andeq	r7, r0, lr, lsl sp
     b50:	d6070c00 	strle	r0, [r7], -r0, lsl #24
     b54:	04000008 	streq	r0, [r0], #-8
     b58:	00007d1f 	andeq	r7, r0, pc, lsl sp
     b5c:	df071000 	svcle	0x00071000
     b60:	04000008 	streq	r0, [r0], #-8
     b64:	00007d20 	andeq	r7, r0, r0, lsr #26
     b68:	e8071400 	stmda	r7, {sl, ip}
     b6c:	04000008 	streq	r0, [r0], #-8
     b70:	00007d21 	andeq	r7, r0, r1, lsr #26
     b74:	03001800 	movweq	r1, #2048	; 0x800
     b78:	00000970 	andeq	r0, r0, r0, ror r9
     b7c:	00822204 	addeq	r2, r2, r4, lsl #4
     b80:	80080000 	andhi	r0, r8, r0
     b84:	01000009 	tsteq	r0, r9
     b88:	0000fb0e 	andeq	pc, r0, lr, lsl #22
     b8c:	a0030500 	andge	r0, r3, r0, lsl #10
     b90:	0900008d 	stmdbeq	r0, {r0, r2, r3, r7}
     b94:	0000df04 	andeq	sp, r0, r4, lsl #30
     b98:	095b0a00 	ldmdbeq	fp, {r9, fp}^
     b9c:	15010000 	strne	r0, [r1, #-0]
     ba0:	000085f4 	strdeq	r8, [r0], -r4
     ba4:	00000058 	andeq	r0, r0, r8, asr r0
     ba8:	01319c01 	teqeq	r1, r1, lsl #24
     bac:	750b0000 	strvc	r0, [fp, #-0]
     bb0:	15010073 	strne	r0, [r1, #-115]	; 0xffffff8d
     bb4:	00000072 	andeq	r0, r0, r2, ror r0
     bb8:	0c6c9102 	stfeqp	f1, [ip], #-8
     bbc:	01007374 	tsteq	r0, r4, ror r3
     bc0:	00007d17 	andeq	r7, r0, r7, lsl sp
     bc4:	74910200 	ldrvc	r0, [r1], #512	; 0x200
     bc8:	09480d00 	stmdbeq	r8, {r8, sl, fp}^
     bcc:	10010000 	andne	r0, r1, r0
     bd0:	000000fb 	strdeq	r0, [r0], -fp
     bd4:	000085d0 	ldrdeq	r8, [r0], -r0
     bd8:	00000024 	andeq	r0, r0, r4, lsr #32
     bdc:	f3009c01 			; <UNDEFINED> instruction: 0xf3009c01
     be0:	04000006 	streq	r0, [r0], #-6
     be4:	0004af00 	andeq	sl, r4, r0, lsl #30
     be8:	44010400 	strmi	r0, [r1], #-1024	; 0xfffffc00
     bec:	0c000000 	stceq	0, cr0, [r0], {-0}
     bf0:	00000a2a 	andeq	r0, r0, sl, lsr #20
     bf4:	0000864c 	andeq	r8, r0, ip, asr #12
     bf8:	0000039c 	muleq	r0, ip, r3
     bfc:	0000061d 	andeq	r0, r0, sp, lsl r6
     c00:	c2060102 	andgt	r0, r6, #-2147483648	; 0x80000000
     c04:	02000000 	andeq	r0, r0, #0
     c08:	00c00801 	sbceq	r0, r0, r1, lsl #16
     c0c:	02020000 	andeq	r0, r2, #0
     c10:	00012e05 	andeq	r2, r1, r5, lsl #28
     c14:	07020200 	streq	r0, [r2, -r0, lsl #4]
     c18:	000000ce 	andeq	r0, r0, lr, asr #1
     c1c:	25050402 	strcs	r0, [r5, #-1026]	; 0xfffffbfe
     c20:	03000001 	movweq	r0, #1
     c24:	000000e1 	andeq	r0, r0, r1, ror #1
     c28:	004f4102 	subeq	r4, pc, r2, lsl #2
     c2c:	04020000 	streq	r0, [r2], #-0
     c30:	00010e07 	andeq	r0, r1, r7, lsl #28
     c34:	05080200 	streq	r0, [r8, #-512]	; 0xfffffe00
     c38:	00000120 	andeq	r0, r0, r0, lsr #2
     c3c:	09070802 	stmdbeq	r7, {r1, fp}
     c40:	04000001 	streq	r0, [r0], #-1
     c44:	6e690504 	cdpvs	5, 6, cr0, cr9, cr4, {0}
     c48:	64050074 	strvs	r0, [r5], #-116	; 0xffffff8c
     c4c:	02000000 	andeq	r0, r0, #0
     c50:	01130704 	tsteq	r3, r4, lsl #14
     c54:	e3030000 	movw	r0, #12288	; 0x3000
     c58:	03000000 	movweq	r0, #0
     c5c:	00004430 	andeq	r4, r0, r0, lsr r4
     c60:	00770500 	rsbseq	r0, r7, r0, lsl #10
     c64:	82060000 	andhi	r0, r6, #0
     c68:	03000000 	movweq	r0, #0
     c6c:	0000058a 	andeq	r0, r0, sl, lsl #11
     c70:	00821204 	addeq	r1, r2, r4, lsl #4
     c74:	00030000 	andeq	r0, r3, r0
     c78:	04000005 	streq	r0, [r0], #-5
     c7c:	00008713 	andeq	r8, r0, r3, lsl r7
     c80:	06ad0300 	strteq	r0, [sp], r0, lsl #6
     c84:	14040000 	strne	r0, [r4], #-0
     c88:	00000082 	andeq	r0, r0, r2, lsl #1
     c8c:	39052c07 	stmdbcc	r5, {r0, r1, r2, sl, fp, sp}
     c90:	0000013a 	andeq	r0, r0, sl, lsr r1
     c94:	000a1008 	andeq	r1, sl, r8
     c98:	8c3a0500 	cfldr32hi	mvfx0, [sl], #-0
     c9c:	00000000 	andeq	r0, r0, r0
     ca0:	000a7c08 	andeq	r7, sl, r8, lsl #24
     ca4:	8c3b0500 	cfldr32hi	mvfx0, [fp], #-0
     ca8:	04000000 	streq	r0, [r0], #-0
     cac:	000a9708 	andeq	r9, sl, r8, lsl #14
     cb0:	8c3c0500 	cfldr32hi	mvfx0, [ip], #-0
     cb4:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
     cb8:	000b1a08 	andeq	r1, fp, r8, lsl #20
     cbc:	8c3d0500 	cfldr32hi	mvfx0, [sp], #-0
     cc0:	0c000000 	stceq	0, cr0, [r0], {-0}
     cc4:	000a0108 	andeq	r0, sl, r8, lsl #2
     cc8:	8c3e0500 	cfldr32hi	mvfx0, [lr], #-0
     ccc:	10000000 	andne	r0, r0, r0
     cd0:	0009c108 	andeq	ip, r9, r8, lsl #2
     cd4:	973f0500 	ldrls	r0, [pc, -r0, lsl #10]!
     cd8:	14000000 	strne	r0, [r0], #-0
     cdc:	000a6808 	andeq	r6, sl, r8, lsl #16
     ce0:	97400500 	strbls	r0, [r0, -r0, lsl #10]
     ce4:	18000000 	stmdane	r0, {}	; <UNPREDICTABLE>
     ce8:	00098f08 	andeq	r8, r9, r8, lsl #30
     cec:	8c410500 	cfstr64hi	mvdx0, [r1], {-0}
     cf0:	1c000000 	stcne	0, cr0, [r0], {-0}
     cf4:	000b5308 	andeq	r5, fp, r8, lsl #6
     cf8:	8c420500 	cfstr64hi	mvdx0, [r2], {-0}
     cfc:	20000000 	andcs	r0, r0, r0
     d00:	000b0508 	andeq	r0, fp, r8, lsl #10
     d04:	97430500 	strbls	r0, [r3, -r0, lsl #10]
     d08:	24000000 	strcs	r0, [r0], #-0
     d0c:	000a5808 	andeq	r5, sl, r8, lsl #16
     d10:	8c440500 	cfstr64hi	mvdx0, [r4], {-0}
     d14:	28000000 	stmdacs	r0, {}	; <UNPREDICTABLE>
     d18:	099e0300 	ldmibeq	lr, {r8, r9}
     d1c:	45050000 	strmi	r0, [r5, #-0]
     d20:	000000ad 	andeq	r0, r0, sp, lsr #1
     d24:	47050807 	strmi	r0, [r5, -r7, lsl #16]
     d28:	00000166 	andeq	r0, r0, r6, ror #2
     d2c:	000aad08 	andeq	sl, sl, r8, lsl #26
     d30:	97480500 	strbls	r0, [r8, -r0, lsl #10]
     d34:	00000000 	andeq	r0, r0, r0
     d38:	0009d008 	andeq	sp, r9, r8
     d3c:	8c490500 	cfstr64hi	mvdx0, [r9], {-0}
     d40:	04000000 	streq	r0, [r0], #-0
     d44:	0b340300 	bleq	d0194c <_heap+0xc81948>
     d48:	4a050000 	bmi	140d50 <_heap+0xc0d4c>
     d4c:	00000145 	andeq	r0, r0, r5, asr #2
     d50:	00280109 	eoreq	r0, r8, r9, lsl #2
     d54:	42060000 	andmi	r0, r6, #0
     d58:	000001ae 	andeq	r0, r0, lr, lsr #3
     d5c:	0005d60a 	andeq	sp, r5, sl, lsl #12
     d60:	db0a0000 	blle	280d68 <_heap+0x200d64>
     d64:	01000004 	tsteq	r0, r4
     d68:	0007180a 	andeq	r1, r7, sl, lsl #16
     d6c:	100a0200 	andne	r0, sl, r0, lsl #4
     d70:	03000007 	movweq	r0, #7
     d74:	0006f00a 	andeq	pc, r6, sl
     d78:	f80a0400 			; <UNDEFINED> instruction: 0xf80a0400
     d7c:	05000006 	streq	r0, [r0, #-6]
     d80:	0007000a 	andeq	r0, r7, sl
     d84:	080a0600 	stmdaeq	sl, {r9, sl}
     d88:	07000007 	streq	r0, [r0, -r7]
     d8c:	28010900 	stmdacs	r1, {r8, fp}
     d90:	06000000 	streq	r0, [r0], -r0
     d94:	0002ff51 	andeq	pc, r2, r1, asr pc	; <UNPREDICTABLE>
     d98:	049f0a00 	ldreq	r0, [pc], #2560	; da0 <CPSR_IRQ_INHIBIT+0xd20>
     d9c:	0a000000 	beq	da4 <CPSR_IRQ_INHIBIT+0xd24>
     da0:	000004a9 	andeq	r0, r0, r9, lsr #9
     da4:	04b30a01 	ldrteq	r0, [r3], #2561	; 0xa01
     da8:	0a020000 	beq	80db0 <_heap+0xdac>
     dac:	00000682 	andeq	r0, r0, r2, lsl #13
     db0:	04bd0a03 	ldrteq	r0, [sp], #2563	; 0xa03
     db4:	0a040000 	beq	100dbc <_heap+0x80db8>
     db8:	000004c7 	andeq	r0, r0, r7, asr #9
     dbc:	04d10a05 	ldrbeq	r0, [r1], #2565	; 0xa05
     dc0:	0a060000 	beq	180dc8 <_heap+0x100dc4>
     dc4:	000005cc 	andeq	r0, r0, ip, asr #11
     dc8:	04e50a07 	strbteq	r0, [r5], #2567	; 0xa07
     dcc:	0a080000 	beq	200dd4 <_heap+0x180dd0>
     dd0:	000004ef 	andeq	r0, r0, pc, ror #9
     dd4:	03cf0a09 	biceq	r0, pc, #36864	; 0x9000
     dd8:	0a0a0000 	beq	280de0 <_heap+0x200ddc>
     ddc:	000003da 	ldrdeq	r0, [r0], -sl
     de0:	03e50a0b 	mvneq	r0, #45056	; 0xb000
     de4:	0a0c0000 	beq	300dec <_heap+0x280de8>
     de8:	000003f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>
     dec:	03fb0a0d 	mvnseq	r0, #53248	; 0xd000
     df0:	0a0e0000 	beq	380df8 <_heap+0x300df4>
     df4:	00000406 	andeq	r0, r0, r6, lsl #8
     df8:	04110a0f 	ldreq	r0, [r1], #-2575	; 0xfffff5f1
     dfc:	0a100000 	beq	400e04 <_heap+0x380e00>
     e00:	0000041c 	andeq	r0, r0, ip, lsl r4
     e04:	04270a11 	strteq	r0, [r7], #-2577	; 0xfffff5ef
     e08:	0a120000 	beq	480e10 <_heap+0x400e0c>
     e0c:	00000432 	andeq	r0, r0, r2, lsr r4
     e10:	034e0a13 	movteq	r0, #59923	; 0xea13
     e14:	0a140000 	beq	500e1c <_heap+0x480e18>
     e18:	0000050d 	andeq	r0, r0, sp, lsl #10
     e1c:	05180a15 	ldreq	r0, [r8, #-2581]	; 0xfffff5eb
     e20:	0a160000 	beq	580e28 <_heap+0x500e24>
     e24:	00000523 	andeq	r0, r0, r3, lsr #10
     e28:	052e0a17 	streq	r0, [lr, #-2583]!	; 0xfffff5e9
     e2c:	0a180000 	beq	600e34 <_heap+0x580e30>
     e30:	00000539 	andeq	r0, r0, r9, lsr r5
     e34:	05440a19 	strbeq	r0, [r4, #-2585]	; 0xfffff5e7
     e38:	0a1a0000 	beq	680e40 <_heap+0x600e3c>
     e3c:	0000054f 	andeq	r0, r0, pc, asr #10
     e40:	055a0a1b 	ldrbeq	r0, [sl, #-2587]	; 0xfffff5e5
     e44:	0a1c0000 	beq	700e4c <_heap+0x680e48>
     e48:	00000565 	andeq	r0, r0, r5, ror #10
     e4c:	06610a1d 			; <UNDEFINED> instruction: 0x06610a1d
     e50:	0a1e0000 	beq	780e58 <_heap+0x700e54>
     e54:	0000066c 	andeq	r0, r0, ip, ror #12
     e58:	06770a1f 			; <UNDEFINED> instruction: 0x06770a1f
     e5c:	0a200000 	beq	800e64 <_heap+0x780e60>
     e60:	00000617 	andeq	r0, r0, r7, lsl r6
     e64:	068c0a21 	streq	r0, [ip], r1, lsr #20
     e68:	0a220000 	beq	880e70 <_heap+0x800e6c>
     e6c:	00000697 	muleq	r0, r7, r6
     e70:	06a20a23 	strteq	r0, [r2], r3, lsr #20
     e74:	0a240000 	beq	900e7c <_heap+0x880e78>
     e78:	0000063a 	andeq	r0, r0, sl, lsr r6
     e7c:	06ba0a25 	ldrteq	r0, [sl], r5, lsr #20
     e80:	0a260000 	beq	980e88 <_heap+0x900e84>
     e84:	000006c5 	andeq	r0, r0, r5, asr #13
     e88:	02c90a27 	sbceq	r0, r9, #159744	; 0x27000
     e8c:	0a280000 	beq	a00e94 <_heap+0x980e90>
     e90:	000003c4 	andeq	r0, r0, r4, asr #7
     e94:	02d40a29 	sbcseq	r0, r4, #167936	; 0x29000
     e98:	0a2a0000 	beq	a80ea0 <_heap+0xa00e9c>
     e9c:	000002df 	ldrdeq	r0, [r0], -pc	; <UNPREDICTABLE>
     ea0:	02ea0a2b 	rsceq	r0, sl, #176128	; 0x2b000
     ea4:	0a2c0000 	beq	b00eac <_heap+0xa80ea8>
     ea8:	000002f5 	strdeq	r0, [r0], -r5
     eac:	03000a2d 	movweq	r0, #2605	; 0xa2d
     eb0:	0a2e0000 	beq	b80eb8 <_heap+0xb00eb4>
     eb4:	0000030b 	andeq	r0, r0, fp, lsl #6
     eb8:	03160a2f 	tsteq	r6, #192512	; 0x2f000
     ebc:	0a300000 	beq	c00ec4 <_heap+0xb80ec0>
     ec0:	00000321 	andeq	r0, r0, r1, lsr #6
     ec4:	04460a31 	strbeq	r0, [r6], #-2609	; 0xfffff5cf
     ec8:	0a320000 	beq	c80ed0 <_heap+0xc00ecc>
     ecc:	00000451 	andeq	r0, r0, r1, asr r4
     ed0:	06560a33 			; <UNDEFINED> instruction: 0x06560a33
     ed4:	0a340000 	beq	d00edc <_heap+0xc80ed8>
     ed8:	0000045c 	andeq	r0, r0, ip, asr r4
     edc:	a4070035 	strge	r0, [r7], #-53	; 0xffffffcb
     ee0:	04f49b06 	ldrbteq	r9, [r4], #2822	; 0xb06
     ee4:	8a080000 	bhi	200eec <_heap+0x180ee8>
     ee8:	06000002 	streq	r0, [r0], -r2
     eec:	00008c9c 	muleq	r0, ip, ip
     ef0:	92080000 	andls	r0, r8, #0
     ef4:	06000002 	streq	r0, [r0], -r2
     ef8:	00008c9d 	muleq	r0, sp, ip
     efc:	9a080400 	bls	201f04 <_heap+0x181f00>
     f00:	06000002 	streq	r0, [r0], -r2
     f04:	00008c9e 	muleq	r0, lr, ip
     f08:	a2080800 	andge	r0, r8, #0, 16
     f0c:	06000002 	streq	r0, [r0], -r2
     f10:	00008c9f 	muleq	r0, pc, ip	; <UNPREDICTABLE>
     f14:	aa080c00 	bge	203f1c <_heap+0x183f18>
     f18:	06000002 	streq	r0, [r0], -r2
     f1c:	00008ca0 	andeq	r8, r0, r0, lsr #25
     f20:	b2081000 	andlt	r1, r8, #0
     f24:	06000002 	streq	r0, [r0], -r2
     f28:	00008ca1 	andeq	r8, r0, r1, lsr #25
     f2c:	70081400 	andvc	r1, r8, r0, lsl #8
     f30:	06000003 	streq	r0, [r0], -r3
     f34:	000097a2 	andeq	r9, r0, r2, lsr #15
     f38:	7c081800 	stcvc	8, cr1, [r8], {-0}
     f3c:	06000002 	streq	r0, [r0], -r2
     f40:	0000a2a3 	andeq	sl, r0, r3, lsr #5
     f44:	83081c00 	movwhi	r1, #35840	; 0x8c00
     f48:	06000002 	streq	r0, [r0], -r2
     f4c:	0000a2a4 	andeq	sl, r0, r4, lsr #5
     f50:	7a082000 	bvc	208f58 <_heap+0x188f54>
     f54:	06000003 	streq	r0, [r0], -r3
     f58:	000097a5 	andeq	r9, r0, r5, lsr #15
     f5c:	2b082400 	blcs	209f64 <_heap+0x189f60>
     f60:	06000007 	streq	r0, [r0], -r7
     f64:	0000a2a6 	andeq	sl, r0, r6, lsr #5
     f68:	f9082800 			; <UNDEFINED> instruction: 0xf9082800
     f6c:	06000004 	streq	r0, [r0], -r4
     f70:	0000a2a7 	andeq	sl, r0, r7, lsr #5
     f74:	84082c00 	strhi	r2, [r8], #-3072	; 0xfffff400
     f78:	06000003 	streq	r0, [r0], -r3
     f7c:	000097a8 	andeq	r9, r0, r8, lsr #15
     f80:	22083000 	andcs	r3, r8, #0
     f84:	06000006 	streq	r0, [r0], -r6
     f88:	0000a2a9 	andeq	sl, r0, r9, lsr #5
     f8c:	29083400 	stmdbcs	r8, {sl, ip, sp}
     f90:	06000006 	streq	r0, [r0], -r6
     f94:	0000a2aa 	andeq	sl, r0, sl, lsr #5
     f98:	8e083800 	cdphi	8, 0, cr3, cr8, cr0, {0}
     f9c:	06000003 	streq	r0, [r0], -r3
     fa0:	000097ab 	andeq	r9, r0, fp, lsr #15
     fa4:	a2083c00 	andge	r3, r8, #0, 24
     fa8:	06000003 	streq	r0, [r0], -r3
     fac:	0000a2ac 	andeq	sl, r0, ip, lsr #5
     fb0:	a9084000 	stmdbge	r8, {lr}
     fb4:	06000003 	streq	r0, [r0], -r3
     fb8:	0000a2ad 	andeq	sl, r0, sp, lsr #5
     fbc:	30084400 	andcc	r4, r8, r0, lsl #8
     fc0:	06000006 	streq	r0, [r0], -r6
     fc4:	000097ae 	andeq	r9, r0, lr, lsr #15
     fc8:	39084800 	stmdbcc	r8, {fp, lr}
     fcc:	06000003 	streq	r0, [r0], -r3
     fd0:	0000a2af 	andeq	sl, r0, pc, lsr #5
     fd4:	40084c00 	andmi	r4, r8, r0, lsl #24
     fd8:	06000003 	streq	r0, [r0], -r3
     fdc:	0000a2b0 			; <UNDEFINED> instruction: 0x0000a2b0
     fe0:	98085000 	stmdals	r8, {ip, lr}
     fe4:	06000003 	streq	r0, [r0], -r3
     fe8:	000097b1 			; <UNDEFINED> instruction: 0x000097b1
     fec:	e9085400 	stmdb	r8, {sl, ip, lr}
     ff0:	06000006 	streq	r0, [r0], -r6
     ff4:	0000a2b2 			; <UNDEFINED> instruction: 0x0000a2b2
     ff8:	ba085800 	blt	217000 <_heap+0x196ffc>
     ffc:	06000002 	streq	r0, [r0], -r2
    1000:	0000a2b3 			; <UNDEFINED> instruction: 0x0000a2b3
    1004:	45085c00 	strmi	r5, [r8, #-3072]	; 0xfffff400
    1008:	06000006 	streq	r0, [r0], -r6
    100c:	000097b4 			; <UNDEFINED> instruction: 0x000097b4
    1010:	47086000 	strmi	r6, [r8, -r0]
    1014:	06000003 	streq	r0, [r0], -r3
    1018:	0000a2b5 			; <UNDEFINED> instruction: 0x0000a2b5
    101c:	4f086400 	svcmi	0x00086400
    1020:	06000006 	streq	r0, [r0], -r6
    1024:	0000a2b6 			; <UNDEFINED> instruction: 0x0000a2b6
    1028:	d0086800 	andle	r6, r8, r0, lsl #16
    102c:	06000006 	streq	r0, [r0], -r6
    1030:	000097b7 			; <UNDEFINED> instruction: 0x000097b7
    1034:	88086c00 	stmdahi	r8, {sl, fp, sp, lr}
    1038:	06000004 	streq	r0, [r0], -r4
    103c:	0000a2b8 			; <UNDEFINED> instruction: 0x0000a2b8
    1040:	83087000 	movwhi	r7, #32768	; 0x8000
    1044:	06000005 	streq	r0, [r0], -r5
    1048:	0000a2b9 			; <UNDEFINED> instruction: 0x0000a2b9
    104c:	b0087400 	andlt	r7, r8, r0, lsl #8
    1050:	06000003 	streq	r0, [r0], -r3
    1054:	000097ba 			; <UNDEFINED> instruction: 0x000097ba
    1058:	7b087800 	blvc	21f060 <_heap+0x19f05c>
    105c:	06000005 	streq	r0, [r0], -r5
    1060:	0000a2bb 			; <UNDEFINED> instruction: 0x0000a2bb
    1064:	ac087c00 	stcge	12, cr7, [r8], {-0}
    1068:	06000005 	streq	r0, [r0], -r5
    106c:	0000a2bc 			; <UNDEFINED> instruction: 0x0000a2bc
    1070:	ba088000 	blt	221078 <_heap+0x1a1074>
    1074:	06000003 	streq	r0, [r0], -r3
    1078:	000097bd 			; <UNDEFINED> instruction: 0x000097bd
    107c:	8f088400 	svchi	0x00088400
    1080:	06000004 	streq	r0, [r0], -r4
    1084:	0000a2be 			; <UNDEFINED> instruction: 0x0000a2be
    1088:	97088800 	strls	r8, [r8, -r0, lsl #16]
    108c:	06000004 	streq	r0, [r0], -r4
    1090:	0000a2bf 			; <UNDEFINED> instruction: 0x0000a2bf
    1094:	a1088c00 	tstge	r8, r0, lsl #24
    1098:	06000005 	streq	r0, [r0], -r5
    109c:	000097c0 	andeq	r9, r0, r0, asr #15
    10a0:	67089000 	strvs	r9, [r8, -r0]
    10a4:	06000004 	streq	r0, [r0], -r4
    10a8:	0000a2c1 	andeq	sl, r0, r1, asr #5
    10ac:	97089400 	strls	r9, [r8, -r0, lsl #8]
    10b0:	06000005 	streq	r0, [r0], -r5
    10b4:	0000a2c2 	andeq	sl, r0, r2, asr #5
    10b8:	df089800 	svcle	0x00089800
    10bc:	06000005 	streq	r0, [r0], -r5
    10c0:	0000a2c3 	andeq	sl, r0, r3, asr #5
    10c4:	70089c00 	andvc	r9, r8, r0, lsl #24
    10c8:	06000005 	streq	r0, [r0], -r5
    10cc:	000097c4 	andeq	r9, r0, r4, asr #15
    10d0:	0300a000 	movweq	sl, #0
    10d4:	00000720 	andeq	r0, r0, r0, lsr #14
    10d8:	02ffc506 	rscseq	ip, pc, #25165824	; 0x1800000
    10dc:	18070000 	stmdane	r7, {}	; <UNPREDICTABLE>
    10e0:	05380207 	ldreq	r0, [r8, #-519]!	; 0xfffffdf9
    10e4:	23080000 	movwcs	r0, #32768	; 0x8000
    10e8:	0700000a 	streq	r0, [r0, -sl]
    10ec:	00053804 	andeq	r3, r5, r4, lsl #16
    10f0:	15080000 	strne	r0, [r8, #-0]
    10f4:	0700000b 	streq	r0, [r0, -fp]
    10f8:	00006405 	andeq	r6, r0, r5, lsl #8
    10fc:	77080c00 	strvc	r0, [r8, -r0, lsl #24]
    1100:	0700000a 	streq	r0, [r0, -sl]
    1104:	00006406 	andeq	r6, r0, r6, lsl #8
    1108:	80081000 	andhi	r1, r8, r0
    110c:	0700000b 	streq	r0, [r0, -fp]
    1110:	00006407 	andeq	r6, r0, r7, lsl #8
    1114:	0b001400 	bleq	611c <CPSR_IRQ_INHIBIT+0x609c>
    1118:	0000054f 	andeq	r0, r0, pc, asr #10
    111c:	00000548 	andeq	r0, r0, r8, asr #10
    1120:	0005480c 	andeq	r4, r5, ip, lsl #16
    1124:	02000900 	andeq	r0, r0, #0, 18
    1128:	01b20704 			; <UNDEFINED> instruction: 0x01b20704
    112c:	01020000 	mrseq	r0, (UNDEF: 2)
    1130:	0000c908 	andeq	ip, r0, r8, lsl #18
    1134:	0acb0300 	beq	ff2c1d3c <CPSR_UNAFFECTED_BITS+0xff2c1e3c>
    1138:	08070000 	stmdaeq	r7, {}	; <UNPREDICTABLE>
    113c:	000004ff 	strdeq	r0, [r0], -pc	; <UNPREDICTABLE>
    1140:	000aa60d 	andeq	sl, sl, sp, lsl #12
    1144:	72160100 	andsvc	r0, r6, #0, 2
    1148:	05000005 	streq	r0, [r0, #-5]
    114c:	008da403 	addeq	sl, sp, r3, lsl #8
    1150:	66040e00 	strvs	r0, [r4], -r0, lsl #28
    1154:	0d000001 	stceq	0, cr0, [r0, #-4]
    1158:	00000a8b 	andeq	r0, r0, fp, lsl #21
    115c:	05891701 	streq	r1, [r9, #1793]	; 0x701
    1160:	03050000 	movweq	r0, #20480	; 0x5000
    1164:	00008da8 	andeq	r8, r0, r8, lsr #27
    1168:	013a040e 	teqeq	sl, lr, lsl #8
    116c:	1e0d0000 	cdpne	0, 0, cr0, cr13, cr0, {0}
    1170:	0100000a 	tsteq	r0, sl
    1174:	00055618 	andeq	r5, r5, r8, lsl r6
    1178:	f4030500 	vst3.8	{d0,d2,d4}, [r3], r0
    117c:	0f00008d 	svceq	0x0000008d
    1180:	000009a9 	andeq	r0, r0, r9, lsr #19
    1184:	89086a01 	stmdbhi	r8, {r0, r9, fp, sp, lr}
    1188:	00e00000 	rsceq	r0, r0, r0
    118c:	9c010000 	stcls	0, cr0, [r1], {-0}
    1190:	000005d2 	ldrdeq	r0, [r0], -r2
    1194:	000ab50d 	andeq	fp, sl, sp, lsl #10
    1198:	826c0100 	rsbhi	r0, ip, #0, 2
    119c:	02000000 	andeq	r0, r0, #0
    11a0:	d20d7491 	andle	r7, sp, #-1862270976	; 0x91000000
    11a4:	0100000a 	tsteq	r0, sl
    11a8:	00054f6d 	andeq	r4, r5, sp, ror #30
    11ac:	73910200 	orrsvc	r0, r1, #0, 4
    11b0:	0ae01000 	beq	ff8051b8 <CPSR_UNAFFECTED_BITS+0xff8052b8>
    11b4:	65010000 	strvs	r0, [r1, #-0]
    11b8:	00000064 	andeq	r0, r0, r4, rrx
    11bc:	000088d0 	ldrdeq	r8, [r0], -r0
    11c0:	00000038 	andeq	r0, r0, r8, lsr r0
    11c4:	06089c01 	streq	r9, [r8], -r1, lsl #24
    11c8:	be110000 	cdplt	0, 1, cr0, cr1, cr0, {0}
    11cc:	0100000a 	tsteq	r0, sl
    11d0:	00060865 	andeq	r0, r6, r5, ror #16
    11d4:	74910200 	ldrvc	r0, [r1], #512	; 0x200
    11d8:	0009ba11 	andeq	fp, r9, r1, lsl sl
    11dc:	64650100 	strbtvs	r0, [r5], #-256	; 0xffffff00
    11e0:	02000000 	andeq	r0, r0, #0
    11e4:	0e007091 	mcreq	0, 0, r7, cr0, cr1, {4}
    11e8:	00054f04 	andeq	r4, r5, r4, lsl #30
    11ec:	0b630f00 	bleq	18c4df4 <_heap+0x1844df0>
    11f0:	5c010000 	stcpl	0, cr0, [r1], {-0}
    11f4:	00008888 	andeq	r8, r0, r8, lsl #17
    11f8:	00000048 	andeq	r0, r0, r8, asr #32
    11fc:	06329c01 	ldrteq	r9, [r2], -r1, lsl #24
    1200:	b4110000 	ldrlt	r0, [r1], #-0
    1204:	01000007 	tsteq	r0, r7
    1208:	0006085c 	andeq	r0, r6, ip, asr r8
    120c:	74910200 	ldrvc	r0, [r1], #512	; 0x200
    1210:	0b3e1000 	bleq	f85218 <_heap+0xf05214>
    1214:	52010000 	andpl	r0, r1, #0
    1218:	00000064 	andeq	r0, r0, r4, rrx
    121c:	00008824 	andeq	r8, r0, r4, lsr #16
    1220:	00000064 	andeq	r0, r0, r4, rrx
    1224:	06749c01 	ldrbteq	r9, [r4], -r1, lsl #24
    1228:	b4110000 	ldrlt	r0, [r1], #-0
    122c:	01000007 	tsteq	r0, r7
    1230:	00060852 	andeq	r0, r6, r2, asr r8
    1234:	6c910200 	lfmvs	f0, 4, [r1], {0}
    1238:	6e656c12 	mcrvs	12, 3, r6, cr5, cr2, {0}
    123c:	64520100 	ldrbvs	r0, [r2], #-256	; 0xffffff00
    1240:	02000000 	andeq	r0, r0, #0
    1244:	69136891 	ldmdbvs	r3, {r0, r4, r7, fp, sp, lr}
    1248:	64540100 	ldrbvs	r0, [r4], #-256	; 0xffffff00
    124c:	02000000 	andeq	r0, r0, #0
    1250:	14007491 	strne	r7, [r0], #-1169	; 0xfffffb6f
    1254:	000009dc 	ldrdeq	r0, [r0], -ip
    1258:	87d04901 	ldrbhi	r4, [r0, r1, lsl #18]
    125c:	00540000 	subseq	r0, r4, r0
    1260:	9c010000 	stcls	0, cr0, [r1], {-0}
    1264:	00000696 	muleq	r0, r6, r6
    1268:	01006312 	tsteq	r0, r2, lsl r3
    126c:	00054f49 	andeq	r4, r5, r9, asr #30
    1270:	77910200 	ldrvc	r0, [r1, r0, lsl #4]
    1274:	09f00f00 	ldmibeq	r0!, {r8, r9, sl, fp}^
    1278:	24010000 	strcs	r0, [r1], #-0
    127c:	00008694 	muleq	r0, r4, r6
    1280:	0000013c 	andeq	r0, r0, ip, lsr r1
    1284:	06c69c01 	strbeq	r9, [r6], r1, lsl #24
    1288:	69130000 	ldmdbvs	r3, {}	; <UNPREDICTABLE>
    128c:	6b260100 	blvs	981694 <_heap+0x901690>
    1290:	02000000 	andeq	r0, r0, #0
    1294:	c30d7091 	movwgt	r7, #53393	; 0xd091
    1298:	0100000a 	tsteq	r0, sl
    129c:	0006c628 	andeq	ip, r6, r8, lsr #12
    12a0:	74910200 	ldrvc	r0, [r1], #512	; 0x200
    12a4:	f4040e00 			; <UNDEFINED> instruction: 0xf4040e00
    12a8:	15000004 	strne	r0, [r0, #-4]
    12ac:	00000af5 	strdeq	r0, [r0], -r5
    12b0:	05891f01 	streq	r1, [r9, #3841]	; 0xf01
    12b4:	86700000 	ldrbthi	r0, [r0], -r0
    12b8:	00240000 	eoreq	r0, r4, r0
    12bc:	9c010000 	stcls	0, cr0, [r1], {-0}
    12c0:	000b2915 	andeq	r2, fp, r5, lsl r9
    12c4:	721a0100 	andsvc	r0, sl, #0, 2
    12c8:	4c000005 	stcmi	0, cr0, [r0], {5}
    12cc:	24000086 	strcs	r0, [r0], #-134	; 0xffffff7a
    12d0:	01000000 	mrseq	r0, (UNDEF: 0)
    12d4:	09f3009c 	ldmibeq	r3!, {r2, r3, r4, r7}^
    12d8:	00040000 	andeq	r0, r4, r0
    12dc:	000005e7 	andeq	r0, r0, r7, ror #11
    12e0:	00440104 	subeq	r0, r4, r4, lsl #2
    12e4:	cf0c0000 	svcgt	0x000c0000
    12e8:	b000000b 	andlt	r0, r0, fp
    12ec:	e800000d 	stmda	r0, {r0, r2, r3}
    12f0:	a8000089 	stmdage	r0, {r0, r3, r7}
    12f4:	95000000 	strls	r0, [r0, #-0]
    12f8:	02000007 	andeq	r0, r0, #7
    12fc:	00c20601 	sbceq	r0, r2, r1, lsl #12
    1300:	01020000 	mrseq	r0, (UNDEF: 2)
    1304:	0000c008 	andeq	ip, r0, r8
    1308:	05020200 	streq	r0, [r2, #-512]	; 0xfffffe00
    130c:	0000012e 	andeq	r0, r0, lr, lsr #2
    1310:	ce070202 	cdpgt	2, 0, cr0, cr7, cr2, {0}
    1314:	02000000 	andeq	r0, r0, #0
    1318:	01250504 			; <UNDEFINED> instruction: 0x01250504
    131c:	e1030000 	mrs	r0, (UNDEF: 3)
    1320:	02000000 	andeq	r0, r0, #0
    1324:	00005341 	andeq	r5, r0, r1, asr #6
    1328:	07040200 	streq	r0, [r4, -r0, lsl #4]
    132c:	0000010e 	andeq	r0, r0, lr, lsl #2
    1330:	20050802 	andcs	r0, r5, r2, lsl #16
    1334:	02000001 	andeq	r0, r0, #1
    1338:	01090708 	tsteq	r9, r8, lsl #14
    133c:	04040000 	streq	r0, [r4], #-0
    1340:	746e6905 	strbtvc	r6, [lr], #-2309	; 0xfffff6fb
    1344:	07040200 	streq	r0, [r4, -r0, lsl #4]
    1348:	00000113 	andeq	r0, r0, r3, lsl r1
    134c:	70040802 	andvc	r0, r4, r2, lsl #16
    1350:	0500000d 	streq	r0, [r0, #-13]
    1354:	0dd90304 	ldcleq	3, cr0, [r9, #16]
    1358:	07030000 	streq	r0, [r3, -r0]
    135c:	00000068 	andeq	r0, r0, r8, rrx
    1360:	000da903 	andeq	sl, sp, r3, lsl #18
    1364:	412c0400 			; <UNDEFINED> instruction: 0x412c0400
    1368:	03000000 	movweq	r0, #0
    136c:	00000ea0 	andeq	r0, r0, r0, lsr #29
    1370:	00417204 	subeq	r7, r1, r4, lsl #4
    1374:	48060000 	stmdami	r6, {}	; <UNPREDICTABLE>
    1378:	0500000d 	streq	r0, [r0, #-13]
    137c:	006f0165 	rsbeq	r0, pc, r5, ror #2
    1380:	04070000 	streq	r0, [r7], #-0
    1384:	00cba604 	sbceq	sl, fp, r4, lsl #12
    1388:	42080000 	andmi	r0, r8, #0
    138c:	0400000d 	streq	r0, [r0], #-13
    1390:	0000a0a8 	andeq	sl, r0, r8, lsr #1
    1394:	0cf40800 	ldcleq	8, cr0, [r4]
    1398:	a9040000 	stmdbge	r4, {}	; <UNPREDICTABLE>
    139c:	000000cb 	andeq	r0, r0, fp, asr #1
    13a0:	002c0900 	eoreq	r0, ip, r0, lsl #18
    13a4:	00db0000 	sbcseq	r0, fp, r0
    13a8:	db0a0000 	blle	2813b0 <_heap+0x2013ac>
    13ac:	03000000 	movweq	r0, #0
    13b0:	07040200 	streq	r0, [r4, -r0, lsl #4]
    13b4:	000001b2 			; <UNDEFINED> instruction: 0x000001b2
    13b8:	a304080b 	movwge	r0, #18443	; 0x480b
    13bc:	00000103 	andeq	r0, r0, r3, lsl #2
    13c0:	000e8a0c 	andeq	r8, lr, ip, lsl #20
    13c4:	68a50400 	stmiavs	r5!, {sl}
    13c8:	00000000 	andeq	r0, r0, r0
    13cc:	000e920c 	andeq	r9, lr, ip, lsl #4
    13d0:	acaa0400 	cfstrsge	mvf0, [sl]
    13d4:	04000000 	streq	r0, [r0], #-0
    13d8:	0e170300 	cdpeq	3, 1, cr0, cr7, cr0, {0}
    13dc:	ab040000 	blge	1013e4 <_heap+0x813e0>
    13e0:	000000e2 	andeq	r0, r0, r2, ror #1
    13e4:	000cbd03 	andeq	fp, ip, r3, lsl #26
    13e8:	7faf0400 	svcvc	0x00af0400
    13ec:	03000000 	movweq	r0, #0
    13f0:	00000ee5 	andeq	r0, r0, r5, ror #29
    13f4:	00531606 	subseq	r1, r3, r6, lsl #12
    13f8:	ce0d0000 	cdpgt	0, 0, cr0, cr13, cr0, {0}
    13fc:	1800000c 	stmdane	r0, {r2, r3}
    1400:	01772d06 	cmneq	r7, r6, lsl #26
    1404:	380c0000 	stmdacc	ip, {}	; <UNPREDICTABLE>
    1408:	0600000e 	streq	r0, [r0], -lr
    140c:	0001772f 	andeq	r7, r1, pc, lsr #14
    1410:	5f0e0000 	svcpl	0x000e0000
    1414:	3006006b 	andcc	r0, r6, fp, rrx
    1418:	00000068 	andeq	r0, r0, r8, rrx
    141c:	0e750c04 	cdpeq	12, 7, cr0, cr5, cr4, {0}
    1420:	30060000 	andcc	r0, r6, r0
    1424:	00000068 	andeq	r0, r0, r8, rrx
    1428:	0cb70c08 	ldceq	12, cr0, [r7], #32
    142c:	30060000 	andcc	r0, r6, r0
    1430:	00000068 	andeq	r0, r0, r8, rrx
    1434:	0f2c0c0c 	svceq	0x002c0c0c
    1438:	30060000 	andcc	r0, r6, r0
    143c:	00000068 	andeq	r0, r0, r8, rrx
    1440:	785f0e10 	ldmdavc	pc, {r4, r9, sl, fp}^	; <UNPREDICTABLE>
    1444:	7d310600 	ldcvc	6, cr0, [r1, #-0]
    1448:	14000001 	strne	r0, [r0], #-1
    144c:	24040f00 	strcs	r0, [r4], #-3840	; 0xfffff100
    1450:	09000001 	stmdbeq	r0, {r0}
    1454:	00000119 	andeq	r0, r0, r9, lsl r1
    1458:	0000018d 	andeq	r0, r0, sp, lsl #3
    145c:	0000db0a 	andeq	sp, r0, sl, lsl #22
    1460:	0d000000 	stceq	0, cr0, [r0, #-0]
    1464:	00000cef 	andeq	r0, r0, pc, ror #25
    1468:	06350624 	ldrteq	r0, [r5], -r4, lsr #12
    146c:	0c000002 	stceq	0, cr0, [r0], {2}
    1470:	00000c20 	andeq	r0, r0, r0, lsr #24
    1474:	00683706 	rsbeq	r3, r8, r6, lsl #14
    1478:	0c000000 	stceq	0, cr0, [r0], {-0}
    147c:	00000ea8 	andeq	r0, r0, r8, lsr #29
    1480:	00683806 	rsbeq	r3, r8, r6, lsl #16
    1484:	0c040000 	stceq	0, cr0, [r4], {-0}
    1488:	00000c2f 	andeq	r0, r0, pc, lsr #24
    148c:	00683906 	rsbeq	r3, r8, r6, lsl #18
    1490:	0c080000 	stceq	0, cr0, [r8], {-0}
    1494:	00000fa2 	andeq	r0, r0, r2, lsr #31
    1498:	00683a06 	rsbeq	r3, r8, r6, lsl #20
    149c:	0c0c0000 	stceq	0, cr0, [ip], {-0}
    14a0:	00000d83 	andeq	r0, r0, r3, lsl #27
    14a4:	00683b06 	rsbeq	r3, r8, r6, lsl #22
    14a8:	0c100000 	ldceq	0, cr0, [r0], {-0}
    14ac:	00000d5d 	andeq	r0, r0, sp, asr sp
    14b0:	00683c06 	rsbeq	r3, r8, r6, lsl #24
    14b4:	0c140000 	ldceq	0, cr0, [r4], {-0}
    14b8:	00000f31 	andeq	r0, r0, r1, lsr pc
    14bc:	00683d06 	rsbeq	r3, r8, r6, lsl #26
    14c0:	0c180000 	ldceq	0, cr0, [r8], {-0}
    14c4:	00000df9 	strdeq	r0, [r0], -r9
    14c8:	00683e06 	rsbeq	r3, r8, r6, lsl #28
    14cc:	0c1c0000 	ldceq	0, cr0, [ip], {-0}
    14d0:	00000f69 	andeq	r0, r0, r9, ror #30
    14d4:	00683f06 	rsbeq	r3, r8, r6, lsl #30
    14d8:	00200000 	eoreq	r0, r0, r0
    14dc:	000c3e10 	andeq	r3, ip, r0, lsl lr
    14e0:	06010800 	streq	r0, [r1], -r0, lsl #16
    14e4:	00024648 	andeq	r4, r2, r8, asr #12
    14e8:	0caa0c00 	stceq	12, cr0, [sl]
    14ec:	49060000 	stmdbmi	r6, {}	; <UNPREDICTABLE>
    14f0:	00000246 	andeq	r0, r0, r6, asr #4
    14f4:	0b730c00 	bleq	1cc44fc <_heap+0x1c444f8>
    14f8:	4a060000 	bmi	181500 <_heap+0x1014fc>
    14fc:	00000246 	andeq	r0, r0, r6, asr #4
    1500:	0ed71180 	cdpeq	1, 13, cr1, cr7, cr0, {4}
    1504:	4c060000 	stcmi	0, cr0, [r6], {-0}
    1508:	00000119 	andeq	r0, r0, r9, lsl r1
    150c:	63110100 	tstvs	r1, #0, 2
    1510:	0600000c 	streq	r0, [r0], -ip
    1514:	0001194f 	andeq	r1, r1, pc, asr #18
    1518:	00010400 	andeq	r0, r1, r0, lsl #8
    151c:	00007d09 	andeq	r7, r0, r9, lsl #26
    1520:	00025600 	andeq	r5, r2, r0, lsl #12
    1524:	00db0a00 	sbcseq	r0, fp, r0, lsl #20
    1528:	001f0000 	andseq	r0, pc, r0
    152c:	000d8c10 	andeq	r8, sp, r0, lsl ip
    1530:	06019000 	streq	r9, [r1], -r0
    1534:	0002945b 	andeq	r9, r2, fp, asr r4
    1538:	0e380c00 	cdpeq	12, 3, cr0, cr8, cr0, {0}
    153c:	5c060000 	stcpl	0, cr0, [r6], {-0}
    1540:	00000294 	muleq	r0, r4, r2
    1544:	0e500c00 	cdpeq	12, 5, cr0, cr0, cr0, {0}
    1548:	5d060000 	stcpl	0, cr0, [r6, #-0]
    154c:	00000068 	andeq	r0, r0, r8, rrx
    1550:	0cb20c04 	ldceq	12, cr0, [r2], #16
    1554:	5f060000 	svcpl	0x00060000
    1558:	0000029a 	muleq	r0, sl, r2
    155c:	0c3e0c08 	ldceq	12, cr0, [lr], #-32	; 0xffffffe0
    1560:	60060000 	andvs	r0, r6, r0
    1564:	00000206 	andeq	r0, r0, r6, lsl #4
    1568:	040f0088 	streq	r0, [pc], #-136	; 1570 <CPSR_IRQ_INHIBIT+0x14f0>
    156c:	00000256 	andeq	r0, r0, r6, asr r2
    1570:	0002aa09 	andeq	sl, r2, r9, lsl #20
    1574:	0002aa00 	andeq	sl, r2, r0, lsl #20
    1578:	00db0a00 	sbcseq	r0, fp, r0, lsl #20
    157c:	001f0000 	andseq	r0, pc, r0
    1580:	02b0040f 	adcseq	r0, r0, #251658240	; 0xf000000
    1584:	0d120000 	ldceq	0, cr0, [r2, #-0]
    1588:	00000e03 	andeq	r0, r0, r3, lsl #28
    158c:	d6730608 	ldrbtle	r0, [r3], -r8, lsl #12
    1590:	0c000002 	stceq	0, cr0, [r0], {2}
    1594:	00000f41 	andeq	r0, r0, r1, asr #30
    1598:	02d67406 	sbcseq	r7, r6, #100663296	; 0x6000000
    159c:	0c000000 	stceq	0, cr0, [r0], {-0}
    15a0:	00000b7f 	andeq	r0, r0, pc, ror fp
    15a4:	00687506 	rsbeq	r7, r8, r6, lsl #10
    15a8:	00040000 	andeq	r0, r4, r0
    15ac:	002c040f 	eoreq	r0, ip, pc, lsl #8
    15b0:	220d0000 	andcs	r0, sp, #0
    15b4:	6800000e 	stmdavs	r0, {r1, r2, r3}
    15b8:	0406b306 	streq	fp, [r6], #-774	; 0xfffffcfa
    15bc:	5f0e0000 	svcpl	0x000e0000
    15c0:	b4060070 	strlt	r0, [r6], #-112	; 0xffffff90
    15c4:	000002d6 	ldrdeq	r0, [r0], -r6
    15c8:	725f0e00 	subsvc	r0, pc, #0, 28
    15cc:	68b50600 	ldmvs	r5!, {r9, sl}
    15d0:	04000000 	streq	r0, [r0], #-0
    15d4:	00775f0e 	rsbseq	r5, r7, lr, lsl #30
    15d8:	0068b606 	rsbeq	fp, r8, r6, lsl #12
    15dc:	0c080000 	stceq	0, cr0, [r8], {-0}
    15e0:	00000c5c 	andeq	r0, r0, ip, asr ip
    15e4:	0033b706 	eorseq	fp, r3, r6, lsl #14
    15e8:	0c0c0000 	stceq	0, cr0, [ip], {-0}
    15ec:	00000d0b 	andeq	r0, r0, fp, lsl #26
    15f0:	0033b806 	eorseq	fp, r3, r6, lsl #16
    15f4:	0e0e0000 	cdpeq	0, 0, cr0, cr14, cr0, {0}
    15f8:	0066625f 	rsbeq	r6, r6, pc, asr r2
    15fc:	02b1b906 	adcseq	fp, r1, #98304	; 0x18000
    1600:	0c100000 	ldceq	0, cr0, [r0], {-0}
    1604:	00000bfa 	strdeq	r0, [r0], -sl
    1608:	0068ba06 	rsbeq	fp, r8, r6, lsl #20
    160c:	0c180000 	ldceq	0, cr0, [r8], {-0}
    1610:	00000c4c 	andeq	r0, r0, ip, asr #24
    1614:	007dc106 	rsbseq	ip, sp, r6, lsl #2
    1618:	0c1c0000 	ldceq	0, cr0, [ip], {-0}
    161c:	00001053 	andeq	r1, r0, r3, asr r0
    1620:	0573c306 	ldrbeq	ip, [r3, #-774]!	; 0xfffffcfa
    1624:	0c200000 	stceq	0, cr0, [r0], #-0
    1628:	0000103e 	andeq	r1, r0, lr, lsr r0
    162c:	059dc506 	ldreq	ip, [sp, #1286]	; 0x506
    1630:	0c240000 	stceq	0, cr0, [r4], #-0
    1634:	00000e9a 	muleq	r0, sl, lr
    1638:	05c1c806 	strbeq	ip, [r1, #2054]	; 0x806
    163c:	0c280000 	stceq	0, cr0, [r8], #-0
    1640:	00000f83 	andeq	r0, r0, r3, lsl #31
    1644:	05dbc906 	ldrbeq	ip, [fp, #2310]	; 0x906
    1648:	0e2c0000 	cdpeq	0, 2, cr0, cr12, cr0, {0}
    164c:	0062755f 	rsbeq	r7, r2, pc, asr r5
    1650:	02b1cc06 	adcseq	ip, r1, #1536	; 0x600
    1654:	0e300000 	cdpeq	0, 3, cr0, cr0, cr0, {0}
    1658:	0070755f 	rsbseq	r7, r0, pc, asr r5
    165c:	02d6cd06 	sbcseq	ip, r6, #384	; 0x180
    1660:	0e380000 	cdpeq	0, 3, cr0, cr8, cr0, {0}
    1664:	0072755f 	rsbseq	r7, r2, pc, asr r5
    1668:	0068ce06 	rsbeq	ip, r8, r6, lsl #28
    166c:	0c3c0000 	ldceq	0, cr0, [ip], #-0
    1670:	00000c29 	andeq	r0, r0, r9, lsr #24
    1674:	05e1d106 	strbeq	sp, [r1, #262]!	; 0x106
    1678:	0c400000 	mareq	acc0, r0, r0
    167c:	00000f5b 	andeq	r0, r0, fp, asr pc
    1680:	05f1d206 	ldrbeq	sp, [r1, #518]!	; 0x206
    1684:	0e430000 	cdpeq	0, 4, cr0, cr3, cr0, {0}
    1688:	00626c5f 	rsbeq	r6, r2, pc, asr ip
    168c:	02b1d506 	adcseq	sp, r1, #25165824	; 0x1800000
    1690:	0c440000 	mareq	acc0, r0, r4
    1694:	00000c72 	andeq	r0, r0, r2, ror ip
    1698:	0068d806 	rsbeq	sp, r8, r6, lsl #16
    169c:	0c4c0000 	mareq	acc0, r0, ip
    16a0:	00000c83 	andeq	r0, r0, r3, lsl #25
    16a4:	008ad906 	addeq	sp, sl, r6, lsl #18
    16a8:	0c500000 	mraeq	r0, r0, acc0
    16ac:	00000abd 			; <UNDEFINED> instruction: 0x00000abd
    16b0:	0424dc06 	strteq	sp, [r4], #-3078	; 0xfffff3fa
    16b4:	0c540000 	mraeq	r0, r4, acc0
    16b8:	00000d4f 	andeq	r0, r0, pc, asr #26
    16bc:	010ee006 	tsteq	lr, r6
    16c0:	0c580000 	mraeq	r0, r8, acc0
    16c4:	00000e2a 	andeq	r0, r0, sl, lsr #28
    16c8:	0103e206 	tsteq	r3, r6, lsl #4
    16cc:	0c5c0000 	mraeq	r0, ip, acc0
    16d0:	00000d55 	andeq	r0, r0, r5, asr sp
    16d4:	0068e306 	rsbeq	lr, r8, r6, lsl #6
    16d8:	00640000 	rsbeq	r0, r4, r0
    16dc:	00006813 	andeq	r6, r0, r3, lsl r8
    16e0:	00042400 	andeq	r2, r4, r0, lsl #8
    16e4:	04241400 	strteq	r1, [r4], #-1024	; 0xfffffc00
    16e8:	7d140000 	ldcvc	0, cr0, [r4, #-0]
    16ec:	14000000 	strne	r0, [r0], #-0
    16f0:	00000561 	andeq	r0, r0, r1, ror #10
    16f4:	00006814 	andeq	r6, r0, r4, lsl r8
    16f8:	040f0000 	streq	r0, [pc], #-0	; 1700 <CPSR_IRQ_INHIBIT+0x1680>
    16fc:	0000042f 	andeq	r0, r0, pc, lsr #8
    1700:	00042415 	andeq	r2, r4, r5, lsl r4
    1704:	0e7d1600 	cdpeq	6, 7, cr1, cr13, cr0, {0}
    1708:	04280000 	strteq	r0, [r8], #-0
    170c:	61023806 	tstvs	r2, r6, lsl #16
    1710:	17000005 	strne	r0, [r0, -r5]
    1714:	00000df2 	strdeq	r0, [r0], -r2
    1718:	68023a06 	stmdavs	r2, {r1, r2, r9, fp, ip, sp}
    171c:	00000000 	andeq	r0, r0, r0
    1720:	000c6b17 	andeq	r6, ip, r7, lsl fp
    1724:	023f0600 	eorseq	r0, pc, #0, 12
    1728:	00000648 	andeq	r0, r0, r8, asr #12
    172c:	0cfb1704 	ldcleq	7, cr1, [fp], #16
    1730:	3f060000 	svccc	0x00060000
    1734:	00064802 	andeq	r4, r6, r2, lsl #16
    1738:	c6170800 	ldrgt	r0, [r7], -r0, lsl #16
    173c:	0600000c 	streq	r0, [r0], -ip
    1740:	0648023f 			; <UNDEFINED> instruction: 0x0648023f
    1744:	170c0000 	strne	r0, [ip, -r0]
    1748:	00000e4b 	andeq	r0, r0, fp, asr #28
    174c:	68024106 	stmdavs	r2, {r1, r2, r8, lr}
    1750:	10000000 	andne	r0, r0, r0
    1754:	000ba417 	andeq	sl, fp, r7, lsl r4
    1758:	02420600 	subeq	r0, r2, #0, 12
    175c:	0000082a 	andeq	r0, r0, sl, lsr #16
    1760:	0f0d1714 	svceq	0x000d1714
    1764:	44060000 	strmi	r0, [r6], #-0
    1768:	00006802 	andeq	r6, r0, r2, lsl #16
    176c:	55173000 	ldrpl	r3, [r7, #-0]
    1770:	0600000e 	streq	r0, [r0], -lr
    1774:	05970245 	ldreq	r0, [r7, #581]	; 0x245
    1778:	17340000 	ldrne	r0, [r4, -r0]!
    177c:	00000d9e 	muleq	r0, lr, sp
    1780:	68024706 	stmdavs	r2, {r1, r2, r8, r9, sl, lr}
    1784:	38000000 	stmdacc	r0, {}	; <UNPREDICTABLE>
    1788:	000e6b17 	andeq	r6, lr, r7, lsl fp
    178c:	02490600 	subeq	r0, r9, #0, 12
    1790:	00000845 	andeq	r0, r0, r5, asr #16
    1794:	0d3a173c 	ldceq	7, cr1, [sl, #-240]!	; 0xffffff10
    1798:	4c060000 	stcmi	0, cr0, [r6], {-0}
    179c:	00017702 	andeq	r7, r1, r2, lsl #14
    17a0:	e5174000 	ldr	r4, [r7, #-0]
    17a4:	0600000c 	streq	r0, [r0], -ip
    17a8:	0068024d 	rsbeq	r0, r8, sp, asr #4
    17ac:	17440000 	strbne	r0, [r4, -r0]
    17b0:	00000f9d 	muleq	r0, sp, pc	; <UNPREDICTABLE>
    17b4:	77024e06 	strvc	r4, [r2, -r6, lsl #28]
    17b8:	48000001 	stmdami	r0, {r0}
    17bc:	000dcf17 	andeq	ip, sp, r7, lsl pc
    17c0:	024f0600 	subeq	r0, pc, #0, 12
    17c4:	0000084b 	andeq	r0, r0, fp, asr #16
    17c8:	0d03174c 	stceq	7, cr1, [r3, #-304]	; 0xfffffed0
    17cc:	52060000 	andpl	r0, r6, #0
    17d0:	00006802 	andeq	r6, r0, r2, lsl #16
    17d4:	7b175000 	blvc	5d57dc <_heap+0x5557d8>
    17d8:	0600000c 	streq	r0, [r0], -ip
    17dc:	05610253 	strbeq	r0, [r1, #-595]!	; 0xfffffdad
    17e0:	17540000 	ldrbne	r0, [r4, -r0]
    17e4:	00000deb 	andeq	r0, r0, fp, ror #27
    17e8:	08027606 	stmdaeq	r2, {r1, r2, r9, sl, ip, sp, lr}
    17ec:	58000008 	stmdapl	r0, {r3}
    17f0:	000d8c18 	andeq	r8, sp, r8, lsl ip
    17f4:	027a0600 	rsbseq	r0, sl, #0, 12
    17f8:	00000294 	muleq	r0, r4, r2
    17fc:	18180148 	ldmdane	r8, {r3, r6, r8}
    1800:	0600000d 	streq	r0, [r0], -sp
    1804:	0256027b 	subseq	r0, r6, #-1342177273	; 0xb0000007
    1808:	014c0000 	mrseq	r0, (UNDEF: 76)
    180c:	000f5118 	andeq	r5, pc, r8, lsl r1	; <UNPREDICTABLE>
    1810:	027f0600 	rsbseq	r0, pc, #0, 12
    1814:	0000085c 	andeq	r0, r0, ip, asr r8
    1818:	541802dc 	ldrpl	r0, [r8], #-732	; 0xfffffd24
    181c:	0600000c 	streq	r0, [r0], -ip
    1820:	060d0284 	streq	r0, [sp], -r4, lsl #5
    1824:	02e00000 	rsceq	r0, r0, #0
    1828:	000c3918 	andeq	r3, ip, r8, lsl r9
    182c:	02850600 	addeq	r0, r5, #0, 12
    1830:	00000868 	andeq	r0, r0, r8, ror #16
    1834:	0f0002ec 	svceq	0x000002ec
    1838:	00056704 	andeq	r6, r5, r4, lsl #14
    183c:	08010200 	stmdaeq	r1, {r9}
    1840:	000000c9 	andeq	r0, r0, r9, asr #1
    1844:	00056715 	andeq	r6, r5, r5, lsl r7
    1848:	06040f00 	streq	r0, [r4], -r0, lsl #30
    184c:	13000004 	movwne	r0, #4
    1850:	00000068 	andeq	r0, r0, r8, rrx
    1854:	00000597 	muleq	r0, r7, r5
    1858:	00042414 	andeq	r2, r4, r4, lsl r4
    185c:	007d1400 	rsbseq	r1, sp, r0, lsl #8
    1860:	97140000 	ldrls	r0, [r4, -r0]
    1864:	14000005 	strne	r0, [r0], #-5
    1868:	00000068 	andeq	r0, r0, r8, rrx
    186c:	6e040f00 	cdpvs	15, 0, cr0, cr4, cr0, {0}
    1870:	0f000005 	svceq	0x00000005
    1874:	00057904 	andeq	r7, r5, r4, lsl #18
    1878:	00951300 	addseq	r1, r5, r0, lsl #6
    187c:	05c10000 	strbeq	r0, [r1]
    1880:	24140000 	ldrcs	r0, [r4], #-0
    1884:	14000004 	strne	r0, [r0], #-4
    1888:	0000007d 	andeq	r0, r0, sp, ror r0
    188c:	00009514 	andeq	r9, r0, r4, lsl r5
    1890:	00681400 	rsbeq	r1, r8, r0, lsl #8
    1894:	0f000000 	svceq	0x00000000
    1898:	0005a304 	andeq	sl, r5, r4, lsl #6
    189c:	00681300 	rsbeq	r1, r8, r0, lsl #6
    18a0:	05db0000 	ldrbeq	r0, [fp]
    18a4:	24140000 	ldrcs	r0, [r4], #-0
    18a8:	14000004 	strne	r0, [r0], #-4
    18ac:	0000007d 	andeq	r0, r0, sp, ror r0
    18b0:	c7040f00 	strgt	r0, [r4, -r0, lsl #30]
    18b4:	09000005 	stmdbeq	r0, {r0, r2}
    18b8:	0000002c 	andeq	r0, r0, ip, lsr #32
    18bc:	000005f1 	strdeq	r0, [r0], -r1
    18c0:	0000db0a 	andeq	sp, r0, sl, lsl #22
    18c4:	09000200 	stmdbeq	r0, {r9}
    18c8:	0000002c 	andeq	r0, r0, ip, lsr #32
    18cc:	00000601 	andeq	r0, r0, r1, lsl #12
    18d0:	0000db0a 	andeq	sp, r0, sl, lsl #22
    18d4:	06000000 	streq	r0, [r0], -r0
    18d8:	00000e10 	andeq	r0, r0, r0, lsl lr
    18dc:	dc011d06 	stcle	13, cr1, [r1], {6}
    18e0:	19000002 	stmdbne	r0, {r1}
    18e4:	00000f3b 	andeq	r0, r0, fp, lsr pc
    18e8:	0121060c 			; <UNDEFINED> instruction: 0x0121060c
    18ec:	00000642 	andeq	r0, r0, r2, asr #12
    18f0:	000e3817 	andeq	r3, lr, r7, lsl r8
    18f4:	01230600 			; <UNDEFINED> instruction: 0x01230600
    18f8:	00000642 	andeq	r0, r0, r2, asr #12
    18fc:	0d111700 	ldceq	7, cr1, [r1, #-0]
    1900:	24060000 	strcs	r0, [r6], #-0
    1904:	00006801 	andeq	r6, r0, r1, lsl #16
    1908:	0a170400 	beq	5c2910 <_heap+0x54290c>
    190c:	0600000e 	streq	r0, [r0], -lr
    1910:	06480125 	strbeq	r0, [r8], -r5, lsr #2
    1914:	00080000 	andeq	r0, r8, r0
    1918:	060d040f 	streq	r0, [sp], -pc, lsl #8
    191c:	040f0000 	streq	r0, [pc], #-0	; 1924 <CPSR_IRQ_INHIBIT+0x18a4>
    1920:	00000601 	andeq	r0, r0, r1, lsl #12
    1924:	000b9c19 	andeq	r9, fp, r9, lsl ip
    1928:	3d060e00 	stccc	14, cr0, [r6, #-0]
    192c:	00068301 	andeq	r8, r6, r1, lsl #6
    1930:	0e841700 	cdpeq	7, 8, cr1, cr4, cr0, {0}
    1934:	3e060000 	cdpcc	0, 0, cr0, cr6, cr0, {0}
    1938:	00068301 	andeq	r8, r6, r1, lsl #6
    193c:	b1170000 	tstlt	r7, r0
    1940:	0600000e 	streq	r0, [r0], -lr
    1944:	0683013f 			; <UNDEFINED> instruction: 0x0683013f
    1948:	17060000 	strne	r0, [r6, -r0]
    194c:	00000ee0 	andeq	r0, r0, r0, ror #29
    1950:	3a014006 	bcc	51970 <__bss_end__+0x48b64>
    1954:	0c000000 	stceq	0, cr0, [r0], {-0}
    1958:	003a0900 	eorseq	r0, sl, r0, lsl #18
    195c:	06930000 	ldreq	r0, [r3], r0
    1960:	db0a0000 	blle	281968 <_heap+0x201964>
    1964:	02000000 	andeq	r0, r0, #0
    1968:	06d01a00 	ldrbeq	r1, [r0], r0, lsl #20
    196c:	07940257 			; <UNDEFINED> instruction: 0x07940257
    1970:	1f170000 	svcne	0x00170000
    1974:	0600000f 	streq	r0, [r0], -pc
    1978:	006f0259 	rsbeq	r0, pc, r9, asr r2	; <UNPREDICTABLE>
    197c:	17000000 	strne	r0, [r0, -r0]
    1980:	00000eca 	andeq	r0, r0, sl, asr #29
    1984:	61025a06 	tstvs	r2, r6, lsl #20
    1988:	04000005 	streq	r0, [r0], #-5
    198c:	000d2d17 	andeq	r2, sp, r7, lsl sp
    1990:	025b0600 	subseq	r0, fp, #0, 12
    1994:	00000794 	muleq	r0, r4, r7
    1998:	0f741708 	svceq	0x00741708
    199c:	5c060000 	stcpl	0, cr0, [r6], {-0}
    19a0:	00018d02 	andeq	r8, r1, r2, lsl #26
    19a4:	d6172400 	ldrle	r2, [r7], -r0, lsl #8
    19a8:	0600000c 	streq	r0, [r0], -ip
    19ac:	0068025d 	rsbeq	r0, r8, sp, asr r2
    19b0:	17480000 	strbne	r0, [r8, -r0]
    19b4:	00000e33 	andeq	r0, r0, r3, lsr lr
    19b8:	61025e06 	tstvs	r2, r6, lsl #28
    19bc:	50000000 	andpl	r0, r0, r0
    19c0:	000f8a17 	andeq	r8, pc, r7, lsl sl	; <UNPREDICTABLE>
    19c4:	025f0600 	subseq	r0, pc, #0, 12
    19c8:	0000064e 	andeq	r0, r0, lr, asr #12
    19cc:	0e3e1758 	mrceq	7, 1, r1, cr14, cr8, {2}
    19d0:	60060000 	andvs	r0, r6, r0
    19d4:	00010302 	andeq	r0, r1, r2, lsl #6
    19d8:	8f176800 	svchi	0x00176800
    19dc:	0600000f 	streq	r0, [r0], -pc
    19e0:	01030261 	tsteq	r3, r1, ror #4
    19e4:	17700000 	ldrbne	r0, [r0, -r0]!
    19e8:	00000c12 	andeq	r0, r0, r2, lsl ip
    19ec:	03026206 	movweq	r6, #8710	; 0x2206
    19f0:	78000001 	stmdavc	r0, {r0}
    19f4:	000f4717 	andeq	r4, pc, r7, lsl r7	; <UNPREDICTABLE>
    19f8:	02630600 	rsbeq	r0, r3, #0, 12
    19fc:	000007a4 	andeq	r0, r0, r4, lsr #15
    1a00:	0d211780 	stceq	7, cr1, [r1, #-512]!	; 0xfffffe00
    1a04:	64060000 	strvs	r0, [r6], #-0
    1a08:	0007b402 	andeq	fp, r7, r2, lsl #8
    1a0c:	ed178800 	ldc	8, cr8, [r7, #-0]
    1a10:	0600000e 	streq	r0, [r0], -lr
    1a14:	00680265 	rsbeq	r0, r8, r5, ror #4
    1a18:	17a00000 	strne	r0, [r0, r0]!
    1a1c:	00000c9c 	muleq	r0, ip, ip
    1a20:	03026606 	movweq	r6, #9734	; 0x2606
    1a24:	a4000001 	strge	r0, [r0], #-1
    1a28:	000c0317 	andeq	r0, ip, r7, lsl r3
    1a2c:	02670600 	rsbeq	r0, r7, #0, 12
    1a30:	00000103 	andeq	r0, r0, r3, lsl #2
    1a34:	0c8b17ac 	stceq	7, cr1, [fp], {172}	; 0xac
    1a38:	68060000 	stmdavs	r6, {}	; <UNPREDICTABLE>
    1a3c:	00010302 	andeq	r0, r1, r2, lsl #6
    1a40:	af17b400 	svcge	0x0017b400
    1a44:	0600000b 	streq	r0, [r0], -fp
    1a48:	01030269 	tsteq	r3, r9, ror #4
    1a4c:	17bc0000 	ldrne	r0, [ip, r0]!
    1a50:	00000bbe 			; <UNDEFINED> instruction: 0x00000bbe
    1a54:	03026a06 	movweq	r6, #10758	; 0x2a06
    1a58:	c4000001 	strgt	r0, [r0], #-1
    1a5c:	000df017 	andeq	pc, sp, r7, lsl r0	; <UNPREDICTABLE>
    1a60:	026b0600 	rsbeq	r0, fp, #0, 12
    1a64:	00000068 	andeq	r0, r0, r8, rrx
    1a68:	670900cc 	strvs	r0, [r9, -ip, asr #1]
    1a6c:	a4000005 	strge	r0, [r0], #-5
    1a70:	0a000007 	beq	1a94 <CPSR_IRQ_INHIBIT+0x1a14>
    1a74:	000000db 	ldrdeq	r0, [r0], -fp
    1a78:	67090019 	smladvs	r9, r9, r0, r0
    1a7c:	b4000005 	strlt	r0, [r0], #-5
    1a80:	0a000007 	beq	1aa4 <CPSR_IRQ_INHIBIT+0x1a24>
    1a84:	000000db 	ldrdeq	r0, [r0], -fp
    1a88:	67090007 	strvs	r0, [r9, -r7]
    1a8c:	c4000005 	strgt	r0, [r0], #-5
    1a90:	0a000007 	beq	1ab4 <CPSR_IRQ_INHIBIT+0x1a34>
    1a94:	000000db 	ldrdeq	r0, [r0], -fp
    1a98:	f01a0017 			; <UNDEFINED> instruction: 0xf01a0017
    1a9c:	e8027006 	stmda	r2, {r1, r2, ip, sp, lr}
    1aa0:	17000007 	strne	r0, [r0, -r7]
    1aa4:	00000d7c 	andeq	r0, r0, ip, ror sp
    1aa8:	e8027306 	stmda	r2, {r1, r2, r8, r9, ip, sp, lr}
    1aac:	00000007 	andeq	r0, r0, r7
    1ab0:	000d6717 	andeq	r6, sp, r7, lsl r7
    1ab4:	02740600 	rsbseq	r0, r4, #0, 12
    1ab8:	000007f8 	strdeq	r0, [r0], -r8
    1abc:	d6090078 			; <UNDEFINED> instruction: 0xd6090078
    1ac0:	f8000002 			; <UNDEFINED> instruction: 0xf8000002
    1ac4:	0a000007 	beq	1ae8 <CPSR_IRQ_INHIBIT+0x1a68>
    1ac8:	000000db 	ldrdeq	r0, [r0], -fp
    1acc:	6f09001d 	svcvs	0x0009001d
    1ad0:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
    1ad4:	0a000008 	beq	1afc <CPSR_IRQ_INHIBIT+0x1a7c>
    1ad8:	000000db 	ldrdeq	r0, [r0], -fp
    1adc:	f01b001d 			; <UNDEFINED> instruction: 0xf01b001d
    1ae0:	2a025506 	bcs	96f00 <_heap+0x16efc>
    1ae4:	1c000008 	stcne	0, cr0, [r0], {8}
    1ae8:	00000e7d 	andeq	r0, r0, sp, ror lr
    1aec:	93026c06 	movwls	r6, #11270	; 0x2c06
    1af0:	1c000006 	stcne	0, cr0, [r0], {6}
    1af4:	00000f61 	andeq	r0, r0, r1, ror #30
    1af8:	c4027506 	strgt	r7, [r2], #-1286	; 0xfffffafa
    1afc:	00000007 	andeq	r0, r0, r7
    1b00:	00056709 	andeq	r6, r5, r9, lsl #14
    1b04:	00083a00 	andeq	r3, r8, r0, lsl #20
    1b08:	00db0a00 	sbcseq	r0, fp, r0, lsl #20
    1b0c:	00180000 	andseq	r0, r8, r0
    1b10:	0008451d 	andeq	r4, r8, sp, lsl r5
    1b14:	04241400 	strteq	r1, [r4], #-1024	; 0xfffffc00
    1b18:	0f000000 	svceq	0x00000000
    1b1c:	00083a04 	andeq	r3, r8, r4, lsl #20
    1b20:	77040f00 	strvc	r0, [r4, -r0, lsl #30]
    1b24:	1d000001 	stcne	0, cr0, [r0, #-4]
    1b28:	0000085c 	andeq	r0, r0, ip, asr r8
    1b2c:	00006814 	andeq	r6, r0, r4, lsl r8
    1b30:	040f0000 	streq	r0, [pc], #-0	; 1b38 <CPSR_IRQ_INHIBIT+0x1ab8>
    1b34:	00000862 	andeq	r0, r0, r2, ror #16
    1b38:	0851040f 	ldmdaeq	r1, {r0, r1, r2, r3, sl}^
    1b3c:	01090000 	mrseq	r0, (UNDEF: 9)
    1b40:	78000006 	stmdavc	r0, {r1, r2}
    1b44:	0a000008 	beq	1b6c <CPSR_IRQ_INHIBIT+0x1aec>
    1b48:	000000db 	ldrdeq	r0, [r0], -fp
    1b4c:	011e0002 	tsteq	lr, r2
    1b50:	0600000f 	streq	r0, [r0], -pc
    1b54:	042402fd 	strteq	r0, [r4], #-765	; 0xfffffd03
    1b58:	fa1e0000 	blx	781b60 <_heap+0x701b5c>
    1b5c:	0600000e 	streq	r0, [r0], -lr
    1b60:	042a02fe 	strteq	r0, [sl], #-766	; 0xfffffd02
    1b64:	e3030000 	movw	r0, #12288	; 0x3000
    1b68:	07000000 	streq	r0, [r0, -r0]
    1b6c:	00004830 	andeq	r4, r0, r0, lsr r8
    1b70:	08901f00 	ldmeq	r0, {r8, r9, sl, fp, ip}
    1b74:	9b150000 	blls	541b7c <_heap+0x4c1b78>
    1b78:	20000008 	andcs	r0, r0, r8
    1b7c:	00000d94 	muleq	r0, r4, sp
    1b80:	05615f08 	strbeq	r5, [r1, #-3848]!	; 0xfffff0f8
    1b84:	67090000 	strvs	r0, [r9, -r0]
    1b88:	c0000005 	andgt	r0, r0, r5
    1b8c:	0a000008 	beq	1bb4 <CPSR_IRQ_INHIBIT+0x1b34>
    1b90:	000000db 	ldrdeq	r0, [r0], -fp
    1b94:	8a030009 	bhi	c1bc0 <_heap+0x41bbc>
    1b98:	09000005 	stmdbeq	r0, {r0, r2}
    1b9c:	00089b12 	andeq	r9, r8, r2, lsl fp
    1ba0:	05000300 	streq	r0, [r0, #-768]	; 0xfffffd00
    1ba4:	13090000 	movwne	r0, #36864	; 0x9000
    1ba8:	000008a0 	andeq	r0, r0, r0, lsr #17
    1bac:	390a2c0b 	stmdbcc	sl, {r0, r1, r3, sl, fp, sp}
    1bb0:	00000963 	andeq	r0, r0, r3, ror #18
    1bb4:	000a100c 	andeq	r1, sl, ip
    1bb8:	c03a0a00 	eorsgt	r0, sl, r0, lsl #20
    1bbc:	00000008 	andeq	r0, r0, r8
    1bc0:	000a7c0c 	andeq	r7, sl, ip, lsl #24
    1bc4:	c03b0a00 	eorsgt	r0, fp, r0, lsl #20
    1bc8:	04000008 	streq	r0, [r0], #-8
    1bcc:	000a970c 	andeq	r9, sl, ip, lsl #14
    1bd0:	c03c0a00 	eorsgt	r0, ip, r0, lsl #20
    1bd4:	08000008 	stmdaeq	r0, {r3}
    1bd8:	000b1a0c 	andeq	r1, fp, ip, lsl #20
    1bdc:	c03d0a00 	eorsgt	r0, sp, r0, lsl #20
    1be0:	0c000008 	stceq	0, cr0, [r0], {8}
    1be4:	000a010c 	andeq	r0, sl, ip, lsl #2
    1be8:	c03e0a00 	eorsgt	r0, lr, r0, lsl #20
    1bec:	10000008 	andne	r0, r0, r8
    1bf0:	0009c10c 	andeq	ip, r9, ip, lsl #2
    1bf4:	cb3f0a00 	blgt	fc43fc <_heap+0xf443f8>
    1bf8:	14000008 	strne	r0, [r0], #-8
    1bfc:	000a680c 	andeq	r6, sl, ip, lsl #16
    1c00:	cb400a00 	blgt	1004408 <_heap+0xf84404>
    1c04:	18000008 	stmdane	r0, {r3}
    1c08:	00098f0c 	andeq	r8, r9, ip, lsl #30
    1c0c:	c0410a00 	subgt	r0, r1, r0, lsl #20
    1c10:	1c000008 	stcne	0, cr0, [r0], {8}
    1c14:	000b530c 	andeq	r5, fp, ip, lsl #6
    1c18:	c0420a00 	subgt	r0, r2, r0, lsl #20
    1c1c:	20000008 	andcs	r0, r0, r8
    1c20:	000b050c 	andeq	r0, fp, ip, lsl #10
    1c24:	cb430a00 	blgt	10c442c <_heap+0x1044428>
    1c28:	24000008 	strcs	r0, [r0], #-8
    1c2c:	000a580c 	andeq	r5, sl, ip, lsl #16
    1c30:	c0440a00 	subgt	r0, r4, r0, lsl #20
    1c34:	28000008 	stmdacs	r0, {r3}
    1c38:	099e0300 	ldmibeq	lr, {r8, r9}
    1c3c:	450a0000 	strmi	r0, [sl, #-0]
    1c40:	000008d6 	ldrdeq	r0, [r0], -r6
    1c44:	000fac21 	andeq	sl, pc, r1, lsr #24
    1c48:	68090100 	stmdavs	r9, {r8}
    1c4c:	e8000000 	stmda	r0, {}	; <UNPREDICTABLE>
    1c50:	a8000089 	stmdage	r0, {r0, r3, r7}
    1c54:	01000000 	mrseq	r0, (UNDEF: 0)
    1c58:	0009e09c 	muleq	r9, ip, r0
    1c5c:	0b852200 	bleq	fe14a464 <CPSR_UNAFFECTED_BITS+0xfe14a564>
    1c60:	0b010000 	bleq	41c68 <__bss_end__+0x38e5c>
    1c64:	00000794 	muleq	r0, r4, r7
    1c68:	8dd00305 	ldclhi	3, cr0, [r0, #20]
    1c6c:	b7220000 	strlt	r0, [r2, -r0]!
    1c70:	0100000e 	tsteq	r0, lr
    1c74:	0009e00c 	andeq	lr, r9, ip
    1c78:	ac030500 	cfstr32ge	mvfx0, [r3], {-0}
    1c7c:	2300008d 	movwcs	r0, #141	; 0x8d
    1c80:	0e010069 	cdpeq	0, 0, cr0, cr1, cr9, {3}
    1c84:	00000068 	andeq	r0, r0, r8, rrx
    1c88:	22749102 	rsbscs	r9, r4, #-2147483648	; 0x80000000
    1c8c:	00000a8b 	andeq	r0, r0, fp, lsl #21
    1c90:	09f00f01 	ldmibeq	r0!, {r0, r8, r9, sl, fp}^
    1c94:	91020000 	mrsls	r0, (UNDEF: 2)
    1c98:	0e65226c 	cdpeq	2, 6, cr2, cr5, cr12, {3}
    1c9c:	11010000 	mrsne	r0, (UNDEF: 1)
    1ca0:	000008b0 			; <UNDEFINED> instruction: 0x000008b0
    1ca4:	22609102 	rsbcs	r9, r0, #-2147483648	; 0x80000000
    1ca8:	000000b6 	strheq	r0, [r0], -r6
    1cac:	05611201 	strbeq	r1, [r1, #-513]!	; 0xfffffdff
    1cb0:	91020000 	mrsls	r0, (UNDEF: 2)
    1cb4:	67090070 	smlsdxvs	r9, r0, r0, r0
    1cb8:	f0000005 			; <UNDEFINED> instruction: 0xf0000005
    1cbc:	0a000009 	beq	1ce8 <CPSR_IRQ_INHIBIT+0x1c68>
    1cc0:	000000db 	ldrdeq	r0, [r0], -fp
    1cc4:	040f0020 	streq	r0, [pc], #-32	; 1ccc <CPSR_IRQ_INHIBIT+0x1c4c>
    1cc8:	00000963 	andeq	r0, r0, r3, ror #18
    1ccc:	0001b900 	andeq	fp, r1, r0, lsl #18
    1cd0:	ae000400 	cfcpysge	mvf0, mvf0
    1cd4:	04000007 	streq	r0, [r0], #-7
    1cd8:	00004401 	andeq	r4, r0, r1, lsl #8
    1cdc:	0fc80c00 	svceq	0x00c80c00
    1ce0:	8a900000 	bhi	fe401ce8 <CPSR_UNAFFECTED_BITS+0xfe401de8>
    1ce4:	009c0000 	addseq	r0, ip, r0
    1ce8:	09330000 	ldmdbeq	r3!, {}	; <UNPREDICTABLE>
    1cec:	01020000 	mrseq	r0, (UNDEF: 2)
    1cf0:	0000c206 	andeq	ip, r0, r6, lsl #4
    1cf4:	08010200 	stmdaeq	r1, {r9}
    1cf8:	000000c0 	andeq	r0, r0, r0, asr #1
    1cfc:	2e050202 	cdpcs	2, 0, cr0, cr5, cr2, {0}
    1d00:	02000001 	andeq	r0, r0, #1
    1d04:	00ce0702 	sbceq	r0, lr, r2, lsl #14
    1d08:	04020000 	streq	r0, [r2], #-0
    1d0c:	00012505 	andeq	r2, r1, r5, lsl #10
    1d10:	00e10300 	rsceq	r0, r1, r0, lsl #6
    1d14:	41020000 	mrsmi	r0, (UNDEF: 2)
    1d18:	0000004f 	andeq	r0, r0, pc, asr #32
    1d1c:	0e070402 	cdpeq	4, 0, cr0, cr7, cr2, {0}
    1d20:	02000001 	andeq	r0, r0, #1
    1d24:	01200508 			; <UNDEFINED> instruction: 0x01200508
    1d28:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
    1d2c:	00010907 	andeq	r0, r1, r7, lsl #18
    1d30:	05040400 	streq	r0, [r4, #-1024]	; 0xfffffc00
    1d34:	00746e69 	rsbseq	r6, r4, r9, ror #28
    1d38:	13070402 	movwne	r0, #29698	; 0x7402
    1d3c:	03000001 	movweq	r0, #1
    1d40:	000000e3 	andeq	r0, r0, r3, ror #1
    1d44:	00443003 	subeq	r3, r4, r3
    1d48:	72050000 	andvc	r0, r5, #0
    1d4c:	06000000 	streq	r0, [r0], -r0
    1d50:	0000007d 	andeq	r0, r0, sp, ror r0
    1d54:	00058a03 	andeq	r8, r5, r3, lsl #20
    1d58:	7d120400 	cfldrsvc	mvf0, [r2, #-0]
    1d5c:	03000000 	movweq	r0, #0
    1d60:	00000500 	andeq	r0, r0, r0, lsl #10
    1d64:	00821304 	addeq	r1, r2, r4, lsl #6
    1d68:	2c070000 	stccs	0, cr0, [r7], {-0}
    1d6c:	012a3905 			; <UNDEFINED> instruction: 0x012a3905
    1d70:	10080000 	andne	r0, r8, r0
    1d74:	0500000a 	streq	r0, [r0, #-10]
    1d78:	0000873a 	andeq	r8, r0, sl, lsr r7
    1d7c:	7c080000 	stcvc	0, cr0, [r8], {-0}
    1d80:	0500000a 	streq	r0, [r0, #-10]
    1d84:	0000873b 	andeq	r8, r0, fp, lsr r7
    1d88:	97080400 	strls	r0, [r8, -r0, lsl #8]
    1d8c:	0500000a 	streq	r0, [r0, #-10]
    1d90:	0000873c 	andeq	r8, r0, ip, lsr r7
    1d94:	1a080800 	bne	203d9c <_heap+0x183d98>
    1d98:	0500000b 	streq	r0, [r0, #-11]
    1d9c:	0000873d 	andeq	r8, r0, sp, lsr r7
    1da0:	01080c00 	tsteq	r8, r0, lsl #24
    1da4:	0500000a 	streq	r0, [r0, #-10]
    1da8:	0000873e 	andeq	r8, r0, lr, lsr r7
    1dac:	c1081000 	mrsgt	r1, (UNDEF: 8)
    1db0:	05000009 	streq	r0, [r0, #-9]
    1db4:	0000923f 	andeq	r9, r0, pc, lsr r2
    1db8:	68081400 	stmdavs	r8, {sl, ip}
    1dbc:	0500000a 	streq	r0, [r0, #-10]
    1dc0:	00009240 	andeq	r9, r0, r0, asr #4
    1dc4:	8f081800 	svchi	0x00081800
    1dc8:	05000009 	streq	r0, [r0, #-9]
    1dcc:	00008741 	andeq	r8, r0, r1, asr #14
    1dd0:	53081c00 	movwpl	r1, #35840	; 0x8c00
    1dd4:	0500000b 	streq	r0, [r0, #-11]
    1dd8:	00008742 	andeq	r8, r0, r2, asr #14
    1ddc:	05082000 	streq	r2, [r8, #-0]
    1de0:	0500000b 	streq	r0, [r0, #-11]
    1de4:	00009243 	andeq	r9, r0, r3, asr #4
    1de8:	58082400 	stmdapl	r8, {sl, sp}
    1dec:	0500000a 	streq	r0, [r0, #-10]
    1df0:	00008744 	andeq	r8, r0, r4, asr #14
    1df4:	03002800 	movweq	r2, #2048	; 0x800
    1df8:	0000099e 	muleq	r0, lr, r9
    1dfc:	009d4505 	addseq	r4, sp, r5, lsl #10
    1e00:	b7090000 	strlt	r0, [r9, -r0]
    1e04:	0100000f 	tsteq	r0, pc
    1e08:	008a9005 	addeq	r9, sl, r5
    1e0c:	00009c00 	andeq	r9, r0, r0, lsl #24
    1e10:	a99c0100 	ldmibge	ip, {r8}
    1e14:	0a000001 	beq	1e20 <CPSR_IRQ_INHIBIT+0x1da0>
    1e18:	00000ff1 	strdeq	r0, [r0], -r1
    1e1c:	006b0501 	rsbeq	r0, fp, r1, lsl #10
    1e20:	91020000 	mrsls	r0, (UNDEF: 2)
    1e24:	0ff80a64 	svceq	0x00f80a64
    1e28:	05010000 	streq	r0, [r1, #-0]
    1e2c:	000001a9 	andeq	r0, r0, r9, lsr #3
    1e30:	0b609102 	bleq	1826240 <_heap+0x17a623c>
    1e34:	00008ab0 			; <UNDEFINED> instruction: 0x00008ab0
    1e38:	00000038 	andeq	r0, r0, r8, lsr r0
    1e3c:	00000190 	muleq	r0, r0, r1
    1e40:	0010010c 	andseq	r0, r0, ip, lsl #2
    1e44:	6b080100 	blvs	20224c <_heap+0x182248>
    1e48:	02000000 	andeq	r0, r0, #0
    1e4c:	8b0c7491 	blhi	31f098 <_heap+0x29f094>
    1e50:	0100000a 	tsteq	r0, sl
    1e54:	0001af09 	andeq	sl, r1, r9, lsl #30
    1e58:	70910200 	addsvc	r0, r1, r0, lsl #4
    1e5c:	8b0c0d00 	blhi	305264 <_heap+0x285260>
    1e60:	00180000 	andseq	r0, r8, r0
    1e64:	b40c0000 	strlt	r0, [ip], #-0
    1e68:	01000007 	tsteq	r0, r7
    1e6c:	0001b513 	andeq	fp, r1, r3, lsl r5
    1e70:	6f910200 	svcvs	0x00910200
    1e74:	040e0000 	streq	r0, [lr], #-0
    1e78:	0000006b 	andeq	r0, r0, fp, rrx
    1e7c:	012a040e 			; <UNDEFINED> instruction: 0x012a040e
    1e80:	01020000 	mrseq	r0, (UNDEF: 2)
    1e84:	0000c908 	andeq	ip, r0, r8, lsl #18
    1e88:	01bc0000 			; <UNDEFINED> instruction: 0x01bc0000
    1e8c:	00040000 	andeq	r0, r4, r0
    1e90:	00000862 	andeq	r0, r0, r2, ror #16
    1e94:	00440104 	subeq	r0, r4, r4, lsl #2
    1e98:	100c0000 	andne	r0, ip, r0
    1e9c:	2c000010 	stccs	0, cr0, [r0], {16}
    1ea0:	2c00008b 	stccs	0, cr0, [r0], {139}	; 0x8b
    1ea4:	47000002 	strmi	r0, [r0, -r2]
    1ea8:	0200000a 	andeq	r0, r0, #10
    1eac:	00c20601 	sbceq	r0, r2, r1, lsl #12
    1eb0:	01020000 	mrseq	r0, (UNDEF: 2)
    1eb4:	0000c008 	andeq	ip, r0, r8
    1eb8:	05020200 	streq	r0, [r2, #-512]	; 0xfffffe00
    1ebc:	0000012e 	andeq	r0, r0, lr, lsr #2
    1ec0:	ce070202 	cdpgt	2, 0, cr0, cr7, cr2, {0}
    1ec4:	02000000 	andeq	r0, r0, #0
    1ec8:	01250504 			; <UNDEFINED> instruction: 0x01250504
    1ecc:	04020000 	streq	r0, [r2], #-0
    1ed0:	00010e07 	andeq	r0, r1, r7, lsl #28
    1ed4:	05080200 	streq	r0, [r8, #-512]	; 0xfffffe00
    1ed8:	00000120 	andeq	r0, r0, r0, lsr #2
    1edc:	09070802 	stmdbeq	r7, {r1, fp}
    1ee0:	03000001 	movweq	r0, #1
    1ee4:	6e690504 	cdpvs	5, 6, cr0, cr9, cr4, {0}
    1ee8:	04020074 	streq	r0, [r2], #-116	; 0xffffff8c
    1eec:	00011307 	andeq	r1, r1, r7, lsl #6
    1ef0:	02180400 	andseq	r0, r8, #0, 8
    1ef4:	0000a002 	andeq	sl, r0, r2
    1ef8:	0a230500 	beq	8c3300 <_heap+0x8432fc>
    1efc:	04020000 	streq	r0, [r2], #-0
    1f00:	000000a0 	andeq	r0, r0, r0, lsr #1
    1f04:	0b150500 	bleq	54330c <_heap+0x4c3308>
    1f08:	05020000 	streq	r0, [r2, #-0]
    1f0c:	00000059 	andeq	r0, r0, r9, asr r0
    1f10:	0a77050c 	beq	1dc3348 <_heap+0x1d43344>
    1f14:	06020000 	streq	r0, [r2], -r0
    1f18:	00000059 	andeq	r0, r0, r9, asr r0
    1f1c:	0b800510 	bleq	fe003364 <CPSR_UNAFFECTED_BITS+0xfe003464>
    1f20:	07020000 	streq	r0, [r2, -r0]
    1f24:	00000059 	andeq	r0, r0, r9, asr r0
    1f28:	b7060014 	smladlt	r6, r4, r0, r0
    1f2c:	b0000000 	andlt	r0, r0, r0
    1f30:	07000000 	streq	r0, [r0, -r0]
    1f34:	000000b0 	strheq	r0, [r0], -r0	; <UNPREDICTABLE>
    1f38:	04020009 	streq	r0, [r2], #-9
    1f3c:	0001b207 	andeq	fp, r1, r7, lsl #4
    1f40:	08010200 	stmdaeq	r1, {r9}
    1f44:	000000c9 	andeq	r0, r0, r9, asr #1
    1f48:	0000b708 	andeq	fp, r0, r8, lsl #14
    1f4c:	0acb0900 	beq	ff2c4354 <CPSR_UNAFFECTED_BITS+0xff2c4454>
    1f50:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
    1f54:	00000067 	andeq	r0, r0, r7, rrx
    1f58:	00103a0a 	andseq	r3, r0, sl, lsl #20
    1f5c:	592f0100 	stmdbpl	pc!, {r8}	; <UNPREDICTABLE>
    1f60:	54000000 	strpl	r0, [r0], #-0
    1f64:	0400008c 	streq	r0, [r0], #-140	; 0xffffff74
    1f68:	01000001 	tsteq	r0, r1
    1f6c:	00012a9c 	muleq	r1, ip, sl
    1f70:	00660b00 	rsbeq	r0, r6, r0, lsl #22
    1f74:	012a2f01 			; <UNDEFINED> instruction: 0x012a2f01
    1f78:	91020000 	mrsls	r0, (UNDEF: 2)
    1f7c:	0abe0c6c 	beq	fef85134 <CPSR_UNAFFECTED_BITS+0xfef85234>
    1f80:	2f010000 	svccs	0x00010000
    1f84:	00000130 	andeq	r0, r0, r0, lsr r1
    1f88:	0c689102 	stfeqp	f1, [r8], #-8
    1f8c:	000009ba 			; <UNDEFINED> instruction: 0x000009ba
    1f90:	00592f01 	subseq	r2, r9, r1, lsl #30
    1f94:	91020000 	mrsls	r0, (UNDEF: 2)
    1f98:	00690d64 	rsbeq	r0, r9, r4, ror #26
    1f9c:	00593101 	subseq	r3, r9, r1, lsl #2
    1fa0:	91020000 	mrsls	r0, (UNDEF: 2)
    1fa4:	74700d74 	ldrbtvc	r0, [r0], #-3444	; 0xfffff28c
    1fa8:	32010072 	andcc	r0, r1, #114	; 0x72
    1fac:	00000137 	andeq	r0, r0, r7, lsr r1
    1fb0:	00709102 	rsbseq	r9, r0, r2, lsl #2
    1fb4:	00c3040e 	sbceq	r0, r3, lr, lsl #8
    1fb8:	040e0000 	streq	r0, [lr], #-0
    1fbc:	00000136 	andeq	r0, r0, r6, lsr r1
    1fc0:	be040e0f 	cdplt	14, 0, cr0, cr4, cr15, {0}
    1fc4:	0a000000 	beq	1fcc <CPSR_IRQ_INHIBIT+0x1f4c>
    1fc8:	0000104f 	andeq	r1, r0, pc, asr #32
    1fcc:	00591301 	subseq	r1, r9, r1, lsl #6
    1fd0:	8b700000 	blhi	1c01fd8 <_heap+0x1b81fd4>
    1fd4:	00e40000 	rsceq	r0, r4, r0
    1fd8:	9c010000 	stcls	0, cr0, [r1], {-0}
    1fdc:	00000199 	muleq	r0, r9, r1
    1fe0:	0100660b 	tsteq	r0, fp, lsl #12
    1fe4:	00012a13 	andeq	r2, r1, r3, lsl sl
    1fe8:	6c910200 	lfmvs	f0, 4, [r1], {0}
    1fec:	0010590c 	andseq	r5, r0, ip, lsl #18
    1ff0:	99130100 	ldmdbls	r3, {r8}
    1ff4:	02000001 	andeq	r0, r0, #1
    1ff8:	ba0c6891 	blt	31c244 <_heap+0x29c240>
    1ffc:	01000009 	tsteq	r0, r9
    2000:	00005913 	andeq	r5, r0, r3, lsl r9
    2004:	64910200 	ldrvs	r0, [r1], #512	; 0x200
    2008:	0100690d 	tsteq	r0, sp, lsl #18
    200c:	00005915 	andeq	r5, r0, r5, lsl r9
    2010:	74910200 	ldrvc	r0, [r1], #512	; 0x200
    2014:	7274700d 	rsbsvc	r7, r4, #13
    2018:	9b160100 	blls	582420 <_heap+0x50241c>
    201c:	02000001 	andeq	r0, r0, #1
    2020:	10007091 	mulne	r0, r1, r0
    2024:	b7040e04 	strlt	r0, [r4, -r4, lsl #28]
    2028:	11000000 	mrsne	r0, (UNDEF: 0)
    202c:	00001045 	andeq	r1, r0, r5, asr #32
    2030:	8b2c0a01 	blhi	b0483c <_heap+0xa84838>
    2034:	00440000 	subeq	r0, r4, r0
    2038:	9c010000 	stcls	0, cr0, [r1], {-0}
    203c:	0100660b 	tsteq	r0, fp, lsl #12
    2040:	00012a0a 	andeq	r2, r1, sl, lsl #20
    2044:	74910200 	ldrvc	r0, [r1], #512	; 0x200
    2048:	006c0000 	rsbeq	r0, ip, r0
    204c:	00020000 	andeq	r0, r2, r0
    2050:	00000942 	andeq	r0, r0, r2, asr #18
    2054:	0b1f0104 	bleq	7c246c <_heap+0x742468>
    2058:	80000000 	andhi	r0, r0, r0
    205c:	80a80000 	adchi	r0, r8, r0
    2060:	682f0000 	stmdavs	pc!, {}	; <UNPREDICTABLE>
    2064:	2f656d6f 	svccs	0x00656d6f
    2068:	69646261 	stmdbvs	r4!, {r0, r5, r6, r9, sp, lr}^
    206c:	6972616b 	ldmdbvs	r2!, {r0, r1, r3, r5, r6, r8, sp, lr}^
    2070:	65642f6d 	strbvs	r2, [r4, #-3949]!	; 0xfffff093
    2074:	794d2f76 	stmdbvc	sp, {r1, r2, r4, r5, r6, r8, r9, sl, fp, sp}^
    2078:	7474694c 	ldrbtvc	r6, [r4], #-2380	; 0xfffff6b4
    207c:	534f656c 	movtpl	r6, #62828	; 0xf56c
    2080:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
    2084:	6174732f 	cmnvs	r4, pc, lsr #6
    2088:	732e7472 			; <UNDEFINED> instruction: 0x732e7472
    208c:	6f682f00 	svcvs	0x00682f00
    2090:	612f656d 			; <UNDEFINED> instruction: 0x612f656d
    2094:	6b696462 	blvs	1a5b224 <_heap+0x19db220>
    2098:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
    209c:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
    20a0:	4c794d2f 	ldclmi	13, cr4, [r9], #-188	; 0xffffff44
    20a4:	6c747469 	cfldrdvs	mvd7, [r4], #-420	; 0xfffffe5c
    20a8:	00534f65 	subseq	r4, r3, r5, ror #30
    20ac:	20554e47 	subscs	r4, r5, r7, asr #28
    20b0:	32205341 	eorcc	r5, r0, #67108865	; 0x4000001
    20b4:	0037322e 	eorseq	r3, r7, lr, lsr #4
    20b8:	006a8001 	rsbeq	r8, sl, r1
    20bc:	00020000 	andeq	r0, r2, r0
    20c0:	00000956 	andeq	r0, r0, r6, asr r9
    20c4:	0ba00104 	bleq	fe8024dc <CPSR_UNAFFECTED_BITS+0xfe8025dc>
    20c8:	8d580000 	ldclhi	0, cr0, [r8, #-0]
    20cc:	8d780000 	ldclhi	0, cr0, [r8, #-0]
    20d0:	682f0000 	stmdavs	pc!, {}	; <UNPREDICTABLE>
    20d4:	2f656d6f 	svccs	0x00656d6f
    20d8:	69646261 	stmdbvs	r4!, {r0, r5, r6, r9, sp, lr}^
    20dc:	6972616b 	ldmdbvs	r2!, {r0, r1, r3, r5, r6, r8, sp, lr}^
    20e0:	65642f6d 	strbvs	r2, [r4, #-3949]!	; 0xfffff093
    20e4:	794d2f76 	stmdbvc	sp, {r1, r2, r4, r5, r6, r8, r9, sl, fp, sp}^
    20e8:	7474694c 	ldrbtvc	r6, [r4], #-2380	; 0xfffff6b4
    20ec:	534f656c 	movtpl	r6, #62828	; 0xf56c
    20f0:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
    20f4:	6376732f 	cmnvs	r6, #-1140850688	; 0xbc000000
    20f8:	2f00732e 	svccs	0x0000732e
    20fc:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
    2100:	6462612f 	strbtvs	r6, [r2], #-303	; 0xfffffed1
    2104:	72616b69 	rsbvc	r6, r1, #107520	; 0x1a400
    2108:	642f6d69 	strtvs	r6, [pc], #-3433	; 2110 <CPSR_IRQ_INHIBIT+0x2090>
    210c:	4d2f7665 	stcmi	6, cr7, [pc, #-404]!	; 1f80 <CPSR_IRQ_INHIBIT+0x1f00>
    2110:	74694c79 	strbtvc	r4, [r9], #-3193	; 0xfffff387
    2114:	4f656c74 	svcmi	0x00656c74
    2118:	4e470053 	mcrmi	0, 2, r0, cr7, cr3, {2}
    211c:	53412055 	movtpl	r2, #4181	; 0x1055
    2120:	322e3220 	eorcc	r3, lr, #32, 4
    2124:	80010037 	andhi	r0, r1, r7, lsr r0

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
  74:	0b002408 	bleq	909c <__bss_end__+0x290>
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
  e8:	03193f00 	tsteq	r9, #0, 30
  ec:	3b0b3a0e 	blcc	2ce92c <_heap+0x24e928>
  f0:	1119270b 	tstne	r9, fp, lsl #14
  f4:	40061201 	andmi	r1, r6, r1, lsl #4
  f8:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
  fc:	01000000 	mrseq	r0, (UNDEF: 0)
 100:	0e250111 	mcreq	1, 1, r0, cr5, cr1, {0}
 104:	0e030b13 	vmoveq.32	d3[0], r0
 108:	06120111 			; <UNDEFINED> instruction: 0x06120111
 10c:	00001710 	andeq	r1, r0, r0, lsl r7
 110:	0b002402 	bleq	9120 <__bss_end__+0x314>
 114:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 118:	0300000e 	movweq	r0, #14
 11c:	0b0b0024 	bleq	2c01b4 <_heap+0x2401b0>
 120:	08030b3e 	stmdaeq	r3, {r1, r2, r3, r4, r5, r8, r9, fp}
 124:	2e040000 	cdpcs	0, 0, cr0, cr4, cr0, {0}
 128:	03193f01 	tsteq	r9, #1, 30
 12c:	3b0b3a0e 	blcc	2ce96c <_heap+0x24e968>
 130:	1119270b 	tstne	r9, fp, lsl #14
 134:	40061201 	andmi	r1, r6, r1, lsl #4
 138:	19429618 	stmdbne	r2, {r3, r4, r9, sl, ip, pc}^
 13c:	00001301 	andeq	r1, r0, r1, lsl #6
 140:	03000505 	movweq	r0, #1285	; 0x505
 144:	3b0b3a08 	blcc	2ce96c <_heap+0x24e968>
 148:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 14c:	06000018 			; <UNDEFINED> instruction: 0x06000018
 150:	0e030005 	cdpeq	0, 0, cr0, cr3, cr5, {0}
 154:	0b3b0b3a 	bleq	ec2e44 <_heap+0xe42e40>
 158:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 15c:	34070000 	strcc	r0, [r7], #-0
 160:	3a0e0300 	bcc	380d68 <_heap+0x300d64>
 164:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 168:	00180213 	andseq	r0, r8, r3, lsl r2
 16c:	01010800 	tsteq	r1, r0, lsl #16
 170:	00001349 	andeq	r1, r0, r9, asr #6
 174:	49002109 	stmdbmi	r0, {r0, r3, r8, sp}
 178:	000b2f13 	andeq	r2, fp, r3, lsl pc
 17c:	11010000 	mrsne	r0, (UNDEF: 1)
 180:	130e2501 	movwne	r2, #58625	; 0xe501
 184:	110e030b 	tstne	lr, fp, lsl #6
 188:	10061201 	andne	r1, r6, r1, lsl #4
 18c:	02000017 	andeq	r0, r0, #23
 190:	0b0b0024 	bleq	2c0228 <_heap+0x240224>
 194:	0e030b3e 	vmoveq.16	d3[0], r0
 198:	16030000 	strne	r0, [r3], -r0
 19c:	3a0e0300 	bcc	380da4 <_heap+0x300da0>
 1a0:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 1a4:	04000013 	streq	r0, [r0], #-19	; 0xffffffed
 1a8:	0b0b0024 	bleq	2c0240 <_heap+0x24023c>
 1ac:	08030b3e 	stmdaeq	r3, {r1, r2, r3, r4, r5, r8, r9, fp}
 1b0:	35050000 	strcc	r0, [r5, #-0]
 1b4:	00134900 	andseq	r4, r3, r0, lsl #18
 1b8:	01130600 	tsteq	r3, r0, lsl #12
 1bc:	0b3a0b0b 	bleq	e82df0 <_heap+0xe02dec>
 1c0:	13010b3b 	movwne	r0, #6971	; 0x1b3b
 1c4:	0d070000 	stceq	0, cr0, [r7, #-0]
 1c8:	3a0e0300 	bcc	380dd0 <_heap+0x300dcc>
 1cc:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 1d0:	000b3813 	andeq	r3, fp, r3, lsl r8
 1d4:	00340800 	eorseq	r0, r4, r0, lsl #16
 1d8:	0b3a0e03 	bleq	e839ec <_heap+0xe039e8>
 1dc:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 1e0:	00001802 	andeq	r1, r0, r2, lsl #16
 1e4:	0b000f09 	bleq	3e10 <CPSR_IRQ_INHIBIT+0x3d90>
 1e8:	0013490b 	andseq	r4, r3, fp, lsl #18
 1ec:	002e0a00 	eoreq	r0, lr, r0, lsl #20
 1f0:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
 1f4:	0b3b0b3a 	bleq	ec2ee4 <_heap+0xe42ee0>
 1f8:	01111927 	tsteq	r1, r7, lsr #18
 1fc:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 200:	00194297 	mulseq	r9, r7, r2
 204:	002e0b00 	eoreq	r0, lr, r0, lsl #22
 208:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
 20c:	0b3b0b3a 	bleq	ec2efc <_heap+0xe42ef8>
 210:	13491927 	movtne	r1, #39207	; 0x9927
 214:	06120111 			; <UNDEFINED> instruction: 0x06120111
 218:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 21c:	00000019 	andeq	r0, r0, r9, lsl r0
 220:	25011101 	strcs	r1, [r1, #-257]	; 0xfffffeff
 224:	030b130e 	movweq	r1, #45838	; 0xb30e
 228:	1201110e 	andne	r1, r1, #-2147483645	; 0x80000003
 22c:	00171006 	andseq	r1, r7, r6
 230:	00240200 	eoreq	r0, r4, r0, lsl #4
 234:	0b3e0b0b 	bleq	f82e68 <_heap+0xf02e64>
 238:	00000e03 	andeq	r0, r0, r3, lsl #28
 23c:	03001603 	movweq	r1, #1539	; 0x603
 240:	3b0b3a0e 	blcc	2cea80 <_heap+0x24ea7c>
 244:	0013490b 	andseq	r4, r3, fp, lsl #18
 248:	00240400 	eoreq	r0, r4, r0, lsl #8
 24c:	0b3e0b0b 	bleq	f82e80 <_heap+0xf02e7c>
 250:	00000803 	andeq	r0, r0, r3, lsl #16
 254:	49003505 	stmdbmi	r0, {r0, r2, r8, sl, ip, sp}
 258:	06000013 			; <UNDEFINED> instruction: 0x06000013
 25c:	13490026 	movtne	r0, #36902	; 0x9026
 260:	04070000 	streq	r0, [r7], #-0
 264:	490b0b01 	stmdbmi	fp, {r0, r8, r9, fp}
 268:	3b0b3a13 	blcc	2ceabc <_heap+0x24eab8>
 26c:	0013010b 	andseq	r0, r3, fp, lsl #2
 270:	00280800 	eoreq	r0, r8, r0, lsl #16
 274:	0b1c0e03 	bleq	703a88 <_heap+0x683a84>
 278:	13090000 	movwne	r0, #36864	; 0x9000
 27c:	3a0b0b01 	bcc	2c2e88 <_heap+0x242e84>
 280:	010b3b0b 	tsteq	fp, fp, lsl #22
 284:	0a000013 	beq	2d8 <CPSR_IRQ_INHIBIT+0x258>
 288:	0e03000d 	cdpeq	0, 0, cr0, cr3, cr13, {0}
 28c:	0b3b0b3a 	bleq	ec2f7c <_heap+0xe42f78>
 290:	0b381349 	bleq	e04fbc <_heap+0xd84fb8>
 294:	340b0000 	strcc	r0, [fp], #-0
 298:	3a0e0300 	bcc	380ea0 <_heap+0x300e9c>
 29c:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 2a0:	00180213 	andseq	r0, r8, r3, lsl r2
 2a4:	000f0c00 	andeq	r0, pc, r0, lsl #24
 2a8:	13490b0b 	movtne	r0, #39691	; 0x9b0b
 2ac:	2e0d0000 	cdpcs	0, 0, cr0, cr13, cr0, {0}
 2b0:	03193f00 	tsteq	r9, #0, 30
 2b4:	3b0b3a0e 	blcc	2ceaf4 <_heap+0x24eaf0>
 2b8:	1119270b 	tstne	r9, fp, lsl #14
 2bc:	40061201 	andmi	r1, r6, r1, lsl #4
 2c0:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 2c4:	2e0e0000 	cdpcs	0, 0, cr0, cr14, cr0, {0}
 2c8:	03193f01 	tsteq	r9, #1, 30
 2cc:	3b0b3a0e 	blcc	2ceb0c <_heap+0x24eb08>
 2d0:	1119270b 	tstne	r9, fp, lsl #14
 2d4:	40061201 	andmi	r1, r6, r1, lsl #4
 2d8:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 2dc:	00001301 	andeq	r1, r0, r1, lsl #6
 2e0:	0300050f 	movweq	r0, #1295	; 0x50f
 2e4:	3b0b3a0e 	blcc	2ceb24 <_heap+0x24eb20>
 2e8:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 2ec:	10000018 	andne	r0, r0, r8, lsl r0
 2f0:	193f002e 	ldmdbne	pc!, {r1, r2, r3, r5}	; <UNPREDICTABLE>
 2f4:	0b3a0e03 	bleq	e83b08 <_heap+0xe03b04>
 2f8:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 2fc:	01111349 	tsteq	r1, r9, asr #6
 300:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 304:	00194297 	mulseq	r9, r7, r2
 308:	11010000 	mrsne	r0, (UNDEF: 1)
 30c:	130e2501 	movwne	r2, #58625	; 0xe501
 310:	110e030b 	tstne	lr, fp, lsl #6
 314:	10061201 	andne	r1, r6, r1, lsl #4
 318:	02000017 	andeq	r0, r0, #23
 31c:	0b0b0024 	bleq	2c03b4 <_heap+0x2403b0>
 320:	0e030b3e 	vmoveq.16	d3[0], r0
 324:	16030000 	strne	r0, [r3], -r0
 328:	3a0e0300 	bcc	380f30 <_heap+0x300f2c>
 32c:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 330:	04000013 	streq	r0, [r0], #-19	; 0xffffffed
 334:	0b0b0024 	bleq	2c03cc <_heap+0x2403c8>
 338:	08030b3e 	stmdaeq	r3, {r1, r2, r3, r4, r5, r8, r9, fp}
 33c:	35050000 	strcc	r0, [r5, #-0]
 340:	00134900 	andseq	r4, r3, r0, lsl #18
 344:	01130600 	tsteq	r3, r0, lsl #12
 348:	0b3a0b0b 	bleq	e82f7c <_heap+0xe02f78>
 34c:	13010b3b 	movwne	r0, #6971	; 0x1b3b
 350:	0d070000 	stceq	0, cr0, [r7, #-0]
 354:	3a0e0300 	bcc	380f5c <_heap+0x300f58>
 358:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 35c:	000b3813 	andeq	r3, fp, r3, lsl r8
 360:	00340800 	eorseq	r0, r4, r0, lsl #16
 364:	0b3a0e03 	bleq	e83b78 <_heap+0xe03b74>
 368:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 36c:	00001802 	andeq	r1, r0, r2, lsl #16
 370:	0b000f09 	bleq	3f9c <CPSR_IRQ_INHIBIT+0x3f1c>
 374:	0013490b 	andseq	r4, r3, fp, lsl #18
 378:	002e0a00 	eoreq	r0, lr, r0, lsl #20
 37c:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
 380:	0b3b0b3a 	bleq	ec3070 <_heap+0xe4306c>
 384:	01111927 	tsteq	r1, r7, lsr #18
 388:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 38c:	00194297 	mulseq	r9, r7, r2
 390:	012e0b00 			; <UNDEFINED> instruction: 0x012e0b00
 394:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
 398:	0b3b0b3a 	bleq	ec3088 <_heap+0xe43084>
 39c:	06120111 			; <UNDEFINED> instruction: 0x06120111
 3a0:	42961840 	addsmi	r1, r6, #64, 16	; 0x400000
 3a4:	00130119 	andseq	r0, r3, r9, lsl r1
 3a8:	00340c00 	eorseq	r0, r4, r0, lsl #24
 3ac:	0b3a0803 	bleq	e823c0 <_heap+0xe023bc>
 3b0:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 3b4:	00001802 	andeq	r1, r0, r2, lsl #16
 3b8:	3f012e0d 	svccc	0x00012e0d
 3bc:	3a0e0319 	bcc	381028 <_heap+0x301024>
 3c0:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 3c4:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 3c8:	96184006 	ldrls	r4, [r8], -r6
 3cc:	13011942 	movwne	r1, #6466	; 0x1942
 3d0:	2e0e0000 	cdpcs	0, 0, cr0, cr14, cr0, {0}
 3d4:	03193f00 	tsteq	r9, #0, 30
 3d8:	3b0b3a0e 	blcc	2cec18 <_heap+0x24ec14>
 3dc:	4919270b 	ldmdbmi	r9, {r0, r1, r3, r8, r9, sl, sp}
 3e0:	12011113 	andne	r1, r1, #-1073741820	; 0xc0000004
 3e4:	97184006 	ldrls	r4, [r8, -r6]
 3e8:	00001942 	andeq	r1, r0, r2, asr #18
 3ec:	01110100 	tsteq	r1, r0, lsl #2
 3f0:	0b130e25 	bleq	4c3c8c <_heap+0x443c88>
 3f4:	01110e03 	tsteq	r1, r3, lsl #28
 3f8:	17100612 			; <UNDEFINED> instruction: 0x17100612
 3fc:	24020000 	strcs	r0, [r2], #-0
 400:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 404:	000e030b 	andeq	r0, lr, fp, lsl #6
 408:	00160300 	andseq	r0, r6, r0, lsl #6
 40c:	0b3a0e03 	bleq	e83c20 <_heap+0xe03c1c>
 410:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 414:	24040000 	strcs	r0, [r4], #-0
 418:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 41c:	0008030b 	andeq	r0, r8, fp, lsl #6
 420:	00350500 	eorseq	r0, r5, r0, lsl #10
 424:	00001349 	andeq	r1, r0, r9, asr #6
 428:	0b011306 	bleq	45048 <__bss_end__+0x3c23c>
 42c:	3b0b3a0b 	blcc	2cec60 <_heap+0x24ec5c>
 430:	0013010b 	andseq	r0, r3, fp, lsl #2
 434:	000d0700 	andeq	r0, sp, r0, lsl #14
 438:	0b3a0e03 	bleq	e83c4c <_heap+0xe03c48>
 43c:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 440:	00000b38 	andeq	r0, r0, r8, lsr fp
 444:	03003408 	movweq	r3, #1032	; 0x408
 448:	3b0b3a0e 	blcc	2cec88 <_heap+0x24ec84>
 44c:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 450:	09000018 	stmdbeq	r0, {r3, r4}
 454:	0b0b000f 	bleq	2c0498 <_heap+0x240494>
 458:	00001349 	andeq	r1, r0, r9, asr #6
 45c:	3f012e0a 	svccc	0x00012e0a
 460:	3a0e0319 	bcc	3810cc <_heap+0x3010c8>
 464:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 468:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 46c:	97184006 	ldrls	r4, [r8, -r6]
 470:	13011942 	movwne	r1, #6466	; 0x1942
 474:	050b0000 	streq	r0, [fp, #-0]
 478:	3a080300 	bcc	201080 <_heap+0x18107c>
 47c:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 480:	00180213 	andseq	r0, r8, r3, lsl r2
 484:	00340c00 	eorseq	r0, r4, r0, lsl #24
 488:	0b3a0803 	bleq	e8249c <_heap+0xe02498>
 48c:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 490:	00001802 	andeq	r1, r0, r2, lsl #16
 494:	3f002e0d 	svccc	0x00002e0d
 498:	3a0e0319 	bcc	381104 <_heap+0x301100>
 49c:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 4a0:	11134919 	tstne	r3, r9, lsl r9
 4a4:	40061201 	andmi	r1, r6, r1, lsl #4
 4a8:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 4ac:	01000000 	mrseq	r0, (UNDEF: 0)
 4b0:	0e250111 	mcreq	1, 1, r0, cr5, cr1, {0}
 4b4:	0e030b13 	vmoveq.32	d3[0], r0
 4b8:	06120111 			; <UNDEFINED> instruction: 0x06120111
 4bc:	00001710 	andeq	r1, r0, r0, lsl r7
 4c0:	0b002402 	bleq	94d0 <__bss_end__+0x6c4>
 4c4:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 4c8:	0300000e 	movweq	r0, #14
 4cc:	0e030016 	mcreq	0, 0, r0, cr3, cr6, {0}
 4d0:	0b3b0b3a 	bleq	ec31c0 <_heap+0xe431bc>
 4d4:	00001349 	andeq	r1, r0, r9, asr #6
 4d8:	0b002404 	bleq	94f0 <__bss_end__+0x6e4>
 4dc:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 4e0:	05000008 	streq	r0, [r0, #-8]
 4e4:	13490035 	movtne	r0, #36917	; 0x9035
 4e8:	26060000 	strcs	r0, [r6], -r0
 4ec:	00134900 	andseq	r4, r3, r0, lsl #18
 4f0:	01130700 	tsteq	r3, r0, lsl #14
 4f4:	0b3a0b0b 	bleq	e83128 <_heap+0xe03124>
 4f8:	13010b3b 	movwne	r0, #6971	; 0x1b3b
 4fc:	0d080000 	stceq	0, cr0, [r8, #-0]
 500:	3a0e0300 	bcc	381108 <_heap+0x301104>
 504:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 508:	000b3813 	andeq	r3, fp, r3, lsl r8
 50c:	01040900 	tsteq	r4, r0, lsl #18
 510:	13490b0b 	movtne	r0, #39691	; 0x9b0b
 514:	0b3b0b3a 	bleq	ec3204 <_heap+0xe43200>
 518:	00001301 	andeq	r1, r0, r1, lsl #6
 51c:	0300280a 	movweq	r2, #2058	; 0x80a
 520:	000b1c0e 	andeq	r1, fp, lr, lsl #24
 524:	01010b00 	tsteq	r1, r0, lsl #22
 528:	13011349 	movwne	r1, #4937	; 0x1349
 52c:	210c0000 	mrscs	r0, (UNDEF: 12)
 530:	2f134900 	svccs	0x00134900
 534:	0d00000b 	stceq	0, cr0, [r0, #-44]	; 0xffffffd4
 538:	0e030034 	mcreq	0, 0, r0, cr3, cr4, {1}
 53c:	0b3b0b3a 	bleq	ec322c <_heap+0xe43228>
 540:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 544:	0f0e0000 	svceq	0x000e0000
 548:	490b0b00 	stmdbmi	fp, {r8, r9, fp}
 54c:	0f000013 	svceq	0x00000013
 550:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 554:	0b3a0e03 	bleq	e83d68 <_heap+0xe03d64>
 558:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 55c:	06120111 			; <UNDEFINED> instruction: 0x06120111
 560:	42961840 	addsmi	r1, r6, #64, 16	; 0x400000
 564:	00130119 	andseq	r0, r3, r9, lsl r1
 568:	012e1000 			; <UNDEFINED> instruction: 0x012e1000
 56c:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
 570:	0b3b0b3a 	bleq	ec3260 <_heap+0xe4325c>
 574:	13491927 	movtne	r1, #39207	; 0x9927
 578:	06120111 			; <UNDEFINED> instruction: 0x06120111
 57c:	42961840 	addsmi	r1, r6, #64, 16	; 0x400000
 580:	00130119 	andseq	r0, r3, r9, lsl r1
 584:	00051100 	andeq	r1, r5, r0, lsl #2
 588:	0b3a0e03 	bleq	e83d9c <_heap+0xe03d98>
 58c:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 590:	00001802 	andeq	r1, r0, r2, lsl #16
 594:	03000512 	movweq	r0, #1298	; 0x512
 598:	3b0b3a08 	blcc	2cedc0 <_heap+0x24edbc>
 59c:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 5a0:	13000018 	movwne	r0, #24
 5a4:	08030034 	stmdaeq	r3, {r2, r4, r5}
 5a8:	0b3b0b3a 	bleq	ec3298 <_heap+0xe43294>
 5ac:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 5b0:	2e140000 	cdpcs	0, 1, cr0, cr4, cr0, {0}
 5b4:	03193f01 	tsteq	r9, #1, 30
 5b8:	3b0b3a0e 	blcc	2cedf8 <_heap+0x24edf4>
 5bc:	1119270b 	tstne	r9, fp, lsl #14
 5c0:	40061201 	andmi	r1, r6, r1, lsl #4
 5c4:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 5c8:	00001301 	andeq	r1, r0, r1, lsl #6
 5cc:	3f002e15 	svccc	0x00002e15
 5d0:	3a0e0319 	bcc	38123c <_heap+0x301238>
 5d4:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 5d8:	11134919 	tstne	r3, r9, lsl r9
 5dc:	40061201 	andmi	r1, r6, r1, lsl #4
 5e0:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 5e4:	01000000 	mrseq	r0, (UNDEF: 0)
 5e8:	0e250111 	mcreq	1, 1, r0, cr5, cr1, {0}
 5ec:	0e030b13 	vmoveq.32	d3[0], r0
 5f0:	01110e1b 	tsteq	r1, fp, lsl lr
 5f4:	17100612 			; <UNDEFINED> instruction: 0x17100612
 5f8:	24020000 	strcs	r0, [r2], #-0
 5fc:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 600:	000e030b 	andeq	r0, lr, fp, lsl #6
 604:	00160300 	andseq	r0, r6, r0, lsl #6
 608:	0b3a0e03 	bleq	e83e1c <_heap+0xe03e18>
 60c:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 610:	24040000 	strcs	r0, [r4], #-0
 614:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 618:	0008030b 	andeq	r0, r8, fp, lsl #6
 61c:	000f0500 	andeq	r0, pc, r0, lsl #10
 620:	00000b0b 	andeq	r0, r0, fp, lsl #22
 624:	03001606 	movweq	r1, #1542	; 0x606
 628:	3b0b3a0e 	blcc	2cee68 <_heap+0x24ee64>
 62c:	00134905 	andseq	r4, r3, r5, lsl #18
 630:	01170700 	tsteq	r7, r0, lsl #14
 634:	0b3a0b0b 	bleq	e83268 <_heap+0xe03264>
 638:	13010b3b 	movwne	r0, #6971	; 0x1b3b
 63c:	0d080000 	stceq	0, cr0, [r8, #-0]
 640:	3a0e0300 	bcc	381248 <_heap+0x301244>
 644:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 648:	09000013 	stmdbeq	r0, {r0, r1, r4}
 64c:	13490101 	movtne	r0, #37121	; 0x9101
 650:	00001301 	andeq	r1, r0, r1, lsl #6
 654:	4900210a 	stmdbmi	r0, {r1, r3, r8, sp}
 658:	000b2f13 	andeq	r2, fp, r3, lsl pc
 65c:	01130b00 	tsteq	r3, r0, lsl #22
 660:	0b3a0b0b 	bleq	e83294 <_heap+0xe03290>
 664:	13010b3b 	movwne	r0, #6971	; 0x1b3b
 668:	0d0c0000 	stceq	0, cr0, [ip, #-0]
 66c:	3a0e0300 	bcc	381274 <_heap+0x301270>
 670:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 674:	000b3813 	andeq	r3, fp, r3, lsl r8
 678:	01130d00 	tsteq	r3, r0, lsl #26
 67c:	0b0b0e03 	bleq	2c3e90 <_heap+0x243e8c>
 680:	0b3b0b3a 	bleq	ec3370 <_heap+0xe4336c>
 684:	00001301 	andeq	r1, r0, r1, lsl #6
 688:	03000d0e 	movweq	r0, #3342	; 0xd0e
 68c:	3b0b3a08 	blcc	2ceeb4 <_heap+0x24eeb0>
 690:	3813490b 	ldmdacc	r3, {r0, r1, r3, r8, fp, lr}
 694:	0f00000b 	svceq	0x0000000b
 698:	0b0b000f 	bleq	2c06dc <_heap+0x2406d8>
 69c:	00001349 	andeq	r1, r0, r9, asr #6
 6a0:	03011310 	movweq	r1, #4880	; 0x1310
 6a4:	3a050b0e 	bcc	1432e4 <_heap+0xc32e0>
 6a8:	010b3b0b 	tsteq	fp, fp, lsl #22
 6ac:	11000013 	tstne	r0, r3, lsl r0
 6b0:	0e03000d 	cdpeq	0, 0, cr0, cr3, cr13, {0}
 6b4:	0b3b0b3a 	bleq	ec33a4 <_heap+0xe433a0>
 6b8:	05381349 	ldreq	r1, [r8, #-841]!	; 0xfffffcb7
 6bc:	15120000 	ldrne	r0, [r2, #-0]
 6c0:	00192700 	andseq	r2, r9, r0, lsl #14
 6c4:	01151300 	tsteq	r5, r0, lsl #6
 6c8:	13491927 	movtne	r1, #39207	; 0x9927
 6cc:	00001301 	andeq	r1, r0, r1, lsl #6
 6d0:	49000514 	stmdbmi	r0, {r2, r4, r8, sl}
 6d4:	15000013 	strne	r0, [r0, #-19]	; 0xffffffed
 6d8:	13490026 	movtne	r0, #36902	; 0x9026
 6dc:	13160000 	tstne	r6, #0
 6e0:	0b0e0301 	bleq	3812ec <_heap+0x3012e8>
 6e4:	3b0b3a05 	blcc	2cef00 <_heap+0x24eefc>
 6e8:	00130105 	andseq	r0, r3, r5, lsl #2
 6ec:	000d1700 	andeq	r1, sp, r0, lsl #14
 6f0:	0b3a0e03 	bleq	e83f04 <_heap+0xe03f00>
 6f4:	1349053b 	movtne	r0, #38203	; 0x953b
 6f8:	00000b38 	andeq	r0, r0, r8, lsr fp
 6fc:	03000d18 	movweq	r0, #3352	; 0xd18
 700:	3b0b3a0e 	blcc	2cef40 <_heap+0x24ef3c>
 704:	38134905 	ldmdacc	r3, {r0, r2, r8, fp, lr}
 708:	19000005 	stmdbne	r0, {r0, r2}
 70c:	0e030113 	mcreq	1, 0, r0, cr3, cr3, {0}
 710:	0b3a0b0b 	bleq	e83344 <_heap+0xe03340>
 714:	1301053b 	movwne	r0, #5435	; 0x153b
 718:	131a0000 	tstne	sl, #0
 71c:	3a0b0b01 	bcc	2c3328 <_heap+0x243324>
 720:	01053b0b 	tsteq	r5, fp, lsl #22
 724:	1b000013 	blne	778 <CPSR_IRQ_INHIBIT+0x6f8>
 728:	0b0b0117 	bleq	2c0b8c <_heap+0x240b88>
 72c:	053b0b3a 	ldreq	r0, [fp, #-2874]!	; 0xfffff4c6
 730:	00001301 	andeq	r1, r0, r1, lsl #6
 734:	03000d1c 	movweq	r0, #3356	; 0xd1c
 738:	3b0b3a0e 	blcc	2cef78 <_heap+0x24ef74>
 73c:	00134905 	andseq	r4, r3, r5, lsl #18
 740:	01151d00 	tsteq	r5, r0, lsl #26
 744:	13011927 	movwne	r1, #6439	; 0x1927
 748:	341e0000 	ldrcc	r0, [lr], #-0
 74c:	3a0e0300 	bcc	381354 <_heap+0x301350>
 750:	49053b0b 	stmdbmi	r5, {r0, r1, r3, r8, r9, fp, ip, sp}
 754:	3c193f13 	ldccc	15, cr3, [r9], {19}
 758:	1f000019 	svcne	0x00000019
 75c:	13490035 	movtne	r0, #36917	; 0x9035
 760:	34200000 	strtcc	r0, [r0], #-0
 764:	3a0e0300 	bcc	38136c <_heap+0x301368>
 768:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 76c:	3c193f13 	ldccc	15, cr3, [r9], {19}
 770:	21000019 	tstcs	r0, r9, lsl r0
 774:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 778:	0b3a0e03 	bleq	e83f8c <_heap+0xe03f88>
 77c:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 780:	01111349 	tsteq	r1, r9, asr #6
 784:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 788:	01194296 			; <UNDEFINED> instruction: 0x01194296
 78c:	22000013 	andcs	r0, r0, #19
 790:	0e030034 	mcreq	0, 0, r0, cr3, cr4, {1}
 794:	0b3b0b3a 	bleq	ec3484 <_heap+0xe43480>
 798:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 79c:	34230000 	strtcc	r0, [r3], #-0
 7a0:	3a080300 	bcc	2013a8 <_heap+0x1813a4>
 7a4:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 7a8:	00180213 	andseq	r0, r8, r3, lsl r2
 7ac:	11010000 	mrsne	r0, (UNDEF: 1)
 7b0:	130e2501 	movwne	r2, #58625	; 0xe501
 7b4:	110e030b 	tstne	lr, fp, lsl #6
 7b8:	10061201 	andne	r1, r6, r1, lsl #4
 7bc:	02000017 	andeq	r0, r0, #23
 7c0:	0b0b0024 	bleq	2c0858 <_heap+0x240854>
 7c4:	0e030b3e 	vmoveq.16	d3[0], r0
 7c8:	16030000 	strne	r0, [r3], -r0
 7cc:	3a0e0300 	bcc	3813d4 <_heap+0x3013d0>
 7d0:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 7d4:	04000013 	streq	r0, [r0], #-19	; 0xffffffed
 7d8:	0b0b0024 	bleq	2c0870 <_heap+0x24086c>
 7dc:	08030b3e 	stmdaeq	r3, {r1, r2, r3, r4, r5, r8, r9, fp}
 7e0:	35050000 	strcc	r0, [r5, #-0]
 7e4:	00134900 	andseq	r4, r3, r0, lsl #18
 7e8:	00260600 	eoreq	r0, r6, r0, lsl #12
 7ec:	00001349 	andeq	r1, r0, r9, asr #6
 7f0:	0b011307 	bleq	45414 <__bss_end__+0x3c608>
 7f4:	3b0b3a0b 	blcc	2cf028 <_heap+0x24f024>
 7f8:	0013010b 	andseq	r0, r3, fp, lsl #2
 7fc:	000d0800 	andeq	r0, sp, r0, lsl #16
 800:	0b3a0e03 	bleq	e84014 <_heap+0xe04010>
 804:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 808:	00000b38 	andeq	r0, r0, r8, lsr fp
 80c:	3f012e09 	svccc	0x00012e09
 810:	3a0e0319 	bcc	38147c <_heap+0x301478>
 814:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 818:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 81c:	96184006 	ldrls	r4, [r8], -r6
 820:	13011942 	movwne	r1, #6466	; 0x1942
 824:	050a0000 	streq	r0, [sl, #-0]
 828:	3a0e0300 	bcc	381430 <_heap+0x30142c>
 82c:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 830:	00180213 	andseq	r0, r8, r3, lsl r2
 834:	010b0b00 	tsteq	fp, r0, lsl #22
 838:	06120111 			; <UNDEFINED> instruction: 0x06120111
 83c:	00001301 	andeq	r1, r0, r1, lsl #6
 840:	0300340c 	movweq	r3, #1036	; 0x40c
 844:	3b0b3a0e 	blcc	2cf084 <_heap+0x24f080>
 848:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 84c:	0d000018 	stceq	0, cr0, [r0, #-96]	; 0xffffffa0
 850:	0111010b 	tsteq	r1, fp, lsl #2
 854:	00000612 	andeq	r0, r0, r2, lsl r6
 858:	0b000f0e 	bleq	4498 <CPSR_IRQ_INHIBIT+0x4418>
 85c:	0013490b 	andseq	r4, r3, fp, lsl #18
 860:	11010000 	mrsne	r0, (UNDEF: 1)
 864:	130e2501 	movwne	r2, #58625	; 0xe501
 868:	110e030b 	tstne	lr, fp, lsl #6
 86c:	10061201 	andne	r1, r6, r1, lsl #4
 870:	02000017 	andeq	r0, r0, #23
 874:	0b0b0024 	bleq	2c090c <_heap+0x240908>
 878:	0e030b3e 	vmoveq.16	d3[0], r0
 87c:	24030000 	strcs	r0, [r3], #-0
 880:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 884:	0008030b 	andeq	r0, r8, fp, lsl #6
 888:	01130400 	tsteq	r3, r0, lsl #8
 88c:	0b3a0b0b 	bleq	e834c0 <_heap+0xe034bc>
 890:	13010b3b 	movwne	r0, #6971	; 0x1b3b
 894:	0d050000 	stceq	0, cr0, [r5, #-0]
 898:	3a0e0300 	bcc	3814a0 <_heap+0x30149c>
 89c:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 8a0:	000b3813 	andeq	r3, fp, r3, lsl r8
 8a4:	01010600 	tsteq	r1, r0, lsl #12
 8a8:	13011349 	movwne	r1, #4937	; 0x1349
 8ac:	21070000 	mrscs	r0, (UNDEF: 7)
 8b0:	2f134900 	svccs	0x00134900
 8b4:	0800000b 	stmdaeq	r0, {r0, r1, r3}
 8b8:	13490026 	movtne	r0, #36902	; 0x9026
 8bc:	16090000 	strne	r0, [r9], -r0
 8c0:	3a0e0300 	bcc	3814c8 <_heap+0x3014c4>
 8c4:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 8c8:	0a000013 	beq	91c <CPSR_IRQ_INHIBIT+0x89c>
 8cc:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 8d0:	0b3a0e03 	bleq	e840e4 <_heap+0xe040e0>
 8d4:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 8d8:	01111349 	tsteq	r1, r9, asr #6
 8dc:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 8e0:	01194297 			; <UNDEFINED> instruction: 0x01194297
 8e4:	0b000013 	bleq	938 <CPSR_IRQ_INHIBIT+0x8b8>
 8e8:	08030005 	stmdaeq	r3, {r0, r2}
 8ec:	0b3b0b3a 	bleq	ec35dc <_heap+0xe435d8>
 8f0:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 8f4:	050c0000 	streq	r0, [ip, #-0]
 8f8:	3a0e0300 	bcc	381500 <_heap+0x3014fc>
 8fc:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 900:	00180213 	andseq	r0, r8, r3, lsl r2
 904:	00340d00 	eorseq	r0, r4, r0, lsl #26
 908:	0b3a0803 	bleq	e8291c <_heap+0xe02918>
 90c:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 910:	00001802 	andeq	r1, r0, r2, lsl #16
 914:	0b000f0e 	bleq	4554 <CPSR_IRQ_INHIBIT+0x44d4>
 918:	0013490b 	andseq	r4, r3, fp, lsl #18
 91c:	00260f00 	eoreq	r0, r6, r0, lsl #30
 920:	0f100000 	svceq	0x00100000
 924:	000b0b00 	andeq	r0, fp, r0, lsl #22
 928:	012e1100 			; <UNDEFINED> instruction: 0x012e1100
 92c:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
 930:	0b3b0b3a 	bleq	ec3620 <_heap+0xe4361c>
 934:	01111927 	tsteq	r1, r7, lsr #18
 938:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 93c:	00194297 	mulseq	r9, r7, r2
 940:	11010000 	mrsne	r0, (UNDEF: 1)
 944:	11061000 	mrsne	r1, (UNDEF: 6)
 948:	03011201 	movweq	r1, #4609	; 0x1201
 94c:	25081b08 	strcs	r1, [r8, #-2824]	; 0xfffff4f8
 950:	00051308 	andeq	r1, r5, r8, lsl #6
 954:	11010000 	mrsne	r0, (UNDEF: 1)
 958:	11061000 	mrsne	r1, (UNDEF: 6)
 95c:	03011201 	movweq	r1, #4609	; 0x1201
 960:	25081b08 	strcs	r1, [r8, #-2824]	; 0xfffff4f8
 964:	00051308 	andeq	r1, r5, r8, lsl #6
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
  2c:	4d2f7665 	stcmi	6, cr7, [pc, #-404]!	; fffffea0 <CPSR_UNAFFECTED_BITS+0xffffffa0>
  30:	74694c79 	strbtvc	r4, [r9], #-3193	; 0xfffff387
  34:	4f656c74 	svcmi	0x00656c74
  38:	72732f53 	rsbsvc	r2, r3, #332	; 0x14c
  3c:	63000063 	movwvs	r0, #99	; 0x63
  40:	72617473 	rsbvc	r7, r1, #1929379840	; 0x73000000
  44:	2e707574 	mrccs	5, 3, r7, cr0, cr4, {3}
  48:	00010063 	andeq	r0, r1, r3, rrx
  4c:	05000000 	streq	r0, [r0, #-0]
  50:	0080a802 	addeq	sl, r0, r2, lsl #16
  54:	4bbc1800 	blmi	fef0605c <CPSR_UNAFFECTED_BITS+0xfef0615c>
  58:	2f4a0b03 	svccs	0x004a0b03
  5c:	0200869d 	andeq	r8, r0, #164626432	; 0x9d00000
  60:	02850104 	addeq	r0, r5, #4, 2
  64:	01010006 	tsteq	r1, r6
  68:	000000c2 	andeq	r0, r0, r2, asr #1
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
  94:	4d2f7665 	stcmi	6, cr7, [pc, #-404]!	; ffffff08 <CPSR_UNAFFECTED_BITS+0x8>
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
 108:	14020500 	strne	r0, [r2], #-1280	; 0xfffffb00
 10c:	03000081 	movweq	r0, #129	; 0x81
 110:	0200010c 	andeq	r0, r0, #12, 2
 114:	4f510104 	svcmi	0x00510104
 118:	02004b67 	andeq	r4, r0, #105472	; 0x19c00
 11c:	004e0104 	subeq	r0, lr, r4, lsl #2
 120:	67010402 	strvs	r0, [r1, -r2, lsl #8]
 124:	01040200 	mrseq	r0, R12_usr
 128:	00040249 	andeq	r0, r4, r9, asr #4
 12c:	006b0101 	rsbeq	r0, fp, r1, lsl #2
 130:	00020000 	andeq	r0, r2, r0
 134:	00000042 	andeq	r0, r0, r2, asr #32
 138:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 13c:	0101000d 	tsteq	r1, sp
 140:	00000101 	andeq	r0, r0, r1, lsl #2
 144:	00000100 	andeq	r0, r0, r0, lsl #2
 148:	6f682f01 	svcvs	0x00682f01
 14c:	612f656d 			; <UNDEFINED> instruction: 0x612f656d
 150:	6b696462 	blvs	1a592e0 <_heap+0x19d92dc>
 154:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
 158:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
 15c:	4c794d2f 	ldclmi	13, cr4, [r9], #-188	; 0xffffff44
 160:	6c747469 	cfldrdvs	mvd7, [r4], #-420	; 0xfffffe5c
 164:	2f534f65 	svccs	0x00534f65
 168:	00637273 	rsbeq	r7, r3, r3, ror r2
 16c:	72656b00 	rsbvc	r6, r5, #0, 22
 170:	2e6c656e 	cdpcs	5, 6, cr6, cr12, cr14, {3}
 174:	00010063 	andeq	r0, r1, r3, rrx
 178:	05000000 	streq	r0, [r0, #-0]
 17c:	00815c02 	addeq	r5, r1, r2, lsl #24
 180:	01100300 	tsteq	r0, r0, lsl #6
 184:	8586a1be 	strhi	sl, [r6, #446]	; 0x1be
 188:	34820d03 	strcc	r0, [r2], #3331	; 0xd03
 18c:	1203d730 	andne	sp, r3, #48, 14	; 0xc00000
 190:	04020066 	streq	r0, [r2], #-102	; 0xffffff9a
 194:	2e0a0301 	cdpcs	3, 0, cr0, cr10, cr1, {0}
 198:	01000402 	tsteq	r0, r2, lsl #8
 19c:	0000f601 	andeq	pc, r0, r1, lsl #12
 1a0:	dd000200 	sfmle	f0, 4, [r0, #-0]
 1a4:	02000000 	andeq	r0, r0, #0
 1a8:	0d0efb01 	vstreq	d15, [lr, #-4]
 1ac:	01010100 	mrseq	r0, (UNDEF: 17)
 1b0:	00000001 	andeq	r0, r0, r1
 1b4:	01000001 	tsteq	r0, r1
 1b8:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; 104 <CPSR_IRQ_INHIBIT+0x84>
 1bc:	62612f65 	rsbvs	r2, r1, #404	; 0x194
 1c0:	616b6964 	cmnvs	fp, r4, ror #18
 1c4:	2f6d6972 	svccs	0x006d6972
 1c8:	2f766564 	svccs	0x00766564
 1cc:	694c794d 	stmdbvs	ip, {r0, r2, r3, r6, r8, fp, ip, sp, lr}^
 1d0:	656c7474 	strbvs	r7, [ip, #-1140]!	; 0xfffffb8c
 1d4:	732f534f 			; <UNDEFINED> instruction: 0x732f534f
 1d8:	2f006372 	svccs	0x00006372
 1dc:	2f727375 	svccs	0x00727375
 1e0:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 1e4:	2f656475 	svccs	0x00656475
 1e8:	6c77656e 	cfldr64vs	mvdx6, [r7], #-440	; 0xfffffe48
 1ec:	6d2f6269 	sfmvs	f6, 4, [pc, #-420]!	; 50 <CPSR_FIQ_INHIBIT+0x10>
 1f0:	69686361 	stmdbvs	r8!, {r0, r5, r6, r8, r9, sp, lr}^
 1f4:	2f00656e 	svccs	0x0000656e
 1f8:	2f727375 	svccs	0x00727375
 1fc:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 200:	2f656475 	svccs	0x00656475
 204:	6c77656e 	cfldr64vs	mvdx6, [r7], #-440	; 0xfffffe48
 208:	732f6269 			; <UNDEFINED> instruction: 0x732f6269
 20c:	2f007379 	svccs	0x00007379
 210:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
 214:	6462612f 	strbtvs	r6, [r2], #-303	; 0xfffffed1
 218:	72616b69 	rsbvc	r6, r1, #107520	; 0x1a400
 21c:	642f6d69 	strtvs	r6, [pc], #-3433	; 224 <CPSR_IRQ_INHIBIT+0x1a4>
 220:	4d2f7665 	stcmi	6, cr7, [pc, #-404]!	; 94 <CPSR_IRQ_INHIBIT+0x14>
 224:	74694c79 	strbtvc	r4, [r9], #-3193	; 0xfffff387
 228:	4f656c74 	svcmi	0x00656c74
 22c:	72732f53 	rsbsvc	r2, r3, #332	; 0x14c
 230:	2e2e2f63 	cdpcs	15, 2, cr2, cr14, cr3, {3}
 234:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 238:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0xfffffa94
 23c:	70720000 	rsbsvc	r0, r2, r0
 240:	72612d69 	rsbvc	r2, r1, #6720	; 0x1a40
 244:	6d69746d 	cfstrdvs	mvd7, [r9, #-436]!	; 0xfffffe4c
 248:	632e7265 			; <UNDEFINED> instruction: 0x632e7265
 24c:	00000100 	andeq	r0, r0, r0, lsl #2
 250:	6665645f 			; <UNDEFINED> instruction: 0x6665645f
 254:	746c7561 	strbtvc	r7, [ip], #-1377	; 0xfffffa9f
 258:	7079745f 	rsbsvc	r7, r9, pc, asr r4
 25c:	682e7365 	stmdavs	lr!, {r0, r2, r5, r6, r8, r9, ip, sp, lr}
 260:	00000200 	andeq	r0, r0, r0, lsl #4
 264:	6474735f 	ldrbtvs	r7, [r4], #-863	; 0xfffffca1
 268:	2e746e69 	cdpcs	14, 7, cr6, cr4, cr9, {3}
 26c:	00030068 	andeq	r0, r3, r8, rrx
 270:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
 274:	6d72612d 	ldfvse	f6, [r2, #-180]!	; 0xffffff4c
 278:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0xfffff68c
 27c:	00682e72 	rsbeq	r2, r8, r2, ror lr
 280:	00000004 	andeq	r0, r0, r4
 284:	f4020500 	vst3.8	{d0,d2,d4}, [r2], r0
 288:	03000081 	movweq	r0, #129	; 0x81
 28c:	4b4b0110 	blmi	12c06d4 <_heap+0x12406d0>
 290:	08024ca1 	stmdaeq	r2, {r0, r5, r7, sl, fp, lr}
 294:	08010100 	stmdaeq	r1, {r8}
 298:	02000001 	andeq	r0, r0, #1
 29c:	0000e300 	andeq	lr, r0, r0, lsl #6
 2a0:	fb010200 	blx	40aaa <__bss_end__+0x37c9e>
 2a4:	01000d0e 	tsteq	r0, lr, lsl #26
 2a8:	00010101 	andeq	r0, r1, r1, lsl #2
 2ac:	00010000 	andeq	r0, r1, r0
 2b0:	682f0100 	stmdavs	pc!, {r8}	; <UNPREDICTABLE>
 2b4:	2f656d6f 	svccs	0x00656d6f
 2b8:	69646261 	stmdbvs	r4!, {r0, r5, r6, r9, sp, lr}^
 2bc:	6972616b 	ldmdbvs	r2!, {r0, r1, r3, r5, r6, r8, sp, lr}^
 2c0:	65642f6d 	strbvs	r2, [r4, #-3949]!	; 0xfffff093
 2c4:	794d2f76 	stmdbvc	sp, {r1, r2, r4, r5, r6, r8, r9, sl, fp, sp}^
 2c8:	7474694c 	ldrbtvc	r6, [r4], #-2380	; 0xfffff6b4
 2cc:	534f656c 	movtpl	r6, #62828	; 0xf56c
 2d0:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 2d4:	73752f00 	cmnvc	r5, #0, 30
 2d8:	6e692f72 	mcrvs	15, 3, r2, cr9, cr2, {3}
 2dc:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xfffff39d
 2e0:	656e2f65 	strbvs	r2, [lr, #-3941]!	; 0xfffff09b
 2e4:	62696c77 	rsbvs	r6, r9, #30464	; 0x7700
 2e8:	63616d2f 	cmnvs	r1, #3008	; 0xbc0
 2ec:	656e6968 	strbvs	r6, [lr, #-2408]!	; 0xfffff698
 2f0:	73752f00 	cmnvc	r5, #0, 30
 2f4:	6e692f72 	mcrvs	15, 3, r2, cr9, cr2, {3}
 2f8:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xfffff39d
 2fc:	656e2f65 	strbvs	r2, [lr, #-3941]!	; 0xfffff09b
 300:	62696c77 	rsbvs	r6, r9, #30464	; 0x7700
 304:	7379732f 	cmnvc	r9, #-1140850688	; 0xbc000000
 308:	6f682f00 	svcvs	0x00682f00
 30c:	612f656d 			; <UNDEFINED> instruction: 0x612f656d
 310:	6b696462 	blvs	1a594a0 <_heap+0x19d949c>
 314:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
 318:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
 31c:	4c794d2f 	ldclmi	13, cr4, [r9], #-188	; 0xffffff44
 320:	6c747469 	cfldrdvs	mvd7, [r4], #-420	; 0xfffffe5c
 324:	2f534f65 	svccs	0x00534f65
 328:	2f637273 	svccs	0x00637273
 32c:	692f2e2e 	stmdbvs	pc!, {r1, r2, r3, r5, r9, sl, fp, sp}	; <UNPREDICTABLE>
 330:	756c636e 	strbvc	r6, [ip, #-878]!	; 0xfffffc92
 334:	00006564 	andeq	r6, r0, r4, ror #10
 338:	2d697072 	stclcs	0, cr7, [r9, #-456]!	; 0xfffffe38
 33c:	6f697067 	svcvs	0x00697067
 340:	0100632e 	tsteq	r0, lr, lsr #6
 344:	645f0000 	ldrbvs	r0, [pc], #-0	; 34c <CPSR_IRQ_INHIBIT+0x2cc>
 348:	75616665 	strbvc	r6, [r1, #-1637]!	; 0xfffff99b
 34c:	745f746c 	ldrbvc	r7, [pc], #-1132	; 354 <CPSR_IRQ_INHIBIT+0x2d4>
 350:	73657079 	cmnvc	r5, #121	; 0x79
 354:	0200682e 	andeq	r6, r0, #3014656	; 0x2e0000
 358:	735f0000 	cmpvc	pc, #0
 35c:	6e696474 	mcrvs	4, 3, r6, cr9, cr4, {3}
 360:	00682e74 	rsbeq	r2, r8, r4, ror lr
 364:	72000003 	andvc	r0, r0, #3
 368:	622d6970 	eorvs	r6, sp, #112, 18	; 0x1c0000
 36c:	2e657361 	cdpcs	3, 6, cr7, cr5, cr1, {3}
 370:	00040068 	andeq	r0, r4, r8, rrx
 374:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
 378:	6970672d 	ldmdbvs	r0!, {r0, r2, r3, r5, r8, r9, sl, sp, lr}^
 37c:	00682e6f 	rsbeq	r2, r8, pc, ror #28
 380:	00000004 	andeq	r0, r0, r4
 384:	30020500 	andcc	r0, r2, r0, lsl #10
 388:	03000082 	movweq	r0, #130	; 0x82
 38c:	4b4b0110 	blmi	12c07d4 <_heap+0x12407d0>
 390:	3d08f3a3 	stccc	3, cr15, [r8, #-652]	; 0xfffffd74
 394:	132a0267 			; <UNDEFINED> instruction: 0x132a0267
 398:	67132802 	ldrvs	r2, [r3, -r2, lsl #16]
 39c:	08024cbd 	stmdaeq	r2, {r0, r2, r3, r4, r5, r7, sl, fp, lr}
 3a0:	73010100 	movwvc	r0, #4352	; 0x1100
 3a4:	02000001 	andeq	r0, r0, #1
 3a8:	0000e100 	andeq	lr, r0, r0, lsl #2
 3ac:	fb010200 	blx	40bb6 <__bss_end__+0x37daa>
 3b0:	01000d0e 	tsteq	r0, lr, lsl #26
 3b4:	00010101 	andeq	r0, r1, r1, lsl #2
 3b8:	00010000 	andeq	r0, r1, r0
 3bc:	682f0100 	stmdavs	pc!, {r8}	; <UNPREDICTABLE>
 3c0:	2f656d6f 	svccs	0x00656d6f
 3c4:	69646261 	stmdbvs	r4!, {r0, r5, r6, r9, sp, lr}^
 3c8:	6972616b 	ldmdbvs	r2!, {r0, r1, r3, r5, r6, r8, sp, lr}^
 3cc:	65642f6d 	strbvs	r2, [r4, #-3949]!	; 0xfffff093
 3d0:	794d2f76 	stmdbvc	sp, {r1, r2, r4, r5, r6, r8, r9, sl, fp, sp}^
 3d4:	7474694c 	ldrbtvc	r6, [r4], #-2380	; 0xfffff6b4
 3d8:	534f656c 	movtpl	r6, #62828	; 0xf56c
 3dc:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 3e0:	73752f00 	cmnvc	r5, #0, 30
 3e4:	6e692f72 	mcrvs	15, 3, r2, cr9, cr2, {3}
 3e8:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xfffff39d
 3ec:	656e2f65 	strbvs	r2, [lr, #-3941]!	; 0xfffff09b
 3f0:	62696c77 	rsbvs	r6, r9, #30464	; 0x7700
 3f4:	63616d2f 	cmnvs	r1, #3008	; 0xbc0
 3f8:	656e6968 	strbvs	r6, [lr, #-2408]!	; 0xfffff698
 3fc:	73752f00 	cmnvc	r5, #0, 30
 400:	6e692f72 	mcrvs	15, 3, r2, cr9, cr2, {3}
 404:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xfffff39d
 408:	656e2f65 	strbvs	r2, [lr, #-3941]!	; 0xfffff09b
 40c:	62696c77 	rsbvs	r6, r9, #30464	; 0x7700
 410:	7379732f 	cmnvc	r9, #-1140850688	; 0xbc000000
 414:	6f682f00 	svcvs	0x00682f00
 418:	612f656d 			; <UNDEFINED> instruction: 0x612f656d
 41c:	6b696462 	blvs	1a595ac <_heap+0x19d95a8>
 420:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
 424:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
 428:	4c794d2f 	ldclmi	13, cr4, [r9], #-188	; 0xffffff44
 42c:	6c747469 	cfldrdvs	mvd7, [r4], #-420	; 0xfffffe5c
 430:	2f534f65 	svccs	0x00534f65
 434:	2f637273 	svccs	0x00637273
 438:	692f2e2e 	stmdbvs	pc!, {r1, r2, r3, r5, r9, sl, fp, sp}	; <UNPREDICTABLE>
 43c:	756c636e 	strbvc	r6, [ip, #-878]!	; 0xfffffc92
 440:	00006564 	andeq	r6, r0, r4, ror #10
 444:	2d697072 	stclcs	0, cr7, [r9, #-456]!	; 0xfffffe38
 448:	65746e69 	ldrbvs	r6, [r4, #-3689]!	; 0xfffff197
 44c:	70757272 	rsbsvc	r7, r5, r2, ror r2
 450:	632e7374 			; <UNDEFINED> instruction: 0x632e7374
 454:	00000100 	andeq	r0, r0, r0, lsl #2
 458:	6665645f 			; <UNDEFINED> instruction: 0x6665645f
 45c:	746c7561 	strbtvc	r7, [ip], #-1377	; 0xfffffa9f
 460:	7079745f 	rsbsvc	r7, r9, pc, asr r4
 464:	682e7365 	stmdavs	lr!, {r0, r2, r5, r6, r8, r9, ip, sp, lr}
 468:	00000200 	andeq	r0, r0, r0, lsl #4
 46c:	6474735f 	ldrbtvs	r7, [r4], #-863	; 0xfffffca1
 470:	2e746e69 	cdpcs	14, 7, cr6, cr4, cr9, {3}
 474:	00030068 	andeq	r0, r3, r8, rrx
 478:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
 47c:	746e692d 	strbtvc	r6, [lr], #-2349	; 0xfffff6d3
 480:	75727265 	ldrbvc	r7, [r2, #-613]!	; 0xfffffd9b
 484:	2e737470 	mrccs	4, 3, r7, cr3, cr0, {3}
 488:	00040068 	andeq	r0, r4, r8, rrx
 48c:	05000000 	streq	r0, [r0, #-0]
 490:	00838802 	addeq	r8, r3, r2, lsl #16
 494:	011d0300 	tsteq	sp, r0, lsl #6
 498:	0b034b4b 	bleq	d31cc <_heap+0x531c8>
 49c:	0200839e 	andeq	r8, r0, #2013265922	; 0x78000002
 4a0:	004e0104 	subeq	r0, lr, r4, lsl #2
 4a4:	83010402 	movwhi	r0, #5122	; 0x1402
 4a8:	01040200 	mrseq	r0, R12_usr
 4ac:	2e0c0365 	cdpcs	3, 0, cr0, cr12, cr5, {3}
 4b0:	04020067 	streq	r0, [r2], #-103	; 0xffffff99
 4b4:	02004d01 	andeq	r4, r0, #1, 26	; 0x40
 4b8:	00830104 	addeq	r0, r3, r4, lsl #2
 4bc:	65010402 	strvs	r0, [r1, #-1026]	; 0xfffffbfe
 4c0:	672e0c03 	strvs	r0, [lr, -r3, lsl #24]!
 4c4:	01040200 	mrseq	r0, R12_usr
 4c8:	0402004d 	streq	r0, [r2], #-77	; 0xffffffb3
 4cc:	02008301 	andeq	r8, r0, #67108864	; 0x4000000
 4d0:	03650104 	cmneq	r5, #4, 2
 4d4:	00832e0d 	addeq	r2, r3, sp, lsl #28
 4d8:	4d010402 	cfstrsmi	mvf0, [r1, #-8]
 4dc:	01040200 	mrseq	r0, R12_usr
 4e0:	04020083 	streq	r0, [r2], #-131	; 0xffffff7d
 4e4:	0d036501 	cfstr32eq	mvfx6, [r3, #-4]
 4e8:	0200832e 	andeq	r8, r0, #-1207959552	; 0xb8000000
 4ec:	004d0104 	subeq	r0, sp, r4, lsl #2
 4f0:	83010402 	movwhi	r0, #5122	; 0x1402
 4f4:	01040200 	mrseq	r0, R12_usr
 4f8:	2e0e0365 	cdpcs	3, 0, cr0, cr14, cr5, {3}
 4fc:	bda1a16b 	stfltd	f2, [r1, #428]!	; 0x1ac
 500:	a1a26c84 			; <UNDEFINED> instruction: 0xa1a26c84
 504:	03838485 	orreq	r8, r3, #-2063597568	; 0x85000000
 508:	5603662e 	strpl	r6, [r3], -lr, lsr #12
 50c:	2903832e 	stmdbcs	r3, {r1, r2, r3, r5, r8, r9, pc}
 510:	ba1c0366 	blt	7012b0 <_heap+0x6812ac>
 514:	00060230 	andeq	r0, r6, r0, lsr r2
 518:	00ff0101 	rscseq	r0, pc, r1, lsl #2
 51c:	00020000 	andeq	r0, r2, r0
 520:	000000dd 	ldrdeq	r0, [r0], -sp
 524:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 528:	0101000d 	tsteq	r1, sp
 52c:	00000101 	andeq	r0, r0, r1, lsl #2
 530:	00000100 	andeq	r0, r0, r0, lsl #2
 534:	6f682f01 	svcvs	0x00682f01
 538:	612f656d 			; <UNDEFINED> instruction: 0x612f656d
 53c:	6b696462 	blvs	1a596cc <_heap+0x19d96c8>
 540:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
 544:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
 548:	4c794d2f 	ldclmi	13, cr4, [r9], #-188	; 0xffffff44
 54c:	6c747469 	cfldrdvs	mvd7, [r4], #-420	; 0xfffffe5c
 550:	2f534f65 	svccs	0x00534f65
 554:	00637273 	rsbeq	r7, r3, r3, ror r2
 558:	7273752f 	rsbsvc	r7, r3, #197132288	; 0xbc00000
 55c:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 560:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0xfffffa94
 564:	77656e2f 	strbvc	r6, [r5, -pc, lsr #28]!
 568:	2f62696c 	svccs	0x0062696c
 56c:	6863616d 	stmdavs	r3!, {r0, r2, r3, r5, r6, r8, sp, lr}^
 570:	00656e69 	rsbeq	r6, r5, r9, ror #28
 574:	7273752f 	rsbsvc	r7, r3, #197132288	; 0xbc00000
 578:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 57c:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0xfffffa94
 580:	77656e2f 	strbvc	r6, [r5, -pc, lsr #28]!
 584:	2f62696c 	svccs	0x0062696c
 588:	00737973 	rsbseq	r7, r3, r3, ror r9
 58c:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; 4d8 <CPSR_IRQ_INHIBIT+0x458>
 590:	62612f65 	rsbvs	r2, r1, #404	; 0x194
 594:	616b6964 	cmnvs	fp, r4, ror #18
 598:	2f6d6972 	svccs	0x006d6972
 59c:	2f766564 	svccs	0x00766564
 5a0:	694c794d 	stmdbvs	ip, {r0, r2, r3, r6, r8, fp, ip, sp, lr}^
 5a4:	656c7474 	strbvs	r7, [ip, #-1140]!	; 0xfffffb8c
 5a8:	732f534f 			; <UNDEFINED> instruction: 0x732f534f
 5ac:	2e2f6372 	mcrcs	3, 1, r6, cr15, cr2, {3}
 5b0:	6e692f2e 	cdpvs	15, 6, cr2, cr9, cr14, {1}
 5b4:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xfffff39d
 5b8:	72000065 	andvc	r0, r0, #101	; 0x65
 5bc:	732d6970 			; <UNDEFINED> instruction: 0x732d6970
 5c0:	69747379 	ldmdbvs	r4!, {r0, r3, r4, r5, r6, r8, r9, ip, sp, lr}^
 5c4:	2e72656d 	cdpcs	5, 7, cr6, cr2, cr13, {3}
 5c8:	00010063 	andeq	r0, r1, r3, rrx
 5cc:	65645f00 	strbvs	r5, [r4, #-3840]!	; 0xfffff100
 5d0:	6c756166 	ldfvse	f6, [r5], #-408	; 0xfffffe68
 5d4:	79745f74 	ldmdbvc	r4!, {r2, r4, r5, r6, r8, r9, sl, fp, ip, lr}^
 5d8:	2e736570 	mrccs	5, 3, r6, cr3, cr0, {3}
 5dc:	00020068 	andeq	r0, r2, r8, rrx
 5e0:	74735f00 	ldrbtvc	r5, [r3], #-3840	; 0xfffff100
 5e4:	746e6964 	strbtvc	r6, [lr], #-2404	; 0xfffff69c
 5e8:	0300682e 	movweq	r6, #2094	; 0x82e
 5ec:	70720000 	rsbsvc	r0, r2, r0
 5f0:	79732d69 	ldmdbvc	r3!, {r0, r3, r5, r6, r8, sl, fp, sp}^
 5f4:	6d697473 	cfstrdvs	mvd7, [r9, #-460]!	; 0xfffffe34
 5f8:	682e7265 	stmdavs	lr!, {r0, r2, r5, r6, r9, ip, sp, lr}
 5fc:	00000400 	andeq	r0, r0, r0, lsl #8
 600:	02050000 	andeq	r0, r5, #0
 604:	000085d0 	ldrdeq	r8, [r0], -r0
 608:	4b011003 	blmi	4461c <__bss_end__+0x3b810>
 60c:	8483a14b 	strhi	sl, [r3], #331	; 0x14b
 610:	01040200 	mrseq	r0, R12_usr
 614:	f6062e06 			; <UNDEFINED> instruction: 0xf6062e06
 618:	01000a02 	tsteq	r0, r2, lsl #20
 61c:	00017401 	andeq	r7, r1, r1, lsl #8
 620:	fb000200 	blx	e2a <CPSR_IRQ_INHIBIT+0xdaa>
 624:	02000000 	andeq	r0, r0, #0
 628:	0d0efb01 	vstreq	d15, [lr, #-4]
 62c:	01010100 	mrseq	r0, (UNDEF: 17)
 630:	00000001 	andeq	r0, r0, r1
 634:	01000001 	tsteq	r0, r1
 638:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; 584 <CPSR_IRQ_INHIBIT+0x504>
 63c:	62612f65 	rsbvs	r2, r1, #404	; 0x194
 640:	616b6964 	cmnvs	fp, r4, ror #18
 644:	2f6d6972 	svccs	0x006d6972
 648:	2f766564 	svccs	0x00766564
 64c:	694c794d 	stmdbvs	ip, {r0, r2, r3, r6, r8, fp, ip, sp, lr}^
 650:	656c7474 	strbvs	r7, [ip, #-1140]!	; 0xfffffb8c
 654:	732f534f 			; <UNDEFINED> instruction: 0x732f534f
 658:	2f006372 	svccs	0x00006372
 65c:	2f727375 	svccs	0x00727375
 660:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 664:	2f656475 	svccs	0x00656475
 668:	6c77656e 	cfldr64vs	mvdx6, [r7], #-440	; 0xfffffe48
 66c:	6d2f6269 	sfmvs	f6, 4, [pc, #-420]!	; 4d0 <CPSR_IRQ_INHIBIT+0x450>
 670:	69686361 	stmdbvs	r8!, {r0, r5, r6, r8, r9, sp, lr}^
 674:	2f00656e 	svccs	0x0000656e
 678:	2f727375 	svccs	0x00727375
 67c:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 680:	2f656475 	svccs	0x00656475
 684:	6c77656e 	cfldr64vs	mvdx6, [r7], #-440	; 0xfffffe48
 688:	732f6269 			; <UNDEFINED> instruction: 0x732f6269
 68c:	2f007379 	svccs	0x00007379
 690:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
 694:	6462612f 	strbtvs	r6, [r2], #-303	; 0xfffffed1
 698:	72616b69 	rsbvc	r6, r1, #107520	; 0x1a400
 69c:	642f6d69 	strtvs	r6, [pc], #-3433	; 6a4 <CPSR_IRQ_INHIBIT+0x624>
 6a0:	4d2f7665 	stcmi	6, cr7, [pc, #-404]!	; 514 <CPSR_IRQ_INHIBIT+0x494>
 6a4:	74694c79 	strbtvc	r4, [r9], #-3193	; 0xfffff387
 6a8:	4f656c74 	svcmi	0x00656c74
 6ac:	72732f53 	rsbsvc	r2, r3, #332	; 0x14c
 6b0:	2e2e2f63 	cdpcs	15, 2, cr2, cr14, cr3, {3}
 6b4:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 6b8:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0xfffffa94
 6bc:	70720000 	rsbsvc	r0, r2, r0
 6c0:	61752d69 	cmnvs	r5, r9, ror #26
 6c4:	632e7472 			; <UNDEFINED> instruction: 0x632e7472
 6c8:	00000100 	andeq	r0, r0, r0, lsl #2
 6cc:	6665645f 			; <UNDEFINED> instruction: 0x6665645f
 6d0:	746c7561 	strbtvc	r7, [ip], #-1377	; 0xfffffa9f
 6d4:	7079745f 	rsbsvc	r7, r9, pc, asr r4
 6d8:	682e7365 	stmdavs	lr!, {r0, r2, r5, r6, r8, r9, ip, sp, lr}
 6dc:	00000200 	andeq	r0, r0, r0, lsl #4
 6e0:	6474735f 	ldrbtvs	r7, [r4], #-863	; 0xfffffca1
 6e4:	2e746e69 	cdpcs	14, 7, cr6, cr4, cr9, {3}
 6e8:	00030068 	andeq	r0, r3, r8, rrx
 6ec:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
 6f0:	7361622d 	cmnvc	r1, #-805306366	; 0xd0000002
 6f4:	00682e65 	rsbeq	r2, r8, r5, ror #28
 6f8:	72000004 	andvc	r0, r0, #4
 6fc:	752d6970 	strvc	r6, [sp, #-2416]!	; 0xfffff690
 700:	2e747261 	cdpcs	2, 7, cr7, cr4, cr1, {3}
 704:	00040068 	andeq	r0, r4, r8, rrx
 708:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
 70c:	6970672d 	ldmdbvs	r0!, {r0, r2, r3, r5, r8, r9, sl, sp, lr}^
 710:	00682e6f 	rsbeq	r2, r8, pc, ror #28
 714:	66000004 	strvs	r0, [r0], -r4
 718:	2e6f6669 	cdpcs	6, 6, cr6, cr15, cr9, {3}
 71c:	00040068 	andeq	r0, r4, r8, rrx
 720:	05000000 	streq	r0, [r0, #-0]
 724:	00864c02 	addeq	r4, r6, r2, lsl #24
 728:	011a0300 	tsteq	sl, r0, lsl #6
 72c:	4ba14b4b 	blmi	fe853460 <CPSR_UNAFFECTED_BITS+0xfe853560>
 730:	4c69a14b 	stfmip	f2, [r9], #-300	; 0xfffffed4
 734:	838383d8 	orrhi	r8, r3, #216, 6	; 0x60000003
 738:	67868483 	strvs	r8, [r6, r3, lsl #9]
 73c:	02006768 	andeq	r6, r0, #104, 14	; 0x1a00000
 740:	66060304 	strvs	r0, [r6], -r4, lsl #6
 744:	01040200 	mrseq	r0, R12_usr
 748:	67670666 	strbvs	r0, [r7, -r6, ror #12]!
 74c:	03040200 	movweq	r0, #16896	; 0x4200
 750:	02006606 	andeq	r6, r0, #6291456	; 0x600000
 754:	06660104 	strbteq	r0, [r6], -r4, lsl #2
 758:	66090367 	strvs	r0, [r9], -r7, ror #6
 75c:	00a0bd83 	adceq	fp, r0, r3, lsl #27
 760:	06010402 	streq	r0, [r1], -r2, lsl #8
 764:	83bd062e 			; <UNDEFINED> instruction: 0x83bd062e
 768:	0200a1a1 	andeq	sl, r0, #1073741864	; 0x40000028
 76c:	00670304 	rsbeq	r0, r7, r4, lsl #6
 770:	b9030402 	stmdblt	r3, {r1, sl}
 774:	01040200 	mrseq	r0, R12_usr
 778:	85066606 	strhi	r6, [r6, #-1542]	; 0xfffff9fa
 77c:	3083692f 	addcc	r6, r3, pc, lsr #18
 780:	9f6a86b8 	svcls	0x006a86b8
 784:	bc6b859f 	cfstr64lt	mvdx8, [fp], #-636	; 0xfffffd84
 788:	68d98385 	ldmvs	r9, {r0, r2, r7, r8, r9, pc}^
 78c:	d9bcbfa2 	ldmible	ip!, {r1, r5, r7, r8, r9, sl, fp, ip, sp, pc}
 790:	01000a02 	tsteq	r0, r2, lsl #20
 794:	00019a01 	andeq	r9, r1, r1, lsl #20
 798:	56000200 	strpl	r0, [r0], -r0, lsl #4
 79c:	02000001 	andeq	r0, r0, #1
 7a0:	0d0efb01 	vstreq	d15, [lr, #-4]
 7a4:	01010100 	mrseq	r0, (UNDEF: 17)
 7a8:	00000001 	andeq	r0, r0, r1
 7ac:	01000001 	tsteq	r0, r1
 7b0:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; 6fc <CPSR_IRQ_INHIBIT+0x67c>
 7b4:	62612f65 	rsbvs	r2, r1, #404	; 0x194
 7b8:	616b6964 	cmnvs	fp, r4, ror #18
 7bc:	2f6d6972 	svccs	0x006d6972
 7c0:	2f766564 	svccs	0x00766564
 7c4:	694c794d 	stmdbvs	ip, {r0, r2, r3, r6, r8, fp, ip, sp, lr}^
 7c8:	656c7474 	strbvs	r7, [ip, #-1140]!	; 0xfffffb8c
 7cc:	732f534f 			; <UNDEFINED> instruction: 0x732f534f
 7d0:	2f006372 	svccs	0x00006372
 7d4:	2f727375 	svccs	0x00727375
 7d8:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 7dc:	2f656475 	svccs	0x00656475
 7e0:	6c77656e 	cfldr64vs	mvdx6, [r7], #-440	; 0xfffffe48
 7e4:	6d2f6269 	sfmvs	f6, 4, [pc, #-420]!	; 648 <CPSR_IRQ_INHIBIT+0x5c8>
 7e8:	69686361 	stmdbvs	r8!, {r0, r5, r6, r8, r9, sp, lr}^
 7ec:	2f00656e 	svccs	0x0000656e
 7f0:	2f727375 	svccs	0x00727375
 7f4:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 7f8:	2f656475 	svccs	0x00656475
 7fc:	6c77656e 	cfldr64vs	mvdx6, [r7], #-440	; 0xfffffe48
 800:	732f6269 			; <UNDEFINED> instruction: 0x732f6269
 804:	2f007379 	svccs	0x00007379
 808:	2f727375 	svccs	0x00727375
 80c:	2f62696c 	svccs	0x0062696c
 810:	2f636367 	svccs	0x00636367
 814:	2d6d7261 	sfmcs	f7, 2, [sp, #-388]!	; 0xfffffe7c
 818:	656e6f6e 	strbvs	r6, [lr, #-3950]!	; 0xfffff092
 81c:	6261652d 	rsbvs	r6, r1, #188743680	; 0xb400000
 820:	2e362f69 	cdpcs	15, 3, cr2, cr6, cr9, {3}
 824:	2f312e33 	svccs	0x00312e33
 828:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 82c:	00656475 	rsbeq	r6, r5, r5, ror r4
 830:	7273752f 	rsbsvc	r7, r3, #197132288	; 0xbc00000
 834:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 838:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0xfffffa94
 83c:	77656e2f 	strbvc	r6, [r5, -pc, lsr #28]!
 840:	0062696c 	rsbeq	r6, r2, ip, ror #18
 844:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; 790 <CPSR_IRQ_INHIBIT+0x710>
 848:	62612f65 	rsbvs	r2, r1, #404	; 0x194
 84c:	616b6964 	cmnvs	fp, r4, ror #18
 850:	2f6d6972 	svccs	0x006d6972
 854:	2f766564 	svccs	0x00766564
 858:	694c794d 	stmdbvs	ip, {r0, r2, r3, r6, r8, fp, ip, sp, lr}^
 85c:	656c7474 	strbvs	r7, [ip, #-1140]!	; 0xfffffb8c
 860:	732f534f 			; <UNDEFINED> instruction: 0x732f534f
 864:	2e2f6372 	mcrcs	3, 1, r6, cr15, cr2, {3}
 868:	6e692f2e 	cdpvs	15, 6, cr2, cr9, cr14, {1}
 86c:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xfffff39d
 870:	73000065 	movwvc	r0, #101	; 0x65
 874:	6c6c6568 	cfstr64vs	mvdx6, [ip], #-416	; 0xfffffe60
 878:	0100632e 	tsteq	r0, lr, lsr #6
 87c:	645f0000 	ldrbvs	r0, [pc], #-0	; 884 <CPSR_IRQ_INHIBIT+0x804>
 880:	75616665 	strbvc	r6, [r1, #-1637]!	; 0xfffff99b
 884:	745f746c 	ldrbvc	r7, [pc], #-1132	; 88c <CPSR_IRQ_INHIBIT+0x80c>
 888:	73657079 	cmnvc	r5, #121	; 0x79
 88c:	0200682e 	andeq	r6, r0, #3014656	; 0x2e0000
 890:	6f6c0000 	svcvs	0x006c0000
 894:	682e6b63 	stmdavs	lr!, {r0, r1, r5, r6, r8, r9, fp, sp, lr}
 898:	00000300 	andeq	r0, r0, r0, lsl #6
 89c:	7079745f 	rsbsvc	r7, r9, pc, asr r4
 8a0:	682e7365 	stmdavs	lr!, {r0, r2, r5, r6, r8, r9, ip, sp, lr}
 8a4:	00000300 	andeq	r0, r0, r0, lsl #6
 8a8:	64647473 	strbtvs	r7, [r4], #-1139	; 0xfffffb8d
 8ac:	682e6665 	stmdavs	lr!, {r0, r2, r5, r6, r9, sl, sp, lr}
 8b0:	00000400 	andeq	r0, r0, r0, lsl #8
 8b4:	6e656572 	mcrvs	5, 3, r6, cr5, cr2, {3}
 8b8:	00682e74 	rsbeq	r2, r8, r4, ror lr
 8bc:	5f000003 	svcpl	0x00000003
 8c0:	69647473 	stmdbvs	r4!, {r0, r1, r4, r5, r6, sl, ip, sp, lr}^
 8c4:	682e746e 	stmdavs	lr!, {r1, r2, r3, r5, r6, sl, ip, sp, lr}
 8c8:	00000300 	andeq	r0, r0, r0, lsl #6
 8cc:	6c647473 	cfstrdvs	mvd7, [r4], #-460	; 0xfffffe34
 8d0:	682e6269 	stmdavs	lr!, {r0, r3, r5, r6, r9, sp, lr}
 8d4:	00000500 	andeq	r0, r0, r0, lsl #10
 8d8:	2d697072 	stclcs	0, cr7, [r9, #-456]!	; 0xfffffe38
 8dc:	65736162 	ldrbvs	r6, [r3, #-354]!	; 0xfffffe9e
 8e0:	0600682e 	streq	r6, [r0], -lr, lsr #16
 8e4:	70720000 	rsbsvc	r0, r2, r0
 8e8:	61752d69 	cmnvs	r5, r9, ror #26
 8ec:	682e7472 	stmdavs	lr!, {r1, r4, r5, r6, sl, ip, sp, lr}
 8f0:	00000600 	andeq	r0, r0, r0, lsl #12
 8f4:	02050000 	andeq	r0, r5, #0
 8f8:	000089e8 	andeq	r8, r0, r8, ror #19
 8fc:	6b010903 	blvs	42d10 <__bss_end__+0x39f04>
 900:	684d4f4f 	stmdavs	sp, {r0, r1, r2, r3, r6, r8, r9, sl, fp, lr}^
 904:	01040200 	mrseq	r0, R12_usr
 908:	02002e06 	andeq	r2, r0, #6, 28	; 0x60
 90c:	a0060204 	andge	r0, r6, r4, lsl #4
 910:	02040200 	andeq	r0, r4, #0, 4
 914:	040200a1 	streq	r0, [r2], #-161	; 0xffffff5f
 918:	0200a002 	andeq	sl, r0, #2
 91c:	77030204 	strvc	r0, [r3, -r4, lsl #4]
 920:	04020066 	streq	r0, [r2], #-102	; 0xffffff9a
 924:	06660601 	strbteq	r0, [r6], -r1, lsl #12
 928:	03660c03 	cmneq	r6, #768	; 0x300
 92c:	06024a71 			; <UNDEFINED> instruction: 0x06024a71
 930:	10010100 	andne	r0, r1, r0, lsl #2
 934:	02000001 	andeq	r0, r0, #1
 938:	0000de00 	andeq	sp, r0, r0, lsl #28
 93c:	fb010200 	blx	41146 <__bss_end__+0x3833a>
 940:	01000d0e 	tsteq	r0, lr, lsl #26
 944:	00010101 	andeq	r0, r1, r1, lsl #2
 948:	00010000 	andeq	r0, r1, r0
 94c:	682f0100 	stmdavs	pc!, {r8}	; <UNPREDICTABLE>
 950:	2f656d6f 	svccs	0x00656d6f
 954:	69646261 	stmdbvs	r4!, {r0, r5, r6, r9, sp, lr}^
 958:	6972616b 	ldmdbvs	r2!, {r0, r1, r3, r5, r6, r8, sp, lr}^
 95c:	65642f6d 	strbvs	r2, [r4, #-3949]!	; 0xfffff093
 960:	794d2f76 	stmdbvc	sp, {r1, r2, r4, r5, r6, r8, r9, sl, fp, sp}^
 964:	7474694c 	ldrbtvc	r6, [r4], #-2380	; 0xfffff6b4
 968:	534f656c 	movtpl	r6, #62828	; 0xf56c
 96c:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 970:	73752f00 	cmnvc	r5, #0, 30
 974:	6e692f72 	mcrvs	15, 3, r2, cr9, cr2, {3}
 978:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xfffff39d
 97c:	656e2f65 	strbvs	r2, [lr, #-3941]!	; 0xfffff09b
 980:	62696c77 	rsbvs	r6, r9, #30464	; 0x7700
 984:	63616d2f 	cmnvs	r1, #3008	; 0xbc0
 988:	656e6968 	strbvs	r6, [lr, #-2408]!	; 0xfffff698
 98c:	73752f00 	cmnvc	r5, #0, 30
 990:	6e692f72 	mcrvs	15, 3, r2, cr9, cr2, {3}
 994:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xfffff39d
 998:	656e2f65 	strbvs	r2, [lr, #-3941]!	; 0xfffff09b
 99c:	62696c77 	rsbvs	r6, r9, #30464	; 0x7700
 9a0:	7379732f 	cmnvc	r9, #-1140850688	; 0xbc000000
 9a4:	6f682f00 	svcvs	0x00682f00
 9a8:	612f656d 			; <UNDEFINED> instruction: 0x612f656d
 9ac:	6b696462 	blvs	1a59b3c <_heap+0x19d9b38>
 9b0:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
 9b4:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
 9b8:	4c794d2f 	ldclmi	13, cr4, [r9], #-188	; 0xffffff44
 9bc:	6c747469 	cfldrdvs	mvd7, [r4], #-420	; 0xfffffe5c
 9c0:	2f534f65 	svccs	0x00534f65
 9c4:	2f637273 	svccs	0x00637273
 9c8:	692f2e2e 	stmdbvs	pc!, {r1, r2, r3, r5, r9, sl, fp, sp}	; <UNPREDICTABLE>
 9cc:	756c636e 	strbvc	r6, [ip, #-878]!	; 0xfffffc92
 9d0:	00006564 	andeq	r6, r0, r4, ror #10
 9d4:	2e637673 	mcrcs	6, 3, r7, cr3, cr3, {3}
 9d8:	00010063 	andeq	r0, r1, r3, rrx
 9dc:	65645f00 	strbvs	r5, [r4, #-3840]!	; 0xfffff100
 9e0:	6c756166 	ldfvse	f6, [r5], #-408	; 0xfffffe68
 9e4:	79745f74 	ldmdbvc	r4!, {r2, r4, r5, r6, r8, r9, sl, fp, ip, lr}^
 9e8:	2e736570 	mrccs	5, 3, r6, cr3, cr0, {3}
 9ec:	00020068 	andeq	r0, r2, r8, rrx
 9f0:	74735f00 	ldrbtvc	r5, [r3], #-3840	; 0xfffff100
 9f4:	746e6964 	strbtvc	r6, [lr], #-2404	; 0xfffff69c
 9f8:	0300682e 	movweq	r6, #2094	; 0x82e
 9fc:	70720000 	rsbsvc	r0, r2, r0
 a00:	61622d69 	cmnvs	r2, r9, ror #26
 a04:	682e6573 	stmdavs	lr!, {r0, r1, r4, r5, r6, r8, sl, sp, lr}
 a08:	00000400 	andeq	r0, r0, r0, lsl #8
 a0c:	2d697072 	stclcs	0, cr7, [r9, #-456]!	; 0xfffffe38
 a10:	74726175 	ldrbtvc	r6, [r2], #-373	; 0xfffffe8b
 a14:	0400682e 	streq	r6, [r0], #-2094	; 0xfffff7d2
 a18:	00000000 	andeq	r0, r0, r0
 a1c:	8a900205 	bhi	fe401238 <CPSR_UNAFFECTED_BITS+0xfe401338>
 a20:	9f170000 	svcls	0x00170000
 a24:	004d6767 	subeq	r6, sp, r7, ror #14
 a28:	06010402 	streq	r0, [r1], -r2, lsl #8
 a2c:	03a1062e 			; <UNDEFINED> instruction: 0x03a1062e
 a30:	7503660c 	strvc	r6, [r3, #-1548]	; 0xfffff9f4
 a34:	0a03672e 	beq	da6f4 <_heap+0x5a6f0>
 a38:	2e780382 	cdpcs	3, 7, cr0, cr8, cr2, {4}
 a3c:	01040200 	mrseq	r0, R12_usr
 a40:	0402874d 	streq	r8, [r2], #-1869	; 0xfffff8b3
 a44:	d4010100 	strle	r0, [r1], #-256	; 0xffffff00
 a48:	02000000 	andeq	r0, r0, #0
 a4c:	00007800 	andeq	r7, r0, r0, lsl #16
 a50:	fb010200 	blx	4125a <__bss_end__+0x3844e>
 a54:	01000d0e 	tsteq	r0, lr, lsl #26
 a58:	00010101 	andeq	r0, r1, r1, lsl #2
 a5c:	00010000 	andeq	r0, r1, r0
 a60:	682f0100 	stmdavs	pc!, {r8}	; <UNPREDICTABLE>
 a64:	2f656d6f 	svccs	0x00656d6f
 a68:	69646261 	stmdbvs	r4!, {r0, r5, r6, r9, sp, lr}^
 a6c:	6972616b 	ldmdbvs	r2!, {r0, r1, r3, r5, r6, r8, sp, lr}^
 a70:	65642f6d 	strbvs	r2, [r4, #-3949]!	; 0xfffff093
 a74:	794d2f76 	stmdbvc	sp, {r1, r2, r4, r5, r6, r8, r9, sl, fp, sp}^
 a78:	7474694c 	ldrbtvc	r6, [r4], #-2380	; 0xfffff6b4
 a7c:	534f656c 	movtpl	r6, #62828	; 0xf56c
 a80:	62696c2f 	rsbvs	r6, r9, #12032	; 0x2f00
 a84:	6f682f00 	svcvs	0x00682f00
 a88:	612f656d 			; <UNDEFINED> instruction: 0x612f656d
 a8c:	6b696462 	blvs	1a59c1c <_heap+0x19d9c18>
 a90:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
 a94:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
 a98:	4c794d2f 	ldclmi	13, cr4, [r9], #-188	; 0xffffff44
 a9c:	6c747469 	cfldrdvs	mvd7, [r4], #-420	; 0xfffffe5c
 aa0:	2f534f65 	svccs	0x00534f65
 aa4:	2f62696c 	svccs	0x0062696c
 aa8:	692f2e2e 	stmdbvs	pc!, {r1, r2, r3, r5, r9, sl, fp, sp}	; <UNPREDICTABLE>
 aac:	756c636e 	strbvc	r6, [ip, #-878]!	; 0xfffffc92
 ab0:	00006564 	andeq	r6, r0, r4, ror #10
 ab4:	6f666966 	svcvs	0x00666966
 ab8:	0100632e 	tsteq	r0, lr, lsr #6
 abc:	69660000 	stmdbvs	r6!, {}^	; <UNPREDICTABLE>
 ac0:	682e6f66 	stmdavs	lr!, {r1, r2, r5, r6, r8, r9, sl, fp, sp, lr}
 ac4:	00000200 	andeq	r0, r0, r0, lsl #4
 ac8:	02050000 	andeq	r0, r5, #0
 acc:	00008b2c 	andeq	r8, r0, ip, lsr #22
 ad0:	83010a03 	movwhi	r0, #6659	; 0x1a03
 ad4:	87676767 	strbhi	r6, [r7, -r7, ror #14]!
 ad8:	bc694cbd 	stcllt	12, cr4, [r9], #-756	; 0xfffffd0c
 adc:	68bc9ff3 	ldmvs	ip!, {r0, r1, r4, r5, r6, r7, r8, r9, sl, fp, ip, pc}
 ae0:	04020084 	streq	r0, [r2], #-132	; 0xffffff7c
 ae4:	4a730302 	bmi	1cc16f4 <_heap+0x1c416f0>
 ae8:	01040200 	mrseq	r0, R12_usr
 aec:	03066606 	movweq	r6, #26118	; 0x6606
 af0:	872f8211 			; <UNDEFINED> instruction: 0x872f8211
 af4:	00694cbd 	strhteq	r4, [r9], #-205	; 0xffffff33
 af8:	06010402 	streq	r0, [r1], -r2, lsl #8
 afc:	040200d6 	streq	r0, [r2], #-214	; 0xffffff2a
 b00:	8406d602 	strhi	sp, [r6], #-1538	; 0xfffff9fe
 b04:	bc9ff34c 	ldclt	3, cr15, [pc], {76}	; 0x4c
 b08:	02040200 	andeq	r0, r4, #0, 4
 b0c:	00667503 	rsbeq	r7, r6, r3, lsl #10
 b10:	06010402 	streq	r0, [r1], -r2, lsl #8
 b14:	10030666 	andne	r0, r3, r6, ror #12
 b18:	08022f82 	stmdaeq	r2, {r1, r7, r8, r9, sl, fp, sp}
 b1c:	7d010100 	stfvcs	f0, [r1, #-0]
 b20:	02000000 	andeq	r0, r0, #0
 b24:	00004100 	andeq	r4, r0, r0, lsl #2
 b28:	fb010200 	blx	41332 <__bss_end__+0x38526>
 b2c:	01000d0e 	tsteq	r0, lr, lsl #26
 b30:	00010101 	andeq	r0, r1, r1, lsl #2
 b34:	00010000 	andeq	r0, r1, r0
 b38:	682f0100 	stmdavs	pc!, {r8}	; <UNPREDICTABLE>
 b3c:	2f656d6f 	svccs	0x00656d6f
 b40:	69646261 	stmdbvs	r4!, {r0, r5, r6, r9, sp, lr}^
 b44:	6972616b 	ldmdbvs	r2!, {r0, r1, r3, r5, r6, r8, sp, lr}^
 b48:	65642f6d 	strbvs	r2, [r4, #-3949]!	; 0xfffff093
 b4c:	794d2f76 	stmdbvc	sp, {r1, r2, r4, r5, r6, r8, r9, sl, fp, sp}^
 b50:	7474694c 	ldrbtvc	r6, [r4], #-2380	; 0xfffff6b4
 b54:	534f656c 	movtpl	r6, #62828	; 0xf56c
 b58:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 b5c:	74730000 	ldrbtvc	r0, [r3], #-0
 b60:	2e747261 	cdpcs	2, 7, cr7, cr4, cr1, {3}
 b64:	00010073 	andeq	r0, r1, r3, ror r0
 b68:	05000000 	streq	r0, [r0, #-0]
 b6c:	00800002 	addeq	r0, r0, r2
 b70:	011f0300 	tsteq	pc, r0, lsl #6
 b74:	2f2f2f2f 	svccs	0x002f2f2f
 b78:	032f2f2f 			; <UNDEFINED> instruction: 0x032f2f2f
 b7c:	2f20080e 	svccs	0x0020080e
 b80:	2f2f2f2f 	svccs	0x002f2f2f
 b84:	312f2f32 			; <UNDEFINED> instruction: 0x312f2f32
 b88:	2f352f2f 	svccs	0x00352f2f
 b8c:	0331312f 	teqeq	r1, #-1073741813	; 0xc000000b
 b90:	2f2f2e12 	svccs	0x002f2e12
 b94:	4a0c032f 	bmi	301858 <_heap+0x281854>
 b98:	022f2f2f 	eoreq	r2, pc, #47, 30	; 0xbc
 b9c:	01010002 	tsteq	r1, r2
 ba0:	00000059 	andeq	r0, r0, r9, asr r0
 ba4:	003f0002 	eorseq	r0, pc, r2
 ba8:	01020000 	mrseq	r0, (UNDEF: 2)
 bac:	000d0efb 	strdeq	r0, [sp], -fp
 bb0:	01010101 	tsteq	r1, r1, lsl #2
 bb4:	01000000 	mrseq	r0, (UNDEF: 0)
 bb8:	2f010000 	svccs	0x00010000
 bbc:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
 bc0:	6462612f 	strbtvs	r6, [r2], #-303	; 0xfffffed1
 bc4:	72616b69 	rsbvc	r6, r1, #107520	; 0x1a400
 bc8:	642f6d69 	strtvs	r6, [pc], #-3433	; bd0 <CPSR_IRQ_INHIBIT+0xb50>
 bcc:	4d2f7665 	stcmi	6, cr7, [pc, #-404]!	; a40 <CPSR_IRQ_INHIBIT+0x9c0>
 bd0:	74694c79 	strbtvc	r4, [r9], #-3193	; 0xfffff387
 bd4:	4f656c74 	svcmi	0x00656c74
 bd8:	72732f53 	rsbsvc	r2, r3, #332	; 0x14c
 bdc:	73000063 	movwvc	r0, #99	; 0x63
 be0:	732e6376 			; <UNDEFINED> instruction: 0x732e6376
 be4:	00000100 	andeq	r0, r0, r0, lsl #2
 be8:	02050000 	andeq	r0, r5, #0
 bec:	00008d58 	andeq	r8, r0, r8, asr sp
 bf0:	302f3118 	eorcc	r3, pc, r8, lsl r1	; <UNPREDICTABLE>
 bf4:	2f2f3130 	svccs	0x002f3130
 bf8:	01000202 	tsteq	r0, r2, lsl #4
 bfc:	Address 0x0000000000000bfc is out of bounds.


Disassembly of section .debug_frame:

00000000 <.debug_frame>:
   0:	0000000c 	andeq	r0, r0, ip
   4:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
   8:	7c020001 	stcvc	0, cr0, [r2], {1}
   c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  10:	00000018 	andeq	r0, r0, r8, lsl r0
  14:	00000000 	andeq	r0, r0, r0
  18:	000080a8 	andeq	r8, r0, r8, lsr #1
  1c:	0000006c 	andeq	r0, r0, ip, rrx
  20:	8b080e42 	blhi	203930 <_heap+0x18392c>
  24:	42018e02 	andmi	r8, r1, #2, 28
  28:	00040b0c 	andeq	r0, r4, ip, lsl #22
  2c:	0000000c 	andeq	r0, r0, ip
  30:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  34:	7c020001 	stcvc	0, cr0, [r2], {1}
  38:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  3c:	00000014 	andeq	r0, r0, r4, lsl r0
  40:	0000002c 	andeq	r0, r0, ip, lsr #32
  44:	00008114 	andeq	r8, r0, r4, lsl r1
  48:	00000010 	andeq	r0, r0, r0, lsl r0
  4c:	8b040e42 	blhi	10395c <_heap+0x83958>
  50:	0b0d4201 	bleq	35085c <_heap+0x2d0858>
  54:	00000018 	andeq	r0, r0, r8, lsl r0
  58:	0000002c 	andeq	r0, r0, ip, lsr #32
  5c:	00008124 	andeq	r8, r0, r4, lsr #2
  60:	00000038 	andeq	r0, r0, r8, lsr r0
  64:	8b080e42 	blhi	203974 <_heap+0x183970>
  68:	42018e02 	andmi	r8, r1, #2, 28
  6c:	00040b0c 	andeq	r0, r4, ip, lsl #22
  70:	0000000c 	andeq	r0, r0, ip
  74:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  78:	7c020001 	stcvc	0, cr0, [r2], {1}
  7c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  80:	00000018 	andeq	r0, r0, r8, lsl r0
  84:	00000070 	andeq	r0, r0, r0, ror r0
  88:	0000815c 	andeq	r8, r0, ip, asr r1
  8c:	00000098 	muleq	r0, r8, r0
  90:	8b080e42 	blhi	2039a0 <_heap+0x18399c>
  94:	42018e02 	andmi	r8, r1, #2, 28
  98:	00040b0c 	andeq	r0, r4, ip, lsl #22
  9c:	0000000c 	andeq	r0, r0, ip
  a0:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  a4:	7c020001 	stcvc	0, cr0, [r2], {1}
  a8:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  ac:	0000001c 	andeq	r0, r0, ip, lsl r0
  b0:	0000009c 	muleq	r0, ip, r0
  b4:	000081f4 	strdeq	r8, [r0], -r4
  b8:	00000024 	andeq	r0, r0, r4, lsr #32
  bc:	8b040e42 	blhi	1039cc <_heap+0x839c8>
  c0:	0b0d4201 	bleq	3508cc <_heap+0x2d08c8>
  c4:	420d0d48 	andmi	r0, sp, #72, 26	; 0x1200
  c8:	00000ecb 	andeq	r0, r0, fp, asr #29
  cc:	0000001c 	andeq	r0, r0, ip, lsl r0
  d0:	0000009c 	muleq	r0, ip, r0
  d4:	00008218 	andeq	r8, r0, r8, lsl r2
  d8:	00000018 	andeq	r0, r0, r8, lsl r0
  dc:	8b040e42 	blhi	1039ec <_heap+0x839e8>
  e0:	0b0d4201 	bleq	3508ec <_heap+0x2d08e8>
  e4:	420d0d44 	andmi	r0, sp, #68, 26	; 0x1100
  e8:	00000ecb 	andeq	r0, r0, fp, asr #29
  ec:	0000000c 	andeq	r0, r0, ip
  f0:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  f4:	7c020001 	stcvc	0, cr0, [r2], {1}
  f8:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  fc:	0000001c 	andeq	r0, r0, ip, lsl r0
 100:	000000ec 	andeq	r0, r0, ip, ror #1
 104:	00008230 	andeq	r8, r0, r0, lsr r2
 108:	00000024 	andeq	r0, r0, r4, lsr #32
 10c:	8b040e42 	blhi	103a1c <_heap+0x83a18>
 110:	0b0d4201 	bleq	35091c <_heap+0x2d0918>
 114:	420d0d48 	andmi	r0, sp, #72, 26	; 0x1200
 118:	00000ecb 	andeq	r0, r0, fp, asr #29
 11c:	0000001c 	andeq	r0, r0, ip, lsl r0
 120:	000000ec 	andeq	r0, r0, ip, ror #1
 124:	00008254 	andeq	r8, r0, r4, asr r2
 128:	0000011c 	andeq	r0, r0, ip, lsl r1
 12c:	8b040e42 	blhi	103a3c <_heap+0x83a38>
 130:	0b0d4201 	bleq	35093c <_heap+0x2d0938>
 134:	0d0d8202 	sfmeq	f0, 1, [sp, #-8]
 138:	000ecb42 	andeq	ip, lr, r2, asr #22
 13c:	0000001c 	andeq	r0, r0, ip, lsl r0
 140:	000000ec 	andeq	r0, r0, ip, ror #1
 144:	00008370 	andeq	r8, r0, r0, ror r3
 148:	00000018 	andeq	r0, r0, r8, lsl r0
 14c:	8b040e42 	blhi	103a5c <_heap+0x83a58>
 150:	0b0d4201 	bleq	35095c <_heap+0x2d0958>
 154:	420d0d44 	andmi	r0, sp, #68, 26	; 0x1100
 158:	00000ecb 	andeq	r0, r0, fp, asr #29
 15c:	0000000c 	andeq	r0, r0, ip
 160:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 164:	7c020001 	stcvc	0, cr0, [r2], {1}
 168:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 16c:	0000001c 	andeq	r0, r0, ip, lsl r0
 170:	0000015c 	andeq	r0, r0, ip, asr r1
 174:	00008388 	andeq	r8, r0, r8, lsl #7
 178:	00000024 	andeq	r0, r0, r4, lsr #32
 17c:	8b040e42 	blhi	103a8c <_heap+0x83a88>
 180:	0b0d4201 	bleq	35098c <_heap+0x2d0988>
 184:	420d0d48 	andmi	r0, sp, #72, 26	; 0x1200
 188:	00000ecb 	andeq	r0, r0, fp, asr #29
 18c:	00000024 	andeq	r0, r0, r4, lsr #32
 190:	0000015c 	andeq	r0, r0, ip, asr r1
 194:	000083ac 	andeq	r8, r0, ip, lsr #7
 198:	00000038 	andeq	r0, r0, r8, lsr r0
 19c:	801c0e44 	andshi	r0, ip, r4, asr #28
 1a0:	82068107 	andhi	r8, r6, #-1073741823	; 0xc0000001
 1a4:	8b048305 	blhi	120dc0 <_heap+0xa0dbc>
 1a8:	8e028c03 	cdphi	12, 0, cr8, cr2, cr3, {0}
 1ac:	0b0c4201 	bleq	3109b8 <_heap+0x2909b4>
 1b0:	00000004 	andeq	r0, r0, r4
 1b4:	00000024 	andeq	r0, r0, r4, lsr #32
 1b8:	0000015c 	andeq	r0, r0, ip, asr r1
 1bc:	000083e4 	andeq	r8, r0, r4, ror #7
 1c0:	00000034 	andeq	r0, r0, r4, lsr r0
 1c4:	801c0e42 	andshi	r0, ip, r2, asr #28
 1c8:	82068107 	andhi	r8, r6, #-1073741823	; 0xc0000001
 1cc:	8b048305 	blhi	120de8 <_heap+0xa0de4>
 1d0:	8e028c03 	cdphi	12, 0, cr8, cr2, cr3, {0}
 1d4:	0b0c4201 	bleq	3109e0 <_heap+0x2909dc>
 1d8:	00000004 	andeq	r0, r0, r4
 1dc:	00000024 	andeq	r0, r0, r4, lsr #32
 1e0:	0000015c 	andeq	r0, r0, ip, asr r1
 1e4:	00008418 	andeq	r8, r0, r8, lsl r4
 1e8:	00000034 	andeq	r0, r0, r4, lsr r0
 1ec:	801c0e42 	andshi	r0, ip, r2, asr #28
 1f0:	82068107 	andhi	r8, r6, #-1073741823	; 0xc0000001
 1f4:	8b048305 	blhi	120e10 <_heap+0xa0e0c>
 1f8:	8e028c03 	cdphi	12, 0, cr8, cr2, cr3, {0}
 1fc:	0b0c4201 	bleq	310a08 <_heap+0x290a04>
 200:	00000004 	andeq	r0, r0, r4
 204:	00000024 	andeq	r0, r0, r4, lsr #32
 208:	0000015c 	andeq	r0, r0, ip, asr r1
 20c:	0000844c 	andeq	r8, r0, ip, asr #8
 210:	00000038 	andeq	r0, r0, r8, lsr r0
 214:	801c0e44 	andshi	r0, ip, r4, asr #28
 218:	82068107 	andhi	r8, r6, #-1073741823	; 0xc0000001
 21c:	8b048305 	blhi	120e38 <_heap+0xa0e34>
 220:	8e028c03 	cdphi	12, 0, cr8, cr2, cr3, {0}
 224:	0b0c4201 	bleq	310a30 <_heap+0x290a2c>
 228:	00000004 	andeq	r0, r0, r4
 22c:	00000024 	andeq	r0, r0, r4, lsr #32
 230:	0000015c 	andeq	r0, r0, ip, asr r1
 234:	00008484 	andeq	r8, r0, r4, lsl #9
 238:	00000038 	andeq	r0, r0, r8, lsr r0
 23c:	801c0e44 	andshi	r0, ip, r4, asr #28
 240:	82068107 	andhi	r8, r6, #-1073741823	; 0xc0000001
 244:	8b048305 	blhi	120e60 <_heap+0xa0e5c>
 248:	8e028c03 	cdphi	12, 0, cr8, cr2, cr3, {0}
 24c:	0b0c4201 	bleq	310a58 <_heap+0x290a54>
 250:	00000004 	andeq	r0, r0, r4
 254:	00000028 	andeq	r0, r0, r8, lsr #32
 258:	0000015c 	andeq	r0, r0, ip, asr r1
 25c:	000084bc 			; <UNDEFINED> instruction: 0x000084bc
 260:	00000104 	andeq	r0, r0, r4, lsl #2
 264:	80200e44 	eorhi	r0, r0, r4, asr #28
 268:	82078108 	andhi	r8, r7, #8, 2
 26c:	84058306 	strhi	r8, [r5], #-774	; 0xfffffcfa
 270:	8c038b04 			; <UNDEFINED> instruction: 0x8c038b04
 274:	42018e02 	andmi	r8, r1, #2, 28
 278:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
 27c:	200d0c74 	andcs	r0, sp, r4, ror ip
 280:	00000014 	andeq	r0, r0, r4, lsl r0
 284:	0000015c 	andeq	r0, r0, ip, asr r1
 288:	000085c0 	andeq	r8, r0, r0, asr #11
 28c:	00000010 	andeq	r0, r0, r0, lsl r0
 290:	040b0c42 	streq	r0, [fp], #-3138	; 0xfffff3be
 294:	000d0c44 	andeq	r0, sp, r4, asr #24
 298:	0000000c 	andeq	r0, r0, ip
 29c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 2a0:	7c020001 	stcvc	0, cr0, [r2], {1}
 2a4:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 2a8:	0000001c 	andeq	r0, r0, ip, lsl r0
 2ac:	00000298 	muleq	r0, r8, r2
 2b0:	000085d0 	ldrdeq	r8, [r0], -r0
 2b4:	00000024 	andeq	r0, r0, r4, lsr #32
 2b8:	8b040e42 	blhi	103bc8 <_heap+0x83bc4>
 2bc:	0b0d4201 	bleq	350ac8 <_heap+0x2d0ac4>
 2c0:	420d0d48 	andmi	r0, sp, #72, 26	; 0x1200
 2c4:	00000ecb 	andeq	r0, r0, fp, asr #29
 2c8:	0000001c 	andeq	r0, r0, ip, lsl r0
 2cc:	00000298 	muleq	r0, r8, r2
 2d0:	000085f4 	strdeq	r8, [r0], -r4
 2d4:	00000058 	andeq	r0, r0, r8, asr r0
 2d8:	8b040e42 	blhi	103be8 <_heap+0x83be4>
 2dc:	0b0d4201 	bleq	350ae8 <_heap+0x2d0ae4>
 2e0:	420d0d62 	andmi	r0, sp, #6272	; 0x1880
 2e4:	00000ecb 	andeq	r0, r0, fp, asr #29
 2e8:	0000000c 	andeq	r0, r0, ip
 2ec:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 2f0:	7c020001 	stcvc	0, cr0, [r2], {1}
 2f4:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 2f8:	0000001c 	andeq	r0, r0, ip, lsl r0
 2fc:	000002e8 	andeq	r0, r0, r8, ror #5
 300:	0000864c 	andeq	r8, r0, ip, asr #12
 304:	00000024 	andeq	r0, r0, r4, lsr #32
 308:	8b040e42 	blhi	103c18 <_heap+0x83c14>
 30c:	0b0d4201 	bleq	350b18 <_heap+0x2d0b14>
 310:	420d0d48 	andmi	r0, sp, #72, 26	; 0x1200
 314:	00000ecb 	andeq	r0, r0, fp, asr #29
 318:	0000001c 	andeq	r0, r0, ip, lsl r0
 31c:	000002e8 	andeq	r0, r0, r8, ror #5
 320:	00008670 	andeq	r8, r0, r0, ror r6
 324:	00000024 	andeq	r0, r0, r4, lsr #32
 328:	8b040e42 	blhi	103c38 <_heap+0x83c34>
 32c:	0b0d4201 	bleq	350b38 <_heap+0x2d0b34>
 330:	420d0d48 	andmi	r0, sp, #72, 26	; 0x1200
 334:	00000ecb 	andeq	r0, r0, fp, asr #29
 338:	0000001c 	andeq	r0, r0, ip, lsl r0
 33c:	000002e8 	andeq	r0, r0, r8, ror #5
 340:	00008694 	muleq	r0, r4, r6
 344:	0000013c 	andeq	r0, r0, ip, lsr r1
 348:	8b080e42 	blhi	203c58 <_heap+0x183c54>
 34c:	42018e02 	andmi	r8, r1, #2, 28
 350:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
 354:	080d0c92 	stmdaeq	sp, {r1, r4, r7, sl, fp}
 358:	0000001c 	andeq	r0, r0, ip, lsl r0
 35c:	000002e8 	andeq	r0, r0, r8, ror #5
 360:	000087d0 	ldrdeq	r8, [r0], -r0
 364:	00000054 	andeq	r0, r0, r4, asr r0
 368:	8b040e42 	blhi	103c78 <_heap+0x83c74>
 36c:	0b0d4201 	bleq	350b78 <_heap+0x2d0b74>
 370:	420d0d60 	andmi	r0, sp, #96, 26	; 0x1800
 374:	00000ecb 	andeq	r0, r0, fp, asr #29
 378:	0000001c 	andeq	r0, r0, ip, lsl r0
 37c:	000002e8 	andeq	r0, r0, r8, ror #5
 380:	00008824 	andeq	r8, r0, r4, lsr #16
 384:	00000064 	andeq	r0, r0, r4, rrx
 388:	8b080e42 	blhi	203c98 <_heap+0x183c94>
 38c:	42018e02 	andmi	r8, r1, #2, 28
 390:	6c040b0c 			; <UNDEFINED> instruction: 0x6c040b0c
 394:	00080d0c 	andeq	r0, r8, ip, lsl #26
 398:	0000001c 	andeq	r0, r0, ip, lsl r0
 39c:	000002e8 	andeq	r0, r0, r8, ror #5
 3a0:	00008888 	andeq	r8, r0, r8, lsl #17
 3a4:	00000048 	andeq	r0, r0, r8, asr #32
 3a8:	8b080e42 	blhi	203cb8 <_heap+0x183cb4>
 3ac:	42018e02 	andmi	r8, r1, #2, 28
 3b0:	5e040b0c 	vmlapl.f64	d0, d4, d12
 3b4:	00080d0c 	andeq	r0, r8, ip, lsl #26
 3b8:	0000001c 	andeq	r0, r0, ip, lsl r0
 3bc:	000002e8 	andeq	r0, r0, r8, ror #5
 3c0:	000088d0 	ldrdeq	r8, [r0], -r0
 3c4:	00000038 	andeq	r0, r0, r8, lsr r0
 3c8:	8b080e42 	blhi	203cd8 <_heap+0x183cd4>
 3cc:	42018e02 	andmi	r8, r1, #2, 28
 3d0:	54040b0c 	strpl	r0, [r4], #-2828	; 0xfffff4f4
 3d4:	00080d0c 	andeq	r0, r8, ip, lsl #26
 3d8:	0000001c 	andeq	r0, r0, ip, lsl r0
 3dc:	000002e8 	andeq	r0, r0, r8, ror #5
 3e0:	00008908 	andeq	r8, r0, r8, lsl #18
 3e4:	000000e0 	andeq	r0, r0, r0, ror #1
 3e8:	8b080e42 	blhi	203cf8 <_heap+0x183cf4>
 3ec:	42018e02 	andmi	r8, r1, #2, 28
 3f0:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
 3f4:	080d0c66 	stmdaeq	sp, {r1, r2, r5, r6, sl, fp}
 3f8:	0000000c 	andeq	r0, r0, ip
 3fc:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 400:	7c020001 	stcvc	0, cr0, [r2], {1}
 404:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 408:	00000018 	andeq	r0, r0, r8, lsl r0
 40c:	000003f8 	strdeq	r0, [r0], -r8
 410:	000089e8 	andeq	r8, r0, r8, ror #19
 414:	000000a8 	andeq	r0, r0, r8, lsr #1
 418:	8b080e42 	blhi	203d28 <_heap+0x183d24>
 41c:	42018e02 	andmi	r8, r1, #2, 28
 420:	00040b0c 	andeq	r0, r4, ip, lsl #22
 424:	0000000c 	andeq	r0, r0, ip
 428:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 42c:	7c020001 	stcvc	0, cr0, [r2], {1}
 430:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 434:	0000001c 	andeq	r0, r0, ip, lsl r0
 438:	00000424 	andeq	r0, r0, r4, lsr #8
 43c:	00008a90 	muleq	r0, r0, sl
 440:	0000009c 	muleq	r0, ip, r0
 444:	8b080e42 	blhi	203d54 <_heap+0x183d50>
 448:	42018e02 	andmi	r8, r1, #2, 28
 44c:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
 450:	080d0c48 	stmdaeq	sp, {r3, r6, sl, fp}
 454:	0000000c 	andeq	r0, r0, ip
 458:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 45c:	7c020001 	stcvc	0, cr0, [r2], {1}
 460:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 464:	0000001c 	andeq	r0, r0, ip, lsl r0
 468:	00000454 	andeq	r0, r0, r4, asr r4
 46c:	00008b2c 	andeq	r8, r0, ip, lsr #22
 470:	00000044 	andeq	r0, r0, r4, asr #32
 474:	8b040e42 	blhi	103d84 <_heap+0x83d80>
 478:	0b0d4201 	bleq	350c84 <_heap+0x2d0c80>
 47c:	420d0d5a 	andmi	r0, sp, #5760	; 0x1680
 480:	00000ecb 	andeq	r0, r0, fp, asr #29
 484:	0000001c 	andeq	r0, r0, ip, lsl r0
 488:	00000454 	andeq	r0, r0, r4, asr r4
 48c:	00008b70 	andeq	r8, r0, r0, ror fp
 490:	000000e4 	andeq	r0, r0, r4, ror #1
 494:	8b040e42 	blhi	103da4 <_heap+0x83da0>
 498:	0b0d4201 	bleq	350ca4 <_heap+0x2d0ca0>
 49c:	0d0d6a02 	vstreq	s12, [sp, #-8]
 4a0:	000ecb42 	andeq	ip, lr, r2, asr #22
 4a4:	0000001c 	andeq	r0, r0, ip, lsl r0
 4a8:	00000454 	andeq	r0, r0, r4, asr r4
 4ac:	00008c54 	andeq	r8, r0, r4, asr ip
 4b0:	00000104 	andeq	r0, r0, r4, lsl #2
 4b4:	8b040e42 	blhi	103dc4 <_heap+0x83dc0>
 4b8:	0b0d4201 	bleq	350cc4 <_heap+0x2d0cc0>
 4bc:	0d0d7a02 	vstreq	s14, [sp, #-8]
 4c0:	000ecb42 	andeq	ip, lr, r2, asr #22

Disassembly of section .debug_str:

00000000 <.debug_str>:
       0:	73625f5f 	cmnvc	r2, #380	; 0x17c
       4:	6e655f73 	mcrvs	15, 3, r5, cr5, cr3, {3}
       8:	005f5f64 	subseq	r5, pc, r4, ror #30
       c:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; ffffff58 <CPSR_UNAFFECTED_BITS+0x58>
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
      e0:	755f5f00 	ldrbvc	r5, [pc, #-3840]	; fffff1e8 <CPSR_UNAFFECTED_BITS+0xfffff2e8>
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
     160:	6100632e 	tstvs	r0, lr, lsr #6
     164:	73676174 	cmnvc	r7, #116, 2
     168:	65687300 	strbvs	r7, [r8, #-768]!	; 0xfffffd00
     16c:	735f6c6c 	cmpvc	pc, #108, 24	; 0x6c00
     170:	74726174 	ldrbtvc	r6, [r2], #-372	; 0xfffffe8c
     174:	7865745f 	stmdavc	r5!, {r0, r1, r2, r3, r4, r6, sl, ip, sp, lr}^
     178:	682f0074 	stmdavs	pc!, {r2, r4, r5, r6}	; <UNPREDICTABLE>
     17c:	2f656d6f 	svccs	0x00656d6f
     180:	69646261 	stmdbvs	r4!, {r0, r5, r6, r9, sp, lr}^
     184:	6972616b 	ldmdbvs	r2!, {r0, r1, r3, r5, r6, r8, sp, lr}^
     188:	65642f6d 	strbvs	r2, [r4, #-3949]!	; 0xfffff093
     18c:	794d2f76 	stmdbvc	sp, {r1, r2, r4, r5, r6, r8, r9, sl, fp, sp}^
     190:	7474694c 	ldrbtvc	r6, [r4], #-2380	; 0xfffff6b4
     194:	534f656c 	movtpl	r6, #62828	; 0xf56c
     198:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
     19c:	72656b2f 	rsbvc	r6, r5, #48128	; 0xbc00
     1a0:	2e6c656e 	cdpcs	5, 6, cr6, cr12, cr14, {3}
     1a4:	656b0063 	strbvs	r0, [fp, #-99]!	; 0xffffff9d
     1a8:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
     1ac:	69616d5f 	stmdbvs	r1!, {r0, r1, r2, r3, r4, r6, r8, sl, fp, sp, lr}^
     1b0:	6973006e 	ldmdbvs	r3!, {r1, r2, r3, r5, r6}^
     1b4:	7974657a 	ldmdbvc	r4!, {r1, r3, r4, r5, r6, r8, sl, sp, lr}^
     1b8:	4c006570 	cfstr32mi	mvfx6, [r0], {112}	; 0x70
     1bc:	0064616f 	rsbeq	r6, r4, pc, ror #2
     1c0:	6f6c6552 	svcvs	0x006c6552
     1c4:	52006461 	andpl	r6, r0, #1627389952	; 0x61000000
     1c8:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     1cc:	72417465 	subvc	r7, r1, #1694498816	; 0x65000000
     1d0:	6d69546d 	cfstrdvs	mvd5, [r9, #-436]!	; 0xfffffe4c
     1d4:	2f007265 	svccs	0x00007265
     1d8:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
     1dc:	6462612f 	strbtvs	r6, [r2], #-303	; 0xfffffed1
     1e0:	72616b69 	rsbvc	r6, r1, #107520	; 0x1a400
     1e4:	642f6d69 	strtvs	r6, [pc], #-3433	; 1ec <CPSR_IRQ_INHIBIT+0x16c>
     1e8:	4d2f7665 	stcmi	6, cr7, [pc, #-404]!	; 5c <CPSR_FIQ_INHIBIT+0x1c>
     1ec:	74694c79 	strbtvc	r4, [r9], #-3193	; 0xfffff387
     1f0:	4f656c74 	svcmi	0x00656c74
     1f4:	72732f53 	rsbsvc	r2, r3, #332	; 0x14c
     1f8:	70722f63 	rsbsvc	r2, r2, r3, ror #30
     1fc:	72612d69 	rsbvc	r2, r1, #6720	; 0x1a40
     200:	6d69746d 	cfstrdvs	mvd7, [r9, #-436]!	; 0xfffffe4c
     204:	632e7265 			; <UNDEFINED> instruction: 0x632e7265
     208:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
     20c:	6d72615f 	ldfvse	f6, [r2, #-380]!	; 0xfffffe84
     210:	6d69745f 	cfstrdvs	mvd7, [r9, #-380]!	; 0xfffffe84
     214:	745f7265 	ldrbvc	r7, [pc], #-613	; 21c <CPSR_IRQ_INHIBIT+0x19c>
     218:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
     21c:	546d7241 	strbtpl	r7, [sp], #-577	; 0xfffffdbf
     220:	72656d69 	rsbvc	r6, r5, #6720	; 0x1a40
     224:	57415200 	strbpl	r5, [r1, -r0, lsl #4]
     228:	00515249 	subseq	r5, r1, r9, asr #4
     22c:	6b73614d 	blvs	1cd8768 <_heap+0x1c58764>
     230:	52496465 	subpl	r6, r9, #1694498816	; 0x65000000
     234:	61560051 	cmpvs	r6, r1, asr r0
     238:	0065756c 	rsbeq	r7, r5, ip, ror #10
     23c:	44657250 	strbtmi	r7, [r5], #-592	; 0xfffffdb0
     240:	64697669 	strbtvs	r7, [r9], #-1641	; 0xfffff997
     244:	46007265 	strmi	r7, [r0], -r5, ror #4
     248:	52656572 	rsbpl	r6, r5, #478150656	; 0x1c800000
     24c:	696e6e75 	stmdbvs	lr!, {r0, r2, r4, r5, r6, r9, sl, fp, sp, lr}^
     250:	6f43676e 	svcvs	0x0043676e
     254:	65746e75 	ldrbvs	r6, [r4, #-3701]!	; 0xfffff18b
     258:	6f430072 	svcvs	0x00430072
     25c:	6f72746e 	svcvs	0x0072746e
     260:	5052006c 	subspl	r0, r2, ip, rrx
     264:	72415f49 	subvc	r5, r1, #292	; 0x124
     268:	6d69546d 	cfstrdvs	mvd5, [r9, #-436]!	; 0xfffffe4c
     26c:	6e497265 	cdpvs	2, 4, cr7, cr9, cr5, {3}
     270:	49007469 	stmdbmi	r0, {r0, r3, r5, r6, sl, ip, sp, lr}
     274:	6c435152 	stfvse	f5, [r3], {82}	; 0x52
     278:	00726165 	rsbseq	r6, r2, r5, ror #2
     27c:	45535047 	ldrbmi	r5, [r3, #-71]	; 0xffffffb9
     280:	47003054 	smlsdmi	r0, r4, r0, r3
     284:	54455350 	strbpl	r5, [r5], #-848	; 0xfffffcb0
     288:	50470031 	subpl	r0, r7, r1, lsr r0
     28c:	4c455346 	mcrrmi	3, 4, r5, r5, cr6
     290:	50470030 	subpl	r0, r7, r0, lsr r0
     294:	4c455346 	mcrrmi	3, 4, r5, r5, cr6
     298:	50470031 	subpl	r0, r7, r1, lsr r0
     29c:	4c455346 	mcrrmi	3, 4, r5, r5, cr6
     2a0:	50470032 	subpl	r0, r7, r2, lsr r0
     2a4:	4c455346 	mcrrmi	3, 4, r5, r5, cr6
     2a8:	50470033 	subpl	r0, r7, r3, lsr r0
     2ac:	4c455346 	mcrrmi	3, 4, r5, r5, cr6
     2b0:	50470034 	subpl	r0, r7, r4, lsr r0
     2b4:	4c455346 	mcrrmi	3, 4, r5, r5, cr6
     2b8:	50470035 	subpl	r0, r7, r5, lsr r0
     2bc:	314e4546 	cmpcc	lr, r6, asr #10
     2c0:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
     2c4:	6f697047 	svcvs	0x00697047
     2c8:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     2cc:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     2d0:	0030344f 	eorseq	r3, r0, pc, asr #8
     2d4:	5f495052 	svcpl	0x00495052
     2d8:	4f495047 	svcmi	0x00495047
     2dc:	52003234 	andpl	r3, r0, #52, 4	; 0x40000003
     2e0:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     2e4:	344f4950 	strbcc	r4, [pc], #-2384	; 2ec <CPSR_IRQ_INHIBIT+0x26c>
     2e8:	50520033 	subspl	r0, r2, r3, lsr r0
     2ec:	50475f49 	subpl	r5, r7, r9, asr #30
     2f0:	34344f49 	ldrtcc	r4, [r4], #-3913	; 0xfffff0b7
     2f4:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     2f8:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     2fc:	0035344f 	eorseq	r3, r5, pc, asr #8
     300:	5f495052 	svcpl	0x00495052
     304:	4f495047 	svcmi	0x00495047
     308:	52003634 	andpl	r3, r0, #52, 12	; 0x3400000
     30c:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     310:	344f4950 	strbcc	r4, [pc], #-2384	; 318 <CPSR_IRQ_INHIBIT+0x298>
     314:	50520037 	subspl	r0, r2, r7, lsr r0
     318:	50475f49 	subpl	r5, r7, r9, asr #30
     31c:	38344f49 	ldmdacc	r4!, {r0, r3, r6, r8, r9, sl, fp, lr}
     320:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     324:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     328:	0039344f 	eorseq	r3, r9, pc, asr #8
     32c:	5f495052 	svcpl	0x00495052
     330:	6f697047 	svcvs	0x00697047
     334:	74696e49 	strbtvc	r6, [r9], #-3657	; 0xfffff1b7
     338:	52504700 	subspl	r4, r0, #0, 14
     33c:	00304e45 	eorseq	r4, r0, r5, asr #28
     340:	45525047 	ldrbmi	r5, [r2, #-71]	; 0xffffffb9
     344:	4700314e 	strmi	r3, [r0, -lr, asr #2]
     348:	4e454850 	mcrmi	8, 2, r4, cr5, cr0, {2}
     34c:	50520030 	subspl	r0, r2, r0, lsr r0
     350:	50475f49 	subpl	r5, r7, r9, asr #30
     354:	30324f49 	eorscc	r4, r2, r9, asr #30
     358:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     35c:	7465535f 	strbtvc	r5, [r5], #-863	; 0xfffffca1
     360:	6f697047 	svcvs	0x00697047
     364:	466e6950 			; <UNDEFINED> instruction: 0x466e6950
     368:	74636e75 	strbtvc	r6, [r3], #-3701	; 0xfffff18b
     36c:	006e6f69 	rsbeq	r6, lr, r9, ror #30
     370:	65736552 	ldrbvs	r6, [r3, #-1362]!	; 0xfffffaae
     374:	64657672 	strbtvs	r7, [r5], #-1650	; 0xfffff98e
     378:	65520030 	ldrbvs	r0, [r2, #-48]	; 0xffffffd0
     37c:	76726573 			; <UNDEFINED> instruction: 0x76726573
     380:	00316465 	eorseq	r6, r1, r5, ror #8
     384:	65736552 	ldrbvs	r6, [r3, #-1362]!	; 0xfffffaae
     388:	64657672 	strbtvs	r7, [r5], #-1650	; 0xfffff98e
     38c:	65520032 	ldrbvs	r0, [r2, #-50]	; 0xffffffce
     390:	76726573 			; <UNDEFINED> instruction: 0x76726573
     394:	00336465 	eorseq	r6, r3, r5, ror #8
     398:	65736552 	ldrbvs	r6, [r3, #-1362]!	; 0xfffffaae
     39c:	64657672 	strbtvs	r7, [r5], #-1650	; 0xfffff98e
     3a0:	50470035 	subpl	r0, r7, r5, lsr r0
     3a4:	30534445 	subscc	r4, r3, r5, asr #8
     3a8:	45504700 	ldrbmi	r4, [r0, #-1792]	; 0xfffff900
     3ac:	00315344 	eorseq	r5, r1, r4, asr #6
     3b0:	65736552 	ldrbvs	r6, [r3, #-1362]!	; 0xfffffaae
     3b4:	64657672 	strbtvs	r7, [r5], #-1650	; 0xfffff98e
     3b8:	65520038 	ldrbvs	r0, [r2, #-56]	; 0xffffffc8
     3bc:	76726573 			; <UNDEFINED> instruction: 0x76726573
     3c0:	00396465 	eorseq	r6, r9, r5, ror #8
     3c4:	5f495052 	svcpl	0x00495052
     3c8:	4f495047 	svcmi	0x00495047
     3cc:	52003134 	andpl	r3, r0, #52, 2
     3d0:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     3d4:	314f4950 	cmpcc	pc, r0, asr r9	; <UNPREDICTABLE>
     3d8:	50520030 	subspl	r0, r2, r0, lsr r0
     3dc:	50475f49 	subpl	r5, r7, r9, asr #30
     3e0:	31314f49 	teqcc	r1, r9, asr #30
     3e4:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     3e8:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     3ec:	0032314f 	eorseq	r3, r2, pc, asr #2
     3f0:	5f495052 	svcpl	0x00495052
     3f4:	4f495047 	svcmi	0x00495047
     3f8:	52003331 	andpl	r3, r0, #-1006632960	; 0xc4000000
     3fc:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     400:	314f4950 	cmpcc	pc, r0, asr r9	; <UNPREDICTABLE>
     404:	50520034 	subspl	r0, r2, r4, lsr r0
     408:	50475f49 	subpl	r5, r7, r9, asr #30
     40c:	35314f49 	ldrcc	r4, [r1, #-3913]!	; 0xfffff0b7
     410:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     414:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     418:	0036314f 	eorseq	r3, r6, pc, asr #2
     41c:	5f495052 	svcpl	0x00495052
     420:	4f495047 	svcmi	0x00495047
     424:	52003731 	andpl	r3, r0, #12845056	; 0xc40000
     428:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     42c:	314f4950 	cmpcc	pc, r0, asr r9	; <UNPREDICTABLE>
     430:	50520038 	subspl	r0, r2, r8, lsr r0
     434:	50475f49 	subpl	r5, r7, r9, asr #30
     438:	39314f49 	ldmdbcc	r1!, {r0, r3, r6, r8, r9, sl, fp, lr}
     43c:	65736600 	ldrbvs	r6, [r3, #-1536]!	; 0xfffffa00
     440:	65725f6c 	ldrbvs	r5, [r2, #-3948]!	; 0xfffff094
     444:	50520067 	subspl	r0, r2, r7, rrx
     448:	50475f49 	subpl	r5, r7, r9, asr #30
     44c:	30354f49 	eorscc	r4, r5, r9, asr #30
     450:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     454:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     458:	0031354f 	eorseq	r3, r1, pc, asr #10
     45c:	5f495052 	svcpl	0x00495052
     460:	4f495047 	svcmi	0x00495047
     464:	47003335 	smladxmi	r0, r5, r3, r3
     468:	44555050 	ldrbmi	r5, [r5], #-80	; 0xffffffb0
     46c:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     470:	7465475f 	strbtvc	r4, [r5], #-1887	; 0xfffff8a1
     474:	6f697047 	svcvs	0x00697047
     478:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
     47c:	6970675f 	ldmdbvs	r0!, {r0, r1, r2, r3, r4, r6, r8, r9, sl, sp, lr}^
     480:	69705f6f 	ldmdbvs	r0!, {r0, r1, r2, r3, r5, r6, r8, r9, sl, fp, ip, lr}^
     484:	00745f6e 	rsbseq	r5, r4, lr, ror #30
     488:	454c5047 	strbmi	r5, [ip, #-71]	; 0xffffffb9
     48c:	4700304e 	strmi	r3, [r0, -lr, asr #32]
     490:	45464150 	strbmi	r4, [r6, #-336]	; 0xfffffeb0
     494:	4700304e 	strmi	r3, [r0, -lr, asr #32]
     498:	45464150 	strbmi	r4, [r6, #-336]	; 0xfffffeb0
     49c:	5200314e 	andpl	r3, r0, #-2147483629	; 0x80000013
     4a0:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     4a4:	304f4950 	subcc	r4, pc, r0, asr r9	; <UNPREDICTABLE>
     4a8:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     4ac:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     4b0:	5200314f 	andpl	r3, r0, #-1073741805	; 0xc0000013
     4b4:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     4b8:	324f4950 	subcc	r4, pc, #80, 18	; 0x140000
     4bc:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     4c0:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     4c4:	5200344f 	andpl	r3, r0, #1325400064	; 0x4f000000
     4c8:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     4cc:	354f4950 	strbcc	r4, [pc, #-2384]	; fffffb84 <CPSR_UNAFFECTED_BITS+0xfffffc84>
     4d0:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     4d4:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     4d8:	4600364f 	strmi	r3, [r0], -pc, asr #12
     4dc:	554f5f53 	strbpl	r5, [pc, #-3923]	; fffff591 <CPSR_UNAFFECTED_BITS+0xfffff691>
     4e0:	54555054 	ldrbpl	r5, [r5], #-84	; 0xffffffac
     4e4:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     4e8:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     4ec:	5200384f 	andpl	r3, r0, #5177344	; 0x4f0000
     4f0:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     4f4:	394f4950 	stmdbcc	pc, {r4, r6, r8, fp, lr}^	; <UNPREDICTABLE>
     4f8:	43504700 	cmpmi	r0, #0, 14
     4fc:	0031524c 	eorseq	r5, r1, ip, asr #4
     500:	5f697072 	svcpl	0x00697072
     504:	5f676572 	svcpl	0x00676572
     508:	745f6f72 	ldrbvc	r6, [pc], #-3954	; 510 <CPSR_IRQ_INHIBIT+0x490>
     50c:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     510:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     514:	0031324f 	eorseq	r3, r1, pc, asr #4
     518:	5f495052 	svcpl	0x00495052
     51c:	4f495047 	svcmi	0x00495047
     520:	52003232 	andpl	r3, r0, #536870915	; 0x20000003
     524:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     528:	324f4950 	subcc	r4, pc, #80, 18	; 0x140000
     52c:	50520033 	subspl	r0, r2, r3, lsr r0
     530:	50475f49 	subpl	r5, r7, r9, asr #30
     534:	34324f49 	ldrtcc	r4, [r2], #-3913	; 0xfffff0b7
     538:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     53c:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     540:	0035324f 	eorseq	r3, r5, pc, asr #4
     544:	5f495052 	svcpl	0x00495052
     548:	4f495047 	svcmi	0x00495047
     54c:	52003632 	andpl	r3, r0, #52428800	; 0x3200000
     550:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     554:	324f4950 	subcc	r4, pc, #80, 18	; 0x140000
     558:	50520037 	subspl	r0, r2, r7, lsr r0
     55c:	50475f49 	subpl	r5, r7, r9, asr #30
     560:	38324f49 	ldmdacc	r2!, {r0, r3, r6, r8, r9, sl, fp, lr}
     564:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     568:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     56c:	0039324f 	eorseq	r3, r9, pc, asr #4
     570:	65736552 	ldrbvs	r6, [r3, #-1362]!	; 0xfffffaae
     574:	64657672 	strbtvs	r7, [r5], #-1650	; 0xfffff98e
     578:	47003131 	smladxmi	r0, r1, r1, r3
     57c:	45524150 	ldrbmi	r4, [r2, #-336]	; 0xfffffeb0
     580:	4700304e 	strmi	r3, [r0, -lr, asr #32]
     584:	4e454c50 	mcrmi	12, 2, r4, cr5, cr0, {2}
     588:	70720031 	rsbsvc	r0, r2, r1, lsr r0
     58c:	65725f69 	ldrbvs	r5, [r2, #-3945]!	; 0xfffff097
     590:	77725f67 	ldrbvc	r5, [r2, -r7, ror #30]!
     594:	4700745f 	smlsdmi	r0, pc, r4, r7	; <UNPREDICTABLE>
     598:	44555050 	ldrbmi	r5, [r5], #-80	; 0xffffffb0
     59c:	304b4c43 	subcc	r4, fp, r3, asr #24
     5a0:	73655200 	cmnvc	r5, #0, 4
     5a4:	65767265 	ldrbvs	r7, [r6, #-613]!	; 0xfffffd9b
     5a8:	00303164 	eorseq	r3, r0, r4, ror #2
     5ac:	52415047 	subpl	r5, r1, #71	; 0x47
     5b0:	00314e45 	eorseq	r4, r1, r5, asr #28
     5b4:	5f697072 	svcpl	0x00697072
     5b8:	6f697067 	svcvs	0x00697067
     5bc:	746c615f 	strbtvc	r6, [ip], #-351	; 0xfffffea1
     5c0:	6e75665f 	mrcvs	6, 3, r6, cr5, cr15, {2}
     5c4:	6f697463 	svcvs	0x00697463
     5c8:	00745f6e 	rsbseq	r5, r4, lr, ror #30
     5cc:	5f495052 	svcpl	0x00495052
     5d0:	4f495047 	svcmi	0x00495047
     5d4:	53460037 	movtpl	r0, #24631	; 0x6037
     5d8:	504e495f 	subpl	r4, lr, pc, asr r9
     5dc:	47005455 	smlsdmi	r0, r5, r4, r5
     5e0:	44555050 	ldrbmi	r5, [r5], #-80	; 0xffffffb0
     5e4:	314b4c43 	cmpcc	fp, r3, asr #24
     5e8:	6f682f00 	svcvs	0x00682f00
     5ec:	612f656d 			; <UNDEFINED> instruction: 0x612f656d
     5f0:	6b696462 	blvs	1a59780 <_heap+0x19d977c>
     5f4:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
     5f8:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
     5fc:	4c794d2f 	ldclmi	13, cr4, [r9], #-188	; 0xffffff44
     600:	6c747469 	cfldrdvs	mvd7, [r4], #-420	; 0xfffffe5c
     604:	2f534f65 	svccs	0x00534f65
     608:	2f637273 	svccs	0x00637273
     60c:	2d697072 	stclcs	0, cr7, [r9, #-456]!	; 0xfffffe38
     610:	6f697067 	svcvs	0x00697067
     614:	5200632e 	andpl	r6, r0, #-1207959552	; 0xb8000000
     618:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     61c:	334f4950 	movtcc	r4, #63824	; 0xf950
     620:	50470033 	subpl	r0, r7, r3, lsr r0
     624:	3056454c 	subscc	r4, r6, ip, asr #10
     628:	4c504700 	mrrcmi	7, 0, r4, r0, cr0
     62c:	00315645 	eorseq	r5, r1, r5, asr #12
     630:	65736552 	ldrbvs	r6, [r3, #-1362]!	; 0xfffffaae
     634:	64657672 	strbtvs	r7, [r5], #-1650	; 0xfffff98e
     638:	50520034 	subspl	r0, r2, r4, lsr r0
     63c:	50475f49 	subpl	r5, r7, r9, asr #30
     640:	37334f49 	ldrcc	r4, [r3, -r9, asr #30]!
     644:	73655200 	cmnvc	r5, #0, 4
     648:	65767265 	ldrbvs	r7, [r6, #-613]!	; 0xfffffd9b
     64c:	47003664 	strmi	r3, [r0, -r4, ror #12]
     650:	4e454850 	mcrmi	8, 2, r4, cr5, cr0, {2}
     654:	50520031 	subspl	r0, r2, r1, lsr r0
     658:	50475f49 	subpl	r5, r7, r9, asr #30
     65c:	32354f49 	eorscc	r4, r5, #292	; 0x124
     660:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     664:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     668:	0030334f 	eorseq	r3, r0, pc, asr #6
     66c:	5f495052 	svcpl	0x00495052
     670:	4f495047 	svcmi	0x00495047
     674:	52003133 	andpl	r3, r0, #-1073741812	; 0xc000000c
     678:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     67c:	334f4950 	movtcc	r4, #63824	; 0xf950
     680:	50520032 	subspl	r0, r2, r2, lsr r0
     684:	50475f49 	subpl	r5, r7, r9, asr #30
     688:	00334f49 	eorseq	r4, r3, r9, asr #30
     68c:	5f495052 	svcpl	0x00495052
     690:	4f495047 	svcmi	0x00495047
     694:	52003433 	andpl	r3, r0, #855638016	; 0x33000000
     698:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     69c:	334f4950 	movtcc	r4, #63824	; 0xf950
     6a0:	50520035 	subspl	r0, r2, r5, lsr r0
     6a4:	50475f49 	subpl	r5, r7, r9, asr #30
     6a8:	36334f49 	ldrtcc	r4, [r3], -r9, asr #30
     6ac:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
     6b0:	6765725f 			; <UNDEFINED> instruction: 0x6765725f
     6b4:	5f6f775f 	svcpl	0x006f775f
     6b8:	50520074 	subspl	r0, r2, r4, ror r0
     6bc:	50475f49 	subpl	r5, r7, r9, asr #30
     6c0:	38334f49 	ldmdacc	r3!, {r0, r3, r6, r8, r9, sl, fp, lr}
     6c4:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     6c8:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     6cc:	0039334f 	eorseq	r3, r9, pc, asr #6
     6d0:	65736552 	ldrbvs	r6, [r3, #-1362]!	; 0xfffffaae
     6d4:	64657672 	strbtvs	r7, [r5], #-1650	; 0xfffff98e
     6d8:	73660037 	cmnvc	r6, #55	; 0x37
     6dc:	635f6c65 	cmpvs	pc, #25856	; 0x6500
     6e0:	0079706f 	rsbseq	r7, r9, pc, rrx
     6e4:	6f697067 	svcvs	0x00697067
     6e8:	46504700 	ldrbmi	r4, [r0], -r0, lsl #14
     6ec:	00304e45 	eorseq	r4, r0, r5, asr #28
     6f0:	415f5346 	cmpmi	pc, r6, asr #6
     6f4:	0030544c 	eorseq	r5, r0, ip, asr #8
     6f8:	415f5346 	cmpmi	pc, r6, asr #6
     6fc:	0031544c 	eorseq	r5, r1, ip, asr #8
     700:	415f5346 	cmpmi	pc, r6, asr #6
     704:	0032544c 	eorseq	r5, r2, ip, asr #8
     708:	415f5346 	cmpmi	pc, r6, asr #6
     70c:	0033544c 	eorseq	r5, r3, ip, asr #8
     710:	415f5346 	cmpmi	pc, r6, asr #6
     714:	0034544c 	eorseq	r5, r4, ip, asr #8
     718:	415f5346 	cmpmi	pc, r6, asr #6
     71c:	0035544c 	eorseq	r5, r5, ip, asr #8
     720:	5f697072 	svcpl	0x00697072
     724:	6f697067 	svcvs	0x00697067
     728:	4700745f 	smlsdmi	r0, pc, r4, r7	; <UNPREDICTABLE>
     72c:	524c4350 	subpl	r4, ip, #80, 6	; 0x40000001
     730:	72700030 	rsbsvc	r0, r0, #48	; 0x30
     734:	74656665 	strbtvc	r6, [r5], #-1637	; 0xfffff99b
     738:	615f6863 	cmpvs	pc, r3, ror #16
     73c:	74726f62 	ldrbtvc	r6, [r2], #-3938	; 0xfffff09e
     740:	6365765f 	cmnvs	r5, #99614720	; 0x5f00000
     744:	00726f74 	rsbseq	r6, r2, r4, ror pc
     748:	5f495052 	svcpl	0x00495052
     74c:	49746547 	ldmdbmi	r4!, {r0, r1, r2, r6, r8, sl, sp, lr}^
     750:	6f437172 	svcvs	0x00437172
     754:	6f72746e 	svcvs	0x0072746e
     758:	72656c6c 	rsbvc	r6, r5, #108, 24	; 0x6c00
     75c:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
     760:	7172695f 	cmnvc	r2, pc, asr r9
     764:	6e6f635f 	mcrvs	3, 3, r6, cr15, cr15, {2}
     768:	6c6f7274 	sfmvs	f7, 2, [pc], #-464	; 5a0 <CPSR_IRQ_INHIBIT+0x520>
     76c:	5f72656c 	svcpl	0x0072656c
     770:	70720074 	rsbsvc	r0, r2, r4, ror r0
     774:	51524969 	cmppl	r2, r9, ror #18
     778:	746e6f43 	strbtvc	r6, [lr], #-3907	; 0xfffff0bd
     77c:	6c6c6f72 	stclvs	15, cr6, [ip], #-456	; 0xfffffe38
     780:	44007265 	strmi	r7, [r0], #-613	; 0xfffffd9b
     784:	62617369 	rsbvs	r7, r1, #-1543503871	; 0xa4000001
     788:	425f656c 	subsmi	r6, pc, #108, 10	; 0x1b000000
     78c:	63697361 	cmnvs	r9, #-2080374783	; 0x84000001
     790:	5152495f 	cmppl	r2, pc, asr r9
     794:	49460073 	stmdbmi	r6, {r0, r1, r4, r5, r6}^
     798:	6f635f51 	svcvs	0x00635f51
     79c:	6f72746e 	svcvs	0x0072746e
     7a0:	5249006c 	subpl	r0, r9, #108	; 0x6c
     7a4:	61625f51 	cmnvs	r2, r1, asr pc
     7a8:	5f636973 	svcpl	0x00636973
     7ac:	646e6570 	strbtvs	r6, [lr], #-1392	; 0xfffffa90
     7b0:	00676e69 	rsbeq	r6, r7, r9, ror #28
     7b4:	69727473 	ldmdbvs	r2!, {r0, r1, r4, r5, r6, sl, ip, sp, lr}^
     7b8:	4500676e 	strmi	r6, [r0, #-1902]	; 0xfffff892
     7bc:	6c62616e 	stfvse	f6, [r2], #-440	; 0xfffffe48
     7c0:	61425f65 	cmpvs	r2, r5, ror #30
     7c4:	5f636973 	svcpl	0x00636973
     7c8:	73515249 	cmpvc	r1, #-1879048188	; 0x90000004
     7cc:	616e4500 	cmnvs	lr, r0, lsl #10
     7d0:	5f656c62 	svcpl	0x00656c62
     7d4:	73515249 	cmpvc	r1, #-1879048188	; 0x90000004
     7d8:	4500315f 	strmi	r3, [r0, #-351]	; 0xfffffea1
     7dc:	6c62616e 	stfvse	f6, [r2], #-440	; 0xfffffe48
     7e0:	52495f65 	subpl	r5, r9, #404	; 0x194
     7e4:	325f7351 	subscc	r7, pc, #1140850689	; 0x44000001
     7e8:	6f682f00 	svcvs	0x00682f00
     7ec:	612f656d 			; <UNDEFINED> instruction: 0x612f656d
     7f0:	6b696462 	blvs	1a59980 <_heap+0x19d997c>
     7f4:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
     7f8:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
     7fc:	4c794d2f 	ldclmi	13, cr4, [r9], #-188	; 0xffffff44
     800:	6c747469 	cfldrdvs	mvd7, [r4], #-420	; 0xfffffe5c
     804:	2f534f65 	svccs	0x00534f65
     808:	2f637273 	svccs	0x00637273
     80c:	2d697072 	stclcs	0, cr7, [r9, #-456]!	; 0xfffffe38
     810:	65746e69 	ldrbvs	r6, [r4, #-3689]!	; 0xfffff197
     814:	70757272 	rsbsvc	r7, r5, r2, ror r2
     818:	632e7374 			; <UNDEFINED> instruction: 0x632e7374
     81c:	74616400 	strbtvc	r6, [r1], #-1024	; 0xfffffc00
     820:	62615f61 	rsbvs	r5, r1, #388	; 0x184
     824:	5f74726f 	svcpl	0x0074726f
     828:	74636576 	strbtvc	r6, [r3], #-1398	; 0xfffffa8a
     82c:	6d00726f 	sfmvs	f7, 4, [r0, #-444]	; 0xfffffe44
     830:	756f4373 	strbvc	r4, [pc, #-883]!	; 4c5 <CPSR_IRQ_INHIBIT+0x445>
     834:	7265746e 	rsbvc	r7, r5, #1845493760	; 0x6e000000
     838:	51524900 	cmppl	r2, r0, lsl #18
     83c:	6e65705f 	mcrvs	0, 3, r7, cr5, cr15, {2}
     840:	676e6964 	strbvs	r6, [lr, -r4, ror #18]!
     844:	7500325f 	strvc	r3, [r0, #-607]	; 0xfffffda1
     848:	6665646e 	strbtvs	r6, [r5], -lr, ror #8
     84c:	64656e69 	strbtvs	r6, [r5], #-3689	; 0xfffff197
     850:	736e695f 	cmnvc	lr, #1556480	; 0x17c000
     854:	63757274 	cmnvs	r5, #116, 4	; 0x40000007
     858:	6e6f6974 			; <UNDEFINED> instruction: 0x6e6f6974
     85c:	6365765f 	cmnvs	r5, #99614720	; 0x5f00000
     860:	00726f74 	rsbseq	r6, r2, r4, ror pc
     864:	65736572 	ldrbvs	r6, [r3, #-1394]!	; 0xfffffa8e
     868:	65765f74 	ldrbvs	r5, [r6, #-3956]!	; 0xfffff08c
     86c:	726f7463 	rsbvc	r7, pc, #1660944384	; 0x63000000
     870:	666f7300 	strbtvs	r7, [pc], -r0, lsl #6
     874:	72617774 	rsbvc	r7, r1, #116, 14	; 0x1d00000
     878:	6e695f65 	cdpvs	15, 6, cr5, cr9, cr5, {3}
     87c:	72726574 	rsbsvc	r6, r2, #116, 10	; 0x1d000000
     880:	5f747075 	svcpl	0x00747075
     884:	74636576 	strbtvc	r6, [r3], #-1398	; 0xfffffa8a
     888:	4400726f 	strmi	r7, [r0], #-623	; 0xfffffd91
     88c:	62617369 	rsbvs	r7, r1, #-1543503871	; 0xa4000001
     890:	495f656c 	ldmdbmi	pc, {r2, r3, r5, r6, r8, sl, sp, lr}^	; <UNPREDICTABLE>
     894:	5f735152 	svcpl	0x00735152
     898:	69440031 	stmdbvs	r4, {r0, r4, r5}^
     89c:	6c626173 	stfvse	f6, [r2], #-460	; 0xfffffe34
     8a0:	52495f65 	subpl	r5, r9, #404	; 0x194
     8a4:	325f7351 	subscc	r7, pc, #1140850689	; 0x44000001
     8a8:	73616600 	cmnvc	r1, #0, 12
     8ac:	6e695f74 	mcrvs	15, 3, r5, cr9, cr4, {3}
     8b0:	72726574 	rsbsvc	r6, r2, #116, 10	; 0x1d000000
     8b4:	5f747075 	svcpl	0x00747075
     8b8:	74636576 	strbtvc	r6, [r3], #-1398	; 0xfffffa8a
     8bc:	4900726f 	stmdbmi	r0, {r0, r1, r2, r3, r5, r6, r9, ip, sp, lr}
     8c0:	705f5152 	subsvc	r5, pc, r2, asr r1	; <UNPREDICTABLE>
     8c4:	69646e65 	stmdbvs	r4!, {r0, r2, r5, r6, r9, sl, fp, sp, lr}^
     8c8:	315f676e 	cmpcc	pc, lr, ror #14
     8cc:	6d6f6300 	stclvs	3, cr6, [pc, #-0]	; 8d4 <CPSR_IRQ_INHIBIT+0x854>
     8d0:	65726170 	ldrbvs	r6, [r2, #-368]!	; 0xfffffe90
     8d4:	6f630030 	svcvs	0x00630030
     8d8:	7261706d 	rsbvc	r7, r1, #109	; 0x6d
     8dc:	63003165 	movwvs	r3, #357	; 0x165
     8e0:	61706d6f 	cmnvs	r0, pc, ror #26
     8e4:	00326572 	eorseq	r6, r2, r2, ror r5
     8e8:	706d6f63 	rsbvc	r6, sp, r3, ror #30
     8ec:	33657261 	cmncc	r5, #268435462	; 0x10000006
     8f0:	6f682f00 	svcvs	0x00682f00
     8f4:	612f656d 			; <UNDEFINED> instruction: 0x612f656d
     8f8:	6b696462 	blvs	1a59a88 <_heap+0x19d9a84>
     8fc:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
     900:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
     904:	4c794d2f 	ldclmi	13, cr4, [r9], #-188	; 0xffffff44
     908:	6c747469 	cfldrdvs	mvd7, [r4], #-420	; 0xfffffe5c
     90c:	2f534f65 	svccs	0x00534f65
     910:	2f637273 	svccs	0x00637273
     914:	2d697072 	stclcs	0, cr7, [r9, #-456]!	; 0xfffffe38
     918:	74737973 	ldrbtvc	r7, [r3], #-2419	; 0xfffff68d
     91c:	72656d69 	rsbvc	r6, r5, #6720	; 0x1a40
     920:	6300632e 	movwvs	r6, #814	; 0x32e
     924:	746e756f 	strbtvc	r7, [lr], #-1391	; 0xfffffa91
     928:	685f7265 	ldmdavs	pc, {r0, r2, r5, r6, r9, ip, sp, lr}^	; <UNPREDICTABLE>
     92c:	6f630069 	svcvs	0x00630069
     930:	6f72746e 	svcvs	0x0072746e
     934:	74735f6c 	ldrbtvc	r5, [r3], #-3948	; 0xfffff094
     938:	73757461 	cmnvc	r5, #1627389952	; 0x61000000
     93c:	756f6300 	strbvc	r6, [pc, #-768]!	; 644 <CPSR_IRQ_INHIBIT+0x5c4>
     940:	7265746e 	rsbvc	r7, r5, #1845493760	; 0x6e000000
     944:	006f6c5f 	rsbeq	r6, pc, pc, asr ip	; <UNPREDICTABLE>
     948:	5f495052 	svcpl	0x00495052
     94c:	53746547 	cmnpl	r4, #297795584	; 0x11c00000
     950:	65747379 	ldrbvs	r7, [r4, #-889]!	; 0xfffffc87
     954:	6d69546d 	cfstrdvs	mvd5, [r9, #-436]!	; 0xfffffe4c
     958:	52007265 	andpl	r7, r0, #1342177286	; 0x50000006
     95c:	575f4950 			; <UNDEFINED> instruction: 0x575f4950
     960:	4d746961 			; <UNDEFINED> instruction: 0x4d746961
     964:	6f726369 	svcvs	0x00726369
     968:	6f636553 	svcvs	0x00636553
     96c:	0073646e 	rsbseq	r6, r3, lr, ror #8
     970:	5f697072 	svcpl	0x00697072
     974:	5f737973 	svcpl	0x00737973
     978:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0xfffff68c
     97c:	00745f72 	rsbseq	r5, r4, r2, ror pc
     980:	53697072 	cmnpl	r9, #114	; 0x72
     984:	65747379 	ldrbvs	r7, [r4, #-889]!	; 0xfffffc87
     988:	6d69546d 	cfstrdvs	mvd5, [r9, #-436]!	; 0xfffffe4c
     98c:	41007265 	tstmi	r0, r5, ror #4
     990:	4d5f5855 	ldclmi	8, cr5, [pc, #-340]	; 844 <CPSR_IRQ_INHIBIT+0x7c4>
     994:	43535f55 	cmpmi	r3, #340	; 0x154
     998:	43544152 	cmpmi	r4, #-2147483628	; 0x80000014
     99c:	70720048 	rsbsvc	r0, r2, r8, asr #32
     9a0:	61755f69 	cmnvs	r5, r9, ror #30
     9a4:	745f7472 	ldrbvc	r7, [pc], #-1138	; 9ac <CPSR_IRQ_INHIBIT+0x92c>
     9a8:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     9ac:	6e694d5f 	mcrvs	13, 3, r4, cr9, cr15, {2}
     9b0:	72615569 	rsbvc	r5, r1, #440401920	; 0x1a400000
     9b4:	53495f74 	movtpl	r5, #40820	; 0x9f74
     9b8:	626e0052 	rsbvs	r0, lr, #82	; 0x52
     9bc:	73657479 	cmnvc	r5, #2030043136	; 0x79000000
     9c0:	58554100 	ldmdapl	r5, {r8, lr}^
     9c4:	5f554d5f 	svcpl	0x00554d5f
     9c8:	5f52534c 	svcpl	0x0052534c
     9cc:	00474552 	subeq	r4, r7, r2, asr r5
     9d0:	5f585541 	svcpl	0x00585541
     9d4:	42414e45 	submi	r4, r1, #1104	; 0x450
     9d8:	0053454c 	subseq	r4, r3, ip, asr #10
     9dc:	5f495052 	svcpl	0x00495052
     9e0:	74697257 	strbtvc	r7, [r9], #-599	; 0xfffffda9
     9e4:	4d6f5465 	cfstrdmi	mvd5, [pc, #-404]!	; 858 <CPSR_IRQ_INHIBIT+0x7d8>
     9e8:	55696e69 	strbpl	r6, [r9, #-3689]!	; 0xfffff197
     9ec:	00747261 	rsbseq	r7, r4, r1, ror #4
     9f0:	5f495052 	svcpl	0x00495052
     9f4:	696e694d 	stmdbvs	lr!, {r0, r2, r3, r6, r8, fp, sp, lr}^
     9f8:	74726155 	ldrbtvc	r6, [r2], #-341	; 0xfffffeab
     9fc:	74696e49 	strbtvc	r6, [r9], #-3657	; 0xfffff1b7
     a00:	58554100 	ldmdapl	r5, {r8, lr}^
     a04:	5f554d5f 	svcpl	0x00554d5f
     a08:	5f52434d 	svcpl	0x0052434d
     a0c:	00474552 	subeq	r4, r7, r2, asr r5
     a10:	5f585541 	svcpl	0x00585541
     a14:	495f554d 	ldmdbmi	pc, {r0, r2, r3, r6, r8, sl, ip, lr}^	; <UNPREDICTABLE>
     a18:	45525f4f 	ldrbmi	r5, [r2, #-3919]	; 0xfffff0b1
     a1c:	69660047 	stmdbvs	r6!, {r0, r1, r2, r6}^
     a20:	625f6f66 	subsvs	r6, pc, #408	; 0x198
     a24:	65666675 	strbvs	r6, [r6, #-1653]!	; 0xfffff98b
     a28:	682f0072 	stmdavs	pc!, {r1, r4, r5, r6}	; <UNPREDICTABLE>
     a2c:	2f656d6f 	svccs	0x00656d6f
     a30:	69646261 	stmdbvs	r4!, {r0, r5, r6, r9, sp, lr}^
     a34:	6972616b 	ldmdbvs	r2!, {r0, r1, r3, r5, r6, r8, sp, lr}^
     a38:	65642f6d 	strbvs	r2, [r4, #-3949]!	; 0xfffff093
     a3c:	794d2f76 	stmdbvc	sp, {r1, r2, r4, r5, r6, r8, r9, sl, fp, sp}^
     a40:	7474694c 	ldrbtvc	r6, [r4], #-2380	; 0xfffff6b4
     a44:	534f656c 	movtpl	r6, #62828	; 0xf56c
     a48:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
     a4c:	6970722f 	ldmdbvs	r0!, {r0, r1, r2, r3, r5, r9, ip, sp, lr}^
     a50:	7261752d 	rsbvc	r7, r1, #188743680	; 0xb400000
     a54:	00632e74 	rsbeq	r2, r3, r4, ror lr
     a58:	5f585541 	svcpl	0x00585541
     a5c:	425f554d 	subsmi	r5, pc, #322961408	; 0x13400000
     a60:	5f445541 	svcpl	0x00445541
     a64:	00474552 	subeq	r4, r7, r2, asr r5
     a68:	5f585541 	svcpl	0x00585541
     a6c:	4d5f554d 	cfldr64mi	mvdx5, [pc, #-308]	; 940 <CPSR_IRQ_INHIBIT+0x8c0>
     a70:	525f5253 	subspl	r5, pc, #805306373	; 0x30000005
     a74:	74004745 	strvc	r4, [r0], #-1861	; 0xfffff8bb
     a78:	006c6961 	rsbeq	r6, ip, r1, ror #18
     a7c:	5f585541 	svcpl	0x00585541
     a80:	495f554d 	ldmdbmi	pc, {r0, r2, r3, r6, r8, sl, ip, lr}^	; <UNPREDICTABLE>
     a84:	525f5245 	subspl	r5, pc, #1342177284	; 0x50000004
     a88:	72004745 	andvc	r4, r0, #18087936	; 0x1140000
     a8c:	694d6970 	stmdbvs	sp, {r4, r5, r6, r8, fp, sp, lr}^
     a90:	6155696e 	cmpvs	r5, lr, ror #18
     a94:	41007472 	tstmi	r0, r2, ror r4
     a98:	4d5f5855 	ldclmi	8, cr5, [pc, #-340]	; 94c <CPSR_IRQ_INHIBIT+0x8cc>
     a9c:	49495f55 	stmdbmi	r9, {r0, r2, r4, r6, r8, r9, sl, fp, ip, lr}^
     aa0:	45525f52 	ldrbmi	r5, [r2, #-3922]	; 0xfffff0ae
     aa4:	70720047 	rsbsvc	r0, r2, r7, asr #32
     aa8:	78754169 	ldmdavc	r5!, {r0, r3, r5, r6, r8, lr}^
     aac:	58554100 	ldmdapl	r5, {r8, lr}^
     ab0:	5152495f 	cmppl	r2, pc, asr r9
     ab4:	636e6900 	cmnvs	lr, #0, 18
     ab8:	6e696d6f 	cdpvs	13, 6, cr6, cr9, cr15, {3}
     abc:	61645f67 	cmnvs	r4, r7, ror #30
     ac0:	67006174 	smlsdxvs	r0, r4, r1, r6
     ac4:	526f6970 	rsbpl	r6, pc, #112, 18	; 0x1c0000
     ac8:	66006765 	strvs	r6, [r0], -r5, ror #14
     acc:	5f6f6669 	svcpl	0x006f6669
     ad0:	6e690074 	mcrvs	0, 3, r0, cr9, cr4, {3}
     ad4:	696d6f63 	stmdbvs	sp!, {r0, r1, r5, r6, r8, r9, sl, fp, sp, lr}^
     ad8:	625f676e 	subsvs	r6, pc, #28835840	; 0x1b80000
     adc:	00657479 	rsbeq	r7, r5, r9, ror r4
     ae0:	5f495052 	svcpl	0x00495052
     ae4:	64616552 	strbtvs	r6, [r1], #-1362	; 0xfffffaae
     ae8:	6d6f7246 	sfmvs	f7, 2, [pc, #-280]!	; 9d8 <CPSR_IRQ_INHIBIT+0x958>
     aec:	696e694d 	stmdbvs	lr!, {r0, r2, r3, r6, r8, fp, sp, lr}^
     af0:	74726155 	ldrbtvc	r6, [r2], #-341	; 0xfffffeab
     af4:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     af8:	7465475f 	strbtvc	r4, [r5], #-1887	; 0xfffff8a1
     afc:	696e694d 	stmdbvs	lr!, {r0, r2, r3, r6, r8, fp, sp, lr}^
     b00:	74726155 	ldrbtvc	r6, [r2], #-341	; 0xfffffeab
     b04:	58554100 	ldmdapl	r5, {r8, lr}^
     b08:	5f554d5f 	svcpl	0x00554d5f
     b0c:	54415453 	strbpl	r5, [r1], #-1107	; 0xfffffbad
     b10:	4745525f 	smlsldmi	r5, r5, pc, r2	; <UNPREDICTABLE>
     b14:	61656800 	cmnvs	r5, r0, lsl #16
     b18:	55410064 	strbpl	r0, [r1, #-100]	; 0xffffff9c
     b1c:	554d5f58 	strbpl	r5, [sp, #-3928]	; 0xfffff0a8
     b20:	52434c5f 	subpl	r4, r3, #24320	; 0x5f00
     b24:	4745525f 	smlsldmi	r5, r5, pc, r2	; <UNPREDICTABLE>
     b28:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     b2c:	7465475f 	strbtvc	r4, [r5], #-1887	; 0xfffff8a1
     b30:	00787541 	rsbseq	r7, r8, r1, asr #10
     b34:	5f697072 	svcpl	0x00697072
     b38:	5f787561 	svcpl	0x00787561
     b3c:	50520074 	subspl	r0, r2, r4, ror r0
     b40:	72705f49 	rsbsvc	r5, r0, #292	; 0x124
     b44:	53746e69 	cmnpl	r4, #1680	; 0x690
     b48:	6e697274 	mcrvs	2, 3, r7, cr9, cr4, {3}
     b4c:	4c664f67 	stclmi	15, cr4, [r6], #-412	; 0xfffffe64
     b50:	41006e65 	tstmi	r0, r5, ror #28
     b54:	4d5f5855 	ldclmi	8, cr5, [pc, #-340]	; a08 <CPSR_IRQ_INHIBIT+0x988>
     b58:	4e435f55 	mcrmi	15, 2, r5, cr3, cr5, {2}
     b5c:	525f4c54 	subspl	r4, pc, #84, 24	; 0x5400
     b60:	52004745 	andpl	r4, r0, #18087936	; 0x1140000
     b64:	705f4950 	subsvc	r4, pc, r0, asr r9	; <UNPREDICTABLE>
     b68:	746e6972 	strbtvc	r6, [lr], #-2418	; 0xfffff68e
     b6c:	69727453 	ldmdbvs	r2!, {r0, r1, r4, r6, sl, ip, sp, lr}^
     b70:	5f00676e 	svcpl	0x0000676e
     b74:	5f6f7364 	svcpl	0x006f7364
     b78:	646e6168 	strbtvs	r6, [lr], #-360	; 0xfffffe98
     b7c:	5f00656c 	svcpl	0x0000656c
     b80:	657a6973 	ldrbvs	r6, [sl, #-2419]!	; 0xfffff68d
     b84:	6d6f6300 	stclvs	3, cr6, [pc, #-0]	; b8c <CPSR_IRQ_INHIBIT+0xb0c>
     b88:	646e616d 	strbtvs	r6, [lr], #-365	; 0xfffffe93
     b8c:	746f6e5f 	strbtvc	r6, [pc], #-3679	; b94 <CPSR_IRQ_INHIBIT+0xb14>
     b90:	756f665f 	strbvc	r6, [pc, #-1631]!	; 539 <CPSR_IRQ_INHIBIT+0x4b9>
     b94:	745f646e 	ldrbvc	r6, [pc], #-1134	; b9c <CPSR_IRQ_INHIBIT+0xb1c>
     b98:	00747865 	rsbseq	r7, r4, r5, ror #16
     b9c:	6e61725f 	mcrvs	2, 3, r7, cr1, cr15, {2}
     ba0:	00383464 	eorseq	r3, r8, r4, ror #8
     ba4:	656d655f 	strbvs	r6, [sp, #-1375]!	; 0xfffffaa1
     ba8:	6e656772 	mcrvs	7, 3, r6, cr5, cr2, {3}
     bac:	5f007963 	svcpl	0x00007963
     bb0:	74726377 	ldrbtvc	r6, [r2], #-887	; 0xfffffc89
     bb4:	5f626d6f 	svcpl	0x00626d6f
     bb8:	74617473 	strbtvc	r7, [r1], #-1139	; 0xfffffb8d
     bbc:	775f0065 	ldrbvc	r0, [pc, -r5, rrx]
     bc0:	74727363 	ldrbtvc	r7, [r2], #-867	; 0xfffffc9d
     bc4:	73626d6f 	cmnvc	r2, #7104	; 0x1bc0
     bc8:	6174735f 	cmnvs	r4, pc, asr r3
     bcc:	2f006574 	svccs	0x00006574
     bd0:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
     bd4:	6462612f 	strbtvs	r6, [r2], #-303	; 0xfffffed1
     bd8:	72616b69 	rsbvc	r6, r1, #107520	; 0x1a400
     bdc:	642f6d69 	strtvs	r6, [pc], #-3433	; be4 <CPSR_IRQ_INHIBIT+0xb64>
     be0:	4d2f7665 	stcmi	6, cr7, [pc, #-404]!	; a54 <CPSR_IRQ_INHIBIT+0x9d4>
     be4:	74694c79 	strbtvc	r4, [r9], #-3193	; 0xfffff387
     be8:	4f656c74 	svcmi	0x00656c74
     bec:	72732f53 	rsbsvc	r2, r3, #332	; 0x14c
     bf0:	68732f63 	ldmdavs	r3!, {r0, r1, r5, r6, r8, r9, sl, fp, sp}^
     bf4:	2e6c6c65 	cdpcs	12, 6, cr6, cr12, cr5, {3}
     bf8:	6c5f0063 	mrrcvs	0, 6, r0, pc, cr3	; <UNPREDICTABLE>
     bfc:	69736662 	ldmdbvs	r3!, {r1, r5, r6, r9, sl, sp, lr}^
     c00:	5f00657a 	svcpl	0x0000657a
     c04:	7472626d 	ldrbtvc	r6, [r2], #-621	; 0xfffffd93
     c08:	5f63776f 	svcpl	0x0063776f
     c0c:	74617473 	strbtvc	r7, [r1], #-1139	; 0xfffffb8d
     c10:	775f0065 	ldrbvc	r0, [pc, -r5, rrx]
     c14:	6d6f7463 	cfstrdvs	mvd7, [pc, #-396]!	; a90 <CPSR_IRQ_INHIBIT+0xa10>
     c18:	74735f62 	ldrbtvc	r5, [r3], #-3938	; 0xfffff09e
     c1c:	00657461 	rsbeq	r7, r5, r1, ror #8
     c20:	6d745f5f 	ldclvs	15, cr5, [r4, #-380]!	; 0xfffffe84
     c24:	6365735f 	cmnvs	r5, #2080374785	; 0x7c000001
     c28:	62755f00 	rsbsvs	r5, r5, #0, 30
     c2c:	5f006675 	svcpl	0x00006675
     c30:	5f6d745f 	svcpl	0x006d745f
     c34:	72756f68 	rsbsvc	r6, r5, #104, 30	; 0x1a0
     c38:	735f5f00 	cmpvc	pc, #0, 30
     c3c:	6f5f0066 	svcvs	0x005f0066
     c40:	78655f6e 	stmdavc	r5!, {r1, r2, r3, r5, r6, r8, r9, sl, fp, ip, lr}^
     c44:	615f7469 	cmpvs	pc, r9, ror #8
     c48:	00736772 	rsbseq	r6, r3, r2, ror r7
     c4c:	6f6f635f 	svcvs	0x006f635f
     c50:	0065696b 	rsbeq	r6, r5, fp, ror #18
     c54:	67735f5f 			; <UNDEFINED> instruction: 0x67735f5f
     c58:	0065756c 	rsbeq	r7, r5, ip, ror #10
     c5c:	616c665f 	cmnvs	ip, pc, asr r6
     c60:	5f007367 	svcpl	0x00007367
     c64:	635f7369 	cmpvs	pc, #-1543503871	; 0xa4000001
     c68:	5f006178 	svcpl	0x00006178
     c6c:	69647473 	stmdbvs	r4!, {r0, r1, r4, r5, r6, sl, ip, sp, lr}^
     c70:	625f006e 	subsvs	r0, pc, #110	; 0x6e
     c74:	69736b6c 	ldmdbvs	r3!, {r2, r3, r5, r6, r8, r9, fp, sp, lr}^
     c78:	5f00657a 	svcpl	0x0000657a
     c7c:	62747663 	rsbsvs	r7, r4, #103809024	; 0x6300000
     c80:	5f006675 	svcpl	0x00006675
     c84:	7366666f 	cmnvc	r6, #116391936	; 0x6f00000
     c88:	5f007465 	svcpl	0x00007465
     c8c:	7273626d 	rsbsvc	r6, r3, #-805306362	; 0xd0000006
     c90:	63776f74 	cmnvs	r7, #116, 30	; 0x1d0
     c94:	74735f73 	ldrbtvc	r5, [r3], #-3955	; 0xfffff08d
     c98:	00657461 	rsbeq	r7, r5, r1, ror #8
     c9c:	72626d5f 	rsbvc	r6, r2, #6080	; 0x17c0
     ca0:	5f6e656c 	svcpl	0x006e656c
     ca4:	74617473 	strbtvc	r7, [r1], #-1139	; 0xfffffb8d
     ca8:	665f0065 	ldrbvs	r0, [pc], -r5, rrx
     cac:	6772616e 	ldrbvs	r6, [r2, -lr, ror #2]!
     cb0:	665f0073 			; <UNDEFINED> instruction: 0x665f0073
     cb4:	5f00736e 	svcpl	0x0000736e
     cb8:	6e676973 			; <UNDEFINED> instruction: 0x6e676973
     cbc:	6c665f00 	stclvs	15, cr5, [r6], #-0
     cc0:	5f6b636f 	svcpl	0x006b636f
     cc4:	735f0074 	cmpvc	pc, #116	; 0x74
     cc8:	72656474 	rsbvc	r6, r5, #116, 8	; 0x74000000
     ccc:	425f0072 	subsmi	r0, pc, #114	; 0x72
     cd0:	6e696769 	cdpvs	7, 6, cr6, cr9, cr9, {3}
     cd4:	675f0074 			; <UNDEFINED> instruction: 0x675f0074
     cd8:	616d6d61 	cmnvs	sp, r1, ror #26
     cdc:	6769735f 			; <UNDEFINED> instruction: 0x6769735f
     ce0:	6d61676e 	stclvs	7, cr6, [r1, #-440]!	; 0xfffffe48
     ce4:	65725f00 	ldrbvs	r5, [r2, #-3840]!	; 0xfffff100
     ce8:	746c7573 	strbtvc	r7, [ip], #-1395	; 0xfffffa8d
     cec:	5f006b5f 	svcpl	0x00006b5f
     cf0:	006d745f 	rsbeq	r7, sp, pc, asr r4
     cf4:	63775f5f 	cmnvs	r7, #380	; 0x17c
     cf8:	5f006268 	svcpl	0x00006268
     cfc:	6f647473 	svcvs	0x00647473
     d00:	5f007475 	svcpl	0x00007475
     d04:	6c747663 	ldclvs	6, cr7, [r4], #-396	; 0xfffffe74
     d08:	5f006e65 	svcpl	0x00006e65
     d0c:	656c6966 	strbvs	r6, [ip, #-2406]!	; 0xfffff69a
     d10:	696e5f00 	stmdbvs	lr!, {r8, r9, sl, fp, ip, lr}^
     d14:	0073626f 	rsbseq	r6, r3, pc, ror #4
     d18:	6574615f 	ldrbvs	r6, [r4, #-351]!	; 0xfffffea1
     d1c:	30746978 	rsbscc	r6, r4, r8, ror r9
     d20:	69735f00 	ldmdbvs	r3!, {r8, r9, sl, fp, ip, lr}^
     d24:	6c616e67 	stclvs	14, cr6, [r1], #-412	; 0xfffffe64
     d28:	6675625f 			; <UNDEFINED> instruction: 0x6675625f
     d2c:	73615f00 	cmnvc	r1, #0, 30
     d30:	6d697463 	cfstrdvs	mvd7, [r9, #-396]!	; 0xfffffe74
     d34:	75625f65 	strbvc	r5, [r2, #-3941]!	; 0xfffff09b
     d38:	725f0066 	subsvc	r0, pc, #102	; 0x66
     d3c:	6c757365 	ldclvs	3, cr7, [r5], #-404	; 0xfffffe6c
     d40:	5f5f0074 	svcpl	0x005f0074
     d44:	00686377 	rsbeq	r6, r8, r7, ror r3
     d48:	746e6977 	strbtvc	r6, [lr], #-2423	; 0xfffff689
     d4c:	5f00745f 	svcpl	0x0000745f
     d50:	6b636f6c 	blvs	18dcb08 <_heap+0x185cb04>
     d54:	6c665f00 	stclvs	15, cr5, [r6], #-0
     d58:	32736761 	rsbscc	r6, r3, #25427968	; 0x1840000
     d5c:	745f5f00 	ldrbvc	r5, [pc], #-3840	; d64 <CPSR_IRQ_INHIBIT+0xce4>
     d60:	65795f6d 	ldrbvs	r5, [r9, #-3949]!	; 0xfffff093
     d64:	5f007261 	svcpl	0x00007261
     d68:	6c616d6e 	stclvs	13, cr6, [r1], #-440	; 0xfffffe48
     d6c:	00636f6c 	rsbeq	r6, r3, ip, ror #30
     d70:	676e6f6c 	strbvs	r6, [lr, -ip, ror #30]!
     d74:	756f6420 	strbvc	r6, [pc, #-1056]!	; 95c <CPSR_IRQ_INHIBIT+0x8dc>
     d78:	00656c62 	rsbeq	r6, r5, r2, ror #24
     d7c:	78656e5f 	stmdavc	r5!, {r0, r1, r2, r3, r4, r6, r9, sl, fp, sp, lr}^
     d80:	5f006674 	svcpl	0x00006674
     d84:	5f6d745f 	svcpl	0x006d745f
     d88:	006e6f6d 	rsbeq	r6, lr, sp, ror #30
     d8c:	6574615f 	ldrbvs	r6, [r4, #-351]!	; 0xfffffea1
     d90:	00746978 	rsbseq	r6, r4, r8, ror r9
     d94:	6f627573 	svcvs	0x00627573
     d98:	72617470 	rsbvc	r7, r1, #112, 8	; 0x70000000
     d9c:	5f5f0067 	svcpl	0x005f0067
     da0:	64696473 	strbtvs	r6, [r9], #-1139	; 0xfffffb8d
     da4:	74696e69 	strbtvc	r6, [r9], #-3689	; 0xfffff197
     da8:	666f5f00 	strbtvs	r5, [pc], -r0, lsl #30
     dac:	00745f66 	rsbseq	r5, r4, r6, ror #30
     db0:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; cfc <CPSR_IRQ_INHIBIT+0xc7c>
     db4:	62612f65 	rsbvs	r2, r1, #404	; 0x194
     db8:	616b6964 	cmnvs	fp, r4, ror #18
     dbc:	2f6d6972 	svccs	0x006d6972
     dc0:	2f766564 	svccs	0x00766564
     dc4:	694c794d 	stmdbvs	ip, {r0, r2, r3, r6, r8, fp, ip, sp, lr}^
     dc8:	656c7474 	strbvs	r7, [ip, #-1140]!	; 0xfffffb8c
     dcc:	5f00534f 	svcpl	0x0000534f
     dd0:	65657266 	strbvs	r7, [r5, #-614]!	; 0xfffffd9a
     dd4:	7473696c 	ldrbtvc	r6, [r3], #-2412	; 0xfffff694
     dd8:	4f4c5f00 	svcmi	0x004c5f00
     ddc:	525f4b43 	subspl	r4, pc, #68608	; 0x10c00
     de0:	52554345 	subspl	r4, r5, #335544321	; 0x14000001
     de4:	45564953 	ldrbmi	r4, [r6, #-2387]	; 0xfffff6ad
     de8:	5f00545f 	svcpl	0x0000545f
     dec:	0077656e 	rsbseq	r6, r7, lr, ror #10
     df0:	655f685f 	ldrbvs	r6, [pc, #-2143]	; 599 <CPSR_IRQ_INHIBIT+0x519>
     df4:	6f6e7272 	svcvs	0x006e7272
     df8:	745f5f00 	ldrbvc	r5, [pc], #-3840	; e00 <CPSR_IRQ_INHIBIT+0xd80>
     dfc:	64795f6d 	ldrbtvs	r5, [r9], #-3949	; 0xfffff093
     e00:	5f007961 	svcpl	0x00007961
     e04:	7562735f 	strbvc	r7, [r2, #-863]!	; 0xfffffca1
     e08:	695f0066 	ldmdbvs	pc, {r1, r2, r5, r6}^	; <UNPREDICTABLE>
     e0c:	0073626f 	rsbseq	r6, r3, pc, ror #4
     e10:	49465f5f 	stmdbmi	r6, {r0, r1, r2, r3, r4, r6, r8, r9, sl, fp, ip, lr}^
     e14:	5f00454c 	svcpl	0x0000454c
     e18:	7473626d 	ldrbtvc	r6, [r3], #-621	; 0xfffffd93
     e1c:	5f657461 	svcpl	0x00657461
     e20:	5f5f0074 	svcpl	0x005f0074
     e24:	4c494673 	mcrrmi	6, 7, r4, r9, cr3
     e28:	6d5f0045 	ldclvs	0, cr0, [pc, #-276]	; d1c <CPSR_IRQ_INHIBIT+0xc9c>
     e2c:	61747362 	cmnvs	r4, r2, ror #6
     e30:	5f006574 	svcpl	0x00006574
     e34:	646e6172 	strbtvs	r6, [lr], #-370	; 0xfffffe8e
     e38:	78656e5f 	stmdavc	r5!, {r0, r1, r2, r3, r4, r6, r9, sl, fp, sp, lr}^
     e3c:	6d5f0074 	ldclvs	0, cr0, [pc, #-464]	; c74 <CPSR_IRQ_INHIBIT+0xbf4>
     e40:	6e656c62 	cdpvs	12, 6, cr6, cr5, cr2, {3}
     e44:	6174735f 	cmnvs	r4, pc, asr r3
     e48:	5f006574 	svcpl	0x00006574
     e4c:	00636e69 	rsbeq	r6, r3, r9, ror #28
     e50:	646e695f 	strbtvs	r6, [lr], #-2399	; 0xfffff6a1
     e54:	75635f00 	strbvc	r5, [r3, #-3840]!	; 0xfffff100
     e58:	6e657272 	mcrvs	2, 3, r7, cr5, cr2, {3}
     e5c:	6f6c5f74 	svcvs	0x006c5f74
     e60:	656c6163 	strbvs	r6, [ip, #-355]!	; 0xfffffe9d
     e64:	706e6900 	rsbvc	r6, lr, r0, lsl #18
     e68:	5f007475 	svcpl	0x00007475
     e6c:	656c635f 	strbvs	r6, [ip, #-863]!	; 0xfffffca1
     e70:	70756e61 	rsbsvc	r6, r5, r1, ror #28
     e74:	616d5f00 	cmnvs	sp, r0, lsl #30
     e78:	73647778 	cmnvc	r4, #120, 14	; 0x1e00000
     e7c:	65725f00 	ldrbvs	r5, [r2, #-3840]!	; 0xfffff100
     e80:	00746e65 	rsbseq	r6, r4, r5, ror #28
     e84:	6565735f 	strbvs	r7, [r5, #-863]!	; 0xfffffca1
     e88:	5f5f0064 	svcpl	0x005f0064
     e8c:	6e756f63 	cdpvs	15, 7, cr6, cr5, cr3, {3}
     e90:	5f5f0074 	svcpl	0x005f0074
     e94:	756c6176 	strbvc	r6, [ip, #-374]!	; 0xfffffe8a
     e98:	735f0065 	cmpvc	pc, #101	; 0x65
     e9c:	006b6565 	rsbeq	r6, fp, r5, ror #10
     ea0:	6f70665f 	svcvs	0x0070665f
     ea4:	00745f73 	rsbseq	r5, r4, r3, ror pc
     ea8:	6d745f5f 	ldclvs	15, cr5, [r4, #-380]!	; 0xfffffe84
     eac:	6e696d5f 	mcrvs	13, 3, r6, cr9, cr15, {2}
     eb0:	756d5f00 	strbvc	r5, [sp, #-3840]!	; 0xfffff100
     eb4:	6500746c 	strvs	r7, [r0, #-1132]	; 0xfffffb94
     eb8:	7265746e 	rsbvc	r7, r5, #1845493760	; 0x6e000000
     ebc:	6d6f635f 	stclvs	3, cr6, [pc, #-380]!	; d48 <CPSR_IRQ_INHIBIT+0xcc8>
     ec0:	646e616d 	strbtvs	r6, [lr], #-365	; 0xfffffe93
     ec4:	7865745f 	stmdavc	r5!, {r0, r1, r2, r3, r4, r6, sl, ip, sp, lr}^
     ec8:	735f0074 	cmpvc	pc, #116	; 0x74
     ecc:	6f747274 	svcvs	0x00747274
     ed0:	616c5f6b 	cmnvs	ip, fp, ror #30
     ed4:	5f007473 	svcpl	0x00007473
     ed8:	79746e66 	ldmdbvc	r4!, {r1, r2, r5, r6, r9, sl, fp, sp, lr}^
     edc:	00736570 	rsbseq	r6, r3, r0, ror r5
     ee0:	6464615f 	strbtvs	r6, [r4], #-351	; 0xfffffea1
     ee4:	555f5f00 	ldrbpl	r5, [pc, #-3840]	; ffffffec <CPSR_UNAFFECTED_BITS+0xec>
     ee8:	676e6f4c 	strbvs	r6, [lr, -ip, asr #30]!
     eec:	65675f00 	strbvs	r5, [r7, #-3840]!	; 0xfffff100
     ef0:	74616474 	strbtvc	r6, [r1], #-1140	; 0xfffffb8c
     ef4:	72655f65 	rsbvc	r5, r5, #404	; 0x194
     ef8:	675f0072 			; <UNDEFINED> instruction: 0x675f0072
     efc:	61626f6c 	cmnvs	r2, ip, ror #30
     f00:	6d695f6c 	stclvs	15, cr5, [r9, #-432]!	; 0xfffffe50
     f04:	65727570 	ldrbvs	r7, [r2, #-1392]!	; 0xfffffa90
     f08:	7274705f 	rsbsvc	r7, r4, #95	; 0x5f
     f0c:	75635f00 	strbvc	r5, [r3, #-3840]!	; 0xfffff100
     f10:	6e657272 	mcrvs	2, 3, r7, cr5, cr2, {3}
     f14:	61635f74 	smcvs	13812	; 0x35f4
     f18:	6f676574 	svcvs	0x00676574
     f1c:	5f007972 	svcpl	0x00007972
     f20:	73756e75 	cmnvc	r5, #1872	; 0x750
     f24:	725f6465 	subsvc	r6, pc, #1694498816	; 0x65000000
     f28:	00646e61 	rsbeq	r6, r4, r1, ror #28
     f2c:	7364775f 	cmnvc	r4, #24903680	; 0x17c0000
     f30:	745f5f00 	ldrbvc	r5, [pc], #-3840	; f38 <CPSR_IRQ_INHIBIT+0xeb8>
     f34:	64775f6d 	ldrbtvs	r5, [r7], #-3949	; 0xfffff093
     f38:	5f007961 	svcpl	0x00007961
     f3c:	65756c67 	ldrbvs	r6, [r5, #-3175]!	; 0xfffff399
     f40:	61625f00 	cmnvs	r2, r0, lsl #30
     f44:	5f006573 	svcpl	0x00006573
     f48:	6134366c 	teqvs	r4, ip, ror #12
     f4c:	6675625f 			; <UNDEFINED> instruction: 0x6675625f
     f50:	69735f00 	ldmdbvs	r3!, {r8, r9, sl, fp, ip, lr}^
     f54:	75665f67 	strbvc	r5, [r6, #-3943]!	; 0xfffff099
     f58:	5f00636e 	svcpl	0x0000636e
     f5c:	6675626e 	ldrbtvs	r6, [r5], -lr, ror #4
     f60:	6e755f00 	cdpvs	15, 7, cr5, cr5, cr0, {0}
     f64:	64657375 	strbtvs	r7, [r5], #-885	; 0xfffffc8b
     f68:	745f5f00 	ldrbvc	r5, [pc], #-3840	; f70 <CPSR_IRQ_INHIBIT+0xef0>
     f6c:	73695f6d 	cmnvc	r9, #436	; 0x1b4
     f70:	00747364 	rsbseq	r7, r4, r4, ror #6
     f74:	636f6c5f 	cmnvs	pc, #24320	; 0x5f00
     f78:	69746c61 	ldmdbvs	r4!, {r0, r5, r6, sl, fp, sp, lr}^
     f7c:	625f656d 	subsvs	r6, pc, #457179136	; 0x1b400000
     f80:	5f006675 	svcpl	0x00006675
     f84:	736f6c63 	cmnvc	pc, #25344	; 0x6300
     f88:	725f0065 	subsvc	r0, pc, #101	; 0x65
     f8c:	5f003834 	svcpl	0x00003834
     f90:	6f74626d 	svcvs	0x0074626d
     f94:	735f6377 	cmpvc	pc, #-603979775	; 0xdc000001
     f98:	65746174 	ldrbvs	r6, [r4, #-372]!	; 0xfffffe8c
     f9c:	35705f00 	ldrbcc	r5, [r0, #-3840]!	; 0xfffff100
     fa0:	5f5f0073 	svcpl	0x005f0073
     fa4:	6d5f6d74 	ldclvs	13, cr6, [pc, #-464]	; ddc <CPSR_IRQ_INHIBIT+0xd5c>
     fa8:	00796164 	rsbseq	r6, r9, r4, ror #2
     fac:	6c656873 	stclvs	8, cr6, [r5], #-460	; 0xfffffe34
     fb0:	616d5f6c 	cmnvs	sp, ip, ror #30
     fb4:	53006e69 	movwpl	r6, #3689	; 0xe69
     fb8:	485f4356 	ldmdami	pc, {r1, r2, r4, r6, r8, r9, lr}^	; <UNPREDICTABLE>
     fbc:	6c646e61 	stclvs	14, cr6, [r4], #-388	; 0xfffffe7c
     fc0:	4d5f7265 	lfmmi	f7, 2, [pc, #-404]	; e34 <CPSR_IRQ_INHIBIT+0xdb4>
     fc4:	006e6961 	rsbeq	r6, lr, r1, ror #18
     fc8:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; f14 <CPSR_IRQ_INHIBIT+0xe94>
     fcc:	62612f65 	rsbvs	r2, r1, #404	; 0x194
     fd0:	616b6964 	cmnvs	fp, r4, ror #18
     fd4:	2f6d6972 	svccs	0x006d6972
     fd8:	2f766564 	svccs	0x00766564
     fdc:	694c794d 	stmdbvs	ip, {r0, r2, r3, r6, r8, fp, ip, sp, lr}^
     fe0:	656c7474 	strbvs	r7, [ip, #-1140]!	; 0xfffffb8c
     fe4:	732f534f 			; <UNDEFINED> instruction: 0x732f534f
     fe8:	732f6372 			; <UNDEFINED> instruction: 0x732f6372
     fec:	632e6376 			; <UNDEFINED> instruction: 0x632e6376
     ff0:	6d756e00 	ldclvs	14, cr6, [r5, #-0]
     ff4:	00726562 	rsbseq	r6, r2, r2, ror #10
     ff8:	5f637673 	svcpl	0x00637673
     ffc:	73677261 	cmnvc	r7, #268435462	; 0x10000006
    1000:	6c617600 	stclvs	6, cr7, [r1], #-0
    1004:	695f6575 	ldmdbvs	pc, {r0, r2, r4, r5, r6, r8, sl, sp, lr}^	; <UNPREDICTABLE>
    1008:	65725f6e 	ldrbvs	r5, [r2, #-3950]!	; 0xfffff092
    100c:	00305f67 	eorseq	r5, r0, r7, ror #30
    1010:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; f5c <CPSR_IRQ_INHIBIT+0xedc>
    1014:	62612f65 	rsbvs	r2, r1, #404	; 0x194
    1018:	616b6964 	cmnvs	fp, r4, ror #18
    101c:	2f6d6972 	svccs	0x006d6972
    1020:	2f766564 	svccs	0x00766564
    1024:	694c794d 	stmdbvs	ip, {r0, r2, r3, r6, r8, fp, ip, sp, lr}^
    1028:	656c7474 	strbvs	r7, [ip, #-1140]!	; 0xfffffb8c
    102c:	6c2f534f 	stcvs	3, cr5, [pc], #-316	; ef8 <CPSR_IRQ_INHIBIT+0xe78>
    1030:	662f6269 	strtvs	r6, [pc], -r9, ror #4
    1034:	2e6f6669 	cdpcs	6, 6, cr6, cr15, cr9, {3}
    1038:	69660063 	stmdbvs	r6!, {r0, r1, r5, r6}^
    103c:	775f6f66 	ldrbvc	r6, [pc, -r6, ror #30]
    1040:	65746972 	ldrbvs	r6, [r4, #-2418]!	; 0xfffff68e
    1044:	66696600 	strbtvs	r6, [r9], -r0, lsl #12
    1048:	6e695f6f 	cdpvs	15, 6, cr5, cr9, cr15, {3}
    104c:	66007469 	strvs	r7, [r0], -r9, ror #8
    1050:	5f6f6669 	svcpl	0x006f6669
    1054:	64616572 	strbtvs	r6, [r1], #-1394	; 0xfffffa8e
    1058:	6f747300 	svcvs	0x00747300
    105c:	65676172 	strbvs	r6, [r7, #-370]!	; 0xfffffe8e
	...

Disassembly of section .ARM.attributes:

00000000 <.ARM.attributes>:
   0:	00003041 	andeq	r3, r0, r1, asr #32
   4:	61656100 	cmnvs	r5, r0, lsl #2
   8:	01006962 	tsteq	r0, r2, ror #18
   c:	00000026 	andeq	r0, r0, r6, lsr #32
  10:	4b5a3605 	blmi	168d82c <_heap+0x160d828>
  14:	08070600 	stmdaeq	r7, {r9, sl}
  18:	0a010901 	beq	42424 <__bss_end__+0x39618>
  1c:	14041202 	strne	r1, [r4], #-514	; 0xfffffdfe
  20:	17011501 	strne	r1, [r1, -r1, lsl #10]
  24:	1a011803 	bne	46038 <__bss_end__+0x3d22c>
  28:	1e011c01 	cdpne	12, 0, cr1, cr1, cr1, {0}
  2c:	44012206 	strmi	r2, [r1], #-518	; 0xfffffdfa
  30:	Address 0x0000000000000030 is out of bounds.

