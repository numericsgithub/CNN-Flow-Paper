library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv12_core2_rmcm_weightsconstant_memoryROM is
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
end conv12_core2_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv12_core2_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(-3,-17,-16,-18,-27,-15,-15,-13,-3),
	    1 => w(-3,-22,-19,-21,-57,-33,-14,-31,-12),
	    2 => w(-20,-28,-13,-28,-36,-21,-13,-21,-10),
	    3 => w(-35,-43,-17,-46,-58,-29,-23,-32,-12),
	    4 => w(-19,-27,-12,-29,-39,-16,-14,-16,-7),
	    5 => w(-46,-42,-12,-54,-66,-33,-18,-34,-30),
	    6 => w(31,34,15,29,43,26,8,23,17),
	    7 => w(19,25,11,26,32,14,13,16,6),
	    8 => w(-12,-16,-7,-17,-22,-9,-9,-10,-5),
	    9 => w(-15,-22,-9,-24,-31,-20,-14,-22,-13),
	    10 => w(22,28,12,31,40,18,18,23,11),
	    11 => w(13,23,15,20,28,18,14,14,7),
	    12 => w(-19,-26,-14,-30,-44,-23,-17,-25,-11),
	    13 => w(-16,-17,-7,-15,-16,-7,-8,-7,-3),
	    14 => w(17,19,9,18,25,13,8,13,9),
	    15 => w(49,59,35,60,75,45,40,50,26),
	    16 => w(42,14,-30,50,-11,-25,31,-19,-8),
	    17 => w(-52,-65,-20,-51,-73,-27,-18,-25,-11),
	    18 => w(27,29,10,29,42,24,12,25,17),
	    19 => w(-39,-70,-53,-81,-88,-36,-39,-26,-1),
	    20 => w(-26,-35,-20,-34,-40,-27,-17,-25,-13),
	    21 => w(-21,-26,-9,-26,-29,-16,-12,-15,-7),
	    22 => w(-24,-30,-19,-29,-36,-24,-16,-24,-14),
	    23 => w(29,35,16,35,44,22,22,24,11),
	    24 => w(13,19,9,19,27,13,9,13,7),
	    25 => w(27,37,19,37,53,28,17,27,13),
	    26 => w(37,38,18,46,26,-24,16,3,-20),
	    27 => w(-78,57,7,-105,83,22,-64,37,8),
	    28 => w(20,30,14,29,38,20,15,19,9),
	    29 => w(28,36,15,37,49,23,18,26,13),
	    30 => w(-16,-23,-11,-18,-22,-9,-8,-8,-3),
	    31 => w(20,27,12,29,39,16,17,19,7),
	    32 => w(-34,-43,-18,-36,-43,-11,-10,-10,-1),
	    33 => w(12,16,6,16,26,13,8,15,8),
	    34 => w(15,16,7,20,19,5,10,7,4),
	    35 => w(-16,-23,-10,-24,-31,-14,-13,-17,-6),
	    36 => w(-12,-42,-5,-38,-30,21,-12,15,26),
	    37 => w(30,38,17,39,51,23,21,26,13),
	    38 => w(-15,-19,-8,-20,-25,-10,-7,-8,-1),
	    39 => w(18,22,9,23,27,12,10,12,6),
	    40 => w(20,27,12,20,32,19,4,13,10),
	    41 => w(-28,-33,-15,-34,-42,-17,-16,-18,-7),
	    42 => w(22,28,13,28,37,18,13,17,10),
	    43 => w(13,17,8,14,21,7,3,6,3),
	    44 => w(34,-22,-32,51,-2,-55,30,13,-38),
	    45 => w(-16,-18,-8,-21,-23,-9,-9,-10,-3),
	    46 => w(29,34,21,35,39,22,18,21,11),
	    47 => w(39,17,-7,38,-12,-42,17,-26,-23),
	    48 => w(18,25,13,25,34,17,12,17,8),
	    49 => w(-13,-22,-15,-22,-31,-19,-12,-17,-10),
	    50 => w(25,32,11,-7,-14,-2,-16,-27,-8),
	    51 => w(-13,-20,-10,-18,-24,-13,-11,-14,-8),
	    52 => w(17,24,11,24,31,15,11,14,6),
	    53 => w(-16,-36,-30,-18,-39,-31,-5,-12,-9),
	    54 => w(20,25,10,23,29,11,8,9,5),
	    55 => w(36,44,22,9,6,-4,-46,-52,-29),
	    56 => w(-12,-20,-20,-25,-37,-27,-21,-28,-13),
	    57 => w(17,23,12,22,30,15,11,16,8),
	    58 => w(28,32,7,34,46,24,13,27,19),
	    59 => w(-16,-20,-13,-22,-28,-17,-16,-18,-11),
	    60 => w(18,22,11,22,29,15,12,15,8),
	    61 => w(-19,-25,-12,-23,-31,-17,-14,-19,-9),
	    62 => w(-82,-44,19,-51,27,58,17,55,31),
	    63 => w(19,26,13,26,33,16,14,17,8)
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