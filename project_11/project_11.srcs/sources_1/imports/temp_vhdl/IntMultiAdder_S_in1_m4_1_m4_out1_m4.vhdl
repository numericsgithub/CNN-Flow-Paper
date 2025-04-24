--------------------------------------------------------------------------------
--                          Row_Adder_IntMultiAdder_S_in1_m4_1_m4_out1_m45_Freq950_uid6
-- VHDL generated for VirtexUltrascalePlus @ 950MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Andreas Boettcher
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 1.05263
-- Target frequency (MHz): 950
-- Input signals: X4 X3 X2 X1 X0
-- Output signals: R
--  approx. input signal timings: X4: (c0, 0.000000ns)X3: (c0, 0.000000ns)X2: (c0, 0.000000ns)X1: (c0, 0.000000ns)X0: (c0, 0.000000ns)
--  approx. output signal timings: R: (c0, 0.472000ns)

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

entity Row_Adder_IntMultiAdder_S_in1_m4_1_m4_out1_m45_Freq950_uid6 is
    port (X4 : in  std_logic_vector(1 downto 0);
          X3 : in  std_logic_vector(1 downto 0);
          X2 : in  std_logic_vector(1 downto 0);
          X1 : in  std_logic_vector(1 downto 0);
          X0 : in  std_logic_vector(2 downto 0);
          R : out  std_logic_vector(5 downto 0)   );
end entity;

architecture arch of Row_Adder_IntMultiAdder_S_in1_m4_1_m4_out1_m45_Freq950_uid6 is


signal cc_di :  std_logic_vector(7 downto 0);
   -- timing of cc_di: (c0, 0.000000ns)
signal cc_s :  std_logic_vector(7 downto 0);
   -- timing of cc_s: (c0, 0.000000ns)
signal cc_co :  std_logic_vector(7 downto 0);
   -- timing of cc_co: (c0, 0.000000ns)
signal cc_o :  std_logic_vector(7 downto 0);
   -- timing of cc_o: (c0, 0.000000ns)
signal result :  std_logic_vector(5 downto 0);
   -- timing of result: (c0, 0.472000ns)
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

   result <= cc_co(4) & cc_o(4 downto 0);
   R <= result;
end architecture;

--------------------------------------------------------------------------------
--                          IntMultiAdder_S_in1_m4_1_m4_out1_m4
--                     (IntMultiAdder_S5_2_Freq950_uid2)
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
--  approx. output signal timings: R: (c0, 0.472000ns)

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntMultiAdder_S_in1_m4_1_m4_out1_m4 is
    port (clk, rst : in std_logic;
          R : out  std_logic_vector(4 downto 0);
          X0 : in  std_logic_vector(4 downto 0);
          X1 : in  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of IntMultiAdder_S_in1_m4_1_m4_out1_m4 is
   component Row_Adder_IntMultiAdder_S_in1_m4_1_m4_out1_m45_Freq950_uid6 is
      port ( X4 : in  std_logic_vector(1 downto 0);
             X3 : in  std_logic_vector(1 downto 0);
             X2 : in  std_logic_vector(1 downto 0);
             X1 : in  std_logic_vector(1 downto 0);
             X0 : in  std_logic_vector(2 downto 0);
             R : out  std_logic_vector(5 downto 0)   );
   end component;

signal iX0_c0 :  signed(4-0 downto 0);
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
signal iX1_c0 :  signed(4-0 downto 0);
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
signal Row_Adder_IntMultiAdder_S_in1_m4_1_m4_out1_m45_Freq950_uid6_bh3_uid36_In0_c0 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_IntMultiAdder_S_in1_m4_1_m4_out1_m45_Freq950_uid6_bh3_uid36_In0_c0: (c0, 0.000000ns)
signal Row_Adder_IntMultiAdder_S_in1_m4_1_m4_out1_m45_Freq950_uid6_bh3_uid36_In1_c0 :  std_logic_vector(1 downto 0);
   -- timing of Row_Adder_IntMultiAdder_S_in1_m4_1_m4_out1_m45_Freq950_uid6_bh3_uid36_In1_c0: (c0, 0.000000ns)
signal Row_Adder_IntMultiAdder_S_in1_m4_1_m4_out1_m45_Freq950_uid6_bh3_uid36_In2_c0 :  std_logic_vector(1 downto 0);
   -- timing of Row_Adder_IntMultiAdder_S_in1_m4_1_m4_out1_m45_Freq950_uid6_bh3_uid36_In2_c0: (c0, 0.000000ns)
signal Row_Adder_IntMultiAdder_S_in1_m4_1_m4_out1_m45_Freq950_uid6_bh3_uid36_In3_c0 :  std_logic_vector(1 downto 0);
   -- timing of Row_Adder_IntMultiAdder_S_in1_m4_1_m4_out1_m45_Freq950_uid6_bh3_uid36_In3_c0: (c0, 0.000000ns)
signal Row_Adder_IntMultiAdder_S_in1_m4_1_m4_out1_m45_Freq950_uid6_bh3_uid36_In4_c0 :  std_logic_vector(1 downto 0);
   -- timing of Row_Adder_IntMultiAdder_S_in1_m4_1_m4_out1_m45_Freq950_uid6_bh3_uid36_In4_c0: (c0, 0.000000ns)
signal Row_Adder_IntMultiAdder_S_in1_m4_1_m4_out1_m45_Freq950_uid6_bh3_uid36_Out0_c0 :  std_logic_vector(5 downto 0);
   -- timing of Row_Adder_IntMultiAdder_S_in1_m4_1_m4_out1_m45_Freq950_uid6_bh3_uid36_Out0_c0: (c0, 0.472000ns)
signal bh3_w0_2_c0 :  std_logic;
   -- timing of bh3_w0_2_c0: (c0, 0.472000ns)
signal bh3_w1_2_c0 :  std_logic;
   -- timing of bh3_w1_2_c0: (c0, 0.472000ns)
signal bh3_w2_2_c0 :  std_logic;
   -- timing of bh3_w2_2_c0: (c0, 0.472000ns)
signal bh3_w3_2_c0 :  std_logic;
   -- timing of bh3_w3_2_c0: (c0, 0.472000ns)
signal bh3_w4_2_c0 :  std_logic;
   -- timing of bh3_w4_2_c0: (c0, 0.472000ns)
signal Row_Adder_IntMultiAdder_S_in1_m4_1_m4_out1_m45_Freq950_uid6_bh3_uid36_Out0_copy37_c0 :  std_logic_vector(5 downto 0);
   -- timing of Row_Adder_IntMultiAdder_S_in1_m4_1_m4_out1_m45_Freq950_uid6_bh3_uid36_Out0_copy37_c0: (c0, 0.000000ns)
signal tmp_bitheapResult_bh3_4_c0 :  std_logic_vector(4 downto 0);
   -- timing of tmp_bitheapResult_bh3_4_c0: (c0, 0.472000ns)
signal bitheapResult_bh3_c0 :  std_logic_vector(4 downto 0);
   -- timing of bitheapResult_bh3_c0: (c0, 0.472000ns)
signal OutRes_c0 :  std_logic_vector(4 downto 0);
   -- timing of OutRes_c0: (c0, 0.472000ns)
begin
   iX0_c0 <= signed(X0);
   bh3_w0_0_c0 <= iX0_c0(0);
   bh3_w1_0_c0 <= iX0_c0(1);
   bh3_w2_0_c0 <= iX0_c0(2);
   bh3_w3_0_c0 <= iX0_c0(3);
   bh3_w4_0_c0 <= iX0_c0(4);
   iX1_c0 <= signed(X1);
   bh3_w0_1_c0 <= iX1_c0(0);
   bh3_w1_1_c0 <= iX1_c0(1);
   bh3_w2_1_c0 <= iX1_c0(2);
   bh3_w3_1_c0 <= iX1_c0(3);
   bh3_w4_1_c0 <= iX1_c0(4);

   -- Adding the constant bits 
      -- All the constant bits are zero, nothing to add


   Row_Adder_IntMultiAdder_S_in1_m4_1_m4_out1_m45_Freq950_uid6_bh3_uid36_In0_c0 <= "" & bh3_w0_0_c0 & bh3_w0_1_c0 & "0";
   Row_Adder_IntMultiAdder_S_in1_m4_1_m4_out1_m45_Freq950_uid6_bh3_uid36_In1_c0 <= "" & bh3_w1_0_c0 & bh3_w1_1_c0;
   Row_Adder_IntMultiAdder_S_in1_m4_1_m4_out1_m45_Freq950_uid6_bh3_uid36_In2_c0 <= "" & bh3_w2_0_c0 & bh3_w2_1_c0;
   Row_Adder_IntMultiAdder_S_in1_m4_1_m4_out1_m45_Freq950_uid6_bh3_uid36_In3_c0 <= "" & bh3_w3_0_c0 & bh3_w3_1_c0;
   Row_Adder_IntMultiAdder_S_in1_m4_1_m4_out1_m45_Freq950_uid6_bh3_uid36_In4_c0 <= "" & bh3_w4_0_c0 & bh3_w4_1_c0;
   bh3_w0_2_c0 <= Row_Adder_IntMultiAdder_S_in1_m4_1_m4_out1_m45_Freq950_uid6_bh3_uid36_Out0_c0(0);
   bh3_w1_2_c0 <= Row_Adder_IntMultiAdder_S_in1_m4_1_m4_out1_m45_Freq950_uid6_bh3_uid36_Out0_c0(1);
   bh3_w2_2_c0 <= Row_Adder_IntMultiAdder_S_in1_m4_1_m4_out1_m45_Freq950_uid6_bh3_uid36_Out0_c0(2);
   bh3_w3_2_c0 <= Row_Adder_IntMultiAdder_S_in1_m4_1_m4_out1_m45_Freq950_uid6_bh3_uid36_Out0_c0(3);
   bh3_w4_2_c0 <= Row_Adder_IntMultiAdder_S_in1_m4_1_m4_out1_m45_Freq950_uid6_bh3_uid36_Out0_c0(4);
   Row_Adder_IntMultiAdder_S_in1_m4_1_m4_out1_m45_Freq950_uid6_uid36: Row_Adder_IntMultiAdder_S_in1_m4_1_m4_out1_m45_Freq950_uid6
      port map ( X0 => Row_Adder_IntMultiAdder_S_in1_m4_1_m4_out1_m45_Freq950_uid6_bh3_uid36_In0_c0,
                 X1 => Row_Adder_IntMultiAdder_S_in1_m4_1_m4_out1_m45_Freq950_uid6_bh3_uid36_In1_c0,
                 X2 => Row_Adder_IntMultiAdder_S_in1_m4_1_m4_out1_m45_Freq950_uid6_bh3_uid36_In2_c0,
                 X3 => Row_Adder_IntMultiAdder_S_in1_m4_1_m4_out1_m45_Freq950_uid6_bh3_uid36_In3_c0,
                 X4 => Row_Adder_IntMultiAdder_S_in1_m4_1_m4_out1_m45_Freq950_uid6_bh3_uid36_In4_c0,
                 R => Row_Adder_IntMultiAdder_S_in1_m4_1_m4_out1_m45_Freq950_uid6_bh3_uid36_Out0_copy37_c0);
   Row_Adder_IntMultiAdder_S_in1_m4_1_m4_out1_m45_Freq950_uid6_bh3_uid36_Out0_c0 <= Row_Adder_IntMultiAdder_S_in1_m4_1_m4_out1_m45_Freq950_uid6_bh3_uid36_Out0_copy37_c0; -- output copy to hold a pipeline register if needed

   tmp_bitheapResult_bh3_4_c0 <= bh3_w4_2_c0 & bh3_w3_2_c0 & bh3_w2_2_c0 & bh3_w1_2_c0 & bh3_w0_2_c0;
   bitheapResult_bh3_c0 <= tmp_bitheapResult_bh3_4_c0;
   OutRes_c0 <= bitheapResult_bh3_c0;
   R <= OutRes_c0;
end architecture;

