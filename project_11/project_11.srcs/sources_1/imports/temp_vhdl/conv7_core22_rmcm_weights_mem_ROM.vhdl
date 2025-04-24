library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core22_rmcm_weightsconstant_memoryROM is
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
end conv7_core22_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv7_core22_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH)) & std_logic_vector(to_signed(w9, XI_WIDTH)) & std_logic_vector(to_signed(w10, XI_WIDTH)) & std_logic_vector(to_signed(w11, XI_WIDTH)) & std_logic_vector(to_signed(w12, XI_WIDTH)) & std_logic_vector(to_signed(w13, XI_WIDTH)) & std_logic_vector(to_signed(w14, XI_WIDTH)) & std_logic_vector(to_signed(w15, XI_WIDTH)) & std_logic_vector(to_signed(w16, XI_WIDTH)) & std_logic_vector(to_signed(w17, XI_WIDTH)) & std_logic_vector(to_signed(w18, XI_WIDTH)) & std_logic_vector(to_signed(w19, XI_WIDTH)) & std_logic_vector(to_signed(w20, XI_WIDTH)) & std_logic_vector(to_signed(w21, XI_WIDTH)) & std_logic_vector(to_signed(w22, XI_WIDTH)) & std_logic_vector(to_signed(w23, XI_WIDTH)) & std_logic_vector(to_signed(w24, XI_WIDTH)) & std_logic_vector(to_signed(w25, XI_WIDTH)) & std_logic_vector(to_signed(w26, XI_WIDTH)) & std_logic_vector(to_signed(w27, XI_WIDTH)) & std_logic_vector(to_signed(w28, XI_WIDTH)) & std_logic_vector(to_signed(w29, XI_WIDTH)) & std_logic_vector(to_signed(w30, XI_WIDTH)) & std_logic_vector(to_signed(w31, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(1,1,-8,-11,-7,2,17,-11,37,-2,-1,3,76,-13,-13,-1,2,2,0,0,3,0,2,-24,7,-13,4,12,-4,11,6,-21),
	    1 => w(0,-12,3,1,-16,2,4,-1,-6,1,3,0,-6,-3,7,-16,-4,2,-5,1,30,-33,3,-22,-2,2,4,-7,-1,7,9,5),
	    2 => w(2,-11,8,-42,-7,-17,2,2,16,20,-31,11,0,-5,0,-6,-1,3,-3,2,2,40,-21,-43,2,-9,4,-8,-1,-5,6,-6),
	    3 => w(0,-8,-1,-1,-18,-13,-16,-27,38,13,1,9,6,3,14,2,-29,-12,-1,2,-4,-17,11,-2,22,-4,8,1,10,-4,-5,11),
	    4 => w(-3,16,16,6,0,10,-5,7,-6,-14,0,-28,11,-20,-11,-12,-1,19,-2,13,-1,-1,7,1,-7,-6,9,0,-1,-3,13,4),
	    5 => w(2,-16,0,7,-6,7,4,-22,14,-4,1,-5,12,2,8,2,9,1,-8,-9,7,2,2,23,-4,1,-14,10,-1,-3,-5,4),
	    6 => w(3,2,1,1,14,8,-6,-14,8,-1,7,15,6,4,5,1,-15,2,7,4,-15,12,-1,10,-3,-2,2,-8,-6,-8,-11,-19),
	    7 => w(-7,2,-3,1,-1,18,-9,6,-12,-6,1,-5,-10,-2,-17,-10,8,2,7,-48,0,-3,14,0,4,6,-42,9,-4,8,34,-10),
	    8 => w(-1,-1,4,10,5,0,-9,4,-8,5,-9,1,-20,-13,17,0,-10,-5,0,1,1,-5,-6,9,-1,-13,-2,1,-10,5,6,3),
	    9 => w(4,5,-25,2,6,4,-11,29,-3,-4,-1,2,2,-1,-17,-1,2,0,-15,-3,6,-7,5,-2,1,3,1,-11,0,9,2,0),
	    10 => w(-5,8,-8,8,6,-1,0,7,-57,59,-2,-2,4,-1,0,-1,-17,3,1,-17,2,-4,7,14,3,-14,0,9,-4,-6,-3,-6),
	    11 => w(7,-3,2,-2,-2,17,-12,-2,15,5,29,-3,-5,0,9,-6,-8,29,0,6,-11,-10,26,-4,5,6,1,-4,1,9,-3,3),
	    12 => w(1,13,-1,15,2,0,15,5,7,-3,-18,7,7,-27,1,7,3,-6,0,1,-1,8,-12,12,-4,11,14,2,-4,5,-10,5),
	    13 => w(4,29,-11,2,22,17,4,21,-3,-4,0,4,7,4,-9,3,26,-2,1,8,28,-7,18,-9,0,3,-6,-9,10,-2,21,-9),
	    14 => w(5,-20,-3,-15,5,18,-3,2,-12,12,-19,9,-6,4,7,-4,-31,9,4,-22,0,17,-4,-6,5,-21,5,18,-17,7,-3,7),
	    15 => w(0,2,-9,1,0,33,4,-7,-11,11,-5,-12,-7,-2,-3,8,3,1,12,-5,0,-4,6,1,11,9,-2,-14,-16,12,14,18)
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