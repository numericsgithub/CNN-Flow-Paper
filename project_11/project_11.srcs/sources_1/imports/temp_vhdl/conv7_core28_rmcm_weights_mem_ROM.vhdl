library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core28_rmcm_weightsconstant_memoryROM is
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
end conv7_core28_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv7_core28_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH)) & std_logic_vector(to_signed(w9, XI_WIDTH)) & std_logic_vector(to_signed(w10, XI_WIDTH)) & std_logic_vector(to_signed(w11, XI_WIDTH)) & std_logic_vector(to_signed(w12, XI_WIDTH)) & std_logic_vector(to_signed(w13, XI_WIDTH)) & std_logic_vector(to_signed(w14, XI_WIDTH)) & std_logic_vector(to_signed(w15, XI_WIDTH)) & std_logic_vector(to_signed(w16, XI_WIDTH)) & std_logic_vector(to_signed(w17, XI_WIDTH)) & std_logic_vector(to_signed(w18, XI_WIDTH)) & std_logic_vector(to_signed(w19, XI_WIDTH)) & std_logic_vector(to_signed(w20, XI_WIDTH)) & std_logic_vector(to_signed(w21, XI_WIDTH)) & std_logic_vector(to_signed(w22, XI_WIDTH)) & std_logic_vector(to_signed(w23, XI_WIDTH)) & std_logic_vector(to_signed(w24, XI_WIDTH)) & std_logic_vector(to_signed(w25, XI_WIDTH)) & std_logic_vector(to_signed(w26, XI_WIDTH)) & std_logic_vector(to_signed(w27, XI_WIDTH)) & std_logic_vector(to_signed(w28, XI_WIDTH)) & std_logic_vector(to_signed(w29, XI_WIDTH)) & std_logic_vector(to_signed(w30, XI_WIDTH)) & std_logic_vector(to_signed(w31, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(-1,-20,-6,2,4,12,12,3,3,-4,-1,6,-3,10,-10,-30,2,-1,-22,-6,-3,6,-8,-6,-3,0,1,-9,0,-5,-6,-1),
	    1 => w(10,0,-4,15,0,-5,-7,6,4,-5,-7,-1,-7,2,-5,3,2,0,8,4,4,-5,-7,16,0,-5,-19,-53,2,5,6,-1),
	    2 => w(3,23,8,8,0,-3,4,23,-8,4,-4,9,9,-5,-5,-2,-2,15,-2,2,4,8,8,-8,5,0,-13,5,2,-1,2,9),
	    3 => w(9,4,-4,13,7,-1,-23,-1,-2,3,3,-5,4,2,0,0,2,-3,-5,1,-3,-15,-3,1,1,0,-2,-1,9,-1,-1,8),
	    4 => w(-10,-3,-10,-5,25,1,4,-15,-9,-1,0,9,3,3,3,2,6,-20,10,-3,0,-13,-19,11,-36,-5,21,-11,18,39,4,7),
	    5 => w(4,1,1,-2,4,0,-1,-5,25,1,4,-2,9,14,-9,-13,15,1,0,25,-4,11,6,50,-2,1,-2,22,-21,8,12,-38),
	    6 => w(4,-25,-1,32,-26,16,5,-35,13,4,3,-15,-7,2,7,-4,-2,12,6,-3,5,10,-10,7,-15,-5,2,-9,5,7,-2,5),
	    7 => w(1,7,5,4,-23,2,-5,-14,-9,10,2,-8,-1,-5,-5,-2,5,6,0,-7,5,0,-3,3,5,-1,0,-21,-2,1,-18,-9),
	    8 => w(10,15,4,1,-4,16,-1,34,12,7,10,7,4,-11,8,9,5,-3,-7,9,10,2,25,8,-35,19,-8,4,-1,-6,3,11),
	    9 => w(2,7,-10,11,10,17,9,-17,-38,-5,10,5,6,0,10,5,8,-1,-3,-20,5,9,10,-20,-6,-7,6,9,1,36,-5,-11),
	    10 => w(7,25,-6,-14,-28,25,-3,-8,-2,6,45,-4,8,4,7,-3,-6,4,8,2,-4,1,2,52,-4,-6,10,-9,-10,34,1,1),
	    11 => w(1,-34,-5,8,-26,31,-10,37,-45,-20,1,-11,2,-4,-4,-7,-2,-2,16,4,-3,-8,8,-15,-7,1,17,-8,1,24,11,0),
	    12 => w(34,4,-10,-1,0,-14,3,1,2,4,2,17,-3,-19,1,-10,-2,5,-12,16,-47,-1,-9,2,-14,4,4,9,3,8,-7,6),
	    13 => w(6,3,-1,83,-8,-3,-9,-6,-2,-3,-17,1,3,3,-4,-4,-2,5,18,9,-7,4,0,10,11,12,-12,-4,2,0,-6,1),
	    14 => w(4,61,-1,10,6,-7,2,4,10,6,5,-9,18,1,0,20,-3,-1,12,5,11,0,4,1,5,2,-3,-3,-7,14,1,-5),
	    15 => w(2,-4,-4,-6,-3,-2,-1,-4,-6,3,0,0,-1,3,2,-2,1,0,-4,-1,-5,-1,4,-1,6,0,11,4,7,3,-26,-8)
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