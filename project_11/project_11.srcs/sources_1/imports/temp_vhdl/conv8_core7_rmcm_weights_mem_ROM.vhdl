library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv8_core7_rmcm_weightsconstant_memoryROM is
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
end conv8_core7_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv8_core7_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(1,-3,-4,8,2,-4,8,5,0),
	    1 => w(-5,-7,-3,-7,-11,-5,-3,-5,-3),
	    2 => w(-6,-11,-6,-9,-13,-6,-5,-5,-1),
	    3 => w(-8,-12,-7,-13,-18,-9,-7,-10,-4),
	    4 => w(5,8,3,7,11,4,2,4,1),
	    5 => w(-10,-14,-6,-16,-19,-8,-8,-9,-3),
	    6 => w(-10,-13,-7,-14,-18,-9,-7,-10,-4),
	    7 => w(-7,-4,4,-4,5,10,2,8,8),
	    8 => w(-32,-51,-34,-35,-26,-10,63,71,35),
	    9 => w(8,12,6,12,16,8,6,7,3),
	    10 => w(-7,-11,-6,-13,-18,-9,-8,-10,-4),
	    11 => w(8,-64,16,49,-65,-16,44,-30,-41),
	    12 => w(8,11,5,13,17,7,7,8,3),
	    13 => w(-8,-15,-9,-13,-21,-11,-4,-6,-3),
	    14 => w(9,14,7,13,21,10,6,9,4),
	    15 => w(5,6,4,8,9,4,5,5,1)
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