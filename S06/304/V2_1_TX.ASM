**************************************************************
*             Valvano                      Student's Name Here
*  EGR 304    PS#____      Page_____ of_____      Date________
*
*  Problem 2.1--A header and MAIN code set up for writing 
*  a solution and simulating it in the TEXAS simulator.
*
**************************************************************
*LABEL      OPCD OPERAND      ;COMMENTS
*           |    |            | (Formatted to print with 0.7"|
*           |    |            | margins, portriat page layout|
*           |    |            | layout, 8 pt Courier New     |
*           |    |            | font.)      (end of line)--->|
*  MEMORY MAP
RESET_VCTR  EQU  $FFFE
STACK       EQU  $00FF        ;Also end of RAM
EEPROM      EQU  $F800        ;Start of EEPROM
*
*
*  FILL CONSTANTS INTO MEMORY
            ORG   RESET_VCTR 
            FDB   EEPROM
*
*
*  START OF EXECUTION
            ORG   EEPROM
MAIN        LDS   #STACK
            LDAA  #150        ;Value for Th, $96
            PSHA
            LDAA  #90         ;Value for In, $5A
            PSHA
            JSR   FUZZY
            INS
            INS
LOOP        BRA   LOOP        ;End of program--fall
*                             ;into an infinite loop
*
* Register B = (255*(150-90))/150 = 102 which is $66
*
**************************************************************
*
*                                (continues on the next page)
*
*    (When printing, insert a page break here if needed.)
*
**************************************************************
*             Valvano                      Student's Name here
*  EGR 304    PS#____      Page_____ of_____      Date________
*
**************************************************************
*
* Valvano 2.1
* Write a subroutine called FUZZY that performs the I/O 
* function shown in figure 2.18.  IN and TH are inputs and OUT 
* is the result.  All parameters are 8-bit unsigned integers.  
* A typical calling shows that the two inputs, IN and TH, are 
* passed on the stack and the return parmeter, OUT, is passed 
* in register B.
*
* If IN >= TH then OUT = 0
* If IN <  TH then OUT = (255*(TH-IN))/TH
*
*********************
*
* FUZZY
*
* Stack upon entry: 
*
*              SP-->$00FB |                       |
*               X-->$00FC | return address ls byte|
*                   $00FD | return address ms byte|
*                   $00FE |           IN          |
*                   $00FF |           TH          |
*                         +-----------------------+
*LABEL      OPCD OPERAND      ;COMMENTS     (end of line---->|
*           |    |            |                              |
*           |    |            |                              |
* bindings:
*
IN          equ  2
TH          equ  3
*
* subroutine:
*
FUZZY       tsx               pointer to IN and OUT in X
            ldaa TH,x
*           . 
*           .
*           .                 Students: Replace these
*                             Comments following the 
*                             "ldaa TH,x" instricution
*                             with as many lines of code
*                             as you need for your solution.
            rts

