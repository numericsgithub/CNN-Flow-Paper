library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv12_core3_rmcm_weightsconstant_memoryROM is
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
end conv12_core3_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv12_core3_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(18,40,33,-4,31,32,-20,5,16),
	    1 => w(-17,-24,-10,-28,-29,-12,-16,-14,-7),
	    2 => w(11,19,13,18,27,16,10,12,7),
	    3 => w(-12,-14,-6,-16,-21,-9,-7,-8,-4),
	    4 => w(-21,-30,-14,-26,-36,-19,-12,-17,-9),
	    5 => w(31,39,19,41,53,25,22,28,14),
	    6 => w(-24,-26,-14,-28,-29,-18,-16,-19,-7),
	    7 => w(14,18,8,21,28,14,10,15,9),
	    8 => w(27,32,13,33,41,17,16,19,7),
	    9 => w(10,25,18,25,38,20,20,20,5),
	    10 => w(20,28,14,27,35,18,13,18,11),
	    11 => w(-15,-20,-9,-19,-27,-12,-8,-12,-6),
	    12 => w(23,29,14,30,36,17,15,18,9),
	    13 => w(18,25,10,27,33,13,14,16,6),
	    14 => w(11,15,8,16,21,10,9,11,6),
	    15 => w(-19,-18,-7,-22,-30,-16,-12,-21,-12),
	    16 => w(66,76,46,82,88,42,47,58,11),
	    17 => w(28,48,24,20,47,37,0,12,16),
	    18 => w(19,25,12,25,32,15,12,17,9),
	    19 => w(-21,-27,-20,-27,-31,-25,-22,-27,-18),
	    20 => w(-18,-26,-15,-28,-36,-23,-15,-22,-13),
	    21 => w(-18,-26,-9,-27,-39,-14,-12,-17,-4),
	    22 => w(-17,-24,-14,-22,-31,-18,-12,-17,-9),
	    23 => w(-55,-52,-12,-46,-84,-50,-7,-44,-31),
	    24 => w(13,19,10,19,30,12,10,13,8),
	    25 => w(13,27,20,27,38,20,19,21,7),
	    26 => w(14,16,6,15,22,10,6,12,7),
	    27 => w(-16,-20,-11,-22,-25,-14,-12,-15,-7),
	    28 => w(11,14,6,16,20,9,8,11,5),
	    29 => w(-11,-15,-9,-15,-20,-10,-7,-6,-3),
	    30 => w(-6,-14,-7,-14,-26,-12,-9,-14,-6),
	    31 => w(26,36,17,34,46,22,19,24,12),
	    32 => w(-15,-21,-10,-23,-29,-12,-13,-16,-6),
	    33 => w(-17,-23,-11,-22,-29,-14,-11,-15,-7),
	    34 => w(-14,-22,-12,-18,-23,-14,-10,-13,-8),
	    35 => w(-48,-24,12,-51,21,48,-25,35,26),
	    36 => w(45,-9,-19,67,-21,-51,44,-19,-37),
	    37 => w(16,20,9,20,25,11,11,12,6),
	    38 => w(-24,-26,-14,-27,-31,-19,-14,-18,-11),
	    39 => w(-24,-13,2,-25,-8,7,-9,1,4),
	    40 => w(20,27,14,27,35,19,14,18,11),
	    41 => w(-21,-27,-12,-32,-44,-19,-15,-21,-13),
	    42 => w(30,36,17,38,45,22,21,26,12),
	    43 => w(38,46,23,45,54,28,24,29,15),
	    44 => w(13,16,8,16,19,9,8,11,5),
	    45 => w(-19,-27,-12,-26,-29,-19,-13,-19,-8),
	    46 => w(-14,-19,-9,-24,-29,-17,-21,-24,-11),
	    47 => w(24,34,18,31,46,24,15,23,12),
	    48 => w(8,12,8,14,21,12,8,12,7),
	    49 => w(25,26,9,31,44,25,14,30,19),
	    50 => w(-10,-15,-7,-16,-23,-12,-8,-12,-7),
	    51 => w(-41,20,31,-74,22,46,-41,13,23),
	    52 => w(-21,-31,-18,-29,-40,-24,-16,-24,-13),
	    53 => w(-40,-47,-26,-54,-62,-39,-32,-38,-22),
	    54 => w(-20,-26,-14,-26,-32,-19,-15,-19,-9),
	    55 => w(-25,-31,-15,-31,-38,-22,-16,-21,-9),
	    56 => w(18,25,14,26,34,19,15,21,13),
	    57 => w(13,16,9,25,32,13,15,18,6),
	    58 => w(2,-20,-19,7,-17,-17,0,-7,-2),
	    59 => w(-19,-26,-12,-26,-34,-18,-15,-19,-10),
	    60 => w(15,18,9,17,23,11,9,11,6),
	    61 => w(-14,-20,-10,-23,-32,-15,-11,-16,-8),
	    62 => w(30,34,15,33,48,30,10,25,19),
	    63 => w(-21,-26,-14,-31,-42,-21,-15,-24,-9)
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