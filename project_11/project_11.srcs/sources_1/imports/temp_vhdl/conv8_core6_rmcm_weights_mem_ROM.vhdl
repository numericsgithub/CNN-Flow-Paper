library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv8_core6_rmcm_weightsconstant_memoryROM is
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
end conv8_core6_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv8_core6_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(5,9,5,7,13,7,3,6,4),
	    1 => w(6,8,4,10,14,6,5,7,3),
	    2 => w(-12,-32,-24,-30,-43,-27,-25,-26,-10),
	    3 => w(7,11,5,9,14,5,4,5,2),
	    4 => w(-10,-13,-5,-18,-24,-9,-9,-11,-3),
	    5 => w(27,19,-10,26,-8,-23,11,-22,-16),
	    6 => w(12,17,7,16,24,12,8,12,6),
	    7 => w(4,3,-1,12,17,6,8,15,7),
	    8 => w(-5,-10,-6,-9,-14,-8,-4,-7,-3),
	    9 => w(-20,-32,-24,22,10,-7,24,23,8),
	    10 => w(-8,-14,-7,-14,-18,-8,-11,-13,-3),
	    11 => w(16,11,1,15,9,0,4,0,-4),
	    12 => w(6,11,7,6,14,9,2,6,4),
	    13 => w(22,14,-10,26,-9,-31,11,-25,-23),
	    14 => w(10,15,7,15,21,10,8,10,4),
	    15 => w(17,22,8,-2,-6,-9,-10,-14,-6)
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