-- LIBRARY ieee;
-- USE ieee.STD_LOGIC_1164.all;

-- ENTITY seven_seg_comp IS 
-- PORT(
--        C:IN STD_LOGIC_VECTOR(2 DOWNTO 0 );
--        Dispaly: OUT STD_LOGIC_VECTOR(0 TO 6)); --0为灯亮
-- END seven_seg_comp;

-- ARCHITECTURE Behavior OF seven_seg_comp IS
-- BEGIN

-- Dispaly<="1001000" WHEN C="000" ELSE --H
--          "0110000" WHEN C="001" ELSE --E
--          "1110001" WHEN C="010" OR C="011" ELSE --L
--          "0000001" WHEN C="100" ELSE --O
--          "1111111";

-- END Behavior;


LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;

ENTITY decimal_4bit_full_adder IS
PORT(
  f_4_a: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  f_4_b:IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  f_4_co:OUT STD_LOGIC;
  f_4_ci:IN STD_LOGIC;
  f_4_s:OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
);
END decimal_4bit_full_adder;

ARCHITECTURE arch OF decimal_4bit_full_adder IS
COMPONENT f_adder IS
PORT(
  f_a:IN STD_LOGIC;
  f_b:IN STD_LOGIC;
  f_ci:IN STD_LOGIC;
  f_co:OUT STD_LOGIC;
  f_s:OUT STD_LOGIC
);
END COMPONENT;

COMPONENT f_adder_4 IS
PORT(
  f_4_a: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  f_4_b:IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  f_4_co:OUT STD_LOGIC;
  f_4_ci:IN STD_LOGIC;
  f_4_s:OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
);
END COMPONENT;
SIGNAL ci1,ci2,ci3: STD_LOGIC;
SIGNAL f_s_signal,f_s_final:STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL f_co_signal:STD_LOGIC;

BEGIN

u0:f_adder PORT MAP (f_a=>f_4_a(0),f_b=> f_4_b(0),f_co=>ci1,f_ci=>f_4_ci,f_s=>f_s_signal(0));
u1:f_adder PORT MAP (f_a=>f_4_a(1),f_b=>f_4_b(1),f_co=>ci2,f_ci=>ci1,f_s=>f_s_signal(1));
u2:f_adder PORT MAP (f_a=>f_4_a(2),f_b=>f_4_b(2),f_co=>ci3,f_ci=>ci2,f_s=>f_s_signal(2));
u3:f_adder PORT MAP (f_a=>f_4_a(3),f_b=>f_4_b(3),f_ci=>ci3,f_s=>f_s_signal(3));

u5:f_adder_4 PORT MAP (f_4_a=>"0110",f_4_b=>f_s_signal,f_4_s=>f_s_final,f_4_ci=>'0');

f_co_signal<= (f_s_signal(3) AND f_s_signal(2)) OR (f_s_signal(3) AND (NOT f_s_signal(2))AND f_s_signal(1));--大于九进位

f_4_s<=(f_s_final AND f_co_signal&f_co_signal&f_co_signal&f_co_signal) OR
       (f_s_signal AND ( NOT f_co_signal & NOT f_co_signal & NOT f_co_signal & NOT f_co_signal));

f_4_co<=f_co_signal;

END arch;