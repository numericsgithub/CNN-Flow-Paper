library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core12_rmcm_weightsconstant_memoryROM is
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
end conv7_core12_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv7_core12_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH)) & std_logic_vector(to_signed(w9, XI_WIDTH)) & std_logic_vector(to_signed(w10, XI_WIDTH)) & std_logic_vector(to_signed(w11, XI_WIDTH)) & std_logic_vector(to_signed(w12, XI_WIDTH)) & std_logic_vector(to_signed(w13, XI_WIDTH)) & std_logic_vector(to_signed(w14, XI_WIDTH)) & std_logic_vector(to_signed(w15, XI_WIDTH)) & std_logic_vector(to_signed(w16, XI_WIDTH)) & std_logic_vector(to_signed(w17, XI_WIDTH)) & std_logic_vector(to_signed(w18, XI_WIDTH)) & std_logic_vector(to_signed(w19, XI_WIDTH)) & std_logic_vector(to_signed(w20, XI_WIDTH)) & std_logic_vector(to_signed(w21, XI_WIDTH)) & std_logic_vector(to_signed(w22, XI_WIDTH)) & std_logic_vector(to_signed(w23, XI_WIDTH)) & std_logic_vector(to_signed(w24, XI_WIDTH)) & std_logic_vector(to_signed(w25, XI_WIDTH)) & std_logic_vector(to_signed(w26, XI_WIDTH)) & std_logic_vector(to_signed(w27, XI_WIDTH)) & std_logic_vector(to_signed(w28, XI_WIDTH)) & std_logic_vector(to_signed(w29, XI_WIDTH)) & std_logic_vector(to_signed(w30, XI_WIDTH)) & std_logic_vector(to_signed(w31, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(10,-4,-12,-4,-40,2,2,-33,-6,0,21,-3,-23,-34,-5,-6,-20,7,-13,-7,0,17,-1,-7,18,-1,7,14,-10,-20,11,4),
	    1 => w(3,-4,-8,-10,5,3,-3,-4,34,0,-5,1,21,2,-63,-16,-4,1,10,-21,20,5,3,0,-2,22,1,8,-30,1,12,-23),
	    2 => w(18,-36,-5,-21,21,30,-1,-51,22,-3,0,5,-12,3,5,-2,-5,-6,-3,5,9,14,4,2,-4,-20,-5,-1,1,2,-1,-23),
	    3 => w(7,1,2,-21,34,1,12,30,-9,2,-18,-7,1,-2,-5,-11,-6,5,-11,-18,7,-2,-3,9,-5,-1,1,0,-17,7,-10,8),
	    4 => w(5,-50,4,5,3,-3,8,3,-6,2,-5,6,17,-9,4,62,2,-4,-2,25,0,3,11,4,-3,3,-2,-5,14,-4,-12,1),
	    5 => w(2,2,7,0,11,-4,3,-1,-12,-1,-65,3,4,7,-4,5,4,-3,5,13,2,2,-4,-1,4,14,29,1,6,-1,1,-2),
	    6 => w(-12,-1,3,6,11,4,2,1,-6,-5,2,12,13,1,-6,4,3,0,5,2,-3,10,1,4,-2,-4,-38,17,4,2,-1,49),
	    7 => w(2,6,-4,-35,7,-6,-6,1,0,1,3,-1,1,1,-3,8,-5,0,-3,83,0,1,3,2,6,1,-18,3,2,-3,7,-11),
	    8 => w(-3,2,-3,-11,-4,1,-10,9,-9,1,-42,-2,-1,-5,0,2,10,11,-22,-6,1,-18,7,-3,-6,-24,-4,-3,-14,-10,5,-6),
	    9 => w(15,-32,-65,1,24,27,13,-2,-5,-7,-5,0,3,4,-23,-31,6,8,-8,-20,7,-23,3,-13,-5,1,3,-15,5,10,3,-19),
	    10 => w(-1,0,5,-6,-3,-6,0,4,-26,19,-1,2,2,0,-4,0,-43,2,7,-18,-5,-2,-1,8,6,-18,-1,4,-6,1,-1,-3),
	    11 => w(15,-14,3,1,-8,40,-28,9,-2,10,71,-12,0,3,1,7,9,-3,-1,1,-7,-51,-26,27,-5,-7,-3,-11,-18,24,-7,14),
	    12 => w(5,-6,2,9,14,-1,18,10,41,4,9,1,3,-6,-68,-6,-5,5,0,1,3,7,-6,-27,2,-9,-2,5,-5,0,0,0),
	    13 => w(-8,1,4,-4,7,6,19,-15,-10,4,0,0,-9,-5,-4,21,-5,12,-3,-16,-32,3,2,3,-1,0,-1,9,1,-16,7,1),
	    14 => w(3,-7,-1,-1,6,1,13,2,3,1,5,-12,-1,-8,-1,-3,-6,-4,-7,-16,-2,-12,-26,-6,7,3,-4,-4,36,-9,9,-4),
	    15 => w(0,-18,0,2,-24,13,-7,-9,10,3,-9,15,11,12,1,-12,-4,13,-5,-16,-7,5,-8,-1,-52,8,-1,0,19,-8,8,-12)
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