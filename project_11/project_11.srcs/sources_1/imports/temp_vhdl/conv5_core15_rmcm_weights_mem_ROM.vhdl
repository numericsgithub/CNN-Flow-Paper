library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv5_core15_rmcm_weightsconstant_memoryROM is
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
end conv5_core15_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv5_core15_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH)) & std_logic_vector(to_signed(w9, XI_WIDTH)) & std_logic_vector(to_signed(w10, XI_WIDTH)) & std_logic_vector(to_signed(w11, XI_WIDTH)) & std_logic_vector(to_signed(w12, XI_WIDTH)) & std_logic_vector(to_signed(w13, XI_WIDTH)) & std_logic_vector(to_signed(w14, XI_WIDTH)) & std_logic_vector(to_signed(w15, XI_WIDTH)) & std_logic_vector(to_signed(w16, XI_WIDTH)) & std_logic_vector(to_signed(w17, XI_WIDTH)) & std_logic_vector(to_signed(w18, XI_WIDTH)) & std_logic_vector(to_signed(w19, XI_WIDTH)) & std_logic_vector(to_signed(w20, XI_WIDTH)) & std_logic_vector(to_signed(w21, XI_WIDTH)) & std_logic_vector(to_signed(w22, XI_WIDTH)) & std_logic_vector(to_signed(w23, XI_WIDTH)) & std_logic_vector(to_signed(w24, XI_WIDTH)) & std_logic_vector(to_signed(w25, XI_WIDTH)) & std_logic_vector(to_signed(w26, XI_WIDTH)) & std_logic_vector(to_signed(w27, XI_WIDTH)) & std_logic_vector(to_signed(w28, XI_WIDTH)) & std_logic_vector(to_signed(w29, XI_WIDTH)) & std_logic_vector(to_signed(w30, XI_WIDTH)) & std_logic_vector(to_signed(w31, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(-1,5,0,-4,-1,3,-1,0,2,-17,-2,-3,3,5,-2,4,6,-14,-4,-1,0,1,7,-3,6,1,3,0,-24,-28,-1,-1),
	    1 => w(-13,-4,29,18,1,-11,-3,6,-4,-1,21,6,1,0,3,1,-2,0,-10,2,0,-7,3,1,3,1,4,4,12,1,0,-1),
	    2 => w(40,1,6,0,-5,-1,-2,5,1,26,28,2,13,3,-23,-1,1,-1,2,3,-1,7,-3,9,20,-1,5,-4,-1,-1,6,0),
	    3 => w(0,2,-1,2,1,4,9,8,6,0,-4,36,0,1,-5,-3,-9,3,0,-47,0,-1,-7,3,8,-2,5,4,-12,-45,-2,2),
	    4 => w(7,22,0,-13,-10,2,1,1,-9,0,1,26,0,7,1,-9,-3,-4,3,4,1,5,3,1,-1,0,4,-4,0,-4,-3,-1),
	    5 => w(4,11,-5,-3,0,-8,-7,4,-2,0,-30,-5,11,-1,-16,2,-1,-7,10,-4,-1,7,0,-10,3,0,-13,-16,-8,2,3,-6),
	    6 => w(17,-2,-6,0,-3,2,10,-1,8,-4,-4,-8,8,-7,26,2,-3,-1,-9,1,9,3,5,-22,-6,0,-8,1,-4,10,-1,-19),
	    7 => w(0,0,-1,-4,-3,-64,1,10,3,0,9,5,1,-2,25,-9,16,-1,-3,2,3,-18,15,-3,-3,-2,-4,-2,-7,-10,-3,1),
	    8 => w(-2,-11,42,3,-6,0,15,-11,-5,-3,2,1,-1,4,-30,-1,0,6,16,10,10,-1,13,-3,-2,3,13,-14,7,6,31,-1),
	    9 => w(1,1,-2,-4,-1,-3,-5,0,-7,6,2,8,2,0,-2,22,8,2,-1,0,-1,-13,5,0,-9,1,-7,1,1,2,-4,-1),
	    10 => w(-2,8,4,-7,2,6,6,-18,4,-1,8,2,3,0,1,7,-3,0,4,2,-26,1,2,3,-1,0,1,0,2,-2,6,26),
	    11 => w(-1,-11,11,-3,4,-5,1,-78,-2,-8,-2,4,15,-9,0,-2,-4,-40,0,3,47,-9,1,-3,-10,17,0,-38,-3,-3,-6,0),
	    12 => w(9,-7,-1,-4,6,29,3,2,-5,1,-2,8,-25,-5,2,8,4,-10,0,-8,0,-2,0,-8,-1,0,2,-9,3,4,-2,0),
	    13 => w(-4,1,-3,9,0,7,-10,-3,-2,4,-6,0,6,-1,11,0,-4,-8,13,2,0,2,-5,-4,-6,5,2,-1,-4,-9,3,-6),
	    14 => w(-2,1,7,3,-2,-1,-1,2,1,8,5,5,7,-11,6,1,0,-18,-11,3,-9,-7,1,-4,4,2,-4,0,1,8,6,-5),
	    15 => w(2,-1,0,0,-2,-6,1,2,1,-1,-2,1,1,-2,-4,4,-15,11,-17,2,0,-35,-5,-7,-9,-3,4,-3,2,-1,-6,-3)
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