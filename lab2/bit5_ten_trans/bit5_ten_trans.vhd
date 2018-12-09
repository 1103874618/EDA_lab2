
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

ENTITY bit5_ten_trans IS 
PORT(
  b5_ten_in: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
  b5_ten_out: OUT STD_LOGIC
);

END bit5_ten_trans;

ARCHITECTURE arch_b_ten OF bit5_ten_trans IS
COMPONENT comp  IS
PORT(
 c_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  z: OUT STD_LOGIC
);
END COMPONENT;

SIGNAL out_s:STD_LOGIC;
BEGIN
u1:comp PORT MAP(c_in=>b5_ten_in(3 DOWNTO 0),z=>out_s);

b5_ten_out<=(out_s AND NOT b5_ten_in(4)) OR
            (b5_ten_in(4) AND '1');
END arch_b_ten;
































