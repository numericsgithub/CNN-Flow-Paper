library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core15_rmcm_weightsconstant_memoryROM is
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
end conv7_core15_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv7_core15_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH)) & std_logic_vector(to_signed(w9, XI_WIDTH)) & std_logic_vector(to_signed(w10, XI_WIDTH)) & std_logic_vector(to_signed(w11, XI_WIDTH)) & std_logic_vector(to_signed(w12, XI_WIDTH)) & std_logic_vector(to_signed(w13, XI_WIDTH)) & std_logic_vector(to_signed(w14, XI_WIDTH)) & std_logic_vector(to_signed(w15, XI_WIDTH)) & std_logic_vector(to_signed(w16, XI_WIDTH)) & std_logic_vector(to_signed(w17, XI_WIDTH)) & std_logic_vector(to_signed(w18, XI_WIDTH)) & std_logic_vector(to_signed(w19, XI_WIDTH)) & std_logic_vector(to_signed(w20, XI_WIDTH)) & std_logic_vector(to_signed(w21, XI_WIDTH)) & std_logic_vector(to_signed(w22, XI_WIDTH)) & std_logic_vector(to_signed(w23, XI_WIDTH)) & std_logic_vector(to_signed(w24, XI_WIDTH)) & std_logic_vector(to_signed(w25, XI_WIDTH)) & std_logic_vector(to_signed(w26, XI_WIDTH)) & std_logic_vector(to_signed(w27, XI_WIDTH)) & std_logic_vector(to_signed(w28, XI_WIDTH)) & std_logic_vector(to_signed(w29, XI_WIDTH)) & std_logic_vector(to_signed(w30, XI_WIDTH)) & std_logic_vector(to_signed(w31, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(25,-27,-9,-5,-12,7,20,-8,0,19,6,5,-2,1,8,62,-2,-8,5,-2,83,-1,2,0,-3,6,0,3,2,4,-16,13),
	    1 => w(-12,1,4,-30,-7,-5,-6,-15,-6,6,-12,28,-2,-10,5,-3,-6,6,12,1,-5,10,-2,-4,34,4,22,13,-2,1,8,9),
	    2 => w(6,-21,-10,-1,8,-9,0,-11,-2,-1,8,0,3,-6,-1,31,-1,26,2,-5,14,3,4,0,-9,9,-14,-13,-15,0,-3,-18),
	    3 => w(-7,-3,5,9,-5,-4,-4,-3,-9,-22,2,10,-5,3,2,-4,-8,1,-7,-20,-2,5,1,3,-2,2,-27,3,-2,-2,-22,-19),
	    4 => w(5,7,11,-8,-6,12,11,-1,2,-12,-9,1,-9,-10,11,12,16,-35,-57,15,2,17,7,-6,17,-2,7,13,-2,-33,-36,-53),
	    5 => w(6,20,-8,2,-24,-2,-11,-19,-58,-2,9,2,-10,-2,9,2,21,-3,-17,-15,5,30,-12,-51,-4,-38,-8,22,4,26,11,25),
	    6 => w(-25,1,-4,19,1,-5,0,9,28,-12,11,17,-6,1,10,-3,0,9,-6,1,4,-13,-45,8,-9,4,-2,2,3,4,-1,13),
	    7 => w(3,6,-5,18,-10,4,-9,23,-25,17,-10,-5,-2,1,1,15,-25,16,12,-14,-10,-35,-1,10,-19,-2,12,17,-6,2,2,-5),
	    8 => w(4,-1,-1,-24,-7,0,-6,-2,21,-3,2,-3,13,-7,3,5,-11,-5,-5,-3,-1,-6,-13,-25,-26,25,-6,-33,7,2,2,-18),
	    9 => w(5,-4,-4,5,1,-8,-1,-3,8,-1,4,-2,-12,11,-3,127,-20,-5,10,42,56,8,9,-12,-1,5,3,-3,1,7,6,-8),
	    10 => w(6,-2,-5,7,2,7,3,-4,6,-10,6,-1,3,12,8,7,12,3,11,7,-7,-12,3,-18,3,-30,4,12,5,2,5,-4),
	    11 => w(6,-48,-4,-9,16,-13,-13,-14,-23,9,-8,2,4,-7,-5,9,-4,-2,1,-4,28,-11,-10,-3,-5,-8,1,-5,2,-9,5,1),
	    12 => w(10,6,4,-9,0,-3,-20,16,-3,3,-19,-1,12,-11,-6,6,6,-4,9,-2,-1,-10,5,-1,3,-1,13,-18,-5,-22,-10,-7),
	    13 => w(-2,21,-8,0,-17,-8,-11,-11,29,1,0,2,8,-4,-13,9,18,3,-11,-20,4,8,1,-9,-1,-6,13,3,-3,15,1,-3),
	    14 => w(-2,-5,-1,6,13,1,0,30,8,-10,10,-3,9,7,-3,2,9,-5,-2,-8,-2,5,5,7,8,3,8,9,1,17,3,-12),
	    15 => w(-11,4,2,0,-9,-9,0,8,4,30,0,17,5,-4,3,4,0,13,5,-11,4,-6,4,-7,18,-1,0,-8,11,-21,14,2)
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