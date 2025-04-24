library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core6_rmcm_weightsconstant_memoryROM is
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
end conv7_core6_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv7_core6_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH)) & std_logic_vector(to_signed(w9, XI_WIDTH)) & std_logic_vector(to_signed(w10, XI_WIDTH)) & std_logic_vector(to_signed(w11, XI_WIDTH)) & std_logic_vector(to_signed(w12, XI_WIDTH)) & std_logic_vector(to_signed(w13, XI_WIDTH)) & std_logic_vector(to_signed(w14, XI_WIDTH)) & std_logic_vector(to_signed(w15, XI_WIDTH)) & std_logic_vector(to_signed(w16, XI_WIDTH)) & std_logic_vector(to_signed(w17, XI_WIDTH)) & std_logic_vector(to_signed(w18, XI_WIDTH)) & std_logic_vector(to_signed(w19, XI_WIDTH)) & std_logic_vector(to_signed(w20, XI_WIDTH)) & std_logic_vector(to_signed(w21, XI_WIDTH)) & std_logic_vector(to_signed(w22, XI_WIDTH)) & std_logic_vector(to_signed(w23, XI_WIDTH)) & std_logic_vector(to_signed(w24, XI_WIDTH)) & std_logic_vector(to_signed(w25, XI_WIDTH)) & std_logic_vector(to_signed(w26, XI_WIDTH)) & std_logic_vector(to_signed(w27, XI_WIDTH)) & std_logic_vector(to_signed(w28, XI_WIDTH)) & std_logic_vector(to_signed(w29, XI_WIDTH)) & std_logic_vector(to_signed(w30, XI_WIDTH)) & std_logic_vector(to_signed(w31, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(7,8,1,-15,-2,-7,8,23,4,10,7,-3,-6,16,-23,-16,3,14,3,1,3,-14,1,1,-12,-6,-7,-12,-5,15,-9,0),
	    1 => w(-4,1,-5,-4,6,4,12,0,2,-2,-1,-3,6,-12,-15,-42,3,5,-7,2,7,8,7,-15,3,-21,3,-7,0,21,-4,8),
	    2 => w(-15,4,-12,13,-10,34,-3,-5,19,-16,9,0,-2,-10,-2,4,1,-1,-19,-2,-8,-5,2,7,13,-1,-1,14,-2,7,1,-9),
	    3 => w(-5,-15,0,-8,6,9,3,6,-5,-8,-23,2,-2,10,-12,-22,14,-33,2,15,-2,-1,-43,4,-5,-6,5,-5,-4,-11,16,5),
	    4 => w(2,-2,-8,-8,51,7,-2,-61,-9,0,-24,-1,-10,-59,1,0,33,-6,-7,-38,-2,-18,-23,-5,-24,2,5,32,5,-5,-36,15),
	    5 => w(-2,-12,4,20,-15,4,-9,4,-30,2,-36,1,-16,-6,-10,17,18,4,-10,-4,-15,20,-28,-5,-1,8,-21,-34,-28,3,14,-6),
	    6 => w(9,15,-3,41,-5,28,3,-13,0,-13,7,-13,-7,-7,1,0,8,9,-3,2,0,51,-40,-9,3,-1,-3,-5,1,0,0,35),
	    7 => w(1,16,-2,30,2,-1,5,2,8,11,-2,2,1,8,9,-25,15,0,6,-7,5,-19,1,3,-14,-8,-5,-6,2,2,8,4),
	    8 => w(6,9,28,-8,-12,2,0,-3,7,-2,6,-4,-2,11,-6,-3,-2,-9,-4,27,-3,-6,12,-6,-4,-1,5,11,-7,6,-13,-5),
	    9 => w(-8,2,-1,0,-11,3,5,9,-8,5,-49,2,-11,-4,-4,-7,-16,3,-4,7,3,2,-8,-1,-5,-14,-25,-22,-11,-3,1,1),
	    10 => w(9,-10,23,-13,-13,3,3,-2,2,11,4,-9,-5,-4,-4,8,4,5,-4,-5,2,27,-3,-13,0,0,5,-19,0,8,11,-1),
	    11 => w(3,1,8,-16,8,-11,13,-2,23,-7,-6,13,18,0,26,-5,-3,0,-27,8,16,6,2,-1,1,-1,-3,2,11,-5,19,17),
	    12 => w(0,3,3,-8,-4,2,-10,8,-9,-1,4,-3,6,-6,-14,3,-17,-4,10,1,0,-1,-27,-3,-25,29,-5,-35,-18,-4,0,-18),
	    13 => w(5,-1,-16,6,4,-13,13,-9,2,-1,-6,1,-7,11,0,127,-29,-17,2,12,-5,1,-5,-4,0,-14,5,-13,0,9,14,-6),
	    14 => w(-14,6,-9,-12,6,-6,1,6,5,16,6,-3,0,10,4,11,24,3,12,1,-8,-13,-3,-11,6,-36,3,23,4,1,8,-1),
	    15 => w(7,-26,-8,2,15,-16,0,-5,-11,15,-4,-1,9,-9,0,44,4,-5,10,-6,-40,-15,6,11,-12,2,-1,2,-2,-8,15,-3)
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