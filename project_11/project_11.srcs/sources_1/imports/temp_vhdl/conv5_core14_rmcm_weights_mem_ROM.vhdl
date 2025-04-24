library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv5_core14_rmcm_weightsconstant_memoryROM is
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
end conv5_core14_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv5_core14_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH)) & std_logic_vector(to_signed(w9, XI_WIDTH)) & std_logic_vector(to_signed(w10, XI_WIDTH)) & std_logic_vector(to_signed(w11, XI_WIDTH)) & std_logic_vector(to_signed(w12, XI_WIDTH)) & std_logic_vector(to_signed(w13, XI_WIDTH)) & std_logic_vector(to_signed(w14, XI_WIDTH)) & std_logic_vector(to_signed(w15, XI_WIDTH)) & std_logic_vector(to_signed(w16, XI_WIDTH)) & std_logic_vector(to_signed(w17, XI_WIDTH)) & std_logic_vector(to_signed(w18, XI_WIDTH)) & std_logic_vector(to_signed(w19, XI_WIDTH)) & std_logic_vector(to_signed(w20, XI_WIDTH)) & std_logic_vector(to_signed(w21, XI_WIDTH)) & std_logic_vector(to_signed(w22, XI_WIDTH)) & std_logic_vector(to_signed(w23, XI_WIDTH)) & std_logic_vector(to_signed(w24, XI_WIDTH)) & std_logic_vector(to_signed(w25, XI_WIDTH)) & std_logic_vector(to_signed(w26, XI_WIDTH)) & std_logic_vector(to_signed(w27, XI_WIDTH)) & std_logic_vector(to_signed(w28, XI_WIDTH)) & std_logic_vector(to_signed(w29, XI_WIDTH)) & std_logic_vector(to_signed(w30, XI_WIDTH)) & std_logic_vector(to_signed(w31, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(-3,-29,3,6,5,-3,-1,5,-22,13,-2,62,-2,-2,-2,-19,10,-5,0,8,0,2,1,-3,1,1,-2,3,2,-6,-4,1),
	    1 => w(-5,15,0,7,0,-13,-3,0,-6,-18,5,-3,1,-4,-28,1,4,3,-15,2,-1,-2,5,9,6,1,-1,-31,1,-1,-17,4),
	    2 => w(7,0,5,1,-4,1,4,-10,12,14,-2,1,5,-6,-1,3,-1,2,15,14,4,2,-2,-10,2,2,-17,-8,6,43,0,-9),
	    3 => w(1,0,2,10,0,-10,0,2,-1,0,8,-1,-1,1,-4,-24,20,-5,-10,-2,0,11,0,-4,1,-3,-2,-2,0,3,0,-1),
	    4 => w(0,3,-1,13,98,5,0,1,3,-3,-1,-1,1,18,0,0,-39,7,1,3,-1,2,0,56,-1,0,0,-4,-1,-1,3,1),
	    5 => w(0,3,-1,4,0,3,-9,1,-3,-2,1,2,0,0,-3,-1,1,-1,11,17,5,-2,-3,3,3,1,1,3,0,0,-3,1),
	    6 => w(-2,-1,3,5,-1,0,0,4,-1,4,-3,-41,-1,0,7,1,1,-1,14,1,0,-11,0,0,1,12,-2,-1,-2,3,1,4),
	    7 => w(0,1,1,0,0,-1,-1,0,1,1,0,0,0,-2,-31,1,-6,1,0,0,1,6,4,-1,1,0,0,1,1,-2,0,-1),
	    8 => w(-4,-2,2,-16,-30,2,2,2,-4,-6,1,-16,0,11,2,-3,5,6,0,3,2,2,6,12,-4,0,0,3,-3,6,1,0),
	    9 => w(0,1,1,12,-1,5,-10,-3,-8,-1,2,3,0,0,4,-1,-2,-4,15,34,-6,1,5,-9,2,1,1,2,1,1,1,-1),
	    10 => w(4,-2,-6,1,-6,0,-1,5,-2,-9,-10,-3,9,-4,-8,-1,-1,-1,-6,-2,3,-9,2,0,-1,5,2,7,14,-8,3,1),
	    11 => w(-1,2,0,-8,3,-4,1,-2,6,1,-3,3,0,-1,-5,3,-25,17,1,-1,0,-58,7,-3,1,1,-4,-6,3,5,-10,4),
	    12 => w(4,-1,5,-3,0,5,-1,0,-1,-7,1,0,4,-1,-1,3,5,-5,-1,-1,-1,42,5,-3,7,1,-6,-16,-3,-8,3,0),
	    13 => w(-5,2,-11,-23,1,0,-10,6,-1,0,-43,4,-2,0,1,2,-1,12,-4,4,-1,-11,12,24,2,-1,2,-2,7,2,2,2),
	    14 => w(-18,1,-12,-1,2,-4,1,10,2,0,33,4,5,1,30,3,0,-4,-3,5,5,7,-8,6,-6,2,-3,-5,9,7,-92,10),
	    15 => w(1,2,4,-4,0,-19,-13,7,-20,2,2,-14,1,1,-1,2,-3,5,-1,-25,1,-3,5,-1,8,0,2,1,1,18,-1,0)
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