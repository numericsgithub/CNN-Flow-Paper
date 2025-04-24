library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core8_rmcm_weightsconstant_memoryROM is
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
end conv7_core8_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv7_core8_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH)) & std_logic_vector(to_signed(w9, XI_WIDTH)) & std_logic_vector(to_signed(w10, XI_WIDTH)) & std_logic_vector(to_signed(w11, XI_WIDTH)) & std_logic_vector(to_signed(w12, XI_WIDTH)) & std_logic_vector(to_signed(w13, XI_WIDTH)) & std_logic_vector(to_signed(w14, XI_WIDTH)) & std_logic_vector(to_signed(w15, XI_WIDTH)) & std_logic_vector(to_signed(w16, XI_WIDTH)) & std_logic_vector(to_signed(w17, XI_WIDTH)) & std_logic_vector(to_signed(w18, XI_WIDTH)) & std_logic_vector(to_signed(w19, XI_WIDTH)) & std_logic_vector(to_signed(w20, XI_WIDTH)) & std_logic_vector(to_signed(w21, XI_WIDTH)) & std_logic_vector(to_signed(w22, XI_WIDTH)) & std_logic_vector(to_signed(w23, XI_WIDTH)) & std_logic_vector(to_signed(w24, XI_WIDTH)) & std_logic_vector(to_signed(w25, XI_WIDTH)) & std_logic_vector(to_signed(w26, XI_WIDTH)) & std_logic_vector(to_signed(w27, XI_WIDTH)) & std_logic_vector(to_signed(w28, XI_WIDTH)) & std_logic_vector(to_signed(w29, XI_WIDTH)) & std_logic_vector(to_signed(w30, XI_WIDTH)) & std_logic_vector(to_signed(w31, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(11,3,-22,0,-3,-57,-13,-4,-2,-17,9,1,0,8,2,23,2,-2,-2,-1,25,-4,-8,-1,-11,2,-3,-1,4,-1,-24,1),
	    1 => w(7,2,6,15,-3,-4,15,-7,3,-4,-2,24,-3,13,-5,-4,-4,2,-10,-11,0,4,16,-2,-27,1,-1,1,2,4,-4,1),
	    2 => w(13,49,15,-11,-9,6,-3,-5,6,0,1,7,-32,7,7,-16,0,10,-7,8,0,4,7,1,-6,5,3,12,-2,9,0,16),
	    3 => w(6,1,-33,11,1,2,4,-3,-10,-6,4,1,1,0,-3,-2,-1,2,31,-4,-2,-5,-3,-1,2,2,-15,11,-2,6,-1,-19),
	    4 => w(3,-3,-7,8,9,2,15,-10,16,-1,14,7,32,29,5,1,3,-30,15,-1,-1,-3,49,18,-13,11,-30,-5,-2,11,-3,-10),
	    5 => w(-5,-8,-9,5,-6,-2,7,6,6,3,8,0,-10,4,-6,7,9,5,-43,-19,9,-4,-7,6,5,2,-7,-1,0,-36,5,8),
	    6 => w(2,-1,-3,9,-1,9,13,10,2,-4,46,-27,-4,-6,-14,-3,-10,2,-23,-1,2,-17,-8,19,11,-11,7,9,15,-4,10,-6),
	    7 => w(1,-4,-4,1,-10,-10,6,34,-7,-3,2,14,18,5,40,3,4,-2,-4,9,6,-7,7,-4,3,1,-8,-5,14,-7,-10,2),
	    8 => w(16,-23,-24,-16,1,-6,19,0,-12,2,-7,-5,7,-57,-6,-29,4,-15,-14,-9,4,-16,3,-1,2,0,11,-2,-9,-1,-12,7),
	    9 => w(-1,4,-5,47,10,-1,4,16,-26,0,-12,0,-16,3,0,-17,1,3,-21,-3,1,-2,-9,-1,-3,-18,-10,-53,-2,-11,16,-7),
	    10 => w(-17,16,19,2,-3,-12,2,18,-2,0,-11,3,-19,-1,32,3,3,41,-3,0,5,13,-15,-13,18,12,-20,6,12,-18,4,5),
	    11 => w(6,5,3,-13,10,3,3,8,5,4,-11,2,-1,3,0,-8,4,6,-13,-37,-6,-2,4,-6,-1,-3,-3,-47,18,-3,-25,22),
	    12 => w(-19,3,-14,0,-5,-4,-18,5,3,-21,12,-15,-5,19,-3,2,-6,-9,9,7,-17,-4,10,-5,-3,-1,-1,1,-4,0,3,-2),
	    13 => w(-8,7,5,-14,4,-1,-2,2,4,5,10,-9,-9,-10,-5,-6,-13,-3,5,-3,-3,-2,6,-7,16,-5,0,11,-3,-8,-8,4),
	    14 => w(-11,-44,-9,-4,-14,0,-6,-6,-7,-3,3,-4,-7,6,-17,10,8,-48,-2,-1,1,-6,-1,1,-15,6,16,-4,-8,20,-2,-4),
	    15 => w(-10,1,6,-7,-1,0,4,5,-3,-19,-3,9,3,2,2,-7,-12,1,7,-20,3,-4,2,-1,0,2,1,6,-1,-4,5,-9)
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