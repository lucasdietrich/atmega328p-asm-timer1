# 1 "src/main.asm"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/main.asm"
# 1 "c:\\users\\ldade\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\avr\\io.h" 1 3
# 99 "c:\\users\\ldade\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\avr\\io.h" 3
# 1 "c:\\users\\ldade\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\avr\\sfr_defs.h" 1 3
# 100 "c:\\users\\ldade\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\avr\\io.h" 2 3
# 272 "c:\\users\\ldade\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\avr\\io.h" 3
# 1 "c:\\users\\ldade\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\avr\\iom328p.h" 1 3
# 273 "c:\\users\\ldade\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\avr\\io.h" 2 3
# 703 "c:\\users\\ldade\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\avr\\io.h" 3
# 1 "c:\\users\\ldade\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\avr\\portpins.h" 1 3
# 704 "c:\\users\\ldade\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\avr\\io.h" 2 3

# 1 "c:\\users\\ldade\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\avr\\common.h" 1 3
# 706 "c:\\users\\ldade\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\avr\\io.h" 2 3

# 1 "c:\\users\\ldade\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\avr\\version.h" 1 3
# 708 "c:\\users\\ldade\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\avr\\io.h" 2 3






# 1 "c:\\users\\ldade\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\avr\\fuse.h" 1 3
# 715 "c:\\users\\ldade\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\avr\\io.h" 2 3


# 1 "c:\\users\\ldade\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\avr\\lock.h" 1 3
# 718 "c:\\users\\ldade\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\avr\\io.h" 2 3
# 2 "src/main.asm" 2







.global main
.global __vector_13

__vector_13:
    call ResetTimer1

    ; toggle ledt
    in r17, ((((0x05) + 0x20)) - 0x20)
 eor r17, r16
 out ((((0x05) + 0x20)) - 0x20), r17

    reti ; return from interrupt (I flag set)

ResetTimer1:
    ldi r26, 0xc2
    ldi r27, 0xf6
    sts (0x85), r26
    sts (0x84), r27

    ret ; return from routine (I flag not set)

StartTimer1:
    ldi r28, 1
    sts (0x6F), r28 ; (0x6F) is not in/out so sbi/cbi does not work (need to do bitset manually)
    ; maybe BST and BLD may be usefull
    ret ; return from routine (I flag not set)

StopTimer1:
    ldi r28, 0
    sts (0x6F), r28
    ret ; return from routine (I flag not set)

main:
    ldi r16, 0x20
    sbi ((((0x04) + 0x20)) - 0x20), 5
    sbi ((((0x05) + 0x20)) - 0x20), 5

    ldi r18, 0b00000101
    ldi r19, 0
    sts (0x81), r18
    sts (0x80), r19

    call ResetTimer1

    call StartTimer1

    sei

loop:
 jmp loop
