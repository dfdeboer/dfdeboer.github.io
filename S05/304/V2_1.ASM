***************************************************
*             Valvano                     DDB
*  EGR 304    PS#____  Page_____ of_____ Date______
*
*  Problem 2.1
*
***************************************************
*LABEL	OPCD	OPERAND	;COMMENTS
*		|	|		|
*		|	|		|
*  MEMORY MAP
RESET_VCTR	EQU	$FFFE
STACK		EQU	$00FF		;Also end of RAM
RAM		EQU	$0040		;Start of RAM
*
*
*  FILL CONSTANTS INTO MEMORY
		ORG	RESET_VCTR 
			FDB	RAM
*
*
*  START OF EXECUTION
		ORG	RAM
MAIN		LDS	#STACK
		LDAA	#150		;Value for Th
		PSHA
		LDAA	#90		;Value for In
		PSHA
		JSR	<FUZZY
		INS
		INS
LOOP		BRA	LOOP		;End of program--fall
*					;into an infinite loop
*
****************************************************
*
* FUZZY
* The student's contribution to the solution to 
* problem 2.1 follows. . .
*
FUZZY		RTS			;Replace with solution
