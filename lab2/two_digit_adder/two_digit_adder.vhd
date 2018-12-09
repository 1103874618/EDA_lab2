
LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;

ENTITY two_digit_adder IS
PORT(
  t_d_ci:IN STD_LOGIC;
  unit_in_1:IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  unit_in_2:IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  ten_in_1:IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  ten_in_2:IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  t_d_out_1:OUT STD_LOGIC_VECTOR(3 DOWNTO 0);--个位输出
  t_d_out_2:OUT STD_LOGIC_VECTOR(3 DOWNTO 0);--十位输出
  t_d_out_3:OUT STD_LOGIC;--百位输出
  t_d_co: OUT STD_LOGIC
);
END two_digit_adder;

ARCHITECTURE arch_t_d OF two_digit_adder IS
COMPONENT decimal_4bit_full_adder IS
PORT(
  f_4_a: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  f_4_b:IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  f_4_co:OUT STD_LOGIC;
  f_4_ci:IN STD_LOGIC;
  f_4_s:OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
);
END COMPONENT;
SIGNAL unit_co:STD_LOGIC;
SIGNAL hunder: STD_LOGIC;
BEGIN
u1: decimal_4bit_full_adder PORT MAP(f_4_a=>unit_in_1,f_4_b=>unit_in_2,f_4_ci=>t_d_ci,f_4_co=>unit_co,f_4_s=>t_d_out_1);--个位相加
u2: decimal_4bit_full_adder PORT MAP (f_4_a=>ten_in_1,f_4_b=>ten_in_2,f_4_ci=>unit_co,f_4_co=>hunder,f_4_s=>t_d_out_2);--十位相加

t_d_out_3<=hunder;
END arch_t_d;









