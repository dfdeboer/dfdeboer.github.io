***************************************************
*             Valvano                     DDB
*  EGR 304    PS#____  Page_____ of_____ Date______
*
*  Problem 2.1--main code modified for TEXAS simulator
*
***************************************************
*LABEL	OPCD	OPERAND	;COMMENTS
*		|	|		|
*		|	|		|
*  MEMORY MAP
RESET_VCTR	EQU	$FFFE
STACK		EQU	$00FF		;Also end of RAM
EEPROM		EQU	$F800		;Start of EEPROM
*
*
*  FILL CONSTANTS INTO MEMORY
		ORG	RESET_VCTR 
			FDB	EEPROM
*
*
*  START OF EXECUTION
		ORG	EEPROM
MAIN		LDS	#STACK
		LDAA	#150		;Value for Th, $96
		PSHA
		LDAA	#90		;Value for In, $5A
		PSHA
		JSR	FUZZY
		INS
		INS
LOOP		BRA	LOOP		;End of program--fall
*					;into an infinite loop
*
* Register B = (255*(150-90))/150 = 102 which is $66
*
****************************************************
*
* FUZZY
* The student's contribution to the solution to 
* problem 2.1 follows. . .
*
FUZZY		RTS			;Replace with solution
