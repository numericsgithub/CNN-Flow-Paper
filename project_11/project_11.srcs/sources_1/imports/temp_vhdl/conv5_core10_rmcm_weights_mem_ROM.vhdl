library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv5_core10_rmcm_weightsconstant_memoryROM is
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
end conv5_core10_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv5_core10_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH)) & std_logic_vector(to_signed(w9, XI_WIDTH)) & std_logic_vector(to_signed(w10, XI_WIDTH)) & std_logic_vector(to_signed(w11, XI_WIDTH)) & std_logic_vector(to_signed(w12, XI_WIDTH)) & std_logic_vector(to_signed(w13, XI_WIDTH)) & std_logic_vector(to_signed(w14, XI_WIDTH)) & std_logic_vector(to_signed(w15, XI_WIDTH)) & std_logic_vector(to_signed(w16, XI_WIDTH)) & std_logic_vector(to_signed(w17, XI_WIDTH)) & std_logic_vector(to_signed(w18, XI_WIDTH)) & std_logic_vector(to_signed(w19, XI_WIDTH)) & std_logic_vector(to_signed(w20, XI_WIDTH)) & std_logic_vector(to_signed(w21, XI_WIDTH)) & std_logic_vector(to_signed(w22, XI_WIDTH)) & std_logic_vector(to_signed(w23, XI_WIDTH)) & std_logic_vector(to_signed(w24, XI_WIDTH)) & std_logic_vector(to_signed(w25, XI_WIDTH)) & std_logic_vector(to_signed(w26, XI_WIDTH)) & std_logic_vector(to_signed(w27, XI_WIDTH)) & std_logic_vector(to_signed(w28, XI_WIDTH)) & std_logic_vector(to_signed(w29, XI_WIDTH)) & std_logic_vector(to_signed(w30, XI_WIDTH)) & std_logic_vector(to_signed(w31, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(-1,1,2,-2,1,10,-1,0,-1,-11,1,-4,1,-3,1,0,9,-3,1,0,1,46,-2,0,-2,0,-2,9,11,12,1,0),
	    1 => w(-16,9,15,6,0,11,-9,1,-3,1,-49,0,-2,0,-2,2,0,7,1,-2,0,-4,4,5,-1,-1,-4,-4,-5,0,1,-1),
	    2 => w(21,0,8,1,-4,-1,1,3,7,-4,6,1,14,2,54,1,0,0,-1,2,3,0,0,-1,-19,0,5,0,5,0,47,8),
	    3 => w(1,0,1,-9,0,-21,11,-2,-11,1,1,28,0,-2,7,3,1,2,-2,-40,0,4,2,2,-3,0,-1,-2,6,-18,1,0),
	    4 => w(3,-6,1,2,0,-3,-3,22,-7,0,0,3,1,2,5,0,1,2,5,-1,10,2,8,0,6,-4,-45,-5,3,-1,-25,0),
	    5 => w(0,2,-3,-7,-2,3,-1,6,4,5,-2,-23,4,-1,2,-4,0,7,-3,1,0,12,0,-2,-3,-3,0,0,1,3,6,0),
	    6 => w(4,-15,-6,7,-29,3,6,-11,9,1,1,0,-4,4,1,-55,2,-1,-1,-7,9,2,4,-2,1,1,-7,1,-8,0,-1,5),
	    7 => w(1,-2,-43,-1,-2,-3,1,5,3,9,6,0,-3,11,-2,3,-1,0,-5,1,3,9,1,-3,0,0,-4,-5,3,-3,-1,2),
	    8 => w(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	    9 => w(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	    10 => w(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	    11 => w(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	    12 => w(3,-8,4,1,1,1,2,-1,80,1,-3,2,2,-3,-6,4,8,1,-2,2,-1,0,-4,-2,4,5,1,-1,1,3,30,1),
	    13 => w(0,5,0,-3,0,2,-2,1,1,26,-2,-3,-2,-10,7,0,3,2,-4,2,-1,8,-5,-1,2,2,2,6,-1,-1,-25,2),
	    14 => w(-4,-14,1,13,2,3,-13,9,9,7,-4,3,6,-1,-1,2,35,-1,9,3,-4,0,1,7,0,-1,1,0,-5,3,-1,2),
	    15 => w(2,7,-1,-35,-26,0,0,-2,0,1,29,-2,2,0,-9,22,-5,10,-9,1,3,8,0,-1,-5,0,47,1,-1,-5,-3,-3)
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