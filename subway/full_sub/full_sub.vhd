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

ENTITY full_sub IS
PORT(
  a,b:IN STD_LOGIC;
  bo_in:IN STD_LOGIC;--借位输入
  bo_out:OUT STD_LOGIC;--借位输出
  diff:OUT STD_LOGIC
);
END full_sub;

ARCHITECTURE arc OF full_sub IS
COMPONENT half_sub IS
PORT(
  a,b :IN STD_LOGIC;--a减b
  diff:OUT STD_LOGIC;--差输出
  bo_out:OUT STD_LOGIC--借位输出
);
END COMPONENT;

SIGNAL t0,t1,t2:STD_LOGIC;
BEGIN
u1:half_sub PORT MAP(a=>a,b=>b,diff=>t0,bo_out=>t1);
u2:half_sub PORT MAP(a=>t0,b=>bo_in,diff=>diff,bo_out=>t2);--两数相减,再与借位相减
bo_out<=t1 OR t2;
END arc;








