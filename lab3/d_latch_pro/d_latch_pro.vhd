

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




-- ENTITY rs_latch IS
-- PORT(
--   clk,r,s:IN STD_LOGIC;
--   q:OUT STD_LOGIC
-- );
-- END rs_latch;

-- ARCHITECTURE arch OF rs_latch IS
-- SIGNAL R_g, S_g, Qa, Qb : STD_LOGIC ;
-- ATTRIBUTE keep :boolean;
-- ATTRIBUTE keep OF R_g,S_g,Qa,Qb:SIGNAL IS true; 

-- BEGIN
-- R_g<=r AND clk;
-- S_g<=s AND clk;
-- Qa<=NOT(R_g OR Qb);
-- Qb<=NOT(S_g OR Qa);
-- q<=Qa;
-- END arch;

LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;

ENTITY d_latch_pro IS
PORT(
  d,clk: IN STD_LOGIC;
  q:OUT STD_LOGIC
);
END d_latch_pro;

ARCHITECTURE Behavior OF d_latch_pro IS

BEGIN

PROCESS ( D, Clk )
BEGIN
IF Clk = '1' THEN
q<= D ;
END IF ;
END PROCESS ;

END Behavior ;






