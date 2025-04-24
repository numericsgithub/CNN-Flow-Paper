library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core20_rmcm_weightsconstant_memoryROM is
    generic
    (
        XI_WIDTH        	          : natural := 8;
        ARRAY_SIZE                    : natural := 16;
        WORDS_PER_ADDR                : natural := 32
    );
    Port (
        clk        : in std_logic;
        data_index : in unsigned(bits(ARRAY_SIZE-1)-1 downto 0);
        dout       : out std_logic_vector((XI_WIDTH * WORDS_PER_ADDR-1) downto 0)
    );
end conv7_core20_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv7_core20_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH)) & std_logic_vector(to_signed(w9, XI_WIDTH)) & std_logic_vector(to_signed(w10, XI_WIDTH)) & std_logic_vector(to_signed(w11, XI_WIDTH)) & std_logic_vector(to_signed(w12, XI_WIDTH)) & std_logic_vector(to_signed(w13, XI_WIDTH)) & std_logic_vector(to_signed(w14, XI_WIDTH)) & std_logic_vector(to_signed(w15, XI_WIDTH)) & std_logic_vector(to_signed(w16, XI_WIDTH)) & std_logic_vector(to_signed(w17, XI_WIDTH)) & std_logic_vector(to_signed(w18, XI_WIDTH)) & std_logic_vector(to_signed(w19, XI_WIDTH)) & std_logic_vector(to_signed(w20, XI_WIDTH)) & std_logic_vector(to_signed(w21, XI_WIDTH)) & std_logic_vector(to_signed(w22, XI_WIDTH)) & std_logic_vector(to_signed(w23, XI_WIDTH)) & std_logic_vector(to_signed(w24, XI_WIDTH)) & std_logic_vector(to_signed(w25, XI_WIDTH)) & std_logic_vector(to_signed(w26, XI_WIDTH)) & std_logic_vector(to_signed(w27, XI_WIDTH)) & std_logic_vector(to_signed(w28, XI_WIDTH)) & std_logic_vector(to_signed(w29, XI_WIDTH)) & std_logic_vector(to_signed(w30, XI_WIDTH)) & std_logic_vector(to_signed(w31, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(-11,7,7,-13,22,4,4,21,-3,-6,-80,-6,-2,11,1,2,41,7,7,18,1,-14,9,13,5,-10,-13,22,-23,36,-28,13),
	    1 => w(8,-5,-14,4,-6,6,3,-15,15,-4,11,2,-56,0,55,-9,28,-3,20,6,-4,-12,-7,51,-5,-57,-7,-39,24,2,2,-36),
	    2 => w(-64,-8,-6,-15,-27,-45,-1,48,9,-11,8,-2,-4,2,7,2,-9,6,7,-9,1,-17,6,7,-2,-1,-2,3,-6,4,-1,16),
	    3 => w(3,-3,3,30,-12,9,-4,-1,-14,-2,-20,-8,0,1,-5,-7,-6,9,6,-29,4,-14,4,14,13,-2,-2,-32,2,8,-7,-31),
	    4 => w(13,1,-4,-12,3,-3,6,-9,-3,3,-19,-2,-5,-14,-5,-5,32,14,-45,-6,-1,12,11,-6,-21,-24,-7,1,-12,-2,-4,-30),
	    5 => w(22,9,-60,-3,-24,23,26,-5,-12,-10,-5,0,21,2,-37,-15,12,-1,4,-26,-6,-7,4,-20,-3,-4,5,-50,6,16,6,-19),
	    6 => w(-7,5,5,-4,-13,8,0,30,-6,7,-9,-3,5,3,-6,6,-29,6,4,-21,-4,-9,-12,6,11,-20,-5,-13,-4,-15,-1,-7),
	    7 => w(19,-24,1,-2,-6,35,-24,-6,-12,16,50,-16,2,3,0,5,11,-3,-2,5,-5,-53,-18,38,2,-5,0,-1,-9,23,-8,27),
	    8 => w(-6,6,-2,-35,37,1,8,-40,-1,0,-32,-10,-14,-13,-16,-6,27,1,9,-33,0,-20,24,-26,-4,-3,-6,26,-10,8,-8,-12),
	    9 => w(0,11,4,8,-13,-3,-8,4,26,1,-40,-3,-4,-5,6,-8,5,4,8,-18,-5,-25,-7,-4,0,13,-5,-23,-7,-1,3,-4),
	    10 => w(15,11,-5,22,-8,7,5,-12,3,6,0,10,-6,-4,-3,-2,7,7,-15,3,-1,68,14,-11,1,10,1,-16,18,1,1,8),
	    11 => w(3,24,2,10,-13,-11,7,3,21,0,-3,2,4,9,4,-28,-13,-7,-1,-16,-2,-13,4,-8,9,-12,-12,7,2,-5,-3,-7),
	    12 => w(2,2,1,81,-3,-1,11,-1,37,-1,-13,-4,-1,-3,8,6,4,2,3,-4,0,8,2,2,34,-26,9,-3,1,-1,3,7),
	    13 => w(0,4,8,6,-21,-9,-5,-4,4,0,-2,1,-4,-4,-9,-5,-1,-4,5,-5,0,-7,3,2,-2,-1,-1,-8,-7,5,-4,1),
	    14 => w(-2,-1,5,14,-4,-10,0,2,16,-7,-2,4,5,-7,-2,7,8,3,-7,7,-5,-2,-8,-23,2,-35,2,1,6,6,1,1),
	    15 => w(2,42,2,4,-11,-8,-1,0,-24,3,-9,0,0,6,0,0,-1,0,-3,0,68,-7,-26,-8,15,0,0,-3,-9,-4,-2,5)
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