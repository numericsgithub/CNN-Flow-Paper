--------------------------------------------------------------------------------
--                        XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid6
-- VHDL generated for VirtexUltrascalePlus @ 950MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 1.05263
-- Target frequency (MHz): 950
-- Input signals: X2 X0
-- Output signals: R
--  approx. input signal timings: X2: (c0, 0.000000ns)X0: (c0, 0.000000ns)
--  approx. output signal timings: R: (c0, 1.228000ns)

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

entity XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid6 is
    port (X2 : in  std_logic_vector(5 downto 0);
          X0 : in  std_logic_vector(6 downto 0);
          R : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid6 is


signal cc_di :  std_logic_vector(3 downto 0);
   -- timing of cc_di: (c0, 0.000000ns)
signal cc_s :  std_logic_vector(3 downto 0);
   -- timing of cc_s: (c0, 0.000000ns)
signal cc_co :  std_logic_vector(3 downto 0);
   -- timing of cc_co: (c0, 0.000000ns)
signal cc_o :  std_logic_vector(3 downto 0);
   -- timing of cc_o: (c0, 0.000000ns)
signal result :  std_logic_vector(4 downto 0);
   -- timing of result: (c0, 1.228000ns)
begin
   lut0: LUT6_2
      generic map ( init => x"6996966996696996")
      port map ( i0 => X0(0),
                 i1 => X0(1),
                 i2 => X0(2),
                 i3 => X0(3),
                 i4 => X0(4),
                 i5 => X0(5),
                 o5 => cc_di(0),
                 o6 => cc_s(0));

   lut1: LUT6_2
      generic map ( init => x"177E7EE8FFF0F000")
      port map ( i0 => X0(0),
                 i1 => X0(1),
                 i2 => X0(2),
                 i3 => X0(3),
                 i4 => X0(4),
                 i5 => '1',
                 o5 => cc_di(1),
                 o6 => cc_s(1));

   cc_di(2) <= X2(0);
   lut2: LUT6_2
      generic map ( init => x"6996966996696996")
      port map ( i0 => X2(0),
                 i1 => X2(1),
                 i2 => X2(2),
                 i3 => X2(3),
                 i4 => X2(4),
                 i5 => X2(5),
                 o5 => open,
                 o6 => cc_s(2));

   lut3: LUT6_2
      generic map ( init => x"177E7EE8FFF0F000")
      port map ( i0 => X2(1),
                 i1 => X2(2),
                 i2 => X2(3),
                 i3 => X2(4),
                 i4 => X2(5),
                 i5 => '1',
                 o5 => cc_di(3),
                 o6 => cc_s(3));

   cc: CARRY4
      port map ( ci => '0',
                 cyinit => X0(6),
                 di => cc_di,
                 s => cc_s,
                 co => cc_co,
                 o => cc_o);

   result <= cc_co(3) & cc_o;
   R <= result;
end architecture;

--------------------------------------------------------------------------------
--                        Compressor_FixMultiAdder_S_17_lsbOut_m11_uid2645_3_Freq950_uid18
-- VHDL generated for VirtexUltrascalePlus @ 950MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 1.05263
-- Target frequency (MHz): 950
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

entity Compressor_FixMultiAdder_S_17_lsbOut_m11_uid2645_3_Freq950_uid18 is
    port (X0 : in  std_logic_vector(4 downto 0);
          R : out  std_logic_vector(2 downto 0)   );
end entity;

architecture arch of Compressor_FixMultiAdder_S_17_lsbOut_m11_uid2645_3_Freq950_uid18 is
signal X :  std_logic_vector(4 downto 0);
   -- timing of X: (c0, 0.000000ns)
signal R0 :  std_logic_vector(2 downto 0);
   -- timing of R0: (c0, 0.215000ns)
begin
   X <= X0 ;

   with X  select  R0 <= 
      "000" when "00000",
      "001" when "00001" | "00010" | "00100" | "01000" | "10000",
      "010" when "00011" | "00101" | "00110" | "01001" | "01010" | "01100" | "10001" | "10010" | "10100" | "11000",
      "011" when "00111" | "01011" | "01101" | "01110" | "10011" | "10101" | "10110" | "11001" | "11010" | "11100",
      "100" when "01111" | "10111" | "11011" | "11101" | "11110",
      "101" when "11111",
      "---" when others;
   R <= R0;
end architecture;

--------------------------------------------------------------------------------
--                         Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22
-- VHDL generated for VirtexUltrascalePlus @ 950MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Andreas Boettcher
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 1.05263
-- Target frequency (MHz): 950
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

entity Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22 is
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

architecture arch of Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22 is


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
--                       XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid76
-- VHDL generated for VirtexUltrascalePlus @ 950MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 1.05263
-- Target frequency (MHz): 950
-- Input signals: X2 X0
-- Output signals: R
--  approx. input signal timings: X2: (c0, 0.000000ns)X0: (c0, 0.000000ns)
--  approx. output signal timings: R: (c0, 1.228000ns)

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

entity XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid76 is
    port (X2 : in  std_logic_vector(5 downto 0);
          X0 : in  std_logic_vector(6 downto 0);
          R : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid76 is


signal cc_di :  std_logic_vector(3 downto 0);
   -- timing of cc_di: (c0, 0.000000ns)
signal cc_s :  std_logic_vector(3 downto 0);
   -- timing of cc_s: (c0, 0.000000ns)
signal cc_co :  std_logic_vector(3 downto 0);
   -- timing of cc_co: (c0, 0.000000ns)
signal cc_o :  std_logic_vector(3 downto 0);
   -- timing of cc_o: (c0, 0.000000ns)
signal result :  std_logic_vector(4 downto 0);
   -- timing of result: (c0, 1.228000ns)
begin
   lut0: LUT6_2
      generic map ( init => x"6996966996696996")
      port map ( i0 => X0(0),
                 i1 => X0(1),
                 i2 => X0(2),
                 i3 => X0(3),
                 i4 => X0(4),
                 i5 => X0(5),
                 o5 => cc_di(0),
                 o6 => cc_s(0));

   lut1: LUT6_2
      generic map ( init => x"177E7EE8FFF0F000")
      port map ( i0 => X0(0),
                 i1 => X0(1),
                 i2 => X0(2),
                 i3 => X0(3),
                 i4 => X0(4),
                 i5 => '1',
                 o5 => cc_di(1),
                 o6 => cc_s(1));

   cc_di(2) <= X2(0);
   lut2: LUT6_2
      generic map ( init => x"6996966996696996")
      port map ( i0 => X2(0),
                 i1 => X2(1),
                 i2 => X2(2),
                 i3 => X2(3),
                 i4 => X2(4),
                 i5 => X2(5),
                 o5 => open,
                 o6 => cc_s(2));

   lut3: LUT6_2
      generic map ( init => x"177E7EE8FFF0F000")
      port map ( i0 => X2(1),
                 i1 => X2(2),
                 i2 => X2(3),
                 i3 => X2(4),
                 i4 => X2(5),
                 i5 => '1',
                 o5 => cc_di(3),
                 o6 => cc_s(3));

   cc: CARRY4
      port map ( ci => '0',
                 cyinit => X0(6),
                 di => cc_di,
                 s => cc_s,
                 co => cc_co,
                 o => cc_o);

   result <= cc_co(3) & cc_o;
   R <= result;
end architecture;

--------------------------------------------------------------------------------
--                       XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid88
-- VHDL generated for VirtexUltrascalePlus @ 950MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 1.05263
-- Target frequency (MHz): 950
-- Input signals: X2 X0
-- Output signals: R
--  approx. input signal timings: X2: (c0, 0.000000ns)X0: (c0, 0.000000ns)
--  approx. output signal timings: R: (c0, 1.228000ns)

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

entity XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid88 is
    port (X2 : in  std_logic_vector(5 downto 0);
          X0 : in  std_logic_vector(6 downto 0);
          R : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid88 is


signal cc_di :  std_logic_vector(3 downto 0);
   -- timing of cc_di: (c0, 0.000000ns)
signal cc_s :  std_logic_vector(3 downto 0);
   -- timing of cc_s: (c0, 0.000000ns)
signal cc_co :  std_logic_vector(3 downto 0);
   -- timing of cc_co: (c0, 0.000000ns)
signal cc_o :  std_logic_vector(3 downto 0);
   -- timing of cc_o: (c0, 0.000000ns)
signal result :  std_logic_vector(4 downto 0);
   -- timing of result: (c0, 1.228000ns)
begin
   lut0: LUT6_2
      generic map ( init => x"6996966996696996")
      port map ( i0 => X0(0),
                 i1 => X0(1),
                 i2 => X0(2),
                 i3 => X0(3),
                 i4 => X0(4),
                 i5 => X0(5),
                 o5 => cc_di(0),
                 o6 => cc_s(0));

   lut1: LUT6_2
      generic map ( init => x"177E7EE8FFF0F000")
      port map ( i0 => X0(0),
                 i1 => X0(1),
                 i2 => X0(2),
                 i3 => X0(3),
                 i4 => X0(4),
                 i5 => '1',
                 o5 => cc_di(1),
                 o6 => cc_s(1));

   cc_di(2) <= X2(0);
   lut2: LUT6_2
      generic map ( init => x"6996966996696996")
      port map ( i0 => X2(0),
                 i1 => X2(1),
                 i2 => X2(2),
                 i3 => X2(3),
                 i4 => X2(4),
                 i5 => X2(5),
                 o5 => open,
                 o6 => cc_s(2));

   lut3: LUT6_2
      generic map ( init => x"177E7EE8FFF0F000")
      port map ( i0 => X2(1),
                 i1 => X2(2),
                 i2 => X2(3),
                 i3 => X2(4),
                 i4 => X2(5),
                 i5 => '1',
                 o5 => cc_di(3),
                 o6 => cc_s(3));

   cc: CARRY4
      port map ( ci => '0',
                 cyinit => X0(6),
                 di => cc_di,
                 s => cc_s,
                 co => cc_co,
                 o => cc_o);

   result <= cc_co(3) & cc_o;
   R <= result;
end architecture;

--------------------------------------------------------------------------------
--                       XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid100
-- VHDL generated for VirtexUltrascalePlus @ 950MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 1.05263
-- Target frequency (MHz): 950
-- Input signals: X2 X0
-- Output signals: R
--  approx. input signal timings: X2: (c0, 0.000000ns)X0: (c0, 0.000000ns)
--  approx. output signal timings: R: (c0, 1.228000ns)

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

entity XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid100 is
    port (X2 : in  std_logic_vector(5 downto 0);
          X0 : in  std_logic_vector(6 downto 0);
          R : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid100 is


signal cc_di :  std_logic_vector(3 downto 0);
   -- timing of cc_di: (c0, 0.000000ns)
signal cc_s :  std_logic_vector(3 downto 0);
   -- timing of cc_s: (c0, 0.000000ns)
signal cc_co :  std_logic_vector(3 downto 0);
   -- timing of cc_co: (c0, 0.000000ns)
signal cc_o :  std_logic_vector(3 downto 0);
   -- timing of cc_o: (c0, 0.000000ns)
signal result :  std_logic_vector(4 downto 0);
   -- timing of result: (c0, 1.228000ns)
begin
   lut0: LUT6_2
      generic map ( init => x"6996966996696996")
      port map ( i0 => X0(0),
                 i1 => X0(1),
                 i2 => X0(2),
                 i3 => X0(3),
                 i4 => X0(4),
                 i5 => X0(5),
                 o5 => cc_di(0),
                 o6 => cc_s(0));

   lut1: LUT6_2
      generic map ( init => x"177E7EE8FFF0F000")
      port map ( i0 => X0(0),
                 i1 => X0(1),
                 i2 => X0(2),
                 i3 => X0(3),
                 i4 => X0(4),
                 i5 => '1',
                 o5 => cc_di(1),
                 o6 => cc_s(1));

   cc_di(2) <= X2(0);
   lut2: LUT6_2
      generic map ( init => x"6996966996696996")
      port map ( i0 => X2(0),
                 i1 => X2(1),
                 i2 => X2(2),
                 i3 => X2(3),
                 i4 => X2(4),
                 i5 => X2(5),
                 o5 => open,
                 o6 => cc_s(2));

   lut3: LUT6_2
      generic map ( init => x"177E7EE8FFF0F000")
      port map ( i0 => X2(1),
                 i1 => X2(2),
                 i2 => X2(3),
                 i3 => X2(4),
                 i4 => X2(5),
                 i5 => '1',
                 o5 => cc_di(3),
                 o6 => cc_s(3));

   cc: CARRY4
      port map ( ci => '0',
                 cyinit => X0(6),
                 di => cc_di,
                 s => cc_s,
                 co => cc_co,
                 o => cc_o);

   result <= cc_co(3) & cc_o;
   R <= result;
end architecture;

--------------------------------------------------------------------------------
--                       XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid112
-- VHDL generated for VirtexUltrascalePlus @ 950MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 1.05263
-- Target frequency (MHz): 950
-- Input signals: X2 X0
-- Output signals: R
--  approx. input signal timings: X2: (c0, 0.000000ns)X0: (c0, 0.000000ns)
--  approx. output signal timings: R: (c0, 1.228000ns)

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

entity XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid112 is
    port (X2 : in  std_logic_vector(5 downto 0);
          X0 : in  std_logic_vector(6 downto 0);
          R : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid112 is


signal cc_di :  std_logic_vector(3 downto 0);
   -- timing of cc_di: (c0, 0.000000ns)
signal cc_s :  std_logic_vector(3 downto 0);
   -- timing of cc_s: (c0, 0.000000ns)
signal cc_co :  std_logic_vector(3 downto 0);
   -- timing of cc_co: (c0, 0.000000ns)
signal cc_o :  std_logic_vector(3 downto 0);
   -- timing of cc_o: (c0, 0.000000ns)
signal result :  std_logic_vector(4 downto 0);
   -- timing of result: (c0, 1.228000ns)
begin
   lut0: LUT6_2
      generic map ( init => x"6996966996696996")
      port map ( i0 => X0(0),
                 i1 => X0(1),
                 i2 => X0(2),
                 i3 => X0(3),
                 i4 => X0(4),
                 i5 => X0(5),
                 o5 => cc_di(0),
                 o6 => cc_s(0));

   lut1: LUT6_2
      generic map ( init => x"177E7EE8FFF0F000")
      port map ( i0 => X0(0),
                 i1 => X0(1),
                 i2 => X0(2),
                 i3 => X0(3),
                 i4 => X0(4),
                 i5 => '1',
                 o5 => cc_di(1),
                 o6 => cc_s(1));

   cc_di(2) <= X2(0);
   lut2: LUT6_2
      generic map ( init => x"6996966996696996")
      port map ( i0 => X2(0),
                 i1 => X2(1),
                 i2 => X2(2),
                 i3 => X2(3),
                 i4 => X2(4),
                 i5 => X2(5),
                 o5 => open,
                 o6 => cc_s(2));

   lut3: LUT6_2
      generic map ( init => x"177E7EE8FFF0F000")
      port map ( i0 => X2(1),
                 i1 => X2(2),
                 i2 => X2(3),
                 i3 => X2(4),
                 i4 => X2(5),
                 i5 => '1',
                 o5 => cc_di(3),
                 o6 => cc_s(3));

   cc: CARRY4
      port map ( ci => '0',
                 cyinit => X0(6),
                 di => cc_di,
                 s => cc_s,
                 co => cc_co,
                 o => cc_o);

   result <= cc_co(3) & cc_o;
   R <= result;
end architecture;

--------------------------------------------------------------------------------
--                       XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid124
-- VHDL generated for VirtexUltrascalePlus @ 950MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 1.05263
-- Target frequency (MHz): 950
-- Input signals: X2 X0
-- Output signals: R
--  approx. input signal timings: X2: (c0, 0.000000ns)X0: (c0, 0.000000ns)
--  approx. output signal timings: R: (c0, 1.228000ns)

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

entity XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid124 is
    port (X2 : in  std_logic_vector(5 downto 0);
          X0 : in  std_logic_vector(6 downto 0);
          R : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid124 is


signal cc_di :  std_logic_vector(3 downto 0);
   -- timing of cc_di: (c0, 0.000000ns)
signal cc_s :  std_logic_vector(3 downto 0);
   -- timing of cc_s: (c0, 0.000000ns)
signal cc_co :  std_logic_vector(3 downto 0);
   -- timing of cc_co: (c0, 0.000000ns)
signal cc_o :  std_logic_vector(3 downto 0);
   -- timing of cc_o: (c0, 0.000000ns)
signal result :  std_logic_vector(4 downto 0);
   -- timing of result: (c0, 1.228000ns)
begin
   lut0: LUT6_2
      generic map ( init => x"6996966996696996")
      port map ( i0 => X0(0),
                 i1 => X0(1),
                 i2 => X0(2),
                 i3 => X0(3),
                 i4 => X0(4),
                 i5 => X0(5),
                 o5 => cc_di(0),
                 o6 => cc_s(0));

   lut1: LUT6_2
      generic map ( init => x"177E7EE8FFF0F000")
      port map ( i0 => X0(0),
                 i1 => X0(1),
                 i2 => X0(2),
                 i3 => X0(3),
                 i4 => X0(4),
                 i5 => '1',
                 o5 => cc_di(1),
                 o6 => cc_s(1));

   cc_di(2) <= X2(0);
   lut2: LUT6_2
      generic map ( init => x"6996966996696996")
      port map ( i0 => X2(0),
                 i1 => X2(1),
                 i2 => X2(2),
                 i3 => X2(3),
                 i4 => X2(4),
                 i5 => X2(5),
                 o5 => open,
                 o6 => cc_s(2));

   lut3: LUT6_2
      generic map ( init => x"177E7EE8FFF0F000")
      port map ( i0 => X2(1),
                 i1 => X2(2),
                 i2 => X2(3),
                 i3 => X2(4),
                 i4 => X2(5),
                 i5 => '1',
                 o5 => cc_di(3),
                 o6 => cc_s(3));

   cc: CARRY4
      port map ( ci => '0',
                 cyinit => X0(6),
                 di => cc_di,
                 s => cc_s,
                 co => cc_co,
                 o => cc_o);

   result <= cc_co(3) & cc_o;
   R <= result;
end architecture;

--------------------------------------------------------------------------------
--                       XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid136
-- VHDL generated for VirtexUltrascalePlus @ 950MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 1.05263
-- Target frequency (MHz): 950
-- Input signals: X2 X0
-- Output signals: R
--  approx. input signal timings: X2: (c0, 0.000000ns)X0: (c0, 0.000000ns)
--  approx. output signal timings: R: (c0, 1.228000ns)

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

entity XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid136 is
    port (X2 : in  std_logic_vector(5 downto 0);
          X0 : in  std_logic_vector(6 downto 0);
          R : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid136 is


signal cc_di :  std_logic_vector(3 downto 0);
   -- timing of cc_di: (c0, 0.000000ns)
signal cc_s :  std_logic_vector(3 downto 0);
   -- timing of cc_s: (c0, 0.000000ns)
signal cc_co :  std_logic_vector(3 downto 0);
   -- timing of cc_co: (c0, 0.000000ns)
signal cc_o :  std_logic_vector(3 downto 0);
   -- timing of cc_o: (c0, 0.000000ns)
signal result :  std_logic_vector(4 downto 0);
   -- timing of result: (c0, 1.228000ns)
begin
   lut0: LUT6_2
      generic map ( init => x"6996966996696996")
      port map ( i0 => X0(0),
                 i1 => X0(1),
                 i2 => X0(2),
                 i3 => X0(3),
                 i4 => X0(4),
                 i5 => X0(5),
                 o5 => cc_di(0),
                 o6 => cc_s(0));

   lut1: LUT6_2
      generic map ( init => x"177E7EE8FFF0F000")
      port map ( i0 => X0(0),
                 i1 => X0(1),
                 i2 => X0(2),
                 i3 => X0(3),
                 i4 => X0(4),
                 i5 => '1',
                 o5 => cc_di(1),
                 o6 => cc_s(1));

   cc_di(2) <= X2(0);
   lut2: LUT6_2
      generic map ( init => x"6996966996696996")
      port map ( i0 => X2(0),
                 i1 => X2(1),
                 i2 => X2(2),
                 i3 => X2(3),
                 i4 => X2(4),
                 i5 => X2(5),
                 o5 => open,
                 o6 => cc_s(2));

   lut3: LUT6_2
      generic map ( init => x"177E7EE8FFF0F000")
      port map ( i0 => X2(1),
                 i1 => X2(2),
                 i2 => X2(3),
                 i3 => X2(4),
                 i4 => X2(5),
                 i5 => '1',
                 o5 => cc_di(3),
                 o6 => cc_s(3));

   cc: CARRY4
      port map ( ci => '0',
                 cyinit => X0(6),
                 di => cc_di,
                 s => cc_s,
                 co => cc_co,
                 o => cc_o);

   result <= cc_co(3) & cc_o;
   R <= result;
end architecture;

--------------------------------------------------------------------------------
--                       XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid148
-- VHDL generated for VirtexUltrascalePlus @ 950MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 1.05263
-- Target frequency (MHz): 950
-- Input signals: X2 X0
-- Output signals: R
--  approx. input signal timings: X2: (c0, 0.000000ns)X0: (c0, 0.000000ns)
--  approx. output signal timings: R: (c0, 1.228000ns)

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

entity XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid148 is
    port (X2 : in  std_logic_vector(5 downto 0);
          X0 : in  std_logic_vector(6 downto 0);
          R : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid148 is


signal cc_di :  std_logic_vector(3 downto 0);
   -- timing of cc_di: (c0, 0.000000ns)
signal cc_s :  std_logic_vector(3 downto 0);
   -- timing of cc_s: (c0, 0.000000ns)
signal cc_co :  std_logic_vector(3 downto 0);
   -- timing of cc_co: (c0, 0.000000ns)
signal cc_o :  std_logic_vector(3 downto 0);
   -- timing of cc_o: (c0, 0.000000ns)
signal result :  std_logic_vector(4 downto 0);
   -- timing of result: (c0, 1.228000ns)
begin
   lut0: LUT6_2
      generic map ( init => x"6996966996696996")
      port map ( i0 => X0(0),
                 i1 => X0(1),
                 i2 => X0(2),
                 i3 => X0(3),
                 i4 => X0(4),
                 i5 => X0(5),
                 o5 => cc_di(0),
                 o6 => cc_s(0));

   lut1: LUT6_2
      generic map ( init => x"177E7EE8FFF0F000")
      port map ( i0 => X0(0),
                 i1 => X0(1),
                 i2 => X0(2),
                 i3 => X0(3),
                 i4 => X0(4),
                 i5 => '1',
                 o5 => cc_di(1),
                 o6 => cc_s(1));

   cc_di(2) <= X2(0);
   lut2: LUT6_2
      generic map ( init => x"6996966996696996")
      port map ( i0 => X2(0),
                 i1 => X2(1),
                 i2 => X2(2),
                 i3 => X2(3),
                 i4 => X2(4),
                 i5 => X2(5),
                 o5 => open,
                 o6 => cc_s(2));

   lut3: LUT6_2
      generic map ( init => x"177E7EE8FFF0F000")
      port map ( i0 => X2(1),
                 i1 => X2(2),
                 i2 => X2(3),
                 i3 => X2(4),
                 i4 => X2(5),
                 i5 => '1',
                 o5 => cc_di(3),
                 o6 => cc_s(3));

   cc: CARRY4
      port map ( ci => '0',
                 cyinit => X0(6),
                 di => cc_di,
                 s => cc_s,
                 co => cc_co,
                 o => cc_o);

   result <= cc_co(3) & cc_o;
   R <= result;
end architecture;

--------------------------------------------------------------------------------
--                       XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid160
-- VHDL generated for VirtexUltrascalePlus @ 950MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 1.05263
-- Target frequency (MHz): 950
-- Input signals: X2 X0
-- Output signals: R
--  approx. input signal timings: X2: (c0, 0.000000ns)X0: (c0, 0.000000ns)
--  approx. output signal timings: R: (c0, 1.228000ns)

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

entity XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid160 is
    port (X2 : in  std_logic_vector(5 downto 0);
          X0 : in  std_logic_vector(6 downto 0);
          R : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid160 is


signal cc_di :  std_logic_vector(3 downto 0);
   -- timing of cc_di: (c0, 0.000000ns)
signal cc_s :  std_logic_vector(3 downto 0);
   -- timing of cc_s: (c0, 0.000000ns)
signal cc_co :  std_logic_vector(3 downto 0);
   -- timing of cc_co: (c0, 0.000000ns)
signal cc_o :  std_logic_vector(3 downto 0);
   -- timing of cc_o: (c0, 0.000000ns)
signal result :  std_logic_vector(4 downto 0);
   -- timing of result: (c0, 1.228000ns)
begin
   lut0: LUT6_2
      generic map ( init => x"6996966996696996")
      port map ( i0 => X0(0),
                 i1 => X0(1),
                 i2 => X0(2),
                 i3 => X0(3),
                 i4 => X0(4),
                 i5 => X0(5),
                 o5 => cc_di(0),
                 o6 => cc_s(0));

   lut1: LUT6_2
      generic map ( init => x"177E7EE8FFF0F000")
      port map ( i0 => X0(0),
                 i1 => X0(1),
                 i2 => X0(2),
                 i3 => X0(3),
                 i4 => X0(4),
                 i5 => '1',
                 o5 => cc_di(1),
                 o6 => cc_s(1));

   cc_di(2) <= X2(0);
   lut2: LUT6_2
      generic map ( init => x"6996966996696996")
      port map ( i0 => X2(0),
                 i1 => X2(1),
                 i2 => X2(2),
                 i3 => X2(3),
                 i4 => X2(4),
                 i5 => X2(5),
                 o5 => open,
                 o6 => cc_s(2));

   lut3: LUT6_2
      generic map ( init => x"177E7EE8FFF0F000")
      port map ( i0 => X2(1),
                 i1 => X2(2),
                 i2 => X2(3),
                 i3 => X2(4),
                 i4 => X2(5),
                 i5 => '1',
                 o5 => cc_di(3),
                 o6 => cc_s(3));

   cc: CARRY4
      port map ( ci => '0',
                 cyinit => X0(6),
                 di => cc_di,
                 s => cc_s,
                 co => cc_co,
                 o => cc_o);

   result <= cc_co(3) & cc_o;
   R <= result;
end architecture;

--------------------------------------------------------------------------------
--                       XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid172
-- VHDL generated for VirtexUltrascalePlus @ 950MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 1.05263
-- Target frequency (MHz): 950
-- Input signals: X2 X0
-- Output signals: R
--  approx. input signal timings: X2: (c0, 0.000000ns)X0: (c0, 0.000000ns)
--  approx. output signal timings: R: (c0, 1.228000ns)

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

entity XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid172 is
    port (X2 : in  std_logic_vector(5 downto 0);
          X0 : in  std_logic_vector(6 downto 0);
          R : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid172 is


signal cc_di :  std_logic_vector(3 downto 0);
   -- timing of cc_di: (c0, 0.000000ns)
signal cc_s :  std_logic_vector(3 downto 0);
   -- timing of cc_s: (c0, 0.000000ns)
signal cc_co :  std_logic_vector(3 downto 0);
   -- timing of cc_co: (c0, 0.000000ns)
signal cc_o :  std_logic_vector(3 downto 0);
   -- timing of cc_o: (c0, 0.000000ns)
signal result :  std_logic_vector(4 downto 0);
   -- timing of result: (c0, 1.228000ns)
begin
   lut0: LUT6_2
      generic map ( init => x"6996966996696996")
      port map ( i0 => X0(0),
                 i1 => X0(1),
                 i2 => X0(2),
                 i3 => X0(3),
                 i4 => X0(4),
                 i5 => X0(5),
                 o5 => cc_di(0),
                 o6 => cc_s(0));

   lut1: LUT6_2
      generic map ( init => x"177E7EE8FFF0F000")
      port map ( i0 => X0(0),
                 i1 => X0(1),
                 i2 => X0(2),
                 i3 => X0(3),
                 i4 => X0(4),
                 i5 => '1',
                 o5 => cc_di(1),
                 o6 => cc_s(1));

   cc_di(2) <= X2(0);
   lut2: LUT6_2
      generic map ( init => x"6996966996696996")
      port map ( i0 => X2(0),
                 i1 => X2(1),
                 i2 => X2(2),
                 i3 => X2(3),
                 i4 => X2(4),
                 i5 => X2(5),
                 o5 => open,
                 o6 => cc_s(2));

   lut3: LUT6_2
      generic map ( init => x"177E7EE8FFF0F000")
      port map ( i0 => X2(1),
                 i1 => X2(2),
                 i2 => X2(3),
                 i3 => X2(4),
                 i4 => X2(5),
                 i5 => '1',
                 o5 => cc_di(3),
                 o6 => cc_s(3));

   cc: CARRY4
      port map ( ci => '0',
                 cyinit => X0(6),
                 di => cc_di,
                 s => cc_s,
                 co => cc_co,
                 o => cc_o);

   result <= cc_co(3) & cc_o;
   R <= result;
end architecture;

--------------------------------------------------------------------------------
--                       XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid184
-- VHDL generated for VirtexUltrascalePlus @ 950MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 1.05263
-- Target frequency (MHz): 950
-- Input signals: X2 X0
-- Output signals: R
--  approx. input signal timings: X2: (c0, 0.000000ns)X0: (c0, 0.000000ns)
--  approx. output signal timings: R: (c0, 1.228000ns)

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

entity XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid184 is
    port (X2 : in  std_logic_vector(5 downto 0);
          X0 : in  std_logic_vector(6 downto 0);
          R : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid184 is


signal cc_di :  std_logic_vector(3 downto 0);
   -- timing of cc_di: (c0, 0.000000ns)
signal cc_s :  std_logic_vector(3 downto 0);
   -- timing of cc_s: (c0, 0.000000ns)
signal cc_co :  std_logic_vector(3 downto 0);
   -- timing of cc_co: (c0, 0.000000ns)
signal cc_o :  std_logic_vector(3 downto 0);
   -- timing of cc_o: (c0, 0.000000ns)
signal result :  std_logic_vector(4 downto 0);
   -- timing of result: (c0, 1.228000ns)
begin
   lut0: LUT6_2
      generic map ( init => x"6996966996696996")
      port map ( i0 => X0(0),
                 i1 => X0(1),
                 i2 => X0(2),
                 i3 => X0(3),
                 i4 => X0(4),
                 i5 => X0(5),
                 o5 => cc_di(0),
                 o6 => cc_s(0));

   lut1: LUT6_2
      generic map ( init => x"177E7EE8FFF0F000")
      port map ( i0 => X0(0),
                 i1 => X0(1),
                 i2 => X0(2),
                 i3 => X0(3),
                 i4 => X0(4),
                 i5 => '1',
                 o5 => cc_di(1),
                 o6 => cc_s(1));

   cc_di(2) <= X2(0);
   lut2: LUT6_2
      generic map ( init => x"6996966996696996")
      port map ( i0 => X2(0),
                 i1 => X2(1),
                 i2 => X2(2),
                 i3 => X2(3),
                 i4 => X2(4),
                 i5 => X2(5),
                 o5 => open,
                 o6 => cc_s(2));

   lut3: LUT6_2
      generic map ( init => x"177E7EE8FFF0F000")
      port map ( i0 => X2(1),
                 i1 => X2(2),
                 i2 => X2(3),
                 i3 => X2(4),
                 i4 => X2(5),
                 i5 => '1',
                 o5 => cc_di(3),
                 o6 => cc_s(3));

   cc: CARRY4
      port map ( ci => '0',
                 cyinit => X0(6),
                 di => cc_di,
                 s => cc_s,
                 co => cc_co,
                 o => cc_o);

   result <= cc_co(3) & cc_o;
   R <= result;
end architecture;

--------------------------------------------------------------------------------
--                      XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid2642117_5_Freq950_uid196
-- VHDL generated for VirtexUltrascalePlus @ 950MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 1.05263
-- Target frequency (MHz): 950
-- Input signals: X3 X2 X1 X0
-- Output signals: R
--  approx. input signal timings: X3: (c0, 0.000000ns)X2: (c0, 0.000000ns)X1: (c0, 0.000000ns)X0: (c0, 0.000000ns)
--  approx. output signal timings: R: (c0, 1.228000ns)

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

entity XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid2642117_5_Freq950_uid196 is
    port (X3 : in  std_logic_vector(1 downto 0);
          X2 : in  std_logic_vector(0 downto 0);
          X1 : in  std_logic_vector(0 downto 0);
          X0 : in  std_logic_vector(6 downto 0);
          R : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid2642117_5_Freq950_uid196 is


signal cc_di :  std_logic_vector(3 downto 0);
   -- timing of cc_di: (c0, 0.000000ns)
signal cc_s :  std_logic_vector(3 downto 0);
   -- timing of cc_s: (c0, 0.000000ns)
signal cc_co :  std_logic_vector(3 downto 0);
   -- timing of cc_co: (c0, 0.000000ns)
signal cc_o :  std_logic_vector(3 downto 0);
   -- timing of cc_o: (c0, 0.000000ns)
signal result :  std_logic_vector(4 downto 0);
   -- timing of result: (c0, 1.228000ns)
begin
   lut0: LUT6_2
      generic map ( init => x"6996966996696996")
      port map ( i0 => X0(0),
                 i1 => X0(1),
                 i2 => X0(2),
                 i3 => X0(3),
                 i4 => X0(4),
                 i5 => X0(5),
                 o5 => cc_di(0),
                 o6 => cc_s(0));

   cc_di(1) <= X1(0);
   lut1: LUT6_2
      generic map ( init => x"E8818117177E7EE8")
      port map ( i0 => X0(0),
                 i1 => X0(1),
                 i2 => X0(2),
                 i3 => X0(3),
                 i4 => X0(4),
                 i5 => X1(0),
                 o5 => open,
                 o6 => cc_s(1));

   cc_di(2) <= X2(0);
   lut2: LUT6_2
      generic map ( init => x"177F7FFFE8808000")
      port map ( i0 => X0(0),
                 i1 => X0(1),
                 i2 => X0(2),
                 i3 => X0(3),
                 i4 => X0(4),
                 i5 => X2(0),
                 o5 => open,
                 o6 => cc_s(2));

   cc_di(3) <= X3(1);
   lut3: LUT6_2
      generic map ( init => x"69966996AAAAAAAA")
      port map ( i0 => X3(0),
                 i1 => X3(1),
                 i2 => '0',
                 i3 => '0',
                 i4 => '0',
                 i5 => '1',
                 o5 => open,
                 o6 => cc_s(3));

   cc: CARRY4
      port map ( ci => '0',
                 cyinit => X0(6),
                 di => cc_di,
                 s => cc_s,
                 co => cc_co,
                 o => cc_o);

   result <= cc_co(3) & cc_o;
   R <= result;
end architecture;

--------------------------------------------------------------------------------
--                       Compressor_FixMultiAdder_S_17_lsbOut_m11_uid2643_2_Freq950_uid210
-- VHDL generated for VirtexUltrascalePlus @ 950MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 1.05263
-- Target frequency (MHz): 950
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

entity Compressor_FixMultiAdder_S_17_lsbOut_m11_uid2643_2_Freq950_uid210 is
    port (X0 : in  std_logic_vector(2 downto 0);
          R : out  std_logic_vector(1 downto 0)   );
end entity;

architecture arch of Compressor_FixMultiAdder_S_17_lsbOut_m11_uid2643_2_Freq950_uid210 is
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
--                       XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid216
-- VHDL generated for VirtexUltrascalePlus @ 950MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 1.05263
-- Target frequency (MHz): 950
-- Input signals: X2 X0
-- Output signals: R
--  approx. input signal timings: X2: (c0, 0.000000ns)X0: (c0, 0.000000ns)
--  approx. output signal timings: R: (c0, 1.228000ns)

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

entity XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid216 is
    port (X2 : in  std_logic_vector(5 downto 0);
          X0 : in  std_logic_vector(6 downto 0);
          R : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid216 is


signal cc_di :  std_logic_vector(3 downto 0);
   -- timing of cc_di: (c0, 0.000000ns)
signal cc_s :  std_logic_vector(3 downto 0);
   -- timing of cc_s: (c0, 0.000000ns)
signal cc_co :  std_logic_vector(3 downto 0);
   -- timing of cc_co: (c0, 0.000000ns)
signal cc_o :  std_logic_vector(3 downto 0);
   -- timing of cc_o: (c0, 0.000000ns)
signal result :  std_logic_vector(4 downto 0);
   -- timing of result: (c0, 1.228000ns)
begin
   lut0: LUT6_2
      generic map ( init => x"6996966996696996")
      port map ( i0 => X0(0),
                 i1 => X0(1),
                 i2 => X0(2),
                 i3 => X0(3),
                 i4 => X0(4),
                 i5 => X0(5),
                 o5 => cc_di(0),
                 o6 => cc_s(0));

   lut1: LUT6_2
      generic map ( init => x"177E7EE8FFF0F000")
      port map ( i0 => X0(0),
                 i1 => X0(1),
                 i2 => X0(2),
                 i3 => X0(3),
                 i4 => X0(4),
                 i5 => '1',
                 o5 => cc_di(1),
                 o6 => cc_s(1));

   cc_di(2) <= X2(0);
   lut2: LUT6_2
      generic map ( init => x"6996966996696996")
      port map ( i0 => X2(0),
                 i1 => X2(1),
                 i2 => X2(2),
                 i3 => X2(3),
                 i4 => X2(4),
                 i5 => X2(5),
                 o5 => open,
                 o6 => cc_s(2));

   lut3: LUT6_2
      generic map ( init => x"177E7EE8FFF0F000")
      port map ( i0 => X2(1),
                 i1 => X2(2),
                 i2 => X2(3),
                 i3 => X2(4),
                 i4 => X2(5),
                 i5 => '1',
                 o5 => cc_di(3),
                 o6 => cc_s(3));

   cc: CARRY4
      port map ( ci => '0',
                 cyinit => X0(6),
                 di => cc_di,
                 s => cc_s,
                 co => cc_co,
                 o => cc_o);

   result <= cc_co(3) & cc_o;
   R <= result;
end architecture;

--------------------------------------------------------------------------------
--                       XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid228
-- VHDL generated for VirtexUltrascalePlus @ 950MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 1.05263
-- Target frequency (MHz): 950
-- Input signals: X2 X0
-- Output signals: R
--  approx. input signal timings: X2: (c0, 0.000000ns)X0: (c0, 0.000000ns)
--  approx. output signal timings: R: (c0, 1.228000ns)

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

entity XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid228 is
    port (X2 : in  std_logic_vector(5 downto 0);
          X0 : in  std_logic_vector(6 downto 0);
          R : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid228 is


signal cc_di :  std_logic_vector(3 downto 0);
   -- timing of cc_di: (c0, 0.000000ns)
signal cc_s :  std_logic_vector(3 downto 0);
   -- timing of cc_s: (c0, 0.000000ns)
signal cc_co :  std_logic_vector(3 downto 0);
   -- timing of cc_co: (c0, 0.000000ns)
signal cc_o :  std_logic_vector(3 downto 0);
   -- timing of cc_o: (c0, 0.000000ns)
signal result :  std_logic_vector(4 downto 0);
   -- timing of result: (c0, 1.228000ns)
begin
   lut0: LUT6_2
      generic map ( init => x"6996966996696996")
      port map ( i0 => X0(0),
                 i1 => X0(1),
                 i2 => X0(2),
                 i3 => X0(3),
                 i4 => X0(4),
                 i5 => X0(5),
                 o5 => cc_di(0),
                 o6 => cc_s(0));

   lut1: LUT6_2
      generic map ( init => x"177E7EE8FFF0F000")
      port map ( i0 => X0(0),
                 i1 => X0(1),
                 i2 => X0(2),
                 i3 => X0(3),
                 i4 => X0(4),
                 i5 => '1',
                 o5 => cc_di(1),
                 o6 => cc_s(1));

   cc_di(2) <= X2(0);
   lut2: LUT6_2
      generic map ( init => x"6996966996696996")
      port map ( i0 => X2(0),
                 i1 => X2(1),
                 i2 => X2(2),
                 i3 => X2(3),
                 i4 => X2(4),
                 i5 => X2(5),
                 o5 => open,
                 o6 => cc_s(2));

   lut3: LUT6_2
      generic map ( init => x"177E7EE8FFF0F000")
      port map ( i0 => X2(1),
                 i1 => X2(2),
                 i2 => X2(3),
                 i3 => X2(4),
                 i4 => X2(5),
                 i5 => '1',
                 o5 => cc_di(3),
                 o6 => cc_s(3));

   cc: CARRY4
      port map ( ci => '0',
                 cyinit => X0(6),
                 di => cc_di,
                 s => cc_s,
                 co => cc_co,
                 o => cc_o);

   result <= cc_co(3) & cc_o;
   R <= result;
end architecture;

--------------------------------------------------------------------------------
--                       XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid240
-- VHDL generated for VirtexUltrascalePlus @ 950MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 1.05263
-- Target frequency (MHz): 950
-- Input signals: X2 X0
-- Output signals: R
--  approx. input signal timings: X2: (c0, 0.000000ns)X0: (c0, 0.000000ns)
--  approx. output signal timings: R: (c0, 1.228000ns)

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

entity XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid240 is
    port (X2 : in  std_logic_vector(5 downto 0);
          X0 : in  std_logic_vector(6 downto 0);
          R : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid240 is


signal cc_di :  std_logic_vector(3 downto 0);
   -- timing of cc_di: (c0, 0.000000ns)
signal cc_s :  std_logic_vector(3 downto 0);
   -- timing of cc_s: (c0, 0.000000ns)
signal cc_co :  std_logic_vector(3 downto 0);
   -- timing of cc_co: (c0, 0.000000ns)
signal cc_o :  std_logic_vector(3 downto 0);
   -- timing of cc_o: (c0, 0.000000ns)
signal result :  std_logic_vector(4 downto 0);
   -- timing of result: (c0, 1.228000ns)
begin
   lut0: LUT6_2
      generic map ( init => x"6996966996696996")
      port map ( i0 => X0(0),
                 i1 => X0(1),
                 i2 => X0(2),
                 i3 => X0(3),
                 i4 => X0(4),
                 i5 => X0(5),
                 o5 => cc_di(0),
                 o6 => cc_s(0));

   lut1: LUT6_2
      generic map ( init => x"177E7EE8FFF0F000")
      port map ( i0 => X0(0),
                 i1 => X0(1),
                 i2 => X0(2),
                 i3 => X0(3),
                 i4 => X0(4),
                 i5 => '1',
                 o5 => cc_di(1),
                 o6 => cc_s(1));

   cc_di(2) <= X2(0);
   lut2: LUT6_2
      generic map ( init => x"6996966996696996")
      port map ( i0 => X2(0),
                 i1 => X2(1),
                 i2 => X2(2),
                 i3 => X2(3),
                 i4 => X2(4),
                 i5 => X2(5),
                 o5 => open,
                 o6 => cc_s(2));

   lut3: LUT6_2
      generic map ( init => x"177E7EE8FFF0F000")
      port map ( i0 => X2(1),
                 i1 => X2(2),
                 i2 => X2(3),
                 i3 => X2(4),
                 i4 => X2(5),
                 i5 => '1',
                 o5 => cc_di(3),
                 o6 => cc_s(3));

   cc: CARRY4
      port map ( ci => '0',
                 cyinit => X0(6),
                 di => cc_di,
                 s => cc_s,
                 co => cc_co,
                 o => cc_o);

   result <= cc_co(3) & cc_o;
   R <= result;
end architecture;

--------------------------------------------------------------------------------
--                       XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid252
-- VHDL generated for VirtexUltrascalePlus @ 950MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 1.05263
-- Target frequency (MHz): 950
-- Input signals: X2 X0
-- Output signals: R
--  approx. input signal timings: X2: (c0, 0.000000ns)X0: (c0, 0.000000ns)
--  approx. output signal timings: R: (c0, 1.228000ns)

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

entity XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid252 is
    port (X2 : in  std_logic_vector(5 downto 0);
          X0 : in  std_logic_vector(6 downto 0);
          R : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid252 is


signal cc_di :  std_logic_vector(3 downto 0);
   -- timing of cc_di: (c0, 0.000000ns)
signal cc_s :  std_logic_vector(3 downto 0);
   -- timing of cc_s: (c0, 0.000000ns)
signal cc_co :  std_logic_vector(3 downto 0);
   -- timing of cc_co: (c0, 0.000000ns)
signal cc_o :  std_logic_vector(3 downto 0);
   -- timing of cc_o: (c0, 0.000000ns)
signal result :  std_logic_vector(4 downto 0);
   -- timing of result: (c0, 1.228000ns)
begin
   lut0: LUT6_2
      generic map ( init => x"6996966996696996")
      port map ( i0 => X0(0),
                 i1 => X0(1),
                 i2 => X0(2),
                 i3 => X0(3),
                 i4 => X0(4),
                 i5 => X0(5),
                 o5 => cc_di(0),
                 o6 => cc_s(0));

   lut1: LUT6_2
      generic map ( init => x"177E7EE8FFF0F000")
      port map ( i0 => X0(0),
                 i1 => X0(1),
                 i2 => X0(2),
                 i3 => X0(3),
                 i4 => X0(4),
                 i5 => '1',
                 o5 => cc_di(1),
                 o6 => cc_s(1));

   cc_di(2) <= X2(0);
   lut2: LUT6_2
      generic map ( init => x"6996966996696996")
      port map ( i0 => X2(0),
                 i1 => X2(1),
                 i2 => X2(2),
                 i3 => X2(3),
                 i4 => X2(4),
                 i5 => X2(5),
                 o5 => open,
                 o6 => cc_s(2));

   lut3: LUT6_2
      generic map ( init => x"177E7EE8FFF0F000")
      port map ( i0 => X2(1),
                 i1 => X2(2),
                 i2 => X2(3),
                 i3 => X2(4),
                 i4 => X2(5),
                 i5 => '1',
                 o5 => cc_di(3),
                 o6 => cc_s(3));

   cc: CARRY4
      port map ( ci => '0',
                 cyinit => X0(6),
                 di => cc_di,
                 s => cc_s,
                 co => cc_co,
                 o => cc_o);

   result <= cc_co(3) & cc_o;
   R <= result;
end architecture;

--------------------------------------------------------------------------------
--                       XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid264
-- VHDL generated for VirtexUltrascalePlus @ 950MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 1.05263
-- Target frequency (MHz): 950
-- Input signals: X2 X0
-- Output signals: R
--  approx. input signal timings: X2: (c0, 0.000000ns)X0: (c0, 0.000000ns)
--  approx. output signal timings: R: (c0, 1.228000ns)

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

entity XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid264 is
    port (X2 : in  std_logic_vector(5 downto 0);
          X0 : in  std_logic_vector(6 downto 0);
          R : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid264 is


signal cc_di :  std_logic_vector(3 downto 0);
   -- timing of cc_di: (c0, 0.000000ns)
signal cc_s :  std_logic_vector(3 downto 0);
   -- timing of cc_s: (c0, 0.000000ns)
signal cc_co :  std_logic_vector(3 downto 0);
   -- timing of cc_co: (c0, 0.000000ns)
signal cc_o :  std_logic_vector(3 downto 0);
   -- timing of cc_o: (c0, 0.000000ns)
signal result :  std_logic_vector(4 downto 0);
   -- timing of result: (c0, 1.228000ns)
begin
   lut0: LUT6_2
      generic map ( init => x"6996966996696996")
      port map ( i0 => X0(0),
                 i1 => X0(1),
                 i2 => X0(2),
                 i3 => X0(3),
                 i4 => X0(4),
                 i5 => X0(5),
                 o5 => cc_di(0),
                 o6 => cc_s(0));

   lut1: LUT6_2
      generic map ( init => x"177E7EE8FFF0F000")
      port map ( i0 => X0(0),
                 i1 => X0(1),
                 i2 => X0(2),
                 i3 => X0(3),
                 i4 => X0(4),
                 i5 => '1',
                 o5 => cc_di(1),
                 o6 => cc_s(1));

   cc_di(2) <= X2(0);
   lut2: LUT6_2
      generic map ( init => x"6996966996696996")
      port map ( i0 => X2(0),
                 i1 => X2(1),
                 i2 => X2(2),
                 i3 => X2(3),
                 i4 => X2(4),
                 i5 => X2(5),
                 o5 => open,
                 o6 => cc_s(2));

   lut3: LUT6_2
      generic map ( init => x"177E7EE8FFF0F000")
      port map ( i0 => X2(1),
                 i1 => X2(2),
                 i2 => X2(3),
                 i3 => X2(4),
                 i4 => X2(5),
                 i5 => '1',
                 o5 => cc_di(3),
                 o6 => cc_s(3));

   cc: CARRY4
      port map ( ci => '0',
                 cyinit => X0(6),
                 di => cc_di,
                 s => cc_s,
                 co => cc_co,
                 o => cc_o);

   result <= cc_co(3) & cc_o;
   R <= result;
end architecture;

--------------------------------------------------------------------------------
--                       XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid276
-- VHDL generated for VirtexUltrascalePlus @ 950MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 1.05263
-- Target frequency (MHz): 950
-- Input signals: X2 X0
-- Output signals: R
--  approx. input signal timings: X2: (c0, 0.000000ns)X0: (c0, 0.000000ns)
--  approx. output signal timings: R: (c0, 1.228000ns)

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

entity XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid276 is
    port (X2 : in  std_logic_vector(5 downto 0);
          X0 : in  std_logic_vector(6 downto 0);
          R : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid276 is


signal cc_di :  std_logic_vector(3 downto 0);
   -- timing of cc_di: (c0, 0.000000ns)
signal cc_s :  std_logic_vector(3 downto 0);
   -- timing of cc_s: (c0, 0.000000ns)
signal cc_co :  std_logic_vector(3 downto 0);
   -- timing of cc_co: (c0, 0.000000ns)
signal cc_o :  std_logic_vector(3 downto 0);
   -- timing of cc_o: (c0, 0.000000ns)
signal result :  std_logic_vector(4 downto 0);
   -- timing of result: (c0, 1.228000ns)
begin
   lut0: LUT6_2
      generic map ( init => x"6996966996696996")
      port map ( i0 => X0(0),
                 i1 => X0(1),
                 i2 => X0(2),
                 i3 => X0(3),
                 i4 => X0(4),
                 i5 => X0(5),
                 o5 => cc_di(0),
                 o6 => cc_s(0));

   lut1: LUT6_2
      generic map ( init => x"177E7EE8FFF0F000")
      port map ( i0 => X0(0),
                 i1 => X0(1),
                 i2 => X0(2),
                 i3 => X0(3),
                 i4 => X0(4),
                 i5 => '1',
                 o5 => cc_di(1),
                 o6 => cc_s(1));

   cc_di(2) <= X2(0);
   lut2: LUT6_2
      generic map ( init => x"6996966996696996")
      port map ( i0 => X2(0),
                 i1 => X2(1),
                 i2 => X2(2),
                 i3 => X2(3),
                 i4 => X2(4),
                 i5 => X2(5),
                 o5 => open,
                 o6 => cc_s(2));

   lut3: LUT6_2
      generic map ( init => x"177E7EE8FFF0F000")
      port map ( i0 => X2(1),
                 i1 => X2(2),
                 i2 => X2(3),
                 i3 => X2(4),
                 i4 => X2(5),
                 i5 => '1',
                 o5 => cc_di(3),
                 o6 => cc_s(3));

   cc: CARRY4
      port map ( ci => '0',
                 cyinit => X0(6),
                 di => cc_di,
                 s => cc_s,
                 co => cc_co,
                 o => cc_o);

   result <= cc_co(3) & cc_o;
   R <= result;
end architecture;

--------------------------------------------------------------------------------
--                       XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid288
-- VHDL generated for VirtexUltrascalePlus @ 950MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 1.05263
-- Target frequency (MHz): 950
-- Input signals: X2 X0
-- Output signals: R
--  approx. input signal timings: X2: (c0, 0.000000ns)X0: (c0, 0.000000ns)
--  approx. output signal timings: R: (c0, 1.228000ns)

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

entity XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid288 is
    port (X2 : in  std_logic_vector(5 downto 0);
          X0 : in  std_logic_vector(6 downto 0);
          R : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid288 is


signal cc_di :  std_logic_vector(3 downto 0);
   -- timing of cc_di: (c0, 0.000000ns)
signal cc_s :  std_logic_vector(3 downto 0);
   -- timing of cc_s: (c0, 0.000000ns)
signal cc_co :  std_logic_vector(3 downto 0);
   -- timing of cc_co: (c0, 0.000000ns)
signal cc_o :  std_logic_vector(3 downto 0);
   -- timing of cc_o: (c0, 0.000000ns)
signal result :  std_logic_vector(4 downto 0);
   -- timing of result: (c0, 1.228000ns)
begin
   lut0: LUT6_2
      generic map ( init => x"6996966996696996")
      port map ( i0 => X0(0),
                 i1 => X0(1),
                 i2 => X0(2),
                 i3 => X0(3),
                 i4 => X0(4),
                 i5 => X0(5),
                 o5 => cc_di(0),
                 o6 => cc_s(0));

   lut1: LUT6_2
      generic map ( init => x"177E7EE8FFF0F000")
      port map ( i0 => X0(0),
                 i1 => X0(1),
                 i2 => X0(2),
                 i3 => X0(3),
                 i4 => X0(4),
                 i5 => '1',
                 o5 => cc_di(1),
                 o6 => cc_s(1));

   cc_di(2) <= X2(0);
   lut2: LUT6_2
      generic map ( init => x"6996966996696996")
      port map ( i0 => X2(0),
                 i1 => X2(1),
                 i2 => X2(2),
                 i3 => X2(3),
                 i4 => X2(4),
                 i5 => X2(5),
                 o5 => open,
                 o6 => cc_s(2));

   lut3: LUT6_2
      generic map ( init => x"177E7EE8FFF0F000")
      port map ( i0 => X2(1),
                 i1 => X2(2),
                 i2 => X2(3),
                 i3 => X2(4),
                 i4 => X2(5),
                 i5 => '1',
                 o5 => cc_di(3),
                 o6 => cc_s(3));

   cc: CARRY4
      port map ( ci => '0',
                 cyinit => X0(6),
                 di => cc_di,
                 s => cc_s,
                 co => cc_co,
                 o => cc_o);

   result <= cc_co(3) & cc_o;
   R <= result;
end architecture;

--------------------------------------------------------------------------------
--                         Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid2644_Freq950_uid300
-- VHDL generated for VirtexUltrascalePlus @ 950MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Andreas Boettcher
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 1.05263
-- Target frequency (MHz): 950
-- Input signals: X3 X2 X1 X0
-- Output signals: R
--  approx. input signal timings: X3: (c0, 0.000000ns)X2: (c0, 0.000000ns)X1: (c0, 0.000000ns)X0: (c0, 0.000000ns)
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

entity Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid2644_Freq950_uid300 is
    port (X3 : in  std_logic_vector(0 downto 0);
          X2 : in  std_logic_vector(2 downto 0);
          X1 : in  std_logic_vector(2 downto 0);
          X0 : in  std_logic_vector(3 downto 0);
          R : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid2644_Freq950_uid300 is


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
signal c2 :  std_logic;
   -- timing of c2: (c0, 0.000000ns)
signal result :  std_logic_vector(4 downto 0);
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
      generic map ( init => x"66666666aaaaaaaa")
      port map ( i0 => c2,
                 i1 => X3(0),
                 i2 => '0',
                 i3 => '0',
                 i4 => '0',
                 i5 => '1',
                 o5 => open,
                 o6 => cc_s(3));

   result <= cc_co(3) & cc_o(3 downto 0);
   R <= result;
end architecture;

--------------------------------------------------------------------------------
--                        Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321
-- VHDL generated for VirtexUltrascalePlus @ 950MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Andreas Boettcher
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 1.05263
-- Target frequency (MHz): 950
-- Input signals: X18 X17 X16 X15 X14 X13 X12 X11 X10 X9 X8 X7 X6 X5 X4 X3 X2 X1 X0
-- Output signals: R
--  approx. input signal timings: X18: (c0, 0.000000ns)X17: (c0, 0.000000ns)X16: (c0, 0.000000ns)X15: (c0, 0.000000ns)X14: (c0, 0.000000ns)X13: (c0, 0.000000ns)X12: (c0, 0.000000ns)X11: (c0, 0.000000ns)X10: (c0, 0.000000ns)X9: (c0, 0.000000ns)X8: (c0, 0.000000ns)X7: (c0, 0.000000ns)X6: (c0, 0.000000ns)X5: (c0, 0.000000ns)X4: (c0, 0.000000ns)X3: (c0, 0.000000ns)X2: (c0, 0.000000ns)X1: (c0, 0.000000ns)X0: (c0, 0.000000ns)
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

entity Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321 is
    port (X18 : in  std_logic_vector(0 downto 0);
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
          R : out  std_logic_vector(19 downto 0)   );
end entity;

architecture arch of Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321 is


signal cc_di :  std_logic_vector(19 downto 0);
   -- timing of cc_di: (c0, 0.000000ns)
signal cc_s :  std_logic_vector(19 downto 0);
   -- timing of cc_s: (c0, 0.000000ns)
signal cc_co :  std_logic_vector(19 downto 0);
   -- timing of cc_co: (c0, 0.000000ns)
signal cc_o :  std_logic_vector(19 downto 0);
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
signal result :  std_logic_vector(19 downto 0);
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
      generic map ( init => x"66666666aaaaaaaa")
      port map ( i0 => c17,
                 i1 => X18(0),
                 i2 => '0',
                 i3 => '0',
                 i4 => '0',
                 i5 => '1',
                 o5 => open,
                 o6 => cc_s(18));

   result <= cc_co(18) & cc_o(18 downto 0);
   R <= result;
end architecture;

--------------------------------------------------------------------------------
--                          FixMultiAdder_S_17_lsbOut_m11_uid264
--                     (FixMultiAdder_S_17_Freq950_uid2)
-- VHDL generated for VirtexUltrascalePlus @ 950MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Martin Kumm (2024)
--------------------------------------------------------------------------------
-- Pipeline depth: 3 cycles
-- Clock period (ns): 1.05263
-- Target frequency (MHz): 950
-- Input signals: X0 X1 X2 X3 X4 X5 X6 X7 X8 X9 X10 X11 X12 X13 X14 X15 X16
-- Output signals: R
--  approx. input signal timings: X0: (c0, 0.000000ns)X1: (c0, 0.000000ns)X2: (c0, 0.000000ns)X3: (c0, 0.000000ns)X4: (c0, 0.000000ns)X5: (c0, 0.000000ns)X6: (c0, 0.000000ns)X7: (c0, 0.000000ns)X8: (c0, 0.000000ns)X9: (c0, 0.000000ns)X10: (c0, 0.000000ns)X11: (c0, 0.000000ns)X12: (c0, 0.000000ns)X13: (c0, 0.000000ns)X14: (c0, 0.000000ns)X15: (c0, 0.000000ns)X16: (c0, 0.000000ns)
--  approx. output signal timings: R: (c3, 0.287105ns)

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity FixMultiAdder_S_17_lsbOut_m11_uid264 is
    port (clk, rst, write_enable_1, write_enable_2, write_enable_3 : in std_logic;
          R : out  std_logic_vector(17 downto 0);
          X0 : in  std_logic_vector(12 downto 0);
          X1 : in  std_logic_vector(12 downto 0);
          X2 : in  std_logic_vector(12 downto 0);
          X3 : in  std_logic_vector(13 downto 0);
          X4 : in  std_logic_vector(12 downto 0);
          X5 : in  std_logic_vector(13 downto 0);
          X6 : in  std_logic_vector(12 downto 0);
          X7 : in  std_logic_vector(12 downto 0);
          X8 : in  std_logic_vector(13 downto 0);
          X9 : in  std_logic_vector(12 downto 0);
          X10 : in  std_logic_vector(12 downto 0);
          X11 : in  std_logic_vector(12 downto 0);
          X12 : in  std_logic_vector(12 downto 0);
          X13 : in  std_logic_vector(13 downto 0);
          X14 : in  std_logic_vector(13 downto 0);
          X15 : in  std_logic_vector(12 downto 0);
          X16 : in  std_logic_vector(17 downto 0)   );
end entity;

architecture arch of FixMultiAdder_S_17_lsbOut_m11_uid264 is
   component XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid6 is
      port ( X2 : in  std_logic_vector(5 downto 0);
             X0 : in  std_logic_vector(6 downto 0);
             R : out  std_logic_vector(4 downto 0)   );
   end component;

   component Compressor_FixMultiAdder_S_17_lsbOut_m11_uid2645_3_Freq950_uid18 is
      port ( X0 : in  std_logic_vector(4 downto 0);
             R : out  std_logic_vector(2 downto 0)   );
   end component;

   component Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22 is
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

   component XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid76 is
      port ( X2 : in  std_logic_vector(5 downto 0);
             X0 : in  std_logic_vector(6 downto 0);
             R : out  std_logic_vector(4 downto 0)   );
   end component;

   component XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid88 is
      port ( X2 : in  std_logic_vector(5 downto 0);
             X0 : in  std_logic_vector(6 downto 0);
             R : out  std_logic_vector(4 downto 0)   );
   end component;

   component XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid100 is
      port ( X2 : in  std_logic_vector(5 downto 0);
             X0 : in  std_logic_vector(6 downto 0);
             R : out  std_logic_vector(4 downto 0)   );
   end component;

   component XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid112 is
      port ( X2 : in  std_logic_vector(5 downto 0);
             X0 : in  std_logic_vector(6 downto 0);
             R : out  std_logic_vector(4 downto 0)   );
   end component;

   component XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid124 is
      port ( X2 : in  std_logic_vector(5 downto 0);
             X0 : in  std_logic_vector(6 downto 0);
             R : out  std_logic_vector(4 downto 0)   );
   end component;

   component XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid136 is
      port ( X2 : in  std_logic_vector(5 downto 0);
             X0 : in  std_logic_vector(6 downto 0);
             R : out  std_logic_vector(4 downto 0)   );
   end component;

   component XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid148 is
      port ( X2 : in  std_logic_vector(5 downto 0);
             X0 : in  std_logic_vector(6 downto 0);
             R : out  std_logic_vector(4 downto 0)   );
   end component;

   component XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid160 is
      port ( X2 : in  std_logic_vector(5 downto 0);
             X0 : in  std_logic_vector(6 downto 0);
             R : out  std_logic_vector(4 downto 0)   );
   end component;

   component XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid172 is
      port ( X2 : in  std_logic_vector(5 downto 0);
             X0 : in  std_logic_vector(6 downto 0);
             R : out  std_logic_vector(4 downto 0)   );
   end component;

   component XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid184 is
      port ( X2 : in  std_logic_vector(5 downto 0);
             X0 : in  std_logic_vector(6 downto 0);
             R : out  std_logic_vector(4 downto 0)   );
   end component;

   component XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid2642117_5_Freq950_uid196 is
      port ( X3 : in  std_logic_vector(1 downto 0);
             X2 : in  std_logic_vector(0 downto 0);
             X1 : in  std_logic_vector(0 downto 0);
             X0 : in  std_logic_vector(6 downto 0);
             R : out  std_logic_vector(4 downto 0)   );
   end component;

   component Compressor_FixMultiAdder_S_17_lsbOut_m11_uid2643_2_Freq950_uid210 is
      port ( X0 : in  std_logic_vector(2 downto 0);
             R : out  std_logic_vector(1 downto 0)   );
   end component;

   component XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid216 is
      port ( X2 : in  std_logic_vector(5 downto 0);
             X0 : in  std_logic_vector(6 downto 0);
             R : out  std_logic_vector(4 downto 0)   );
   end component;

   component XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid228 is
      port ( X2 : in  std_logic_vector(5 downto 0);
             X0 : in  std_logic_vector(6 downto 0);
             R : out  std_logic_vector(4 downto 0)   );
   end component;

   component XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid240 is
      port ( X2 : in  std_logic_vector(5 downto 0);
             X0 : in  std_logic_vector(6 downto 0);
             R : out  std_logic_vector(4 downto 0)   );
   end component;

   component XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid252 is
      port ( X2 : in  std_logic_vector(5 downto 0);
             X0 : in  std_logic_vector(6 downto 0);
             R : out  std_logic_vector(4 downto 0)   );
   end component;

   component XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid264 is
      port ( X2 : in  std_logic_vector(5 downto 0);
             X0 : in  std_logic_vector(6 downto 0);
             R : out  std_logic_vector(4 downto 0)   );
   end component;

   component XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid276 is
      port ( X2 : in  std_logic_vector(5 downto 0);
             X0 : in  std_logic_vector(6 downto 0);
             R : out  std_logic_vector(4 downto 0)   );
   end component;

   component XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid288 is
      port ( X2 : in  std_logic_vector(5 downto 0);
             X0 : in  std_logic_vector(6 downto 0);
             R : out  std_logic_vector(4 downto 0)   );
   end component;

   component Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid2644_Freq950_uid300 is
      port ( X3 : in  std_logic_vector(0 downto 0);
             X2 : in  std_logic_vector(2 downto 0);
             X1 : in  std_logic_vector(2 downto 0);
             X0 : in  std_logic_vector(3 downto 0);
             R : out  std_logic_vector(4 downto 0)   );
   end component;

   component Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321 is
      port ( X18 : in  std_logic_vector(0 downto 0);
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
             R : out  std_logic_vector(19 downto 0)   );
   end component;

signal iX0_c0 :  signed(1+11 downto 0);
   -- timing of iX0_c0: (c0, 0.000000ns)
signal bh3_wm11_0_c0 :  std_logic;
   -- timing of bh3_wm11_0_c0: (c0, 0.000000ns)
signal bh3_wm10_0_c0 :  std_logic;
   -- timing of bh3_wm10_0_c0: (c0, 0.000000ns)
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
signal bh3_w1_0_c0, bh3_w1_0_c1 :  std_logic;
   -- timing of bh3_w1_0_c0: (c0, 0.000000ns)
signal iX1_c0 :  signed(1+11 downto 0);
   -- timing of iX1_c0: (c0, 0.000000ns)
signal bh3_wm11_1_c0 :  std_logic;
   -- timing of bh3_wm11_1_c0: (c0, 0.000000ns)
signal bh3_wm10_1_c0 :  std_logic;
   -- timing of bh3_wm10_1_c0: (c0, 0.000000ns)
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
signal iX2_c0 :  signed(1+11 downto 0);
   -- timing of iX2_c0: (c0, 0.000000ns)
signal bh3_wm11_2_c0 :  std_logic;
   -- timing of bh3_wm11_2_c0: (c0, 0.000000ns)
signal bh3_wm10_2_c0 :  std_logic;
   -- timing of bh3_wm10_2_c0: (c0, 0.000000ns)
signal bh3_wm9_2_c0, bh3_wm9_2_c1 :  std_logic;
   -- timing of bh3_wm9_2_c0: (c0, 0.000000ns)
signal bh3_wm8_2_c0 :  std_logic;
   -- timing of bh3_wm8_2_c0: (c0, 0.000000ns)
signal bh3_wm7_2_c0, bh3_wm7_2_c1 :  std_logic;
   -- timing of bh3_wm7_2_c0: (c0, 0.000000ns)
signal bh3_wm6_2_c0 :  std_logic;
   -- timing of bh3_wm6_2_c0: (c0, 0.000000ns)
signal bh3_wm5_2_c0, bh3_wm5_2_c1 :  std_logic;
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
signal iX3_c0 :  signed(2+11 downto 0);
   -- timing of iX3_c0: (c0, 0.000000ns)
signal bh3_wm11_3_c0 :  std_logic;
   -- timing of bh3_wm11_3_c0: (c0, 0.000000ns)
signal bh3_wm10_3_c0 :  std_logic;
   -- timing of bh3_wm10_3_c0: (c0, 0.000000ns)
signal bh3_wm9_3_c0, bh3_wm9_3_c1 :  std_logic;
   -- timing of bh3_wm9_3_c0: (c0, 0.000000ns)
signal bh3_wm8_3_c0 :  std_logic;
   -- timing of bh3_wm8_3_c0: (c0, 0.000000ns)
signal bh3_wm7_3_c0 :  std_logic;
   -- timing of bh3_wm7_3_c0: (c0, 0.000000ns)
signal bh3_wm6_3_c0 :  std_logic;
   -- timing of bh3_wm6_3_c0: (c0, 0.000000ns)
signal bh3_wm5_3_c0 :  std_logic;
   -- timing of bh3_wm5_3_c0: (c0, 0.000000ns)
signal bh3_wm4_3_c0 :  std_logic;
   -- timing of bh3_wm4_3_c0: (c0, 0.000000ns)
signal bh3_wm3_3_c0 :  std_logic;
   -- timing of bh3_wm3_3_c0: (c0, 0.000000ns)
signal bh3_wm2_3_c0 :  std_logic;
   -- timing of bh3_wm2_3_c0: (c0, 0.000000ns)
signal bh3_wm1_3_c0 :  std_logic;
   -- timing of bh3_wm1_3_c0: (c0, 0.000000ns)
signal bh3_w0_3_c0 :  std_logic;
   -- timing of bh3_w0_3_c0: (c0, 0.000000ns)
signal bh3_w1_3_c0 :  std_logic;
   -- timing of bh3_w1_3_c0: (c0, 0.000000ns)
signal bh3_w2_0_c0 :  std_logic;
   -- timing of bh3_w2_0_c0: (c0, 0.000000ns)
signal iX4_c0 :  signed(1+11 downto 0);
   -- timing of iX4_c0: (c0, 0.000000ns)
signal bh3_wm11_4_c0 :  std_logic;
   -- timing of bh3_wm11_4_c0: (c0, 0.000000ns)
signal bh3_wm10_4_c0 :  std_logic;
   -- timing of bh3_wm10_4_c0: (c0, 0.000000ns)
signal bh3_wm9_4_c0 :  std_logic;
   -- timing of bh3_wm9_4_c0: (c0, 0.000000ns)
signal bh3_wm8_4_c0 :  std_logic;
   -- timing of bh3_wm8_4_c0: (c0, 0.000000ns)
signal bh3_wm7_4_c0 :  std_logic;
   -- timing of bh3_wm7_4_c0: (c0, 0.000000ns)
signal bh3_wm6_4_c0 :  std_logic;
   -- timing of bh3_wm6_4_c0: (c0, 0.000000ns)
signal bh3_wm5_4_c0 :  std_logic;
   -- timing of bh3_wm5_4_c0: (c0, 0.000000ns)
signal bh3_wm4_4_c0 :  std_logic;
   -- timing of bh3_wm4_4_c0: (c0, 0.000000ns)
signal bh3_wm3_4_c0 :  std_logic;
   -- timing of bh3_wm3_4_c0: (c0, 0.000000ns)
signal bh3_wm2_4_c0 :  std_logic;
   -- timing of bh3_wm2_4_c0: (c0, 0.000000ns)
signal bh3_wm1_4_c0 :  std_logic;
   -- timing of bh3_wm1_4_c0: (c0, 0.000000ns)
signal bh3_w0_4_c0 :  std_logic;
   -- timing of bh3_w0_4_c0: (c0, 0.000000ns)
signal bh3_w1_4_c0 :  std_logic;
   -- timing of bh3_w1_4_c0: (c0, 0.000000ns)
signal iX5_c0 :  signed(2+11 downto 0);
   -- timing of iX5_c0: (c0, 0.000000ns)
signal bh3_wm11_5_c0 :  std_logic;
   -- timing of bh3_wm11_5_c0: (c0, 0.000000ns)
signal bh3_wm10_5_c0 :  std_logic;
   -- timing of bh3_wm10_5_c0: (c0, 0.000000ns)
signal bh3_wm9_5_c0 :  std_logic;
   -- timing of bh3_wm9_5_c0: (c0, 0.000000ns)
signal bh3_wm8_5_c0 :  std_logic;
   -- timing of bh3_wm8_5_c0: (c0, 0.000000ns)
signal bh3_wm7_5_c0 :  std_logic;
   -- timing of bh3_wm7_5_c0: (c0, 0.000000ns)
signal bh3_wm6_5_c0 :  std_logic;
   -- timing of bh3_wm6_5_c0: (c0, 0.000000ns)
signal bh3_wm5_5_c0 :  std_logic;
   -- timing of bh3_wm5_5_c0: (c0, 0.000000ns)
signal bh3_wm4_5_c0 :  std_logic;
   -- timing of bh3_wm4_5_c0: (c0, 0.000000ns)
signal bh3_wm3_5_c0 :  std_logic;
   -- timing of bh3_wm3_5_c0: (c0, 0.000000ns)
signal bh3_wm2_5_c0 :  std_logic;
   -- timing of bh3_wm2_5_c0: (c0, 0.000000ns)
signal bh3_wm1_5_c0 :  std_logic;
   -- timing of bh3_wm1_5_c0: (c0, 0.000000ns)
signal bh3_w0_5_c0 :  std_logic;
   -- timing of bh3_w0_5_c0: (c0, 0.000000ns)
signal bh3_w1_5_c0 :  std_logic;
   -- timing of bh3_w1_5_c0: (c0, 0.000000ns)
signal bh3_w2_1_c0 :  std_logic;
   -- timing of bh3_w2_1_c0: (c0, 0.000000ns)
signal iX6_c0 :  signed(1+11 downto 0);
   -- timing of iX6_c0: (c0, 0.000000ns)
signal bh3_wm11_6_c0, bh3_wm11_6_c1 :  std_logic;
   -- timing of bh3_wm11_6_c0: (c0, 0.000000ns)
signal bh3_wm10_6_c0 :  std_logic;
   -- timing of bh3_wm10_6_c0: (c0, 0.000000ns)
signal bh3_wm9_6_c0 :  std_logic;
   -- timing of bh3_wm9_6_c0: (c0, 0.000000ns)
signal bh3_wm8_6_c0 :  std_logic;
   -- timing of bh3_wm8_6_c0: (c0, 0.000000ns)
signal bh3_wm7_6_c0 :  std_logic;
   -- timing of bh3_wm7_6_c0: (c0, 0.000000ns)
signal bh3_wm6_6_c0 :  std_logic;
   -- timing of bh3_wm6_6_c0: (c0, 0.000000ns)
signal bh3_wm5_6_c0 :  std_logic;
   -- timing of bh3_wm5_6_c0: (c0, 0.000000ns)
signal bh3_wm4_6_c0 :  std_logic;
   -- timing of bh3_wm4_6_c0: (c0, 0.000000ns)
signal bh3_wm3_6_c0 :  std_logic;
   -- timing of bh3_wm3_6_c0: (c0, 0.000000ns)
signal bh3_wm2_6_c0 :  std_logic;
   -- timing of bh3_wm2_6_c0: (c0, 0.000000ns)
signal bh3_wm1_6_c0 :  std_logic;
   -- timing of bh3_wm1_6_c0: (c0, 0.000000ns)
signal bh3_w0_6_c0 :  std_logic;
   -- timing of bh3_w0_6_c0: (c0, 0.000000ns)
signal bh3_w1_6_c0 :  std_logic;
   -- timing of bh3_w1_6_c0: (c0, 0.000000ns)
signal iX7_c0 :  signed(1+11 downto 0);
   -- timing of iX7_c0: (c0, 0.000000ns)
signal bh3_wm11_7_c0 :  std_logic;
   -- timing of bh3_wm11_7_c0: (c0, 0.000000ns)
signal bh3_wm10_7_c0 :  std_logic;
   -- timing of bh3_wm10_7_c0: (c0, 0.000000ns)
signal bh3_wm9_7_c0 :  std_logic;
   -- timing of bh3_wm9_7_c0: (c0, 0.000000ns)
signal bh3_wm8_7_c0 :  std_logic;
   -- timing of bh3_wm8_7_c0: (c0, 0.000000ns)
signal bh3_wm7_7_c0 :  std_logic;
   -- timing of bh3_wm7_7_c0: (c0, 0.000000ns)
signal bh3_wm6_7_c0 :  std_logic;
   -- timing of bh3_wm6_7_c0: (c0, 0.000000ns)
signal bh3_wm5_7_c0 :  std_logic;
   -- timing of bh3_wm5_7_c0: (c0, 0.000000ns)
signal bh3_wm4_7_c0 :  std_logic;
   -- timing of bh3_wm4_7_c0: (c0, 0.000000ns)
signal bh3_wm3_7_c0 :  std_logic;
   -- timing of bh3_wm3_7_c0: (c0, 0.000000ns)
signal bh3_wm2_7_c0 :  std_logic;
   -- timing of bh3_wm2_7_c0: (c0, 0.000000ns)
signal bh3_wm1_7_c0, bh3_wm1_7_c1 :  std_logic;
   -- timing of bh3_wm1_7_c0: (c0, 0.000000ns)
signal bh3_w0_7_c0 :  std_logic;
   -- timing of bh3_w0_7_c0: (c0, 0.000000ns)
signal bh3_w1_7_c0 :  std_logic;
   -- timing of bh3_w1_7_c0: (c0, 0.000000ns)
signal iX8_c0 :  signed(2+11 downto 0);
   -- timing of iX8_c0: (c0, 0.000000ns)
signal bh3_wm11_8_c0 :  std_logic;
   -- timing of bh3_wm11_8_c0: (c0, 0.000000ns)
signal bh3_wm10_8_c0 :  std_logic;
   -- timing of bh3_wm10_8_c0: (c0, 0.000000ns)
signal bh3_wm9_8_c0 :  std_logic;
   -- timing of bh3_wm9_8_c0: (c0, 0.000000ns)
signal bh3_wm8_8_c0 :  std_logic;
   -- timing of bh3_wm8_8_c0: (c0, 0.000000ns)
signal bh3_wm7_8_c0 :  std_logic;
   -- timing of bh3_wm7_8_c0: (c0, 0.000000ns)
signal bh3_wm6_8_c0 :  std_logic;
   -- timing of bh3_wm6_8_c0: (c0, 0.000000ns)
signal bh3_wm5_8_c0 :  std_logic;
   -- timing of bh3_wm5_8_c0: (c0, 0.000000ns)
signal bh3_wm4_8_c0 :  std_logic;
   -- timing of bh3_wm4_8_c0: (c0, 0.000000ns)
signal bh3_wm3_8_c0 :  std_logic;
   -- timing of bh3_wm3_8_c0: (c0, 0.000000ns)
signal bh3_wm2_8_c0 :  std_logic;
   -- timing of bh3_wm2_8_c0: (c0, 0.000000ns)
signal bh3_wm1_8_c0 :  std_logic;
   -- timing of bh3_wm1_8_c0: (c0, 0.000000ns)
signal bh3_w0_8_c0, bh3_w0_8_c1 :  std_logic;
   -- timing of bh3_w0_8_c0: (c0, 0.000000ns)
signal bh3_w1_8_c0 :  std_logic;
   -- timing of bh3_w1_8_c0: (c0, 0.000000ns)
signal bh3_w2_2_c0 :  std_logic;
   -- timing of bh3_w2_2_c0: (c0, 0.000000ns)
signal iX9_c0 :  signed(1+11 downto 0);
   -- timing of iX9_c0: (c0, 0.000000ns)
signal bh3_wm11_9_c0 :  std_logic;
   -- timing of bh3_wm11_9_c0: (c0, 0.000000ns)
signal bh3_wm10_9_c0 :  std_logic;
   -- timing of bh3_wm10_9_c0: (c0, 0.000000ns)
signal bh3_wm9_9_c0 :  std_logic;
   -- timing of bh3_wm9_9_c0: (c0, 0.000000ns)
signal bh3_wm8_9_c0 :  std_logic;
   -- timing of bh3_wm8_9_c0: (c0, 0.000000ns)
signal bh3_wm7_9_c0 :  std_logic;
   -- timing of bh3_wm7_9_c0: (c0, 0.000000ns)
signal bh3_wm6_9_c0 :  std_logic;
   -- timing of bh3_wm6_9_c0: (c0, 0.000000ns)
signal bh3_wm5_9_c0 :  std_logic;
   -- timing of bh3_wm5_9_c0: (c0, 0.000000ns)
signal bh3_wm4_9_c0 :  std_logic;
   -- timing of bh3_wm4_9_c0: (c0, 0.000000ns)
signal bh3_wm3_9_c0, bh3_wm3_9_c1 :  std_logic;
   -- timing of bh3_wm3_9_c0: (c0, 0.000000ns)
signal bh3_wm2_9_c0 :  std_logic;
   -- timing of bh3_wm2_9_c0: (c0, 0.000000ns)
signal bh3_wm1_9_c0 :  std_logic;
   -- timing of bh3_wm1_9_c0: (c0, 0.000000ns)
signal bh3_w0_9_c0, bh3_w0_9_c1 :  std_logic;
   -- timing of bh3_w0_9_c0: (c0, 0.000000ns)
signal bh3_w1_9_c0 :  std_logic;
   -- timing of bh3_w1_9_c0: (c0, 0.000000ns)
signal iX10_c0 :  signed(1+11 downto 0);
   -- timing of iX10_c0: (c0, 0.000000ns)
signal bh3_wm11_10_c0 :  std_logic;
   -- timing of bh3_wm11_10_c0: (c0, 0.000000ns)
signal bh3_wm10_10_c0 :  std_logic;
   -- timing of bh3_wm10_10_c0: (c0, 0.000000ns)
signal bh3_wm9_10_c0 :  std_logic;
   -- timing of bh3_wm9_10_c0: (c0, 0.000000ns)
signal bh3_wm8_10_c0 :  std_logic;
   -- timing of bh3_wm8_10_c0: (c0, 0.000000ns)
signal bh3_wm7_10_c0 :  std_logic;
   -- timing of bh3_wm7_10_c0: (c0, 0.000000ns)
signal bh3_wm6_10_c0 :  std_logic;
   -- timing of bh3_wm6_10_c0: (c0, 0.000000ns)
signal bh3_wm5_10_c0 :  std_logic;
   -- timing of bh3_wm5_10_c0: (c0, 0.000000ns)
signal bh3_wm4_10_c0 :  std_logic;
   -- timing of bh3_wm4_10_c0: (c0, 0.000000ns)
signal bh3_wm3_10_c0 :  std_logic;
   -- timing of bh3_wm3_10_c0: (c0, 0.000000ns)
signal bh3_wm2_10_c0 :  std_logic;
   -- timing of bh3_wm2_10_c0: (c0, 0.000000ns)
signal bh3_wm1_10_c0 :  std_logic;
   -- timing of bh3_wm1_10_c0: (c0, 0.000000ns)
signal bh3_w0_10_c0 :  std_logic;
   -- timing of bh3_w0_10_c0: (c0, 0.000000ns)
signal bh3_w1_10_c0, bh3_w1_10_c1 :  std_logic;
   -- timing of bh3_w1_10_c0: (c0, 0.000000ns)
signal iX11_c0 :  signed(1+11 downto 0);
   -- timing of iX11_c0: (c0, 0.000000ns)
signal bh3_wm11_11_c0 :  std_logic;
   -- timing of bh3_wm11_11_c0: (c0, 0.000000ns)
signal bh3_wm10_11_c0, bh3_wm10_11_c1 :  std_logic;
   -- timing of bh3_wm10_11_c0: (c0, 0.000000ns)
signal bh3_wm9_11_c0 :  std_logic;
   -- timing of bh3_wm9_11_c0: (c0, 0.000000ns)
signal bh3_wm8_11_c0 :  std_logic;
   -- timing of bh3_wm8_11_c0: (c0, 0.000000ns)
signal bh3_wm7_11_c0 :  std_logic;
   -- timing of bh3_wm7_11_c0: (c0, 0.000000ns)
signal bh3_wm6_11_c0 :  std_logic;
   -- timing of bh3_wm6_11_c0: (c0, 0.000000ns)
signal bh3_wm5_11_c0 :  std_logic;
   -- timing of bh3_wm5_11_c0: (c0, 0.000000ns)
signal bh3_wm4_11_c0 :  std_logic;
   -- timing of bh3_wm4_11_c0: (c0, 0.000000ns)
signal bh3_wm3_11_c0 :  std_logic;
   -- timing of bh3_wm3_11_c0: (c0, 0.000000ns)
signal bh3_wm2_11_c0 :  std_logic;
   -- timing of bh3_wm2_11_c0: (c0, 0.000000ns)
signal bh3_wm1_11_c0 :  std_logic;
   -- timing of bh3_wm1_11_c0: (c0, 0.000000ns)
signal bh3_w0_11_c0 :  std_logic;
   -- timing of bh3_w0_11_c0: (c0, 0.000000ns)
signal bh3_w1_11_c0, bh3_w1_11_c1 :  std_logic;
   -- timing of bh3_w1_11_c0: (c0, 0.000000ns)
signal iX12_c0 :  signed(1+11 downto 0);
   -- timing of iX12_c0: (c0, 0.000000ns)
signal bh3_wm11_12_c0 :  std_logic;
   -- timing of bh3_wm11_12_c0: (c0, 0.000000ns)
signal bh3_wm10_12_c0, bh3_wm10_12_c1 :  std_logic;
   -- timing of bh3_wm10_12_c0: (c0, 0.000000ns)
signal bh3_wm9_12_c0 :  std_logic;
   -- timing of bh3_wm9_12_c0: (c0, 0.000000ns)
signal bh3_wm8_12_c0 :  std_logic;
   -- timing of bh3_wm8_12_c0: (c0, 0.000000ns)
signal bh3_wm7_12_c0 :  std_logic;
   -- timing of bh3_wm7_12_c0: (c0, 0.000000ns)
signal bh3_wm6_12_c0 :  std_logic;
   -- timing of bh3_wm6_12_c0: (c0, 0.000000ns)
signal bh3_wm5_12_c0 :  std_logic;
   -- timing of bh3_wm5_12_c0: (c0, 0.000000ns)
signal bh3_wm4_12_c0 :  std_logic;
   -- timing of bh3_wm4_12_c0: (c0, 0.000000ns)
signal bh3_wm3_12_c0 :  std_logic;
   -- timing of bh3_wm3_12_c0: (c0, 0.000000ns)
signal bh3_wm2_12_c0 :  std_logic;
   -- timing of bh3_wm2_12_c0: (c0, 0.000000ns)
signal bh3_wm1_12_c0 :  std_logic;
   -- timing of bh3_wm1_12_c0: (c0, 0.000000ns)
signal bh3_w0_12_c0 :  std_logic;
   -- timing of bh3_w0_12_c0: (c0, 0.000000ns)
signal bh3_w1_12_c0, bh3_w1_12_c1 :  std_logic;
   -- timing of bh3_w1_12_c0: (c0, 0.000000ns)
signal iX13_c0 :  signed(2+11 downto 0);
   -- timing of iX13_c0: (c0, 0.000000ns)
signal bh3_wm11_13_c0 :  std_logic;
   -- timing of bh3_wm11_13_c0: (c0, 0.000000ns)
signal bh3_wm10_13_c0, bh3_wm10_13_c1 :  std_logic;
   -- timing of bh3_wm10_13_c0: (c0, 0.000000ns)
signal bh3_wm9_13_c0 :  std_logic;
   -- timing of bh3_wm9_13_c0: (c0, 0.000000ns)
signal bh3_wm8_13_c0 :  std_logic;
   -- timing of bh3_wm8_13_c0: (c0, 0.000000ns)
signal bh3_wm7_13_c0 :  std_logic;
   -- timing of bh3_wm7_13_c0: (c0, 0.000000ns)
signal bh3_wm6_13_c0 :  std_logic;
   -- timing of bh3_wm6_13_c0: (c0, 0.000000ns)
signal bh3_wm5_13_c0 :  std_logic;
   -- timing of bh3_wm5_13_c0: (c0, 0.000000ns)
signal bh3_wm4_13_c0, bh3_wm4_13_c1 :  std_logic;
   -- timing of bh3_wm4_13_c0: (c0, 0.000000ns)
signal bh3_wm3_13_c0 :  std_logic;
   -- timing of bh3_wm3_13_c0: (c0, 0.000000ns)
signal bh3_wm2_13_c0 :  std_logic;
   -- timing of bh3_wm2_13_c0: (c0, 0.000000ns)
signal bh3_wm1_13_c0 :  std_logic;
   -- timing of bh3_wm1_13_c0: (c0, 0.000000ns)
signal bh3_w0_13_c0 :  std_logic;
   -- timing of bh3_w0_13_c0: (c0, 0.000000ns)
signal bh3_w1_13_c0 :  std_logic;
   -- timing of bh3_w1_13_c0: (c0, 0.000000ns)
signal bh3_w2_3_c0 :  std_logic;
   -- timing of bh3_w2_3_c0: (c0, 0.000000ns)
signal iX14_c0 :  signed(2+11 downto 0);
   -- timing of iX14_c0: (c0, 0.000000ns)
signal bh3_wm11_14_c0 :  std_logic;
   -- timing of bh3_wm11_14_c0: (c0, 0.000000ns)
signal bh3_wm10_14_c0, bh3_wm10_14_c1 :  std_logic;
   -- timing of bh3_wm10_14_c0: (c0, 0.000000ns)
signal bh3_wm9_14_c0 :  std_logic;
   -- timing of bh3_wm9_14_c0: (c0, 0.000000ns)
signal bh3_wm8_14_c0, bh3_wm8_14_c1 :  std_logic;
   -- timing of bh3_wm8_14_c0: (c0, 0.000000ns)
signal bh3_wm7_14_c0 :  std_logic;
   -- timing of bh3_wm7_14_c0: (c0, 0.000000ns)
signal bh3_wm6_14_c0, bh3_wm6_14_c1 :  std_logic;
   -- timing of bh3_wm6_14_c0: (c0, 0.000000ns)
signal bh3_wm5_14_c0 :  std_logic;
   -- timing of bh3_wm5_14_c0: (c0, 0.000000ns)
signal bh3_wm4_14_c0, bh3_wm4_14_c1 :  std_logic;
   -- timing of bh3_wm4_14_c0: (c0, 0.000000ns)
signal bh3_wm3_14_c0 :  std_logic;
   -- timing of bh3_wm3_14_c0: (c0, 0.000000ns)
signal bh3_wm2_14_c0 :  std_logic;
   -- timing of bh3_wm2_14_c0: (c0, 0.000000ns)
signal bh3_wm1_14_c0 :  std_logic;
   -- timing of bh3_wm1_14_c0: (c0, 0.000000ns)
signal bh3_w0_14_c0 :  std_logic;
   -- timing of bh3_w0_14_c0: (c0, 0.000000ns)
signal bh3_w1_14_c0 :  std_logic;
   -- timing of bh3_w1_14_c0: (c0, 0.000000ns)
signal bh3_w2_4_c0, bh3_w2_4_c1 :  std_logic;
   -- timing of bh3_w2_4_c0: (c0, 0.000000ns)
signal iX15_c0 :  signed(1+11 downto 0);
   -- timing of iX15_c0: (c0, 0.000000ns)
signal bh3_wm11_15_c0 :  std_logic;
   -- timing of bh3_wm11_15_c0: (c0, 0.000000ns)
signal bh3_wm10_15_c0 :  std_logic;
   -- timing of bh3_wm10_15_c0: (c0, 0.000000ns)
signal bh3_wm9_15_c0 :  std_logic;
   -- timing of bh3_wm9_15_c0: (c0, 0.000000ns)
signal bh3_wm8_15_c0 :  std_logic;
   -- timing of bh3_wm8_15_c0: (c0, 0.000000ns)
signal bh3_wm7_15_c0 :  std_logic;
   -- timing of bh3_wm7_15_c0: (c0, 0.000000ns)
signal bh3_wm6_15_c0 :  std_logic;
   -- timing of bh3_wm6_15_c0: (c0, 0.000000ns)
signal bh3_wm5_15_c0 :  std_logic;
   -- timing of bh3_wm5_15_c0: (c0, 0.000000ns)
signal bh3_wm4_15_c0 :  std_logic;
   -- timing of bh3_wm4_15_c0: (c0, 0.000000ns)
signal bh3_wm3_15_c0 :  std_logic;
   -- timing of bh3_wm3_15_c0: (c0, 0.000000ns)
signal bh3_wm2_15_c0 :  std_logic;
   -- timing of bh3_wm2_15_c0: (c0, 0.000000ns)
signal bh3_wm1_15_c0 :  std_logic;
   -- timing of bh3_wm1_15_c0: (c0, 0.000000ns)
signal bh3_w0_15_c0 :  std_logic;
   -- timing of bh3_w0_15_c0: (c0, 0.000000ns)
signal bh3_w1_15_c0 :  std_logic;
   -- timing of bh3_w1_15_c0: (c0, 0.000000ns)
signal iX16_c0 :  signed(6+11 downto 0);
   -- timing of iX16_c0: (c0, 0.000000ns)
signal bh3_wm11_16_c0 :  std_logic;
   -- timing of bh3_wm11_16_c0: (c0, 0.000000ns)
signal bh3_wm10_16_c0 :  std_logic;
   -- timing of bh3_wm10_16_c0: (c0, 0.000000ns)
signal bh3_wm9_16_c0 :  std_logic;
   -- timing of bh3_wm9_16_c0: (c0, 0.000000ns)
signal bh3_wm8_16_c0 :  std_logic;
   -- timing of bh3_wm8_16_c0: (c0, 0.000000ns)
signal bh3_wm7_16_c0 :  std_logic;
   -- timing of bh3_wm7_16_c0: (c0, 0.000000ns)
signal bh3_wm6_16_c0 :  std_logic;
   -- timing of bh3_wm6_16_c0: (c0, 0.000000ns)
signal bh3_wm5_16_c0 :  std_logic;
   -- timing of bh3_wm5_16_c0: (c0, 0.000000ns)
signal bh3_wm4_16_c0 :  std_logic;
   -- timing of bh3_wm4_16_c0: (c0, 0.000000ns)
signal bh3_wm3_16_c0 :  std_logic;
   -- timing of bh3_wm3_16_c0: (c0, 0.000000ns)
signal bh3_wm2_16_c0 :  std_logic;
   -- timing of bh3_wm2_16_c0: (c0, 0.000000ns)
signal bh3_wm1_16_c0 :  std_logic;
   -- timing of bh3_wm1_16_c0: (c0, 0.000000ns)
signal bh3_w0_16_c0 :  std_logic;
   -- timing of bh3_w0_16_c0: (c0, 0.000000ns)
signal bh3_w1_16_c0 :  std_logic;
   -- timing of bh3_w1_16_c0: (c0, 0.000000ns)
signal bh3_w2_5_c0, bh3_w2_5_c1 :  std_logic;
   -- timing of bh3_w2_5_c0: (c0, 0.000000ns)
signal bh3_w3_0_c0 :  std_logic;
   -- timing of bh3_w3_0_c0: (c0, 0.000000ns)
signal bh3_w4_0_c0 :  std_logic;
   -- timing of bh3_w4_0_c0: (c0, 0.000000ns)
signal bh3_w5_0_c0, bh3_w5_0_c1 :  std_logic;
   -- timing of bh3_w5_0_c0: (c0, 0.000000ns)
signal bh3_w6_0_c0 :  std_logic;
   -- timing of bh3_w6_0_c0: (c0, 0.000000ns)
signal bh3_w1_17_c0 :  std_logic;
   -- timing of bh3_w1_17_c0: (c0, 0.000000ns)
signal bh3_w2_6_c0, bh3_w2_6_c1 :  std_logic;
   -- timing of bh3_w2_6_c0: (c0, 0.000000ns)
signal bh3_w4_1_c0 :  std_logic;
   -- timing of bh3_w4_1_c0: (c0, 0.000000ns)
signal bh3_w6_1_c0 :  std_logic;
   -- timing of bh3_w6_1_c0: (c0, 0.000000ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid6_bh3_uid15_In0_c0 :  std_logic_vector(6 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid6_bh3_uid15_In0_c0: (c0, 0.000000ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid6_bh3_uid15_In2_c0 :  std_logic_vector(5 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid6_bh3_uid15_In2_c0: (c0, 0.000000ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid6_bh3_uid15_Out0_c1 :  std_logic_vector(4 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid6_bh3_uid15_Out0_c0: (c1, 0.325368ns)
signal bh3_wm11_17_c1 :  std_logic;
   -- timing of bh3_wm11_17_c0: (c1, 0.325368ns)
signal bh3_wm10_17_c1, bh3_wm10_17_c2 :  std_logic;
   -- timing of bh3_wm10_17_c0: (c1, 0.325368ns)
signal bh3_wm9_17_c1 :  std_logic;
   -- timing of bh3_wm9_17_c0: (c1, 0.325368ns)
signal bh3_wm8_17_c1 :  std_logic;
   -- timing of bh3_wm8_17_c0: (c1, 0.325368ns)
signal bh3_wm7_17_c1, bh3_wm7_17_c2 :  std_logic;
   -- timing of bh3_wm7_17_c0: (c1, 0.325368ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid6_bh3_uid15_Out0_copy16_c0, XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid6_bh3_uid15_Out0_copy16_c1 :  std_logic_vector(4 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid6_bh3_uid15_Out0_copy16_c0: (c0, 0.000000ns)
signal Compressor_FixMultiAdder_S_17_lsbOut_m11_uid2645_3_Freq950_uid18_bh3_uid19_In0_c0 :  std_logic_vector(4 downto 0);
   -- timing of Compressor_FixMultiAdder_S_17_lsbOut_m11_uid2645_3_Freq950_uid18_bh3_uid19_In0_c0: (c0, 0.000000ns)
signal Compressor_FixMultiAdder_S_17_lsbOut_m11_uid2645_3_Freq950_uid18_bh3_uid19_Out0_c0 :  std_logic_vector(2 downto 0);
   -- timing of Compressor_FixMultiAdder_S_17_lsbOut_m11_uid2645_3_Freq950_uid18_bh3_uid19_Out0_c0: (c0, 0.215000ns)
signal bh3_wm11_18_c0, bh3_wm11_18_c1 :  std_logic;
   -- timing of bh3_wm11_18_c0: (c0, 0.215000ns)
signal bh3_wm10_18_c0, bh3_wm10_18_c1 :  std_logic;
   -- timing of bh3_wm10_18_c0: (c0, 0.215000ns)
signal bh3_wm9_18_c0, bh3_wm9_18_c1 :  std_logic;
   -- timing of bh3_wm9_18_c0: (c0, 0.215000ns)
signal Compressor_FixMultiAdder_S_17_lsbOut_m11_uid2645_3_Freq950_uid18_bh3_uid19_Out0_copy20_c0 :  std_logic_vector(2 downto 0);
   -- timing of Compressor_FixMultiAdder_S_17_lsbOut_m11_uid2645_3_Freq950_uid18_bh3_uid19_Out0_copy20_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_In0_c0 :  std_logic_vector(3 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_In0_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_In1_c0 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_In1_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_In2_c0 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_In2_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_In3_c0 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_In3_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_In4_c0 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_In4_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_In5_c0 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_In5_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_In6_c0 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_In6_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_In7_c0 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_In7_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_In8_c0 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_In8_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_In9_c0 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_In9_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_In10_c0 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_In10_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_In11_c0 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_In11_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_In12_c0 :  std_logic_vector(0 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_In12_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_Out0_c0 :  std_logic_vector(13 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_Out0_c0: (c0, 0.498000ns)
signal bh3_wm11_19_c0, bh3_wm11_19_c1 :  std_logic;
   -- timing of bh3_wm11_19_c0: (c0, 0.498000ns)
signal bh3_wm10_19_c0, bh3_wm10_19_c1 :  std_logic;
   -- timing of bh3_wm10_19_c0: (c0, 0.498000ns)
signal bh3_wm9_19_c0, bh3_wm9_19_c1 :  std_logic;
   -- timing of bh3_wm9_19_c0: (c0, 0.498000ns)
signal bh3_wm8_18_c0, bh3_wm8_18_c1 :  std_logic;
   -- timing of bh3_wm8_18_c0: (c0, 0.498000ns)
signal bh3_wm7_18_c0, bh3_wm7_18_c1 :  std_logic;
   -- timing of bh3_wm7_18_c0: (c0, 0.498000ns)
signal bh3_wm6_17_c0, bh3_wm6_17_c1 :  std_logic;
   -- timing of bh3_wm6_17_c0: (c0, 0.498000ns)
signal bh3_wm5_17_c0, bh3_wm5_17_c1 :  std_logic;
   -- timing of bh3_wm5_17_c0: (c0, 0.498000ns)
signal bh3_wm4_17_c0, bh3_wm4_17_c1 :  std_logic;
   -- timing of bh3_wm4_17_c0: (c0, 0.498000ns)
signal bh3_wm3_17_c0, bh3_wm3_17_c1 :  std_logic;
   -- timing of bh3_wm3_17_c0: (c0, 0.498000ns)
signal bh3_wm2_17_c0, bh3_wm2_17_c1 :  std_logic;
   -- timing of bh3_wm2_17_c0: (c0, 0.498000ns)
signal bh3_wm1_17_c0, bh3_wm1_17_c1 :  std_logic;
   -- timing of bh3_wm1_17_c0: (c0, 0.498000ns)
signal bh3_w0_17_c0, bh3_w0_17_c1 :  std_logic;
   -- timing of bh3_w0_17_c0: (c0, 0.498000ns)
signal bh3_w1_18_c0, bh3_w1_18_c1 :  std_logic;
   -- timing of bh3_w1_18_c0: (c0, 0.498000ns)
signal bh3_w2_7_c0, bh3_w2_7_c1 :  std_logic;
   -- timing of bh3_w2_7_c0: (c0, 0.498000ns)
signal Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_Out0_copy74_c0 :  std_logic_vector(13 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_Out0_copy74_c0: (c0, 0.000000ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid76_bh3_uid85_In0_c0 :  std_logic_vector(6 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid76_bh3_uid85_In0_c0: (c0, 0.000000ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid76_bh3_uid85_In2_c0 :  std_logic_vector(5 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid76_bh3_uid85_In2_c0: (c0, 0.000000ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid76_bh3_uid85_Out0_c1 :  std_logic_vector(4 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid76_bh3_uid85_Out0_c0: (c1, 0.325368ns)
signal bh3_wm10_20_c1 :  std_logic;
   -- timing of bh3_wm10_20_c0: (c1, 0.325368ns)
signal bh3_wm9_20_c1 :  std_logic;
   -- timing of bh3_wm9_20_c0: (c1, 0.325368ns)
signal bh3_wm8_19_c1 :  std_logic;
   -- timing of bh3_wm8_19_c0: (c1, 0.325368ns)
signal bh3_wm7_19_c1 :  std_logic;
   -- timing of bh3_wm7_19_c0: (c1, 0.325368ns)
signal bh3_wm6_18_c1 :  std_logic;
   -- timing of bh3_wm6_18_c0: (c1, 0.325368ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid76_bh3_uid85_Out0_copy86_c0, XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid76_bh3_uid85_Out0_copy86_c1 :  std_logic_vector(4 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid76_bh3_uid85_Out0_copy86_c0: (c0, 0.000000ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid88_bh3_uid97_In0_c0 :  std_logic_vector(6 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid88_bh3_uid97_In0_c0: (c0, 0.000000ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid88_bh3_uid97_In2_c0 :  std_logic_vector(5 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid88_bh3_uid97_In2_c0: (c0, 0.000000ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid88_bh3_uid97_Out0_c1 :  std_logic_vector(4 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid88_bh3_uid97_Out0_c0: (c1, 0.325368ns)
signal bh3_wm9_21_c1 :  std_logic;
   -- timing of bh3_wm9_21_c0: (c1, 0.325368ns)
signal bh3_wm8_20_c1 :  std_logic;
   -- timing of bh3_wm8_20_c0: (c1, 0.325368ns)
signal bh3_wm7_20_c1 :  std_logic;
   -- timing of bh3_wm7_20_c0: (c1, 0.325368ns)
signal bh3_wm6_19_c1 :  std_logic;
   -- timing of bh3_wm6_19_c0: (c1, 0.325368ns)
signal bh3_wm5_18_c1 :  std_logic;
   -- timing of bh3_wm5_18_c0: (c1, 0.325368ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid88_bh3_uid97_Out0_copy98_c0, XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid88_bh3_uid97_Out0_copy98_c1 :  std_logic_vector(4 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid88_bh3_uid97_Out0_copy98_c0: (c0, 0.000000ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid100_bh3_uid109_In0_c0 :  std_logic_vector(6 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid100_bh3_uid109_In0_c0: (c0, 0.000000ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid100_bh3_uid109_In2_c0 :  std_logic_vector(5 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid100_bh3_uid109_In2_c0: (c0, 0.000000ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid100_bh3_uid109_Out0_c1 :  std_logic_vector(4 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid100_bh3_uid109_Out0_c0: (c1, 0.325368ns)
signal bh3_wm8_21_c1 :  std_logic;
   -- timing of bh3_wm8_21_c0: (c1, 0.325368ns)
signal bh3_wm7_21_c1 :  std_logic;
   -- timing of bh3_wm7_21_c0: (c1, 0.325368ns)
signal bh3_wm6_20_c1 :  std_logic;
   -- timing of bh3_wm6_20_c0: (c1, 0.325368ns)
signal bh3_wm5_19_c1 :  std_logic;
   -- timing of bh3_wm5_19_c0: (c1, 0.325368ns)
signal bh3_wm4_18_c1 :  std_logic;
   -- timing of bh3_wm4_18_c0: (c1, 0.325368ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid100_bh3_uid109_Out0_copy110_c0, XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid100_bh3_uid109_Out0_copy110_c1 :  std_logic_vector(4 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid100_bh3_uid109_Out0_copy110_c0: (c0, 0.000000ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid112_bh3_uid121_In0_c0 :  std_logic_vector(6 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid112_bh3_uid121_In0_c0: (c0, 0.000000ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid112_bh3_uid121_In2_c0 :  std_logic_vector(5 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid112_bh3_uid121_In2_c0: (c0, 0.000000ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid112_bh3_uid121_Out0_c1 :  std_logic_vector(4 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid112_bh3_uid121_Out0_c0: (c1, 0.325368ns)
signal bh3_wm7_22_c1 :  std_logic;
   -- timing of bh3_wm7_22_c0: (c1, 0.325368ns)
signal bh3_wm6_21_c1 :  std_logic;
   -- timing of bh3_wm6_21_c0: (c1, 0.325368ns)
signal bh3_wm5_20_c1 :  std_logic;
   -- timing of bh3_wm5_20_c0: (c1, 0.325368ns)
signal bh3_wm4_19_c1 :  std_logic;
   -- timing of bh3_wm4_19_c0: (c1, 0.325368ns)
signal bh3_wm3_18_c1 :  std_logic;
   -- timing of bh3_wm3_18_c0: (c1, 0.325368ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid112_bh3_uid121_Out0_copy122_c0, XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid112_bh3_uid121_Out0_copy122_c1 :  std_logic_vector(4 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid112_bh3_uid121_Out0_copy122_c0: (c0, 0.000000ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid124_bh3_uid133_In0_c0 :  std_logic_vector(6 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid124_bh3_uid133_In0_c0: (c0, 0.000000ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid124_bh3_uid133_In2_c0 :  std_logic_vector(5 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid124_bh3_uid133_In2_c0: (c0, 0.000000ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid124_bh3_uid133_Out0_c1 :  std_logic_vector(4 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid124_bh3_uid133_Out0_c0: (c1, 0.325368ns)
signal bh3_wm6_22_c1 :  std_logic;
   -- timing of bh3_wm6_22_c0: (c1, 0.325368ns)
signal bh3_wm5_21_c1 :  std_logic;
   -- timing of bh3_wm5_21_c0: (c1, 0.325368ns)
signal bh3_wm4_20_c1 :  std_logic;
   -- timing of bh3_wm4_20_c0: (c1, 0.325368ns)
signal bh3_wm3_19_c1 :  std_logic;
   -- timing of bh3_wm3_19_c0: (c1, 0.325368ns)
signal bh3_wm2_18_c1 :  std_logic;
   -- timing of bh3_wm2_18_c0: (c1, 0.325368ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid124_bh3_uid133_Out0_copy134_c0, XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid124_bh3_uid133_Out0_copy134_c1 :  std_logic_vector(4 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid124_bh3_uid133_Out0_copy134_c0: (c0, 0.000000ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid136_bh3_uid145_In0_c0 :  std_logic_vector(6 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid136_bh3_uid145_In0_c0: (c0, 0.000000ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid136_bh3_uid145_In2_c0 :  std_logic_vector(5 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid136_bh3_uid145_In2_c0: (c0, 0.000000ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid136_bh3_uid145_Out0_c1 :  std_logic_vector(4 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid136_bh3_uid145_Out0_c0: (c1, 0.325368ns)
signal bh3_wm5_22_c1 :  std_logic;
   -- timing of bh3_wm5_22_c0: (c1, 0.325368ns)
signal bh3_wm4_21_c1 :  std_logic;
   -- timing of bh3_wm4_21_c0: (c1, 0.325368ns)
signal bh3_wm3_20_c1 :  std_logic;
   -- timing of bh3_wm3_20_c0: (c1, 0.325368ns)
signal bh3_wm2_19_c1 :  std_logic;
   -- timing of bh3_wm2_19_c0: (c1, 0.325368ns)
signal bh3_wm1_18_c1 :  std_logic;
   -- timing of bh3_wm1_18_c0: (c1, 0.325368ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid136_bh3_uid145_Out0_copy146_c0, XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid136_bh3_uid145_Out0_copy146_c1 :  std_logic_vector(4 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid136_bh3_uid145_Out0_copy146_c0: (c0, 0.000000ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid148_bh3_uid157_In0_c0 :  std_logic_vector(6 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid148_bh3_uid157_In0_c0: (c0, 0.000000ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid148_bh3_uid157_In2_c0 :  std_logic_vector(5 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid148_bh3_uid157_In2_c0: (c0, 0.000000ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid148_bh3_uid157_Out0_c1 :  std_logic_vector(4 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid148_bh3_uid157_Out0_c0: (c1, 0.325368ns)
signal bh3_wm3_21_c1 :  std_logic;
   -- timing of bh3_wm3_21_c0: (c1, 0.325368ns)
signal bh3_wm2_20_c1 :  std_logic;
   -- timing of bh3_wm2_20_c0: (c1, 0.325368ns)
signal bh3_wm1_19_c1 :  std_logic;
   -- timing of bh3_wm1_19_c0: (c1, 0.325368ns)
signal bh3_w0_18_c1 :  std_logic;
   -- timing of bh3_w0_18_c0: (c1, 0.325368ns)
signal bh3_w1_19_c1 :  std_logic;
   -- timing of bh3_w1_19_c0: (c1, 0.325368ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid148_bh3_uid157_Out0_copy158_c0, XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid148_bh3_uid157_Out0_copy158_c1 :  std_logic_vector(4 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid148_bh3_uid157_Out0_copy158_c0: (c0, 0.000000ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid160_bh3_uid169_In0_c0 :  std_logic_vector(6 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid160_bh3_uid169_In0_c0: (c0, 0.000000ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid160_bh3_uid169_In2_c0 :  std_logic_vector(5 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid160_bh3_uid169_In2_c0: (c0, 0.000000ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid160_bh3_uid169_Out0_c1 :  std_logic_vector(4 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid160_bh3_uid169_Out0_c0: (c1, 0.325368ns)
signal bh3_wm2_21_c1 :  std_logic;
   -- timing of bh3_wm2_21_c0: (c1, 0.325368ns)
signal bh3_wm1_20_c1 :  std_logic;
   -- timing of bh3_wm1_20_c0: (c1, 0.325368ns)
signal bh3_w0_19_c1 :  std_logic;
   -- timing of bh3_w0_19_c0: (c1, 0.325368ns)
signal bh3_w1_20_c1 :  std_logic;
   -- timing of bh3_w1_20_c0: (c1, 0.325368ns)
signal bh3_w2_8_c1 :  std_logic;
   -- timing of bh3_w2_8_c0: (c1, 0.325368ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid160_bh3_uid169_Out0_copy170_c0, XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid160_bh3_uid169_Out0_copy170_c1 :  std_logic_vector(4 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid160_bh3_uid169_Out0_copy170_c0: (c0, 0.000000ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid172_bh3_uid181_In0_c0 :  std_logic_vector(6 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid172_bh3_uid181_In0_c0: (c0, 0.000000ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid172_bh3_uid181_In2_c0 :  std_logic_vector(5 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid172_bh3_uid181_In2_c0: (c0, 0.000000ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid172_bh3_uid181_Out0_c1 :  std_logic_vector(4 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid172_bh3_uid181_Out0_c0: (c1, 0.325368ns)
signal bh3_wm2_22_c1 :  std_logic;
   -- timing of bh3_wm2_22_c0: (c1, 0.325368ns)
signal bh3_wm1_21_c1 :  std_logic;
   -- timing of bh3_wm1_21_c0: (c1, 0.325368ns)
signal bh3_w0_20_c1 :  std_logic;
   -- timing of bh3_w0_20_c0: (c1, 0.325368ns)
signal bh3_w1_21_c1 :  std_logic;
   -- timing of bh3_w1_21_c0: (c1, 0.325368ns)
signal bh3_w2_9_c1 :  std_logic;
   -- timing of bh3_w2_9_c0: (c1, 0.325368ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid172_bh3_uid181_Out0_copy182_c0, XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid172_bh3_uid181_Out0_copy182_c1 :  std_logic_vector(4 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid172_bh3_uid181_Out0_copy182_c0: (c0, 0.000000ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid184_bh3_uid193_In0_c0 :  std_logic_vector(6 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid184_bh3_uid193_In0_c0: (c0, 0.000000ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid184_bh3_uid193_In2_c0 :  std_logic_vector(5 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid184_bh3_uid193_In2_c0: (c0, 0.000000ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid184_bh3_uid193_Out0_c1 :  std_logic_vector(4 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid184_bh3_uid193_Out0_c0: (c1, 0.325368ns)
signal bh3_wm1_22_c1 :  std_logic;
   -- timing of bh3_wm1_22_c0: (c1, 0.325368ns)
signal bh3_w0_21_c1 :  std_logic;
   -- timing of bh3_w0_21_c0: (c1, 0.325368ns)
signal bh3_w1_22_c1 :  std_logic;
   -- timing of bh3_w1_22_c0: (c1, 0.325368ns)
signal bh3_w2_10_c1 :  std_logic;
   -- timing of bh3_w2_10_c0: (c1, 0.325368ns)
signal bh3_w3_1_c1 :  std_logic;
   -- timing of bh3_w3_1_c0: (c1, 0.325368ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid184_bh3_uid193_Out0_copy194_c0, XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid184_bh3_uid193_Out0_copy194_c1 :  std_logic_vector(4 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid184_bh3_uid193_Out0_copy194_c0: (c0, 0.000000ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid2642117_5_Freq950_uid196_bh3_uid207_In0_c0 :  std_logic_vector(6 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid2642117_5_Freq950_uid196_bh3_uid207_In0_c0: (c0, 0.000000ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid2642117_5_Freq950_uid196_bh3_uid207_In1_c0 :  std_logic_vector(0 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid2642117_5_Freq950_uid196_bh3_uid207_In1_c0: (c0, 0.000000ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid2642117_5_Freq950_uid196_bh3_uid207_In2_c0 :  std_logic_vector(0 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid2642117_5_Freq950_uid196_bh3_uid207_In2_c0: (c0, 0.000000ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid2642117_5_Freq950_uid196_bh3_uid207_In3_c0 :  std_logic_vector(1 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid2642117_5_Freq950_uid196_bh3_uid207_In3_c0: (c0, 0.000000ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid2642117_5_Freq950_uid196_bh3_uid207_Out0_c1 :  std_logic_vector(4 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid2642117_5_Freq950_uid196_bh3_uid207_Out0_c0: (c1, 0.325368ns)
signal bh3_w1_23_c1 :  std_logic;
   -- timing of bh3_w1_23_c0: (c1, 0.325368ns)
signal bh3_w2_11_c1 :  std_logic;
   -- timing of bh3_w2_11_c0: (c1, 0.325368ns)
signal bh3_w3_2_c1 :  std_logic;
   -- timing of bh3_w3_2_c0: (c1, 0.325368ns)
signal bh3_w4_2_c1 :  std_logic;
   -- timing of bh3_w4_2_c0: (c1, 0.325368ns)
signal bh3_w5_1_c1 :  std_logic;
   -- timing of bh3_w5_1_c0: (c1, 0.325368ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid2642117_5_Freq950_uid196_bh3_uid207_Out0_copy208_c0, XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid2642117_5_Freq950_uid196_bh3_uid207_Out0_copy208_c1 :  std_logic_vector(4 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid2642117_5_Freq950_uid196_bh3_uid207_Out0_copy208_c0: (c0, 0.000000ns)
signal Compressor_FixMultiAdder_S_17_lsbOut_m11_uid2643_2_Freq950_uid210_bh3_uid211_In0_c0 :  std_logic_vector(2 downto 0);
   -- timing of Compressor_FixMultiAdder_S_17_lsbOut_m11_uid2643_2_Freq950_uid210_bh3_uid211_In0_c0: (c0, 0.000000ns)
signal Compressor_FixMultiAdder_S_17_lsbOut_m11_uid2643_2_Freq950_uid210_bh3_uid211_Out0_c0 :  std_logic_vector(1 downto 0);
   -- timing of Compressor_FixMultiAdder_S_17_lsbOut_m11_uid2643_2_Freq950_uid210_bh3_uid211_Out0_c0: (c0, 0.215000ns)
signal bh3_w2_12_c0, bh3_w2_12_c1 :  std_logic;
   -- timing of bh3_w2_12_c0: (c0, 0.215000ns)
signal bh3_w3_3_c0, bh3_w3_3_c1 :  std_logic;
   -- timing of bh3_w3_3_c0: (c0, 0.215000ns)
signal Compressor_FixMultiAdder_S_17_lsbOut_m11_uid2643_2_Freq950_uid210_bh3_uid211_Out0_copy212_c0 :  std_logic_vector(1 downto 0);
   -- timing of Compressor_FixMultiAdder_S_17_lsbOut_m11_uid2643_2_Freq950_uid210_bh3_uid211_Out0_copy212_c0: (c0, 0.000000ns)
signal Compressor_FixMultiAdder_S_17_lsbOut_m11_uid2643_2_Freq950_uid210_bh3_uid213_In0_c0 :  std_logic_vector(2 downto 0);
   -- timing of Compressor_FixMultiAdder_S_17_lsbOut_m11_uid2643_2_Freq950_uid210_bh3_uid213_In0_c0: (c0, 0.000000ns)
signal Compressor_FixMultiAdder_S_17_lsbOut_m11_uid2643_2_Freq950_uid210_bh3_uid213_Out0_c0 :  std_logic_vector(1 downto 0);
   -- timing of Compressor_FixMultiAdder_S_17_lsbOut_m11_uid2643_2_Freq950_uid210_bh3_uid213_Out0_c0: (c0, 0.215000ns)
signal bh3_wm10_21_c0, bh3_wm10_21_c1, bh3_wm10_21_c2 :  std_logic;
   -- timing of bh3_wm10_21_c0: (c0, 0.215000ns)
signal bh3_wm9_22_c0, bh3_wm9_22_c1, bh3_wm9_22_c2 :  std_logic;
   -- timing of bh3_wm9_22_c0: (c0, 0.215000ns)
signal Compressor_FixMultiAdder_S_17_lsbOut_m11_uid2643_2_Freq950_uid210_bh3_uid213_Out0_copy214_c0 :  std_logic_vector(1 downto 0);
   -- timing of Compressor_FixMultiAdder_S_17_lsbOut_m11_uid2643_2_Freq950_uid210_bh3_uid213_Out0_copy214_c0: (c0, 0.000000ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid216_bh3_uid225_In0_c1 :  std_logic_vector(6 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid216_bh3_uid225_In0_c0: (c1, 0.325368ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid216_bh3_uid225_In2_c1 :  std_logic_vector(5 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid216_bh3_uid225_In2_c0: (c1, 0.325368ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid216_bh3_uid225_Out0_c2 :  std_logic_vector(4 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid216_bh3_uid225_Out0_c0: (c2, 0.650737ns)
signal bh3_wm10_22_c2 :  std_logic;
   -- timing of bh3_wm10_22_c0: (c2, 0.650737ns)
signal bh3_wm9_23_c2 :  std_logic;
   -- timing of bh3_wm9_23_c0: (c2, 0.650737ns)
signal bh3_wm8_22_c2 :  std_logic;
   -- timing of bh3_wm8_22_c0: (c2, 0.650737ns)
signal bh3_wm7_23_c2 :  std_logic;
   -- timing of bh3_wm7_23_c0: (c2, 0.650737ns)
signal bh3_wm6_23_c2 :  std_logic;
   -- timing of bh3_wm6_23_c0: (c2, 0.650737ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid216_bh3_uid225_Out0_copy226_c1, XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid216_bh3_uid225_Out0_copy226_c2 :  std_logic_vector(4 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid216_bh3_uid225_Out0_copy226_c0: (c1, 0.325368ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid228_bh3_uid237_In0_c1 :  std_logic_vector(6 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid228_bh3_uid237_In0_c0: (c1, 0.325368ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid228_bh3_uid237_In2_c1 :  std_logic_vector(5 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid228_bh3_uid237_In2_c0: (c1, 0.325368ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid228_bh3_uid237_Out0_c2 :  std_logic_vector(4 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid228_bh3_uid237_Out0_c0: (c2, 0.650737ns)
signal bh3_wm9_24_c2 :  std_logic;
   -- timing of bh3_wm9_24_c0: (c2, 0.650737ns)
signal bh3_wm8_23_c2 :  std_logic;
   -- timing of bh3_wm8_23_c0: (c2, 0.650737ns)
signal bh3_wm7_24_c2 :  std_logic;
   -- timing of bh3_wm7_24_c0: (c2, 0.650737ns)
signal bh3_wm6_24_c2 :  std_logic;
   -- timing of bh3_wm6_24_c0: (c2, 0.650737ns)
signal bh3_wm5_23_c2 :  std_logic;
   -- timing of bh3_wm5_23_c0: (c2, 0.650737ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid228_bh3_uid237_Out0_copy238_c1, XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid228_bh3_uid237_Out0_copy238_c2 :  std_logic_vector(4 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid228_bh3_uid237_Out0_copy238_c0: (c1, 0.325368ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid240_bh3_uid249_In0_c1 :  std_logic_vector(6 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid240_bh3_uid249_In0_c0: (c1, 0.325368ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid240_bh3_uid249_In2_c0, XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid240_bh3_uid249_In2_c1 :  std_logic_vector(5 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid240_bh3_uid249_In2_c0: (c0, 0.000000ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid240_bh3_uid249_Out0_c2 :  std_logic_vector(4 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid240_bh3_uid249_Out0_c0: (c2, 0.650737ns)
signal bh3_wm6_25_c2 :  std_logic;
   -- timing of bh3_wm6_25_c0: (c2, 0.650737ns)
signal bh3_wm5_24_c2 :  std_logic;
   -- timing of bh3_wm5_24_c0: (c2, 0.650737ns)
signal bh3_wm4_22_c2 :  std_logic;
   -- timing of bh3_wm4_22_c0: (c2, 0.650737ns)
signal bh3_wm3_22_c2 :  std_logic;
   -- timing of bh3_wm3_22_c0: (c2, 0.650737ns)
signal bh3_wm2_23_c2 :  std_logic;
   -- timing of bh3_wm2_23_c0: (c2, 0.650737ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid240_bh3_uid249_Out0_copy250_c1, XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid240_bh3_uid249_Out0_copy250_c2 :  std_logic_vector(4 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid240_bh3_uid249_Out0_copy250_c0: (c1, 0.325368ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid252_bh3_uid261_In0_c1 :  std_logic_vector(6 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid252_bh3_uid261_In0_c0: (c1, 0.325368ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid252_bh3_uid261_In2_c1 :  std_logic_vector(5 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid252_bh3_uid261_In2_c0: (c1, 0.325368ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid252_bh3_uid261_Out0_c2 :  std_logic_vector(4 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid252_bh3_uid261_Out0_c0: (c2, 0.650737ns)
signal bh3_wm5_25_c2 :  std_logic;
   -- timing of bh3_wm5_25_c0: (c2, 0.650737ns)
signal bh3_wm4_23_c2 :  std_logic;
   -- timing of bh3_wm4_23_c0: (c2, 0.650737ns)
signal bh3_wm3_23_c2 :  std_logic;
   -- timing of bh3_wm3_23_c0: (c2, 0.650737ns)
signal bh3_wm2_24_c2 :  std_logic;
   -- timing of bh3_wm2_24_c0: (c2, 0.650737ns)
signal bh3_wm1_23_c2 :  std_logic;
   -- timing of bh3_wm1_23_c0: (c2, 0.650737ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid252_bh3_uid261_Out0_copy262_c1, XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid252_bh3_uid261_Out0_copy262_c2 :  std_logic_vector(4 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid252_bh3_uid261_Out0_copy262_c0: (c1, 0.325368ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid264_bh3_uid273_In0_c1 :  std_logic_vector(6 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid264_bh3_uid273_In0_c0: (c1, 0.325368ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid264_bh3_uid273_In2_c1 :  std_logic_vector(5 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid264_bh3_uid273_In2_c0: (c1, 0.325368ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid264_bh3_uid273_Out0_c2 :  std_logic_vector(4 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid264_bh3_uid273_Out0_c0: (c2, 0.650737ns)
signal bh3_wm4_24_c2 :  std_logic;
   -- timing of bh3_wm4_24_c0: (c2, 0.650737ns)
signal bh3_wm3_24_c2 :  std_logic;
   -- timing of bh3_wm3_24_c0: (c2, 0.650737ns)
signal bh3_wm2_25_c2 :  std_logic;
   -- timing of bh3_wm2_25_c0: (c2, 0.650737ns)
signal bh3_wm1_24_c2 :  std_logic;
   -- timing of bh3_wm1_24_c0: (c2, 0.650737ns)
signal bh3_w0_22_c2 :  std_logic;
   -- timing of bh3_w0_22_c0: (c2, 0.650737ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid264_bh3_uid273_Out0_copy274_c1, XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid264_bh3_uid273_Out0_copy274_c2 :  std_logic_vector(4 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid264_bh3_uid273_Out0_copy274_c0: (c1, 0.325368ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid276_bh3_uid285_In0_c1 :  std_logic_vector(6 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid276_bh3_uid285_In0_c0: (c1, 0.325368ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid276_bh3_uid285_In2_c1 :  std_logic_vector(5 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid276_bh3_uid285_In2_c0: (c1, 0.325368ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid276_bh3_uid285_Out0_c2 :  std_logic_vector(4 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid276_bh3_uid285_Out0_c0: (c2, 0.650737ns)
signal bh3_wm1_25_c2 :  std_logic;
   -- timing of bh3_wm1_25_c0: (c2, 0.650737ns)
signal bh3_w0_23_c2 :  std_logic;
   -- timing of bh3_w0_23_c0: (c2, 0.650737ns)
signal bh3_w1_24_c2 :  std_logic;
   -- timing of bh3_w1_24_c0: (c2, 0.650737ns)
signal bh3_w2_13_c2 :  std_logic;
   -- timing of bh3_w2_13_c0: (c2, 0.650737ns)
signal bh3_w3_4_c2 :  std_logic;
   -- timing of bh3_w3_4_c0: (c2, 0.650737ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid276_bh3_uid285_Out0_copy286_c1, XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid276_bh3_uid285_Out0_copy286_c2 :  std_logic_vector(4 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid276_bh3_uid285_Out0_copy286_c0: (c1, 0.325368ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid288_bh3_uid297_In0_c1 :  std_logic_vector(6 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid288_bh3_uid297_In0_c0: (c1, 0.325368ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid288_bh3_uid297_In2_c1 :  std_logic_vector(5 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid288_bh3_uid297_In2_c0: (c1, 0.325368ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid288_bh3_uid297_Out0_c2 :  std_logic_vector(4 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid288_bh3_uid297_Out0_c0: (c2, 0.650737ns)
signal bh3_w0_24_c2 :  std_logic;
   -- timing of bh3_w0_24_c0: (c2, 0.650737ns)
signal bh3_w1_25_c2 :  std_logic;
   -- timing of bh3_w1_25_c0: (c2, 0.650737ns)
signal bh3_w2_14_c2 :  std_logic;
   -- timing of bh3_w2_14_c0: (c2, 0.650737ns)
signal bh3_w3_5_c2 :  std_logic;
   -- timing of bh3_w3_5_c0: (c2, 0.650737ns)
signal bh3_w4_3_c2 :  std_logic;
   -- timing of bh3_w4_3_c0: (c2, 0.650737ns)
signal XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid288_bh3_uid297_Out0_copy298_c1, XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid288_bh3_uid297_Out0_copy298_c2 :  std_logic_vector(4 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid288_bh3_uid297_Out0_copy298_c0: (c1, 0.325368ns)
signal Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid2644_Freq950_uid300_bh3_uid318_In0_c1 :  std_logic_vector(3 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid2644_Freq950_uid300_bh3_uid318_In0_c0: (c1, 0.325368ns)
signal Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid2644_Freq950_uid300_bh3_uid318_In1_c1 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid2644_Freq950_uid300_bh3_uid318_In1_c0: (c1, 0.325368ns)
signal Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid2644_Freq950_uid300_bh3_uid318_In2_c1 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid2644_Freq950_uid300_bh3_uid318_In2_c0: (c1, 0.325368ns)
signal Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid2644_Freq950_uid300_bh3_uid318_In3_c1 :  std_logic_vector(0 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid2644_Freq950_uid300_bh3_uid318_In3_c0: (c1, 0.325368ns)
signal Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid2644_Freq950_uid300_bh3_uid318_Out0_c1 :  std_logic_vector(4 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid2644_Freq950_uid300_bh3_uid318_Out0_c0: (c1, 0.797368ns)
signal bh3_w1_26_c1, bh3_w1_26_c2 :  std_logic;
   -- timing of bh3_w1_26_c0: (c1, 0.797368ns)
signal bh3_w2_15_c1, bh3_w2_15_c2 :  std_logic;
   -- timing of bh3_w2_15_c0: (c1, 0.797368ns)
signal bh3_w3_6_c1, bh3_w3_6_c2 :  std_logic;
   -- timing of bh3_w3_6_c0: (c1, 0.797368ns)
signal bh3_w4_4_c1, bh3_w4_4_c2 :  std_logic;
   -- timing of bh3_w4_4_c0: (c1, 0.797368ns)
signal bh3_w5_2_c1 :  std_logic;
   -- timing of bh3_w5_2_c0: (c1, 0.797368ns)
signal Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid2644_Freq950_uid300_bh3_uid318_Out0_copy319_c1 :  std_logic_vector(4 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid2644_Freq950_uid300_bh3_uid318_Out0_copy319_c0: (c1, 0.325368ns)
signal Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In0_c1, Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In0_c2 :  std_logic_vector(3 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In0_c0: (c1, 0.325368ns)
signal Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In1_c2 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In1_c0: (c2, 0.650737ns)
signal Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In2_c2 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In2_c0: (c2, 0.650737ns)
signal Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In3_c2 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In3_c0: (c2, 0.650737ns)
signal Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In4_c2 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In4_c0: (c2, 0.650737ns)
signal Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In5_c2 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In5_c0: (c2, 0.650737ns)
signal Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In6_c2 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In6_c0: (c2, 0.650737ns)
signal Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In7_c2 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In7_c0: (c2, 0.650737ns)
signal Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In8_c2 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In8_c0: (c2, 0.650737ns)
signal Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In9_c2 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In9_c0: (c2, 0.650737ns)
signal Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In10_c2 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In10_c0: (c2, 0.650737ns)
signal Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In11_c2 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In11_c0: (c2, 0.650737ns)
signal Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In12_c2 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In12_c0: (c2, 0.650737ns)
signal Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In13_c2 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In13_c0: (c2, 0.650737ns)
signal Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In14_c2 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In14_c0: (c2, 0.650737ns)
signal Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In15_c2 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In15_c0: (c2, 0.650737ns)
signal Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In16_c1, Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In16_c2 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In16_c0: (c1, 0.797368ns)
signal Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In17_c0, Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In17_c1, Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In17_c2 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In17_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In18_c0, Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In18_c1, Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In18_c2 :  std_logic_vector(0 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In18_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_Out0_c3 :  std_logic_vector(19 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_Out0_c0: (c3, 0.287105ns)
signal bh3_wm11_20_c3 :  std_logic;
   -- timing of bh3_wm11_20_c0: (c3, 0.287105ns)
signal bh3_wm10_23_c3 :  std_logic;
   -- timing of bh3_wm10_23_c0: (c3, 0.287105ns)
signal bh3_wm9_25_c3 :  std_logic;
   -- timing of bh3_wm9_25_c0: (c3, 0.287105ns)
signal bh3_wm8_24_c3 :  std_logic;
   -- timing of bh3_wm8_24_c0: (c3, 0.287105ns)
signal bh3_wm7_25_c3 :  std_logic;
   -- timing of bh3_wm7_25_c0: (c3, 0.287105ns)
signal bh3_wm6_26_c3 :  std_logic;
   -- timing of bh3_wm6_26_c0: (c3, 0.287105ns)
signal bh3_wm5_26_c3 :  std_logic;
   -- timing of bh3_wm5_26_c0: (c3, 0.287105ns)
signal bh3_wm4_25_c3 :  std_logic;
   -- timing of bh3_wm4_25_c0: (c3, 0.287105ns)
signal bh3_wm3_25_c3 :  std_logic;
   -- timing of bh3_wm3_25_c0: (c3, 0.287105ns)
signal bh3_wm2_26_c3 :  std_logic;
   -- timing of bh3_wm2_26_c0: (c3, 0.287105ns)
signal bh3_wm1_26_c3 :  std_logic;
   -- timing of bh3_wm1_26_c0: (c3, 0.287105ns)
signal bh3_w0_25_c3 :  std_logic;
   -- timing of bh3_w0_25_c0: (c3, 0.287105ns)
signal bh3_w1_27_c3 :  std_logic;
   -- timing of bh3_w1_27_c0: (c3, 0.287105ns)
signal bh3_w2_16_c3 :  std_logic;
   -- timing of bh3_w2_16_c0: (c3, 0.287105ns)
signal bh3_w3_7_c3 :  std_logic;
   -- timing of bh3_w3_7_c0: (c3, 0.287105ns)
signal bh3_w4_5_c3 :  std_logic;
   -- timing of bh3_w4_5_c0: (c3, 0.287105ns)
signal bh3_w5_3_c3 :  std_logic;
   -- timing of bh3_w5_3_c0: (c3, 0.287105ns)
signal bh3_w6_2_c3 :  std_logic;
   -- timing of bh3_w6_2_c0: (c3, 0.287105ns)
signal Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_Out0_copy393_c2, Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_Out0_copy393_c3 :  std_logic_vector(19 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_Out0_copy393_c0: (c2, 0.650737ns)
signal tmp_bitheapResult_bh3_17_c3 :  std_logic_vector(17 downto 0);
   -- timing of tmp_bitheapResult_bh3_17_c0: (c3, 0.287105ns)
signal bitheapResult_bh3_c3 :  std_logic_vector(17 downto 0);
   -- timing of bitheapResult_bh3_c0: (c3, 0.287105ns)
signal OutRes_c3 :  std_logic_vector(17 downto 0);
   -- timing of OutRes_c0: (c3, 0.287105ns)
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            if write_enable_1 = '1' then
            end if;
            if write_enable_2 = '1' then
            end if;
            if write_enable_3 = '1' then
            end if;
         end if;
      end process;
   process(clk, rst)
      begin
         if rst = '1' then
               bh3_w1_0_c1 <= '0';
               bh3_wm9_2_c1 <= '0';
               bh3_wm7_2_c1 <= '0';
               bh3_wm5_2_c1 <= '0';
               bh3_wm9_3_c1 <= '0';
               bh3_wm11_6_c1 <= '0';
               bh3_wm1_7_c1 <= '0';
               bh3_w0_8_c1 <= '0';
               bh3_wm3_9_c1 <= '0';
               bh3_w0_9_c1 <= '0';
               bh3_w1_10_c1 <= '0';
               bh3_wm10_11_c1 <= '0';
               bh3_w1_11_c1 <= '0';
               bh3_wm10_12_c1 <= '0';
               bh3_w1_12_c1 <= '0';
               bh3_wm10_13_c1 <= '0';
               bh3_wm4_13_c1 <= '0';
               bh3_wm10_14_c1 <= '0';
               bh3_wm8_14_c1 <= '0';
               bh3_wm6_14_c1 <= '0';
               bh3_wm4_14_c1 <= '0';
               bh3_w2_4_c1 <= '0';
               bh3_w2_5_c1 <= '0';
               bh3_w5_0_c1 <= '0';
               bh3_w2_6_c1 <= '0';
               XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid6_bh3_uid15_Out0_copy16_c1 <= (others => '0');
               bh3_wm11_18_c1 <= '0';
               bh3_wm10_18_c1 <= '0';
               bh3_wm9_18_c1 <= '0';
               bh3_wm11_19_c1 <= '0';
               bh3_wm10_19_c1 <= '0';
               bh3_wm9_19_c1 <= '0';
               bh3_wm8_18_c1 <= '0';
               bh3_wm7_18_c1 <= '0';
               bh3_wm6_17_c1 <= '0';
               bh3_wm5_17_c1 <= '0';
               bh3_wm4_17_c1 <= '0';
               bh3_wm3_17_c1 <= '0';
               bh3_wm2_17_c1 <= '0';
               bh3_wm1_17_c1 <= '0';
               bh3_w0_17_c1 <= '0';
               bh3_w1_18_c1 <= '0';
               bh3_w2_7_c1 <= '0';
               XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid76_bh3_uid85_Out0_copy86_c1 <= (others => '0');
               XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid88_bh3_uid97_Out0_copy98_c1 <= (others => '0');
               XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid100_bh3_uid109_Out0_copy110_c1 <= (others => '0');
               XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid112_bh3_uid121_Out0_copy122_c1 <= (others => '0');
               XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid124_bh3_uid133_Out0_copy134_c1 <= (others => '0');
               XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid136_bh3_uid145_Out0_copy146_c1 <= (others => '0');
               XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid148_bh3_uid157_Out0_copy158_c1 <= (others => '0');
               XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid160_bh3_uid169_Out0_copy170_c1 <= (others => '0');
               XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid172_bh3_uid181_Out0_copy182_c1 <= (others => '0');
               XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid184_bh3_uid193_Out0_copy194_c1 <= (others => '0');
               XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid2642117_5_Freq950_uid196_bh3_uid207_Out0_copy208_c1 <= (others => '0');
               bh3_w2_12_c1 <= '0';
               bh3_w3_3_c1 <= '0';
               bh3_wm10_21_c1 <= '0';
               bh3_wm9_22_c1 <= '0';
               XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid240_bh3_uid249_In2_c1 <= (others => '0');
               Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In17_c1 <= (others => '0');
               Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In18_c1 <= (others => '0');
               bh3_wm10_17_c2 <= '0';
               bh3_wm7_17_c2 <= '0';
               bh3_wm10_21_c2 <= '0';
               bh3_wm9_22_c2 <= '0';
               XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid216_bh3_uid225_Out0_copy226_c2 <= (others => '0');
               XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid228_bh3_uid237_Out0_copy238_c2 <= (others => '0');
               XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid240_bh3_uid249_Out0_copy250_c2 <= (others => '0');
               XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid252_bh3_uid261_Out0_copy262_c2 <= (others => '0');
               XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid264_bh3_uid273_Out0_copy274_c2 <= (others => '0');
               XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid276_bh3_uid285_Out0_copy286_c2 <= (others => '0');
               XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid288_bh3_uid297_Out0_copy298_c2 <= (others => '0');
               bh3_w1_26_c2 <= '0';
               bh3_w2_15_c2 <= '0';
               bh3_w3_6_c2 <= '0';
               bh3_w4_4_c2 <= '0';
               Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In0_c2 <= (others => '0');
               Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In16_c2 <= (others => '0');
               Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In17_c2 <= (others => '0');
               Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In18_c2 <= (others => '0');
               Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_Out0_copy393_c3 <= (others => '0');
         elsif clk'event and clk = '1' then
            if write_enable_1 = '1' then
               bh3_w1_0_c1 <= bh3_w1_0_c0;
               bh3_wm9_2_c1 <= bh3_wm9_2_c0;
               bh3_wm7_2_c1 <= bh3_wm7_2_c0;
               bh3_wm5_2_c1 <= bh3_wm5_2_c0;
               bh3_wm9_3_c1 <= bh3_wm9_3_c0;
               bh3_wm11_6_c1 <= bh3_wm11_6_c0;
               bh3_wm1_7_c1 <= bh3_wm1_7_c0;
               bh3_w0_8_c1 <= bh3_w0_8_c0;
               bh3_wm3_9_c1 <= bh3_wm3_9_c0;
               bh3_w0_9_c1 <= bh3_w0_9_c0;
               bh3_w1_10_c1 <= bh3_w1_10_c0;
               bh3_wm10_11_c1 <= bh3_wm10_11_c0;
               bh3_w1_11_c1 <= bh3_w1_11_c0;
               bh3_wm10_12_c1 <= bh3_wm10_12_c0;
               bh3_w1_12_c1 <= bh3_w1_12_c0;
               bh3_wm10_13_c1 <= bh3_wm10_13_c0;
               bh3_wm4_13_c1 <= bh3_wm4_13_c0;
               bh3_wm10_14_c1 <= bh3_wm10_14_c0;
               bh3_wm8_14_c1 <= bh3_wm8_14_c0;
               bh3_wm6_14_c1 <= bh3_wm6_14_c0;
               bh3_wm4_14_c1 <= bh3_wm4_14_c0;
               bh3_w2_4_c1 <= bh3_w2_4_c0;
               bh3_w2_5_c1 <= bh3_w2_5_c0;
               bh3_w5_0_c1 <= bh3_w5_0_c0;
               bh3_w2_6_c1 <= bh3_w2_6_c0;
               XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid6_bh3_uid15_Out0_copy16_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid6_bh3_uid15_Out0_copy16_c0;
               bh3_wm11_18_c1 <= bh3_wm11_18_c0;
               bh3_wm10_18_c1 <= bh3_wm10_18_c0;
               bh3_wm9_18_c1 <= bh3_wm9_18_c0;
               bh3_wm11_19_c1 <= bh3_wm11_19_c0;
               bh3_wm10_19_c1 <= bh3_wm10_19_c0;
               bh3_wm9_19_c1 <= bh3_wm9_19_c0;
               bh3_wm8_18_c1 <= bh3_wm8_18_c0;
               bh3_wm7_18_c1 <= bh3_wm7_18_c0;
               bh3_wm6_17_c1 <= bh3_wm6_17_c0;
               bh3_wm5_17_c1 <= bh3_wm5_17_c0;
               bh3_wm4_17_c1 <= bh3_wm4_17_c0;
               bh3_wm3_17_c1 <= bh3_wm3_17_c0;
               bh3_wm2_17_c1 <= bh3_wm2_17_c0;
               bh3_wm1_17_c1 <= bh3_wm1_17_c0;
               bh3_w0_17_c1 <= bh3_w0_17_c0;
               bh3_w1_18_c1 <= bh3_w1_18_c0;
               bh3_w2_7_c1 <= bh3_w2_7_c0;
               XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid76_bh3_uid85_Out0_copy86_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid76_bh3_uid85_Out0_copy86_c0;
               XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid88_bh3_uid97_Out0_copy98_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid88_bh3_uid97_Out0_copy98_c0;
               XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid100_bh3_uid109_Out0_copy110_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid100_bh3_uid109_Out0_copy110_c0;
               XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid112_bh3_uid121_Out0_copy122_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid112_bh3_uid121_Out0_copy122_c0;
               XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid124_bh3_uid133_Out0_copy134_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid124_bh3_uid133_Out0_copy134_c0;
               XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid136_bh3_uid145_Out0_copy146_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid136_bh3_uid145_Out0_copy146_c0;
               XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid148_bh3_uid157_Out0_copy158_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid148_bh3_uid157_Out0_copy158_c0;
               XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid160_bh3_uid169_Out0_copy170_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid160_bh3_uid169_Out0_copy170_c0;
               XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid172_bh3_uid181_Out0_copy182_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid172_bh3_uid181_Out0_copy182_c0;
               XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid184_bh3_uid193_Out0_copy194_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid184_bh3_uid193_Out0_copy194_c0;
               XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid2642117_5_Freq950_uid196_bh3_uid207_Out0_copy208_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid2642117_5_Freq950_uid196_bh3_uid207_Out0_copy208_c0;
               bh3_w2_12_c1 <= bh3_w2_12_c0;
               bh3_w3_3_c1 <= bh3_w3_3_c0;
               bh3_wm10_21_c1 <= bh3_wm10_21_c0;
               bh3_wm9_22_c1 <= bh3_wm9_22_c0;
               XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid240_bh3_uid249_In2_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid240_bh3_uid249_In2_c0;
               Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In17_c1 <= Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In17_c0;
               Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In18_c1 <= Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In18_c0;
            end if;
            if write_enable_2 = '1' then
               bh3_wm10_17_c2 <= bh3_wm10_17_c1;
               bh3_wm7_17_c2 <= bh3_wm7_17_c1;
               bh3_wm10_21_c2 <= bh3_wm10_21_c1;
               bh3_wm9_22_c2 <= bh3_wm9_22_c1;
               XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid216_bh3_uid225_Out0_copy226_c2 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid216_bh3_uid225_Out0_copy226_c1;
               XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid228_bh3_uid237_Out0_copy238_c2 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid228_bh3_uid237_Out0_copy238_c1;
               XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid240_bh3_uid249_Out0_copy250_c2 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid240_bh3_uid249_Out0_copy250_c1;
               XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid252_bh3_uid261_Out0_copy262_c2 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid252_bh3_uid261_Out0_copy262_c1;
               XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid264_bh3_uid273_Out0_copy274_c2 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid264_bh3_uid273_Out0_copy274_c1;
               XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid276_bh3_uid285_Out0_copy286_c2 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid276_bh3_uid285_Out0_copy286_c1;
               XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid288_bh3_uid297_Out0_copy298_c2 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid288_bh3_uid297_Out0_copy298_c1;
               bh3_w1_26_c2 <= bh3_w1_26_c1;
               bh3_w2_15_c2 <= bh3_w2_15_c1;
               bh3_w3_6_c2 <= bh3_w3_6_c1;
               bh3_w4_4_c2 <= bh3_w4_4_c1;
               Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In0_c2 <= Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In0_c1;
               Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In16_c2 <= Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In16_c1;
               Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In17_c2 <= Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In17_c1;
               Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In18_c2 <= Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In18_c1;
            end if;
            if write_enable_3 = '1' then
               Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_Out0_copy393_c3 <= Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_Out0_copy393_c2;
            end if;
         end if;
      end process;
   iX0_c0 <= signed(X0);
   bh3_wm11_0_c0 <= iX0_c0(0);
   bh3_wm10_0_c0 <= iX0_c0(1);
   bh3_wm9_0_c0 <= iX0_c0(2);
   bh3_wm8_0_c0 <= iX0_c0(3);
   bh3_wm7_0_c0 <= iX0_c0(4);
   bh3_wm6_0_c0 <= iX0_c0(5);
   bh3_wm5_0_c0 <= iX0_c0(6);
   bh3_wm4_0_c0 <= iX0_c0(7);
   bh3_wm3_0_c0 <= iX0_c0(8);
   bh3_wm2_0_c0 <= iX0_c0(9);
   bh3_wm1_0_c0 <= iX0_c0(10);
   bh3_w0_0_c0 <= iX0_c0(11);
   bh3_w1_0_c0 <= not iX0_c0(12);
   iX1_c0 <= signed(X1);
   bh3_wm11_1_c0 <= iX1_c0(0);
   bh3_wm10_1_c0 <= iX1_c0(1);
   bh3_wm9_1_c0 <= iX1_c0(2);
   bh3_wm8_1_c0 <= iX1_c0(3);
   bh3_wm7_1_c0 <= iX1_c0(4);
   bh3_wm6_1_c0 <= iX1_c0(5);
   bh3_wm5_1_c0 <= iX1_c0(6);
   bh3_wm4_1_c0 <= iX1_c0(7);
   bh3_wm3_1_c0 <= iX1_c0(8);
   bh3_wm2_1_c0 <= iX1_c0(9);
   bh3_wm1_1_c0 <= iX1_c0(10);
   bh3_w0_1_c0 <= iX1_c0(11);
   bh3_w1_1_c0 <= not iX1_c0(12);
   iX2_c0 <= signed(X2);
   bh3_wm11_2_c0 <= iX2_c0(0);
   bh3_wm10_2_c0 <= iX2_c0(1);
   bh3_wm9_2_c0 <= iX2_c0(2);
   bh3_wm8_2_c0 <= iX2_c0(3);
   bh3_wm7_2_c0 <= iX2_c0(4);
   bh3_wm6_2_c0 <= iX2_c0(5);
   bh3_wm5_2_c0 <= iX2_c0(6);
   bh3_wm4_2_c0 <= iX2_c0(7);
   bh3_wm3_2_c0 <= iX2_c0(8);
   bh3_wm2_2_c0 <= iX2_c0(9);
   bh3_wm1_2_c0 <= iX2_c0(10);
   bh3_w0_2_c0 <= iX2_c0(11);
   bh3_w1_2_c0 <= not iX2_c0(12);
   iX3_c0 <= signed(X3);
   bh3_wm11_3_c0 <= iX3_c0(0);
   bh3_wm10_3_c0 <= iX3_c0(1);
   bh3_wm9_3_c0 <= iX3_c0(2);
   bh3_wm8_3_c0 <= iX3_c0(3);
   bh3_wm7_3_c0 <= iX3_c0(4);
   bh3_wm6_3_c0 <= iX3_c0(5);
   bh3_wm5_3_c0 <= iX3_c0(6);
   bh3_wm4_3_c0 <= iX3_c0(7);
   bh3_wm3_3_c0 <= iX3_c0(8);
   bh3_wm2_3_c0 <= iX3_c0(9);
   bh3_wm1_3_c0 <= iX3_c0(10);
   bh3_w0_3_c0 <= iX3_c0(11);
   bh3_w1_3_c0 <= iX3_c0(12);
   bh3_w2_0_c0 <= not iX3_c0(13);
   iX4_c0 <= signed(X4);
   bh3_wm11_4_c0 <= iX4_c0(0);
   bh3_wm10_4_c0 <= iX4_c0(1);
   bh3_wm9_4_c0 <= iX4_c0(2);
   bh3_wm8_4_c0 <= iX4_c0(3);
   bh3_wm7_4_c0 <= iX4_c0(4);
   bh3_wm6_4_c0 <= iX4_c0(5);
   bh3_wm5_4_c0 <= iX4_c0(6);
   bh3_wm4_4_c0 <= iX4_c0(7);
   bh3_wm3_4_c0 <= iX4_c0(8);
   bh3_wm2_4_c0 <= iX4_c0(9);
   bh3_wm1_4_c0 <= iX4_c0(10);
   bh3_w0_4_c0 <= iX4_c0(11);
   bh3_w1_4_c0 <= not iX4_c0(12);
   iX5_c0 <= signed(X5);
   bh3_wm11_5_c0 <= iX5_c0(0);
   bh3_wm10_5_c0 <= iX5_c0(1);
   bh3_wm9_5_c0 <= iX5_c0(2);
   bh3_wm8_5_c0 <= iX5_c0(3);
   bh3_wm7_5_c0 <= iX5_c0(4);
   bh3_wm6_5_c0 <= iX5_c0(5);
   bh3_wm5_5_c0 <= iX5_c0(6);
   bh3_wm4_5_c0 <= iX5_c0(7);
   bh3_wm3_5_c0 <= iX5_c0(8);
   bh3_wm2_5_c0 <= iX5_c0(9);
   bh3_wm1_5_c0 <= iX5_c0(10);
   bh3_w0_5_c0 <= iX5_c0(11);
   bh3_w1_5_c0 <= iX5_c0(12);
   bh3_w2_1_c0 <= not iX5_c0(13);
   iX6_c0 <= signed(X6);
   bh3_wm11_6_c0 <= iX6_c0(0);
   bh3_wm10_6_c0 <= iX6_c0(1);
   bh3_wm9_6_c0 <= iX6_c0(2);
   bh3_wm8_6_c0 <= iX6_c0(3);
   bh3_wm7_6_c0 <= iX6_c0(4);
   bh3_wm6_6_c0 <= iX6_c0(5);
   bh3_wm5_6_c0 <= iX6_c0(6);
   bh3_wm4_6_c0 <= iX6_c0(7);
   bh3_wm3_6_c0 <= iX6_c0(8);
   bh3_wm2_6_c0 <= iX6_c0(9);
   bh3_wm1_6_c0 <= iX6_c0(10);
   bh3_w0_6_c0 <= iX6_c0(11);
   bh3_w1_6_c0 <= not iX6_c0(12);
   iX7_c0 <= signed(X7);
   bh3_wm11_7_c0 <= iX7_c0(0);
   bh3_wm10_7_c0 <= iX7_c0(1);
   bh3_wm9_7_c0 <= iX7_c0(2);
   bh3_wm8_7_c0 <= iX7_c0(3);
   bh3_wm7_7_c0 <= iX7_c0(4);
   bh3_wm6_7_c0 <= iX7_c0(5);
   bh3_wm5_7_c0 <= iX7_c0(6);
   bh3_wm4_7_c0 <= iX7_c0(7);
   bh3_wm3_7_c0 <= iX7_c0(8);
   bh3_wm2_7_c0 <= iX7_c0(9);
   bh3_wm1_7_c0 <= iX7_c0(10);
   bh3_w0_7_c0 <= iX7_c0(11);
   bh3_w1_7_c0 <= not iX7_c0(12);
   iX8_c0 <= signed(X8);
   bh3_wm11_8_c0 <= iX8_c0(0);
   bh3_wm10_8_c0 <= iX8_c0(1);
   bh3_wm9_8_c0 <= iX8_c0(2);
   bh3_wm8_8_c0 <= iX8_c0(3);
   bh3_wm7_8_c0 <= iX8_c0(4);
   bh3_wm6_8_c0 <= iX8_c0(5);
   bh3_wm5_8_c0 <= iX8_c0(6);
   bh3_wm4_8_c0 <= iX8_c0(7);
   bh3_wm3_8_c0 <= iX8_c0(8);
   bh3_wm2_8_c0 <= iX8_c0(9);
   bh3_wm1_8_c0 <= iX8_c0(10);
   bh3_w0_8_c0 <= iX8_c0(11);
   bh3_w1_8_c0 <= iX8_c0(12);
   bh3_w2_2_c0 <= not iX8_c0(13);
   iX9_c0 <= signed(X9);
   bh3_wm11_9_c0 <= iX9_c0(0);
   bh3_wm10_9_c0 <= iX9_c0(1);
   bh3_wm9_9_c0 <= iX9_c0(2);
   bh3_wm8_9_c0 <= iX9_c0(3);
   bh3_wm7_9_c0 <= iX9_c0(4);
   bh3_wm6_9_c0 <= iX9_c0(5);
   bh3_wm5_9_c0 <= iX9_c0(6);
   bh3_wm4_9_c0 <= iX9_c0(7);
   bh3_wm3_9_c0 <= iX9_c0(8);
   bh3_wm2_9_c0 <= iX9_c0(9);
   bh3_wm1_9_c0 <= iX9_c0(10);
   bh3_w0_9_c0 <= iX9_c0(11);
   bh3_w1_9_c0 <= not iX9_c0(12);
   iX10_c0 <= signed(X10);
   bh3_wm11_10_c0 <= iX10_c0(0);
   bh3_wm10_10_c0 <= iX10_c0(1);
   bh3_wm9_10_c0 <= iX10_c0(2);
   bh3_wm8_10_c0 <= iX10_c0(3);
   bh3_wm7_10_c0 <= iX10_c0(4);
   bh3_wm6_10_c0 <= iX10_c0(5);
   bh3_wm5_10_c0 <= iX10_c0(6);
   bh3_wm4_10_c0 <= iX10_c0(7);
   bh3_wm3_10_c0 <= iX10_c0(8);
   bh3_wm2_10_c0 <= iX10_c0(9);
   bh3_wm1_10_c0 <= iX10_c0(10);
   bh3_w0_10_c0 <= iX10_c0(11);
   bh3_w1_10_c0 <= not iX10_c0(12);
   iX11_c0 <= signed(X11);
   bh3_wm11_11_c0 <= iX11_c0(0);
   bh3_wm10_11_c0 <= iX11_c0(1);
   bh3_wm9_11_c0 <= iX11_c0(2);
   bh3_wm8_11_c0 <= iX11_c0(3);
   bh3_wm7_11_c0 <= iX11_c0(4);
   bh3_wm6_11_c0 <= iX11_c0(5);
   bh3_wm5_11_c0 <= iX11_c0(6);
   bh3_wm4_11_c0 <= iX11_c0(7);
   bh3_wm3_11_c0 <= iX11_c0(8);
   bh3_wm2_11_c0 <= iX11_c0(9);
   bh3_wm1_11_c0 <= iX11_c0(10);
   bh3_w0_11_c0 <= iX11_c0(11);
   bh3_w1_11_c0 <= not iX11_c0(12);
   iX12_c0 <= signed(X12);
   bh3_wm11_12_c0 <= iX12_c0(0);
   bh3_wm10_12_c0 <= iX12_c0(1);
   bh3_wm9_12_c0 <= iX12_c0(2);
   bh3_wm8_12_c0 <= iX12_c0(3);
   bh3_wm7_12_c0 <= iX12_c0(4);
   bh3_wm6_12_c0 <= iX12_c0(5);
   bh3_wm5_12_c0 <= iX12_c0(6);
   bh3_wm4_12_c0 <= iX12_c0(7);
   bh3_wm3_12_c0 <= iX12_c0(8);
   bh3_wm2_12_c0 <= iX12_c0(9);
   bh3_wm1_12_c0 <= iX12_c0(10);
   bh3_w0_12_c0 <= iX12_c0(11);
   bh3_w1_12_c0 <= not iX12_c0(12);
   iX13_c0 <= signed(X13);
   bh3_wm11_13_c0 <= iX13_c0(0);
   bh3_wm10_13_c0 <= iX13_c0(1);
   bh3_wm9_13_c0 <= iX13_c0(2);
   bh3_wm8_13_c0 <= iX13_c0(3);
   bh3_wm7_13_c0 <= iX13_c0(4);
   bh3_wm6_13_c0 <= iX13_c0(5);
   bh3_wm5_13_c0 <= iX13_c0(6);
   bh3_wm4_13_c0 <= iX13_c0(7);
   bh3_wm3_13_c0 <= iX13_c0(8);
   bh3_wm2_13_c0 <= iX13_c0(9);
   bh3_wm1_13_c0 <= iX13_c0(10);
   bh3_w0_13_c0 <= iX13_c0(11);
   bh3_w1_13_c0 <= iX13_c0(12);
   bh3_w2_3_c0 <= not iX13_c0(13);
   iX14_c0 <= signed(X14);
   bh3_wm11_14_c0 <= iX14_c0(0);
   bh3_wm10_14_c0 <= iX14_c0(1);
   bh3_wm9_14_c0 <= iX14_c0(2);
   bh3_wm8_14_c0 <= iX14_c0(3);
   bh3_wm7_14_c0 <= iX14_c0(4);
   bh3_wm6_14_c0 <= iX14_c0(5);
   bh3_wm5_14_c0 <= iX14_c0(6);
   bh3_wm4_14_c0 <= iX14_c0(7);
   bh3_wm3_14_c0 <= iX14_c0(8);
   bh3_wm2_14_c0 <= iX14_c0(9);
   bh3_wm1_14_c0 <= iX14_c0(10);
   bh3_w0_14_c0 <= iX14_c0(11);
   bh3_w1_14_c0 <= iX14_c0(12);
   bh3_w2_4_c0 <= not iX14_c0(13);
   iX15_c0 <= signed(X15);
   bh3_wm11_15_c0 <= iX15_c0(0);
   bh3_wm10_15_c0 <= iX15_c0(1);
   bh3_wm9_15_c0 <= iX15_c0(2);
   bh3_wm8_15_c0 <= iX15_c0(3);
   bh3_wm7_15_c0 <= iX15_c0(4);
   bh3_wm6_15_c0 <= iX15_c0(5);
   bh3_wm5_15_c0 <= iX15_c0(6);
   bh3_wm4_15_c0 <= iX15_c0(7);
   bh3_wm3_15_c0 <= iX15_c0(8);
   bh3_wm2_15_c0 <= iX15_c0(9);
   bh3_wm1_15_c0 <= iX15_c0(10);
   bh3_w0_15_c0 <= iX15_c0(11);
   bh3_w1_15_c0 <= not iX15_c0(12);
   iX16_c0 <= signed(X16);
   bh3_wm11_16_c0 <= iX16_c0(0);
   bh3_wm10_16_c0 <= iX16_c0(1);
   bh3_wm9_16_c0 <= iX16_c0(2);
   bh3_wm8_16_c0 <= iX16_c0(3);
   bh3_wm7_16_c0 <= iX16_c0(4);
   bh3_wm6_16_c0 <= iX16_c0(5);
   bh3_wm5_16_c0 <= iX16_c0(6);
   bh3_wm4_16_c0 <= iX16_c0(7);
   bh3_wm3_16_c0 <= iX16_c0(8);
   bh3_wm2_16_c0 <= iX16_c0(9);
   bh3_wm1_16_c0 <= iX16_c0(10);
   bh3_w0_16_c0 <= iX16_c0(11);
   bh3_w1_16_c0 <= iX16_c0(12);
   bh3_w2_5_c0 <= iX16_c0(13);
   bh3_w3_0_c0 <= iX16_c0(14);
   bh3_w4_0_c0 <= iX16_c0(15);
   bh3_w5_0_c0 <= iX16_c0(16);
   bh3_w6_0_c0 <= iX16_c0(17);

   -- Adding the constant bits 
   bh3_w1_17_c0 <= '1';
   bh3_w2_6_c0 <= '1';
   bh3_w4_1_c0 <= '1';
   bh3_w6_1_c0 <= '1';


   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid6_bh3_uid15_In0_c0 <= "" & bh3_wm11_8_c0 & bh3_wm11_16_c0 & bh3_wm11_15_c0 & bh3_wm11_14_c0 & bh3_wm11_13_c0 & bh3_wm11_12_c0 & bh3_wm11_11_c0;
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid6_bh3_uid15_In2_c0 <= "" & bh3_wm9_8_c0 & bh3_wm9_16_c0 & bh3_wm9_15_c0 & bh3_wm9_14_c0 & bh3_wm9_13_c0 & "0";
   bh3_wm11_17_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid6_bh3_uid15_Out0_c1(0);
   bh3_wm10_17_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid6_bh3_uid15_Out0_c1(1);
   bh3_wm9_17_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid6_bh3_uid15_Out0_c1(2);
   bh3_wm8_17_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid6_bh3_uid15_Out0_c1(3);
   bh3_wm7_17_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid6_bh3_uid15_Out0_c1(4);
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid6_uid15: XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid6
      port map ( X0 => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid6_bh3_uid15_In0_c0,
                 X2 => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid6_bh3_uid15_In2_c0,
                 R => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid6_bh3_uid15_Out0_copy16_c0);
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid6_bh3_uid15_Out0_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid6_bh3_uid15_Out0_copy16_c1; -- output copy to hold a pipeline register if needed


   Compressor_FixMultiAdder_S_17_lsbOut_m11_uid2645_3_Freq950_uid18_bh3_uid19_In0_c0 <= "" & bh3_wm11_1_c0 & bh3_wm11_2_c0 & bh3_wm11_3_c0 & bh3_wm11_4_c0 & bh3_wm11_5_c0;
   bh3_wm11_18_c0 <= Compressor_FixMultiAdder_S_17_lsbOut_m11_uid2645_3_Freq950_uid18_bh3_uid19_Out0_c0(0);
   bh3_wm10_18_c0 <= Compressor_FixMultiAdder_S_17_lsbOut_m11_uid2645_3_Freq950_uid18_bh3_uid19_Out0_c0(1);
   bh3_wm9_18_c0 <= Compressor_FixMultiAdder_S_17_lsbOut_m11_uid2645_3_Freq950_uid18_bh3_uid19_Out0_c0(2);
   Compressor_FixMultiAdder_S_17_lsbOut_m11_uid2645_3_Freq950_uid18_uid19: Compressor_FixMultiAdder_S_17_lsbOut_m11_uid2645_3_Freq950_uid18
      port map ( X0 => Compressor_FixMultiAdder_S_17_lsbOut_m11_uid2645_3_Freq950_uid18_bh3_uid19_In0_c0,
                 R => Compressor_FixMultiAdder_S_17_lsbOut_m11_uid2645_3_Freq950_uid18_bh3_uid19_Out0_copy20_c0);
   Compressor_FixMultiAdder_S_17_lsbOut_m11_uid2645_3_Freq950_uid18_bh3_uid19_Out0_c0 <= Compressor_FixMultiAdder_S_17_lsbOut_m11_uid2645_3_Freq950_uid18_bh3_uid19_Out0_copy20_c0; -- output copy to hold a pipeline register if needed


   Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_In0_c0 <= "" & bh3_wm11_10_c0 & bh3_wm11_9_c0 & bh3_wm11_0_c0 & bh3_wm11_7_c0;
   Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_In1_c0 <= "" & bh3_wm10_1_c0 & bh3_wm10_8_c0 & bh3_wm10_15_c0;
   Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_In2_c0 <= "" & bh3_wm9_1_c0 & bh3_wm9_12_c0 & bh3_wm9_11_c0;
   Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_In3_c0 <= "" & bh3_wm8_1_c0 & bh3_wm8_8_c0 & bh3_wm8_15_c0;
   Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_In4_c0 <= "" & bh3_wm7_1_c0 & bh3_wm7_8_c0 & bh3_wm7_15_c0;
   Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_In5_c0 <= "" & bh3_wm6_0_c0 & bh3_wm6_16_c0 & bh3_wm6_15_c0;
   Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_In6_c0 <= "" & bh3_wm5_0_c0 & bh3_wm5_16_c0 & bh3_wm5_15_c0;
   Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_In7_c0 <= "" & bh3_wm4_0_c0 & bh3_wm4_16_c0 & bh3_wm4_15_c0;
   Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_In8_c0 <= "" & bh3_wm3_0_c0 & bh3_wm3_16_c0 & bh3_wm3_15_c0;
   Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_In9_c0 <= "" & bh3_wm2_0_c0 & bh3_wm2_16_c0 & bh3_wm2_15_c0;
   Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_In10_c0 <= "" & bh3_wm1_0_c0 & bh3_wm1_16_c0 & bh3_wm1_15_c0;
   Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_In11_c0 <= "" & bh3_w0_0_c0 & bh3_w0_16_c0 & bh3_w0_15_c0;
   Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_In12_c0 <= "" & bh3_w1_9_c0;
   bh3_wm11_19_c0 <= Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_Out0_c0(0);
   bh3_wm10_19_c0 <= Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_Out0_c0(1);
   bh3_wm9_19_c0 <= Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_Out0_c0(2);
   bh3_wm8_18_c0 <= Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_Out0_c0(3);
   bh3_wm7_18_c0 <= Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_Out0_c0(4);
   bh3_wm6_17_c0 <= Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_Out0_c0(5);
   bh3_wm5_17_c0 <= Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_Out0_c0(6);
   bh3_wm4_17_c0 <= Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_Out0_c0(7);
   bh3_wm3_17_c0 <= Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_Out0_c0(8);
   bh3_wm2_17_c0 <= Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_Out0_c0(9);
   bh3_wm1_17_c0 <= Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_Out0_c0(10);
   bh3_w0_17_c0 <= Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_Out0_c0(11);
   bh3_w1_18_c0 <= Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_Out0_c0(12);
   bh3_w2_7_c0 <= Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_Out0_c0(13);
   Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_uid73: Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22
      port map ( X0 => Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_In0_c0,
                 X1 => Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_In1_c0,
                 X10 => Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_In10_c0,
                 X11 => Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_In11_c0,
                 X12 => Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_In12_c0,
                 X2 => Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_In2_c0,
                 X3 => Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_In3_c0,
                 X4 => Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_In4_c0,
                 X5 => Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_In5_c0,
                 X6 => Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_In6_c0,
                 X7 => Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_In7_c0,
                 X8 => Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_In8_c0,
                 X9 => Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_In9_c0,
                 R => Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_Out0_copy74_c0);
   Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_Out0_c0 <= Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26413_Freq950_uid22_bh3_uid73_Out0_copy74_c0; -- output copy to hold a pipeline register if needed


   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid76_bh3_uid85_In0_c0 <= "" & bh3_wm10_16_c0 & bh3_wm10_2_c0 & bh3_wm10_3_c0 & bh3_wm10_4_c0 & bh3_wm10_5_c0 & bh3_wm10_6_c0 & bh3_wm10_7_c0;
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid76_bh3_uid85_In2_c0 <= "" & bh3_wm8_16_c0 & bh3_wm8_2_c0 & bh3_wm8_3_c0 & bh3_wm8_4_c0 & bh3_wm8_5_c0 & bh3_wm8_6_c0;
   bh3_wm10_20_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid76_bh3_uid85_Out0_c1(0);
   bh3_wm9_20_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid76_bh3_uid85_Out0_c1(1);
   bh3_wm8_19_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid76_bh3_uid85_Out0_c1(2);
   bh3_wm7_19_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid76_bh3_uid85_Out0_c1(3);
   bh3_wm6_18_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid76_bh3_uid85_Out0_c1(4);
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid76_uid85: XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid76
      port map ( X0 => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid76_bh3_uid85_In0_c0,
                 X2 => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid76_bh3_uid85_In2_c0,
                 R => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid76_bh3_uid85_Out0_copy86_c0);
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid76_bh3_uid85_Out0_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid76_bh3_uid85_Out0_copy86_c1; -- output copy to hold a pipeline register if needed


   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid88_bh3_uid97_In0_c0 <= "" & bh3_wm9_10_c0 & bh3_wm9_9_c0 & bh3_wm9_0_c0 & bh3_wm9_7_c0 & bh3_wm9_6_c0 & bh3_wm9_5_c0 & bh3_wm9_4_c0;
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid88_bh3_uid97_In2_c0 <= "" & bh3_wm7_16_c0 & bh3_wm7_14_c0 & bh3_wm7_13_c0 & bh3_wm7_12_c0 & bh3_wm7_11_c0 & bh3_wm7_10_c0;
   bh3_wm9_21_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid88_bh3_uid97_Out0_c1(0);
   bh3_wm8_20_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid88_bh3_uid97_Out0_c1(1);
   bh3_wm7_20_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid88_bh3_uid97_Out0_c1(2);
   bh3_wm6_19_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid88_bh3_uid97_Out0_c1(3);
   bh3_wm5_18_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid88_bh3_uid97_Out0_c1(4);
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid88_uid97: XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid88
      port map ( X0 => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid88_bh3_uid97_In0_c0,
                 X2 => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid88_bh3_uid97_In2_c0,
                 R => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid88_bh3_uid97_Out0_copy98_c0);
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid88_bh3_uid97_Out0_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid88_bh3_uid97_Out0_copy98_c1; -- output copy to hold a pipeline register if needed


   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid100_bh3_uid109_In0_c0 <= "" & bh3_wm8_7_c0 & bh3_wm8_0_c0 & bh3_wm8_9_c0 & bh3_wm8_10_c0 & bh3_wm8_11_c0 & bh3_wm8_12_c0 & bh3_wm8_13_c0;
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid100_bh3_uid109_In2_c0 <= "" & bh3_wm6_2_c0 & bh3_wm6_3_c0 & bh3_wm6_4_c0 & bh3_wm6_5_c0 & bh3_wm6_6_c0 & bh3_wm6_7_c0;
   bh3_wm8_21_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid100_bh3_uid109_Out0_c1(0);
   bh3_wm7_21_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid100_bh3_uid109_Out0_c1(1);
   bh3_wm6_20_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid100_bh3_uid109_Out0_c1(2);
   bh3_wm5_19_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid100_bh3_uid109_Out0_c1(3);
   bh3_wm4_18_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid100_bh3_uid109_Out0_c1(4);
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid100_uid109: XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid100
      port map ( X0 => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid100_bh3_uid109_In0_c0,
                 X2 => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid100_bh3_uid109_In2_c0,
                 R => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid100_bh3_uid109_Out0_copy110_c0);
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid100_bh3_uid109_Out0_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid100_bh3_uid109_Out0_copy110_c1; -- output copy to hold a pipeline register if needed


   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid112_bh3_uid121_In0_c0 <= "" & bh3_wm7_9_c0 & bh3_wm7_0_c0 & bh3_wm7_7_c0 & bh3_wm7_6_c0 & bh3_wm7_5_c0 & bh3_wm7_4_c0 & bh3_wm7_3_c0;
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid112_bh3_uid121_In2_c0 <= "" & bh3_wm5_1_c0 & bh3_wm5_14_c0 & bh3_wm5_13_c0 & bh3_wm5_12_c0 & bh3_wm5_11_c0 & bh3_wm5_10_c0;
   bh3_wm7_22_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid112_bh3_uid121_Out0_c1(0);
   bh3_wm6_21_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid112_bh3_uid121_Out0_c1(1);
   bh3_wm5_20_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid112_bh3_uid121_Out0_c1(2);
   bh3_wm4_19_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid112_bh3_uid121_Out0_c1(3);
   bh3_wm3_18_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid112_bh3_uid121_Out0_c1(4);
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid112_uid121: XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid112
      port map ( X0 => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid112_bh3_uid121_In0_c0,
                 X2 => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid112_bh3_uid121_In2_c0,
                 R => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid112_bh3_uid121_Out0_copy122_c0);
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid112_bh3_uid121_Out0_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid112_bh3_uid121_Out0_copy122_c1; -- output copy to hold a pipeline register if needed


   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid124_bh3_uid133_In0_c0 <= "" & bh3_wm6_1_c0 & bh3_wm6_9_c0 & bh3_wm6_8_c0 & bh3_wm6_10_c0 & bh3_wm6_11_c0 & bh3_wm6_12_c0 & bh3_wm6_13_c0;
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid124_bh3_uid133_In2_c0 <= "" & bh3_wm4_1_c0 & bh3_wm4_2_c0 & bh3_wm4_3_c0 & bh3_wm4_4_c0 & bh3_wm4_5_c0 & bh3_wm4_6_c0;
   bh3_wm6_22_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid124_bh3_uid133_Out0_c1(0);
   bh3_wm5_21_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid124_bh3_uid133_Out0_c1(1);
   bh3_wm4_20_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid124_bh3_uid133_Out0_c1(2);
   bh3_wm3_19_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid124_bh3_uid133_Out0_c1(3);
   bh3_wm2_18_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid124_bh3_uid133_Out0_c1(4);
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid124_uid133: XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid124
      port map ( X0 => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid124_bh3_uid133_In0_c0,
                 X2 => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid124_bh3_uid133_In2_c0,
                 R => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid124_bh3_uid133_Out0_copy134_c0);
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid124_bh3_uid133_Out0_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid124_bh3_uid133_Out0_copy134_c1; -- output copy to hold a pipeline register if needed


   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid136_bh3_uid145_In0_c0 <= "" & bh3_wm5_8_c0 & bh3_wm5_9_c0 & bh3_wm5_7_c0 & bh3_wm5_6_c0 & bh3_wm5_5_c0 & bh3_wm5_4_c0 & bh3_wm5_3_c0;
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid136_bh3_uid145_In2_c0 <= "" & bh3_wm3_14_c0 & bh3_wm3_13_c0 & bh3_wm3_12_c0 & bh3_wm3_11_c0 & bh3_wm3_10_c0 & bh3_wm3_8_c0;
   bh3_wm5_22_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid136_bh3_uid145_Out0_c1(0);
   bh3_wm4_21_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid136_bh3_uid145_Out0_c1(1);
   bh3_wm3_20_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid136_bh3_uid145_Out0_c1(2);
   bh3_wm2_19_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid136_bh3_uid145_Out0_c1(3);
   bh3_wm1_18_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid136_bh3_uid145_Out0_c1(4);
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid136_uid145: XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid136
      port map ( X0 => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid136_bh3_uid145_In0_c0,
                 X2 => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid136_bh3_uid145_In2_c0,
                 R => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid136_bh3_uid145_Out0_copy146_c0);
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid136_bh3_uid145_Out0_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid136_bh3_uid145_Out0_copy146_c1; -- output copy to hold a pipeline register if needed


   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid148_bh3_uid157_In0_c0 <= "" & bh3_wm3_1_c0 & bh3_wm3_2_c0 & bh3_wm3_3_c0 & bh3_wm3_4_c0 & bh3_wm3_5_c0 & bh3_wm3_6_c0 & bh3_wm3_7_c0;
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid148_bh3_uid157_In2_c0 <= "" & bh3_wm1_1_c0 & bh3_wm1_2_c0 & bh3_wm1_3_c0 & bh3_wm1_4_c0 & bh3_wm1_5_c0 & bh3_wm1_6_c0;
   bh3_wm3_21_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid148_bh3_uid157_Out0_c1(0);
   bh3_wm2_20_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid148_bh3_uid157_Out0_c1(1);
   bh3_wm1_19_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid148_bh3_uid157_Out0_c1(2);
   bh3_w0_18_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid148_bh3_uid157_Out0_c1(3);
   bh3_w1_19_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid148_bh3_uid157_Out0_c1(4);
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid148_uid157: XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid148
      port map ( X0 => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid148_bh3_uid157_In0_c0,
                 X2 => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid148_bh3_uid157_In2_c0,
                 R => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid148_bh3_uid157_Out0_copy158_c0);
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid148_bh3_uid157_Out0_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid148_bh3_uid157_Out0_copy158_c1; -- output copy to hold a pipeline register if needed


   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid160_bh3_uid169_In0_c0 <= "" & bh3_wm2_1_c0 & bh3_wm2_14_c0 & bh3_wm2_13_c0 & bh3_wm2_12_c0 & bh3_wm2_11_c0 & bh3_wm2_10_c0 & bh3_wm2_8_c0;
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid160_bh3_uid169_In2_c0 <= "" & bh3_w0_1_c0 & bh3_w0_14_c0 & bh3_w0_13_c0 & bh3_w0_12_c0 & bh3_w0_11_c0 & bh3_w0_10_c0;
   bh3_wm2_21_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid160_bh3_uid169_Out0_c1(0);
   bh3_wm1_20_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid160_bh3_uid169_Out0_c1(1);
   bh3_w0_19_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid160_bh3_uid169_Out0_c1(2);
   bh3_w1_20_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid160_bh3_uid169_Out0_c1(3);
   bh3_w2_8_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid160_bh3_uid169_Out0_c1(4);
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid160_uid169: XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid160
      port map ( X0 => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid160_bh3_uid169_In0_c0,
                 X2 => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid160_bh3_uid169_In2_c0,
                 R => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid160_bh3_uid169_Out0_copy170_c0);
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid160_bh3_uid169_Out0_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid160_bh3_uid169_Out0_copy170_c1; -- output copy to hold a pipeline register if needed


   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid172_bh3_uid181_In0_c0 <= "" & bh3_wm2_2_c0 & bh3_wm2_3_c0 & bh3_wm2_4_c0 & bh3_wm2_5_c0 & bh3_wm2_6_c0 & bh3_wm2_7_c0 & bh3_wm2_9_c0;
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid172_bh3_uid181_In2_c0 <= "" & bh3_w0_2_c0 & bh3_w0_3_c0 & bh3_w0_4_c0 & bh3_w0_5_c0 & bh3_w0_6_c0 & bh3_w0_7_c0;
   bh3_wm2_22_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid172_bh3_uid181_Out0_c1(0);
   bh3_wm1_21_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid172_bh3_uid181_Out0_c1(1);
   bh3_w0_20_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid172_bh3_uid181_Out0_c1(2);
   bh3_w1_21_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid172_bh3_uid181_Out0_c1(3);
   bh3_w2_9_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid172_bh3_uid181_Out0_c1(4);
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid172_uid181: XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid172
      port map ( X0 => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid172_bh3_uid181_In0_c0,
                 X2 => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid172_bh3_uid181_In2_c0,
                 R => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid172_bh3_uid181_Out0_copy182_c0);
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid172_bh3_uid181_Out0_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid172_bh3_uid181_Out0_copy182_c1; -- output copy to hold a pipeline register if needed


   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid184_bh3_uid193_In0_c0 <= "" & bh3_wm1_14_c0 & bh3_wm1_13_c0 & bh3_wm1_12_c0 & bh3_wm1_11_c0 & bh3_wm1_10_c0 & bh3_wm1_8_c0 & bh3_wm1_9_c0;
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid184_bh3_uid193_In2_c0 <= "" & bh3_w1_17_c0 & bh3_w1_1_c0 & bh3_w1_16_c0 & bh3_w1_15_c0 & bh3_w1_14_c0 & bh3_w1_13_c0;
   bh3_wm1_22_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid184_bh3_uid193_Out0_c1(0);
   bh3_w0_21_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid184_bh3_uid193_Out0_c1(1);
   bh3_w1_22_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid184_bh3_uid193_Out0_c1(2);
   bh3_w2_10_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid184_bh3_uid193_Out0_c1(3);
   bh3_w3_1_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid184_bh3_uid193_Out0_c1(4);
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid184_uid193: XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid184
      port map ( X0 => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid184_bh3_uid193_In0_c0,
                 X2 => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid184_bh3_uid193_In2_c0,
                 R => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid184_bh3_uid193_Out0_copy194_c0);
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid184_bh3_uid193_Out0_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid184_bh3_uid193_Out0_copy194_c1; -- output copy to hold a pipeline register if needed


   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid2642117_5_Freq950_uid196_bh3_uid207_In0_c0 <= "" & bh3_w1_2_c0 & bh3_w1_3_c0 & bh3_w1_4_c0 & bh3_w1_5_c0 & bh3_w1_6_c0 & bh3_w1_7_c0 & bh3_w1_8_c0;
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid2642117_5_Freq950_uid196_bh3_uid207_In1_c0 <= "" & bh3_w2_0_c0;
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid2642117_5_Freq950_uid196_bh3_uid207_In2_c0 <= "" & bh3_w3_0_c0;
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid2642117_5_Freq950_uid196_bh3_uid207_In3_c0 <= "" & bh3_w4_0_c0 & bh3_w4_1_c0;
   bh3_w1_23_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid2642117_5_Freq950_uid196_bh3_uid207_Out0_c1(0);
   bh3_w2_11_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid2642117_5_Freq950_uid196_bh3_uid207_Out0_c1(1);
   bh3_w3_2_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid2642117_5_Freq950_uid196_bh3_uid207_Out0_c1(2);
   bh3_w4_2_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid2642117_5_Freq950_uid196_bh3_uid207_Out0_c1(3);
   bh3_w5_1_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid2642117_5_Freq950_uid196_bh3_uid207_Out0_c1(4);
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid2642117_5_Freq950_uid196_uid207: XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid2642117_5_Freq950_uid196
      port map ( X0 => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid2642117_5_Freq950_uid196_bh3_uid207_In0_c0,
                 X1 => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid2642117_5_Freq950_uid196_bh3_uid207_In1_c0,
                 X2 => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid2642117_5_Freq950_uid196_bh3_uid207_In2_c0,
                 X3 => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid2642117_5_Freq950_uid196_bh3_uid207_In3_c0,
                 R => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid2642117_5_Freq950_uid196_bh3_uid207_Out0_copy208_c0);
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid2642117_5_Freq950_uid196_bh3_uid207_Out0_c1 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid2642117_5_Freq950_uid196_bh3_uid207_Out0_copy208_c1; -- output copy to hold a pipeline register if needed


   Compressor_FixMultiAdder_S_17_lsbOut_m11_uid2643_2_Freq950_uid210_bh3_uid211_In0_c0 <= "" & bh3_w2_1_c0 & bh3_w2_2_c0 & bh3_w2_3_c0;
   bh3_w2_12_c0 <= Compressor_FixMultiAdder_S_17_lsbOut_m11_uid2643_2_Freq950_uid210_bh3_uid211_Out0_c0(0);
   bh3_w3_3_c0 <= Compressor_FixMultiAdder_S_17_lsbOut_m11_uid2643_2_Freq950_uid210_bh3_uid211_Out0_c0(1);
   Compressor_FixMultiAdder_S_17_lsbOut_m11_uid2643_2_Freq950_uid210_uid211: Compressor_FixMultiAdder_S_17_lsbOut_m11_uid2643_2_Freq950_uid210
      port map ( X0 => Compressor_FixMultiAdder_S_17_lsbOut_m11_uid2643_2_Freq950_uid210_bh3_uid211_In0_c0,
                 R => Compressor_FixMultiAdder_S_17_lsbOut_m11_uid2643_2_Freq950_uid210_bh3_uid211_Out0_copy212_c0);
   Compressor_FixMultiAdder_S_17_lsbOut_m11_uid2643_2_Freq950_uid210_bh3_uid211_Out0_c0 <= Compressor_FixMultiAdder_S_17_lsbOut_m11_uid2643_2_Freq950_uid210_bh3_uid211_Out0_copy212_c0; -- output copy to hold a pipeline register if needed


   Compressor_FixMultiAdder_S_17_lsbOut_m11_uid2643_2_Freq950_uid210_bh3_uid213_In0_c0 <= "" & bh3_wm10_0_c0 & bh3_wm10_9_c0 & bh3_wm10_10_c0;
   bh3_wm10_21_c0 <= Compressor_FixMultiAdder_S_17_lsbOut_m11_uid2643_2_Freq950_uid210_bh3_uid213_Out0_c0(0);
   bh3_wm9_22_c0 <= Compressor_FixMultiAdder_S_17_lsbOut_m11_uid2643_2_Freq950_uid210_bh3_uid213_Out0_c0(1);
   Compressor_FixMultiAdder_S_17_lsbOut_m11_uid2643_2_Freq950_uid210_uid213: Compressor_FixMultiAdder_S_17_lsbOut_m11_uid2643_2_Freq950_uid210
      port map ( X0 => Compressor_FixMultiAdder_S_17_lsbOut_m11_uid2643_2_Freq950_uid210_bh3_uid213_In0_c0,
                 R => Compressor_FixMultiAdder_S_17_lsbOut_m11_uid2643_2_Freq950_uid210_bh3_uid213_Out0_copy214_c0);
   Compressor_FixMultiAdder_S_17_lsbOut_m11_uid2643_2_Freq950_uid210_bh3_uid213_Out0_c0 <= Compressor_FixMultiAdder_S_17_lsbOut_m11_uid2643_2_Freq950_uid210_bh3_uid213_Out0_copy214_c0; -- output copy to hold a pipeline register if needed


   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid216_bh3_uid225_In0_c1 <= "" & bh3_wm10_11_c1 & bh3_wm10_12_c1 & bh3_wm10_13_c1 & bh3_wm10_14_c1 & bh3_wm10_18_c1 & bh3_wm10_19_c1 & bh3_wm10_20_c1;
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid216_bh3_uid225_In2_c1 <= "" & bh3_wm8_14_c1 & bh3_wm8_18_c1 & bh3_wm8_21_c1 & bh3_wm8_20_c1 & bh3_wm8_19_c1 & bh3_wm8_17_c1;
   bh3_wm10_22_c2 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid216_bh3_uid225_Out0_c2(0);
   bh3_wm9_23_c2 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid216_bh3_uid225_Out0_c2(1);
   bh3_wm8_22_c2 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid216_bh3_uid225_Out0_c2(2);
   bh3_wm7_23_c2 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid216_bh3_uid225_Out0_c2(3);
   bh3_wm6_23_c2 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid216_bh3_uid225_Out0_c2(4);
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid216_uid225: XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid216
      port map ( X0 => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid216_bh3_uid225_In0_c1,
                 X2 => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid216_bh3_uid225_In2_c1,
                 R => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid216_bh3_uid225_Out0_copy226_c1);
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid216_bh3_uid225_Out0_c2 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid216_bh3_uid225_Out0_copy226_c2; -- output copy to hold a pipeline register if needed


   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid228_bh3_uid237_In0_c1 <= "" & bh3_wm9_2_c1 & bh3_wm9_3_c1 & bh3_wm9_18_c1 & bh3_wm9_19_c1 & bh3_wm9_21_c1 & bh3_wm9_20_c1 & bh3_wm9_17_c1;
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid228_bh3_uid237_In2_c1 <= "" & bh3_wm7_2_c1 & bh3_wm7_18_c1 & bh3_wm7_22_c1 & bh3_wm7_21_c1 & bh3_wm7_20_c1 & bh3_wm7_19_c1;
   bh3_wm9_24_c2 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid228_bh3_uid237_Out0_c2(0);
   bh3_wm8_23_c2 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid228_bh3_uid237_Out0_c2(1);
   bh3_wm7_24_c2 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid228_bh3_uid237_Out0_c2(2);
   bh3_wm6_24_c2 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid228_bh3_uid237_Out0_c2(3);
   bh3_wm5_23_c2 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid228_bh3_uid237_Out0_c2(4);
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid228_uid237: XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid228
      port map ( X0 => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid228_bh3_uid237_In0_c1,
                 X2 => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid228_bh3_uid237_In2_c1,
                 R => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid228_bh3_uid237_Out0_copy238_c1);
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid228_bh3_uid237_Out0_c2 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid228_bh3_uid237_Out0_copy238_c2; -- output copy to hold a pipeline register if needed


   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid240_bh3_uid249_In0_c1 <= "" & bh3_wm6_14_c1 & bh3_wm6_17_c1 & bh3_wm6_22_c1 & bh3_wm6_21_c1 & bh3_wm6_20_c1 & bh3_wm6_19_c1 & bh3_wm6_18_c1;
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid240_bh3_uid249_In2_c0 <= "" & bh3_wm4_7_c0 & bh3_wm4_9_c0 & bh3_wm4_8_c0 & bh3_wm4_10_c0 & bh3_wm4_11_c0 & bh3_wm4_12_c0;
   bh3_wm6_25_c2 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid240_bh3_uid249_Out0_c2(0);
   bh3_wm5_24_c2 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid240_bh3_uid249_Out0_c2(1);
   bh3_wm4_22_c2 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid240_bh3_uid249_Out0_c2(2);
   bh3_wm3_22_c2 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid240_bh3_uid249_Out0_c2(3);
   bh3_wm2_23_c2 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid240_bh3_uid249_Out0_c2(4);
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid240_uid249: XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid240
      port map ( X0 => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid240_bh3_uid249_In0_c1,
                 X2 => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid240_bh3_uid249_In2_c1,
                 R => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid240_bh3_uid249_Out0_copy250_c1);
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid240_bh3_uid249_Out0_c2 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid240_bh3_uid249_Out0_copy250_c2; -- output copy to hold a pipeline register if needed


   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid252_bh3_uid261_In0_c1 <= "" & bh3_wm5_2_c1 & bh3_wm5_17_c1 & bh3_wm5_22_c1 & bh3_wm5_21_c1 & bh3_wm5_20_c1 & bh3_wm5_19_c1 & bh3_wm5_18_c1;
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid252_bh3_uid261_In2_c1 <= "" & bh3_wm3_9_c1 & bh3_wm3_17_c1 & bh3_wm3_21_c1 & bh3_wm3_20_c1 & bh3_wm3_19_c1 & bh3_wm3_18_c1;
   bh3_wm5_25_c2 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid252_bh3_uid261_Out0_c2(0);
   bh3_wm4_23_c2 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid252_bh3_uid261_Out0_c2(1);
   bh3_wm3_23_c2 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid252_bh3_uid261_Out0_c2(2);
   bh3_wm2_24_c2 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid252_bh3_uid261_Out0_c2(3);
   bh3_wm1_23_c2 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid252_bh3_uid261_Out0_c2(4);
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid252_uid261: XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid252
      port map ( X0 => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid252_bh3_uid261_In0_c1,
                 X2 => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid252_bh3_uid261_In2_c1,
                 R => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid252_bh3_uid261_Out0_copy262_c1);
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid252_bh3_uid261_Out0_c2 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid252_bh3_uid261_Out0_copy262_c2; -- output copy to hold a pipeline register if needed


   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid264_bh3_uid273_In0_c1 <= "" & bh3_wm4_13_c1 & bh3_wm4_14_c1 & bh3_wm4_17_c1 & bh3_wm4_21_c1 & bh3_wm4_20_c1 & bh3_wm4_19_c1 & bh3_wm4_18_c1;
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid264_bh3_uid273_In2_c1 <= "" & bh3_wm2_17_c1 & bh3_wm2_22_c1 & bh3_wm2_21_c1 & bh3_wm2_20_c1 & bh3_wm2_19_c1 & bh3_wm2_18_c1;
   bh3_wm4_24_c2 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid264_bh3_uid273_Out0_c2(0);
   bh3_wm3_24_c2 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid264_bh3_uid273_Out0_c2(1);
   bh3_wm2_25_c2 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid264_bh3_uid273_Out0_c2(2);
   bh3_wm1_24_c2 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid264_bh3_uid273_Out0_c2(3);
   bh3_w0_22_c2 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid264_bh3_uid273_Out0_c2(4);
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid264_uid273: XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid264
      port map ( X0 => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid264_bh3_uid273_In0_c1,
                 X2 => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid264_bh3_uid273_In2_c1,
                 R => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid264_bh3_uid273_Out0_copy274_c1);
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid264_bh3_uid273_Out0_c2 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid264_bh3_uid273_Out0_copy274_c2; -- output copy to hold a pipeline register if needed


   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid276_bh3_uid285_In0_c1 <= "" & bh3_wm1_7_c1 & bh3_wm1_17_c1 & bh3_wm1_22_c1 & bh3_wm1_21_c1 & bh3_wm1_20_c1 & bh3_wm1_19_c1 & bh3_wm1_18_c1;
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid276_bh3_uid285_In2_c1 <= "" & bh3_w1_0_c1 & bh3_w1_10_c1 & bh3_w1_11_c1 & bh3_w1_12_c1 & bh3_w1_18_c1 & bh3_w1_23_c1;
   bh3_wm1_25_c2 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid276_bh3_uid285_Out0_c2(0);
   bh3_w0_23_c2 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid276_bh3_uid285_Out0_c2(1);
   bh3_w1_24_c2 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid276_bh3_uid285_Out0_c2(2);
   bh3_w2_13_c2 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid276_bh3_uid285_Out0_c2(3);
   bh3_w3_4_c2 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid276_bh3_uid285_Out0_c2(4);
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid276_uid285: XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid276
      port map ( X0 => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid276_bh3_uid285_In0_c1,
                 X2 => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid276_bh3_uid285_In2_c1,
                 R => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid276_bh3_uid285_Out0_copy286_c1);
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid276_bh3_uid285_Out0_c2 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid276_bh3_uid285_Out0_copy286_c2; -- output copy to hold a pipeline register if needed


   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid288_bh3_uid297_In0_c1 <= "" & bh3_w0_9_c1 & bh3_w0_8_c1 & bh3_w0_17_c1 & bh3_w0_21_c1 & bh3_w0_20_c1 & bh3_w0_19_c1 & bh3_w0_18_c1;
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid288_bh3_uid297_In2_c1 <= "" & bh3_w2_4_c1 & bh3_w2_5_c1 & bh3_w2_6_c1 & bh3_w2_12_c1 & bh3_w2_7_c1 & bh3_w2_11_c1;
   bh3_w0_24_c2 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid288_bh3_uid297_Out0_c2(0);
   bh3_w1_25_c2 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid288_bh3_uid297_Out0_c2(1);
   bh3_w2_14_c2 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid288_bh3_uid297_Out0_c2(2);
   bh3_w3_5_c2 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid288_bh3_uid297_Out0_c2(3);
   bh3_w4_3_c2 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid288_bh3_uid297_Out0_c2(4);
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid288_uid297: XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid288
      port map ( X0 => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid288_bh3_uid297_In0_c1,
                 X2 => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid288_bh3_uid297_In2_c1,
                 R => XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid288_bh3_uid297_Out0_copy298_c1);
   XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid288_bh3_uid297_Out0_c2 <= XilinxGPC_FixMultiAdder_S_17_lsbOut_m11_uid264607_5_Freq950_uid288_bh3_uid297_Out0_copy298_c2; -- output copy to hold a pipeline register if needed


   Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid2644_Freq950_uid300_bh3_uid318_In0_c1 <= "" & bh3_w1_22_c1 & bh3_w1_21_c1 & bh3_w1_20_c1 & bh3_w1_19_c1;
   Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid2644_Freq950_uid300_bh3_uid318_In1_c1 <= "" & bh3_w2_10_c1 & bh3_w2_9_c1 & bh3_w2_8_c1;
   Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid2644_Freq950_uid300_bh3_uid318_In2_c1 <= "" & bh3_w3_3_c1 & bh3_w3_2_c1 & bh3_w3_1_c1;
   Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid2644_Freq950_uid300_bh3_uid318_In3_c1 <= "" & bh3_w4_2_c1;
   bh3_w1_26_c1 <= Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid2644_Freq950_uid300_bh3_uid318_Out0_c1(0);
   bh3_w2_15_c1 <= Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid2644_Freq950_uid300_bh3_uid318_Out0_c1(1);
   bh3_w3_6_c1 <= Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid2644_Freq950_uid300_bh3_uid318_Out0_c1(2);
   bh3_w4_4_c1 <= Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid2644_Freq950_uid300_bh3_uid318_Out0_c1(3);
   bh3_w5_2_c1 <= Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid2644_Freq950_uid300_bh3_uid318_Out0_c1(4);
   Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid2644_Freq950_uid300_uid318: Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid2644_Freq950_uid300
      port map ( X0 => Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid2644_Freq950_uid300_bh3_uid318_In0_c1,
                 X1 => Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid2644_Freq950_uid300_bh3_uid318_In1_c1,
                 X2 => Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid2644_Freq950_uid300_bh3_uid318_In2_c1,
                 X3 => Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid2644_Freq950_uid300_bh3_uid318_In3_c1,
                 R => Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid2644_Freq950_uid300_bh3_uid318_Out0_copy319_c1);
   Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid2644_Freq950_uid300_bh3_uid318_Out0_c1 <= Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid2644_Freq950_uid300_bh3_uid318_Out0_copy319_c1; -- output copy to hold a pipeline register if needed


   Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In0_c1 <= "" & bh3_wm11_6_c1 & bh3_wm11_18_c1 & bh3_wm11_19_c1 & bh3_wm11_17_c1;
   Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In1_c2 <= "" & bh3_wm10_21_c2 & bh3_wm10_17_c2 & bh3_wm10_22_c2;
   Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In2_c2 <= "" & bh3_wm9_22_c2 & bh3_wm9_24_c2 & bh3_wm9_23_c2;
   Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In3_c2 <= "" & bh3_wm8_23_c2 & bh3_wm8_22_c2 & "0";
   Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In4_c2 <= "" & bh3_wm7_17_c2 & bh3_wm7_24_c2 & bh3_wm7_23_c2;
   Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In5_c2 <= "" & bh3_wm6_25_c2 & bh3_wm6_24_c2 & bh3_wm6_23_c2;
   Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In6_c2 <= "" & bh3_wm5_25_c2 & bh3_wm5_24_c2 & bh3_wm5_23_c2;
   Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In7_c2 <= "" & bh3_wm4_24_c2 & bh3_wm4_23_c2 & bh3_wm4_22_c2;
   Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In8_c2 <= "" & bh3_wm3_24_c2 & bh3_wm3_23_c2 & bh3_wm3_22_c2;
   Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In9_c2 <= "" & bh3_wm2_25_c2 & bh3_wm2_24_c2 & bh3_wm2_23_c2;
   Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In10_c2 <= "" & bh3_wm1_25_c2 & bh3_wm1_24_c2 & bh3_wm1_23_c2;
   Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In11_c2 <= "" & bh3_w0_24_c2 & bh3_w0_23_c2 & bh3_w0_22_c2;
   Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In12_c2 <= "" & bh3_w1_26_c2 & bh3_w1_25_c2 & bh3_w1_24_c2;
   Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In13_c2 <= "" & bh3_w2_15_c2 & bh3_w2_14_c2 & bh3_w2_13_c2;
   Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In14_c2 <= "" & bh3_w3_6_c2 & bh3_w3_5_c2 & bh3_w3_4_c2;
   Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In15_c2 <= "" & bh3_w4_4_c2 & bh3_w4_3_c2 & "0";
   Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In16_c1 <= "" & bh3_w5_0_c1 & bh3_w5_1_c1 & bh3_w5_2_c1;
   Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In17_c0 <= "" & bh3_w6_0_c0 & bh3_w6_1_c0 & "0";
   Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In18_c0 <= "" & "0";
   bh3_wm11_20_c3 <= Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_Out0_c3(0);
   bh3_wm10_23_c3 <= Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_Out0_c3(1);
   bh3_wm9_25_c3 <= Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_Out0_c3(2);
   bh3_wm8_24_c3 <= Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_Out0_c3(3);
   bh3_wm7_25_c3 <= Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_Out0_c3(4);
   bh3_wm6_26_c3 <= Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_Out0_c3(5);
   bh3_wm5_26_c3 <= Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_Out0_c3(6);
   bh3_wm4_25_c3 <= Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_Out0_c3(7);
   bh3_wm3_25_c3 <= Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_Out0_c3(8);
   bh3_wm2_26_c3 <= Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_Out0_c3(9);
   bh3_wm1_26_c3 <= Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_Out0_c3(10);
   bh3_w0_25_c3 <= Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_Out0_c3(11);
   bh3_w1_27_c3 <= Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_Out0_c3(12);
   bh3_w2_16_c3 <= Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_Out0_c3(13);
   bh3_w3_7_c3 <= Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_Out0_c3(14);
   bh3_w4_5_c3 <= Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_Out0_c3(15);
   bh3_w5_3_c3 <= Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_Out0_c3(16);
   bh3_w6_2_c3 <= Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_Out0_c3(17);
   Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_uid392: Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321
      port map ( X0 => Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In0_c2,
                 X1 => Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In1_c2,
                 X10 => Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In10_c2,
                 X11 => Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In11_c2,
                 X12 => Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In12_c2,
                 X13 => Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In13_c2,
                 X14 => Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In14_c2,
                 X15 => Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In15_c2,
                 X16 => Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In16_c2,
                 X17 => Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In17_c2,
                 X18 => Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In18_c2,
                 X2 => Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In2_c2,
                 X3 => Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In3_c2,
                 X4 => Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In4_c2,
                 X5 => Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In5_c2,
                 X6 => Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In6_c2,
                 X7 => Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In7_c2,
                 X8 => Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In8_c2,
                 X9 => Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_In9_c2,
                 R => Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_Out0_copy393_c2);
   Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_Out0_c3 <= Row_Adder_FixMultiAdder_S_17_lsbOut_m11_uid26419_Freq950_uid321_bh3_uid392_Out0_copy393_c3; -- output copy to hold a pipeline register if needed

   tmp_bitheapResult_bh3_17_c3 <= bh3_w6_2_c3 & bh3_w5_3_c3 & bh3_w4_5_c3 & bh3_w3_7_c3 & bh3_w2_16_c3 & bh3_w1_27_c3 & bh3_w0_25_c3 & bh3_wm1_26_c3 & bh3_wm2_26_c3 & bh3_wm3_25_c3 & bh3_wm4_25_c3 & bh3_wm5_26_c3 & bh3_wm6_26_c3 & bh3_wm7_25_c3 & bh3_wm8_24_c3 & bh3_wm9_25_c3 & bh3_wm10_23_c3 & bh3_wm11_20_c3;
   bitheapResult_bh3_c3 <= tmp_bitheapResult_bh3_17_c3;
   OutRes_c3 <= bitheapResult_bh3_c3;
   R <= OutRes_c3(17 downto 0);
end architecture;

