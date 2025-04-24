library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
USE ieee.std_logic_signed.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;
use work.conv9_settings.all;

entity conv9_bias_add is
    generic
    (
        ARRAY_SIZE              : natural := 64;
        WORDS_PER_ADDR          : natural := 64;
        YO_MSB                  : integer := 13;
        YO_LSB                  : integer := -10;
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
        xi_33    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_34    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_35    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_36    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_37    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_38    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_39    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_40    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_41    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_42    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_43    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_44    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_45    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_46    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_47    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_48    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_49    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_50    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_51    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_52    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_53    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_54    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_55    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_56    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_57    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_58    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_59    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_60    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_61    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_62    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_63    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
        xi_64    : in std_logic_vector((YO_MSB-YO_LSB-1) downto 0);
    
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
        yo_32    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_33    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_34    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_35    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_36    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_37    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_38    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_39    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_40    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_41    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_42    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_43    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_44    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_45    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_46    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_47    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_48    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_49    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_50    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_51    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_52    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_53    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_54    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_55    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_56    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_57    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_58    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_59    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_60    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_61    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_62    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_63    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0); 
        yo_64    : out std_logic_vector((YO_MSB-YO_LSB-1) downto 0)
    );
end conv9_bias_add;

architecture Behavioral of conv9_bias_add is

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
    signal selected_bias_33_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_34_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_35_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_36_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_37_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_38_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_39_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_40_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_41_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_42_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_43_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_44_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_45_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_46_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_47_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_48_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_49_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_50_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_51_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_52_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_53_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_54_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_55_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_56_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_57_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_58_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_59_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_60_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_61_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_62_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_63_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);
    signal selected_bias_64_signal      : std_logic_vector((BIAS_WIDTH-1) downto 0);

begin
    BIAS_ROM: entity work.conv9_bias_add_constant_memory
        generic map
        (
            XI_WIDTH        	          => BIAS_WIDTH,
            ARRAY_SIZE                    => 64,
            WORDS_PER_ADDR                => 64
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
            dout32   => selected_bias_32_signal, 
            dout33   => selected_bias_33_signal, 
            dout34   => selected_bias_34_signal, 
            dout35   => selected_bias_35_signal, 
            dout36   => selected_bias_36_signal, 
            dout37   => selected_bias_37_signal, 
            dout38   => selected_bias_38_signal, 
            dout39   => selected_bias_39_signal, 
            dout40   => selected_bias_40_signal, 
            dout41   => selected_bias_41_signal, 
            dout42   => selected_bias_42_signal, 
            dout43   => selected_bias_43_signal, 
            dout44   => selected_bias_44_signal, 
            dout45   => selected_bias_45_signal, 
            dout46   => selected_bias_46_signal, 
            dout47   => selected_bias_47_signal, 
            dout48   => selected_bias_48_signal, 
            dout49   => selected_bias_49_signal, 
            dout50   => selected_bias_50_signal, 
            dout51   => selected_bias_51_signal, 
            dout52   => selected_bias_52_signal, 
            dout53   => selected_bias_53_signal, 
            dout54   => selected_bias_54_signal, 
            dout55   => selected_bias_55_signal, 
            dout56   => selected_bias_56_signal, 
            dout57   => selected_bias_57_signal, 
            dout58   => selected_bias_58_signal, 
            dout59   => selected_bias_59_signal, 
            dout60   => selected_bias_60_signal, 
            dout61   => selected_bias_61_signal, 
            dout62   => selected_bias_62_signal, 
            dout63   => selected_bias_63_signal, 
            dout64   => selected_bias_64_signal
        );
    adder_1 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_1")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_1_signal,
            xi_1,
            yo_1
        );
    adder_2 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_2")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_2_signal,
            xi_2,
            yo_2
        );
    adder_3 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_3")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_3_signal,
            xi_3,
            yo_3
        );
    adder_4 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_4")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_4_signal,
            xi_4,
            yo_4
        );
    adder_5 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_5")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_5_signal,
            xi_5,
            yo_5
        );
    adder_6 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_6")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_6_signal,
            xi_6,
            yo_6
        );
    adder_7 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_7")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_7_signal,
            xi_7,
            yo_7
        );
    adder_8 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_8")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_8_signal,
            xi_8,
            yo_8
        );
    adder_9 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_9")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_9_signal,
            xi_9,
            yo_9
        );
    adder_10 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_10")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_10_signal,
            xi_10,
            yo_10
        );
    adder_11 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_11")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_11_signal,
            xi_11,
            yo_11
        );
    adder_12 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_12")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_12_signal,
            xi_12,
            yo_12
        );
    adder_13 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_13")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_13_signal,
            xi_13,
            yo_13
        );
    adder_14 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_14")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_14_signal,
            xi_14,
            yo_14
        );
    adder_15 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_15")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_15_signal,
            xi_15,
            yo_15
        );
    adder_16 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_16")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_16_signal,
            xi_16,
            yo_16
        );
    adder_17 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_17")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_17_signal,
            xi_17,
            yo_17
        );
    adder_18 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_18")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_18_signal,
            xi_18,
            yo_18
        );
    adder_19 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_19")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_19_signal,
            xi_19,
            yo_19
        );
    adder_20 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_20")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_20_signal,
            xi_20,
            yo_20
        );
    adder_21 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_21")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_21_signal,
            xi_21,
            yo_21
        );
    adder_22 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_22")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_22_signal,
            xi_22,
            yo_22
        );
    adder_23 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_23")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_23_signal,
            xi_23,
            yo_23
        );
    adder_24 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_24")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_24_signal,
            xi_24,
            yo_24
        );
    adder_25 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_25")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_25_signal,
            xi_25,
            yo_25
        );
    adder_26 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_26")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_26_signal,
            xi_26,
            yo_26
        );
    adder_27 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_27")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_27_signal,
            xi_27,
            yo_27
        );
    adder_28 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_28")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_28_signal,
            xi_28,
            yo_28
        );
    adder_29 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_29")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_29_signal,
            xi_29,
            yo_29
        );
    adder_30 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_30")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_30_signal,
            xi_30,
            yo_30
        );
    adder_31 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_31")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_31_signal,
            xi_31,
            yo_31
        );
    adder_32 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_32")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_32_signal,
            xi_32,
            yo_32
        );
    adder_33 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_33")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_33_signal,
            xi_33,
            yo_33
        );
    adder_34 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_34")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_34_signal,
            xi_34,
            yo_34
        );
    adder_35 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_35")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_35_signal,
            xi_35,
            yo_35
        );
    adder_36 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_36")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_36_signal,
            xi_36,
            yo_36
        );
    adder_37 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_37")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_37_signal,
            xi_37,
            yo_37
        );
    adder_38 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_38")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_38_signal,
            xi_38,
            yo_38
        );
    adder_39 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_39")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_39_signal,
            xi_39,
            yo_39
        );
    adder_40 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_40")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_40_signal,
            xi_40,
            yo_40
        );
    adder_41 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_41")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_41_signal,
            xi_41,
            yo_41
        );
    adder_42 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_42")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_42_signal,
            xi_42,
            yo_42
        );
    adder_43 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_43")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_43_signal,
            xi_43,
            yo_43
        );
    adder_44 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_44")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_44_signal,
            xi_44,
            yo_44
        );
    adder_45 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_45")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_45_signal,
            xi_45,
            yo_45
        );
    adder_46 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_46")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_46_signal,
            xi_46,
            yo_46
        );
    adder_47 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_47")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_47_signal,
            xi_47,
            yo_47
        );
    adder_48 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_48")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_48_signal,
            xi_48,
            yo_48
        );
    adder_49 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_49")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_49_signal,
            xi_49,
            yo_49
        );
    adder_50 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_50")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_50_signal,
            xi_50,
            yo_50
        );
    adder_51 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_51")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_51_signal,
            xi_51,
            yo_51
        );
    adder_52 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_52")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_52_signal,
            xi_52,
            yo_52
        );
    adder_53 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_53")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_53_signal,
            xi_53,
            yo_53
        );
    adder_54 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_54")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_54_signal,
            xi_54,
            yo_54
        );
    adder_55 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_55")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_55_signal,
            xi_55,
            yo_55
        );
    adder_56 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_56")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_56_signal,
            xi_56,
            yo_56
        );
    adder_57 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_57")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_57_signal,
            xi_57,
            yo_57
        );
    adder_58 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_58")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_58_signal,
            xi_58,
            yo_58
        );
    adder_59 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_59")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_59_signal,
            xi_59,
            yo_59
        );
    adder_60 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_60")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_60_signal,
            xi_60,
            yo_60
        );
    adder_61 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_61")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_61_signal,
            xi_61,
            yo_61
        );
    adder_62 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_62")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_62_signal,
            xi_62,
            yo_62
        );
    adder_63 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_63")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_63_signal,
            xi_63,
            yo_63
        );
    adder_64 : entity work.IntMultiAdder_S_in4_m4_13_m10_out13_m10_wrapper_wrapper generic map(ADDER_LOCATION => "conv9_bias_add" & "_64")
        port map
        (
            clk,
            '0',
            enable,

            selected_bias_64_signal,
            xi_64,
            yo_64
        );
end Behavioral;