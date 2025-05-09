library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv9_core5_rmcm_weightsconstant_memoryROM is
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
end conv9_core5_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv9_core5_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31, w32, w33, w34, w35, w36, w37, w38, w39, w40, w41, w42, w43, w44, w45, w46, w47, w48, w49, w50, w51, w52, w53, w54, w55, w56, w57, w58, w59, w60, w61, w62, w63: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH)) & std_logic_vector(to_signed(w9, XI_WIDTH)) & std_logic_vector(to_signed(w10, XI_WIDTH)) & std_logic_vector(to_signed(w11, XI_WIDTH)) & std_logic_vector(to_signed(w12, XI_WIDTH)) & std_logic_vector(to_signed(w13, XI_WIDTH)) & std_logic_vector(to_signed(w14, XI_WIDTH)) & std_logic_vector(to_signed(w15, XI_WIDTH)) & std_logic_vector(to_signed(w16, XI_WIDTH)) & std_logic_vector(to_signed(w17, XI_WIDTH)) & std_logic_vector(to_signed(w18, XI_WIDTH)) & std_logic_vector(to_signed(w19, XI_WIDTH)) & std_logic_vector(to_signed(w20, XI_WIDTH)) & std_logic_vector(to_signed(w21, XI_WIDTH)) & std_logic_vector(to_signed(w22, XI_WIDTH)) & std_logic_vector(to_signed(w23, XI_WIDTH)) & std_logic_vector(to_signed(w24, XI_WIDTH)) & std_logic_vector(to_signed(w25, XI_WIDTH)) & std_logic_vector(to_signed(w26, XI_WIDTH)) & std_logic_vector(to_signed(w27, XI_WIDTH)) & std_logic_vector(to_signed(w28, XI_WIDTH)) & std_logic_vector(to_signed(w29, XI_WIDTH)) & std_logic_vector(to_signed(w30, XI_WIDTH)) & std_logic_vector(to_signed(w31, XI_WIDTH)) & std_logic_vector(to_signed(w32, XI_WIDTH)) & std_logic_vector(to_signed(w33, XI_WIDTH)) & std_logic_vector(to_signed(w34, XI_WIDTH)) & std_logic_vector(to_signed(w35, XI_WIDTH)) & std_logic_vector(to_signed(w36, XI_WIDTH)) & std_logic_vector(to_signed(w37, XI_WIDTH)) & std_logic_vector(to_signed(w38, XI_WIDTH)) & std_logic_vector(to_signed(w39, XI_WIDTH)) & std_logic_vector(to_signed(w40, XI_WIDTH)) & std_logic_vector(to_signed(w41, XI_WIDTH)) & std_logic_vector(to_signed(w42, XI_WIDTH)) & std_logic_vector(to_signed(w43, XI_WIDTH)) & std_logic_vector(to_signed(w44, XI_WIDTH)) & std_logic_vector(to_signed(w45, XI_WIDTH)) & std_logic_vector(to_signed(w46, XI_WIDTH)) & std_logic_vector(to_signed(w47, XI_WIDTH)) & std_logic_vector(to_signed(w48, XI_WIDTH)) & std_logic_vector(to_signed(w49, XI_WIDTH)) & std_logic_vector(to_signed(w50, XI_WIDTH)) & std_logic_vector(to_signed(w51, XI_WIDTH)) & std_logic_vector(to_signed(w52, XI_WIDTH)) & std_logic_vector(to_signed(w53, XI_WIDTH)) & std_logic_vector(to_signed(w54, XI_WIDTH)) & std_logic_vector(to_signed(w55, XI_WIDTH)) & std_logic_vector(to_signed(w56, XI_WIDTH)) & std_logic_vector(to_signed(w57, XI_WIDTH)) & std_logic_vector(to_signed(w58, XI_WIDTH)) & std_logic_vector(to_signed(w59, XI_WIDTH)) & std_logic_vector(to_signed(w60, XI_WIDTH)) & std_logic_vector(to_signed(w61, XI_WIDTH)) & std_logic_vector(to_signed(w62, XI_WIDTH)) & std_logic_vector(to_signed(w63, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(-1,1,2,42,12,8,-6,17,0,-5,8,13,0,6,2,-7,3,-6,-1,5,6,9,3,0,-30,-1,-1,-5,1,-2,2,-3,-2,9,-6,8,1,2,5,3,0,6,-2,18,5,0,-14,4,-1,3,-2,8,-2,11,-8,5,-11,-6,-1,2,4,-2,4,2),
	    1 => w(11,8,-2,-12,1,9,-1,-1,2,2,2,0,8,-1,1,1,5,-3,-14,1,2,0,-21,-3,1,4,-1,8,-7,4,0,1,-4,-19,-2,2,25,0,2,-1,4,4,32,2,-1,-2,4,0,1,-17,-12,-7,2,6,-10,-3,-2,-1,-20,1,-4,-16,10,6),
	    2 => w(0,0,-3,0,3,1,2,7,-25,-7,10,-2,3,-6,-9,-1,0,-2,0,-8,3,21,-5,-11,4,2,4,4,0,3,-9,-25,11,3,-2,1,0,15,0,13,-4,-2,1,-1,-8,-12,-11,1,-13,-4,4,-14,-3,6,-5,-1,-1,-6,9,3,1,6,-5,4),
	    3 => w(-12,-4,0,0,19,6,8,-7,-47,4,-2,-1,6,-13,-3,11,-11,-8,-48,-2,-3,5,4,-4,0,-2,19,2,7,3,0,8,0,2,38,1,-2,4,13,-5,6,-23,-1,4,10,2,-4,14,-3,9,0,-1,2,15,-2,-4,17,-1,4,1,0,-4,11,-3),
	    4 => w(-1,0,-16,11,7,2,-15,11,3,3,11,9,3,-5,-16,-6,7,-5,2,10,-24,1,3,-4,25,5,-11,2,2,-3,6,6,-7,4,-2,6,2,0,15,-8,3,-7,3,3,8,0,-4,-14,-2,2,5,-8,-2,-4,1,-7,-23,-14,3,-8,0,2,2,-11),
	    5 => w(6,5,-5,-5,2,-9,-6,2,8,-3,-2,0,1,-1,2,-1,0,-5,2,-8,5,-3,5,5,3,-3,-1,-27,-2,0,-1,-6,-3,10,-12,-1,23,3,14,-3,-10,-2,-3,-1,-8,-2,-11,-5,12,-4,5,-6,-8,7,4,-25,-7,7,-6,2,10,25,11,8),
	    6 => w(1,-1,-4,3,6,6,-3,1,5,-1,-8,-3,0,-3,-4,-2,1,-1,0,8,3,-23,-4,-1,5,-3,0,-4,4,14,13,11,-1,-5,-4,-12,8,-15,-6,9,1,0,1,-9,-8,-17,4,3,-4,2,3,-3,-1,-32,4,-2,-13,-2,-10,-3,14,0,-9,-2),
	    7 => w(-5,0,6,2,-1,-7,0,13,12,-2,-2,6,9,3,5,-4,-2,0,46,2,-1,-3,7,-1,0,-2,-11,-1,-1,-2,0,-5,-19,-5,26,4,8,-1,14,53,-10,-7,-3,-11,-1,0,-2,1,3,11,13,3,5,-17,6,15,-6,9,-1,3,1,-4,1,-1),
	    8 => w(81,-16,8,3,0,1,4,-1,2,2,-3,17,-17,-9,2,0,1,3,4,3,5,-1,1,1,1,2,-2,-2,4,40,3,-4,-43,2,0,45,1,0,-6,2,-2,1,1,1,-2,0,1,19,14,-2,-24,2,-39,4,-3,-5,1,4,-5,7,0,-7,-2,37),
	    9 => w(11,7,-1,0,51,-6,-4,1,3,3,-10,55,1,-16,1,-7,0,2,-2,1,1,-2,4,-3,4,2,2,9,6,-3,-16,4,0,2,0,-1,-2,2,-63,-25,-1,-2,-2,2,62,4,-2,-4,-3,-6,-1,-6,-6,-5,-1,0,15,-1,5,33,1,-2,2,4),
	    10 => w(3,-3,9,6,-4,1,1,2,1,4,5,0,3,1,-8,56,12,-1,1,-9,-4,0,0,-3,-8,-58,-4,20,-1,-4,-1,-1,-5,-24,3,41,2,31,-22,-5,4,48,-23,-4,-1,-1,3,3,-45,-1,-3,-3,16,-2,8,-2,-4,2,-1,-1,-5,-1,-33,3),
	    11 => w(17,-5,-27,1,5,-3,16,0,2,3,-17,1,1,2,3,-1,0,0,0,11,1,5,-2,8,4,-1,1,-1,-1,1,-4,-5,-3,2,-2,30,-5,0,-3,-2,16,-2,-11,3,-4,1,5,-1,20,3,-30,-3,-1,6,3,4,-8,-1,-3,5,5,-7,-2,3),
	    12 => w(2,3,-1,0,7,6,-8,6,-1,3,-6,-3,-2,4,0,-2,8,12,-3,0,-7,-1,-2,-4,29,0,-5,-1,9,-5,9,3,-11,5,3,2,1,-9,7,1,-13,3,-5,6,1,-1,4,-5,1,-5,-2,1,1,0,0,1,-21,-16,-1,2,0,-2,-1,-4),
	    13 => w(8,2,-3,2,3,11,10,-1,6,4,-2,-2,-5,-1,-14,0,-6,1,1,0,3,5,-9,11,2,4,-1,1,3,0,2,29,-3,-15,2,-2,10,-4,10,-2,1,-8,33,-2,-3,-7,-3,2,-4,-10,-10,-3,1,-3,1,4,-4,5,-23,2,6,-12,10,1),
	    14 => w(5,-1,-5,-1,-12,5,-2,16,0,-4,-8,-15,0,-4,0,0,0,-2,0,-1,6,8,11,2,6,-1,0,4,3,4,2,-35,3,-4,-2,1,3,-3,-1,1,-7,0,0,17,-5,11,-2,-5,3,2,-2,-19,-1,-15,-11,-3,-8,0,-2,2,0,1,-1,-5),
	    15 => w(-13,-3,-1,-2,-15,2,-5,6,-14,6,0,-7,-7,15,1,-4,-3,-8,-22,2,5,-2,5,5,1,-5,12,2,5,9,1,24,5,-7,10,2,6,8,-6,8,-2,-5,0,10,-2,-1,-3,13,-2,13,6,1,-1,-7,6,20,7,2,5,5,-3,10,-5,2),
	    16 => w(0,-2,-4,-10,-2,-5,1,-24,3,0,16,-4,4,-4,-2,10,14,1,1,-11,1,12,-6,0,31,0,-7,-2,6,4,13,-1,-1,3,1,-5,15,-16,-8,-1,-7,-2,-12,-14,-4,-2,1,-4,-2,-16,0,-5,-4,-5,4,-4,-19,11,2,0,1,0,1,-1),
	    17 => w(-7,0,8,2,0,-26,-3,1,2,2,-4,0,-1,0,-9,5,-2,0,-19,-1,2,0,10,8,2,-1,2,-2,7,-3,-2,-19,0,-13,-8,0,36,-13,-1,0,-2,-1,-17,-3,1,-7,-6,4,1,0,-19,45,5,-18,8,4,1,-1,15,0,9,-1,24,-8),
	    18 => w(4,0,1,0,-3,-1,-4,-6,47,8,7,-11,0,4,0,1,1,0,2,2,1,-15,21,13,-21,-1,-4,3,-2,-6,8,2,3,-1,1,0,2,5,-1,-7,-5,2,-1,2,5,38,2,29,0,3,-1,5,-1,0,-3,-5,5,3,-12,-1,0,-1,-1,6),
	    19 => w(0,-5,0,1,-19,-4,4,-2,0,-2,1,-17,1,-7,2,5,-2,14,30,4,0,4,4,4,0,-1,3,-1,-3,-3,0,1,44,3,-8,-3,20,23,-13,3,0,49,2,3,-3,0,7,2,-1,3,-2,9,1,8,-2,6,1,1,-4,-2,2,5,-5,0),
	    20 => w(-5,-1,-7,5,-1,14,9,13,-6,-6,-2,9,-4,-2,1,-9,-14,16,-1,6,6,-7,6,-1,-28,-1,7,-4,-1,-6,-19,3,-12,-3,1,6,0,22,-3,-1,13,1,3,-6,4,0,-16,5,3,24,1,4,2,8,-7,5,3,-10,3,-7,0,-2,0,-2),
	    21 => w(0,7,7,3,0,20,7,1,-4,3,6,-1,-7,-4,3,4,0,-2,24,1,-2,-3,-9,-6,0,-2,-3,6,3,0,2,22,3,0,17,1,13,1,3,-2,0,-8,16,-1,-2,10,2,-1,5,-4,-1,0,0,-14,-7,11,0,2,13,-2,-6,28,0,6),
	    22 => w(-9,2,3,-2,19,3,4,-4,-46,-5,1,8,1,2,-4,1,1,-33,3,2,0,21,-26,-16,17,-3,5,-5,1,-8,3,-4,2,-1,-2,-1,-1,12,2,-3,4,0,-2,9,-3,-42,-2,-23,-1,-3,3,1,0,-6,-13,-1,3,1,1,4,19,1,2,-12),
	    23 => w(-5,14,-3,-3,4,6,-8,5,5,0,1,23,-7,17,1,-18,8,-1,-14,-3,-7,1,-5,11,1,0,-2,1,-1,-6,-2,6,-3,1,-13,0,-29,-16,-3,-2,-11,-7,-4,15,-4,2,-3,0,2,-3,9,-11,0,-2,3,-7,-52,-2,-1,3,2,19,0,-2),
	    24 => w(1,1,1,8,16,-6,-17,5,-3,7,25,2,-2,3,-2,-10,1,-4,2,6,-1,8,1,0,-8,-2,-12,0,-2,-2,6,3,0,1,-1,0,-4,2,4,-2,1,-1,-23,-5,3,-3,-1,1,3,7,1,4,2,-4,2,0,-48,-19,0,0,0,1,2,0),
	    25 => w(-2,2,-12,3,-2,-1,5,1,-3,-1,-2,-2,10,1,1,0,2,1,9,-4,3,0,-7,13,0,3,0,16,-3,1,0,37,0,18,4,2,-5,-3,5,0,-11,-2,1,3,0,-6,-4,0,2,-5,0,-10,4,-1,9,8,-2,1,23,0,2,-18,14,1),
	    26 => w(4,-2,-3,2,13,5,-1,-2,-5,-1,-1,-16,0,6,2,0,-1,5,2,-4,0,8,3,1,10,1,-3,2,1,-1,0,-1,5,0,-3,-2,-1,4,1,4,1,1,0,4,-5,-44,-8,4,0,1,2,-10,2,-5,-5,0,12,1,1,8,-1,2,2,-2),
	    27 => w(0,0,-1,2,8,2,2,-2,10,2,1,5,2,43,6,-17,1,14,55,-4,-1,0,0,-1,-1,-8,2,-1,-1,-4,1,5,4,-2,1,1,-2,6,-2,34,2,-25,0,6,1,-3,0,4,-1,0,0,2,-1,1,3,0,9,0,2,1,-3,-6,4,-2),
	    28 => w(1,-1,7,-12,-10,-9,-6,4,3,3,-1,-4,-1,-8,-2,-6,1,7,0,-1,-12,5,7,-1,-7,1,2,0,-4,2,0,2,9,-13,2,-1,-4,6,-24,-1,6,0,-2,7,-6,-1,0,2,3,1,0,-4,1,10,4,-1,1,4,2,-1,0,-5,-1,2),
	    29 => w(1,-22,-9,-25,1,-5,12,1,-2,-3,1,1,2,1,15,-2,8,-3,16,-1,-2,-8,3,-2,-4,1,0,-6,23,-6,0,-12,4,13,18,-3,-11,33,6,1,-3,12,12,3,-2,3,-1,2,12,1,2,-2,-13,13,-2,15,3,-3,8,7,-3,-13,-13,0),
	    30 => w(2,-6,-6,4,9,0,3,15,5,10,15,-1,0,-6,1,-1,-2,-6,-1,2,2,0,2,-1,5,6,4,7,-1,7,-4,-15,-3,2,3,2,-6,16,1,6,3,-2,1,-18,5,-2,2,4,2,-2,3,2,4,-6,-4,-1,10,-1,5,0,10,-6,6,14),
	    31 => w(4,-5,2,0,42,-1,-2,9,19,-2,0,14,-1,-4,1,-1,3,-8,3,6,6,6,2,-5,-1,0,-9,-3,-2,-5,1,-13,12,6,-35,5,3,-6,10,4,7,-7,3,1,9,-1,1,-2,4,-10,-13,3,-2,9,-3,-4,0,-1,1,-2,2,-1,6,-2),
	    32 => w(1,1,-14,46,-1,15,12,-5,-1,-7,7,5,4,5,-7,2,-1,-25,-6,2,10,5,20,-3,-5,-6,9,7,7,-2,5,2,11,12,-1,3,6,-7,1,5,-3,1,9,8,2,-2,-9,-6,5,-3,-6,4,-12,-1,0,0,-4,20,8,28,1,-7,-5,5),
	    33 => w(8,-1,2,13,22,-8,-22,-2,2,-7,-5,5,11,-3,-22,3,-3,3,1,-1,2,17,-1,-3,-4,-5,6,-7,-5,-25,-5,-4,-6,-11,-5,-1,6,-12,-1,1,3,-15,2,-2,-4,-4,-5,3,-33,-2,-15,10,27,-68,-1,-14,-5,9,-4,2,3,0,12,3),
	    34 => w(-6,-10,10,3,19,5,-11,-1,-34,37,3,-2,-5,2,-3,1,3,6,-4,-2,-4,1,-8,-7,-16,4,6,1,0,8,-6,14,10,1,-7,1,2,-4,4,11,-5,-2,0,-3,8,0,-10,10,4,-10,0,-2,6,-6,-3,3,-1,-15,-7,-5,19,15,-15,-9),
	    35 => w(5,-5,-2,5,-9,-4,-6,-17,-15,-16,1,-1,13,-4,-1,-5,8,2,4,-14,-3,-13,-6,19,-8,1,3,6,4,23,0,-27,13,-6,6,4,-11,5,3,-13,-2,-12,-5,-2,-9,2,-7,-19,-6,4,-1,-1,-3,-2,8,7,8,-1,-15,-7,-7,7,-7,-7),
	    36 => w(-12,4,-7,-3,-4,-1,-7,-1,1,-4,4,-2,8,-11,1,-3,-3,2,3,0,0,-3,-1,5,1,-1,3,3,-1,-7,0,-2,25,-9,-1,-3,0,1,8,1,2,1,3,0,2,-2,0,4,-3,0,5,1,2,-1,-2,0,2,7,-22,5,1,-12,-1,-3),
	    37 => w(-3,-8,1,-9,12,2,-7,1,-4,3,0,-5,-2,2,2,17,0,1,-4,0,3,2,2,-2,0,-1,-2,-3,-4,-3,1,-3,-2,10,-2,4,1,0,-4,5,-2,-22,1,-3,6,1,-44,2,0,2,1,8,-13,0,-1,-4,0,-4,0,0,4,-7,4,1),
	    38 => w(1,37,-5,28,4,1,2,2,20,1,-6,-1,0,-2,8,6,4,2,-1,1,3,-3,1,2,-2,-19,-2,10,1,1,2,19,5,3,-2,-13,0,22,3,-1,-1,21,6,-4,-2,-2,-1,-4,4,-4,-3,18,3,-4,-5,-2,-4,-4,-1,0,-1,-5,-3,3),
	    39 => w(-3,-4,2,18,-6,-2,0,-8,-12,-1,-2,0,5,-1,1,7,-2,4,3,-4,1,-5,2,-6,3,0,0,0,-1,0,-5,-1,0,-3,-2,5,0,0,8,-12,6,6,17,-2,4,0,-4,5,77,-4,4,4,-2,8,-4,6,-2,-8,0,-1,14,2,3,13),
	    40 => w(0,8,-5,-9,1,1,-12,-6,-5,10,9,32,19,-1,0,-2,9,21,7,-2,12,3,-5,-5,-9,-2,-2,4,4,-6,0,3,-4,-12,-13,6,-4,8,-2,-11,-1,6,-5,-21,-1,-1,2,15,-3,-1,26,-9,29,-12,2,-2,-7,-13,21,3,0,0,-1,1),
	    41 => w(-16,28,-3,-12,34,20,3,0,10,3,-17,-7,-21,-6,2,27,2,-3,12,5,-1,-9,6,1,0,4,-28,10,-2,10,23,-22,6,17,48,-3,-36,20,7,-5,1,20,-2,5,8,5,-9,-2,2,-2,-3,26,-20,6,-3,-11,2,-19,-4,3,-10,-43,-7,-5),
	    42 => w(6,22,-15,15,-16,-3,3,-1,3,-11,0,-2,13,-3,-2,4,25,1,0,3,1,-1,7,9,-26,-7,-1,4,2,4,3,-13,1,-3,-5,-3,2,-33,-14,-4,1,33,2,14,-7,14,8,9,36,4,4,-21,0,3,9,13,23,-4,16,10,-1,-15,-25,-3),
	    43 => w(10,0,5,-5,13,5,5,13,-4,8,11,2,11,-1,-9,-1,-2,-3,4,17,-3,5,1,-12,13,-2,3,-6,0,-6,5,34,-1,4,-5,6,24,0,-2,4,-8,-13,26,4,5,2,1,5,12,2,-8,2,-3,13,3,5,-8,4,13,9,30,-5,6,-8),
	    44 => w(1,2,-2,-9,-7,4,5,10,1,1,-12,1,3,6,2,2,-6,-16,-6,4,-6,1,1,-5,-15,1,1,-4,1,-1,1,0,1,0,2,-2,4,-13,-6,-1,-6,5,-2,-4,0,1,1,-2,0,0,-1,18,-1,1,-1,10,3,-6,4,0,1,-1,2,3),
	    45 => w(3,7,0,-2,0,0,8,-3,-4,0,12,0,5,-1,1,0,3,-5,3,-1,2,6,-5,-1,1,0,3,-4,4,-3,3,7,-3,10,6,2,-11,11,0,0,5,-10,-1,-6,0,-2,2,0,2,-18,1,-3,-6,14,-4,-9,4,-3,-12,-1,-14,16,6,2),
	    46 => w(0,-1,-4,0,28,2,0,1,-7,-4,12,-2,3,9,7,0,2,-2,-3,1,5,30,5,-6,2,-2,-7,-4,-1,5,-10,10,3,-3,2,-1,-1,2,1,-5,-11,-1,-1,-5,2,5,-24,3,3,-1,-1,11,-5,21,-3,-7,6,2,-5,-1,25,-3,3,-1),
	    47 => w(-5,-9,1,-4,-10,3,0,-6,6,0,0,-1,-6,6,-5,-1,0,0,-37,-16,-4,0,-8,13,1,-1,3,-3,3,-7,1,0,1,3,-8,0,-13,2,2,-15,6,3,0,-6,-1,1,2,1,-4,-3,1,7,-1,-7,-1,-4,3,1,-7,-1,1,13,-6,2),
	    48 => w(4,0,-12,-24,-14,1,15,6,-2,-2,-7,-6,-6,6,7,15,-7,-3,-5,4,-1,-8,1,4,-27,1,18,0,9,0,-2,0,-8,-8,6,-8,-1,-4,-14,-2,-4,-4,21,-6,-4,6,3,-5,0,-17,2,-10,-3,-4,5,-5,48,9,0,0,0,-2,3,-3),
	    49 => w(6,4,11,-10,-3,5,1,0,-3,2,-7,-3,-6,0,8,-4,-3,-5,15,0,-5,-2,-19,-17,0,3,-5,-3,2,-4,-4,-30,1,12,4,-3,-24,6,5,-2,8,-14,-11,-2,-5,12,2,-2,2,-1,5,-17,-3,-1,-2,0,6,4,7,3,-5,36,-9,-4),
	    50 => w(-2,-2,-2,3,-1,-1,-2,-7,7,-7,-17,8,-1,4,8,-1,-2,-26,-4,13,-1,-18,4,-4,-26,1,5,1,2,-1,-4,0,-9,-1,-1,2,3,5,0,5,-2,1,0,7,8,25,4,-4,9,4,-5,58,-1,38,-20,0,1,2,-7,-3,10,-1,0,2),
	    51 => w(2,5,1,-4,-25,-6,-3,3,-7,4,2,14,-23,-40,-3,25,-6,4,8,6,-11,0,-3,22,-1,8,3,-2,-1,8,-1,-14,-1,3,44,1,4,-6,-29,-6,11,-13,-1,-1,-4,1,-1,-18,-1,3,3,3,-6,-6,-2,4,-50,-1,-7,7,2,31,0,4),
	    52 => w(4,-3,-2,-3,1,-10,-10,-4,3,6,-3,2,0,7,-6,-3,2,46,3,-2,5,1,-2,-22,14,0,0,12,-6,1,-10,2,-3,2,2,-9,3,0,18,-6,0,-2,-14,-10,-3,16,4,-4,2,-2,0,-1,-1,0,-4,1,5,-2,-2,-10,0,1,-2,-4),
	    53 => w(-3,-4,7,3,-1,-5,-11,1,-7,1,3,0,-19,0,18,-1,1,6,3,0,0,-1,-15,2,1,1,5,1,1,3,2,-9,-4,2,-2,-3,-18,-3,2,0,-20,13,7,-1,-1,3,2,-4,-4,-4,4,1,-9,1,-1,-8,-1,1,-5,1,-3,8,-9,-2),
	    54 => w(5,1,-8,0,-7,-2,2,12,-13,-1,-11,2,2,0,16,-2,-2,-2,6,-6,7,-1,21,2,-2,2,2,11,2,2,1,2,-8,1,2,1,1,9,-1,7,0,0,-1,0,-2,3,9,1,7,1,-1,-11,-4,10,10,-2,12,-2,1,10,-7,3,0,11),
	    55 => w(0,-4,-3,4,-1,6,6,7,2,10,0,-16,-5,-6,1,3,-1,5,-4,4,-6,-1,7,-19,1,-7,1,0,-4,0,-2,0,-11,4,-3,-4,15,0,2,-1,-9,-16,0,10,5,0,-3,4,-3,0,-15,2,1,2,-6,-4,-10,-3,8,3,1,-6,5,0),
	    56 => w(0,2,-10,27,-3,6,-2,0,-1,1,2,7,-3,-2,2,-3,1,-9,-7,-20,2,2,-2,-3,1,0,0,3,1,1,-7,2,7,2,3,-6,28,5,-17,1,1,2,-11,-22,0,0,-15,1,0,-5,-4,0,-3,-10,-2,-1,-7,8,-3,4,0,0,0,-1),
	    57 => w(-2,-4,8,0,-4,-3,-13,-1,1,-1,-9,-1,-4,-2,4,1,1,-5,-10,1,0,4,-5,-1,2,-2,-2,-6,0,4,-6,-2,-4,75,-13,-2,-41,-15,0,1,1,-22,-21,-1,0,-2,-13,-5,3,6,-16,-107,4,-19,-5,-3,-1,0,21,-1,3,-13,-12,-3),
	    58 => w(-2,14,-2,-5,3,2,-3,-9,0,5,3,0,-1,1,4,0,1,-2,-2,5,-3,-7,1,1,-5,-1,2,2,2,-1,2,2,-3,0,-1,0,0,-1,0,-15,-6,-3,2,2,7,-8,3,-6,-3,1,-1,1,12,-4,-9,-4,-15,-4,-2,-9,-5,2,3,2),
	    59 => w(-2,-5,-1,0,-38,2,-11,4,2,0,0,-16,1,-8,-1,8,0,5,-1,5,-32,0,1,0,-3,0,-2,-4,-1,-3,1,-6,10,1,-33,-3,-4,1,-14,-10,-1,46,3,-3,-2,0,-2,-5,-8,4,-7,2,0,1,-18,1,-10,-3,1,1,5,-11,0,-1),
	    60 => w(3,1,3,-6,2,0,-8,1,4,2,-7,9,-3,1,-2,-2,6,-14,2,2,1,3,-1,-16,3,0,0,14,-8,0,3,-1,2,-5,-1,-5,-2,-4,-5,-1,0,1,-8,0,-4,9,10,-7,-1,0,0,-1,-2,0,1,-1,3,-3,5,-2,0,0,1,0),
	    61 => w(6,-2,-8,-1,4,-18,12,2,-1,2,3,-2,17,0,-6,-2,5,2,5,-1,-2,-10,16,-1,1,1,-1,2,-3,5,1,-8,-2,10,4,-2,-21,7,2,0,-6,5,2,0,1,-1,2,0,-18,-12,0,-1,-7,-8,1,-10,-1,0,-12,0,-4,-7,-6,-6),
	    62 => w(4,3,-3,1,-2,-1,2,21,-4,-13,5,-1,-1,0,3,0,-1,14,8,-6,2,-7,6,5,1,1,1,3,-2,0,-2,-10,2,4,-1,3,-6,6,-4,0,-5,-1,1,1,3,7,-2,1,-6,6,0,-22,6,4,2,-1,7,8,9,1,12,-2,1,-14),
	    63 => w(1,0,1,-1,19,1,-3,-6,4,-1,-1,-1,-2,-5,-2,4,0,-6,-2,1,2,-3,5,-9,1,2,0,-3,4,-1,0,3,5,1,3,-3,23,-2,6,-6,5,-5,1,-8,5,-2,0,1,5,3,-4,8,-1,0,-6,4,15,1,5,1,2,-8,-1,1)
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