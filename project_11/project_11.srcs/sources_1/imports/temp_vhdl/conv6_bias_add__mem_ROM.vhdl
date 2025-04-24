library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv6_bias_add_constant_memoryROM is
    generic
    (
        XI_WIDTH        	          : natural := 8;
        ARRAY_SIZE                    : natural := 16;
        WORDS_PER_ADDR                : natural := 8
    );
    Port (
        clk        : in std_logic;
        data_index : in unsigned(bits(ARRAY_SIZE-1)-1 downto 0);
        dout       : out std_logic_vector((XI_WIDTH * WORDS_PER_ADDR-1) downto 0)
    );
end conv6_bias_add_constant_memoryROM;

architecture Behavioral of conv6_bias_add_constant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(9,19,-4,-2,4,9,8,9),
	    1 => w(21,-1,8,4,8,-4,2,2),
	    2 => w(-5,1,9,4,2,-8,16,-1),
	    3 => w(20,-53,2,-8,1,0,18,5),
	    4 => w(5,10,12,12,-12,5,-1,1),
	    5 => w(16,0,3,18,32,-45,0,10),
	    6 => w(18,10,14,-6,115,11,-3,-2),
	    7 => w(-11,23,5,8,-7,26,-4,6),
	    8 => w(0,-3,-14,-2,10,-1,-8,9),
	    9 => w(14,1,7,-7,19,24,-3,3),
	    10 => w(1,5,2,3,16,-12,12,3),
	    11 => w(14,0,1,3,-6,0,0,12),
	    12 => w(-4,26,2,-3,1,0,56,4),
	    13 => w(-2,0,-3,0,3,6,9,12),
	    14 => w(-1,6,12,-1,-1,13,14,12),
	    15 => w(8,3,10,6,-6,9,20,11)
        );
    
begin

dout <= data_ROM(to_integer(data_index));


end Behavioral;