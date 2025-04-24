library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core32_rmcm_weightsconstant_memoryROM is
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
end conv7_core32_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv7_core32_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH)) & std_logic_vector(to_signed(w9, XI_WIDTH)) & std_logic_vector(to_signed(w10, XI_WIDTH)) & std_logic_vector(to_signed(w11, XI_WIDTH)) & std_logic_vector(to_signed(w12, XI_WIDTH)) & std_logic_vector(to_signed(w13, XI_WIDTH)) & std_logic_vector(to_signed(w14, XI_WIDTH)) & std_logic_vector(to_signed(w15, XI_WIDTH)) & std_logic_vector(to_signed(w16, XI_WIDTH)) & std_logic_vector(to_signed(w17, XI_WIDTH)) & std_logic_vector(to_signed(w18, XI_WIDTH)) & std_logic_vector(to_signed(w19, XI_WIDTH)) & std_logic_vector(to_signed(w20, XI_WIDTH)) & std_logic_vector(to_signed(w21, XI_WIDTH)) & std_logic_vector(to_signed(w22, XI_WIDTH)) & std_logic_vector(to_signed(w23, XI_WIDTH)) & std_logic_vector(to_signed(w24, XI_WIDTH)) & std_logic_vector(to_signed(w25, XI_WIDTH)) & std_logic_vector(to_signed(w26, XI_WIDTH)) & std_logic_vector(to_signed(w27, XI_WIDTH)) & std_logic_vector(to_signed(w28, XI_WIDTH)) & std_logic_vector(to_signed(w29, XI_WIDTH)) & std_logic_vector(to_signed(w30, XI_WIDTH)) & std_logic_vector(to_signed(w31, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(-6,19,127,4,2,-7,-11,3,3,10,7,9,0,-12,0,10,1,2,-7,-8,-4,3,-10,0,-6,3,-2,-10,0,-12,37,-4),
	    1 => w(8,-3,2,-1,0,0,3,6,9,-4,-5,-7,2,15,6,3,1,-1,-10,10,-4,-2,-58,10,13,4,-37,1,-1,-1,4,-5),
	    2 => w(2,-51,8,-3,11,3,2,-1,7,-2,-2,0,39,2,6,-13,1,5,6,-1,8,0,0,-1,-2,2,-29,13,6,-6,2,13),
	    3 => w(5,1,-24,2,6,10,-4,1,-2,7,-2,-3,-3,2,1,3,-5,-2,-93,-10,-3,0,2,0,3,2,-2,-8,-2,1,-28,-5),
	    4 => w(11,0,13,0,-14,-2,-12,18,-5,-4,-14,0,27,10,4,-9,7,-27,-4,51,6,15,8,-8,31,3,-5,15,-10,-12,20,-1),
	    5 => w(-3,14,-3,-5,-2,3,-9,4,25,1,30,5,5,-6,17,9,22,1,-4,1,-5,-7,-2,-10,7,-18,-6,14,24,3,-8,-3),
	    6 => w(-11,-17,1,-40,14,-26,2,25,7,-4,-4,0,6,-4,-17,-4,5,1,-6,-2,3,-15,7,3,6,7,-14,-4,1,-6,3,-32),
	    7 => w(-1,2,-2,-11,-12,-15,-13,-27,6,18,-2,5,-1,7,12,8,12,1,-16,-7,9,-17,2,2,4,-3,9,-3,0,-1,11,4),
	    8 => w(-4,-11,8,5,31,11,-54,-8,-9,9,-8,-24,1,3,1,-5,-10,9,37,1,16,-2,14,-7,-10,2,1,-5,8,16,-3,2),
	    9 => w(-5,6,-1,1,2,-3,-1,-8,-3,3,-18,1,-16,7,-4,-16,-5,0,-27,21,1,0,2,2,-5,-8,0,-8,0,-23,3,-9),
	    10 => w(-5,41,6,-3,-43,3,-2,8,14,3,-4,19,-3,8,-2,-1,7,16,-3,3,-9,8,2,0,-6,0,1,-1,-2,-5,0,18),
	    11 => w(4,-6,-11,-8,-1,-4,12,-1,8,-4,-7,9,1,-7,-3,-10,-2,-3,4,-6,-5,7,-1,-6,3,-4,-14,-11,12,2,-20,27),
	    12 => w(3,0,4,-17,-19,1,-73,-8,1,-2,-6,-3,-9,95,8,0,0,-4,6,-8,-1,-1,-14,1,19,-9,-63,7,15,-5,-6,-1),
	    13 => w(11,21,26,-1,3,1,9,-19,53,-7,5,1,-15,4,-23,-16,2,0,-91,2,1,1,-8,-2,6,1,-4,-7,2,-50,-49,-7),
	    14 => w(2,6,-7,34,6,4,-1,16,4,-1,-20,-32,0,0,-36,-7,-5,1,-3,-2,6,-36,3,7,-56,-1,0,17,5,-4,4,-3),
	    15 => w(4,1,-4,-7,1,4,77,-25,3,-20,-6,-5,2,0,-13,-17,7,3,-13,-1,-10,18,-2,-4,-6,-1,-6,13,6,0,-18,-23)
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