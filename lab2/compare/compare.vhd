

LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;

ENTITY comp IS
PORT(
  c_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  z: OUT STD_LOGIC
);
END comp;

ARCHITECTURE arch_com OF comp IS
BEGIN
  -- z<=NOT(((c_in(3) XOR '1') OR (c_in(2) XOR '0') OR (c_in(1) XOR '1') OR (c_in(0) XOR '0')) AND
  --       ((c_in(3) XOR '1') OR (c_in(2) XOR '0') OR (c_in(1) XOR '1') OR (c_in(0) XOR '1')) AND
  --       ((c_in(3) XOR '1') OR (c_in(2) XOR '1') OR (c_in(1) XOR '0') OR (c_in(0) XOR '0')) AND
  --       ((c_in(3) XOR '1') OR (c_in(2) XOR '1') OR (c_in(1) XOR '0') OR (c_in(0) XOR '1')) AND
  --       ((c_in(3) XOR '1') OR (c_in(2) XOR '1') OR (c_in(1) XOR '1') OR (c_in(0) XOR '0')) AND
  --       ((c_in(3) XOR '1') OR (c_in(2) XOR '0') OR (c_in(1) XOR '1') OR (c_in(0) XOR '1')) 
  --       );

z<= (c_in(3) AND c_in(2)) OR (c_in(3) AND (NOT c_in(2))AND c_in(1));--判断十位是否为1

END arch_com;


