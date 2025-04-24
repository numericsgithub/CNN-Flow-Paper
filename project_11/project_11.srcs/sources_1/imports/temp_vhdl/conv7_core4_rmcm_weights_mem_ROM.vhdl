library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core4_rmcm_weightsconstant_memoryROM is
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
end conv7_core4_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv7_core4_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH)) & std_logic_vector(to_signed(w9, XI_WIDTH)) & std_logic_vector(to_signed(w10, XI_WIDTH)) & std_logic_vector(to_signed(w11, XI_WIDTH)) & std_logic_vector(to_signed(w12, XI_WIDTH)) & std_logic_vector(to_signed(w13, XI_WIDTH)) & std_logic_vector(to_signed(w14, XI_WIDTH)) & std_logic_vector(to_signed(w15, XI_WIDTH)) & std_logic_vector(to_signed(w16, XI_WIDTH)) & std_logic_vector(to_signed(w17, XI_WIDTH)) & std_logic_vector(to_signed(w18, XI_WIDTH)) & std_logic_vector(to_signed(w19, XI_WIDTH)) & std_logic_vector(to_signed(w20, XI_WIDTH)) & std_logic_vector(to_signed(w21, XI_WIDTH)) & std_logic_vector(to_signed(w22, XI_WIDTH)) & std_logic_vector(to_signed(w23, XI_WIDTH)) & std_logic_vector(to_signed(w24, XI_WIDTH)) & std_logic_vector(to_signed(w25, XI_WIDTH)) & std_logic_vector(to_signed(w26, XI_WIDTH)) & std_logic_vector(to_signed(w27, XI_WIDTH)) & std_logic_vector(to_signed(w28, XI_WIDTH)) & std_logic_vector(to_signed(w29, XI_WIDTH)) & std_logic_vector(to_signed(w30, XI_WIDTH)) & std_logic_vector(to_signed(w31, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(0,-1,7,84,9,-2,7,-9,-11,3,-7,4,-6,1,1,4,-10,-5,3,0,0,12,5,1,-1,-25,1,9,-6,0,-4,11),
	    1 => w(4,-11,-19,3,32,-4,4,6,-9,-1,1,0,28,-3,-13,19,37,-1,-6,-7,-7,-13,2,-2,3,0,2,-1,7,-5,-5,4),
	    2 => w(-1,-6,-2,-14,2,-11,0,6,-2,-9,4,1,2,-1,3,1,15,1,-3,9,-3,-10,-1,-2,1,-21,2,-5,1,-2,0,-1),
	    3 => w(2,-8,-2,-2,8,-25,0,-2,3,3,27,-6,-1,3,-6,-19,-4,-13,3,-2,38,-4,0,10,-2,1,-2,2,-6,2,0,-3),
	    4 => w(-6,-4,1,-4,-9,0,13,7,-14,4,-5,-1,31,-4,4,1,0,-8,3,-6,-2,6,22,6,-9,5,3,4,12,1,-5,8),
	    5 => w(-1,-11,-4,5,7,-4,4,-8,-5,0,-9,1,3,-5,-3,-1,13,-3,3,-21,-37,4,-1,-2,3,2,-2,16,3,9,0,3),
	    6 => w(2,-1,3,-9,3,2,-2,2,-4,-1,31,0,0,4,-2,2,1,-2,-1,-2,-2,-9,22,20,-1,11,4,5,-9,-8,-3,10),
	    7 => w(-1,3,-9,4,-26,-1,9,16,-5,-14,-1,2,-1,8,4,5,6,3,-4,6,0,18,7,0,-9,3,-2,2,-6,6,0,-17),
	    8 => w(2,-3,86,-5,-2,-2,8,-7,-9,-1,-2,-4,4,-16,-6,-9,-2,4,1,0,-8,-13,9,3,6,-11,1,6,-5,-3,24,-2),
	    9 => w(7,4,7,3,0,3,1,3,12,-4,-7,0,7,1,-3,-2,11,2,-3,-9,7,-1,-14,-6,0,-9,-23,-18,10,2,5,-3),
	    10 => w(4,-12,3,12,7,-3,-1,2,3,7,-3,1,24,-1,-2,4,-7,11,-8,8,15,4,-8,6,0,-4,-21,-7,1,-8,0,-2),
	    11 => w(8,4,28,-4,-3,11,-4,-1,-14,6,-2,-6,0,5,-2,0,0,-4,2,8,4,-4,2,-9,-3,-1,-9,-3,-6,8,-6,-9),
	    12 => w(4,-12,-7,-11,-29,-6,28,-23,2,4,0,17,-6,-1,4,21,9,-43,-4,-26,-2,-11,-9,-4,30,-14,-3,34,5,-14,14,5),
	    13 => w(7,2,7,1,-7,0,9,6,39,-4,16,4,-1,-8,-2,11,29,-5,18,-19,11,1,20,-28,-2,-25,7,-1,6,5,17,-10),
	    14 => w(3,-38,-4,52,-22,-15,0,-3,1,-6,-17,15,-2,-11,3,3,0,-2,-20,-2,8,-7,3,-4,-14,-1,22,-32,8,4,2,51),
	    15 => w(6,6,2,-34,-8,0,-12,-3,6,6,-3,-3,0,5,7,-2,-33,4,-31,30,-1,-12,4,0,-6,-6,29,-9,-14,2,7,-19)
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