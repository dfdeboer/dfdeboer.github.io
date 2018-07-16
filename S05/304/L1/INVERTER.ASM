*  INVERTER.ASM
*******************************
*  A program to demonstrate assembling, downloading, 
*  and executing a program on a 68HC11 microcontroller
*******************************
*  Target device: MC68HC11E2 in single chip mode.
*  With "6811 monitor" loaded in EEPROM
*  PORT C used for I/O
*
*  Memory Map:
*  $0000 - $003F Registers
*  $0040 - $00FF 192 bytes ram (This program)
*                 64 bytes ram wasted by mapping 
*                    registers over it--monitor does that
*  $F800 - $FFFF EEPROM
*
********************************
*LBL     OPCODE OPERAND COMMENTS
PORTC    EQU    $0003   8-bit bidirectional port C
DDRC     EQU    $0007   data direction register for port C
COPRST   EQU    $003A

MAIN     ORG    $0040
         LDAA   #$F0    Bits 7-4 will be output, 3-0 input
         STAA   DDRC
LOOP     LDAA   PORTC
         COMA
         ASLA           Shift register A left one place
         ASLA
         ASLA
         ASLA
         STAA   PORTC
         LDAA   #55H    Salute the COP
         STAA   COPRST
         COMA
         STAA   COPRST
         BRA    LOOP

