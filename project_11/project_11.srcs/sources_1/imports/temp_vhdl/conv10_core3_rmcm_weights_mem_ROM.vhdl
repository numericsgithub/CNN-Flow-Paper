library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv10_core3_rmcm_weightsconstant_memoryROM is
    generic
    (
        XI_WIDTH        	          : natural := 8;
        ARRAY_SIZE                    : natural := 64;
        WORDS_PER_ADDR                : natural := 9
    );
    Port (
        clk        : in std_logic;
        data_index : in unsigned(bits(ARRAY_SIZE-1)-1 downto 0);
        dout       : out std_logic_vector((XI_WIDTH * WORDS_PER_ADDR-1) downto 0)
    );
end conv10_core3_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv10_core3_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(-3,-7,-1,-8,-10,-6,-1,-5,0),
	    1 => w(-2,3,-1,6,16,-1,-3,-2,-2),
	    2 => w(1,3,1,3,27,-2,-1,-1,1),
	    3 => w(-7,-5,-4,1,31,-6,-4,-10,-4),
	    4 => w(-10,-12,16,-11,-10,29,-6,-7,4),
	    5 => w(-6,-10,2,-10,-13,-5,0,-6,-3),
	    6 => w(4,-14,-1,24,-12,-7,5,4,-3),
	    7 => w(-8,-5,4,-1,-14,-4,2,0,0),
	    8 => w(7,-23,10,-20,-40,-9,8,-10,8),
	    9 => w(-4,-4,-3,-5,1,-5,-4,-4,-3),
	    10 => w(-7,-2,-3,3,26,-3,-5,-6,-3),
	    11 => w(5,-2,-8,-10,-1,-2,-5,-2,4),
	    12 => w(6,18,5,5,-3,-9,-2,-14,-6),
	    13 => w(-10,-3,26,0,-46,-10,32,-1,-4),
	    14 => w(-4,-3,3,-19,18,4,-5,3,1),
	    15 => w(1,-8,-5,-15,-28,-4,14,34,13),
	    16 => w(-1,3,-2,5,15,-2,-3,-1,-2),
	    17 => w(-4,6,-2,-12,14,8,-4,-1,-2),
	    18 => w(-7,-2,-6,-5,38,-8,-4,-8,-3),
	    19 => w(-11,9,3,-13,19,-2,-6,6,1),
	    20 => w(-2,7,-1,6,23,-2,-3,2,-3),
	    21 => w(0,7,-1,-1,17,2,0,-5,-2),
	    22 => w(-7,1,-6,-2,44,-9,-3,-11,-3),
	    23 => w(-2,-24,-10,2,19,1,0,8,4),
	    24 => w(-3,-3,-2,-3,1,-1,-2,-3,-2),
	    25 => w(-1,3,0,1,17,0,0,0,-1),
	    26 => w(-3,-1,-2,-2,-3,-1,-1,-1,-1),
	    27 => w(1,2,-1,1,14,-1,0,-2,0),
	    28 => w(-3,-6,0,-5,-8,-4,-2,-2,-1),
	    29 => w(13,-16,3,-17,-36,-8,2,-4,9),
	    30 => w(-9,12,3,11,17,-2,2,-1,-4),
	    31 => w(1,4,-1,5,10,3,-1,1,-1),
	    32 => w(-7,-3,-6,-4,45,-11,-5,-12,0),
	    33 => w(-1,-4,0,-11,-13,-3,-2,0,1),
	    34 => w(-3,2,0,6,18,-2,0,-3,-1),
	    35 => w(0,2,0,2,21,-2,0,-2,0),
	    36 => w(-12,-11,5,-7,52,-14,10,-12,-1),
	    37 => w(1,15,-11,-7,18,-5,-7,6,3),
	    38 => w(21,1,-9,-31,24,18,4,-24,4),
	    39 => w(-5,-10,-1,-10,1,7,2,15,4),
	    40 => w(-4,-5,8,-20,-8,30,-4,-6,8),
	    41 => w(4,-19,-5,36,-20,-19,14,13,3),
	    42 => w(-2,2,0,1,-43,0,3,-2,2),
	    43 => w(5,9,5,-26,-16,-20,11,4,8),
	    44 => w(10,41,4,-16,-37,-3,2,-4,1),
	    45 => w(-1,1,-1,1,20,-4,-1,-4,0),
	    46 => w(16,11,-12,-12,-33,4,-8,23,6),
	    47 => w(-2,0,-2,1,23,3,-4,1,-1),
	    48 => w(-8,0,9,-19,1,18,-7,-1,7),
	    49 => w(6,11,0,1,21,0,-2,-11,-4),
	    50 => w(6,-7,-7,26,-2,-20,9,2,-7),
	    51 => w(-7,5,4,37,-79,30,11,-3,-2),
	    52 => w(1,6,-1,3,15,0,1,0,0),
	    53 => w(-17,-14,10,18,16,11,10,-22,-11),
	    54 => w(-22,1,16,4,-26,-10,13,11,-10),
	    55 => w(2,-3,-2,-3,36,-3,1,-5,-2),
	    56 => w(-14,-5,-2,-10,-6,-11,-1,-10,-6),
	    57 => w(-3,-5,-1,-3,-1,-3,-2,-3,-1),
	    58 => w(2,-3,-3,-4,44,-4,-3,-9,-3),
	    59 => w(-3,0,-1,2,35,-4,-3,-5,-1),
	    60 => w(-8,-6,-5,-5,-4,-4,-6,-3,-4),
	    61 => w(-1,-6,1,-8,-15,-2,0,0,0),
	    62 => w(-4,5,-7,2,35,-3,-6,1,-4),
	    63 => w(2,-22,0,3,36,-2,-5,-14,3)
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