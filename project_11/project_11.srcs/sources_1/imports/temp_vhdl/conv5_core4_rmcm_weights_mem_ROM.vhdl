library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv5_core4_rmcm_weightsconstant_memoryROM is
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
end conv5_core4_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv5_core4_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH)) & std_logic_vector(to_signed(w9, XI_WIDTH)) & std_logic_vector(to_signed(w10, XI_WIDTH)) & std_logic_vector(to_signed(w11, XI_WIDTH)) & std_logic_vector(to_signed(w12, XI_WIDTH)) & std_logic_vector(to_signed(w13, XI_WIDTH)) & std_logic_vector(to_signed(w14, XI_WIDTH)) & std_logic_vector(to_signed(w15, XI_WIDTH)) & std_logic_vector(to_signed(w16, XI_WIDTH)) & std_logic_vector(to_signed(w17, XI_WIDTH)) & std_logic_vector(to_signed(w18, XI_WIDTH)) & std_logic_vector(to_signed(w19, XI_WIDTH)) & std_logic_vector(to_signed(w20, XI_WIDTH)) & std_logic_vector(to_signed(w21, XI_WIDTH)) & std_logic_vector(to_signed(w22, XI_WIDTH)) & std_logic_vector(to_signed(w23, XI_WIDTH)) & std_logic_vector(to_signed(w24, XI_WIDTH)) & std_logic_vector(to_signed(w25, XI_WIDTH)) & std_logic_vector(to_signed(w26, XI_WIDTH)) & std_logic_vector(to_signed(w27, XI_WIDTH)) & std_logic_vector(to_signed(w28, XI_WIDTH)) & std_logic_vector(to_signed(w29, XI_WIDTH)) & std_logic_vector(to_signed(w30, XI_WIDTH)) & std_logic_vector(to_signed(w31, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(-1,6,-6,-2,3,3,2,-2,11,-5,-1,-37,1,-25,2,-20,11,11,1,-8,-2,13,0,5,4,-1,-6,-2,1,7,-5,-1),
	    1 => w(-2,-13,0,0,0,-1,6,2,9,12,-10,2,1,3,23,-2,1,-4,-16,23,-1,-2,-6,-1,21,-2,-1,16,-2,-3,10,-3),
	    2 => w(11,2,-15,-15,2,-1,-5,12,-14,-2,3,-5,-10,1,8,0,-3,-4,-14,-3,-5,16,-2,17,3,4,12,-4,0,-29,8,22),
	    3 => w(0,-2,2,-18,1,15,-1,0,1,-1,-12,1,0,-4,1,22,-14,17,10,4,0,4,-11,-16,3,2,4,7,-2,-2,-9,-2),
	    4 => w(1,10,3,-2,4,0,5,-2,1,-3,-1,1,1,-7,6,-8,4,-4,0,-6,1,-2,-7,1,0,0,2,69,-2,-4,-4,1),
	    5 => w(0,0,-1,2,3,-3,-4,6,10,-2,-1,1,1,-1,-1,2,-1,-3,-9,0,0,1,5,-4,4,-3,11,-13,-2,1,1,-10),
	    6 => w(3,-5,6,-3,2,-8,2,17,-2,4,-4,0,-13,-1,0,-6,3,-2,-7,-2,33,1,2,3,2,-1,-1,-2,-4,-1,-1,17),
	    7 => w(-1,1,0,1,-6,4,-1,-8,-2,1,0,0,0,-8,2,3,7,8,1,3,-2,-10,-3,1,5,-1,1,13,-2,-2,5,2),
	    8 => w(0,-12,-11,-8,-23,-2,-2,5,-2,17,1,58,1,-48,0,-45,-4,-14,-1,-3,1,4,-2,-22,-3,0,1,4,3,-2,4,2),
	    9 => w(4,17,-2,-7,1,-8,0,-1,10,-2,-6,1,0,0,-22,-2,3,-3,-18,-15,1,-2,16,7,5,2,-4,-12,2,0,0,9),
	    10 => w(-3,0,-11,4,-3,2,5,1,-2,22,6,6,0,-4,-10,1,4,-1,-5,14,13,-1,-1,0,1,-8,-12,5,2,26,0,4),
	    11 => w(-1,4,-1,5,1,10,-1,7,-4,2,4,2,1,3,17,-8,42,2,-4,-1,-1,5,-10,6,2,-5,-1,-3,5,3,7,2),
	    12 => w(4,0,8,1,2,5,0,1,-1,21,2,0,5,-5,1,-3,1,2,3,0,0,-37,1,2,6,0,-4,-12,-13,5,-2,2),
	    13 => w(12,13,-25,35,1,13,-2,9,2,4,19,-7,1,-1,2,4,0,9,-7,1,-1,-3,16,-27,3,-2,3,0,-4,2,9,-25),
	    14 => w(-45,-2,-8,-1,-2,0,1,23,6,-6,6,4,-22,-6,-36,4,1,-4,-7,-22,17,0,-2,-9,14,1,-42,-2,-3,-2,3,13),
	    15 => w(-1,-5,0,-13,-1,-9,-14,15,12,2,4,11,1,-4,1,1,-1,-15,-6,27,-1,3,4,-13,-6,3,-1,-3,5,-32,-3,-1)
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