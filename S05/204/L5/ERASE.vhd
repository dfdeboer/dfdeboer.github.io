-- This VHDL file simply erases a MAX chip by programming it with not much.
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY erase is
	PORT (z:out STD_LOGIC);
END erase;
ARCHITECTURE a OF erase is
BEGIN
    z <= 'U';
END a;
--Upon compilation, this file should generate a warning:
--"Output pins are stuck at VCC or GND"