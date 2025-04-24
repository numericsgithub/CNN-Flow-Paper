library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core31_rmcm_weightsconstant_memoryROM is
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
end conv7_core31_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv7_core31_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH)) & std_logic_vector(to_signed(w9, XI_WIDTH)) & std_logic_vector(to_signed(w10, XI_WIDTH)) & std_logic_vector(to_signed(w11, XI_WIDTH)) & std_logic_vector(to_signed(w12, XI_WIDTH)) & std_logic_vector(to_signed(w13, XI_WIDTH)) & std_logic_vector(to_signed(w14, XI_WIDTH)) & std_logic_vector(to_signed(w15, XI_WIDTH)) & std_logic_vector(to_signed(w16, XI_WIDTH)) & std_logic_vector(to_signed(w17, XI_WIDTH)) & std_logic_vector(to_signed(w18, XI_WIDTH)) & std_logic_vector(to_signed(w19, XI_WIDTH)) & std_logic_vector(to_signed(w20, XI_WIDTH)) & std_logic_vector(to_signed(w21, XI_WIDTH)) & std_logic_vector(to_signed(w22, XI_WIDTH)) & std_logic_vector(to_signed(w23, XI_WIDTH)) & std_logic_vector(to_signed(w24, XI_WIDTH)) & std_logic_vector(to_signed(w25, XI_WIDTH)) & std_logic_vector(to_signed(w26, XI_WIDTH)) & std_logic_vector(to_signed(w27, XI_WIDTH)) & std_logic_vector(to_signed(w28, XI_WIDTH)) & std_logic_vector(to_signed(w29, XI_WIDTH)) & std_logic_vector(to_signed(w30, XI_WIDTH)) & std_logic_vector(to_signed(w31, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(6,-9,-15,-9,-5,0,6,-9,2,0,-3,-1,-7,-5,1,7,1,-6,10,24,-2,4,-1,0,8,-4,5,11,-8,-1,-72,3),
	    1 => w(2,0,5,-10,1,1,3,1,22,0,-11,2,4,-4,-7,6,8,1,-1,-1,-6,3,24,3,-1,-2,58,7,-4,-2,7,0),
	    2 => w(4,-9,2,-7,-19,-2,2,-1,-2,-2,-2,9,-11,0,3,1,-2,3,-5,2,1,9,-2,-1,-4,1,-27,-4,6,5,0,39),
	    3 => w(3,4,-4,-12,0,1,1,4,-4,-1,-1,1,-2,2,-2,-7,-2,0,14,23,-4,-3,4,-2,0,0,-7,1,-6,1,42,-5),
	    4 => w(7,-16,6,3,-11,-7,36,-15,1,-3,1,2,-3,-16,3,17,17,19,-3,40,-2,14,-10,-6,16,-11,-11,26,-16,-4,3,4),
	    5 => w(-1,1,3,-10,7,0,5,2,-14,0,-22,0,17,-7,-16,9,16,0,43,-18,2,-1,1,-13,-4,6,19,7,6,18,-14,6),
	    6 => w(3,23,-19,40,-1,-8,-1,2,5,0,7,-10,4,-13,2,5,0,0,5,0,5,10,4,4,2,-4,-5,-9,-5,-8,-3,-4),
	    7 => w(3,7,5,9,-17,-2,-17,4,-2,6,-2,-7,2,11,-4,1,3,1,21,56,0,3,3,7,2,1,-12,-1,-11,5,-33,4),
	    8 => w(-3,1,2,-1,3,-1,6,-3,59,-3,-2,2,-4,1,-4,3,9,-6,-5,0,-1,8,-3,6,15,1,-2,-1,5,-13,4,10),
	    9 => w(-3,6,8,1,3,1,8,3,1,3,2,0,0,-1,-5,-3,-4,-7,0,10,-4,-4,4,-2,0,-2,3,-1,0,-8,1,-12),
	    10 => w(1,-4,0,-8,-6,-5,2,-2,6,-9,1,-2,1,-3,2,11,0,0,-4,-10,-3,1,4,-13,1,7,3,3,7,3,3,-3),
	    11 => w(2,15,2,0,8,1,4,-3,-18,12,-12,4,4,1,-3,6,6,31,2,1,127,-4,-9,-7,-20,9,-2,-4,4,-6,5,8),
	    12 => w(2,2,-3,10,14,1,-7,-20,5,0,-28,1,-4,11,5,-1,41,-5,3,-13,1,-36,0,1,7,1,3,8,5,3,-11,3),
	    13 => w(2,19,3,1,82,-1,1,0,14,-1,-21,1,-47,1,2,-23,13,2,-4,-2,-2,-5,-8,10,0,0,2,5,-8,-7,-5,-1),
	    14 => w(3,3,-4,1,3,24,1,9,-1,-6,-4,4,-2,-3,0,-3,4,4,-3,-2,2,1,1,2,1,11,4,-15,7,1,-1,3),
	    15 => w(2,-3,0,11,9,8,10,7,2,6,-14,-2,-2,1,-2,-12,0,4,4,-4,-11,-2,12,-7,15,-4,-2,3,-2,1,3,-7)
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