LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv18_interleaving is
    generic
    (
        XI_WIDTH        	: natural := 7;
		CONFIGURATIONS      : natural := 256;
		INTERLEAVINGS       : natural := 1;
		INPUTS_PER_MUX      : natural := 64
    );
    port
    (
        clk   : in std_logic;
        reset : in std_logic;
    
        layer_xi_1    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_2    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_3    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_4    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_5    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_6    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_7    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_8    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_9    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_10    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_11    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_12    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_13    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_14    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_15    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_16    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_17    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_18    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_19    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_20    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_21    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_22    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_23    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_24    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_25    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_26    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_27    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_28    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_29    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_30    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_31    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_32    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_33    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_34    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_35    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_36    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_37    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_38    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_39    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_40    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_41    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_42    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_43    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_44    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_45    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_46    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_47    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_48    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_49    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_50    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_51    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_52    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_53    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_54    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_55    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_56    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_57    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_58    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_59    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_60    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_61    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_62    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_63    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_64    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_65    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_66    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_67    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_68    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_69    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_70    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_71    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_72    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_73    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_74    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_75    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_76    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_77    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_78    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_79    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_80    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_81    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_82    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_83    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_84    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_85    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_86    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_87    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_88    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_89    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_90    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_91    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_92    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_93    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_94    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_95    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_96    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_97    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_98    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_99    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_100    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_101    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_102    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_103    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_104    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_105    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_106    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_107    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_108    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_109    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_110    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_111    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_112    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_113    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_114    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_115    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_116    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_117    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_118    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_119    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_120    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_121    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_122    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_123    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_124    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_125    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_126    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_127    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_128    : in std_logic_vector((XI_WIDTH-1) downto 0);
        x_is_valid    : in std_logic;

        y_valid       : out std_logic;
        sel_config    : out std_logic_vector(bits(CONFIGURATIONS-1)-1 downto 0);
        layer_yo_1 : out std_logic_vector((XI_WIDTH-1) downto 0); 
        layer_yo_2 : out std_logic_vector((XI_WIDTH-1) downto 0)
    ) ;
end conv18_interleaving;

architecture Behavioral of conv18_interleaving is


    attribute KEEP_HIERARCHY : string;
    attribute KEEP_HIERARCHY of conv18_interleaving : entity is "yes";


	constant FIFO_START_THR     : natural := 2;
    constant FIFO_LAST_READ_MAX : natural := INPUTS_PER_MUX - 1;
    constant FIFO_SIZE          : natural := 5;
    constant FIFO_HOLD_CYCLES   : natural := INTERLEAVINGS * INPUTS_PER_MUX;
    constant AMOUNT_OF_LAYER_OUTPUTS          : natural := 2;

    type state_type is (FLUSH_DATA, LOAD_FIRST, AWAIT_THRESHOLD);
    signal state : state_type;
    signal debug_state_signal : unsigned(2 downto 0);

    type PIPELINE_TYPE_FOR_Y_VALID_PL           is array(0 to 2) of std_logic;
    type PIPELINE_TYPE_FOR_SEL_CONFIG_PL        is array(0 to 2) of std_logic_vector(bits(CONFIGURATIONS-1)-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_1_PL        is array(0 to 1) of std_logic_vector((XI_WIDTH-1) downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_2_PL        is array(0 to 1) of std_logic_vector((XI_WIDTH-1) downto 0);
    type PIPELINE_TYPE_FOR_MUX_SELECT_SIGNAL_PL is array(0 to 1) of std_logic_vector((bits(INPUTS_PER_MUX - 1) - 1) downto 0);
    type PIPELINE_TYPE_FOR_FIFO_MAIN_OUTPUT_SIGNAL_PL is array(0 to 1) of std_logic_vector((XI_WIDTH*128-1) downto 0);

    -- 
    signal y_valid_pl           : PIPELINE_TYPE_FOR_Y_VALID_PL;
    -- 
    signal sel_config_pl        : PIPELINE_TYPE_FOR_SEL_CONFIG_PL;
    -- 
    signal layer_yo_1_pl        : PIPELINE_TYPE_FOR_LAYER_YO_1_PL;
    -- 
    signal layer_yo_2_pl        : PIPELINE_TYPE_FOR_LAYER_YO_2_PL;
    -- 
    signal mux_select_signal_pl : PIPELINE_TYPE_FOR_MUX_SELECT_SIGNAL_PL;
    signal mux_select_signal        : unsigned((bits(INPUTS_PER_MUX - 1) - 1) downto 0);
    signal config_out_select_signal : unsigned((bits(CONFIGURATIONS - 1) - 1) downto 0);
    signal fifo_hold_counter        : unsigned((bits(FIFO_HOLD_CYCLES - 1) - 1) downto 0);
    signal data_next                : std_logic;
    signal fifo_data_counter        : unsigned(bits(FIFO_SIZE) downto 0);
    signal y_valid_signal           : std_logic;

    -- All fifo flags
    signal full_flag_MAIN_signal          : std_logic;
    signal empty_flag_MAIN_signal         : std_logic;

    -- All fifo outputs
    signal fifo_MAIN_input_signal         : std_logic_vector((XI_WIDTH*128-1) downto 0);
    -- 
    signal fifo_MAIN_output_signal_pl : PIPELINE_TYPE_FOR_FIFO_MAIN_OUTPUT_SIGNAL_PL;
    --signal fifo_MAIN_output_signal        : std_logic_vector((XI_WIDTH*128-1) downto 0);
    signal fifo_1_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_2_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_3_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_4_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_5_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_6_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_7_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_8_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_9_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_10_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_11_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_12_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_13_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_14_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_15_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_16_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_17_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_18_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_19_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_20_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_21_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_22_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_23_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_24_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_25_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_26_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_27_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_28_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_29_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_30_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_31_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_32_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_33_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_34_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_35_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_36_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_37_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_38_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_39_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_40_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_41_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_42_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_43_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_44_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_45_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_46_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_47_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_48_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_49_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_50_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_51_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_52_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_53_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_54_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_55_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_56_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_57_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_58_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_59_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_60_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_61_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_62_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_63_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_64_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_65_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_66_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_67_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_68_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_69_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_70_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_71_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_72_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_73_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_74_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_75_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_76_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_77_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_78_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_79_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_80_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_81_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_82_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_83_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_84_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_85_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_86_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_87_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_88_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_89_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_90_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_91_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_92_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_93_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_94_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_95_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_96_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_97_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_98_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_99_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_100_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_101_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_102_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_103_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_104_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_105_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_106_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_107_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_108_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_109_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_110_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_111_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_112_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_113_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_114_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_115_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_116_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_117_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_118_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_119_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_120_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_121_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_122_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_123_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_124_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_125_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_126_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_127_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_128_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);

begin

    fifo_MAIN_input_signal <= layer_xi_1  & layer_xi_2  & layer_xi_3  & layer_xi_4  & layer_xi_5  & layer_xi_6  & layer_xi_7  & layer_xi_8  & layer_xi_9  & layer_xi_10  & layer_xi_11  & layer_xi_12  & layer_xi_13  & layer_xi_14  & layer_xi_15  & layer_xi_16  & layer_xi_17  & layer_xi_18  & layer_xi_19  & layer_xi_20  & layer_xi_21  & layer_xi_22  & layer_xi_23  & layer_xi_24  & layer_xi_25  & layer_xi_26  & layer_xi_27  & layer_xi_28  & layer_xi_29  & layer_xi_30  & layer_xi_31  & layer_xi_32  & layer_xi_33  & layer_xi_34  & layer_xi_35  & layer_xi_36  & layer_xi_37  & layer_xi_38  & layer_xi_39  & layer_xi_40  & layer_xi_41  & layer_xi_42  & layer_xi_43  & layer_xi_44  & layer_xi_45  & layer_xi_46  & layer_xi_47  & layer_xi_48  & layer_xi_49  & layer_xi_50  & layer_xi_51  & layer_xi_52  & layer_xi_53  & layer_xi_54  & layer_xi_55  & layer_xi_56  & layer_xi_57  & layer_xi_58  & layer_xi_59  & layer_xi_60  & layer_xi_61  & layer_xi_62  & layer_xi_63  & layer_xi_64  & layer_xi_65  & layer_xi_66  & layer_xi_67  & layer_xi_68  & layer_xi_69  & layer_xi_70  & layer_xi_71  & layer_xi_72  & layer_xi_73  & layer_xi_74  & layer_xi_75  & layer_xi_76  & layer_xi_77  & layer_xi_78  & layer_xi_79  & layer_xi_80  & layer_xi_81  & layer_xi_82  & layer_xi_83  & layer_xi_84  & layer_xi_85  & layer_xi_86  & layer_xi_87  & layer_xi_88  & layer_xi_89  & layer_xi_90  & layer_xi_91  & layer_xi_92  & layer_xi_93  & layer_xi_94  & layer_xi_95  & layer_xi_96  & layer_xi_97  & layer_xi_98  & layer_xi_99  & layer_xi_100  & layer_xi_101  & layer_xi_102  & layer_xi_103  & layer_xi_104  & layer_xi_105  & layer_xi_106  & layer_xi_107  & layer_xi_108  & layer_xi_109  & layer_xi_110  & layer_xi_111  & layer_xi_112  & layer_xi_113  & layer_xi_114  & layer_xi_115  & layer_xi_116  & layer_xi_117  & layer_xi_118  & layer_xi_119  & layer_xi_120  & layer_xi_121  & layer_xi_122  & layer_xi_123  & layer_xi_124  & layer_xi_125  & layer_xi_126  & layer_xi_127  & layer_xi_128 ;


    FIFO_1: entity work.fifo_master_generator generic map(XI_WIDTH => XI_WIDTH*128, XI_DEPTH => FIFO_SIZE)
        port map
        (
            reset => reset,
            clk   => clk,
            write_en   => x_is_valid,
            data_in    => fifo_MAIN_input_signal,
            full_flag  => full_flag_MAIN_signal,
            read_en    => data_next,
            data_out   => fifo_MAIN_output_signal_pl(0),
            empty_flag => empty_flag_MAIN_signal,
            data_available => open
        );
    mux_select_signal_pl(0) <= std_logic_vector(mux_select_signal);

    -- Add a pipeline step
    PL_STEP_0_for_mux_select_signal_pl: entity work.Pipe_Vector PORT MAP(clk, '1', mux_select_signal_pl(0), mux_select_signal_pl(1));
    PL_STEP_0_for_fifo_MAIN_output_signal_pl: entity work.Pipe_Vector PORT MAP(clk, '1', fifo_MAIN_output_signal_pl(0), fifo_MAIN_output_signal_pl(1));


    fifo_1_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*128)-1 downto (XI_WIDTH*127));
    fifo_2_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*127)-1 downto (XI_WIDTH*126));
    fifo_3_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*126)-1 downto (XI_WIDTH*125));
    fifo_4_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*125)-1 downto (XI_WIDTH*124));
    fifo_5_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*124)-1 downto (XI_WIDTH*123));
    fifo_6_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*123)-1 downto (XI_WIDTH*122));
    fifo_7_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*122)-1 downto (XI_WIDTH*121));
    fifo_8_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*121)-1 downto (XI_WIDTH*120));
    fifo_9_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*120)-1 downto (XI_WIDTH*119));
    fifo_10_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*119)-1 downto (XI_WIDTH*118));
    fifo_11_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*118)-1 downto (XI_WIDTH*117));
    fifo_12_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*117)-1 downto (XI_WIDTH*116));
    fifo_13_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*116)-1 downto (XI_WIDTH*115));
    fifo_14_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*115)-1 downto (XI_WIDTH*114));
    fifo_15_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*114)-1 downto (XI_WIDTH*113));
    fifo_16_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*113)-1 downto (XI_WIDTH*112));
    fifo_17_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*112)-1 downto (XI_WIDTH*111));
    fifo_18_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*111)-1 downto (XI_WIDTH*110));
    fifo_19_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*110)-1 downto (XI_WIDTH*109));
    fifo_20_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*109)-1 downto (XI_WIDTH*108));
    fifo_21_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*108)-1 downto (XI_WIDTH*107));
    fifo_22_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*107)-1 downto (XI_WIDTH*106));
    fifo_23_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*106)-1 downto (XI_WIDTH*105));
    fifo_24_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*105)-1 downto (XI_WIDTH*104));
    fifo_25_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*104)-1 downto (XI_WIDTH*103));
    fifo_26_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*103)-1 downto (XI_WIDTH*102));
    fifo_27_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*102)-1 downto (XI_WIDTH*101));
    fifo_28_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*101)-1 downto (XI_WIDTH*100));
    fifo_29_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*100)-1 downto (XI_WIDTH*99));
    fifo_30_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*99)-1 downto (XI_WIDTH*98));
    fifo_31_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*98)-1 downto (XI_WIDTH*97));
    fifo_32_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*97)-1 downto (XI_WIDTH*96));
    fifo_33_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*96)-1 downto (XI_WIDTH*95));
    fifo_34_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*95)-1 downto (XI_WIDTH*94));
    fifo_35_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*94)-1 downto (XI_WIDTH*93));
    fifo_36_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*93)-1 downto (XI_WIDTH*92));
    fifo_37_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*92)-1 downto (XI_WIDTH*91));
    fifo_38_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*91)-1 downto (XI_WIDTH*90));
    fifo_39_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*90)-1 downto (XI_WIDTH*89));
    fifo_40_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*89)-1 downto (XI_WIDTH*88));
    fifo_41_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*88)-1 downto (XI_WIDTH*87));
    fifo_42_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*87)-1 downto (XI_WIDTH*86));
    fifo_43_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*86)-1 downto (XI_WIDTH*85));
    fifo_44_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*85)-1 downto (XI_WIDTH*84));
    fifo_45_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*84)-1 downto (XI_WIDTH*83));
    fifo_46_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*83)-1 downto (XI_WIDTH*82));
    fifo_47_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*82)-1 downto (XI_WIDTH*81));
    fifo_48_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*81)-1 downto (XI_WIDTH*80));
    fifo_49_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*80)-1 downto (XI_WIDTH*79));
    fifo_50_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*79)-1 downto (XI_WIDTH*78));
    fifo_51_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*78)-1 downto (XI_WIDTH*77));
    fifo_52_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*77)-1 downto (XI_WIDTH*76));
    fifo_53_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*76)-1 downto (XI_WIDTH*75));
    fifo_54_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*75)-1 downto (XI_WIDTH*74));
    fifo_55_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*74)-1 downto (XI_WIDTH*73));
    fifo_56_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*73)-1 downto (XI_WIDTH*72));
    fifo_57_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*72)-1 downto (XI_WIDTH*71));
    fifo_58_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*71)-1 downto (XI_WIDTH*70));
    fifo_59_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*70)-1 downto (XI_WIDTH*69));
    fifo_60_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*69)-1 downto (XI_WIDTH*68));
    fifo_61_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*68)-1 downto (XI_WIDTH*67));
    fifo_62_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*67)-1 downto (XI_WIDTH*66));
    fifo_63_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*66)-1 downto (XI_WIDTH*65));
    fifo_64_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*65)-1 downto (XI_WIDTH*64));
    fifo_65_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*64)-1 downto (XI_WIDTH*63));
    fifo_66_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*63)-1 downto (XI_WIDTH*62));
    fifo_67_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*62)-1 downto (XI_WIDTH*61));
    fifo_68_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*61)-1 downto (XI_WIDTH*60));
    fifo_69_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*60)-1 downto (XI_WIDTH*59));
    fifo_70_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*59)-1 downto (XI_WIDTH*58));
    fifo_71_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*58)-1 downto (XI_WIDTH*57));
    fifo_72_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*57)-1 downto (XI_WIDTH*56));
    fifo_73_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*56)-1 downto (XI_WIDTH*55));
    fifo_74_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*55)-1 downto (XI_WIDTH*54));
    fifo_75_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*54)-1 downto (XI_WIDTH*53));
    fifo_76_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*53)-1 downto (XI_WIDTH*52));
    fifo_77_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*52)-1 downto (XI_WIDTH*51));
    fifo_78_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*51)-1 downto (XI_WIDTH*50));
    fifo_79_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*50)-1 downto (XI_WIDTH*49));
    fifo_80_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*49)-1 downto (XI_WIDTH*48));
    fifo_81_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*48)-1 downto (XI_WIDTH*47));
    fifo_82_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*47)-1 downto (XI_WIDTH*46));
    fifo_83_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*46)-1 downto (XI_WIDTH*45));
    fifo_84_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*45)-1 downto (XI_WIDTH*44));
    fifo_85_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*44)-1 downto (XI_WIDTH*43));
    fifo_86_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*43)-1 downto (XI_WIDTH*42));
    fifo_87_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*42)-1 downto (XI_WIDTH*41));
    fifo_88_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*41)-1 downto (XI_WIDTH*40));
    fifo_89_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*40)-1 downto (XI_WIDTH*39));
    fifo_90_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*39)-1 downto (XI_WIDTH*38));
    fifo_91_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*38)-1 downto (XI_WIDTH*37));
    fifo_92_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*37)-1 downto (XI_WIDTH*36));
    fifo_93_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*36)-1 downto (XI_WIDTH*35));
    fifo_94_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*35)-1 downto (XI_WIDTH*34));
    fifo_95_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*34)-1 downto (XI_WIDTH*33));
    fifo_96_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*33)-1 downto (XI_WIDTH*32));
    fifo_97_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*32)-1 downto (XI_WIDTH*31));
    fifo_98_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*31)-1 downto (XI_WIDTH*30));
    fifo_99_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*30)-1 downto (XI_WIDTH*29));
    fifo_100_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*29)-1 downto (XI_WIDTH*28));
    fifo_101_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*28)-1 downto (XI_WIDTH*27));
    fifo_102_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*27)-1 downto (XI_WIDTH*26));
    fifo_103_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*26)-1 downto (XI_WIDTH*25));
    fifo_104_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*25)-1 downto (XI_WIDTH*24));
    fifo_105_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*24)-1 downto (XI_WIDTH*23));
    fifo_106_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*23)-1 downto (XI_WIDTH*22));
    fifo_107_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*22)-1 downto (XI_WIDTH*21));
    fifo_108_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*21)-1 downto (XI_WIDTH*20));
    fifo_109_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*20)-1 downto (XI_WIDTH*19));
    fifo_110_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*19)-1 downto (XI_WIDTH*18));
    fifo_111_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*18)-1 downto (XI_WIDTH*17));
    fifo_112_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*17)-1 downto (XI_WIDTH*16));
    fifo_113_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*16)-1 downto (XI_WIDTH*15));
    fifo_114_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*15)-1 downto (XI_WIDTH*14));
    fifo_115_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*14)-1 downto (XI_WIDTH*13));
    fifo_116_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*13)-1 downto (XI_WIDTH*12));
    fifo_117_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*12)-1 downto (XI_WIDTH*11));
    fifo_118_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*11)-1 downto (XI_WIDTH*10));
    fifo_119_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*10)-1 downto (XI_WIDTH*9));
    fifo_120_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*9)-1 downto (XI_WIDTH*8));
    fifo_121_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*8)-1 downto (XI_WIDTH*7));
    fifo_122_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*7)-1 downto (XI_WIDTH*6));
    fifo_123_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*6)-1 downto (XI_WIDTH*5));
    fifo_124_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*5)-1 downto (XI_WIDTH*4));
    fifo_125_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*4)-1 downto (XI_WIDTH*3));
    fifo_126_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*3)-1 downto (XI_WIDTH*2));
    fifo_127_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*2)-1 downto (XI_WIDTH*1));
    fifo_128_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*1)-1 downto (XI_WIDTH*0));



    MUX_0: entity work.muxB_64to1 generic map(DATA_WIDTH => (XI_WIDTH))
                               port map(fifo_1_output_signal, fifo_3_output_signal, fifo_5_output_signal, fifo_7_output_signal, fifo_9_output_signal, fifo_11_output_signal, fifo_13_output_signal, fifo_15_output_signal, fifo_17_output_signal, fifo_19_output_signal, fifo_21_output_signal, fifo_23_output_signal, fifo_25_output_signal, fifo_27_output_signal, fifo_29_output_signal, fifo_31_output_signal, fifo_33_output_signal, fifo_35_output_signal, fifo_37_output_signal, fifo_39_output_signal, fifo_41_output_signal, fifo_43_output_signal, fifo_45_output_signal, fifo_47_output_signal, fifo_49_output_signal, fifo_51_output_signal, fifo_53_output_signal, fifo_55_output_signal, fifo_57_output_signal, fifo_59_output_signal, fifo_61_output_signal, fifo_63_output_signal, fifo_65_output_signal, fifo_67_output_signal, fifo_69_output_signal, fifo_71_output_signal, fifo_73_output_signal, fifo_75_output_signal, fifo_77_output_signal, fifo_79_output_signal, fifo_81_output_signal, fifo_83_output_signal, fifo_85_output_signal, fifo_87_output_signal, fifo_89_output_signal, fifo_91_output_signal, fifo_93_output_signal, fifo_95_output_signal, fifo_97_output_signal, fifo_99_output_signal, fifo_101_output_signal, fifo_103_output_signal, fifo_105_output_signal, fifo_107_output_signal, fifo_109_output_signal, fifo_111_output_signal, fifo_113_output_signal, fifo_115_output_signal, fifo_117_output_signal, fifo_119_output_signal, fifo_121_output_signal, fifo_123_output_signal, fifo_125_output_signal, fifo_127_output_signal, mux_select_signal_pl(1), layer_yo_1_pl(0));

    MUX_1: entity work.muxB_64to1 generic map(DATA_WIDTH => (XI_WIDTH))
                               port map(fifo_2_output_signal, fifo_4_output_signal, fifo_6_output_signal, fifo_8_output_signal, fifo_10_output_signal, fifo_12_output_signal, fifo_14_output_signal, fifo_16_output_signal, fifo_18_output_signal, fifo_20_output_signal, fifo_22_output_signal, fifo_24_output_signal, fifo_26_output_signal, fifo_28_output_signal, fifo_30_output_signal, fifo_32_output_signal, fifo_34_output_signal, fifo_36_output_signal, fifo_38_output_signal, fifo_40_output_signal, fifo_42_output_signal, fifo_44_output_signal, fifo_46_output_signal, fifo_48_output_signal, fifo_50_output_signal, fifo_52_output_signal, fifo_54_output_signal, fifo_56_output_signal, fifo_58_output_signal, fifo_60_output_signal, fifo_62_output_signal, fifo_64_output_signal, fifo_66_output_signal, fifo_68_output_signal, fifo_70_output_signal, fifo_72_output_signal, fifo_74_output_signal, fifo_76_output_signal, fifo_78_output_signal, fifo_80_output_signal, fifo_82_output_signal, fifo_84_output_signal, fifo_86_output_signal, fifo_88_output_signal, fifo_90_output_signal, fifo_92_output_signal, fifo_94_output_signal, fifo_96_output_signal, fifo_98_output_signal, fifo_100_output_signal, fifo_102_output_signal, fifo_104_output_signal, fifo_106_output_signal, fifo_108_output_signal, fifo_110_output_signal, fifo_112_output_signal, fifo_114_output_signal, fifo_116_output_signal, fifo_118_output_signal, fifo_120_output_signal, fifo_122_output_signal, fifo_124_output_signal, fifo_126_output_signal, fifo_128_output_signal, mux_select_signal_pl(1), layer_yo_2_pl(0));


    y_valid_pl(0) <= y_valid_signal;
    sel_config_pl(0) <= std_logic_vector(config_out_select_signal);

     state_output: process(clk, reset)
    begin
        if reset = '1' then
            mux_select_signal <= (others => '0');
            config_out_select_signal <= (others => '0');
            fifo_data_counter <= (others => '0');
            state <= AWAIT_THRESHOLD;
            debug_state_signal <= to_unsigned(0, debug_state_signal'length);
            y_valid_signal <= '0';
            fifo_hold_counter <= (others => '0');
            data_next <= '0';
        elsif rising_edge(clk) then
            case state is
                when AWAIT_THRESHOLD =>
                    y_valid_signal <= '0';

                    if fifo_data_counter >= FIFO_START_THR then
                        state <= LOAD_FIRST;
                        debug_state_signal <= to_unsigned(1, debug_state_signal'length);
                        mux_select_signal <= (others => '0');
                        data_next <= '1';
                    else
                        state <= AWAIT_THRESHOLD;
                        debug_state_signal <= to_unsigned(0, debug_state_signal'length);
                        data_next <= '0';
                    end if;

                when LOAD_FIRST =>data_next <= '0';
                    y_valid_signal <= '1';
                    state <= FLUSH_DATA;
                    debug_state_signal <= to_unsigned(2, debug_state_signal'length);

                when FLUSH_DATA =>
                    if fifo_data_counter > 0 and fifo_hold_counter = FIFO_HOLD_CYCLES - 2  then
                        data_next <= '1'; -- Not when the next layer interleaves data! This would be the case when r_in < 1
                    else
                        data_next <= '0';
                    end if;

                    if fifo_hold_counter = to_unsigned(FIFO_HOLD_CYCLES - 1, fifo_hold_counter'length) then
                        fifo_hold_counter <= (others =>'0');
                    else
                        fifo_hold_counter <= fifo_hold_counter + 1;
                    end if;
                    
                        if mux_select_signal = to_unsigned(INPUTS_PER_MUX - 1, mux_select_signal'length) then
                            mux_select_signal <= (others =>'0');
                        else
                            mux_select_signal <= mux_select_signal + 1;
                        end if;

                    if config_out_select_signal = to_unsigned(CONFIGURATIONS - 1, config_out_select_signal'length) then
                        config_out_select_signal <= (others =>'0');
                    else
                        config_out_select_signal <= config_out_select_signal + 1;
                    end if;

                    if data_next = '0' and mux_select_signal = INPUTS_PER_MUX - 1  then
                        state <= AWAIT_THRESHOLD;
                        debug_state_signal <= to_unsigned(0, debug_state_signal'length);
                        y_valid_signal <= '0';
                    else
                        state <= FLUSH_DATA;
                        debug_state_signal <= to_unsigned(2, debug_state_signal'length);
                        y_valid_signal <= '1';
                    end if;

                when others =>
                    data_next <= '0';
                    y_valid_signal <= '0';
            end case;

            if x_is_valid = '0' and data_next = '1' then
                fifo_data_counter <= fifo_data_counter - 1;
            elsif x_is_valid = '1' and data_next = '0' then
                fifo_data_counter <= fifo_data_counter + 1;
            end if;

        end if;
    end process;

    -- Simulation: Raise exception on buffer overflow!
    process(clk)
    begin
        if rising_edge(clk) then
            if fifo_data_counter >= FIFO_SIZE then
                assert false
                report "Interleaving layer conv18_interleaving: FIFO Overflow!"
                severity warning;
            end if;
        end if;
    end process;

    -- Add a pipeline step
    PL_STEP_0_for_y_valid_pl: entity work.Pipe PORT MAP(clk, '1', y_valid_pl(0), y_valid_pl(1));
    PL_STEP_0_for_sel_config_pl: entity work.Pipe_Vector PORT MAP(clk, '1', sel_config_pl(0), sel_config_pl(1));
    PL_STEP_0_for_layer_yo_1_pl: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_1_pl(0), layer_yo_1_pl(1));
    PL_STEP_0_for_layer_yo_2_pl: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_2_pl(0), layer_yo_2_pl(1));
    -- Add a pipeline step
    PL_STEP_1_for_y_valid_pl: entity work.Pipe PORT MAP(clk, '1', y_valid_pl(1), y_valid_pl(2));
    PL_STEP_1_for_sel_config_pl: entity work.Pipe_Vector PORT MAP(clk, '1', sel_config_pl(1), sel_config_pl(2));

    y_valid <= y_valid_pl(2);
    sel_config <= sel_config_pl(2);
    layer_yo_1 <= layer_yo_1_pl(1);
    layer_yo_2 <= layer_yo_2_pl(1);

end Behavioral;