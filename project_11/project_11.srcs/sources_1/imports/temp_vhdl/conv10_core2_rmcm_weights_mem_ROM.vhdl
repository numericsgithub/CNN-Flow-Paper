library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv10_core2_rmcm_weightsconstant_memoryROM is
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
end conv10_core2_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv10_core2_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(12,-4,11,0,-12,-2,10,1,9),
	    1 => w(8,-14,5,17,17,-31,-12,12,5),
	    2 => w(2,17,0,8,-5,-7,-4,-8,-1),
	    3 => w(-1,-3,-1,-3,-4,-2,0,-3,-1),
	    4 => w(1,4,-1,-6,18,-1,1,-4,-1),
	    5 => w(2,-7,1,-9,-35,-3,2,3,1),
	    6 => w(10,32,9,-11,-17,-6,-1,-13,-3),
	    7 => w(-4,-11,-4,-9,39,-6,-2,-2,-1),
	    8 => w(22,-36,12,-20,24,-2,-9,11,-2),
	    9 => w(-8,-8,3,10,-7,-9,3,18,0),
	    10 => w(4,-11,4,51,-30,-12,0,-2,1),
	    11 => w(10,-16,2,30,-43,7,-2,1,0),
	    12 => w(-9,16,-8,2,39,-1,-1,-5,-4),
	    13 => w(-1,-6,-3,-7,-8,1,-3,-1,-1),
	    14 => w(0,-3,0,-3,-6,-1,0,1,0),
	    15 => w(-2,-6,0,-8,-22,2,2,2,2),
	    16 => w(-2,-5,-2,-5,-9,-2,-1,-2,-2),
	    17 => w(0,1,-1,5,33,-3,-2,-3,-2),
	    18 => w(-8,-13,-1,0,-22,-13,11,35,6),
	    19 => w(-5,-7,-3,-21,50,-7,-1,-9,0),
	    20 => w(-2,-1,-4,-3,44,-5,-2,-1,-2),
	    21 => w(15,-6,-4,23,-25,2,3,-7,2),
	    22 => w(3,-18,6,-20,-51,-4,5,-5,5),
	    23 => w(5,-2,-7,23,-1,-11,2,2,-2),
	    24 => w(-2,17,-12,4,83,-3,-6,-3,-10),
	    25 => w(0,2,-1,3,12,2,0,-1,-1),
	    26 => w(-5,-6,-4,-5,-1,-4,-4,-4,-1),
	    27 => w(28,-29,-9,-23,10,11,-14,15,0),
	    28 => w(0,-5,0,-5,-6,-3,1,-3,2),
	    29 => w(-3,5,0,4,11,-4,1,-1,0),
	    30 => w(1,15,2,19,-61,19,0,15,-3),
	    31 => w(-5,-1,-2,-3,-2,-3,-2,-2,-1),
	    32 => w(-2,-7,2,-8,-10,-3,2,-2,2),
	    33 => w(-1,-19,9,31,-40,-18,27,14,-2),
	    34 => w(0,-4,-2,12,5,-11,0,0,-1),
	    35 => w(3,-23,4,-4,-46,6,2,2,1),
	    36 => w(-2,-9,0,-6,-23,1,-1,2,-1),
	    37 => w(-1,-8,-4,-6,-4,3,-1,-5,0),
	    38 => w(1,-5,0,-4,19,2,-1,2,0),
	    39 => w(-9,-14,-4,6,21,3,-1,0,-1),
	    40 => w(-4,-16,-7,4,15,0,2,4,2),
	    41 => w(-11,-6,-10,-7,-3,-6,-9,-7,-6),
	    42 => w(-3,-21,-8,3,21,-2,1,5,3),
	    43 => w(0,4,0,6,18,0,-2,-1,-3),
	    44 => w(-9,10,9,-10,-9,16,0,-10,2),
	    45 => w(-12,-5,3,-3,-6,-6,3,-7,-1),
	    46 => w(6,-3,-5,24,-5,-8,3,-4,-2),
	    47 => w(6,23,-9,28,-19,-13,-2,-15,5),
	    48 => w(3,-1,10,-5,-22,0,10,4,1),
	    49 => w(3,-9,-1,-27,-5,28,-2,7,4),
	    50 => w(-8,-7,12,-14,-6,21,-5,-3,7),
	    51 => w(-7,-4,-10,-9,1,-6,-4,-8,-1),
	    52 => w(-3,-10,-1,-7,-19,-2,0,-3,-2),
	    53 => w(-7,-4,-8,-6,38,-14,-8,-11,-2),
	    54 => w(9,41,-6,-38,-10,0,8,-8,3),
	    55 => w(6,-7,-10,12,17,-5,-4,7,4),
	    56 => w(1,-19,2,-21,-8,28,-5,10,3),
	    57 => w(-2,-18,2,-17,-42,-2,4,-4,2),
	    58 => w(3,6,2,8,11,5,2,2,0),
	    59 => w(-7,2,-6,-18,-32,-10,22,33,12),
	    60 => w(-20,19,5,13,10,-16,9,-19,-1),
	    61 => w(0,2,-1,5,27,3,0,-2,0),
	    62 => w(-3,-12,-1,-10,-45,-1,-3,0,-3),
	    63 => w(1,1,0,2,20,-3,0,-5,1)
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