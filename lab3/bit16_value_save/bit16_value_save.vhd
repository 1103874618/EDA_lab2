

-- ENTITY d_latch_positive IS
-- PORT(
--   d,clk: IN STD_LOGIC;
--   q:OUT STD_LOGIC
-- );
-- END d_latch_positive;

-- ARCHITECTURE Behavior OF d_latch_positive IS

-- BEGIN

-- PROCESS ( D, Clk )
-- BEGIN
-- IF (Clk = '1' AND clk'EVENT )THEN
-- q<= D ;
-- END IF ;
-- END PROCESS ;

-- END Behavior ;


LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;

ENTITY bit16_value_save IS
PORT(
  key0,key1:STD_LOGIC;--key0为复位
  sw_in:IN STD_LOGIC_VECTOR(15 DOWNTO 0);
  hexout0,hexout1,hexout2,hexout3,
  hexout4,hexout5,hexout6,hexout7:OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
);
END bit16_value_save;

ARCHITECTURE arch OF bit16_value_save IS
COMPONENT d_latch_pro IS
PORT(
  d,clk: IN STD_LOGIC;
  q:OUT STD_LOGIC
);
END COMPONENT;

COMPONENT Display_single IS
PORT(
  D_in:IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  D_hex:OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
);
END COMPONENT;

SIGNAL zero:STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL display_in_a:STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL display_in_a_deal:STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL display_in_b:STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL display_in_b_deal:STD_LOGIC_VECTOR(15 DOWNTO 0);
BEGIN
--储存A的触发器
ua0:d_latch_pro PORT MAP (d=>sw_in(0),q=>display_in_a(0),clk=>key1);
ua1:d_latch_pro PORT MAP (d=>sw_in(1),q=>display_in_a(1),clk=>key1);
ua2:d_latch_pro PORT MAP (d=>sw_in(2),q=>display_in_a(2),clk=>key1);
ua3:d_latch_pro PORT MAP (d=>sw_in(3),q=>display_in_a(3),clk=>key1);

ua4:d_latch_pro PORT MAP (d=>sw_in(4),q=>display_in_a(4),clk=>key1);
ua5:d_latch_pro PORT MAP (d=>sw_in(5),q=>display_in_a(5),clk=>key1);
ua6:d_latch_pro PORT MAP (d=>sw_in(6),q=>display_in_a(6),clk=>key1);
ua7:d_latch_pro PORT MAP (d=>sw_in(7),q=>display_in_a(7),clk=>key1);

ua8:d_latch_pro PORT MAP (d=>sw_in(8),q=>display_in_a(8),clk=>key1);
ua9:d_latch_pro PORT MAP (d=>sw_in(9),q=>display_in_a(9),clk=>key1);
ua10:d_latch_pro PORT MAP (d=>sw_in(10),q=>display_in_a(10),clk=>key1);
ua11:d_latch_pro PORT MAP (d=>sw_in(11),q=>display_in_a(11),clk=>key1);

ua12:d_latch_pro PORT MAP (d=>sw_in(12),q=>display_in_a(12),clk=>key1);
ua13:d_latch_pro PORT MAP (d=>sw_in(13),q=>display_in_a(13),clk=>key1);
ua14:d_latch_pro PORT MAP (d=>sw_in(14),q=>display_in_a(14),clk=>key1);
ua15:d_latch_pro PORT MAP (d=>sw_in(15),q=>display_in_a(15),clk=>key1);

--储存b的触发器
ub0:d_latch_pro PORT MAP (d=>sw_in(0),q=>display_in_b(0),clk=>NOT key1);
ub1:d_latch_pro PORT MAP (d=>sw_in(1),q=>display_in_b(1),clk=>NOT key1);
ub2:d_latch_pro PORT MAP (d=>sw_in(2),q=>display_in_b(2),clk=>NOT key1);
ub3:d_latch_pro PORT MAP (d=>sw_in(3),q=>display_in_b(3),clk=>NOT key1);

ub4:d_latch_pro PORT MAP (d=>sw_in(4),q=>display_in_b(4),clk=>NOT key1);
ub5:d_latch_pro PORT MAP (d=>sw_in(5),q=>display_in_b(5),clk=>NOT key1);
ub6:d_latch_pro PORT MAP (d=>sw_in(6),q=>display_in_b(6),clk=>NOT key1);
ub7:d_latch_pro PORT MAP (d=>sw_in(7),q=>display_in_b(7),clk=>NOT key1);

ub8:d_latch_pro PORT MAP (d=>sw_in(8),q=>display_in_b(8),clk=>NOT key1);
ub9:d_latch_pro PORT MAP (d=>sw_in(9),q=>display_in_b(9),clk=>NOT key1);
ub10:d_latch_pro PORT MAP (d=>sw_in(10),q=>display_in_b(10),clk=>NOT key1);
ub11:d_latch_pro PORT MAP (d=>sw_in(11),q=>display_in_b(11),clk=>NOT key1);

ub12:d_latch_pro PORT MAP (d=>sw_in(12),q=>display_in_b(12),clk=>NOT key1);
ub13:d_latch_pro PORT MAP (d=>sw_in(13),q=>display_in_b(13),clk=>NOT key1);
ub14:d_latch_pro PORT MAP (d=>sw_in(14),q=>display_in_b(14),clk=>NOT key1);
ub15:d_latch_pro PORT MAP (d=>sw_in(15),q=>display_in_b(15),clk=>NOT key1);

display_in_a_deal <= display_in_a AND key0&key0&key0&key0&--key0低电平有效
                                  key0&key0&key0&key0&
                                  key0&key0&key0&key0&
                                  key0&key0&key0&key0;

display_in_b_deal <= display_in_b AND  key0&key0&key0&key0&
                                       key0&key0&key0&key0&
                                       key0&key0&key0&key0&
                                       key0&key0&key0&key0;

--当key1为1时数据进入储存a的触发器,为0时进入储存b的触发器

--显示a
d1:Display_single PORT MAP(D_in=>display_in_a_deal(3 DOWNTO 0),D_hex=>hexout0);
d2:Display_single PORT MAP(D_in=>display_in_a_deal(7 DOWNTO 4),D_hex=>hexout1);
d3:Display_single PORT MAP(D_in=>display_in_a_deal(11 DOWNTO 8),D_hex=>hexout2);
d4:Display_single PORT MAP(D_in=>display_in_a_deal(15 DOWNTO 12),D_hex=>hexout3);

--显示b
d5:Display_single PORT MAP(D_in=>display_in_b_deal(3 DOWNTO 0),D_hex=>hexout4);
d6:Display_single PORT MAP(D_in=>display_in_b_deal(7 DOWNTO 4),D_hex=>hexout5);
d7:Display_single PORT MAP(D_in=>display_in_b_deal(11 DOWNTO 8),D_hex=>hexout6);
d8:Display_single PORT MAP(D_in=>display_in_b_deal(15 DOWNTO 12),D_hex=>hexout7);



END arch;