library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_arith.CONV_STD_LOGIC_VECTOR;
use IEEE.STD_LOGIC_TEXTIO.ALL;
use std.env.finish;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

library work;
use work.simulation_settings.all;

entity conv17_act_sim is
    GENERIC
    (
        XI_WIDTH        	          : natural := 8
    );
end conv17_act_sim;

architecture Behavioral of conv17_act_sim is
    -- Constants declaration
    constant CLK_PERIOD : time := 10 ns;

    -- Clock and reset signal
    signal clk_tb : std_logic := '0';
    signal reset_tb : std_logic := '0';

    -- layer input data signals

    signal layer_xi_1_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_1_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_2_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_2_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_3_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_3_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_4_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_4_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_5_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_5_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_6_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_6_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_7_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_7_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_8_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_8_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_9_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_9_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_10_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_10_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_11_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_11_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_12_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_12_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_13_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_13_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_14_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_14_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_15_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_15_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_16_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_16_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_17_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_17_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_18_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_18_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_19_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_19_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_20_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_20_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_21_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_21_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_22_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_22_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_23_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_23_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_24_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_24_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_25_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_25_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_26_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_26_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_27_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_27_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_28_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_28_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_29_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_29_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_30_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_30_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_31_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_31_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_32_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_32_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_33_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_33_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_34_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_34_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_35_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_35_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_36_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_36_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_37_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_37_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_38_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_38_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_39_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_39_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_40_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_40_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_41_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_41_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_42_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_42_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_43_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_43_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_44_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_44_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_45_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_45_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_46_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_46_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_47_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_47_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_48_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_48_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_49_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_49_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_50_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_50_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_51_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_51_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_52_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_52_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_53_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_53_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_54_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_54_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_55_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_55_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_56_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_56_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_57_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_57_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_58_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_58_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_59_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_59_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_60_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_60_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_61_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_61_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_62_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_62_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_63_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_63_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_64_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_64_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_65_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_65_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_66_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_66_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_67_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_67_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_68_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_68_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_69_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_69_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_70_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_70_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_71_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_71_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_72_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_72_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_73_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_73_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_74_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_74_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_75_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_75_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_76_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_76_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_77_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_77_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_78_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_78_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_79_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_79_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_80_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_80_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_81_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_81_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_82_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_82_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_83_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_83_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_84_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_84_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_85_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_85_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_86_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_86_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_87_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_87_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_88_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_88_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_89_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_89_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_90_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_90_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_91_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_91_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_92_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_92_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_93_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_93_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_94_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_94_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_95_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_95_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_96_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_96_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_97_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_97_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_98_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_98_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_99_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_99_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_100_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_100_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_101_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_101_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_102_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_102_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_103_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_103_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_104_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_104_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_105_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_105_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_106_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_106_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_107_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_107_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_108_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_108_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_109_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_109_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_110_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_110_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_111_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_111_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_112_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_112_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_113_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_113_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_114_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_114_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_115_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_115_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_116_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_116_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_117_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_117_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_118_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_118_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_119_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_119_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_120_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_120_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_121_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_121_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_122_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_122_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_123_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_123_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_124_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_124_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_125_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_125_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_126_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_126_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_127_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_127_tb_sync : std_logic_vector((8-1) downto 0);
    signal layer_xi_128_tb : std_logic_vector((8-1) downto 0);
    signal layer_xi_128_tb_sync : std_logic_vector((8-1) downto 0);

    -- Control signals
    signal layer_y_valid_tb : std_logic;
    signal layer_x_is_valid_tb : std_logic;
    signal layer_x_is_valid_tb_sync : std_logic;
    --signal input_hold_counter_tb    : std_logic_vector(bits(CLOCK_CYCLES_PER_STEP-1)-1 downto 0);

    -- layer input data signals


    -- layer output data signals

    signal layer_yo_1_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_2_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_3_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_4_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_5_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_6_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_7_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_8_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_9_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_10_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_11_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_12_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_13_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_14_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_15_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_16_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_17_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_18_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_19_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_20_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_21_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_22_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_23_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_24_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_25_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_26_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_27_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_28_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_29_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_30_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_31_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_32_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_33_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_34_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_35_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_36_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_37_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_38_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_39_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_40_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_41_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_42_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_43_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_44_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_45_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_46_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_47_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_48_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_49_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_50_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_51_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_52_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_53_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_54_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_55_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_56_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_57_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_58_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_59_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_60_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_61_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_62_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_63_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_64_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_65_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_66_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_67_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_68_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_69_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_70_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_71_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_72_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_73_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_74_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_75_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_76_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_77_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_78_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_79_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_80_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_81_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_82_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_83_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_84_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_85_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_86_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_87_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_88_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_89_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_90_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_91_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_92_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_93_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_94_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_95_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_96_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_97_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_98_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_99_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_100_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_101_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_102_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_103_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_104_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_105_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_106_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_107_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_108_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_109_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_110_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_111_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_112_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_113_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_114_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_115_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_116_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_117_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_118_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_119_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_120_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_121_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_122_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_123_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_124_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_125_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_126_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_127_tb : std_logic_vector((7-1) downto 0);
    signal layer_yo_128_tb : std_logic_vector((7-1) downto 0);

begin
    -- Component instantiation
    dut : entity work.conv17_act
        port map (
            clk_tb,
            reset_tb,
        
            layer_xi_1_tb_sync,
            layer_xi_2_tb_sync,
            layer_xi_3_tb_sync,
            layer_xi_4_tb_sync,
            layer_xi_5_tb_sync,
            layer_xi_6_tb_sync,
            layer_xi_7_tb_sync,
            layer_xi_8_tb_sync,
            layer_xi_9_tb_sync,
            layer_xi_10_tb_sync,
            layer_xi_11_tb_sync,
            layer_xi_12_tb_sync,
            layer_xi_13_tb_sync,
            layer_xi_14_tb_sync,
            layer_xi_15_tb_sync,
            layer_xi_16_tb_sync,
            layer_xi_17_tb_sync,
            layer_xi_18_tb_sync,
            layer_xi_19_tb_sync,
            layer_xi_20_tb_sync,
            layer_xi_21_tb_sync,
            layer_xi_22_tb_sync,
            layer_xi_23_tb_sync,
            layer_xi_24_tb_sync,
            layer_xi_25_tb_sync,
            layer_xi_26_tb_sync,
            layer_xi_27_tb_sync,
            layer_xi_28_tb_sync,
            layer_xi_29_tb_sync,
            layer_xi_30_tb_sync,
            layer_xi_31_tb_sync,
            layer_xi_32_tb_sync,
            layer_xi_33_tb_sync,
            layer_xi_34_tb_sync,
            layer_xi_35_tb_sync,
            layer_xi_36_tb_sync,
            layer_xi_37_tb_sync,
            layer_xi_38_tb_sync,
            layer_xi_39_tb_sync,
            layer_xi_40_tb_sync,
            layer_xi_41_tb_sync,
            layer_xi_42_tb_sync,
            layer_xi_43_tb_sync,
            layer_xi_44_tb_sync,
            layer_xi_45_tb_sync,
            layer_xi_46_tb_sync,
            layer_xi_47_tb_sync,
            layer_xi_48_tb_sync,
            layer_xi_49_tb_sync,
            layer_xi_50_tb_sync,
            layer_xi_51_tb_sync,
            layer_xi_52_tb_sync,
            layer_xi_53_tb_sync,
            layer_xi_54_tb_sync,
            layer_xi_55_tb_sync,
            layer_xi_56_tb_sync,
            layer_xi_57_tb_sync,
            layer_xi_58_tb_sync,
            layer_xi_59_tb_sync,
            layer_xi_60_tb_sync,
            layer_xi_61_tb_sync,
            layer_xi_62_tb_sync,
            layer_xi_63_tb_sync,
            layer_xi_64_tb_sync,
            layer_xi_65_tb_sync,
            layer_xi_66_tb_sync,
            layer_xi_67_tb_sync,
            layer_xi_68_tb_sync,
            layer_xi_69_tb_sync,
            layer_xi_70_tb_sync,
            layer_xi_71_tb_sync,
            layer_xi_72_tb_sync,
            layer_xi_73_tb_sync,
            layer_xi_74_tb_sync,
            layer_xi_75_tb_sync,
            layer_xi_76_tb_sync,
            layer_xi_77_tb_sync,
            layer_xi_78_tb_sync,
            layer_xi_79_tb_sync,
            layer_xi_80_tb_sync,
            layer_xi_81_tb_sync,
            layer_xi_82_tb_sync,
            layer_xi_83_tb_sync,
            layer_xi_84_tb_sync,
            layer_xi_85_tb_sync,
            layer_xi_86_tb_sync,
            layer_xi_87_tb_sync,
            layer_xi_88_tb_sync,
            layer_xi_89_tb_sync,
            layer_xi_90_tb_sync,
            layer_xi_91_tb_sync,
            layer_xi_92_tb_sync,
            layer_xi_93_tb_sync,
            layer_xi_94_tb_sync,
            layer_xi_95_tb_sync,
            layer_xi_96_tb_sync,
            layer_xi_97_tb_sync,
            layer_xi_98_tb_sync,
            layer_xi_99_tb_sync,
            layer_xi_100_tb_sync,
            layer_xi_101_tb_sync,
            layer_xi_102_tb_sync,
            layer_xi_103_tb_sync,
            layer_xi_104_tb_sync,
            layer_xi_105_tb_sync,
            layer_xi_106_tb_sync,
            layer_xi_107_tb_sync,
            layer_xi_108_tb_sync,
            layer_xi_109_tb_sync,
            layer_xi_110_tb_sync,
            layer_xi_111_tb_sync,
            layer_xi_112_tb_sync,
            layer_xi_113_tb_sync,
            layer_xi_114_tb_sync,
            layer_xi_115_tb_sync,
            layer_xi_116_tb_sync,
            layer_xi_117_tb_sync,
            layer_xi_118_tb_sync,
            layer_xi_119_tb_sync,
            layer_xi_120_tb_sync,
            layer_xi_121_tb_sync,
            layer_xi_122_tb_sync,
            layer_xi_123_tb_sync,
            layer_xi_124_tb_sync,
            layer_xi_125_tb_sync,
            layer_xi_126_tb_sync,
            layer_xi_127_tb_sync,
            layer_xi_128_tb_sync,
            layer_x_is_valid_tb_sync,
        

            layer_y_valid_tb,
            layer_yo_1_tb , 
            layer_yo_2_tb , 
            layer_yo_3_tb , 
            layer_yo_4_tb , 
            layer_yo_5_tb , 
            layer_yo_6_tb , 
            layer_yo_7_tb , 
            layer_yo_8_tb , 
            layer_yo_9_tb , 
            layer_yo_10_tb , 
            layer_yo_11_tb , 
            layer_yo_12_tb , 
            layer_yo_13_tb , 
            layer_yo_14_tb , 
            layer_yo_15_tb , 
            layer_yo_16_tb , 
            layer_yo_17_tb , 
            layer_yo_18_tb , 
            layer_yo_19_tb , 
            layer_yo_20_tb , 
            layer_yo_21_tb , 
            layer_yo_22_tb , 
            layer_yo_23_tb , 
            layer_yo_24_tb , 
            layer_yo_25_tb , 
            layer_yo_26_tb , 
            layer_yo_27_tb , 
            layer_yo_28_tb , 
            layer_yo_29_tb , 
            layer_yo_30_tb , 
            layer_yo_31_tb , 
            layer_yo_32_tb , 
            layer_yo_33_tb , 
            layer_yo_34_tb , 
            layer_yo_35_tb , 
            layer_yo_36_tb , 
            layer_yo_37_tb , 
            layer_yo_38_tb , 
            layer_yo_39_tb , 
            layer_yo_40_tb , 
            layer_yo_41_tb , 
            layer_yo_42_tb , 
            layer_yo_43_tb , 
            layer_yo_44_tb , 
            layer_yo_45_tb , 
            layer_yo_46_tb , 
            layer_yo_47_tb , 
            layer_yo_48_tb , 
            layer_yo_49_tb , 
            layer_yo_50_tb , 
            layer_yo_51_tb , 
            layer_yo_52_tb , 
            layer_yo_53_tb , 
            layer_yo_54_tb , 
            layer_yo_55_tb , 
            layer_yo_56_tb , 
            layer_yo_57_tb , 
            layer_yo_58_tb , 
            layer_yo_59_tb , 
            layer_yo_60_tb , 
            layer_yo_61_tb , 
            layer_yo_62_tb , 
            layer_yo_63_tb , 
            layer_yo_64_tb , 
            layer_yo_65_tb , 
            layer_yo_66_tb , 
            layer_yo_67_tb , 
            layer_yo_68_tb , 
            layer_yo_69_tb , 
            layer_yo_70_tb , 
            layer_yo_71_tb , 
            layer_yo_72_tb , 
            layer_yo_73_tb , 
            layer_yo_74_tb , 
            layer_yo_75_tb , 
            layer_yo_76_tb , 
            layer_yo_77_tb , 
            layer_yo_78_tb , 
            layer_yo_79_tb , 
            layer_yo_80_tb , 
            layer_yo_81_tb , 
            layer_yo_82_tb , 
            layer_yo_83_tb , 
            layer_yo_84_tb , 
            layer_yo_85_tb , 
            layer_yo_86_tb , 
            layer_yo_87_tb , 
            layer_yo_88_tb , 
            layer_yo_89_tb , 
            layer_yo_90_tb , 
            layer_yo_91_tb , 
            layer_yo_92_tb , 
            layer_yo_93_tb , 
            layer_yo_94_tb , 
            layer_yo_95_tb , 
            layer_yo_96_tb , 
            layer_yo_97_tb , 
            layer_yo_98_tb , 
            layer_yo_99_tb , 
            layer_yo_100_tb , 
            layer_yo_101_tb , 
            layer_yo_102_tb , 
            layer_yo_103_tb , 
            layer_yo_104_tb , 
            layer_yo_105_tb , 
            layer_yo_106_tb , 
            layer_yo_107_tb , 
            layer_yo_108_tb , 
            layer_yo_109_tb , 
            layer_yo_110_tb , 
            layer_yo_111_tb , 
            layer_yo_112_tb , 
            layer_yo_113_tb , 
            layer_yo_114_tb , 
            layer_yo_115_tb , 
            layer_yo_116_tb , 
            layer_yo_117_tb , 
            layer_yo_118_tb , 
            layer_yo_119_tb , 
            layer_yo_120_tb , 
            layer_yo_121_tb , 
            layer_yo_122_tb , 
            layer_yo_123_tb , 
            layer_yo_124_tb , 
            layer_yo_125_tb , 
            layer_yo_126_tb , 
            layer_yo_127_tb , 
            layer_yo_128_tb 
        );

    -- Clock process
    clk_process: process
    begin
        clk_tb <= '0';
        wait for CLK_PERIOD / 2;
        clk_tb <= '1';
        wait for CLK_PERIOD / 2;
    end process;

    -- sync input data
    sync_inputs: process(clk_tb)
    begin
        if rising_edge(clk_tb) then
        
            layer_xi_1_tb_sync <= layer_xi_1_tb;
            layer_xi_2_tb_sync <= layer_xi_2_tb;
            layer_xi_3_tb_sync <= layer_xi_3_tb;
            layer_xi_4_tb_sync <= layer_xi_4_tb;
            layer_xi_5_tb_sync <= layer_xi_5_tb;
            layer_xi_6_tb_sync <= layer_xi_6_tb;
            layer_xi_7_tb_sync <= layer_xi_7_tb;
            layer_xi_8_tb_sync <= layer_xi_8_tb;
            layer_xi_9_tb_sync <= layer_xi_9_tb;
            layer_xi_10_tb_sync <= layer_xi_10_tb;
            layer_xi_11_tb_sync <= layer_xi_11_tb;
            layer_xi_12_tb_sync <= layer_xi_12_tb;
            layer_xi_13_tb_sync <= layer_xi_13_tb;
            layer_xi_14_tb_sync <= layer_xi_14_tb;
            layer_xi_15_tb_sync <= layer_xi_15_tb;
            layer_xi_16_tb_sync <= layer_xi_16_tb;
            layer_xi_17_tb_sync <= layer_xi_17_tb;
            layer_xi_18_tb_sync <= layer_xi_18_tb;
            layer_xi_19_tb_sync <= layer_xi_19_tb;
            layer_xi_20_tb_sync <= layer_xi_20_tb;
            layer_xi_21_tb_sync <= layer_xi_21_tb;
            layer_xi_22_tb_sync <= layer_xi_22_tb;
            layer_xi_23_tb_sync <= layer_xi_23_tb;
            layer_xi_24_tb_sync <= layer_xi_24_tb;
            layer_xi_25_tb_sync <= layer_xi_25_tb;
            layer_xi_26_tb_sync <= layer_xi_26_tb;
            layer_xi_27_tb_sync <= layer_xi_27_tb;
            layer_xi_28_tb_sync <= layer_xi_28_tb;
            layer_xi_29_tb_sync <= layer_xi_29_tb;
            layer_xi_30_tb_sync <= layer_xi_30_tb;
            layer_xi_31_tb_sync <= layer_xi_31_tb;
            layer_xi_32_tb_sync <= layer_xi_32_tb;
            layer_xi_33_tb_sync <= layer_xi_33_tb;
            layer_xi_34_tb_sync <= layer_xi_34_tb;
            layer_xi_35_tb_sync <= layer_xi_35_tb;
            layer_xi_36_tb_sync <= layer_xi_36_tb;
            layer_xi_37_tb_sync <= layer_xi_37_tb;
            layer_xi_38_tb_sync <= layer_xi_38_tb;
            layer_xi_39_tb_sync <= layer_xi_39_tb;
            layer_xi_40_tb_sync <= layer_xi_40_tb;
            layer_xi_41_tb_sync <= layer_xi_41_tb;
            layer_xi_42_tb_sync <= layer_xi_42_tb;
            layer_xi_43_tb_sync <= layer_xi_43_tb;
            layer_xi_44_tb_sync <= layer_xi_44_tb;
            layer_xi_45_tb_sync <= layer_xi_45_tb;
            layer_xi_46_tb_sync <= layer_xi_46_tb;
            layer_xi_47_tb_sync <= layer_xi_47_tb;
            layer_xi_48_tb_sync <= layer_xi_48_tb;
            layer_xi_49_tb_sync <= layer_xi_49_tb;
            layer_xi_50_tb_sync <= layer_xi_50_tb;
            layer_xi_51_tb_sync <= layer_xi_51_tb;
            layer_xi_52_tb_sync <= layer_xi_52_tb;
            layer_xi_53_tb_sync <= layer_xi_53_tb;
            layer_xi_54_tb_sync <= layer_xi_54_tb;
            layer_xi_55_tb_sync <= layer_xi_55_tb;
            layer_xi_56_tb_sync <= layer_xi_56_tb;
            layer_xi_57_tb_sync <= layer_xi_57_tb;
            layer_xi_58_tb_sync <= layer_xi_58_tb;
            layer_xi_59_tb_sync <= layer_xi_59_tb;
            layer_xi_60_tb_sync <= layer_xi_60_tb;
            layer_xi_61_tb_sync <= layer_xi_61_tb;
            layer_xi_62_tb_sync <= layer_xi_62_tb;
            layer_xi_63_tb_sync <= layer_xi_63_tb;
            layer_xi_64_tb_sync <= layer_xi_64_tb;
            layer_xi_65_tb_sync <= layer_xi_65_tb;
            layer_xi_66_tb_sync <= layer_xi_66_tb;
            layer_xi_67_tb_sync <= layer_xi_67_tb;
            layer_xi_68_tb_sync <= layer_xi_68_tb;
            layer_xi_69_tb_sync <= layer_xi_69_tb;
            layer_xi_70_tb_sync <= layer_xi_70_tb;
            layer_xi_71_tb_sync <= layer_xi_71_tb;
            layer_xi_72_tb_sync <= layer_xi_72_tb;
            layer_xi_73_tb_sync <= layer_xi_73_tb;
            layer_xi_74_tb_sync <= layer_xi_74_tb;
            layer_xi_75_tb_sync <= layer_xi_75_tb;
            layer_xi_76_tb_sync <= layer_xi_76_tb;
            layer_xi_77_tb_sync <= layer_xi_77_tb;
            layer_xi_78_tb_sync <= layer_xi_78_tb;
            layer_xi_79_tb_sync <= layer_xi_79_tb;
            layer_xi_80_tb_sync <= layer_xi_80_tb;
            layer_xi_81_tb_sync <= layer_xi_81_tb;
            layer_xi_82_tb_sync <= layer_xi_82_tb;
            layer_xi_83_tb_sync <= layer_xi_83_tb;
            layer_xi_84_tb_sync <= layer_xi_84_tb;
            layer_xi_85_tb_sync <= layer_xi_85_tb;
            layer_xi_86_tb_sync <= layer_xi_86_tb;
            layer_xi_87_tb_sync <= layer_xi_87_tb;
            layer_xi_88_tb_sync <= layer_xi_88_tb;
            layer_xi_89_tb_sync <= layer_xi_89_tb;
            layer_xi_90_tb_sync <= layer_xi_90_tb;
            layer_xi_91_tb_sync <= layer_xi_91_tb;
            layer_xi_92_tb_sync <= layer_xi_92_tb;
            layer_xi_93_tb_sync <= layer_xi_93_tb;
            layer_xi_94_tb_sync <= layer_xi_94_tb;
            layer_xi_95_tb_sync <= layer_xi_95_tb;
            layer_xi_96_tb_sync <= layer_xi_96_tb;
            layer_xi_97_tb_sync <= layer_xi_97_tb;
            layer_xi_98_tb_sync <= layer_xi_98_tb;
            layer_xi_99_tb_sync <= layer_xi_99_tb;
            layer_xi_100_tb_sync <= layer_xi_100_tb;
            layer_xi_101_tb_sync <= layer_xi_101_tb;
            layer_xi_102_tb_sync <= layer_xi_102_tb;
            layer_xi_103_tb_sync <= layer_xi_103_tb;
            layer_xi_104_tb_sync <= layer_xi_104_tb;
            layer_xi_105_tb_sync <= layer_xi_105_tb;
            layer_xi_106_tb_sync <= layer_xi_106_tb;
            layer_xi_107_tb_sync <= layer_xi_107_tb;
            layer_xi_108_tb_sync <= layer_xi_108_tb;
            layer_xi_109_tb_sync <= layer_xi_109_tb;
            layer_xi_110_tb_sync <= layer_xi_110_tb;
            layer_xi_111_tb_sync <= layer_xi_111_tb;
            layer_xi_112_tb_sync <= layer_xi_112_tb;
            layer_xi_113_tb_sync <= layer_xi_113_tb;
            layer_xi_114_tb_sync <= layer_xi_114_tb;
            layer_xi_115_tb_sync <= layer_xi_115_tb;
            layer_xi_116_tb_sync <= layer_xi_116_tb;
            layer_xi_117_tb_sync <= layer_xi_117_tb;
            layer_xi_118_tb_sync <= layer_xi_118_tb;
            layer_xi_119_tb_sync <= layer_xi_119_tb;
            layer_xi_120_tb_sync <= layer_xi_120_tb;
            layer_xi_121_tb_sync <= layer_xi_121_tb;
            layer_xi_122_tb_sync <= layer_xi_122_tb;
            layer_xi_123_tb_sync <= layer_xi_123_tb;
            layer_xi_124_tb_sync <= layer_xi_124_tb;
            layer_xi_125_tb_sync <= layer_xi_125_tb;
            layer_xi_126_tb_sync <= layer_xi_126_tb;
            layer_xi_127_tb_sync <= layer_xi_127_tb;
            layer_xi_128_tb_sync <= layer_xi_128_tb;
            layer_x_is_valid_tb_sync <= layer_x_is_valid_tb;
        end if;
    end process;

    -- Stimulus process
    stimulus_process: process
        file input_file      : text open read_mode is PROJ_SIMULATION_ROOT_PATH &  "conv17_act_sim_inputs.csv";
        
        file output_num_file : text open write_mode is PROJ_SIMULATION_ROOT_PATH &  "conv17_act_sim_outputs.csv";
        file valid_only_output_num_file : text open write_mode is PROJ_SIMULATION_ROOT_PATH &  "conv17_act_sim_only_valid_outputs.csv";
        variable line_buf    : line;
        variable input_x     : integer;
        variable input_valid : std_logic;
        variable line_out    : line;
        variable line_count : integer := 0;
        variable total_lines : integer := 0;
    begin
        -- Count total lines in file
        while not endfile(input_file) loop
            readline(input_file, line_buf);
            total_lines := total_lines + 1;
        end loop;
        file_close(input_file);
        file_open(input_file, PROJ_SIMULATION_ROOT_PATH &  "conv17_act_sim_inputs.csv", read_mode);

        wait for CLK_PERIOD / 2;

        -- Reset everything and set an initial input for a proper reset
    
        layer_xi_1_tb <= (others => '0');
        layer_xi_2_tb <= (others => '0');
        layer_xi_3_tb <= (others => '0');
        layer_xi_4_tb <= (others => '0');
        layer_xi_5_tb <= (others => '0');
        layer_xi_6_tb <= (others => '0');
        layer_xi_7_tb <= (others => '0');
        layer_xi_8_tb <= (others => '0');
        layer_xi_9_tb <= (others => '0');
        layer_xi_10_tb <= (others => '0');
        layer_xi_11_tb <= (others => '0');
        layer_xi_12_tb <= (others => '0');
        layer_xi_13_tb <= (others => '0');
        layer_xi_14_tb <= (others => '0');
        layer_xi_15_tb <= (others => '0');
        layer_xi_16_tb <= (others => '0');
        layer_xi_17_tb <= (others => '0');
        layer_xi_18_tb <= (others => '0');
        layer_xi_19_tb <= (others => '0');
        layer_xi_20_tb <= (others => '0');
        layer_xi_21_tb <= (others => '0');
        layer_xi_22_tb <= (others => '0');
        layer_xi_23_tb <= (others => '0');
        layer_xi_24_tb <= (others => '0');
        layer_xi_25_tb <= (others => '0');
        layer_xi_26_tb <= (others => '0');
        layer_xi_27_tb <= (others => '0');
        layer_xi_28_tb <= (others => '0');
        layer_xi_29_tb <= (others => '0');
        layer_xi_30_tb <= (others => '0');
        layer_xi_31_tb <= (others => '0');
        layer_xi_32_tb <= (others => '0');
        layer_xi_33_tb <= (others => '0');
        layer_xi_34_tb <= (others => '0');
        layer_xi_35_tb <= (others => '0');
        layer_xi_36_tb <= (others => '0');
        layer_xi_37_tb <= (others => '0');
        layer_xi_38_tb <= (others => '0');
        layer_xi_39_tb <= (others => '0');
        layer_xi_40_tb <= (others => '0');
        layer_xi_41_tb <= (others => '0');
        layer_xi_42_tb <= (others => '0');
        layer_xi_43_tb <= (others => '0');
        layer_xi_44_tb <= (others => '0');
        layer_xi_45_tb <= (others => '0');
        layer_xi_46_tb <= (others => '0');
        layer_xi_47_tb <= (others => '0');
        layer_xi_48_tb <= (others => '0');
        layer_xi_49_tb <= (others => '0');
        layer_xi_50_tb <= (others => '0');
        layer_xi_51_tb <= (others => '0');
        layer_xi_52_tb <= (others => '0');
        layer_xi_53_tb <= (others => '0');
        layer_xi_54_tb <= (others => '0');
        layer_xi_55_tb <= (others => '0');
        layer_xi_56_tb <= (others => '0');
        layer_xi_57_tb <= (others => '0');
        layer_xi_58_tb <= (others => '0');
        layer_xi_59_tb <= (others => '0');
        layer_xi_60_tb <= (others => '0');
        layer_xi_61_tb <= (others => '0');
        layer_xi_62_tb <= (others => '0');
        layer_xi_63_tb <= (others => '0');
        layer_xi_64_tb <= (others => '0');
        layer_xi_65_tb <= (others => '0');
        layer_xi_66_tb <= (others => '0');
        layer_xi_67_tb <= (others => '0');
        layer_xi_68_tb <= (others => '0');
        layer_xi_69_tb <= (others => '0');
        layer_xi_70_tb <= (others => '0');
        layer_xi_71_tb <= (others => '0');
        layer_xi_72_tb <= (others => '0');
        layer_xi_73_tb <= (others => '0');
        layer_xi_74_tb <= (others => '0');
        layer_xi_75_tb <= (others => '0');
        layer_xi_76_tb <= (others => '0');
        layer_xi_77_tb <= (others => '0');
        layer_xi_78_tb <= (others => '0');
        layer_xi_79_tb <= (others => '0');
        layer_xi_80_tb <= (others => '0');
        layer_xi_81_tb <= (others => '0');
        layer_xi_82_tb <= (others => '0');
        layer_xi_83_tb <= (others => '0');
        layer_xi_84_tb <= (others => '0');
        layer_xi_85_tb <= (others => '0');
        layer_xi_86_tb <= (others => '0');
        layer_xi_87_tb <= (others => '0');
        layer_xi_88_tb <= (others => '0');
        layer_xi_89_tb <= (others => '0');
        layer_xi_90_tb <= (others => '0');
        layer_xi_91_tb <= (others => '0');
        layer_xi_92_tb <= (others => '0');
        layer_xi_93_tb <= (others => '0');
        layer_xi_94_tb <= (others => '0');
        layer_xi_95_tb <= (others => '0');
        layer_xi_96_tb <= (others => '0');
        layer_xi_97_tb <= (others => '0');
        layer_xi_98_tb <= (others => '0');
        layer_xi_99_tb <= (others => '0');
        layer_xi_100_tb <= (others => '0');
        layer_xi_101_tb <= (others => '0');
        layer_xi_102_tb <= (others => '0');
        layer_xi_103_tb <= (others => '0');
        layer_xi_104_tb <= (others => '0');
        layer_xi_105_tb <= (others => '0');
        layer_xi_106_tb <= (others => '0');
        layer_xi_107_tb <= (others => '0');
        layer_xi_108_tb <= (others => '0');
        layer_xi_109_tb <= (others => '0');
        layer_xi_110_tb <= (others => '0');
        layer_xi_111_tb <= (others => '0');
        layer_xi_112_tb <= (others => '0');
        layer_xi_113_tb <= (others => '0');
        layer_xi_114_tb <= (others => '0');
        layer_xi_115_tb <= (others => '0');
        layer_xi_116_tb <= (others => '0');
        layer_xi_117_tb <= (others => '0');
        layer_xi_118_tb <= (others => '0');
        layer_xi_119_tb <= (others => '0');
        layer_xi_120_tb <= (others => '0');
        layer_xi_121_tb <= (others => '0');
        layer_xi_122_tb <= (others => '0');
        layer_xi_123_tb <= (others => '0');
        layer_xi_124_tb <= (others => '0');
        layer_xi_125_tb <= (others => '0');
        layer_xi_126_tb <= (others => '0');
        layer_xi_127_tb <= (others => '0');
        layer_xi_128_tb <= (others => '0');

        -- Start the reset and let it run for a few clock cycles
        layer_x_is_valid_tb <= '0';
        reset_tb <= '1';  -- Assert reset
        wait for 15 * CLK_PERIOD;
        reset_tb <= '0';  -- De-assert reset
        wait for CLK_PERIOD;

        -- Input one row after the other in the input_file. One row per clock cycle
        while not endfile(input_file) loop
            readline(input_file, line_buf);

            -- Read and set x_is_valid
            read(line_buf, input_valid);
            layer_x_is_valid_tb <= input_valid;


            -- Read the layer input hold/config select. If not used it will be ignored after reading it.
            read(line_buf, input_x);

            -- Read and set layer input features
        
            read(line_buf, input_x);
            layer_xi_1_tb <= conv_std_logic_vector(input_x, layer_xi_1_tb'length);
            read(line_buf, input_x);
            layer_xi_2_tb <= conv_std_logic_vector(input_x, layer_xi_2_tb'length);
            read(line_buf, input_x);
            layer_xi_3_tb <= conv_std_logic_vector(input_x, layer_xi_3_tb'length);
            read(line_buf, input_x);
            layer_xi_4_tb <= conv_std_logic_vector(input_x, layer_xi_4_tb'length);
            read(line_buf, input_x);
            layer_xi_5_tb <= conv_std_logic_vector(input_x, layer_xi_5_tb'length);
            read(line_buf, input_x);
            layer_xi_6_tb <= conv_std_logic_vector(input_x, layer_xi_6_tb'length);
            read(line_buf, input_x);
            layer_xi_7_tb <= conv_std_logic_vector(input_x, layer_xi_7_tb'length);
            read(line_buf, input_x);
            layer_xi_8_tb <= conv_std_logic_vector(input_x, layer_xi_8_tb'length);
            read(line_buf, input_x);
            layer_xi_9_tb <= conv_std_logic_vector(input_x, layer_xi_9_tb'length);
            read(line_buf, input_x);
            layer_xi_10_tb <= conv_std_logic_vector(input_x, layer_xi_10_tb'length);
            read(line_buf, input_x);
            layer_xi_11_tb <= conv_std_logic_vector(input_x, layer_xi_11_tb'length);
            read(line_buf, input_x);
            layer_xi_12_tb <= conv_std_logic_vector(input_x, layer_xi_12_tb'length);
            read(line_buf, input_x);
            layer_xi_13_tb <= conv_std_logic_vector(input_x, layer_xi_13_tb'length);
            read(line_buf, input_x);
            layer_xi_14_tb <= conv_std_logic_vector(input_x, layer_xi_14_tb'length);
            read(line_buf, input_x);
            layer_xi_15_tb <= conv_std_logic_vector(input_x, layer_xi_15_tb'length);
            read(line_buf, input_x);
            layer_xi_16_tb <= conv_std_logic_vector(input_x, layer_xi_16_tb'length);
            read(line_buf, input_x);
            layer_xi_17_tb <= conv_std_logic_vector(input_x, layer_xi_17_tb'length);
            read(line_buf, input_x);
            layer_xi_18_tb <= conv_std_logic_vector(input_x, layer_xi_18_tb'length);
            read(line_buf, input_x);
            layer_xi_19_tb <= conv_std_logic_vector(input_x, layer_xi_19_tb'length);
            read(line_buf, input_x);
            layer_xi_20_tb <= conv_std_logic_vector(input_x, layer_xi_20_tb'length);
            read(line_buf, input_x);
            layer_xi_21_tb <= conv_std_logic_vector(input_x, layer_xi_21_tb'length);
            read(line_buf, input_x);
            layer_xi_22_tb <= conv_std_logic_vector(input_x, layer_xi_22_tb'length);
            read(line_buf, input_x);
            layer_xi_23_tb <= conv_std_logic_vector(input_x, layer_xi_23_tb'length);
            read(line_buf, input_x);
            layer_xi_24_tb <= conv_std_logic_vector(input_x, layer_xi_24_tb'length);
            read(line_buf, input_x);
            layer_xi_25_tb <= conv_std_logic_vector(input_x, layer_xi_25_tb'length);
            read(line_buf, input_x);
            layer_xi_26_tb <= conv_std_logic_vector(input_x, layer_xi_26_tb'length);
            read(line_buf, input_x);
            layer_xi_27_tb <= conv_std_logic_vector(input_x, layer_xi_27_tb'length);
            read(line_buf, input_x);
            layer_xi_28_tb <= conv_std_logic_vector(input_x, layer_xi_28_tb'length);
            read(line_buf, input_x);
            layer_xi_29_tb <= conv_std_logic_vector(input_x, layer_xi_29_tb'length);
            read(line_buf, input_x);
            layer_xi_30_tb <= conv_std_logic_vector(input_x, layer_xi_30_tb'length);
            read(line_buf, input_x);
            layer_xi_31_tb <= conv_std_logic_vector(input_x, layer_xi_31_tb'length);
            read(line_buf, input_x);
            layer_xi_32_tb <= conv_std_logic_vector(input_x, layer_xi_32_tb'length);
            read(line_buf, input_x);
            layer_xi_33_tb <= conv_std_logic_vector(input_x, layer_xi_33_tb'length);
            read(line_buf, input_x);
            layer_xi_34_tb <= conv_std_logic_vector(input_x, layer_xi_34_tb'length);
            read(line_buf, input_x);
            layer_xi_35_tb <= conv_std_logic_vector(input_x, layer_xi_35_tb'length);
            read(line_buf, input_x);
            layer_xi_36_tb <= conv_std_logic_vector(input_x, layer_xi_36_tb'length);
            read(line_buf, input_x);
            layer_xi_37_tb <= conv_std_logic_vector(input_x, layer_xi_37_tb'length);
            read(line_buf, input_x);
            layer_xi_38_tb <= conv_std_logic_vector(input_x, layer_xi_38_tb'length);
            read(line_buf, input_x);
            layer_xi_39_tb <= conv_std_logic_vector(input_x, layer_xi_39_tb'length);
            read(line_buf, input_x);
            layer_xi_40_tb <= conv_std_logic_vector(input_x, layer_xi_40_tb'length);
            read(line_buf, input_x);
            layer_xi_41_tb <= conv_std_logic_vector(input_x, layer_xi_41_tb'length);
            read(line_buf, input_x);
            layer_xi_42_tb <= conv_std_logic_vector(input_x, layer_xi_42_tb'length);
            read(line_buf, input_x);
            layer_xi_43_tb <= conv_std_logic_vector(input_x, layer_xi_43_tb'length);
            read(line_buf, input_x);
            layer_xi_44_tb <= conv_std_logic_vector(input_x, layer_xi_44_tb'length);
            read(line_buf, input_x);
            layer_xi_45_tb <= conv_std_logic_vector(input_x, layer_xi_45_tb'length);
            read(line_buf, input_x);
            layer_xi_46_tb <= conv_std_logic_vector(input_x, layer_xi_46_tb'length);
            read(line_buf, input_x);
            layer_xi_47_tb <= conv_std_logic_vector(input_x, layer_xi_47_tb'length);
            read(line_buf, input_x);
            layer_xi_48_tb <= conv_std_logic_vector(input_x, layer_xi_48_tb'length);
            read(line_buf, input_x);
            layer_xi_49_tb <= conv_std_logic_vector(input_x, layer_xi_49_tb'length);
            read(line_buf, input_x);
            layer_xi_50_tb <= conv_std_logic_vector(input_x, layer_xi_50_tb'length);
            read(line_buf, input_x);
            layer_xi_51_tb <= conv_std_logic_vector(input_x, layer_xi_51_tb'length);
            read(line_buf, input_x);
            layer_xi_52_tb <= conv_std_logic_vector(input_x, layer_xi_52_tb'length);
            read(line_buf, input_x);
            layer_xi_53_tb <= conv_std_logic_vector(input_x, layer_xi_53_tb'length);
            read(line_buf, input_x);
            layer_xi_54_tb <= conv_std_logic_vector(input_x, layer_xi_54_tb'length);
            read(line_buf, input_x);
            layer_xi_55_tb <= conv_std_logic_vector(input_x, layer_xi_55_tb'length);
            read(line_buf, input_x);
            layer_xi_56_tb <= conv_std_logic_vector(input_x, layer_xi_56_tb'length);
            read(line_buf, input_x);
            layer_xi_57_tb <= conv_std_logic_vector(input_x, layer_xi_57_tb'length);
            read(line_buf, input_x);
            layer_xi_58_tb <= conv_std_logic_vector(input_x, layer_xi_58_tb'length);
            read(line_buf, input_x);
            layer_xi_59_tb <= conv_std_logic_vector(input_x, layer_xi_59_tb'length);
            read(line_buf, input_x);
            layer_xi_60_tb <= conv_std_logic_vector(input_x, layer_xi_60_tb'length);
            read(line_buf, input_x);
            layer_xi_61_tb <= conv_std_logic_vector(input_x, layer_xi_61_tb'length);
            read(line_buf, input_x);
            layer_xi_62_tb <= conv_std_logic_vector(input_x, layer_xi_62_tb'length);
            read(line_buf, input_x);
            layer_xi_63_tb <= conv_std_logic_vector(input_x, layer_xi_63_tb'length);
            read(line_buf, input_x);
            layer_xi_64_tb <= conv_std_logic_vector(input_x, layer_xi_64_tb'length);
            read(line_buf, input_x);
            layer_xi_65_tb <= conv_std_logic_vector(input_x, layer_xi_65_tb'length);
            read(line_buf, input_x);
            layer_xi_66_tb <= conv_std_logic_vector(input_x, layer_xi_66_tb'length);
            read(line_buf, input_x);
            layer_xi_67_tb <= conv_std_logic_vector(input_x, layer_xi_67_tb'length);
            read(line_buf, input_x);
            layer_xi_68_tb <= conv_std_logic_vector(input_x, layer_xi_68_tb'length);
            read(line_buf, input_x);
            layer_xi_69_tb <= conv_std_logic_vector(input_x, layer_xi_69_tb'length);
            read(line_buf, input_x);
            layer_xi_70_tb <= conv_std_logic_vector(input_x, layer_xi_70_tb'length);
            read(line_buf, input_x);
            layer_xi_71_tb <= conv_std_logic_vector(input_x, layer_xi_71_tb'length);
            read(line_buf, input_x);
            layer_xi_72_tb <= conv_std_logic_vector(input_x, layer_xi_72_tb'length);
            read(line_buf, input_x);
            layer_xi_73_tb <= conv_std_logic_vector(input_x, layer_xi_73_tb'length);
            read(line_buf, input_x);
            layer_xi_74_tb <= conv_std_logic_vector(input_x, layer_xi_74_tb'length);
            read(line_buf, input_x);
            layer_xi_75_tb <= conv_std_logic_vector(input_x, layer_xi_75_tb'length);
            read(line_buf, input_x);
            layer_xi_76_tb <= conv_std_logic_vector(input_x, layer_xi_76_tb'length);
            read(line_buf, input_x);
            layer_xi_77_tb <= conv_std_logic_vector(input_x, layer_xi_77_tb'length);
            read(line_buf, input_x);
            layer_xi_78_tb <= conv_std_logic_vector(input_x, layer_xi_78_tb'length);
            read(line_buf, input_x);
            layer_xi_79_tb <= conv_std_logic_vector(input_x, layer_xi_79_tb'length);
            read(line_buf, input_x);
            layer_xi_80_tb <= conv_std_logic_vector(input_x, layer_xi_80_tb'length);
            read(line_buf, input_x);
            layer_xi_81_tb <= conv_std_logic_vector(input_x, layer_xi_81_tb'length);
            read(line_buf, input_x);
            layer_xi_82_tb <= conv_std_logic_vector(input_x, layer_xi_82_tb'length);
            read(line_buf, input_x);
            layer_xi_83_tb <= conv_std_logic_vector(input_x, layer_xi_83_tb'length);
            read(line_buf, input_x);
            layer_xi_84_tb <= conv_std_logic_vector(input_x, layer_xi_84_tb'length);
            read(line_buf, input_x);
            layer_xi_85_tb <= conv_std_logic_vector(input_x, layer_xi_85_tb'length);
            read(line_buf, input_x);
            layer_xi_86_tb <= conv_std_logic_vector(input_x, layer_xi_86_tb'length);
            read(line_buf, input_x);
            layer_xi_87_tb <= conv_std_logic_vector(input_x, layer_xi_87_tb'length);
            read(line_buf, input_x);
            layer_xi_88_tb <= conv_std_logic_vector(input_x, layer_xi_88_tb'length);
            read(line_buf, input_x);
            layer_xi_89_tb <= conv_std_logic_vector(input_x, layer_xi_89_tb'length);
            read(line_buf, input_x);
            layer_xi_90_tb <= conv_std_logic_vector(input_x, layer_xi_90_tb'length);
            read(line_buf, input_x);
            layer_xi_91_tb <= conv_std_logic_vector(input_x, layer_xi_91_tb'length);
            read(line_buf, input_x);
            layer_xi_92_tb <= conv_std_logic_vector(input_x, layer_xi_92_tb'length);
            read(line_buf, input_x);
            layer_xi_93_tb <= conv_std_logic_vector(input_x, layer_xi_93_tb'length);
            read(line_buf, input_x);
            layer_xi_94_tb <= conv_std_logic_vector(input_x, layer_xi_94_tb'length);
            read(line_buf, input_x);
            layer_xi_95_tb <= conv_std_logic_vector(input_x, layer_xi_95_tb'length);
            read(line_buf, input_x);
            layer_xi_96_tb <= conv_std_logic_vector(input_x, layer_xi_96_tb'length);
            read(line_buf, input_x);
            layer_xi_97_tb <= conv_std_logic_vector(input_x, layer_xi_97_tb'length);
            read(line_buf, input_x);
            layer_xi_98_tb <= conv_std_logic_vector(input_x, layer_xi_98_tb'length);
            read(line_buf, input_x);
            layer_xi_99_tb <= conv_std_logic_vector(input_x, layer_xi_99_tb'length);
            read(line_buf, input_x);
            layer_xi_100_tb <= conv_std_logic_vector(input_x, layer_xi_100_tb'length);
            read(line_buf, input_x);
            layer_xi_101_tb <= conv_std_logic_vector(input_x, layer_xi_101_tb'length);
            read(line_buf, input_x);
            layer_xi_102_tb <= conv_std_logic_vector(input_x, layer_xi_102_tb'length);
            read(line_buf, input_x);
            layer_xi_103_tb <= conv_std_logic_vector(input_x, layer_xi_103_tb'length);
            read(line_buf, input_x);
            layer_xi_104_tb <= conv_std_logic_vector(input_x, layer_xi_104_tb'length);
            read(line_buf, input_x);
            layer_xi_105_tb <= conv_std_logic_vector(input_x, layer_xi_105_tb'length);
            read(line_buf, input_x);
            layer_xi_106_tb <= conv_std_logic_vector(input_x, layer_xi_106_tb'length);
            read(line_buf, input_x);
            layer_xi_107_tb <= conv_std_logic_vector(input_x, layer_xi_107_tb'length);
            read(line_buf, input_x);
            layer_xi_108_tb <= conv_std_logic_vector(input_x, layer_xi_108_tb'length);
            read(line_buf, input_x);
            layer_xi_109_tb <= conv_std_logic_vector(input_x, layer_xi_109_tb'length);
            read(line_buf, input_x);
            layer_xi_110_tb <= conv_std_logic_vector(input_x, layer_xi_110_tb'length);
            read(line_buf, input_x);
            layer_xi_111_tb <= conv_std_logic_vector(input_x, layer_xi_111_tb'length);
            read(line_buf, input_x);
            layer_xi_112_tb <= conv_std_logic_vector(input_x, layer_xi_112_tb'length);
            read(line_buf, input_x);
            layer_xi_113_tb <= conv_std_logic_vector(input_x, layer_xi_113_tb'length);
            read(line_buf, input_x);
            layer_xi_114_tb <= conv_std_logic_vector(input_x, layer_xi_114_tb'length);
            read(line_buf, input_x);
            layer_xi_115_tb <= conv_std_logic_vector(input_x, layer_xi_115_tb'length);
            read(line_buf, input_x);
            layer_xi_116_tb <= conv_std_logic_vector(input_x, layer_xi_116_tb'length);
            read(line_buf, input_x);
            layer_xi_117_tb <= conv_std_logic_vector(input_x, layer_xi_117_tb'length);
            read(line_buf, input_x);
            layer_xi_118_tb <= conv_std_logic_vector(input_x, layer_xi_118_tb'length);
            read(line_buf, input_x);
            layer_xi_119_tb <= conv_std_logic_vector(input_x, layer_xi_119_tb'length);
            read(line_buf, input_x);
            layer_xi_120_tb <= conv_std_logic_vector(input_x, layer_xi_120_tb'length);
            read(line_buf, input_x);
            layer_xi_121_tb <= conv_std_logic_vector(input_x, layer_xi_121_tb'length);
            read(line_buf, input_x);
            layer_xi_122_tb <= conv_std_logic_vector(input_x, layer_xi_122_tb'length);
            read(line_buf, input_x);
            layer_xi_123_tb <= conv_std_logic_vector(input_x, layer_xi_123_tb'length);
            read(line_buf, input_x);
            layer_xi_124_tb <= conv_std_logic_vector(input_x, layer_xi_124_tb'length);
            read(line_buf, input_x);
            layer_xi_125_tb <= conv_std_logic_vector(input_x, layer_xi_125_tb'length);
            read(line_buf, input_x);
            layer_xi_126_tb <= conv_std_logic_vector(input_x, layer_xi_126_tb'length);
            read(line_buf, input_x);
            layer_xi_127_tb <= conv_std_logic_vector(input_x, layer_xi_127_tb'length);
            read(line_buf, input_x);
            layer_xi_128_tb <= conv_std_logic_vector(input_x, layer_xi_128_tb'length);


            wait for clk_period;







            -- Write y_valid into csv
            write(line_out, layer_y_valid_tb);
            write(line_out, string'(" "));


            -- Write all layer output features into csvwrite(line_out, integer'image(to_integer(unsigned(layer_yo_1_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_2_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_3_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_4_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_5_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_6_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_7_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_8_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_9_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_10_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_11_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_12_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_13_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_14_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_15_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_16_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_17_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_18_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_19_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_20_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_21_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_22_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_23_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_24_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_25_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_26_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_27_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_28_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_29_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_30_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_31_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_32_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_33_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_34_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_35_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_36_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_37_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_38_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_39_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_40_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_41_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_42_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_43_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_44_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_45_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_46_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_47_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_48_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_49_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_50_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_51_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_52_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_53_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_54_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_55_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_56_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_57_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_58_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_59_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_60_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_61_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_62_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_63_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_64_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_65_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_66_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_67_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_68_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_69_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_70_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_71_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_72_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_73_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_74_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_75_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_76_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_77_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_78_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_79_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_80_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_81_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_82_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_83_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_84_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_85_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_86_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_87_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_88_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_89_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_90_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_91_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_92_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_93_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_94_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_95_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_96_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_97_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_98_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_99_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_100_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_101_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_102_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_103_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_104_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_105_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_106_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_107_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_108_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_109_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_110_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_111_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_112_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_113_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_114_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_115_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_116_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_117_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_118_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_119_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_120_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_121_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_122_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_123_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_124_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_125_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_126_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_127_tb))));
            write(line_out, string'(" "));write(line_out, integer'image(to_integer(unsigned(layer_yo_128_tb))));
            write(line_out, string'(" "));
            writeline(output_num_file, line_out);














        end loop;

        finish;
    end process;

end Behavioral;