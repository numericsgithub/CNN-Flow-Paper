library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv11_core11_rmcm_weightsconstant_memoryROM is
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
end conv11_core11_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv11_core11_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31, w32, w33, w34, w35, w36, w37, w38, w39, w40, w41, w42, w43, w44, w45, w46, w47, w48, w49, w50, w51, w52, w53, w54, w55, w56, w57, w58, w59, w60, w61, w62, w63: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH)) & std_logic_vector(to_signed(w9, XI_WIDTH)) & std_logic_vector(to_signed(w10, XI_WIDTH)) & std_logic_vector(to_signed(w11, XI_WIDTH)) & std_logic_vector(to_signed(w12, XI_WIDTH)) & std_logic_vector(to_signed(w13, XI_WIDTH)) & std_logic_vector(to_signed(w14, XI_WIDTH)) & std_logic_vector(to_signed(w15, XI_WIDTH)) & std_logic_vector(to_signed(w16, XI_WIDTH)) & std_logic_vector(to_signed(w17, XI_WIDTH)) & std_logic_vector(to_signed(w18, XI_WIDTH)) & std_logic_vector(to_signed(w19, XI_WIDTH)) & std_logic_vector(to_signed(w20, XI_WIDTH)) & std_logic_vector(to_signed(w21, XI_WIDTH)) & std_logic_vector(to_signed(w22, XI_WIDTH)) & std_logic_vector(to_signed(w23, XI_WIDTH)) & std_logic_vector(to_signed(w24, XI_WIDTH)) & std_logic_vector(to_signed(w25, XI_WIDTH)) & std_logic_vector(to_signed(w26, XI_WIDTH)) & std_logic_vector(to_signed(w27, XI_WIDTH)) & std_logic_vector(to_signed(w28, XI_WIDTH)) & std_logic_vector(to_signed(w29, XI_WIDTH)) & std_logic_vector(to_signed(w30, XI_WIDTH)) & std_logic_vector(to_signed(w31, XI_WIDTH)) & std_logic_vector(to_signed(w32, XI_WIDTH)) & std_logic_vector(to_signed(w33, XI_WIDTH)) & std_logic_vector(to_signed(w34, XI_WIDTH)) & std_logic_vector(to_signed(w35, XI_WIDTH)) & std_logic_vector(to_signed(w36, XI_WIDTH)) & std_logic_vector(to_signed(w37, XI_WIDTH)) & std_logic_vector(to_signed(w38, XI_WIDTH)) & std_logic_vector(to_signed(w39, XI_WIDTH)) & std_logic_vector(to_signed(w40, XI_WIDTH)) & std_logic_vector(to_signed(w41, XI_WIDTH)) & std_logic_vector(to_signed(w42, XI_WIDTH)) & std_logic_vector(to_signed(w43, XI_WIDTH)) & std_logic_vector(to_signed(w44, XI_WIDTH)) & std_logic_vector(to_signed(w45, XI_WIDTH)) & std_logic_vector(to_signed(w46, XI_WIDTH)) & std_logic_vector(to_signed(w47, XI_WIDTH)) & std_logic_vector(to_signed(w48, XI_WIDTH)) & std_logic_vector(to_signed(w49, XI_WIDTH)) & std_logic_vector(to_signed(w50, XI_WIDTH)) & std_logic_vector(to_signed(w51, XI_WIDTH)) & std_logic_vector(to_signed(w52, XI_WIDTH)) & std_logic_vector(to_signed(w53, XI_WIDTH)) & std_logic_vector(to_signed(w54, XI_WIDTH)) & std_logic_vector(to_signed(w55, XI_WIDTH)) & std_logic_vector(to_signed(w56, XI_WIDTH)) & std_logic_vector(to_signed(w57, XI_WIDTH)) & std_logic_vector(to_signed(w58, XI_WIDTH)) & std_logic_vector(to_signed(w59, XI_WIDTH)) & std_logic_vector(to_signed(w60, XI_WIDTH)) & std_logic_vector(to_signed(w61, XI_WIDTH)) & std_logic_vector(to_signed(w62, XI_WIDTH)) & std_logic_vector(to_signed(w63, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(15,-14,-3,2,1,-4,-2,5,5,-15,-3,3,5,-4,1,-3,-2,1,1,-1,-3,3,0,6,-16,1,-6,0,-4,18,-20,4,1,-1,-9,-9,-10,6,3,1,0,-1,-9,-7,-7,-1,-3,3,-16,1,1,-6,-6,-3,-3,8,-10,-2,2,-4,-10,-18,28,-11),
	    1 => w(-8,3,5,-8,-3,-3,-11,-5,-14,-1,-26,-1,1,7,2,-5,1,-2,-1,-6,2,12,-2,3,-2,-1,-8,-8,5,4,4,1,1,3,1,-18,0,-10,5,-12,-1,-2,-7,-7,4,-4,2,-1,2,12,-19,-14,12,-3,1,-4,-6,-12,-4,-31,24,-34,6,-23),
	    2 => w(1,1,-11,2,-1,-5,-4,4,-14,-8,2,13,-10,-11,6,1,13,1,-1,5,7,-15,-1,0,-2,-4,1,23,26,24,0,-1,5,-2,-19,1,0,-6,4,-4,-36,-3,-4,3,7,5,-1,-8,-2,4,6,-2,-1,3,3,-3,2,-6,-7,-2,8,5,-11,-6),
	    3 => w(-1,-38,-11,-4,3,-6,5,-1,2,3,-14,1,-2,-50,-11,-3,3,20,7,-6,10,-5,1,-1,-2,1,2,0,4,-1,4,-1,14,-8,4,1,-2,-43,-11,-3,-21,-4,-17,-10,6,2,-8,10,-1,-27,-6,-1,-1,-22,2,6,-3,-1,0,16,6,-9,-7,9),
	    4 => w(-3,5,30,3,-2,-3,0,0,1,-8,2,2,-1,-5,-5,-1,10,0,2,12,0,-6,0,-5,9,1,-5,0,-1,4,-4,14,-5,0,-6,10,-4,-3,-38,26,-1,0,-5,-2,-1,-1,-4,-13,4,-7,-2,7,2,-3,-5,1,-6,8,-1,-9,-3,-9,-13,-17),
	    5 => w(15,-4,2,-19,1,5,-6,38,8,1,-5,-7,-3,13,-3,-3,2,8,0,-5,-5,1,-5,-5,0,0,12,2,7,1,-4,-2,0,-6,2,-7,-3,-5,9,1,-5,-7,-16,3,2,0,-2,4,-2,-3,-1,3,-4,-4,-2,-3,-1,-17,4,-3,-4,7,-6,1),
	    6 => w(-2,2,1,0,-4,3,6,-1,4,1,-3,3,5,-24,6,1,13,14,-4,-5,32,-10,0,-4,-2,-4,-6,12,6,-2,-2,2,-7,13,-10,-16,2,2,1,-4,-8,-7,-9,0,-3,1,-4,-3,-8,-8,0,-4,0,-1,6,-5,1,2,6,-2,-8,11,3,3),
	    7 => w(-18,2,1,1,-5,20,22,10,2,-11,1,0,-3,-12,-5,5,-20,1,-18,-5,1,13,3,6,-19,-2,0,-4,-1,5,-4,-14,-17,7,-8,-16,-4,-1,-5,0,-3,14,2,-2,1,-2,-1,-5,0,2,0,0,-8,7,2,-38,-13,-5,8,0,3,-1,-2,-8),
	    8 => w(-7,-15,-19,-4,-3,0,-1,0,2,-3,2,-7,-3,-5,6,-4,4,-4,5,-3,5,4,0,8,13,-7,2,1,11,11,-5,17,6,3,-4,-24,2,0,16,-9,0,-10,10,-23,8,6,1,11,0,0,-4,3,-1,6,4,-1,3,-17,1,-8,7,-1,11,10),
	    9 => w(-8,10,8,7,-10,14,-29,14,11,-13,-5,5,1,-1,-2,28,1,-11,-2,-11,6,-4,2,-2,-1,1,-12,4,-1,-10,2,-11,4,3,1,4,4,0,19,6,5,4,-30,-1,5,-1,3,0,-4,9,-6,-7,23,-8,0,-2,7,7,2,-10,30,-12,0,-5),
	    10 => w(-4,-2,15,10,-2,-14,-2,13,-11,0,1,0,4,-10,-5,3,-45,-8,-8,12,-22,-18,4,-1,1,1,-2,11,15,4,3,0,1,-35,3,5,3,-1,2,-6,-3,4,3,1,-42,0,-1,15,-3,12,6,3,6,-2,7,-2,12,3,9,3,-6,-12,-15,5),
	    11 => w(10,-3,1,2,2,-3,-12,4,-5,-1,10,0,1,9,-10,-2,8,33,4,-5,11,4,2,-9,-15,-2,2,10,-6,-4,-2,-8,12,2,-8,5,0,-3,5,-1,-13,-30,2,12,0,-7,3,6,2,7,3,5,3,25,2,9,2,-4,-19,3,-11,4,-1,2),
	    12 => w(-2,3,-6,-32,-6,-1,6,6,1,10,-3,-1,2,-2,-12,-2,1,2,-3,11,-4,1,-5,2,-4,-1,-14,-1,-3,11,5,-6,-5,5,-5,0,2,75,3,-10,-14,-4,-1,-3,-3,-6,-14,-3,-1,-4,1,7,-10,0,25,3,-4,0,3,0,10,2,5,13),
	    13 => w(-2,-11,5,-4,0,-2,-6,-3,1,0,-3,-9,0,0,-16,20,-15,-2,59,9,11,-8,-4,5,-1,35,10,1,0,0,3,-4,13,1,-9,-7,0,7,-4,-3,-8,1,-1,-4,3,5,36,3,1,5,-6,3,-1,5,2,-1,-2,-12,4,-6,1,6,-1,2),
	    14 => w(2,3,-3,2,-1,3,-1,3,2,5,-4,-2,-6,7,-4,3,-9,9,2,0,7,-5,-8,-3,9,30,-51,-5,0,6,7,0,-8,4,0,17,1,-1,4,-1,0,-10,39,-3,3,-6,26,-2,-2,-8,-1,5,8,-4,6,33,-17,5,2,7,-1,-3,-2,3),
	    15 => w(-8,2,3,7,2,-6,2,-4,6,-6,-6,-14,-1,-8,3,-1,12,-3,-2,22,-5,11,27,5,-7,4,8,0,2,2,0,0,4,13,-3,-9,-15,-1,-2,5,2,1,0,-6,-10,-1,3,22,5,-2,-3,-1,-2,-3,-20,0,10,0,-2,2,2,-5,-3,9),
	    16 => w(-4,-7,8,-13,3,0,4,1,10,-3,-3,20,3,-1,-2,0,19,0,-3,2,1,1,-7,-18,7,-7,-5,-20,-31,10,15,0,6,-18,1,25,-31,-1,-13,-7,1,21,29,8,0,-10,-4,7,-25,7,-9,8,5,-2,-11,-14,3,9,5,14,4,-3,19,0),
	    17 => w(16,1,11,-11,-5,1,6,6,-11,2,-19,-7,1,-1,-9,-12,-10,-15,-8,-7,0,-10,2,-1,0,-8,4,-3,-8,7,-1,-10,-4,-1,5,16,-7,2,-12,23,-3,5,-2,5,-1,3,-5,4,-8,-8,5,4,14,2,-3,2,-5,0,-16,13,-3,5,7,25),
	    18 => w(7,1,-11,13,13,14,-34,6,49,-6,22,6,-4,-7,-7,2,9,1,-2,33,8,-7,-4,-4,-2,0,2,-3,2,-8,10,2,-4,3,6,-5,-11,4,8,-11,-17,-17,5,-2,10,1,-3,1,4,-4,-7,5,-2,-5,2,-9,-13,38,-3,5,14,-3,20,0),
	    19 => w(20,6,22,-8,-7,18,2,-14,9,-6,2,-11,4,-6,-4,0,13,-12,12,0,14,-3,-7,6,13,6,13,1,3,-2,-8,17,7,5,-7,-4,-10,2,3,1,-5,-16,12,4,1,6,3,14,-9,-8,-6,-9,-19,-2,-9,-1,6,4,-5,-1,-6,-4,2,-11),
	    20 => w(10,3,2,0,4,-2,2,2,1,-3,-3,9,1,-4,6,6,18,8,3,2,-1,5,16,-5,-5,9,-8,-20,-18,9,-5,1,2,7,10,5,-10,0,4,12,0,12,57,12,6,-6,14,16,1,-2,-13,10,-1,8,-7,9,-3,2,0,6,6,21,-10,-9),
	    21 => w(1,6,8,17,1,4,13,-3,-6,3,0,-9,15,-2,7,-1,5,-2,5,-14,5,7,-10,5,3,9,-5,15,-1,5,5,-3,-13,-15,4,6,-5,-49,6,38,2,11,2,-4,-3,4,6,1,5,-14,-15,1,-1,5,-1,4,8,5,0,-9,0,-21,5,36),
	    22 => w(3,2,5,0,15,-2,28,12,-8,1,20,2,3,-26,-1,2,-10,-9,1,-7,8,5,-9,5,3,-7,-12,-5,9,-7,-2,1,-6,-12,-34,22,2,-2,1,9,-3,21,-2,4,-4,-5,-8,0,1,4,2,-5,-1,-5,-21,-6,-2,17,15,2,-18,5,1,1),
	    23 => w(11,-22,-12,6,1,-4,9,-3,5,1,13,-3,0,0,4,-1,11,20,-8,-6,30,-6,-3,-5,-10,8,5,-4,0,3,-14,-10,5,2,-11,-1,-1,20,8,3,4,9,7,2,1,11,0,1,-14,-4,1,-16,-5,8,10,10,0,2,13,7,9,16,-3,5),
	    24 => w(6,6,6,1,-11,4,-2,-8,-5,0,-10,12,-2,-8,-2,-4,16,-2,1,-4,-4,1,-3,8,6,2,-9,14,-5,7,-8,6,6,2,3,15,-12,0,-2,3,-4,-12,0,5,-5,4,12,3,23,-8,8,0,3,10,-6,14,3,2,0,11,2,11,4,0),
	    25 => w(2,-1,-1,-13,1,3,5,-4,4,-1,-3,2,-1,1,14,0,-12,0,-10,-1,-6,-10,-2,6,1,14,6,8,5,2,1,-5,5,35,-2,6,34,0,-3,11,7,5,-1,-17,4,-1,14,1,-6,1,4,-3,-1,24,2,6,-23,5,-3,-40,5,4,-6,12),
	    26 => w(3,3,-7,27,4,-3,-3,11,10,-1,27,4,-22,-8,0,3,9,3,-2,-5,7,18,3,-1,0,3,2,3,9,11,-20,-4,-4,-12,12,0,1,-4,-2,17,-32,2,-2,-8,2,11,14,3,14,5,-2,0,0,-5,-1,3,-14,52,-19,-4,9,3,1,-1),
	    27 => w(-6,0,6,-19,0,3,2,3,3,-1,-3,5,6,18,-1,-5,3,-5,7,7,-3,2,5,5,3,-15,9,1,3,4,-8,20,2,1,-6,-9,2,-19,12,-5,12,-6,-6,3,7,-9,-9,-7,7,41,24,12,6,-3,1,6,-2,-10,-2,-13,-15,30,2,1),
	    28 => w(-10,-15,-20,7,-1,1,-3,-4,3,-11,4,6,3,-4,-5,-5,2,3,2,-2,-3,9,-6,21,4,1,2,9,4,7,-8,-4,-1,-3,-7,-10,-12,-3,17,1,-5,-9,-17,-17,5,27,-2,-3,13,-3,-3,-4,3,0,5,11,-6,-42,-1,-16,1,-16,5,4),
	    29 => w(-15,-20,6,-2,22,1,-9,7,-16,-4,-11,0,-3,-2,-4,18,-14,-8,4,-14,-3,-5,-2,-6,-4,1,-6,1,5,-3,0,-6,-1,6,1,6,8,-18,16,-5,-1,-7,-19,3,1,-9,-1,0,2,19,-13,-7,1,-22,-3,3,-17,-2,15,5,21,2,3,-14),
	    30 => w(-5,-1,-2,11,0,-15,-3,-21,0,-11,-3,8,2,-6,-8,-4,6,-15,1,4,-7,-12,-2,-6,-1,1,1,41,27,3,1,-1,6,-13,-10,-4,7,1,-3,1,0,-2,0,-2,10,-17,-3,-1,-3,12,8,4,-2,-1,-3,0,5,1,4,0,23,-9,-5,-11),
	    31 => w(3,1,-2,-4,5,5,-9,12,3,8,6,-2,0,-16,-12,3,11,24,-11,-5,-8,7,-6,2,-22,1,6,17,6,-1,-1,34,27,-4,-9,0,2,-15,13,-7,4,-32,10,2,0,0,2,10,-2,8,-7,-9,-12,-4,-4,-21,12,-7,0,-14,-1,-2,1,1),
	    32 => w(-3,-1,-3,5,2,0,-9,-12,-4,-7,-8,11,-5,6,-4,-5,20,-5,7,8,0,0,-11,5,-1,5,2,7,-12,-22,8,-2,-1,3,-17,6,-9,-2,-1,0,-4,5,-2,0,-2,11,5,4,6,-6,-1,9,6,-1,-11,4,-13,-7,3,4,5,-4,8,5),
	    33 => w(-33,-1,4,-11,2,2,7,1,-1,1,1,-2,-4,-3,0,-2,10,4,-22,4,-17,-15,1,1,1,2,-4,23,7,-9,6,7,-14,0,2,0,16,6,0,-1,4,1,9,-6,5,0,-4,2,-1,-19,7,0,3,-4,3,0,-13,14,0,-5,-5,-3,-3,12),
	    34 => w(4,0,-1,-5,-8,-7,-25,8,3,-4,-4,-2,11,-2,-2,3,-8,1,-2,-5,9,-12,0,1,5,-8,-3,-7,-1,-4,-6,1,25,-6,24,26,0,-4,7,12,-4,-8,-10,-7,4,1,4,-6,-82,-1,1,-2,2,-6,26,-8,-5,-5,-60,5,0,-1,0,-2),
	    35 => w(7,2,7,2,4,2,-2,14,-3,1,-13,-2,6,8,-5,8,12,-4,-2,14,-50,-5,-7,3,-3,7,2,5,1,-2,-4,-10,1,0,-12,13,-3,-4,15,-1,7,4,3,1,1,-2,0,-10,1,0,-1,-5,1,0,2,-1,-1,-5,4,-8,-3,0,6,-12),
	    36 => w(-4,-2,-17,1,-2,-1,-1,-3,1,0,3,-7,0,4,1,-6,-7,1,-3,2,-4,6,-5,-3,8,-22,0,4,-3,-2,2,2,4,-4,0,2,-5,1,-2,-2,-1,11,-1,21,1,2,1,-28,0,5,-1,9,-1,-2,-2,-1,-1,-9,1,8,5,-2,3,-1),
	    37 => w(-6,7,3,2,3,-9,5,-9,30,6,2,-3,0,18,-2,-22,2,-5,4,7,-5,0,1,-2,5,-1,-6,-9,1,-3,-12,3,3,-5,3,3,3,1,-3,2,4,3,-8,-4,-8,2,-8,2,-3,-12,3,-6,-6,0,1,12,1,0,6,1,10,-4,-7,0),
	    38 => w(-1,0,1,-2,5,9,-7,-12,15,-2,9,0,-3,-2,6,2,35,14,5,-7,-11,-1,1,-6,-1,-4,-4,7,0,0,-5,1,12,-1,1,0,-3,0,0,-7,-3,-3,0,4,-6,-3,-5,1,1,-1,-2,-2,-2,3,3,0,-1,0,-6,-2,3,10,0,0),
	    39 => w(7,0,3,0,-1,6,7,7,-3,-3,1,0,0,4,-10,-4,-9,11,-13,-2,7,5,-1,-7,-17,-2,-1,0,4,-9,4,-2,-1,3,-1,10,-5,-3,-13,0,-17,10,-12,-12,-1,-6,-1,6,-1,0,-5,3,-6,16,-4,-10,4,0,14,-9,-6,1,-7,-15),
	    40 => w(-1,-5,-4,-5,1,0,10,-4,2,-5,-3,11,-1,2,-57,-9,-19,0,8,3,0,0,-1,-6,-1,-1,-3,8,7,-20,-7,3,0,-58,-6,-5,3,12,-4,-3,-12,-8,-7,1,-2,1,3,-2,1,2,-7,2,-8,-14,-26,-5,0,-2,-11,-5,6,-1,-3,-2),
	    41 => w(-16,11,-3,-9,-6,2,0,1,3,-4,0,104,-16,2,13,15,-8,-1,-11,-5,-16,14,-17,-6,-1,0,-1,-5,0,-8,-1,1,-4,-6,-47,1,-6,-23,-3,-7,-5,-7,-1,-5,15,-4,-44,16,9,-12,0,-1,-4,-9,7,2,-6,1,-2,-5,6,-2,-6,4),
	    42 => w(-1,0,3,2,6,-1,-7,-3,-2,6,-7,2,-6,2,-2,10,4,-1,-6,-7,-8,3,48,2,19,1,6,1,-1,0,-8,-1,-9,3,-10,2,4,3,1,-28,5,4,-46,1,-6,-9,-22,-3,-7,0,41,0,8,5,5,-40,18,-8,-11,25,-3,3,1,-2),
	    43 => w(-4,2,-1,-2,5,6,1,4,-5,3,-11,6,-11,12,2,-4,3,-6,-1,-3,-3,-1,-21,4,-2,2,6,-3,3,-6,14,-3,-8,-3,-6,0,54,-6,5,-4,-3,-3,-9,-2,-7,-2,7,2,13,-3,9,6,4,-3,-9,9,-9,-4,-3,-2,1,6,0,-8),
	    44 => w(0,11,-22,-4,-2,-3,1,1,0,-4,-1,3,-3,0,-1,-2,6,0,-6,6,5,0,-1,-19,7,9,-2,0,0,2,12,4,5,-4,0,-1,0,3,-6,11,-4,-17,8,9,8,-9,0,9,-9,-2,-3,3,0,-2,-3,3,5,-3,-2,-2,2,-13,6,-7),
	    45 => w(-10,1,-3,-2,-12,-2,17,0,-6,8,0,-5,-2,-11,-4,7,-6,5,1,2,-1,-6,-3,1,-2,-1,4,3,-3,9,7,-17,2,0,0,-2,1,1,-17,-1,5,-2,-11,4,-2,-2,-2,-3,-11,8,10,8,-3,-15,-1,4,2,18,-6,5,-14,-11,-5,-3),
	    46 => w(-13,-1,4,6,-3,-17,-6,3,9,-3,3,-2,5,-15,-4,1,-9,1,-6,4,-13,-12,3,-4,3,-2,3,-3,-4,-2,0,1,-7,8,-11,-10,0,-1,-5,-6,-1,2,-3,1,-5,1,1,15,6,0,-2,2,1,0,-3,-1,-1,5,0,0,-10,7,-9,0),
	    47 => w(-3,-1,8,-1,-1,12,24,-5,0,2,5,-1,0,-15,0,2,-19,12,-1,-4,0,-1,-1,-1,-3,-1,0,7,-5,-7,-8,-6,-1,-9,2,-9,0,14,7,1,1,5,-4,5,1,-6,-2,9,-2,2,-4,-5,-8,2,-2,2,-7,-6,12,-1,-3,0,-1,-5),
	    48 => w(0,11,14,2,10,-2,4,-5,1,-2,-5,2,-2,-6,-5,-13,3,-2,-3,4,-2,-1,-9,2,-3,2,-9,4,1,-7,6,4,-10,-5,-6,6,0,2,3,10,-12,-2,2,12,-5,2,-6,-4,1,0,-2,5,3,3,-11,0,5,13,4,-1,-2,-3,-8,11),
	    49 => w(1,-3,7,-13,1,1,23,-9,1,1,-1,-10,3,3,-2,-18,-13,-2,16,1,0,-9,-11,-6,-6,-12,15,0,1,-3,0,-7,21,-9,-4,-2,1,-7,-6,-9,-6,3,1,3,2,1,14,-1,1,-13,-2,2,4,-1,-2,-7,-3,-8,1,-4,-3,-3,-56,-6),
	    50 => w(-3,4,-1,-6,-6,-1,1,-7,-2,9,-7,0,-7,-2,-1,3,12,6,-2,3,-5,1,1,-11,-1,15,-9,4,2,-4,4,0,-11,11,10,-1,3,2,4,-12,6,-2,1,2,0,6,-3,2,-2,-10,-10,5,8,0,8,-7,-12,-4,-3,-2,-2,8,5,5),
	    51 => w(-4,10,-2,-9,-1,4,6,-8,4,-8,-8,6,2,-9,-4,1,-9,1,2,0,-4,7,41,9,2,5,2,-2,-1,8,-12,-6,-5,4,-6,7,2,-3,-14,4,2,3,6,1,8,0,1,21,-1,2,5,-1,-2,-4,4,-1,8,-11,-2,1,-11,0,0,-3),
	    52 => w(-1,7,2,24,-3,1,0,4,-2,17,-7,-24,-3,1,3,-2,4,-2,0,-5,2,3,-3,-6,11,-2,11,2,4,2,3,-2,2,-4,-5,-1,11,3,-1,-7,-1,3,1,0,3,3,-1,6,0,9,3,-9,-1,3,8,1,1,2,0,15,-3,2,9,5),
	    53 => w(-2,7,1,9,0,-1,3,-9,5,-3,1,6,-4,30,-1,6,-2,-3,-8,9,-2,0,0,4,0,3,3,8,-2,-14,-10,8,-1,10,5,2,-1,-9,2,-14,6,3,-4,-7,4,3,-3,1,-1,1,-3,-5,0,-1,2,17,6,-1,3,6,-6,-4,-6,-6),
	    54 => w(-1,-2,-5,3,-7,-4,2,-3,12,-2,4,2,-5,2,6,2,18,13,-3,3,-8,6,0,1,-4,2,-12,-1,0,6,6,-1,-6,-2,8,-5,-2,4,0,-6,-13,5,-2,-3,-1,2,6,-5,-1,0,1,10,-1,-8,1,-3,0,10,-7,0,-1,5,1,0),
	    55 => w(-1,6,15,-9,-1,-3,0,-2,-5,0,-15,-3,3,-1,-5,2,2,7,-2,9,-2,-1,0,-1,-4,-3,3,4,-2,-1,-4,3,-5,2,0,-2,3,2,3,1,-4,-1,-9,-1,0,16,1,0,5,-2,-1,6,0,6,0,9,-11,5,4,-4,1,-6,6,0),
	    56 => w(-1,0,8,7,6,0,13,-12,5,6,2,-15,-1,13,-10,-5,19,-6,-16,5,-1,0,-16,-1,1,1,37,7,-7,5,-1,0,2,19,-14,-1,-18,26,5,7,15,-11,1,6,3,-9,-4,3,-14,1,-21,6,20,-3,-1,-4,0,10,-6,-4,-11,-14,-8,-16),
	    57 => w(0,6,0,-1,-3,1,5,-7,-2,-8,-9,-16,4,5,-3,5,8,-6,29,7,-4,30,11,-2,0,13,-8,-11,-9,-9,-3,-9,16,5,9,8,14,-67,-1,-2,-10,-4,-5,2,13,-2,33,12,-5,-8,1,-2,-2,0,6,0,0,2,3,-2,-13,2,8,11),
	    58 => w(-4,8,-2,5,-4,4,-18,-3,3,35,-17,1,0,-4,-1,5,8,4,1,-10,-6,-6,-1,8,-6,41,-23,4,3,0,-1,0,13,-2,8,4,-9,-6,15,-17,11,-28,43,10,-3,-2,4,2,-8,0,20,1,-1,7,14,9,-27,-2,4,0,-4,2,-2,0),
	    59 => w(-1,8,4,7,-2,0,4,-7,-2,-4,6,12,10,-5,-1,0,-4,1,-6,9,-14,8,8,-6,-3,11,-4,-8,4,-2,-4,-10,0,-7,-12,5,24,-19,-18,3,3,0,-8,-6,-12,0,-1,10,-14,3,-41,10,-26,3,-5,-4,-1,0,0,-6,5,-4,-3,2),
	    60 => w(-16,3,-6,-6,-10,1,4,-7,2,-8,-2,12,-1,2,6,-3,-2,4,-7,4,-1,7,-1,-10,-4,0,-5,2,-1,-14,-7,19,-3,8,-25,22,10,-8,-8,4,-2,-3,-9,-7,-16,22,-8,-17,41,-4,-6,0,7,3,4,20,-5,34,3,-4,-1,-10,4,-2),
	    61 => w(-6,-2,4,-10,15,11,-1,1,-14,-10,-1,1,1,3,3,7,-16,15,-4,-12,-3,-8,0,-1,-1,-2,27,-2,10,21,1,-37,4,12,0,-26,12,-14,-19,7,-12,3,-4,0,5,-1,5,-1,-9,3,-4,-1,-6,-17,-6,8,-14,-17,13,3,10,-10,8,3),
	    62 => w(-4,0,3,33,-8,18,-20,-21,18,0,-3,-11,-1,3,-7,-4,-8,4,-2,-1,-12,-24,7,6,4,-2,10,-5,-8,-3,-2,0,-3,-1,17,2,4,1,-4,-4,23,5,1,-4,-6,13,-4,-5,-13,-10,-9,-9,4,1,12,-6,5,12,-1,3,19,-8,8,5),
	    63 => w(7,9,0,4,-1,15,-2,-5,-2,-7,4,-3,1,17,7,11,-5,-40,6,-9,-9,1,1,8,-1,6,2,6,0,2,-4,35,-11,-9,-14,2,6,-12,-2,4,17,-24,-6,7,-2,-4,4,1,-7,16,-14,-6,-31,-11,-8,8,17,-5,-12,1,-3,8,-10,-15)
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