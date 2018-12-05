

LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;

ENTITY Display_single IS
PORT(
  D_in:IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  D_hex:OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
);
END Display_single;

ARCHITECTURE D_arch OF Display_single IS
SIGNAL a,b,c,d : STD_LOGIC;

BEGIN
a<=D_in(3);
b<=D_in(2);
c<=D_in(1);
d<=D_in(0);
D_hex(0)<= NOT((NOT a AND c) OR 
           (NOT(a OR c OR d)) OR
           ((NOT a) AND b AND (NOT c) AND d) OR
           (a AND (NOT b) AND (NOT c) AND d));--ok

D_hex(1)<= NOT((NOT(a OR c OR d))OR
           (NOT a AND NOT b AND c) OR
           (a AND NOT b AND NOT c));

D_hex(2)<=NOT((NOT(a OR b OR c OR d)) OR
          (NOT a AND b) OR
          (a AND NOT b AND NOT c) OR
          (NOT a AND NOT b AND c AND d));

D_hex(3)<=NOT((NOT(b OR c OR d )) OR 
          (NOT a AND NOT b AND c) OR
          (NOT a AND b AND NOT c AND d) OR
          (NOT a AND b AND c AND NOT d) OR
          (a AND NOT b AND NOT c AND d));

D_hex(4)<=NOT((NOT(b OR c OR d)) OR
          (NOT a AND c AND NOT d) OR
          (NOT a AND NOT b AND NOT c AND d));

D_hex(5)<=NOT((NOT a AND NOT c) OR
          (a AND NOT b AND NOT c) OR
          (NOT a AND b AND c AND NOT d));

D_hex(6)<=NOT((NOT a AND b AND NOT c) OR
          (a AND NOT b AND NOT c) OR
          (NOT a AND NOT b AND c) OR
          (NOT a AND b AND c AND NOT d));

END D_arch;
-----------
-- hex_out0<=(D_in XOR "0000") AND 
--            (D_in XOR "0010") AND
--            (D_in XOR "0011") AND
--            (D_in XOR "0101") AND
--            (D_in XOR "0110") AND
--            (D_in XOR "0111") AND
--            (D_in XOR "1000") AND
--            (D_in XOR "1001") ;
-- D_hex(0)<=(hex_out0(0) XOR '0') OR 
--           (hex_out0(1) XOR '0') OR 
--           (hex_out0(2) XOR '0') OR
--           (hex_out0(3) XOR '0');--管0点亮的所有情况


-- hex_out1<= (D_in XOR "0000") AND 
--            (D_in XOR "0011") AND
--            (D_in XOR "0010") AND
--            (D_in XOR "0100") AND
--            (D_in XOR "0111") AND
--            (D_in XOR "1000") AND
--            (D_in XOR "1001") ;
-- D_hex(1)<=(hex_out1(0) XOR '0') OR 
--           (hex_out1(1) XOR '0') OR 
--           (hex_out1(2) XOR '0') OR
--           (hex_out1(3) XOR '0');--管1点亮的所有情况

-- hex_out2<=(D_in XOR "0000") AND 
--            (D_in XOR "0011") AND
--            (D_in XOR "0100") AND
--            (D_in XOR "0101") AND
--            (D_in XOR "0110") AND
--            (D_in XOR "0111") AND
--            (D_in XOR "1000") AND
--            (D_in XOR "1001");
-- D_hex(2)<=(hex_out0(0) XOR '0') OR 
--           (hex_out0(1) XOR '0') OR 
--           (hex_out0(2) XOR '0') OR
--           (hex_out0(3) XOR '0');--管2点亮的所有情况

--  hex_out3<=(D_in XOR "0000") AND 
--             (D_in XOR "0010") AND
--             (D_in XOR "0011") AND
--             (D_in XOR "0101") AND
--             (D_in XOR "0110") AND
--             (D_in XOR "1000") AND
--             (D_in XOR "1001");
--   D_hex(3)<=(hex_out3(0) XOR '0') OR 
--           (hex_out3(1) XOR '0') OR 
--           (hex_out3(2) XOR '0') OR
--           (hex_out3(3) XOR '0');--管3点亮的所有情况

-- hex_out4<= (D_in XOR "0000") AND 
--            (D_in XOR "0001") AND
--            (D_in XOR "0010") AND
--            (D_in XOR "0110") AND
--            (D_in XOR "1000") ;
-- D_hex(4)<=(hex_out4(0) XOR '0') OR 
--           (hex_out4(1) XOR '0') OR 
--           (hex_out4(2) XOR '0') OR
--           (hex_out4(3) XOR '0');--管4点亮的所有情况

-- hex_out5<= (D_in XOR "0000") AND 
--            (D_in XOR "0001") AND
--            (D_in XOR "0100") AND
--            (D_in XOR "0101") AND
--            (D_in XOR "0110") AND
--            (D_in XOR "1000") AND
--            (D_in XOR "1001") ;
-- D_hex(5)<=(hex_out5(0) XOR '0') OR 
--           (hex_out5(1) XOR '0') OR 
--           (hex_out5(2) XOR '0') OR
--           (hex_out5(3) XOR '0');--管5点亮的所有情况

-- hex_out6<= (D_in XOR "0010") AND 
--            (D_in XOR "0011") AND
--            (D_in XOR "0100") AND
--            (D_in XOR "0101") AND
--            (D_in XOR "0110") AND
--            (D_in XOR "1000") AND
--            (D_in XOR "1001");
-- D_hex(6)<=(hex_out6(0) XOR '0') OR 
--           (hex_out6(1) XOR '0') OR 
--           (hex_out6(2) XOR '0') OR
--           (hex_out6(3) XOR '0');--管6点亮的所有情况

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





