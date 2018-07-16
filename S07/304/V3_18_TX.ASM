**************************************************************
*             Valvano                      Student's Name Here
*  EGR 304    PS#____      Page_____ of_____      Date________
*
*  Problem 3.18--An interface to a device
*
*  The objective of this problem is to interface the following
*  input device to a microcomputer single-chip computer using
*  The specified I/O ports (Figure 3.50).  The figure shows
*  the connections to port C.  Write the program in assembly
*  language.
*
*  First the uC sets "Control" = 1, meaning input is requested
*  Then the input device will create a new 8-bit input and 
*  place it on the "Data" bus.  The input device will then
*  make "Status" = 1 signifying new data available.  Next the
*  uC should read the 8-bit input value.  The uC will then 
*  make "Control" = 0, meaning it has read the data.  The 
*  input device will then make "Status" = 0, signifying that 
*  the transfer is complete.  The I/O subroutine must wait
*  for "Status" = 0 before returning.  
*
*     +---------------+                 +-----------------+
*     |            PA2|<----------------|Status           |
*     | uC         PA3|---------------->|Control   Input  |
*     |        PC7-PC0|<================|Data      device |
*     |            GND|-----------------|GND              |
*     +---------------+                 +-----------------+
*
*  Figure 3.50  An input device interfaced to a microcomputer.
*
*
**************************************************************
*LABEL      OPCD OPERAND      ;COMMENTS
*           |    |            | (Formatted to print with 0.7"|
*           |    |            | margins, portriat page layout|
*           |    |            | layout, 8 pt Courier New     |
*           |    |            | font.)      (end of line)--->|
*  MEMORY MAP
RAM         EQU  $0000
STACK       EQU  $00FF        ;Also end of RAM
REGBAS      EQU  $1000        ;Registers end at $103F
EEPROM      EQU  $F800        ;Start of EEPROM
RESET_VCTR  EQU  $FFFE

*  REGISTER BINDINGS
PORTA       EQU  $00
PORTC       EQU  $03
DDRC        EQU  $07
PACTL       EQU  $26

*
*  FILL CONSTANTS INTO MEMORY (FILL VECTOR TABLE)
            ORG   RESET_VCTR 
            FDB   MAIN
*
*
*  START OF EXECUTION
            ORG   EEPROM
MAIN        LDS   #STACK
            BSR   INIT_DEV
LOOP        BSR   READ_DEV    ;Result in Register A
            BRA   LOOP        ;End of program--fall
*                             ;into an infinite loop
*
*
*********************
*
*  INIT_DEV 
*  
*  Initializes PORT A and PORT C to make them ready to use
*
INIT_DEV    LDX   #REGBAS
                  ; Fill in the immediate data on the next ln
            LDAA  #           ;0 = input,   1 = output
            STAA  PACTL,X     ;Sets PA3 to output mode        
                  ; Fill in the immediate data on the next ln
            LDAA  #           ;0 = input,   1 = output
            STAA  DDRC,X      ;Sets PC7 - PC0 to input mode
            STAA  PORTA,X     ;Clear the "Control" signal
            RTS 
*
*
*********************
*
* READ_DEV
*
* Reads the device attached to PORT C and returns the 6-bit
* result in register A.  Upon entry the status bit from the
* device is supposed to be zero.  (Correct operation is not
* assured unless this is the case.)
*
*LABEL      OPCD OPERAND      ;COMMENTS     (end of line---->|
*           |    |            |                              |
*           |    |            |                              |
CTL         EQU  %00001000    ;Mask selects "Control" signal
READ_DEV    PSHX              ;Preserve contents of X
            LDX  #REGBAS 
            ;
            ; The following lines of code are in the wrong
            ; order and misplaced.  They can be re-ordered
            ; into working code except that one line is 
            ; entirely missing and there are a few 
            ; unnecessary lines.  The missing line reads the 
            ; data.  You may write your own code here or 
            ; fix this code.  
            ;
            LDAA #$FF
            RTS
WAIT_S1     BRCLR PORTA,X,#STAT,WAIT_S1 ;Wait for status = 1
            BSET PORTA,X,#CTL ;Make Control = 1
            STAA PORTA,X      
STAT        EQU  %00000100    ;Mask selects "Status"  signal
            PULX 
            BCLR PORTA,X,#CTL ;Make Control = 0 
WAIT_S0     BRSET PORTA,X,#STAT,WAIT_S0  ;Wait for status = 0 

