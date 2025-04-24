library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core1_rmcm_weightsconstant_memoryROM is
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
end conv7_core1_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv7_core1_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH)) & std_logic_vector(to_signed(w9, XI_WIDTH)) & std_logic_vector(to_signed(w10, XI_WIDTH)) & std_logic_vector(to_signed(w11, XI_WIDTH)) & std_logic_vector(to_signed(w12, XI_WIDTH)) & std_logic_vector(to_signed(w13, XI_WIDTH)) & std_logic_vector(to_signed(w14, XI_WIDTH)) & std_logic_vector(to_signed(w15, XI_WIDTH)) & std_logic_vector(to_signed(w16, XI_WIDTH)) & std_logic_vector(to_signed(w17, XI_WIDTH)) & std_logic_vector(to_signed(w18, XI_WIDTH)) & std_logic_vector(to_signed(w19, XI_WIDTH)) & std_logic_vector(to_signed(w20, XI_WIDTH)) & std_logic_vector(to_signed(w21, XI_WIDTH)) & std_logic_vector(to_signed(w22, XI_WIDTH)) & std_logic_vector(to_signed(w23, XI_WIDTH)) & std_logic_vector(to_signed(w24, XI_WIDTH)) & std_logic_vector(to_signed(w25, XI_WIDTH)) & std_logic_vector(to_signed(w26, XI_WIDTH)) & std_logic_vector(to_signed(w27, XI_WIDTH)) & std_logic_vector(to_signed(w28, XI_WIDTH)) & std_logic_vector(to_signed(w29, XI_WIDTH)) & std_logic_vector(to_signed(w30, XI_WIDTH)) & std_logic_vector(to_signed(w31, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(-9,29,-1,-27,-16,17,-14,-3,6,-6,32,2,4,-5,-46,-7,6,-5,-36,-5,10,-13,-43,-21,-22,63,-18,-55,-11,6,8,-24),
	    1 => w(0,-10,-3,5,-10,-23,72,22,-27,8,19,1,-66,5,-19,44,-111,5,23,51,-14,10,9,-30,-5,-5,-1,-21,-2,2,-1,-15),
	    2 => w(3,-8,-25,4,-15,13,-1,16,-30,-23,-45,21,2,10,15,-14,18,14,11,24,-11,20,0,-67,-2,-1,9,26,2,17,13,-1),
	    3 => w(21,-26,-8,6,35,-57,-26,-26,11,-12,17,26,13,-10,6,-14,-14,17,10,-4,42,-29,1,0,-4,-15,8,1,28,-23,28,4),
	    4 => w(0,-1,5,27,-9,2,7,-4,7,0,-13,2,4,-6,3,4,-13,4,-1,-3,0,12,-15,61,21,-6,-2,2,-22,-6,4,-2),
	    5 => w(-4,8,7,2,-8,3,-5,2,-5,1,7,0,-2,-2,3,-10,-3,-1,-3,-8,-65,0,0,4,-2,-1,0,6,8,8,0,-5),
	    6 => w(-2,-3,3,-8,3,-11,2,0,8,-1,-5,-4,2,-2,11,3,1,-3,-6,-5,-2,-12,11,-15,-4,-13,1,8,2,-2,2,5),
	    7 => w(-1,-5,3,2,27,-3,0,4,-9,-4,4,6,2,3,2,7,-1,8,-3,-1,6,5,-4,-3,60,1,0,1,1,-2,9,-6),
	    8 => w(-6,0,-1,-3,-16,-1,5,-20,30,0,-16,0,32,0,-14,-3,12,2,15,-1,1,-8,-3,40,16,-5,3,-2,-26,2,8,-14),
	    9 => w(-5,2,4,10,0,2,-5,11,-1,2,-5,1,3,-4,8,-1,-8,-2,-2,-1,-27,-23,0,8,1,0,-1,-18,0,-1,6,12),
	    10 => w(-4,3,5,4,-4,-6,10,4,7,11,3,-12,2,-1,1,-1,1,9,-3,-2,-1,22,-22,-37,4,-2,-3,-9,22,-26,4,-18),
	    11 => w(0,2,2,-3,4,-2,19,-1,5,4,4,8,6,1,13,6,-2,-5,-5,6,2,-30,6,1,-31,2,8,0,11,-4,1,26),
	    12 => w(-26,36,-2,0,-2,28,-10,0,-13,26,20,-11,-14,17,15,43,-8,31,71,-25,10,-8,15,20,3,10,27,48,4,18,20,11),
	    13 => w(-32,1,60,11,8,-8,9,18,20,10,3,8,4,-7,7,-34,8,2,-19,25,12,18,14,0,-5,9,13,49,-1,-14,21,59),
	    14 => w(12,23,4,32,-3,-2,7,-12,27,-7,-17,3,7,-16,-2,2,5,-5,-19,-15,17,-3,31,26,11,24,38,0,-4,81,-4,14),
	    15 => w(-14,39,3,5,21,40,52,-3,91,-27,3,39,3,-11,11,-1,41,21,31,28,-27,59,5,6,-4,14,15,-11,42,-4,12,-24)
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