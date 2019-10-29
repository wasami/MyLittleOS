
C:/Users/Abdikarim/dev/MyOS/Blinking_LED/kernel.elf:     file format elf32-littlearm


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
    8024:	00008150 	andeq	r8, r0, r0, asr r1

00008028 <_software_interrupt_vector_h>:
    8028:	00008154 	andeq	r8, r0, r4, asr r1

0000802c <_prefetch_abort_vector_h>:
    802c:	00008158 	andeq	r8, r0, r8, asr r1

00008030 <_data_abort_vector_h>:
    8030:	0000815c 	andeq	r8, r0, ip, asr r1

00008034 <_unused_handler_h>:
    8034:	00008040 	andeq	r8, r0, r0, asr #32

00008038 <_interrupt_vector_h>:
    8038:	00008160 	andeq	r8, r0, r0, ror #2

0000803c <_fast_interrupt_vector_h>:
    803c:	000081b4 			; <UNDEFINED> instruction: 0x000081b4

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
    8070:	ea000017 	b	80d4 <_cstartup>

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

00008094 <kernel_main>:
    8094:	e92d4010 	push	{r4, lr}
    8098:	eb000024 	bl	8130 <RPI_GetGpio>
    809c:	e5903004 	ldr	r3, [r0, #4]
    80a0:	e3833701 	orr	r3, r3, #262144	; 0x40000
    80a4:	e5803004 	str	r3, [r0, #4]
    80a8:	eb000024 	bl	8140 <RPI_GetIrqController>
    80ac:	e3a03001 	mov	r3, #1
    80b0:	e5803018 	str	r3, [r0, #24]
    80b4:	eb000019 	bl	8120 <RPI_GetArmTimer>
    80b8:	e3a03b01 	mov	r3, #1024	; 0x400
    80bc:	e5803000 	str	r3, [r0]
    80c0:	eb000016 	bl	8120 <RPI_GetArmTimer>
    80c4:	e3a030aa 	mov	r3, #170	; 0xaa
    80c8:	e5803008 	str	r3, [r0, #8]
    80cc:	ebffffec 	bl	8084 <_enable_interrupts>
    80d0:	eafffffe 	b	80d0 <kernel_main+0x3c>

000080d4 <_cstartup>:
    80d4:	e59fc03c 	ldr	ip, [pc, #60]	; 8118 <_cstartup+0x44>
    80d8:	e59f303c 	ldr	r3, [pc, #60]	; 811c <_cstartup+0x48>
    80dc:	e92d4010 	push	{r4, lr}
    80e0:	e15c0003 	cmp	ip, r3
    80e4:	2a000009 	bcs	8110 <_cstartup+0x3c>
    80e8:	e1a0e00c 	mov	lr, ip
    80ec:	e3a04000 	mov	r4, #0
    80f0:	e2433001 	sub	r3, r3, #1
    80f4:	e043300c 	sub	r3, r3, ip
    80f8:	e3c33003 	bic	r3, r3, #3
    80fc:	e2833004 	add	r3, r3, #4
    8100:	e08c3003 	add	r3, ip, r3
    8104:	e48e4004 	str	r4, [lr], #4
    8108:	e15e0003 	cmp	lr, r3
    810c:	1afffffc 	bne	8104 <_cstartup+0x30>
    8110:	ebffffdf 	bl	8094 <kernel_main>
    8114:	eafffffe 	b	8114 <_cstartup+0x40>
    8118:	000081f8 	strdeq	r8, [r0], -r8	; <UNPREDICTABLE>
    811c:	000081fc 	strdeq	r8, [r0], -ip

00008120 <RPI_GetArmTimer>:
    8120:	e59f0000 	ldr	r0, [pc]	; 8128 <RPI_GetArmTimer+0x8>
    8124:	e12fff1e 	bx	lr
    8128:	2000b400 	andcs	fp, r0, r0, lsl #8

0000812c <RPI_ArmTimerInit>:
    812c:	e12fff1e 	bx	lr

00008130 <RPI_GetGpio>:
    8130:	e59f0000 	ldr	r0, [pc]	; 8138 <RPI_GetGpio+0x8>
    8134:	e12fff1e 	bx	lr
    8138:	20200000 	eorcs	r0, r0, r0

0000813c <RPI_GpioInit>:
    813c:	e12fff1e 	bx	lr

00008140 <RPI_GetIrqController>:
    8140:	e59f0000 	ldr	r0, [pc]	; 8148 <RPI_GetIrqController+0x8>
    8144:	e12fff1e 	bx	lr
    8148:	2000b200 	andcs	fp, r0, r0, lsl #4

0000814c <reset_vector>:
    814c:	e25ef004 	subs	pc, lr, #4

00008150 <undefined_instruction_vector>:
    8150:	eafffffe 	b	8150 <undefined_instruction_vector>

00008154 <software_interrupt_vector>:
    8154:	eafffffe 	b	8154 <software_interrupt_vector>

00008158 <prefetch_abort_vector>:
    8158:	e25ef004 	subs	pc, lr, #4

0000815c <data_abort_vector>:
    815c:	e25ef004 	subs	pc, lr, #4

00008160 <interrupt_vector>:
    8160:	e24ee004 	sub	lr, lr, #4
    8164:	e92d503f 	push	{r0, r1, r2, r3, r4, r5, ip, lr}
    8168:	ebffffec 	bl	8120 <RPI_GetArmTimer>
    816c:	e3a05001 	mov	r5, #1
    8170:	e59f4038 	ldr	r4, [pc, #56]	; 81b0 <interrupt_vector+0x50>
    8174:	e580500c 	str	r5, [r0, #12]
    8178:	e5943000 	ldr	r3, [r4]
    817c:	e3530000 	cmp	r3, #0
    8180:	0a000005 	beq	819c <interrupt_vector+0x3c>
    8184:	ebffffe9 	bl	8130 <RPI_GetGpio>
    8188:	e3a02801 	mov	r2, #65536	; 0x10000
    818c:	e3a03000 	mov	r3, #0
    8190:	e580201c 	str	r2, [r0, #28]
    8194:	e5843000 	str	r3, [r4]
    8198:	e8fd903f 	ldm	sp!, {r0, r1, r2, r3, r4, r5, ip, pc}^
    819c:	ebffffe3 	bl	8130 <RPI_GetGpio>
    81a0:	e3a03801 	mov	r3, #65536	; 0x10000
    81a4:	e5845000 	str	r5, [r4]
    81a8:	e5803028 	str	r3, [r0, #40]	; 0x28
    81ac:	e8fd903f 	ldm	sp!, {r0, r1, r2, r3, r4, r5, ip, pc}^
    81b0:	000081f8 	strdeq	r8, [r0], -r8	; <UNPREDICTABLE>

000081b4 <fast_interrupt_vector>:
    81b4:	e25ef004 	subs	pc, lr, #4

000081b8 <RPI_GetSystemTimer>:
    81b8:	e59f0000 	ldr	r0, [pc]	; 81c0 <RPI_GetSystemTimer+0x8>
    81bc:	e12fff1e 	bx	lr
    81c0:	20003000 	andcs	r3, r0, r0

000081c4 <RPI_WaitMicroSeconds>:
    81c4:	e59f3028 	ldr	r3, [pc, #40]	; 81f4 <RPI_WaitMicroSeconds+0x30>
    81c8:	e24dd008 	sub	sp, sp, #8
    81cc:	e1a01003 	mov	r1, r3
    81d0:	e5933004 	ldr	r3, [r3, #4]
    81d4:	e58d3004 	str	r3, [sp, #4]
    81d8:	e5913004 	ldr	r3, [r1, #4]
    81dc:	e59d2004 	ldr	r2, [sp, #4]
    81e0:	e0433002 	sub	r3, r3, r2
    81e4:	e1530000 	cmp	r3, r0
    81e8:	3afffffa 	bcc	81d8 <RPI_WaitMicroSeconds+0x14>
    81ec:	e28dd008 	add	sp, sp, #8
    81f0:	e12fff1e 	bx	lr
    81f4:	20003000 	andcs	r3, r0, r0

Disassembly of section .bss:

000081f8 <__bss_start>:
    81f8:	00000000 	andeq	r0, r0, r0

Disassembly of section .comment:

00000000 <_stack-0x80000>:
   0:	3a434347 	bcc	10d0d24 <_stack+0x1050d24>
   4:	4e472820 	cdpmi	8, 4, cr2, cr7, cr0, {1}
   8:	6f542055 	svcvs	0x00542055
   c:	20736c6f 	rsbscs	r6, r3, pc, ror #24
  10:	20726f66 	rsbscs	r6, r2, r6, ror #30
  14:	206d7241 	rsbcs	r7, sp, r1, asr #4
  18:	65626d45 	strbvs	r6, [r2, #-3397]!	; 0xfffff2bb
  1c:	64656464 	strbtvs	r6, [r5], #-1124	; 0xfffffb9c
  20:	6f725020 	svcvs	0x00725020
  24:	73736563 	cmnvc	r3, #415236096	; 0x18c00000
  28:	2073726f 	rsbscs	r7, r3, pc, ror #4
  2c:	30322d38 	eorscc	r2, r2, r8, lsr sp
  30:	712d3931 			; <UNDEFINED> instruction: 0x712d3931
  34:	70752d33 	rsbsvc	r2, r5, r3, lsr sp
  38:	65746164 	ldrbvs	r6, [r4, #-356]!	; 0xfffffe9c
  3c:	2e382029 	cdpcs	0, 3, cr2, cr8, cr9, {1}
  40:	20312e33 	eorscs	r2, r1, r3, lsr lr
  44:	39313032 	ldmdbcc	r1!, {r1, r4, r5, ip, sp}
  48:	33303730 	teqcc	r0, #48, 14	; 0xc00000
  4c:	65722820 	ldrbvs	r2, [r2, #-2080]!	; 0xfffff7e0
  50:	7361656c 	cmnvc	r1, #108, 10	; 0x1b000000
  54:	5b202965 	blpl	80a5f0 <_stack+0x78a5f0>
  58:	2d636367 	stclcs	3, cr6, [r3, #-412]!	; 0xfffffe64
  5c:	72622d38 	rsbvc	r2, r2, #56, 26	; 0xe00
  60:	68636e61 	stmdavs	r3!, {r0, r5, r6, r9, sl, fp, sp, lr}^
  64:	76657220 	strbtvc	r7, [r5], -r0, lsr #4
  68:	6f697369 	svcvs	0x00697369
  6c:	3732206e 	ldrcc	r2, [r2, -lr, rrx]!
  70:	37323033 			; <UNDEFINED> instruction: 0x37323033
  74:	Address 0x00000074 is out of bounds.


Disassembly of section .debug_aranges:

00000000 <.debug_aranges>:
   0:	0000001c 	andeq	r0, r0, ip, lsl r0
   4:	00000002 	andeq	r0, r0, r2
   8:	00040000 	andeq	r0, r4, r0
   c:	00000000 	andeq	r0, r0, r0
  10:	00008094 	muleq	r0, r4, r0
  14:	00000040 	andeq	r0, r0, r0, asr #32
	...
  20:	0000001c 	andeq	r0, r0, ip, lsl r0
  24:	011a0002 	tsteq	sl, r2
  28:	00040000 	andeq	r0, r4, r0
  2c:	00000000 	andeq	r0, r0, r0
  30:	000080d4 	ldrdeq	r8, [r0], -r4
  34:	0000004c 	andeq	r0, r0, ip, asr #32
	...
  40:	0000001c 	andeq	r0, r0, ip, lsl r0
  44:	01f10002 	mvnseq	r0, r2
  48:	00040000 	andeq	r0, r4, r0
  4c:	00000000 	andeq	r0, r0, r0
  50:	00008120 	andeq	r8, r0, r0, lsr #2
  54:	00000010 	andeq	r0, r0, r0, lsl r0
	...
  60:	0000001c 	andeq	r0, r0, ip, lsl r0
  64:	033f0002 	teqeq	pc, #2
  68:	00040000 	andeq	r0, r4, r0
  6c:	00000000 	andeq	r0, r0, r0
  70:	00008130 	andeq	r8, r0, r0, lsr r1
  74:	00000010 	andeq	r0, r0, r0, lsl r0
	...
  80:	0000001c 	andeq	r0, r0, ip, lsl r0
  84:	06560002 	ldrbeq	r0, [r6], -r2
  88:	00040000 	andeq	r0, r4, r0
  8c:	00000000 	andeq	r0, r0, r0
  90:	00008140 	andeq	r8, r0, r0, asr #2
  94:	00000078 	andeq	r0, r0, r8, ror r0
	...
  a0:	0000001c 	andeq	r0, r0, ip, lsl r0
  a4:	08530002 	ldmdaeq	r3, {r1}^
  a8:	00040000 	andeq	r0, r4, r0
  ac:	00000000 	andeq	r0, r0, r0
  b0:	000081b8 			; <UNDEFINED> instruction: 0x000081b8
  b4:	00000040 	andeq	r0, r0, r0, asr #32
	...
  c0:	0000001c 	andeq	r0, r0, ip, lsl r0
  c4:	09a70002 	stmibeq	r7!, {r1}
  c8:	00040000 	andeq	r0, r4, r0
  cc:	00000000 	andeq	r0, r0, r0
  d0:	00008000 	andeq	r8, r0, r0
  d4:	00000094 	muleq	r0, r4, r0
	...

Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	00000116 	andeq	r0, r0, r6, lsl r1
   4:	00000004 	andeq	r0, r0, r4
   8:	01040000 	mrseq	r0, (UNDEF: 4)
   c:	000000e9 	andeq	r0, r0, r9, ror #1
  10:	0000210c 	andeq	r2, r0, ip, lsl #2
  14:	00009100 	andeq	r9, r0, r0, lsl #2
  18:	00809400 	addeq	r9, r0, r0, lsl #8
  1c:	00004000 	andeq	r4, r0, r0
  20:	00000000 	andeq	r0, r0, r0
  24:	06010200 	streq	r0, [r1], -r0, lsl #4
  28:	00000079 	andeq	r0, r0, r9, ror r0
  2c:	77080102 	strvc	r0, [r8, -r2, lsl #2]
  30:	02000000 	andeq	r0, r0, #0
  34:	01770502 	cmneq	r7, r2, lsl #10
  38:	02020000 	andeq	r0, r2, #0
  3c:	0000c607 	andeq	ip, r0, r7, lsl #12
  40:	05040200 	streq	r0, [r4, #-512]	; 0xfffffe00
  44:	00000005 	andeq	r0, r0, r5
  48:	65070402 	strvs	r0, [r7, #-1026]	; 0xfffffbfe
  4c:	02000000 	andeq	r0, r0, #0
  50:	00000508 	andeq	r0, r0, r8, lsl #10
  54:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
  58:	00006007 	andeq	r6, r0, r7
  5c:	05040300 	streq	r0, [r4, #-768]	; 0xfffffd00
  60:	00746e69 	rsbseq	r6, r4, r9, ror #28
  64:	6a070402 	bvs	1c1074 <_stack+0x141074>
  68:	04000000 	streq	r0, [r0], #-0
  6c:	000000ba 	strheq	r0, [r0], -sl
  70:	94060b01 	strls	r0, [r6], #-2817	; 0xfffff4ff
  74:	40000080 	andmi	r0, r0, r0, lsl #1
  78:	01000000 	mrseq	r0, (UNDEF: 0)
  7c:	0000e99c 	muleq	r0, ip, r9
  80:	30720500 	rsbscc	r0, r2, r0, lsl #10
  84:	200b0100 	andcs	r0, fp, r0, lsl #2
  88:	00000064 	andeq	r0, r0, r4, rrx
  8c:	00000004 	andeq	r0, r0, r4
  90:	00000000 	andeq	r0, r0, r0
  94:	00317205 	eorseq	r7, r1, r5, lsl #4
  98:	64310b01 	ldrtvs	r0, [r1], #-2817	; 0xfffff4ff
  9c:	29000000 	stmdbcs	r0, {}	; <UNPREDICTABLE>
  a0:	25000000 	strcs	r0, [r0, #-0]
  a4:	06000000 	streq	r0, [r0], -r0
  a8:	0000005a 	andeq	r0, r0, sl, asr r0
  ac:	64420b01 	strbvs	r0, [r2], #-2817	; 0xfffff4ff
  b0:	4e000000 	cdpmi	0, 0, cr0, cr0, cr0, {0}
  b4:	4a000000 	bmi	bc <CPSR_IRQ_INHIBIT+0x3c>
  b8:	07000000 	streq	r0, [r0, -r0]
  bc:	0000809c 	muleq	r0, ip, r0
  c0:	000000e9 	andeq	r0, r0, r9, ror #1
  c4:	0080ac07 	addeq	sl, r0, r7, lsl #24
  c8:	0000f500 	andeq	pc, r0, r0, lsl #10
  cc:	80b80700 	adcshi	r0, r8, r0, lsl #14
  d0:	01010000 	mrseq	r0, (UNDEF: 1)
  d4:	c4070000 	strgt	r0, [r7], #-0
  d8:	01000080 	smlabbeq	r0, r0, r0, r0
  dc:	07000001 	streq	r0, [r0, -r1]
  e0:	000080d0 	ldrdeq	r8, [r0], -r0
  e4:	0000010d 	andeq	r0, r0, sp, lsl #2
  e8:	00850800 	addeq	r0, r5, r0, lsl #16
  ec:	00850000 	addeq	r0, r5, r0
  f0:	82020000 	andhi	r0, r2, #0
  f4:	01810814 	orreq	r0, r1, r4, lsl r8
  f8:	01810000 	orreq	r0, r1, r0
  fc:	33030000 	movwcc	r0, #12288	; 0x3000
 100:	00d9081e 	sbcseq	r0, r9, lr, lsl r8
 104:	00d90000 	sbcseq	r0, r9, r0
 108:	77040000 	strvc	r0, [r4, -r0]
 10c:	000e0819 	andeq	r0, lr, r9, lsl r8
 110:	000e0000 	andeq	r0, lr, r0
 114:	08010000 	stmdaeq	r1, {}	; <UNPREDICTABLE>
 118:	00d3000d 	sbcseq	r0, r3, sp
 11c:	00040000 	andeq	r0, r4, r0
 120:	0000008c 	andeq	r0, r0, ip, lsl #1
 124:	00e90104 	rsceq	r0, r9, r4, lsl #2
 128:	c20c0000 	andgt	r0, ip, #0
 12c:	91000001 	tstls	r0, r1
 130:	d4000000 	strle	r0, [r0], #-0
 134:	4c000080 	stcmi	0, cr0, [r0], {128}	; 0x80
 138:	db000000 	blle	140 <CPSR_IRQ_INHIBIT+0xc0>
 13c:	02000000 	andeq	r0, r0, #0
 140:	000001b4 			; <UNDEFINED> instruction: 0x000001b4
 144:	310c0101 	tstcc	ip, r1, lsl #2
 148:	03000000 	movweq	r0, #0
 14c:	6e690504 	cdpvs	5, 6, cr0, cr9, cr4, {0}
 150:	96020074 			; <UNDEFINED> instruction: 0x96020074
 154:	01000001 	tsteq	r0, r1
 158:	00310c02 	eorseq	r0, r1, r2, lsl #24
 15c:	a2040000 	andge	r0, r4, #0
 160:	01000001 	tsteq	r0, r1
 164:	80d40606 	sbcshi	r0, r4, r6, lsl #12
 168:	004c0000 	subeq	r0, ip, r0
 16c:	9c010000 	stcls	0, cr0, [r1], {-0}
 170:	000000bd 	strheq	r0, [r0], -sp
 174:	00307205 	eorseq	r7, r0, r5, lsl #4
 178:	bd1e0601 	ldclt	6, cr0, [lr, #-4]
 17c:	73000000 	movwvc	r0, #0
 180:	6f000000 	svcvs	0x00000000
 184:	05000000 	streq	r0, [r0, #-0]
 188:	01003172 	tsteq	r0, r2, ror r1
 18c:	00bd2f06 	adcseq	r2, sp, r6, lsl #30
 190:	00980000 	addseq	r0, r8, r0
 194:	00940000 	addseq	r0, r4, r0
 198:	72050000 	andvc	r0, r5, #0
 19c:	06010032 			; <UNDEFINED> instruction: 0x06010032
 1a0:	0000bd40 	andeq	fp, r0, r0, asr #26
 1a4:	0000bd00 	andeq	fp, r0, r0, lsl #26
 1a8:	0000b900 	andeq	fp, r0, r0, lsl #18
 1ac:	73620600 	cmnvc	r2, #0, 12
 1b0:	09010073 	stmdbeq	r1, {r0, r1, r4, r5, r6}
 1b4:	0000c40a 	andeq	ip, r0, sl, lsl #8
 1b8:	0000e000 	andeq	lr, r0, r0
 1bc:	0000de00 	andeq	sp, r0, r0, lsl #28
 1c0:	01ac0700 			; <UNDEFINED> instruction: 0x01ac0700
 1c4:	0a010000 	beq	401cc <__bss_end__+0x37fd0>
 1c8:	0000c40a 	andeq	ip, r0, sl, lsl #8
 1cc:	81140800 	tsthi	r4, r0, lsl #16
 1d0:	00ca0000 	sbceq	r0, sl, r0
 1d4:	09000000 	stmdbeq	r0, {}	; <UNPREDICTABLE>
 1d8:	006a0704 	rsbeq	r0, sl, r4, lsl #14
 1dc:	040a0000 	streq	r0, [sl], #-0
 1e0:	00000031 	andeq	r0, r0, r1, lsr r0
 1e4:	0000ba0b 	andeq	fp, r0, fp, lsl #20
 1e8:	0000ba00 	andeq	fp, r0, r0, lsl #20
 1ec:	0d040100 	stfeqs	f0, [r4, #-0]
 1f0:	00014a00 	andeq	r4, r1, r0, lsl #20
 1f4:	43000400 	movwmi	r0, #1024	; 0x400
 1f8:	04000001 	streq	r0, [r0], #-1
 1fc:	0000e901 	andeq	lr, r0, r1, lsl #18
 200:	02800c00 	addeq	r0, r0, #0, 24
 204:	00910000 	addseq	r0, r1, r0
 208:	81200000 			; <UNDEFINED> instruction: 0x81200000
 20c:	00100000 	andseq	r0, r0, r0
 210:	017e0000 	cmneq	lr, r0
 214:	01020000 	mrseq	r0, (UNDEF: 2)
 218:	00007906 	andeq	r7, r0, r6, lsl #18
 21c:	08010200 	stmdaeq	r1, {r9}
 220:	00000077 	andeq	r0, r0, r7, ror r0
 224:	77050202 	strvc	r0, [r5, -r2, lsl #4]
 228:	02000001 	andeq	r0, r0, #1
 22c:	00c60702 	sbceq	r0, r6, r2, lsl #14
 230:	04020000 	streq	r0, [r2], #-0
 234:	00000505 	andeq	r0, r0, r5, lsl #10
 238:	02350300 	eorseq	r0, r5, #0, 6
 23c:	4f020000 	svcmi	0x00020000
 240:	00005419 	andeq	r5, r0, r9, lsl r4
 244:	07040200 	streq	r0, [r4, -r0, lsl #4]
 248:	00000065 	andeq	r0, r0, r5, rrx
 24c:	00050802 	andeq	r0, r5, r2, lsl #16
 250:	02000000 	andeq	r0, r0, #0
 254:	00600708 	rsbeq	r0, r0, r8, lsl #14
 258:	04040000 	streq	r0, [r4], #-0
 25c:	746e6905 	strbtvc	r6, [lr], #-2309	; 0xfffff6fb
 260:	07040200 	streq	r0, [r4, -r0, lsl #4]
 264:	0000006a 	andeq	r0, r0, sl, rrx
 268:	00023703 	andeq	r3, r2, r3, lsl #14
 26c:	14300300 	ldrtne	r0, [r0], #-768	; 0xfffffd00
 270:	00000048 	andeq	r0, r0, r8, asr #32
 274:	00007705 	andeq	r7, r0, r5, lsl #14
 278:	04240600 	strteq	r0, [r4], #-1536	; 0xfffffa00
 27c:	01070928 	tsteq	r7, r8, lsr #18
 280:	f6070000 			; <UNDEFINED> instruction: 0xf6070000
 284:	04000001 	streq	r0, [r0], #-1
 288:	0083172e 	addeq	r1, r3, lr, lsr #14
 28c:	07000000 	streq	r0, [r0, -r0]
 290:	0000022f 	andeq	r0, r0, pc, lsr #4
 294:	83173504 	tsthi	r7, #4, 10	; 0x1000000
 298:	04000000 	streq	r0, [r0], #-0
 29c:	00025e07 	andeq	r5, r2, r7, lsl #28
 2a0:	173c0400 	ldrne	r0, [ip, -r0, lsl #8]!
 2a4:	00000083 	andeq	r0, r0, r3, lsl #1
 2a8:	02770708 	rsbseq	r0, r7, #8, 14	; 0x200000
 2ac:	41040000 	mrsmi	r0, (UNDEF: 4)
 2b0:	00008317 	andeq	r8, r0, r7, lsl r3
 2b4:	1e070c00 	cdpne	12, 0, cr0, cr7, cr0, {0}
 2b8:	04000002 	streq	r0, [r0], #-2
 2bc:	0083174b 	addeq	r1, r3, fp, asr #14
 2c0:	07100000 	ldreq	r0, [r0, -r0]
 2c4:	00000225 	andeq	r0, r0, r5, lsr #4
 2c8:	83175204 	tsthi	r7, #4, 4	; 0x40000000
 2cc:	14000000 	strne	r0, [r0], #-0
 2d0:	0001fb07 	andeq	pc, r1, r7, lsl #22
 2d4:	17590400 	ldrbne	r0, [r9, -r0, lsl #8]
 2d8:	00000083 	andeq	r0, r0, r3, lsl #1
 2dc:	02400718 	subeq	r0, r0, #24, 14	; 0x600000
 2e0:	64040000 	strvs	r0, [r4], #-0
 2e4:	00008317 	andeq	r8, r0, r7, lsl r3
 2e8:	4b071c00 	blmi	1c72f0 <_stack+0x1472f0>
 2ec:	04000002 	streq	r0, [r0], #-2
 2f0:	00831772 	addeq	r1, r3, r2, ror r7
 2f4:	00200000 	eoreq	r0, r0, r0
 2f8:	00020203 	andeq	r0, r2, r3, lsl #4
 2fc:	07740400 	ldrbeq	r0, [r4, -r0, lsl #8]!
 300:	00000088 	andeq	r0, r0, r8, lsl #1
 304:	00021208 	andeq	r1, r2, r8, lsl #4
 308:	190e0100 	stmdbne	lr, {r8}
 30c:	0000011f 	andeq	r0, r0, pc, lsl r1
 310:	01070409 	tsteq	r7, r9, lsl #8
 314:	660a0000 	strvs	r0, [sl], -r0
 318:	01000002 	tsteq	r0, r2
 31c:	812c0615 			; <UNDEFINED> instruction: 0x812c0615
 320:	00040000 	andeq	r0, r4, r0
 324:	9c010000 	stcls	0, cr0, [r1], {-0}
 328:	0000d90b 	andeq	sp, r0, fp, lsl #18
 32c:	12100100 	andsne	r0, r0, #0, 2
 330:	0000011f 	andeq	r0, r0, pc, lsl r1
 334:	00008120 	andeq	r8, r0, r0, lsr #2
 338:	0000000c 	andeq	r0, r0, ip
 33c:	13009c01 	movwne	r9, #3073	; 0xc01
 340:	04000003 	streq	r0, [r0], #-3
 344:	0001f100 	andeq	pc, r1, r0, lsl #2
 348:	e9010400 	stmdb	r1, {sl}
 34c:	0c000000 	stceq	0, cr0, [r0], {-0}
 350:	000002fd 	strdeq	r0, [r0], -sp
 354:	00000091 	muleq	r0, r1, r0
 358:	00008130 	andeq	r8, r0, r0, lsr r1
 35c:	00000010 	andeq	r0, r0, r0, lsl r0
 360:	000002da 	ldrdeq	r0, [r0], -sl
 364:	79060102 	stmdbvc	r6, {r1, r8}
 368:	02000000 	andeq	r0, r0, #0
 36c:	00770801 	rsbseq	r0, r7, r1, lsl #16
 370:	02020000 	andeq	r0, r2, #0
 374:	00017705 	andeq	r7, r1, r5, lsl #14
 378:	07020200 	streq	r0, [r2, -r0, lsl #4]
 37c:	000000c6 	andeq	r0, r0, r6, asr #1
 380:	05050402 	streq	r0, [r5, #-1026]	; 0xfffffbfe
 384:	03000000 	movweq	r0, #0
 388:	00000235 	andeq	r0, r0, r5, lsr r2
 38c:	54194f02 	ldrpl	r4, [r9], #-3842	; 0xfffff0fe
 390:	02000000 	andeq	r0, r0, #0
 394:	00650704 	rsbeq	r0, r5, r4, lsl #14
 398:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
 39c:	00000005 	andeq	r0, r0, r5
 3a0:	07080200 	streq	r0, [r8, -r0, lsl #4]
 3a4:	00000060 	andeq	r0, r0, r0, rrx
 3a8:	69050404 	stmdbvs	r5, {r2, sl}
 3ac:	0200746e 	andeq	r7, r0, #1845493760	; 0x6e000000
 3b0:	006a0704 	rsbeq	r0, sl, r4, lsl #14
 3b4:	37030000 	strcc	r0, [r3, -r0]
 3b8:	03000002 	movweq	r0, #2
 3bc:	00481430 	subeq	r1, r8, r0, lsr r4
 3c0:	77050000 	strvc	r0, [r5, -r0]
 3c4:	06000000 	streq	r0, [r0], -r0
 3c8:	00000083 	andeq	r0, r0, r3, lsl #1
 3cc:	00042a03 	andeq	r2, r4, r3, lsl #20
 3d0:	1b120400 	blne	4813d8 <_stack+0x4013d8>
 3d4:	00000083 	andeq	r0, r0, r3, lsl #1
 3d8:	0003e203 	andeq	lr, r3, r3, lsl #4
 3dc:	21130400 	tstcs	r3, r0, lsl #8
 3e0:	00000088 	andeq	r0, r0, r8, lsl #1
 3e4:	00046103 	andeq	r6, r4, r3, lsl #2
 3e8:	1b140400 	blne	5013f0 <_stack+0x4813f0>
 3ec:	00000083 	andeq	r0, r0, r3, lsl #1
 3f0:	5505a407 	strpl	sl, [r5, #-1031]	; 0xfffffbf9
 3f4:	0002d009 	andeq	sp, r2, r9
 3f8:	02c60800 	sbceq	r0, r6, #0, 16
 3fc:	56050000 	strpl	r0, [r5], -r0
 400:	00008d15 	andeq	r8, r0, r5, lsl sp
 404:	ce080000 	cdpgt	0, 0, cr0, cr8, cr0, {0}
 408:	05000002 	streq	r0, [r0, #-2]
 40c:	008d1557 	addeq	r1, sp, r7, asr r5
 410:	08040000 	stmdaeq	r4, {}	; <UNPREDICTABLE>
 414:	000002d6 	ldrdeq	r0, [r0], -r6
 418:	8d155805 	ldchi	8, cr5, [r5, #-20]	; 0xffffffec
 41c:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
 420:	0002de08 	andeq	sp, r2, r8, lsl #28
 424:	15590500 	ldrbne	r0, [r9, #-1280]	; 0xfffffb00
 428:	0000008d 	andeq	r0, r0, sp, lsl #1
 42c:	02e6080c 	rsceq	r0, r6, #12, 16	; 0xc0000
 430:	5a050000 	bpl	140438 <_stack+0xc0438>
 434:	00008d15 	andeq	r8, r0, r5, lsl sp
 438:	ee081000 	cdp	0, 0, cr1, cr8, cr0, {0}
 43c:	05000002 	streq	r0, [r0, #-2]
 440:	008d155b 	addeq	r1, sp, fp, asr r5
 444:	08140000 	ldmdaeq	r4, {}	; <UNPREDICTABLE>
 448:	00000360 	andeq	r0, r0, r0, ror #6
 44c:	99155c05 	ldmdbls	r5, {r0, r2, sl, fp, ip, lr}
 450:	18000000 	stmdane	r0, {}	; <UNPREDICTABLE>
 454:	0002b808 	andeq	fp, r2, r8, lsl #16
 458:	155d0500 	ldrbne	r0, [sp, #-1280]	; 0xfffffb00
 45c:	000000a5 	andeq	r0, r0, r5, lsr #1
 460:	02bf081c 	adcseq	r0, pc, #28, 16	; 0x1c0000
 464:	5e050000 	cdppl	0, 0, cr0, cr5, cr0, {0}
 468:	0000a515 	andeq	sl, r0, r5, lsl r5
 46c:	6a082000 	bvs	208474 <_stack+0x188474>
 470:	05000003 	streq	r0, [r0, #-3]
 474:	0099155f 	addseq	r1, r9, pc, asr r5
 478:	08240000 	stmdaeq	r4!, {}	; <UNPREDICTABLE>
 47c:	00000480 	andeq	r0, r0, r0, lsl #9
 480:	a5156005 	ldrge	r6, [r5, #-5]
 484:	28000000 	stmdacs	r0, {}	; <UNPREDICTABLE>
 488:	0003db08 	andeq	sp, r3, r8, lsl #22
 48c:	15610500 	strbne	r0, [r1, #-1280]!	; 0xfffffb00
 490:	000000a5 	andeq	r0, r0, r5, lsr #1
 494:	0374082c 	cmneq	r4, #44, 16	; 0x2c0000
 498:	62050000 	andvs	r0, r5, #0
 49c:	00009915 	andeq	r9, r0, r5, lsl r9
 4a0:	37083000 	strcc	r3, [r8, -r0]
 4a4:	05000004 	streq	r0, [r0, #-4]
 4a8:	00a51563 	adceq	r1, r5, r3, ror #10
 4ac:	08340000 	ldmdaeq	r4!, {}	; <UNPREDICTABLE>
 4b0:	0000043e 	andeq	r0, r0, lr, lsr r4
 4b4:	a5156405 	ldrge	r6, [r5, #-1029]	; 0xfffffbfb
 4b8:	38000000 	stmdacc	r0, {}	; <UNPREDICTABLE>
 4bc:	00037e08 	andeq	r7, r3, r8, lsl #28
 4c0:	15650500 	strbne	r0, [r5, #-1280]!	; 0xfffffb00
 4c4:	00000099 	muleq	r0, r9, r0
 4c8:	039c083c 	orrseq	r0, ip, #60, 16	; 0x3c0000
 4cc:	66050000 	strvs	r0, [r5], -r0
 4d0:	0000a515 	andeq	sl, r0, r5, lsl r5
 4d4:	a3084000 	movwge	r4, #32768	; 0x8000
 4d8:	05000003 	streq	r0, [r0, #-3]
 4dc:	00a51567 	adceq	r1, r5, r7, ror #10
 4e0:	08440000 	stmdaeq	r4, {}^	; <UNPREDICTABLE>
 4e4:	00000388 	andeq	r0, r0, r8, lsl #7
 4e8:	99156805 	ldmdbls	r5, {r0, r2, fp, sp, lr}
 4ec:	48000000 	stmdami	r0, {}	; <UNPREDICTABLE>
 4f0:	00035208 	andeq	r5, r3, r8, lsl #4
 4f4:	15690500 	strbne	r0, [r9, #-1280]!	; 0xfffffb00
 4f8:	000000a5 	andeq	r0, r0, r5, lsr #1
 4fc:	0359084c 	cmpeq	r9, #76, 16	; 0x4c0000
 500:	6a050000 	bvs	140508 <_stack+0xc0508>
 504:	0000a515 	andeq	sl, r0, r5, lsl r5
 508:	92085000 	andls	r5, r8, #0
 50c:	05000003 	streq	r0, [r0, #-3]
 510:	0099156b 	addseq	r1, r9, fp, ror #10
 514:	08540000 	ldmdaeq	r4, {}^	; <UNPREDICTABLE>
 518:	0000046e 	andeq	r0, r0, lr, ror #8
 51c:	a5156c05 	ldrge	r6, [r5, #-3077]	; 0xfffff3fb
 520:	58000000 	stmdapl	r0, {}	; <UNPREDICTABLE>
 524:	0002f608 	andeq	pc, r2, r8, lsl #12
 528:	156d0500 	strbne	r0, [sp, #-1280]!	; 0xfffffb00
 52c:	000000a5 	andeq	r0, r0, r5, lsr #1
 530:	0445085c 	strbeq	r0, [r5], #-2140	; 0xfffff7a4
 534:	6e050000 	cdpvs	0, 0, cr0, cr5, cr0, {0}
 538:	00009915 	andeq	r9, r0, r5, lsl r9
 53c:	f7086000 			; <UNDEFINED> instruction: 0xf7086000
 540:	05000003 	streq	r0, [r0, #-3]
 544:	00a5156f 	adceq	r1, r5, pc, ror #10
 548:	08640000 	stmdaeq	r4!, {}^	; <UNPREDICTABLE>
 54c:	000003fe 	strdeq	r0, [r0], -lr
 550:	a5157005 	ldrge	r7, [r5, #-5]
 554:	68000000 	stmdavs	r0, {}	; <UNPREDICTABLE>
 558:	00044f08 	andeq	r4, r4, r8, lsl #30
 55c:	15710500 	ldrbne	r0, [r1, #-1280]!	; 0xfffffb00
 560:	00000099 	muleq	r0, r9, r0
 564:	03be086c 			; <UNDEFINED> instruction: 0x03be086c
 568:	72050000 	andvc	r0, r5, #0
 56c:	0000a515 	andeq	sl, r0, r5, lsl r5
 570:	23087000 	movwcs	r7, #32768	; 0x8000
 574:	05000004 	streq	r0, [r0, #-4]
 578:	00a51573 	adceq	r1, r5, r3, ror r5
 57c:	08740000 	ldmdaeq	r4!, {}^	; <UNPREDICTABLE>
 580:	000003aa 	andeq	r0, r0, sl, lsr #7
 584:	99157405 	ldmdbls	r5, {r0, r2, sl, ip, sp, lr}
 588:	78000000 	stmdavc	r0, {}	; <UNPREDICTABLE>
 58c:	00041b08 	andeq	r1, r4, r8, lsl #22
 590:	15750500 	ldrbne	r0, [r5, #-1280]!	; 0xfffffb00
 594:	000000a5 	andeq	r0, r0, r5, lsr #1
 598:	03ef087c 	mvneq	r0, #124, 16	; 0x7c0000
 59c:	76050000 	strvc	r0, [r5], -r0
 5a0:	0000a515 	andeq	sl, r0, r5, lsl r5
 5a4:	b4088000 	strlt	r8, [r8], #-0
 5a8:	05000003 	streq	r0, [r0, #-3]
 5ac:	00991577 	addseq	r1, r9, r7, ror r5
 5b0:	08840000 	stmeq	r4, {}	; <UNPREDICTABLE>
 5b4:	000003cb 	andeq	r0, r0, fp, asr #7
 5b8:	a5157805 	ldrge	r7, [r5, #-2053]	; 0xfffff7fb
 5bc:	88000000 	stmdahi	r0, {}	; <UNPREDICTABLE>
 5c0:	0003d308 	andeq	sp, r3, r8, lsl #6
 5c4:	15790500 	ldrbne	r0, [r9, #-1280]!	; 0xfffffb00
 5c8:	000000a5 	andeq	r0, r0, r5, lsr #1
 5cc:	0405088c 	streq	r0, [r5], #-2188	; 0xfffff774
 5d0:	7a050000 	bvc	1405d8 <_stack+0xc05d8>
 5d4:	00009915 	andeq	r9, r0, r5, lsl r9
 5d8:	c5089000 	strgt	r9, [r8, #-0]
 5dc:	05000003 	streq	r0, [r0, #-3]
 5e0:	00a5157b 	adceq	r1, r5, fp, ror r5
 5e4:	08940000 	ldmeq	r4, {}	; <UNPREDICTABLE>
 5e8:	00000331 	andeq	r0, r0, r1, lsr r3
 5ec:	a5157c05 	ldrge	r7, [r5, #-3077]	; 0xfffff3fb
 5f0:	98000000 	stmdals	r0, {}	; <UNPREDICTABLE>
 5f4:	00033b08 	andeq	r3, r3, r8, lsl #22
 5f8:	157d0500 	ldrbne	r0, [sp, #-1280]!	; 0xfffffb00
 5fc:	000000a5 	andeq	r0, r0, r5, lsr #1
 600:	0410089c 	ldreq	r0, [r0], #-2204	; 0xfffff764
 604:	7e050000 	cdpvc	0, 0, cr0, cr5, cr0, {0}
 608:	00009915 	andeq	r9, r0, r5, lsl r9
 60c:	0300a000 	movweq	sl, #0
 610:	00000475 	andeq	r0, r0, r5, ror r4
 614:	b1037f05 	tstlt	r3, r5, lsl #30
 618:	09000000 	stmdbeq	r0, {}	; <UNPREDICTABLE>
 61c:	00000459 	andeq	r0, r0, r9, asr r4
 620:	e8140e01 	ldmda	r4, {r0, r9, sl, fp}
 624:	0a000002 	beq	634 <CPSR_IRQ_INHIBIT+0x5b4>
 628:	0002d004 	andeq	sp, r2, r4
 62c:	03450b00 	movteq	r0, #23296	; 0x5b00
 630:	15010000 	strne	r0, [r1, #-0]
 634:	00813c06 	addeq	r3, r1, r6, lsl #24
 638:	00000400 	andeq	r0, r0, r0, lsl #8
 63c:	0c9c0100 	ldfeqs	f0, [ip], {0}
 640:	00000085 	andeq	r0, r0, r5, lsl #1
 644:	e80d1001 	stmda	sp, {r0, ip}
 648:	30000002 	andcc	r0, r0, r2
 64c:	0c000081 	stceq	0, cr0, [r0], {129}	; 0x81
 650:	01000000 	mrseq	r0, (UNDEF: 0)
 654:	01f9009c 			; <UNDEFINED> instruction: 0x01f9009c
 658:	00040000 	andeq	r0, r4, r0
 65c:	000002a6 	andeq	r0, r0, r6, lsr #5
 660:	00e90104 	rsceq	r0, r9, r4, lsl #2
 664:	720c0000 	andvc	r0, ip, #0
 668:	91000005 	tstls	r0, r5
 66c:	40000000 	andmi	r0, r0, r0
 670:	78000081 	stmdavc	r0, {r0, r7}
 674:	3c000000 	stccc	0, cr0, [r0], {-0}
 678:	02000004 	andeq	r0, r0, #4
 67c:	00790601 	rsbseq	r0, r9, r1, lsl #12
 680:	01020000 	mrseq	r0, (UNDEF: 2)
 684:	00007708 	andeq	r7, r0, r8, lsl #14
 688:	05020200 	streq	r0, [r2, #-512]	; 0xfffffe00
 68c:	00000177 	andeq	r0, r0, r7, ror r1
 690:	c6070202 	strgt	r0, [r7], -r2, lsl #4
 694:	02000000 	andeq	r0, r0, #0
 698:	00050504 	andeq	r0, r5, r4, lsl #10
 69c:	35030000 	strcc	r0, [r3, #-0]
 6a0:	02000002 	andeq	r0, r0, #2
 6a4:	0054194f 	subseq	r1, r4, pc, asr #18
 6a8:	04020000 	streq	r0, [r2], #-0
 6ac:	00006507 	andeq	r6, r0, r7, lsl #10
 6b0:	05080200 	streq	r0, [r8, #-512]	; 0xfffffe00
 6b4:	00000000 	andeq	r0, r0, r0
 6b8:	60070802 	andvs	r0, r7, r2, lsl #16
 6bc:	04000000 	streq	r0, [r0], #-0
 6c0:	6e690504 	cdpvs	5, 6, cr0, cr9, cr4, {0}
 6c4:	04020074 	streq	r0, [r2], #-116	; 0xffffff8c
 6c8:	00006a07 	andeq	r6, r0, r7, lsl #20
 6cc:	02370300 	eorseq	r0, r7, #0, 6
 6d0:	30030000 	andcc	r0, r3, r0
 6d4:	00004814 	andeq	r4, r0, r4, lsl r8
 6d8:	00770500 	rsbseq	r0, r7, r0, lsl #10
 6dc:	28060000 	stmdacs	r6, {}	; <UNPREDICTABLE>
 6e0:	14092504 	strne	r2, [r9], #-1284	; 0xfffffafc
 6e4:	07000001 	streq	r0, [r0, -r1]
 6e8:	00000560 	andeq	r0, r0, r0, ror #10
 6ec:	83172604 	tsthi	r7, #4, 12	; 0x400000
 6f0:	00000000 	andeq	r0, r0, r0
 6f4:	0005f407 	andeq	pc, r5, r7, lsl #8
 6f8:	17270400 	strne	r0, [r7, -r0, lsl #8]!
 6fc:	00000083 	andeq	r0, r0, r3, lsl #1
 700:	05520704 	ldrbeq	r0, [r2, #-1796]	; 0xfffff8fc
 704:	28040000 	stmdacs	r4, {}	; <UNPREDICTABLE>
 708:	00008317 	andeq	r8, r0, r7, lsl r3
 70c:	ac070800 	stcge	8, cr0, [r7], {-0}
 710:	04000004 	streq	r0, [r0], #-4
 714:	00831729 	addeq	r1, r3, r9, lsr #14
 718:	070c0000 	streq	r0, [ip, -r0]
 71c:	00000516 	andeq	r0, r0, r6, lsl r5
 720:	83172a04 	tsthi	r7, #4, 20	; 0x4000
 724:	10000000 	andne	r0, r0, r0
 728:	00052407 	andeq	r2, r5, r7, lsl #8
 72c:	172b0400 	strne	r0, [fp, -r0, lsl #8]!
 730:	00000083 	andeq	r0, r0, r3, lsl #1
 734:	05bb0714 	ldreq	r0, [fp, #1812]!	; 0x714
 738:	2c040000 	stccs	0, cr0, [r4], {-0}
 73c:	00008317 	andeq	r8, r0, r7, lsl r3
 740:	ac071800 	stcge	8, cr1, [r7], {-0}
 744:	04000005 	streq	r0, [r0], #-5
 748:	0083172d 	addeq	r1, r3, sp, lsr #14
 74c:	071c0000 	ldreq	r0, [ip, -r0]
 750:	0000049d 	muleq	r0, sp, r4
 754:	83172e04 	tsthi	r7, #4, 28	; 0x40
 758:	20000000 	andcs	r0, r0, r0
 75c:	00053207 	andeq	r3, r5, r7, lsl #4
 760:	172f0400 	strne	r0, [pc, -r0, lsl #8]!
 764:	00000083 	andeq	r0, r0, r3, lsl #1
 768:	cd030024 	stcgt	0, cr0, [r3, #-144]	; 0xffffff70
 76c:	04000005 	streq	r0, [r0], #-5
 770:	00880730 	addeq	r0, r8, r0, lsr r7
 774:	b8080000 	stmdalt	r8, {}	; <UNPREDICTABLE>
 778:	01000004 	tsteq	r0, r4
 77c:	012c1e14 			; <UNDEFINED> instruction: 0x012c1e14
 780:	04090000 	streq	r0, [r9], #-0
 784:	00000114 	andeq	r0, r0, r4, lsl r1
 788:	0005000a 	andeq	r0, r5, sl
 78c:	28990100 	ldmcs	r9, {r8}
 790:	000081b4 			; <UNDEFINED> instruction: 0x000081b4
 794:	00000004 	andeq	r0, r0, r4
 798:	d20b9c01 	andle	r9, fp, #256	; 0x100
 79c:	01000004 	tsteq	r0, r4
 7a0:	81602c6a 	cmnhi	r0, sl, ror #24
 7a4:	00540000 	subseq	r0, r4, r0
 7a8:	9c010000 	stcls	0, cr0, [r1], {-0}
 7ac:	00000188 	andeq	r0, r0, r8, lsl #3
 7b0:	74696c0c 	strbtvc	r6, [r9], #-3084	; 0xfffff3f4
 7b4:	106c0100 	rsbne	r0, ip, r0, lsl #2
 7b8:	00000069 	andeq	r0, r0, r9, rrx
 7bc:	81f80305 	mvnshi	r0, r5, lsl #6
 7c0:	6c0d0000 	stcvs	0, cr0, [sp], {-0}
 7c4:	e4000081 	str	r0, [r0], #-129	; 0xffffff7f
 7c8:	0d000001 	stceq	0, cr0, [r0, #-4]
 7cc:	00008188 	andeq	r8, r0, r8, lsl #3
 7d0:	000001f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>
 7d4:	0081a00d 	addeq	sl, r1, sp
 7d8:	0001f000 	andeq	pc, r1, r0
 7dc:	e20e0000 	and	r0, lr, #0
 7e0:	01000005 	tsteq	r0, r5
 7e4:	870e2a5d 	smlsdhi	lr, sp, sl, r2
 7e8:	01000004 	tsteq	r0, r4
 7ec:	c90a2a51 	stmdbgt	sl, {r0, r4, r6, r9, fp, sp}
 7f0:	01000004 	tsteq	r0, r4
 7f4:	81542842 	cmphi	r4, r2, asr #16
 7f8:	00040000 	andeq	r0, r4, r0
 7fc:	9c010000 	stcls	0, cr0, [r1], {-0}
 800:	0004e30a 	andeq	lr, r4, sl, lsl #6
 804:	2a330100 	bcs	cc0c0c <_stack+0xc40c0c>
 808:	00008150 	andeq	r8, r0, r0, asr r1
 80c:	00000004 	andeq	r0, r0, r4
 810:	450a9c01 	strmi	r9, [sl, #-3073]	; 0xfffff3ff
 814:	01000005 	tsteq	r0, r5
 818:	814c2a28 	cmphi	ip, r8, lsr #20
 81c:	00040000 	andeq	r0, r4, r0
 820:	9c010000 	stcls	0, cr0, [r1], {-0}
 824:	0001810f 	andeq	r8, r1, pc, lsl #2
 828:	171b0100 	ldrne	r0, [fp, -r0, lsl #2]
 82c:	0000012c 	andeq	r0, r0, ip, lsr #2
 830:	00008140 	andeq	r8, r0, r0, asr #2
 834:	0000000c 	andeq	r0, r0, ip
 838:	d9109c01 	ldmdble	r0, {r0, sl, fp, ip, pc}
 83c:	d9000000 	stmdble	r0, {}	; <UNPREDICTABLE>
 840:	05000000 	streq	r0, [r0, #-0]
 844:	85101977 	ldrhi	r1, [r0, #-2423]	; 0xfffff689
 848:	85000000 	strhi	r0, [r0, #-0]
 84c:	06000000 	streq	r0, [r0], -r0
 850:	50001482 	andpl	r1, r0, r2, lsl #9
 854:	04000001 	streq	r0, [r0], #-1
 858:	0003ae00 	andeq	sl, r3, r0, lsl #28
 85c:	e9010400 	stmdb	r1, {sl}
 860:	0c000000 	stceq	0, cr0, [r0], {-0}
 864:	00000602 	andeq	r0, r0, r2, lsl #12
 868:	00000091 	muleq	r0, r1, r0
 86c:	000081b8 			; <UNDEFINED> instruction: 0x000081b8
 870:	00000040 	andeq	r0, r0, r0, asr #32
 874:	0000062a 	andeq	r0, r0, sl, lsr #12
 878:	79060102 	stmdbvc	r6, {r1, r8}
 87c:	02000000 	andeq	r0, r0, #0
 880:	00770801 	rsbseq	r0, r7, r1, lsl #16
 884:	02020000 	andeq	r0, r2, #0
 888:	00017705 	andeq	r7, r1, r5, lsl #14
 88c:	07020200 	streq	r0, [r2, -r0, lsl #4]
 890:	000000c6 	andeq	r0, r0, r6, asr #1
 894:	05050402 	streq	r0, [r5, #-1026]	; 0xfffffbfe
 898:	03000000 	movweq	r0, #0
 89c:	00000235 	andeq	r0, r0, r5, lsr r2
 8a0:	54194f02 	ldrpl	r4, [r9], #-3842	; 0xfffff0fe
 8a4:	02000000 	andeq	r0, r0, #0
 8a8:	00650704 	rsbeq	r0, r5, r4, lsl #14
 8ac:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
 8b0:	00000005 	andeq	r0, r0, r5
 8b4:	07080200 	streq	r0, [r8, -r0, lsl #4]
 8b8:	00000060 	andeq	r0, r0, r0, rrx
 8bc:	69050404 	stmdbvs	r5, {r2, sl}
 8c0:	0200746e 	andeq	r7, r0, #1845493760	; 0x6e000000
 8c4:	006a0704 	rsbeq	r0, sl, r4, lsl #14
 8c8:	37030000 	strcc	r0, [r3, -r0]
 8cc:	03000002 	movweq	r0, #2
 8d0:	00481430 	subeq	r1, r8, r0, lsr r4
 8d4:	77050000 	strvc	r0, [r5, -r0]
 8d8:	06000000 	streq	r0, [r0], -r0
 8dc:	0915041c 	ldmdbeq	r5, {r2, r3, r4, sl}
 8e0:	000000ed 	andeq	r0, r0, sp, ror #1
 8e4:	00066907 	andeq	r6, r6, r7, lsl #18
 8e8:	17160400 	ldrne	r0, [r6, -r0, lsl #8]
 8ec:	00000083 	andeq	r0, r0, r3, lsl #1
 8f0:	06780700 	ldrbteq	r0, [r8], -r0, lsl #14
 8f4:	17040000 	strne	r0, [r4, -r0]
 8f8:	00008317 	andeq	r8, r0, r7, lsl r3
 8fc:	5e070400 	cfcpyspl	mvf0, mvf7
 900:	04000006 	streq	r0, [r0], #-6
 904:	00831718 	addeq	r1, r3, r8, lsl r7
 908:	07080000 	streq	r0, [r8, -r0]
 90c:	0000063a 	andeq	r0, r0, sl, lsr r6
 910:	83171904 	tsthi	r7, #4, 18	; 0x10000
 914:	0c000000 	stceq	0, cr0, [r0], {-0}
 918:	00064307 	andeq	r4, r6, r7, lsl #6
 91c:	171a0400 	ldrne	r0, [sl, -r0, lsl #8]
 920:	00000083 	andeq	r0, r0, r3, lsl #1
 924:	064c0710 			; <UNDEFINED> instruction: 0x064c0710
 928:	1b040000 	blne	100930 <_stack+0x80930>
 92c:	00008317 	andeq	r8, r0, r7, lsl r3
 930:	55071400 	strpl	r1, [r7, #-1024]	; 0xfffffc00
 934:	04000006 	streq	r0, [r0], #-6
 938:	0083171c 	addeq	r1, r3, ip, lsl r7
 93c:	00180000 	andseq	r0, r8, r0
 940:	0006ab03 	andeq	sl, r6, r3, lsl #22
 944:	071d0400 	ldreq	r0, [sp, -r0, lsl #8]
 948:	00000088 	andeq	r0, r0, r8, lsl #1
 94c:	0006bb08 	andeq	fp, r6, r8, lsl #22
 950:	190e0100 	stmdbne	lr, {r8}
 954:	00000105 	andeq	r0, r0, r5, lsl #2
 958:	00ed0409 	rsceq	r0, sp, r9, lsl #8
 95c:	960a0000 	strls	r0, [sl], -r0
 960:	01000006 	tsteq	r0, r6
 964:	81c40615 	bichi	r0, r4, r5, lsl r6
 968:	00340000 	eorseq	r0, r4, r0
 96c:	9c010000 	stcls	0, cr0, [r1], {-0}
 970:	0000013d 	andeq	r0, r0, sp, lsr r1
 974:	0073750b 	rsbseq	r7, r3, fp, lsl #10
 978:	77251501 	strvc	r1, [r5, -r1, lsl #10]!
 97c:	01000000 	mrseq	r0, (UNDEF: 0)
 980:	73740c50 	cmnvc	r4, #80, 24	; 0x5000
 984:	17170100 	ldrne	r0, [r7, -r0, lsl #2]
 988:	00000083 	andeq	r0, r0, r3, lsl #1
 98c:	007c9102 	rsbseq	r9, ip, r2, lsl #2
 990:	0006830d 	andeq	r8, r6, sp, lsl #6
 994:	12100100 	andsne	r0, r0, #0, 2
 998:	00000105 	andeq	r0, r0, r5, lsl #2
 99c:	000081b8 			; <UNDEFINED> instruction: 0x000081b8
 9a0:	0000000c 	andeq	r0, r0, ip
 9a4:	22009c01 	andcs	r9, r0, #256	; 0x100
 9a8:	02000000 	andeq	r0, r0, #0
 9ac:	00048000 	andeq	r8, r4, r0
 9b0:	ba010400 	blt	419b8 <__bss_end__+0x397bc>
 9b4:	00000007 	andeq	r0, r0, r7
 9b8:	94000080 	strls	r0, [r0], #-128	; 0xffffff80
 9bc:	ca000080 	bgt	bc4 <CPSR_IRQ_INHIBIT+0xb44>
 9c0:	91000006 	tstls	r0, r6
 9c4:	fb000000 	blx	9ce <CPSR_IRQ_INHIBIT+0x94e>
 9c8:	01000006 	tsteq	r0, r6
 9cc:	Address 0x000009cc is out of bounds.


Disassembly of section .debug_abbrev:

00000000 <.debug_abbrev>:
   0:	25011101 	strcs	r1, [r1, #-257]	; 0xfffffeff
   4:	030b130e 	movweq	r1, #45838	; 0xb30e
   8:	110e1b0e 	tstne	lr, lr, lsl #22
   c:	10061201 	andne	r1, r6, r1, lsl #4
  10:	02000017 	andeq	r0, r0, #23
  14:	0b0b0024 	bleq	2c00ac <_stack+0x2400ac>
  18:	0e030b3e 	vmoveq.16	d3[0], r0
  1c:	24030000 	strcs	r0, [r3], #-0
  20:	3e0b0b00 	vmlacc.f64	d0, d11, d0
  24:	0008030b 	andeq	r0, r8, fp, lsl #6
  28:	012e0400 			; <UNDEFINED> instruction: 0x012e0400
  2c:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
  30:	0b3b0b3a 	bleq	ec2d20 <_stack+0xe42d20>
  34:	19270b39 	stmdbne	r7!, {r0, r3, r4, r5, r8, r9, fp}
  38:	06120111 			; <UNDEFINED> instruction: 0x06120111
  3c:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
  40:	00130119 	andseq	r0, r3, r9, lsl r1
  44:	00050500 	andeq	r0, r5, r0, lsl #10
  48:	0b3a0803 	bleq	e8205c <_stack+0xe0205c>
  4c:	0b390b3b 	bleq	e42d40 <_stack+0xdc2d40>
  50:	17021349 	strne	r1, [r2, -r9, asr #6]
  54:	001742b7 			; <UNDEFINED> instruction: 0x001742b7
  58:	00050600 	andeq	r0, r5, r0, lsl #12
  5c:	0b3a0e03 	bleq	e83870 <_stack+0xe03870>
  60:	0b390b3b 	bleq	e42d54 <_stack+0xdc2d54>
  64:	17021349 	strne	r1, [r2, -r9, asr #6]
  68:	001742b7 			; <UNDEFINED> instruction: 0x001742b7
  6c:	82890700 	addhi	r0, r9, #0, 14
  70:	01110001 	tsteq	r1, r1
  74:	00001331 	andeq	r1, r0, r1, lsr r3
  78:	3f002e08 	svccc	0x00002e08
  7c:	6e193c19 	mrcvs	12, 0, r3, cr9, cr9, {0}
  80:	3a0e030e 	bcc	380cc0 <_stack+0x300cc0>
  84:	390b3b0b 	stmdbcc	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
  88:	0000000b 	andeq	r0, r0, fp
  8c:	25011101 	strcs	r1, [r1, #-257]	; 0xfffffeff
  90:	030b130e 	movweq	r1, #45838	; 0xb30e
  94:	110e1b0e 	tstne	lr, lr, lsl #22
  98:	10061201 	andne	r1, r6, r1, lsl #4
  9c:	02000017 	andeq	r0, r0, #23
  a0:	0e030034 	mcreq	0, 0, r0, cr3, cr4, {1}
  a4:	0b3b0b3a 	bleq	ec2d94 <_stack+0xe42d94>
  a8:	13490b39 	movtne	r0, #39737	; 0x9b39
  ac:	193c193f 	ldmdbne	ip!, {r0, r1, r2, r3, r4, r5, r8, fp, ip}
  b0:	24030000 	strcs	r0, [r3], #-0
  b4:	3e0b0b00 	vmlacc.f64	d0, d11, d0
  b8:	0008030b 	andeq	r0, r8, fp, lsl #6
  bc:	012e0400 			; <UNDEFINED> instruction: 0x012e0400
  c0:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
  c4:	0b3b0b3a 	bleq	ec2db4 <_stack+0xe42db4>
  c8:	19270b39 	stmdbne	r7!, {r0, r3, r4, r5, r8, r9, fp}
  cc:	06120111 			; <UNDEFINED> instruction: 0x06120111
  d0:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
  d4:	00130119 	andseq	r0, r3, r9, lsl r1
  d8:	00050500 	andeq	r0, r5, r0, lsl #10
  dc:	0b3a0803 	bleq	e820f0 <_stack+0xe020f0>
  e0:	0b390b3b 	bleq	e42dd4 <_stack+0xdc2dd4>
  e4:	17021349 	strne	r1, [r2, -r9, asr #6]
  e8:	001742b7 			; <UNDEFINED> instruction: 0x001742b7
  ec:	00340600 	eorseq	r0, r4, r0, lsl #12
  f0:	0b3a0803 	bleq	e82104 <_stack+0xe02104>
  f4:	0b390b3b 	bleq	e42de8 <_stack+0xdc2de8>
  f8:	17021349 	strne	r1, [r2, -r9, asr #6]
  fc:	001742b7 			; <UNDEFINED> instruction: 0x001742b7
 100:	00340700 	eorseq	r0, r4, r0, lsl #14
 104:	0b3a0e03 	bleq	e83918 <_stack+0xe03918>
 108:	0b390b3b 	bleq	e42dfc <_stack+0xdc2dfc>
 10c:	00001349 	andeq	r1, r0, r9, asr #6
 110:	01828908 	orreq	r8, r2, r8, lsl #18
 114:	31011100 	mrscc	r1, (UNDEF: 17)
 118:	09000013 	stmdbeq	r0, {r0, r1, r4}
 11c:	0b0b0024 	bleq	2c01b4 <_stack+0x2401b4>
 120:	0e030b3e 	vmoveq.16	d3[0], r0
 124:	0f0a0000 	svceq	0x000a0000
 128:	490b0b00 	stmdbmi	fp, {r8, r9, fp}
 12c:	0b000013 	bleq	180 <CPSR_IRQ_INHIBIT+0x100>
 130:	193f002e 	ldmdbne	pc!, {r1, r2, r3, r5}	; <UNPREDICTABLE>
 134:	0e6e193c 			; <UNDEFINED> instruction: 0x0e6e193c
 138:	0b3a0e03 	bleq	e8394c <_stack+0xe0394c>
 13c:	0b390b3b 	bleq	e42e30 <_stack+0xdc2e30>
 140:	01000000 	mrseq	r0, (UNDEF: 0)
 144:	0e250111 	mcreq	1, 1, r0, cr5, cr1, {0}
 148:	0e030b13 	vmoveq.32	d3[0], r0
 14c:	01110e1b 	tsteq	r1, fp, lsl lr
 150:	17100612 			; <UNDEFINED> instruction: 0x17100612
 154:	24020000 	strcs	r0, [r2], #-0
 158:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 15c:	000e030b 	andeq	r0, lr, fp, lsl #6
 160:	00160300 	andseq	r0, r6, r0, lsl #6
 164:	0b3a0e03 	bleq	e83978 <_stack+0xe03978>
 168:	0b390b3b 	bleq	e42e5c <_stack+0xdc2e5c>
 16c:	00001349 	andeq	r1, r0, r9, asr #6
 170:	0b002404 	bleq	9188 <__bss_end__+0xf8c>
 174:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 178:	05000008 	streq	r0, [r0, #-8]
 17c:	13490035 	movtne	r0, #36917	; 0x9035
 180:	13060000 	movwne	r0, #24576	; 0x6000
 184:	3a0b0b01 	bcc	2c2d90 <_stack+0x242d90>
 188:	390b3b0b 	stmdbcc	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 18c:	0013010b 	andseq	r0, r3, fp, lsl #2
 190:	000d0700 	andeq	r0, sp, r0, lsl #14
 194:	0b3a0e03 	bleq	e839a8 <_stack+0xe039a8>
 198:	0b390b3b 	bleq	e42e8c <_stack+0xdc2e8c>
 19c:	0b381349 	bleq	e04ec8 <_stack+0xd84ec8>
 1a0:	34080000 	strcc	r0, [r8], #-0
 1a4:	3a0e0300 	bcc	380dac <_stack+0x300dac>
 1a8:	390b3b0b 	stmdbcc	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 1ac:	0013490b 	andseq	r4, r3, fp, lsl #18
 1b0:	000f0900 	andeq	r0, pc, r0, lsl #18
 1b4:	13490b0b 	movtne	r0, #39691	; 0x9b0b
 1b8:	2e0a0000 	cdpcs	0, 0, cr0, cr10, cr0, {0}
 1bc:	03193f00 	tsteq	r9, #0, 30
 1c0:	3b0b3a0e 	blcc	2cea00 <_stack+0x24ea00>
 1c4:	270b390b 	strcs	r3, [fp, -fp, lsl #18]
 1c8:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 1cc:	97184006 	ldrls	r4, [r8, -r6]
 1d0:	00001942 	andeq	r1, r0, r2, asr #18
 1d4:	3f002e0b 	svccc	0x00002e0b
 1d8:	3a0e0319 	bcc	380e44 <_stack+0x300e44>
 1dc:	390b3b0b 	stmdbcc	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 1e0:	4919270b 	ldmdbmi	r9, {r0, r1, r3, r8, r9, sl, sp}
 1e4:	12011113 	andne	r1, r1, #-1073741820	; 0xc0000004
 1e8:	97184006 	ldrls	r4, [r8, -r6]
 1ec:	00001942 	andeq	r1, r0, r2, asr #18
 1f0:	01110100 	tsteq	r1, r0, lsl #2
 1f4:	0b130e25 	bleq	4c3a90 <_stack+0x443a90>
 1f8:	0e1b0e03 	cdpeq	14, 1, cr0, cr11, cr3, {0}
 1fc:	06120111 			; <UNDEFINED> instruction: 0x06120111
 200:	00001710 	andeq	r1, r0, r0, lsl r7
 204:	0b002402 	bleq	9214 <__bss_end__+0x1018>
 208:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 20c:	0300000e 	movweq	r0, #14
 210:	0e030016 	mcreq	0, 0, r0, cr3, cr6, {0}
 214:	0b3b0b3a 	bleq	ec2f04 <_stack+0xe42f04>
 218:	13490b39 	movtne	r0, #39737	; 0x9b39
 21c:	24040000 	strcs	r0, [r4], #-0
 220:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 224:	0008030b 	andeq	r0, r8, fp, lsl #6
 228:	00350500 	eorseq	r0, r5, r0, lsl #10
 22c:	00001349 	andeq	r1, r0, r9, asr #6
 230:	49002606 	stmdbmi	r0, {r1, r2, r9, sl, sp}
 234:	07000013 	smladeq	r0, r3, r0, r0
 238:	0b0b0113 	bleq	2c068c <_stack+0x24068c>
 23c:	0b3b0b3a 	bleq	ec2f2c <_stack+0xe42f2c>
 240:	13010b39 	movwne	r0, #6969	; 0x1b39
 244:	0d080000 	stceq	0, cr0, [r8, #-0]
 248:	3a0e0300 	bcc	380e50 <_stack+0x300e50>
 24c:	390b3b0b 	stmdbcc	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 250:	3813490b 	ldmdacc	r3, {r0, r1, r3, r8, fp, lr}
 254:	0900000b 	stmdbeq	r0, {r0, r1, r3}
 258:	0e030034 	mcreq	0, 0, r0, cr3, cr4, {1}
 25c:	0b3b0b3a 	bleq	ec2f4c <_stack+0xe42f4c>
 260:	13490b39 	movtne	r0, #39737	; 0x9b39
 264:	0f0a0000 	svceq	0x000a0000
 268:	490b0b00 	stmdbmi	fp, {r8, r9, fp}
 26c:	0b000013 	bleq	2c0 <CPSR_IRQ_INHIBIT+0x240>
 270:	193f002e 	ldmdbne	pc!, {r1, r2, r3, r5}	; <UNPREDICTABLE>
 274:	0b3a0e03 	bleq	e83a88 <_stack+0xe03a88>
 278:	0b390b3b 	bleq	e42f6c <_stack+0xdc2f6c>
 27c:	01111927 	tsteq	r1, r7, lsr #18
 280:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 284:	00194297 	mulseq	r9, r7, r2
 288:	002e0c00 	eoreq	r0, lr, r0, lsl #24
 28c:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
 290:	0b3b0b3a 	bleq	ec2f80 <_stack+0xe42f80>
 294:	19270b39 	stmdbne	r7!, {r0, r3, r4, r5, r8, r9, fp}
 298:	01111349 	tsteq	r1, r9, asr #6
 29c:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 2a0:	00194297 	mulseq	r9, r7, r2
 2a4:	11010000 	mrsne	r0, (UNDEF: 1)
 2a8:	130e2501 	movwne	r2, #58625	; 0xe501
 2ac:	1b0e030b 	blne	380ee0 <_stack+0x300ee0>
 2b0:	1201110e 	andne	r1, r1, #-2147483645	; 0x80000003
 2b4:	00171006 	andseq	r1, r7, r6
 2b8:	00240200 	eoreq	r0, r4, r0, lsl #4
 2bc:	0b3e0b0b 	bleq	f82ef0 <_stack+0xf02ef0>
 2c0:	00000e03 	andeq	r0, r0, r3, lsl #28
 2c4:	03001603 	movweq	r1, #1539	; 0x603
 2c8:	3b0b3a0e 	blcc	2ceb08 <_stack+0x24eb08>
 2cc:	490b390b 	stmdbmi	fp, {r0, r1, r3, r8, fp, ip, sp}
 2d0:	04000013 	streq	r0, [r0], #-19	; 0xffffffed
 2d4:	0b0b0024 	bleq	2c036c <_stack+0x24036c>
 2d8:	08030b3e 	stmdaeq	r3, {r1, r2, r3, r4, r5, r8, r9, fp}
 2dc:	35050000 	strcc	r0, [r5, #-0]
 2e0:	00134900 	andseq	r4, r3, r0, lsl #18
 2e4:	01130600 	tsteq	r3, r0, lsl #12
 2e8:	0b3a0b0b 	bleq	e82f1c <_stack+0xe02f1c>
 2ec:	0b390b3b 	bleq	e42fe0 <_stack+0xdc2fe0>
 2f0:	00001301 	andeq	r1, r0, r1, lsl #6
 2f4:	03000d07 	movweq	r0, #3335	; 0xd07
 2f8:	3b0b3a0e 	blcc	2ceb38 <_stack+0x24eb38>
 2fc:	490b390b 	stmdbmi	fp, {r0, r1, r3, r8, fp, ip, sp}
 300:	000b3813 	andeq	r3, fp, r3, lsl r8
 304:	00340800 	eorseq	r0, r4, r0, lsl #16
 308:	0b3a0e03 	bleq	e83b1c <_stack+0xe03b1c>
 30c:	0b390b3b 	bleq	e43000 <_stack+0xdc3000>
 310:	00001349 	andeq	r1, r0, r9, asr #6
 314:	0b000f09 	bleq	3f40 <CPSR_IRQ_INHIBIT+0x3ec0>
 318:	0013490b 	andseq	r4, r3, fp, lsl #18
 31c:	002e0a00 	eoreq	r0, lr, r0, lsl #20
 320:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
 324:	0b3b0b3a 	bleq	ec3014 <_stack+0xe43014>
 328:	19270b39 	stmdbne	r7!, {r0, r3, r4, r5, r8, r9, fp}
 32c:	06120111 			; <UNDEFINED> instruction: 0x06120111
 330:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 334:	0b000019 	bleq	3a0 <CPSR_IRQ_INHIBIT+0x320>
 338:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 33c:	0b3a0e03 	bleq	e83b50 <_stack+0xe03b50>
 340:	0b390b3b 	bleq	e43034 <_stack+0xdc3034>
 344:	06120111 			; <UNDEFINED> instruction: 0x06120111
 348:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 34c:	00130119 	andseq	r0, r3, r9, lsl r1
 350:	00340c00 	eorseq	r0, r4, r0, lsl #24
 354:	0b3a0803 	bleq	e82368 <_stack+0xe02368>
 358:	0b390b3b 	bleq	e4304c <_stack+0xdc304c>
 35c:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 360:	890d0000 	stmdbhi	sp, {}	; <UNPREDICTABLE>
 364:	11000182 	smlabbne	r0, r2, r1, r0
 368:	00133101 	andseq	r3, r3, r1, lsl #2
 36c:	002e0e00 	eoreq	r0, lr, r0, lsl #28
 370:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
 374:	0b3b0b3a 	bleq	ec3064 <_stack+0xe43064>
 378:	19270b39 	stmdbne	r7!, {r0, r3, r4, r5, r8, r9, fp}
 37c:	2e0f0000 	cdpcs	0, 0, cr0, cr15, cr0, {0}
 380:	03193f00 	tsteq	r9, #0, 30
 384:	3b0b3a0e 	blcc	2cebc4 <_stack+0x24ebc4>
 388:	270b390b 	strcs	r3, [fp, -fp, lsl #18]
 38c:	11134919 	tstne	r3, r9, lsl r9
 390:	40061201 	andmi	r1, r6, r1, lsl #4
 394:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 398:	2e100000 	cdpcs	0, 1, cr0, cr0, cr0, {0}
 39c:	3c193f00 	ldccc	15, cr3, [r9], {-0}
 3a0:	030e6e19 	movweq	r6, #60953	; 0xee19
 3a4:	3b0b3a0e 	blcc	2cebe4 <_stack+0x24ebe4>
 3a8:	000b390b 	andeq	r3, fp, fp, lsl #18
 3ac:	11010000 	mrsne	r0, (UNDEF: 1)
 3b0:	130e2501 	movwne	r2, #58625	; 0xe501
 3b4:	1b0e030b 	blne	380fe8 <_stack+0x300fe8>
 3b8:	1201110e 	andne	r1, r1, #-2147483645	; 0x80000003
 3bc:	00171006 	andseq	r1, r7, r6
 3c0:	00240200 	eoreq	r0, r4, r0, lsl #4
 3c4:	0b3e0b0b 	bleq	f82ff8 <_stack+0xf02ff8>
 3c8:	00000e03 	andeq	r0, r0, r3, lsl #28
 3cc:	03001603 	movweq	r1, #1539	; 0x603
 3d0:	3b0b3a0e 	blcc	2cec10 <_stack+0x24ec10>
 3d4:	490b390b 	stmdbmi	fp, {r0, r1, r3, r8, fp, ip, sp}
 3d8:	04000013 	streq	r0, [r0], #-19	; 0xffffffed
 3dc:	0b0b0024 	bleq	2c0474 <_stack+0x240474>
 3e0:	08030b3e 	stmdaeq	r3, {r1, r2, r3, r4, r5, r8, r9, fp}
 3e4:	35050000 	strcc	r0, [r5, #-0]
 3e8:	00134900 	andseq	r4, r3, r0, lsl #18
 3ec:	01130600 	tsteq	r3, r0, lsl #12
 3f0:	0b3a0b0b 	bleq	e83024 <_stack+0xe03024>
 3f4:	0b390b3b 	bleq	e430e8 <_stack+0xdc30e8>
 3f8:	00001301 	andeq	r1, r0, r1, lsl #6
 3fc:	03000d07 	movweq	r0, #3335	; 0xd07
 400:	3b0b3a0e 	blcc	2cec40 <_stack+0x24ec40>
 404:	490b390b 	stmdbmi	fp, {r0, r1, r3, r8, fp, ip, sp}
 408:	000b3813 	andeq	r3, fp, r3, lsl r8
 40c:	00340800 	eorseq	r0, r4, r0, lsl #16
 410:	0b3a0e03 	bleq	e83c24 <_stack+0xe03c24>
 414:	0b390b3b 	bleq	e43108 <_stack+0xdc3108>
 418:	00001349 	andeq	r1, r0, r9, asr #6
 41c:	0b000f09 	bleq	4048 <CPSR_IRQ_INHIBIT+0x3fc8>
 420:	0013490b 	andseq	r4, r3, fp, lsl #18
 424:	012e0a00 			; <UNDEFINED> instruction: 0x012e0a00
 428:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
 42c:	0b3b0b3a 	bleq	ec311c <_stack+0xe4311c>
 430:	19270b39 	stmdbne	r7!, {r0, r3, r4, r5, r8, r9, fp}
 434:	06120111 			; <UNDEFINED> instruction: 0x06120111
 438:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 43c:	00130119 	andseq	r0, r3, r9, lsl r1
 440:	00050b00 	andeq	r0, r5, r0, lsl #22
 444:	0b3a0803 	bleq	e82458 <_stack+0xe02458>
 448:	0b390b3b 	bleq	e4313c <_stack+0xdc313c>
 44c:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 450:	340c0000 	strcc	r0, [ip], #-0
 454:	3a080300 	bcc	20105c <_stack+0x18105c>
 458:	390b3b0b 	stmdbcc	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 45c:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 460:	0d000018 	stceq	0, cr0, [r0, #-96]	; 0xffffffa0
 464:	193f002e 	ldmdbne	pc!, {r1, r2, r3, r5}	; <UNPREDICTABLE>
 468:	0b3a0e03 	bleq	e83c7c <_stack+0xe03c7c>
 46c:	0b390b3b 	bleq	e43160 <_stack+0xdc3160>
 470:	13491927 	movtne	r1, #39207	; 0x9927
 474:	06120111 			; <UNDEFINED> instruction: 0x06120111
 478:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 47c:	00000019 	andeq	r0, r0, r9, lsl r0
 480:	10001101 	andne	r1, r0, r1, lsl #2
 484:	12011106 	andne	r1, r1, #-2147483647	; 0x80000001
 488:	1b0e0301 	blne	381094 <_stack+0x301094>
 48c:	130e250e 	movwne	r2, #58638	; 0xe50e
 490:	00000005 	andeq	r0, r0, r5

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	000000d7 	ldrdeq	r0, [r0], -r7
   4:	00830003 	addeq	r0, r3, r3
   8:	01020000 	mrseq	r0, (UNDEF: 2)
   c:	000d0efb 	strdeq	r0, [sp], -fp
  10:	01010101 	tsteq	r1, r1, lsl #2
  14:	01000000 	mrseq	r0, (UNDEF: 0)
  18:	43010000 	movwmi	r0, #4096	; 0x1000
  1c:	73552f3a 	cmpvc	r5, #58, 30	; 0xe8
  20:	2f737265 	svccs	0x00737265
  24:	69646241 	stmdbvs	r4!, {r0, r6, r9, sp, lr}^
  28:	6972616b 	ldmdbvs	r2!, {r0, r1, r3, r5, r6, r8, sp, lr}^
  2c:	65642f6d 	strbvs	r2, [r4, #-3949]!	; 0xfffff093
  30:	794d2f76 	stmdbvc	sp, {r1, r2, r4, r5, r6, r8, r9, sl, fp, sp}^
  34:	422f534f 	eormi	r5, pc, #1006632961	; 0x3c000001
  38:	6b6e696c 	blvs	1b9a5f0 <_stack+0x1b1a5f0>
  3c:	5f676e69 	svcpl	0x00676e69
  40:	0044454c 	subeq	r4, r4, ip, asr #10
  44:	696c6200 	stmdbvs	ip!, {r9, sp, lr}^
  48:	6e696b6e 	vnmulvs.f64	d22, d9, d30
  4c:	44454c67 	strbmi	r4, [r5], #-3175	; 0xfffff399
  50:	632e3576 			; <UNDEFINED> instruction: 0x632e3576
  54:	00000100 	andeq	r0, r0, r0, lsl #2
  58:	2d697072 	stclcs	0, cr7, [r9, #-456]!	; 0xfffffe38
  5c:	6f697067 	svcvs	0x00697067
  60:	0100682e 	tsteq	r0, lr, lsr #16
  64:	70720000 	rsbsvc	r0, r2, r0
  68:	6e692d69 	cdpvs	13, 6, cr2, cr9, cr9, {3}
  6c:	72726574 	rsbsvc	r6, r2, #116, 10	; 0x1d000000
  70:	73747075 	cmnvc	r4, #117	; 0x75
  74:	0100682e 	tsteq	r0, lr, lsr #16
  78:	70720000 	rsbsvc	r0, r2, r0
  7c:	72612d69 	rsbvc	r2, r1, #6720	; 0x1a40
  80:	6d69746d 	cfstrdvs	mvd7, [r9, #-436]!	; 0xfffffe4c
  84:	682e7265 	stmdavs	lr!, {r0, r2, r5, r6, r9, ip, sp, lr}
  88:	00000100 	andeq	r0, r0, r0, lsl #2
  8c:	00010500 	andeq	r0, r1, r0, lsl #10
  90:	80940205 	addshi	r0, r4, r5, lsl #4
  94:	0b030000 	bleq	c009c <_stack+0x4009c>
  98:	15050501 	strne	r0, [r5, #-1281]	; 0xfffffaff
  9c:	0f060105 	svceq	0x00060105
  a0:	05310505 	ldreq	r0, [r1, #-1285]!	; 0xfffffafb
  a4:	05052e1f 	streq	r2, [r5, #-3615]	; 0xfffff1e1
  a8:	2f056906 	svccs	0x00056906
  ac:	05052e06 	streq	r2, [r5, #-3590]	; 0xfffff1fa
  b0:	1d054e06 	stcne	14, cr4, [r5, #-24]	; 0xffffffe8
  b4:	05052e06 	streq	r2, [r5, #-3590]	; 0xfffff1fa
  b8:	20054d06 	andcs	r4, r5, r6, lsl #26
  bc:	05052e06 	streq	r2, [r5, #-3590]	; 0xfffff1fa
  c0:	02005106 	andeq	r5, r0, #-2147483647	; 0x80000001
  c4:	00320104 	eorseq	r0, r2, r4, lsl #2
  c8:	15010402 	strne	r0, [r1, #-1026]	; 0xfffffbfe
  cc:	01040200 	mrseq	r0, R12_usr
  d0:	0402000f 	streq	r0, [r2], #-15
  d4:	02021501 	andeq	r1, r2, #4194304	; 0x400000
  d8:	9f010100 	svcls	0x00010100
  dc:	03000000 	movweq	r0, #0
  e0:	00004a00 	andeq	r4, r0, r0, lsl #20
  e4:	fb010200 	blx	408ee <__bss_end__+0x386f2>
  e8:	01000d0e 	tsteq	r0, lr, lsl #26
  ec:	00010101 	andeq	r0, r1, r1, lsl #2
  f0:	00010000 	andeq	r0, r1, r0
  f4:	3a430100 	bcc	10c04fc <_stack+0x10404fc>
  f8:	6573552f 	ldrbvs	r5, [r3, #-1327]!	; 0xfffffad1
  fc:	412f7372 			; <UNDEFINED> instruction: 0x412f7372
 100:	6b696462 	blvs	1a59290 <_stack+0x19d9290>
 104:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
 108:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
 10c:	4f794d2f 	svcmi	0x00794d2f
 110:	6c422f53 	mcrrvs	15, 5, r2, r2, cr3
 114:	696b6e69 	stmdbvs	fp!, {r0, r3, r5, r6, r9, sl, fp, sp, lr}^
 118:	4c5f676e 	mrrcmi	7, 6, r6, pc, cr14	; <UNPREDICTABLE>
 11c:	00004445 	andeq	r4, r0, r5, asr #8
 120:	61747363 	cmnvs	r4, r3, ror #6
 124:	70757472 	rsbsvc	r7, r5, r2, ror r4
 128:	0100632e 	tsteq	r0, lr, lsr #6
 12c:	05000000 	streq	r0, [r0, #-0]
 130:	02050001 	andeq	r0, r5, #1
 134:	000080d4 	ldrdeq	r8, [r0], -r4
 138:	14050518 	strne	r0, [r5], #-1304	; 0xfffffae8
 13c:	010b0313 	tsteq	fp, r3, lsl r3
 140:	01060a05 	tsteq	r6, r5, lsl #20
 144:	72030105 	andvc	r0, r3, #1073741825	; 0x40000001
 148:	030a054a 	movweq	r0, #42314	; 0xa54a
 14c:	74032e0e 	strvc	r2, [r3], #-3598	; 0xfffff1f2
 150:	0310054a 	tsteq	r0, #310378496	; 0x12800000
 154:	09052e0d 	stmdbeq	r5, {r0, r2, r3, r9, sl, fp, sp}
 158:	1005ba06 	andne	fp, r5, r6, lsl #20
 15c:	0a050106 	beq	14057c <_stack+0xc057c>
 160:	0605052d 	streq	r0, [r5], -sp, lsr #10
 164:	0402004e 	streq	r0, [r2], #-78	; 0xffffffb2
 168:	02003101 	andeq	r3, r0, #1073741824	; 0x40000000
 16c:	00150104 	andseq	r0, r5, r4, lsl #2
 170:	0f010402 	svceq	0x00010402
 174:	01040200 	mrseq	r0, R12_usr
 178:	00060215 	andeq	r0, r6, r5, lsl r2
 17c:	01580101 	cmpeq	r8, r1, lsl #2
 180:	00030000 	andeq	r0, r3, r0
 184:	00000137 	andeq	r0, r0, r7, lsr r1
 188:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 18c:	0101000d 	tsteq	r1, sp
 190:	00000101 	andeq	r0, r0, r1, lsl #2
 194:	00000100 	andeq	r0, r0, r0, lsl #2
 198:	2f3a4301 	svccs	0x003a4301
 19c:	72657355 	rsbvc	r7, r5, #1409286145	; 0x54000001
 1a0:	62412f73 	subvs	r2, r1, #460	; 0x1cc
 1a4:	616b6964 	cmnvs	fp, r4, ror #18
 1a8:	2f6d6972 	svccs	0x006d6972
 1ac:	2f766564 	svccs	0x00766564
 1b0:	534f794d 	movtpl	r7, #63821	; 0xf94d
 1b4:	696c422f 	stmdbvs	ip!, {r0, r1, r2, r3, r5, r9, lr}^
 1b8:	6e696b6e 	vnmulvs.f64	d22, d9, d30
 1bc:	454c5f67 	strbmi	r5, [ip, #-3943]	; 0xfffff099
 1c0:	3a630044 	bcc	18c02d8 <_stack+0x18402d8>
 1c4:	6f72705c 	svcvs	0x0072705c
 1c8:	6d617267 	sfmvs	f7, 2, [r1, #-412]!	; 0xfffffe64
 1cc:	6c696620 	stclvs	6, cr6, [r9], #-128	; 0xffffff80
 1d0:	28207365 	stmdacs	r0!, {r0, r2, r5, r6, r8, r9, ip, sp, lr}
 1d4:	29363878 	ldmdbcs	r6!, {r3, r4, r5, r6, fp, ip, sp}
 1d8:	756e675c 	strbvc	r6, [lr, #-1884]!	; 0xfffff8a4
 1dc:	6f6f7420 	svcvs	0x006f7420
 1e0:	6120736c 			; <UNDEFINED> instruction: 0x6120736c
 1e4:	65206d72 	strvs	r6, [r0, #-3442]!	; 0xfffff28e
 1e8:	6465626d 	strbtvs	r6, [r5], #-621	; 0xfffffd93
 1ec:	5c646564 	cfstr64pl	mvdx6, [r4], #-400	; 0xfffffe70
 1f0:	30322038 	eorscc	r2, r2, r8, lsr r0
 1f4:	712d3931 			; <UNDEFINED> instruction: 0x712d3931
 1f8:	70752d33 	rsbsvc	r2, r5, r3, lsr sp
 1fc:	65746164 	ldrbvs	r6, [r4, #-356]!	; 0xfffffe9c
 200:	6d72615c 	ldfvse	f6, [r2, #-368]!	; 0xfffffe90
 204:	6e6f6e2d 	cdpvs	14, 6, cr6, cr15, cr13, {1}
 208:	61652d65 	cmnvs	r5, r5, ror #26
 20c:	695c6962 	ldmdbvs	ip, {r1, r5, r6, r8, fp, sp, lr}^
 210:	756c636e 	strbvc	r6, [ip, #-878]!	; 0xfffffc92
 214:	6d5c6564 	cfldr64vs	mvdx6, [ip, #-400]	; 0xfffffe70
 218:	69686361 	stmdbvs	r8!, {r0, r5, r6, r8, r9, sp, lr}^
 21c:	6300656e 	movwvs	r6, #1390	; 0x56e
 220:	72705c3a 	rsbsvc	r5, r0, #14848	; 0x3a00
 224:	6172676f 	cmnvs	r2, pc, ror #14
 228:	6966206d 	stmdbvs	r6!, {r0, r2, r3, r5, r6, sp}^
 22c:	2073656c 	rsbscs	r6, r3, ip, ror #10
 230:	36387828 	ldrtcc	r7, [r8], -r8, lsr #16
 234:	6e675c29 	cdpvs	12, 6, cr5, cr7, cr9, {1}
 238:	6f742075 	svcvs	0x00742075
 23c:	20736c6f 	rsbscs	r6, r3, pc, ror #24
 240:	206d7261 	rsbcs	r7, sp, r1, ror #4
 244:	65626d65 	strbvs	r6, [r2, #-3429]!	; 0xfffff29b
 248:	64656464 	strbtvs	r6, [r5], #-1124	; 0xfffffb9c
 24c:	3220385c 	eorcc	r3, r0, #92, 16	; 0x5c0000
 250:	2d393130 	ldfcss	f3, [r9, #-192]!	; 0xffffff40
 254:	752d3371 	strvc	r3, [sp, #-881]!	; 0xfffffc8f
 258:	74616470 	strbtvc	r6, [r1], #-1136	; 0xfffffb90
 25c:	72615c65 	rsbvc	r5, r1, #25856	; 0x6500
 260:	6f6e2d6d 	svcvs	0x006e2d6d
 264:	652d656e 	strvs	r6, [sp, #-1390]!	; 0xfffffa92
 268:	5c696261 	sfmpl	f6, 2, [r9], #-388	; 0xfffffe7c
 26c:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 270:	5c656475 	cfstrdpl	mvd6, [r5], #-468	; 0xfffffe2c
 274:	00737973 	rsbseq	r7, r3, r3, ror r9
 278:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
 27c:	6d72612d 	ldfvse	f6, [r2, #-180]!	; 0xffffff4c
 280:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0xfffff68c
 284:	00632e72 	rsbeq	r2, r3, r2, ror lr
 288:	5f000001 	svcpl	0x00000001
 28c:	61666564 	cmnvs	r6, r4, ror #10
 290:	5f746c75 	svcpl	0x00746c75
 294:	65707974 	ldrbvs	r7, [r0, #-2420]!	; 0xfffff68c
 298:	00682e73 	rsbeq	r2, r8, r3, ror lr
 29c:	5f000002 	svcpl	0x00000002
 2a0:	69647473 	stmdbvs	r4!, {r0, r1, r4, r5, r6, sl, ip, sp, lr}^
 2a4:	682e746e 	stmdavs	lr!, {r1, r2, r3, r5, r6, sl, ip, sp, lr}
 2a8:	00000300 	andeq	r0, r0, r0, lsl #6
 2ac:	2d697072 	stclcs	0, cr7, [r9, #-456]!	; 0xfffffe38
 2b0:	746d7261 	strbtvc	r7, [sp], #-609	; 0xfffffd9f
 2b4:	72656d69 	rsbvc	r6, r5, #6720	; 0x1a40
 2b8:	0100682e 	tsteq	r0, lr, lsr #16
 2bc:	05000000 	streq	r0, [r0, #-0]
 2c0:	02050001 	andeq	r0, r5, #1
 2c4:	00008120 	andeq	r8, r0, r0, lsr #2
 2c8:	05011003 	streq	r1, [r1, #-3]
 2cc:	01051305 	tsteq	r5, r5, lsl #6
 2d0:	69061306 	stmdbvs	r6, {r1, r2, r8, r9, ip}
 2d4:	00020214 	andeq	r0, r2, r4, lsl r2
 2d8:	015e0101 	cmpeq	lr, r1, lsl #2
 2dc:	00030000 	andeq	r0, r3, r0
 2e0:	0000013d 	andeq	r0, r0, sp, lsr r1
 2e4:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 2e8:	0101000d 	tsteq	r1, sp
 2ec:	00000101 	andeq	r0, r0, r1, lsl #2
 2f0:	00000100 	andeq	r0, r0, r0, lsl #2
 2f4:	2f3a4301 	svccs	0x003a4301
 2f8:	72657355 	rsbvc	r7, r5, #1409286145	; 0x54000001
 2fc:	62412f73 	subvs	r2, r1, #460	; 0x1cc
 300:	616b6964 	cmnvs	fp, r4, ror #18
 304:	2f6d6972 	svccs	0x006d6972
 308:	2f766564 	svccs	0x00766564
 30c:	534f794d 	movtpl	r7, #63821	; 0xf94d
 310:	696c422f 	stmdbvs	ip!, {r0, r1, r2, r3, r5, r9, lr}^
 314:	6e696b6e 	vnmulvs.f64	d22, d9, d30
 318:	454c5f67 	strbmi	r5, [ip, #-3943]	; 0xfffff099
 31c:	3a630044 	bcc	18c0434 <_stack+0x1840434>
 320:	6f72705c 	svcvs	0x0072705c
 324:	6d617267 	sfmvs	f7, 2, [r1, #-412]!	; 0xfffffe64
 328:	6c696620 	stclvs	6, cr6, [r9], #-128	; 0xffffff80
 32c:	28207365 	stmdacs	r0!, {r0, r2, r5, r6, r8, r9, ip, sp, lr}
 330:	29363878 	ldmdbcs	r6!, {r3, r4, r5, r6, fp, ip, sp}
 334:	756e675c 	strbvc	r6, [lr, #-1884]!	; 0xfffff8a4
 338:	6f6f7420 	svcvs	0x006f7420
 33c:	6120736c 			; <UNDEFINED> instruction: 0x6120736c
 340:	65206d72 	strvs	r6, [r0, #-3442]!	; 0xfffff28e
 344:	6465626d 	strbtvs	r6, [r5], #-621	; 0xfffffd93
 348:	5c646564 	cfstr64pl	mvdx6, [r4], #-400	; 0xfffffe70
 34c:	30322038 	eorscc	r2, r2, r8, lsr r0
 350:	712d3931 			; <UNDEFINED> instruction: 0x712d3931
 354:	70752d33 	rsbsvc	r2, r5, r3, lsr sp
 358:	65746164 	ldrbvs	r6, [r4, #-356]!	; 0xfffffe9c
 35c:	6d72615c 	ldfvse	f6, [r2, #-368]!	; 0xfffffe90
 360:	6e6f6e2d 	cdpvs	14, 6, cr6, cr15, cr13, {1}
 364:	61652d65 	cmnvs	r5, r5, ror #26
 368:	695c6962 	ldmdbvs	ip, {r1, r5, r6, r8, fp, sp, lr}^
 36c:	756c636e 	strbvc	r6, [ip, #-878]!	; 0xfffffc92
 370:	6d5c6564 	cfldr64vs	mvdx6, [ip, #-400]	; 0xfffffe70
 374:	69686361 	stmdbvs	r8!, {r0, r5, r6, r8, r9, sp, lr}^
 378:	6300656e 	movwvs	r6, #1390	; 0x56e
 37c:	72705c3a 	rsbsvc	r5, r0, #14848	; 0x3a00
 380:	6172676f 	cmnvs	r2, pc, ror #14
 384:	6966206d 	stmdbvs	r6!, {r0, r2, r3, r5, r6, sp}^
 388:	2073656c 	rsbscs	r6, r3, ip, ror #10
 38c:	36387828 	ldrtcc	r7, [r8], -r8, lsr #16
 390:	6e675c29 	cdpvs	12, 6, cr5, cr7, cr9, {1}
 394:	6f742075 	svcvs	0x00742075
 398:	20736c6f 	rsbscs	r6, r3, pc, ror #24
 39c:	206d7261 	rsbcs	r7, sp, r1, ror #4
 3a0:	65626d65 	strbvs	r6, [r2, #-3429]!	; 0xfffff29b
 3a4:	64656464 	strbtvs	r6, [r5], #-1124	; 0xfffffb9c
 3a8:	3220385c 	eorcc	r3, r0, #92, 16	; 0x5c0000
 3ac:	2d393130 	ldfcss	f3, [r9, #-192]!	; 0xffffff40
 3b0:	752d3371 	strvc	r3, [sp, #-881]!	; 0xfffffc8f
 3b4:	74616470 	strbtvc	r6, [r1], #-1136	; 0xfffffb90
 3b8:	72615c65 	rsbvc	r5, r1, #25856	; 0x6500
 3bc:	6f6e2d6d 	svcvs	0x006e2d6d
 3c0:	652d656e 	strvs	r6, [sp, #-1390]!	; 0xfffffa92
 3c4:	5c696261 	sfmpl	f6, 2, [r9], #-388	; 0xfffffe7c
 3c8:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 3cc:	5c656475 	cfstrdpl	mvd6, [r5], #-468	; 0xfffffe2c
 3d0:	00737973 	rsbseq	r7, r3, r3, ror r9
 3d4:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
 3d8:	6970672d 	ldmdbvs	r0!, {r0, r2, r3, r5, r8, r9, sl, sp, lr}^
 3dc:	00632e6f 	rsbeq	r2, r3, pc, ror #28
 3e0:	5f000001 	svcpl	0x00000001
 3e4:	61666564 	cmnvs	r6, r4, ror #10
 3e8:	5f746c75 	svcpl	0x00746c75
 3ec:	65707974 	ldrbvs	r7, [r0, #-2420]!	; 0xfffff68c
 3f0:	00682e73 	rsbeq	r2, r8, r3, ror lr
 3f4:	5f000002 	svcpl	0x00000002
 3f8:	69647473 	stmdbvs	r4!, {r0, r1, r4, r5, r6, sl, ip, sp, lr}^
 3fc:	682e746e 	stmdavs	lr!, {r1, r2, r3, r5, r6, sl, ip, sp, lr}
 400:	00000300 	andeq	r0, r0, r0, lsl #6
 404:	2d697072 	stclcs	0, cr7, [r9, #-456]!	; 0xfffffe38
 408:	65736162 	ldrbvs	r6, [r3, #-354]!	; 0xfffffe9e
 40c:	0100682e 	tsteq	r0, lr, lsr #16
 410:	70720000 	rsbsvc	r0, r2, r0
 414:	70672d69 	rsbvc	r2, r7, r9, ror #26
 418:	682e6f69 	stmdavs	lr!, {r0, r3, r5, r6, r8, r9, sl, fp, sp, lr}
 41c:	00000100 	andeq	r0, r0, r0, lsl #2
 420:	00010500 	andeq	r0, r1, r0, lsl #10
 424:	81300205 	teqhi	r0, r5, lsl #4
 428:	10030000 	andne	r0, r3, r0
 42c:	13050501 	movwne	r0, #21761	; 0x5501
 430:	13060105 	movwne	r0, #24837	; 0x6105
 434:	02146906 	andseq	r6, r4, #98304	; 0x18000
 438:	01010002 	tsteq	r1, r2
 43c:	000001ea 	andeq	r0, r0, sl, ror #3
 440:	015b0003 	cmpeq	fp, r3
 444:	01020000 	mrseq	r0, (UNDEF: 2)
 448:	000d0efb 	strdeq	r0, [sp], -fp
 44c:	01010101 	tsteq	r1, r1, lsl #2
 450:	01000000 	mrseq	r0, (UNDEF: 0)
 454:	43010000 	movwmi	r0, #4096	; 0x1000
 458:	73552f3a 	cmpvc	r5, #58, 30	; 0xe8
 45c:	2f737265 	svccs	0x00737265
 460:	69646241 	stmdbvs	r4!, {r0, r6, r9, sp, lr}^
 464:	6972616b 	ldmdbvs	r2!, {r0, r1, r3, r5, r6, r8, sp, lr}^
 468:	65642f6d 	strbvs	r2, [r4, #-3949]!	; 0xfffff093
 46c:	794d2f76 	stmdbvc	sp, {r1, r2, r4, r5, r6, r8, r9, sl, fp, sp}^
 470:	422f534f 	eormi	r5, pc, #1006632961	; 0x3c000001
 474:	6b6e696c 	blvs	1b9aa2c <_stack+0x1b1aa2c>
 478:	5f676e69 	svcpl	0x00676e69
 47c:	0044454c 	subeq	r4, r4, ip, asr #10
 480:	705c3a63 	subsvc	r3, ip, r3, ror #20
 484:	72676f72 	rsbvc	r6, r7, #456	; 0x1c8
 488:	66206d61 	strtvs	r6, [r0], -r1, ror #26
 48c:	73656c69 	cmnvc	r5, #26880	; 0x6900
 490:	38782820 	ldmdacc	r8!, {r5, fp, sp}^
 494:	675c2936 	smmlarvs	ip, r6, r9, r2
 498:	7420756e 	strtvc	r7, [r0], #-1390	; 0xfffffa92
 49c:	736c6f6f 	cmnvc	ip, #444	; 0x1bc
 4a0:	6d726120 	ldfvse	f6, [r2, #-128]!	; 0xffffff80
 4a4:	626d6520 	rsbvs	r6, sp, #32, 10	; 0x8000000
 4a8:	65646465 	strbvs	r6, [r4, #-1125]!	; 0xfffffb9b
 4ac:	20385c64 	eorscs	r5, r8, r4, ror #24
 4b0:	39313032 	ldmdbcc	r1!, {r1, r4, r5, ip, sp}
 4b4:	2d33712d 	ldfcss	f7, [r3, #-180]!	; 0xffffff4c
 4b8:	61647075 	smcvs	18181	; 0x4705
 4bc:	615c6574 	cmpvs	ip, r4, ror r5
 4c0:	6e2d6d72 	mcrvs	13, 1, r6, cr13, cr2, {3}
 4c4:	2d656e6f 	stclcs	14, cr6, [r5, #-444]!	; 0xfffffe44
 4c8:	69626165 	stmdbvs	r2!, {r0, r2, r5, r6, r8, sp, lr}^
 4cc:	636e695c 	cmnvs	lr, #92, 18	; 0x170000
 4d0:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0xfffffa94
 4d4:	63616d5c 	cmnvs	r1, #92, 26	; 0x1700
 4d8:	656e6968 	strbvs	r6, [lr, #-2408]!	; 0xfffff698
 4dc:	5c3a6300 	ldcpl	3, cr6, [sl], #-0
 4e0:	676f7270 			; <UNDEFINED> instruction: 0x676f7270
 4e4:	206d6172 	rsbcs	r6, sp, r2, ror r1
 4e8:	656c6966 	strbvs	r6, [ip, #-2406]!	; 0xfffff69a
 4ec:	78282073 	stmdavc	r8!, {r0, r1, r4, r5, r6, sp}
 4f0:	5c293638 	stcpl	6, cr3, [r9], #-224	; 0xffffff20
 4f4:	20756e67 	rsbscs	r6, r5, r7, ror #28
 4f8:	6c6f6f74 	stclvs	15, cr6, [pc], #-464	; 330 <CPSR_IRQ_INHIBIT+0x2b0>
 4fc:	72612073 	rsbvc	r2, r1, #115	; 0x73
 500:	6d65206d 	stclvs	0, cr2, [r5, #-436]!	; 0xfffffe4c
 504:	64646562 	strbtvs	r6, [r4], #-1378	; 0xfffffa9e
 508:	385c6465 	ldmdacc	ip, {r0, r2, r5, r6, sl, sp, lr}^
 50c:	31303220 	teqcc	r0, r0, lsr #4
 510:	33712d39 	cmncc	r1, #3648	; 0xe40
 514:	6470752d 	ldrbtvs	r7, [r0], #-1325	; 0xfffffad3
 518:	5c657461 	cfstrdpl	mvd7, [r5], #-388	; 0xfffffe7c
 51c:	2d6d7261 	sfmcs	f7, 2, [sp, #-388]!	; 0xfffffe7c
 520:	656e6f6e 	strbvs	r6, [lr, #-3950]!	; 0xfffff092
 524:	6261652d 	rsbvs	r6, r1, #188743680	; 0xb400000
 528:	6e695c69 	cdpvs	12, 6, cr5, cr9, cr9, {3}
 52c:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xfffff39d
 530:	79735c65 	ldmdbvc	r3!, {r0, r2, r5, r6, sl, fp, ip, lr}^
 534:	72000073 	andvc	r0, r0, #115	; 0x73
 538:	692d6970 	pushvs	{r4, r5, r6, r8, fp, sp, lr}
 53c:	7265746e 	rsbvc	r7, r5, #1845493760	; 0x6e000000
 540:	74707572 	ldrbtvc	r7, [r0], #-1394	; 0xfffffa8e
 544:	00632e73 	rsbeq	r2, r3, r3, ror lr
 548:	5f000001 	svcpl	0x00000001
 54c:	61666564 	cmnvs	r6, r4, ror #10
 550:	5f746c75 	svcpl	0x00746c75
 554:	65707974 	ldrbvs	r7, [r0, #-2420]!	; 0xfffff68c
 558:	00682e73 	rsbeq	r2, r8, r3, ror lr
 55c:	5f000002 	svcpl	0x00000002
 560:	69647473 	stmdbvs	r4!, {r0, r1, r4, r5, r6, sl, ip, sp, lr}^
 564:	682e746e 	stmdavs	lr!, {r1, r2, r3, r5, r6, sl, ip, sp, lr}
 568:	00000300 	andeq	r0, r0, r0, lsl #6
 56c:	2d697072 	stclcs	0, cr7, [r9, #-456]!	; 0xfffffe38
 570:	65746e69 	ldrbvs	r6, [r4, #-3689]!	; 0xfffff197
 574:	70757272 	rsbsvc	r7, r5, r2, ror r2
 578:	682e7374 	stmdavs	lr!, {r2, r4, r5, r6, r8, r9, ip, sp, lr}
 57c:	00000100 	andeq	r0, r0, r0, lsl #2
 580:	2d697072 	stclcs	0, cr7, [r9, #-456]!	; 0xfffffe38
 584:	746d7261 	strbtvc	r7, [sp], #-609	; 0xfffffd9f
 588:	72656d69 	rsbvc	r6, r5, #6720	; 0x1a40
 58c:	0100682e 	tsteq	r0, lr, lsr #16
 590:	70720000 	rsbsvc	r0, r2, r0
 594:	70672d69 	rsbvc	r2, r7, r9, ror #26
 598:	682e6f69 	stmdavs	lr!, {r0, r3, r5, r6, r8, r9, sl, fp, sp, lr}
 59c:	00000100 	andeq	r0, r0, r0, lsl #2
 5a0:	00010500 	andeq	r0, r1, r0, lsl #10
 5a4:	81400205 	cmphi	r0, r5, lsl #4
 5a8:	1b030000 	blne	c05b0 <_stack+0x405b0>
 5ac:	13050501 	movwne	r0, #21761	; 0x5501
 5b0:	13060105 	movwne	r0, #24837	; 0x6105
 5b4:	660b0306 	strvs	r0, [fp], -r6, lsl #6
 5b8:	2e090314 	mcrcs	3, 0, r0, cr9, cr4, {0}
 5bc:	02000505 	andeq	r0, r0, #20971520	; 0x1400000
 5c0:	00130104 	andseq	r0, r3, r4, lsl #2
 5c4:	15010402 	strne	r0, [r1, #-1026]	; 0xfffffbfe
 5c8:	0b030105 	bleq	c09e4 <_stack+0x409e4>
 5cc:	0005052e 	andeq	r0, r5, lr, lsr #10
 5d0:	13010402 	movwne	r0, #5122	; 0x1402
 5d4:	01040200 	mrseq	r0, R12_usr
 5d8:	03010515 	movweq	r0, #5397	; 0x1515
 5dc:	05056624 	streq	r6, [r5, #-1572]	; 0xfffff9dc
 5e0:	01051713 	tsteq	r5, r3, lsl r7
 5e4:	017a0306 	cmneq	sl, r6, lsl #6
 5e8:	05500505 	ldrbeq	r0, [r0, #-1285]	; 0xfffffafb
 5ec:	09052e21 	stmdbeq	r5, {r0, r5, r9, sl, fp, sp}
 5f0:	2b210531 	blcs	841abc <_stack+0x7c1abc>
 5f4:	31060505 	tstcc	r6, r5, lsl #10
 5f8:	01060705 	tsteq	r6, r5, lsl #14
 5fc:	68060905 	stmdavs	r6, {r0, r2, r8, fp}
 600:	060d0501 	streq	r0, [sp], -r1, lsl #10
 604:	2d09054b 	cfstr32cs	mvfx0, [r9, #-300]	; 0xfffffed4
 608:	0d052f06 	stceq	15, cr2, [r5, #-24]	; 0xffffffe8
 60c:	09050106 	stmdbeq	r5, {r1, r2, r8}
 610:	05014e06 	streq	r4, [r1, #-3590]	; 0xfffff1fa
 614:	054b060d 	strbeq	r0, [fp, #-1549]	; 0xfffff9f3
 618:	2f062d09 	svccs	0x00062d09
 61c:	14060105 	strne	r0, [r6], #-261	; 0xfffffefb
 620:	4a1c0306 	bmi	701240 <_stack+0x681240>
 624:	00020214 	andeq	r0, r2, r4, lsl r2
 628:	018c0101 	orreq	r0, ip, r1, lsl #2
 62c:	00030000 	andeq	r0, r3, r0
 630:	00000137 	andeq	r0, r0, r7, lsr r1
 634:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 638:	0101000d 	tsteq	r1, sp
 63c:	00000101 	andeq	r0, r0, r1, lsl #2
 640:	00000100 	andeq	r0, r0, r0, lsl #2
 644:	2f3a4301 	svccs	0x003a4301
 648:	72657355 	rsbvc	r7, r5, #1409286145	; 0x54000001
 64c:	62412f73 	subvs	r2, r1, #460	; 0x1cc
 650:	616b6964 	cmnvs	fp, r4, ror #18
 654:	2f6d6972 	svccs	0x006d6972
 658:	2f766564 	svccs	0x00766564
 65c:	534f794d 	movtpl	r7, #63821	; 0xf94d
 660:	696c422f 	stmdbvs	ip!, {r0, r1, r2, r3, r5, r9, lr}^
 664:	6e696b6e 	vnmulvs.f64	d22, d9, d30
 668:	454c5f67 	strbmi	r5, [ip, #-3943]	; 0xfffff099
 66c:	3a630044 	bcc	18c0784 <_stack+0x1840784>
 670:	6f72705c 	svcvs	0x0072705c
 674:	6d617267 	sfmvs	f7, 2, [r1, #-412]!	; 0xfffffe64
 678:	6c696620 	stclvs	6, cr6, [r9], #-128	; 0xffffff80
 67c:	28207365 	stmdacs	r0!, {r0, r2, r5, r6, r8, r9, ip, sp, lr}
 680:	29363878 	ldmdbcs	r6!, {r3, r4, r5, r6, fp, ip, sp}
 684:	756e675c 	strbvc	r6, [lr, #-1884]!	; 0xfffff8a4
 688:	6f6f7420 	svcvs	0x006f7420
 68c:	6120736c 			; <UNDEFINED> instruction: 0x6120736c
 690:	65206d72 	strvs	r6, [r0, #-3442]!	; 0xfffff28e
 694:	6465626d 	strbtvs	r6, [r5], #-621	; 0xfffffd93
 698:	5c646564 	cfstr64pl	mvdx6, [r4], #-400	; 0xfffffe70
 69c:	30322038 	eorscc	r2, r2, r8, lsr r0
 6a0:	712d3931 			; <UNDEFINED> instruction: 0x712d3931
 6a4:	70752d33 	rsbsvc	r2, r5, r3, lsr sp
 6a8:	65746164 	ldrbvs	r6, [r4, #-356]!	; 0xfffffe9c
 6ac:	6d72615c 	ldfvse	f6, [r2, #-368]!	; 0xfffffe90
 6b0:	6e6f6e2d 	cdpvs	14, 6, cr6, cr15, cr13, {1}
 6b4:	61652d65 	cmnvs	r5, r5, ror #26
 6b8:	695c6962 	ldmdbvs	ip, {r1, r5, r6, r8, fp, sp, lr}^
 6bc:	756c636e 	strbvc	r6, [ip, #-878]!	; 0xfffffc92
 6c0:	6d5c6564 	cfldr64vs	mvdx6, [ip, #-400]	; 0xfffffe70
 6c4:	69686361 	stmdbvs	r8!, {r0, r5, r6, r8, r9, sp, lr}^
 6c8:	6300656e 	movwvs	r6, #1390	; 0x56e
 6cc:	72705c3a 	rsbsvc	r5, r0, #14848	; 0x3a00
 6d0:	6172676f 	cmnvs	r2, pc, ror #14
 6d4:	6966206d 	stmdbvs	r6!, {r0, r2, r3, r5, r6, sp}^
 6d8:	2073656c 	rsbscs	r6, r3, ip, ror #10
 6dc:	36387828 	ldrtcc	r7, [r8], -r8, lsr #16
 6e0:	6e675c29 	cdpvs	12, 6, cr5, cr7, cr9, {1}
 6e4:	6f742075 	svcvs	0x00742075
 6e8:	20736c6f 	rsbscs	r6, r3, pc, ror #24
 6ec:	206d7261 	rsbcs	r7, sp, r1, ror #4
 6f0:	65626d65 	strbvs	r6, [r2, #-3429]!	; 0xfffff29b
 6f4:	64656464 	strbtvs	r6, [r5], #-1124	; 0xfffffb9c
 6f8:	3220385c 	eorcc	r3, r0, #92, 16	; 0x5c0000
 6fc:	2d393130 	ldfcss	f3, [r9, #-192]!	; 0xffffff40
 700:	752d3371 	strvc	r3, [sp, #-881]!	; 0xfffffc8f
 704:	74616470 	strbtvc	r6, [r1], #-1136	; 0xfffffb90
 708:	72615c65 	rsbvc	r5, r1, #25856	; 0x6500
 70c:	6f6e2d6d 	svcvs	0x006e2d6d
 710:	652d656e 	strvs	r6, [sp, #-1390]!	; 0xfffffa92
 714:	5c696261 	sfmpl	f6, 2, [r9], #-388	; 0xfffffe7c
 718:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 71c:	5c656475 	cfstrdpl	mvd6, [r5], #-468	; 0xfffffe2c
 720:	00737973 	rsbseq	r7, r3, r3, ror r9
 724:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
 728:	7379732d 	cmnvc	r9, #-1275068416	; 0xb4000000
 72c:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0xfffff68c
 730:	00632e72 	rsbeq	r2, r3, r2, ror lr
 734:	5f000001 	svcpl	0x00000001
 738:	61666564 	cmnvs	r6, r4, ror #10
 73c:	5f746c75 	svcpl	0x00746c75
 740:	65707974 	ldrbvs	r7, [r0, #-2420]!	; 0xfffff68c
 744:	00682e73 	rsbeq	r2, r8, r3, ror lr
 748:	5f000002 	svcpl	0x00000002
 74c:	69647473 	stmdbvs	r4!, {r0, r1, r4, r5, r6, sl, ip, sp, lr}^
 750:	682e746e 	stmdavs	lr!, {r1, r2, r3, r5, r6, sl, ip, sp, lr}
 754:	00000300 	andeq	r0, r0, r0, lsl #6
 758:	2d697072 	stclcs	0, cr7, [r9, #-456]!	; 0xfffffe38
 75c:	74737973 	ldrbtvc	r7, [r3], #-2419	; 0xfffff68d
 760:	72656d69 	rsbvc	r6, r5, #6720	; 0x1a40
 764:	0100682e 	tsteq	r0, lr, lsr #16
 768:	05000000 	streq	r0, [r0, #-0]
 76c:	02050001 	andeq	r0, r5, #1
 770:	000081b8 			; <UNDEFINED> instruction: 0x000081b8
 774:	05011003 	streq	r1, [r1, #-3]
 778:	01051305 	tsteq	r5, r5, lsl #6
 77c:	69061306 	stmdbvs	r6, {r1, r2, r8, r9, ip}
 780:	05130505 	ldreq	r0, [r3, #-1285]	; 0xfffffafb
 784:	0501062a 	streq	r0, [r1, #-1578]	; 0xfffff9d6
 788:	1c052d01 	stcne	13, cr2, [r5], {1}
 78c:	2c2a0531 	cfstr32cs	mvfx0, [sl], #-196	; 0xffffff3c
 790:	052e1705 	streq	r1, [lr, #-1797]!	; 0xfffff8fb
 794:	00300605 	eorseq	r0, r0, r5, lsl #12
 798:	15010402 	strne	r0, [r1, #-1026]	; 0xfffffbfe
 79c:	02001c05 	andeq	r1, r0, #1280	; 0x500
 7a0:	0f060104 	svceq	0x00060104
 7a4:	02002905 	andeq	r2, r0, #81920	; 0x14000
 7a8:	052e0104 	streq	r0, [lr, #-260]!	; 0xfffffefc
 7ac:	0402000a 	streq	r0, [r2], #-10
 7b0:	01054a01 	tsteq	r5, r1, lsl #20
 7b4:	0006024e 	andeq	r0, r6, lr, asr #4
 7b8:	007b0101 	rsbseq	r0, fp, r1, lsl #2
 7bc:	00030000 	andeq	r0, r3, r0
 7c0:	00000047 	andeq	r0, r0, r7, asr #32
 7c4:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 7c8:	0101000d 	tsteq	r1, sp
 7cc:	00000101 	andeq	r0, r0, r1, lsl #2
 7d0:	00000100 	andeq	r0, r0, r0, lsl #2
 7d4:	2f3a4301 	svccs	0x003a4301
 7d8:	72657355 	rsbvc	r7, r5, #1409286145	; 0x54000001
 7dc:	62412f73 	subvs	r2, r1, #460	; 0x1cc
 7e0:	616b6964 	cmnvs	fp, r4, ror #18
 7e4:	2f6d6972 	svccs	0x006d6972
 7e8:	2f766564 	svccs	0x00766564
 7ec:	534f794d 	movtpl	r7, #63821	; 0xf94d
 7f0:	696c422f 	stmdbvs	ip!, {r0, r1, r2, r3, r5, r9, lr}^
 7f4:	6e696b6e 	vnmulvs.f64	d22, d9, d30
 7f8:	454c5f67 	strbmi	r5, [ip, #-3943]	; 0xfffff099
 7fc:	73000044 	movwvc	r0, #68	; 0x44
 800:	74726174 	ldrbtvc	r6, [r2], #-372	; 0xfffffe8c
 804:	0100732e 	tsteq	r0, lr, lsr #6
 808:	00000000 	andeq	r0, r0, r0
 80c:	80000205 	andhi	r0, r0, r5, lsl #4
 810:	16030000 	strne	r0, [r3], -r0
 814:	2f2f2f01 	svccs	0x002f2f01
 818:	2f2f2f2f 	svccs	0x002f2f2f
 81c:	20080f03 	andcs	r0, r8, r3, lsl #30
 820:	2f2f2f2f 	svccs	0x002f2f2f
 824:	2f2f322f 	svccs	0x002f322f
 828:	31352f34 	teqcc	r5, r4, lsr pc
 82c:	312f3331 			; <UNDEFINED> instruction: 0x312f3331
 830:	302f2f31 	eorcc	r2, pc, r1, lsr pc	; <UNPREDICTABLE>
 834:	01000202 	tsteq	r0, r2, lsl #4
 838:	Address 0x00000838 is out of bounds.


Disassembly of section .debug_frame:

00000000 <.debug_frame>:
   0:	0000000c 	andeq	r0, r0, ip
   4:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
   8:	7c020001 	stcvc	0, cr0, [r2], {1}
   c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  10:	00000014 	andeq	r0, r0, r4, lsl r0
  14:	00000000 	andeq	r0, r0, r0
  18:	00008094 	muleq	r0, r4, r0
  1c:	00000040 	andeq	r0, r0, r0, asr #32
  20:	84080e42 	strhi	r0, [r8], #-3650	; 0xfffff1be
  24:	00018e02 	andeq	r8, r1, r2, lsl #28
  28:	0000000c 	andeq	r0, r0, ip
  2c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  30:	7c020001 	stcvc	0, cr0, [r2], {1}
  34:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  38:	00000014 	andeq	r0, r0, r4, lsl r0
  3c:	00000028 	andeq	r0, r0, r8, lsr #32
  40:	000080d4 	ldrdeq	r8, [r0], -r4
  44:	0000004c 	andeq	r0, r0, ip, asr #32
  48:	84080e46 	strhi	r0, [r8], #-3654	; 0xfffff1ba
  4c:	00018e02 	andeq	r8, r1, r2, lsl #28
  50:	0000000c 	andeq	r0, r0, ip
  54:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  58:	7c020001 	stcvc	0, cr0, [r2], {1}
  5c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  60:	0000000c 	andeq	r0, r0, ip
  64:	00000050 	andeq	r0, r0, r0, asr r0
  68:	00008120 	andeq	r8, r0, r0, lsr #2
  6c:	0000000c 	andeq	r0, r0, ip
  70:	0000000c 	andeq	r0, r0, ip
  74:	00000050 	andeq	r0, r0, r0, asr r0
  78:	0000812c 	andeq	r8, r0, ip, lsr #2
  7c:	00000004 	andeq	r0, r0, r4
  80:	0000000c 	andeq	r0, r0, ip
  84:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  88:	7c020001 	stcvc	0, cr0, [r2], {1}
  8c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  90:	0000000c 	andeq	r0, r0, ip
  94:	00000080 	andeq	r0, r0, r0, lsl #1
  98:	00008130 	andeq	r8, r0, r0, lsr r1
  9c:	0000000c 	andeq	r0, r0, ip
  a0:	0000000c 	andeq	r0, r0, ip
  a4:	00000080 	andeq	r0, r0, r0, lsl #1
  a8:	0000813c 	andeq	r8, r0, ip, lsr r1
  ac:	00000004 	andeq	r0, r0, r4
  b0:	0000000c 	andeq	r0, r0, ip
  b4:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  b8:	7c020001 	stcvc	0, cr0, [r2], {1}
  bc:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  c0:	0000000c 	andeq	r0, r0, ip
  c4:	000000b0 	strheq	r0, [r0], -r0	; <UNPREDICTABLE>
  c8:	00008140 	andeq	r8, r0, r0, asr #2
  cc:	0000000c 	andeq	r0, r0, ip
  d0:	0000000c 	andeq	r0, r0, ip
  d4:	000000b0 	strheq	r0, [r0], -r0	; <UNPREDICTABLE>
  d8:	0000814c 	andeq	r8, r0, ip, asr #2
  dc:	00000004 	andeq	r0, r0, r4
  e0:	0000000c 	andeq	r0, r0, ip
  e4:	000000b0 	strheq	r0, [r0], -r0	; <UNPREDICTABLE>
  e8:	00008150 	andeq	r8, r0, r0, asr r1
  ec:	00000004 	andeq	r0, r0, r4
  f0:	0000000c 	andeq	r0, r0, ip
  f4:	000000b0 	strheq	r0, [r0], -r0	; <UNPREDICTABLE>
  f8:	00008154 	andeq	r8, r0, r4, asr r1
  fc:	00000004 	andeq	r0, r0, r4
 100:	0000000c 	andeq	r0, r0, ip
 104:	000000b0 	strheq	r0, [r0], -r0	; <UNPREDICTABLE>
 108:	00008158 	andeq	r8, r0, r8, asr r1
 10c:	00000004 	andeq	r0, r0, r4
 110:	0000000c 	andeq	r0, r0, ip
 114:	000000b0 	strheq	r0, [r0], -r0	; <UNPREDICTABLE>
 118:	0000815c 	andeq	r8, r0, ip, asr r1
 11c:	00000004 	andeq	r0, r0, r4
 120:	00000020 	andeq	r0, r0, r0, lsr #32
 124:	000000b0 	strheq	r0, [r0], -r0	; <UNPREDICTABLE>
 128:	00008160 	andeq	r8, r0, r0, ror #2
 12c:	00000054 	andeq	r0, r0, r4, asr r0
 130:	80200e44 	eorhi	r0, r0, r4, asr #28
 134:	82078108 	andhi	r8, r7, #8, 2
 138:	84058306 	strhi	r8, [r5], #-774	; 0xfffffcfa
 13c:	8c038504 	cfstr32hi	mvfx8, [r3], {4}
 140:	00018e02 	andeq	r8, r1, r2, lsl #28
 144:	0000000c 	andeq	r0, r0, ip
 148:	000000b0 	strheq	r0, [r0], -r0	; <UNPREDICTABLE>
 14c:	000081b4 			; <UNDEFINED> instruction: 0x000081b4
 150:	00000004 	andeq	r0, r0, r4
 154:	0000000c 	andeq	r0, r0, ip
 158:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 15c:	7c020001 	stcvc	0, cr0, [r2], {1}
 160:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 164:	0000000c 	andeq	r0, r0, ip
 168:	00000154 	andeq	r0, r0, r4, asr r1
 16c:	000081b8 			; <UNDEFINED> instruction: 0x000081b8
 170:	0000000c 	andeq	r0, r0, ip
 174:	00000014 	andeq	r0, r0, r4, lsl r0
 178:	00000154 	andeq	r0, r0, r4, asr r1
 17c:	000081c4 	andeq	r8, r0, r4, asr #3
 180:	00000034 	andeq	r0, r0, r4, lsr r0
 184:	52080e44 	andpl	r0, r8, #68, 28	; 0x440
 188:	0000000e 	andeq	r0, r0, lr

Disassembly of section .debug_str:

00000000 <.debug_str>:
   0:	676e6f6c 	strbvs	r6, [lr, -ip, ror #30]!
   4:	6e6f6c20 	cdpvs	12, 6, cr6, cr15, cr0, {1}
   8:	6e692067 	cdpvs	0, 6, cr2, cr9, cr7, {3}
   c:	655f0074 	ldrbvs	r0, [pc, #-116]	; ffffffa0 <_stack+0xfff7ffa0>
  10:	6c62616e 	stfvse	f6, [r2], #-440	; 0xfffffe48
  14:	6e695f65 	cdpvs	15, 6, cr5, cr9, cr5, {3}
  18:	72726574 	rsbsvc	r6, r2, #116, 10	; 0x1d000000
  1c:	73747075 	cmnvc	r4, #117	; 0x75
  20:	2f3a4300 	svccs	0x003a4300
  24:	72657355 	rsbvc	r7, r5, #1409286145	; 0x54000001
  28:	62412f73 	subvs	r2, r1, #460	; 0x1cc
  2c:	616b6964 	cmnvs	fp, r4, ror #18
  30:	2f6d6972 	svccs	0x006d6972
  34:	2f766564 	svccs	0x00766564
  38:	534f794d 	movtpl	r7, #63821	; 0xf94d
  3c:	696c422f 	stmdbvs	ip!, {r0, r1, r2, r3, r5, r9, lr}^
  40:	6e696b6e 	vnmulvs.f64	d22, d9, d30
  44:	454c5f67 	strbmi	r5, [ip, #-3943]	; 0xfffff099
  48:	6c622f44 	stclvs	15, cr2, [r2], #-272	; 0xfffffef0
  4c:	696b6e69 	stmdbvs	fp!, {r0, r3, r5, r6, r9, sl, fp, sp, lr}^
  50:	454c676e 	strbmi	r6, [ip, #-1902]	; 0xfffff892
  54:	2e357644 	cfmsuba32cs	mvax2, mvax7, mvfx5, mvfx4
  58:	74610063 	strbtvc	r0, [r1], #-99	; 0xffffff9d
  5c:	00736761 	rsbseq	r6, r3, r1, ror #14
  60:	676e6f6c 	strbvs	r6, [lr, -ip, ror #30]!
  64:	6e6f6c20 	cdpvs	12, 6, cr6, cr15, cr0, {1}
  68:	6e752067 	cdpvs	0, 7, cr2, cr5, cr7, {3}
  6c:	6e676973 			; <UNDEFINED> instruction: 0x6e676973
  70:	69206465 	stmdbvs	r0!, {r0, r2, r5, r6, sl, sp, lr}
  74:	7500746e 	strvc	r7, [r0, #-1134]	; 0xfffffb92
  78:	6769736e 	strbvs	r7, [r9, -lr, ror #6]!
  7c:	2064656e 	rsbcs	r6, r4, lr, ror #10
  80:	72616863 	rsbvc	r6, r1, #6488064	; 0x630000
  84:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
  88:	7465475f 	strbtvc	r4, [r5], #-1887	; 0xfffff8a1
  8c:	6f697047 	svcvs	0x00697047
  90:	5c3a4300 	ldcpl	3, cr4, [sl], #-0
  94:	72657355 	rsbvc	r7, r5, #1409286145	; 0x54000001
  98:	62415c73 	subvs	r5, r1, #29440	; 0x7300
  9c:	616b6964 	cmnvs	fp, r4, ror #18
  a0:	5c6d6972 			; <UNDEFINED> instruction: 0x5c6d6972
  a4:	5c766564 	cfldr64pl	mvdx6, [r6], #-400	; 0xfffffe70
  a8:	534f794d 	movtpl	r7, #63821	; 0xf94d
  ac:	696c425c 	stmdbvs	ip!, {r2, r3, r4, r6, r9, lr}^
  b0:	6e696b6e 	vnmulvs.f64	d22, d9, d30
  b4:	454c5f67 	strbmi	r5, [ip, #-3943]	; 0xfffff099
  b8:	656b0044 	strbvs	r0, [fp, #-68]!	; 0xffffffbc
  bc:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
  c0:	69616d5f 	stmdbvs	r1!, {r0, r1, r2, r3, r4, r6, r8, sl, fp, sp, lr}^
  c4:	6873006e 	ldmdavs	r3!, {r1, r2, r3, r5, r6}^
  c8:	2074726f 	rsbscs	r7, r4, pc, ror #4
  cc:	69736e75 	ldmdbvs	r3!, {r0, r2, r4, r5, r6, r9, sl, fp, sp, lr}^
  d0:	64656e67 	strbtvs	r6, [r5], #-3687	; 0xfffff199
  d4:	746e6920 	strbtvc	r6, [lr], #-2336	; 0xfffff6e0
  d8:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
  dc:	7465475f 	strbtvc	r4, [r5], #-1887	; 0xfffff8a1
  e0:	546d7241 	strbtpl	r7, [sp], #-577	; 0xfffffdbf
  e4:	72656d69 	rsbvc	r6, r5, #6720	; 0x1a40
  e8:	554e4700 	strbpl	r4, [lr, #-1792]	; 0xfffff900
  ec:	37314320 	ldrcc	r4, [r1, -r0, lsr #6]!
  f0:	332e3820 			; <UNDEFINED> instruction: 0x332e3820
  f4:	3220312e 	eorcc	r3, r0, #-2147483637	; 0x8000000b
  f8:	30393130 	eorscc	r3, r9, r0, lsr r1
  fc:	20333037 	eorscs	r3, r3, r7, lsr r0
 100:	6c657228 	sfmvs	f7, 2, [r5], #-160	; 0xffffff60
 104:	65736165 	ldrbvs	r6, [r3, #-357]!	; 0xfffffe9b
 108:	675b2029 	ldrbvs	r2, [fp, -r9, lsr #32]
 10c:	382d6363 	stmdacc	sp!, {r0, r1, r5, r6, r8, r9, sp, lr}
 110:	6172622d 	cmnvs	r2, sp, lsr #4
 114:	2068636e 	rsbcs	r6, r8, lr, ror #6
 118:	69766572 	ldmdbvs	r6!, {r1, r4, r5, r6, r8, sl, sp, lr}^
 11c:	6e6f6973 			; <UNDEFINED> instruction: 0x6e6f6973
 120:	33373220 	teqcc	r7, #32, 4
 124:	5d373230 	lfmpl	f3, 4, [r7, #-192]!	; 0xffffff40
 128:	666d2d20 	strbtvs	r2, [sp], -r0, lsr #26
 12c:	74616f6c 	strbtvc	r6, [r1], #-3948	; 0xfffff094
 130:	6962612d 	stmdbvs	r2!, {r0, r2, r3, r5, r8, sp, lr}^
 134:	7261683d 	rsbvc	r6, r1, #3997696	; 0x3d0000
 138:	6d2d2064 	stcvs	0, cr2, [sp, #-400]!	; 0xfffffe70
 13c:	3d757066 	ldclcc	0, cr7, [r5, #-408]!	; 0xfffffe68
 140:	20706676 	rsbscs	r6, r0, r6, ror r6
 144:	75746d2d 	ldrbvc	r6, [r4, #-3373]!	; 0xfffff2d3
 148:	613d656e 	teqvs	sp, lr, ror #10
 14c:	31316d72 	teqcc	r1, r2, ror sp
 150:	7a6a3637 	bvc	1a8da34 <_stack+0x1a0da34>
 154:	20732d66 	rsbscs	r2, r3, r6, ror #26
 158:	72616d2d 	rsbvc	r6, r1, #2880	; 0xb40
 15c:	6d2d206d 	stcvs	0, cr2, [sp, #-436]!	; 0xfffffe4c
 160:	68637261 	stmdavs	r3!, {r0, r5, r6, r9, ip, sp, lr}^
 164:	6d72613d 	ldfvse	f6, [r2, #-244]!	; 0xffffff0c
 168:	6b7a3676 	blvs	1e8db48 <_stack+0x1e0db48>
 16c:	2070662b 	rsbscs	r6, r0, fp, lsr #12
 170:	2d20672d 	stccs	7, cr6, [r0, #-180]!	; 0xffffff4c
 174:	7300324f 	movwvc	r3, #591	; 0x24f
 178:	74726f68 	ldrbtvc	r6, [r2], #-3944	; 0xfffff098
 17c:	746e6920 	strbtvc	r6, [lr], #-2336	; 0xfffff6e0
 180:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
 184:	7465475f 	strbtvc	r4, [r5], #-1887	; 0xfffff8a1
 188:	43717249 	cmnmi	r1, #-1879048188	; 0x90000004
 18c:	72746e6f 	rsbsvc	r6, r4, #1776	; 0x6f0
 190:	656c6c6f 	strbvs	r6, [ip, #-3183]!	; 0xfffff391
 194:	5f5f0072 	svcpl	0x005f0072
 198:	5f737362 	svcpl	0x00737362
 19c:	5f646e65 	svcpl	0x00646e65
 1a0:	635f005f 	cmpvs	pc, #95	; 0x5f
 1a4:	72617473 	rsbvc	r7, r1, #1929379840	; 0x73000000
 1a8:	00707574 	rsbseq	r7, r0, r4, ror r5
 1ac:	5f737362 	svcpl	0x00737362
 1b0:	00646e65 	rsbeq	r6, r4, r5, ror #28
 1b4:	73625f5f 	cmnvc	r2, #380	; 0x17c
 1b8:	74735f73 	ldrbtvc	r5, [r3], #-3955	; 0xfffff08d
 1bc:	5f747261 	svcpl	0x00747261
 1c0:	3a43005f 	bcc	10c0344 <_stack+0x1040344>
 1c4:	6573552f 	ldrbvs	r5, [r3, #-1327]!	; 0xfffffad1
 1c8:	412f7372 			; <UNDEFINED> instruction: 0x412f7372
 1cc:	6b696462 	blvs	1a5935c <_stack+0x19d935c>
 1d0:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
 1d4:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
 1d8:	4f794d2f 	svcmi	0x00794d2f
 1dc:	6c422f53 	mcrrvs	15, 5, r2, r2, cr3
 1e0:	696b6e69 	stmdbvs	fp!, {r0, r3, r5, r6, r9, sl, fp, sp, lr}^
 1e4:	4c5f676e 	mrrcmi	7, 6, r6, pc, cr14	; <UNPREDICTABLE>
 1e8:	632f4445 			; <UNDEFINED> instruction: 0x632f4445
 1ec:	72617473 	rsbvc	r7, r1, #1929379840	; 0x73000000
 1f0:	2e707574 	mrccs	5, 3, r7, cr0, cr4, {3}
 1f4:	6f4c0063 	svcvs	0x004c0063
 1f8:	52006461 	andpl	r6, r0, #1627389952	; 0x61000000
 1fc:	616f6c65 	cmnvs	pc, r5, ror #24
 200:	70720064 	rsbsvc	r0, r2, r4, rrx
 204:	72615f69 	rsbvc	r5, r1, #420	; 0x1a4
 208:	69745f6d 	ldmdbvs	r4!, {r0, r2, r3, r5, r6, r8, r9, sl, fp, ip, lr}^
 20c:	5f72656d 	svcpl	0x0072656d
 210:	70720074 	rsbsvc	r0, r2, r4, ror r0
 214:	6d724169 	ldfvse	f4, [r2, #-420]!	; 0xfffffe5c
 218:	656d6954 	strbvs	r6, [sp, #-2388]!	; 0xfffff6ac
 21c:	41520072 	cmpmi	r2, r2, ror r0
 220:	51524957 	cmppl	r2, r7, asr r9
 224:	73614d00 	cmnvc	r1, #0, 26
 228:	4964656b 	stmdbmi	r4!, {r0, r1, r3, r5, r6, r8, sl, sp, lr}^
 22c:	56005152 			; <UNDEFINED> instruction: 0x56005152
 230:	65756c61 	ldrbvs	r6, [r5, #-3169]!	; 0xfffff39f
 234:	755f5f00 	ldrbvc	r5, [pc, #-3840]	; fffff33c <_stack+0xfff7f33c>
 238:	33746e69 	cmncc	r4, #1680	; 0x690
 23c:	00745f32 	rsbseq	r5, r4, r2, lsr pc
 240:	44657250 	strbtmi	r7, [r5], #-592	; 0xfffffdb0
 244:	64697669 	strbtvs	r7, [r9], #-1641	; 0xfffff997
 248:	46007265 	strmi	r7, [r0], -r5, ror #4
 24c:	52656572 	rsbpl	r6, r5, #478150656	; 0x1c800000
 250:	696e6e75 	stmdbvs	lr!, {r0, r2, r4, r5, r6, r9, sl, fp, sp, lr}^
 254:	6f43676e 	svcvs	0x0043676e
 258:	65746e75 	ldrbvs	r6, [r4, #-3701]!	; 0xfffff18b
 25c:	6f430072 	svcvs	0x00430072
 260:	6f72746e 	svcvs	0x0072746e
 264:	5052006c 	subspl	r0, r2, ip, rrx
 268:	72415f49 	subvc	r5, r1, #292	; 0x124
 26c:	6d69546d 	cfstrdvs	mvd5, [r9, #-436]!	; 0xfffffe4c
 270:	6e497265 	cdpvs	2, 4, cr7, cr9, cr5, {3}
 274:	49007469 	stmdbmi	r0, {r0, r3, r5, r6, sl, ip, sp, lr}
 278:	6c435152 	stfvse	f5, [r3], {82}	; 0x52
 27c:	00726165 	rsbseq	r6, r2, r5, ror #2
 280:	552f3a43 	strpl	r3, [pc, #-2627]!	; fffff845 <_stack+0xfff7f845>
 284:	73726573 	cmnvc	r2, #482344960	; 0x1cc00000
 288:	6462412f 	strbtvs	r4, [r2], #-303	; 0xfffffed1
 28c:	72616b69 	rsbvc	r6, r1, #107520	; 0x1a400
 290:	642f6d69 	strtvs	r6, [pc], #-3433	; 298 <CPSR_IRQ_INHIBIT+0x218>
 294:	4d2f7665 	stcmi	6, cr7, [pc, #-404]!	; 108 <CPSR_IRQ_INHIBIT+0x88>
 298:	2f534f79 	svccs	0x00534f79
 29c:	6e696c42 	cdpvs	12, 6, cr6, cr9, cr2, {2}
 2a0:	676e696b 	strbvs	r6, [lr, -fp, ror #18]!
 2a4:	44454c5f 	strbmi	r4, [r5], #-3167	; 0xfffff3a1
 2a8:	6970722f 	ldmdbvs	r0!, {r0, r1, r2, r3, r5, r9, ip, sp, lr}^
 2ac:	6d72612d 	ldfvse	f6, [r2, #-180]!	; 0xffffff4c
 2b0:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0xfffff68c
 2b4:	00632e72 	rsbeq	r2, r3, r2, ror lr
 2b8:	45535047 	ldrbmi	r5, [r3, #-71]	; 0xffffffb9
 2bc:	47003054 	smlsdmi	r0, r4, r0, r3
 2c0:	54455350 	strbpl	r5, [r5], #-848	; 0xfffffcb0
 2c4:	50470031 	subpl	r0, r7, r1, lsr r0
 2c8:	4c455346 	mcrrmi	3, 4, r5, r5, cr6
 2cc:	50470030 	subpl	r0, r7, r0, lsr r0
 2d0:	4c455346 	mcrrmi	3, 4, r5, r5, cr6
 2d4:	50470031 	subpl	r0, r7, r1, lsr r0
 2d8:	4c455346 	mcrrmi	3, 4, r5, r5, cr6
 2dc:	50470032 	subpl	r0, r7, r2, lsr r0
 2e0:	4c455346 	mcrrmi	3, 4, r5, r5, cr6
 2e4:	50470033 	subpl	r0, r7, r3, lsr r0
 2e8:	4c455346 	mcrrmi	3, 4, r5, r5, cr6
 2ec:	50470034 	subpl	r0, r7, r4, lsr r0
 2f0:	4c455346 	mcrrmi	3, 4, r5, r5, cr6
 2f4:	50470035 	subpl	r0, r7, r5, lsr r0
 2f8:	314e4546 	cmpcc	lr, r6, asr #10
 2fc:	2f3a4300 	svccs	0x003a4300
 300:	72657355 	rsbvc	r7, r5, #1409286145	; 0x54000001
 304:	62412f73 	subvs	r2, r1, #460	; 0x1cc
 308:	616b6964 	cmnvs	fp, r4, ror #18
 30c:	2f6d6972 	svccs	0x006d6972
 310:	2f766564 	svccs	0x00766564
 314:	534f794d 	movtpl	r7, #63821	; 0xf94d
 318:	696c422f 	stmdbvs	ip!, {r0, r1, r2, r3, r5, r9, lr}^
 31c:	6e696b6e 	vnmulvs.f64	d22, d9, d30
 320:	454c5f67 	strbmi	r5, [ip, #-3943]	; 0xfffff099
 324:	70722f44 	rsbsvc	r2, r2, r4, asr #30
 328:	70672d69 	rsbvc	r2, r7, r9, ror #26
 32c:	632e6f69 			; <UNDEFINED> instruction: 0x632e6f69
 330:	50504700 	subspl	r4, r0, r0, lsl #14
 334:	4c434455 	cfstrdmi	mvd4, [r3], {85}	; 0x55
 338:	4700304b 	strmi	r3, [r0, -fp, asr #32]
 33c:	44555050 	ldrbmi	r5, [r5], #-80	; 0xffffffb0
 340:	314b4c43 	cmpcc	fp, r3, asr #24
 344:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
 348:	6970475f 	ldmdbvs	r0!, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
 34c:	696e496f 	stmdbvs	lr!, {r0, r1, r2, r3, r5, r6, r8, fp, lr}^
 350:	50470074 	subpl	r0, r7, r4, ror r0
 354:	304e4552 	subcc	r4, lr, r2, asr r5
 358:	52504700 	subspl	r4, r0, #0, 14
 35c:	00314e45 	eorseq	r4, r1, r5, asr #28
 360:	65736552 	ldrbvs	r6, [r3, #-1362]!	; 0xfffffaae
 364:	64657672 	strbtvs	r7, [r5], #-1650	; 0xfffff98e
 368:	65520030 	ldrbvs	r0, [r2, #-48]	; 0xffffffd0
 36c:	76726573 			; <UNDEFINED> instruction: 0x76726573
 370:	00316465 	eorseq	r6, r1, r5, ror #8
 374:	65736552 	ldrbvs	r6, [r3, #-1362]!	; 0xfffffaae
 378:	64657672 	strbtvs	r7, [r5], #-1650	; 0xfffff98e
 37c:	65520032 	ldrbvs	r0, [r2, #-50]	; 0xffffffce
 380:	76726573 			; <UNDEFINED> instruction: 0x76726573
 384:	00336465 	eorseq	r6, r3, r5, ror #8
 388:	65736552 	ldrbvs	r6, [r3, #-1362]!	; 0xfffffaae
 38c:	64657672 	strbtvs	r7, [r5], #-1650	; 0xfffff98e
 390:	65520034 	ldrbvs	r0, [r2, #-52]	; 0xffffffcc
 394:	76726573 			; <UNDEFINED> instruction: 0x76726573
 398:	00356465 	eorseq	r6, r5, r5, ror #8
 39c:	44455047 	strbmi	r5, [r5], #-71	; 0xffffffb9
 3a0:	47003053 	smlsdmi	r0, r3, r0, r3
 3a4:	53444550 	movtpl	r4, #17744	; 0x4550
 3a8:	65520031 	ldrbvs	r0, [r2, #-49]	; 0xffffffcf
 3ac:	76726573 			; <UNDEFINED> instruction: 0x76726573
 3b0:	00386465 	eorseq	r6, r8, r5, ror #8
 3b4:	65736552 	ldrbvs	r6, [r3, #-1362]!	; 0xfffffaae
 3b8:	64657672 	strbtvs	r7, [r5], #-1650	; 0xfffff98e
 3bc:	50470039 	subpl	r0, r7, r9, lsr r0
 3c0:	304e454c 	subcc	r4, lr, ip, asr #10
 3c4:	50504700 	subspl	r4, r0, r0, lsl #14
 3c8:	47004455 	smlsdmi	r0, r5, r4, r4
 3cc:	45464150 	strbmi	r4, [r6, #-336]	; 0xfffffeb0
 3d0:	4700304e 	strmi	r3, [r0, -lr, asr #32]
 3d4:	45464150 	strbmi	r4, [r6, #-336]	; 0xfffffeb0
 3d8:	4700314e 	strmi	r3, [r0, -lr, asr #2]
 3dc:	524c4350 	subpl	r4, ip, #80, 6	; 0x40000001
 3e0:	70720031 	rsbsvc	r0, r2, r1, lsr r0
 3e4:	65725f69 	ldrbvs	r5, [r2, #-3945]!	; 0xfffff097
 3e8:	6f725f67 	svcvs	0x00725f67
 3ec:	4700745f 	smlsdmi	r0, pc, r4, r7	; <UNPREDICTABLE>
 3f0:	45524150 	ldrbmi	r4, [r2, #-336]	; 0xfffffeb0
 3f4:	4700314e 	strmi	r3, [r0, -lr, asr #2]
 3f8:	4e454850 	mcrmi	8, 2, r4, cr5, cr0, {2}
 3fc:	50470030 	subpl	r0, r7, r0, lsr r0
 400:	314e4548 	cmpcc	lr, r8, asr #10
 404:	73655200 	cmnvc	r5, #0, 4
 408:	65767265 	ldrbvs	r7, [r6, #-613]!	; 0xfffffd9b
 40c:	00303164 	eorseq	r3, r0, r4, ror #2
 410:	65736552 	ldrbvs	r6, [r3, #-1362]!	; 0xfffffaae
 414:	64657672 	strbtvs	r7, [r5], #-1650	; 0xfffff98e
 418:	47003131 	smladxmi	r0, r1, r1, r3
 41c:	45524150 	ldrbmi	r4, [r2, #-336]	; 0xfffffeb0
 420:	4700304e 	strmi	r3, [r0, -lr, asr #32]
 424:	4e454c50 	mcrmi	12, 2, r4, cr5, cr0, {2}
 428:	70720031 	rsbsvc	r0, r2, r1, lsr r0
 42c:	65725f69 	ldrbvs	r5, [r2, #-3945]!	; 0xfffff097
 430:	77725f67 	ldrbvc	r5, [r2, -r7, ror #30]!
 434:	4700745f 	smlsdmi	r0, pc, r4, r7	; <UNPREDICTABLE>
 438:	56454c50 			; <UNDEFINED> instruction: 0x56454c50
 43c:	50470030 	subpl	r0, r7, r0, lsr r0
 440:	3156454c 	cmpcc	r6, ip, asr #10
 444:	73655200 	cmnvc	r5, #0, 4
 448:	65767265 	ldrbvs	r7, [r6, #-613]!	; 0xfffffd9b
 44c:	52003664 	andpl	r3, r0, #100, 12	; 0x6400000
 450:	72657365 	rsbvc	r7, r5, #-1811939327	; 0x94000001
 454:	37646576 			; <UNDEFINED> instruction: 0x37646576
 458:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
 45c:	6f697047 	svcvs	0x00697047
 460:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
 464:	6765725f 			; <UNDEFINED> instruction: 0x6765725f
 468:	5f6f775f 	svcpl	0x006f775f
 46c:	50470074 	subpl	r0, r7, r4, ror r0
 470:	304e4546 	subcc	r4, lr, r6, asr #10
 474:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
 478:	6970675f 	ldmdbvs	r0!, {r0, r1, r2, r3, r4, r6, r8, r9, sl, sp, lr}^
 47c:	00745f6f 	rsbseq	r5, r4, pc, ror #30
 480:	4c435047 	mcrrmi	0, 4, r5, r3, cr7
 484:	70003052 	andvc	r3, r0, r2, asr r0
 488:	65666572 	strbvs	r6, [r6, #-1394]!	; 0xfffffa8e
 48c:	5f686374 	svcpl	0x00686374
 490:	726f6261 	rsbvc	r6, pc, #268435462	; 0x10000006
 494:	65765f74 	ldrbvs	r5, [r6, #-3956]!	; 0xfffff08c
 498:	726f7463 	rsbvc	r7, pc, #1660944384	; 0x63000000
 49c:	73694400 	cmnvc	r9, #0, 8
 4a0:	656c6261 	strbvs	r6, [ip, #-609]!	; 0xfffffd9f
 4a4:	5152495f 	cmppl	r2, pc, asr r9
 4a8:	00325f73 	eorseq	r5, r2, r3, ror pc
 4ac:	5f514946 	svcpl	0x00514946
 4b0:	746e6f63 	strbtvc	r6, [lr], #-3939	; 0xfffff09d
 4b4:	006c6f72 	rsbeq	r6, ip, r2, ror pc
 4b8:	49697072 	stmdbmi	r9!, {r1, r4, r5, r6, ip, sp, lr}^
 4bc:	6f435152 	svcvs	0x00435152
 4c0:	6f72746e 	svcvs	0x0072746e
 4c4:	72656c6c 	rsbvc	r6, r5, #108, 24	; 0x6c00
 4c8:	666f7300 	strbtvs	r7, [pc], -r0, lsl #6
 4cc:	72617774 	rsbvc	r7, r1, #116, 14	; 0x1d00000
 4d0:	6e695f65 	cdpvs	15, 6, cr5, cr9, cr5, {3}
 4d4:	72726574 	rsbsvc	r6, r2, #116, 10	; 0x1d000000
 4d8:	5f747075 	svcpl	0x00747075
 4dc:	74636576 	strbtvc	r6, [r3], #-1398	; 0xfffffa8a
 4e0:	7500726f 	strvc	r7, [r0, #-623]	; 0xfffffd91
 4e4:	6665646e 	strbtvs	r6, [r5], -lr, ror #8
 4e8:	64656e69 	strbtvs	r6, [r5], #-3689	; 0xfffff197
 4ec:	736e695f 	cmnvc	lr, #1556480	; 0x17c000
 4f0:	63757274 	cmnvs	r5, #116, 4	; 0x40000007
 4f4:	6e6f6974 			; <UNDEFINED> instruction: 0x6e6f6974
 4f8:	6365765f 	cmnvs	r5, #99614720	; 0x5f00000
 4fc:	00726f74 	rsbseq	r6, r2, r4, ror pc
 500:	74736166 	ldrbtvc	r6, [r3], #-358	; 0xfffffe9a
 504:	746e695f 	strbtvc	r6, [lr], #-2399	; 0xfffff6a1
 508:	75727265 	ldrbvc	r7, [r2, #-613]!	; 0xfffffd9b
 50c:	765f7470 			; <UNDEFINED> instruction: 0x765f7470
 510:	6f746365 	svcvs	0x00746365
 514:	6e450072 	mcrvs	0, 2, r0, cr5, cr2, {3}
 518:	656c6261 	strbvs	r6, [ip, #-609]!	; 0xfffffd9f
 51c:	5152495f 	cmppl	r2, pc, asr r9
 520:	00315f73 	eorseq	r5, r1, r3, ror pc
 524:	62616e45 	rsbvs	r6, r1, #1104	; 0x450
 528:	495f656c 	ldmdbmi	pc, {r2, r3, r5, r6, r8, sl, sp, lr}^	; <UNPREDICTABLE>
 52c:	5f735152 	svcpl	0x00735152
 530:	69440032 	stmdbvs	r4, {r1, r4, r5}^
 534:	6c626173 	stfvse	f6, [r2], #-460	; 0xfffffe34
 538:	61425f65 	cmpvs	r2, r5, ror #30
 53c:	5f636973 	svcpl	0x00636973
 540:	73515249 	cmpvc	r1, #-1879048188	; 0x90000004
 544:	73657200 	cmnvc	r5, #0, 4
 548:	765f7465 	ldrbvc	r7, [pc], -r5, ror #8
 54c:	6f746365 	svcvs	0x00746365
 550:	52490072 	subpl	r0, r9, #114	; 0x72
 554:	65705f51 	ldrbvs	r5, [r0, #-3921]!	; 0xfffff0af
 558:	6e69646e 	cdpvs	4, 6, cr6, cr9, cr14, {3}
 55c:	00325f67 	eorseq	r5, r2, r7, ror #30
 560:	5f515249 	svcpl	0x00515249
 564:	69736162 	ldmdbvs	r3!, {r1, r5, r6, r8, sp, lr}^
 568:	65705f63 	ldrbvs	r5, [r0, #-3939]!	; 0xfffff09d
 56c:	6e69646e 	cdpvs	4, 6, cr6, cr9, cr14, {3}
 570:	3a430067 	bcc	10c0714 <_stack+0x1040714>
 574:	6573552f 	ldrbvs	r5, [r3, #-1327]!	; 0xfffffad1
 578:	412f7372 			; <UNDEFINED> instruction: 0x412f7372
 57c:	6b696462 	blvs	1a5970c <_stack+0x19d970c>
 580:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
 584:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
 588:	4f794d2f 	svcmi	0x00794d2f
 58c:	6c422f53 	mcrrvs	15, 5, r2, r2, cr3
 590:	696b6e69 	stmdbvs	fp!, {r0, r3, r5, r6, r9, sl, fp, sp, lr}^
 594:	4c5f676e 	mrrcmi	7, 6, r6, pc, cr14	; <UNPREDICTABLE>
 598:	722f4445 	eorvc	r4, pc, #1157627904	; 0x45000000
 59c:	692d6970 	pushvs	{r4, r5, r6, r8, fp, sp, lr}
 5a0:	7265746e 	rsbvc	r7, r5, #1845493760	; 0x6e000000
 5a4:	74707572 	ldrbtvc	r7, [r0], #-1394	; 0xfffffa8e
 5a8:	00632e73 	rsbeq	r2, r3, r3, ror lr
 5ac:	61736944 	cmnvs	r3, r4, asr #18
 5b0:	5f656c62 	svcpl	0x00656c62
 5b4:	73515249 	cmpvc	r1, #-1879048188	; 0x90000004
 5b8:	4500315f 	strmi	r3, [r0, #-351]	; 0xfffffea1
 5bc:	6c62616e 	stfvse	f6, [r2], #-440	; 0xfffffe48
 5c0:	61425f65 	cmpvs	r2, r5, ror #30
 5c4:	5f636973 	svcpl	0x00636973
 5c8:	73515249 	cmpvc	r1, #-1879048188	; 0x90000004
 5cc:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
 5d0:	7172695f 	cmnvc	r2, pc, asr r9
 5d4:	6e6f635f 	mcrvs	3, 3, r6, cr15, cr15, {2}
 5d8:	6c6f7274 	sfmvs	f7, 2, [pc], #-464	; 410 <CPSR_IRQ_INHIBIT+0x390>
 5dc:	5f72656c 	svcpl	0x0072656c
 5e0:	61640074 	smcvs	16388	; 0x4004
 5e4:	615f6174 	cmpvs	pc, r4, ror r1	; <UNPREDICTABLE>
 5e8:	74726f62 	ldrbtvc	r6, [r2], #-3938	; 0xfffff09e
 5ec:	6365765f 	cmnvs	r5, #99614720	; 0x5f00000
 5f0:	00726f74 	rsbseq	r6, r2, r4, ror pc
 5f4:	5f515249 	svcpl	0x00515249
 5f8:	646e6570 	strbtvs	r6, [lr], #-1392	; 0xfffffa90
 5fc:	5f676e69 	svcpl	0x00676e69
 600:	3a430031 	bcc	10c06cc <_stack+0x10406cc>
 604:	6573552f 	ldrbvs	r5, [r3, #-1327]!	; 0xfffffad1
 608:	412f7372 			; <UNDEFINED> instruction: 0x412f7372
 60c:	6b696462 	blvs	1a5979c <_stack+0x19d979c>
 610:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
 614:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
 618:	4f794d2f 	svcmi	0x00794d2f
 61c:	6c422f53 	mcrrvs	15, 5, r2, r2, cr3
 620:	696b6e69 	stmdbvs	fp!, {r0, r3, r5, r6, r9, sl, fp, sp, lr}^
 624:	4c5f676e 	mrrcmi	7, 6, r6, pc, cr14	; <UNPREDICTABLE>
 628:	722f4445 	eorvc	r4, pc, #1157627904	; 0x45000000
 62c:	732d6970 			; <UNDEFINED> instruction: 0x732d6970
 630:	69747379 	ldmdbvs	r4!, {r0, r3, r4, r5, r6, r8, r9, ip, sp, lr}^
 634:	2e72656d 	cdpcs	5, 7, cr6, cr2, cr13, {3}
 638:	6f630063 	svcvs	0x00630063
 63c:	7261706d 	rsbvc	r7, r1, #109	; 0x6d
 640:	63003065 	movwvs	r3, #101	; 0x65
 644:	61706d6f 	cmnvs	r0, pc, ror #26
 648:	00316572 	eorseq	r6, r1, r2, ror r5
 64c:	706d6f63 	rsbvc	r6, sp, r3, ror #30
 650:	32657261 	rsbcc	r7, r5, #268435462	; 0x10000006
 654:	6d6f6300 	stclvs	3, cr6, [pc, #-0]	; 65c <CPSR_IRQ_INHIBIT+0x5dc>
 658:	65726170 	ldrbvs	r6, [r2, #-368]!	; 0xfffffe90
 65c:	6f630033 	svcvs	0x00630033
 660:	65746e75 	ldrbvs	r6, [r4, #-3701]!	; 0xfffff18b
 664:	69685f72 	stmdbvs	r8!, {r1, r4, r5, r6, r8, r9, sl, fp, ip, lr}^
 668:	6e6f6300 	cdpvs	3, 6, cr6, cr15, cr0, {0}
 66c:	6c6f7274 	sfmvs	f7, 2, [pc], #-464	; 4a4 <CPSR_IRQ_INHIBIT+0x424>
 670:	6174735f 	cmnvs	r4, pc, asr r3
 674:	00737574 	rsbseq	r7, r3, r4, ror r5
 678:	6e756f63 	cdpvs	15, 7, cr6, cr5, cr3, {3}
 67c:	5f726574 	svcpl	0x00726574
 680:	52006f6c 	andpl	r6, r0, #108, 30	; 0x1b0
 684:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
 688:	79537465 	ldmdbvc	r3, {r0, r2, r5, r6, sl, ip, sp, lr}^
 68c:	6d657473 	cfstrdvs	mvd7, [r5, #-460]!	; 0xfffffe34
 690:	656d6954 	strbvs	r6, [sp, #-2388]!	; 0xfffff6ac
 694:	50520072 	subspl	r0, r2, r2, ror r0
 698:	61575f49 	cmpvs	r7, r9, asr #30
 69c:	694d7469 	stmdbvs	sp, {r0, r3, r5, r6, sl, ip, sp, lr}^
 6a0:	536f7263 	cmnpl	pc, #805306374	; 0x30000006
 6a4:	6e6f6365 	cdpvs	3, 6, cr6, cr15, cr5, {3}
 6a8:	72007364 	andvc	r7, r0, #100, 6	; 0x90000001
 6ac:	735f6970 	cmpvc	pc, #112, 18	; 0x1c0000
 6b0:	745f7379 	ldrbvc	r7, [pc], #-889	; 6b8 <CPSR_IRQ_INHIBIT+0x638>
 6b4:	72656d69 	rsbvc	r6, r5, #6720	; 0x1a40
 6b8:	7200745f 	andvc	r7, r0, #1593835520	; 0x5f000000
 6bc:	79536970 	ldmdbvc	r3, {r4, r5, r6, r8, fp, sp, lr}^
 6c0:	6d657473 	cfstrdvs	mvd7, [r5, #-460]!	; 0xfffffe34
 6c4:	656d6954 	strbvs	r6, [sp, #-2388]!	; 0xfffff6ac
 6c8:	3a430072 	bcc	10c0898 <_stack+0x1040898>
 6cc:	6573552f 	ldrbvs	r5, [r3, #-1327]!	; 0xfffffad1
 6d0:	412f7372 			; <UNDEFINED> instruction: 0x412f7372
 6d4:	6b696462 	blvs	1a59864 <_stack+0x19d9864>
 6d8:	6d697261 	sfmvs	f7, 2, [r9, #-388]!	; 0xfffffe7c
 6dc:	7665642f 	strbtvc	r6, [r5], -pc, lsr #8
 6e0:	4f794d2f 	svcmi	0x00794d2f
 6e4:	6c422f53 	mcrrvs	15, 5, r2, r2, cr3
 6e8:	696b6e69 	stmdbvs	fp!, {r0, r3, r5, r6, r9, sl, fp, sp, lr}^
 6ec:	4c5f676e 	mrrcmi	7, 6, r6, pc, cr14	; <UNPREDICTABLE>
 6f0:	735c4445 	cmpvc	ip, #1157627904	; 0x45000000
 6f4:	74726174 	ldrbtvc	r6, [r2], #-372	; 0xfffffe8c
 6f8:	4700732e 	strmi	r7, [r0, -lr, lsr #6]
 6fc:	4120554e 			; <UNDEFINED> instruction: 0x4120554e
 700:	2e322053 	mrccs	0, 1, r2, cr2, cr3, {2}
 704:	302e3233 	eorcc	r3, lr, r3, lsr r2
	...

Disassembly of section .debug_loc:

00000000 <.debug_loc>:
	...
   8:	00000007 	andeq	r0, r0, r7
   c:	07500001 	ldrbeq	r0, [r0, -r1]
  10:	40000000 	andmi	r0, r0, r0
  14:	04000000 	streq	r0, [r0], #-0
  18:	5001f300 	andpl	pc, r1, r0, lsl #6
  1c:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
	...
  2c:	00000700 	andeq	r0, r0, r0, lsl #14
  30:	51000100 	mrspl	r0, (UNDEF: 16)
  34:	00000007 	andeq	r0, r0, r7
  38:	00000040 	andeq	r0, r0, r0, asr #32
  3c:	01f30004 	mvnseq	r0, r4
  40:	00009f51 	andeq	r9, r0, r1, asr pc
	...
  50:	00070000 	andeq	r0, r7, r0
  54:	00010000 	andeq	r0, r1, r0
  58:	00000752 	andeq	r0, r0, r2, asr r7
  5c:	00004000 	andeq	r4, r0, r0
  60:	f3000400 	vshl.u8	d0, d0, d0
  64:	009f5201 	addseq	r5, pc, r1, lsl #4
	...
  74:	3f000000 	svccc	0x00000000
  78:	01000000 	mrseq	r0, (UNDEF: 0)
  7c:	003f5000 	eorseq	r5, pc, r0
  80:	004c0000 	subeq	r0, ip, r0
  84:	00040000 	andeq	r0, r4, r0
  88:	9f5001f3 	svcls	0x005001f3
	...
  9c:	0000003f 	andeq	r0, r0, pc, lsr r0
  a0:	3f510001 	svccc	0x00510001
  a4:	4c000000 	stcmi	0, cr0, [r0], {-0}
  a8:	04000000 	streq	r0, [r0], #-0
  ac:	5101f300 	mrspl	pc, SP_irq	; <UNPREDICTABLE>
  b0:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
	...
  c0:	00003f00 	andeq	r3, r0, r0, lsl #30
  c4:	52000100 	andpl	r0, r0, #0, 2
  c8:	0000003f 	andeq	r0, r0, pc, lsr r0
  cc:	0000004c 	andeq	r0, r0, ip, asr #32
  d0:	01f30004 	mvnseq	r0, r4
  d4:	00009f52 	andeq	r9, r0, r2, asr pc
	...
  e0:	00000030 	andeq	r0, r0, r0, lsr r0
  e4:	0000003c 	andeq	r0, r0, ip, lsr r0
  e8:	005e0001 	subseq	r0, lr, r1
  ec:	00000000 	andeq	r0, r0, r0
  f0:	Address 0x000000f0 is out of bounds.


Disassembly of section .ARM.attributes:

00000000 <.ARM.attributes>:
   0:	00003041 	andeq	r3, r0, r1, asr #32
   4:	61656100 	cmnvs	r5, r0, lsl #2
   8:	01006962 	tsteq	r0, r2, ror #18
   c:	00000026 	andeq	r0, r0, r6, lsr #32
  10:	4b5a3605 	blmi	168d82c <_stack+0x160d82c>
  14:	08070600 	stmdaeq	r7, {r9, sl}
  18:	0a010901 	beq	42424 <__bss_end__+0x3a228>
  1c:	14041202 	strne	r1, [r4], #-514	; 0xfffffdfe
  20:	17011501 	strne	r1, [r1, -r1, lsl #10]
  24:	1a011803 	bne	46038 <__bss_end__+0x3de3c>
  28:	1e011c01 	cdpne	12, 0, cr1, cr1, cr1, {0}
  2c:	44012202 	strmi	r2, [r1], #-514	; 0xfffffdfe
  30:	Address 0x00000030 is out of bounds.

