library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv5_bias_add_constant_memoryROM is
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
end conv5_bias_add_constant_memoryROM;

architecture Behavioral of conv5_bias_add_constant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH)) & std_logic_vector(to_signed(w9, XI_WIDTH)) & std_logic_vector(to_signed(w10, XI_WIDTH)) & std_logic_vector(to_signed(w11, XI_WIDTH)) & std_logic_vector(to_signed(w12, XI_WIDTH)) & std_logic_vector(to_signed(w13, XI_WIDTH)) & std_logic_vector(to_signed(w14, XI_WIDTH)) & std_logic_vector(to_signed(w15, XI_WIDTH)) & std_logic_vector(to_signed(w16, XI_WIDTH)) & std_logic_vector(to_signed(w17, XI_WIDTH)) & std_logic_vector(to_signed(w18, XI_WIDTH)) & std_logic_vector(to_signed(w19, XI_WIDTH)) & std_logic_vector(to_signed(w20, XI_WIDTH)) & std_logic_vector(to_signed(w21, XI_WIDTH)) & std_logic_vector(to_signed(w22, XI_WIDTH)) & std_logic_vector(to_signed(w23, XI_WIDTH)) & std_logic_vector(to_signed(w24, XI_WIDTH)) & std_logic_vector(to_signed(w25, XI_WIDTH)) & std_logic_vector(to_signed(w26, XI_WIDTH)) & std_logic_vector(to_signed(w27, XI_WIDTH)) & std_logic_vector(to_signed(w28, XI_WIDTH)) & std_logic_vector(to_signed(w29, XI_WIDTH)) & std_logic_vector(to_signed(w30, XI_WIDTH)) & std_logic_vector(to_signed(w31, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(21,-17,-21,4,-27,13,-3,27,-72,36,13,-12,-18,4,12,18,42,16,21,-2,-8,-28,0,-6,3,14,6,-9,-5,11,22,20),
	    1 => w(21,-17,-21,4,-27,13,-3,27,-72,36,13,-12,-18,4,12,18,42,16,21,-2,-8,-28,0,-6,3,14,6,-9,-5,11,22,20),
	    2 => w(21,-17,-21,4,-27,13,-3,27,-72,36,13,-12,-18,4,12,18,42,16,21,-2,-8,-28,0,-6,3,14,6,-9,-5,11,22,20),
	    3 => w(21,-17,-21,4,-27,13,-3,27,-72,36,13,-12,-18,4,12,18,42,16,21,-2,-8,-28,0,-6,3,14,6,-9,-5,11,22,20),
	    4 => w(21,-17,-21,4,-27,13,-3,27,-72,36,13,-12,-18,4,12,18,42,16,21,-2,-8,-28,0,-6,3,14,6,-9,-5,11,22,20),
	    5 => w(21,-17,-21,4,-27,13,-3,27,-72,36,13,-12,-18,4,12,18,42,16,21,-2,-8,-28,0,-6,3,14,6,-9,-5,11,22,20),
	    6 => w(21,-17,-21,4,-27,13,-3,27,-72,36,13,-12,-18,4,12,18,42,16,21,-2,-8,-28,0,-6,3,14,6,-9,-5,11,22,20),
	    7 => w(21,-17,-21,4,-27,13,-3,27,-72,36,13,-12,-18,4,12,18,42,16,21,-2,-8,-28,0,-6,3,14,6,-9,-5,11,22,20),
	    8 => w(21,-17,-21,4,-27,13,-3,27,-72,36,13,-12,-18,4,12,18,42,16,21,-2,-8,-28,0,-6,3,14,6,-9,-5,11,22,20),
	    9 => w(21,-17,-21,4,-27,13,-3,27,-72,36,13,-12,-18,4,12,18,42,16,21,-2,-8,-28,0,-6,3,14,6,-9,-5,11,22,20),
	    10 => w(21,-17,-21,4,-27,13,-3,27,-72,36,13,-12,-18,4,12,18,42,16,21,-2,-8,-28,0,-6,3,14,6,-9,-5,11,22,20),
	    11 => w(21,-17,-21,4,-27,13,-3,27,-72,36,13,-12,-18,4,12,18,42,16,21,-2,-8,-28,0,-6,3,14,6,-9,-5,11,22,20),
	    12 => w(21,-17,-21,4,-27,13,-3,27,-72,36,13,-12,-18,4,12,18,42,16,21,-2,-8,-28,0,-6,3,14,6,-9,-5,11,22,20),
	    13 => w(27,-19,1,-6,14,4,-67,10,11,-2,28,31,23,20,4,-10,1,6,-9,-6,14,-12,-7,18,-1,13,6,21,7,23,9,20),
	    14 => w(-24,27,-36,1,-31,25,31,-6,8,-2,-4,26,-9,3,-17,-7,-25,24,1,-4,15,-11,-53,-13,14,4,-2,8,3,-16,-8,2),
	    15 => w(21,4,-19,-37,37,29,10,13,12,15,-53,-24,3,5,-28,-5,8,5,8,27,1,47,5,16,-36,9,-27,7,6,39,22,13)
        );
    
begin

dout <= data_ROM(to_integer(data_index));


end Behavioral;