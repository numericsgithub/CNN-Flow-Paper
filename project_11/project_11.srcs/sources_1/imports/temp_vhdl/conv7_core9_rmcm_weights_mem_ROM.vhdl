library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core9_rmcm_weightsconstant_memoryROM is
    generic
    (
        XI_WIDTH        	          : natural := 8;
        ARRAY_SIZE                    : natural := 16;
        WORDS_PER_ADDR                : natural := 32
    );
    Port (
        clk        : in std_logic;
        data_index : in unsigned(bits(ARRAY_SIZE-1)-1 downto 0);
        dout       : out std_logic_vector((XI_WIDTH * WORDS_PER_ADDR-1) downto 0)
    );
end conv7_core9_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv7_core9_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH)) & std_logic_vector(to_signed(w9, XI_WIDTH)) & std_logic_vector(to_signed(w10, XI_WIDTH)) & std_logic_vector(to_signed(w11, XI_WIDTH)) & std_logic_vector(to_signed(w12, XI_WIDTH)) & std_logic_vector(to_signed(w13, XI_WIDTH)) & std_logic_vector(to_signed(w14, XI_WIDTH)) & std_logic_vector(to_signed(w15, XI_WIDTH)) & std_logic_vector(to_signed(w16, XI_WIDTH)) & std_logic_vector(to_signed(w17, XI_WIDTH)) & std_logic_vector(to_signed(w18, XI_WIDTH)) & std_logic_vector(to_signed(w19, XI_WIDTH)) & std_logic_vector(to_signed(w20, XI_WIDTH)) & std_logic_vector(to_signed(w21, XI_WIDTH)) & std_logic_vector(to_signed(w22, XI_WIDTH)) & std_logic_vector(to_signed(w23, XI_WIDTH)) & std_logic_vector(to_signed(w24, XI_WIDTH)) & std_logic_vector(to_signed(w25, XI_WIDTH)) & std_logic_vector(to_signed(w26, XI_WIDTH)) & std_logic_vector(to_signed(w27, XI_WIDTH)) & std_logic_vector(to_signed(w28, XI_WIDTH)) & std_logic_vector(to_signed(w29, XI_WIDTH)) & std_logic_vector(to_signed(w30, XI_WIDTH)) & std_logic_vector(to_signed(w31, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(12,14,-2,1,-2,-3,-19,-11,6,-12,4,-9,3,13,-5,4,2,18,21,5,-3,-2,6,-2,18,-1,-3,8,2,13,14,13),
	    1 => w(-15,14,6,-2,-5,0,-3,4,14,5,7,-4,-12,-16,-13,4,8,1,1,-19,-4,4,7,-52,-5,25,-6,1,-1,-1,-7,17),
	    2 => w(-41,20,18,31,-39,-9,0,13,-2,3,-9,-5,-1,-3,1,12,8,21,-11,4,-17,-5,1,-9,6,9,-6,-7,-4,-3,-1,-29),
	    3 => w(-9,12,14,21,-2,-2,11,4,19,-11,-1,14,-3,6,6,15,39,-7,18,5,2,-2,6,2,-5,1,-38,-8,0,-3,-42,16),
	    4 => w(0,-1,-2,4,39,0,-3,-11,-3,2,-6,-2,8,6,-2,0,3,1,0,2,1,3,8,10,5,0,1,-2,48,8,6,6),
	    5 => w(0,-36,5,1,-11,-1,5,2,-7,-1,8,1,-18,2,-5,37,8,-7,0,-6,-21,1,12,-5,-1,7,2,7,-14,10,-5,5),
	    6 => w(4,0,7,6,4,18,1,-17,4,1,6,-5,0,4,1,4,4,-1,3,2,-2,2,-12,1,-2,2,-7,-17,2,-3,1,-6),
	    7 => w(0,-4,0,-11,-4,-2,-8,-12,-2,-3,-3,-2,2,-1,0,-115,2,-3,-4,12,-14,6,3,4,-5,2,5,3,0,0,-3,0),
	    8 => w(-4,13,17,-3,-12,5,-42,5,-6,-1,-17,-2,22,-8,13,-3,-8,4,-11,-3,2,-3,-3,28,-2,2,1,-13,8,-1,-8,-14),
	    9 => w(15,14,-12,7,1,13,10,-6,1,-8,7,-1,4,18,17,-5,2,1,-30,19,-49,-1,-1,-6,3,-3,2,8,-3,-5,16,-4),
	    10 => w(5,-2,0,24,16,-9,-8,-5,-3,1,-6,10,2,19,-6,-3,-20,8,19,6,0,4,3,16,-17,-5,2,10,-12,4,-4,-3),
	    11 => w(5,-17,-7,6,5,36,13,-8,-23,-1,-7,-13,-9,-8,-8,1,-14,-3,8,8,-1,3,2,-9,20,-5,2,-2,-17,24,6,-7),
	    12 => w(9,3,-2,-2,-8,2,16,-22,2,-1,11,-7,68,2,-9,4,8,-22,-21,16,1,14,-40,9,8,-7,0,22,1,-7,-5,6),
	    13 => w(-5,5,11,6,-14,-3,-3,-13,-23,4,11,-1,-12,-6,-7,-21,-3,-3,-11,-8,-40,6,-10,25,-3,-3,4,11,1,7,8,-18),
	    14 => w(9,-2,1,7,11,-10,1,0,13,16,-37,-49,2,-8,27,0,7,2,-8,-1,-1,72,-50,-26,-1,-19,-4,-15,0,18,4,3),
	    15 => w(1,14,-1,2,-12,-22,-16,-1,34,7,2,12,4,7,18,-7,0,-3,3,-7,-12,-22,12,-7,-37,-7,-1,-3,2,-4,13,-10)
        );
    attribute ram_style : string;
        attribute ram_style of data_ROM : constant is "block";
begin

Read_rom_process: process(clk)
    begin
        if rising_edge(clk) then
            dout <= data_ROM(to_integer(data_index));
        end if;
    end process;


end Behavioral;