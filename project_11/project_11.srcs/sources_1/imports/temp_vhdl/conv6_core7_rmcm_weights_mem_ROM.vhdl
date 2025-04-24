library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv6_core7_rmcm_weightsconstant_memoryROM is
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
end conv6_core7_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv6_core7_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(15,-18,-9,28,-30,-15,22,-4,2),
	    1 => w(-3,8,-6,1,42,-12,-5,-6,-3),
	    2 => w(1,-4,3,-4,-10,1,-2,-3,4),
	    3 => w(-3,19,-8,-18,7,8,3,-7,1),
	    4 => w(48,-46,-4,-88,97,-6,40,-44,7),
	    5 => w(-6,-5,-6,0,55,-2,-3,-6,-3),
	    6 => w(3,14,0,2,40,0,1,-1,-9),
	    7 => w(7,-20,-2,33,9,-5,-14,5,-3),
	    8 => w(-9,14,5,2,37,-8,5,-5,-6),
	    9 => w(1,0,-2,-16,35,-5,1,-3,-2),
	    10 => w(4,36,-6,-13,-4,2,-7,-15,0),
	    11 => w(1,-8,7,-18,46,-28,-1,-4,3),
	    12 => w(9,-9,1,-22,-99,-10,7,-1,6),
	    13 => w(-5,-2,-4,-16,1,-2,-4,-5,-2),
	    14 => w(-3,40,-3,-10,-13,2,9,-12,1),
	    15 => w(32,-83,24,-30,42,-5,-9,35,-21)
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