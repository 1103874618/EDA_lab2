
LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;

ENTITY Display_single IS
PORT(
  D_in:IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  D_hex:OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
);
END Display_single;

ARCHITECTURE D_arch OF Display_single IS
SIGNAL hex_out0: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL hex_out1: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL hex_out2: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL hex_out3: STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN
hex_out0<=(D_in XOR "0000") AND 
           (D_in XOR "0010") AND
           (D_in XOR "0011") AND
           (D_in XOR "0101") AND
           (D_in XOR "0110") AND
           (D_in XOR "0111") AND
           (D_in XOR "1000") AND
           (D_in XOR "1001") ;
D_hex(0)<=(hex_out0(0) XOR '0') OR 
          (hex_out0(1) XOR '0') OR 
          (hex_out0(2) XOR '0') OR
          (hex_out0(3) XOR '0');--管0点亮的所有情况


hex_out1<= (D_in XOR "0000") AND 
           (D_in XOR "0011") AND
           (D_in XOR "0010") AND
           (D_in XOR "0100") AND
           (D_in XOR "0111") AND
           (D_in XOR "1000") AND
           (D_in XOR "1001") ;
D_hex(1)<=(hex_out1(0) XOR '0') OR 
          (hex_out1(1) XOR '0') OR 
          (hex_out1(2) XOR '0') OR
          (hex_out1(3) XOR '0');--管1点亮的所有情况

hex_out2<=(D_in XOR "0000") AND 
           (D_in XOR "0010") AND
           (D_in XOR "0011") AND
           (D_in XOR "0101") AND
           (D_in XOR "0110") AND
           (D_in XOR "0111") AND
           (D_in XOR "1000") AND
           (D_in XOR "1001") ;
D_hex(2)<=(hex_out0(0) XOR '0') OR 
          (hex_out0(1) XOR '0') OR 
          (hex_out0(2) XOR '0') OR
          (hex_out0(3) XOR '0');--管0点亮的所有情况

-- nine:FOR I IN 0 TO 3 GENERATE
-- D_hex(I) <= (D_in(3) XOR '0');
-- END GENERATE;
-- D_hex(4)<='1';
-- D_hex(5) <= (D_in(3) XOR '0');
-- D_hex(6) <= (D_in(3) XOR '0');--9


-- eight:FOR I IN 0 TO 3 GENERATE
-- D_hex(I) <= (D_in(3) OR 
--             (D_in(0) XOR '1') OR 
--             (D_in(1) XOR '1') OR
--             (D_in(2) XOR '1'));--8
-- END GENERATE;


END D_arch;

