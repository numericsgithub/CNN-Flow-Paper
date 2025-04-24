library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core11_rmcm_weightsconstant_memoryROM is
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
end conv7_core11_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv7_core11_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH)) & std_logic_vector(to_signed(w9, XI_WIDTH)) & std_logic_vector(to_signed(w10, XI_WIDTH)) & std_logic_vector(to_signed(w11, XI_WIDTH)) & std_logic_vector(to_signed(w12, XI_WIDTH)) & std_logic_vector(to_signed(w13, XI_WIDTH)) & std_logic_vector(to_signed(w14, XI_WIDTH)) & std_logic_vector(to_signed(w15, XI_WIDTH)) & std_logic_vector(to_signed(w16, XI_WIDTH)) & std_logic_vector(to_signed(w17, XI_WIDTH)) & std_logic_vector(to_signed(w18, XI_WIDTH)) & std_logic_vector(to_signed(w19, XI_WIDTH)) & std_logic_vector(to_signed(w20, XI_WIDTH)) & std_logic_vector(to_signed(w21, XI_WIDTH)) & std_logic_vector(to_signed(w22, XI_WIDTH)) & std_logic_vector(to_signed(w23, XI_WIDTH)) & std_logic_vector(to_signed(w24, XI_WIDTH)) & std_logic_vector(to_signed(w25, XI_WIDTH)) & std_logic_vector(to_signed(w26, XI_WIDTH)) & std_logic_vector(to_signed(w27, XI_WIDTH)) & std_logic_vector(to_signed(w28, XI_WIDTH)) & std_logic_vector(to_signed(w29, XI_WIDTH)) & std_logic_vector(to_signed(w30, XI_WIDTH)) & std_logic_vector(to_signed(w31, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(-6,-14,-4,-23,-3,2,87,-4,-3,-1,5,3,-12,37,6,7,-11,3,6,-11,-2,0,-6,6,10,-4,51,10,0,-3,-9,5),
	    1 => w(6,-7,9,-5,-15,-6,-1,-35,-88,-4,-10,2,-10,5,-16,-18,-1,1,53,-7,7,6,-6,-8,-6,-7,1,16,0,-7,45,-3),
	    2 => w(-10,10,-12,0,-8,6,-1,10,4,-6,0,0,-14,-1,-10,-3,-9,-4,-3,1,-1,-24,19,20,-58,1,10,16,-7,2,1,13),
	    3 => w(-7,-2,2,14,12,-2,23,-8,8,-32,-9,0,-1,-3,-15,-1,7,0,11,-4,-1,27,-1,-4,2,0,-11,-41,7,-3,-1,-58),
	    4 => w(-2,3,-8,-16,-15,0,0,-1,35,1,12,-3,14,5,-24,3,-2,4,2,-9,1,-6,-20,97,-20,6,8,-6,-6,9,2,-22),
	    5 => w(-5,-18,8,0,-6,-5,3,2,11,3,-9,0,0,3,-5,10,-6,4,9,15,-56,5,-4,0,0,-1,0,-2,-3,6,5,14),
	    6 => w(-4,-1,5,-2,-4,0,4,-4,15,13,-15,10,-2,5,-12,-3,2,1,10,5,0,3,-21,-35,-1,-17,6,-17,-4,2,6,-1),
	    7 => w(2,-24,0,1,12,-9,-4,1,15,18,-6,5,8,-4,6,8,-11,-12,-1,1,4,-7,-1,-1,-14,-5,-5,0,18,-4,1,0),
	    8 => w(22,-5,-2,-7,1,0,18,-30,1,-4,19,0,5,-35,-5,10,9,-4,1,-15,-1,-9,22,-3,10,-6,-7,6,4,-8,4,-1),
	    9 => w(-5,3,2,15,-10,6,2,-7,-7,2,-8,0,-24,-5,-10,10,-15,0,7,4,8,-15,3,-16,1,5,3,-25,3,8,-1,-6),
	    10 => w(4,22,2,-12,0,-13,5,20,-4,-4,-16,14,8,-8,-15,2,-4,6,8,1,-4,47,-11,-6,2,-14,6,-7,10,2,2,-4),
	    11 => w(-2,-2,-2,2,1,-8,-2,3,8,34,12,4,1,6,5,9,-13,-4,12,5,2,-15,9,-4,-7,6,4,-6,8,-1,9,-7),
	    12 => w(4,-21,6,5,20,-9,-11,9,-1,10,3,15,0,7,5,-9,-9,-14,-17,23,4,3,-18,-6,-18,11,13,-20,32,-14,-9,-9),
	    13 => w(6,10,3,-7,10,-6,-1,-1,-19,-2,-18,2,-17,12,0,-9,-33,-3,-18,30,-8,9,2,19,5,11,-1,4,-2,4,9,-18),
	    14 => w(-13,31,-5,-11,-18,18,3,-6,-3,1,-4,4,0,11,10,-10,8,-4,9,-3,7,4,1,-8,-10,-1,0,34,5,3,7,-33),
	    15 => w(4,-14,-8,36,17,-15,17,3,9,9,-1,-1,10,-7,0,7,-19,2,-8,40,-2,-9,-8,-1,2,0,13,-2,17,-6,-37,-18)
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