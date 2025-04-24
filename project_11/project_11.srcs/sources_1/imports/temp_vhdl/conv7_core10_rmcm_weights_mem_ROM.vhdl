library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core10_rmcm_weightsconstant_memoryROM is
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
end conv7_core10_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv7_core10_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH)) & std_logic_vector(to_signed(w9, XI_WIDTH)) & std_logic_vector(to_signed(w10, XI_WIDTH)) & std_logic_vector(to_signed(w11, XI_WIDTH)) & std_logic_vector(to_signed(w12, XI_WIDTH)) & std_logic_vector(to_signed(w13, XI_WIDTH)) & std_logic_vector(to_signed(w14, XI_WIDTH)) & std_logic_vector(to_signed(w15, XI_WIDTH)) & std_logic_vector(to_signed(w16, XI_WIDTH)) & std_logic_vector(to_signed(w17, XI_WIDTH)) & std_logic_vector(to_signed(w18, XI_WIDTH)) & std_logic_vector(to_signed(w19, XI_WIDTH)) & std_logic_vector(to_signed(w20, XI_WIDTH)) & std_logic_vector(to_signed(w21, XI_WIDTH)) & std_logic_vector(to_signed(w22, XI_WIDTH)) & std_logic_vector(to_signed(w23, XI_WIDTH)) & std_logic_vector(to_signed(w24, XI_WIDTH)) & std_logic_vector(to_signed(w25, XI_WIDTH)) & std_logic_vector(to_signed(w26, XI_WIDTH)) & std_logic_vector(to_signed(w27, XI_WIDTH)) & std_logic_vector(to_signed(w28, XI_WIDTH)) & std_logic_vector(to_signed(w29, XI_WIDTH)) & std_logic_vector(to_signed(w30, XI_WIDTH)) & std_logic_vector(to_signed(w31, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(16,-2,4,-9,34,0,0,1,-9,2,11,-6,36,-2,-11,4,-24,2,1,-1,0,-9,-37,16,-28,24,-5,-33,5,9,15,9),
	    1 => w(1,-28,0,4,9,-12,7,-13,3,0,3,2,-21,11,-7,105,-27,-17,14,34,-50,11,16,-16,0,13,5,-14,-4,13,11,-11),
	    2 => w(14,-2,-15,4,-2,11,0,-4,15,14,5,-13,3,13,6,9,20,0,15,5,-3,-17,-8,-8,1,-15,-2,23,-2,4,7,-8),
	    3 => w(6,-34,-5,-6,15,-19,-12,-12,-23,-1,-3,0,8,-11,-2,-27,12,-2,-2,-1,-25,-22,9,-3,-15,3,-2,-2,12,-6,6,18),
	    4 => w(2,17,-3,16,-8,4,23,-16,-2,2,-1,-13,-11,-8,8,0,2,20,-5,-27,2,26,-5,-6,19,-18,3,15,6,0,-6,4),
	    5 => w(3,8,2,4,14,-4,10,6,-24,0,45,1,16,-7,-19,14,14,3,12,-11,0,-1,12,-7,1,-6,3,-4,-2,11,1,3),
	    6 => w(4,15,-3,48,5,-15,0,-5,4,4,-3,1,4,-7,10,9,15,-3,-1,1,5,5,-3,1,4,-6,25,4,-5,-6,-1,-4),
	    7 => w(4,11,2,3,-12,-17,-6,-4,-13,9,-3,-2,0,8,-7,-3,0,0,11,14,-11,2,8,4,-2,1,-3,3,-11,2,54,2),
	    8 => w(6,15,5,-7,-27,6,-7,19,-3,5,-19,4,23,-6,-12,-5,14,9,13,-5,2,-5,2,-29,14,-4,4,0,-4,6,-4,5),
	    9 => w(-5,-12,8,14,28,-1,4,-3,-3,1,-6,1,-18,-2,16,-12,7,-3,-11,6,14,-17,-8,3,-3,-4,-3,-9,8,-15,14,-3),
	    10 => w(2,11,-4,9,-8,-34,9,-14,17,11,24,5,1,-4,-22,-1,5,13,-14,-9,3,-21,-7,-18,15,5,2,2,21,-3,-3,7),
	    11 => w(-2,5,-2,10,-3,-3,-12,0,1,14,-2,8,-2,2,5,20,0,2,5,-1,-10,-10,12,1,-36,1,2,-19,7,1,7,-14),
	    12 => w(-2,-10,34,0,5,38,-8,-2,-2,-5,-2,11,-1,-26,0,-5,-2,1,-3,5,-24,1,-10,0,-2,1,27,-4,10,-12,-21,3),
	    13 => w(0,-3,0,1,1,-1,-5,-7,-8,1,-4,-15,6,17,-3,-1,-9,7,-7,18,-7,7,-2,8,-2,9,-10,11,0,13,16,-9),
	    14 => w(2,-39,16,-7,3,8,3,-5,9,5,-1,3,6,1,3,17,-6,-12,20,7,13,-2,-1,2,-9,1,5,13,-8,-1,7,3),
	    15 => w(1,-3,33,-9,7,0,-2,-8,-4,7,4,11,4,-1,-1,-6,-2,1,-6,6,0,12,-1,0,-4,-3,7,-11,-8,-2,-32,-8)
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