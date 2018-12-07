
LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;

ENTITY bit5_unit_trans IS
PORT(
  b5_in:IN STD_LOGIC_VECTOR(4 DOWNTO 0);
  b5_out:OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
);
END bit5_unit_trans;

ARCHITECTURE arch_b5 OF bit5_unit_trans IS
COMPONENT unit_trans IS
PORT(
   u_in: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
   m: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
);
END COMPONENT;

COMPONENT f_adder_4 IS
PORT(
  f_4_a: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
f_4_b:IN STD_LOGIC_VECTOR(3 DOWNTO 0);
f_4_co:OUT STD_LOGIC;
f_4_ci:IN STD_LOGIC;
f_4_s:OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
);
END COMPONENT;

SIGNAL u_m_out:STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL u_m_plus:STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
u1:unit_trans PORT MAP (u_in=>b5_in(3 DOWNTO 0),m=>u_m_out);
m_plus:f_adder_4 PORT MAP (f_4_a=>u_m_out,f_4_b=>"0110",f_4_s=>u_m_plus,f_4_ci=>'0');

b5_out<=(u_m_plus AND (b5_in(4)&b5_in(4)&b5_in(4)&b5_in(4))) OR
        (u_m_out AND (NOT b5_in(4)&NOT b5_in(4)&NOT b5_in(4)&NOT b5_in(4)));


END arch_b5;













