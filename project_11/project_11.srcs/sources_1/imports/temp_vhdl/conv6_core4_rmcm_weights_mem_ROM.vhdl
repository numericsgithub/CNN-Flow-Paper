library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv6_core4_rmcm_weightsconstant_memoryROM is
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
end conv6_core4_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv6_core4_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(-1,-29,6,-4,45,-3,2,-7,-5),
	    1 => w(-3,10,13,-23,0,15,-8,-2,1),
	    2 => w(6,-18,-1,72,-50,5,2,-7,-7),
	    3 => w(4,-11,-1,16,95,-23,2,23,-28),
	    4 => w(3,22,0,-11,-26,-7,3,1,4),
	    5 => w(2,29,-10,7,-27,3,-10,-1,0),
	    6 => w(-2,6,-1,-1,31,1,-1,6,-1),
	    7 => w(6,6,12,-8,-18,-19,4,-4,-5),
	    8 => w(-8,26,-15,-27,30,0,0,-1,-3),
	    9 => w(-1,9,-1,4,36,1,0,3,-3),
	    10 => w(-15,-18,-9,19,31,-5,-7,8,-2),
	    11 => w(-14,-6,-8,9,64,1,-15,-12,-8),
	    12 => w(4,7,-3,0,13,1,-2,1,-1),
	    13 => w(10,23,-3,3,10,-3,0,1,-1),
	    14 => w(0,-1,0,-32,45,-11,0,-1,0),
	    15 => w(1,-8,3,-5,-17,8,5,-2,1)
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