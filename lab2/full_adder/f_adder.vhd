

LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;

ENTITY f_adder IS
PORT(
  f_a,f_b:IN STD_LOGIC;
  f_ci:IN STD_LOGIC;
  f_co:OUT STD_LOGIC;
  f_s:OUT STD_LOGIC

);
END f_adder;

ARCHITECTURE arch_f OF f_adder IS
SIGNAL f_s_out :STD_LOGIC;
BEGIN
f_s_out <= (f_a XOR f_b) XOR f_ci;
f_co<= ((f_a AND f_b AND f_ci) AND '1') OR
       (NOT(f_a AND f_b AND f_ci) AND (NOT f_s_out));
f_s<=f_s_out;

END arch_f;















