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
--USE work.my_data.all;



ENTITY sub_check IS
PORT(
  -- money_in:IN STD_LOGIC_VECTOR(1 DOWNTO 0);--为1时就表示有一张纸币投入,值为01和10交替出现,分别表示数据流向哪个4位d触发器,无纸币进入时为00
  money:IN STD_LOGIC_VECTOR(7 DOWNTO 0);--进入纸币的总值
  confirm:IN STD_LOGIC;--用户输入确定信号以后开始找零
  price:IN STD_LOGIC_VECTOR(15 DOWNTO 0);--票价
  reset:IN STD_LOGIC;
  check1: OUT STD_LOGIC;
  check5: OUT STD_LOGIC;
  check10:OUT STD_LOGIC
);
END sub_check;

ARCHITECTURE arch OF sub_check IS

COMPONENT d_latch_pro IS
PORT(
  d,clk: IN STD_LOGIC;
  q:OUT STD_LOGIC
);
END COMPONENT;

COMPONENT bit8_d_latch IS
PORT(
  d8_in:IN STD_LOGIC_VECTOR(7 DOWNTO 0);
  clk:IN STD_LOGIC;
  d8_out:IN STD_LOGIC_VECTOR(7 DOWNTO 0)
);
END COMPONENT;

COMPONENT two_digit_adder IS
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
END COMPONENT;

SIGNAL sum_money :STD_LOGIC_VECTOR(7 DOWNTO 0);--用户投入钱的总和,前四位表示十位,后四位表示个位
SIGNAL money1:STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL money2:STD_LOGIC_VECTOR(7 DOWNTO 0);

BEGIN
-- money1<="00000000";
-- money2<="00000000";

d1:bit8_d_latch PORT MAP (d8_in=>money,clk=>confirm,d8_out=>sum_money);

-- get_money:PROCESS(money_in)
-- VARIABLE choose:INTEGER :=0;
-- BEGIN
-- IF(money_in = '1' AND money_in'EVENT)


-- choose := choose+1;
-- END IF;
-- END PROCESS;

END











