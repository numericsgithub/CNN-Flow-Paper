library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core18_rmcm_weightsconstant_memoryROM is
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
end conv7_core18_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv7_core18_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH)) & std_logic_vector(to_signed(w9, XI_WIDTH)) & std_logic_vector(to_signed(w10, XI_WIDTH)) & std_logic_vector(to_signed(w11, XI_WIDTH)) & std_logic_vector(to_signed(w12, XI_WIDTH)) & std_logic_vector(to_signed(w13, XI_WIDTH)) & std_logic_vector(to_signed(w14, XI_WIDTH)) & std_logic_vector(to_signed(w15, XI_WIDTH)) & std_logic_vector(to_signed(w16, XI_WIDTH)) & std_logic_vector(to_signed(w17, XI_WIDTH)) & std_logic_vector(to_signed(w18, XI_WIDTH)) & std_logic_vector(to_signed(w19, XI_WIDTH)) & std_logic_vector(to_signed(w20, XI_WIDTH)) & std_logic_vector(to_signed(w21, XI_WIDTH)) & std_logic_vector(to_signed(w22, XI_WIDTH)) & std_logic_vector(to_signed(w23, XI_WIDTH)) & std_logic_vector(to_signed(w24, XI_WIDTH)) & std_logic_vector(to_signed(w25, XI_WIDTH)) & std_logic_vector(to_signed(w26, XI_WIDTH)) & std_logic_vector(to_signed(w27, XI_WIDTH)) & std_logic_vector(to_signed(w28, XI_WIDTH)) & std_logic_vector(to_signed(w29, XI_WIDTH)) & std_logic_vector(to_signed(w30, XI_WIDTH)) & std_logic_vector(to_signed(w31, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(1,5,-2,127,1,-2,16,-24,-2,3,-19,-7,0,-13,4,0,43,2,5,-15,-1,-20,9,-13,-4,-48,14,6,-1,1,-12,-1),
	    1 => w(4,2,-14,1,35,-12,11,-4,1,0,-19,0,0,-5,-10,-12,17,-7,-1,-12,1,-24,-12,6,2,0,-4,-16,13,5,-3,2),
	    2 => w(0,3,-14,10,-6,-13,-1,10,0,4,-6,6,2,-9,-1,5,25,0,-11,-5,-5,8,-18,-24,2,-38,-1,-2,3,9,2,-11),
	    3 => w(3,35,-4,-5,-23,-24,-13,-4,-20,15,-17,-4,0,11,-1,16,-4,-1,4,-2,-51,-24,13,11,12,-6,-3,4,-20,2,0,-1),
	    4 => w(-2,-3,-6,8,7,-1,-13,-8,3,2,-19,-3,-2,-19,10,-1,11,28,9,-7,0,-22,7,4,-51,15,16,10,-11,9,-12,6),
	    5 => w(-4,-12,-13,-4,-2,-1,-1,-10,16,2,-11,-1,32,-3,-6,0,9,-1,4,-22,-22,4,-7,-6,3,0,-4,13,-6,21,12,12),
	    6 => w(-3,-4,2,-15,2,7,-2,-7,1,-2,52,8,-6,0,-28,1,21,-10,10,1,-5,55,5,2,18,4,10,3,-6,3,6,-4),
	    7 => w(1,-5,-4,1,-13,7,2,15,-10,6,-7,1,4,6,5,-2,11,3,3,8,3,0,2,-5,-9,-3,0,6,3,3,6,-25),
	    8 => w(-10,23,8,13,-22,13,-22,26,36,14,-29,-1,-5,-6,32,10,11,15,24,-5,6,4,24,-1,-13,-3,13,3,7,9,6,-11),
	    9 => w(6,2,-83,5,-3,7,12,102,7,-4,-2,1,41,3,-7,2,34,-8,7,-4,-9,-8,6,17,10,-1,2,14,0,21,-13,10),
	    10 => w(4,-10,-6,15,-1,24,-7,-3,-104,-8,41,-5,6,6,-3,0,10,14,18,70,1,-5,-13,8,19,-3,2,6,-14,16,-5,-1),
	    11 => w(28,-5,-7,-3,2,-1,-9,8,16,-8,1,-19,-7,-3,-28,9,26,5,11,0,29,22,7,-7,-18,-1,15,-7,-36,33,13,-10),
	    12 => w(-21,31,5,2,-8,-1,-7,6,-2,-29,-17,-16,-1,1,0,-6,10,-13,0,-4,2,-9,16,-11,-2,0,14,2,-2,10,-8,1),
	    13 => w(-2,4,-2,-18,-2,-10,1,-10,8,5,11,-2,-5,-10,11,-2,2,-7,-6,2,-1,7,-2,-11,2,-18,24,16,-8,-27,6,2),
	    14 => w(-9,-57,-1,-1,-28,3,-5,-4,-14,-11,0,9,4,5,-9,-3,14,-36,0,-4,1,-6,-3,3,-4,-1,28,-8,-4,43,-1,-14),
	    15 => w(-8,-9,3,0,-4,-15,1,8,-6,-10,6,10,2,6,1,9,-11,2,1,-9,-1,-7,-6,0,-8,0,9,-21,12,-13,-1,-8)
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