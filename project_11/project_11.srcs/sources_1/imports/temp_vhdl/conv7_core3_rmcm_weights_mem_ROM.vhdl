library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core3_rmcm_weightsconstant_memoryROM is
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
end conv7_core3_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv7_core3_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH)) & std_logic_vector(to_signed(w9, XI_WIDTH)) & std_logic_vector(to_signed(w10, XI_WIDTH)) & std_logic_vector(to_signed(w11, XI_WIDTH)) & std_logic_vector(to_signed(w12, XI_WIDTH)) & std_logic_vector(to_signed(w13, XI_WIDTH)) & std_logic_vector(to_signed(w14, XI_WIDTH)) & std_logic_vector(to_signed(w15, XI_WIDTH)) & std_logic_vector(to_signed(w16, XI_WIDTH)) & std_logic_vector(to_signed(w17, XI_WIDTH)) & std_logic_vector(to_signed(w18, XI_WIDTH)) & std_logic_vector(to_signed(w19, XI_WIDTH)) & std_logic_vector(to_signed(w20, XI_WIDTH)) & std_logic_vector(to_signed(w21, XI_WIDTH)) & std_logic_vector(to_signed(w22, XI_WIDTH)) & std_logic_vector(to_signed(w23, XI_WIDTH)) & std_logic_vector(to_signed(w24, XI_WIDTH)) & std_logic_vector(to_signed(w25, XI_WIDTH)) & std_logic_vector(to_signed(w26, XI_WIDTH)) & std_logic_vector(to_signed(w27, XI_WIDTH)) & std_logic_vector(to_signed(w28, XI_WIDTH)) & std_logic_vector(to_signed(w29, XI_WIDTH)) & std_logic_vector(to_signed(w30, XI_WIDTH)) & std_logic_vector(to_signed(w31, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(-5,9,-12,1,-4,-11,3,-4,-6,4,3,4,1,-9,0,6,-2,-12,9,-8,-12,-1,-8,-1,-2,7,-9,-1,-4,10,-2,3),
	    1 => w(2,4,-5,-6,-3,3,0,-2,-19,-2,-5,-7,-6,0,4,-7,3,1,1,4,6,4,-9,-2,3,-5,-34,-5,-1,-1,1,1),
	    2 => w(-3,-1,-17,-9,9,-10,0,-2,10,2,2,1,-16,3,15,2,-2,19,9,0,-3,-2,0,-5,7,3,-11,-7,-1,-11,0,-7),
	    3 => w(0,-1,16,18,-6,1,4,-1,-6,1,1,4,1,1,-1,-1,-8,3,-12,-4,-3,-3,-1,-3,1,0,27,-4,-1,-2,1,9),
	    4 => w(8,1,-4,-1,9,-1,-1,0,-68,3,-4,3,-5,16,44,-3,0,-1,-3,1,-2,-1,21,4,3,15,5,-10,2,-8,-1,18),
	    5 => w(-1,-1,-14,-4,3,-1,-3,6,19,1,-5,2,-1,9,6,-4,23,-4,19,-1,39,12,-12,0,2,-4,-6,-8,-7,10,1,-12),
	    6 => w(-4,12,-8,-4,1,4,-7,12,-11,1,11,0,-1,10,-21,2,-6,-7,3,-4,1,8,-13,58,-11,17,-3,-2,-12,4,-6,1),
	    7 => w(-6,-9,0,-3,14,-13,11,12,-2,-4,-11,-8,-6,-8,-5,4,5,-6,3,-13,12,6,18,6,29,-4,1,2,-2,7,7,-8),
	    8 => w(18,-25,-14,-7,12,-5,-12,-7,-2,-8,8,12,10,-5,-17,-13,3,-12,-17,16,3,11,-5,0,5,-15,4,-13,10,0,2,2),
	    9 => w(10,5,-10,-4,-2,0,-4,17,4,-3,17,6,-1,0,-15,-1,1,0,6,3,-3,-1,-3,-9,2,12,-6,-44,0,-4,-7,-3),
	    10 => w(11,1,9,2,5,5,4,9,3,4,-9,-10,-18,0,5,-2,0,-4,-9,7,-2,-7,-3,-12,6,1,-6,5,4,-1,6,-22),
	    11 => w(6,7,-2,-25,0,-11,-19,-11,0,15,-2,-13,6,2,-2,2,-10,2,0,-5,-4,-37,-1,-2,-6,-7,0,-6,-12,-1,-20,2),
	    12 => w(1,11,4,-5,3,5,-4,0,0,-8,-3,-9,1,-4,1,6,3,3,-2,-1,1,0,6,-1,-3,1,0,-1,-2,5,17,-1),
	    13 => w(1,0,3,-2,4,1,-3,-2,0,0,-4,0,-3,0,1,-4,-1,5,-2,0,3,-2,-32,-2,-6,-2,-14,-1,-4,5,-1,1),
	    14 => w(-1,-15,127,-6,1,-2,-1,0,0,-8,-2,-1,3,3,0,0,3,4,2,11,11,1,6,2,1,4,-14,1,-1,-6,-1,2),
	    15 => w(2,0,18,-1,1,1,1,2,-5,1,-1,-2,0,-2,-1,5,3,-4,-18,-6,-2,0,-5,-3,3,-3,-10,-1,-1,2,-9,1)
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