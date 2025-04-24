library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv5_core1_rmcm_weightsconstant_memoryROM is
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
end conv5_core1_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv5_core1_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH)) & std_logic_vector(to_signed(w9, XI_WIDTH)) & std_logic_vector(to_signed(w10, XI_WIDTH)) & std_logic_vector(to_signed(w11, XI_WIDTH)) & std_logic_vector(to_signed(w12, XI_WIDTH)) & std_logic_vector(to_signed(w13, XI_WIDTH)) & std_logic_vector(to_signed(w14, XI_WIDTH)) & std_logic_vector(to_signed(w15, XI_WIDTH)) & std_logic_vector(to_signed(w16, XI_WIDTH)) & std_logic_vector(to_signed(w17, XI_WIDTH)) & std_logic_vector(to_signed(w18, XI_WIDTH)) & std_logic_vector(to_signed(w19, XI_WIDTH)) & std_logic_vector(to_signed(w20, XI_WIDTH)) & std_logic_vector(to_signed(w21, XI_WIDTH)) & std_logic_vector(to_signed(w22, XI_WIDTH)) & std_logic_vector(to_signed(w23, XI_WIDTH)) & std_logic_vector(to_signed(w24, XI_WIDTH)) & std_logic_vector(to_signed(w25, XI_WIDTH)) & std_logic_vector(to_signed(w26, XI_WIDTH)) & std_logic_vector(to_signed(w27, XI_WIDTH)) & std_logic_vector(to_signed(w28, XI_WIDTH)) & std_logic_vector(to_signed(w29, XI_WIDTH)) & std_logic_vector(to_signed(w30, XI_WIDTH)) & std_logic_vector(to_signed(w31, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(6,-10,4,4,3,-12,0,1,0,-15,0,0,2,-1,1,1,1,5,3,-2,0,32,-7,-3,4,0,-2,8,-1,-4,3,0),
	    1 => w(-13,0,16,46,0,3,7,4,6,3,51,-1,2,0,-1,4,1,3,-6,-5,-2,0,5,15,1,-1,3,5,-1,1,1,0),
	    2 => w(41,1,0,0,2,-1,1,6,-6,-16,2,0,5,-2,-55,4,0,-3,1,6,6,1,-1,6,-21,-1,9,-1,3,0,-4,4),
	    3 => w(1,-1,2,-4,1,32,12,3,-5,1,1,26,1,0,-5,1,4,0,-7,-13,0,6,-14,1,-2,3,-2,-4,3,-27,3,0),
	    4 => w(-1,-19,-5,-5,3,-2,3,0,1,-14,1,8,3,8,0,-9,3,-3,3,-4,1,-39,12,-4,4,2,-2,-9,-15,3,-2,1),
	    5 => w(-5,9,-12,2,1,2,7,2,-1,5,-4,-2,-1,1,4,2,0,-9,-7,-5,-1,3,7,-52,3,-1,12,-2,14,-1,4,-9),
	    6 => w(-36,-1,-5,0,7,1,1,18,-2,15,-4,3,-15,3,14,-2,-1,-4,2,0,5,4,-10,4,19,-3,-2,0,-3,-2,-6,0),
	    7 => w(1,2,1,6,2,14,2,6,22,0,2,-10,2,-6,-10,8,5,14,-1,5,-1,1,-2,-16,3,5,-1,7,-10,2,2,-1),
	    8 => w(18,54,-3,1,-3,-7,4,2,7,-8,1,4,3,-1,-3,-4,-12,-7,1,1,0,-6,-8,-6,19,1,-1,2,-9,-20,7,0),
	    9 => w(-8,-9,15,18,1,-12,-5,13,7,-9,-6,1,10,0,0,8,6,5,-5,-1,-1,-6,4,3,-2,-4,4,1,5,6,-3,-4),
	    10 => w(-18,1,-22,4,-5,0,-6,7,8,24,-2,-4,-9,1,9,-1,0,-6,4,-1,6,-3,0,2,14,1,2,-13,-18,-6,41,6),
	    11 => w(2,0,0,2,2,3,11,-10,-4,2,-7,-21,0,0,-18,3,-1,-2,-16,-34,0,-8,-2,5,-1,6,-1,3,-19,43,4,2),
	    12 => w(-11,-13,7,-6,-8,-10,-1,2,0,8,-3,-3,10,17,4,6,8,1,-2,5,-4,-6,-4,-6,3,-1,-8,-7,4,-3,3,-1),
	    13 => w(2,12,-2,-1,0,-5,7,-4,-15,-1,-3,-1,-15,-1,-1,4,-3,-5,6,-7,1,-1,8,-5,-7,4,2,0,-1,-8,-1,-3),
	    14 => w(4,-2,-8,3,-2,4,-2,8,10,1,-2,0,0,0,-8,4,-4,-12,9,3,1,11,5,12,-3,-12,1,-3,4,-6,1,8),
	    15 => w(2,3,-1,-2,-2,-15,0,-5,2,-1,1,0,-2,0,4,3,0,0,-8,-1,0,-37,11,-1,-6,-2,-5,0,-5,-9,-1,-5)
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