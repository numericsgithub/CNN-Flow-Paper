library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv10_core1_rmcm_weightsconstant_memoryROM is
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
end conv10_core1_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv10_core1_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(-1,-2,0,-1,17,0,-1,0,1),
	    1 => w(6,28,-2,7,-34,-5,-11,10,2),
	    2 => w(-6,-10,-6,-9,-18,-10,15,34,10),
	    3 => w(-3,-6,-1,-9,-21,0,-2,-1,-1),
	    4 => w(-2,-15,-2,-12,3,9,3,13,4),
	    5 => w(-7,-10,-4,4,10,3,2,6,1),
	    6 => w(3,6,-7,3,21,0,-5,-2,0),
	    7 => w(-5,-4,-2,-6,3,-4,-2,-6,0),
	    8 => w(2,12,-2,8,39,3,0,-3,-3),
	    9 => w(-1,-11,4,-11,-36,-2,6,0,4),
	    10 => w(4,24,7,-11,-13,0,-5,-3,-1),
	    11 => w(2,-26,-3,-12,0,6,7,25,1),
	    12 => w(4,-19,-3,-22,-32,23,5,19,27),
	    13 => w(-5,-8,-2,-9,20,5,-4,-1,4),
	    14 => w(-8,-4,-6,-7,1,-8,-3,-9,-1),
	    15 => w(5,-34,31,-5,-61,53,5,-21,12),
	    16 => w(0,-8,7,12,-25,16,4,-9,3),
	    17 => w(-3,0,2,-18,19,2,-4,-1,1),
	    18 => w(5,12,-1,8,52,-1,3,-3,2),
	    19 => w(-4,-3,-1,-7,-2,-6,-1,-4,0),
	    20 => w(14,-14,-6,25,-13,4,1,-19,3),
	    21 => w(-2,-16,1,1,-14,11,-2,2,-2),
	    22 => w(3,-10,6,-9,-34,-2,7,-1,5),
	    23 => w(7,8,-4,11,-1,-7,0,-8,-5),
	    24 => w(5,-19,6,-19,-42,-6,5,-5,5),
	    25 => w(-4,-4,-1,-4,-1,-3,-2,-4,0),
	    26 => w(-2,-6,10,-4,-19,30,1,-6,-1),
	    27 => w(11,16,0,13,-9,-13,-1,-15,-2),
	    28 => w(-4,3,0,1,24,6,-2,-2,-4),
	    29 => w(-5,13,0,-25,19,9,-1,-11,6),
	    30 => w(-5,2,-4,1,44,-6,-4,-9,-2),
	    31 => w(24,3,0,2,-10,-6,-2,-6,-1),
	    32 => w(14,-21,-3,-11,49,-18,-8,-15,10),
	    33 => w(-3,-11,0,-3,17,0,2,4,2),
	    34 => w(10,-7,0,-5,2,-1,-5,9,0),
	    35 => w(9,44,6,-12,-33,-5,-2,-9,-1),
	    36 => w(2,-6,1,-5,39,-6,0,-5,0),
	    37 => w(9,17,-12,18,-32,-3,-13,-2,12),
	    38 => w(9,-7,-5,-6,4,9,-1,-2,0),
	    39 => w(14,58,5,-12,-46,-6,-3,-9,-2),
	    40 => w(-2,-2,-1,-3,-6,-2,-1,-1,-1),
	    41 => w(2,8,-2,2,13,-2,0,0,-1),
	    42 => w(-14,19,4,15,5,-11,7,-15,-2),
	    43 => w(-6,0,-8,0,40,-9,-8,-10,-3),
	    44 => w(3,1,2,2,1,1,2,2,1),
	    45 => w(-1,-1,-2,0,14,4,-1,1,2),
	    46 => w(2,4,1,2,11,-2,0,-1,1),
	    47 => w(2,11,-3,4,5,3,0,-3,0),
	    48 => w(-15,-12,1,-12,37,2,4,5,-3),
	    49 => w(-3,-3,-3,-2,0,-1,-3,-3,-1),
	    50 => w(0,-5,-4,-2,-2,-2,-4,-3,-1),
	    51 => w(-2,-4,0,-2,-8,-2,-1,-2,0),
	    52 => w(-7,-14,16,27,-20,-10,-3,15,-10),
	    53 => w(-3,6,-2,6,18,1,-2,0,-4),
	    54 => w(13,-16,-1,45,-31,-13,9,-7,-2),
	    55 => w(-6,-10,-1,-12,-25,4,0,2,-5),
	    56 => w(-6,-5,-3,-3,4,-4,-4,-4,-4),
	    57 => w(10,-15,0,-1,20,-14,-4,10,-9),
	    58 => w(1,0,0,1,16,-2,-1,-3,0),
	    59 => w(-26,17,11,6,-27,4,22,1,-15),
	    60 => w(-1,14,7,-15,9,3,-12,-16,-4),
	    61 => w(-2,-3,-6,-7,42,-1,-2,-7,-2),
	    62 => w(1,7,-1,4,19,-1,0,-3,-1),
	    63 => w(-9,-2,-8,-1,50,-13,-8,-13,-3)
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