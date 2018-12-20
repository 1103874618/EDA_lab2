-- LIBRARY ieee;
-- USE ieee.STD_LOGIC_1164.all;

-- ENTITY f_adder IS
-- PORT(
--   f_a,f_b:IN STD_LOGIC;
--   f_ci:IN STD_LOGIC;
--   f_co:OUT STD_LOGIC;
--   f_s:OUT STD_LOGIC

-- );
-- END f_adder;

-- ARCHITECTURE arch_f OF f_adder IS
-- SIGNAL f_s_out :STD_LOGIC;
-- BEGIN
-- f_s_out <= (f_a XOR f_b) XOR f_ci;
-- f_co<= ((f_a AND f_b AND f_ci) AND '1') OR
--        ((NOT f_a AND NOT f_b AND NOT f_ci) AND '0') OR
--        ((NOT (f_a AND f_b AND f_ci) AND NOT(NOT f_a AND NOT f_b AND NOT f_ci)) AND (NOT f_s_out));
-- f_s<=f_s_out;

-- END arch_f;
-- PACKAGE my_data IS
-- TYPE face_value IS ("00000001","00000101","00010000","00100000");--面值分别为01,05,10,20
-- END my_data;

 LIBRARY ieee;
 USE ieee.STD_LOGIC_1164.all;

ENTITY half_sub IS--半减器
PORT(
  a,b :IN STD_LOGIC;--a减b
  diff:OUT STD_LOGIC;--差输出
  bo_out:OUT STD_LOGIC--借位输出
);
END half_sub;

ARCHITECTURE arch OF half_sub IS

BEGIN
bo_out<=(not a )AND b;
diff<=a XOR b;
END arch;