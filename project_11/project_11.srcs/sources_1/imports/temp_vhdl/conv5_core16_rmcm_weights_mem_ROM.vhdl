library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv5_core16_rmcm_weightsconstant_memoryROM is
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
end conv5_core16_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv5_core16_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH)) & std_logic_vector(to_signed(w9, XI_WIDTH)) & std_logic_vector(to_signed(w10, XI_WIDTH)) & std_logic_vector(to_signed(w11, XI_WIDTH)) & std_logic_vector(to_signed(w12, XI_WIDTH)) & std_logic_vector(to_signed(w13, XI_WIDTH)) & std_logic_vector(to_signed(w14, XI_WIDTH)) & std_logic_vector(to_signed(w15, XI_WIDTH)) & std_logic_vector(to_signed(w16, XI_WIDTH)) & std_logic_vector(to_signed(w17, XI_WIDTH)) & std_logic_vector(to_signed(w18, XI_WIDTH)) & std_logic_vector(to_signed(w19, XI_WIDTH)) & std_logic_vector(to_signed(w20, XI_WIDTH)) & std_logic_vector(to_signed(w21, XI_WIDTH)) & std_logic_vector(to_signed(w22, XI_WIDTH)) & std_logic_vector(to_signed(w23, XI_WIDTH)) & std_logic_vector(to_signed(w24, XI_WIDTH)) & std_logic_vector(to_signed(w25, XI_WIDTH)) & std_logic_vector(to_signed(w26, XI_WIDTH)) & std_logic_vector(to_signed(w27, XI_WIDTH)) & std_logic_vector(to_signed(w28, XI_WIDTH)) & std_logic_vector(to_signed(w29, XI_WIDTH)) & std_logic_vector(to_signed(w30, XI_WIDTH)) & std_logic_vector(to_signed(w31, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(0,4,9,0,-18,3,-2,-1,3,2,5,-7,1,6,4,14,4,2,1,-3,2,1,15,0,-7,-1,7,-39,0,5,-23,1),
	    1 => w(1,-13,2,1,2,0,2,-1,-7,10,-5,1,2,1,29,-1,-6,3,45,-14,1,-3,13,1,-4,-3,-1,6,1,1,0,-10),
	    2 => w(10,3,-18,-10,-5,0,-7,9,-7,-6,-1,-1,-19,2,4,2,3,-4,-19,-7,-17,8,4,20,0,3,10,24,7,-19,2,20),
	    3 => w(-5,-1,0,-17,-3,6,1,-1,-4,-1,-5,1,-1,-1,-2,17,3,20,18,-3,-2,-11,5,-13,-2,4,15,-3,-3,0,-3,6),
	    4 => w(-1,5,-17,3,2,1,-7,-38,-4,0,1,4,0,-2,-4,6,-2,0,-21,-3,46,1,-23,2,-1,-1,5,-20,2,-3,50,-26),
	    5 => w(-2,3,1,-2,-11,0,-2,3,4,-8,-3,-4,0,-1,-3,-6,-5,-1,-4,1,0,1,0,0,24,-1,3,0,0,-1,-2,1),
	    6 => w(4,-12,0,-77,-3,-6,-1,12,-2,-1,-1,0,1,1,4,38,1,-1,4,5,14,1,1,0,1,-2,2,0,1,2,0,-11),
	    7 => w(-2,-30,-23,0,10,-4,0,22,-1,-30,-2,-1,18,10,0,-1,-2,26,-2,1,26,5,3,-1,36,-6,1,-32,2,-1,1,1),
	    8 => w(-3,6,3,-3,-2,1,-1,1,39,-2,3,-8,0,2,2,-1,-5,-1,0,-2,1,-1,0,1,-3,2,0,-4,0,3,20,0),
	    9 => w(0,-6,1,2,-1,-2,1,-1,1,32,-2,-11,2,-30,-5,0,-3,0,7,-2,1,-1,2,1,2,-2,-1,-9,-1,0,-39,4),
	    10 => w(2,-30,-2,2,0,0,-24,-8,-8,-5,4,-3,-4,1,2,3,23,0,-9,0,1,1,1,-5,-1,1,-2,1,3,-4,1,33),
	    11 => w(-1,-1,0,-47,-46,1,0,-3,0,-1,12,1,-2,6,3,-16,5,-1,9,-1,6,-10,0,1,-11,0,54,-6,1,3,2,2),
	    12 => w(9,13,3,0,4,-1,0,-3,-6,12,1,-7,5,-2,-1,-3,1,12,1,2,0,10,13,0,20,-3,-4,-30,25,5,-11,1),
	    13 => w(0,25,-4,-12,2,29,-3,14,8,7,-5,-3,4,1,-3,5,0,8,-3,5,0,4,5,2,-7,-6,-20,3,-31,3,6,-23),
	    14 => w(4,-8,-17,0,-4,4,7,-14,23,16,-18,1,-23,5,9,-14,3,-7,0,-16,5,2,-14,-9,1,1,-20,-5,-38,-7,-14,7),
	    15 => w(0,-16,5,-29,5,-12,4,2,30,2,6,-13,1,0,-10,4,0,-9,-7,-5,3,10,-1,-14,3,5,0,-2,40,-8,-2,2)
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