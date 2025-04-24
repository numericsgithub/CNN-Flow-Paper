library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core5_rmcm_weightsconstant_memoryROM is
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
end conv7_core5_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv7_core5_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH)) & std_logic_vector(to_signed(w9, XI_WIDTH)) & std_logic_vector(to_signed(w10, XI_WIDTH)) & std_logic_vector(to_signed(w11, XI_WIDTH)) & std_logic_vector(to_signed(w12, XI_WIDTH)) & std_logic_vector(to_signed(w13, XI_WIDTH)) & std_logic_vector(to_signed(w14, XI_WIDTH)) & std_logic_vector(to_signed(w15, XI_WIDTH)) & std_logic_vector(to_signed(w16, XI_WIDTH)) & std_logic_vector(to_signed(w17, XI_WIDTH)) & std_logic_vector(to_signed(w18, XI_WIDTH)) & std_logic_vector(to_signed(w19, XI_WIDTH)) & std_logic_vector(to_signed(w20, XI_WIDTH)) & std_logic_vector(to_signed(w21, XI_WIDTH)) & std_logic_vector(to_signed(w22, XI_WIDTH)) & std_logic_vector(to_signed(w23, XI_WIDTH)) & std_logic_vector(to_signed(w24, XI_WIDTH)) & std_logic_vector(to_signed(w25, XI_WIDTH)) & std_logic_vector(to_signed(w26, XI_WIDTH)) & std_logic_vector(to_signed(w27, XI_WIDTH)) & std_logic_vector(to_signed(w28, XI_WIDTH)) & std_logic_vector(to_signed(w29, XI_WIDTH)) & std_logic_vector(to_signed(w30, XI_WIDTH)) & std_logic_vector(to_signed(w31, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(-9,0,1,2,13,-3,-2,6,-12,5,-14,-1,-3,-5,-3,1,-3,10,1,-2,2,-10,9,2,7,-14,-3,-13,-5,2,3,-7),
	    1 => w(7,0,-45,1,-22,16,-7,14,-3,-5,1,-1,-1,1,-11,6,2,13,-8,-7,7,-3,4,-3,-2,-5,-4,3,5,-3,6,3),
	    2 => w(-7,-2,-7,8,11,-7,1,11,-42,29,1,2,1,-3,6,1,-28,0,5,-12,-7,-9,5,9,2,-6,2,2,-2,5,-2,-1),
	    3 => w(9,-14,4,2,-1,31,-12,1,16,7,42,-6,-2,1,2,-2,3,-2,3,-4,-8,-23,-27,2,1,-6,-2,-12,-9,14,-2,-1),
	    4 => w(-5,-10,-15,0,1,40,-42,-2,-3,-2,6,-23,-7,17,1,-25,-2,-4,6,7,-47,-7,-3,-3,1,1,-20,1,-7,9,-25,-1),
	    5 => w(-11,-2,7,-6,-10,2,-8,-16,-7,3,2,-27,-4,-16,-1,-5,-3,5,-3,-23,5,-4,0,-1,19,-3,11,14,-1,-3,-21,7),
	    6 => w(7,-82,9,-7,-10,-7,-6,-12,-1,3,1,9,-13,-4,-3,31,-1,-5,20,-5,11,-7,1,2,-20,1,25,-20,-5,-11,-4,0),
	    7 => w(-6,2,5,3,-15,1,5,1,-9,-14,-1,7,0,3,-3,1,0,-3,29,-3,-1,-2,0,-2,-7,0,-23,12,-7,11,-22,-10),
	    8 => w(0,15,-18,5,-8,6,-29,-1,-1,4,5,-6,15,-11,-3,24,6,18,5,2,4,8,-4,-4,-10,-3,9,11,5,-2,39,6),
	    9 => w(-7,-6,1,13,-6,5,3,-1,5,0,-10,-27,-14,-4,10,7,4,-7,-16,-13,8,-1,-28,7,7,-4,7,4,9,-6,5,6),
	    10 => w(5,-38,27,-2,4,2,-3,-2,2,-3,0,-20,-21,14,2,-14,-5,-11,-2,-3,-8,19,5,-9,1,0,-8,-12,-6,9,0,-13),
	    11 => w(-3,-4,10,-3,-9,12,10,7,-12,-9,-6,1,-1,0,-3,2,-2,5,-28,14,0,0,5,-2,-2,2,10,-7,-3,8,10,19),
	    12 => w(2,29,-51,4,-8,-4,6,3,-5,3,-6,-2,9,-17,-13,-3,2,26,-2,20,3,2,7,-3,-6,-1,0,3,-5,-3,12,4),
	    13 => w(0,-5,6,-4,-8,9,15,8,0,0,-13,2,3,1,-6,5,1,1,-6,-12,1,-2,-4,-8,-3,-77,-28,-1,3,7,2,4),
	    14 => w(66,30,-9,-12,-19,2,-1,2,0,1,-3,0,-22,6,5,-3,-9,-2,3,4,16,6,1,3,5,-4,43,3,-1,-6,-1,-61),
	    15 => w(8,-1,16,49,-8,21,-9,1,-18,-3,5,-7,-3,2,-4,-1,9,-7,-1,-76,4,5,8,0,2,2,7,2,-7,6,-44,0)
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