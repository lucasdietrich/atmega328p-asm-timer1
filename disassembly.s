
.pio/build/pro16MHzatmega328/firmware.elf:     file format elf32-avr


Disassembly of section .text:

00000000 <__vectors>:
   0:	0c 94 34 00 	jmp	0x68	; 0x68 <__ctors_end>
   4:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
   8:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
   c:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  10:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  14:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  18:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  1c:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  20:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  24:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  28:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  2c:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  30:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  34:	0c 94 40 00 	jmp	0x80	; 0x80 <__vector_13>
  38:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  3c:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  40:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  44:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  48:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  4c:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  50:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  54:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  58:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  5c:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  60:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  64:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>

00000068 <__ctors_end>:
  68:	11 24       	eor	r1, r1
  6a:	1f be       	out	0x3f, r1	; 63
  6c:	cf ef       	ldi	r28, 0xFF	; 255
  6e:	d8 e0       	ldi	r29, 0x08	; 8
  70:	de bf       	out	0x3e, r29	; 62
  72:	cd bf       	out	0x3d, r28	; 61
  74:	0e 94 55 00 	call	0xaa	; 0xaa <main>
  78:	0c 94 65 00 	jmp	0xca	; 0xca <_exit>

0000007c <__bad_interrupt>:
  7c:	0c 94 00 00 	jmp	0	; 0x0 <__vectors>

00000080 <__vector_13>:
  80:	0e 94 46 00 	call	0x8c	; 0x8c <ResetTimer1>
  84:	15 b1       	in	r17, 0x05	; 5
  86:	10 27       	eor	r17, r16
  88:	15 b9       	out	0x05, r17	; 5
  8a:	18 95       	reti

0000008c <ResetTimer1>:
  8c:	a2 ec       	ldi	r26, 0xC2	; 194
  8e:	b6 ef       	ldi	r27, 0xF6	; 246
  90:	a0 93 85 00 	sts	0x0085, r26	; 0x800085 <__TEXT_REGION_LENGTH__+0x7e0085>
  94:	b0 93 84 00 	sts	0x0084, r27	; 0x800084 <__TEXT_REGION_LENGTH__+0x7e0084>
  98:	08 95       	ret

0000009a <StartTimer1>:
  9a:	c1 e0       	ldi	r28, 0x01	; 1
  9c:	c0 93 6f 00 	sts	0x006F, r28	; 0x80006f <__TEXT_REGION_LENGTH__+0x7e006f>
  a0:	08 95       	ret

000000a2 <StopTimer1>:
  a2:	c0 e0       	ldi	r28, 0x00	; 0
  a4:	c0 93 6f 00 	sts	0x006F, r28	; 0x80006f <__TEXT_REGION_LENGTH__+0x7e006f>
  a8:	08 95       	ret

000000aa <main>:
  aa:	00 e2       	ldi	r16, 0x20	; 32
  ac:	25 9a       	sbi	0x04, 5	; 4
  ae:	2d 9a       	sbi	0x05, 5	; 5
  b0:	25 e0       	ldi	r18, 0x05	; 5
  b2:	20 93 81 00 	sts	0x0081, r18	; 0x800081 <__TEXT_REGION_LENGTH__+0x7e0081>
  b6:	30 e0       	ldi	r19, 0x00	; 0
  b8:	30 93 80 00 	sts	0x0080, r19	; 0x800080 <__TEXT_REGION_LENGTH__+0x7e0080>
  bc:	0e 94 46 00 	call	0x8c	; 0x8c <ResetTimer1>
  c0:	0e 94 4d 00 	call	0x9a	; 0x9a <StartTimer1>
  c4:	78 94       	sei

000000c6 <loop>:
  c6:	0c 94 63 00 	jmp	0xc6	; 0xc6 <loop>

000000ca <_exit>:
  ca:	f8 94       	cli

000000cc <__stop_program>:
  cc:	ff cf       	rjmp	.-2      	; 0xcc <__stop_program>
