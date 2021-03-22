# ATmega328p assembler Timer1

Preprocessor : 
`C:/Users/ldade/.platformio/packages/toolchain-atmelavr/bin/avr-gcc.exe -x assembler-with-cpp -Os -Wall -ffunction-sections -fdata-sections -flto -mmcu=atmega328p -DF_CPU=16000000L -DPLATFORMIO=50101 -DARDUINO_AVR_PRO -Iinclude -Isrc -c src/main.asm -E -o main.i`

Disassembly :

`C:/Users/ldade/.platformio/packages/toolchain-atmelavr/bin/avr-objdump.exe -d .pio/build/pro16MHzatmega328/firmware.elf > disassembly.s`