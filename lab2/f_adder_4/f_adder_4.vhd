

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
--        (NOT(f_a AND f_b AND f_ci) AND (NOT f_s_out));
-- f_s<=f_s_out;

-- END arch_f;

LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;

ENTITY f_adder_4 IS
PORT(
f_4_a: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
f_4_b:IN STD_LOGIC_VECTOR(3 DOWNTO 0);
f_4_co:OUT STD_LOGIC;
f_4_ci:IN STD_LOGIC;
f_4_s:OUT STD_LOGIC_VECTOR(3 DOWNTO 0)

);
END f_adder_4;

ARCHITECTURE arch_f_4 OF f_adder_4 IS
COMPONENT f_adder IS
PORT(
  f_a:IN STD_LOGIC;
  f_b:IN STD_LOGIC;
  f_ci:IN STD_LOGIC;
  f_co:OUT STD_LOGIC;
  f_s:OUT STD_LOGIC
);
END COMPONENT;

SIGNAL ci1,ci2,ci3:STD_LOGIC;
BEGIN

u0:f_adder PORT MAP (f_a=>f_4_a(0),f_b=> f_4_b(0),f_co=>ci1,f_ci=>f_4_ci,f_s=>f_4_s(0));
u1:f_adder PORT MAP (f_a=>f_4_a(1),f_b=>f_4_b(1),f_co=>ci2,f_ci=>ci1,f_s=>f_4_s(1));
u2:f_adder PORT MAP (f_a=>f_4_a(2),f_b=>f_4_b(2),f_co=>ci3,f_ci=>ci2,f_s=>f_4_s(2));
u3:f_adder PORT MAP (f_a=>f_4_a(3),f_b=>f_4_b(3),f_co=>f_4_co,f_ci=>ci3,f_s=>f_4_s(3));

END arch_f_4;










