library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv1_core1_rmcm_weightsconstant_memoryROM is
    generic
    (
        XI_WIDTH        	          : natural := 8;
        ARRAY_SIZE                    : natural := 1;
        WORDS_PER_ADDR                : natural := 60
    );
    Port (
        clk        : in std_logic;
        data_index : in unsigned(bits(ARRAY_SIZE-1)-1 downto 0);
        dout       : out std_logic_vector((XI_WIDTH * WORDS_PER_ADDR-1) downto 0)
    );
end conv1_core1_rmcm_weightsconstant_memoryROM;

architecture Behavioral of conv1_core1_rmcm_weightsconstant_memoryROM is
    type ROM_TYPE is array(0 to ARRAY_SIZE-1) of std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

    -- Function to concatenate signed integer values into a single std_logic_vector
    function w(w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31, w32, w33, w34, w35, w36, w37, w38, w39, w40, w41, w42, w43, w44, w45, w46, w47, w48, w49, w50, w51, w52, w53, w54, w55, w56, w57, w58, w59: integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(w0, XI_WIDTH)) & std_logic_vector(to_signed(w1, XI_WIDTH)) & std_logic_vector(to_signed(w2, XI_WIDTH)) & std_logic_vector(to_signed(w3, XI_WIDTH)) & std_logic_vector(to_signed(w4, XI_WIDTH)) & std_logic_vector(to_signed(w5, XI_WIDTH)) & std_logic_vector(to_signed(w6, XI_WIDTH)) & std_logic_vector(to_signed(w7, XI_WIDTH)) & std_logic_vector(to_signed(w8, XI_WIDTH)) & std_logic_vector(to_signed(w9, XI_WIDTH)) & std_logic_vector(to_signed(w10, XI_WIDTH)) & std_logic_vector(to_signed(w11, XI_WIDTH)) & std_logic_vector(to_signed(w12, XI_WIDTH)) & std_logic_vector(to_signed(w13, XI_WIDTH)) & std_logic_vector(to_signed(w14, XI_WIDTH)) & std_logic_vector(to_signed(w15, XI_WIDTH)) & std_logic_vector(to_signed(w16, XI_WIDTH)) & std_logic_vector(to_signed(w17, XI_WIDTH)) & std_logic_vector(to_signed(w18, XI_WIDTH)) & std_logic_vector(to_signed(w19, XI_WIDTH)) & std_logic_vector(to_signed(w20, XI_WIDTH)) & std_logic_vector(to_signed(w21, XI_WIDTH)) & std_logic_vector(to_signed(w22, XI_WIDTH)) & std_logic_vector(to_signed(w23, XI_WIDTH)) & std_logic_vector(to_signed(w24, XI_WIDTH)) & std_logic_vector(to_signed(w25, XI_WIDTH)) & std_logic_vector(to_signed(w26, XI_WIDTH)) & std_logic_vector(to_signed(w27, XI_WIDTH)) & std_logic_vector(to_signed(w28, XI_WIDTH)) & std_logic_vector(to_signed(w29, XI_WIDTH)) & std_logic_vector(to_signed(w30, XI_WIDTH)) & std_logic_vector(to_signed(w31, XI_WIDTH)) & std_logic_vector(to_signed(w32, XI_WIDTH)) & std_logic_vector(to_signed(w33, XI_WIDTH)) & std_logic_vector(to_signed(w34, XI_WIDTH)) & std_logic_vector(to_signed(w35, XI_WIDTH)) & std_logic_vector(to_signed(w36, XI_WIDTH)) & std_logic_vector(to_signed(w37, XI_WIDTH)) & std_logic_vector(to_signed(w38, XI_WIDTH)) & std_logic_vector(to_signed(w39, XI_WIDTH)) & std_logic_vector(to_signed(w40, XI_WIDTH)) & std_logic_vector(to_signed(w41, XI_WIDTH)) & std_logic_vector(to_signed(w42, XI_WIDTH)) & std_logic_vector(to_signed(w43, XI_WIDTH)) & std_logic_vector(to_signed(w44, XI_WIDTH)) & std_logic_vector(to_signed(w45, XI_WIDTH)) & std_logic_vector(to_signed(w46, XI_WIDTH)) & std_logic_vector(to_signed(w47, XI_WIDTH)) & std_logic_vector(to_signed(w48, XI_WIDTH)) & std_logic_vector(to_signed(w49, XI_WIDTH)) & std_logic_vector(to_signed(w50, XI_WIDTH)) & std_logic_vector(to_signed(w51, XI_WIDTH)) & std_logic_vector(to_signed(w52, XI_WIDTH)) & std_logic_vector(to_signed(w53, XI_WIDTH)) & std_logic_vector(to_signed(w54, XI_WIDTH)) & std_logic_vector(to_signed(w55, XI_WIDTH)) & std_logic_vector(to_signed(w56, XI_WIDTH)) & std_logic_vector(to_signed(w57, XI_WIDTH)) & std_logic_vector(to_signed(w58, XI_WIDTH)) & std_logic_vector(to_signed(w59, XI_WIDTH));
    end function;

	constant data_ROM : ROM_TYPE := (
    
	    0 => w(-8,-6,4,-1,-3,1,12,19,7,22,29,8,-7,27,-45,18,9,-23,15,-4,3,17,-14,13,-9,5,-44,39,-37,42,-5,-26,-31,-21,-36,-40,-20,-16,-11,6,-25,-24,-10,36,16,-35,-46,-17,2,33,30,-55,-18,23,-2,-53,-41,38,21,32)
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