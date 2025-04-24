library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv12_core4_rmcm_weightsconstant_memoryROM is
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
end conv12_core4_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv12_core4_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(-21,-30,-19,-29,-40,-23,-16,-22,-10),
	    1 => w(-14,-20,-12,-17,-24,-11,-8,-12,-5),
	    2 => w(50,57,11,53,65,18,23,22,10),
	    3 => w(-33,14,13,-41,18,18,-13,3,0),
	    4 => w(15,-27,-15,28,-30,-17,14,0,-2),
	    5 => w(44,52,25,47,60,32,24,32,14),
	    6 => w(-28,-33,-18,-35,-43,-27,-21,-27,-14),
	    7 => w(-10,-43,-35,-38,-65,-36,-29,-32,-10),
	    8 => w(16,27,14,22,33,16,8,14,7),
	    9 => w(-12,-19,-16,-24,-26,-18,-14,-19,-10),
	    10 => w(42,9,-41,56,53,17,22,45,25),
	    11 => w(-20,22,26,25,46,30,30,34,7),
	    12 => w(11,22,11,-18,-17,1,-13,-15,-2),
	    13 => w(-13,-17,-9,-20,-26,-14,-12,-15,-8),
	    14 => w(25,19,3,26,31,17,9,24,17),
	    15 => w(20,39,21,40,47,14,24,17,-5),
	    16 => w(20,27,12,29,38,18,15,19,10),
	    17 => w(12,24,17,20,29,17,12,14,5),
	    18 => w(11,15,7,15,18,6,8,8,1),
	    19 => w(23,32,15,32,44,21,14,22,12),
	    20 => w(-13,-19,-11,-19,-26,-15,-11,-15,-9),
	    21 => w(15,19,8,25,29,9,16,20,7),
	    22 => w(13,18,10,25,32,13,16,18,5),
	    23 => w(11,17,8,17,24,11,11,13,6),
	    24 => w(17,23,13,22,33,18,13,18,12),
	    25 => w(28,38,20,37,47,27,20,27,12),
	    26 => w(20,24,12,24,31,15,12,16,7),
	    27 => w(-38,-5,7,-17,38,29,-1,26,18),
	    28 => w(-19,-27,-17,-29,-35,-20,-17,-17,-10),
	    29 => w(-39,-49,-16,-74,-89,-29,-45,-53,-18),
	    30 => w(-17,-21,-8,-22,-28,-12,-8,-12,-6),
	    31 => w(27,35,16,37,49,22,17,22,10),
	    32 => w(21,28,13,27,35,16,13,16,8),
	    33 => w(18,25,11,27,32,12,13,14,4),
	    34 => w(-19,-29,-12,-25,-39,-16,-15,-24,-9),
	    35 => w(72,87,37,-38,-33,-22,-54,-62,-30),
	    36 => w(17,32,19,32,39,16,20,17,2),
	    37 => w(12,-17,-12,33,20,6,25,25,11),
	    38 => w(-19,-24,-19,-28,-25,-20,-22,-18,-11),
	    39 => w(58,54,-20,38,26,-37,-20,-34,-35),
	    40 => w(11,15,7,15,20,9,6,9,5),
	    41 => w(-14,-17,-9,-17,-20,-11,-10,-12,-5),
	    42 => w(13,16,7,16,20,8,8,8,4),
	    43 => w(12,18,9,18,23,8,10,10,2),
	    44 => w(-22,-24,-14,-26,-30,-18,-16,-19,-12),
	    45 => w(34,41,20,38,48,29,22,28,16),
	    46 => w(15,18,8,18,21,10,9,11,5),
	    47 => w(31,-11,-23,56,-8,-37,32,-14,-18),
	    48 => w(-19,-23,-13,-24,-27,-16,-13,-15,-8),
	    49 => w(-36,-29,-11,-29,-37,-21,-12,-33,-24),
	    50 => w(-26,-33,-18,-32,-38,-26,-20,-27,-15),
	    51 => w(-26,-33,-14,-30,-41,-13,-13,-16,-6),
	    52 => w(25,31,14,31,37,13,14,16,3),
	    53 => w(-44,-57,-31,12,15,10,29,41,19),
	    54 => w(26,35,18,35,45,22,18,22,10),
	    55 => w(24,31,18,33,42,24,20,25,12),
	    56 => w(3,18,20,3,22,25,3,9,16),
	    57 => w(83,93,43,-67,-78,-46,-20,-22,-9),
	    58 => w(-8,-13,-8,-16,-24,-12,-10,-14,-8),
	    59 => w(27,23,-10,33,39,16,10,22,18),
	    60 => w(16,22,10,22,29,13,11,15,8),
	    61 => w(13,21,12,20,32,17,9,16,8),
	    62 => w(-14,-19,-11,-21,-27,-19,-12,-16,-10),
	    63 => w(24,25,6,20,17,0,1,-5,-6)
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