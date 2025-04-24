LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;
use work.conv12_settings.all;

entity conv12 is
    port
    (
        clk   : in std_logic;
        reset : in std_logic;
    
        layer_xi_1    : in std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        layer_xi_2    : in std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        layer_xi_3    : in std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        layer_xi_4    : in std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        x_is_valid    : in std_logic;
        sel_config    : in SEL_CONFIGURATIONS_TYPE;

        y_valid    : out std_logic;
        layer_yo_1 : out std_logic_vector(8-1 downto 0);  --	sfix(4, -4)
        layer_yo_2 : out std_logic_vector(8-1 downto 0);  --	sfix(4, -4)
        layer_yo_3 : out std_logic_vector(8-1 downto 0);  --	sfix(4, -4)
        layer_yo_4 : out std_logic_vector(8-1 downto 0) --	sfix(4, -4)
    ) ;
end conv12;

architecture Behavioral of conv12 is


    attribute KEEP_HIERARCHY : string;
    attribute KEEP_HIERARCHY of conv12 : entity is "yes";

    constant ACCU_PIPELINE_STEPS : natural := 0;
    constant RMCM_PIPELINE_STEPS : natural := 3;
    constant KPU_PIPELINE_STEPS : natural := 0;

    constant BIG_BUFFER_DELAY_COUNTER_MAX : NATURAL := (FEATURE_MAP_SIZE - KERNEL_SIZE + 1) * CONFIGURATIONS - KPU_PIPELINE_STEPS;
    constant SMALL_BUFFER_DELAY_COUNTER_MAX : NATURAL := CONFIGURATIONS - KPU_PIPELINE_STEPS;



    type PIPELINE_TYPE_FOR_LAYER_XI_1_SIGNAL    is array(0 to 2) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_2_SIGNAL    is array(0 to 2) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_3_SIGNAL    is array(0 to 2) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_4_SIGNAL    is array(0 to 2) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_Y_IS_VALID_SIGNAL    is array(0 to 7) of std_logic;
    type PIPELINE_TYPE_FOR_BUFFER_ENABLE_SIGNAL is array(0 to 5) of std_logic;
    type PIPELINE_TYPE_FOR_PAD_1                is array(0 to 2) of std_logic;
    type PIPELINE_TYPE_FOR_PAD_2                is array(0 to 2) of std_logic;
    type PIPELINE_TYPE_FOR_PAD_3                is array(0 to 2) of std_logic;
    type PIPELINE_TYPE_FOR_BIG_BUFFER_DELAY_COUNTER_SIGNAL is array(0 to 1) of std_logic_vector(bits(BIG_BUFFER_DELAY_COUNTER_MAX-1-2)-1 downto 0);
    type PIPELINE_TYPE_FOR_SMALL_BUFFER_DELAY_COUNTER_SIGNAL is array(0 to 1) of std_logic_vector(bits(SMALL_BUFFER_DELAY_COUNTER_MAX-1-2)-1 downto 0);
    type PIPELINE_TYPE_FOR_INTERLEAVE_COUNTER_SIGNAL is array(0 to 2) of std_logic_vector(bits(INTERLEAVINGS-1)-1 downto 0);
    type PIPELINE_TYPE_FOR_RMCM_SELECT_CONFIG_SIGNAL_PL is array(0 to 5) of std_logic_vector(bits(CONFIGURATIONS-1)-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_1 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_2 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_3 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_4 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_5 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_6 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_7 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_8 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_9 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_1_INPUT_1 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_1_INPUT_2 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_1_INPUT_3 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_1_INPUT_4 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_1_INPUT_5 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_1_INPUT_6 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_1_INPUT_7 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_1_INPUT_8 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_1_INPUT_9 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_1_INPUT_1 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_1_INPUT_2 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_1_INPUT_3 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_1_INPUT_4 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_1_INPUT_5 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_1_INPUT_6 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_1_INPUT_7 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_1_INPUT_8 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_1_INPUT_9 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_4_KPU_1_INPUT_1 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_4_KPU_1_INPUT_2 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_4_KPU_1_INPUT_3 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_4_KPU_1_INPUT_4 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_4_KPU_1_INPUT_5 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_4_KPU_1_INPUT_6 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_4_KPU_1_INPUT_7 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_4_KPU_1_INPUT_8 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_4_KPU_1_INPUT_9 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_1   is array(0 to 0) of std_logic_vector(19-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_1   is array(0 to 0) of std_logic_vector(18-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_1   is array(0 to 0) of std_logic_vector(18-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_4_YO_1   is array(0 to 0) of std_logic_vector(18-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_1_PRE       is array(0 to 1) of std_logic_vector(19-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_2_PRE       is array(0 to 1) of std_logic_vector(19-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_3_PRE       is array(0 to 1) of std_logic_vector(19-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_4_PRE       is array(0 to 1) of std_logic_vector(19-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_1_UNCLIPPED is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_2_UNCLIPPED is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_3_UNCLIPPED is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_4_UNCLIPPED is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_1_SIGNAL is array(0 to 1) of std_logic_vector(19-1 downto 0);
    type PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_2_SIGNAL is array(0 to 1) of std_logic_vector(19-1 downto 0);
    type PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_3_SIGNAL is array(0 to 1) of std_logic_vector(19-1 downto 0);
    type PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_4_SIGNAL is array(0 to 1) of std_logic_vector(19-1 downto 0);

    -- All layer outputs
        signal layer_yo_1_signal : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        signal layer_yo_2_signal : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        signal layer_yo_3_signal : std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        signal layer_yo_4_signal : std_logic_vector(8-1 downto 0); --	sfix(4, -4)

    -- All pipelines xi_inputs

    -- ufix(3, -4)
    signal layer_xi_1_signal    : PIPELINE_TYPE_FOR_LAYER_XI_1_SIGNAL;
    -- ufix(3, -4)
    signal layer_xi_2_signal    : PIPELINE_TYPE_FOR_LAYER_XI_2_SIGNAL;
    -- ufix(3, -4)
    signal layer_xi_3_signal    : PIPELINE_TYPE_FOR_LAYER_XI_3_SIGNAL;
    -- ufix(3, -4)
    signal layer_xi_4_signal    : PIPELINE_TYPE_FOR_LAYER_XI_4_SIGNAL;

    -- All internal control signals
    -- Is the current output valid?
    signal y_is_valid_signal    : PIPELINE_TYPE_FOR_Y_IS_VALID_SIGNAL;
    -- Basically x_is_valid but with the padding exception included
    signal buffer_enable_signal : PIPELINE_TYPE_FOR_BUFFER_ENABLE_SIGNAL;

    -- Padding select signals.
    signal pad_1                : PIPELINE_TYPE_FOR_PAD_1;
    -- Padding select signals.
    signal pad_2                : PIPELINE_TYPE_FOR_PAD_2;
    -- Padding select signals.
    signal pad_3                : PIPELINE_TYPE_FOR_PAD_3;
    -- Counter for the LD buffer in the KPUs
    signal big_buffer_delay_counter_signal : PIPELINE_TYPE_FOR_BIG_BUFFER_DELAY_COUNTER_SIGNAL;
    -- Counter for the D buffer in the KPUs
    signal small_buffer_delay_counter_signal : PIPELINE_TYPE_FOR_SMALL_BUFFER_DELAY_COUNTER_SIGNAL;
    -- Counter to track the interleaving process.
    signal interleave_counter_signal : PIPELINE_TYPE_FOR_INTERLEAVE_COUNTER_SIGNAL;
    -- The select signal for the RMCMs.
    signal rmcm_select_config_signal_pl : PIPELINE_TYPE_FOR_RMCM_SELECT_CONFIG_SIGNAL_PL;


    -- All KPU big buffer (line buffer) delays
    -- The one std_logic_vector to delay
    subtype CORE_1_CONCAT_BIG_DELAY_ARRAY_TYPE is std_logic_vector(37-1 downto 0);
    signal core_1_concat_big_undelayed_array : CORE_1_CONCAT_BIG_DELAY_ARRAY_TYPE;
    signal core_1_concat_big_delayed_array : CORE_1_CONCAT_BIG_DELAY_ARRAY_TYPE;

    -- All KPU small buffer delays
    -- The one std_logic_vector to delay
    subtype CORE_1_CONCAT_SMALL_DELAY_ARRAY_TYPE is std_logic_vector(107-1 downto 0);
    signal core_1_concat_small_undelayed_array : CORE_1_CONCAT_SMALL_DELAY_ARRAY_TYPE;
    signal core_1_concat_small_delayed_array : CORE_1_CONCAT_SMALL_DELAY_ARRAY_TYPE;
    -- All KPU big buffer (line buffer) delays
    -- The one std_logic_vector to delay
    subtype CORE_2_CONCAT_BIG_DELAY_ARRAY_TYPE is std_logic_vector(36-1 downto 0);
    signal core_2_concat_big_undelayed_array : CORE_2_CONCAT_BIG_DELAY_ARRAY_TYPE;
    signal core_2_concat_big_delayed_array : CORE_2_CONCAT_BIG_DELAY_ARRAY_TYPE;

    -- All KPU small buffer delays
    -- The one std_logic_vector to delay
    subtype CORE_2_CONCAT_SMALL_DELAY_ARRAY_TYPE is std_logic_vector(104-1 downto 0);
    signal core_2_concat_small_undelayed_array : CORE_2_CONCAT_SMALL_DELAY_ARRAY_TYPE;
    signal core_2_concat_small_delayed_array : CORE_2_CONCAT_SMALL_DELAY_ARRAY_TYPE;
    -- All KPU big buffer (line buffer) delays
    -- The one std_logic_vector to delay
    subtype CORE_3_CONCAT_BIG_DELAY_ARRAY_TYPE is std_logic_vector(36-1 downto 0);
    signal core_3_concat_big_undelayed_array : CORE_3_CONCAT_BIG_DELAY_ARRAY_TYPE;
    signal core_3_concat_big_delayed_array : CORE_3_CONCAT_BIG_DELAY_ARRAY_TYPE;

    -- All KPU small buffer delays
    -- The one std_logic_vector to delay
    subtype CORE_3_CONCAT_SMALL_DELAY_ARRAY_TYPE is std_logic_vector(104-1 downto 0);
    signal core_3_concat_small_undelayed_array : CORE_3_CONCAT_SMALL_DELAY_ARRAY_TYPE;
    signal core_3_concat_small_delayed_array : CORE_3_CONCAT_SMALL_DELAY_ARRAY_TYPE;
    -- All KPU big buffer (line buffer) delays
    -- The one std_logic_vector to delay
    subtype CORE_4_CONCAT_BIG_DELAY_ARRAY_TYPE is std_logic_vector(36-1 downto 0);
    signal core_4_concat_big_undelayed_array : CORE_4_CONCAT_BIG_DELAY_ARRAY_TYPE;
    signal core_4_concat_big_delayed_array : CORE_4_CONCAT_BIG_DELAY_ARRAY_TYPE;

    -- All KPU small buffer delays
    -- The one std_logic_vector to delay
    subtype CORE_4_CONCAT_SMALL_DELAY_ARRAY_TYPE is std_logic_vector(104-1 downto 0);
    signal core_4_concat_small_undelayed_array : CORE_4_CONCAT_SMALL_DELAY_ARRAY_TYPE;
    signal core_4_concat_small_delayed_array : CORE_4_CONCAT_SMALL_DELAY_ARRAY_TYPE;

    -- All KPU inputs

 
    -- sfix(5, -10)
    signal core_1_kpu_1_input_1 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_1;
    -- sfix(5, -10)
    signal core_1_kpu_1_input_2 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_2;
    -- sfix(4, -10)
    signal core_1_kpu_1_input_3 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_3;
    -- sfix(5, -10)
    signal core_1_kpu_1_input_4 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_4;
    -- sfix(5, -10)
    signal core_1_kpu_1_input_5 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_5;
    -- sfix(5, -10)
    signal core_1_kpu_1_input_6 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_6;
    -- sfix(5, -10)
    signal core_1_kpu_1_input_7 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_7;
    -- sfix(5, -10)
    signal core_1_kpu_1_input_8 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_8;
    -- sfix(4, -10)
    signal core_1_kpu_1_input_9 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_9;
 
    -- sfix(5, -10)
    signal core_2_kpu_1_input_1 : PIPELINE_TYPE_FOR_CORE_2_KPU_1_INPUT_1;
    -- sfix(5, -10)
    signal core_2_kpu_1_input_2 : PIPELINE_TYPE_FOR_CORE_2_KPU_1_INPUT_2;
    -- sfix(4, -10)
    signal core_2_kpu_1_input_3 : PIPELINE_TYPE_FOR_CORE_2_KPU_1_INPUT_3;
    -- sfix(5, -10)
    signal core_2_kpu_1_input_4 : PIPELINE_TYPE_FOR_CORE_2_KPU_1_INPUT_4;
    -- sfix(5, -10)
    signal core_2_kpu_1_input_5 : PIPELINE_TYPE_FOR_CORE_2_KPU_1_INPUT_5;
    -- sfix(4, -10)
    signal core_2_kpu_1_input_6 : PIPELINE_TYPE_FOR_CORE_2_KPU_1_INPUT_6;
    -- sfix(4, -10)
    signal core_2_kpu_1_input_7 : PIPELINE_TYPE_FOR_CORE_2_KPU_1_INPUT_7;
    -- sfix(4, -10)
    signal core_2_kpu_1_input_8 : PIPELINE_TYPE_FOR_CORE_2_KPU_1_INPUT_8;
    -- sfix(4, -10)
    signal core_2_kpu_1_input_9 : PIPELINE_TYPE_FOR_CORE_2_KPU_1_INPUT_9;
 
    -- sfix(5, -10)
    signal core_3_kpu_1_input_1 : PIPELINE_TYPE_FOR_CORE_3_KPU_1_INPUT_1;
    -- sfix(5, -10)
    signal core_3_kpu_1_input_2 : PIPELINE_TYPE_FOR_CORE_3_KPU_1_INPUT_2;
    -- sfix(4, -10)
    signal core_3_kpu_1_input_3 : PIPELINE_TYPE_FOR_CORE_3_KPU_1_INPUT_3;
    -- sfix(5, -10)
    signal core_3_kpu_1_input_4 : PIPELINE_TYPE_FOR_CORE_3_KPU_1_INPUT_4;
    -- sfix(5, -10)
    signal core_3_kpu_1_input_5 : PIPELINE_TYPE_FOR_CORE_3_KPU_1_INPUT_5;
    -- sfix(4, -10)
    signal core_3_kpu_1_input_6 : PIPELINE_TYPE_FOR_CORE_3_KPU_1_INPUT_6;
    -- sfix(4, -10)
    signal core_3_kpu_1_input_7 : PIPELINE_TYPE_FOR_CORE_3_KPU_1_INPUT_7;
    -- sfix(4, -10)
    signal core_3_kpu_1_input_8 : PIPELINE_TYPE_FOR_CORE_3_KPU_1_INPUT_8;
    -- sfix(4, -10)
    signal core_3_kpu_1_input_9 : PIPELINE_TYPE_FOR_CORE_3_KPU_1_INPUT_9;
 
    -- sfix(5, -10)
    signal core_4_kpu_1_input_1 : PIPELINE_TYPE_FOR_CORE_4_KPU_1_INPUT_1;
    -- sfix(5, -10)
    signal core_4_kpu_1_input_2 : PIPELINE_TYPE_FOR_CORE_4_KPU_1_INPUT_2;
    -- sfix(4, -10)
    signal core_4_kpu_1_input_3 : PIPELINE_TYPE_FOR_CORE_4_KPU_1_INPUT_3;
    -- sfix(5, -10)
    signal core_4_kpu_1_input_4 : PIPELINE_TYPE_FOR_CORE_4_KPU_1_INPUT_4;
    -- sfix(5, -10)
    signal core_4_kpu_1_input_5 : PIPELINE_TYPE_FOR_CORE_4_KPU_1_INPUT_5;
    -- sfix(4, -10)
    signal core_4_kpu_1_input_6 : PIPELINE_TYPE_FOR_CORE_4_KPU_1_INPUT_6;
    -- sfix(4, -10)
    signal core_4_kpu_1_input_7 : PIPELINE_TYPE_FOR_CORE_4_KPU_1_INPUT_7;
    -- sfix(4, -10)
    signal core_4_kpu_1_input_8 : PIPELINE_TYPE_FOR_CORE_4_KPU_1_INPUT_8;
    -- sfix(4, -10)
    signal core_4_kpu_1_input_9 : PIPELINE_TYPE_FOR_CORE_4_KPU_1_INPUT_9;

    -- All KPU outputs
    -- sfix(9, -10)
    signal signal_core_1_yo_1   : PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_1;
    -- sfix(8, -10)
    signal signal_core_2_yo_1   : PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_1;
    -- sfix(8, -10)
    signal signal_core_3_yo_1   : PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_1;
    -- sfix(8, -10)
    signal signal_core_4_yo_1   : PIPELINE_TYPE_FOR_SIGNAL_CORE_4_YO_1;

    -- All pre layer outputs
    -- sfix(9, -10)
    signal layer_yo_1_pre       : PIPELINE_TYPE_FOR_LAYER_YO_1_PRE;
    -- sfix(9, -10)
    signal layer_yo_2_pre       : PIPELINE_TYPE_FOR_LAYER_YO_2_PRE;
    -- sfix(9, -10)
    signal layer_yo_3_pre       : PIPELINE_TYPE_FOR_LAYER_YO_3_PRE;
    -- sfix(9, -10)
    signal layer_yo_4_pre       : PIPELINE_TYPE_FOR_LAYER_YO_4_PRE;

    -- All layer outputs with one additional msb bit
    -- 
    signal layer_yo_1_unclipped : PIPELINE_TYPE_FOR_LAYER_YO_1_UNCLIPPED;
    -- 
    signal layer_yo_2_unclipped : PIPELINE_TYPE_FOR_LAYER_YO_2_UNCLIPPED;
    -- 
    signal layer_yo_3_unclipped : PIPELINE_TYPE_FOR_LAYER_YO_3_UNCLIPPED;
    -- 
    signal layer_yo_4_unclipped : PIPELINE_TYPE_FOR_LAYER_YO_4_UNCLIPPED;
    -- sfix(9, -10)
    signal bias_add_input_1_signal : PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_1_SIGNAL;
    -- sfix(9, -10)
    signal bias_add_input_2_signal : PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_2_SIGNAL;
    -- sfix(9, -10)
    signal bias_add_input_3_signal : PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_3_SIGNAL;
    -- sfix(9, -10)
    signal bias_add_input_4_signal : PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_4_SIGNAL;



begin

-- "Initialize" stuff

    layer_xi_1_signal(0) <= layer_xi_1;
    layer_xi_2_signal(0) <= layer_xi_2;
    layer_xi_3_signal(0) <= layer_xi_3;
    layer_xi_4_signal(0) <= layer_xi_4;

-- # # # Stage 1: Produce all control signals! # # #
-- # # # IN:  x_is_valid, sel_config
-- # # # OUT: y_is_valid_signal, pad_[3], big_buffer_delay_counter_signal, small_buffer_delay_counter_signal, interleave_counter_signal, buffer_enable_signal

    sliding_window_ctrl : entity work.conv12_SlidingWindowController
        port map
        (
            clk,
            reset,

            x_is_valid,
            rmcm_select_config_signal_pl(0),

            buffer_enable_signal(0),
            y_is_valid_signal(0),
            pad_1(0), pad_2(0), pad_3(0),
            big_buffer_delay_counter_signal(0),
            small_buffer_delay_counter_signal(0),
            interleave_counter_signal(0)
        );

-- # # # Stage 2: Produce all coefficients # # #
-- # # # IN:  layer_xi[4] y_is_valid_signal, pad_[3], big_buffer_delay_counter_signal(0), small_buffer_delay_counter_signal(0), interleave_counter_signal(0)
-- # # # OUT: signal_core_[]_yo_4

-- We have to delay everything except the rmcm_select_config_signal_pl. This is because the weights are loaded from BRAM, and it will take one clock cycle to do so.
-- TODO hey, maybe we can do better? Maybe we can preload the next weights before or something... Ikd...


 -- This is always needed. The sliding window controller forces this.
 -- This is always needed. The sliding window controller forces this.

-- Add a pipeline step
    PL_STEP_0_for_layer_xi_1_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_1_signal(0), layer_xi_1_signal(1));
    PL_STEP_0_for_layer_xi_2_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_2_signal(0), layer_xi_2_signal(1));
    PL_STEP_0_for_layer_xi_3_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_3_signal(0), layer_xi_3_signal(1));
    PL_STEP_0_for_layer_xi_4_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_4_signal(0), layer_xi_4_signal(1)); -- This is always needed. The sliding window controller forces this.
-- Add a pipeline step
    PL_STEP_1_for_layer_xi_1_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_1_signal(1), layer_xi_1_signal(2));
    PL_STEP_1_for_layer_xi_2_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_2_signal(1), layer_xi_2_signal(2));
    PL_STEP_1_for_layer_xi_3_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_3_signal(1), layer_xi_3_signal(2));
    PL_STEP_1_for_layer_xi_4_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_4_signal(1), layer_xi_4_signal(2));
    PL_STEP_0_for_y_is_valid_signal: entity work.Pipe PORT MAP(clk, '1', y_is_valid_signal(0), y_is_valid_signal(1));
    PL_STEP_0_for_buffer_enable_signal: entity work.Pipe PORT MAP(clk, '1', buffer_enable_signal(0), buffer_enable_signal(1));
    PL_STEP_0_for_pad_1: entity work.Pipe PORT MAP(clk, '1', pad_1(0), pad_1(1));
    PL_STEP_0_for_pad_2: entity work.Pipe PORT MAP(clk, '1', pad_2(0), pad_2(1));
    PL_STEP_0_for_pad_3: entity work.Pipe PORT MAP(clk, '1', pad_3(0), pad_3(1)); -- This is always needed. The sliding window controller forces this.

-- Add a pipeline step
    PL_STEP_1_for_pad_1: entity work.Pipe GENERIC MAP(STEPS => RMCM_PIPELINE_STEPS+1) PORT MAP(clk, '1', pad_1(1), pad_1(2));
    PL_STEP_1_for_pad_2: entity work.Pipe GENERIC MAP(STEPS => RMCM_PIPELINE_STEPS+1) PORT MAP(clk, '1', pad_2(1), pad_2(2));
    PL_STEP_1_for_pad_3: entity work.Pipe GENERIC MAP(STEPS => RMCM_PIPELINE_STEPS+1) PORT MAP(clk, '1', pad_3(1), pad_3(2));




-- SAVE THIS SHIT








    conv_core1 : entity work.conv12_core1
        generic map
        (
            PIPELINE_STEPS => RMCM_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,

            layer_xi_1_signal(2),
            rmcm_select_config_signal_pl(0),
            pad_1(2), pad_2(2), pad_3(2), 

    
            core_1_kpu_1_input_1(0) , 
            core_1_kpu_1_input_2(0) , 
            core_1_kpu_1_input_3(0) , 
            core_1_kpu_1_input_4(0) , 
            core_1_kpu_1_input_5(0) , 
            core_1_kpu_1_input_6(0) , 
            core_1_kpu_1_input_7(0) , 
            core_1_kpu_1_input_8(0) , 
            core_1_kpu_1_input_9(0) 
        );

    conv_core2 : entity work.conv12_core2
        generic map
        (
            PIPELINE_STEPS => RMCM_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,

            layer_xi_2_signal(2),
            rmcm_select_config_signal_pl(0),
            pad_1(2), pad_2(2), pad_3(2), 

    
            core_2_kpu_1_input_1(0) , 
            core_2_kpu_1_input_2(0) , 
            core_2_kpu_1_input_3(0) , 
            core_2_kpu_1_input_4(0) , 
            core_2_kpu_1_input_5(0) , 
            core_2_kpu_1_input_6(0) , 
            core_2_kpu_1_input_7(0) , 
            core_2_kpu_1_input_8(0) , 
            core_2_kpu_1_input_9(0) 
        );

    conv_core3 : entity work.conv12_core3
        generic map
        (
            PIPELINE_STEPS => RMCM_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,

            layer_xi_3_signal(2),
            rmcm_select_config_signal_pl(0),
            pad_1(2), pad_2(2), pad_3(2), 

    
            core_3_kpu_1_input_1(0) , 
            core_3_kpu_1_input_2(0) , 
            core_3_kpu_1_input_3(0) , 
            core_3_kpu_1_input_4(0) , 
            core_3_kpu_1_input_5(0) , 
            core_3_kpu_1_input_6(0) , 
            core_3_kpu_1_input_7(0) , 
            core_3_kpu_1_input_8(0) , 
            core_3_kpu_1_input_9(0) 
        );

    conv_core4 : entity work.conv12_core4
        generic map
        (
            PIPELINE_STEPS => RMCM_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,

            layer_xi_4_signal(2),
            rmcm_select_config_signal_pl(0),
            pad_1(2), pad_2(2), pad_3(2), 

    
            core_4_kpu_1_input_1(0) , 
            core_4_kpu_1_input_2(0) , 
            core_4_kpu_1_input_3(0) , 
            core_4_kpu_1_input_4(0) , 
            core_4_kpu_1_input_5(0) , 
            core_4_kpu_1_input_6(0) , 
            core_4_kpu_1_input_7(0) , 
            core_4_kpu_1_input_8(0) , 
            core_4_kpu_1_input_9(0) 
        );

-- # # # Stage 3: Summarize all cores for each kpu_input # # #
-- # # # IN:
-- # # # OUT:

-- TODO Implement this stuff... I have to restructure a little bit... But we save a ton of KPUs with this :D

-- # # # Stage 4: Insert all summarized inputs into the KPUs # # #
-- # # # IN:
-- # # # OUT:

-- Add a pipeline step after the RMCMs
-- TODO The core_[0-9]+_kpu_[0-9]+_input.* signals are pipelined here. But We could use those FDCE registers to connect the padding select signals to the async reset signals!
-- The RMCM takes 2 clock cycles to compute the current output.
-- So we have to delay the other signals by 2
-- Add a pipeline step
    PL_STEP_0_for_rmcm_select_config_signal_pl: entity work.Pipe_Vector PORT MAP(clk, '1', rmcm_select_config_signal_pl(0), rmcm_select_config_signal_pl(1));



-- Add a pipeline step
    PL_STEP_1_for_y_is_valid_signal: entity work.Pipe GENERIC MAP(STEPS => RMCM_PIPELINE_STEPS+1) PORT MAP(clk, '1', y_is_valid_signal(1), y_is_valid_signal(2));
    PL_STEP_1_for_buffer_enable_signal: entity work.Pipe GENERIC MAP(STEPS => RMCM_PIPELINE_STEPS+1) PORT MAP(clk, '1', buffer_enable_signal(1), buffer_enable_signal(2));
    PL_STEP_0_for_big_buffer_delay_counter_signal: entity work.Pipe_Vector GENERIC MAP(STEPS => RMCM_PIPELINE_STEPS+1) PORT MAP(clk, '1', big_buffer_delay_counter_signal(0), big_buffer_delay_counter_signal(1));
    PL_STEP_0_for_small_buffer_delay_counter_signal: entity work.Pipe_Vector GENERIC MAP(STEPS => RMCM_PIPELINE_STEPS+1) PORT MAP(clk, '1', small_buffer_delay_counter_signal(0), small_buffer_delay_counter_signal(1));
    PL_STEP_0_for_interleave_counter_signal: entity work.Pipe_Vector GENERIC MAP(STEPS => RMCM_PIPELINE_STEPS+1) PORT MAP(clk, '1', interleave_counter_signal(0), interleave_counter_signal(1));
    PL_STEP_1_for_rmcm_select_config_signal_pl: entity work.Pipe_Vector GENERIC MAP(STEPS => RMCM_PIPELINE_STEPS+1) PORT MAP(clk, '1', rmcm_select_config_signal_pl(1), rmcm_select_config_signal_pl(2));






  
    -- KPU big buffer delays
    -- Delay the single huge std_logic_vector
    core_1_concat_big_delay: entity work.BufferedDelay GENERIC MAP(WL => core_1_concat_big_undelayed_array'length, BL => BIG_BUFFER_DELAY_COUNTER_MAX )
        PORT MAP(reset, clk, buffer_enable_signal(2), big_buffer_delay_counter_signal(1), core_1_concat_big_undelayed_array, core_1_concat_big_delayed_array);


    -- KPU small buffer delays
    -- Delay the single huge std_logic_vector
    core_1_concat_small_delay: entity work.BufferedDelay GENERIC MAP(WL => core_1_concat_small_undelayed_array'length, BL => SMALL_BUFFER_DELAY_COUNTER_MAX )
        PORT MAP(reset, clk, buffer_enable_signal(2), small_buffer_delay_counter_signal(1), core_1_concat_small_undelayed_array, core_1_concat_small_delayed_array);
  

  
    core_1_KPU_1 : entity work.conv12_core1_KPU1
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_1_kpu_1_input_1(0), --	sfix(5, -10)
            core_1_kpu_1_input_2(0), --	sfix(5, -10)
            core_1_kpu_1_input_3(0), --	sfix(4, -10)
            core_1_kpu_1_input_4(0), --	sfix(5, -10)
            core_1_kpu_1_input_5(0), --	sfix(5, -10)
            core_1_kpu_1_input_6(0), --	sfix(5, -10)
            core_1_kpu_1_input_7(0), --	sfix(5, -10)
            core_1_kpu_1_input_8(0), --	sfix(5, -10)
            core_1_kpu_1_input_9(0), --	sfix(4, -10)

        
            core_1_concat_big_undelayed_array(18-1 downto 0),
            core_1_concat_big_delayed_array(18-1 downto 0),
            core_1_concat_big_undelayed_array(37-1 downto 18),
            core_1_concat_big_delayed_array(37-1 downto 18),

        
            core_1_concat_small_undelayed_array(15-1 downto 0),
            core_1_concat_small_delayed_array(15-1 downto 0),
            core_1_concat_small_undelayed_array(32-1 downto 15),
            core_1_concat_small_delayed_array(32-1 downto 15),
            core_1_concat_small_undelayed_array(50-1 downto 32),
            core_1_concat_small_delayed_array(50-1 downto 32),
            core_1_concat_small_undelayed_array(69-1 downto 50),
            core_1_concat_small_delayed_array(69-1 downto 50),
            core_1_concat_small_undelayed_array(88-1 downto 69),
            core_1_concat_small_delayed_array(88-1 downto 69),
            core_1_concat_small_undelayed_array(107-1 downto 88),
            core_1_concat_small_delayed_array(107-1 downto 88),

            -- like this: yo_1
            signal_core_1_yo_1(0)
        );
  
    -- KPU big buffer delays
    -- Delay the single huge std_logic_vector
    core_2_concat_big_delay: entity work.BufferedDelay GENERIC MAP(WL => core_2_concat_big_undelayed_array'length, BL => BIG_BUFFER_DELAY_COUNTER_MAX )
        PORT MAP(reset, clk, buffer_enable_signal(2), big_buffer_delay_counter_signal(1), core_2_concat_big_undelayed_array, core_2_concat_big_delayed_array);


    -- KPU small buffer delays
    -- Delay the single huge std_logic_vector
    core_2_concat_small_delay: entity work.BufferedDelay GENERIC MAP(WL => core_2_concat_small_undelayed_array'length, BL => SMALL_BUFFER_DELAY_COUNTER_MAX )
        PORT MAP(reset, clk, buffer_enable_signal(2), small_buffer_delay_counter_signal(1), core_2_concat_small_undelayed_array, core_2_concat_small_delayed_array);
  

  
    core_2_KPU_1 : entity work.conv12_core2_KPU1
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_2_kpu_1_input_1(0), --	sfix(5, -10)
            core_2_kpu_1_input_2(0), --	sfix(5, -10)
            core_2_kpu_1_input_3(0), --	sfix(4, -10)
            core_2_kpu_1_input_4(0), --	sfix(5, -10)
            core_2_kpu_1_input_5(0), --	sfix(5, -10)
            core_2_kpu_1_input_6(0), --	sfix(4, -10)
            core_2_kpu_1_input_7(0), --	sfix(4, -10)
            core_2_kpu_1_input_8(0), --	sfix(4, -10)
            core_2_kpu_1_input_9(0), --	sfix(4, -10)

        
            core_2_concat_big_undelayed_array(18-1 downto 0),
            core_2_concat_big_delayed_array(18-1 downto 0),
            core_2_concat_big_undelayed_array(36-1 downto 18),
            core_2_concat_big_delayed_array(36-1 downto 18),

        
            core_2_concat_small_undelayed_array(15-1 downto 0),
            core_2_concat_small_delayed_array(15-1 downto 0),
            core_2_concat_small_undelayed_array(32-1 downto 15),
            core_2_concat_small_delayed_array(32-1 downto 15),
            core_2_concat_small_undelayed_array(50-1 downto 32),
            core_2_concat_small_delayed_array(50-1 downto 32),
            core_2_concat_small_undelayed_array(68-1 downto 50),
            core_2_concat_small_delayed_array(68-1 downto 50),
            core_2_concat_small_undelayed_array(86-1 downto 68),
            core_2_concat_small_delayed_array(86-1 downto 68),
            core_2_concat_small_undelayed_array(104-1 downto 86),
            core_2_concat_small_delayed_array(104-1 downto 86),

            -- like this: yo_1
            signal_core_2_yo_1(0)
        );
  
    -- KPU big buffer delays
    -- Delay the single huge std_logic_vector
    core_3_concat_big_delay: entity work.BufferedDelay GENERIC MAP(WL => core_3_concat_big_undelayed_array'length, BL => BIG_BUFFER_DELAY_COUNTER_MAX )
        PORT MAP(reset, clk, buffer_enable_signal(2), big_buffer_delay_counter_signal(1), core_3_concat_big_undelayed_array, core_3_concat_big_delayed_array);


    -- KPU small buffer delays
    -- Delay the single huge std_logic_vector
    core_3_concat_small_delay: entity work.BufferedDelay GENERIC MAP(WL => core_3_concat_small_undelayed_array'length, BL => SMALL_BUFFER_DELAY_COUNTER_MAX )
        PORT MAP(reset, clk, buffer_enable_signal(2), small_buffer_delay_counter_signal(1), core_3_concat_small_undelayed_array, core_3_concat_small_delayed_array);
  

  
    core_3_KPU_1 : entity work.conv12_core3_KPU1
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_3_kpu_1_input_1(0), --	sfix(5, -10)
            core_3_kpu_1_input_2(0), --	sfix(5, -10)
            core_3_kpu_1_input_3(0), --	sfix(4, -10)
            core_3_kpu_1_input_4(0), --	sfix(5, -10)
            core_3_kpu_1_input_5(0), --	sfix(5, -10)
            core_3_kpu_1_input_6(0), --	sfix(4, -10)
            core_3_kpu_1_input_7(0), --	sfix(4, -10)
            core_3_kpu_1_input_8(0), --	sfix(4, -10)
            core_3_kpu_1_input_9(0), --	sfix(4, -10)

        
            core_3_concat_big_undelayed_array(18-1 downto 0),
            core_3_concat_big_delayed_array(18-1 downto 0),
            core_3_concat_big_undelayed_array(36-1 downto 18),
            core_3_concat_big_delayed_array(36-1 downto 18),

        
            core_3_concat_small_undelayed_array(15-1 downto 0),
            core_3_concat_small_delayed_array(15-1 downto 0),
            core_3_concat_small_undelayed_array(32-1 downto 15),
            core_3_concat_small_delayed_array(32-1 downto 15),
            core_3_concat_small_undelayed_array(50-1 downto 32),
            core_3_concat_small_delayed_array(50-1 downto 32),
            core_3_concat_small_undelayed_array(68-1 downto 50),
            core_3_concat_small_delayed_array(68-1 downto 50),
            core_3_concat_small_undelayed_array(86-1 downto 68),
            core_3_concat_small_delayed_array(86-1 downto 68),
            core_3_concat_small_undelayed_array(104-1 downto 86),
            core_3_concat_small_delayed_array(104-1 downto 86),

            -- like this: yo_1
            signal_core_3_yo_1(0)
        );
  
    -- KPU big buffer delays
    -- Delay the single huge std_logic_vector
    core_4_concat_big_delay: entity work.BufferedDelay GENERIC MAP(WL => core_4_concat_big_undelayed_array'length, BL => BIG_BUFFER_DELAY_COUNTER_MAX )
        PORT MAP(reset, clk, buffer_enable_signal(2), big_buffer_delay_counter_signal(1), core_4_concat_big_undelayed_array, core_4_concat_big_delayed_array);


    -- KPU small buffer delays
    -- Delay the single huge std_logic_vector
    core_4_concat_small_delay: entity work.BufferedDelay GENERIC MAP(WL => core_4_concat_small_undelayed_array'length, BL => SMALL_BUFFER_DELAY_COUNTER_MAX )
        PORT MAP(reset, clk, buffer_enable_signal(2), small_buffer_delay_counter_signal(1), core_4_concat_small_undelayed_array, core_4_concat_small_delayed_array);
  

  
    core_4_KPU_1 : entity work.conv12_core4_KPU1
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_4_kpu_1_input_1(0), --	sfix(5, -10)
            core_4_kpu_1_input_2(0), --	sfix(5, -10)
            core_4_kpu_1_input_3(0), --	sfix(4, -10)
            core_4_kpu_1_input_4(0), --	sfix(5, -10)
            core_4_kpu_1_input_5(0), --	sfix(5, -10)
            core_4_kpu_1_input_6(0), --	sfix(4, -10)
            core_4_kpu_1_input_7(0), --	sfix(4, -10)
            core_4_kpu_1_input_8(0), --	sfix(4, -10)
            core_4_kpu_1_input_9(0), --	sfix(4, -10)

        
            core_4_concat_big_undelayed_array(18-1 downto 0),
            core_4_concat_big_delayed_array(18-1 downto 0),
            core_4_concat_big_undelayed_array(36-1 downto 18),
            core_4_concat_big_delayed_array(36-1 downto 18),

        
            core_4_concat_small_undelayed_array(15-1 downto 0),
            core_4_concat_small_delayed_array(15-1 downto 0),
            core_4_concat_small_undelayed_array(32-1 downto 15),
            core_4_concat_small_delayed_array(32-1 downto 15),
            core_4_concat_small_undelayed_array(50-1 downto 32),
            core_4_concat_small_delayed_array(50-1 downto 32),
            core_4_concat_small_undelayed_array(68-1 downto 50),
            core_4_concat_small_delayed_array(68-1 downto 50),
            core_4_concat_small_undelayed_array(86-1 downto 68),
            core_4_concat_small_delayed_array(86-1 downto 68),
            core_4_concat_small_undelayed_array(104-1 downto 86),
            core_4_concat_small_delayed_array(104-1 downto 86),

            -- like this: yo_1
            signal_core_4_yo_1(0)
        );

-- # # # Stage 3 (if classical conv): Accumulate KPU outputs # # #
-- # # # IN:  signal_core_[]_yo_4
-- # # # OUT: bias_add_input_[1]_signal

-- Add a pipeline step after the KPUs

-- Add a pipeline step
    PL_STEP_2_for_y_is_valid_signal: entity work.Pipe GENERIC MAP(STEPS => KPU_PIPELINE_STEPS) PORT MAP(clk, '1', y_is_valid_signal(2), y_is_valid_signal(3));
    PL_STEP_2_for_buffer_enable_signal: entity work.Pipe GENERIC MAP(STEPS => KPU_PIPELINE_STEPS) PORT MAP(clk, '1', buffer_enable_signal(2), buffer_enable_signal(3));
    PL_STEP_1_for_interleave_counter_signal: entity work.Pipe_Vector GENERIC MAP(STEPS => KPU_PIPELINE_STEPS) PORT MAP(clk, '1', interleave_counter_signal(1), interleave_counter_signal(2));
    PL_STEP_2_for_rmcm_select_config_signal_pl: entity work.Pipe_Vector GENERIC MAP(STEPS => KPU_PIPELINE_STEPS) PORT MAP(clk, '1', rmcm_select_config_signal_pl(2), rmcm_select_config_signal_pl(3));


-- Reshape all the outputs, so they are all the same shape
    Reshape_for_core_1_output_1: entity work.FxPReshape
        generic map (
            XI_MSB => 9, XI_LSB => -10,
            YO_MSB => 9, YO_LSB => -10 )
        port map ( signal_core_1_yo_1(0), bias_add_input_1_signal(0) );
    
    Reshape_for_core_2_output_1: entity work.FxPReshape
        generic map (
            XI_MSB => 8, XI_LSB => -10,
            YO_MSB => 9, YO_LSB => -10 )
        port map ( signal_core_2_yo_1(0), bias_add_input_2_signal(0) );
    
    Reshape_for_core_3_output_1: entity work.FxPReshape
        generic map (
            XI_MSB => 8, XI_LSB => -10,
            YO_MSB => 9, YO_LSB => -10 )
        port map ( signal_core_3_yo_1(0), bias_add_input_3_signal(0) );
    
    Reshape_for_core_4_output_1: entity work.FxPReshape
        generic map (
            XI_MSB => 8, XI_LSB => -10,
            YO_MSB => 9, YO_LSB => -10 )
        port map ( signal_core_4_yo_1(0), bias_add_input_4_signal(0) );
    

-- # # # Stage 4 (optional): Add the bias # # #
-- # # # IN:  bias_add_input_[1]_signal
-- # # # OUT: layer_yo_[4]_pre

-- Delay the signals because of the pipelined accumulator.
-- Add a pipeline step
    PL_STEP_3_for_y_is_valid_signal: entity work.Pipe GENERIC MAP(STEPS => ACCU_PIPELINE_STEPS) PORT MAP(clk, '1', y_is_valid_signal(3), y_is_valid_signal(4));
    PL_STEP_3_for_buffer_enable_signal: entity work.Pipe GENERIC MAP(STEPS => ACCU_PIPELINE_STEPS) PORT MAP(clk, '1', buffer_enable_signal(3), buffer_enable_signal(4));
    PL_STEP_3_for_rmcm_select_config_signal_pl: entity work.Pipe_Vector GENERIC MAP(STEPS => ACCU_PIPELINE_STEPS) PORT MAP(clk, '1', rmcm_select_config_signal_pl(3), rmcm_select_config_signal_pl(4));


-- Add a pipeline step after the accumulator
     -- This is always needed. The rom memory enforces this.
    -- Add a pipeline step
    PL_STEP_4_for_y_is_valid_signal: entity work.Pipe PORT MAP(clk, '1', y_is_valid_signal(4), y_is_valid_signal(5));
    PL_STEP_4_for_buffer_enable_signal: entity work.Pipe PORT MAP(clk, '1', buffer_enable_signal(4), buffer_enable_signal(5));
    PL_STEP_4_for_rmcm_select_config_signal_pl: entity work.Pipe_Vector PORT MAP(clk, '1', rmcm_select_config_signal_pl(4), rmcm_select_config_signal_pl(5));
    PL_STEP_0_for_bias_add_input_1_signal: entity work.Pipe_Vector PORT MAP(clk, '1', bias_add_input_1_signal(0), bias_add_input_1_signal(1));
    PL_STEP_0_for_bias_add_input_2_signal: entity work.Pipe_Vector PORT MAP(clk, '1', bias_add_input_2_signal(0), bias_add_input_2_signal(1));
    PL_STEP_0_for_bias_add_input_3_signal: entity work.Pipe_Vector PORT MAP(clk, '1', bias_add_input_3_signal(0), bias_add_input_3_signal(1));
    PL_STEP_0_for_bias_add_input_4_signal: entity work.Pipe_Vector PORT MAP(clk, '1', bias_add_input_4_signal(0), bias_add_input_4_signal(1));

    bias_add : entity work.conv12_bias_add
        Port map (
            clk,
            buffer_enable_signal(5),
        
            rmcm_select_config_signal_pl(5),
        
            bias_add_input_1_signal(1),
            bias_add_input_2_signal(1),
            bias_add_input_3_signal(1),
            bias_add_input_4_signal(1),
        
            layer_yo_1_pre(0) , 
            layer_yo_2_pre(0) , 
            layer_yo_3_pre(0) , 
            layer_yo_4_pre(0) 
        );


    -- Add a pipeline step
    PL_STEP_5_for_y_is_valid_signal: entity work.Pipe GENERIC MAP(STEPS => 0) PORT MAP(clk, '1', y_is_valid_signal(5), y_is_valid_signal(6));


-- # # # Stage 5 (optional): Clip msbs if the real input sample says so # # #
-- # # # IN:  layer_yo_[4]_pre
-- # # # OUT: layer_yo_[4]

-- Add a pipeline step after the bias add / the accumulator
-- Add a pipeline step
    PL_STEP_6_for_y_is_valid_signal: entity work.Pipe PORT MAP(clk, '1', y_is_valid_signal(6), y_is_valid_signal(7));
    PL_STEP_0_for_layer_yo_1_pre: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_1_pre(0), layer_yo_1_pre(1));
    PL_STEP_0_for_layer_yo_2_pre: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_2_pre(0), layer_yo_2_pre(1));
    PL_STEP_0_for_layer_yo_3_pre: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_3_pre(0), layer_yo_3_pre(1));
    PL_STEP_0_for_layer_yo_4_pre: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_4_pre(0), layer_yo_4_pre(1));


    layer_yo_1_unclipped(0) <= layer_yo_1_pre(1)(layer_yo_1_pre(1)'length-1 downto layer_yo_1_pre(1)'length - layer_yo_1_unclipped(0)'length);
  
    layer_yo_2_unclipped(0) <= layer_yo_2_pre(1)(layer_yo_2_pre(1)'length-1 downto layer_yo_2_pre(1)'length - layer_yo_2_unclipped(0)'length);
  
    layer_yo_3_unclipped(0) <= layer_yo_3_pre(1)(layer_yo_3_pre(1)'length-1 downto layer_yo_3_pre(1)'length - layer_yo_3_unclipped(0)'length);
  
    layer_yo_4_unclipped(0) <= layer_yo_4_pre(1)(layer_yo_4_pre(1)'length-1 downto layer_yo_4_pre(1)'length - layer_yo_4_unclipped(0)'length);
  
    clip_max_1: entity work.ClipTruncation
        generic map (
            MIN_VALUE => -(2**(layer_yo_1'length-1)),
            MAX_VALUE => (2**(layer_yo_1'length-1))-1
        )
        Port map (
            layer_yo_1_unclipped(0),
            layer_yo_1_signal
        );
  
    clip_max_2: entity work.ClipTruncation
        generic map (
            MIN_VALUE => -(2**(layer_yo_2'length-1)),
            MAX_VALUE => (2**(layer_yo_2'length-1))-1
        )
        Port map (
            layer_yo_2_unclipped(0),
            layer_yo_2_signal
        );
  
    clip_max_3: entity work.ClipTruncation
        generic map (
            MIN_VALUE => -(2**(layer_yo_3'length-1)),
            MAX_VALUE => (2**(layer_yo_3'length-1))-1
        )
        Port map (
            layer_yo_3_unclipped(0),
            layer_yo_3_signal
        );
  
    clip_max_4: entity work.ClipTruncation
        generic map (
            MIN_VALUE => -(2**(layer_yo_4'length-1)),
            MAX_VALUE => (2**(layer_yo_4'length-1))-1
        )
        Port map (
            layer_yo_4_unclipped(0),
            layer_yo_4_signal
        );
  
    layer_yo_1 <= layer_yo_1_signal; --	sfix(4, -4)
    layer_yo_2 <= layer_yo_2_signal; --	sfix(4, -4)
    layer_yo_3 <= layer_yo_3_signal; --	sfix(4, -4)
    layer_yo_4 <= layer_yo_4_signal; --	sfix(4, -4)

    y_valid <= y_is_valid_signal(7);

    -- FOR DEBUGGING: When producing a valid output -> Check if the output is correct with the TF simulation!
    simulation_validation: entity work.conv12_sim_validator
        Port map (
            clk,
            reset,
            layer_xi_1, --	ufix(3, -4)
            layer_xi_2, --	ufix(3, -4)
            layer_xi_3, --	ufix(3, -4)
            layer_xi_4, --	ufix(3, -4)
            x_is_valid,
            layer_yo_1_signal, --	sfix(4, -4)
            layer_yo_2_signal, --	sfix(4, -4)
            layer_yo_3_signal, --	sfix(4, -4)
            layer_yo_4_signal, --	sfix(4, -4)
            y_is_valid_signal(7)
        );

end Behavioral;