library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv6_core3_rmcm_weightsconstant_memoryROM is
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
end conv6_core3_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv6_core3_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(2,18,-15,22,54,-17,-10,-15,-10),
	    1 => w(8,-16,3,-27,-80,-19,14,112,15),
	    2 => w(10,-17,5,-10,-15,2,0,-5,0),
	    3 => w(11,33,1,-3,-22,-6,-7,-10,-3),
	    4 => w(6,-15,2,-8,-25,2,1,3,-1),
	    5 => w(-1,12,-3,5,22,-3,-1,-3,0),
	    6 => w(-6,-1,-1,-5,-8,-4,1,-1,-1),
	    7 => w(3,64,3,-11,-42,-11,-2,-2,-1),
	    8 => w(-13,-19,-30,26,127,23,-13,-30,-26),
	    9 => w(-22,-19,-20,-7,45,-13,-12,2,-7),
	    10 => w(4,-13,9,26,-61,29,3,-8,4),
	    11 => w(-8,-17,0,-2,50,-4,-2,0,-2),
	    12 => w(23,-33,9,-29,40,-8,3,-4,-3),
	    13 => w(-11,20,5,10,37,-7,3,-11,-10),
	    14 => w(38,-10,-12,-38,0,-23,-18,16,19),
	    15 => w(-2,-5,-3,-15,-10,-7,3,3,1)
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