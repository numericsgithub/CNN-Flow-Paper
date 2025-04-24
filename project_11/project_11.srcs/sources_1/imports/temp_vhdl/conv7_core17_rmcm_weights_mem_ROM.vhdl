library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core17_rmcm_weightsconstant_memoryROM is
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
end conv7_core17_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv7_core17_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH)) & std_logic_vector(to_signed(w9, XI_WIDTH)) & std_logic_vector(to_signed(w10, XI_WIDTH)) & std_logic_vector(to_signed(w11, XI_WIDTH)) & std_logic_vector(to_signed(w12, XI_WIDTH)) & std_logic_vector(to_signed(w13, XI_WIDTH)) & std_logic_vector(to_signed(w14, XI_WIDTH)) & std_logic_vector(to_signed(w15, XI_WIDTH)) & std_logic_vector(to_signed(w16, XI_WIDTH)) & std_logic_vector(to_signed(w17, XI_WIDTH)) & std_logic_vector(to_signed(w18, XI_WIDTH)) & std_logic_vector(to_signed(w19, XI_WIDTH)) & std_logic_vector(to_signed(w20, XI_WIDTH)) & std_logic_vector(to_signed(w21, XI_WIDTH)) & std_logic_vector(to_signed(w22, XI_WIDTH)) & std_logic_vector(to_signed(w23, XI_WIDTH)) & std_logic_vector(to_signed(w24, XI_WIDTH)) & std_logic_vector(to_signed(w25, XI_WIDTH)) & std_logic_vector(to_signed(w26, XI_WIDTH)) & std_logic_vector(to_signed(w27, XI_WIDTH)) & std_logic_vector(to_signed(w28, XI_WIDTH)) & std_logic_vector(to_signed(w29, XI_WIDTH)) & std_logic_vector(to_signed(w30, XI_WIDTH)) & std_logic_vector(to_signed(w31, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(-2,3,0,6,-16,-1,-2,13,-5,1,-6,2,-13,-7,-2,-1,-18,-5,-1,1,1,0,-3,-6,-4,17,-3,-16,-5,-3,1,-14),
	    1 => w(5,-10,-20,-1,7,0,11,4,-3,-1,0,0,-7,4,-13,121,-22,0,-1,-5,-5,-4,6,-11,2,-6,-1,-7,7,-3,8,0),
	    2 => w(-5,2,-4,-11,5,28,1,2,1,-2,12,4,2,2,1,1,4,-2,2,3,-5,-12,4,-7,3,-12,2,15,4,-2,2,1),
	    3 => w(7,-15,-3,1,-3,-15,-6,-10,7,11,15,-2,3,-3,-6,-3,-3,-13,3,-10,54,-8,0,11,-1,-6,1,1,-5,3,1,9),
	    4 => w(-29,-7,-6,4,0,40,56,-16,-6,64,20,1,-5,8,12,-9,-2,-29,-13,5,-23,-3,4,7,10,9,-1,0,2,-23,8,12),
	    5 => w(11,7,7,79,2,-2,8,-3,-18,-1,10,-12,5,0,-21,3,-2,0,22,-5,-4,13,-10,-6,-39,0,-4,-16,-3,13,-31,-18),
	    6 => w(2,26,-1,-4,32,16,4,17,6,-5,-1,4,-1,-5,13,-4,4,55,-2,5,-13,-10,11,0,2,16,8,1,-3,-28,1,-4),
	    7 => w(1,-3,-3,6,-9,-9,-6,-8,-3,0,0,-2,-3,2,7,1,-4,0,-2,-11,-2,-14,2,-2,1,2,-16,15,1,-6,4,13),
	    8 => w(5,-7,7,4,-4,-4,-16,3,2,1,-3,-12,6,-3,-8,37,8,12,21,-21,-2,-5,9,-7,-12,3,5,-9,19,9,-15,10),
	    9 => w(-3,2,4,-7,-8,5,12,3,-10,1,10,5,-9,6,-7,5,-2,0,-13,-6,-1,2,-28,-8,-2,75,25,-3,4,3,4,22),
	    10 => w(-104,-7,5,-19,-36,6,-1,5,6,6,-10,7,21,5,1,7,-5,14,6,4,3,-7,8,2,4,0,-44,12,-3,0,2,46),
	    11 => w(3,-4,10,-72,-2,16,-5,-2,-19,-11,1,-4,-1,-3,2,10,15,-3,-10,127,4,3,6,-1,-3,2,-22,0,-5,1,34,9),
	    12 => w(10,8,4,-23,-20,4,-3,10,-1,-4,1,-4,4,-4,-3,-1,42,4,-13,-2,2,5,7,7,-20,0,2,8,-5,-11,9,7),
	    13 => w(13,-45,-40,4,-5,11,14,-6,10,-7,-6,1,0,3,22,-21,11,-8,12,-14,-1,-35,-1,19,-5,23,1,-29,-8,7,14,-52),
	    14 => w(19,-2,7,-33,-3,10,0,46,13,-6,10,-2,1,1,16,8,-28,-1,5,-9,-1,4,6,8,9,-43,-3,6,-2,3,0,3),
	    15 => w(9,-12,1,-3,-9,21,-6,-3,-16,19,39,-11,-1,1,0,6,6,7,2,4,-12,-41,2,49,0,5,0,-1,-9,14,8,10)
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