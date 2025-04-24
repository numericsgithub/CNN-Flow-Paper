library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv8_core1_rmcm_weightsconstant_memoryROM is
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
end conv8_core1_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv8_core1_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(11,14,8,13,14,7,6,6,3),
	    1 => w(-9,-14,-6,-13,-17,-7,-8,-10,-5),
	    2 => w(-10,-23,-18,-25,-29,-14,-16,-13,-3),
	    3 => w(-8,-11,-4,-10,-16,-8,-3,-7,-4),
	    4 => w(-11,25,-18,-13,39,-32,-4,18,-20),
	    5 => w(6,7,3,6,9,6,2,5,3),
	    6 => w(10,11,3,12,15,6,4,7,4),
	    7 => w(5,10,5,11,19,9,6,10,5),
	    8 => w(-11,-15,-9,-13,-19,-12,-5,-9,-5),
	    9 => w(4,7,4,7,10,5,3,5,3),
	    10 => w(-10,-7,-1,-21,-13,-1,-19,-10,0),
	    11 => w(17,20,10,20,28,15,8,15,7),
	    12 => w(-40,-51,-18,15,10,-5,26,27,11),
	    13 => w(-8,-9,-3,-10,-12,-5,-4,-5,-3),
	    14 => w(-6,-9,-4,-10,-15,-7,-6,-8,-3),
	    15 => w(-10,-12,-4,-14,-19,-9,-6,-10,-7)
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