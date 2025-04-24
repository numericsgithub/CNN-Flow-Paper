library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core25_rmcm_weightsconstant_memoryROM is
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
end conv7_core25_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv7_core25_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH)) & std_logic_vector(to_signed(w9, XI_WIDTH)) & std_logic_vector(to_signed(w10, XI_WIDTH)) & std_logic_vector(to_signed(w11, XI_WIDTH)) & std_logic_vector(to_signed(w12, XI_WIDTH)) & std_logic_vector(to_signed(w13, XI_WIDTH)) & std_logic_vector(to_signed(w14, XI_WIDTH)) & std_logic_vector(to_signed(w15, XI_WIDTH)) & std_logic_vector(to_signed(w16, XI_WIDTH)) & std_logic_vector(to_signed(w17, XI_WIDTH)) & std_logic_vector(to_signed(w18, XI_WIDTH)) & std_logic_vector(to_signed(w19, XI_WIDTH)) & std_logic_vector(to_signed(w20, XI_WIDTH)) & std_logic_vector(to_signed(w21, XI_WIDTH)) & std_logic_vector(to_signed(w22, XI_WIDTH)) & std_logic_vector(to_signed(w23, XI_WIDTH)) & std_logic_vector(to_signed(w24, XI_WIDTH)) & std_logic_vector(to_signed(w25, XI_WIDTH)) & std_logic_vector(to_signed(w26, XI_WIDTH)) & std_logic_vector(to_signed(w27, XI_WIDTH)) & std_logic_vector(to_signed(w28, XI_WIDTH)) & std_logic_vector(to_signed(w29, XI_WIDTH)) & std_logic_vector(to_signed(w30, XI_WIDTH)) & std_logic_vector(to_signed(w31, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(-6,8,0,-19,10,7,0,39,-6,-4,-36,2,-15,0,-19,6,3,-25,-17,6,1,6,-17,-15,2,-10,2,-5,-11,8,-7,-5),
	    1 => w(6,-8,-22,-4,27,-13,-13,35,6,-3,-2,0,45,3,6,-38,14,7,7,-1,5,-9,-9,-16,-3,-11,3,-23,-5,-7,-6,-24),
	    2 => w(-14,-6,4,12,0,77,6,-19,-13,5,-68,-1,-8,-9,0,5,1,1,-21,-12,0,25,-15,20,-70,-1,-3,73,4,-6,-3,-3),
	    3 => w(-5,2,-1,-5,-2,24,19,-16,-8,8,-14,6,-2,-4,1,-3,-32,-13,-5,4,-10,25,1,-14,-25,4,-3,8,22,9,-3,-29),
	    4 => w(10,-21,10,-7,1,-26,8,8,2,5,4,2,-2,-1,-3,-24,-1,-1,-3,-17,-14,7,12,-7,-6,0,2,-7,8,3,-9,6),
	    5 => w(-1,-1,-9,-5,3,1,-4,-5,-5,-3,-2,1,17,10,-2,7,10,1,0,-5,7,5,-4,-12,2,1,-20,-11,0,0,2,0),
	    6 => w(9,-14,-3,0,6,11,-1,3,4,2,5,1,-9,2,-6,6,-5,24,4,2,-3,3,-5,1,-2,-1,-29,-17,-5,-16,0,-20),
	    7 => w(2,-3,2,-3,-8,-2,-7,2,-2,7,1,-5,0,-2,-3,-3,4,-2,-31,-9,1,-4,-4,-1,1,0,-15,2,-7,7,-26,3),
	    8 => w(1,0,4,15,40,-2,3,-4,-1,1,-4,-1,16,11,5,-3,18,-3,3,5,-1,-34,11,70,-28,-4,-2,3,18,-13,8,8),
	    9 => w(0,1,2,0,-5,4,-1,-2,-10,0,-1,0,6,0,0,19,0,0,3,7,-74,-5,-2,-6,3,1,0,-4,-3,-3,0,2),
	    10 => w(2,1,2,-5,2,5,1,-2,-4,-8,-3,6,0,-3,-1,-3,-4,1,0,-2,3,7,0,5,-3,1,2,-2,4,-1,-1,1),
	    11 => w(-2,2,0,-3,-21,3,4,-14,-1,-3,0,-2,-1,0,-2,-31,7,6,-1,-2,1,1,12,2,80,1,2,3,2,-1,-3,-2),
	    12 => w(-5,-6,59,0,4,-4,-11,1,2,1,7,-7,6,8,5,38,-2,3,14,52,6,1,0,9,7,1,1,2,3,-1,2,1),
	    13 => w(-1,2,1,-6,-7,-1,4,-3,-4,0,-16,6,1,0,-3,-2,3,1,-15,-12,-2,7,-47,1,-3,-1,-8,17,-1,-1,-6,17),
	    14 => w(10,-23,-9,-8,8,-3,0,3,7,1,5,6,37,1,-7,2,7,10,-4,2,-3,-17,11,3,6,-1,-36,11,-4,16,-1,28),
	    15 => w(-3,0,-4,-47,-2,1,5,-7,-4,-2,2,1,-3,2,-5,-1,12,1,-42,63,2,1,-1,-1,-5,3,-8,1,6,-1,52,-7)
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