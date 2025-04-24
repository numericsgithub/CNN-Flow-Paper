library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv8_core2_rmcm_weightsconstant_memoryROM is
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
end conv8_core2_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv8_core2_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(7,9,5,9,12,5,5,6,3),
	    1 => w(8,10,3,11,15,4,5,7,2),
	    2 => w(-5,-7,-3,-8,-12,-5,-4,-6,-2),
	    3 => w(9,11,4,10,15,6,4,6,3),
	    4 => w(7,14,9,14,22,11,9,11,4),
	    5 => w(-48,49,7,-62,68,4,-25,27,-1),
	    6 => w(14,21,9,21,31,13,10,13,5),
	    7 => w(-10,-12,-7,-10,-14,-9,-4,-6,-3),
	    8 => w(13,18,8,17,20,8,7,8,3),
	    9 => w(8,12,4,12,16,6,5,6,2),
	    10 => w(7,9,4,10,12,4,5,5,2),
	    11 => w(41,49,22,41,49,17,12,2,1),
	    12 => w(11,12,4,14,18,8,6,9,5),
	    13 => w(14,16,5,16,19,7,5,7,3),
	    14 => w(9,13,5,13,19,8,6,8,3),
	    15 => w(-14,-18,-7,-18,-26,-12,-6,-12,-7)
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