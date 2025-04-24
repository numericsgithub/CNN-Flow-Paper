library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv5_core8_rmcm_weightsconstant_memoryROM is
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
end conv5_core8_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv5_core8_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH)) & std_logic_vector(to_signed(w9, XI_WIDTH)) & std_logic_vector(to_signed(w10, XI_WIDTH)) & std_logic_vector(to_signed(w11, XI_WIDTH)) & std_logic_vector(to_signed(w12, XI_WIDTH)) & std_logic_vector(to_signed(w13, XI_WIDTH)) & std_logic_vector(to_signed(w14, XI_WIDTH)) & std_logic_vector(to_signed(w15, XI_WIDTH)) & std_logic_vector(to_signed(w16, XI_WIDTH)) & std_logic_vector(to_signed(w17, XI_WIDTH)) & std_logic_vector(to_signed(w18, XI_WIDTH)) & std_logic_vector(to_signed(w19, XI_WIDTH)) & std_logic_vector(to_signed(w20, XI_WIDTH)) & std_logic_vector(to_signed(w21, XI_WIDTH)) & std_logic_vector(to_signed(w22, XI_WIDTH)) & std_logic_vector(to_signed(w23, XI_WIDTH)) & std_logic_vector(to_signed(w24, XI_WIDTH)) & std_logic_vector(to_signed(w25, XI_WIDTH)) & std_logic_vector(to_signed(w26, XI_WIDTH)) & std_logic_vector(to_signed(w27, XI_WIDTH)) & std_logic_vector(to_signed(w28, XI_WIDTH)) & std_logic_vector(to_signed(w29, XI_WIDTH)) & std_logic_vector(to_signed(w30, XI_WIDTH)) & std_logic_vector(to_signed(w31, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(16,-49,1,0,-5,3,1,3,-2,-17,1,0,2,3,-1,4,-6,3,-3,2,0,-8,5,-7,21,0,-4,-10,5,-15,0,0),
	    1 => w(5,-2,43,-5,2,-11,-8,13,3,-7,-4,6,3,0,3,4,-2,6,10,1,0,-2,0,4,-5,-5,-5,-2,-11,6,-2,-8),
	    2 => w(19,-1,6,1,1,0,0,-1,15,3,1,-1,6,8,-7,-1,1,-7,6,-7,-4,1,-3,-4,3,0,-4,-13,-11,3,-7,5),
	    3 => w(1,4,2,0,2,-4,-2,-8,-2,-1,0,52,0,-3,-26,-5,-8,-7,-14,-8,0,-11,-7,-2,4,2,1,2,-1,19,2,3),
	    4 => w(-7,0,5,7,-5,-7,1,-5,4,7,-1,-7,2,4,-1,-2,1,-1,-1,3,-2,15,8,1,-10,1,2,1,7,5,-2,0),
	    5 => w(-5,8,-45,7,0,8,1,-8,-3,4,-13,1,-1,1,-4,2,-2,-5,-1,-2,0,-3,10,1,-6,2,4,-2,-1,-2,-4,0),
	    6 => w(-23,-3,1,-1,-1,-1,5,8,-10,-24,11,-2,-2,-5,9,-5,-3,2,1,2,6,0,-1,-2,0,-1,-1,-1,8,-7,-20,-4),
	    7 => w(0,-5,0,1,-3,9,-3,-2,6,-2,2,6,0,-2,-3,-2,-5,-16,6,-4,-2,47,4,-1,-7,1,-1,1,4,-67,-5,0),
	    8 => w(9,-20,-2,-1,-23,127,0,0,-2,-3,4,-13,-11,0,2,2,-12,2,-1,1,0,7,-8,3,-12,0,2,0,0,7,7,1),
	    9 => w(-2,0,-19,-6,1,3,23,-5,2,2,-3,1,6,0,5,0,0,-4,-1,-6,2,-3,-7,-5,0,-4,1,-3,4,11,2,5),
	    10 => w(-2,-1,5,1,-3,0,1,3,2,-2,-6,-4,11,-3,2,-2,1,20,-7,7,-1,74,2,-7,-2,-1,2,-2,3,3,-16,2),
	    11 => w(-3,2,0,6,0,5,0,4,6,3,2,-3,1,0,-19,0,4,0,12,-6,4,-10,5,-1,3,0,0,1,5,-8,-2,5),
	    12 => w(-7,2,3,0,9,-2,6,5,-7,1,-1,-13,-1,0,1,-5,-1,7,-1,-3,3,7,-1,-1,-6,-3,-5,-20,0,20,-7,1),
	    13 => w(6,26,-5,-4,2,34,1,-6,-3,8,-9,-11,-6,0,0,2,-1,-10,1,0,-1,3,-6,-17,-2,2,-16,-5,-16,0,9,-28),
	    14 => w(3,-7,0,0,7,2,8,-12,-12,-20,-9,1,20,1,-2,-8,-3,2,7,-20,2,-2,-14,-17,-11,-1,-21,1,21,-6,4,3),
	    15 => w(0,-12,-2,-23,0,-12,1,-8,12,1,7,6,2,0,-2,2,0,3,4,9,4,-24,3,-10,-14,-1,4,-3,26,14,-6,0)
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