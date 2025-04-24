library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv5_core11_rmcm_weightsconstant_memoryROM is
    generic
    (
        XI_WIDTH        	          : natural := 8;
        ARRAY_SIZE                    : natural := 16;
        WORDS_PER_ADDR                : natural := 32
    );
    Port (
        clk        : in std_logic;
        data_index : in unsigned(bits(ARRAY_SIZE-1)-1 downto 0);
        dout       : out std_logic_vector((XI_WIDTH * WORDS_PER_ADDR-1) downto 0)
    );
end conv5_core11_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv5_core11_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH)) & std_logic_vector(to_signed(w9, XI_WIDTH)) & std_logic_vector(to_signed(w10, XI_WIDTH)) & std_logic_vector(to_signed(w11, XI_WIDTH)) & std_logic_vector(to_signed(w12, XI_WIDTH)) & std_logic_vector(to_signed(w13, XI_WIDTH)) & std_logic_vector(to_signed(w14, XI_WIDTH)) & std_logic_vector(to_signed(w15, XI_WIDTH)) & std_logic_vector(to_signed(w16, XI_WIDTH)) & std_logic_vector(to_signed(w17, XI_WIDTH)) & std_logic_vector(to_signed(w18, XI_WIDTH)) & std_logic_vector(to_signed(w19, XI_WIDTH)) & std_logic_vector(to_signed(w20, XI_WIDTH)) & std_logic_vector(to_signed(w21, XI_WIDTH)) & std_logic_vector(to_signed(w22, XI_WIDTH)) & std_logic_vector(to_signed(w23, XI_WIDTH)) & std_logic_vector(to_signed(w24, XI_WIDTH)) & std_logic_vector(to_signed(w25, XI_WIDTH)) & std_logic_vector(to_signed(w26, XI_WIDTH)) & std_logic_vector(to_signed(w27, XI_WIDTH)) & std_logic_vector(to_signed(w28, XI_WIDTH)) & std_logic_vector(to_signed(w29, XI_WIDTH)) & std_logic_vector(to_signed(w30, XI_WIDTH)) & std_logic_vector(to_signed(w31, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(2,0,0,-2,-3,3,0,1,1,-1,0,-1,1,-3,1,4,0,1,-1,-5,-1,-2,0,-4,3,0,2,1,3,4,1,1),
	    1 => w(1,0,1,1,-1,5,-1,0,2,2,-4,-1,-3,0,5,1,0,1,-1,-2,0,0,-1,-1,-1,2,0,-1,-1,-2,1,0),
	    2 => w(-2,-1,-4,-1,-2,1,1,1,5,1,1,-2,1,1,-1,0,1,-2,-3,0,-4,0,-1,0,1,-1,0,-2,0,-1,3,4),
	    3 => w(2,1,1,-2,-2,-2,2,-2,2,-2,0,2,1,0,-2,0,-5,-1,-1,0,1,2,1,1,-1,-3,0,-2,5,3,-2,-2),
	    4 => w(0,20,1,-34,64,14,0,1,1,-5,3,-3,-1,-8,1,-3,-2,-4,1,1,-1,-1,1,-1,-6,0,-1,-16,-3,4,-2,1),
	    5 => w(1,4,0,-7,0,-4,8,-3,3,-2,1,1,0,-1,-6,3,0,-5,-2,16,1,3,-3,-3,-2,0,-1,-3,2,1,-3,0),
	    6 => w(0,-5,-6,3,0,0,2,-1,-3,-10,1,36,2,-3,0,-2,1,1,-26,-2,2,-13,-1,-4,0,-113,3,10,7,-6,5,-4),
	    7 => w(-2,-4,1,-4,1,7,1,6,-1,0,1,-2,2,-1,6,-4,2,-7,5,-2,0,-33,-14,2,-3,1,0,-1,0,4,-5,4),
	    8 => w(-1,0,34,-3,-3,3,-2,-16,2,-2,1,-3,0,-1,-7,5,0,-2,-6,0,21,-3,0,2,4,2,22,-1,-1,2,-49,-12),
	    9 => w(-1,4,3,5,-8,4,-5,4,3,2,-2,1,-3,1,0,0,0,3,-2,0,0,1,-5,-3,14,0,1,-2,0,1,16,-2),
	    10 => w(-4,6,16,74,4,1,0,14,-3,1,-3,1,-2,0,3,-5,2,0,0,-6,6,0,-10,2,0,4,1,-1,-1,1,4,0),
	    11 => w(1,31,2,-9,-8,0,-1,-19,5,-16,-3,-2,15,-36,5,0,1,8,0,2,25,0,4,8,-13,3,-1,-47,1,-2,0,0),
	    12 => w(-1,-3,10,-3,4,-11,-4,5,1,-33,-1,-4,-3,-1,-1,2,10,5,2,3,2,9,-15,3,1,1,-3,11,1,-14,-1,0),
	    13 => w(10,-10,-18,-55,0,-8,12,2,-1,-6,-30,2,2,0,4,5,4,1,2,-3,0,1,-2,-8,-1,1,4,5,3,1,-5,4),
	    14 => w(43,0,8,0,-7,0,-3,3,-6,3,-1,1,21,3,11,7,1,0,5,0,12,6,6,10,-8,-1,11,3,-1,0,3,0),
	    15 => w(1,4,-1,1,0,17,-13,-8,-4,1,-1,0,1,-2,-1,0,4,-2,-4,45,-1,-13,-6,0,-4,1,-4,-3,-5,8,2,-1)
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