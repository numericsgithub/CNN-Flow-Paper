library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv12_core1_rmcm_weightsconstant_memoryROM is
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
end conv12_core1_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv12_core1_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(12,18,9,19,26,11,11,14,6),
	    1 => w(-24,-32,-21,-33,-39,-25,-17,-22,-8),
	    2 => w(-29,-37,-13,-41,-51,-20,-24,-28,-14),
	    3 => w(-25,-29,-10,-39,-42,-16,-17,-21,-8),
	    4 => w(-12,-20,-11,-19,-25,-14,-12,-16,-8),
	    5 => w(-2,8,1,-87,-105,-62,79,95,52),
	    6 => w(-43,-50,-25,-51,-66,-35,-24,-35,-11),
	    7 => w(26,30,14,32,38,17,16,21,10),
	    8 => w(-57,4,47,-73,4,65,-37,6,34),
	    9 => w(20,26,13,30,39,19,17,23,10),
	    10 => w(42,49,26,50,59,28,26,29,14),
	    11 => w(-10,-19,-9,-17,-28,-14,-8,-13,-6),
	    12 => w(20,27,13,28,35,15,14,17,10),
	    13 => w(-9,-11,-7,-12,-16,-8,-7,-8,-5),
	    14 => w(11,14,7,17,21,11,9,10,5),
	    15 => w(-10,-18,-12,-20,-36,-19,-10,-18,-10),
	    16 => w(-13,-19,-11,-20,-27,-15,-9,-13,-6),
	    17 => w(16,22,11,20,26,12,11,13,5),
	    18 => w(-27,-39,-22,-37,-41,-31,-23,-31,-16),
	    19 => w(27,31,17,32,37,20,16,17,11),
	    20 => w(20,21,8,23,29,14,8,14,10),
	    21 => w(31,34,14,26,19,3,7,0,-1),
	    22 => w(82,-80,-30,116,-95,-40,58,-58,-27),
	    23 => w(-35,-35,-15,-38,-52,-31,-20,-36,-15),
	    24 => w(-16,-18,-9,-19,-24,-13,-9,-12,-9),
	    25 => w(-15,-21,-10,-21,-26,-13,-10,-12,-6),
	    26 => w(-15,-11,6,-22,-31,-8,-15,-27,-14),
	    27 => w(-11,-14,-6,-15,-20,-8,-7,-8,-4),
	    28 => w(-18,-23,-11,-25,-30,-13,-12,-14,-6),
	    29 => w(15,22,12,17,27,14,8,11,4),
	    30 => w(10,13,7,14,19,10,6,8,5),
	    31 => w(20,28,11,28,35,16,16,19,9),
	    32 => w(-38,19,33,-36,26,44,-16,17,21),
	    33 => w(-17,-23,-10,-23,-32,-15,-12,-16,-8),
	    34 => w(19,24,10,25,31,14,12,15,9),
	    35 => w(-28,-37,-19,-37,-49,-26,-18,-27,-10),
	    36 => w(-10,-19,-14,-17,-27,-15,-12,-17,-8),
	    37 => w(-22,-30,-18,-23,-31,-16,-8,-12,-6),
	    38 => w(-16,-20,-9,-19,-24,-10,-8,-6,-2),
	    39 => w(-27,-34,-22,-37,-41,-21,-20,-21,-9),
	    40 => w(-19,-29,-15,-27,-31,-18,-17,-17,-9),
	    41 => w(10,13,7,14,20,10,8,10,5),
	    42 => w(-31,-37,-16,-40,-48,-28,-18,-32,-14),
	    43 => w(26,30,12,30,42,22,9,21,14),
	    44 => w(-21,-24,-9,-27,-32,-13,-15,-20,-7),
	    45 => w(-16,-20,-11,-22,-28,-13,-12,-15,-8),
	    46 => w(25,29,14,31,37,18,14,18,9),
	    47 => w(-17,-19,-12,-20,-27,-19,-10,-19,-12),
	    48 => w(19,25,13,21,30,17,8,13,6),
	    49 => w(46,38,-5,16,2,-19,-24,-32,-16),
	    50 => w(-23,-37,-14,-38,-53,-20,-18,-24,-8),
	    51 => w(-20,-26,-11,-27,-34,-13,-11,-15,-7),
	    52 => w(29,41,24,45,53,24,28,26,8),
	    53 => w(23,29,12,30,38,17,14,19,9),
	    54 => w(17,22,9,24,32,15,13,16,8),
	    55 => w(87,106,49,-68,-82,-51,-19,-25,-15),
	    56 => w(4,31,29,-26,-8,11,-17,-19,-2),
	    57 => w(-17,-17,-8,-19,-22,-10,-9,-10,-4),
	    58 => w(-15,-22,-14,-21,-32,-19,-11,-18,-12),
	    59 => w(-20,-24,-11,-26,-35,-16,-15,-18,-10),
	    60 => w(18,24,11,22,28,13,9,11,6),
	    61 => w(-8,-13,-7,-13,-19,-9,-7,-9,-5),
	    62 => w(10,16,9,18,26,11,12,15,5),
	    63 => w(15,19,11,20,27,14,8,12,7)
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