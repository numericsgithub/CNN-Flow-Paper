library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv6_core5_rmcm_weightsconstant_memoryROM is
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
end conv6_core5_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv6_core5_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(0,6,0,4,19,-1,-2,0,1),
	    1 => w(-8,9,2,4,58,-13,-1,-8,-1),
	    2 => w(-5,21,-11,21,25,-17,-10,5,-8),
	    3 => w(3,50,2,-12,-27,-10,-5,6,-4),
	    4 => w(-6,13,-11,-6,66,-3,-13,11,-2),
	    5 => w(-40,-3,38,3,9,-11,32,-12,-21),
	    6 => w(-2,-6,14,21,-128,71,13,-17,14),
	    7 => w(-1,17,-4,-1,33,-1,-1,2,-1),
	    8 => w(-13,-10,-1,-7,-9,0,-1,-3,5),
	    9 => w(-15,12,9,14,-51,10,3,14,0),
	    10 => w(7,6,-12,14,19,-11,-10,-9,-1),
	    11 => w(25,51,2,-26,-51,-2,1,23,-5),
	    12 => w(-7,7,3,-35,41,3,0,-3,-1),
	    13 => w(2,-44,21,-17,-68,58,-1,9,36),
	    14 => w(0,-2,-4,6,32,-13,-6,11,-9),
	    15 => w(1,12,-2,-2,29,-5,1,2,1)
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