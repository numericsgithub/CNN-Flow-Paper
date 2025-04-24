library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity poolavg_core1_rmcm_weightsconstant_memory is
    generic
    (
        XI_WIDTH        	          : natural := 9;
        ARRAY_SIZE                    : natural := 1024;
        WORDS_PER_ADDR                : natural := 1
    );
    Port (
        clk : in std_logic;
        data_index : in unsigned(bits(ARRAY_SIZE-1)-1 downto 0);
    
        dout1    : out std_logic_vector((XI_WIDTH-1) downto 0)
    );
end poolavg_core1_rmcm_weightsconstant_memory;

architecture Behavioral of poolavg_core1_rmcm_weightsconstant_memory is


    attribute KEEP_HIERARCHY : string;
    attribute KEEP_HIERARCHY of poolavg_core1_rmcm_weightsconstant_memory : entity is "yes";

    signal rom_data_out_signal : std_logic_vector((XI_WIDTH * WORDS_PER_ADDR)-1 downto 0);

begin

    ROM_BLOCK: entity poolavg_core1_rmcm_weightsconstant_memoryROM generic map
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


    dout1 <= rom_data_out_signal((XI_WIDTH*1)-1 downto (XI_WIDTH*0));








end Behavioral;