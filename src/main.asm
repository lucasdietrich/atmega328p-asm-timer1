#include <avr/io.h>

; equivalent to 1 second with clock select prescaler = 1024
; 15625 * 1024 / 16MHz = 1s
; 0xFFFFu - 15625u = 0xc2f6 
#define TIMER_COUNT_1S_H 0xFFFFu - 15625u
#define TIMER_COUNT_1S_H 0xc2
#define TIMER_COUNT_1S_L 0xf6

// in this script we make sure that every register is used only one time 
// because with dont push/pop registers

// we assume TIMER1_OVF_vect is the only function executed (no need to pusH/pop register to/from stack)

// export functions
.global main
.global TIMER1_OVF_vect // if __vector_13 does not appear in __vectors table, declare assoc *_OVF_vect .global

TIMER1_OVF_vect:
    call ResetTimer1

    // toggle led
    in r17, _SFR_IO_ADDR(PORTB)
	eor r17, r16
	out _SFR_IO_ADDR(PORTB), r17	
    
    reti    ; return from interrupt (I flag set - disable interrupt)


ResetTimer1:
    ldi r26, TIMER_COUNT_1S_H
    ldi r27, TIMER_COUNT_1S_L
    sts TCNT1H, r26
    sts TCNT1L, r27

    ret     ; return from routine (I flag not set)

StartTimer1:
    ldi r28, 1
    sts TIMSK1, r28     ; TIMSK1 is not in/out so sbi/cbi does not work (need to do bitset manually)
                        ; TODO : maybe BST and BLD may be usefull

    ret                 ; return from routine (I flag not set)

StopTimer1:
    ldi r28, 0
    sts TIMSK1, r28
    ret                 ; return from routine (I flag not set)

main:
    ldi r16, 0x20
    sbi _SFR_IO_ADDR(DDRB), PB5         ; configure PB5 as output
    sbi _SFR_IO_ADDR(PORTB), PB5        ; set PB5 output

    ldi r18, 0b00000101                 
    sts TCCR1B, r18                     ; configure timer1 clock select CS10:2

    ldi r19, 0
    sts TCCR1A, r19                     ; configure operation mode

    call ResetTimer1                    ; reset/set timer count (use registers r26, r27)

    call StartTimer1                    ; start timer (use register r28)

    sei

loop:
	jmp loop
