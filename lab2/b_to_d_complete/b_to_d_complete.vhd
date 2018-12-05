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

ENTITY b_to_d_complete IS
PORT(
  SW:IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  HEX0:OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
  HEX1:OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
);
END b_to_d_complete;

ARCHITECTURE arch_b_c OF b_to_d_complete IS

COMPONENT Display_single IS
PORT(
  D_in:IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  D_hex:OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
);
END COMPONENT;

COMPONENT binary_to_decimal IS
PORT(
  b_in:IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  b_m: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
  b_z: OUT STD_LOGIC
);
END COMPONENT;

SIGNAL b_m_out:STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL b_z_out:STD_LOGIC;
SIGNAL tens : STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
tens<="000"&b_z_out;

b_to_d: binary_to_decimal PORT MAP(b_in=>SW,b_z=>b_z_out,b_m=>b_m_out);
tens_digits_b: Display_single PORT MAP (D_in=>tens,D_hex=>HEX1);
unit_b: Display_single PORT MAP(D_in=>b_m_out,D_hex=>HEX0);


END arch_b_c;