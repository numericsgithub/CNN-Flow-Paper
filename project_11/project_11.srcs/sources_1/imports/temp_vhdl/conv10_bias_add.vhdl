library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
USE ieee.std_logic_signed.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;
use work.conv10_settings.all;

entity conv10_bias_add is
    generic
    (
        ARRAY_SIZE              : natural := 64;
        WORDS_PER_ADDR          : natural := 4;
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
        xi_2    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_3    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_4    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
    
        yo_1    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_2    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_3    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_4    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0)
    );
end conv10_bias_add;

architecture Behavioral of conv10_bias_add is

    constant BIAS_WIDTH : natural := 8;






    signal selected_bias_1_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_2_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_3_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_4_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);

begin
    BIAS_ROM: entity work.conv10_bias_add_constant_memory
        generic map
        (
            XI_WIDTH        	          => BIAS_WIDTH,
            ARRAY_SIZE                    => 64,
            WORDS_PER_ADDR                => 4
        )
        port map
        (
            clk => clk,
            data_index => unsigned(sel_config),
        
            dout1   => selected_bias_1_signal, 
            dout2   => selected_bias_2_signal, 
            dout3   => selected_bias_3_signal, 
            dout4   => selected_bias_4_signal
        );
    adder_1 : entity work.IntMultiAdder_S_in4_m4_10_m8_out10_m8_wrapper_wrapper generic map(ADDER_LOCATION => "conv10_bias_add" & "_1")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_1_signal,
            xi_1,
            yo_1
        );
    adder_2 : entity work.IntMultiAdder_S_in4_m4_10_m8_out10_m8_wrapper_wrapper generic map(ADDER_LOCATION => "conv10_bias_add" & "_2")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_2_signal,
            xi_2,
            yo_2
        );
    adder_3 : entity work.IntMultiAdder_S_in4_m4_10_m8_out10_m8_wrapper_wrapper generic map(ADDER_LOCATION => "conv10_bias_add" & "_3")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_3_signal,
            xi_3,
            yo_3
        );
    adder_4 : entity work.IntMultiAdder_S_in4_m4_10_m8_out10_m8_wrapper_wrapper generic map(ADDER_LOCATION => "conv10_bias_add" & "_4")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_4_signal,
            xi_4,
            yo_4
        );
end Behavioral;