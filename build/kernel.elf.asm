
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
    8024:	000088bc 			; <UNDEFINED> instruction: 0x000088bc

00008028 <_software_interrupt_vector_h>:
    8028:	00009340 	andeq	r9, r0, r0, asr #6

0000802c <_prefetch_abort_vector_h>:
    802c:	00008924 	andeq	r8, r0, r4, lsr #18

00008030 <_data_abort_vector_h>:
    8030:	0000895c 	andeq	r8, r0, ip, asr r9

00008034 <_unused_handler_h>:
    8034:	00008040 	andeq	r8, r0, r0, asr #32

00008038 <_interrupt_vector_h>:
    8038:	00008994 	muleq	r0, r4, r9

0000803c <_fast_interrupt_vector_h>:
    803c:	00008a98 	muleq	r0, r8, sl

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
    8064:	e3a000d3 	mov	r0, #211	; 0xd3
    8068:	e121f000 	msr	CPSR_c, r0
    806c:	e3a0d902 	mov	sp, #32768	; 0x8000
    8070:	ea000007 	b	8094 <_cstartup>

00008074 <_inf_loop>:
    8074:	eafffffe 	b	8074 <_inf_loop>

00008078 <_enable_interrupts>:
    8078:	e10f0000 	mrs	r0, CPSR
    807c:	e3c00080 	bic	r0, r0, #128	; 0x80
    8080:	e121f000 	msr	CPSR_c, r0
    8084:	e1a0f00e 	mov	pc, lr

00008088 <_start_user_program>:
    8088:	e3a0e010 	mov	lr, #16
    808c:	e161f00e 	msr	SPSR_c, lr
    8090:	e1b0f000 	movs	pc, r0

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
    80f0:	eb00005e 	bl	8270 <kernel_main>
    80f4:	eafffffe 	b	80f4 <_cstartup+0x60>
    80f8:	0000945e 	andeq	r9, r0, lr, asr r4
    80fc:	00009514 	andeq	r9, r0, r4, lsl r5

00008100 <dummy_a>:
    8100:	e92d4800 	push	{fp, lr}
    8104:	e28db004 	add	fp, sp, #4
    8108:	e3a00061 	mov	r0, #97	; 0x61
    810c:	eb000453 	bl	9260 <printChar>
    8110:	eafffffc 	b	8108 <dummy_a+0x8>

00008114 <dummy_process_one>:
    8114:	e92d4800 	push	{fp, lr}
    8118:	e28db004 	add	fp, sp, #4
    811c:	e24dd038 	sub	sp, sp, #56	; 0x38
    8120:	e59f3088 	ldr	r3, [pc, #136]	; 81b0 <dummy_process_one+0x9c>
    8124:	e24bc01c 	sub	ip, fp, #28
    8128:	e1a0e003 	mov	lr, r3
    812c:	e8be000f 	ldm	lr!, {r0, r1, r2, r3}
    8130:	e8ac000f 	stmia	ip!, {r0, r1, r2, r3}
    8134:	e89e0003 	ldm	lr, {r0, r1}
    8138:	e88c0003 	stm	ip, {r0, r1}
    813c:	e59f3070 	ldr	r3, [pc, #112]	; 81b4 <dummy_process_one+0xa0>
    8140:	e24bc030 	sub	ip, fp, #48	; 0x30
    8144:	e1a0e003 	mov	lr, r3
    8148:	e8be000f 	ldm	lr!, {r0, r1, r2, r3}
    814c:	e8ac000f 	stmia	ip!, {r0, r1, r2, r3}
    8150:	e59e3000 	ldr	r3, [lr]
    8154:	e1cc30b0 	strh	r3, [ip]
    8158:	e59f2058 	ldr	r2, [pc, #88]	; 81b8 <dummy_process_one+0xa4>
    815c:	e24b3038 	sub	r3, fp, #56	; 0x38
    8160:	e8920003 	ldm	r2, {r0, r1}
    8164:	e5830000 	str	r0, [r3]
    8168:	e2833004 	add	r3, r3, #4
    816c:	e1c310b0 	strh	r1, [r3]
    8170:	e2833002 	add	r3, r3, #2
    8174:	e1a02821 	lsr	r2, r1, #16
    8178:	e5c32000 	strb	r2, [r3]
    817c:	e24b301c 	sub	r3, fp, #28
    8180:	e1a00003 	mov	r0, r3
    8184:	eb00043f 	bl	9288 <printString>
    8188:	ef000001 	svc	0x00000001
    818c:	e24b3038 	sub	r3, fp, #56	; 0x38
    8190:	e1a00003 	mov	r0, r3
    8194:	eb00043b 	bl	9288 <printString>
    8198:	ef000001 	svc	0x00000001
    819c:	e24b3030 	sub	r3, fp, #48	; 0x30
    81a0:	e1a00003 	mov	r0, r3
    81a4:	eb000437 	bl	9288 <printString>
    81a8:	ef000001 	svc	0x00000001
    81ac:	eafffffd 	b	81a8 <dummy_process_one+0x94>
    81b0:	00009360 	andeq	r9, r0, r0, ror #6
    81b4:	00009378 	andeq	r9, r0, r8, ror r3
    81b8:	0000938c 	andeq	r9, r0, ip, lsl #7

000081bc <dummy_process_two>:
    81bc:	e92d4800 	push	{fp, lr}
    81c0:	e28db004 	add	fp, sp, #4
    81c4:	e24dd038 	sub	sp, sp, #56	; 0x38
    81c8:	e59f3078 	ldr	r3, [pc, #120]	; 8248 <dummy_process_two+0x8c>
    81cc:	e24bc014 	sub	ip, fp, #20
    81d0:	e893000f 	ldm	r3, {r0, r1, r2, r3}
    81d4:	e8ac0007 	stmia	ip!, {r0, r1, r2}
    81d8:	e5cc3000 	strb	r3, [ip]
    81dc:	e59f3068 	ldr	r3, [pc, #104]	; 824c <dummy_process_two+0x90>
    81e0:	e24bc024 	sub	ip, fp, #36	; 0x24
    81e4:	e893000f 	ldm	r3, {r0, r1, r2, r3}
    81e8:	e8ac0007 	stmia	ip!, {r0, r1, r2}
    81ec:	e5cc3000 	strb	r3, [ip]
    81f0:	e59f3058 	ldr	r3, [pc, #88]	; 8250 <dummy_process_two+0x94>
    81f4:	e24bc03c 	sub	ip, fp, #60	; 0x3c
    81f8:	e1a0e003 	mov	lr, r3
    81fc:	e8be000f 	ldm	lr!, {r0, r1, r2, r3}
    8200:	e8ac000f 	stmia	ip!, {r0, r1, r2, r3}
    8204:	e89e0003 	ldm	lr, {r0, r1}
    8208:	e58c0000 	str	r0, [ip]
    820c:	e28cc004 	add	ip, ip, #4
    8210:	e1cc10b0 	strh	r1, [ip]
    8214:	e24b3014 	sub	r3, fp, #20
    8218:	e1a00003 	mov	r0, r3
    821c:	eb000419 	bl	9288 <printString>
    8220:	ef000001 	svc	0x00000001
    8224:	e24b303c 	sub	r3, fp, #60	; 0x3c
    8228:	e1a00003 	mov	r0, r3
    822c:	eb000415 	bl	9288 <printString>
    8230:	ef000001 	svc	0x00000001
    8234:	e24b3024 	sub	r3, fp, #36	; 0x24
    8238:	e1a00003 	mov	r0, r3
    823c:	eb000411 	bl	9288 <printString>
    8240:	ef000001 	svc	0x00000001
    8244:	eafffffd 	b	8240 <dummy_process_two+0x84>
    8248:	00009394 	muleq	r0, r4, r3
    824c:	000093a4 	andeq	r9, r0, r4, lsr #7
    8250:	000093b4 			; <UNDEFINED> instruction: 0x000093b4

00008254 <exception>:
    8254:	e92d4800 	push	{fp, lr}
    8258:	e28db004 	add	fp, sp, #4
    825c:	e24dd008 	sub	sp, sp, #8
    8260:	e50b0008 	str	r0, [fp, #-8]
    8264:	e51b0008 	ldr	r0, [fp, #-8]
    8268:	eb0002bc 	bl	8d60 <RPI_printString>
    826c:	eafffffe 	b	826c <exception+0x18>

00008270 <kernel_main>:
    8270:	e92d4800 	push	{fp, lr}
    8274:	e28db004 	add	fp, sp, #4
    8278:	e24dd028 	sub	sp, sp, #40	; 0x28
    827c:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
    8280:	e50b1024 	str	r1, [fp, #-36]	; 0xffffffdc
    8284:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
    8288:	eb00011e 	bl	8708 <RPI_GetGpio>
    828c:	e1a03000 	mov	r3, r0
    8290:	e5932004 	ldr	r2, [r3, #4]
    8294:	e3822701 	orr	r2, r2, #262144	; 0x40000
    8298:	e5832004 	str	r2, [r3, #4]
    829c:	eb00016f 	bl	8860 <RPI_GetIrqController>
    82a0:	e1a02000 	mov	r2, r0
    82a4:	e3a03001 	mov	r3, #1
    82a8:	e5823018 	str	r3, [r2, #24]
    82ac:	eb000106 	bl	86cc <RPI_GetArmTimer>
    82b0:	e1a02000 	mov	r2, r0
    82b4:	e3a03b01 	mov	r3, #1024	; 0x400
    82b8:	e5823000 	str	r3, [r2]
    82bc:	eb000102 	bl	86cc <RPI_GetArmTimer>
    82c0:	e1a02000 	mov	r2, r0
    82c4:	e3a030aa 	mov	r3, #170	; 0xaa
    82c8:	e5823008 	str	r3, [r2, #8]
    82cc:	eb000226 	bl	8b6c <RPI_MiniUartInit>
    82d0:	e59f3098 	ldr	r3, [pc, #152]	; 8370 <kernel_main+0x100>
    82d4:	e24bc01c 	sub	ip, fp, #28
    82d8:	e1a0e003 	mov	lr, r3
    82dc:	e8be000f 	ldm	lr!, {r0, r1, r2, r3}
    82e0:	e8ac000f 	stmia	ip!, {r0, r1, r2, r3}
    82e4:	e59e3000 	ldr	r3, [lr]
    82e8:	e1cc30b0 	strh	r3, [ip]
    82ec:	e28cc002 	add	ip, ip, #2
    82f0:	e1a03823 	lsr	r3, r3, #16
    82f4:	e5cc3000 	strb	r3, [ip]
    82f8:	eb0000d1 	bl	8644 <getAvailablePCB>
    82fc:	e50b0008 	str	r0, [fp, #-8]
    8300:	e51b3008 	ldr	r3, [fp, #-8]
    8304:	e3530000 	cmp	r3, #0
    8308:	1a000002 	bne	8318 <kernel_main+0xa8>
    830c:	e24b301c 	sub	r3, fp, #28
    8310:	e1a00003 	mov	r0, r3
    8314:	ebffffce 	bl	8254 <exception>
    8318:	e59f1054 	ldr	r1, [pc, #84]	; 8374 <kernel_main+0x104>
    831c:	e51b0008 	ldr	r0, [fp, #-8]
    8320:	eb00006c 	bl	84d8 <createProcess>
    8324:	eb0000c6 	bl	8644 <getAvailablePCB>
    8328:	e50b0008 	str	r0, [fp, #-8]
    832c:	e51b3008 	ldr	r3, [fp, #-8]
    8330:	e3530000 	cmp	r3, #0
    8334:	1a000002 	bne	8344 <kernel_main+0xd4>
    8338:	e24b301c 	sub	r3, fp, #28
    833c:	e1a00003 	mov	r0, r3
    8340:	ebffffc3 	bl	8254 <exception>
    8344:	e59f102c 	ldr	r1, [pc, #44]	; 8378 <kernel_main+0x108>
    8348:	e51b0008 	ldr	r0, [fp, #-8]
    834c:	eb000061 	bl	84d8 <createProcess>
    8350:	e51b0008 	ldr	r0, [fp, #-8]
    8354:	eb000088 	bl	857c <setRunningProcess>
    8358:	e51b3008 	ldr	r3, [fp, #-8]
    835c:	e3a02001 	mov	r2, #1
    8360:	e5832044 	str	r2, [r3, #68]	; 0x44
    8364:	e51b0008 	ldr	r0, [fp, #-8]
    8368:	eb0003ed 	bl	9324 <_start_user_process>
    836c:	eafffffe 	b	836c <kernel_main+0xfc>
    8370:	000093cc 	andeq	r9, r0, ip, asr #7
    8374:	00008114 	andeq	r8, r0, r4, lsl r1
    8378:	000081bc 			; <UNDEFINED> instruction: 0x000081bc

0000837c <malloc>:
    837c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8380:	e28db000 	add	fp, sp, #0
    8384:	e24dd024 	sub	sp, sp, #36	; 0x24
    8388:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
    838c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    8390:	e3530000 	cmp	r3, #0
    8394:	1a000001 	bne	83a0 <malloc+0x24>
    8398:	e3a03000 	mov	r3, #0
    839c:	ea000045 	b	84b8 <malloc+0x13c>
    83a0:	e59f3120 	ldr	r3, [pc, #288]	; 84c8 <malloc+0x14c>
    83a4:	e50b3008 	str	r3, [fp, #-8]
    83a8:	ea00000b 	b	83dc <malloc+0x60>
    83ac:	e51b3008 	ldr	r3, [fp, #-8]
    83b0:	e5932000 	ldr	r2, [r3]
    83b4:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    83b8:	e1520003 	cmp	r2, r3
    83bc:	3a000003 	bcc	83d0 <malloc+0x54>
    83c0:	e51b3008 	ldr	r3, [fp, #-8]
    83c4:	e5933000 	ldr	r3, [r3]
    83c8:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    83cc:	ea000006 	b	83ec <malloc+0x70>
    83d0:	e51b3008 	ldr	r3, [fp, #-8]
    83d4:	e2833008 	add	r3, r3, #8
    83d8:	e50b3008 	str	r3, [fp, #-8]
    83dc:	e51b3008 	ldr	r3, [fp, #-8]
    83e0:	e5933000 	ldr	r3, [r3]
    83e4:	e3530000 	cmp	r3, #0
    83e8:	1affffef 	bne	83ac <malloc+0x30>
    83ec:	e51b3008 	ldr	r3, [fp, #-8]
    83f0:	e5933004 	ldr	r3, [r3, #4]
    83f4:	e50b300c 	str	r3, [fp, #-12]
    83f8:	e51b3008 	ldr	r3, [fp, #-8]
    83fc:	e5933000 	ldr	r3, [r3]
    8400:	e3530000 	cmp	r3, #0
    8404:	0a000007 	beq	8428 <malloc+0xac>
    8408:	e51b300c 	ldr	r3, [fp, #-12]
    840c:	e3530000 	cmp	r3, #0
    8410:	0a000004 	beq	8428 <malloc+0xac>
    8414:	e51b300c 	ldr	r3, [fp, #-12]
    8418:	e5932008 	ldr	r2, [r3, #8]
    841c:	e51b3008 	ldr	r3, [fp, #-8]
    8420:	e5832004 	str	r2, [r3, #4]
    8424:	ea00001e 	b	84a4 <malloc+0x128>
    8428:	e59f309c 	ldr	r3, [pc, #156]	; 84cc <malloc+0x150>
    842c:	e5933000 	ldr	r3, [r3]
    8430:	e50b300c 	str	r3, [fp, #-12]
    8434:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    8438:	e283300c 	add	r3, r3, #12
    843c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    8440:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8444:	e283300f 	add	r3, r3, #15
    8448:	e3c3300f 	bic	r3, r3, #15
    844c:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    8450:	e59f3074 	ldr	r3, [pc, #116]	; 84cc <malloc+0x150>
    8454:	e5932000 	ldr	r2, [r3]
    8458:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    845c:	e0823003 	add	r3, r2, r3
    8460:	e50b3010 	str	r3, [fp, #-16]
    8464:	e59f3064 	ldr	r3, [pc, #100]	; 84d0 <malloc+0x154>
    8468:	e5933000 	ldr	r3, [r3]
    846c:	e51b2010 	ldr	r2, [fp, #-16]
    8470:	e1520003 	cmp	r2, r3
    8474:	9a000001 	bls	8480 <malloc+0x104>
    8478:	e3a03000 	mov	r3, #0
    847c:	ea00000d 	b	84b8 <malloc+0x13c>
    8480:	e59f2044 	ldr	r2, [pc, #68]	; 84cc <malloc+0x150>
    8484:	e51b3010 	ldr	r3, [fp, #-16]
    8488:	e5823000 	str	r3, [r2]
    848c:	e51b300c 	ldr	r3, [fp, #-12]
    8490:	e59f203c 	ldr	r2, [pc, #60]	; 84d4 <malloc+0x158>
    8494:	e5832000 	str	r2, [r3]
    8498:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
    849c:	e51b300c 	ldr	r3, [fp, #-12]
    84a0:	e5832004 	str	r2, [r3, #4]
    84a4:	e51b300c 	ldr	r3, [fp, #-12]
    84a8:	e3a02000 	mov	r2, #0
    84ac:	e5832008 	str	r2, [r3, #8]
    84b0:	e51b300c 	ldr	r3, [fp, #-12]
    84b4:	e283300c 	add	r3, r3, #12
    84b8:	e1a00003 	mov	r0, r3
    84bc:	e28bd000 	add	sp, fp, #0
    84c0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    84c4:	e12fff1e 	bx	lr
    84c8:	000093e8 	andeq	r9, r0, r8, ror #7
    84cc:	000093e0 	andeq	r9, r0, r0, ror #7
    84d0:	000093e4 	andeq	r9, r0, r4, ror #7
    84d4:	424c4d43 	submi	r4, ip, #4288	; 0x10c0

000084d8 <createProcess>:
    84d8:	e92d4800 	push	{fp, lr}
    84dc:	e28db004 	add	fp, sp, #4
    84e0:	e24dd010 	sub	sp, sp, #16
    84e4:	e50b0010 	str	r0, [fp, #-16]
    84e8:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    84ec:	e51b3010 	ldr	r3, [fp, #-16]
    84f0:	e2833004 	add	r3, r3, #4
    84f4:	e50b300c 	str	r3, [fp, #-12]
    84f8:	e3a03000 	mov	r3, #0
    84fc:	e50b3008 	str	r3, [fp, #-8]
    8500:	ea000008 	b	8528 <createProcess+0x50>
    8504:	e51b3008 	ldr	r3, [fp, #-8]
    8508:	e1a03103 	lsl	r3, r3, #2
    850c:	e51b200c 	ldr	r2, [fp, #-12]
    8510:	e0823003 	add	r3, r2, r3
    8514:	e3a02000 	mov	r2, #0
    8518:	e5832000 	str	r2, [r3]
    851c:	e51b3008 	ldr	r3, [fp, #-8]
    8520:	e2833001 	add	r3, r3, #1
    8524:	e50b3008 	str	r3, [fp, #-8]
    8528:	e51b3008 	ldr	r3, [fp, #-8]
    852c:	e353000c 	cmp	r3, #12
    8530:	dafffff3 	ble	8504 <createProcess+0x2c>
    8534:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    8538:	e51b3010 	ldr	r3, [fp, #-16]
    853c:	e5832040 	str	r2, [r3, #64]	; 0x40
    8540:	e3a00b01 	mov	r0, #1024	; 0x400
    8544:	ebffff8c 	bl	837c <malloc>
    8548:	e1a03000 	mov	r3, r0
    854c:	e2832b01 	add	r2, r3, #1024	; 0x400
    8550:	e51b3010 	ldr	r3, [fp, #-16]
    8554:	e5832038 	str	r2, [r3, #56]	; 0x38
    8558:	e51b3010 	ldr	r3, [fp, #-16]
    855c:	e3a02010 	mov	r2, #16
    8560:	e5832000 	str	r2, [r3]
    8564:	e51b3010 	ldr	r3, [fp, #-16]
    8568:	e3a02002 	mov	r2, #2
    856c:	e5832044 	str	r2, [r3, #68]	; 0x44
    8570:	e320f000 	nop	{0}
    8574:	e24bd004 	sub	sp, fp, #4
    8578:	e8bd8800 	pop	{fp, pc}

0000857c <setRunningProcess>:
    857c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8580:	e28db000 	add	fp, sp, #0
    8584:	e24dd00c 	sub	sp, sp, #12
    8588:	e50b0008 	str	r0, [fp, #-8]
    858c:	e59f2014 	ldr	r2, [pc, #20]	; 85a8 <setRunningProcess+0x2c>
    8590:	e51b3008 	ldr	r3, [fp, #-8]
    8594:	e5823000 	str	r3, [r2]
    8598:	e320f000 	nop	{0}
    859c:	e28bd000 	add	sp, fp, #0
    85a0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    85a4:	e12fff1e 	bx	lr
    85a8:	000094f0 	strdeq	r9, [r0], -r0

000085ac <getRunningProcess>:
    85ac:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    85b0:	e28db000 	add	fp, sp, #0
    85b4:	e59f3010 	ldr	r3, [pc, #16]	; 85cc <getRunningProcess+0x20>
    85b8:	e5933000 	ldr	r3, [r3]
    85bc:	e1a00003 	mov	r0, r3
    85c0:	e28bd000 	add	sp, fp, #0
    85c4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    85c8:	e12fff1e 	bx	lr
    85cc:	000094f0 	strdeq	r9, [r0], -r0

000085d0 <getNextProcess>:
    85d0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    85d4:	e28db000 	add	fp, sp, #0
    85d8:	e24dd00c 	sub	sp, sp, #12
    85dc:	e59f305c 	ldr	r3, [pc, #92]	; 8640 <getNextProcess+0x70>
    85e0:	e50b300c 	str	r3, [fp, #-12]
    85e4:	e3a03000 	mov	r3, #0
    85e8:	e50b3008 	str	r3, [fp, #-8]
    85ec:	ea000009 	b	8618 <getNextProcess+0x48>
    85f0:	e51b300c 	ldr	r3, [fp, #-12]
    85f4:	e5933044 	ldr	r3, [r3, #68]	; 0x44
    85f8:	e3530002 	cmp	r3, #2
    85fc:	0a000009 	beq	8628 <getNextProcess+0x58>
    8600:	e51b300c 	ldr	r3, [fp, #-12]
    8604:	e2833048 	add	r3, r3, #72	; 0x48
    8608:	e50b300c 	str	r3, [fp, #-12]
    860c:	e51b3008 	ldr	r3, [fp, #-8]
    8610:	e2833001 	add	r3, r3, #1
    8614:	e50b3008 	str	r3, [fp, #-8]
    8618:	e51b3008 	ldr	r3, [fp, #-8]
    861c:	e3530001 	cmp	r3, #1
    8620:	dafffff2 	ble	85f0 <getNextProcess+0x20>
    8624:	ea000000 	b	862c <getNextProcess+0x5c>
    8628:	e320f000 	nop	{0}
    862c:	e51b300c 	ldr	r3, [fp, #-12]
    8630:	e1a00003 	mov	r0, r3
    8634:	e28bd000 	add	sp, fp, #0
    8638:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    863c:	e12fff1e 	bx	lr
    8640:	00009460 	andeq	r9, r0, r0, ror #8

00008644 <getAvailablePCB>:
    8644:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8648:	e28db000 	add	fp, sp, #0
    864c:	e24dd00c 	sub	sp, sp, #12
    8650:	e59f3070 	ldr	r3, [pc, #112]	; 86c8 <getAvailablePCB+0x84>
    8654:	e50b300c 	str	r3, [fp, #-12]
    8658:	e3a03000 	mov	r3, #0
    865c:	e50b3008 	str	r3, [fp, #-8]
    8660:	ea000009 	b	868c <getAvailablePCB+0x48>
    8664:	e51b300c 	ldr	r3, [fp, #-12]
    8668:	e5933044 	ldr	r3, [r3, #68]	; 0x44
    866c:	e3530000 	cmp	r3, #0
    8670:	0a000009 	beq	869c <getAvailablePCB+0x58>
    8674:	e51b300c 	ldr	r3, [fp, #-12]
    8678:	e2833048 	add	r3, r3, #72	; 0x48
    867c:	e50b300c 	str	r3, [fp, #-12]
    8680:	e51b3008 	ldr	r3, [fp, #-8]
    8684:	e2833001 	add	r3, r3, #1
    8688:	e50b3008 	str	r3, [fp, #-8]
    868c:	e51b3008 	ldr	r3, [fp, #-8]
    8690:	e3530001 	cmp	r3, #1
    8694:	dafffff2 	ble	8664 <getAvailablePCB+0x20>
    8698:	ea000000 	b	86a0 <getAvailablePCB+0x5c>
    869c:	e320f000 	nop	{0}
    86a0:	e51b3008 	ldr	r3, [fp, #-8]
    86a4:	e3530002 	cmp	r3, #2
    86a8:	da000001 	ble	86b4 <getAvailablePCB+0x70>
    86ac:	e3a03000 	mov	r3, #0
    86b0:	ea000000 	b	86b8 <getAvailablePCB+0x74>
    86b4:	e51b300c 	ldr	r3, [fp, #-12]
    86b8:	e1a00003 	mov	r0, r3
    86bc:	e28bd000 	add	sp, fp, #0
    86c0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    86c4:	e12fff1e 	bx	lr
    86c8:	00009460 	andeq	r9, r0, r0, ror #8

000086cc <RPI_GetArmTimer>:
    86cc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    86d0:	e28db000 	add	fp, sp, #0
    86d4:	e59f3010 	ldr	r3, [pc, #16]	; 86ec <RPI_GetArmTimer+0x20>
    86d8:	e5933000 	ldr	r3, [r3]
    86dc:	e1a00003 	mov	r0, r3
    86e0:	e28bd000 	add	sp, fp, #0
    86e4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    86e8:	e12fff1e 	bx	lr
    86ec:	00009408 	andeq	r9, r0, r8, lsl #8

000086f0 <RPI_ArmTimerInit>:
    86f0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    86f4:	e28db000 	add	fp, sp, #0
    86f8:	e320f000 	nop	{0}
    86fc:	e28bd000 	add	sp, fp, #0
    8700:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8704:	e12fff1e 	bx	lr

00008708 <RPI_GetGpio>:
    8708:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    870c:	e28db000 	add	fp, sp, #0
    8710:	e59f3010 	ldr	r3, [pc, #16]	; 8728 <RPI_GetGpio+0x20>
    8714:	e5933000 	ldr	r3, [r3]
    8718:	e1a00003 	mov	r0, r3
    871c:	e28bd000 	add	sp, fp, #0
    8720:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8724:	e12fff1e 	bx	lr
    8728:	0000940c 	andeq	r9, r0, ip, lsl #8

0000872c <RPI_SetGpioPinFunction>:
    872c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8730:	e28db000 	add	fp, sp, #0
    8734:	e24dd014 	sub	sp, sp, #20
    8738:	e1a03000 	mov	r3, r0
    873c:	e1a02001 	mov	r2, r1
    8740:	e54b300d 	strb	r3, [fp, #-13]
    8744:	e1a03002 	mov	r3, r2
    8748:	e54b300e 	strb	r3, [fp, #-14]
    874c:	e59f30ec 	ldr	r3, [pc, #236]	; 8840 <RPI_SetGpioPinFunction+0x114>
    8750:	e5932000 	ldr	r2, [r3]
    8754:	e55b300d 	ldrb	r3, [fp, #-13]
    8758:	e59f10e4 	ldr	r1, [pc, #228]	; 8844 <RPI_SetGpioPinFunction+0x118>
    875c:	e0831391 	umull	r1, r3, r1, r3
    8760:	e1a031a3 	lsr	r3, r3, #3
    8764:	e6ef3073 	uxtb	r3, r3
    8768:	e1a03103 	lsl	r3, r3, #2
    876c:	e0823003 	add	r3, r2, r3
    8770:	e50b3008 	str	r3, [fp, #-8]
    8774:	e51b3008 	ldr	r3, [fp, #-8]
    8778:	e5933000 	ldr	r3, [r3]
    877c:	e50b300c 	str	r3, [fp, #-12]
    8780:	e55b200d 	ldrb	r2, [fp, #-13]
    8784:	e59f30b8 	ldr	r3, [pc, #184]	; 8844 <RPI_SetGpioPinFunction+0x118>
    8788:	e0831293 	umull	r1, r3, r3, r2
    878c:	e1a011a3 	lsr	r1, r3, #3
    8790:	e1a03001 	mov	r3, r1
    8794:	e1a03103 	lsl	r3, r3, #2
    8798:	e0833001 	add	r3, r3, r1
    879c:	e1a03083 	lsl	r3, r3, #1
    87a0:	e0423003 	sub	r3, r2, r3
    87a4:	e6ef3073 	uxtb	r3, r3
    87a8:	e1a02003 	mov	r2, r3
    87ac:	e1a03002 	mov	r3, r2
    87b0:	e1a03083 	lsl	r3, r3, #1
    87b4:	e0833002 	add	r3, r3, r2
    87b8:	e3a02007 	mov	r2, #7
    87bc:	e1a03312 	lsl	r3, r2, r3
    87c0:	e1e03003 	mvn	r3, r3
    87c4:	e1a02003 	mov	r2, r3
    87c8:	e51b300c 	ldr	r3, [fp, #-12]
    87cc:	e0033002 	and	r3, r3, r2
    87d0:	e50b300c 	str	r3, [fp, #-12]
    87d4:	e55b000e 	ldrb	r0, [fp, #-14]
    87d8:	e55b200d 	ldrb	r2, [fp, #-13]
    87dc:	e59f3060 	ldr	r3, [pc, #96]	; 8844 <RPI_SetGpioPinFunction+0x118>
    87e0:	e0831293 	umull	r1, r3, r3, r2
    87e4:	e1a011a3 	lsr	r1, r3, #3
    87e8:	e1a03001 	mov	r3, r1
    87ec:	e1a03103 	lsl	r3, r3, #2
    87f0:	e0833001 	add	r3, r3, r1
    87f4:	e1a03083 	lsl	r3, r3, #1
    87f8:	e0423003 	sub	r3, r2, r3
    87fc:	e6ef3073 	uxtb	r3, r3
    8800:	e1a02003 	mov	r2, r3
    8804:	e1a03002 	mov	r3, r2
    8808:	e1a03083 	lsl	r3, r3, #1
    880c:	e0833002 	add	r3, r3, r2
    8810:	e1a03310 	lsl	r3, r0, r3
    8814:	e1a02003 	mov	r2, r3
    8818:	e51b300c 	ldr	r3, [fp, #-12]
    881c:	e1823003 	orr	r3, r2, r3
    8820:	e50b300c 	str	r3, [fp, #-12]
    8824:	e51b200c 	ldr	r2, [fp, #-12]
    8828:	e51b3008 	ldr	r3, [fp, #-8]
    882c:	e5832000 	str	r2, [r3]
    8830:	e320f000 	nop	{0}
    8834:	e28bd000 	add	sp, fp, #0
    8838:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    883c:	e12fff1e 	bx	lr
    8840:	0000940c 	andeq	r9, r0, ip, lsl #8
    8844:	cccccccd 	stclgt	12, cr12, [ip], {205}	; 0xcd

00008848 <RPI_GpioInit>:
    8848:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    884c:	e28db000 	add	fp, sp, #0
    8850:	e320f000 	nop	{0}
    8854:	e28bd000 	add	sp, fp, #0
    8858:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    885c:	e12fff1e 	bx	lr

00008860 <RPI_GetIrqController>:
    8860:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8864:	e28db000 	add	fp, sp, #0
    8868:	e59f3010 	ldr	r3, [pc, #16]	; 8880 <RPI_GetIrqController+0x20>
    886c:	e5933000 	ldr	r3, [r3]
    8870:	e1a00003 	mov	r0, r3
    8874:	e28bd000 	add	sp, fp, #0
    8878:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    887c:	e12fff1e 	bx	lr
    8880:	00009410 	andeq	r9, r0, r0, lsl r4

00008884 <reset_vector>:
    8884:	e24ee004 	sub	lr, lr, #4
    8888:	e92d580f 	push	{r0, r1, r2, r3, fp, ip, lr}
    888c:	e28db018 	add	fp, sp, #24
    8890:	e24dd00c 	sub	sp, sp, #12
    8894:	e3a03031 	mov	r3, #49	; 0x31
    8898:	e54b301d 	strb	r3, [fp, #-29]	; 0xffffffe3
    889c:	ebffff99 	bl	8708 <RPI_GetGpio>
    88a0:	e1a02000 	mov	r2, r0
    88a4:	e3a03801 	mov	r3, #65536	; 0x10000
    88a8:	e5823028 	str	r3, [r2, #40]	; 0x28
    88ac:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
    88b0:	e1a00003 	mov	r0, r3
    88b4:	eb0000fb 	bl	8ca8 <RPI_WriteToMiniUart>
    88b8:	eafffff7 	b	889c <reset_vector+0x18>

000088bc <undefined_instruction_vector>:
    88bc:	e92d580f 	push	{r0, r1, r2, r3, fp, ip, lr}
    88c0:	e28db018 	add	fp, sp, #24
    88c4:	e24dd00c 	sub	sp, sp, #12
    88c8:	e3a03032 	mov	r3, #50	; 0x32
    88cc:	e54b301d 	strb	r3, [fp, #-29]	; 0xffffffe3
    88d0:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
    88d4:	e1a00003 	mov	r0, r3
    88d8:	eb0000f2 	bl	8ca8 <RPI_WriteToMiniUart>
    88dc:	ebffff89 	bl	8708 <RPI_GetGpio>
    88e0:	e1a02000 	mov	r2, r0
    88e4:	e3a03801 	mov	r3, #65536	; 0x10000
    88e8:	e5823028 	str	r3, [r2, #40]	; 0x28
    88ec:	eafffffa 	b	88dc <undefined_instruction_vector+0x20>

000088f0 <software_interrupt_vector>:
    88f0:	e92d580f 	push	{r0, r1, r2, r3, fp, ip, lr}
    88f4:	e28db018 	add	fp, sp, #24
    88f8:	e24dd00c 	sub	sp, sp, #12
    88fc:	e3a03033 	mov	r3, #51	; 0x33
    8900:	e54b301d 	strb	r3, [fp, #-29]	; 0xffffffe3
    8904:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
    8908:	e1a00003 	mov	r0, r3
    890c:	eb0000e5 	bl	8ca8 <RPI_WriteToMiniUart>
    8910:	ebffff7c 	bl	8708 <RPI_GetGpio>
    8914:	e1a02000 	mov	r2, r0
    8918:	e3a03801 	mov	r3, #65536	; 0x10000
    891c:	e5823028 	str	r3, [r2, #40]	; 0x28
    8920:	eafffffa 	b	8910 <software_interrupt_vector+0x20>

00008924 <prefetch_abort_vector>:
    8924:	e24ee004 	sub	lr, lr, #4
    8928:	e92d580f 	push	{r0, r1, r2, r3, fp, ip, lr}
    892c:	e28db018 	add	fp, sp, #24
    8930:	e24dd00c 	sub	sp, sp, #12
    8934:	e3a03034 	mov	r3, #52	; 0x34
    8938:	e54b301d 	strb	r3, [fp, #-29]	; 0xffffffe3
    893c:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
    8940:	e1a00003 	mov	r0, r3
    8944:	eb0000d7 	bl	8ca8 <RPI_WriteToMiniUart>
    8948:	ebffff6e 	bl	8708 <RPI_GetGpio>
    894c:	e1a02000 	mov	r2, r0
    8950:	e3a03801 	mov	r3, #65536	; 0x10000
    8954:	e5823028 	str	r3, [r2, #40]	; 0x28
    8958:	eafffffa 	b	8948 <prefetch_abort_vector+0x24>

0000895c <data_abort_vector>:
    895c:	e24ee004 	sub	lr, lr, #4
    8960:	e92d580f 	push	{r0, r1, r2, r3, fp, ip, lr}
    8964:	e28db018 	add	fp, sp, #24
    8968:	e24dd00c 	sub	sp, sp, #12
    896c:	e3a03035 	mov	r3, #53	; 0x35
    8970:	e54b301d 	strb	r3, [fp, #-29]	; 0xffffffe3
    8974:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
    8978:	e1a00003 	mov	r0, r3
    897c:	eb0000c9 	bl	8ca8 <RPI_WriteToMiniUart>
    8980:	ebffff60 	bl	8708 <RPI_GetGpio>
    8984:	e1a02000 	mov	r2, r0
    8988:	e3a03801 	mov	r3, #65536	; 0x10000
    898c:	e5823028 	str	r3, [r2, #40]	; 0x28
    8990:	eafffffa 	b	8980 <data_abort_vector+0x24>

00008994 <interrupt_vector>:
    8994:	e24ee004 	sub	lr, lr, #4
    8998:	e92d581f 	push	{r0, r1, r2, r3, r4, fp, ip, lr}
    899c:	e28db01c 	add	fp, sp, #28
    89a0:	eb000040 	bl	8aa8 <RPI_GetSystemTimer>
    89a4:	e1a03000 	mov	r3, r0
    89a8:	e5933000 	ldr	r3, [r3]
    89ac:	e3530000 	cmp	r3, #0
    89b0:	0a000016 	beq	8a10 <interrupt_vector+0x7c>
    89b4:	eb00003b 	bl	8aa8 <RPI_GetSystemTimer>
    89b8:	e1a03000 	mov	r3, r0
    89bc:	e5932000 	ldr	r2, [r3]
    89c0:	e3c22002 	bic	r2, r2, #2
    89c4:	e5832000 	str	r2, [r3]
    89c8:	eb000036 	bl	8aa8 <RPI_GetSystemTimer>
    89cc:	e1a02000 	mov	r2, r0
    89d0:	e5923010 	ldr	r3, [r2, #16]
    89d4:	e2833b61 	add	r3, r3, #99328	; 0x18400
    89d8:	e2833e2a 	add	r3, r3, #672	; 0x2a0
    89dc:	e5823010 	str	r3, [r2, #16]
    89e0:	e59f30a4 	ldr	r3, [pc, #164]	; 8a8c <interrupt_vector+0xf8>
    89e4:	e5933000 	ldr	r3, [r3]
    89e8:	e3530009 	cmp	r3, #9
    89ec:	da000002 	ble	89fc <interrupt_vector+0x68>
    89f0:	e59f3094 	ldr	r3, [pc, #148]	; 8a8c <interrupt_vector+0xf8>
    89f4:	e3a02000 	mov	r2, #0
    89f8:	e5832000 	str	r2, [r3]
    89fc:	e59f3088 	ldr	r3, [pc, #136]	; 8a8c <interrupt_vector+0xf8>
    8a00:	e5933000 	ldr	r3, [r3]
    8a04:	e2833001 	add	r3, r3, #1
    8a08:	e59f207c 	ldr	r2, [pc, #124]	; 8a8c <interrupt_vector+0xf8>
    8a0c:	e5823000 	str	r3, [r2]
    8a10:	e59f3078 	ldr	r3, [pc, #120]	; 8a90 <interrupt_vector+0xfc>
    8a14:	e5933000 	ldr	r3, [r3]
    8a18:	e5933000 	ldr	r3, [r3]
    8a1c:	e3530000 	cmp	r3, #0
    8a20:	0a000016 	beq	8a80 <interrupt_vector+0xec>
    8a24:	ebffff28 	bl	86cc <RPI_GetArmTimer>
    8a28:	e1a02000 	mov	r2, r0
    8a2c:	e3a03001 	mov	r3, #1
    8a30:	e582300c 	str	r3, [r2, #12]
    8a34:	e59f3058 	ldr	r3, [pc, #88]	; 8a94 <interrupt_vector+0x100>
    8a38:	e5933000 	ldr	r3, [r3]
    8a3c:	e3530000 	cmp	r3, #0
    8a40:	0a000007 	beq	8a64 <interrupt_vector+0xd0>
    8a44:	ebffff2f 	bl	8708 <RPI_GetGpio>
    8a48:	e1a02000 	mov	r2, r0
    8a4c:	e3a03801 	mov	r3, #65536	; 0x10000
    8a50:	e582301c 	str	r3, [r2, #28]
    8a54:	e59f3038 	ldr	r3, [pc, #56]	; 8a94 <interrupt_vector+0x100>
    8a58:	e3a02000 	mov	r2, #0
    8a5c:	e5832000 	str	r2, [r3]
    8a60:	ea000006 	b	8a80 <interrupt_vector+0xec>
    8a64:	ebffff27 	bl	8708 <RPI_GetGpio>
    8a68:	e1a02000 	mov	r2, r0
    8a6c:	e3a03801 	mov	r3, #65536	; 0x10000
    8a70:	e5823028 	str	r3, [r2, #40]	; 0x28
    8a74:	e59f3018 	ldr	r3, [pc, #24]	; 8a94 <interrupt_vector+0x100>
    8a78:	e3a02001 	mov	r2, #1
    8a7c:	e5832000 	str	r2, [r3]
    8a80:	e320f000 	nop	{0}
    8a84:	e24bd01c 	sub	sp, fp, #28
    8a88:	e8fd981f 	ldm	sp!, {r0, r1, r2, r3, r4, fp, ip, pc}^
    8a8c:	000094f4 	strdeq	r9, [r0], -r4
    8a90:	00009410 	andeq	r9, r0, r0, lsl r4
    8a94:	000094f8 	strdeq	r9, [r0], -r8

00008a98 <fast_interrupt_vector>:
    8a98:	e24db004 	sub	fp, sp, #4
    8a9c:	e320f000 	nop	{0}
    8aa0:	e28bd004 	add	sp, fp, #4
    8aa4:	e25ef004 	subs	pc, lr, #4

00008aa8 <RPI_GetSystemTimer>:
    8aa8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8aac:	e28db000 	add	fp, sp, #0
    8ab0:	e59f3010 	ldr	r3, [pc, #16]	; 8ac8 <RPI_GetSystemTimer+0x20>
    8ab4:	e5933000 	ldr	r3, [r3]
    8ab8:	e1a00003 	mov	r0, r3
    8abc:	e28bd000 	add	sp, fp, #0
    8ac0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8ac4:	e12fff1e 	bx	lr
    8ac8:	00009414 	andeq	r9, r0, r4, lsl r4

00008acc <RPI_WaitMicroSeconds>:
    8acc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8ad0:	e28db000 	add	fp, sp, #0
    8ad4:	e24dd014 	sub	sp, sp, #20
    8ad8:	e50b0010 	str	r0, [fp, #-16]
    8adc:	e59f303c 	ldr	r3, [pc, #60]	; 8b20 <RPI_WaitMicroSeconds+0x54>
    8ae0:	e5933000 	ldr	r3, [r3]
    8ae4:	e5933004 	ldr	r3, [r3, #4]
    8ae8:	e50b3008 	str	r3, [fp, #-8]
    8aec:	e320f000 	nop	{0}
    8af0:	e59f3028 	ldr	r3, [pc, #40]	; 8b20 <RPI_WaitMicroSeconds+0x54>
    8af4:	e5933000 	ldr	r3, [r3]
    8af8:	e5932004 	ldr	r2, [r3, #4]
    8afc:	e51b3008 	ldr	r3, [fp, #-8]
    8b00:	e0422003 	sub	r2, r2, r3
    8b04:	e51b3010 	ldr	r3, [fp, #-16]
    8b08:	e1520003 	cmp	r2, r3
    8b0c:	3afffff7 	bcc	8af0 <RPI_WaitMicroSeconds+0x24>
    8b10:	e320f000 	nop	{0}
    8b14:	e28bd000 	add	sp, fp, #0
    8b18:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8b1c:	e12fff1e 	bx	lr
    8b20:	00009414 	andeq	r9, r0, r4, lsl r4

00008b24 <RPI_GetAux>:
    8b24:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8b28:	e28db000 	add	fp, sp, #0
    8b2c:	e59f3010 	ldr	r3, [pc, #16]	; 8b44 <RPI_GetAux+0x20>
    8b30:	e5933000 	ldr	r3, [r3]
    8b34:	e1a00003 	mov	r0, r3
    8b38:	e28bd000 	add	sp, fp, #0
    8b3c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8b40:	e12fff1e 	bx	lr
    8b44:	00009418 	andeq	r9, r0, r8, lsl r4

00008b48 <RPI_GetMiniUart>:
    8b48:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8b4c:	e28db000 	add	fp, sp, #0
    8b50:	e59f3010 	ldr	r3, [pc, #16]	; 8b68 <RPI_GetMiniUart+0x20>
    8b54:	e5933000 	ldr	r3, [r3]
    8b58:	e1a00003 	mov	r0, r3
    8b5c:	e28bd000 	add	sp, fp, #0
    8b60:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8b64:	e12fff1e 	bx	lr
    8b68:	0000941c 	andeq	r9, r0, ip, lsl r4

00008b6c <RPI_MiniUartInit>:
    8b6c:	e92d4800 	push	{fp, lr}
    8b70:	e28db004 	add	fp, sp, #4
    8b74:	e24dd008 	sub	sp, sp, #8
    8b78:	ebfffee2 	bl	8708 <RPI_GetGpio>
    8b7c:	e50b0008 	str	r0, [fp, #-8]
    8b80:	e59f3114 	ldr	r3, [pc, #276]	; 8c9c <RPI_MiniUartInit+0x130>
    8b84:	e5933000 	ldr	r3, [r3]
    8b88:	e59f210c 	ldr	r2, [pc, #268]	; 8c9c <RPI_MiniUartInit+0x130>
    8b8c:	e5922000 	ldr	r2, [r2]
    8b90:	e5922004 	ldr	r2, [r2, #4]
    8b94:	e3822001 	orr	r2, r2, #1
    8b98:	e5832004 	str	r2, [r3, #4]
    8b9c:	e59f30fc 	ldr	r3, [pc, #252]	; 8ca0 <RPI_MiniUartInit+0x134>
    8ba0:	e5933000 	ldr	r3, [r3]
    8ba4:	e3a02000 	mov	r2, #0
    8ba8:	e5832004 	str	r2, [r3, #4]
    8bac:	e59f30ec 	ldr	r3, [pc, #236]	; 8ca0 <RPI_MiniUartInit+0x134>
    8bb0:	e5933000 	ldr	r3, [r3]
    8bb4:	e3a02000 	mov	r2, #0
    8bb8:	e5832020 	str	r2, [r3, #32]
    8bbc:	e59f30dc 	ldr	r3, [pc, #220]	; 8ca0 <RPI_MiniUartInit+0x134>
    8bc0:	e5933000 	ldr	r3, [r3]
    8bc4:	e3a02003 	mov	r2, #3
    8bc8:	e583200c 	str	r2, [r3, #12]
    8bcc:	e59f30cc 	ldr	r3, [pc, #204]	; 8ca0 <RPI_MiniUartInit+0x134>
    8bd0:	e5933000 	ldr	r3, [r3]
    8bd4:	e3a02000 	mov	r2, #0
    8bd8:	e5832010 	str	r2, [r3, #16]
    8bdc:	e59f30bc 	ldr	r3, [pc, #188]	; 8ca0 <RPI_MiniUartInit+0x134>
    8be0:	e5933000 	ldr	r3, [r3]
    8be4:	e3a020c6 	mov	r2, #198	; 0xc6
    8be8:	e5832008 	str	r2, [r3, #8]
    8bec:	e59f30ac 	ldr	r3, [pc, #172]	; 8ca0 <RPI_MiniUartInit+0x134>
    8bf0:	e5933000 	ldr	r3, [r3]
    8bf4:	e59f20a8 	ldr	r2, [pc, #168]	; 8ca4 <RPI_MiniUartInit+0x138>
    8bf8:	e5832028 	str	r2, [r3, #40]	; 0x28
    8bfc:	e3a01002 	mov	r1, #2
    8c00:	e3a0000e 	mov	r0, #14
    8c04:	ebfffec8 	bl	872c <RPI_SetGpioPinFunction>
    8c08:	e3a01002 	mov	r1, #2
    8c0c:	e3a0000f 	mov	r0, #15
    8c10:	ebfffec5 	bl	872c <RPI_SetGpioPinFunction>
    8c14:	e51b3008 	ldr	r3, [fp, #-8]
    8c18:	e3a02000 	mov	r2, #0
    8c1c:	e5832094 	str	r2, [r3, #148]	; 0x94
    8c20:	e3a03000 	mov	r3, #0
    8c24:	e50b300c 	str	r3, [fp, #-12]
    8c28:	ea000002 	b	8c38 <RPI_MiniUartInit+0xcc>
    8c2c:	e51b300c 	ldr	r3, [fp, #-12]
    8c30:	e2833001 	add	r3, r3, #1
    8c34:	e50b300c 	str	r3, [fp, #-12]
    8c38:	e51b300c 	ldr	r3, [fp, #-12]
    8c3c:	e3530095 	cmp	r3, #149	; 0x95
    8c40:	dafffff9 	ble	8c2c <RPI_MiniUartInit+0xc0>
    8c44:	e51b3008 	ldr	r3, [fp, #-8]
    8c48:	e3a02903 	mov	r2, #49152	; 0xc000
    8c4c:	e5832098 	str	r2, [r3, #152]	; 0x98
    8c50:	e3a03000 	mov	r3, #0
    8c54:	e50b300c 	str	r3, [fp, #-12]
    8c58:	ea000002 	b	8c68 <RPI_MiniUartInit+0xfc>
    8c5c:	e51b300c 	ldr	r3, [fp, #-12]
    8c60:	e2833001 	add	r3, r3, #1
    8c64:	e50b300c 	str	r3, [fp, #-12]
    8c68:	e51b300c 	ldr	r3, [fp, #-12]
    8c6c:	e3530095 	cmp	r3, #149	; 0x95
    8c70:	dafffff9 	ble	8c5c <RPI_MiniUartInit+0xf0>
    8c74:	e51b3008 	ldr	r3, [fp, #-8]
    8c78:	e3a02000 	mov	r2, #0
    8c7c:	e5832098 	str	r2, [r3, #152]	; 0x98
    8c80:	e59f3018 	ldr	r3, [pc, #24]	; 8ca0 <RPI_MiniUartInit+0x134>
    8c84:	e5933000 	ldr	r3, [r3]
    8c88:	e3a02003 	mov	r2, #3
    8c8c:	e5832020 	str	r2, [r3, #32]
    8c90:	e320f000 	nop	{0}
    8c94:	e24bd004 	sub	sp, fp, #4
    8c98:	e8bd8800 	pop	{fp, pc}
    8c9c:	00009418 	andeq	r9, r0, r8, lsl r4
    8ca0:	0000941c 	andeq	r9, r0, ip, lsl r4
    8ca4:	0000010e 	andeq	r0, r0, lr, lsl #2

00008ca8 <RPI_WriteToMiniUart>:
    8ca8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8cac:	e28db000 	add	fp, sp, #0
    8cb0:	e24dd00c 	sub	sp, sp, #12
    8cb4:	e1a03000 	mov	r3, r0
    8cb8:	e54b3005 	strb	r3, [fp, #-5]
    8cbc:	e320f000 	nop	{0}
    8cc0:	e59f3030 	ldr	r3, [pc, #48]	; 8cf8 <RPI_WriteToMiniUart+0x50>
    8cc4:	e5933000 	ldr	r3, [r3]
    8cc8:	e5933014 	ldr	r3, [r3, #20]
    8ccc:	e2033020 	and	r3, r3, #32
    8cd0:	e3530000 	cmp	r3, #0
    8cd4:	0afffff9 	beq	8cc0 <RPI_WriteToMiniUart+0x18>
    8cd8:	e59f3018 	ldr	r3, [pc, #24]	; 8cf8 <RPI_WriteToMiniUart+0x50>
    8cdc:	e5933000 	ldr	r3, [r3]
    8ce0:	e55b2005 	ldrb	r2, [fp, #-5]
    8ce4:	e5832000 	str	r2, [r3]
    8ce8:	e320f000 	nop	{0}
    8cec:	e28bd000 	add	sp, fp, #0
    8cf0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8cf4:	e12fff1e 	bx	lr
    8cf8:	0000941c 	andeq	r9, r0, ip, lsl r4

00008cfc <RPI_printStringOfLen>:
    8cfc:	e92d4800 	push	{fp, lr}
    8d00:	e28db004 	add	fp, sp, #4
    8d04:	e24dd010 	sub	sp, sp, #16
    8d08:	e50b0010 	str	r0, [fp, #-16]
    8d0c:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    8d10:	e3a03000 	mov	r3, #0
    8d14:	e50b3008 	str	r3, [fp, #-8]
    8d18:	ea000008 	b	8d40 <RPI_printStringOfLen+0x44>
    8d1c:	e51b3010 	ldr	r3, [fp, #-16]
    8d20:	e2832001 	add	r2, r3, #1
    8d24:	e50b2010 	str	r2, [fp, #-16]
    8d28:	e5d33000 	ldrb	r3, [r3]
    8d2c:	e1a00003 	mov	r0, r3
    8d30:	ebffffdc 	bl	8ca8 <RPI_WriteToMiniUart>
    8d34:	e51b3008 	ldr	r3, [fp, #-8]
    8d38:	e2833001 	add	r3, r3, #1
    8d3c:	e50b3008 	str	r3, [fp, #-8]
    8d40:	e51b2008 	ldr	r2, [fp, #-8]
    8d44:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8d48:	e1520003 	cmp	r2, r3
    8d4c:	bafffff2 	blt	8d1c <RPI_printStringOfLen+0x20>
    8d50:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8d54:	e1a00003 	mov	r0, r3
    8d58:	e24bd004 	sub	sp, fp, #4
    8d5c:	e8bd8800 	pop	{fp, pc}

00008d60 <RPI_printString>:
    8d60:	e92d4800 	push	{fp, lr}
    8d64:	e28db004 	add	fp, sp, #4
    8d68:	e24dd008 	sub	sp, sp, #8
    8d6c:	e50b0008 	str	r0, [fp, #-8]
    8d70:	ea000005 	b	8d8c <RPI_printString+0x2c>
    8d74:	e51b3008 	ldr	r3, [fp, #-8]
    8d78:	e2832001 	add	r2, r3, #1
    8d7c:	e50b2008 	str	r2, [fp, #-8]
    8d80:	e5d33000 	ldrb	r3, [r3]
    8d84:	e1a00003 	mov	r0, r3
    8d88:	ebffffc6 	bl	8ca8 <RPI_WriteToMiniUart>
    8d8c:	e51b3008 	ldr	r3, [fp, #-8]
    8d90:	e5d33000 	ldrb	r3, [r3]
    8d94:	e3530000 	cmp	r3, #0
    8d98:	1afffff5 	bne	8d74 <RPI_printString+0x14>
    8d9c:	e320f000 	nop	{0}
    8da0:	e24bd004 	sub	sp, fp, #4
    8da4:	e8bd8800 	pop	{fp, pc}

00008da8 <RPI_ReadFromMiniUart>:
    8da8:	e92d4800 	push	{fp, lr}
    8dac:	e28db004 	add	fp, sp, #4
    8db0:	e24dd008 	sub	sp, sp, #8
    8db4:	e50b0008 	str	r0, [fp, #-8]
    8db8:	e50b100c 	str	r1, [fp, #-12]
    8dbc:	e51b200c 	ldr	r2, [fp, #-12]
    8dc0:	e51b1008 	ldr	r1, [fp, #-8]
    8dc4:	e59f0010 	ldr	r0, [pc, #16]	; 8ddc <RPI_ReadFromMiniUart+0x34>
    8dc8:	eb0000aa 	bl	9078 <fifo_read>
    8dcc:	e1a03000 	mov	r3, r0
    8dd0:	e1a00003 	mov	r0, r3
    8dd4:	e24bd004 	sub	sp, fp, #4
    8dd8:	e8bd8800 	pop	{fp, pc}
    8ddc:	000094fc 	strdeq	r9, [r0], -ip

00008de0 <RPI_MiniUart_ISR>:
    8de0:	e92d4800 	push	{fp, lr}
    8de4:	e28db004 	add	fp, sp, #4
    8de8:	e24dd008 	sub	sp, sp, #8
    8dec:	e59f30c4 	ldr	r3, [pc, #196]	; 8eb8 <RPI_MiniUart_ISR+0xd8>
    8df0:	e5933000 	ldr	r3, [r3]
    8df4:	e5933008 	ldr	r3, [r3, #8]
    8df8:	e2033004 	and	r3, r3, #4
    8dfc:	e3530000 	cmp	r3, #0
    8e00:	0a000016 	beq	8e60 <RPI_MiniUart_ISR+0x80>
    8e04:	e59f30ac 	ldr	r3, [pc, #172]	; 8eb8 <RPI_MiniUart_ISR+0xd8>
    8e08:	e5933000 	ldr	r3, [r3]
    8e0c:	e5933000 	ldr	r3, [r3]
    8e10:	e50b3008 	str	r3, [fp, #-8]
    8e14:	e59f309c 	ldr	r3, [pc, #156]	; 8eb8 <RPI_MiniUart_ISR+0xd8>
    8e18:	e5933000 	ldr	r3, [r3]
    8e1c:	e51b2008 	ldr	r2, [fp, #-8]
    8e20:	e5832000 	str	r2, [r3]
    8e24:	e59f308c 	ldr	r3, [pc, #140]	; 8eb8 <RPI_MiniUart_ISR+0xd8>
    8e28:	e5933000 	ldr	r3, [r3]
    8e2c:	e59f2084 	ldr	r2, [pc, #132]	; 8eb8 <RPI_MiniUart_ISR+0xd8>
    8e30:	e5922000 	ldr	r2, [r2]
    8e34:	e5922004 	ldr	r2, [r2, #4]
    8e38:	e3822001 	orr	r2, r2, #1
    8e3c:	e5832004 	str	r2, [r3, #4]
    8e40:	e51b3008 	ldr	r3, [fp, #-8]
    8e44:	e6ef3073 	uxtb	r3, r3
    8e48:	e54b3009 	strb	r3, [fp, #-9]
    8e4c:	e24b3009 	sub	r3, fp, #9
    8e50:	e3a02001 	mov	r2, #1
    8e54:	e1a01003 	mov	r1, r3
    8e58:	e59f005c 	ldr	r0, [pc, #92]	; 8ebc <RPI_MiniUart_ISR+0xdc>
    8e5c:	eb0000be 	bl	915c <fifo_write>
    8e60:	e59f3050 	ldr	r3, [pc, #80]	; 8eb8 <RPI_MiniUart_ISR+0xd8>
    8e64:	e5933000 	ldr	r3, [r3]
    8e68:	e5933008 	ldr	r3, [r3, #8]
    8e6c:	e2033002 	and	r3, r3, #2
    8e70:	e3530000 	cmp	r3, #0
    8e74:	0a00000c 	beq	8eac <RPI_MiniUart_ISR+0xcc>
    8e78:	e59f3038 	ldr	r3, [pc, #56]	; 8eb8 <RPI_MiniUart_ISR+0xd8>
    8e7c:	e5933000 	ldr	r3, [r3]
    8e80:	e5933014 	ldr	r3, [r3, #20]
    8e84:	e2033040 	and	r3, r3, #64	; 0x40
    8e88:	e3530000 	cmp	r3, #0
    8e8c:	0a000006 	beq	8eac <RPI_MiniUart_ISR+0xcc>
    8e90:	e59f3020 	ldr	r3, [pc, #32]	; 8eb8 <RPI_MiniUart_ISR+0xd8>
    8e94:	e5933000 	ldr	r3, [r3]
    8e98:	e59f2018 	ldr	r2, [pc, #24]	; 8eb8 <RPI_MiniUart_ISR+0xd8>
    8e9c:	e5922000 	ldr	r2, [r2]
    8ea0:	e5922004 	ldr	r2, [r2, #4]
    8ea4:	e3c22001 	bic	r2, r2, #1
    8ea8:	e5832004 	str	r2, [r3, #4]
    8eac:	e320f000 	nop	{0}
    8eb0:	e24bd004 	sub	sp, fp, #4
    8eb4:	e8bd8800 	pop	{fp, pc}
    8eb8:	0000941c 	andeq	r9, r0, ip, lsl r4
    8ebc:	000094fc 	strdeq	r9, [r0], -ip

00008ec0 <shell_main>:
    8ec0:	e92d4800 	push	{fp, lr}
    8ec4:	e28db004 	add	fp, sp, #4
    8ec8:	e24dd018 	sub	sp, sp, #24
    8ecc:	ebffff1d 	bl	8b48 <RPI_GetMiniUart>
    8ed0:	e50b0010 	str	r0, [fp, #-16]
    8ed4:	e24b301c 	sub	r3, fp, #28
    8ed8:	e50b300c 	str	r3, [fp, #-12]
    8edc:	e59f007c 	ldr	r0, [pc, #124]	; 8f60 <shell_main+0xa0>
    8ee0:	ebffff9e 	bl	8d60 <RPI_printString>
    8ee4:	e3a03000 	mov	r3, #0
    8ee8:	e50b3008 	str	r3, [fp, #-8]
    8eec:	ea000015 	b	8f48 <shell_main+0x88>
    8ef0:	e320f000 	nop	{0}
    8ef4:	e51b3010 	ldr	r3, [fp, #-16]
    8ef8:	e5933014 	ldr	r3, [r3, #20]
    8efc:	e2033001 	and	r3, r3, #1
    8f00:	e3530000 	cmp	r3, #0
    8f04:	0afffffa 	beq	8ef4 <shell_main+0x34>
    8f08:	e51b3010 	ldr	r3, [fp, #-16]
    8f0c:	e5933000 	ldr	r3, [r3]
    8f10:	e6ef2073 	uxtb	r2, r3
    8f14:	e51b300c 	ldr	r3, [fp, #-12]
    8f18:	e5c32000 	strb	r2, [r3]
    8f1c:	e51b300c 	ldr	r3, [fp, #-12]
    8f20:	e5d33000 	ldrb	r3, [r3]
    8f24:	e1a02003 	mov	r2, r3
    8f28:	e51b3010 	ldr	r3, [fp, #-16]
    8f2c:	e5832000 	str	r2, [r3]
    8f30:	e51b300c 	ldr	r3, [fp, #-12]
    8f34:	e2833001 	add	r3, r3, #1
    8f38:	e50b300c 	str	r3, [fp, #-12]
    8f3c:	e51b3008 	ldr	r3, [fp, #-8]
    8f40:	e2833001 	add	r3, r3, #1
    8f44:	e50b3008 	str	r3, [fp, #-8]
    8f48:	e51b3008 	ldr	r3, [fp, #-8]
    8f4c:	e3530009 	cmp	r3, #9
    8f50:	daffffe6 	ble	8ef0 <shell_main+0x30>
    8f54:	e59f0008 	ldr	r0, [pc, #8]	; 8f64 <shell_main+0xa4>
    8f58:	ebffff80 	bl	8d60 <RPI_printString>
    8f5c:	eaffffde 	b	8edc <shell_main+0x1c>
    8f60:	00009420 	andeq	r9, r0, r0, lsr #8
    8f64:	00009444 	andeq	r9, r0, r4, asr #8

00008f68 <SVC_Handler_Main>:
    8f68:	e92d4800 	push	{fp, lr}
    8f6c:	e28db004 	add	fp, sp, #4
    8f70:	e24dd020 	sub	sp, sp, #32
    8f74:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
    8f78:	e50b1024 	str	r1, [fp, #-36]	; 0xffffffdc
    8f7c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    8f80:	e3530000 	cmp	r3, #0
    8f84:	1a00000e 	bne	8fc4 <SVC_Handler_Main+0x5c>
    8f88:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    8f8c:	e5933000 	ldr	r3, [r3]
    8f90:	e50b3008 	str	r3, [fp, #-8]
    8f94:	ebfffeeb 	bl	8b48 <RPI_GetMiniUart>
    8f98:	e50b000c 	str	r0, [fp, #-12]
    8f9c:	e320f000 	nop	{0}
    8fa0:	e51b300c 	ldr	r3, [fp, #-12]
    8fa4:	e5933014 	ldr	r3, [r3, #20]
    8fa8:	e2033020 	and	r3, r3, #32
    8fac:	e3530000 	cmp	r3, #0
    8fb0:	0afffffa 	beq	8fa0 <SVC_Handler_Main+0x38>
    8fb4:	e51b300c 	ldr	r3, [fp, #-12]
    8fb8:	e51b2008 	ldr	r2, [fp, #-8]
    8fbc:	e5832000 	str	r2, [r3]
    8fc0:	ea000019 	b	902c <SVC_Handler_Main+0xc4>
    8fc4:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    8fc8:	e3530001 	cmp	r3, #1
    8fcc:	1a000010 	bne	9014 <SVC_Handler_Main+0xac>
    8fd0:	ebfffd75 	bl	85ac <getRunningProcess>
    8fd4:	e50b0010 	str	r0, [fp, #-16]
    8fd8:	ebfffd7c 	bl	85d0 <getNextProcess>
    8fdc:	e50b0014 	str	r0, [fp, #-20]	; 0xffffffec
    8fe0:	e51b3010 	ldr	r3, [fp, #-16]
    8fe4:	e3a02002 	mov	r2, #2
    8fe8:	e5832044 	str	r2, [r3, #68]	; 0x44
    8fec:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8ff0:	e3a02001 	mov	r2, #1
    8ff4:	e5832044 	str	r2, [r3, #68]	; 0x44
    8ff8:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
    8ffc:	ebfffd5e 	bl	857c <setRunningProcess>
    9000:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    9004:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
    9008:	e51b0010 	ldr	r0, [fp, #-16]
    900c:	eb0000af 	bl	92d0 <_context_switch>
    9010:	ea000005 	b	902c <SVC_Handler_Main+0xc4>
    9014:	e3a03033 	mov	r3, #51	; 0x33
    9018:	e54b3015 	strb	r3, [fp, #-21]	; 0xffffffeb
    901c:	e55b3015 	ldrb	r3, [fp, #-21]	; 0xffffffeb
    9020:	e1a00003 	mov	r0, r3
    9024:	ebffff1f 	bl	8ca8 <RPI_WriteToMiniUart>
    9028:	eafffffb 	b	901c <SVC_Handler_Main+0xb4>
    902c:	e24bd004 	sub	sp, fp, #4
    9030:	e8bd8800 	pop	{fp, pc}

00009034 <fifo_init>:
    9034:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    9038:	e28db000 	add	fp, sp, #0
    903c:	e24dd00c 	sub	sp, sp, #12
    9040:	e50b0008 	str	r0, [fp, #-8]
    9044:	e51b3008 	ldr	r3, [fp, #-8]
    9048:	e3a02000 	mov	r2, #0
    904c:	e583200c 	str	r2, [r3, #12]
    9050:	e51b3008 	ldr	r3, [fp, #-8]
    9054:	e3a02000 	mov	r2, #0
    9058:	e5832010 	str	r2, [r3, #16]
    905c:	e51b3008 	ldr	r3, [fp, #-8]
    9060:	e3a0200a 	mov	r2, #10
    9064:	e5832014 	str	r2, [r3, #20]
    9068:	e320f000 	nop	{0}
    906c:	e28bd000 	add	sp, fp, #0
    9070:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    9074:	e12fff1e 	bx	lr

00009078 <fifo_read>:
    9078:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    907c:	e28db000 	add	fp, sp, #0
    9080:	e24dd01c 	sub	sp, sp, #28
    9084:	e50b0010 	str	r0, [fp, #-16]
    9088:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    908c:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    9090:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    9094:	e50b300c 	str	r3, [fp, #-12]
    9098:	e3a03000 	mov	r3, #0
    909c:	e50b3008 	str	r3, [fp, #-8]
    90a0:	ea000024 	b	9138 <fifo_read+0xc0>
    90a4:	e51b3010 	ldr	r3, [fp, #-16]
    90a8:	e5932010 	ldr	r2, [r3, #16]
    90ac:	e51b3010 	ldr	r3, [fp, #-16]
    90b0:	e593300c 	ldr	r3, [r3, #12]
    90b4:	e1520003 	cmp	r2, r3
    90b8:	0a000019 	beq	9124 <fifo_read+0xac>
    90bc:	e51b300c 	ldr	r3, [fp, #-12]
    90c0:	e2832001 	add	r2, r3, #1
    90c4:	e50b200c 	str	r2, [fp, #-12]
    90c8:	e51b2010 	ldr	r2, [fp, #-16]
    90cc:	e5922010 	ldr	r2, [r2, #16]
    90d0:	e51b1010 	ldr	r1, [fp, #-16]
    90d4:	e7d12002 	ldrb	r2, [r1, r2]
    90d8:	e5c32000 	strb	r2, [r3]
    90dc:	e51b3010 	ldr	r3, [fp, #-16]
    90e0:	e5933010 	ldr	r3, [r3, #16]
    90e4:	e2832001 	add	r2, r3, #1
    90e8:	e51b3010 	ldr	r3, [fp, #-16]
    90ec:	e5832010 	str	r2, [r3, #16]
    90f0:	e51b3010 	ldr	r3, [fp, #-16]
    90f4:	e5932010 	ldr	r2, [r3, #16]
    90f8:	e51b3010 	ldr	r3, [fp, #-16]
    90fc:	e5933014 	ldr	r3, [r3, #20]
    9100:	e1520003 	cmp	r2, r3
    9104:	1a000002 	bne	9114 <fifo_read+0x9c>
    9108:	e51b3010 	ldr	r3, [fp, #-16]
    910c:	e3a02000 	mov	r2, #0
    9110:	e5832010 	str	r2, [r3, #16]
    9114:	e51b3008 	ldr	r3, [fp, #-8]
    9118:	e2833001 	add	r3, r3, #1
    911c:	e50b3008 	str	r3, [fp, #-8]
    9120:	ea000001 	b	912c <fifo_read+0xb4>
    9124:	e51b3008 	ldr	r3, [fp, #-8]
    9128:	ea000007 	b	914c <fifo_read+0xd4>
    912c:	e51b3008 	ldr	r3, [fp, #-8]
    9130:	e2833001 	add	r3, r3, #1
    9134:	e50b3008 	str	r3, [fp, #-8]
    9138:	e51b2008 	ldr	r2, [fp, #-8]
    913c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9140:	e1520003 	cmp	r2, r3
    9144:	baffffd6 	blt	90a4 <fifo_read+0x2c>
    9148:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    914c:	e1a00003 	mov	r0, r3
    9150:	e28bd000 	add	sp, fp, #0
    9154:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    9158:	e12fff1e 	bx	lr

0000915c <fifo_write>:
    915c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    9160:	e28db000 	add	fp, sp, #0
    9164:	e24dd01c 	sub	sp, sp, #28
    9168:	e50b0010 	str	r0, [fp, #-16]
    916c:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    9170:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    9174:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    9178:	e50b300c 	str	r3, [fp, #-12]
    917c:	e3a03000 	mov	r3, #0
    9180:	e50b3008 	str	r3, [fp, #-8]
    9184:	ea00002c 	b	923c <fifo_write+0xe0>
    9188:	e51b3010 	ldr	r3, [fp, #-16]
    918c:	e593300c 	ldr	r3, [r3, #12]
    9190:	e2832001 	add	r2, r3, #1
    9194:	e51b3010 	ldr	r3, [fp, #-16]
    9198:	e5933010 	ldr	r3, [r3, #16]
    919c:	e1520003 	cmp	r2, r3
    91a0:	0a00000a 	beq	91d0 <fifo_write+0x74>
    91a4:	e51b3010 	ldr	r3, [fp, #-16]
    91a8:	e593300c 	ldr	r3, [r3, #12]
    91ac:	e2832001 	add	r2, r3, #1
    91b0:	e51b3010 	ldr	r3, [fp, #-16]
    91b4:	e5933014 	ldr	r3, [r3, #20]
    91b8:	e1520003 	cmp	r2, r3
    91bc:	1a000005 	bne	91d8 <fifo_write+0x7c>
    91c0:	e51b3010 	ldr	r3, [fp, #-16]
    91c4:	e5933010 	ldr	r3, [r3, #16]
    91c8:	e3530000 	cmp	r3, #0
    91cc:	1a000001 	bne	91d8 <fifo_write+0x7c>
    91d0:	e51b3008 	ldr	r3, [fp, #-8]
    91d4:	ea00001d 	b	9250 <fifo_write+0xf4>
    91d8:	e51b3010 	ldr	r3, [fp, #-16]
    91dc:	e593200c 	ldr	r2, [r3, #12]
    91e0:	e51b300c 	ldr	r3, [fp, #-12]
    91e4:	e2831001 	add	r1, r3, #1
    91e8:	e50b100c 	str	r1, [fp, #-12]
    91ec:	e5d31000 	ldrb	r1, [r3]
    91f0:	e51b3010 	ldr	r3, [fp, #-16]
    91f4:	e7c31002 	strb	r1, [r3, r2]
    91f8:	e51b3010 	ldr	r3, [fp, #-16]
    91fc:	e593300c 	ldr	r3, [r3, #12]
    9200:	e2832001 	add	r2, r3, #1
    9204:	e51b3010 	ldr	r3, [fp, #-16]
    9208:	e583200c 	str	r2, [r3, #12]
    920c:	e51b3010 	ldr	r3, [fp, #-16]
    9210:	e593200c 	ldr	r2, [r3, #12]
    9214:	e51b3010 	ldr	r3, [fp, #-16]
    9218:	e5933014 	ldr	r3, [r3, #20]
    921c:	e1520003 	cmp	r2, r3
    9220:	1a000002 	bne	9230 <fifo_write+0xd4>
    9224:	e51b3010 	ldr	r3, [fp, #-16]
    9228:	e3a02000 	mov	r2, #0
    922c:	e583200c 	str	r2, [r3, #12]
    9230:	e51b3008 	ldr	r3, [fp, #-8]
    9234:	e2833001 	add	r3, r3, #1
    9238:	e50b3008 	str	r3, [fp, #-8]
    923c:	e51b2008 	ldr	r2, [fp, #-8]
    9240:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9244:	e1520003 	cmp	r2, r3
    9248:	baffffce 	blt	9188 <fifo_write+0x2c>
    924c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9250:	e1a00003 	mov	r0, r3
    9254:	e28bd000 	add	sp, fp, #0
    9258:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    925c:	e12fff1e 	bx	lr

00009260 <printChar>:
    9260:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    9264:	e28db000 	add	fp, sp, #0
    9268:	e24dd00c 	sub	sp, sp, #12
    926c:	e1a03000 	mov	r3, r0
    9270:	e54b3005 	strb	r3, [fp, #-5]
    9274:	ef000000 	svc	0x00000000
    9278:	e320f000 	nop	{0}
    927c:	e28bd000 	add	sp, fp, #0
    9280:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    9284:	e12fff1e 	bx	lr

00009288 <printString>:
    9288:	e92d4800 	push	{fp, lr}
    928c:	e28db004 	add	fp, sp, #4
    9290:	e24dd008 	sub	sp, sp, #8
    9294:	e50b0008 	str	r0, [fp, #-8]
    9298:	ea000005 	b	92b4 <printString+0x2c>
    929c:	e51b3008 	ldr	r3, [fp, #-8]
    92a0:	e2832001 	add	r2, r3, #1
    92a4:	e50b2008 	str	r2, [fp, #-8]
    92a8:	e5d33000 	ldrb	r3, [r3]
    92ac:	e1a00003 	mov	r0, r3
    92b0:	ebffffea 	bl	9260 <printChar>
    92b4:	e51b3008 	ldr	r3, [fp, #-8]
    92b8:	e5d33000 	ldrb	r3, [r3]
    92bc:	e3530000 	cmp	r3, #0
    92c0:	1afffff5 	bne	929c <printString+0x14>
    92c4:	e320f000 	nop	{0}
    92c8:	e24bd004 	sub	sp, fp, #4
    92cc:	e8bd8800 	pop	{fp, pc}

000092d0 <_context_switch>:
    92d0:	e14f3000 	mrs	r3, SPSR
    92d4:	e4803004 	str	r3, [r0], #4
    92d8:	e92d0003 	push	{r0, r1}
    92dc:	e1a0e002 	mov	lr, r2
    92e0:	e8be1fff 	ldm	lr!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip}
    92e4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    92e8:	e59de004 	ldr	lr, [sp, #4]
    92ec:	e8ce7fff 	stmia	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
    92f0:	e28ee03c 	add	lr, lr, #60	; 0x3c
    92f4:	e59d0000 	ldr	r0, [sp]
    92f8:	e5901000 	ldr	r1, [r0]
    92fc:	e58e1000 	str	r1, [lr]
    9300:	e59de008 	ldr	lr, [sp, #8]
    9304:	e49e0004 	ldr	r0, [lr], #4
    9308:	e161f000 	msr	SPSR_c, r0
    930c:	e8de7fff 	ldm	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
    9310:	e28ee03c 	add	lr, lr, #60	; 0x3c
    9314:	e59dd000 	ldr	sp, [sp]
    9318:	e28dd004 	add	sp, sp, #4
    931c:	e59ee000 	ldr	lr, [lr]
    9320:	e1b0f00e 	movs	pc, lr

00009324 <_start_user_process>:
    9324:	e1a0e000 	mov	lr, r0
    9328:	e49e0004 	ldr	r0, [lr], #4
    932c:	e161f000 	msr	SPSR_c, r0
    9330:	e8de7fff 	ldm	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
    9334:	e28ee03c 	add	lr, lr, #60	; 0x3c
    9338:	e59ee000 	ldr	lr, [lr]
    933c:	e1b0f00e 	movs	pc, lr

00009340 <_svc_handler>:
    9340:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
    9344:	e51e0004 	ldr	r0, [lr, #-4]
    9348:	e3c004ff 	bic	r0, r0, #-16777216	; 0xff000000
    934c:	e1a0100d 	mov	r1, sp
    9350:	e3500002 	cmp	r0, #2
    9354:	dbffff03 	blle	8f68 <SVC_Handler_Main>
    9358:	e8bd5fff 	pop	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
    935c:	e1b0f00e 	movs	pc, lr

Disassembly of section .rodata:

00009360 <.rodata>:
    9360:	72700a0d 	rsbsvc	r0, r0, #53248	; 0xd000
    9364:	7365636f 	cmnvc	r5, #-1140850687	; 0xbc000001
    9368:	6e6f2073 	mcrvs	0, 3, r2, cr15, cr3, {3}
    936c:	61792065 	cmnvs	r9, r5, rrx
    9370:	61796164 	cmnvs	r9, r4, ror #2
    9374:	002e6164 	eoreq	r6, lr, r4, ror #2
    9378:	6f200a0d 	svcvs	0x00200a0d
    937c:	6920656e 	stmdbvs	r0!, {r1, r2, r3, r5, r6, r8, sl, sp, lr}
    9380:	6f6c2073 	svcvs	0x006c2073
    9384:	796c656e 	stmdbvc	ip!, {r1, r2, r3, r5, r6, r8, sl, sp, lr}^
    9388:	0000002e 	andeq	r0, r0, lr, lsr #32
    938c:	6e6f0a0d 	vmulvs.f32	s1, s30, s26
    9390:	00002e65 	andeq	r2, r0, r5, ror #28
    9394:	72700a0d 	rsbsvc	r0, r0, #53248	; 0xd000
    9398:	7365636f 	cmnvc	r5, #-1140850687	; 0xbc000001
    939c:	2e322073 	mrccs	0, 1, r2, cr2, cr3, {3}
    93a0:	00000000 	andeq	r0, r0, r0
    93a4:	77740a0d 	ldrbvc	r0, [r4, -sp, lsl #20]!
    93a8:	6e65206f 	cdpvs	0, 6, cr2, cr5, cr15, {3}
    93ac:	2e646564 	cdpcs	5, 6, cr6, cr4, cr4, {3}
    93b0:	00000000 	andeq	r0, r0, r0
    93b4:	6f530a0d 	svcvs	0x00530a0d
    93b8:	6874656d 	ldmdavs	r4!, {r0, r2, r3, r5, r6, r8, sl, sp, lr}^
    93bc:	20676e69 	rsbcs	r6, r7, r9, ror #28
    93c0:	6d6f7266 	sfmvs	f7, 2, [pc, #-408]!	; 9230 <fifo_write+0xd4>
    93c4:	6f777420 	svcvs	0x00777420
    93c8:	0000002e 	andeq	r0, r0, lr, lsr #32
    93cc:	6f4e0a0d 	svcvs	0x004e0a0d
    93d0:	61707320 	cmnvs	r0, r0, lsr #6
    93d4:	6f206563 	svcvs	0x00206563
    93d8:	6370206e 	cmnvs	r0, #110	; 0x6e
    93dc:	Address 0x00000000000093dc is out of bounds.


Disassembly of section .data:

000093e0 <__data_start>:
    93e0:	00005000 	andeq	r5, r0, r0

000093e4 <block_limit>:
    93e4:	00005000 	andeq	r5, r0, r0

000093e8 <s_block_bucket>:
    93e8:	00000040 	andeq	r0, r0, r0, asr #32
    93ec:	00000000 	andeq	r0, r0, r0
    93f0:	00000400 	andeq	r0, r0, r0, lsl #8
    93f4:	00000000 	andeq	r0, r0, r0
    93f8:	00001000 	andeq	r1, r0, r0
    93fc:	00000000 	andeq	r0, r0, r0
    9400:	00002000 	andeq	r2, r0, r0
    9404:	00000000 	andeq	r0, r0, r0

00009408 <rpiArmTimer>:
    9408:	2000b400 	andcs	fp, r0, r0, lsl #8

0000940c <rpiGpio>:
    940c:	20200000 	eorcs	r0, r0, r0

00009410 <rpiIRQController>:
    9410:	2000b200 	andcs	fp, r0, r0, lsl #4

00009414 <rpiSystemTimer>:
    9414:	20003000 	andcs	r3, r0, r0

00009418 <rpiAux>:
    9418:	20215000 	eorcs	r5, r1, r0

0000941c <rpiMiniUart>:
    941c:	20215040 	eorcs	r5, r1, r0, asr #32

00009420 <enter_command_text.6883>:
    9420:	65746e45 	ldrbvs	r6, [r4, #-3653]!	; 0xfffff1bb
    9424:	6f632072 	svcvs	0x00632072
    9428:	6e616d6d 	cdpvs	13, 6, cr6, cr1, cr13, {3}
    942c:	61282064 			; <UNDEFINED> instruction: 0x61282064
    9430:	6520646e 	strvs	r6, [r0, #-1134]!	; 0xfffffb92
    9434:	7720646e 	strvc	r6, [r0, -lr, ror #8]!
    9438:	20687469 	rsbcs	r7, r8, r9, ror #8
    943c:	203a293b 	eorscs	r2, sl, fp, lsr r9
    9440:	00000000 	andeq	r0, r0, r0

00009444 <command_not_found_text.6882>:
    9444:	206f4e0a 	rsbcs	r4, pc, sl, lsl #28
    9448:	68637573 	stmdavs	r3!, {r0, r1, r4, r5, r6, r8, sl, ip, sp, lr}^
    944c:	6d6f6320 	stclvs	3, cr6, [pc, #-128]!	; 93d4 <_svc_handler+0x94>
    9450:	646e616d 	strbtvs	r6, [lr], #-365	; 0xfffffe93
    9454:	756f6620 	strbvc	r6, [pc, #-1568]!	; 8e3c <RPI_MiniUart_ISR+0x5c>
    9458:	0d2e646e 	cfstrseq	mvf6, [lr, #-440]!	; 0xfffffe48
    945c:	Address 0x000000000000945c is out of bounds.


Disassembly of section .bss:

00009460 <pcb>:
	...

000094f0 <current_running_proc>:
    94f0:	00000000 	andeq	r0, r0, r0

000094f4 <msCounter.5513>:
    94f4:	00000000 	andeq	r0, r0, r0

000094f8 <lit.5512>:
    94f8:	00000000 	andeq	r0, r0, r0

000094fc <fifo_buffer>:
	...

Disassembly of section .comment:

00000000 <_heap_top-0x1000>:
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
  34:	00000154 	andeq	r0, r0, r4, asr r1
	...
  40:	0000001c 	andeq	r0, r0, ip, lsl r0
  44:	01fc0002 	mvnseq	r0, r2
  48:	00040000 	andeq	r0, r4, r0
  4c:	00000000 	andeq	r0, r0, r0
  50:	00008254 	andeq	r8, r0, r4, asr r2
  54:	00000128 	andeq	r0, r0, r8, lsr #2
	...
  60:	0000001c 	andeq	r0, r0, ip, lsl r0
  64:	04310002 	ldrteq	r0, [r1], #-2
  68:	00040000 	andeq	r0, r4, r0
  6c:	00000000 	andeq	r0, r0, r0
  70:	0000837c 	andeq	r8, r0, ip, ror r3
  74:	0000015c 	andeq	r0, r0, ip, asr r1
	...
  80:	0000001c 	andeq	r0, r0, ip, lsl r0
  84:	06160002 	ldreq	r0, [r6], -r2
  88:	00040000 	andeq	r0, r4, r0
  8c:	00000000 	andeq	r0, r0, r0
  90:	000084d8 	ldrdeq	r8, [r0], -r8	; <UNPREDICTABLE>
  94:	000001f4 	strdeq	r0, [r0], -r4
	...
  a0:	0000001c 	andeq	r0, r0, ip, lsl r0
  a4:	08ed0002 	stmiaeq	sp!, {r1}^
  a8:	00040000 	andeq	r0, r4, r0
  ac:	00000000 	andeq	r0, r0, r0
  b0:	000086cc 	andeq	r8, r0, ip, asr #13
  b4:	0000003c 	andeq	r0, r0, ip, lsr r0
	...
  c0:	0000001c 	andeq	r0, r0, ip, lsl r0
  c4:	0a2d0002 	beq	b400d4 <_stack+0xac00d4>
  c8:	00040000 	andeq	r0, r4, r0
  cc:	00000000 	andeq	r0, r0, r0
  d0:	00008708 	andeq	r8, r0, r8, lsl #14
  d4:	00000158 	andeq	r0, r0, r8, asr r1
	...
  e0:	0000001c 	andeq	r0, r0, ip, lsl r0
  e4:	0f0b0002 	svceq	0x000b0002
  e8:	00040000 	andeq	r0, r4, r0
  ec:	00000000 	andeq	r0, r0, r0
  f0:	00008860 	andeq	r8, r0, r0, ror #16
  f4:	00000248 	andeq	r0, r0, r8, asr #4
	...
 100:	0000001c 	andeq	r0, r0, ip, lsl r0
 104:	114a0002 	cmpne	sl, r2
 108:	00040000 	andeq	r0, r4, r0
 10c:	00000000 	andeq	r0, r0, r0
 110:	00008aa8 	andeq	r8, r0, r8, lsr #21
 114:	0000007c 	andeq	r0, r0, ip, ror r0
	...
 120:	0000001c 	andeq	r0, r0, ip, lsl r0
 124:	12910002 	addsne	r0, r1, #2
 128:	00040000 	andeq	r0, r4, r0
 12c:	00000000 	andeq	r0, r0, r0
 130:	00008b24 	andeq	r8, r0, r4, lsr #22
 134:	0000039c 	muleq	r0, ip, r3
	...
 140:	0000001c 	andeq	r0, r0, ip, lsl r0
 144:	19880002 	stmibne	r8, {r1}
 148:	00040000 	andeq	r0, r4, r0
 14c:	00000000 	andeq	r0, r0, r0
 150:	00008ec0 	andeq	r8, r0, r0, asr #29
 154:	000000a8 	andeq	r0, r0, r8, lsr #1
	...
 160:	0000001c 	andeq	r0, r0, ip, lsl r0
 164:	237f0002 	cmncs	pc, #2
 168:	00040000 	andeq	r0, r4, r0
 16c:	00000000 	andeq	r0, r0, r0
 170:	00008f68 	andeq	r8, r0, r8, ror #30
 174:	000000cc 	andeq	r0, r0, ip, asr #1
	...
 180:	0000001c 	andeq	r0, r0, ip, lsl r0
 184:	266b0002 	strbtcs	r0, [fp], -r2
 188:	00040000 	andeq	r0, r4, r0
 18c:	00000000 	andeq	r0, r0, r0
 190:	00009034 	andeq	r9, r0, r4, lsr r0
 194:	0000022c 	andeq	r0, r0, ip, lsr #4
	...
 1a0:	0000001c 	andeq	r0, r0, ip, lsl r0
 1a4:	282b0002 	stmdacs	fp!, {r1}
 1a8:	00040000 	andeq	r0, r4, r0
 1ac:	00000000 	andeq	r0, r0, r0
 1b0:	00009260 	andeq	r9, r0, r0, ror #4
 1b4:	00000070 	andeq	r0, r0, r0, ror r0
	...
 1c0:	0000001c 	andeq	r0, r0, ip, lsl r0
 1c4:	28e20002 	stmiacs	r2!, {r1}^
 1c8:	00040000 	andeq	r0, r4, r0
 1cc:	00000000 	andeq	r0, r0, r0
 1d0:	000092d0 	ldrdeq	r9, [r0], -r0
 1d4:	00000070 	andeq	r0, r0, r0, ror r0
	...
 1e0:	0000001c 	andeq	r0, r0, ip, lsl r0
 1e4:	29560002 	ldmdbcs	r6, {r1}^
 1e8:	00040000 	andeq	r0, r4, r0
 1ec:	00000000 	andeq	r0, r0, r0
 1f0:	00008000 	andeq	r8, r0, r0
 1f4:	00000094 	muleq	r0, r4, r0
	...
 200:	0000001c 	andeq	r0, r0, ip, lsl r0
 204:	29c60002 	stmibcs	r6, {r1}^
 208:	00040000 	andeq	r0, r4, r0
 20c:	00000000 	andeq	r0, r0, r0
 210:	00009340 	andeq	r9, r0, r0, asr #6
 214:	00000020 	andeq	r0, r0, r0, lsr #32
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
      98:	01330704 	teqeq	r3, r4, lsl #14
      9c:	04090000 	streq	r0, [r9], #-0
      a0:	0000002c 	andeq	r0, r0, ip, lsr #32
      a4:	00015300 	andeq	r5, r1, r0, lsl #6
      a8:	89000400 	stmdbhi	r0, {sl}
      ac:	04000000 	streq	r0, [r0], #-0
      b0:	00004401 	andeq	r4, r0, r1, lsl #8
      b4:	01680c00 	cmneq	r8, r0, lsl #24
      b8:	81000000 	mrshi	r0, (UNDEF: 0)
      bc:	01540000 	cmpeq	r4, r0
      c0:	00680000 	rsbeq	r0, r8, r0
      c4:	01020000 	mrseq	r0, (UNDEF: 2)
      c8:	0000ec06 	andeq	lr, r0, r6, lsl #24
      cc:	08010200 	stmdaeq	r1, {r9}
      d0:	000000ea 	andeq	r0, r0, sl, ror #1
      d4:	5e050202 	cdppl	2, 0, cr0, cr5, cr2, {0}
      d8:	02000001 	andeq	r0, r0, #1
      dc:	00f80702 	rscseq	r0, r8, r2, lsl #14
      e0:	04020000 	streq	r0, [r2], #-0
      e4:	00014e05 	andeq	r4, r1, r5, lsl #28
      e8:	07040200 	streq	r0, [r4, -r0, lsl #4]
      ec:	0000012e 	andeq	r0, r0, lr, lsr #2
      f0:	49050802 	stmdbmi	r5, {r1, fp}
      f4:	02000001 	andeq	r0, r0, #1
      f8:	01290708 			; <UNDEFINED> instruction: 0x01290708
      fc:	04030000 	streq	r0, [r3], #-0
     100:	746e6905 	strbtvc	r6, [lr], #-2309	; 0xfffff6fb
     104:	07040200 	streq	r0, [r4, -r0, lsl #4]
     108:	00000133 	andeq	r0, r0, r3, lsr r1
     10c:	0000c804 	andeq	ip, r0, r4, lsl #16
     110:	bc240100 	stflts	f0, [r4], #-0
     114:	98000081 	stmdals	r0, {r0, r7}
     118:	01000000 	mrseq	r0, (UNDEF: 0)
     11c:	0000a79c 	muleq	r0, ip, r7
     120:	011f0500 	tsteq	pc, r0, lsl #10
     124:	26010000 	strcs	r0, [r1], -r0
     128:	000000a7 	andeq	r0, r0, r7, lsr #1
     12c:	05689102 	strbeq	r9, [r8, #-258]!	; 0xfffffefe
     130:	00000193 	muleq	r0, r3, r1
     134:	00a72701 	adceq	r2, r7, r1, lsl #14
     138:	91020000 	mrsls	r0, (UNDEF: 2)
     13c:	01130558 	tsteq	r3, r8, asr r5
     140:	28010000 	stmdacs	r1, {}	; <UNPREDICTABLE>
     144:	000000c5 	andeq	r0, r0, r5, asr #1
     148:	00409102 	subeq	r9, r0, r2, lsl #2
     14c:	0000be06 	andeq	fp, r0, r6, lsl #28
     150:	0000b700 	andeq	fp, r0, r0, lsl #14
     154:	00b70700 	adcseq	r0, r7, r0, lsl #14
     158:	000c0000 	andeq	r0, ip, r0
     15c:	40070402 	andmi	r0, r7, r2, lsl #8
     160:	02000001 	andeq	r0, r0, #1
     164:	00f30801 	rscseq	r0, r3, r1, lsl #16
     168:	be060000 	cdplt	0, 0, cr0, cr6, cr0, {0}
     16c:	d5000000 	strle	r0, [r0, #-0]
     170:	07000000 	streq	r0, [r0, -r0]
     174:	000000b7 	strheq	r0, [r0], -r7
     178:	b6040015 			; <UNDEFINED> instruction: 0xb6040015
     17c:	01000000 	mrseq	r0, (UNDEF: 0)
     180:	0081140f 	addeq	r1, r1, pc, lsl #8
     184:	0000a800 	andeq	sl, r0, r0, lsl #16
     188:	159c0100 	ldrne	r0, [ip, #256]	; 0x100
     18c:	05000001 	streq	r0, [r0, #-1]
     190:	000000da 	ldrdeq	r0, [r0], -sl
     194:	01151101 	tsteq	r5, r1, lsl #2
     198:	91020000 	mrsls	r0, (UNDEF: 2)
     19c:	01570560 	cmpeq	r7, r0, ror #10
     1a0:	12010000 	andne	r0, r1, #0
     1a4:	00000125 	andeq	r0, r0, r5, lsr #2
     1a8:	054c9102 	strbeq	r9, [ip, #-258]	; 0xfffffefe
     1ac:	000000e1 	andeq	r0, r0, r1, ror #1
     1b0:	01351301 	teqeq	r5, r1, lsl #6
     1b4:	91020000 	mrsls	r0, (UNDEF: 2)
     1b8:	be060044 	cdplt	0, 0, cr0, cr6, cr4, {2}
     1bc:	25000000 	strcs	r0, [r0, #-0]
     1c0:	07000001 	streq	r0, [r0, -r1]
     1c4:	000000b7 	strheq	r0, [r0], -r7
     1c8:	be060017 	mcrlt	0, 0, r0, cr6, cr7, {0}
     1cc:	35000000 	strcc	r0, [r0, #-0]
     1d0:	07000001 	streq	r0, [r0, -r1]
     1d4:	000000b7 	strheq	r0, [r0], -r7
     1d8:	be060011 	mcrlt	0, 0, r0, cr6, cr1, {0}
     1dc:	45000000 	strmi	r0, [r0, #-0]
     1e0:	07000001 	streq	r0, [r0, -r1]
     1e4:	000000b7 	strheq	r0, [r0], -r7
     1e8:	0b080006 	bleq	200208 <_stack+0x180208>
     1ec:	01000001 	tsteq	r0, r1
     1f0:	00810007 	addeq	r0, r1, r7
     1f4:	00001400 	andeq	r1, r0, r0, lsl #8
     1f8:	009c0100 	addseq	r0, ip, r0, lsl #2
     1fc:	00000231 	andeq	r0, r0, r1, lsr r2
     200:	01040004 	tsteq	r4, r4
     204:	01040000 	mrseq	r0, (UNDEF: 4)
     208:	00000044 	andeq	r0, r0, r4, asr #32
     20c:	0001cb0c 	andeq	ip, r1, ip, lsl #22
     210:	00825400 	addeq	r5, r2, r0, lsl #8
     214:	00012800 	andeq	r2, r1, r0, lsl #16
     218:	0000e300 	andeq	lr, r0, r0, lsl #6
     21c:	06010200 	streq	r0, [r1], -r0, lsl #4
     220:	000000ec 	andeq	r0, r0, ip, ror #1
     224:	ea080102 	b	200634 <_stack+0x180634>
     228:	02000000 	andeq	r0, r0, #0
     22c:	015e0502 	cmpeq	lr, r2, lsl #10
     230:	02020000 	andeq	r0, r2, #0
     234:	0000f807 	andeq	pc, r0, r7, lsl #16
     238:	05040200 	streq	r0, [r4, #-512]	; 0xfffffe00
     23c:	0000014e 	andeq	r0, r0, lr, asr #2
     240:	0001c003 	andeq	ip, r1, r3
     244:	4f410200 	svcmi	0x00410200
     248:	02000000 	andeq	r0, r0, #0
     24c:	012e0704 			; <UNDEFINED> instruction: 0x012e0704
     250:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
     254:	00014905 	andeq	r4, r1, r5, lsl #18
     258:	07080200 	streq	r0, [r8, -r0, lsl #4]
     25c:	00000129 	andeq	r0, r0, r9, lsr #2
     260:	69050404 	stmdbvs	r5, {r2, sl}
     264:	0200746e 	andeq	r7, r0, #1845493760	; 0x6e000000
     268:	01330704 	teqeq	r3, r4, lsl #14
     26c:	c2030000 	andgt	r0, r3, #0
     270:	03000001 	movweq	r0, #1
     274:	00004430 	andeq	r4, r0, r0, lsr r4
     278:	00720500 	rsbseq	r0, r2, r0, lsl #10
     27c:	a5030000 	strge	r0, [r3, #-0]
     280:	04000001 	streq	r0, [r0], #-1
     284:	00007d12 	andeq	r7, r0, r2, lsl sp
     288:	07040200 	streq	r0, [r4, -r0, lsl #4]
     28c:	00000140 	andeq	r0, r0, r0, asr #2
     290:	f3080102 	vrhadd.u8	d0, d8, d2
     294:	06000000 	streq	r0, [r0], -r0
     298:	360f0534 			; <UNDEFINED> instruction: 0x360f0534
     29c:	07000001 	streq	r0, [r0, -r1]
     2a0:	05003072 	streq	r3, [r0, #-114]	; 0xffffff8e
     2a4:	00008210 	andeq	r8, r0, r0, lsl r2
     2a8:	72070000 	andvc	r0, r7, #0
     2ac:	11050031 	tstne	r5, r1, lsr r0
     2b0:	00000082 	andeq	r0, r0, r2, lsl #1
     2b4:	32720704 	rsbscc	r0, r2, #4, 14	; 0x100000
     2b8:	82120500 	andshi	r0, r2, #0, 10
     2bc:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
     2c0:	00337207 	eorseq	r7, r3, r7, lsl #4
     2c4:	00821305 	addeq	r1, r2, r5, lsl #6
     2c8:	070c0000 	streq	r0, [ip, -r0]
     2cc:	05003472 	streq	r3, [r0, #-1138]	; 0xfffffb8e
     2d0:	00008214 	andeq	r8, r0, r4, lsl r2
     2d4:	72071000 	andvc	r1, r7, #0
     2d8:	15050035 	strne	r0, [r5, #-53]	; 0xffffffcb
     2dc:	00000082 	andeq	r0, r0, r2, lsl #1
     2e0:	36720714 			; <UNDEFINED> instruction: 0x36720714
     2e4:	82160500 	andshi	r0, r6, #0, 10
     2e8:	18000000 	stmdane	r0, {}	; <UNPREDICTABLE>
     2ec:	00377207 	eorseq	r7, r7, r7, lsl #4
     2f0:	00821705 	addeq	r1, r2, r5, lsl #14
     2f4:	071c0000 	ldreq	r0, [ip, -r0]
     2f8:	05003872 	streq	r3, [r0, #-2162]	; 0xfffff78e
     2fc:	00008218 	andeq	r8, r0, r8, lsl r2
     300:	72072000 	andvc	r2, r7, #0
     304:	19050039 	stmdbne	r5, {r0, r3, r4, r5}
     308:	00000082 	andeq	r0, r0, r2, lsl #1
     30c:	31720724 	cmncc	r2, r4, lsr #14
     310:	1a050030 	bne	1403d8 <_stack+0xc03d8>
     314:	00000082 	andeq	r0, r0, r2, lsl #1
     318:	31720728 	cmncc	r2, r8, lsr #14
     31c:	1b050031 	blne	1403e8 <_stack+0xc03e8>
     320:	00000082 	andeq	r0, r0, r2, lsl #1
     324:	3172072c 	cmncc	r2, ip, lsr #14
     328:	1c050032 	stcne	0, cr0, [r5], {50}	; 0x32
     32c:	00000082 	andeq	r0, r0, r2, lsl #1
     330:	0e030030 	mcreq	0, 0, r0, cr3, cr0, {1}
     334:	05000002 	streq	r0, [r0, #-2]
     338:	00009b1d 	andeq	r9, r0, sp, lsl fp
     33c:	05480600 	strbeq	r0, [r8, #-1536]	; 0xfffffa00
     340:	00018f1f 	andeq	r8, r1, pc, lsl pc
     344:	0dea0800 	stcleq	8, cr0, [sl]
     348:	20050000 	andcs	r0, r5, r0
     34c:	00000082 	andeq	r0, r0, r2, lsl #1
     350:	02090800 	andeq	r0, r9, #0, 16
     354:	21050000 	mrscs	r0, (UNDEF: 5)
     358:	00000136 	andeq	r0, r0, r6, lsr r1
     35c:	70730704 	rsbsvc	r0, r3, r4, lsl #14
     360:	82220500 	eorhi	r0, r2, #0, 10
     364:	38000000 	stmdacc	r0, {}	; <UNPREDICTABLE>
     368:	00726c07 	rsbseq	r6, r2, r7, lsl #24
     36c:	00822305 	addeq	r2, r2, r5, lsl #6
     370:	073c0000 	ldreq	r0, [ip, -r0]!
     374:	05006370 	streq	r6, [r0, #-880]	; 0xfffffc90
     378:	00008224 	andeq	r8, r0, r4, lsr #4
     37c:	a7084000 	strge	r4, [r8, -r0]
     380:	0500000d 	streq	r0, [r0, #-13]
     384:	00007d25 	andeq	r7, r0, r5, lsr #26
     388:	03004400 	movweq	r4, #1024	; 0x400
     38c:	00000201 	andeq	r0, r0, r1, lsl #4
     390:	01412605 	cmpeq	r1, r5, lsl #12
     394:	18090000 	stmdane	r9, {}	; <UNPREDICTABLE>
     398:	01000002 	tsteq	r0, r2
     39c:	0082701a 	addeq	r7, r2, sl, lsl r0
     3a0:	00010c00 	andeq	r0, r1, r0, lsl #24
     3a4:	f49c0100 			; <UNDEFINED> instruction: 0xf49c0100
     3a8:	0a000001 	beq	3b4 <CPSR_IRQ_INHIBIT+0x334>
     3ac:	01003072 	tsteq	r0, r2, ror r0
     3b0:	00006b1a 	andeq	r6, r0, sl, lsl fp
     3b4:	5c910200 	lfmpl	f0, 4, [r1], {0}
     3b8:	0031720a 	eorseq	r7, r1, sl, lsl #4
     3bc:	006b1a01 	rsbeq	r1, fp, r1, lsl #20
     3c0:	91020000 	mrsls	r0, (UNDEF: 2)
     3c4:	01b20b58 			; <UNDEFINED> instruction: 0x01b20b58
     3c8:	1a010000 	bne	403d0 <__bss_end__+0x36ebc>
     3cc:	0000006b 	andeq	r0, r0, fp, rrx
     3d0:	0c549102 	ldfeqp	f1, [r4], {2}
     3d4:	00727265 	rsbseq	r7, r2, r5, ror #4
     3d8:	01f44001 	mvnseq	r4, r1
     3dc:	91020000 	mrsls	r0, (UNDEF: 2)
     3e0:	01b80d60 			; <UNDEFINED> instruction: 0x01b80d60
     3e4:	44010000 	strmi	r0, [r1], #-0
     3e8:	00000204 	andeq	r0, r0, r4, lsl #4
     3ec:	00749102 	rsbseq	r9, r4, r2, lsl #2
     3f0:	0000940e 	andeq	r9, r0, lr, lsl #8
     3f4:	00020400 	andeq	r0, r2, r0, lsl #8
     3f8:	008d0f00 	addeq	r0, sp, r0, lsl #30
     3fc:	00120000 	andseq	r0, r2, r0
     400:	018f0410 	orreq	r0, pc, r0, lsl r4	; <UNPREDICTABLE>
     404:	f7090000 			; <UNDEFINED> instruction: 0xf7090000
     408:	01000001 	tsteq	r0, r1
     40c:	00825410 	addeq	r5, r2, r0, lsl r4
     410:	00001c00 	andeq	r1, r0, r0, lsl #24
     414:	2e9c0100 	fmlcse	f0, f4, f0
     418:	0b000002 	bleq	428 <CPSR_IRQ_INHIBIT+0x3a8>
     41c:	0000019d 	muleq	r0, sp, r1
     420:	022e1001 	eoreq	r1, lr, #1
     424:	91020000 	mrsls	r0, (UNDEF: 2)
     428:	04100074 	ldreq	r0, [r0], #-116	; 0xffffff8c
     42c:	00000094 	muleq	r0, r4, r0
     430:	0001e100 	andeq	lr, r1, r0, lsl #2
     434:	dc000400 	cfstrsle	mvf0, [r0], {-0}
     438:	04000001 	streq	r0, [r0], #-1
     43c:	00004401 	andeq	r4, r0, r1, lsl #8
     440:	02640c00 	rsbeq	r0, r4, #0, 24
     444:	837c0000 	cmnhi	ip, #0
     448:	015c0000 	cmpeq	ip, r0
     44c:	01fe0000 	mvnseq	r0, r0
     450:	01020000 	mrseq	r0, (UNDEF: 2)
     454:	0000ec06 	andeq	lr, r0, r6, lsl #24
     458:	08010200 	stmdaeq	r1, {r9}
     45c:	000000ea 	andeq	r0, r0, sl, ror #1
     460:	5e050202 	cdppl	2, 0, cr0, cr5, cr2, {0}
     464:	02000001 	andeq	r0, r0, #1
     468:	00f80702 	rscseq	r0, r8, r2, lsl #14
     46c:	04020000 	streq	r0, [r2], #-0
     470:	00014e05 	andeq	r4, r1, r5, lsl #28
     474:	01c00300 	biceq	r0, r0, r0, lsl #6
     478:	41020000 	mrsmi	r0, (UNDEF: 2)
     47c:	0000004f 	andeq	r0, r0, pc, asr #32
     480:	2e070402 	cdpcs	4, 0, cr0, cr7, cr2, {0}
     484:	02000001 	andeq	r0, r0, #1
     488:	01490508 	cmpeq	r9, r8, lsl #10
     48c:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
     490:	00012907 	andeq	r2, r1, r7, lsl #18
     494:	05040400 	streq	r0, [r4, #-1024]	; 0xfffffc00
     498:	00746e69 	rsbseq	r6, r4, r9, ror #28
     49c:	33070402 	movwcc	r0, #29698	; 0x7402
     4a0:	03000001 	movweq	r0, #1
     4a4:	000001c2 	andeq	r0, r0, r2, asr #3
     4a8:	00443003 	subeq	r3, r4, r3
     4ac:	72050000 	andvc	r0, r5, #0
     4b0:	03000000 	movweq	r0, #0
     4b4:	00000237 	andeq	r0, r0, r7, lsr r2
     4b8:	007d0504 	rsbseq	r0, sp, r4, lsl #10
     4bc:	82060000 	andhi	r0, r6, #0
     4c0:	07000000 	streq	r0, [r0, -r0]
     4c4:	00000290 	muleq	r0, r0, r2
     4c8:	cf07040c 	svcgt	0x0007040c
     4cc:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
     4d0:	000002b3 			; <UNDEFINED> instruction: 0x000002b3
     4d4:	006b0804 	rsbeq	r0, fp, r4, lsl #16
     4d8:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
     4dc:	00000232 	andeq	r0, r0, r2, lsr r2
     4e0:	006b0904 	rsbeq	r0, fp, r4, lsl #18
     4e4:	08040000 	stmdaeq	r4, {}	; <UNPREDICTABLE>
     4e8:	00000fd0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
     4ec:	00cf0a04 	sbceq	r0, pc, r4, lsl #20
     4f0:	08080000 	stmdaeq	r8, {}	; <UNPREDICTABLE>
     4f4:	00000c51 	andeq	r0, r0, r1, asr ip
     4f8:	00d50b04 	sbcseq	r0, r5, r4, lsl #22
     4fc:	000c0000 	andeq	r0, ip, r0
     500:	00920409 	addseq	r0, r2, r9, lsl #8
     504:	280a0000 	stmdacs	sl, {}	; <UNPREDICTABLE>
     508:	e4000000 	str	r0, [r0], #-0
     50c:	0b000000 	bleq	514 <CPSR_IRQ_INHIBIT+0x494>
     510:	000000e4 	andeq	r0, r0, r4, ror #1
     514:	07040200 	streq	r0, [r4, -r0, lsl #4]
     518:	00000140 	andeq	r0, r0, r0, asr #2
     51c:	00024007 	andeq	r4, r2, r7
     520:	0e040800 	cdpeq	8, 0, cr0, cr4, cr0, {0}
     524:	00000110 	andeq	r0, r0, r0, lsl r1
     528:	00023208 	andeq	r3, r2, r8, lsl #4
     52c:	6b0f0400 	blvs	3c1534 <_stack+0x341534>
     530:	00000000 	andeq	r0, r0, r0
     534:	00025808 	andeq	r5, r2, r8, lsl #16
     538:	cf100400 	svcgt	0x00100400
     53c:	04000000 	streq	r0, [r0], #-0
     540:	02a90c00 	adceq	r0, r9, #0, 24
     544:	04010000 	streq	r0, [r1], #-0
     548:	00000028 	andeq	r0, r0, r8, lsr #32
     54c:	00024d0d 	andeq	r4, r2, sp, lsl #26
     550:	2c070100 	stfcss	f0, [r7], {-0}
     554:	05000001 	streq	r0, [r0, #-1]
     558:	0093e003 	addseq	lr, r3, r3
     55c:	28040900 	stmdacs	r4, {r8, fp}
     560:	0d000000 	stceq	0, cr0, [r0, #-0]
     564:	0000029d 	muleq	r0, sp, r2
     568:	012c0801 			; <UNDEFINED> instruction: 0x012c0801
     56c:	03050000 	movweq	r0, #20480	; 0x5000
     570:	000093e4 	andeq	r9, r0, r4, ror #7
     574:	0000eb0a 	andeq	lr, r0, sl, lsl #22
     578:	00015300 	andeq	r5, r1, r0, lsl #6
     57c:	00e40e00 	rsceq	r0, r4, r0, lsl #28
     580:	00030000 	andeq	r0, r3, r0
     584:	00023e0d 	andeq	r3, r2, sp, lsl #28
     588:	430a0100 	movwmi	r0, #41216	; 0xa100
     58c:	05000001 	streq	r0, [r0, #-1]
     590:	0093e803 	addseq	lr, r3, r3, lsl #16
     594:	0ef60f00 	cdpeq	15, 15, cr0, cr6, cr0, {0}
     598:	0c010000 	stceq	0, cr0, [r1], {-0}
     59c:	000001dc 	ldrdeq	r0, [r0], -ip
     5a0:	0000837c 	andeq	r8, r0, ip, ror r3
     5a4:	0000015c 	andeq	r0, r0, ip, asr r1
     5a8:	01dc9c01 	bicseq	r9, ip, r1, lsl #24
     5ac:	32100000 	andscc	r0, r0, #0
     5b0:	01000002 	tsteq	r0, r2
     5b4:	0000820c 	andeq	r8, r0, ip, lsl #4
     5b8:	5c910200 	lfmpl	f0, 4, [r1], {0}
     5bc:	0002460d 	andeq	r4, r2, sp, lsl #12
     5c0:	de0d0100 	adflee	f0, f5, f0
     5c4:	02000001 	andeq	r0, r0, #1
     5c8:	5d0d7491 	cfstrspl	mvf7, [sp, #-580]	; 0xfffffdbc
     5cc:	01000002 	tsteq	r0, r2
     5d0:	0000cf0e 	andeq	ip, r0, lr, lsl #30
     5d4:	70910200 	addsvc	r0, r1, r0, lsl #4
     5d8:	00842811 	addeq	r2, r4, r1, lsl r8
     5dc:	00007c00 	andeq	r7, r0, r0, lsl #24
     5e0:	022c0d00 	eoreq	r0, ip, #0, 26
     5e4:	24010000 	strcs	r0, [r1], #-0
     5e8:	0000008d 	andeq	r0, r0, sp, lsl #1
     5ec:	0d689102 	stfeqp	f1, [r8, #-8]!
     5f0:	00000224 	andeq	r0, r0, r4, lsr #4
     5f4:	008d2501 	addeq	r2, sp, r1, lsl #10
     5f8:	91020000 	mrsls	r0, (UNDEF: 2)
     5fc:	0fd00d64 	svceq	0x00d00d64
     600:	27010000 	strcs	r0, [r1, -r0]
     604:	0000012c 	andeq	r0, r0, ip, lsr #2
     608:	006c9102 	rsbeq	r9, ip, r2, lsl #2
     60c:	09041200 	stmdbeq	r4, {r9, ip}
     610:	0000eb04 	andeq	lr, r0, r4, lsl #22
     614:	02d30000 	sbcseq	r0, r3, #0
     618:	00040000 	andeq	r0, r4, r0
     61c:	000002ba 			; <UNDEFINED> instruction: 0x000002ba
     620:	00440104 	subeq	r0, r4, r4, lsl #2
     624:	ce0c0000 	cdpgt	0, 0, cr0, cr12, cr0, {0}
     628:	d8000002 	stmdale	r0, {r1}
     62c:	f4000084 	vst4.32	{d0-d3}, [r0], r4
     630:	12000001 	andne	r0, r0, #1
     634:	02000003 	andeq	r0, r0, #3
     638:	00ec0601 	rsceq	r0, ip, r1, lsl #12
     63c:	01020000 	mrseq	r0, (UNDEF: 2)
     640:	0000ea08 	andeq	lr, r0, r8, lsl #20
     644:	05020200 	streq	r0, [r2, #-512]	; 0xfffffe00
     648:	0000015e 	andeq	r0, r0, lr, asr r1
     64c:	f8070202 			; <UNDEFINED> instruction: 0xf8070202
     650:	02000000 	andeq	r0, r0, #0
     654:	014e0504 	cmpeq	lr, r4, lsl #10
     658:	c0030000 	andgt	r0, r3, r0
     65c:	02000001 	andeq	r0, r0, #1
     660:	00004f41 	andeq	r4, r0, r1, asr #30
     664:	07040200 	streq	r0, [r4, -r0, lsl #4]
     668:	0000012e 	andeq	r0, r0, lr, lsr #2
     66c:	49050802 	stmdbmi	r5, {r1, fp}
     670:	02000001 	andeq	r0, r0, #1
     674:	01290708 			; <UNDEFINED> instruction: 0x01290708
     678:	04040000 	streq	r0, [r4], #-0
     67c:	746e6905 	strbtvc	r6, [lr], #-2309	; 0xfffff6fb
     680:	07040200 	streq	r0, [r4, -r0, lsl #4]
     684:	00000133 	andeq	r0, r0, r3, lsr r1
     688:	0001c203 	andeq	ip, r1, r3, lsl #4
     68c:	44300300 	ldrtmi	r0, [r0], #-768	; 0xfffffd00
     690:	05000000 	streq	r0, [r0, #-0]
     694:	00000072 	andeq	r0, r0, r2, ror r0
     698:	0001a503 	andeq	sl, r1, r3, lsl #10
     69c:	7d120400 	cfldrsvc	mvf0, [r2, #-0]
     6a0:	06000000 	streq	r0, [r0], -r0
     6a4:	280f0534 	stmdacs	pc, {r2, r4, r5, r8, sl}	; <UNPREDICTABLE>
     6a8:	07000001 	streq	r0, [r0, -r1]
     6ac:	05003072 	streq	r3, [r0, #-114]	; 0xffffff8e
     6b0:	00008210 	andeq	r8, r0, r0, lsl r2
     6b4:	72070000 	andvc	r0, r7, #0
     6b8:	11050031 	tstne	r5, r1, lsr r0
     6bc:	00000082 	andeq	r0, r0, r2, lsl #1
     6c0:	32720704 	rsbscc	r0, r2, #4, 14	; 0x100000
     6c4:	82120500 	andshi	r0, r2, #0, 10
     6c8:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
     6cc:	00337207 	eorseq	r7, r3, r7, lsl #4
     6d0:	00821305 	addeq	r1, r2, r5, lsl #6
     6d4:	070c0000 	streq	r0, [ip, -r0]
     6d8:	05003472 	streq	r3, [r0, #-1138]	; 0xfffffb8e
     6dc:	00008214 	andeq	r8, r0, r4, lsl r2
     6e0:	72071000 	andvc	r1, r7, #0
     6e4:	15050035 	strne	r0, [r5, #-53]	; 0xffffffcb
     6e8:	00000082 	andeq	r0, r0, r2, lsl #1
     6ec:	36720714 			; <UNDEFINED> instruction: 0x36720714
     6f0:	82160500 	andshi	r0, r6, #0, 10
     6f4:	18000000 	stmdane	r0, {}	; <UNPREDICTABLE>
     6f8:	00377207 	eorseq	r7, r7, r7, lsl #4
     6fc:	00821705 	addeq	r1, r2, r5, lsl #14
     700:	071c0000 	ldreq	r0, [ip, -r0]
     704:	05003872 	streq	r3, [r0, #-2162]	; 0xfffff78e
     708:	00008218 	andeq	r8, r0, r8, lsl r2
     70c:	72072000 	andvc	r2, r7, #0
     710:	19050039 	stmdbne	r5, {r0, r3, r4, r5}
     714:	00000082 	andeq	r0, r0, r2, lsl #1
     718:	31720724 	cmncc	r2, r4, lsr #14
     71c:	1a050030 	bne	1407e4 <_stack+0xc07e4>
     720:	00000082 	andeq	r0, r0, r2, lsl #1
     724:	31720728 	cmncc	r2, r8, lsr #14
     728:	1b050031 	blne	1407f4 <_stack+0xc07f4>
     72c:	00000082 	andeq	r0, r0, r2, lsl #1
     730:	3172072c 	cmncc	r2, ip, lsr #14
     734:	1c050032 	stcne	0, cr0, [r5], {50}	; 0x32
     738:	00000082 	andeq	r0, r0, r2, lsl #1
     73c:	0e030030 	mcreq	0, 0, r0, cr3, cr0, {1}
     740:	05000002 	streq	r0, [r0, #-2]
     744:	00008d1d 	andeq	r8, r0, sp, lsl sp
     748:	05480600 	strbeq	r0, [r8, #-1536]	; 0xfffffa00
     74c:	0001811f 	andeq	r8, r1, pc, lsl r1
     750:	0dea0800 	stcleq	8, cr0, [sl]
     754:	20050000 	andcs	r0, r5, r0
     758:	00000082 	andeq	r0, r0, r2, lsl #1
     75c:	02090800 	andeq	r0, r9, #0, 16
     760:	21050000 	mrscs	r0, (UNDEF: 5)
     764:	00000128 	andeq	r0, r0, r8, lsr #2
     768:	70730704 	rsbsvc	r0, r3, r4, lsl #14
     76c:	82220500 	eorhi	r0, r2, #0, 10
     770:	38000000 	stmdacc	r0, {}	; <UNPREDICTABLE>
     774:	00726c07 	rsbseq	r6, r2, r7, lsl #24
     778:	00822305 	addeq	r2, r2, r5, lsl #6
     77c:	073c0000 	ldreq	r0, [ip, -r0]!
     780:	05006370 	streq	r6, [r0, #-880]	; 0xfffffc90
     784:	00008224 	andeq	r8, r0, r4, lsr #4
     788:	a7084000 	strge	r4, [r8, -r0]
     78c:	0500000d 	streq	r0, [r0, #-13]
     790:	00007d25 	andeq	r7, r0, r5, lsr #26
     794:	03004400 	movweq	r4, #1024	; 0x400
     798:	00000201 	andeq	r0, r0, r1, lsl #4
     79c:	01332605 	teqeq	r3, r5, lsl #12
     7a0:	37030000 	strcc	r0, [r3, -r0]
     7a4:	06000002 	streq	r0, [r0], -r2
     7a8:	00007d05 	andeq	r7, r0, r5, lsl #26
     7ac:	07040200 	streq	r0, [r4, -r0, lsl #4]
     7b0:	00000140 	andeq	r0, r0, r0, asr #2
     7b4:	00018109 	andeq	r8, r1, r9, lsl #2
     7b8:	0001ae00 	andeq	sl, r1, r0, lsl #28
     7bc:	01970a00 	orrseq	r0, r7, r0, lsl #20
     7c0:	00010000 	andeq	r0, r1, r0
     7c4:	6263700b 	rsbvs	r7, r3, #11
     7c8:	9e040100 	adflss	f0, f4, f0
     7cc:	05000001 	streq	r0, [r0, #-1]
     7d0:	00946003 	addseq	r6, r4, r3
     7d4:	02b90c00 	adcseq	r0, r9, #0, 24
     7d8:	05010000 	streq	r0, [r1, #-0]
     7dc:	000001d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
     7e0:	94f00305 	ldrbtls	r0, [r0], #773	; 0x305
     7e4:	040d0000 	streq	r0, [sp], #-0
     7e8:	00000181 	andeq	r0, r0, r1, lsl #3
     7ec:	0002fb0e 	andeq	pc, r2, lr, lsl #22
     7f0:	d0310100 	eorsle	r0, r1, r0, lsl #2
     7f4:	44000001 	strmi	r0, [r0], #-1
     7f8:	88000086 	stmdahi	r0, {r1, r2, r7}
     7fc:	01000000 	mrseq	r0, (UNDEF: 0)
     800:	00020a9c 	muleq	r2, ip, sl
     804:	00690b00 	rsbeq	r0, r9, r0, lsl #22
     808:	00643301 	rsbeq	r3, r4, r1, lsl #6
     80c:	91020000 	mrsls	r0, (UNDEF: 2)
     810:	03330c74 	teqeq	r3, #116, 24	; 0x7400
     814:	35010000 	strcc	r0, [r1, #-0]
     818:	000001d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
     81c:	00709102 	rsbseq	r9, r0, r2, lsl #2
     820:	00033a0e 	andeq	r3, r3, lr, lsl #20
     824:	d0210100 	eorle	r0, r1, r0, lsl #2
     828:	d0000001 	andle	r0, r0, r1
     82c:	74000085 	strvc	r0, [r0], #-133	; 0xffffff7b
     830:	01000000 	mrseq	r0, (UNDEF: 0)
     834:	00023e9c 	muleq	r2, ip, lr
     838:	00690b00 	rsbeq	r0, r9, r0, lsl #22
     83c:	00642301 	rsbeq	r2, r4, r1, lsl #6
     840:	91020000 	mrsls	r0, (UNDEF: 2)
     844:	031d0c74 	tsteq	sp, #116, 24	; 0x7400
     848:	24010000 	strcs	r0, [r1], #-0
     84c:	000001d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
     850:	00709102 	rsbseq	r9, r0, r2, lsl #2
     854:	00030b0f 	andeq	r0, r3, pc, lsl #22
     858:	d01c0100 	andsle	r0, ip, r0, lsl #2
     85c:	ac000001 	stcge	0, cr0, [r0], {1}
     860:	24000085 	strcs	r0, [r0], #-133	; 0xffffff7b
     864:	01000000 	mrseq	r0, (UNDEF: 0)
     868:	0349109c 	movteq	r1, #37020	; 0x909c
     86c:	17010000 	strne	r0, [r1, -r0]
     870:	0000857c 	andeq	r8, r0, ip, ror r5
     874:	00000030 	andeq	r0, r0, r0, lsr r0
     878:	02779c01 	rsbseq	r9, r7, #256	; 0x100
     87c:	c9110000 	ldmdbgt	r1, {}	; <UNPREDICTABLE>
     880:	01000002 	tsteq	r0, r2
     884:	0001d017 	andeq	sp, r1, r7, lsl r0
     888:	74910200 	ldrvc	r0, [r1], #512	; 0x200
     88c:	03251200 			; <UNDEFINED> instruction: 0x03251200
     890:	07010000 	streq	r0, [r1, -r0]
     894:	000084d8 	ldrdeq	r8, [r0], -r8	; <UNPREDICTABLE>
     898:	000000a4 	andeq	r0, r0, r4, lsr #1
     89c:	02c39c01 	sbceq	r9, r3, #256	; 0x100
     8a0:	c9110000 	ldmdbgt	r1, {}	; <UNPREDICTABLE>
     8a4:	01000002 	tsteq	r0, r2
     8a8:	0001d007 	andeq	sp, r1, r7
     8ac:	6c910200 	lfmvs	f0, 4, [r1], {0}
     8b0:	00021f11 	andeq	r1, r2, r1, lsl pc
     8b4:	ca070100 	bgt	1c0cbc <_stack+0x140cbc>
     8b8:	02000002 	andeq	r0, r0, #2
     8bc:	690b6891 	stmdbvs	fp, {r0, r4, r7, fp, sp, lr}
     8c0:	64090100 	strvs	r0, [r9], #-256	; 0xffffff00
     8c4:	02000000 	andeq	r0, r0, #0
     8c8:	0e0c7491 	mcreq	4, 0, r7, cr12, cr1, {4}
     8cc:	01000002 	tsteq	r0, r2
     8d0:	0002d00a 	andeq	sp, r2, sl
     8d4:	70910200 	addsvc	r0, r1, r0, lsl #4
     8d8:	02ca1300 	sbceq	r1, sl, #0, 6
     8dc:	00140000 	andseq	r0, r4, r0
     8e0:	02c3040d 	sbceq	r0, r3, #218103808	; 0xd000000
     8e4:	040d0000 	streq	r0, [sp], #-0
     8e8:	00000082 	andeq	r0, r0, r2, lsl #1
     8ec:	00013c00 	andeq	r3, r1, r0, lsl #24
     8f0:	df000400 	svcle	0x00000400
     8f4:	04000003 	streq	r0, [r0], #-3
     8f8:	00004401 	andeq	r4, r0, r1, lsl #8
     8fc:	03770c00 	cmneq	r7, #0, 24
     900:	86cc0000 	strbhi	r0, [ip], r0
     904:	003c0000 	eorseq	r0, ip, r0
     908:	04a30000 	strteq	r0, [r3], #0
     90c:	01020000 	mrseq	r0, (UNDEF: 2)
     910:	0000ec06 	andeq	lr, r0, r6, lsl #24
     914:	08010200 	stmdaeq	r1, {r9}
     918:	000000ea 	andeq	r0, r0, sl, ror #1
     91c:	5e050202 	cdppl	2, 0, cr0, cr5, cr2, {0}
     920:	02000001 	andeq	r0, r0, #1
     924:	00f80702 	rscseq	r0, r8, r2, lsl #14
     928:	04020000 	streq	r0, [r2], #-0
     92c:	00014e05 	andeq	r4, r1, r5, lsl #28
     930:	01c00300 	biceq	r0, r0, r0, lsl #6
     934:	41020000 	mrsmi	r0, (UNDEF: 2)
     938:	0000004f 	andeq	r0, r0, pc, asr #32
     93c:	2e070402 	cdpcs	4, 0, cr0, cr7, cr2, {0}
     940:	02000001 	andeq	r0, r0, #1
     944:	01490508 	cmpeq	r9, r8, lsl #10
     948:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
     94c:	00012907 	andeq	r2, r1, r7, lsl #18
     950:	05040400 	streq	r0, [r4, #-1024]	; 0xfffffc00
     954:	00746e69 	rsbseq	r6, r4, r9, ror #28
     958:	33070402 	movwcc	r0, #29698	; 0x7402
     95c:	03000001 	movweq	r0, #1
     960:	000001c2 	andeq	r0, r0, r2, asr #3
     964:	00443003 	subeq	r3, r4, r3
     968:	72050000 	andvc	r0, r5, #0
     96c:	06000000 	streq	r0, [r0], -r0
     970:	f7280424 			; <UNDEFINED> instruction: 0xf7280424
     974:	07000000 	streq	r0, [r0, -r0]
     978:	0000035b 	andeq	r0, r0, fp, asr r3
     97c:	007d2e04 	rsbseq	r2, sp, r4, lsl #28
     980:	07000000 	streq	r0, [r0, -r0]
     984:	000003d6 	ldrdeq	r0, [r0], -r6
     988:	007d3504 	rsbseq	r3, sp, r4, lsl #10
     98c:	07040000 	streq	r0, [r4, -r0]
     990:	000003fa 	strdeq	r0, [r0], -sl
     994:	007d3c04 	rsbseq	r3, sp, r4, lsl #24
     998:	07080000 	streq	r0, [r8, -r0]
     99c:	00000413 	andeq	r0, r0, r3, lsl r4
     9a0:	007d4104 	rsbseq	r4, sp, r4, lsl #2
     9a4:	070c0000 	streq	r0, [ip, -r0]
     9a8:	000003c5 	andeq	r0, r0, r5, asr #7
     9ac:	007d4b04 	rsbseq	r4, sp, r4, lsl #22
     9b0:	07100000 	ldreq	r0, [r0, -r0]
     9b4:	000003cc 	andeq	r0, r0, ip, asr #7
     9b8:	007d5204 	rsbseq	r5, sp, r4, lsl #4
     9bc:	07140000 	ldreq	r0, [r4, -r0]
     9c0:	00000360 	andeq	r0, r0, r0, ror #6
     9c4:	007d5904 	rsbseq	r5, sp, r4, lsl #18
     9c8:	07180000 	ldreq	r0, [r8, -r0]
     9cc:	000003dc 	ldrdeq	r0, [r0], -ip
     9d0:	007d6404 	rsbseq	r6, sp, r4, lsl #8
     9d4:	071c0000 	ldreq	r0, [ip, -r0]
     9d8:	000003e7 	andeq	r0, r0, r7, ror #7
     9dc:	007d7204 	rsbseq	r7, sp, r4, lsl #4
     9e0:	00200000 	eoreq	r0, r0, r0
     9e4:	0003a903 	andeq	sl, r3, r3, lsl #18
     9e8:	82740400 	rsbshi	r0, r4, #0, 8
     9ec:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
     9f0:	000003b9 			; <UNDEFINED> instruction: 0x000003b9
     9f4:	01130e01 	tsteq	r3, r1, lsl #28
     9f8:	03050000 	movweq	r0, #20480	; 0x5000
     9fc:	00009408 	andeq	r9, r0, r8, lsl #8
     a00:	00f70409 	rscseq	r0, r7, r9, lsl #8
     a04:	020a0000 	andeq	r0, sl, #0
     a08:	01000004 	tsteq	r0, r4
     a0c:	0086f015 	addeq	pc, r6, r5, lsl r0	; <UNPREDICTABLE>
     a10:	00001800 	andeq	r1, r0, r0, lsl #16
     a14:	0b9c0100 	bleq	fe700e1c <CPSR_UNAFFECTED_BITS+0xfe700f1c>
     a18:	00000367 	andeq	r0, r0, r7, ror #6
     a1c:	01131001 	tsteq	r3, r1
     a20:	86cc0000 	strbhi	r0, [ip], r0
     a24:	00240000 	eoreq	r0, r4, r0
     a28:	9c010000 	stcls	0, cr0, [r1], {-0}
     a2c:	0004da00 	andeq	sp, r4, r0, lsl #20
     a30:	81000400 	tsthi	r0, r0, lsl #8
     a34:	04000004 	streq	r0, [r0], #-4
     a38:	00004401 	andeq	r4, r0, r1, lsl #8
     a3c:	077c0c00 	ldrbeq	r0, [ip, -r0, lsl #24]!
     a40:	87080000 	strhi	r0, [r8, -r0]
     a44:	01580000 	cmpeq	r8, r0
     a48:	059d0000 	ldreq	r0, [sp]
     a4c:	01020000 	mrseq	r0, (UNDEF: 2)
     a50:	0000ec06 	andeq	lr, r0, r6, lsl #24
     a54:	08010200 	stmdaeq	r1, {r9}
     a58:	000000ea 	andeq	r0, r0, sl, ror #1
     a5c:	5e050202 	cdppl	2, 0, cr0, cr5, cr2, {0}
     a60:	02000001 	andeq	r0, r0, #1
     a64:	00f80702 	rscseq	r0, r8, r2, lsl #14
     a68:	04020000 	streq	r0, [r2], #-0
     a6c:	00014e05 	andeq	r4, r1, r5, lsl #28
     a70:	01c00300 	biceq	r0, r0, r0, lsl #6
     a74:	41020000 	mrsmi	r0, (UNDEF: 2)
     a78:	0000004f 	andeq	r0, r0, pc, asr #32
     a7c:	2e070402 	cdpcs	4, 0, cr0, cr7, cr2, {0}
     a80:	02000001 	andeq	r0, r0, #1
     a84:	01490508 	cmpeq	r9, r8, lsl #10
     a88:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
     a8c:	00012907 	andeq	r2, r1, r7, lsl #18
     a90:	05040400 	streq	r0, [r4, #-1024]	; 0xfffffc00
     a94:	00746e69 	rsbseq	r6, r4, r9, ror #28
     a98:	33070402 	movwcc	r0, #29698	; 0x7402
     a9c:	03000001 	movweq	r0, #1
     aa0:	000001c2 	andeq	r0, r0, r2, asr #3
     aa4:	00443003 	subeq	r3, r4, r3
     aa8:	72050000 	andvc	r0, r5, #0
     aac:	06000000 	streq	r0, [r0], -r0
     ab0:	0000007d 	andeq	r0, r0, sp, ror r0
     ab4:	0001a503 	andeq	sl, r1, r3, lsl #10
     ab8:	7d120400 	cfldrsvc	mvf0, [r2, #-0]
     abc:	03000000 	movweq	r0, #0
     ac0:	000006a0 	andeq	r0, r0, r0, lsr #13
     ac4:	00821304 	addeq	r1, r2, r4, lsl #6
     ac8:	40030000 	andmi	r0, r3, r0
     acc:	04000008 	streq	r0, [r0], #-8
     ad0:	00007d14 	andeq	r7, r0, r4, lsl sp
     ad4:	28010700 	stmdacs	r1, {r8, r9, sl}
     ad8:	05000000 	streq	r0, [r0, #-0]
     adc:	0000e542 	andeq	lr, r0, r2, asr #10
     ae0:	07690800 	strbeq	r0, [r9, -r0, lsl #16]!
     ae4:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
     ae8:	0000067b 	andeq	r0, r0, fp, ror r6
     aec:	08ab0801 	stmiaeq	fp!, {r0, fp}
     af0:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
     af4:	000008a3 	andeq	r0, r0, r3, lsr #17
     af8:	08830803 	stmeq	r3, {r0, r1, fp}
     afc:	08040000 	stmdaeq	r4, {}	; <UNPREDICTABLE>
     b00:	0000088b 	andeq	r0, r0, fp, lsl #17
     b04:	08930805 	ldmeq	r3, {r0, r2, fp}
     b08:	08060000 	stmdaeq	r6, {}	; <UNPREDICTABLE>
     b0c:	0000089b 	muleq	r0, fp, r8
     b10:	47030007 	strmi	r0, [r3, -r7]
     b14:	05000007 	streq	r0, [r0, #-7]
     b18:	0000a84b 	andeq	sl, r0, fp, asr #16
     b1c:	28010700 	stmdacs	r1, {r8, r9, sl}
     b20:	05000000 	streq	r0, [r0, #-0]
     b24:	00024151 	andeq	r4, r2, r1, asr r1
     b28:	063f0800 	ldrteq	r0, [pc], -r0, lsl #16
     b2c:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
     b30:	00000649 	andeq	r0, r0, r9, asr #12
     b34:	06530801 	ldrbeq	r0, [r3], -r1, lsl #16
     b38:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
     b3c:	00000815 	andeq	r0, r0, r5, lsl r8
     b40:	065d0803 	ldrbeq	r0, [sp], -r3, lsl #16
     b44:	08040000 	stmdaeq	r4, {}	; <UNPREDICTABLE>
     b48:	00000667 	andeq	r0, r0, r7, ror #12
     b4c:	06710805 	ldrbteq	r0, [r1], -r5, lsl #16
     b50:	08060000 	stmdaeq	r6, {}	; <UNPREDICTABLE>
     b54:	0000075f 	andeq	r0, r0, pc, asr r7
     b58:	06850807 	streq	r0, [r5], r7, lsl #16
     b5c:	08080000 	stmdaeq	r8, {}	; <UNPREDICTABLE>
     b60:	0000068f 	andeq	r0, r0, pc, lsl #13
     b64:	056f0809 	strbeq	r0, [pc, #-2057]!	; 363 <CPSR_IRQ_INHIBIT+0x2e3>
     b68:	080a0000 	stmdaeq	sl, {}	; <UNPREDICTABLE>
     b6c:	0000057a 	andeq	r0, r0, sl, ror r5
     b70:	0585080b 	streq	r0, [r5, #2059]	; 0x80b
     b74:	080c0000 	stmdaeq	ip, {}	; <UNPREDICTABLE>
     b78:	00000590 	muleq	r0, r0, r5
     b7c:	059b080d 	ldreq	r0, [fp, #2061]	; 0x80d
     b80:	080e0000 	stmdaeq	lr, {}	; <UNPREDICTABLE>
     b84:	000005a6 	andeq	r0, r0, r6, lsr #11
     b88:	05b1080f 	ldreq	r0, [r1, #2063]!	; 0x80f
     b8c:	08100000 	ldmdaeq	r0, {}	; <UNPREDICTABLE>
     b90:	000005bc 			; <UNDEFINED> instruction: 0x000005bc
     b94:	05c70811 	strbeq	r0, [r7, #2065]	; 0x811
     b98:	08120000 	ldmdaeq	r2, {}	; <UNPREDICTABLE>
     b9c:	000005d2 	ldrdeq	r0, [r0], -r2
     ba0:	04ee0813 	strbteq	r0, [lr], #2067	; 0x813
     ba4:	08140000 	ldmdaeq	r4, {}	; <UNPREDICTABLE>
     ba8:	000006ad 	andeq	r0, r0, sp, lsr #13
     bac:	06b80815 	ssateq	r0, #25, r5, lsl #16
     bb0:	08160000 	ldmdaeq	r6, {}	; <UNPREDICTABLE>
     bb4:	000006c3 	andeq	r0, r0, r3, asr #13
     bb8:	06ce0817 			; <UNDEFINED> instruction: 0x06ce0817
     bbc:	08180000 	ldmdaeq	r8, {}	; <UNPREDICTABLE>
     bc0:	000006d9 	ldrdeq	r0, [r0], -r9
     bc4:	06e40819 	usateq	r0, #4, r9, lsl #16
     bc8:	081a0000 	ldmdaeq	sl, {}	; <UNPREDICTABLE>
     bcc:	000006ef 	andeq	r0, r0, pc, ror #13
     bd0:	06fa081b 	usateq	r0, #26, fp, lsl #16
     bd4:	081c0000 	ldmdaeq	ip, {}	; <UNPREDICTABLE>
     bd8:	00000705 	andeq	r0, r0, r5, lsl #14
     bdc:	07f4081d 			; <UNDEFINED> instruction: 0x07f4081d
     be0:	081e0000 	ldmdaeq	lr, {}	; <UNPREDICTABLE>
     be4:	000007ff 	strdeq	r0, [r0], -pc	; <UNPREDICTABLE>
     be8:	080a081f 	stmdaeq	sl, {r0, r1, r2, r3, r4, fp}
     bec:	08200000 	stmdaeq	r0!, {}	; <UNPREDICTABLE>
     bf0:	000007aa 	andeq	r0, r0, sl, lsr #15
     bf4:	081f0821 	ldmdaeq	pc, {r0, r5, fp}	; <UNPREDICTABLE>
     bf8:	08220000 	stmdaeq	r2!, {}	; <UNPREDICTABLE>
     bfc:	0000082a 	andeq	r0, r0, sl, lsr #16
     c00:	08350823 	ldmdaeq	r5!, {r0, r1, r5, fp}
     c04:	08240000 	stmdaeq	r4!, {}	; <UNPREDICTABLE>
     c08:	000007cd 	andeq	r0, r0, sp, asr #15
     c0c:	084d0825 	stmdaeq	sp, {r0, r2, r5, fp}^
     c10:	08260000 	stmdaeq	r6!, {}	; <UNPREDICTABLE>
     c14:	00000858 	andeq	r0, r0, r8, asr r8
     c18:	04690827 	strbteq	r0, [r9], #-2087	; 0xfffff7d9
     c1c:	08280000 	stmdaeq	r8!, {}	; <UNPREDICTABLE>
     c20:	00000564 	andeq	r0, r0, r4, ror #10
     c24:	04740829 	ldrbteq	r0, [r4], #-2089	; 0xfffff7d7
     c28:	082a0000 	stmdaeq	sl!, {}	; <UNPREDICTABLE>
     c2c:	0000047f 	andeq	r0, r0, pc, ror r4
     c30:	048a082b 	streq	r0, [sl], #2091	; 0x82b
     c34:	082c0000 	stmdaeq	ip!, {}	; <UNPREDICTABLE>
     c38:	00000495 	muleq	r0, r5, r4
     c3c:	04a0082d 	strteq	r0, [r0], #2093	; 0x82d
     c40:	082e0000 	stmdaeq	lr!, {}	; <UNPREDICTABLE>
     c44:	000004ab 	andeq	r0, r0, fp, lsr #9
     c48:	04b6082f 	ldrteq	r0, [r6], #2095	; 0x82f
     c4c:	08300000 	ldmdaeq	r0!, {}	; <UNPREDICTABLE>
     c50:	000004c1 	andeq	r0, r0, r1, asr #9
     c54:	05e60831 	strbeq	r0, [r6, #2097]!	; 0x831
     c58:	08320000 	ldmdaeq	r2!, {}	; <UNPREDICTABLE>
     c5c:	000005f1 	strdeq	r0, [r0], -r1
     c60:	07e90833 			; <UNDEFINED> instruction: 0x07e90833
     c64:	08340000 	ldmdaeq	r4!, {}	; <UNPREDICTABLE>
     c68:	000005fc 	strdeq	r0, [r0], -ip
     c6c:	19030035 	stmdbne	r3, {r0, r2, r4, r5}
     c70:	05000006 	streq	r0, [r0, #-6]
     c74:	0000f088 	andeq	pc, r0, r8, lsl #1
     c78:	05a40900 	streq	r0, [r4, #2304]!	; 0x900
     c7c:	0004419b 	muleq	r4, fp, r1
     c80:	042a0a00 	strteq	r0, [sl], #-2560	; 0xfffff600
     c84:	9c050000 	stcls	0, cr0, [r5], {-0}
     c88:	00000087 	andeq	r0, r0, r7, lsl #1
     c8c:	04320a00 	ldrteq	r0, [r2], #-2560	; 0xfffff600
     c90:	9d050000 	stcls	0, cr0, [r5, #-0]
     c94:	00000087 	andeq	r0, r0, r7, lsl #1
     c98:	043a0a04 	ldrteq	r0, [sl], #-2564	; 0xfffff5fc
     c9c:	9e050000 	cdpls	0, 0, cr0, cr5, cr0, {0}
     ca0:	00000087 	andeq	r0, r0, r7, lsl #1
     ca4:	04420a08 	strbeq	r0, [r2], #-2568	; 0xfffff5f8
     ca8:	9f050000 	svcls	0x00050000
     cac:	00000087 	andeq	r0, r0, r7, lsl #1
     cb0:	044a0a0c 	strbeq	r0, [sl], #-2572	; 0xfffff5f4
     cb4:	a0050000 	andge	r0, r5, r0
     cb8:	00000087 	andeq	r0, r0, r7, lsl #1
     cbc:	04520a10 	ldrbeq	r0, [r2], #-2576	; 0xfffff5f0
     cc0:	a1050000 	mrsge	r0, (UNDEF: 5)
     cc4:	00000087 	andeq	r0, r0, r7, lsl #1
     cc8:	05100a14 	ldreq	r0, [r0, #-2580]	; 0xfffff5ec
     ccc:	a2050000 	andge	r0, r5, #0
     cd0:	00000092 	muleq	r0, r2, r0
     cd4:	041c0a18 	ldreq	r0, [ip], #-2584	; 0xfffff5e8
     cd8:	a3050000 	movwge	r0, #20480	; 0x5000
     cdc:	0000009d 	muleq	r0, sp, r0
     ce0:	04230a1c 	strteq	r0, [r3], #-2588	; 0xfffff5e4
     ce4:	a4050000 	strge	r0, [r5], #-0
     ce8:	0000009d 	muleq	r0, sp, r0
     cec:	051a0a20 	ldreq	r0, [sl, #-2592]	; 0xfffff5e0
     cf0:	a5050000 	strge	r0, [r5, #-0]
     cf4:	00000092 	muleq	r0, r2, r0
     cf8:	08be0a24 	ldmeq	lr!, {r2, r5, r9, fp}
     cfc:	a6050000 	strge	r0, [r5], -r0
     d00:	0000009d 	muleq	r0, sp, r0
     d04:	06990a28 	ldreq	r0, [r9], r8, lsr #20
     d08:	a7050000 	strge	r0, [r5, -r0]
     d0c:	0000009d 	muleq	r0, sp, r0
     d10:	05240a2c 	streq	r0, [r4, #-2604]!	; 0xfffff5d4
     d14:	a8050000 	stmdage	r5, {}	; <UNPREDICTABLE>
     d18:	00000092 	muleq	r0, r2, r0
     d1c:	07b50a30 			; <UNDEFINED> instruction: 0x07b50a30
     d20:	a9050000 	stmdbge	r5, {}	; <UNPREDICTABLE>
     d24:	0000009d 	muleq	r0, sp, r0
     d28:	07bc0a34 			; <UNDEFINED> instruction: 0x07bc0a34
     d2c:	aa050000 	bge	140d34 <_stack+0xc0d34>
     d30:	0000009d 	muleq	r0, sp, r0
     d34:	052e0a38 	streq	r0, [lr, #-2616]!	; 0xfffff5c8
     d38:	ab050000 	blge	140d40 <_stack+0xc0d40>
     d3c:	00000092 	muleq	r0, r2, r0
     d40:	05420a3c 	strbeq	r0, [r2, #-2620]	; 0xfffff5c4
     d44:	ac050000 	stcge	0, cr0, [r5], {-0}
     d48:	0000009d 	muleq	r0, sp, r0
     d4c:	05490a40 	strbeq	r0, [r9, #-2624]	; 0xfffff5c0
     d50:	ad050000 	stcge	0, cr0, [r5, #-0]
     d54:	0000009d 	muleq	r0, sp, r0
     d58:	07c30a44 	strbeq	r0, [r3, r4, asr #20]
     d5c:	ae050000 	cdpge	0, 0, cr0, cr5, cr0, {0}
     d60:	00000092 	muleq	r0, r2, r0
     d64:	04d90a48 	ldrbeq	r0, [r9], #2632	; 0xa48
     d68:	af050000 	svcge	0x00050000
     d6c:	0000009d 	muleq	r0, sp, r0
     d70:	04e00a4c 	strbteq	r0, [r0], #2636	; 0xa4c
     d74:	b0050000 	andlt	r0, r5, r0
     d78:	0000009d 	muleq	r0, sp, r0
     d7c:	05380a50 	ldreq	r0, [r8, #-2640]!	; 0xfffff5b0
     d80:	b1050000 	mrslt	r0, (UNDEF: 5)
     d84:	00000092 	muleq	r0, r2, r0
     d88:	087c0a54 	ldmdaeq	ip!, {r2, r4, r6, r9, fp}^
     d8c:	b2050000 	andlt	r0, r5, #0
     d90:	0000009d 	muleq	r0, sp, r0
     d94:	045a0a58 	ldrbeq	r0, [sl], #-2648	; 0xfffff5a8
     d98:	b3050000 	movwlt	r0, #20480	; 0x5000
     d9c:	0000009d 	muleq	r0, sp, r0
     da0:	07d80a5c 			; <UNDEFINED> instruction: 0x07d80a5c
     da4:	b4050000 	strlt	r0, [r5], #-0
     da8:	00000092 	muleq	r0, r2, r0
     dac:	04e70a60 	strbteq	r0, [r7], #2656	; 0xa60
     db0:	b5050000 	strlt	r0, [r5, #-0]
     db4:	0000009d 	muleq	r0, sp, r0
     db8:	07e20a64 	strbeq	r0, [r2, r4, ror #20]!
     dbc:	b6050000 	strlt	r0, [r5], -r0
     dc0:	0000009d 	muleq	r0, sp, r0
     dc4:	08630a68 	stmdaeq	r3!, {r3, r5, r6, r9, fp}^
     dc8:	b7050000 	strlt	r0, [r5, -r0]
     dcc:	00000092 	muleq	r0, r2, r0
     dd0:	06280a6c 	strteq	r0, [r8], -ip, ror #20
     dd4:	b8050000 	stmdalt	r5, {}	; <UNPREDICTABLE>
     dd8:	0000009d 	muleq	r0, sp, r0
     ddc:	07230a70 			; <UNDEFINED> instruction: 0x07230a70
     de0:	b9050000 	stmdblt	r5, {}	; <UNPREDICTABLE>
     de4:	0000009d 	muleq	r0, sp, r0
     de8:	05500a74 	ldrbeq	r0, [r0, #-2676]	; 0xfffff58c
     dec:	ba050000 	blt	140df4 <_stack+0xc0df4>
     df0:	00000092 	muleq	r0, r2, r0
     df4:	071b0a78 			; <UNDEFINED> instruction: 0x071b0a78
     df8:	bb050000 	bllt	140e00 <_stack+0xc0e00>
     dfc:	0000009d 	muleq	r0, sp, r0
     e00:	073f0a7c 			; <UNDEFINED> instruction: 0x073f0a7c
     e04:	bc050000 	stclt	0, cr0, [r5], {-0}
     e08:	0000009d 	muleq	r0, sp, r0
     e0c:	055a0a80 	ldrbeq	r0, [sl, #-2688]	; 0xfffff580
     e10:	bd050000 	stclt	0, cr0, [r5, #-0]
     e14:	00000092 	muleq	r0, r2, r0
     e18:	062f0a84 	strteq	r0, [pc], -r4, lsl #21
     e1c:	be050000 	cdplt	0, 0, cr0, cr5, cr0, {0}
     e20:	0000009d 	muleq	r0, sp, r0
     e24:	06370a88 	ldrteq	r0, [r7], -r8, lsl #21
     e28:	bf050000 	svclt	0x00050000
     e2c:	0000009d 	muleq	r0, sp, r0
     e30:	07340a8c 	ldreq	r0, [r4, -ip, lsl #21]!
     e34:	c0050000 	andgt	r0, r5, r0
     e38:	00000092 	muleq	r0, r2, r0
     e3c:	06070a90 			; <UNDEFINED> instruction: 0x06070a90
     e40:	c1050000 	mrsgt	r0, (UNDEF: 5)
     e44:	0000009d 	muleq	r0, sp, r0
     e48:	072a0a94 			; <UNDEFINED> instruction: 0x072a0a94
     e4c:	c2050000 	andgt	r0, r5, #0
     e50:	0000009d 	muleq	r0, sp, r0
     e54:	07720a98 			; <UNDEFINED> instruction: 0x07720a98
     e58:	c3050000 	movwgt	r0, #20480	; 0x5000
     e5c:	0000009d 	muleq	r0, sp, r0
     e60:	07100a9c 			; <UNDEFINED> instruction: 0x07100a9c
     e64:	c4050000 	strgt	r0, [r5], #-0
     e68:	00000092 	muleq	r0, r2, r0
     e6c:	b30300a0 	movwlt	r0, #12448	; 0x30a0
     e70:	05000008 	streq	r0, [r0, #-8]
     e74:	00024cc5 	andeq	r4, r2, r5, asr #25
     e78:	04610b00 	strbteq	r0, [r1], #-2816	; 0xfffff500
     e7c:	0e010000 	cdpeq	0, 0, cr0, cr1, cr0, {0}
     e80:	0000045d 	andeq	r0, r0, sp, asr r4
     e84:	940c0305 	strls	r0, [ip], #-773	; 0xfffffcfb
     e88:	040c0000 	streq	r0, [ip], #-0
     e8c:	00000441 	andeq	r0, r0, r1, asr #8
     e90:	0004cc0d 	andeq	ip, r4, sp, lsl #24
     e94:	48200100 	stmdami	r0!, {r8}
     e98:	18000088 	stmdane	r0, {r3, r7}
     e9c:	01000000 	mrseq	r0, (UNDEF: 0)
     ea0:	04f90e9c 	ldrbteq	r0, [r9], #3740	; 0xe9c
     ea4:	17010000 	strne	r0, [r1, -r0]
     ea8:	0000872c 	andeq	r8, r0, ip, lsr #14
     eac:	0000011c 	andeq	r0, r0, ip, lsl r1
     eb0:	04c29c01 	strbeq	r9, [r2], #3073	; 0xc01
     eb4:	770f0000 	strvc	r0, [pc, -r0]
     eb8:	01000008 	tsteq	r0, r8
     ebc:	00024117 	andeq	r4, r2, r7, lsl r1
     ec0:	6f910200 	svcvs	0x00910200
     ec4:	0010ed0f 	andseq	lr, r0, pc, lsl #26
     ec8:	e5170100 	ldr	r0, [r7, #-256]	; 0xffffff00
     ecc:	02000000 	andeq	r0, r0, #0
     ed0:	dd0b6e91 	stcle	14, cr6, [fp, #-580]	; 0xfffffdbc
     ed4:	01000005 	tsteq	r0, r5
     ed8:	0004c219 	andeq	ip, r4, r9, lsl r2
     edc:	74910200 	ldrvc	r0, [r1], #512	; 0x200
     ee0:	00086d0b 	andeq	r6, r8, fp, lsl #26
     ee4:	871a0100 	ldrhi	r0, [sl, -r0, lsl #2]
     ee8:	02000000 	andeq	r0, r0, #0
     eec:	0c007091 	stceq	0, cr7, [r0], {145}	; 0x91
     ef0:	00008704 	andeq	r8, r0, r4, lsl #14
     ef4:	060d1000 	streq	r1, [sp], -r0
     ef8:	10010000 	andne	r0, r1, r0
     efc:	0000045d 	andeq	r0, r0, sp, asr r4
     f00:	00008708 	andeq	r8, r0, r8, lsl #14
     f04:	00000024 	andeq	r0, r0, r4, lsr #32
     f08:	3b009c01 	blcc	27f14 <__bss_end__+0x1ea00>
     f0c:	04000002 	streq	r0, [r0], #-2
     f10:	00056b00 	andeq	r6, r5, r0, lsl #22
     f14:	44010400 	strmi	r0, [r1], #-1024	; 0xfffffc00
     f18:	0c000000 	stceq	0, cr0, [r0], {-0}
     f1c:	0000097c 	andeq	r0, r0, ip, ror r9
     f20:	00008860 	andeq	r8, r0, r0, ror #16
     f24:	00000248 	andeq	r0, r0, r8, asr #4
     f28:	000006a9 	andeq	r0, r0, r9, lsr #13
     f2c:	ec060102 	stfs	f0, [r6], {2}
     f30:	02000000 	andeq	r0, r0, #0
     f34:	00ea0801 	rsceq	r0, sl, r1, lsl #16
     f38:	02020000 	andeq	r0, r2, #0
     f3c:	00015e05 	andeq	r5, r1, r5, lsl #28
     f40:	07020200 	streq	r0, [r2, -r0, lsl #4]
     f44:	000000f8 	strdeq	r0, [r0], -r8
     f48:	4e050402 	cdpmi	4, 0, cr0, cr5, cr2, {0}
     f4c:	03000001 	movweq	r0, #1
     f50:	000001c0 	andeq	r0, r0, r0, asr #3
     f54:	004f4102 	subeq	r4, pc, r2, lsl #2
     f58:	04020000 	streq	r0, [r2], #-0
     f5c:	00012e07 	andeq	r2, r1, r7, lsl #28
     f60:	05080200 	streq	r0, [r8, #-512]	; 0xfffffe00
     f64:	00000149 	andeq	r0, r0, r9, asr #2
     f68:	29070802 	stmdbcs	r7, {r1, fp}
     f6c:	04000001 	streq	r0, [r0], #-1
     f70:	6e690504 	cdpvs	5, 6, cr0, cr9, cr4, {0}
     f74:	04020074 	streq	r0, [r2], #-116	; 0xffffff8c
     f78:	00013307 	andeq	r3, r1, r7, lsl #6
     f7c:	01c20300 	biceq	r0, r2, r0, lsl #6
     f80:	30030000 	andcc	r0, r3, r0
     f84:	00000044 	andeq	r0, r0, r4, asr #32
     f88:	00007205 	andeq	r7, r0, r5, lsl #4
     f8c:	04280600 	strteq	r0, [r8], #-1536	; 0xfffffa00
     f90:	0001032f 	andeq	r0, r1, pc, lsr #6
     f94:	09350700 	ldmdbeq	r5!, {r8, r9, sl}
     f98:	30040000 	andcc	r0, r4, r0
     f9c:	0000007d 	andeq	r0, r0, sp, ror r0
     fa0:	0a520700 	beq	1482ba8 <_stack+0x1402ba8>
     fa4:	31040000 	mrscc	r0, (UNDEF: 4)
     fa8:	0000007d 	andeq	r0, r0, sp, ror r0
     fac:	09cc0704 	stmibeq	ip, {r2, r8, r9, sl}^
     fb0:	32040000 	andcc	r0, r4, #0
     fb4:	0000007d 	andeq	r0, r0, sp, ror r0
     fb8:	09290708 	stmdbeq	r9!, {r3, r8, r9, sl}
     fbc:	33040000 	movwcc	r0, #16384	; 0x4000
     fc0:	0000007d 	andeq	r0, r0, sp, ror r0
     fc4:	0960070c 	stmdbeq	r0!, {r2, r3, r8, r9, sl}^
     fc8:	34040000 	strcc	r0, [r4], #-0
     fcc:	0000007d 	andeq	r0, r0, sp, ror r0
     fd0:	096e0710 	stmdbeq	lr!, {r4, r8, r9, sl}^
     fd4:	35040000 	strcc	r0, [r4, #-0]
     fd8:	0000007d 	andeq	r0, r0, sp, ror r0
     fdc:	094e0714 	stmdbeq	lr, {r2, r4, r8, r9, sl}^
     fe0:	36040000 	strcc	r0, [r4], -r0
     fe4:	0000007d 	andeq	r0, r0, sp, ror r0
     fe8:	0a1e0718 	beq	782c50 <_stack+0x702c50>
     fec:	37040000 	strcc	r0, [r4, -r0]
     ff0:	0000007d 	andeq	r0, r0, sp, ror r0
     ff4:	0a2d071c 	beq	b42c6c <_stack+0xac2c6c>
     ff8:	38040000 	stmdacc	r4, {}	; <UNPREDICTABLE>
     ffc:	0000007d 	andeq	r0, r0, sp, ror r0
    1000:	09160720 	ldmdbeq	r6, {r5, r8, r9, sl}
    1004:	39040000 	stmdbcc	r4, {}	; <UNPREDICTABLE>
    1008:	0000007d 	andeq	r0, r0, sp, ror r0
    100c:	f0030024 			; <UNDEFINED> instruction: 0xf0030024
    1010:	04000008 	streq	r0, [r0], #-8
    1014:	0000823a 	andeq	r8, r0, sl, lsr r2
    1018:	09050800 	stmdbeq	r5, {fp}
    101c:	16010000 	strne	r0, [r1], -r0
    1020:	0000011f 	andeq	r0, r0, pc, lsl r1
    1024:	94100305 	ldrls	r0, [r0], #-773	; 0xfffffcfb
    1028:	04090000 	streq	r0, [r9], #-0
    102c:	00000103 	andeq	r0, r0, r3, lsl #2
    1030:	000a3c0a 	andeq	r3, sl, sl, lsl #24
    1034:	98ec0100 	stmials	ip!, {r8}^
    1038:	1000008a 	andne	r0, r0, sl, lsl #1
    103c:	01000000 	mrseq	r0, (UNDEF: 0)
    1040:	0a0d0b9c 	beq	343eb8 <_stack+0x2c3eb8>
    1044:	7f010000 	svcvc	0x00010000
    1048:	00008994 	muleq	r0, r4, r9
    104c:	00000104 	andeq	r0, r0, r4, lsl #2
    1050:	016e9c01 	cmneq	lr, r1, lsl #24
    1054:	6c0c0000 	stcvs	0, cr0, [ip], {-0}
    1058:	01007469 	tsteq	r0, r9, ror #8
    105c:	00006481 	andeq	r6, r0, r1, lsl #9
    1060:	f8030500 			; <UNDEFINED> instruction: 0xf8030500
    1064:	08000094 	stmdaeq	r0, {r2, r4, r7}
    1068:	000009c2 	andeq	r0, r0, r2, asr #19
    106c:	00648201 	rsbeq	r8, r4, r1, lsl #4
    1070:	03050000 	movweq	r0, #20480	; 0x5000
    1074:	000094f4 	strdeq	r9, [r0], -r4
    1078:	09b00d00 	ldmibeq	r0!, {r8, sl, fp}
    107c:	6d010000 	stcvs	0, cr0, [r1, #-0]
    1080:	0000895c 	andeq	r8, r0, ip, asr r9
    1084:	00000038 	andeq	r0, r0, r8, lsr r0
    1088:	01929c01 	orrseq	r9, r2, r1, lsl #24
    108c:	47080000 	strmi	r0, [r8, -r0]
    1090:	01000009 	tsteq	r0, r9
    1094:	0001926f 	andeq	r9, r1, pc, ror #4
    1098:	5f910200 	svcpl	0x00910200
    109c:	08010200 	stmdaeq	r1, {r9}
    10a0:	000000f3 	strdeq	r0, [r0], -r3
    10a4:	0008c50d 	andeq	ip, r8, sp, lsl #10
    10a8:	245c0100 	ldrbcs	r0, [ip], #-256	; 0xffffff00
    10ac:	38000089 	stmdacc	r0, {r0, r3, r7}
    10b0:	01000000 	mrseq	r0, (UNDEF: 0)
    10b4:	0001bd9c 	muleq	r1, ip, sp
    10b8:	09470800 	stmdbeq	r7, {fp}^
    10bc:	5e010000 	cdppl	0, 0, cr0, cr1, cr0, {0}
    10c0:	00000192 	muleq	r0, r2, r1
    10c4:	005f9102 	subseq	r9, pc, r2, lsl #2
    10c8:	000a040d 	andeq	r0, sl, sp, lsl #8
    10cc:	f04b0100 			; <UNDEFINED> instruction: 0xf04b0100
    10d0:	34000088 	strcc	r0, [r0], #-136	; 0xffffff78
    10d4:	01000000 	mrseq	r0, (UNDEF: 0)
    10d8:	0001e19c 	muleq	r1, ip, r1
    10dc:	09470800 	stmdbeq	r7, {fp}^
    10e0:	4d010000 	stcmi	0, cr0, [r1, #-0]
    10e4:	00000192 	muleq	r0, r2, r1
    10e8:	005f9102 	subseq	r9, pc, r2, lsl #2
    10ec:	0009da0d 	andeq	sp, r9, sp, lsl #20
    10f0:	bc3b0100 	ldflts	f0, [fp], #-0
    10f4:	34000088 	strcc	r0, [r0], #-136	; 0xffffff78
    10f8:	01000000 	mrseq	r0, (UNDEF: 0)
    10fc:	0002059c 	muleq	r2, ip, r5
    1100:	09470800 	stmdbeq	r7, {fp}^
    1104:	3d010000 	stccc	0, cr0, [r1, #-0]
    1108:	00000192 	muleq	r0, r2, r1
    110c:	005f9102 	subseq	r9, pc, r2, lsl #2
    1110:	0009f70d 	andeq	pc, r9, sp, lsl #14
    1114:	842a0100 	strthi	r0, [sl], #-256	; 0xffffff00
    1118:	38000088 	stmdacc	r0, {r3, r7}
    111c:	01000000 	mrseq	r0, (UNDEF: 0)
    1120:	0002299c 	muleq	r2, ip, r9
    1124:	09470800 	stmdbeq	r7, {fp}^
    1128:	2c010000 	stccs	0, cr0, [r1], {-0}
    112c:	00000192 	muleq	r0, r2, r1
    1130:	005f9102 	subseq	r9, pc, r2, lsl #2
    1134:	0008db0e 	andeq	sp, r8, lr, lsl #22
    1138:	1f1d0100 	svcne	0x001d0100
    113c:	60000001 	andvs	r0, r0, r1
    1140:	24000088 	strcs	r0, [r0], #-136	; 0xffffff78
    1144:	01000000 	mrseq	r0, (UNDEF: 0)
    1148:	0143009c 	swpbeq	r0, ip, [r3]
    114c:	00040000 	andeq	r0, r4, r0
    1150:	0000064e 	andeq	r0, r0, lr, asr #12
    1154:	00440104 	subeq	r0, r4, r4, lsl #2
    1158:	840c0000 	strhi	r0, [ip], #-0
    115c:	a800000a 	stmdage	r0, {r1, r3}
    1160:	7c00008a 	stcvc	0, cr0, [r0], {138}	; 0x8a
    1164:	fc000000 	stc2	0, cr0, [r0], {-0}
    1168:	02000007 	andeq	r0, r0, #7
    116c:	00ec0601 	rsceq	r0, ip, r1, lsl #12
    1170:	01020000 	mrseq	r0, (UNDEF: 2)
    1174:	0000ea08 	andeq	lr, r0, r8, lsl #20
    1178:	05020200 	streq	r0, [r2, #-512]	; 0xfffffe00
    117c:	0000015e 	andeq	r0, r0, lr, asr r1
    1180:	f8070202 			; <UNDEFINED> instruction: 0xf8070202
    1184:	02000000 	andeq	r0, r0, #0
    1188:	014e0504 	cmpeq	lr, r4, lsl #10
    118c:	c0030000 	andgt	r0, r3, r0
    1190:	02000001 	andeq	r0, r0, #1
    1194:	00004f41 	andeq	r4, r0, r1, asr #30
    1198:	07040200 	streq	r0, [r4, -r0, lsl #4]
    119c:	0000012e 	andeq	r0, r0, lr, lsr #2
    11a0:	49050802 	stmdbmi	r5, {r1, fp}
    11a4:	02000001 	andeq	r0, r0, #1
    11a8:	01290708 			; <UNDEFINED> instruction: 0x01290708
    11ac:	04040000 	streq	r0, [r4], #-0
    11b0:	746e6905 	strbtvc	r6, [lr], #-2309	; 0xfffff6fb
    11b4:	07040200 	streq	r0, [r4, -r0, lsl #4]
    11b8:	00000133 	andeq	r0, r0, r3, lsr r1
    11bc:	0001c203 	andeq	ip, r1, r3, lsl #4
    11c0:	44300300 	ldrtmi	r0, [r0], #-768	; 0xfffffd00
    11c4:	05000000 	streq	r0, [r0, #-0]
    11c8:	00000072 	andeq	r0, r0, r2, ror r0
    11cc:	1a041c06 	bne	1081ec <_stack+0x881ec>
    11d0:	000000df 	ldrdeq	r0, [r0], -pc	; <UNPREDICTABLE>
    11d4:	000ac107 	andeq	ip, sl, r7, lsl #2
    11d8:	7d1b0400 	cfldrsvc	mvf0, [fp, #-0]
    11dc:	00000000 	andeq	r0, r0, r0
    11e0:	000ad007 	andeq	sp, sl, r7
    11e4:	7d1c0400 	cfldrsvc	mvf0, [ip, #-0]
    11e8:	04000000 	streq	r0, [r0], #-0
    11ec:	000ab607 	andeq	fp, sl, r7, lsl #12
    11f0:	7d1d0400 	cfldrsvc	mvf0, [sp, #-0]
    11f4:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
    11f8:	000a6007 	andeq	r6, sl, r7
    11fc:	7d1e0400 	cfldrsvc	mvf0, [lr, #-0]
    1200:	0c000000 	stceq	0, cr0, [r0], {-0}
    1204:	000a6907 	andeq	r6, sl, r7, lsl #18
    1208:	7d1f0400 	cfldrsvc	mvf0, [pc, #-0]	; 1210 <_heap_top+0x210>
    120c:	10000000 	andne	r0, r0, r0
    1210:	000a7207 	andeq	r7, sl, r7, lsl #4
    1214:	7d200400 	cfstrsvc	mvf0, [r0, #-0]
    1218:	14000000 	strne	r0, [r0], #-0
    121c:	000a7b07 	andeq	r7, sl, r7, lsl #22
    1220:	7d210400 	cfstrsvc	mvf0, [r1, #-0]
    1224:	18000000 	stmdane	r0, {}	; <UNPREDICTABLE>
    1228:	0b030300 	bleq	c1e30 <_stack+0x41e30>
    122c:	22040000 	andcs	r0, r4, #0
    1230:	00000082 	andeq	r0, r0, r2, lsl #1
    1234:	000b1308 	andeq	r1, fp, r8, lsl #6
    1238:	fb0e0100 	blx	381642 <_stack+0x301642>
    123c:	05000000 	streq	r0, [r0, #-0]
    1240:	00941403 	addseq	r1, r4, r3, lsl #8
    1244:	df040900 	svcle	0x00040900
    1248:	0a000000 	beq	1250 <_heap_top+0x250>
    124c:	00000aee 	andeq	r0, r0, lr, ror #21
    1250:	8acc1501 	bhi	ff30665c <CPSR_UNAFFECTED_BITS+0xff30675c>
    1254:	00580000 	subseq	r0, r8, r0
    1258:	9c010000 	stcls	0, cr0, [r1], {-0}
    125c:	00000131 	andeq	r0, r0, r1, lsr r1
    1260:	0073750b 	rsbseq	r7, r3, fp, lsl #10
    1264:	00721501 	rsbseq	r1, r2, r1, lsl #10
    1268:	91020000 	mrsls	r0, (UNDEF: 2)
    126c:	73740c6c 	cmnvc	r4, #108, 24	; 0x6c00
    1270:	7d170100 	ldfvcs	f0, [r7, #-0]
    1274:	02000000 	andeq	r0, r0, #0
    1278:	0d007491 	cfstrseq	mvf7, [r0, #-580]	; 0xfffffdbc
    127c:	00000adb 	ldrdeq	r0, [r0], -fp
    1280:	00fb1001 	rscseq	r1, fp, r1
    1284:	8aa80000 	bhi	fea0128c <CPSR_UNAFFECTED_BITS+0xfea0138c>
    1288:	00240000 	eoreq	r0, r4, r0
    128c:	9c010000 	stcls	0, cr0, [r1], {-0}
    1290:	0006f300 	andeq	pc, r6, r0, lsl #6
    1294:	10000400 	andne	r0, r0, r0, lsl #8
    1298:	04000007 	streq	r0, [r0], #-7
    129c:	00004401 	andeq	r4, r0, r1, lsl #8
    12a0:	0bbd0c00 	bleq	fef442a8 <CPSR_UNAFFECTED_BITS+0xfef443a8>
    12a4:	8b240000 	blhi	9012ac <_stack+0x8812ac>
    12a8:	039c0000 	orrseq	r0, ip, #0
    12ac:	08ff0000 	ldmeq	pc!, {}^	; <UNPREDICTABLE>
    12b0:	01020000 	mrseq	r0, (UNDEF: 2)
    12b4:	0000ec06 	andeq	lr, r0, r6, lsl #24
    12b8:	08010200 	stmdaeq	r1, {r9}
    12bc:	000000ea 	andeq	r0, r0, sl, ror #1
    12c0:	5e050202 	cdppl	2, 0, cr0, cr5, cr2, {0}
    12c4:	02000001 	andeq	r0, r0, #1
    12c8:	00f80702 	rscseq	r0, r8, r2, lsl #14
    12cc:	04020000 	streq	r0, [r2], #-0
    12d0:	00014e05 	andeq	r4, r1, r5, lsl #28
    12d4:	01c00300 	biceq	r0, r0, r0, lsl #6
    12d8:	41020000 	mrsmi	r0, (UNDEF: 2)
    12dc:	0000004f 	andeq	r0, r0, pc, asr #32
    12e0:	2e070402 	cdpcs	4, 0, cr0, cr7, cr2, {0}
    12e4:	02000001 	andeq	r0, r0, #1
    12e8:	01490508 	cmpeq	r9, r8, lsl #10
    12ec:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
    12f0:	00012907 	andeq	r2, r1, r7, lsl #18
    12f4:	05040400 	streq	r0, [r4, #-1024]	; 0xfffffc00
    12f8:	00746e69 	rsbseq	r6, r4, r9, ror #28
    12fc:	00006405 	andeq	r6, r0, r5, lsl #8
    1300:	07040200 	streq	r0, [r4, -r0, lsl #4]
    1304:	00000133 	andeq	r0, r0, r3, lsr r1
    1308:	0001c203 	andeq	ip, r1, r3, lsl #4
    130c:	44300300 	ldrtmi	r0, [r0], #-768	; 0xfffffd00
    1310:	05000000 	streq	r0, [r0, #-0]
    1314:	00000077 	andeq	r0, r0, r7, ror r0
    1318:	00008206 	andeq	r8, r0, r6, lsl #4
    131c:	01a50300 			; <UNDEFINED> instruction: 0x01a50300
    1320:	12040000 	andne	r0, r4, #0
    1324:	00000082 	andeq	r0, r0, r2, lsl #1
    1328:	0006a003 	andeq	sl, r6, r3
    132c:	87130400 	ldrhi	r0, [r3, -r0, lsl #8]
    1330:	03000000 	movweq	r0, #0
    1334:	00000840 	andeq	r0, r0, r0, asr #16
    1338:	00821404 	addeq	r1, r2, r4, lsl #8
    133c:	2c070000 	stccs	0, cr0, [r7], {-0}
    1340:	013a3905 	teqeq	sl, r5, lsl #18
    1344:	a3080000 	movwge	r0, #32768	; 0x8000
    1348:	0500000b 	streq	r0, [r0, #-11]
    134c:	00008c3a 	andeq	r8, r0, sl, lsr ip
    1350:	0f080000 	svceq	0x00080000
    1354:	0500000c 	streq	r0, [r0, #-12]
    1358:	00008c3b 	andeq	r8, r0, fp, lsr ip
    135c:	2a080400 	bcs	202364 <_stack+0x182364>
    1360:	0500000c 	streq	r0, [r0, #-12]
    1364:	00008c3c 	andeq	r8, r0, ip, lsr ip
    1368:	ad080800 	stcge	8, cr0, [r8, #-0]
    136c:	0500000c 	streq	r0, [r0, #-12]
    1370:	00008c3d 	andeq	r8, r0, sp, lsr ip
    1374:	94080c00 	strls	r0, [r8], #-3072	; 0xfffff400
    1378:	0500000b 	streq	r0, [r0, #-11]
    137c:	00008c3e 	andeq	r8, r0, lr, lsr ip
    1380:	54081000 	strpl	r1, [r8], #-0
    1384:	0500000b 	streq	r0, [r0, #-11]
    1388:	0000973f 	andeq	r9, r0, pc, lsr r7
    138c:	fb081400 	blx	206396 <_stack+0x186396>
    1390:	0500000b 	streq	r0, [r0, #-11]
    1394:	00009740 	andeq	r9, r0, r0, asr #14
    1398:	22081800 	andcs	r1, r8, #0, 16
    139c:	0500000b 	streq	r0, [r0, #-11]
    13a0:	00008c41 	andeq	r8, r0, r1, asr #24
    13a4:	e6081c00 	str	r1, [r8], -r0, lsl #24
    13a8:	0500000c 	streq	r0, [r0, #-12]
    13ac:	00008c42 	andeq	r8, r0, r2, asr #24
    13b0:	98082000 	stmdals	r8, {sp}
    13b4:	0500000c 	streq	r0, [r0, #-12]
    13b8:	00009743 	andeq	r9, r0, r3, asr #14
    13bc:	eb082400 	bl	20a3c4 <_stack+0x18a3c4>
    13c0:	0500000b 	streq	r0, [r0, #-11]
    13c4:	00008c44 	andeq	r8, r0, r4, asr #24
    13c8:	03002800 	movweq	r2, #2048	; 0x800
    13cc:	00000b31 	andeq	r0, r0, r1, lsr fp
    13d0:	00ad4505 	adceq	r4, sp, r5, lsl #10
    13d4:	08070000 	stmdaeq	r7, {}	; <UNPREDICTABLE>
    13d8:	01664705 	cmneq	r6, r5, lsl #14
    13dc:	40080000 	andmi	r0, r8, r0
    13e0:	0500000c 	streq	r0, [r0, #-12]
    13e4:	00009748 	andeq	r9, r0, r8, asr #14
    13e8:	63080000 	movwvs	r0, #32768	; 0x8000
    13ec:	0500000b 	streq	r0, [r0, #-11]
    13f0:	00008c49 	andeq	r8, r0, r9, asr #24
    13f4:	03000400 	movweq	r0, #1024	; 0x400
    13f8:	00000cc7 	andeq	r0, r0, r7, asr #25
    13fc:	01454a05 	cmpeq	r5, r5, lsl #20
    1400:	01090000 	mrseq	r0, (UNDEF: 9)
    1404:	00000028 	andeq	r0, r0, r8, lsr #32
    1408:	01ae4206 			; <UNDEFINED> instruction: 0x01ae4206
    140c:	690a0000 	stmdbvs	sl, {}	; <UNPREDICTABLE>
    1410:	00000007 	andeq	r0, r0, r7
    1414:	00067b0a 	andeq	r7, r6, sl, lsl #22
    1418:	ab0a0100 	blge	281820 <_stack+0x201820>
    141c:	02000008 	andeq	r0, r0, #8
    1420:	0008a30a 	andeq	sl, r8, sl, lsl #6
    1424:	830a0300 	movwhi	r0, #41728	; 0xa300
    1428:	04000008 	streq	r0, [r0], #-8
    142c:	00088b0a 	andeq	r8, r8, sl, lsl #22
    1430:	930a0500 	movwls	r0, #42240	; 0xa500
    1434:	06000008 	streq	r0, [r0], -r8
    1438:	00089b0a 	andeq	r9, r8, sl, lsl #22
    143c:	09000700 	stmdbeq	r0, {r8, r9, sl}
    1440:	00002801 	andeq	r2, r0, r1, lsl #16
    1444:	ff510600 			; <UNDEFINED> instruction: 0xff510600
    1448:	0a000002 	beq	1458 <_heap_top+0x458>
    144c:	0000063f 	andeq	r0, r0, pc, lsr r6
    1450:	06490a00 	strbeq	r0, [r9], -r0, lsl #20
    1454:	0a010000 	beq	4145c <__bss_end__+0x37f48>
    1458:	00000653 	andeq	r0, r0, r3, asr r6
    145c:	08150a02 	ldmdaeq	r5, {r1, r9, fp}
    1460:	0a030000 	beq	c1468 <_stack+0x41468>
    1464:	0000065d 	andeq	r0, r0, sp, asr r6
    1468:	06670a04 	strbteq	r0, [r7], -r4, lsl #20
    146c:	0a050000 	beq	141474 <_stack+0xc1474>
    1470:	00000671 	andeq	r0, r0, r1, ror r6
    1474:	075f0a06 	ldrbeq	r0, [pc, -r6, lsl #20]
    1478:	0a070000 	beq	1c1480 <_stack+0x141480>
    147c:	00000685 	andeq	r0, r0, r5, lsl #13
    1480:	068f0a08 	streq	r0, [pc], r8, lsl #20
    1484:	0a090000 	beq	24148c <_stack+0x1c148c>
    1488:	0000056f 	andeq	r0, r0, pc, ror #10
    148c:	057a0a0a 	ldrbeq	r0, [sl, #-2570]!	; 0xfffff5f6
    1490:	0a0b0000 	beq	2c1498 <_stack+0x241498>
    1494:	00000585 	andeq	r0, r0, r5, lsl #11
    1498:	05900a0c 	ldreq	r0, [r0, #2572]	; 0xa0c
    149c:	0a0d0000 	beq	3414a4 <_stack+0x2c14a4>
    14a0:	0000059b 	muleq	r0, fp, r5
    14a4:	05a60a0e 	streq	r0, [r6, #2574]!	; 0xa0e
    14a8:	0a0f0000 	beq	3c14b0 <_stack+0x3414b0>
    14ac:	000005b1 			; <UNDEFINED> instruction: 0x000005b1
    14b0:	05bc0a10 	ldreq	r0, [ip, #2576]!	; 0xa10
    14b4:	0a110000 	beq	4414bc <_stack+0x3c14bc>
    14b8:	000005c7 	andeq	r0, r0, r7, asr #11
    14bc:	05d20a12 	ldrbeq	r0, [r2, #2578]	; 0xa12
    14c0:	0a130000 	beq	4c14c8 <_stack+0x4414c8>
    14c4:	000004ee 	andeq	r0, r0, lr, ror #9
    14c8:	06ad0a14 	ssateq	r0, #14, r4, lsl #20
    14cc:	0a150000 	beq	5414d4 <_stack+0x4c14d4>
    14d0:	000006b8 			; <UNDEFINED> instruction: 0x000006b8
    14d4:	06c30a16 			; <UNDEFINED> instruction: 0x06c30a16
    14d8:	0a170000 	beq	5c14e0 <_stack+0x5414e0>
    14dc:	000006ce 	andeq	r0, r0, lr, asr #13
    14e0:	06d90a18 			; <UNDEFINED> instruction: 0x06d90a18
    14e4:	0a190000 	beq	6414ec <_stack+0x5c14ec>
    14e8:	000006e4 	andeq	r0, r0, r4, ror #13
    14ec:	06ef0a1a 	usateq	r0, #15, sl, lsl #20
    14f0:	0a1b0000 	beq	6c14f8 <_stack+0x6414f8>
    14f4:	000006fa 	strdeq	r0, [r0], -sl
    14f8:	07050a1c 	smladeq	r5, ip, sl, r0
    14fc:	0a1d0000 	beq	741504 <_stack+0x6c1504>
    1500:	000007f4 	strdeq	r0, [r0], -r4
    1504:	07ff0a1e 			; <UNDEFINED> instruction: 0x07ff0a1e
    1508:	0a1f0000 	beq	7c1510 <_stack+0x741510>
    150c:	0000080a 	andeq	r0, r0, sl, lsl #16
    1510:	07aa0a20 	streq	r0, [sl, r0, lsr #20]!
    1514:	0a210000 	beq	84151c <_stack+0x7c151c>
    1518:	0000081f 	andeq	r0, r0, pc, lsl r8
    151c:	082a0a22 	stmdaeq	sl!, {r1, r5, r9, fp}
    1520:	0a230000 	beq	8c1528 <_stack+0x841528>
    1524:	00000835 	andeq	r0, r0, r5, lsr r8
    1528:	07cd0a24 	strbeq	r0, [sp, r4, lsr #20]
    152c:	0a250000 	beq	941534 <_stack+0x8c1534>
    1530:	0000084d 	andeq	r0, r0, sp, asr #16
    1534:	08580a26 	ldmdaeq	r8, {r1, r2, r5, r9, fp}^
    1538:	0a270000 	beq	9c1540 <_stack+0x941540>
    153c:	00000469 	andeq	r0, r0, r9, ror #8
    1540:	05640a28 	strbeq	r0, [r4, #-2600]!	; 0xfffff5d8
    1544:	0a290000 	beq	a4154c <_stack+0x9c154c>
    1548:	00000474 	andeq	r0, r0, r4, ror r4
    154c:	047f0a2a 	ldrbteq	r0, [pc], #-2602	; 1554 <_heap_top+0x554>
    1550:	0a2b0000 	beq	ac1558 <_stack+0xa41558>
    1554:	0000048a 	andeq	r0, r0, sl, lsl #9
    1558:	04950a2c 	ldreq	r0, [r5], #2604	; 0xa2c
    155c:	0a2d0000 	beq	b41564 <_stack+0xac1564>
    1560:	000004a0 	andeq	r0, r0, r0, lsr #9
    1564:	04ab0a2e 	strteq	r0, [fp], #2606	; 0xa2e
    1568:	0a2f0000 	beq	bc1570 <_stack+0xb41570>
    156c:	000004b6 			; <UNDEFINED> instruction: 0x000004b6
    1570:	04c10a30 	strbeq	r0, [r1], #2608	; 0xa30
    1574:	0a310000 	beq	c4157c <_stack+0xbc157c>
    1578:	000005e6 	andeq	r0, r0, r6, ror #11
    157c:	05f10a32 	ldrbeq	r0, [r1, #2610]!	; 0xa32
    1580:	0a330000 	beq	cc1588 <_stack+0xc41588>
    1584:	000007e9 	andeq	r0, r0, r9, ror #15
    1588:	05fc0a34 	ldrbeq	r0, [ip, #2612]!	; 0xa34
    158c:	00350000 	eorseq	r0, r5, r0
    1590:	9b06a407 	blls	1aa5b4 <_stack+0x12a5b4>
    1594:	000004f4 	strdeq	r0, [r0], -r4
    1598:	00042a08 	andeq	r2, r4, r8, lsl #20
    159c:	8c9c0600 	ldchi	6, cr0, [ip], {0}
    15a0:	00000000 	andeq	r0, r0, r0
    15a4:	00043208 	andeq	r3, r4, r8, lsl #4
    15a8:	8c9d0600 	ldchi	6, cr0, [sp], {0}
    15ac:	04000000 	streq	r0, [r0], #-0
    15b0:	00043a08 	andeq	r3, r4, r8, lsl #20
    15b4:	8c9e0600 	ldchi	6, cr0, [lr], {0}
    15b8:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
    15bc:	00044208 	andeq	r4, r4, r8, lsl #4
    15c0:	8c9f0600 	ldchi	6, cr0, [pc], {0}
    15c4:	0c000000 	stceq	0, cr0, [r0], {-0}
    15c8:	00044a08 	andeq	r4, r4, r8, lsl #20
    15cc:	8ca00600 	stchi	6, cr0, [r0]
    15d0:	10000000 	andne	r0, r0, r0
    15d4:	00045208 	andeq	r5, r4, r8, lsl #4
    15d8:	8ca10600 	stchi	6, cr0, [r1]
    15dc:	14000000 	strne	r0, [r0], #-0
    15e0:	00051008 	andeq	r1, r5, r8
    15e4:	97a20600 	strls	r0, [r2, r0, lsl #12]!
    15e8:	18000000 	stmdane	r0, {}	; <UNPREDICTABLE>
    15ec:	00041c08 	andeq	r1, r4, r8, lsl #24
    15f0:	a2a30600 	adcge	r0, r3, #0, 12
    15f4:	1c000000 	stcne	0, cr0, [r0], {-0}
    15f8:	00042308 	andeq	r2, r4, r8, lsl #6
    15fc:	a2a40600 	adcge	r0, r4, #0, 12
    1600:	20000000 	andcs	r0, r0, r0
    1604:	00051a08 	andeq	r1, r5, r8, lsl #20
    1608:	97a50600 	strls	r0, [r5, r0, lsl #12]!
    160c:	24000000 	strcs	r0, [r0], #-0
    1610:	0008be08 	andeq	fp, r8, r8, lsl #28
    1614:	a2a60600 	adcge	r0, r6, #0, 12
    1618:	28000000 	stmdacs	r0, {}	; <UNPREDICTABLE>
    161c:	00069908 	andeq	r9, r6, r8, lsl #18
    1620:	a2a70600 	adcge	r0, r7, #0, 12
    1624:	2c000000 	stccs	0, cr0, [r0], {-0}
    1628:	00052408 	andeq	r2, r5, r8, lsl #8
    162c:	97a80600 	strls	r0, [r8, r0, lsl #12]!
    1630:	30000000 	andcc	r0, r0, r0
    1634:	0007b508 	andeq	fp, r7, r8, lsl #10
    1638:	a2a90600 	adcge	r0, r9, #0, 12
    163c:	34000000 	strcc	r0, [r0], #-0
    1640:	0007bc08 	andeq	fp, r7, r8, lsl #24
    1644:	a2aa0600 	adcge	r0, sl, #0, 12
    1648:	38000000 	stmdacc	r0, {}	; <UNPREDICTABLE>
    164c:	00052e08 	andeq	r2, r5, r8, lsl #28
    1650:	97ab0600 	strls	r0, [fp, r0, lsl #12]!
    1654:	3c000000 	stccc	0, cr0, [r0], {-0}
    1658:	00054208 	andeq	r4, r5, r8, lsl #4
    165c:	a2ac0600 	adcge	r0, ip, #0, 12
    1660:	40000000 	andmi	r0, r0, r0
    1664:	00054908 	andeq	r4, r5, r8, lsl #18
    1668:	a2ad0600 	adcge	r0, sp, #0, 12
    166c:	44000000 	strmi	r0, [r0], #-0
    1670:	0007c308 	andeq	ip, r7, r8, lsl #6
    1674:	97ae0600 	strls	r0, [lr, r0, lsl #12]!
    1678:	48000000 	stmdami	r0, {}	; <UNPREDICTABLE>
    167c:	0004d908 	andeq	sp, r4, r8, lsl #18
    1680:	a2af0600 	adcge	r0, pc, #0, 12
    1684:	4c000000 	stcmi	0, cr0, [r0], {-0}
    1688:	0004e008 	andeq	lr, r4, r8
    168c:	a2b00600 	adcsge	r0, r0, #0, 12
    1690:	50000000 	andpl	r0, r0, r0
    1694:	00053808 	andeq	r3, r5, r8, lsl #16
    1698:	97b10600 	ldrls	r0, [r1, r0, lsl #12]!
    169c:	54000000 	strpl	r0, [r0], #-0
    16a0:	00087c08 	andeq	r7, r8, r8, lsl #24
    16a4:	a2b20600 	adcsge	r0, r2, #0, 12
    16a8:	58000000 	stmdapl	r0, {}	; <UNPREDICTABLE>
    16ac:	00045a08 	andeq	r5, r4, r8, lsl #20
    16b0:	a2b30600 	adcsge	r0, r3, #0, 12
    16b4:	5c000000 	stcpl	0, cr0, [r0], {-0}
    16b8:	0007d808 	andeq	sp, r7, r8, lsl #16
    16bc:	97b40600 	ldrls	r0, [r4, r0, lsl #12]!
    16c0:	60000000 	andvs	r0, r0, r0
    16c4:	0004e708 	andeq	lr, r4, r8, lsl #14
    16c8:	a2b50600 	adcsge	r0, r5, #0, 12
    16cc:	64000000 	strvs	r0, [r0], #-0
    16d0:	0007e208 	andeq	lr, r7, r8, lsl #4
    16d4:	a2b60600 	adcsge	r0, r6, #0, 12
    16d8:	68000000 	stmdavs	r0, {}	; <UNPREDICTABLE>
    16dc:	00086308 	andeq	r6, r8, r8, lsl #6
    16e0:	97b70600 	ldrls	r0, [r7, r0, lsl #12]!
    16e4:	6c000000 	stcvs	0, cr0, [r0], {-0}
    16e8:	00062808 	andeq	r2, r6, r8, lsl #16
    16ec:	a2b80600 	adcsge	r0, r8, #0, 12
    16f0:	70000000 	andvc	r0, r0, r0
    16f4:	00072308 	andeq	r2, r7, r8, lsl #6
    16f8:	a2b90600 	adcsge	r0, r9, #0, 12
    16fc:	74000000 	strvc	r0, [r0], #-0
    1700:	00055008 	andeq	r5, r5, r8
    1704:	97ba0600 	ldrls	r0, [sl, r0, lsl #12]!
    1708:	78000000 	stmdavc	r0, {}	; <UNPREDICTABLE>
    170c:	00071b08 	andeq	r1, r7, r8, lsl #22
    1710:	a2bb0600 	adcsge	r0, fp, #0, 12
    1714:	7c000000 	stcvc	0, cr0, [r0], {-0}
    1718:	00073f08 	andeq	r3, r7, r8, lsl #30
    171c:	a2bc0600 	adcsge	r0, ip, #0, 12
    1720:	80000000 	andhi	r0, r0, r0
    1724:	00055a08 	andeq	r5, r5, r8, lsl #20
    1728:	97bd0600 	ldrls	r0, [sp, r0, lsl #12]!
    172c:	84000000 	strhi	r0, [r0], #-0
    1730:	00062f08 	andeq	r2, r6, r8, lsl #30
    1734:	a2be0600 	adcsge	r0, lr, #0, 12
    1738:	88000000 	stmdahi	r0, {}	; <UNPREDICTABLE>
    173c:	00063708 	andeq	r3, r6, r8, lsl #14
    1740:	a2bf0600 	adcsge	r0, pc, #0, 12
    1744:	8c000000 	stchi	0, cr0, [r0], {-0}
    1748:	00073408 	andeq	r3, r7, r8, lsl #8
    174c:	97c00600 	strbls	r0, [r0, r0, lsl #12]
    1750:	90000000 	andls	r0, r0, r0
    1754:	00060708 	andeq	r0, r6, r8, lsl #14
    1758:	a2c10600 	sbcge	r0, r1, #0, 12
    175c:	94000000 	strls	r0, [r0], #-0
    1760:	00072a08 	andeq	r2, r7, r8, lsl #20
    1764:	a2c20600 	sbcge	r0, r2, #0, 12
    1768:	98000000 	stmdals	r0, {}	; <UNPREDICTABLE>
    176c:	00077208 	andeq	r7, r7, r8, lsl #4
    1770:	a2c30600 	sbcge	r0, r3, #0, 12
    1774:	9c000000 	stcls	0, cr0, [r0], {-0}
    1778:	00071008 	andeq	r1, r7, r8
    177c:	97c40600 	strbls	r0, [r4, r0, lsl #12]
    1780:	a0000000 	andge	r0, r0, r0
    1784:	08b30300 	ldmeq	r3!, {r8, r9}
    1788:	c5060000 	strgt	r0, [r6, #-0]
    178c:	000002ff 	strdeq	r0, [r0], -pc	; <UNPREDICTABLE>
    1790:	02071807 	andeq	r1, r7, #458752	; 0x70000
    1794:	00000538 	andeq	r0, r0, r8, lsr r5
    1798:	000bb608 	andeq	fp, fp, r8, lsl #12
    179c:	38040700 	stmdacc	r4, {r8, r9, sl}
    17a0:	00000005 	andeq	r0, r0, r5
    17a4:	000ca808 	andeq	sl, ip, r8, lsl #16
    17a8:	64050700 	strvs	r0, [r5], #-1792	; 0xfffff900
    17ac:	0c000000 	stceq	0, cr0, [r0], {-0}
    17b0:	000c0a08 	andeq	r0, ip, r8, lsl #20
    17b4:	64060700 	strvs	r0, [r6], #-1792	; 0xfffff900
    17b8:	10000000 	andne	r0, r0, r0
    17bc:	00023208 	andeq	r3, r2, r8, lsl #4
    17c0:	64070700 	strvs	r0, [r7], #-1792	; 0xfffff900
    17c4:	14000000 	strne	r0, [r0], #-0
    17c8:	054f0b00 	strbeq	r0, [pc, #-2816]	; cd0 <CPSR_IRQ_INHIBIT+0xc50>
    17cc:	05480000 	strbeq	r0, [r8, #-0]
    17d0:	480c0000 	stmdami	ip, {}	; <UNPREDICTABLE>
    17d4:	09000005 	stmdbeq	r0, {r0, r2}
    17d8:	07040200 	streq	r0, [r4, -r0, lsl #4]
    17dc:	00000140 	andeq	r0, r0, r0, asr #2
    17e0:	f3080102 	vrhadd.u8	d0, d8, d2
    17e4:	03000000 	movweq	r0, #0
    17e8:	00000c5e 	andeq	r0, r0, lr, asr ip
    17ec:	04ff0807 	ldrbteq	r0, [pc], #2055	; 17f4 <_heap_top+0x7f4>
    17f0:	390d0000 	stmdbcc	sp, {}	; <UNPREDICTABLE>
    17f4:	0100000c 	tsteq	r0, ip
    17f8:	00057216 	andeq	r7, r5, r6, lsl r2
    17fc:	18030500 	stmdane	r3, {r8, sl}
    1800:	0e000094 	mcreq	0, 0, r0, cr0, cr4, {4}
    1804:	00016604 	andeq	r6, r1, r4, lsl #12
    1808:	0c1e0d00 	ldceq	13, cr0, [lr], {-0}
    180c:	17010000 	strne	r0, [r1, -r0]
    1810:	00000589 	andeq	r0, r0, r9, lsl #11
    1814:	941c0305 	ldrls	r0, [ip], #-773	; 0xfffffcfb
    1818:	040e0000 	streq	r0, [lr], #-0
    181c:	0000013a 	andeq	r0, r0, sl, lsr r1
    1820:	000bb10d 	andeq	fp, fp, sp, lsl #2
    1824:	56180100 	ldrpl	r0, [r8], -r0, lsl #2
    1828:	05000005 	streq	r0, [r0, #-5]
    182c:	0094fc03 	addseq	pc, r4, r3, lsl #24
    1830:	0b3c0f00 	bleq	f05438 <_stack+0xe85438>
    1834:	6a010000 	bvs	4183c <__bss_end__+0x38328>
    1838:	00008de0 	andeq	r8, r0, r0, ror #27
    183c:	000000e0 	andeq	r0, r0, r0, ror #1
    1840:	05d29c01 	ldrbeq	r9, [r2, #3073]	; 0xc01
    1844:	480d0000 	stmdami	sp, {}	; <UNPREDICTABLE>
    1848:	0100000c 	tsteq	r0, ip
    184c:	0000826c 	andeq	r8, r0, ip, ror #4
    1850:	74910200 	ldrvc	r0, [r1], #512	; 0x200
    1854:	000c650d 	andeq	r6, ip, sp, lsl #10
    1858:	4f6d0100 	svcmi	0x006d0100
    185c:	02000005 	andeq	r0, r0, #5
    1860:	10007391 	mulne	r0, r1, r3
    1864:	00000c73 	andeq	r0, r0, r3, ror ip
    1868:	00646501 	rsbeq	r6, r4, r1, lsl #10
    186c:	8da80000 	stchi	0, cr0, [r8]
    1870:	00380000 	eorseq	r0, r8, r0
    1874:	9c010000 	stcls	0, cr0, [r1], {-0}
    1878:	00000608 	andeq	r0, r0, r8, lsl #12
    187c:	000c5111 	andeq	r5, ip, r1, lsl r1
    1880:	08650100 	stmdaeq	r5!, {r8}^
    1884:	02000006 	andeq	r0, r0, #6
    1888:	4d117491 	cfldrsmi	mvf7, [r1, #-580]	; 0xfffffdbc
    188c:	0100000b 	tsteq	r0, fp
    1890:	00006465 	andeq	r6, r0, r5, ror #8
    1894:	70910200 	addsvc	r0, r1, r0, lsl #4
    1898:	4f040e00 	svcmi	0x00040e00
    189c:	0f000005 	svceq	0x00000005
    18a0:	00000cf6 	strdeq	r0, [r0], -r6
    18a4:	8d605c01 	stclhi	12, cr5, [r0, #-4]!
    18a8:	00480000 	subeq	r0, r8, r0
    18ac:	9c010000 	stcls	0, cr0, [r1], {-0}
    18b0:	00000632 	andeq	r0, r0, r2, lsr r6
    18b4:	00094711 	andeq	r4, r9, r1, lsl r7
    18b8:	085c0100 	ldmdaeq	ip, {r8}^
    18bc:	02000006 	andeq	r0, r0, #6
    18c0:	10007491 	mulne	r0, r1, r4
    18c4:	00000cd1 	ldrdeq	r0, [r0], -r1
    18c8:	00645201 	rsbeq	r5, r4, r1, lsl #4
    18cc:	8cfc0000 	ldclhi	0, cr0, [ip]
    18d0:	00640000 	rsbeq	r0, r4, r0
    18d4:	9c010000 	stcls	0, cr0, [r1], {-0}
    18d8:	00000674 	andeq	r0, r0, r4, ror r6
    18dc:	00094711 	andeq	r4, r9, r1, lsl r7
    18e0:	08520100 	ldmdaeq	r2, {r8}^
    18e4:	02000006 	andeq	r0, r0, #6
    18e8:	6c126c91 	ldcvs	12, cr6, [r2], {145}	; 0x91
    18ec:	01006e65 	tsteq	r0, r5, ror #28
    18f0:	00006452 	andeq	r6, r0, r2, asr r4
    18f4:	68910200 	ldmvs	r1, {r9}
    18f8:	01006913 	tsteq	r0, r3, lsl r9
    18fc:	00006454 	andeq	r6, r0, r4, asr r4
    1900:	74910200 	ldrvc	r0, [r1], #512	; 0x200
    1904:	0b6f1400 	bleq	1bc690c <_stack+0x1b4690c>
    1908:	49010000 	stmdbmi	r1, {}	; <UNPREDICTABLE>
    190c:	00008ca8 	andeq	r8, r0, r8, lsr #25
    1910:	00000054 	andeq	r0, r0, r4, asr r0
    1914:	06969c01 	ldreq	r9, [r6], r1, lsl #24
    1918:	63120000 	tstvs	r2, #0
    191c:	4f490100 	svcmi	0x00490100
    1920:	02000005 	andeq	r0, r0, #5
    1924:	0f007791 	svceq	0x00007791
    1928:	00000b83 	andeq	r0, r0, r3, lsl #23
    192c:	8b6c2401 	blhi	1b0a938 <_stack+0x1a8a938>
    1930:	013c0000 	teqeq	ip, r0
    1934:	9c010000 	stcls	0, cr0, [r1], {-0}
    1938:	000006c6 	andeq	r0, r0, r6, asr #13
    193c:	01006913 	tsteq	r0, r3, lsl r9
    1940:	00006b26 	andeq	r6, r0, r6, lsr #22
    1944:	70910200 	addsvc	r0, r1, r0, lsl #4
    1948:	000c560d 	andeq	r5, ip, sp, lsl #12
    194c:	c6280100 	strtgt	r0, [r8], -r0, lsl #2
    1950:	02000006 	andeq	r0, r0, #6
    1954:	0e007491 	mcreq	4, 0, r7, cr0, cr1, {4}
    1958:	0004f404 	andeq	pc, r4, r4, lsl #8
    195c:	0c881500 	cfstr32eq	mvfx1, [r8], {0}
    1960:	1f010000 	svcne	0x00010000
    1964:	00000589 	andeq	r0, r0, r9, lsl #11
    1968:	00008b48 	andeq	r8, r0, r8, asr #22
    196c:	00000024 	andeq	r0, r0, r4, lsr #32
    1970:	bc159c01 	ldclt	12, cr9, [r5], {1}
    1974:	0100000c 	tsteq	r0, ip
    1978:	0005721a 	andeq	r7, r5, sl, lsl r2
    197c:	008b2400 	addeq	r2, fp, r0, lsl #8
    1980:	00002400 	andeq	r2, r0, r0, lsl #8
    1984:	009c0100 	addseq	r0, ip, r0, lsl #2
    1988:	000009f3 	strdeq	r0, [r0], -r3
    198c:	08480004 	stmdaeq	r8, {r2}^
    1990:	01040000 	mrseq	r0, (UNDEF: 4)
    1994:	00000044 	andeq	r0, r0, r4, asr #32
    1998:	000d5c0c 	andeq	r5, sp, ip, lsl #24
    199c:	000f4700 	andeq	r4, pc, r0, lsl #14
    19a0:	008ec000 	addeq	ip, lr, r0
    19a4:	0000a800 	andeq	sl, r0, r0, lsl #16
    19a8:	000a7700 	andeq	r7, sl, r0, lsl #14
    19ac:	06010200 	streq	r0, [r1], -r0, lsl #4
    19b0:	000000ec 	andeq	r0, r0, ip, ror #1
    19b4:	ea080102 	b	201dc4 <_stack+0x181dc4>
    19b8:	02000000 	andeq	r0, r0, #0
    19bc:	015e0502 	cmpeq	lr, r2, lsl #10
    19c0:	02020000 	andeq	r0, r2, #0
    19c4:	0000f807 	andeq	pc, r0, r7, lsl #16
    19c8:	05040200 	streq	r0, [r4, #-512]	; 0xfffffe00
    19cc:	0000014e 	andeq	r0, r0, lr, asr #2
    19d0:	0001c003 	andeq	ip, r1, r3
    19d4:	53410200 	movtpl	r0, #4608	; 0x1200
    19d8:	02000000 	andeq	r0, r0, #0
    19dc:	012e0704 			; <UNDEFINED> instruction: 0x012e0704
    19e0:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
    19e4:	00014905 	andeq	r4, r1, r5, lsl #18
    19e8:	07080200 	streq	r0, [r8, -r0, lsl #4]
    19ec:	00000129 	andeq	r0, r0, r9, lsr #2
    19f0:	69050404 	stmdbvs	r5, {r2, sl}
    19f4:	0200746e 	andeq	r7, r0, #1845493760	; 0x6e000000
    19f8:	01330704 	teqeq	r3, r4, lsl #14
    19fc:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
    1a00:	000f0704 	andeq	r0, pc, r4, lsl #14
    1a04:	03040500 	movweq	r0, #17664	; 0x4500
    1a08:	00000f70 	andeq	r0, r0, r0, ror pc
    1a0c:	00680703 	rsbeq	r0, r8, r3, lsl #14
    1a10:	40030000 	andmi	r0, r3, r0
    1a14:	0400000f 	streq	r0, [r0], #-15
    1a18:	0000412c 	andeq	r4, r0, ip, lsr #2
    1a1c:	10370300 	eorsne	r0, r7, r0, lsl #6
    1a20:	72040000 	andvc	r0, r4, #0
    1a24:	00000041 	andeq	r0, r0, r1, asr #32
    1a28:	000ed506 	andeq	sp, lr, r6, lsl #10
    1a2c:	01650500 	cmneq	r5, r0, lsl #10
    1a30:	0000006f 	andeq	r0, r0, pc, rrx
    1a34:	a6040407 	strge	r0, [r4], -r7, lsl #8
    1a38:	000000cb 	andeq	r0, r0, fp, asr #1
    1a3c:	000ecf08 	andeq	ip, lr, r8, lsl #30
    1a40:	a0a80400 	adcge	r0, r8, r0, lsl #8
    1a44:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
    1a48:	00000e81 	andeq	r0, r0, r1, lsl #29
    1a4c:	00cba904 	sbceq	sl, fp, r4, lsl #18
    1a50:	09000000 	stmdbeq	r0, {}	; <UNPREDICTABLE>
    1a54:	0000002c 	andeq	r0, r0, ip, lsr #32
    1a58:	000000db 	ldrdeq	r0, [r0], -fp
    1a5c:	0000db0a 	andeq	sp, r0, sl, lsl #22
    1a60:	02000300 	andeq	r0, r0, #0, 6
    1a64:	01400704 	cmpeq	r0, r4, lsl #14
    1a68:	080b0000 	stmdaeq	fp, {}	; <UNPREDICTABLE>
    1a6c:	0103a304 	tsteq	r3, r4, lsl #6
    1a70:	210c0000 	mrscs	r0, (UNDEF: 12)
    1a74:	04000010 	streq	r0, [r0], #-16
    1a78:	000068a5 	andeq	r6, r0, r5, lsr #17
    1a7c:	290c0000 	stmdbcs	ip, {}	; <UNPREDICTABLE>
    1a80:	04000010 	streq	r0, [r0], #-16
    1a84:	0000acaa 	andeq	sl, r0, sl, lsr #25
    1a88:	03000400 	movweq	r0, #1024	; 0x400
    1a8c:	00000fae 	andeq	r0, r0, lr, lsr #31
    1a90:	00e2ab04 	rsceq	sl, r2, r4, lsl #22
    1a94:	4a030000 	bmi	c1a9c <_stack+0x41a9c>
    1a98:	0400000e 	streq	r0, [r0], #-14
    1a9c:	00007faf 	andeq	r7, r0, pc, lsr #31
    1aa0:	107c0300 	rsbsne	r0, ip, r0, lsl #6
    1aa4:	16060000 	strne	r0, [r6], -r0
    1aa8:	00000053 	andeq	r0, r0, r3, asr r0
    1aac:	000e5b0d 	andeq	r5, lr, sp, lsl #22
    1ab0:	2d061800 	stccs	8, cr1, [r6, #-0]
    1ab4:	00000177 	andeq	r0, r0, r7, ror r1
    1ab8:	000fcf0c 	andeq	ip, pc, ip, lsl #30
    1abc:	772f0600 	strvc	r0, [pc, -r0, lsl #12]!
    1ac0:	00000001 	andeq	r0, r0, r1
    1ac4:	006b5f0e 	rsbeq	r5, fp, lr, lsl #30
    1ac8:	00683006 	rsbeq	r3, r8, r6
    1acc:	0c040000 	stceq	0, cr0, [r4], {-0}
    1ad0:	0000100c 	andeq	r1, r0, ip
    1ad4:	00683006 	rsbeq	r3, r8, r6
    1ad8:	0c080000 	stceq	0, cr0, [r8], {-0}
    1adc:	00000e44 	andeq	r0, r0, r4, asr #28
    1ae0:	00683006 	rsbeq	r3, r8, r6
    1ae4:	0c0c0000 	stceq	0, cr0, [ip], {-0}
    1ae8:	000010c3 	andeq	r1, r0, r3, asr #1
    1aec:	00683006 	rsbeq	r3, r8, r6
    1af0:	0e100000 	cdpeq	0, 1, cr0, cr0, cr0, {0}
    1af4:	0600785f 			; <UNDEFINED> instruction: 0x0600785f
    1af8:	00017d31 	andeq	r7, r1, r1, lsr sp
    1afc:	0f001400 	svceq	0x00001400
    1b00:	00012404 	andeq	r2, r1, r4, lsl #8
    1b04:	01190900 	tsteq	r9, r0, lsl #18
    1b08:	018d0000 	orreq	r0, sp, r0
    1b0c:	db0a0000 	blle	281b14 <_stack+0x201b14>
    1b10:	00000000 	andeq	r0, r0, r0
    1b14:	0e7c0d00 	cdpeq	13, 7, cr0, cr12, cr0, {0}
    1b18:	06240000 	strteq	r0, [r4], -r0
    1b1c:	00020635 	andeq	r0, r2, r5, lsr r6
    1b20:	0dad0c00 	stceq	12, cr0, [sp]
    1b24:	37060000 	strcc	r0, [r6, -r0]
    1b28:	00000068 	andeq	r0, r0, r8, rrx
    1b2c:	103f0c00 	eorsne	r0, pc, r0, lsl #24
    1b30:	38060000 	stmdacc	r6, {}	; <UNPREDICTABLE>
    1b34:	00000068 	andeq	r0, r0, r8, rrx
    1b38:	0dbc0c04 	ldceq	12, cr0, [ip, #16]!
    1b3c:	39060000 	stmdbcc	r6, {}	; <UNPREDICTABLE>
    1b40:	00000068 	andeq	r0, r0, r8, rrx
    1b44:	11390c08 	teqne	r9, r8, lsl #24
    1b48:	3a060000 	bcc	181b50 <_stack+0x101b50>
    1b4c:	00000068 	andeq	r0, r0, r8, rrx
    1b50:	0f1a0c0c 	svceq	0x001a0c0c
    1b54:	3b060000 	blcc	181b5c <_stack+0x101b5c>
    1b58:	00000068 	andeq	r0, r0, r8, rrx
    1b5c:	0eea0c10 	mcreq	12, 7, r0, cr10, cr0, {0}
    1b60:	3c060000 	stccc	0, cr0, [r6], {-0}
    1b64:	00000068 	andeq	r0, r0, r8, rrx
    1b68:	10c80c14 	sbcne	r0, r8, r4, lsl ip
    1b6c:	3d060000 	stccc	0, cr0, [r6, #-0]
    1b70:	00000068 	andeq	r0, r0, r8, rrx
    1b74:	0f900c18 	svceq	0x00900c18
    1b78:	3e060000 	cdpcc	0, 0, cr0, cr6, cr0, {0}
    1b7c:	00000068 	andeq	r0, r0, r8, rrx
    1b80:	11000c1c 	tstne	r0, ip, lsl ip
    1b84:	3f060000 	svccc	0x00060000
    1b88:	00000068 	andeq	r0, r0, r8, rrx
    1b8c:	cb100020 	blgt	401c14 <_stack+0x381c14>
    1b90:	0800000d 	stmdaeq	r0, {r0, r2, r3}
    1b94:	46480601 	strbmi	r0, [r8], -r1, lsl #12
    1b98:	0c000002 	stceq	0, cr0, [r0], {2}
    1b9c:	00000e37 	andeq	r0, r0, r7, lsr lr
    1ba0:	02464906 	subeq	r4, r6, #98304	; 0x18000
    1ba4:	0c000000 	stceq	0, cr0, [r0], {-0}
    1ba8:	00000d06 	andeq	r0, r0, r6, lsl #26
    1bac:	02464a06 	subeq	r4, r6, #24576	; 0x6000
    1bb0:	11800000 	orrne	r0, r0, r0
    1bb4:	0000106e 	andeq	r1, r0, lr, rrx
    1bb8:	01194c06 	tsteq	r9, r6, lsl #24
    1bbc:	01000000 	mrseq	r0, (UNDEF: 0)
    1bc0:	000df011 	andeq	pc, sp, r1, lsl r0	; <UNPREDICTABLE>
    1bc4:	194f0600 	stmdbne	pc, {r9, sl}^	; <UNPREDICTABLE>
    1bc8:	04000001 	streq	r0, [r0], #-1
    1bcc:	7d090001 	stcvc	0, cr0, [r9, #-4]
    1bd0:	56000000 	strpl	r0, [r0], -r0
    1bd4:	0a000002 	beq	1be4 <_heap_top+0xbe4>
    1bd8:	000000db 	ldrdeq	r0, [r0], -fp
    1bdc:	2310001f 	tstcs	r0, #31
    1be0:	9000000f 	andls	r0, r0, pc
    1be4:	945b0601 	ldrbls	r0, [fp], #-1537	; 0xfffff9ff
    1be8:	0c000002 	stceq	0, cr0, [r0], {2}
    1bec:	00000fcf 	andeq	r0, r0, pc, asr #31
    1bf0:	02945c06 	addseq	r5, r4, #1536	; 0x600
    1bf4:	0c000000 	stceq	0, cr0, [r0], {-0}
    1bf8:	00000fe7 	andeq	r0, r0, r7, ror #31
    1bfc:	00685d06 	rsbeq	r5, r8, r6, lsl #26
    1c00:	0c040000 	stceq	0, cr0, [r4], {-0}
    1c04:	00000e3f 	andeq	r0, r0, pc, lsr lr
    1c08:	029a5f06 	addseq	r5, sl, #6, 30
    1c0c:	0c080000 	stceq	0, cr0, [r8], {-0}
    1c10:	00000dcb 	andeq	r0, r0, fp, asr #27
    1c14:	02066006 	andeq	r6, r6, #6
    1c18:	00880000 	addeq	r0, r8, r0
    1c1c:	0256040f 	subseq	r0, r6, #251658240	; 0xf000000
    1c20:	aa090000 	bge	241c28 <_stack+0x1c1c28>
    1c24:	aa000002 	bge	1c34 <_heap_top+0xc34>
    1c28:	0a000002 	beq	1c38 <_heap_top+0xc38>
    1c2c:	000000db 	ldrdeq	r0, [r0], -fp
    1c30:	040f001f 	streq	r0, [pc], #-31	; 1c38 <_heap_top+0xc38>
    1c34:	000002b0 			; <UNDEFINED> instruction: 0x000002b0
    1c38:	0f9a0d12 	svceq	0x009a0d12
    1c3c:	06080000 	streq	r0, [r8], -r0
    1c40:	0002d673 	andeq	sp, r2, r3, ror r6
    1c44:	10d80c00 	sbcsne	r0, r8, r0, lsl #24
    1c48:	74060000 	strvc	r0, [r6], #-0
    1c4c:	000002d6 	ldrdeq	r0, [r0], -r6
    1c50:	02310c00 	eorseq	r0, r1, #0, 24
    1c54:	75060000 	strvc	r0, [r6, #-0]
    1c58:	00000068 	andeq	r0, r0, r8, rrx
    1c5c:	040f0004 	streq	r0, [pc], #-4	; 1c64 <_heap_top+0xc64>
    1c60:	0000002c 	andeq	r0, r0, ip, lsr #32
    1c64:	000fb90d 	andeq	fp, pc, sp, lsl #18
    1c68:	b3066800 	movwlt	r6, #26624	; 0x6800
    1c6c:	00000406 	andeq	r0, r0, r6, lsl #8
    1c70:	00705f0e 	rsbseq	r5, r0, lr, lsl #30
    1c74:	02d6b406 	sbcseq	fp, r6, #100663296	; 0x6000000
    1c78:	0e000000 	cdpeq	0, 0, cr0, cr0, cr0, {0}
    1c7c:	0600725f 			; <UNDEFINED> instruction: 0x0600725f
    1c80:	000068b5 			; <UNDEFINED> instruction: 0x000068b5
    1c84:	5f0e0400 	svcpl	0x000e0400
    1c88:	b6060077 			; <UNDEFINED> instruction: 0xb6060077
    1c8c:	00000068 	andeq	r0, r0, r8, rrx
    1c90:	0de90c08 	stcleq	12, cr0, [r9, #32]!
    1c94:	b7060000 	strlt	r0, [r6, -r0]
    1c98:	00000033 	andeq	r0, r0, r3, lsr r0
    1c9c:	0e980c0c 	cdpeq	12, 9, cr0, cr8, cr12, {0}
    1ca0:	b8060000 	stmdalt	r6, {}	; <UNPREDICTABLE>
    1ca4:	00000033 	andeq	r0, r0, r3, lsr r0
    1ca8:	625f0e0e 	subsvs	r0, pc, #14, 28	; 0xe0
    1cac:	b9060066 	stmdblt	r6, {r1, r2, r5, r6}
    1cb0:	000002b1 			; <UNDEFINED> instruction: 0x000002b1
    1cb4:	0d870c10 	stceq	12, cr0, [r7, #64]	; 0x40
    1cb8:	ba060000 	blt	181cc0 <_stack+0x101cc0>
    1cbc:	00000068 	andeq	r0, r0, r8, rrx
    1cc0:	0dd90c18 	ldcleq	12, cr0, [r9, #96]	; 0x60
    1cc4:	c1060000 	mrsgt	r0, (UNDEF: 6)
    1cc8:	0000007d 	andeq	r0, r0, sp, ror r0
    1ccc:	12010c1c 	andne	r0, r1, #28, 24	; 0x1c00
    1cd0:	c3060000 	movwgt	r0, #24576	; 0x6000
    1cd4:	00000573 	andeq	r0, r0, r3, ror r5
    1cd8:	11ec0c20 	mvnne	r0, r0, lsr #24
    1cdc:	c5060000 	strgt	r0, [r6, #-0]
    1ce0:	0000059d 	muleq	r0, sp, r5
    1ce4:	10310c24 	eorsne	r0, r1, r4, lsr #24
    1ce8:	c8060000 	stmdagt	r6, {}	; <UNPREDICTABLE>
    1cec:	000005c1 	andeq	r0, r0, r1, asr #11
    1cf0:	111a0c28 	tstne	sl, r8, lsr #24
    1cf4:	c9060000 	stmdbgt	r6, {}	; <UNPREDICTABLE>
    1cf8:	000005db 	ldrdeq	r0, [r0], -fp
    1cfc:	755f0e2c 	ldrbvc	r0, [pc, #-3628]	; ed8 <CPSR_IRQ_INHIBIT+0xe58>
    1d00:	cc060062 	stcgt	0, cr0, [r6], {98}	; 0x62
    1d04:	000002b1 			; <UNDEFINED> instruction: 0x000002b1
    1d08:	755f0e30 	ldrbvc	r0, [pc, #-3632]	; ee0 <CPSR_IRQ_INHIBIT+0xe60>
    1d0c:	cd060070 	stcgt	0, cr0, [r6, #-448]	; 0xfffffe40
    1d10:	000002d6 	ldrdeq	r0, [r0], -r6
    1d14:	755f0e38 	ldrbvc	r0, [pc, #-3640]	; ee4 <CPSR_IRQ_INHIBIT+0xe64>
    1d18:	ce060072 	mcrgt	0, 0, r0, cr6, cr2, {3}
    1d1c:	00000068 	andeq	r0, r0, r8, rrx
    1d20:	0db60c3c 	ldceq	12, cr0, [r6, #240]!	; 0xf0
    1d24:	d1060000 	mrsle	r0, (UNDEF: 6)
    1d28:	000005e1 	andeq	r0, r0, r1, ror #11
    1d2c:	10f20c40 	rscsne	r0, r2, r0, asr #24
    1d30:	d2060000 	andle	r0, r6, #0
    1d34:	000005f1 	strdeq	r0, [r0], -r1
    1d38:	6c5f0e43 	mrrcvs	14, 4, r0, pc, cr3	; <UNPREDICTABLE>
    1d3c:	d5060062 	strle	r0, [r6, #-98]	; 0xffffff9e
    1d40:	000002b1 			; <UNDEFINED> instruction: 0x000002b1
    1d44:	0dff0c44 	ldcleq	12, cr0, [pc, #272]!	; 1e5c <_heap_top+0xe5c>
    1d48:	d8060000 	stmdale	r6, {}	; <UNPREDICTABLE>
    1d4c:	00000068 	andeq	r0, r0, r8, rrx
    1d50:	0e100c4c 	cdpeq	12, 1, cr0, cr0, cr12, {2}
    1d54:	d9060000 	stmdble	r6, {}	; <UNPREDICTABLE>
    1d58:	0000008a 	andeq	r0, r0, sl, lsl #1
    1d5c:	0c500c50 	mrrceq	12, 5, r0, r0, cr0	; <UNPREDICTABLE>
    1d60:	dc060000 	stcle	0, cr0, [r6], {-0}
    1d64:	00000424 	andeq	r0, r0, r4, lsr #8
    1d68:	0edc0c54 	mrceq	12, 6, r0, cr12, cr4, {2}
    1d6c:	e0060000 	and	r0, r6, r0
    1d70:	0000010e 	andeq	r0, r0, lr, lsl #2
    1d74:	0fc10c58 	svceq	0x00c10c58
    1d78:	e2060000 	and	r0, r6, #0
    1d7c:	00000103 	andeq	r0, r0, r3, lsl #2
    1d80:	0ee20c5c 	mcreq	12, 7, r0, cr2, cr12, {2}
    1d84:	e3060000 	movw	r0, #24576	; 0x6000
    1d88:	00000068 	andeq	r0, r0, r8, rrx
    1d8c:	68130064 	ldmdavs	r3, {r2, r5, r6}
    1d90:	24000000 	strcs	r0, [r0], #-0
    1d94:	14000004 	strne	r0, [r0], #-4
    1d98:	00000424 	andeq	r0, r0, r4, lsr #8
    1d9c:	00007d14 	andeq	r7, r0, r4, lsl sp
    1da0:	05611400 	strbeq	r1, [r1, #-1024]!	; 0xfffffc00
    1da4:	68140000 	ldmdavs	r4, {}	; <UNPREDICTABLE>
    1da8:	00000000 	andeq	r0, r0, r0
    1dac:	042f040f 	strteq	r0, [pc], #-1039	; 1db4 <_heap_top+0xdb4>
    1db0:	24150000 	ldrcs	r0, [r5], #-0
    1db4:	16000004 	strne	r0, [r0], -r4
    1db8:	00001014 	andeq	r1, r0, r4, lsl r0
    1dbc:	38060428 	stmdacc	r6, {r3, r5, sl}
    1dc0:	00056102 	andeq	r6, r5, r2, lsl #2
    1dc4:	0f891700 	svceq	0x00891700
    1dc8:	3a060000 	bcc	181dd0 <_stack+0x101dd0>
    1dcc:	00006802 	andeq	r6, r0, r2, lsl #16
    1dd0:	f8170000 			; <UNDEFINED> instruction: 0xf8170000
    1dd4:	0600000d 	streq	r0, [r0], -sp
    1dd8:	0648023f 			; <UNDEFINED> instruction: 0x0648023f
    1ddc:	17040000 	strne	r0, [r4, -r0]
    1de0:	00000e88 	andeq	r0, r0, r8, lsl #29
    1de4:	48023f06 	stmdami	r2, {r1, r2, r8, r9, sl, fp, ip, sp}
    1de8:	08000006 	stmdaeq	r0, {r1, r2}
    1dec:	000e5317 	andeq	r5, lr, r7, lsl r3
    1df0:	023f0600 	eorseq	r0, pc, #0, 12
    1df4:	00000648 	andeq	r0, r0, r8, asr #12
    1df8:	0fe2170c 	svceq	0x00e2170c
    1dfc:	41060000 	mrsmi	r0, (UNDEF: 6)
    1e00:	00006802 	andeq	r6, r0, r2, lsl #16
    1e04:	31171000 	tstcc	r7, r0
    1e08:	0600000d 	streq	r0, [r0], -sp
    1e0c:	082a0242 	stmdaeq	sl!, {r1, r6, r9}
    1e10:	17140000 	ldrne	r0, [r4, -r0]
    1e14:	000010a4 	andeq	r1, r0, r4, lsr #1
    1e18:	68024406 	stmdavs	r2, {r1, r2, sl, lr}
    1e1c:	30000000 	andcc	r0, r0, r0
    1e20:	000fec17 	andeq	lr, pc, r7, lsl ip	; <UNPREDICTABLE>
    1e24:	02450600 	subeq	r0, r5, #0, 12
    1e28:	00000597 	muleq	r0, r7, r5
    1e2c:	0f351734 	svceq	0x00351734
    1e30:	47060000 	strmi	r0, [r6, -r0]
    1e34:	00006802 	andeq	r6, r0, r2, lsl #16
    1e38:	02173800 	andseq	r3, r7, #0, 16
    1e3c:	06000010 			; <UNDEFINED> instruction: 0x06000010
    1e40:	08450249 	stmdaeq	r5, {r0, r3, r6, r9}^
    1e44:	173c0000 	ldrne	r0, [ip, -r0]!
    1e48:	00000ec7 	andeq	r0, r0, r7, asr #29
    1e4c:	77024c06 	strvc	r4, [r2, -r6, lsl #24]
    1e50:	40000001 	andmi	r0, r0, r1
    1e54:	000e7217 	andeq	r7, lr, r7, lsl r2
    1e58:	024d0600 	subeq	r0, sp, #0, 12
    1e5c:	00000068 	andeq	r0, r0, r8, rrx
    1e60:	11341744 	teqne	r4, r4, asr #14
    1e64:	4e060000 	cdpmi	0, 0, cr0, cr6, cr0, {0}
    1e68:	00017702 	andeq	r7, r1, r2, lsl #14
    1e6c:	66174800 	ldrvs	r4, [r7], -r0, lsl #16
    1e70:	0600000f 	streq	r0, [r0], -pc
    1e74:	084b024f 	stmdaeq	fp, {r0, r1, r2, r3, r6, r9}^
    1e78:	174c0000 	strbne	r0, [ip, -r0]
    1e7c:	00000e90 	muleq	r0, r0, lr
    1e80:	68025206 	stmdavs	r2, {r1, r2, r9, ip, lr}
    1e84:	50000000 	andpl	r0, r0, r0
    1e88:	000e0817 	andeq	r0, lr, r7, lsl r8
    1e8c:	02530600 	subseq	r0, r3, #0, 12
    1e90:	00000561 	andeq	r0, r0, r1, ror #10
    1e94:	0f821754 	svceq	0x00821754
    1e98:	76060000 	strvc	r0, [r6], -r0
    1e9c:	00080802 	andeq	r0, r8, r2, lsl #16
    1ea0:	23185800 	tstcs	r8, #0, 16
    1ea4:	0600000f 	streq	r0, [r0], -pc
    1ea8:	0294027a 	addseq	r0, r4, #-1610612729	; 0xa0000007
    1eac:	01480000 	mrseq	r0, (UNDEF: 72)
    1eb0:	000ea518 	andeq	sl, lr, r8, lsl r5
    1eb4:	027b0600 	rsbseq	r0, fp, #0, 12
    1eb8:	00000256 	andeq	r0, r0, r6, asr r2
    1ebc:	e818014c 	ldmda	r8, {r2, r3, r6, r8}
    1ec0:	06000010 			; <UNDEFINED> instruction: 0x06000010
    1ec4:	085c027f 	ldmdaeq	ip, {r0, r1, r2, r3, r4, r5, r6, r9}^
    1ec8:	02dc0000 	sbcseq	r0, ip, #0
    1ecc:	000de118 	andeq	lr, sp, r8, lsl r1
    1ed0:	02840600 	addeq	r0, r4, #0, 12
    1ed4:	0000060d 	andeq	r0, r0, sp, lsl #12
    1ed8:	c61802e0 	ldrgt	r0, [r8], -r0, ror #5
    1edc:	0600000d 	streq	r0, [r0], -sp
    1ee0:	08680285 	stmdaeq	r8!, {r0, r2, r7, r9}^
    1ee4:	02ec0000 	rsceq	r0, ip, #0
    1ee8:	67040f00 	strvs	r0, [r4, -r0, lsl #30]
    1eec:	02000005 	andeq	r0, r0, #5
    1ef0:	00f30801 	rscseq	r0, r3, r1, lsl #16
    1ef4:	67150000 	ldrvs	r0, [r5, -r0]
    1ef8:	0f000005 	svceq	0x00000005
    1efc:	00040604 	andeq	r0, r4, r4, lsl #12
    1f00:	00681300 	rsbeq	r1, r8, r0, lsl #6
    1f04:	05970000 	ldreq	r0, [r7]
    1f08:	24140000 	ldrcs	r0, [r4], #-0
    1f0c:	14000004 	strne	r0, [r0], #-4
    1f10:	0000007d 	andeq	r0, r0, sp, ror r0
    1f14:	00059714 	andeq	r9, r5, r4, lsl r7
    1f18:	00681400 	rsbeq	r1, r8, r0, lsl #8
    1f1c:	0f000000 	svceq	0x00000000
    1f20:	00056e04 	andeq	r6, r5, r4, lsl #28
    1f24:	79040f00 	stmdbvc	r4, {r8, r9, sl, fp}
    1f28:	13000005 	movwne	r0, #5
    1f2c:	00000095 	muleq	r0, r5, r0
    1f30:	000005c1 	andeq	r0, r0, r1, asr #11
    1f34:	00042414 	andeq	r2, r4, r4, lsl r4
    1f38:	007d1400 	rsbseq	r1, sp, r0, lsl #8
    1f3c:	95140000 	ldrls	r0, [r4, #-0]
    1f40:	14000000 	strne	r0, [r0], #-0
    1f44:	00000068 	andeq	r0, r0, r8, rrx
    1f48:	a3040f00 	movwge	r0, #20224	; 0x4f00
    1f4c:	13000005 	movwne	r0, #5
    1f50:	00000068 	andeq	r0, r0, r8, rrx
    1f54:	000005db 	ldrdeq	r0, [r0], -fp
    1f58:	00042414 	andeq	r2, r4, r4, lsl r4
    1f5c:	007d1400 	rsbseq	r1, sp, r0, lsl #8
    1f60:	0f000000 	svceq	0x00000000
    1f64:	0005c704 	andeq	ip, r5, r4, lsl #14
    1f68:	002c0900 	eoreq	r0, ip, r0, lsl #18
    1f6c:	05f10000 	ldrbeq	r0, [r1, #0]!
    1f70:	db0a0000 	blle	281f78 <_stack+0x201f78>
    1f74:	02000000 	andeq	r0, r0, #0
    1f78:	002c0900 	eoreq	r0, ip, r0, lsl #18
    1f7c:	06010000 	streq	r0, [r1], -r0
    1f80:	db0a0000 	blle	281f88 <_stack+0x201f88>
    1f84:	00000000 	andeq	r0, r0, r0
    1f88:	0fa70600 	svceq	0x00a70600
    1f8c:	1d060000 	stcne	0, cr0, [r6, #-0]
    1f90:	0002dc01 	andeq	sp, r2, r1, lsl #24
    1f94:	10d21900 	sbcsne	r1, r2, r0, lsl #18
    1f98:	060c0000 	streq	r0, [ip], -r0
    1f9c:	06420121 	strbeq	r0, [r2], -r1, lsr #2
    1fa0:	cf170000 	svcgt	0x00170000
    1fa4:	0600000f 	streq	r0, [r0], -pc
    1fa8:	06420123 	strbeq	r0, [r2], -r3, lsr #2
    1fac:	17000000 	strne	r0, [r0, -r0]
    1fb0:	00000e9e 	muleq	r0, lr, lr
    1fb4:	68012406 	stmdavs	r1, {r1, r2, sl, sp}
    1fb8:	04000000 	streq	r0, [r0], #-0
    1fbc:	000fa117 	andeq	sl, pc, r7, lsl r1	; <UNPREDICTABLE>
    1fc0:	01250600 			; <UNDEFINED> instruction: 0x01250600
    1fc4:	00000648 	andeq	r0, r0, r8, asr #12
    1fc8:	040f0008 	streq	r0, [pc], #-8	; 1fd0 <_heap_top+0xfd0>
    1fcc:	0000060d 	andeq	r0, r0, sp, lsl #12
    1fd0:	0601040f 	streq	r0, [r1], -pc, lsl #8
    1fd4:	29190000 	ldmdbcs	r9, {}	; <UNPREDICTABLE>
    1fd8:	0e00000d 	cdpeq	0, 0, cr0, cr0, cr13, {0}
    1fdc:	83013d06 	movwhi	r3, #7430	; 0x1d06
    1fe0:	17000006 	strne	r0, [r0, -r6]
    1fe4:	0000101b 	andeq	r1, r0, fp, lsl r0
    1fe8:	83013e06 	movwhi	r3, #7686	; 0x1e06
    1fec:	00000006 	andeq	r0, r0, r6
    1ff0:	00104817 	andseq	r4, r0, r7, lsl r8
    1ff4:	013f0600 	teqeq	pc, r0, lsl #12
    1ff8:	00000683 	andeq	r0, r0, r3, lsl #13
    1ffc:	10771706 	rsbsne	r1, r7, r6, lsl #14
    2000:	40060000 	andmi	r0, r6, r0
    2004:	00003a01 	andeq	r3, r0, r1, lsl #20
    2008:	09000c00 	stmdbeq	r0, {sl, fp}
    200c:	0000003a 	andeq	r0, r0, sl, lsr r0
    2010:	00000693 	muleq	r0, r3, r6
    2014:	0000db0a 	andeq	sp, r0, sl, lsl #22
    2018:	1a000200 	bne	2820 <_heap_top+0x1820>
    201c:	025706d0 	subseq	r0, r7, #208, 12	; 0xd000000
    2020:	00000794 	muleq	r0, r4, r7
    2024:	0010b617 	andseq	fp, r0, r7, lsl r6
    2028:	02590600 	subseq	r0, r9, #0, 12
    202c:	0000006f 	andeq	r0, r0, pc, rrx
    2030:	10611700 	rsbne	r1, r1, r0, lsl #14
    2034:	5a060000 	bpl	18203c <_stack+0x10203c>
    2038:	00056102 	andeq	r6, r5, r2, lsl #2
    203c:	ba170400 	blt	5c3044 <_stack+0x543044>
    2040:	0600000e 	streq	r0, [r0], -lr
    2044:	0794025b 			; <UNDEFINED> instruction: 0x0794025b
    2048:	17080000 	strne	r0, [r8, -r0]
    204c:	0000110b 	andeq	r1, r0, fp, lsl #2
    2050:	8d025c06 	stchi	12, cr5, [r2, #-24]	; 0xffffffe8
    2054:	24000001 	strcs	r0, [r0], #-1
    2058:	000e6317 	andeq	r6, lr, r7, lsl r3
    205c:	025d0600 	subseq	r0, sp, #0, 12
    2060:	00000068 	andeq	r0, r0, r8, rrx
    2064:	0fca1748 	svceq	0x00ca1748
    2068:	5e060000 	cdppl	0, 0, cr0, cr6, cr0, {0}
    206c:	00006102 	andeq	r6, r0, r2, lsl #2
    2070:	21175000 	tstcs	r7, r0
    2074:	06000011 			; <UNDEFINED> instruction: 0x06000011
    2078:	064e025f 			; <UNDEFINED> instruction: 0x064e025f
    207c:	17580000 	ldrbne	r0, [r8, -r0]
    2080:	00000fd5 	ldrdeq	r0, [r0], -r5
    2084:	03026006 	movweq	r6, #8198	; 0x2006
    2088:	68000001 	stmdavs	r0, {r0}
    208c:	00112617 	andseq	r2, r1, r7, lsl r6
    2090:	02610600 	rsbeq	r0, r1, #0, 12
    2094:	00000103 	andeq	r0, r0, r3, lsl #2
    2098:	0d9f1770 	ldceq	7, cr1, [pc, #448]	; 2260 <_heap_top+0x1260>
    209c:	62060000 	andvs	r0, r6, #0
    20a0:	00010302 	andeq	r0, r1, r2, lsl #6
    20a4:	de177800 	cdple	8, 1, cr7, cr7, cr0, {0}
    20a8:	06000010 			; <UNDEFINED> instruction: 0x06000010
    20ac:	07a40263 	streq	r0, [r4, r3, ror #4]!
    20b0:	17800000 	strne	r0, [r0, r0]
    20b4:	00000eae 	andeq	r0, r0, lr, lsr #29
    20b8:	b4026406 	strlt	r6, [r2], #-1030	; 0xfffffbfa
    20bc:	88000007 	stmdahi	r0, {r0, r1, r2}
    20c0:	00108417 	andseq	r8, r0, r7, lsl r4
    20c4:	02650600 	rsbeq	r0, r5, #0, 12
    20c8:	00000068 	andeq	r0, r0, r8, rrx
    20cc:	0e2917a0 	cdpeq	7, 2, cr1, cr9, cr0, {5}
    20d0:	66060000 	strvs	r0, [r6], -r0
    20d4:	00010302 	andeq	r0, r1, r2, lsl #6
    20d8:	9017a400 	andsls	sl, r7, r0, lsl #8
    20dc:	0600000d 	streq	r0, [r0], -sp
    20e0:	01030267 	tsteq	r3, r7, ror #4
    20e4:	17ac0000 	strne	r0, [ip, r0]!
    20e8:	00000e18 	andeq	r0, r0, r8, lsl lr
    20ec:	03026806 	movweq	r6, #10246	; 0x2806
    20f0:	b4000001 	strlt	r0, [r0], #-1
    20f4:	000d3c17 	andeq	r3, sp, r7, lsl ip
    20f8:	02690600 	rsbeq	r0, r9, #0, 12
    20fc:	00000103 	andeq	r0, r0, r3, lsl #2
    2100:	0d4b17bc 	stcleq	7, cr1, [fp, #-752]	; 0xfffffd10
    2104:	6a060000 	bvs	18210c <_stack+0x10210c>
    2108:	00010302 	andeq	r0, r1, r2, lsl #6
    210c:	8717c400 	ldrhi	ip, [r7, -r0, lsl #8]
    2110:	0600000f 	streq	r0, [r0], -pc
    2114:	0068026b 	rsbeq	r0, r8, fp, ror #4
    2118:	00cc0000 	sbceq	r0, ip, r0
    211c:	00056709 	andeq	r6, r5, r9, lsl #14
    2120:	0007a400 	andeq	sl, r7, r0, lsl #8
    2124:	00db0a00 	sbcseq	r0, fp, r0, lsl #20
    2128:	00190000 	andseq	r0, r9, r0
    212c:	00056709 	andeq	r6, r5, r9, lsl #14
    2130:	0007b400 	andeq	fp, r7, r0, lsl #8
    2134:	00db0a00 	sbcseq	r0, fp, r0, lsl #20
    2138:	00070000 	andeq	r0, r7, r0
    213c:	00056709 	andeq	r6, r5, r9, lsl #14
    2140:	0007c400 	andeq	ip, r7, r0, lsl #8
    2144:	00db0a00 	sbcseq	r0, fp, r0, lsl #20
    2148:	00170000 	andseq	r0, r7, r0
    214c:	7006f01a 	andvc	pc, r6, sl, lsl r0	; <UNPREDICTABLE>
    2150:	0007e802 	andeq	lr, r7, r2, lsl #16
    2154:	0f131700 	svceq	0x00131700
    2158:	73060000 	movwvc	r0, #24576	; 0x6000
    215c:	0007e802 	andeq	lr, r7, r2, lsl #16
    2160:	f4170000 			; <UNDEFINED> instruction: 0xf4170000
    2164:	0600000e 	streq	r0, [r0], -lr
    2168:	07f80274 			; <UNDEFINED> instruction: 0x07f80274
    216c:	00780000 	rsbseq	r0, r8, r0
    2170:	0002d609 	andeq	sp, r2, r9, lsl #12
    2174:	0007f800 	andeq	pc, r7, r0, lsl #16
    2178:	00db0a00 	sbcseq	r0, fp, r0, lsl #20
    217c:	001d0000 	andseq	r0, sp, r0
    2180:	00006f09 	andeq	r6, r0, r9, lsl #30
    2184:	00080800 	andeq	r0, r8, r0, lsl #16
    2188:	00db0a00 	sbcseq	r0, fp, r0, lsl #20
    218c:	001d0000 	andseq	r0, sp, r0
    2190:	5506f01b 	strpl	pc, [r6, #-27]	; 0xffffffe5
    2194:	00082a02 	andeq	r2, r8, r2, lsl #20
    2198:	10141c00 	andsne	r1, r4, r0, lsl #24
    219c:	6c060000 	stcvs	0, cr0, [r6], {-0}
    21a0:	00069302 	andeq	r9, r6, r2, lsl #6
    21a4:	10f81c00 	rscsne	r1, r8, r0, lsl #24
    21a8:	75060000 	strvc	r0, [r6, #-0]
    21ac:	0007c402 	andeq	ip, r7, r2, lsl #8
    21b0:	67090000 	strvs	r0, [r9, -r0]
    21b4:	3a000005 	bcc	21d0 <_heap_top+0x11d0>
    21b8:	0a000008 	beq	21e0 <_heap_top+0x11e0>
    21bc:	000000db 	ldrdeq	r0, [r0], -fp
    21c0:	451d0018 	ldrmi	r0, [sp, #-24]	; 0xffffffe8
    21c4:	14000008 	strne	r0, [r0], #-8
    21c8:	00000424 	andeq	r0, r0, r4, lsr #8
    21cc:	3a040f00 	bcc	105dd4 <_stack+0x85dd4>
    21d0:	0f000008 	svceq	0x00000008
    21d4:	00017704 	andeq	r7, r1, r4, lsl #14
    21d8:	085c1d00 	ldmdaeq	ip, {r8, sl, fp, ip}^
    21dc:	68140000 	ldmdavs	r4, {}	; <UNPREDICTABLE>
    21e0:	00000000 	andeq	r0, r0, r0
    21e4:	0862040f 	stmdaeq	r2!, {r0, r1, r2, r3, sl}^
    21e8:	040f0000 	streq	r0, [pc], #-0	; 21f0 <_heap_top+0x11f0>
    21ec:	00000851 	andeq	r0, r0, r1, asr r8
    21f0:	00060109 	andeq	r0, r6, r9, lsl #2
    21f4:	00087800 	andeq	r7, r8, r0, lsl #16
    21f8:	00db0a00 	sbcseq	r0, fp, r0, lsl #20
    21fc:	00020000 	andeq	r0, r2, r0
    2200:	0010981e 	andseq	r9, r0, lr, lsl r8
    2204:	02fd0600 	rscseq	r0, sp, #0, 12
    2208:	00000424 	andeq	r0, r0, r4, lsr #8
    220c:	0010911e 	andseq	r9, r0, lr, lsl r1
    2210:	02fe0600 	rscseq	r0, lr, #0, 12
    2214:	0000042a 	andeq	r0, r0, sl, lsr #8
    2218:	0001c203 	andeq	ip, r1, r3, lsl #4
    221c:	48300700 	ldmdami	r0!, {r8, r9, sl}
    2220:	1f000000 	svcne	0x00000000
    2224:	00000890 	muleq	r0, r0, r8
    2228:	00089b15 	andeq	r9, r8, r5, lsl fp
    222c:	0f2b2000 	svceq	0x002b2000
    2230:	5f080000 	svcpl	0x00080000
    2234:	00000561 	andeq	r0, r0, r1, ror #10
    2238:	00056709 	andeq	r6, r5, r9, lsl #14
    223c:	0008c000 	andeq	ip, r8, r0
    2240:	00db0a00 	sbcseq	r0, fp, r0, lsl #20
    2244:	00090000 	andeq	r0, r9, r0
    2248:	0001a503 	andeq	sl, r1, r3, lsl #10
    224c:	9b120900 	blls	484654 <_stack+0x404654>
    2250:	03000008 	movweq	r0, #8
    2254:	000006a0 	andeq	r0, r0, r0, lsr #13
    2258:	08a01309 	stmiaeq	r0!, {r0, r3, r8, r9, ip}
    225c:	2c0b0000 	stccs	0, cr0, [fp], {-0}
    2260:	0963390a 	stmdbeq	r3!, {r1, r3, r8, fp, ip, sp}^
    2264:	a30c0000 	movwge	r0, #49152	; 0xc000
    2268:	0a00000b 	beq	229c <_heap_top+0x129c>
    226c:	0008c03a 	andeq	ip, r8, sl, lsr r0
    2270:	0f0c0000 	svceq	0x000c0000
    2274:	0a00000c 	beq	22ac <_heap_top+0x12ac>
    2278:	0008c03b 	andeq	ip, r8, fp, lsr r0
    227c:	2a0c0400 	bcs	303284 <_stack+0x283284>
    2280:	0a00000c 	beq	22b8 <_heap_top+0x12b8>
    2284:	0008c03c 	andeq	ip, r8, ip, lsr r0
    2288:	ad0c0800 	stcge	8, cr0, [ip, #-0]
    228c:	0a00000c 	beq	22c4 <_heap_top+0x12c4>
    2290:	0008c03d 	andeq	ip, r8, sp, lsr r0
    2294:	940c0c00 	strls	r0, [ip], #-3072	; 0xfffff400
    2298:	0a00000b 	beq	22cc <_heap_top+0x12cc>
    229c:	0008c03e 	andeq	ip, r8, lr, lsr r0
    22a0:	540c1000 	strpl	r1, [ip], #-0
    22a4:	0a00000b 	beq	22d8 <_heap_top+0x12d8>
    22a8:	0008cb3f 	andeq	ip, r8, pc, lsr fp
    22ac:	fb0c1400 	blx	3072b6 <_stack+0x2872b6>
    22b0:	0a00000b 	beq	22e4 <_heap_top+0x12e4>
    22b4:	0008cb40 	andeq	ip, r8, r0, asr #22
    22b8:	220c1800 	andcs	r1, ip, #0, 16
    22bc:	0a00000b 	beq	22f0 <_heap_top+0x12f0>
    22c0:	0008c041 	andeq	ip, r8, r1, asr #32
    22c4:	e60c1c00 	str	r1, [ip], -r0, lsl #24
    22c8:	0a00000c 	beq	2300 <_heap_top+0x1300>
    22cc:	0008c042 	andeq	ip, r8, r2, asr #32
    22d0:	980c2000 	stmdals	ip, {sp}
    22d4:	0a00000c 	beq	230c <_heap_top+0x130c>
    22d8:	0008cb43 	andeq	ip, r8, r3, asr #22
    22dc:	eb0c2400 	bl	30b2e4 <_stack+0x28b2e4>
    22e0:	0a00000b 	beq	2314 <_heap_top+0x1314>
    22e4:	0008c044 	andeq	ip, r8, r4, asr #32
    22e8:	03002800 	movweq	r2, #2048	; 0x800
    22ec:	00000b31 	andeq	r0, r0, r1, lsr fp
    22f0:	08d6450a 	ldmeq	r6, {r1, r3, r8, sl, lr}^
    22f4:	43210000 			; <UNDEFINED> instruction: 0x43210000
    22f8:	01000011 	tsteq	r0, r1, lsl r0
    22fc:	00006809 	andeq	r6, r0, r9, lsl #16
    2300:	008ec000 	addeq	ip, lr, r0
    2304:	0000a800 	andeq	sl, r0, r0, lsl #16
    2308:	e09c0100 	adds	r0, ip, r0, lsl #2
    230c:	22000009 	andcs	r0, r0, #9
    2310:	00000d12 	andeq	r0, r0, r2, lsl sp
    2314:	07940b01 	ldreq	r0, [r4, r1, lsl #22]
    2318:	03050000 	movweq	r0, #20480	; 0x5000
    231c:	00009444 	andeq	r9, r0, r4, asr #8
    2320:	00104e22 	andseq	r4, r0, r2, lsr #28
    2324:	e00c0100 	and	r0, ip, r0, lsl #2
    2328:	05000009 	streq	r0, [r0, #-9]
    232c:	00942003 	addseq	r2, r4, r3
    2330:	00692300 	rsbeq	r2, r9, r0, lsl #6
    2334:	00680e01 	rsbeq	r0, r8, r1, lsl #28
    2338:	91020000 	mrsls	r0, (UNDEF: 2)
    233c:	0c1e2274 	lfmeq	f2, 4, [lr], {116}	; 0x74
    2340:	0f010000 	svceq	0x00010000
    2344:	000009f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>
    2348:	226c9102 	rsbcs	r9, ip, #-2147483648	; 0x80000000
    234c:	00000ffc 	strdeq	r0, [r0], -ip
    2350:	08b01101 	ldmeq	r0!, {r0, r8, ip}
    2354:	91020000 	mrsls	r0, (UNDEF: 2)
    2358:	0efd2260 	cdpeq	2, 15, cr2, cr13, cr0, {3}
    235c:	12010000 	andne	r0, r1, #0
    2360:	00000561 	andeq	r0, r0, r1, ror #10
    2364:	00709102 	rsbseq	r9, r0, r2, lsl #2
    2368:	00056709 	andeq	r6, r5, r9, lsl #14
    236c:	0009f000 	andeq	pc, r9, r0
    2370:	00db0a00 	sbcseq	r0, fp, r0, lsl #20
    2374:	00200000 	eoreq	r0, r0, r0
    2378:	0963040f 	stmdbeq	r3!, {r0, r1, r2, r3, sl}^
    237c:	e8000000 	stmda	r0, {}	; <UNPREDICTABLE>
    2380:	04000002 	streq	r0, [r0], #-2
    2384:	000a0f00 	andeq	r0, sl, r0, lsl #30
    2388:	44010400 	strmi	r0, [r1], #-1024	; 0xfffffc00
    238c:	0c000000 	stceq	0, cr0, [r0], {-0}
    2390:	00001176 	andeq	r1, r0, r6, ror r1
    2394:	00008f68 	andeq	r8, r0, r8, ror #30
    2398:	000000cc 	andeq	r0, r0, ip, asr #1
    239c:	00000c15 	andeq	r0, r0, r5, lsl ip
    23a0:	ec060102 	stfs	f0, [r6], {2}
    23a4:	02000000 	andeq	r0, r0, #0
    23a8:	00ea0801 	rsceq	r0, sl, r1, lsl #16
    23ac:	02020000 	andeq	r0, r2, #0
    23b0:	00015e05 	andeq	r5, r1, r5, lsl #28
    23b4:	07020200 	streq	r0, [r2, -r0, lsl #4]
    23b8:	000000f8 	strdeq	r0, [r0], -r8
    23bc:	4e050402 	cdpmi	4, 0, cr0, cr5, cr2, {0}
    23c0:	03000001 	movweq	r0, #1
    23c4:	000001c0 	andeq	r0, r0, r0, asr #3
    23c8:	004f4102 	subeq	r4, pc, r2, lsl #2
    23cc:	04020000 	streq	r0, [r2], #-0
    23d0:	00012e07 	andeq	r2, r1, r7, lsl #28
    23d4:	05080200 	streq	r0, [r8, #-512]	; 0xfffffe00
    23d8:	00000149 	andeq	r0, r0, r9, asr #2
    23dc:	29070802 	stmdbcs	r7, {r1, fp}
    23e0:	04000001 	streq	r0, [r0], #-1
    23e4:	6e690504 	cdpvs	5, 6, cr0, cr9, cr4, {0}
    23e8:	04020074 	streq	r0, [r2], #-116	; 0xffffff8c
    23ec:	00013307 	andeq	r3, r1, r7, lsl #6
    23f0:	01c20300 	biceq	r0, r2, r0, lsl #6
    23f4:	30030000 	andcc	r0, r3, r0
    23f8:	00000044 	andeq	r0, r0, r4, asr #32
    23fc:	00007205 	andeq	r7, r0, r5, lsl #4
    2400:	007d0600 	rsbseq	r0, sp, r0, lsl #12
    2404:	a5030000 	strge	r0, [r3, #-0]
    2408:	04000001 	streq	r0, [r0], #-1
    240c:	00007d12 	andeq	r7, r0, r2, lsl sp
    2410:	06a00300 	strteq	r0, [r0], r0, lsl #6
    2414:	13040000 	movwne	r0, #16384	; 0x4000
    2418:	00000082 	andeq	r0, r0, r2, lsl #1
    241c:	39052c07 	stmdbcc	r5, {r0, r1, r2, sl, fp, sp}
    2420:	0000012a 	andeq	r0, r0, sl, lsr #2
    2424:	000ba308 	andeq	sl, fp, r8, lsl #6
    2428:	873a0500 	ldrhi	r0, [sl, -r0, lsl #10]!
    242c:	00000000 	andeq	r0, r0, r0
    2430:	000c0f08 	andeq	r0, ip, r8, lsl #30
    2434:	873b0500 	ldrhi	r0, [fp, -r0, lsl #10]!
    2438:	04000000 	streq	r0, [r0], #-0
    243c:	000c2a08 	andeq	r2, ip, r8, lsl #20
    2440:	873c0500 	ldrhi	r0, [ip, -r0, lsl #10]!
    2444:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
    2448:	000cad08 	andeq	sl, ip, r8, lsl #26
    244c:	873d0500 	ldrhi	r0, [sp, -r0, lsl #10]!
    2450:	0c000000 	stceq	0, cr0, [r0], {-0}
    2454:	000b9408 	andeq	r9, fp, r8, lsl #8
    2458:	873e0500 	ldrhi	r0, [lr, -r0, lsl #10]!
    245c:	10000000 	andne	r0, r0, r0
    2460:	000b5408 	andeq	r5, fp, r8, lsl #8
    2464:	923f0500 	eorsls	r0, pc, #0, 10
    2468:	14000000 	strne	r0, [r0], #-0
    246c:	000bfb08 	andeq	pc, fp, r8, lsl #22
    2470:	92400500 	subls	r0, r0, #0, 10
    2474:	18000000 	stmdane	r0, {}	; <UNPREDICTABLE>
    2478:	000b2208 	andeq	r2, fp, r8, lsl #4
    247c:	87410500 	strbhi	r0, [r1, -r0, lsl #10]
    2480:	1c000000 	stcne	0, cr0, [r0], {-0}
    2484:	000ce608 	andeq	lr, ip, r8, lsl #12
    2488:	87420500 	strbhi	r0, [r2, -r0, lsl #10]
    248c:	20000000 	andcs	r0, r0, r0
    2490:	000c9808 	andeq	r9, ip, r8, lsl #16
    2494:	92430500 	subls	r0, r3, #0, 10
    2498:	24000000 	strcs	r0, [r0], #-0
    249c:	000beb08 	andeq	lr, fp, r8, lsl #22
    24a0:	87440500 	strbhi	r0, [r4, -r0, lsl #10]
    24a4:	28000000 	stmdacs	r0, {}	; <UNPREDICTABLE>
    24a8:	0b310300 	bleq	c430b0 <_stack+0xbc30b0>
    24ac:	45050000 	strmi	r0, [r5, #-0]
    24b0:	0000009d 	muleq	r0, sp, r0
    24b4:	0f063407 	svceq	0x00063407
    24b8:	000001d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
    24bc:	00307209 	eorseq	r7, r0, r9, lsl #4
    24c0:	00871006 	addeq	r1, r7, r6
    24c4:	09000000 	stmdbeq	r0, {}	; <UNPREDICTABLE>
    24c8:	06003172 			; <UNDEFINED> instruction: 0x06003172
    24cc:	00008711 	andeq	r8, r0, r1, lsl r7
    24d0:	72090400 	andvc	r0, r9, #0, 8
    24d4:	12060032 	andne	r0, r6, #50	; 0x32
    24d8:	00000087 	andeq	r0, r0, r7, lsl #1
    24dc:	33720908 	cmncc	r2, #8, 18	; 0x20000
    24e0:	87130600 	ldrhi	r0, [r3, -r0, lsl #12]
    24e4:	0c000000 	stceq	0, cr0, [r0], {-0}
    24e8:	00347209 	eorseq	r7, r4, r9, lsl #4
    24ec:	00871406 	addeq	r1, r7, r6, lsl #8
    24f0:	09100000 	ldmdbeq	r0, {}	; <UNPREDICTABLE>
    24f4:	06003572 			; <UNDEFINED> instruction: 0x06003572
    24f8:	00008715 	andeq	r8, r0, r5, lsl r7
    24fc:	72091400 	andvc	r1, r9, #0, 8
    2500:	16060036 			; <UNDEFINED> instruction: 0x16060036
    2504:	00000087 	andeq	r0, r0, r7, lsl #1
    2508:	37720918 			; <UNDEFINED> instruction: 0x37720918
    250c:	87170600 	ldrhi	r0, [r7, -r0, lsl #12]
    2510:	1c000000 	stcne	0, cr0, [r0], {-0}
    2514:	00387209 	eorseq	r7, r8, r9, lsl #4
    2518:	00871806 	addeq	r1, r7, r6, lsl #16
    251c:	09200000 	stmdbeq	r0!, {}	; <UNPREDICTABLE>
    2520:	06003972 			; <UNDEFINED> instruction: 0x06003972
    2524:	00008719 	andeq	r8, r0, r9, lsl r7
    2528:	72092400 	andvc	r2, r9, #0, 8
    252c:	06003031 			; <UNDEFINED> instruction: 0x06003031
    2530:	0000871a 	andeq	r8, r0, sl, lsl r7
    2534:	72092800 	andvc	r2, r9, #0, 16
    2538:	06003131 			; <UNDEFINED> instruction: 0x06003131
    253c:	0000871b 	andeq	r8, r0, fp, lsl r7
    2540:	72092c00 	andvc	r2, r9, #0, 24
    2544:	06003231 			; <UNDEFINED> instruction: 0x06003231
    2548:	0000871c 	andeq	r8, r0, ip, lsl r7
    254c:	03003000 	movweq	r3, #0
    2550:	0000020e 	andeq	r0, r0, lr, lsl #4
    2554:	01351d06 	teqeq	r5, r6, lsl #26
    2558:	48070000 	stmdami	r7, {}	; <UNPREDICTABLE>
    255c:	02291f06 	eoreq	r1, r9, #6, 30
    2560:	ea080000 	b	202568 <_stack+0x182568>
    2564:	0600000d 	streq	r0, [r0], -sp
    2568:	00008720 	andeq	r8, r0, r0, lsr #14
    256c:	09080000 	stmdbeq	r8, {}	; <UNPREDICTABLE>
    2570:	06000002 	streq	r0, [r0], -r2
    2574:	0001d021 	andeq	sp, r1, r1, lsr #32
    2578:	73090400 	movwvc	r0, #37888	; 0x9400
    257c:	22060070 	andcs	r0, r6, #112	; 0x70
    2580:	00000087 	andeq	r0, r0, r7, lsl #1
    2584:	726c0938 	rsbvc	r0, ip, #56, 18	; 0xe0000
    2588:	87230600 	strhi	r0, [r3, -r0, lsl #12]!
    258c:	3c000000 	stccc	0, cr0, [r0], {-0}
    2590:	00637009 	rsbeq	r7, r3, r9
    2594:	00872406 	addeq	r2, r7, r6, lsl #8
    2598:	08400000 	stmdaeq	r0, {}^	; <UNPREDICTABLE>
    259c:	00000da7 	andeq	r0, r0, r7, lsr #27
    25a0:	007d2506 	rsbseq	r2, sp, r6, lsl #10
    25a4:	00440000 	subeq	r0, r4, r0
    25a8:	00020103 	andeq	r0, r2, r3, lsl #2
    25ac:	db260600 	blle	983db4 <_stack+0x903db4>
    25b0:	0a000001 	beq	25bc <_heap_top+0x15bc>
    25b4:	0000114e 	andeq	r1, r0, lr, asr #2
    25b8:	8f680801 	svchi	0x00680801
    25bc:	00cc0000 	sbceq	r0, ip, r0
    25c0:	9c010000 	stcls	0, cr0, [r1], {-0}
    25c4:	000002d2 	ldrdeq	r0, [r0], -r2
    25c8:	0011a80b 	andseq	sl, r1, fp, lsl #16
    25cc:	6b080100 	blvs	2029d4 <_stack+0x1829d4>
    25d0:	02000000 	andeq	r0, r0, #0
    25d4:	9f0b5c91 	svcls	0x000b5c91
    25d8:	01000011 	tsteq	r0, r1, lsl r0
    25dc:	0002d208 	andeq	sp, r2, r8, lsl #4
    25e0:	58910200 	ldmpl	r1, {r9}
    25e4:	008f880c 	addeq	r8, pc, ip, lsl #16
    25e8:	00003800 	andeq	r3, r0, r0, lsl #16
    25ec:	00028f00 	andeq	r8, r2, r0, lsl #30
    25f0:	11af0d00 			; <UNDEFINED> instruction: 0x11af0d00
    25f4:	0c010000 	stceq	0, cr0, [r1], {-0}
    25f8:	0000006b 	andeq	r0, r0, fp, rrx
    25fc:	0d749102 	ldfeqp	f1, [r4, #-8]!
    2600:	00000c1e 	andeq	r0, r0, lr, lsl ip
    2604:	02d80d01 	sbcseq	r0, r8, #1, 26	; 0x40
    2608:	91020000 	mrsls	r0, (UNDEF: 2)
    260c:	d00c0070 	andle	r0, ip, r0, ror r0
    2610:	4000008f 	andmi	r0, r0, pc, lsl #1
    2614:	b9000000 	stmdblt	r0, {}	; <UNPREDICTABLE>
    2618:	0d000002 	stceq	0, cr0, [r0, #-8]
    261c:	00001169 	andeq	r1, r0, r9, ror #2
    2620:	02de1801 	sbcseq	r1, lr, #65536	; 0x10000
    2624:	91020000 	mrsls	r0, (UNDEF: 2)
    2628:	115f0d6c 	cmpne	pc, ip, ror #26
    262c:	19010000 	stmdbne	r1, {}	; <UNPREDICTABLE>
    2630:	000002de 	ldrdeq	r0, [r0], -lr
    2634:	00689102 	rsbeq	r9, r8, r2, lsl #2
    2638:	0090140e 	addseq	r1, r0, lr, lsl #8
    263c:	00001800 	andeq	r1, r0, r0, lsl #16
    2640:	09470d00 	stmdbeq	r7, {r8, sl, fp}^
    2644:	24010000 	strcs	r0, [r1], #-0
    2648:	000002e4 	andeq	r0, r0, r4, ror #5
    264c:	00679102 	rsbeq	r9, r7, r2, lsl #2
    2650:	6b040f00 	blvs	106258 <_stack+0x86258>
    2654:	0f000000 	svceq	0x00000000
    2658:	00012a04 	andeq	r2, r1, r4, lsl #20
    265c:	29040f00 	stmdbcs	r4, {r8, r9, sl, fp}
    2660:	02000002 	andeq	r0, r0, #2
    2664:	00f30801 	rscseq	r0, r3, r1, lsl #16
    2668:	bc000000 	stclt	0, cr0, [r0], {-0}
    266c:	04000001 	streq	r0, [r0], #-1
    2670:	000ad200 	andeq	sp, sl, r0, lsl #4
    2674:	44010400 	strmi	r0, [r1], #-1024	; 0xfffffc00
    2678:	0c000000 	stceq	0, cr0, [r0], {-0}
    267c:	000011be 			; <UNDEFINED> instruction: 0x000011be
    2680:	00009034 	andeq	r9, r0, r4, lsr r0
    2684:	0000022c 	andeq	r0, r0, ip, lsr #4
    2688:	00000d39 	andeq	r0, r0, r9, lsr sp
    268c:	ec060102 	stfs	f0, [r6], {2}
    2690:	02000000 	andeq	r0, r0, #0
    2694:	00ea0801 	rsceq	r0, sl, r1, lsl #16
    2698:	02020000 	andeq	r0, r2, #0
    269c:	00015e05 	andeq	r5, r1, r5, lsl #28
    26a0:	07020200 	streq	r0, [r2, -r0, lsl #4]
    26a4:	000000f8 	strdeq	r0, [r0], -r8
    26a8:	4e050402 	cdpmi	4, 0, cr0, cr5, cr2, {0}
    26ac:	02000001 	andeq	r0, r0, #1
    26b0:	012e0704 			; <UNDEFINED> instruction: 0x012e0704
    26b4:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
    26b8:	00014905 	andeq	r4, r1, r5, lsl #18
    26bc:	07080200 	streq	r0, [r8, -r0, lsl #4]
    26c0:	00000129 	andeq	r0, r0, r9, lsr #2
    26c4:	69050403 	stmdbvs	r5, {r0, r1, sl}
    26c8:	0200746e 	andeq	r7, r0, #1845493760	; 0x6e000000
    26cc:	01330704 	teqeq	r3, r4, lsl #14
    26d0:	18040000 	stmdane	r4, {}	; <UNPREDICTABLE>
    26d4:	00a00202 	adceq	r0, r0, r2, lsl #4
    26d8:	b6050000 	strlt	r0, [r5], -r0
    26dc:	0200000b 	andeq	r0, r0, #11
    26e0:	0000a004 	andeq	sl, r0, r4
    26e4:	a8050000 	stmdage	r5, {}	; <UNPREDICTABLE>
    26e8:	0200000c 	andeq	r0, r0, #12
    26ec:	00005905 	andeq	r5, r0, r5, lsl #18
    26f0:	0a050c00 	beq	1456f8 <_stack+0xc56f8>
    26f4:	0200000c 	andeq	r0, r0, #12
    26f8:	00005906 	andeq	r5, r0, r6, lsl #18
    26fc:	32051000 	andcc	r1, r5, #0
    2700:	02000002 	andeq	r0, r0, #2
    2704:	00005907 	andeq	r5, r0, r7, lsl #18
    2708:	06001400 	streq	r1, [r0], -r0, lsl #8
    270c:	000000b7 	strheq	r0, [r0], -r7
    2710:	000000b0 	strheq	r0, [r0], -r0	; <UNPREDICTABLE>
    2714:	0000b007 	andeq	fp, r0, r7
    2718:	02000900 	andeq	r0, r0, #0, 18
    271c:	01400704 	cmpeq	r0, r4, lsl #14
    2720:	01020000 	mrseq	r0, (UNDEF: 2)
    2724:	0000f308 	andeq	pc, r0, r8, lsl #6
    2728:	00b70800 	adcseq	r0, r7, r0, lsl #16
    272c:	5e090000 	cdppl	0, 0, cr0, cr9, cr0, {0}
    2730:	0200000c 	andeq	r0, r0, #12
    2734:	00006708 	andeq	r6, r0, r8, lsl #14
    2738:	11e80a00 	mvnne	r0, r0, lsl #20
    273c:	2f010000 	svccs	0x00010000
    2740:	00000059 	andeq	r0, r0, r9, asr r0
    2744:	0000915c 	andeq	r9, r0, ip, asr r1
    2748:	00000104 	andeq	r0, r0, r4, lsl #2
    274c:	012a9c01 			; <UNDEFINED> instruction: 0x012a9c01
    2750:	660b0000 	strvs	r0, [fp], -r0
    2754:	2a2f0100 	bcs	bc2b5c <_stack+0xb42b5c>
    2758:	02000001 	andeq	r0, r0, #1
    275c:	510c6c91 			; <UNDEFINED> instruction: 0x510c6c91
    2760:	0100000c 	tsteq	r0, ip
    2764:	0001302f 	andeq	r3, r1, pc, lsr #32
    2768:	68910200 	ldmvs	r1, {r9}
    276c:	000b4d0c 	andeq	r4, fp, ip, lsl #26
    2770:	592f0100 	stmdbpl	pc!, {r8}	; <UNPREDICTABLE>
    2774:	02000000 	andeq	r0, r0, #0
    2778:	690d6491 	stmdbvs	sp, {r0, r4, r7, sl, sp, lr}
    277c:	59310100 	ldmdbpl	r1!, {r8}
    2780:	02000000 	andeq	r0, r0, #0
    2784:	700d7491 	mulvc	sp, r1, r4
    2788:	01007274 	tsteq	r0, r4, ror r2
    278c:	00013732 	andeq	r3, r1, r2, lsr r7
    2790:	70910200 	addsvc	r0, r1, r0, lsl #4
    2794:	c3040e00 	movwgt	r0, #19968	; 0x4e00
    2798:	0e000000 	cdpeq	0, 0, cr0, cr0, cr0, {0}
    279c:	00013604 	andeq	r3, r1, r4, lsl #12
    27a0:	040e0f00 	streq	r0, [lr], #-3840	; 0xfffff100
    27a4:	000000be 	strheq	r0, [r0], -lr
    27a8:	0011fd0a 	andseq	pc, r1, sl, lsl #26
    27ac:	59130100 	ldmdbpl	r3, {r8}
    27b0:	78000000 	stmdavc	r0, {}	; <UNPREDICTABLE>
    27b4:	e4000090 	str	r0, [r0], #-144	; 0xffffff70
    27b8:	01000000 	mrseq	r0, (UNDEF: 0)
    27bc:	0001999c 	muleq	r1, ip, r9
    27c0:	00660b00 	rsbeq	r0, r6, r0, lsl #22
    27c4:	012a1301 			; <UNDEFINED> instruction: 0x012a1301
    27c8:	91020000 	mrsls	r0, (UNDEF: 2)
    27cc:	12070c6c 	andne	r0, r7, #108, 24	; 0x6c00
    27d0:	13010000 	movwne	r0, #4096	; 0x1000
    27d4:	00000199 	muleq	r0, r9, r1
    27d8:	0c689102 	stfeqp	f1, [r8], #-8
    27dc:	00000b4d 	andeq	r0, r0, sp, asr #22
    27e0:	00591301 	subseq	r1, r9, r1, lsl #6
    27e4:	91020000 	mrsls	r0, (UNDEF: 2)
    27e8:	00690d64 	rsbeq	r0, r9, r4, ror #26
    27ec:	00591501 	subseq	r1, r9, r1, lsl #10
    27f0:	91020000 	mrsls	r0, (UNDEF: 2)
    27f4:	74700d74 	ldrbtvc	r0, [r0], #-3444	; 0xfffff28c
    27f8:	16010072 			; <UNDEFINED> instruction: 0x16010072
    27fc:	0000019b 	muleq	r0, fp, r1
    2800:	00709102 	rsbseq	r9, r0, r2, lsl #2
    2804:	040e0410 	streq	r0, [lr], #-1040	; 0xfffffbf0
    2808:	000000b7 	strheq	r0, [r0], -r7
    280c:	0011f311 	andseq	pc, r1, r1, lsl r3	; <UNPREDICTABLE>
    2810:	340a0100 	strcc	r0, [sl], #-256	; 0xffffff00
    2814:	44000090 	strmi	r0, [r0], #-144	; 0xffffff70
    2818:	01000000 	mrseq	r0, (UNDEF: 0)
    281c:	00660b9c 	mlseq	r6, ip, fp, r0
    2820:	012a0a01 			; <UNDEFINED> instruction: 0x012a0a01
    2824:	91020000 	mrsls	r0, (UNDEF: 2)
    2828:	b3000074 	movwlt	r0, #116	; 0x74
    282c:	04000000 	streq	r0, [r0], #-0
    2830:	000bb200 	andeq	fp, fp, r0, lsl #4
    2834:	44010400 	strmi	r0, [r1], #-1024	; 0xfffffc00
    2838:	0c000000 	stceq	0, cr0, [r0], {-0}
    283c:	00001219 	andeq	r1, r0, r9, lsl r2
    2840:	00009260 	andeq	r9, r0, r0, ror #4
    2844:	00000070 	andeq	r0, r0, r0, ror r0
    2848:	00000e11 	andeq	r0, r0, r1, lsl lr
    284c:	ec060102 	stfs	f0, [r6], {2}
    2850:	02000000 	andeq	r0, r0, #0
    2854:	00ea0801 	rsceq	r0, sl, r1, lsl #16
    2858:	02020000 	andeq	r0, r2, #0
    285c:	00015e05 	andeq	r5, r1, r5, lsl #28
    2860:	07020200 	streq	r0, [r2, -r0, lsl #4]
    2864:	000000f8 	strdeq	r0, [r0], -r8
    2868:	4e050402 	cdpmi	4, 0, cr0, cr5, cr2, {0}
    286c:	02000001 	andeq	r0, r0, #1
    2870:	012e0704 			; <UNDEFINED> instruction: 0x012e0704
    2874:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
    2878:	00014905 	andeq	r4, r1, r5, lsl #18
    287c:	07080200 	streq	r0, [r8, -r0, lsl #4]
    2880:	00000129 	andeq	r0, r0, r9, lsr #2
    2884:	69050403 	stmdbvs	r5, {r0, r1, sl}
    2888:	0200746e 	andeq	r7, r0, #1845493760	; 0x6e000000
    288c:	01330704 	teqeq	r3, r4, lsl #14
    2890:	fa040000 	blx	102898 <_stack+0x82898>
    2894:	0100000c 	tsteq	r0, ip
    2898:	0092880a 	addseq	r8, r2, sl, lsl #16
    289c:	00004800 	andeq	r4, r0, r0, lsl #16
    28a0:	8b9c0100 	blhi	fe702ca8 <CPSR_UNAFFECTED_BITS+0xfe702da8>
    28a4:	05000000 	streq	r0, [r0, #-0]
    28a8:	00000947 	andeq	r0, r0, r7, asr #18
    28ac:	008b0a01 	addeq	r0, fp, r1, lsl #20
    28b0:	91020000 	mrsls	r0, (UNDEF: 2)
    28b4:	04060074 	streq	r0, [r6], #-116	; 0xffffff8c
    28b8:	00000091 	muleq	r0, r1, r0
    28bc:	f3080102 	vrhadd.u8	d0, d8, d2
    28c0:	07000000 	streq	r0, [r0, -r0]
    28c4:	0000120f 	andeq	r1, r0, pc, lsl #4
    28c8:	92600501 	rsbls	r0, r0, #4194304	; 0x400000
    28cc:	00280000 	eoreq	r0, r8, r0
    28d0:	9c010000 	stcls	0, cr0, [r1], {-0}
    28d4:	01006308 	tsteq	r0, r8, lsl #6
    28d8:	00009105 	andeq	r9, r0, r5, lsl #2
    28dc:	77910200 	ldrvc	r0, [r1, r0, lsl #4]
    28e0:	00700000 	rsbseq	r0, r0, r0
    28e4:	00020000 	andeq	r0, r2, r0
    28e8:	00000c33 	andeq	r0, r0, r3, lsr ip
    28ec:	0e700104 	rpweqs	f0, f0, f4
    28f0:	92d00000 	sbcsls	r0, r0, #0
    28f4:	93400000 	movtls	r0, #0
    28f8:	682f0000 	stmdavs	pc!, {}	; <UNPREDICTABLE>
    28fc:	2f656d6f 	svccs	0x00656d6f
    2900:	69646261 	stmdbvs	r4!, {r0, r5, r6, r9, sp, lr}^
    2904:	6972616b 	ldmdbvs	r2!, {r0, r1, r3, r5, r6, r8, sp, lr}^
    2908:	65642f6d 	strbvs	r2, [r4, #-3949]!	; 0xfffff093
    290c:	794d2f76 	stmdbvc	sp, {r1, r2, r4, r5, r6, r8, r9, sl, fp, sp}^
    2910:	7474694c 	ldrbtvc	r6, [r4], #-2380	; 0xfffff6b4
    2914:	534f656c 	movtpl	r6, #62828	; 0xf56c
    2918:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
    291c:	6863732f 	stmdavs	r3!, {r0, r1, r2, r3, r5, r8, r9, ip, sp, lr}^
    2920:	6c756465 	cfldrdvs	mvd6, [r5], #-404	; 0xfffffe6c
    2924:	732e7265 			; <UNDEFINED> instruction: 0x732e7265
    2928:	6f682f00 	svcvs	0x00682f00
    292c:	612f656d 			; <UNDEFINED> instruction: 0x612f656d
    2930:	6b696462 	blvs	1a5bac0 <_stack+0x19dbac0>
    2934:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
    2938:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
    293c:	4c794d2f 	ldclmi	13, cr4, [r9], #-188	; 0xffffff44
    2940:	6c747469 	cfldrdvs	mvd7, [r4], #-420	; 0xfffffe5c
    2944:	00534f65 	subseq	r4, r3, r5, ror #30
    2948:	20554e47 	subscs	r4, r5, r7, asr #28
    294c:	32205341 	eorcc	r5, r0, #67108865	; 0x4000001
    2950:	0037322e 	eorseq	r3, r7, lr, lsr #4
    2954:	006c8001 	rsbeq	r8, ip, r1
    2958:	00020000 	andeq	r0, r2, r0
    295c:	00000c47 	andeq	r0, r0, r7, asr #24
    2960:	0ee70104 	cdpeq	1, 14, cr0, cr7, cr4, {0}
    2964:	80000000 	andhi	r0, r0, r0
    2968:	80940000 	addshi	r0, r4, r0
    296c:	682f0000 	stmdavs	pc!, {}	; <UNPREDICTABLE>
    2970:	2f656d6f 	svccs	0x00656d6f
    2974:	69646261 	stmdbvs	r4!, {r0, r5, r6, r9, sp, lr}^
    2978:	6972616b 	ldmdbvs	r2!, {r0, r1, r3, r5, r6, r8, sp, lr}^
    297c:	65642f6d 	strbvs	r2, [r4, #-3949]!	; 0xfffff093
    2980:	794d2f76 	stmdbvc	sp, {r1, r2, r4, r5, r6, r8, r9, sl, fp, sp}^
    2984:	7474694c 	ldrbtvc	r6, [r4], #-2380	; 0xfffff6b4
    2988:	534f656c 	movtpl	r6, #62828	; 0xf56c
    298c:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
    2990:	6174732f 	cmnvs	r4, pc, lsr #6
    2994:	732e7472 			; <UNDEFINED> instruction: 0x732e7472
    2998:	6f682f00 	svcvs	0x00682f00
    299c:	612f656d 			; <UNDEFINED> instruction: 0x612f656d
    29a0:	6b696462 	blvs	1a5bb30 <_stack+0x19dbb30>
    29a4:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
    29a8:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
    29ac:	4c794d2f 	ldclmi	13, cr4, [r9], #-188	; 0xffffff44
    29b0:	6c747469 	cfldrdvs	mvd7, [r4], #-420	; 0xfffffe5c
    29b4:	00534f65 	subseq	r4, r3, r5, ror #30
    29b8:	20554e47 	subscs	r4, r5, r7, asr #28
    29bc:	32205341 	eorcc	r5, r0, #67108865	; 0x4000001
    29c0:	0037322e 	eorseq	r3, r7, lr, lsr #4
    29c4:	006a8001 	rsbeq	r8, sl, r1
    29c8:	00020000 	andeq	r0, r2, r0
    29cc:	00000c5b 	andeq	r0, r0, fp, asr ip
    29d0:	0f660104 	svceq	0x00660104
    29d4:	93400000 	movtls	r0, #0
    29d8:	93600000 	cmnls	r0, #0
    29dc:	682f0000 	stmdavs	pc!, {}	; <UNPREDICTABLE>
    29e0:	2f656d6f 	svccs	0x00656d6f
    29e4:	69646261 	stmdbvs	r4!, {r0, r5, r6, r9, sp, lr}^
    29e8:	6972616b 	ldmdbvs	r2!, {r0, r1, r3, r5, r6, r8, sp, lr}^
    29ec:	65642f6d 	strbvs	r2, [r4, #-3949]!	; 0xfffff093
    29f0:	794d2f76 	stmdbvc	sp, {r1, r2, r4, r5, r6, r8, r9, sl, fp, sp}^
    29f4:	7474694c 	ldrbtvc	r6, [r4], #-2380	; 0xfffff6b4
    29f8:	534f656c 	movtpl	r6, #62828	; 0xf56c
    29fc:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
    2a00:	6376732f 	cmnvs	r6, #-1140850688	; 0xbc000000
    2a04:	2f00732e 	svccs	0x0000732e
    2a08:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
    2a0c:	6462612f 	strbtvs	r6, [r2], #-303	; 0xfffffed1
    2a10:	72616b69 	rsbvc	r6, r1, #107520	; 0x1a400
    2a14:	642f6d69 	strtvs	r6, [pc], #-3433	; 2a1c <_heap_top+0x1a1c>
    2a18:	4d2f7665 	stcmi	6, cr7, [pc, #-404]!	; 288c <_heap_top+0x188c>
    2a1c:	74694c79 	strbtvc	r4, [r9], #-3193	; 0xfffff387
    2a20:	4f656c74 	svcmi	0x00656c74
    2a24:	4e470053 	mcrmi	0, 2, r0, cr7, cr3, {2}
    2a28:	53412055 	movtpl	r2, #4181	; 0x1055
    2a2c:	322e3220 	eorcc	r3, lr, #32, 4
    2a30:	80010037 	andhi	r0, r1, r7, lsr r0

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
  74:	0b002408 	bleq	909c <fifo_read+0x24>
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
  a4:	00240300 	eoreq	r0, r4, r0, lsl #6
  a8:	0b3e0b0b 	bleq	f82cdc <_stack+0xf02cdc>
  ac:	00000803 	andeq	r0, r0, r3, lsl #16
  b0:	3f012e04 	svccc	0x00012e04
  b4:	3a0e0319 	bcc	380d20 <_stack+0x300d20>
  b8:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
  bc:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
  c0:	96184006 	ldrls	r4, [r8], -r6
  c4:	13011942 	movwne	r1, #6466	; 0x1942
  c8:	34050000 	strcc	r0, [r5], #-0
  cc:	3a0e0300 	bcc	380cd4 <_stack+0x300cd4>
  d0:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
  d4:	00180213 	andseq	r0, r8, r3, lsl r2
  d8:	01010600 	tsteq	r1, r0, lsl #12
  dc:	13011349 	movwne	r1, #4937	; 0x1349
  e0:	21070000 	mrscs	r0, (UNDEF: 7)
  e4:	2f134900 	svccs	0x00134900
  e8:	0800000b 	stmdaeq	r0, {r0, r1, r3}
  ec:	193f002e 	ldmdbne	pc!, {r1, r2, r3, r5}	; <UNPREDICTABLE>
  f0:	0b3a0e03 	bleq	e83904 <_stack+0xe03904>
  f4:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
  f8:	06120111 			; <UNDEFINED> instruction: 0x06120111
  fc:	42961840 	addsmi	r1, r6, #64, 16	; 0x400000
 100:	00000019 	andeq	r0, r0, r9, lsl r0
 104:	25011101 	strcs	r1, [r1, #-257]	; 0xfffffeff
 108:	030b130e 	movweq	r1, #45838	; 0xb30e
 10c:	1201110e 	andne	r1, r1, #-2147483645	; 0x80000003
 110:	00171006 	andseq	r1, r7, r6
 114:	00240200 	eoreq	r0, r4, r0, lsl #4
 118:	0b3e0b0b 	bleq	f82d4c <_stack+0xf02d4c>
 11c:	00000e03 	andeq	r0, r0, r3, lsl #28
 120:	03001603 	movweq	r1, #1539	; 0x603
 124:	3b0b3a0e 	blcc	2ce964 <_stack+0x24e964>
 128:	0013490b 	andseq	r4, r3, fp, lsl #18
 12c:	00240400 	eoreq	r0, r4, r0, lsl #8
 130:	0b3e0b0b 	bleq	f82d64 <_stack+0xf02d64>
 134:	00000803 	andeq	r0, r0, r3, lsl #16
 138:	49003505 	stmdbmi	r0, {r0, r2, r8, sl, ip, sp}
 13c:	06000013 			; <UNDEFINED> instruction: 0x06000013
 140:	0b0b0113 	bleq	2c0594 <_stack+0x240594>
 144:	0b3b0b3a 	bleq	ec2e34 <_stack+0xe42e34>
 148:	00001301 	andeq	r1, r0, r1, lsl #6
 14c:	03000d07 	movweq	r0, #3335	; 0xd07
 150:	3b0b3a08 	blcc	2ce978 <_stack+0x24e978>
 154:	3813490b 	ldmdacc	r3, {r0, r1, r3, r8, fp, lr}
 158:	0800000b 	stmdaeq	r0, {r0, r1, r3}
 15c:	0e03000d 	cdpeq	0, 0, cr0, cr3, cr13, {0}
 160:	0b3b0b3a 	bleq	ec2e50 <_stack+0xe42e50>
 164:	0b381349 	bleq	e04e90 <_stack+0xd84e90>
 168:	2e090000 	cdpcs	0, 0, cr0, cr9, cr0, {0}
 16c:	03193f01 	tsteq	r9, #1, 30
 170:	3b0b3a0e 	blcc	2ce9b0 <_stack+0x24e9b0>
 174:	1119270b 	tstne	r9, fp, lsl #14
 178:	40061201 	andmi	r1, r6, r1, lsl #4
 17c:	19429618 	stmdbne	r2, {r3, r4, r9, sl, ip, pc}^
 180:	00001301 	andeq	r1, r0, r1, lsl #6
 184:	0300050a 	movweq	r0, #1290	; 0x50a
 188:	3b0b3a08 	blcc	2ce9b0 <_stack+0x24e9b0>
 18c:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 190:	0b000018 	bleq	1f8 <CPSR_IRQ_INHIBIT+0x178>
 194:	0e030005 	cdpeq	0, 0, cr0, cr3, cr5, {0}
 198:	0b3b0b3a 	bleq	ec2e88 <_stack+0xe42e88>
 19c:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 1a0:	340c0000 	strcc	r0, [ip], #-0
 1a4:	3a080300 	bcc	200dac <_stack+0x180dac>
 1a8:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 1ac:	00180213 	andseq	r0, r8, r3, lsl r2
 1b0:	00340d00 	eorseq	r0, r4, r0, lsl #26
 1b4:	0b3a0e03 	bleq	e839c8 <_stack+0xe039c8>
 1b8:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 1bc:	00001802 	andeq	r1, r0, r2, lsl #16
 1c0:	4901010e 	stmdbmi	r1, {r1, r2, r3, r8}
 1c4:	00130113 	andseq	r0, r3, r3, lsl r1
 1c8:	00210f00 	eoreq	r0, r1, r0, lsl #30
 1cc:	0b2f1349 	bleq	bc4ef8 <_stack+0xb44ef8>
 1d0:	0f100000 	svceq	0x00100000
 1d4:	490b0b00 	stmdbmi	fp, {r8, r9, fp}
 1d8:	00000013 	andeq	r0, r0, r3, lsl r0
 1dc:	25011101 	strcs	r1, [r1, #-257]	; 0xfffffeff
 1e0:	030b130e 	movweq	r1, #45838	; 0xb30e
 1e4:	1201110e 	andne	r1, r1, #-2147483645	; 0x80000003
 1e8:	00171006 	andseq	r1, r7, r6
 1ec:	00240200 	eoreq	r0, r4, r0, lsl #4
 1f0:	0b3e0b0b 	bleq	f82e24 <_stack+0xf02e24>
 1f4:	00000e03 	andeq	r0, r0, r3, lsl #28
 1f8:	03001603 	movweq	r1, #1539	; 0x603
 1fc:	3b0b3a0e 	blcc	2cea3c <_stack+0x24ea3c>
 200:	0013490b 	andseq	r4, r3, fp, lsl #18
 204:	00240400 	eoreq	r0, r4, r0, lsl #8
 208:	0b3e0b0b 	bleq	f82e3c <_stack+0xf02e3c>
 20c:	00000803 	andeq	r0, r0, r3, lsl #16
 210:	49003505 	stmdbmi	r0, {r0, r2, r8, sl, ip, sp}
 214:	06000013 			; <UNDEFINED> instruction: 0x06000013
 218:	13490026 	movtne	r0, #36902	; 0x9026
 21c:	13070000 	movwne	r0, #28672	; 0x7000
 220:	0b0e0301 	bleq	380e2c <_stack+0x300e2c>
 224:	3b0b3a0b 	blcc	2cea58 <_stack+0x24ea58>
 228:	0013010b 	andseq	r0, r3, fp, lsl #2
 22c:	000d0800 	andeq	r0, sp, r0, lsl #16
 230:	0b3a0e03 	bleq	e83a44 <_stack+0xe03a44>
 234:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 238:	00000b38 	andeq	r0, r0, r8, lsr fp
 23c:	0b000f09 	bleq	3e68 <_heap_top+0x2e68>
 240:	0013490b 	andseq	r4, r3, fp, lsl #18
 244:	01010a00 	tsteq	r1, r0, lsl #20
 248:	13011349 	movwne	r1, #4937	; 0x1349
 24c:	210b0000 	mrscs	r0, (UNDEF: 11)
 250:	00134900 	andseq	r4, r3, r0, lsl #18
 254:	00340c00 	eorseq	r0, r4, r0, lsl #24
 258:	0b3a0e03 	bleq	e83a6c <_stack+0xe03a6c>
 25c:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 260:	193c193f 	ldmdbne	ip!, {r0, r1, r2, r3, r4, r5, r8, fp, ip}
 264:	340d0000 	strcc	r0, [sp], #-0
 268:	3a0e0300 	bcc	380e70 <_stack+0x300e70>
 26c:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 270:	00180213 	andseq	r0, r8, r3, lsl r2
 274:	00210e00 	eoreq	r0, r1, r0, lsl #28
 278:	0b2f1349 	bleq	bc4fa4 <_stack+0xb44fa4>
 27c:	2e0f0000 	cdpcs	0, 0, cr0, cr15, cr0, {0}
 280:	03193f01 	tsteq	r9, #1, 30
 284:	3b0b3a0e 	blcc	2ceac4 <_stack+0x24eac4>
 288:	4919270b 	ldmdbmi	r9, {r0, r1, r3, r8, r9, sl, sp}
 28c:	12011113 	andne	r1, r1, #-1073741820	; 0xc0000004
 290:	97184006 	ldrls	r4, [r8, -r6]
 294:	13011942 	movwne	r1, #6466	; 0x1942
 298:	05100000 	ldreq	r0, [r0, #-0]
 29c:	3a0e0300 	bcc	380ea4 <_stack+0x300ea4>
 2a0:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 2a4:	00180213 	andseq	r0, r8, r3, lsl r2
 2a8:	010b1100 	mrseq	r1, (UNDEF: 27)
 2ac:	06120111 			; <UNDEFINED> instruction: 0x06120111
 2b0:	0f120000 	svceq	0x00120000
 2b4:	000b0b00 	andeq	r0, fp, r0, lsl #22
 2b8:	11010000 	mrsne	r0, (UNDEF: 1)
 2bc:	130e2501 	movwne	r2, #58625	; 0xe501
 2c0:	110e030b 	tstne	lr, fp, lsl #6
 2c4:	10061201 	andne	r1, r6, r1, lsl #4
 2c8:	02000017 	andeq	r0, r0, #23
 2cc:	0b0b0024 	bleq	2c0364 <_stack+0x240364>
 2d0:	0e030b3e 	vmoveq.16	d3[0], r0
 2d4:	16030000 	strne	r0, [r3], -r0
 2d8:	3a0e0300 	bcc	380ee0 <_stack+0x300ee0>
 2dc:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 2e0:	04000013 	streq	r0, [r0], #-19	; 0xffffffed
 2e4:	0b0b0024 	bleq	2c037c <_stack+0x24037c>
 2e8:	08030b3e 	stmdaeq	r3, {r1, r2, r3, r4, r5, r8, r9, fp}
 2ec:	35050000 	strcc	r0, [r5, #-0]
 2f0:	00134900 	andseq	r4, r3, r0, lsl #18
 2f4:	01130600 	tsteq	r3, r0, lsl #12
 2f8:	0b3a0b0b 	bleq	e82f2c <_stack+0xe02f2c>
 2fc:	13010b3b 	movwne	r0, #6971	; 0x1b3b
 300:	0d070000 	stceq	0, cr0, [r7, #-0]
 304:	3a080300 	bcc	200f0c <_stack+0x180f0c>
 308:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 30c:	000b3813 	andeq	r3, fp, r3, lsl r8
 310:	000d0800 	andeq	r0, sp, r0, lsl #16
 314:	0b3a0e03 	bleq	e83b28 <_stack+0xe03b28>
 318:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 31c:	00000b38 	andeq	r0, r0, r8, lsr fp
 320:	49010109 	stmdbmi	r1, {r0, r3, r8}
 324:	00130113 	andseq	r0, r3, r3, lsl r1
 328:	00210a00 	eoreq	r0, r1, r0, lsl #20
 32c:	0b2f1349 	bleq	bc5058 <_stack+0xb45058>
 330:	340b0000 	strcc	r0, [fp], #-0
 334:	3a080300 	bcc	200f3c <_stack+0x180f3c>
 338:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 33c:	00180213 	andseq	r0, r8, r3, lsl r2
 340:	00340c00 	eorseq	r0, r4, r0, lsl #24
 344:	0b3a0e03 	bleq	e83b58 <_stack+0xe03b58>
 348:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 34c:	00001802 	andeq	r1, r0, r2, lsl #16
 350:	0b000f0d 	bleq	3f8c <_heap_top+0x2f8c>
 354:	0013490b 	andseq	r4, r3, fp, lsl #18
 358:	012e0e00 			; <UNDEFINED> instruction: 0x012e0e00
 35c:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
 360:	0b3b0b3a 	bleq	ec3050 <_stack+0xe43050>
 364:	13491927 	movtne	r1, #39207	; 0x9927
 368:	06120111 			; <UNDEFINED> instruction: 0x06120111
 36c:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 370:	00130119 	andseq	r0, r3, r9, lsl r1
 374:	002e0f00 	eoreq	r0, lr, r0, lsl #30
 378:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
 37c:	0b3b0b3a 	bleq	ec306c <_stack+0xe4306c>
 380:	13491927 	movtne	r1, #39207	; 0x9927
 384:	06120111 			; <UNDEFINED> instruction: 0x06120111
 388:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 38c:	10000019 	andne	r0, r0, r9, lsl r0
 390:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 394:	0b3a0e03 	bleq	e83ba8 <_stack+0xe03ba8>
 398:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 39c:	06120111 			; <UNDEFINED> instruction: 0x06120111
 3a0:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 3a4:	00130119 	andseq	r0, r3, r9, lsl r1
 3a8:	00051100 	andeq	r1, r5, r0, lsl #2
 3ac:	0b3a0e03 	bleq	e83bc0 <_stack+0xe03bc0>
 3b0:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 3b4:	00001802 	andeq	r1, r0, r2, lsl #16
 3b8:	3f012e12 	svccc	0x00012e12
 3bc:	3a0e0319 	bcc	381028 <_stack+0x301028>
 3c0:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 3c4:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 3c8:	96184006 	ldrls	r4, [r8], -r6
 3cc:	13011942 	movwne	r1, #6466	; 0x1942
 3d0:	15130000 	ldrne	r0, [r3, #-0]
 3d4:	00130101 	andseq	r0, r3, r1, lsl #2
 3d8:	00181400 	andseq	r1, r8, r0, lsl #8
 3dc:	01000000 	mrseq	r0, (UNDEF: 0)
 3e0:	0e250111 	mcreq	1, 1, r0, cr5, cr1, {0}
 3e4:	0e030b13 	vmoveq.32	d3[0], r0
 3e8:	06120111 			; <UNDEFINED> instruction: 0x06120111
 3ec:	00001710 	andeq	r1, r0, r0, lsl r7
 3f0:	0b002402 	bleq	9400 <s_block_bucket+0x18>
 3f4:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 3f8:	0300000e 	movweq	r0, #14
 3fc:	0e030016 	mcreq	0, 0, r0, cr3, cr6, {0}
 400:	0b3b0b3a 	bleq	ec30f0 <_stack+0xe430f0>
 404:	00001349 	andeq	r1, r0, r9, asr #6
 408:	0b002404 	bleq	9420 <enter_command_text.6883>
 40c:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 410:	05000008 	streq	r0, [r0, #-8]
 414:	13490035 	movtne	r0, #36917	; 0x9035
 418:	13060000 	movwne	r0, #24576	; 0x6000
 41c:	3a0b0b01 	bcc	2c3028 <_stack+0x243028>
 420:	010b3b0b 	tsteq	fp, fp, lsl #22
 424:	07000013 	smladeq	r0, r3, r0, r0
 428:	0e03000d 	cdpeq	0, 0, cr0, cr3, cr13, {0}
 42c:	0b3b0b3a 	bleq	ec311c <_stack+0xe4311c>
 430:	0b381349 	bleq	e0515c <_stack+0xd8515c>
 434:	34080000 	strcc	r0, [r8], #-0
 438:	3a0e0300 	bcc	381040 <_stack+0x301040>
 43c:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 440:	00180213 	andseq	r0, r8, r3, lsl r2
 444:	000f0900 	andeq	r0, pc, r0, lsl #18
 448:	13490b0b 	movtne	r0, #39691	; 0x9b0b
 44c:	2e0a0000 	cdpcs	0, 0, cr0, cr10, cr0, {0}
 450:	03193f00 	tsteq	r9, #0, 30
 454:	3b0b3a0e 	blcc	2cec94 <_stack+0x24ec94>
 458:	1119270b 	tstne	r9, fp, lsl #14
 45c:	40061201 	andmi	r1, r6, r1, lsl #4
 460:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 464:	2e0b0000 	cdpcs	0, 0, cr0, cr11, cr0, {0}
 468:	03193f00 	tsteq	r9, #0, 30
 46c:	3b0b3a0e 	blcc	2cecac <_stack+0x24ecac>
 470:	4919270b 	ldmdbmi	r9, {r0, r1, r3, r8, r9, sl, sp}
 474:	12011113 	andne	r1, r1, #-1073741820	; 0xc0000004
 478:	97184006 	ldrls	r4, [r8, -r6]
 47c:	00001942 	andeq	r1, r0, r2, asr #18
 480:	01110100 	tsteq	r1, r0, lsl #2
 484:	0b130e25 	bleq	4c3d20 <_stack+0x443d20>
 488:	01110e03 	tsteq	r1, r3, lsl #28
 48c:	17100612 			; <UNDEFINED> instruction: 0x17100612
 490:	24020000 	strcs	r0, [r2], #-0
 494:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 498:	000e030b 	andeq	r0, lr, fp, lsl #6
 49c:	00160300 	andseq	r0, r6, r0, lsl #6
 4a0:	0b3a0e03 	bleq	e83cb4 <_stack+0xe03cb4>
 4a4:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 4a8:	24040000 	strcs	r0, [r4], #-0
 4ac:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 4b0:	0008030b 	andeq	r0, r8, fp, lsl #6
 4b4:	00350500 	eorseq	r0, r5, r0, lsl #10
 4b8:	00001349 	andeq	r1, r0, r9, asr #6
 4bc:	49002606 	stmdbmi	r0, {r1, r2, r9, sl, sp}
 4c0:	07000013 	smladeq	r0, r3, r0, r0
 4c4:	0b0b0104 	bleq	2c08dc <_stack+0x2408dc>
 4c8:	0b3a1349 	bleq	e851f4 <_stack+0xe051f4>
 4cc:	13010b3b 	movwne	r0, #6971	; 0x1b3b
 4d0:	28080000 	stmdacs	r8, {}	; <UNPREDICTABLE>
 4d4:	1c0e0300 	stcne	3, cr0, [lr], {-0}
 4d8:	0900000b 	stmdbeq	r0, {r0, r1, r3}
 4dc:	0b0b0113 	bleq	2c0930 <_stack+0x240930>
 4e0:	0b3b0b3a 	bleq	ec31d0 <_stack+0xe431d0>
 4e4:	00001301 	andeq	r1, r0, r1, lsl #6
 4e8:	03000d0a 	movweq	r0, #3338	; 0xd0a
 4ec:	3b0b3a0e 	blcc	2ced2c <_stack+0x24ed2c>
 4f0:	3813490b 	ldmdacc	r3, {r0, r1, r3, r8, fp, lr}
 4f4:	0b00000b 	bleq	528 <CPSR_IRQ_INHIBIT+0x4a8>
 4f8:	0e030034 	mcreq	0, 0, r0, cr3, cr4, {1}
 4fc:	0b3b0b3a 	bleq	ec31ec <_stack+0xe431ec>
 500:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 504:	0f0c0000 	svceq	0x000c0000
 508:	490b0b00 	stmdbmi	fp, {r8, r9, fp}
 50c:	0d000013 	stceq	0, cr0, [r0, #-76]	; 0xffffffb4
 510:	193f002e 	ldmdbne	pc!, {r1, r2, r3, r5}	; <UNPREDICTABLE>
 514:	0b3a0e03 	bleq	e83d28 <_stack+0xe03d28>
 518:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 51c:	06120111 			; <UNDEFINED> instruction: 0x06120111
 520:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 524:	0e000019 	mcreq	0, 0, r0, cr0, cr9, {0}
 528:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 52c:	0b3a0e03 	bleq	e83d40 <_stack+0xe03d40>
 530:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 534:	06120111 			; <UNDEFINED> instruction: 0x06120111
 538:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 53c:	00130119 	andseq	r0, r3, r9, lsl r1
 540:	00050f00 	andeq	r0, r5, r0, lsl #30
 544:	0b3a0e03 	bleq	e83d58 <_stack+0xe03d58>
 548:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 54c:	00001802 	andeq	r1, r0, r2, lsl #16
 550:	3f002e10 	svccc	0x00002e10
 554:	3a0e0319 	bcc	3811c0 <_stack+0x3011c0>
 558:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 55c:	11134919 	tstne	r3, r9, lsl r9
 560:	40061201 	andmi	r1, r6, r1, lsl #4
 564:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 568:	01000000 	mrseq	r0, (UNDEF: 0)
 56c:	0e250111 	mcreq	1, 1, r0, cr5, cr1, {0}
 570:	0e030b13 	vmoveq.32	d3[0], r0
 574:	06120111 			; <UNDEFINED> instruction: 0x06120111
 578:	00001710 	andeq	r1, r0, r0, lsl r7
 57c:	0b002402 	bleq	958c <__bss_end__+0x78>
 580:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 584:	0300000e 	movweq	r0, #14
 588:	0e030016 	mcreq	0, 0, r0, cr3, cr6, {0}
 58c:	0b3b0b3a 	bleq	ec327c <_stack+0xe4327c>
 590:	00001349 	andeq	r1, r0, r9, asr #6
 594:	0b002404 	bleq	95ac <__bss_end__+0x98>
 598:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 59c:	05000008 	streq	r0, [r0, #-8]
 5a0:	13490035 	movtne	r0, #36917	; 0x9035
 5a4:	13060000 	movwne	r0, #24576	; 0x6000
 5a8:	3a0b0b01 	bcc	2c31b4 <_stack+0x2431b4>
 5ac:	010b3b0b 	tsteq	fp, fp, lsl #22
 5b0:	07000013 	smladeq	r0, r3, r0, r0
 5b4:	0e03000d 	cdpeq	0, 0, cr0, cr3, cr13, {0}
 5b8:	0b3b0b3a 	bleq	ec32a8 <_stack+0xe432a8>
 5bc:	0b381349 	bleq	e052e8 <_stack+0xd852e8>
 5c0:	34080000 	strcc	r0, [r8], #-0
 5c4:	3a0e0300 	bcc	3811cc <_stack+0x3011cc>
 5c8:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 5cc:	00180213 	andseq	r0, r8, r3, lsl r2
 5d0:	000f0900 	andeq	r0, pc, r0, lsl #18
 5d4:	13490b0b 	movtne	r0, #39691	; 0x9b0b
 5d8:	2e0a0000 	cdpcs	0, 0, cr0, cr10, cr0, {0}
 5dc:	03193f00 	tsteq	r9, #0, 30
 5e0:	3b0b3a0e 	blcc	2cee20 <_stack+0x24ee20>
 5e4:	1119270b 	tstne	r9, fp, lsl #14
 5e8:	40061201 	andmi	r1, r6, r1, lsl #4
 5ec:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 5f0:	2e0b0000 	cdpcs	0, 0, cr0, cr11, cr0, {0}
 5f4:	03193f01 	tsteq	r9, #1, 30
 5f8:	3b0b3a0e 	blcc	2cee38 <_stack+0x24ee38>
 5fc:	1201110b 	andne	r1, r1, #-1073741822	; 0xc0000002
 600:	96184006 	ldrls	r4, [r8], -r6
 604:	13011942 	movwne	r1, #6466	; 0x1942
 608:	340c0000 	strcc	r0, [ip], #-0
 60c:	3a080300 	bcc	201214 <_stack+0x181214>
 610:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 614:	00180213 	andseq	r0, r8, r3, lsl r2
 618:	012e0d00 			; <UNDEFINED> instruction: 0x012e0d00
 61c:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
 620:	0b3b0b3a 	bleq	ec3310 <_stack+0xe43310>
 624:	01111927 	tsteq	r1, r7, lsr #18
 628:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 62c:	01194296 			; <UNDEFINED> instruction: 0x01194296
 630:	0e000013 	mcreq	0, 0, r0, cr0, cr3, {0}
 634:	193f002e 	ldmdbne	pc!, {r1, r2, r3, r5}	; <UNPREDICTABLE>
 638:	0b3a0e03 	bleq	e83e4c <_stack+0xe03e4c>
 63c:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 640:	01111349 	tsteq	r1, r9, asr #6
 644:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 648:	00194297 	mulseq	r9, r7, r2
 64c:	11010000 	mrsne	r0, (UNDEF: 1)
 650:	130e2501 	movwne	r2, #58625	; 0xe501
 654:	110e030b 	tstne	lr, fp, lsl #6
 658:	10061201 	andne	r1, r6, r1, lsl #4
 65c:	02000017 	andeq	r0, r0, #23
 660:	0b0b0024 	bleq	2c06f8 <_stack+0x2406f8>
 664:	0e030b3e 	vmoveq.16	d3[0], r0
 668:	16030000 	strne	r0, [r3], -r0
 66c:	3a0e0300 	bcc	381274 <_stack+0x301274>
 670:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 674:	04000013 	streq	r0, [r0], #-19	; 0xffffffed
 678:	0b0b0024 	bleq	2c0710 <_stack+0x240710>
 67c:	08030b3e 	stmdaeq	r3, {r1, r2, r3, r4, r5, r8, r9, fp}
 680:	35050000 	strcc	r0, [r5, #-0]
 684:	00134900 	andseq	r4, r3, r0, lsl #18
 688:	01130600 	tsteq	r3, r0, lsl #12
 68c:	0b3a0b0b 	bleq	e832c0 <_stack+0xe032c0>
 690:	13010b3b 	movwne	r0, #6971	; 0x1b3b
 694:	0d070000 	stceq	0, cr0, [r7, #-0]
 698:	3a0e0300 	bcc	3812a0 <_stack+0x3012a0>
 69c:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 6a0:	000b3813 	andeq	r3, fp, r3, lsl r8
 6a4:	00340800 	eorseq	r0, r4, r0, lsl #16
 6a8:	0b3a0e03 	bleq	e83ebc <_stack+0xe03ebc>
 6ac:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 6b0:	00001802 	andeq	r1, r0, r2, lsl #16
 6b4:	0b000f09 	bleq	42e0 <_heap_top+0x32e0>
 6b8:	0013490b 	andseq	r4, r3, fp, lsl #18
 6bc:	012e0a00 			; <UNDEFINED> instruction: 0x012e0a00
 6c0:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
 6c4:	0b3b0b3a 	bleq	ec33b4 <_stack+0xe433b4>
 6c8:	01111927 	tsteq	r1, r7, lsr #18
 6cc:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 6d0:	01194297 			; <UNDEFINED> instruction: 0x01194297
 6d4:	0b000013 	bleq	728 <CPSR_IRQ_INHIBIT+0x6a8>
 6d8:	08030005 	stmdaeq	r3, {r0, r2}
 6dc:	0b3b0b3a 	bleq	ec33cc <_stack+0xe433cc>
 6e0:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 6e4:	340c0000 	strcc	r0, [ip], #-0
 6e8:	3a080300 	bcc	2012f0 <_stack+0x1812f0>
 6ec:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 6f0:	00180213 	andseq	r0, r8, r3, lsl r2
 6f4:	002e0d00 	eoreq	r0, lr, r0, lsl #26
 6f8:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
 6fc:	0b3b0b3a 	bleq	ec33ec <_stack+0xe433ec>
 700:	13491927 	movtne	r1, #39207	; 0x9927
 704:	06120111 			; <UNDEFINED> instruction: 0x06120111
 708:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 70c:	00000019 	andeq	r0, r0, r9, lsl r0
 710:	25011101 	strcs	r1, [r1, #-257]	; 0xfffffeff
 714:	030b130e 	movweq	r1, #45838	; 0xb30e
 718:	1201110e 	andne	r1, r1, #-2147483645	; 0x80000003
 71c:	00171006 	andseq	r1, r7, r6
 720:	00240200 	eoreq	r0, r4, r0, lsl #4
 724:	0b3e0b0b 	bleq	f83358 <_stack+0xf03358>
 728:	00000e03 	andeq	r0, r0, r3, lsl #28
 72c:	03001603 	movweq	r1, #1539	; 0x603
 730:	3b0b3a0e 	blcc	2cef70 <_stack+0x24ef70>
 734:	0013490b 	andseq	r4, r3, fp, lsl #18
 738:	00240400 	eoreq	r0, r4, r0, lsl #8
 73c:	0b3e0b0b 	bleq	f83370 <_stack+0xf03370>
 740:	00000803 	andeq	r0, r0, r3, lsl #16
 744:	49003505 	stmdbmi	r0, {r0, r2, r8, sl, ip, sp}
 748:	06000013 			; <UNDEFINED> instruction: 0x06000013
 74c:	13490026 	movtne	r0, #36902	; 0x9026
 750:	13070000 	movwne	r0, #28672	; 0x7000
 754:	3a0b0b01 	bcc	2c3360 <_stack+0x243360>
 758:	010b3b0b 	tsteq	fp, fp, lsl #22
 75c:	08000013 	stmdaeq	r0, {r0, r1, r4}
 760:	0e03000d 	cdpeq	0, 0, cr0, cr3, cr13, {0}
 764:	0b3b0b3a 	bleq	ec3454 <_stack+0xe43454>
 768:	0b381349 	bleq	e05494 <_stack+0xd85494>
 76c:	04090000 	streq	r0, [r9], #-0
 770:	490b0b01 	stmdbmi	fp, {r0, r8, r9, fp}
 774:	3b0b3a13 	blcc	2cefc8 <_stack+0x24efc8>
 778:	0013010b 	andseq	r0, r3, fp, lsl #2
 77c:	00280a00 	eoreq	r0, r8, r0, lsl #20
 780:	0b1c0e03 	bleq	703f94 <_stack+0x683f94>
 784:	010b0000 	mrseq	r0, (UNDEF: 11)
 788:	01134901 	tsteq	r3, r1, lsl #18
 78c:	0c000013 	stceq	0, cr0, [r0], {19}
 790:	13490021 	movtne	r0, #36897	; 0x9021
 794:	00000b2f 	andeq	r0, r0, pc, lsr #22
 798:	0300340d 	movweq	r3, #1037	; 0x40d
 79c:	3b0b3a0e 	blcc	2cefdc <_stack+0x24efdc>
 7a0:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 7a4:	0e000018 	mcreq	0, 0, r0, cr0, cr8, {0}
 7a8:	0b0b000f 	bleq	2c07ec <_stack+0x2407ec>
 7ac:	00001349 	andeq	r1, r0, r9, asr #6
 7b0:	3f012e0f 	svccc	0x00012e0f
 7b4:	3a0e0319 	bcc	381420 <_stack+0x301420>
 7b8:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 7bc:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 7c0:	96184006 	ldrls	r4, [r8], -r6
 7c4:	13011942 	movwne	r1, #6466	; 0x1942
 7c8:	2e100000 	cdpcs	0, 1, cr0, cr0, cr0, {0}
 7cc:	03193f01 	tsteq	r9, #1, 30
 7d0:	3b0b3a0e 	blcc	2cf010 <_stack+0x24f010>
 7d4:	4919270b 	ldmdbmi	r9, {r0, r1, r3, r8, r9, sl, sp}
 7d8:	12011113 	andne	r1, r1, #-1073741820	; 0xc0000004
 7dc:	96184006 	ldrls	r4, [r8], -r6
 7e0:	13011942 	movwne	r1, #6466	; 0x1942
 7e4:	05110000 	ldreq	r0, [r1, #-0]
 7e8:	3a0e0300 	bcc	3813f0 <_stack+0x3013f0>
 7ec:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 7f0:	00180213 	andseq	r0, r8, r3, lsl r2
 7f4:	00051200 	andeq	r1, r5, r0, lsl #4
 7f8:	0b3a0803 	bleq	e8280c <_stack+0xe0280c>
 7fc:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 800:	00001802 	andeq	r1, r0, r2, lsl #16
 804:	03003413 	movweq	r3, #1043	; 0x413
 808:	3b0b3a08 	blcc	2cf030 <_stack+0x24f030>
 80c:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 810:	14000018 	strne	r0, [r0], #-24	; 0xffffffe8
 814:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 818:	0b3a0e03 	bleq	e8402c <_stack+0xe0402c>
 81c:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 820:	06120111 			; <UNDEFINED> instruction: 0x06120111
 824:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 828:	00130119 	andseq	r0, r3, r9, lsl r1
 82c:	002e1500 	eoreq	r1, lr, r0, lsl #10
 830:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
 834:	0b3b0b3a 	bleq	ec3524 <_stack+0xe43524>
 838:	13491927 	movtne	r1, #39207	; 0x9927
 83c:	06120111 			; <UNDEFINED> instruction: 0x06120111
 840:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 844:	00000019 	andeq	r0, r0, r9, lsl r0
 848:	25011101 	strcs	r1, [r1, #-257]	; 0xfffffeff
 84c:	030b130e 	movweq	r1, #45838	; 0xb30e
 850:	110e1b0e 	tstne	lr, lr, lsl #22
 854:	10061201 	andne	r1, r6, r1, lsl #4
 858:	02000017 	andeq	r0, r0, #23
 85c:	0b0b0024 	bleq	2c08f4 <_stack+0x2408f4>
 860:	0e030b3e 	vmoveq.16	d3[0], r0
 864:	16030000 	strne	r0, [r3], -r0
 868:	3a0e0300 	bcc	381470 <_stack+0x301470>
 86c:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 870:	04000013 	streq	r0, [r0], #-19	; 0xffffffed
 874:	0b0b0024 	bleq	2c090c <_stack+0x24090c>
 878:	08030b3e 	stmdaeq	r3, {r1, r2, r3, r4, r5, r8, r9, fp}
 87c:	0f050000 	svceq	0x00050000
 880:	000b0b00 	andeq	r0, fp, r0, lsl #22
 884:	00160600 	andseq	r0, r6, r0, lsl #12
 888:	0b3a0e03 	bleq	e8409c <_stack+0xe0409c>
 88c:	1349053b 	movtne	r0, #38203	; 0x953b
 890:	17070000 	strne	r0, [r7, -r0]
 894:	3a0b0b01 	bcc	2c34a0 <_stack+0x2434a0>
 898:	010b3b0b 	tsteq	fp, fp, lsl #22
 89c:	08000013 	stmdaeq	r0, {r0, r1, r4}
 8a0:	0e03000d 	cdpeq	0, 0, cr0, cr3, cr13, {0}
 8a4:	0b3b0b3a 	bleq	ec3594 <_stack+0xe43594>
 8a8:	00001349 	andeq	r1, r0, r9, asr #6
 8ac:	49010109 	stmdbmi	r1, {r0, r3, r8}
 8b0:	00130113 	andseq	r0, r3, r3, lsl r1
 8b4:	00210a00 	eoreq	r0, r1, r0, lsl #20
 8b8:	0b2f1349 	bleq	bc55e4 <_stack+0xb455e4>
 8bc:	130b0000 	movwne	r0, #45056	; 0xb000
 8c0:	3a0b0b01 	bcc	2c34cc <_stack+0x2434cc>
 8c4:	010b3b0b 	tsteq	fp, fp, lsl #22
 8c8:	0c000013 	stceq	0, cr0, [r0], {19}
 8cc:	0e03000d 	cdpeq	0, 0, cr0, cr3, cr13, {0}
 8d0:	0b3b0b3a 	bleq	ec35c0 <_stack+0xe435c0>
 8d4:	0b381349 	bleq	e05600 <_stack+0xd85600>
 8d8:	130d0000 	movwne	r0, #53248	; 0xd000
 8dc:	0b0e0301 	bleq	3814e8 <_stack+0x3014e8>
 8e0:	3b0b3a0b 	blcc	2cf114 <_stack+0x24f114>
 8e4:	0013010b 	andseq	r0, r3, fp, lsl #2
 8e8:	000d0e00 	andeq	r0, sp, r0, lsl #28
 8ec:	0b3a0803 	bleq	e82900 <_stack+0xe02900>
 8f0:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 8f4:	00000b38 	andeq	r0, r0, r8, lsr fp
 8f8:	0b000f0f 	bleq	453c <_heap_top+0x353c>
 8fc:	0013490b 	andseq	r4, r3, fp, lsl #18
 900:	01131000 	tsteq	r3, r0
 904:	050b0e03 	streq	r0, [fp, #-3587]	; 0xfffff1fd
 908:	0b3b0b3a 	bleq	ec35f8 <_stack+0xe435f8>
 90c:	00001301 	andeq	r1, r0, r1, lsl #6
 910:	03000d11 	movweq	r0, #3345	; 0xd11
 914:	3b0b3a0e 	blcc	2cf154 <_stack+0x24f154>
 918:	3813490b 	ldmdacc	r3, {r0, r1, r3, r8, fp, lr}
 91c:	12000005 	andne	r0, r0, #5
 920:	19270015 	stmdbne	r7!, {r0, r2, r4}
 924:	15130000 	ldrne	r0, [r3, #-0]
 928:	49192701 	ldmdbmi	r9, {r0, r8, r9, sl, sp}
 92c:	00130113 	andseq	r0, r3, r3, lsl r1
 930:	00051400 	andeq	r1, r5, r0, lsl #8
 934:	00001349 	andeq	r1, r0, r9, asr #6
 938:	49002615 	stmdbmi	r0, {r0, r2, r4, r9, sl, sp}
 93c:	16000013 			; <UNDEFINED> instruction: 0x16000013
 940:	0e030113 	mcreq	1, 0, r0, cr3, cr3, {0}
 944:	0b3a050b 	bleq	e81d78 <_stack+0xe01d78>
 948:	1301053b 	movwne	r0, #5435	; 0x153b
 94c:	0d170000 	ldceq	0, cr0, [r7, #-0]
 950:	3a0e0300 	bcc	381558 <_stack+0x301558>
 954:	49053b0b 	stmdbmi	r5, {r0, r1, r3, r8, r9, fp, ip, sp}
 958:	000b3813 	andeq	r3, fp, r3, lsl r8
 95c:	000d1800 	andeq	r1, sp, r0, lsl #16
 960:	0b3a0e03 	bleq	e84174 <_stack+0xe04174>
 964:	1349053b 	movtne	r0, #38203	; 0x953b
 968:	00000538 	andeq	r0, r0, r8, lsr r5
 96c:	03011319 	movweq	r1, #4889	; 0x1319
 970:	3a0b0b0e 	bcc	2c35b0 <_stack+0x2435b0>
 974:	01053b0b 	tsteq	r5, fp, lsl #22
 978:	1a000013 	bne	9cc <CPSR_IRQ_INHIBIT+0x94c>
 97c:	0b0b0113 	bleq	2c0dd0 <_stack+0x240dd0>
 980:	053b0b3a 	ldreq	r0, [fp, #-2874]!	; 0xfffff4c6
 984:	00001301 	andeq	r1, r0, r1, lsl #6
 988:	0b01171b 	bleq	465fc <__bss_end__+0x3d0e8>
 98c:	3b0b3a0b 	blcc	2cf1c0 <_stack+0x24f1c0>
 990:	00130105 	andseq	r0, r3, r5, lsl #2
 994:	000d1c00 	andeq	r1, sp, r0, lsl #24
 998:	0b3a0e03 	bleq	e841ac <_stack+0xe041ac>
 99c:	1349053b 	movtne	r0, #38203	; 0x953b
 9a0:	151d0000 	ldrne	r0, [sp, #-0]
 9a4:	01192701 	tsteq	r9, r1, lsl #14
 9a8:	1e000013 	mcrne	0, 0, r0, cr0, cr3, {0}
 9ac:	0e030034 	mcreq	0, 0, r0, cr3, cr4, {1}
 9b0:	053b0b3a 	ldreq	r0, [fp, #-2874]!	; 0xfffff4c6
 9b4:	193f1349 	ldmdbne	pc!, {r0, r3, r6, r8, r9, ip}	; <UNPREDICTABLE>
 9b8:	0000193c 	andeq	r1, r0, ip, lsr r9
 9bc:	4900351f 	stmdbmi	r0, {r0, r1, r2, r3, r4, r8, sl, ip, sp}
 9c0:	20000013 	andcs	r0, r0, r3, lsl r0
 9c4:	0e030034 	mcreq	0, 0, r0, cr3, cr4, {1}
 9c8:	0b3b0b3a 	bleq	ec36b8 <_stack+0xe436b8>
 9cc:	193f1349 	ldmdbne	pc!, {r0, r3, r6, r8, r9, ip}	; <UNPREDICTABLE>
 9d0:	0000193c 	andeq	r1, r0, ip, lsr r9
 9d4:	3f012e21 	svccc	0x00012e21
 9d8:	3a0e0319 	bcc	381644 <_stack+0x301644>
 9dc:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 9e0:	11134919 	tstne	r3, r9, lsl r9
 9e4:	40061201 	andmi	r1, r6, r1, lsl #4
 9e8:	19429618 	stmdbne	r2, {r3, r4, r9, sl, ip, pc}^
 9ec:	00001301 	andeq	r1, r0, r1, lsl #6
 9f0:	03003422 	movweq	r3, #1058	; 0x422
 9f4:	3b0b3a0e 	blcc	2cf234 <_stack+0x24f234>
 9f8:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 9fc:	23000018 	movwcs	r0, #24
 a00:	08030034 	stmdaeq	r3, {r2, r4, r5}
 a04:	0b3b0b3a 	bleq	ec36f4 <_stack+0xe436f4>
 a08:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 a0c:	01000000 	mrseq	r0, (UNDEF: 0)
 a10:	0e250111 	mcreq	1, 1, r0, cr5, cr1, {0}
 a14:	0e030b13 	vmoveq.32	d3[0], r0
 a18:	06120111 			; <UNDEFINED> instruction: 0x06120111
 a1c:	00001710 	andeq	r1, r0, r0, lsl r7
 a20:	0b002402 	bleq	9a30 <__bss_end__+0x51c>
 a24:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 a28:	0300000e 	movweq	r0, #14
 a2c:	0e030016 	mcreq	0, 0, r0, cr3, cr6, {0}
 a30:	0b3b0b3a 	bleq	ec3720 <_stack+0xe43720>
 a34:	00001349 	andeq	r1, r0, r9, asr #6
 a38:	0b002404 	bleq	9a50 <__bss_end__+0x53c>
 a3c:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 a40:	05000008 	streq	r0, [r0, #-8]
 a44:	13490035 	movtne	r0, #36917	; 0x9035
 a48:	26060000 	strcs	r0, [r6], -r0
 a4c:	00134900 	andseq	r4, r3, r0, lsl #18
 a50:	01130700 	tsteq	r3, r0, lsl #14
 a54:	0b3a0b0b 	bleq	e83688 <_stack+0xe03688>
 a58:	13010b3b 	movwne	r0, #6971	; 0x1b3b
 a5c:	0d080000 	stceq	0, cr0, [r8, #-0]
 a60:	3a0e0300 	bcc	381668 <_stack+0x301668>
 a64:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 a68:	000b3813 	andeq	r3, fp, r3, lsl r8
 a6c:	000d0900 	andeq	r0, sp, r0, lsl #18
 a70:	0b3a0803 	bleq	e82a84 <_stack+0xe02a84>
 a74:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 a78:	00000b38 	andeq	r0, r0, r8, lsr fp
 a7c:	3f012e0a 	svccc	0x00012e0a
 a80:	3a0e0319 	bcc	3816ec <_stack+0x3016ec>
 a84:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 a88:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 a8c:	96184006 	ldrls	r4, [r8], -r6
 a90:	13011942 	movwne	r1, #6466	; 0x1942
 a94:	050b0000 	streq	r0, [fp, #-0]
 a98:	3a0e0300 	bcc	3816a0 <_stack+0x3016a0>
 a9c:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 aa0:	00180213 	andseq	r0, r8, r3, lsl r2
 aa4:	010b0c00 	tsteq	fp, r0, lsl #24
 aa8:	06120111 			; <UNDEFINED> instruction: 0x06120111
 aac:	00001301 	andeq	r1, r0, r1, lsl #6
 ab0:	0300340d 	movweq	r3, #1037	; 0x40d
 ab4:	3b0b3a0e 	blcc	2cf2f4 <_stack+0x24f2f4>
 ab8:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 abc:	0e000018 	mcreq	0, 0, r0, cr0, cr8, {0}
 ac0:	0111010b 	tsteq	r1, fp, lsl #2
 ac4:	00000612 	andeq	r0, r0, r2, lsl r6
 ac8:	0b000f0f 	bleq	470c <_heap_top+0x370c>
 acc:	0013490b 	andseq	r4, r3, fp, lsl #18
 ad0:	11010000 	mrsne	r0, (UNDEF: 1)
 ad4:	130e2501 	movwne	r2, #58625	; 0xe501
 ad8:	110e030b 	tstne	lr, fp, lsl #6
 adc:	10061201 	andne	r1, r6, r1, lsl #4
 ae0:	02000017 	andeq	r0, r0, #23
 ae4:	0b0b0024 	bleq	2c0b7c <_stack+0x240b7c>
 ae8:	0e030b3e 	vmoveq.16	d3[0], r0
 aec:	24030000 	strcs	r0, [r3], #-0
 af0:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 af4:	0008030b 	andeq	r0, r8, fp, lsl #6
 af8:	01130400 	tsteq	r3, r0, lsl #8
 afc:	0b3a0b0b 	bleq	e83730 <_stack+0xe03730>
 b00:	13010b3b 	movwne	r0, #6971	; 0x1b3b
 b04:	0d050000 	stceq	0, cr0, [r5, #-0]
 b08:	3a0e0300 	bcc	381710 <_stack+0x301710>
 b0c:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 b10:	000b3813 	andeq	r3, fp, r3, lsl r8
 b14:	01010600 	tsteq	r1, r0, lsl #12
 b18:	13011349 	movwne	r1, #4937	; 0x1349
 b1c:	21070000 	mrscs	r0, (UNDEF: 7)
 b20:	2f134900 	svccs	0x00134900
 b24:	0800000b 	stmdaeq	r0, {r0, r1, r3}
 b28:	13490026 	movtne	r0, #36902	; 0x9026
 b2c:	16090000 	strne	r0, [r9], -r0
 b30:	3a0e0300 	bcc	381738 <_stack+0x301738>
 b34:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 b38:	0a000013 	beq	b8c <CPSR_IRQ_INHIBIT+0xb0c>
 b3c:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 b40:	0b3a0e03 	bleq	e84354 <_stack+0xe04354>
 b44:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 b48:	01111349 	tsteq	r1, r9, asr #6
 b4c:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 b50:	01194297 			; <UNDEFINED> instruction: 0x01194297
 b54:	0b000013 	bleq	ba8 <CPSR_IRQ_INHIBIT+0xb28>
 b58:	08030005 	stmdaeq	r3, {r0, r2}
 b5c:	0b3b0b3a 	bleq	ec384c <_stack+0xe4384c>
 b60:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 b64:	050c0000 	streq	r0, [ip, #-0]
 b68:	3a0e0300 	bcc	381770 <_stack+0x301770>
 b6c:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 b70:	00180213 	andseq	r0, r8, r3, lsl r2
 b74:	00340d00 	eorseq	r0, r4, r0, lsl #26
 b78:	0b3a0803 	bleq	e82b8c <_stack+0xe02b8c>
 b7c:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 b80:	00001802 	andeq	r1, r0, r2, lsl #16
 b84:	0b000f0e 	bleq	47c4 <_heap_top+0x37c4>
 b88:	0013490b 	andseq	r4, r3, fp, lsl #18
 b8c:	00260f00 	eoreq	r0, r6, r0, lsl #30
 b90:	0f100000 	svceq	0x00100000
 b94:	000b0b00 	andeq	r0, fp, r0, lsl #22
 b98:	012e1100 			; <UNDEFINED> instruction: 0x012e1100
 b9c:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
 ba0:	0b3b0b3a 	bleq	ec3890 <_stack+0xe43890>
 ba4:	01111927 	tsteq	r1, r7, lsr #18
 ba8:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 bac:	00194297 	mulseq	r9, r7, r2
 bb0:	11010000 	mrsne	r0, (UNDEF: 1)
 bb4:	130e2501 	movwne	r2, #58625	; 0xe501
 bb8:	110e030b 	tstne	lr, fp, lsl #6
 bbc:	10061201 	andne	r1, r6, r1, lsl #4
 bc0:	02000017 	andeq	r0, r0, #23
 bc4:	0b0b0024 	bleq	2c0c5c <_stack+0x240c5c>
 bc8:	0e030b3e 	vmoveq.16	d3[0], r0
 bcc:	24030000 	strcs	r0, [r3], #-0
 bd0:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 bd4:	0008030b 	andeq	r0, r8, fp, lsl #6
 bd8:	012e0400 			; <UNDEFINED> instruction: 0x012e0400
 bdc:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
 be0:	0b3b0b3a 	bleq	ec38d0 <_stack+0xe438d0>
 be4:	01111927 	tsteq	r1, r7, lsr #18
 be8:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 bec:	01194296 			; <UNDEFINED> instruction: 0x01194296
 bf0:	05000013 	streq	r0, [r0, #-19]	; 0xffffffed
 bf4:	0e030005 	cdpeq	0, 0, cr0, cr3, cr5, {0}
 bf8:	0b3b0b3a 	bleq	ec38e8 <_stack+0xe438e8>
 bfc:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 c00:	0f060000 	svceq	0x00060000
 c04:	490b0b00 	stmdbmi	fp, {r8, r9, fp}
 c08:	07000013 	smladeq	r0, r3, r0, r0
 c0c:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 c10:	0b3a0e03 	bleq	e84424 <_stack+0xe04424>
 c14:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 c18:	06120111 			; <UNDEFINED> instruction: 0x06120111
 c1c:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 c20:	08000019 	stmdaeq	r0, {r0, r3, r4}
 c24:	08030005 	stmdaeq	r3, {r0, r2}
 c28:	0b3b0b3a 	bleq	ec3918 <_stack+0xe43918>
 c2c:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 c30:	01000000 	mrseq	r0, (UNDEF: 0)
 c34:	06100011 			; <UNDEFINED> instruction: 0x06100011
 c38:	01120111 	tsteq	r2, r1, lsl r1
 c3c:	081b0803 	ldmdaeq	fp, {r0, r1, fp}
 c40:	05130825 	ldreq	r0, [r3, #-2085]	; 0xfffff7db
 c44:	01000000 	mrseq	r0, (UNDEF: 0)
 c48:	06100011 			; <UNDEFINED> instruction: 0x06100011
 c4c:	01120111 	tsteq	r2, r1, lsl r1
 c50:	081b0803 	ldmdaeq	fp, {r0, r1, fp}
 c54:	05130825 	ldreq	r0, [r3, #-2085]	; 0xfffff7db
 c58:	01000000 	mrseq	r0, (UNDEF: 0)
 c5c:	06100011 			; <UNDEFINED> instruction: 0x06100011
 c60:	01120111 	tsteq	r2, r1, lsl r1
 c64:	081b0803 	ldmdaeq	fp, {r0, r1, fp}
 c68:	05130825 	ldreq	r0, [r3, #-2085]	; 0xfffff7db
 c6c:	Address 0x0000000000000c6c is out of bounds.


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
  50:	00809402 	addeq	r9, r0, r2, lsl #8
  54:	4bbc1800 	blmi	fef0605c <CPSR_UNAFFECTED_BITS+0xfef0615c>
  58:	2f4a0b03 	svccs	0x004a0b03
  5c:	0200869d 	andeq	r8, r0, #164626432	; 0x9d00000
  60:	02850104 	addeq	r0, r5, #4, 2
  64:	01010006 	tsteq	r1, r6
  68:	00000077 	andeq	r0, r0, r7, ror r0
  6c:	00410002 	subeq	r0, r1, r2
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
  a4:	64000063 	strvs	r0, [r0], #-99	; 0xffffff9d
  a8:	796d6d75 	stmdbvc	sp!, {r0, r2, r4, r5, r6, r8, sl, fp, sp, lr}^
  ac:	0100632e 	tsteq	r0, lr, lsr #6
  b0:	00000000 	andeq	r0, r0, r0
  b4:	81000205 	tsthi	r0, r5, lsl #4
  b8:	00190000 	andseq	r0, r9, r0
  bc:	4d010402 	cfstrsmi	mvf0, [r1, #-8]
  c0:	d7d7676b 	ldrble	r6, [r7, fp, ror #14]
  c4:	30682208 	rsbcc	r2, r8, r8, lsl #4
  c8:	02003068 	andeq	r3, r0, #104	; 0x68
  cc:	a3690104 	cmnge	r9, #4, 2
  d0:	089f9f67 	ldmeq	pc, {r0, r1, r2, r5, r6, r8, r9, sl, fp, ip, pc}	; <UNPREDICTABLE>
  d4:	68306822 	ldmdavs	r0!, {r1, r5, fp, sp, lr}
  d8:	04020030 	streq	r0, [r2], #-48	; 0xffffffd0
  dc:	0a026901 	beq	9a4e8 <_stack+0x1a4e8>
  e0:	17010100 	strne	r0, [r1, -r0, lsl #2]
  e4:	02000001 	andeq	r0, r0, #1
  e8:	0000e000 	andeq	lr, r0, r0
  ec:	fb010200 	blx	408f6 <__bss_end__+0x373e2>
  f0:	01000d0e 	tsteq	r0, lr, lsl #26
  f4:	00010101 	andeq	r0, r1, r1, lsl #2
  f8:	00010000 	andeq	r0, r1, r0
  fc:	682f0100 	stmdavs	pc!, {r8}	; <UNPREDICTABLE>
 100:	2f656d6f 	svccs	0x00656d6f
 104:	69646261 	stmdbvs	r4!, {r0, r5, r6, r9, sp, lr}^
 108:	6972616b 	ldmdbvs	r2!, {r0, r1, r3, r5, r6, r8, sp, lr}^
 10c:	65642f6d 	strbvs	r2, [r4, #-3949]!	; 0xfffff093
 110:	794d2f76 	stmdbvc	sp, {r1, r2, r4, r5, r6, r8, r9, sl, fp, sp}^
 114:	7474694c 	ldrbtvc	r6, [r4], #-2380	; 0xfffff6b4
 118:	534f656c 	movtpl	r6, #62828	; 0xf56c
 11c:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 120:	73752f00 	cmnvc	r5, #0, 30
 124:	6e692f72 	mcrvs	15, 3, r2, cr9, cr2, {3}
 128:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xfffff39d
 12c:	656e2f65 	strbvs	r2, [lr, #-3941]!	; 0xfffff09b
 130:	62696c77 	rsbvs	r6, r9, #30464	; 0x7700
 134:	63616d2f 	cmnvs	r1, #3008	; 0xbc0
 138:	656e6968 	strbvs	r6, [lr, #-2408]!	; 0xfffff698
 13c:	73752f00 	cmnvc	r5, #0, 30
 140:	6e692f72 	mcrvs	15, 3, r2, cr9, cr2, {3}
 144:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xfffff39d
 148:	656e2f65 	strbvs	r2, [lr, #-3941]!	; 0xfffff09b
 14c:	62696c77 	rsbvs	r6, r9, #30464	; 0x7700
 150:	7379732f 	cmnvc	r9, #-1140850688	; 0xbc000000
 154:	6f682f00 	svcvs	0x00682f00
 158:	612f656d 			; <UNDEFINED> instruction: 0x612f656d
 15c:	6b696462 	blvs	1a592ec <_stack+0x19d92ec>
 160:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
 164:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
 168:	4c794d2f 	ldclmi	13, cr4, [r9], #-188	; 0xffffff44
 16c:	6c747469 	cfldrdvs	mvd7, [r4], #-420	; 0xfffffe5c
 170:	2f534f65 	svccs	0x00534f65
 174:	2f637273 	svccs	0x00637273
 178:	692f2e2e 	stmdbvs	pc!, {r1, r2, r3, r5, r9, sl, fp, sp}	; <UNPREDICTABLE>
 17c:	756c636e 	strbvc	r6, [ip, #-878]!	; 0xfffffc92
 180:	00006564 	andeq	r6, r0, r4, ror #10
 184:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
 188:	632e6c65 			; <UNDEFINED> instruction: 0x632e6c65
 18c:	00000100 	andeq	r0, r0, r0, lsl #2
 190:	6665645f 			; <UNDEFINED> instruction: 0x6665645f
 194:	746c7561 	strbtvc	r7, [ip], #-1377	; 0xfffffa9f
 198:	7079745f 	rsbsvc	r7, r9, pc, asr r4
 19c:	682e7365 	stmdavs	lr!, {r0, r2, r5, r6, r8, r9, ip, sp, lr}
 1a0:	00000200 	andeq	r0, r0, r0, lsl #4
 1a4:	6474735f 	ldrbtvs	r7, [r4], #-863	; 0xfffffca1
 1a8:	2e746e69 	cdpcs	14, 7, cr6, cr4, cr9, {3}
 1ac:	00030068 	andeq	r0, r3, r8, rrx
 1b0:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
 1b4:	7361622d 	cmnvc	r1, #-805306366	; 0xd0000002
 1b8:	00682e65 	rsbeq	r2, r8, r5, ror #28
 1bc:	70000004 	andvc	r0, r0, r4
 1c0:	65636f72 	strbvs	r6, [r3, #-3954]!	; 0xfffff08e
 1c4:	682e7373 	stmdavs	lr!, {r0, r1, r4, r5, r6, r8, r9, ip, sp, lr}
 1c8:	00000400 	andeq	r0, r0, r0, lsl #8
 1cc:	02050000 	andeq	r0, r5, #0
 1d0:	00008254 	andeq	r8, r0, r4, asr r2
 1d4:	83011003 	movwhi	r1, #4099	; 0x1003
 1d8:	01040200 	mrseq	r0, R12_usr
 1dc:	a1be364b 			; <UNDEFINED> instruction: 0xa1be364b
 1e0:	0d038586 	cfstr32eq	mvfx8, [r3, #-536]	; 0xfffffde8
 1e4:	2e0a0382 	cdpcs	3, 0, cr0, cr10, cr2, {4}
 1e8:	684c4008 	stmdavs	ip, {r3, lr}^
 1ec:	684c6a68 	stmdavs	ip, {r3, r5, r6, r9, fp, sp, lr}^
 1f0:	674f6768 	strbvs	r6, [pc, -r8, ror #14]
 1f4:	01040200 	mrseq	r0, R12_usr
 1f8:	0008024e 	andeq	r0, r8, lr, asr #4
 1fc:	01100101 	tsteq	r0, r1, lsl #2
 200:	00020000 	andeq	r0, r2, r0
 204:	000000d1 	ldrdeq	r0, [r0], -r1
 208:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 20c:	0101000d 	tsteq	r1, sp
 210:	00000101 	andeq	r0, r0, r1, lsl #2
 214:	00000100 	andeq	r0, r0, r0, lsl #2
 218:	6f682f01 	svcvs	0x00682f01
 21c:	612f656d 			; <UNDEFINED> instruction: 0x612f656d
 220:	6b696462 	blvs	1a593b0 <_stack+0x19d93b0>
 224:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
 228:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
 22c:	4c794d2f 	ldclmi	13, cr4, [r9], #-188	; 0xffffff44
 230:	6c747469 	cfldrdvs	mvd7, [r4], #-420	; 0xfffffe5c
 234:	2f534f65 	svccs	0x00534f65
 238:	00637273 	rsbeq	r7, r3, r3, ror r2
 23c:	7273752f 	rsbsvc	r7, r3, #197132288	; 0xbc00000
 240:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 244:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0xfffffa94
 248:	77656e2f 	strbvc	r6, [r5, -pc, lsr #28]!
 24c:	2f62696c 	svccs	0x0062696c
 250:	6863616d 	stmdavs	r3!, {r0, r2, r3, r5, r6, r8, sp, lr}^
 254:	00656e69 	rsbeq	r6, r5, r9, ror #28
 258:	7273752f 	rsbsvc	r7, r3, #197132288	; 0xbc00000
 25c:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 260:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0xfffffa94
 264:	77656e2f 	strbvc	r6, [r5, -pc, lsr #28]!
 268:	2f62696c 	svccs	0x0062696c
 26c:	00737973 	rsbseq	r7, r3, r3, ror r9
 270:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; 1bc <CPSR_IRQ_INHIBIT+0x13c>
 274:	62612f65 	rsbvs	r2, r1, #404	; 0x194
 278:	616b6964 	cmnvs	fp, r4, ror #18
 27c:	2f6d6972 	svccs	0x006d6972
 280:	2f766564 	svccs	0x00766564
 284:	694c794d 	stmdbvs	ip, {r0, r2, r3, r6, r8, fp, ip, sp, lr}^
 288:	656c7474 	strbvs	r7, [ip, #-1140]!	; 0xfffffb8c
 28c:	732f534f 			; <UNDEFINED> instruction: 0x732f534f
 290:	2e2f6372 	mcrcs	3, 1, r6, cr15, cr2, {3}
 294:	6e692f2e 	cdpvs	15, 6, cr2, cr9, cr14, {1}
 298:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xfffff39d
 29c:	6d000065 	stcvs	0, cr0, [r0, #-404]	; 0xfffffe6c
 2a0:	6f6c6c61 	svcvs	0x006c6c61
 2a4:	00632e63 	rsbeq	r2, r3, r3, ror #28
 2a8:	5f000001 	svcpl	0x00000001
 2ac:	61666564 	cmnvs	r6, r4, ror #10
 2b0:	5f746c75 	svcpl	0x00746c75
 2b4:	65707974 	ldrbvs	r7, [r0, #-2420]!	; 0xfffff68c
 2b8:	00682e73 	rsbeq	r2, r8, r3, ror lr
 2bc:	5f000002 	svcpl	0x00000002
 2c0:	69647473 	stmdbvs	r4!, {r0, r1, r4, r5, r6, sl, ip, sp, lr}^
 2c4:	682e746e 	stmdavs	lr!, {r1, r2, r3, r5, r6, sl, ip, sp, lr}
 2c8:	00000300 	andeq	r0, r0, r0, lsl #6
 2cc:	6c6c616d 	stfvse	f6, [ip], #-436	; 0xfffffe4c
 2d0:	682e636f 	stmdavs	lr!, {r0, r1, r2, r3, r5, r6, r8, r9, sp, lr}
 2d4:	00000400 	andeq	r0, r0, r0, lsl #8
 2d8:	02050000 	andeq	r0, r5, #0
 2dc:	0000837c 	andeq	r8, r0, ip, ror r3
 2e0:	86010b03 	strhi	r0, [r1], -r3, lsl #22
 2e4:	a0684c67 	rsbge	r4, r8, r7, ror #24
 2e8:	04020067 	streq	r0, [r2], #-103	; 0xffffff99
 2ec:	02002902 	andeq	r2, r0, #32768	; 0x8000
 2f0:	66060104 	strvs	r0, [r6], -r4, lsl #2
 2f4:	82090306 	andhi	r0, r9, #402653184	; 0x18000000
 2f8:	04020068 	streq	r0, [r2], #-104	; 0xffffff98
 2fc:	06820601 	streq	r0, [r2], r1, lsl #12
 300:	6768a068 	strbvs	sl, [r8, -r8, rrx]!
 304:	4c9fa084 	ldcmi	0, cr10, [pc], {132}	; 0x84
 308:	67696769 	strbvs	r6, [r9, -r9, ror #14]!
 30c:	0010024b 	andseq	r0, r0, fp, asr #4
 310:	018d0101 	orreq	r0, sp, r1, lsl #2
 314:	00020000 	andeq	r0, r2, r0
 318:	00000126 	andeq	r0, r0, r6, lsr #2
 31c:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 320:	0101000d 	tsteq	r1, sp
 324:	00000101 	andeq	r0, r0, r1, lsl #2
 328:	00000100 	andeq	r0, r0, r0, lsl #2
 32c:	6f682f01 	svcvs	0x00682f01
 330:	612f656d 			; <UNDEFINED> instruction: 0x612f656d
 334:	6b696462 	blvs	1a594c4 <_stack+0x19d94c4>
 338:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
 33c:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
 340:	4c794d2f 	ldclmi	13, cr4, [r9], #-188	; 0xffffff44
 344:	6c747469 	cfldrdvs	mvd7, [r4], #-420	; 0xfffffe5c
 348:	2f534f65 	svccs	0x00534f65
 34c:	00637273 	rsbeq	r7, r3, r3, ror r2
 350:	7273752f 	rsbsvc	r7, r3, #197132288	; 0xbc00000
 354:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 358:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0xfffffa94
 35c:	77656e2f 	strbvc	r6, [r5, -pc, lsr #28]!
 360:	2f62696c 	svccs	0x0062696c
 364:	6863616d 	stmdavs	r3!, {r0, r2, r3, r5, r6, r8, sp, lr}^
 368:	00656e69 	rsbeq	r6, r5, r9, ror #28
 36c:	7273752f 	rsbsvc	r7, r3, #197132288	; 0xbc00000
 370:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 374:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0xfffffa94
 378:	77656e2f 	strbvc	r6, [r5, -pc, lsr #28]!
 37c:	2f62696c 	svccs	0x0062696c
 380:	00737973 	rsbseq	r7, r3, r3, ror r9
 384:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; 2d0 <CPSR_IRQ_INHIBIT+0x250>
 388:	62612f65 	rsbvs	r2, r1, #404	; 0x194
 38c:	616b6964 	cmnvs	fp, r4, ror #18
 390:	2f6d6972 	svccs	0x006d6972
 394:	2f766564 	svccs	0x00766564
 398:	694c794d 	stmdbvs	ip, {r0, r2, r3, r6, r8, fp, ip, sp, lr}^
 39c:	656c7474 	strbvs	r7, [ip, #-1140]!	; 0xfffffb8c
 3a0:	732f534f 			; <UNDEFINED> instruction: 0x732f534f
 3a4:	2e2f6372 	mcrcs	3, 1, r6, cr15, cr2, {3}
 3a8:	6e692f2e 	cdpvs	15, 6, cr2, cr9, cr14, {1}
 3ac:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xfffff39d
 3b0:	2e2e2f65 	cdpcs	15, 2, cr2, cr14, cr5, {3}
 3b4:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 3b8:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0xfffffa94
 3bc:	6f682f00 	svcvs	0x00682f00
 3c0:	612f656d 			; <UNDEFINED> instruction: 0x612f656d
 3c4:	6b696462 	blvs	1a59554 <_stack+0x19d9554>
 3c8:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
 3cc:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
 3d0:	4c794d2f 	ldclmi	13, cr4, [r9], #-188	; 0xffffff44
 3d4:	6c747469 	cfldrdvs	mvd7, [r4], #-420	; 0xfffffe5c
 3d8:	2f534f65 	svccs	0x00534f65
 3dc:	2f637273 	svccs	0x00637273
 3e0:	692f2e2e 	stmdbvs	pc!, {r1, r2, r3, r5, r9, sl, fp, sp}	; <UNPREDICTABLE>
 3e4:	756c636e 	strbvc	r6, [ip, #-878]!	; 0xfffffc92
 3e8:	00006564 	andeq	r6, r0, r4, ror #10
 3ec:	636f7270 	cmnvs	pc, #112, 4
 3f0:	2e737365 	cdpcs	3, 7, cr7, cr3, cr5, {3}
 3f4:	00010063 	andeq	r0, r1, r3, rrx
 3f8:	65645f00 	strbvs	r5, [r4, #-3840]!	; 0xfffff100
 3fc:	6c756166 	ldfvse	f6, [r5], #-408	; 0xfffffe68
 400:	79745f74 	ldmdbvc	r4!, {r2, r4, r5, r6, r8, r9, sl, fp, ip, lr}^
 404:	2e736570 	mrccs	5, 3, r6, cr3, cr0, {3}
 408:	00020068 	andeq	r0, r2, r8, rrx
 40c:	74735f00 	ldrbtvc	r5, [r3], #-3840	; 0xfffff100
 410:	746e6964 	strbtvc	r6, [lr], #-2404	; 0xfffff69c
 414:	0300682e 	movweq	r6, #2094	; 0x82e
 418:	70720000 	rsbsvc	r0, r2, r0
 41c:	61622d69 	cmnvs	r2, r9, ror #26
 420:	682e6573 	stmdavs	lr!, {r0, r1, r4, r5, r6, r8, sl, sp, lr}
 424:	00000400 	andeq	r0, r0, r0, lsl #8
 428:	636f7270 	cmnvs	pc, #112, 4
 42c:	2e737365 	cdpcs	3, 7, cr7, cr3, cr5, {3}
 430:	00050068 	andeq	r0, r5, r8, rrx
 434:	6c616d00 	stclvs	13, cr6, [r1], #-0
 438:	2e636f6c 	cdpcs	15, 6, cr6, cr3, cr12, {3}
 43c:	00050068 	andeq	r0, r5, r8, rrx
 440:	05000000 	streq	r0, [r0, #-0]
 444:	0084d802 	addeq	sp, r4, r2, lsl #16
 448:	68a01900 	stmiavs	r0!, {r8, fp, ip}
 44c:	03040200 	movweq	r0, #16896	; 0x4200
 450:	04020068 	streq	r0, [r2], #-104	; 0xffffff98
 454:	0200b803 	andeq	fp, r0, #196608	; 0x30000
 458:	66060104 	strvs	r0, [r6], -r4, lsl #2
 45c:	bb676b06 	bllt	19db07c <_stack+0x195b07c>
 460:	83696767 	cmnhi	r9, #27000832	; 0x19c0000
 464:	4b4ba167 	blmi	12e8a08 <_stack+0x1268a08>
 468:	684c68a1 	stmdavs	ip, {r0, r5, r7, fp, sp, lr}^
 46c:	02040200 	andeq	r0, r4, #0, 4
 470:	04020086 	streq	r0, [r2], #-134	; 0xffffff7a
 474:	667a0302 	ldrbtvs	r0, [sl], -r2, lsl #6
 478:	01040200 	mrseq	r0, R12_usr
 47c:	86066606 	strhi	r6, [r6], -r6, lsl #12
 480:	69a12f32 	stmibvs	r1!, {r1, r4, r5, r8, r9, sl, fp, sp}
 484:	0200684c 	andeq	r6, r0, #76, 16	; 0x4c0000
 488:	00860204 	addeq	r0, r6, r4, lsl #4
 48c:	03020402 	movweq	r0, #9218	; 0x2402
 490:	0200667a 	andeq	r6, r0, #127926272	; 0x7a00000
 494:	66060104 	strvs	r0, [r6], -r4, lsl #2
 498:	67338606 	ldrvs	r8, [r3, -r6, lsl #12]!
 49c:	0a022f4c 	beq	8c1d4 <_stack+0xc1d4>
 4a0:	f6010100 			; <UNDEFINED> instruction: 0xf6010100
 4a4:	02000000 	andeq	r0, r0, #0
 4a8:	0000dd00 	andeq	sp, r0, r0, lsl #26
 4ac:	fb010200 	blx	40cb6 <__bss_end__+0x377a2>
 4b0:	01000d0e 	tsteq	r0, lr, lsl #26
 4b4:	00010101 	andeq	r0, r1, r1, lsl #2
 4b8:	00010000 	andeq	r0, r1, r0
 4bc:	682f0100 	stmdavs	pc!, {r8}	; <UNPREDICTABLE>
 4c0:	2f656d6f 	svccs	0x00656d6f
 4c4:	69646261 	stmdbvs	r4!, {r0, r5, r6, r9, sp, lr}^
 4c8:	6972616b 	ldmdbvs	r2!, {r0, r1, r3, r5, r6, r8, sp, lr}^
 4cc:	65642f6d 	strbvs	r2, [r4, #-3949]!	; 0xfffff093
 4d0:	794d2f76 	stmdbvc	sp, {r1, r2, r4, r5, r6, r8, r9, sl, fp, sp}^
 4d4:	7474694c 	ldrbtvc	r6, [r4], #-2380	; 0xfffff6b4
 4d8:	534f656c 	movtpl	r6, #62828	; 0xf56c
 4dc:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 4e0:	73752f00 	cmnvc	r5, #0, 30
 4e4:	6e692f72 	mcrvs	15, 3, r2, cr9, cr2, {3}
 4e8:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xfffff39d
 4ec:	656e2f65 	strbvs	r2, [lr, #-3941]!	; 0xfffff09b
 4f0:	62696c77 	rsbvs	r6, r9, #30464	; 0x7700
 4f4:	63616d2f 	cmnvs	r1, #3008	; 0xbc0
 4f8:	656e6968 	strbvs	r6, [lr, #-2408]!	; 0xfffff698
 4fc:	73752f00 	cmnvc	r5, #0, 30
 500:	6e692f72 	mcrvs	15, 3, r2, cr9, cr2, {3}
 504:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xfffff39d
 508:	656e2f65 	strbvs	r2, [lr, #-3941]!	; 0xfffff09b
 50c:	62696c77 	rsbvs	r6, r9, #30464	; 0x7700
 510:	7379732f 	cmnvc	r9, #-1140850688	; 0xbc000000
 514:	6f682f00 	svcvs	0x00682f00
 518:	612f656d 			; <UNDEFINED> instruction: 0x612f656d
 51c:	6b696462 	blvs	1a596ac <_stack+0x19d96ac>
 520:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
 524:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
 528:	4c794d2f 	ldclmi	13, cr4, [r9], #-188	; 0xffffff44
 52c:	6c747469 	cfldrdvs	mvd7, [r4], #-420	; 0xfffffe5c
 530:	2f534f65 	svccs	0x00534f65
 534:	2f637273 	svccs	0x00637273
 538:	692f2e2e 	stmdbvs	pc!, {r1, r2, r3, r5, r9, sl, fp, sp}	; <UNPREDICTABLE>
 53c:	756c636e 	strbvc	r6, [ip, #-878]!	; 0xfffffc92
 540:	00006564 	andeq	r6, r0, r4, ror #10
 544:	2d697072 	stclcs	0, cr7, [r9, #-456]!	; 0xfffffe38
 548:	746d7261 	strbtvc	r7, [sp], #-609	; 0xfffffd9f
 54c:	72656d69 	rsbvc	r6, r5, #6720	; 0x1a40
 550:	0100632e 	tsteq	r0, lr, lsr #6
 554:	645f0000 	ldrbvs	r0, [pc], #-0	; 55c <CPSR_IRQ_INHIBIT+0x4dc>
 558:	75616665 	strbvc	r6, [r1, #-1637]!	; 0xfffff99b
 55c:	745f746c 	ldrbvc	r7, [pc], #-1132	; 564 <CPSR_IRQ_INHIBIT+0x4e4>
 560:	73657079 	cmnvc	r5, #121	; 0x79
 564:	0200682e 	andeq	r6, r0, #3014656	; 0x2e0000
 568:	735f0000 	cmpvc	pc, #0
 56c:	6e696474 	mcrvs	4, 3, r6, cr9, cr4, {3}
 570:	00682e74 	rsbeq	r2, r8, r4, ror lr
 574:	72000003 	andvc	r0, r0, #3
 578:	612d6970 			; <UNDEFINED> instruction: 0x612d6970
 57c:	69746d72 	ldmdbvs	r4!, {r1, r4, r5, r6, r8, sl, fp, sp, lr}^
 580:	2e72656d 	cdpcs	5, 7, cr6, cr2, cr13, {3}
 584:	00040068 	andeq	r0, r4, r8, rrx
 588:	05000000 	streq	r0, [r0, #-0]
 58c:	0086cc02 	addeq	ip, r6, r2, lsl #24
 590:	01100300 	tsteq	r0, r0, lsl #6
 594:	4ca14b4b 	fstmiaxmi	r1!, {d4-d40}	;@ Deprecated
 598:	01000802 	tsteq	r0, r2, lsl #16
 59c:	00010801 	andeq	r0, r1, r1, lsl #16
 5a0:	e3000200 	movw	r0, #512	; 0x200
 5a4:	02000000 	andeq	r0, r0, #0
 5a8:	0d0efb01 	vstreq	d15, [lr, #-4]
 5ac:	01010100 	mrseq	r0, (UNDEF: 17)
 5b0:	00000001 	andeq	r0, r0, r1
 5b4:	01000001 	tsteq	r0, r1
 5b8:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; 504 <CPSR_IRQ_INHIBIT+0x484>
 5bc:	62612f65 	rsbvs	r2, r1, #404	; 0x194
 5c0:	616b6964 	cmnvs	fp, r4, ror #18
 5c4:	2f6d6972 	svccs	0x006d6972
 5c8:	2f766564 	svccs	0x00766564
 5cc:	694c794d 	stmdbvs	ip, {r0, r2, r3, r6, r8, fp, ip, sp, lr}^
 5d0:	656c7474 	strbvs	r7, [ip, #-1140]!	; 0xfffffb8c
 5d4:	732f534f 			; <UNDEFINED> instruction: 0x732f534f
 5d8:	2f006372 	svccs	0x00006372
 5dc:	2f727375 	svccs	0x00727375
 5e0:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 5e4:	2f656475 	svccs	0x00656475
 5e8:	6c77656e 	cfldr64vs	mvdx6, [r7], #-440	; 0xfffffe48
 5ec:	6d2f6269 	sfmvs	f6, 4, [pc, #-420]!	; 450 <CPSR_IRQ_INHIBIT+0x3d0>
 5f0:	69686361 	stmdbvs	r8!, {r0, r5, r6, r8, r9, sp, lr}^
 5f4:	2f00656e 	svccs	0x0000656e
 5f8:	2f727375 	svccs	0x00727375
 5fc:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 600:	2f656475 	svccs	0x00656475
 604:	6c77656e 	cfldr64vs	mvdx6, [r7], #-440	; 0xfffffe48
 608:	732f6269 			; <UNDEFINED> instruction: 0x732f6269
 60c:	2f007379 	svccs	0x00007379
 610:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
 614:	6462612f 	strbtvs	r6, [r2], #-303	; 0xfffffed1
 618:	72616b69 	rsbvc	r6, r1, #107520	; 0x1a400
 61c:	642f6d69 	strtvs	r6, [pc], #-3433	; 624 <CPSR_IRQ_INHIBIT+0x5a4>
 620:	4d2f7665 	stcmi	6, cr7, [pc, #-404]!	; 494 <CPSR_IRQ_INHIBIT+0x414>
 624:	74694c79 	strbtvc	r4, [r9], #-3193	; 0xfffff387
 628:	4f656c74 	svcmi	0x00656c74
 62c:	72732f53 	rsbsvc	r2, r3, #332	; 0x14c
 630:	2e2e2f63 	cdpcs	15, 2, cr2, cr14, cr3, {3}
 634:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 638:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0xfffffa94
 63c:	70720000 	rsbsvc	r0, r2, r0
 640:	70672d69 	rsbvc	r2, r7, r9, ror #26
 644:	632e6f69 			; <UNDEFINED> instruction: 0x632e6f69
 648:	00000100 	andeq	r0, r0, r0, lsl #2
 64c:	6665645f 			; <UNDEFINED> instruction: 0x6665645f
 650:	746c7561 	strbtvc	r7, [ip], #-1377	; 0xfffffa9f
 654:	7079745f 	rsbsvc	r7, r9, pc, asr r4
 658:	682e7365 	stmdavs	lr!, {r0, r2, r5, r6, r8, r9, ip, sp, lr}
 65c:	00000200 	andeq	r0, r0, r0, lsl #4
 660:	6474735f 	ldrbtvs	r7, [r4], #-863	; 0xfffffca1
 664:	2e746e69 	cdpcs	14, 7, cr6, cr4, cr9, {3}
 668:	00030068 	andeq	r0, r3, r8, rrx
 66c:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
 670:	7361622d 	cmnvc	r1, #-805306366	; 0xd0000002
 674:	00682e65 	rsbeq	r2, r8, r5, ror #28
 678:	72000004 	andvc	r0, r0, #4
 67c:	672d6970 			; <UNDEFINED> instruction: 0x672d6970
 680:	2e6f6970 			; <UNDEFINED> instruction: 0x2e6f6970
 684:	00040068 	andeq	r0, r4, r8, rrx
 688:	05000000 	streq	r0, [r0, #-0]
 68c:	00870802 	addeq	r0, r7, r2, lsl #16
 690:	01100300 	tsteq	r0, r0, lsl #6
 694:	f3a34b4b 			; <UNDEFINED> instruction: 0xf3a34b4b
 698:	02673d08 	rsbeq	r3, r7, #8, 26	; 0x200
 69c:	2802132a 	stmdacs	r2, {r1, r3, r5, r8, r9, ip}
 6a0:	4cbd6713 	ldcmi	7, cr6, [sp], #76	; 0x4c
 6a4:	01000802 	tsteq	r0, r2, lsl #16
 6a8:	00014f01 	andeq	r4, r1, r1, lsl #30
 6ac:	e1000200 	mrs	r0, R8_usr
 6b0:	02000000 	andeq	r0, r0, #0
 6b4:	0d0efb01 	vstreq	d15, [lr, #-4]
 6b8:	01010100 	mrseq	r0, (UNDEF: 17)
 6bc:	00000001 	andeq	r0, r0, r1
 6c0:	01000001 	tsteq	r0, r1
 6c4:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; 610 <CPSR_IRQ_INHIBIT+0x590>
 6c8:	62612f65 	rsbvs	r2, r1, #404	; 0x194
 6cc:	616b6964 	cmnvs	fp, r4, ror #18
 6d0:	2f6d6972 	svccs	0x006d6972
 6d4:	2f766564 	svccs	0x00766564
 6d8:	694c794d 	stmdbvs	ip, {r0, r2, r3, r6, r8, fp, ip, sp, lr}^
 6dc:	656c7474 	strbvs	r7, [ip, #-1140]!	; 0xfffffb8c
 6e0:	732f534f 			; <UNDEFINED> instruction: 0x732f534f
 6e4:	2f006372 	svccs	0x00006372
 6e8:	2f727375 	svccs	0x00727375
 6ec:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 6f0:	2f656475 	svccs	0x00656475
 6f4:	6c77656e 	cfldr64vs	mvdx6, [r7], #-440	; 0xfffffe48
 6f8:	6d2f6269 	sfmvs	f6, 4, [pc, #-420]!	; 55c <CPSR_IRQ_INHIBIT+0x4dc>
 6fc:	69686361 	stmdbvs	r8!, {r0, r5, r6, r8, r9, sp, lr}^
 700:	2f00656e 	svccs	0x0000656e
 704:	2f727375 	svccs	0x00727375
 708:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 70c:	2f656475 	svccs	0x00656475
 710:	6c77656e 	cfldr64vs	mvdx6, [r7], #-440	; 0xfffffe48
 714:	732f6269 			; <UNDEFINED> instruction: 0x732f6269
 718:	2f007379 	svccs	0x00007379
 71c:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
 720:	6462612f 	strbtvs	r6, [r2], #-303	; 0xfffffed1
 724:	72616b69 	rsbvc	r6, r1, #107520	; 0x1a400
 728:	642f6d69 	strtvs	r6, [pc], #-3433	; 730 <CPSR_IRQ_INHIBIT+0x6b0>
 72c:	4d2f7665 	stcmi	6, cr7, [pc, #-404]!	; 5a0 <CPSR_IRQ_INHIBIT+0x520>
 730:	74694c79 	strbtvc	r4, [r9], #-3193	; 0xfffff387
 734:	4f656c74 	svcmi	0x00656c74
 738:	72732f53 	rsbsvc	r2, r3, #332	; 0x14c
 73c:	2e2e2f63 	cdpcs	15, 2, cr2, cr14, cr3, {3}
 740:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 744:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0xfffffa94
 748:	70720000 	rsbsvc	r0, r2, r0
 74c:	6e692d69 	cdpvs	13, 6, cr2, cr9, cr9, {3}
 750:	72726574 	rsbsvc	r6, r2, #116, 10	; 0x1d000000
 754:	73747075 	cmnvc	r4, #117	; 0x75
 758:	0100632e 	tsteq	r0, lr, lsr #6
 75c:	645f0000 	ldrbvs	r0, [pc], #-0	; 764 <CPSR_IRQ_INHIBIT+0x6e4>
 760:	75616665 	strbvc	r6, [r1, #-1637]!	; 0xfffff99b
 764:	745f746c 	ldrbvc	r7, [pc], #-1132	; 76c <CPSR_IRQ_INHIBIT+0x6ec>
 768:	73657079 	cmnvc	r5, #121	; 0x79
 76c:	0200682e 	andeq	r6, r0, #3014656	; 0x2e0000
 770:	735f0000 	cmpvc	pc, #0
 774:	6e696474 	mcrvs	4, 3, r6, cr9, cr4, {3}
 778:	00682e74 	rsbeq	r2, r8, r4, ror lr
 77c:	72000003 	andvc	r0, r0, #3
 780:	692d6970 	pushvs	{r4, r5, r6, r8, fp, sp, lr}
 784:	7265746e 	rsbvc	r7, r5, #1845493760	; 0x6e000000
 788:	74707572 	ldrbtvc	r7, [r0], #-1394	; 0xfffffa8e
 78c:	00682e73 	rsbeq	r2, r8, r3, ror lr
 790:	00000004 	andeq	r0, r0, r4
 794:	60020500 	andvs	r0, r2, r0, lsl #10
 798:	03000088 	movweq	r0, #136	; 0x88
 79c:	4b4b011d 	blmi	12c0c18 <_stack+0x1240c18>
 7a0:	839e0b03 	orrshi	r0, lr, #3072	; 0xc00
 7a4:	01040200 	mrseq	r0, R12_usr
 7a8:	0402004e 	streq	r0, [r2], #-78	; 0xffffffb2
 7ac:	02008301 	andeq	r8, r0, #67108864	; 0x4000000
 7b0:	03650104 	cmneq	r5, #4, 2
 7b4:	4b672e0c 	blmi	19cbfec <_stack+0x194bfec>
 7b8:	01040200 	mrseq	r0, R12_usr
 7bc:	9e0b0369 	cdpls	3, 0, cr0, cr11, cr9, {3}
 7c0:	02004b67 	andeq	r4, r0, #105472	; 0x19c00
 7c4:	03690104 	cmneq	r9, #4, 2
 7c8:	4b839e0c 	blmi	fe0e8000 <CPSR_UNAFFECTED_BITS+0xfe0e8100>
 7cc:	01040200 	mrseq	r0, R12_usr
 7d0:	9e0c0369 	cdpls	3, 0, cr0, cr12, cr9, {3}
 7d4:	02004b83 	andeq	r4, r0, #134144	; 0x20c00
 7d8:	03690104 	cmneq	r9, #4, 2
 7dc:	a16b9e0d 	cmnge	fp, sp, lsl #28
 7e0:	6c84bda1 	stcvs	13, cr11, [r4], {161}	; 0xa1
 7e4:	8485a1a2 	strhi	sl, [r5], #418	; 0x1a2
 7e8:	662e0383 	strtvs	r0, [lr], -r3, lsl #7
 7ec:	832e5603 			; <UNDEFINED> instruction: 0x832e5603
 7f0:	03662903 	cmneq	r6, #49152	; 0xc000
 7f4:	0230ba1c 	eorseq	fp, r0, #28, 20	; 0x1c000
 7f8:	01010006 	tsteq	r1, r6
 7fc:	000000ff 	strdeq	r0, [r0], -pc	; <UNPREDICTABLE>
 800:	00dd0002 	sbcseq	r0, sp, r2
 804:	01020000 	mrseq	r0, (UNDEF: 2)
 808:	000d0efb 	strdeq	r0, [sp], -fp
 80c:	01010101 	tsteq	r1, r1, lsl #2
 810:	01000000 	mrseq	r0, (UNDEF: 0)
 814:	2f010000 	svccs	0x00010000
 818:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
 81c:	6462612f 	strbtvs	r6, [r2], #-303	; 0xfffffed1
 820:	72616b69 	rsbvc	r6, r1, #107520	; 0x1a400
 824:	642f6d69 	strtvs	r6, [pc], #-3433	; 82c <CPSR_IRQ_INHIBIT+0x7ac>
 828:	4d2f7665 	stcmi	6, cr7, [pc, #-404]!	; 69c <CPSR_IRQ_INHIBIT+0x61c>
 82c:	74694c79 	strbtvc	r4, [r9], #-3193	; 0xfffff387
 830:	4f656c74 	svcmi	0x00656c74
 834:	72732f53 	rsbsvc	r2, r3, #332	; 0x14c
 838:	752f0063 	strvc	r0, [pc, #-99]!	; 7dd <CPSR_IRQ_INHIBIT+0x75d>
 83c:	692f7273 	stmdbvs	pc!, {r0, r1, r4, r5, r6, r9, ip, sp, lr}	; <UNPREDICTABLE>
 840:	756c636e 	strbvc	r6, [ip, #-878]!	; 0xfffffc92
 844:	6e2f6564 	cfsh64vs	mvdx6, mvdx15, #52
 848:	696c7765 	stmdbvs	ip!, {r0, r2, r5, r6, r8, r9, sl, ip, sp, lr}^
 84c:	616d2f62 	cmnvs	sp, r2, ror #30
 850:	6e696863 	cdpvs	8, 6, cr6, cr9, cr3, {3}
 854:	752f0065 	strvc	r0, [pc, #-101]!	; 7f7 <CPSR_IRQ_INHIBIT+0x777>
 858:	692f7273 	stmdbvs	pc!, {r0, r1, r4, r5, r6, r9, ip, sp, lr}	; <UNPREDICTABLE>
 85c:	756c636e 	strbvc	r6, [ip, #-878]!	; 0xfffffc92
 860:	6e2f6564 	cfsh64vs	mvdx6, mvdx15, #52
 864:	696c7765 	stmdbvs	ip!, {r0, r2, r5, r6, r8, r9, sl, ip, sp, lr}^
 868:	79732f62 	ldmdbvc	r3!, {r1, r5, r6, r8, r9, sl, fp, sp}^
 86c:	682f0073 	stmdavs	pc!, {r0, r1, r4, r5, r6}	; <UNPREDICTABLE>
 870:	2f656d6f 	svccs	0x00656d6f
 874:	69646261 	stmdbvs	r4!, {r0, r5, r6, r9, sp, lr}^
 878:	6972616b 	ldmdbvs	r2!, {r0, r1, r3, r5, r6, r8, sp, lr}^
 87c:	65642f6d 	strbvs	r2, [r4, #-3949]!	; 0xfffff093
 880:	794d2f76 	stmdbvc	sp, {r1, r2, r4, r5, r6, r8, r9, sl, fp, sp}^
 884:	7474694c 	ldrbtvc	r6, [r4], #-2380	; 0xfffff6b4
 888:	534f656c 	movtpl	r6, #62828	; 0xf56c
 88c:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 890:	2f2e2e2f 	svccs	0x002e2e2f
 894:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 898:	00656475 	rsbeq	r6, r5, r5, ror r4
 89c:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
 8a0:	7379732d 	cmnvc	r9, #-1275068416	; 0xb4000000
 8a4:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0xfffff68c
 8a8:	00632e72 	rsbeq	r2, r3, r2, ror lr
 8ac:	5f000001 	svcpl	0x00000001
 8b0:	61666564 	cmnvs	r6, r4, ror #10
 8b4:	5f746c75 	svcpl	0x00746c75
 8b8:	65707974 	ldrbvs	r7, [r0, #-2420]!	; 0xfffff68c
 8bc:	00682e73 	rsbeq	r2, r8, r3, ror lr
 8c0:	5f000002 	svcpl	0x00000002
 8c4:	69647473 	stmdbvs	r4!, {r0, r1, r4, r5, r6, sl, ip, sp, lr}^
 8c8:	682e746e 	stmdavs	lr!, {r1, r2, r3, r5, r6, sl, ip, sp, lr}
 8cc:	00000300 	andeq	r0, r0, r0, lsl #6
 8d0:	2d697072 	stclcs	0, cr7, [r9, #-456]!	; 0xfffffe38
 8d4:	74737973 	ldrbtvc	r7, [r3], #-2419	; 0xfffff68d
 8d8:	72656d69 	rsbvc	r6, r5, #6720	; 0x1a40
 8dc:	0400682e 	streq	r6, [r0], #-2094	; 0xfffff7d2
 8e0:	00000000 	andeq	r0, r0, r0
 8e4:	8aa80205 	bhi	fea01100 <CPSR_UNAFFECTED_BITS+0xfea01200>
 8e8:	10030000 	andne	r0, r3, r0
 8ec:	a14b4b01 	cmpge	fp, r1, lsl #22
 8f0:	02008483 	andeq	r8, r0, #-2097152000	; 0x83000000
 8f4:	2e060104 	adfcss	f0, f6, f4
 8f8:	0a02f606 	beq	be118 <_stack+0x3e118>
 8fc:	74010100 	strvc	r0, [r1], #-256	; 0xffffff00
 900:	02000001 	andeq	r0, r0, #1
 904:	0000fb00 	andeq	pc, r0, r0, lsl #22
 908:	fb010200 	blx	41112 <__bss_end__+0x37bfe>
 90c:	01000d0e 	tsteq	r0, lr, lsl #26
 910:	00010101 	andeq	r0, r1, r1, lsl #2
 914:	00010000 	andeq	r0, r1, r0
 918:	682f0100 	stmdavs	pc!, {r8}	; <UNPREDICTABLE>
 91c:	2f656d6f 	svccs	0x00656d6f
 920:	69646261 	stmdbvs	r4!, {r0, r5, r6, r9, sp, lr}^
 924:	6972616b 	ldmdbvs	r2!, {r0, r1, r3, r5, r6, r8, sp, lr}^
 928:	65642f6d 	strbvs	r2, [r4, #-3949]!	; 0xfffff093
 92c:	794d2f76 	stmdbvc	sp, {r1, r2, r4, r5, r6, r8, r9, sl, fp, sp}^
 930:	7474694c 	ldrbtvc	r6, [r4], #-2380	; 0xfffff6b4
 934:	534f656c 	movtpl	r6, #62828	; 0xf56c
 938:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 93c:	73752f00 	cmnvc	r5, #0, 30
 940:	6e692f72 	mcrvs	15, 3, r2, cr9, cr2, {3}
 944:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xfffff39d
 948:	656e2f65 	strbvs	r2, [lr, #-3941]!	; 0xfffff09b
 94c:	62696c77 	rsbvs	r6, r9, #30464	; 0x7700
 950:	63616d2f 	cmnvs	r1, #3008	; 0xbc0
 954:	656e6968 	strbvs	r6, [lr, #-2408]!	; 0xfffff698
 958:	73752f00 	cmnvc	r5, #0, 30
 95c:	6e692f72 	mcrvs	15, 3, r2, cr9, cr2, {3}
 960:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xfffff39d
 964:	656e2f65 	strbvs	r2, [lr, #-3941]!	; 0xfffff09b
 968:	62696c77 	rsbvs	r6, r9, #30464	; 0x7700
 96c:	7379732f 	cmnvc	r9, #-1140850688	; 0xbc000000
 970:	6f682f00 	svcvs	0x00682f00
 974:	612f656d 			; <UNDEFINED> instruction: 0x612f656d
 978:	6b696462 	blvs	1a59b08 <_stack+0x19d9b08>
 97c:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
 980:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
 984:	4c794d2f 	ldclmi	13, cr4, [r9], #-188	; 0xffffff44
 988:	6c747469 	cfldrdvs	mvd7, [r4], #-420	; 0xfffffe5c
 98c:	2f534f65 	svccs	0x00534f65
 990:	2f637273 	svccs	0x00637273
 994:	692f2e2e 	stmdbvs	pc!, {r1, r2, r3, r5, r9, sl, fp, sp}	; <UNPREDICTABLE>
 998:	756c636e 	strbvc	r6, [ip, #-878]!	; 0xfffffc92
 99c:	00006564 	andeq	r6, r0, r4, ror #10
 9a0:	2d697072 	stclcs	0, cr7, [r9, #-456]!	; 0xfffffe38
 9a4:	74726175 	ldrbtvc	r6, [r2], #-373	; 0xfffffe8b
 9a8:	0100632e 	tsteq	r0, lr, lsr #6
 9ac:	645f0000 	ldrbvs	r0, [pc], #-0	; 9b4 <CPSR_IRQ_INHIBIT+0x934>
 9b0:	75616665 	strbvc	r6, [r1, #-1637]!	; 0xfffff99b
 9b4:	745f746c 	ldrbvc	r7, [pc], #-1132	; 9bc <CPSR_IRQ_INHIBIT+0x93c>
 9b8:	73657079 	cmnvc	r5, #121	; 0x79
 9bc:	0200682e 	andeq	r6, r0, #3014656	; 0x2e0000
 9c0:	735f0000 	cmpvc	pc, #0
 9c4:	6e696474 	mcrvs	4, 3, r6, cr9, cr4, {3}
 9c8:	00682e74 	rsbeq	r2, r8, r4, ror lr
 9cc:	72000003 	andvc	r0, r0, #3
 9d0:	622d6970 	eorvs	r6, sp, #112, 18	; 0x1c0000
 9d4:	2e657361 	cdpcs	3, 6, cr7, cr5, cr1, {3}
 9d8:	00040068 	andeq	r0, r4, r8, rrx
 9dc:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
 9e0:	7261752d 	rsbvc	r7, r1, #188743680	; 0xb400000
 9e4:	00682e74 	rsbeq	r2, r8, r4, ror lr
 9e8:	72000004 	andvc	r0, r0, #4
 9ec:	672d6970 			; <UNDEFINED> instruction: 0x672d6970
 9f0:	2e6f6970 			; <UNDEFINED> instruction: 0x2e6f6970
 9f4:	00040068 	andeq	r0, r4, r8, rrx
 9f8:	66696600 	strbtvs	r6, [r9], -r0, lsl #12
 9fc:	00682e6f 	rsbeq	r2, r8, pc, ror #28
 a00:	00000004 	andeq	r0, r0, r4
 a04:	24020500 	strcs	r0, [r2], #-1280	; 0xfffffb00
 a08:	0300008b 	movweq	r0, #139	; 0x8b
 a0c:	4b4b011a 	blmi	12c0e7c <_stack+0x1240e7c>
 a10:	a14b4ba1 	smlaltbge	r4, fp, r1, fp
 a14:	83d84c69 	bicshi	r4, r8, #26880	; 0x6900
 a18:	84838383 	strhi	r8, [r3], #899	; 0x383
 a1c:	67686786 	strbvs	r6, [r8, -r6, lsl #15]!
 a20:	03040200 	movweq	r0, #16896	; 0x4200
 a24:	02006606 	andeq	r6, r0, #6291456	; 0x600000
 a28:	06660104 	strbteq	r0, [r6], -r4, lsl #2
 a2c:	02006767 	andeq	r6, r0, #27000832	; 0x19c0000
 a30:	66060304 	strvs	r0, [r6], -r4, lsl #6
 a34:	01040200 	mrseq	r0, R12_usr
 a38:	03670666 	cmneq	r7, #106954752	; 0x6600000
 a3c:	bd836609 	stclt	6, cr6, [r3, #36]	; 0x24
 a40:	040200a0 	streq	r0, [r2], #-160	; 0xffffff60
 a44:	062e0601 	strteq	r0, [lr], -r1, lsl #12
 a48:	a1a183bd 			; <UNDEFINED> instruction: 0xa1a183bd
 a4c:	03040200 	movweq	r0, #16896	; 0x4200
 a50:	04020067 	streq	r0, [r2], #-103	; 0xffffff99
 a54:	0200b903 	andeq	fp, r0, #49152	; 0xc000
 a58:	66060104 	strvs	r0, [r6], -r4, lsl #2
 a5c:	692f8506 	stmdbvs	pc!, {r1, r2, r8, sl, pc}	; <UNPREDICTABLE>
 a60:	86b83083 	ldrthi	r3, [r8], r3, lsl #1
 a64:	859f9f6a 	ldrhi	r9, [pc, #3946]	; 19d6 <_heap_top+0x9d6>
 a68:	8385bc6b 	orrhi	fp, r5, #27392	; 0x6b00
 a6c:	bfa268d9 	svclt	0x00a268d9
 a70:	0a02d9bc 	beq	b7168 <_stack+0x37168>
 a74:	9a010100 	bls	40e7c <__bss_end__+0x37968>
 a78:	02000001 	andeq	r0, r0, #1
 a7c:	00015600 	andeq	r5, r1, r0, lsl #12
 a80:	fb010200 	blx	4128a <__bss_end__+0x37d76>
 a84:	01000d0e 	tsteq	r0, lr, lsl #26
 a88:	00010101 	andeq	r0, r1, r1, lsl #2
 a8c:	00010000 	andeq	r0, r1, r0
 a90:	682f0100 	stmdavs	pc!, {r8}	; <UNPREDICTABLE>
 a94:	2f656d6f 	svccs	0x00656d6f
 a98:	69646261 	stmdbvs	r4!, {r0, r5, r6, r9, sp, lr}^
 a9c:	6972616b 	ldmdbvs	r2!, {r0, r1, r3, r5, r6, r8, sp, lr}^
 aa0:	65642f6d 	strbvs	r2, [r4, #-3949]!	; 0xfffff093
 aa4:	794d2f76 	stmdbvc	sp, {r1, r2, r4, r5, r6, r8, r9, sl, fp, sp}^
 aa8:	7474694c 	ldrbtvc	r6, [r4], #-2380	; 0xfffff6b4
 aac:	534f656c 	movtpl	r6, #62828	; 0xf56c
 ab0:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 ab4:	73752f00 	cmnvc	r5, #0, 30
 ab8:	6e692f72 	mcrvs	15, 3, r2, cr9, cr2, {3}
 abc:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xfffff39d
 ac0:	656e2f65 	strbvs	r2, [lr, #-3941]!	; 0xfffff09b
 ac4:	62696c77 	rsbvs	r6, r9, #30464	; 0x7700
 ac8:	63616d2f 	cmnvs	r1, #3008	; 0xbc0
 acc:	656e6968 	strbvs	r6, [lr, #-2408]!	; 0xfffff698
 ad0:	73752f00 	cmnvc	r5, #0, 30
 ad4:	6e692f72 	mcrvs	15, 3, r2, cr9, cr2, {3}
 ad8:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xfffff39d
 adc:	656e2f65 	strbvs	r2, [lr, #-3941]!	; 0xfffff09b
 ae0:	62696c77 	rsbvs	r6, r9, #30464	; 0x7700
 ae4:	7379732f 	cmnvc	r9, #-1140850688	; 0xbc000000
 ae8:	73752f00 	cmnvc	r5, #0, 30
 aec:	696c2f72 	stmdbvs	ip!, {r1, r4, r5, r6, r8, r9, sl, fp, sp}^
 af0:	63672f62 	cmnvs	r7, #392	; 0x188
 af4:	72612f63 	rsbvc	r2, r1, #396	; 0x18c
 af8:	6f6e2d6d 	svcvs	0x006e2d6d
 afc:	652d656e 	strvs	r6, [sp, #-1390]!	; 0xfffffa92
 b00:	2f696261 	svccs	0x00696261
 b04:	2e332e36 	mrccs	14, 1, r2, cr3, cr6, {1}
 b08:	6e692f31 	mcrvs	15, 3, r2, cr9, cr1, {1}
 b0c:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xfffff39d
 b10:	752f0065 	strvc	r0, [pc, #-101]!	; ab3 <CPSR_IRQ_INHIBIT+0xa33>
 b14:	692f7273 	stmdbvs	pc!, {r0, r1, r4, r5, r6, r9, ip, sp, lr}	; <UNPREDICTABLE>
 b18:	756c636e 	strbvc	r6, [ip, #-878]!	; 0xfffffc92
 b1c:	6e2f6564 	cfsh64vs	mvdx6, mvdx15, #52
 b20:	696c7765 	stmdbvs	ip!, {r0, r2, r5, r6, r8, r9, sl, ip, sp, lr}^
 b24:	682f0062 	stmdavs	pc!, {r1, r5, r6}	; <UNPREDICTABLE>
 b28:	2f656d6f 	svccs	0x00656d6f
 b2c:	69646261 	stmdbvs	r4!, {r0, r5, r6, r9, sp, lr}^
 b30:	6972616b 	ldmdbvs	r2!, {r0, r1, r3, r5, r6, r8, sp, lr}^
 b34:	65642f6d 	strbvs	r2, [r4, #-3949]!	; 0xfffff093
 b38:	794d2f76 	stmdbvc	sp, {r1, r2, r4, r5, r6, r8, r9, sl, fp, sp}^
 b3c:	7474694c 	ldrbtvc	r6, [r4], #-2380	; 0xfffff6b4
 b40:	534f656c 	movtpl	r6, #62828	; 0xf56c
 b44:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 b48:	2f2e2e2f 	svccs	0x002e2e2f
 b4c:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 b50:	00656475 	rsbeq	r6, r5, r5, ror r4
 b54:	65687300 	strbvs	r7, [r8, #-768]!	; 0xfffffd00
 b58:	632e6c6c 			; <UNDEFINED> instruction: 0x632e6c6c
 b5c:	00000100 	andeq	r0, r0, r0, lsl #2
 b60:	6665645f 			; <UNDEFINED> instruction: 0x6665645f
 b64:	746c7561 	strbtvc	r7, [ip], #-1377	; 0xfffffa9f
 b68:	7079745f 	rsbsvc	r7, r9, pc, asr r4
 b6c:	682e7365 	stmdavs	lr!, {r0, r2, r5, r6, r8, r9, ip, sp, lr}
 b70:	00000200 	andeq	r0, r0, r0, lsl #4
 b74:	6b636f6c 	blvs	18dc92c <_stack+0x185c92c>
 b78:	0300682e 	movweq	r6, #2094	; 0x82e
 b7c:	745f0000 	ldrbvc	r0, [pc], #-0	; b84 <CPSR_IRQ_INHIBIT+0xb04>
 b80:	73657079 	cmnvc	r5, #121	; 0x79
 b84:	0300682e 	movweq	r6, #2094	; 0x82e
 b88:	74730000 	ldrbtvc	r0, [r3], #-0
 b8c:	66656464 	strbtvs	r6, [r5], -r4, ror #8
 b90:	0400682e 	streq	r6, [r0], #-2094	; 0xfffff7d2
 b94:	65720000 	ldrbvs	r0, [r2, #-0]!
 b98:	2e746e65 	cdpcs	14, 7, cr6, cr4, cr5, {3}
 b9c:	00030068 	andeq	r0, r3, r8, rrx
 ba0:	74735f00 	ldrbtvc	r5, [r3], #-3840	; 0xfffff100
 ba4:	746e6964 	strbtvc	r6, [lr], #-2404	; 0xfffff69c
 ba8:	0300682e 	movweq	r6, #2094	; 0x82e
 bac:	74730000 	ldrbtvc	r0, [r3], #-0
 bb0:	62696c64 	rsbvs	r6, r9, #100, 24	; 0x6400
 bb4:	0500682e 	streq	r6, [r0, #-2094]	; 0xfffff7d2
 bb8:	70720000 	rsbsvc	r0, r2, r0
 bbc:	61622d69 	cmnvs	r2, r9, ror #26
 bc0:	682e6573 	stmdavs	lr!, {r0, r1, r4, r5, r6, r8, sl, sp, lr}
 bc4:	00000600 	andeq	r0, r0, r0, lsl #12
 bc8:	2d697072 	stclcs	0, cr7, [r9, #-456]!	; 0xfffffe38
 bcc:	74726175 	ldrbtvc	r6, [r2], #-373	; 0xfffffe8b
 bd0:	0600682e 	streq	r6, [r0], -lr, lsr #16
 bd4:	00000000 	andeq	r0, r0, r0
 bd8:	8ec00205 	cdphi	2, 12, cr0, cr0, cr5, {0}
 bdc:	09030000 	stmdbeq	r3, {}	; <UNPREDICTABLE>
 be0:	4f4f6b01 	svcmi	0x004f6b01
 be4:	0200684d 	andeq	r6, r0, #5046272	; 0x4d0000
 be8:	2e060104 	adfcss	f0, f6, f4
 bec:	02040200 	andeq	r0, r4, #0, 4
 bf0:	0200a006 	andeq	sl, r0, #6
 bf4:	00a10204 	adceq	r0, r1, r4, lsl #4
 bf8:	a0020402 	andge	r0, r2, r2, lsl #8
 bfc:	02040200 	andeq	r0, r4, #0, 4
 c00:	00667703 	rsbeq	r7, r6, r3, lsl #14
 c04:	06010402 	streq	r0, [r1], -r2, lsl #8
 c08:	0c030666 	stceq	6, cr0, [r3], {102}	; 0x66
 c0c:	4a710366 	bmi	1c419ac <_stack+0x1bc19ac>
 c10:	01000602 	tsteq	r0, r2, lsl #12
 c14:	00012001 	andeq	r2, r1, r1
 c18:	eb000200 	bl	1420 <_heap_top+0x420>
 c1c:	02000000 	andeq	r0, r0, #0
 c20:	0d0efb01 	vstreq	d15, [lr, #-4]
 c24:	01010100 	mrseq	r0, (UNDEF: 17)
 c28:	00000001 	andeq	r0, r0, r1
 c2c:	01000001 	tsteq	r0, r1
 c30:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; b7c <CPSR_IRQ_INHIBIT+0xafc>
 c34:	62612f65 	rsbvs	r2, r1, #404	; 0x194
 c38:	616b6964 	cmnvs	fp, r4, ror #18
 c3c:	2f6d6972 	svccs	0x006d6972
 c40:	2f766564 	svccs	0x00766564
 c44:	694c794d 	stmdbvs	ip, {r0, r2, r3, r6, r8, fp, ip, sp, lr}^
 c48:	656c7474 	strbvs	r7, [ip, #-1140]!	; 0xfffffb8c
 c4c:	732f534f 			; <UNDEFINED> instruction: 0x732f534f
 c50:	2f006372 	svccs	0x00006372
 c54:	2f727375 	svccs	0x00727375
 c58:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 c5c:	2f656475 	svccs	0x00656475
 c60:	6c77656e 	cfldr64vs	mvdx6, [r7], #-440	; 0xfffffe48
 c64:	6d2f6269 	sfmvs	f6, 4, [pc, #-420]!	; ac8 <CPSR_IRQ_INHIBIT+0xa48>
 c68:	69686361 	stmdbvs	r8!, {r0, r5, r6, r8, r9, sp, lr}^
 c6c:	2f00656e 	svccs	0x0000656e
 c70:	2f727375 	svccs	0x00727375
 c74:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 c78:	2f656475 	svccs	0x00656475
 c7c:	6c77656e 	cfldr64vs	mvdx6, [r7], #-440	; 0xfffffe48
 c80:	732f6269 			; <UNDEFINED> instruction: 0x732f6269
 c84:	2f007379 	svccs	0x00007379
 c88:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
 c8c:	6462612f 	strbtvs	r6, [r2], #-303	; 0xfffffed1
 c90:	72616b69 	rsbvc	r6, r1, #107520	; 0x1a400
 c94:	642f6d69 	strtvs	r6, [pc], #-3433	; c9c <CPSR_IRQ_INHIBIT+0xc1c>
 c98:	4d2f7665 	stcmi	6, cr7, [pc, #-404]!	; b0c <CPSR_IRQ_INHIBIT+0xa8c>
 c9c:	74694c79 	strbtvc	r4, [r9], #-3193	; 0xfffff387
 ca0:	4f656c74 	svcmi	0x00656c74
 ca4:	72732f53 	rsbsvc	r2, r3, #332	; 0x14c
 ca8:	2e2e2f63 	cdpcs	15, 2, cr2, cr14, cr3, {3}
 cac:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 cb0:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0xfffffa94
 cb4:	76730000 	ldrbtvc	r0, [r3], -r0
 cb8:	00632e63 	rsbeq	r2, r3, r3, ror #28
 cbc:	5f000001 	svcpl	0x00000001
 cc0:	61666564 	cmnvs	r6, r4, ror #10
 cc4:	5f746c75 	svcpl	0x00746c75
 cc8:	65707974 	ldrbvs	r7, [r0, #-2420]!	; 0xfffff68c
 ccc:	00682e73 	rsbeq	r2, r8, r3, ror lr
 cd0:	5f000002 	svcpl	0x00000002
 cd4:	69647473 	stmdbvs	r4!, {r0, r1, r4, r5, r6, sl, ip, sp, lr}^
 cd8:	682e746e 	stmdavs	lr!, {r1, r2, r3, r5, r6, sl, ip, sp, lr}
 cdc:	00000300 	andeq	r0, r0, r0, lsl #6
 ce0:	2d697072 	stclcs	0, cr7, [r9, #-456]!	; 0xfffffe38
 ce4:	65736162 	ldrbvs	r6, [r3, #-354]!	; 0xfffffe9e
 ce8:	0400682e 	streq	r6, [r0], #-2094	; 0xfffff7d2
 cec:	70720000 	rsbsvc	r0, r2, r0
 cf0:	61752d69 	cmnvs	r5, r9, ror #26
 cf4:	682e7472 	stmdavs	lr!, {r1, r4, r5, r6, sl, ip, sp, lr}
 cf8:	00000400 	andeq	r0, r0, r0, lsl #8
 cfc:	636f7270 	cmnvs	pc, #112, 4
 d00:	2e737365 	cdpcs	3, 7, cr7, cr3, cr5, {3}
 d04:	00040068 	andeq	r0, r4, r8, rrx
 d08:	05000000 	streq	r0, [r0, #-0]
 d0c:	008f6802 	addeq	r6, pc, r2, lsl #16
 d10:	67a01a00 	strvs	r1, [r0, r0, lsl #20]!
 d14:	02004d67 	andeq	r4, r0, #6592	; 0x19c0
 d18:	2e060104 	adfcss	f0, f6, f4
 d1c:	1703a106 	strne	sl, [r3, -r6, lsl #2]
 d20:	2e6c0366 	cdpcs	3, 6, cr0, cr12, cr6, {3}
 d24:	674d4b68 	strbvs	r4, [sp, -r8, ror #22]
 d28:	038a4d68 	orreq	r4, sl, #104, 26	; 0x1a00
 d2c:	02002e7a 	andeq	r2, r0, #1952	; 0x7a0
 d30:	854d0104 	strbhi	r0, [sp, #-260]	; 0xfffffefc
 d34:	01000402 	tsteq	r0, r2, lsl #8
 d38:	0000d401 	andeq	sp, r0, r1, lsl #8
 d3c:	78000200 	stmdavc	r0, {r9}
 d40:	02000000 	andeq	r0, r0, #0
 d44:	0d0efb01 	vstreq	d15, [lr, #-4]
 d48:	01010100 	mrseq	r0, (UNDEF: 17)
 d4c:	00000001 	andeq	r0, r0, r1
 d50:	01000001 	tsteq	r0, r1
 d54:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; ca0 <CPSR_IRQ_INHIBIT+0xc20>
 d58:	62612f65 	rsbvs	r2, r1, #404	; 0x194
 d5c:	616b6964 	cmnvs	fp, r4, ror #18
 d60:	2f6d6972 	svccs	0x006d6972
 d64:	2f766564 	svccs	0x00766564
 d68:	694c794d 	stmdbvs	ip, {r0, r2, r3, r6, r8, fp, ip, sp, lr}^
 d6c:	656c7474 	strbvs	r7, [ip, #-1140]!	; 0xfffffb8c
 d70:	6c2f534f 	stcvs	3, cr5, [pc], #-316	; c3c <CPSR_IRQ_INHIBIT+0xbbc>
 d74:	2f006269 	svccs	0x00006269
 d78:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
 d7c:	6462612f 	strbtvs	r6, [r2], #-303	; 0xfffffed1
 d80:	72616b69 	rsbvc	r6, r1, #107520	; 0x1a400
 d84:	642f6d69 	strtvs	r6, [pc], #-3433	; d8c <CPSR_IRQ_INHIBIT+0xd0c>
 d88:	4d2f7665 	stcmi	6, cr7, [pc, #-404]!	; bfc <CPSR_IRQ_INHIBIT+0xb7c>
 d8c:	74694c79 	strbtvc	r4, [r9], #-3193	; 0xfffff387
 d90:	4f656c74 	svcmi	0x00656c74
 d94:	696c2f53 	stmdbvs	ip!, {r0, r1, r4, r6, r8, r9, sl, fp, sp}^
 d98:	2e2e2f62 	cdpcs	15, 2, cr2, cr14, cr2, {3}
 d9c:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 da0:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0xfffffa94
 da4:	69660000 	stmdbvs	r6!, {}^	; <UNPREDICTABLE>
 da8:	632e6f66 			; <UNDEFINED> instruction: 0x632e6f66
 dac:	00000100 	andeq	r0, r0, r0, lsl #2
 db0:	6f666966 	svcvs	0x00666966
 db4:	0200682e 	andeq	r6, r0, #3014656	; 0x2e0000
 db8:	00000000 	andeq	r0, r0, r0
 dbc:	90340205 	eorsls	r0, r4, r5, lsl #4
 dc0:	0a030000 	beq	c0dc8 <_stack+0x40dc8>
 dc4:	67678301 	strbvs	r8, [r7, -r1, lsl #6]!
 dc8:	4cbd8767 	ldcmi	7, cr8, [sp], #412	; 0x19c
 dcc:	9ff3bc69 	svcls	0x00f3bc69
 dd0:	008468bc 			; <UNDEFINED> instruction: 0x008468bc
 dd4:	03020402 	movweq	r0, #9218	; 0x2402
 dd8:	02004a73 	andeq	r4, r0, #471040	; 0x73000
 ddc:	66060104 	strvs	r0, [r6], -r4, lsl #2
 de0:	82110306 	andshi	r0, r1, #402653184	; 0x18000000
 de4:	4cbd872f 	ldcmi	7, cr8, [sp], #188	; 0xbc
 de8:	04020069 	streq	r0, [r2], #-105	; 0xffffff97
 dec:	00d60601 	sbcseq	r0, r6, r1, lsl #12
 df0:	d6020402 	strle	r0, [r2], -r2, lsl #8
 df4:	f34c8406 	vshl.u8	d24, d6, d12
 df8:	0200bc9f 	andeq	fp, r0, #40704	; 0x9f00
 dfc:	75030204 	strvc	r0, [r3, #-516]	; 0xfffffdfc
 e00:	04020066 	streq	r0, [r2], #-102	; 0xffffff9a
 e04:	06660601 	strbteq	r0, [r6], -r1, lsl #12
 e08:	2f821003 	svccs	0x00821003
 e0c:	01000802 	tsteq	r0, r2, lsl #16
 e10:	00005b01 	andeq	r5, r0, r1, lsl #22
 e14:	41000200 	mrsmi	r0, R8_usr
 e18:	02000000 	andeq	r0, r0, #0
 e1c:	0d0efb01 	vstreq	d15, [lr, #-4]
 e20:	01010100 	mrseq	r0, (UNDEF: 17)
 e24:	00000001 	andeq	r0, r0, r1
 e28:	01000001 	tsteq	r0, r1
 e2c:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; d78 <CPSR_IRQ_INHIBIT+0xcf8>
 e30:	62612f65 	rsbvs	r2, r1, #404	; 0x194
 e34:	616b6964 	cmnvs	fp, r4, ror #18
 e38:	2f6d6972 	svccs	0x006d6972
 e3c:	2f766564 	svccs	0x00766564
 e40:	694c794d 	stmdbvs	ip, {r0, r2, r3, r6, r8, fp, ip, sp, lr}^
 e44:	656c7474 	strbvs	r7, [ip, #-1140]!	; 0xfffffb8c
 e48:	6c2f534f 	stcvs	3, cr5, [pc], #-316	; d14 <CPSR_IRQ_INHIBIT+0xc94>
 e4c:	00006269 	andeq	r6, r0, r9, ror #4
 e50:	6e697270 	mcrvs	2, 3, r7, cr9, cr0, {3}
 e54:	00632e74 	rsbeq	r2, r3, r4, ror lr
 e58:	00000001 	andeq	r0, r0, r1
 e5c:	60020500 	andvs	r0, r2, r0, lsl #10
 e60:	17000092 			; <UNDEFINED> instruction: 0x17000092
 e64:	83852f9f 	orrhi	r2, r5, #636	; 0x27c
 e68:	0286b830 	addeq	fp, r6, #48, 16	; 0x300000
 e6c:	01010006 	tsteq	r1, r6
 e70:	00000073 	andeq	r0, r0, r3, ror r0
 e74:	00450002 	subeq	r0, r5, r2
 e78:	01020000 	mrseq	r0, (UNDEF: 2)
 e7c:	000d0efb 	strdeq	r0, [sp], -fp
 e80:	01010101 	tsteq	r1, r1, lsl #2
 e84:	01000000 	mrseq	r0, (UNDEF: 0)
 e88:	2f010000 	svccs	0x00010000
 e8c:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
 e90:	6462612f 	strbtvs	r6, [r2], #-303	; 0xfffffed1
 e94:	72616b69 	rsbvc	r6, r1, #107520	; 0x1a400
 e98:	642f6d69 	strtvs	r6, [pc], #-3433	; ea0 <CPSR_IRQ_INHIBIT+0xe20>
 e9c:	4d2f7665 	stcmi	6, cr7, [pc, #-404]!	; d10 <CPSR_IRQ_INHIBIT+0xc90>
 ea0:	74694c79 	strbtvc	r4, [r9], #-3193	; 0xfffff387
 ea4:	4f656c74 	svcmi	0x00656c74
 ea8:	72732f53 	rsbsvc	r2, r3, #332	; 0x14c
 eac:	73000063 	movwvc	r0, #99	; 0x63
 eb0:	64656863 	strbtvs	r6, [r5], #-2147	; 0xfffff79d
 eb4:	72656c75 	rsbvc	r6, r5, #29952	; 0x7500
 eb8:	0100732e 	tsteq	r0, lr, lsr #6
 ebc:	00000000 	andeq	r0, r0, r0
 ec0:	92d00205 	sbcsls	r0, r0, #1342177280	; 0x50000000
 ec4:	2f1a0000 	svccs	0x001a0000
 ec8:	2f2f2f2f 	svccs	0x002f2f2f
 ecc:	2f2f2f2f 	svccs	0x002f2f2f
 ed0:	2f312f2f 	svccs	0x00312f2f
 ed4:	2f2f2f2f 	svccs	0x002f2f2f
 ed8:	362f2f2f 	strtcc	r2, [pc], -pc, lsr #30
 edc:	2f2f2f2f 	svccs	0x002f2f2f
 ee0:	02022f2f 	andeq	r2, r2, #47, 30	; 0xbc
 ee4:	7b010100 	blvc	412ec <__bss_end__+0x37dd8>
 ee8:	02000000 	andeq	r0, r0, #0
 eec:	00004100 	andeq	r4, r0, r0, lsl #2
 ef0:	fb010200 	blx	416fa <__bss_end__+0x381e6>
 ef4:	01000d0e 	tsteq	r0, lr, lsl #26
 ef8:	00010101 	andeq	r0, r1, r1, lsl #2
 efc:	00010000 	andeq	r0, r1, r0
 f00:	682f0100 	stmdavs	pc!, {r8}	; <UNPREDICTABLE>
 f04:	2f656d6f 	svccs	0x00656d6f
 f08:	69646261 	stmdbvs	r4!, {r0, r5, r6, r9, sp, lr}^
 f0c:	6972616b 	ldmdbvs	r2!, {r0, r1, r3, r5, r6, r8, sp, lr}^
 f10:	65642f6d 	strbvs	r2, [r4, #-3949]!	; 0xfffff093
 f14:	794d2f76 	stmdbvc	sp, {r1, r2, r4, r5, r6, r8, r9, sl, fp, sp}^
 f18:	7474694c 	ldrbtvc	r6, [r4], #-2380	; 0xfffff6b4
 f1c:	534f656c 	movtpl	r6, #62828	; 0xf56c
 f20:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 f24:	74730000 	ldrbtvc	r0, [r3], #-0
 f28:	2e747261 	cdpcs	2, 7, cr7, cr4, cr1, {3}
 f2c:	00010073 	andeq	r0, r1, r3, ror r0
 f30:	05000000 	streq	r0, [r0, #-0]
 f34:	00800002 	addeq	r0, r0, r2
 f38:	011f0300 	tsteq	pc, r0, lsl #6
 f3c:	2f2f2f2f 	svccs	0x002f2f2f
 f40:	032f2f2f 			; <UNDEFINED> instruction: 0x032f2f2f
 f44:	2f20080e 	svccs	0x0020080e
 f48:	2f2f2f2f 	svccs	0x002f2f2f
 f4c:	032f2f32 			; <UNDEFINED> instruction: 0x032f2f32
 f50:	2f2f2e0c 	svccs	0x002f2e0c
 f54:	12033131 	andne	r3, r3, #1073741836	; 0x4000000c
 f58:	2f2f2f2e 	svccs	0x002f2f2e
 f5c:	2f2e0a03 	svccs	0x002e0a03
 f60:	0002022f 	andeq	r0, r2, pc, lsr #4
 f64:	00590101 	subseq	r0, r9, r1, lsl #2
 f68:	00020000 	andeq	r0, r2, r0
 f6c:	0000003f 	andeq	r0, r0, pc, lsr r0
 f70:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 f74:	0101000d 	tsteq	r1, sp
 f78:	00000101 	andeq	r0, r0, r1, lsl #2
 f7c:	00000100 	andeq	r0, r0, r0, lsl #2
 f80:	6f682f01 	svcvs	0x00682f01
 f84:	612f656d 			; <UNDEFINED> instruction: 0x612f656d
 f88:	6b696462 	blvs	1a5a118 <_stack+0x19da118>
 f8c:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
 f90:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
 f94:	4c794d2f 	ldclmi	13, cr4, [r9], #-188	; 0xffffff44
 f98:	6c747469 	cfldrdvs	mvd7, [r4], #-420	; 0xfffffe5c
 f9c:	2f534f65 	svccs	0x00534f65
 fa0:	00637273 	rsbeq	r7, r3, r3, ror r2
 fa4:	63767300 	cmnvs	r6, #0, 6
 fa8:	0100732e 	tsteq	r0, lr, lsr #6
 fac:	00000000 	andeq	r0, r0, r0
 fb0:	93400205 	movtls	r0, #517	; 0x205
 fb4:	31180000 	tstcc	r8, r0
 fb8:	3030302f 	eorscc	r3, r0, pc, lsr #32
 fbc:	02022f2f 	andeq	r2, r2, #47, 30	; 0xbc
 fc0:	Address 0x0000000000000fc0 is out of bounds.


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
  3c:	00000018 	andeq	r0, r0, r8, lsl r0
  40:	0000002c 	andeq	r0, r0, ip, lsr #32
  44:	00008100 	andeq	r8, r0, r0, lsl #2
  48:	00000014 	andeq	r0, r0, r4, lsl r0
  4c:	8b080e42 	blhi	20395c <_stack+0x18395c>
  50:	42018e02 	andmi	r8, r1, #2, 28
  54:	00040b0c 	andeq	r0, r4, ip, lsl #22
  58:	00000018 	andeq	r0, r0, r8, lsl r0
  5c:	0000002c 	andeq	r0, r0, ip, lsr #32
  60:	00008114 	andeq	r8, r0, r4, lsl r1
  64:	000000a8 	andeq	r0, r0, r8, lsr #1
  68:	8b080e42 	blhi	203978 <_stack+0x183978>
  6c:	42018e02 	andmi	r8, r1, #2, 28
  70:	00040b0c 	andeq	r0, r4, ip, lsl #22
  74:	00000018 	andeq	r0, r0, r8, lsl r0
  78:	0000002c 	andeq	r0, r0, ip, lsr #32
  7c:	000081bc 			; <UNDEFINED> instruction: 0x000081bc
  80:	00000098 	muleq	r0, r8, r0
  84:	8b080e42 	blhi	203994 <_stack+0x183994>
  88:	42018e02 	andmi	r8, r1, #2, 28
  8c:	00040b0c 	andeq	r0, r4, ip, lsl #22
  90:	0000000c 	andeq	r0, r0, ip
  94:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  98:	7c020001 	stcvc	0, cr0, [r2], {1}
  9c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  a0:	00000018 	andeq	r0, r0, r8, lsl r0
  a4:	00000090 	muleq	r0, r0, r0
  a8:	00008254 	andeq	r8, r0, r4, asr r2
  ac:	0000001c 	andeq	r0, r0, ip, lsl r0
  b0:	8b080e42 	blhi	2039c0 <_stack+0x1839c0>
  b4:	42018e02 	andmi	r8, r1, #2, 28
  b8:	00040b0c 	andeq	r0, r4, ip, lsl #22
  bc:	00000018 	andeq	r0, r0, r8, lsl r0
  c0:	00000090 	muleq	r0, r0, r0
  c4:	00008270 	andeq	r8, r0, r0, ror r2
  c8:	0000010c 	andeq	r0, r0, ip, lsl #2
  cc:	8b080e42 	blhi	2039dc <_stack+0x1839dc>
  d0:	42018e02 	andmi	r8, r1, #2, 28
  d4:	00040b0c 	andeq	r0, r4, ip, lsl #22
  d8:	0000000c 	andeq	r0, r0, ip
  dc:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  e0:	7c020001 	stcvc	0, cr0, [r2], {1}
  e4:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  e8:	0000001c 	andeq	r0, r0, ip, lsl r0
  ec:	000000d8 	ldrdeq	r0, [r0], -r8
  f0:	0000837c 	andeq	r8, r0, ip, ror r3
  f4:	0000015c 	andeq	r0, r0, ip, asr r1
  f8:	8b040e42 	blhi	103a08 <_stack+0x83a08>
  fc:	0b0d4201 	bleq	350908 <_stack+0x2d0908>
 100:	0d0d9e02 	stceq	14, cr9, [sp, #-8]
 104:	000ecb42 	andeq	ip, lr, r2, asr #22
 108:	0000000c 	andeq	r0, r0, ip
 10c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 110:	7c020001 	stcvc	0, cr0, [r2], {1}
 114:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 118:	0000001c 	andeq	r0, r0, ip, lsl r0
 11c:	00000108 	andeq	r0, r0, r8, lsl #2
 120:	000084d8 	ldrdeq	r8, [r0], -r8	; <UNPREDICTABLE>
 124:	000000a4 	andeq	r0, r0, r4, lsr #1
 128:	8b080e42 	blhi	203a38 <_stack+0x183a38>
 12c:	42018e02 	andmi	r8, r1, #2, 28
 130:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
 134:	080d0c4c 	stmdaeq	sp, {r2, r3, r6, sl, fp}
 138:	0000001c 	andeq	r0, r0, ip, lsl r0
 13c:	00000108 	andeq	r0, r0, r8, lsl #2
 140:	0000857c 	andeq	r8, r0, ip, ror r5
 144:	00000030 	andeq	r0, r0, r0, lsr r0
 148:	8b040e42 	blhi	103a58 <_stack+0x83a58>
 14c:	0b0d4201 	bleq	350958 <_stack+0x2d0958>
 150:	420d0d4e 	andmi	r0, sp, #4992	; 0x1380
 154:	00000ecb 	andeq	r0, r0, fp, asr #29
 158:	0000001c 	andeq	r0, r0, ip, lsl r0
 15c:	00000108 	andeq	r0, r0, r8, lsl #2
 160:	000085ac 	andeq	r8, r0, ip, lsr #11
 164:	00000024 	andeq	r0, r0, r4, lsr #32
 168:	8b040e42 	blhi	103a78 <_stack+0x83a78>
 16c:	0b0d4201 	bleq	350978 <_stack+0x2d0978>
 170:	420d0d48 	andmi	r0, sp, #72, 26	; 0x1200
 174:	00000ecb 	andeq	r0, r0, fp, asr #29
 178:	0000001c 	andeq	r0, r0, ip, lsl r0
 17c:	00000108 	andeq	r0, r0, r8, lsl #2
 180:	000085d0 	ldrdeq	r8, [r0], -r0
 184:	00000074 	andeq	r0, r0, r4, ror r0
 188:	8b040e42 	blhi	103a98 <_stack+0x83a98>
 18c:	0b0d4201 	bleq	350998 <_stack+0x2d0998>
 190:	420d0d70 	andmi	r0, sp, #112, 26	; 0x1c00
 194:	00000ecb 	andeq	r0, r0, fp, asr #29
 198:	0000001c 	andeq	r0, r0, ip, lsl r0
 19c:	00000108 	andeq	r0, r0, r8, lsl #2
 1a0:	00008644 	andeq	r8, r0, r4, asr #12
 1a4:	00000088 	andeq	r0, r0, r8, lsl #1
 1a8:	8b040e42 	blhi	103ab8 <_stack+0x83ab8>
 1ac:	0b0d4201 	bleq	3509b8 <_stack+0x2d09b8>
 1b0:	420d0d7a 	andmi	r0, sp, #7808	; 0x1e80
 1b4:	00000ecb 	andeq	r0, r0, fp, asr #29
 1b8:	0000000c 	andeq	r0, r0, ip
 1bc:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 1c0:	7c020001 	stcvc	0, cr0, [r2], {1}
 1c4:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 1c8:	0000001c 	andeq	r0, r0, ip, lsl r0
 1cc:	000001b8 			; <UNDEFINED> instruction: 0x000001b8
 1d0:	000086cc 	andeq	r8, r0, ip, asr #13
 1d4:	00000024 	andeq	r0, r0, r4, lsr #32
 1d8:	8b040e42 	blhi	103ae8 <_stack+0x83ae8>
 1dc:	0b0d4201 	bleq	3509e8 <_stack+0x2d09e8>
 1e0:	420d0d48 	andmi	r0, sp, #72, 26	; 0x1200
 1e4:	00000ecb 	andeq	r0, r0, fp, asr #29
 1e8:	0000001c 	andeq	r0, r0, ip, lsl r0
 1ec:	000001b8 			; <UNDEFINED> instruction: 0x000001b8
 1f0:	000086f0 	strdeq	r8, [r0], -r0
 1f4:	00000018 	andeq	r0, r0, r8, lsl r0
 1f8:	8b040e42 	blhi	103b08 <_stack+0x83b08>
 1fc:	0b0d4201 	bleq	350a08 <_stack+0x2d0a08>
 200:	420d0d44 	andmi	r0, sp, #68, 26	; 0x1100
 204:	00000ecb 	andeq	r0, r0, fp, asr #29
 208:	0000000c 	andeq	r0, r0, ip
 20c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 210:	7c020001 	stcvc	0, cr0, [r2], {1}
 214:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 218:	0000001c 	andeq	r0, r0, ip, lsl r0
 21c:	00000208 	andeq	r0, r0, r8, lsl #4
 220:	00008708 	andeq	r8, r0, r8, lsl #14
 224:	00000024 	andeq	r0, r0, r4, lsr #32
 228:	8b040e42 	blhi	103b38 <_stack+0x83b38>
 22c:	0b0d4201 	bleq	350a38 <_stack+0x2d0a38>
 230:	420d0d48 	andmi	r0, sp, #72, 26	; 0x1200
 234:	00000ecb 	andeq	r0, r0, fp, asr #29
 238:	0000001c 	andeq	r0, r0, ip, lsl r0
 23c:	00000208 	andeq	r0, r0, r8, lsl #4
 240:	0000872c 	andeq	r8, r0, ip, lsr #14
 244:	0000011c 	andeq	r0, r0, ip, lsl r1
 248:	8b040e42 	blhi	103b58 <_stack+0x83b58>
 24c:	0b0d4201 	bleq	350a58 <_stack+0x2d0a58>
 250:	0d0d8202 	sfmeq	f0, 1, [sp, #-8]
 254:	000ecb42 	andeq	ip, lr, r2, asr #22
 258:	0000001c 	andeq	r0, r0, ip, lsl r0
 25c:	00000208 	andeq	r0, r0, r8, lsl #4
 260:	00008848 	andeq	r8, r0, r8, asr #16
 264:	00000018 	andeq	r0, r0, r8, lsl r0
 268:	8b040e42 	blhi	103b78 <_stack+0x83b78>
 26c:	0b0d4201 	bleq	350a78 <_stack+0x2d0a78>
 270:	420d0d44 	andmi	r0, sp, #68, 26	; 0x1100
 274:	00000ecb 	andeq	r0, r0, fp, asr #29
 278:	0000000c 	andeq	r0, r0, ip
 27c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 280:	7c020001 	stcvc	0, cr0, [r2], {1}
 284:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 288:	0000001c 	andeq	r0, r0, ip, lsl r0
 28c:	00000278 	andeq	r0, r0, r8, ror r2
 290:	00008860 	andeq	r8, r0, r0, ror #16
 294:	00000024 	andeq	r0, r0, r4, lsr #32
 298:	8b040e42 	blhi	103ba8 <_stack+0x83ba8>
 29c:	0b0d4201 	bleq	350aa8 <_stack+0x2d0aa8>
 2a0:	420d0d48 	andmi	r0, sp, #72, 26	; 0x1200
 2a4:	00000ecb 	andeq	r0, r0, fp, asr #29
 2a8:	00000024 	andeq	r0, r0, r4, lsr #32
 2ac:	00000278 	andeq	r0, r0, r8, ror r2
 2b0:	00008884 	andeq	r8, r0, r4, lsl #17
 2b4:	00000038 	andeq	r0, r0, r8, lsr r0
 2b8:	801c0e44 	andshi	r0, ip, r4, asr #28
 2bc:	82068107 	andhi	r8, r6, #-1073741823	; 0xc0000001
 2c0:	8b048305 	blhi	120edc <_stack+0xa0edc>
 2c4:	8e028c03 	cdphi	12, 0, cr8, cr2, cr3, {0}
 2c8:	0b0c4201 	bleq	310ad4 <_stack+0x290ad4>
 2cc:	00000004 	andeq	r0, r0, r4
 2d0:	00000024 	andeq	r0, r0, r4, lsr #32
 2d4:	00000278 	andeq	r0, r0, r8, ror r2
 2d8:	000088bc 			; <UNDEFINED> instruction: 0x000088bc
 2dc:	00000034 	andeq	r0, r0, r4, lsr r0
 2e0:	801c0e42 	andshi	r0, ip, r2, asr #28
 2e4:	82068107 	andhi	r8, r6, #-1073741823	; 0xc0000001
 2e8:	8b048305 	blhi	120f04 <_stack+0xa0f04>
 2ec:	8e028c03 	cdphi	12, 0, cr8, cr2, cr3, {0}
 2f0:	0b0c4201 	bleq	310afc <_stack+0x290afc>
 2f4:	00000004 	andeq	r0, r0, r4
 2f8:	00000024 	andeq	r0, r0, r4, lsr #32
 2fc:	00000278 	andeq	r0, r0, r8, ror r2
 300:	000088f0 	strdeq	r8, [r0], -r0
 304:	00000034 	andeq	r0, r0, r4, lsr r0
 308:	801c0e42 	andshi	r0, ip, r2, asr #28
 30c:	82068107 	andhi	r8, r6, #-1073741823	; 0xc0000001
 310:	8b048305 	blhi	120f2c <_stack+0xa0f2c>
 314:	8e028c03 	cdphi	12, 0, cr8, cr2, cr3, {0}
 318:	0b0c4201 	bleq	310b24 <_stack+0x290b24>
 31c:	00000004 	andeq	r0, r0, r4
 320:	00000024 	andeq	r0, r0, r4, lsr #32
 324:	00000278 	andeq	r0, r0, r8, ror r2
 328:	00008924 	andeq	r8, r0, r4, lsr #18
 32c:	00000038 	andeq	r0, r0, r8, lsr r0
 330:	801c0e44 	andshi	r0, ip, r4, asr #28
 334:	82068107 	andhi	r8, r6, #-1073741823	; 0xc0000001
 338:	8b048305 	blhi	120f54 <_stack+0xa0f54>
 33c:	8e028c03 	cdphi	12, 0, cr8, cr2, cr3, {0}
 340:	0b0c4201 	bleq	310b4c <_stack+0x290b4c>
 344:	00000004 	andeq	r0, r0, r4
 348:	00000024 	andeq	r0, r0, r4, lsr #32
 34c:	00000278 	andeq	r0, r0, r8, ror r2
 350:	0000895c 	andeq	r8, r0, ip, asr r9
 354:	00000038 	andeq	r0, r0, r8, lsr r0
 358:	801c0e44 	andshi	r0, ip, r4, asr #28
 35c:	82068107 	andhi	r8, r6, #-1073741823	; 0xc0000001
 360:	8b048305 	blhi	120f7c <_stack+0xa0f7c>
 364:	8e028c03 	cdphi	12, 0, cr8, cr2, cr3, {0}
 368:	0b0c4201 	bleq	310b74 <_stack+0x290b74>
 36c:	00000004 	andeq	r0, r0, r4
 370:	00000028 	andeq	r0, r0, r8, lsr #32
 374:	00000278 	andeq	r0, r0, r8, ror r2
 378:	00008994 	muleq	r0, r4, r9
 37c:	00000104 	andeq	r0, r0, r4, lsl #2
 380:	80200e44 	eorhi	r0, r0, r4, asr #28
 384:	82078108 	andhi	r8, r7, #8, 2
 388:	84058306 	strhi	r8, [r5], #-774	; 0xfffffcfa
 38c:	8c038b04 			; <UNDEFINED> instruction: 0x8c038b04
 390:	42018e02 	andmi	r8, r1, #2, 28
 394:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
 398:	200d0c74 	andcs	r0, sp, r4, ror ip
 39c:	00000014 	andeq	r0, r0, r4, lsl r0
 3a0:	00000278 	andeq	r0, r0, r8, ror r2
 3a4:	00008a98 	muleq	r0, r8, sl
 3a8:	00000010 	andeq	r0, r0, r0, lsl r0
 3ac:	040b0c42 	streq	r0, [fp], #-3138	; 0xfffff3be
 3b0:	000d0c44 	andeq	r0, sp, r4, asr #24
 3b4:	0000000c 	andeq	r0, r0, ip
 3b8:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 3bc:	7c020001 	stcvc	0, cr0, [r2], {1}
 3c0:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 3c4:	0000001c 	andeq	r0, r0, ip, lsl r0
 3c8:	000003b4 			; <UNDEFINED> instruction: 0x000003b4
 3cc:	00008aa8 	andeq	r8, r0, r8, lsr #21
 3d0:	00000024 	andeq	r0, r0, r4, lsr #32
 3d4:	8b040e42 	blhi	103ce4 <_stack+0x83ce4>
 3d8:	0b0d4201 	bleq	350be4 <_stack+0x2d0be4>
 3dc:	420d0d48 	andmi	r0, sp, #72, 26	; 0x1200
 3e0:	00000ecb 	andeq	r0, r0, fp, asr #29
 3e4:	0000001c 	andeq	r0, r0, ip, lsl r0
 3e8:	000003b4 			; <UNDEFINED> instruction: 0x000003b4
 3ec:	00008acc 	andeq	r8, r0, ip, asr #21
 3f0:	00000058 	andeq	r0, r0, r8, asr r0
 3f4:	8b040e42 	blhi	103d04 <_stack+0x83d04>
 3f8:	0b0d4201 	bleq	350c04 <_stack+0x2d0c04>
 3fc:	420d0d62 	andmi	r0, sp, #6272	; 0x1880
 400:	00000ecb 	andeq	r0, r0, fp, asr #29
 404:	0000000c 	andeq	r0, r0, ip
 408:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 40c:	7c020001 	stcvc	0, cr0, [r2], {1}
 410:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 414:	0000001c 	andeq	r0, r0, ip, lsl r0
 418:	00000404 	andeq	r0, r0, r4, lsl #8
 41c:	00008b24 	andeq	r8, r0, r4, lsr #22
 420:	00000024 	andeq	r0, r0, r4, lsr #32
 424:	8b040e42 	blhi	103d34 <_stack+0x83d34>
 428:	0b0d4201 	bleq	350c34 <_stack+0x2d0c34>
 42c:	420d0d48 	andmi	r0, sp, #72, 26	; 0x1200
 430:	00000ecb 	andeq	r0, r0, fp, asr #29
 434:	0000001c 	andeq	r0, r0, ip, lsl r0
 438:	00000404 	andeq	r0, r0, r4, lsl #8
 43c:	00008b48 	andeq	r8, r0, r8, asr #22
 440:	00000024 	andeq	r0, r0, r4, lsr #32
 444:	8b040e42 	blhi	103d54 <_stack+0x83d54>
 448:	0b0d4201 	bleq	350c54 <_stack+0x2d0c54>
 44c:	420d0d48 	andmi	r0, sp, #72, 26	; 0x1200
 450:	00000ecb 	andeq	r0, r0, fp, asr #29
 454:	0000001c 	andeq	r0, r0, ip, lsl r0
 458:	00000404 	andeq	r0, r0, r4, lsl #8
 45c:	00008b6c 	andeq	r8, r0, ip, ror #22
 460:	0000013c 	andeq	r0, r0, ip, lsr r1
 464:	8b080e42 	blhi	203d74 <_stack+0x183d74>
 468:	42018e02 	andmi	r8, r1, #2, 28
 46c:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
 470:	080d0c92 	stmdaeq	sp, {r1, r4, r7, sl, fp}
 474:	0000001c 	andeq	r0, r0, ip, lsl r0
 478:	00000404 	andeq	r0, r0, r4, lsl #8
 47c:	00008ca8 	andeq	r8, r0, r8, lsr #25
 480:	00000054 	andeq	r0, r0, r4, asr r0
 484:	8b040e42 	blhi	103d94 <_stack+0x83d94>
 488:	0b0d4201 	bleq	350c94 <_stack+0x2d0c94>
 48c:	420d0d60 	andmi	r0, sp, #96, 26	; 0x1800
 490:	00000ecb 	andeq	r0, r0, fp, asr #29
 494:	0000001c 	andeq	r0, r0, ip, lsl r0
 498:	00000404 	andeq	r0, r0, r4, lsl #8
 49c:	00008cfc 	strdeq	r8, [r0], -ip
 4a0:	00000064 	andeq	r0, r0, r4, rrx
 4a4:	8b080e42 	blhi	203db4 <_stack+0x183db4>
 4a8:	42018e02 	andmi	r8, r1, #2, 28
 4ac:	6c040b0c 			; <UNDEFINED> instruction: 0x6c040b0c
 4b0:	00080d0c 	andeq	r0, r8, ip, lsl #26
 4b4:	0000001c 	andeq	r0, r0, ip, lsl r0
 4b8:	00000404 	andeq	r0, r0, r4, lsl #8
 4bc:	00008d60 	andeq	r8, r0, r0, ror #26
 4c0:	00000048 	andeq	r0, r0, r8, asr #32
 4c4:	8b080e42 	blhi	203dd4 <_stack+0x183dd4>
 4c8:	42018e02 	andmi	r8, r1, #2, 28
 4cc:	5e040b0c 	vmlapl.f64	d0, d4, d12
 4d0:	00080d0c 	andeq	r0, r8, ip, lsl #26
 4d4:	0000001c 	andeq	r0, r0, ip, lsl r0
 4d8:	00000404 	andeq	r0, r0, r4, lsl #8
 4dc:	00008da8 	andeq	r8, r0, r8, lsr #27
 4e0:	00000038 	andeq	r0, r0, r8, lsr r0
 4e4:	8b080e42 	blhi	203df4 <_stack+0x183df4>
 4e8:	42018e02 	andmi	r8, r1, #2, 28
 4ec:	54040b0c 	strpl	r0, [r4], #-2828	; 0xfffff4f4
 4f0:	00080d0c 	andeq	r0, r8, ip, lsl #26
 4f4:	0000001c 	andeq	r0, r0, ip, lsl r0
 4f8:	00000404 	andeq	r0, r0, r4, lsl #8
 4fc:	00008de0 	andeq	r8, r0, r0, ror #27
 500:	000000e0 	andeq	r0, r0, r0, ror #1
 504:	8b080e42 	blhi	203e14 <_stack+0x183e14>
 508:	42018e02 	andmi	r8, r1, #2, 28
 50c:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
 510:	080d0c66 	stmdaeq	sp, {r1, r2, r5, r6, sl, fp}
 514:	0000000c 	andeq	r0, r0, ip
 518:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 51c:	7c020001 	stcvc	0, cr0, [r2], {1}
 520:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 524:	00000018 	andeq	r0, r0, r8, lsl r0
 528:	00000514 	andeq	r0, r0, r4, lsl r5
 52c:	00008ec0 	andeq	r8, r0, r0, asr #29
 530:	000000a8 	andeq	r0, r0, r8, lsr #1
 534:	8b080e42 	blhi	203e44 <_stack+0x183e44>
 538:	42018e02 	andmi	r8, r1, #2, 28
 53c:	00040b0c 	andeq	r0, r4, ip, lsl #22
 540:	0000000c 	andeq	r0, r0, ip
 544:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 548:	7c020001 	stcvc	0, cr0, [r2], {1}
 54c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 550:	0000001c 	andeq	r0, r0, ip, lsl r0
 554:	00000540 	andeq	r0, r0, r0, asr #10
 558:	00008f68 	andeq	r8, r0, r8, ror #30
 55c:	000000cc 	andeq	r0, r0, ip, asr #1
 560:	8b080e42 	blhi	203e70 <_stack+0x183e70>
 564:	42018e02 	andmi	r8, r1, #2, 28
 568:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
 56c:	080d0c60 	stmdaeq	sp, {r5, r6, sl, fp}
 570:	0000000c 	andeq	r0, r0, ip
 574:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 578:	7c020001 	stcvc	0, cr0, [r2], {1}
 57c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 580:	0000001c 	andeq	r0, r0, ip, lsl r0
 584:	00000570 	andeq	r0, r0, r0, ror r5
 588:	00009034 	andeq	r9, r0, r4, lsr r0
 58c:	00000044 	andeq	r0, r0, r4, asr #32
 590:	8b040e42 	blhi	103ea0 <_stack+0x83ea0>
 594:	0b0d4201 	bleq	350da0 <_stack+0x2d0da0>
 598:	420d0d5a 	andmi	r0, sp, #5760	; 0x1680
 59c:	00000ecb 	andeq	r0, r0, fp, asr #29
 5a0:	0000001c 	andeq	r0, r0, ip, lsl r0
 5a4:	00000570 	andeq	r0, r0, r0, ror r5
 5a8:	00009078 	andeq	r9, r0, r8, ror r0
 5ac:	000000e4 	andeq	r0, r0, r4, ror #1
 5b0:	8b040e42 	blhi	103ec0 <_stack+0x83ec0>
 5b4:	0b0d4201 	bleq	350dc0 <_stack+0x2d0dc0>
 5b8:	0d0d6a02 	vstreq	s12, [sp, #-8]
 5bc:	000ecb42 	andeq	ip, lr, r2, asr #22
 5c0:	0000001c 	andeq	r0, r0, ip, lsl r0
 5c4:	00000570 	andeq	r0, r0, r0, ror r5
 5c8:	0000915c 	andeq	r9, r0, ip, asr r1
 5cc:	00000104 	andeq	r0, r0, r4, lsl #2
 5d0:	8b040e42 	blhi	103ee0 <_stack+0x83ee0>
 5d4:	0b0d4201 	bleq	350de0 <_stack+0x2d0de0>
 5d8:	0d0d7a02 	vstreq	s14, [sp, #-8]
 5dc:	000ecb42 	andeq	ip, lr, r2, asr #22
 5e0:	0000000c 	andeq	r0, r0, ip
 5e4:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 5e8:	7c020001 	stcvc	0, cr0, [r2], {1}
 5ec:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 5f0:	0000001c 	andeq	r0, r0, ip, lsl r0
 5f4:	000005e0 	andeq	r0, r0, r0, ror #11
 5f8:	00009260 	andeq	r9, r0, r0, ror #4
 5fc:	00000028 	andeq	r0, r0, r8, lsr #32
 600:	8b040e42 	blhi	103f10 <_stack+0x83f10>
 604:	0b0d4201 	bleq	350e10 <_stack+0x2d0e10>
 608:	420d0d4c 	andmi	r0, sp, #76, 26	; 0x1300
 60c:	00000ecb 	andeq	r0, r0, fp, asr #29
 610:	0000001c 	andeq	r0, r0, ip, lsl r0
 614:	000005e0 	andeq	r0, r0, r0, ror #11
 618:	00009288 	andeq	r9, r0, r8, lsl #5
 61c:	00000048 	andeq	r0, r0, r8, asr #32
 620:	8b080e42 	blhi	203f30 <_stack+0x183f30>
 624:	42018e02 	andmi	r8, r1, #2, 28
 628:	5e040b0c 	vmlapl.f64	d0, d4, d12
 62c:	00080d0c 	andeq	r0, r8, ip, lsl #26

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
      b4:	7564005f 	strbvc	r0, [r4, #-95]!	; 0xffffffa1
      b8:	5f796d6d 	svcpl	0x00796d6d
      bc:	636f7270 	cmnvs	pc, #112, 4
      c0:	5f737365 	svcpl	0x00737365
      c4:	00656e6f 	rsbeq	r6, r5, pc, ror #28
      c8:	6d6d7564 	cfstr64vs	mvdx7, [sp, #-400]!	; 0xfffffe70
      cc:	72705f79 	rsbsvc	r5, r0, #484	; 0x1e4
      d0:	7365636f 	cmnvc	r5, #-1140850687	; 0xbc000001
      d4:	77745f73 			; <UNDEFINED> instruction: 0x77745f73
      d8:	7473006f 	ldrbtvc	r0, [r3], #-111	; 0xffffff91
      dc:	656e4f72 	strbvs	r4, [lr, #-3954]!	; 0xfffff08e
      e0:	72747300 	rsbsvc	r7, r4, #0, 6
      e4:	65726854 	ldrbvs	r6, [r2, #-2132]!	; 0xfffff7ac
      e8:	6e750065 	cdpvs	0, 7, cr0, cr5, cr5, {3}
      ec:	6e676973 			; <UNDEFINED> instruction: 0x6e676973
      f0:	63206465 			; <UNDEFINED> instruction: 0x63206465
      f4:	00726168 	rsbseq	r6, r2, r8, ror #2
      f8:	726f6873 	rsbvc	r6, pc, #7536640	; 0x730000
      fc:	6e752074 	mrcvs	0, 3, r2, cr5, cr4, {3}
     100:	6e676973 			; <UNDEFINED> instruction: 0x6e676973
     104:	69206465 	stmdbvs	r0!, {r0, r2, r5, r6, sl, sp, lr}
     108:	6400746e 	strvs	r7, [r0], #-1134	; 0xfffffb92
     10c:	796d6d75 	stmdbvc	sp!, {r0, r2, r4, r5, r6, r8, sl, fp, sp, lr}^
     110:	7300615f 	movwvc	r6, #351	; 0x15f
     114:	6e697274 	mcrvs	2, 3, r7, cr9, cr4, {3}
     118:	72685467 	rsbvc	r5, r8, #1728053248	; 0x67000000
     11c:	73006565 	movwvc	r6, #1381	; 0x565
     120:	6e697274 	mcrvs	2, 3, r7, cr9, cr4, {3}
     124:	656e4f67 	strbvs	r4, [lr, #-3943]!	; 0xfffff099
     128:	6e6f6c00 	cdpvs	12, 6, cr6, cr15, cr0, {0}
     12c:	6f6c2067 	svcvs	0x006c2067
     130:	7520676e 	strvc	r6, [r0, #-1902]!	; 0xfffff892
     134:	6769736e 	strbvs	r7, [r9, -lr, ror #6]!
     138:	2064656e 	rsbcs	r6, r4, lr, ror #10
     13c:	00746e69 	rsbseq	r6, r4, r9, ror #28
     140:	657a6973 	ldrbvs	r6, [sl, #-2419]!	; 0xfffff68d
     144:	65707974 	ldrbvs	r7, [r0, #-2420]!	; 0xfffff68c
     148:	6e6f6c00 	cdpvs	12, 6, cr6, cr15, cr0, {0}
     14c:	6f6c2067 	svcvs	0x006c2067
     150:	6920676e 	stmdbvs	r0!, {r1, r2, r3, r5, r6, r8, r9, sl, sp, lr}
     154:	7300746e 	movwvc	r7, #1134	; 0x46e
     158:	77547274 			; <UNDEFINED> instruction: 0x77547274
     15c:	6873006f 	ldmdavs	r3!, {r0, r1, r2, r3, r5, r6}^
     160:	2074726f 	rsbscs	r7, r4, pc, ror #4
     164:	00746e69 	rsbseq	r6, r4, r9, ror #28
     168:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; b4 <CPSR_IRQ_INHIBIT+0x34>
     16c:	62612f65 	rsbvs	r2, r1, #404	; 0x194
     170:	616b6964 	cmnvs	fp, r4, ror #18
     174:	2f6d6972 	svccs	0x006d6972
     178:	2f766564 	svccs	0x00766564
     17c:	694c794d 	stmdbvs	ip, {r0, r2, r3, r6, r8, fp, ip, sp, lr}^
     180:	656c7474 	strbvs	r7, [ip, #-1140]!	; 0xfffffb8c
     184:	732f534f 			; <UNDEFINED> instruction: 0x732f534f
     188:	642f6372 	strtvs	r6, [pc], #-882	; 190 <CPSR_IRQ_INHIBIT+0x110>
     18c:	796d6d75 	stmdbvc	sp!, {r0, r2, r4, r5, r6, r8, sl, fp, sp, lr}^
     190:	7300632e 	movwvc	r6, #814	; 0x32e
     194:	6e697274 	mcrvs	2, 3, r7, cr9, cr4, {3}
     198:	6f775467 	svcvs	0x00775467
     19c:	73656d00 	cmnvc	r5, #0, 26
     1a0:	65676173 	strbvs	r6, [r7, #-371]!	; 0xfffffe8d
     1a4:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
     1a8:	6765725f 			; <UNDEFINED> instruction: 0x6765725f
     1ac:	5f77725f 	svcpl	0x0077725f
     1b0:	74610074 	strbtvc	r0, [r1], #-116	; 0xffffff8c
     1b4:	00736761 	rsbseq	r6, r3, r1, ror #14
     1b8:	5077656e 	rsbspl	r6, r7, lr, ror #10
     1bc:	00636f72 	rsbeq	r6, r3, r2, ror pc
     1c0:	69755f5f 	ldmdbvs	r5!, {r0, r1, r2, r3, r4, r6, r8, r9, sl, fp, ip, lr}^
     1c4:	3233746e 	eorscc	r7, r3, #1845493760	; 0x6e000000
     1c8:	2f00745f 	svccs	0x0000745f
     1cc:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
     1d0:	6462612f 	strbtvs	r6, [r2], #-303	; 0xfffffed1
     1d4:	72616b69 	rsbvc	r6, r1, #107520	; 0x1a400
     1d8:	642f6d69 	strtvs	r6, [pc], #-3433	; 1e0 <CPSR_IRQ_INHIBIT+0x160>
     1dc:	4d2f7665 	stcmi	6, cr7, [pc, #-404]!	; 50 <CPSR_FIQ_INHIBIT+0x10>
     1e0:	74694c79 	strbtvc	r4, [r9], #-3193	; 0xfffff387
     1e4:	4f656c74 	svcmi	0x00656c74
     1e8:	72732f53 	rsbsvc	r2, r3, #332	; 0x14c
     1ec:	656b2f63 	strbvs	r2, [fp, #-3939]!	; 0xfffff09d
     1f0:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
     1f4:	6500632e 	strvs	r6, [r0, #-814]	; 0xfffffcd2
     1f8:	70656378 	rsbvc	r6, r5, r8, ror r3
     1fc:	6e6f6974 			; <UNDEFINED> instruction: 0x6e6f6974
     200:	6f727000 	svcvs	0x00727000
     204:	73736563 	cmnvc	r3, #415236096	; 0x18c00000
     208:	67657200 	strbvs	r7, [r5, -r0, lsl #4]!
     20c:	65720073 	ldrbvs	r0, [r2, #-115]!	; 0xffffff8d
     210:	74736967 	ldrbtvc	r6, [r3], #-2407	; 0xfffff699
     214:	00737265 	rsbseq	r7, r3, r5, ror #4
     218:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
     21c:	6d5f6c65 	ldclvs	12, cr6, [pc, #-404]	; 90 <CPSR_IRQ_INHIBIT+0x10>
     220:	006e6961 	rsbeq	r6, lr, r1, ror #18
     224:	6e756f72 	mrcvs	15, 3, r6, cr5, cr2, {3}
     228:	5f646564 	svcpl	0x00646564
     22c:	636f6c62 	cmnvs	pc, #25088	; 0x6200
     230:	69735f6b 	ldmdbvs	r3!, {r0, r1, r3, r5, r6, r8, r9, sl, fp, ip, lr}^
     234:	7300657a 	movwvc	r6, #1402	; 0x57a
     238:	5f657a69 	svcpl	0x00657a69
     23c:	5f730074 	svcpl	0x00730074
     240:	636f6c62 	cmnvs	pc, #25088	; 0x6200
     244:	75625f6b 	strbvc	r5, [r2, #-3947]!	; 0xfffff095
     248:	74656b63 	strbtvc	r6, [r5], #-2915	; 0xfffff49d
     24c:	78656e00 	stmdavc	r5!, {r9, sl, fp, sp, lr}^
     250:	6c625f74 	stclvs	15, cr5, [r2], #-464	; 0xfffffe30
     254:	006b636f 	rsbeq	r6, fp, pc, ror #6
     258:	65657266 	strbvs	r7, [r5, #-614]!	; 0xfffffd9a
     25c:	6165685f 	cmnvs	r5, pc, asr r8
     260:	00726564 	rsbseq	r6, r2, r4, ror #10
     264:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; 1b0 <CPSR_IRQ_INHIBIT+0x130>
     268:	62612f65 	rsbvs	r2, r1, #404	; 0x194
     26c:	616b6964 	cmnvs	fp, r4, ror #18
     270:	2f6d6972 	svccs	0x006d6972
     274:	2f766564 	svccs	0x00766564
     278:	694c794d 	stmdbvs	ip, {r0, r2, r3, r6, r8, fp, ip, sp, lr}^
     27c:	656c7474 	strbvs	r7, [ip, #-1140]!	; 0xfffffb8c
     280:	732f534f 			; <UNDEFINED> instruction: 0x732f534f
     284:	6d2f6372 	stcvs	3, cr6, [pc, #-456]!	; c4 <CPSR_IRQ_INHIBIT+0x44>
     288:	6f6c6c61 	svcvs	0x006c6c61
     28c:	00632e63 	rsbeq	r2, r3, r3, ror #28
     290:	636f6c62 	cmnvs	pc, #25088	; 0x6200
     294:	65685f6b 	strbvs	r5, [r8, #-3947]!	; 0xfffff095
     298:	72656461 	rsbvc	r6, r5, #1627389952	; 0x61000000
     29c:	6f6c6200 	svcvs	0x006c6200
     2a0:	6c5f6b63 	mrrcvs	11, 6, r6, pc, cr3	; <UNPREDICTABLE>
     2a4:	74696d69 	strbtvc	r6, [r9], #-3433	; 0xfffff297
     2a8:	65685f00 	strbvs	r5, [r8, #-3840]!	; 0xfffff100
     2ac:	6c5f7061 	mrrcvs	0, 6, r7, pc, cr1	; <UNPREDICTABLE>
     2b0:	6d00776f 	stcvs	7, cr7, [r0, #-444]	; 0xfffffe44
     2b4:	63696761 	cmnvs	r9, #25427968	; 0x1840000
     2b8:	72756300 	rsbsvc	r6, r5, #0, 6
     2bc:	746e6572 	strbtvc	r6, [lr], #-1394	; 0xfffffa8e
     2c0:	6e75725f 	mrcvs	2, 3, r7, cr5, cr15, {2}
     2c4:	676e696e 	strbvs	r6, [lr, -lr, ror #18]!
     2c8:	6f72705f 	svcvs	0x0072705f
     2cc:	682f0063 	stmdavs	pc!, {r0, r1, r5, r6}	; <UNPREDICTABLE>
     2d0:	2f656d6f 	svccs	0x00656d6f
     2d4:	69646261 	stmdbvs	r4!, {r0, r5, r6, r9, sp, lr}^
     2d8:	6972616b 	ldmdbvs	r2!, {r0, r1, r3, r5, r6, r8, sp, lr}^
     2dc:	65642f6d 	strbvs	r2, [r4, #-3949]!	; 0xfffff093
     2e0:	794d2f76 	stmdbvc	sp, {r1, r2, r4, r5, r6, r8, r9, sl, fp, sp}^
     2e4:	7474694c 	ldrbtvc	r6, [r4], #-2380	; 0xfffff6b4
     2e8:	534f656c 	movtpl	r6, #62828	; 0xf56c
     2ec:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
     2f0:	6f72702f 	svcvs	0x0072702f
     2f4:	73736563 	cmnvc	r3, #415236096	; 0x18c00000
     2f8:	6700632e 	strvs	r6, [r0, -lr, lsr #6]
     2fc:	76417465 	strbvc	r7, [r1], -r5, ror #8
     300:	616c6961 	cmnvs	ip, r1, ror #18
     304:	50656c62 	rsbpl	r6, r5, r2, ror #24
     308:	67004243 	strvs	r4, [r0, -r3, asr #4]
     30c:	75527465 	ldrbvc	r7, [r2, #-1125]	; 0xfffffb9b
     310:	6e696e6e 	cdpvs	14, 6, cr6, cr9, cr14, {3}
     314:	6f725067 	svcvs	0x00725067
     318:	73736563 	cmnvc	r3, #415236096	; 0x18c00000
     31c:	6f727000 	svcvs	0x00727000
     320:	72745063 	rsbsvc	r5, r4, #99	; 0x63
     324:	65726300 	ldrbvs	r6, [r2, #-768]!	; 0xfffffd00
     328:	50657461 	rsbpl	r7, r5, r1, ror #8
     32c:	65636f72 	strbvs	r6, [r3, #-3954]!	; 0xfffff08e
     330:	70007373 	andvc	r7, r0, r3, ror r3
     334:	74506263 	ldrbvc	r6, [r0], #-611	; 0xfffffd9d
     338:	65670072 	strbvs	r0, [r7, #-114]!	; 0xffffff8e
     33c:	78654e74 	stmdavc	r5!, {r2, r4, r5, r6, r9, sl, fp, lr}^
     340:	6f725074 	svcvs	0x00725074
     344:	73736563 	cmnvc	r3, #415236096	; 0x18c00000
     348:	74657300 	strbtvc	r7, [r5], #-768	; 0xfffffd00
     34c:	6e6e7552 	mcrvs	5, 3, r7, cr14, cr2, {2}
     350:	50676e69 	rsbpl	r6, r7, r9, ror #28
     354:	65636f72 	strbvs	r6, [r3, #-3954]!	; 0xfffff08e
     358:	4c007373 	stcmi	3, cr7, [r0], {115}	; 0x73
     35c:	0064616f 	rsbeq	r6, r4, pc, ror #2
     360:	6f6c6552 	svcvs	0x006c6552
     364:	52006461 	andpl	r6, r0, #1627389952	; 0x61000000
     368:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     36c:	72417465 	subvc	r7, r1, #1694498816	; 0x65000000
     370:	6d69546d 	cfstrdvs	mvd5, [r9, #-436]!	; 0xfffffe4c
     374:	2f007265 	svccs	0x00007265
     378:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
     37c:	6462612f 	strbtvs	r6, [r2], #-303	; 0xfffffed1
     380:	72616b69 	rsbvc	r6, r1, #107520	; 0x1a400
     384:	642f6d69 	strtvs	r6, [pc], #-3433	; 38c <CPSR_IRQ_INHIBIT+0x30c>
     388:	4d2f7665 	stcmi	6, cr7, [pc, #-404]!	; 1fc <CPSR_IRQ_INHIBIT+0x17c>
     38c:	74694c79 	strbtvc	r4, [r9], #-3193	; 0xfffff387
     390:	4f656c74 	svcmi	0x00656c74
     394:	72732f53 	rsbsvc	r2, r3, #332	; 0x14c
     398:	70722f63 	rsbsvc	r2, r2, r3, ror #30
     39c:	72612d69 	rsbvc	r2, r1, #6720	; 0x1a40
     3a0:	6d69746d 	cfstrdvs	mvd7, [r9, #-436]!	; 0xfffffe4c
     3a4:	632e7265 			; <UNDEFINED> instruction: 0x632e7265
     3a8:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
     3ac:	6d72615f 	ldfvse	f6, [r2, #-380]!	; 0xfffffe84
     3b0:	6d69745f 	cfstrdvs	mvd7, [r9, #-380]!	; 0xfffffe84
     3b4:	745f7265 	ldrbvc	r7, [pc], #-613	; 3bc <CPSR_IRQ_INHIBIT+0x33c>
     3b8:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
     3bc:	546d7241 	strbtpl	r7, [sp], #-577	; 0xfffffdbf
     3c0:	72656d69 	rsbvc	r6, r5, #6720	; 0x1a40
     3c4:	57415200 	strbpl	r5, [r1, -r0, lsl #4]
     3c8:	00515249 	subseq	r5, r1, r9, asr #4
     3cc:	6b73614d 	blvs	1cd8908 <_stack+0x1c58908>
     3d0:	52496465 	subpl	r6, r9, #1694498816	; 0x65000000
     3d4:	61560051 	cmpvs	r6, r1, asr r0
     3d8:	0065756c 	rsbeq	r7, r5, ip, ror #10
     3dc:	44657250 	strbtmi	r7, [r5], #-592	; 0xfffffdb0
     3e0:	64697669 	strbtvs	r7, [r9], #-1641	; 0xfffff997
     3e4:	46007265 	strmi	r7, [r0], -r5, ror #4
     3e8:	52656572 	rsbpl	r6, r5, #478150656	; 0x1c800000
     3ec:	696e6e75 	stmdbvs	lr!, {r0, r2, r4, r5, r6, r9, sl, fp, sp, lr}^
     3f0:	6f43676e 	svcvs	0x0043676e
     3f4:	65746e75 	ldrbvs	r6, [r4, #-3701]!	; 0xfffff18b
     3f8:	6f430072 	svcvs	0x00430072
     3fc:	6f72746e 	svcvs	0x0072746e
     400:	5052006c 	subspl	r0, r2, ip, rrx
     404:	72415f49 	subvc	r5, r1, #292	; 0x124
     408:	6d69546d 	cfstrdvs	mvd5, [r9, #-436]!	; 0xfffffe4c
     40c:	6e497265 	cdpvs	2, 4, cr7, cr9, cr5, {3}
     410:	49007469 	stmdbmi	r0, {r0, r3, r5, r6, sl, ip, sp, lr}
     414:	6c435152 	stfvse	f5, [r3], {82}	; 0x52
     418:	00726165 	rsbseq	r6, r2, r5, ror #2
     41c:	45535047 	ldrbmi	r5, [r3, #-71]	; 0xffffffb9
     420:	47003054 	smlsdmi	r0, r4, r0, r3
     424:	54455350 	strbpl	r5, [r5], #-848	; 0xfffffcb0
     428:	50470031 	subpl	r0, r7, r1, lsr r0
     42c:	4c455346 	mcrrmi	3, 4, r5, r5, cr6
     430:	50470030 	subpl	r0, r7, r0, lsr r0
     434:	4c455346 	mcrrmi	3, 4, r5, r5, cr6
     438:	50470031 	subpl	r0, r7, r1, lsr r0
     43c:	4c455346 	mcrrmi	3, 4, r5, r5, cr6
     440:	50470032 	subpl	r0, r7, r2, lsr r0
     444:	4c455346 	mcrrmi	3, 4, r5, r5, cr6
     448:	50470033 	subpl	r0, r7, r3, lsr r0
     44c:	4c455346 	mcrrmi	3, 4, r5, r5, cr6
     450:	50470034 	subpl	r0, r7, r4, lsr r0
     454:	4c455346 	mcrrmi	3, 4, r5, r5, cr6
     458:	50470035 	subpl	r0, r7, r5, lsr r0
     45c:	314e4546 	cmpcc	lr, r6, asr #10
     460:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
     464:	6f697047 	svcvs	0x00697047
     468:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     46c:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     470:	0030344f 	eorseq	r3, r0, pc, asr #8
     474:	5f495052 	svcpl	0x00495052
     478:	4f495047 	svcmi	0x00495047
     47c:	52003234 	andpl	r3, r0, #52, 4	; 0x40000003
     480:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     484:	344f4950 	strbcc	r4, [pc], #-2384	; 48c <CPSR_IRQ_INHIBIT+0x40c>
     488:	50520033 	subspl	r0, r2, r3, lsr r0
     48c:	50475f49 	subpl	r5, r7, r9, asr #30
     490:	34344f49 	ldrtcc	r4, [r4], #-3913	; 0xfffff0b7
     494:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     498:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     49c:	0035344f 	eorseq	r3, r5, pc, asr #8
     4a0:	5f495052 	svcpl	0x00495052
     4a4:	4f495047 	svcmi	0x00495047
     4a8:	52003634 	andpl	r3, r0, #52, 12	; 0x3400000
     4ac:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     4b0:	344f4950 	strbcc	r4, [pc], #-2384	; 4b8 <CPSR_IRQ_INHIBIT+0x438>
     4b4:	50520037 	subspl	r0, r2, r7, lsr r0
     4b8:	50475f49 	subpl	r5, r7, r9, asr #30
     4bc:	38344f49 	ldmdacc	r4!, {r0, r3, r6, r8, r9, sl, fp, lr}
     4c0:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     4c4:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     4c8:	0039344f 	eorseq	r3, r9, pc, asr #8
     4cc:	5f495052 	svcpl	0x00495052
     4d0:	6f697047 	svcvs	0x00697047
     4d4:	74696e49 	strbtvc	r6, [r9], #-3657	; 0xfffff1b7
     4d8:	52504700 	subspl	r4, r0, #0, 14
     4dc:	00304e45 	eorseq	r4, r0, r5, asr #28
     4e0:	45525047 	ldrbmi	r5, [r2, #-71]	; 0xffffffb9
     4e4:	4700314e 	strmi	r3, [r0, -lr, asr #2]
     4e8:	4e454850 	mcrmi	8, 2, r4, cr5, cr0, {2}
     4ec:	50520030 	subspl	r0, r2, r0, lsr r0
     4f0:	50475f49 	subpl	r5, r7, r9, asr #30
     4f4:	30324f49 	eorscc	r4, r2, r9, asr #30
     4f8:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     4fc:	7465535f 	strbtvc	r5, [r5], #-863	; 0xfffffca1
     500:	6f697047 	svcvs	0x00697047
     504:	466e6950 			; <UNDEFINED> instruction: 0x466e6950
     508:	74636e75 	strbtvc	r6, [r3], #-3701	; 0xfffff18b
     50c:	006e6f69 	rsbeq	r6, lr, r9, ror #30
     510:	65736552 	ldrbvs	r6, [r3, #-1362]!	; 0xfffffaae
     514:	64657672 	strbtvs	r7, [r5], #-1650	; 0xfffff98e
     518:	65520030 	ldrbvs	r0, [r2, #-48]	; 0xffffffd0
     51c:	76726573 			; <UNDEFINED> instruction: 0x76726573
     520:	00316465 	eorseq	r6, r1, r5, ror #8
     524:	65736552 	ldrbvs	r6, [r3, #-1362]!	; 0xfffffaae
     528:	64657672 	strbtvs	r7, [r5], #-1650	; 0xfffff98e
     52c:	65520032 	ldrbvs	r0, [r2, #-50]	; 0xffffffce
     530:	76726573 			; <UNDEFINED> instruction: 0x76726573
     534:	00336465 	eorseq	r6, r3, r5, ror #8
     538:	65736552 	ldrbvs	r6, [r3, #-1362]!	; 0xfffffaae
     53c:	64657672 	strbtvs	r7, [r5], #-1650	; 0xfffff98e
     540:	50470035 	subpl	r0, r7, r5, lsr r0
     544:	30534445 	subscc	r4, r3, r5, asr #8
     548:	45504700 	ldrbmi	r4, [r0, #-1792]	; 0xfffff900
     54c:	00315344 	eorseq	r5, r1, r4, asr #6
     550:	65736552 	ldrbvs	r6, [r3, #-1362]!	; 0xfffffaae
     554:	64657672 	strbtvs	r7, [r5], #-1650	; 0xfffff98e
     558:	65520038 	ldrbvs	r0, [r2, #-56]	; 0xffffffc8
     55c:	76726573 			; <UNDEFINED> instruction: 0x76726573
     560:	00396465 	eorseq	r6, r9, r5, ror #8
     564:	5f495052 	svcpl	0x00495052
     568:	4f495047 	svcmi	0x00495047
     56c:	52003134 	andpl	r3, r0, #52, 2
     570:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     574:	314f4950 	cmpcc	pc, r0, asr r9	; <UNPREDICTABLE>
     578:	50520030 	subspl	r0, r2, r0, lsr r0
     57c:	50475f49 	subpl	r5, r7, r9, asr #30
     580:	31314f49 	teqcc	r1, r9, asr #30
     584:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     588:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     58c:	0032314f 	eorseq	r3, r2, pc, asr #2
     590:	5f495052 	svcpl	0x00495052
     594:	4f495047 	svcmi	0x00495047
     598:	52003331 	andpl	r3, r0, #-1006632960	; 0xc4000000
     59c:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     5a0:	314f4950 	cmpcc	pc, r0, asr r9	; <UNPREDICTABLE>
     5a4:	50520034 	subspl	r0, r2, r4, lsr r0
     5a8:	50475f49 	subpl	r5, r7, r9, asr #30
     5ac:	35314f49 	ldrcc	r4, [r1, #-3913]!	; 0xfffff0b7
     5b0:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     5b4:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     5b8:	0036314f 	eorseq	r3, r6, pc, asr #2
     5bc:	5f495052 	svcpl	0x00495052
     5c0:	4f495047 	svcmi	0x00495047
     5c4:	52003731 	andpl	r3, r0, #12845056	; 0xc40000
     5c8:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     5cc:	314f4950 	cmpcc	pc, r0, asr r9	; <UNPREDICTABLE>
     5d0:	50520038 	subspl	r0, r2, r8, lsr r0
     5d4:	50475f49 	subpl	r5, r7, r9, asr #30
     5d8:	39314f49 	ldmdbcc	r1!, {r0, r3, r6, r8, r9, sl, fp, lr}
     5dc:	65736600 	ldrbvs	r6, [r3, #-1536]!	; 0xfffffa00
     5e0:	65725f6c 	ldrbvs	r5, [r2, #-3948]!	; 0xfffff094
     5e4:	50520067 	subspl	r0, r2, r7, rrx
     5e8:	50475f49 	subpl	r5, r7, r9, asr #30
     5ec:	30354f49 	eorscc	r4, r5, r9, asr #30
     5f0:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     5f4:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     5f8:	0031354f 	eorseq	r3, r1, pc, asr #10
     5fc:	5f495052 	svcpl	0x00495052
     600:	4f495047 	svcmi	0x00495047
     604:	47003335 	smladxmi	r0, r5, r3, r3
     608:	44555050 	ldrbmi	r5, [r5], #-80	; 0xffffffb0
     60c:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     610:	7465475f 	strbtvc	r4, [r5], #-1887	; 0xfffff8a1
     614:	6f697047 	svcvs	0x00697047
     618:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
     61c:	6970675f 	ldmdbvs	r0!, {r0, r1, r2, r3, r4, r6, r8, r9, sl, sp, lr}^
     620:	69705f6f 	ldmdbvs	r0!, {r0, r1, r2, r3, r5, r6, r8, r9, sl, fp, ip, lr}^
     624:	00745f6e 	rsbseq	r5, r4, lr, ror #30
     628:	454c5047 	strbmi	r5, [ip, #-71]	; 0xffffffb9
     62c:	4700304e 	strmi	r3, [r0, -lr, asr #32]
     630:	45464150 	strbmi	r4, [r6, #-336]	; 0xfffffeb0
     634:	4700304e 	strmi	r3, [r0, -lr, asr #32]
     638:	45464150 	strbmi	r4, [r6, #-336]	; 0xfffffeb0
     63c:	5200314e 	andpl	r3, r0, #-2147483629	; 0x80000013
     640:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     644:	304f4950 	subcc	r4, pc, r0, asr r9	; <UNPREDICTABLE>
     648:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     64c:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     650:	5200314f 	andpl	r3, r0, #-1073741805	; 0xc0000013
     654:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     658:	324f4950 	subcc	r4, pc, #80, 18	; 0x140000
     65c:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     660:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     664:	5200344f 	andpl	r3, r0, #1325400064	; 0x4f000000
     668:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     66c:	354f4950 	strbcc	r4, [pc, #-2384]	; fffffd24 <CPSR_UNAFFECTED_BITS+0xfffffe24>
     670:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     674:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     678:	4600364f 	strmi	r3, [r0], -pc, asr #12
     67c:	554f5f53 	strbpl	r5, [pc, #-3923]	; fffff731 <CPSR_UNAFFECTED_BITS+0xfffff831>
     680:	54555054 	ldrbpl	r5, [r5], #-84	; 0xffffffac
     684:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     688:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     68c:	5200384f 	andpl	r3, r0, #5177344	; 0x4f0000
     690:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     694:	394f4950 	stmdbcc	pc, {r4, r6, r8, fp, lr}^	; <UNPREDICTABLE>
     698:	43504700 	cmpmi	r0, #0, 14
     69c:	0031524c 	eorseq	r5, r1, ip, asr #4
     6a0:	5f697072 	svcpl	0x00697072
     6a4:	5f676572 	svcpl	0x00676572
     6a8:	745f6f72 	ldrbvc	r6, [pc], #-3954	; 6b0 <CPSR_IRQ_INHIBIT+0x630>
     6ac:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     6b0:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     6b4:	0031324f 	eorseq	r3, r1, pc, asr #4
     6b8:	5f495052 	svcpl	0x00495052
     6bc:	4f495047 	svcmi	0x00495047
     6c0:	52003232 	andpl	r3, r0, #536870915	; 0x20000003
     6c4:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     6c8:	324f4950 	subcc	r4, pc, #80, 18	; 0x140000
     6cc:	50520033 	subspl	r0, r2, r3, lsr r0
     6d0:	50475f49 	subpl	r5, r7, r9, asr #30
     6d4:	34324f49 	ldrtcc	r4, [r2], #-3913	; 0xfffff0b7
     6d8:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     6dc:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     6e0:	0035324f 	eorseq	r3, r5, pc, asr #4
     6e4:	5f495052 	svcpl	0x00495052
     6e8:	4f495047 	svcmi	0x00495047
     6ec:	52003632 	andpl	r3, r0, #52428800	; 0x3200000
     6f0:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     6f4:	324f4950 	subcc	r4, pc, #80, 18	; 0x140000
     6f8:	50520037 	subspl	r0, r2, r7, lsr r0
     6fc:	50475f49 	subpl	r5, r7, r9, asr #30
     700:	38324f49 	ldmdacc	r2!, {r0, r3, r6, r8, r9, sl, fp, lr}
     704:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     708:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     70c:	0039324f 	eorseq	r3, r9, pc, asr #4
     710:	65736552 	ldrbvs	r6, [r3, #-1362]!	; 0xfffffaae
     714:	64657672 	strbtvs	r7, [r5], #-1650	; 0xfffff98e
     718:	47003131 	smladxmi	r0, r1, r1, r3
     71c:	45524150 	ldrbmi	r4, [r2, #-336]	; 0xfffffeb0
     720:	4700304e 	strmi	r3, [r0, -lr, asr #32]
     724:	4e454c50 	mcrmi	12, 2, r4, cr5, cr0, {2}
     728:	50470031 	subpl	r0, r7, r1, lsr r0
     72c:	43445550 	movtmi	r5, #17744	; 0x4550
     730:	00304b4c 	eorseq	r4, r0, ip, asr #22
     734:	65736552 	ldrbvs	r6, [r3, #-1362]!	; 0xfffffaae
     738:	64657672 	strbtvs	r7, [r5], #-1650	; 0xfffff98e
     73c:	47003031 	smladxmi	r0, r1, r0, r3
     740:	45524150 	ldrbmi	r4, [r2, #-336]	; 0xfffffeb0
     744:	7200314e 	andvc	r3, r0, #-2147483629	; 0x80000013
     748:	675f6970 			; <UNDEFINED> instruction: 0x675f6970
     74c:	5f6f6970 	svcpl	0x006f6970
     750:	5f746c61 	svcpl	0x00746c61
     754:	636e7566 	cmnvs	lr, #427819008	; 0x19800000
     758:	6e6f6974 			; <UNDEFINED> instruction: 0x6e6f6974
     75c:	5200745f 	andpl	r7, r0, #1593835520	; 0x5f000000
     760:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     764:	374f4950 	smlsldcc	r4, pc, r0, r9	; <UNPREDICTABLE>
     768:	5f534600 	svcpl	0x00534600
     76c:	55504e49 	ldrbpl	r4, [r0, #-3657]	; 0xfffff1b7
     770:	50470054 	subpl	r0, r7, r4, asr r0
     774:	43445550 	movtmi	r5, #17744	; 0x4550
     778:	00314b4c 	eorseq	r4, r1, ip, asr #22
     77c:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; 6c8 <CPSR_IRQ_INHIBIT+0x648>
     780:	62612f65 	rsbvs	r2, r1, #404	; 0x194
     784:	616b6964 	cmnvs	fp, r4, ror #18
     788:	2f6d6972 	svccs	0x006d6972
     78c:	2f766564 	svccs	0x00766564
     790:	694c794d 	stmdbvs	ip, {r0, r2, r3, r6, r8, fp, ip, sp, lr}^
     794:	656c7474 	strbvs	r7, [ip, #-1140]!	; 0xfffffb8c
     798:	732f534f 			; <UNDEFINED> instruction: 0x732f534f
     79c:	722f6372 	eorvc	r6, pc, #-939524095	; 0xc8000001
     7a0:	672d6970 			; <UNDEFINED> instruction: 0x672d6970
     7a4:	2e6f6970 			; <UNDEFINED> instruction: 0x2e6f6970
     7a8:	50520063 	subspl	r0, r2, r3, rrx
     7ac:	50475f49 	subpl	r5, r7, r9, asr #30
     7b0:	33334f49 	teqcc	r3, #292	; 0x124
     7b4:	4c504700 	mrrcmi	7, 0, r4, r0, cr0
     7b8:	00305645 	eorseq	r5, r0, r5, asr #12
     7bc:	454c5047 	strbmi	r5, [ip, #-71]	; 0xffffffb9
     7c0:	52003156 	andpl	r3, r0, #-2147483627	; 0x80000015
     7c4:	72657365 	rsbvc	r7, r5, #-1811939327	; 0x94000001
     7c8:	34646576 	strbtcc	r6, [r4], #-1398	; 0xfffffa8a
     7cc:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     7d0:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     7d4:	0037334f 	eorseq	r3, r7, pc, asr #6
     7d8:	65736552 	ldrbvs	r6, [r3, #-1362]!	; 0xfffffaae
     7dc:	64657672 	strbtvs	r7, [r5], #-1650	; 0xfffff98e
     7e0:	50470036 	subpl	r0, r7, r6, lsr r0
     7e4:	314e4548 	cmpcc	lr, r8, asr #10
     7e8:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     7ec:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     7f0:	0032354f 	eorseq	r3, r2, pc, asr #10
     7f4:	5f495052 	svcpl	0x00495052
     7f8:	4f495047 	svcmi	0x00495047
     7fc:	52003033 	andpl	r3, r0, #51	; 0x33
     800:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     804:	334f4950 	movtcc	r4, #63824	; 0xf950
     808:	50520031 	subspl	r0, r2, r1, lsr r0
     80c:	50475f49 	subpl	r5, r7, r9, asr #30
     810:	32334f49 	eorscc	r4, r3, #292	; 0x124
     814:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     818:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     81c:	5200334f 	andpl	r3, r0, #1006632961	; 0x3c000001
     820:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     824:	334f4950 	movtcc	r4, #63824	; 0xf950
     828:	50520034 	subspl	r0, r2, r4, lsr r0
     82c:	50475f49 	subpl	r5, r7, r9, asr #30
     830:	35334f49 	ldrcc	r4, [r3, #-3913]!	; 0xfffff0b7
     834:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     838:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     83c:	0036334f 	eorseq	r3, r6, pc, asr #6
     840:	5f697072 	svcpl	0x00697072
     844:	5f676572 	svcpl	0x00676572
     848:	745f6f77 	ldrbvc	r6, [pc], #-3959	; 850 <CPSR_IRQ_INHIBIT+0x7d0>
     84c:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     850:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     854:	0038334f 	eorseq	r3, r8, pc, asr #6
     858:	5f495052 	svcpl	0x00495052
     85c:	4f495047 	svcmi	0x00495047
     860:	52003933 	andpl	r3, r0, #835584	; 0xcc000
     864:	72657365 	rsbvc	r7, r5, #-1811939327	; 0x94000001
     868:	37646576 			; <UNDEFINED> instruction: 0x37646576
     86c:	65736600 	ldrbvs	r6, [r3, #-1536]!	; 0xfffffa00
     870:	6f635f6c 	svcvs	0x00635f6c
     874:	67007970 	smlsdxvs	r0, r0, r9, r7
     878:	006f6970 	rsbeq	r6, pc, r0, ror r9	; <UNPREDICTABLE>
     87c:	45465047 	strbmi	r5, [r6, #-71]	; 0xffffffb9
     880:	4600304e 	strmi	r3, [r0], -lr, asr #32
     884:	4c415f53 	mcrrmi	15, 5, r5, r1, cr3
     888:	46003054 			; <UNDEFINED> instruction: 0x46003054
     88c:	4c415f53 	mcrrmi	15, 5, r5, r1, cr3
     890:	46003154 			; <UNDEFINED> instruction: 0x46003154
     894:	4c415f53 	mcrrmi	15, 5, r5, r1, cr3
     898:	46003254 			; <UNDEFINED> instruction: 0x46003254
     89c:	4c415f53 	mcrrmi	15, 5, r5, r1, cr3
     8a0:	46003354 			; <UNDEFINED> instruction: 0x46003354
     8a4:	4c415f53 	mcrrmi	15, 5, r5, r1, cr3
     8a8:	46003454 			; <UNDEFINED> instruction: 0x46003454
     8ac:	4c415f53 	mcrrmi	15, 5, r5, r1, cr3
     8b0:	72003554 	andvc	r3, r0, #84, 10	; 0x15000000
     8b4:	675f6970 			; <UNDEFINED> instruction: 0x675f6970
     8b8:	5f6f6970 	svcpl	0x006f6970
     8bc:	50470074 	subpl	r0, r7, r4, ror r0
     8c0:	30524c43 	subscc	r4, r2, r3, asr #24
     8c4:	65727000 	ldrbvs	r7, [r2, #-0]!
     8c8:	63746566 	cmnvs	r4, #427819008	; 0x19800000
     8cc:	62615f68 	rsbvs	r5, r1, #104, 30	; 0x1a0
     8d0:	5f74726f 	svcpl	0x0074726f
     8d4:	74636576 	strbtvc	r6, [r3], #-1398	; 0xfffffa8a
     8d8:	5200726f 	andpl	r7, r0, #-268435450	; 0xf0000006
     8dc:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     8e0:	72497465 	subvc	r7, r9, #1694498816	; 0x65000000
     8e4:	6e6f4371 	mcrvs	3, 3, r4, cr15, cr1, {3}
     8e8:	6c6f7274 	sfmvs	f7, 2, [pc], #-464	; 720 <CPSR_IRQ_INHIBIT+0x6a0>
     8ec:	0072656c 	rsbseq	r6, r2, ip, ror #10
     8f0:	5f697072 	svcpl	0x00697072
     8f4:	5f717269 	svcpl	0x00717269
     8f8:	746e6f63 	strbtvc	r6, [lr], #-3939	; 0xfffff09d
     8fc:	6c6c6f72 	stclvs	15, cr6, [ip], #-456	; 0xfffffe38
     900:	745f7265 	ldrbvc	r7, [pc], #-613	; 908 <CPSR_IRQ_INHIBIT+0x888>
     904:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
     908:	43515249 	cmpmi	r1, #-1879048188	; 0x90000004
     90c:	72746e6f 	rsbsvc	r6, r4, #1776	; 0x6f0
     910:	656c6c6f 	strbvs	r6, [ip, #-3183]!	; 0xfffff391
     914:	69440072 	stmdbvs	r4, {r1, r4, r5, r6}^
     918:	6c626173 	stfvse	f6, [r2], #-460	; 0xfffffe34
     91c:	61425f65 	cmpvs	r2, r5, ror #30
     920:	5f636973 	svcpl	0x00636973
     924:	73515249 	cmpvc	r1, #-1879048188	; 0x90000004
     928:	51494600 	cmppl	r9, r0, lsl #12
     92c:	6e6f635f 	mcrvs	3, 3, r6, cr15, cr15, {2}
     930:	6c6f7274 	sfmvs	f7, 2, [pc], #-464	; 768 <CPSR_IRQ_INHIBIT+0x6e8>
     934:	51524900 	cmppl	r2, r0, lsl #18
     938:	7361625f 	cmnvc	r1, #-268435451	; 0xf0000005
     93c:	705f6369 	subsvc	r6, pc, r9, ror #6
     940:	69646e65 	stmdbvs	r4!, {r0, r2, r5, r6, r9, sl, fp, sp, lr}^
     944:	7300676e 	movwvc	r6, #1902	; 0x76e
     948:	6e697274 	mcrvs	2, 3, r7, cr9, cr4, {3}
     94c:	6e450067 	cdpvs	0, 4, cr0, cr5, cr7, {3}
     950:	656c6261 	strbvs	r6, [ip, #-609]!	; 0xfffffd9f
     954:	7361425f 	cmnvc	r1, #-268435451	; 0xf0000005
     958:	495f6369 	ldmdbmi	pc, {r0, r3, r5, r6, r8, r9, sp, lr}^	; <UNPREDICTABLE>
     95c:	00735152 	rsbseq	r5, r3, r2, asr r1
     960:	62616e45 	rsbvs	r6, r1, #1104	; 0x450
     964:	495f656c 	ldmdbmi	pc, {r2, r3, r5, r6, r8, sl, sp, lr}^	; <UNPREDICTABLE>
     968:	5f735152 	svcpl	0x00735152
     96c:	6e450031 	mcrvs	0, 2, r0, cr5, cr1, {1}
     970:	656c6261 	strbvs	r6, [ip, #-609]!	; 0xfffffd9f
     974:	5152495f 	cmppl	r2, pc, asr r9
     978:	00325f73 	eorseq	r5, r2, r3, ror pc
     97c:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; 8c8 <CPSR_IRQ_INHIBIT+0x848>
     980:	62612f65 	rsbvs	r2, r1, #404	; 0x194
     984:	616b6964 	cmnvs	fp, r4, ror #18
     988:	2f6d6972 	svccs	0x006d6972
     98c:	2f766564 	svccs	0x00766564
     990:	694c794d 	stmdbvs	ip, {r0, r2, r3, r6, r8, fp, ip, sp, lr}^
     994:	656c7474 	strbvs	r7, [ip, #-1140]!	; 0xfffffb8c
     998:	732f534f 			; <UNDEFINED> instruction: 0x732f534f
     99c:	722f6372 	eorvc	r6, pc, #-939524095	; 0xc8000001
     9a0:	692d6970 	pushvs	{r4, r5, r6, r8, fp, sp, lr}
     9a4:	7265746e 	rsbvc	r7, r5, #1845493760	; 0x6e000000
     9a8:	74707572 	ldrbtvc	r7, [r0], #-1394	; 0xfffffa8e
     9ac:	00632e73 	rsbeq	r2, r3, r3, ror lr
     9b0:	61746164 	cmnvs	r4, r4, ror #2
     9b4:	6f62615f 	svcvs	0x0062615f
     9b8:	765f7472 			; <UNDEFINED> instruction: 0x765f7472
     9bc:	6f746365 	svcvs	0x00746365
     9c0:	736d0072 	cmnvc	sp, #114	; 0x72
     9c4:	6e756f43 	cdpvs	15, 7, cr6, cr5, cr3, {2}
     9c8:	00726574 	rsbseq	r6, r2, r4, ror r5
     9cc:	5f515249 	svcpl	0x00515249
     9d0:	646e6570 	strbtvs	r6, [lr], #-1392	; 0xfffffa90
     9d4:	5f676e69 	svcpl	0x00676e69
     9d8:	6e750032 	mrcvs	0, 3, r0, cr5, cr2, {1}
     9dc:	69666564 	stmdbvs	r6!, {r2, r5, r6, r8, sl, sp, lr}^
     9e0:	5f64656e 	svcpl	0x0064656e
     9e4:	74736e69 	ldrbtvc	r6, [r3], #-3689	; 0xfffff197
     9e8:	74637572 	strbtvc	r7, [r3], #-1394	; 0xfffffa8e
     9ec:	5f6e6f69 	svcpl	0x006e6f69
     9f0:	74636576 	strbtvc	r6, [r3], #-1398	; 0xfffffa8a
     9f4:	7200726f 	andvc	r7, r0, #-268435450	; 0xf0000006
     9f8:	74657365 	strbtvc	r7, [r5], #-869	; 0xfffffc9b
     9fc:	6365765f 	cmnvs	r5, #99614720	; 0x5f00000
     a00:	00726f74 	rsbseq	r6, r2, r4, ror pc
     a04:	74666f73 	strbtvc	r6, [r6], #-3955	; 0xfffff08d
     a08:	65726177 	ldrbvs	r6, [r2, #-375]!	; 0xfffffe89
     a0c:	746e695f 	strbtvc	r6, [lr], #-2399	; 0xfffff6a1
     a10:	75727265 	ldrbvc	r7, [r2, #-613]!	; 0xfffffd9b
     a14:	765f7470 			; <UNDEFINED> instruction: 0x765f7470
     a18:	6f746365 	svcvs	0x00746365
     a1c:	69440072 	stmdbvs	r4, {r1, r4, r5, r6}^
     a20:	6c626173 	stfvse	f6, [r2], #-460	; 0xfffffe34
     a24:	52495f65 	subpl	r5, r9, #404	; 0x194
     a28:	315f7351 	cmpcc	pc, r1, asr r3	; <UNPREDICTABLE>
     a2c:	73694400 	cmnvc	r9, #0, 8
     a30:	656c6261 	strbvs	r6, [ip, #-609]!	; 0xfffffd9f
     a34:	5152495f 	cmppl	r2, pc, asr r9
     a38:	00325f73 	eorseq	r5, r2, r3, ror pc
     a3c:	74736166 	ldrbtvc	r6, [r3], #-358	; 0xfffffe9a
     a40:	746e695f 	strbtvc	r6, [lr], #-2399	; 0xfffff6a1
     a44:	75727265 	ldrbvc	r7, [r2, #-613]!	; 0xfffffd9b
     a48:	765f7470 			; <UNDEFINED> instruction: 0x765f7470
     a4c:	6f746365 	svcvs	0x00746365
     a50:	52490072 	subpl	r0, r9, #114	; 0x72
     a54:	65705f51 	ldrbvs	r5, [r0, #-3921]!	; 0xfffff0af
     a58:	6e69646e 	cdpvs	4, 6, cr6, cr9, cr14, {3}
     a5c:	00315f67 	eorseq	r5, r1, r7, ror #30
     a60:	706d6f63 	rsbvc	r6, sp, r3, ror #30
     a64:	30657261 	rsbcc	r7, r5, r1, ror #4
     a68:	6d6f6300 	stclvs	3, cr6, [pc, #-0]	; a70 <CPSR_IRQ_INHIBIT+0x9f0>
     a6c:	65726170 	ldrbvs	r6, [r2, #-368]!	; 0xfffffe90
     a70:	6f630031 	svcvs	0x00630031
     a74:	7261706d 	rsbvc	r7, r1, #109	; 0x6d
     a78:	63003265 	movwvs	r3, #613	; 0x265
     a7c:	61706d6f 	cmnvs	r0, pc, ror #26
     a80:	00336572 	eorseq	r6, r3, r2, ror r5
     a84:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; 9d0 <CPSR_IRQ_INHIBIT+0x950>
     a88:	62612f65 	rsbvs	r2, r1, #404	; 0x194
     a8c:	616b6964 	cmnvs	fp, r4, ror #18
     a90:	2f6d6972 	svccs	0x006d6972
     a94:	2f766564 	svccs	0x00766564
     a98:	694c794d 	stmdbvs	ip, {r0, r2, r3, r6, r8, fp, ip, sp, lr}^
     a9c:	656c7474 	strbvs	r7, [ip, #-1140]!	; 0xfffffb8c
     aa0:	732f534f 			; <UNDEFINED> instruction: 0x732f534f
     aa4:	722f6372 	eorvc	r6, pc, #-939524095	; 0xc8000001
     aa8:	732d6970 			; <UNDEFINED> instruction: 0x732d6970
     aac:	69747379 	ldmdbvs	r4!, {r0, r3, r4, r5, r6, r8, r9, ip, sp, lr}^
     ab0:	2e72656d 	cdpcs	5, 7, cr6, cr2, cr13, {3}
     ab4:	6f630063 	svcvs	0x00630063
     ab8:	65746e75 	ldrbvs	r6, [r4, #-3701]!	; 0xfffff18b
     abc:	69685f72 	stmdbvs	r8!, {r1, r4, r5, r6, r8, r9, sl, fp, ip, lr}^
     ac0:	6e6f6300 	cdpvs	3, 6, cr6, cr15, cr0, {0}
     ac4:	6c6f7274 	sfmvs	f7, 2, [pc], #-464	; 8fc <CPSR_IRQ_INHIBIT+0x87c>
     ac8:	6174735f 	cmnvs	r4, pc, asr r3
     acc:	00737574 	rsbseq	r7, r3, r4, ror r5
     ad0:	6e756f63 	cdpvs	15, 7, cr6, cr5, cr3, {3}
     ad4:	5f726574 	svcpl	0x00726574
     ad8:	52006f6c 	andpl	r6, r0, #108, 30	; 0x1b0
     adc:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     ae0:	79537465 	ldmdbvc	r3, {r0, r2, r5, r6, sl, ip, sp, lr}^
     ae4:	6d657473 	cfstrdvs	mvd7, [r5, #-460]!	; 0xfffffe34
     ae8:	656d6954 	strbvs	r6, [sp, #-2388]!	; 0xfffff6ac
     aec:	50520072 	subspl	r0, r2, r2, ror r0
     af0:	61575f49 	cmpvs	r7, r9, asr #30
     af4:	694d7469 	stmdbvs	sp, {r0, r3, r5, r6, sl, ip, sp, lr}^
     af8:	536f7263 	cmnpl	pc, #805306374	; 0x30000006
     afc:	6e6f6365 	cdpvs	3, 6, cr6, cr15, cr5, {3}
     b00:	72007364 	andvc	r7, r0, #100, 6	; 0x90000001
     b04:	735f6970 	cmpvc	pc, #112, 18	; 0x1c0000
     b08:	745f7379 	ldrbvc	r7, [pc], #-889	; b10 <CPSR_IRQ_INHIBIT+0xa90>
     b0c:	72656d69 	rsbvc	r6, r5, #6720	; 0x1a40
     b10:	7200745f 	andvc	r7, r0, #1593835520	; 0x5f000000
     b14:	79536970 	ldmdbvc	r3, {r4, r5, r6, r8, fp, sp, lr}^
     b18:	6d657473 	cfstrdvs	mvd7, [r5, #-460]!	; 0xfffffe34
     b1c:	656d6954 	strbvs	r6, [sp, #-2388]!	; 0xfffff6ac
     b20:	55410072 	strbpl	r0, [r1, #-114]	; 0xffffff8e
     b24:	554d5f58 	strbpl	r5, [sp, #-3928]	; 0xfffff0a8
     b28:	5243535f 	subpl	r5, r3, #2080374785	; 0x7c000001
     b2c:	48435441 	stmdami	r3, {r0, r6, sl, ip, lr}^
     b30:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
     b34:	7261755f 	rsbvc	r7, r1, #398458880	; 0x17c00000
     b38:	00745f74 	rsbseq	r5, r4, r4, ror pc
     b3c:	5f495052 	svcpl	0x00495052
     b40:	696e694d 	stmdbvs	lr!, {r0, r2, r3, r6, r8, fp, sp, lr}^
     b44:	74726155 	ldrbtvc	r6, [r2], #-341	; 0xfffffeab
     b48:	5253495f 	subspl	r4, r3, #1556480	; 0x17c000
     b4c:	79626e00 	stmdbvc	r2!, {r9, sl, fp, sp, lr}^
     b50:	00736574 	rsbseq	r6, r3, r4, ror r5
     b54:	5f585541 	svcpl	0x00585541
     b58:	4c5f554d 	cfldr64mi	mvdx5, [pc], {77}	; 0x4d
     b5c:	525f5253 	subspl	r5, pc, #805306373	; 0x30000005
     b60:	41004745 	tstmi	r0, r5, asr #14
     b64:	455f5855 	ldrbmi	r5, [pc, #-2133]	; 317 <CPSR_IRQ_INHIBIT+0x297>
     b68:	4c42414e 	stfmie	f4, [r2], {78}	; 0x4e
     b6c:	52005345 	andpl	r5, r0, #335544321	; 0x14000001
     b70:	575f4950 			; <UNDEFINED> instruction: 0x575f4950
     b74:	65746972 	ldrbvs	r6, [r4, #-2418]!	; 0xfffff68e
     b78:	694d6f54 	stmdbvs	sp, {r2, r4, r6, r8, r9, sl, fp, sp, lr}^
     b7c:	6155696e 	cmpvs	r5, lr, ror #18
     b80:	52007472 	andpl	r7, r0, #1912602624	; 0x72000000
     b84:	4d5f4950 	vldrmi.16	s9, [pc, #-160]	; aec <CPSR_IRQ_INHIBIT+0xa6c>	; <UNPREDICTABLE>
     b88:	55696e69 	strbpl	r6, [r9, #-3689]!	; 0xfffff197
     b8c:	49747261 	ldmdbmi	r4!, {r0, r5, r6, r9, ip, sp, lr}^
     b90:	0074696e 	rsbseq	r6, r4, lr, ror #18
     b94:	5f585541 	svcpl	0x00585541
     b98:	4d5f554d 	cfldr64mi	mvdx5, [pc, #-308]	; a6c <CPSR_IRQ_INHIBIT+0x9ec>
     b9c:	525f5243 	subspl	r5, pc, #805306372	; 0x30000004
     ba0:	41004745 	tstmi	r0, r5, asr #14
     ba4:	4d5f5855 	ldclmi	8, cr5, [pc, #-340]	; a58 <CPSR_IRQ_INHIBIT+0x9d8>
     ba8:	4f495f55 	svcmi	0x00495f55
     bac:	4745525f 	smlsldmi	r5, r5, pc, r2	; <UNPREDICTABLE>
     bb0:	66696600 	strbtvs	r6, [r9], -r0, lsl #12
     bb4:	75625f6f 	strbvc	r5, [r2, #-3951]!	; 0xfffff091
     bb8:	72656666 	rsbvc	r6, r5, #106954752	; 0x6600000
     bbc:	6f682f00 	svcvs	0x00682f00
     bc0:	612f656d 			; <UNDEFINED> instruction: 0x612f656d
     bc4:	6b696462 	blvs	1a59d54 <_stack+0x19d9d54>
     bc8:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
     bcc:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
     bd0:	4c794d2f 	ldclmi	13, cr4, [r9], #-188	; 0xffffff44
     bd4:	6c747469 	cfldrdvs	mvd7, [r4], #-420	; 0xfffffe5c
     bd8:	2f534f65 	svccs	0x00534f65
     bdc:	2f637273 	svccs	0x00637273
     be0:	2d697072 	stclcs	0, cr7, [r9, #-456]!	; 0xfffffe38
     be4:	74726175 	ldrbtvc	r6, [r2], #-373	; 0xfffffe8b
     be8:	4100632e 	tstmi	r0, lr, lsr #6
     bec:	4d5f5855 	ldclmi	8, cr5, [pc, #-340]	; aa0 <CPSR_IRQ_INHIBIT+0xa20>
     bf0:	41425f55 	cmpmi	r2, r5, asr pc
     bf4:	525f4455 	subspl	r4, pc, #1426063360	; 0x55000000
     bf8:	41004745 	tstmi	r0, r5, asr #14
     bfc:	4d5f5855 	ldclmi	8, cr5, [pc, #-340]	; ab0 <CPSR_IRQ_INHIBIT+0xa30>
     c00:	534d5f55 	movtpl	r5, #57173	; 0xdf55
     c04:	45525f52 	ldrbmi	r5, [r2, #-3922]	; 0xfffff0ae
     c08:	61740047 	cmnvs	r4, r7, asr #32
     c0c:	41006c69 	tstmi	r0, r9, ror #24
     c10:	4d5f5855 	ldclmi	8, cr5, [pc, #-340]	; ac4 <CPSR_IRQ_INHIBIT+0xa44>
     c14:	45495f55 	strbmi	r5, [r9, #-3925]	; 0xfffff0ab
     c18:	45525f52 	ldrbmi	r5, [r2, #-3922]	; 0xfffff0ae
     c1c:	70720047 	rsbsvc	r0, r2, r7, asr #32
     c20:	6e694d69 	cdpvs	13, 6, cr4, cr9, cr9, {3}
     c24:	72615569 	rsbvc	r5, r1, #440401920	; 0x1a400000
     c28:	55410074 	strbpl	r0, [r1, #-116]	; 0xffffff8c
     c2c:	554d5f58 	strbpl	r5, [sp, #-3928]	; 0xfffff0a8
     c30:	5249495f 	subpl	r4, r9, #1556480	; 0x17c000
     c34:	4745525f 	smlsldmi	r5, r5, pc, r2	; <UNPREDICTABLE>
     c38:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
     c3c:	00787541 	rsbseq	r7, r8, r1, asr #10
     c40:	5f585541 	svcpl	0x00585541
     c44:	00515249 	subseq	r5, r1, r9, asr #4
     c48:	6f636e69 	svcvs	0x00636e69
     c4c:	676e696d 	strbvs	r6, [lr, -sp, ror #18]!
     c50:	7461645f 	strbtvc	r6, [r1], #-1119	; 0xfffffba1
     c54:	70670061 	rsbvc	r0, r7, r1, rrx
     c58:	65526f69 	ldrbvs	r6, [r2, #-3945]	; 0xfffff097
     c5c:	69660067 	stmdbvs	r6!, {r0, r1, r2, r5, r6}^
     c60:	745f6f66 	ldrbvc	r6, [pc], #-3942	; c68 <CPSR_IRQ_INHIBIT+0xbe8>
     c64:	636e6900 	cmnvs	lr, #0, 18
     c68:	6e696d6f 	cdpvs	13, 6, cr6, cr9, cr15, {3}
     c6c:	79625f67 	stmdbvc	r2!, {r0, r1, r2, r5, r6, r8, r9, sl, fp, ip, lr}^
     c70:	52006574 	andpl	r6, r0, #116, 10	; 0x1d000000
     c74:	525f4950 	subspl	r4, pc, #80, 18	; 0x140000
     c78:	46646165 	strbtmi	r6, [r4], -r5, ror #2
     c7c:	4d6d6f72 	stclmi	15, cr6, [sp, #-456]!	; 0xfffffe38
     c80:	55696e69 	strbpl	r6, [r9, #-3689]!	; 0xfffff197
     c84:	00747261 	rsbseq	r7, r4, r1, ror #4
     c88:	5f495052 	svcpl	0x00495052
     c8c:	4d746547 	cfldr64mi	mvdx6, [r4, #-284]!	; 0xfffffee4
     c90:	55696e69 	strbpl	r6, [r9, #-3689]!	; 0xfffff197
     c94:	00747261 	rsbseq	r7, r4, r1, ror #4
     c98:	5f585541 	svcpl	0x00585541
     c9c:	535f554d 	cmppl	pc, #322961408	; 0x13400000
     ca0:	5f544154 	svcpl	0x00544154
     ca4:	00474552 	subeq	r4, r7, r2, asr r5
     ca8:	64616568 	strbtvs	r6, [r1], #-1384	; 0xfffffa98
     cac:	58554100 	ldmdapl	r5, {r8, lr}^
     cb0:	5f554d5f 	svcpl	0x00554d5f
     cb4:	5f52434c 	svcpl	0x0052434c
     cb8:	00474552 	subeq	r4, r7, r2, asr r5
     cbc:	5f495052 	svcpl	0x00495052
     cc0:	41746547 	cmnmi	r4, r7, asr #10
     cc4:	72007875 	andvc	r7, r0, #7667712	; 0x750000
     cc8:	615f6970 	cmpvs	pc, r0, ror r9	; <UNPREDICTABLE>
     ccc:	745f7875 	ldrbvc	r7, [pc], #-2165	; cd4 <CPSR_IRQ_INHIBIT+0xc54>
     cd0:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     cd4:	6972705f 	ldmdbvs	r2!, {r0, r1, r2, r3, r4, r6, ip, sp, lr}^
     cd8:	7453746e 	ldrbvc	r7, [r3], #-1134	; 0xfffffb92
     cdc:	676e6972 			; <UNDEFINED> instruction: 0x676e6972
     ce0:	654c664f 	strbvs	r6, [ip, #-1615]	; 0xfffff9b1
     ce4:	5541006e 	strbpl	r0, [r1, #-110]	; 0xffffff92
     ce8:	554d5f58 	strbpl	r5, [sp, #-3928]	; 0xfffff0a8
     cec:	544e435f 	strbpl	r4, [lr], #-863	; 0xfffffca1
     cf0:	45525f4c 	ldrbmi	r5, [r2, #-3916]	; 0xfffff0b4
     cf4:	50520047 	subspl	r0, r2, r7, asr #32
     cf8:	72705f49 	rsbsvc	r5, r0, #292	; 0x124
     cfc:	53746e69 	cmnpl	r4, #1680	; 0x690
     d00:	6e697274 	mcrvs	2, 3, r7, cr9, cr4, {3}
     d04:	645f0067 	ldrbvs	r0, [pc], #-103	; d0c <CPSR_IRQ_INHIBIT+0xc8c>
     d08:	685f6f73 	ldmdavs	pc, {r0, r1, r4, r5, r6, r8, r9, sl, fp, sp, lr}^	; <UNPREDICTABLE>
     d0c:	6c646e61 	stclvs	14, cr6, [r4], #-388	; 0xfffffe7c
     d10:	6f630065 	svcvs	0x00630065
     d14:	6e616d6d 	cdpvs	13, 6, cr6, cr1, cr13, {3}
     d18:	6f6e5f64 	svcvs	0x006e5f64
     d1c:	6f665f74 	svcvs	0x00665f74
     d20:	5f646e75 	svcpl	0x00646e75
     d24:	74786574 	ldrbtvc	r6, [r8], #-1396	; 0xfffffa8c
     d28:	61725f00 	cmnvs	r2, r0, lsl #30
     d2c:	3834646e 	ldmdacc	r4!, {r1, r2, r3, r5, r6, sl, sp, lr}
     d30:	6d655f00 	stclvs	15, cr5, [r5, #-0]
     d34:	65677265 	strbvs	r7, [r7, #-613]!	; 0xfffffd9b
     d38:	0079636e 	rsbseq	r6, r9, lr, ror #6
     d3c:	7263775f 	rsbvc	r7, r3, #24903680	; 0x17c0000
     d40:	626d6f74 	rsbvs	r6, sp, #116, 30	; 0x1d0
     d44:	6174735f 	cmnvs	r4, pc, asr r3
     d48:	5f006574 	svcpl	0x00006574
     d4c:	72736377 	rsbsvc	r6, r3, #-603979775	; 0xdc000001
     d50:	626d6f74 	rsbvs	r6, sp, #116, 30	; 0x1d0
     d54:	74735f73 	ldrbtvc	r5, [r3], #-3955	; 0xfffff08d
     d58:	00657461 	rsbeq	r7, r5, r1, ror #8
     d5c:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; ca8 <CPSR_IRQ_INHIBIT+0xc28>
     d60:	62612f65 	rsbvs	r2, r1, #404	; 0x194
     d64:	616b6964 	cmnvs	fp, r4, ror #18
     d68:	2f6d6972 	svccs	0x006d6972
     d6c:	2f766564 	svccs	0x00766564
     d70:	694c794d 	stmdbvs	ip, {r0, r2, r3, r6, r8, fp, ip, sp, lr}^
     d74:	656c7474 	strbvs	r7, [ip, #-1140]!	; 0xfffffb8c
     d78:	732f534f 			; <UNDEFINED> instruction: 0x732f534f
     d7c:	732f6372 			; <UNDEFINED> instruction: 0x732f6372
     d80:	6c6c6568 	cfstr64vs	mvdx6, [ip], #-416	; 0xfffffe60
     d84:	5f00632e 	svcpl	0x0000632e
     d88:	7366626c 	cmnvc	r6, #108, 4	; 0xc0000006
     d8c:	00657a69 	rsbeq	r7, r5, r9, ror #20
     d90:	72626d5f 	rsbvc	r6, r2, #6080	; 0x17c0
     d94:	63776f74 	cmnvs	r7, #116, 30	; 0x1d0
     d98:	6174735f 	cmnvs	r4, pc, asr r3
     d9c:	5f006574 	svcpl	0x00006574
     da0:	6f746377 	svcvs	0x00746377
     da4:	735f626d 	cmpvc	pc, #-805306362	; 0xd0000006
     da8:	65746174 	ldrbvs	r6, [r4, #-372]!	; 0xfffffe8c
     dac:	745f5f00 	ldrbvc	r5, [pc], #-3840	; db4 <CPSR_IRQ_INHIBIT+0xd34>
     db0:	65735f6d 	ldrbvs	r5, [r3, #-3949]!	; 0xfffff093
     db4:	755f0063 	ldrbvc	r0, [pc, #-99]	; d59 <CPSR_IRQ_INHIBIT+0xcd9>
     db8:	00667562 	rsbeq	r7, r6, r2, ror #10
     dbc:	6d745f5f 	ldclvs	15, cr5, [r4, #-380]!	; 0xfffffe84
     dc0:	756f685f 	strbvc	r6, [pc, #-2143]!	; 569 <CPSR_IRQ_INHIBIT+0x4e9>
     dc4:	5f5f0072 	svcpl	0x005f0072
     dc8:	5f006673 	svcpl	0x00006673
     dcc:	655f6e6f 	ldrbvs	r6, [pc, #-3695]	; ffffff65 <CPSR_UNAFFECTED_BITS+0x65>
     dd0:	5f746978 	svcpl	0x00746978
     dd4:	73677261 	cmnvc	r7, #268435462	; 0x10000006
     dd8:	6f635f00 	svcvs	0x00635f00
     ddc:	65696b6f 	strbvs	r6, [r9, #-2927]!	; 0xfffff491
     de0:	735f5f00 	cmpvc	pc, #0, 30
     de4:	65756c67 	ldrbvs	r6, [r5, #-3175]!	; 0xfffff399
     de8:	6c665f00 	stclvs	15, cr5, [r6], #-0
     dec:	00736761 	rsbseq	r6, r3, r1, ror #14
     df0:	5f73695f 	svcpl	0x0073695f
     df4:	00617863 	rsbeq	r7, r1, r3, ror #16
     df8:	6474735f 	ldrbtvs	r7, [r4], #-863	; 0xfffffca1
     dfc:	5f006e69 	svcpl	0x00006e69
     e00:	736b6c62 	cmnvc	fp, #25088	; 0x6200
     e04:	00657a69 	rsbeq	r7, r5, r9, ror #20
     e08:	7476635f 	ldrbtvc	r6, [r6], #-863	; 0xfffffca1
     e0c:	00667562 	rsbeq	r7, r6, r2, ror #10
     e10:	66666f5f 	uqsaxvs	r6, r6, pc	; <UNPREDICTABLE>
     e14:	00746573 	rsbseq	r6, r4, r3, ror r5
     e18:	73626d5f 	cmnvc	r2, #6080	; 0x17c0
     e1c:	776f7472 			; <UNDEFINED> instruction: 0x776f7472
     e20:	735f7363 	cmpvc	pc, #-1946157055	; 0x8c000001
     e24:	65746174 	ldrbvs	r6, [r4, #-372]!	; 0xfffffe8c
     e28:	626d5f00 	rsbvs	r5, sp, #0, 30
     e2c:	6e656c72 	mcrvs	12, 3, r6, cr5, cr2, {3}
     e30:	6174735f 	cmnvs	r4, pc, asr r3
     e34:	5f006574 	svcpl	0x00006574
     e38:	72616e66 	rsbvc	r6, r1, #1632	; 0x660
     e3c:	5f007367 	svcpl	0x00007367
     e40:	00736e66 	rsbseq	r6, r3, r6, ror #28
     e44:	6769735f 			; <UNDEFINED> instruction: 0x6769735f
     e48:	665f006e 	ldrbvs	r0, [pc], -lr, rrx
     e4c:	6b636f6c 	blvs	18dcc04 <_stack+0x185cc04>
     e50:	5f00745f 	svcpl	0x0000745f
     e54:	65647473 	strbvs	r7, [r4, #-1139]!	; 0xfffffb8d
     e58:	5f007272 	svcpl	0x00007272
     e5c:	69676942 	stmdbvs	r7!, {r1, r6, r8, fp, sp, lr}^
     e60:	5f00746e 	svcpl	0x0000746e
     e64:	6d6d6167 	stfvse	f6, [sp, #-412]!	; 0xfffffe64
     e68:	69735f61 	ldmdbvs	r3!, {r0, r5, r6, r8, r9, sl, fp, ip, lr}^
     e6c:	61676e67 	cmnvs	r7, r7, ror #28
     e70:	725f006d 	subsvc	r0, pc, #109	; 0x6d
     e74:	6c757365 	ldclvs	3, cr7, [r5], #-404	; 0xfffffe6c
     e78:	006b5f74 	rsbeq	r5, fp, r4, ror pc
     e7c:	6d745f5f 	ldclvs	15, cr5, [r4, #-380]!	; 0xfffffe84
     e80:	775f5f00 	ldrbvc	r5, [pc, -r0, lsl #30]
     e84:	00626863 	rsbeq	r6, r2, r3, ror #16
     e88:	6474735f 	ldrbtvs	r7, [r4], #-863	; 0xfffffca1
     e8c:	0074756f 	rsbseq	r7, r4, pc, ror #10
     e90:	7476635f 	ldrbtvc	r6, [r6], #-863	; 0xfffffca1
     e94:	006e656c 	rsbeq	r6, lr, ip, ror #10
     e98:	6c69665f 	stclvs	6, cr6, [r9], #-380	; 0xfffffe84
     e9c:	6e5f0065 	cdpvs	0, 5, cr0, cr15, cr5, {3}
     ea0:	73626f69 	cmnvc	r2, #420	; 0x1a4
     ea4:	74615f00 	strbtvc	r5, [r1], #-3840	; 0xfffff100
     ea8:	74697865 	strbtvc	r7, [r9], #-2149	; 0xfffff79b
     eac:	735f0030 	cmpvc	pc, #48	; 0x30
     eb0:	616e6769 	cmnvs	lr, r9, ror #14
     eb4:	75625f6c 	strbvc	r5, [r2, #-3948]!	; 0xfffff094
     eb8:	615f0066 	cmpvs	pc, r6, rrx
     ebc:	69746373 	ldmdbvs	r4!, {r0, r1, r4, r5, r6, r8, r9, sp, lr}^
     ec0:	625f656d 	subsvs	r6, pc, #457179136	; 0x1b400000
     ec4:	5f006675 	svcpl	0x00006675
     ec8:	75736572 	ldrbvc	r6, [r3, #-1394]!	; 0xfffffa8e
     ecc:	5f00746c 	svcpl	0x0000746c
     ed0:	6863775f 	stmdavs	r3!, {r0, r1, r2, r3, r4, r6, r8, r9, sl, ip, sp, lr}^
     ed4:	6e697700 	cdpvs	7, 6, cr7, cr9, cr0, {0}
     ed8:	00745f74 	rsbseq	r5, r4, r4, ror pc
     edc:	636f6c5f 	cmnvs	pc, #24320	; 0x5f00
     ee0:	665f006b 	ldrbvs	r0, [pc], -fp, rrx
     ee4:	7367616c 	cmnvc	r7, #108, 2
     ee8:	5f5f0032 	svcpl	0x005f0032
     eec:	795f6d74 	ldmdbvc	pc, {r2, r4, r5, r6, r8, sl, fp, sp, lr}^	; <UNPREDICTABLE>
     ef0:	00726165 	rsbseq	r6, r2, r5, ror #2
     ef4:	616d6e5f 	cmnvs	sp, pc, asr lr
     ef8:	636f6c6c 	cmnvs	pc, #108, 24	; 0x6c00
     efc:	61686300 	cmnvs	r8, r0, lsl #6
     f00:	74636172 	strbtvc	r6, [r3], #-370	; 0xfffffe8e
     f04:	6c007265 	sfmvs	f7, 4, [r0], {101}	; 0x65
     f08:	20676e6f 	rsbcs	r6, r7, pc, ror #28
     f0c:	62756f64 	rsbsvs	r6, r5, #100, 30	; 0x190
     f10:	5f00656c 	svcpl	0x0000656c
     f14:	7478656e 	ldrbtvc	r6, [r8], #-1390	; 0xfffffa92
     f18:	5f5f0066 	svcpl	0x005f0066
     f1c:	6d5f6d74 	ldclvs	13, cr6, [pc, #-464]	; d54 <CPSR_IRQ_INHIBIT+0xcd4>
     f20:	5f006e6f 	svcpl	0x00006e6f
     f24:	78657461 	stmdavc	r5!, {r0, r5, r6, sl, ip, sp, lr}^
     f28:	73007469 	movwvc	r7, #1129	; 0x469
     f2c:	706f6275 	rsbvc	r6, pc, r5, ror r2	; <UNPREDICTABLE>
     f30:	67726174 			; <UNDEFINED> instruction: 0x67726174
     f34:	735f5f00 	cmpvc	pc, #0, 30
     f38:	69646964 	stmdbvs	r4!, {r2, r5, r6, r8, fp, sp, lr}^
     f3c:	0074696e 	rsbseq	r6, r4, lr, ror #18
     f40:	66666f5f 	uqsaxvs	r6, r6, pc	; <UNPREDICTABLE>
     f44:	2f00745f 	svccs	0x0000745f
     f48:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
     f4c:	6462612f 	strbtvs	r6, [r2], #-303	; 0xfffffed1
     f50:	72616b69 	rsbvc	r6, r1, #107520	; 0x1a400
     f54:	642f6d69 	strtvs	r6, [pc], #-3433	; f5c <CPSR_IRQ_INHIBIT+0xedc>
     f58:	4d2f7665 	stcmi	6, cr7, [pc, #-404]!	; dcc <CPSR_IRQ_INHIBIT+0xd4c>
     f5c:	74694c79 	strbtvc	r4, [r9], #-3193	; 0xfffff387
     f60:	4f656c74 	svcmi	0x00656c74
     f64:	665f0053 			; <UNDEFINED> instruction: 0x665f0053
     f68:	6c656572 	cfstr64vs	mvdx6, [r5], #-456	; 0xfffffe38
     f6c:	00747369 	rsbseq	r7, r4, r9, ror #6
     f70:	434f4c5f 	movtmi	r4, #64607	; 0xfc5f
     f74:	45525f4b 	ldrbmi	r5, [r2, #-3915]	; 0xfffff0b5
     f78:	53525543 	cmppl	r2, #281018368	; 0x10c00000
     f7c:	5f455649 	svcpl	0x00455649
     f80:	6e5f0054 	mrcvs	0, 2, r0, cr15, cr4, {2}
     f84:	5f007765 	svcpl	0x00007765
     f88:	72655f68 	rsbvc	r5, r5, #104, 30	; 0x1a0
     f8c:	006f6e72 	rsbeq	r6, pc, r2, ror lr	; <UNPREDICTABLE>
     f90:	6d745f5f 	ldclvs	15, cr5, [r4, #-380]!	; 0xfffffe84
     f94:	6164795f 	cmnvs	r4, pc, asr r9
     f98:	5f5f0079 	svcpl	0x005f0079
     f9c:	66756273 			; <UNDEFINED> instruction: 0x66756273
     fa0:	6f695f00 	svcvs	0x00695f00
     fa4:	5f007362 	svcpl	0x00007362
     fa8:	4c49465f 	mcrrmi	6, 5, r4, r9, cr15
     fac:	6d5f0045 	ldclvs	0, cr0, [pc, #-276]	; ea0 <CPSR_IRQ_INHIBIT+0xe20>
     fb0:	61747362 	cmnvs	r4, r2, ror #6
     fb4:	745f6574 	ldrbvc	r6, [pc], #-1396	; fbc <CPSR_IRQ_INHIBIT+0xf3c>
     fb8:	735f5f00 	cmpvc	pc, #0, 30
     fbc:	454c4946 	strbmi	r4, [ip, #-2374]	; 0xfffff6ba
     fc0:	626d5f00 	rsbvs	r5, sp, #0, 30
     fc4:	74617473 	strbtvc	r7, [r1], #-1139	; 0xfffffb8d
     fc8:	725f0065 	subsvc	r0, pc, #101	; 0x65
     fcc:	5f646e61 	svcpl	0x00646e61
     fd0:	7478656e 	ldrbtvc	r6, [r8], #-1390	; 0xfffffa92
     fd4:	626d5f00 	rsbvs	r5, sp, #0, 30
     fd8:	5f6e656c 	svcpl	0x006e656c
     fdc:	74617473 	strbtvc	r7, [r1], #-1139	; 0xfffffb8d
     fe0:	695f0065 	ldmdbvs	pc, {r0, r2, r5, r6}^	; <UNPREDICTABLE>
     fe4:	5f00636e 	svcpl	0x0000636e
     fe8:	00646e69 	rsbeq	r6, r4, r9, ror #28
     fec:	7275635f 	rsbsvc	r6, r5, #2080374785	; 0x7c000001
     ff0:	746e6572 	strbtvc	r6, [lr], #-1394	; 0xfffffa8e
     ff4:	636f6c5f 	cmnvs	pc, #24320	; 0x5f00
     ff8:	00656c61 	rsbeq	r6, r5, r1, ror #24
     ffc:	75706e69 	ldrbvc	r6, [r0, #-3689]!	; 0xfffff197
    1000:	5f5f0074 	svcpl	0x005f0074
    1004:	61656c63 	cmnvs	r5, r3, ror #24
    1008:	0070756e 	rsbseq	r7, r0, lr, ror #10
    100c:	78616d5f 	stmdavc	r1!, {r0, r1, r2, r3, r4, r6, r8, sl, fp, sp, lr}^
    1010:	00736477 	rsbseq	r6, r3, r7, ror r4
    1014:	6565725f 	strbvs	r7, [r5, #-607]!	; 0xfffffda1
    1018:	5f00746e 	svcpl	0x0000746e
    101c:	64656573 	strbtvs	r6, [r5], #-1395	; 0xfffffa8d
    1020:	635f5f00 	cmpvs	pc, #0, 30
    1024:	746e756f 	strbtvc	r7, [lr], #-1391	; 0xfffffa91
    1028:	765f5f00 	ldrbvc	r5, [pc], -r0, lsl #30
    102c:	65756c61 	ldrbvs	r6, [r5, #-3169]!	; 0xfffff39f
    1030:	65735f00 	ldrbvs	r5, [r3, #-3840]!	; 0xfffff100
    1034:	5f006b65 	svcpl	0x00006b65
    1038:	736f7066 	cmnvc	pc, #102	; 0x66
    103c:	5f00745f 	svcpl	0x0000745f
    1040:	5f6d745f 	svcpl	0x006d745f
    1044:	006e696d 	rsbeq	r6, lr, sp, ror #18
    1048:	6c756d5f 	ldclvs	13, cr6, [r5], #-380	; 0xfffffe84
    104c:	6e650074 	mcrvs	0, 3, r0, cr5, cr4, {3}
    1050:	5f726574 	svcpl	0x00726574
    1054:	6d6d6f63 	stclvs	15, cr6, [sp, #-396]!	; 0xfffffe74
    1058:	5f646e61 	svcpl	0x00646e61
    105c:	74786574 	ldrbtvc	r6, [r8], #-1396	; 0xfffffa8c
    1060:	74735f00 	ldrbtvc	r5, [r3], #-3840	; 0xfffff100
    1064:	6b6f7472 	blvs	1bde234 <_stack+0x1b5e234>
    1068:	73616c5f 	cmnvc	r1, #24320	; 0x5f00
    106c:	665f0074 			; <UNDEFINED> instruction: 0x665f0074
    1070:	7079746e 	rsbsvc	r7, r9, lr, ror #8
    1074:	5f007365 	svcpl	0x00007365
    1078:	00646461 	rsbeq	r6, r4, r1, ror #8
    107c:	4c555f5f 	mrrcmi	15, 5, r5, r5, cr15	; <UNPREDICTABLE>
    1080:	00676e6f 	rsbeq	r6, r7, pc, ror #28
    1084:	7465675f 	strbtvc	r6, [r5], #-1887	; 0xfffff8a1
    1088:	65746164 	ldrbvs	r6, [r4, #-356]!	; 0xfffffe9c
    108c:	7272655f 	rsbsvc	r6, r2, #398458880	; 0x17c00000
    1090:	6c675f00 	stclvs	15, cr5, [r7], #-0
    1094:	6c61626f 	sfmvs	f6, 2, [r1], #-444	; 0xfffffe44
    1098:	706d695f 	rsbvc	r6, sp, pc, asr r9
    109c:	5f657275 	svcpl	0x00657275
    10a0:	00727470 	rsbseq	r7, r2, r0, ror r4
    10a4:	7275635f 	rsbsvc	r6, r5, #2080374785	; 0x7c000001
    10a8:	746e6572 	strbtvc	r6, [lr], #-1394	; 0xfffffa8e
    10ac:	7461635f 	strbtvc	r6, [r1], #-863	; 0xfffffca1
    10b0:	726f6765 	rsbvc	r6, pc, #26476544	; 0x1940000
    10b4:	755f0079 	ldrbvc	r0, [pc, #-121]	; 1043 <_heap_top+0x43>
    10b8:	6573756e 	ldrbvs	r7, [r3, #-1390]!	; 0xfffffa92
    10bc:	61725f64 	cmnvs	r2, r4, ror #30
    10c0:	5f00646e 	svcpl	0x0000646e
    10c4:	00736477 	rsbseq	r6, r3, r7, ror r4
    10c8:	6d745f5f 	ldclvs	15, cr5, [r4, #-380]!	; 0xfffffe84
    10cc:	6164775f 	cmnvs	r4, pc, asr r7
    10d0:	675f0079 			; <UNDEFINED> instruction: 0x675f0079
    10d4:	0065756c 	rsbeq	r7, r5, ip, ror #10
    10d8:	7361625f 	cmnvc	r1, #-268435451	; 0xf0000005
    10dc:	6c5f0065 	mrrcvs	0, 6, r0, pc, cr5	; <UNPREDICTABLE>
    10e0:	5f613436 	svcpl	0x00613436
    10e4:	00667562 	rsbeq	r7, r6, r2, ror #10
    10e8:	6769735f 			; <UNDEFINED> instruction: 0x6769735f
    10ec:	6e75665f 	mrcvs	6, 3, r6, cr5, cr15, {2}
    10f0:	6e5f0063 	cdpvs	0, 5, cr0, cr15, cr3, {3}
    10f4:	00667562 	rsbeq	r7, r6, r2, ror #10
    10f8:	756e755f 	strbvc	r7, [lr, #-1375]!	; 0xfffffaa1
    10fc:	00646573 	rsbeq	r6, r4, r3, ror r5
    1100:	6d745f5f 	ldclvs	15, cr5, [r4, #-380]!	; 0xfffffe84
    1104:	6473695f 	ldrbtvs	r6, [r3], #-2399	; 0xfffff6a1
    1108:	5f007473 	svcpl	0x00007473
    110c:	61636f6c 	cmnvs	r3, ip, ror #30
    1110:	6d69746c 	cfstrdvs	mvd7, [r9, #-432]!	; 0xfffffe50
    1114:	75625f65 	strbvc	r5, [r2, #-3941]!	; 0xfffff09b
    1118:	635f0066 	cmpvs	pc, #102	; 0x66
    111c:	65736f6c 	ldrbvs	r6, [r3, #-3948]!	; 0xfffff094
    1120:	34725f00 	ldrbtcc	r5, [r2], #-3840	; 0xfffff100
    1124:	6d5f0038 	ldclvs	0, cr0, [pc, #-224]	; 104c <_heap_top+0x4c>
    1128:	776f7462 	strbvc	r7, [pc, -r2, ror #8]!
    112c:	74735f63 	ldrbtvc	r5, [r3], #-3939	; 0xfffff09d
    1130:	00657461 	rsbeq	r7, r5, r1, ror #8
    1134:	7335705f 	teqvc	r5, #95	; 0x5f
    1138:	745f5f00 	ldrbvc	r5, [pc], #-3840	; 1140 <_heap_top+0x140>
    113c:	646d5f6d 	strbtvs	r5, [sp], #-3949	; 0xfffff093
    1140:	73007961 	movwvc	r7, #2401	; 0x961
    1144:	6c6c6568 	cfstr64vs	mvdx6, [ip], #-416	; 0xfffffe60
    1148:	69616d5f 	stmdbvs	r1!, {r0, r1, r2, r3, r4, r6, r8, sl, fp, sp, lr}^
    114c:	5653006e 	ldrbpl	r0, [r3], -lr, rrx
    1150:	61485f43 	cmpvs	r8, r3, asr #30
    1154:	656c646e 	strbvs	r6, [ip, #-1134]!	; 0xfffffb92
    1158:	614d5f72 	hvcvs	54770	; 0xd5f2
    115c:	6e006e69 	cdpvs	14, 0, cr6, cr0, cr9, {3}
    1160:	5f747865 	svcpl	0x00747865
    1164:	636f7270 	cmnvs	pc, #112, 4
    1168:	72756300 	rsbsvc	r6, r5, #0, 6
    116c:	746e6572 	strbtvc	r6, [lr], #-1394	; 0xfffffa8e
    1170:	6f72705f 	svcvs	0x0072705f
    1174:	682f0063 	stmdavs	pc!, {r0, r1, r5, r6}	; <UNPREDICTABLE>
    1178:	2f656d6f 	svccs	0x00656d6f
    117c:	69646261 	stmdbvs	r4!, {r0, r5, r6, r9, sp, lr}^
    1180:	6972616b 	ldmdbvs	r2!, {r0, r1, r3, r5, r6, r8, sp, lr}^
    1184:	65642f6d 	strbvs	r2, [r4, #-3949]!	; 0xfffff093
    1188:	794d2f76 	stmdbvc	sp, {r1, r2, r4, r5, r6, r8, r9, sl, fp, sp}^
    118c:	7474694c 	ldrbtvc	r6, [r4], #-2380	; 0xfffff6b4
    1190:	534f656c 	movtpl	r6, #62828	; 0xf56c
    1194:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
    1198:	6376732f 	cmnvs	r6, #-1140850688	; 0xbc000000
    119c:	7300632e 	movwvc	r6, #814	; 0x32e
    11a0:	615f6376 	cmpvs	pc, r6, ror r3	; <UNPREDICTABLE>
    11a4:	00736772 	rsbseq	r6, r3, r2, ror r7
    11a8:	626d756e 	rsbvs	r7, sp, #461373440	; 0x1b800000
    11ac:	76007265 	strvc	r7, [r0], -r5, ror #4
    11b0:	65756c61 	ldrbvs	r6, [r5, #-3169]!	; 0xfffff39f
    11b4:	5f6e695f 	svcpl	0x006e695f
    11b8:	5f676572 	svcpl	0x00676572
    11bc:	682f0030 	stmdavs	pc!, {r4, r5}	; <UNPREDICTABLE>
    11c0:	2f656d6f 	svccs	0x00656d6f
    11c4:	69646261 	stmdbvs	r4!, {r0, r5, r6, r9, sp, lr}^
    11c8:	6972616b 	ldmdbvs	r2!, {r0, r1, r3, r5, r6, r8, sp, lr}^
    11cc:	65642f6d 	strbvs	r2, [r4, #-3949]!	; 0xfffff093
    11d0:	794d2f76 	stmdbvc	sp, {r1, r2, r4, r5, r6, r8, r9, sl, fp, sp}^
    11d4:	7474694c 	ldrbtvc	r6, [r4], #-2380	; 0xfffff6b4
    11d8:	534f656c 	movtpl	r6, #62828	; 0xf56c
    11dc:	62696c2f 	rsbvs	r6, r9, #12032	; 0x2f00
    11e0:	6669662f 	strbtvs	r6, [r9], -pc, lsr #12
    11e4:	00632e6f 	rsbeq	r2, r3, pc, ror #28
    11e8:	6f666966 	svcvs	0x00666966
    11ec:	6972775f 	ldmdbvs	r2!, {r0, r1, r2, r3, r4, r6, r8, r9, sl, ip, sp, lr}^
    11f0:	66006574 			; <UNDEFINED> instruction: 0x66006574
    11f4:	5f6f6669 	svcpl	0x006f6669
    11f8:	74696e69 	strbtvc	r6, [r9], #-3689	; 0xfffff197
    11fc:	66696600 	strbtvs	r6, [r9], -r0, lsl #12
    1200:	65725f6f 	ldrbvs	r5, [r2, #-3951]!	; 0xfffff091
    1204:	73006461 	movwvc	r6, #1121	; 0x461
    1208:	61726f74 	cmnvs	r2, r4, ror pc
    120c:	70006567 	andvc	r6, r0, r7, ror #10
    1210:	746e6972 	strbtvc	r6, [lr], #-2418	; 0xfffff68e
    1214:	72616843 	rsbvc	r6, r1, #4390912	; 0x430000
    1218:	6f682f00 	svcvs	0x00682f00
    121c:	612f656d 			; <UNDEFINED> instruction: 0x612f656d
    1220:	6b696462 	blvs	1a5a3b0 <_stack+0x19da3b0>
    1224:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
    1228:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
    122c:	4c794d2f 	ldclmi	13, cr4, [r9], #-188	; 0xffffff44
    1230:	6c747469 	cfldrdvs	mvd7, [r4], #-420	; 0xfffffe5c
    1234:	2f534f65 	svccs	0x00534f65
    1238:	2f62696c 	svccs	0x0062696c
    123c:	6e697270 	mcrvs	2, 3, r7, cr9, cr0, {3}
    1240:	00632e74 	rsbeq	r2, r3, r4, ror lr

Disassembly of section .ARM.attributes:

00000000 <.ARM.attributes>:
   0:	00003041 	andeq	r3, r0, r1, asr #32
   4:	61656100 	cmnvs	r5, r0, lsl #2
   8:	01006962 	tsteq	r0, r2, ror #18
   c:	00000026 	andeq	r0, r0, r6, lsr #32
  10:	4b5a3605 	blmi	168d82c <_stack+0x160d82c>
  14:	08070600 	stmdaeq	r7, {r9, sl}
  18:	0a010901 	beq	42424 <__bss_end__+0x38f10>
  1c:	14041202 	strne	r1, [r4], #-514	; 0xfffffdfe
  20:	17011501 	strne	r1, [r1, -r1, lsl #10]
  24:	1a011803 	bne	46038 <__bss_end__+0x3cb24>
  28:	1e011c01 	cdpne	12, 0, cr1, cr1, cr1, {0}
  2c:	44012206 	strmi	r2, [r1], #-518	; 0xfffffdfa
  30:	Address 0x0000000000000030 is out of bounds.

