-- 4-input Priority Encoder: Structural VHDL Description
-- (See Figure 4-12 in Mano & Kime 3rd ed. for logic diagram)
library ieee, altera;
use ieee.std_logic_1164.all, altera.maxplus2.all;

entity priority_encoder_4_input is
   port(D3, D2, D1, D0: in std_logic;
        V, A1, A0: out std_logic);
end priority_encoder_4_input;

architecture a of priority_encoder_4_input is

component a_7404  --inverter, instead of generic "NOT1" gate
	port (	a_2: in STD_LOGIC;
		a_1: out STD_LOGIC);
end component;

component a_7408  --2-input AND gate, instead of generic "AND2"
	port (	a_2: in STD_LOGIC;
		a_3: in STD_LOGIC;
		a_1: out STD_LOGIC);
end component;

component a_7432  --2-input OR gate, instead of generic "OR2"
	port (	a_2: in STD_LOGIC;
		a_3: in STD_LOGIC;
		a_1: out STD_LOGIC);
end component;

component dordt_OR4 --4-input OR gate, instead of generic "OR4"
    port ( a3, a2, a1, a0: in  STD_LOGIC;
           z0            : out STD_LOGIC);
end component;

signal w1: std_logic;
signal w2: std_logic;

begin
   u1: a_7404 port map (D2, w1);
   u2: a_7408 port map (w1, D1, w2);
   u3: a_7432 port map (D3, w2, A0);
   u4: a_7432 port map (D3, D2, A1);
   g4: dordt_OR4 port map (D3, D2, D1, D0, V);
end a;

--********************************************************
--
--  dordt_OR4
--
--  Since the TTL logic family does not have a 4-input OR
--  gate, the "dordt_OR4" entity builds a 4-input OR gate
--  from three 2-input or gates.  
--
library ieee, altera;
use ieee.std_logic_1164.all, altera.maxplus2.all;

entity dordt_OR4 is
   port (a0, a1, a2, a3: in  STD_LOGIC;
         z0            : out STD_LOGIC);
end dordt_OR4;

architecture a of dordt_OR4 is

component a_7432  --2-input OR gate, replaces generic "OR2"
	port (	a_2: in STD_LOGIC;
		a_3: in STD_LOGIC;
		a_1: out STD_LOGIC);
end component;

signal w1: std_logic;
signal w2: std_logic;

begin
   u1: a_7432 port map (a0, a1, w1);
   u2: a_7432 port map (a2, a3, w2);
   u3: a_7432 port map (w1, w2, z0);
end a;



