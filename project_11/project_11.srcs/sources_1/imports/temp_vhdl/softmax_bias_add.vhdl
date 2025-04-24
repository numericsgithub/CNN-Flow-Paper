library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
USE ieee.std_logic_signed.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;
use work.softmax_settings.all;

entity softmax_bias_add is
    generic
    (
        ARRAY_SIZE              : natural := 32000;
        WORDS_PER_ADDR          : natural := 8;
        YO_MSB                  : integer := 17;
        YO_LSB                  : integer := -13;
        WI_MSB                  : integer := 1;
        WI_LSB                  : integer := -7
    );
    Port (
        clk    : in std_logic;
        enable : in std_logic;
    
        sel_config : in SEL_CONFIGURATIONS_TYPE;
    
        xi_1    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_2    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_3    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_4    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_5    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_6    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_7    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_8    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
    
        yo_1    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_2    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_3    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_4    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_5    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_6    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_7    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_8    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0)
    );
end softmax_bias_add;

architecture Behavioral of softmax_bias_add is

    constant BIAS_WIDTH : natural := 8;






    signal selected_bias_1_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_2_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_3_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_4_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_5_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_6_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_7_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_8_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);

begin
    BIAS_ROM: entity work.softmax_bias_add_constant_memory
        generic map
        (
            XI_WIDTH        	          => BIAS_WIDTH,
            ARRAY_SIZE                    => 32000,
            WORDS_PER_ADDR                => 8
        )
        port map
        (
            clk => clk,
            data_index => unsigned(sel_config),
        
            dout1   => selected_bias_1_signal, 
            dout2   => selected_bias_2_signal, 
            dout3   => selected_bias_3_signal, 
            dout4   => selected_bias_4_signal, 
            dout5   => selected_bias_5_signal, 
            dout6   => selected_bias_6_signal, 
            dout7   => selected_bias_7_signal, 
            dout8   => selected_bias_8_signal
        );
    adder_1 : entity work.IntMultiAdder_S_in1_m7_17_m13_out17_m13_wrapper_wrapper generic map(ADDER_LOCATION => "softmax_bias_add" & "_1")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_1_signal,
            xi_1,
            yo_1
        );
    adder_2 : entity work.IntMultiAdder_S_in1_m7_17_m13_out17_m13_wrapper_wrapper generic map(ADDER_LOCATION => "softmax_bias_add" & "_2")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_2_signal,
            xi_2,
            yo_2
        );
    adder_3 : entity work.IntMultiAdder_S_in1_m7_17_m13_out17_m13_wrapper_wrapper generic map(ADDER_LOCATION => "softmax_bias_add" & "_3")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_3_signal,
            xi_3,
            yo_3
        );
    adder_4 : entity work.IntMultiAdder_S_in1_m7_17_m13_out17_m13_wrapper_wrapper generic map(ADDER_LOCATION => "softmax_bias_add" & "_4")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_4_signal,
            xi_4,
            yo_4
        );
    adder_5 : entity work.IntMultiAdder_S_in1_m7_17_m13_out17_m13_wrapper_wrapper generic map(ADDER_LOCATION => "softmax_bias_add" & "_5")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_5_signal,
            xi_5,
            yo_5
        );
    adder_6 : entity work.IntMultiAdder_S_in1_m7_17_m13_out17_m13_wrapper_wrapper generic map(ADDER_LOCATION => "softmax_bias_add" & "_6")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_6_signal,
            xi_6,
            yo_6
        );
    adder_7 : entity work.IntMultiAdder_S_in1_m7_17_m13_out17_m13_wrapper_wrapper generic map(ADDER_LOCATION => "softmax_bias_add" & "_7")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_7_signal,
            xi_7,
            yo_7
        );
    adder_8 : entity work.IntMultiAdder_S_in1_m7_17_m13_out17_m13_wrapper_wrapper generic map(ADDER_LOCATION => "softmax_bias_add" & "_8")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_8_signal,
            xi_8,
            yo_8
        );
end Behavioral;