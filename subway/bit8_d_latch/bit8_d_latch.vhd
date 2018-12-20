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
LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;
ENTITY bit8_d_latch IS
PORT(
  d8_in:IN STD_LOGIC_VECTOR(7 DOWNTO 0);
  clk:IN STD_LOGIC;
  d8_out:IN STD_LOGIC_VECTOR(7 DOWNTO 0)
);
END;

ARCHITECTURE arch OF bit8_d_latch IS

COMPONENT d_latch_pro IS
PORT(
  d,clk: IN STD_LOGIC;
  q:OUT STD_LOGIC
);
END COMPONENT;

BEGIN

u1:d_latch_pro PORT MAP(d=>d8_in(0),clk=>clk,q=>d8_out(0));
u2:d_latch_pro PORT MAP(d=>d8_in(1),clk=>clk,q=>d8_out(1));
u3:d_latch_pro PORT MAP(d=>d8_in(2),clk=>clk,q=>d8_out(2));
u4:d_latch_pro PORT MAP(d=>d8_in(3),clk=>clk,q=>d8_out(3));
u5:d_latch_pro PORT MAP(d=>d8_in(4),clk=>clk,q=>d8_out(4));
u6:d_latch_pro PORT MAP(d=>d8_in(5),clk=>clk,q=>d8_out(5));
u7:d_latch_pro PORT MAP(d=>d8_in(6),clk=>clk,q=>d8_out(6));
u8:d_latch_pro PORT MAP(d=>d8_in(7),clk=>clk,q=>d8_out(7));

END