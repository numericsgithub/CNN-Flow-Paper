library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv5_core2_rmcm_weightsconstant_memoryROM is
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
end conv5_core2_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv5_core2_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH)) & std_logic_vector(to_signed(w9, XI_WIDTH)) & std_logic_vector(to_signed(w10, XI_WIDTH)) & std_logic_vector(to_signed(w11, XI_WIDTH)) & std_logic_vector(to_signed(w12, XI_WIDTH)) & std_logic_vector(to_signed(w13, XI_WIDTH)) & std_logic_vector(to_signed(w14, XI_WIDTH)) & std_logic_vector(to_signed(w15, XI_WIDTH)) & std_logic_vector(to_signed(w16, XI_WIDTH)) & std_logic_vector(to_signed(w17, XI_WIDTH)) & std_logic_vector(to_signed(w18, XI_WIDTH)) & std_logic_vector(to_signed(w19, XI_WIDTH)) & std_logic_vector(to_signed(w20, XI_WIDTH)) & std_logic_vector(to_signed(w21, XI_WIDTH)) & std_logic_vector(to_signed(w22, XI_WIDTH)) & std_logic_vector(to_signed(w23, XI_WIDTH)) & std_logic_vector(to_signed(w24, XI_WIDTH)) & std_logic_vector(to_signed(w25, XI_WIDTH)) & std_logic_vector(to_signed(w26, XI_WIDTH)) & std_logic_vector(to_signed(w27, XI_WIDTH)) & std_logic_vector(to_signed(w28, XI_WIDTH)) & std_logic_vector(to_signed(w29, XI_WIDTH)) & std_logic_vector(to_signed(w30, XI_WIDTH)) & std_logic_vector(to_signed(w31, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(1,27,0,-6,-11,-37,-3,-1,-4,-1,6,14,0,-4,-3,-15,9,-3,2,-1,-1,4,0,18,-14,1,4,-19,-4,4,-3,0),
	    1 => w(-1,5,-4,-6,1,-8,1,-6,9,-13,-3,2,1,-1,-19,3,5,-8,2,8,-3,1,19,0,10,-6,-2,-10,0,11,-6,5),
	    2 => w(2,-5,-7,3,-1,2,3,7,-11,4,1,-3,5,-1,3,4,0,7,-24,5,12,13,1,-25,1,8,-5,25,20,1,-3,-2),
	    3 => w(-5,2,3,1,-3,10,0,-4,-4,1,3,-2,-2,-4,36,1,9,22,19,0,0,-66,2,8,2,3,1,0,-1,-3,3,12),
	    4 => w(-1,-2,1,-2,-2,-57,2,0,1,11,-1,2,1,2,0,5,15,-1,-1,1,0,-3,3,1,0,0,2,-3,2,3,0,0),
	    5 => w(0,2,-3,3,1,2,99,0,0,1,3,-1,-1,1,0,0,-1,2,1,-1,-1,-5,3,-3,-6,1,-1,-3,2,-1,0,1),
	    6 => w(2,0,-2,2,0,0,2,-1,4,1,0,-3,-4,-1,-2,3,0,0,-1,2,-5,0,-3,2,3,3,-2,1,1,2,0,1),
	    7 => w(0,2,2,6,1,-12,-1,-1,-1,-1,1,2,1,4,10,3,4,-2,-2,4,0,3,3,1,2,0,-1,0,1,-2,-2,0),
	    8 => w(0,7,1,27,41,7,-2,1,-6,5,2,-7,0,13,0,-6,-24,1,-1,1,-1,0,-2,-29,-6,0,1,2,-3,1,-1,0),
	    9 => w(-1,0,4,9,0,3,7,-1,0,-1,3,0,-1,-1,-9,1,0,-3,8,14,-1,4,0,2,2,0,-1,-3,2,3,-3,2),
	    10 => w(3,-2,-10,0,1,0,4,0,-3,-15,-3,27,13,-1,0,-3,1,1,-2,0,-4,15,2,-7,1,25,0,2,5,-6,5,5),
	    11 => w(-1,1,2,-5,-2,-5,1,0,1,1,2,2,0,-2,-8,-2,2,2,6,-4,-1,-27,25,3,2,2,-2,-1,2,3,4,1),
	    12 => w(4,27,6,0,1,-3,2,3,-4,-3,6,7,2,-4,5,2,3,1,2,3,-3,3,-3,-3,-3,0,-6,1,3,-8,-19,3),
	    13 => w(4,1,2,-1,3,-2,-4,2,4,2,-2,-9,-1,0,5,5,5,4,-3,0,0,-5,27,3,-3,-6,-7,4,-1,11,-1,9),
	    14 => w(-4,-7,65,-12,-5,-4,-1,-11,-2,2,1,0,-6,3,-4,-5,-2,1,-1,7,-7,2,-8,1,-3,0,7,4,0,1,-4,3),
	    15 => w(-2,-14,-3,-6,-1,2,-1,-13,1,-1,-2,-3,-2,-6,5,-2,-1,-24,-1,1,0,-5,-2,-1,-9,8,0,8,-1,1,-2,4)
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