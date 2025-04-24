LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;
use work.softmax_settings.all;

entity softmax is
    generic
    (
        XI_WIDTH        	          : natural := 8;
        WI_WIDTH                      : natural := 8;
        AMOUNT_OF_NEURONS_PER_FCU     : natural := 125; -- Amount of neurons per FCU unit ("h" in the paper)
        CLOCK_CYCLES_PER_STEP         : natural := 125; -- 196; -- The amount of steps the input is present. The "h_max" in the paper.
        AMOUNT_OF_STEPS_PER_INFERENCE : natural := 256
    );
    port
    (
        clk   : in std_logic;
        reset : in std_logic;
    
        layer_xi_1    : in std_logic_vector((XI_WIDTH-1) downto 0); --	ufix(3, -5)
        layer_xi_2    : in std_logic_vector((XI_WIDTH-1) downto 0); --	ufix(3, -5)
        layer_xi_3    : in std_logic_vector((XI_WIDTH-1) downto 0); --	ufix(3, -5)
        layer_xi_4    : in std_logic_vector((XI_WIDTH-1) downto 0); --	ufix(3, -5)
        input_hold_counter    : in std_logic_vector(bits(CLOCK_CYCLES_PER_STEP-1)-1 downto 0);
        x_is_valid    : in std_logic;

        y_valid    : out std_logic;
        layer_yo_1 : out std_logic_vector(30-1 downto 0);  --	sfix(17, -13)
        layer_yo_2 : out std_logic_vector(30-1 downto 0);  --	sfix(17, -13)
        layer_yo_3 : out std_logic_vector(30-1 downto 0);  --	sfix(17, -13)
        layer_yo_4 : out std_logic_vector(30-1 downto 0);  --	sfix(17, -13)
        layer_yo_5 : out std_logic_vector(30-1 downto 0);  --	sfix(17, -13)
        layer_yo_6 : out std_logic_vector(30-1 downto 0);  --	sfix(17, -13)
        layer_yo_7 : out std_logic_vector(30-1 downto 0);  --	sfix(17, -13)
        layer_yo_8 : out std_logic_vector(30-1 downto 0)  --	sfix(17, -13)
    ) ;
end softmax;

architecture Behavioral of softmax is


    attribute KEEP_HIERARCHY : string;
    attribute KEEP_HIERARCHY of softmax : entity is "yes";

    constant RMCM_PIPELINE_STEPS : natural := 3;
    constant FCU_PIPELINE_STEPS : natural := 3;

    constant AMOUNT_OF_CONFIGURATIONS          : natural := AMOUNT_OF_NEURONS_PER_FCU * AMOUNT_OF_STEPS_PER_INFERENCE;
    constant DELAY_CYCLES                      : natural :=  AMOUNT_OF_NEURONS_PER_FCU - FCU_PIPELINE_STEPS ;

    type PIPELINE_TYPE_FOR_LAYER_XI_1_SIGNAL    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_2_SIGNAL    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_3_SIGNAL    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_4_SIGNAL    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_X_IS_VALID_PL        is array(0 to 3) of std_logic;
    type PIPELINE_TYPE_FOR_Y_IS_VALID_SIGNAL    is array(0 to 6) of std_logic;
    type PIPELINE_TYPE_FOR_OVERWRITE_ENABLE_SIGNAL is array(0 to 1) of std_logic;
    type PIPELINE_TYPE_FOR_RMCM_SELECT_CONFIG_SIGNAL_PL is array(0 to 4) of std_logic_vector(bits((AMOUNT_OF_NEURONS_PER_FCU * AMOUNT_OF_STEPS_PER_INFERENCE)-1)-1 downto 0);
    type PIPELINE_TYPE_FOR_SELECTED_NEURON_SIGNAL_PL is array(0 to 3) of std_logic_vector(bits(DELAY_CYCLES-1-2)-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_FCU_1_INPUT_1 is array(0 to 1) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_FCU_1_INPUT_2 is array(0 to 1) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_FCU_1_INPUT_3 is array(0 to 1) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_FCU_1_INPUT_4 is array(0 to 1) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_FCU_2_INPUT_1 is array(0 to 1) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_FCU_2_INPUT_2 is array(0 to 1) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_FCU_2_INPUT_3 is array(0 to 1) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_FCU_2_INPUT_4 is array(0 to 1) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_FCU_3_INPUT_1 is array(0 to 1) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_FCU_3_INPUT_2 is array(0 to 1) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_FCU_3_INPUT_3 is array(0 to 1) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_FCU_3_INPUT_4 is array(0 to 1) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_FCU_4_INPUT_1 is array(0 to 1) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_FCU_4_INPUT_2 is array(0 to 1) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_FCU_4_INPUT_3 is array(0 to 1) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_FCU_4_INPUT_4 is array(0 to 1) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_FCU_5_INPUT_1 is array(0 to 1) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_FCU_5_INPUT_2 is array(0 to 1) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_FCU_5_INPUT_3 is array(0 to 1) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_FCU_5_INPUT_4 is array(0 to 1) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_FCU_6_INPUT_1 is array(0 to 1) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_FCU_6_INPUT_2 is array(0 to 1) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_FCU_6_INPUT_3 is array(0 to 1) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_FCU_6_INPUT_4 is array(0 to 1) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_FCU_7_INPUT_1 is array(0 to 1) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_FCU_7_INPUT_2 is array(0 to 1) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_FCU_7_INPUT_3 is array(0 to 1) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_FCU_7_INPUT_4 is array(0 to 1) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_FCU_8_INPUT_1 is array(0 to 1) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_FCU_8_INPUT_2 is array(0 to 1) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_FCU_8_INPUT_3 is array(0 to 1) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_FCU_8_INPUT_4 is array(0 to 1) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_X_VAL_OR_EVERYTHING_DONE is array(0 to 1) of std_logic;
    type PIPELINE_TYPE_FOR_SIGNAL_FCU_1_OUTPUT  is array(0 to 1) of std_logic_vector(30-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_FCU_2_OUTPUT  is array(0 to 1) of std_logic_vector(28-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_FCU_3_OUTPUT  is array(0 to 1) of std_logic_vector(28-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_FCU_4_OUTPUT  is array(0 to 1) of std_logic_vector(29-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_FCU_5_OUTPUT  is array(0 to 1) of std_logic_vector(28-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_FCU_6_OUTPUT  is array(0 to 1) of std_logic_vector(28-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_FCU_7_OUTPUT  is array(0 to 1) of std_logic_vector(28-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_FCU_8_OUTPUT  is array(0 to 1) of std_logic_vector(27-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_FCU_1_OUTPUT_RESHAPED is array(0 to 0) of std_logic_vector(30-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_FCU_2_OUTPUT_RESHAPED is array(0 to 0) of std_logic_vector(30-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_FCU_3_OUTPUT_RESHAPED is array(0 to 0) of std_logic_vector(30-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_FCU_4_OUTPUT_RESHAPED is array(0 to 0) of std_logic_vector(30-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_FCU_5_OUTPUT_RESHAPED is array(0 to 0) of std_logic_vector(30-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_FCU_6_OUTPUT_RESHAPED is array(0 to 0) of std_logic_vector(30-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_FCU_7_OUTPUT_RESHAPED is array(0 to 0) of std_logic_vector(30-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_FCU_8_OUTPUT_RESHAPED is array(0 to 0) of std_logic_vector(30-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_1_PRE       is array(0 to 1) of std_logic_vector(30-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_2_PRE       is array(0 to 1) of std_logic_vector(30-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_3_PRE       is array(0 to 1) of std_logic_vector(30-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_4_PRE       is array(0 to 1) of std_logic_vector(30-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_5_PRE       is array(0 to 1) of std_logic_vector(30-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_6_PRE       is array(0 to 1) of std_logic_vector(30-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_7_PRE       is array(0 to 1) of std_logic_vector(30-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_8_PRE       is array(0 to 1) of std_logic_vector(30-1 downto 0);

    -- All output signals
    signal layer_yo_1_signal : std_logic_vector(30-1 downto 0); --	sfix(17, -13)
    signal layer_yo_2_signal : std_logic_vector(30-1 downto 0); --	sfix(17, -13)
    signal layer_yo_3_signal : std_logic_vector(30-1 downto 0); --	sfix(17, -13)
    signal layer_yo_4_signal : std_logic_vector(30-1 downto 0); --	sfix(17, -13)
    signal layer_yo_5_signal : std_logic_vector(30-1 downto 0); --	sfix(17, -13)
    signal layer_yo_6_signal : std_logic_vector(30-1 downto 0); --	sfix(17, -13)
    signal layer_yo_7_signal : std_logic_vector(30-1 downto 0); --	sfix(17, -13)
    signal layer_yo_8_signal : std_logic_vector(30-1 downto 0); --	sfix(17, -13)

    -- All pipelined xi_inputs

    -- ufix(3, -5)
    signal layer_xi_1_signal    : PIPELINE_TYPE_FOR_LAYER_XI_1_SIGNAL;
    -- ufix(3, -5)
    signal layer_xi_2_signal    : PIPELINE_TYPE_FOR_LAYER_XI_2_SIGNAL;
    -- ufix(3, -5)
    signal layer_xi_3_signal    : PIPELINE_TYPE_FOR_LAYER_XI_3_SIGNAL;
    -- ufix(3, -5)
    signal layer_xi_4_signal    : PIPELINE_TYPE_FOR_LAYER_XI_4_SIGNAL;

    -- All pipelined additional signals about the xi_inputs and yo_outputs
    -- Is the input valid?
    signal x_is_valid_pl        : PIPELINE_TYPE_FOR_X_IS_VALID_PL;
    -- Is the output valid?
    signal y_is_valid_signal    : PIPELINE_TYPE_FOR_Y_IS_VALID_SIGNAL;


    -- All internal control signals

    --signal overwrite_enable_signal  : std_logic; -- Start new accumulation?
    -- Start new accumulation?
    signal overwrite_enable_signal : PIPELINE_TYPE_FOR_OVERWRITE_ENABLE_SIGNAL;

    -- The select signal for the RMCMs.
    signal rmcm_select_config_signal_pl : PIPELINE_TYPE_FOR_RMCM_SELECT_CONFIG_SIGNAL_PL;

    signal rmcm_select_config_signal      : std_logic_vector(bits((AMOUNT_OF_NEURONS_PER_FCU * AMOUNT_OF_STEPS_PER_INFERENCE)-1)-1 downto 0);


    -- The current step. Each FCU processes one set of inputs over multiple clock cycles. This is repeated with other inputs for AMOUNT_OF_STEPS_PER_INFERENCE steps.
    -- This counter tracks the current step.
    signal inference_step_counter   : std_logic_vector(bits(AMOUNT_OF_STEPS_PER_INFERENCE-1)-1 downto 0);
    -- The current neuron that is calculated in the FCUs
    signal selected_neuron_signal_pl : PIPELINE_TYPE_FOR_SELECTED_NEURON_SIGNAL_PL;
    signal selected_neuron_signal        : unsigned(bits(DELAY_CYCLES-1-2)-1 downto 0);


    signal layer_concat_undelayed_array : std_logic_vector(226-1 downto 0);
    signal layer_concat_delayed_array   : std_logic_vector(226-1 downto 0);

-- # # # Stage 1: Produce all coefficients # # #
-- # # # IN:  layer_xi[4]
-- # # # OUT: signal_fcu_[8]_input_4

    -- All fc_core outputs
    -- sfix(3, -13)
    signal signal_fcu_1_input_1 : PIPELINE_TYPE_FOR_SIGNAL_FCU_1_INPUT_1;

    -- sfix(3, -13)
    signal signal_fcu_1_input_2 : PIPELINE_TYPE_FOR_SIGNAL_FCU_1_INPUT_2;

    -- sfix(3, -13)
    signal signal_fcu_1_input_3 : PIPELINE_TYPE_FOR_SIGNAL_FCU_1_INPUT_3;

    -- sfix(3, -13)
    signal signal_fcu_1_input_4 : PIPELINE_TYPE_FOR_SIGNAL_FCU_1_INPUT_4;

    -- sfix(3, -13)
    signal signal_fcu_2_input_1 : PIPELINE_TYPE_FOR_SIGNAL_FCU_2_INPUT_1;

    -- sfix(3, -13)
    signal signal_fcu_2_input_2 : PIPELINE_TYPE_FOR_SIGNAL_FCU_2_INPUT_2;

    -- sfix(3, -13)
    signal signal_fcu_2_input_3 : PIPELINE_TYPE_FOR_SIGNAL_FCU_2_INPUT_3;

    -- sfix(3, -13)
    signal signal_fcu_2_input_4 : PIPELINE_TYPE_FOR_SIGNAL_FCU_2_INPUT_4;

    -- sfix(3, -13)
    signal signal_fcu_3_input_1 : PIPELINE_TYPE_FOR_SIGNAL_FCU_3_INPUT_1;

    -- sfix(3, -13)
    signal signal_fcu_3_input_2 : PIPELINE_TYPE_FOR_SIGNAL_FCU_3_INPUT_2;

    -- sfix(3, -13)
    signal signal_fcu_3_input_3 : PIPELINE_TYPE_FOR_SIGNAL_FCU_3_INPUT_3;

    -- sfix(3, -13)
    signal signal_fcu_3_input_4 : PIPELINE_TYPE_FOR_SIGNAL_FCU_3_INPUT_4;

    -- sfix(3, -13)
    signal signal_fcu_4_input_1 : PIPELINE_TYPE_FOR_SIGNAL_FCU_4_INPUT_1;

    -- sfix(3, -13)
    signal signal_fcu_4_input_2 : PIPELINE_TYPE_FOR_SIGNAL_FCU_4_INPUT_2;

    -- sfix(3, -13)
    signal signal_fcu_4_input_3 : PIPELINE_TYPE_FOR_SIGNAL_FCU_4_INPUT_3;

    -- sfix(3, -13)
    signal signal_fcu_4_input_4 : PIPELINE_TYPE_FOR_SIGNAL_FCU_4_INPUT_4;

    -- sfix(3, -13)
    signal signal_fcu_5_input_1 : PIPELINE_TYPE_FOR_SIGNAL_FCU_5_INPUT_1;

    -- sfix(3, -13)
    signal signal_fcu_5_input_2 : PIPELINE_TYPE_FOR_SIGNAL_FCU_5_INPUT_2;

    -- sfix(3, -13)
    signal signal_fcu_5_input_3 : PIPELINE_TYPE_FOR_SIGNAL_FCU_5_INPUT_3;

    -- sfix(3, -13)
    signal signal_fcu_5_input_4 : PIPELINE_TYPE_FOR_SIGNAL_FCU_5_INPUT_4;

    -- sfix(3, -13)
    signal signal_fcu_6_input_1 : PIPELINE_TYPE_FOR_SIGNAL_FCU_6_INPUT_1;

    -- sfix(3, -13)
    signal signal_fcu_6_input_2 : PIPELINE_TYPE_FOR_SIGNAL_FCU_6_INPUT_2;

    -- sfix(3, -13)
    signal signal_fcu_6_input_3 : PIPELINE_TYPE_FOR_SIGNAL_FCU_6_INPUT_3;

    -- sfix(3, -13)
    signal signal_fcu_6_input_4 : PIPELINE_TYPE_FOR_SIGNAL_FCU_6_INPUT_4;

    -- sfix(3, -13)
    signal signal_fcu_7_input_1 : PIPELINE_TYPE_FOR_SIGNAL_FCU_7_INPUT_1;

    -- sfix(3, -13)
    signal signal_fcu_7_input_2 : PIPELINE_TYPE_FOR_SIGNAL_FCU_7_INPUT_2;

    -- sfix(3, -13)
    signal signal_fcu_7_input_3 : PIPELINE_TYPE_FOR_SIGNAL_FCU_7_INPUT_3;

    -- sfix(3, -13)
    signal signal_fcu_7_input_4 : PIPELINE_TYPE_FOR_SIGNAL_FCU_7_INPUT_4;

    -- sfix(3, -13)
    signal signal_fcu_8_input_1 : PIPELINE_TYPE_FOR_SIGNAL_FCU_8_INPUT_1;

    -- sfix(3, -13)
    signal signal_fcu_8_input_2 : PIPELINE_TYPE_FOR_SIGNAL_FCU_8_INPUT_2;

    -- sfix(3, -13)
    signal signal_fcu_8_input_3 : PIPELINE_TYPE_FOR_SIGNAL_FCU_8_INPUT_3;

    -- sfix(3, -13)
    signal signal_fcu_8_input_4 : PIPELINE_TYPE_FOR_SIGNAL_FCU_8_INPUT_4;


-- # # # Stage 2: Sum up coefficients # # #
-- # # # IN:  signal_fcu_[8]_input_4
-- # # # OUT: signal_fcu_[8]_output

    -- All debug signals
    signal DEBUG_FCU_overwrite_enable_signal : std_logic; -- The current overwrite_enable_signal input for the FCUs
    signal DEBUG_FCU_x_is_valid_signal       : std_logic; -- The current x_is_valid_signal input for the FCUs
    signal DEBUG_FCU_selected_neuron_signal  : std_logic_vector(bits(DELAY_CYCLES-1-2)-1 downto 0); -- The current selected_neuron_signal when inputting in the FCUs

    signal DEBUG_FCU_rmcm_select_config_signal : std_logic_vector(bits((AMOUNT_OF_NEURONS_PER_FCU * AMOUNT_OF_STEPS_PER_INFERENCE)-1)-1 downto 0); -- The current rmcm_select_config_signal when inputting in the FCUs


    -- All control signals
    --signal x_val_or_everything_done : std_logic; -- Used to release the last few results in the Adder pipeline steps when done.
    -- Used to release the last few results in the Adder pipeline steps when done.
    signal x_val_or_everything_done : PIPELINE_TYPE_FOR_X_VAL_OR_EVERYTHING_DONE;

    -- All FCU outputs
    -- sfix(17, -13)
    signal signal_fcu_1_output  : PIPELINE_TYPE_FOR_SIGNAL_FCU_1_OUTPUT;

    -- sfix(15, -13)
    signal signal_fcu_2_output  : PIPELINE_TYPE_FOR_SIGNAL_FCU_2_OUTPUT;

    -- sfix(15, -13)
    signal signal_fcu_3_output  : PIPELINE_TYPE_FOR_SIGNAL_FCU_3_OUTPUT;

    -- sfix(16, -13)
    signal signal_fcu_4_output  : PIPELINE_TYPE_FOR_SIGNAL_FCU_4_OUTPUT;

    -- sfix(15, -13)
    signal signal_fcu_5_output  : PIPELINE_TYPE_FOR_SIGNAL_FCU_5_OUTPUT;

    -- sfix(15, -13)
    signal signal_fcu_6_output  : PIPELINE_TYPE_FOR_SIGNAL_FCU_6_OUTPUT;

    -- sfix(15, -13)
    signal signal_fcu_7_output  : PIPELINE_TYPE_FOR_SIGNAL_FCU_7_OUTPUT;

    -- sfix(14, -13)
    signal signal_fcu_8_output  : PIPELINE_TYPE_FOR_SIGNAL_FCU_8_OUTPUT;


-- # # # Stage 3: Reshape all FCU outputs for bias add operation # # #
-- # # # IN:  signal_fcu_[8]_output
-- # # # OUT: signal_fcu_[8]_output_reshaped
    -- sfix(17, -13)
    signal signal_fcu_1_output_reshaped : PIPELINE_TYPE_FOR_SIGNAL_FCU_1_OUTPUT_RESHAPED;

    -- sfix(17, -13)
    signal signal_fcu_2_output_reshaped : PIPELINE_TYPE_FOR_SIGNAL_FCU_2_OUTPUT_RESHAPED;

    -- sfix(17, -13)
    signal signal_fcu_3_output_reshaped : PIPELINE_TYPE_FOR_SIGNAL_FCU_3_OUTPUT_RESHAPED;

    -- sfix(17, -13)
    signal signal_fcu_4_output_reshaped : PIPELINE_TYPE_FOR_SIGNAL_FCU_4_OUTPUT_RESHAPED;

    -- sfix(17, -13)
    signal signal_fcu_5_output_reshaped : PIPELINE_TYPE_FOR_SIGNAL_FCU_5_OUTPUT_RESHAPED;

    -- sfix(17, -13)
    signal signal_fcu_6_output_reshaped : PIPELINE_TYPE_FOR_SIGNAL_FCU_6_OUTPUT_RESHAPED;

    -- sfix(17, -13)
    signal signal_fcu_7_output_reshaped : PIPELINE_TYPE_FOR_SIGNAL_FCU_7_OUTPUT_RESHAPED;

    -- sfix(17, -13)
    signal signal_fcu_8_output_reshaped : PIPELINE_TYPE_FOR_SIGNAL_FCU_8_OUTPUT_RESHAPED;


-- # # # Stage 4 (optional): Add the bias # # #
-- # # # IN:  signal_fcu_[8]_output_reshaped
-- # # # OUT: layer_yo_[8]_pre

    -- All pre layer outputs (All FCU outputs reshaped)
    -- sfix(17, -13)
    signal layer_yo_1_pre       : PIPELINE_TYPE_FOR_LAYER_YO_1_PRE;

    -- sfix(17, -13)
    signal layer_yo_2_pre       : PIPELINE_TYPE_FOR_LAYER_YO_2_PRE;

    -- sfix(17, -13)
    signal layer_yo_3_pre       : PIPELINE_TYPE_FOR_LAYER_YO_3_PRE;

    -- sfix(17, -13)
    signal layer_yo_4_pre       : PIPELINE_TYPE_FOR_LAYER_YO_4_PRE;

    -- sfix(17, -13)
    signal layer_yo_5_pre       : PIPELINE_TYPE_FOR_LAYER_YO_5_PRE;

    -- sfix(17, -13)
    signal layer_yo_6_pre       : PIPELINE_TYPE_FOR_LAYER_YO_6_PRE;

    -- sfix(17, -13)
    signal layer_yo_7_pre       : PIPELINE_TYPE_FOR_LAYER_YO_7_PRE;

    -- sfix(17, -13)
    signal layer_yo_8_pre       : PIPELINE_TYPE_FOR_LAYER_YO_8_PRE;


-- # # # Stage 5: Clip away all useless lsb bits # # #
-- # # # IN:  layer_yo_[8]_pre
-- # # # OUT: layer_yo_[8]_msb_clipped

    -- All layer outputs without additional msb bits

    signal layer_yo_1_msb_clipped : std_logic_vector(30+0-1 downto 0);

    signal layer_yo_2_msb_clipped : std_logic_vector(30+0-1 downto 0);

    signal layer_yo_3_msb_clipped : std_logic_vector(30+0-1 downto 0);

    signal layer_yo_4_msb_clipped : std_logic_vector(30+0-1 downto 0);

    signal layer_yo_5_msb_clipped : std_logic_vector(30+0-1 downto 0);

    signal layer_yo_6_msb_clipped : std_logic_vector(30+0-1 downto 0);

    signal layer_yo_7_msb_clipped : std_logic_vector(30+0-1 downto 0);

    signal layer_yo_8_msb_clipped : std_logic_vector(30+0-1 downto 0);

-- # # # Stage 6 (optional): Clip away useless msb bits # # #
-- # # # IN:  layer_yo_[8]_msb_clipped
-- # # # OUT: layer_yo_[8]

-- No additional signals needed for stage 6.

begin

-- "Initialize" stuff

    layer_xi_1_signal(0) <= layer_xi_1;
    layer_xi_2_signal(0) <= layer_xi_2;
    layer_xi_3_signal(0) <= layer_xi_3;
    layer_xi_4_signal(0) <= layer_xi_4;

    rmcm_select_config_signal_pl(0) <= rmcm_select_config_signal;

    selected_neuron_signal_pl(0) <= std_logic_vector(selected_neuron_signal);

    x_is_valid_pl(0) <= x_is_valid;


-- We determine when an output is valid.
-- We do this right at the start!
detect_y_valid: process( inference_step_counter, x_is_valid)
begin
    if x_is_valid = '1' then
        if  (unsigned(inference_step_counter) = AMOUNT_OF_STEPS_PER_INFERENCE - 1) then
            y_is_valid_signal(0) <= '1';
        else
            y_is_valid_signal(0) <= '0';
        end if;
    else
        y_is_valid_signal(0) <= '0';
    end if;
end process;


-- # # # Stage 1: Produce all coefficients # # #
-- # # # IN:  layer_xi[4]
-- # # # OUT: signal_fcu_[8]_input_4

-- The Weights are loaded from BRAM and that takes one clock cycle. So we have to delay everything else except the select signal.
-- Add a pipeline step
    PL_STEP_0_for_layer_xi_1_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_1_signal(0), layer_xi_1_signal(1));
    PL_STEP_0_for_layer_xi_2_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_2_signal(0), layer_xi_2_signal(1));
    PL_STEP_0_for_layer_xi_3_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_3_signal(0), layer_xi_3_signal(1));
    PL_STEP_0_for_layer_xi_4_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_4_signal(0), layer_xi_4_signal(1));
    PL_STEP_0_for_x_is_valid_pl: entity work.Pipe PORT MAP(clk, '1', x_is_valid_pl(0), x_is_valid_pl(1));
    PL_STEP_0_for_y_is_valid_signal: entity work.Pipe PORT MAP(clk, '1', y_is_valid_signal(0), y_is_valid_signal(1));
    PL_STEP_0_for_selected_neuron_signal_pl: entity work.Pipe_Vector PORT MAP(clk, '1', selected_neuron_signal_pl(0), selected_neuron_signal_pl(1));


    fc_core_1 : entity work.softmax_core1
        generic map
        (
            PIPELINE_STEPS => RMCM_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,

            layer_xi_1_signal(1),
        
            rmcm_select_config_signal_pl(0),
        
        
            signal_fcu_1_input_1(0), 
            signal_fcu_2_input_1(0), 
            signal_fcu_3_input_1(0), 
            signal_fcu_4_input_1(0), 
            signal_fcu_5_input_1(0), 
            signal_fcu_6_input_1(0), 
            signal_fcu_7_input_1(0), 
            signal_fcu_8_input_1(0)
        );
    fc_core_2 : entity work.softmax_core2
        generic map
        (
            PIPELINE_STEPS => RMCM_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,

            layer_xi_2_signal(1),
        
            rmcm_select_config_signal_pl(0),
        
        
            signal_fcu_1_input_2(0), 
            signal_fcu_2_input_2(0), 
            signal_fcu_3_input_2(0), 
            signal_fcu_4_input_2(0), 
            signal_fcu_5_input_2(0), 
            signal_fcu_6_input_2(0), 
            signal_fcu_7_input_2(0), 
            signal_fcu_8_input_2(0)
        );
    fc_core_3 : entity work.softmax_core3
        generic map
        (
            PIPELINE_STEPS => RMCM_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,

            layer_xi_3_signal(1),
        
            rmcm_select_config_signal_pl(0),
        
        
            signal_fcu_1_input_3(0), 
            signal_fcu_2_input_3(0), 
            signal_fcu_3_input_3(0), 
            signal_fcu_4_input_3(0), 
            signal_fcu_5_input_3(0), 
            signal_fcu_6_input_3(0), 
            signal_fcu_7_input_3(0), 
            signal_fcu_8_input_3(0)
        );
    fc_core_4 : entity work.softmax_core4
        generic map
        (
            PIPELINE_STEPS => RMCM_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,

            layer_xi_4_signal(1),
        
            rmcm_select_config_signal_pl(0),
        
        
            signal_fcu_1_input_4(0), 
            signal_fcu_2_input_4(0), 
            signal_fcu_3_input_4(0), 
            signal_fcu_4_input_4(0), 
            signal_fcu_5_input_4(0), 
            signal_fcu_6_input_4(0), 
            signal_fcu_7_input_4(0), 
            signal_fcu_8_input_4(0)
        );

-- # # # Stage 2: Sum up coefficients # # #
-- # # # IN:  signal_fcu_[8]_input_4
-- # # # OUT: signal_fcu_[8]_output

-- Pipeline after creating all the coefficients. We have to pipeline the rmcm_select_config_signal_pl one additional cycle because we skipped this before.
-- Add a pipeline step
    PL_STEP_0_for_rmcm_select_config_signal_pl: entity work.Pipe_Vector PORT MAP(clk, '1', rmcm_select_config_signal_pl(0), rmcm_select_config_signal_pl(1));

-- Add a pipeline step
    PL_STEP_1_for_x_is_valid_pl: entity work.Pipe GENERIC MAP(STEPS => RMCM_PIPELINE_STEPS+1) PORT MAP(clk, '1', x_is_valid_pl(1), x_is_valid_pl(2));
    PL_STEP_1_for_y_is_valid_signal: entity work.Pipe GENERIC MAP(STEPS => RMCM_PIPELINE_STEPS+1) PORT MAP(clk, '1', y_is_valid_signal(1), y_is_valid_signal(2));
    PL_STEP_1_for_rmcm_select_config_signal_pl: entity work.Pipe_Vector GENERIC MAP(STEPS => RMCM_PIPELINE_STEPS+1) PORT MAP(clk, '1', rmcm_select_config_signal_pl(1), rmcm_select_config_signal_pl(2));
    PL_STEP_1_for_selected_neuron_signal_pl: entity work.Pipe_Vector GENERIC MAP(STEPS => RMCM_PIPELINE_STEPS+1) PORT MAP(clk, '1', selected_neuron_signal_pl(1), selected_neuron_signal_pl(2));

-- We have to do this process here, so we use the correct pipeline step for the rmcm_select_config_signal.
-- We have to pipeline an async signal. I do this by just pipelining the synchronous signals the async signal is based on...

track_overwrite_enable: process(clk, rmcm_select_config_signal, rmcm_select_config_signal_pl, reset)
    begin
        if reset = '1' then
            overwrite_enable_signal(0) <= '1';
        else --if rising_edge(clk) then
            if unsigned(rmcm_select_config_signal_pl(2)) <= AMOUNT_OF_NEURONS_PER_FCU - 1 then
                overwrite_enable_signal(0) <= '1';
            else
                overwrite_enable_signal(0) <= '0';
            end if;
        end if;
    end process;

-- We have to do this process here, so we use the correct pipeline step for the rmcm_select_config_signal.
-- We have to pipeline an async signal. I do this by just pipelining the synchronous signals the async signal is based on...

track_x_val_or_everything_done: process(clk, rmcm_select_config_signal, rmcm_select_config_signal_pl, reset, x_is_valid_pl, x_is_valid)
    begin
        if reset = '1' then
            x_val_or_everything_done(0) <= '1';
        else --if rising_edge(clk) then
            if unsigned(rmcm_select_config_signal_pl(2)) = 0 then
                x_val_or_everything_done(0) <= '1';
            else
                x_val_or_everything_done(0) <= x_is_valid_pl(2);
            end if;
        end if;
    end process;


-- Add a pipeline step
    PL_STEP_2_for_x_is_valid_pl: entity work.Pipe PORT MAP(clk, '1', x_is_valid_pl(2), x_is_valid_pl(3));
    PL_STEP_2_for_y_is_valid_signal: entity work.Pipe PORT MAP(clk, '1', y_is_valid_signal(2), y_is_valid_signal(3));
    PL_STEP_0_for_overwrite_enable_signal: entity work.Pipe PORT MAP(clk, '1', overwrite_enable_signal(0), overwrite_enable_signal(1));
    PL_STEP_2_for_rmcm_select_config_signal_pl: entity work.Pipe_Vector PORT MAP(clk, '1', rmcm_select_config_signal_pl(2), rmcm_select_config_signal_pl(3));
    PL_STEP_2_for_selected_neuron_signal_pl: entity work.Pipe_Vector PORT MAP(clk, '1', selected_neuron_signal_pl(2), selected_neuron_signal_pl(3));
    PL_STEP_0_for_signal_fcu_1_input_1: entity work.Pipe_Vector PORT MAP(clk, '1', signal_fcu_1_input_1(0), signal_fcu_1_input_1(1));
    PL_STEP_0_for_signal_fcu_1_input_2: entity work.Pipe_Vector PORT MAP(clk, '1', signal_fcu_1_input_2(0), signal_fcu_1_input_2(1));
    PL_STEP_0_for_signal_fcu_1_input_3: entity work.Pipe_Vector PORT MAP(clk, '1', signal_fcu_1_input_3(0), signal_fcu_1_input_3(1));
    PL_STEP_0_for_signal_fcu_1_input_4: entity work.Pipe_Vector PORT MAP(clk, '1', signal_fcu_1_input_4(0), signal_fcu_1_input_4(1));
    PL_STEP_0_for_signal_fcu_2_input_1: entity work.Pipe_Vector PORT MAP(clk, '1', signal_fcu_2_input_1(0), signal_fcu_2_input_1(1));
    PL_STEP_0_for_signal_fcu_2_input_2: entity work.Pipe_Vector PORT MAP(clk, '1', signal_fcu_2_input_2(0), signal_fcu_2_input_2(1));
    PL_STEP_0_for_signal_fcu_2_input_3: entity work.Pipe_Vector PORT MAP(clk, '1', signal_fcu_2_input_3(0), signal_fcu_2_input_3(1));
    PL_STEP_0_for_signal_fcu_2_input_4: entity work.Pipe_Vector PORT MAP(clk, '1', signal_fcu_2_input_4(0), signal_fcu_2_input_4(1));
    PL_STEP_0_for_signal_fcu_3_input_1: entity work.Pipe_Vector PORT MAP(clk, '1', signal_fcu_3_input_1(0), signal_fcu_3_input_1(1));
    PL_STEP_0_for_signal_fcu_3_input_2: entity work.Pipe_Vector PORT MAP(clk, '1', signal_fcu_3_input_2(0), signal_fcu_3_input_2(1));
    PL_STEP_0_for_signal_fcu_3_input_3: entity work.Pipe_Vector PORT MAP(clk, '1', signal_fcu_3_input_3(0), signal_fcu_3_input_3(1));
    PL_STEP_0_for_signal_fcu_3_input_4: entity work.Pipe_Vector PORT MAP(clk, '1', signal_fcu_3_input_4(0), signal_fcu_3_input_4(1));
    PL_STEP_0_for_signal_fcu_4_input_1: entity work.Pipe_Vector PORT MAP(clk, '1', signal_fcu_4_input_1(0), signal_fcu_4_input_1(1));
    PL_STEP_0_for_signal_fcu_4_input_2: entity work.Pipe_Vector PORT MAP(clk, '1', signal_fcu_4_input_2(0), signal_fcu_4_input_2(1));
    PL_STEP_0_for_signal_fcu_4_input_3: entity work.Pipe_Vector PORT MAP(clk, '1', signal_fcu_4_input_3(0), signal_fcu_4_input_3(1));
    PL_STEP_0_for_signal_fcu_4_input_4: entity work.Pipe_Vector PORT MAP(clk, '1', signal_fcu_4_input_4(0), signal_fcu_4_input_4(1));
    PL_STEP_0_for_signal_fcu_5_input_1: entity work.Pipe_Vector PORT MAP(clk, '1', signal_fcu_5_input_1(0), signal_fcu_5_input_1(1));
    PL_STEP_0_for_signal_fcu_5_input_2: entity work.Pipe_Vector PORT MAP(clk, '1', signal_fcu_5_input_2(0), signal_fcu_5_input_2(1));
    PL_STEP_0_for_signal_fcu_5_input_3: entity work.Pipe_Vector PORT MAP(clk, '1', signal_fcu_5_input_3(0), signal_fcu_5_input_3(1));
    PL_STEP_0_for_signal_fcu_5_input_4: entity work.Pipe_Vector PORT MAP(clk, '1', signal_fcu_5_input_4(0), signal_fcu_5_input_4(1));
    PL_STEP_0_for_signal_fcu_6_input_1: entity work.Pipe_Vector PORT MAP(clk, '1', signal_fcu_6_input_1(0), signal_fcu_6_input_1(1));
    PL_STEP_0_for_signal_fcu_6_input_2: entity work.Pipe_Vector PORT MAP(clk, '1', signal_fcu_6_input_2(0), signal_fcu_6_input_2(1));
    PL_STEP_0_for_signal_fcu_6_input_3: entity work.Pipe_Vector PORT MAP(clk, '1', signal_fcu_6_input_3(0), signal_fcu_6_input_3(1));
    PL_STEP_0_for_signal_fcu_6_input_4: entity work.Pipe_Vector PORT MAP(clk, '1', signal_fcu_6_input_4(0), signal_fcu_6_input_4(1));
    PL_STEP_0_for_signal_fcu_7_input_1: entity work.Pipe_Vector PORT MAP(clk, '1', signal_fcu_7_input_1(0), signal_fcu_7_input_1(1));
    PL_STEP_0_for_signal_fcu_7_input_2: entity work.Pipe_Vector PORT MAP(clk, '1', signal_fcu_7_input_2(0), signal_fcu_7_input_2(1));
    PL_STEP_0_for_signal_fcu_7_input_3: entity work.Pipe_Vector PORT MAP(clk, '1', signal_fcu_7_input_3(0), signal_fcu_7_input_3(1));
    PL_STEP_0_for_signal_fcu_7_input_4: entity work.Pipe_Vector PORT MAP(clk, '1', signal_fcu_7_input_4(0), signal_fcu_7_input_4(1));
    PL_STEP_0_for_signal_fcu_8_input_1: entity work.Pipe_Vector PORT MAP(clk, '1', signal_fcu_8_input_1(0), signal_fcu_8_input_1(1));
    PL_STEP_0_for_signal_fcu_8_input_2: entity work.Pipe_Vector PORT MAP(clk, '1', signal_fcu_8_input_2(0), signal_fcu_8_input_2(1));
    PL_STEP_0_for_signal_fcu_8_input_3: entity work.Pipe_Vector PORT MAP(clk, '1', signal_fcu_8_input_3(0), signal_fcu_8_input_3(1));
    PL_STEP_0_for_signal_fcu_8_input_4: entity work.Pipe_Vector PORT MAP(clk, '1', signal_fcu_8_input_4(0), signal_fcu_8_input_4(1));
    PL_STEP_0_for_x_val_or_everything_done: entity work.Pipe PORT MAP(clk, '1', x_val_or_everything_done(0), x_val_or_everything_done(1));

    -- Debugging: Log the current input for the FCUs
    DEBUG_FCU_overwrite_enable_signal <= overwrite_enable_signal(1);
    DEBUG_FCU_x_is_valid_signal <= x_is_valid_pl(3);

    DEBUG_FCU_rmcm_select_config_signal <= rmcm_select_config_signal_pl(3);



    FCU1 : entity work.softmax_FCU1
        generic map(PIPELINE_STEPS => FCU_PIPELINE_STEPS)
        port map
        (
            clk,
            reset,

            x_val_or_everything_done(1), --x_is_valid_pl(3),
            overwrite_enable_signal(1), -- This is already "pipelined"

            layer_concat_undelayed_array(30-1 downto 0),
            layer_concat_delayed_array(30-1 downto 0),

        
            signal_fcu_1_input_1(1),
            signal_fcu_1_input_2(1),
            signal_fcu_1_input_3(1),
            signal_fcu_1_input_4(1),
            signal_fcu_1_output(0)
        );
    FCU2 : entity work.softmax_FCU2
        generic map(PIPELINE_STEPS => FCU_PIPELINE_STEPS)
        port map
        (
            clk,
            reset,

            x_val_or_everything_done(1), --x_is_valid_pl(3),
            overwrite_enable_signal(1), -- This is already "pipelined"

            layer_concat_undelayed_array(58-1 downto 30),
            layer_concat_delayed_array(58-1 downto 30),

        
            signal_fcu_2_input_1(1),
            signal_fcu_2_input_2(1),
            signal_fcu_2_input_3(1),
            signal_fcu_2_input_4(1),
            signal_fcu_2_output(0)
        );
    FCU3 : entity work.softmax_FCU3
        generic map(PIPELINE_STEPS => FCU_PIPELINE_STEPS)
        port map
        (
            clk,
            reset,

            x_val_or_everything_done(1), --x_is_valid_pl(3),
            overwrite_enable_signal(1), -- This is already "pipelined"

            layer_concat_undelayed_array(86-1 downto 58),
            layer_concat_delayed_array(86-1 downto 58),

        
            signal_fcu_3_input_1(1),
            signal_fcu_3_input_2(1),
            signal_fcu_3_input_3(1),
            signal_fcu_3_input_4(1),
            signal_fcu_3_output(0)
        );
    FCU4 : entity work.softmax_FCU4
        generic map(PIPELINE_STEPS => FCU_PIPELINE_STEPS)
        port map
        (
            clk,
            reset,

            x_val_or_everything_done(1), --x_is_valid_pl(3),
            overwrite_enable_signal(1), -- This is already "pipelined"

            layer_concat_undelayed_array(115-1 downto 86),
            layer_concat_delayed_array(115-1 downto 86),

        
            signal_fcu_4_input_1(1),
            signal_fcu_4_input_2(1),
            signal_fcu_4_input_3(1),
            signal_fcu_4_input_4(1),
            signal_fcu_4_output(0)
        );
    FCU5 : entity work.softmax_FCU5
        generic map(PIPELINE_STEPS => FCU_PIPELINE_STEPS)
        port map
        (
            clk,
            reset,

            x_val_or_everything_done(1), --x_is_valid_pl(3),
            overwrite_enable_signal(1), -- This is already "pipelined"

            layer_concat_undelayed_array(143-1 downto 115),
            layer_concat_delayed_array(143-1 downto 115),

        
            signal_fcu_5_input_1(1),
            signal_fcu_5_input_2(1),
            signal_fcu_5_input_3(1),
            signal_fcu_5_input_4(1),
            signal_fcu_5_output(0)
        );
    FCU6 : entity work.softmax_FCU6
        generic map(PIPELINE_STEPS => FCU_PIPELINE_STEPS)
        port map
        (
            clk,
            reset,

            x_val_or_everything_done(1), --x_is_valid_pl(3),
            overwrite_enable_signal(1), -- This is already "pipelined"

            layer_concat_undelayed_array(171-1 downto 143),
            layer_concat_delayed_array(171-1 downto 143),

        
            signal_fcu_6_input_1(1),
            signal_fcu_6_input_2(1),
            signal_fcu_6_input_3(1),
            signal_fcu_6_input_4(1),
            signal_fcu_6_output(0)
        );
    FCU7 : entity work.softmax_FCU7
        generic map(PIPELINE_STEPS => FCU_PIPELINE_STEPS)
        port map
        (
            clk,
            reset,

            x_val_or_everything_done(1), --x_is_valid_pl(3),
            overwrite_enable_signal(1), -- This is already "pipelined"

            layer_concat_undelayed_array(199-1 downto 171),
            layer_concat_delayed_array(199-1 downto 171),

        
            signal_fcu_7_input_1(1),
            signal_fcu_7_input_2(1),
            signal_fcu_7_input_3(1),
            signal_fcu_7_input_4(1),
            signal_fcu_7_output(0)
        );
    FCU8 : entity work.softmax_FCU8
        generic map(PIPELINE_STEPS => FCU_PIPELINE_STEPS)
        port map
        (
            clk,
            reset,

            x_val_or_everything_done(1), --x_is_valid_pl(3),
            overwrite_enable_signal(1), -- This is already "pipelined"

            layer_concat_undelayed_array(226-1 downto 199),
            layer_concat_delayed_array(226-1 downto 199),

        
            signal_fcu_8_input_1(1),
            signal_fcu_8_input_2(1),
            signal_fcu_8_input_3(1),
            signal_fcu_8_input_4(1),
            signal_fcu_8_output(0)
        );



    DEBUG_FCU_selected_neuron_signal <= selected_neuron_signal_pl(3);






    -- FCU buffer delays
    -- Delay the single huge std_logic_vector
    
    concat_0_delay: entity work.BufferedDelay GENERIC MAP(WL => 72, BL => DELAY_CYCLES) -- amount_of_sums126    h_max196
        PORT MAP(reset, clk, x_is_valid_pl(3), selected_neuron_signal_pl(3), layer_concat_undelayed_array(71 downto 0), layer_concat_delayed_array(71 downto 0));
    
    concat_1_delay: entity work.BufferedDelay GENERIC MAP(WL => 72, BL => DELAY_CYCLES) -- amount_of_sums126    h_max196
        PORT MAP(reset, clk, x_is_valid_pl(3), selected_neuron_signal_pl(3), layer_concat_undelayed_array(143 downto 72), layer_concat_delayed_array(143 downto 72));
    
    concat_2_delay: entity work.BufferedDelay GENERIC MAP(WL => 72, BL => DELAY_CYCLES) -- amount_of_sums126    h_max196
        PORT MAP(reset, clk, x_is_valid_pl(3), selected_neuron_signal_pl(3), layer_concat_undelayed_array(215 downto 144), layer_concat_delayed_array(215 downto 144));
    
    concat_3_delay: entity work.BufferedDelay GENERIC MAP(WL => 10, BL => DELAY_CYCLES) -- amount_of_sums126    h_max196
        PORT MAP(reset, clk, x_is_valid_pl(3), selected_neuron_signal_pl(3), layer_concat_undelayed_array(225 downto 216), layer_concat_delayed_array(225 downto 216));
    


-- # # # Stage 3: Reshape all FCU outputs for bias add operation # # #
-- # # # IN:  signal_fcu_[8]_output
-- # # # OUT: signal_fcu_[8]_output_reshaped

-- Pipeline after

-- Add a pipeline step
    PL_STEP_3_for_y_is_valid_signal: entity work.Pipe GENERIC MAP(STEPS => FCU_PIPELINE_STEPS) PORT MAP(clk, '1', y_is_valid_signal(3), y_is_valid_signal(4));
    PL_STEP_3_for_rmcm_select_config_signal_pl: entity work.Pipe_Vector GENERIC MAP(STEPS => FCU_PIPELINE_STEPS) PORT MAP(clk, '1', rmcm_select_config_signal_pl(3), rmcm_select_config_signal_pl(4));



    Reshape_fcu1_output: entity work.FxPReshape
        generic map (
            XI_MSB => 17, XI_LSB => -13,
            YO_MSB => 17, YO_LSB => -13 )
        port map ( signal_fcu_1_output(0), signal_fcu_1_output_reshaped(0) );

    Reshape_fcu2_output: entity work.FxPReshape
        generic map (
            XI_MSB => 15, XI_LSB => -13,
            YO_MSB => 17, YO_LSB => -13 )
        port map ( signal_fcu_2_output(0), signal_fcu_2_output_reshaped(0) );

    Reshape_fcu3_output: entity work.FxPReshape
        generic map (
            XI_MSB => 15, XI_LSB => -13,
            YO_MSB => 17, YO_LSB => -13 )
        port map ( signal_fcu_3_output(0), signal_fcu_3_output_reshaped(0) );

    Reshape_fcu4_output: entity work.FxPReshape
        generic map (
            XI_MSB => 16, XI_LSB => -13,
            YO_MSB => 17, YO_LSB => -13 )
        port map ( signal_fcu_4_output(0), signal_fcu_4_output_reshaped(0) );

    Reshape_fcu5_output: entity work.FxPReshape
        generic map (
            XI_MSB => 15, XI_LSB => -13,
            YO_MSB => 17, YO_LSB => -13 )
        port map ( signal_fcu_5_output(0), signal_fcu_5_output_reshaped(0) );

    Reshape_fcu6_output: entity work.FxPReshape
        generic map (
            XI_MSB => 15, XI_LSB => -13,
            YO_MSB => 17, YO_LSB => -13 )
        port map ( signal_fcu_6_output(0), signal_fcu_6_output_reshaped(0) );

    Reshape_fcu7_output: entity work.FxPReshape
        generic map (
            XI_MSB => 15, XI_LSB => -13,
            YO_MSB => 17, YO_LSB => -13 )
        port map ( signal_fcu_7_output(0), signal_fcu_7_output_reshaped(0) );

    Reshape_fcu8_output: entity work.FxPReshape
        generic map (
            XI_MSB => 14, XI_LSB => -13,
            YO_MSB => 17, YO_LSB => -13 )
        port map ( signal_fcu_8_output(0), signal_fcu_8_output_reshaped(0) );


-- # # # Stage 4 (optional): Add the bias # # #
-- # # # IN:  signal_fcu_[8]_output_reshaped
-- # # # OUT: layer_yo_[8]_pre


     -- This is always needed. The rom memory enforces this.
    -- Add a pipeline step
    PL_STEP_0_for_signal_fcu_1_output: entity work.Pipe_Vector PORT MAP(clk, '1', signal_fcu_1_output(0), signal_fcu_1_output(1));
    PL_STEP_0_for_signal_fcu_2_output: entity work.Pipe_Vector PORT MAP(clk, '1', signal_fcu_2_output(0), signal_fcu_2_output(1));
    PL_STEP_0_for_signal_fcu_3_output: entity work.Pipe_Vector PORT MAP(clk, '1', signal_fcu_3_output(0), signal_fcu_3_output(1));
    PL_STEP_0_for_signal_fcu_4_output: entity work.Pipe_Vector PORT MAP(clk, '1', signal_fcu_4_output(0), signal_fcu_4_output(1));
    PL_STEP_0_for_signal_fcu_5_output: entity work.Pipe_Vector PORT MAP(clk, '1', signal_fcu_5_output(0), signal_fcu_5_output(1));
    PL_STEP_0_for_signal_fcu_6_output: entity work.Pipe_Vector PORT MAP(clk, '1', signal_fcu_6_output(0), signal_fcu_6_output(1));
    PL_STEP_0_for_signal_fcu_7_output: entity work.Pipe_Vector PORT MAP(clk, '1', signal_fcu_7_output(0), signal_fcu_7_output(1));
    PL_STEP_0_for_signal_fcu_8_output: entity work.Pipe_Vector PORT MAP(clk, '1', signal_fcu_8_output(0), signal_fcu_8_output(1));

    bias_add : entity work.softmax_bias_add
        Port map (
            clk,
            '1',
        
            rmcm_select_config_signal_pl(4),
        
            signal_fcu_1_output_reshaped(0),
            signal_fcu_2_output_reshaped(0),
            signal_fcu_3_output_reshaped(0),
            signal_fcu_4_output_reshaped(0),
            signal_fcu_5_output_reshaped(0),
            signal_fcu_6_output_reshaped(0),
            signal_fcu_7_output_reshaped(0),
            signal_fcu_8_output_reshaped(0),
        
            layer_yo_1_pre(0), 
            layer_yo_2_pre(0), 
            layer_yo_3_pre(0), 
            layer_yo_4_pre(0), 
            layer_yo_5_pre(0), 
            layer_yo_6_pre(0), 
            layer_yo_7_pre(0), 
            layer_yo_8_pre(0)
        );


    -- Add a pipeline step
    PL_STEP_4_for_y_is_valid_signal: entity work.Pipe GENERIC MAP(STEPS => 0) PORT MAP(clk, '1', y_is_valid_signal(4), y_is_valid_signal(5));

-- # # # Stage 5: Clip away all useless lsb bits # # #
-- # # # IN:  layer_yo_[8]_pre
-- # # # OUT: layer_yo_[8]_msb_clipped
-- Add a pipeline step
    PL_STEP_5_for_y_is_valid_signal: entity work.Pipe PORT MAP(clk, '1', y_is_valid_signal(5), y_is_valid_signal(6));
    PL_STEP_0_for_layer_yo_1_pre: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_1_pre(0), layer_yo_1_pre(1));
    PL_STEP_0_for_layer_yo_2_pre: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_2_pre(0), layer_yo_2_pre(1));
    PL_STEP_0_for_layer_yo_3_pre: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_3_pre(0), layer_yo_3_pre(1));
    PL_STEP_0_for_layer_yo_4_pre: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_4_pre(0), layer_yo_4_pre(1));
    PL_STEP_0_for_layer_yo_5_pre: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_5_pre(0), layer_yo_5_pre(1));
    PL_STEP_0_for_layer_yo_6_pre: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_6_pre(0), layer_yo_6_pre(1));
    PL_STEP_0_for_layer_yo_7_pre: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_7_pre(0), layer_yo_7_pre(1));
    PL_STEP_0_for_layer_yo_8_pre: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_8_pre(0), layer_yo_8_pre(1));
    layer_yo_1_msb_clipped <= layer_yo_1_pre(1)(layer_yo_1_pre(1)'length-1 downto layer_yo_1_pre(1)'length - layer_yo_1_msb_clipped'length);

    layer_yo_2_msb_clipped <= layer_yo_2_pre(1)(layer_yo_2_pre(1)'length-1 downto layer_yo_2_pre(1)'length - layer_yo_2_msb_clipped'length);

    layer_yo_3_msb_clipped <= layer_yo_3_pre(1)(layer_yo_3_pre(1)'length-1 downto layer_yo_3_pre(1)'length - layer_yo_3_msb_clipped'length);

    layer_yo_4_msb_clipped <= layer_yo_4_pre(1)(layer_yo_4_pre(1)'length-1 downto layer_yo_4_pre(1)'length - layer_yo_4_msb_clipped'length);

    layer_yo_5_msb_clipped <= layer_yo_5_pre(1)(layer_yo_5_pre(1)'length-1 downto layer_yo_5_pre(1)'length - layer_yo_5_msb_clipped'length);

    layer_yo_6_msb_clipped <= layer_yo_6_pre(1)(layer_yo_6_pre(1)'length-1 downto layer_yo_6_pre(1)'length - layer_yo_6_msb_clipped'length);

    layer_yo_7_msb_clipped <= layer_yo_7_pre(1)(layer_yo_7_pre(1)'length-1 downto layer_yo_7_pre(1)'length - layer_yo_7_msb_clipped'length);

    layer_yo_8_msb_clipped <= layer_yo_8_pre(1)(layer_yo_8_pre(1)'length-1 downto layer_yo_8_pre(1)'length - layer_yo_8_msb_clipped'length);
-- # # # Stage 6 (optional): Clip away useless msb bits # # #
-- # # # IN:  layer_yo_[8]_msb_clipped
-- # # # OUT: layer_yo_[8]


    layer_yo_1_signal <= layer_yo_1_msb_clipped;
  
    layer_yo_2_signal <= layer_yo_2_msb_clipped;
  
    layer_yo_3_signal <= layer_yo_3_msb_clipped;
  
    layer_yo_4_signal <= layer_yo_4_msb_clipped;
  
    layer_yo_5_signal <= layer_yo_5_msb_clipped;
  
    layer_yo_6_signal <= layer_yo_6_msb_clipped;
  
    layer_yo_7_signal <= layer_yo_7_msb_clipped;
  
    layer_yo_8_signal <= layer_yo_8_msb_clipped;
  
    layer_yo_1 <= layer_yo_1_signal; --	sfix(17, -13)
    layer_yo_2 <= layer_yo_2_signal; --	sfix(17, -13)
    layer_yo_3 <= layer_yo_3_signal; --	sfix(17, -13)
    layer_yo_4 <= layer_yo_4_signal; --	sfix(17, -13)
    layer_yo_5 <= layer_yo_5_signal; --	sfix(17, -13)
    layer_yo_6 <= layer_yo_6_signal; --	sfix(17, -13)
    layer_yo_7 <= layer_yo_7_signal; --	sfix(17, -13)
    layer_yo_8 <= layer_yo_8_signal; --	sfix(17, -13)

-- Output the stuff
y_valid <= y_is_valid_signal(6);
track_delay_counter: process(reset, clk)
begin
    if reset = '1' then
        selected_neuron_signal <= (others => '0');
    elsif rising_edge(clk) then
        if x_is_valid = '1' then
            if selected_neuron_signal = to_unsigned(DELAY_CYCLES - 2 - 2, selected_neuron_signal'length) then
                selected_neuron_signal <= (others =>'0');
            else
                selected_neuron_signal <= selected_neuron_signal + 1;
            end if;
        end if;
    end if;
end process;

track_interleave_counter: process(reset, clk)
    begin
        if reset = '1' then
        
            rmcm_select_config_signal <= (others => '0');
        
            inference_step_counter <= (others => '0');
        elsif rising_edge(clk) then
            if x_is_valid = '1' then

            
                if unsigned(rmcm_select_config_signal) < AMOUNT_OF_CONFIGURATIONS - 1 then
                    rmcm_select_config_signal <= std_logic_vector(unsigned(rmcm_select_config_signal) + 1);
                else
                    rmcm_select_config_signal <= (others => '0');
                end if;
            
            
                if (unsigned(input_hold_counter) = CLOCK_CYCLES_PER_STEP - 1) then
                    if (unsigned(inference_step_counter) = AMOUNT_OF_STEPS_PER_INFERENCE - 1) then
                        inference_step_counter <= (others => '0');
                    else
                        inference_step_counter <= std_logic_vector(unsigned(inference_step_counter) + 1);
                    end if;
                end if;
            end if;
        end if;
    end process;

    -- FOR DEBUGGING: When producing a valid output -> Check if the output is correct with the TF simulation!
    simulation_validation: entity work.softmax_sim_validator
        Port map (
            clk,
            reset,
            layer_xi_1, --	ufix(3, -5)
            layer_xi_2, --	ufix(3, -5)
            layer_xi_3, --	ufix(3, -5)
            layer_xi_4, --	ufix(3, -5)
            x_is_valid,
            layer_yo_1_signal,
            layer_yo_2_signal,
            layer_yo_3_signal,
            layer_yo_4_signal,
            layer_yo_5_signal,
            layer_yo_6_signal,
            layer_yo_7_signal,
            layer_yo_8_signal,
            y_is_valid_signal(6)
        );

end Behavioral;