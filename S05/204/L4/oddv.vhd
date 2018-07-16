--This is a VHDL description of the hierachical design
--shown on pages 90 and 91 of Mano & Kime's 3rd Edition.
--
---------------------Beginning of top-most layer----------------------
--The top level entity, named "oodv", is just one instance
--of the "odd9v" logic block.  This level is used only to
--connect the odd9v logic block to external inputs
--and outputs.  (This layer could be eliminated to leave
--the "odd9v" entity as the top layer.  This layer is 
--included only to be consistant with the hierarchy illustrated
--in Figures 3-2 and 3-3 in the text by Mano & Kime, 3rd Ed.)

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY oddv IS
	--The signals in the PORT list of the top-most entity are the 
	--external signals for the project.  Use them for example in 
	--the Vector Waveform Editor.  These signals correspond to "pins"
	--in an equivalent schematic diagram.  
	PORT(
		x0	:IN		STD_LOGIC;   --nine inputs alltogether
		x1	:IN		STD_LOGIC;
		x2	:IN		STD_LOGIC;
		x3	:IN		STD_LOGIC;
		x4	:IN		STD_LOGIC;
		x5	:IN		STD_LOGIC;
		x6	:IN		STD_LOGIC;
		x7	:IN		STD_LOGIC;
		x8	:IN		STD_LOGIC;

		z0	:OUT	STD_LOGIC);  --output is logic-1 iff there is
		                         --an odd number of logic-1 values
		                         --on the inputs.
END oddv;

ARCHITECTURE a OF oddv IS
	--The types of logic block(s) needed from the library are declared below.
	--Only one type of block is needed in this case.  It comes from the project 
	--library.  The PORT list must match the similarly named ENTITY's
	--PORT list in a lower layer.  
	COMPONENT odd9v
		PORT (
			x0, x1, x2, x3, x4  : IN  STD_LOGIC;
			x5, x6, x7, x8      : IN  STD_LOGIC;
			z0                  : OUT STD_LOGIC);
	END COMPONENT;
	
BEGIN
	--Instantiate and connect the logic block.  The signals in the port map 
	--below are the signals usually labeled on the inside of the block in 
	--the schematic editor.  They are connected in order to the signals listed
	--above in the ENTITY statement's PORT list.  In this case, the "x0" signal
	--inside the odd9v block is connected to the external signal ("pin") which
	--just happens to also have the name "x0."  All the other signals in this 
	--list are similarly connected to external signals with the same names.
	u1: odd9v
		PORT MAP( x0, x1, x2, x3, x4, x5, x6, x7, x8, z0);
END a;
-------------------End of top-most layer-----------------
--
--------------Beginning of second layer down-------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY odd9v IS
		PORT (
			x0, x1, x2, x3, x4  : IN  STD_LOGIC;
--          XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
			z0                  : OUT STD_LOGIC);
END odd9v;

ARCHITECTURE a OF odd9v IS
	--Describe the kinds of hardware needed in oddv.
	--Three internal signals needed.  (wires that are not inputs or outputs)
	SIGNAL	w1	:	STD_LOGIC;
--  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
--  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
	
	--The types of logic block(s) needed from the library are declared below.
	--Only one type of block is needed in this case.  It comes from the project 
	--library.  The PORT list in the COMPONENT statement must match the ENTITY's 
	--PORT list in a lower layer.  
	COMPONENT odd3v
--       XXXXXXX
--            XXXXXXXXXXXXXXXXXXXXXXXXXXX
--            XXXXXXXXXXXXXXXXXXXXXXXXXXX
--            XXXXXXXXXXXXXXXXXXXXXXXXXXX
--            XXXXXXXXXXXXXXXXXXXXXXXXXXX
	END COMPONENT;
	
BEGIN
	--Instantiate and connect the logic blocks.
	bits0_2: odd3v
		PORT MAP( x0, x1, x2, w1);
--	XXXXXXXXXXXXXXXX
--      XXXXXXXXXXXXXXXXXXXXXXXXXX
	bits6_8: odd3v
		PORT MAP( x6, x7, x8, --XX);
		
--  XXXXXXXXXXXXXX
		P--XXXXXXXXXXXXXXXXXXXXXXXXXX
END a;
------------------End 2nd layer down-----------------------
--
---------------Start of 3rd layer down---------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY odd3v IS
    --List the "pins" of this entity.
	PORT(
		a0	:	IN	STD_LOGIC;
		a1	:	IN	STD_LOGIC;
		a2	:	IN	STD_LOGIC;
		b0	:	OUT	STD_LOGIC);
END odd3v;

ARCHITECTURE a OF odd3v IS
    --Describe hardware needed
	SIGNAL	w1	:	STD_LOGIC;
	COMPONENT odd2v
		PORT(
			c0	:	IN	STD_LOGIC;
			c1	:	IN	STD_LOGIC;
			d0	:	OUT	STD_LOGIC);
	END COMPONENT;
	
	BEGIN
	--Instantiate and connect each block
		left:	odd2v
			PORT MAP(a0, a1, w1);
		right:	odd2v
			PORT MAP(w1, a2, b0);
END a;
---------------End of 3rd layer down-----------------------
--
----------Start of 4th layer down (bottom layer)-----------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

LIBRARY altera;
USE altera.maxplus2.ALL;

ENTITY odd2v IS
	PORT(
		c0, c1	:	IN	STD_LOGIC;
		d0		:	OUT	STD_LOGIC);
END odd2v;

ARCHITECTURE a OF odd2v IS
	SIGNAL	w1 :	STD_LOGIC;
	SIGNAL	w2 :	STD_LOGIC;
	SIGNAL	w3 :	STD_LOGIC;

	COMPONENT a_7400
		PORT(
            a_2: in STD_LOGIC;
            a_3: in STD_LOGIC;
            a_1: out STD_LOGIC);
	END COMPONENT;
	
	BEGIN
		left:a_7400
			PORT MAP( c0, c1, w1);
		mid_top:a_7400
			PORT MAP( c0, w1, w2);
		mid_bottom:a_7400
			PORT MAP( w1, c1, w3);
		right:a_7400
			PORT MAP( w2, w3, d0);
END a;
---------------End of 4th layer down (bottom layer)-----------------------
--
------------Actually, there are more layers before you get down
--          to primative logic functions, but they are all buried in
--          the altera maxplus2 library.  
