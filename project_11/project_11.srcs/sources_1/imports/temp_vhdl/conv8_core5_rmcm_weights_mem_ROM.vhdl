library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv8_core5_rmcm_weightsconstant_memoryROM is
    generic
    (
        XI_WIDTH        	          : natural := 8;
        ARRAY_SIZE                    : natural := 16;
        WORDS_PER_ADDR                : natural := 9
    );
    Port (
        clk        : in std_logic;
        data_index : in unsigned(bits(ARRAY_SIZE-1)-1 downto 0);
        dout       : out std_logic_vector((XI_WIDTH * WORDS_PER_ADDR-1) downto 0)
    );
end conv8_core5_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv8_core5_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(-6,-10,-5,-10,-17,-9,-6,-10,-4),
	    1 => w(-13,-15,-5,-19,-22,-10,-11,-14,-5),
	    2 => w(6,9,4,8,13,6,4,6,2),
	    3 => w(-14,-14,-6,-15,-22,-15,-4,-13,-11),
	    4 => w(8,9,2,12,16,6,6,9,5),
	    5 => w(-9,-11,-5,-10,-16,-8,-4,-7,-4),
	    6 => w(-7,-11,-6,-13,-18,-9,-8,-11,-5),
	    7 => w(-6,-21,-5,-9,-33,-8,-7,-16,-4),
	    8 => w(-7,-7,-4,-9,-9,-3,-2,-3,-1),
	    9 => w(19,18,7,22,15,2,10,4,-1),
	    10 => w(15,16,5,17,18,5,5,4,1),
	    11 => w(-23,-28,-17,30,40,22,-16,-21,-12),
	    12 => w(6,11,6,11,15,7,7,8,3),
	    13 => w(-49,27,19,-62,5,15,-26,-10,6),
	    14 => w(-11,-16,-7,-16,-23,-10,-7,-10,-4),
	    15 => w(-18,14,11,-31,15,17,-21,3,9)
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