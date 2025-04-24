library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core30_rmcm_weightsconstant_memoryROM is
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
end conv7_core30_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv7_core30_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH)) & std_logic_vector(to_signed(w9, XI_WIDTH)) & std_logic_vector(to_signed(w10, XI_WIDTH)) & std_logic_vector(to_signed(w11, XI_WIDTH)) & std_logic_vector(to_signed(w12, XI_WIDTH)) & std_logic_vector(to_signed(w13, XI_WIDTH)) & std_logic_vector(to_signed(w14, XI_WIDTH)) & std_logic_vector(to_signed(w15, XI_WIDTH)) & std_logic_vector(to_signed(w16, XI_WIDTH)) & std_logic_vector(to_signed(w17, XI_WIDTH)) & std_logic_vector(to_signed(w18, XI_WIDTH)) & std_logic_vector(to_signed(w19, XI_WIDTH)) & std_logic_vector(to_signed(w20, XI_WIDTH)) & std_logic_vector(to_signed(w21, XI_WIDTH)) & std_logic_vector(to_signed(w22, XI_WIDTH)) & std_logic_vector(to_signed(w23, XI_WIDTH)) & std_logic_vector(to_signed(w24, XI_WIDTH)) & std_logic_vector(to_signed(w25, XI_WIDTH)) & std_logic_vector(to_signed(w26, XI_WIDTH)) & std_logic_vector(to_signed(w27, XI_WIDTH)) & std_logic_vector(to_signed(w28, XI_WIDTH)) & std_logic_vector(to_signed(w29, XI_WIDTH)) & std_logic_vector(to_signed(w30, XI_WIDTH)) & std_logic_vector(to_signed(w31, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(16,4,-4,-10,-15,-1,-13,21,-6,4,3,-12,17,29,1,4,-16,-3,-6,25,4,27,23,-4,30,7,-10,24,-3,-4,20,40),
	    1 => w(-2,-37,3,-5,-26,-3,0,-3,41,1,17,1,7,-2,1,-30,12,0,-24,-2,-13,22,15,-10,1,-4,0,-1,2,-7,-4,5),
	    2 => w(-8,-27,2,-15,3,-21,6,1,11,1,22,6,-4,-8,-25,-1,8,-7,-10,5,-2,-54,-35,0,-12,6,-1,1,14,36,0,-15),
	    3 => w(3,1,1,-12,-12,-10,-12,-28,15,16,-3,4,5,8,6,-2,15,-4,-4,-6,-14,11,10,1,-3,-7,15,8,0,-4,-3,11),
	    4 => w(5,1,-9,46,27,-1,48,7,3,1,13,4,0,-13,-1,-7,18,-25,-58,1,0,12,-34,8,0,4,-21,-5,-34,-11,21,-26),
	    5 => w(11,-1,-21,13,14,8,20,58,-29,-11,-2,1,0,-2,-84,38,23,-4,31,10,2,-28,12,-9,-4,8,5,-69,-6,8,2,-45),
	    6 => w(7,8,9,-3,15,17,2,80,-5,-4,-1,19,6,-1,47,4,9,12,-8,-30,8,14,-31,-31,53,36,-13,75,0,3,11,-13),
	    7 => w(-8,11,6,-4,13,-1,-57,1,-21,118,-18,-12,10,8,11,12,-42,-1,3,-3,-12,-77,-3,-1,8,14,-7,5,8,-6,18,80),
	    8 => w(-8,4,-8,-15,9,8,-4,15,-4,-11,-5,-1,3,-1,5,13,-1,-26,23,3,1,-8,-8,23,-22,10,-9,-3,-6,40,16,30),
	    9 => w(10,-10,-1,-3,19,1,-20,-8,31,-3,3,0,1,7,-3,10,7,1,-3,-7,-4,-47,7,24,-5,15,2,27,-15,11,-3,-93),
	    10 => w(10,-38,4,-35,-65,10,-2,-8,33,-4,12,1,-3,5,20,-8,4,5,8,2,4,-6,15,20,-13,7,0,0,1,7,-1,-7),
	    11 => w(1,-9,2,7,-5,8,-12,2,-23,15,-14,-7,-2,-7,-9,-5,-19,20,-14,-16,-5,-16,-3,2,10,-2,-4,-40,-21,4,-24,-17),
	    12 => w(-2,-5,-3,4,8,-5,5,-2,73,8,1,1,-13,-3,-84,-8,-3,1,5,2,-1,-9,20,-84,-24,-12,6,12,6,-3,4,-6),
	    13 => w(-6,8,15,-5,23,1,13,-6,-2,3,-14,-2,18,-5,-9,-4,0,12,4,-11,21,1,2,7,5,-9,0,4,-1,-16,4,4),
	    14 => w(-5,1,0,-1,1,2,15,-12,2,-20,8,0,-5,-9,-14,-2,-2,-4,-4,-8,1,1,-1,-20,0,10,2,-26,38,-8,10,-2),
	    15 => w(0,-11,0,3,-2,29,3,18,-4,5,-6,19,10,13,-1,-4,4,28,1,-6,-15,3,-2,0,27,13,0,-2,25,-13,2,-11)
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