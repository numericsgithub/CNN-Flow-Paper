library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv6_core2_rmcm_weightsconstant_memoryROM is
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
end conv6_core2_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv6_core2_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(-1,-6,0,-2,-10,1,-1,-3,2),
	    1 => w(-2,-9,1,-15,45,-11,2,-8,0),
	    2 => w(-18,55,-17,24,-90,40,-3,14,-8),
	    3 => w(32,37,2,35,45,2,1,12,-2),
	    4 => w(2,17,-3,25,0,-18,-7,-20,5),
	    5 => w(5,-27,5,23,21,-12,-20,6,1),
	    6 => w(-16,4,20,-9,-42,-16,19,40,0),
	    7 => w(48,-32,-8,101,-93,-18,-7,3,6),
	    8 => w(-16,-19,1,-10,45,4,-2,8,2),
	    9 => w(2,20,6,-4,14,-25,1,8,-2),
	    10 => w(-4,10,-9,0,58,-10,-6,-7,-3),
	    11 => w(1,44,-3,0,-73,3,1,30,0),
	    12 => w(2,19,2,-17,-9,7,-6,-9,1),
	    13 => w(-10,38,-14,26,23,-28,-7,-14,-9),
	    14 => w(-1,-2,-1,-2,-3,-2,-2,-1,0),
	    15 => w(-20,-1,15,-36,0,53,-15,-5,13)
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