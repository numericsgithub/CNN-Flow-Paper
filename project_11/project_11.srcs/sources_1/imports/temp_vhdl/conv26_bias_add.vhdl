library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
USE ieee.std_logic_signed.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;
use work.conv26_settings.all;

entity conv26_bias_add is
    generic
    (
        ARRAY_SIZE              : natural := 1024;
        WORDS_PER_ADDR          : natural := 1;
        YO_MSB                  : integer := 10;
        YO_LSB                  : integer := -8;
        WI_MSB                  : integer := 4;
        WI_LSB                  : integer := -4
    );
    Port (
        clk    : in std_logic;
        enable : in std_logic;
    
        sel_config : in SEL_CONFIGURATIONS_TYPE;
    
        xi_1    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
    
        yo_1    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0)
    );
end conv26_bias_add;

architecture Behavioral of conv26_bias_add is

    constant BIAS_WIDTH : natural := 8;






    signal selected_bias_1_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);

begin
    BIAS_ROM: entity work.conv26_bias_add_constant_memory
        generic map
        (
            XI_WIDTH        	          => BIAS_WIDTH,
            ARRAY_SIZE                    => 1024,
            WORDS_PER_ADDR                => 1
        )
        port map
        (
            clk => clk,
            data_index => unsigned(sel_config),
        
            dout1   => selected_bias_1_signal
        );
    adder_1 : entity work.IntMultiAdder_S_in4_m4_10_m8_out10_m8_wrapper_wrapper generic map(ADDER_LOCATION => "conv26_bias_add" & "_1")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_1_signal,
            xi_1,
            yo_1
        );
end Behavioral;