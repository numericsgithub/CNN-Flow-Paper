library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv6_core8_rmcm_weightsconstant_memoryROM is
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
end conv6_core8_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv6_core8_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(-7,-10,5,-5,-5,2,0,-2,3),
	    1 => w(-5,2,5,-5,-5,38,-4,-11,-5),
	    2 => w(-1,-32,2,1,39,0,-1,-6,-2),
	    3 => w(7,-48,28,-33,-73,65,4,8,45),
	    4 => w(21,71,-8,-27,-38,-17,-13,3,2),
	    5 => w(-5,-14,-2,-7,63,-21,-7,11,-9),
	    6 => w(3,-13,4,-17,53,-20,0,-1,-2),
	    7 => w(7,20,-3,-5,20,-1,-21,-14,-7),
	    8 => w(-7,-9,-8,-11,35,4,-8,5,2),
	    9 => w(-17,-10,-9,17,20,-8,12,14,-8),
	    10 => w(9,9,-5,29,0,-21,-4,-16,7),
	    11 => w(-2,0,6,-3,-12,3,-1,-2,2),
	    12 => w(-4,-6,5,-5,-2,-9,2,-3,1),
	    13 => w(-5,-7,-1,-23,-6,5,-1,2,3),
	    14 => w(-7,23,-21,-45,24,36,8,-17,0),
	    15 => w(37,98,1,-55,-71,-24,10,6,13)
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