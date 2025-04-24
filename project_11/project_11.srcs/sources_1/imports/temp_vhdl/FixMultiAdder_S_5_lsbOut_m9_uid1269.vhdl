--------------------------------------------------------------------------------
--                        Compressor_FixMultiAdder_S_5_lsbOut_m9_uid12693_2_Freq1950_uid6
-- VHDL generated for VirtexUltrascalePlus @ 1950MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 0.512821
-- Target frequency (MHz): 1950
-- Input signals: X0
-- Output signals: R
--  approx. input signal timings: X0: (c0, 0.000000ns)
--  approx. output signal timings: R: (c0, 0.215000ns)

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity Compressor_FixMultiAdder_S_5_lsbOut_m9_uid12693_2_Freq1950_uid6 is
    port (X0 : in  std_logic_vector(2 downto 0);
          R : out  std_logic_vector(1 downto 0)   );
end entity;

architecture arch of Compressor_FixMultiAdder_S_5_lsbOut_m9_uid12693_2_Freq1950_uid6 is
signal X :  std_logic_vector(2 downto 0);
   -- timing of X: (c0, 0.000000ns)
signal R0 :  std_logic_vector(1 downto 0);
   -- timing of R0: (c0, 0.215000ns)
begin
   X <= X0 ;

   with X  select  R0 <= 
      "00" when "000",
      "01" when "001" | "010" | "100",
      "10" when "011" | "101" | "110",
      "11" when "111",
      "--" when others;
   R <= R0;
end architecture;

--------------------------------------------------------------------------------
--                        Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10
-- VHDL generated for VirtexUltrascalePlus @ 1950MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Andreas Boettcher
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 0.512821
-- Target frequency (MHz): 1950
-- Input signals: X12 X11 X10 X9 X8 X7 X6 X5 X4 X3 X2 X1 X0
-- Output signals: R
--  approx. input signal timings: X12: (c0, 0.000000ns)X11: (c0, 0.000000ns)X10: (c0, 0.000000ns)X9: (c0, 0.000000ns)X8: (c0, 0.000000ns)X7: (c0, 0.000000ns)X6: (c0, 0.000000ns)X5: (c0, 0.000000ns)X4: (c0, 0.000000ns)X3: (c0, 0.000000ns)X2: (c0, 0.000000ns)X1: (c0, 0.000000ns)X0: (c0, 0.000000ns)
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

entity Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10 is
    port (X12 : in  std_logic_vector(0 downto 0);
          X11 : in  std_logic_vector(2 downto 0);
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
          R : out  std_logic_vector(13 downto 0)   );
end entity;

architecture arch of Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10 is


signal cc_di :  std_logic_vector(15 downto 0);
   -- timing of cc_di: (c0, 0.000000ns)
signal cc_s :  std_logic_vector(15 downto 0);
   -- timing of cc_s: (c0, 0.000000ns)
signal cc_co :  std_logic_vector(15 downto 0);
   -- timing of cc_co: (c0, 0.000000ns)
signal cc_o :  std_logic_vector(15 downto 0);
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
signal c11 :  std_logic;
   -- timing of c11: (c0, 0.000000ns)
signal result :  std_logic_vector(13 downto 0);
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
      generic map ( init => x"69966996fcc0fcc0")
      port map ( i0 => c10,
                 i1 => X11(0),
                 i2 => X11(1),
                 i3 => X11(2),
                 i4 => '0',
                 i5 => '1',
                 o5 => c11,
                 o6 => cc_s(11));

   cc_di(12) <= c11;
   lut12: LUT6_2
      generic map ( init => x"66666666aaaaaaaa")
      port map ( i0 => c11,
                 i1 => X12(0),
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

   result <= cc_co(12) & cc_o(12 downto 0);
   R <= result;
end architecture;

--------------------------------------------------------------------------------
--                         Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid12693_Freq1950_uid64
-- VHDL generated for VirtexUltrascalePlus @ 1950MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Andreas Boettcher
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 0.512821
-- Target frequency (MHz): 1950
-- Input signals: X2 X1 X0
-- Output signals: R
--  approx. input signal timings: X2: (c0, 0.000000ns)X1: (c0, 0.000000ns)X0: (c0, 0.000000ns)
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

entity Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid12693_Freq1950_uid64 is
    port (X2 : in  std_logic_vector(0 downto 0);
          X1 : in  std_logic_vector(2 downto 0);
          X0 : in  std_logic_vector(3 downto 0);
          R : out  std_logic_vector(3 downto 0)   );
end entity;

architecture arch of Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid12693_Freq1950_uid64 is


signal cc_di :  std_logic_vector(3 downto 0);
   -- timing of cc_di: (c0, 0.000000ns)
signal cc_s :  std_logic_vector(3 downto 0);
   -- timing of cc_s: (c0, 0.000000ns)
signal cc_co :  std_logic_vector(3 downto 0);
   -- timing of cc_co: (c0, 0.000000ns)
signal cc_o :  std_logic_vector(3 downto 0);
   -- timing of cc_o: (c0, 0.000000ns)
signal c0 :  std_logic;
   -- timing of c0: (c0, 0.000000ns)
signal c1 :  std_logic;
   -- timing of c1: (c0, 0.000000ns)
signal result :  std_logic_vector(3 downto 0);
   -- timing of result: (c0, 0.472000ns)
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
      generic map ( init => x"66666666aaaaaaaa")
      port map ( i0 => c1,
                 i1 => X2(0),
                 i2 => '0',
                 i3 => '0',
                 i4 => '0',
                 i5 => '1',
                 o5 => open,
                 o6 => cc_s(2));

   result <= cc_co(2) & cc_o(2 downto 0);
   R <= result;
end architecture;

--------------------------------------------------------------------------------
--                        Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82
-- VHDL generated for VirtexUltrascalePlus @ 1950MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Andreas Boettcher
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 0.512821
-- Target frequency (MHz): 1950
-- Input signals: X22 X21 X20 X19 X18 X17 X16 X15 X14 X13 X12 X11 X10 X9 X8 X7 X6 X5 X4 X3 X2 X1 X0
-- Output signals: R
--  approx. input signal timings: X22: (c0, 0.000000ns)X21: (c0, 0.000000ns)X20: (c0, 0.000000ns)X19: (c0, 0.000000ns)X18: (c0, 0.000000ns)X17: (c0, 0.000000ns)X16: (c0, 0.000000ns)X15: (c0, 0.000000ns)X14: (c0, 0.000000ns)X13: (c0, 0.000000ns)X12: (c0, 0.000000ns)X11: (c0, 0.000000ns)X10: (c0, 0.000000ns)X9: (c0, 0.000000ns)X8: (c0, 0.000000ns)X7: (c0, 0.000000ns)X6: (c0, 0.000000ns)X5: (c0, 0.000000ns)X4: (c0, 0.000000ns)X3: (c0, 0.000000ns)X2: (c0, 0.000000ns)X1: (c0, 0.000000ns)X0: (c0, 0.000000ns)
--  approx. output signal timings: R: (c0, 0.539000ns)

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

entity Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82 is
    port (X22 : in  std_logic_vector(0 downto 0);
          X21 : in  std_logic_vector(2 downto 0);
          X20 : in  std_logic_vector(2 downto 0);
          X19 : in  std_logic_vector(2 downto 0);
          X18 : in  std_logic_vector(2 downto 0);
          X17 : in  std_logic_vector(2 downto 0);
          X16 : in  std_logic_vector(2 downto 0);
          X15 : in  std_logic_vector(2 downto 0);
          X14 : in  std_logic_vector(2 downto 0);
          X13 : in  std_logic_vector(2 downto 0);
          X12 : in  std_logic_vector(2 downto 0);
          X11 : in  std_logic_vector(2 downto 0);
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
          R : out  std_logic_vector(23 downto 0)   );
end entity;

architecture arch of Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82 is


signal cc_di :  std_logic_vector(23 downto 0);
   -- timing of cc_di: (c0, 0.000000ns)
signal cc_s :  std_logic_vector(23 downto 0);
   -- timing of cc_s: (c0, 0.000000ns)
signal cc_co :  std_logic_vector(23 downto 0);
   -- timing of cc_co: (c0, 0.000000ns)
signal cc_o :  std_logic_vector(23 downto 0);
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
signal c11 :  std_logic;
   -- timing of c11: (c0, 0.000000ns)
signal c12 :  std_logic;
   -- timing of c12: (c0, 0.000000ns)
signal c13 :  std_logic;
   -- timing of c13: (c0, 0.000000ns)
signal c14 :  std_logic;
   -- timing of c14: (c0, 0.000000ns)
signal c15 :  std_logic;
   -- timing of c15: (c0, 0.000000ns)
signal c16 :  std_logic;
   -- timing of c16: (c0, 0.000000ns)
signal c17 :  std_logic;
   -- timing of c17: (c0, 0.000000ns)
signal c18 :  std_logic;
   -- timing of c18: (c0, 0.000000ns)
signal c19 :  std_logic;
   -- timing of c19: (c0, 0.000000ns)
signal c20 :  std_logic;
   -- timing of c20: (c0, 0.000000ns)
signal c21 :  std_logic;
   -- timing of c21: (c0, 0.000000ns)
signal result :  std_logic_vector(23 downto 0);
   -- timing of result: (c0, 0.539000ns)
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
      generic map ( init => x"69966996fcc0fcc0")
      port map ( i0 => c10,
                 i1 => X11(0),
                 i2 => X11(1),
                 i3 => X11(2),
                 i4 => '0',
                 i5 => '1',
                 o5 => c11,
                 o6 => cc_s(11));

   cc_di(12) <= c11;
   lut12: LUT6_2
      generic map ( init => x"69966996fcc0fcc0")
      port map ( i0 => c11,
                 i1 => X12(0),
                 i2 => X12(1),
                 i3 => X12(2),
                 i4 => '0',
                 i5 => '1',
                 o5 => c12,
                 o6 => cc_s(12));

   cc3: CARRY4
      port map ( ci => cc_co(11),
                 cyinit => '0',
                 di => cc_di(15 downto 12),
                 s => cc_s(15 downto 12),
                 co => cc_co(15 downto 12),
                 o => cc_o(15 downto 12));

   cc_di(13) <= c12;
   lut13: LUT6_2
      generic map ( init => x"69966996fcc0fcc0")
      port map ( i0 => c12,
                 i1 => X13(0),
                 i2 => X13(1),
                 i3 => X13(2),
                 i4 => '0',
                 i5 => '1',
                 o5 => c13,
                 o6 => cc_s(13));

   cc_di(14) <= c13;
   lut14: LUT6_2
      generic map ( init => x"69966996fcc0fcc0")
      port map ( i0 => c13,
                 i1 => X14(0),
                 i2 => X14(1),
                 i3 => X14(2),
                 i4 => '0',
                 i5 => '1',
                 o5 => c14,
                 o6 => cc_s(14));

   cc_di(15) <= c14;
   lut15: LUT6_2
      generic map ( init => x"69966996fcc0fcc0")
      port map ( i0 => c14,
                 i1 => X15(0),
                 i2 => X15(1),
                 i3 => X15(2),
                 i4 => '0',
                 i5 => '1',
                 o5 => c15,
                 o6 => cc_s(15));

   cc_di(16) <= c15;
   lut16: LUT6_2
      generic map ( init => x"69966996fcc0fcc0")
      port map ( i0 => c15,
                 i1 => X16(0),
                 i2 => X16(1),
                 i3 => X16(2),
                 i4 => '0',
                 i5 => '1',
                 o5 => c16,
                 o6 => cc_s(16));

   cc4: CARRY4
      port map ( ci => cc_co(15),
                 cyinit => '0',
                 di => cc_di(19 downto 16),
                 s => cc_s(19 downto 16),
                 co => cc_co(19 downto 16),
                 o => cc_o(19 downto 16));

   cc_di(17) <= c16;
   lut17: LUT6_2
      generic map ( init => x"69966996fcc0fcc0")
      port map ( i0 => c16,
                 i1 => X17(0),
                 i2 => X17(1),
                 i3 => X17(2),
                 i4 => '0',
                 i5 => '1',
                 o5 => c17,
                 o6 => cc_s(17));

   cc_di(18) <= c17;
   lut18: LUT6_2
      generic map ( init => x"69966996fcc0fcc0")
      port map ( i0 => c17,
                 i1 => X18(0),
                 i2 => X18(1),
                 i3 => X18(2),
                 i4 => '0',
                 i5 => '1',
                 o5 => c18,
                 o6 => cc_s(18));

   cc_di(19) <= c18;
   lut19: LUT6_2
      generic map ( init => x"69966996fcc0fcc0")
      port map ( i0 => c18,
                 i1 => X19(0),
                 i2 => X19(1),
                 i3 => X19(2),
                 i4 => '0',
                 i5 => '1',
                 o5 => c19,
                 o6 => cc_s(19));

   cc_di(20) <= c19;
   lut20: LUT6_2
      generic map ( init => x"69966996fcc0fcc0")
      port map ( i0 => c19,
                 i1 => X20(0),
                 i2 => X20(1),
                 i3 => X20(2),
                 i4 => '0',
                 i5 => '1',
                 o5 => c20,
                 o6 => cc_s(20));

   cc5: CARRY4
      port map ( ci => cc_co(19),
                 cyinit => '0',
                 di => cc_di(23 downto 20),
                 s => cc_s(23 downto 20),
                 co => cc_co(23 downto 20),
                 o => cc_o(23 downto 20));

   cc_di(21) <= c20;
   lut21: LUT6_2
      generic map ( init => x"69966996fcc0fcc0")
      port map ( i0 => c20,
                 i1 => X21(0),
                 i2 => X21(1),
                 i3 => X21(2),
                 i4 => '0',
                 i5 => '1',
                 o5 => c21,
                 o6 => cc_s(21));

   cc_di(22) <= c21;
   lut22: LUT6_2
      generic map ( init => x"66666666aaaaaaaa")
      port map ( i0 => c21,
                 i1 => X22(0),
                 i2 => '0',
                 i3 => '0',
                 i4 => '0',
                 i5 => '1',
                 o5 => open,
                 o6 => cc_s(22));

   result <= cc_co(22) & cc_o(22 downto 0);
   R <= result;
end architecture;

--------------------------------------------------------------------------------
--                          FixMultiAdder_S_5_lsbOut_m9_uid1269
--                     (FixMultiAdder_S_5_Freq1950_uid2)
-- VHDL generated for VirtexUltrascalePlus @ 1950MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Martin Kumm (2024)
--------------------------------------------------------------------------------
-- Pipeline depth: 2 cycles
-- Clock period (ns): 0.512821
-- Target frequency (MHz): 1950
-- Input signals: X0 X1 X2 X3 X4
-- Output signals: R
--  approx. input signal timings: X0: (c0, 0.000000ns)X1: (c0, 0.000000ns)X2: (c0, 0.000000ns)X3: (c0, 0.000000ns)X4: (c0, 0.000000ns)
--  approx. output signal timings: R: (c2, 0.311359ns)

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity FixMultiAdder_S_5_lsbOut_m9_uid1269 is
    port (clk, rst, write_enable_1, write_enable_2 : in std_logic;
          R : out  std_logic_vector(21 downto 0);
          X0 : in  std_logic_vector(14 downto 0);
          X1 : in  std_logic_vector(13 downto 0);
          X2 : in  std_logic_vector(14 downto 0);
          X3 : in  std_logic_vector(14 downto 0);
          X4 : in  std_logic_vector(21 downto 0)   );
end entity;

architecture arch of FixMultiAdder_S_5_lsbOut_m9_uid1269 is
   component Compressor_FixMultiAdder_S_5_lsbOut_m9_uid12693_2_Freq1950_uid6 is
      port ( X0 : in  std_logic_vector(2 downto 0);
             R : out  std_logic_vector(1 downto 0)   );
   end component;

   component Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10 is
      port ( X12 : in  std_logic_vector(0 downto 0);
             X11 : in  std_logic_vector(2 downto 0);
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
             R : out  std_logic_vector(13 downto 0)   );
   end component;

   component Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid12693_Freq1950_uid64 is
      port ( X2 : in  std_logic_vector(0 downto 0);
             X1 : in  std_logic_vector(2 downto 0);
             X0 : in  std_logic_vector(3 downto 0);
             R : out  std_logic_vector(3 downto 0)   );
   end component;

   component Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82 is
      port ( X22 : in  std_logic_vector(0 downto 0);
             X21 : in  std_logic_vector(2 downto 0);
             X20 : in  std_logic_vector(2 downto 0);
             X19 : in  std_logic_vector(2 downto 0);
             X18 : in  std_logic_vector(2 downto 0);
             X17 : in  std_logic_vector(2 downto 0);
             X16 : in  std_logic_vector(2 downto 0);
             X15 : in  std_logic_vector(2 downto 0);
             X14 : in  std_logic_vector(2 downto 0);
             X13 : in  std_logic_vector(2 downto 0);
             X12 : in  std_logic_vector(2 downto 0);
             X11 : in  std_logic_vector(2 downto 0);
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
             R : out  std_logic_vector(23 downto 0)   );
   end component;

signal iX0_c0 :  signed(5+9 downto 0);
   -- timing of iX0_c0: (c0, 0.000000ns)
signal bh3_wm9_0_c0 :  std_logic;
   -- timing of bh3_wm9_0_c0: (c0, 0.000000ns)
signal bh3_wm8_0_c0 :  std_logic;
   -- timing of bh3_wm8_0_c0: (c0, 0.000000ns)
signal bh3_wm7_0_c0 :  std_logic;
   -- timing of bh3_wm7_0_c0: (c0, 0.000000ns)
signal bh3_wm6_0_c0 :  std_logic;
   -- timing of bh3_wm6_0_c0: (c0, 0.000000ns)
signal bh3_wm5_0_c0 :  std_logic;
   -- timing of bh3_wm5_0_c0: (c0, 0.000000ns)
signal bh3_wm4_0_c0 :  std_logic;
   -- timing of bh3_wm4_0_c0: (c0, 0.000000ns)
signal bh3_wm3_0_c0 :  std_logic;
   -- timing of bh3_wm3_0_c0: (c0, 0.000000ns)
signal bh3_wm2_0_c0 :  std_logic;
   -- timing of bh3_wm2_0_c0: (c0, 0.000000ns)
signal bh3_wm1_0_c0 :  std_logic;
   -- timing of bh3_wm1_0_c0: (c0, 0.000000ns)
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
signal iX1_c0 :  signed(4+9 downto 0);
   -- timing of iX1_c0: (c0, 0.000000ns)
signal bh3_wm9_1_c0 :  std_logic;
   -- timing of bh3_wm9_1_c0: (c0, 0.000000ns)
signal bh3_wm8_1_c0 :  std_logic;
   -- timing of bh3_wm8_1_c0: (c0, 0.000000ns)
signal bh3_wm7_1_c0 :  std_logic;
   -- timing of bh3_wm7_1_c0: (c0, 0.000000ns)
signal bh3_wm6_1_c0 :  std_logic;
   -- timing of bh3_wm6_1_c0: (c0, 0.000000ns)
signal bh3_wm5_1_c0 :  std_logic;
   -- timing of bh3_wm5_1_c0: (c0, 0.000000ns)
signal bh3_wm4_1_c0 :  std_logic;
   -- timing of bh3_wm4_1_c0: (c0, 0.000000ns)
signal bh3_wm3_1_c0 :  std_logic;
   -- timing of bh3_wm3_1_c0: (c0, 0.000000ns)
signal bh3_wm2_1_c0 :  std_logic;
   -- timing of bh3_wm2_1_c0: (c0, 0.000000ns)
signal bh3_wm1_1_c0 :  std_logic;
   -- timing of bh3_wm1_1_c0: (c0, 0.000000ns)
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
signal iX2_c0 :  signed(5+9 downto 0);
   -- timing of iX2_c0: (c0, 0.000000ns)
signal bh3_wm9_2_c0 :  std_logic;
   -- timing of bh3_wm9_2_c0: (c0, 0.000000ns)
signal bh3_wm8_2_c0 :  std_logic;
   -- timing of bh3_wm8_2_c0: (c0, 0.000000ns)
signal bh3_wm7_2_c0 :  std_logic;
   -- timing of bh3_wm7_2_c0: (c0, 0.000000ns)
signal bh3_wm6_2_c0 :  std_logic;
   -- timing of bh3_wm6_2_c0: (c0, 0.000000ns)
signal bh3_wm5_2_c0 :  std_logic;
   -- timing of bh3_wm5_2_c0: (c0, 0.000000ns)
signal bh3_wm4_2_c0 :  std_logic;
   -- timing of bh3_wm4_2_c0: (c0, 0.000000ns)
signal bh3_wm3_2_c0 :  std_logic;
   -- timing of bh3_wm3_2_c0: (c0, 0.000000ns)
signal bh3_wm2_2_c0 :  std_logic;
   -- timing of bh3_wm2_2_c0: (c0, 0.000000ns)
signal bh3_wm1_2_c0 :  std_logic;
   -- timing of bh3_wm1_2_c0: (c0, 0.000000ns)
signal bh3_w0_2_c0 :  std_logic;
   -- timing of bh3_w0_2_c0: (c0, 0.000000ns)
signal bh3_w1_2_c0 :  std_logic;
   -- timing of bh3_w1_2_c0: (c0, 0.000000ns)
signal bh3_w2_2_c0 :  std_logic;
   -- timing of bh3_w2_2_c0: (c0, 0.000000ns)
signal bh3_w3_2_c0 :  std_logic;
   -- timing of bh3_w3_2_c0: (c0, 0.000000ns)
signal bh3_w4_2_c0 :  std_logic;
   -- timing of bh3_w4_2_c0: (c0, 0.000000ns)
signal bh3_w5_1_c0 :  std_logic;
   -- timing of bh3_w5_1_c0: (c0, 0.000000ns)
signal iX3_c0 :  signed(5+9 downto 0);
   -- timing of iX3_c0: (c0, 0.000000ns)
signal bh3_wm9_3_c0 :  std_logic;
   -- timing of bh3_wm9_3_c0: (c0, 0.000000ns)
signal bh3_wm8_3_c0 :  std_logic;
   -- timing of bh3_wm8_3_c0: (c0, 0.000000ns)
signal bh3_wm7_3_c0, bh3_wm7_3_c1 :  std_logic;
   -- timing of bh3_wm7_3_c0: (c0, 0.000000ns)
signal bh3_wm6_3_c0, bh3_wm6_3_c1 :  std_logic;
   -- timing of bh3_wm6_3_c0: (c0, 0.000000ns)
signal bh3_wm5_3_c0, bh3_wm5_3_c1 :  std_logic;
   -- timing of bh3_wm5_3_c0: (c0, 0.000000ns)
signal bh3_wm4_3_c0, bh3_wm4_3_c1 :  std_logic;
   -- timing of bh3_wm4_3_c0: (c0, 0.000000ns)
signal bh3_wm3_3_c0, bh3_wm3_3_c1 :  std_logic;
   -- timing of bh3_wm3_3_c0: (c0, 0.000000ns)
signal bh3_wm2_3_c0, bh3_wm2_3_c1 :  std_logic;
   -- timing of bh3_wm2_3_c0: (c0, 0.000000ns)
signal bh3_wm1_3_c0, bh3_wm1_3_c1 :  std_logic;
   -- timing of bh3_wm1_3_c0: (c0, 0.000000ns)
signal bh3_w0_3_c0, bh3_w0_3_c1 :  std_logic;
   -- timing of bh3_w0_3_c0: (c0, 0.000000ns)
signal bh3_w1_3_c0, bh3_w1_3_c1 :  std_logic;
   -- timing of bh3_w1_3_c0: (c0, 0.000000ns)
signal bh3_w2_3_c0, bh3_w2_3_c1 :  std_logic;
   -- timing of bh3_w2_3_c0: (c0, 0.000000ns)
signal bh3_w3_3_c0, bh3_w3_3_c1 :  std_logic;
   -- timing of bh3_w3_3_c0: (c0, 0.000000ns)
signal bh3_w4_3_c0 :  std_logic;
   -- timing of bh3_w4_3_c0: (c0, 0.000000ns)
signal bh3_w5_2_c0 :  std_logic;
   -- timing of bh3_w5_2_c0: (c0, 0.000000ns)
signal iX4_c0 :  signed(12+9 downto 0);
   -- timing of iX4_c0: (c0, 0.000000ns)
signal bh3_wm9_4_c0 :  std_logic;
   -- timing of bh3_wm9_4_c0: (c0, 0.000000ns)
signal bh3_wm8_4_c0, bh3_wm8_4_c1 :  std_logic;
   -- timing of bh3_wm8_4_c0: (c0, 0.000000ns)
signal bh3_wm7_4_c0, bh3_wm7_4_c1 :  std_logic;
   -- timing of bh3_wm7_4_c0: (c0, 0.000000ns)
signal bh3_wm6_4_c0, bh3_wm6_4_c1 :  std_logic;
   -- timing of bh3_wm6_4_c0: (c0, 0.000000ns)
signal bh3_wm5_4_c0, bh3_wm5_4_c1 :  std_logic;
   -- timing of bh3_wm5_4_c0: (c0, 0.000000ns)
signal bh3_wm4_4_c0, bh3_wm4_4_c1 :  std_logic;
   -- timing of bh3_wm4_4_c0: (c0, 0.000000ns)
signal bh3_wm3_4_c0, bh3_wm3_4_c1 :  std_logic;
   -- timing of bh3_wm3_4_c0: (c0, 0.000000ns)
signal bh3_wm2_4_c0, bh3_wm2_4_c1 :  std_logic;
   -- timing of bh3_wm2_4_c0: (c0, 0.000000ns)
signal bh3_wm1_4_c0, bh3_wm1_4_c1 :  std_logic;
   -- timing of bh3_wm1_4_c0: (c0, 0.000000ns)
signal bh3_w0_4_c0, bh3_w0_4_c1 :  std_logic;
   -- timing of bh3_w0_4_c0: (c0, 0.000000ns)
signal bh3_w1_4_c0, bh3_w1_4_c1 :  std_logic;
   -- timing of bh3_w1_4_c0: (c0, 0.000000ns)
signal bh3_w2_4_c0, bh3_w2_4_c1 :  std_logic;
   -- timing of bh3_w2_4_c0: (c0, 0.000000ns)
signal bh3_w3_4_c0, bh3_w3_4_c1 :  std_logic;
   -- timing of bh3_w3_4_c0: (c0, 0.000000ns)
signal bh3_w4_4_c0 :  std_logic;
   -- timing of bh3_w4_4_c0: (c0, 0.000000ns)
signal bh3_w5_3_c0, bh3_w5_3_c1 :  std_logic;
   -- timing of bh3_w5_3_c0: (c0, 0.000000ns)
signal bh3_w6_0_c0 :  std_logic;
   -- timing of bh3_w6_0_c0: (c0, 0.000000ns)
signal bh3_w7_0_c0, bh3_w7_0_c1 :  std_logic;
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
signal bh3_w4_5_c0, bh3_w4_5_c1 :  std_logic;
   -- timing of bh3_w4_5_c0: (c0, 0.000000ns)
signal bh3_w7_1_c0, bh3_w7_1_c1 :  std_logic;
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
signal Compressor_FixMultiAdder_S_5_lsbOut_m9_uid12693_2_Freq1950_uid6_bh3_uid7_In0_c0 :  std_logic_vector(2 downto 0);
   -- timing of Compressor_FixMultiAdder_S_5_lsbOut_m9_uid12693_2_Freq1950_uid6_bh3_uid7_In0_c0: (c0, 0.000000ns)
signal Compressor_FixMultiAdder_S_5_lsbOut_m9_uid12693_2_Freq1950_uid6_bh3_uid7_Out0_c0 :  std_logic_vector(1 downto 0);
   -- timing of Compressor_FixMultiAdder_S_5_lsbOut_m9_uid12693_2_Freq1950_uid6_bh3_uid7_Out0_c0: (c0, 0.215000ns)
signal bh3_wm9_5_c0 :  std_logic;
   -- timing of bh3_wm9_5_c0: (c0, 0.215000ns)
signal bh3_wm8_5_c0, bh3_wm8_5_c1 :  std_logic;
   -- timing of bh3_wm8_5_c0: (c0, 0.215000ns)
signal Compressor_FixMultiAdder_S_5_lsbOut_m9_uid12693_2_Freq1950_uid6_bh3_uid7_Out0_copy8_c0 :  std_logic_vector(1 downto 0);
   -- timing of Compressor_FixMultiAdder_S_5_lsbOut_m9_uid12693_2_Freq1950_uid6_bh3_uid7_Out0_copy8_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_In0_c0 :  std_logic_vector(3 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_In0_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_In1_c0 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_In1_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_In2_c0 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_In2_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_In3_c0 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_In3_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_In4_c0 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_In4_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_In5_c0 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_In5_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_In6_c0 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_In6_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_In7_c0 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_In7_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_In8_c0 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_In8_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_In9_c0 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_In9_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_In10_c0 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_In10_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_In11_c0 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_In11_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_In12_c0 :  std_logic_vector(0 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_In12_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_Out0_c1 :  std_logic_vector(13 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_Out0_c0: (c1, 0.135179ns)
signal bh3_wm8_6_c1 :  std_logic;
   -- timing of bh3_wm8_6_c0: (c1, 0.135179ns)
signal bh3_wm7_5_c1 :  std_logic;
   -- timing of bh3_wm7_5_c0: (c1, 0.135179ns)
signal bh3_wm6_5_c1 :  std_logic;
   -- timing of bh3_wm6_5_c0: (c1, 0.135179ns)
signal bh3_wm5_5_c1 :  std_logic;
   -- timing of bh3_wm5_5_c0: (c1, 0.135179ns)
signal bh3_wm4_5_c1 :  std_logic;
   -- timing of bh3_wm4_5_c0: (c1, 0.135179ns)
signal bh3_wm3_5_c1 :  std_logic;
   -- timing of bh3_wm3_5_c0: (c1, 0.135179ns)
signal bh3_wm2_5_c1 :  std_logic;
   -- timing of bh3_wm2_5_c0: (c1, 0.135179ns)
signal bh3_wm1_5_c1 :  std_logic;
   -- timing of bh3_wm1_5_c0: (c1, 0.135179ns)
signal bh3_w0_5_c1 :  std_logic;
   -- timing of bh3_w0_5_c0: (c1, 0.135179ns)
signal bh3_w1_5_c1 :  std_logic;
   -- timing of bh3_w1_5_c0: (c1, 0.135179ns)
signal bh3_w2_5_c1 :  std_logic;
   -- timing of bh3_w2_5_c0: (c1, 0.135179ns)
signal bh3_w3_5_c1 :  std_logic;
   -- timing of bh3_w3_5_c0: (c1, 0.135179ns)
signal bh3_w4_6_c1 :  std_logic;
   -- timing of bh3_w4_6_c0: (c1, 0.135179ns)
signal bh3_w5_4_c1 :  std_logic;
   -- timing of bh3_w5_4_c0: (c1, 0.135179ns)
signal Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_Out0_copy62_c0, Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_Out0_copy62_c1 :  std_logic_vector(13 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_Out0_copy62_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid12693_Freq1950_uid64_bh3_uid79_In0_c0 :  std_logic_vector(3 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid12693_Freq1950_uid64_bh3_uid79_In0_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid12693_Freq1950_uid64_bh3_uid79_In1_c0 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid12693_Freq1950_uid64_bh3_uid79_In1_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid12693_Freq1950_uid64_bh3_uid79_In2_c0 :  std_logic_vector(0 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid12693_Freq1950_uid64_bh3_uid79_In2_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid12693_Freq1950_uid64_bh3_uid79_Out0_c1 :  std_logic_vector(3 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid12693_Freq1950_uid64_bh3_uid79_Out0_c0: (c1, 0.109179ns)
signal bh3_w4_7_c1 :  std_logic;
   -- timing of bh3_w4_7_c0: (c1, 0.109179ns)
signal bh3_w5_5_c1 :  std_logic;
   -- timing of bh3_w5_5_c0: (c1, 0.109179ns)
signal bh3_w6_1_c1 :  std_logic;
   -- timing of bh3_w6_1_c0: (c1, 0.109179ns)
signal bh3_w7_2_c1 :  std_logic;
   -- timing of bh3_w7_2_c0: (c1, 0.109179ns)
signal Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid12693_Freq1950_uid64_bh3_uid79_Out0_copy80_c0, Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid12693_Freq1950_uid64_bh3_uid79_Out0_copy80_c1 :  std_logic_vector(3 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid12693_Freq1950_uid64_bh3_uid79_Out0_copy80_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In0_c0, Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In0_c1 :  std_logic_vector(3 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In0_c0: (c0, 0.215000ns)
signal Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In1_c1 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In1_c0: (c1, 0.135179ns)
signal Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In2_c1 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In2_c0: (c1, 0.135179ns)
signal Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In3_c1 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In3_c0: (c1, 0.135179ns)
signal Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In4_c1 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In4_c0: (c1, 0.135179ns)
signal Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In5_c1 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In5_c0: (c1, 0.135179ns)
signal Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In6_c1 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In6_c0: (c1, 0.135179ns)
signal Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In7_c1 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In7_c0: (c1, 0.135179ns)
signal Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In8_c1 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In8_c0: (c1, 0.135179ns)
signal Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In9_c1 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In9_c0: (c1, 0.135179ns)
signal Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In10_c1 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In10_c0: (c1, 0.135179ns)
signal Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In11_c1 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In11_c0: (c1, 0.135179ns)
signal Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In12_c1 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In12_c0: (c1, 0.135179ns)
signal Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In13_c1 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In13_c0: (c1, 0.135179ns)
signal Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In14_c1 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In14_c0: (c1, 0.135179ns)
signal Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In15_c1 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In15_c0: (c1, 0.109179ns)
signal Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In16_c1 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In16_c0: (c1, 0.109179ns)
signal Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In17_c0, Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In17_c1 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In17_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In18_c0, Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In18_c1 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In18_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In19_c0, Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In19_c1 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In19_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In20_c0, Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In20_c1 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In20_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In21_c0, Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In21_c1 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In21_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In22_c0, Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In22_c1 :  std_logic_vector(0 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In22_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_Out0_c2 :  std_logic_vector(23 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_Out0_c0: (c2, 0.311359ns)
signal bh3_wm9_6_c2 :  std_logic;
   -- timing of bh3_wm9_6_c0: (c2, 0.311359ns)
signal bh3_wm8_7_c2 :  std_logic;
   -- timing of bh3_wm8_7_c0: (c2, 0.311359ns)
signal bh3_wm7_6_c2 :  std_logic;
   -- timing of bh3_wm7_6_c0: (c2, 0.311359ns)
signal bh3_wm6_6_c2 :  std_logic;
   -- timing of bh3_wm6_6_c0: (c2, 0.311359ns)
signal bh3_wm5_6_c2 :  std_logic;
   -- timing of bh3_wm5_6_c0: (c2, 0.311359ns)
signal bh3_wm4_6_c2 :  std_logic;
   -- timing of bh3_wm4_6_c0: (c2, 0.311359ns)
signal bh3_wm3_6_c2 :  std_logic;
   -- timing of bh3_wm3_6_c0: (c2, 0.311359ns)
signal bh3_wm2_6_c2 :  std_logic;
   -- timing of bh3_wm2_6_c0: (c2, 0.311359ns)
signal bh3_wm1_6_c2 :  std_logic;
   -- timing of bh3_wm1_6_c0: (c2, 0.311359ns)
signal bh3_w0_6_c2 :  std_logic;
   -- timing of bh3_w0_6_c0: (c2, 0.311359ns)
signal bh3_w1_6_c2 :  std_logic;
   -- timing of bh3_w1_6_c0: (c2, 0.311359ns)
signal bh3_w2_6_c2 :  std_logic;
   -- timing of bh3_w2_6_c0: (c2, 0.311359ns)
signal bh3_w3_6_c2 :  std_logic;
   -- timing of bh3_w3_6_c0: (c2, 0.311359ns)
signal bh3_w4_8_c2 :  std_logic;
   -- timing of bh3_w4_8_c0: (c2, 0.311359ns)
signal bh3_w5_6_c2 :  std_logic;
   -- timing of bh3_w5_6_c0: (c2, 0.311359ns)
signal bh3_w6_2_c2 :  std_logic;
   -- timing of bh3_w6_2_c0: (c2, 0.311359ns)
signal bh3_w7_3_c2 :  std_logic;
   -- timing of bh3_w7_3_c0: (c2, 0.311359ns)
signal bh3_w8_2_c2 :  std_logic;
   -- timing of bh3_w8_2_c0: (c2, 0.311359ns)
signal bh3_w9_2_c2 :  std_logic;
   -- timing of bh3_w9_2_c0: (c2, 0.311359ns)
signal bh3_w10_2_c2 :  std_logic;
   -- timing of bh3_w10_2_c0: (c2, 0.311359ns)
signal bh3_w11_2_c2 :  std_logic;
   -- timing of bh3_w11_2_c0: (c2, 0.311359ns)
signal bh3_w12_2_c2 :  std_logic;
   -- timing of bh3_w12_2_c0: (c2, 0.311359ns)
signal Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_Out0_copy168_c1, Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_Out0_copy168_c2 :  std_logic_vector(23 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_Out0_copy168_c0: (c1, 0.135179ns)
signal tmp_bitheapResult_bh3_21_c2 :  std_logic_vector(21 downto 0);
   -- timing of tmp_bitheapResult_bh3_21_c0: (c2, 0.311359ns)
signal bitheapResult_bh3_c2 :  std_logic_vector(21 downto 0);
   -- timing of bitheapResult_bh3_c0: (c2, 0.311359ns)
signal OutRes_c2 :  std_logic_vector(21 downto 0);
   -- timing of OutRes_c0: (c2, 0.311359ns)
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            if write_enable_1 = '1' then
            end if;
            if write_enable_2 = '1' then
            end if;
         end if;
      end process;
   process(clk, rst)
      begin
         if rst = '1' then
               bh3_wm7_3_c1 <= '0';
               bh3_wm6_3_c1 <= '0';
               bh3_wm5_3_c1 <= '0';
               bh3_wm4_3_c1 <= '0';
               bh3_wm3_3_c1 <= '0';
               bh3_wm2_3_c1 <= '0';
               bh3_wm1_3_c1 <= '0';
               bh3_w0_3_c1 <= '0';
               bh3_w1_3_c1 <= '0';
               bh3_w2_3_c1 <= '0';
               bh3_w3_3_c1 <= '0';
               bh3_wm8_4_c1 <= '0';
               bh3_wm7_4_c1 <= '0';
               bh3_wm6_4_c1 <= '0';
               bh3_wm5_4_c1 <= '0';
               bh3_wm4_4_c1 <= '0';
               bh3_wm3_4_c1 <= '0';
               bh3_wm2_4_c1 <= '0';
               bh3_wm1_4_c1 <= '0';
               bh3_w0_4_c1 <= '0';
               bh3_w1_4_c1 <= '0';
               bh3_w2_4_c1 <= '0';
               bh3_w3_4_c1 <= '0';
               bh3_w5_3_c1 <= '0';
               bh3_w7_0_c1 <= '0';
               bh3_w4_5_c1 <= '0';
               bh3_w7_1_c1 <= '0';
               bh3_wm8_5_c1 <= '0';
               Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_Out0_copy62_c1 <= (others => '0');
               Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid12693_Freq1950_uid64_bh3_uid79_Out0_copy80_c1 <= (others => '0');
               Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In0_c1 <= (others => '0');
               Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In17_c1 <= (others => '0');
               Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In18_c1 <= (others => '0');
               Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In19_c1 <= (others => '0');
               Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In20_c1 <= (others => '0');
               Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In21_c1 <= (others => '0');
               Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In22_c1 <= (others => '0');
               Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_Out0_copy168_c2 <= (others => '0');
         elsif clk'event and clk = '1' then
            if write_enable_1 = '1' then
               bh3_wm7_3_c1 <= bh3_wm7_3_c0;
               bh3_wm6_3_c1 <= bh3_wm6_3_c0;
               bh3_wm5_3_c1 <= bh3_wm5_3_c0;
               bh3_wm4_3_c1 <= bh3_wm4_3_c0;
               bh3_wm3_3_c1 <= bh3_wm3_3_c0;
               bh3_wm2_3_c1 <= bh3_wm2_3_c0;
               bh3_wm1_3_c1 <= bh3_wm1_3_c0;
               bh3_w0_3_c1 <= bh3_w0_3_c0;
               bh3_w1_3_c1 <= bh3_w1_3_c0;
               bh3_w2_3_c1 <= bh3_w2_3_c0;
               bh3_w3_3_c1 <= bh3_w3_3_c0;
               bh3_wm8_4_c1 <= bh3_wm8_4_c0;
               bh3_wm7_4_c1 <= bh3_wm7_4_c0;
               bh3_wm6_4_c1 <= bh3_wm6_4_c0;
               bh3_wm5_4_c1 <= bh3_wm5_4_c0;
               bh3_wm4_4_c1 <= bh3_wm4_4_c0;
               bh3_wm3_4_c1 <= bh3_wm3_4_c0;
               bh3_wm2_4_c1 <= bh3_wm2_4_c0;
               bh3_wm1_4_c1 <= bh3_wm1_4_c0;
               bh3_w0_4_c1 <= bh3_w0_4_c0;
               bh3_w1_4_c1 <= bh3_w1_4_c0;
               bh3_w2_4_c1 <= bh3_w2_4_c0;
               bh3_w3_4_c1 <= bh3_w3_4_c0;
               bh3_w5_3_c1 <= bh3_w5_3_c0;
               bh3_w7_0_c1 <= bh3_w7_0_c0;
               bh3_w4_5_c1 <= bh3_w4_5_c0;
               bh3_w7_1_c1 <= bh3_w7_1_c0;
               bh3_wm8_5_c1 <= bh3_wm8_5_c0;
               Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_Out0_copy62_c1 <= Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_Out0_copy62_c0;
               Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid12693_Freq1950_uid64_bh3_uid79_Out0_copy80_c1 <= Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid12693_Freq1950_uid64_bh3_uid79_Out0_copy80_c0;
               Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In0_c1 <= Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In0_c0;
               Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In17_c1 <= Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In17_c0;
               Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In18_c1 <= Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In18_c0;
               Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In19_c1 <= Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In19_c0;
               Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In20_c1 <= Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In20_c0;
               Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In21_c1 <= Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In21_c0;
               Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In22_c1 <= Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In22_c0;
            end if;
            if write_enable_2 = '1' then
               Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_Out0_copy168_c2 <= Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_Out0_copy168_c1;
            end if;
         end if;
      end process;
   iX0_c0 <= signed(X0);
   bh3_wm9_0_c0 <= iX0_c0(0);
   bh3_wm8_0_c0 <= iX0_c0(1);
   bh3_wm7_0_c0 <= iX0_c0(2);
   bh3_wm6_0_c0 <= iX0_c0(3);
   bh3_wm5_0_c0 <= iX0_c0(4);
   bh3_wm4_0_c0 <= iX0_c0(5);
   bh3_wm3_0_c0 <= iX0_c0(6);
   bh3_wm2_0_c0 <= iX0_c0(7);
   bh3_wm1_0_c0 <= iX0_c0(8);
   bh3_w0_0_c0 <= iX0_c0(9);
   bh3_w1_0_c0 <= iX0_c0(10);
   bh3_w2_0_c0 <= iX0_c0(11);
   bh3_w3_0_c0 <= iX0_c0(12);
   bh3_w4_0_c0 <= iX0_c0(13);
   bh3_w5_0_c0 <= not iX0_c0(14);
   iX1_c0 <= signed(X1);
   bh3_wm9_1_c0 <= iX1_c0(0);
   bh3_wm8_1_c0 <= iX1_c0(1);
   bh3_wm7_1_c0 <= iX1_c0(2);
   bh3_wm6_1_c0 <= iX1_c0(3);
   bh3_wm5_1_c0 <= iX1_c0(4);
   bh3_wm4_1_c0 <= iX1_c0(5);
   bh3_wm3_1_c0 <= iX1_c0(6);
   bh3_wm2_1_c0 <= iX1_c0(7);
   bh3_wm1_1_c0 <= iX1_c0(8);
   bh3_w0_1_c0 <= iX1_c0(9);
   bh3_w1_1_c0 <= iX1_c0(10);
   bh3_w2_1_c0 <= iX1_c0(11);
   bh3_w3_1_c0 <= iX1_c0(12);
   bh3_w4_1_c0 <= not iX1_c0(13);
   iX2_c0 <= signed(X2);
   bh3_wm9_2_c0 <= iX2_c0(0);
   bh3_wm8_2_c0 <= iX2_c0(1);
   bh3_wm7_2_c0 <= iX2_c0(2);
   bh3_wm6_2_c0 <= iX2_c0(3);
   bh3_wm5_2_c0 <= iX2_c0(4);
   bh3_wm4_2_c0 <= iX2_c0(5);
   bh3_wm3_2_c0 <= iX2_c0(6);
   bh3_wm2_2_c0 <= iX2_c0(7);
   bh3_wm1_2_c0 <= iX2_c0(8);
   bh3_w0_2_c0 <= iX2_c0(9);
   bh3_w1_2_c0 <= iX2_c0(10);
   bh3_w2_2_c0 <= iX2_c0(11);
   bh3_w3_2_c0 <= iX2_c0(12);
   bh3_w4_2_c0 <= iX2_c0(13);
   bh3_w5_1_c0 <= not iX2_c0(14);
   iX3_c0 <= signed(X3);
   bh3_wm9_3_c0 <= iX3_c0(0);
   bh3_wm8_3_c0 <= iX3_c0(1);
   bh3_wm7_3_c0 <= iX3_c0(2);
   bh3_wm6_3_c0 <= iX3_c0(3);
   bh3_wm5_3_c0 <= iX3_c0(4);
   bh3_wm4_3_c0 <= iX3_c0(5);
   bh3_wm3_3_c0 <= iX3_c0(6);
   bh3_wm2_3_c0 <= iX3_c0(7);
   bh3_wm1_3_c0 <= iX3_c0(8);
   bh3_w0_3_c0 <= iX3_c0(9);
   bh3_w1_3_c0 <= iX3_c0(10);
   bh3_w2_3_c0 <= iX3_c0(11);
   bh3_w3_3_c0 <= iX3_c0(12);
   bh3_w4_3_c0 <= iX3_c0(13);
   bh3_w5_2_c0 <= not iX3_c0(14);
   iX4_c0 <= signed(X4);
   bh3_wm9_4_c0 <= iX4_c0(0);
   bh3_wm8_4_c0 <= iX4_c0(1);
   bh3_wm7_4_c0 <= iX4_c0(2);
   bh3_wm6_4_c0 <= iX4_c0(3);
   bh3_wm5_4_c0 <= iX4_c0(4);
   bh3_wm4_4_c0 <= iX4_c0(5);
   bh3_wm3_4_c0 <= iX4_c0(6);
   bh3_wm2_4_c0 <= iX4_c0(7);
   bh3_wm1_4_c0 <= iX4_c0(8);
   bh3_w0_4_c0 <= iX4_c0(9);
   bh3_w1_4_c0 <= iX4_c0(10);
   bh3_w2_4_c0 <= iX4_c0(11);
   bh3_w3_4_c0 <= iX4_c0(12);
   bh3_w4_4_c0 <= iX4_c0(13);
   bh3_w5_3_c0 <= iX4_c0(14);
   bh3_w6_0_c0 <= iX4_c0(15);
   bh3_w7_0_c0 <= iX4_c0(16);
   bh3_w8_0_c0 <= iX4_c0(17);
   bh3_w9_0_c0 <= iX4_c0(18);
   bh3_w10_0_c0 <= iX4_c0(19);
   bh3_w11_0_c0 <= iX4_c0(20);
   bh3_w12_0_c0 <= iX4_c0(21);

   -- Adding the constant bits 
   bh3_w4_5_c0 <= '1';
   bh3_w7_1_c0 <= '1';
   bh3_w8_1_c0 <= '1';
   bh3_w9_1_c0 <= '1';
   bh3_w10_1_c0 <= '1';
   bh3_w11_1_c0 <= '1';
   bh3_w12_1_c0 <= '1';


   Compressor_FixMultiAdder_S_5_lsbOut_m9_uid12693_2_Freq1950_uid6_bh3_uid7_In0_c0 <= "" & bh3_wm9_0_c0 & bh3_wm9_1_c0 & bh3_wm9_2_c0;
   bh3_wm9_5_c0 <= Compressor_FixMultiAdder_S_5_lsbOut_m9_uid12693_2_Freq1950_uid6_bh3_uid7_Out0_c0(0);
   bh3_wm8_5_c0 <= Compressor_FixMultiAdder_S_5_lsbOut_m9_uid12693_2_Freq1950_uid6_bh3_uid7_Out0_c0(1);
   Compressor_FixMultiAdder_S_5_lsbOut_m9_uid12693_2_Freq1950_uid6_uid7: Compressor_FixMultiAdder_S_5_lsbOut_m9_uid12693_2_Freq1950_uid6
      port map ( X0 => Compressor_FixMultiAdder_S_5_lsbOut_m9_uid12693_2_Freq1950_uid6_bh3_uid7_In0_c0,
                 R => Compressor_FixMultiAdder_S_5_lsbOut_m9_uid12693_2_Freq1950_uid6_bh3_uid7_Out0_copy8_c0);
   Compressor_FixMultiAdder_S_5_lsbOut_m9_uid12693_2_Freq1950_uid6_bh3_uid7_Out0_c0 <= Compressor_FixMultiAdder_S_5_lsbOut_m9_uid12693_2_Freq1950_uid6_bh3_uid7_Out0_copy8_c0; -- output copy to hold a pipeline register if needed


   Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_In0_c0 <= "" & bh3_wm8_0_c0 & bh3_wm8_1_c0 & bh3_wm8_2_c0 & bh3_wm8_3_c0;
   Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_In1_c0 <= "" & bh3_wm7_0_c0 & bh3_wm7_1_c0 & bh3_wm7_2_c0;
   Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_In2_c0 <= "" & bh3_wm6_0_c0 & bh3_wm6_1_c0 & bh3_wm6_2_c0;
   Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_In3_c0 <= "" & bh3_wm5_0_c0 & bh3_wm5_1_c0 & bh3_wm5_2_c0;
   Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_In4_c0 <= "" & bh3_wm4_0_c0 & bh3_wm4_1_c0 & bh3_wm4_2_c0;
   Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_In5_c0 <= "" & bh3_wm3_0_c0 & bh3_wm3_1_c0 & bh3_wm3_2_c0;
   Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_In6_c0 <= "" & bh3_wm2_0_c0 & bh3_wm2_1_c0 & bh3_wm2_2_c0;
   Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_In7_c0 <= "" & bh3_wm1_0_c0 & bh3_wm1_1_c0 & bh3_wm1_2_c0;
   Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_In8_c0 <= "" & bh3_w0_0_c0 & bh3_w0_1_c0 & bh3_w0_2_c0;
   Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_In9_c0 <= "" & bh3_w1_0_c0 & bh3_w1_1_c0 & bh3_w1_2_c0;
   Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_In10_c0 <= "" & bh3_w2_0_c0 & bh3_w2_1_c0 & bh3_w2_2_c0;
   Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_In11_c0 <= "" & bh3_w3_0_c0 & bh3_w3_1_c0 & bh3_w3_2_c0;
   Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_In12_c0 <= "" & bh3_w4_0_c0;
   bh3_wm8_6_c1 <= Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_Out0_c1(0);
   bh3_wm7_5_c1 <= Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_Out0_c1(1);
   bh3_wm6_5_c1 <= Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_Out0_c1(2);
   bh3_wm5_5_c1 <= Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_Out0_c1(3);
   bh3_wm4_5_c1 <= Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_Out0_c1(4);
   bh3_wm3_5_c1 <= Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_Out0_c1(5);
   bh3_wm2_5_c1 <= Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_Out0_c1(6);
   bh3_wm1_5_c1 <= Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_Out0_c1(7);
   bh3_w0_5_c1 <= Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_Out0_c1(8);
   bh3_w1_5_c1 <= Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_Out0_c1(9);
   bh3_w2_5_c1 <= Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_Out0_c1(10);
   bh3_w3_5_c1 <= Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_Out0_c1(11);
   bh3_w4_6_c1 <= Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_Out0_c1(12);
   bh3_w5_4_c1 <= Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_Out0_c1(13);
   Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_uid61: Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10
      port map ( X0 => Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_In0_c0,
                 X1 => Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_In1_c0,
                 X10 => Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_In10_c0,
                 X11 => Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_In11_c0,
                 X12 => Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_In12_c0,
                 X2 => Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_In2_c0,
                 X3 => Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_In3_c0,
                 X4 => Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_In4_c0,
                 X5 => Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_In5_c0,
                 X6 => Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_In6_c0,
                 X7 => Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_In7_c0,
                 X8 => Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_In8_c0,
                 X9 => Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_In9_c0,
                 R => Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_Out0_copy62_c0);
   Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_Out0_c1 <= Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126913_Freq1950_uid10_bh3_uid61_Out0_copy62_c1; -- output copy to hold a pipeline register if needed


   Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid12693_Freq1950_uid64_bh3_uid79_In0_c0 <= "" & bh3_w4_1_c0 & bh3_w4_2_c0 & bh3_w4_3_c0 & bh3_w4_4_c0;
   Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid12693_Freq1950_uid64_bh3_uid79_In1_c0 <= "" & bh3_w5_0_c0 & bh3_w5_1_c0 & bh3_w5_2_c0;
   Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid12693_Freq1950_uid64_bh3_uid79_In2_c0 <= "" & bh3_w6_0_c0;
   bh3_w4_7_c1 <= Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid12693_Freq1950_uid64_bh3_uid79_Out0_c1(0);
   bh3_w5_5_c1 <= Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid12693_Freq1950_uid64_bh3_uid79_Out0_c1(1);
   bh3_w6_1_c1 <= Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid12693_Freq1950_uid64_bh3_uid79_Out0_c1(2);
   bh3_w7_2_c1 <= Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid12693_Freq1950_uid64_bh3_uid79_Out0_c1(3);
   Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid12693_Freq1950_uid64_uid79: Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid12693_Freq1950_uid64
      port map ( X0 => Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid12693_Freq1950_uid64_bh3_uid79_In0_c0,
                 X1 => Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid12693_Freq1950_uid64_bh3_uid79_In1_c0,
                 X2 => Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid12693_Freq1950_uid64_bh3_uid79_In2_c0,
                 R => Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid12693_Freq1950_uid64_bh3_uid79_Out0_copy80_c0);
   Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid12693_Freq1950_uid64_bh3_uid79_Out0_c1 <= Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid12693_Freq1950_uid64_bh3_uid79_Out0_copy80_c1; -- output copy to hold a pipeline register if needed


   Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In0_c0 <= "" & bh3_wm9_3_c0 & bh3_wm9_4_c0 & bh3_wm9_5_c0 & "0";
   Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In1_c1 <= "" & bh3_wm8_4_c1 & bh3_wm8_5_c1 & bh3_wm8_6_c1;
   Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In2_c1 <= "" & bh3_wm7_3_c1 & bh3_wm7_4_c1 & bh3_wm7_5_c1;
   Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In3_c1 <= "" & bh3_wm6_3_c1 & bh3_wm6_4_c1 & bh3_wm6_5_c1;
   Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In4_c1 <= "" & bh3_wm5_3_c1 & bh3_wm5_4_c1 & bh3_wm5_5_c1;
   Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In5_c1 <= "" & bh3_wm4_3_c1 & bh3_wm4_4_c1 & bh3_wm4_5_c1;
   Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In6_c1 <= "" & bh3_wm3_3_c1 & bh3_wm3_4_c1 & bh3_wm3_5_c1;
   Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In7_c1 <= "" & bh3_wm2_3_c1 & bh3_wm2_4_c1 & bh3_wm2_5_c1;
   Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In8_c1 <= "" & bh3_wm1_3_c1 & bh3_wm1_4_c1 & bh3_wm1_5_c1;
   Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In9_c1 <= "" & bh3_w0_3_c1 & bh3_w0_4_c1 & bh3_w0_5_c1;
   Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In10_c1 <= "" & bh3_w1_3_c1 & bh3_w1_4_c1 & bh3_w1_5_c1;
   Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In11_c1 <= "" & bh3_w2_3_c1 & bh3_w2_4_c1 & bh3_w2_5_c1;
   Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In12_c1 <= "" & bh3_w3_3_c1 & bh3_w3_4_c1 & bh3_w3_5_c1;
   Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In13_c1 <= "" & bh3_w4_5_c1 & bh3_w4_7_c1 & bh3_w4_6_c1;
   Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In14_c1 <= "" & bh3_w5_3_c1 & bh3_w5_5_c1 & bh3_w5_4_c1;
   Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In15_c1 <= "" & bh3_w6_1_c1 & "0" & "0";
   Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In16_c1 <= "" & bh3_w7_0_c1 & bh3_w7_1_c1 & bh3_w7_2_c1;
   Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In17_c0 <= "" & bh3_w8_0_c0 & bh3_w8_1_c0 & "0";
   Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In18_c0 <= "" & bh3_w9_0_c0 & bh3_w9_1_c0 & "0";
   Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In19_c0 <= "" & bh3_w10_0_c0 & bh3_w10_1_c0 & "0";
   Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In20_c0 <= "" & bh3_w11_0_c0 & bh3_w11_1_c0 & "0";
   Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In21_c0 <= "" & bh3_w12_0_c0 & bh3_w12_1_c0 & "0";
   Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In22_c0 <= "" & "0";
   bh3_wm9_6_c2 <= Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_Out0_c2(0);
   bh3_wm8_7_c2 <= Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_Out0_c2(1);
   bh3_wm7_6_c2 <= Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_Out0_c2(2);
   bh3_wm6_6_c2 <= Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_Out0_c2(3);
   bh3_wm5_6_c2 <= Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_Out0_c2(4);
   bh3_wm4_6_c2 <= Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_Out0_c2(5);
   bh3_wm3_6_c2 <= Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_Out0_c2(6);
   bh3_wm2_6_c2 <= Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_Out0_c2(7);
   bh3_wm1_6_c2 <= Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_Out0_c2(8);
   bh3_w0_6_c2 <= Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_Out0_c2(9);
   bh3_w1_6_c2 <= Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_Out0_c2(10);
   bh3_w2_6_c2 <= Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_Out0_c2(11);
   bh3_w3_6_c2 <= Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_Out0_c2(12);
   bh3_w4_8_c2 <= Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_Out0_c2(13);
   bh3_w5_6_c2 <= Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_Out0_c2(14);
   bh3_w6_2_c2 <= Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_Out0_c2(15);
   bh3_w7_3_c2 <= Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_Out0_c2(16);
   bh3_w8_2_c2 <= Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_Out0_c2(17);
   bh3_w9_2_c2 <= Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_Out0_c2(18);
   bh3_w10_2_c2 <= Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_Out0_c2(19);
   bh3_w11_2_c2 <= Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_Out0_c2(20);
   bh3_w12_2_c2 <= Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_Out0_c2(21);
   Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_uid167: Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82
      port map ( X0 => Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In0_c1,
                 X1 => Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In1_c1,
                 X10 => Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In10_c1,
                 X11 => Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In11_c1,
                 X12 => Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In12_c1,
                 X13 => Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In13_c1,
                 X14 => Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In14_c1,
                 X15 => Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In15_c1,
                 X16 => Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In16_c1,
                 X17 => Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In17_c1,
                 X18 => Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In18_c1,
                 X19 => Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In19_c1,
                 X2 => Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In2_c1,
                 X20 => Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In20_c1,
                 X21 => Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In21_c1,
                 X22 => Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In22_c1,
                 X3 => Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In3_c1,
                 X4 => Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In4_c1,
                 X5 => Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In5_c1,
                 X6 => Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In6_c1,
                 X7 => Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In7_c1,
                 X8 => Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In8_c1,
                 X9 => Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_In9_c1,
                 R => Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_Out0_copy168_c1);
   Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_Out0_c2 <= Row_Adder_FixMultiAdder_S_5_lsbOut_m9_uid126923_Freq1950_uid82_bh3_uid167_Out0_copy168_c2; -- output copy to hold a pipeline register if needed

   tmp_bitheapResult_bh3_21_c2 <= bh3_w12_2_c2 & bh3_w11_2_c2 & bh3_w10_2_c2 & bh3_w9_2_c2 & bh3_w8_2_c2 & bh3_w7_3_c2 & bh3_w6_2_c2 & bh3_w5_6_c2 & bh3_w4_8_c2 & bh3_w3_6_c2 & bh3_w2_6_c2 & bh3_w1_6_c2 & bh3_w0_6_c2 & bh3_wm1_6_c2 & bh3_wm2_6_c2 & bh3_wm3_6_c2 & bh3_wm4_6_c2 & bh3_wm5_6_c2 & bh3_wm6_6_c2 & bh3_wm7_6_c2 & bh3_wm8_7_c2 & bh3_wm9_6_c2;
   bitheapResult_bh3_c2 <= tmp_bitheapResult_bh3_21_c2;
   OutRes_c2 <= bitheapResult_bh3_c2;
   R <= OutRes_c2(21 downto 0);
end architecture;

