library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core16_rmcm_weightsconstant_memoryROM is
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
end conv7_core16_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv7_core16_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH)) & std_logic_vector(to_signed(w9, XI_WIDTH)) & std_logic_vector(to_signed(w10, XI_WIDTH)) & std_logic_vector(to_signed(w11, XI_WIDTH)) & std_logic_vector(to_signed(w12, XI_WIDTH)) & std_logic_vector(to_signed(w13, XI_WIDTH)) & std_logic_vector(to_signed(w14, XI_WIDTH)) & std_logic_vector(to_signed(w15, XI_WIDTH)) & std_logic_vector(to_signed(w16, XI_WIDTH)) & std_logic_vector(to_signed(w17, XI_WIDTH)) & std_logic_vector(to_signed(w18, XI_WIDTH)) & std_logic_vector(to_signed(w19, XI_WIDTH)) & std_logic_vector(to_signed(w20, XI_WIDTH)) & std_logic_vector(to_signed(w21, XI_WIDTH)) & std_logic_vector(to_signed(w22, XI_WIDTH)) & std_logic_vector(to_signed(w23, XI_WIDTH)) & std_logic_vector(to_signed(w24, XI_WIDTH)) & std_logic_vector(to_signed(w25, XI_WIDTH)) & std_logic_vector(to_signed(w26, XI_WIDTH)) & std_logic_vector(to_signed(w27, XI_WIDTH)) & std_logic_vector(to_signed(w28, XI_WIDTH)) & std_logic_vector(to_signed(w29, XI_WIDTH)) & std_logic_vector(to_signed(w30, XI_WIDTH)) & std_logic_vector(to_signed(w31, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(-6,-5,-2,-2,13,-3,12,20,0,-3,-72,-3,11,23,2,1,26,-12,-32,4,-6,-21,17,4,-2,-4,7,-3,2,0,-25,0),
	    1 => w(11,-12,-11,1,20,4,-13,5,-19,-5,0,-3,-23,0,9,2,13,0,3,4,26,8,-19,-23,-2,-29,-9,-28,32,7,7,27),
	    2 => w(-22,-3,6,29,0,-15,-2,43,10,-2,-1,6,-9,1,3,-1,-4,-2,-1,-1,8,-23,-1,9,-2,12,-10,14,-4,-3,-1,13),
	    3 => w(1,-3,4,10,-17,-1,0,-15,-6,9,-6,-14,-1,0,0,9,-3,8,-6,-6,6,-17,-5,-3,-2,1,-1,4,21,4,2,-22),
	    4 => w(103,-24,4,7,8,-16,-25,-11,-2,-30,29,-2,-1,2,-1,-31,-8,30,-20,26,-7,7,8,9,-6,5,3,-6,12,15,17,3),
	    5 => w(7,-4,8,-2,11,-4,20,10,11,-4,5,6,14,10,-50,11,11,7,2,-1,-1,-6,-8,15,24,29,-10,-12,-1,13,3,-24),
	    6 => w(15,-17,2,-40,-10,17,7,0,-7,1,3,10,15,3,23,10,1,-12,-10,9,-3,1,7,1,5,4,-28,4,6,37,2,-32),
	    7 => w(9,0,11,-35,-19,11,-28,-10,8,11,-7,-2,0,-4,6,3,3,2,-56,-12,3,0,0,-3,-5,5,33,5,6,6,4,48),
	    8 => w(4,12,60,-7,-4,-15,-7,-9,3,-4,-1,3,-8,1,6,-3,-9,8,2,-27,0,-2,8,0,2,2,-12,12,-6,4,22,-1),
	    9 => w(0,2,1,5,1,-2,-4,-7,-4,-2,7,6,3,-4,5,-2,-4,3,-2,-1,4,2,-56,-10,-10,2,-12,-1,-2,-2,3,7),
	    10 => w(0,-10,-4,1,12,-1,3,-2,7,3,7,-5,25,-1,-4,9,-3,6,-1,4,4,-2,6,7,5,0,-13,-17,1,-5,2,-6),
	    11 => w(2,-1,-3,10,-1,-6,2,1,8,-15,-1,1,2,3,4,-1,12,-1,-59,-51,-2,7,-2,2,-5,0,1,3,-1,1,-40,3),
	    12 => w(-4,7,-4,10,0,-7,7,26,-2,6,-11,8,-2,-14,0,0,10,5,11,4,-2,-3,7,4,14,8,-14,-1,-7,68,3,8),
	    13 => w(3,17,-8,6,-15,3,4,11,44,-2,3,1,-4,3,16,-9,10,-1,9,-12,3,3,9,81,4,-18,7,-8,15,0,23,-45),
	    14 => w(-14,18,-8,10,-43,13,-1,29,7,-5,-2,-8,6,7,2,-2,-4,2,2,2,7,1,13,4,7,1,0,-2,1,25,-4,8),
	    15 => w(2,-1,-1,7,10,3,-16,0,-26,-7,0,-14,-3,-4,-5,10,-18,2,1,4,-2,3,-1,3,7,2,1,-29,1,0,-20,-13)
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