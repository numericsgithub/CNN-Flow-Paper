LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;
use work.poolavg_settings.all;

entity poolavg is
    port
    (
        clk   : in std_logic;
        reset : in std_logic;
    
        layer_xi_1    : in std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        x_is_valid    : in std_logic;
        sel_config    : in SEL_CONFIGURATIONS_TYPE;

        y_valid    : out std_logic;
        layer_yo_1 : out std_logic_vector(9-1 downto 0) --	sfix(4, -5)
    ) ;
end poolavg;

architecture Behavioral of poolavg is


    attribute KEEP_HIERARCHY : string;
    attribute KEEP_HIERARCHY of poolavg : entity is "yes";

    constant ACCU_PIPELINE_STEPS : natural := 0;
    constant RMCM_PIPELINE_STEPS : natural := 3;
    constant KPU_PIPELINE_STEPS : natural := 0;

    constant BIG_BUFFER_DELAY_COUNTER_MAX : NATURAL := (FEATURE_MAP_SIZE - KERNEL_SIZE + 1) * CONFIGURATIONS - KPU_PIPELINE_STEPS;
    constant SMALL_BUFFER_DELAY_COUNTER_MAX : NATURAL := CONFIGURATIONS - KPU_PIPELINE_STEPS;



    type PIPELINE_TYPE_FOR_LAYER_XI_1_SIGNAL    is array(0 to 2) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_Y_IS_VALID_SIGNAL    is array(0 to 5) of std_logic;
    type PIPELINE_TYPE_FOR_BUFFER_ENABLE_SIGNAL is array(0 to 4) of std_logic;
    type PIPELINE_TYPE_FOR_PAD_1                is array(0 to 2) of std_logic;
    type PIPELINE_TYPE_FOR_PAD_2                is array(0 to 2) of std_logic;
    type PIPELINE_TYPE_FOR_PAD_3                is array(0 to 2) of std_logic;
    type PIPELINE_TYPE_FOR_PAD_4                is array(0 to 2) of std_logic;
    type PIPELINE_TYPE_FOR_PAD_5                is array(0 to 2) of std_logic;
    type PIPELINE_TYPE_FOR_PAD_6                is array(0 to 2) of std_logic;
    type PIPELINE_TYPE_FOR_PAD_7                is array(0 to 2) of std_logic;
    type PIPELINE_TYPE_FOR_BIG_BUFFER_DELAY_COUNTER_SIGNAL is array(0 to 1) of std_logic_vector(bits(BIG_BUFFER_DELAY_COUNTER_MAX-1-2)-1 downto 0);
    type PIPELINE_TYPE_FOR_SMALL_BUFFER_DELAY_COUNTER_SIGNAL is array(0 to 1) of std_logic_vector(bits(SMALL_BUFFER_DELAY_COUNTER_MAX-1-2)-1 downto 0);
    type PIPELINE_TYPE_FOR_INTERLEAVE_COUNTER_SIGNAL is array(0 to 2) of std_logic_vector(bits(INTERLEAVINGS-1)-1 downto 0);
    type PIPELINE_TYPE_FOR_RMCM_SELECT_CONFIG_SIGNAL_PL is array(0 to 4) of std_logic_vector(bits(CONFIGURATIONS-1)-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_1 is array(0 to 0) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_2 is array(0 to 0) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_3 is array(0 to 0) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_4 is array(0 to 0) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_5 is array(0 to 0) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_6 is array(0 to 0) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_7 is array(0 to 0) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_8 is array(0 to 0) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_9 is array(0 to 0) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_10 is array(0 to 0) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_11 is array(0 to 0) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_12 is array(0 to 0) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_13 is array(0 to 0) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_14 is array(0 to 0) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_15 is array(0 to 0) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_16 is array(0 to 0) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_17 is array(0 to 0) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_18 is array(0 to 0) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_19 is array(0 to 0) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_20 is array(0 to 0) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_21 is array(0 to 0) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_22 is array(0 to 0) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_23 is array(0 to 0) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_24 is array(0 to 0) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_25 is array(0 to 0) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_26 is array(0 to 0) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_27 is array(0 to 0) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_28 is array(0 to 0) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_29 is array(0 to 0) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_30 is array(0 to 0) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_31 is array(0 to 0) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_32 is array(0 to 0) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_33 is array(0 to 0) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_34 is array(0 to 0) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_35 is array(0 to 0) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_36 is array(0 to 0) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_37 is array(0 to 0) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_38 is array(0 to 0) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_39 is array(0 to 0) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_40 is array(0 to 0) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_41 is array(0 to 0) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_42 is array(0 to 0) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_43 is array(0 to 0) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_44 is array(0 to 0) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_45 is array(0 to 0) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_46 is array(0 to 0) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_47 is array(0 to 0) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_48 is array(0 to 0) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_49 is array(0 to 0) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_1   is array(0 to 0) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_1_PRE       is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_1_UNCLIPPED is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_1_SIGNAL is array(0 to 0) of std_logic_vector(22-1 downto 0);

    -- All layer outputs
        signal layer_yo_1_signal : std_logic_vector(9-1 downto 0); --	sfix(4, -5)

    -- All pipelines xi_inputs

    -- ufix(5, -2)
    signal layer_xi_1_signal    : PIPELINE_TYPE_FOR_LAYER_XI_1_SIGNAL;

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
    -- Padding select signals.
    signal pad_4                : PIPELINE_TYPE_FOR_PAD_4;
    -- Padding select signals.
    signal pad_5                : PIPELINE_TYPE_FOR_PAD_5;
    -- Padding select signals.
    signal pad_6                : PIPELINE_TYPE_FOR_PAD_6;
    -- Padding select signals.
    signal pad_7                : PIPELINE_TYPE_FOR_PAD_7;
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
    subtype CORE_1_CONCAT_BIG_DELAY_ARRAY_TYPE is std_logic_vector(130-1 downto 0);
    signal core_1_concat_big_undelayed_array : CORE_1_CONCAT_BIG_DELAY_ARRAY_TYPE;
    signal core_1_concat_big_delayed_array : CORE_1_CONCAT_BIG_DELAY_ARRAY_TYPE;

    -- All KPU small buffer delays
    -- The one std_logic_vector to delay
    subtype CORE_1_CONCAT_SMALL_DELAY_ARRAY_TYPE is std_logic_vector(898-1 downto 0);
    signal core_1_concat_small_undelayed_array : CORE_1_CONCAT_SMALL_DELAY_ARRAY_TYPE;
    signal core_1_concat_small_delayed_array : CORE_1_CONCAT_SMALL_DELAY_ARRAY_TYPE;

    -- All KPU inputs

 
    -- sfix(1, -15)
    signal core_1_kpu_1_input_1 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_1;
    -- sfix(1, -15)
    signal core_1_kpu_1_input_2 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_2;
    -- sfix(1, -15)
    signal core_1_kpu_1_input_3 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_3;
    -- sfix(1, -15)
    signal core_1_kpu_1_input_4 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_4;
    -- sfix(1, -15)
    signal core_1_kpu_1_input_5 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_5;
    -- sfix(1, -15)
    signal core_1_kpu_1_input_6 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_6;
    -- sfix(1, -15)
    signal core_1_kpu_1_input_7 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_7;
    -- sfix(1, -15)
    signal core_1_kpu_1_input_8 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_8;
    -- sfix(1, -15)
    signal core_1_kpu_1_input_9 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_9;
    -- sfix(1, -15)
    signal core_1_kpu_1_input_10 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_10;
    -- sfix(1, -15)
    signal core_1_kpu_1_input_11 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_11;
    -- sfix(1, -15)
    signal core_1_kpu_1_input_12 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_12;
    -- sfix(1, -15)
    signal core_1_kpu_1_input_13 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_13;
    -- sfix(1, -15)
    signal core_1_kpu_1_input_14 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_14;
    -- sfix(1, -15)
    signal core_1_kpu_1_input_15 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_15;
    -- sfix(1, -15)
    signal core_1_kpu_1_input_16 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_16;
    -- sfix(1, -15)
    signal core_1_kpu_1_input_17 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_17;
    -- sfix(1, -15)
    signal core_1_kpu_1_input_18 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_18;
    -- sfix(1, -15)
    signal core_1_kpu_1_input_19 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_19;
    -- sfix(1, -15)
    signal core_1_kpu_1_input_20 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_20;
    -- sfix(1, -15)
    signal core_1_kpu_1_input_21 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_21;
    -- sfix(1, -15)
    signal core_1_kpu_1_input_22 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_22;
    -- sfix(1, -15)
    signal core_1_kpu_1_input_23 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_23;
    -- sfix(1, -15)
    signal core_1_kpu_1_input_24 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_24;
    -- sfix(1, -15)
    signal core_1_kpu_1_input_25 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_25;
    -- sfix(1, -15)
    signal core_1_kpu_1_input_26 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_26;
    -- sfix(1, -15)
    signal core_1_kpu_1_input_27 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_27;
    -- sfix(1, -15)
    signal core_1_kpu_1_input_28 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_28;
    -- sfix(1, -15)
    signal core_1_kpu_1_input_29 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_29;
    -- sfix(1, -15)
    signal core_1_kpu_1_input_30 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_30;
    -- sfix(1, -15)
    signal core_1_kpu_1_input_31 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_31;
    -- sfix(1, -15)
    signal core_1_kpu_1_input_32 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_32;
    -- sfix(1, -15)
    signal core_1_kpu_1_input_33 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_33;
    -- sfix(1, -15)
    signal core_1_kpu_1_input_34 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_34;
    -- sfix(1, -15)
    signal core_1_kpu_1_input_35 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_35;
    -- sfix(1, -15)
    signal core_1_kpu_1_input_36 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_36;
    -- sfix(1, -15)
    signal core_1_kpu_1_input_37 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_37;
    -- sfix(1, -15)
    signal core_1_kpu_1_input_38 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_38;
    -- sfix(1, -15)
    signal core_1_kpu_1_input_39 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_39;
    -- sfix(1, -15)
    signal core_1_kpu_1_input_40 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_40;
    -- sfix(1, -15)
    signal core_1_kpu_1_input_41 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_41;
    -- sfix(1, -15)
    signal core_1_kpu_1_input_42 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_42;
    -- sfix(1, -15)
    signal core_1_kpu_1_input_43 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_43;
    -- sfix(1, -15)
    signal core_1_kpu_1_input_44 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_44;
    -- sfix(1, -15)
    signal core_1_kpu_1_input_45 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_45;
    -- sfix(1, -15)
    signal core_1_kpu_1_input_46 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_46;
    -- sfix(1, -15)
    signal core_1_kpu_1_input_47 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_47;
    -- sfix(1, -15)
    signal core_1_kpu_1_input_48 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_48;
    -- sfix(1, -15)
    signal core_1_kpu_1_input_49 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_49;

    -- All KPU outputs
    -- sfix(7, -15)
    signal signal_core_1_yo_1   : PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_1;

    -- All pre layer outputs
    -- sfix(7, -15)
    signal layer_yo_1_pre       : PIPELINE_TYPE_FOR_LAYER_YO_1_PRE;

    -- All layer outputs with one additional msb bit
    -- 
    signal layer_yo_1_unclipped : PIPELINE_TYPE_FOR_LAYER_YO_1_UNCLIPPED;
    -- sfix(7, -15)
    signal bias_add_input_1_signal : PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_1_SIGNAL;



begin

-- "Initialize" stuff

    layer_xi_1_signal(0) <= layer_xi_1;

-- # # # Stage 1: Produce all control signals! # # #
-- # # # IN:  x_is_valid, sel_config
-- # # # OUT: y_is_valid_signal, pad_[7], big_buffer_delay_counter_signal, small_buffer_delay_counter_signal, interleave_counter_signal, buffer_enable_signal

    sliding_window_ctrl : entity work.poolavg_SlidingWindowController
        port map
        (
            clk,
            reset,

            x_is_valid,
            rmcm_select_config_signal_pl(0),

            buffer_enable_signal(0),
            y_is_valid_signal(0),
            pad_1(0), pad_2(0), pad_3(0), pad_4(0), pad_5(0), pad_6(0), pad_7(0),
            big_buffer_delay_counter_signal(0),
            small_buffer_delay_counter_signal(0),
            interleave_counter_signal(0)
        );

-- # # # Stage 2: Produce all coefficients # # #
-- # # # IN:  layer_xi[1] y_is_valid_signal, pad_[7], big_buffer_delay_counter_signal(0), small_buffer_delay_counter_signal(0), interleave_counter_signal(0)
-- # # # OUT: signal_core_[]_yo_1

-- We have to delay everything except the rmcm_select_config_signal_pl. This is because the weights are loaded from BRAM, and it will take one clock cycle to do so.
-- TODO hey, maybe we can do better? Maybe we can preload the next weights before or something... Ikd...


 -- This is always needed. The sliding window controller forces this.
 -- This is always needed. The sliding window controller forces this.

-- Add a pipeline step
    PL_STEP_0_for_layer_xi_1_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_1_signal(0), layer_xi_1_signal(1)); -- This is always needed. The sliding window controller forces this.
-- Add a pipeline step
    PL_STEP_1_for_layer_xi_1_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_1_signal(1), layer_xi_1_signal(2));
    PL_STEP_0_for_y_is_valid_signal: entity work.Pipe PORT MAP(clk, '1', y_is_valid_signal(0), y_is_valid_signal(1));
    PL_STEP_0_for_buffer_enable_signal: entity work.Pipe PORT MAP(clk, '1', buffer_enable_signal(0), buffer_enable_signal(1));
    PL_STEP_0_for_pad_1: entity work.Pipe PORT MAP(clk, '1', pad_1(0), pad_1(1));
    PL_STEP_0_for_pad_2: entity work.Pipe PORT MAP(clk, '1', pad_2(0), pad_2(1));
    PL_STEP_0_for_pad_3: entity work.Pipe PORT MAP(clk, '1', pad_3(0), pad_3(1));
    PL_STEP_0_for_pad_4: entity work.Pipe PORT MAP(clk, '1', pad_4(0), pad_4(1));
    PL_STEP_0_for_pad_5: entity work.Pipe PORT MAP(clk, '1', pad_5(0), pad_5(1));
    PL_STEP_0_for_pad_6: entity work.Pipe PORT MAP(clk, '1', pad_6(0), pad_6(1));
    PL_STEP_0_for_pad_7: entity work.Pipe PORT MAP(clk, '1', pad_7(0), pad_7(1)); -- This is always needed. The sliding window controller forces this.

-- Add a pipeline step
    PL_STEP_1_for_pad_1: entity work.Pipe GENERIC MAP(STEPS => RMCM_PIPELINE_STEPS+1) PORT MAP(clk, '1', pad_1(1), pad_1(2));
    PL_STEP_1_for_pad_2: entity work.Pipe GENERIC MAP(STEPS => RMCM_PIPELINE_STEPS+1) PORT MAP(clk, '1', pad_2(1), pad_2(2));
    PL_STEP_1_for_pad_3: entity work.Pipe GENERIC MAP(STEPS => RMCM_PIPELINE_STEPS+1) PORT MAP(clk, '1', pad_3(1), pad_3(2));
    PL_STEP_1_for_pad_4: entity work.Pipe GENERIC MAP(STEPS => RMCM_PIPELINE_STEPS+1) PORT MAP(clk, '1', pad_4(1), pad_4(2));
    PL_STEP_1_for_pad_5: entity work.Pipe GENERIC MAP(STEPS => RMCM_PIPELINE_STEPS+1) PORT MAP(clk, '1', pad_5(1), pad_5(2));
    PL_STEP_1_for_pad_6: entity work.Pipe GENERIC MAP(STEPS => RMCM_PIPELINE_STEPS+1) PORT MAP(clk, '1', pad_6(1), pad_6(2));
    PL_STEP_1_for_pad_7: entity work.Pipe GENERIC MAP(STEPS => RMCM_PIPELINE_STEPS+1) PORT MAP(clk, '1', pad_7(1), pad_7(2));




-- SAVE THIS SHIT








    conv_core1 : entity work.poolavg_core1
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
            pad_1(2), pad_2(2), pad_3(2), pad_4(2), pad_5(2), pad_6(2), pad_7(2), 

    
            core_1_kpu_1_input_1(0) , 
            core_1_kpu_1_input_2(0) , 
            core_1_kpu_1_input_3(0) , 
            core_1_kpu_1_input_4(0) , 
            core_1_kpu_1_input_5(0) , 
            core_1_kpu_1_input_6(0) , 
            core_1_kpu_1_input_7(0) , 
            core_1_kpu_1_input_8(0) , 
            core_1_kpu_1_input_9(0) , 
            core_1_kpu_1_input_10(0) , 
            core_1_kpu_1_input_11(0) , 
            core_1_kpu_1_input_12(0) , 
            core_1_kpu_1_input_13(0) , 
            core_1_kpu_1_input_14(0) , 
            core_1_kpu_1_input_15(0) , 
            core_1_kpu_1_input_16(0) , 
            core_1_kpu_1_input_17(0) , 
            core_1_kpu_1_input_18(0) , 
            core_1_kpu_1_input_19(0) , 
            core_1_kpu_1_input_20(0) , 
            core_1_kpu_1_input_21(0) , 
            core_1_kpu_1_input_22(0) , 
            core_1_kpu_1_input_23(0) , 
            core_1_kpu_1_input_24(0) , 
            core_1_kpu_1_input_25(0) , 
            core_1_kpu_1_input_26(0) , 
            core_1_kpu_1_input_27(0) , 
            core_1_kpu_1_input_28(0) , 
            core_1_kpu_1_input_29(0) , 
            core_1_kpu_1_input_30(0) , 
            core_1_kpu_1_input_31(0) , 
            core_1_kpu_1_input_32(0) , 
            core_1_kpu_1_input_33(0) , 
            core_1_kpu_1_input_34(0) , 
            core_1_kpu_1_input_35(0) , 
            core_1_kpu_1_input_36(0) , 
            core_1_kpu_1_input_37(0) , 
            core_1_kpu_1_input_38(0) , 
            core_1_kpu_1_input_39(0) , 
            core_1_kpu_1_input_40(0) , 
            core_1_kpu_1_input_41(0) , 
            core_1_kpu_1_input_42(0) , 
            core_1_kpu_1_input_43(0) , 
            core_1_kpu_1_input_44(0) , 
            core_1_kpu_1_input_45(0) , 
            core_1_kpu_1_input_46(0) , 
            core_1_kpu_1_input_47(0) , 
            core_1_kpu_1_input_48(0) , 
            core_1_kpu_1_input_49(0) 
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
  

  
    core_1_KPU_1 : entity work.poolavg_core1_KPU1
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_1_kpu_1_input_1(0), --	sfix(1, -15)
            core_1_kpu_1_input_2(0), --	sfix(1, -15)
            core_1_kpu_1_input_3(0), --	sfix(1, -15)
            core_1_kpu_1_input_4(0), --	sfix(1, -15)
            core_1_kpu_1_input_5(0), --	sfix(1, -15)
            core_1_kpu_1_input_6(0), --	sfix(1, -15)
            core_1_kpu_1_input_7(0), --	sfix(1, -15)
            core_1_kpu_1_input_8(0), --	sfix(1, -15)
            core_1_kpu_1_input_9(0), --	sfix(1, -15)
            core_1_kpu_1_input_10(0), --	sfix(1, -15)
            core_1_kpu_1_input_11(0), --	sfix(1, -15)
            core_1_kpu_1_input_12(0), --	sfix(1, -15)
            core_1_kpu_1_input_13(0), --	sfix(1, -15)
            core_1_kpu_1_input_14(0), --	sfix(1, -15)
            core_1_kpu_1_input_15(0), --	sfix(1, -15)
            core_1_kpu_1_input_16(0), --	sfix(1, -15)
            core_1_kpu_1_input_17(0), --	sfix(1, -15)
            core_1_kpu_1_input_18(0), --	sfix(1, -15)
            core_1_kpu_1_input_19(0), --	sfix(1, -15)
            core_1_kpu_1_input_20(0), --	sfix(1, -15)
            core_1_kpu_1_input_21(0), --	sfix(1, -15)
            core_1_kpu_1_input_22(0), --	sfix(1, -15)
            core_1_kpu_1_input_23(0), --	sfix(1, -15)
            core_1_kpu_1_input_24(0), --	sfix(1, -15)
            core_1_kpu_1_input_25(0), --	sfix(1, -15)
            core_1_kpu_1_input_26(0), --	sfix(1, -15)
            core_1_kpu_1_input_27(0), --	sfix(1, -15)
            core_1_kpu_1_input_28(0), --	sfix(1, -15)
            core_1_kpu_1_input_29(0), --	sfix(1, -15)
            core_1_kpu_1_input_30(0), --	sfix(1, -15)
            core_1_kpu_1_input_31(0), --	sfix(1, -15)
            core_1_kpu_1_input_32(0), --	sfix(1, -15)
            core_1_kpu_1_input_33(0), --	sfix(1, -15)
            core_1_kpu_1_input_34(0), --	sfix(1, -15)
            core_1_kpu_1_input_35(0), --	sfix(1, -15)
            core_1_kpu_1_input_36(0), --	sfix(1, -15)
            core_1_kpu_1_input_37(0), --	sfix(1, -15)
            core_1_kpu_1_input_38(0), --	sfix(1, -15)
            core_1_kpu_1_input_39(0), --	sfix(1, -15)
            core_1_kpu_1_input_40(0), --	sfix(1, -15)
            core_1_kpu_1_input_41(0), --	sfix(1, -15)
            core_1_kpu_1_input_42(0), --	sfix(1, -15)
            core_1_kpu_1_input_43(0), --	sfix(1, -15)
            core_1_kpu_1_input_44(0), --	sfix(1, -15)
            core_1_kpu_1_input_45(0), --	sfix(1, -15)
            core_1_kpu_1_input_46(0), --	sfix(1, -15)
            core_1_kpu_1_input_47(0), --	sfix(1, -15)
            core_1_kpu_1_input_48(0), --	sfix(1, -15)
            core_1_kpu_1_input_49(0), --	sfix(1, -15)

        
            core_1_concat_big_undelayed_array(20-1 downto 0),
            core_1_concat_big_delayed_array(20-1 downto 0),
            core_1_concat_big_undelayed_array(42-1 downto 20),
            core_1_concat_big_delayed_array(42-1 downto 20),
            core_1_concat_big_undelayed_array(64-1 downto 42),
            core_1_concat_big_delayed_array(64-1 downto 42),
            core_1_concat_big_undelayed_array(86-1 downto 64),
            core_1_concat_big_delayed_array(86-1 downto 64),
            core_1_concat_big_undelayed_array(108-1 downto 86),
            core_1_concat_big_delayed_array(108-1 downto 86),
            core_1_concat_big_undelayed_array(130-1 downto 108),
            core_1_concat_big_delayed_array(130-1 downto 108),

        
            core_1_concat_small_undelayed_array(16-1 downto 0),
            core_1_concat_small_delayed_array(16-1 downto 0),
            core_1_concat_small_undelayed_array(34-1 downto 16),
            core_1_concat_small_delayed_array(34-1 downto 16),
            core_1_concat_small_undelayed_array(53-1 downto 34),
            core_1_concat_small_delayed_array(53-1 downto 34),
            core_1_concat_small_undelayed_array(72-1 downto 53),
            core_1_concat_small_delayed_array(72-1 downto 53),
            core_1_concat_small_undelayed_array(92-1 downto 72),
            core_1_concat_small_delayed_array(92-1 downto 72),
            core_1_concat_small_undelayed_array(112-1 downto 92),
            core_1_concat_small_delayed_array(112-1 downto 92),
            core_1_concat_small_undelayed_array(133-1 downto 112),
            core_1_concat_small_delayed_array(133-1 downto 112),
            core_1_concat_small_undelayed_array(154-1 downto 133),
            core_1_concat_small_delayed_array(154-1 downto 133),
            core_1_concat_small_undelayed_array(175-1 downto 154),
            core_1_concat_small_delayed_array(175-1 downto 154),
            core_1_concat_small_undelayed_array(196-1 downto 175),
            core_1_concat_small_delayed_array(196-1 downto 175),
            core_1_concat_small_undelayed_array(217-1 downto 196),
            core_1_concat_small_delayed_array(217-1 downto 196),
            core_1_concat_small_undelayed_array(238-1 downto 217),
            core_1_concat_small_delayed_array(238-1 downto 217),
            core_1_concat_small_undelayed_array(260-1 downto 238),
            core_1_concat_small_delayed_array(260-1 downto 238),
            core_1_concat_small_undelayed_array(282-1 downto 260),
            core_1_concat_small_delayed_array(282-1 downto 260),
            core_1_concat_small_undelayed_array(304-1 downto 282),
            core_1_concat_small_delayed_array(304-1 downto 282),
            core_1_concat_small_undelayed_array(326-1 downto 304),
            core_1_concat_small_delayed_array(326-1 downto 304),
            core_1_concat_small_undelayed_array(348-1 downto 326),
            core_1_concat_small_delayed_array(348-1 downto 326),
            core_1_concat_small_undelayed_array(370-1 downto 348),
            core_1_concat_small_delayed_array(370-1 downto 348),
            core_1_concat_small_undelayed_array(392-1 downto 370),
            core_1_concat_small_delayed_array(392-1 downto 370),
            core_1_concat_small_undelayed_array(414-1 downto 392),
            core_1_concat_small_delayed_array(414-1 downto 392),
            core_1_concat_small_undelayed_array(436-1 downto 414),
            core_1_concat_small_delayed_array(436-1 downto 414),
            core_1_concat_small_undelayed_array(458-1 downto 436),
            core_1_concat_small_delayed_array(458-1 downto 436),
            core_1_concat_small_undelayed_array(480-1 downto 458),
            core_1_concat_small_delayed_array(480-1 downto 458),
            core_1_concat_small_undelayed_array(502-1 downto 480),
            core_1_concat_small_delayed_array(502-1 downto 480),
            core_1_concat_small_undelayed_array(524-1 downto 502),
            core_1_concat_small_delayed_array(524-1 downto 502),
            core_1_concat_small_undelayed_array(546-1 downto 524),
            core_1_concat_small_delayed_array(546-1 downto 524),
            core_1_concat_small_undelayed_array(568-1 downto 546),
            core_1_concat_small_delayed_array(568-1 downto 546),
            core_1_concat_small_undelayed_array(590-1 downto 568),
            core_1_concat_small_delayed_array(590-1 downto 568),
            core_1_concat_small_undelayed_array(612-1 downto 590),
            core_1_concat_small_delayed_array(612-1 downto 590),
            core_1_concat_small_undelayed_array(634-1 downto 612),
            core_1_concat_small_delayed_array(634-1 downto 612),
            core_1_concat_small_undelayed_array(656-1 downto 634),
            core_1_concat_small_delayed_array(656-1 downto 634),
            core_1_concat_small_undelayed_array(678-1 downto 656),
            core_1_concat_small_delayed_array(678-1 downto 656),
            core_1_concat_small_undelayed_array(700-1 downto 678),
            core_1_concat_small_delayed_array(700-1 downto 678),
            core_1_concat_small_undelayed_array(722-1 downto 700),
            core_1_concat_small_delayed_array(722-1 downto 700),
            core_1_concat_small_undelayed_array(744-1 downto 722),
            core_1_concat_small_delayed_array(744-1 downto 722),
            core_1_concat_small_undelayed_array(766-1 downto 744),
            core_1_concat_small_delayed_array(766-1 downto 744),
            core_1_concat_small_undelayed_array(788-1 downto 766),
            core_1_concat_small_delayed_array(788-1 downto 766),
            core_1_concat_small_undelayed_array(810-1 downto 788),
            core_1_concat_small_delayed_array(810-1 downto 788),
            core_1_concat_small_undelayed_array(832-1 downto 810),
            core_1_concat_small_delayed_array(832-1 downto 810),
            core_1_concat_small_undelayed_array(854-1 downto 832),
            core_1_concat_small_delayed_array(854-1 downto 832),
            core_1_concat_small_undelayed_array(876-1 downto 854),
            core_1_concat_small_delayed_array(876-1 downto 854),
            core_1_concat_small_undelayed_array(898-1 downto 876),
            core_1_concat_small_delayed_array(898-1 downto 876),

            -- like this: yo_1
            signal_core_1_yo_1(0)
        );

-- # # # Stage 3 (if classical conv): Accumulate KPU outputs # # #
-- # # # IN:  signal_core_[]_yo_1
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
            XI_MSB => 7, XI_LSB => -15,
            YO_MSB => 7, YO_LSB => -15 )
        port map ( signal_core_1_yo_1(0), bias_add_input_1_signal(0) );
    

-- # # # Stage 4 (optional): Add the bias # # #
-- # # # IN:  bias_add_input_[1]_signal
-- # # # OUT: layer_yo_[1]_pre

-- Delay the signals because of the pipelined accumulator.
-- Add a pipeline step
    PL_STEP_3_for_y_is_valid_signal: entity work.Pipe GENERIC MAP(STEPS => ACCU_PIPELINE_STEPS) PORT MAP(clk, '1', y_is_valid_signal(3), y_is_valid_signal(4));
    PL_STEP_3_for_buffer_enable_signal: entity work.Pipe GENERIC MAP(STEPS => ACCU_PIPELINE_STEPS) PORT MAP(clk, '1', buffer_enable_signal(3), buffer_enable_signal(4));
    PL_STEP_3_for_rmcm_select_config_signal_pl: entity work.Pipe_Vector GENERIC MAP(STEPS => ACCU_PIPELINE_STEPS) PORT MAP(clk, '1', rmcm_select_config_signal_pl(3), rmcm_select_config_signal_pl(4));


    layer_yo_1_pre(0) <= bias_add_input_1_signal(0);


-- # # # Stage 5 (optional): Clip msbs if the real input sample says so # # #
-- # # # IN:  layer_yo_[1]_pre
-- # # # OUT: layer_yo_[1]

-- Add a pipeline step after the bias add / the accumulator
-- Add a pipeline step
    PL_STEP_4_for_y_is_valid_signal: entity work.Pipe PORT MAP(clk, '1', y_is_valid_signal(4), y_is_valid_signal(5));
    PL_STEP_0_for_layer_yo_1_pre: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_1_pre(0), layer_yo_1_pre(1));


    layer_yo_1_unclipped(0) <= layer_yo_1_pre(1)(layer_yo_1_pre(1)'length-1 downto layer_yo_1_pre(1)'length - layer_yo_1_unclipped(0)'length);
  
    clip_max_1: entity work.ClipTruncation
        generic map (
            MIN_VALUE => -(2**(layer_yo_1'length-1)),
            MAX_VALUE => (2**(layer_yo_1'length-1))-1
        )
        Port map (
            layer_yo_1_unclipped(0),
            layer_yo_1_signal
        );
  
    layer_yo_1 <= layer_yo_1_signal; --	sfix(4, -5)

    y_valid <= y_is_valid_signal(5);

    -- FOR DEBUGGING: When producing a valid output -> Check if the output is correct with the TF simulation!
    simulation_validation: entity work.poolavg_sim_validator
        Port map (
            clk,
            reset,
            layer_xi_1, --	ufix(5, -2)
            x_is_valid,
            layer_yo_1_signal, --	sfix(4, -5)
            y_is_valid_signal(5)
        );

end Behavioral;