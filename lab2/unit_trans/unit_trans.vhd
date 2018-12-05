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

ENTITY unit_trans IS 
PORT(
  u_in: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  m: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
);
END unit_trans ;

ARCHITECTURE arch_u OF unit_trans IS
SIGNAL temp : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL a,b,c,d :STD_LOGIC ;

BEGIN
a<=u_in(3);
b<=u_in(2);
c<=u_in(1);
d<=u_in(0);

m(0)<=d;

m(1)<= (((a AND b) OR (a AND NOT b AND c)) AND (a XOR c)) OR --这里记得,or两边的项都要加上括号,否则会报错,系统似乎分不清and和or的优先级....
       (NOT((a AND b) OR (a AND NOT b AND c)) AND c);

m(2)<= (((a AND b AND NOT c) OR (a AND NOT b AND b)) AND '0')  OR
       ((a AND b AND c) AND '1') OR
       (NOT((a AND b) OR (a AND NOT b AND c)) AND b);

m(3)<= '0';

END arch_u;
