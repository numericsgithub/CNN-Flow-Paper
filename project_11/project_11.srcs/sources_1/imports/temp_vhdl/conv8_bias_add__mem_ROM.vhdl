library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv8_bias_add_constant_memoryROM is
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
end conv8_bias_add_constant_memoryROM;

architecture Behavioral of conv8_bias_add_constant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(0,2,16,19,18,0,18,0),
	    1 => w(30,-4,0,36,14,0,35,1),
	    2 => w(14,27,0,18,0,15,35,4),
	    3 => w(39,0,0,26,16,0,17,2),
	    4 => w(1,1,0,1,5,50,0,0),
	    5 => w(0,-8,15,0,31,-1,18,18),
	    6 => w(1,-28,26,0,34,4,21,20),
	    7 => w(-6,17,1,23,26,0,15,3),
	    8 => w(16,1,15,2,21,35,4,15),
	    9 => w(1,-10,0,0,3,-1,1,-10),
	    10 => w(24,4,1,-15,-7,15,27,2),
	    11 => w(0,-9,2,3,0,2,27,19),
	    12 => w(3,0,40,18,0,0,1,0),
	    13 => w(45,2,25,5,20,10,42,16),
	    14 => w(34,-14,0,14,32,5,-12,42),
	    15 => w(37,83,0,0,0,24,0,44)
        );
    
begin

dout <= data_ROM(to_integer(data_index));


end Behavioral;