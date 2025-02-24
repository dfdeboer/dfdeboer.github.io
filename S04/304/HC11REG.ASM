* FILE HC11REG.ASM  - library file for memory-mapped registers
* to be used by an application source code.  Use it 
* by concatenating it to the application source code 
* or by pasting it into the application source code.
* For register information, refer to Table B.1 (Appendix B)
* These are MC68HC11A8 and E9 part registers.
* Modify listing as required for other 68HC11 parts. 

* Registers will be addressed with Ind,X mode

REGBAS  EQU    	 $1000  	;Starting address for
*				;register block
PAGE0	EQU	0
	ORG	0

PORTA	RMB	1	;$00 
	RMB	1	; Reserved
PIOC	RMB	1	;$02 
PORTC	RMB	1	;$03 
PORTB	RMB	1	;$04 
PORTCL	RMB	1	;$05
	RMB	1	; Reserved
DDRC	RMB	1	;$07
PORTD	RMB	1	;$08
DDRD	RMB	1	;$09
PORTE	RMB	1	;$0A
CFORC	RMB	1	;$0B
OC1M	RMB	1	;$0C
OC1D	RMB	1	;$0D
TCNT	RMB	2	;$0E
TIC1	RMB	2	;$10
TIC2	RMB	2	;$12
TIC3	RMB	2	;$14
TOC1	RMB	2	;$16
TOC2	RMB	2	;$18
TOC3	RMB	2	;$1A
TOC4	RMB	2	;$1C
TOC5	RMB	2	;$1E
TCTL1	RMB	1	;$20
TCTL2	RMB	1	;$21
TMSK1	RMB	1	;$22
TFLG1	RMB	1	;$23
TMSK2	RMB	1	;$24
TFLG2	RMB	1	;$25
PACTL	RMB	1	;$26
PACNT	RMB	1	;$27
SPCR	RMB	1	;$28
SPSR	RMB	1	;$29
SPDR	RMB	1	;$2A
BAUD	RMB	1	;$2B
SCCR1	RMB	1	;$2C
SCCR2	RMB	1	;$2D
SCSR	RMB	1	;$2E
SCDR	RMB	1	;$2F
ADCTL	RMB	1	;$30
ADR1	RMB	1	;$31
ADR2	RMB	1	;$32
ADR3	RMB	1	;$33
ADR4	RMB	1	;$34
BPROT	RMB	1	;$35 - EEPROM Block Protect for E9 part, not A8 
	RMB	3	; Reserved
OPTION	RMB	1	;$39
COPRST	RMB	1	;$3A
PPROG	RMB	1	;$3B
HPRIO	RMB	1	;$3C
INIT	RMB	1	;$3D
TEST1	RMB	1	;$3E
CONFIG	RMB	1	;$3F	


* END OF FILE HC11REG.ASM