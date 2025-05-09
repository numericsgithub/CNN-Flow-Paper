library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv11_core2_rmcm_weightsconstant_memoryROM is
    generic
    (
        XI_WIDTH        	          : natural := 8;
        ARRAY_SIZE                    : natural := 64;
        WORDS_PER_ADDR                : natural := 64
    );
    Port (
        clk        : in std_logic;
        data_index : in unsigned(bits(ARRAY_SIZE-1)-1 downto 0);
        dout       : out std_logic_vector((XI_WIDTH * WORDS_PER_ADDR-1) downto 0)
    );
end conv11_core2_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv11_core2_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31, w32, w33, w34, w35, w36, w37, w38, w39, w40, w41, w42, w43, w44, w45, w46, w47, w48, w49, w50, w51, w52, w53, w54, w55, w56, w57, w58, w59, w60, w61, w62, w63: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH)) & std_logic_vector(to_signed(w9, XI_WIDTH)) & std_logic_vector(to_signed(w10, XI_WIDTH)) & std_logic_vector(to_signed(w11, XI_WIDTH)) & std_logic_vector(to_signed(w12, XI_WIDTH)) & std_logic_vector(to_signed(w13, XI_WIDTH)) & std_logic_vector(to_signed(w14, XI_WIDTH)) & std_logic_vector(to_signed(w15, XI_WIDTH)) & std_logic_vector(to_signed(w16, XI_WIDTH)) & std_logic_vector(to_signed(w17, XI_WIDTH)) & std_logic_vector(to_signed(w18, XI_WIDTH)) & std_logic_vector(to_signed(w19, XI_WIDTH)) & std_logic_vector(to_signed(w20, XI_WIDTH)) & std_logic_vector(to_signed(w21, XI_WIDTH)) & std_logic_vector(to_signed(w22, XI_WIDTH)) & std_logic_vector(to_signed(w23, XI_WIDTH)) & std_logic_vector(to_signed(w24, XI_WIDTH)) & std_logic_vector(to_signed(w25, XI_WIDTH)) & std_logic_vector(to_signed(w26, XI_WIDTH)) & std_logic_vector(to_signed(w27, XI_WIDTH)) & std_logic_vector(to_signed(w28, XI_WIDTH)) & std_logic_vector(to_signed(w29, XI_WIDTH)) & std_logic_vector(to_signed(w30, XI_WIDTH)) & std_logic_vector(to_signed(w31, XI_WIDTH)) & std_logic_vector(to_signed(w32, XI_WIDTH)) & std_logic_vector(to_signed(w33, XI_WIDTH)) & std_logic_vector(to_signed(w34, XI_WIDTH)) & std_logic_vector(to_signed(w35, XI_WIDTH)) & std_logic_vector(to_signed(w36, XI_WIDTH)) & std_logic_vector(to_signed(w37, XI_WIDTH)) & std_logic_vector(to_signed(w38, XI_WIDTH)) & std_logic_vector(to_signed(w39, XI_WIDTH)) & std_logic_vector(to_signed(w40, XI_WIDTH)) & std_logic_vector(to_signed(w41, XI_WIDTH)) & std_logic_vector(to_signed(w42, XI_WIDTH)) & std_logic_vector(to_signed(w43, XI_WIDTH)) & std_logic_vector(to_signed(w44, XI_WIDTH)) & std_logic_vector(to_signed(w45, XI_WIDTH)) & std_logic_vector(to_signed(w46, XI_WIDTH)) & std_logic_vector(to_signed(w47, XI_WIDTH)) & std_logic_vector(to_signed(w48, XI_WIDTH)) & std_logic_vector(to_signed(w49, XI_WIDTH)) & std_logic_vector(to_signed(w50, XI_WIDTH)) & std_logic_vector(to_signed(w51, XI_WIDTH)) & std_logic_vector(to_signed(w52, XI_WIDTH)) & std_logic_vector(to_signed(w53, XI_WIDTH)) & std_logic_vector(to_signed(w54, XI_WIDTH)) & std_logic_vector(to_signed(w55, XI_WIDTH)) & std_logic_vector(to_signed(w56, XI_WIDTH)) & std_logic_vector(to_signed(w57, XI_WIDTH)) & std_logic_vector(to_signed(w58, XI_WIDTH)) & std_logic_vector(to_signed(w59, XI_WIDTH)) & std_logic_vector(to_signed(w60, XI_WIDTH)) & std_logic_vector(to_signed(w61, XI_WIDTH)) & std_logic_vector(to_signed(w62, XI_WIDTH)) & std_logic_vector(to_signed(w63, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(5,-15,-3,3,2,7,-4,3,-3,14,-8,-6,-4,-6,-20,-4,-2,-4,-11,-2,-2,-2,7,0,-4,-1,-11,-2,-1,1,9,0,-3,12,-3,-4,0,9,-5,-5,-10,7,8,-11,-7,0,3,-9,4,4,4,3,-4,31,-1,-6,-5,-12,-48,-6,-13,17,0,-1),
	    1 => w(2,-4,-27,-9,-7,-1,1,0,-8,-1,-11,-7,1,-5,2,11,-1,-1,-15,-11,-29,11,-5,-4,-2,17,4,21,2,0,-4,-14,2,-5,-16,-6,-7,13,-5,-5,4,-14,-1,-6,-1,5,4,-10,-15,11,-8,1,0,8,-2,3,-10,-5,-8,-11,0,8,3,-13),
	    2 => w(4,-27,-1,-6,-18,2,1,-5,-1,-8,-1,-2,-4,-8,-5,-9,-7,-2,-5,0,10,-1,23,7,-26,-21,-2,-2,0,-1,-4,-1,-2,-6,6,7,2,7,-1,3,-8,8,-33,-4,1,-9,15,-2,0,-1,20,-1,-11,-3,-2,7,16,-2,4,-21,-2,-5,-2,-2),
	    3 => w(5,-3,-12,-11,2,-1,2,4,9,-8,-16,13,-22,8,0,4,1,-7,4,8,-11,4,17,-1,5,12,9,-1,-2,2,0,-1,2,4,-14,-4,-3,7,-15,0,-9,-3,-7,-12,7,8,5,-5,-8,-5,-19,10,-9,-3,12,-7,2,1,-3,11,-6,-4,6,-10),
	    4 => w(-7,8,4,10,8,-1,-1,4,0,12,-6,10,0,6,1,2,-7,2,-6,-5,3,-5,9,-1,-3,0,8,-4,8,6,-8,-3,-3,4,-2,0,0,-2,-2,-6,-4,4,4,0,6,-9,-10,-14,-6,3,-5,-5,1,-5,-2,2,0,3,-6,7,-2,27,-1,9),
	    5 => w(-4,-5,-5,-4,14,0,-3,-7,-3,-6,-13,-4,2,-1,1,2,6,-19,4,-13,7,4,-3,-3,-2,11,-6,-9,0,-12,1,-8,13,-24,-3,-11,-11,0,-5,16,2,0,5,7,-2,-1,1,4,4,-2,-2,-10,6,-2,-4,1,3,0,-3,34,-8,7,-3,-10),
	    6 => w(-1,1,-3,8,10,4,-13,2,-1,7,1,0,9,22,-1,4,-7,6,0,3,-1,7,-6,3,0,-5,4,-8,9,3,-1,0,2,-4,6,-14,5,0,5,2,27,2,-5,-2,-1,-1,7,1,-12,3,6,-1,-3,-6,3,6,-9,-8,10,3,-12,-2,-2,-2),
	    7 => w(13,1,-2,-3,2,-1,4,-12,4,6,-8,6,-7,-15,-1,-2,17,-6,-3,-6,-2,4,-1,-2,1,2,-4,1,-5,1,23,-8,0,4,14,-7,5,14,-16,0,-9,-4,0,7,2,0,3,-34,-1,1,6,-2,9,-9,5,-7,13,-3,0,-8,6,8,-3,-2),
	    8 => w(-4,-15,3,-2,4,3,-1,0,-3,-7,3,-2,-1,0,1,-6,-13,-1,5,8,-1,7,-1,-1,20,-7,-3,4,-12,-3,-5,-11,-2,-2,1,-19,0,7,14,-10,0,6,-6,3,-1,9,-1,-10,4,3,1,1,-3,-2,-3,-2,-1,-8,0,-17,10,3,7,34),
	    9 => w(-1,-12,2,-6,6,-3,-7,-4,0,3,-3,-4,2,10,-2,-7,-8,6,-3,-7,-1,-1,-1,-5,-2,-7,4,17,-6,-4,2,-5,-2,1,1,-3,-2,2,8,9,-1,-7,10,-4,2,3,-3,1,2,-4,7,-9,-16,0,-4,7,0,4,-5,-2,4,9,-3,3),
	    10 => w(-1,-1,-3,5,2,-4,-2,-4,-2,0,0,13,3,2,-3,0,6,7,-2,-1,15,-3,4,3,3,-4,0,15,4,3,1,0,-6,-7,5,0,-4,-6,0,-2,1,-1,-1,1,-1,-5,-3,-6,-2,5,-4,-2,0,1,0,-5,0,-8,7,-1,23,-3,-3,-7),
	    11 => w(-3,1,1,-3,3,-10,6,0,1,-6,-3,-2,-1,1,-2,-6,-3,-6,6,9,3,4,0,-3,8,2,-2,-5,3,1,-2,2,11,19,-4,-27,-5,4,7,-1,-2,-5,8,-5,1,-2,-4,-8,-1,-6,-2,-3,-13,-12,0,18,4,-7,-2,-7,-3,1,-4,-3),
	    12 => w(12,-11,-16,2,-7,4,-4,-5,-3,-9,0,-7,2,-2,1,-6,3,-2,2,9,-6,-4,-3,24,35,-24,2,2,-2,21,-17,10,-5,-2,-14,-6,0,-1,2,-8,2,-3,2,-1,-11,8,-6,8,26,1,-2,4,-4,1,6,1,1,-27,-1,-7,-6,-8,31,14),
	    13 => w(4,3,5,3,10,-4,-7,-26,-22,6,-10,0,0,9,3,15,-6,28,1,-13,-5,-2,5,-2,-4,9,-4,-1,-4,-3,1,-3,0,2,2,-28,-1,-3,-5,3,4,2,-24,7,4,0,-4,0,-5,9,-11,16,-47,-11,5,6,-9,-2,8,-8,18,-6,12,-8),
	    14 => w(1,-2,2,1,-2,-17,-6,-2,-87,-2,3,19,2,-5,2,-1,13,-1,10,9,22,-18,-1,-1,-1,-5,-5,22,31,18,5,-1,3,-13,-4,21,6,-5,7,-3,-7,-3,3,-3,23,-8,5,1,8,5,0,-4,2,-4,5,7,5,-5,5,3,15,0,21,-6),
	    15 => w(2,-19,-2,2,1,-31,-40,-19,-1,-4,5,-2,3,-8,8,-5,0,-3,9,-2,14,4,2,8,21,1,3,-2,7,4,-3,6,12,14,-15,4,3,-19,-8,-2,20,-10,10,7,1,3,3,0,-1,5,-1,-4,-8,-20,-1,9,15,-6,4,-3,-2,3,1,-6),
	    16 => w(3,3,-3,17,-1,3,29,-2,-1,-8,6,-1,-12,-1,8,7,12,3,-19,-7,-5,-2,-34,1,2,1,14,-3,3,14,5,0,4,-16,7,-8,-11,-7,1,-9,5,5,4,-12,-4,-9,-10,-13,3,-3,-19,-7,-9,-6,19,0,0,-3,5,-8,5,-1,-2,-12),
	    17 => w(-6,-5,-7,8,3,-2,-10,-6,5,-1,-8,19,1,-1,15,6,-3,-7,0,-7,3,12,-3,-1,-2,-50,1,-5,0,-5,-2,-5,4,-3,-2,-3,23,12,-2,-5,4,0,-2,4,-1,-2,-10,7,10,12,3,0,3,2,10,1,-12,-1,0,-2,-5,1,0,-2),
	    18 => w(-1,3,-1,4,-4,-2,6,1,0,28,2,-1,3,10,3,10,-1,-4,1,-10,-2,-4,6,-4,21,-8,-4,0,0,-9,3,-2,4,1,-5,3,-2,0,4,-2,-1,13,-3,-4,0,-7,30,3,-9,5,13,-2,-17,7,-8,2,-14,9,5,-9,-2,5,-3,-3),
	    19 => w(4,2,16,-3,2,-3,0,-6,-1,3,3,-43,-1,-8,-5,-1,4,1,-5,4,-10,-2,13,8,-9,-3,6,-5,1,9,-14,-3,4,2,7,3,24,-8,-3,-1,-6,-7,-6,0,-10,1,1,-13,21,-2,-39,21,10,-1,14,-11,-3,7,-1,3,-2,-19,-11,-3),
	    20 => w(34,13,-3,0,-2,0,7,9,-7,-9,-9,-4,-1,-1,0,7,14,11,-7,18,3,12,1,-2,2,5,6,3,-12,1,-29,-3,-11,10,-5,10,-8,-2,0,3,-1,-1,19,-8,-18,-5,1,-5,15,3,0,5,4,1,4,-29,-21,-5,2,-7,-14,-5,-10,-2),
	    21 => w(-2,-1,-2,-3,21,5,1,-4,-13,-11,-3,4,-6,-1,11,-14,-2,5,16,-5,1,5,-3,-6,-2,3,19,-6,5,-7,1,32,-1,-11,3,-5,14,-10,-11,-9,-7,0,4,-1,4,1,8,-1,2,-1,21,15,-3,4,4,-2,-22,-1,6,-28,13,-15,10,-15),
	    22 => w(-1,2,-4,-21,-5,5,11,-22,-36,-8,-15,-7,-9,-25,-5,-3,-16,-1,3,0,-5,-8,-2,-2,-3,3,1,5,-10,56,7,0,-14,-7,-18,-5,12,4,1,0,-13,5,-2,6,-15,-15,1,-7,4,-9,3,-9,2,2,7,6,3,-24,-8,-4,31,-11,12,12),
	    23 => w(-4,-39,-5,-5,-2,16,1,-3,3,0,-4,-1,-7,8,-9,6,1,-6,-10,-6,13,1,-1,9,-17,-4,-3,-1,4,3,8,-13,1,-4,12,-17,8,-35,-1,-1,-18,-13,6,-10,2,4,-1,-18,-8,-14,-1,0,10,-8,-4,-6,-6,-3,-17,22,-10,1,-9,-3),
	    24 => w(-13,10,1,1,-9,-7,0,-21,2,1,2,2,-1,-2,5,0,-2,-1,-3,4,1,-2,0,-10,-1,0,4,6,-5,-2,-2,-6,1,3,-3,3,-3,19,8,7,4,0,-5,-5,13,2,8,5,-23,1,9,1,-16,0,3,-11,-12,3,9,13,-8,3,-7,7),
	    25 => w(4,-12,-7,5,-1,1,6,-5,-3,-3,-10,3,3,-3,-3,0,-7,-8,-19,2,8,7,-4,0,1,0,-10,9,0,6,-2,-16,-2,-7,-3,-20,-6,-3,1,10,1,0,-13,0,-5,3,-6,0,-2,-8,-2,9,0,4,-1,-1,3,-2,-8,-13,-46,-3,5,8),
	    26 => w(-3,-4,-12,-22,-9,7,11,-6,9,-5,2,-3,-3,-1,-2,-2,-7,-5,-1,4,9,-1,-5,-3,4,-2,7,-8,10,11,1,2,-3,12,6,-13,-16,-1,5,-7,7,4,8,-5,-3,-1,11,-1,6,-4,2,-2,0,-1,-1,1,2,-6,3,2,-13,-1,-2,0),
	    27 => w(1,-9,18,10,-3,-7,-2,-11,8,-4,5,6,-7,-9,-13,0,-4,-2,8,6,2,2,4,-2,-5,-2,5,-7,-2,-7,-4,-5,0,5,-1,-2,0,-38,-2,1,-24,5,2,-1,3,-7,-30,-1,6,5,1,2,-2,-2,1,-2,7,1,-1,-32,-3,-6,-1,-11),
	    28 => w(-14,0,-5,-4,-4,0,1,-2,-6,3,3,-1,1,3,0,16,-1,5,-3,0,3,0,4,17,12,4,2,1,17,6,0,0,-6,-3,-9,13,-2,-4,3,-10,3,-20,2,-6,-18,-9,3,-2,-11,3,-4,-4,5,-4,11,-25,31,8,-2,-4,10,-7,-18,4),
	    29 => w(-1,-11,-3,12,-12,-12,-7,15,-4,16,3,-1,1,0,2,13,-4,4,0,-14,0,4,3,1,0,-1,16,-5,-1,-1,6,4,-2,5,4,3,4,-2,0,7,6,4,26,2,-6,-3,-5,4,-15,16,16,17,37,0,0,3,21,-6,1,13,20,15,-7,1),
	    30 => w(8,0,23,-1,2,-4,-7,25,-24,1,6,4,9,17,3,-1,2,8,11,10,20,1,2,19,-2,4,-3,-1,-39,27,-3,1,1,4,-4,0,2,4,0,-1,4,-9,1,-4,15,11,0,8,2,-3,3,-7,2,-3,12,-9,5,-11,12,2,-6,-4,9,13),
	    31 => w(4,-26,-6,5,-3,-14,2,12,-4,1,-4,-1,4,-23,29,6,2,2,18,4,-8,3,0,-7,-2,-7,3,-1,-6,4,5,18,-4,-2,-27,-3,8,-4,0,5,17,1,-2,-9,2,-5,8,-2,0,21,-1,1,13,-16,1,-1,-10,1,-2,-12,8,1,6,10),
	    32 => w(-5,-3,2,13,0,0,0,2,-1,-8,0,-7,-6,5,4,2,-3,0,8,-4,-1,1,-4,0,-2,-4,-1,4,4,-5,-4,5,2,-17,-4,-2,6,-26,-1,-1,-10,1,5,-4,0,3,15,-1,2,-5,18,-7,-35,2,-6,1,-4,-1,17,3,-3,0,-1,-5),
	    33 => w(-7,0,1,2,-3,1,5,0,4,2,2,7,0,0,-3,-4,-5,-5,-18,2,1,-13,-20,-2,-2,-1,-5,5,3,5,1,0,-11,-5,6,-1,6,-78,2,-3,-1,5,-1,-2,8,-1,-3,-2,8,1,-7,-2,-4,-3,0,1,-1,-3,-1,3,0,-6,-2,-10),
	    34 => w(3,-6,3,-5,-5,-4,-10,4,-5,-14,6,-2,-8,-3,2,-5,2,2,0,6,-4,0,8,-1,-3,-2,-26,-4,-2,0,-4,0,-5,-14,1,-2,6,4,-24,-5,1,2,-31,4,-2,3,9,-1,-1,1,-12,1,-2,1,8,22,1,4,-8,7,-2,2,-1,-3),
	    35 => w(-6,-4,3,-4,0,0,-1,3,-4,0,-1,-11,2,-3,0,-1,-5,2,1,13,-7,2,13,1,-8,-1,2,6,0,0,-17,0,1,5,8,4,-10,2,-3,0,2,-4,4,0,-1,2,-3,-2,3,1,-13,6,-8,-2,0,-7,-8,5,1,-4,-1,-5,-1,0),
	    36 => w(-12,-7,3,11,12,-3,-8,11,-4,-26,-9,10,-1,-6,1,4,0,0,-2,0,-1,-1,-10,14,3,4,0,3,3,-36,30,3,1,3,8,3,-25,-4,0,2,-4,-9,-19,-3,2,7,2,-7,-2,-12,1,-6,3,-2,3,6,-14,8,0,8,8,10,-2,0),
	    37 => w(-12,1,3,-13,2,-3,0,5,12,8,-22,-1,12,0,-6,17,15,6,-4,-40,9,6,10,-3,-3,6,3,-1,-2,2,0,14,-3,-11,-2,-8,-7,-3,7,0,8,1,-3,11,-3,-4,-6,2,2,9,-7,1,11,27,-2,6,-11,2,-17,-9,4,9,-7,0),
	    38 => w(9,2,-7,6,-5,0,-3,2,-6,9,9,-3,-1,-3,3,-2,1,-6,3,8,-4,-1,0,9,4,-17,-13,0,0,-8,-11,0,20,7,21,1,4,15,2,-1,-4,3,-11,-7,7,1,-2,-1,6,4,3,2,3,1,5,2,2,9,-1,-3,-3,4,2,-2),
	    39 => w(3,7,0,-1,1,-7,-1,-4,3,7,-52,-5,0,-11,2,-21,9,10,7,-11,35,0,-9,8,0,-4,3,3,0,5,10,9,4,4,3,8,5,4,-13,1,-1,4,-5,-1,3,-1,0,-3,-8,-15,0,-1,-16,1,3,-2,5,1,9,-4,8,-1,-12,0),
	    40 => w(7,1,8,3,0,-2,-5,12,2,-2,-4,0,-8,-3,-5,2,-2,1,0,-2,6,-3,12,2,-1,1,3,0,-6,7,-7,17,13,9,-4,9,7,0,0,-5,1,-2,-9,-1,0,2,-15,-5,9,-3,4,-1,7,1,-10,10,4,3,-12,0,-6,-6,-5,12),
	    41 => w(-12,3,4,-12,-4,0,10,7,1,5,8,5,-10,3,-11,13,-7,1,3,-4,-3,-9,0,-26,8,2,-10,3,9,10,-9,22,-5,23,-10,0,13,3,-5,9,21,6,1,-5,4,7,-4,2,0,-9,0,5,5,7,-3,12,12,1,-6,-2,-11,4,13,-7),
	    42 => w(4,-3,5,0,1,-11,-16,-9,-13,-8,-17,-6,3,9,4,-6,3,20,0,-5,2,10,9,16,4,-10,21,1,1,7,-11,-1,22,7,3,4,2,-1,6,-7,5,3,-18,-2,2,10,-10,3,23,7,1,0,-4,12,17,-2,-17,4,-10,-27,1,5,6,1),
	    43 => w(0,1,3,-8,7,-1,1,12,8,3,8,35,3,24,7,3,2,1,5,14,2,-5,-11,-8,4,0,6,1,-4,-11,20,10,-1,-4,0,3,-9,4,31,0,7,-2,-8,8,2,-1,-1,-7,2,10,-14,4,-6,-5,30,6,-37,-7,4,5,-8,19,7,6),
	    44 => w(-2,9,-1,3,-5,1,4,7,0,-7,-8,-12,7,15,-2,-1,2,-6,-7,1,-3,-8,-5,0,2,4,-4,-7,10,13,12,14,-1,-3,-3,6,0,-4,4,12,5,2,-6,2,2,3,-1,3,2,-8,1,3,5,0,2,-1,0,10,1,2,-4,-3,-8,-9),
	    45 => w(7,-4,-1,-16,-1,4,10,-16,-4,-7,5,-3,0,22,-5,-16,3,-6,-10,2,4,1,-2,-8,0,10,-4,0,-12,1,-7,3,-2,1,2,4,1,-1,-6,-16,-5,-2,-10,3,-1,1,6,2,1,-3,-1,4,2,0,3,-3,-1,-5,12,5,-8,2,-19,-8),
	    46 => w(-5,-1,-3,3,-12,13,1,-4,-5,0,-21,5,-9,0,1,1,8,6,-3,9,5,-6,-1,5,2,2,-7,22,5,2,0,0,0,11,-7,4,-1,6,0,-12,-3,0,3,1,-2,10,4,-4,-4,-3,-5,20,-1,0,-7,-1,-11,7,5,0,-11,1,1,2),
	    47 => w(-2,7,0,1,-1,14,0,-9,3,-2,12,-2,-6,-6,-2,9,-8,-3,-6,-9,-7,-4,4,2,0,-2,-1,-12,5,-1,-6,1,-5,1,4,11,-3,9,0,2,7,5,0,-3,1,4,-4,-4,-10,-1,4,4,-3,0,-9,-2,-13,0,-4,1,-13,6,-2,-3),
	    48 => w(-6,17,-8,5,-8,-1,-6,-7,-9,-6,-4,-1,0,2,0,5,1,1,-8,-2,2,2,5,-12,11,2,2,5,4,14,-5,1,1,2,2,22,7,2,-55,10,7,-16,-4,11,6,-28,-9,11,0,-6,-1,4,-11,-8,0,-16,6,-9,-1,1,-6,-2,14,-15),
	    49 => w(-10,1,-17,8,1,5,-3,9,8,8,1,-2,2,-4,-6,19,-6,-12,-7,11,-4,9,-5,-5,-2,1,0,-2,8,-5,-2,-4,-4,14,-5,12,-3,-8,-50,-16,-4,8,8,3,-9,0,-2,-1,4,4,6,-4,10,-11,3,1,-7,-18,-2,4,-23,13,1,-14),
	    50 => w(-11,1,-18,-3,-1,-8,-4,23,28,2,-10,-1,13,2,-6,-2,17,9,-3,4,-2,-6,-2,-7,0,4,8,4,-10,14,11,-1,-2,-1,-18,-8,1,1,-5,8,-1,3,-1,-7,15,27,-3,-12,1,0,5,-4,-4,-1,3,10,0,-2,11,-5,-8,1,13,4),
	    51 => w(-17,-15,-9,-3,5,22,3,-10,0,5,7,11,1,3,0,4,-37,-13,15,-11,2,-4,-6,4,30,-3,-7,3,-4,0,2,-7,1,-18,-10,14,0,12,6,0,-5,-32,1,-1,-3,1,0,-14,-2,-5,0,-2,-3,-5,-1,-14,-12,-9,-3,-5,-5,-7,-10,-2),
	    52 => w(-4,-9,0,-18,7,0,10,4,-7,-9,1,0,-5,-3,-3,4,-7,-1,-2,-5,2,-1,2,-6,-2,-3,-10,-3,-9,36,-7,0,1,7,7,-4,-7,-6,-7,-8,-8,11,-8,-1,10,8,-1,-8,-61,-14,-7,-5,2,-5,-9,2,34,6,-1,41,16,-20,2,-9),
	    53 => w(0,-1,1,-9,3,0,-3,9,-26,-4,-11,-7,-1,-4,2,-9,5,-15,2,23,-4,-1,0,15,-3,-6,-1,-17,-9,21,4,-8,-4,2,0,13,-5,-3,-8,8,3,9,-3,-4,0,-3,-5,3,4,-6,-10,4,-2,-10,1,8,0,-5,-25,10,11,29,-3,-5),
	    54 => w(-13,2,18,25,5,-7,7,-5,-17,6,-2,-3,8,-4,4,-1,-4,-10,4,-3,-9,2,6,11,2,5,10,-11,-2,9,-11,0,2,-10,9,-2,-15,-2,6,-6,8,8,2,15,-2,-1,13,-5,-2,7,4,-8,0,-3,-4,1,-9,-14,1,-7,-15,2,-4,3),
	    55 => w(1,1,16,-11,-1,-11,-9,-14,1,4,8,-2,0,-13,7,12,-10,0,7,-3,1,-4,-2,-4,-11,2,15,-17,-4,13,8,27,3,-3,10,20,-6,-3,-5,0,-79,-9,-5,5,1,-6,2,-3,3,-13,6,1,-15,4,12,10,27,4,2,-2,7,-3,9,19),
	    56 => w(-3,4,6,5,56,-3,2,1,-3,8,-10,-10,-1,5,2,-5,-5,-4,8,3,0,-1,5,1,1,0,-3,-3,-4,-7,8,-11,-4,7,8,2,3,0,-6,-1,-3,0,2,-2,1,-1,26,7,-2,-3,-6,3,1,0,-8,-2,-1,-8,3,2,3,-2,5,7),
	    57 => w(-10,5,2,-4,1,-3,-5,6,4,2,-5,1,3,-1,3,-8,-6,-5,-3,-3,3,-8,-4,-2,1,4,-3,-3,7,2,13,3,-2,-12,5,3,-49,3,-1,2,0,1,4,2,0,0,0,3,1,-4,-3,-3,-3,-8,3,-4,1,2,-1,-4,0,-5,-24,3),
	    58 => w(-10,-1,1,3,-1,-2,-2,7,3,3,20,3,-3,-4,-2,1,-8,-7,2,8,-2,5,-1,-3,1,-2,-11,-2,-1,-9,-12,1,-12,-6,-5,-6,-4,5,-2,-2,-3,-3,-4,2,4,7,-1,-4,-8,0,-4,6,10,1,1,-3,-14,4,3,6,-9,-1,0,1),
	    59 => w(4,1,1,6,3,-5,-5,1,-3,1,-8,0,-1,-18,-3,0,6,2,2,-12,-2,-1,1,0,5,15,-7,3,-2,-6,-3,-16,4,-3,1,-1,1,-1,-13,1,4,-3,8,2,-2,-1,-3,-7,-4,5,17,-1,-3,2,-1,-1,3,-8,-5,-3,-5,1,-2,-3),
	    60 => w(0,-2,-5,20,-3,0,-1,10,-1,13,-4,-14,3,1,0,-4,0,-1,-4,-1,-1,10,1,-3,31,-2,7,11,6,3,11,-8,0,-3,-5,-2,8,-4,10,2,0,-2,2,3,6,20,-4,1,3,6,2,-3,1,2,3,5,-4,-8,1,-37,-4,4,12,0),
	    61 => w(1,-3,1,10,6,0,9,1,-3,-1,1,3,3,-3,2,-6,-11,-1,-9,8,1,3,1,0,1,8,-1,9,-15,0,14,4,2,7,1,-4,-5,-2,5,-8,3,5,0,-7,3,2,0,2,1,12,9,-5,-3,-1,-1,20,2,0,9,5,-5,-7,-7,-8),
	    62 => w(-6,-1,-1,3,-6,2,7,-6,7,-3,1,14,-5,-3,-4,2,5,0,-2,7,-4,6,3,-1,0,-1,-21,9,4,1,5,1,-2,10,7,-3,0,2,4,-7,-5,5,2,-1,3,3,0,-3,14,2,1,1,-3,-5,-4,-4,-3,7,-1,2,7,-4,-1,-3),
	    63 => w(-1,2,8,0,0,-6,-7,1,-1,-1,-19,-4,0,1,-7,-1,-5,7,-6,1,-4,0,-1,2,4,-2,6,-9,2,-3,-7,5,7,10,3,-5,0,5,4,2,2,1,3,3,0,3,3,13,0,2,2,4,0,-3,-3,-18,3,-6,-2,-5,-3,-7,2,2)
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