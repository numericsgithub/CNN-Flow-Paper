library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core2_rmcm_weightsconstant_memoryROM is
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
end conv7_core2_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv7_core2_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH)) & std_logic_vector(to_signed(w9, XI_WIDTH)) & std_logic_vector(to_signed(w10, XI_WIDTH)) & std_logic_vector(to_signed(w11, XI_WIDTH)) & std_logic_vector(to_signed(w12, XI_WIDTH)) & std_logic_vector(to_signed(w13, XI_WIDTH)) & std_logic_vector(to_signed(w14, XI_WIDTH)) & std_logic_vector(to_signed(w15, XI_WIDTH)) & std_logic_vector(to_signed(w16, XI_WIDTH)) & std_logic_vector(to_signed(w17, XI_WIDTH)) & std_logic_vector(to_signed(w18, XI_WIDTH)) & std_logic_vector(to_signed(w19, XI_WIDTH)) & std_logic_vector(to_signed(w20, XI_WIDTH)) & std_logic_vector(to_signed(w21, XI_WIDTH)) & std_logic_vector(to_signed(w22, XI_WIDTH)) & std_logic_vector(to_signed(w23, XI_WIDTH)) & std_logic_vector(to_signed(w24, XI_WIDTH)) & std_logic_vector(to_signed(w25, XI_WIDTH)) & std_logic_vector(to_signed(w26, XI_WIDTH)) & std_logic_vector(to_signed(w27, XI_WIDTH)) & std_logic_vector(to_signed(w28, XI_WIDTH)) & std_logic_vector(to_signed(w29, XI_WIDTH)) & std_logic_vector(to_signed(w30, XI_WIDTH)) & std_logic_vector(to_signed(w31, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(17,-16,-6,22,2,-9,9,7,29,-2,21,5,-18,7,-33,-2,8,-3,-5,8,-3,2,28,18,22,20,6,5,6,-9,-7,12),
	    1 => w(4,3,0,7,4,-4,-22,16,22,-6,0,0,1,0,-1,12,17,-1,-29,17,15,28,-10,-18,2,-6,1,2,-1,16,16,-19),
	    2 => w(-7,1,25,-33,6,15,1,-6,-16,-1,2,9,2,0,4,3,-6,0,-3,14,0,1,-2,12,15,-4,7,11,-4,11,7,0),
	    3 => w(6,26,5,-7,7,2,-7,3,-3,46,4,0,9,0,4,-4,10,-4,8,7,24,5,-1,-2,25,0,-10,14,1,-7,24,-31),
	    4 => w(-13,17,5,6,-61,7,0,30,-5,-3,28,-6,-24,-29,7,3,-40,10,-1,-7,2,20,-29,-1,22,5,-9,-4,-59,14,9,6),
	    5 => w(1,10,1,6,2,0,-9,2,31,1,-11,-1,34,7,12,0,-10,1,13,-21,-25,0,-10,2,-3,-23,-3,-20,35,10,1,4),
	    6 => w(-21,8,-3,-43,9,-41,0,9,1,2,-2,-11,-4,6,-7,0,2,3,6,2,2,13,-5,-4,-2,8,2,14,1,-6,5,27),
	    7 => w(1,-6,1,19,50,-6,21,39,4,1,-1,-2,3,-1,2,49,3,1,16,-9,-1,-6,-6,0,-9,2,-13,5,-1,0,10,-18),
	    8 => w(12,11,12,-5,1,0,-17,5,3,3,6,-14,12,10,4,-12,2,30,12,-9,0,3,5,-4,-7,7,15,-16,23,11,-3,8),
	    9 => w(-5,7,5,27,5,-1,-4,-3,-36,2,-13,-1,-10,13,-2,6,-2,4,-18,14,-4,4,6,13,7,-16,-2,10,-3,9,-2,17),
	    10 => w(8,4,-7,-24,-21,3,-3,-5,12,4,9,-6,13,1,-9,7,2,-18,11,0,5,-5,4,12,7,6,2,0,-10,8,7,-36),
	    11 => w(-2,0,1,-3,-1,-7,3,0,8,-6,1,7,6,-2,0,-9,19,0,-22,10,4,22,-3,4,-3,-2,-1,0,1,-2,-5,11),
	    12 => w(-2,32,80,-3,0,-19,10,-3,2,-4,-2,0,1,-7,6,7,10,-2,3,11,10,-9,0,-2,-2,3,9,-6,1,0,58,-4),
	    13 => w(-3,0,3,2,7,-4,1,5,1,3,5,8,-7,-2,6,5,2,-1,1,-1,-2,-5,-40,2,-8,-3,-43,-4,-2,-1,-3,0),
	    14 => w(-2,-38,-9,11,-10,-3,1,7,6,-2,-2,4,29,0,-7,-5,1,6,-8,3,1,13,-4,-4,0,8,-23,1,7,1,2,7),
	    15 => w(3,6,-2,11,-1,-2,-3,5,1,0,1,0,2,-1,1,-2,-2,3,-52,-17,2,-2,0,2,1,0,1,0,3,-3,19,1)
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