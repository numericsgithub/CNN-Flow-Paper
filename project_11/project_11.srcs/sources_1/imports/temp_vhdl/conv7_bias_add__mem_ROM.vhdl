library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_bias_add_constant_memoryROM is
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
end conv7_bias_add_constant_memoryROM;

architecture Behavioral of conv7_bias_add_constant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH)) & std_logic_vector(to_signed(w9, XI_WIDTH)) & std_logic_vector(to_signed(w10, XI_WIDTH)) & std_logic_vector(to_signed(w11, XI_WIDTH)) & std_logic_vector(to_signed(w12, XI_WIDTH)) & std_logic_vector(to_signed(w13, XI_WIDTH)) & std_logic_vector(to_signed(w14, XI_WIDTH)) & std_logic_vector(to_signed(w15, XI_WIDTH)) & std_logic_vector(to_signed(w16, XI_WIDTH)) & std_logic_vector(to_signed(w17, XI_WIDTH)) & std_logic_vector(to_signed(w18, XI_WIDTH)) & std_logic_vector(to_signed(w19, XI_WIDTH)) & std_logic_vector(to_signed(w20, XI_WIDTH)) & std_logic_vector(to_signed(w21, XI_WIDTH)) & std_logic_vector(to_signed(w22, XI_WIDTH)) & std_logic_vector(to_signed(w23, XI_WIDTH)) & std_logic_vector(to_signed(w24, XI_WIDTH)) & std_logic_vector(to_signed(w25, XI_WIDTH)) & std_logic_vector(to_signed(w26, XI_WIDTH)) & std_logic_vector(to_signed(w27, XI_WIDTH)) & std_logic_vector(to_signed(w28, XI_WIDTH)) & std_logic_vector(to_signed(w29, XI_WIDTH)) & std_logic_vector(to_signed(w30, XI_WIDTH)) & std_logic_vector(to_signed(w31, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(-23,-24,-41,-25,-5,10,35,-13,16,17,42,31,-13,22,40,-43,-26,43,28,-22,0,-1,23,-31,12,27,-43,-14,27,-1,-14,-2),
	    1 => w(-23,-24,-41,-25,-5,10,35,-13,16,17,42,31,-13,22,40,-43,-26,43,28,-22,0,-1,23,-31,12,27,-43,-14,27,-1,-14,-2),
	    2 => w(-23,-24,-41,-25,-5,10,35,-13,16,17,42,31,-13,22,40,-43,-26,43,28,-22,0,-1,23,-31,12,27,-43,-14,27,-1,-14,-2),
	    3 => w(-23,-24,-41,-25,-5,10,35,-13,16,17,42,31,-13,22,40,-43,-26,43,28,-22,0,-1,23,-31,12,27,-43,-14,27,-1,-14,-2),
	    4 => w(-23,-24,-41,-25,-5,10,35,-13,16,17,42,31,-13,22,40,-43,-26,43,28,-22,0,-1,23,-31,12,27,-43,-14,27,-1,-14,-2),
	    5 => w(-23,-24,-41,-25,-5,10,35,-13,16,17,42,31,-13,22,40,-43,-26,43,28,-22,0,-1,23,-31,12,27,-43,-14,27,-1,-14,-2),
	    6 => w(-23,-24,-41,-25,-5,10,35,-13,16,17,42,31,-13,22,40,-43,-26,43,28,-22,0,-1,23,-31,12,27,-43,-14,27,-1,-14,-2),
	    7 => w(-23,-24,-41,-25,-5,10,35,-13,16,17,42,31,-13,22,40,-43,-26,43,28,-22,0,-1,23,-31,12,27,-43,-14,27,-1,-14,-2),
	    8 => w(-23,-24,-41,-25,-5,10,35,-13,16,17,42,31,-13,22,40,-43,-26,43,28,-22,0,-1,23,-31,12,27,-43,-14,27,-1,-14,-2),
	    9 => w(-23,-24,-41,-25,-5,10,35,-13,16,17,42,31,-13,22,40,-43,-26,43,28,-22,0,-1,23,-31,12,27,-43,-14,27,-1,-14,-2),
	    10 => w(-23,-24,-41,-25,-5,10,35,-13,16,17,42,31,-13,22,40,-43,-26,43,28,-22,0,-1,23,-31,12,27,-43,-14,27,-1,-14,-2),
	    11 => w(-23,-24,-41,-25,-5,10,35,-13,16,17,42,31,-13,22,40,-43,-26,43,28,-22,0,-1,23,-31,12,27,-43,-14,27,-1,-14,-2),
	    12 => w(-23,-24,-41,-25,-5,10,35,-13,16,17,42,31,-13,22,40,-43,-26,43,28,-22,0,-1,23,-31,12,27,-43,-14,27,-1,-14,-2),
	    13 => w(6,44,31,-45,-13,31,-27,-88,-68,39,23,1,-11,29,83,6,-47,20,71,-57,37,12,29,68,34,7,-4,67,23,12,-36,71),
	    14 => w(24,8,-35,2,21,-70,3,-68,72,18,12,-45,-15,36,-39,2,19,-61,56,21,9,-25,3,15,24,3,34,-128,2,-35,10,4),
	    15 => w(-9,9,31,12,-64,-21,1,18,-17,-88,26,1,11,6,15,32,21,8,22,15,20,49,19,18,-27,12,28,52,-22,1,0,-16)
        );
    
begin

dout <= data_ROM(to_integer(data_index));


end Behavioral;