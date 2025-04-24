library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core26_rmcm_weightsconstant_memoryROM is
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
end conv7_core26_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv7_core26_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH)) & std_logic_vector(to_signed(w9, XI_WIDTH)) & std_logic_vector(to_signed(w10, XI_WIDTH)) & std_logic_vector(to_signed(w11, XI_WIDTH)) & std_logic_vector(to_signed(w12, XI_WIDTH)) & std_logic_vector(to_signed(w13, XI_WIDTH)) & std_logic_vector(to_signed(w14, XI_WIDTH)) & std_logic_vector(to_signed(w15, XI_WIDTH)) & std_logic_vector(to_signed(w16, XI_WIDTH)) & std_logic_vector(to_signed(w17, XI_WIDTH)) & std_logic_vector(to_signed(w18, XI_WIDTH)) & std_logic_vector(to_signed(w19, XI_WIDTH)) & std_logic_vector(to_signed(w20, XI_WIDTH)) & std_logic_vector(to_signed(w21, XI_WIDTH)) & std_logic_vector(to_signed(w22, XI_WIDTH)) & std_logic_vector(to_signed(w23, XI_WIDTH)) & std_logic_vector(to_signed(w24, XI_WIDTH)) & std_logic_vector(to_signed(w25, XI_WIDTH)) & std_logic_vector(to_signed(w26, XI_WIDTH)) & std_logic_vector(to_signed(w27, XI_WIDTH)) & std_logic_vector(to_signed(w28, XI_WIDTH)) & std_logic_vector(to_signed(w29, XI_WIDTH)) & std_logic_vector(to_signed(w30, XI_WIDTH)) & std_logic_vector(to_signed(w31, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(1,-13,-12,-8,-24,-13,34,-20,0,10,0,62,-3,9,6,-14,3,-57,2,12,-3,-1,-16,-2,11,-3,-4,22,0,-13,-35,2),
	    1 => w(5,3,2,-13,-8,-4,3,14,1,-2,-16,-1,-2,-3,-3,1,13,-8,17,4,3,0,0,-30,4,0,-12,17,2,9,10,-6),
	    2 => w(-15,9,5,43,-9,-16,4,-2,-13,-10,-16,0,-15,-9,5,3,7,-3,-10,-4,3,-12,-1,-3,-18,0,-20,-18,16,10,3,-11),
	    3 => w(3,-6,2,12,-10,-4,0,3,13,5,-3,1,1,6,8,0,-24,4,-14,45,-6,-5,-10,-1,-3,-7,-1,-11,0,-1,12,-18),
	    4 => w(4,-5,10,5,0,-5,-97,-14,4,-4,1,1,2,-12,0,0,-4,-2,0,-4,-3,8,-6,2,2,-1,91,-5,-5,-18,-3,-6),
	    5 => w(1,-2,-4,0,-2,-2,10,12,99,-2,-1,1,-2,-4,-22,5,-2,0,-116,-6,-2,-7,-8,3,-4,5,-4,-9,-7,-11,58,-15),
	    6 => w(-1,-3,2,13,43,1,1,22,-6,-6,0,3,-6,-4,13,3,5,2,-11,-5,1,-1,3,-12,14,1,-5,2,-2,-15,0,-1),
	    7 => w(0,-7,9,-4,1,-9,-20,-2,-5,21,-3,3,8,3,1,4,-1,0,-7,5,10,-19,0,3,-2,2,0,-93,1,-2,-9,13),
	    8 => w(-6,-1,1,15,1,1,-1,1,-21,-1,1,4,1,2,5,1,-10,-6,3,3,1,-1,-9,-1,1,7,-4,0,2,-2,0,4),
	    9 => w(0,0,-6,2,19,-3,-1,4,5,1,5,0,-1,3,-2,25,13,6,-1,-1,-4,1,2,10,2,3,1,0,-4,-16,-2,4),
	    10 => w(-2,0,3,-2,7,8,-1,-4,3,-19,1,1,1,2,1,-4,6,-2,1,18,0,-3,2,-6,-3,-29,2,13,1,-3,1,2),
	    11 => w(3,0,-2,1,0,-22,-3,-3,11,0,22,-1,1,-3,-8,-6,-5,-14,4,-7,123,5,4,-2,0,-6,0,1,-2,-2,6,10),
	    12 => w(2,1,-13,-8,-3,3,-19,18,1,-8,-12,2,0,12,7,5,14,0,26,10,0,-20,-3,12,-10,4,34,-1,8,-127,-19,5),
	    13 => w(4,4,0,2,2,1,0,-13,30,-1,0,-2,2,7,43,-11,10,-3,-59,7,-12,10,3,-36,-5,-22,1,-7,9,5,17,24),
	    14 => w(-11,7,-8,29,60,-8,-1,-6,21,-1,-6,2,-3,-3,-1,-4,2,7,-5,-4,8,-2,-8,3,-9,3,5,-6,1,26,-5,11),
	    15 => w(-2,0,-1,13,-8,21,2,-2,-1,-4,-4,-8,-6,0,-7,-7,-5,8,6,-2,-15,14,5,-3,8,0,8,-17,2,3,-8,-25)
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