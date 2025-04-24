library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core19_rmcm_weightsconstant_memoryROM is
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
end conv7_core19_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv7_core19_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH)) & std_logic_vector(to_signed(w9, XI_WIDTH)) & std_logic_vector(to_signed(w10, XI_WIDTH)) & std_logic_vector(to_signed(w11, XI_WIDTH)) & std_logic_vector(to_signed(w12, XI_WIDTH)) & std_logic_vector(to_signed(w13, XI_WIDTH)) & std_logic_vector(to_signed(w14, XI_WIDTH)) & std_logic_vector(to_signed(w15, XI_WIDTH)) & std_logic_vector(to_signed(w16, XI_WIDTH)) & std_logic_vector(to_signed(w17, XI_WIDTH)) & std_logic_vector(to_signed(w18, XI_WIDTH)) & std_logic_vector(to_signed(w19, XI_WIDTH)) & std_logic_vector(to_signed(w20, XI_WIDTH)) & std_logic_vector(to_signed(w21, XI_WIDTH)) & std_logic_vector(to_signed(w22, XI_WIDTH)) & std_logic_vector(to_signed(w23, XI_WIDTH)) & std_logic_vector(to_signed(w24, XI_WIDTH)) & std_logic_vector(to_signed(w25, XI_WIDTH)) & std_logic_vector(to_signed(w26, XI_WIDTH)) & std_logic_vector(to_signed(w27, XI_WIDTH)) & std_logic_vector(to_signed(w28, XI_WIDTH)) & std_logic_vector(to_signed(w29, XI_WIDTH)) & std_logic_vector(to_signed(w30, XI_WIDTH)) & std_logic_vector(to_signed(w31, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(-35,4,21,-2,-2,-29,-30,6,4,-4,1,-10,5,-2,7,-32,4,5,7,-12,57,0,5,5,-3,-3,0,0,-6,3,11,0),
	    1 => w(-4,0,7,-35,-4,1,-8,1,-13,3,6,47,-4,-7,-8,-3,-6,2,0,-5,-4,-2,-2,0,-13,-20,-25,7,-1,-13,-6,5),
	    2 => w(-4,-13,-19,-9,-7,2,-8,6,15,-1,6,-3,-14,3,-15,17,9,3,2,6,7,-6,2,3,-8,5,11,-10,-9,-23,2,13),
	    3 => w(-11,-6,-11,-11,-5,-4,5,9,-1,1,-1,2,0,-3,-8,3,3,2,-9,-7,2,4,4,-1,-5,3,-7,-8,-7,0,-14,10),
	    4 => w(10,3,-5,-2,-1,-3,-1,4,6,16,19,9,10,-17,-4,5,22,-4,-5,9,-2,6,2,20,13,0,23,2,1,20,17,-2),
	    5 => w(-5,1,6,1,-2,-8,-14,2,12,-8,12,0,10,-20,-1,-11,-3,12,30,-2,-10,5,17,-16,5,-3,-4,-35,-13,8,12,0),
	    6 => w(6,29,-7,5,-8,30,5,20,-11,-5,-4,8,14,-14,12,9,-9,-4,-17,22,-6,-17,7,8,19,-7,2,23,6,9,4,19),
	    7 => w(1,-9,3,-1,-16,-7,10,10,36,21,12,15,6,6,15,-1,7,-1,13,21,12,-11,5,-5,19,7,-6,-6,20,-16,10,41),
	    8 => w(3,7,5,-1,0,-1,11,17,5,2,-12,1,10,-3,-10,2,32,5,-15,-4,-1,-6,7,4,-13,-4,9,1,-13,-5,-11,-4),
	    9 => w(8,8,-43,-2,12,7,9,14,-8,-5,3,-1,-4,1,-23,-11,26,-3,1,-15,3,3,-9,-14,0,-9,3,-19,-3,19,4,-14),
	    10 => w(-3,-8,3,2,-9,-3,0,6,16,-6,6,-6,2,-3,3,2,-10,1,2,-9,0,-3,-5,2,10,-33,-4,6,-2,-1,0,0),
	    11 => w(7,1,2,11,-8,9,-13,8,-9,16,29,-15,0,1,0,7,4,1,-2,10,-9,-34,1,28,-5,0,0,-1,-3,9,1,6),
	    12 => w(2,7,8,-5,11,5,-10,9,-8,-3,-53,0,1,4,-1,-3,14,-6,-24,7,5,10,-26,-8,-18,3,-4,-10,14,-3,5,1),
	    13 => w(-2,-7,-3,0,9,-5,-5,29,1,1,6,0,50,-5,-7,-7,49,4,-4,24,-12,-10,-3,8,-4,2,-3,-9,-8,-2,-7,-18),
	    14 => w(3,5,0,-11,6,-18,5,3,-11,-14,8,0,3,-2,7,4,7,-3,-5,-15,-3,14,-12,-1,-28,-14,-3,-17,7,5,2,-1),
	    15 => w(-5,-6,1,3,30,0,23,-25,11,8,-4,11,1,-3,9,14,-9,-2,-5,1,-11,3,5,0,7,2,4,4,8,-5,5,-4)
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