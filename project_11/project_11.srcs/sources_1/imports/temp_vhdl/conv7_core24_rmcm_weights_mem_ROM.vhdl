library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core24_rmcm_weightsconstant_memoryROM is
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
end conv7_core24_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv7_core24_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH)) & std_logic_vector(to_signed(w9, XI_WIDTH)) & std_logic_vector(to_signed(w10, XI_WIDTH)) & std_logic_vector(to_signed(w11, XI_WIDTH)) & std_logic_vector(to_signed(w12, XI_WIDTH)) & std_logic_vector(to_signed(w13, XI_WIDTH)) & std_logic_vector(to_signed(w14, XI_WIDTH)) & std_logic_vector(to_signed(w15, XI_WIDTH)) & std_logic_vector(to_signed(w16, XI_WIDTH)) & std_logic_vector(to_signed(w17, XI_WIDTH)) & std_logic_vector(to_signed(w18, XI_WIDTH)) & std_logic_vector(to_signed(w19, XI_WIDTH)) & std_logic_vector(to_signed(w20, XI_WIDTH)) & std_logic_vector(to_signed(w21, XI_WIDTH)) & std_logic_vector(to_signed(w22, XI_WIDTH)) & std_logic_vector(to_signed(w23, XI_WIDTH)) & std_logic_vector(to_signed(w24, XI_WIDTH)) & std_logic_vector(to_signed(w25, XI_WIDTH)) & std_logic_vector(to_signed(w26, XI_WIDTH)) & std_logic_vector(to_signed(w27, XI_WIDTH)) & std_logic_vector(to_signed(w28, XI_WIDTH)) & std_logic_vector(to_signed(w29, XI_WIDTH)) & std_logic_vector(to_signed(w30, XI_WIDTH)) & std_logic_vector(to_signed(w31, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(-5,3,-3,68,11,3,-5,-4,-13,0,-5,2,-7,-6,3,3,-6,-5,9,4,2,3,4,-2,-1,-3,7,6,-5,2,5,2),
	    1 => w(4,29,-25,1,-12,-1,2,7,5,0,4,-1,13,1,-9,33,35,7,-5,4,-2,-2,9,1,2,-2,2,1,1,-16,5,4),
	    2 => w(-4,-5,-5,-3,4,-1,1,-5,-6,-8,9,2,1,-1,0,-3,2,-1,0,8,-1,-5,1,-3,3,-14,5,8,4,8,2,-7),
	    3 => w(5,-5,-3,4,4,-20,-1,6,5,9,24,-4,1,0,-7,-9,-4,-15,1,-3,57,-13,-1,4,-8,-2,0,-2,-2,1,0,0),
	    4 => w(0,8,-1,116,-12,-1,13,2,8,5,-5,-5,-8,-17,8,-3,13,6,0,-5,-1,21,-1,-15,42,-44,15,5,-7,-4,2,-4),
	    5 => w(2,-12,-1,2,22,-14,15,-3,0,-2,-3,1,14,-5,-15,0,11,-7,-4,-19,13,-36,8,11,2,3,1,-13,7,-3,-3,0),
	    6 => w(-1,1,-18,7,-14,-25,-1,-6,4,2,-6,6,1,-11,-13,4,23,2,-10,-2,-3,-18,-3,-23,6,-23,-2,-7,4,5,1,-6),
	    7 => w(5,44,-6,-9,-24,-15,-20,-1,-30,15,-16,-5,2,12,-4,9,-4,-2,5,2,-32,-16,5,2,34,-4,0,-1,-13,0,-9,17),
	    8 => w(6,12,7,-5,47,10,0,-45,-5,-2,-12,-9,20,-15,5,-5,-6,3,-17,-7,5,-18,3,-11,-40,5,-3,-16,44,9,8,3),
	    9 => w(1,-15,-5,-5,6,-2,-7,7,-6,-1,7,-1,4,9,-37,0,-9,-4,-9,14,6,8,12,-12,-3,27,5,3,-44,0,15,10),
	    10 => w(36,-15,2,27,8,35,-1,-35,7,0,3,7,-2,8,3,-3,5,3,10,0,2,6,3,-8,3,-13,-1,8,-4,-2,3,-22),
	    11 => w(0,-3,-4,-27,-23,-6,-10,-35,15,-7,-11,-2,2,-3,-1,-41,-6,1,-1,0,-9,5,-8,-1,-3,7,4,13,0,-2,-7,11),
	    12 => w(7,2,-6,-18,-54,-2,-5,16,-3,5,27,-8,-11,-13,3,-6,-71,2,-9,20,2,80,7,21,42,-6,12,14,-12,11,27,2),
	    13 => w(4,1,1,-6,1,-3,-2,-6,34,-2,8,-1,24,-2,-37,5,6,-1,-2,-20,-19,-4,6,26,-2,5,-7,14,-9,7,4,-10),
	    14 => w(0,-6,-3,-38,5,0,-1,-30,0,-10,0,-1,0,-5,0,0,7,-3,-1,-2,-3,-11,6,1,2,-2,-10,-11,2,7,0,-30),
	    15 => w(0,-14,0,-19,19,5,-4,26,-3,0,-11,-7,-2,4,-2,-14,-2,4,-11,-2,-3,0,9,0,17,-3,9,-4,-5,3,-16,9)
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