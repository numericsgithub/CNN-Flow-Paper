library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
USE ieee.std_logic_signed.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;
use work.conv5_settings.all;

entity conv5_bias_add is
    generic
    (
        ARRAY_SIZE              : natural := 16;
        WORDS_PER_ADDR          : natural := 32;
        YO_MSB                  : integer := 14;
        YO_LSB                  : integer := -8;
        WI_MSB                  : integer := 5;
        WI_LSB                  : integer := -3
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
        xi_9    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_10    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_11    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_12    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_13    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_14    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_15    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_16    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_17    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_18    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_19    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_20    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_21    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_22    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_23    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_24    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_25    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_26    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_27    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_28    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_29    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_30    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_31    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_32    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
    
        yo_1    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_2    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_3    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_4    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_5    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_6    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_7    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_8    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_9    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_10    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_11    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_12    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_13    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_14    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_15    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_16    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_17    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_18    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_19    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_20    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_21    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_22    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_23    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_24    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_25    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_26    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_27    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_28    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_29    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_30    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_31    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_32    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0)
    );
end conv5_bias_add;

architecture Behavioral of conv5_bias_add is

    constant BIAS_WIDTH : natural := 8;






    signal selected_bias_1_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_2_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_3_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_4_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_5_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_6_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_7_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_8_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_9_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_10_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_11_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_12_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_13_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_14_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_15_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_16_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_17_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_18_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_19_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_20_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_21_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_22_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_23_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_24_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_25_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_26_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_27_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_28_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_29_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_30_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_31_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_32_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);

begin
    BIAS_ROM: entity work.conv5_bias_add_constant_memory
        generic map
        (
            XI_WIDTH        	          => BIAS_WIDTH,
            ARRAY_SIZE                    => 16,
            WORDS_PER_ADDR                => 32
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
            dout8   => selected_bias_8_signal, 
            dout9   => selected_bias_9_signal, 
            dout10   => selected_bias_10_signal, 
            dout11   => selected_bias_11_signal, 
            dout12   => selected_bias_12_signal, 
            dout13   => selected_bias_13_signal, 
            dout14   => selected_bias_14_signal, 
            dout15   => selected_bias_15_signal, 
            dout16   => selected_bias_16_signal, 
            dout17   => selected_bias_17_signal, 
            dout18   => selected_bias_18_signal, 
            dout19   => selected_bias_19_signal, 
            dout20   => selected_bias_20_signal, 
            dout21   => selected_bias_21_signal, 
            dout22   => selected_bias_22_signal, 
            dout23   => selected_bias_23_signal, 
            dout24   => selected_bias_24_signal, 
            dout25   => selected_bias_25_signal, 
            dout26   => selected_bias_26_signal, 
            dout27   => selected_bias_27_signal, 
            dout28   => selected_bias_28_signal, 
            dout29   => selected_bias_29_signal, 
            dout30   => selected_bias_30_signal, 
            dout31   => selected_bias_31_signal, 
            dout32   => selected_bias_32_signal
        );
    adder_1 : entity work.IntMultiAdder_S_in5_m3_14_m8_out14_m8_wrapper_wrapper generic map(ADDER_LOCATION => "conv5_bias_add" & "_1")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_1_signal,
            xi_1,
            yo_1
        );
    adder_2 : entity work.IntMultiAdder_S_in5_m3_14_m8_out14_m8_wrapper_wrapper generic map(ADDER_LOCATION => "conv5_bias_add" & "_2")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_2_signal,
            xi_2,
            yo_2
        );
    adder_3 : entity work.IntMultiAdder_S_in5_m3_14_m8_out14_m8_wrapper_wrapper generic map(ADDER_LOCATION => "conv5_bias_add" & "_3")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_3_signal,
            xi_3,
            yo_3
        );
    adder_4 : entity work.IntMultiAdder_S_in5_m3_14_m8_out14_m8_wrapper_wrapper generic map(ADDER_LOCATION => "conv5_bias_add" & "_4")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_4_signal,
            xi_4,
            yo_4
        );
    adder_5 : entity work.IntMultiAdder_S_in5_m3_14_m8_out14_m8_wrapper_wrapper generic map(ADDER_LOCATION => "conv5_bias_add" & "_5")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_5_signal,
            xi_5,
            yo_5
        );
    adder_6 : entity work.IntMultiAdder_S_in5_m3_14_m8_out14_m8_wrapper_wrapper generic map(ADDER_LOCATION => "conv5_bias_add" & "_6")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_6_signal,
            xi_6,
            yo_6
        );
    adder_7 : entity work.IntMultiAdder_S_in5_m3_14_m8_out14_m8_wrapper_wrapper generic map(ADDER_LOCATION => "conv5_bias_add" & "_7")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_7_signal,
            xi_7,
            yo_7
        );
    adder_8 : entity work.IntMultiAdder_S_in5_m3_14_m8_out14_m8_wrapper_wrapper generic map(ADDER_LOCATION => "conv5_bias_add" & "_8")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_8_signal,
            xi_8,
            yo_8
        );
    adder_9 : entity work.IntMultiAdder_S_in5_m3_14_m8_out14_m8_wrapper_wrapper generic map(ADDER_LOCATION => "conv5_bias_add" & "_9")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_9_signal,
            xi_9,
            yo_9
        );
    adder_10 : entity work.IntMultiAdder_S_in5_m3_14_m8_out14_m8_wrapper_wrapper generic map(ADDER_LOCATION => "conv5_bias_add" & "_10")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_10_signal,
            xi_10,
            yo_10
        );
    adder_11 : entity work.IntMultiAdder_S_in5_m3_14_m8_out14_m8_wrapper_wrapper generic map(ADDER_LOCATION => "conv5_bias_add" & "_11")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_11_signal,
            xi_11,
            yo_11
        );
    adder_12 : entity work.IntMultiAdder_S_in5_m3_14_m8_out14_m8_wrapper_wrapper generic map(ADDER_LOCATION => "conv5_bias_add" & "_12")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_12_signal,
            xi_12,
            yo_12
        );
    adder_13 : entity work.IntMultiAdder_S_in5_m3_14_m8_out14_m8_wrapper_wrapper generic map(ADDER_LOCATION => "conv5_bias_add" & "_13")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_13_signal,
            xi_13,
            yo_13
        );
    adder_14 : entity work.IntMultiAdder_S_in5_m3_14_m8_out14_m8_wrapper_wrapper generic map(ADDER_LOCATION => "conv5_bias_add" & "_14")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_14_signal,
            xi_14,
            yo_14
        );
    adder_15 : entity work.IntMultiAdder_S_in5_m3_14_m8_out14_m8_wrapper_wrapper generic map(ADDER_LOCATION => "conv5_bias_add" & "_15")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_15_signal,
            xi_15,
            yo_15
        );
    adder_16 : entity work.IntMultiAdder_S_in5_m3_14_m8_out14_m8_wrapper_wrapper generic map(ADDER_LOCATION => "conv5_bias_add" & "_16")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_16_signal,
            xi_16,
            yo_16
        );
    adder_17 : entity work.IntMultiAdder_S_in5_m3_14_m8_out14_m8_wrapper_wrapper generic map(ADDER_LOCATION => "conv5_bias_add" & "_17")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_17_signal,
            xi_17,
            yo_17
        );
    adder_18 : entity work.IntMultiAdder_S_in5_m3_14_m8_out14_m8_wrapper_wrapper generic map(ADDER_LOCATION => "conv5_bias_add" & "_18")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_18_signal,
            xi_18,
            yo_18
        );
    adder_19 : entity work.IntMultiAdder_S_in5_m3_14_m8_out14_m8_wrapper_wrapper generic map(ADDER_LOCATION => "conv5_bias_add" & "_19")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_19_signal,
            xi_19,
            yo_19
        );
    adder_20 : entity work.IntMultiAdder_S_in5_m3_14_m8_out14_m8_wrapper_wrapper generic map(ADDER_LOCATION => "conv5_bias_add" & "_20")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_20_signal,
            xi_20,
            yo_20
        );
    adder_21 : entity work.IntMultiAdder_S_in5_m3_14_m8_out14_m8_wrapper_wrapper generic map(ADDER_LOCATION => "conv5_bias_add" & "_21")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_21_signal,
            xi_21,
            yo_21
        );
    adder_22 : entity work.IntMultiAdder_S_in5_m3_14_m8_out14_m8_wrapper_wrapper generic map(ADDER_LOCATION => "conv5_bias_add" & "_22")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_22_signal,
            xi_22,
            yo_22
        );
    adder_23 : entity work.IntMultiAdder_S_in5_m3_14_m8_out14_m8_wrapper_wrapper generic map(ADDER_LOCATION => "conv5_bias_add" & "_23")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_23_signal,
            xi_23,
            yo_23
        );
    adder_24 : entity work.IntMultiAdder_S_in5_m3_14_m8_out14_m8_wrapper_wrapper generic map(ADDER_LOCATION => "conv5_bias_add" & "_24")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_24_signal,
            xi_24,
            yo_24
        );
    adder_25 : entity work.IntMultiAdder_S_in5_m3_14_m8_out14_m8_wrapper_wrapper generic map(ADDER_LOCATION => "conv5_bias_add" & "_25")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_25_signal,
            xi_25,
            yo_25
        );
    adder_26 : entity work.IntMultiAdder_S_in5_m3_14_m8_out14_m8_wrapper_wrapper generic map(ADDER_LOCATION => "conv5_bias_add" & "_26")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_26_signal,
            xi_26,
            yo_26
        );
    adder_27 : entity work.IntMultiAdder_S_in5_m3_14_m8_out14_m8_wrapper_wrapper generic map(ADDER_LOCATION => "conv5_bias_add" & "_27")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_27_signal,
            xi_27,
            yo_27
        );
    adder_28 : entity work.IntMultiAdder_S_in5_m3_14_m8_out14_m8_wrapper_wrapper generic map(ADDER_LOCATION => "conv5_bias_add" & "_28")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_28_signal,
            xi_28,
            yo_28
        );
    adder_29 : entity work.IntMultiAdder_S_in5_m3_14_m8_out14_m8_wrapper_wrapper generic map(ADDER_LOCATION => "conv5_bias_add" & "_29")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_29_signal,
            xi_29,
            yo_29
        );
    adder_30 : entity work.IntMultiAdder_S_in5_m3_14_m8_out14_m8_wrapper_wrapper generic map(ADDER_LOCATION => "conv5_bias_add" & "_30")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_30_signal,
            xi_30,
            yo_30
        );
    adder_31 : entity work.IntMultiAdder_S_in5_m3_14_m8_out14_m8_wrapper_wrapper generic map(ADDER_LOCATION => "conv5_bias_add" & "_31")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_31_signal,
            xi_31,
            yo_31
        );
    adder_32 : entity work.IntMultiAdder_S_in5_m3_14_m8_out14_m8_wrapper_wrapper generic map(ADDER_LOCATION => "conv5_bias_add" & "_32")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_32_signal,
            xi_32,
            yo_32
        );
end Behavioral;