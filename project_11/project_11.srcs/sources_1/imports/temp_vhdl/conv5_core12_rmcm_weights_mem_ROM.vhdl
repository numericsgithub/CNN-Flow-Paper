library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv5_core12_rmcm_weightsconstant_memoryROM is
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
end conv5_core12_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv5_core12_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH)) & std_logic_vector(to_signed(w9, XI_WIDTH)) & std_logic_vector(to_signed(w10, XI_WIDTH)) & std_logic_vector(to_signed(w11, XI_WIDTH)) & std_logic_vector(to_signed(w12, XI_WIDTH)) & std_logic_vector(to_signed(w13, XI_WIDTH)) & std_logic_vector(to_signed(w14, XI_WIDTH)) & std_logic_vector(to_signed(w15, XI_WIDTH)) & std_logic_vector(to_signed(w16, XI_WIDTH)) & std_logic_vector(to_signed(w17, XI_WIDTH)) & std_logic_vector(to_signed(w18, XI_WIDTH)) & std_logic_vector(to_signed(w19, XI_WIDTH)) & std_logic_vector(to_signed(w20, XI_WIDTH)) & std_logic_vector(to_signed(w21, XI_WIDTH)) & std_logic_vector(to_signed(w22, XI_WIDTH)) & std_logic_vector(to_signed(w23, XI_WIDTH)) & std_logic_vector(to_signed(w24, XI_WIDTH)) & std_logic_vector(to_signed(w25, XI_WIDTH)) & std_logic_vector(to_signed(w26, XI_WIDTH)) & std_logic_vector(to_signed(w27, XI_WIDTH)) & std_logic_vector(to_signed(w28, XI_WIDTH)) & std_logic_vector(to_signed(w29, XI_WIDTH)) & std_logic_vector(to_signed(w30, XI_WIDTH)) & std_logic_vector(to_signed(w31, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(0,8,1,2,2,-1,-13,-4,5,3,-2,2,1,-4,28,-5,5,-3,-7,-4,-12,1,-26,0,2,-3,-16,-29,3,-3,-40,4),
	    1 => w(-1,4,5,-1,1,-1,-1,1,1,2,-5,-1,0,0,2,-18,-2,-5,-5,0,0,1,-6,-1,-6,1,5,0,0,-4,-6,4),
	    2 => w(2,-25,-18,15,-13,-1,-3,-5,2,3,-2,2,-2,1,8,-14,5,0,7,-1,34,-1,5,5,1,1,1,2,0,3,-2,-16),
	    3 => w(2,2,-7,-1,-8,3,1,37,5,5,-2,-3,-13,10,2,2,-3,26,0,3,-24,2,-2,0,10,-12,1,19,4,1,2,2),
	    4 => w(-1,5,7,1,-3,1,2,-4,22,-2,1,-6,0,-1,-8,1,0,1,-3,0,-7,-2,-6,1,-5,-8,-9,1,5,4,-28,2),
	    5 => w(-2,5,0,2,1,12,-2,-2,0,-14,-2,-28,-2,0,1,3,2,-6,4,-2,0,-3,0,4,-5,4,3,-1,-4,-1,26,-15),
	    6 => w(-2,-14,3,-18,39,-10,-18,0,-11,-12,-7,-1,20,-4,0,7,12,1,-5,6,-1,-1,72,-1,-1,1,3,-1,15,3,-3,-6),
	    7 => w(0,8,10,89,-2,1,0,2,2,2,41,1,1,-2,-2,1,-2,-9,7,1,-7,-23,1,-1,52,-2,-9,7,1,0,0,-1),
	    8 => w(-1,-2,-1,0,-1,2,-1,3,16,0,0,3,0,-2,-1,1,2,-1,-3,0,-1,2,7,-1,3,-17,-23,1,-2,-5,-37,-1),
	    9 => w(0,-3,2,-3,0,-5,-1,1,0,-26,-2,-51,0,-2,-2,-2,-1,2,0,0,-1,89,-1,-1,3,-2,-2,-2,-2,1,22,1),
	    10 => w(2,-29,-2,-2,0,-15,-50,-1,5,5,8,1,-9,2,0,-5,10,0,4,-5,-7,1,30,2,1,0,-4,-1,-7,-2,3,-17),
	    11 => w(0,1,10,52,-7,2,0,-14,-1,-1,23,-1,-1,5,3,1,-1,4,-2,0,2,19,-1,2,9,1,-22,-9,-2,0,0,0),
	    12 => w(3,4,0,18,-21,-7,0,-1,-3,-20,0,-6,-2,4,-1,0,-86,-1,0,-1,-1,-4,-5,-25,-1,0,-1,2,2,2,6,-1),
	    13 => w(-1,2,3,-5,0,1,56,-1,-2,0,-4,3,2,0,6,1,0,1,-6,2,-3,-1,-1,4,4,-1,0,-2,1,0,3,3),
	    14 => w(1,1,-1,-4,-2,-1,4,-1,-3,-5,3,4,12,-3,16,1,-1,0,-7,0,-2,-7,0,5,-3,-6,5,-1,-2,-2,0,-3),
	    15 => w(0,2,0,-1,-1,19,0,1,-1,2,1,0,0,-3,16,2,-9,-5,1,3,1,3,-3,1,-1,-1,1,2,1,-4,2,1)
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