library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv8_core8_rmcm_weightsconstant_memoryROM is
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
end conv8_core8_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv8_core8_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(8,10,5,11,16,8,4,8,5),
	    1 => w(8,12,5,11,17,8,5,8,4),
	    2 => w(7,12,6,14,19,9,9,11,3),
	    3 => w(11,17,8,17,23,10,9,11,5),
	    4 => w(9,13,6,13,18,8,6,8,5),
	    5 => w(-5,-8,-4,-9,-13,-6,-5,-7,-3),
	    6 => w(-7,-7,-3,-8,-10,-5,-4,-5,-2),
	    7 => w(8,13,6,11,16,8,4,6,3),
	    8 => w(-11,-16,-9,-14,-20,-13,-6,-9,-5),
	    9 => w(10,15,8,13,18,10,5,8,5),
	    10 => w(13,18,7,19,25,10,8,10,2),
	    11 => w(-7,-9,-4,-9,-12,-7,-6,-7,-4),
	    12 => w(6,11,6,11,16,8,6,8,3),
	    13 => w(-17,-21,-10,-20,-32,-22,-9,-20,-12),
	    14 => w(-18,-26,-17,-28,-31,-14,-10,-7,0),
	    15 => w(-20,-23,-10,-25,-30,-15,-10,-14,-7)
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