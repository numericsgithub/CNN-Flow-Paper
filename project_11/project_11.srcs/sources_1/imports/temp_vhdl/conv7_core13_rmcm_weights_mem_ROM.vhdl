library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core13_rmcm_weightsconstant_memoryROM is
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
end conv7_core13_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv7_core13_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH)) & std_logic_vector(to_signed(w9, XI_WIDTH)) & std_logic_vector(to_signed(w10, XI_WIDTH)) & std_logic_vector(to_signed(w11, XI_WIDTH)) & std_logic_vector(to_signed(w12, XI_WIDTH)) & std_logic_vector(to_signed(w13, XI_WIDTH)) & std_logic_vector(to_signed(w14, XI_WIDTH)) & std_logic_vector(to_signed(w15, XI_WIDTH)) & std_logic_vector(to_signed(w16, XI_WIDTH)) & std_logic_vector(to_signed(w17, XI_WIDTH)) & std_logic_vector(to_signed(w18, XI_WIDTH)) & std_logic_vector(to_signed(w19, XI_WIDTH)) & std_logic_vector(to_signed(w20, XI_WIDTH)) & std_logic_vector(to_signed(w21, XI_WIDTH)) & std_logic_vector(to_signed(w22, XI_WIDTH)) & std_logic_vector(to_signed(w23, XI_WIDTH)) & std_logic_vector(to_signed(w24, XI_WIDTH)) & std_logic_vector(to_signed(w25, XI_WIDTH)) & std_logic_vector(to_signed(w26, XI_WIDTH)) & std_logic_vector(to_signed(w27, XI_WIDTH)) & std_logic_vector(to_signed(w28, XI_WIDTH)) & std_logic_vector(to_signed(w29, XI_WIDTH)) & std_logic_vector(to_signed(w30, XI_WIDTH)) & std_logic_vector(to_signed(w31, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(-2,9,2,66,12,9,5,-33,-6,-5,-29,3,5,-4,-3,1,15,-6,4,8,2,-5,13,-6,-8,-104,-4,53,-13,1,3,33),
	    1 => w(-2,-11,9,3,-20,-16,20,-1,-1,2,11,1,5,-18,-1,-74,55,-12,-1,-5,-8,-22,4,-16,0,1,0,0,-5,-4,-10,-8),
	    2 => w(1,0,2,-1,4,-34,-1,8,0,16,-17,14,-4,-23,12,-5,18,7,-22,21,6,7,-19,-17,-5,2,3,-53,-4,3,0,0),
	    3 => w(0,44,-8,1,-3,-29,-20,15,-7,-4,10,12,-3,22,3,-14,8,-4,-1,-9,-9,-12,-30,1,-12,32,3,-2,-5,2,8,2),
	    4 => w(-7,6,1,-7,-13,8,35,5,-7,-11,-43,5,7,17,-6,4,3,-38,-22,5,3,3,-38,-4,-1,-33,3,21,-14,1,-17,-8),
	    5 => w(6,-9,2,-2,-6,-2,-2,25,17,-3,-3,0,16,-1,-2,-2,-22,4,-2,52,-4,2,-9,-24,-8,-4,0,0,-14,-16,18,-31),
	    6 => w(0,-3,1,30,-3,32,3,-1,-34,-2,11,4,-11,-9,10,-3,-6,4,-18,0,8,-12,5,-9,-81,-18,-9,116,11,1,-15,3),
	    7 => w(-4,-7,5,-3,45,2,36,-37,-2,-8,-18,2,-17,-2,-10,-15,-19,-13,-6,-5,-3,14,13,4,-3,9,-1,4,2,0,-13,-27),
	    8 => w(5,10,-4,4,-4,0,-5,-11,21,-7,4,-1,-20,-16,0,0,14,-18,-24,-1,-2,-12,-10,34,9,-11,-1,6,-8,-12,-5,-4),
	    9 => w(4,-22,4,1,7,-2,6,1,7,-2,-13,-2,10,-2,-7,12,13,0,-9,14,-23,-3,-5,-16,1,-6,1,-21,3,-5,-16,-21),
	    10 => w(-8,-1,0,12,0,-8,1,4,-5,-10,-16,15,7,1,9,-2,3,9,-8,1,3,22,1,-18,7,-18,3,14,2,5,1,-6),
	    11 => w(5,36,1,9,24,3,2,10,-10,22,-5,-5,0,3,1,12,-26,1,8,-9,18,-27,4,0,-6,1,6,7,-1,-1,6,-1),
	    12 => w(-2,-36,-33,7,4,4,-14,1,-5,5,11,14,5,-12,-1,2,-6,7,-4,-10,6,4,1,0,-16,2,6,-8,6,-3,-49,-1),
	    13 => w(13,0,5,-9,0,3,4,3,10,-6,-10,-6,1,21,1,-4,5,0,-22,7,1,-3,38,26,4,25,21,6,1,-2,6,-11),
	    14 => w(3,-9,11,-17,15,7,2,-8,11,5,3,-4,-40,2,8,-5,-5,8,8,4,13,-4,-5,8,-1,1,-11,13,3,1,3,15),
	    15 => w(8,-1,5,-1,6,10,-4,-1,-12,3,-2,-6,-3,4,0,-7,-11,3,48,19,-1,3,2,0,5,0,-1,-3,-8,0,-23,-8)
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