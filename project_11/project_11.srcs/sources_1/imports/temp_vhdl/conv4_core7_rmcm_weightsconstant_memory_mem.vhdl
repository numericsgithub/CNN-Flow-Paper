library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv4_core7_rmcm_weightsconstant_memory is
    generic
    (
        XI_WIDTH        	          : natural := 8;
        ARRAY_SIZE                    : natural := 4;
        WORDS_PER_ADDR                : natural := 9
    );
    Port (
        clk : in std_logic;
        data_index : in unsigned(bits(ARRAY_SIZE-1)-1 downto 0);
    
        dout1    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout2    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout3    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout4    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout5    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout6    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout7    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout8    : out std_logic_vector((XI_WIDTH-1) downto 0); 
        dout9    : out std_logic_vector((XI_WIDTH-1) downto 0)
    );
end conv4_core7_rmcm_weightsconstant_memory;

architecture Behavioral of conv4_core7_rmcm_weightsconstant_memory is


    attribute KEEP_HIERARCHY : string;
    attribute KEEP_HIERARCHY of conv4_core7_rmcm_weightsconstant_memory : entity is "yes";

    signal rom_data_out_signal : std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

begin

    ROM_BLOCK: entity conv4_core7_rmcm_weightsconstant_memoryROM generic map
    (
        XI_WIDTH        	=> XI_WIDTH,
        ARRAY_SIZE          => ARRAY_SIZE,
        WORDS_PER_ADDR      => WORDS_PER_ADDR
    )
    port map
    (
        clk => clk,
        data_index => data_index,
        dout => rom_data_out_signal
    );


    dout1 <= rom_data_out_signal((XI_WIDTH*9)-1 downto (XI_WIDTH*8));
    dout2 <= rom_data_out_signal((XI_WIDTH*8)-1 downto (XI_WIDTH*7));
    dout3 <= rom_data_out_signal((XI_WIDTH*7)-1 downto (XI_WIDTH*6));
    dout4 <= rom_data_out_signal((XI_WIDTH*6)-1 downto (XI_WIDTH*5));
    dout5 <= rom_data_out_signal((XI_WIDTH*5)-1 downto (XI_WIDTH*4));
    dout6 <= rom_data_out_signal((XI_WIDTH*4)-1 downto (XI_WIDTH*3));
    dout7 <= rom_data_out_signal((XI_WIDTH*3)-1 downto (XI_WIDTH*2));
    dout8 <= rom_data_out_signal((XI_WIDTH*2)-1 downto (XI_WIDTH*1));
    dout9 <= rom_data_out_signal((XI_WIDTH*1)-1 downto (XI_WIDTH*0));








end Behavioral;