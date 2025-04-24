library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core14_rmcm_weightsconstant_memoryROM is
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
end conv7_core14_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv7_core14_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH)) & std_logic_vector(to_signed(w9, XI_WIDTH)) & std_logic_vector(to_signed(w10, XI_WIDTH)) & std_logic_vector(to_signed(w11, XI_WIDTH)) & std_logic_vector(to_signed(w12, XI_WIDTH)) & std_logic_vector(to_signed(w13, XI_WIDTH)) & std_logic_vector(to_signed(w14, XI_WIDTH)) & std_logic_vector(to_signed(w15, XI_WIDTH)) & std_logic_vector(to_signed(w16, XI_WIDTH)) & std_logic_vector(to_signed(w17, XI_WIDTH)) & std_logic_vector(to_signed(w18, XI_WIDTH)) & std_logic_vector(to_signed(w19, XI_WIDTH)) & std_logic_vector(to_signed(w20, XI_WIDTH)) & std_logic_vector(to_signed(w21, XI_WIDTH)) & std_logic_vector(to_signed(w22, XI_WIDTH)) & std_logic_vector(to_signed(w23, XI_WIDTH)) & std_logic_vector(to_signed(w24, XI_WIDTH)) & std_logic_vector(to_signed(w25, XI_WIDTH)) & std_logic_vector(to_signed(w26, XI_WIDTH)) & std_logic_vector(to_signed(w27, XI_WIDTH)) & std_logic_vector(to_signed(w28, XI_WIDTH)) & std_logic_vector(to_signed(w29, XI_WIDTH)) & std_logic_vector(to_signed(w30, XI_WIDTH)) & std_logic_vector(to_signed(w31, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(2,7,-2,-27,-22,6,-2,-25,-1,-5,9,-1,1,-18,0,-5,8,-4,-40,-4,2,-3,10,1,-24,3,7,1,9,-15,6,-8),
	    1 => w(17,24,-37,1,-39,10,12,-11,3,-7,-2,1,27,2,-32,-11,3,-7,-11,-5,-9,-4,5,-15,-6,17,-2,-21,3,23,12,-40),
	    2 => w(22,-5,6,-8,-5,31,1,-40,16,-5,11,2,-1,3,9,4,-23,-2,7,-7,3,2,-13,5,4,-31,-6,4,3,-1,2,-4),
	    3 => w(14,-8,1,-16,-8,18,-18,-6,-12,32,31,-17,3,-1,1,-16,9,8,-12,-5,-7,-26,-2,44,-2,3,4,2,-10,14,2,21),
	    4 => w(-12,-5,-35,-5,-4,-12,17,9,-13,13,4,49,1,-22,-6,0,-4,-25,-29,-18,-5,2,-4,2,-5,-5,-5,-2,-2,-9,-8,-5),
	    5 => w(20,-15,-9,-27,0,-3,6,4,3,-7,-8,1,8,15,17,-1,-2,-7,8,-5,8,-6,3,52,9,15,-22,4,-6,0,11,-25),
	    6 => w(-6,12,-16,-17,120,13,2,-21,6,-3,10,0,-22,0,5,-4,2,-4,-1,-2,9,0,-2,10,-8,1,-9,1,7,18,-2,-6),
	    7 => w(12,-1,1,-2,-5,-7,-20,2,-22,7,-1,-19,1,-2,-9,-6,-39,7,-12,72,-1,9,-8,2,0,-2,-5,-1,-17,8,-67,-34),
	    8 => w(-8,-7,2,-8,-32,-9,-23,33,5,-2,17,3,1,-13,16,5,-9,8,29,0,-2,3,-23,8,-73,60,0,-6,-30,-1,-4,-12),
	    9 => w(-6,-7,-1,3,15,-4,-18,-9,11,-1,1,0,-22,-12,15,19,-48,-4,-17,46,-29,10,-7,-15,1,-3,-5,15,2,-15,18,12),
	    10 => w(-3,2,19,-29,18,15,1,1,12,4,35,1,-2,-4,4,4,10,1,4,0,0,-26,19,10,14,10,4,30,-8,-2,-1,-2),
	    11 => w(-6,-61,6,-4,21,6,0,-8,-2,-4,-1,9,-4,8,8,-5,16,9,-7,-11,3,9,-14,0,3,1,-2,-4,-1,1,-6,2),
	    12 => w(-32,17,-9,-1,-3,-10,-8,4,8,3,-1,-14,2,-3,-3,-18,3,-22,11,-1,-37,-1,2,6,-1,-1,-4,-7,-3,-5,-5,-1),
	    13 => w(-10,0,-5,34,2,-1,0,7,-8,0,24,-13,-3,3,1,-4,-3,-4,-11,1,-2,6,5,-3,10,-4,-11,6,1,-14,18,2),
	    14 => w(6,-67,-5,-3,-8,5,-2,2,-12,-5,6,9,-33,16,-7,8,-1,-36,2,4,4,4,-6,0,6,0,18,4,-9,-23,0,9),
	    15 => w(-4,1,11,24,5,-8,4,7,-5,-5,-1,1,3,-1,-3,-2,-10,-1,-5,-36,4,3,0,5,5,-3,6,-6,4,5,-10,4)
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