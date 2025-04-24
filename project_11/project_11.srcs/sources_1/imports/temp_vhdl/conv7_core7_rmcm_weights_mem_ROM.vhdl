library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core7_rmcm_weightsconstant_memoryROM is
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
end conv7_core7_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv7_core7_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH)) & std_logic_vector(to_signed(w9, XI_WIDTH)) & std_logic_vector(to_signed(w10, XI_WIDTH)) & std_logic_vector(to_signed(w11, XI_WIDTH)) & std_logic_vector(to_signed(w12, XI_WIDTH)) & std_logic_vector(to_signed(w13, XI_WIDTH)) & std_logic_vector(to_signed(w14, XI_WIDTH)) & std_logic_vector(to_signed(w15, XI_WIDTH)) & std_logic_vector(to_signed(w16, XI_WIDTH)) & std_logic_vector(to_signed(w17, XI_WIDTH)) & std_logic_vector(to_signed(w18, XI_WIDTH)) & std_logic_vector(to_signed(w19, XI_WIDTH)) & std_logic_vector(to_signed(w20, XI_WIDTH)) & std_logic_vector(to_signed(w21, XI_WIDTH)) & std_logic_vector(to_signed(w22, XI_WIDTH)) & std_logic_vector(to_signed(w23, XI_WIDTH)) & std_logic_vector(to_signed(w24, XI_WIDTH)) & std_logic_vector(to_signed(w25, XI_WIDTH)) & std_logic_vector(to_signed(w26, XI_WIDTH)) & std_logic_vector(to_signed(w27, XI_WIDTH)) & std_logic_vector(to_signed(w28, XI_WIDTH)) & std_logic_vector(to_signed(w29, XI_WIDTH)) & std_logic_vector(to_signed(w30, XI_WIDTH)) & std_logic_vector(to_signed(w31, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(-32,-13,-12,-6,-9,2,-25,14,5,23,6,5,-7,-4,5,8,-4,15,-18,-10,-6,0,3,-14,3,8,2,2,7,63,-11,9),
	    1 => w(0,4,-8,17,9,3,4,-8,58,-1,-12,-4,4,-7,6,8,1,-2,-14,-2,14,-6,7,17,-9,2,3,-6,-10,-5,16,-1),
	    2 => w(-7,21,-11,-10,-54,3,0,-6,21,-3,3,-9,-16,-4,4,4,3,26,2,2,2,1,2,2,-8,-9,-10,6,-7,-42,-2,16),
	    3 => w(3,5,1,23,1,20,0,2,-20,8,-6,-12,-3,-4,-4,7,-20,-3,6,8,-9,8,7,-11,-1,-2,-14,-38,8,7,-30,-25),
	    4 => w(-1,-2,1,4,4,-1,0,-5,-3,0,1,1,-1,-1,2,1,2,-4,-2,-1,-1,0,-5,5,-1,3,-5,4,0,-2,1,-1),
	    5 => w(1,0,-4,-1,4,1,1,6,-2,-1,0,0,1,-1,-3,-7,8,-6,-2,-1,3,-1,2,1,0,2,1,-5,3,-7,0,-3),
	    6 => w(2,-1,-7,-2,2,-2,1,-1,-8,18,-6,-3,0,0,-1,1,-2,0,0,-7,3,2,0,0,1,-4,-2,6,0,-1,0,-2),
	    7 => w(3,-4,2,-1,2,-5,-3,-2,1,4,6,-1,0,-1,-1,2,-1,14,1,0,114,-2,11,-3,-1,8,-1,1,-1,2,2,2),
	    8 => w(4,13,1,12,25,-6,-6,8,3,6,10,0,-8,7,17,8,-7,-35,-12,-14,-3,1,-30,-6,-29,5,14,-22,27,-2,9,-3),
	    9 => w(5,13,6,-4,10,-6,-3,-2,-18,0,37,-1,-24,16,-9,-8,-31,0,-20,38,-14,15,-4,32,2,-28,6,-7,5,2,12,-6),
	    10 => w(14,-4,-4,-33,-40,17,4,-1,-1,4,-4,9,5,9,19,-5,5,-6,12,1,5,0,0,-9,-6,-13,10,47,5,2,12,65),
	    11 => w(7,-11,4,-16,13,-18,24,-6,2,6,1,1,13,-5,6,3,-20,0,-6,33,0,-15,-5,-3,-2,1,4,7,19,-8,45,2),
	    12 => w(1,4,0,4,-4,3,17,-13,65,-2,15,-1,22,-12,-46,-1,0,2,5,1,4,6,-15,-15,8,-18,-5,15,-10,7,1,-11),
	    13 => w(-10,-2,8,7,-11,5,13,0,-8,5,-1,0,-11,-6,-3,-1,-9,7,-17,1,27,-19,2,2,-3,5,4,-8,1,-14,10,11),
	    14 => w(4,-11,0,-10,1,-11,10,1,16,21,-36,10,2,-14,6,-8,0,10,-6,-3,3,7,-43,-61,11,-9,-1,-12,26,-12,11,-8),
	    15 => w(1,-21,3,-1,-12,-3,-17,-25,43,20,-1,12,11,8,14,-5,-12,-10,-3,3,-5,-25,-4,-3,11,1,2,0,17,-6,1,14)
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