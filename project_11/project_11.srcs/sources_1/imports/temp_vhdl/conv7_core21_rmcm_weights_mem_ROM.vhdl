library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core21_rmcm_weightsconstant_memoryROM is
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
end conv7_core21_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv7_core21_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH)) & std_logic_vector(to_signed(w9, XI_WIDTH)) & std_logic_vector(to_signed(w10, XI_WIDTH)) & std_logic_vector(to_signed(w11, XI_WIDTH)) & std_logic_vector(to_signed(w12, XI_WIDTH)) & std_logic_vector(to_signed(w13, XI_WIDTH)) & std_logic_vector(to_signed(w14, XI_WIDTH)) & std_logic_vector(to_signed(w15, XI_WIDTH)) & std_logic_vector(to_signed(w16, XI_WIDTH)) & std_logic_vector(to_signed(w17, XI_WIDTH)) & std_logic_vector(to_signed(w18, XI_WIDTH)) & std_logic_vector(to_signed(w19, XI_WIDTH)) & std_logic_vector(to_signed(w20, XI_WIDTH)) & std_logic_vector(to_signed(w21, XI_WIDTH)) & std_logic_vector(to_signed(w22, XI_WIDTH)) & std_logic_vector(to_signed(w23, XI_WIDTH)) & std_logic_vector(to_signed(w24, XI_WIDTH)) & std_logic_vector(to_signed(w25, XI_WIDTH)) & std_logic_vector(to_signed(w26, XI_WIDTH)) & std_logic_vector(to_signed(w27, XI_WIDTH)) & std_logic_vector(to_signed(w28, XI_WIDTH)) & std_logic_vector(to_signed(w29, XI_WIDTH)) & std_logic_vector(to_signed(w30, XI_WIDTH)) & std_logic_vector(to_signed(w31, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(-5,3,50,3,-3,-29,-2,-1,-1,-9,-6,4,0,-3,0,-17,-7,6,1,4,-10,-1,-2,-6,0,2,11,3,2,-2,16,-1),
	    1 => w(-7,-1,5,-10,-5,1,-2,-14,1,1,8,40,-8,3,7,0,-7,11,-6,6,3,-1,-4,10,-10,-4,-7,14,4,8,6,-2),
	    2 => w(-2,-12,-13,2,5,-1,0,-8,12,7,-5,8,32,-2,6,33,-1,-2,10,8,17,1,3,-4,-2,-1,-17,2,-4,7,2,-1),
	    3 => w(-3,4,-56,-4,8,1,0,-4,-10,-10,0,5,4,1,-1,-5,2,-1,-23,-5,6,6,4,-2,-11,1,-14,-2,-1,-5,0,-4),
	    4 => w(-5,-1,-8,3,10,-5,-4,-3,-12,5,-4,-2,-5,-14,2,-3,-6,7,-10,1,1,-7,1,-2,6,-21,-8,-12,-1,2,1,-5),
	    5 => w(10,-13,-30,-3,-12,15,-5,24,-2,-6,-1,-1,0,4,-16,15,-5,10,-4,1,3,-11,5,3,0,3,1,-5,9,-6,2,-1),
	    6 => w(-1,-13,-5,9,9,-3,1,12,-45,38,-6,1,3,3,1,-1,-24,-4,3,-14,-7,-2,3,-1,9,-10,0,-5,-2,-1,-1,-8),
	    7 => w(14,-12,4,-3,8,25,-17,0,18,12,19,-7,-1,1,3,-2,3,9,-3,1,-25,-25,-15,-4,-2,-3,2,-4,-9,19,3,10),
	    8 => w(8,-28,-9,-7,-3,9,11,4,-12,8,-8,8,-3,-17,-6,-4,4,-5,-17,6,0,1,-15,0,-2,-2,-18,-5,-5,6,-21,-13),
	    9 => w(2,-7,-6,23,-9,0,8,14,-41,1,-18,0,-12,0,-7,-14,-2,1,1,3,-12,-2,-14,-22,3,-7,7,-46,10,-8,-30,-10),
	    10 => w(-13,-4,13,-13,0,-9,2,17,-2,-2,-4,-2,-8,1,-14,10,4,46,3,5,2,8,-5,-16,4,7,-17,6,1,-22,5,20),
	    11 => w(6,-1,-5,-2,11,-4,6,8,3,22,-7,4,4,0,0,0,-12,2,2,-16,9,-23,1,2,2,0,-4,16,17,-2,-40,18),
	    12 => w(-8,34,-12,7,3,-32,-11,1,5,15,1,-6,-3,8,2,-20,-4,-5,15,2,-12,4,0,3,3,3,5,-1,-2,10,6,4),
	    13 => w(-7,0,1,40,-8,3,-2,-13,-3,2,-7,-8,2,7,8,0,-2,0,-2,-5,-4,1,-3,3,1,3,-6,10,5,-3,4,10),
	    14 => w(-5,-74,-20,8,2,-2,-2,-9,-12,2,-1,-3,-29,-9,-11,31,0,-23,-5,2,15,-7,-3,-1,-13,-2,11,-10,-14,-13,-6,-24),
	    15 => w(-11,0,19,5,-5,8,-16,0,-3,-15,1,5,-9,4,-6,-1,-5,1,-29,-17,-5,0,5,1,3,3,28,4,0,1,-18,1)
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