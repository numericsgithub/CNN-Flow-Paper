library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core23_rmcm_weightsconstant_memoryROM is
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
end conv7_core23_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv7_core23_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH)) & std_logic_vector(to_signed(w9, XI_WIDTH)) & std_logic_vector(to_signed(w10, XI_WIDTH)) & std_logic_vector(to_signed(w11, XI_WIDTH)) & std_logic_vector(to_signed(w12, XI_WIDTH)) & std_logic_vector(to_signed(w13, XI_WIDTH)) & std_logic_vector(to_signed(w14, XI_WIDTH)) & std_logic_vector(to_signed(w15, XI_WIDTH)) & std_logic_vector(to_signed(w16, XI_WIDTH)) & std_logic_vector(to_signed(w17, XI_WIDTH)) & std_logic_vector(to_signed(w18, XI_WIDTH)) & std_logic_vector(to_signed(w19, XI_WIDTH)) & std_logic_vector(to_signed(w20, XI_WIDTH)) & std_logic_vector(to_signed(w21, XI_WIDTH)) & std_logic_vector(to_signed(w22, XI_WIDTH)) & std_logic_vector(to_signed(w23, XI_WIDTH)) & std_logic_vector(to_signed(w24, XI_WIDTH)) & std_logic_vector(to_signed(w25, XI_WIDTH)) & std_logic_vector(to_signed(w26, XI_WIDTH)) & std_logic_vector(to_signed(w27, XI_WIDTH)) & std_logic_vector(to_signed(w28, XI_WIDTH)) & std_logic_vector(to_signed(w29, XI_WIDTH)) & std_logic_vector(to_signed(w30, XI_WIDTH)) & std_logic_vector(to_signed(w31, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(-19,3,16,-5,6,4,5,11,-2,33,10,-13,7,10,-2,28,0,-26,14,-7,-13,11,12,5,21,0,2,6,5,-26,1,-2),
	    1 => w(-12,7,4,6,4,0,-13,0,1,1,8,8,9,-3,3,7,16,-2,1,1,-10,0,-15,15,-24,2,7,18,5,15,14,-7),
	    2 => w(1,34,-5,-31,2,12,4,-3,-1,-6,3,-3,11,5,21,3,-10,22,-9,-3,2,-5,2,5,10,3,-1,-6,3,-20,-2,4),
	    3 => w(7,-4,-14,1,-16,1,-14,6,9,12,-7,6,3,-1,-6,-8,9,4,-4,-9,3,6,6,5,1,2,-26,1,5,2,19,28),
	    4 => w(35,8,-2,-25,3,4,10,-4,-7,6,-2,-7,-23,-13,24,-6,-21,9,1,2,9,-12,-2,14,2,-2,0,1,-12,15,-13,-7),
	    5 => w(-3,-2,12,30,-4,-8,20,8,5,2,2,0,-13,0,-12,-9,4,5,-6,5,10,-3,-2,-9,2,-2,1,-7,2,1,7,-6),
	    6 => w(-6,19,-36,7,-4,-5,2,1,13,1,-10,1,-7,2,6,2,-3,17,-7,1,-7,-18,-5,3,5,17,-8,-9,-6,4,-3,-14),
	    7 => w(4,19,-3,-10,-3,18,10,-3,2,3,-17,5,-3,-2,7,1,-7,-1,6,10,-3,17,-6,-3,0,2,4,1,5,-10,1,-11),
	    8 => w(11,16,-58,2,-3,6,-22,-2,-4,4,-2,0,18,12,1,-37,1,3,-1,-40,-12,10,14,6,7,0,-5,3,2,-4,1,3),
	    9 => w(-5,0,1,5,-2,-2,-3,0,7,2,51,0,3,-6,-1,5,4,3,-1,-6,-8,4,30,-4,3,18,-4,3,5,5,-2,1),
	    10 => w(-15,9,-13,-8,2,-1,6,5,0,2,8,8,-24,1,-5,2,7,-5,-9,-1,9,-11,2,5,6,-1,47,-5,9,8,1,-48),
	    11 => w(2,2,2,24,-2,-14,4,-10,-1,0,-1,5,3,3,10,1,6,-1,22,-79,17,3,2,2,-3,0,22,-4,2,-1,-24,2),
	    12 => w(-2,-4,8,-2,12,0,-2,8,-1,0,1,1,-6,20,-3,1,-3,1,-1,-3,1,-2,-7,-33,23,-6,2,4,-24,-1,-8,10),
	    13 => w(0,-117,8,-4,-58,7,2,0,-2,-1,-5,-1,-2,-1,6,-29,18,-2,-8,-7,47,0,-12,-2,-1,5,1,9,-1,-10,-5,-5),
	    14 => w(9,-2,4,7,-9,2,1,8,-5,3,-17,4,-2,-1,5,0,-6,-1,-3,0,-1,-8,11,4,-8,-2,-3,8,-2,-2,-3,11),
	    15 => w(-3,0,0,5,18,9,3,2,0,-12,3,1,-5,1,0,16,5,-5,-3,-2,-2,2,3,2,1,1,-4,1,-1,3,2,-12)
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