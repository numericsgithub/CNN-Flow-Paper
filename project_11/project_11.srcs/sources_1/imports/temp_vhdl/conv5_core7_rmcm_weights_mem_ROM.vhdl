library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv5_core7_rmcm_weightsconstant_memoryROM is
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
end conv5_core7_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv5_core7_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH)) & std_logic_vector(to_signed(w9, XI_WIDTH)) & std_logic_vector(to_signed(w10, XI_WIDTH)) & std_logic_vector(to_signed(w11, XI_WIDTH)) & std_logic_vector(to_signed(w12, XI_WIDTH)) & std_logic_vector(to_signed(w13, XI_WIDTH)) & std_logic_vector(to_signed(w14, XI_WIDTH)) & std_logic_vector(to_signed(w15, XI_WIDTH)) & std_logic_vector(to_signed(w16, XI_WIDTH)) & std_logic_vector(to_signed(w17, XI_WIDTH)) & std_logic_vector(to_signed(w18, XI_WIDTH)) & std_logic_vector(to_signed(w19, XI_WIDTH)) & std_logic_vector(to_signed(w20, XI_WIDTH)) & std_logic_vector(to_signed(w21, XI_WIDTH)) & std_logic_vector(to_signed(w22, XI_WIDTH)) & std_logic_vector(to_signed(w23, XI_WIDTH)) & std_logic_vector(to_signed(w24, XI_WIDTH)) & std_logic_vector(to_signed(w25, XI_WIDTH)) & std_logic_vector(to_signed(w26, XI_WIDTH)) & std_logic_vector(to_signed(w27, XI_WIDTH)) & std_logic_vector(to_signed(w28, XI_WIDTH)) & std_logic_vector(to_signed(w29, XI_WIDTH)) & std_logic_vector(to_signed(w30, XI_WIDTH)) & std_logic_vector(to_signed(w31, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(-1,-21,2,-77,-2,14,0,2,-5,1,2,-5,0,-9,0,-8,-13,-6,-1,4,0,-1,-5,18,-3,0,-1,5,0,0,1,0),
	    1 => w(0,1,-1,5,-1,-1,-9,-1,2,3,2,-1,1,0,-2,1,-3,2,5,34,2,0,2,-12,-6,-2,0,-3,-1,2,1,1),
	    2 => w(2,1,0,-5,0,0,2,-2,-4,-5,1,-10,6,0,1,0,0,2,-22,-4,0,2,0,1,-4,4,1,0,1,-2,0,-3),
	    3 => w(-1,-1,1,2,-2,-16,1,-3,1,1,2,2,-1,-1,47,6,-7,-5,2,2,-1,-10,8,0,1,-1,-2,-1,1,1,-7,1),
	    4 => w(0,-11,0,0,-5,0,7,45,-2,-9,-1,6,-2,6,13,8,-5,2,28,8,-23,1,3,2,-2,0,-8,-6,4,-1,-27,34),
	    5 => w(2,6,-5,-16,11,6,-4,3,-7,-9,0,-6,1,-1,2,16,2,2,-12,0,0,1,2,-2,-25,1,-2,7,1,-3,0,3),
	    6 => w(6,7,-17,56,-10,7,-4,-12,-1,-3,-1,-1,6,1,6,-5,3,2,3,-4,-4,-1,-6,7,-3,-1,3,-4,3,1,-2,5),
	    7 => w(-2,30,4,-18,-5,-5,0,-20,2,55,-2,1,-4,10,0,-1,-11,-9,2,4,26,-1,2,-4,-12,9,0,-21,1,0,-4,0),
	    8 => w(-3,-12,-11,3,-1,3,24,-12,3,7,-1,1,-2,6,54,8,-3,5,-29,13,15,-3,32,-5,-3,-3,-1,-23,15,5,-21,-17),
	    9 => w(2,-2,-3,-4,-11,1,-9,7,-7,-5,2,-24,0,-1,-1,33,17,7,-5,1,-1,3,11,7,-14,-1,-6,1,-1,1,0,5),
	    10 => w(-5,-18,29,-2,2,-9,-6,-13,4,-7,8,0,0,1,1,-8,9,2,5,6,-19,-3,7,-2,-1,-1,6,0,3,-3,7,6),
	    11 => w(-3,-13,-1,12,-8,-7,-2,27,1,-21,6,1,-3,31,0,-5,0,-5,-1,3,-47,-2,0,0,21,25,-2,39,-1,0,-3,0),
	    12 => w(-4,-15,-1,-5,-19,-42,-1,1,-3,-15,5,-2,32,1,-1,2,2,-8,-2,1,0,-7,6,-5,8,-1,3,-15,-2,-2,-9,1),
	    13 => w(0,10,12,-12,0,0,-2,1,0,7,-13,3,-16,-1,1,1,-1,3,-14,-7,2,-4,12,3,-8,-4,-1,3,2,13,2,-1),
	    14 => w(-11,1,-1,-1,-3,1,6,9,-4,-18,1,-7,-5,22,-16,4,1,11,-30,-4,11,-12,0,10,5,-4,-3,-17,-3,0,1,3),
	    15 => w(-1,6,3,-3,0,-4,0,-3,-4,1,6,1,2,-1,-13,-7,0,-10,22,13,1,12,-5,3,4,1,1,1,-2,-8,-1,4)
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