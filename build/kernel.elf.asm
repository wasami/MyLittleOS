
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
    8024:	000088cc 	andeq	r8, r0, ip, asr #17

00008028 <_software_interrupt_vector_h>:
    8028:	00009350 	andeq	r9, r0, r0, asr r3

0000802c <_prefetch_abort_vector_h>:
    802c:	00008934 	andeq	r8, r0, r4, lsr r9

00008030 <_data_abort_vector_h>:
    8030:	0000896c 	andeq	r8, r0, ip, ror #18

00008034 <_unused_handler_h>:
    8034:	00008040 	andeq	r8, r0, r0, asr #32

00008038 <_interrupt_vector_h>:
    8038:	000089a4 	andeq	r8, r0, r4, lsr #19

0000803c <_fast_interrupt_vector_h>:
    803c:	00008aa8 	andeq	r8, r0, r8, lsr #21

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
    80f0:	eb00004c 	bl	8228 <kernel_main>
    80f4:	eafffffe 	b	80f4 <_cstartup+0x60>
    80f8:	00009492 	muleq	r0, r2, r4
    80fc:	00009548 	andeq	r9, r0, r8, asr #10

00008100 <dummy_a>:
    8100:	e92d4800 	push	{fp, lr}
    8104:	e28db004 	add	fp, sp, #4
    8108:	e3a00061 	mov	r0, #97	; 0x61
    810c:	eb000457 	bl	9270 <printChar>
    8110:	eafffffc 	b	8108 <dummy_a+0x8>

00008114 <dummy_process_one>:
    8114:	e92d4800 	push	{fp, lr}
    8118:	e28db004 	add	fp, sp, #4
    811c:	e24dd030 	sub	sp, sp, #48	; 0x30
    8120:	e59f3060 	ldr	r3, [pc, #96]	; 8188 <dummy_process_one+0x74>
    8124:	e24bc020 	sub	ip, fp, #32
    8128:	e1a0e003 	mov	lr, r3
    812c:	e8be000f 	ldm	lr!, {r0, r1, r2, r3}
    8130:	e8ac000f 	stmia	ip!, {r0, r1, r2, r3}
    8134:	e89e0007 	ldm	lr, {r0, r1, r2}
    8138:	e8ac0003 	stmia	ip!, {r0, r1}
    813c:	e1cc20b0 	strh	r2, [ip]
    8140:	e59f3044 	ldr	r3, [pc, #68]	; 818c <dummy_process_one+0x78>
    8144:	e24bc034 	sub	ip, fp, #52	; 0x34
    8148:	e1a0e003 	mov	lr, r3
    814c:	e8be000f 	ldm	lr!, {r0, r1, r2, r3}
    8150:	e8ac000f 	stmia	ip!, {r0, r1, r2, r3}
    8154:	e59e3000 	ldr	r3, [lr]
    8158:	e1cc30b0 	strh	r3, [ip]
    815c:	e28cc002 	add	ip, ip, #2
    8160:	e1a03823 	lsr	r3, r3, #16
    8164:	e5cc3000 	strb	r3, [ip]
    8168:	e24b3020 	sub	r3, fp, #32
    816c:	e1a00003 	mov	r0, r3
    8170:	eb000448 	bl	9298 <printString>
    8174:	ef000001 	svc	0x00000001
    8178:	e24b3034 	sub	r3, fp, #52	; 0x34
    817c:	e1a00003 	mov	r0, r3
    8180:	eb000444 	bl	9298 <printString>
    8184:	eafffffe 	b	8184 <dummy_process_one+0x70>
    8188:	00009370 	andeq	r9, r0, r0, ror r3
    818c:	0000938c 	andeq	r9, r0, ip, lsl #7

00008190 <dummy_process_two>:
    8190:	e92d4800 	push	{fp, lr}
    8194:	e28db004 	add	fp, sp, #4
    8198:	e24dd030 	sub	sp, sp, #48	; 0x30
    819c:	e59f3060 	ldr	r3, [pc, #96]	; 8204 <dummy_process_two+0x74>
    81a0:	e24bc020 	sub	ip, fp, #32
    81a4:	e1a0e003 	mov	lr, r3
    81a8:	e8be000f 	ldm	lr!, {r0, r1, r2, r3}
    81ac:	e8ac000f 	stmia	ip!, {r0, r1, r2, r3}
    81b0:	e89e0007 	ldm	lr, {r0, r1, r2}
    81b4:	e8ac0003 	stmia	ip!, {r0, r1}
    81b8:	e1cc20b0 	strh	r2, [ip]
    81bc:	e59f3044 	ldr	r3, [pc, #68]	; 8208 <dummy_process_two+0x78>
    81c0:	e24bc034 	sub	ip, fp, #52	; 0x34
    81c4:	e1a0e003 	mov	lr, r3
    81c8:	e8be000f 	ldm	lr!, {r0, r1, r2, r3}
    81cc:	e8ac000f 	stmia	ip!, {r0, r1, r2, r3}
    81d0:	e59e3000 	ldr	r3, [lr]
    81d4:	e1cc30b0 	strh	r3, [ip]
    81d8:	e28cc002 	add	ip, ip, #2
    81dc:	e1a03823 	lsr	r3, r3, #16
    81e0:	e5cc3000 	strb	r3, [ip]
    81e4:	e24b3020 	sub	r3, fp, #32
    81e8:	e1a00003 	mov	r0, r3
    81ec:	eb000429 	bl	9298 <printString>
    81f0:	ef000001 	svc	0x00000001
    81f4:	e24b3034 	sub	r3, fp, #52	; 0x34
    81f8:	e1a00003 	mov	r0, r3
    81fc:	eb000425 	bl	9298 <printString>
    8200:	eafffffe 	b	8200 <dummy_process_two+0x70>
    8204:	000093a0 	andeq	r9, r0, r0, lsr #7
    8208:	000093bc 			; <UNDEFINED> instruction: 0x000093bc

0000820c <exception>:
    820c:	e92d4800 	push	{fp, lr}
    8210:	e28db004 	add	fp, sp, #4
    8214:	e24dd008 	sub	sp, sp, #8
    8218:	e50b0008 	str	r0, [fp, #-8]
    821c:	e51b0008 	ldr	r0, [fp, #-8]
    8220:	eb0002d2 	bl	8d70 <RPI_printString>
    8224:	eafffffe 	b	8224 <exception+0x18>

00008228 <kernel_main>:
    8228:	e92d4800 	push	{fp, lr}
    822c:	e28db004 	add	fp, sp, #4
    8230:	e24dd070 	sub	sp, sp, #112	; 0x70
    8234:	e50b0068 	str	r0, [fp, #-104]	; 0xffffff98
    8238:	e50b106c 	str	r1, [fp, #-108]	; 0xffffff94
    823c:	e50b2070 	str	r2, [fp, #-112]	; 0xffffff90
    8240:	eb000134 	bl	8718 <RPI_GetGpio>
    8244:	e1a03000 	mov	r3, r0
    8248:	e5932004 	ldr	r2, [r3, #4]
    824c:	e3822701 	orr	r2, r2, #262144	; 0x40000
    8250:	e5832004 	str	r2, [r3, #4]
    8254:	eb000248 	bl	8b7c <RPI_MiniUartInit>
    8258:	e59f3124 	ldr	r3, [pc, #292]	; 8384 <kernel_main+0x15c>
    825c:	e24bc020 	sub	ip, fp, #32
    8260:	e1a0e003 	mov	lr, r3
    8264:	e8be000f 	ldm	lr!, {r0, r1, r2, r3}
    8268:	e8ac000f 	stmia	ip!, {r0, r1, r2, r3}
    826c:	e89e0003 	ldm	lr, {r0, r1}
    8270:	e58c0000 	str	r0, [ip]
    8274:	e28cc004 	add	ip, ip, #4
    8278:	e1cc10b0 	strh	r1, [ip]
    827c:	e28cc002 	add	ip, ip, #2
    8280:	e1a03821 	lsr	r3, r1, #16
    8284:	e5cc3000 	strb	r3, [ip]
    8288:	e59f30f8 	ldr	r3, [pc, #248]	; 8388 <kernel_main+0x160>
    828c:	e24bc038 	sub	ip, fp, #56	; 0x38
    8290:	e1a0e003 	mov	lr, r3
    8294:	e8be000f 	ldm	lr!, {r0, r1, r2, r3}
    8298:	e8ac000f 	stmia	ip!, {r0, r1, r2, r3}
    829c:	e89e0003 	ldm	lr, {r0, r1}
    82a0:	e88c0003 	stm	ip, {r0, r1}
    82a4:	e59f30e0 	ldr	r3, [pc, #224]	; 838c <kernel_main+0x164>
    82a8:	e24bc04c 	sub	ip, fp, #76	; 0x4c
    82ac:	e1a0e003 	mov	lr, r3
    82b0:	e8be000f 	ldm	lr!, {r0, r1, r2, r3}
    82b4:	e8ac000f 	stmia	ip!, {r0, r1, r2, r3}
    82b8:	e59e3000 	ldr	r3, [lr]
    82bc:	e1cc30b0 	strh	r3, [ip]
    82c0:	e28cc002 	add	ip, ip, #2
    82c4:	e1a03823 	lsr	r3, r3, #16
    82c8:	e5cc3000 	strb	r3, [ip]
    82cc:	e24b3020 	sub	r3, fp, #32
    82d0:	e1a00003 	mov	r0, r3
    82d4:	eb0002a5 	bl	8d70 <RPI_printString>
    82d8:	eb0000dd 	bl	8654 <getAvailablePCB>
    82dc:	e50b0008 	str	r0, [fp, #-8]
    82e0:	e51b3008 	ldr	r3, [fp, #-8]
    82e4:	e3530000 	cmp	r3, #0
    82e8:	1a000002 	bne	82f8 <kernel_main+0xd0>
    82ec:	e24b304c 	sub	r3, fp, #76	; 0x4c
    82f0:	e1a00003 	mov	r0, r3
    82f4:	ebffffc4 	bl	820c <exception>
    82f8:	e59f1090 	ldr	r1, [pc, #144]	; 8390 <kernel_main+0x168>
    82fc:	e51b0008 	ldr	r0, [fp, #-8]
    8300:	eb00007b 	bl	84f4 <createProcess>
    8304:	e24b3020 	sub	r3, fp, #32
    8308:	e1a00003 	mov	r0, r3
    830c:	eb000297 	bl	8d70 <RPI_printString>
    8310:	eb0000cf 	bl	8654 <getAvailablePCB>
    8314:	e50b0008 	str	r0, [fp, #-8]
    8318:	e51b3008 	ldr	r3, [fp, #-8]
    831c:	e3530000 	cmp	r3, #0
    8320:	1a00000c 	bne	8358 <kernel_main+0x130>
    8324:	e59f3060 	ldr	r3, [pc, #96]	; 838c <kernel_main+0x164>
    8328:	e24bc060 	sub	ip, fp, #96	; 0x60
    832c:	e1a0e003 	mov	lr, r3
    8330:	e8be000f 	ldm	lr!, {r0, r1, r2, r3}
    8334:	e8ac000f 	stmia	ip!, {r0, r1, r2, r3}
    8338:	e59e3000 	ldr	r3, [lr]
    833c:	e1cc30b0 	strh	r3, [ip]
    8340:	e28cc002 	add	ip, ip, #2
    8344:	e1a03823 	lsr	r3, r3, #16
    8348:	e5cc3000 	strb	r3, [ip]
    834c:	e24b3060 	sub	r3, fp, #96	; 0x60
    8350:	e1a00003 	mov	r0, r3
    8354:	ebffffac 	bl	820c <exception>
    8358:	e59f1034 	ldr	r1, [pc, #52]	; 8394 <kernel_main+0x16c>
    835c:	e51b0008 	ldr	r0, [fp, #-8]
    8360:	eb000063 	bl	84f4 <createProcess>
    8364:	e51b0008 	ldr	r0, [fp, #-8]
    8368:	eb000087 	bl	858c <setRunningProcess>
    836c:	e24b3038 	sub	r3, fp, #56	; 0x38
    8370:	e1a00003 	mov	r0, r3
    8374:	eb00027d 	bl	8d70 <RPI_printString>
    8378:	e51b0008 	ldr	r0, [fp, #-8]
    837c:	eb0003ec 	bl	9334 <_start_user_process>
    8380:	eafffffe 	b	8380 <kernel_main+0x158>
    8384:	000093d0 	ldrdeq	r9, [r0], -r0
    8388:	000093e8 	andeq	r9, r0, r8, ror #7
    838c:	00009400 	andeq	r9, r0, r0, lsl #8
    8390:	00008114 	andeq	r8, r0, r4, lsl r1
    8394:	00008190 	muleq	r0, r0, r1

00008398 <malloc>:
    8398:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    839c:	e28db000 	add	fp, sp, #0
    83a0:	e24dd024 	sub	sp, sp, #36	; 0x24
    83a4:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
    83a8:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    83ac:	e3530000 	cmp	r3, #0
    83b0:	1a000001 	bne	83bc <malloc+0x24>
    83b4:	e3a03000 	mov	r3, #0
    83b8:	ea000045 	b	84d4 <malloc+0x13c>
    83bc:	e59f3120 	ldr	r3, [pc, #288]	; 84e4 <malloc+0x14c>
    83c0:	e50b3008 	str	r3, [fp, #-8]
    83c4:	ea00000b 	b	83f8 <malloc+0x60>
    83c8:	e51b3008 	ldr	r3, [fp, #-8]
    83cc:	e5932000 	ldr	r2, [r3]
    83d0:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    83d4:	e1520003 	cmp	r2, r3
    83d8:	3a000003 	bcc	83ec <malloc+0x54>
    83dc:	e51b3008 	ldr	r3, [fp, #-8]
    83e0:	e5933000 	ldr	r3, [r3]
    83e4:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    83e8:	ea000006 	b	8408 <malloc+0x70>
    83ec:	e51b3008 	ldr	r3, [fp, #-8]
    83f0:	e2833008 	add	r3, r3, #8
    83f4:	e50b3008 	str	r3, [fp, #-8]
    83f8:	e51b3008 	ldr	r3, [fp, #-8]
    83fc:	e5933000 	ldr	r3, [r3]
    8400:	e3530000 	cmp	r3, #0
    8404:	1affffef 	bne	83c8 <malloc+0x30>
    8408:	e51b3008 	ldr	r3, [fp, #-8]
    840c:	e5933004 	ldr	r3, [r3, #4]
    8410:	e50b300c 	str	r3, [fp, #-12]
    8414:	e51b3008 	ldr	r3, [fp, #-8]
    8418:	e5933000 	ldr	r3, [r3]
    841c:	e3530000 	cmp	r3, #0
    8420:	0a000007 	beq	8444 <malloc+0xac>
    8424:	e51b300c 	ldr	r3, [fp, #-12]
    8428:	e3530000 	cmp	r3, #0
    842c:	0a000004 	beq	8444 <malloc+0xac>
    8430:	e51b300c 	ldr	r3, [fp, #-12]
    8434:	e5932008 	ldr	r2, [r3, #8]
    8438:	e51b3008 	ldr	r3, [fp, #-8]
    843c:	e5832004 	str	r2, [r3, #4]
    8440:	ea00001e 	b	84c0 <malloc+0x128>
    8444:	e59f309c 	ldr	r3, [pc, #156]	; 84e8 <malloc+0x150>
    8448:	e5933000 	ldr	r3, [r3]
    844c:	e50b300c 	str	r3, [fp, #-12]
    8450:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    8454:	e283300c 	add	r3, r3, #12
    8458:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    845c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8460:	e283300f 	add	r3, r3, #15
    8464:	e3c3300f 	bic	r3, r3, #15
    8468:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    846c:	e59f3074 	ldr	r3, [pc, #116]	; 84e8 <malloc+0x150>
    8470:	e5932000 	ldr	r2, [r3]
    8474:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8478:	e0823003 	add	r3, r2, r3
    847c:	e50b3010 	str	r3, [fp, #-16]
    8480:	e59f3064 	ldr	r3, [pc, #100]	; 84ec <malloc+0x154>
    8484:	e5933000 	ldr	r3, [r3]
    8488:	e51b2010 	ldr	r2, [fp, #-16]
    848c:	e1520003 	cmp	r2, r3
    8490:	9a000001 	bls	849c <malloc+0x104>
    8494:	e3a03000 	mov	r3, #0
    8498:	ea00000d 	b	84d4 <malloc+0x13c>
    849c:	e59f2044 	ldr	r2, [pc, #68]	; 84e8 <malloc+0x150>
    84a0:	e51b3010 	ldr	r3, [fp, #-16]
    84a4:	e5823000 	str	r3, [r2]
    84a8:	e51b300c 	ldr	r3, [fp, #-12]
    84ac:	e59f203c 	ldr	r2, [pc, #60]	; 84f0 <malloc+0x158>
    84b0:	e5832000 	str	r2, [r3]
    84b4:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
    84b8:	e51b300c 	ldr	r3, [fp, #-12]
    84bc:	e5832004 	str	r2, [r3, #4]
    84c0:	e51b300c 	ldr	r3, [fp, #-12]
    84c4:	e3a02000 	mov	r2, #0
    84c8:	e5832008 	str	r2, [r3, #8]
    84cc:	e51b300c 	ldr	r3, [fp, #-12]
    84d0:	e283300c 	add	r3, r3, #12
    84d4:	e1a00003 	mov	r0, r3
    84d8:	e28bd000 	add	sp, fp, #0
    84dc:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    84e0:	e12fff1e 	bx	lr
    84e4:	0000941c 	andeq	r9, r0, ip, lsl r4
    84e8:	00009414 	andeq	r9, r0, r4, lsl r4
    84ec:	00009418 	andeq	r9, r0, r8, lsl r4
    84f0:	424c4d43 	submi	r4, ip, #4288	; 0x10c0

000084f4 <createProcess>:
    84f4:	e92d4800 	push	{fp, lr}
    84f8:	e28db004 	add	fp, sp, #4
    84fc:	e24dd010 	sub	sp, sp, #16
    8500:	e50b0010 	str	r0, [fp, #-16]
    8504:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    8508:	e51b3010 	ldr	r3, [fp, #-16]
    850c:	e2833004 	add	r3, r3, #4
    8510:	e50b300c 	str	r3, [fp, #-12]
    8514:	e3a03000 	mov	r3, #0
    8518:	e50b3008 	str	r3, [fp, #-8]
    851c:	ea000008 	b	8544 <createProcess+0x50>
    8520:	e51b3008 	ldr	r3, [fp, #-8]
    8524:	e1a03103 	lsl	r3, r3, #2
    8528:	e51b200c 	ldr	r2, [fp, #-12]
    852c:	e0823003 	add	r3, r2, r3
    8530:	e3a02000 	mov	r2, #0
    8534:	e5832000 	str	r2, [r3]
    8538:	e51b3008 	ldr	r3, [fp, #-8]
    853c:	e2833001 	add	r3, r3, #1
    8540:	e50b3008 	str	r3, [fp, #-8]
    8544:	e51b3008 	ldr	r3, [fp, #-8]
    8548:	e353000c 	cmp	r3, #12
    854c:	dafffff3 	ble	8520 <createProcess+0x2c>
    8550:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    8554:	e51b3010 	ldr	r3, [fp, #-16]
    8558:	e5832040 	str	r2, [r3, #64]	; 0x40
    855c:	e3a00b01 	mov	r0, #1024	; 0x400
    8560:	ebffff8c 	bl	8398 <malloc>
    8564:	e1a03000 	mov	r3, r0
    8568:	e1a02003 	mov	r2, r3
    856c:	e51b3010 	ldr	r3, [fp, #-16]
    8570:	e5832038 	str	r2, [r3, #56]	; 0x38
    8574:	e51b3010 	ldr	r3, [fp, #-16]
    8578:	e3a02010 	mov	r2, #16
    857c:	e5832000 	str	r2, [r3]
    8580:	e320f000 	nop	{0}
    8584:	e24bd004 	sub	sp, fp, #4
    8588:	e8bd8800 	pop	{fp, pc}

0000858c <setRunningProcess>:
    858c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8590:	e28db000 	add	fp, sp, #0
    8594:	e24dd00c 	sub	sp, sp, #12
    8598:	e50b0008 	str	r0, [fp, #-8]
    859c:	e59f2014 	ldr	r2, [pc, #20]	; 85b8 <setRunningProcess+0x2c>
    85a0:	e51b3008 	ldr	r3, [fp, #-8]
    85a4:	e5823000 	str	r3, [r2]
    85a8:	e320f000 	nop	{0}
    85ac:	e28bd000 	add	sp, fp, #0
    85b0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    85b4:	e12fff1e 	bx	lr
    85b8:	00009524 	andeq	r9, r0, r4, lsr #10

000085bc <getRunningProcess>:
    85bc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    85c0:	e28db000 	add	fp, sp, #0
    85c4:	e59f3010 	ldr	r3, [pc, #16]	; 85dc <getRunningProcess+0x20>
    85c8:	e5933000 	ldr	r3, [r3]
    85cc:	e1a00003 	mov	r0, r3
    85d0:	e28bd000 	add	sp, fp, #0
    85d4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    85d8:	e12fff1e 	bx	lr
    85dc:	00009524 	andeq	r9, r0, r4, lsr #10

000085e0 <getNextProcess>:
    85e0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    85e4:	e28db000 	add	fp, sp, #0
    85e8:	e24dd00c 	sub	sp, sp, #12
    85ec:	e59f305c 	ldr	r3, [pc, #92]	; 8650 <getNextProcess+0x70>
    85f0:	e50b300c 	str	r3, [fp, #-12]
    85f4:	e3a03000 	mov	r3, #0
    85f8:	e50b3008 	str	r3, [fp, #-8]
    85fc:	ea000009 	b	8628 <getNextProcess+0x48>
    8600:	e51b300c 	ldr	r3, [fp, #-12]
    8604:	e5933044 	ldr	r3, [r3, #68]	; 0x44
    8608:	e3530002 	cmp	r3, #2
    860c:	0a000009 	beq	8638 <getNextProcess+0x58>
    8610:	e51b300c 	ldr	r3, [fp, #-12]
    8614:	e2833048 	add	r3, r3, #72	; 0x48
    8618:	e50b300c 	str	r3, [fp, #-12]
    861c:	e51b3008 	ldr	r3, [fp, #-8]
    8620:	e2833001 	add	r3, r3, #1
    8624:	e50b3008 	str	r3, [fp, #-8]
    8628:	e51b3008 	ldr	r3, [fp, #-8]
    862c:	e3530001 	cmp	r3, #1
    8630:	dafffff2 	ble	8600 <getNextProcess+0x20>
    8634:	ea000000 	b	863c <getNextProcess+0x5c>
    8638:	e320f000 	nop	{0}
    863c:	e51b300c 	ldr	r3, [fp, #-12]
    8640:	e1a00003 	mov	r0, r3
    8644:	e28bd000 	add	sp, fp, #0
    8648:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    864c:	e12fff1e 	bx	lr
    8650:	00009494 	muleq	r0, r4, r4

00008654 <getAvailablePCB>:
    8654:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8658:	e28db000 	add	fp, sp, #0
    865c:	e24dd00c 	sub	sp, sp, #12
    8660:	e59f3070 	ldr	r3, [pc, #112]	; 86d8 <getAvailablePCB+0x84>
    8664:	e50b300c 	str	r3, [fp, #-12]
    8668:	e3a03000 	mov	r3, #0
    866c:	e50b3008 	str	r3, [fp, #-8]
    8670:	ea000009 	b	869c <getAvailablePCB+0x48>
    8674:	e51b300c 	ldr	r3, [fp, #-12]
    8678:	e5933044 	ldr	r3, [r3, #68]	; 0x44
    867c:	e3530000 	cmp	r3, #0
    8680:	0a000009 	beq	86ac <getAvailablePCB+0x58>
    8684:	e51b300c 	ldr	r3, [fp, #-12]
    8688:	e2833048 	add	r3, r3, #72	; 0x48
    868c:	e50b300c 	str	r3, [fp, #-12]
    8690:	e51b3008 	ldr	r3, [fp, #-8]
    8694:	e2833001 	add	r3, r3, #1
    8698:	e50b3008 	str	r3, [fp, #-8]
    869c:	e51b3008 	ldr	r3, [fp, #-8]
    86a0:	e3530001 	cmp	r3, #1
    86a4:	dafffff2 	ble	8674 <getAvailablePCB+0x20>
    86a8:	ea000000 	b	86b0 <getAvailablePCB+0x5c>
    86ac:	e320f000 	nop	{0}
    86b0:	e51b3008 	ldr	r3, [fp, #-8]
    86b4:	e3530002 	cmp	r3, #2
    86b8:	da000001 	ble	86c4 <getAvailablePCB+0x70>
    86bc:	e3a03000 	mov	r3, #0
    86c0:	ea000000 	b	86c8 <getAvailablePCB+0x74>
    86c4:	e51b300c 	ldr	r3, [fp, #-12]
    86c8:	e1a00003 	mov	r0, r3
    86cc:	e28bd000 	add	sp, fp, #0
    86d0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    86d4:	e12fff1e 	bx	lr
    86d8:	00009494 	muleq	r0, r4, r4

000086dc <RPI_GetArmTimer>:
    86dc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    86e0:	e28db000 	add	fp, sp, #0
    86e4:	e59f3010 	ldr	r3, [pc, #16]	; 86fc <RPI_GetArmTimer+0x20>
    86e8:	e5933000 	ldr	r3, [r3]
    86ec:	e1a00003 	mov	r0, r3
    86f0:	e28bd000 	add	sp, fp, #0
    86f4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    86f8:	e12fff1e 	bx	lr
    86fc:	0000943c 	andeq	r9, r0, ip, lsr r4

00008700 <RPI_ArmTimerInit>:
    8700:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8704:	e28db000 	add	fp, sp, #0
    8708:	e320f000 	nop	{0}
    870c:	e28bd000 	add	sp, fp, #0
    8710:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8714:	e12fff1e 	bx	lr

00008718 <RPI_GetGpio>:
    8718:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    871c:	e28db000 	add	fp, sp, #0
    8720:	e59f3010 	ldr	r3, [pc, #16]	; 8738 <RPI_GetGpio+0x20>
    8724:	e5933000 	ldr	r3, [r3]
    8728:	e1a00003 	mov	r0, r3
    872c:	e28bd000 	add	sp, fp, #0
    8730:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8734:	e12fff1e 	bx	lr
    8738:	00009440 	andeq	r9, r0, r0, asr #8

0000873c <RPI_SetGpioPinFunction>:
    873c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8740:	e28db000 	add	fp, sp, #0
    8744:	e24dd014 	sub	sp, sp, #20
    8748:	e1a03000 	mov	r3, r0
    874c:	e1a02001 	mov	r2, r1
    8750:	e54b300d 	strb	r3, [fp, #-13]
    8754:	e1a03002 	mov	r3, r2
    8758:	e54b300e 	strb	r3, [fp, #-14]
    875c:	e59f30ec 	ldr	r3, [pc, #236]	; 8850 <RPI_SetGpioPinFunction+0x114>
    8760:	e5932000 	ldr	r2, [r3]
    8764:	e55b300d 	ldrb	r3, [fp, #-13]
    8768:	e59f10e4 	ldr	r1, [pc, #228]	; 8854 <RPI_SetGpioPinFunction+0x118>
    876c:	e0831391 	umull	r1, r3, r1, r3
    8770:	e1a031a3 	lsr	r3, r3, #3
    8774:	e6ef3073 	uxtb	r3, r3
    8778:	e1a03103 	lsl	r3, r3, #2
    877c:	e0823003 	add	r3, r2, r3
    8780:	e50b3008 	str	r3, [fp, #-8]
    8784:	e51b3008 	ldr	r3, [fp, #-8]
    8788:	e5933000 	ldr	r3, [r3]
    878c:	e50b300c 	str	r3, [fp, #-12]
    8790:	e55b200d 	ldrb	r2, [fp, #-13]
    8794:	e59f30b8 	ldr	r3, [pc, #184]	; 8854 <RPI_SetGpioPinFunction+0x118>
    8798:	e0831293 	umull	r1, r3, r3, r2
    879c:	e1a011a3 	lsr	r1, r3, #3
    87a0:	e1a03001 	mov	r3, r1
    87a4:	e1a03103 	lsl	r3, r3, #2
    87a8:	e0833001 	add	r3, r3, r1
    87ac:	e1a03083 	lsl	r3, r3, #1
    87b0:	e0423003 	sub	r3, r2, r3
    87b4:	e6ef3073 	uxtb	r3, r3
    87b8:	e1a02003 	mov	r2, r3
    87bc:	e1a03002 	mov	r3, r2
    87c0:	e1a03083 	lsl	r3, r3, #1
    87c4:	e0833002 	add	r3, r3, r2
    87c8:	e3a02007 	mov	r2, #7
    87cc:	e1a03312 	lsl	r3, r2, r3
    87d0:	e1e03003 	mvn	r3, r3
    87d4:	e1a02003 	mov	r2, r3
    87d8:	e51b300c 	ldr	r3, [fp, #-12]
    87dc:	e0033002 	and	r3, r3, r2
    87e0:	e50b300c 	str	r3, [fp, #-12]
    87e4:	e55b000e 	ldrb	r0, [fp, #-14]
    87e8:	e55b200d 	ldrb	r2, [fp, #-13]
    87ec:	e59f3060 	ldr	r3, [pc, #96]	; 8854 <RPI_SetGpioPinFunction+0x118>
    87f0:	e0831293 	umull	r1, r3, r3, r2
    87f4:	e1a011a3 	lsr	r1, r3, #3
    87f8:	e1a03001 	mov	r3, r1
    87fc:	e1a03103 	lsl	r3, r3, #2
    8800:	e0833001 	add	r3, r3, r1
    8804:	e1a03083 	lsl	r3, r3, #1
    8808:	e0423003 	sub	r3, r2, r3
    880c:	e6ef3073 	uxtb	r3, r3
    8810:	e1a02003 	mov	r2, r3
    8814:	e1a03002 	mov	r3, r2
    8818:	e1a03083 	lsl	r3, r3, #1
    881c:	e0833002 	add	r3, r3, r2
    8820:	e1a03310 	lsl	r3, r0, r3
    8824:	e1a02003 	mov	r2, r3
    8828:	e51b300c 	ldr	r3, [fp, #-12]
    882c:	e1823003 	orr	r3, r2, r3
    8830:	e50b300c 	str	r3, [fp, #-12]
    8834:	e51b200c 	ldr	r2, [fp, #-12]
    8838:	e51b3008 	ldr	r3, [fp, #-8]
    883c:	e5832000 	str	r2, [r3]
    8840:	e320f000 	nop	{0}
    8844:	e28bd000 	add	sp, fp, #0
    8848:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    884c:	e12fff1e 	bx	lr
    8850:	00009440 	andeq	r9, r0, r0, asr #8
    8854:	cccccccd 	stclgt	12, cr12, [ip], {205}	; 0xcd

00008858 <RPI_GpioInit>:
    8858:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    885c:	e28db000 	add	fp, sp, #0
    8860:	e320f000 	nop	{0}
    8864:	e28bd000 	add	sp, fp, #0
    8868:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    886c:	e12fff1e 	bx	lr

00008870 <RPI_GetIrqController>:
    8870:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8874:	e28db000 	add	fp, sp, #0
    8878:	e59f3010 	ldr	r3, [pc, #16]	; 8890 <RPI_GetIrqController+0x20>
    887c:	e5933000 	ldr	r3, [r3]
    8880:	e1a00003 	mov	r0, r3
    8884:	e28bd000 	add	sp, fp, #0
    8888:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    888c:	e12fff1e 	bx	lr
    8890:	00009444 	andeq	r9, r0, r4, asr #8

00008894 <reset_vector>:
    8894:	e24ee004 	sub	lr, lr, #4
    8898:	e92d580f 	push	{r0, r1, r2, r3, fp, ip, lr}
    889c:	e28db018 	add	fp, sp, #24
    88a0:	e24dd00c 	sub	sp, sp, #12
    88a4:	e3a03031 	mov	r3, #49	; 0x31
    88a8:	e54b301d 	strb	r3, [fp, #-29]	; 0xffffffe3
    88ac:	ebffff99 	bl	8718 <RPI_GetGpio>
    88b0:	e1a02000 	mov	r2, r0
    88b4:	e3a03801 	mov	r3, #65536	; 0x10000
    88b8:	e5823028 	str	r3, [r2, #40]	; 0x28
    88bc:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
    88c0:	e1a00003 	mov	r0, r3
    88c4:	eb0000fb 	bl	8cb8 <RPI_WriteToMiniUart>
    88c8:	eafffff7 	b	88ac <reset_vector+0x18>

000088cc <undefined_instruction_vector>:
    88cc:	e92d580f 	push	{r0, r1, r2, r3, fp, ip, lr}
    88d0:	e28db018 	add	fp, sp, #24
    88d4:	e24dd00c 	sub	sp, sp, #12
    88d8:	e3a03032 	mov	r3, #50	; 0x32
    88dc:	e54b301d 	strb	r3, [fp, #-29]	; 0xffffffe3
    88e0:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
    88e4:	e1a00003 	mov	r0, r3
    88e8:	eb0000f2 	bl	8cb8 <RPI_WriteToMiniUart>
    88ec:	ebffff89 	bl	8718 <RPI_GetGpio>
    88f0:	e1a02000 	mov	r2, r0
    88f4:	e3a03801 	mov	r3, #65536	; 0x10000
    88f8:	e5823028 	str	r3, [r2, #40]	; 0x28
    88fc:	eafffffa 	b	88ec <undefined_instruction_vector+0x20>

00008900 <software_interrupt_vector>:
    8900:	e92d580f 	push	{r0, r1, r2, r3, fp, ip, lr}
    8904:	e28db018 	add	fp, sp, #24
    8908:	e24dd00c 	sub	sp, sp, #12
    890c:	e3a03033 	mov	r3, #51	; 0x33
    8910:	e54b301d 	strb	r3, [fp, #-29]	; 0xffffffe3
    8914:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
    8918:	e1a00003 	mov	r0, r3
    891c:	eb0000e5 	bl	8cb8 <RPI_WriteToMiniUart>
    8920:	ebffff7c 	bl	8718 <RPI_GetGpio>
    8924:	e1a02000 	mov	r2, r0
    8928:	e3a03801 	mov	r3, #65536	; 0x10000
    892c:	e5823028 	str	r3, [r2, #40]	; 0x28
    8930:	eafffffa 	b	8920 <software_interrupt_vector+0x20>

00008934 <prefetch_abort_vector>:
    8934:	e24ee004 	sub	lr, lr, #4
    8938:	e92d580f 	push	{r0, r1, r2, r3, fp, ip, lr}
    893c:	e28db018 	add	fp, sp, #24
    8940:	e24dd00c 	sub	sp, sp, #12
    8944:	e3a03034 	mov	r3, #52	; 0x34
    8948:	e54b301d 	strb	r3, [fp, #-29]	; 0xffffffe3
    894c:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
    8950:	e1a00003 	mov	r0, r3
    8954:	eb0000d7 	bl	8cb8 <RPI_WriteToMiniUart>
    8958:	ebffff6e 	bl	8718 <RPI_GetGpio>
    895c:	e1a02000 	mov	r2, r0
    8960:	e3a03801 	mov	r3, #65536	; 0x10000
    8964:	e5823028 	str	r3, [r2, #40]	; 0x28
    8968:	eafffffa 	b	8958 <prefetch_abort_vector+0x24>

0000896c <data_abort_vector>:
    896c:	e24ee004 	sub	lr, lr, #4
    8970:	e92d580f 	push	{r0, r1, r2, r3, fp, ip, lr}
    8974:	e28db018 	add	fp, sp, #24
    8978:	e24dd00c 	sub	sp, sp, #12
    897c:	e3a03035 	mov	r3, #53	; 0x35
    8980:	e54b301d 	strb	r3, [fp, #-29]	; 0xffffffe3
    8984:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
    8988:	e1a00003 	mov	r0, r3
    898c:	eb0000c9 	bl	8cb8 <RPI_WriteToMiniUart>
    8990:	ebffff60 	bl	8718 <RPI_GetGpio>
    8994:	e1a02000 	mov	r2, r0
    8998:	e3a03801 	mov	r3, #65536	; 0x10000
    899c:	e5823028 	str	r3, [r2, #40]	; 0x28
    89a0:	eafffffa 	b	8990 <data_abort_vector+0x24>

000089a4 <interrupt_vector>:
    89a4:	e24ee004 	sub	lr, lr, #4
    89a8:	e92d581f 	push	{r0, r1, r2, r3, r4, fp, ip, lr}
    89ac:	e28db01c 	add	fp, sp, #28
    89b0:	eb000040 	bl	8ab8 <RPI_GetSystemTimer>
    89b4:	e1a03000 	mov	r3, r0
    89b8:	e5933000 	ldr	r3, [r3]
    89bc:	e3530000 	cmp	r3, #0
    89c0:	0a000016 	beq	8a20 <interrupt_vector+0x7c>
    89c4:	eb00003b 	bl	8ab8 <RPI_GetSystemTimer>
    89c8:	e1a03000 	mov	r3, r0
    89cc:	e5932000 	ldr	r2, [r3]
    89d0:	e3c22002 	bic	r2, r2, #2
    89d4:	e5832000 	str	r2, [r3]
    89d8:	eb000036 	bl	8ab8 <RPI_GetSystemTimer>
    89dc:	e1a02000 	mov	r2, r0
    89e0:	e5923010 	ldr	r3, [r2, #16]
    89e4:	e2833b61 	add	r3, r3, #99328	; 0x18400
    89e8:	e2833e2a 	add	r3, r3, #672	; 0x2a0
    89ec:	e5823010 	str	r3, [r2, #16]
    89f0:	e59f30a4 	ldr	r3, [pc, #164]	; 8a9c <interrupt_vector+0xf8>
    89f4:	e5933000 	ldr	r3, [r3]
    89f8:	e3530009 	cmp	r3, #9
    89fc:	da000002 	ble	8a0c <interrupt_vector+0x68>
    8a00:	e59f3094 	ldr	r3, [pc, #148]	; 8a9c <interrupt_vector+0xf8>
    8a04:	e3a02000 	mov	r2, #0
    8a08:	e5832000 	str	r2, [r3]
    8a0c:	e59f3088 	ldr	r3, [pc, #136]	; 8a9c <interrupt_vector+0xf8>
    8a10:	e5933000 	ldr	r3, [r3]
    8a14:	e2833001 	add	r3, r3, #1
    8a18:	e59f207c 	ldr	r2, [pc, #124]	; 8a9c <interrupt_vector+0xf8>
    8a1c:	e5823000 	str	r3, [r2]
    8a20:	e59f3078 	ldr	r3, [pc, #120]	; 8aa0 <interrupt_vector+0xfc>
    8a24:	e5933000 	ldr	r3, [r3]
    8a28:	e5933000 	ldr	r3, [r3]
    8a2c:	e3530000 	cmp	r3, #0
    8a30:	0a000016 	beq	8a90 <interrupt_vector+0xec>
    8a34:	ebffff28 	bl	86dc <RPI_GetArmTimer>
    8a38:	e1a02000 	mov	r2, r0
    8a3c:	e3a03001 	mov	r3, #1
    8a40:	e582300c 	str	r3, [r2, #12]
    8a44:	e59f3058 	ldr	r3, [pc, #88]	; 8aa4 <interrupt_vector+0x100>
    8a48:	e5933000 	ldr	r3, [r3]
    8a4c:	e3530000 	cmp	r3, #0
    8a50:	0a000007 	beq	8a74 <interrupt_vector+0xd0>
    8a54:	ebffff2f 	bl	8718 <RPI_GetGpio>
    8a58:	e1a02000 	mov	r2, r0
    8a5c:	e3a03801 	mov	r3, #65536	; 0x10000
    8a60:	e582301c 	str	r3, [r2, #28]
    8a64:	e59f3038 	ldr	r3, [pc, #56]	; 8aa4 <interrupt_vector+0x100>
    8a68:	e3a02000 	mov	r2, #0
    8a6c:	e5832000 	str	r2, [r3]
    8a70:	ea000006 	b	8a90 <interrupt_vector+0xec>
    8a74:	ebffff27 	bl	8718 <RPI_GetGpio>
    8a78:	e1a02000 	mov	r2, r0
    8a7c:	e3a03801 	mov	r3, #65536	; 0x10000
    8a80:	e5823028 	str	r3, [r2, #40]	; 0x28
    8a84:	e59f3018 	ldr	r3, [pc, #24]	; 8aa4 <interrupt_vector+0x100>
    8a88:	e3a02001 	mov	r2, #1
    8a8c:	e5832000 	str	r2, [r3]
    8a90:	e320f000 	nop	{0}
    8a94:	e24bd01c 	sub	sp, fp, #28
    8a98:	e8fd981f 	ldm	sp!, {r0, r1, r2, r3, r4, fp, ip, pc}^
    8a9c:	00009528 	andeq	r9, r0, r8, lsr #10
    8aa0:	00009444 	andeq	r9, r0, r4, asr #8
    8aa4:	0000952c 	andeq	r9, r0, ip, lsr #10

00008aa8 <fast_interrupt_vector>:
    8aa8:	e24db004 	sub	fp, sp, #4
    8aac:	e320f000 	nop	{0}
    8ab0:	e28bd004 	add	sp, fp, #4
    8ab4:	e25ef004 	subs	pc, lr, #4

00008ab8 <RPI_GetSystemTimer>:
    8ab8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8abc:	e28db000 	add	fp, sp, #0
    8ac0:	e59f3010 	ldr	r3, [pc, #16]	; 8ad8 <RPI_GetSystemTimer+0x20>
    8ac4:	e5933000 	ldr	r3, [r3]
    8ac8:	e1a00003 	mov	r0, r3
    8acc:	e28bd000 	add	sp, fp, #0
    8ad0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8ad4:	e12fff1e 	bx	lr
    8ad8:	00009448 	andeq	r9, r0, r8, asr #8

00008adc <RPI_WaitMicroSeconds>:
    8adc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8ae0:	e28db000 	add	fp, sp, #0
    8ae4:	e24dd014 	sub	sp, sp, #20
    8ae8:	e50b0010 	str	r0, [fp, #-16]
    8aec:	e59f303c 	ldr	r3, [pc, #60]	; 8b30 <RPI_WaitMicroSeconds+0x54>
    8af0:	e5933000 	ldr	r3, [r3]
    8af4:	e5933004 	ldr	r3, [r3, #4]
    8af8:	e50b3008 	str	r3, [fp, #-8]
    8afc:	e320f000 	nop	{0}
    8b00:	e59f3028 	ldr	r3, [pc, #40]	; 8b30 <RPI_WaitMicroSeconds+0x54>
    8b04:	e5933000 	ldr	r3, [r3]
    8b08:	e5932004 	ldr	r2, [r3, #4]
    8b0c:	e51b3008 	ldr	r3, [fp, #-8]
    8b10:	e0422003 	sub	r2, r2, r3
    8b14:	e51b3010 	ldr	r3, [fp, #-16]
    8b18:	e1520003 	cmp	r2, r3
    8b1c:	3afffff7 	bcc	8b00 <RPI_WaitMicroSeconds+0x24>
    8b20:	e320f000 	nop	{0}
    8b24:	e28bd000 	add	sp, fp, #0
    8b28:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8b2c:	e12fff1e 	bx	lr
    8b30:	00009448 	andeq	r9, r0, r8, asr #8

00008b34 <RPI_GetAux>:
    8b34:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8b38:	e28db000 	add	fp, sp, #0
    8b3c:	e59f3010 	ldr	r3, [pc, #16]	; 8b54 <RPI_GetAux+0x20>
    8b40:	e5933000 	ldr	r3, [r3]
    8b44:	e1a00003 	mov	r0, r3
    8b48:	e28bd000 	add	sp, fp, #0
    8b4c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8b50:	e12fff1e 	bx	lr
    8b54:	0000944c 	andeq	r9, r0, ip, asr #8

00008b58 <RPI_GetMiniUart>:
    8b58:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8b5c:	e28db000 	add	fp, sp, #0
    8b60:	e59f3010 	ldr	r3, [pc, #16]	; 8b78 <RPI_GetMiniUart+0x20>
    8b64:	e5933000 	ldr	r3, [r3]
    8b68:	e1a00003 	mov	r0, r3
    8b6c:	e28bd000 	add	sp, fp, #0
    8b70:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8b74:	e12fff1e 	bx	lr
    8b78:	00009450 	andeq	r9, r0, r0, asr r4

00008b7c <RPI_MiniUartInit>:
    8b7c:	e92d4800 	push	{fp, lr}
    8b80:	e28db004 	add	fp, sp, #4
    8b84:	e24dd008 	sub	sp, sp, #8
    8b88:	ebfffee2 	bl	8718 <RPI_GetGpio>
    8b8c:	e50b0008 	str	r0, [fp, #-8]
    8b90:	e59f3114 	ldr	r3, [pc, #276]	; 8cac <RPI_MiniUartInit+0x130>
    8b94:	e5933000 	ldr	r3, [r3]
    8b98:	e59f210c 	ldr	r2, [pc, #268]	; 8cac <RPI_MiniUartInit+0x130>
    8b9c:	e5922000 	ldr	r2, [r2]
    8ba0:	e5922004 	ldr	r2, [r2, #4]
    8ba4:	e3822001 	orr	r2, r2, #1
    8ba8:	e5832004 	str	r2, [r3, #4]
    8bac:	e59f30fc 	ldr	r3, [pc, #252]	; 8cb0 <RPI_MiniUartInit+0x134>
    8bb0:	e5933000 	ldr	r3, [r3]
    8bb4:	e3a02000 	mov	r2, #0
    8bb8:	e5832004 	str	r2, [r3, #4]
    8bbc:	e59f30ec 	ldr	r3, [pc, #236]	; 8cb0 <RPI_MiniUartInit+0x134>
    8bc0:	e5933000 	ldr	r3, [r3]
    8bc4:	e3a02000 	mov	r2, #0
    8bc8:	e5832020 	str	r2, [r3, #32]
    8bcc:	e59f30dc 	ldr	r3, [pc, #220]	; 8cb0 <RPI_MiniUartInit+0x134>
    8bd0:	e5933000 	ldr	r3, [r3]
    8bd4:	e3a02003 	mov	r2, #3
    8bd8:	e583200c 	str	r2, [r3, #12]
    8bdc:	e59f30cc 	ldr	r3, [pc, #204]	; 8cb0 <RPI_MiniUartInit+0x134>
    8be0:	e5933000 	ldr	r3, [r3]
    8be4:	e3a02000 	mov	r2, #0
    8be8:	e5832010 	str	r2, [r3, #16]
    8bec:	e59f30bc 	ldr	r3, [pc, #188]	; 8cb0 <RPI_MiniUartInit+0x134>
    8bf0:	e5933000 	ldr	r3, [r3]
    8bf4:	e3a020c6 	mov	r2, #198	; 0xc6
    8bf8:	e5832008 	str	r2, [r3, #8]
    8bfc:	e59f30ac 	ldr	r3, [pc, #172]	; 8cb0 <RPI_MiniUartInit+0x134>
    8c00:	e5933000 	ldr	r3, [r3]
    8c04:	e59f20a8 	ldr	r2, [pc, #168]	; 8cb4 <RPI_MiniUartInit+0x138>
    8c08:	e5832028 	str	r2, [r3, #40]	; 0x28
    8c0c:	e3a01002 	mov	r1, #2
    8c10:	e3a0000e 	mov	r0, #14
    8c14:	ebfffec8 	bl	873c <RPI_SetGpioPinFunction>
    8c18:	e3a01002 	mov	r1, #2
    8c1c:	e3a0000f 	mov	r0, #15
    8c20:	ebfffec5 	bl	873c <RPI_SetGpioPinFunction>
    8c24:	e51b3008 	ldr	r3, [fp, #-8]
    8c28:	e3a02000 	mov	r2, #0
    8c2c:	e5832094 	str	r2, [r3, #148]	; 0x94
    8c30:	e3a03000 	mov	r3, #0
    8c34:	e50b300c 	str	r3, [fp, #-12]
    8c38:	ea000002 	b	8c48 <RPI_MiniUartInit+0xcc>
    8c3c:	e51b300c 	ldr	r3, [fp, #-12]
    8c40:	e2833001 	add	r3, r3, #1
    8c44:	e50b300c 	str	r3, [fp, #-12]
    8c48:	e51b300c 	ldr	r3, [fp, #-12]
    8c4c:	e3530095 	cmp	r3, #149	; 0x95
    8c50:	dafffff9 	ble	8c3c <RPI_MiniUartInit+0xc0>
    8c54:	e51b3008 	ldr	r3, [fp, #-8]
    8c58:	e3a02903 	mov	r2, #49152	; 0xc000
    8c5c:	e5832098 	str	r2, [r3, #152]	; 0x98
    8c60:	e3a03000 	mov	r3, #0
    8c64:	e50b300c 	str	r3, [fp, #-12]
    8c68:	ea000002 	b	8c78 <RPI_MiniUartInit+0xfc>
    8c6c:	e51b300c 	ldr	r3, [fp, #-12]
    8c70:	e2833001 	add	r3, r3, #1
    8c74:	e50b300c 	str	r3, [fp, #-12]
    8c78:	e51b300c 	ldr	r3, [fp, #-12]
    8c7c:	e3530095 	cmp	r3, #149	; 0x95
    8c80:	dafffff9 	ble	8c6c <RPI_MiniUartInit+0xf0>
    8c84:	e51b3008 	ldr	r3, [fp, #-8]
    8c88:	e3a02000 	mov	r2, #0
    8c8c:	e5832098 	str	r2, [r3, #152]	; 0x98
    8c90:	e59f3018 	ldr	r3, [pc, #24]	; 8cb0 <RPI_MiniUartInit+0x134>
    8c94:	e5933000 	ldr	r3, [r3]
    8c98:	e3a02003 	mov	r2, #3
    8c9c:	e5832020 	str	r2, [r3, #32]
    8ca0:	e320f000 	nop	{0}
    8ca4:	e24bd004 	sub	sp, fp, #4
    8ca8:	e8bd8800 	pop	{fp, pc}
    8cac:	0000944c 	andeq	r9, r0, ip, asr #8
    8cb0:	00009450 	andeq	r9, r0, r0, asr r4
    8cb4:	0000010e 	andeq	r0, r0, lr, lsl #2

00008cb8 <RPI_WriteToMiniUart>:
    8cb8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8cbc:	e28db000 	add	fp, sp, #0
    8cc0:	e24dd00c 	sub	sp, sp, #12
    8cc4:	e1a03000 	mov	r3, r0
    8cc8:	e54b3005 	strb	r3, [fp, #-5]
    8ccc:	e320f000 	nop	{0}
    8cd0:	e59f3030 	ldr	r3, [pc, #48]	; 8d08 <RPI_WriteToMiniUart+0x50>
    8cd4:	e5933000 	ldr	r3, [r3]
    8cd8:	e5933014 	ldr	r3, [r3, #20]
    8cdc:	e2033020 	and	r3, r3, #32
    8ce0:	e3530000 	cmp	r3, #0
    8ce4:	0afffff9 	beq	8cd0 <RPI_WriteToMiniUart+0x18>
    8ce8:	e59f3018 	ldr	r3, [pc, #24]	; 8d08 <RPI_WriteToMiniUart+0x50>
    8cec:	e5933000 	ldr	r3, [r3]
    8cf0:	e55b2005 	ldrb	r2, [fp, #-5]
    8cf4:	e5832000 	str	r2, [r3]
    8cf8:	e320f000 	nop	{0}
    8cfc:	e28bd000 	add	sp, fp, #0
    8d00:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8d04:	e12fff1e 	bx	lr
    8d08:	00009450 	andeq	r9, r0, r0, asr r4

00008d0c <RPI_printStringOfLen>:
    8d0c:	e92d4800 	push	{fp, lr}
    8d10:	e28db004 	add	fp, sp, #4
    8d14:	e24dd010 	sub	sp, sp, #16
    8d18:	e50b0010 	str	r0, [fp, #-16]
    8d1c:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    8d20:	e3a03000 	mov	r3, #0
    8d24:	e50b3008 	str	r3, [fp, #-8]
    8d28:	ea000008 	b	8d50 <RPI_printStringOfLen+0x44>
    8d2c:	e51b3010 	ldr	r3, [fp, #-16]
    8d30:	e2832001 	add	r2, r3, #1
    8d34:	e50b2010 	str	r2, [fp, #-16]
    8d38:	e5d33000 	ldrb	r3, [r3]
    8d3c:	e1a00003 	mov	r0, r3
    8d40:	ebffffdc 	bl	8cb8 <RPI_WriteToMiniUart>
    8d44:	e51b3008 	ldr	r3, [fp, #-8]
    8d48:	e2833001 	add	r3, r3, #1
    8d4c:	e50b3008 	str	r3, [fp, #-8]
    8d50:	e51b2008 	ldr	r2, [fp, #-8]
    8d54:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8d58:	e1520003 	cmp	r2, r3
    8d5c:	bafffff2 	blt	8d2c <RPI_printStringOfLen+0x20>
    8d60:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8d64:	e1a00003 	mov	r0, r3
    8d68:	e24bd004 	sub	sp, fp, #4
    8d6c:	e8bd8800 	pop	{fp, pc}

00008d70 <RPI_printString>:
    8d70:	e92d4800 	push	{fp, lr}
    8d74:	e28db004 	add	fp, sp, #4
    8d78:	e24dd008 	sub	sp, sp, #8
    8d7c:	e50b0008 	str	r0, [fp, #-8]
    8d80:	ea000005 	b	8d9c <RPI_printString+0x2c>
    8d84:	e51b3008 	ldr	r3, [fp, #-8]
    8d88:	e2832001 	add	r2, r3, #1
    8d8c:	e50b2008 	str	r2, [fp, #-8]
    8d90:	e5d33000 	ldrb	r3, [r3]
    8d94:	e1a00003 	mov	r0, r3
    8d98:	ebffffc6 	bl	8cb8 <RPI_WriteToMiniUart>
    8d9c:	e51b3008 	ldr	r3, [fp, #-8]
    8da0:	e5d33000 	ldrb	r3, [r3]
    8da4:	e3530000 	cmp	r3, #0
    8da8:	1afffff5 	bne	8d84 <RPI_printString+0x14>
    8dac:	e320f000 	nop	{0}
    8db0:	e24bd004 	sub	sp, fp, #4
    8db4:	e8bd8800 	pop	{fp, pc}

00008db8 <RPI_ReadFromMiniUart>:
    8db8:	e92d4800 	push	{fp, lr}
    8dbc:	e28db004 	add	fp, sp, #4
    8dc0:	e24dd008 	sub	sp, sp, #8
    8dc4:	e50b0008 	str	r0, [fp, #-8]
    8dc8:	e50b100c 	str	r1, [fp, #-12]
    8dcc:	e51b200c 	ldr	r2, [fp, #-12]
    8dd0:	e51b1008 	ldr	r1, [fp, #-8]
    8dd4:	e59f0010 	ldr	r0, [pc, #16]	; 8dec <RPI_ReadFromMiniUart+0x34>
    8dd8:	eb0000aa 	bl	9088 <fifo_read>
    8ddc:	e1a03000 	mov	r3, r0
    8de0:	e1a00003 	mov	r0, r3
    8de4:	e24bd004 	sub	sp, fp, #4
    8de8:	e8bd8800 	pop	{fp, pc}
    8dec:	00009530 	andeq	r9, r0, r0, lsr r5

00008df0 <RPI_MiniUart_ISR>:
    8df0:	e92d4800 	push	{fp, lr}
    8df4:	e28db004 	add	fp, sp, #4
    8df8:	e24dd008 	sub	sp, sp, #8
    8dfc:	e59f30c4 	ldr	r3, [pc, #196]	; 8ec8 <RPI_MiniUart_ISR+0xd8>
    8e00:	e5933000 	ldr	r3, [r3]
    8e04:	e5933008 	ldr	r3, [r3, #8]
    8e08:	e2033004 	and	r3, r3, #4
    8e0c:	e3530000 	cmp	r3, #0
    8e10:	0a000016 	beq	8e70 <RPI_MiniUart_ISR+0x80>
    8e14:	e59f30ac 	ldr	r3, [pc, #172]	; 8ec8 <RPI_MiniUart_ISR+0xd8>
    8e18:	e5933000 	ldr	r3, [r3]
    8e1c:	e5933000 	ldr	r3, [r3]
    8e20:	e50b3008 	str	r3, [fp, #-8]
    8e24:	e59f309c 	ldr	r3, [pc, #156]	; 8ec8 <RPI_MiniUart_ISR+0xd8>
    8e28:	e5933000 	ldr	r3, [r3]
    8e2c:	e51b2008 	ldr	r2, [fp, #-8]
    8e30:	e5832000 	str	r2, [r3]
    8e34:	e59f308c 	ldr	r3, [pc, #140]	; 8ec8 <RPI_MiniUart_ISR+0xd8>
    8e38:	e5933000 	ldr	r3, [r3]
    8e3c:	e59f2084 	ldr	r2, [pc, #132]	; 8ec8 <RPI_MiniUart_ISR+0xd8>
    8e40:	e5922000 	ldr	r2, [r2]
    8e44:	e5922004 	ldr	r2, [r2, #4]
    8e48:	e3822001 	orr	r2, r2, #1
    8e4c:	e5832004 	str	r2, [r3, #4]
    8e50:	e51b3008 	ldr	r3, [fp, #-8]
    8e54:	e6ef3073 	uxtb	r3, r3
    8e58:	e54b3009 	strb	r3, [fp, #-9]
    8e5c:	e24b3009 	sub	r3, fp, #9
    8e60:	e3a02001 	mov	r2, #1
    8e64:	e1a01003 	mov	r1, r3
    8e68:	e59f005c 	ldr	r0, [pc, #92]	; 8ecc <RPI_MiniUart_ISR+0xdc>
    8e6c:	eb0000be 	bl	916c <fifo_write>
    8e70:	e59f3050 	ldr	r3, [pc, #80]	; 8ec8 <RPI_MiniUart_ISR+0xd8>
    8e74:	e5933000 	ldr	r3, [r3]
    8e78:	e5933008 	ldr	r3, [r3, #8]
    8e7c:	e2033002 	and	r3, r3, #2
    8e80:	e3530000 	cmp	r3, #0
    8e84:	0a00000c 	beq	8ebc <RPI_MiniUart_ISR+0xcc>
    8e88:	e59f3038 	ldr	r3, [pc, #56]	; 8ec8 <RPI_MiniUart_ISR+0xd8>
    8e8c:	e5933000 	ldr	r3, [r3]
    8e90:	e5933014 	ldr	r3, [r3, #20]
    8e94:	e2033040 	and	r3, r3, #64	; 0x40
    8e98:	e3530000 	cmp	r3, #0
    8e9c:	0a000006 	beq	8ebc <RPI_MiniUart_ISR+0xcc>
    8ea0:	e59f3020 	ldr	r3, [pc, #32]	; 8ec8 <RPI_MiniUart_ISR+0xd8>
    8ea4:	e5933000 	ldr	r3, [r3]
    8ea8:	e59f2018 	ldr	r2, [pc, #24]	; 8ec8 <RPI_MiniUart_ISR+0xd8>
    8eac:	e5922000 	ldr	r2, [r2]
    8eb0:	e5922004 	ldr	r2, [r2, #4]
    8eb4:	e3c22001 	bic	r2, r2, #1
    8eb8:	e5832004 	str	r2, [r3, #4]
    8ebc:	e320f000 	nop	{0}
    8ec0:	e24bd004 	sub	sp, fp, #4
    8ec4:	e8bd8800 	pop	{fp, pc}
    8ec8:	00009450 	andeq	r9, r0, r0, asr r4
    8ecc:	00009530 	andeq	r9, r0, r0, lsr r5

00008ed0 <shell_main>:
    8ed0:	e92d4800 	push	{fp, lr}
    8ed4:	e28db004 	add	fp, sp, #4
    8ed8:	e24dd018 	sub	sp, sp, #24
    8edc:	ebffff1d 	bl	8b58 <RPI_GetMiniUart>
    8ee0:	e50b0010 	str	r0, [fp, #-16]
    8ee4:	e24b301c 	sub	r3, fp, #28
    8ee8:	e50b300c 	str	r3, [fp, #-12]
    8eec:	e59f007c 	ldr	r0, [pc, #124]	; 8f70 <shell_main+0xa0>
    8ef0:	ebffff9e 	bl	8d70 <RPI_printString>
    8ef4:	e3a03000 	mov	r3, #0
    8ef8:	e50b3008 	str	r3, [fp, #-8]
    8efc:	ea000015 	b	8f58 <shell_main+0x88>
    8f00:	e320f000 	nop	{0}
    8f04:	e51b3010 	ldr	r3, [fp, #-16]
    8f08:	e5933014 	ldr	r3, [r3, #20]
    8f0c:	e2033001 	and	r3, r3, #1
    8f10:	e3530000 	cmp	r3, #0
    8f14:	0afffffa 	beq	8f04 <shell_main+0x34>
    8f18:	e51b3010 	ldr	r3, [fp, #-16]
    8f1c:	e5933000 	ldr	r3, [r3]
    8f20:	e6ef2073 	uxtb	r2, r3
    8f24:	e51b300c 	ldr	r3, [fp, #-12]
    8f28:	e5c32000 	strb	r2, [r3]
    8f2c:	e51b300c 	ldr	r3, [fp, #-12]
    8f30:	e5d33000 	ldrb	r3, [r3]
    8f34:	e1a02003 	mov	r2, r3
    8f38:	e51b3010 	ldr	r3, [fp, #-16]
    8f3c:	e5832000 	str	r2, [r3]
    8f40:	e51b300c 	ldr	r3, [fp, #-12]
    8f44:	e2833001 	add	r3, r3, #1
    8f48:	e50b300c 	str	r3, [fp, #-12]
    8f4c:	e51b3008 	ldr	r3, [fp, #-8]
    8f50:	e2833001 	add	r3, r3, #1
    8f54:	e50b3008 	str	r3, [fp, #-8]
    8f58:	e51b3008 	ldr	r3, [fp, #-8]
    8f5c:	e3530009 	cmp	r3, #9
    8f60:	daffffe6 	ble	8f00 <shell_main+0x30>
    8f64:	e59f0008 	ldr	r0, [pc, #8]	; 8f74 <shell_main+0xa4>
    8f68:	ebffff80 	bl	8d70 <RPI_printString>
    8f6c:	eaffffde 	b	8eec <shell_main+0x1c>
    8f70:	00009454 	andeq	r9, r0, r4, asr r4
    8f74:	00009478 	andeq	r9, r0, r8, ror r4

00008f78 <SVC_Handler_Main>:
    8f78:	e92d4800 	push	{fp, lr}
    8f7c:	e28db004 	add	fp, sp, #4
    8f80:	e24dd020 	sub	sp, sp, #32
    8f84:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
    8f88:	e50b1024 	str	r1, [fp, #-36]	; 0xffffffdc
    8f8c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    8f90:	e3530000 	cmp	r3, #0
    8f94:	1a00000e 	bne	8fd4 <SVC_Handler_Main+0x5c>
    8f98:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    8f9c:	e5933000 	ldr	r3, [r3]
    8fa0:	e50b3008 	str	r3, [fp, #-8]
    8fa4:	ebfffeeb 	bl	8b58 <RPI_GetMiniUart>
    8fa8:	e50b000c 	str	r0, [fp, #-12]
    8fac:	e320f000 	nop	{0}
    8fb0:	e51b300c 	ldr	r3, [fp, #-12]
    8fb4:	e5933014 	ldr	r3, [r3, #20]
    8fb8:	e2033020 	and	r3, r3, #32
    8fbc:	e3530000 	cmp	r3, #0
    8fc0:	0afffffa 	beq	8fb0 <SVC_Handler_Main+0x38>
    8fc4:	e51b300c 	ldr	r3, [fp, #-12]
    8fc8:	e51b2008 	ldr	r2, [fp, #-8]
    8fcc:	e5832000 	str	r2, [r3]
    8fd0:	ea000019 	b	903c <SVC_Handler_Main+0xc4>
    8fd4:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    8fd8:	e3530001 	cmp	r3, #1
    8fdc:	1a000010 	bne	9024 <SVC_Handler_Main+0xac>
    8fe0:	ebfffd75 	bl	85bc <getRunningProcess>
    8fe4:	e50b0010 	str	r0, [fp, #-16]
    8fe8:	ebfffd7c 	bl	85e0 <getNextProcess>
    8fec:	e50b0014 	str	r0, [fp, #-20]	; 0xffffffec
    8ff0:	e51b3010 	ldr	r3, [fp, #-16]
    8ff4:	e3a02002 	mov	r2, #2
    8ff8:	e5832044 	str	r2, [r3, #68]	; 0x44
    8ffc:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    9000:	e3a02001 	mov	r2, #1
    9004:	e5832044 	str	r2, [r3, #68]	; 0x44
    9008:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
    900c:	ebfffd5e 	bl	858c <setRunningProcess>
    9010:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    9014:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
    9018:	e51b0010 	ldr	r0, [fp, #-16]
    901c:	eb0000af 	bl	92e0 <_context_switch>
    9020:	ea000005 	b	903c <SVC_Handler_Main+0xc4>
    9024:	e3a03033 	mov	r3, #51	; 0x33
    9028:	e54b3015 	strb	r3, [fp, #-21]	; 0xffffffeb
    902c:	e55b3015 	ldrb	r3, [fp, #-21]	; 0xffffffeb
    9030:	e1a00003 	mov	r0, r3
    9034:	ebffff1f 	bl	8cb8 <RPI_WriteToMiniUart>
    9038:	eafffffb 	b	902c <SVC_Handler_Main+0xb4>
    903c:	e24bd004 	sub	sp, fp, #4
    9040:	e8bd8800 	pop	{fp, pc}

00009044 <fifo_init>:
    9044:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    9048:	e28db000 	add	fp, sp, #0
    904c:	e24dd00c 	sub	sp, sp, #12
    9050:	e50b0008 	str	r0, [fp, #-8]
    9054:	e51b3008 	ldr	r3, [fp, #-8]
    9058:	e3a02000 	mov	r2, #0
    905c:	e583200c 	str	r2, [r3, #12]
    9060:	e51b3008 	ldr	r3, [fp, #-8]
    9064:	e3a02000 	mov	r2, #0
    9068:	e5832010 	str	r2, [r3, #16]
    906c:	e51b3008 	ldr	r3, [fp, #-8]
    9070:	e3a0200a 	mov	r2, #10
    9074:	e5832014 	str	r2, [r3, #20]
    9078:	e320f000 	nop	{0}
    907c:	e28bd000 	add	sp, fp, #0
    9080:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    9084:	e12fff1e 	bx	lr

00009088 <fifo_read>:
    9088:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    908c:	e28db000 	add	fp, sp, #0
    9090:	e24dd01c 	sub	sp, sp, #28
    9094:	e50b0010 	str	r0, [fp, #-16]
    9098:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    909c:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    90a0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    90a4:	e50b300c 	str	r3, [fp, #-12]
    90a8:	e3a03000 	mov	r3, #0
    90ac:	e50b3008 	str	r3, [fp, #-8]
    90b0:	ea000024 	b	9148 <fifo_read+0xc0>
    90b4:	e51b3010 	ldr	r3, [fp, #-16]
    90b8:	e5932010 	ldr	r2, [r3, #16]
    90bc:	e51b3010 	ldr	r3, [fp, #-16]
    90c0:	e593300c 	ldr	r3, [r3, #12]
    90c4:	e1520003 	cmp	r2, r3
    90c8:	0a000019 	beq	9134 <fifo_read+0xac>
    90cc:	e51b300c 	ldr	r3, [fp, #-12]
    90d0:	e2832001 	add	r2, r3, #1
    90d4:	e50b200c 	str	r2, [fp, #-12]
    90d8:	e51b2010 	ldr	r2, [fp, #-16]
    90dc:	e5922010 	ldr	r2, [r2, #16]
    90e0:	e51b1010 	ldr	r1, [fp, #-16]
    90e4:	e7d12002 	ldrb	r2, [r1, r2]
    90e8:	e5c32000 	strb	r2, [r3]
    90ec:	e51b3010 	ldr	r3, [fp, #-16]
    90f0:	e5933010 	ldr	r3, [r3, #16]
    90f4:	e2832001 	add	r2, r3, #1
    90f8:	e51b3010 	ldr	r3, [fp, #-16]
    90fc:	e5832010 	str	r2, [r3, #16]
    9100:	e51b3010 	ldr	r3, [fp, #-16]
    9104:	e5932010 	ldr	r2, [r3, #16]
    9108:	e51b3010 	ldr	r3, [fp, #-16]
    910c:	e5933014 	ldr	r3, [r3, #20]
    9110:	e1520003 	cmp	r2, r3
    9114:	1a000002 	bne	9124 <fifo_read+0x9c>
    9118:	e51b3010 	ldr	r3, [fp, #-16]
    911c:	e3a02000 	mov	r2, #0
    9120:	e5832010 	str	r2, [r3, #16]
    9124:	e51b3008 	ldr	r3, [fp, #-8]
    9128:	e2833001 	add	r3, r3, #1
    912c:	e50b3008 	str	r3, [fp, #-8]
    9130:	ea000001 	b	913c <fifo_read+0xb4>
    9134:	e51b3008 	ldr	r3, [fp, #-8]
    9138:	ea000007 	b	915c <fifo_read+0xd4>
    913c:	e51b3008 	ldr	r3, [fp, #-8]
    9140:	e2833001 	add	r3, r3, #1
    9144:	e50b3008 	str	r3, [fp, #-8]
    9148:	e51b2008 	ldr	r2, [fp, #-8]
    914c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9150:	e1520003 	cmp	r2, r3
    9154:	baffffd6 	blt	90b4 <fifo_read+0x2c>
    9158:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    915c:	e1a00003 	mov	r0, r3
    9160:	e28bd000 	add	sp, fp, #0
    9164:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    9168:	e12fff1e 	bx	lr

0000916c <fifo_write>:
    916c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    9170:	e28db000 	add	fp, sp, #0
    9174:	e24dd01c 	sub	sp, sp, #28
    9178:	e50b0010 	str	r0, [fp, #-16]
    917c:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    9180:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    9184:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    9188:	e50b300c 	str	r3, [fp, #-12]
    918c:	e3a03000 	mov	r3, #0
    9190:	e50b3008 	str	r3, [fp, #-8]
    9194:	ea00002c 	b	924c <fifo_write+0xe0>
    9198:	e51b3010 	ldr	r3, [fp, #-16]
    919c:	e593300c 	ldr	r3, [r3, #12]
    91a0:	e2832001 	add	r2, r3, #1
    91a4:	e51b3010 	ldr	r3, [fp, #-16]
    91a8:	e5933010 	ldr	r3, [r3, #16]
    91ac:	e1520003 	cmp	r2, r3
    91b0:	0a00000a 	beq	91e0 <fifo_write+0x74>
    91b4:	e51b3010 	ldr	r3, [fp, #-16]
    91b8:	e593300c 	ldr	r3, [r3, #12]
    91bc:	e2832001 	add	r2, r3, #1
    91c0:	e51b3010 	ldr	r3, [fp, #-16]
    91c4:	e5933014 	ldr	r3, [r3, #20]
    91c8:	e1520003 	cmp	r2, r3
    91cc:	1a000005 	bne	91e8 <fifo_write+0x7c>
    91d0:	e51b3010 	ldr	r3, [fp, #-16]
    91d4:	e5933010 	ldr	r3, [r3, #16]
    91d8:	e3530000 	cmp	r3, #0
    91dc:	1a000001 	bne	91e8 <fifo_write+0x7c>
    91e0:	e51b3008 	ldr	r3, [fp, #-8]
    91e4:	ea00001d 	b	9260 <fifo_write+0xf4>
    91e8:	e51b3010 	ldr	r3, [fp, #-16]
    91ec:	e593200c 	ldr	r2, [r3, #12]
    91f0:	e51b300c 	ldr	r3, [fp, #-12]
    91f4:	e2831001 	add	r1, r3, #1
    91f8:	e50b100c 	str	r1, [fp, #-12]
    91fc:	e5d31000 	ldrb	r1, [r3]
    9200:	e51b3010 	ldr	r3, [fp, #-16]
    9204:	e7c31002 	strb	r1, [r3, r2]
    9208:	e51b3010 	ldr	r3, [fp, #-16]
    920c:	e593300c 	ldr	r3, [r3, #12]
    9210:	e2832001 	add	r2, r3, #1
    9214:	e51b3010 	ldr	r3, [fp, #-16]
    9218:	e583200c 	str	r2, [r3, #12]
    921c:	e51b3010 	ldr	r3, [fp, #-16]
    9220:	e593200c 	ldr	r2, [r3, #12]
    9224:	e51b3010 	ldr	r3, [fp, #-16]
    9228:	e5933014 	ldr	r3, [r3, #20]
    922c:	e1520003 	cmp	r2, r3
    9230:	1a000002 	bne	9240 <fifo_write+0xd4>
    9234:	e51b3010 	ldr	r3, [fp, #-16]
    9238:	e3a02000 	mov	r2, #0
    923c:	e583200c 	str	r2, [r3, #12]
    9240:	e51b3008 	ldr	r3, [fp, #-8]
    9244:	e2833001 	add	r3, r3, #1
    9248:	e50b3008 	str	r3, [fp, #-8]
    924c:	e51b2008 	ldr	r2, [fp, #-8]
    9250:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9254:	e1520003 	cmp	r2, r3
    9258:	baffffce 	blt	9198 <fifo_write+0x2c>
    925c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9260:	e1a00003 	mov	r0, r3
    9264:	e28bd000 	add	sp, fp, #0
    9268:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    926c:	e12fff1e 	bx	lr

00009270 <printChar>:
    9270:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    9274:	e28db000 	add	fp, sp, #0
    9278:	e24dd00c 	sub	sp, sp, #12
    927c:	e1a03000 	mov	r3, r0
    9280:	e54b3005 	strb	r3, [fp, #-5]
    9284:	ef000000 	svc	0x00000000
    9288:	e320f000 	nop	{0}
    928c:	e28bd000 	add	sp, fp, #0
    9290:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    9294:	e12fff1e 	bx	lr

00009298 <printString>:
    9298:	e92d4800 	push	{fp, lr}
    929c:	e28db004 	add	fp, sp, #4
    92a0:	e24dd008 	sub	sp, sp, #8
    92a4:	e50b0008 	str	r0, [fp, #-8]
    92a8:	ea000005 	b	92c4 <printString+0x2c>
    92ac:	e51b3008 	ldr	r3, [fp, #-8]
    92b0:	e2832001 	add	r2, r3, #1
    92b4:	e50b2008 	str	r2, [fp, #-8]
    92b8:	e5d33000 	ldrb	r3, [r3]
    92bc:	e1a00003 	mov	r0, r3
    92c0:	ebffffea 	bl	9270 <printChar>
    92c4:	e51b3008 	ldr	r3, [fp, #-8]
    92c8:	e5d33000 	ldrb	r3, [r3]
    92cc:	e3530000 	cmp	r3, #0
    92d0:	1afffff5 	bne	92ac <printString+0x14>
    92d4:	e320f000 	nop	{0}
    92d8:	e24bd004 	sub	sp, fp, #4
    92dc:	e8bd8800 	pop	{fp, pc}

000092e0 <_context_switch>:
    92e0:	e14f3000 	mrs	r3, SPSR
    92e4:	e4803004 	str	r3, [r0], #4
    92e8:	e92d0003 	push	{r0, r1}
    92ec:	e1a0e002 	mov	lr, r2
    92f0:	e8be1fff 	ldm	lr!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip}
    92f4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    92f8:	e59de004 	ldr	lr, [sp, #4]
    92fc:	e8ce7fff 	stmia	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
    9300:	e28ee03c 	add	lr, lr, #60	; 0x3c
    9304:	e59d0000 	ldr	r0, [sp]
    9308:	e5901000 	ldr	r1, [r0]
    930c:	e58e1000 	str	r1, [lr]
    9310:	e59de008 	ldr	lr, [sp, #8]
    9314:	e49e0004 	ldr	r0, [lr], #4
    9318:	e161f000 	msr	SPSR_c, r0
    931c:	e8de7fff 	ldm	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
    9320:	e28ee03c 	add	lr, lr, #60	; 0x3c
    9324:	e59dd000 	ldr	sp, [sp]
    9328:	e28dd004 	add	sp, sp, #4
    932c:	e59ee000 	ldr	lr, [lr]
    9330:	e1b0f00e 	movs	pc, lr

00009334 <_start_user_process>:
    9334:	e1a0e000 	mov	lr, r0
    9338:	e49e0004 	ldr	r0, [lr], #4
    933c:	e161f000 	msr	SPSR_c, r0
    9340:	e8de7fff 	ldm	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
    9344:	e28ee03c 	add	lr, lr, #60	; 0x3c
    9348:	e59ee000 	ldr	lr, [lr]
    934c:	e1b0f00e 	movs	pc, lr

00009350 <_svc_handler>:
    9350:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
    9354:	e51e0004 	ldr	r0, [lr, #-4]
    9358:	e3c004ff 	bic	r0, r0, #-16777216	; 0xff000000
    935c:	e1a0100d 	mov	r1, sp
    9360:	e3500002 	cmp	r0, #2
    9364:	dbffff03 	blle	8f78 <SVC_Handler_Main>
    9368:	e8bd5fff 	pop	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
    936c:	e1b0f00e 	movs	pc, lr

Disassembly of section .rodata:

00009370 <.rodata>:
    9370:	68540a0d 	ldmdavs	r4, {r0, r2, r3, r9, fp}^
    9374:	69207369 	stmdbvs	r0!, {r0, r3, r5, r6, r8, r9, ip, sp, lr}
    9378:	72662073 	rsbvc	r2, r6, #115	; 0x73
    937c:	70206d6f 	eorvc	r6, r0, pc, ror #26
    9380:	65636f72 	strbvs	r6, [r3, #-3954]!	; 0xfffff08e
    9384:	31207373 			; <UNDEFINED> instruction: 0x31207373
    9388:	0000002e 	andeq	r0, r0, lr, lsr #32
    938c:	72500a0d 	subsvc	r0, r0, #53248	; 0xd000
    9390:	7365636f 	cmnvc	r5, #-1140850687	; 0xbc000001
    9394:	20312073 	eorscs	r2, r1, r3, ror r0
    9398:	65646e65 	strbvs	r6, [r4, #-3685]!	; 0xfffff19b
    939c:	00002e64 	andeq	r2, r0, r4, ror #28
    93a0:	68540a0d 	ldmdavs	r4, {r0, r2, r3, r9, fp}^
    93a4:	69207369 	stmdbvs	r0!, {r0, r3, r5, r6, r8, r9, ip, sp, lr}
    93a8:	72662073 	rsbvc	r2, r6, #115	; 0x73
    93ac:	70206d6f 	eorvc	r6, r0, pc, ror #26
    93b0:	65636f72 	strbvs	r6, [r3, #-3954]!	; 0xfffff08e
    93b4:	32207373 	eorcc	r7, r0, #-872415231	; 0xcc000001
    93b8:	0000002e 	andeq	r0, r0, lr, lsr #32
    93bc:	72500a0d 	subsvc	r0, r0, #53248	; 0xd000
    93c0:	7365636f 	cmnvc	r5, #-1140850687	; 0xbc000001
    93c4:	20322073 	eorscs	r2, r2, r3, ror r0
    93c8:	65646e65 	strbvs	r6, [r4, #-3685]!	; 0xfffff19b
    93cc:	00002e64 	andeq	r2, r0, r4, ror #28
    93d0:	72430a0d 	subvc	r0, r3, #53248	; 0xd000
    93d4:	69746165 	ldmdbvs	r4!, {r0, r2, r5, r6, r8, sp, lr}^
    93d8:	4e20676e 	cdpmi	7, 2, cr6, cr0, cr14, {3}
    93dc:	50207765 	eorpl	r7, r0, r5, ror #14
    93e0:	65636f72 	strbvs	r6, [r3, #-3954]!	; 0xfffff08e
    93e4:	00007373 	andeq	r7, r0, r3, ror r3
    93e8:	74530a0d 	ldrbvc	r0, [r3], #-2573	; 0xfffff5f3
    93ec:	69747261 	ldmdbvs	r4!, {r0, r5, r6, r9, ip, sp, lr}^
    93f0:	5520676e 	strpl	r6, [r0, #-1902]!	; 0xfffff892
    93f4:	20726573 	rsbscs	r6, r2, r3, ror r5
    93f8:	676f7250 			; <UNDEFINED> instruction: 0x676f7250
    93fc:	006d6172 	rsbeq	r6, sp, r2, ror r1
    9400:	6f4e0a0d 	svcvs	0x004e0a0d
    9404:	61707320 	cmnvs	r0, r0, lsr #6
    9408:	6f206563 	svcvs	0x00206563
    940c:	6370206e 	cmnvs	r0, #110	; 0x6e
    9410:	Address 0x0000000000009410 is out of bounds.


Disassembly of section .data:

00009414 <__data_start>:
    9414:	00005000 	andeq	r5, r0, r0

00009418 <block_limit>:
    9418:	00005000 	andeq	r5, r0, r0

0000941c <s_block_bucket>:
    941c:	00000040 	andeq	r0, r0, r0, asr #32
    9420:	00000000 	andeq	r0, r0, r0
    9424:	00000400 	andeq	r0, r0, r0, lsl #8
    9428:	00000000 	andeq	r0, r0, r0
    942c:	00001000 	andeq	r1, r0, r0
    9430:	00000000 	andeq	r0, r0, r0
    9434:	00002000 	andeq	r2, r0, r0
    9438:	00000000 	andeq	r0, r0, r0

0000943c <rpiArmTimer>:
    943c:	2000b400 	andcs	fp, r0, r0, lsl #8

00009440 <rpiGpio>:
    9440:	20200000 	eorcs	r0, r0, r0

00009444 <rpiIRQController>:
    9444:	2000b200 	andcs	fp, r0, r0, lsl #4

00009448 <rpiSystemTimer>:
    9448:	20003000 	andcs	r3, r0, r0

0000944c <rpiAux>:
    944c:	20215000 	eorcs	r5, r1, r0

00009450 <rpiMiniUart>:
    9450:	20215040 	eorcs	r5, r1, r0, asr #32

00009454 <enter_command_text.6883>:
    9454:	65746e45 	ldrbvs	r6, [r4, #-3653]!	; 0xfffff1bb
    9458:	6f632072 	svcvs	0x00632072
    945c:	6e616d6d 	cdpvs	13, 6, cr6, cr1, cr13, {3}
    9460:	61282064 			; <UNDEFINED> instruction: 0x61282064
    9464:	6520646e 	strvs	r6, [r0, #-1134]!	; 0xfffffb92
    9468:	7720646e 	strvc	r6, [r0, -lr, ror #8]!
    946c:	20687469 	rsbcs	r7, r8, r9, ror #8
    9470:	203a293b 	eorscs	r2, sl, fp, lsr r9
    9474:	00000000 	andeq	r0, r0, r0

00009478 <command_not_found_text.6882>:
    9478:	206f4e0a 	rsbcs	r4, pc, sl, lsl #28
    947c:	68637573 	stmdavs	r3!, {r0, r1, r4, r5, r6, r8, sl, ip, sp, lr}^
    9480:	6d6f6320 	stclvs	3, cr6, [pc, #-128]!	; 9408 <_svc_handler+0xb8>
    9484:	646e616d 	strbtvs	r6, [lr], #-365	; 0xfffffe93
    9488:	756f6620 	strbvc	r6, [pc, #-1568]!	; 8e70 <RPI_MiniUart_ISR+0x80>
    948c:	0d2e646e 	cfstrseq	mvf6, [lr, #-440]!	; 0xfffffe48
    9490:	Address 0x0000000000009490 is out of bounds.


Disassembly of section .bss:

00009494 <pcb>:
	...

00009524 <current_running_proc>:
    9524:	00000000 	andeq	r0, r0, r0

00009528 <msCounter.5513>:
    9528:	00000000 	andeq	r0, r0, r0

0000952c <lit.5512>:
    952c:	00000000 	andeq	r0, r0, r0

00009530 <fifo_buffer>:
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
  34:	0000010c 	andeq	r0, r0, ip, lsl #2
	...
  40:	0000001c 	andeq	r0, r0, ip, lsl r0
  44:	01b00002 	movseq	r0, r2
  48:	00040000 	andeq	r0, r4, r0
  4c:	00000000 	andeq	r0, r0, r0
  50:	0000820c 	andeq	r8, r0, ip, lsl #4
  54:	0000018c 	andeq	r0, r0, ip, lsl #3
	...
  60:	0000001c 	andeq	r0, r0, ip, lsl r0
  64:	043e0002 	ldrteq	r0, [lr], #-2
  68:	00040000 	andeq	r0, r4, r0
  6c:	00000000 	andeq	r0, r0, r0
  70:	00008398 	muleq	r0, r8, r3
  74:	0000015c 	andeq	r0, r0, ip, asr r1
	...
  80:	0000001c 	andeq	r0, r0, ip, lsl r0
  84:	06230002 	strteq	r0, [r3], -r2
  88:	00040000 	andeq	r0, r4, r0
  8c:	00000000 	andeq	r0, r0, r0
  90:	000084f4 	strdeq	r8, [r0], -r4
  94:	000001e8 	andeq	r0, r0, r8, ror #3
	...
  a0:	0000001c 	andeq	r0, r0, ip, lsl r0
  a4:	08fa0002 	ldmeq	sl!, {r1}^
  a8:	00040000 	andeq	r0, r4, r0
  ac:	00000000 	andeq	r0, r0, r0
  b0:	000086dc 	ldrdeq	r8, [r0], -ip
  b4:	0000003c 	andeq	r0, r0, ip, lsr r0
	...
  c0:	0000001c 	andeq	r0, r0, ip, lsl r0
  c4:	0a3a0002 	beq	e800d4 <_stack+0xe000d4>
  c8:	00040000 	andeq	r0, r4, r0
  cc:	00000000 	andeq	r0, r0, r0
  d0:	00008718 	andeq	r8, r0, r8, lsl r7
  d4:	00000158 	andeq	r0, r0, r8, asr r1
	...
  e0:	0000001c 	andeq	r0, r0, ip, lsl r0
  e4:	0f180002 	svceq	0x00180002
  e8:	00040000 	andeq	r0, r4, r0
  ec:	00000000 	andeq	r0, r0, r0
  f0:	00008870 	andeq	r8, r0, r0, ror r8
  f4:	00000248 	andeq	r0, r0, r8, asr #4
	...
 100:	0000001c 	andeq	r0, r0, ip, lsl r0
 104:	11570002 	cmpne	r7, r2
 108:	00040000 	andeq	r0, r4, r0
 10c:	00000000 	andeq	r0, r0, r0
 110:	00008ab8 			; <UNDEFINED> instruction: 0x00008ab8
 114:	0000007c 	andeq	r0, r0, ip, ror r0
	...
 120:	0000001c 	andeq	r0, r0, ip, lsl r0
 124:	129e0002 	addsne	r0, lr, #2
 128:	00040000 	andeq	r0, r4, r0
 12c:	00000000 	andeq	r0, r0, r0
 130:	00008b34 	andeq	r8, r0, r4, lsr fp
 134:	0000039c 	muleq	r0, ip, r3
	...
 140:	0000001c 	andeq	r0, r0, ip, lsl r0
 144:	19950002 	ldmibne	r5, {r1}
 148:	00040000 	andeq	r0, r4, r0
 14c:	00000000 	andeq	r0, r0, r0
 150:	00008ed0 	ldrdeq	r8, [r0], -r0
 154:	000000a8 	andeq	r0, r0, r8, lsr #1
	...
 160:	0000001c 	andeq	r0, r0, ip, lsl r0
 164:	238c0002 	orrcs	r0, ip, #2
 168:	00040000 	andeq	r0, r4, r0
 16c:	00000000 	andeq	r0, r0, r0
 170:	00008f78 	andeq	r8, r0, r8, ror pc
 174:	000000cc 	andeq	r0, r0, ip, asr #1
	...
 180:	0000001c 	andeq	r0, r0, ip, lsl r0
 184:	26780002 	ldrbtcs	r0, [r8], -r2
 188:	00040000 	andeq	r0, r4, r0
 18c:	00000000 	andeq	r0, r0, r0
 190:	00009044 	andeq	r9, r0, r4, asr #32
 194:	0000022c 	andeq	r0, r0, ip, lsr #4
	...
 1a0:	0000001c 	andeq	r0, r0, ip, lsl r0
 1a4:	28380002 	ldmdacs	r8!, {r1}
 1a8:	00040000 	andeq	r0, r4, r0
 1ac:	00000000 	andeq	r0, r0, r0
 1b0:	00009270 	andeq	r9, r0, r0, ror r2
 1b4:	00000070 	andeq	r0, r0, r0, ror r0
	...
 1c0:	0000001c 	andeq	r0, r0, ip, lsl r0
 1c4:	28ef0002 	stmiacs	pc!, {r1}^	; <UNPREDICTABLE>
 1c8:	00040000 	andeq	r0, r4, r0
 1cc:	00000000 	andeq	r0, r0, r0
 1d0:	000092e0 	andeq	r9, r0, r0, ror #5
 1d4:	00000070 	andeq	r0, r0, r0, ror r0
	...
 1e0:	0000001c 	andeq	r0, r0, ip, lsl r0
 1e4:	29630002 	stmdbcs	r3!, {r1}^
 1e8:	00040000 	andeq	r0, r4, r0
 1ec:	00000000 	andeq	r0, r0, r0
 1f0:	00008000 	andeq	r8, r0, r0
 1f4:	00000094 	muleq	r0, r4, r0
	...
 200:	0000001c 	andeq	r0, r0, ip, lsl r0
 204:	29d30002 	ldmibcs	r3, {r1}^
 208:	00040000 	andeq	r0, r4, r0
 20c:	00000000 	andeq	r0, r0, r0
 210:	00009350 	andeq	r9, r0, r0, asr r3
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
      98:	01170704 	tsteq	r7, r4, lsl #14
      9c:	04090000 	streq	r0, [r9], #-0
      a0:	0000002c 	andeq	r0, r0, ip, lsr #32
      a4:	00010700 	andeq	r0, r1, r0, lsl #14
      a8:	89000400 	stmdbhi	r0, {sl}
      ac:	04000000 	streq	r0, [r0], #-0
      b0:	00004401 	andeq	r4, r0, r1, lsl #8
      b4:	01450c00 	cmpeq	r5, r0, lsl #24
      b8:	81000000 	mrshi	r0, (UNDEF: 0)
      bc:	010c0000 	mrseq	r0, (UNDEF: 12)
      c0:	00680000 	rsbeq	r0, r8, r0
      c4:	01020000 	mrseq	r0, (UNDEF: 2)
      c8:	0000dc06 	andeq	sp, r0, r6, lsl #24
      cc:	08010200 	stmdaeq	r1, {r9}
      d0:	000000da 	ldrdeq	r0, [r0], -sl
      d4:	3b050202 	blcc	1408e4 <_stack+0xc08e4>
      d8:	02000001 	andeq	r0, r0, #1
      dc:	00e80702 	rsceq	r0, r8, r2, lsl #14
      e0:	04020000 	streq	r0, [r2], #-0
      e4:	00013205 	andeq	r3, r1, r5, lsl #4
      e8:	07040200 	streq	r0, [r4, -r0, lsl #4]
      ec:	00000112 	andeq	r0, r0, r2, lsl r1
      f0:	2d050802 	stccs	8, cr0, [r5, #-8]
      f4:	02000001 	andeq	r0, r0, #1
      f8:	010d0708 	tsteq	sp, r8, lsl #14
      fc:	04030000 	streq	r0, [r3], #-0
     100:	746e6905 	strbtvc	r6, [lr], #-2309	; 0xfffff6fb
     104:	07040200 	streq	r0, [r4, -r0, lsl #4]
     108:	00000117 	andeq	r0, r0, r7, lsl r1
     10c:	0000c804 	andeq	ip, r0, r4, lsl #16
     110:	901c0100 	andsls	r0, ip, r0, lsl #2
     114:	7c000081 	stcvc	0, cr0, [r0], {129}	; 0x81
     118:	01000000 	mrseq	r0, (UNDEF: 0)
     11c:	0000999c 	muleq	r0, ip, r9
     120:	01030500 	tsteq	r3, r0, lsl #10
     124:	1e010000 	cdpne	0, 0, cr0, cr1, cr0, {0}
     128:	00000099 	muleq	r0, r9, r0
     12c:	055c9102 	ldrbeq	r9, [ip, #-258]	; 0xfffffefe
     130:	00000170 	andeq	r0, r0, r0, ror r1
     134:	00b71f01 	adcseq	r1, r7, r1, lsl #30
     138:	91020000 	mrsls	r0, (UNDEF: 2)
     13c:	b0060048 	andlt	r0, r6, r8, asr #32
     140:	a9000000 	stmdbge	r0, {}	; <UNPREDICTABLE>
     144:	07000000 	streq	r0, [r0, -r0]
     148:	000000a9 	andeq	r0, r0, r9, lsr #1
     14c:	04020019 	streq	r0, [r2], #-25	; 0xffffffe7
     150:	00012407 	andeq	r2, r1, r7, lsl #8
     154:	08010200 	stmdaeq	r1, {r9}
     158:	000000e3 	andeq	r0, r0, r3, ror #1
     15c:	0000b006 	andeq	fp, r0, r6
     160:	0000c700 	andeq	ip, r0, r0, lsl #14
     164:	00a90700 	adceq	r0, r9, r0, lsl #14
     168:	00120000 	andseq	r0, r2, r0
     16c:	0000b604 	andeq	fp, r0, r4, lsl #12
     170:	140f0100 	strne	r0, [pc], #-256	; 178 <CPSR_IRQ_INHIBIT+0xf8>
     174:	7c000081 	stcvc	0, cr0, [r0], {129}	; 0x81
     178:	01000000 	mrseq	r0, (UNDEF: 0)
     17c:	0000f99c 	muleq	r0, ip, r9
     180:	01030500 	tsteq	r3, r0, lsl #10
     184:	11010000 	mrsne	r0, (UNDEF: 1)
     188:	00000099 	muleq	r0, r9, r0
     18c:	055c9102 	ldrbeq	r9, [ip, #-258]	; 0xfffffefe
     190:	00000170 	andeq	r0, r0, r0, ror r1
     194:	00b71201 	adcseq	r1, r7, r1, lsl #4
     198:	91020000 	mrsls	r0, (UNDEF: 2)
     19c:	fb080048 	blx	2002c6 <_stack+0x1802c6>
     1a0:	01000000 	mrseq	r0, (UNDEF: 0)
     1a4:	00810007 	addeq	r0, r1, r7
     1a8:	00001400 	andeq	r1, r0, r0, lsl #8
     1ac:	009c0100 	addseq	r0, ip, r0, lsl #2
     1b0:	0000028a 	andeq	r0, r0, sl, lsl #5
     1b4:	01040004 	tsteq	r4, r4
     1b8:	01040000 	mrseq	r0, (UNDEF: 4)
     1bc:	00000044 	andeq	r0, r0, r4, asr #32
     1c0:	0001bb0c 	andeq	fp, r1, ip, lsl #22
     1c4:	00820c00 	addeq	r0, r2, r0, lsl #24
     1c8:	00018c00 	andeq	r8, r1, r0, lsl #24
     1cc:	0000dd00 	andeq	sp, r0, r0, lsl #26
     1d0:	06010200 	streq	r0, [r1], -r0, lsl #4
     1d4:	000000dc 	ldrdeq	r0, [r0], -ip
     1d8:	da080102 	ble	2005e8 <_stack+0x1805e8>
     1dc:	02000000 	andeq	r0, r0, #0
     1e0:	013b0502 	teqeq	fp, r2, lsl #10
     1e4:	02020000 	andeq	r0, r2, #0
     1e8:	0000e807 	andeq	lr, r0, r7, lsl #16
     1ec:	05040200 	streq	r0, [r4, #-512]	; 0xfffffe00
     1f0:	00000132 	andeq	r0, r0, r2, lsr r1
     1f4:	0001b003 	andeq	fp, r1, r3
     1f8:	4f410200 	svcmi	0x00410200
     1fc:	02000000 	andeq	r0, r0, #0
     200:	01120704 	tsteq	r2, r4, lsl #14
     204:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
     208:	00012d05 	andeq	r2, r1, r5, lsl #26
     20c:	07080200 	streq	r0, [r8, -r0, lsl #4]
     210:	0000010d 	andeq	r0, r0, sp, lsl #2
     214:	69050404 	stmdbvs	r5, {r2, sl}
     218:	0200746e 	andeq	r7, r0, #1845493760	; 0x6e000000
     21c:	01170704 	tsteq	r7, r4, lsl #14
     220:	b2030000 	andlt	r0, r3, #0
     224:	03000001 	movweq	r0, #1
     228:	00004430 	andeq	r4, r0, r0, lsr r4
     22c:	00720500 	rsbseq	r0, r2, r0, lsl #10
     230:	82030000 	andhi	r0, r3, #0
     234:	04000001 	streq	r0, [r0], #-1
     238:	00007d12 	andeq	r7, r0, r2, lsl sp
     23c:	07040200 	streq	r0, [r4, -r0, lsl #4]
     240:	00000124 	andeq	r0, r0, r4, lsr #2
     244:	e3080102 	movw	r0, #33026	; 0x8102
     248:	06000000 	streq	r0, [r0], -r0
     24c:	360c0534 			; <UNDEFINED> instruction: 0x360c0534
     250:	07000001 	streq	r0, [r0, -r1]
     254:	05003072 	streq	r3, [r0, #-114]	; 0xffffff8e
     258:	0000820d 	andeq	r8, r0, sp, lsl #4
     25c:	72070000 	andvc	r0, r7, #0
     260:	0e050031 	mcreq	0, 0, r0, cr5, cr1, {1}
     264:	00000082 	andeq	r0, r0, r2, lsl #1
     268:	32720704 	rsbscc	r0, r2, #4, 14	; 0x100000
     26c:	820f0500 	andhi	r0, pc, #0, 10
     270:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
     274:	00337207 	eorseq	r7, r3, r7, lsl #4
     278:	00821005 	addeq	r1, r2, r5
     27c:	070c0000 	streq	r0, [ip, -r0]
     280:	05003472 	streq	r3, [r0, #-1138]	; 0xfffffb8e
     284:	00008211 	andeq	r8, r0, r1, lsl r2
     288:	72071000 	andvc	r1, r7, #0
     28c:	12050035 	andne	r0, r5, #53	; 0x35
     290:	00000082 	andeq	r0, r0, r2, lsl #1
     294:	36720714 			; <UNDEFINED> instruction: 0x36720714
     298:	82130500 	andshi	r0, r3, #0, 10
     29c:	18000000 	stmdane	r0, {}	; <UNPREDICTABLE>
     2a0:	00377207 	eorseq	r7, r7, r7, lsl #4
     2a4:	00821405 	addeq	r1, r2, r5, lsl #8
     2a8:	071c0000 	ldreq	r0, [ip, -r0]
     2ac:	05003872 	streq	r3, [r0, #-2162]	; 0xfffff78e
     2b0:	00008215 	andeq	r8, r0, r5, lsl r2
     2b4:	72072000 	andvc	r2, r7, #0
     2b8:	16050039 			; <UNDEFINED> instruction: 0x16050039
     2bc:	00000082 	andeq	r0, r0, r2, lsl #1
     2c0:	31720724 	cmncc	r2, r4, lsr #14
     2c4:	17050030 	smladxne	r5, r0, r0, r0
     2c8:	00000082 	andeq	r0, r0, r2, lsl #1
     2cc:	31720728 	cmncc	r2, r8, lsr #14
     2d0:	18050031 	stmdane	r5, {r0, r4, r5}
     2d4:	00000082 	andeq	r0, r0, r2, lsl #1
     2d8:	3172072c 	cmncc	r2, ip, lsr #14
     2dc:	19050032 	stmdbne	r5, {r1, r4, r5}
     2e0:	00000082 	andeq	r0, r0, r2, lsl #1
     2e4:	fe030030 	mcr2	0, 0, r0, cr3, cr0, {1}
     2e8:	05000001 	streq	r0, [r0, #-1]
     2ec:	00009b1a 	andeq	r9, r0, sl, lsl fp
     2f0:	05480600 	strbeq	r0, [r8, #-1536]	; 0xfffffa00
     2f4:	00018f1c 	andeq	r8, r1, ip, lsl pc
     2f8:	0deb0800 	stcleq	8, cr0, [fp]
     2fc:	1d050000 	stcne	0, cr0, [r5, #-0]
     300:	00000082 	andeq	r0, r0, r2, lsl #1
     304:	01f90800 	mvnseq	r0, r0, lsl #16
     308:	1e050000 	cdpne	0, 0, cr0, cr5, cr0, {0}
     30c:	00000136 	andeq	r0, r0, r6, lsr r1
     310:	70730704 	rsbsvc	r0, r3, r4, lsl #14
     314:	821f0500 	andshi	r0, pc, #0, 10
     318:	38000000 	stmdacc	r0, {}	; <UNPREDICTABLE>
     31c:	00726c07 	rsbseq	r6, r2, r7, lsl #24
     320:	00822005 	addeq	r2, r2, r5
     324:	073c0000 	ldreq	r0, [ip, -r0]!
     328:	05006370 	streq	r6, [r0, #-880]	; 0xfffffc90
     32c:	00008221 	andeq	r8, r0, r1, lsr #4
     330:	a8084000 	stmdage	r8, {lr}
     334:	0500000d 	streq	r0, [r0, #-13]
     338:	00007d22 	andeq	r7, r0, r2, lsr #26
     33c:	03004400 	movweq	r4, #1024	; 0x400
     340:	000001f1 	strdeq	r0, [r0], -r1
     344:	01412305 	cmpeq	r1, r5, lsl #6
     348:	19090000 	stmdbne	r9, {}	; <UNPREDICTABLE>
     34c:	01000002 	tsteq	r0, r2
     350:	00822819 	addeq	r2, r2, r9, lsl r8
     354:	00017000 	andeq	r7, r1, r0
     358:	2d9c0100 	ldfcss	f0, [ip]
     35c:	0a000002 	beq	36c <CPSR_IRQ_INHIBIT+0x2ec>
     360:	01003072 	tsteq	r0, r2, ror r0
     364:	00006b19 	andeq	r6, r0, r9, lsl fp
     368:	94910300 	ldrls	r0, [r1], #768	; 0x300
     36c:	31720a7f 	cmncc	r2, pc, ror sl
     370:	6b190100 	blvs	640778 <_stack+0x5c0778>
     374:	03000000 	movweq	r0, #0
     378:	0b7f9091 	bleq	1fe45c4 <_stack+0x1f645c4>
     37c:	0000018f 	andeq	r0, r0, pc, lsl #3
     380:	006b1901 	rsbeq	r1, fp, r1, lsl #18
     384:	91030000 	mrsls	r0, (UNDEF: 3)
     388:	080c7f8c 	stmdaeq	ip, {r2, r3, r7, r8, r9, sl, fp, ip, sp, lr}
     38c:	01000002 	tsteq	r0, r2
     390:	00022d3d 	andeq	r2, r2, sp, lsr sp
     394:	5c910200 	lfmpl	f0, 4, [r1], {0}
     398:	00019d0c 	andeq	r9, r1, ip, lsl #26
     39c:	3d3e0100 	ldfccs	f0, [lr, #-0]
     3a0:	02000002 	andeq	r0, r0, #2
     3a4:	650d4491 	strvs	r4, [sp, #-1169]	; 0xfffffb6f
     3a8:	01007272 	tsteq	r0, r2, ror r2
     3ac:	00024d3f 	andeq	r4, r2, pc, lsr sp
     3b0:	b0910300 	addslt	r0, r1, r0, lsl #6
     3b4:	01950c7f 	orrseq	r0, r5, pc, ror ip
     3b8:	43010000 	movwmi	r0, #4096	; 0x1000
     3bc:	0000025d 	andeq	r0, r0, sp, asr r2
     3c0:	0e749102 	expeqs	f1, f2
     3c4:	00008324 	andeq	r8, r0, r4, lsr #6
     3c8:	00000034 	andeq	r0, r0, r4, lsr r0
     3cc:	7272650d 	rsbsvc	r6, r2, #54525952	; 0x3400000
     3d0:	4d520100 	ldfmie	f0, [r2, #-0]
     3d4:	03000002 	movweq	r0, #2
     3d8:	007f9c91 			; <UNDEFINED> instruction: 0x007f9c91
     3dc:	00940f00 	addseq	r0, r4, r0, lsl #30
     3e0:	023d0000 	eorseq	r0, sp, #0
     3e4:	8d100000 	ldchi	0, cr0, [r0, #-0]
     3e8:	16000000 	strne	r0, [r0], -r0
     3ec:	00940f00 	addseq	r0, r4, r0, lsl #30
     3f0:	024d0000 	subeq	r0, sp, #0
     3f4:	8d100000 	ldchi	0, cr0, [r0, #-0]
     3f8:	17000000 	strne	r0, [r0, -r0]
     3fc:	00940f00 	addseq	r0, r4, r0, lsl #30
     400:	025d0000 	subseq	r0, sp, #0
     404:	8d100000 	ldchi	0, cr0, [r0, #-0]
     408:	12000000 	andne	r0, r0, #0
     40c:	8f041100 	svchi	0x00041100
     410:	09000001 	stmdbeq	r0, {r0}
     414:	000001e7 	andeq	r0, r0, r7, ror #3
     418:	820c0f01 	andhi	r0, ip, #1, 30
     41c:	001c0000 	andseq	r0, ip, r0
     420:	9c010000 	stcls	0, cr0, [r1], {-0}
     424:	00000287 	andeq	r0, r0, r7, lsl #5
     428:	00017a0b 	andeq	r7, r1, fp, lsl #20
     42c:	870f0100 	strhi	r0, [pc, -r0, lsl #2]
     430:	02000002 	andeq	r0, r0, #2
     434:	11007491 			; <UNDEFINED> instruction: 0x11007491
     438:	00009404 	andeq	r9, r0, r4, lsl #8
     43c:	01e10000 	mvneq	r0, r0
     440:	00040000 	andeq	r0, r4, r0
     444:	000001e5 	andeq	r0, r0, r5, ror #3
     448:	00440104 	subeq	r0, r4, r4, lsl #2
     44c:	650c0000 	strvs	r0, [ip, #-0]
     450:	98000002 	stmdals	r0, {r1}
     454:	5c000083 	stcpl	0, cr0, [r0], {131}	; 0x83
     458:	fa000001 	blx	464 <CPSR_IRQ_INHIBIT+0x3e4>
     45c:	02000001 	andeq	r0, r0, #1
     460:	00dc0601 	sbcseq	r0, ip, r1, lsl #12
     464:	01020000 	mrseq	r0, (UNDEF: 2)
     468:	0000da08 	andeq	sp, r0, r8, lsl #20
     46c:	05020200 	streq	r0, [r2, #-512]	; 0xfffffe00
     470:	0000013b 	andeq	r0, r0, fp, lsr r1
     474:	e8070202 	stmda	r7, {r1, r9}
     478:	02000000 	andeq	r0, r0, #0
     47c:	01320504 	teqeq	r2, r4, lsl #10
     480:	b0030000 	andlt	r0, r3, r0
     484:	02000001 	andeq	r0, r0, #1
     488:	00004f41 	andeq	r4, r0, r1, asr #30
     48c:	07040200 	streq	r0, [r4, -r0, lsl #4]
     490:	00000112 	andeq	r0, r0, r2, lsl r1
     494:	2d050802 	stccs	8, cr0, [r5, #-8]
     498:	02000001 	andeq	r0, r0, #1
     49c:	010d0708 	tsteq	sp, r8, lsl #14
     4a0:	04040000 	streq	r0, [r4], #-0
     4a4:	746e6905 	strbtvc	r6, [lr], #-2309	; 0xfffff6fb
     4a8:	07040200 	streq	r0, [r4, -r0, lsl #4]
     4ac:	00000117 	andeq	r0, r0, r7, lsl r1
     4b0:	0001b203 	andeq	fp, r1, r3, lsl #4
     4b4:	44300300 	ldrtmi	r0, [r0], #-768	; 0xfffffd00
     4b8:	05000000 	streq	r0, [r0, #-0]
     4bc:	00000072 	andeq	r0, r0, r2, ror r0
     4c0:	00023803 	andeq	r3, r2, r3, lsl #16
     4c4:	7d050400 	cfstrsvc	mvf0, [r5, #-0]
     4c8:	06000000 	streq	r0, [r0], -r0
     4cc:	00000082 	andeq	r0, r0, r2, lsl #1
     4d0:	00029107 	andeq	r9, r2, r7, lsl #2
     4d4:	07040c00 	streq	r0, [r4, -r0, lsl #24]
     4d8:	000000cf 	andeq	r0, r0, pc, asr #1
     4dc:	0002b408 	andeq	fp, r2, r8, lsl #8
     4e0:	6b080400 	blvs	2014e8 <_stack+0x1814e8>
     4e4:	00000000 	andeq	r0, r0, r0
     4e8:	00023308 	andeq	r3, r2, r8, lsl #6
     4ec:	6b090400 	blvs	2414f4 <_stack+0x1c14f4>
     4f0:	04000000 	streq	r0, [r0], #-0
     4f4:	000fd108 	andeq	sp, pc, r8, lsl #2
     4f8:	cf0a0400 	svcgt	0x000a0400
     4fc:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
     500:	000c5208 	andeq	r5, ip, r8, lsl #4
     504:	d50b0400 	strle	r0, [fp, #-1024]	; 0xfffffc00
     508:	0c000000 	stceq	0, cr0, [r0], {-0}
     50c:	92040900 	andls	r0, r4, #0, 18
     510:	0a000000 	beq	518 <CPSR_IRQ_INHIBIT+0x498>
     514:	00000028 	andeq	r0, r0, r8, lsr #32
     518:	000000e4 	andeq	r0, r0, r4, ror #1
     51c:	0000e40b 	andeq	lr, r0, fp, lsl #8
     520:	04020000 	streq	r0, [r2], #-0
     524:	00012407 	andeq	r2, r1, r7, lsl #8
     528:	02410700 	subeq	r0, r1, #0, 14
     52c:	04080000 	streq	r0, [r8], #-0
     530:	0001100e 	andeq	r1, r1, lr
     534:	02330800 	eorseq	r0, r3, #0, 16
     538:	0f040000 	svceq	0x00040000
     53c:	0000006b 	andeq	r0, r0, fp, rrx
     540:	02590800 	subseq	r0, r9, #0, 16
     544:	10040000 	andne	r0, r4, r0
     548:	000000cf 	andeq	r0, r0, pc, asr #1
     54c:	aa0c0004 	bge	300564 <_stack+0x280564>
     550:	01000002 	tsteq	r0, r2
     554:	00002804 	andeq	r2, r0, r4, lsl #16
     558:	024e0d00 	subeq	r0, lr, #0, 26
     55c:	07010000 	streq	r0, [r1, -r0]
     560:	0000012c 	andeq	r0, r0, ip, lsr #2
     564:	94140305 	ldrls	r0, [r4], #-773	; 0xfffffcfb
     568:	04090000 	streq	r0, [r9], #-0
     56c:	00000028 	andeq	r0, r0, r8, lsr #32
     570:	00029e0d 	andeq	r9, r2, sp, lsl #28
     574:	2c080100 	stfcss	f0, [r8], {-0}
     578:	05000001 	streq	r0, [r0, #-1]
     57c:	00941803 	addseq	r1, r4, r3, lsl #16
     580:	00eb0a00 	rsceq	r0, fp, r0, lsl #20
     584:	01530000 	cmpeq	r3, r0
     588:	e40e0000 	str	r0, [lr], #-0
     58c:	03000000 	movweq	r0, #0
     590:	023f0d00 	eorseq	r0, pc, #0, 26
     594:	0a010000 	beq	4059c <__bss_end__+0x37054>
     598:	00000143 	andeq	r0, r0, r3, asr #2
     59c:	941c0305 	ldrls	r0, [ip], #-773	; 0xfffffcfb
     5a0:	f70f0000 			; <UNDEFINED> instruction: 0xf70f0000
     5a4:	0100000e 	tsteq	r0, lr
     5a8:	0001dc0c 	andeq	sp, r1, ip, lsl #24
     5ac:	00839800 	addeq	r9, r3, r0, lsl #16
     5b0:	00015c00 	andeq	r5, r1, r0, lsl #24
     5b4:	dc9c0100 	ldfles	f0, [ip], {0}
     5b8:	10000001 	andne	r0, r0, r1
     5bc:	00000233 	andeq	r0, r0, r3, lsr r2
     5c0:	00820c01 	addeq	r0, r2, r1, lsl #24
     5c4:	91020000 	mrsls	r0, (UNDEF: 2)
     5c8:	02470d5c 	subeq	r0, r7, #92, 26	; 0x1700
     5cc:	0d010000 	stceq	0, cr0, [r1, #-0]
     5d0:	000001de 	ldrdeq	r0, [r0], -lr
     5d4:	0d749102 	ldfeqp	f1, [r4, #-8]!
     5d8:	0000025e 	andeq	r0, r0, lr, asr r2
     5dc:	00cf0e01 	sbceq	r0, pc, r1, lsl #28
     5e0:	91020000 	mrsls	r0, (UNDEF: 2)
     5e4:	84441170 	strbhi	r1, [r4], #-368	; 0xfffffe90
     5e8:	007c0000 	rsbseq	r0, ip, r0
     5ec:	2d0d0000 	stccs	0, cr0, [sp, #-0]
     5f0:	01000002 	tsteq	r0, r2
     5f4:	00008d24 	andeq	r8, r0, r4, lsr #26
     5f8:	68910200 	ldmvs	r1, {r9}
     5fc:	0002250d 	andeq	r2, r2, sp, lsl #10
     600:	8d250100 	stfhis	f0, [r5, #-0]
     604:	02000000 	andeq	r0, r0, #0
     608:	d10d6491 			; <UNDEFINED> instruction: 0xd10d6491
     60c:	0100000f 	tsteq	r0, pc
     610:	00012c27 	andeq	r2, r1, r7, lsr #24
     614:	6c910200 	lfmvs	f0, 4, [r1], {0}
     618:	04120000 	ldreq	r0, [r2], #-0
     61c:	00eb0409 	rsceq	r0, fp, r9, lsl #8
     620:	d3000000 	movwle	r0, #0
     624:	04000002 	streq	r0, [r0], #-2
     628:	0002c300 	andeq	ip, r2, r0, lsl #6
     62c:	44010400 	strmi	r0, [r1], #-1024	; 0xfffffc00
     630:	0c000000 	stceq	0, cr0, [r0], {-0}
     634:	000002cf 	andeq	r0, r0, pc, asr #5
     638:	000084f4 	strdeq	r8, [r0], -r4
     63c:	000001e8 	andeq	r0, r0, r8, ror #3
     640:	0000030e 	andeq	r0, r0, lr, lsl #6
     644:	dc060102 	stfles	f0, [r6], {2}
     648:	02000000 	andeq	r0, r0, #0
     64c:	00da0801 	sbcseq	r0, sl, r1, lsl #16
     650:	02020000 	andeq	r0, r2, #0
     654:	00013b05 	andeq	r3, r1, r5, lsl #22
     658:	07020200 	streq	r0, [r2, -r0, lsl #4]
     65c:	000000e8 	andeq	r0, r0, r8, ror #1
     660:	32050402 	andcc	r0, r5, #33554432	; 0x2000000
     664:	03000001 	movweq	r0, #1
     668:	000001b0 			; <UNDEFINED> instruction: 0x000001b0
     66c:	004f4102 	subeq	r4, pc, r2, lsl #2
     670:	04020000 	streq	r0, [r2], #-0
     674:	00011207 	andeq	r1, r1, r7, lsl #4
     678:	05080200 	streq	r0, [r8, #-512]	; 0xfffffe00
     67c:	0000012d 	andeq	r0, r0, sp, lsr #2
     680:	0d070802 	stceq	8, cr0, [r7, #-8]
     684:	04000001 	streq	r0, [r0], #-1
     688:	6e690504 	cdpvs	5, 6, cr0, cr9, cr4, {0}
     68c:	04020074 	streq	r0, [r2], #-116	; 0xffffff8c
     690:	00011707 	andeq	r1, r1, r7, lsl #14
     694:	01b20300 			; <UNDEFINED> instruction: 0x01b20300
     698:	30030000 	andcc	r0, r3, r0
     69c:	00000044 	andeq	r0, r0, r4, asr #32
     6a0:	00007205 	andeq	r7, r0, r5, lsl #4
     6a4:	01820300 	orreq	r0, r2, r0, lsl #6
     6a8:	12040000 	andne	r0, r4, #0
     6ac:	0000007d 	andeq	r0, r0, sp, ror r0
     6b0:	0c053406 	cfstrseq	mvf3, [r5], {6}
     6b4:	00000128 	andeq	r0, r0, r8, lsr #2
     6b8:	00307207 	eorseq	r7, r0, r7, lsl #4
     6bc:	00820d05 	addeq	r0, r2, r5, lsl #26
     6c0:	07000000 	streq	r0, [r0, -r0]
     6c4:	05003172 	streq	r3, [r0, #-370]	; 0xfffffe8e
     6c8:	0000820e 	andeq	r8, r0, lr, lsl #4
     6cc:	72070400 	andvc	r0, r7, #0, 8
     6d0:	0f050032 	svceq	0x00050032
     6d4:	00000082 	andeq	r0, r0, r2, lsl #1
     6d8:	33720708 	cmncc	r2, #8, 14	; 0x200000
     6dc:	82100500 	andshi	r0, r0, #0, 10
     6e0:	0c000000 	stceq	0, cr0, [r0], {-0}
     6e4:	00347207 	eorseq	r7, r4, r7, lsl #4
     6e8:	00821105 	addeq	r1, r2, r5, lsl #2
     6ec:	07100000 	ldreq	r0, [r0, -r0]
     6f0:	05003572 	streq	r3, [r0, #-1394]	; 0xfffffa8e
     6f4:	00008212 	andeq	r8, r0, r2, lsl r2
     6f8:	72071400 	andvc	r1, r7, #0, 8
     6fc:	13050036 	movwne	r0, #20534	; 0x5036
     700:	00000082 	andeq	r0, r0, r2, lsl #1
     704:	37720718 			; <UNDEFINED> instruction: 0x37720718
     708:	82140500 	andshi	r0, r4, #0, 10
     70c:	1c000000 	stcne	0, cr0, [r0], {-0}
     710:	00387207 	eorseq	r7, r8, r7, lsl #4
     714:	00821505 	addeq	r1, r2, r5, lsl #10
     718:	07200000 	streq	r0, [r0, -r0]!
     71c:	05003972 	streq	r3, [r0, #-2418]	; 0xfffff68e
     720:	00008216 	andeq	r8, r0, r6, lsl r2
     724:	72072400 	andvc	r2, r7, #0, 8
     728:	05003031 	streq	r3, [r0, #-49]	; 0xffffffcf
     72c:	00008217 	andeq	r8, r0, r7, lsl r2
     730:	72072800 	andvc	r2, r7, #0, 16
     734:	05003131 	streq	r3, [r0, #-305]	; 0xfffffecf
     738:	00008218 	andeq	r8, r0, r8, lsl r2
     73c:	72072c00 	andvc	r2, r7, #0, 24
     740:	05003231 	streq	r3, [r0, #-561]	; 0xfffffdcf
     744:	00008219 	andeq	r8, r0, r9, lsl r2
     748:	03003000 	movweq	r3, #0
     74c:	000001fe 	strdeq	r0, [r0], -lr
     750:	008d1a05 	addeq	r1, sp, r5, lsl #20
     754:	48060000 	stmdami	r6, {}	; <UNPREDICTABLE>
     758:	01811c05 	orreq	r1, r1, r5, lsl #24
     75c:	eb080000 	bl	200764 <_stack+0x180764>
     760:	0500000d 	streq	r0, [r0, #-13]
     764:	0000821d 	andeq	r8, r0, sp, lsl r2
     768:	f9080000 			; <UNDEFINED> instruction: 0xf9080000
     76c:	05000001 	streq	r0, [r0, #-1]
     770:	0001281e 	andeq	r2, r1, lr, lsl r8
     774:	73070400 	movwvc	r0, #29696	; 0x7400
     778:	1f050070 	svcne	0x00050070
     77c:	00000082 	andeq	r0, r0, r2, lsl #1
     780:	726c0738 	rsbvc	r0, ip, #56, 14	; 0xe00000
     784:	82200500 	eorhi	r0, r0, #0, 10
     788:	3c000000 	stccc	0, cr0, [r0], {-0}
     78c:	00637007 	rsbeq	r7, r3, r7
     790:	00822105 	addeq	r2, r2, r5, lsl #2
     794:	08400000 	stmdaeq	r0, {}^	; <UNPREDICTABLE>
     798:	00000da8 	andeq	r0, r0, r8, lsr #27
     79c:	007d2205 	rsbseq	r2, sp, r5, lsl #4
     7a0:	00440000 	subeq	r0, r4, r0
     7a4:	0001f103 	andeq	pc, r1, r3, lsl #2
     7a8:	33230500 			; <UNDEFINED> instruction: 0x33230500
     7ac:	03000001 	movweq	r0, #1
     7b0:	00000238 	andeq	r0, r0, r8, lsr r2
     7b4:	007d0506 	rsbseq	r0, sp, r6, lsl #10
     7b8:	04020000 	streq	r0, [r2], #-0
     7bc:	00012407 	andeq	r2, r1, r7, lsl #8
     7c0:	01810900 	orreq	r0, r1, r0, lsl #18
     7c4:	01ae0000 			; <UNDEFINED> instruction: 0x01ae0000
     7c8:	970a0000 	strls	r0, [sl, -r0]
     7cc:	01000001 	tsteq	r0, r1
     7d0:	63700b00 	cmnvs	r0, #0, 22
     7d4:	08010062 	stmdaeq	r1, {r1, r5, r6}
     7d8:	0000019e 	muleq	r0, lr, r1
     7dc:	94940305 	ldrls	r0, [r4], #773	; 0x305
     7e0:	ba0c0000 	blt	3007e8 <_stack+0x2807e8>
     7e4:	01000002 	tsteq	r0, r2
     7e8:	0001d009 	andeq	sp, r1, r9
     7ec:	24030500 	strcs	r0, [r3], #-1280	; 0xfffffb00
     7f0:	0d000095 	stceq	0, cr0, [r0, #-596]	; 0xfffffdac
     7f4:	00018104 	andeq	r8, r1, r4, lsl #2
     7f8:	02fc0e00 	rscseq	r0, ip, #0, 28
     7fc:	34010000 	strcc	r0, [r1], #-0
     800:	000001d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
     804:	00008654 	andeq	r8, r0, r4, asr r6
     808:	00000088 	andeq	r0, r0, r8, lsl #1
     80c:	020a9c01 	andeq	r9, sl, #256	; 0x100
     810:	690b0000 	stmdbvs	fp, {}	; <UNPREDICTABLE>
     814:	64360100 	ldrtvs	r0, [r6], #-256	; 0xffffff00
     818:	02000000 	andeq	r0, r0, #0
     81c:	340c7491 	strcc	r7, [ip], #-1169	; 0xfffffb6f
     820:	01000003 	tsteq	r0, r3
     824:	0001d038 	andeq	sp, r1, r8, lsr r0
     828:	70910200 	addsvc	r0, r1, r0, lsl #4
     82c:	033b0e00 	teqeq	fp, #0, 28
     830:	24010000 	strcs	r0, [r1], #-0
     834:	000001d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
     838:	000085e0 	andeq	r8, r0, r0, ror #11
     83c:	00000074 	andeq	r0, r0, r4, ror r0
     840:	023e9c01 	eorseq	r9, lr, #256	; 0x100
     844:	690b0000 	stmdbvs	fp, {}	; <UNPREDICTABLE>
     848:	64260100 	strtvs	r0, [r6], #-256	; 0xffffff00
     84c:	02000000 	andeq	r0, r0, #0
     850:	1e0c7491 	mcrne	4, 0, r7, cr12, cr1, {4}
     854:	01000003 	tsteq	r0, r3
     858:	0001d027 	andeq	sp, r1, r7, lsr #32
     85c:	70910200 	addsvc	r0, r1, r0, lsl #4
     860:	030c0f00 	movweq	r0, #52992	; 0xcf00
     864:	1f010000 	svcne	0x00010000
     868:	000001d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
     86c:	000085bc 			; <UNDEFINED> instruction: 0x000085bc
     870:	00000024 	andeq	r0, r0, r4, lsr #32
     874:	4a109c01 	bmi	427880 <_stack+0x3a7880>
     878:	01000003 	tsteq	r0, r3
     87c:	00858c1a 	addeq	r8, r5, sl, lsl ip
     880:	00003000 	andeq	r3, r0, r0
     884:	779c0100 	ldrvc	r0, [ip, r0, lsl #2]
     888:	11000002 	tstne	r0, r2
     88c:	000002ca 	andeq	r0, r0, sl, asr #5
     890:	01d01a01 	bicseq	r1, r0, r1, lsl #20
     894:	91020000 	mrsls	r0, (UNDEF: 2)
     898:	26120074 			; <UNDEFINED> instruction: 0x26120074
     89c:	01000003 	tsteq	r0, r3
     8a0:	0084f40b 	addeq	pc, r4, fp, lsl #8
     8a4:	00009800 	andeq	r9, r0, r0, lsl #16
     8a8:	c39c0100 	orrsgt	r0, ip, #0, 2
     8ac:	11000002 	tstne	r0, r2
     8b0:	000002ca 	andeq	r0, r0, sl, asr #5
     8b4:	01d00b01 	bicseq	r0, r0, r1, lsl #22
     8b8:	91020000 	mrsls	r0, (UNDEF: 2)
     8bc:	0220116c 	eoreq	r1, r0, #108, 2
     8c0:	0b010000 	bleq	408c8 <__bss_end__+0x37380>
     8c4:	000002ca 	andeq	r0, r0, sl, asr #5
     8c8:	0b689102 	bleq	1a24cd8 <_stack+0x19a4cd8>
     8cc:	0d010069 	stceq	0, cr0, [r1, #-420]	; 0xfffffe5c
     8d0:	00000064 	andeq	r0, r0, r4, rrx
     8d4:	0c749102 	ldfeqp	f1, [r4], #-8
     8d8:	000001fe 	strdeq	r0, [r0], -lr
     8dc:	02d00e01 	sbcseq	r0, r0, #1, 28
     8e0:	91020000 	mrsls	r0, (UNDEF: 2)
     8e4:	ca130070 	bgt	4c0aac <_stack+0x440aac>
     8e8:	14000002 	strne	r0, [r0], #-2
     8ec:	c3040d00 	movwgt	r0, #19712	; 0x4d00
     8f0:	0d000002 	stceq	0, cr0, [r0, #-8]
     8f4:	00008204 	andeq	r8, r0, r4, lsl #4
     8f8:	013c0000 	teqeq	ip, r0
     8fc:	00040000 	andeq	r0, r4, r0
     900:	000003e8 	andeq	r0, r0, r8, ror #7
     904:	00440104 	subeq	r0, r4, r4, lsl #2
     908:	780c0000 	stmdavc	ip, {}	; <UNPREDICTABLE>
     90c:	dc000003 	stcle	0, cr0, [r0], {3}
     910:	3c000086 	stccc	0, cr0, [r0], {134}	; 0x86
     914:	a0000000 	andge	r0, r0, r0
     918:	02000004 	andeq	r0, r0, #4
     91c:	00dc0601 	sbcseq	r0, ip, r1, lsl #12
     920:	01020000 	mrseq	r0, (UNDEF: 2)
     924:	0000da08 	andeq	sp, r0, r8, lsl #20
     928:	05020200 	streq	r0, [r2, #-512]	; 0xfffffe00
     92c:	0000013b 	andeq	r0, r0, fp, lsr r1
     930:	e8070202 	stmda	r7, {r1, r9}
     934:	02000000 	andeq	r0, r0, #0
     938:	01320504 	teqeq	r2, r4, lsl #10
     93c:	b0030000 	andlt	r0, r3, r0
     940:	02000001 	andeq	r0, r0, #1
     944:	00004f41 	andeq	r4, r0, r1, asr #30
     948:	07040200 	streq	r0, [r4, -r0, lsl #4]
     94c:	00000112 	andeq	r0, r0, r2, lsl r1
     950:	2d050802 	stccs	8, cr0, [r5, #-8]
     954:	02000001 	andeq	r0, r0, #1
     958:	010d0708 	tsteq	sp, r8, lsl #14
     95c:	04040000 	streq	r0, [r4], #-0
     960:	746e6905 	strbtvc	r6, [lr], #-2309	; 0xfffff6fb
     964:	07040200 	streq	r0, [r4, -r0, lsl #4]
     968:	00000117 	andeq	r0, r0, r7, lsl r1
     96c:	0001b203 	andeq	fp, r1, r3, lsl #4
     970:	44300300 	ldrtmi	r0, [r0], #-768	; 0xfffffd00
     974:	05000000 	streq	r0, [r0, #-0]
     978:	00000072 	andeq	r0, r0, r2, ror r0
     97c:	28042406 	stmdacs	r4, {r1, r2, sl, sp}
     980:	000000f7 	strdeq	r0, [r0], -r7
     984:	00035c07 	andeq	r5, r3, r7, lsl #24
     988:	7d2e0400 	cfstrsvc	mvf0, [lr, #-0]
     98c:	00000000 	andeq	r0, r0, r0
     990:	0003d707 	andeq	sp, r3, r7, lsl #14
     994:	7d350400 	cfldrsvc	mvf0, [r5, #-0]
     998:	04000000 	streq	r0, [r0], #-0
     99c:	0003fb07 	andeq	pc, r3, r7, lsl #22
     9a0:	7d3c0400 	cfldrsvc	mvf0, [ip, #-0]
     9a4:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
     9a8:	00041407 	andeq	r1, r4, r7, lsl #8
     9ac:	7d410400 	cfstrdvc	mvd0, [r1, #-0]
     9b0:	0c000000 	stceq	0, cr0, [r0], {-0}
     9b4:	0003c607 	andeq	ip, r3, r7, lsl #12
     9b8:	7d4b0400 	cfstrdvc	mvd0, [fp, #-0]
     9bc:	10000000 	andne	r0, r0, r0
     9c0:	0003cd07 	andeq	ip, r3, r7, lsl #26
     9c4:	7d520400 	cfldrdvc	mvd0, [r2, #-0]
     9c8:	14000000 	strne	r0, [r0], #-0
     9cc:	00036107 	andeq	r6, r3, r7, lsl #2
     9d0:	7d590400 	cfldrdvc	mvd0, [r9, #-0]
     9d4:	18000000 	stmdane	r0, {}	; <UNPREDICTABLE>
     9d8:	0003dd07 	andeq	sp, r3, r7, lsl #26
     9dc:	7d640400 	cfstrdvc	mvd0, [r4, #-0]
     9e0:	1c000000 	stcne	0, cr0, [r0], {-0}
     9e4:	0003e807 	andeq	lr, r3, r7, lsl #16
     9e8:	7d720400 	cfldrdvc	mvd0, [r2, #-0]
     9ec:	20000000 	andcs	r0, r0, r0
     9f0:	03aa0300 			; <UNDEFINED> instruction: 0x03aa0300
     9f4:	74040000 	strvc	r0, [r4], #-0
     9f8:	00000082 	andeq	r0, r0, r2, lsl #1
     9fc:	0003ba08 	andeq	fp, r3, r8, lsl #20
     a00:	130e0100 	movwne	r0, #57600	; 0xe100
     a04:	05000001 	streq	r0, [r0, #-1]
     a08:	00943c03 	addseq	r3, r4, r3, lsl #24
     a0c:	f7040900 			; <UNDEFINED> instruction: 0xf7040900
     a10:	0a000000 	beq	a18 <CPSR_IRQ_INHIBIT+0x998>
     a14:	00000403 	andeq	r0, r0, r3, lsl #8
     a18:	87001501 	strhi	r1, [r0, -r1, lsl #10]
     a1c:	00180000 	andseq	r0, r8, r0
     a20:	9c010000 	stcls	0, cr0, [r1], {-0}
     a24:	0003680b 	andeq	r6, r3, fp, lsl #16
     a28:	13100100 	tstne	r0, #0, 2
     a2c:	dc000001 	stcle	0, cr0, [r0], {1}
     a30:	24000086 	strcs	r0, [r0], #-134	; 0xffffff7a
     a34:	01000000 	mrseq	r0, (UNDEF: 0)
     a38:	04da009c 	ldrbeq	r0, [sl], #156	; 0x9c
     a3c:	00040000 	andeq	r0, r4, r0
     a40:	0000048a 	andeq	r0, r0, sl, lsl #9
     a44:	00440104 	subeq	r0, r4, r4, lsl #2
     a48:	7d0c0000 	stcvc	0, cr0, [ip, #-0]
     a4c:	18000007 	stmdane	r0, {r0, r1, r2}
     a50:	58000087 	stmdapl	r0, {r0, r1, r2, r7}
     a54:	9a000001 	bls	a60 <CPSR_IRQ_INHIBIT+0x9e0>
     a58:	02000005 	andeq	r0, r0, #5
     a5c:	00dc0601 	sbcseq	r0, ip, r1, lsl #12
     a60:	01020000 	mrseq	r0, (UNDEF: 2)
     a64:	0000da08 	andeq	sp, r0, r8, lsl #20
     a68:	05020200 	streq	r0, [r2, #-512]	; 0xfffffe00
     a6c:	0000013b 	andeq	r0, r0, fp, lsr r1
     a70:	e8070202 	stmda	r7, {r1, r9}
     a74:	02000000 	andeq	r0, r0, #0
     a78:	01320504 	teqeq	r2, r4, lsl #10
     a7c:	b0030000 	andlt	r0, r3, r0
     a80:	02000001 	andeq	r0, r0, #1
     a84:	00004f41 	andeq	r4, r0, r1, asr #30
     a88:	07040200 	streq	r0, [r4, -r0, lsl #4]
     a8c:	00000112 	andeq	r0, r0, r2, lsl r1
     a90:	2d050802 	stccs	8, cr0, [r5, #-8]
     a94:	02000001 	andeq	r0, r0, #1
     a98:	010d0708 	tsteq	sp, r8, lsl #14
     a9c:	04040000 	streq	r0, [r4], #-0
     aa0:	746e6905 	strbtvc	r6, [lr], #-2309	; 0xfffff6fb
     aa4:	07040200 	streq	r0, [r4, -r0, lsl #4]
     aa8:	00000117 	andeq	r0, r0, r7, lsl r1
     aac:	0001b203 	andeq	fp, r1, r3, lsl #4
     ab0:	44300300 	ldrtmi	r0, [r0], #-768	; 0xfffffd00
     ab4:	05000000 	streq	r0, [r0, #-0]
     ab8:	00000072 	andeq	r0, r0, r2, ror r0
     abc:	00007d06 	andeq	r7, r0, r6, lsl #26
     ac0:	01820300 	orreq	r0, r2, r0, lsl #6
     ac4:	12040000 	andne	r0, r4, #0
     ac8:	0000007d 	andeq	r0, r0, sp, ror r0
     acc:	0006a103 	andeq	sl, r6, r3, lsl #2
     ad0:	82130400 	andshi	r0, r3, #0, 8
     ad4:	03000000 	movweq	r0, #0
     ad8:	00000841 	andeq	r0, r0, r1, asr #16
     adc:	007d1404 	rsbseq	r1, sp, r4, lsl #8
     ae0:	01070000 	mrseq	r0, (UNDEF: 7)
     ae4:	00000028 	andeq	r0, r0, r8, lsr #32
     ae8:	00e54205 	rsceq	r4, r5, r5, lsl #4
     aec:	6a080000 	bvs	200af4 <_stack+0x180af4>
     af0:	00000007 	andeq	r0, r0, r7
     af4:	00067c08 	andeq	r7, r6, r8, lsl #24
     af8:	ac080100 	stfges	f0, [r8], {-0}
     afc:	02000008 	andeq	r0, r0, #8
     b00:	0008a408 	andeq	sl, r8, r8, lsl #8
     b04:	84080300 	strhi	r0, [r8], #-768	; 0xfffffd00
     b08:	04000008 	streq	r0, [r0], #-8
     b0c:	00088c08 	andeq	r8, r8, r8, lsl #24
     b10:	94080500 	strls	r0, [r8], #-1280	; 0xfffffb00
     b14:	06000008 	streq	r0, [r0], -r8
     b18:	00089c08 	andeq	r9, r8, r8, lsl #24
     b1c:	03000700 	movweq	r0, #1792	; 0x700
     b20:	00000748 	andeq	r0, r0, r8, asr #14
     b24:	00a84b05 	adceq	r4, r8, r5, lsl #22
     b28:	01070000 	mrseq	r0, (UNDEF: 7)
     b2c:	00000028 	andeq	r0, r0, r8, lsr #32
     b30:	02415105 	subeq	r5, r1, #1073741825	; 0x40000001
     b34:	40080000 	andmi	r0, r8, r0
     b38:	00000006 	andeq	r0, r0, r6
     b3c:	00064a08 	andeq	r4, r6, r8, lsl #20
     b40:	54080100 	strpl	r0, [r8], #-256	; 0xffffff00
     b44:	02000006 	andeq	r0, r0, #6
     b48:	00081608 	andeq	r1, r8, r8, lsl #12
     b4c:	5e080300 	cdppl	3, 0, cr0, cr8, cr0, {0}
     b50:	04000006 	streq	r0, [r0], #-6
     b54:	00066808 	andeq	r6, r6, r8, lsl #16
     b58:	72080500 	andvc	r0, r8, #0, 10
     b5c:	06000006 	streq	r0, [r0], -r6
     b60:	00076008 	andeq	r6, r7, r8
     b64:	86080700 	strhi	r0, [r8], -r0, lsl #14
     b68:	08000006 	stmdaeq	r0, {r1, r2}
     b6c:	00069008 	andeq	r9, r6, r8
     b70:	70080900 	andvc	r0, r8, r0, lsl #18
     b74:	0a000005 	beq	b90 <CPSR_IRQ_INHIBIT+0xb10>
     b78:	00057b08 	andeq	r7, r5, r8, lsl #22
     b7c:	86080b00 	strhi	r0, [r8], -r0, lsl #22
     b80:	0c000005 	stceq	0, cr0, [r0], {5}
     b84:	00059108 	andeq	r9, r5, r8, lsl #2
     b88:	9c080d00 	stcls	13, cr0, [r8], {-0}
     b8c:	0e000005 	cdpeq	0, 0, cr0, cr0, cr5, {0}
     b90:	0005a708 	andeq	sl, r5, r8, lsl #14
     b94:	b2080f00 	andlt	r0, r8, #0, 30
     b98:	10000005 	andne	r0, r0, r5
     b9c:	0005bd08 	andeq	fp, r5, r8, lsl #26
     ba0:	c8081100 	stmdagt	r8, {r8, ip}
     ba4:	12000005 	andne	r0, r0, #5
     ba8:	0005d308 	andeq	sp, r5, r8, lsl #6
     bac:	ef081300 	svc	0x00081300
     bb0:	14000004 	strne	r0, [r0], #-4
     bb4:	0006ae08 	andeq	sl, r6, r8, lsl #28
     bb8:	b9081500 	stmdblt	r8, {r8, sl, ip}
     bbc:	16000006 	strne	r0, [r0], -r6
     bc0:	0006c408 	andeq	ip, r6, r8, lsl #8
     bc4:	cf081700 	svcgt	0x00081700
     bc8:	18000006 	stmdane	r0, {r1, r2}
     bcc:	0006da08 	andeq	sp, r6, r8, lsl #20
     bd0:	e5081900 	str	r1, [r8, #-2304]	; 0xfffff700
     bd4:	1a000006 	bne	bf4 <CPSR_IRQ_INHIBIT+0xb74>
     bd8:	0006f008 	andeq	pc, r6, r8
     bdc:	fb081b00 	blx	2077e6 <_stack+0x1877e6>
     be0:	1c000006 	stcne	0, cr0, [r0], {6}
     be4:	00070608 	andeq	r0, r7, r8, lsl #12
     be8:	f5081d00 			; <UNDEFINED> instruction: 0xf5081d00
     bec:	1e000007 	cdpne	0, 0, cr0, cr0, cr7, {0}
     bf0:	00080008 	andeq	r0, r8, r8
     bf4:	0b081f00 	bleq	2087fc <_stack+0x1887fc>
     bf8:	20000008 	andcs	r0, r0, r8
     bfc:	0007ab08 	andeq	sl, r7, r8, lsl #22
     c00:	20082100 	andcs	r2, r8, r0, lsl #2
     c04:	22000008 	andcs	r0, r0, #8
     c08:	00082b08 	andeq	r2, r8, r8, lsl #22
     c0c:	36082300 	strcc	r2, [r8], -r0, lsl #6
     c10:	24000008 	strcs	r0, [r0], #-8
     c14:	0007ce08 	andeq	ip, r7, r8, lsl #28
     c18:	4e082500 	cfsh32mi	mvfx2, mvfx8, #0
     c1c:	26000008 	strcs	r0, [r0], -r8
     c20:	00085908 	andeq	r5, r8, r8, lsl #18
     c24:	6a082700 	bvs	20a82c <_stack+0x18a82c>
     c28:	28000004 	stmdacs	r0, {r2}
     c2c:	00056508 	andeq	r6, r5, r8, lsl #10
     c30:	75082900 	strvc	r2, [r8, #-2304]	; 0xfffff700
     c34:	2a000004 	bcs	c4c <CPSR_IRQ_INHIBIT+0xbcc>
     c38:	00048008 	andeq	r8, r4, r8
     c3c:	8b082b00 	blhi	20b844 <_stack+0x18b844>
     c40:	2c000004 	stccs	0, cr0, [r0], {4}
     c44:	00049608 	andeq	r9, r4, r8, lsl #12
     c48:	a1082d00 	tstge	r8, r0, lsl #26
     c4c:	2e000004 	cdpcs	0, 0, cr0, cr0, cr4, {0}
     c50:	0004ac08 	andeq	sl, r4, r8, lsl #24
     c54:	b7082f00 	strlt	r2, [r8, -r0, lsl #30]
     c58:	30000004 	andcc	r0, r0, r4
     c5c:	0004c208 	andeq	ip, r4, r8, lsl #4
     c60:	e7083100 	str	r3, [r8, -r0, lsl #2]
     c64:	32000005 	andcc	r0, r0, #5
     c68:	0005f208 	andeq	pc, r5, r8, lsl #4
     c6c:	ea083300 	b	20d874 <_stack+0x18d874>
     c70:	34000007 	strcc	r0, [r0], #-7
     c74:	0005fd08 	andeq	pc, r5, r8, lsl #26
     c78:	03003500 	movweq	r3, #1280	; 0x500
     c7c:	0000061a 	andeq	r0, r0, sl, lsl r6
     c80:	00f08805 	rscseq	r8, r0, r5, lsl #16
     c84:	a4090000 	strge	r0, [r9], #-0
     c88:	04419b05 	strbeq	r9, [r1], #-2821	; 0xfffff4fb
     c8c:	2b0a0000 	blcs	280c94 <_stack+0x200c94>
     c90:	05000004 	streq	r0, [r0, #-4]
     c94:	0000879c 	muleq	r0, ip, r7
     c98:	330a0000 	movwcc	r0, #40960	; 0xa000
     c9c:	05000004 	streq	r0, [r0, #-4]
     ca0:	0000879d 	muleq	r0, sp, r7
     ca4:	3b0a0400 	blcc	281cac <_stack+0x201cac>
     ca8:	05000004 	streq	r0, [r0, #-4]
     cac:	0000879e 	muleq	r0, lr, r7
     cb0:	430a0800 	movwmi	r0, #43008	; 0xa800
     cb4:	05000004 	streq	r0, [r0, #-4]
     cb8:	0000879f 	muleq	r0, pc, r7	; <UNPREDICTABLE>
     cbc:	4b0a0c00 	blmi	283cc4 <_stack+0x203cc4>
     cc0:	05000004 	streq	r0, [r0, #-4]
     cc4:	000087a0 	andeq	r8, r0, r0, lsr #15
     cc8:	530a1000 	movwpl	r1, #40960	; 0xa000
     ccc:	05000004 	streq	r0, [r0, #-4]
     cd0:	000087a1 	andeq	r8, r0, r1, lsr #15
     cd4:	110a1400 	tstne	sl, r0, lsl #8
     cd8:	05000005 	streq	r0, [r0, #-5]
     cdc:	000092a2 	andeq	r9, r0, r2, lsr #5
     ce0:	1d0a1800 	stcne	8, cr1, [sl, #-0]
     ce4:	05000004 	streq	r0, [r0, #-4]
     ce8:	00009da3 	andeq	r9, r0, r3, lsr #27
     cec:	240a1c00 	strcs	r1, [sl], #-3072	; 0xfffff400
     cf0:	05000004 	streq	r0, [r0, #-4]
     cf4:	00009da4 	andeq	r9, r0, r4, lsr #27
     cf8:	1b0a2000 	blne	288d00 <_stack+0x208d00>
     cfc:	05000005 	streq	r0, [r0, #-5]
     d00:	000092a5 	andeq	r9, r0, r5, lsr #5
     d04:	bf0a2400 	svclt	0x000a2400
     d08:	05000008 	streq	r0, [r0, #-8]
     d0c:	00009da6 	andeq	r9, r0, r6, lsr #27
     d10:	9a0a2800 	bls	28ad18 <_stack+0x20ad18>
     d14:	05000006 	streq	r0, [r0, #-6]
     d18:	00009da7 	andeq	r9, r0, r7, lsr #27
     d1c:	250a2c00 	strcs	r2, [sl, #-3072]	; 0xfffff400
     d20:	05000005 	streq	r0, [r0, #-5]
     d24:	000092a8 	andeq	r9, r0, r8, lsr #5
     d28:	b60a3000 	strlt	r3, [sl], -r0
     d2c:	05000007 	streq	r0, [r0, #-7]
     d30:	00009da9 	andeq	r9, r0, r9, lsr #27
     d34:	bd0a3400 	cfstrslt	mvf3, [sl, #-0]
     d38:	05000007 	streq	r0, [r0, #-7]
     d3c:	00009daa 	andeq	r9, r0, sl, lsr #27
     d40:	2f0a3800 	svccs	0x000a3800
     d44:	05000005 	streq	r0, [r0, #-5]
     d48:	000092ab 	andeq	r9, r0, fp, lsr #5
     d4c:	430a3c00 	movwmi	r3, #44032	; 0xac00
     d50:	05000005 	streq	r0, [r0, #-5]
     d54:	00009dac 	andeq	r9, r0, ip, lsr #27
     d58:	4a0a4000 	bmi	290d60 <_stack+0x210d60>
     d5c:	05000005 	streq	r0, [r0, #-5]
     d60:	00009dad 	andeq	r9, r0, sp, lsr #27
     d64:	c40a4400 	strgt	r4, [sl], #-1024	; 0xfffffc00
     d68:	05000007 	streq	r0, [r0, #-7]
     d6c:	000092ae 	andeq	r9, r0, lr, lsr #5
     d70:	da0a4800 	ble	292d78 <_stack+0x212d78>
     d74:	05000004 	streq	r0, [r0, #-4]
     d78:	00009daf 	andeq	r9, r0, pc, lsr #27
     d7c:	e10a4c00 	tst	sl, r0, lsl #24
     d80:	05000004 	streq	r0, [r0, #-4]
     d84:	00009db0 			; <UNDEFINED> instruction: 0x00009db0
     d88:	390a5000 	stmdbcc	sl, {ip, lr}
     d8c:	05000005 	streq	r0, [r0, #-5]
     d90:	000092b1 			; <UNDEFINED> instruction: 0x000092b1
     d94:	7d0a5400 	cfstrsvc	mvf5, [sl, #-0]
     d98:	05000008 	streq	r0, [r0, #-8]
     d9c:	00009db2 			; <UNDEFINED> instruction: 0x00009db2
     da0:	5b0a5800 	blpl	296da8 <_stack+0x216da8>
     da4:	05000004 	streq	r0, [r0, #-4]
     da8:	00009db3 			; <UNDEFINED> instruction: 0x00009db3
     dac:	d90a5c00 	stmdble	sl, {sl, fp, ip, lr}
     db0:	05000007 	streq	r0, [r0, #-7]
     db4:	000092b4 			; <UNDEFINED> instruction: 0x000092b4
     db8:	e80a6000 	stmda	sl, {sp, lr}
     dbc:	05000004 	streq	r0, [r0, #-4]
     dc0:	00009db5 			; <UNDEFINED> instruction: 0x00009db5
     dc4:	e30a6400 	movw	r6, #41984	; 0xa400
     dc8:	05000007 	streq	r0, [r0, #-7]
     dcc:	00009db6 			; <UNDEFINED> instruction: 0x00009db6
     dd0:	640a6800 	strvs	r6, [sl], #-2048	; 0xfffff800
     dd4:	05000008 	streq	r0, [r0, #-8]
     dd8:	000092b7 			; <UNDEFINED> instruction: 0x000092b7
     ddc:	290a6c00 	stmdbcs	sl, {sl, fp, sp, lr}
     de0:	05000006 	streq	r0, [r0, #-6]
     de4:	00009db8 			; <UNDEFINED> instruction: 0x00009db8
     de8:	240a7000 	strcs	r7, [sl], #-0
     dec:	05000007 	streq	r0, [r0, #-7]
     df0:	00009db9 			; <UNDEFINED> instruction: 0x00009db9
     df4:	510a7400 	tstpl	sl, r0, lsl #8
     df8:	05000005 	streq	r0, [r0, #-5]
     dfc:	000092ba 			; <UNDEFINED> instruction: 0x000092ba
     e00:	1c0a7800 	stcne	8, cr7, [sl], {-0}
     e04:	05000007 	streq	r0, [r0, #-7]
     e08:	00009dbb 			; <UNDEFINED> instruction: 0x00009dbb
     e0c:	400a7c00 	andmi	r7, sl, r0, lsl #24
     e10:	05000007 	streq	r0, [r0, #-7]
     e14:	00009dbc 			; <UNDEFINED> instruction: 0x00009dbc
     e18:	5b0a8000 	blpl	2a0e20 <_stack+0x220e20>
     e1c:	05000005 	streq	r0, [r0, #-5]
     e20:	000092bd 			; <UNDEFINED> instruction: 0x000092bd
     e24:	300a8400 	andcc	r8, sl, r0, lsl #8
     e28:	05000006 	streq	r0, [r0, #-6]
     e2c:	00009dbe 			; <UNDEFINED> instruction: 0x00009dbe
     e30:	380a8800 	stmdacc	sl, {fp, pc}
     e34:	05000006 	streq	r0, [r0, #-6]
     e38:	00009dbf 			; <UNDEFINED> instruction: 0x00009dbf
     e3c:	350a8c00 	strcc	r8, [sl, #-3072]	; 0xfffff400
     e40:	05000007 	streq	r0, [r0, #-7]
     e44:	000092c0 	andeq	r9, r0, r0, asr #5
     e48:	080a9000 	stmdaeq	sl, {ip, pc}
     e4c:	05000006 	streq	r0, [r0, #-6]
     e50:	00009dc1 	andeq	r9, r0, r1, asr #27
     e54:	2b0a9400 	blcs	2a5e5c <_stack+0x225e5c>
     e58:	05000007 	streq	r0, [r0, #-7]
     e5c:	00009dc2 	andeq	r9, r0, r2, asr #27
     e60:	730a9800 	movwvc	r9, #43008	; 0xa800
     e64:	05000007 	streq	r0, [r0, #-7]
     e68:	00009dc3 	andeq	r9, r0, r3, asr #27
     e6c:	110a9c00 	tstne	sl, r0, lsl #24
     e70:	05000007 	streq	r0, [r0, #-7]
     e74:	000092c4 	andeq	r9, r0, r4, asr #5
     e78:	0300a000 	movweq	sl, #0
     e7c:	000008b4 			; <UNDEFINED> instruction: 0x000008b4
     e80:	024cc505 	subeq	ip, ip, #20971520	; 0x1400000
     e84:	620b0000 	andvs	r0, fp, #0
     e88:	01000004 	tsteq	r0, r4
     e8c:	00045d0e 	andeq	r5, r4, lr, lsl #26
     e90:	40030500 	andmi	r0, r3, r0, lsl #10
     e94:	0c000094 	stceq	0, cr0, [r0], {148}	; 0x94
     e98:	00044104 	andeq	r4, r4, r4, lsl #2
     e9c:	04cd0d00 	strbeq	r0, [sp], #3328	; 0xd00
     ea0:	20010000 	andcs	r0, r1, r0
     ea4:	00008858 	andeq	r8, r0, r8, asr r8
     ea8:	00000018 	andeq	r0, r0, r8, lsl r0
     eac:	fa0e9c01 	blx	3a7eb8 <_stack+0x327eb8>
     eb0:	01000004 	tsteq	r0, r4
     eb4:	00873c17 	addeq	r3, r7, r7, lsl ip
     eb8:	00011c00 	andeq	r1, r1, r0, lsl #24
     ebc:	c29c0100 	addsgt	r0, ip, #0, 2
     ec0:	0f000004 	svceq	0x00000004
     ec4:	00000878 	andeq	r0, r0, r8, ror r8
     ec8:	02411701 	subeq	r1, r1, #262144	; 0x40000
     ecc:	91020000 	mrsls	r0, (UNDEF: 2)
     ed0:	10ee0f6f 	rscne	r0, lr, pc, ror #30
     ed4:	17010000 	strne	r0, [r1, -r0]
     ed8:	000000e5 	andeq	r0, r0, r5, ror #1
     edc:	0b6e9102 	bleq	1ba52ec <_stack+0x1b252ec>
     ee0:	000005de 	ldrdeq	r0, [r0], -lr
     ee4:	04c21901 	strbeq	r1, [r2], #2305	; 0x901
     ee8:	91020000 	mrsls	r0, (UNDEF: 2)
     eec:	086e0b74 	stmdaeq	lr!, {r2, r4, r5, r6, r8, r9, fp}^
     ef0:	1a010000 	bne	40ef8 <__bss_end__+0x379b0>
     ef4:	00000087 	andeq	r0, r0, r7, lsl #1
     ef8:	00709102 	rsbseq	r9, r0, r2, lsl #2
     efc:	0087040c 	addeq	r0, r7, ip, lsl #8
     f00:	0e100000 	cdpeq	0, 1, cr0, cr0, cr0, {0}
     f04:	01000006 	tsteq	r0, r6
     f08:	00045d10 	andeq	r5, r4, r0, lsl sp
     f0c:	00871800 	addeq	r1, r7, r0, lsl #16
     f10:	00002400 	andeq	r2, r0, r0, lsl #8
     f14:	009c0100 	addseq	r0, ip, r0, lsl #2
     f18:	0000023b 	andeq	r0, r0, fp, lsr r2
     f1c:	05740004 	ldrbeq	r0, [r4, #-4]!
     f20:	01040000 	mrseq	r0, (UNDEF: 4)
     f24:	00000044 	andeq	r0, r0, r4, asr #32
     f28:	00097d0c 	andeq	r7, r9, ip, lsl #26
     f2c:	00887000 	addeq	r7, r8, r0
     f30:	00024800 	andeq	r4, r2, r0, lsl #16
     f34:	0006a600 	andeq	sl, r6, r0, lsl #12
     f38:	06010200 	streq	r0, [r1], -r0, lsl #4
     f3c:	000000dc 	ldrdeq	r0, [r0], -ip
     f40:	da080102 	ble	201350 <_stack+0x181350>
     f44:	02000000 	andeq	r0, r0, #0
     f48:	013b0502 	teqeq	fp, r2, lsl #10
     f4c:	02020000 	andeq	r0, r2, #0
     f50:	0000e807 	andeq	lr, r0, r7, lsl #16
     f54:	05040200 	streq	r0, [r4, #-512]	; 0xfffffe00
     f58:	00000132 	andeq	r0, r0, r2, lsr r1
     f5c:	0001b003 	andeq	fp, r1, r3
     f60:	4f410200 	svcmi	0x00410200
     f64:	02000000 	andeq	r0, r0, #0
     f68:	01120704 	tsteq	r2, r4, lsl #14
     f6c:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
     f70:	00012d05 	andeq	r2, r1, r5, lsl #26
     f74:	07080200 	streq	r0, [r8, -r0, lsl #4]
     f78:	0000010d 	andeq	r0, r0, sp, lsl #2
     f7c:	69050404 	stmdbvs	r5, {r2, sl}
     f80:	0200746e 	andeq	r7, r0, #1845493760	; 0x6e000000
     f84:	01170704 	tsteq	r7, r4, lsl #14
     f88:	b2030000 	andlt	r0, r3, #0
     f8c:	03000001 	movweq	r0, #1
     f90:	00004430 	andeq	r4, r0, r0, lsr r4
     f94:	00720500 	rsbseq	r0, r2, r0, lsl #10
     f98:	28060000 	stmdacs	r6, {}	; <UNPREDICTABLE>
     f9c:	01032f04 	tsteq	r3, r4, lsl #30
     fa0:	36070000 	strcc	r0, [r7], -r0
     fa4:	04000009 	streq	r0, [r0], #-9
     fa8:	00007d30 	andeq	r7, r0, r0, lsr sp
     fac:	53070000 	movwpl	r0, #28672	; 0x7000
     fb0:	0400000a 	streq	r0, [r0], #-10
     fb4:	00007d31 	andeq	r7, r0, r1, lsr sp
     fb8:	cd070400 	cfstrsgt	mvf0, [r7, #-0]
     fbc:	04000009 	streq	r0, [r0], #-9
     fc0:	00007d32 	andeq	r7, r0, r2, lsr sp
     fc4:	2a070800 	bcs	1c2fcc <_stack+0x142fcc>
     fc8:	04000009 	streq	r0, [r0], #-9
     fcc:	00007d33 	andeq	r7, r0, r3, lsr sp
     fd0:	61070c00 	tstvs	r7, r0, lsl #24
     fd4:	04000009 	streq	r0, [r0], #-9
     fd8:	00007d34 	andeq	r7, r0, r4, lsr sp
     fdc:	6f071000 	svcvs	0x00071000
     fe0:	04000009 	streq	r0, [r0], #-9
     fe4:	00007d35 	andeq	r7, r0, r5, lsr sp
     fe8:	4f071400 	svcmi	0x00071400
     fec:	04000009 	streq	r0, [r0], #-9
     ff0:	00007d36 	andeq	r7, r0, r6, lsr sp
     ff4:	1f071800 	svcne	0x00071800
     ff8:	0400000a 	streq	r0, [r0], #-10
     ffc:	00007d37 	andeq	r7, r0, r7, lsr sp
    1000:	2e071c00 	cdpcs	12, 0, cr1, cr7, cr0, {0}
    1004:	0400000a 	streq	r0, [r0], #-10
    1008:	00007d38 	andeq	r7, r0, r8, lsr sp
    100c:	17072000 	strne	r2, [r7, -r0]
    1010:	04000009 	streq	r0, [r0], #-9
    1014:	00007d39 	andeq	r7, r0, r9, lsr sp
    1018:	03002400 	movweq	r2, #1024	; 0x400
    101c:	000008f1 	strdeq	r0, [r0], -r1
    1020:	00823a04 	addeq	r3, r2, r4, lsl #20
    1024:	06080000 	streq	r0, [r8], -r0
    1028:	01000009 	tsteq	r0, r9
    102c:	00011f16 	andeq	r1, r1, r6, lsl pc
    1030:	44030500 	strmi	r0, [r3], #-1280	; 0xfffffb00
    1034:	09000094 	stmdbeq	r0, {r2, r4, r7}
    1038:	00010304 	andeq	r0, r1, r4, lsl #6
    103c:	0a3d0a00 	beq	f43844 <_stack+0xec3844>
    1040:	ec010000 	stc	0, cr0, [r1], {-0}
    1044:	00008aa8 	andeq	r8, r0, r8, lsr #21
    1048:	00000010 	andeq	r0, r0, r0, lsl r0
    104c:	0e0b9c01 	cdpeq	12, 0, cr9, cr11, cr1, {0}
    1050:	0100000a 	tsteq	r0, sl
    1054:	0089a47f 	addeq	sl, r9, pc, ror r4
    1058:	00010400 	andeq	r0, r1, r0, lsl #8
    105c:	6e9c0100 	fmlvse	f0, f4, f0
    1060:	0c000001 	stceq	0, cr0, [r0], {1}
    1064:	0074696c 	rsbseq	r6, r4, ip, ror #18
    1068:	00648101 	rsbeq	r8, r4, r1, lsl #2
    106c:	03050000 	movweq	r0, #20480	; 0x5000
    1070:	0000952c 	andeq	r9, r0, ip, lsr #10
    1074:	0009c308 	andeq	ip, r9, r8, lsl #6
    1078:	64820100 	strvs	r0, [r2], #256	; 0x100
    107c:	05000000 	streq	r0, [r0, #-0]
    1080:	00952803 	addseq	r2, r5, r3, lsl #16
    1084:	b10d0000 	mrslt	r0, (UNDEF: 13)
    1088:	01000009 	tsteq	r0, r9
    108c:	00896c6d 	addeq	r6, r9, sp, ror #24
    1090:	00003800 	andeq	r3, r0, r0, lsl #16
    1094:	929c0100 	addsls	r0, ip, #0, 2
    1098:	08000001 	stmdaeq	r0, {r0}
    109c:	00000948 	andeq	r0, r0, r8, asr #18
    10a0:	01926f01 	orrseq	r6, r2, r1, lsl #30
    10a4:	91020000 	mrsls	r0, (UNDEF: 2)
    10a8:	0102005f 	qaddeq	r0, pc, r2	; <UNPREDICTABLE>
    10ac:	0000e308 	andeq	lr, r0, r8, lsl #6
    10b0:	08c60d00 	stmiaeq	r6, {r8, sl, fp}^
    10b4:	5c010000 	stcpl	0, cr0, [r1], {-0}
    10b8:	00008934 	andeq	r8, r0, r4, lsr r9
    10bc:	00000038 	andeq	r0, r0, r8, lsr r0
    10c0:	01bd9c01 			; <UNDEFINED> instruction: 0x01bd9c01
    10c4:	48080000 	stmdami	r8, {}	; <UNPREDICTABLE>
    10c8:	01000009 	tsteq	r0, r9
    10cc:	0001925e 	andeq	r9, r1, lr, asr r2
    10d0:	5f910200 	svcpl	0x00910200
    10d4:	0a050d00 	beq	1444dc <_stack+0xc44dc>
    10d8:	4b010000 	blmi	410e0 <__bss_end__+0x37b98>
    10dc:	00008900 	andeq	r8, r0, r0, lsl #18
    10e0:	00000034 	andeq	r0, r0, r4, lsr r0
    10e4:	01e19c01 	mvneq	r9, r1, lsl #24
    10e8:	48080000 	stmdami	r8, {}	; <UNPREDICTABLE>
    10ec:	01000009 	tsteq	r0, r9
    10f0:	0001924d 	andeq	r9, r1, sp, asr #4
    10f4:	5f910200 	svcpl	0x00910200
    10f8:	09db0d00 	ldmibeq	fp, {r8, sl, fp}^
    10fc:	3b010000 	blcc	41104 <__bss_end__+0x37bbc>
    1100:	000088cc 	andeq	r8, r0, ip, asr #17
    1104:	00000034 	andeq	r0, r0, r4, lsr r0
    1108:	02059c01 	andeq	r9, r5, #256	; 0x100
    110c:	48080000 	stmdami	r8, {}	; <UNPREDICTABLE>
    1110:	01000009 	tsteq	r0, r9
    1114:	0001923d 	andeq	r9, r1, sp, lsr r2
    1118:	5f910200 	svcpl	0x00910200
    111c:	09f80d00 	ldmibeq	r8!, {r8, sl, fp}^
    1120:	2a010000 	bcs	41128 <__bss_end__+0x37be0>
    1124:	00008894 	muleq	r0, r4, r8
    1128:	00000038 	andeq	r0, r0, r8, lsr r0
    112c:	02299c01 	eoreq	r9, r9, #256	; 0x100
    1130:	48080000 	stmdami	r8, {}	; <UNPREDICTABLE>
    1134:	01000009 	tsteq	r0, r9
    1138:	0001922c 	andeq	r9, r1, ip, lsr #4
    113c:	5f910200 	svcpl	0x00910200
    1140:	08dc0e00 	ldmeq	ip, {r9, sl, fp}^
    1144:	1d010000 	stcne	0, cr0, [r1, #-0]
    1148:	0000011f 	andeq	r0, r0, pc, lsl r1
    114c:	00008870 	andeq	r8, r0, r0, ror r8
    1150:	00000024 	andeq	r0, r0, r4, lsr #32
    1154:	43009c01 	movwmi	r9, #3073	; 0xc01
    1158:	04000001 	streq	r0, [r0], #-1
    115c:	00065700 	andeq	r5, r6, r0, lsl #14
    1160:	44010400 	strmi	r0, [r1], #-1024	; 0xfffffc00
    1164:	0c000000 	stceq	0, cr0, [r0], {-0}
    1168:	00000a85 	andeq	r0, r0, r5, lsl #21
    116c:	00008ab8 			; <UNDEFINED> instruction: 0x00008ab8
    1170:	0000007c 	andeq	r0, r0, ip, ror r0
    1174:	000007f9 	strdeq	r0, [r0], -r9
    1178:	dc060102 	stfles	f0, [r6], {2}
    117c:	02000000 	andeq	r0, r0, #0
    1180:	00da0801 	sbcseq	r0, sl, r1, lsl #16
    1184:	02020000 	andeq	r0, r2, #0
    1188:	00013b05 	andeq	r3, r1, r5, lsl #22
    118c:	07020200 	streq	r0, [r2, -r0, lsl #4]
    1190:	000000e8 	andeq	r0, r0, r8, ror #1
    1194:	32050402 	andcc	r0, r5, #33554432	; 0x2000000
    1198:	03000001 	movweq	r0, #1
    119c:	000001b0 			; <UNDEFINED> instruction: 0x000001b0
    11a0:	004f4102 	subeq	r4, pc, r2, lsl #2
    11a4:	04020000 	streq	r0, [r2], #-0
    11a8:	00011207 	andeq	r1, r1, r7, lsl #4
    11ac:	05080200 	streq	r0, [r8, #-512]	; 0xfffffe00
    11b0:	0000012d 	andeq	r0, r0, sp, lsr #2
    11b4:	0d070802 	stceq	8, cr0, [r7, #-8]
    11b8:	04000001 	streq	r0, [r0], #-1
    11bc:	6e690504 	cdpvs	5, 6, cr0, cr9, cr4, {0}
    11c0:	04020074 	streq	r0, [r2], #-116	; 0xffffff8c
    11c4:	00011707 	andeq	r1, r1, r7, lsl #14
    11c8:	01b20300 			; <UNDEFINED> instruction: 0x01b20300
    11cc:	30030000 	andcc	r0, r3, r0
    11d0:	00000044 	andeq	r0, r0, r4, asr #32
    11d4:	00007205 	andeq	r7, r0, r5, lsl #4
    11d8:	041c0600 	ldreq	r0, [ip], #-1536	; 0xfffffa00
    11dc:	0000df1a 	andeq	sp, r0, sl, lsl pc
    11e0:	0ac20700 	beq	ff082de8 <CPSR_UNAFFECTED_BITS+0xff082ee8>
    11e4:	1b040000 	blne	1011ec <_stack+0x811ec>
    11e8:	0000007d 	andeq	r0, r0, sp, ror r0
    11ec:	0ad10700 	beq	ff442df4 <CPSR_UNAFFECTED_BITS+0xff442ef4>
    11f0:	1c040000 	stcne	0, cr0, [r4], {-0}
    11f4:	0000007d 	andeq	r0, r0, sp, ror r0
    11f8:	0ab70704 	beq	fedc2e10 <CPSR_UNAFFECTED_BITS+0xfedc2f10>
    11fc:	1d040000 	stcne	0, cr0, [r4, #-0]
    1200:	0000007d 	andeq	r0, r0, sp, ror r0
    1204:	0a610708 	beq	1842e2c <_stack+0x17c2e2c>
    1208:	1e040000 	cdpne	0, 0, cr0, cr4, cr0, {0}
    120c:	0000007d 	andeq	r0, r0, sp, ror r0
    1210:	0a6a070c 	beq	1a82e48 <_stack+0x1a02e48>
    1214:	1f040000 	svcne	0x00040000
    1218:	0000007d 	andeq	r0, r0, sp, ror r0
    121c:	0a730710 	beq	1cc2e64 <_stack+0x1c42e64>
    1220:	20040000 	andcs	r0, r4, r0
    1224:	0000007d 	andeq	r0, r0, sp, ror r0
    1228:	0a7c0714 	beq	1f02e80 <_stack+0x1e82e80>
    122c:	21040000 	mrscs	r0, (UNDEF: 4)
    1230:	0000007d 	andeq	r0, r0, sp, ror r0
    1234:	04030018 	streq	r0, [r3], #-24	; 0xffffffe8
    1238:	0400000b 	streq	r0, [r0], #-11
    123c:	00008222 	andeq	r8, r0, r2, lsr #4
    1240:	0b140800 	bleq	503248 <_stack+0x483248>
    1244:	0e010000 	cdpeq	0, 0, cr0, cr1, cr0, {0}
    1248:	000000fb 	strdeq	r0, [r0], -fp
    124c:	94480305 	strbls	r0, [r8], #-773	; 0xfffffcfb
    1250:	04090000 	streq	r0, [r9], #-0
    1254:	000000df 	ldrdeq	r0, [r0], -pc	; <UNPREDICTABLE>
    1258:	000aef0a 	andeq	lr, sl, sl, lsl #30
    125c:	dc150100 	ldfles	f0, [r5], {-0}
    1260:	5800008a 	stmdapl	r0, {r1, r3, r7}
    1264:	01000000 	mrseq	r0, (UNDEF: 0)
    1268:	0001319c 	muleq	r1, ip, r1
    126c:	73750b00 	cmnvc	r5, #0, 22
    1270:	72150100 	andsvc	r0, r5, #0, 2
    1274:	02000000 	andeq	r0, r0, #0
    1278:	740c6c91 	strvc	r6, [ip], #-3217	; 0xfffff36f
    127c:	17010073 	smlsdxne	r1, r3, r0, r0
    1280:	0000007d 	andeq	r0, r0, sp, ror r0
    1284:	00749102 	rsbseq	r9, r4, r2, lsl #2
    1288:	000adc0d 	andeq	sp, sl, sp, lsl #24
    128c:	fb100100 	blx	401696 <_stack+0x381696>
    1290:	b8000000 	stmdalt	r0, {}	; <UNPREDICTABLE>
    1294:	2400008a 	strcs	r0, [r0], #-138	; 0xffffff76
    1298:	01000000 	mrseq	r0, (UNDEF: 0)
    129c:	06f3009c 	usateq	r0, #19, ip, lsl #1
    12a0:	00040000 	andeq	r0, r4, r0
    12a4:	00000719 	andeq	r0, r0, r9, lsl r7
    12a8:	00440104 	subeq	r0, r4, r4, lsl #2
    12ac:	be0c0000 	cdplt	0, 0, cr0, cr12, cr0, {0}
    12b0:	3400000b 	strcc	r0, [r0], #-11
    12b4:	9c00008b 	stcls	0, cr0, [r0], {139}	; 0x8b
    12b8:	fc000003 	stc2	0, cr0, [r0], {3}
    12bc:	02000008 	andeq	r0, r0, #8
    12c0:	00dc0601 	sbcseq	r0, ip, r1, lsl #12
    12c4:	01020000 	mrseq	r0, (UNDEF: 2)
    12c8:	0000da08 	andeq	sp, r0, r8, lsl #20
    12cc:	05020200 	streq	r0, [r2, #-512]	; 0xfffffe00
    12d0:	0000013b 	andeq	r0, r0, fp, lsr r1
    12d4:	e8070202 	stmda	r7, {r1, r9}
    12d8:	02000000 	andeq	r0, r0, #0
    12dc:	01320504 	teqeq	r2, r4, lsl #10
    12e0:	b0030000 	andlt	r0, r3, r0
    12e4:	02000001 	andeq	r0, r0, #1
    12e8:	00004f41 	andeq	r4, r0, r1, asr #30
    12ec:	07040200 	streq	r0, [r4, -r0, lsl #4]
    12f0:	00000112 	andeq	r0, r0, r2, lsl r1
    12f4:	2d050802 	stccs	8, cr0, [r5, #-8]
    12f8:	02000001 	andeq	r0, r0, #1
    12fc:	010d0708 	tsteq	sp, r8, lsl #14
    1300:	04040000 	streq	r0, [r4], #-0
    1304:	746e6905 	strbtvc	r6, [lr], #-2309	; 0xfffff6fb
    1308:	00640500 	rsbeq	r0, r4, r0, lsl #10
    130c:	04020000 	streq	r0, [r2], #-0
    1310:	00011707 	andeq	r1, r1, r7, lsl #14
    1314:	01b20300 			; <UNDEFINED> instruction: 0x01b20300
    1318:	30030000 	andcc	r0, r3, r0
    131c:	00000044 	andeq	r0, r0, r4, asr #32
    1320:	00007705 	andeq	r7, r0, r5, lsl #14
    1324:	00820600 	addeq	r0, r2, r0, lsl #12
    1328:	82030000 	andhi	r0, r3, #0
    132c:	04000001 	streq	r0, [r0], #-1
    1330:	00008212 	andeq	r8, r0, r2, lsl r2
    1334:	06a10300 	strteq	r0, [r1], r0, lsl #6
    1338:	13040000 	movwne	r0, #16384	; 0x4000
    133c:	00000087 	andeq	r0, r0, r7, lsl #1
    1340:	00084103 	andeq	r4, r8, r3, lsl #2
    1344:	82140400 	andshi	r0, r4, #0, 8
    1348:	07000000 	streq	r0, [r0, -r0]
    134c:	3a39052c 	bcc	e42804 <_stack+0xdc2804>
    1350:	08000001 	stmdaeq	r0, {r0}
    1354:	00000ba4 	andeq	r0, r0, r4, lsr #23
    1358:	008c3a05 	addeq	r3, ip, r5, lsl #20
    135c:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
    1360:	00000c10 	andeq	r0, r0, r0, lsl ip
    1364:	008c3b05 	addeq	r3, ip, r5, lsl #22
    1368:	08040000 	stmdaeq	r4, {}	; <UNPREDICTABLE>
    136c:	00000c2b 	andeq	r0, r0, fp, lsr #24
    1370:	008c3c05 	addeq	r3, ip, r5, lsl #24
    1374:	08080000 	stmdaeq	r8, {}	; <UNPREDICTABLE>
    1378:	00000cae 	andeq	r0, r0, lr, lsr #25
    137c:	008c3d05 	addeq	r3, ip, r5, lsl #26
    1380:	080c0000 	stmdaeq	ip, {}	; <UNPREDICTABLE>
    1384:	00000b95 	muleq	r0, r5, fp
    1388:	008c3e05 	addeq	r3, ip, r5, lsl #28
    138c:	08100000 	ldmdaeq	r0, {}	; <UNPREDICTABLE>
    1390:	00000b55 	andeq	r0, r0, r5, asr fp
    1394:	00973f05 	addseq	r3, r7, r5, lsl #30
    1398:	08140000 	ldmdaeq	r4, {}	; <UNPREDICTABLE>
    139c:	00000bfc 	strdeq	r0, [r0], -ip
    13a0:	00974005 	addseq	r4, r7, r5
    13a4:	08180000 	ldmdaeq	r8, {}	; <UNPREDICTABLE>
    13a8:	00000b23 	andeq	r0, r0, r3, lsr #22
    13ac:	008c4105 	addeq	r4, ip, r5, lsl #2
    13b0:	081c0000 	ldmdaeq	ip, {}	; <UNPREDICTABLE>
    13b4:	00000ce7 	andeq	r0, r0, r7, ror #25
    13b8:	008c4205 	addeq	r4, ip, r5, lsl #4
    13bc:	08200000 	stmdaeq	r0!, {}	; <UNPREDICTABLE>
    13c0:	00000c99 	muleq	r0, r9, ip
    13c4:	00974305 	addseq	r4, r7, r5, lsl #6
    13c8:	08240000 	stmdaeq	r4!, {}	; <UNPREDICTABLE>
    13cc:	00000bec 	andeq	r0, r0, ip, ror #23
    13d0:	008c4405 	addeq	r4, ip, r5, lsl #8
    13d4:	00280000 	eoreq	r0, r8, r0
    13d8:	000b3203 	andeq	r3, fp, r3, lsl #4
    13dc:	ad450500 	cfstr64ge	mvdx0, [r5, #-0]
    13e0:	07000000 	streq	r0, [r0, -r0]
    13e4:	66470508 	strbvs	r0, [r7], -r8, lsl #10
    13e8:	08000001 	stmdaeq	r0, {r0}
    13ec:	00000c41 	andeq	r0, r0, r1, asr #24
    13f0:	00974805 	addseq	r4, r7, r5, lsl #16
    13f4:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
    13f8:	00000b64 	andeq	r0, r0, r4, ror #22
    13fc:	008c4905 	addeq	r4, ip, r5, lsl #18
    1400:	00040000 	andeq	r0, r4, r0
    1404:	000cc803 	andeq	ip, ip, r3, lsl #16
    1408:	454a0500 	strbmi	r0, [sl, #-1280]	; 0xfffffb00
    140c:	09000001 	stmdbeq	r0, {r0}
    1410:	00002801 	andeq	r2, r0, r1, lsl #16
    1414:	ae420600 	cdpge	6, 4, cr0, cr2, cr0, {0}
    1418:	0a000001 	beq	1424 <_heap_top+0x424>
    141c:	0000076a 	andeq	r0, r0, sl, ror #14
    1420:	067c0a00 	ldrbteq	r0, [ip], -r0, lsl #20
    1424:	0a010000 	beq	4142c <__bss_end__+0x37ee4>
    1428:	000008ac 	andeq	r0, r0, ip, lsr #17
    142c:	08a40a02 	stmiaeq	r4!, {r1, r9, fp}
    1430:	0a030000 	beq	c1438 <_stack+0x41438>
    1434:	00000884 	andeq	r0, r0, r4, lsl #17
    1438:	088c0a04 	stmeq	ip, {r2, r9, fp}
    143c:	0a050000 	beq	141444 <_stack+0xc1444>
    1440:	00000894 	muleq	r0, r4, r8
    1444:	089c0a06 	ldmeq	ip, {r1, r2, r9, fp}
    1448:	00070000 	andeq	r0, r7, r0
    144c:	00280109 	eoreq	r0, r8, r9, lsl #2
    1450:	51060000 	mrspl	r0, (UNDEF: 6)
    1454:	000002ff 	strdeq	r0, [r0], -pc	; <UNPREDICTABLE>
    1458:	0006400a 	andeq	r4, r6, sl
    145c:	4a0a0000 	bmi	281464 <_stack+0x201464>
    1460:	01000006 	tsteq	r0, r6
    1464:	0006540a 	andeq	r5, r6, sl, lsl #8
    1468:	160a0200 	strne	r0, [sl], -r0, lsl #4
    146c:	03000008 	movweq	r0, #8
    1470:	00065e0a 	andeq	r5, r6, sl, lsl #28
    1474:	680a0400 	stmdavs	sl, {sl}
    1478:	05000006 	streq	r0, [r0, #-6]
    147c:	0006720a 	andeq	r7, r6, sl, lsl #4
    1480:	600a0600 	andvs	r0, sl, r0, lsl #12
    1484:	07000007 	streq	r0, [r0, -r7]
    1488:	0006860a 	andeq	r8, r6, sl, lsl #12
    148c:	900a0800 	andls	r0, sl, r0, lsl #16
    1490:	09000006 	stmdbeq	r0, {r1, r2}
    1494:	0005700a 	andeq	r7, r5, sl
    1498:	7b0a0a00 	blvc	283ca0 <_stack+0x203ca0>
    149c:	0b000005 	bleq	14b8 <_heap_top+0x4b8>
    14a0:	0005860a 	andeq	r8, r5, sl, lsl #12
    14a4:	910a0c00 	tstls	sl, r0, lsl #24
    14a8:	0d000005 	stceq	0, cr0, [r0, #-20]	; 0xffffffec
    14ac:	00059c0a 	andeq	r9, r5, sl, lsl #24
    14b0:	a70a0e00 	strge	r0, [sl, -r0, lsl #28]
    14b4:	0f000005 	svceq	0x00000005
    14b8:	0005b20a 	andeq	fp, r5, sl, lsl #4
    14bc:	bd0a1000 	stclt	0, cr1, [sl, #-0]
    14c0:	11000005 	tstne	r0, r5
    14c4:	0005c80a 	andeq	ip, r5, sl, lsl #16
    14c8:	d30a1200 	movwle	r1, #41472	; 0xa200
    14cc:	13000005 	movwne	r0, #5
    14d0:	0004ef0a 	andeq	lr, r4, sl, lsl #30
    14d4:	ae0a1400 	cfcpysge	mvf1, mvf10
    14d8:	15000006 	strne	r0, [r0, #-6]
    14dc:	0006b90a 	andeq	fp, r6, sl, lsl #18
    14e0:	c40a1600 	strgt	r1, [sl], #-1536	; 0xfffffa00
    14e4:	17000006 	strne	r0, [r0, -r6]
    14e8:	0006cf0a 	andeq	ip, r6, sl, lsl #30
    14ec:	da0a1800 	ble	2874f4 <_stack+0x2074f4>
    14f0:	19000006 	stmdbne	r0, {r1, r2}
    14f4:	0006e50a 	andeq	lr, r6, sl, lsl #10
    14f8:	f00a1a00 			; <UNDEFINED> instruction: 0xf00a1a00
    14fc:	1b000006 	blne	151c <_heap_top+0x51c>
    1500:	0006fb0a 	andeq	pc, r6, sl, lsl #22
    1504:	060a1c00 	streq	r1, [sl], -r0, lsl #24
    1508:	1d000007 	stcne	0, cr0, [r0, #-28]	; 0xffffffe4
    150c:	0007f50a 	andeq	pc, r7, sl, lsl #10
    1510:	000a1e00 	andeq	r1, sl, r0, lsl #28
    1514:	1f000008 	svcne	0x00000008
    1518:	00080b0a 	andeq	r0, r8, sl, lsl #22
    151c:	ab0a2000 	blge	289524 <_stack+0x209524>
    1520:	21000007 	tstcs	r0, r7
    1524:	0008200a 	andeq	r2, r8, sl
    1528:	2b0a2200 	blcs	289d30 <_stack+0x209d30>
    152c:	23000008 	movwcs	r0, #8
    1530:	0008360a 	andeq	r3, r8, sl, lsl #12
    1534:	ce0a2400 	cfcpysgt	mvf2, mvf10
    1538:	25000007 	strcs	r0, [r0, #-7]
    153c:	00084e0a 	andeq	r4, r8, sl, lsl #28
    1540:	590a2600 	stmdbpl	sl, {r9, sl, sp}
    1544:	27000008 	strcs	r0, [r0, -r8]
    1548:	00046a0a 	andeq	r6, r4, sl, lsl #20
    154c:	650a2800 	strvs	r2, [sl, #-2048]	; 0xfffff800
    1550:	29000005 	stmdbcs	r0, {r0, r2}
    1554:	0004750a 	andeq	r7, r4, sl, lsl #10
    1558:	800a2a00 	andhi	r2, sl, r0, lsl #20
    155c:	2b000004 	blcs	1574 <_heap_top+0x574>
    1560:	00048b0a 	andeq	r8, r4, sl, lsl #22
    1564:	960a2c00 	strls	r2, [sl], -r0, lsl #24
    1568:	2d000004 	stccs	0, cr0, [r0, #-16]
    156c:	0004a10a 	andeq	sl, r4, sl, lsl #2
    1570:	ac0a2e00 	stcge	14, cr2, [sl], {-0}
    1574:	2f000004 	svccs	0x00000004
    1578:	0004b70a 	andeq	fp, r4, sl, lsl #14
    157c:	c20a3000 	andgt	r3, sl, #0
    1580:	31000004 	tstcc	r0, r4
    1584:	0005e70a 	andeq	lr, r5, sl, lsl #14
    1588:	f20a3200 	vhsub.s8	d3, d10, d0
    158c:	33000005 	movwcc	r0, #5
    1590:	0007ea0a 	andeq	lr, r7, sl, lsl #20
    1594:	fd0a3400 	stc2	4, cr3, [sl, #-0]
    1598:	35000005 	strcc	r0, [r0, #-5]
    159c:	06a40700 	strteq	r0, [r4], r0, lsl #14
    15a0:	0004f49b 	muleq	r4, fp, r4
    15a4:	042b0800 	strteq	r0, [fp], #-2048	; 0xfffff800
    15a8:	9c060000 	stcls	0, cr0, [r6], {-0}
    15ac:	0000008c 	andeq	r0, r0, ip, lsl #1
    15b0:	04330800 	ldrteq	r0, [r3], #-2048	; 0xfffff800
    15b4:	9d060000 	stcls	0, cr0, [r6, #-0]
    15b8:	0000008c 	andeq	r0, r0, ip, lsl #1
    15bc:	043b0804 	ldrteq	r0, [fp], #-2052	; 0xfffff7fc
    15c0:	9e060000 	cdpls	0, 0, cr0, cr6, cr0, {0}
    15c4:	0000008c 	andeq	r0, r0, ip, lsl #1
    15c8:	04430808 	strbeq	r0, [r3], #-2056	; 0xfffff7f8
    15cc:	9f060000 	svcls	0x00060000
    15d0:	0000008c 	andeq	r0, r0, ip, lsl #1
    15d4:	044b080c 	strbeq	r0, [fp], #-2060	; 0xfffff7f4
    15d8:	a0060000 	andge	r0, r6, r0
    15dc:	0000008c 	andeq	r0, r0, ip, lsl #1
    15e0:	04530810 	ldrbeq	r0, [r3], #-2064	; 0xfffff7f0
    15e4:	a1060000 	mrsge	r0, (UNDEF: 6)
    15e8:	0000008c 	andeq	r0, r0, ip, lsl #1
    15ec:	05110814 	ldreq	r0, [r1, #-2068]	; 0xfffff7ec
    15f0:	a2060000 	andge	r0, r6, #0
    15f4:	00000097 	muleq	r0, r7, r0
    15f8:	041d0818 	ldreq	r0, [sp], #-2072	; 0xfffff7e8
    15fc:	a3060000 	movwge	r0, #24576	; 0x6000
    1600:	000000a2 	andeq	r0, r0, r2, lsr #1
    1604:	0424081c 	strteq	r0, [r4], #-2076	; 0xfffff7e4
    1608:	a4060000 	strge	r0, [r6], #-0
    160c:	000000a2 	andeq	r0, r0, r2, lsr #1
    1610:	051b0820 	ldreq	r0, [fp, #-2080]	; 0xfffff7e0
    1614:	a5060000 	strge	r0, [r6, #-0]
    1618:	00000097 	muleq	r0, r7, r0
    161c:	08bf0824 	ldmeq	pc!, {r2, r5, fp}	; <UNPREDICTABLE>
    1620:	a6060000 	strge	r0, [r6], -r0
    1624:	000000a2 	andeq	r0, r0, r2, lsr #1
    1628:	069a0828 	ldreq	r0, [sl], r8, lsr #16
    162c:	a7060000 	strge	r0, [r6, -r0]
    1630:	000000a2 	andeq	r0, r0, r2, lsr #1
    1634:	0525082c 	streq	r0, [r5, #-2092]!	; 0xfffff7d4
    1638:	a8060000 	stmdage	r6, {}	; <UNPREDICTABLE>
    163c:	00000097 	muleq	r0, r7, r0
    1640:	07b60830 			; <UNDEFINED> instruction: 0x07b60830
    1644:	a9060000 	stmdbge	r6, {}	; <UNPREDICTABLE>
    1648:	000000a2 	andeq	r0, r0, r2, lsr #1
    164c:	07bd0834 			; <UNDEFINED> instruction: 0x07bd0834
    1650:	aa060000 	bge	181658 <_stack+0x101658>
    1654:	000000a2 	andeq	r0, r0, r2, lsr #1
    1658:	052f0838 	streq	r0, [pc, #-2104]!	; e28 <CPSR_IRQ_INHIBIT+0xda8>
    165c:	ab060000 	blge	181664 <_stack+0x101664>
    1660:	00000097 	muleq	r0, r7, r0
    1664:	0543083c 	strbeq	r0, [r3, #-2108]	; 0xfffff7c4
    1668:	ac060000 	stcge	0, cr0, [r6], {-0}
    166c:	000000a2 	andeq	r0, r0, r2, lsr #1
    1670:	054a0840 	strbeq	r0, [sl, #-2112]	; 0xfffff7c0
    1674:	ad060000 	stcge	0, cr0, [r6, #-0]
    1678:	000000a2 	andeq	r0, r0, r2, lsr #1
    167c:	07c40844 	strbeq	r0, [r4, r4, asr #16]
    1680:	ae060000 	cdpge	0, 0, cr0, cr6, cr0, {0}
    1684:	00000097 	muleq	r0, r7, r0
    1688:	04da0848 	ldrbeq	r0, [sl], #2120	; 0x848
    168c:	af060000 	svcge	0x00060000
    1690:	000000a2 	andeq	r0, r0, r2, lsr #1
    1694:	04e1084c 	strbteq	r0, [r1], #2124	; 0x84c
    1698:	b0060000 	andlt	r0, r6, r0
    169c:	000000a2 	andeq	r0, r0, r2, lsr #1
    16a0:	05390850 	ldreq	r0, [r9, #-2128]!	; 0xfffff7b0
    16a4:	b1060000 	mrslt	r0, (UNDEF: 6)
    16a8:	00000097 	muleq	r0, r7, r0
    16ac:	087d0854 	ldmdaeq	sp!, {r2, r4, r6, fp}^
    16b0:	b2060000 	andlt	r0, r6, #0
    16b4:	000000a2 	andeq	r0, r0, r2, lsr #1
    16b8:	045b0858 	ldrbeq	r0, [fp], #-2136	; 0xfffff7a8
    16bc:	b3060000 	movwlt	r0, #24576	; 0x6000
    16c0:	000000a2 	andeq	r0, r0, r2, lsr #1
    16c4:	07d9085c 			; <UNDEFINED> instruction: 0x07d9085c
    16c8:	b4060000 	strlt	r0, [r6], #-0
    16cc:	00000097 	muleq	r0, r7, r0
    16d0:	04e80860 	strbteq	r0, [r8], #2144	; 0x860
    16d4:	b5060000 	strlt	r0, [r6, #-0]
    16d8:	000000a2 	andeq	r0, r0, r2, lsr #1
    16dc:	07e30864 	strbeq	r0, [r3, r4, ror #16]!
    16e0:	b6060000 	strlt	r0, [r6], -r0
    16e4:	000000a2 	andeq	r0, r0, r2, lsr #1
    16e8:	08640868 	stmdaeq	r4!, {r3, r5, r6, fp}^
    16ec:	b7060000 	strlt	r0, [r6, -r0]
    16f0:	00000097 	muleq	r0, r7, r0
    16f4:	0629086c 	strteq	r0, [r9], -ip, ror #16
    16f8:	b8060000 	stmdalt	r6, {}	; <UNPREDICTABLE>
    16fc:	000000a2 	andeq	r0, r0, r2, lsr #1
    1700:	07240870 			; <UNDEFINED> instruction: 0x07240870
    1704:	b9060000 	stmdblt	r6, {}	; <UNPREDICTABLE>
    1708:	000000a2 	andeq	r0, r0, r2, lsr #1
    170c:	05510874 	ldrbeq	r0, [r1, #-2164]	; 0xfffff78c
    1710:	ba060000 	blt	181718 <_stack+0x101718>
    1714:	00000097 	muleq	r0, r7, r0
    1718:	071c0878 			; <UNDEFINED> instruction: 0x071c0878
    171c:	bb060000 	bllt	181724 <_stack+0x101724>
    1720:	000000a2 	andeq	r0, r0, r2, lsr #1
    1724:	0740087c 	smlsldxeq	r0, r0, ip, r8	; <UNPREDICTABLE>
    1728:	bc060000 	stclt	0, cr0, [r6], {-0}
    172c:	000000a2 	andeq	r0, r0, r2, lsr #1
    1730:	055b0880 	ldrbeq	r0, [fp, #-2176]	; 0xfffff780
    1734:	bd060000 	stclt	0, cr0, [r6, #-0]
    1738:	00000097 	muleq	r0, r7, r0
    173c:	06300884 	ldrteq	r0, [r0], -r4, lsl #17
    1740:	be060000 	cdplt	0, 0, cr0, cr6, cr0, {0}
    1744:	000000a2 	andeq	r0, r0, r2, lsr #1
    1748:	06380888 	ldrteq	r0, [r8], -r8, lsl #17
    174c:	bf060000 	svclt	0x00060000
    1750:	000000a2 	andeq	r0, r0, r2, lsr #1
    1754:	0735088c 	ldreq	r0, [r5, -ip, lsl #17]!
    1758:	c0060000 	andgt	r0, r6, r0
    175c:	00000097 	muleq	r0, r7, r0
    1760:	06080890 			; <UNDEFINED> instruction: 0x06080890
    1764:	c1060000 	mrsgt	r0, (UNDEF: 6)
    1768:	000000a2 	andeq	r0, r0, r2, lsr #1
    176c:	072b0894 			; <UNDEFINED> instruction: 0x072b0894
    1770:	c2060000 	andgt	r0, r6, #0
    1774:	000000a2 	andeq	r0, r0, r2, lsr #1
    1778:	07730898 			; <UNDEFINED> instruction: 0x07730898
    177c:	c3060000 	movwgt	r0, #24576	; 0x6000
    1780:	000000a2 	andeq	r0, r0, r2, lsr #1
    1784:	0711089c 			; <UNDEFINED> instruction: 0x0711089c
    1788:	c4060000 	strgt	r0, [r6], #-0
    178c:	00000097 	muleq	r0, r7, r0
    1790:	b40300a0 	strlt	r0, [r3], #-160	; 0xffffff60
    1794:	06000008 	streq	r0, [r0], -r8
    1798:	0002ffc5 	andeq	pc, r2, r5, asr #31
    179c:	07180700 	ldreq	r0, [r8, -r0, lsl #14]
    17a0:	00053802 	andeq	r3, r5, r2, lsl #16
    17a4:	0bb70800 	bleq	fedc37ac <CPSR_UNAFFECTED_BITS+0xfedc38ac>
    17a8:	04070000 	streq	r0, [r7], #-0
    17ac:	00000538 	andeq	r0, r0, r8, lsr r5
    17b0:	0ca90800 	stceq	8, cr0, [r9]
    17b4:	05070000 	streq	r0, [r7, #-0]
    17b8:	00000064 	andeq	r0, r0, r4, rrx
    17bc:	0c0b080c 	stceq	8, cr0, [fp], {12}
    17c0:	06070000 	streq	r0, [r7], -r0
    17c4:	00000064 	andeq	r0, r0, r4, rrx
    17c8:	02330810 	eorseq	r0, r3, #16, 16	; 0x100000
    17cc:	07070000 	streq	r0, [r7, -r0]
    17d0:	00000064 	andeq	r0, r0, r4, rrx
    17d4:	4f0b0014 	svcmi	0x000b0014
    17d8:	48000005 	stmdami	r0, {r0, r2}
    17dc:	0c000005 	stceq	0, cr0, [r0], {5}
    17e0:	00000548 	andeq	r0, r0, r8, asr #10
    17e4:	04020009 	streq	r0, [r2], #-9
    17e8:	00012407 	andeq	r2, r1, r7, lsl #8
    17ec:	08010200 	stmdaeq	r1, {r9}
    17f0:	000000e3 	andeq	r0, r0, r3, ror #1
    17f4:	000c5f03 	andeq	r5, ip, r3, lsl #30
    17f8:	ff080700 			; <UNDEFINED> instruction: 0xff080700
    17fc:	0d000004 	stceq	0, cr0, [r0, #-16]
    1800:	00000c3a 	andeq	r0, r0, sl, lsr ip
    1804:	05721601 	ldrbeq	r1, [r2, #-1537]!	; 0xfffff9ff
    1808:	03050000 	movweq	r0, #20480	; 0x5000
    180c:	0000944c 	andeq	r9, r0, ip, asr #8
    1810:	0166040e 	cmneq	r6, lr, lsl #8
    1814:	1f0d0000 	svcne	0x000d0000
    1818:	0100000c 	tsteq	r0, ip
    181c:	00058917 	andeq	r8, r5, r7, lsl r9
    1820:	50030500 	andpl	r0, r3, r0, lsl #10
    1824:	0e000094 	mcreq	0, 0, r0, cr0, cr4, {4}
    1828:	00013a04 	andeq	r3, r1, r4, lsl #20
    182c:	0bb20d00 	bleq	fec84c34 <CPSR_UNAFFECTED_BITS+0xfec84d34>
    1830:	18010000 	stmdane	r1, {}	; <UNPREDICTABLE>
    1834:	00000556 	andeq	r0, r0, r6, asr r5
    1838:	95300305 	ldrls	r0, [r0, #-773]!	; 0xfffffcfb
    183c:	3d0f0000 	stccc	0, cr0, [pc, #-0]	; 1844 <_heap_top+0x844>
    1840:	0100000b 	tsteq	r0, fp
    1844:	008df06a 	addeq	pc, sp, sl, rrx
    1848:	0000e000 	andeq	lr, r0, r0
    184c:	d29c0100 	addsle	r0, ip, #0, 2
    1850:	0d000005 	stceq	0, cr0, [r0, #-20]	; 0xffffffec
    1854:	00000c49 	andeq	r0, r0, r9, asr #24
    1858:	00826c01 	addeq	r6, r2, r1, lsl #24
    185c:	91020000 	mrsls	r0, (UNDEF: 2)
    1860:	0c660d74 	stcleq	13, cr0, [r6], #-464	; 0xfffffe30
    1864:	6d010000 	stcvs	0, cr0, [r1, #-0]
    1868:	0000054f 	andeq	r0, r0, pc, asr #10
    186c:	00739102 	rsbseq	r9, r3, r2, lsl #2
    1870:	000c7410 	andeq	r7, ip, r0, lsl r4
    1874:	64650100 	strbtvs	r0, [r5], #-256	; 0xffffff00
    1878:	b8000000 	stmdalt	r0, {}	; <UNPREDICTABLE>
    187c:	3800008d 	stmdacc	r0, {r0, r2, r3, r7}
    1880:	01000000 	mrseq	r0, (UNDEF: 0)
    1884:	0006089c 	muleq	r6, ip, r8
    1888:	0c521100 	ldfeqe	f1, [r2], {-0}
    188c:	65010000 	strvs	r0, [r1, #-0]
    1890:	00000608 	andeq	r0, r0, r8, lsl #12
    1894:	11749102 	cmnne	r4, r2, lsl #2
    1898:	00000b4e 	andeq	r0, r0, lr, asr #22
    189c:	00646501 	rsbeq	r6, r4, r1, lsl #10
    18a0:	91020000 	mrsls	r0, (UNDEF: 2)
    18a4:	040e0070 	streq	r0, [lr], #-112	; 0xffffff90
    18a8:	0000054f 	andeq	r0, r0, pc, asr #10
    18ac:	000cf70f 	andeq	pc, ip, pc, lsl #14
    18b0:	705c0100 	subsvc	r0, ip, r0, lsl #2
    18b4:	4800008d 	stmdami	r0, {r0, r2, r3, r7}
    18b8:	01000000 	mrseq	r0, (UNDEF: 0)
    18bc:	0006329c 	muleq	r6, ip, r2
    18c0:	09481100 	stmdbeq	r8, {r8, ip}^
    18c4:	5c010000 	stcpl	0, cr0, [r1], {-0}
    18c8:	00000608 	andeq	r0, r0, r8, lsl #12
    18cc:	00749102 	rsbseq	r9, r4, r2, lsl #2
    18d0:	000cd210 	andeq	sp, ip, r0, lsl r2
    18d4:	64520100 	ldrbvs	r0, [r2], #-256	; 0xffffff00
    18d8:	0c000000 	stceq	0, cr0, [r0], {-0}
    18dc:	6400008d 	strvs	r0, [r0], #-141	; 0xffffff73
    18e0:	01000000 	mrseq	r0, (UNDEF: 0)
    18e4:	0006749c 	muleq	r6, ip, r4
    18e8:	09481100 	stmdbeq	r8, {r8, ip}^
    18ec:	52010000 	andpl	r0, r1, #0
    18f0:	00000608 	andeq	r0, r0, r8, lsl #12
    18f4:	126c9102 	rsbne	r9, ip, #-2147483648	; 0x80000000
    18f8:	006e656c 	rsbeq	r6, lr, ip, ror #10
    18fc:	00645201 	rsbeq	r5, r4, r1, lsl #4
    1900:	91020000 	mrsls	r0, (UNDEF: 2)
    1904:	00691368 	rsbeq	r1, r9, r8, ror #6
    1908:	00645401 	rsbeq	r5, r4, r1, lsl #8
    190c:	91020000 	mrsls	r0, (UNDEF: 2)
    1910:	70140074 	andsvc	r0, r4, r4, ror r0
    1914:	0100000b 	tsteq	r0, fp
    1918:	008cb849 	addeq	fp, ip, r9, asr #16
    191c:	00005400 	andeq	r5, r0, r0, lsl #8
    1920:	969c0100 	ldrls	r0, [ip], r0, lsl #2
    1924:	12000006 	andne	r0, r0, #6
    1928:	49010063 	stmdbmi	r1, {r0, r1, r5, r6}
    192c:	0000054f 	andeq	r0, r0, pc, asr #10
    1930:	00779102 	rsbseq	r9, r7, r2, lsl #2
    1934:	000b840f 	andeq	r8, fp, pc, lsl #8
    1938:	7c240100 	stfvcs	f0, [r4], #-0
    193c:	3c00008b 	stccc	0, cr0, [r0], {139}	; 0x8b
    1940:	01000001 	tsteq	r0, r1
    1944:	0006c69c 	muleq	r6, ip, r6
    1948:	00691300 	rsbeq	r1, r9, r0, lsl #6
    194c:	006b2601 	rsbeq	r2, fp, r1, lsl #12
    1950:	91020000 	mrsls	r0, (UNDEF: 2)
    1954:	0c570d70 	mrrceq	13, 7, r0, r7, cr0
    1958:	28010000 	stmdacs	r1, {}	; <UNPREDICTABLE>
    195c:	000006c6 	andeq	r0, r0, r6, asr #13
    1960:	00749102 	rsbseq	r9, r4, r2, lsl #2
    1964:	04f4040e 	ldrbteq	r0, [r4], #1038	; 0x40e
    1968:	89150000 	ldmdbhi	r5, {}	; <UNPREDICTABLE>
    196c:	0100000c 	tsteq	r0, ip
    1970:	0005891f 	andeq	r8, r5, pc, lsl r9
    1974:	008b5800 	addeq	r5, fp, r0, lsl #16
    1978:	00002400 	andeq	r2, r0, r0, lsl #8
    197c:	159c0100 	ldrne	r0, [ip, #256]	; 0x100
    1980:	00000cbd 			; <UNDEFINED> instruction: 0x00000cbd
    1984:	05721a01 	ldrbeq	r1, [r2, #-2561]!	; 0xfffff5ff
    1988:	8b340000 	blhi	d01990 <_stack+0xc81990>
    198c:	00240000 	eoreq	r0, r4, r0
    1990:	9c010000 	stcls	0, cr0, [r1], {-0}
    1994:	0009f300 	andeq	pc, r9, r0, lsl #6
    1998:	51000400 	tstpl	r0, r0, lsl #8
    199c:	04000008 	streq	r0, [r0], #-8
    19a0:	00004401 	andeq	r4, r0, r1, lsl #8
    19a4:	0d5d0c00 	ldcleq	12, cr0, [sp, #-0]
    19a8:	0f480000 	svceq	0x00480000
    19ac:	8ed00000 	cdphi	0, 13, cr0, cr0, cr0, {0}
    19b0:	00a80000 	adceq	r0, r8, r0
    19b4:	0a740000 	beq	1d019bc <_stack+0x1c819bc>
    19b8:	01020000 	mrseq	r0, (UNDEF: 2)
    19bc:	0000dc06 	andeq	sp, r0, r6, lsl #24
    19c0:	08010200 	stmdaeq	r1, {r9}
    19c4:	000000da 	ldrdeq	r0, [r0], -sl
    19c8:	3b050202 	blcc	1421d8 <_stack+0xc21d8>
    19cc:	02000001 	andeq	r0, r0, #1
    19d0:	00e80702 	rsceq	r0, r8, r2, lsl #14
    19d4:	04020000 	streq	r0, [r2], #-0
    19d8:	00013205 	andeq	r3, r1, r5, lsl #4
    19dc:	01b00300 	lslseq	r0, r0, #6
    19e0:	41020000 	mrsmi	r0, (UNDEF: 2)
    19e4:	00000053 	andeq	r0, r0, r3, asr r0
    19e8:	12070402 	andne	r0, r7, #33554432	; 0x2000000
    19ec:	02000001 	andeq	r0, r0, #1
    19f0:	012d0508 			; <UNDEFINED> instruction: 0x012d0508
    19f4:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
    19f8:	00010d07 	andeq	r0, r1, r7, lsl #26
    19fc:	05040400 	streq	r0, [r4, #-1024]	; 0xfffffc00
    1a00:	00746e69 	rsbseq	r6, r4, r9, ror #28
    1a04:	17070402 	strne	r0, [r7, -r2, lsl #8]
    1a08:	02000001 	andeq	r0, r0, #1
    1a0c:	0f080408 	svceq	0x00080408
    1a10:	04050000 	streq	r0, [r5], #-0
    1a14:	000f7103 	andeq	r7, pc, r3, lsl #2
    1a18:	68070300 	stmdavs	r7, {r8, r9}
    1a1c:	03000000 	movweq	r0, #0
    1a20:	00000f41 	andeq	r0, r0, r1, asr #30
    1a24:	00412c04 	subeq	r2, r1, r4, lsl #24
    1a28:	38030000 	stmdacc	r3, {}	; <UNPREDICTABLE>
    1a2c:	04000010 	streq	r0, [r0], #-16
    1a30:	00004172 	andeq	r4, r0, r2, ror r1
    1a34:	0ed60600 	cdpeq	6, 13, cr0, cr6, cr0, {0}
    1a38:	65050000 	strvs	r0, [r5, #-0]
    1a3c:	00006f01 	andeq	r6, r0, r1, lsl #30
    1a40:	04040700 	streq	r0, [r4], #-1792	; 0xfffff900
    1a44:	0000cba6 	andeq	ip, r0, r6, lsr #23
    1a48:	0ed00800 	cdpeq	8, 13, cr0, cr0, cr0, {0}
    1a4c:	a8040000 	stmdage	r4, {}	; <UNPREDICTABLE>
    1a50:	000000a0 	andeq	r0, r0, r0, lsr #1
    1a54:	000e8208 	andeq	r8, lr, r8, lsl #4
    1a58:	cba90400 	blgt	fea42a60 <CPSR_UNAFFECTED_BITS+0xfea42b60>
    1a5c:	00000000 	andeq	r0, r0, r0
    1a60:	00002c09 	andeq	r2, r0, r9, lsl #24
    1a64:	0000db00 	andeq	sp, r0, r0, lsl #22
    1a68:	00db0a00 	sbcseq	r0, fp, r0, lsl #20
    1a6c:	00030000 	andeq	r0, r3, r0
    1a70:	24070402 	strcs	r0, [r7], #-1026	; 0xfffffbfe
    1a74:	0b000001 	bleq	1a80 <_heap_top+0xa80>
    1a78:	03a30408 			; <UNDEFINED> instruction: 0x03a30408
    1a7c:	0c000001 	stceq	0, cr0, [r0], {1}
    1a80:	00001022 	andeq	r1, r0, r2, lsr #32
    1a84:	0068a504 	rsbeq	sl, r8, r4, lsl #10
    1a88:	0c000000 	stceq	0, cr0, [r0], {-0}
    1a8c:	0000102a 	andeq	r1, r0, sl, lsr #32
    1a90:	00acaa04 	adceq	sl, ip, r4, lsl #20
    1a94:	00040000 	andeq	r0, r4, r0
    1a98:	000faf03 	andeq	sl, pc, r3, lsl #30
    1a9c:	e2ab0400 	adc	r0, fp, #0, 8
    1aa0:	03000000 	movweq	r0, #0
    1aa4:	00000e4b 	andeq	r0, r0, fp, asr #28
    1aa8:	007faf04 	rsbseq	sl, pc, r4, lsl #30
    1aac:	7d030000 	stcvc	0, cr0, [r3, #-0]
    1ab0:	06000010 			; <UNDEFINED> instruction: 0x06000010
    1ab4:	00005316 	andeq	r5, r0, r6, lsl r3
    1ab8:	0e5c0d00 	cdpeq	13, 5, cr0, cr12, cr0, {0}
    1abc:	06180000 	ldreq	r0, [r8], -r0
    1ac0:	0001772d 	andeq	r7, r1, sp, lsr #14
    1ac4:	0fd00c00 	svceq	0x00d00c00
    1ac8:	2f060000 	svccs	0x00060000
    1acc:	00000177 	andeq	r0, r0, r7, ror r1
    1ad0:	6b5f0e00 	blvs	17c52d8 <_stack+0x17452d8>
    1ad4:	68300600 	ldmdavs	r0!, {r9, sl}
    1ad8:	04000000 	streq	r0, [r0], #-0
    1adc:	00100d0c 	andseq	r0, r0, ip, lsl #26
    1ae0:	68300600 	ldmdavs	r0!, {r9, sl}
    1ae4:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
    1ae8:	000e450c 	andeq	r4, lr, ip, lsl #10
    1aec:	68300600 	ldmdavs	r0!, {r9, sl}
    1af0:	0c000000 	stceq	0, cr0, [r0], {-0}
    1af4:	0010c40c 	andseq	ip, r0, ip, lsl #8
    1af8:	68300600 	ldmdavs	r0!, {r9, sl}
    1afc:	10000000 	andne	r0, r0, r0
    1b00:	00785f0e 	rsbseq	r5, r8, lr, lsl #30
    1b04:	017d3106 	cmneq	sp, r6, lsl #2
    1b08:	00140000 	andseq	r0, r4, r0
    1b0c:	0124040f 			; <UNDEFINED> instruction: 0x0124040f
    1b10:	19090000 	stmdbne	r9, {}	; <UNPREDICTABLE>
    1b14:	8d000001 	stchi	0, cr0, [r0, #-4]
    1b18:	0a000001 	beq	1b24 <_heap_top+0xb24>
    1b1c:	000000db 	ldrdeq	r0, [r0], -fp
    1b20:	7d0d0000 	stcvc	0, cr0, [sp, #-0]
    1b24:	2400000e 	strcs	r0, [r0], #-14
    1b28:	02063506 	andeq	r3, r6, #25165824	; 0x1800000
    1b2c:	ae0c0000 	cdpge	0, 0, cr0, cr12, cr0, {0}
    1b30:	0600000d 	streq	r0, [r0], -sp
    1b34:	00006837 	andeq	r6, r0, r7, lsr r8
    1b38:	400c0000 	andmi	r0, ip, r0
    1b3c:	06000010 			; <UNDEFINED> instruction: 0x06000010
    1b40:	00006838 	andeq	r6, r0, r8, lsr r8
    1b44:	bd0c0400 	cfstrslt	mvf0, [ip, #-0]
    1b48:	0600000d 	streq	r0, [r0], -sp
    1b4c:	00006839 	andeq	r6, r0, r9, lsr r8
    1b50:	3a0c0800 	bcc	303b58 <_stack+0x283b58>
    1b54:	06000011 			; <UNDEFINED> instruction: 0x06000011
    1b58:	0000683a 	andeq	r6, r0, sl, lsr r8
    1b5c:	1b0c0c00 	blne	304b64 <_stack+0x284b64>
    1b60:	0600000f 	streq	r0, [r0], -pc
    1b64:	0000683b 	andeq	r6, r0, fp, lsr r8
    1b68:	eb0c1000 	bl	305b70 <_stack+0x285b70>
    1b6c:	0600000e 	streq	r0, [r0], -lr
    1b70:	0000683c 	andeq	r6, r0, ip, lsr r8
    1b74:	c90c1400 	stmdbgt	ip, {sl, ip}
    1b78:	06000010 			; <UNDEFINED> instruction: 0x06000010
    1b7c:	0000683d 	andeq	r6, r0, sp, lsr r8
    1b80:	910c1800 	tstls	ip, r0, lsl #16
    1b84:	0600000f 	streq	r0, [r0], -pc
    1b88:	0000683e 	andeq	r6, r0, lr, lsr r8
    1b8c:	010c1c00 	tsteq	ip, r0, lsl #24
    1b90:	06000011 			; <UNDEFINED> instruction: 0x06000011
    1b94:	0000683f 	andeq	r6, r0, pc, lsr r8
    1b98:	10002000 	andne	r2, r0, r0
    1b9c:	00000dcc 	andeq	r0, r0, ip, asr #27
    1ba0:	48060108 	stmdami	r6, {r3, r8}
    1ba4:	00000246 	andeq	r0, r0, r6, asr #4
    1ba8:	000e380c 	andeq	r3, lr, ip, lsl #16
    1bac:	46490600 	strbmi	r0, [r9], -r0, lsl #12
    1bb0:	00000002 	andeq	r0, r0, r2
    1bb4:	000d070c 	andeq	r0, sp, ip, lsl #14
    1bb8:	464a0600 	strbmi	r0, [sl], -r0, lsl #12
    1bbc:	80000002 	andhi	r0, r0, r2
    1bc0:	00106f11 	andseq	r6, r0, r1, lsl pc
    1bc4:	194c0600 	stmdbne	ip, {r9, sl}^
    1bc8:	00000001 	andeq	r0, r0, r1
    1bcc:	0df11101 	ldfeqe	f1, [r1, #4]!
    1bd0:	4f060000 	svcmi	0x00060000
    1bd4:	00000119 	andeq	r0, r0, r9, lsl r1
    1bd8:	09000104 	stmdbeq	r0, {r2, r8}
    1bdc:	0000007d 	andeq	r0, r0, sp, ror r0
    1be0:	00000256 	andeq	r0, r0, r6, asr r2
    1be4:	0000db0a 	andeq	sp, r0, sl, lsl #22
    1be8:	10001f00 	andne	r1, r0, r0, lsl #30
    1bec:	00000f24 	andeq	r0, r0, r4, lsr #30
    1bf0:	5b060190 	blpl	182238 <_stack+0x102238>
    1bf4:	00000294 	muleq	r0, r4, r2
    1bf8:	000fd00c 	andeq	sp, pc, ip
    1bfc:	945c0600 	ldrbls	r0, [ip], #-1536	; 0xfffffa00
    1c00:	00000002 	andeq	r0, r0, r2
    1c04:	000fe80c 	andeq	lr, pc, ip, lsl #16
    1c08:	685d0600 	ldmdavs	sp, {r9, sl}^
    1c0c:	04000000 	streq	r0, [r0], #-0
    1c10:	000e400c 	andeq	r4, lr, ip
    1c14:	9a5f0600 	bls	17c341c <_stack+0x174341c>
    1c18:	08000002 	stmdaeq	r0, {r1}
    1c1c:	000dcc0c 	andeq	ip, sp, ip, lsl #24
    1c20:	06600600 	strbteq	r0, [r0], -r0, lsl #12
    1c24:	88000002 	stmdahi	r0, {r1}
    1c28:	56040f00 	strpl	r0, [r4], -r0, lsl #30
    1c2c:	09000002 	stmdbeq	r0, {r1}
    1c30:	000002aa 	andeq	r0, r0, sl, lsr #5
    1c34:	000002aa 	andeq	r0, r0, sl, lsr #5
    1c38:	0000db0a 	andeq	sp, r0, sl, lsl #22
    1c3c:	0f001f00 	svceq	0x00001f00
    1c40:	0002b004 	andeq	fp, r2, r4
    1c44:	9b0d1200 	blls	34644c <_stack+0x2c644c>
    1c48:	0800000f 	stmdaeq	r0, {r0, r1, r2, r3}
    1c4c:	02d67306 	sbcseq	r7, r6, #402653184	; 0x18000000
    1c50:	d90c0000 	stmdble	ip, {}	; <UNPREDICTABLE>
    1c54:	06000010 			; <UNDEFINED> instruction: 0x06000010
    1c58:	0002d674 	andeq	sp, r2, r4, ror r6
    1c5c:	320c0000 	andcc	r0, ip, #0
    1c60:	06000002 	streq	r0, [r0], -r2
    1c64:	00006875 	andeq	r6, r0, r5, ror r8
    1c68:	0f000400 	svceq	0x00000400
    1c6c:	00002c04 	andeq	r2, r0, r4, lsl #24
    1c70:	0fba0d00 	svceq	0x00ba0d00
    1c74:	06680000 	strbteq	r0, [r8], -r0
    1c78:	000406b3 			; <UNDEFINED> instruction: 0x000406b3
    1c7c:	705f0e00 	subsvc	r0, pc, r0, lsl #28
    1c80:	d6b40600 	ldrtle	r0, [r4], r0, lsl #12
    1c84:	00000002 	andeq	r0, r0, r2
    1c88:	00725f0e 	rsbseq	r5, r2, lr, lsl #30
    1c8c:	0068b506 	rsbeq	fp, r8, r6, lsl #10
    1c90:	0e040000 	cdpeq	0, 0, cr0, cr4, cr0, {0}
    1c94:	0600775f 			; <UNDEFINED> instruction: 0x0600775f
    1c98:	000068b6 			; <UNDEFINED> instruction: 0x000068b6
    1c9c:	ea0c0800 	b	303ca4 <_stack+0x283ca4>
    1ca0:	0600000d 	streq	r0, [r0], -sp
    1ca4:	000033b7 			; <UNDEFINED> instruction: 0x000033b7
    1ca8:	990c0c00 	stmdbls	ip, {sl, fp}
    1cac:	0600000e 	streq	r0, [r0], -lr
    1cb0:	000033b8 			; <UNDEFINED> instruction: 0x000033b8
    1cb4:	5f0e0e00 	svcpl	0x000e0e00
    1cb8:	06006662 	streq	r6, [r0], -r2, ror #12
    1cbc:	0002b1b9 			; <UNDEFINED> instruction: 0x0002b1b9
    1cc0:	880c1000 	stmdahi	ip, {ip}
    1cc4:	0600000d 	streq	r0, [r0], -sp
    1cc8:	000068ba 			; <UNDEFINED> instruction: 0x000068ba
    1ccc:	da0c1800 	ble	307cd4 <_stack+0x287cd4>
    1cd0:	0600000d 	streq	r0, [r0], -sp
    1cd4:	00007dc1 	andeq	r7, r0, r1, asr #27
    1cd8:	020c1c00 	andeq	r1, ip, #0, 24
    1cdc:	06000012 			; <UNDEFINED> instruction: 0x06000012
    1ce0:	000573c3 	andeq	r7, r5, r3, asr #7
    1ce4:	ed0c2000 	stc	0, cr2, [ip, #-0]
    1ce8:	06000011 			; <UNDEFINED> instruction: 0x06000011
    1cec:	00059dc5 	andeq	r9, r5, r5, asr #27
    1cf0:	320c2400 	andcc	r2, ip, #0, 8
    1cf4:	06000010 			; <UNDEFINED> instruction: 0x06000010
    1cf8:	0005c1c8 	andeq	ip, r5, r8, asr #3
    1cfc:	1b0c2800 	blne	30bd04 <_stack+0x28bd04>
    1d00:	06000011 			; <UNDEFINED> instruction: 0x06000011
    1d04:	0005dbc9 	andeq	sp, r5, r9, asr #23
    1d08:	5f0e2c00 	svcpl	0x000e2c00
    1d0c:	06006275 			; <UNDEFINED> instruction: 0x06006275
    1d10:	0002b1cc 	andeq	fp, r2, ip, asr #3
    1d14:	5f0e3000 	svcpl	0x000e3000
    1d18:	06007075 			; <UNDEFINED> instruction: 0x06007075
    1d1c:	0002d6cd 	andeq	sp, r2, sp, asr #13
    1d20:	5f0e3800 	svcpl	0x000e3800
    1d24:	06007275 			; <UNDEFINED> instruction: 0x06007275
    1d28:	000068ce 	andeq	r6, r0, lr, asr #17
    1d2c:	b70c3c00 	strlt	r3, [ip, -r0, lsl #24]
    1d30:	0600000d 	streq	r0, [r0], -sp
    1d34:	0005e1d1 	ldrdeq	lr, [r5], -r1
    1d38:	f30c4000 	vhadd.u8	d4, d12, d0
    1d3c:	06000010 			; <UNDEFINED> instruction: 0x06000010
    1d40:	0005f1d2 	ldrdeq	pc, [r5], -r2
    1d44:	5f0e4300 	svcpl	0x000e4300
    1d48:	0600626c 	streq	r6, [r0], -ip, ror #4
    1d4c:	0002b1d5 	ldrdeq	fp, [r2], -r5
    1d50:	000c4400 	andeq	r4, ip, r0, lsl #8
    1d54:	0600000e 	streq	r0, [r0], -lr
    1d58:	000068d8 	ldrdeq	r6, [r0], -r8
    1d5c:	110c4c00 	tstne	ip, r0, lsl #24
    1d60:	0600000e 	streq	r0, [r0], -lr
    1d64:	00008ad9 	ldrdeq	r8, [r0], -r9
    1d68:	510c5000 	mrspl	r5, (UNDEF: 12)
    1d6c:	0600000c 	streq	r0, [r0], -ip
    1d70:	000424dc 	ldrdeq	r2, [r4], -ip
    1d74:	dd0c5400 	cfstrsle	mvf5, [ip, #-0]
    1d78:	0600000e 	streq	r0, [r0], -lr
    1d7c:	00010ee0 	andeq	r0, r1, r0, ror #29
    1d80:	c20c5800 	andgt	r5, ip, #0, 16
    1d84:	0600000f 	streq	r0, [r0], -pc
    1d88:	000103e2 	andeq	r0, r1, r2, ror #7
    1d8c:	e30c5c00 	movw	r5, #52224	; 0xcc00
    1d90:	0600000e 	streq	r0, [r0], -lr
    1d94:	000068e3 	andeq	r6, r0, r3, ror #17
    1d98:	13006400 	movwne	r6, #1024	; 0x400
    1d9c:	00000068 	andeq	r0, r0, r8, rrx
    1da0:	00000424 	andeq	r0, r0, r4, lsr #8
    1da4:	00042414 	andeq	r2, r4, r4, lsl r4
    1da8:	007d1400 	rsbseq	r1, sp, r0, lsl #8
    1dac:	61140000 	tstvs	r4, r0
    1db0:	14000005 	strne	r0, [r0], #-5
    1db4:	00000068 	andeq	r0, r0, r8, rrx
    1db8:	2f040f00 	svccs	0x00040f00
    1dbc:	15000004 	strne	r0, [r0, #-4]
    1dc0:	00000424 	andeq	r0, r0, r4, lsr #8
    1dc4:	00101516 	andseq	r1, r0, r6, lsl r5
    1dc8:	06042800 	streq	r2, [r4], -r0, lsl #16
    1dcc:	05610238 	strbeq	r0, [r1, #-568]!	; 0xfffffdc8
    1dd0:	8a170000 	bhi	5c1dd8 <_stack+0x541dd8>
    1dd4:	0600000f 	streq	r0, [r0], -pc
    1dd8:	0068023a 	rsbeq	r0, r8, sl, lsr r2
    1ddc:	17000000 	strne	r0, [r0, -r0]
    1de0:	00000df9 	strdeq	r0, [r0], -r9
    1de4:	48023f06 	stmdami	r2, {r1, r2, r8, r9, sl, fp, ip, sp}
    1de8:	04000006 	streq	r0, [r0], #-6
    1dec:	000e8917 	andeq	r8, lr, r7, lsl r9
    1df0:	023f0600 	eorseq	r0, pc, #0, 12
    1df4:	00000648 	andeq	r0, r0, r8, asr #12
    1df8:	0e541708 	cdpeq	7, 5, cr1, cr4, cr8, {0}
    1dfc:	3f060000 	svccc	0x00060000
    1e00:	00064802 	andeq	r4, r6, r2, lsl #16
    1e04:	e3170c00 	tst	r7, #0, 24
    1e08:	0600000f 	streq	r0, [r0], -pc
    1e0c:	00680241 	rsbeq	r0, r8, r1, asr #4
    1e10:	17100000 	ldrne	r0, [r0, -r0]
    1e14:	00000d32 	andeq	r0, r0, r2, lsr sp
    1e18:	2a024206 	bcs	92638 <_stack+0x12638>
    1e1c:	14000008 	strne	r0, [r0], #-8
    1e20:	0010a517 	andseq	sl, r0, r7, lsl r5
    1e24:	02440600 	subeq	r0, r4, #0, 12
    1e28:	00000068 	andeq	r0, r0, r8, rrx
    1e2c:	0fed1730 	svceq	0x00ed1730
    1e30:	45060000 	strmi	r0, [r6, #-0]
    1e34:	00059702 	andeq	r9, r5, r2, lsl #14
    1e38:	36173400 	ldrcc	r3, [r7], -r0, lsl #8
    1e3c:	0600000f 	streq	r0, [r0], -pc
    1e40:	00680247 	rsbeq	r0, r8, r7, asr #4
    1e44:	17380000 	ldrne	r0, [r8, -r0]!
    1e48:	00001003 	andeq	r1, r0, r3
    1e4c:	45024906 	strmi	r4, [r2, #-2310]	; 0xfffff6fa
    1e50:	3c000008 	stccc	0, cr0, [r0], {8}
    1e54:	000ec817 	andeq	ip, lr, r7, lsl r8
    1e58:	024c0600 	subeq	r0, ip, #0, 12
    1e5c:	00000177 	andeq	r0, r0, r7, ror r1
    1e60:	0e731740 	cdpeq	7, 7, cr1, cr3, cr0, {2}
    1e64:	4d060000 	stcmi	0, cr0, [r6, #-0]
    1e68:	00006802 	andeq	r6, r0, r2, lsl #16
    1e6c:	35174400 	ldrcc	r4, [r7, #-1024]	; 0xfffffc00
    1e70:	06000011 			; <UNDEFINED> instruction: 0x06000011
    1e74:	0177024e 	cmneq	r7, lr, asr #4
    1e78:	17480000 	strbne	r0, [r8, -r0]
    1e7c:	00000f67 	andeq	r0, r0, r7, ror #30
    1e80:	4b024f06 	blmi	95aa0 <_stack+0x15aa0>
    1e84:	4c000008 	stcmi	0, cr0, [r0], {8}
    1e88:	000e9117 	andeq	r9, lr, r7, lsl r1
    1e8c:	02520600 	subseq	r0, r2, #0, 12
    1e90:	00000068 	andeq	r0, r0, r8, rrx
    1e94:	0e091750 	mcreq	7, 0, r1, cr9, cr0, {2}
    1e98:	53060000 	movwpl	r0, #24576	; 0x6000
    1e9c:	00056102 	andeq	r6, r5, r2, lsl #2
    1ea0:	83175400 	tsthi	r7, #0, 8
    1ea4:	0600000f 	streq	r0, [r0], -pc
    1ea8:	08080276 	stmdaeq	r8, {r1, r2, r4, r5, r6, r9}
    1eac:	18580000 	ldmdane	r8, {}^	; <UNPREDICTABLE>
    1eb0:	00000f24 	andeq	r0, r0, r4, lsr #30
    1eb4:	94027a06 	strls	r7, [r2], #-2566	; 0xfffff5fa
    1eb8:	48000002 	stmdami	r0, {r1}
    1ebc:	0ea61801 	cdpeq	8, 10, cr1, cr6, cr1, {0}
    1ec0:	7b060000 	blvc	181ec8 <_stack+0x101ec8>
    1ec4:	00025602 	andeq	r5, r2, r2, lsl #12
    1ec8:	18014c00 	stmdane	r1, {sl, fp, lr}
    1ecc:	000010e9 	andeq	r1, r0, r9, ror #1
    1ed0:	5c027f06 	stcpl	15, cr7, [r2], {6}
    1ed4:	dc000008 	stcle	0, cr0, [r0], {8}
    1ed8:	0de21802 	stcleq	8, cr1, [r2, #8]!
    1edc:	84060000 	strhi	r0, [r6], #-0
    1ee0:	00060d02 	andeq	r0, r6, r2, lsl #26
    1ee4:	1802e000 	stmdane	r2, {sp, lr, pc}
    1ee8:	00000dc7 	andeq	r0, r0, r7, asr #27
    1eec:	68028506 	stmdavs	r2, {r1, r2, r8, sl, pc}
    1ef0:	ec000008 	stc	0, cr0, [r0], {8}
    1ef4:	040f0002 	streq	r0, [pc], #-2	; 1efc <_heap_top+0xefc>
    1ef8:	00000567 	andeq	r0, r0, r7, ror #10
    1efc:	e3080102 	movw	r0, #33026	; 0x8102
    1f00:	15000000 	strne	r0, [r0, #-0]
    1f04:	00000567 	andeq	r0, r0, r7, ror #10
    1f08:	0406040f 	streq	r0, [r6], #-1039	; 0xfffffbf1
    1f0c:	68130000 	ldmdavs	r3, {}	; <UNPREDICTABLE>
    1f10:	97000000 	strls	r0, [r0, -r0]
    1f14:	14000005 	strne	r0, [r0], #-5
    1f18:	00000424 	andeq	r0, r0, r4, lsr #8
    1f1c:	00007d14 	andeq	r7, r0, r4, lsl sp
    1f20:	05971400 	ldreq	r1, [r7, #1024]	; 0x400
    1f24:	68140000 	ldmdavs	r4, {}	; <UNPREDICTABLE>
    1f28:	00000000 	andeq	r0, r0, r0
    1f2c:	056e040f 	strbeq	r0, [lr, #-1039]!	; 0xfffffbf1
    1f30:	040f0000 	streq	r0, [pc], #-0	; 1f38 <_heap_top+0xf38>
    1f34:	00000579 	andeq	r0, r0, r9, ror r5
    1f38:	00009513 	andeq	r9, r0, r3, lsl r5
    1f3c:	0005c100 	andeq	ip, r5, r0, lsl #2
    1f40:	04241400 	strteq	r1, [r4], #-1024	; 0xfffffc00
    1f44:	7d140000 	ldcvc	0, cr0, [r4, #-0]
    1f48:	14000000 	strne	r0, [r0], #-0
    1f4c:	00000095 	muleq	r0, r5, r0
    1f50:	00006814 	andeq	r6, r0, r4, lsl r8
    1f54:	040f0000 	streq	r0, [pc], #-0	; 1f5c <_heap_top+0xf5c>
    1f58:	000005a3 	andeq	r0, r0, r3, lsr #11
    1f5c:	00006813 	andeq	r6, r0, r3, lsl r8
    1f60:	0005db00 	andeq	sp, r5, r0, lsl #22
    1f64:	04241400 	strteq	r1, [r4], #-1024	; 0xfffffc00
    1f68:	7d140000 	ldcvc	0, cr0, [r4, #-0]
    1f6c:	00000000 	andeq	r0, r0, r0
    1f70:	05c7040f 	strbeq	r0, [r7, #1039]	; 0x40f
    1f74:	2c090000 	stccs	0, cr0, [r9], {-0}
    1f78:	f1000000 	cps	#0
    1f7c:	0a000005 	beq	1f98 <_heap_top+0xf98>
    1f80:	000000db 	ldrdeq	r0, [r0], -fp
    1f84:	2c090002 	stccs	0, cr0, [r9], {2}
    1f88:	01000000 	mrseq	r0, (UNDEF: 0)
    1f8c:	0a000006 	beq	1fac <_heap_top+0xfac>
    1f90:	000000db 	ldrdeq	r0, [r0], -fp
    1f94:	a8060000 	stmdage	r6, {}	; <UNPREDICTABLE>
    1f98:	0600000f 	streq	r0, [r0], -pc
    1f9c:	02dc011d 	sbcseq	r0, ip, #1073741831	; 0x40000007
    1fa0:	d3190000 	tstle	r9, #0
    1fa4:	0c000010 	stceq	0, cr0, [r0], {16}
    1fa8:	42012106 	andmi	r2, r1, #-2147483647	; 0x80000001
    1fac:	17000006 	strne	r0, [r0, -r6]
    1fb0:	00000fd0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
    1fb4:	42012306 	andmi	r2, r1, #402653184	; 0x18000000
    1fb8:	00000006 	andeq	r0, r0, r6
    1fbc:	000e9f17 	andeq	r9, lr, r7, lsl pc
    1fc0:	01240600 			; <UNDEFINED> instruction: 0x01240600
    1fc4:	00000068 	andeq	r0, r0, r8, rrx
    1fc8:	0fa21704 	svceq	0x00a21704
    1fcc:	25060000 	strcs	r0, [r6, #-0]
    1fd0:	00064801 	andeq	r4, r6, r1, lsl #16
    1fd4:	0f000800 	svceq	0x00000800
    1fd8:	00060d04 	andeq	r0, r6, r4, lsl #26
    1fdc:	01040f00 	tsteq	r4, r0, lsl #30
    1fe0:	19000006 	stmdbne	r0, {r1, r2}
    1fe4:	00000d2a 	andeq	r0, r0, sl, lsr #26
    1fe8:	013d060e 	teqeq	sp, lr, lsl #12
    1fec:	00000683 	andeq	r0, r0, r3, lsl #13
    1ff0:	00101c17 	andseq	r1, r0, r7, lsl ip
    1ff4:	013e0600 	teqeq	lr, r0, lsl #12
    1ff8:	00000683 	andeq	r0, r0, r3, lsl #13
    1ffc:	10491700 	subne	r1, r9, r0, lsl #14
    2000:	3f060000 	svccc	0x00060000
    2004:	00068301 	andeq	r8, r6, r1, lsl #6
    2008:	78170600 	ldmdavc	r7, {r9, sl}
    200c:	06000010 			; <UNDEFINED> instruction: 0x06000010
    2010:	003a0140 	eorseq	r0, sl, r0, asr #2
    2014:	000c0000 	andeq	r0, ip, r0
    2018:	00003a09 	andeq	r3, r0, r9, lsl #20
    201c:	00069300 	andeq	r9, r6, r0, lsl #6
    2020:	00db0a00 	sbcseq	r0, fp, r0, lsl #20
    2024:	00020000 	andeq	r0, r2, r0
    2028:	5706d01a 	smladpl	r6, sl, r0, sp
    202c:	00079402 	andeq	r9, r7, r2, lsl #8
    2030:	10b71700 	adcsne	r1, r7, r0, lsl #14
    2034:	59060000 	stmdbpl	r6, {}	; <UNPREDICTABLE>
    2038:	00006f02 	andeq	r6, r0, r2, lsl #30
    203c:	62170000 	andsvs	r0, r7, #0
    2040:	06000010 			; <UNDEFINED> instruction: 0x06000010
    2044:	0561025a 	strbeq	r0, [r1, #-602]!	; 0xfffffda6
    2048:	17040000 	strne	r0, [r4, -r0]
    204c:	00000ebb 			; <UNDEFINED> instruction: 0x00000ebb
    2050:	94025b06 	strls	r5, [r2], #-2822	; 0xfffff4fa
    2054:	08000007 	stmdaeq	r0, {r0, r1, r2}
    2058:	00110c17 	andseq	r0, r1, r7, lsl ip
    205c:	025c0600 	subseq	r0, ip, #0, 12
    2060:	0000018d 	andeq	r0, r0, sp, lsl #3
    2064:	0e641724 	cdpeq	7, 6, cr1, cr4, cr4, {1}
    2068:	5d060000 	stcpl	0, cr0, [r6, #-0]
    206c:	00006802 	andeq	r6, r0, r2, lsl #16
    2070:	cb174800 	blgt	5d4078 <_stack+0x554078>
    2074:	0600000f 	streq	r0, [r0], -pc
    2078:	0061025e 	rsbeq	r0, r1, lr, asr r2
    207c:	17500000 	ldrbne	r0, [r0, -r0]
    2080:	00001122 	andeq	r1, r0, r2, lsr #2
    2084:	4e025f06 	cdpmi	15, 0, cr5, cr2, cr6, {0}
    2088:	58000006 	stmdapl	r0, {r1, r2}
    208c:	000fd617 	andeq	sp, pc, r7, lsl r6	; <UNPREDICTABLE>
    2090:	02600600 	rsbeq	r0, r0, #0, 12
    2094:	00000103 	andeq	r0, r0, r3, lsl #2
    2098:	11271768 			; <UNDEFINED> instruction: 0x11271768
    209c:	61060000 	mrsvs	r0, (UNDEF: 6)
    20a0:	00010302 	andeq	r0, r1, r2, lsl #6
    20a4:	a0177000 	andsge	r7, r7, r0
    20a8:	0600000d 	streq	r0, [r0], -sp
    20ac:	01030262 	tsteq	r3, r2, ror #4
    20b0:	17780000 	ldrbne	r0, [r8, -r0]!
    20b4:	000010df 	ldrdeq	r1, [r0], -pc	; <UNPREDICTABLE>
    20b8:	a4026306 	strge	r6, [r2], #-774	; 0xfffffcfa
    20bc:	80000007 	andhi	r0, r0, r7
    20c0:	000eaf17 	andeq	sl, lr, r7, lsl pc
    20c4:	02640600 	rsbeq	r0, r4, #0, 12
    20c8:	000007b4 			; <UNDEFINED> instruction: 0x000007b4
    20cc:	10851788 	addne	r1, r5, r8, lsl #15
    20d0:	65060000 	strvs	r0, [r6, #-0]
    20d4:	00006802 	andeq	r6, r0, r2, lsl #16
    20d8:	2a17a000 	bcs	5ea0e0 <_stack+0x56a0e0>
    20dc:	0600000e 	streq	r0, [r0], -lr
    20e0:	01030266 	tsteq	r3, r6, ror #4
    20e4:	17a40000 	strne	r0, [r4, r0]!
    20e8:	00000d91 	muleq	r0, r1, sp
    20ec:	03026706 	movweq	r6, #9990	; 0x2706
    20f0:	ac000001 	stcge	0, cr0, [r0], {1}
    20f4:	000e1917 	andeq	r1, lr, r7, lsl r9
    20f8:	02680600 	rsbeq	r0, r8, #0, 12
    20fc:	00000103 	andeq	r0, r0, r3, lsl #2
    2100:	0d3d17b4 	ldceq	7, cr1, [sp, #-720]!	; 0xfffffd30
    2104:	69060000 	stmdbvs	r6, {}	; <UNPREDICTABLE>
    2108:	00010302 	andeq	r0, r1, r2, lsl #6
    210c:	4c17bc00 	ldcmi	12, cr11, [r7], {-0}
    2110:	0600000d 	streq	r0, [r0], -sp
    2114:	0103026a 	tsteq	r3, sl, ror #4
    2118:	17c40000 	strbne	r0, [r4, r0]
    211c:	00000f88 	andeq	r0, r0, r8, lsl #31
    2120:	68026b06 	stmdavs	r2, {r1, r2, r8, r9, fp, sp, lr}
    2124:	cc000000 	stcgt	0, cr0, [r0], {-0}
    2128:	05670900 	strbeq	r0, [r7, #-2304]!	; 0xfffff700
    212c:	07a40000 	streq	r0, [r4, r0]!
    2130:	db0a0000 	blle	282138 <_stack+0x202138>
    2134:	19000000 	stmdbne	r0, {}	; <UNPREDICTABLE>
    2138:	05670900 	strbeq	r0, [r7, #-2304]!	; 0xfffff700
    213c:	07b40000 	ldreq	r0, [r4, r0]!
    2140:	db0a0000 	blle	282148 <_stack+0x202148>
    2144:	07000000 	streq	r0, [r0, -r0]
    2148:	05670900 	strbeq	r0, [r7, #-2304]!	; 0xfffff700
    214c:	07c40000 	strbeq	r0, [r4, r0]
    2150:	db0a0000 	blle	282158 <_stack+0x202158>
    2154:	17000000 	strne	r0, [r0, -r0]
    2158:	06f01a00 	ldrbteq	r1, [r0], r0, lsl #20
    215c:	07e80270 			; <UNDEFINED> instruction: 0x07e80270
    2160:	14170000 	ldrne	r0, [r7], #-0
    2164:	0600000f 	streq	r0, [r0], -pc
    2168:	07e80273 			; <UNDEFINED> instruction: 0x07e80273
    216c:	17000000 	strne	r0, [r0, -r0]
    2170:	00000ef5 	strdeq	r0, [r0], -r5
    2174:	f8027406 			; <UNDEFINED> instruction: 0xf8027406
    2178:	78000007 	stmdavc	r0, {r0, r1, r2}
    217c:	02d60900 	sbcseq	r0, r6, #0, 18
    2180:	07f80000 	ldrbeq	r0, [r8, r0]!
    2184:	db0a0000 	blle	28218c <_stack+0x20218c>
    2188:	1d000000 	stcne	0, cr0, [r0, #-0]
    218c:	006f0900 	rsbeq	r0, pc, r0, lsl #18
    2190:	08080000 	stmdaeq	r8, {}	; <UNPREDICTABLE>
    2194:	db0a0000 	blle	28219c <_stack+0x20219c>
    2198:	1d000000 	stcne	0, cr0, [r0, #-0]
    219c:	06f01b00 	ldrbteq	r1, [r0], r0, lsl #22
    21a0:	082a0255 	stmdaeq	sl!, {r0, r2, r4, r6, r9}
    21a4:	151c0000 	ldrne	r0, [ip, #-0]
    21a8:	06000010 			; <UNDEFINED> instruction: 0x06000010
    21ac:	0693026c 	ldreq	r0, [r3], ip, ror #4
    21b0:	f91c0000 			; <UNDEFINED> instruction: 0xf91c0000
    21b4:	06000010 			; <UNDEFINED> instruction: 0x06000010
    21b8:	07c40275 			; <UNDEFINED> instruction: 0x07c40275
    21bc:	09000000 	stmdbeq	r0, {}	; <UNPREDICTABLE>
    21c0:	00000567 	andeq	r0, r0, r7, ror #10
    21c4:	0000083a 	andeq	r0, r0, sl, lsr r8
    21c8:	0000db0a 	andeq	sp, r0, sl, lsl #22
    21cc:	1d001800 	stcne	8, cr1, [r0, #-0]
    21d0:	00000845 	andeq	r0, r0, r5, asr #16
    21d4:	00042414 	andeq	r2, r4, r4, lsl r4
    21d8:	040f0000 	streq	r0, [pc], #-0	; 21e0 <_heap_top+0x11e0>
    21dc:	0000083a 	andeq	r0, r0, sl, lsr r8
    21e0:	0177040f 	cmneq	r7, pc, lsl #8
    21e4:	5c1d0000 	ldcpl	0, cr0, [sp], {-0}
    21e8:	14000008 	strne	r0, [r0], #-8
    21ec:	00000068 	andeq	r0, r0, r8, rrx
    21f0:	62040f00 	andvs	r0, r4, #0, 30
    21f4:	0f000008 	svceq	0x00000008
    21f8:	00085104 	andeq	r5, r8, r4, lsl #2
    21fc:	06010900 	streq	r0, [r1], -r0, lsl #18
    2200:	08780000 	ldmdaeq	r8!, {}^	; <UNPREDICTABLE>
    2204:	db0a0000 	blle	28220c <_stack+0x20220c>
    2208:	02000000 	andeq	r0, r0, #0
    220c:	10991e00 	addsne	r1, r9, r0, lsl #28
    2210:	fd060000 	stc2	0, cr0, [r6, #-0]
    2214:	00042402 	andeq	r2, r4, r2, lsl #8
    2218:	10921e00 	addsne	r1, r2, r0, lsl #28
    221c:	fe060000 	cdp2	0, 0, cr0, cr6, cr0, {0}
    2220:	00042a02 	andeq	r2, r4, r2, lsl #20
    2224:	01b20300 			; <UNDEFINED> instruction: 0x01b20300
    2228:	30070000 	andcc	r0, r7, r0
    222c:	00000048 	andeq	r0, r0, r8, asr #32
    2230:	0008901f 	andeq	r9, r8, pc, lsl r0
    2234:	089b1500 	ldmeq	fp, {r8, sl, ip}
    2238:	2c200000 	stccs	0, cr0, [r0], #-0
    223c:	0800000f 	stmdaeq	r0, {r0, r1, r2, r3}
    2240:	0005615f 	andeq	r6, r5, pc, asr r1
    2244:	05670900 	strbeq	r0, [r7, #-2304]!	; 0xfffff700
    2248:	08c00000 	stmiaeq	r0, {}^	; <UNPREDICTABLE>
    224c:	db0a0000 	blle	282254 <_stack+0x202254>
    2250:	09000000 	stmdbeq	r0, {}	; <UNPREDICTABLE>
    2254:	01820300 	orreq	r0, r2, r0, lsl #6
    2258:	12090000 	andne	r0, r9, #0
    225c:	0000089b 	muleq	r0, fp, r8
    2260:	0006a103 	andeq	sl, r6, r3, lsl #2
    2264:	a0130900 	andsge	r0, r3, r0, lsl #18
    2268:	0b000008 	bleq	2290 <_heap_top+0x1290>
    226c:	63390a2c 	teqvs	r9, #44, 20	; 0x2c000
    2270:	0c000009 	stceq	0, cr0, [r0], {9}
    2274:	00000ba4 	andeq	r0, r0, r4, lsr #23
    2278:	08c03a0a 	stmiaeq	r0, {r1, r3, r9, fp, ip, sp}^
    227c:	0c000000 	stceq	0, cr0, [r0], {-0}
    2280:	00000c10 	andeq	r0, r0, r0, lsl ip
    2284:	08c03b0a 	stmiaeq	r0, {r1, r3, r8, r9, fp, ip, sp}^
    2288:	0c040000 	stceq	0, cr0, [r4], {-0}
    228c:	00000c2b 	andeq	r0, r0, fp, lsr #24
    2290:	08c03c0a 	stmiaeq	r0, {r1, r3, sl, fp, ip, sp}^
    2294:	0c080000 	stceq	0, cr0, [r8], {-0}
    2298:	00000cae 	andeq	r0, r0, lr, lsr #25
    229c:	08c03d0a 	stmiaeq	r0, {r1, r3, r8, sl, fp, ip, sp}^
    22a0:	0c0c0000 	stceq	0, cr0, [ip], {-0}
    22a4:	00000b95 	muleq	r0, r5, fp
    22a8:	08c03e0a 	stmiaeq	r0, {r1, r3, r9, sl, fp, ip, sp}^
    22ac:	0c100000 	ldceq	0, cr0, [r0], {-0}
    22b0:	00000b55 	andeq	r0, r0, r5, asr fp
    22b4:	08cb3f0a 	stmiaeq	fp, {r1, r3, r8, r9, sl, fp, ip, sp}^
    22b8:	0c140000 	ldceq	0, cr0, [r4], {-0}
    22bc:	00000bfc 	strdeq	r0, [r0], -ip
    22c0:	08cb400a 	stmiaeq	fp, {r1, r3, lr}^
    22c4:	0c180000 	ldceq	0, cr0, [r8], {-0}
    22c8:	00000b23 	andeq	r0, r0, r3, lsr #22
    22cc:	08c0410a 	stmiaeq	r0, {r1, r3, r8, lr}^
    22d0:	0c1c0000 	ldceq	0, cr0, [ip], {-0}
    22d4:	00000ce7 	andeq	r0, r0, r7, ror #25
    22d8:	08c0420a 	stmiaeq	r0, {r1, r3, r9, lr}^
    22dc:	0c200000 	stceq	0, cr0, [r0], #-0
    22e0:	00000c99 	muleq	r0, r9, ip
    22e4:	08cb430a 	stmiaeq	fp, {r1, r3, r8, r9, lr}^
    22e8:	0c240000 	stceq	0, cr0, [r4], #-0
    22ec:	00000bec 	andeq	r0, r0, ip, ror #23
    22f0:	08c0440a 	stmiaeq	r0, {r1, r3, sl, lr}^
    22f4:	00280000 	eoreq	r0, r8, r0
    22f8:	000b3203 	andeq	r3, fp, r3, lsl #4
    22fc:	d6450a00 	strble	r0, [r5], -r0, lsl #20
    2300:	21000008 	tstcs	r0, r8
    2304:	00001144 	andeq	r1, r0, r4, asr #2
    2308:	00680901 	rsbeq	r0, r8, r1, lsl #18
    230c:	8ed00000 	cdphi	0, 13, cr0, cr0, cr0, {0}
    2310:	00a80000 	adceq	r0, r8, r0
    2314:	9c010000 	stcls	0, cr0, [r1], {-0}
    2318:	000009e0 	andeq	r0, r0, r0, ror #19
    231c:	000d1322 	andeq	r1, sp, r2, lsr #6
    2320:	940b0100 	strls	r0, [fp], #-256	; 0xffffff00
    2324:	05000007 	streq	r0, [r0, #-7]
    2328:	00947803 	addseq	r7, r4, r3, lsl #16
    232c:	104f2200 	subne	r2, pc, r0, lsl #4
    2330:	0c010000 	stceq	0, cr0, [r1], {-0}
    2334:	000009e0 	andeq	r0, r0, r0, ror #19
    2338:	94540305 	ldrbls	r0, [r4], #-773	; 0xfffffcfb
    233c:	69230000 	stmdbvs	r3!, {}	; <UNPREDICTABLE>
    2340:	680e0100 	stmdavs	lr, {r8}
    2344:	02000000 	andeq	r0, r0, #0
    2348:	1f227491 	svcne	0x00227491
    234c:	0100000c 	tsteq	r0, ip
    2350:	0009f00f 	andeq	pc, r9, pc
    2354:	6c910200 	lfmvs	f0, 4, [r1], {0}
    2358:	000ffd22 	andeq	pc, pc, r2, lsr #26
    235c:	b0110100 	andslt	r0, r1, r0, lsl #2
    2360:	02000008 	andeq	r0, r0, #8
    2364:	fe226091 	mcr2	0, 1, r6, cr2, cr1, {4}
    2368:	0100000e 	tsteq	r0, lr
    236c:	00056112 	andeq	r6, r5, r2, lsl r1
    2370:	70910200 	addsvc	r0, r1, r0, lsl #4
    2374:	05670900 	strbeq	r0, [r7, #-2304]!	; 0xfffff700
    2378:	09f00000 	ldmibeq	r0!, {}^	; <UNPREDICTABLE>
    237c:	db0a0000 	blle	282384 <_stack+0x202384>
    2380:	20000000 	andcs	r0, r0, r0
    2384:	63040f00 	movwvs	r0, #20224	; 0x4f00
    2388:	00000009 	andeq	r0, r0, r9
    238c:	000002e8 	andeq	r0, r0, r8, ror #5
    2390:	0a180004 	beq	6023a8 <_stack+0x5823a8>
    2394:	01040000 	mrseq	r0, (UNDEF: 4)
    2398:	00000044 	andeq	r0, r0, r4, asr #32
    239c:	0011770c 	andseq	r7, r1, ip, lsl #14
    23a0:	008f7800 	addeq	r7, pc, r0, lsl #16
    23a4:	0000cc00 	andeq	ip, r0, r0, lsl #24
    23a8:	000c1200 	andeq	r1, ip, r0, lsl #4
    23ac:	06010200 	streq	r0, [r1], -r0, lsl #4
    23b0:	000000dc 	ldrdeq	r0, [r0], -ip
    23b4:	da080102 	ble	2027c4 <_stack+0x1827c4>
    23b8:	02000000 	andeq	r0, r0, #0
    23bc:	013b0502 	teqeq	fp, r2, lsl #10
    23c0:	02020000 	andeq	r0, r2, #0
    23c4:	0000e807 	andeq	lr, r0, r7, lsl #16
    23c8:	05040200 	streq	r0, [r4, #-512]	; 0xfffffe00
    23cc:	00000132 	andeq	r0, r0, r2, lsr r1
    23d0:	0001b003 	andeq	fp, r1, r3
    23d4:	4f410200 	svcmi	0x00410200
    23d8:	02000000 	andeq	r0, r0, #0
    23dc:	01120704 	tsteq	r2, r4, lsl #14
    23e0:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
    23e4:	00012d05 	andeq	r2, r1, r5, lsl #26
    23e8:	07080200 	streq	r0, [r8, -r0, lsl #4]
    23ec:	0000010d 	andeq	r0, r0, sp, lsl #2
    23f0:	69050404 	stmdbvs	r5, {r2, sl}
    23f4:	0200746e 	andeq	r7, r0, #1845493760	; 0x6e000000
    23f8:	01170704 	tsteq	r7, r4, lsl #14
    23fc:	b2030000 	andlt	r0, r3, #0
    2400:	03000001 	movweq	r0, #1
    2404:	00004430 	andeq	r4, r0, r0, lsr r4
    2408:	00720500 	rsbseq	r0, r2, r0, lsl #10
    240c:	7d060000 	stcvc	0, cr0, [r6, #-0]
    2410:	03000000 	movweq	r0, #0
    2414:	00000182 	andeq	r0, r0, r2, lsl #3
    2418:	007d1204 	rsbseq	r1, sp, r4, lsl #4
    241c:	a1030000 	mrsge	r0, (UNDEF: 3)
    2420:	04000006 	streq	r0, [r0], #-6
    2424:	00008213 	andeq	r8, r0, r3, lsl r2
    2428:	052c0700 	streq	r0, [ip, #-1792]!	; 0xfffff900
    242c:	00012a39 	andeq	r2, r1, r9, lsr sl
    2430:	0ba40800 	bleq	fe904438 <CPSR_UNAFFECTED_BITS+0xfe904538>
    2434:	3a050000 	bcc	14243c <_stack+0xc243c>
    2438:	00000087 	andeq	r0, r0, r7, lsl #1
    243c:	0c100800 	ldceq	8, cr0, [r0], {-0}
    2440:	3b050000 	blcc	142448 <_stack+0xc2448>
    2444:	00000087 	andeq	r0, r0, r7, lsl #1
    2448:	0c2b0804 	stceq	8, cr0, [fp], #-16
    244c:	3c050000 	stccc	0, cr0, [r5], {-0}
    2450:	00000087 	andeq	r0, r0, r7, lsl #1
    2454:	0cae0808 	stceq	8, cr0, [lr], #32
    2458:	3d050000 	stccc	0, cr0, [r5, #-0]
    245c:	00000087 	andeq	r0, r0, r7, lsl #1
    2460:	0b95080c 	bleq	fe544498 <CPSR_UNAFFECTED_BITS+0xfe544598>
    2464:	3e050000 	cdpcc	0, 0, cr0, cr5, cr0, {0}
    2468:	00000087 	andeq	r0, r0, r7, lsl #1
    246c:	0b550810 	bleq	15444b4 <_stack+0x14c44b4>
    2470:	3f050000 	svccc	0x00050000
    2474:	00000092 	muleq	r0, r2, r0
    2478:	0bfc0814 	bleq	fff044d0 <CPSR_UNAFFECTED_BITS+0xfff045d0>
    247c:	40050000 	andmi	r0, r5, r0
    2480:	00000092 	muleq	r0, r2, r0
    2484:	0b230818 	bleq	8c44ec <_stack+0x8444ec>
    2488:	41050000 	mrsmi	r0, (UNDEF: 5)
    248c:	00000087 	andeq	r0, r0, r7, lsl #1
    2490:	0ce7081c 	stcleq	8, cr0, [r7], #112	; 0x70
    2494:	42050000 	andmi	r0, r5, #0
    2498:	00000087 	andeq	r0, r0, r7, lsl #1
    249c:	0c990820 	ldceq	8, cr0, [r9], {32}
    24a0:	43050000 	movwmi	r0, #20480	; 0x5000
    24a4:	00000092 	muleq	r0, r2, r0
    24a8:	0bec0824 	bleq	ffb04540 <CPSR_UNAFFECTED_BITS+0xffb04640>
    24ac:	44050000 	strmi	r0, [r5], #-0
    24b0:	00000087 	andeq	r0, r0, r7, lsl #1
    24b4:	32030028 	andcc	r0, r3, #40	; 0x28
    24b8:	0500000b 	streq	r0, [r0, #-11]
    24bc:	00009d45 	andeq	r9, r0, r5, asr #26
    24c0:	06340700 	ldrteq	r0, [r4], -r0, lsl #14
    24c4:	0001d00c 	andeq	sp, r1, ip
    24c8:	30720900 	rsbscc	r0, r2, r0, lsl #18
    24cc:	870d0600 	strhi	r0, [sp, -r0, lsl #12]
    24d0:	00000000 	andeq	r0, r0, r0
    24d4:	00317209 	eorseq	r7, r1, r9, lsl #4
    24d8:	00870e06 	addeq	r0, r7, r6, lsl #28
    24dc:	09040000 	stmdbeq	r4, {}	; <UNPREDICTABLE>
    24e0:	06003272 			; <UNDEFINED> instruction: 0x06003272
    24e4:	0000870f 	andeq	r8, r0, pc, lsl #14
    24e8:	72090800 	andvc	r0, r9, #0, 16
    24ec:	10060033 	andne	r0, r6, r3, lsr r0
    24f0:	00000087 	andeq	r0, r0, r7, lsl #1
    24f4:	3472090c 	ldrbtcc	r0, [r2], #-2316	; 0xfffff6f4
    24f8:	87110600 	ldrhi	r0, [r1, -r0, lsl #12]
    24fc:	10000000 	andne	r0, r0, r0
    2500:	00357209 	eorseq	r7, r5, r9, lsl #4
    2504:	00871206 	addeq	r1, r7, r6, lsl #4
    2508:	09140000 	ldmdbeq	r4, {}	; <UNPREDICTABLE>
    250c:	06003672 			; <UNDEFINED> instruction: 0x06003672
    2510:	00008713 	andeq	r8, r0, r3, lsl r7
    2514:	72091800 	andvc	r1, r9, #0, 16
    2518:	14060037 	strne	r0, [r6], #-55	; 0xffffffc9
    251c:	00000087 	andeq	r0, r0, r7, lsl #1
    2520:	3872091c 	ldmdacc	r2!, {r2, r3, r4, r8, fp}^
    2524:	87150600 	ldrhi	r0, [r5, -r0, lsl #12]
    2528:	20000000 	andcs	r0, r0, r0
    252c:	00397209 	eorseq	r7, r9, r9, lsl #4
    2530:	00871606 	addeq	r1, r7, r6, lsl #12
    2534:	09240000 	stmdbeq	r4!, {}	; <UNPREDICTABLE>
    2538:	00303172 	eorseq	r3, r0, r2, ror r1
    253c:	00871706 	addeq	r1, r7, r6, lsl #14
    2540:	09280000 	stmdbeq	r8!, {}	; <UNPREDICTABLE>
    2544:	00313172 	eorseq	r3, r1, r2, ror r1
    2548:	00871806 	addeq	r1, r7, r6, lsl #16
    254c:	092c0000 	stmdbeq	ip!, {}	; <UNPREDICTABLE>
    2550:	00323172 	eorseq	r3, r2, r2, ror r1
    2554:	00871906 	addeq	r1, r7, r6, lsl #18
    2558:	00300000 	eorseq	r0, r0, r0
    255c:	0001fe03 	andeq	pc, r1, r3, lsl #28
    2560:	351a0600 	ldrcc	r0, [sl, #-1536]	; 0xfffffa00
    2564:	07000001 	streq	r0, [r0, -r1]
    2568:	291c0648 	ldmdbcs	ip, {r3, r6, r9, sl}
    256c:	08000002 	stmdaeq	r0, {r1}
    2570:	00000deb 	andeq	r0, r0, fp, ror #27
    2574:	00871d06 	addeq	r1, r7, r6, lsl #26
    2578:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
    257c:	000001f9 	strdeq	r0, [r0], -r9
    2580:	01d01e06 	bicseq	r1, r0, r6, lsl #28
    2584:	09040000 	stmdbeq	r4, {}	; <UNPREDICTABLE>
    2588:	06007073 			; <UNDEFINED> instruction: 0x06007073
    258c:	0000871f 	andeq	r8, r0, pc, lsl r7
    2590:	6c093800 	stcvs	8, cr3, [r9], {-0}
    2594:	20060072 	andcs	r0, r6, r2, ror r0
    2598:	00000087 	andeq	r0, r0, r7, lsl #1
    259c:	6370093c 	cmnvs	r0, #60, 18	; 0xf0000
    25a0:	87210600 	strhi	r0, [r1, -r0, lsl #12]!
    25a4:	40000000 	andmi	r0, r0, r0
    25a8:	000da808 	andeq	sl, sp, r8, lsl #16
    25ac:	7d220600 	stcvc	6, cr0, [r2, #-0]
    25b0:	44000000 	strmi	r0, [r0], #-0
    25b4:	01f10300 	mvnseq	r0, r0, lsl #6
    25b8:	23060000 	movwcs	r0, #24576	; 0x6000
    25bc:	000001db 	ldrdeq	r0, [r0], -fp
    25c0:	00114f0a 	andseq	r4, r1, sl, lsl #30
    25c4:	78080100 	stmdavc	r8, {r8}
    25c8:	cc00008f 	stcgt	0, cr0, [r0], {143}	; 0x8f
    25cc:	01000000 	mrseq	r0, (UNDEF: 0)
    25d0:	0002d29c 	muleq	r2, ip, r2
    25d4:	11a90b00 			; <UNDEFINED> instruction: 0x11a90b00
    25d8:	08010000 	stmdaeq	r1, {}	; <UNPREDICTABLE>
    25dc:	0000006b 	andeq	r0, r0, fp, rrx
    25e0:	0b5c9102 	bleq	17269f0 <_stack+0x16a69f0>
    25e4:	000011a0 	andeq	r1, r0, r0, lsr #3
    25e8:	02d20801 	sbcseq	r0, r2, #65536	; 0x10000
    25ec:	91020000 	mrsls	r0, (UNDEF: 2)
    25f0:	8f980c58 	svchi	0x00980c58
    25f4:	00380000 	eorseq	r0, r8, r0
    25f8:	028f0000 	addeq	r0, pc, #0
    25fc:	b00d0000 	andlt	r0, sp, r0
    2600:	01000011 	tsteq	r0, r1, lsl r0
    2604:	00006b0c 	andeq	r6, r0, ip, lsl #22
    2608:	74910200 	ldrvc	r0, [r1], #512	; 0x200
    260c:	000c1f0d 	andeq	r1, ip, sp, lsl #30
    2610:	d80d0100 	stmdale	sp, {r8}
    2614:	02000002 	andeq	r0, r0, #2
    2618:	0c007091 	stceq	0, cr7, [r0], {145}	; 0x91
    261c:	00008fe0 	andeq	r8, r0, r0, ror #31
    2620:	00000040 	andeq	r0, r0, r0, asr #32
    2624:	000002b9 			; <UNDEFINED> instruction: 0x000002b9
    2628:	00116a0d 	andseq	r6, r1, sp, lsl #20
    262c:	de180100 	muflee	f0, f0, f0
    2630:	02000002 	andeq	r0, r0, #2
    2634:	600d6c91 	mulvs	sp, r1, ip
    2638:	01000011 	tsteq	r0, r1, lsl r0
    263c:	0002de19 	andeq	sp, r2, r9, lsl lr
    2640:	68910200 	ldmvs	r1, {r9}
    2644:	90240e00 	eorls	r0, r4, r0, lsl #28
    2648:	00180000 	andseq	r0, r8, r0
    264c:	480d0000 	stmdami	sp, {}	; <UNPREDICTABLE>
    2650:	01000009 	tsteq	r0, r9
    2654:	0002e424 	andeq	lr, r2, r4, lsr #8
    2658:	67910200 	ldrvs	r0, [r1, r0, lsl #4]
    265c:	040f0000 	streq	r0, [pc], #-0	; 2664 <_heap_top+0x1664>
    2660:	0000006b 	andeq	r0, r0, fp, rrx
    2664:	012a040f 			; <UNDEFINED> instruction: 0x012a040f
    2668:	040f0000 	streq	r0, [pc], #-0	; 2670 <_heap_top+0x1670>
    266c:	00000229 	andeq	r0, r0, r9, lsr #4
    2670:	e3080102 	movw	r0, #33026	; 0x8102
    2674:	00000000 	andeq	r0, r0, r0
    2678:	000001bc 			; <UNDEFINED> instruction: 0x000001bc
    267c:	0adb0004 	beq	ff6c2694 <CPSR_UNAFFECTED_BITS+0xff6c2794>
    2680:	01040000 	mrseq	r0, (UNDEF: 4)
    2684:	00000044 	andeq	r0, r0, r4, asr #32
    2688:	0011bf0c 	andseq	fp, r1, ip, lsl #30
    268c:	00904400 	addseq	r4, r0, r0, lsl #8
    2690:	00022c00 	andeq	r2, r2, r0, lsl #24
    2694:	000d3600 	andeq	r3, sp, r0, lsl #12
    2698:	06010200 	streq	r0, [r1], -r0, lsl #4
    269c:	000000dc 	ldrdeq	r0, [r0], -ip
    26a0:	da080102 	ble	202ab0 <_stack+0x182ab0>
    26a4:	02000000 	andeq	r0, r0, #0
    26a8:	013b0502 	teqeq	fp, r2, lsl #10
    26ac:	02020000 	andeq	r0, r2, #0
    26b0:	0000e807 	andeq	lr, r0, r7, lsl #16
    26b4:	05040200 	streq	r0, [r4, #-512]	; 0xfffffe00
    26b8:	00000132 	andeq	r0, r0, r2, lsr r1
    26bc:	12070402 	andne	r0, r7, #33554432	; 0x2000000
    26c0:	02000001 	andeq	r0, r0, #1
    26c4:	012d0508 			; <UNDEFINED> instruction: 0x012d0508
    26c8:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
    26cc:	00010d07 	andeq	r0, r1, r7, lsl #26
    26d0:	05040300 	streq	r0, [r4, #-768]	; 0xfffffd00
    26d4:	00746e69 	rsbseq	r6, r4, r9, ror #28
    26d8:	17070402 	strne	r0, [r7, -r2, lsl #8]
    26dc:	04000001 	streq	r0, [r0], #-1
    26e0:	a0020218 	andge	r0, r2, r8, lsl r2
    26e4:	05000000 	streq	r0, [r0, #-0]
    26e8:	00000bb7 			; <UNDEFINED> instruction: 0x00000bb7
    26ec:	00a00402 	adceq	r0, r0, r2, lsl #8
    26f0:	05000000 	streq	r0, [r0, #-0]
    26f4:	00000ca9 	andeq	r0, r0, r9, lsr #25
    26f8:	00590502 	subseq	r0, r9, r2, lsl #10
    26fc:	050c0000 	streq	r0, [ip, #-0]
    2700:	00000c0b 	andeq	r0, r0, fp, lsl #24
    2704:	00590602 	subseq	r0, r9, r2, lsl #12
    2708:	05100000 	ldreq	r0, [r0, #-0]
    270c:	00000233 	andeq	r0, r0, r3, lsr r2
    2710:	00590702 	subseq	r0, r9, r2, lsl #14
    2714:	00140000 	andseq	r0, r4, r0
    2718:	0000b706 	andeq	fp, r0, r6, lsl #14
    271c:	0000b000 	andeq	fp, r0, r0
    2720:	00b00700 	adcseq	r0, r0, r0, lsl #14
    2724:	00090000 	andeq	r0, r9, r0
    2728:	24070402 	strcs	r0, [r7], #-1026	; 0xfffffbfe
    272c:	02000001 	andeq	r0, r0, #1
    2730:	00e30801 	rsceq	r0, r3, r1, lsl #16
    2734:	b7080000 	strlt	r0, [r8, -r0]
    2738:	09000000 	stmdbeq	r0, {}	; <UNPREDICTABLE>
    273c:	00000c5f 	andeq	r0, r0, pc, asr ip
    2740:	00670802 	rsbeq	r0, r7, r2, lsl #16
    2744:	e90a0000 	stmdb	sl, {}	; <UNPREDICTABLE>
    2748:	01000011 	tsteq	r0, r1, lsl r0
    274c:	0000592f 	andeq	r5, r0, pc, lsr #18
    2750:	00916c00 	addseq	r6, r1, r0, lsl #24
    2754:	00010400 	andeq	r0, r1, r0, lsl #8
    2758:	2a9c0100 	bcs	fe702b60 <CPSR_UNAFFECTED_BITS+0xfe702c60>
    275c:	0b000001 	bleq	2768 <_heap_top+0x1768>
    2760:	2f010066 	svccs	0x00010066
    2764:	0000012a 	andeq	r0, r0, sl, lsr #2
    2768:	0c6c9102 	stfeqp	f1, [ip], #-8
    276c:	00000c52 	andeq	r0, r0, r2, asr ip
    2770:	01302f01 	teqeq	r0, r1, lsl #30
    2774:	91020000 	mrsls	r0, (UNDEF: 2)
    2778:	0b4e0c68 	bleq	1385920 <_stack+0x1305920>
    277c:	2f010000 	svccs	0x00010000
    2780:	00000059 	andeq	r0, r0, r9, asr r0
    2784:	0d649102 	stfeqp	f1, [r4, #-8]!
    2788:	31010069 	tstcc	r1, r9, rrx
    278c:	00000059 	andeq	r0, r0, r9, asr r0
    2790:	0d749102 	ldfeqp	f1, [r4, #-8]!
    2794:	00727470 	rsbseq	r7, r2, r0, ror r4
    2798:	01373201 	teqeq	r7, r1, lsl #4
    279c:	91020000 	mrsls	r0, (UNDEF: 2)
    27a0:	040e0070 	streq	r0, [lr], #-112	; 0xffffff90
    27a4:	000000c3 	andeq	r0, r0, r3, asr #1
    27a8:	0136040e 	teqeq	r6, lr, lsl #8
    27ac:	0e0f0000 	cdpeq	0, 0, cr0, cr15, cr0, {0}
    27b0:	0000be04 	andeq	fp, r0, r4, lsl #28
    27b4:	11fe0a00 	mvnsne	r0, r0, lsl #20
    27b8:	13010000 	movwne	r0, #4096	; 0x1000
    27bc:	00000059 	andeq	r0, r0, r9, asr r0
    27c0:	00009088 	andeq	r9, r0, r8, lsl #1
    27c4:	000000e4 	andeq	r0, r0, r4, ror #1
    27c8:	01999c01 	orrseq	r9, r9, r1, lsl #24
    27cc:	660b0000 	strvs	r0, [fp], -r0
    27d0:	2a130100 	bcs	4c2bd8 <_stack+0x442bd8>
    27d4:	02000001 	andeq	r0, r0, #1
    27d8:	080c6c91 	stmdaeq	ip, {r0, r4, r7, sl, fp, sp, lr}
    27dc:	01000012 	tsteq	r0, r2, lsl r0
    27e0:	00019913 	andeq	r9, r1, r3, lsl r9
    27e4:	68910200 	ldmvs	r1, {r9}
    27e8:	000b4e0c 	andeq	r4, fp, ip, lsl #28
    27ec:	59130100 	ldmdbpl	r3, {r8}
    27f0:	02000000 	andeq	r0, r0, #0
    27f4:	690d6491 	stmdbvs	sp, {r0, r4, r7, sl, sp, lr}
    27f8:	59150100 	ldmdbpl	r5, {r8}
    27fc:	02000000 	andeq	r0, r0, #0
    2800:	700d7491 	mulvc	sp, r1, r4
    2804:	01007274 	tsteq	r0, r4, ror r2
    2808:	00019b16 	andeq	r9, r1, r6, lsl fp
    280c:	70910200 	addsvc	r0, r1, r0, lsl #4
    2810:	0e041000 	cdpeq	0, 0, cr1, cr4, cr0, {0}
    2814:	0000b704 	andeq	fp, r0, r4, lsl #14
    2818:	11f41100 	mvnsne	r1, r0, lsl #2
    281c:	0a010000 	beq	42824 <__bss_end__+0x392dc>
    2820:	00009044 	andeq	r9, r0, r4, asr #32
    2824:	00000044 	andeq	r0, r0, r4, asr #32
    2828:	660b9c01 	strvs	r9, [fp], -r1, lsl #24
    282c:	2a0a0100 	bcs	282c34 <_stack+0x202c34>
    2830:	02000001 	andeq	r0, r0, #1
    2834:	00007491 	muleq	r0, r1, r4
    2838:	000000b3 	strheq	r0, [r0], -r3
    283c:	0bbb0004 	bleq	feec2854 <CPSR_UNAFFECTED_BITS+0xfeec2954>
    2840:	01040000 	mrseq	r0, (UNDEF: 4)
    2844:	00000044 	andeq	r0, r0, r4, asr #32
    2848:	00121a0c 	andseq	r1, r2, ip, lsl #20
    284c:	00927000 	addseq	r7, r2, r0
    2850:	00007000 	andeq	r7, r0, r0
    2854:	000e0e00 	andeq	r0, lr, r0, lsl #28
    2858:	06010200 	streq	r0, [r1], -r0, lsl #4
    285c:	000000dc 	ldrdeq	r0, [r0], -ip
    2860:	da080102 	ble	202c70 <_stack+0x182c70>
    2864:	02000000 	andeq	r0, r0, #0
    2868:	013b0502 	teqeq	fp, r2, lsl #10
    286c:	02020000 	andeq	r0, r2, #0
    2870:	0000e807 	andeq	lr, r0, r7, lsl #16
    2874:	05040200 	streq	r0, [r4, #-512]	; 0xfffffe00
    2878:	00000132 	andeq	r0, r0, r2, lsr r1
    287c:	12070402 	andne	r0, r7, #33554432	; 0x2000000
    2880:	02000001 	andeq	r0, r0, #1
    2884:	012d0508 			; <UNDEFINED> instruction: 0x012d0508
    2888:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
    288c:	00010d07 	andeq	r0, r1, r7, lsl #26
    2890:	05040300 	streq	r0, [r4, #-768]	; 0xfffffd00
    2894:	00746e69 	rsbseq	r6, r4, r9, ror #28
    2898:	17070402 	strne	r0, [r7, -r2, lsl #8]
    289c:	04000001 	streq	r0, [r0], #-1
    28a0:	00000cfb 	strdeq	r0, [r0], -fp
    28a4:	92980a01 	addsls	r0, r8, #4096	; 0x1000
    28a8:	00480000 	subeq	r0, r8, r0
    28ac:	9c010000 	stcls	0, cr0, [r1], {-0}
    28b0:	0000008b 	andeq	r0, r0, fp, lsl #1
    28b4:	00094805 	andeq	r4, r9, r5, lsl #16
    28b8:	8b0a0100 	blhi	282cc0 <_stack+0x202cc0>
    28bc:	02000000 	andeq	r0, r0, #0
    28c0:	06007491 			; <UNDEFINED> instruction: 0x06007491
    28c4:	00009104 	andeq	r9, r0, r4, lsl #2
    28c8:	08010200 	stmdaeq	r1, {r9}
    28cc:	000000e3 	andeq	r0, r0, r3, ror #1
    28d0:	00121007 	andseq	r1, r2, r7
    28d4:	70050100 	andvc	r0, r5, r0, lsl #2
    28d8:	28000092 	stmdacs	r0, {r1, r4, r7}
    28dc:	01000000 	mrseq	r0, (UNDEF: 0)
    28e0:	0063089c 	mlseq	r3, ip, r8, r0
    28e4:	00910501 	addseq	r0, r1, r1, lsl #10
    28e8:	91020000 	mrsls	r0, (UNDEF: 2)
    28ec:	70000077 	andvc	r0, r0, r7, ror r0
    28f0:	02000000 	andeq	r0, r0, #0
    28f4:	000c3c00 	andeq	r3, ip, r0, lsl #24
    28f8:	6d010400 	cfstrsvs	mvf0, [r1, #-0]
    28fc:	e000000e 	and	r0, r0, lr
    2900:	50000092 	mulpl	r0, r2, r0
    2904:	2f000093 	svccs	0x00000093
    2908:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
    290c:	6462612f 	strbtvs	r6, [r2], #-303	; 0xfffffed1
    2910:	72616b69 	rsbvc	r6, r1, #107520	; 0x1a400
    2914:	642f6d69 	strtvs	r6, [pc], #-3433	; 291c <_heap_top+0x191c>
    2918:	4d2f7665 	stcmi	6, cr7, [pc, #-404]!	; 278c <_heap_top+0x178c>
    291c:	74694c79 	strbtvc	r4, [r9], #-3193	; 0xfffff387
    2920:	4f656c74 	svcmi	0x00656c74
    2924:	72732f53 	rsbsvc	r2, r3, #332	; 0x14c
    2928:	63732f63 	cmnvs	r3, #396	; 0x18c
    292c:	75646568 	strbvc	r6, [r4, #-1384]!	; 0xfffffa98
    2930:	2e72656c 	cdpcs	5, 7, cr6, cr2, cr12, {3}
    2934:	682f0073 	stmdavs	pc!, {r0, r1, r4, r5, r6}	; <UNPREDICTABLE>
    2938:	2f656d6f 	svccs	0x00656d6f
    293c:	69646261 	stmdbvs	r4!, {r0, r5, r6, r9, sp, lr}^
    2940:	6972616b 	ldmdbvs	r2!, {r0, r1, r3, r5, r6, r8, sp, lr}^
    2944:	65642f6d 	strbvs	r2, [r4, #-3949]!	; 0xfffff093
    2948:	794d2f76 	stmdbvc	sp, {r1, r2, r4, r5, r6, r8, r9, sl, fp, sp}^
    294c:	7474694c 	ldrbtvc	r6, [r4], #-2380	; 0xfffff6b4
    2950:	534f656c 	movtpl	r6, #62828	; 0xf56c
    2954:	554e4700 	strbpl	r4, [lr, #-1792]	; 0xfffff900
    2958:	20534120 	subscs	r4, r3, r0, lsr #2
    295c:	37322e32 			; <UNDEFINED> instruction: 0x37322e32
    2960:	6c800100 	stfvss	f0, [r0], {0}
    2964:	02000000 	andeq	r0, r0, #0
    2968:	000c5000 	andeq	r5, ip, r0
    296c:	e4010400 	str	r0, [r1], #-1024	; 0xfffffc00
    2970:	0000000e 	andeq	r0, r0, lr
    2974:	94000080 	strls	r0, [r0], #-128	; 0xffffff80
    2978:	2f000080 	svccs	0x00000080
    297c:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
    2980:	6462612f 	strbtvs	r6, [r2], #-303	; 0xfffffed1
    2984:	72616b69 	rsbvc	r6, r1, #107520	; 0x1a400
    2988:	642f6d69 	strtvs	r6, [pc], #-3433	; 2990 <_heap_top+0x1990>
    298c:	4d2f7665 	stcmi	6, cr7, [pc, #-404]!	; 2800 <_heap_top+0x1800>
    2990:	74694c79 	strbtvc	r4, [r9], #-3193	; 0xfffff387
    2994:	4f656c74 	svcmi	0x00656c74
    2998:	72732f53 	rsbsvc	r2, r3, #332	; 0x14c
    299c:	74732f63 	ldrbtvc	r2, [r3], #-3939	; 0xfffff09d
    29a0:	2e747261 	cdpcs	2, 7, cr7, cr4, cr1, {3}
    29a4:	682f0073 	stmdavs	pc!, {r0, r1, r4, r5, r6}	; <UNPREDICTABLE>
    29a8:	2f656d6f 	svccs	0x00656d6f
    29ac:	69646261 	stmdbvs	r4!, {r0, r5, r6, r9, sp, lr}^
    29b0:	6972616b 	ldmdbvs	r2!, {r0, r1, r3, r5, r6, r8, sp, lr}^
    29b4:	65642f6d 	strbvs	r2, [r4, #-3949]!	; 0xfffff093
    29b8:	794d2f76 	stmdbvc	sp, {r1, r2, r4, r5, r6, r8, r9, sl, fp, sp}^
    29bc:	7474694c 	ldrbtvc	r6, [r4], #-2380	; 0xfffff6b4
    29c0:	534f656c 	movtpl	r6, #62828	; 0xf56c
    29c4:	554e4700 	strbpl	r4, [lr, #-1792]	; 0xfffff900
    29c8:	20534120 	subscs	r4, r3, r0, lsr #2
    29cc:	37322e32 			; <UNDEFINED> instruction: 0x37322e32
    29d0:	6a800100 	bvs	fe002dd8 <CPSR_UNAFFECTED_BITS+0xfe002ed8>
    29d4:	02000000 	andeq	r0, r0, #0
    29d8:	000c6400 	andeq	r6, ip, r0, lsl #8
    29dc:	63010400 	movwvs	r0, #5120	; 0x1400
    29e0:	5000000f 	andpl	r0, r0, pc
    29e4:	70000093 	mulvc	r0, r3, r0
    29e8:	2f000093 	svccs	0x00000093
    29ec:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
    29f0:	6462612f 	strbtvs	r6, [r2], #-303	; 0xfffffed1
    29f4:	72616b69 	rsbvc	r6, r1, #107520	; 0x1a400
    29f8:	642f6d69 	strtvs	r6, [pc], #-3433	; 2a00 <_heap_top+0x1a00>
    29fc:	4d2f7665 	stcmi	6, cr7, [pc, #-404]!	; 2870 <_heap_top+0x1870>
    2a00:	74694c79 	strbtvc	r4, [r9], #-3193	; 0xfffff387
    2a04:	4f656c74 	svcmi	0x00656c74
    2a08:	72732f53 	rsbsvc	r2, r3, #332	; 0x14c
    2a0c:	76732f63 	ldrbtvc	r2, [r3], -r3, ror #30
    2a10:	00732e63 	rsbseq	r2, r3, r3, ror #28
    2a14:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; 2960 <_heap_top+0x1960>
    2a18:	62612f65 	rsbvs	r2, r1, #404	; 0x194
    2a1c:	616b6964 	cmnvs	fp, r4, ror #18
    2a20:	2f6d6972 	svccs	0x006d6972
    2a24:	2f766564 	svccs	0x00766564
    2a28:	694c794d 	stmdbvs	ip, {r0, r2, r3, r6, r8, fp, ip, sp, lr}^
    2a2c:	656c7474 	strbvs	r7, [ip, #-1140]!	; 0xfffffb8c
    2a30:	4700534f 	strmi	r5, [r0, -pc, asr #6]
    2a34:	4120554e 			; <UNDEFINED> instruction: 0x4120554e
    2a38:	2e322053 	mrccs	0, 1, r2, cr2, cr3, {2}
    2a3c:	01003732 	tsteq	r0, r2, lsr r7
    2a40:	Address 0x0000000000002a40 is out of bounds.


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
  74:	0b002408 	bleq	909c <fifo_read+0x14>
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
 1a4:	3a0e0300 	bcc	380dac <_stack+0x300dac>
 1a8:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 1ac:	00180213 	andseq	r0, r8, r3, lsl r2
 1b0:	00340d00 	eorseq	r0, r4, r0, lsl #26
 1b4:	0b3a0803 	bleq	e821c8 <_stack+0xe021c8>
 1b8:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 1bc:	00001802 	andeq	r1, r0, r2, lsl #16
 1c0:	11010b0e 	tstne	r1, lr, lsl #22
 1c4:	00061201 	andeq	r1, r6, r1, lsl #4
 1c8:	01010f00 	tsteq	r1, r0, lsl #30
 1cc:	13011349 	movwne	r1, #4937	; 0x1349
 1d0:	21100000 	tstcs	r0, r0
 1d4:	2f134900 	svccs	0x00134900
 1d8:	1100000b 	tstne	r0, fp
 1dc:	0b0b000f 	bleq	2c0220 <_stack+0x240220>
 1e0:	00001349 	andeq	r1, r0, r9, asr #6
 1e4:	01110100 	tsteq	r1, r0, lsl #2
 1e8:	0b130e25 	bleq	4c3a84 <_stack+0x443a84>
 1ec:	01110e03 	tsteq	r1, r3, lsl #28
 1f0:	17100612 			; <UNDEFINED> instruction: 0x17100612
 1f4:	24020000 	strcs	r0, [r2], #-0
 1f8:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 1fc:	000e030b 	andeq	r0, lr, fp, lsl #6
 200:	00160300 	andseq	r0, r6, r0, lsl #6
 204:	0b3a0e03 	bleq	e83a18 <_stack+0xe03a18>
 208:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 20c:	24040000 	strcs	r0, [r4], #-0
 210:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 214:	0008030b 	andeq	r0, r8, fp, lsl #6
 218:	00350500 	eorseq	r0, r5, r0, lsl #10
 21c:	00001349 	andeq	r1, r0, r9, asr #6
 220:	49002606 	stmdbmi	r0, {r1, r2, r9, sl, sp}
 224:	07000013 	smladeq	r0, r3, r0, r0
 228:	0e030113 	mcreq	1, 0, r0, cr3, cr3, {0}
 22c:	0b3a0b0b 	bleq	e82e60 <_stack+0xe02e60>
 230:	13010b3b 	movwne	r0, #6971	; 0x1b3b
 234:	0d080000 	stceq	0, cr0, [r8, #-0]
 238:	3a0e0300 	bcc	380e40 <_stack+0x300e40>
 23c:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 240:	000b3813 	andeq	r3, fp, r3, lsl r8
 244:	000f0900 	andeq	r0, pc, r0, lsl #18
 248:	13490b0b 	movtne	r0, #39691	; 0x9b0b
 24c:	010a0000 	mrseq	r0, (UNDEF: 10)
 250:	01134901 	tsteq	r3, r1, lsl #18
 254:	0b000013 	bleq	2a8 <CPSR_IRQ_INHIBIT+0x228>
 258:	13490021 	movtne	r0, #36897	; 0x9021
 25c:	340c0000 	strcc	r0, [ip], #-0
 260:	3a0e0300 	bcc	380e68 <_stack+0x300e68>
 264:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 268:	3c193f13 	ldccc	15, cr3, [r9], {19}
 26c:	0d000019 	stceq	0, cr0, [r0, #-100]	; 0xffffff9c
 270:	0e030034 	mcreq	0, 0, r0, cr3, cr4, {1}
 274:	0b3b0b3a 	bleq	ec2f64 <_stack+0xe42f64>
 278:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 27c:	210e0000 	mrscs	r0, (UNDEF: 14)
 280:	2f134900 	svccs	0x00134900
 284:	0f00000b 	svceq	0x0000000b
 288:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 28c:	0b3a0e03 	bleq	e83aa0 <_stack+0xe03aa0>
 290:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 294:	01111349 	tsteq	r1, r9, asr #6
 298:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 29c:	01194297 			; <UNDEFINED> instruction: 0x01194297
 2a0:	10000013 	andne	r0, r0, r3, lsl r0
 2a4:	0e030005 	cdpeq	0, 0, cr0, cr3, cr5, {0}
 2a8:	0b3b0b3a 	bleq	ec2f98 <_stack+0xe42f98>
 2ac:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 2b0:	0b110000 	bleq	4402b8 <_stack+0x3c02b8>
 2b4:	12011101 	andne	r1, r1, #1073741824	; 0x40000000
 2b8:	12000006 	andne	r0, r0, #6
 2bc:	0b0b000f 	bleq	2c0300 <_stack+0x240300>
 2c0:	01000000 	mrseq	r0, (UNDEF: 0)
 2c4:	0e250111 	mcreq	1, 1, r0, cr5, cr1, {0}
 2c8:	0e030b13 	vmoveq.32	d3[0], r0
 2cc:	06120111 			; <UNDEFINED> instruction: 0x06120111
 2d0:	00001710 	andeq	r1, r0, r0, lsl r7
 2d4:	0b002402 	bleq	92e4 <_context_switch+0x4>
 2d8:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 2dc:	0300000e 	movweq	r0, #14
 2e0:	0e030016 	mcreq	0, 0, r0, cr3, cr6, {0}
 2e4:	0b3b0b3a 	bleq	ec2fd4 <_stack+0xe42fd4>
 2e8:	00001349 	andeq	r1, r0, r9, asr #6
 2ec:	0b002404 	bleq	9304 <_context_switch+0x24>
 2f0:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 2f4:	05000008 	streq	r0, [r0, #-8]
 2f8:	13490035 	movtne	r0, #36917	; 0x9035
 2fc:	13060000 	movwne	r0, #24576	; 0x6000
 300:	3a0b0b01 	bcc	2c2f0c <_stack+0x242f0c>
 304:	010b3b0b 	tsteq	fp, fp, lsl #22
 308:	07000013 	smladeq	r0, r3, r0, r0
 30c:	0803000d 	stmdaeq	r3, {r0, r2, r3}
 310:	0b3b0b3a 	bleq	ec3000 <_stack+0xe43000>
 314:	0b381349 	bleq	e05040 <_stack+0xd85040>
 318:	0d080000 	stceq	0, cr0, [r8, #-0]
 31c:	3a0e0300 	bcc	380f24 <_stack+0x300f24>
 320:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 324:	000b3813 	andeq	r3, fp, r3, lsl r8
 328:	01010900 	tsteq	r1, r0, lsl #18
 32c:	13011349 	movwne	r1, #4937	; 0x1349
 330:	210a0000 	mrscs	r0, (UNDEF: 10)
 334:	2f134900 	svccs	0x00134900
 338:	0b00000b 	bleq	36c <CPSR_IRQ_INHIBIT+0x2ec>
 33c:	08030034 	stmdaeq	r3, {r2, r4, r5}
 340:	0b3b0b3a 	bleq	ec3030 <_stack+0xe43030>
 344:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 348:	340c0000 	strcc	r0, [ip], #-0
 34c:	3a0e0300 	bcc	380f54 <_stack+0x300f54>
 350:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 354:	00180213 	andseq	r0, r8, r3, lsl r2
 358:	000f0d00 	andeq	r0, pc, r0, lsl #26
 35c:	13490b0b 	movtne	r0, #39691	; 0x9b0b
 360:	2e0e0000 	cdpcs	0, 0, cr0, cr14, cr0, {0}
 364:	03193f01 	tsteq	r9, #1, 30
 368:	3b0b3a0e 	blcc	2ceba8 <_stack+0x24eba8>
 36c:	4919270b 	ldmdbmi	r9, {r0, r1, r3, r8, r9, sl, sp}
 370:	12011113 	andne	r1, r1, #-1073741820	; 0xc0000004
 374:	97184006 	ldrls	r4, [r8, -r6]
 378:	13011942 	movwne	r1, #6466	; 0x1942
 37c:	2e0f0000 	cdpcs	0, 0, cr0, cr15, cr0, {0}
 380:	03193f00 	tsteq	r9, #0, 30
 384:	3b0b3a0e 	blcc	2cebc4 <_stack+0x24ebc4>
 388:	4919270b 	ldmdbmi	r9, {r0, r1, r3, r8, r9, sl, sp}
 38c:	12011113 	andne	r1, r1, #-1073741820	; 0xc0000004
 390:	97184006 	ldrls	r4, [r8, -r6]
 394:	00001942 	andeq	r1, r0, r2, asr #18
 398:	3f012e10 	svccc	0x00012e10
 39c:	3a0e0319 	bcc	381008 <_stack+0x301008>
 3a0:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 3a4:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 3a8:	97184006 	ldrls	r4, [r8, -r6]
 3ac:	13011942 	movwne	r1, #6466	; 0x1942
 3b0:	05110000 	ldreq	r0, [r1, #-0]
 3b4:	3a0e0300 	bcc	380fbc <_stack+0x300fbc>
 3b8:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 3bc:	00180213 	andseq	r0, r8, r3, lsl r2
 3c0:	012e1200 			; <UNDEFINED> instruction: 0x012e1200
 3c4:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
 3c8:	0b3b0b3a 	bleq	ec30b8 <_stack+0xe430b8>
 3cc:	01111927 	tsteq	r1, r7, lsr #18
 3d0:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 3d4:	01194296 			; <UNDEFINED> instruction: 0x01194296
 3d8:	13000013 	movwne	r0, #19
 3dc:	13010115 	movwne	r0, #4373	; 0x1115
 3e0:	18140000 	ldmdane	r4, {}	; <UNPREDICTABLE>
 3e4:	00000000 	andeq	r0, r0, r0
 3e8:	25011101 	strcs	r1, [r1, #-257]	; 0xfffffeff
 3ec:	030b130e 	movweq	r1, #45838	; 0xb30e
 3f0:	1201110e 	andne	r1, r1, #-2147483645	; 0x80000003
 3f4:	00171006 	andseq	r1, r7, r6
 3f8:	00240200 	eoreq	r0, r4, r0, lsl #4
 3fc:	0b3e0b0b 	bleq	f83030 <_stack+0xf03030>
 400:	00000e03 	andeq	r0, r0, r3, lsl #28
 404:	03001603 	movweq	r1, #1539	; 0x603
 408:	3b0b3a0e 	blcc	2cec48 <_stack+0x24ec48>
 40c:	0013490b 	andseq	r4, r3, fp, lsl #18
 410:	00240400 	eoreq	r0, r4, r0, lsl #8
 414:	0b3e0b0b 	bleq	f83048 <_stack+0xf03048>
 418:	00000803 	andeq	r0, r0, r3, lsl #16
 41c:	49003505 	stmdbmi	r0, {r0, r2, r8, sl, ip, sp}
 420:	06000013 			; <UNDEFINED> instruction: 0x06000013
 424:	0b0b0113 	bleq	2c0878 <_stack+0x240878>
 428:	0b3b0b3a 	bleq	ec3118 <_stack+0xe43118>
 42c:	00001301 	andeq	r1, r0, r1, lsl #6
 430:	03000d07 	movweq	r0, #3335	; 0xd07
 434:	3b0b3a0e 	blcc	2cec74 <_stack+0x24ec74>
 438:	3813490b 	ldmdacc	r3, {r0, r1, r3, r8, fp, lr}
 43c:	0800000b 	stmdaeq	r0, {r0, r1, r3}
 440:	0e030034 	mcreq	0, 0, r0, cr3, cr4, {1}
 444:	0b3b0b3a 	bleq	ec3134 <_stack+0xe43134>
 448:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 44c:	0f090000 	svceq	0x00090000
 450:	490b0b00 	stmdbmi	fp, {r8, r9, fp}
 454:	0a000013 	beq	4a8 <CPSR_IRQ_INHIBIT+0x428>
 458:	193f002e 	ldmdbne	pc!, {r1, r2, r3, r5}	; <UNPREDICTABLE>
 45c:	0b3a0e03 	bleq	e83c70 <_stack+0xe03c70>
 460:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 464:	06120111 			; <UNDEFINED> instruction: 0x06120111
 468:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 46c:	0b000019 	bleq	4d8 <CPSR_IRQ_INHIBIT+0x458>
 470:	193f002e 	ldmdbne	pc!, {r1, r2, r3, r5}	; <UNPREDICTABLE>
 474:	0b3a0e03 	bleq	e83c88 <_stack+0xe03c88>
 478:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 47c:	01111349 	tsteq	r1, r9, asr #6
 480:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 484:	00194297 	mulseq	r9, r7, r2
 488:	11010000 	mrsne	r0, (UNDEF: 1)
 48c:	130e2501 	movwne	r2, #58625	; 0xe501
 490:	110e030b 	tstne	lr, fp, lsl #6
 494:	10061201 	andne	r1, r6, r1, lsl #4
 498:	02000017 	andeq	r0, r0, #23
 49c:	0b0b0024 	bleq	2c0534 <_stack+0x240534>
 4a0:	0e030b3e 	vmoveq.16	d3[0], r0
 4a4:	16030000 	strne	r0, [r3], -r0
 4a8:	3a0e0300 	bcc	3810b0 <_stack+0x3010b0>
 4ac:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 4b0:	04000013 	streq	r0, [r0], #-19	; 0xffffffed
 4b4:	0b0b0024 	bleq	2c054c <_stack+0x24054c>
 4b8:	08030b3e 	stmdaeq	r3, {r1, r2, r3, r4, r5, r8, r9, fp}
 4bc:	35050000 	strcc	r0, [r5, #-0]
 4c0:	00134900 	andseq	r4, r3, r0, lsl #18
 4c4:	00260600 	eoreq	r0, r6, r0, lsl #12
 4c8:	00001349 	andeq	r1, r0, r9, asr #6
 4cc:	0b010407 	bleq	414f0 <__bss_end__+0x37fa8>
 4d0:	3a13490b 	bcc	4d2904 <_stack+0x452904>
 4d4:	010b3b0b 	tsteq	fp, fp, lsl #22
 4d8:	08000013 	stmdaeq	r0, {r0, r1, r4}
 4dc:	0e030028 	cdpeq	0, 0, cr0, cr3, cr8, {1}
 4e0:	00000b1c 	andeq	r0, r0, ip, lsl fp
 4e4:	0b011309 	bleq	45110 <__bss_end__+0x3bbc8>
 4e8:	3b0b3a0b 	blcc	2ced1c <_stack+0x24ed1c>
 4ec:	0013010b 	andseq	r0, r3, fp, lsl #2
 4f0:	000d0a00 	andeq	r0, sp, r0, lsl #20
 4f4:	0b3a0e03 	bleq	e83d08 <_stack+0xe03d08>
 4f8:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 4fc:	00000b38 	andeq	r0, r0, r8, lsr fp
 500:	0300340b 	movweq	r3, #1035	; 0x40b
 504:	3b0b3a0e 	blcc	2ced44 <_stack+0x24ed44>
 508:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 50c:	0c000018 	stceq	0, cr0, [r0], {24}
 510:	0b0b000f 	bleq	2c0554 <_stack+0x240554>
 514:	00001349 	andeq	r1, r0, r9, asr #6
 518:	3f002e0d 	svccc	0x00002e0d
 51c:	3a0e0319 	bcc	381188 <_stack+0x301188>
 520:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 524:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 528:	97184006 	ldrls	r4, [r8, -r6]
 52c:	00001942 	andeq	r1, r0, r2, asr #18
 530:	3f012e0e 	svccc	0x00012e0e
 534:	3a0e0319 	bcc	3811a0 <_stack+0x3011a0>
 538:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 53c:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 540:	97184006 	ldrls	r4, [r8, -r6]
 544:	13011942 	movwne	r1, #6466	; 0x1942
 548:	050f0000 	streq	r0, [pc, #-0]	; 550 <CPSR_IRQ_INHIBIT+0x4d0>
 54c:	3a0e0300 	bcc	381154 <_stack+0x301154>
 550:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 554:	00180213 	andseq	r0, r8, r3, lsl r2
 558:	002e1000 	eoreq	r1, lr, r0
 55c:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
 560:	0b3b0b3a 	bleq	ec3250 <_stack+0xe43250>
 564:	13491927 	movtne	r1, #39207	; 0x9927
 568:	06120111 			; <UNDEFINED> instruction: 0x06120111
 56c:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 570:	00000019 	andeq	r0, r0, r9, lsl r0
 574:	25011101 	strcs	r1, [r1, #-257]	; 0xfffffeff
 578:	030b130e 	movweq	r1, #45838	; 0xb30e
 57c:	1201110e 	andne	r1, r1, #-2147483645	; 0x80000003
 580:	00171006 	andseq	r1, r7, r6
 584:	00240200 	eoreq	r0, r4, r0, lsl #4
 588:	0b3e0b0b 	bleq	f831bc <_stack+0xf031bc>
 58c:	00000e03 	andeq	r0, r0, r3, lsl #28
 590:	03001603 	movweq	r1, #1539	; 0x603
 594:	3b0b3a0e 	blcc	2cedd4 <_stack+0x24edd4>
 598:	0013490b 	andseq	r4, r3, fp, lsl #18
 59c:	00240400 	eoreq	r0, r4, r0, lsl #8
 5a0:	0b3e0b0b 	bleq	f831d4 <_stack+0xf031d4>
 5a4:	00000803 	andeq	r0, r0, r3, lsl #16
 5a8:	49003505 	stmdbmi	r0, {r0, r2, r8, sl, ip, sp}
 5ac:	06000013 			; <UNDEFINED> instruction: 0x06000013
 5b0:	0b0b0113 	bleq	2c0a04 <_stack+0x240a04>
 5b4:	0b3b0b3a 	bleq	ec32a4 <_stack+0xe432a4>
 5b8:	00001301 	andeq	r1, r0, r1, lsl #6
 5bc:	03000d07 	movweq	r0, #3335	; 0xd07
 5c0:	3b0b3a0e 	blcc	2cee00 <_stack+0x24ee00>
 5c4:	3813490b 	ldmdacc	r3, {r0, r1, r3, r8, fp, lr}
 5c8:	0800000b 	stmdaeq	r0, {r0, r1, r3}
 5cc:	0e030034 	mcreq	0, 0, r0, cr3, cr4, {1}
 5d0:	0b3b0b3a 	bleq	ec32c0 <_stack+0xe432c0>
 5d4:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 5d8:	0f090000 	svceq	0x00090000
 5dc:	490b0b00 	stmdbmi	fp, {r8, r9, fp}
 5e0:	0a000013 	beq	634 <CPSR_IRQ_INHIBIT+0x5b4>
 5e4:	193f002e 	ldmdbne	pc!, {r1, r2, r3, r5}	; <UNPREDICTABLE>
 5e8:	0b3a0e03 	bleq	e83dfc <_stack+0xe03dfc>
 5ec:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 5f0:	06120111 			; <UNDEFINED> instruction: 0x06120111
 5f4:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 5f8:	0b000019 	bleq	664 <CPSR_IRQ_INHIBIT+0x5e4>
 5fc:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 600:	0b3a0e03 	bleq	e83e14 <_stack+0xe03e14>
 604:	01110b3b 	tsteq	r1, fp, lsr fp
 608:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 60c:	01194296 			; <UNDEFINED> instruction: 0x01194296
 610:	0c000013 	stceq	0, cr0, [r0], {19}
 614:	08030034 	stmdaeq	r3, {r2, r4, r5}
 618:	0b3b0b3a 	bleq	ec3308 <_stack+0xe43308>
 61c:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 620:	2e0d0000 	cdpcs	0, 0, cr0, cr13, cr0, {0}
 624:	03193f01 	tsteq	r9, #1, 30
 628:	3b0b3a0e 	blcc	2cee68 <_stack+0x24ee68>
 62c:	1119270b 	tstne	r9, fp, lsl #14
 630:	40061201 	andmi	r1, r6, r1, lsl #4
 634:	19429618 	stmdbne	r2, {r3, r4, r9, sl, ip, pc}^
 638:	00001301 	andeq	r1, r0, r1, lsl #6
 63c:	3f002e0e 	svccc	0x00002e0e
 640:	3a0e0319 	bcc	3812ac <_stack+0x3012ac>
 644:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 648:	11134919 	tstne	r3, r9, lsl r9
 64c:	40061201 	andmi	r1, r6, r1, lsl #4
 650:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 654:	01000000 	mrseq	r0, (UNDEF: 0)
 658:	0e250111 	mcreq	1, 1, r0, cr5, cr1, {0}
 65c:	0e030b13 	vmoveq.32	d3[0], r0
 660:	06120111 			; <UNDEFINED> instruction: 0x06120111
 664:	00001710 	andeq	r1, r0, r0, lsl r7
 668:	0b002402 	bleq	9678 <__bss_end__+0x130>
 66c:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 670:	0300000e 	movweq	r0, #14
 674:	0e030016 	mcreq	0, 0, r0, cr3, cr6, {0}
 678:	0b3b0b3a 	bleq	ec3368 <_stack+0xe43368>
 67c:	00001349 	andeq	r1, r0, r9, asr #6
 680:	0b002404 	bleq	9698 <__bss_end__+0x150>
 684:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 688:	05000008 	streq	r0, [r0, #-8]
 68c:	13490035 	movtne	r0, #36917	; 0x9035
 690:	13060000 	movwne	r0, #24576	; 0x6000
 694:	3a0b0b01 	bcc	2c32a0 <_stack+0x2432a0>
 698:	010b3b0b 	tsteq	fp, fp, lsl #22
 69c:	07000013 	smladeq	r0, r3, r0, r0
 6a0:	0e03000d 	cdpeq	0, 0, cr0, cr3, cr13, {0}
 6a4:	0b3b0b3a 	bleq	ec3394 <_stack+0xe43394>
 6a8:	0b381349 	bleq	e053d4 <_stack+0xd853d4>
 6ac:	34080000 	strcc	r0, [r8], #-0
 6b0:	3a0e0300 	bcc	3812b8 <_stack+0x3012b8>
 6b4:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 6b8:	00180213 	andseq	r0, r8, r3, lsl r2
 6bc:	000f0900 	andeq	r0, pc, r0, lsl #18
 6c0:	13490b0b 	movtne	r0, #39691	; 0x9b0b
 6c4:	2e0a0000 	cdpcs	0, 0, cr0, cr10, cr0, {0}
 6c8:	03193f01 	tsteq	r9, #1, 30
 6cc:	3b0b3a0e 	blcc	2cef0c <_stack+0x24ef0c>
 6d0:	1119270b 	tstne	r9, fp, lsl #14
 6d4:	40061201 	andmi	r1, r6, r1, lsl #4
 6d8:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 6dc:	00001301 	andeq	r1, r0, r1, lsl #6
 6e0:	0300050b 	movweq	r0, #1291	; 0x50b
 6e4:	3b0b3a08 	blcc	2cef0c <_stack+0x24ef0c>
 6e8:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 6ec:	0c000018 	stceq	0, cr0, [r0], {24}
 6f0:	08030034 	stmdaeq	r3, {r2, r4, r5}
 6f4:	0b3b0b3a 	bleq	ec33e4 <_stack+0xe433e4>
 6f8:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 6fc:	2e0d0000 	cdpcs	0, 0, cr0, cr13, cr0, {0}
 700:	03193f00 	tsteq	r9, #0, 30
 704:	3b0b3a0e 	blcc	2cef44 <_stack+0x24ef44>
 708:	4919270b 	ldmdbmi	r9, {r0, r1, r3, r8, r9, sl, sp}
 70c:	12011113 	andne	r1, r1, #-1073741820	; 0xc0000004
 710:	97184006 	ldrls	r4, [r8, -r6]
 714:	00001942 	andeq	r1, r0, r2, asr #18
 718:	01110100 	tsteq	r1, r0, lsl #2
 71c:	0b130e25 	bleq	4c3fb8 <_stack+0x443fb8>
 720:	01110e03 	tsteq	r1, r3, lsl #28
 724:	17100612 			; <UNDEFINED> instruction: 0x17100612
 728:	24020000 	strcs	r0, [r2], #-0
 72c:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 730:	000e030b 	andeq	r0, lr, fp, lsl #6
 734:	00160300 	andseq	r0, r6, r0, lsl #6
 738:	0b3a0e03 	bleq	e83f4c <_stack+0xe03f4c>
 73c:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 740:	24040000 	strcs	r0, [r4], #-0
 744:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 748:	0008030b 	andeq	r0, r8, fp, lsl #6
 74c:	00350500 	eorseq	r0, r5, r0, lsl #10
 750:	00001349 	andeq	r1, r0, r9, asr #6
 754:	49002606 	stmdbmi	r0, {r1, r2, r9, sl, sp}
 758:	07000013 	smladeq	r0, r3, r0, r0
 75c:	0b0b0113 	bleq	2c0bb0 <_stack+0x240bb0>
 760:	0b3b0b3a 	bleq	ec3450 <_stack+0xe43450>
 764:	00001301 	andeq	r1, r0, r1, lsl #6
 768:	03000d08 	movweq	r0, #3336	; 0xd08
 76c:	3b0b3a0e 	blcc	2cefac <_stack+0x24efac>
 770:	3813490b 	ldmdacc	r3, {r0, r1, r3, r8, fp, lr}
 774:	0900000b 	stmdbeq	r0, {r0, r1, r3}
 778:	0b0b0104 	bleq	2c0b90 <_stack+0x240b90>
 77c:	0b3a1349 	bleq	e854a8 <_stack+0xe054a8>
 780:	13010b3b 	movwne	r0, #6971	; 0x1b3b
 784:	280a0000 	stmdacs	sl, {}	; <UNPREDICTABLE>
 788:	1c0e0300 	stcne	3, cr0, [lr], {-0}
 78c:	0b00000b 	bleq	7c0 <CPSR_IRQ_INHIBIT+0x740>
 790:	13490101 	movtne	r0, #37121	; 0x9101
 794:	00001301 	andeq	r1, r0, r1, lsl #6
 798:	4900210c 	stmdbmi	r0, {r2, r3, r8, sp}
 79c:	000b2f13 	andeq	r2, fp, r3, lsl pc
 7a0:	00340d00 	eorseq	r0, r4, r0, lsl #26
 7a4:	0b3a0e03 	bleq	e83fb8 <_stack+0xe03fb8>
 7a8:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 7ac:	00001802 	andeq	r1, r0, r2, lsl #16
 7b0:	0b000f0e 	bleq	43f0 <_heap_top+0x33f0>
 7b4:	0013490b 	andseq	r4, r3, fp, lsl #18
 7b8:	012e0f00 			; <UNDEFINED> instruction: 0x012e0f00
 7bc:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
 7c0:	0b3b0b3a 	bleq	ec34b0 <_stack+0xe434b0>
 7c4:	01111927 	tsteq	r1, r7, lsr #18
 7c8:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 7cc:	01194296 			; <UNDEFINED> instruction: 0x01194296
 7d0:	10000013 	andne	r0, r0, r3, lsl r0
 7d4:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 7d8:	0b3a0e03 	bleq	e83fec <_stack+0xe03fec>
 7dc:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 7e0:	01111349 	tsteq	r1, r9, asr #6
 7e4:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 7e8:	01194296 			; <UNDEFINED> instruction: 0x01194296
 7ec:	11000013 	tstne	r0, r3, lsl r0
 7f0:	0e030005 	cdpeq	0, 0, cr0, cr3, cr5, {0}
 7f4:	0b3b0b3a 	bleq	ec34e4 <_stack+0xe434e4>
 7f8:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 7fc:	05120000 	ldreq	r0, [r2, #-0]
 800:	3a080300 	bcc	201408 <_stack+0x181408>
 804:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 808:	00180213 	andseq	r0, r8, r3, lsl r2
 80c:	00341300 	eorseq	r1, r4, r0, lsl #6
 810:	0b3a0803 	bleq	e82824 <_stack+0xe02824>
 814:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 818:	00001802 	andeq	r1, r0, r2, lsl #16
 81c:	3f012e14 	svccc	0x00012e14
 820:	3a0e0319 	bcc	38148c <_stack+0x30148c>
 824:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 828:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 82c:	97184006 	ldrls	r4, [r8, -r6]
 830:	13011942 	movwne	r1, #6466	; 0x1942
 834:	2e150000 	cdpcs	0, 1, cr0, cr5, cr0, {0}
 838:	03193f00 	tsteq	r9, #0, 30
 83c:	3b0b3a0e 	blcc	2cf07c <_stack+0x24f07c>
 840:	4919270b 	ldmdbmi	r9, {r0, r1, r3, r8, r9, sl, sp}
 844:	12011113 	andne	r1, r1, #-1073741820	; 0xc0000004
 848:	97184006 	ldrls	r4, [r8, -r6]
 84c:	00001942 	andeq	r1, r0, r2, asr #18
 850:	01110100 	tsteq	r1, r0, lsl #2
 854:	0b130e25 	bleq	4c40f0 <_stack+0x4440f0>
 858:	0e1b0e03 	cdpeq	14, 1, cr0, cr11, cr3, {0}
 85c:	06120111 			; <UNDEFINED> instruction: 0x06120111
 860:	00001710 	andeq	r1, r0, r0, lsl r7
 864:	0b002402 	bleq	9874 <__bss_end__+0x32c>
 868:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 86c:	0300000e 	movweq	r0, #14
 870:	0e030016 	mcreq	0, 0, r0, cr3, cr6, {0}
 874:	0b3b0b3a 	bleq	ec3564 <_stack+0xe43564>
 878:	00001349 	andeq	r1, r0, r9, asr #6
 87c:	0b002404 	bleq	9894 <__bss_end__+0x34c>
 880:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 884:	05000008 	streq	r0, [r0, #-8]
 888:	0b0b000f 	bleq	2c08cc <_stack+0x2408cc>
 88c:	16060000 	strne	r0, [r6], -r0
 890:	3a0e0300 	bcc	381498 <_stack+0x301498>
 894:	49053b0b 	stmdbmi	r5, {r0, r1, r3, r8, r9, fp, ip, sp}
 898:	07000013 	smladeq	r0, r3, r0, r0
 89c:	0b0b0117 	bleq	2c0d00 <_stack+0x240d00>
 8a0:	0b3b0b3a 	bleq	ec3590 <_stack+0xe43590>
 8a4:	00001301 	andeq	r1, r0, r1, lsl #6
 8a8:	03000d08 	movweq	r0, #3336	; 0xd08
 8ac:	3b0b3a0e 	blcc	2cf0ec <_stack+0x24f0ec>
 8b0:	0013490b 	andseq	r4, r3, fp, lsl #18
 8b4:	01010900 	tsteq	r1, r0, lsl #18
 8b8:	13011349 	movwne	r1, #4937	; 0x1349
 8bc:	210a0000 	mrscs	r0, (UNDEF: 10)
 8c0:	2f134900 	svccs	0x00134900
 8c4:	0b00000b 	bleq	8f8 <CPSR_IRQ_INHIBIT+0x878>
 8c8:	0b0b0113 	bleq	2c0d1c <_stack+0x240d1c>
 8cc:	0b3b0b3a 	bleq	ec35bc <_stack+0xe435bc>
 8d0:	00001301 	andeq	r1, r0, r1, lsl #6
 8d4:	03000d0c 	movweq	r0, #3340	; 0xd0c
 8d8:	3b0b3a0e 	blcc	2cf118 <_stack+0x24f118>
 8dc:	3813490b 	ldmdacc	r3, {r0, r1, r3, r8, fp, lr}
 8e0:	0d00000b 	stceq	0, cr0, [r0, #-44]	; 0xffffffd4
 8e4:	0e030113 	mcreq	1, 0, r0, cr3, cr3, {0}
 8e8:	0b3a0b0b 	bleq	e8351c <_stack+0xe0351c>
 8ec:	13010b3b 	movwne	r0, #6971	; 0x1b3b
 8f0:	0d0e0000 	stceq	0, cr0, [lr, #-0]
 8f4:	3a080300 	bcc	2014fc <_stack+0x1814fc>
 8f8:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 8fc:	000b3813 	andeq	r3, fp, r3, lsl r8
 900:	000f0f00 	andeq	r0, pc, r0, lsl #30
 904:	13490b0b 	movtne	r0, #39691	; 0x9b0b
 908:	13100000 	tstne	r0, #0
 90c:	0b0e0301 	bleq	381518 <_stack+0x301518>
 910:	3b0b3a05 	blcc	2cf12c <_stack+0x24f12c>
 914:	0013010b 	andseq	r0, r3, fp, lsl #2
 918:	000d1100 	andeq	r1, sp, r0, lsl #2
 91c:	0b3a0e03 	bleq	e84130 <_stack+0xe04130>
 920:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 924:	00000538 	andeq	r0, r0, r8, lsr r5
 928:	27001512 	smladcs	r0, r2, r5, r1
 92c:	13000019 	movwne	r0, #25
 930:	19270115 	stmdbne	r7!, {r0, r2, r4, r8}
 934:	13011349 	movwne	r1, #4937	; 0x1349
 938:	05140000 	ldreq	r0, [r4, #-0]
 93c:	00134900 	andseq	r4, r3, r0, lsl #18
 940:	00261500 	eoreq	r1, r6, r0, lsl #10
 944:	00001349 	andeq	r1, r0, r9, asr #6
 948:	03011316 	movweq	r1, #4886	; 0x1316
 94c:	3a050b0e 	bcc	14358c <_stack+0xc358c>
 950:	01053b0b 	tsteq	r5, fp, lsl #22
 954:	17000013 	smladne	r0, r3, r0, r0
 958:	0e03000d 	cdpeq	0, 0, cr0, cr3, cr13, {0}
 95c:	053b0b3a 	ldreq	r0, [fp, #-2874]!	; 0xfffff4c6
 960:	0b381349 	bleq	e0568c <_stack+0xd8568c>
 964:	0d180000 	ldceq	0, cr0, [r8, #-0]
 968:	3a0e0300 	bcc	381570 <_stack+0x301570>
 96c:	49053b0b 	stmdbmi	r5, {r0, r1, r3, r8, r9, fp, ip, sp}
 970:	00053813 	andeq	r3, r5, r3, lsl r8
 974:	01131900 	tsteq	r3, r0, lsl #18
 978:	0b0b0e03 	bleq	2c418c <_stack+0x24418c>
 97c:	053b0b3a 	ldreq	r0, [fp, #-2874]!	; 0xfffff4c6
 980:	00001301 	andeq	r1, r0, r1, lsl #6
 984:	0b01131a 	bleq	455f4 <__bss_end__+0x3c0ac>
 988:	3b0b3a0b 	blcc	2cf1bc <_stack+0x24f1bc>
 98c:	00130105 	andseq	r0, r3, r5, lsl #2
 990:	01171b00 	tsteq	r7, r0, lsl #22
 994:	0b3a0b0b 	bleq	e835c8 <_stack+0xe035c8>
 998:	1301053b 	movwne	r0, #5435	; 0x153b
 99c:	0d1c0000 	ldceq	0, cr0, [ip, #-0]
 9a0:	3a0e0300 	bcc	3815a8 <_stack+0x3015a8>
 9a4:	49053b0b 	stmdbmi	r5, {r0, r1, r3, r8, r9, fp, ip, sp}
 9a8:	1d000013 	stcne	0, cr0, [r0, #-76]	; 0xffffffb4
 9ac:	19270115 	stmdbne	r7!, {r0, r2, r4, r8}
 9b0:	00001301 	andeq	r1, r0, r1, lsl #6
 9b4:	0300341e 	movweq	r3, #1054	; 0x41e
 9b8:	3b0b3a0e 	blcc	2cf1f8 <_stack+0x24f1f8>
 9bc:	3f134905 	svccc	0x00134905
 9c0:	00193c19 	andseq	r3, r9, r9, lsl ip
 9c4:	00351f00 	eorseq	r1, r5, r0, lsl #30
 9c8:	00001349 	andeq	r1, r0, r9, asr #6
 9cc:	03003420 	movweq	r3, #1056	; 0x420
 9d0:	3b0b3a0e 	blcc	2cf210 <_stack+0x24f210>
 9d4:	3f13490b 	svccc	0x0013490b
 9d8:	00193c19 	andseq	r3, r9, r9, lsl ip
 9dc:	012e2100 			; <UNDEFINED> instruction: 0x012e2100
 9e0:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
 9e4:	0b3b0b3a 	bleq	ec36d4 <_stack+0xe436d4>
 9e8:	13491927 	movtne	r1, #39207	; 0x9927
 9ec:	06120111 			; <UNDEFINED> instruction: 0x06120111
 9f0:	42961840 	addsmi	r1, r6, #64, 16	; 0x400000
 9f4:	00130119 	andseq	r0, r3, r9, lsl r1
 9f8:	00342200 	eorseq	r2, r4, r0, lsl #4
 9fc:	0b3a0e03 	bleq	e84210 <_stack+0xe04210>
 a00:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 a04:	00001802 	andeq	r1, r0, r2, lsl #16
 a08:	03003423 	movweq	r3, #1059	; 0x423
 a0c:	3b0b3a08 	blcc	2cf234 <_stack+0x24f234>
 a10:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 a14:	00000018 	andeq	r0, r0, r8, lsl r0
 a18:	25011101 	strcs	r1, [r1, #-257]	; 0xfffffeff
 a1c:	030b130e 	movweq	r1, #45838	; 0xb30e
 a20:	1201110e 	andne	r1, r1, #-2147483645	; 0x80000003
 a24:	00171006 	andseq	r1, r7, r6
 a28:	00240200 	eoreq	r0, r4, r0, lsl #4
 a2c:	0b3e0b0b 	bleq	f83660 <_stack+0xf03660>
 a30:	00000e03 	andeq	r0, r0, r3, lsl #28
 a34:	03001603 	movweq	r1, #1539	; 0x603
 a38:	3b0b3a0e 	blcc	2cf278 <_stack+0x24f278>
 a3c:	0013490b 	andseq	r4, r3, fp, lsl #18
 a40:	00240400 	eoreq	r0, r4, r0, lsl #8
 a44:	0b3e0b0b 	bleq	f83678 <_stack+0xf03678>
 a48:	00000803 	andeq	r0, r0, r3, lsl #16
 a4c:	49003505 	stmdbmi	r0, {r0, r2, r8, sl, ip, sp}
 a50:	06000013 			; <UNDEFINED> instruction: 0x06000013
 a54:	13490026 	movtne	r0, #36902	; 0x9026
 a58:	13070000 	movwne	r0, #28672	; 0x7000
 a5c:	3a0b0b01 	bcc	2c3668 <_stack+0x243668>
 a60:	010b3b0b 	tsteq	fp, fp, lsl #22
 a64:	08000013 	stmdaeq	r0, {r0, r1, r4}
 a68:	0e03000d 	cdpeq	0, 0, cr0, cr3, cr13, {0}
 a6c:	0b3b0b3a 	bleq	ec375c <_stack+0xe4375c>
 a70:	0b381349 	bleq	e0579c <_stack+0xd8579c>
 a74:	0d090000 	stceq	0, cr0, [r9, #-0]
 a78:	3a080300 	bcc	201680 <_stack+0x181680>
 a7c:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 a80:	000b3813 	andeq	r3, fp, r3, lsl r8
 a84:	012e0a00 			; <UNDEFINED> instruction: 0x012e0a00
 a88:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
 a8c:	0b3b0b3a 	bleq	ec377c <_stack+0xe4377c>
 a90:	01111927 	tsteq	r1, r7, lsr #18
 a94:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 a98:	01194296 			; <UNDEFINED> instruction: 0x01194296
 a9c:	0b000013 	bleq	af0 <CPSR_IRQ_INHIBIT+0xa70>
 aa0:	0e030005 	cdpeq	0, 0, cr0, cr3, cr5, {0}
 aa4:	0b3b0b3a 	bleq	ec3794 <_stack+0xe43794>
 aa8:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 aac:	0b0c0000 	bleq	300ab4 <_stack+0x280ab4>
 ab0:	12011101 	andne	r1, r1, #1073741824	; 0x40000000
 ab4:	00130106 	andseq	r0, r3, r6, lsl #2
 ab8:	00340d00 	eorseq	r0, r4, r0, lsl #26
 abc:	0b3a0e03 	bleq	e842d0 <_stack+0xe042d0>
 ac0:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 ac4:	00001802 	andeq	r1, r0, r2, lsl #16
 ac8:	11010b0e 	tstne	r1, lr, lsl #22
 acc:	00061201 	andeq	r1, r6, r1, lsl #4
 ad0:	000f0f00 	andeq	r0, pc, r0, lsl #30
 ad4:	13490b0b 	movtne	r0, #39691	; 0x9b0b
 ad8:	01000000 	mrseq	r0, (UNDEF: 0)
 adc:	0e250111 	mcreq	1, 1, r0, cr5, cr1, {0}
 ae0:	0e030b13 	vmoveq.32	d3[0], r0
 ae4:	06120111 			; <UNDEFINED> instruction: 0x06120111
 ae8:	00001710 	andeq	r1, r0, r0, lsl r7
 aec:	0b002402 	bleq	9afc <__bss_end__+0x5b4>
 af0:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 af4:	0300000e 	movweq	r0, #14
 af8:	0b0b0024 	bleq	2c0b90 <_stack+0x240b90>
 afc:	08030b3e 	stmdaeq	r3, {r1, r2, r3, r4, r5, r8, r9, fp}
 b00:	13040000 	movwne	r0, #16384	; 0x4000
 b04:	3a0b0b01 	bcc	2c3710 <_stack+0x243710>
 b08:	010b3b0b 	tsteq	fp, fp, lsl #22
 b0c:	05000013 	streq	r0, [r0, #-19]	; 0xffffffed
 b10:	0e03000d 	cdpeq	0, 0, cr0, cr3, cr13, {0}
 b14:	0b3b0b3a 	bleq	ec3804 <_stack+0xe43804>
 b18:	0b381349 	bleq	e05844 <_stack+0xd85844>
 b1c:	01060000 	mrseq	r0, (UNDEF: 6)
 b20:	01134901 	tsteq	r3, r1, lsl #18
 b24:	07000013 	smladeq	r0, r3, r0, r0
 b28:	13490021 	movtne	r0, #36897	; 0x9021
 b2c:	00000b2f 	andeq	r0, r0, pc, lsr #22
 b30:	49002608 	stmdbmi	r0, {r3, r9, sl, sp}
 b34:	09000013 	stmdbeq	r0, {r0, r1, r4}
 b38:	0e030016 	mcreq	0, 0, r0, cr3, cr6, {0}
 b3c:	0b3b0b3a 	bleq	ec382c <_stack+0xe4382c>
 b40:	00001349 	andeq	r1, r0, r9, asr #6
 b44:	3f012e0a 	svccc	0x00012e0a
 b48:	3a0e0319 	bcc	3817b4 <_stack+0x3017b4>
 b4c:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 b50:	11134919 	tstne	r3, r9, lsl r9
 b54:	40061201 	andmi	r1, r6, r1, lsl #4
 b58:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 b5c:	00001301 	andeq	r1, r0, r1, lsl #6
 b60:	0300050b 	movweq	r0, #1291	; 0x50b
 b64:	3b0b3a08 	blcc	2cf38c <_stack+0x24f38c>
 b68:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 b6c:	0c000018 	stceq	0, cr0, [r0], {24}
 b70:	0e030005 	cdpeq	0, 0, cr0, cr3, cr5, {0}
 b74:	0b3b0b3a 	bleq	ec3864 <_stack+0xe43864>
 b78:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 b7c:	340d0000 	strcc	r0, [sp], #-0
 b80:	3a080300 	bcc	201788 <_stack+0x181788>
 b84:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 b88:	00180213 	andseq	r0, r8, r3, lsl r2
 b8c:	000f0e00 	andeq	r0, pc, r0, lsl #28
 b90:	13490b0b 	movtne	r0, #39691	; 0x9b0b
 b94:	260f0000 	strcs	r0, [pc], -r0
 b98:	10000000 	andne	r0, r0, r0
 b9c:	0b0b000f 	bleq	2c0be0 <_stack+0x240be0>
 ba0:	2e110000 	cdpcs	0, 1, cr0, cr1, cr0, {0}
 ba4:	03193f01 	tsteq	r9, #1, 30
 ba8:	3b0b3a0e 	blcc	2cf3e8 <_stack+0x24f3e8>
 bac:	1119270b 	tstne	r9, fp, lsl #14
 bb0:	40061201 	andmi	r1, r6, r1, lsl #4
 bb4:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 bb8:	01000000 	mrseq	r0, (UNDEF: 0)
 bbc:	0e250111 	mcreq	1, 1, r0, cr5, cr1, {0}
 bc0:	0e030b13 	vmoveq.32	d3[0], r0
 bc4:	06120111 			; <UNDEFINED> instruction: 0x06120111
 bc8:	00001710 	andeq	r1, r0, r0, lsl r7
 bcc:	0b002402 	bleq	9bdc <__bss_end__+0x694>
 bd0:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 bd4:	0300000e 	movweq	r0, #14
 bd8:	0b0b0024 	bleq	2c0c70 <_stack+0x240c70>
 bdc:	08030b3e 	stmdaeq	r3, {r1, r2, r3, r4, r5, r8, r9, fp}
 be0:	2e040000 	cdpcs	0, 0, cr0, cr4, cr0, {0}
 be4:	03193f01 	tsteq	r9, #1, 30
 be8:	3b0b3a0e 	blcc	2cf428 <_stack+0x24f428>
 bec:	1119270b 	tstne	r9, fp, lsl #14
 bf0:	40061201 	andmi	r1, r6, r1, lsl #4
 bf4:	19429618 	stmdbne	r2, {r3, r4, r9, sl, ip, pc}^
 bf8:	00001301 	andeq	r1, r0, r1, lsl #6
 bfc:	03000505 	movweq	r0, #1285	; 0x505
 c00:	3b0b3a0e 	blcc	2cf440 <_stack+0x24f440>
 c04:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 c08:	06000018 			; <UNDEFINED> instruction: 0x06000018
 c0c:	0b0b000f 	bleq	2c0c50 <_stack+0x240c50>
 c10:	00001349 	andeq	r1, r0, r9, asr #6
 c14:	3f012e07 	svccc	0x00012e07
 c18:	3a0e0319 	bcc	381884 <_stack+0x301884>
 c1c:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 c20:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 c24:	97184006 	ldrls	r4, [r8, -r6]
 c28:	00001942 	andeq	r1, r0, r2, asr #18
 c2c:	03000508 	movweq	r0, #1288	; 0x508
 c30:	3b0b3a08 	blcc	2cf458 <_stack+0x24f458>
 c34:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 c38:	00000018 	andeq	r0, r0, r8, lsl r0
 c3c:	10001101 	andne	r1, r0, r1, lsl #2
 c40:	12011106 	andne	r1, r1, #-2147483647	; 0x80000001
 c44:	1b080301 	blne	201850 <_stack+0x181850>
 c48:	13082508 	movwne	r2, #34056	; 0x8508
 c4c:	00000005 	andeq	r0, r0, r5
 c50:	10001101 	andne	r1, r0, r1, lsl #2
 c54:	12011106 	andne	r1, r1, #-2147483647	; 0x80000001
 c58:	1b080301 	blne	201864 <_stack+0x181864>
 c5c:	13082508 	movwne	r2, #34056	; 0x8508
 c60:	00000005 	andeq	r0, r0, r5
 c64:	10001101 	andne	r1, r0, r1, lsl #2
 c68:	12011106 	andne	r1, r1, #-2147483647	; 0x80000001
 c6c:	1b080301 	blne	201878 <_stack+0x181878>
 c70:	13082508 	movwne	r2, #34056	; 0x8508
 c74:	00000005 	andeq	r0, r0, r5

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
  68:	00000071 	andeq	r0, r0, r1, ror r0
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
  c0:	08f3676b 	ldmeq	r3!, {r0, r1, r3, r5, r6, r8, r9, sl, sp, lr}^
  c4:	0030683e 	eorseq	r6, r0, lr, lsr r8
  c8:	67010402 	strvs	r0, [r1, -r2, lsl #8]
  cc:	08f3676a 	ldmeq	r3!, {r1, r3, r5, r6, r8, r9, sl, sp, lr}^
  d0:	0031683e 	eorseq	r6, r1, lr, lsr r8
  d4:	67010402 	strvs	r0, [r1, -r2, lsl #8]
  d8:	01000602 	tsteq	r0, r2, lsl #12
  dc:	00011901 	andeq	r1, r1, r1, lsl #18
  e0:	e0000200 	and	r0, r0, r0, lsl #4
  e4:	02000000 	andeq	r0, r0, #0
  e8:	0d0efb01 	vstreq	d15, [lr, #-4]
  ec:	01010100 	mrseq	r0, (UNDEF: 17)
  f0:	00000001 	andeq	r0, r0, r1
  f4:	01000001 	tsteq	r0, r1
  f8:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; 44 <CPSR_FIQ_INHIBIT+0x4>
  fc:	62612f65 	rsbvs	r2, r1, #404	; 0x194
 100:	616b6964 	cmnvs	fp, r4, ror #18
 104:	2f6d6972 	svccs	0x006d6972
 108:	2f766564 	svccs	0x00766564
 10c:	694c794d 	stmdbvs	ip, {r0, r2, r3, r6, r8, fp, ip, sp, lr}^
 110:	656c7474 	strbvs	r7, [ip, #-1140]!	; 0xfffffb8c
 114:	732f534f 			; <UNDEFINED> instruction: 0x732f534f
 118:	2f006372 	svccs	0x00006372
 11c:	2f727375 	svccs	0x00727375
 120:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 124:	2f656475 	svccs	0x00656475
 128:	6c77656e 	cfldr64vs	mvdx6, [r7], #-440	; 0xfffffe48
 12c:	6d2f6269 	sfmvs	f6, 4, [pc, #-420]!	; ffffff90 <CPSR_UNAFFECTED_BITS+0x90>
 130:	69686361 	stmdbvs	r8!, {r0, r5, r6, r8, r9, sp, lr}^
 134:	2f00656e 	svccs	0x0000656e
 138:	2f727375 	svccs	0x00727375
 13c:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 140:	2f656475 	svccs	0x00656475
 144:	6c77656e 	cfldr64vs	mvdx6, [r7], #-440	; 0xfffffe48
 148:	732f6269 			; <UNDEFINED> instruction: 0x732f6269
 14c:	2f007379 	svccs	0x00007379
 150:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
 154:	6462612f 	strbtvs	r6, [r2], #-303	; 0xfffffed1
 158:	72616b69 	rsbvc	r6, r1, #107520	; 0x1a400
 15c:	642f6d69 	strtvs	r6, [pc], #-3433	; 164 <CPSR_IRQ_INHIBIT+0xe4>
 160:	4d2f7665 	stcmi	6, cr7, [pc, #-404]!	; ffffffd4 <CPSR_UNAFFECTED_BITS+0xd4>
 164:	74694c79 	strbtvc	r4, [r9], #-3193	; 0xfffff387
 168:	4f656c74 	svcmi	0x00656c74
 16c:	72732f53 	rsbsvc	r2, r3, #332	; 0x14c
 170:	2e2e2f63 	cdpcs	15, 2, cr2, cr14, cr3, {3}
 174:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 178:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0xfffffa94
 17c:	656b0000 	strbvs	r0, [fp, #-0]!
 180:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 184:	0100632e 	tsteq	r0, lr, lsr #6
 188:	645f0000 	ldrbvs	r0, [pc], #-0	; 190 <CPSR_IRQ_INHIBIT+0x110>
 18c:	75616665 	strbvc	r6, [r1, #-1637]!	; 0xfffff99b
 190:	745f746c 	ldrbvc	r7, [pc], #-1132	; 198 <CPSR_IRQ_INHIBIT+0x118>
 194:	73657079 	cmnvc	r5, #121	; 0x79
 198:	0200682e 	andeq	r6, r0, #3014656	; 0x2e0000
 19c:	735f0000 	cmpvc	pc, #0
 1a0:	6e696474 	mcrvs	4, 3, r6, cr9, cr4, {3}
 1a4:	00682e74 	rsbeq	r2, r8, r4, ror lr
 1a8:	72000003 	andvc	r0, r0, #3
 1ac:	622d6970 	eorvs	r6, sp, #112, 18	; 0x1c0000
 1b0:	2e657361 	cdpcs	3, 6, cr7, cr5, cr1, {3}
 1b4:	00040068 	andeq	r0, r4, r8, rrx
 1b8:	6f727000 	svcvs	0x00727000
 1bc:	73736563 	cmnvc	r3, #415236096	; 0x18c00000
 1c0:	0400682e 	streq	r6, [r0], #-2094	; 0xfffff7d2
 1c4:	00000000 	andeq	r0, r0, r0
 1c8:	820c0205 	andhi	r0, ip, #1342177280	; 0x50000000
 1cc:	0f030000 	svceq	0x00030000
 1d0:	02008301 	andeq	r8, r0, #67108864	; 0x4000000
 1d4:	364b0104 	strbcc	r0, [fp], -r4, lsl #2
 1d8:	9e1703be 	mrcls	3, 0, r0, cr7, cr14, {5}
 1dc:	d7750836 			; <UNDEFINED> instruction: 0xd7750836
 1e0:	4c673f08 	stclmi	15, cr3, [r7], #-32	; 0xffffffe0
 1e4:	676a6868 	strbvs	r6, [sl, -r8, ror #16]!
 1e8:	3d08684c 	stccc	8, cr6, [r8, #-304]	; 0xfffffed0
 1ec:	674d6768 	strbvs	r6, [sp, -r8, ror #14]
 1f0:	01040200 	mrseq	r0, R12_usr
 1f4:	000c024e 	andeq	r0, ip, lr, asr #4
 1f8:	01100101 	tsteq	r0, r1, lsl #2
 1fc:	00020000 	andeq	r0, r2, r0
 200:	000000d1 	ldrdeq	r0, [r0], -r1
 204:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 208:	0101000d 	tsteq	r1, sp
 20c:	00000101 	andeq	r0, r0, r1, lsl #2
 210:	00000100 	andeq	r0, r0, r0, lsl #2
 214:	6f682f01 	svcvs	0x00682f01
 218:	612f656d 			; <UNDEFINED> instruction: 0x612f656d
 21c:	6b696462 	blvs	1a593ac <_stack+0x19d93ac>
 220:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
 224:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
 228:	4c794d2f 	ldclmi	13, cr4, [r9], #-188	; 0xffffff44
 22c:	6c747469 	cfldrdvs	mvd7, [r4], #-420	; 0xfffffe5c
 230:	2f534f65 	svccs	0x00534f65
 234:	00637273 	rsbeq	r7, r3, r3, ror r2
 238:	7273752f 	rsbsvc	r7, r3, #197132288	; 0xbc00000
 23c:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 240:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0xfffffa94
 244:	77656e2f 	strbvc	r6, [r5, -pc, lsr #28]!
 248:	2f62696c 	svccs	0x0062696c
 24c:	6863616d 	stmdavs	r3!, {r0, r2, r3, r5, r6, r8, sp, lr}^
 250:	00656e69 	rsbeq	r6, r5, r9, ror #28
 254:	7273752f 	rsbsvc	r7, r3, #197132288	; 0xbc00000
 258:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 25c:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0xfffffa94
 260:	77656e2f 	strbvc	r6, [r5, -pc, lsr #28]!
 264:	2f62696c 	svccs	0x0062696c
 268:	00737973 	rsbseq	r7, r3, r3, ror r9
 26c:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; 1b8 <CPSR_IRQ_INHIBIT+0x138>
 270:	62612f65 	rsbvs	r2, r1, #404	; 0x194
 274:	616b6964 	cmnvs	fp, r4, ror #18
 278:	2f6d6972 	svccs	0x006d6972
 27c:	2f766564 	svccs	0x00766564
 280:	694c794d 	stmdbvs	ip, {r0, r2, r3, r6, r8, fp, ip, sp, lr}^
 284:	656c7474 	strbvs	r7, [ip, #-1140]!	; 0xfffffb8c
 288:	732f534f 			; <UNDEFINED> instruction: 0x732f534f
 28c:	2e2f6372 	mcrcs	3, 1, r6, cr15, cr2, {3}
 290:	6e692f2e 	cdpvs	15, 6, cr2, cr9, cr14, {1}
 294:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xfffff39d
 298:	6d000065 	stcvs	0, cr0, [r0, #-404]	; 0xfffffe6c
 29c:	6f6c6c61 	svcvs	0x006c6c61
 2a0:	00632e63 	rsbeq	r2, r3, r3, ror #28
 2a4:	5f000001 	svcpl	0x00000001
 2a8:	61666564 	cmnvs	r6, r4, ror #10
 2ac:	5f746c75 	svcpl	0x00746c75
 2b0:	65707974 	ldrbvs	r7, [r0, #-2420]!	; 0xfffff68c
 2b4:	00682e73 	rsbeq	r2, r8, r3, ror lr
 2b8:	5f000002 	svcpl	0x00000002
 2bc:	69647473 	stmdbvs	r4!, {r0, r1, r4, r5, r6, sl, ip, sp, lr}^
 2c0:	682e746e 	stmdavs	lr!, {r1, r2, r3, r5, r6, sl, ip, sp, lr}
 2c4:	00000300 	andeq	r0, r0, r0, lsl #6
 2c8:	6c6c616d 	stfvse	f6, [ip], #-436	; 0xfffffe4c
 2cc:	682e636f 	stmdavs	lr!, {r0, r1, r2, r3, r5, r6, r8, r9, sp, lr}
 2d0:	00000400 	andeq	r0, r0, r0, lsl #8
 2d4:	02050000 	andeq	r0, r5, #0
 2d8:	00008398 	muleq	r0, r8, r3
 2dc:	86010b03 	strhi	r0, [r1], -r3, lsl #22
 2e0:	a0684c67 	rsbge	r4, r8, r7, ror #24
 2e4:	04020067 	streq	r0, [r2], #-103	; 0xffffff99
 2e8:	02002902 	andeq	r2, r0, #32768	; 0x8000
 2ec:	66060104 	strvs	r0, [r6], -r4, lsl #2
 2f0:	82090306 	andhi	r0, r9, #402653184	; 0x18000000
 2f4:	04020068 	streq	r0, [r2], #-104	; 0xffffff98
 2f8:	06820601 	streq	r0, [r2], r1, lsl #12
 2fc:	6768a068 	strbvs	sl, [r8, -r8, rrx]!
 300:	4c9fa084 	ldcmi	0, cr10, [pc], {132}	; 0x84
 304:	67696769 	strbvs	r6, [r9, -r9, ror #14]!
 308:	0010024b 	andseq	r0, r0, fp, asr #4
 30c:	018e0101 	orreq	r0, lr, r1, lsl #2
 310:	00020000 	andeq	r0, r2, r0
 314:	00000126 	andeq	r0, r0, r6, lsr #2
 318:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 31c:	0101000d 	tsteq	r1, sp
 320:	00000101 	andeq	r0, r0, r1, lsl #2
 324:	00000100 	andeq	r0, r0, r0, lsl #2
 328:	6f682f01 	svcvs	0x00682f01
 32c:	612f656d 			; <UNDEFINED> instruction: 0x612f656d
 330:	6b696462 	blvs	1a594c0 <_stack+0x19d94c0>
 334:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
 338:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
 33c:	4c794d2f 	ldclmi	13, cr4, [r9], #-188	; 0xffffff44
 340:	6c747469 	cfldrdvs	mvd7, [r4], #-420	; 0xfffffe5c
 344:	2f534f65 	svccs	0x00534f65
 348:	00637273 	rsbeq	r7, r3, r3, ror r2
 34c:	7273752f 	rsbsvc	r7, r3, #197132288	; 0xbc00000
 350:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 354:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0xfffffa94
 358:	77656e2f 	strbvc	r6, [r5, -pc, lsr #28]!
 35c:	2f62696c 	svccs	0x0062696c
 360:	6863616d 	stmdavs	r3!, {r0, r2, r3, r5, r6, r8, sp, lr}^
 364:	00656e69 	rsbeq	r6, r5, r9, ror #28
 368:	7273752f 	rsbsvc	r7, r3, #197132288	; 0xbc00000
 36c:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 370:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0xfffffa94
 374:	77656e2f 	strbvc	r6, [r5, -pc, lsr #28]!
 378:	2f62696c 	svccs	0x0062696c
 37c:	00737973 	rsbseq	r7, r3, r3, ror r9
 380:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; 2cc <CPSR_IRQ_INHIBIT+0x24c>
 384:	62612f65 	rsbvs	r2, r1, #404	; 0x194
 388:	616b6964 	cmnvs	fp, r4, ror #18
 38c:	2f6d6972 	svccs	0x006d6972
 390:	2f766564 	svccs	0x00766564
 394:	694c794d 	stmdbvs	ip, {r0, r2, r3, r6, r8, fp, ip, sp, lr}^
 398:	656c7474 	strbvs	r7, [ip, #-1140]!	; 0xfffffb8c
 39c:	732f534f 			; <UNDEFINED> instruction: 0x732f534f
 3a0:	2e2f6372 	mcrcs	3, 1, r6, cr15, cr2, {3}
 3a4:	6e692f2e 	cdpvs	15, 6, cr2, cr9, cr14, {1}
 3a8:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xfffff39d
 3ac:	2e2e2f65 	cdpcs	15, 2, cr2, cr14, cr5, {3}
 3b0:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 3b4:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0xfffffa94
 3b8:	6f682f00 	svcvs	0x00682f00
 3bc:	612f656d 			; <UNDEFINED> instruction: 0x612f656d
 3c0:	6b696462 	blvs	1a59550 <_stack+0x19d9550>
 3c4:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
 3c8:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
 3cc:	4c794d2f 	ldclmi	13, cr4, [r9], #-188	; 0xffffff44
 3d0:	6c747469 	cfldrdvs	mvd7, [r4], #-420	; 0xfffffe5c
 3d4:	2f534f65 	svccs	0x00534f65
 3d8:	2f637273 	svccs	0x00637273
 3dc:	692f2e2e 	stmdbvs	pc!, {r1, r2, r3, r5, r9, sl, fp, sp}	; <UNPREDICTABLE>
 3e0:	756c636e 	strbvc	r6, [ip, #-878]!	; 0xfffffc92
 3e4:	00006564 	andeq	r6, r0, r4, ror #10
 3e8:	636f7270 	cmnvs	pc, #112, 4
 3ec:	2e737365 	cdpcs	3, 7, cr7, cr3, cr5, {3}
 3f0:	00010063 	andeq	r0, r1, r3, rrx
 3f4:	65645f00 	strbvs	r5, [r4, #-3840]!	; 0xfffff100
 3f8:	6c756166 	ldfvse	f6, [r5], #-408	; 0xfffffe68
 3fc:	79745f74 	ldmdbvc	r4!, {r2, r4, r5, r6, r8, r9, sl, fp, ip, lr}^
 400:	2e736570 	mrccs	5, 3, r6, cr3, cr0, {3}
 404:	00020068 	andeq	r0, r2, r8, rrx
 408:	74735f00 	ldrbtvc	r5, [r3], #-3840	; 0xfffff100
 40c:	746e6964 	strbtvc	r6, [lr], #-2404	; 0xfffff69c
 410:	0300682e 	movweq	r6, #2094	; 0x82e
 414:	70720000 	rsbsvc	r0, r2, r0
 418:	61622d69 	cmnvs	r2, r9, ror #26
 41c:	682e6573 	stmdavs	lr!, {r0, r1, r4, r5, r6, r8, sl, sp, lr}
 420:	00000400 	andeq	r0, r0, r0, lsl #8
 424:	636f7270 	cmnvs	pc, #112, 4
 428:	2e737365 	cdpcs	3, 7, cr7, cr3, cr5, {3}
 42c:	00050068 	andeq	r0, r5, r8, rrx
 430:	6c616d00 	stclvs	13, cr6, [r1], #-0
 434:	2e636f6c 	cdpcs	15, 6, cr6, cr3, cr12, {3}
 438:	00050068 	andeq	r0, r5, r8, rrx
 43c:	05000000 	streq	r0, [r0, #-0]
 440:	0084f402 	addeq	pc, r4, r2, lsl #8
 444:	010b0300 	mrseq	r0, (UNDEF: 59)
 448:	020068a0 	andeq	r6, r0, #160, 16	; 0xa00000
 44c:	00680304 	rsbeq	r0, r8, r4, lsl #6
 450:	b8030402 	stmdalt	r3, {r1, sl}
 454:	01040200 	mrseq	r0, R12_usr
 458:	6b066606 	blvs	199c78 <_stack+0x119c78>
 45c:	6967bb67 	stmdbvs	r7!, {r0, r1, r2, r5, r6, r8, r9, fp, ip, sp, pc}^
 460:	4ba16783 	blmi	fe85a274 <CPSR_UNAFFECTED_BITS+0xfe85a374>
 464:	4c68a14b 	stfmip	f2, [r8], #-300	; 0xfffffed4
 468:	04020068 	streq	r0, [r2], #-104	; 0xffffff98
 46c:	02008602 	andeq	r8, r0, #2097152	; 0x200000
 470:	7a030204 	bvc	c0c88 <_stack+0x40c88>
 474:	04020066 	streq	r0, [r2], #-102	; 0xffffff9a
 478:	06660601 	strbteq	r0, [r6], -r1, lsl #12
 47c:	a12f3286 	smlawbge	pc, r6, r2, r3	; <UNPREDICTABLE>
 480:	00684c69 	rsbeq	r4, r8, r9, ror #24
 484:	86020402 	strhi	r0, [r2], -r2, lsl #8
 488:	02040200 	andeq	r0, r4, #0, 4
 48c:	00667a03 	rsbeq	r7, r6, r3, lsl #20
 490:	06010402 	streq	r0, [r1], -r2, lsl #8
 494:	33860666 	orrcc	r0, r6, #106954752	; 0x6600000
 498:	022f4c67 	eoreq	r4, pc, #26368	; 0x6700
 49c:	0101000a 	tsteq	r1, sl
 4a0:	000000f6 	strdeq	r0, [r0], -r6
 4a4:	00dd0002 	sbcseq	r0, sp, r2
 4a8:	01020000 	mrseq	r0, (UNDEF: 2)
 4ac:	000d0efb 	strdeq	r0, [sp], -fp
 4b0:	01010101 	tsteq	r1, r1, lsl #2
 4b4:	01000000 	mrseq	r0, (UNDEF: 0)
 4b8:	2f010000 	svccs	0x00010000
 4bc:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
 4c0:	6462612f 	strbtvs	r6, [r2], #-303	; 0xfffffed1
 4c4:	72616b69 	rsbvc	r6, r1, #107520	; 0x1a400
 4c8:	642f6d69 	strtvs	r6, [pc], #-3433	; 4d0 <CPSR_IRQ_INHIBIT+0x450>
 4cc:	4d2f7665 	stcmi	6, cr7, [pc, #-404]!	; 340 <CPSR_IRQ_INHIBIT+0x2c0>
 4d0:	74694c79 	strbtvc	r4, [r9], #-3193	; 0xfffff387
 4d4:	4f656c74 	svcmi	0x00656c74
 4d8:	72732f53 	rsbsvc	r2, r3, #332	; 0x14c
 4dc:	752f0063 	strvc	r0, [pc, #-99]!	; 481 <CPSR_IRQ_INHIBIT+0x401>
 4e0:	692f7273 	stmdbvs	pc!, {r0, r1, r4, r5, r6, r9, ip, sp, lr}	; <UNPREDICTABLE>
 4e4:	756c636e 	strbvc	r6, [ip, #-878]!	; 0xfffffc92
 4e8:	6e2f6564 	cfsh64vs	mvdx6, mvdx15, #52
 4ec:	696c7765 	stmdbvs	ip!, {r0, r2, r5, r6, r8, r9, sl, ip, sp, lr}^
 4f0:	616d2f62 	cmnvs	sp, r2, ror #30
 4f4:	6e696863 	cdpvs	8, 6, cr6, cr9, cr3, {3}
 4f8:	752f0065 	strvc	r0, [pc, #-101]!	; 49b <CPSR_IRQ_INHIBIT+0x41b>
 4fc:	692f7273 	stmdbvs	pc!, {r0, r1, r4, r5, r6, r9, ip, sp, lr}	; <UNPREDICTABLE>
 500:	756c636e 	strbvc	r6, [ip, #-878]!	; 0xfffffc92
 504:	6e2f6564 	cfsh64vs	mvdx6, mvdx15, #52
 508:	696c7765 	stmdbvs	ip!, {r0, r2, r5, r6, r8, r9, sl, ip, sp, lr}^
 50c:	79732f62 	ldmdbvc	r3!, {r1, r5, r6, r8, r9, sl, fp, sp}^
 510:	682f0073 	stmdavs	pc!, {r0, r1, r4, r5, r6}	; <UNPREDICTABLE>
 514:	2f656d6f 	svccs	0x00656d6f
 518:	69646261 	stmdbvs	r4!, {r0, r5, r6, r9, sp, lr}^
 51c:	6972616b 	ldmdbvs	r2!, {r0, r1, r3, r5, r6, r8, sp, lr}^
 520:	65642f6d 	strbvs	r2, [r4, #-3949]!	; 0xfffff093
 524:	794d2f76 	stmdbvc	sp, {r1, r2, r4, r5, r6, r8, r9, sl, fp, sp}^
 528:	7474694c 	ldrbtvc	r6, [r4], #-2380	; 0xfffff6b4
 52c:	534f656c 	movtpl	r6, #62828	; 0xf56c
 530:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 534:	2f2e2e2f 	svccs	0x002e2e2f
 538:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 53c:	00656475 	rsbeq	r6, r5, r5, ror r4
 540:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
 544:	6d72612d 	ldfvse	f6, [r2, #-180]!	; 0xffffff4c
 548:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0xfffff68c
 54c:	00632e72 	rsbeq	r2, r3, r2, ror lr
 550:	5f000001 	svcpl	0x00000001
 554:	61666564 	cmnvs	r6, r4, ror #10
 558:	5f746c75 	svcpl	0x00746c75
 55c:	65707974 	ldrbvs	r7, [r0, #-2420]!	; 0xfffff68c
 560:	00682e73 	rsbeq	r2, r8, r3, ror lr
 564:	5f000002 	svcpl	0x00000002
 568:	69647473 	stmdbvs	r4!, {r0, r1, r4, r5, r6, sl, ip, sp, lr}^
 56c:	682e746e 	stmdavs	lr!, {r1, r2, r3, r5, r6, sl, ip, sp, lr}
 570:	00000300 	andeq	r0, r0, r0, lsl #6
 574:	2d697072 	stclcs	0, cr7, [r9, #-456]!	; 0xfffffe38
 578:	746d7261 	strbtvc	r7, [sp], #-609	; 0xfffffd9f
 57c:	72656d69 	rsbvc	r6, r5, #6720	; 0x1a40
 580:	0400682e 	streq	r6, [r0], #-2094	; 0xfffff7d2
 584:	00000000 	andeq	r0, r0, r0
 588:	86dc0205 	ldrbhi	r0, [ip], r5, lsl #4
 58c:	10030000 	andne	r0, r3, r0
 590:	a14b4b01 	cmpge	fp, r1, lsl #22
 594:	0008024c 	andeq	r0, r8, ip, asr #4
 598:	01080101 	tsteq	r8, r1, lsl #2
 59c:	00020000 	andeq	r0, r2, r0
 5a0:	000000e3 	andeq	r0, r0, r3, ror #1
 5a4:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 5a8:	0101000d 	tsteq	r1, sp
 5ac:	00000101 	andeq	r0, r0, r1, lsl #2
 5b0:	00000100 	andeq	r0, r0, r0, lsl #2
 5b4:	6f682f01 	svcvs	0x00682f01
 5b8:	612f656d 			; <UNDEFINED> instruction: 0x612f656d
 5bc:	6b696462 	blvs	1a5974c <_stack+0x19d974c>
 5c0:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
 5c4:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
 5c8:	4c794d2f 	ldclmi	13, cr4, [r9], #-188	; 0xffffff44
 5cc:	6c747469 	cfldrdvs	mvd7, [r4], #-420	; 0xfffffe5c
 5d0:	2f534f65 	svccs	0x00534f65
 5d4:	00637273 	rsbeq	r7, r3, r3, ror r2
 5d8:	7273752f 	rsbsvc	r7, r3, #197132288	; 0xbc00000
 5dc:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 5e0:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0xfffffa94
 5e4:	77656e2f 	strbvc	r6, [r5, -pc, lsr #28]!
 5e8:	2f62696c 	svccs	0x0062696c
 5ec:	6863616d 	stmdavs	r3!, {r0, r2, r3, r5, r6, r8, sp, lr}^
 5f0:	00656e69 	rsbeq	r6, r5, r9, ror #28
 5f4:	7273752f 	rsbsvc	r7, r3, #197132288	; 0xbc00000
 5f8:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 5fc:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0xfffffa94
 600:	77656e2f 	strbvc	r6, [r5, -pc, lsr #28]!
 604:	2f62696c 	svccs	0x0062696c
 608:	00737973 	rsbseq	r7, r3, r3, ror r9
 60c:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; 558 <CPSR_IRQ_INHIBIT+0x4d8>
 610:	62612f65 	rsbvs	r2, r1, #404	; 0x194
 614:	616b6964 	cmnvs	fp, r4, ror #18
 618:	2f6d6972 	svccs	0x006d6972
 61c:	2f766564 	svccs	0x00766564
 620:	694c794d 	stmdbvs	ip, {r0, r2, r3, r6, r8, fp, ip, sp, lr}^
 624:	656c7474 	strbvs	r7, [ip, #-1140]!	; 0xfffffb8c
 628:	732f534f 			; <UNDEFINED> instruction: 0x732f534f
 62c:	2e2f6372 	mcrcs	3, 1, r6, cr15, cr2, {3}
 630:	6e692f2e 	cdpvs	15, 6, cr2, cr9, cr14, {1}
 634:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xfffff39d
 638:	72000065 	andvc	r0, r0, #101	; 0x65
 63c:	672d6970 			; <UNDEFINED> instruction: 0x672d6970
 640:	2e6f6970 			; <UNDEFINED> instruction: 0x2e6f6970
 644:	00010063 	andeq	r0, r1, r3, rrx
 648:	65645f00 	strbvs	r5, [r4, #-3840]!	; 0xfffff100
 64c:	6c756166 	ldfvse	f6, [r5], #-408	; 0xfffffe68
 650:	79745f74 	ldmdbvc	r4!, {r2, r4, r5, r6, r8, r9, sl, fp, ip, lr}^
 654:	2e736570 	mrccs	5, 3, r6, cr3, cr0, {3}
 658:	00020068 	andeq	r0, r2, r8, rrx
 65c:	74735f00 	ldrbtvc	r5, [r3], #-3840	; 0xfffff100
 660:	746e6964 	strbtvc	r6, [lr], #-2404	; 0xfffff69c
 664:	0300682e 	movweq	r6, #2094	; 0x82e
 668:	70720000 	rsbsvc	r0, r2, r0
 66c:	61622d69 	cmnvs	r2, r9, ror #26
 670:	682e6573 	stmdavs	lr!, {r0, r1, r4, r5, r6, r8, sl, sp, lr}
 674:	00000400 	andeq	r0, r0, r0, lsl #8
 678:	2d697072 	stclcs	0, cr7, [r9, #-456]!	; 0xfffffe38
 67c:	6f697067 	svcvs	0x00697067
 680:	0400682e 	streq	r6, [r0], #-2094	; 0xfffff7d2
 684:	00000000 	andeq	r0, r0, r0
 688:	87180205 	ldrhi	r0, [r8, -r5, lsl #4]
 68c:	10030000 	andne	r0, r3, r0
 690:	a34b4b01 	movtge	r4, #47873	; 0xbb01
 694:	673d08f3 			; <UNDEFINED> instruction: 0x673d08f3
 698:	02132a02 	andseq	r2, r3, #8192	; 0x2000
 69c:	bd671328 	stcllt	3, cr1, [r7, #-160]!	; 0xffffff60
 6a0:	0008024c 	andeq	r0, r8, ip, asr #4
 6a4:	014f0101 	cmpeq	pc, r1, lsl #2
 6a8:	00020000 	andeq	r0, r2, r0
 6ac:	000000e1 	andeq	r0, r0, r1, ror #1
 6b0:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 6b4:	0101000d 	tsteq	r1, sp
 6b8:	00000101 	andeq	r0, r0, r1, lsl #2
 6bc:	00000100 	andeq	r0, r0, r0, lsl #2
 6c0:	6f682f01 	svcvs	0x00682f01
 6c4:	612f656d 			; <UNDEFINED> instruction: 0x612f656d
 6c8:	6b696462 	blvs	1a59858 <_stack+0x19d9858>
 6cc:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
 6d0:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
 6d4:	4c794d2f 	ldclmi	13, cr4, [r9], #-188	; 0xffffff44
 6d8:	6c747469 	cfldrdvs	mvd7, [r4], #-420	; 0xfffffe5c
 6dc:	2f534f65 	svccs	0x00534f65
 6e0:	00637273 	rsbeq	r7, r3, r3, ror r2
 6e4:	7273752f 	rsbsvc	r7, r3, #197132288	; 0xbc00000
 6e8:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 6ec:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0xfffffa94
 6f0:	77656e2f 	strbvc	r6, [r5, -pc, lsr #28]!
 6f4:	2f62696c 	svccs	0x0062696c
 6f8:	6863616d 	stmdavs	r3!, {r0, r2, r3, r5, r6, r8, sp, lr}^
 6fc:	00656e69 	rsbeq	r6, r5, r9, ror #28
 700:	7273752f 	rsbsvc	r7, r3, #197132288	; 0xbc00000
 704:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 708:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0xfffffa94
 70c:	77656e2f 	strbvc	r6, [r5, -pc, lsr #28]!
 710:	2f62696c 	svccs	0x0062696c
 714:	00737973 	rsbseq	r7, r3, r3, ror r9
 718:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; 664 <CPSR_IRQ_INHIBIT+0x5e4>
 71c:	62612f65 	rsbvs	r2, r1, #404	; 0x194
 720:	616b6964 	cmnvs	fp, r4, ror #18
 724:	2f6d6972 	svccs	0x006d6972
 728:	2f766564 	svccs	0x00766564
 72c:	694c794d 	stmdbvs	ip, {r0, r2, r3, r6, r8, fp, ip, sp, lr}^
 730:	656c7474 	strbvs	r7, [ip, #-1140]!	; 0xfffffb8c
 734:	732f534f 			; <UNDEFINED> instruction: 0x732f534f
 738:	2e2f6372 	mcrcs	3, 1, r6, cr15, cr2, {3}
 73c:	6e692f2e 	cdpvs	15, 6, cr2, cr9, cr14, {1}
 740:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xfffff39d
 744:	72000065 	andvc	r0, r0, #101	; 0x65
 748:	692d6970 	pushvs	{r4, r5, r6, r8, fp, sp, lr}
 74c:	7265746e 	rsbvc	r7, r5, #1845493760	; 0x6e000000
 750:	74707572 	ldrbtvc	r7, [r0], #-1394	; 0xfffffa8e
 754:	00632e73 	rsbeq	r2, r3, r3, ror lr
 758:	5f000001 	svcpl	0x00000001
 75c:	61666564 	cmnvs	r6, r4, ror #10
 760:	5f746c75 	svcpl	0x00746c75
 764:	65707974 	ldrbvs	r7, [r0, #-2420]!	; 0xfffff68c
 768:	00682e73 	rsbeq	r2, r8, r3, ror lr
 76c:	5f000002 	svcpl	0x00000002
 770:	69647473 	stmdbvs	r4!, {r0, r1, r4, r5, r6, sl, ip, sp, lr}^
 774:	682e746e 	stmdavs	lr!, {r1, r2, r3, r5, r6, sl, ip, sp, lr}
 778:	00000300 	andeq	r0, r0, r0, lsl #6
 77c:	2d697072 	stclcs	0, cr7, [r9, #-456]!	; 0xfffffe38
 780:	65746e69 	ldrbvs	r6, [r4, #-3689]!	; 0xfffff197
 784:	70757272 	rsbsvc	r7, r5, r2, ror r2
 788:	682e7374 	stmdavs	lr!, {r2, r4, r5, r6, r8, r9, ip, sp, lr}
 78c:	00000400 	andeq	r0, r0, r0, lsl #8
 790:	02050000 	andeq	r0, r5, #0
 794:	00008870 	andeq	r8, r0, r0, ror r8
 798:	4b011d03 	blmi	47bac <__bss_end__+0x3e664>
 79c:	9e0b034b 	cdpls	3, 0, cr0, cr11, cr11, {2}
 7a0:	04020083 	streq	r0, [r2], #-131	; 0xffffff7d
 7a4:	02004e01 	andeq	r4, r0, #1, 28
 7a8:	00830104 	addeq	r0, r3, r4, lsl #2
 7ac:	65010402 	strvs	r0, [r1, #-1026]	; 0xfffffbfe
 7b0:	672e0c03 	strvs	r0, [lr, -r3, lsl #24]!
 7b4:	0402004b 	streq	r0, [r2], #-75	; 0xffffffb5
 7b8:	0b036901 	bleq	dabc4 <_stack+0x5abc4>
 7bc:	004b679e 	umaaleq	r6, fp, lr, r7
 7c0:	69010402 	stmdbvs	r1, {r1, sl}
 7c4:	839e0c03 	orrshi	r0, lr, #768	; 0x300
 7c8:	0402004b 	streq	r0, [r2], #-75	; 0xffffffb5
 7cc:	0c036901 			; <UNDEFINED> instruction: 0x0c036901
 7d0:	004b839e 	umaaleq	r8, fp, lr, r3
 7d4:	69010402 	stmdbvs	r1, {r1, sl}
 7d8:	6b9e0d03 	blvs	fe783bec <CPSR_UNAFFECTED_BITS+0xfe783cec>
 7dc:	84bda1a1 	ldrthi	sl, [sp], #417	; 0x1a1
 7e0:	85a1a26c 	strhi	sl, [r1, #620]!	; 0x26c
 7e4:	2e038384 	cdpcs	3, 0, cr8, cr3, cr4, {4}
 7e8:	2e560366 	cdpcs	3, 5, cr0, cr6, cr6, {3}
 7ec:	66290383 	strtvs	r0, [r9], -r3, lsl #7
 7f0:	30ba1c03 	adcscc	r1, sl, r3, lsl #24
 7f4:	01000602 	tsteq	r0, r2, lsl #12
 7f8:	0000ff01 	andeq	pc, r0, r1, lsl #30
 7fc:	dd000200 	sfmle	f0, 4, [r0, #-0]
 800:	02000000 	andeq	r0, r0, #0
 804:	0d0efb01 	vstreq	d15, [lr, #-4]
 808:	01010100 	mrseq	r0, (UNDEF: 17)
 80c:	00000001 	andeq	r0, r0, r1
 810:	01000001 	tsteq	r0, r1
 814:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; 760 <CPSR_IRQ_INHIBIT+0x6e0>
 818:	62612f65 	rsbvs	r2, r1, #404	; 0x194
 81c:	616b6964 	cmnvs	fp, r4, ror #18
 820:	2f6d6972 	svccs	0x006d6972
 824:	2f766564 	svccs	0x00766564
 828:	694c794d 	stmdbvs	ip, {r0, r2, r3, r6, r8, fp, ip, sp, lr}^
 82c:	656c7474 	strbvs	r7, [ip, #-1140]!	; 0xfffffb8c
 830:	732f534f 			; <UNDEFINED> instruction: 0x732f534f
 834:	2f006372 	svccs	0x00006372
 838:	2f727375 	svccs	0x00727375
 83c:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 840:	2f656475 	svccs	0x00656475
 844:	6c77656e 	cfldr64vs	mvdx6, [r7], #-440	; 0xfffffe48
 848:	6d2f6269 	sfmvs	f6, 4, [pc, #-420]!	; 6ac <CPSR_IRQ_INHIBIT+0x62c>
 84c:	69686361 	stmdbvs	r8!, {r0, r5, r6, r8, r9, sp, lr}^
 850:	2f00656e 	svccs	0x0000656e
 854:	2f727375 	svccs	0x00727375
 858:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 85c:	2f656475 	svccs	0x00656475
 860:	6c77656e 	cfldr64vs	mvdx6, [r7], #-440	; 0xfffffe48
 864:	732f6269 			; <UNDEFINED> instruction: 0x732f6269
 868:	2f007379 	svccs	0x00007379
 86c:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
 870:	6462612f 	strbtvs	r6, [r2], #-303	; 0xfffffed1
 874:	72616b69 	rsbvc	r6, r1, #107520	; 0x1a400
 878:	642f6d69 	strtvs	r6, [pc], #-3433	; 880 <CPSR_IRQ_INHIBIT+0x800>
 87c:	4d2f7665 	stcmi	6, cr7, [pc, #-404]!	; 6f0 <CPSR_IRQ_INHIBIT+0x670>
 880:	74694c79 	strbtvc	r4, [r9], #-3193	; 0xfffff387
 884:	4f656c74 	svcmi	0x00656c74
 888:	72732f53 	rsbsvc	r2, r3, #332	; 0x14c
 88c:	2e2e2f63 	cdpcs	15, 2, cr2, cr14, cr3, {3}
 890:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 894:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0xfffffa94
 898:	70720000 	rsbsvc	r0, r2, r0
 89c:	79732d69 	ldmdbvc	r3!, {r0, r3, r5, r6, r8, sl, fp, sp}^
 8a0:	6d697473 	cfstrdvs	mvd7, [r9, #-460]!	; 0xfffffe34
 8a4:	632e7265 			; <UNDEFINED> instruction: 0x632e7265
 8a8:	00000100 	andeq	r0, r0, r0, lsl #2
 8ac:	6665645f 			; <UNDEFINED> instruction: 0x6665645f
 8b0:	746c7561 	strbtvc	r7, [ip], #-1377	; 0xfffffa9f
 8b4:	7079745f 	rsbsvc	r7, r9, pc, asr r4
 8b8:	682e7365 	stmdavs	lr!, {r0, r2, r5, r6, r8, r9, ip, sp, lr}
 8bc:	00000200 	andeq	r0, r0, r0, lsl #4
 8c0:	6474735f 	ldrbtvs	r7, [r4], #-863	; 0xfffffca1
 8c4:	2e746e69 	cdpcs	14, 7, cr6, cr4, cr9, {3}
 8c8:	00030068 	andeq	r0, r3, r8, rrx
 8cc:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
 8d0:	7379732d 	cmnvc	r9, #-1275068416	; 0xb4000000
 8d4:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0xfffff68c
 8d8:	00682e72 	rsbeq	r2, r8, r2, ror lr
 8dc:	00000004 	andeq	r0, r0, r4
 8e0:	b8020500 	stmdalt	r2, {r8, sl}
 8e4:	0300008a 	movweq	r0, #138	; 0x8a
 8e8:	4b4b0110 	blmi	12c0d30 <_stack+0x1240d30>
 8ec:	008483a1 	addeq	r8, r4, r1, lsr #7
 8f0:	06010402 	streq	r0, [r1], -r2, lsl #8
 8f4:	02f6062e 	rscseq	r0, r6, #48234496	; 0x2e00000
 8f8:	0101000a 	tsteq	r1, sl
 8fc:	00000174 	andeq	r0, r0, r4, ror r1
 900:	00fb0002 	rscseq	r0, fp, r2
 904:	01020000 	mrseq	r0, (UNDEF: 2)
 908:	000d0efb 	strdeq	r0, [sp], -fp
 90c:	01010101 	tsteq	r1, r1, lsl #2
 910:	01000000 	mrseq	r0, (UNDEF: 0)
 914:	2f010000 	svccs	0x00010000
 918:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
 91c:	6462612f 	strbtvs	r6, [r2], #-303	; 0xfffffed1
 920:	72616b69 	rsbvc	r6, r1, #107520	; 0x1a400
 924:	642f6d69 	strtvs	r6, [pc], #-3433	; 92c <CPSR_IRQ_INHIBIT+0x8ac>
 928:	4d2f7665 	stcmi	6, cr7, [pc, #-404]!	; 79c <CPSR_IRQ_INHIBIT+0x71c>
 92c:	74694c79 	strbtvc	r4, [r9], #-3193	; 0xfffff387
 930:	4f656c74 	svcmi	0x00656c74
 934:	72732f53 	rsbsvc	r2, r3, #332	; 0x14c
 938:	752f0063 	strvc	r0, [pc, #-99]!	; 8dd <CPSR_IRQ_INHIBIT+0x85d>
 93c:	692f7273 	stmdbvs	pc!, {r0, r1, r4, r5, r6, r9, ip, sp, lr}	; <UNPREDICTABLE>
 940:	756c636e 	strbvc	r6, [ip, #-878]!	; 0xfffffc92
 944:	6e2f6564 	cfsh64vs	mvdx6, mvdx15, #52
 948:	696c7765 	stmdbvs	ip!, {r0, r2, r5, r6, r8, r9, sl, ip, sp, lr}^
 94c:	616d2f62 	cmnvs	sp, r2, ror #30
 950:	6e696863 	cdpvs	8, 6, cr6, cr9, cr3, {3}
 954:	752f0065 	strvc	r0, [pc, #-101]!	; 8f7 <CPSR_IRQ_INHIBIT+0x877>
 958:	692f7273 	stmdbvs	pc!, {r0, r1, r4, r5, r6, r9, ip, sp, lr}	; <UNPREDICTABLE>
 95c:	756c636e 	strbvc	r6, [ip, #-878]!	; 0xfffffc92
 960:	6e2f6564 	cfsh64vs	mvdx6, mvdx15, #52
 964:	696c7765 	stmdbvs	ip!, {r0, r2, r5, r6, r8, r9, sl, ip, sp, lr}^
 968:	79732f62 	ldmdbvc	r3!, {r1, r5, r6, r8, r9, sl, fp, sp}^
 96c:	682f0073 	stmdavs	pc!, {r0, r1, r4, r5, r6}	; <UNPREDICTABLE>
 970:	2f656d6f 	svccs	0x00656d6f
 974:	69646261 	stmdbvs	r4!, {r0, r5, r6, r9, sp, lr}^
 978:	6972616b 	ldmdbvs	r2!, {r0, r1, r3, r5, r6, r8, sp, lr}^
 97c:	65642f6d 	strbvs	r2, [r4, #-3949]!	; 0xfffff093
 980:	794d2f76 	stmdbvc	sp, {r1, r2, r4, r5, r6, r8, r9, sl, fp, sp}^
 984:	7474694c 	ldrbtvc	r6, [r4], #-2380	; 0xfffff6b4
 988:	534f656c 	movtpl	r6, #62828	; 0xf56c
 98c:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 990:	2f2e2e2f 	svccs	0x002e2e2f
 994:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 998:	00656475 	rsbeq	r6, r5, r5, ror r4
 99c:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
 9a0:	7261752d 	rsbvc	r7, r1, #188743680	; 0xb400000
 9a4:	00632e74 	rsbeq	r2, r3, r4, ror lr
 9a8:	5f000001 	svcpl	0x00000001
 9ac:	61666564 	cmnvs	r6, r4, ror #10
 9b0:	5f746c75 	svcpl	0x00746c75
 9b4:	65707974 	ldrbvs	r7, [r0, #-2420]!	; 0xfffff68c
 9b8:	00682e73 	rsbeq	r2, r8, r3, ror lr
 9bc:	5f000002 	svcpl	0x00000002
 9c0:	69647473 	stmdbvs	r4!, {r0, r1, r4, r5, r6, sl, ip, sp, lr}^
 9c4:	682e746e 	stmdavs	lr!, {r1, r2, r3, r5, r6, sl, ip, sp, lr}
 9c8:	00000300 	andeq	r0, r0, r0, lsl #6
 9cc:	2d697072 	stclcs	0, cr7, [r9, #-456]!	; 0xfffffe38
 9d0:	65736162 	ldrbvs	r6, [r3, #-354]!	; 0xfffffe9e
 9d4:	0400682e 	streq	r6, [r0], #-2094	; 0xfffff7d2
 9d8:	70720000 	rsbsvc	r0, r2, r0
 9dc:	61752d69 	cmnvs	r5, r9, ror #26
 9e0:	682e7472 	stmdavs	lr!, {r1, r4, r5, r6, sl, ip, sp, lr}
 9e4:	00000400 	andeq	r0, r0, r0, lsl #8
 9e8:	2d697072 	stclcs	0, cr7, [r9, #-456]!	; 0xfffffe38
 9ec:	6f697067 	svcvs	0x00697067
 9f0:	0400682e 	streq	r6, [r0], #-2094	; 0xfffff7d2
 9f4:	69660000 	stmdbvs	r6!, {}^	; <UNPREDICTABLE>
 9f8:	682e6f66 	stmdavs	lr!, {r1, r2, r5, r6, r8, r9, sl, fp, sp, lr}
 9fc:	00000400 	andeq	r0, r0, r0, lsl #8
 a00:	02050000 	andeq	r0, r5, #0
 a04:	00008b34 	andeq	r8, r0, r4, lsr fp
 a08:	4b011a03 	blmi	4721c <__bss_end__+0x3dcd4>
 a0c:	4b4ba14b 	blmi	12e8f40 <_stack+0x1268f40>
 a10:	d84c69a1 	stmdale	ip, {r0, r5, r7, r8, fp, sp, lr}^
 a14:	83838383 	orrhi	r8, r3, #201326594	; 0xc000002
 a18:	68678684 	stmdavs	r7!, {r2, r7, r9, sl, pc}^
 a1c:	04020067 	streq	r0, [r2], #-103	; 0xffffff99
 a20:	00660603 	rsbeq	r0, r6, r3, lsl #12
 a24:	66010402 	strvs	r0, [r1], -r2, lsl #8
 a28:	00676706 	rsbeq	r6, r7, r6, lsl #14
 a2c:	06030402 	streq	r0, [r3], -r2, lsl #8
 a30:	04020066 	streq	r0, [r2], #-102	; 0xffffff9a
 a34:	67066601 	strvs	r6, [r6, -r1, lsl #12]
 a38:	83660903 	cmnhi	r6, #49152	; 0xc000
 a3c:	0200a0bd 	andeq	sl, r0, #189	; 0xbd
 a40:	2e060104 	adfcss	f0, f6, f4
 a44:	a183bd06 	orrge	fp, r3, r6, lsl #26
 a48:	040200a1 	streq	r0, [r2], #-161	; 0xffffff5f
 a4c:	02006703 	andeq	r6, r0, #786432	; 0xc0000
 a50:	00b90304 	adcseq	r0, r9, r4, lsl #6
 a54:	06010402 	streq	r0, [r1], -r2, lsl #8
 a58:	2f850666 	svccs	0x00850666
 a5c:	b8308369 	ldmdalt	r0!, {r0, r3, r5, r6, r8, r9, pc}
 a60:	9f9f6a86 	svcls	0x009f6a86
 a64:	85bc6b85 	ldrhi	r6, [ip, #2949]!	; 0xb85
 a68:	a268d983 	rsbge	sp, r8, #2146304	; 0x20c000
 a6c:	02d9bcbf 	sbcseq	fp, r9, #48896	; 0xbf00
 a70:	0101000a 	tsteq	r1, sl
 a74:	0000019a 	muleq	r0, sl, r1
 a78:	01560002 	cmpeq	r6, r2
 a7c:	01020000 	mrseq	r0, (UNDEF: 2)
 a80:	000d0efb 	strdeq	r0, [sp], -fp
 a84:	01010101 	tsteq	r1, r1, lsl #2
 a88:	01000000 	mrseq	r0, (UNDEF: 0)
 a8c:	2f010000 	svccs	0x00010000
 a90:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
 a94:	6462612f 	strbtvs	r6, [r2], #-303	; 0xfffffed1
 a98:	72616b69 	rsbvc	r6, r1, #107520	; 0x1a400
 a9c:	642f6d69 	strtvs	r6, [pc], #-3433	; aa4 <CPSR_IRQ_INHIBIT+0xa24>
 aa0:	4d2f7665 	stcmi	6, cr7, [pc, #-404]!	; 914 <CPSR_IRQ_INHIBIT+0x894>
 aa4:	74694c79 	strbtvc	r4, [r9], #-3193	; 0xfffff387
 aa8:	4f656c74 	svcmi	0x00656c74
 aac:	72732f53 	rsbsvc	r2, r3, #332	; 0x14c
 ab0:	752f0063 	strvc	r0, [pc, #-99]!	; a55 <CPSR_IRQ_INHIBIT+0x9d5>
 ab4:	692f7273 	stmdbvs	pc!, {r0, r1, r4, r5, r6, r9, ip, sp, lr}	; <UNPREDICTABLE>
 ab8:	756c636e 	strbvc	r6, [ip, #-878]!	; 0xfffffc92
 abc:	6e2f6564 	cfsh64vs	mvdx6, mvdx15, #52
 ac0:	696c7765 	stmdbvs	ip!, {r0, r2, r5, r6, r8, r9, sl, ip, sp, lr}^
 ac4:	616d2f62 	cmnvs	sp, r2, ror #30
 ac8:	6e696863 	cdpvs	8, 6, cr6, cr9, cr3, {3}
 acc:	752f0065 	strvc	r0, [pc, #-101]!	; a6f <CPSR_IRQ_INHIBIT+0x9ef>
 ad0:	692f7273 	stmdbvs	pc!, {r0, r1, r4, r5, r6, r9, ip, sp, lr}	; <UNPREDICTABLE>
 ad4:	756c636e 	strbvc	r6, [ip, #-878]!	; 0xfffffc92
 ad8:	6e2f6564 	cfsh64vs	mvdx6, mvdx15, #52
 adc:	696c7765 	stmdbvs	ip!, {r0, r2, r5, r6, r8, r9, sl, ip, sp, lr}^
 ae0:	79732f62 	ldmdbvc	r3!, {r1, r5, r6, r8, r9, sl, fp, sp}^
 ae4:	752f0073 	strvc	r0, [pc, #-115]!	; a79 <CPSR_IRQ_INHIBIT+0x9f9>
 ae8:	6c2f7273 	sfmvs	f7, 4, [pc], #-460	; 924 <CPSR_IRQ_INHIBIT+0x8a4>
 aec:	672f6269 	strvs	r6, [pc, -r9, ror #4]!
 af0:	612f6363 			; <UNDEFINED> instruction: 0x612f6363
 af4:	6e2d6d72 	mcrvs	13, 1, r6, cr13, cr2, {3}
 af8:	2d656e6f 	stclcs	14, cr6, [r5, #-444]!	; 0xfffffe44
 afc:	69626165 	stmdbvs	r2!, {r0, r2, r5, r6, r8, sp, lr}^
 b00:	332e362f 			; <UNDEFINED> instruction: 0x332e362f
 b04:	692f312e 	stmdbvs	pc!, {r1, r2, r3, r5, r8, ip, sp}	; <UNPREDICTABLE>
 b08:	756c636e 	strbvc	r6, [ip, #-878]!	; 0xfffffc92
 b0c:	2f006564 	svccs	0x00006564
 b10:	2f727375 	svccs	0x00727375
 b14:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 b18:	2f656475 	svccs	0x00656475
 b1c:	6c77656e 	cfldr64vs	mvdx6, [r7], #-440	; 0xfffffe48
 b20:	2f006269 	svccs	0x00006269
 b24:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
 b28:	6462612f 	strbtvs	r6, [r2], #-303	; 0xfffffed1
 b2c:	72616b69 	rsbvc	r6, r1, #107520	; 0x1a400
 b30:	642f6d69 	strtvs	r6, [pc], #-3433	; b38 <CPSR_IRQ_INHIBIT+0xab8>
 b34:	4d2f7665 	stcmi	6, cr7, [pc, #-404]!	; 9a8 <CPSR_IRQ_INHIBIT+0x928>
 b38:	74694c79 	strbtvc	r4, [r9], #-3193	; 0xfffff387
 b3c:	4f656c74 	svcmi	0x00656c74
 b40:	72732f53 	rsbsvc	r2, r3, #332	; 0x14c
 b44:	2e2e2f63 	cdpcs	15, 2, cr2, cr14, cr3, {3}
 b48:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 b4c:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0xfffffa94
 b50:	68730000 	ldmdavs	r3!, {}^	; <UNPREDICTABLE>
 b54:	2e6c6c65 	cdpcs	12, 6, cr6, cr12, cr5, {3}
 b58:	00010063 	andeq	r0, r1, r3, rrx
 b5c:	65645f00 	strbvs	r5, [r4, #-3840]!	; 0xfffff100
 b60:	6c756166 	ldfvse	f6, [r5], #-408	; 0xfffffe68
 b64:	79745f74 	ldmdbvc	r4!, {r2, r4, r5, r6, r8, r9, sl, fp, ip, lr}^
 b68:	2e736570 	mrccs	5, 3, r6, cr3, cr0, {3}
 b6c:	00020068 	andeq	r0, r2, r8, rrx
 b70:	636f6c00 	cmnvs	pc, #0, 24
 b74:	00682e6b 	rsbeq	r2, r8, fp, ror #28
 b78:	5f000003 	svcpl	0x00000003
 b7c:	65707974 	ldrbvs	r7, [r0, #-2420]!	; 0xfffff68c
 b80:	00682e73 	rsbeq	r2, r8, r3, ror lr
 b84:	73000003 	movwvc	r0, #3
 b88:	65646474 	strbvs	r6, [r4, #-1140]!	; 0xfffffb8c
 b8c:	00682e66 	rsbeq	r2, r8, r6, ror #28
 b90:	72000004 	andvc	r0, r0, #4
 b94:	746e6565 	strbtvc	r6, [lr], #-1381	; 0xfffffa9b
 b98:	0300682e 	movweq	r6, #2094	; 0x82e
 b9c:	735f0000 	cmpvc	pc, #0
 ba0:	6e696474 	mcrvs	4, 3, r6, cr9, cr4, {3}
 ba4:	00682e74 	rsbeq	r2, r8, r4, ror lr
 ba8:	73000003 	movwvc	r0, #3
 bac:	696c6474 	stmdbvs	ip!, {r2, r4, r5, r6, sl, sp, lr}^
 bb0:	00682e62 	rsbeq	r2, r8, r2, ror #28
 bb4:	72000005 	andvc	r0, r0, #5
 bb8:	622d6970 	eorvs	r6, sp, #112, 18	; 0x1c0000
 bbc:	2e657361 	cdpcs	3, 6, cr7, cr5, cr1, {3}
 bc0:	00060068 	andeq	r0, r6, r8, rrx
 bc4:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
 bc8:	7261752d 	rsbvc	r7, r1, #188743680	; 0xb400000
 bcc:	00682e74 	rsbeq	r2, r8, r4, ror lr
 bd0:	00000006 	andeq	r0, r0, r6
 bd4:	d0020500 	andle	r0, r2, r0, lsl #10
 bd8:	0300008e 	movweq	r0, #142	; 0x8e
 bdc:	4f6b0109 	svcmi	0x006b0109
 be0:	00684d4f 	rsbeq	r4, r8, pc, asr #26
 be4:	06010402 	streq	r0, [r1], -r2, lsl #8
 be8:	0402002e 	streq	r0, [r2], #-46	; 0xffffffd2
 bec:	00a00602 	adceq	r0, r0, r2, lsl #12
 bf0:	a1020402 	tstge	r2, r2, lsl #8
 bf4:	02040200 	andeq	r0, r4, #0, 4
 bf8:	040200a0 	streq	r0, [r2], #-160	; 0xffffff60
 bfc:	66770302 	ldrbtvs	r0, [r7], -r2, lsl #6
 c00:	01040200 	mrseq	r0, R12_usr
 c04:	03066606 	movweq	r6, #26118	; 0x6606
 c08:	7103660c 	tstvc	r3, ip, lsl #12
 c0c:	0006024a 	andeq	r0, r6, sl, asr #4
 c10:	01200101 			; <UNDEFINED> instruction: 0x01200101
 c14:	00020000 	andeq	r0, r2, r0
 c18:	000000eb 	andeq	r0, r0, fp, ror #1
 c1c:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 c20:	0101000d 	tsteq	r1, sp
 c24:	00000101 	andeq	r0, r0, r1, lsl #2
 c28:	00000100 	andeq	r0, r0, r0, lsl #2
 c2c:	6f682f01 	svcvs	0x00682f01
 c30:	612f656d 			; <UNDEFINED> instruction: 0x612f656d
 c34:	6b696462 	blvs	1a59dc4 <_stack+0x19d9dc4>
 c38:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
 c3c:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
 c40:	4c794d2f 	ldclmi	13, cr4, [r9], #-188	; 0xffffff44
 c44:	6c747469 	cfldrdvs	mvd7, [r4], #-420	; 0xfffffe5c
 c48:	2f534f65 	svccs	0x00534f65
 c4c:	00637273 	rsbeq	r7, r3, r3, ror r2
 c50:	7273752f 	rsbsvc	r7, r3, #197132288	; 0xbc00000
 c54:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 c58:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0xfffffa94
 c5c:	77656e2f 	strbvc	r6, [r5, -pc, lsr #28]!
 c60:	2f62696c 	svccs	0x0062696c
 c64:	6863616d 	stmdavs	r3!, {r0, r2, r3, r5, r6, r8, sp, lr}^
 c68:	00656e69 	rsbeq	r6, r5, r9, ror #28
 c6c:	7273752f 	rsbsvc	r7, r3, #197132288	; 0xbc00000
 c70:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 c74:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0xfffffa94
 c78:	77656e2f 	strbvc	r6, [r5, -pc, lsr #28]!
 c7c:	2f62696c 	svccs	0x0062696c
 c80:	00737973 	rsbseq	r7, r3, r3, ror r9
 c84:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; bd0 <CPSR_IRQ_INHIBIT+0xb50>
 c88:	62612f65 	rsbvs	r2, r1, #404	; 0x194
 c8c:	616b6964 	cmnvs	fp, r4, ror #18
 c90:	2f6d6972 	svccs	0x006d6972
 c94:	2f766564 	svccs	0x00766564
 c98:	694c794d 	stmdbvs	ip, {r0, r2, r3, r6, r8, fp, ip, sp, lr}^
 c9c:	656c7474 	strbvs	r7, [ip, #-1140]!	; 0xfffffb8c
 ca0:	732f534f 			; <UNDEFINED> instruction: 0x732f534f
 ca4:	2e2f6372 	mcrcs	3, 1, r6, cr15, cr2, {3}
 ca8:	6e692f2e 	cdpvs	15, 6, cr2, cr9, cr14, {1}
 cac:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xfffff39d
 cb0:	73000065 	movwvc	r0, #101	; 0x65
 cb4:	632e6376 			; <UNDEFINED> instruction: 0x632e6376
 cb8:	00000100 	andeq	r0, r0, r0, lsl #2
 cbc:	6665645f 			; <UNDEFINED> instruction: 0x6665645f
 cc0:	746c7561 	strbtvc	r7, [ip], #-1377	; 0xfffffa9f
 cc4:	7079745f 	rsbsvc	r7, r9, pc, asr r4
 cc8:	682e7365 	stmdavs	lr!, {r0, r2, r5, r6, r8, r9, ip, sp, lr}
 ccc:	00000200 	andeq	r0, r0, r0, lsl #4
 cd0:	6474735f 	ldrbtvs	r7, [r4], #-863	; 0xfffffca1
 cd4:	2e746e69 	cdpcs	14, 7, cr6, cr4, cr9, {3}
 cd8:	00030068 	andeq	r0, r3, r8, rrx
 cdc:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
 ce0:	7361622d 	cmnvc	r1, #-805306366	; 0xd0000002
 ce4:	00682e65 	rsbeq	r2, r8, r5, ror #28
 ce8:	72000004 	andvc	r0, r0, #4
 cec:	752d6970 	strvc	r6, [sp, #-2416]!	; 0xfffff690
 cf0:	2e747261 	cdpcs	2, 7, cr7, cr4, cr1, {3}
 cf4:	00040068 	andeq	r0, r4, r8, rrx
 cf8:	6f727000 	svcvs	0x00727000
 cfc:	73736563 	cmnvc	r3, #415236096	; 0x18c00000
 d00:	0400682e 	streq	r6, [r0], #-2094	; 0xfffff7d2
 d04:	00000000 	andeq	r0, r0, r0
 d08:	8f780205 	svchi	0x00780205
 d0c:	a01a0000 	andsge	r0, sl, r0
 d10:	004d6767 	subeq	r6, sp, r7, ror #14
 d14:	06010402 	streq	r0, [r1], -r2, lsl #8
 d18:	03a1062e 			; <UNDEFINED> instruction: 0x03a1062e
 d1c:	6c036617 	stcvs	6, cr6, [r3], {23}
 d20:	4d4b682e 	stclmi	8, cr6, [fp, #-184]	; 0xffffff48
 d24:	8a4d6867 	bhi	135aec8 <_stack+0x12daec8>
 d28:	002e7a03 	eoreq	r7, lr, r3, lsl #20
 d2c:	4d010402 	cfstrsmi	mvf0, [r1, #-8]
 d30:	00040285 	andeq	r0, r4, r5, lsl #5
 d34:	00d40101 	sbcseq	r0, r4, r1, lsl #2
 d38:	00020000 	andeq	r0, r2, r0
 d3c:	00000078 	andeq	r0, r0, r8, ror r0
 d40:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 d44:	0101000d 	tsteq	r1, sp
 d48:	00000101 	andeq	r0, r0, r1, lsl #2
 d4c:	00000100 	andeq	r0, r0, r0, lsl #2
 d50:	6f682f01 	svcvs	0x00682f01
 d54:	612f656d 			; <UNDEFINED> instruction: 0x612f656d
 d58:	6b696462 	blvs	1a59ee8 <_stack+0x19d9ee8>
 d5c:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
 d60:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
 d64:	4c794d2f 	ldclmi	13, cr4, [r9], #-188	; 0xffffff44
 d68:	6c747469 	cfldrdvs	mvd7, [r4], #-420	; 0xfffffe5c
 d6c:	2f534f65 	svccs	0x00534f65
 d70:	0062696c 	rsbeq	r6, r2, ip, ror #18
 d74:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; cc0 <CPSR_IRQ_INHIBIT+0xc40>
 d78:	62612f65 	rsbvs	r2, r1, #404	; 0x194
 d7c:	616b6964 	cmnvs	fp, r4, ror #18
 d80:	2f6d6972 	svccs	0x006d6972
 d84:	2f766564 	svccs	0x00766564
 d88:	694c794d 	stmdbvs	ip, {r0, r2, r3, r6, r8, fp, ip, sp, lr}^
 d8c:	656c7474 	strbvs	r7, [ip, #-1140]!	; 0xfffffb8c
 d90:	6c2f534f 	stcvs	3, cr5, [pc], #-316	; c5c <CPSR_IRQ_INHIBIT+0xbdc>
 d94:	2e2f6269 	cdpcs	2, 2, cr6, cr15, cr9, {3}
 d98:	6e692f2e 	cdpvs	15, 6, cr2, cr9, cr14, {1}
 d9c:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xfffff39d
 da0:	66000065 	strvs	r0, [r0], -r5, rrx
 da4:	2e6f6669 	cdpcs	6, 6, cr6, cr15, cr9, {3}
 da8:	00010063 	andeq	r0, r1, r3, rrx
 dac:	66696600 	strbtvs	r6, [r9], -r0, lsl #12
 db0:	00682e6f 	rsbeq	r2, r8, pc, ror #28
 db4:	00000002 	andeq	r0, r0, r2
 db8:	44020500 	strmi	r0, [r2], #-1280	; 0xfffffb00
 dbc:	03000090 	movweq	r0, #144	; 0x90
 dc0:	6783010a 	strvs	r0, [r3, sl, lsl #2]
 dc4:	bd876767 	stclt	7, cr6, [r7, #412]	; 0x19c
 dc8:	f3bc694c 	vtbx.8	d6, {d12-d13}, d12
 dcc:	8468bc9f 	strbthi	fp, [r8], #-3231	; 0xfffff361
 dd0:	02040200 	andeq	r0, r4, #0, 4
 dd4:	004a7303 	subeq	r7, sl, r3, lsl #6
 dd8:	06010402 	streq	r0, [r1], -r2, lsl #8
 ddc:	11030666 	tstne	r3, r6, ror #12
 de0:	bd872f82 	stclt	15, cr2, [r7, #520]	; 0x208
 de4:	0200694c 	andeq	r6, r0, #76, 18	; 0x130000
 de8:	d6060104 	strle	r0, [r6], -r4, lsl #2
 dec:	02040200 	andeq	r0, r4, #0, 4
 df0:	4c8406d6 	stcmi	6, cr0, [r4], {214}	; 0xd6
 df4:	00bc9ff3 	ldrshteq	r9, [ip], r3
 df8:	03020402 	movweq	r0, #9218	; 0x2402
 dfc:	02006675 	andeq	r6, r0, #122683392	; 0x7500000
 e00:	66060104 	strvs	r0, [r6], -r4, lsl #2
 e04:	82100306 	andshi	r0, r0, #402653184	; 0x18000000
 e08:	0008022f 	andeq	r0, r8, pc, lsr #4
 e0c:	005b0101 	subseq	r0, fp, r1, lsl #2
 e10:	00020000 	andeq	r0, r2, r0
 e14:	00000041 	andeq	r0, r0, r1, asr #32
 e18:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 e1c:	0101000d 	tsteq	r1, sp
 e20:	00000101 	andeq	r0, r0, r1, lsl #2
 e24:	00000100 	andeq	r0, r0, r0, lsl #2
 e28:	6f682f01 	svcvs	0x00682f01
 e2c:	612f656d 			; <UNDEFINED> instruction: 0x612f656d
 e30:	6b696462 	blvs	1a59fc0 <_stack+0x19d9fc0>
 e34:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
 e38:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
 e3c:	4c794d2f 	ldclmi	13, cr4, [r9], #-188	; 0xffffff44
 e40:	6c747469 	cfldrdvs	mvd7, [r4], #-420	; 0xfffffe5c
 e44:	2f534f65 	svccs	0x00534f65
 e48:	0062696c 	rsbeq	r6, r2, ip, ror #18
 e4c:	69727000 	ldmdbvs	r2!, {ip, sp, lr}^
 e50:	632e746e 			; <UNDEFINED> instruction: 0x632e746e
 e54:	00000100 	andeq	r0, r0, r0, lsl #2
 e58:	02050000 	andeq	r0, r5, #0
 e5c:	00009270 	andeq	r9, r0, r0, ror r2
 e60:	852f9f17 	strhi	r9, [pc, #-3863]!	; ffffff51 <CPSR_UNAFFECTED_BITS+0x51>
 e64:	86b83083 	ldrthi	r3, [r8], r3, lsl #1
 e68:	01000602 	tsteq	r0, r2, lsl #12
 e6c:	00007301 	andeq	r7, r0, r1, lsl #6
 e70:	45000200 	strmi	r0, [r0, #-512]	; 0xfffffe00
 e74:	02000000 	andeq	r0, r0, #0
 e78:	0d0efb01 	vstreq	d15, [lr, #-4]
 e7c:	01010100 	mrseq	r0, (UNDEF: 17)
 e80:	00000001 	andeq	r0, r0, r1
 e84:	01000001 	tsteq	r0, r1
 e88:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; dd4 <CPSR_IRQ_INHIBIT+0xd54>
 e8c:	62612f65 	rsbvs	r2, r1, #404	; 0x194
 e90:	616b6964 	cmnvs	fp, r4, ror #18
 e94:	2f6d6972 	svccs	0x006d6972
 e98:	2f766564 	svccs	0x00766564
 e9c:	694c794d 	stmdbvs	ip, {r0, r2, r3, r6, r8, fp, ip, sp, lr}^
 ea0:	656c7474 	strbvs	r7, [ip, #-1140]!	; 0xfffffb8c
 ea4:	732f534f 			; <UNDEFINED> instruction: 0x732f534f
 ea8:	00006372 	andeq	r6, r0, r2, ror r3
 eac:	65686373 	strbvs	r6, [r8, #-883]!	; 0xfffffc8d
 eb0:	656c7564 	strbvs	r7, [ip, #-1380]!	; 0xfffffa9c
 eb4:	00732e72 	rsbseq	r2, r3, r2, ror lr
 eb8:	00000001 	andeq	r0, r0, r1
 ebc:	e0020500 	and	r0, r2, r0, lsl #10
 ec0:	1a000092 	bne	1110 <_heap_top+0x110>
 ec4:	2f2f2f2f 	svccs	0x002f2f2f
 ec8:	2f2f2f2f 	svccs	0x002f2f2f
 ecc:	312f2f2f 			; <UNDEFINED> instruction: 0x312f2f2f
 ed0:	2f2f2f2f 	svccs	0x002f2f2f
 ed4:	2f2f2f2f 	svccs	0x002f2f2f
 ed8:	2f2f2f36 	svccs	0x002f2f36
 edc:	022f2f2f 	eoreq	r2, pc, #47, 30	; 0xbc
 ee0:	01010002 	tsteq	r1, r2
 ee4:	0000007b 	andeq	r0, r0, fp, ror r0
 ee8:	00410002 	subeq	r0, r1, r2
 eec:	01020000 	mrseq	r0, (UNDEF: 2)
 ef0:	000d0efb 	strdeq	r0, [sp], -fp
 ef4:	01010101 	tsteq	r1, r1, lsl #2
 ef8:	01000000 	mrseq	r0, (UNDEF: 0)
 efc:	2f010000 	svccs	0x00010000
 f00:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
 f04:	6462612f 	strbtvs	r6, [r2], #-303	; 0xfffffed1
 f08:	72616b69 	rsbvc	r6, r1, #107520	; 0x1a400
 f0c:	642f6d69 	strtvs	r6, [pc], #-3433	; f14 <CPSR_IRQ_INHIBIT+0xe94>
 f10:	4d2f7665 	stcmi	6, cr7, [pc, #-404]!	; d84 <CPSR_IRQ_INHIBIT+0xd04>
 f14:	74694c79 	strbtvc	r4, [r9], #-3193	; 0xfffff387
 f18:	4f656c74 	svcmi	0x00656c74
 f1c:	72732f53 	rsbsvc	r2, r3, #332	; 0x14c
 f20:	73000063 	movwvc	r0, #99	; 0x63
 f24:	74726174 	ldrbtvc	r6, [r2], #-372	; 0xfffffe8c
 f28:	0100732e 	tsteq	r0, lr, lsr #6
 f2c:	00000000 	andeq	r0, r0, r0
 f30:	80000205 	andhi	r0, r0, r5, lsl #4
 f34:	1f030000 	svcne	0x00030000
 f38:	2f2f2f01 	svccs	0x002f2f01
 f3c:	2f2f2f2f 	svccs	0x002f2f2f
 f40:	20080e03 	andcs	r0, r8, r3, lsl #28
 f44:	2f2f2f2f 	svccs	0x002f2f2f
 f48:	2f2f322f 	svccs	0x002f322f
 f4c:	2f2e0c03 	svccs	0x002e0c03
 f50:	0331312f 	teqeq	r1, #-1073741813	; 0xc000000b
 f54:	2f2f2e12 	svccs	0x002f2e12
 f58:	2e0a032f 	cdpcs	3, 0, cr0, cr10, cr15, {1}
 f5c:	02022f2f 	andeq	r2, r2, #47, 30	; 0xbc
 f60:	59010100 	stmdbpl	r1, {r8}
 f64:	02000000 	andeq	r0, r0, #0
 f68:	00003f00 	andeq	r3, r0, r0, lsl #30
 f6c:	fb010200 	blx	41776 <__bss_end__+0x3822e>
 f70:	01000d0e 	tsteq	r0, lr, lsl #26
 f74:	00010101 	andeq	r0, r1, r1, lsl #2
 f78:	00010000 	andeq	r0, r1, r0
 f7c:	682f0100 	stmdavs	pc!, {r8}	; <UNPREDICTABLE>
 f80:	2f656d6f 	svccs	0x00656d6f
 f84:	69646261 	stmdbvs	r4!, {r0, r5, r6, r9, sp, lr}^
 f88:	6972616b 	ldmdbvs	r2!, {r0, r1, r3, r5, r6, r8, sp, lr}^
 f8c:	65642f6d 	strbvs	r2, [r4, #-3949]!	; 0xfffff093
 f90:	794d2f76 	stmdbvc	sp, {r1, r2, r4, r5, r6, r8, r9, sl, fp, sp}^
 f94:	7474694c 	ldrbtvc	r6, [r4], #-2380	; 0xfffff6b4
 f98:	534f656c 	movtpl	r6, #62828	; 0xf56c
 f9c:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 fa0:	76730000 	ldrbtvc	r0, [r3], -r0
 fa4:	00732e63 	rsbseq	r2, r3, r3, ror #28
 fa8:	00000001 	andeq	r0, r0, r1
 fac:	50020500 	andpl	r0, r2, r0, lsl #10
 fb0:	18000093 	stmdane	r0, {r0, r1, r4, r7}
 fb4:	30302f31 	eorscc	r2, r0, r1, lsr pc
 fb8:	022f2f30 	eoreq	r2, pc, #48, 30	; 0xc0
 fbc:	01010002 	tsteq	r1, r2

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
  64:	0000007c 	andeq	r0, r0, ip, ror r0
  68:	8b080e42 	blhi	203978 <_stack+0x183978>
  6c:	42018e02 	andmi	r8, r1, #2, 28
  70:	00040b0c 	andeq	r0, r4, ip, lsl #22
  74:	00000018 	andeq	r0, r0, r8, lsl r0
  78:	0000002c 	andeq	r0, r0, ip, lsr #32
  7c:	00008190 	muleq	r0, r0, r1
  80:	0000007c 	andeq	r0, r0, ip, ror r0
  84:	8b080e42 	blhi	203994 <_stack+0x183994>
  88:	42018e02 	andmi	r8, r1, #2, 28
  8c:	00040b0c 	andeq	r0, r4, ip, lsl #22
  90:	0000000c 	andeq	r0, r0, ip
  94:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  98:	7c020001 	stcvc	0, cr0, [r2], {1}
  9c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  a0:	00000018 	andeq	r0, r0, r8, lsl r0
  a4:	00000090 	muleq	r0, r0, r0
  a8:	0000820c 	andeq	r8, r0, ip, lsl #4
  ac:	0000001c 	andeq	r0, r0, ip, lsl r0
  b0:	8b080e42 	blhi	2039c0 <_stack+0x1839c0>
  b4:	42018e02 	andmi	r8, r1, #2, 28
  b8:	00040b0c 	andeq	r0, r4, ip, lsl #22
  bc:	00000018 	andeq	r0, r0, r8, lsl r0
  c0:	00000090 	muleq	r0, r0, r0
  c4:	00008228 	andeq	r8, r0, r8, lsr #4
  c8:	00000170 	andeq	r0, r0, r0, ror r1
  cc:	8b080e42 	blhi	2039dc <_stack+0x1839dc>
  d0:	42018e02 	andmi	r8, r1, #2, 28
  d4:	00040b0c 	andeq	r0, r4, ip, lsl #22
  d8:	0000000c 	andeq	r0, r0, ip
  dc:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  e0:	7c020001 	stcvc	0, cr0, [r2], {1}
  e4:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  e8:	0000001c 	andeq	r0, r0, ip, lsl r0
  ec:	000000d8 	ldrdeq	r0, [r0], -r8
  f0:	00008398 	muleq	r0, r8, r3
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
 120:	000084f4 	strdeq	r8, [r0], -r4
 124:	00000098 	muleq	r0, r8, r0
 128:	8b080e42 	blhi	203a38 <_stack+0x183a38>
 12c:	42018e02 	andmi	r8, r1, #2, 28
 130:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
 134:	080d0c46 	stmdaeq	sp, {r1, r2, r6, sl, fp}
 138:	0000001c 	andeq	r0, r0, ip, lsl r0
 13c:	00000108 	andeq	r0, r0, r8, lsl #2
 140:	0000858c 	andeq	r8, r0, ip, lsl #11
 144:	00000030 	andeq	r0, r0, r0, lsr r0
 148:	8b040e42 	blhi	103a58 <_stack+0x83a58>
 14c:	0b0d4201 	bleq	350958 <_stack+0x2d0958>
 150:	420d0d4e 	andmi	r0, sp, #4992	; 0x1380
 154:	00000ecb 	andeq	r0, r0, fp, asr #29
 158:	0000001c 	andeq	r0, r0, ip, lsl r0
 15c:	00000108 	andeq	r0, r0, r8, lsl #2
 160:	000085bc 			; <UNDEFINED> instruction: 0x000085bc
 164:	00000024 	andeq	r0, r0, r4, lsr #32
 168:	8b040e42 	blhi	103a78 <_stack+0x83a78>
 16c:	0b0d4201 	bleq	350978 <_stack+0x2d0978>
 170:	420d0d48 	andmi	r0, sp, #72, 26	; 0x1200
 174:	00000ecb 	andeq	r0, r0, fp, asr #29
 178:	0000001c 	andeq	r0, r0, ip, lsl r0
 17c:	00000108 	andeq	r0, r0, r8, lsl #2
 180:	000085e0 	andeq	r8, r0, r0, ror #11
 184:	00000074 	andeq	r0, r0, r4, ror r0
 188:	8b040e42 	blhi	103a98 <_stack+0x83a98>
 18c:	0b0d4201 	bleq	350998 <_stack+0x2d0998>
 190:	420d0d70 	andmi	r0, sp, #112, 26	; 0x1c00
 194:	00000ecb 	andeq	r0, r0, fp, asr #29
 198:	0000001c 	andeq	r0, r0, ip, lsl r0
 19c:	00000108 	andeq	r0, r0, r8, lsl #2
 1a0:	00008654 	andeq	r8, r0, r4, asr r6
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
 1d0:	000086dc 	ldrdeq	r8, [r0], -ip
 1d4:	00000024 	andeq	r0, r0, r4, lsr #32
 1d8:	8b040e42 	blhi	103ae8 <_stack+0x83ae8>
 1dc:	0b0d4201 	bleq	3509e8 <_stack+0x2d09e8>
 1e0:	420d0d48 	andmi	r0, sp, #72, 26	; 0x1200
 1e4:	00000ecb 	andeq	r0, r0, fp, asr #29
 1e8:	0000001c 	andeq	r0, r0, ip, lsl r0
 1ec:	000001b8 			; <UNDEFINED> instruction: 0x000001b8
 1f0:	00008700 	andeq	r8, r0, r0, lsl #14
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
 220:	00008718 	andeq	r8, r0, r8, lsl r7
 224:	00000024 	andeq	r0, r0, r4, lsr #32
 228:	8b040e42 	blhi	103b38 <_stack+0x83b38>
 22c:	0b0d4201 	bleq	350a38 <_stack+0x2d0a38>
 230:	420d0d48 	andmi	r0, sp, #72, 26	; 0x1200
 234:	00000ecb 	andeq	r0, r0, fp, asr #29
 238:	0000001c 	andeq	r0, r0, ip, lsl r0
 23c:	00000208 	andeq	r0, r0, r8, lsl #4
 240:	0000873c 	andeq	r8, r0, ip, lsr r7
 244:	0000011c 	andeq	r0, r0, ip, lsl r1
 248:	8b040e42 	blhi	103b58 <_stack+0x83b58>
 24c:	0b0d4201 	bleq	350a58 <_stack+0x2d0a58>
 250:	0d0d8202 	sfmeq	f0, 1, [sp, #-8]
 254:	000ecb42 	andeq	ip, lr, r2, asr #22
 258:	0000001c 	andeq	r0, r0, ip, lsl r0
 25c:	00000208 	andeq	r0, r0, r8, lsl #4
 260:	00008858 	andeq	r8, r0, r8, asr r8
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
 290:	00008870 	andeq	r8, r0, r0, ror r8
 294:	00000024 	andeq	r0, r0, r4, lsr #32
 298:	8b040e42 	blhi	103ba8 <_stack+0x83ba8>
 29c:	0b0d4201 	bleq	350aa8 <_stack+0x2d0aa8>
 2a0:	420d0d48 	andmi	r0, sp, #72, 26	; 0x1200
 2a4:	00000ecb 	andeq	r0, r0, fp, asr #29
 2a8:	00000024 	andeq	r0, r0, r4, lsr #32
 2ac:	00000278 	andeq	r0, r0, r8, ror r2
 2b0:	00008894 	muleq	r0, r4, r8
 2b4:	00000038 	andeq	r0, r0, r8, lsr r0
 2b8:	801c0e44 	andshi	r0, ip, r4, asr #28
 2bc:	82068107 	andhi	r8, r6, #-1073741823	; 0xc0000001
 2c0:	8b048305 	blhi	120edc <_stack+0xa0edc>
 2c4:	8e028c03 	cdphi	12, 0, cr8, cr2, cr3, {0}
 2c8:	0b0c4201 	bleq	310ad4 <_stack+0x290ad4>
 2cc:	00000004 	andeq	r0, r0, r4
 2d0:	00000024 	andeq	r0, r0, r4, lsr #32
 2d4:	00000278 	andeq	r0, r0, r8, ror r2
 2d8:	000088cc 	andeq	r8, r0, ip, asr #17
 2dc:	00000034 	andeq	r0, r0, r4, lsr r0
 2e0:	801c0e42 	andshi	r0, ip, r2, asr #28
 2e4:	82068107 	andhi	r8, r6, #-1073741823	; 0xc0000001
 2e8:	8b048305 	blhi	120f04 <_stack+0xa0f04>
 2ec:	8e028c03 	cdphi	12, 0, cr8, cr2, cr3, {0}
 2f0:	0b0c4201 	bleq	310afc <_stack+0x290afc>
 2f4:	00000004 	andeq	r0, r0, r4
 2f8:	00000024 	andeq	r0, r0, r4, lsr #32
 2fc:	00000278 	andeq	r0, r0, r8, ror r2
 300:	00008900 	andeq	r8, r0, r0, lsl #18
 304:	00000034 	andeq	r0, r0, r4, lsr r0
 308:	801c0e42 	andshi	r0, ip, r2, asr #28
 30c:	82068107 	andhi	r8, r6, #-1073741823	; 0xc0000001
 310:	8b048305 	blhi	120f2c <_stack+0xa0f2c>
 314:	8e028c03 	cdphi	12, 0, cr8, cr2, cr3, {0}
 318:	0b0c4201 	bleq	310b24 <_stack+0x290b24>
 31c:	00000004 	andeq	r0, r0, r4
 320:	00000024 	andeq	r0, r0, r4, lsr #32
 324:	00000278 	andeq	r0, r0, r8, ror r2
 328:	00008934 	andeq	r8, r0, r4, lsr r9
 32c:	00000038 	andeq	r0, r0, r8, lsr r0
 330:	801c0e44 	andshi	r0, ip, r4, asr #28
 334:	82068107 	andhi	r8, r6, #-1073741823	; 0xc0000001
 338:	8b048305 	blhi	120f54 <_stack+0xa0f54>
 33c:	8e028c03 	cdphi	12, 0, cr8, cr2, cr3, {0}
 340:	0b0c4201 	bleq	310b4c <_stack+0x290b4c>
 344:	00000004 	andeq	r0, r0, r4
 348:	00000024 	andeq	r0, r0, r4, lsr #32
 34c:	00000278 	andeq	r0, r0, r8, ror r2
 350:	0000896c 	andeq	r8, r0, ip, ror #18
 354:	00000038 	andeq	r0, r0, r8, lsr r0
 358:	801c0e44 	andshi	r0, ip, r4, asr #28
 35c:	82068107 	andhi	r8, r6, #-1073741823	; 0xc0000001
 360:	8b048305 	blhi	120f7c <_stack+0xa0f7c>
 364:	8e028c03 	cdphi	12, 0, cr8, cr2, cr3, {0}
 368:	0b0c4201 	bleq	310b74 <_stack+0x290b74>
 36c:	00000004 	andeq	r0, r0, r4
 370:	00000028 	andeq	r0, r0, r8, lsr #32
 374:	00000278 	andeq	r0, r0, r8, ror r2
 378:	000089a4 	andeq	r8, r0, r4, lsr #19
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
 3a4:	00008aa8 	andeq	r8, r0, r8, lsr #21
 3a8:	00000010 	andeq	r0, r0, r0, lsl r0
 3ac:	040b0c42 	streq	r0, [fp], #-3138	; 0xfffff3be
 3b0:	000d0c44 	andeq	r0, sp, r4, asr #24
 3b4:	0000000c 	andeq	r0, r0, ip
 3b8:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 3bc:	7c020001 	stcvc	0, cr0, [r2], {1}
 3c0:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 3c4:	0000001c 	andeq	r0, r0, ip, lsl r0
 3c8:	000003b4 			; <UNDEFINED> instruction: 0x000003b4
 3cc:	00008ab8 			; <UNDEFINED> instruction: 0x00008ab8
 3d0:	00000024 	andeq	r0, r0, r4, lsr #32
 3d4:	8b040e42 	blhi	103ce4 <_stack+0x83ce4>
 3d8:	0b0d4201 	bleq	350be4 <_stack+0x2d0be4>
 3dc:	420d0d48 	andmi	r0, sp, #72, 26	; 0x1200
 3e0:	00000ecb 	andeq	r0, r0, fp, asr #29
 3e4:	0000001c 	andeq	r0, r0, ip, lsl r0
 3e8:	000003b4 			; <UNDEFINED> instruction: 0x000003b4
 3ec:	00008adc 	ldrdeq	r8, [r0], -ip
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
 41c:	00008b34 	andeq	r8, r0, r4, lsr fp
 420:	00000024 	andeq	r0, r0, r4, lsr #32
 424:	8b040e42 	blhi	103d34 <_stack+0x83d34>
 428:	0b0d4201 	bleq	350c34 <_stack+0x2d0c34>
 42c:	420d0d48 	andmi	r0, sp, #72, 26	; 0x1200
 430:	00000ecb 	andeq	r0, r0, fp, asr #29
 434:	0000001c 	andeq	r0, r0, ip, lsl r0
 438:	00000404 	andeq	r0, r0, r4, lsl #8
 43c:	00008b58 	andeq	r8, r0, r8, asr fp
 440:	00000024 	andeq	r0, r0, r4, lsr #32
 444:	8b040e42 	blhi	103d54 <_stack+0x83d54>
 448:	0b0d4201 	bleq	350c54 <_stack+0x2d0c54>
 44c:	420d0d48 	andmi	r0, sp, #72, 26	; 0x1200
 450:	00000ecb 	andeq	r0, r0, fp, asr #29
 454:	0000001c 	andeq	r0, r0, ip, lsl r0
 458:	00000404 	andeq	r0, r0, r4, lsl #8
 45c:	00008b7c 	andeq	r8, r0, ip, ror fp
 460:	0000013c 	andeq	r0, r0, ip, lsr r1
 464:	8b080e42 	blhi	203d74 <_stack+0x183d74>
 468:	42018e02 	andmi	r8, r1, #2, 28
 46c:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
 470:	080d0c92 	stmdaeq	sp, {r1, r4, r7, sl, fp}
 474:	0000001c 	andeq	r0, r0, ip, lsl r0
 478:	00000404 	andeq	r0, r0, r4, lsl #8
 47c:	00008cb8 			; <UNDEFINED> instruction: 0x00008cb8
 480:	00000054 	andeq	r0, r0, r4, asr r0
 484:	8b040e42 	blhi	103d94 <_stack+0x83d94>
 488:	0b0d4201 	bleq	350c94 <_stack+0x2d0c94>
 48c:	420d0d60 	andmi	r0, sp, #96, 26	; 0x1800
 490:	00000ecb 	andeq	r0, r0, fp, asr #29
 494:	0000001c 	andeq	r0, r0, ip, lsl r0
 498:	00000404 	andeq	r0, r0, r4, lsl #8
 49c:	00008d0c 	andeq	r8, r0, ip, lsl #26
 4a0:	00000064 	andeq	r0, r0, r4, rrx
 4a4:	8b080e42 	blhi	203db4 <_stack+0x183db4>
 4a8:	42018e02 	andmi	r8, r1, #2, 28
 4ac:	6c040b0c 			; <UNDEFINED> instruction: 0x6c040b0c
 4b0:	00080d0c 	andeq	r0, r8, ip, lsl #26
 4b4:	0000001c 	andeq	r0, r0, ip, lsl r0
 4b8:	00000404 	andeq	r0, r0, r4, lsl #8
 4bc:	00008d70 	andeq	r8, r0, r0, ror sp
 4c0:	00000048 	andeq	r0, r0, r8, asr #32
 4c4:	8b080e42 	blhi	203dd4 <_stack+0x183dd4>
 4c8:	42018e02 	andmi	r8, r1, #2, 28
 4cc:	5e040b0c 	vmlapl.f64	d0, d4, d12
 4d0:	00080d0c 	andeq	r0, r8, ip, lsl #26
 4d4:	0000001c 	andeq	r0, r0, ip, lsl r0
 4d8:	00000404 	andeq	r0, r0, r4, lsl #8
 4dc:	00008db8 			; <UNDEFINED> instruction: 0x00008db8
 4e0:	00000038 	andeq	r0, r0, r8, lsr r0
 4e4:	8b080e42 	blhi	203df4 <_stack+0x183df4>
 4e8:	42018e02 	andmi	r8, r1, #2, 28
 4ec:	54040b0c 	strpl	r0, [r4], #-2828	; 0xfffff4f4
 4f0:	00080d0c 	andeq	r0, r8, ip, lsl #26
 4f4:	0000001c 	andeq	r0, r0, ip, lsl r0
 4f8:	00000404 	andeq	r0, r0, r4, lsl #8
 4fc:	00008df0 	strdeq	r8, [r0], -r0
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
 52c:	00008ed0 	ldrdeq	r8, [r0], -r0
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
 558:	00008f78 	andeq	r8, r0, r8, ror pc
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
 588:	00009044 	andeq	r9, r0, r4, asr #32
 58c:	00000044 	andeq	r0, r0, r4, asr #32
 590:	8b040e42 	blhi	103ea0 <_stack+0x83ea0>
 594:	0b0d4201 	bleq	350da0 <_stack+0x2d0da0>
 598:	420d0d5a 	andmi	r0, sp, #5760	; 0x1680
 59c:	00000ecb 	andeq	r0, r0, fp, asr #29
 5a0:	0000001c 	andeq	r0, r0, ip, lsl r0
 5a4:	00000570 	andeq	r0, r0, r0, ror r5
 5a8:	00009088 	andeq	r9, r0, r8, lsl #1
 5ac:	000000e4 	andeq	r0, r0, r4, ror #1
 5b0:	8b040e42 	blhi	103ec0 <_stack+0x83ec0>
 5b4:	0b0d4201 	bleq	350dc0 <_stack+0x2d0dc0>
 5b8:	0d0d6a02 	vstreq	s12, [sp, #-8]
 5bc:	000ecb42 	andeq	ip, lr, r2, asr #22
 5c0:	0000001c 	andeq	r0, r0, ip, lsl r0
 5c4:	00000570 	andeq	r0, r0, r0, ror r5
 5c8:	0000916c 	andeq	r9, r0, ip, ror #2
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
 5f8:	00009270 	andeq	r9, r0, r0, ror r2
 5fc:	00000028 	andeq	r0, r0, r8, lsr #32
 600:	8b040e42 	blhi	103f10 <_stack+0x83f10>
 604:	0b0d4201 	bleq	350e10 <_stack+0x2d0e10>
 608:	420d0d4c 	andmi	r0, sp, #76, 26	; 0x1300
 60c:	00000ecb 	andeq	r0, r0, fp, asr #29
 610:	0000001c 	andeq	r0, r0, ip, lsl r0
 614:	000005e0 	andeq	r0, r0, r0, ror #11
 618:	00009298 	muleq	r0, r8, r2
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
      d8:	6e75006f 	cdpvs	0, 7, cr0, cr5, cr15, {3}
      dc:	6e676973 			; <UNDEFINED> instruction: 0x6e676973
      e0:	63206465 			; <UNDEFINED> instruction: 0x63206465
      e4:	00726168 	rsbseq	r6, r2, r8, ror #2
      e8:	726f6873 	rsbvc	r6, pc, #7536640	; 0x730000
      ec:	6e752074 	mrcvs	0, 3, r2, cr5, cr4, {3}
      f0:	6e676973 			; <UNDEFINED> instruction: 0x6e676973
      f4:	69206465 	stmdbvs	r0!, {r0, r2, r5, r6, sl, sp, lr}
      f8:	6400746e 	strvs	r7, [r0], #-1134	; 0xfffffb92
      fc:	796d6d75 	stmdbvc	sp!, {r0, r2, r4, r5, r6, r8, sl, fp, sp, lr}^
     100:	7300615f 	movwvc	r6, #351	; 0x15f
     104:	6e697274 	mcrvs	2, 3, r7, cr9, cr4, {3}
     108:	656e4f67 	strbvs	r4, [lr, #-3943]!	; 0xfffff099
     10c:	6e6f6c00 	cdpvs	12, 6, cr6, cr15, cr0, {0}
     110:	6f6c2067 	svcvs	0x006c2067
     114:	7520676e 	strvc	r6, [r0, #-1902]!	; 0xfffff892
     118:	6769736e 	strbvs	r7, [r9, -lr, ror #6]!
     11c:	2064656e 	rsbcs	r6, r4, lr, ror #10
     120:	00746e69 	rsbseq	r6, r4, r9, ror #28
     124:	657a6973 	ldrbvs	r6, [sl, #-2419]!	; 0xfffff68d
     128:	65707974 	ldrbvs	r7, [r0, #-2420]!	; 0xfffff68c
     12c:	6e6f6c00 	cdpvs	12, 6, cr6, cr15, cr0, {0}
     130:	6f6c2067 	svcvs	0x006c2067
     134:	6920676e 	stmdbvs	r0!, {r1, r2, r3, r5, r6, r8, r9, sl, sp, lr}
     138:	7300746e 	movwvc	r7, #1134	; 0x46e
     13c:	74726f68 	ldrbtvc	r6, [r2], #-3944	; 0xfffff098
     140:	746e6920 	strbtvc	r6, [lr], #-2336	; 0xfffff6e0
     144:	6f682f00 	svcvs	0x00682f00
     148:	612f656d 			; <UNDEFINED> instruction: 0x612f656d
     14c:	6b696462 	blvs	1a592dc <_stack+0x19d92dc>
     150:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
     154:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
     158:	4c794d2f 	ldclmi	13, cr4, [r9], #-188	; 0xffffff44
     15c:	6c747469 	cfldrdvs	mvd7, [r4], #-420	; 0xfffffe5c
     160:	2f534f65 	svccs	0x00534f65
     164:	2f637273 	svccs	0x00637273
     168:	6d6d7564 	cfstr64vs	mvdx7, [sp, #-400]!	; 0xfffffe70
     16c:	00632e79 	rsbeq	r2, r3, r9, ror lr
     170:	69727473 	ldmdbvs	r2!, {r0, r1, r4, r5, r6, sl, ip, sp, lr}^
     174:	7754676e 	ldrbvc	r6, [r4, -lr, ror #14]
     178:	656d006f 	strbvs	r0, [sp, #-111]!	; 0xffffff91
     17c:	67617373 			; <UNDEFINED> instruction: 0x67617373
     180:	70720065 	rsbsvc	r0, r2, r5, rrx
     184:	65725f69 	ldrbvs	r5, [r2, #-3945]!	; 0xfffff097
     188:	77725f67 	ldrbvc	r5, [r2, -r7, ror #30]!
     18c:	6100745f 	tstvs	r0, pc, asr r4
     190:	73676174 	cmnvc	r7, #116, 2
     194:	77656e00 	strbvc	r6, [r5, -r0, lsl #28]!
     198:	636f7250 	cmnvs	pc, #80, 4
     19c:	61747300 	cmnvs	r4, r0, lsl #6
     1a0:	6e697472 	mcrvs	4, 3, r7, cr9, cr2, {3}
     1a4:	6f725067 	svcvs	0x00725067
     1a8:	73736563 	cmnvc	r3, #415236096	; 0x18c00000
     1ac:	00727453 	rsbseq	r7, r2, r3, asr r4
     1b0:	69755f5f 	ldmdbvs	r5!, {r0, r1, r2, r3, r4, r6, r8, r9, sl, fp, ip, lr}^
     1b4:	3233746e 	eorscc	r7, r3, #1845493760	; 0x6e000000
     1b8:	2f00745f 	svccs	0x0000745f
     1bc:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
     1c0:	6462612f 	strbtvs	r6, [r2], #-303	; 0xfffffed1
     1c4:	72616b69 	rsbvc	r6, r1, #107520	; 0x1a400
     1c8:	642f6d69 	strtvs	r6, [pc], #-3433	; 1d0 <CPSR_IRQ_INHIBIT+0x150>
     1cc:	4d2f7665 	stcmi	6, cr7, [pc, #-404]!	; 40 <CPSR_FIQ_INHIBIT>
     1d0:	74694c79 	strbtvc	r4, [r9], #-3193	; 0xfffff387
     1d4:	4f656c74 	svcmi	0x00656c74
     1d8:	72732f53 	rsbsvc	r2, r3, #332	; 0x14c
     1dc:	656b2f63 	strbvs	r2, [fp, #-3939]!	; 0xfffff09d
     1e0:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
     1e4:	6500632e 	strvs	r6, [r0, #-814]	; 0xfffffcd2
     1e8:	70656378 	rsbvc	r6, r5, r8, ror r3
     1ec:	6e6f6974 			; <UNDEFINED> instruction: 0x6e6f6974
     1f0:	6f727000 	svcvs	0x00727000
     1f4:	73736563 	cmnvc	r3, #415236096	; 0x18c00000
     1f8:	67657200 	strbvs	r7, [r5, -r0, lsl #4]!
     1fc:	65720073 	ldrbvs	r0, [r2, #-115]!	; 0xffffff8d
     200:	74736967 	ldrbtvc	r6, [r3], #-2407	; 0xfffff699
     204:	00737265 	rsbseq	r7, r3, r5, ror #4
     208:	61657263 	cmnvs	r5, r3, ror #4
     20c:	72506574 	subsvc	r6, r0, #116, 10	; 0x1d000000
     210:	7365636f 	cmnvc	r5, #-1140850687	; 0xbc000001
     214:	72745373 	rsbsvc	r5, r4, #-872415231	; 0xcc000001
     218:	72656b00 	rsbvc	r6, r5, #0, 22
     21c:	5f6c656e 	svcpl	0x006c656e
     220:	6e69616d 	powvsez	f6, f1, #5.0
     224:	756f7200 	strbvc	r7, [pc, #-512]!	; 2c <CPSR_THUMB+0xc>
     228:	6465646e 	strbtvs	r6, [r5], #-1134	; 0xfffffb92
     22c:	6f6c625f 	svcvs	0x006c625f
     230:	735f6b63 	cmpvc	pc, #101376	; 0x18c00
     234:	00657a69 	rsbeq	r7, r5, r9, ror #20
     238:	657a6973 	ldrbvs	r6, [sl, #-2419]!	; 0xfffff68d
     23c:	7300745f 	movwvc	r7, #1119	; 0x45f
     240:	6f6c625f 	svcvs	0x006c625f
     244:	625f6b63 	subsvs	r6, pc, #101376	; 0x18c00
     248:	656b6375 	strbvs	r6, [fp, #-885]!	; 0xfffffc8b
     24c:	656e0074 	strbvs	r0, [lr, #-116]!	; 0xffffff8c
     250:	625f7478 	subsvs	r7, pc, #120, 8	; 0x78000000
     254:	6b636f6c 	blvs	18dc00c <_stack+0x185c00c>
     258:	65726600 	ldrbvs	r6, [r2, #-1536]!	; 0xfffffa00
     25c:	65685f65 	strbvs	r5, [r8, #-3941]!	; 0xfffff09b
     260:	72656461 	rsbvc	r6, r5, #1627389952	; 0x61000000
     264:	6f682f00 	svcvs	0x00682f00
     268:	612f656d 			; <UNDEFINED> instruction: 0x612f656d
     26c:	6b696462 	blvs	1a593fc <_stack+0x19d93fc>
     270:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
     274:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
     278:	4c794d2f 	ldclmi	13, cr4, [r9], #-188	; 0xffffff44
     27c:	6c747469 	cfldrdvs	mvd7, [r4], #-420	; 0xfffffe5c
     280:	2f534f65 	svccs	0x00534f65
     284:	2f637273 	svccs	0x00637273
     288:	6c6c616d 	stfvse	f6, [ip], #-436	; 0xfffffe4c
     28c:	632e636f 			; <UNDEFINED> instruction: 0x632e636f
     290:	6f6c6200 	svcvs	0x006c6200
     294:	685f6b63 	ldmdavs	pc, {r0, r1, r5, r6, r8, r9, fp, sp, lr}^	; <UNPREDICTABLE>
     298:	65646165 	strbvs	r6, [r4, #-357]!	; 0xfffffe9b
     29c:	6c620072 	stclvs	0, cr0, [r2], #-456	; 0xfffffe38
     2a0:	5f6b636f 	svcpl	0x006b636f
     2a4:	696d696c 	stmdbvs	sp!, {r2, r3, r5, r6, r8, fp, sp, lr}^
     2a8:	685f0074 	ldmdavs	pc, {r2, r4, r5, r6}^	; <UNPREDICTABLE>
     2ac:	5f706165 	svcpl	0x00706165
     2b0:	00776f6c 	rsbseq	r6, r7, ip, ror #30
     2b4:	6967616d 	stmdbvs	r7!, {r0, r2, r3, r5, r6, r8, sp, lr}^
     2b8:	75630063 	strbvc	r0, [r3, #-99]!	; 0xffffff9d
     2bc:	6e657272 	mcrvs	2, 3, r7, cr5, cr2, {3}
     2c0:	75725f74 	ldrbvc	r5, [r2, #-3956]!	; 0xfffff08c
     2c4:	6e696e6e 	cdpvs	14, 6, cr6, cr9, cr14, {3}
     2c8:	72705f67 	rsbsvc	r5, r0, #412	; 0x19c
     2cc:	2f00636f 	svccs	0x0000636f
     2d0:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
     2d4:	6462612f 	strbtvs	r6, [r2], #-303	; 0xfffffed1
     2d8:	72616b69 	rsbvc	r6, r1, #107520	; 0x1a400
     2dc:	642f6d69 	strtvs	r6, [pc], #-3433	; 2e4 <CPSR_IRQ_INHIBIT+0x264>
     2e0:	4d2f7665 	stcmi	6, cr7, [pc, #-404]!	; 154 <CPSR_IRQ_INHIBIT+0xd4>
     2e4:	74694c79 	strbtvc	r4, [r9], #-3193	; 0xfffff387
     2e8:	4f656c74 	svcmi	0x00656c74
     2ec:	72732f53 	rsbsvc	r2, r3, #332	; 0x14c
     2f0:	72702f63 	rsbsvc	r2, r0, #396	; 0x18c
     2f4:	7365636f 	cmnvc	r5, #-1140850687	; 0xbc000001
     2f8:	00632e73 	rsbeq	r2, r3, r3, ror lr
     2fc:	41746567 	cmnmi	r4, r7, ror #10
     300:	6c696176 	stfvse	f6, [r9], #-472	; 0xfffffe28
     304:	656c6261 	strbvs	r6, [ip, #-609]!	; 0xfffffd9f
     308:	00424350 	subeq	r4, r2, r0, asr r3
     30c:	52746567 	rsbspl	r6, r4, #432013312	; 0x19c00000
     310:	696e6e75 	stmdbvs	lr!, {r0, r2, r4, r5, r6, r9, sl, fp, sp, lr}^
     314:	7250676e 	subsvc	r6, r0, #28835840	; 0x1b80000
     318:	7365636f 	cmnvc	r5, #-1140850687	; 0xbc000001
     31c:	72700073 	rsbsvc	r0, r0, #115	; 0x73
     320:	7450636f 	ldrbvc	r6, [r0], #-879	; 0xfffffc91
     324:	72630072 	rsbvc	r0, r3, #114	; 0x72
     328:	65746165 	ldrbvs	r6, [r4, #-357]!	; 0xfffffe9b
     32c:	636f7250 	cmnvs	pc, #80, 4
     330:	00737365 	rsbseq	r7, r3, r5, ror #6
     334:	50626370 	rsbpl	r6, r2, r0, ror r3
     338:	67007274 	smlsdxvs	r0, r4, r2, r7
     33c:	654e7465 	strbvs	r7, [lr, #-1125]	; 0xfffffb9b
     340:	72507478 	subsvc	r7, r0, #120, 8	; 0x78000000
     344:	7365636f 	cmnvc	r5, #-1140850687	; 0xbc000001
     348:	65730073 	ldrbvs	r0, [r3, #-115]!	; 0xffffff8d
     34c:	6e755274 	mrcvs	2, 3, r5, cr5, cr4, {3}
     350:	676e696e 	strbvs	r6, [lr, -lr, ror #18]!
     354:	636f7250 	cmnvs	pc, #80, 4
     358:	00737365 	rsbseq	r7, r3, r5, ror #6
     35c:	64616f4c 	strbtvs	r6, [r1], #-3916	; 0xfffff0b4
     360:	6c655200 	sfmvs	f5, 2, [r5], #-0
     364:	0064616f 	rsbeq	r6, r4, pc, ror #2
     368:	5f495052 	svcpl	0x00495052
     36c:	41746547 	cmnmi	r4, r7, asr #10
     370:	69546d72 	ldmdbvs	r4, {r1, r4, r5, r6, r8, sl, fp, sp, lr}^
     374:	0072656d 	rsbseq	r6, r2, sp, ror #10
     378:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; 2c4 <CPSR_IRQ_INHIBIT+0x244>
     37c:	62612f65 	rsbvs	r2, r1, #404	; 0x194
     380:	616b6964 	cmnvs	fp, r4, ror #18
     384:	2f6d6972 	svccs	0x006d6972
     388:	2f766564 	svccs	0x00766564
     38c:	694c794d 	stmdbvs	ip, {r0, r2, r3, r6, r8, fp, ip, sp, lr}^
     390:	656c7474 	strbvs	r7, [ip, #-1140]!	; 0xfffffb8c
     394:	732f534f 			; <UNDEFINED> instruction: 0x732f534f
     398:	722f6372 	eorvc	r6, pc, #-939524095	; 0xc8000001
     39c:	612d6970 			; <UNDEFINED> instruction: 0x612d6970
     3a0:	69746d72 	ldmdbvs	r4!, {r1, r4, r5, r6, r8, sl, fp, sp, lr}^
     3a4:	2e72656d 	cdpcs	5, 7, cr6, cr2, cr13, {3}
     3a8:	70720063 	rsbsvc	r0, r2, r3, rrx
     3ac:	72615f69 	rsbvc	r5, r1, #420	; 0x1a4
     3b0:	69745f6d 	ldmdbvs	r4!, {r0, r2, r3, r5, r6, r8, r9, sl, fp, ip, lr}^
     3b4:	5f72656d 	svcpl	0x0072656d
     3b8:	70720074 	rsbsvc	r0, r2, r4, ror r0
     3bc:	6d724169 	ldfvse	f4, [r2, #-420]!	; 0xfffffe5c
     3c0:	656d6954 	strbvs	r6, [sp, #-2388]!	; 0xfffff6ac
     3c4:	41520072 	cmpmi	r2, r2, ror r0
     3c8:	51524957 	cmppl	r2, r7, asr r9
     3cc:	73614d00 	cmnvc	r1, #0, 26
     3d0:	4964656b 	stmdbmi	r4!, {r0, r1, r3, r5, r6, r8, sl, sp, lr}^
     3d4:	56005152 			; <UNDEFINED> instruction: 0x56005152
     3d8:	65756c61 	ldrbvs	r6, [r5, #-3169]!	; 0xfffff39f
     3dc:	65725000 	ldrbvs	r5, [r2, #-0]!
     3e0:	69766944 	ldmdbvs	r6!, {r2, r6, r8, fp, sp, lr}^
     3e4:	00726564 	rsbseq	r6, r2, r4, ror #10
     3e8:	65657246 	strbvs	r7, [r5, #-582]!	; 0xfffffdba
     3ec:	6e6e7552 	mcrvs	5, 3, r7, cr14, cr2, {2}
     3f0:	43676e69 	cmnmi	r7, #1680	; 0x690
     3f4:	746e756f 	strbtvc	r7, [lr], #-1391	; 0xfffffa91
     3f8:	43007265 	movwmi	r7, #613	; 0x265
     3fc:	72746e6f 	rsbsvc	r6, r4, #1776	; 0x6f0
     400:	52006c6f 	andpl	r6, r0, #28416	; 0x6f00
     404:	415f4950 	cmpmi	pc, r0, asr r9	; <UNPREDICTABLE>
     408:	69546d72 	ldmdbvs	r4, {r1, r4, r5, r6, r8, sl, fp, sp, lr}^
     40c:	4972656d 	ldmdbmi	r2!, {r0, r2, r3, r5, r6, r8, sl, sp, lr}^
     410:	0074696e 	rsbseq	r6, r4, lr, ror #18
     414:	43515249 	cmpmi	r1, #-1879048188	; 0x90000004
     418:	7261656c 	rsbvc	r6, r1, #108, 10	; 0x1b000000
     41c:	53504700 	cmppl	r0, #0, 14
     420:	00305445 	eorseq	r5, r0, r5, asr #8
     424:	45535047 	ldrbmi	r5, [r3, #-71]	; 0xffffffb9
     428:	47003154 	smlsdmi	r0, r4, r1, r3
     42c:	45534650 	ldrbmi	r4, [r3, #-1616]	; 0xfffff9b0
     430:	4700304c 	strmi	r3, [r0, -ip, asr #32]
     434:	45534650 	ldrbmi	r4, [r3, #-1616]	; 0xfffff9b0
     438:	4700314c 	strmi	r3, [r0, -ip, asr #2]
     43c:	45534650 	ldrbmi	r4, [r3, #-1616]	; 0xfffff9b0
     440:	4700324c 	strmi	r3, [r0, -ip, asr #4]
     444:	45534650 	ldrbmi	r4, [r3, #-1616]	; 0xfffff9b0
     448:	4700334c 	strmi	r3, [r0, -ip, asr #6]
     44c:	45534650 	ldrbmi	r4, [r3, #-1616]	; 0xfffff9b0
     450:	4700344c 	strmi	r3, [r0, -ip, asr #8]
     454:	45534650 	ldrbmi	r4, [r3, #-1616]	; 0xfffff9b0
     458:	4700354c 	strmi	r3, [r0, -ip, asr #10]
     45c:	4e454650 	mcrmi	6, 2, r4, cr5, cr0, {2}
     460:	70720031 	rsbsvc	r0, r2, r1, lsr r0
     464:	69704769 	ldmdbvs	r0!, {r0, r3, r5, r6, r8, r9, sl, lr}^
     468:	5052006f 	subspl	r0, r2, pc, rrx
     46c:	50475f49 	subpl	r5, r7, r9, asr #30
     470:	30344f49 	eorscc	r4, r4, r9, asr #30
     474:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     478:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     47c:	0032344f 	eorseq	r3, r2, pc, asr #8
     480:	5f495052 	svcpl	0x00495052
     484:	4f495047 	svcmi	0x00495047
     488:	52003334 	andpl	r3, r0, #52, 6	; 0xd0000000
     48c:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     490:	344f4950 	strbcc	r4, [pc], #-2384	; 498 <CPSR_IRQ_INHIBIT+0x418>
     494:	50520034 	subspl	r0, r2, r4, lsr r0
     498:	50475f49 	subpl	r5, r7, r9, asr #30
     49c:	35344f49 	ldrcc	r4, [r4, #-3913]!	; 0xfffff0b7
     4a0:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     4a4:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     4a8:	0036344f 	eorseq	r3, r6, pc, asr #8
     4ac:	5f495052 	svcpl	0x00495052
     4b0:	4f495047 	svcmi	0x00495047
     4b4:	52003734 	andpl	r3, r0, #52, 14	; 0xd00000
     4b8:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     4bc:	344f4950 	strbcc	r4, [pc], #-2384	; 4c4 <CPSR_IRQ_INHIBIT+0x444>
     4c0:	50520038 	subspl	r0, r2, r8, lsr r0
     4c4:	50475f49 	subpl	r5, r7, r9, asr #30
     4c8:	39344f49 	ldmdbcc	r4!, {r0, r3, r6, r8, r9, sl, fp, lr}
     4cc:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     4d0:	6970475f 	ldmdbvs	r0!, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     4d4:	696e496f 	stmdbvs	lr!, {r0, r1, r2, r3, r5, r6, r8, fp, lr}^
     4d8:	50470074 	subpl	r0, r7, r4, ror r0
     4dc:	304e4552 	subcc	r4, lr, r2, asr r5
     4e0:	52504700 	subspl	r4, r0, #0, 14
     4e4:	00314e45 	eorseq	r4, r1, r5, asr #28
     4e8:	45485047 	strbmi	r5, [r8, #-71]	; 0xffffffb9
     4ec:	5200304e 	andpl	r3, r0, #78	; 0x4e
     4f0:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     4f4:	324f4950 	subcc	r4, pc, #80, 18	; 0x140000
     4f8:	50520030 	subspl	r0, r2, r0, lsr r0
     4fc:	65535f49 	ldrbvs	r5, [r3, #-3913]	; 0xfffff0b7
     500:	69704774 	ldmdbvs	r0!, {r2, r4, r5, r6, r8, r9, sl, lr}^
     504:	6e69506f 	cdpvs	0, 6, cr5, cr9, cr15, {3}
     508:	636e7546 	cmnvs	lr, #293601280	; 0x11800000
     50c:	6e6f6974 			; <UNDEFINED> instruction: 0x6e6f6974
     510:	73655200 	cmnvc	r5, #0, 4
     514:	65767265 	ldrbvs	r7, [r6, #-613]!	; 0xfffffd9b
     518:	52003064 	andpl	r3, r0, #100	; 0x64
     51c:	72657365 	rsbvc	r7, r5, #-1811939327	; 0x94000001
     520:	31646576 	smccc	18006	; 0x4656
     524:	73655200 	cmnvc	r5, #0, 4
     528:	65767265 	ldrbvs	r7, [r6, #-613]!	; 0xfffffd9b
     52c:	52003264 	andpl	r3, r0, #100, 4	; 0x40000006
     530:	72657365 	rsbvc	r7, r5, #-1811939327	; 0x94000001
     534:	33646576 	cmncc	r4, #494927872	; 0x1d800000
     538:	73655200 	cmnvc	r5, #0, 4
     53c:	65767265 	ldrbvs	r7, [r6, #-613]!	; 0xfffffd9b
     540:	47003564 	strmi	r3, [r0, -r4, ror #10]
     544:	53444550 	movtpl	r4, #17744	; 0x4550
     548:	50470030 	subpl	r0, r7, r0, lsr r0
     54c:	31534445 	cmpcc	r3, r5, asr #8
     550:	73655200 	cmnvc	r5, #0, 4
     554:	65767265 	ldrbvs	r7, [r6, #-613]!	; 0xfffffd9b
     558:	52003864 	andpl	r3, r0, #100, 16	; 0x640000
     55c:	72657365 	rsbvc	r7, r5, #-1811939327	; 0x94000001
     560:	39646576 	stmdbcc	r4!, {r1, r2, r4, r5, r6, r8, sl, sp, lr}^
     564:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     568:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     56c:	0031344f 	eorseq	r3, r1, pc, asr #8
     570:	5f495052 	svcpl	0x00495052
     574:	4f495047 	svcmi	0x00495047
     578:	52003031 	andpl	r3, r0, #49	; 0x31
     57c:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     580:	314f4950 	cmpcc	pc, r0, asr r9	; <UNPREDICTABLE>
     584:	50520031 	subspl	r0, r2, r1, lsr r0
     588:	50475f49 	subpl	r5, r7, r9, asr #30
     58c:	32314f49 	eorscc	r4, r1, #292	; 0x124
     590:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     594:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     598:	0033314f 	eorseq	r3, r3, pc, asr #2
     59c:	5f495052 	svcpl	0x00495052
     5a0:	4f495047 	svcmi	0x00495047
     5a4:	52003431 	andpl	r3, r0, #822083584	; 0x31000000
     5a8:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     5ac:	314f4950 	cmpcc	pc, r0, asr r9	; <UNPREDICTABLE>
     5b0:	50520035 	subspl	r0, r2, r5, lsr r0
     5b4:	50475f49 	subpl	r5, r7, r9, asr #30
     5b8:	36314f49 	ldrtcc	r4, [r1], -r9, asr #30
     5bc:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     5c0:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     5c4:	0037314f 	eorseq	r3, r7, pc, asr #2
     5c8:	5f495052 	svcpl	0x00495052
     5cc:	4f495047 	svcmi	0x00495047
     5d0:	52003831 	andpl	r3, r0, #3211264	; 0x310000
     5d4:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     5d8:	314f4950 	cmpcc	pc, r0, asr r9	; <UNPREDICTABLE>
     5dc:	73660039 	cmnvc	r6, #57	; 0x39
     5e0:	725f6c65 	subsvc	r6, pc, #25856	; 0x6500
     5e4:	52006765 	andpl	r6, r0, #26476544	; 0x1940000
     5e8:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     5ec:	354f4950 	strbcc	r4, [pc, #-2384]	; fffffca4 <CPSR_UNAFFECTED_BITS+0xfffffda4>
     5f0:	50520030 	subspl	r0, r2, r0, lsr r0
     5f4:	50475f49 	subpl	r5, r7, r9, asr #30
     5f8:	31354f49 	teqcc	r5, r9, asr #30
     5fc:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     600:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     604:	0033354f 	eorseq	r3, r3, pc, asr #10
     608:	55505047 	ldrbpl	r5, [r0, #-71]	; 0xffffffb9
     60c:	50520044 	subspl	r0, r2, r4, asr #32
     610:	65475f49 	strbvs	r5, [r7, #-3913]	; 0xfffff0b7
     614:	69704774 	ldmdbvs	r0!, {r2, r4, r5, r6, r8, r9, sl, lr}^
     618:	7072006f 	rsbsvc	r0, r2, pc, rrx
     61c:	70675f69 	rsbvc	r5, r7, r9, ror #30
     620:	705f6f69 	subsvc	r6, pc, r9, ror #30
     624:	745f6e69 	ldrbvc	r6, [pc], #-3689	; 62c <CPSR_IRQ_INHIBIT+0x5ac>
     628:	4c504700 	mrrcmi	7, 0, r4, r0, cr0
     62c:	00304e45 	eorseq	r4, r0, r5, asr #28
     630:	46415047 	strbmi	r5, [r1], -r7, asr #32
     634:	00304e45 	eorseq	r4, r0, r5, asr #28
     638:	46415047 	strbmi	r5, [r1], -r7, asr #32
     63c:	00314e45 	eorseq	r4, r1, r5, asr #28
     640:	5f495052 	svcpl	0x00495052
     644:	4f495047 	svcmi	0x00495047
     648:	50520030 	subspl	r0, r2, r0, lsr r0
     64c:	50475f49 	subpl	r5, r7, r9, asr #30
     650:	00314f49 	eorseq	r4, r1, r9, asr #30
     654:	5f495052 	svcpl	0x00495052
     658:	4f495047 	svcmi	0x00495047
     65c:	50520032 	subspl	r0, r2, r2, lsr r0
     660:	50475f49 	subpl	r5, r7, r9, asr #30
     664:	00344f49 	eorseq	r4, r4, r9, asr #30
     668:	5f495052 	svcpl	0x00495052
     66c:	4f495047 	svcmi	0x00495047
     670:	50520035 	subspl	r0, r2, r5, lsr r0
     674:	50475f49 	subpl	r5, r7, r9, asr #30
     678:	00364f49 	eorseq	r4, r6, r9, asr #30
     67c:	4f5f5346 	svcmi	0x005f5346
     680:	55505455 	ldrbpl	r5, [r0, #-1109]	; 0xfffffbab
     684:	50520054 	subspl	r0, r2, r4, asr r0
     688:	50475f49 	subpl	r5, r7, r9, asr #30
     68c:	00384f49 	eorseq	r4, r8, r9, asr #30
     690:	5f495052 	svcpl	0x00495052
     694:	4f495047 	svcmi	0x00495047
     698:	50470039 	subpl	r0, r7, r9, lsr r0
     69c:	31524c43 	cmpcc	r2, r3, asr #24
     6a0:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
     6a4:	6765725f 			; <UNDEFINED> instruction: 0x6765725f
     6a8:	5f6f725f 	svcpl	0x006f725f
     6ac:	50520074 	subspl	r0, r2, r4, ror r0
     6b0:	50475f49 	subpl	r5, r7, r9, asr #30
     6b4:	31324f49 	teqcc	r2, r9, asr #30
     6b8:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     6bc:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     6c0:	0032324f 	eorseq	r3, r2, pc, asr #4
     6c4:	5f495052 	svcpl	0x00495052
     6c8:	4f495047 	svcmi	0x00495047
     6cc:	52003332 	andpl	r3, r0, #-939524096	; 0xc8000000
     6d0:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     6d4:	324f4950 	subcc	r4, pc, #80, 18	; 0x140000
     6d8:	50520034 	subspl	r0, r2, r4, lsr r0
     6dc:	50475f49 	subpl	r5, r7, r9, asr #30
     6e0:	35324f49 	ldrcc	r4, [r2, #-3913]!	; 0xfffff0b7
     6e4:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     6e8:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     6ec:	0036324f 	eorseq	r3, r6, pc, asr #4
     6f0:	5f495052 	svcpl	0x00495052
     6f4:	4f495047 	svcmi	0x00495047
     6f8:	52003732 	andpl	r3, r0, #13107200	; 0xc80000
     6fc:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     700:	324f4950 	subcc	r4, pc, #80, 18	; 0x140000
     704:	50520038 	subspl	r0, r2, r8, lsr r0
     708:	50475f49 	subpl	r5, r7, r9, asr #30
     70c:	39324f49 	ldmdbcc	r2!, {r0, r3, r6, r8, r9, sl, fp, lr}
     710:	73655200 	cmnvc	r5, #0, 4
     714:	65767265 	ldrbvs	r7, [r6, #-613]!	; 0xfffffd9b
     718:	00313164 	eorseq	r3, r1, r4, ror #2
     71c:	52415047 	subpl	r5, r1, #71	; 0x47
     720:	00304e45 	eorseq	r4, r0, r5, asr #28
     724:	454c5047 	strbmi	r5, [ip, #-71]	; 0xffffffb9
     728:	4700314e 	strmi	r3, [r0, -lr, asr #2]
     72c:	44555050 	ldrbmi	r5, [r5], #-80	; 0xffffffb0
     730:	304b4c43 	subcc	r4, fp, r3, asr #24
     734:	73655200 	cmnvc	r5, #0, 4
     738:	65767265 	ldrbvs	r7, [r6, #-613]!	; 0xfffffd9b
     73c:	00303164 	eorseq	r3, r0, r4, ror #2
     740:	52415047 	subpl	r5, r1, #71	; 0x47
     744:	00314e45 	eorseq	r4, r1, r5, asr #28
     748:	5f697072 	svcpl	0x00697072
     74c:	6f697067 	svcvs	0x00697067
     750:	746c615f 	strbtvc	r6, [ip], #-351	; 0xfffffea1
     754:	6e75665f 	mrcvs	6, 3, r6, cr5, cr15, {2}
     758:	6f697463 	svcvs	0x00697463
     75c:	00745f6e 	rsbseq	r5, r4, lr, ror #30
     760:	5f495052 	svcpl	0x00495052
     764:	4f495047 	svcmi	0x00495047
     768:	53460037 	movtpl	r0, #24631	; 0x6037
     76c:	504e495f 	subpl	r4, lr, pc, asr r9
     770:	47005455 	smlsdmi	r0, r5, r4, r5
     774:	44555050 	ldrbmi	r5, [r5], #-80	; 0xffffffb0
     778:	314b4c43 	cmpcc	fp, r3, asr #24
     77c:	6f682f00 	svcvs	0x00682f00
     780:	612f656d 			; <UNDEFINED> instruction: 0x612f656d
     784:	6b696462 	blvs	1a59914 <_stack+0x19d9914>
     788:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
     78c:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
     790:	4c794d2f 	ldclmi	13, cr4, [r9], #-188	; 0xffffff44
     794:	6c747469 	cfldrdvs	mvd7, [r4], #-420	; 0xfffffe5c
     798:	2f534f65 	svccs	0x00534f65
     79c:	2f637273 	svccs	0x00637273
     7a0:	2d697072 	stclcs	0, cr7, [r9, #-456]!	; 0xfffffe38
     7a4:	6f697067 	svcvs	0x00697067
     7a8:	5200632e 	andpl	r6, r0, #-1207959552	; 0xb8000000
     7ac:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     7b0:	334f4950 	movtcc	r4, #63824	; 0xf950
     7b4:	50470033 	subpl	r0, r7, r3, lsr r0
     7b8:	3056454c 	subscc	r4, r6, ip, asr #10
     7bc:	4c504700 	mrrcmi	7, 0, r4, r0, cr0
     7c0:	00315645 	eorseq	r5, r1, r5, asr #12
     7c4:	65736552 	ldrbvs	r6, [r3, #-1362]!	; 0xfffffaae
     7c8:	64657672 	strbtvs	r7, [r5], #-1650	; 0xfffff98e
     7cc:	50520034 	subspl	r0, r2, r4, lsr r0
     7d0:	50475f49 	subpl	r5, r7, r9, asr #30
     7d4:	37334f49 	ldrcc	r4, [r3, -r9, asr #30]!
     7d8:	73655200 	cmnvc	r5, #0, 4
     7dc:	65767265 	ldrbvs	r7, [r6, #-613]!	; 0xfffffd9b
     7e0:	47003664 	strmi	r3, [r0, -r4, ror #12]
     7e4:	4e454850 	mcrmi	8, 2, r4, cr5, cr0, {2}
     7e8:	50520031 	subspl	r0, r2, r1, lsr r0
     7ec:	50475f49 	subpl	r5, r7, r9, asr #30
     7f0:	32354f49 	eorscc	r4, r5, #292	; 0x124
     7f4:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     7f8:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     7fc:	0030334f 	eorseq	r3, r0, pc, asr #6
     800:	5f495052 	svcpl	0x00495052
     804:	4f495047 	svcmi	0x00495047
     808:	52003133 	andpl	r3, r0, #-1073741812	; 0xc000000c
     80c:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     810:	334f4950 	movtcc	r4, #63824	; 0xf950
     814:	50520032 	subspl	r0, r2, r2, lsr r0
     818:	50475f49 	subpl	r5, r7, r9, asr #30
     81c:	00334f49 	eorseq	r4, r3, r9, asr #30
     820:	5f495052 	svcpl	0x00495052
     824:	4f495047 	svcmi	0x00495047
     828:	52003433 	andpl	r3, r0, #855638016	; 0x33000000
     82c:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     830:	334f4950 	movtcc	r4, #63824	; 0xf950
     834:	50520035 	subspl	r0, r2, r5, lsr r0
     838:	50475f49 	subpl	r5, r7, r9, asr #30
     83c:	36334f49 	ldrtcc	r4, [r3], -r9, asr #30
     840:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
     844:	6765725f 			; <UNDEFINED> instruction: 0x6765725f
     848:	5f6f775f 	svcpl	0x006f775f
     84c:	50520074 	subspl	r0, r2, r4, ror r0
     850:	50475f49 	subpl	r5, r7, r9, asr #30
     854:	38334f49 	ldmdacc	r3!, {r0, r3, r6, r8, r9, sl, fp, lr}
     858:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     85c:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     860:	0039334f 	eorseq	r3, r9, pc, asr #6
     864:	65736552 	ldrbvs	r6, [r3, #-1362]!	; 0xfffffaae
     868:	64657672 	strbtvs	r7, [r5], #-1650	; 0xfffff98e
     86c:	73660037 	cmnvc	r6, #55	; 0x37
     870:	635f6c65 	cmpvs	pc, #25856	; 0x6500
     874:	0079706f 	rsbseq	r7, r9, pc, rrx
     878:	6f697067 	svcvs	0x00697067
     87c:	46504700 	ldrbmi	r4, [r0], -r0, lsl #14
     880:	00304e45 	eorseq	r4, r0, r5, asr #28
     884:	415f5346 	cmpmi	pc, r6, asr #6
     888:	0030544c 	eorseq	r5, r0, ip, asr #8
     88c:	415f5346 	cmpmi	pc, r6, asr #6
     890:	0031544c 	eorseq	r5, r1, ip, asr #8
     894:	415f5346 	cmpmi	pc, r6, asr #6
     898:	0032544c 	eorseq	r5, r2, ip, asr #8
     89c:	415f5346 	cmpmi	pc, r6, asr #6
     8a0:	0033544c 	eorseq	r5, r3, ip, asr #8
     8a4:	415f5346 	cmpmi	pc, r6, asr #6
     8a8:	0034544c 	eorseq	r5, r4, ip, asr #8
     8ac:	415f5346 	cmpmi	pc, r6, asr #6
     8b0:	0035544c 	eorseq	r5, r5, ip, asr #8
     8b4:	5f697072 	svcpl	0x00697072
     8b8:	6f697067 	svcvs	0x00697067
     8bc:	4700745f 	smlsdmi	r0, pc, r4, r7	; <UNPREDICTABLE>
     8c0:	524c4350 	subpl	r4, ip, #80, 6	; 0x40000001
     8c4:	72700030 	rsbsvc	r0, r0, #48	; 0x30
     8c8:	74656665 	strbtvc	r6, [r5], #-1637	; 0xfffff99b
     8cc:	615f6863 	cmpvs	pc, r3, ror #16
     8d0:	74726f62 	ldrbtvc	r6, [r2], #-3938	; 0xfffff09e
     8d4:	6365765f 	cmnvs	r5, #99614720	; 0x5f00000
     8d8:	00726f74 	rsbseq	r6, r2, r4, ror pc
     8dc:	5f495052 	svcpl	0x00495052
     8e0:	49746547 	ldmdbmi	r4!, {r0, r1, r2, r6, r8, sl, sp, lr}^
     8e4:	6f437172 	svcvs	0x00437172
     8e8:	6f72746e 	svcvs	0x0072746e
     8ec:	72656c6c 	rsbvc	r6, r5, #108, 24	; 0x6c00
     8f0:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
     8f4:	7172695f 	cmnvc	r2, pc, asr r9
     8f8:	6e6f635f 	mcrvs	3, 3, r6, cr15, cr15, {2}
     8fc:	6c6f7274 	sfmvs	f7, 2, [pc], #-464	; 734 <CPSR_IRQ_INHIBIT+0x6b4>
     900:	5f72656c 	svcpl	0x0072656c
     904:	70720074 	rsbsvc	r0, r2, r4, ror r0
     908:	51524969 	cmppl	r2, r9, ror #18
     90c:	746e6f43 	strbtvc	r6, [lr], #-3907	; 0xfffff0bd
     910:	6c6c6f72 	stclvs	15, cr6, [ip], #-456	; 0xfffffe38
     914:	44007265 	strmi	r7, [r0], #-613	; 0xfffffd9b
     918:	62617369 	rsbvs	r7, r1, #-1543503871	; 0xa4000001
     91c:	425f656c 	subsmi	r6, pc, #108, 10	; 0x1b000000
     920:	63697361 	cmnvs	r9, #-2080374783	; 0x84000001
     924:	5152495f 	cmppl	r2, pc, asr r9
     928:	49460073 	stmdbmi	r6, {r0, r1, r4, r5, r6}^
     92c:	6f635f51 	svcvs	0x00635f51
     930:	6f72746e 	svcvs	0x0072746e
     934:	5249006c 	subpl	r0, r9, #108	; 0x6c
     938:	61625f51 	cmnvs	r2, r1, asr pc
     93c:	5f636973 	svcpl	0x00636973
     940:	646e6570 	strbtvs	r6, [lr], #-1392	; 0xfffffa90
     944:	00676e69 	rsbeq	r6, r7, r9, ror #28
     948:	69727473 	ldmdbvs	r2!, {r0, r1, r4, r5, r6, sl, ip, sp, lr}^
     94c:	4500676e 	strmi	r6, [r0, #-1902]	; 0xfffff892
     950:	6c62616e 	stfvse	f6, [r2], #-440	; 0xfffffe48
     954:	61425f65 	cmpvs	r2, r5, ror #30
     958:	5f636973 	svcpl	0x00636973
     95c:	73515249 	cmpvc	r1, #-1879048188	; 0x90000004
     960:	616e4500 	cmnvs	lr, r0, lsl #10
     964:	5f656c62 	svcpl	0x00656c62
     968:	73515249 	cmpvc	r1, #-1879048188	; 0x90000004
     96c:	4500315f 	strmi	r3, [r0, #-351]	; 0xfffffea1
     970:	6c62616e 	stfvse	f6, [r2], #-440	; 0xfffffe48
     974:	52495f65 	subpl	r5, r9, #404	; 0x194
     978:	325f7351 	subscc	r7, pc, #1140850689	; 0x44000001
     97c:	6f682f00 	svcvs	0x00682f00
     980:	612f656d 			; <UNDEFINED> instruction: 0x612f656d
     984:	6b696462 	blvs	1a59b14 <_stack+0x19d9b14>
     988:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
     98c:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
     990:	4c794d2f 	ldclmi	13, cr4, [r9], #-188	; 0xffffff44
     994:	6c747469 	cfldrdvs	mvd7, [r4], #-420	; 0xfffffe5c
     998:	2f534f65 	svccs	0x00534f65
     99c:	2f637273 	svccs	0x00637273
     9a0:	2d697072 	stclcs	0, cr7, [r9, #-456]!	; 0xfffffe38
     9a4:	65746e69 	ldrbvs	r6, [r4, #-3689]!	; 0xfffff197
     9a8:	70757272 	rsbsvc	r7, r5, r2, ror r2
     9ac:	632e7374 			; <UNDEFINED> instruction: 0x632e7374
     9b0:	74616400 	strbtvc	r6, [r1], #-1024	; 0xfffffc00
     9b4:	62615f61 	rsbvs	r5, r1, #388	; 0x184
     9b8:	5f74726f 	svcpl	0x0074726f
     9bc:	74636576 	strbtvc	r6, [r3], #-1398	; 0xfffffa8a
     9c0:	6d00726f 	sfmvs	f7, 4, [r0, #-444]	; 0xfffffe44
     9c4:	756f4373 	strbvc	r4, [pc, #-883]!	; 659 <CPSR_IRQ_INHIBIT+0x5d9>
     9c8:	7265746e 	rsbvc	r7, r5, #1845493760	; 0x6e000000
     9cc:	51524900 	cmppl	r2, r0, lsl #18
     9d0:	6e65705f 	mcrvs	0, 3, r7, cr5, cr15, {2}
     9d4:	676e6964 	strbvs	r6, [lr, -r4, ror #18]!
     9d8:	7500325f 	strvc	r3, [r0, #-607]	; 0xfffffda1
     9dc:	6665646e 	strbtvs	r6, [r5], -lr, ror #8
     9e0:	64656e69 	strbtvs	r6, [r5], #-3689	; 0xfffff197
     9e4:	736e695f 	cmnvc	lr, #1556480	; 0x17c000
     9e8:	63757274 	cmnvs	r5, #116, 4	; 0x40000007
     9ec:	6e6f6974 			; <UNDEFINED> instruction: 0x6e6f6974
     9f0:	6365765f 	cmnvs	r5, #99614720	; 0x5f00000
     9f4:	00726f74 	rsbseq	r6, r2, r4, ror pc
     9f8:	65736572 	ldrbvs	r6, [r3, #-1394]!	; 0xfffffa8e
     9fc:	65765f74 	ldrbvs	r5, [r6, #-3956]!	; 0xfffff08c
     a00:	726f7463 	rsbvc	r7, pc, #1660944384	; 0x63000000
     a04:	666f7300 	strbtvs	r7, [pc], -r0, lsl #6
     a08:	72617774 	rsbvc	r7, r1, #116, 14	; 0x1d00000
     a0c:	6e695f65 	cdpvs	15, 6, cr5, cr9, cr5, {3}
     a10:	72726574 	rsbsvc	r6, r2, #116, 10	; 0x1d000000
     a14:	5f747075 	svcpl	0x00747075
     a18:	74636576 	strbtvc	r6, [r3], #-1398	; 0xfffffa8a
     a1c:	4400726f 	strmi	r7, [r0], #-623	; 0xfffffd91
     a20:	62617369 	rsbvs	r7, r1, #-1543503871	; 0xa4000001
     a24:	495f656c 	ldmdbmi	pc, {r2, r3, r5, r6, r8, sl, sp, lr}^	; <UNPREDICTABLE>
     a28:	5f735152 	svcpl	0x00735152
     a2c:	69440031 	stmdbvs	r4, {r0, r4, r5}^
     a30:	6c626173 	stfvse	f6, [r2], #-460	; 0xfffffe34
     a34:	52495f65 	subpl	r5, r9, #404	; 0x194
     a38:	325f7351 	subscc	r7, pc, #1140850689	; 0x44000001
     a3c:	73616600 	cmnvc	r1, #0, 12
     a40:	6e695f74 	mcrvs	15, 3, r5, cr9, cr4, {3}
     a44:	72726574 	rsbsvc	r6, r2, #116, 10	; 0x1d000000
     a48:	5f747075 	svcpl	0x00747075
     a4c:	74636576 	strbtvc	r6, [r3], #-1398	; 0xfffffa8a
     a50:	4900726f 	stmdbmi	r0, {r0, r1, r2, r3, r5, r6, r9, ip, sp, lr}
     a54:	705f5152 	subsvc	r5, pc, r2, asr r1	; <UNPREDICTABLE>
     a58:	69646e65 	stmdbvs	r4!, {r0, r2, r5, r6, r9, sl, fp, sp, lr}^
     a5c:	315f676e 	cmpcc	pc, lr, ror #14
     a60:	6d6f6300 	stclvs	3, cr6, [pc, #-0]	; a68 <CPSR_IRQ_INHIBIT+0x9e8>
     a64:	65726170 	ldrbvs	r6, [r2, #-368]!	; 0xfffffe90
     a68:	6f630030 	svcvs	0x00630030
     a6c:	7261706d 	rsbvc	r7, r1, #109	; 0x6d
     a70:	63003165 	movwvs	r3, #357	; 0x165
     a74:	61706d6f 	cmnvs	r0, pc, ror #26
     a78:	00326572 	eorseq	r6, r2, r2, ror r5
     a7c:	706d6f63 	rsbvc	r6, sp, r3, ror #30
     a80:	33657261 	cmncc	r5, #268435462	; 0x10000006
     a84:	6f682f00 	svcvs	0x00682f00
     a88:	612f656d 			; <UNDEFINED> instruction: 0x612f656d
     a8c:	6b696462 	blvs	1a59c1c <_stack+0x19d9c1c>
     a90:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
     a94:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
     a98:	4c794d2f 	ldclmi	13, cr4, [r9], #-188	; 0xffffff44
     a9c:	6c747469 	cfldrdvs	mvd7, [r4], #-420	; 0xfffffe5c
     aa0:	2f534f65 	svccs	0x00534f65
     aa4:	2f637273 	svccs	0x00637273
     aa8:	2d697072 	stclcs	0, cr7, [r9, #-456]!	; 0xfffffe38
     aac:	74737973 	ldrbtvc	r7, [r3], #-2419	; 0xfffff68d
     ab0:	72656d69 	rsbvc	r6, r5, #6720	; 0x1a40
     ab4:	6300632e 	movwvs	r6, #814	; 0x32e
     ab8:	746e756f 	strbtvc	r7, [lr], #-1391	; 0xfffffa91
     abc:	685f7265 	ldmdavs	pc, {r0, r2, r5, r6, r9, ip, sp, lr}^	; <UNPREDICTABLE>
     ac0:	6f630069 	svcvs	0x00630069
     ac4:	6f72746e 	svcvs	0x0072746e
     ac8:	74735f6c 	ldrbtvc	r5, [r3], #-3948	; 0xfffff094
     acc:	73757461 	cmnvc	r5, #1627389952	; 0x61000000
     ad0:	756f6300 	strbvc	r6, [pc, #-768]!	; 7d8 <CPSR_IRQ_INHIBIT+0x758>
     ad4:	7265746e 	rsbvc	r7, r5, #1845493760	; 0x6e000000
     ad8:	006f6c5f 	rsbeq	r6, pc, pc, asr ip	; <UNPREDICTABLE>
     adc:	5f495052 	svcpl	0x00495052
     ae0:	53746547 	cmnpl	r4, #297795584	; 0x11c00000
     ae4:	65747379 	ldrbvs	r7, [r4, #-889]!	; 0xfffffc87
     ae8:	6d69546d 	cfstrdvs	mvd5, [r9, #-436]!	; 0xfffffe4c
     aec:	52007265 	andpl	r7, r0, #1342177286	; 0x50000006
     af0:	575f4950 			; <UNDEFINED> instruction: 0x575f4950
     af4:	4d746961 			; <UNDEFINED> instruction: 0x4d746961
     af8:	6f726369 	svcvs	0x00726369
     afc:	6f636553 	svcvs	0x00636553
     b00:	0073646e 	rsbseq	r6, r3, lr, ror #8
     b04:	5f697072 	svcpl	0x00697072
     b08:	5f737973 	svcpl	0x00737973
     b0c:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0xfffff68c
     b10:	00745f72 	rsbseq	r5, r4, r2, ror pc
     b14:	53697072 	cmnpl	r9, #114	; 0x72
     b18:	65747379 	ldrbvs	r7, [r4, #-889]!	; 0xfffffc87
     b1c:	6d69546d 	cfstrdvs	mvd5, [r9, #-436]!	; 0xfffffe4c
     b20:	41007265 	tstmi	r0, r5, ror #4
     b24:	4d5f5855 	ldclmi	8, cr5, [pc, #-340]	; 9d8 <CPSR_IRQ_INHIBIT+0x958>
     b28:	43535f55 	cmpmi	r3, #340	; 0x154
     b2c:	43544152 	cmpmi	r4, #-2147483628	; 0x80000014
     b30:	70720048 	rsbsvc	r0, r2, r8, asr #32
     b34:	61755f69 	cmnvs	r5, r9, ror #30
     b38:	745f7472 	ldrbvc	r7, [pc], #-1138	; b40 <CPSR_IRQ_INHIBIT+0xac0>
     b3c:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     b40:	6e694d5f 	mcrvs	13, 3, r4, cr9, cr15, {2}
     b44:	72615569 	rsbvc	r5, r1, #440401920	; 0x1a400000
     b48:	53495f74 	movtpl	r5, #40820	; 0x9f74
     b4c:	626e0052 	rsbvs	r0, lr, #82	; 0x52
     b50:	73657479 	cmnvc	r5, #2030043136	; 0x79000000
     b54:	58554100 	ldmdapl	r5, {r8, lr}^
     b58:	5f554d5f 	svcpl	0x00554d5f
     b5c:	5f52534c 	svcpl	0x0052534c
     b60:	00474552 	subeq	r4, r7, r2, asr r5
     b64:	5f585541 	svcpl	0x00585541
     b68:	42414e45 	submi	r4, r1, #1104	; 0x450
     b6c:	0053454c 	subseq	r4, r3, ip, asr #10
     b70:	5f495052 	svcpl	0x00495052
     b74:	74697257 	strbtvc	r7, [r9], #-599	; 0xfffffda9
     b78:	4d6f5465 	cfstrdmi	mvd5, [pc, #-404]!	; 9ec <CPSR_IRQ_INHIBIT+0x96c>
     b7c:	55696e69 	strbpl	r6, [r9, #-3689]!	; 0xfffff197
     b80:	00747261 	rsbseq	r7, r4, r1, ror #4
     b84:	5f495052 	svcpl	0x00495052
     b88:	696e694d 	stmdbvs	lr!, {r0, r2, r3, r6, r8, fp, sp, lr}^
     b8c:	74726155 	ldrbtvc	r6, [r2], #-341	; 0xfffffeab
     b90:	74696e49 	strbtvc	r6, [r9], #-3657	; 0xfffff1b7
     b94:	58554100 	ldmdapl	r5, {r8, lr}^
     b98:	5f554d5f 	svcpl	0x00554d5f
     b9c:	5f52434d 	svcpl	0x0052434d
     ba0:	00474552 	subeq	r4, r7, r2, asr r5
     ba4:	5f585541 	svcpl	0x00585541
     ba8:	495f554d 	ldmdbmi	pc, {r0, r2, r3, r6, r8, sl, ip, lr}^	; <UNPREDICTABLE>
     bac:	45525f4f 	ldrbmi	r5, [r2, #-3919]	; 0xfffff0b1
     bb0:	69660047 	stmdbvs	r6!, {r0, r1, r2, r6}^
     bb4:	625f6f66 	subsvs	r6, pc, #408	; 0x198
     bb8:	65666675 	strbvs	r6, [r6, #-1653]!	; 0xfffff98b
     bbc:	682f0072 	stmdavs	pc!, {r1, r4, r5, r6}	; <UNPREDICTABLE>
     bc0:	2f656d6f 	svccs	0x00656d6f
     bc4:	69646261 	stmdbvs	r4!, {r0, r5, r6, r9, sp, lr}^
     bc8:	6972616b 	ldmdbvs	r2!, {r0, r1, r3, r5, r6, r8, sp, lr}^
     bcc:	65642f6d 	strbvs	r2, [r4, #-3949]!	; 0xfffff093
     bd0:	794d2f76 	stmdbvc	sp, {r1, r2, r4, r5, r6, r8, r9, sl, fp, sp}^
     bd4:	7474694c 	ldrbtvc	r6, [r4], #-2380	; 0xfffff6b4
     bd8:	534f656c 	movtpl	r6, #62828	; 0xf56c
     bdc:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
     be0:	6970722f 	ldmdbvs	r0!, {r0, r1, r2, r3, r5, r9, ip, sp, lr}^
     be4:	7261752d 	rsbvc	r7, r1, #188743680	; 0xb400000
     be8:	00632e74 	rsbeq	r2, r3, r4, ror lr
     bec:	5f585541 	svcpl	0x00585541
     bf0:	425f554d 	subsmi	r5, pc, #322961408	; 0x13400000
     bf4:	5f445541 	svcpl	0x00445541
     bf8:	00474552 	subeq	r4, r7, r2, asr r5
     bfc:	5f585541 	svcpl	0x00585541
     c00:	4d5f554d 	cfldr64mi	mvdx5, [pc, #-308]	; ad4 <CPSR_IRQ_INHIBIT+0xa54>
     c04:	525f5253 	subspl	r5, pc, #805306373	; 0x30000005
     c08:	74004745 	strvc	r4, [r0], #-1861	; 0xfffff8bb
     c0c:	006c6961 	rsbeq	r6, ip, r1, ror #18
     c10:	5f585541 	svcpl	0x00585541
     c14:	495f554d 	ldmdbmi	pc, {r0, r2, r3, r6, r8, sl, ip, lr}^	; <UNPREDICTABLE>
     c18:	525f5245 	subspl	r5, pc, #1342177284	; 0x50000004
     c1c:	72004745 	andvc	r4, r0, #18087936	; 0x1140000
     c20:	694d6970 	stmdbvs	sp, {r4, r5, r6, r8, fp, sp, lr}^
     c24:	6155696e 	cmpvs	r5, lr, ror #18
     c28:	41007472 	tstmi	r0, r2, ror r4
     c2c:	4d5f5855 	ldclmi	8, cr5, [pc, #-340]	; ae0 <CPSR_IRQ_INHIBIT+0xa60>
     c30:	49495f55 	stmdbmi	r9, {r0, r2, r4, r6, r8, r9, sl, fp, ip, lr}^
     c34:	45525f52 	ldrbmi	r5, [r2, #-3922]	; 0xfffff0ae
     c38:	70720047 	rsbsvc	r0, r2, r7, asr #32
     c3c:	78754169 	ldmdavc	r5!, {r0, r3, r5, r6, r8, lr}^
     c40:	58554100 	ldmdapl	r5, {r8, lr}^
     c44:	5152495f 	cmppl	r2, pc, asr r9
     c48:	636e6900 	cmnvs	lr, #0, 18
     c4c:	6e696d6f 	cdpvs	13, 6, cr6, cr9, cr15, {3}
     c50:	61645f67 	cmnvs	r4, r7, ror #30
     c54:	67006174 	smlsdxvs	r0, r4, r1, r6
     c58:	526f6970 	rsbpl	r6, pc, #112, 18	; 0x1c0000
     c5c:	66006765 	strvs	r6, [r0], -r5, ror #14
     c60:	5f6f6669 	svcpl	0x006f6669
     c64:	6e690074 	mcrvs	0, 3, r0, cr9, cr4, {3}
     c68:	696d6f63 	stmdbvs	sp!, {r0, r1, r5, r6, r8, r9, sl, fp, sp, lr}^
     c6c:	625f676e 	subsvs	r6, pc, #28835840	; 0x1b80000
     c70:	00657479 	rsbeq	r7, r5, r9, ror r4
     c74:	5f495052 	svcpl	0x00495052
     c78:	64616552 	strbtvs	r6, [r1], #-1362	; 0xfffffaae
     c7c:	6d6f7246 	sfmvs	f7, 2, [pc, #-280]!	; b6c <CPSR_IRQ_INHIBIT+0xaec>
     c80:	696e694d 	stmdbvs	lr!, {r0, r2, r3, r6, r8, fp, sp, lr}^
     c84:	74726155 	ldrbtvc	r6, [r2], #-341	; 0xfffffeab
     c88:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     c8c:	7465475f 	strbtvc	r4, [r5], #-1887	; 0xfffff8a1
     c90:	696e694d 	stmdbvs	lr!, {r0, r2, r3, r6, r8, fp, sp, lr}^
     c94:	74726155 	ldrbtvc	r6, [r2], #-341	; 0xfffffeab
     c98:	58554100 	ldmdapl	r5, {r8, lr}^
     c9c:	5f554d5f 	svcpl	0x00554d5f
     ca0:	54415453 	strbpl	r5, [r1], #-1107	; 0xfffffbad
     ca4:	4745525f 	smlsldmi	r5, r5, pc, r2	; <UNPREDICTABLE>
     ca8:	61656800 	cmnvs	r5, r0, lsl #16
     cac:	55410064 	strbpl	r0, [r1, #-100]	; 0xffffff9c
     cb0:	554d5f58 	strbpl	r5, [sp, #-3928]	; 0xfffff0a8
     cb4:	52434c5f 	subpl	r4, r3, #24320	; 0x5f00
     cb8:	4745525f 	smlsldmi	r5, r5, pc, r2	; <UNPREDICTABLE>
     cbc:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     cc0:	7465475f 	strbtvc	r4, [r5], #-1887	; 0xfffff8a1
     cc4:	00787541 	rsbseq	r7, r8, r1, asr #10
     cc8:	5f697072 	svcpl	0x00697072
     ccc:	5f787561 	svcpl	0x00787561
     cd0:	50520074 	subspl	r0, r2, r4, ror r0
     cd4:	72705f49 	rsbsvc	r5, r0, #292	; 0x124
     cd8:	53746e69 	cmnpl	r4, #1680	; 0x690
     cdc:	6e697274 	mcrvs	2, 3, r7, cr9, cr4, {3}
     ce0:	4c664f67 	stclmi	15, cr4, [r6], #-412	; 0xfffffe64
     ce4:	41006e65 	tstmi	r0, r5, ror #28
     ce8:	4d5f5855 	ldclmi	8, cr5, [pc, #-340]	; b9c <CPSR_IRQ_INHIBIT+0xb1c>
     cec:	4e435f55 	mcrmi	15, 2, r5, cr3, cr5, {2}
     cf0:	525f4c54 	subspl	r4, pc, #84, 24	; 0x5400
     cf4:	52004745 	andpl	r4, r0, #18087936	; 0x1140000
     cf8:	705f4950 	subsvc	r4, pc, r0, asr r9	; <UNPREDICTABLE>
     cfc:	746e6972 	strbtvc	r6, [lr], #-2418	; 0xfffff68e
     d00:	69727453 	ldmdbvs	r2!, {r0, r1, r4, r6, sl, ip, sp, lr}^
     d04:	5f00676e 	svcpl	0x0000676e
     d08:	5f6f7364 	svcpl	0x006f7364
     d0c:	646e6168 	strbtvs	r6, [lr], #-360	; 0xfffffe98
     d10:	6300656c 	movwvs	r6, #1388	; 0x56c
     d14:	616d6d6f 	cmnvs	sp, pc, ror #26
     d18:	6e5f646e 	cdpvs	4, 5, cr6, cr15, cr14, {3}
     d1c:	665f746f 	ldrbvs	r7, [pc], -pc, ror #8
     d20:	646e756f 	strbtvs	r7, [lr], #-1391	; 0xfffffa91
     d24:	7865745f 	stmdavc	r5!, {r0, r1, r2, r3, r4, r6, sl, ip, sp, lr}^
     d28:	725f0074 	subsvc	r0, pc, #116	; 0x74
     d2c:	34646e61 	strbtcc	r6, [r4], #-3681	; 0xfffff19f
     d30:	655f0038 	ldrbvs	r0, [pc, #-56]	; d00 <CPSR_IRQ_INHIBIT+0xc80>
     d34:	6772656d 	ldrbvs	r6, [r2, -sp, ror #10]!
     d38:	79636e65 	stmdbvc	r3!, {r0, r2, r5, r6, r9, sl, fp, sp, lr}^
     d3c:	63775f00 	cmnvs	r7, #0, 30
     d40:	6d6f7472 	cfstrdvs	mvd7, [pc, #-456]!	; b80 <CPSR_IRQ_INHIBIT+0xb00>
     d44:	74735f62 	ldrbtvc	r5, [r3], #-3938	; 0xfffff09e
     d48:	00657461 	rsbeq	r7, r5, r1, ror #8
     d4c:	7363775f 	cmnvc	r3, #24903680	; 0x17c0000
     d50:	6d6f7472 	cfstrdvs	mvd7, [pc, #-456]!	; b90 <CPSR_IRQ_INHIBIT+0xb10>
     d54:	735f7362 	cmpvc	pc, #-2013265919	; 0x88000001
     d58:	65746174 	ldrbvs	r6, [r4, #-372]!	; 0xfffffe8c
     d5c:	6f682f00 	svcvs	0x00682f00
     d60:	612f656d 			; <UNDEFINED> instruction: 0x612f656d
     d64:	6b696462 	blvs	1a59ef4 <_stack+0x19d9ef4>
     d68:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
     d6c:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
     d70:	4c794d2f 	ldclmi	13, cr4, [r9], #-188	; 0xffffff44
     d74:	6c747469 	cfldrdvs	mvd7, [r4], #-420	; 0xfffffe5c
     d78:	2f534f65 	svccs	0x00534f65
     d7c:	2f637273 	svccs	0x00637273
     d80:	6c656873 	stclvs	8, cr6, [r5], #-460	; 0xfffffe34
     d84:	00632e6c 	rsbeq	r2, r3, ip, ror #28
     d88:	66626c5f 			; <UNDEFINED> instruction: 0x66626c5f
     d8c:	657a6973 	ldrbvs	r6, [sl, #-2419]!	; 0xfffff68d
     d90:	626d5f00 	rsbvs	r5, sp, #0, 30
     d94:	776f7472 			; <UNDEFINED> instruction: 0x776f7472
     d98:	74735f63 	ldrbtvc	r5, [r3], #-3939	; 0xfffff09d
     d9c:	00657461 	rsbeq	r7, r5, r1, ror #8
     da0:	7463775f 	strbtvc	r7, [r3], #-1887	; 0xfffff8a1
     da4:	5f626d6f 	svcpl	0x00626d6f
     da8:	74617473 	strbtvc	r7, [r1], #-1139	; 0xfffffb8d
     dac:	5f5f0065 	svcpl	0x005f0065
     db0:	735f6d74 	cmpvc	pc, #116, 26	; 0x1d00
     db4:	5f006365 	svcpl	0x00006365
     db8:	66756275 			; <UNDEFINED> instruction: 0x66756275
     dbc:	745f5f00 	ldrbvc	r5, [pc], #-3840	; dc4 <CPSR_IRQ_INHIBIT+0xd44>
     dc0:	6f685f6d 	svcvs	0x00685f6d
     dc4:	5f007275 	svcpl	0x00007275
     dc8:	0066735f 	rsbeq	r7, r6, pc, asr r3
     dcc:	5f6e6f5f 	svcpl	0x006e6f5f
     dd0:	74697865 	strbtvc	r7, [r9], #-2149	; 0xfffff79b
     dd4:	6772615f 			; <UNDEFINED> instruction: 0x6772615f
     dd8:	635f0073 	cmpvs	pc, #115	; 0x73
     ddc:	696b6f6f 	stmdbvs	fp!, {r0, r1, r2, r3, r5, r6, r8, r9, sl, fp, sp, lr}^
     de0:	5f5f0065 	svcpl	0x005f0065
     de4:	756c6773 	strbvc	r6, [ip, #-1907]!	; 0xfffff88d
     de8:	665f0065 	ldrbvs	r0, [pc], -r5, rrx
     dec:	7367616c 	cmnvc	r7, #108, 2
     df0:	73695f00 	cmnvc	r9, #0, 30
     df4:	6178635f 	cmnvs	r8, pc, asr r3
     df8:	74735f00 	ldrbtvc	r5, [r3], #-3840	; 0xfffff100
     dfc:	006e6964 	rsbeq	r6, lr, r4, ror #18
     e00:	6b6c625f 	blvs	1b19784 <_stack+0x1a99784>
     e04:	657a6973 	ldrbvs	r6, [sl, #-2419]!	; 0xfffff68d
     e08:	76635f00 	strbtvc	r5, [r3], -r0, lsl #30
     e0c:	66756274 			; <UNDEFINED> instruction: 0x66756274
     e10:	666f5f00 	strbtvs	r5, [pc], -r0, lsl #30
     e14:	74657366 	strbtvc	r7, [r5], #-870	; 0xfffffc9a
     e18:	626d5f00 	rsbvs	r5, sp, #0, 30
     e1c:	6f747273 	svcvs	0x00747273
     e20:	5f736377 	svcpl	0x00736377
     e24:	74617473 	strbtvc	r7, [r1], #-1139	; 0xfffffb8d
     e28:	6d5f0065 	ldclvs	0, cr0, [pc, #-404]	; c9c <CPSR_IRQ_INHIBIT+0xc1c>
     e2c:	656c7262 	strbvs	r7, [ip, #-610]!	; 0xfffffd9e
     e30:	74735f6e 	ldrbtvc	r5, [r3], #-3950	; 0xfffff092
     e34:	00657461 	rsbeq	r7, r5, r1, ror #8
     e38:	616e665f 	cmnvs	lr, pc, asr r6
     e3c:	00736772 	rsbseq	r6, r3, r2, ror r7
     e40:	736e665f 	cmnvc	lr, #99614720	; 0x5f00000
     e44:	69735f00 	ldmdbvs	r3!, {r8, r9, sl, fp, ip, lr}^
     e48:	5f006e67 	svcpl	0x00006e67
     e4c:	636f6c66 	cmnvs	pc, #26112	; 0x6600
     e50:	00745f6b 	rsbseq	r5, r4, fp, ror #30
     e54:	6474735f 	ldrbtvs	r7, [r4], #-863	; 0xfffffca1
     e58:	00727265 	rsbseq	r7, r2, r5, ror #4
     e5c:	6769425f 			; <UNDEFINED> instruction: 0x6769425f
     e60:	00746e69 	rsbseq	r6, r4, r9, ror #28
     e64:	6d61675f 	stclvs	7, cr6, [r1, #-380]!	; 0xfffffe84
     e68:	735f616d 	cmpvc	pc, #1073741851	; 0x4000001b
     e6c:	676e6769 	strbvs	r6, [lr, -r9, ror #14]!
     e70:	5f006d61 	svcpl	0x00006d61
     e74:	75736572 	ldrbvc	r6, [r3, #-1394]!	; 0xfffffa8e
     e78:	6b5f746c 	blvs	17de030 <_stack+0x175e030>
     e7c:	745f5f00 	ldrbvc	r5, [pc], #-3840	; e84 <CPSR_IRQ_INHIBIT+0xe04>
     e80:	5f5f006d 	svcpl	0x005f006d
     e84:	62686377 	rsbvs	r6, r8, #-603979775	; 0xdc000001
     e88:	74735f00 	ldrbtvc	r5, [r3], #-3840	; 0xfffff100
     e8c:	74756f64 	ldrbtvc	r6, [r5], #-3940	; 0xfffff09c
     e90:	76635f00 	strbtvc	r5, [r3], -r0, lsl #30
     e94:	6e656c74 	mcrvs	12, 3, r6, cr5, cr4, {3}
     e98:	69665f00 	stmdbvs	r6!, {r8, r9, sl, fp, ip, lr}^
     e9c:	5f00656c 	svcpl	0x0000656c
     ea0:	626f696e 	rsbvs	r6, pc, #1802240	; 0x1b8000
     ea4:	615f0073 	cmpvs	pc, r3, ror r0	; <UNPREDICTABLE>
     ea8:	69786574 	ldmdbvs	r8!, {r2, r4, r5, r6, r8, sl, sp, lr}^
     eac:	5f003074 	svcpl	0x00003074
     eb0:	6e676973 			; <UNDEFINED> instruction: 0x6e676973
     eb4:	625f6c61 	subsvs	r6, pc, #24832	; 0x6100
     eb8:	5f006675 	svcpl	0x00006675
     ebc:	74637361 	strbtvc	r7, [r3], #-865	; 0xfffffc9f
     ec0:	5f656d69 	svcpl	0x00656d69
     ec4:	00667562 	rsbeq	r7, r6, r2, ror #10
     ec8:	7365725f 	cmnvc	r5, #-268435451	; 0xf0000005
     ecc:	00746c75 	rsbseq	r6, r4, r5, ror ip
     ed0:	63775f5f 	cmnvs	r7, #380	; 0x17c
     ed4:	69770068 	ldmdbvs	r7!, {r3, r5, r6}^
     ed8:	745f746e 	ldrbvc	r7, [pc], #-1134	; ee0 <CPSR_IRQ_INHIBIT+0xe60>
     edc:	6f6c5f00 	svcvs	0x006c5f00
     ee0:	5f006b63 	svcpl	0x00006b63
     ee4:	67616c66 	strbvs	r6, [r1, -r6, ror #24]!
     ee8:	5f003273 	svcpl	0x00003273
     eec:	5f6d745f 	svcpl	0x006d745f
     ef0:	72616579 	rsbvc	r6, r1, #507510784	; 0x1e400000
     ef4:	6d6e5f00 	stclvs	15, cr5, [lr, #-0]
     ef8:	6f6c6c61 	svcvs	0x006c6c61
     efc:	68630063 	stmdavs	r3!, {r0, r1, r5, r6}^
     f00:	63617261 	cmnvs	r1, #268435462	; 0x10000006
     f04:	00726574 	rsbseq	r6, r2, r4, ror r5
     f08:	676e6f6c 	strbvs	r6, [lr, -ip, ror #30]!
     f0c:	756f6420 	strbvc	r6, [pc, #-1056]!	; af4 <CPSR_IRQ_INHIBIT+0xa74>
     f10:	00656c62 	rsbeq	r6, r5, r2, ror #24
     f14:	78656e5f 	stmdavc	r5!, {r0, r1, r2, r3, r4, r6, r9, sl, fp, sp, lr}^
     f18:	5f006674 	svcpl	0x00006674
     f1c:	5f6d745f 	svcpl	0x006d745f
     f20:	006e6f6d 	rsbeq	r6, lr, sp, ror #30
     f24:	6574615f 	ldrbvs	r6, [r4, #-351]!	; 0xfffffea1
     f28:	00746978 	rsbseq	r6, r4, r8, ror r9
     f2c:	6f627573 	svcvs	0x00627573
     f30:	72617470 	rsbvc	r7, r1, #112, 8	; 0x70000000
     f34:	5f5f0067 	svcpl	0x005f0067
     f38:	64696473 	strbtvs	r6, [r9], #-1139	; 0xfffffb8d
     f3c:	74696e69 	strbtvc	r6, [r9], #-3689	; 0xfffff197
     f40:	666f5f00 	strbtvs	r5, [pc], -r0, lsl #30
     f44:	00745f66 	rsbseq	r5, r4, r6, ror #30
     f48:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; e94 <CPSR_IRQ_INHIBIT+0xe14>
     f4c:	62612f65 	rsbvs	r2, r1, #404	; 0x194
     f50:	616b6964 	cmnvs	fp, r4, ror #18
     f54:	2f6d6972 	svccs	0x006d6972
     f58:	2f766564 	svccs	0x00766564
     f5c:	694c794d 	stmdbvs	ip, {r0, r2, r3, r6, r8, fp, ip, sp, lr}^
     f60:	656c7474 	strbvs	r7, [ip, #-1140]!	; 0xfffffb8c
     f64:	5f00534f 	svcpl	0x0000534f
     f68:	65657266 	strbvs	r7, [r5, #-614]!	; 0xfffffd9a
     f6c:	7473696c 	ldrbtvc	r6, [r3], #-2412	; 0xfffff694
     f70:	4f4c5f00 	svcmi	0x004c5f00
     f74:	525f4b43 	subspl	r4, pc, #68608	; 0x10c00
     f78:	52554345 	subspl	r4, r5, #335544321	; 0x14000001
     f7c:	45564953 	ldrbmi	r4, [r6, #-2387]	; 0xfffff6ad
     f80:	5f00545f 	svcpl	0x0000545f
     f84:	0077656e 	rsbseq	r6, r7, lr, ror #10
     f88:	655f685f 	ldrbvs	r6, [pc, #-2143]	; 731 <CPSR_IRQ_INHIBIT+0x6b1>
     f8c:	6f6e7272 	svcvs	0x006e7272
     f90:	745f5f00 	ldrbvc	r5, [pc], #-3840	; f98 <CPSR_IRQ_INHIBIT+0xf18>
     f94:	64795f6d 	ldrbtvs	r5, [r9], #-3949	; 0xfffff093
     f98:	5f007961 	svcpl	0x00007961
     f9c:	7562735f 	strbvc	r7, [r2, #-863]!	; 0xfffffca1
     fa0:	695f0066 	ldmdbvs	pc, {r1, r2, r5, r6}^	; <UNPREDICTABLE>
     fa4:	0073626f 	rsbseq	r6, r3, pc, ror #4
     fa8:	49465f5f 	stmdbmi	r6, {r0, r1, r2, r3, r4, r6, r8, r9, sl, fp, ip, lr}^
     fac:	5f00454c 	svcpl	0x0000454c
     fb0:	7473626d 	ldrbtvc	r6, [r3], #-621	; 0xfffffd93
     fb4:	5f657461 	svcpl	0x00657461
     fb8:	5f5f0074 	svcpl	0x005f0074
     fbc:	4c494673 	mcrrmi	6, 7, r4, r9, cr3
     fc0:	6d5f0045 	ldclvs	0, cr0, [pc, #-276]	; eb4 <CPSR_IRQ_INHIBIT+0xe34>
     fc4:	61747362 	cmnvs	r4, r2, ror #6
     fc8:	5f006574 	svcpl	0x00006574
     fcc:	646e6172 	strbtvs	r6, [lr], #-370	; 0xfffffe8e
     fd0:	78656e5f 	stmdavc	r5!, {r0, r1, r2, r3, r4, r6, r9, sl, fp, sp, lr}^
     fd4:	6d5f0074 	ldclvs	0, cr0, [pc, #-464]	; e0c <CPSR_IRQ_INHIBIT+0xd8c>
     fd8:	6e656c62 	cdpvs	12, 6, cr6, cr5, cr2, {3}
     fdc:	6174735f 	cmnvs	r4, pc, asr r3
     fe0:	5f006574 	svcpl	0x00006574
     fe4:	00636e69 	rsbeq	r6, r3, r9, ror #28
     fe8:	646e695f 	strbtvs	r6, [lr], #-2399	; 0xfffff6a1
     fec:	75635f00 	strbvc	r5, [r3, #-3840]!	; 0xfffff100
     ff0:	6e657272 	mcrvs	2, 3, r7, cr5, cr2, {3}
     ff4:	6f6c5f74 	svcvs	0x006c5f74
     ff8:	656c6163 	strbvs	r6, [ip, #-355]!	; 0xfffffe9d
     ffc:	706e6900 	rsbvc	r6, lr, r0, lsl #18
    1000:	5f007475 	svcpl	0x00007475
    1004:	656c635f 	strbvs	r6, [ip, #-863]!	; 0xfffffca1
    1008:	70756e61 	rsbsvc	r6, r5, r1, ror #28
    100c:	616d5f00 	cmnvs	sp, r0, lsl #30
    1010:	73647778 	cmnvc	r4, #120, 14	; 0x1e00000
    1014:	65725f00 	ldrbvs	r5, [r2, #-3840]!	; 0xfffff100
    1018:	00746e65 	rsbseq	r6, r4, r5, ror #28
    101c:	6565735f 	strbvs	r7, [r5, #-863]!	; 0xfffffca1
    1020:	5f5f0064 	svcpl	0x005f0064
    1024:	6e756f63 	cdpvs	15, 7, cr6, cr5, cr3, {3}
    1028:	5f5f0074 	svcpl	0x005f0074
    102c:	756c6176 	strbvc	r6, [ip, #-374]!	; 0xfffffe8a
    1030:	735f0065 	cmpvc	pc, #101	; 0x65
    1034:	006b6565 	rsbeq	r6, fp, r5, ror #10
    1038:	6f70665f 	svcvs	0x0070665f
    103c:	00745f73 	rsbseq	r5, r4, r3, ror pc
    1040:	6d745f5f 	ldclvs	15, cr5, [r4, #-380]!	; 0xfffffe84
    1044:	6e696d5f 	mcrvs	13, 3, r6, cr9, cr15, {2}
    1048:	756d5f00 	strbvc	r5, [sp, #-3840]!	; 0xfffff100
    104c:	6500746c 	strvs	r7, [r0, #-1132]	; 0xfffffb94
    1050:	7265746e 	rsbvc	r7, r5, #1845493760	; 0x6e000000
    1054:	6d6f635f 	stclvs	3, cr6, [pc, #-380]!	; ee0 <CPSR_IRQ_INHIBIT+0xe60>
    1058:	646e616d 	strbtvs	r6, [lr], #-365	; 0xfffffe93
    105c:	7865745f 	stmdavc	r5!, {r0, r1, r2, r3, r4, r6, sl, ip, sp, lr}^
    1060:	735f0074 	cmpvc	pc, #116	; 0x74
    1064:	6f747274 	svcvs	0x00747274
    1068:	616c5f6b 	cmnvs	ip, fp, ror #30
    106c:	5f007473 	svcpl	0x00007473
    1070:	79746e66 	ldmdbvc	r4!, {r1, r2, r5, r6, r9, sl, fp, sp, lr}^
    1074:	00736570 	rsbseq	r6, r3, r0, ror r5
    1078:	6464615f 	strbtvs	r6, [r4], #-351	; 0xfffffea1
    107c:	555f5f00 	ldrbpl	r5, [pc, #-3840]	; 184 <CPSR_IRQ_INHIBIT+0x104>
    1080:	676e6f4c 	strbvs	r6, [lr, -ip, asr #30]!
    1084:	65675f00 	strbvs	r5, [r7, #-3840]!	; 0xfffff100
    1088:	74616474 	strbtvc	r6, [r1], #-1140	; 0xfffffb8c
    108c:	72655f65 	rsbvc	r5, r5, #404	; 0x194
    1090:	675f0072 			; <UNDEFINED> instruction: 0x675f0072
    1094:	61626f6c 	cmnvs	r2, ip, ror #30
    1098:	6d695f6c 	stclvs	15, cr5, [r9, #-432]!	; 0xfffffe50
    109c:	65727570 	ldrbvs	r7, [r2, #-1392]!	; 0xfffffa90
    10a0:	7274705f 	rsbsvc	r7, r4, #95	; 0x5f
    10a4:	75635f00 	strbvc	r5, [r3, #-3840]!	; 0xfffff100
    10a8:	6e657272 	mcrvs	2, 3, r7, cr5, cr2, {3}
    10ac:	61635f74 	smcvs	13812	; 0x35f4
    10b0:	6f676574 	svcvs	0x00676574
    10b4:	5f007972 	svcpl	0x00007972
    10b8:	73756e75 	cmnvc	r5, #1872	; 0x750
    10bc:	725f6465 	subsvc	r6, pc, #1694498816	; 0x65000000
    10c0:	00646e61 	rsbeq	r6, r4, r1, ror #28
    10c4:	7364775f 	cmnvc	r4, #24903680	; 0x17c0000
    10c8:	745f5f00 	ldrbvc	r5, [pc], #-3840	; 10d0 <_heap_top+0xd0>
    10cc:	64775f6d 	ldrbtvs	r5, [r7], #-3949	; 0xfffff093
    10d0:	5f007961 	svcpl	0x00007961
    10d4:	65756c67 	ldrbvs	r6, [r5, #-3175]!	; 0xfffff399
    10d8:	61625f00 	cmnvs	r2, r0, lsl #30
    10dc:	5f006573 	svcpl	0x00006573
    10e0:	6134366c 	teqvs	r4, ip, ror #12
    10e4:	6675625f 			; <UNDEFINED> instruction: 0x6675625f
    10e8:	69735f00 	ldmdbvs	r3!, {r8, r9, sl, fp, ip, lr}^
    10ec:	75665f67 	strbvc	r5, [r6, #-3943]!	; 0xfffff099
    10f0:	5f00636e 	svcpl	0x0000636e
    10f4:	6675626e 	ldrbtvs	r6, [r5], -lr, ror #4
    10f8:	6e755f00 	cdpvs	15, 7, cr5, cr5, cr0, {0}
    10fc:	64657375 	strbtvs	r7, [r5], #-885	; 0xfffffc8b
    1100:	745f5f00 	ldrbvc	r5, [pc], #-3840	; 1108 <_heap_top+0x108>
    1104:	73695f6d 	cmnvc	r9, #436	; 0x1b4
    1108:	00747364 	rsbseq	r7, r4, r4, ror #6
    110c:	636f6c5f 	cmnvs	pc, #24320	; 0x5f00
    1110:	69746c61 	ldmdbvs	r4!, {r0, r5, r6, sl, fp, sp, lr}^
    1114:	625f656d 	subsvs	r6, pc, #457179136	; 0x1b400000
    1118:	5f006675 	svcpl	0x00006675
    111c:	736f6c63 	cmnvc	pc, #25344	; 0x6300
    1120:	725f0065 	subsvc	r0, pc, #101	; 0x65
    1124:	5f003834 	svcpl	0x00003834
    1128:	6f74626d 	svcvs	0x0074626d
    112c:	735f6377 	cmpvc	pc, #-603979775	; 0xdc000001
    1130:	65746174 	ldrbvs	r6, [r4, #-372]!	; 0xfffffe8c
    1134:	35705f00 	ldrbcc	r5, [r0, #-3840]!	; 0xfffff100
    1138:	5f5f0073 	svcpl	0x005f0073
    113c:	6d5f6d74 	ldclvs	13, cr6, [pc, #-464]	; f74 <CPSR_IRQ_INHIBIT+0xef4>
    1140:	00796164 	rsbseq	r6, r9, r4, ror #2
    1144:	6c656873 	stclvs	8, cr6, [r5], #-460	; 0xfffffe34
    1148:	616d5f6c 	cmnvs	sp, ip, ror #30
    114c:	53006e69 	movwpl	r6, #3689	; 0xe69
    1150:	485f4356 	ldmdami	pc, {r1, r2, r4, r6, r8, r9, lr}^	; <UNPREDICTABLE>
    1154:	6c646e61 	stclvs	14, cr6, [r4], #-388	; 0xfffffe7c
    1158:	4d5f7265 	lfmmi	f7, 2, [pc, #-404]	; fcc <CPSR_IRQ_INHIBIT+0xf4c>
    115c:	006e6961 	rsbeq	r6, lr, r1, ror #18
    1160:	7478656e 	ldrbtvc	r6, [r8], #-1390	; 0xfffffa92
    1164:	6f72705f 	svcvs	0x0072705f
    1168:	75630063 	strbvc	r0, [r3, #-99]!	; 0xffffff9d
    116c:	6e657272 	mcrvs	2, 3, r7, cr5, cr2, {3}
    1170:	72705f74 	rsbsvc	r5, r0, #116, 30	; 0x1d0
    1174:	2f00636f 	svccs	0x0000636f
    1178:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
    117c:	6462612f 	strbtvs	r6, [r2], #-303	; 0xfffffed1
    1180:	72616b69 	rsbvc	r6, r1, #107520	; 0x1a400
    1184:	642f6d69 	strtvs	r6, [pc], #-3433	; 118c <_heap_top+0x18c>
    1188:	4d2f7665 	stcmi	6, cr7, [pc, #-404]!	; ffc <CPSR_IRQ_INHIBIT+0xf7c>
    118c:	74694c79 	strbtvc	r4, [r9], #-3193	; 0xfffff387
    1190:	4f656c74 	svcmi	0x00656c74
    1194:	72732f53 	rsbsvc	r2, r3, #332	; 0x14c
    1198:	76732f63 	ldrbtvc	r2, [r3], -r3, ror #30
    119c:	00632e63 	rsbeq	r2, r3, r3, ror #28
    11a0:	5f637673 	svcpl	0x00637673
    11a4:	73677261 	cmnvc	r7, #268435462	; 0x10000006
    11a8:	6d756e00 	ldclvs	14, cr6, [r5, #-0]
    11ac:	00726562 	rsbseq	r6, r2, r2, ror #10
    11b0:	756c6176 	strbvc	r6, [ip, #-374]!	; 0xfffffe8a
    11b4:	6e695f65 	cdpvs	15, 6, cr5, cr9, cr5, {3}
    11b8:	6765725f 			; <UNDEFINED> instruction: 0x6765725f
    11bc:	2f00305f 	svccs	0x0000305f
    11c0:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
    11c4:	6462612f 	strbtvs	r6, [r2], #-303	; 0xfffffed1
    11c8:	72616b69 	rsbvc	r6, r1, #107520	; 0x1a400
    11cc:	642f6d69 	strtvs	r6, [pc], #-3433	; 11d4 <_heap_top+0x1d4>
    11d0:	4d2f7665 	stcmi	6, cr7, [pc, #-404]!	; 1044 <_heap_top+0x44>
    11d4:	74694c79 	strbtvc	r4, [r9], #-3193	; 0xfffff387
    11d8:	4f656c74 	svcmi	0x00656c74
    11dc:	696c2f53 	stmdbvs	ip!, {r0, r1, r4, r6, r8, r9, sl, fp, sp}^
    11e0:	69662f62 	stmdbvs	r6!, {r1, r5, r6, r8, r9, sl, fp, sp}^
    11e4:	632e6f66 			; <UNDEFINED> instruction: 0x632e6f66
    11e8:	66696600 	strbtvs	r6, [r9], -r0, lsl #12
    11ec:	72775f6f 	rsbsvc	r5, r7, #444	; 0x1bc
    11f0:	00657469 	rsbeq	r7, r5, r9, ror #8
    11f4:	6f666966 	svcvs	0x00666966
    11f8:	696e695f 	stmdbvs	lr!, {r0, r1, r2, r3, r4, r6, r8, fp, sp, lr}^
    11fc:	69660074 	stmdbvs	r6!, {r2, r4, r5, r6}^
    1200:	725f6f66 	subsvc	r6, pc, #408	; 0x198
    1204:	00646165 	rsbeq	r6, r4, r5, ror #2
    1208:	726f7473 	rsbvc	r7, pc, #1929379840	; 0x73000000
    120c:	00656761 	rsbeq	r6, r5, r1, ror #14
    1210:	6e697270 	mcrvs	2, 3, r7, cr9, cr0, {3}
    1214:	61684374 	smcvs	33844	; 0x8434
    1218:	682f0072 	stmdavs	pc!, {r1, r4, r5, r6}	; <UNPREDICTABLE>
    121c:	2f656d6f 	svccs	0x00656d6f
    1220:	69646261 	stmdbvs	r4!, {r0, r5, r6, r9, sp, lr}^
    1224:	6972616b 	ldmdbvs	r2!, {r0, r1, r3, r5, r6, r8, sp, lr}^
    1228:	65642f6d 	strbvs	r2, [r4, #-3949]!	; 0xfffff093
    122c:	794d2f76 	stmdbvc	sp, {r1, r2, r4, r5, r6, r8, r9, sl, fp, sp}^
    1230:	7474694c 	ldrbtvc	r6, [r4], #-2380	; 0xfffff6b4
    1234:	534f656c 	movtpl	r6, #62828	; 0xf56c
    1238:	62696c2f 	rsbvs	r6, r9, #12032	; 0x2f00
    123c:	6972702f 	ldmdbvs	r2!, {r0, r1, r2, r3, r5, ip, sp, lr}^
    1240:	632e746e 			; <UNDEFINED> instruction: 0x632e746e
	...

Disassembly of section .ARM.attributes:

00000000 <.ARM.attributes>:
   0:	00003041 	andeq	r3, r0, r1, asr #32
   4:	61656100 	cmnvs	r5, r0, lsl #2
   8:	01006962 	tsteq	r0, r2, ror #18
   c:	00000026 	andeq	r0, r0, r6, lsr #32
  10:	4b5a3605 	blmi	168d82c <_stack+0x160d82c>
  14:	08070600 	stmdaeq	r7, {r9, sl}
  18:	0a010901 	beq	42424 <__bss_end__+0x38edc>
  1c:	14041202 	strne	r1, [r4], #-514	; 0xfffffdfe
  20:	17011501 	strne	r1, [r1, -r1, lsl #10]
  24:	1a011803 	bne	46038 <__bss_end__+0x3caf0>
  28:	1e011c01 	cdpne	12, 0, cr1, cr1, cr1, {0}
  2c:	44012206 	strmi	r2, [r1], #-518	; 0xfffffdfa
  30:	Address 0x0000000000000030 is out of bounds.

