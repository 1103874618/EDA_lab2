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

ENTITY compare IS
PORT(
  c_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  z: OUT STD_LOGIC
);
END compare;

ARCHITECTURE arch_com OF compare IS
BEGIN
  z<=NOT(((c_in(3) XOR '1') OR (c_in(2) XOR '0') OR (c_in(1) XOR '1') OR (c_in(0) XOR '0')) AND
        ((c_in(3) XOR '1') OR (c_in(2) XOR '0') OR (c_in(1) XOR '1') OR (c_in(0) XOR '1')) AND
        ((c_in(3) XOR '1') OR (c_in(2) XOR '1') OR (c_in(1) XOR '0') OR (c_in(0) XOR '0')) AND
        ((c_in(3) XOR '1') OR (c_in(2) XOR '1') OR (c_in(1) XOR '0') OR (c_in(0) XOR '1')) AND
        ((c_in(3) XOR '1') OR (c_in(2) XOR '1') OR (c_in(1) XOR '1') OR (c_in(0) XOR '1')) );

END arch_com;


