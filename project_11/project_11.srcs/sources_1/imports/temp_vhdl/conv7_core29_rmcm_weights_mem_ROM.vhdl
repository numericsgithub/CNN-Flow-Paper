library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core29_rmcm_weightsconstant_memoryROM is
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
end conv7_core29_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv7_core29_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH)) & std_logic_vector(to_signed(w9, XI_WIDTH)) & std_logic_vector(to_signed(w10, XI_WIDTH)) & std_logic_vector(to_signed(w11, XI_WIDTH)) & std_logic_vector(to_signed(w12, XI_WIDTH)) & std_logic_vector(to_signed(w13, XI_WIDTH)) & std_logic_vector(to_signed(w14, XI_WIDTH)) & std_logic_vector(to_signed(w15, XI_WIDTH)) & std_logic_vector(to_signed(w16, XI_WIDTH)) & std_logic_vector(to_signed(w17, XI_WIDTH)) & std_logic_vector(to_signed(w18, XI_WIDTH)) & std_logic_vector(to_signed(w19, XI_WIDTH)) & std_logic_vector(to_signed(w20, XI_WIDTH)) & std_logic_vector(to_signed(w21, XI_WIDTH)) & std_logic_vector(to_signed(w22, XI_WIDTH)) & std_logic_vector(to_signed(w23, XI_WIDTH)) & std_logic_vector(to_signed(w24, XI_WIDTH)) & std_logic_vector(to_signed(w25, XI_WIDTH)) & std_logic_vector(to_signed(w26, XI_WIDTH)) & std_logic_vector(to_signed(w27, XI_WIDTH)) & std_logic_vector(to_signed(w28, XI_WIDTH)) & std_logic_vector(to_signed(w29, XI_WIDTH)) & std_logic_vector(to_signed(w30, XI_WIDTH)) & std_logic_vector(to_signed(w31, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(3,10,6,-15,-26,4,27,-27,-6,-3,10,-2,-20,-15,-5,-4,4,-17,-3,-23,3,-26,0,-28,-20,-4,-9,13,-38,-6,-14,3),
	    1 => w(-5,2,10,0,-15,-2,4,-3,-17,2,-21,1,-7,-4,-18,-24,-14,-3,-11,-6,25,4,-30,22,-1,5,0,-8,2,-6,-1,-2),
	    2 => w(2,-15,0,13,-1,-7,8,-8,6,19,9,-27,-4,-6,17,-1,3,9,-5,-2,0,56,-32,-31,0,3,-1,-3,22,0,3,9),
	    3 => w(0,11,0,21,18,-16,-2,17,20,5,2,7,5,6,14,-3,6,-4,4,-7,0,-21,11,-4,24,-2,-3,1,2,-6,13,-52),
	    4 => w(-12,5,2,-4,16,11,24,-18,-8,-9,13,19,-9,4,37,1,1,58,8,2,1,-8,13,19,-10,-6,-2,1,5,-8,8,-43),
	    5 => w(4,13,16,0,8,-2,-20,-18,5,-1,3,-3,-27,6,3,-8,-9,-9,1,-10,-19,-30,-6,-62,-5,2,-7,18,0,-7,0,-13),
	    6 => w(1,-24,6,-35,-36,-7,2,5,8,5,-9,43,-7,5,-55,-11,15,4,-5,3,6,11,22,-3,-26,-6,-4,1,-12,5,-1,9),
	    7 => w(4,8,-3,35,2,-20,10,4,35,2,-2,8,-1,-1,6,-11,-69,9,-1,-32,1,5,-5,-2,-1,-6,13,13,8,2,-22,-61),
	    8 => w(-4,-10,-6,7,-6,-3,31,-20,-4,-1,4,2,1,-34,-2,-3,7,-10,-5,-2,-1,4,-32,-9,-1,1,7,-2,-3,-6,-3,-1),
	    9 => w(-7,10,5,-1,-5,7,-6,5,-30,1,-10,0,-10,3,-6,3,-13,1,28,18,4,9,-8,9,-2,8,-5,-15,-1,19,3,-3),
	    10 => w(4,3,3,1,-3,-17,5,-6,-1,9,-42,17,-8,-2,12,2,4,-3,1,1,-3,27,1,-9,6,-3,-4,-16,-1,-16,4,3),
	    11 => w(5,9,3,4,19,12,-30,-9,15,13,4,2,3,4,24,7,-21,-4,-8,-8,5,-7,4,-2,2,3,2,-6,6,3,2,-7),
	    12 => w(-9,2,-10,-16,-25,2,52,-4,-23,-10,28,23,-15,-14,29,-18,-19,-128,-11,-6,-1,-1,-14,1,17,-2,-6,-3,-6,-10,4,24),
	    13 => w(7,-2,13,-12,-1,-4,-8,-4,-42,-4,25,3,13,1,7,-17,10,-2,0,-4,11,31,0,7,0,2,4,48,2,5,2,-29),
	    14 => w(2,-55,4,-3,-4,-25,1,-1,15,-3,-3,-45,-7,1,38,-11,11,0,-13,-2,6,-32,-29,7,-18,-2,0,-14,9,-11,4,-10),
	    15 => w(3,-17,-2,0,-26,-6,7,9,25,-6,-10,2,-10,-7,-2,5,36,10,-26,-49,2,26,-10,-4,21,-10,-9,-17,11,2,21,-27)
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