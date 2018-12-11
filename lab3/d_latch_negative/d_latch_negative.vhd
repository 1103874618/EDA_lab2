
LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;

ENTITY d_latch_negative IS
PORT(
  d,clk: IN STD_LOGIC;
  q:OUT STD_LOGIC
);
END d_latch_negative;

ARCHITECTURE Behavior OF d_latch_negative IS

BEGIN

PROCESS ( D, Clk )
BEGIN
IF (Clk = '0' AND clk'EVENT )THEN
q<= D ;
END IF ;
END PROCESS ;

END Behavior ;

