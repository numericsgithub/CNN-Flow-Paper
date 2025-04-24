--------------------------------------------------------------------------------
--                         Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6
-- VHDL generated for VirtexUltrascalePlus @ 950MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Andreas Boettcher
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 1.05263
-- Target frequency (MHz): 950
-- Input signals: X23 X22 X21 X20 X19 X18 X17 X16 X15 X14 X13 X12 X11 X10 X9 X8 X7 X6 X5 X4 X3 X2 X1 X0
-- Output signals: R
--  approx. input signal timings: X23: (c0, 0.000000ns)X22: (c0, 0.000000ns)X21: (c0, 0.000000ns)X20: (c0, 0.000000ns)X19: (c0, 0.000000ns)X18: (c0, 0.000000ns)X17: (c0, 0.000000ns)X16: (c0, 0.000000ns)X15: (c0, 0.000000ns)X14: (c0, 0.000000ns)X13: (c0, 0.000000ns)X12: (c0, 0.000000ns)X11: (c0, 0.000000ns)X10: (c0, 0.000000ns)X9: (c0, 0.000000ns)X8: (c0, 0.000000ns)X7: (c0, 0.000000ns)X6: (c0, 0.000000ns)X5: (c0, 0.000000ns)X4: (c0, 0.000000ns)X3: (c0, 0.000000ns)X2: (c0, 0.000000ns)X1: (c0, 0.000000ns)X0: (c0, 0.000000ns)
--  approx. output signal timings: R: (c0, 0.580000ns)

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

entity Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6 is
    port (X23 : in  std_logic_vector(1 downto 0);
          X22 : in  std_logic_vector(1 downto 0);
          X21 : in  std_logic_vector(1 downto 0);
          X20 : in  std_logic_vector(1 downto 0);
          X19 : in  std_logic_vector(1 downto 0);
          X18 : in  std_logic_vector(1 downto 0);
          X17 : in  std_logic_vector(1 downto 0);
          X16 : in  std_logic_vector(1 downto 0);
          X15 : in  std_logic_vector(1 downto 0);
          X14 : in  std_logic_vector(1 downto 0);
          X13 : in  std_logic_vector(1 downto 0);
          X12 : in  std_logic_vector(1 downto 0);
          X11 : in  std_logic_vector(1 downto 0);
          X10 : in  std_logic_vector(1 downto 0);
          X9 : in  std_logic_vector(1 downto 0);
          X8 : in  std_logic_vector(1 downto 0);
          X7 : in  std_logic_vector(1 downto 0);
          X6 : in  std_logic_vector(1 downto 0);
          X5 : in  std_logic_vector(1 downto 0);
          X4 : in  std_logic_vector(1 downto 0);
          X3 : in  std_logic_vector(1 downto 0);
          X2 : in  std_logic_vector(1 downto 0);
          X1 : in  std_logic_vector(1 downto 0);
          X0 : in  std_logic_vector(2 downto 0);
          R : out  std_logic_vector(24 downto 0)   );
end entity;

architecture arch of Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6 is


signal cc_di :  std_logic_vector(23 downto 0);
   -- timing of cc_di: (c0, 0.000000ns)
signal cc_s :  std_logic_vector(23 downto 0);
   -- timing of cc_s: (c0, 0.000000ns)
signal cc_co :  std_logic_vector(23 downto 0);
   -- timing of cc_co: (c0, 0.000000ns)
signal cc_o :  std_logic_vector(23 downto 0);
   -- timing of cc_o: (c0, 0.000000ns)
signal result :  std_logic_vector(24 downto 0);
   -- timing of result: (c0, 0.580000ns)
begin
   cc_di(0) <= X0(0);
   lut0: LUT6_2
      generic map ( init => x"66666666aaaaaaaa")
      port map ( i0 => X0(0),
                 i1 => X0(1),
                 i2 => '0',
                 i3 => '0',
                 i4 => '0',
                 i5 => '1',
                 o5 => open,
                 o6 => cc_s(0));

   cc0: CARRY4
      port map ( ci => '0',
                 cyinit => X0(2),
                 di => cc_di(3 downto 0),
                 s => cc_s(3 downto 0),
                 co => cc_co(3 downto 0),
                 o => cc_o(3 downto 0));

   cc_di(1) <= X1(0);
   lut1: LUT6_2
      generic map ( init => x"66666666aaaaaaaa")
      port map ( i0 => X1(0),
                 i1 => X1(1),
                 i2 => '0',
                 i3 => '0',
                 i4 => '0',
                 i5 => '1',
                 o5 => open,
                 o6 => cc_s(1));

   cc_di(2) <= X2(0);
   lut2: LUT6_2
      generic map ( init => x"66666666aaaaaaaa")
      port map ( i0 => X2(0),
                 i1 => X2(1),
                 i2 => '0',
                 i3 => '0',
                 i4 => '0',
                 i5 => '1',
                 o5 => open,
                 o6 => cc_s(2));

   cc_di(3) <= X3(0);
   lut3: LUT6_2
      generic map ( init => x"66666666aaaaaaaa")
      port map ( i0 => X3(0),
                 i1 => X3(1),
                 i2 => '0',
                 i3 => '0',
                 i4 => '0',
                 i5 => '1',
                 o5 => open,
                 o6 => cc_s(3));

   cc_di(4) <= X4(0);
   lut4: LUT6_2
      generic map ( init => x"66666666aaaaaaaa")
      port map ( i0 => X4(0),
                 i1 => X4(1),
                 i2 => '0',
                 i3 => '0',
                 i4 => '0',
                 i5 => '1',
                 o5 => open,
                 o6 => cc_s(4));

   cc1: CARRY4
      port map ( ci => cc_co(3),
                 cyinit => '0',
                 di => cc_di(7 downto 4),
                 s => cc_s(7 downto 4),
                 co => cc_co(7 downto 4),
                 o => cc_o(7 downto 4));

   cc_di(5) <= X5(0);
   lut5: LUT6_2
      generic map ( init => x"66666666aaaaaaaa")
      port map ( i0 => X5(0),
                 i1 => X5(1),
                 i2 => '0',
                 i3 => '0',
                 i4 => '0',
                 i5 => '1',
                 o5 => open,
                 o6 => cc_s(5));

   cc_di(6) <= X6(0);
   lut6: LUT6_2
      generic map ( init => x"66666666aaaaaaaa")
      port map ( i0 => X6(0),
                 i1 => X6(1),
                 i2 => '0',
                 i3 => '0',
                 i4 => '0',
                 i5 => '1',
                 o5 => open,
                 o6 => cc_s(6));

   cc_di(7) <= X7(0);
   lut7: LUT6_2
      generic map ( init => x"66666666aaaaaaaa")
      port map ( i0 => X7(0),
                 i1 => X7(1),
                 i2 => '0',
                 i3 => '0',
                 i4 => '0',
                 i5 => '1',
                 o5 => open,
                 o6 => cc_s(7));

   cc_di(8) <= X8(0);
   lut8: LUT6_2
      generic map ( init => x"66666666aaaaaaaa")
      port map ( i0 => X8(0),
                 i1 => X8(1),
                 i2 => '0',
                 i3 => '0',
                 i4 => '0',
                 i5 => '1',
                 o5 => open,
                 o6 => cc_s(8));

   cc2: CARRY4
      port map ( ci => cc_co(7),
                 cyinit => '0',
                 di => cc_di(11 downto 8),
                 s => cc_s(11 downto 8),
                 co => cc_co(11 downto 8),
                 o => cc_o(11 downto 8));

   cc_di(9) <= X9(0);
   lut9: LUT6_2
      generic map ( init => x"66666666aaaaaaaa")
      port map ( i0 => X9(0),
                 i1 => X9(1),
                 i2 => '0',
                 i3 => '0',
                 i4 => '0',
                 i5 => '1',
                 o5 => open,
                 o6 => cc_s(9));

   cc_di(10) <= X10(0);
   lut10: LUT6_2
      generic map ( init => x"66666666aaaaaaaa")
      port map ( i0 => X10(0),
                 i1 => X10(1),
                 i2 => '0',
                 i3 => '0',
                 i4 => '0',
                 i5 => '1',
                 o5 => open,
                 o6 => cc_s(10));

   cc_di(11) <= X11(0);
   lut11: LUT6_2
      generic map ( init => x"66666666aaaaaaaa")
      port map ( i0 => X11(0),
                 i1 => X11(1),
                 i2 => '0',
                 i3 => '0',
                 i4 => '0',
                 i5 => '1',
                 o5 => open,
                 o6 => cc_s(11));

   cc_di(12) <= X12(0);
   lut12: LUT6_2
      generic map ( init => x"66666666aaaaaaaa")
      port map ( i0 => X12(0),
                 i1 => X12(1),
                 i2 => '0',
                 i3 => '0',
                 i4 => '0',
                 i5 => '1',
                 o5 => open,
                 o6 => cc_s(12));

   cc3: CARRY4
      port map ( ci => cc_co(11),
                 cyinit => '0',
                 di => cc_di(15 downto 12),
                 s => cc_s(15 downto 12),
                 co => cc_co(15 downto 12),
                 o => cc_o(15 downto 12));

   cc_di(13) <= X13(0);
   lut13: LUT6_2
      generic map ( init => x"66666666aaaaaaaa")
      port map ( i0 => X13(0),
                 i1 => X13(1),
                 i2 => '0',
                 i3 => '0',
                 i4 => '0',
                 i5 => '1',
                 o5 => open,
                 o6 => cc_s(13));

   cc_di(14) <= X14(0);
   lut14: LUT6_2
      generic map ( init => x"66666666aaaaaaaa")
      port map ( i0 => X14(0),
                 i1 => X14(1),
                 i2 => '0',
                 i3 => '0',
                 i4 => '0',
                 i5 => '1',
                 o5 => open,
                 o6 => cc_s(14));

   cc_di(15) <= X15(0);
   lut15: LUT6_2
      generic map ( init => x"66666666aaaaaaaa")
      port map ( i0 => X15(0),
                 i1 => X15(1),
                 i2 => '0',
                 i3 => '0',
                 i4 => '0',
                 i5 => '1',
                 o5 => open,
                 o6 => cc_s(15));

   cc_di(16) <= X16(0);
   lut16: LUT6_2
      generic map ( init => x"66666666aaaaaaaa")
      port map ( i0 => X16(0),
                 i1 => X16(1),
                 i2 => '0',
                 i3 => '0',
                 i4 => '0',
                 i5 => '1',
                 o5 => open,
                 o6 => cc_s(16));

   cc4: CARRY4
      port map ( ci => cc_co(15),
                 cyinit => '0',
                 di => cc_di(19 downto 16),
                 s => cc_s(19 downto 16),
                 co => cc_co(19 downto 16),
                 o => cc_o(19 downto 16));

   cc_di(17) <= X17(0);
   lut17: LUT6_2
      generic map ( init => x"66666666aaaaaaaa")
      port map ( i0 => X17(0),
                 i1 => X17(1),
                 i2 => '0',
                 i3 => '0',
                 i4 => '0',
                 i5 => '1',
                 o5 => open,
                 o6 => cc_s(17));

   cc_di(18) <= X18(0);
   lut18: LUT6_2
      generic map ( init => x"66666666aaaaaaaa")
      port map ( i0 => X18(0),
                 i1 => X18(1),
                 i2 => '0',
                 i3 => '0',
                 i4 => '0',
                 i5 => '1',
                 o5 => open,
                 o6 => cc_s(18));

   cc_di(19) <= X19(0);
   lut19: LUT6_2
      generic map ( init => x"66666666aaaaaaaa")
      port map ( i0 => X19(0),
                 i1 => X19(1),
                 i2 => '0',
                 i3 => '0',
                 i4 => '0',
                 i5 => '1',
                 o5 => open,
                 o6 => cc_s(19));

   cc_di(20) <= X20(0);
   lut20: LUT6_2
      generic map ( init => x"66666666aaaaaaaa")
      port map ( i0 => X20(0),
                 i1 => X20(1),
                 i2 => '0',
                 i3 => '0',
                 i4 => '0',
                 i5 => '1',
                 o5 => open,
                 o6 => cc_s(20));

   cc5: CARRY4
      port map ( ci => cc_co(19),
                 cyinit => '0',
                 di => cc_di(23 downto 20),
                 s => cc_s(23 downto 20),
                 co => cc_co(23 downto 20),
                 o => cc_o(23 downto 20));

   cc_di(21) <= X21(0);
   lut21: LUT6_2
      generic map ( init => x"66666666aaaaaaaa")
      port map ( i0 => X21(0),
                 i1 => X21(1),
                 i2 => '0',
                 i3 => '0',
                 i4 => '0',
                 i5 => '1',
                 o5 => open,
                 o6 => cc_s(21));

   cc_di(22) <= X22(0);
   lut22: LUT6_2
      generic map ( init => x"66666666aaaaaaaa")
      port map ( i0 => X22(0),
                 i1 => X22(1),
                 i2 => '0',
                 i3 => '0',
                 i4 => '0',
                 i5 => '1',
                 o5 => open,
                 o6 => cc_s(22));

   cc_di(23) <= X23(0);
   lut23: LUT6_2
      generic map ( init => x"66666666aaaaaaaa")
      port map ( i0 => X23(0),
                 i1 => X23(1),
                 i2 => '0',
                 i3 => '0',
                 i4 => '0',
                 i5 => '1',
                 o5 => open,
                 o6 => cc_s(23));

   result <= cc_co(23) & cc_o(23 downto 0);
   R <= result;
end architecture;

--------------------------------------------------------------------------------
--                          IntMultiAdder_S_in4_m4_12_m12_out12_m12
--                     (IntMultiAdder_S24_2_Freq950_uid2)
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
--  approx. output signal timings: R: (c0, 0.580000ns)

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntMultiAdder_S_in4_m4_12_m12_out12_m12 is
    port (clk, rst : in std_logic;
          R : out  std_logic_vector(23 downto 0);
          X0 : in  std_logic_vector(23 downto 0);
          X1 : in  std_logic_vector(23 downto 0)   );
end entity;

architecture arch of IntMultiAdder_S_in4_m4_12_m12_out12_m12 is
   component Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6 is
      port ( X23 : in  std_logic_vector(1 downto 0);
             X22 : in  std_logic_vector(1 downto 0);
             X21 : in  std_logic_vector(1 downto 0);
             X20 : in  std_logic_vector(1 downto 0);
             X19 : in  std_logic_vector(1 downto 0);
             X18 : in  std_logic_vector(1 downto 0);
             X17 : in  std_logic_vector(1 downto 0);
             X16 : in  std_logic_vector(1 downto 0);
             X15 : in  std_logic_vector(1 downto 0);
             X14 : in  std_logic_vector(1 downto 0);
             X13 : in  std_logic_vector(1 downto 0);
             X12 : in  std_logic_vector(1 downto 0);
             X11 : in  std_logic_vector(1 downto 0);
             X10 : in  std_logic_vector(1 downto 0);
             X9 : in  std_logic_vector(1 downto 0);
             X8 : in  std_logic_vector(1 downto 0);
             X7 : in  std_logic_vector(1 downto 0);
             X6 : in  std_logic_vector(1 downto 0);
             X5 : in  std_logic_vector(1 downto 0);
             X4 : in  std_logic_vector(1 downto 0);
             X3 : in  std_logic_vector(1 downto 0);
             X2 : in  std_logic_vector(1 downto 0);
             X1 : in  std_logic_vector(1 downto 0);
             X0 : in  std_logic_vector(2 downto 0);
             R : out  std_logic_vector(24 downto 0)   );
   end component;

signal iX0_c0 :  signed(23-0 downto 0);
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
signal bh3_w11_0_c0 :  std_logic;
   -- timing of bh3_w11_0_c0: (c0, 0.000000ns)
signal bh3_w12_0_c0 :  std_logic;
   -- timing of bh3_w12_0_c0: (c0, 0.000000ns)
signal bh3_w13_0_c0 :  std_logic;
   -- timing of bh3_w13_0_c0: (c0, 0.000000ns)
signal bh3_w14_0_c0 :  std_logic;
   -- timing of bh3_w14_0_c0: (c0, 0.000000ns)
signal bh3_w15_0_c0 :  std_logic;
   -- timing of bh3_w15_0_c0: (c0, 0.000000ns)
signal bh3_w16_0_c0 :  std_logic;
   -- timing of bh3_w16_0_c0: (c0, 0.000000ns)
signal bh3_w17_0_c0 :  std_logic;
   -- timing of bh3_w17_0_c0: (c0, 0.000000ns)
signal bh3_w18_0_c0 :  std_logic;
   -- timing of bh3_w18_0_c0: (c0, 0.000000ns)
signal bh3_w19_0_c0 :  std_logic;
   -- timing of bh3_w19_0_c0: (c0, 0.000000ns)
signal bh3_w20_0_c0 :  std_logic;
   -- timing of bh3_w20_0_c0: (c0, 0.000000ns)
signal bh3_w21_0_c0 :  std_logic;
   -- timing of bh3_w21_0_c0: (c0, 0.000000ns)
signal bh3_w22_0_c0 :  std_logic;
   -- timing of bh3_w22_0_c0: (c0, 0.000000ns)
signal bh3_w23_0_c0 :  std_logic;
   -- timing of bh3_w23_0_c0: (c0, 0.000000ns)
signal iX1_c0 :  signed(23-0 downto 0);
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
signal bh3_w11_1_c0 :  std_logic;
   -- timing of bh3_w11_1_c0: (c0, 0.000000ns)
signal bh3_w12_1_c0 :  std_logic;
   -- timing of bh3_w12_1_c0: (c0, 0.000000ns)
signal bh3_w13_1_c0 :  std_logic;
   -- timing of bh3_w13_1_c0: (c0, 0.000000ns)
signal bh3_w14_1_c0 :  std_logic;
   -- timing of bh3_w14_1_c0: (c0, 0.000000ns)
signal bh3_w15_1_c0 :  std_logic;
   -- timing of bh3_w15_1_c0: (c0, 0.000000ns)
signal bh3_w16_1_c0 :  std_logic;
   -- timing of bh3_w16_1_c0: (c0, 0.000000ns)
signal bh3_w17_1_c0 :  std_logic;
   -- timing of bh3_w17_1_c0: (c0, 0.000000ns)
signal bh3_w18_1_c0 :  std_logic;
   -- timing of bh3_w18_1_c0: (c0, 0.000000ns)
signal bh3_w19_1_c0 :  std_logic;
   -- timing of bh3_w19_1_c0: (c0, 0.000000ns)
signal bh3_w20_1_c0 :  std_logic;
   -- timing of bh3_w20_1_c0: (c0, 0.000000ns)
signal bh3_w21_1_c0 :  std_logic;
   -- timing of bh3_w21_1_c0: (c0, 0.000000ns)
signal bh3_w22_1_c0 :  std_logic;
   -- timing of bh3_w22_1_c0: (c0, 0.000000ns)
signal bh3_w23_1_c0 :  std_logic;
   -- timing of bh3_w23_1_c0: (c0, 0.000000ns)
signal Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In0_c0 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In0_c0: (c0, 0.000000ns)
signal Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In1_c0 :  std_logic_vector(1 downto 0);
   -- timing of Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In1_c0: (c0, 0.000000ns)
signal Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In2_c0 :  std_logic_vector(1 downto 0);
   -- timing of Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In2_c0: (c0, 0.000000ns)
signal Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In3_c0 :  std_logic_vector(1 downto 0);
   -- timing of Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In3_c0: (c0, 0.000000ns)
signal Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In4_c0 :  std_logic_vector(1 downto 0);
   -- timing of Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In4_c0: (c0, 0.000000ns)
signal Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In5_c0 :  std_logic_vector(1 downto 0);
   -- timing of Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In5_c0: (c0, 0.000000ns)
signal Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In6_c0 :  std_logic_vector(1 downto 0);
   -- timing of Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In6_c0: (c0, 0.000000ns)
signal Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In7_c0 :  std_logic_vector(1 downto 0);
   -- timing of Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In7_c0: (c0, 0.000000ns)
signal Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In8_c0 :  std_logic_vector(1 downto 0);
   -- timing of Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In8_c0: (c0, 0.000000ns)
signal Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In9_c0 :  std_logic_vector(1 downto 0);
   -- timing of Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In9_c0: (c0, 0.000000ns)
signal Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In10_c0 :  std_logic_vector(1 downto 0);
   -- timing of Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In10_c0: (c0, 0.000000ns)
signal Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In11_c0 :  std_logic_vector(1 downto 0);
   -- timing of Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In11_c0: (c0, 0.000000ns)
signal Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In12_c0 :  std_logic_vector(1 downto 0);
   -- timing of Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In12_c0: (c0, 0.000000ns)
signal Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In13_c0 :  std_logic_vector(1 downto 0);
   -- timing of Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In13_c0: (c0, 0.000000ns)
signal Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In14_c0 :  std_logic_vector(1 downto 0);
   -- timing of Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In14_c0: (c0, 0.000000ns)
signal Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In15_c0 :  std_logic_vector(1 downto 0);
   -- timing of Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In15_c0: (c0, 0.000000ns)
signal Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In16_c0 :  std_logic_vector(1 downto 0);
   -- timing of Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In16_c0: (c0, 0.000000ns)
signal Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In17_c0 :  std_logic_vector(1 downto 0);
   -- timing of Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In17_c0: (c0, 0.000000ns)
signal Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In18_c0 :  std_logic_vector(1 downto 0);
   -- timing of Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In18_c0: (c0, 0.000000ns)
signal Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In19_c0 :  std_logic_vector(1 downto 0);
   -- timing of Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In19_c0: (c0, 0.000000ns)
signal Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In20_c0 :  std_logic_vector(1 downto 0);
   -- timing of Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In20_c0: (c0, 0.000000ns)
signal Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In21_c0 :  std_logic_vector(1 downto 0);
   -- timing of Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In21_c0: (c0, 0.000000ns)
signal Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In22_c0 :  std_logic_vector(1 downto 0);
   -- timing of Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In22_c0: (c0, 0.000000ns)
signal Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In23_c0 :  std_logic_vector(1 downto 0);
   -- timing of Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In23_c0: (c0, 0.000000ns)
signal Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_Out0_c0 :  std_logic_vector(24 downto 0);
   -- timing of Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_Out0_c0: (c0, 0.580000ns)
signal bh3_w0_2_c0 :  std_logic;
   -- timing of bh3_w0_2_c0: (c0, 0.580000ns)
signal bh3_w1_2_c0 :  std_logic;
   -- timing of bh3_w1_2_c0: (c0, 0.580000ns)
signal bh3_w2_2_c0 :  std_logic;
   -- timing of bh3_w2_2_c0: (c0, 0.580000ns)
signal bh3_w3_2_c0 :  std_logic;
   -- timing of bh3_w3_2_c0: (c0, 0.580000ns)
signal bh3_w4_2_c0 :  std_logic;
   -- timing of bh3_w4_2_c0: (c0, 0.580000ns)
signal bh3_w5_2_c0 :  std_logic;
   -- timing of bh3_w5_2_c0: (c0, 0.580000ns)
signal bh3_w6_2_c0 :  std_logic;
   -- timing of bh3_w6_2_c0: (c0, 0.580000ns)
signal bh3_w7_2_c0 :  std_logic;
   -- timing of bh3_w7_2_c0: (c0, 0.580000ns)
signal bh3_w8_2_c0 :  std_logic;
   -- timing of bh3_w8_2_c0: (c0, 0.580000ns)
signal bh3_w9_2_c0 :  std_logic;
   -- timing of bh3_w9_2_c0: (c0, 0.580000ns)
signal bh3_w10_2_c0 :  std_logic;
   -- timing of bh3_w10_2_c0: (c0, 0.580000ns)
signal bh3_w11_2_c0 :  std_logic;
   -- timing of bh3_w11_2_c0: (c0, 0.580000ns)
signal bh3_w12_2_c0 :  std_logic;
   -- timing of bh3_w12_2_c0: (c0, 0.580000ns)
signal bh3_w13_2_c0 :  std_logic;
   -- timing of bh3_w13_2_c0: (c0, 0.580000ns)
signal bh3_w14_2_c0 :  std_logic;
   -- timing of bh3_w14_2_c0: (c0, 0.580000ns)
signal bh3_w15_2_c0 :  std_logic;
   -- timing of bh3_w15_2_c0: (c0, 0.580000ns)
signal bh3_w16_2_c0 :  std_logic;
   -- timing of bh3_w16_2_c0: (c0, 0.580000ns)
signal bh3_w17_2_c0 :  std_logic;
   -- timing of bh3_w17_2_c0: (c0, 0.580000ns)
signal bh3_w18_2_c0 :  std_logic;
   -- timing of bh3_w18_2_c0: (c0, 0.580000ns)
signal bh3_w19_2_c0 :  std_logic;
   -- timing of bh3_w19_2_c0: (c0, 0.580000ns)
signal bh3_w20_2_c0 :  std_logic;
   -- timing of bh3_w20_2_c0: (c0, 0.580000ns)
signal bh3_w21_2_c0 :  std_logic;
   -- timing of bh3_w21_2_c0: (c0, 0.580000ns)
signal bh3_w22_2_c0 :  std_logic;
   -- timing of bh3_w22_2_c0: (c0, 0.580000ns)
signal bh3_w23_2_c0 :  std_logic;
   -- timing of bh3_w23_2_c0: (c0, 0.580000ns)
signal Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_Out0_copy140_c0 :  std_logic_vector(24 downto 0);
   -- timing of Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_Out0_copy140_c0: (c0, 0.000000ns)
signal tmp_bitheapResult_bh3_23_c0 :  std_logic_vector(23 downto 0);
   -- timing of tmp_bitheapResult_bh3_23_c0: (c0, 0.580000ns)
signal bitheapResult_bh3_c0 :  std_logic_vector(23 downto 0);
   -- timing of bitheapResult_bh3_c0: (c0, 0.580000ns)
signal OutRes_c0 :  std_logic_vector(23 downto 0);
   -- timing of OutRes_c0: (c0, 0.580000ns)
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
   bh3_w10_0_c0 <= iX0_c0(10);
   bh3_w11_0_c0 <= iX0_c0(11);
   bh3_w12_0_c0 <= iX0_c0(12);
   bh3_w13_0_c0 <= iX0_c0(13);
   bh3_w14_0_c0 <= iX0_c0(14);
   bh3_w15_0_c0 <= iX0_c0(15);
   bh3_w16_0_c0 <= iX0_c0(16);
   bh3_w17_0_c0 <= iX0_c0(17);
   bh3_w18_0_c0 <= iX0_c0(18);
   bh3_w19_0_c0 <= iX0_c0(19);
   bh3_w20_0_c0 <= iX0_c0(20);
   bh3_w21_0_c0 <= iX0_c0(21);
   bh3_w22_0_c0 <= iX0_c0(22);
   bh3_w23_0_c0 <= iX0_c0(23);
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
   bh3_w10_1_c0 <= iX1_c0(10);
   bh3_w11_1_c0 <= iX1_c0(11);
   bh3_w12_1_c0 <= iX1_c0(12);
   bh3_w13_1_c0 <= iX1_c0(13);
   bh3_w14_1_c0 <= iX1_c0(14);
   bh3_w15_1_c0 <= iX1_c0(15);
   bh3_w16_1_c0 <= iX1_c0(16);
   bh3_w17_1_c0 <= iX1_c0(17);
   bh3_w18_1_c0 <= iX1_c0(18);
   bh3_w19_1_c0 <= iX1_c0(19);
   bh3_w20_1_c0 <= iX1_c0(20);
   bh3_w21_1_c0 <= iX1_c0(21);
   bh3_w22_1_c0 <= iX1_c0(22);
   bh3_w23_1_c0 <= iX1_c0(23);

   -- Adding the constant bits 
      -- All the constant bits are zero, nothing to add


   Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In0_c0 <= "" & bh3_w0_0_c0 & bh3_w0_1_c0 & "0";
   Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In1_c0 <= "" & bh3_w1_0_c0 & bh3_w1_1_c0;
   Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In2_c0 <= "" & bh3_w2_0_c0 & bh3_w2_1_c0;
   Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In3_c0 <= "" & bh3_w3_0_c0 & bh3_w3_1_c0;
   Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In4_c0 <= "" & bh3_w4_0_c0 & bh3_w4_1_c0;
   Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In5_c0 <= "" & bh3_w5_0_c0 & bh3_w5_1_c0;
   Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In6_c0 <= "" & bh3_w6_0_c0 & bh3_w6_1_c0;
   Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In7_c0 <= "" & bh3_w7_0_c0 & bh3_w7_1_c0;
   Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In8_c0 <= "" & bh3_w8_0_c0 & bh3_w8_1_c0;
   Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In9_c0 <= "" & bh3_w9_0_c0 & bh3_w9_1_c0;
   Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In10_c0 <= "" & bh3_w10_0_c0 & bh3_w10_1_c0;
   Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In11_c0 <= "" & bh3_w11_0_c0 & bh3_w11_1_c0;
   Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In12_c0 <= "" & bh3_w12_0_c0 & bh3_w12_1_c0;
   Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In13_c0 <= "" & bh3_w13_0_c0 & bh3_w13_1_c0;
   Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In14_c0 <= "" & bh3_w14_0_c0 & bh3_w14_1_c0;
   Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In15_c0 <= "" & bh3_w15_0_c0 & bh3_w15_1_c0;
   Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In16_c0 <= "" & bh3_w16_0_c0 & bh3_w16_1_c0;
   Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In17_c0 <= "" & bh3_w17_0_c0 & bh3_w17_1_c0;
   Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In18_c0 <= "" & bh3_w18_0_c0 & bh3_w18_1_c0;
   Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In19_c0 <= "" & bh3_w19_0_c0 & bh3_w19_1_c0;
   Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In20_c0 <= "" & bh3_w20_0_c0 & bh3_w20_1_c0;
   Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In21_c0 <= "" & bh3_w21_0_c0 & bh3_w21_1_c0;
   Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In22_c0 <= "" & bh3_w22_0_c0 & bh3_w22_1_c0;
   Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In23_c0 <= "" & bh3_w23_0_c0 & bh3_w23_1_c0;
   bh3_w0_2_c0 <= Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_Out0_c0(0);
   bh3_w1_2_c0 <= Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_Out0_c0(1);
   bh3_w2_2_c0 <= Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_Out0_c0(2);
   bh3_w3_2_c0 <= Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_Out0_c0(3);
   bh3_w4_2_c0 <= Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_Out0_c0(4);
   bh3_w5_2_c0 <= Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_Out0_c0(5);
   bh3_w6_2_c0 <= Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_Out0_c0(6);
   bh3_w7_2_c0 <= Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_Out0_c0(7);
   bh3_w8_2_c0 <= Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_Out0_c0(8);
   bh3_w9_2_c0 <= Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_Out0_c0(9);
   bh3_w10_2_c0 <= Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_Out0_c0(10);
   bh3_w11_2_c0 <= Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_Out0_c0(11);
   bh3_w12_2_c0 <= Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_Out0_c0(12);
   bh3_w13_2_c0 <= Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_Out0_c0(13);
   bh3_w14_2_c0 <= Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_Out0_c0(14);
   bh3_w15_2_c0 <= Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_Out0_c0(15);
   bh3_w16_2_c0 <= Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_Out0_c0(16);
   bh3_w17_2_c0 <= Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_Out0_c0(17);
   bh3_w18_2_c0 <= Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_Out0_c0(18);
   bh3_w19_2_c0 <= Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_Out0_c0(19);
   bh3_w20_2_c0 <= Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_Out0_c0(20);
   bh3_w21_2_c0 <= Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_Out0_c0(21);
   bh3_w22_2_c0 <= Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_Out0_c0(22);
   bh3_w23_2_c0 <= Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_Out0_c0(23);
   Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_uid139: Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6
      port map ( X0 => Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In0_c0,
                 X1 => Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In1_c0,
                 X10 => Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In10_c0,
                 X11 => Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In11_c0,
                 X12 => Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In12_c0,
                 X13 => Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In13_c0,
                 X14 => Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In14_c0,
                 X15 => Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In15_c0,
                 X16 => Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In16_c0,
                 X17 => Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In17_c0,
                 X18 => Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In18_c0,
                 X19 => Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In19_c0,
                 X2 => Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In2_c0,
                 X20 => Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In20_c0,
                 X21 => Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In21_c0,
                 X22 => Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In22_c0,
                 X23 => Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In23_c0,
                 X3 => Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In3_c0,
                 X4 => Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In4_c0,
                 X5 => Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In5_c0,
                 X6 => Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In6_c0,
                 X7 => Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In7_c0,
                 X8 => Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In8_c0,
                 X9 => Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_In9_c0,
                 R => Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_Out0_copy140_c0);
   Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_Out0_c0 <= Row_Adder_IntMultiAdder_S_in4_m4_12_m12_out12_m1224_Freq950_uid6_bh3_uid139_Out0_copy140_c0; -- output copy to hold a pipeline register if needed

   tmp_bitheapResult_bh3_23_c0 <= bh3_w23_2_c0 & bh3_w22_2_c0 & bh3_w21_2_c0 & bh3_w20_2_c0 & bh3_w19_2_c0 & bh3_w18_2_c0 & bh3_w17_2_c0 & bh3_w16_2_c0 & bh3_w15_2_c0 & bh3_w14_2_c0 & bh3_w13_2_c0 & bh3_w12_2_c0 & bh3_w11_2_c0 & bh3_w10_2_c0 & bh3_w9_2_c0 & bh3_w8_2_c0 & bh3_w7_2_c0 & bh3_w6_2_c0 & bh3_w5_2_c0 & bh3_w4_2_c0 & bh3_w3_2_c0 & bh3_w2_2_c0 & bh3_w1_2_c0 & bh3_w0_2_c0;
   bitheapResult_bh3_c0 <= tmp_bitheapResult_bh3_23_c0;
   OutRes_c0 <= bitheapResult_bh3_c0;
   R <= OutRes_c0;
end architecture;

