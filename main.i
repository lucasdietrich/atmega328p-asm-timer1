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

__vector_13:
    ldi r26, 0xc2
    ldi r27, 0xf6
    sts (0x85), r26
    sts (0x84), r27

    in ((((0x05) + 0x20)) - 0x20), r17
 eor r17, r16
 out ((((0x05) + 0x20)) - 0x20), r17

    reti


ResetTimer1:
    ldi r26, 0xc2
    ldi r27, 0xf6
    sts (0x85), r26
    sts (0x84), r27
    jmp PC
# 35 "src/main.asm"
main:
    ldi r16, 0x20
    out ((((0x0A) + 0x20)) - 0x20), r16
    out ((((0x05) + 0x20)) - 0x20), r16

    sts (0x81), 0b00000101
    sts (0x80), 0

    ldi r26, 0xc2
    ldi r27, 0xf6
    sts (0x85), r26
    sts (0x84), r27


    sbi (((0x6F)) - 0x20), 0

    sei

loop:
 jmp loop
