library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv12_bias_add_constant_memoryROM is
    generic
    (
        XI_WIDTH        	          : natural := 8;
        ARRAY_SIZE                    : natural := 64;
        WORDS_PER_ADDR                : natural := 4
    );
    Port (
        clk        : in std_logic;
        data_index : in unsigned(bits(ARRAY_SIZE-1)-1 downto 0);
        dout       : out std_logic_vector((XI_WIDTH * WORDS_PER_ADDR-1) downto 0)
    );
end conv12_bias_add_constant_memoryROM;

architecture Behavioral of conv12_bias_add_constant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(10,36,-3,32),
	    1 => w(31,70,43,40),
	    2 => w(72,35,1,-21),
	    3 => w(65,79,43,32),
	    4 => w(29,79,37,16),
	    5 => w(-4,96,2,1),
	    6 => w(78,1,32,40),
	    7 => w(0,0,0,99),
	    8 => w(-4,38,0,0),
	    9 => w(3,25,2,29),
	    10 => w(0,0,1,-1),
	    11 => w(52,-1,50,0),
	    12 => w(0,71,6,19),
	    13 => w(41,39,8,57),
	    14 => w(0,-1,2,-3),
	    15 => w(39,2,36,1),
	    16 => w(48,-18,0,0),
	    17 => w(2,116,6,3),
	    18 => w(31,0,4,3),
	    19 => w(-1,115,27,4),
	    20 => w(6,39,26,29),
	    21 => w(0,26,54,5),
	    22 => w(8,24,30,0),
	    23 => w(82,-10,120,0),
	    24 => w(35,1,-22,3),
	    25 => w(34,4,0,0),
	    26 => w(41,-10,-1,-9),
	    27 => w(35,0,26,-2),
	    28 => w(86,1,2,45),
	    29 => w(-2,2,38,127),
	    30 => w(2,35,33,56),
	    31 => w(0,-2,1,3),
	    32 => w(-15,66,38,-1),
	    33 => w(38,4,42,8),
	    34 => w(-2,4,30,60),
	    35 => w(27,47,2,-1),
	    36 => w(41,15,0,3),
	    37 => w(47,-1,-8,0),
	    38 => w(39,31,27,31),
	    39 => w(66,1,40,-12),
	    40 => w(27,11,-1,0),
	    41 => w(0,100,70,27),
	    42 => w(30,0,5,0),
	    43 => w(0,0,0,-1),
	    44 => w(34,3,0,39),
	    45 => w(45,38,33,0),
	    46 => w(0,-18,29,3),
	    47 => w(33,4,0,-1),
	    48 => w(8,0,3,46),
	    49 => w(11,47,1,31),
	    50 => w(67,23,47,27),
	    51 => w(80,42,-3,65),
	    52 => w(0,0,33,2),
	    53 => w(-2,49,27,2),
	    54 => w(-1,-2,69,0),
	    55 => w(-1,-2,50,-1),
	    56 => w(29,42,0,-2),
	    57 => w(24,2,3,0),
	    58 => w(28,1,45,38),
	    59 => w(57,38,60,0),
	    60 => w(2,0,-4,0),
	    61 => w(39,47,34,1),
	    62 => w(1,-15,0,41),
	    63 => w(18,4,38,16)
        );
    
begin

dout <= data_ROM(to_integer(data_index));


end Behavioral;