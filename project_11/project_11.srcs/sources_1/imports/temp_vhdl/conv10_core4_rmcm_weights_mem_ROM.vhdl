library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv10_core4_rmcm_weightsconstant_memoryROM is
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
end conv10_core4_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv10_core4_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(-4,0,-3,3,23,-4,-4,-6,-3),
	    1 => w(-3,6,-5,6,14,2,-3,2,-3),
	    2 => w(-3,-6,-6,-6,-4,-5,-11,-6,-1),
	    3 => w(11,-19,2,-7,-39,6,0,2,3),
	    4 => w(-1,-2,0,0,27,-5,0,-8,1),
	    5 => w(-1,0,-6,-16,60,-12,-5,1,-1),
	    6 => w(-3,10,-7,-9,24,-15,-1,4,-2),
	    7 => w(-7,-3,8,-29,4,27,-3,-2,5),
	    8 => w(-2,0,-3,1,-10,1,-3,4,-2),
	    9 => w(-5,-15,2,-14,55,-22,1,-20,-1),
	    10 => w(-1,-6,2,-8,-5,-6,-1,-3,2),
	    11 => w(0,3,-1,4,10,-2,-1,-1,0),
	    12 => w(-10,11,0,-11,32,-20,5,-5,-2),
	    13 => w(-2,-8,-1,-12,-14,-4,2,-3,1),
	    14 => w(-3,-2,2,-20,13,10,-1,-2,1),
	    15 => w(3,11,0,-10,-28,-6,6,18,9),
	    16 => w(3,-8,7,10,-26,14,4,-5,2),
	    17 => w(-1,-10,6,83,-84,1,3,0,-3),
	    18 => w(0,-20,-1,22,-15,-13,14,12,-1),
	    19 => w(-7,-2,-6,-3,40,-8,-6,-10,-6),
	    20 => w(12,62,6,-14,-40,-10,-2,-18,1),
	    21 => w(12,-15,3,22,-33,11,0,-7,6),
	    22 => w(-1,4,-2,5,15,2,-2,1,-2),
	    23 => w(0,4,-5,6,16,1,-4,-2,-1),
	    24 => w(0,8,2,-16,-52,-9,11,26,3),
	    25 => w(5,26,9,7,-6,-9,-2,-16,-10),
	    26 => w(-3,-14,-3,-8,74,-22,-7,-13,3),
	    27 => w(-6,-20,7,-19,-12,29,-4,10,12),
	    28 => w(-4,0,-3,0,1,-1,-5,-1,-3),
	    29 => w(-3,-6,-1,-5,-12,-2,-2,-4,0),
	    30 => w(7,-3,-7,25,-3,-18,6,-1,-6),
	    31 => w(0,-4,0,-12,29,-10,1,-7,2),
	    32 => w(-2,-8,-1,-9,22,4,-2,4,2),
	    33 => w(-1,-1,-1,-12,-6,2,-2,-6,-2),
	    34 => w(-1,-15,6,-17,-41,-3,7,-6,1),
	    35 => w(-7,-5,9,-18,-7,25,-9,0,11),
	    36 => w(-4,-11,-3,7,24,2,-5,-4,-2),
	    37 => w(-13,-13,6,-7,37,-5,3,-7,-10),
	    38 => w(-2,1,-2,-1,-7,1,-1,0,-1),
	    39 => w(-2,-1,-2,-2,-6,-1,-1,-1,-1),
	    40 => w(5,24,7,-9,-5,2,-4,-16,-4),
	    41 => w(0,1,0,1,18,-2,-1,-2,0),
	    42 => w(4,4,1,5,19,-1,2,2,2),
	    43 => w(-3,-6,-4,-6,2,-5,-4,-5,-3),
	    44 => w(-9,4,9,9,-2,-5,-1,-1,0),
	    45 => w(-3,-6,-2,-4,-14,-2,-4,-3,-2),
	    46 => w(-3,2,-8,2,42,1,-7,-3,-4),
	    47 => w(8,-12,2,13,-17,6,1,-3,-2),
	    48 => w(-1,3,-3,2,36,-5,-2,-7,-1),
	    49 => w(-7,-15,-4,8,11,-1,2,5,2),
	    50 => w(-8,-2,1,-6,-8,-6,4,-2,0),
	    51 => w(-1,2,-1,8,11,1,-2,1,-2),
	    52 => w(2,15,0,-3,-13,5,-1,-4,-1),
	    53 => w(11,-19,3,18,-25,11,3,-11,3),
	    54 => w(16,50,8,-10,-38,-11,-3,-15,2),
	    55 => w(-2,-6,0,-7,-4,-5,-1,-5,0),
	    56 => w(-2,0,-2,0,-12,-1,-2,0,-2),
	    57 => w(-1,7,-2,3,35,-3,-1,-4,-2),
	    58 => w(-1,1,-2,2,28,-4,-2,-4,-1),
	    59 => w(-2,-10,4,-16,-16,10,8,4,-2),
	    60 => w(12,24,2,-8,-14,-4,-2,-11,0),
	    61 => w(-9,-6,-2,0,20,3,0,4,-1),
	    62 => w(-4,-10,-6,-7,43,-4,-3,-10,-1),
	    63 => w(1,-4,0,-7,-33,2,2,2,1)
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