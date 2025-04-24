library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv5_core3_rmcm_weightsconstant_memoryROM is
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
end conv5_core3_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv5_core3_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH)) & std_logic_vector(to_signed(w9, XI_WIDTH)) & std_logic_vector(to_signed(w10, XI_WIDTH)) & std_logic_vector(to_signed(w11, XI_WIDTH)) & std_logic_vector(to_signed(w12, XI_WIDTH)) & std_logic_vector(to_signed(w13, XI_WIDTH)) & std_logic_vector(to_signed(w14, XI_WIDTH)) & std_logic_vector(to_signed(w15, XI_WIDTH)) & std_logic_vector(to_signed(w16, XI_WIDTH)) & std_logic_vector(to_signed(w17, XI_WIDTH)) & std_logic_vector(to_signed(w18, XI_WIDTH)) & std_logic_vector(to_signed(w19, XI_WIDTH)) & std_logic_vector(to_signed(w20, XI_WIDTH)) & std_logic_vector(to_signed(w21, XI_WIDTH)) & std_logic_vector(to_signed(w22, XI_WIDTH)) & std_logic_vector(to_signed(w23, XI_WIDTH)) & std_logic_vector(to_signed(w24, XI_WIDTH)) & std_logic_vector(to_signed(w25, XI_WIDTH)) & std_logic_vector(to_signed(w26, XI_WIDTH)) & std_logic_vector(to_signed(w27, XI_WIDTH)) & std_logic_vector(to_signed(w28, XI_WIDTH)) & std_logic_vector(to_signed(w29, XI_WIDTH)) & std_logic_vector(to_signed(w30, XI_WIDTH)) & std_logic_vector(to_signed(w31, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(-12,-1,-2,21,25,-40,-2,0,8,-4,4,-8,30,-7,-1,-1,-8,-6,0,-6,1,-2,7,-2,-1,1,2,-2,-5,3,2,0),
	    1 => w(1,9,-4,-5,0,-5,-16,-3,2,3,2,5,-15,0,-2,0,-1,-2,-8,3,0,-2,-4,0,-8,-2,-1,2,0,10,1,-4),
	    2 => w(-10,2,5,2,3,1,1,-1,-3,-18,-4,15,-14,16,-3,5,0,15,-41,-7,6,-36,2,6,-1,-4,5,-4,4,-13,-12,-13),
	    3 => w(-2,6,-3,2,0,-9,0,-6,-4,1,4,-3,1,-1,70,2,-7,-3,18,1,2,21,4,-3,2,1,-4,-2,2,0,-5,5),
	    4 => w(0,-13,13,-1,2,0,-2,-7,2,-1,0,3,1,1,1,-2,1,-2,4,3,1,0,0,0,0,0,12,36,0,0,-6,2),
	    5 => w(-2,8,1,-3,2,8,-3,3,-4,4,-3,-6,2,0,4,4,-10,0,-8,-4,0,-2,20,2,-10,0,1,-7,0,2,-2,1),
	    6 => w(-2,21,6,22,-14,3,2,32,1,12,0,2,-2,-2,8,-1,-7,1,14,7,13,-2,8,13,0,1,7,2,-1,5,-1,17),
	    7 => w(-1,-2,3,0,-4,5,1,11,-1,-9,-2,-2,5,-16,4,1,-8,-1,-1,-6,15,3,-5,-1,-27,-1,6,-22,4,1,-3,1),
	    8 => w(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	    9 => w(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	    10 => w(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	    11 => w(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	    12 => w(2,7,4,11,-11,-3,0,-6,-22,30,2,22,3,5,3,-14,-19,6,4,19,-4,-3,6,3,-10,2,0,-6,-8,7,18,1),
	    13 => w(-5,17,-5,-3,1,-4,4,3,13,-9,7,1,15,-3,-27,3,-4,7,29,1,0,-8,-2,-1,10,-3,5,-33,-5,0,-9,1),
	    14 => w(-11,-7,0,0,0,-2,12,-12,-23,5,3,-5,4,-11,-2,6,-10,-3,-2,1,9,-8,7,-44,-6,-2,-1,15,0,36,4,-13),
	    15 => w(-4,11,-3,16,-8,6,1,-14,-10,0,11,-3,1,-2,-13,-37,11,-24,1,6,3,-5,15,8,5,-2,-5,1,3,1,2,2)
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