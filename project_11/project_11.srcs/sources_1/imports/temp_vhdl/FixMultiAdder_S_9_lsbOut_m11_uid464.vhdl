--------------------------------------------------------------------------------
--                          Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid4643_Freq950_uid6
-- VHDL generated for VirtexUltrascalePlus @ 950MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Andreas Boettcher
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 1.05263
-- Target frequency (MHz): 950
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

entity Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid4643_Freq950_uid6 is
    port (X2 : in  std_logic_vector(0 downto 0);
          X1 : in  std_logic_vector(2 downto 0);
          X0 : in  std_logic_vector(3 downto 0);
          R : out  std_logic_vector(3 downto 0)   );
end entity;

architecture arch of Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid4643_Freq950_uid6 is


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
--                       XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid24
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

entity XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid24 is
    port (X2 : in  std_logic_vector(5 downto 0);
          X0 : in  std_logic_vector(6 downto 0);
          R : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid24 is


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
--                       XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid36
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

entity XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid36 is
    port (X2 : in  std_logic_vector(5 downto 0);
          X0 : in  std_logic_vector(6 downto 0);
          R : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid36 is


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
--                       XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid48
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

entity XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid48 is
    port (X2 : in  std_logic_vector(5 downto 0);
          X0 : in  std_logic_vector(6 downto 0);
          R : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid48 is


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
--                        Compressor_FixMultiAdder_S_9_lsbOut_m11_uid4643_2_Freq950_uid60
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

entity Compressor_FixMultiAdder_S_9_lsbOut_m11_uid4643_2_Freq950_uid60 is
    port (X0 : in  std_logic_vector(2 downto 0);
          R : out  std_logic_vector(1 downto 0)   );
end entity;

architecture arch of Compressor_FixMultiAdder_S_9_lsbOut_m11_uid4643_2_Freq950_uid60 is
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
--                       Compressor_FixMultiAdder_S_9_lsbOut_m11_uid46423_3_Freq950_uid64
-- VHDL generated for VirtexUltrascalePlus @ 950MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 1.05263
-- Target frequency (MHz): 950
-- Input signals: X1 X0
-- Output signals: R
--  approx. input signal timings: X1: (c0, 0.000000ns)X0: (c0, 0.000000ns)
--  approx. output signal timings: R: (c0, 0.215000ns)

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity Compressor_FixMultiAdder_S_9_lsbOut_m11_uid46423_3_Freq950_uid64 is
    port (X1 : in  std_logic_vector(1 downto 0);
          X0 : in  std_logic_vector(2 downto 0);
          R : out  std_logic_vector(2 downto 0)   );
end entity;

architecture arch of Compressor_FixMultiAdder_S_9_lsbOut_m11_uid46423_3_Freq950_uid64 is
signal X :  std_logic_vector(4 downto 0);
   -- timing of X: (c0, 0.000000ns)
signal R0 :  std_logic_vector(2 downto 0);
   -- timing of R0: (c0, 0.215000ns)
begin
   X <= X1 & X0 ;

   with X  select  R0 <= 
      "000" when "00000",
      "001" when "00001" | "00010" | "00100",
      "010" when "00011" | "00101" | "00110" | "01000" | "10000",
      "011" when "00111" | "01001" | "01010" | "01100" | "10001" | "10010" | "10100",
      "100" when "01011" | "01101" | "01110" | "10011" | "10101" | "10110" | "11000",
      "101" when "01111" | "10111" | "11001" | "11010" | "11100",
      "110" when "11011" | "11101" | "11110",
      "111" when "11111",
      "---" when others;
   R <= R0;
end architecture;

--------------------------------------------------------------------------------
--                         Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68
-- VHDL generated for VirtexUltrascalePlus @ 950MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Andreas Boettcher
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 1.05263
-- Target frequency (MHz): 950
-- Input signals: X13 X12 X11 X10 X9 X8 X7 X6 X5 X4 X3 X2 X1 X0
-- Output signals: R
--  approx. input signal timings: X13: (c0, 0.000000ns)X12: (c0, 0.000000ns)X11: (c0, 0.000000ns)X10: (c0, 0.000000ns)X9: (c0, 0.000000ns)X8: (c0, 0.000000ns)X7: (c0, 0.000000ns)X6: (c0, 0.000000ns)X5: (c0, 0.000000ns)X4: (c0, 0.000000ns)X3: (c0, 0.000000ns)X2: (c0, 0.000000ns)X1: (c0, 0.000000ns)X0: (c0, 0.000000ns)
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

entity Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68 is
    port (X13 : in  std_logic_vector(0 downto 0);
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
          R : out  std_logic_vector(14 downto 0)   );
end entity;

architecture arch of Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68 is


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
signal c12 :  std_logic;
   -- timing of c12: (c0, 0.000000ns)
signal result :  std_logic_vector(14 downto 0);
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
      generic map ( init => x"66666666aaaaaaaa")
      port map ( i0 => c12,
                 i1 => X13(0),
                 i2 => '0',
                 i3 => '0',
                 i4 => '0',
                 i5 => '1',
                 o5 => open,
                 o6 => cc_s(13));

   result <= cc_co(13) & cc_o(13 downto 0);
   R <= result;
end architecture;

--------------------------------------------------------------------------------
--                       XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid125
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

entity XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid125 is
    port (X2 : in  std_logic_vector(5 downto 0);
          X0 : in  std_logic_vector(6 downto 0);
          R : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid125 is


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
--                       XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid137
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

entity XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid137 is
    port (X2 : in  std_logic_vector(5 downto 0);
          X0 : in  std_logic_vector(6 downto 0);
          R : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid137 is


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
--                       XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid149
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

entity XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid149 is
    port (X2 : in  std_logic_vector(5 downto 0);
          X0 : in  std_logic_vector(6 downto 0);
          R : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid149 is


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
--                        Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161
-- VHDL generated for VirtexUltrascalePlus @ 950MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Andreas Boettcher
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 1.05263
-- Target frequency (MHz): 950
-- Input signals: X21 X20 X19 X18 X17 X16 X15 X14 X13 X12 X11 X10 X9 X8 X7 X6 X5 X4 X3 X2 X1 X0
-- Output signals: R
--  approx. input signal timings: X21: (c0, 0.000000ns)X20: (c0, 0.000000ns)X19: (c0, 0.000000ns)X18: (c0, 0.000000ns)X17: (c0, 0.000000ns)X16: (c0, 0.000000ns)X15: (c0, 0.000000ns)X14: (c0, 0.000000ns)X13: (c0, 0.000000ns)X12: (c0, 0.000000ns)X11: (c0, 0.000000ns)X10: (c0, 0.000000ns)X9: (c0, 0.000000ns)X8: (c0, 0.000000ns)X7: (c0, 0.000000ns)X6: (c0, 0.000000ns)X5: (c0, 0.000000ns)X4: (c0, 0.000000ns)X3: (c0, 0.000000ns)X2: (c0, 0.000000ns)X1: (c0, 0.000000ns)X0: (c0, 0.000000ns)
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

entity Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161 is
    port (X21 : in  std_logic_vector(0 downto 0);
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
          R : out  std_logic_vector(22 downto 0)   );
end entity;

architecture arch of Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161 is


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
signal result :  std_logic_vector(22 downto 0);
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
      generic map ( init => x"66666666aaaaaaaa")
      port map ( i0 => c20,
                 i1 => X21(0),
                 i2 => '0',
                 i3 => '0',
                 i4 => '0',
                 i5 => '1',
                 o5 => open,
                 o6 => cc_s(21));

   result <= cc_co(21) & cc_o(21 downto 0);
   R <= result;
end architecture;

--------------------------------------------------------------------------------
--                          FixMultiAdder_S_9_lsbOut_m11_uid464
--                      (FixMultiAdder_S_9_Freq950_uid2)
-- VHDL generated for VirtexUltrascalePlus @ 950MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Martin Kumm (2024)
--------------------------------------------------------------------------------
-- Pipeline depth: 3 cycles
-- Clock period (ns): 1.05263
-- Target frequency (MHz): 950
-- Input signals: X0 X1 X2 X3 X4 X5 X6 X7 X8
-- Output signals: R
--  approx. input signal timings: X0: (c0, 0.000000ns)X1: (c0, 0.000000ns)X2: (c0, 0.000000ns)X3: (c0, 0.000000ns)X4: (c0, 0.000000ns)X5: (c0, 0.000000ns)X6: (c0, 0.000000ns)X7: (c0, 0.000000ns)X8: (c0, 0.000000ns)
--  approx. output signal timings: R: (c3, 0.287105ns)

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity FixMultiAdder_S_9_lsbOut_m11_uid464 is
    port (clk, rst, write_enable_1, write_enable_2, write_enable_3 : in std_logic;
          R : out  std_logic_vector(20 downto 0);
          X0 : in  std_logic_vector(12 downto 0);
          X1 : in  std_logic_vector(13 downto 0);
          X2 : in  std_logic_vector(13 downto 0);
          X3 : in  std_logic_vector(13 downto 0);
          X4 : in  std_logic_vector(13 downto 0);
          X5 : in  std_logic_vector(13 downto 0);
          X6 : in  std_logic_vector(13 downto 0);
          X7 : in  std_logic_vector(13 downto 0);
          X8 : in  std_logic_vector(20 downto 0)   );
end entity;

architecture arch of FixMultiAdder_S_9_lsbOut_m11_uid464 is
   component Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid4643_Freq950_uid6 is
      port ( X2 : in  std_logic_vector(0 downto 0);
             X1 : in  std_logic_vector(2 downto 0);
             X0 : in  std_logic_vector(3 downto 0);
             R : out  std_logic_vector(3 downto 0)   );
   end component;

   component XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid24 is
      port ( X2 : in  std_logic_vector(5 downto 0);
             X0 : in  std_logic_vector(6 downto 0);
             R : out  std_logic_vector(4 downto 0)   );
   end component;

   component XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid36 is
      port ( X2 : in  std_logic_vector(5 downto 0);
             X0 : in  std_logic_vector(6 downto 0);
             R : out  std_logic_vector(4 downto 0)   );
   end component;

   component XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid48 is
      port ( X2 : in  std_logic_vector(5 downto 0);
             X0 : in  std_logic_vector(6 downto 0);
             R : out  std_logic_vector(4 downto 0)   );
   end component;

   component Compressor_FixMultiAdder_S_9_lsbOut_m11_uid4643_2_Freq950_uid60 is
      port ( X0 : in  std_logic_vector(2 downto 0);
             R : out  std_logic_vector(1 downto 0)   );
   end component;

   component Compressor_FixMultiAdder_S_9_lsbOut_m11_uid46423_3_Freq950_uid64 is
      port ( X1 : in  std_logic_vector(1 downto 0);
             X0 : in  std_logic_vector(2 downto 0);
             R : out  std_logic_vector(2 downto 0)   );
   end component;

   component Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68 is
      port ( X13 : in  std_logic_vector(0 downto 0);
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
             R : out  std_logic_vector(14 downto 0)   );
   end component;

   component XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid125 is
      port ( X2 : in  std_logic_vector(5 downto 0);
             X0 : in  std_logic_vector(6 downto 0);
             R : out  std_logic_vector(4 downto 0)   );
   end component;

   component XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid137 is
      port ( X2 : in  std_logic_vector(5 downto 0);
             X0 : in  std_logic_vector(6 downto 0);
             R : out  std_logic_vector(4 downto 0)   );
   end component;

   component XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid149 is
      port ( X2 : in  std_logic_vector(5 downto 0);
             X0 : in  std_logic_vector(6 downto 0);
             R : out  std_logic_vector(4 downto 0)   );
   end component;

   component Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161 is
      port ( X21 : in  std_logic_vector(0 downto 0);
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
             R : out  std_logic_vector(22 downto 0)   );
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
signal bh3_w1_0_c0 :  std_logic;
   -- timing of bh3_w1_0_c0: (c0, 0.000000ns)
signal iX1_c0 :  signed(2+11 downto 0);
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
signal bh3_w2_0_c0 :  std_logic;
   -- timing of bh3_w2_0_c0: (c0, 0.000000ns)
signal iX2_c0 :  signed(2+11 downto 0);
   -- timing of iX2_c0: (c0, 0.000000ns)
signal bh3_wm11_2_c0 :  std_logic;
   -- timing of bh3_wm11_2_c0: (c0, 0.000000ns)
signal bh3_wm10_2_c0 :  std_logic;
   -- timing of bh3_wm10_2_c0: (c0, 0.000000ns)
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
signal bh3_w2_1_c0 :  std_logic;
   -- timing of bh3_w2_1_c0: (c0, 0.000000ns)
signal iX3_c0 :  signed(2+11 downto 0);
   -- timing of iX3_c0: (c0, 0.000000ns)
signal bh3_wm11_3_c0 :  std_logic;
   -- timing of bh3_wm11_3_c0: (c0, 0.000000ns)
signal bh3_wm10_3_c0 :  std_logic;
   -- timing of bh3_wm10_3_c0: (c0, 0.000000ns)
signal bh3_wm9_3_c0 :  std_logic;
   -- timing of bh3_wm9_3_c0: (c0, 0.000000ns)
signal bh3_wm8_3_c0 :  std_logic;
   -- timing of bh3_wm8_3_c0: (c0, 0.000000ns)
signal bh3_wm7_3_c0 :  std_logic;
   -- timing of bh3_wm7_3_c0: (c0, 0.000000ns)
signal bh3_wm6_3_c0 :  std_logic;
   -- timing of bh3_wm6_3_c0: (c0, 0.000000ns)
signal bh3_wm5_3_c0, bh3_wm5_3_c1 :  std_logic;
   -- timing of bh3_wm5_3_c0: (c0, 0.000000ns)
signal bh3_wm4_3_c0 :  std_logic;
   -- timing of bh3_wm4_3_c0: (c0, 0.000000ns)
signal bh3_wm3_3_c0 :  std_logic;
   -- timing of bh3_wm3_3_c0: (c0, 0.000000ns)
signal bh3_wm2_3_c0 :  std_logic;
   -- timing of bh3_wm2_3_c0: (c0, 0.000000ns)
signal bh3_wm1_3_c0, bh3_wm1_3_c1 :  std_logic;
   -- timing of bh3_wm1_3_c0: (c0, 0.000000ns)
signal bh3_w0_3_c0, bh3_w0_3_c1 :  std_logic;
   -- timing of bh3_w0_3_c0: (c0, 0.000000ns)
signal bh3_w1_3_c0 :  std_logic;
   -- timing of bh3_w1_3_c0: (c0, 0.000000ns)
signal bh3_w2_2_c0 :  std_logic;
   -- timing of bh3_w2_2_c0: (c0, 0.000000ns)
signal iX4_c0 :  signed(2+11 downto 0);
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
signal bh3_wm5_4_c0, bh3_wm5_4_c1 :  std_logic;
   -- timing of bh3_wm5_4_c0: (c0, 0.000000ns)
signal bh3_wm4_4_c0 :  std_logic;
   -- timing of bh3_wm4_4_c0: (c0, 0.000000ns)
signal bh3_wm3_4_c0 :  std_logic;
   -- timing of bh3_wm3_4_c0: (c0, 0.000000ns)
signal bh3_wm2_4_c0 :  std_logic;
   -- timing of bh3_wm2_4_c0: (c0, 0.000000ns)
signal bh3_wm1_4_c0, bh3_wm1_4_c1 :  std_logic;
   -- timing of bh3_wm1_4_c0: (c0, 0.000000ns)
signal bh3_w0_4_c0, bh3_w0_4_c1 :  std_logic;
   -- timing of bh3_w0_4_c0: (c0, 0.000000ns)
signal bh3_w1_4_c0 :  std_logic;
   -- timing of bh3_w1_4_c0: (c0, 0.000000ns)
signal bh3_w2_3_c0 :  std_logic;
   -- timing of bh3_w2_3_c0: (c0, 0.000000ns)
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
signal bh3_wm5_5_c0, bh3_wm5_5_c1 :  std_logic;
   -- timing of bh3_wm5_5_c0: (c0, 0.000000ns)
signal bh3_wm4_5_c0 :  std_logic;
   -- timing of bh3_wm4_5_c0: (c0, 0.000000ns)
signal bh3_wm3_5_c0 :  std_logic;
   -- timing of bh3_wm3_5_c0: (c0, 0.000000ns)
signal bh3_wm2_5_c0 :  std_logic;
   -- timing of bh3_wm2_5_c0: (c0, 0.000000ns)
signal bh3_wm1_5_c0, bh3_wm1_5_c1 :  std_logic;
   -- timing of bh3_wm1_5_c0: (c0, 0.000000ns)
signal bh3_w0_5_c0, bh3_w0_5_c1 :  std_logic;
   -- timing of bh3_w0_5_c0: (c0, 0.000000ns)
signal bh3_w1_5_c0 :  std_logic;
   -- timing of bh3_w1_5_c0: (c0, 0.000000ns)
signal bh3_w2_4_c0 :  std_logic;
   -- timing of bh3_w2_4_c0: (c0, 0.000000ns)
signal iX6_c0 :  signed(2+11 downto 0);
   -- timing of iX6_c0: (c0, 0.000000ns)
signal bh3_wm11_6_c0 :  std_logic;
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
signal bh3_wm5_6_c0, bh3_wm5_6_c1 :  std_logic;
   -- timing of bh3_wm5_6_c0: (c0, 0.000000ns)
signal bh3_wm4_6_c0 :  std_logic;
   -- timing of bh3_wm4_6_c0: (c0, 0.000000ns)
signal bh3_wm3_6_c0 :  std_logic;
   -- timing of bh3_wm3_6_c0: (c0, 0.000000ns)
signal bh3_wm2_6_c0 :  std_logic;
   -- timing of bh3_wm2_6_c0: (c0, 0.000000ns)
signal bh3_wm1_6_c0, bh3_wm1_6_c1 :  std_logic;
   -- timing of bh3_wm1_6_c0: (c0, 0.000000ns)
signal bh3_w0_6_c0, bh3_w0_6_c1 :  std_logic;
   -- timing of bh3_w0_6_c0: (c0, 0.000000ns)
signal bh3_w1_6_c0 :  std_logic;
   -- timing of bh3_w1_6_c0: (c0, 0.000000ns)
signal bh3_w2_5_c0 :  std_logic;
   -- timing of bh3_w2_5_c0: (c0, 0.000000ns)
signal iX7_c0 :  signed(2+11 downto 0);
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
signal bh3_wm5_7_c0, bh3_wm5_7_c1 :  std_logic;
   -- timing of bh3_wm5_7_c0: (c0, 0.000000ns)
signal bh3_wm4_7_c0, bh3_wm4_7_c1 :  std_logic;
   -- timing of bh3_wm4_7_c0: (c0, 0.000000ns)
signal bh3_wm3_7_c0 :  std_logic;
   -- timing of bh3_wm3_7_c0: (c0, 0.000000ns)
signal bh3_wm2_7_c0 :  std_logic;
   -- timing of bh3_wm2_7_c0: (c0, 0.000000ns)
signal bh3_wm1_7_c0, bh3_wm1_7_c1 :  std_logic;
   -- timing of bh3_wm1_7_c0: (c0, 0.000000ns)
signal bh3_w0_7_c0, bh3_w0_7_c1 :  std_logic;
   -- timing of bh3_w0_7_c0: (c0, 0.000000ns)
signal bh3_w1_7_c0 :  std_logic;
   -- timing of bh3_w1_7_c0: (c0, 0.000000ns)
signal bh3_w2_6_c0 :  std_logic;
   -- timing of bh3_w2_6_c0: (c0, 0.000000ns)
signal iX8_c0 :  signed(9+11 downto 0);
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
signal bh3_wm5_8_c0, bh3_wm5_8_c1 :  std_logic;
   -- timing of bh3_wm5_8_c0: (c0, 0.000000ns)
signal bh3_wm4_8_c0, bh3_wm4_8_c1 :  std_logic;
   -- timing of bh3_wm4_8_c0: (c0, 0.000000ns)
signal bh3_wm3_8_c0 :  std_logic;
   -- timing of bh3_wm3_8_c0: (c0, 0.000000ns)
signal bh3_wm2_8_c0 :  std_logic;
   -- timing of bh3_wm2_8_c0: (c0, 0.000000ns)
signal bh3_wm1_8_c0, bh3_wm1_8_c1 :  std_logic;
   -- timing of bh3_wm1_8_c0: (c0, 0.000000ns)
signal bh3_w0_8_c0, bh3_w0_8_c1 :  std_logic;
   -- timing of bh3_w0_8_c0: (c0, 0.000000ns)
signal bh3_w1_8_c0 :  std_logic;
   -- timing of bh3_w1_8_c0: (c0, 0.000000ns)
signal bh3_w2_7_c0 :  std_logic;
   -- timing of bh3_w2_7_c0: (c0, 0.000000ns)
signal bh3_w3_0_c0 :  std_logic;
   -- timing of bh3_w3_0_c0: (c0, 0.000000ns)
signal bh3_w4_0_c0, bh3_w4_0_c1, bh3_w4_0_c2 :  std_logic;
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
signal bh3_w1_9_c0 :  std_logic;
   -- timing of bh3_w1_9_c0: (c0, 0.000000ns)
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
signal Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid4643_Freq950_uid6_bh3_uid21_In0_c0 :  std_logic_vector(3 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid4643_Freq950_uid6_bh3_uid21_In0_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid4643_Freq950_uid6_bh3_uid21_In1_c0 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid4643_Freq950_uid6_bh3_uid21_In1_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid4643_Freq950_uid6_bh3_uid21_In2_c0 :  std_logic_vector(0 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid4643_Freq950_uid6_bh3_uid21_In2_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid4643_Freq950_uid6_bh3_uid21_Out0_c0 :  std_logic_vector(3 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid4643_Freq950_uid6_bh3_uid21_Out0_c0: (c0, 0.472000ns)
signal bh3_wm11_9_c0 :  std_logic;
   -- timing of bh3_wm11_9_c0: (c0, 0.472000ns)
signal bh3_wm10_9_c0, bh3_wm10_9_c1 :  std_logic;
   -- timing of bh3_wm10_9_c0: (c0, 0.472000ns)
signal bh3_wm9_9_c0 :  std_logic;
   -- timing of bh3_wm9_9_c0: (c0, 0.472000ns)
signal bh3_wm8_9_c0 :  std_logic;
   -- timing of bh3_wm8_9_c0: (c0, 0.472000ns)
signal Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid4643_Freq950_uid6_bh3_uid21_Out0_copy22_c0 :  std_logic_vector(3 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid4643_Freq950_uid6_bh3_uid21_Out0_copy22_c0: (c0, 0.000000ns)
signal XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid24_bh3_uid33_In0_c0 :  std_logic_vector(6 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid24_bh3_uid33_In0_c0: (c0, 0.000000ns)
signal XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid24_bh3_uid33_In2_c0 :  std_logic_vector(5 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid24_bh3_uid33_In2_c0: (c0, 0.000000ns)
signal XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid24_bh3_uid33_Out0_c1 :  std_logic_vector(4 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid24_bh3_uid33_Out0_c0: (c1, 0.325368ns)
signal bh3_wm9_10_c1 :  std_logic;
   -- timing of bh3_wm9_10_c0: (c1, 0.325368ns)
signal bh3_wm8_10_c1 :  std_logic;
   -- timing of bh3_wm8_10_c0: (c1, 0.325368ns)
signal bh3_wm7_9_c1 :  std_logic;
   -- timing of bh3_wm7_9_c0: (c1, 0.325368ns)
signal bh3_wm6_9_c1 :  std_logic;
   -- timing of bh3_wm6_9_c0: (c1, 0.325368ns)
signal bh3_wm5_9_c1, bh3_wm5_9_c2 :  std_logic;
   -- timing of bh3_wm5_9_c0: (c1, 0.325368ns)
signal XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid24_bh3_uid33_Out0_copy34_c0, XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid24_bh3_uid33_Out0_copy34_c1 :  std_logic_vector(4 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid24_bh3_uid33_Out0_copy34_c0: (c0, 0.000000ns)
signal XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid36_bh3_uid45_In0_c0 :  std_logic_vector(6 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid36_bh3_uid45_In0_c0: (c0, 0.000000ns)
signal XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid36_bh3_uid45_In2_c0 :  std_logic_vector(5 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid36_bh3_uid45_In2_c0: (c0, 0.000000ns)
signal XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid36_bh3_uid45_Out0_c1 :  std_logic_vector(4 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid36_bh3_uid45_Out0_c0: (c1, 0.325368ns)
signal bh3_wm8_11_c1 :  std_logic;
   -- timing of bh3_wm8_11_c0: (c1, 0.325368ns)
signal bh3_wm7_10_c1 :  std_logic;
   -- timing of bh3_wm7_10_c0: (c1, 0.325368ns)
signal bh3_wm6_10_c1 :  std_logic;
   -- timing of bh3_wm6_10_c0: (c1, 0.325368ns)
signal bh3_wm5_10_c1 :  std_logic;
   -- timing of bh3_wm5_10_c0: (c1, 0.325368ns)
signal bh3_wm4_9_c1, bh3_wm4_9_c2 :  std_logic;
   -- timing of bh3_wm4_9_c0: (c1, 0.325368ns)
signal XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid36_bh3_uid45_Out0_copy46_c0, XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid36_bh3_uid45_Out0_copy46_c1 :  std_logic_vector(4 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid36_bh3_uid45_Out0_copy46_c0: (c0, 0.000000ns)
signal XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid48_bh3_uid57_In0_c0 :  std_logic_vector(6 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid48_bh3_uid57_In0_c0: (c0, 0.000000ns)
signal XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid48_bh3_uid57_In2_c0 :  std_logic_vector(5 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid48_bh3_uid57_In2_c0: (c0, 0.000000ns)
signal XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid48_bh3_uid57_Out0_c1 :  std_logic_vector(4 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid48_bh3_uid57_Out0_c0: (c1, 0.325368ns)
signal bh3_wm4_10_c1 :  std_logic;
   -- timing of bh3_wm4_10_c0: (c1, 0.325368ns)
signal bh3_wm3_9_c1, bh3_wm3_9_c2 :  std_logic;
   -- timing of bh3_wm3_9_c0: (c1, 0.325368ns)
signal bh3_wm2_9_c1, bh3_wm2_9_c2 :  std_logic;
   -- timing of bh3_wm2_9_c0: (c1, 0.325368ns)
signal bh3_wm1_9_c1 :  std_logic;
   -- timing of bh3_wm1_9_c0: (c1, 0.325368ns)
signal bh3_w0_9_c1 :  std_logic;
   -- timing of bh3_w0_9_c0: (c1, 0.325368ns)
signal XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid48_bh3_uid57_Out0_copy58_c0, XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid48_bh3_uid57_Out0_copy58_c1 :  std_logic_vector(4 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid48_bh3_uid57_Out0_copy58_c0: (c0, 0.000000ns)
signal Compressor_FixMultiAdder_S_9_lsbOut_m11_uid4643_2_Freq950_uid60_bh3_uid61_In0_c0 :  std_logic_vector(2 downto 0);
   -- timing of Compressor_FixMultiAdder_S_9_lsbOut_m11_uid4643_2_Freq950_uid60_bh3_uid61_In0_c0: (c0, 0.000000ns)
signal Compressor_FixMultiAdder_S_9_lsbOut_m11_uid4643_2_Freq950_uid60_bh3_uid61_Out0_c0 :  std_logic_vector(1 downto 0);
   -- timing of Compressor_FixMultiAdder_S_9_lsbOut_m11_uid4643_2_Freq950_uid60_bh3_uid61_Out0_c0: (c0, 0.215000ns)
signal bh3_w1_10_c0 :  std_logic;
   -- timing of bh3_w1_10_c0: (c0, 0.215000ns)
signal bh3_w2_8_c0 :  std_logic;
   -- timing of bh3_w2_8_c0: (c0, 0.215000ns)
signal Compressor_FixMultiAdder_S_9_lsbOut_m11_uid4643_2_Freq950_uid60_bh3_uid61_Out0_copy62_c0 :  std_logic_vector(1 downto 0);
   -- timing of Compressor_FixMultiAdder_S_9_lsbOut_m11_uid4643_2_Freq950_uid60_bh3_uid61_Out0_copy62_c0: (c0, 0.000000ns)
signal Compressor_FixMultiAdder_S_9_lsbOut_m11_uid46423_3_Freq950_uid64_bh3_uid65_In0_c0 :  std_logic_vector(2 downto 0);
   -- timing of Compressor_FixMultiAdder_S_9_lsbOut_m11_uid46423_3_Freq950_uid64_bh3_uid65_In0_c0: (c0, 0.000000ns)
signal Compressor_FixMultiAdder_S_9_lsbOut_m11_uid46423_3_Freq950_uid64_bh3_uid65_In1_c0 :  std_logic_vector(1 downto 0);
   -- timing of Compressor_FixMultiAdder_S_9_lsbOut_m11_uid46423_3_Freq950_uid64_bh3_uid65_In1_c0: (c0, 0.000000ns)
signal Compressor_FixMultiAdder_S_9_lsbOut_m11_uid46423_3_Freq950_uid64_bh3_uid65_Out0_c0 :  std_logic_vector(2 downto 0);
   -- timing of Compressor_FixMultiAdder_S_9_lsbOut_m11_uid46423_3_Freq950_uid64_bh3_uid65_Out0_c0: (c0, 0.215000ns)
signal bh3_wm11_10_c0 :  std_logic;
   -- timing of bh3_wm11_10_c0: (c0, 0.215000ns)
signal bh3_wm10_10_c0, bh3_wm10_10_c1 :  std_logic;
   -- timing of bh3_wm10_10_c0: (c0, 0.215000ns)
signal bh3_wm9_11_c0, bh3_wm9_11_c1 :  std_logic;
   -- timing of bh3_wm9_11_c0: (c0, 0.215000ns)
signal Compressor_FixMultiAdder_S_9_lsbOut_m11_uid46423_3_Freq950_uid64_bh3_uid65_Out0_copy66_c0 :  std_logic_vector(2 downto 0);
   -- timing of Compressor_FixMultiAdder_S_9_lsbOut_m11_uid46423_3_Freq950_uid64_bh3_uid65_Out0_copy66_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In0_c0, Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In0_c1 :  std_logic_vector(3 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In0_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In1_c0, Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In1_c1 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In1_c0: (c0, 0.472000ns)
signal Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In2_c0, Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In2_c1 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In2_c0: (c0, 0.472000ns)
signal Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In3_c0, Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In3_c1 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In3_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In4_c0, Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In4_c1 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In4_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In5_c0, Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In5_c1 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In5_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In6_c1 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In6_c0: (c1, 0.325368ns)
signal Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In7_c0, Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In7_c1 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In7_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In8_c0, Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In8_c1 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In8_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In9_c0, Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In9_c1 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In9_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In10_c0, Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In10_c1 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In10_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In11_c0, Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In11_c1 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In11_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In12_c0, Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In12_c1 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In12_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In13_c0, Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In13_c1 :  std_logic_vector(0 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In13_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_Out0_c1 :  std_logic_vector(14 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_Out0_c0: (c1, 0.823368ns)
signal bh3_wm10_11_c1 :  std_logic;
   -- timing of bh3_wm10_11_c0: (c1, 0.823368ns)
signal bh3_wm9_12_c1 :  std_logic;
   -- timing of bh3_wm9_12_c0: (c1, 0.823368ns)
signal bh3_wm8_12_c1 :  std_logic;
   -- timing of bh3_wm8_12_c0: (c1, 0.823368ns)
signal bh3_wm7_11_c1 :  std_logic;
   -- timing of bh3_wm7_11_c0: (c1, 0.823368ns)
signal bh3_wm6_11_c1 :  std_logic;
   -- timing of bh3_wm6_11_c0: (c1, 0.823368ns)
signal bh3_wm5_11_c1, bh3_wm5_11_c2 :  std_logic;
   -- timing of bh3_wm5_11_c0: (c1, 0.823368ns)
signal bh3_wm4_11_c1, bh3_wm4_11_c2 :  std_logic;
   -- timing of bh3_wm4_11_c0: (c1, 0.823368ns)
signal bh3_wm3_10_c1, bh3_wm3_10_c2 :  std_logic;
   -- timing of bh3_wm3_10_c0: (c1, 0.823368ns)
signal bh3_wm2_10_c1, bh3_wm2_10_c2 :  std_logic;
   -- timing of bh3_wm2_10_c0: (c1, 0.823368ns)
signal bh3_wm1_10_c1, bh3_wm1_10_c2 :  std_logic;
   -- timing of bh3_wm1_10_c0: (c1, 0.823368ns)
signal bh3_w0_10_c1, bh3_w0_10_c2 :  std_logic;
   -- timing of bh3_w0_10_c0: (c1, 0.823368ns)
signal bh3_w1_11_c1, bh3_w1_11_c2 :  std_logic;
   -- timing of bh3_w1_11_c0: (c1, 0.823368ns)
signal bh3_w2_9_c1, bh3_w2_9_c2 :  std_logic;
   -- timing of bh3_w2_9_c0: (c1, 0.823368ns)
signal bh3_w3_1_c1, bh3_w3_1_c2 :  std_logic;
   -- timing of bh3_w3_1_c0: (c1, 0.823368ns)
signal bh3_w4_1_c1, bh3_w4_1_c2 :  std_logic;
   -- timing of bh3_w4_1_c0: (c1, 0.823368ns)
signal Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_Out0_copy123_c1 :  std_logic_vector(14 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_Out0_copy123_c0: (c1, 0.325368ns)
signal XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid125_bh3_uid134_In0_c1 :  std_logic_vector(6 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid125_bh3_uid134_In0_c0: (c1, 0.325368ns)
signal XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid125_bh3_uid134_In2_c0, XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid125_bh3_uid134_In2_c1 :  std_logic_vector(5 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid125_bh3_uid134_In2_c0: (c0, 0.000000ns)
signal XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid125_bh3_uid134_Out0_c2 :  std_logic_vector(4 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid125_bh3_uid134_Out0_c0: (c2, 0.650737ns)
signal bh3_wm5_12_c2 :  std_logic;
   -- timing of bh3_wm5_12_c0: (c2, 0.650737ns)
signal bh3_wm4_12_c2 :  std_logic;
   -- timing of bh3_wm4_12_c0: (c2, 0.650737ns)
signal bh3_wm3_11_c2 :  std_logic;
   -- timing of bh3_wm3_11_c0: (c2, 0.650737ns)
signal bh3_wm2_11_c2 :  std_logic;
   -- timing of bh3_wm2_11_c0: (c2, 0.650737ns)
signal bh3_wm1_11_c2 :  std_logic;
   -- timing of bh3_wm1_11_c0: (c2, 0.650737ns)
signal XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid125_bh3_uid134_Out0_copy135_c1, XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid125_bh3_uid134_Out0_copy135_c2 :  std_logic_vector(4 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid125_bh3_uid134_Out0_copy135_c0: (c1, 0.325368ns)
signal XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid137_bh3_uid146_In0_c1 :  std_logic_vector(6 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid137_bh3_uid146_In0_c0: (c1, 0.325368ns)
signal XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid137_bh3_uid146_In2_c0, XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid137_bh3_uid146_In2_c1 :  std_logic_vector(5 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid137_bh3_uid146_In2_c0: (c0, 0.215000ns)
signal XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid137_bh3_uid146_Out0_c2 :  std_logic_vector(4 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid137_bh3_uid146_Out0_c0: (c2, 0.650737ns)
signal bh3_wm1_12_c2 :  std_logic;
   -- timing of bh3_wm1_12_c0: (c2, 0.650737ns)
signal bh3_w0_11_c2 :  std_logic;
   -- timing of bh3_w0_11_c0: (c2, 0.650737ns)
signal bh3_w1_12_c2 :  std_logic;
   -- timing of bh3_w1_12_c0: (c2, 0.650737ns)
signal bh3_w2_10_c2 :  std_logic;
   -- timing of bh3_w2_10_c0: (c2, 0.650737ns)
signal bh3_w3_2_c2 :  std_logic;
   -- timing of bh3_w3_2_c0: (c2, 0.650737ns)
signal XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid137_bh3_uid146_Out0_copy147_c1, XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid137_bh3_uid146_Out0_copy147_c2 :  std_logic_vector(4 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid137_bh3_uid146_Out0_copy147_c0: (c1, 0.325368ns)
signal XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid149_bh3_uid158_In0_c1 :  std_logic_vector(6 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid149_bh3_uid158_In0_c0: (c1, 0.325368ns)
signal XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid149_bh3_uid158_In2_c0, XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid149_bh3_uid158_In2_c1 :  std_logic_vector(5 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid149_bh3_uid158_In2_c0: (c0, 0.215000ns)
signal XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid149_bh3_uid158_Out0_c2 :  std_logic_vector(4 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid149_bh3_uid158_Out0_c0: (c2, 0.650737ns)
signal bh3_w0_12_c2 :  std_logic;
   -- timing of bh3_w0_12_c0: (c2, 0.650737ns)
signal bh3_w1_13_c2 :  std_logic;
   -- timing of bh3_w1_13_c0: (c2, 0.650737ns)
signal bh3_w2_11_c2 :  std_logic;
   -- timing of bh3_w2_11_c0: (c2, 0.650737ns)
signal bh3_w3_3_c2 :  std_logic;
   -- timing of bh3_w3_3_c0: (c2, 0.650737ns)
signal bh3_w4_2_c2 :  std_logic;
   -- timing of bh3_w4_2_c0: (c2, 0.650737ns)
signal XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid149_bh3_uid158_Out0_copy159_c1, XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid149_bh3_uid158_Out0_copy159_c2 :  std_logic_vector(4 downto 0);
   -- timing of XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid149_bh3_uid158_Out0_copy159_c0: (c1, 0.325368ns)
signal Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In0_c0, Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In0_c1, Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In0_c2 :  std_logic_vector(3 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In0_c0: (c0, 0.472000ns)
signal Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In1_c1, Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In1_c2 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In1_c0: (c1, 0.823368ns)
signal Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In2_c1, Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In2_c2 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In2_c0: (c1, 0.823368ns)
signal Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In3_c1, Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In3_c2 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In3_c0: (c1, 0.823368ns)
signal Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In4_c1, Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In4_c2 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In4_c0: (c1, 0.823368ns)
signal Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In5_c1, Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In5_c2 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In5_c0: (c1, 0.823368ns)
signal Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In6_c2 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In6_c0: (c2, 0.650737ns)
signal Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In7_c2 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In7_c0: (c2, 0.650737ns)
signal Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In8_c2 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In8_c0: (c2, 0.650737ns)
signal Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In9_c2 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In9_c0: (c2, 0.650737ns)
signal Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In10_c2 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In10_c0: (c2, 0.650737ns)
signal Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In11_c2 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In11_c0: (c2, 0.650737ns)
signal Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In12_c2 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In12_c0: (c2, 0.650737ns)
signal Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In13_c2 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In13_c0: (c2, 0.650737ns)
signal Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In14_c2 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In14_c0: (c2, 0.650737ns)
signal Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In15_c2 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In15_c0: (c2, 0.650737ns)
signal Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In16_c0, Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In16_c1, Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In16_c2 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In16_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In17_c0, Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In17_c1, Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In17_c2 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In17_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In18_c0, Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In18_c1, Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In18_c2 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In18_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In19_c0, Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In19_c1, Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In19_c2 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In19_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In20_c0, Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In20_c1, Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In20_c2 :  std_logic_vector(2 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In20_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In21_c0, Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In21_c1, Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In21_c2 :  std_logic_vector(0 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In21_c0: (c0, 0.000000ns)
signal Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_Out0_c3 :  std_logic_vector(22 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_Out0_c0: (c3, 0.287105ns)
signal bh3_wm11_11_c3 :  std_logic;
   -- timing of bh3_wm11_11_c0: (c3, 0.287105ns)
signal bh3_wm10_12_c3 :  std_logic;
   -- timing of bh3_wm10_12_c0: (c3, 0.287105ns)
signal bh3_wm9_13_c3 :  std_logic;
   -- timing of bh3_wm9_13_c0: (c3, 0.287105ns)
signal bh3_wm8_13_c3 :  std_logic;
   -- timing of bh3_wm8_13_c0: (c3, 0.287105ns)
signal bh3_wm7_12_c3 :  std_logic;
   -- timing of bh3_wm7_12_c0: (c3, 0.287105ns)
signal bh3_wm6_12_c3 :  std_logic;
   -- timing of bh3_wm6_12_c0: (c3, 0.287105ns)
signal bh3_wm5_13_c3 :  std_logic;
   -- timing of bh3_wm5_13_c0: (c3, 0.287105ns)
signal bh3_wm4_13_c3 :  std_logic;
   -- timing of bh3_wm4_13_c0: (c3, 0.287105ns)
signal bh3_wm3_12_c3 :  std_logic;
   -- timing of bh3_wm3_12_c0: (c3, 0.287105ns)
signal bh3_wm2_12_c3 :  std_logic;
   -- timing of bh3_wm2_12_c0: (c3, 0.287105ns)
signal bh3_wm1_13_c3 :  std_logic;
   -- timing of bh3_wm1_13_c0: (c3, 0.287105ns)
signal bh3_w0_13_c3 :  std_logic;
   -- timing of bh3_w0_13_c0: (c3, 0.287105ns)
signal bh3_w1_14_c3 :  std_logic;
   -- timing of bh3_w1_14_c0: (c3, 0.287105ns)
signal bh3_w2_12_c3 :  std_logic;
   -- timing of bh3_w2_12_c0: (c3, 0.287105ns)
signal bh3_w3_4_c3 :  std_logic;
   -- timing of bh3_w3_4_c0: (c3, 0.287105ns)
signal bh3_w4_3_c3 :  std_logic;
   -- timing of bh3_w4_3_c0: (c3, 0.287105ns)
signal bh3_w5_2_c3 :  std_logic;
   -- timing of bh3_w5_2_c0: (c3, 0.287105ns)
signal bh3_w6_2_c3 :  std_logic;
   -- timing of bh3_w6_2_c0: (c3, 0.287105ns)
signal bh3_w7_2_c3 :  std_logic;
   -- timing of bh3_w7_2_c0: (c3, 0.287105ns)
signal bh3_w8_2_c3 :  std_logic;
   -- timing of bh3_w8_2_c0: (c3, 0.287105ns)
signal bh3_w9_2_c3 :  std_logic;
   -- timing of bh3_w9_2_c0: (c3, 0.287105ns)
signal Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_Out0_copy244_c2, Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_Out0_copy244_c3 :  std_logic_vector(22 downto 0);
   -- timing of Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_Out0_copy244_c0: (c2, 0.650737ns)
signal tmp_bitheapResult_bh3_20_c3 :  std_logic_vector(20 downto 0);
   -- timing of tmp_bitheapResult_bh3_20_c0: (c3, 0.287105ns)
signal bitheapResult_bh3_c3 :  std_logic_vector(20 downto 0);
   -- timing of bitheapResult_bh3_c0: (c3, 0.287105ns)
signal OutRes_c3 :  std_logic_vector(20 downto 0);
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
               bh3_wm5_3_c1 <= '0';
               bh3_wm1_3_c1 <= '0';
               bh3_w0_3_c1 <= '0';
               bh3_wm5_4_c1 <= '0';
               bh3_wm1_4_c1 <= '0';
               bh3_w0_4_c1 <= '0';
               bh3_wm5_5_c1 <= '0';
               bh3_wm1_5_c1 <= '0';
               bh3_w0_5_c1 <= '0';
               bh3_wm5_6_c1 <= '0';
               bh3_wm1_6_c1 <= '0';
               bh3_w0_6_c1 <= '0';
               bh3_wm5_7_c1 <= '0';
               bh3_wm4_7_c1 <= '0';
               bh3_wm1_7_c1 <= '0';
               bh3_w0_7_c1 <= '0';
               bh3_wm5_8_c1 <= '0';
               bh3_wm4_8_c1 <= '0';
               bh3_wm1_8_c1 <= '0';
               bh3_w0_8_c1 <= '0';
               bh3_w4_0_c1 <= '0';
               bh3_wm10_9_c1 <= '0';
               XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid24_bh3_uid33_Out0_copy34_c1 <= (others => '0');
               XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid36_bh3_uid45_Out0_copy46_c1 <= (others => '0');
               XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid48_bh3_uid57_Out0_copy58_c1 <= (others => '0');
               bh3_wm10_10_c1 <= '0';
               bh3_wm9_11_c1 <= '0';
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In0_c1 <= (others => '0');
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In1_c1 <= (others => '0');
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In2_c1 <= (others => '0');
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In3_c1 <= (others => '0');
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In4_c1 <= (others => '0');
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In5_c1 <= (others => '0');
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In7_c1 <= (others => '0');
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In8_c1 <= (others => '0');
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In9_c1 <= (others => '0');
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In10_c1 <= (others => '0');
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In11_c1 <= (others => '0');
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In12_c1 <= (others => '0');
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In13_c1 <= (others => '0');
               XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid125_bh3_uid134_In2_c1 <= (others => '0');
               XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid137_bh3_uid146_In2_c1 <= (others => '0');
               XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid149_bh3_uid158_In2_c1 <= (others => '0');
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In0_c1 <= (others => '0');
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In16_c1 <= (others => '0');
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In17_c1 <= (others => '0');
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In18_c1 <= (others => '0');
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In19_c1 <= (others => '0');
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In20_c1 <= (others => '0');
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In21_c1 <= (others => '0');
               bh3_w4_0_c2 <= '0';
               bh3_wm5_9_c2 <= '0';
               bh3_wm4_9_c2 <= '0';
               bh3_wm3_9_c2 <= '0';
               bh3_wm2_9_c2 <= '0';
               bh3_wm5_11_c2 <= '0';
               bh3_wm4_11_c2 <= '0';
               bh3_wm3_10_c2 <= '0';
               bh3_wm2_10_c2 <= '0';
               bh3_wm1_10_c2 <= '0';
               bh3_w0_10_c2 <= '0';
               bh3_w1_11_c2 <= '0';
               bh3_w2_9_c2 <= '0';
               bh3_w3_1_c2 <= '0';
               bh3_w4_1_c2 <= '0';
               XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid125_bh3_uid134_Out0_copy135_c2 <= (others => '0');
               XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid137_bh3_uid146_Out0_copy147_c2 <= (others => '0');
               XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid149_bh3_uid158_Out0_copy159_c2 <= (others => '0');
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In0_c2 <= (others => '0');
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In1_c2 <= (others => '0');
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In2_c2 <= (others => '0');
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In3_c2 <= (others => '0');
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In4_c2 <= (others => '0');
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In5_c2 <= (others => '0');
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In16_c2 <= (others => '0');
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In17_c2 <= (others => '0');
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In18_c2 <= (others => '0');
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In19_c2 <= (others => '0');
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In20_c2 <= (others => '0');
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In21_c2 <= (others => '0');
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_Out0_copy244_c3 <= (others => '0');
         elsif clk'event and clk = '1' then
            if write_enable_1 = '1' then
               bh3_wm5_3_c1 <= bh3_wm5_3_c0;
               bh3_wm1_3_c1 <= bh3_wm1_3_c0;
               bh3_w0_3_c1 <= bh3_w0_3_c0;
               bh3_wm5_4_c1 <= bh3_wm5_4_c0;
               bh3_wm1_4_c1 <= bh3_wm1_4_c0;
               bh3_w0_4_c1 <= bh3_w0_4_c0;
               bh3_wm5_5_c1 <= bh3_wm5_5_c0;
               bh3_wm1_5_c1 <= bh3_wm1_5_c0;
               bh3_w0_5_c1 <= bh3_w0_5_c0;
               bh3_wm5_6_c1 <= bh3_wm5_6_c0;
               bh3_wm1_6_c1 <= bh3_wm1_6_c0;
               bh3_w0_6_c1 <= bh3_w0_6_c0;
               bh3_wm5_7_c1 <= bh3_wm5_7_c0;
               bh3_wm4_7_c1 <= bh3_wm4_7_c0;
               bh3_wm1_7_c1 <= bh3_wm1_7_c0;
               bh3_w0_7_c1 <= bh3_w0_7_c0;
               bh3_wm5_8_c1 <= bh3_wm5_8_c0;
               bh3_wm4_8_c1 <= bh3_wm4_8_c0;
               bh3_wm1_8_c1 <= bh3_wm1_8_c0;
               bh3_w0_8_c1 <= bh3_w0_8_c0;
               bh3_w4_0_c1 <= bh3_w4_0_c0;
               bh3_wm10_9_c1 <= bh3_wm10_9_c0;
               XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid24_bh3_uid33_Out0_copy34_c1 <= XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid24_bh3_uid33_Out0_copy34_c0;
               XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid36_bh3_uid45_Out0_copy46_c1 <= XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid36_bh3_uid45_Out0_copy46_c0;
               XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid48_bh3_uid57_Out0_copy58_c1 <= XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid48_bh3_uid57_Out0_copy58_c0;
               bh3_wm10_10_c1 <= bh3_wm10_10_c0;
               bh3_wm9_11_c1 <= bh3_wm9_11_c0;
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In0_c1 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In0_c0;
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In1_c1 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In1_c0;
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In2_c1 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In2_c0;
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In3_c1 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In3_c0;
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In4_c1 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In4_c0;
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In5_c1 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In5_c0;
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In7_c1 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In7_c0;
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In8_c1 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In8_c0;
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In9_c1 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In9_c0;
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In10_c1 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In10_c0;
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In11_c1 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In11_c0;
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In12_c1 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In12_c0;
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In13_c1 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In13_c0;
               XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid125_bh3_uid134_In2_c1 <= XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid125_bh3_uid134_In2_c0;
               XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid137_bh3_uid146_In2_c1 <= XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid137_bh3_uid146_In2_c0;
               XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid149_bh3_uid158_In2_c1 <= XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid149_bh3_uid158_In2_c0;
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In0_c1 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In0_c0;
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In16_c1 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In16_c0;
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In17_c1 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In17_c0;
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In18_c1 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In18_c0;
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In19_c1 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In19_c0;
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In20_c1 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In20_c0;
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In21_c1 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In21_c0;
            end if;
            if write_enable_2 = '1' then
               bh3_w4_0_c2 <= bh3_w4_0_c1;
               bh3_wm5_9_c2 <= bh3_wm5_9_c1;
               bh3_wm4_9_c2 <= bh3_wm4_9_c1;
               bh3_wm3_9_c2 <= bh3_wm3_9_c1;
               bh3_wm2_9_c2 <= bh3_wm2_9_c1;
               bh3_wm5_11_c2 <= bh3_wm5_11_c1;
               bh3_wm4_11_c2 <= bh3_wm4_11_c1;
               bh3_wm3_10_c2 <= bh3_wm3_10_c1;
               bh3_wm2_10_c2 <= bh3_wm2_10_c1;
               bh3_wm1_10_c2 <= bh3_wm1_10_c1;
               bh3_w0_10_c2 <= bh3_w0_10_c1;
               bh3_w1_11_c2 <= bh3_w1_11_c1;
               bh3_w2_9_c2 <= bh3_w2_9_c1;
               bh3_w3_1_c2 <= bh3_w3_1_c1;
               bh3_w4_1_c2 <= bh3_w4_1_c1;
               XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid125_bh3_uid134_Out0_copy135_c2 <= XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid125_bh3_uid134_Out0_copy135_c1;
               XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid137_bh3_uid146_Out0_copy147_c2 <= XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid137_bh3_uid146_Out0_copy147_c1;
               XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid149_bh3_uid158_Out0_copy159_c2 <= XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid149_bh3_uid158_Out0_copy159_c1;
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In0_c2 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In0_c1;
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In1_c2 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In1_c1;
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In2_c2 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In2_c1;
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In3_c2 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In3_c1;
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In4_c2 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In4_c1;
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In5_c2 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In5_c1;
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In16_c2 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In16_c1;
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In17_c2 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In17_c1;
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In18_c2 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In18_c1;
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In19_c2 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In19_c1;
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In20_c2 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In20_c1;
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In21_c2 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In21_c1;
            end if;
            if write_enable_3 = '1' then
               Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_Out0_copy244_c3 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_Out0_copy244_c2;
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
   bh3_w1_1_c0 <= iX1_c0(12);
   bh3_w2_0_c0 <= not iX1_c0(13);
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
   bh3_w1_2_c0 <= iX2_c0(12);
   bh3_w2_1_c0 <= not iX2_c0(13);
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
   bh3_w2_2_c0 <= not iX3_c0(13);
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
   bh3_w1_4_c0 <= iX4_c0(12);
   bh3_w2_3_c0 <= not iX4_c0(13);
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
   bh3_w2_4_c0 <= not iX5_c0(13);
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
   bh3_w1_6_c0 <= iX6_c0(12);
   bh3_w2_5_c0 <= not iX6_c0(13);
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
   bh3_w1_7_c0 <= iX7_c0(12);
   bh3_w2_6_c0 <= not iX7_c0(13);
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
   bh3_w2_7_c0 <= iX8_c0(13);
   bh3_w3_0_c0 <= iX8_c0(14);
   bh3_w4_0_c0 <= iX8_c0(15);
   bh3_w5_0_c0 <= iX8_c0(16);
   bh3_w6_0_c0 <= iX8_c0(17);
   bh3_w7_0_c0 <= iX8_c0(18);
   bh3_w8_0_c0 <= iX8_c0(19);
   bh3_w9_0_c0 <= iX8_c0(20);

   -- Adding the constant bits 
   bh3_w1_9_c0 <= '1';
   bh3_w5_1_c0 <= '1';
   bh3_w6_1_c0 <= '1';
   bh3_w7_1_c0 <= '1';
   bh3_w8_1_c0 <= '1';
   bh3_w9_1_c0 <= '1';


   Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid4643_Freq950_uid6_bh3_uid21_In0_c0 <= "" & bh3_wm11_0_c0 & bh3_wm11_1_c0 & bh3_wm11_2_c0 & bh3_wm11_3_c0;
   Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid4643_Freq950_uid6_bh3_uid21_In1_c0 <= "" & bh3_wm10_0_c0 & bh3_wm10_1_c0 & bh3_wm10_2_c0;
   Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid4643_Freq950_uid6_bh3_uid21_In2_c0 <= "" & "0";
   bh3_wm11_9_c0 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid4643_Freq950_uid6_bh3_uid21_Out0_c0(0);
   bh3_wm10_9_c0 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid4643_Freq950_uid6_bh3_uid21_Out0_c0(1);
   bh3_wm9_9_c0 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid4643_Freq950_uid6_bh3_uid21_Out0_c0(2);
   bh3_wm8_9_c0 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid4643_Freq950_uid6_bh3_uid21_Out0_c0(3);
   Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid4643_Freq950_uid6_uid21: Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid4643_Freq950_uid6
      port map ( X0 => Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid4643_Freq950_uid6_bh3_uid21_In0_c0,
                 X1 => Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid4643_Freq950_uid6_bh3_uid21_In1_c0,
                 X2 => Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid4643_Freq950_uid6_bh3_uid21_In2_c0,
                 R => Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid4643_Freq950_uid6_bh3_uid21_Out0_copy22_c0);
   Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid4643_Freq950_uid6_bh3_uid21_Out0_c0 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid4643_Freq950_uid6_bh3_uid21_Out0_copy22_c0; -- output copy to hold a pipeline register if needed


   XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid24_bh3_uid33_In0_c0 <= "" & bh3_wm9_0_c0 & bh3_wm9_1_c0 & bh3_wm9_2_c0 & bh3_wm9_3_c0 & bh3_wm9_4_c0 & bh3_wm9_5_c0 & bh3_wm9_6_c0;
   XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid24_bh3_uid33_In2_c0 <= "" & bh3_wm7_0_c0 & bh3_wm7_1_c0 & bh3_wm7_2_c0 & bh3_wm7_3_c0 & bh3_wm7_4_c0 & bh3_wm7_5_c0;
   bh3_wm9_10_c1 <= XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid24_bh3_uid33_Out0_c1(0);
   bh3_wm8_10_c1 <= XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid24_bh3_uid33_Out0_c1(1);
   bh3_wm7_9_c1 <= XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid24_bh3_uid33_Out0_c1(2);
   bh3_wm6_9_c1 <= XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid24_bh3_uid33_Out0_c1(3);
   bh3_wm5_9_c1 <= XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid24_bh3_uid33_Out0_c1(4);
   XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid24_uid33: XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid24
      port map ( X0 => XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid24_bh3_uid33_In0_c0,
                 X2 => XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid24_bh3_uid33_In2_c0,
                 R => XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid24_bh3_uid33_Out0_copy34_c0);
   XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid24_bh3_uid33_Out0_c1 <= XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid24_bh3_uid33_Out0_copy34_c1; -- output copy to hold a pipeline register if needed


   XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid36_bh3_uid45_In0_c0 <= "" & bh3_wm8_0_c0 & bh3_wm8_1_c0 & bh3_wm8_2_c0 & bh3_wm8_3_c0 & bh3_wm8_4_c0 & bh3_wm8_5_c0 & bh3_wm8_6_c0;
   XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid36_bh3_uid45_In2_c0 <= "" & bh3_wm6_0_c0 & bh3_wm6_1_c0 & bh3_wm6_2_c0 & bh3_wm6_3_c0 & bh3_wm6_4_c0 & bh3_wm6_5_c0;
   bh3_wm8_11_c1 <= XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid36_bh3_uid45_Out0_c1(0);
   bh3_wm7_10_c1 <= XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid36_bh3_uid45_Out0_c1(1);
   bh3_wm6_10_c1 <= XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid36_bh3_uid45_Out0_c1(2);
   bh3_wm5_10_c1 <= XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid36_bh3_uid45_Out0_c1(3);
   bh3_wm4_9_c1 <= XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid36_bh3_uid45_Out0_c1(4);
   XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid36_uid45: XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid36
      port map ( X0 => XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid36_bh3_uid45_In0_c0,
                 X2 => XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid36_bh3_uid45_In2_c0,
                 R => XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid36_bh3_uid45_Out0_copy46_c0);
   XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid36_bh3_uid45_Out0_c1 <= XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid36_bh3_uid45_Out0_copy46_c1; -- output copy to hold a pipeline register if needed


   XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid48_bh3_uid57_In0_c0 <= "" & bh3_wm4_0_c0 & bh3_wm4_1_c0 & bh3_wm4_2_c0 & bh3_wm4_3_c0 & bh3_wm4_4_c0 & bh3_wm4_5_c0 & bh3_wm4_6_c0;
   XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid48_bh3_uid57_In2_c0 <= "" & bh3_wm2_0_c0 & bh3_wm2_1_c0 & bh3_wm2_2_c0 & bh3_wm2_3_c0 & bh3_wm2_4_c0 & bh3_wm2_5_c0;
   bh3_wm4_10_c1 <= XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid48_bh3_uid57_Out0_c1(0);
   bh3_wm3_9_c1 <= XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid48_bh3_uid57_Out0_c1(1);
   bh3_wm2_9_c1 <= XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid48_bh3_uid57_Out0_c1(2);
   bh3_wm1_9_c1 <= XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid48_bh3_uid57_Out0_c1(3);
   bh3_w0_9_c1 <= XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid48_bh3_uid57_Out0_c1(4);
   XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid48_uid57: XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid48
      port map ( X0 => XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid48_bh3_uid57_In0_c0,
                 X2 => XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid48_bh3_uid57_In2_c0,
                 R => XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid48_bh3_uid57_Out0_copy58_c0);
   XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid48_bh3_uid57_Out0_c1 <= XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid48_bh3_uid57_Out0_copy58_c1; -- output copy to hold a pipeline register if needed


   Compressor_FixMultiAdder_S_9_lsbOut_m11_uid4643_2_Freq950_uid60_bh3_uid61_In0_c0 <= "" & bh3_w1_0_c0 & bh3_w1_1_c0 & "0";
   bh3_w1_10_c0 <= Compressor_FixMultiAdder_S_9_lsbOut_m11_uid4643_2_Freq950_uid60_bh3_uid61_Out0_c0(0);
   bh3_w2_8_c0 <= Compressor_FixMultiAdder_S_9_lsbOut_m11_uid4643_2_Freq950_uid60_bh3_uid61_Out0_c0(1);
   Compressor_FixMultiAdder_S_9_lsbOut_m11_uid4643_2_Freq950_uid60_uid61: Compressor_FixMultiAdder_S_9_lsbOut_m11_uid4643_2_Freq950_uid60
      port map ( X0 => Compressor_FixMultiAdder_S_9_lsbOut_m11_uid4643_2_Freq950_uid60_bh3_uid61_In0_c0,
                 R => Compressor_FixMultiAdder_S_9_lsbOut_m11_uid4643_2_Freq950_uid60_bh3_uid61_Out0_copy62_c0);
   Compressor_FixMultiAdder_S_9_lsbOut_m11_uid4643_2_Freq950_uid60_bh3_uid61_Out0_c0 <= Compressor_FixMultiAdder_S_9_lsbOut_m11_uid4643_2_Freq950_uid60_bh3_uid61_Out0_copy62_c0; -- output copy to hold a pipeline register if needed


   Compressor_FixMultiAdder_S_9_lsbOut_m11_uid46423_3_Freq950_uid64_bh3_uid65_In0_c0 <= "" & bh3_wm11_4_c0 & bh3_wm11_5_c0 & bh3_wm11_6_c0;
   Compressor_FixMultiAdder_S_9_lsbOut_m11_uid46423_3_Freq950_uid64_bh3_uid65_In1_c0 <= "" & bh3_wm10_3_c0 & bh3_wm10_4_c0;
   bh3_wm11_10_c0 <= Compressor_FixMultiAdder_S_9_lsbOut_m11_uid46423_3_Freq950_uid64_bh3_uid65_Out0_c0(0);
   bh3_wm10_10_c0 <= Compressor_FixMultiAdder_S_9_lsbOut_m11_uid46423_3_Freq950_uid64_bh3_uid65_Out0_c0(1);
   bh3_wm9_11_c0 <= Compressor_FixMultiAdder_S_9_lsbOut_m11_uid46423_3_Freq950_uid64_bh3_uid65_Out0_c0(2);
   Compressor_FixMultiAdder_S_9_lsbOut_m11_uid46423_3_Freq950_uid64_uid65: Compressor_FixMultiAdder_S_9_lsbOut_m11_uid46423_3_Freq950_uid64
      port map ( X0 => Compressor_FixMultiAdder_S_9_lsbOut_m11_uid46423_3_Freq950_uid64_bh3_uid65_In0_c0,
                 X1 => Compressor_FixMultiAdder_S_9_lsbOut_m11_uid46423_3_Freq950_uid64_bh3_uid65_In1_c0,
                 R => Compressor_FixMultiAdder_S_9_lsbOut_m11_uid46423_3_Freq950_uid64_bh3_uid65_Out0_copy66_c0);
   Compressor_FixMultiAdder_S_9_lsbOut_m11_uid46423_3_Freq950_uid64_bh3_uid65_Out0_c0 <= Compressor_FixMultiAdder_S_9_lsbOut_m11_uid46423_3_Freq950_uid64_bh3_uid65_Out0_copy66_c0; -- output copy to hold a pipeline register if needed


   Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In0_c0 <= "" & bh3_wm10_5_c0 & bh3_wm10_6_c0 & bh3_wm10_7_c0 & bh3_wm10_8_c0;
   Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In1_c0 <= "" & bh3_wm9_7_c0 & bh3_wm9_8_c0 & bh3_wm9_9_c0;
   Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In2_c0 <= "" & bh3_wm8_7_c0 & bh3_wm8_8_c0 & bh3_wm8_9_c0;
   Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In3_c0 <= "" & bh3_wm7_6_c0 & bh3_wm7_7_c0 & bh3_wm7_8_c0;
   Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In4_c0 <= "" & bh3_wm6_6_c0 & bh3_wm6_7_c0 & bh3_wm6_8_c0;
   Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In5_c0 <= "" & bh3_wm5_0_c0 & bh3_wm5_1_c0 & bh3_wm5_2_c0;
   Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In6_c1 <= "" & bh3_wm4_7_c1 & bh3_wm4_8_c1 & bh3_wm4_10_c1;
   Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In7_c0 <= "" & bh3_wm3_0_c0 & bh3_wm3_1_c0 & bh3_wm3_2_c0;
   Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In8_c0 <= "" & bh3_wm2_6_c0 & bh3_wm2_7_c0 & bh3_wm2_8_c0;
   Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In9_c0 <= "" & bh3_wm1_0_c0 & bh3_wm1_1_c0 & bh3_wm1_2_c0;
   Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In10_c0 <= "" & bh3_w0_0_c0 & bh3_w0_1_c0 & bh3_w0_2_c0;
   Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In11_c0 <= "" & bh3_w1_2_c0 & bh3_w1_3_c0 & bh3_w1_4_c0;
   Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In12_c0 <= "" & bh3_w2_0_c0 & bh3_w2_1_c0 & bh3_w2_2_c0;
   Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In13_c0 <= "" & bh3_w3_0_c0;
   bh3_wm10_11_c1 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_Out0_c1(0);
   bh3_wm9_12_c1 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_Out0_c1(1);
   bh3_wm8_12_c1 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_Out0_c1(2);
   bh3_wm7_11_c1 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_Out0_c1(3);
   bh3_wm6_11_c1 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_Out0_c1(4);
   bh3_wm5_11_c1 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_Out0_c1(5);
   bh3_wm4_11_c1 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_Out0_c1(6);
   bh3_wm3_10_c1 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_Out0_c1(7);
   bh3_wm2_10_c1 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_Out0_c1(8);
   bh3_wm1_10_c1 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_Out0_c1(9);
   bh3_w0_10_c1 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_Out0_c1(10);
   bh3_w1_11_c1 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_Out0_c1(11);
   bh3_w2_9_c1 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_Out0_c1(12);
   bh3_w3_1_c1 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_Out0_c1(13);
   bh3_w4_1_c1 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_Out0_c1(14);
   Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_uid122: Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68
      port map ( X0 => Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In0_c1,
                 X1 => Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In1_c1,
                 X10 => Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In10_c1,
                 X11 => Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In11_c1,
                 X12 => Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In12_c1,
                 X13 => Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In13_c1,
                 X2 => Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In2_c1,
                 X3 => Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In3_c1,
                 X4 => Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In4_c1,
                 X5 => Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In5_c1,
                 X6 => Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In6_c1,
                 X7 => Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In7_c1,
                 X8 => Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In8_c1,
                 X9 => Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_In9_c1,
                 R => Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_Out0_copy123_c1);
   Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_Out0_c1 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46414_Freq950_uid68_bh3_uid122_Out0_copy123_c1; -- output copy to hold a pipeline register if needed


   XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid125_bh3_uid134_In0_c1 <= "" & bh3_wm5_3_c1 & bh3_wm5_4_c1 & bh3_wm5_5_c1 & bh3_wm5_6_c1 & bh3_wm5_7_c1 & bh3_wm5_8_c1 & bh3_wm5_10_c1;
   XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid125_bh3_uid134_In2_c0 <= "" & bh3_wm3_3_c0 & bh3_wm3_4_c0 & bh3_wm3_5_c0 & bh3_wm3_6_c0 & bh3_wm3_7_c0 & bh3_wm3_8_c0;
   bh3_wm5_12_c2 <= XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid125_bh3_uid134_Out0_c2(0);
   bh3_wm4_12_c2 <= XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid125_bh3_uid134_Out0_c2(1);
   bh3_wm3_11_c2 <= XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid125_bh3_uid134_Out0_c2(2);
   bh3_wm2_11_c2 <= XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid125_bh3_uid134_Out0_c2(3);
   bh3_wm1_11_c2 <= XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid125_bh3_uid134_Out0_c2(4);
   XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid125_uid134: XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid125
      port map ( X0 => XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid125_bh3_uid134_In0_c1,
                 X2 => XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid125_bh3_uid134_In2_c1,
                 R => XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid125_bh3_uid134_Out0_copy135_c1);
   XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid125_bh3_uid134_Out0_c2 <= XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid125_bh3_uid134_Out0_copy135_c2; -- output copy to hold a pipeline register if needed


   XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid137_bh3_uid146_In0_c1 <= "" & bh3_wm1_3_c1 & bh3_wm1_4_c1 & bh3_wm1_5_c1 & bh3_wm1_6_c1 & bh3_wm1_7_c1 & bh3_wm1_8_c1 & bh3_wm1_9_c1;
   XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid137_bh3_uid146_In2_c0 <= "" & bh3_w1_5_c0 & bh3_w1_6_c0 & bh3_w1_7_c0 & bh3_w1_8_c0 & bh3_w1_9_c0 & bh3_w1_10_c0;
   bh3_wm1_12_c2 <= XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid137_bh3_uid146_Out0_c2(0);
   bh3_w0_11_c2 <= XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid137_bh3_uid146_Out0_c2(1);
   bh3_w1_12_c2 <= XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid137_bh3_uid146_Out0_c2(2);
   bh3_w2_10_c2 <= XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid137_bh3_uid146_Out0_c2(3);
   bh3_w3_2_c2 <= XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid137_bh3_uid146_Out0_c2(4);
   XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid137_uid146: XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid137
      port map ( X0 => XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid137_bh3_uid146_In0_c1,
                 X2 => XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid137_bh3_uid146_In2_c1,
                 R => XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid137_bh3_uid146_Out0_copy147_c1);
   XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid137_bh3_uid146_Out0_c2 <= XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid137_bh3_uid146_Out0_copy147_c2; -- output copy to hold a pipeline register if needed


   XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid149_bh3_uid158_In0_c1 <= "" & bh3_w0_3_c1 & bh3_w0_4_c1 & bh3_w0_5_c1 & bh3_w0_6_c1 & bh3_w0_7_c1 & bh3_w0_8_c1 & bh3_w0_9_c1;
   XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid149_bh3_uid158_In2_c0 <= "" & bh3_w2_3_c0 & bh3_w2_4_c0 & bh3_w2_5_c0 & bh3_w2_6_c0 & bh3_w2_7_c0 & bh3_w2_8_c0;
   bh3_w0_12_c2 <= XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid149_bh3_uid158_Out0_c2(0);
   bh3_w1_13_c2 <= XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid149_bh3_uid158_Out0_c2(1);
   bh3_w2_11_c2 <= XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid149_bh3_uid158_Out0_c2(2);
   bh3_w3_3_c2 <= XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid149_bh3_uid158_Out0_c2(3);
   bh3_w4_2_c2 <= XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid149_bh3_uid158_Out0_c2(4);
   XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid149_uid158: XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid149
      port map ( X0 => XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid149_bh3_uid158_In0_c1,
                 X2 => XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid149_bh3_uid158_In2_c1,
                 R => XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid149_bh3_uid158_Out0_copy159_c1);
   XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid149_bh3_uid158_Out0_c2 <= XilinxGPC_FixMultiAdder_S_9_lsbOut_m11_uid464607_5_Freq950_uid149_bh3_uid158_Out0_copy159_c2; -- output copy to hold a pipeline register if needed


   Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In0_c0 <= "" & bh3_wm11_7_c0 & bh3_wm11_8_c0 & bh3_wm11_10_c0 & bh3_wm11_9_c0;
   Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In1_c1 <= "" & bh3_wm10_10_c1 & bh3_wm10_9_c1 & bh3_wm10_11_c1;
   Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In2_c1 <= "" & bh3_wm9_11_c1 & bh3_wm9_10_c1 & bh3_wm9_12_c1;
   Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In3_c1 <= "" & bh3_wm8_11_c1 & bh3_wm8_10_c1 & bh3_wm8_12_c1;
   Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In4_c1 <= "" & bh3_wm7_10_c1 & bh3_wm7_9_c1 & bh3_wm7_11_c1;
   Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In5_c1 <= "" & bh3_wm6_10_c1 & bh3_wm6_9_c1 & bh3_wm6_11_c1;
   Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In6_c2 <= "" & bh3_wm5_9_c2 & bh3_wm5_11_c2 & bh3_wm5_12_c2;
   Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In7_c2 <= "" & bh3_wm4_9_c2 & bh3_wm4_11_c2 & bh3_wm4_12_c2;
   Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In8_c2 <= "" & bh3_wm3_9_c2 & bh3_wm3_10_c2 & bh3_wm3_11_c2;
   Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In9_c2 <= "" & bh3_wm2_9_c2 & bh3_wm2_10_c2 & bh3_wm2_11_c2;
   Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In10_c2 <= "" & bh3_wm1_10_c2 & bh3_wm1_12_c2 & bh3_wm1_11_c2;
   Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In11_c2 <= "" & bh3_w0_10_c2 & bh3_w0_12_c2 & bh3_w0_11_c2;
   Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In12_c2 <= "" & bh3_w1_11_c2 & bh3_w1_13_c2 & bh3_w1_12_c2;
   Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In13_c2 <= "" & bh3_w2_9_c2 & bh3_w2_11_c2 & bh3_w2_10_c2;
   Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In14_c2 <= "" & bh3_w3_1_c2 & bh3_w3_3_c2 & bh3_w3_2_c2;
   Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In15_c2 <= "" & bh3_w4_0_c2 & bh3_w4_1_c2 & bh3_w4_2_c2;
   Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In16_c0 <= "" & bh3_w5_0_c0 & bh3_w5_1_c0 & "0";
   Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In17_c0 <= "" & bh3_w6_0_c0 & bh3_w6_1_c0 & "0";
   Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In18_c0 <= "" & bh3_w7_0_c0 & bh3_w7_1_c0 & "0";
   Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In19_c0 <= "" & bh3_w8_0_c0 & bh3_w8_1_c0 & "0";
   Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In20_c0 <= "" & bh3_w9_0_c0 & bh3_w9_1_c0 & "0";
   Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In21_c0 <= "" & "0";
   bh3_wm11_11_c3 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_Out0_c3(0);
   bh3_wm10_12_c3 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_Out0_c3(1);
   bh3_wm9_13_c3 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_Out0_c3(2);
   bh3_wm8_13_c3 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_Out0_c3(3);
   bh3_wm7_12_c3 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_Out0_c3(4);
   bh3_wm6_12_c3 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_Out0_c3(5);
   bh3_wm5_13_c3 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_Out0_c3(6);
   bh3_wm4_13_c3 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_Out0_c3(7);
   bh3_wm3_12_c3 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_Out0_c3(8);
   bh3_wm2_12_c3 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_Out0_c3(9);
   bh3_wm1_13_c3 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_Out0_c3(10);
   bh3_w0_13_c3 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_Out0_c3(11);
   bh3_w1_14_c3 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_Out0_c3(12);
   bh3_w2_12_c3 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_Out0_c3(13);
   bh3_w3_4_c3 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_Out0_c3(14);
   bh3_w4_3_c3 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_Out0_c3(15);
   bh3_w5_2_c3 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_Out0_c3(16);
   bh3_w6_2_c3 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_Out0_c3(17);
   bh3_w7_2_c3 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_Out0_c3(18);
   bh3_w8_2_c3 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_Out0_c3(19);
   bh3_w9_2_c3 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_Out0_c3(20);
   Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_uid243: Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161
      port map ( X0 => Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In0_c2,
                 X1 => Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In1_c2,
                 X10 => Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In10_c2,
                 X11 => Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In11_c2,
                 X12 => Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In12_c2,
                 X13 => Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In13_c2,
                 X14 => Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In14_c2,
                 X15 => Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In15_c2,
                 X16 => Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In16_c2,
                 X17 => Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In17_c2,
                 X18 => Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In18_c2,
                 X19 => Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In19_c2,
                 X2 => Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In2_c2,
                 X20 => Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In20_c2,
                 X21 => Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In21_c2,
                 X3 => Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In3_c2,
                 X4 => Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In4_c2,
                 X5 => Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In5_c2,
                 X6 => Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In6_c2,
                 X7 => Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In7_c2,
                 X8 => Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In8_c2,
                 X9 => Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_In9_c2,
                 R => Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_Out0_copy244_c2);
   Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_Out0_c3 <= Row_Adder_FixMultiAdder_S_9_lsbOut_m11_uid46422_Freq950_uid161_bh3_uid243_Out0_copy244_c3; -- output copy to hold a pipeline register if needed

   tmp_bitheapResult_bh3_20_c3 <= bh3_w9_2_c3 & bh3_w8_2_c3 & bh3_w7_2_c3 & bh3_w6_2_c3 & bh3_w5_2_c3 & bh3_w4_3_c3 & bh3_w3_4_c3 & bh3_w2_12_c3 & bh3_w1_14_c3 & bh3_w0_13_c3 & bh3_wm1_13_c3 & bh3_wm2_12_c3 & bh3_wm3_12_c3 & bh3_wm4_13_c3 & bh3_wm5_13_c3 & bh3_wm6_12_c3 & bh3_wm7_12_c3 & bh3_wm8_13_c3 & bh3_wm9_13_c3 & bh3_wm10_12_c3 & bh3_wm11_11_c3;
   bitheapResult_bh3_c3 <= tmp_bitheapResult_bh3_20_c3;
   OutRes_c3 <= bitheapResult_bh3_c3;
   R <= OutRes_c3(20 downto 0);
end architecture;

