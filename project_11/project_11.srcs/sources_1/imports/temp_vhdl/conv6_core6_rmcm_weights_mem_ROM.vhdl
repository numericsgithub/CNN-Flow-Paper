library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv6_core6_rmcm_weightsconstant_memoryROM is
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
end conv6_core6_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv6_core6_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(-11,-6,-2,-11,1,-10,-8,-5,-1),
	    1 => w(-3,12,-4,-12,43,-13,-4,2,-3),
	    2 => w(-1,-9,-1,12,33,6,2,-5,-2),
	    3 => w(-11,-26,-3,14,37,-4,-5,7,-1),
	    4 => w(-3,26,2,-12,13,1,-9,-12,-3),
	    5 => w(7,9,-3,54,66,17,2,-1,-6),
	    6 => w(-4,-10,0,-5,-11,6,2,-5,1),
	    7 => w(5,-20,7,-33,72,-43,9,-24,11),
	    8 => w(19,38,6,-16,-31,-10,-5,8,-4),
	    9 => w(-21,22,21,28,-77,14,9,19,-12),
	    10 => w(3,-4,-3,-4,48,-4,-4,-1,-3),
	    11 => w(-5,-2,-5,6,57,-1,-4,-8,-4),
	    12 => w(5,-24,7,-12,33,-6,0,-1,-2),
	    13 => w(2,-7,-4,-4,-11,2,-5,2,-4),
	    14 => w(-3,-7,0,-1,-3,0,0,-2,1),
	    15 => w(2,18,-3,0,8,-3,1,-1,0)
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