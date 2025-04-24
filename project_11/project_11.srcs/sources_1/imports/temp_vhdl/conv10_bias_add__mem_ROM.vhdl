library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv10_bias_add_constant_memoryROM is
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
end conv10_bias_add_constant_memoryROM;

architecture Behavioral of conv10_bias_add_constant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(-1,-21,26,31),
	    1 => w(-7,-10,-5,-9),
	    2 => w(1,-3,-21,14),
	    3 => w(47,19,21,59),
	    4 => w(0,-1,4,21),
	    5 => w(-6,61,51,-44),
	    6 => w(-4,1,-2,-3),
	    7 => w(21,14,30,-2),
	    8 => w(-14,-4,72,23),
	    9 => w(53,-1,19,23),
	    10 => w(-2,-3,-2,26),
	    11 => w(3,14,22,0),
	    12 => w(-5,-45,-1,1),
	    13 => w(-1,28,14,57),
	    14 => w(22,28,4,15),
	    15 => w(19,56,-2,-3),
	    16 => w(1,26,-4,-2),
	    17 => w(4,-10,-4,13),
	    18 => w(-27,1,49,-1),
	    19 => w(21,17,-10,25),
	    20 => w(6,-33,-1,-3),
	    21 => w(52,-7,-1,3),
	    22 => w(41,80,20,-13),
	    23 => w(-1,-8,1,-11),
	    24 => w(86,-22,19,37),
	    25 => w(20,-7,-2,-5),
	    26 => w(4,16,27,-5),
	    27 => w(-1,17,0,0),
	    28 => w(-16,29,38,25),
	    29 => w(-11,-4,61,19),
	    30 => w(0,43,-18,-1),
	    31 => w(-3,18,-12,38),
	    32 => w(-1,19,34,-8),
	    33 => w(0,-5,55,31),
	    34 => w(2,13,-5,80),
	    35 => w(1,77,-1,1),
	    36 => w(5,52,-15,-4),
	    37 => w(4,27,-24,9),
	    38 => w(10,-7,-15,33),
	    39 => w(-1,-2,3,37),
	    40 => w(27,3,-1,-2),
	    41 => w(-9,14,-17,-8),
	    42 => w(-16,1,55,-22),
	    43 => w(24,-14,18,22),
	    44 => w(0,0,7,1),
	    45 => w(-12,23,9,61),
	    46 => w(-5,-9,0,-40),
	    47 => w(-1,-8,-15,4),
	    48 => w(-9,54,1,8),
	    49 => w(34,-2,0,-1),
	    50 => w(19,1,-1,26),
	    51 => w(48,21,3,8),
	    52 => w(5,79,-14,36),
	    53 => w(-9,18,2,6),
	    54 => w(1,7,23,-1),
	    55 => w(99,-23,0,23),
	    56 => w(17,-1,20,28),
	    57 => w(-8,92,21,-13),
	    58 => w(-3,-31,-12,-4),
	    59 => w(1,6,4,27),
	    60 => w(0,0,17,1),
	    61 => w(-11,-25,39,-15),
	    62 => w(-11,70,-27,27),
	    63 => w(-6,4,0,63)
        );
    
begin

dout <= data_ROM(to_integer(data_index));


end Behavioral;