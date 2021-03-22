#include <avr/io.h>

#define TIMER_COUNT 0xFFFFu - 15625u = 0xc2f6

// in this script we make sure that every register is used only one time 
// because with dont push/pop registers

// export functions
.global main
.global TIMER1_OVF_vect // if __vector_13 does not appear in __vectors table, declare assoc *_OVF_vect .global

TIMER1_OVF_vect:
    call ResetTimer1

    # toggle ledt
    in r17, _SFR_IO_ADDR(PORTB)
	eor r17, r16
	out _SFR_IO_ADDR(PORTB), r17	
    
    reti    ; return from interrupt (I flag set)

ResetTimer1:
    ldi r26, 0xc2
    ldi r27, 0xf6
    sts TCNT1H, r26
    sts TCNT1L, r27

    ret     ; return from routine (I flag not set)

StartTimer1:
    ldi r28, 1
    sts TIMSK1, r28 ; TIMSK1 is not in/out so sbi/cbi does not work (need to do bitset manually)
    ; maybe BST and BLD may be usefull
    ret     ; return from routine (I flag not set)

StopTimer1:
    ldi r28, 0
    sts TIMSK1, r28
    ret     ; return from routine (I flag not set)

main:
    ldi r16, 0x20
    sbi _SFR_IO_ADDR(DDRB), PB5
    sbi _SFR_IO_ADDR(PORTB), PB5

    ldi r18, 0b00000101
    ldi r19, 0
    sts TCCR1B, r18
    sts TCCR1A, r19

    call ResetTimer1

    call StartTimer1

    sei

loop:
	jmp loop
