***************************************************
*             Valvano              Name:___________
*  EGR 304    PS#____  Page_____ of_____ Date______
*
*  A program to measure the width of a pulse.  The
*  width can range from 0 to 65535 E-clock cycles.
***************************************************
*LABEL    OPCD OPERAND    ;COMMENTS
*         |    |          |
*         |    |          |
* MEMORY MAP
RAM       EQU  $0000      ;Start of RAM in TExaS
STACK     EQU  $00FF      ;Also end of RAM
REGBAS    EQU  $1000      ;registers to $103F
EEPROM    EQU  $F800      ;extends   to $FFFF
IC1_V     EQU  $FFEE
RESET_V   EQU  $FFFE
*
*
* REGISTERS USED
TCNT      EQU  $0E       ;Free-running counter
TCTL2     EQU  $21       ;Timer Control Register 2
TMSK1     EQU  $22       ;Timer interrupt mask 1
TFLG1     EQU  $23       ;Timer Flag Register 1
*
* GLOBAL VARIABLES
          ORG RAM
PREVIOUS  RMB 2           ;Previous captured time
PERIOD    RMB 2              


*  FILL CONSTANTS INTO MEMORY
          ORG  IC1_V
          FDB  ISR_IC1
          ORG  RESET_V 
          FDB  MAIN
*
*
*  START OF EXECUTION
          ORG  EEPROM
MAIN      LDS  #STACK
          BSR  INIT_IC1
LOOP      BRA  LOOP       ;End of program--fall
*                         ;into an infinite loop
*
*
****************************************************
*
* INIT_IC1
* The initialization ritual for input capture events
* on IC1 goes here.
*
INIT_IC1
*         RTI             ;Replace with real ritual
*
*
*
****************************************************
*
* ISR_IC1
* Interrupt service routine for input capture events
* on input IC1
*
INPUT_C   RTI             ;Replace with a real ISR

