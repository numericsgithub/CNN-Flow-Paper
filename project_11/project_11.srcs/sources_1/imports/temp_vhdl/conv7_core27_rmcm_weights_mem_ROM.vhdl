library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core27_rmcm_weightsconstant_memoryROM is
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
end conv7_core27_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv7_core27_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH)) & std_logic_vector(to_signed(w9, XI_WIDTH)) & std_logic_vector(to_signed(w10, XI_WIDTH)) & std_logic_vector(to_signed(w11, XI_WIDTH)) & std_logic_vector(to_signed(w12, XI_WIDTH)) & std_logic_vector(to_signed(w13, XI_WIDTH)) & std_logic_vector(to_signed(w14, XI_WIDTH)) & std_logic_vector(to_signed(w15, XI_WIDTH)) & std_logic_vector(to_signed(w16, XI_WIDTH)) & std_logic_vector(to_signed(w17, XI_WIDTH)) & std_logic_vector(to_signed(w18, XI_WIDTH)) & std_logic_vector(to_signed(w19, XI_WIDTH)) & std_logic_vector(to_signed(w20, XI_WIDTH)) & std_logic_vector(to_signed(w21, XI_WIDTH)) & std_logic_vector(to_signed(w22, XI_WIDTH)) & std_logic_vector(to_signed(w23, XI_WIDTH)) & std_logic_vector(to_signed(w24, XI_WIDTH)) & std_logic_vector(to_signed(w25, XI_WIDTH)) & std_logic_vector(to_signed(w26, XI_WIDTH)) & std_logic_vector(to_signed(w27, XI_WIDTH)) & std_logic_vector(to_signed(w28, XI_WIDTH)) & std_logic_vector(to_signed(w29, XI_WIDTH)) & std_logic_vector(to_signed(w30, XI_WIDTH)) & std_logic_vector(to_signed(w31, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(10,-7,-37,-2,1,4,-1,-4,7,-1,-1,-7,-1,13,1,21,4,6,7,22,-1,1,17,-2,-1,1,-3,-1,6,1,-21,5),
	    1 => w(-2,-2,0,3,-9,-3,-1,-3,1,2,-45,-4,-7,-5,6,-3,-7,5,-17,-6,0,7,38,0,-1,-3,28,-1,-6,10,0,7),
	    2 => w(8,10,-54,-18,-2,-3,3,4,5,8,10,-1,-25,-1,0,3,1,1,-7,0,5,-11,4,4,6,7,-9,-20,0,10,5,-4),
	    3 => w(2,-3,4,-4,0,-7,8,-8,9,-14,-4,6,7,0,12,-5,12,-1,44,44,10,12,-2,1,-2,-3,-18,2,5,-2,4,14),
	    4 => w(-1,-9,-1,-4,-5,2,14,-1,-25,-1,-1,-6,72,11,-6,-22,-15,0,-14,25,3,3,8,5,13,0,6,9,13,7,9,-21),
	    5 => w(-3,9,4,0,5,-1,-11,-2,1,2,45,-1,-30,0,10,-6,-5,-2,13,13,-45,-17,1,-1,-4,-6,-3,13,4,6,9,-1),
	    6 => w(-11,-18,5,-31,-7,-12,4,7,-3,9,-21,16,-7,-2,22,-1,10,0,3,1,0,-38,47,-26,-2,-3,-4,-4,7,-23,7,-22),
	    7 => w(1,-6,-1,-30,-28,-13,-33,-71,6,-2,-1,6,8,1,13,-28,-25,-5,-34,-12,-2,-4,5,-2,-16,1,4,-7,16,-6,-9,12),
	    8 => w(6,1,-3,10,-42,0,-15,15,-9,-3,22,-5,-3,-3,-6,-11,-24,5,-18,-8,-1,-6,16,-46,-23,10,7,-6,12,-1,-16,-54),
	    9 => w(-1,15,3,8,-3,-2,-5,2,21,-1,-22,-2,-3,5,-12,-34,-18,-4,-1,34,43,-19,-16,-38,0,-24,-2,-10,10,0,5,7),
	    10 => w(-28,7,0,-20,10,5,8,4,4,10,-6,28,-6,4,-23,1,1,18,9,4,4,19,24,-9,6,-7,2,13,19,-7,6,19),
	    11 => w(3,-27,1,28,33,-8,15,16,-4,11,2,2,5,-8,5,47,-30,0,7,-12,-2,-35,1,0,25,6,-5,3,11,-6,0,13),
	    12 => w(0,13,7,4,8,3,9,6,9,-10,4,-12,-7,27,6,2,-7,12,12,16,-5,-1,3,-6,-15,4,20,-8,14,24,15,0),
	    13 => w(-9,12,6,13,6,-6,-12,-11,-24,0,-3,-10,-8,-2,0,-7,-8,2,-4,36,-11,9,15,-2,-3,-38,-11,15,-5,1,-12,9),
	    14 => w(12,-9,17,4,-65,-3,0,3,-6,2,6,6,-4,9,6,1,6,9,12,4,-17,-3,9,-2,-8,5,-5,14,-4,1,7,-13),
	    15 => w(-11,-15,1,1,10,-2,15,4,20,-5,2,19,3,2,9,-6,14,0,4,-37,-4,-5,2,-3,-1,2,-2,7,17,-13,-91,-15)
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