--------------------------------------------------------------------------------
--                         Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6
-- VHDL generated for VirtexUltrascalePlus @ 950MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Andreas Boettcher
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 1.05263
-- Target frequency (MHz): 950
-- Input signals: X11 X10 X9 X8 X7 X6 X5 X4 X3 X2 X1 X0
-- Output signals: R
--  approx. input signal timings: X11: (c0, 0.000000ns)X10: (c0, 0.000000ns)X9: (c0, 0.000000ns)X8: (c0, 0.000000ns)X7: (c0, 0.000000ns)X6: (c0, 0.000000ns)X5: (c0, 0.000000ns)X4: (c0, 0.000000ns)X3: (c0, 0.000000ns)X2: (c0, 0.000000ns)X1: (c0, 0.000000ns)X0: (c0, 0.000000ns)
--  approx. output signal timings: R: (c0, 0.498000ns)

--------------------------------------------------------------------------------
library UNISIM;
use UNISIM.Vcomponents.all;
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6 is
    port (X11 : in  std_logic_vector(0 downto 0);
          X10 : in  std_logic_vector(2 downto 0);
          X9 : in  std_logic_vector(2 downto 0);
          X8 : in  std_logic_vector(2 downto 0);
          X7 : in  std_logic_vector(2 downto 0);
          X6 : in  std_logic_vector(2 downto 0);
          X5 : in  std_logic_vector(2 downto 0);
          X4 : in  std_logic_vector(2 downto 0);
          X3 : in  std_logic_vector(2 downto 0);
          X2 : in  std_logic_vector(2 downto 0);
          X1 : in  std_logic_vector(2 downto 0);
          X0 : in  std_logic_vector(3 downto 0);
          R : out  std_logic_vector(12 downto 0)   );
end entity;

architecture arch of Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6 is


signal cc_di :  std_logic_vector(11 downto 0);
   -- timing of cc_di: (c0, 0.000000ns)
signal cc_s :  std_logic_vector(11 downto 0);
   -- timing of cc_s: (c0, 0.000000ns)
signal cc_co :  std_logic_vector(11 downto 0);
   -- timing of cc_co: (c0, 0.000000ns)
signal cc_o :  std_logic_vector(11 downto 0);
   -- timing of cc_o: (c0, 0.000000ns)
signal c0 :  std_logic;
   -- timing of c0: (c0, 0.000000ns)
signal c1 :  std_logic;
   -- timing of c1: (c0, 0.000000ns)
signal c2 :  std_logic;
   -- timing of c2: (c0, 0.000000ns)
signal c3 :  std_logic;
   -- timing of c3: (c0, 0.000000ns)
signal c4 :  std_logic;
   -- timing of c4: (c0, 0.000000ns)
signal c5 :  std_logic;
   -- timing of c5: (c0, 0.000000ns)
signal c6 :  std_logic;
   -- timing of c6: (c0, 0.000000ns)
signal c7 :  std_logic;
   -- timing of c7: (c0, 0.000000ns)
signal c8 :  std_logic;
   -- timing of c8: (c0, 0.000000ns)
signal c9 :  std_logic;
   -- timing of c9: (c0, 0.000000ns)
signal c10 :  std_logic;
   -- timing of c10: (c0, 0.000000ns)
signal result :  std_logic_vector(12 downto 0);
   -- timing of result: (c0, 0.498000ns)
begin
   cc_di(0) <= X0(0);
   lut0: LUT6_2
      generic map ( init => x"69966996fcc0fcc0")
      port map ( i0 => X0(0),
                 i1 => X0(1),
                 i2 => X0(2),
                 i3 => X0(3),
                 i4 => '0',
                 i5 => '1',
                 o5 => c0,
                 o6 => cc_s(0));

   cc0: CARRY4
      port map ( ci => '0',
                 cyinit => '0',
                 di => cc_di(3 downto 0),
                 s => cc_s(3 downto 0),
                 co => cc_co(3 downto 0),
                 o => cc_o(3 downto 0));

   cc_di(1) <= c0;
   lut1: LUT6_2
      generic map ( init => x"69966996fcc0fcc0")
      port map ( i0 => c0,
                 i1 => X1(0),
                 i2 => X1(1),
                 i3 => X1(2),
                 i4 => '0',
                 i5 => '1',
                 o5 => c1,
                 o6 => cc_s(1));

   cc_di(2) <= c1;
   lut2: LUT6_2
      generic map ( init => x"69966996fcc0fcc0")
      port map ( i0 => c1,
                 i1 => X2(0),
                 i2 => X2(1),
                 i3 => X2(2),
                 i4 => '0',
                 i5 => '1',
                 o5 => c2,
                 o6 => cc_s(2));

   cc_di(3) <= c2;
   lut3: LUT6_2
      generic map ( init => x"69966996fcc0fcc0")
      port map ( i0 => c2,
                 i1 => X3(0),
                 i2 => X3(1),
                 i3 => X3(2),
                 i4 => '0',
                 i5 => '1',
                 o5 => c3,
                 o6 => cc_s(3));

   cc_di(4) <= c3;
   lut4: LUT6_2
      generic map ( init => x"69966996fcc0fcc0")
      port map ( i0 => c3,
                 i1 => X4(0),
                 i2 => X4(1),
                 i3 => X4(2),
                 i4 => '0',
                 i5 => '1',
                 o5 => c4,
                 o6 => cc_s(4));

   cc1: CARRY4
      port map ( ci => cc_co(3),
                 cyinit => '0',
                 di => cc_di(7 downto 4),
                 s => cc_s(7 downto 4),
                 co => cc_co(7 downto 4),
                 o => cc_o(7 downto 4));

   cc_di(5) <= c4;
   lut5: LUT6_2
      generic map ( init => x"69966996fcc0fcc0")
      port map ( i0 => c4,
                 i1 => X5(0),
                 i2 => X5(1),
                 i3 => X5(2),
                 i4 => '0',
                 i5 => '1',
                 o5 => c5,
                 o6 => cc_s(5));

   cc_di(6) <= c5;
   lut6: LUT6_2
      generic map ( init => x"69966996fcc0fcc0")
      port map ( i0 => c5,
                 i1 => X6(0),
                 i2 => X6(1),
                 i3 => X6(2),
                 i4 => '0',
                 i5 => '1',
                 o5 => c6,
                 o6 => cc_s(6));

   cc_di(7) <= c6;
   lut7: LUT6_2
      generic map ( init => x"69966996fcc0fcc0")
      port map ( i0 => c6,
                 i1 => X7(0),
                 i2 => X7(1),
                 i3 => X7(2),
                 i4 => '0',
                 i5 => '1',
                 o5 => c7,
                 o6 => cc_s(7));

   cc_di(8) <= c7;
   lut8: LUT6_2
      generic map ( init => x"69966996fcc0fcc0")
      port map ( i0 => c7,
                 i1 => X8(0),
                 i2 => X8(1),
                 i3 => X8(2),
                 i4 => '0',
                 i5 => '1',
                 o5 => c8,
                 o6 => cc_s(8));

   cc2: CARRY4
      port map ( ci => cc_co(7),
                 cyinit => '0',
                 di => cc_di(11 downto 8),
                 s => cc_s(11 downto 8),
                 co => cc_co(11 downto 8),
                 o => cc_o(11 downto 8));

   cc_di(9) <= c8;
   lut9: LUT6_2
      generic map ( init => x"69966996fcc0fcc0")
      port map ( i0 => c8,
                 i1 => X9(0),
                 i2 => X9(1),
                 i3 => X9(2),
                 i4 => '0',
                 i5 => '1',
                 o5 => c9,
                 o6 => cc_s(9));

   cc_di(10) <= c9;
   lut10: LUT6_2
      generic map ( init => x"69966996fcc0fcc0")
      port map ( i0 => c9,
                 i1 => X10(0),
                 i2 => X10(1),
                 i3 => X10(2),
                 i4 => '0',
                 i5 => '1',
                 o5 => c10,
                 o6 => cc_s(10));

   cc_di(11) <= c10;
   lut11: LUT6_2
      generic map ( init => x"66666666aaaaaaaa")
      port map ( i0 => c10,
                 i1 => X11(0),
                 i2 => '0',
                 i3 => '0',
                 i4 => '0',
                 i5 => '1',
                 o5 => open,
                 o6 => cc_s(11));

   result <= cc_co(11) & cc_o(11 downto 0);
   R <= result;
end architecture;

--------------------------------------------------------------------------------
--                          IntMultiAdder_S_in5_m4_7_m4_out8_m4
--                     (IntMultiAdder_S11_2_Freq950_uid2)
-- VHDL generated for VirtexUltrascalePlus @ 950MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin (2008-2016)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 1.05263
-- Target frequency (MHz): 950
-- Input signals: X0 X1
-- Output signals: R
--  approx. input signal timings: X0: (c0, 0.000000ns)X1: (c0, 0.000000ns)
--  approx. output signal timings: R: (c0, 0.498000ns)

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntMultiAdder_S_in5_m4_7_m4_out8_m4 is
    port (clk, rst : in std_logic;
          R : out  std_logic_vector(11 downto 0);
          X0 : in  std_logic_vector(10 downto 0);
          X1 : in  std_logic_vector(10 downto 0)   );
end entity;

architecture arch of IntMultiAdder_S_in5_m4_7_m4_out8_m4 is
   component Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6 is
      port ( X11 : in  std_logic_vector(0 downto 0);
             X10 : in  std_logic_vector(2 downto 0);
             X9 : in  std_logic_vector(2 downto 0);
             X8 : in  std_logic_vector(2 downto 0);
             X7 : in  std_logic_vector(2 downto 0);
             X6 : in  std_logic_vector(2 downto 0);
             X5 : in  std_logic_vector(2 downto 0);
             X4 : in  std_logic_vector(2 downto 0);
             X3 : in  std_logic_vector(2 downto 0);
             X2 : in  std_logic_vector(2 downto 0);
             X1 : in  std_logic_vector(2 downto 0);
             X0 : in  std_logic_vector(3 downto 0);
             R : out  std_logic_vector(12 downto 0)   );
   end component;

signal iX0_c0 :  signed(10-0 downto 0);
   -- timing of iX0_c0: (c0, 0.000000ns)
signal bh3_w0_0_c0 :  std_logic;
   -- timing of bh3_w0_0_c0: (c0, 0.000000ns)
signal bh3_w1_0_c0 :  std_logic;
   -- timing of bh3_w1_0_c0: (c0, 0.000000ns)
signal bh3_w2_0_c0 :  std_logic;
   -- timing of bh3_w2_0_c0: (c0, 0.000000ns)
signal bh3_w3_0_c0 :  std_logic;
   -- timing of bh3_w3_0_c0: (c0, 0.000000ns)
signal bh3_w4_0_c0 :  std_logic;
   -- timing of bh3_w4_0_c0: (c0, 0.000000ns)
signal bh3_w5_0_c0 :  std_logic;
   -- timing of bh3_w5_0_c0: (c0, 0.000000ns)
signal bh3_w6_0_c0 :  std_logic;
   -- timing of bh3_w6_0_c0: (c0, 0.000000ns)
signal bh3_w7_0_c0 :  std_logic;
   -- timing of bh3_w7_0_c0: (c0, 0.000000ns)
signal bh3_w8_0_c0 :  std_logic;
   -- timing of bh3_w8_0_c0: (c0, 0.000000ns)
signal bh3_w9_0_c0 :  std_logic;
   -- timing of bh3_w9_0_c0: (c0, 0.000000ns)
signal bh3_w10_0_c0 :  std_logic;
   -- timing of bh3_w10_0_c0: (c0, 0.000000ns)
signal iX1_c0 :  signed(10-0 downto 0);
   -- timing of iX1_c0: (c0, 0.000000ns)
signal bh3_w0_1_c0 :  std_logic;
   -- timing of bh3_w0_1_c0: (c0, 0.000000ns)
signal bh3_w1_1_c0 :  std_logic;
   -- timing of bh3_w1_1_c0: (c0, 0.000000ns)
signal bh3_w2_1_c0 :  std_logic;
   -- timing of bh3_w2_1_c0: (c0, 0.000000ns)
signal bh3_w3_1_c0 :  std_logic;
   -- timing of bh3_w3_1_c0: (c0, 0.000000ns)
signal bh3_w4_1_c0 :  std_logic;
   -- timing of bh3_w4_1_c0: (c0, 0.000000ns)
signal bh3_w5_1_c0 :  std_logic;
   -- timing of bh3_w5_1_c0: (c0, 0.000000ns)
signal bh3_w6_1_c0 :  std_logic;
   -- timing of bh3_w6_1_c0: (c0, 0.000000ns)
signal bh3_w7_1_c0 :  std_logic;
   -- timing of bh3_w7_1_c0: (c0, 0.000000ns)
signal bh3_w8_1_c0 :  std_logic;
   -- timing of bh3_w8_1_c0: (c0, 0.000000ns)
signal bh3_w9_1_c0 :  std_logic;
   -- timing of bh3_w9_1_c0: (c0, 0.000000ns)
signal bh3_w10_1_c0 :  std_logic;
   -- timing of bh3_w10_1_c0: (c0, 0.000000ns)
signal bh3_w11_0_c0 :  std_logic;
   -- timing of bh3_w11_0_c0: (c0, 0.000000ns)
signal Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_In0_c0 :  std_logic_vector(3 downto 0);
   -- timing of Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_In0_c0: (c0, 0.000000ns)
signal Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_In1_c0 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_In1_c0: (c0, 0.000000ns)
signal Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_In2_c0 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_In2_c0: (c0, 0.000000ns)
signal Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_In3_c0 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_In3_c0: (c0, 0.000000ns)
signal Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_In4_c0 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_In4_c0: (c0, 0.000000ns)
signal Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_In5_c0 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_In5_c0: (c0, 0.000000ns)
signal Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_In6_c0 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_In6_c0: (c0, 0.000000ns)
signal Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_In7_c0 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_In7_c0: (c0, 0.000000ns)
signal Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_In8_c0 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_In8_c0: (c0, 0.000000ns)
signal Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_In9_c0 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_In9_c0: (c0, 0.000000ns)
signal Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_In10_c0 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_In10_c0: (c0, 0.000000ns)
signal Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_In11_c0 :  std_logic_vector(0 downto 0);
   -- timing of Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_In11_c0: (c0, 0.000000ns)
signal Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_Out0_c0 :  std_logic_vector(12 downto 0);
   -- timing of Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_Out0_c0: (c0, 0.498000ns)
signal bh3_w0_2_c0 :  std_logic;
   -- timing of bh3_w0_2_c0: (c0, 0.498000ns)
signal bh3_w1_2_c0 :  std_logic;
   -- timing of bh3_w1_2_c0: (c0, 0.498000ns)
signal bh3_w2_2_c0 :  std_logic;
   -- timing of bh3_w2_2_c0: (c0, 0.498000ns)
signal bh3_w3_2_c0 :  std_logic;
   -- timing of bh3_w3_2_c0: (c0, 0.498000ns)
signal bh3_w4_2_c0 :  std_logic;
   -- timing of bh3_w4_2_c0: (c0, 0.498000ns)
signal bh3_w5_2_c0 :  std_logic;
   -- timing of bh3_w5_2_c0: (c0, 0.498000ns)
signal bh3_w6_2_c0 :  std_logic;
   -- timing of bh3_w6_2_c0: (c0, 0.498000ns)
signal bh3_w7_2_c0 :  std_logic;
   -- timing of bh3_w7_2_c0: (c0, 0.498000ns)
signal bh3_w8_2_c0 :  std_logic;
   -- timing of bh3_w8_2_c0: (c0, 0.498000ns)
signal bh3_w9_2_c0 :  std_logic;
   -- timing of bh3_w9_2_c0: (c0, 0.498000ns)
signal bh3_w10_2_c0 :  std_logic;
   -- timing of bh3_w10_2_c0: (c0, 0.498000ns)
signal bh3_w11_1_c0 :  std_logic;
   -- timing of bh3_w11_1_c0: (c0, 0.498000ns)
signal Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_Out0_copy53_c0 :  std_logic_vector(12 downto 0);
   -- timing of Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_Out0_copy53_c0: (c0, 0.000000ns)
signal tmp_bitheapResult_bh3_11_c0 :  std_logic_vector(11 downto 0);
   -- timing of tmp_bitheapResult_bh3_11_c0: (c0, 0.498000ns)
signal bitheapResult_bh3_c0 :  std_logic_vector(11 downto 0);
   -- timing of bitheapResult_bh3_c0: (c0, 0.498000ns)
signal OutRes_c0 :  std_logic_vector(11 downto 0);
   -- timing of OutRes_c0: (c0, 0.498000ns)
begin
   iX0_c0 <= signed(X0);
   bh3_w0_0_c0 <= iX0_c0(0);
   bh3_w1_0_c0 <= iX0_c0(1);
   bh3_w2_0_c0 <= iX0_c0(2);
   bh3_w3_0_c0 <= iX0_c0(3);
   bh3_w4_0_c0 <= iX0_c0(4);
   bh3_w5_0_c0 <= iX0_c0(5);
   bh3_w6_0_c0 <= iX0_c0(6);
   bh3_w7_0_c0 <= iX0_c0(7);
   bh3_w8_0_c0 <= iX0_c0(8);
   bh3_w9_0_c0 <= iX0_c0(9);
   bh3_w10_0_c0 <= not iX0_c0(10);
   iX1_c0 <= signed(X1);
   bh3_w0_1_c0 <= iX1_c0(0);
   bh3_w1_1_c0 <= iX1_c0(1);
   bh3_w2_1_c0 <= iX1_c0(2);
   bh3_w3_1_c0 <= iX1_c0(3);
   bh3_w4_1_c0 <= iX1_c0(4);
   bh3_w5_1_c0 <= iX1_c0(5);
   bh3_w6_1_c0 <= iX1_c0(6);
   bh3_w7_1_c0 <= iX1_c0(7);
   bh3_w8_1_c0 <= iX1_c0(8);
   bh3_w9_1_c0 <= iX1_c0(9);
   bh3_w10_1_c0 <= not iX1_c0(10);

   -- Adding the constant bits 
   bh3_w11_0_c0 <= '1';


   Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_In0_c0 <= "" & bh3_w0_0_c0 & bh3_w0_1_c0 & "0" & "0";
   Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_In1_c0 <= "" & bh3_w1_0_c0 & bh3_w1_1_c0 & "0";
   Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_In2_c0 <= "" & bh3_w2_0_c0 & bh3_w2_1_c0 & "0";
   Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_In3_c0 <= "" & bh3_w3_0_c0 & bh3_w3_1_c0 & "0";
   Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_In4_c0 <= "" & bh3_w4_0_c0 & bh3_w4_1_c0 & "0";
   Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_In5_c0 <= "" & bh3_w5_0_c0 & bh3_w5_1_c0 & "0";
   Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_In6_c0 <= "" & bh3_w6_0_c0 & bh3_w6_1_c0 & "0";
   Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_In7_c0 <= "" & bh3_w7_0_c0 & bh3_w7_1_c0 & "0";
   Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_In8_c0 <= "" & bh3_w8_0_c0 & bh3_w8_1_c0 & "0";
   Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_In9_c0 <= "" & bh3_w9_0_c0 & bh3_w9_1_c0 & "0";
   Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_In10_c0 <= "" & bh3_w10_0_c0 & bh3_w10_1_c0 & "0";
   Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_In11_c0 <= "" & bh3_w11_0_c0;
   bh3_w0_2_c0 <= Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_Out0_c0(0);
   bh3_w1_2_c0 <= Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_Out0_c0(1);
   bh3_w2_2_c0 <= Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_Out0_c0(2);
   bh3_w3_2_c0 <= Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_Out0_c0(3);
   bh3_w4_2_c0 <= Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_Out0_c0(4);
   bh3_w5_2_c0 <= Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_Out0_c0(5);
   bh3_w6_2_c0 <= Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_Out0_c0(6);
   bh3_w7_2_c0 <= Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_Out0_c0(7);
   bh3_w8_2_c0 <= Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_Out0_c0(8);
   bh3_w9_2_c0 <= Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_Out0_c0(9);
   bh3_w10_2_c0 <= Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_Out0_c0(10);
   bh3_w11_1_c0 <= Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_Out0_c0(11);
   Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_uid52: Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6
      port map ( X0 => Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_In0_c0,
                 X1 => Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_In1_c0,
                 X10 => Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_In10_c0,
                 X11 => Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_In11_c0,
                 X2 => Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_In2_c0,
                 X3 => Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_In3_c0,
                 X4 => Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_In4_c0,
                 X5 => Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_In5_c0,
                 X6 => Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_In6_c0,
                 X7 => Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_In7_c0,
                 X8 => Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_In8_c0,
                 X9 => Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_In9_c0,
                 R => Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_Out0_copy53_c0);
   Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_Out0_c0 <= Row_Adder_IntMultiAdder_S_in5_m4_7_m4_out8_m412_Freq950_uid6_bh3_uid52_Out0_copy53_c0; -- output copy to hold a pipeline register if needed

   tmp_bitheapResult_bh3_11_c0 <= bh3_w11_1_c0 & bh3_w10_2_c0 & bh3_w9_2_c0 & bh3_w8_2_c0 & bh3_w7_2_c0 & bh3_w6_2_c0 & bh3_w5_2_c0 & bh3_w4_2_c0 & bh3_w3_2_c0 & bh3_w2_2_c0 & bh3_w1_2_c0 & bh3_w0_2_c0;
   bitheapResult_bh3_c0 <= tmp_bitheapResult_bh3_11_c0;
   OutRes_c0 <= bitheapResult_bh3_c0;
   R <= OutRes_c0;
end architecture;

