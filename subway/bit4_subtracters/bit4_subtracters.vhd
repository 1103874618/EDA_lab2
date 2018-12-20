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

 ENTITY bit5_subtracters IS--五位减法器
PORT(
  a,b:IN STD_LOGIC_VECTOR(4 DOWNTO 0);
  bo_in:IN STD_LOGIC;
  bo_out:OUT STD_LOGIC;
  diff:OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
);
 END bit5_subtracters;

 ARCHITECTURE arch1 OF bit5_subtracters IS
  COMPONENT full_sub IS
  PORT(
    a,b:IN STD_LOGIC;
    bo_in:IN STD_LOGIC;--借位输入
    bo_out:OUT STD_LOGIC;--借位输出
    diff:OUT STD_LOGIC
  );
  END COMPONENT;

  SIGNAL bo_out_s1,bo_out_s2,bo_out_s3,bo_out_s4:STD_LOGIC;
 BEGIN
u1:full_sub PORT MAP (a=>a(0),b=>b(0),bo_in=>'0',bo_out=>bo_out_s1,diff=>diff(0));
u2:full_sub PORT MAP (a=>a(1),b=>b(1),bo_in=>bo_out_s1,bo_out=>bo_out_s2,diff=>diff(1));
u3:full_sub PORT MAP (a=>a(2),b=>b(2),bo_in=>bo_out_s2,bo_out=>bo_out_s3,diff=>diff(2));
u4:full_sub PORT MAP (a=>a(3),b=>b(3),bo_in=>bo_out_s3,bo_out=>bo_out_s4,diff=>diff(3));
u5:full_sub PORT MAP (a=>a(4),b=>b(4),bo_in=>bo_out_s4,bo_out=>bo_out,diff=>diff(4));
 END arch1;