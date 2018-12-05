

LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;

ENTITY binary_to_decimal IS 
PORT(
  b_in:IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  b_m: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
  b_z: OUT STD_LOGIC
);
END binary_to_decimal;

ARCHITECTURE arch_b OF binary_to_decimal IS

COMPONENT comp IS
PORT(
  c_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  z: OUT STD_LOGIC
);
END COMPONENT;

COMPONENT unit_trans IS
PORT(
  u_in: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  m: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
);
END COMPONENT;

BEGIN
unit: unit_trans PORT MAP (u_in=>b_in,m=>b_m);
tens_digit: comp PORT MAP (c_in=>b_in,z=>b_z);

END arch_b;