library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv8_core3_rmcm_weightsconstant_memoryROM is
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
end conv8_core3_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv8_core3_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(-6,-9,-6,-8,-11,-7,-5,-7,-4),
	    1 => w(10,11,4,10,15,8,2,7,5),
	    2 => w(9,12,5,11,16,7,3,6,3),
	    3 => w(5,10,5,9,14,7,6,7,4),
	    4 => w(13,16,7,18,22,9,8,9,4),
	    5 => w(-10,-14,-6,-15,-18,-9,-8,-11,-4),
	    6 => w(-6,-9,-4,-5,-11,-7,-2,-4,-3),
	    7 => w(9,13,7,13,17,8,8,8,3),
	    8 => w(-14,-25,-5,-22,-38,-5,-3,-4,-1),
	    9 => w(9,12,5,12,18,8,5,7,5),
	    10 => w(12,22,14,-15,3,10,-18,-21,-12),
	    11 => w(7,13,7,11,18,10,5,8,3),
	    12 => w(-8,-11,-5,-10,-15,-7,-3,-6,-4),
	    13 => w(-13,-15,-6,-15,-21,-11,-6,-9,-6),
	    14 => w(11,15,8,16,20,9,9,12,5),
	    15 => w(6,9,4,10,14,5,4,5,2)
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