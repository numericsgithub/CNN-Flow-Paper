library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv5_core9_rmcm_weightsconstant_memoryROM is
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
end conv5_core9_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv5_core9_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH)) & std_logic_vector(to_signed(w9, XI_WIDTH)) & std_logic_vector(to_signed(w10, XI_WIDTH)) & std_logic_vector(to_signed(w11, XI_WIDTH)) & std_logic_vector(to_signed(w12, XI_WIDTH)) & std_logic_vector(to_signed(w13, XI_WIDTH)) & std_logic_vector(to_signed(w14, XI_WIDTH)) & std_logic_vector(to_signed(w15, XI_WIDTH)) & std_logic_vector(to_signed(w16, XI_WIDTH)) & std_logic_vector(to_signed(w17, XI_WIDTH)) & std_logic_vector(to_signed(w18, XI_WIDTH)) & std_logic_vector(to_signed(w19, XI_WIDTH)) & std_logic_vector(to_signed(w20, XI_WIDTH)) & std_logic_vector(to_signed(w21, XI_WIDTH)) & std_logic_vector(to_signed(w22, XI_WIDTH)) & std_logic_vector(to_signed(w23, XI_WIDTH)) & std_logic_vector(to_signed(w24, XI_WIDTH)) & std_logic_vector(to_signed(w25, XI_WIDTH)) & std_logic_vector(to_signed(w26, XI_WIDTH)) & std_logic_vector(to_signed(w27, XI_WIDTH)) & std_logic_vector(to_signed(w28, XI_WIDTH)) & std_logic_vector(to_signed(w29, XI_WIDTH)) & std_logic_vector(to_signed(w30, XI_WIDTH)) & std_logic_vector(to_signed(w31, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(-5,15,2,0,-3,3,-2,2,-1,-8,0,-2,-2,2,-1,6,11,-5,0,1,1,-10,-1,4,-6,0,2,-1,3,12,1,0),
	    1 => w(-7,2,8,-41,0,4,0,-12,0,-1,2,4,-3,1,-1,0,2,-2,4,-1,0,0,-1,2,1,1,1,0,-1,-3,0,6),
	    2 => w(57,4,2,-1,-6,-1,2,-5,-1,6,-14,0,7,-1,10,3,1,3,1,9,-1,2,3,6,1,0,9,6,13,2,-74,5),
	    3 => w(0,4,1,2,-1,-9,-2,-2,-4,0,2,16,2,1,1,1,-2,-1,10,-31,-2,-2,3,3,7,-2,-2,-3,1,2,-1,0),
	    4 => w(-2,2,15,0,0,-2,1,11,-6,-1,-1,1,1,1,1,-2,1,-1,6,1,1,2,13,2,1,3,37,-4,-1,0,50,7),
	    5 => w(-1,0,2,6,3,-1,-1,1,-2,-3,-1,-1,0,0,-5,-1,1,5,-1,-2,0,-10,0,-3,-2,-1,-1,-4,-2,2,-1,-7),
	    6 => w(-1,1,9,-90,36,-9,0,5,3,6,5,2,-7,3,0,15,-3,0,1,-1,4,2,19,-1,0,0,-1,-1,-9,0,2,5),
	    7 => w(1,-75,53,16,0,4,1,-4,0,8,-2,0,-7,-3,0,1,1,-1,-1,-2,8,-4,-3,-1,6,2,-5,-11,-3,-2,1,1),
	    8 => w(-14,-11,-2,9,-35,-10,-2,2,1,9,-4,8,27,4,0,9,-8,0,2,5,-1,2,-4,-4,8,0,0,9,3,-4,2,0),
	    9 => w(-2,7,2,2,-1,-9,27,3,-3,1,2,-3,-14,-1,-2,0,1,3,13,-2,0,2,-8,0,-5,4,-1,-9,-2,-11,-4,-5),
	    10 => w(-4,2,5,4,-2,0,2,0,11,15,5,-16,-16,11,-1,-1,-2,-13,20,-8,-6,56,0,5,4,2,5,-6,-9,-3,21,0),
	    11 => w(3,-1,1,0,-4,-12,2,-7,-2,0,-1,-5,-1,-3,34,-4,11,9,-8,6,-2,-28,2,3,-6,0,-4,-3,-4,7,-3,-5),
	    12 => w(-8,27,-2,-7,-5,1,23,-7,-2,-19,-5,1,0,-2,-13,2,15,5,-5,19,-2,1,29,13,-2,0,13,29,7,9,2,0),
	    13 => w(-2,6,14,13,4,9,4,-18,0,4,-3,26,-2,0,-3,8,22,-4,10,2,0,-3,-34,-22,-26,18,6,0,3,-16,2,-7),
	    14 => w(26,14,21,3,-17,5,4,-36,-4,-10,-27,1,10,-9,-5,5,2,-3,-3,11,-47,0,6,7,6,-2,2,-3,2,5,-16,-4),
	    15 => w(0,20,-6,-3,4,8,0,-17,-3,-5,0,3,3,-12,8,2,-3,-18,2,-1,-3,8,-3,-3,8,9,6,0,5,-14,-3,-6)
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