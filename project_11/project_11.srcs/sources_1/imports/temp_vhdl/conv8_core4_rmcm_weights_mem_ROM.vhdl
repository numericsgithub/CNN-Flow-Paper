library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv8_core4_rmcm_weightsconstant_memoryROM is
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
end conv8_core4_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv8_core4_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(-8,-11,-5,-13,-17,-8,-6,-9,-4),
	    1 => w(-9,-18,-8,-15,-25,-11,-4,-6,0),
	    2 => w(-7,-10,-4,-10,-13,-6,-6,-8,-3),
	    3 => w(4,-7,-9,-5,-13,-7,-7,-6,1),
	    4 => w(8,11,4,10,13,6,5,6,3),
	    5 => w(-37,-33,-9,-30,21,30,-4,34,25),
	    6 => w(9,13,7,12,17,9,7,7,2),
	    7 => w(-8,-10,-5,-11,-15,-7,-5,-7,-3),
	    8 => w(7,9,3,7,11,6,2,6,3),
	    9 => w(8,12,6,13,19,8,7,9,3),
	    10 => w(7,10,4,11,15,6,6,7,3),
	    11 => w(6,11,7,11,15,6,6,6,0),
	    12 => w(-11,-14,-7,-14,-18,-10,-7,-10,-5),
	    13 => w(16,-6,-13,26,-4,-26,15,1,-17),
	    14 => w(-9,-12,-5,-13,-19,-9,-6,-9,-5),
	    15 => w(7,12,7,11,14,6,5,5,1)
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