library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv6_core1_rmcm_weightsconstant_memoryROM is
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
end conv6_core1_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv6_core1_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(-3,4,-5,-1,54,-14,-5,-11,3),
	    1 => w(2,-5,-1,-14,-18,2,1,3,0),
	    2 => w(6,-31,2,-1,36,-2,-4,2,-2),
	    3 => w(22,-27,3,24,-26,23,-5,-14,12),
	    4 => w(-4,9,-4,54,-5,-44,-2,-14,9),
	    5 => w(66,-48,-18,-39,8,23,-17,26,-6),
	    6 => w(0,-3,1,-6,-22,8,0,-11,8),
	    7 => w(-5,-1,-4,39,20,-16,13,3,-7),
	    8 => w(6,22,0,-5,-30,-1,1,2,0),
	    9 => w(-3,-36,17,-3,-9,4,-1,-7,-2),
	    10 => w(-6,-3,4,-38,50,-1,3,-6,0),
	    11 => w(46,-11,-30,-4,-11,8,2,2,1),
	    12 => w(-9,-14,-16,-4,123,-19,-15,-17,-2),
	    13 => w(-4,-14,-5,6,47,7,-5,-11,-6),
	    14 => w(-3,9,-5,-13,32,-16,-3,6,-2),
	    15 => w(-8,-16,0,16,20,-13,-2,10,-5)
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