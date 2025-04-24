LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;
use work.conv1_settings.all;

entity conv1 is
    port
    (
        clk   : in std_logic;
        reset : in std_logic;
    
        layer_xi_1    : in std_logic_vector(8-1 downto 0); --	sfix(1, -7)
        layer_xi_2    : in std_logic_vector(8-1 downto 0); --	sfix(1, -7)
        layer_xi_3    : in std_logic_vector(8-1 downto 0); --	sfix(1, -7)
        x_is_valid    : in std_logic;

        y_valid    : out std_logic;
        layer_yo_1 : out std_logic_vector(8-1 downto 0);  --	sfix(5, -3)
        layer_yo_2 : out std_logic_vector(8-1 downto 0);  --	sfix(5, -3)
        layer_yo_3 : out std_logic_vector(8-1 downto 0);  --	sfix(5, -3)
        layer_yo_4 : out std_logic_vector(8-1 downto 0);  --	sfix(5, -3)
        layer_yo_5 : out std_logic_vector(8-1 downto 0);  --	sfix(5, -3)
        layer_yo_6 : out std_logic_vector(8-1 downto 0);  --	sfix(5, -3)
        layer_yo_7 : out std_logic_vector(8-1 downto 0);  --	sfix(5, -3)
        layer_yo_8 : out std_logic_vector(8-1 downto 0);  --	sfix(5, -3)
        layer_yo_9 : out std_logic_vector(8-1 downto 0);  --	sfix(5, -3)
        layer_yo_10 : out std_logic_vector(8-1 downto 0);  --	sfix(5, -3)
        layer_yo_11 : out std_logic_vector(8-1 downto 0);  --	sfix(5, -3)
        layer_yo_12 : out std_logic_vector(8-1 downto 0);  --	sfix(5, -3)
        layer_yo_13 : out std_logic_vector(8-1 downto 0);  --	sfix(5, -3)
        layer_yo_14 : out std_logic_vector(8-1 downto 0);  --	sfix(5, -3)
        layer_yo_15 : out std_logic_vector(8-1 downto 0);  --	sfix(5, -3)
        layer_yo_16 : out std_logic_vector(8-1 downto 0);  --	sfix(5, -3)
        layer_yo_17 : out std_logic_vector(8-1 downto 0);  --	sfix(5, -3)
        layer_yo_18 : out std_logic_vector(8-1 downto 0);  --	sfix(5, -3)
        layer_yo_19 : out std_logic_vector(8-1 downto 0);  --	sfix(5, -3)
        layer_yo_20 : out std_logic_vector(8-1 downto 0);  --	sfix(5, -3)
        layer_yo_21 : out std_logic_vector(8-1 downto 0);  --	sfix(5, -3)
        layer_yo_22 : out std_logic_vector(8-1 downto 0);  --	sfix(5, -3)
        layer_yo_23 : out std_logic_vector(8-1 downto 0);  --	sfix(5, -3)
        layer_yo_24 : out std_logic_vector(8-1 downto 0);  --	sfix(5, -3)
        layer_yo_25 : out std_logic_vector(8-1 downto 0);  --	sfix(5, -3)
        layer_yo_26 : out std_logic_vector(8-1 downto 0);  --	sfix(5, -3)
        layer_yo_27 : out std_logic_vector(8-1 downto 0);  --	sfix(5, -3)
        layer_yo_28 : out std_logic_vector(8-1 downto 0);  --	sfix(5, -3)
        layer_yo_29 : out std_logic_vector(8-1 downto 0);  --	sfix(5, -3)
        layer_yo_30 : out std_logic_vector(8-1 downto 0);  --	sfix(5, -3)
        layer_yo_31 : out std_logic_vector(8-1 downto 0);  --	sfix(5, -3)
        layer_yo_32 : out std_logic_vector(8-1 downto 0) --	sfix(5, -3)
    ) ;
end conv1;

architecture Behavioral of conv1 is


    attribute KEEP_HIERARCHY : string;
    attribute KEEP_HIERARCHY of conv1 : entity is "yes";

    constant ACCU_PIPELINE_STEPS : natural := 1;
    constant RMCM_PIPELINE_STEPS : natural := 3;
    constant KPU_PIPELINE_STEPS : natural := 0;

    constant BIG_BUFFER_DELAY_COUNTER_MAX : NATURAL := (FEATURE_MAP_SIZE - KERNEL_SIZE + 1) * CONFIGURATIONS - KPU_PIPELINE_STEPS;
    constant SMALL_BUFFER_DELAY_COUNTER_MAX : NATURAL := CONFIGURATIONS - KPU_PIPELINE_STEPS;



    type PIPELINE_TYPE_FOR_LAYER_XI_1_SIGNAL    is array(0 to 2) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_2_SIGNAL    is array(0 to 2) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_3_SIGNAL    is array(0 to 2) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_Y_IS_VALID_SIGNAL    is array(0 to 8) of std_logic;
    type PIPELINE_TYPE_FOR_BUFFER_ENABLE_SIGNAL is array(0 to 6) of std_logic;
    type PIPELINE_TYPE_FOR_PAD_1                is array(0 to 2) of std_logic;
    type PIPELINE_TYPE_FOR_PAD_2                is array(0 to 2) of std_logic;
    type PIPELINE_TYPE_FOR_PAD_3                is array(0 to 2) of std_logic;
    type PIPELINE_TYPE_FOR_BIG_BUFFER_DELAY_COUNTER_SIGNAL is array(0 to 1) of std_logic_vector(bits(BIG_BUFFER_DELAY_COUNTER_MAX-1-2)-1 downto 0);
    type PIPELINE_TYPE_FOR_SMALL_BUFFER_DELAY_COUNTER_SIGNAL is array(0 to 1) of std_logic_vector(bits(SMALL_BUFFER_DELAY_COUNTER_MAX-1-2)-1 downto 0);
    type PIPELINE_TYPE_FOR_INTERLEAVE_COUNTER_SIGNAL is array(0 to 3) of std_logic_vector(bits(INTERLEAVINGS-1)-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_1 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_2 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_3 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_4 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_5 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_6 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_7 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_8 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_9 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_2_INPUT_1 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_2_INPUT_2 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_2_INPUT_3 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_2_INPUT_4 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_2_INPUT_5 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_2_INPUT_6 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_2_INPUT_7 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_2_INPUT_8 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_2_INPUT_9 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_3_INPUT_1 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_3_INPUT_2 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_3_INPUT_3 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_3_INPUT_4 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_3_INPUT_5 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_3_INPUT_6 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_3_INPUT_7 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_3_INPUT_8 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_3_INPUT_9 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_4_INPUT_1 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_4_INPUT_2 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_4_INPUT_3 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_4_INPUT_4 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_4_INPUT_5 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_4_INPUT_6 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_4_INPUT_7 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_4_INPUT_8 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_4_INPUT_9 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_5_INPUT_1 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_5_INPUT_2 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_5_INPUT_3 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_5_INPUT_4 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_5_INPUT_5 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_5_INPUT_6 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_5_INPUT_7 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_5_INPUT_8 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_5_INPUT_9 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_6_INPUT_1 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_6_INPUT_2 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_6_INPUT_3 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_6_INPUT_4 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_6_INPUT_5 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_6_INPUT_6 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_6_INPUT_7 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_6_INPUT_8 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_6_INPUT_9 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_7_INPUT_1 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_7_INPUT_2 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_7_INPUT_3 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_7_INPUT_4 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_7_INPUT_5 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_7_INPUT_6 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_7_INPUT_7 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_7_INPUT_8 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_7_INPUT_9 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_8_INPUT_1 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_8_INPUT_2 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_8_INPUT_3 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_8_INPUT_4 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_8_INPUT_5 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_8_INPUT_6 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_8_INPUT_7 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_8_INPUT_8 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_8_INPUT_9 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_9_INPUT_1 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_9_INPUT_2 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_9_INPUT_3 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_9_INPUT_4 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_9_INPUT_5 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_9_INPUT_6 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_9_INPUT_7 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_9_INPUT_8 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_9_INPUT_9 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_10_INPUT_1 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_10_INPUT_2 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_10_INPUT_3 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_10_INPUT_4 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_10_INPUT_5 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_10_INPUT_6 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_10_INPUT_7 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_10_INPUT_8 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_10_INPUT_9 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_11_INPUT_1 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_11_INPUT_2 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_11_INPUT_3 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_11_INPUT_4 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_11_INPUT_5 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_11_INPUT_6 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_11_INPUT_7 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_11_INPUT_8 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_11_INPUT_9 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_12_INPUT_1 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_12_INPUT_2 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_12_INPUT_3 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_12_INPUT_4 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_12_INPUT_5 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_12_INPUT_6 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_12_INPUT_7 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_12_INPUT_8 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_12_INPUT_9 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_13_INPUT_1 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_13_INPUT_2 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_13_INPUT_3 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_13_INPUT_4 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_13_INPUT_5 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_13_INPUT_6 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_13_INPUT_7 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_13_INPUT_8 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_13_INPUT_9 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_14_INPUT_1 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_14_INPUT_2 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_14_INPUT_3 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_14_INPUT_4 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_14_INPUT_5 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_14_INPUT_6 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_14_INPUT_7 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_14_INPUT_8 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_14_INPUT_9 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_15_INPUT_1 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_15_INPUT_2 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_15_INPUT_3 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_15_INPUT_4 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_15_INPUT_5 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_15_INPUT_6 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_15_INPUT_7 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_15_INPUT_8 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_15_INPUT_9 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_16_INPUT_1 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_16_INPUT_2 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_16_INPUT_3 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_16_INPUT_4 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_16_INPUT_5 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_16_INPUT_6 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_16_INPUT_7 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_16_INPUT_8 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_16_INPUT_9 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_17_INPUT_1 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_17_INPUT_2 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_17_INPUT_3 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_17_INPUT_4 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_17_INPUT_5 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_17_INPUT_6 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_17_INPUT_7 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_17_INPUT_8 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_17_INPUT_9 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_18_INPUT_1 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_18_INPUT_2 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_18_INPUT_3 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_18_INPUT_4 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_18_INPUT_5 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_18_INPUT_6 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_18_INPUT_7 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_18_INPUT_8 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_18_INPUT_9 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_19_INPUT_1 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_19_INPUT_2 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_19_INPUT_3 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_19_INPUT_4 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_19_INPUT_5 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_19_INPUT_6 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_19_INPUT_7 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_19_INPUT_8 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_19_INPUT_9 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_20_INPUT_1 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_20_INPUT_2 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_20_INPUT_3 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_20_INPUT_4 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_20_INPUT_5 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_20_INPUT_6 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_20_INPUT_7 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_20_INPUT_8 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_20_INPUT_9 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_21_INPUT_1 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_21_INPUT_2 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_21_INPUT_3 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_21_INPUT_4 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_21_INPUT_5 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_21_INPUT_6 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_21_INPUT_7 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_21_INPUT_8 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_21_INPUT_9 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_22_INPUT_1 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_22_INPUT_2 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_22_INPUT_3 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_22_INPUT_4 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_22_INPUT_5 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_22_INPUT_6 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_22_INPUT_7 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_22_INPUT_8 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_22_INPUT_9 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_23_INPUT_1 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_23_INPUT_2 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_23_INPUT_3 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_23_INPUT_4 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_23_INPUT_5 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_23_INPUT_6 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_23_INPUT_7 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_23_INPUT_8 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_23_INPUT_9 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_24_INPUT_1 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_24_INPUT_2 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_24_INPUT_3 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_24_INPUT_4 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_24_INPUT_5 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_24_INPUT_6 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_24_INPUT_7 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_24_INPUT_8 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_24_INPUT_9 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_25_INPUT_1 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_25_INPUT_2 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_25_INPUT_3 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_25_INPUT_4 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_25_INPUT_5 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_25_INPUT_6 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_25_INPUT_7 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_25_INPUT_8 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_25_INPUT_9 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_26_INPUT_1 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_26_INPUT_2 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_26_INPUT_3 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_26_INPUT_4 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_26_INPUT_5 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_26_INPUT_6 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_26_INPUT_7 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_26_INPUT_8 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_26_INPUT_9 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_27_INPUT_1 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_27_INPUT_2 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_27_INPUT_3 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_27_INPUT_4 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_27_INPUT_5 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_27_INPUT_6 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_27_INPUT_7 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_27_INPUT_8 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_27_INPUT_9 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_28_INPUT_1 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_28_INPUT_2 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_28_INPUT_3 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_28_INPUT_4 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_28_INPUT_5 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_28_INPUT_6 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_28_INPUT_7 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_28_INPUT_8 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_28_INPUT_9 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_29_INPUT_1 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_29_INPUT_2 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_29_INPUT_3 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_29_INPUT_4 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_29_INPUT_5 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_29_INPUT_6 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_29_INPUT_7 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_29_INPUT_8 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_29_INPUT_9 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_30_INPUT_1 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_30_INPUT_2 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_30_INPUT_3 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_30_INPUT_4 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_30_INPUT_5 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_30_INPUT_6 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_30_INPUT_7 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_30_INPUT_8 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_30_INPUT_9 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_31_INPUT_1 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_31_INPUT_2 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_31_INPUT_3 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_31_INPUT_4 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_31_INPUT_5 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_31_INPUT_6 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_31_INPUT_7 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_31_INPUT_8 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_31_INPUT_9 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_32_INPUT_1 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_32_INPUT_2 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_32_INPUT_3 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_32_INPUT_4 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_32_INPUT_5 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_32_INPUT_6 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_32_INPUT_7 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_32_INPUT_8 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_32_INPUT_9 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_1_INPUT_1 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_1_INPUT_2 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_1_INPUT_3 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_1_INPUT_4 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_1_INPUT_5 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_1_INPUT_6 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_1_INPUT_7 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_1_INPUT_8 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_1_INPUT_9 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_2_INPUT_1 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_2_INPUT_2 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_2_INPUT_3 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_2_INPUT_4 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_2_INPUT_5 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_2_INPUT_6 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_2_INPUT_7 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_2_INPUT_8 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_2_INPUT_9 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_3_INPUT_1 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_3_INPUT_2 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_3_INPUT_3 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_3_INPUT_4 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_3_INPUT_5 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_3_INPUT_6 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_3_INPUT_7 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_3_INPUT_8 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_3_INPUT_9 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_4_INPUT_1 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_4_INPUT_2 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_4_INPUT_3 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_4_INPUT_4 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_4_INPUT_5 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_4_INPUT_6 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_4_INPUT_7 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_4_INPUT_8 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_4_INPUT_9 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_5_INPUT_1 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_5_INPUT_2 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_5_INPUT_3 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_5_INPUT_4 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_5_INPUT_5 is array(0 to 0) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_5_INPUT_6 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_5_INPUT_7 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_5_INPUT_8 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_5_INPUT_9 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_6_INPUT_1 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_6_INPUT_2 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_6_INPUT_3 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_6_INPUT_4 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_6_INPUT_5 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_6_INPUT_6 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_6_INPUT_7 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_6_INPUT_8 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_6_INPUT_9 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_7_INPUT_1 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_7_INPUT_2 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_7_INPUT_3 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_7_INPUT_4 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_7_INPUT_5 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_7_INPUT_6 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_7_INPUT_7 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_7_INPUT_8 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_7_INPUT_9 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_8_INPUT_1 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_8_INPUT_2 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_8_INPUT_3 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_8_INPUT_4 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_8_INPUT_5 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_8_INPUT_6 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_8_INPUT_7 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_8_INPUT_8 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_8_INPUT_9 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_9_INPUT_1 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_9_INPUT_2 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_9_INPUT_3 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_9_INPUT_4 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_9_INPUT_5 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_9_INPUT_6 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_9_INPUT_7 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_9_INPUT_8 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_9_INPUT_9 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_10_INPUT_1 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_10_INPUT_2 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_10_INPUT_3 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_10_INPUT_4 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_10_INPUT_5 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_10_INPUT_6 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_10_INPUT_7 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_10_INPUT_8 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_10_INPUT_9 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_11_INPUT_1 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_11_INPUT_2 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_11_INPUT_3 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_11_INPUT_4 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_11_INPUT_5 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_11_INPUT_6 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_11_INPUT_7 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_11_INPUT_8 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_11_INPUT_9 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_12_INPUT_1 is array(0 to 0) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_12_INPUT_2 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_12_INPUT_3 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_12_INPUT_4 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_12_INPUT_5 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_12_INPUT_6 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_12_INPUT_7 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_12_INPUT_8 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_12_INPUT_9 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_13_INPUT_1 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_13_INPUT_2 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_13_INPUT_3 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_13_INPUT_4 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_13_INPUT_5 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_13_INPUT_6 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_13_INPUT_7 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_13_INPUT_8 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_13_INPUT_9 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_14_INPUT_1 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_14_INPUT_2 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_14_INPUT_3 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_14_INPUT_4 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_14_INPUT_5 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_14_INPUT_6 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_14_INPUT_7 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_14_INPUT_8 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_14_INPUT_9 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_15_INPUT_1 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_15_INPUT_2 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_15_INPUT_3 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_15_INPUT_4 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_15_INPUT_5 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_15_INPUT_6 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_15_INPUT_7 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_15_INPUT_8 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_15_INPUT_9 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_16_INPUT_1 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_16_INPUT_2 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_16_INPUT_3 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_16_INPUT_4 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_16_INPUT_5 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_16_INPUT_6 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_16_INPUT_7 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_16_INPUT_8 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_16_INPUT_9 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_17_INPUT_1 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_17_INPUT_2 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_17_INPUT_3 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_17_INPUT_4 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_17_INPUT_5 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_17_INPUT_6 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_17_INPUT_7 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_17_INPUT_8 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_17_INPUT_9 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_18_INPUT_1 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_18_INPUT_2 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_18_INPUT_3 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_18_INPUT_4 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_18_INPUT_5 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_18_INPUT_6 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_18_INPUT_7 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_18_INPUT_8 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_18_INPUT_9 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_19_INPUT_1 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_19_INPUT_2 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_19_INPUT_3 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_19_INPUT_4 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_19_INPUT_5 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_19_INPUT_6 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_19_INPUT_7 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_19_INPUT_8 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_19_INPUT_9 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_20_INPUT_1 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_20_INPUT_2 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_20_INPUT_3 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_20_INPUT_4 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_20_INPUT_5 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_20_INPUT_6 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_20_INPUT_7 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_20_INPUT_8 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_20_INPUT_9 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_21_INPUT_1 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_21_INPUT_2 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_21_INPUT_3 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_21_INPUT_4 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_21_INPUT_5 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_21_INPUT_6 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_21_INPUT_7 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_21_INPUT_8 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_21_INPUT_9 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_22_INPUT_1 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_22_INPUT_2 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_22_INPUT_3 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_22_INPUT_4 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_22_INPUT_5 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_22_INPUT_6 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_22_INPUT_7 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_22_INPUT_8 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_22_INPUT_9 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_23_INPUT_1 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_23_INPUT_2 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_23_INPUT_3 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_23_INPUT_4 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_23_INPUT_5 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_23_INPUT_6 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_23_INPUT_7 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_23_INPUT_8 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_23_INPUT_9 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_24_INPUT_1 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_24_INPUT_2 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_24_INPUT_3 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_24_INPUT_4 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_24_INPUT_5 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_24_INPUT_6 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_24_INPUT_7 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_24_INPUT_8 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_24_INPUT_9 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_25_INPUT_1 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_25_INPUT_2 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_25_INPUT_3 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_25_INPUT_4 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_25_INPUT_5 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_25_INPUT_6 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_25_INPUT_7 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_25_INPUT_8 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_25_INPUT_9 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_26_INPUT_1 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_26_INPUT_2 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_26_INPUT_3 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_26_INPUT_4 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_26_INPUT_5 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_26_INPUT_6 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_26_INPUT_7 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_26_INPUT_8 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_26_INPUT_9 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_27_INPUT_1 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_27_INPUT_2 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_27_INPUT_3 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_27_INPUT_4 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_27_INPUT_5 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_27_INPUT_6 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_27_INPUT_7 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_27_INPUT_8 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_27_INPUT_9 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_28_INPUT_1 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_28_INPUT_2 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_28_INPUT_3 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_28_INPUT_4 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_28_INPUT_5 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_28_INPUT_6 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_28_INPUT_7 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_28_INPUT_8 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_28_INPUT_9 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_29_INPUT_1 is array(0 to 0) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_29_INPUT_2 is array(0 to 0) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_29_INPUT_3 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_29_INPUT_4 is array(0 to 0) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_29_INPUT_5 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_29_INPUT_6 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_29_INPUT_7 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_29_INPUT_8 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_29_INPUT_9 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_30_INPUT_1 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_30_INPUT_2 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_30_INPUT_3 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_30_INPUT_4 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_30_INPUT_5 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_30_INPUT_6 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_30_INPUT_7 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_30_INPUT_8 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_30_INPUT_9 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_31_INPUT_1 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_31_INPUT_2 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_31_INPUT_3 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_31_INPUT_4 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_31_INPUT_5 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_31_INPUT_6 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_31_INPUT_7 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_31_INPUT_8 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_31_INPUT_9 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_32_INPUT_1 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_32_INPUT_2 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_32_INPUT_3 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_32_INPUT_4 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_32_INPUT_5 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_32_INPUT_6 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_32_INPUT_7 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_32_INPUT_8 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_32_INPUT_9 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_1_INPUT_1 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_1_INPUT_2 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_1_INPUT_3 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_1_INPUT_4 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_1_INPUT_5 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_1_INPUT_6 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_1_INPUT_7 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_1_INPUT_8 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_1_INPUT_9 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_2_INPUT_1 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_2_INPUT_2 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_2_INPUT_3 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_2_INPUT_4 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_2_INPUT_5 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_2_INPUT_6 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_2_INPUT_7 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_2_INPUT_8 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_2_INPUT_9 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_3_INPUT_1 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_3_INPUT_2 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_3_INPUT_3 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_3_INPUT_4 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_3_INPUT_5 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_3_INPUT_6 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_3_INPUT_7 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_3_INPUT_8 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_3_INPUT_9 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_4_INPUT_1 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_4_INPUT_2 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_4_INPUT_3 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_4_INPUT_4 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_4_INPUT_5 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_4_INPUT_6 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_4_INPUT_7 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_4_INPUT_8 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_4_INPUT_9 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_5_INPUT_1 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_5_INPUT_2 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_5_INPUT_3 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_5_INPUT_4 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_5_INPUT_5 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_5_INPUT_6 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_5_INPUT_7 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_5_INPUT_8 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_5_INPUT_9 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_6_INPUT_1 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_6_INPUT_2 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_6_INPUT_3 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_6_INPUT_4 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_6_INPUT_5 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_6_INPUT_6 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_6_INPUT_7 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_6_INPUT_8 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_6_INPUT_9 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_7_INPUT_1 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_7_INPUT_2 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_7_INPUT_3 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_7_INPUT_4 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_7_INPUT_5 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_7_INPUT_6 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_7_INPUT_7 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_7_INPUT_8 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_7_INPUT_9 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_8_INPUT_1 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_8_INPUT_2 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_8_INPUT_3 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_8_INPUT_4 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_8_INPUT_5 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_8_INPUT_6 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_8_INPUT_7 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_8_INPUT_8 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_8_INPUT_9 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_9_INPUT_1 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_9_INPUT_2 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_9_INPUT_3 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_9_INPUT_4 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_9_INPUT_5 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_9_INPUT_6 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_9_INPUT_7 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_9_INPUT_8 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_9_INPUT_9 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_10_INPUT_1 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_10_INPUT_2 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_10_INPUT_3 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_10_INPUT_4 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_10_INPUT_5 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_10_INPUT_6 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_10_INPUT_7 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_10_INPUT_8 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_10_INPUT_9 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_11_INPUT_1 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_11_INPUT_2 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_11_INPUT_3 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_11_INPUT_4 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_11_INPUT_5 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_11_INPUT_6 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_11_INPUT_7 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_11_INPUT_8 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_11_INPUT_9 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_12_INPUT_1 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_12_INPUT_2 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_12_INPUT_3 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_12_INPUT_4 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_12_INPUT_5 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_12_INPUT_6 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_12_INPUT_7 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_12_INPUT_8 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_12_INPUT_9 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_13_INPUT_1 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_13_INPUT_2 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_13_INPUT_3 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_13_INPUT_4 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_13_INPUT_5 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_13_INPUT_6 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_13_INPUT_7 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_13_INPUT_8 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_13_INPUT_9 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_14_INPUT_1 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_14_INPUT_2 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_14_INPUT_3 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_14_INPUT_4 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_14_INPUT_5 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_14_INPUT_6 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_14_INPUT_7 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_14_INPUT_8 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_14_INPUT_9 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_15_INPUT_1 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_15_INPUT_2 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_15_INPUT_3 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_15_INPUT_4 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_15_INPUT_5 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_15_INPUT_6 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_15_INPUT_7 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_15_INPUT_8 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_15_INPUT_9 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_16_INPUT_1 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_16_INPUT_2 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_16_INPUT_3 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_16_INPUT_4 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_16_INPUT_5 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_16_INPUT_6 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_16_INPUT_7 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_16_INPUT_8 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_16_INPUT_9 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_17_INPUT_1 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_17_INPUT_2 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_17_INPUT_3 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_17_INPUT_4 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_17_INPUT_5 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_17_INPUT_6 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_17_INPUT_7 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_17_INPUT_8 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_17_INPUT_9 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_18_INPUT_1 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_18_INPUT_2 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_18_INPUT_3 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_18_INPUT_4 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_18_INPUT_5 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_18_INPUT_6 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_18_INPUT_7 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_18_INPUT_8 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_18_INPUT_9 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_19_INPUT_1 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_19_INPUT_2 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_19_INPUT_3 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_19_INPUT_4 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_19_INPUT_5 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_19_INPUT_6 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_19_INPUT_7 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_19_INPUT_8 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_19_INPUT_9 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_20_INPUT_1 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_20_INPUT_2 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_20_INPUT_3 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_20_INPUT_4 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_20_INPUT_5 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_20_INPUT_6 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_20_INPUT_7 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_20_INPUT_8 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_20_INPUT_9 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_21_INPUT_1 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_21_INPUT_2 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_21_INPUT_3 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_21_INPUT_4 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_21_INPUT_5 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_21_INPUT_6 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_21_INPUT_7 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_21_INPUT_8 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_21_INPUT_9 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_22_INPUT_1 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_22_INPUT_2 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_22_INPUT_3 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_22_INPUT_4 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_22_INPUT_5 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_22_INPUT_6 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_22_INPUT_7 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_22_INPUT_8 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_22_INPUT_9 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_23_INPUT_1 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_23_INPUT_2 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_23_INPUT_3 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_23_INPUT_4 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_23_INPUT_5 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_23_INPUT_6 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_23_INPUT_7 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_23_INPUT_8 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_23_INPUT_9 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_24_INPUT_1 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_24_INPUT_2 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_24_INPUT_3 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_24_INPUT_4 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_24_INPUT_5 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_24_INPUT_6 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_24_INPUT_7 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_24_INPUT_8 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_24_INPUT_9 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_25_INPUT_1 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_25_INPUT_2 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_25_INPUT_3 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_25_INPUT_4 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_25_INPUT_5 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_25_INPUT_6 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_25_INPUT_7 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_25_INPUT_8 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_25_INPUT_9 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_26_INPUT_1 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_26_INPUT_2 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_26_INPUT_3 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_26_INPUT_4 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_26_INPUT_5 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_26_INPUT_6 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_26_INPUT_7 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_26_INPUT_8 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_26_INPUT_9 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_27_INPUT_1 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_27_INPUT_2 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_27_INPUT_3 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_27_INPUT_4 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_27_INPUT_5 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_27_INPUT_6 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_27_INPUT_7 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_27_INPUT_8 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_27_INPUT_9 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_28_INPUT_1 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_28_INPUT_2 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_28_INPUT_3 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_28_INPUT_4 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_28_INPUT_5 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_28_INPUT_6 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_28_INPUT_7 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_28_INPUT_8 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_28_INPUT_9 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_29_INPUT_1 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_29_INPUT_2 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_29_INPUT_3 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_29_INPUT_4 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_29_INPUT_5 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_29_INPUT_6 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_29_INPUT_7 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_29_INPUT_8 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_29_INPUT_9 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_30_INPUT_1 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_30_INPUT_2 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_30_INPUT_3 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_30_INPUT_4 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_30_INPUT_5 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_30_INPUT_6 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_30_INPUT_7 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_30_INPUT_8 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_30_INPUT_9 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_31_INPUT_1 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_31_INPUT_2 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_31_INPUT_3 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_31_INPUT_4 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_31_INPUT_5 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_31_INPUT_6 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_31_INPUT_7 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_31_INPUT_8 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_31_INPUT_9 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_32_INPUT_1 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_32_INPUT_2 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_32_INPUT_3 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_32_INPUT_4 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_32_INPUT_5 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_32_INPUT_6 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_32_INPUT_7 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_32_INPUT_8 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_32_INPUT_9 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_1   is array(0 to 1) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_2   is array(0 to 1) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_3   is array(0 to 1) of std_logic_vector(17-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_4   is array(0 to 1) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_5   is array(0 to 1) of std_logic_vector(18-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_6   is array(0 to 1) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_7   is array(0 to 1) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_8   is array(0 to 1) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_9   is array(0 to 1) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_10  is array(0 to 1) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_11  is array(0 to 1) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_12  is array(0 to 1) of std_logic_vector(18-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_13  is array(0 to 1) of std_logic_vector(18-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_14  is array(0 to 1) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_15  is array(0 to 1) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_16  is array(0 to 1) of std_logic_vector(17-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_17  is array(0 to 1) of std_logic_vector(17-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_18  is array(0 to 1) of std_logic_vector(18-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_19  is array(0 to 1) of std_logic_vector(19-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_20  is array(0 to 1) of std_logic_vector(17-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_21  is array(0 to 1) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_22  is array(0 to 1) of std_logic_vector(18-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_23  is array(0 to 1) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_24  is array(0 to 1) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_25  is array(0 to 1) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_26  is array(0 to 1) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_27  is array(0 to 1) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_28  is array(0 to 1) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_29  is array(0 to 1) of std_logic_vector(18-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_30  is array(0 to 1) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_31  is array(0 to 1) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_32  is array(0 to 1) of std_logic_vector(17-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_1   is array(0 to 1) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_2   is array(0 to 1) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_3   is array(0 to 1) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_4   is array(0 to 1) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_5   is array(0 to 1) of std_logic_vector(19-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_6   is array(0 to 1) of std_logic_vector(17-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_7   is array(0 to 1) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_8   is array(0 to 1) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_9   is array(0 to 1) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_10  is array(0 to 1) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_11  is array(0 to 1) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_12  is array(0 to 1) of std_logic_vector(19-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_13  is array(0 to 1) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_14  is array(0 to 1) of std_logic_vector(17-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_15  is array(0 to 1) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_16  is array(0 to 1) of std_logic_vector(17-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_17  is array(0 to 1) of std_logic_vector(17-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_18  is array(0 to 1) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_19  is array(0 to 1) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_20  is array(0 to 1) of std_logic_vector(17-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_21  is array(0 to 1) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_22  is array(0 to 1) of std_logic_vector(18-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_23  is array(0 to 1) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_24  is array(0 to 1) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_25  is array(0 to 1) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_26  is array(0 to 1) of std_logic_vector(17-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_27  is array(0 to 1) of std_logic_vector(17-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_28  is array(0 to 1) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_29  is array(0 to 1) of std_logic_vector(19-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_30  is array(0 to 1) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_31  is array(0 to 1) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_32  is array(0 to 1) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_1   is array(0 to 1) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_2   is array(0 to 1) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_3   is array(0 to 1) of std_logic_vector(17-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_4   is array(0 to 1) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_5   is array(0 to 1) of std_logic_vector(20-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_6   is array(0 to 1) of std_logic_vector(19-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_7   is array(0 to 1) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_8   is array(0 to 1) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_9   is array(0 to 1) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_10  is array(0 to 1) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_11  is array(0 to 1) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_12  is array(0 to 1) of std_logic_vector(17-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_13  is array(0 to 1) of std_logic_vector(18-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_14  is array(0 to 1) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_15  is array(0 to 1) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_16  is array(0 to 1) of std_logic_vector(17-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_17  is array(0 to 1) of std_logic_vector(17-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_18  is array(0 to 1) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_19  is array(0 to 1) of std_logic_vector(19-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_20  is array(0 to 1) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_21  is array(0 to 1) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_22  is array(0 to 1) of std_logic_vector(17-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_23  is array(0 to 1) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_24  is array(0 to 1) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_25  is array(0 to 1) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_26  is array(0 to 1) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_27  is array(0 to 1) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_28  is array(0 to 1) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_29  is array(0 to 1) of std_logic_vector(17-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_30  is array(0 to 1) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_31  is array(0 to 1) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_32  is array(0 to 1) of std_logic_vector(16-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_1_PRE       is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_2_PRE       is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_3_PRE       is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_4_PRE       is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_5_PRE       is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_6_PRE       is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_7_PRE       is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_8_PRE       is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_9_PRE       is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_10_PRE      is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_11_PRE      is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_12_PRE      is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_13_PRE      is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_14_PRE      is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_15_PRE      is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_16_PRE      is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_17_PRE      is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_18_PRE      is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_19_PRE      is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_20_PRE      is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_21_PRE      is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_22_PRE      is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_23_PRE      is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_24_PRE      is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_25_PRE      is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_26_PRE      is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_27_PRE      is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_28_PRE      is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_29_PRE      is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_30_PRE      is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_31_PRE      is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_32_PRE      is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_1_UNCLIPPED is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_2_UNCLIPPED is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_3_UNCLIPPED is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_4_UNCLIPPED is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_5_UNCLIPPED is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_6_UNCLIPPED is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_7_UNCLIPPED is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_8_UNCLIPPED is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_9_UNCLIPPED is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_10_UNCLIPPED is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_11_UNCLIPPED is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_12_UNCLIPPED is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_13_UNCLIPPED is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_14_UNCLIPPED is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_15_UNCLIPPED is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_16_UNCLIPPED is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_17_UNCLIPPED is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_18_UNCLIPPED is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_19_UNCLIPPED is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_20_UNCLIPPED is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_21_UNCLIPPED is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_22_UNCLIPPED is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_23_UNCLIPPED is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_24_UNCLIPPED is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_25_UNCLIPPED is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_26_UNCLIPPED is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_27_UNCLIPPED is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_28_UNCLIPPED is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_29_UNCLIPPED is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_30_UNCLIPPED is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_31_UNCLIPPED is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_32_UNCLIPPED is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_1_SIGNAL is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_2_SIGNAL is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_3_SIGNAL is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_4_SIGNAL is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_5_SIGNAL is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_6_SIGNAL is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_7_SIGNAL is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_8_SIGNAL is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_9_SIGNAL is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_10_SIGNAL is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_11_SIGNAL is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_12_SIGNAL is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_13_SIGNAL is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_14_SIGNAL is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_15_SIGNAL is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_16_SIGNAL is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_17_SIGNAL is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_18_SIGNAL is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_19_SIGNAL is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_20_SIGNAL is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_21_SIGNAL is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_22_SIGNAL is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_23_SIGNAL is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_24_SIGNAL is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_25_SIGNAL is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_26_SIGNAL is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_27_SIGNAL is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_28_SIGNAL is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_29_SIGNAL is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_30_SIGNAL is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_31_SIGNAL is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_32_SIGNAL is array(0 to 1) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_ACCU_1_SIGNAL        is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_ACCU_2_SIGNAL        is array(0 to 0) of std_logic_vector(17-1 downto 0);
    type PIPELINE_TYPE_FOR_ACCU_3_SIGNAL        is array(0 to 0) of std_logic_vector(19-1 downto 0);
    type PIPELINE_TYPE_FOR_ACCU_4_SIGNAL        is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_ACCU_5_SIGNAL        is array(0 to 0) of std_logic_vector(22-1 downto 0);
    type PIPELINE_TYPE_FOR_ACCU_6_SIGNAL        is array(0 to 0) of std_logic_vector(21-1 downto 0);
    type PIPELINE_TYPE_FOR_ACCU_7_SIGNAL        is array(0 to 0) of std_logic_vector(18-1 downto 0);
    type PIPELINE_TYPE_FOR_ACCU_8_SIGNAL        is array(0 to 0) of std_logic_vector(18-1 downto 0);
    type PIPELINE_TYPE_FOR_ACCU_9_SIGNAL        is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_ACCU_10_SIGNAL       is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_ACCU_11_SIGNAL       is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_ACCU_12_SIGNAL       is array(0 to 0) of std_logic_vector(21-1 downto 0);
    type PIPELINE_TYPE_FOR_ACCU_13_SIGNAL       is array(0 to 0) of std_logic_vector(20-1 downto 0);
    type PIPELINE_TYPE_FOR_ACCU_14_SIGNAL       is array(0 to 0) of std_logic_vector(19-1 downto 0);
    type PIPELINE_TYPE_FOR_ACCU_15_SIGNAL       is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_ACCU_16_SIGNAL       is array(0 to 0) of std_logic_vector(19-1 downto 0);
    type PIPELINE_TYPE_FOR_ACCU_17_SIGNAL       is array(0 to 0) of std_logic_vector(19-1 downto 0);
    type PIPELINE_TYPE_FOR_ACCU_18_SIGNAL       is array(0 to 0) of std_logic_vector(20-1 downto 0);
    type PIPELINE_TYPE_FOR_ACCU_19_SIGNAL       is array(0 to 0) of std_logic_vector(21-1 downto 0);
    type PIPELINE_TYPE_FOR_ACCU_20_SIGNAL       is array(0 to 0) of std_logic_vector(19-1 downto 0);
    type PIPELINE_TYPE_FOR_ACCU_21_SIGNAL       is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_ACCU_22_SIGNAL       is array(0 to 0) of std_logic_vector(20-1 downto 0);
    type PIPELINE_TYPE_FOR_ACCU_23_SIGNAL       is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_ACCU_24_SIGNAL       is array(0 to 0) of std_logic_vector(18-1 downto 0);
    type PIPELINE_TYPE_FOR_ACCU_25_SIGNAL       is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_ACCU_26_SIGNAL       is array(0 to 0) of std_logic_vector(19-1 downto 0);
    type PIPELINE_TYPE_FOR_ACCU_27_SIGNAL       is array(0 to 0) of std_logic_vector(19-1 downto 0);
    type PIPELINE_TYPE_FOR_ACCU_28_SIGNAL       is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_ACCU_29_SIGNAL       is array(0 to 0) of std_logic_vector(21-1 downto 0);
    type PIPELINE_TYPE_FOR_ACCU_30_SIGNAL       is array(0 to 0) of std_logic_vector(18-1 downto 0);
    type PIPELINE_TYPE_FOR_ACCU_31_SIGNAL       is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_ACCU_32_SIGNAL       is array(0 to 0) of std_logic_vector(19-1 downto 0);

    -- All layer outputs
        signal layer_yo_1_signal : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        signal layer_yo_2_signal : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        signal layer_yo_3_signal : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        signal layer_yo_4_signal : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        signal layer_yo_5_signal : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        signal layer_yo_6_signal : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        signal layer_yo_7_signal : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        signal layer_yo_8_signal : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        signal layer_yo_9_signal : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        signal layer_yo_10_signal : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        signal layer_yo_11_signal : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        signal layer_yo_12_signal : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        signal layer_yo_13_signal : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        signal layer_yo_14_signal : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        signal layer_yo_15_signal : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        signal layer_yo_16_signal : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        signal layer_yo_17_signal : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        signal layer_yo_18_signal : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        signal layer_yo_19_signal : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        signal layer_yo_20_signal : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        signal layer_yo_21_signal : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        signal layer_yo_22_signal : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        signal layer_yo_23_signal : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        signal layer_yo_24_signal : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        signal layer_yo_25_signal : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        signal layer_yo_26_signal : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        signal layer_yo_27_signal : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        signal layer_yo_28_signal : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        signal layer_yo_29_signal : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        signal layer_yo_30_signal : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        signal layer_yo_31_signal : std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        signal layer_yo_32_signal : std_logic_vector(8-1 downto 0); --	sfix(5, -3)

    -- All pipelines xi_inputs

    -- sfix(1, -7)
    signal layer_xi_1_signal    : PIPELINE_TYPE_FOR_LAYER_XI_1_SIGNAL;
    -- sfix(1, -7)
    signal layer_xi_2_signal    : PIPELINE_TYPE_FOR_LAYER_XI_2_SIGNAL;
    -- sfix(1, -7)
    signal layer_xi_3_signal    : PIPELINE_TYPE_FOR_LAYER_XI_3_SIGNAL;

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


    -- All KPU big buffer (line buffer) delays
    -- The one std_logic_vector to delay
    subtype CORE_1_CONCAT_BIG_DELAY_ARRAY_TYPE is std_logic_vector(961-1 downto 0);
    signal core_1_concat_big_undelayed_array : CORE_1_CONCAT_BIG_DELAY_ARRAY_TYPE;
    signal core_1_concat_big_delayed_array : CORE_1_CONCAT_BIG_DELAY_ARRAY_TYPE;

    -- All KPU small buffer delays
    -- The one std_logic_vector to delay
    subtype CORE_1_CONCAT_SMALL_DELAY_ARRAY_TYPE is std_logic_vector(2783-1 downto 0);
    signal core_1_concat_small_undelayed_array : CORE_1_CONCAT_SMALL_DELAY_ARRAY_TYPE;
    signal core_1_concat_small_delayed_array : CORE_1_CONCAT_SMALL_DELAY_ARRAY_TYPE;
    -- All KPU big buffer (line buffer) delays
    -- The one std_logic_vector to delay
    subtype CORE_2_CONCAT_BIG_DELAY_ARRAY_TYPE is std_logic_vector(962-1 downto 0);
    signal core_2_concat_big_undelayed_array : CORE_2_CONCAT_BIG_DELAY_ARRAY_TYPE;
    signal core_2_concat_big_delayed_array : CORE_2_CONCAT_BIG_DELAY_ARRAY_TYPE;

    -- All KPU small buffer delays
    -- The one std_logic_vector to delay
    subtype CORE_2_CONCAT_SMALL_DELAY_ARRAY_TYPE is std_logic_vector(2785-1 downto 0);
    signal core_2_concat_small_undelayed_array : CORE_2_CONCAT_SMALL_DELAY_ARRAY_TYPE;
    signal core_2_concat_small_delayed_array : CORE_2_CONCAT_SMALL_DELAY_ARRAY_TYPE;
    -- All KPU big buffer (line buffer) delays
    -- The one std_logic_vector to delay
    subtype CORE_3_CONCAT_BIG_DELAY_ARRAY_TYPE is std_logic_vector(964-1 downto 0);
    signal core_3_concat_big_undelayed_array : CORE_3_CONCAT_BIG_DELAY_ARRAY_TYPE;
    signal core_3_concat_big_delayed_array : CORE_3_CONCAT_BIG_DELAY_ARRAY_TYPE;

    -- All KPU small buffer delays
    -- The one std_logic_vector to delay
    subtype CORE_3_CONCAT_SMALL_DELAY_ARRAY_TYPE is std_logic_vector(2794-1 downto 0);
    signal core_3_concat_small_undelayed_array : CORE_3_CONCAT_SMALL_DELAY_ARRAY_TYPE;
    signal core_3_concat_small_delayed_array : CORE_3_CONCAT_SMALL_DELAY_ARRAY_TYPE;

    -- All KPU inputs

 
    -- sfix(1, -12)
    signal core_1_kpu_1_input_1 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_1;
    -- sfix(1, -12)
    signal core_1_kpu_1_input_2 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_2;
    -- sfix(1, -12)
    signal core_1_kpu_1_input_3 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_3;
    -- sfix(1, -12)
    signal core_1_kpu_1_input_4 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_4;
    -- sfix(1, -12)
    signal core_1_kpu_1_input_5 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_5;
    -- sfix(1, -12)
    signal core_1_kpu_1_input_6 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_6;
    -- sfix(1, -12)
    signal core_1_kpu_1_input_7 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_7;
    -- sfix(1, -12)
    signal core_1_kpu_1_input_8 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_8;
    -- sfix(1, -12)
    signal core_1_kpu_1_input_9 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_9;
    -- sfix(0, -12)
    signal core_1_kpu_2_input_1 : PIPELINE_TYPE_FOR_CORE_1_KPU_2_INPUT_1;
    -- sfix(0, -12)
    signal core_1_kpu_2_input_2 : PIPELINE_TYPE_FOR_CORE_1_KPU_2_INPUT_2;
    -- sfix(0, -12)
    signal core_1_kpu_2_input_3 : PIPELINE_TYPE_FOR_CORE_1_KPU_2_INPUT_3;
    -- sfix(-3, -12)
    signal core_1_kpu_2_input_4 : PIPELINE_TYPE_FOR_CORE_1_KPU_2_INPUT_4;
    -- sfix(-1, -12)
    signal core_1_kpu_2_input_5 : PIPELINE_TYPE_FOR_CORE_1_KPU_2_INPUT_5;
    -- sfix(-3, -12)
    signal core_1_kpu_2_input_6 : PIPELINE_TYPE_FOR_CORE_1_KPU_2_INPUT_6;
    -- sfix(1, -12)
    signal core_1_kpu_2_input_7 : PIPELINE_TYPE_FOR_CORE_1_KPU_2_INPUT_7;
    -- sfix(-3, -12)
    signal core_1_kpu_2_input_8 : PIPELINE_TYPE_FOR_CORE_1_KPU_2_INPUT_8;
    -- sfix(-2, -12)
    signal core_1_kpu_2_input_9 : PIPELINE_TYPE_FOR_CORE_1_KPU_2_INPUT_9;
    -- sfix(1, -12)
    signal core_1_kpu_3_input_1 : PIPELINE_TYPE_FOR_CORE_1_KPU_3_INPUT_1;
    -- sfix(2, -12)
    signal core_1_kpu_3_input_2 : PIPELINE_TYPE_FOR_CORE_1_KPU_3_INPUT_2;
    -- sfix(0, -12)
    signal core_1_kpu_3_input_3 : PIPELINE_TYPE_FOR_CORE_1_KPU_3_INPUT_3;
    -- sfix(2, -12)
    signal core_1_kpu_3_input_4 : PIPELINE_TYPE_FOR_CORE_1_KPU_3_INPUT_4;
    -- sfix(2, -12)
    signal core_1_kpu_3_input_5 : PIPELINE_TYPE_FOR_CORE_1_KPU_3_INPUT_5;
    -- sfix(0, -12)
    signal core_1_kpu_3_input_6 : PIPELINE_TYPE_FOR_CORE_1_KPU_3_INPUT_6;
    -- sfix(1, -12)
    signal core_1_kpu_3_input_7 : PIPELINE_TYPE_FOR_CORE_1_KPU_3_INPUT_7;
    -- sfix(1, -12)
    signal core_1_kpu_3_input_8 : PIPELINE_TYPE_FOR_CORE_1_KPU_3_INPUT_8;
    -- sfix(-1, -12)
    signal core_1_kpu_3_input_9 : PIPELINE_TYPE_FOR_CORE_1_KPU_3_INPUT_9;
    -- sfix(1, -12)
    signal core_1_kpu_4_input_1 : PIPELINE_TYPE_FOR_CORE_1_KPU_4_INPUT_1;
    -- sfix(1, -12)
    signal core_1_kpu_4_input_2 : PIPELINE_TYPE_FOR_CORE_1_KPU_4_INPUT_2;
    -- sfix(1, -12)
    signal core_1_kpu_4_input_3 : PIPELINE_TYPE_FOR_CORE_1_KPU_4_INPUT_3;
    -- sfix(1, -12)
    signal core_1_kpu_4_input_4 : PIPELINE_TYPE_FOR_CORE_1_KPU_4_INPUT_4;
    -- sfix(1, -12)
    signal core_1_kpu_4_input_5 : PIPELINE_TYPE_FOR_CORE_1_KPU_4_INPUT_5;
    -- sfix(1, -12)
    signal core_1_kpu_4_input_6 : PIPELINE_TYPE_FOR_CORE_1_KPU_4_INPUT_6;
    -- sfix(1, -12)
    signal core_1_kpu_4_input_7 : PIPELINE_TYPE_FOR_CORE_1_KPU_4_INPUT_7;
    -- sfix(1, -12)
    signal core_1_kpu_4_input_8 : PIPELINE_TYPE_FOR_CORE_1_KPU_4_INPUT_8;
    -- sfix(1, -12)
    signal core_1_kpu_4_input_9 : PIPELINE_TYPE_FOR_CORE_1_KPU_4_INPUT_9;
    -- sfix(-3, -12)
    signal core_1_kpu_5_input_1 : PIPELINE_TYPE_FOR_CORE_1_KPU_5_INPUT_1;
    -- sfix(0, -12)
    signal core_1_kpu_5_input_2 : PIPELINE_TYPE_FOR_CORE_1_KPU_5_INPUT_2;
    -- sfix(2, -12)
    signal core_1_kpu_5_input_3 : PIPELINE_TYPE_FOR_CORE_1_KPU_5_INPUT_3;
    -- sfix(1, -12)
    signal core_1_kpu_5_input_4 : PIPELINE_TYPE_FOR_CORE_1_KPU_5_INPUT_4;
    -- sfix(3, -12)
    signal core_1_kpu_5_input_5 : PIPELINE_TYPE_FOR_CORE_1_KPU_5_INPUT_5;
    -- sfix(2, -12)
    signal core_1_kpu_5_input_6 : PIPELINE_TYPE_FOR_CORE_1_KPU_5_INPUT_6;
    -- sfix(1, -12)
    signal core_1_kpu_5_input_7 : PIPELINE_TYPE_FOR_CORE_1_KPU_5_INPUT_7;
    -- sfix(2, -12)
    signal core_1_kpu_5_input_8 : PIPELINE_TYPE_FOR_CORE_1_KPU_5_INPUT_8;
    -- sfix(1, -12)
    signal core_1_kpu_5_input_9 : PIPELINE_TYPE_FOR_CORE_1_KPU_5_INPUT_9;
    -- sfix(-3, -12)
    signal core_1_kpu_6_input_1 : PIPELINE_TYPE_FOR_CORE_1_KPU_6_INPUT_1;
    -- sfix(1, -12)
    signal core_1_kpu_6_input_2 : PIPELINE_TYPE_FOR_CORE_1_KPU_6_INPUT_2;
    -- sfix(-1, -12)
    signal core_1_kpu_6_input_3 : PIPELINE_TYPE_FOR_CORE_1_KPU_6_INPUT_3;
    -- sfix(-1, -12)
    signal core_1_kpu_6_input_4 : PIPELINE_TYPE_FOR_CORE_1_KPU_6_INPUT_4;
    -- sfix(2, -12)
    signal core_1_kpu_6_input_5 : PIPELINE_TYPE_FOR_CORE_1_KPU_6_INPUT_5;
    -- sfix(1, -12)
    signal core_1_kpu_6_input_6 : PIPELINE_TYPE_FOR_CORE_1_KPU_6_INPUT_6;
    -- sfix(0, -12)
    signal core_1_kpu_6_input_7 : PIPELINE_TYPE_FOR_CORE_1_KPU_6_INPUT_7;
    -- sfix(1, -12)
    signal core_1_kpu_6_input_8 : PIPELINE_TYPE_FOR_CORE_1_KPU_6_INPUT_8;
    -- sfix(1, -12)
    signal core_1_kpu_6_input_9 : PIPELINE_TYPE_FOR_CORE_1_KPU_6_INPUT_9;
    -- sfix(-3, -12)
    signal core_1_kpu_7_input_1 : PIPELINE_TYPE_FOR_CORE_1_KPU_7_INPUT_1;
    -- sfix(0, -12)
    signal core_1_kpu_7_input_2 : PIPELINE_TYPE_FOR_CORE_1_KPU_7_INPUT_2;
    -- sfix(1, -12)
    signal core_1_kpu_7_input_3 : PIPELINE_TYPE_FOR_CORE_1_KPU_7_INPUT_3;
    -- sfix(1, -12)
    signal core_1_kpu_7_input_4 : PIPELINE_TYPE_FOR_CORE_1_KPU_7_INPUT_4;
    -- sfix(0, -12)
    signal core_1_kpu_7_input_5 : PIPELINE_TYPE_FOR_CORE_1_KPU_7_INPUT_5;
    -- sfix(-1, -12)
    signal core_1_kpu_7_input_6 : PIPELINE_TYPE_FOR_CORE_1_KPU_7_INPUT_6;
    -- sfix(0, -12)
    signal core_1_kpu_7_input_7 : PIPELINE_TYPE_FOR_CORE_1_KPU_7_INPUT_7;
    -- sfix(-2, -12)
    signal core_1_kpu_7_input_8 : PIPELINE_TYPE_FOR_CORE_1_KPU_7_INPUT_8;
    -- sfix(1, -12)
    signal core_1_kpu_7_input_9 : PIPELINE_TYPE_FOR_CORE_1_KPU_7_INPUT_9;
    -- sfix(-3, -12)
    signal core_1_kpu_8_input_1 : PIPELINE_TYPE_FOR_CORE_1_KPU_8_INPUT_1;
    -- sfix(-3, -12)
    signal core_1_kpu_8_input_2 : PIPELINE_TYPE_FOR_CORE_1_KPU_8_INPUT_2;
    -- sfix(-3, -12)
    signal core_1_kpu_8_input_3 : PIPELINE_TYPE_FOR_CORE_1_KPU_8_INPUT_3;
    -- sfix(-3, -12)
    signal core_1_kpu_8_input_4 : PIPELINE_TYPE_FOR_CORE_1_KPU_8_INPUT_4;
    -- sfix(-3, -12)
    signal core_1_kpu_8_input_5 : PIPELINE_TYPE_FOR_CORE_1_KPU_8_INPUT_5;
    -- sfix(1, -12)
    signal core_1_kpu_8_input_6 : PIPELINE_TYPE_FOR_CORE_1_KPU_8_INPUT_6;
    -- sfix(-1, -12)
    signal core_1_kpu_8_input_7 : PIPELINE_TYPE_FOR_CORE_1_KPU_8_INPUT_7;
    -- sfix(-3, -12)
    signal core_1_kpu_8_input_8 : PIPELINE_TYPE_FOR_CORE_1_KPU_8_INPUT_8;
    -- sfix(1, -12)
    signal core_1_kpu_8_input_9 : PIPELINE_TYPE_FOR_CORE_1_KPU_8_INPUT_9;
    -- sfix(1, -12)
    signal core_1_kpu_9_input_1 : PIPELINE_TYPE_FOR_CORE_1_KPU_9_INPUT_1;
    -- sfix(1, -12)
    signal core_1_kpu_9_input_2 : PIPELINE_TYPE_FOR_CORE_1_KPU_9_INPUT_2;
    -- sfix(1, -12)
    signal core_1_kpu_9_input_3 : PIPELINE_TYPE_FOR_CORE_1_KPU_9_INPUT_3;
    -- sfix(1, -12)
    signal core_1_kpu_9_input_4 : PIPELINE_TYPE_FOR_CORE_1_KPU_9_INPUT_4;
    -- sfix(1, -12)
    signal core_1_kpu_9_input_5 : PIPELINE_TYPE_FOR_CORE_1_KPU_9_INPUT_5;
    -- sfix(1, -12)
    signal core_1_kpu_9_input_6 : PIPELINE_TYPE_FOR_CORE_1_KPU_9_INPUT_6;
    -- sfix(1, -12)
    signal core_1_kpu_9_input_7 : PIPELINE_TYPE_FOR_CORE_1_KPU_9_INPUT_7;
    -- sfix(1, -12)
    signal core_1_kpu_9_input_8 : PIPELINE_TYPE_FOR_CORE_1_KPU_9_INPUT_8;
    -- sfix(1, -12)
    signal core_1_kpu_9_input_9 : PIPELINE_TYPE_FOR_CORE_1_KPU_9_INPUT_9;
    -- sfix(1, -12)
    signal core_1_kpu_10_input_1 : PIPELINE_TYPE_FOR_CORE_1_KPU_10_INPUT_1;
    -- sfix(1, -12)
    signal core_1_kpu_10_input_2 : PIPELINE_TYPE_FOR_CORE_1_KPU_10_INPUT_2;
    -- sfix(1, -12)
    signal core_1_kpu_10_input_3 : PIPELINE_TYPE_FOR_CORE_1_KPU_10_INPUT_3;
    -- sfix(1, -12)
    signal core_1_kpu_10_input_4 : PIPELINE_TYPE_FOR_CORE_1_KPU_10_INPUT_4;
    -- sfix(1, -12)
    signal core_1_kpu_10_input_5 : PIPELINE_TYPE_FOR_CORE_1_KPU_10_INPUT_5;
    -- sfix(1, -12)
    signal core_1_kpu_10_input_6 : PIPELINE_TYPE_FOR_CORE_1_KPU_10_INPUT_6;
    -- sfix(1, -12)
    signal core_1_kpu_10_input_7 : PIPELINE_TYPE_FOR_CORE_1_KPU_10_INPUT_7;
    -- sfix(1, -12)
    signal core_1_kpu_10_input_8 : PIPELINE_TYPE_FOR_CORE_1_KPU_10_INPUT_8;
    -- sfix(1, -12)
    signal core_1_kpu_10_input_9 : PIPELINE_TYPE_FOR_CORE_1_KPU_10_INPUT_9;
    -- sfix(1, -12)
    signal core_1_kpu_11_input_1 : PIPELINE_TYPE_FOR_CORE_1_KPU_11_INPUT_1;
    -- sfix(1, -12)
    signal core_1_kpu_11_input_2 : PIPELINE_TYPE_FOR_CORE_1_KPU_11_INPUT_2;
    -- sfix(1, -12)
    signal core_1_kpu_11_input_3 : PIPELINE_TYPE_FOR_CORE_1_KPU_11_INPUT_3;
    -- sfix(1, -12)
    signal core_1_kpu_11_input_4 : PIPELINE_TYPE_FOR_CORE_1_KPU_11_INPUT_4;
    -- sfix(1, -12)
    signal core_1_kpu_11_input_5 : PIPELINE_TYPE_FOR_CORE_1_KPU_11_INPUT_5;
    -- sfix(1, -12)
    signal core_1_kpu_11_input_6 : PIPELINE_TYPE_FOR_CORE_1_KPU_11_INPUT_6;
    -- sfix(1, -12)
    signal core_1_kpu_11_input_7 : PIPELINE_TYPE_FOR_CORE_1_KPU_11_INPUT_7;
    -- sfix(1, -12)
    signal core_1_kpu_11_input_8 : PIPELINE_TYPE_FOR_CORE_1_KPU_11_INPUT_8;
    -- sfix(1, -12)
    signal core_1_kpu_11_input_9 : PIPELINE_TYPE_FOR_CORE_1_KPU_11_INPUT_9;
    -- sfix(3, -12)
    signal core_1_kpu_12_input_1 : PIPELINE_TYPE_FOR_CORE_1_KPU_12_INPUT_1;
    -- sfix(3, -12)
    signal core_1_kpu_12_input_2 : PIPELINE_TYPE_FOR_CORE_1_KPU_12_INPUT_2;
    -- sfix(-1, -12)
    signal core_1_kpu_12_input_3 : PIPELINE_TYPE_FOR_CORE_1_KPU_12_INPUT_3;
    -- sfix(3, -12)
    signal core_1_kpu_12_input_4 : PIPELINE_TYPE_FOR_CORE_1_KPU_12_INPUT_4;
    -- sfix(3, -12)
    signal core_1_kpu_12_input_5 : PIPELINE_TYPE_FOR_CORE_1_KPU_12_INPUT_5;
    -- sfix(-2, -12)
    signal core_1_kpu_12_input_6 : PIPELINE_TYPE_FOR_CORE_1_KPU_12_INPUT_6;
    -- sfix(0, -12)
    signal core_1_kpu_12_input_7 : PIPELINE_TYPE_FOR_CORE_1_KPU_12_INPUT_7;
    -- sfix(1, -12)
    signal core_1_kpu_12_input_8 : PIPELINE_TYPE_FOR_CORE_1_KPU_12_INPUT_8;
    -- sfix(0, -12)
    signal core_1_kpu_12_input_9 : PIPELINE_TYPE_FOR_CORE_1_KPU_12_INPUT_9;
    -- sfix(2, -12)
    signal core_1_kpu_13_input_1 : PIPELINE_TYPE_FOR_CORE_1_KPU_13_INPUT_1;
    -- sfix(2, -12)
    signal core_1_kpu_13_input_2 : PIPELINE_TYPE_FOR_CORE_1_KPU_13_INPUT_2;
    -- sfix(2, -12)
    signal core_1_kpu_13_input_3 : PIPELINE_TYPE_FOR_CORE_1_KPU_13_INPUT_3;
    -- sfix(3, -12)
    signal core_1_kpu_13_input_4 : PIPELINE_TYPE_FOR_CORE_1_KPU_13_INPUT_4;
    -- sfix(3, -12)
    signal core_1_kpu_13_input_5 : PIPELINE_TYPE_FOR_CORE_1_KPU_13_INPUT_5;
    -- sfix(2, -12)
    signal core_1_kpu_13_input_6 : PIPELINE_TYPE_FOR_CORE_1_KPU_13_INPUT_6;
    -- sfix(1, -12)
    signal core_1_kpu_13_input_7 : PIPELINE_TYPE_FOR_CORE_1_KPU_13_INPUT_7;
    -- sfix(2, -12)
    signal core_1_kpu_13_input_8 : PIPELINE_TYPE_FOR_CORE_1_KPU_13_INPUT_8;
    -- sfix(1, -12)
    signal core_1_kpu_13_input_9 : PIPELINE_TYPE_FOR_CORE_1_KPU_13_INPUT_9;
    -- sfix(0, -12)
    signal core_1_kpu_14_input_1 : PIPELINE_TYPE_FOR_CORE_1_KPU_14_INPUT_1;
    -- sfix(0, -12)
    signal core_1_kpu_14_input_2 : PIPELINE_TYPE_FOR_CORE_1_KPU_14_INPUT_2;
    -- sfix(-1, -12)
    signal core_1_kpu_14_input_3 : PIPELINE_TYPE_FOR_CORE_1_KPU_14_INPUT_3;
    -- sfix(0, -12)
    signal core_1_kpu_14_input_4 : PIPELINE_TYPE_FOR_CORE_1_KPU_14_INPUT_4;
    -- sfix(1, -12)
    signal core_1_kpu_14_input_5 : PIPELINE_TYPE_FOR_CORE_1_KPU_14_INPUT_5;
    -- sfix(1, -12)
    signal core_1_kpu_14_input_6 : PIPELINE_TYPE_FOR_CORE_1_KPU_14_INPUT_6;
    -- sfix(0, -12)
    signal core_1_kpu_14_input_7 : PIPELINE_TYPE_FOR_CORE_1_KPU_14_INPUT_7;
    -- sfix(0, -12)
    signal core_1_kpu_14_input_8 : PIPELINE_TYPE_FOR_CORE_1_KPU_14_INPUT_8;
    -- sfix(-3, -12)
    signal core_1_kpu_14_input_9 : PIPELINE_TYPE_FOR_CORE_1_KPU_14_INPUT_9;
    -- sfix(-3, -12)
    signal core_1_kpu_15_input_1 : PIPELINE_TYPE_FOR_CORE_1_KPU_15_INPUT_1;
    -- sfix(1, -12)
    signal core_1_kpu_15_input_2 : PIPELINE_TYPE_FOR_CORE_1_KPU_15_INPUT_2;
    -- sfix(-3, -12)
    signal core_1_kpu_15_input_3 : PIPELINE_TYPE_FOR_CORE_1_KPU_15_INPUT_3;
    -- sfix(-3, -12)
    signal core_1_kpu_15_input_4 : PIPELINE_TYPE_FOR_CORE_1_KPU_15_INPUT_4;
    -- sfix(-3, -12)
    signal core_1_kpu_15_input_5 : PIPELINE_TYPE_FOR_CORE_1_KPU_15_INPUT_5;
    -- sfix(-3, -12)
    signal core_1_kpu_15_input_6 : PIPELINE_TYPE_FOR_CORE_1_KPU_15_INPUT_6;
    -- sfix(-3, -12)
    signal core_1_kpu_15_input_7 : PIPELINE_TYPE_FOR_CORE_1_KPU_15_INPUT_7;
    -- sfix(1, -12)
    signal core_1_kpu_15_input_8 : PIPELINE_TYPE_FOR_CORE_1_KPU_15_INPUT_8;
    -- sfix(1, -12)
    signal core_1_kpu_15_input_9 : PIPELINE_TYPE_FOR_CORE_1_KPU_15_INPUT_9;
    -- sfix(0, -12)
    signal core_1_kpu_16_input_1 : PIPELINE_TYPE_FOR_CORE_1_KPU_16_INPUT_1;
    -- sfix(0, -12)
    signal core_1_kpu_16_input_2 : PIPELINE_TYPE_FOR_CORE_1_KPU_16_INPUT_2;
    -- sfix(-2, -12)
    signal core_1_kpu_16_input_3 : PIPELINE_TYPE_FOR_CORE_1_KPU_16_INPUT_3;
    -- sfix(2, -12)
    signal core_1_kpu_16_input_4 : PIPELINE_TYPE_FOR_CORE_1_KPU_16_INPUT_4;
    -- sfix(2, -12)
    signal core_1_kpu_16_input_5 : PIPELINE_TYPE_FOR_CORE_1_KPU_16_INPUT_5;
    -- sfix(-1, -12)
    signal core_1_kpu_16_input_6 : PIPELINE_TYPE_FOR_CORE_1_KPU_16_INPUT_6;
    -- sfix(0, -12)
    signal core_1_kpu_16_input_7 : PIPELINE_TYPE_FOR_CORE_1_KPU_16_INPUT_7;
    -- sfix(1, -12)
    signal core_1_kpu_16_input_8 : PIPELINE_TYPE_FOR_CORE_1_KPU_16_INPUT_8;
    -- sfix(-2, -12)
    signal core_1_kpu_16_input_9 : PIPELINE_TYPE_FOR_CORE_1_KPU_16_INPUT_9;
    -- sfix(1, -12)
    signal core_1_kpu_17_input_1 : PIPELINE_TYPE_FOR_CORE_1_KPU_17_INPUT_1;
    -- sfix(3, -12)
    signal core_1_kpu_17_input_2 : PIPELINE_TYPE_FOR_CORE_1_KPU_17_INPUT_2;
    -- sfix(-1, -12)
    signal core_1_kpu_17_input_3 : PIPELINE_TYPE_FOR_CORE_1_KPU_17_INPUT_3;
    -- sfix(-1, -12)
    signal core_1_kpu_17_input_4 : PIPELINE_TYPE_FOR_CORE_1_KPU_17_INPUT_4;
    -- sfix(2, -12)
    signal core_1_kpu_17_input_5 : PIPELINE_TYPE_FOR_CORE_1_KPU_17_INPUT_5;
    -- sfix(1, -12)
    signal core_1_kpu_17_input_6 : PIPELINE_TYPE_FOR_CORE_1_KPU_17_INPUT_6;
    -- sfix(0, -12)
    signal core_1_kpu_17_input_7 : PIPELINE_TYPE_FOR_CORE_1_KPU_17_INPUT_7;
    -- sfix(-2, -12)
    signal core_1_kpu_17_input_8 : PIPELINE_TYPE_FOR_CORE_1_KPU_17_INPUT_8;
    -- sfix(-1, -12)
    signal core_1_kpu_17_input_9 : PIPELINE_TYPE_FOR_CORE_1_KPU_17_INPUT_9;
    -- sfix(2, -12)
    signal core_1_kpu_18_input_1 : PIPELINE_TYPE_FOR_CORE_1_KPU_18_INPUT_1;
    -- sfix(1, -12)
    signal core_1_kpu_18_input_2 : PIPELINE_TYPE_FOR_CORE_1_KPU_18_INPUT_2;
    -- sfix(1, -12)
    signal core_1_kpu_18_input_3 : PIPELINE_TYPE_FOR_CORE_1_KPU_18_INPUT_3;
    -- sfix(1, -12)
    signal core_1_kpu_18_input_4 : PIPELINE_TYPE_FOR_CORE_1_KPU_18_INPUT_4;
    -- sfix(1, -12)
    signal core_1_kpu_18_input_5 : PIPELINE_TYPE_FOR_CORE_1_KPU_18_INPUT_5;
    -- sfix(0, -12)
    signal core_1_kpu_18_input_6 : PIPELINE_TYPE_FOR_CORE_1_KPU_18_INPUT_6;
    -- sfix(0, -12)
    signal core_1_kpu_18_input_7 : PIPELINE_TYPE_FOR_CORE_1_KPU_18_INPUT_7;
    -- sfix(0, -12)
    signal core_1_kpu_18_input_8 : PIPELINE_TYPE_FOR_CORE_1_KPU_18_INPUT_8;
    -- sfix(0, -12)
    signal core_1_kpu_18_input_9 : PIPELINE_TYPE_FOR_CORE_1_KPU_18_INPUT_9;
    -- sfix(2, -12)
    signal core_1_kpu_19_input_1 : PIPELINE_TYPE_FOR_CORE_1_KPU_19_INPUT_1;
    -- sfix(3, -12)
    signal core_1_kpu_19_input_2 : PIPELINE_TYPE_FOR_CORE_1_KPU_19_INPUT_2;
    -- sfix(3, -12)
    signal core_1_kpu_19_input_3 : PIPELINE_TYPE_FOR_CORE_1_KPU_19_INPUT_3;
    -- sfix(3, -12)
    signal core_1_kpu_19_input_4 : PIPELINE_TYPE_FOR_CORE_1_KPU_19_INPUT_4;
    -- sfix(3, -12)
    signal core_1_kpu_19_input_5 : PIPELINE_TYPE_FOR_CORE_1_KPU_19_INPUT_5;
    -- sfix(3, -12)
    signal core_1_kpu_19_input_6 : PIPELINE_TYPE_FOR_CORE_1_KPU_19_INPUT_6;
    -- sfix(3, -12)
    signal core_1_kpu_19_input_7 : PIPELINE_TYPE_FOR_CORE_1_KPU_19_INPUT_7;
    -- sfix(3, -12)
    signal core_1_kpu_19_input_8 : PIPELINE_TYPE_FOR_CORE_1_KPU_19_INPUT_8;
    -- sfix(2, -12)
    signal core_1_kpu_19_input_9 : PIPELINE_TYPE_FOR_CORE_1_KPU_19_INPUT_9;
    -- sfix(0, -12)
    signal core_1_kpu_20_input_1 : PIPELINE_TYPE_FOR_CORE_1_KPU_20_INPUT_1;
    -- sfix(0, -12)
    signal core_1_kpu_20_input_2 : PIPELINE_TYPE_FOR_CORE_1_KPU_20_INPUT_2;
    -- sfix(1, -12)
    signal core_1_kpu_20_input_3 : PIPELINE_TYPE_FOR_CORE_1_KPU_20_INPUT_3;
    -- sfix(1, -12)
    signal core_1_kpu_20_input_4 : PIPELINE_TYPE_FOR_CORE_1_KPU_20_INPUT_4;
    -- sfix(2, -12)
    signal core_1_kpu_20_input_5 : PIPELINE_TYPE_FOR_CORE_1_KPU_20_INPUT_5;
    -- sfix(-1, -12)
    signal core_1_kpu_20_input_6 : PIPELINE_TYPE_FOR_CORE_1_KPU_20_INPUT_6;
    -- sfix(1, -12)
    signal core_1_kpu_20_input_7 : PIPELINE_TYPE_FOR_CORE_1_KPU_20_INPUT_7;
    -- sfix(1, -12)
    signal core_1_kpu_20_input_8 : PIPELINE_TYPE_FOR_CORE_1_KPU_20_INPUT_8;
    -- sfix(0, -12)
    signal core_1_kpu_20_input_9 : PIPELINE_TYPE_FOR_CORE_1_KPU_20_INPUT_9;
    -- sfix(1, -12)
    signal core_1_kpu_21_input_1 : PIPELINE_TYPE_FOR_CORE_1_KPU_21_INPUT_1;
    -- sfix(1, -12)
    signal core_1_kpu_21_input_2 : PIPELINE_TYPE_FOR_CORE_1_KPU_21_INPUT_2;
    -- sfix(1, -12)
    signal core_1_kpu_21_input_3 : PIPELINE_TYPE_FOR_CORE_1_KPU_21_INPUT_3;
    -- sfix(1, -12)
    signal core_1_kpu_21_input_4 : PIPELINE_TYPE_FOR_CORE_1_KPU_21_INPUT_4;
    -- sfix(1, -12)
    signal core_1_kpu_21_input_5 : PIPELINE_TYPE_FOR_CORE_1_KPU_21_INPUT_5;
    -- sfix(1, -12)
    signal core_1_kpu_21_input_6 : PIPELINE_TYPE_FOR_CORE_1_KPU_21_INPUT_6;
    -- sfix(1, -12)
    signal core_1_kpu_21_input_7 : PIPELINE_TYPE_FOR_CORE_1_KPU_21_INPUT_7;
    -- sfix(1, -12)
    signal core_1_kpu_21_input_8 : PIPELINE_TYPE_FOR_CORE_1_KPU_21_INPUT_8;
    -- sfix(1, -12)
    signal core_1_kpu_21_input_9 : PIPELINE_TYPE_FOR_CORE_1_KPU_21_INPUT_9;
    -- sfix(1, -12)
    signal core_1_kpu_22_input_1 : PIPELINE_TYPE_FOR_CORE_1_KPU_22_INPUT_1;
    -- sfix(3, -12)
    signal core_1_kpu_22_input_2 : PIPELINE_TYPE_FOR_CORE_1_KPU_22_INPUT_2;
    -- sfix(2, -12)
    signal core_1_kpu_22_input_3 : PIPELINE_TYPE_FOR_CORE_1_KPU_22_INPUT_3;
    -- sfix(3, -12)
    signal core_1_kpu_22_input_4 : PIPELINE_TYPE_FOR_CORE_1_KPU_22_INPUT_4;
    -- sfix(2, -12)
    signal core_1_kpu_22_input_5 : PIPELINE_TYPE_FOR_CORE_1_KPU_22_INPUT_5;
    -- sfix(3, -12)
    signal core_1_kpu_22_input_6 : PIPELINE_TYPE_FOR_CORE_1_KPU_22_INPUT_6;
    -- sfix(2, -12)
    signal core_1_kpu_22_input_7 : PIPELINE_TYPE_FOR_CORE_1_KPU_22_INPUT_7;
    -- sfix(1, -12)
    signal core_1_kpu_22_input_8 : PIPELINE_TYPE_FOR_CORE_1_KPU_22_INPUT_8;
    -- sfix(2, -12)
    signal core_1_kpu_22_input_9 : PIPELINE_TYPE_FOR_CORE_1_KPU_22_INPUT_9;
    -- sfix(1, -12)
    signal core_1_kpu_23_input_1 : PIPELINE_TYPE_FOR_CORE_1_KPU_23_INPUT_1;
    -- sfix(1, -12)
    signal core_1_kpu_23_input_2 : PIPELINE_TYPE_FOR_CORE_1_KPU_23_INPUT_2;
    -- sfix(1, -12)
    signal core_1_kpu_23_input_3 : PIPELINE_TYPE_FOR_CORE_1_KPU_23_INPUT_3;
    -- sfix(1, -12)
    signal core_1_kpu_23_input_4 : PIPELINE_TYPE_FOR_CORE_1_KPU_23_INPUT_4;
    -- sfix(1, -12)
    signal core_1_kpu_23_input_5 : PIPELINE_TYPE_FOR_CORE_1_KPU_23_INPUT_5;
    -- sfix(1, -12)
    signal core_1_kpu_23_input_6 : PIPELINE_TYPE_FOR_CORE_1_KPU_23_INPUT_6;
    -- sfix(1, -12)
    signal core_1_kpu_23_input_7 : PIPELINE_TYPE_FOR_CORE_1_KPU_23_INPUT_7;
    -- sfix(1, -12)
    signal core_1_kpu_23_input_8 : PIPELINE_TYPE_FOR_CORE_1_KPU_23_INPUT_8;
    -- sfix(1, -12)
    signal core_1_kpu_23_input_9 : PIPELINE_TYPE_FOR_CORE_1_KPU_23_INPUT_9;
    -- sfix(1, -12)
    signal core_1_kpu_24_input_1 : PIPELINE_TYPE_FOR_CORE_1_KPU_24_INPUT_1;
    -- sfix(1, -12)
    signal core_1_kpu_24_input_2 : PIPELINE_TYPE_FOR_CORE_1_KPU_24_INPUT_2;
    -- sfix(1, -12)
    signal core_1_kpu_24_input_3 : PIPELINE_TYPE_FOR_CORE_1_KPU_24_INPUT_3;
    -- sfix(1, -12)
    signal core_1_kpu_24_input_4 : PIPELINE_TYPE_FOR_CORE_1_KPU_24_INPUT_4;
    -- sfix(0, -12)
    signal core_1_kpu_24_input_5 : PIPELINE_TYPE_FOR_CORE_1_KPU_24_INPUT_5;
    -- sfix(1, -12)
    signal core_1_kpu_24_input_6 : PIPELINE_TYPE_FOR_CORE_1_KPU_24_INPUT_6;
    -- sfix(-1, -12)
    signal core_1_kpu_24_input_7 : PIPELINE_TYPE_FOR_CORE_1_KPU_24_INPUT_7;
    -- sfix(-1, -12)
    signal core_1_kpu_24_input_8 : PIPELINE_TYPE_FOR_CORE_1_KPU_24_INPUT_8;
    -- sfix(1, -12)
    signal core_1_kpu_24_input_9 : PIPELINE_TYPE_FOR_CORE_1_KPU_24_INPUT_9;
    -- sfix(1, -12)
    signal core_1_kpu_25_input_1 : PIPELINE_TYPE_FOR_CORE_1_KPU_25_INPUT_1;
    -- sfix(1, -12)
    signal core_1_kpu_25_input_2 : PIPELINE_TYPE_FOR_CORE_1_KPU_25_INPUT_2;
    -- sfix(1, -12)
    signal core_1_kpu_25_input_3 : PIPELINE_TYPE_FOR_CORE_1_KPU_25_INPUT_3;
    -- sfix(1, -12)
    signal core_1_kpu_25_input_4 : PIPELINE_TYPE_FOR_CORE_1_KPU_25_INPUT_4;
    -- sfix(1, -12)
    signal core_1_kpu_25_input_5 : PIPELINE_TYPE_FOR_CORE_1_KPU_25_INPUT_5;
    -- sfix(1, -12)
    signal core_1_kpu_25_input_6 : PIPELINE_TYPE_FOR_CORE_1_KPU_25_INPUT_6;
    -- sfix(1, -12)
    signal core_1_kpu_25_input_7 : PIPELINE_TYPE_FOR_CORE_1_KPU_25_INPUT_7;
    -- sfix(1, -12)
    signal core_1_kpu_25_input_8 : PIPELINE_TYPE_FOR_CORE_1_KPU_25_INPUT_8;
    -- sfix(1, -12)
    signal core_1_kpu_25_input_9 : PIPELINE_TYPE_FOR_CORE_1_KPU_25_INPUT_9;
    -- sfix(-2, -12)
    signal core_1_kpu_26_input_1 : PIPELINE_TYPE_FOR_CORE_1_KPU_26_INPUT_1;
    -- sfix(-2, -12)
    signal core_1_kpu_26_input_2 : PIPELINE_TYPE_FOR_CORE_1_KPU_26_INPUT_2;
    -- sfix(-1, -12)
    signal core_1_kpu_26_input_3 : PIPELINE_TYPE_FOR_CORE_1_KPU_26_INPUT_3;
    -- sfix(-1, -12)
    signal core_1_kpu_26_input_4 : PIPELINE_TYPE_FOR_CORE_1_KPU_26_INPUT_4;
    -- sfix(1, -12)
    signal core_1_kpu_26_input_5 : PIPELINE_TYPE_FOR_CORE_1_KPU_26_INPUT_5;
    -- sfix(0, -12)
    signal core_1_kpu_26_input_6 : PIPELINE_TYPE_FOR_CORE_1_KPU_26_INPUT_6;
    -- sfix(-3, -12)
    signal core_1_kpu_26_input_7 : PIPELINE_TYPE_FOR_CORE_1_KPU_26_INPUT_7;
    -- sfix(-1, -12)
    signal core_1_kpu_26_input_8 : PIPELINE_TYPE_FOR_CORE_1_KPU_26_INPUT_8;
    -- sfix(-1, -12)
    signal core_1_kpu_26_input_9 : PIPELINE_TYPE_FOR_CORE_1_KPU_26_INPUT_9;
    -- sfix(-1, -12)
    signal core_1_kpu_27_input_1 : PIPELINE_TYPE_FOR_CORE_1_KPU_27_INPUT_1;
    -- sfix(0, -12)
    signal core_1_kpu_27_input_2 : PIPELINE_TYPE_FOR_CORE_1_KPU_27_INPUT_2;
    -- sfix(-1, -12)
    signal core_1_kpu_27_input_3 : PIPELINE_TYPE_FOR_CORE_1_KPU_27_INPUT_3;
    -- sfix(0, -12)
    signal core_1_kpu_27_input_4 : PIPELINE_TYPE_FOR_CORE_1_KPU_27_INPUT_4;
    -- sfix(0, -12)
    signal core_1_kpu_27_input_5 : PIPELINE_TYPE_FOR_CORE_1_KPU_27_INPUT_5;
    -- sfix(0, -12)
    signal core_1_kpu_27_input_6 : PIPELINE_TYPE_FOR_CORE_1_KPU_27_INPUT_6;
    -- sfix(-1, -12)
    signal core_1_kpu_27_input_7 : PIPELINE_TYPE_FOR_CORE_1_KPU_27_INPUT_7;
    -- sfix(0, -12)
    signal core_1_kpu_27_input_8 : PIPELINE_TYPE_FOR_CORE_1_KPU_27_INPUT_8;
    -- sfix(-1, -12)
    signal core_1_kpu_27_input_9 : PIPELINE_TYPE_FOR_CORE_1_KPU_27_INPUT_9;
    -- sfix(1, -12)
    signal core_1_kpu_28_input_1 : PIPELINE_TYPE_FOR_CORE_1_KPU_28_INPUT_1;
    -- sfix(1, -12)
    signal core_1_kpu_28_input_2 : PIPELINE_TYPE_FOR_CORE_1_KPU_28_INPUT_2;
    -- sfix(1, -12)
    signal core_1_kpu_28_input_3 : PIPELINE_TYPE_FOR_CORE_1_KPU_28_INPUT_3;
    -- sfix(1, -12)
    signal core_1_kpu_28_input_4 : PIPELINE_TYPE_FOR_CORE_1_KPU_28_INPUT_4;
    -- sfix(1, -12)
    signal core_1_kpu_28_input_5 : PIPELINE_TYPE_FOR_CORE_1_KPU_28_INPUT_5;
    -- sfix(1, -12)
    signal core_1_kpu_28_input_6 : PIPELINE_TYPE_FOR_CORE_1_KPU_28_INPUT_6;
    -- sfix(1, -12)
    signal core_1_kpu_28_input_7 : PIPELINE_TYPE_FOR_CORE_1_KPU_28_INPUT_7;
    -- sfix(1, -12)
    signal core_1_kpu_28_input_8 : PIPELINE_TYPE_FOR_CORE_1_KPU_28_INPUT_8;
    -- sfix(1, -12)
    signal core_1_kpu_28_input_9 : PIPELINE_TYPE_FOR_CORE_1_KPU_28_INPUT_9;
    -- sfix(3, -12)
    signal core_1_kpu_29_input_1 : PIPELINE_TYPE_FOR_CORE_1_KPU_29_INPUT_1;
    -- sfix(3, -12)
    signal core_1_kpu_29_input_2 : PIPELINE_TYPE_FOR_CORE_1_KPU_29_INPUT_2;
    -- sfix(2, -12)
    signal core_1_kpu_29_input_3 : PIPELINE_TYPE_FOR_CORE_1_KPU_29_INPUT_3;
    -- sfix(3, -12)
    signal core_1_kpu_29_input_4 : PIPELINE_TYPE_FOR_CORE_1_KPU_29_INPUT_4;
    -- sfix(0, -12)
    signal core_1_kpu_29_input_5 : PIPELINE_TYPE_FOR_CORE_1_KPU_29_INPUT_5;
    -- sfix(-2, -12)
    signal core_1_kpu_29_input_6 : PIPELINE_TYPE_FOR_CORE_1_KPU_29_INPUT_6;
    -- sfix(2, -12)
    signal core_1_kpu_29_input_7 : PIPELINE_TYPE_FOR_CORE_1_KPU_29_INPUT_7;
    -- sfix(3, -12)
    signal core_1_kpu_29_input_8 : PIPELINE_TYPE_FOR_CORE_1_KPU_29_INPUT_8;
    -- sfix(2, -12)
    signal core_1_kpu_29_input_9 : PIPELINE_TYPE_FOR_CORE_1_KPU_29_INPUT_9;
    -- sfix(0, -12)
    signal core_1_kpu_30_input_1 : PIPELINE_TYPE_FOR_CORE_1_KPU_30_INPUT_1;
    -- sfix(-2, -12)
    signal core_1_kpu_30_input_2 : PIPELINE_TYPE_FOR_CORE_1_KPU_30_INPUT_2;
    -- sfix(-1, -12)
    signal core_1_kpu_30_input_3 : PIPELINE_TYPE_FOR_CORE_1_KPU_30_INPUT_3;
    -- sfix(-3, -12)
    signal core_1_kpu_30_input_4 : PIPELINE_TYPE_FOR_CORE_1_KPU_30_INPUT_4;
    -- sfix(-2, -12)
    signal core_1_kpu_30_input_5 : PIPELINE_TYPE_FOR_CORE_1_KPU_30_INPUT_5;
    -- sfix(-1, -12)
    signal core_1_kpu_30_input_6 : PIPELINE_TYPE_FOR_CORE_1_KPU_30_INPUT_6;
    -- sfix(-1, -12)
    signal core_1_kpu_30_input_7 : PIPELINE_TYPE_FOR_CORE_1_KPU_30_INPUT_7;
    -- sfix(0, -12)
    signal core_1_kpu_30_input_8 : PIPELINE_TYPE_FOR_CORE_1_KPU_30_INPUT_8;
    -- sfix(0, -12)
    signal core_1_kpu_30_input_9 : PIPELINE_TYPE_FOR_CORE_1_KPU_30_INPUT_9;
    -- sfix(1, -12)
    signal core_1_kpu_31_input_1 : PIPELINE_TYPE_FOR_CORE_1_KPU_31_INPUT_1;
    -- sfix(1, -12)
    signal core_1_kpu_31_input_2 : PIPELINE_TYPE_FOR_CORE_1_KPU_31_INPUT_2;
    -- sfix(1, -12)
    signal core_1_kpu_31_input_3 : PIPELINE_TYPE_FOR_CORE_1_KPU_31_INPUT_3;
    -- sfix(1, -12)
    signal core_1_kpu_31_input_4 : PIPELINE_TYPE_FOR_CORE_1_KPU_31_INPUT_4;
    -- sfix(1, -12)
    signal core_1_kpu_31_input_5 : PIPELINE_TYPE_FOR_CORE_1_KPU_31_INPUT_5;
    -- sfix(1, -12)
    signal core_1_kpu_31_input_6 : PIPELINE_TYPE_FOR_CORE_1_KPU_31_INPUT_6;
    -- sfix(1, -12)
    signal core_1_kpu_31_input_7 : PIPELINE_TYPE_FOR_CORE_1_KPU_31_INPUT_7;
    -- sfix(1, -12)
    signal core_1_kpu_31_input_8 : PIPELINE_TYPE_FOR_CORE_1_KPU_31_INPUT_8;
    -- sfix(1, -12)
    signal core_1_kpu_31_input_9 : PIPELINE_TYPE_FOR_CORE_1_KPU_31_INPUT_9;
    -- sfix(0, -12)
    signal core_1_kpu_32_input_1 : PIPELINE_TYPE_FOR_CORE_1_KPU_32_INPUT_1;
    -- sfix(2, -12)
    signal core_1_kpu_32_input_2 : PIPELINE_TYPE_FOR_CORE_1_KPU_32_INPUT_2;
    -- sfix(2, -12)
    signal core_1_kpu_32_input_3 : PIPELINE_TYPE_FOR_CORE_1_KPU_32_INPUT_3;
    -- sfix(-3, -12)
    signal core_1_kpu_32_input_4 : PIPELINE_TYPE_FOR_CORE_1_KPU_32_INPUT_4;
    -- sfix(-2, -12)
    signal core_1_kpu_32_input_5 : PIPELINE_TYPE_FOR_CORE_1_KPU_32_INPUT_5;
    -- sfix(-1, -12)
    signal core_1_kpu_32_input_6 : PIPELINE_TYPE_FOR_CORE_1_KPU_32_INPUT_6;
    -- sfix(1, -12)
    signal core_1_kpu_32_input_7 : PIPELINE_TYPE_FOR_CORE_1_KPU_32_INPUT_7;
    -- sfix(-3, -12)
    signal core_1_kpu_32_input_8 : PIPELINE_TYPE_FOR_CORE_1_KPU_32_INPUT_8;
    -- sfix(-3, -12)
    signal core_1_kpu_32_input_9 : PIPELINE_TYPE_FOR_CORE_1_KPU_32_INPUT_9;
 
    -- sfix(1, -12)
    signal core_2_kpu_1_input_1 : PIPELINE_TYPE_FOR_CORE_2_KPU_1_INPUT_1;
    -- sfix(1, -12)
    signal core_2_kpu_1_input_2 : PIPELINE_TYPE_FOR_CORE_2_KPU_1_INPUT_2;
    -- sfix(1, -12)
    signal core_2_kpu_1_input_3 : PIPELINE_TYPE_FOR_CORE_2_KPU_1_INPUT_3;
    -- sfix(1, -12)
    signal core_2_kpu_1_input_4 : PIPELINE_TYPE_FOR_CORE_2_KPU_1_INPUT_4;
    -- sfix(1, -12)
    signal core_2_kpu_1_input_5 : PIPELINE_TYPE_FOR_CORE_2_KPU_1_INPUT_5;
    -- sfix(1, -12)
    signal core_2_kpu_1_input_6 : PIPELINE_TYPE_FOR_CORE_2_KPU_1_INPUT_6;
    -- sfix(1, -12)
    signal core_2_kpu_1_input_7 : PIPELINE_TYPE_FOR_CORE_2_KPU_1_INPUT_7;
    -- sfix(1, -12)
    signal core_2_kpu_1_input_8 : PIPELINE_TYPE_FOR_CORE_2_KPU_1_INPUT_8;
    -- sfix(1, -12)
    signal core_2_kpu_1_input_9 : PIPELINE_TYPE_FOR_CORE_2_KPU_1_INPUT_9;
    -- sfix(1, -12)
    signal core_2_kpu_2_input_1 : PIPELINE_TYPE_FOR_CORE_2_KPU_2_INPUT_1;
    -- sfix(1, -12)
    signal core_2_kpu_2_input_2 : PIPELINE_TYPE_FOR_CORE_2_KPU_2_INPUT_2;
    -- sfix(-1, -12)
    signal core_2_kpu_2_input_3 : PIPELINE_TYPE_FOR_CORE_2_KPU_2_INPUT_3;
    -- sfix(-3, -12)
    signal core_2_kpu_2_input_4 : PIPELINE_TYPE_FOR_CORE_2_KPU_2_INPUT_4;
    -- sfix(-1, -12)
    signal core_2_kpu_2_input_5 : PIPELINE_TYPE_FOR_CORE_2_KPU_2_INPUT_5;
    -- sfix(-2, -12)
    signal core_2_kpu_2_input_6 : PIPELINE_TYPE_FOR_CORE_2_KPU_2_INPUT_6;
    -- sfix(-3, -12)
    signal core_2_kpu_2_input_7 : PIPELINE_TYPE_FOR_CORE_2_KPU_2_INPUT_7;
    -- sfix(-2, -12)
    signal core_2_kpu_2_input_8 : PIPELINE_TYPE_FOR_CORE_2_KPU_2_INPUT_8;
    -- sfix(1, -12)
    signal core_2_kpu_2_input_9 : PIPELINE_TYPE_FOR_CORE_2_KPU_2_INPUT_9;
    -- sfix(0, -12)
    signal core_2_kpu_3_input_1 : PIPELINE_TYPE_FOR_CORE_2_KPU_3_INPUT_1;
    -- sfix(1, -12)
    signal core_2_kpu_3_input_2 : PIPELINE_TYPE_FOR_CORE_2_KPU_3_INPUT_2;
    -- sfix(-2, -12)
    signal core_2_kpu_3_input_3 : PIPELINE_TYPE_FOR_CORE_2_KPU_3_INPUT_3;
    -- sfix(1, -12)
    signal core_2_kpu_3_input_4 : PIPELINE_TYPE_FOR_CORE_2_KPU_3_INPUT_4;
    -- sfix(1, -12)
    signal core_2_kpu_3_input_5 : PIPELINE_TYPE_FOR_CORE_2_KPU_3_INPUT_5;
    -- sfix(0, -12)
    signal core_2_kpu_3_input_6 : PIPELINE_TYPE_FOR_CORE_2_KPU_3_INPUT_6;
    -- sfix(0, -12)
    signal core_2_kpu_3_input_7 : PIPELINE_TYPE_FOR_CORE_2_KPU_3_INPUT_7;
    -- sfix(0, -12)
    signal core_2_kpu_3_input_8 : PIPELINE_TYPE_FOR_CORE_2_KPU_3_INPUT_8;
    -- sfix(-2, -12)
    signal core_2_kpu_3_input_9 : PIPELINE_TYPE_FOR_CORE_2_KPU_3_INPUT_9;
    -- sfix(1, -12)
    signal core_2_kpu_4_input_1 : PIPELINE_TYPE_FOR_CORE_2_KPU_4_INPUT_1;
    -- sfix(1, -12)
    signal core_2_kpu_4_input_2 : PIPELINE_TYPE_FOR_CORE_2_KPU_4_INPUT_2;
    -- sfix(1, -12)
    signal core_2_kpu_4_input_3 : PIPELINE_TYPE_FOR_CORE_2_KPU_4_INPUT_3;
    -- sfix(1, -12)
    signal core_2_kpu_4_input_4 : PIPELINE_TYPE_FOR_CORE_2_KPU_4_INPUT_4;
    -- sfix(1, -12)
    signal core_2_kpu_4_input_5 : PIPELINE_TYPE_FOR_CORE_2_KPU_4_INPUT_5;
    -- sfix(1, -12)
    signal core_2_kpu_4_input_6 : PIPELINE_TYPE_FOR_CORE_2_KPU_4_INPUT_6;
    -- sfix(1, -12)
    signal core_2_kpu_4_input_7 : PIPELINE_TYPE_FOR_CORE_2_KPU_4_INPUT_7;
    -- sfix(1, -12)
    signal core_2_kpu_4_input_8 : PIPELINE_TYPE_FOR_CORE_2_KPU_4_INPUT_8;
    -- sfix(1, -12)
    signal core_2_kpu_4_input_9 : PIPELINE_TYPE_FOR_CORE_2_KPU_4_INPUT_9;
    -- sfix(-2, -12)
    signal core_2_kpu_5_input_1 : PIPELINE_TYPE_FOR_CORE_2_KPU_5_INPUT_1;
    -- sfix(0, -12)
    signal core_2_kpu_5_input_2 : PIPELINE_TYPE_FOR_CORE_2_KPU_5_INPUT_2;
    -- sfix(3, -12)
    signal core_2_kpu_5_input_3 : PIPELINE_TYPE_FOR_CORE_2_KPU_5_INPUT_3;
    -- sfix(-2, -12)
    signal core_2_kpu_5_input_4 : PIPELINE_TYPE_FOR_CORE_2_KPU_5_INPUT_4;
    -- sfix(4, -12)
    signal core_2_kpu_5_input_5 : PIPELINE_TYPE_FOR_CORE_2_KPU_5_INPUT_5;
    -- sfix(2, -12)
    signal core_2_kpu_5_input_6 : PIPELINE_TYPE_FOR_CORE_2_KPU_5_INPUT_6;
    -- sfix(1, -12)
    signal core_2_kpu_5_input_7 : PIPELINE_TYPE_FOR_CORE_2_KPU_5_INPUT_7;
    -- sfix(2, -12)
    signal core_2_kpu_5_input_8 : PIPELINE_TYPE_FOR_CORE_2_KPU_5_INPUT_8;
    -- sfix(1, -12)
    signal core_2_kpu_5_input_9 : PIPELINE_TYPE_FOR_CORE_2_KPU_5_INPUT_9;
    -- sfix(-3, -12)
    signal core_2_kpu_6_input_1 : PIPELINE_TYPE_FOR_CORE_2_KPU_6_INPUT_1;
    -- sfix(1, -12)
    signal core_2_kpu_6_input_2 : PIPELINE_TYPE_FOR_CORE_2_KPU_6_INPUT_2;
    -- sfix(0, -12)
    signal core_2_kpu_6_input_3 : PIPELINE_TYPE_FOR_CORE_2_KPU_6_INPUT_3;
    -- sfix(0, -12)
    signal core_2_kpu_6_input_4 : PIPELINE_TYPE_FOR_CORE_2_KPU_6_INPUT_4;
    -- sfix(2, -12)
    signal core_2_kpu_6_input_5 : PIPELINE_TYPE_FOR_CORE_2_KPU_6_INPUT_5;
    -- sfix(1, -12)
    signal core_2_kpu_6_input_6 : PIPELINE_TYPE_FOR_CORE_2_KPU_6_INPUT_6;
    -- sfix(-2, -12)
    signal core_2_kpu_6_input_7 : PIPELINE_TYPE_FOR_CORE_2_KPU_6_INPUT_7;
    -- sfix(1, -12)
    signal core_2_kpu_6_input_8 : PIPELINE_TYPE_FOR_CORE_2_KPU_6_INPUT_8;
    -- sfix(0, -12)
    signal core_2_kpu_6_input_9 : PIPELINE_TYPE_FOR_CORE_2_KPU_6_INPUT_9;
    -- sfix(-1, -12)
    signal core_2_kpu_7_input_1 : PIPELINE_TYPE_FOR_CORE_2_KPU_7_INPUT_1;
    -- sfix(1, -12)
    signal core_2_kpu_7_input_2 : PIPELINE_TYPE_FOR_CORE_2_KPU_7_INPUT_2;
    -- sfix(0, -12)
    signal core_2_kpu_7_input_3 : PIPELINE_TYPE_FOR_CORE_2_KPU_7_INPUT_3;
    -- sfix(-2, -12)
    signal core_2_kpu_7_input_4 : PIPELINE_TYPE_FOR_CORE_2_KPU_7_INPUT_4;
    -- sfix(1, -12)
    signal core_2_kpu_7_input_5 : PIPELINE_TYPE_FOR_CORE_2_KPU_7_INPUT_5;
    -- sfix(-1, -12)
    signal core_2_kpu_7_input_6 : PIPELINE_TYPE_FOR_CORE_2_KPU_7_INPUT_6;
    -- sfix(-1, -12)
    signal core_2_kpu_7_input_7 : PIPELINE_TYPE_FOR_CORE_2_KPU_7_INPUT_7;
    -- sfix(-2, -12)
    signal core_2_kpu_7_input_8 : PIPELINE_TYPE_FOR_CORE_2_KPU_7_INPUT_8;
    -- sfix(1, -12)
    signal core_2_kpu_7_input_9 : PIPELINE_TYPE_FOR_CORE_2_KPU_7_INPUT_9;
    -- sfix(-3, -12)
    signal core_2_kpu_8_input_1 : PIPELINE_TYPE_FOR_CORE_2_KPU_8_INPUT_1;
    -- sfix(-2, -12)
    signal core_2_kpu_8_input_2 : PIPELINE_TYPE_FOR_CORE_2_KPU_8_INPUT_2;
    -- sfix(-2, -12)
    signal core_2_kpu_8_input_3 : PIPELINE_TYPE_FOR_CORE_2_KPU_8_INPUT_3;
    -- sfix(-3, -12)
    signal core_2_kpu_8_input_4 : PIPELINE_TYPE_FOR_CORE_2_KPU_8_INPUT_4;
    -- sfix(-2, -12)
    signal core_2_kpu_8_input_5 : PIPELINE_TYPE_FOR_CORE_2_KPU_8_INPUT_5;
    -- sfix(-1, -12)
    signal core_2_kpu_8_input_6 : PIPELINE_TYPE_FOR_CORE_2_KPU_8_INPUT_6;
    -- sfix(-3, -12)
    signal core_2_kpu_8_input_7 : PIPELINE_TYPE_FOR_CORE_2_KPU_8_INPUT_7;
    -- sfix(-1, -12)
    signal core_2_kpu_8_input_8 : PIPELINE_TYPE_FOR_CORE_2_KPU_8_INPUT_8;
    -- sfix(-2, -12)
    signal core_2_kpu_8_input_9 : PIPELINE_TYPE_FOR_CORE_2_KPU_8_INPUT_9;
    -- sfix(1, -12)
    signal core_2_kpu_9_input_1 : PIPELINE_TYPE_FOR_CORE_2_KPU_9_INPUT_1;
    -- sfix(1, -12)
    signal core_2_kpu_9_input_2 : PIPELINE_TYPE_FOR_CORE_2_KPU_9_INPUT_2;
    -- sfix(1, -12)
    signal core_2_kpu_9_input_3 : PIPELINE_TYPE_FOR_CORE_2_KPU_9_INPUT_3;
    -- sfix(1, -12)
    signal core_2_kpu_9_input_4 : PIPELINE_TYPE_FOR_CORE_2_KPU_9_INPUT_4;
    -- sfix(1, -12)
    signal core_2_kpu_9_input_5 : PIPELINE_TYPE_FOR_CORE_2_KPU_9_INPUT_5;
    -- sfix(1, -12)
    signal core_2_kpu_9_input_6 : PIPELINE_TYPE_FOR_CORE_2_KPU_9_INPUT_6;
    -- sfix(1, -12)
    signal core_2_kpu_9_input_7 : PIPELINE_TYPE_FOR_CORE_2_KPU_9_INPUT_7;
    -- sfix(1, -12)
    signal core_2_kpu_9_input_8 : PIPELINE_TYPE_FOR_CORE_2_KPU_9_INPUT_8;
    -- sfix(1, -12)
    signal core_2_kpu_9_input_9 : PIPELINE_TYPE_FOR_CORE_2_KPU_9_INPUT_9;
    -- sfix(1, -12)
    signal core_2_kpu_10_input_1 : PIPELINE_TYPE_FOR_CORE_2_KPU_10_INPUT_1;
    -- sfix(1, -12)
    signal core_2_kpu_10_input_2 : PIPELINE_TYPE_FOR_CORE_2_KPU_10_INPUT_2;
    -- sfix(1, -12)
    signal core_2_kpu_10_input_3 : PIPELINE_TYPE_FOR_CORE_2_KPU_10_INPUT_3;
    -- sfix(1, -12)
    signal core_2_kpu_10_input_4 : PIPELINE_TYPE_FOR_CORE_2_KPU_10_INPUT_4;
    -- sfix(1, -12)
    signal core_2_kpu_10_input_5 : PIPELINE_TYPE_FOR_CORE_2_KPU_10_INPUT_5;
    -- sfix(1, -12)
    signal core_2_kpu_10_input_6 : PIPELINE_TYPE_FOR_CORE_2_KPU_10_INPUT_6;
    -- sfix(1, -12)
    signal core_2_kpu_10_input_7 : PIPELINE_TYPE_FOR_CORE_2_KPU_10_INPUT_7;
    -- sfix(1, -12)
    signal core_2_kpu_10_input_8 : PIPELINE_TYPE_FOR_CORE_2_KPU_10_INPUT_8;
    -- sfix(1, -12)
    signal core_2_kpu_10_input_9 : PIPELINE_TYPE_FOR_CORE_2_KPU_10_INPUT_9;
    -- sfix(1, -12)
    signal core_2_kpu_11_input_1 : PIPELINE_TYPE_FOR_CORE_2_KPU_11_INPUT_1;
    -- sfix(1, -12)
    signal core_2_kpu_11_input_2 : PIPELINE_TYPE_FOR_CORE_2_KPU_11_INPUT_2;
    -- sfix(1, -12)
    signal core_2_kpu_11_input_3 : PIPELINE_TYPE_FOR_CORE_2_KPU_11_INPUT_3;
    -- sfix(1, -12)
    signal core_2_kpu_11_input_4 : PIPELINE_TYPE_FOR_CORE_2_KPU_11_INPUT_4;
    -- sfix(1, -12)
    signal core_2_kpu_11_input_5 : PIPELINE_TYPE_FOR_CORE_2_KPU_11_INPUT_5;
    -- sfix(1, -12)
    signal core_2_kpu_11_input_6 : PIPELINE_TYPE_FOR_CORE_2_KPU_11_INPUT_6;
    -- sfix(1, -12)
    signal core_2_kpu_11_input_7 : PIPELINE_TYPE_FOR_CORE_2_KPU_11_INPUT_7;
    -- sfix(1, -12)
    signal core_2_kpu_11_input_8 : PIPELINE_TYPE_FOR_CORE_2_KPU_11_INPUT_8;
    -- sfix(1, -12)
    signal core_2_kpu_11_input_9 : PIPELINE_TYPE_FOR_CORE_2_KPU_11_INPUT_9;
    -- sfix(4, -12)
    signal core_2_kpu_12_input_1 : PIPELINE_TYPE_FOR_CORE_2_KPU_12_INPUT_1;
    -- sfix(3, -12)
    signal core_2_kpu_12_input_2 : PIPELINE_TYPE_FOR_CORE_2_KPU_12_INPUT_2;
    -- sfix(0, -12)
    signal core_2_kpu_12_input_3 : PIPELINE_TYPE_FOR_CORE_2_KPU_12_INPUT_3;
    -- sfix(3, -12)
    signal core_2_kpu_12_input_4 : PIPELINE_TYPE_FOR_CORE_2_KPU_12_INPUT_4;
    -- sfix(3, -12)
    signal core_2_kpu_12_input_5 : PIPELINE_TYPE_FOR_CORE_2_KPU_12_INPUT_5;
    -- sfix(0, -12)
    signal core_2_kpu_12_input_6 : PIPELINE_TYPE_FOR_CORE_2_KPU_12_INPUT_6;
    -- sfix(0, -12)
    signal core_2_kpu_12_input_7 : PIPELINE_TYPE_FOR_CORE_2_KPU_12_INPUT_7;
    -- sfix(0, -12)
    signal core_2_kpu_12_input_8 : PIPELINE_TYPE_FOR_CORE_2_KPU_12_INPUT_8;
    -- sfix(0, -12)
    signal core_2_kpu_12_input_9 : PIPELINE_TYPE_FOR_CORE_2_KPU_12_INPUT_9;
    -- sfix(0, -12)
    signal core_2_kpu_13_input_1 : PIPELINE_TYPE_FOR_CORE_2_KPU_13_INPUT_1;
    -- sfix(0, -12)
    signal core_2_kpu_13_input_2 : PIPELINE_TYPE_FOR_CORE_2_KPU_13_INPUT_2;
    -- sfix(1, -12)
    signal core_2_kpu_13_input_3 : PIPELINE_TYPE_FOR_CORE_2_KPU_13_INPUT_3;
    -- sfix(-2, -12)
    signal core_2_kpu_13_input_4 : PIPELINE_TYPE_FOR_CORE_2_KPU_13_INPUT_4;
    -- sfix(-2, -12)
    signal core_2_kpu_13_input_5 : PIPELINE_TYPE_FOR_CORE_2_KPU_13_INPUT_5;
    -- sfix(-2, -12)
    signal core_2_kpu_13_input_6 : PIPELINE_TYPE_FOR_CORE_2_KPU_13_INPUT_6;
    -- sfix(-1, -12)
    signal core_2_kpu_13_input_7 : PIPELINE_TYPE_FOR_CORE_2_KPU_13_INPUT_7;
    -- sfix(1, -12)
    signal core_2_kpu_13_input_8 : PIPELINE_TYPE_FOR_CORE_2_KPU_13_INPUT_8;
    -- sfix(-3, -12)
    signal core_2_kpu_13_input_9 : PIPELINE_TYPE_FOR_CORE_2_KPU_13_INPUT_9;
    -- sfix(1, -12)
    signal core_2_kpu_14_input_1 : PIPELINE_TYPE_FOR_CORE_2_KPU_14_INPUT_1;
    -- sfix(1, -12)
    signal core_2_kpu_14_input_2 : PIPELINE_TYPE_FOR_CORE_2_KPU_14_INPUT_2;
    -- sfix(0, -12)
    signal core_2_kpu_14_input_3 : PIPELINE_TYPE_FOR_CORE_2_KPU_14_INPUT_3;
    -- sfix(2, -12)
    signal core_2_kpu_14_input_4 : PIPELINE_TYPE_FOR_CORE_2_KPU_14_INPUT_4;
    -- sfix(1, -12)
    signal core_2_kpu_14_input_5 : PIPELINE_TYPE_FOR_CORE_2_KPU_14_INPUT_5;
    -- sfix(-1, -12)
    signal core_2_kpu_14_input_6 : PIPELINE_TYPE_FOR_CORE_2_KPU_14_INPUT_6;
    -- sfix(1, -12)
    signal core_2_kpu_14_input_7 : PIPELINE_TYPE_FOR_CORE_2_KPU_14_INPUT_7;
    -- sfix(1, -12)
    signal core_2_kpu_14_input_8 : PIPELINE_TYPE_FOR_CORE_2_KPU_14_INPUT_8;
    -- sfix(-3, -12)
    signal core_2_kpu_14_input_9 : PIPELINE_TYPE_FOR_CORE_2_KPU_14_INPUT_9;
    -- sfix(-3, -12)
    signal core_2_kpu_15_input_1 : PIPELINE_TYPE_FOR_CORE_2_KPU_15_INPUT_1;
    -- sfix(-3, -12)
    signal core_2_kpu_15_input_2 : PIPELINE_TYPE_FOR_CORE_2_KPU_15_INPUT_2;
    -- sfix(-3, -12)
    signal core_2_kpu_15_input_3 : PIPELINE_TYPE_FOR_CORE_2_KPU_15_INPUT_3;
    -- sfix(-3, -12)
    signal core_2_kpu_15_input_4 : PIPELINE_TYPE_FOR_CORE_2_KPU_15_INPUT_4;
    -- sfix(-3, -12)
    signal core_2_kpu_15_input_5 : PIPELINE_TYPE_FOR_CORE_2_KPU_15_INPUT_5;
    -- sfix(-3, -12)
    signal core_2_kpu_15_input_6 : PIPELINE_TYPE_FOR_CORE_2_KPU_15_INPUT_6;
    -- sfix(1, -12)
    signal core_2_kpu_15_input_7 : PIPELINE_TYPE_FOR_CORE_2_KPU_15_INPUT_7;
    -- sfix(1, -12)
    signal core_2_kpu_15_input_8 : PIPELINE_TYPE_FOR_CORE_2_KPU_15_INPUT_8;
    -- sfix(1, -12)
    signal core_2_kpu_15_input_9 : PIPELINE_TYPE_FOR_CORE_2_KPU_15_INPUT_9;
    -- sfix(1, -12)
    signal core_2_kpu_16_input_1 : PIPELINE_TYPE_FOR_CORE_2_KPU_16_INPUT_1;
    -- sfix(1, -12)
    signal core_2_kpu_16_input_2 : PIPELINE_TYPE_FOR_CORE_2_KPU_16_INPUT_2;
    -- sfix(1, -12)
    signal core_2_kpu_16_input_3 : PIPELINE_TYPE_FOR_CORE_2_KPU_16_INPUT_3;
    -- sfix(3, -12)
    signal core_2_kpu_16_input_4 : PIPELINE_TYPE_FOR_CORE_2_KPU_16_INPUT_4;
    -- sfix(3, -12)
    signal core_2_kpu_16_input_5 : PIPELINE_TYPE_FOR_CORE_2_KPU_16_INPUT_5;
    -- sfix(0, -12)
    signal core_2_kpu_16_input_6 : PIPELINE_TYPE_FOR_CORE_2_KPU_16_INPUT_6;
    -- sfix(0, -12)
    signal core_2_kpu_16_input_7 : PIPELINE_TYPE_FOR_CORE_2_KPU_16_INPUT_7;
    -- sfix(1, -12)
    signal core_2_kpu_16_input_8 : PIPELINE_TYPE_FOR_CORE_2_KPU_16_INPUT_8;
    -- sfix(-1, -12)
    signal core_2_kpu_16_input_9 : PIPELINE_TYPE_FOR_CORE_2_KPU_16_INPUT_9;
    -- sfix(0, -12)
    signal core_2_kpu_17_input_1 : PIPELINE_TYPE_FOR_CORE_2_KPU_17_INPUT_1;
    -- sfix(3, -12)
    signal core_2_kpu_17_input_2 : PIPELINE_TYPE_FOR_CORE_2_KPU_17_INPUT_2;
    -- sfix(-1, -12)
    signal core_2_kpu_17_input_3 : PIPELINE_TYPE_FOR_CORE_2_KPU_17_INPUT_3;
    -- sfix(0, -12)
    signal core_2_kpu_17_input_4 : PIPELINE_TYPE_FOR_CORE_2_KPU_17_INPUT_4;
    -- sfix(2, -12)
    signal core_2_kpu_17_input_5 : PIPELINE_TYPE_FOR_CORE_2_KPU_17_INPUT_5;
    -- sfix(-3, -12)
    signal core_2_kpu_17_input_6 : PIPELINE_TYPE_FOR_CORE_2_KPU_17_INPUT_6;
    -- sfix(-1, -12)
    signal core_2_kpu_17_input_7 : PIPELINE_TYPE_FOR_CORE_2_KPU_17_INPUT_7;
    -- sfix(2, -12)
    signal core_2_kpu_17_input_8 : PIPELINE_TYPE_FOR_CORE_2_KPU_17_INPUT_8;
    -- sfix(1, -12)
    signal core_2_kpu_17_input_9 : PIPELINE_TYPE_FOR_CORE_2_KPU_17_INPUT_9;
    -- sfix(-3, -12)
    signal core_2_kpu_18_input_1 : PIPELINE_TYPE_FOR_CORE_2_KPU_18_INPUT_1;
    -- sfix(0, -12)
    signal core_2_kpu_18_input_2 : PIPELINE_TYPE_FOR_CORE_2_KPU_18_INPUT_2;
    -- sfix(-1, -12)
    signal core_2_kpu_18_input_3 : PIPELINE_TYPE_FOR_CORE_2_KPU_18_INPUT_3;
    -- sfix(-1, -12)
    signal core_2_kpu_18_input_4 : PIPELINE_TYPE_FOR_CORE_2_KPU_18_INPUT_4;
    -- sfix(0, -12)
    signal core_2_kpu_18_input_5 : PIPELINE_TYPE_FOR_CORE_2_KPU_18_INPUT_5;
    -- sfix(-1, -12)
    signal core_2_kpu_18_input_6 : PIPELINE_TYPE_FOR_CORE_2_KPU_18_INPUT_6;
    -- sfix(-1, -12)
    signal core_2_kpu_18_input_7 : PIPELINE_TYPE_FOR_CORE_2_KPU_18_INPUT_7;
    -- sfix(-1, -12)
    signal core_2_kpu_18_input_8 : PIPELINE_TYPE_FOR_CORE_2_KPU_18_INPUT_8;
    -- sfix(-1, -12)
    signal core_2_kpu_18_input_9 : PIPELINE_TYPE_FOR_CORE_2_KPU_18_INPUT_9;
    -- sfix(-3, -12)
    signal core_2_kpu_19_input_1 : PIPELINE_TYPE_FOR_CORE_2_KPU_19_INPUT_1;
    -- sfix(0, -12)
    signal core_2_kpu_19_input_2 : PIPELINE_TYPE_FOR_CORE_2_KPU_19_INPUT_2;
    -- sfix(1, -12)
    signal core_2_kpu_19_input_3 : PIPELINE_TYPE_FOR_CORE_2_KPU_19_INPUT_3;
    -- sfix(0, -12)
    signal core_2_kpu_19_input_4 : PIPELINE_TYPE_FOR_CORE_2_KPU_19_INPUT_4;
    -- sfix(1, -12)
    signal core_2_kpu_19_input_5 : PIPELINE_TYPE_FOR_CORE_2_KPU_19_INPUT_5;
    -- sfix(-2, -12)
    signal core_2_kpu_19_input_6 : PIPELINE_TYPE_FOR_CORE_2_KPU_19_INPUT_6;
    -- sfix(-1, -12)
    signal core_2_kpu_19_input_7 : PIPELINE_TYPE_FOR_CORE_2_KPU_19_INPUT_7;
    -- sfix(0, -12)
    signal core_2_kpu_19_input_8 : PIPELINE_TYPE_FOR_CORE_2_KPU_19_INPUT_8;
    -- sfix(0, -12)
    signal core_2_kpu_19_input_9 : PIPELINE_TYPE_FOR_CORE_2_KPU_19_INPUT_9;
    -- sfix(0, -12)
    signal core_2_kpu_20_input_1 : PIPELINE_TYPE_FOR_CORE_2_KPU_20_INPUT_1;
    -- sfix(1, -12)
    signal core_2_kpu_20_input_2 : PIPELINE_TYPE_FOR_CORE_2_KPU_20_INPUT_2;
    -- sfix(-2, -12)
    signal core_2_kpu_20_input_3 : PIPELINE_TYPE_FOR_CORE_2_KPU_20_INPUT_3;
    -- sfix(2, -12)
    signal core_2_kpu_20_input_4 : PIPELINE_TYPE_FOR_CORE_2_KPU_20_INPUT_4;
    -- sfix(2, -12)
    signal core_2_kpu_20_input_5 : PIPELINE_TYPE_FOR_CORE_2_KPU_20_INPUT_5;
    -- sfix(0, -12)
    signal core_2_kpu_20_input_6 : PIPELINE_TYPE_FOR_CORE_2_KPU_20_INPUT_6;
    -- sfix(1, -12)
    signal core_2_kpu_20_input_7 : PIPELINE_TYPE_FOR_CORE_2_KPU_20_INPUT_7;
    -- sfix(2, -12)
    signal core_2_kpu_20_input_8 : PIPELINE_TYPE_FOR_CORE_2_KPU_20_INPUT_8;
    -- sfix(1, -12)
    signal core_2_kpu_20_input_9 : PIPELINE_TYPE_FOR_CORE_2_KPU_20_INPUT_9;
    -- sfix(1, -12)
    signal core_2_kpu_21_input_1 : PIPELINE_TYPE_FOR_CORE_2_KPU_21_INPUT_1;
    -- sfix(1, -12)
    signal core_2_kpu_21_input_2 : PIPELINE_TYPE_FOR_CORE_2_KPU_21_INPUT_2;
    -- sfix(1, -12)
    signal core_2_kpu_21_input_3 : PIPELINE_TYPE_FOR_CORE_2_KPU_21_INPUT_3;
    -- sfix(1, -12)
    signal core_2_kpu_21_input_4 : PIPELINE_TYPE_FOR_CORE_2_KPU_21_INPUT_4;
    -- sfix(1, -12)
    signal core_2_kpu_21_input_5 : PIPELINE_TYPE_FOR_CORE_2_KPU_21_INPUT_5;
    -- sfix(1, -12)
    signal core_2_kpu_21_input_6 : PIPELINE_TYPE_FOR_CORE_2_KPU_21_INPUT_6;
    -- sfix(1, -12)
    signal core_2_kpu_21_input_7 : PIPELINE_TYPE_FOR_CORE_2_KPU_21_INPUT_7;
    -- sfix(1, -12)
    signal core_2_kpu_21_input_8 : PIPELINE_TYPE_FOR_CORE_2_KPU_21_INPUT_8;
    -- sfix(1, -12)
    signal core_2_kpu_21_input_9 : PIPELINE_TYPE_FOR_CORE_2_KPU_21_INPUT_9;
    -- sfix(2, -12)
    signal core_2_kpu_22_input_1 : PIPELINE_TYPE_FOR_CORE_2_KPU_22_INPUT_1;
    -- sfix(2, -12)
    signal core_2_kpu_22_input_2 : PIPELINE_TYPE_FOR_CORE_2_KPU_22_INPUT_2;
    -- sfix(2, -12)
    signal core_2_kpu_22_input_3 : PIPELINE_TYPE_FOR_CORE_2_KPU_22_INPUT_3;
    -- sfix(3, -12)
    signal core_2_kpu_22_input_4 : PIPELINE_TYPE_FOR_CORE_2_KPU_22_INPUT_4;
    -- sfix(2, -12)
    signal core_2_kpu_22_input_5 : PIPELINE_TYPE_FOR_CORE_2_KPU_22_INPUT_5;
    -- sfix(3, -12)
    signal core_2_kpu_22_input_6 : PIPELINE_TYPE_FOR_CORE_2_KPU_22_INPUT_6;
    -- sfix(2, -12)
    signal core_2_kpu_22_input_7 : PIPELINE_TYPE_FOR_CORE_2_KPU_22_INPUT_7;
    -- sfix(-2, -12)
    signal core_2_kpu_22_input_8 : PIPELINE_TYPE_FOR_CORE_2_KPU_22_INPUT_8;
    -- sfix(2, -12)
    signal core_2_kpu_22_input_9 : PIPELINE_TYPE_FOR_CORE_2_KPU_22_INPUT_9;
    -- sfix(1, -12)
    signal core_2_kpu_23_input_1 : PIPELINE_TYPE_FOR_CORE_2_KPU_23_INPUT_1;
    -- sfix(1, -12)
    signal core_2_kpu_23_input_2 : PIPELINE_TYPE_FOR_CORE_2_KPU_23_INPUT_2;
    -- sfix(1, -12)
    signal core_2_kpu_23_input_3 : PIPELINE_TYPE_FOR_CORE_2_KPU_23_INPUT_3;
    -- sfix(1, -12)
    signal core_2_kpu_23_input_4 : PIPELINE_TYPE_FOR_CORE_2_KPU_23_INPUT_4;
    -- sfix(1, -12)
    signal core_2_kpu_23_input_5 : PIPELINE_TYPE_FOR_CORE_2_KPU_23_INPUT_5;
    -- sfix(1, -12)
    signal core_2_kpu_23_input_6 : PIPELINE_TYPE_FOR_CORE_2_KPU_23_INPUT_6;
    -- sfix(1, -12)
    signal core_2_kpu_23_input_7 : PIPELINE_TYPE_FOR_CORE_2_KPU_23_INPUT_7;
    -- sfix(1, -12)
    signal core_2_kpu_23_input_8 : PIPELINE_TYPE_FOR_CORE_2_KPU_23_INPUT_8;
    -- sfix(1, -12)
    signal core_2_kpu_23_input_9 : PIPELINE_TYPE_FOR_CORE_2_KPU_23_INPUT_9;
    -- sfix(2, -12)
    signal core_2_kpu_24_input_1 : PIPELINE_TYPE_FOR_CORE_2_KPU_24_INPUT_1;
    -- sfix(1, -12)
    signal core_2_kpu_24_input_2 : PIPELINE_TYPE_FOR_CORE_2_KPU_24_INPUT_2;
    -- sfix(-3, -12)
    signal core_2_kpu_24_input_3 : PIPELINE_TYPE_FOR_CORE_2_KPU_24_INPUT_3;
    -- sfix(1, -12)
    signal core_2_kpu_24_input_4 : PIPELINE_TYPE_FOR_CORE_2_KPU_24_INPUT_4;
    -- sfix(0, -12)
    signal core_2_kpu_24_input_5 : PIPELINE_TYPE_FOR_CORE_2_KPU_24_INPUT_5;
    -- sfix(-3, -12)
    signal core_2_kpu_24_input_6 : PIPELINE_TYPE_FOR_CORE_2_KPU_24_INPUT_6;
    -- sfix(-1, -12)
    signal core_2_kpu_24_input_7 : PIPELINE_TYPE_FOR_CORE_2_KPU_24_INPUT_7;
    -- sfix(-2, -12)
    signal core_2_kpu_24_input_8 : PIPELINE_TYPE_FOR_CORE_2_KPU_24_INPUT_8;
    -- sfix(1, -12)
    signal core_2_kpu_24_input_9 : PIPELINE_TYPE_FOR_CORE_2_KPU_24_INPUT_9;
    -- sfix(1, -12)
    signal core_2_kpu_25_input_1 : PIPELINE_TYPE_FOR_CORE_2_KPU_25_INPUT_1;
    -- sfix(1, -12)
    signal core_2_kpu_25_input_2 : PIPELINE_TYPE_FOR_CORE_2_KPU_25_INPUT_2;
    -- sfix(1, -12)
    signal core_2_kpu_25_input_3 : PIPELINE_TYPE_FOR_CORE_2_KPU_25_INPUT_3;
    -- sfix(1, -12)
    signal core_2_kpu_25_input_4 : PIPELINE_TYPE_FOR_CORE_2_KPU_25_INPUT_4;
    -- sfix(1, -12)
    signal core_2_kpu_25_input_5 : PIPELINE_TYPE_FOR_CORE_2_KPU_25_INPUT_5;
    -- sfix(1, -12)
    signal core_2_kpu_25_input_6 : PIPELINE_TYPE_FOR_CORE_2_KPU_25_INPUT_6;
    -- sfix(1, -12)
    signal core_2_kpu_25_input_7 : PIPELINE_TYPE_FOR_CORE_2_KPU_25_INPUT_7;
    -- sfix(1, -12)
    signal core_2_kpu_25_input_8 : PIPELINE_TYPE_FOR_CORE_2_KPU_25_INPUT_8;
    -- sfix(1, -12)
    signal core_2_kpu_25_input_9 : PIPELINE_TYPE_FOR_CORE_2_KPU_25_INPUT_9;
    -- sfix(-2, -12)
    signal core_2_kpu_26_input_1 : PIPELINE_TYPE_FOR_CORE_2_KPU_26_INPUT_1;
    -- sfix(0, -12)
    signal core_2_kpu_26_input_2 : PIPELINE_TYPE_FOR_CORE_2_KPU_26_INPUT_2;
    -- sfix(1, -12)
    signal core_2_kpu_26_input_3 : PIPELINE_TYPE_FOR_CORE_2_KPU_26_INPUT_3;
    -- sfix(-1, -12)
    signal core_2_kpu_26_input_4 : PIPELINE_TYPE_FOR_CORE_2_KPU_26_INPUT_4;
    -- sfix(1, -12)
    signal core_2_kpu_26_input_5 : PIPELINE_TYPE_FOR_CORE_2_KPU_26_INPUT_5;
    -- sfix(1, -12)
    signal core_2_kpu_26_input_6 : PIPELINE_TYPE_FOR_CORE_2_KPU_26_INPUT_6;
    -- sfix(-2, -12)
    signal core_2_kpu_26_input_7 : PIPELINE_TYPE_FOR_CORE_2_KPU_26_INPUT_7;
    -- sfix(1, -12)
    signal core_2_kpu_26_input_8 : PIPELINE_TYPE_FOR_CORE_2_KPU_26_INPUT_8;
    -- sfix(0, -12)
    signal core_2_kpu_26_input_9 : PIPELINE_TYPE_FOR_CORE_2_KPU_26_INPUT_9;
    -- sfix(1, -12)
    signal core_2_kpu_27_input_1 : PIPELINE_TYPE_FOR_CORE_2_KPU_27_INPUT_1;
    -- sfix(1, -12)
    signal core_2_kpu_27_input_2 : PIPELINE_TYPE_FOR_CORE_2_KPU_27_INPUT_2;
    -- sfix(0, -12)
    signal core_2_kpu_27_input_3 : PIPELINE_TYPE_FOR_CORE_2_KPU_27_INPUT_3;
    -- sfix(1, -12)
    signal core_2_kpu_27_input_4 : PIPELINE_TYPE_FOR_CORE_2_KPU_27_INPUT_4;
    -- sfix(1, -12)
    signal core_2_kpu_27_input_5 : PIPELINE_TYPE_FOR_CORE_2_KPU_27_INPUT_5;
    -- sfix(0, -12)
    signal core_2_kpu_27_input_6 : PIPELINE_TYPE_FOR_CORE_2_KPU_27_INPUT_6;
    -- sfix(-1, -12)
    signal core_2_kpu_27_input_7 : PIPELINE_TYPE_FOR_CORE_2_KPU_27_INPUT_7;
    -- sfix(0, -12)
    signal core_2_kpu_27_input_8 : PIPELINE_TYPE_FOR_CORE_2_KPU_27_INPUT_8;
    -- sfix(-2, -12)
    signal core_2_kpu_27_input_9 : PIPELINE_TYPE_FOR_CORE_2_KPU_27_INPUT_9;
    -- sfix(1, -12)
    signal core_2_kpu_28_input_1 : PIPELINE_TYPE_FOR_CORE_2_KPU_28_INPUT_1;
    -- sfix(1, -12)
    signal core_2_kpu_28_input_2 : PIPELINE_TYPE_FOR_CORE_2_KPU_28_INPUT_2;
    -- sfix(1, -12)
    signal core_2_kpu_28_input_3 : PIPELINE_TYPE_FOR_CORE_2_KPU_28_INPUT_3;
    -- sfix(1, -12)
    signal core_2_kpu_28_input_4 : PIPELINE_TYPE_FOR_CORE_2_KPU_28_INPUT_4;
    -- sfix(1, -12)
    signal core_2_kpu_28_input_5 : PIPELINE_TYPE_FOR_CORE_2_KPU_28_INPUT_5;
    -- sfix(1, -12)
    signal core_2_kpu_28_input_6 : PIPELINE_TYPE_FOR_CORE_2_KPU_28_INPUT_6;
    -- sfix(1, -12)
    signal core_2_kpu_28_input_7 : PIPELINE_TYPE_FOR_CORE_2_KPU_28_INPUT_7;
    -- sfix(1, -12)
    signal core_2_kpu_28_input_8 : PIPELINE_TYPE_FOR_CORE_2_KPU_28_INPUT_8;
    -- sfix(1, -12)
    signal core_2_kpu_28_input_9 : PIPELINE_TYPE_FOR_CORE_2_KPU_28_INPUT_9;
    -- sfix(4, -12)
    signal core_2_kpu_29_input_1 : PIPELINE_TYPE_FOR_CORE_2_KPU_29_INPUT_1;
    -- sfix(4, -12)
    signal core_2_kpu_29_input_2 : PIPELINE_TYPE_FOR_CORE_2_KPU_29_INPUT_2;
    -- sfix(3, -12)
    signal core_2_kpu_29_input_3 : PIPELINE_TYPE_FOR_CORE_2_KPU_29_INPUT_3;
    -- sfix(4, -12)
    signal core_2_kpu_29_input_4 : PIPELINE_TYPE_FOR_CORE_2_KPU_29_INPUT_4;
    -- sfix(2, -12)
    signal core_2_kpu_29_input_5 : PIPELINE_TYPE_FOR_CORE_2_KPU_29_INPUT_5;
    -- sfix(1, -12)
    signal core_2_kpu_29_input_6 : PIPELINE_TYPE_FOR_CORE_2_KPU_29_INPUT_6;
    -- sfix(2, -12)
    signal core_2_kpu_29_input_7 : PIPELINE_TYPE_FOR_CORE_2_KPU_29_INPUT_7;
    -- sfix(3, -12)
    signal core_2_kpu_29_input_8 : PIPELINE_TYPE_FOR_CORE_2_KPU_29_INPUT_8;
    -- sfix(2, -12)
    signal core_2_kpu_29_input_9 : PIPELINE_TYPE_FOR_CORE_2_KPU_29_INPUT_9;
    -- sfix(-2, -12)
    signal core_2_kpu_30_input_1 : PIPELINE_TYPE_FOR_CORE_2_KPU_30_INPUT_1;
    -- sfix(-1, -12)
    signal core_2_kpu_30_input_2 : PIPELINE_TYPE_FOR_CORE_2_KPU_30_INPUT_2;
    -- sfix(0, -12)
    signal core_2_kpu_30_input_3 : PIPELINE_TYPE_FOR_CORE_2_KPU_30_INPUT_3;
    -- sfix(0, -12)
    signal core_2_kpu_30_input_4 : PIPELINE_TYPE_FOR_CORE_2_KPU_30_INPUT_4;
    -- sfix(1, -12)
    signal core_2_kpu_30_input_5 : PIPELINE_TYPE_FOR_CORE_2_KPU_30_INPUT_5;
    -- sfix(-1, -12)
    signal core_2_kpu_30_input_6 : PIPELINE_TYPE_FOR_CORE_2_KPU_30_INPUT_6;
    -- sfix(1, -12)
    signal core_2_kpu_30_input_7 : PIPELINE_TYPE_FOR_CORE_2_KPU_30_INPUT_7;
    -- sfix(1, -12)
    signal core_2_kpu_30_input_8 : PIPELINE_TYPE_FOR_CORE_2_KPU_30_INPUT_8;
    -- sfix(1, -12)
    signal core_2_kpu_30_input_9 : PIPELINE_TYPE_FOR_CORE_2_KPU_30_INPUT_9;
    -- sfix(1, -12)
    signal core_2_kpu_31_input_1 : PIPELINE_TYPE_FOR_CORE_2_KPU_31_INPUT_1;
    -- sfix(1, -12)
    signal core_2_kpu_31_input_2 : PIPELINE_TYPE_FOR_CORE_2_KPU_31_INPUT_2;
    -- sfix(1, -12)
    signal core_2_kpu_31_input_3 : PIPELINE_TYPE_FOR_CORE_2_KPU_31_INPUT_3;
    -- sfix(1, -12)
    signal core_2_kpu_31_input_4 : PIPELINE_TYPE_FOR_CORE_2_KPU_31_INPUT_4;
    -- sfix(1, -12)
    signal core_2_kpu_31_input_5 : PIPELINE_TYPE_FOR_CORE_2_KPU_31_INPUT_5;
    -- sfix(1, -12)
    signal core_2_kpu_31_input_6 : PIPELINE_TYPE_FOR_CORE_2_KPU_31_INPUT_6;
    -- sfix(1, -12)
    signal core_2_kpu_31_input_7 : PIPELINE_TYPE_FOR_CORE_2_KPU_31_INPUT_7;
    -- sfix(1, -12)
    signal core_2_kpu_31_input_8 : PIPELINE_TYPE_FOR_CORE_2_KPU_31_INPUT_8;
    -- sfix(1, -12)
    signal core_2_kpu_31_input_9 : PIPELINE_TYPE_FOR_CORE_2_KPU_31_INPUT_9;
    -- sfix(0, -12)
    signal core_2_kpu_32_input_1 : PIPELINE_TYPE_FOR_CORE_2_KPU_32_INPUT_1;
    -- sfix(2, -12)
    signal core_2_kpu_32_input_2 : PIPELINE_TYPE_FOR_CORE_2_KPU_32_INPUT_2;
    -- sfix(2, -12)
    signal core_2_kpu_32_input_3 : PIPELINE_TYPE_FOR_CORE_2_KPU_32_INPUT_3;
    -- sfix(-3, -12)
    signal core_2_kpu_32_input_4 : PIPELINE_TYPE_FOR_CORE_2_KPU_32_INPUT_4;
    -- sfix(0, -12)
    signal core_2_kpu_32_input_5 : PIPELINE_TYPE_FOR_CORE_2_KPU_32_INPUT_5;
    -- sfix(-1, -12)
    signal core_2_kpu_32_input_6 : PIPELINE_TYPE_FOR_CORE_2_KPU_32_INPUT_6;
    -- sfix(-2, -12)
    signal core_2_kpu_32_input_7 : PIPELINE_TYPE_FOR_CORE_2_KPU_32_INPUT_7;
    -- sfix(-3, -12)
    signal core_2_kpu_32_input_8 : PIPELINE_TYPE_FOR_CORE_2_KPU_32_INPUT_8;
    -- sfix(-3, -12)
    signal core_2_kpu_32_input_9 : PIPELINE_TYPE_FOR_CORE_2_KPU_32_INPUT_9;
 
    -- sfix(1, -12)
    signal core_3_kpu_1_input_1 : PIPELINE_TYPE_FOR_CORE_3_KPU_1_INPUT_1;
    -- sfix(1, -12)
    signal core_3_kpu_1_input_2 : PIPELINE_TYPE_FOR_CORE_3_KPU_1_INPUT_2;
    -- sfix(1, -12)
    signal core_3_kpu_1_input_3 : PIPELINE_TYPE_FOR_CORE_3_KPU_1_INPUT_3;
    -- sfix(1, -12)
    signal core_3_kpu_1_input_4 : PIPELINE_TYPE_FOR_CORE_3_KPU_1_INPUT_4;
    -- sfix(1, -12)
    signal core_3_kpu_1_input_5 : PIPELINE_TYPE_FOR_CORE_3_KPU_1_INPUT_5;
    -- sfix(1, -12)
    signal core_3_kpu_1_input_6 : PIPELINE_TYPE_FOR_CORE_3_KPU_1_INPUT_6;
    -- sfix(1, -12)
    signal core_3_kpu_1_input_7 : PIPELINE_TYPE_FOR_CORE_3_KPU_1_INPUT_7;
    -- sfix(1, -12)
    signal core_3_kpu_1_input_8 : PIPELINE_TYPE_FOR_CORE_3_KPU_1_INPUT_8;
    -- sfix(1, -12)
    signal core_3_kpu_1_input_9 : PIPELINE_TYPE_FOR_CORE_3_KPU_1_INPUT_9;
    -- sfix(-1, -12)
    signal core_3_kpu_2_input_1 : PIPELINE_TYPE_FOR_CORE_3_KPU_2_INPUT_1;
    -- sfix(-1, -12)
    signal core_3_kpu_2_input_2 : PIPELINE_TYPE_FOR_CORE_3_KPU_2_INPUT_2;
    -- sfix(-2, -12)
    signal core_3_kpu_2_input_3 : PIPELINE_TYPE_FOR_CORE_3_KPU_2_INPUT_3;
    -- sfix(1, -12)
    signal core_3_kpu_2_input_4 : PIPELINE_TYPE_FOR_CORE_3_KPU_2_INPUT_4;
    -- sfix(-2, -12)
    signal core_3_kpu_2_input_5 : PIPELINE_TYPE_FOR_CORE_3_KPU_2_INPUT_5;
    -- sfix(-3, -12)
    signal core_3_kpu_2_input_6 : PIPELINE_TYPE_FOR_CORE_3_KPU_2_INPUT_6;
    -- sfix(-3, -12)
    signal core_3_kpu_2_input_7 : PIPELINE_TYPE_FOR_CORE_3_KPU_2_INPUT_7;
    -- sfix(1, -12)
    signal core_3_kpu_2_input_8 : PIPELINE_TYPE_FOR_CORE_3_KPU_2_INPUT_8;
    -- sfix(-2, -12)
    signal core_3_kpu_2_input_9 : PIPELINE_TYPE_FOR_CORE_3_KPU_2_INPUT_9;
    -- sfix(1, -12)
    signal core_3_kpu_3_input_1 : PIPELINE_TYPE_FOR_CORE_3_KPU_3_INPUT_1;
    -- sfix(1, -12)
    signal core_3_kpu_3_input_2 : PIPELINE_TYPE_FOR_CORE_3_KPU_3_INPUT_2;
    -- sfix(0, -12)
    signal core_3_kpu_3_input_3 : PIPELINE_TYPE_FOR_CORE_3_KPU_3_INPUT_3;
    -- sfix(1, -12)
    signal core_3_kpu_3_input_4 : PIPELINE_TYPE_FOR_CORE_3_KPU_3_INPUT_4;
    -- sfix(1, -12)
    signal core_3_kpu_3_input_5 : PIPELINE_TYPE_FOR_CORE_3_KPU_3_INPUT_5;
    -- sfix(0, -12)
    signal core_3_kpu_3_input_6 : PIPELINE_TYPE_FOR_CORE_3_KPU_3_INPUT_6;
    -- sfix(1, -12)
    signal core_3_kpu_3_input_7 : PIPELINE_TYPE_FOR_CORE_3_KPU_3_INPUT_7;
    -- sfix(0, -12)
    signal core_3_kpu_3_input_8 : PIPELINE_TYPE_FOR_CORE_3_KPU_3_INPUT_8;
    -- sfix(0, -12)
    signal core_3_kpu_3_input_9 : PIPELINE_TYPE_FOR_CORE_3_KPU_3_INPUT_9;
    -- sfix(1, -12)
    signal core_3_kpu_4_input_1 : PIPELINE_TYPE_FOR_CORE_3_KPU_4_INPUT_1;
    -- sfix(1, -12)
    signal core_3_kpu_4_input_2 : PIPELINE_TYPE_FOR_CORE_3_KPU_4_INPUT_2;
    -- sfix(1, -12)
    signal core_3_kpu_4_input_3 : PIPELINE_TYPE_FOR_CORE_3_KPU_4_INPUT_3;
    -- sfix(1, -12)
    signal core_3_kpu_4_input_4 : PIPELINE_TYPE_FOR_CORE_3_KPU_4_INPUT_4;
    -- sfix(1, -12)
    signal core_3_kpu_4_input_5 : PIPELINE_TYPE_FOR_CORE_3_KPU_4_INPUT_5;
    -- sfix(1, -12)
    signal core_3_kpu_4_input_6 : PIPELINE_TYPE_FOR_CORE_3_KPU_4_INPUT_6;
    -- sfix(1, -12)
    signal core_3_kpu_4_input_7 : PIPELINE_TYPE_FOR_CORE_3_KPU_4_INPUT_7;
    -- sfix(1, -12)
    signal core_3_kpu_4_input_8 : PIPELINE_TYPE_FOR_CORE_3_KPU_4_INPUT_8;
    -- sfix(1, -12)
    signal core_3_kpu_4_input_9 : PIPELINE_TYPE_FOR_CORE_3_KPU_4_INPUT_9;
    -- sfix(1, -12)
    signal core_3_kpu_5_input_1 : PIPELINE_TYPE_FOR_CORE_3_KPU_5_INPUT_1;
    -- sfix(-1, -12)
    signal core_3_kpu_5_input_2 : PIPELINE_TYPE_FOR_CORE_3_KPU_5_INPUT_2;
    -- sfix(1, -12)
    signal core_3_kpu_5_input_3 : PIPELINE_TYPE_FOR_CORE_3_KPU_5_INPUT_3;
    -- sfix(-3, -12)
    signal core_3_kpu_5_input_4 : PIPELINE_TYPE_FOR_CORE_3_KPU_5_INPUT_4;
    -- sfix(2, -12)
    signal core_3_kpu_5_input_5 : PIPELINE_TYPE_FOR_CORE_3_KPU_5_INPUT_5;
    -- sfix(1, -12)
    signal core_3_kpu_5_input_6 : PIPELINE_TYPE_FOR_CORE_3_KPU_5_INPUT_6;
    -- sfix(0, -12)
    signal core_3_kpu_5_input_7 : PIPELINE_TYPE_FOR_CORE_3_KPU_5_INPUT_7;
    -- sfix(0, -12)
    signal core_3_kpu_5_input_8 : PIPELINE_TYPE_FOR_CORE_3_KPU_5_INPUT_8;
    -- sfix(0, -12)
    signal core_3_kpu_5_input_9 : PIPELINE_TYPE_FOR_CORE_3_KPU_5_INPUT_9;
    -- sfix(1, -12)
    signal core_3_kpu_6_input_1 : PIPELINE_TYPE_FOR_CORE_3_KPU_6_INPUT_1;
    -- sfix(0, -12)
    signal core_3_kpu_6_input_2 : PIPELINE_TYPE_FOR_CORE_3_KPU_6_INPUT_2;
    -- sfix(-2, -12)
    signal core_3_kpu_6_input_3 : PIPELINE_TYPE_FOR_CORE_3_KPU_6_INPUT_3;
    -- sfix(0, -12)
    signal core_3_kpu_6_input_4 : PIPELINE_TYPE_FOR_CORE_3_KPU_6_INPUT_4;
    -- sfix(0, -12)
    signal core_3_kpu_6_input_5 : PIPELINE_TYPE_FOR_CORE_3_KPU_6_INPUT_5;
    -- sfix(0, -12)
    signal core_3_kpu_6_input_6 : PIPELINE_TYPE_FOR_CORE_3_KPU_6_INPUT_6;
    -- sfix(-1, -12)
    signal core_3_kpu_6_input_7 : PIPELINE_TYPE_FOR_CORE_3_KPU_6_INPUT_7;
    -- sfix(0, -12)
    signal core_3_kpu_6_input_8 : PIPELINE_TYPE_FOR_CORE_3_KPU_6_INPUT_8;
    -- sfix(-1, -12)
    signal core_3_kpu_6_input_9 : PIPELINE_TYPE_FOR_CORE_3_KPU_6_INPUT_9;
    -- sfix(-1, -12)
    signal core_3_kpu_7_input_1 : PIPELINE_TYPE_FOR_CORE_3_KPU_7_INPUT_1;
    -- sfix(0, -12)
    signal core_3_kpu_7_input_2 : PIPELINE_TYPE_FOR_CORE_3_KPU_7_INPUT_2;
    -- sfix(0, -12)
    signal core_3_kpu_7_input_3 : PIPELINE_TYPE_FOR_CORE_3_KPU_7_INPUT_3;
    -- sfix(-2, -12)
    signal core_3_kpu_7_input_4 : PIPELINE_TYPE_FOR_CORE_3_KPU_7_INPUT_4;
    -- sfix(0, -12)
    signal core_3_kpu_7_input_5 : PIPELINE_TYPE_FOR_CORE_3_KPU_7_INPUT_5;
    -- sfix(-1, -12)
    signal core_3_kpu_7_input_6 : PIPELINE_TYPE_FOR_CORE_3_KPU_7_INPUT_6;
    -- sfix(-3, -12)
    signal core_3_kpu_7_input_7 : PIPELINE_TYPE_FOR_CORE_3_KPU_7_INPUT_7;
    -- sfix(-1, -12)
    signal core_3_kpu_7_input_8 : PIPELINE_TYPE_FOR_CORE_3_KPU_7_INPUT_8;
    -- sfix(-1, -12)
    signal core_3_kpu_7_input_9 : PIPELINE_TYPE_FOR_CORE_3_KPU_7_INPUT_9;
    -- sfix(0, -12)
    signal core_3_kpu_8_input_1 : PIPELINE_TYPE_FOR_CORE_3_KPU_8_INPUT_1;
    -- sfix(1, -12)
    signal core_3_kpu_8_input_2 : PIPELINE_TYPE_FOR_CORE_3_KPU_8_INPUT_2;
    -- sfix(-1, -12)
    signal core_3_kpu_8_input_3 : PIPELINE_TYPE_FOR_CORE_3_KPU_8_INPUT_3;
    -- sfix(1, -12)
    signal core_3_kpu_8_input_4 : PIPELINE_TYPE_FOR_CORE_3_KPU_8_INPUT_4;
    -- sfix(1, -12)
    signal core_3_kpu_8_input_5 : PIPELINE_TYPE_FOR_CORE_3_KPU_8_INPUT_5;
    -- sfix(-1, -12)
    signal core_3_kpu_8_input_6 : PIPELINE_TYPE_FOR_CORE_3_KPU_8_INPUT_6;
    -- sfix(0, -12)
    signal core_3_kpu_8_input_7 : PIPELINE_TYPE_FOR_CORE_3_KPU_8_INPUT_7;
    -- sfix(0, -12)
    signal core_3_kpu_8_input_8 : PIPELINE_TYPE_FOR_CORE_3_KPU_8_INPUT_8;
    -- sfix(-2, -12)
    signal core_3_kpu_8_input_9 : PIPELINE_TYPE_FOR_CORE_3_KPU_8_INPUT_9;
    -- sfix(1, -12)
    signal core_3_kpu_9_input_1 : PIPELINE_TYPE_FOR_CORE_3_KPU_9_INPUT_1;
    -- sfix(1, -12)
    signal core_3_kpu_9_input_2 : PIPELINE_TYPE_FOR_CORE_3_KPU_9_INPUT_2;
    -- sfix(1, -12)
    signal core_3_kpu_9_input_3 : PIPELINE_TYPE_FOR_CORE_3_KPU_9_INPUT_3;
    -- sfix(1, -12)
    signal core_3_kpu_9_input_4 : PIPELINE_TYPE_FOR_CORE_3_KPU_9_INPUT_4;
    -- sfix(1, -12)
    signal core_3_kpu_9_input_5 : PIPELINE_TYPE_FOR_CORE_3_KPU_9_INPUT_5;
    -- sfix(1, -12)
    signal core_3_kpu_9_input_6 : PIPELINE_TYPE_FOR_CORE_3_KPU_9_INPUT_6;
    -- sfix(1, -12)
    signal core_3_kpu_9_input_7 : PIPELINE_TYPE_FOR_CORE_3_KPU_9_INPUT_7;
    -- sfix(1, -12)
    signal core_3_kpu_9_input_8 : PIPELINE_TYPE_FOR_CORE_3_KPU_9_INPUT_8;
    -- sfix(1, -12)
    signal core_3_kpu_9_input_9 : PIPELINE_TYPE_FOR_CORE_3_KPU_9_INPUT_9;
    -- sfix(1, -12)
    signal core_3_kpu_10_input_1 : PIPELINE_TYPE_FOR_CORE_3_KPU_10_INPUT_1;
    -- sfix(1, -12)
    signal core_3_kpu_10_input_2 : PIPELINE_TYPE_FOR_CORE_3_KPU_10_INPUT_2;
    -- sfix(1, -12)
    signal core_3_kpu_10_input_3 : PIPELINE_TYPE_FOR_CORE_3_KPU_10_INPUT_3;
    -- sfix(1, -12)
    signal core_3_kpu_10_input_4 : PIPELINE_TYPE_FOR_CORE_3_KPU_10_INPUT_4;
    -- sfix(1, -12)
    signal core_3_kpu_10_input_5 : PIPELINE_TYPE_FOR_CORE_3_KPU_10_INPUT_5;
    -- sfix(1, -12)
    signal core_3_kpu_10_input_6 : PIPELINE_TYPE_FOR_CORE_3_KPU_10_INPUT_6;
    -- sfix(1, -12)
    signal core_3_kpu_10_input_7 : PIPELINE_TYPE_FOR_CORE_3_KPU_10_INPUT_7;
    -- sfix(1, -12)
    signal core_3_kpu_10_input_8 : PIPELINE_TYPE_FOR_CORE_3_KPU_10_INPUT_8;
    -- sfix(1, -12)
    signal core_3_kpu_10_input_9 : PIPELINE_TYPE_FOR_CORE_3_KPU_10_INPUT_9;
    -- sfix(1, -12)
    signal core_3_kpu_11_input_1 : PIPELINE_TYPE_FOR_CORE_3_KPU_11_INPUT_1;
    -- sfix(1, -12)
    signal core_3_kpu_11_input_2 : PIPELINE_TYPE_FOR_CORE_3_KPU_11_INPUT_2;
    -- sfix(1, -12)
    signal core_3_kpu_11_input_3 : PIPELINE_TYPE_FOR_CORE_3_KPU_11_INPUT_3;
    -- sfix(1, -12)
    signal core_3_kpu_11_input_4 : PIPELINE_TYPE_FOR_CORE_3_KPU_11_INPUT_4;
    -- sfix(1, -12)
    signal core_3_kpu_11_input_5 : PIPELINE_TYPE_FOR_CORE_3_KPU_11_INPUT_5;
    -- sfix(1, -12)
    signal core_3_kpu_11_input_6 : PIPELINE_TYPE_FOR_CORE_3_KPU_11_INPUT_6;
    -- sfix(1, -12)
    signal core_3_kpu_11_input_7 : PIPELINE_TYPE_FOR_CORE_3_KPU_11_INPUT_7;
    -- sfix(1, -12)
    signal core_3_kpu_11_input_8 : PIPELINE_TYPE_FOR_CORE_3_KPU_11_INPUT_8;
    -- sfix(1, -12)
    signal core_3_kpu_11_input_9 : PIPELINE_TYPE_FOR_CORE_3_KPU_11_INPUT_9;
    -- sfix(2, -12)
    signal core_3_kpu_12_input_1 : PIPELINE_TYPE_FOR_CORE_3_KPU_12_INPUT_1;
    -- sfix(2, -12)
    signal core_3_kpu_12_input_2 : PIPELINE_TYPE_FOR_CORE_3_KPU_12_INPUT_2;
    -- sfix(-1, -12)
    signal core_3_kpu_12_input_3 : PIPELINE_TYPE_FOR_CORE_3_KPU_12_INPUT_3;
    -- sfix(1, -12)
    signal core_3_kpu_12_input_4 : PIPELINE_TYPE_FOR_CORE_3_KPU_12_INPUT_4;
    -- sfix(2, -12)
    signal core_3_kpu_12_input_5 : PIPELINE_TYPE_FOR_CORE_3_KPU_12_INPUT_5;
    -- sfix(-2, -12)
    signal core_3_kpu_12_input_6 : PIPELINE_TYPE_FOR_CORE_3_KPU_12_INPUT_6;
    -- sfix(-2, -12)
    signal core_3_kpu_12_input_7 : PIPELINE_TYPE_FOR_CORE_3_KPU_12_INPUT_7;
    -- sfix(-1, -12)
    signal core_3_kpu_12_input_8 : PIPELINE_TYPE_FOR_CORE_3_KPU_12_INPUT_8;
    -- sfix(-1, -12)
    signal core_3_kpu_12_input_9 : PIPELINE_TYPE_FOR_CORE_3_KPU_12_INPUT_9;
    -- sfix(3, -12)
    signal core_3_kpu_13_input_1 : PIPELINE_TYPE_FOR_CORE_3_KPU_13_INPUT_1;
    -- sfix(2, -12)
    signal core_3_kpu_13_input_2 : PIPELINE_TYPE_FOR_CORE_3_KPU_13_INPUT_2;
    -- sfix(2, -12)
    signal core_3_kpu_13_input_3 : PIPELINE_TYPE_FOR_CORE_3_KPU_13_INPUT_3;
    -- sfix(2, -12)
    signal core_3_kpu_13_input_4 : PIPELINE_TYPE_FOR_CORE_3_KPU_13_INPUT_4;
    -- sfix(2, -12)
    signal core_3_kpu_13_input_5 : PIPELINE_TYPE_FOR_CORE_3_KPU_13_INPUT_5;
    -- sfix(2, -12)
    signal core_3_kpu_13_input_6 : PIPELINE_TYPE_FOR_CORE_3_KPU_13_INPUT_6;
    -- sfix(2, -12)
    signal core_3_kpu_13_input_7 : PIPELINE_TYPE_FOR_CORE_3_KPU_13_INPUT_7;
    -- sfix(2, -12)
    signal core_3_kpu_13_input_8 : PIPELINE_TYPE_FOR_CORE_3_KPU_13_INPUT_8;
    -- sfix(2, -12)
    signal core_3_kpu_13_input_9 : PIPELINE_TYPE_FOR_CORE_3_KPU_13_INPUT_9;
    -- sfix(1, -12)
    signal core_3_kpu_14_input_1 : PIPELINE_TYPE_FOR_CORE_3_KPU_14_INPUT_1;
    -- sfix(0, -12)
    signal core_3_kpu_14_input_2 : PIPELINE_TYPE_FOR_CORE_3_KPU_14_INPUT_2;
    -- sfix(-1, -12)
    signal core_3_kpu_14_input_3 : PIPELINE_TYPE_FOR_CORE_3_KPU_14_INPUT_3;
    -- sfix(1, -12)
    signal core_3_kpu_14_input_4 : PIPELINE_TYPE_FOR_CORE_3_KPU_14_INPUT_4;
    -- sfix(0, -12)
    signal core_3_kpu_14_input_5 : PIPELINE_TYPE_FOR_CORE_3_KPU_14_INPUT_5;
    -- sfix(0, -12)
    signal core_3_kpu_14_input_6 : PIPELINE_TYPE_FOR_CORE_3_KPU_14_INPUT_6;
    -- sfix(1, -12)
    signal core_3_kpu_14_input_7 : PIPELINE_TYPE_FOR_CORE_3_KPU_14_INPUT_7;
    -- sfix(0, -12)
    signal core_3_kpu_14_input_8 : PIPELINE_TYPE_FOR_CORE_3_KPU_14_INPUT_8;
    -- sfix(-1, -12)
    signal core_3_kpu_14_input_9 : PIPELINE_TYPE_FOR_CORE_3_KPU_14_INPUT_9;
    -- sfix(-3, -12)
    signal core_3_kpu_15_input_1 : PIPELINE_TYPE_FOR_CORE_3_KPU_15_INPUT_1;
    -- sfix(-3, -12)
    signal core_3_kpu_15_input_2 : PIPELINE_TYPE_FOR_CORE_3_KPU_15_INPUT_2;
    -- sfix(-3, -12)
    signal core_3_kpu_15_input_3 : PIPELINE_TYPE_FOR_CORE_3_KPU_15_INPUT_3;
    -- sfix(-3, -12)
    signal core_3_kpu_15_input_4 : PIPELINE_TYPE_FOR_CORE_3_KPU_15_INPUT_4;
    -- sfix(-3, -12)
    signal core_3_kpu_15_input_5 : PIPELINE_TYPE_FOR_CORE_3_KPU_15_INPUT_5;
    -- sfix(-3, -12)
    signal core_3_kpu_15_input_6 : PIPELINE_TYPE_FOR_CORE_3_KPU_15_INPUT_6;
    -- sfix(1, -12)
    signal core_3_kpu_15_input_7 : PIPELINE_TYPE_FOR_CORE_3_KPU_15_INPUT_7;
    -- sfix(1, -12)
    signal core_3_kpu_15_input_8 : PIPELINE_TYPE_FOR_CORE_3_KPU_15_INPUT_8;
    -- sfix(1, -12)
    signal core_3_kpu_15_input_9 : PIPELINE_TYPE_FOR_CORE_3_KPU_15_INPUT_9;
    -- sfix(0, -12)
    signal core_3_kpu_16_input_1 : PIPELINE_TYPE_FOR_CORE_3_KPU_16_INPUT_1;
    -- sfix(0, -12)
    signal core_3_kpu_16_input_2 : PIPELINE_TYPE_FOR_CORE_3_KPU_16_INPUT_2;
    -- sfix(-1, -12)
    signal core_3_kpu_16_input_3 : PIPELINE_TYPE_FOR_CORE_3_KPU_16_INPUT_3;
    -- sfix(1, -12)
    signal core_3_kpu_16_input_4 : PIPELINE_TYPE_FOR_CORE_3_KPU_16_INPUT_4;
    -- sfix(1, -12)
    signal core_3_kpu_16_input_5 : PIPELINE_TYPE_FOR_CORE_3_KPU_16_INPUT_5;
    -- sfix(-1, -12)
    signal core_3_kpu_16_input_6 : PIPELINE_TYPE_FOR_CORE_3_KPU_16_INPUT_6;
    -- sfix(-1, -12)
    signal core_3_kpu_16_input_7 : PIPELINE_TYPE_FOR_CORE_3_KPU_16_INPUT_7;
    -- sfix(-1, -12)
    signal core_3_kpu_16_input_8 : PIPELINE_TYPE_FOR_CORE_3_KPU_16_INPUT_8;
    -- sfix(-2, -12)
    signal core_3_kpu_16_input_9 : PIPELINE_TYPE_FOR_CORE_3_KPU_16_INPUT_9;
    -- sfix(0, -12)
    signal core_3_kpu_17_input_1 : PIPELINE_TYPE_FOR_CORE_3_KPU_17_INPUT_1;
    -- sfix(2, -12)
    signal core_3_kpu_17_input_2 : PIPELINE_TYPE_FOR_CORE_3_KPU_17_INPUT_2;
    -- sfix(0, -12)
    signal core_3_kpu_17_input_3 : PIPELINE_TYPE_FOR_CORE_3_KPU_17_INPUT_3;
    -- sfix(0, -12)
    signal core_3_kpu_17_input_4 : PIPELINE_TYPE_FOR_CORE_3_KPU_17_INPUT_4;
    -- sfix(0, -12)
    signal core_3_kpu_17_input_5 : PIPELINE_TYPE_FOR_CORE_3_KPU_17_INPUT_5;
    -- sfix(-2, -12)
    signal core_3_kpu_17_input_6 : PIPELINE_TYPE_FOR_CORE_3_KPU_17_INPUT_6;
    -- sfix(0, -12)
    signal core_3_kpu_17_input_7 : PIPELINE_TYPE_FOR_CORE_3_KPU_17_INPUT_7;
    -- sfix(1, -12)
    signal core_3_kpu_17_input_8 : PIPELINE_TYPE_FOR_CORE_3_KPU_17_INPUT_8;
    -- sfix(-1, -12)
    signal core_3_kpu_17_input_9 : PIPELINE_TYPE_FOR_CORE_3_KPU_17_INPUT_9;
    -- sfix(-2, -12)
    signal core_3_kpu_18_input_1 : PIPELINE_TYPE_FOR_CORE_3_KPU_18_INPUT_1;
    -- sfix(0, -12)
    signal core_3_kpu_18_input_2 : PIPELINE_TYPE_FOR_CORE_3_KPU_18_INPUT_2;
    -- sfix(-1, -12)
    signal core_3_kpu_18_input_3 : PIPELINE_TYPE_FOR_CORE_3_KPU_18_INPUT_3;
    -- sfix(0, -12)
    signal core_3_kpu_18_input_4 : PIPELINE_TYPE_FOR_CORE_3_KPU_18_INPUT_4;
    -- sfix(0, -12)
    signal core_3_kpu_18_input_5 : PIPELINE_TYPE_FOR_CORE_3_KPU_18_INPUT_5;
    -- sfix(-1, -12)
    signal core_3_kpu_18_input_6 : PIPELINE_TYPE_FOR_CORE_3_KPU_18_INPUT_6;
    -- sfix(-1, -12)
    signal core_3_kpu_18_input_7 : PIPELINE_TYPE_FOR_CORE_3_KPU_18_INPUT_7;
    -- sfix(-2, -12)
    signal core_3_kpu_18_input_8 : PIPELINE_TYPE_FOR_CORE_3_KPU_18_INPUT_8;
    -- sfix(1, -12)
    signal core_3_kpu_18_input_9 : PIPELINE_TYPE_FOR_CORE_3_KPU_18_INPUT_9;
    -- sfix(3, -12)
    signal core_3_kpu_19_input_1 : PIPELINE_TYPE_FOR_CORE_3_KPU_19_INPUT_1;
    -- sfix(3, -12)
    signal core_3_kpu_19_input_2 : PIPELINE_TYPE_FOR_CORE_3_KPU_19_INPUT_2;
    -- sfix(2, -12)
    signal core_3_kpu_19_input_3 : PIPELINE_TYPE_FOR_CORE_3_KPU_19_INPUT_3;
    -- sfix(3, -12)
    signal core_3_kpu_19_input_4 : PIPELINE_TYPE_FOR_CORE_3_KPU_19_INPUT_4;
    -- sfix(3, -12)
    signal core_3_kpu_19_input_5 : PIPELINE_TYPE_FOR_CORE_3_KPU_19_INPUT_5;
    -- sfix(3, -12)
    signal core_3_kpu_19_input_6 : PIPELINE_TYPE_FOR_CORE_3_KPU_19_INPUT_6;
    -- sfix(2, -12)
    signal core_3_kpu_19_input_7 : PIPELINE_TYPE_FOR_CORE_3_KPU_19_INPUT_7;
    -- sfix(2, -12)
    signal core_3_kpu_19_input_8 : PIPELINE_TYPE_FOR_CORE_3_KPU_19_INPUT_8;
    -- sfix(3, -12)
    signal core_3_kpu_19_input_9 : PIPELINE_TYPE_FOR_CORE_3_KPU_19_INPUT_9;
    -- sfix(-2, -12)
    signal core_3_kpu_20_input_1 : PIPELINE_TYPE_FOR_CORE_3_KPU_20_INPUT_1;
    -- sfix(-1, -12)
    signal core_3_kpu_20_input_2 : PIPELINE_TYPE_FOR_CORE_3_KPU_20_INPUT_2;
    -- sfix(-3, -12)
    signal core_3_kpu_20_input_3 : PIPELINE_TYPE_FOR_CORE_3_KPU_20_INPUT_3;
    -- sfix(1, -12)
    signal core_3_kpu_20_input_4 : PIPELINE_TYPE_FOR_CORE_3_KPU_20_INPUT_4;
    -- sfix(1, -12)
    signal core_3_kpu_20_input_5 : PIPELINE_TYPE_FOR_CORE_3_KPU_20_INPUT_5;
    -- sfix(0, -12)
    signal core_3_kpu_20_input_6 : PIPELINE_TYPE_FOR_CORE_3_KPU_20_INPUT_6;
    -- sfix(1, -12)
    signal core_3_kpu_20_input_7 : PIPELINE_TYPE_FOR_CORE_3_KPU_20_INPUT_7;
    -- sfix(-3, -12)
    signal core_3_kpu_20_input_8 : PIPELINE_TYPE_FOR_CORE_3_KPU_20_INPUT_8;
    -- sfix(-2, -12)
    signal core_3_kpu_20_input_9 : PIPELINE_TYPE_FOR_CORE_3_KPU_20_INPUT_9;
    -- sfix(1, -12)
    signal core_3_kpu_21_input_1 : PIPELINE_TYPE_FOR_CORE_3_KPU_21_INPUT_1;
    -- sfix(1, -12)
    signal core_3_kpu_21_input_2 : PIPELINE_TYPE_FOR_CORE_3_KPU_21_INPUT_2;
    -- sfix(1, -12)
    signal core_3_kpu_21_input_3 : PIPELINE_TYPE_FOR_CORE_3_KPU_21_INPUT_3;
    -- sfix(1, -12)
    signal core_3_kpu_21_input_4 : PIPELINE_TYPE_FOR_CORE_3_KPU_21_INPUT_4;
    -- sfix(1, -12)
    signal core_3_kpu_21_input_5 : PIPELINE_TYPE_FOR_CORE_3_KPU_21_INPUT_5;
    -- sfix(1, -12)
    signal core_3_kpu_21_input_6 : PIPELINE_TYPE_FOR_CORE_3_KPU_21_INPUT_6;
    -- sfix(1, -12)
    signal core_3_kpu_21_input_7 : PIPELINE_TYPE_FOR_CORE_3_KPU_21_INPUT_7;
    -- sfix(1, -12)
    signal core_3_kpu_21_input_8 : PIPELINE_TYPE_FOR_CORE_3_KPU_21_INPUT_8;
    -- sfix(1, -12)
    signal core_3_kpu_21_input_9 : PIPELINE_TYPE_FOR_CORE_3_KPU_21_INPUT_9;
    -- sfix(2, -12)
    signal core_3_kpu_22_input_1 : PIPELINE_TYPE_FOR_CORE_3_KPU_22_INPUT_1;
    -- sfix(1, -12)
    signal core_3_kpu_22_input_2 : PIPELINE_TYPE_FOR_CORE_3_KPU_22_INPUT_2;
    -- sfix(1, -12)
    signal core_3_kpu_22_input_3 : PIPELINE_TYPE_FOR_CORE_3_KPU_22_INPUT_3;
    -- sfix(3, -12)
    signal core_3_kpu_22_input_4 : PIPELINE_TYPE_FOR_CORE_3_KPU_22_INPUT_4;
    -- sfix(0, -12)
    signal core_3_kpu_22_input_5 : PIPELINE_TYPE_FOR_CORE_3_KPU_22_INPUT_5;
    -- sfix(2, -12)
    signal core_3_kpu_22_input_6 : PIPELINE_TYPE_FOR_CORE_3_KPU_22_INPUT_6;
    -- sfix(1, -12)
    signal core_3_kpu_22_input_7 : PIPELINE_TYPE_FOR_CORE_3_KPU_22_INPUT_7;
    -- sfix(0, -12)
    signal core_3_kpu_22_input_8 : PIPELINE_TYPE_FOR_CORE_3_KPU_22_INPUT_8;
    -- sfix(1, -12)
    signal core_3_kpu_22_input_9 : PIPELINE_TYPE_FOR_CORE_3_KPU_22_INPUT_9;
    -- sfix(1, -12)
    signal core_3_kpu_23_input_1 : PIPELINE_TYPE_FOR_CORE_3_KPU_23_INPUT_1;
    -- sfix(1, -12)
    signal core_3_kpu_23_input_2 : PIPELINE_TYPE_FOR_CORE_3_KPU_23_INPUT_2;
    -- sfix(1, -12)
    signal core_3_kpu_23_input_3 : PIPELINE_TYPE_FOR_CORE_3_KPU_23_INPUT_3;
    -- sfix(1, -12)
    signal core_3_kpu_23_input_4 : PIPELINE_TYPE_FOR_CORE_3_KPU_23_INPUT_4;
    -- sfix(1, -12)
    signal core_3_kpu_23_input_5 : PIPELINE_TYPE_FOR_CORE_3_KPU_23_INPUT_5;
    -- sfix(1, -12)
    signal core_3_kpu_23_input_6 : PIPELINE_TYPE_FOR_CORE_3_KPU_23_INPUT_6;
    -- sfix(1, -12)
    signal core_3_kpu_23_input_7 : PIPELINE_TYPE_FOR_CORE_3_KPU_23_INPUT_7;
    -- sfix(1, -12)
    signal core_3_kpu_23_input_8 : PIPELINE_TYPE_FOR_CORE_3_KPU_23_INPUT_8;
    -- sfix(1, -12)
    signal core_3_kpu_23_input_9 : PIPELINE_TYPE_FOR_CORE_3_KPU_23_INPUT_9;
    -- sfix(0, -12)
    signal core_3_kpu_24_input_1 : PIPELINE_TYPE_FOR_CORE_3_KPU_24_INPUT_1;
    -- sfix(-1, -12)
    signal core_3_kpu_24_input_2 : PIPELINE_TYPE_FOR_CORE_3_KPU_24_INPUT_2;
    -- sfix(-3, -12)
    signal core_3_kpu_24_input_3 : PIPELINE_TYPE_FOR_CORE_3_KPU_24_INPUT_3;
    -- sfix(-1, -12)
    signal core_3_kpu_24_input_4 : PIPELINE_TYPE_FOR_CORE_3_KPU_24_INPUT_4;
    -- sfix(-1, -12)
    signal core_3_kpu_24_input_5 : PIPELINE_TYPE_FOR_CORE_3_KPU_24_INPUT_5;
    -- sfix(1, -12)
    signal core_3_kpu_24_input_6 : PIPELINE_TYPE_FOR_CORE_3_KPU_24_INPUT_6;
    -- sfix(-2, -12)
    signal core_3_kpu_24_input_7 : PIPELINE_TYPE_FOR_CORE_3_KPU_24_INPUT_7;
    -- sfix(1, -12)
    signal core_3_kpu_24_input_8 : PIPELINE_TYPE_FOR_CORE_3_KPU_24_INPUT_8;
    -- sfix(-1, -12)
    signal core_3_kpu_24_input_9 : PIPELINE_TYPE_FOR_CORE_3_KPU_24_INPUT_9;
    -- sfix(1, -12)
    signal core_3_kpu_25_input_1 : PIPELINE_TYPE_FOR_CORE_3_KPU_25_INPUT_1;
    -- sfix(1, -12)
    signal core_3_kpu_25_input_2 : PIPELINE_TYPE_FOR_CORE_3_KPU_25_INPUT_2;
    -- sfix(1, -12)
    signal core_3_kpu_25_input_3 : PIPELINE_TYPE_FOR_CORE_3_KPU_25_INPUT_3;
    -- sfix(1, -12)
    signal core_3_kpu_25_input_4 : PIPELINE_TYPE_FOR_CORE_3_KPU_25_INPUT_4;
    -- sfix(1, -12)
    signal core_3_kpu_25_input_5 : PIPELINE_TYPE_FOR_CORE_3_KPU_25_INPUT_5;
    -- sfix(1, -12)
    signal core_3_kpu_25_input_6 : PIPELINE_TYPE_FOR_CORE_3_KPU_25_INPUT_6;
    -- sfix(1, -12)
    signal core_3_kpu_25_input_7 : PIPELINE_TYPE_FOR_CORE_3_KPU_25_INPUT_7;
    -- sfix(1, -12)
    signal core_3_kpu_25_input_8 : PIPELINE_TYPE_FOR_CORE_3_KPU_25_INPUT_8;
    -- sfix(1, -12)
    signal core_3_kpu_25_input_9 : PIPELINE_TYPE_FOR_CORE_3_KPU_25_INPUT_9;
    -- sfix(-2, -12)
    signal core_3_kpu_26_input_1 : PIPELINE_TYPE_FOR_CORE_3_KPU_26_INPUT_1;
    -- sfix(0, -12)
    signal core_3_kpu_26_input_2 : PIPELINE_TYPE_FOR_CORE_3_KPU_26_INPUT_2;
    -- sfix(1, -12)
    signal core_3_kpu_26_input_3 : PIPELINE_TYPE_FOR_CORE_3_KPU_26_INPUT_3;
    -- sfix(-2, -12)
    signal core_3_kpu_26_input_4 : PIPELINE_TYPE_FOR_CORE_3_KPU_26_INPUT_4;
    -- sfix(0, -12)
    signal core_3_kpu_26_input_5 : PIPELINE_TYPE_FOR_CORE_3_KPU_26_INPUT_5;
    -- sfix(0, -12)
    signal core_3_kpu_26_input_6 : PIPELINE_TYPE_FOR_CORE_3_KPU_26_INPUT_6;
    -- sfix(-2, -12)
    signal core_3_kpu_26_input_7 : PIPELINE_TYPE_FOR_CORE_3_KPU_26_INPUT_7;
    -- sfix(1, -12)
    signal core_3_kpu_26_input_8 : PIPELINE_TYPE_FOR_CORE_3_KPU_26_INPUT_8;
    -- sfix(0, -12)
    signal core_3_kpu_26_input_9 : PIPELINE_TYPE_FOR_CORE_3_KPU_26_INPUT_9;
    -- sfix(-2, -12)
    signal core_3_kpu_27_input_1 : PIPELINE_TYPE_FOR_CORE_3_KPU_27_INPUT_1;
    -- sfix(0, -12)
    signal core_3_kpu_27_input_2 : PIPELINE_TYPE_FOR_CORE_3_KPU_27_INPUT_2;
    -- sfix(0, -12)
    signal core_3_kpu_27_input_3 : PIPELINE_TYPE_FOR_CORE_3_KPU_27_INPUT_3;
    -- sfix(-2, -12)
    signal core_3_kpu_27_input_4 : PIPELINE_TYPE_FOR_CORE_3_KPU_27_INPUT_4;
    -- sfix(0, -12)
    signal core_3_kpu_27_input_5 : PIPELINE_TYPE_FOR_CORE_3_KPU_27_INPUT_5;
    -- sfix(0, -12)
    signal core_3_kpu_27_input_6 : PIPELINE_TYPE_FOR_CORE_3_KPU_27_INPUT_6;
    -- sfix(1, -12)
    signal core_3_kpu_27_input_7 : PIPELINE_TYPE_FOR_CORE_3_KPU_27_INPUT_7;
    -- sfix(0, -12)
    signal core_3_kpu_27_input_8 : PIPELINE_TYPE_FOR_CORE_3_KPU_27_INPUT_8;
    -- sfix(0, -12)
    signal core_3_kpu_27_input_9 : PIPELINE_TYPE_FOR_CORE_3_KPU_27_INPUT_9;
    -- sfix(1, -12)
    signal core_3_kpu_28_input_1 : PIPELINE_TYPE_FOR_CORE_3_KPU_28_INPUT_1;
    -- sfix(1, -12)
    signal core_3_kpu_28_input_2 : PIPELINE_TYPE_FOR_CORE_3_KPU_28_INPUT_2;
    -- sfix(1, -12)
    signal core_3_kpu_28_input_3 : PIPELINE_TYPE_FOR_CORE_3_KPU_28_INPUT_3;
    -- sfix(1, -12)
    signal core_3_kpu_28_input_4 : PIPELINE_TYPE_FOR_CORE_3_KPU_28_INPUT_4;
    -- sfix(1, -12)
    signal core_3_kpu_28_input_5 : PIPELINE_TYPE_FOR_CORE_3_KPU_28_INPUT_5;
    -- sfix(1, -12)
    signal core_3_kpu_28_input_6 : PIPELINE_TYPE_FOR_CORE_3_KPU_28_INPUT_6;
    -- sfix(1, -12)
    signal core_3_kpu_28_input_7 : PIPELINE_TYPE_FOR_CORE_3_KPU_28_INPUT_7;
    -- sfix(1, -12)
    signal core_3_kpu_28_input_8 : PIPELINE_TYPE_FOR_CORE_3_KPU_28_INPUT_8;
    -- sfix(1, -12)
    signal core_3_kpu_28_input_9 : PIPELINE_TYPE_FOR_CORE_3_KPU_28_INPUT_9;
    -- sfix(2, -12)
    signal core_3_kpu_29_input_1 : PIPELINE_TYPE_FOR_CORE_3_KPU_29_INPUT_1;
    -- sfix(2, -12)
    signal core_3_kpu_29_input_2 : PIPELINE_TYPE_FOR_CORE_3_KPU_29_INPUT_2;
    -- sfix(1, -12)
    signal core_3_kpu_29_input_3 : PIPELINE_TYPE_FOR_CORE_3_KPU_29_INPUT_3;
    -- sfix(2, -12)
    signal core_3_kpu_29_input_4 : PIPELINE_TYPE_FOR_CORE_3_KPU_29_INPUT_4;
    -- sfix(1, -12)
    signal core_3_kpu_29_input_5 : PIPELINE_TYPE_FOR_CORE_3_KPU_29_INPUT_5;
    -- sfix(-2, -12)
    signal core_3_kpu_29_input_6 : PIPELINE_TYPE_FOR_CORE_3_KPU_29_INPUT_6;
    -- sfix(-1, -12)
    signal core_3_kpu_29_input_7 : PIPELINE_TYPE_FOR_CORE_3_KPU_29_INPUT_7;
    -- sfix(1, -12)
    signal core_3_kpu_29_input_8 : PIPELINE_TYPE_FOR_CORE_3_KPU_29_INPUT_8;
    -- sfix(1, -12)
    signal core_3_kpu_29_input_9 : PIPELINE_TYPE_FOR_CORE_3_KPU_29_INPUT_9;
    -- sfix(-1, -12)
    signal core_3_kpu_30_input_1 : PIPELINE_TYPE_FOR_CORE_3_KPU_30_INPUT_1;
    -- sfix(-1, -12)
    signal core_3_kpu_30_input_2 : PIPELINE_TYPE_FOR_CORE_3_KPU_30_INPUT_2;
    -- sfix(-2, -12)
    signal core_3_kpu_30_input_3 : PIPELINE_TYPE_FOR_CORE_3_KPU_30_INPUT_3;
    -- sfix(0, -12)
    signal core_3_kpu_30_input_4 : PIPELINE_TYPE_FOR_CORE_3_KPU_30_INPUT_4;
    -- sfix(0, -12)
    signal core_3_kpu_30_input_5 : PIPELINE_TYPE_FOR_CORE_3_KPU_30_INPUT_5;
    -- sfix(-2, -12)
    signal core_3_kpu_30_input_6 : PIPELINE_TYPE_FOR_CORE_3_KPU_30_INPUT_6;
    -- sfix(-2, -12)
    signal core_3_kpu_30_input_7 : PIPELINE_TYPE_FOR_CORE_3_KPU_30_INPUT_7;
    -- sfix(1, -12)
    signal core_3_kpu_30_input_8 : PIPELINE_TYPE_FOR_CORE_3_KPU_30_INPUT_8;
    -- sfix(1, -12)
    signal core_3_kpu_30_input_9 : PIPELINE_TYPE_FOR_CORE_3_KPU_30_INPUT_9;
    -- sfix(1, -12)
    signal core_3_kpu_31_input_1 : PIPELINE_TYPE_FOR_CORE_3_KPU_31_INPUT_1;
    -- sfix(1, -12)
    signal core_3_kpu_31_input_2 : PIPELINE_TYPE_FOR_CORE_3_KPU_31_INPUT_2;
    -- sfix(1, -12)
    signal core_3_kpu_31_input_3 : PIPELINE_TYPE_FOR_CORE_3_KPU_31_INPUT_3;
    -- sfix(1, -12)
    signal core_3_kpu_31_input_4 : PIPELINE_TYPE_FOR_CORE_3_KPU_31_INPUT_4;
    -- sfix(1, -12)
    signal core_3_kpu_31_input_5 : PIPELINE_TYPE_FOR_CORE_3_KPU_31_INPUT_5;
    -- sfix(1, -12)
    signal core_3_kpu_31_input_6 : PIPELINE_TYPE_FOR_CORE_3_KPU_31_INPUT_6;
    -- sfix(1, -12)
    signal core_3_kpu_31_input_7 : PIPELINE_TYPE_FOR_CORE_3_KPU_31_INPUT_7;
    -- sfix(1, -12)
    signal core_3_kpu_31_input_8 : PIPELINE_TYPE_FOR_CORE_3_KPU_31_INPUT_8;
    -- sfix(1, -12)
    signal core_3_kpu_31_input_9 : PIPELINE_TYPE_FOR_CORE_3_KPU_31_INPUT_9;
    -- sfix(-1, -12)
    signal core_3_kpu_32_input_1 : PIPELINE_TYPE_FOR_CORE_3_KPU_32_INPUT_1;
    -- sfix(1, -12)
    signal core_3_kpu_32_input_2 : PIPELINE_TYPE_FOR_CORE_3_KPU_32_INPUT_2;
    -- sfix(1, -12)
    signal core_3_kpu_32_input_3 : PIPELINE_TYPE_FOR_CORE_3_KPU_32_INPUT_3;
    -- sfix(-3, -12)
    signal core_3_kpu_32_input_4 : PIPELINE_TYPE_FOR_CORE_3_KPU_32_INPUT_4;
    -- sfix(-2, -12)
    signal core_3_kpu_32_input_5 : PIPELINE_TYPE_FOR_CORE_3_KPU_32_INPUT_5;
    -- sfix(-2, -12)
    signal core_3_kpu_32_input_6 : PIPELINE_TYPE_FOR_CORE_3_KPU_32_INPUT_6;
    -- sfix(-1, -12)
    signal core_3_kpu_32_input_7 : PIPELINE_TYPE_FOR_CORE_3_KPU_32_INPUT_7;
    -- sfix(-3, -12)
    signal core_3_kpu_32_input_8 : PIPELINE_TYPE_FOR_CORE_3_KPU_32_INPUT_8;
    -- sfix(1, -12)
    signal core_3_kpu_32_input_9 : PIPELINE_TYPE_FOR_CORE_3_KPU_32_INPUT_9;

    -- All KPU outputs
    -- sfix(1, -12)
    signal signal_core_1_yo_1   : PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_1;
    -- sfix(3, -12)
    signal signal_core_1_yo_2   : PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_2;
    -- sfix(5, -12)
    signal signal_core_1_yo_3   : PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_3;
    -- sfix(1, -12)
    signal signal_core_1_yo_4   : PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_4;
    -- sfix(6, -12)
    signal signal_core_1_yo_5   : PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_5;
    -- sfix(3, -12)
    signal signal_core_1_yo_6   : PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_6;
    -- sfix(3, -12)
    signal signal_core_1_yo_7   : PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_7;
    -- sfix(2, -12)
    signal signal_core_1_yo_8   : PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_8;
    -- sfix(1, -12)
    signal signal_core_1_yo_9   : PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_9;
    -- sfix(1, -12)
    signal signal_core_1_yo_10  : PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_10;
    -- sfix(1, -12)
    signal signal_core_1_yo_11  : PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_11;
    -- sfix(6, -12)
    signal signal_core_1_yo_12  : PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_12;
    -- sfix(6, -12)
    signal signal_core_1_yo_13  : PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_13;
    -- sfix(4, -12)
    signal signal_core_1_yo_14  : PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_14;
    -- sfix(1, -12)
    signal signal_core_1_yo_15  : PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_15;
    -- sfix(5, -12)
    signal signal_core_1_yo_16  : PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_16;
    -- sfix(5, -12)
    signal signal_core_1_yo_17  : PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_17;
    -- sfix(6, -12)
    signal signal_core_1_yo_18  : PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_18;
    -- sfix(7, -12)
    signal signal_core_1_yo_19  : PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_19;
    -- sfix(5, -12)
    signal signal_core_1_yo_20  : PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_20;
    -- sfix(1, -12)
    signal signal_core_1_yo_21  : PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_21;
    -- sfix(6, -12)
    signal signal_core_1_yo_22  : PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_22;
    -- sfix(1, -12)
    signal signal_core_1_yo_23  : PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_23;
    -- sfix(4, -12)
    signal signal_core_1_yo_24  : PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_24;
    -- sfix(1, -12)
    signal signal_core_1_yo_25  : PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_25;
    -- sfix(3, -12)
    signal signal_core_1_yo_26  : PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_26;
    -- sfix(3, -12)
    signal signal_core_1_yo_27  : PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_27;
    -- sfix(1, -12)
    signal signal_core_1_yo_28  : PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_28;
    -- sfix(6, -12)
    signal signal_core_1_yo_29  : PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_29;
    -- sfix(3, -12)
    signal signal_core_1_yo_30  : PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_30;
    -- sfix(1, -12)
    signal signal_core_1_yo_31  : PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_31;
    -- sfix(5, -12)
    signal signal_core_1_yo_32  : PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_32;
    -- sfix(1, -12)
    signal signal_core_2_yo_1   : PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_1;
    -- sfix(3, -12)
    signal signal_core_2_yo_2   : PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_2;
    -- sfix(4, -12)
    signal signal_core_2_yo_3   : PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_3;
    -- sfix(1, -12)
    signal signal_core_2_yo_4   : PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_4;
    -- sfix(7, -12)
    signal signal_core_2_yo_5   : PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_5;
    -- sfix(5, -12)
    signal signal_core_2_yo_6   : PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_6;
    -- sfix(4, -12)
    signal signal_core_2_yo_7   : PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_7;
    -- sfix(2, -12)
    signal signal_core_2_yo_8   : PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_8;
    -- sfix(1, -12)
    signal signal_core_2_yo_9   : PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_9;
    -- sfix(1, -12)
    signal signal_core_2_yo_10  : PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_10;
    -- sfix(1, -12)
    signal signal_core_2_yo_11  : PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_11;
    -- sfix(7, -12)
    signal signal_core_2_yo_12  : PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_12;
    -- sfix(3, -12)
    signal signal_core_2_yo_13  : PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_13;
    -- sfix(5, -12)
    signal signal_core_2_yo_14  : PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_14;
    -- sfix(1, -12)
    signal signal_core_2_yo_15  : PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_15;
    -- sfix(5, -12)
    signal signal_core_2_yo_16  : PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_16;
    -- sfix(5, -12)
    signal signal_core_2_yo_17  : PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_17;
    -- sfix(3, -12)
    signal signal_core_2_yo_18  : PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_18;
    -- sfix(4, -12)
    signal signal_core_2_yo_19  : PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_19;
    -- sfix(5, -12)
    signal signal_core_2_yo_20  : PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_20;
    -- sfix(1, -12)
    signal signal_core_2_yo_21  : PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_21;
    -- sfix(6, -12)
    signal signal_core_2_yo_22  : PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_22;
    -- sfix(1, -12)
    signal signal_core_2_yo_23  : PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_23;
    -- sfix(4, -12)
    signal signal_core_2_yo_24  : PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_24;
    -- sfix(1, -12)
    signal signal_core_2_yo_25  : PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_25;
    -- sfix(5, -12)
    signal signal_core_2_yo_26  : PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_26;
    -- sfix(5, -12)
    signal signal_core_2_yo_27  : PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_27;
    -- sfix(1, -12)
    signal signal_core_2_yo_28  : PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_28;
    -- sfix(7, -12)
    signal signal_core_2_yo_29  : PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_29;
    -- sfix(4, -12)
    signal signal_core_2_yo_30  : PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_30;
    -- sfix(1, -12)
    signal signal_core_2_yo_31  : PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_31;
    -- sfix(4, -12)
    signal signal_core_2_yo_32  : PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_32;
    -- sfix(1, -12)
    signal signal_core_3_yo_1   : PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_1;
    -- sfix(2, -12)
    signal signal_core_3_yo_2   : PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_2;
    -- sfix(5, -12)
    signal signal_core_3_yo_3   : PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_3;
    -- sfix(1, -12)
    signal signal_core_3_yo_4   : PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_4;
    -- sfix(8, -12)
    signal signal_core_3_yo_5   : PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_5;
    -- sfix(7, -12)
    signal signal_core_3_yo_6   : PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_6;
    -- sfix(4, -12)
    signal signal_core_3_yo_7   : PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_7;
    -- sfix(4, -12)
    signal signal_core_3_yo_8   : PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_8;
    -- sfix(1, -12)
    signal signal_core_3_yo_9   : PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_9;
    -- sfix(1, -12)
    signal signal_core_3_yo_10  : PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_10;
    -- sfix(1, -12)
    signal signal_core_3_yo_11  : PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_11;
    -- sfix(5, -12)
    signal signal_core_3_yo_12  : PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_12;
    -- sfix(6, -12)
    signal signal_core_3_yo_13  : PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_13;
    -- sfix(4, -12)
    signal signal_core_3_yo_14  : PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_14;
    -- sfix(1, -12)
    signal signal_core_3_yo_15  : PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_15;
    -- sfix(5, -12)
    signal signal_core_3_yo_16  : PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_16;
    -- sfix(5, -12)
    signal signal_core_3_yo_17  : PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_17;
    -- sfix(3, -12)
    signal signal_core_3_yo_18  : PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_18;
    -- sfix(7, -12)
    signal signal_core_3_yo_19  : PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_19;
    -- sfix(4, -12)
    signal signal_core_3_yo_20  : PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_20;
    -- sfix(1, -12)
    signal signal_core_3_yo_21  : PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_21;
    -- sfix(5, -12)
    signal signal_core_3_yo_22  : PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_22;
    -- sfix(1, -12)
    signal signal_core_3_yo_23  : PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_23;
    -- sfix(3, -12)
    signal signal_core_3_yo_24  : PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_24;
    -- sfix(1, -12)
    signal signal_core_3_yo_25  : PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_25;
    -- sfix(4, -12)
    signal signal_core_3_yo_26  : PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_26;
    -- sfix(4, -12)
    signal signal_core_3_yo_27  : PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_27;
    -- sfix(1, -12)
    signal signal_core_3_yo_28  : PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_28;
    -- sfix(5, -12)
    signal signal_core_3_yo_29  : PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_29;
    -- sfix(3, -12)
    signal signal_core_3_yo_30  : PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_30;
    -- sfix(1, -12)
    signal signal_core_3_yo_31  : PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_31;
    -- sfix(4, -12)
    signal signal_core_3_yo_32  : PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_32;

    -- All pre layer outputs
    -- sfix(10, -12)
    signal layer_yo_1_pre       : PIPELINE_TYPE_FOR_LAYER_YO_1_PRE;
    -- sfix(10, -12)
    signal layer_yo_2_pre       : PIPELINE_TYPE_FOR_LAYER_YO_2_PRE;
    -- sfix(10, -12)
    signal layer_yo_3_pre       : PIPELINE_TYPE_FOR_LAYER_YO_3_PRE;
    -- sfix(10, -12)
    signal layer_yo_4_pre       : PIPELINE_TYPE_FOR_LAYER_YO_4_PRE;
    -- sfix(10, -12)
    signal layer_yo_5_pre       : PIPELINE_TYPE_FOR_LAYER_YO_5_PRE;
    -- sfix(10, -12)
    signal layer_yo_6_pre       : PIPELINE_TYPE_FOR_LAYER_YO_6_PRE;
    -- sfix(10, -12)
    signal layer_yo_7_pre       : PIPELINE_TYPE_FOR_LAYER_YO_7_PRE;
    -- sfix(10, -12)
    signal layer_yo_8_pre       : PIPELINE_TYPE_FOR_LAYER_YO_8_PRE;
    -- sfix(10, -12)
    signal layer_yo_9_pre       : PIPELINE_TYPE_FOR_LAYER_YO_9_PRE;
    -- sfix(10, -12)
    signal layer_yo_10_pre      : PIPELINE_TYPE_FOR_LAYER_YO_10_PRE;
    -- sfix(10, -12)
    signal layer_yo_11_pre      : PIPELINE_TYPE_FOR_LAYER_YO_11_PRE;
    -- sfix(10, -12)
    signal layer_yo_12_pre      : PIPELINE_TYPE_FOR_LAYER_YO_12_PRE;
    -- sfix(10, -12)
    signal layer_yo_13_pre      : PIPELINE_TYPE_FOR_LAYER_YO_13_PRE;
    -- sfix(10, -12)
    signal layer_yo_14_pre      : PIPELINE_TYPE_FOR_LAYER_YO_14_PRE;
    -- sfix(10, -12)
    signal layer_yo_15_pre      : PIPELINE_TYPE_FOR_LAYER_YO_15_PRE;
    -- sfix(10, -12)
    signal layer_yo_16_pre      : PIPELINE_TYPE_FOR_LAYER_YO_16_PRE;
    -- sfix(10, -12)
    signal layer_yo_17_pre      : PIPELINE_TYPE_FOR_LAYER_YO_17_PRE;
    -- sfix(10, -12)
    signal layer_yo_18_pre      : PIPELINE_TYPE_FOR_LAYER_YO_18_PRE;
    -- sfix(10, -12)
    signal layer_yo_19_pre      : PIPELINE_TYPE_FOR_LAYER_YO_19_PRE;
    -- sfix(10, -12)
    signal layer_yo_20_pre      : PIPELINE_TYPE_FOR_LAYER_YO_20_PRE;
    -- sfix(10, -12)
    signal layer_yo_21_pre      : PIPELINE_TYPE_FOR_LAYER_YO_21_PRE;
    -- sfix(10, -12)
    signal layer_yo_22_pre      : PIPELINE_TYPE_FOR_LAYER_YO_22_PRE;
    -- sfix(10, -12)
    signal layer_yo_23_pre      : PIPELINE_TYPE_FOR_LAYER_YO_23_PRE;
    -- sfix(10, -12)
    signal layer_yo_24_pre      : PIPELINE_TYPE_FOR_LAYER_YO_24_PRE;
    -- sfix(10, -12)
    signal layer_yo_25_pre      : PIPELINE_TYPE_FOR_LAYER_YO_25_PRE;
    -- sfix(10, -12)
    signal layer_yo_26_pre      : PIPELINE_TYPE_FOR_LAYER_YO_26_PRE;
    -- sfix(10, -12)
    signal layer_yo_27_pre      : PIPELINE_TYPE_FOR_LAYER_YO_27_PRE;
    -- sfix(10, -12)
    signal layer_yo_28_pre      : PIPELINE_TYPE_FOR_LAYER_YO_28_PRE;
    -- sfix(10, -12)
    signal layer_yo_29_pre      : PIPELINE_TYPE_FOR_LAYER_YO_29_PRE;
    -- sfix(10, -12)
    signal layer_yo_30_pre      : PIPELINE_TYPE_FOR_LAYER_YO_30_PRE;
    -- sfix(10, -12)
    signal layer_yo_31_pre      : PIPELINE_TYPE_FOR_LAYER_YO_31_PRE;
    -- sfix(10, -12)
    signal layer_yo_32_pre      : PIPELINE_TYPE_FOR_LAYER_YO_32_PRE;

    -- All layer outputs with one additional msb bit
    -- 
    signal layer_yo_1_unclipped : PIPELINE_TYPE_FOR_LAYER_YO_1_UNCLIPPED;
    -- 
    signal layer_yo_2_unclipped : PIPELINE_TYPE_FOR_LAYER_YO_2_UNCLIPPED;
    -- 
    signal layer_yo_3_unclipped : PIPELINE_TYPE_FOR_LAYER_YO_3_UNCLIPPED;
    -- 
    signal layer_yo_4_unclipped : PIPELINE_TYPE_FOR_LAYER_YO_4_UNCLIPPED;
    -- 
    signal layer_yo_5_unclipped : PIPELINE_TYPE_FOR_LAYER_YO_5_UNCLIPPED;
    -- 
    signal layer_yo_6_unclipped : PIPELINE_TYPE_FOR_LAYER_YO_6_UNCLIPPED;
    -- 
    signal layer_yo_7_unclipped : PIPELINE_TYPE_FOR_LAYER_YO_7_UNCLIPPED;
    -- 
    signal layer_yo_8_unclipped : PIPELINE_TYPE_FOR_LAYER_YO_8_UNCLIPPED;
    -- 
    signal layer_yo_9_unclipped : PIPELINE_TYPE_FOR_LAYER_YO_9_UNCLIPPED;
    -- 
    signal layer_yo_10_unclipped : PIPELINE_TYPE_FOR_LAYER_YO_10_UNCLIPPED;
    -- 
    signal layer_yo_11_unclipped : PIPELINE_TYPE_FOR_LAYER_YO_11_UNCLIPPED;
    -- 
    signal layer_yo_12_unclipped : PIPELINE_TYPE_FOR_LAYER_YO_12_UNCLIPPED;
    -- 
    signal layer_yo_13_unclipped : PIPELINE_TYPE_FOR_LAYER_YO_13_UNCLIPPED;
    -- 
    signal layer_yo_14_unclipped : PIPELINE_TYPE_FOR_LAYER_YO_14_UNCLIPPED;
    -- 
    signal layer_yo_15_unclipped : PIPELINE_TYPE_FOR_LAYER_YO_15_UNCLIPPED;
    -- 
    signal layer_yo_16_unclipped : PIPELINE_TYPE_FOR_LAYER_YO_16_UNCLIPPED;
    -- 
    signal layer_yo_17_unclipped : PIPELINE_TYPE_FOR_LAYER_YO_17_UNCLIPPED;
    -- 
    signal layer_yo_18_unclipped : PIPELINE_TYPE_FOR_LAYER_YO_18_UNCLIPPED;
    -- 
    signal layer_yo_19_unclipped : PIPELINE_TYPE_FOR_LAYER_YO_19_UNCLIPPED;
    -- 
    signal layer_yo_20_unclipped : PIPELINE_TYPE_FOR_LAYER_YO_20_UNCLIPPED;
    -- 
    signal layer_yo_21_unclipped : PIPELINE_TYPE_FOR_LAYER_YO_21_UNCLIPPED;
    -- 
    signal layer_yo_22_unclipped : PIPELINE_TYPE_FOR_LAYER_YO_22_UNCLIPPED;
    -- 
    signal layer_yo_23_unclipped : PIPELINE_TYPE_FOR_LAYER_YO_23_UNCLIPPED;
    -- 
    signal layer_yo_24_unclipped : PIPELINE_TYPE_FOR_LAYER_YO_24_UNCLIPPED;
    -- 
    signal layer_yo_25_unclipped : PIPELINE_TYPE_FOR_LAYER_YO_25_UNCLIPPED;
    -- 
    signal layer_yo_26_unclipped : PIPELINE_TYPE_FOR_LAYER_YO_26_UNCLIPPED;
    -- 
    signal layer_yo_27_unclipped : PIPELINE_TYPE_FOR_LAYER_YO_27_UNCLIPPED;
    -- 
    signal layer_yo_28_unclipped : PIPELINE_TYPE_FOR_LAYER_YO_28_UNCLIPPED;
    -- 
    signal layer_yo_29_unclipped : PIPELINE_TYPE_FOR_LAYER_YO_29_UNCLIPPED;
    -- 
    signal layer_yo_30_unclipped : PIPELINE_TYPE_FOR_LAYER_YO_30_UNCLIPPED;
    -- 
    signal layer_yo_31_unclipped : PIPELINE_TYPE_FOR_LAYER_YO_31_UNCLIPPED;
    -- 
    signal layer_yo_32_unclipped : PIPELINE_TYPE_FOR_LAYER_YO_32_UNCLIPPED;
    -- sfix(10, -12)
    signal bias_add_input_1_signal : PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_1_SIGNAL;
    -- sfix(10, -12)
    signal bias_add_input_2_signal : PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_2_SIGNAL;
    -- sfix(10, -12)
    signal bias_add_input_3_signal : PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_3_SIGNAL;
    -- sfix(10, -12)
    signal bias_add_input_4_signal : PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_4_SIGNAL;
    -- sfix(10, -12)
    signal bias_add_input_5_signal : PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_5_SIGNAL;
    -- sfix(10, -12)
    signal bias_add_input_6_signal : PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_6_SIGNAL;
    -- sfix(10, -12)
    signal bias_add_input_7_signal : PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_7_SIGNAL;
    -- sfix(10, -12)
    signal bias_add_input_8_signal : PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_8_SIGNAL;
    -- sfix(10, -12)
    signal bias_add_input_9_signal : PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_9_SIGNAL;
    -- sfix(10, -12)
    signal bias_add_input_10_signal : PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_10_SIGNAL;
    -- sfix(10, -12)
    signal bias_add_input_11_signal : PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_11_SIGNAL;
    -- sfix(10, -12)
    signal bias_add_input_12_signal : PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_12_SIGNAL;
    -- sfix(10, -12)
    signal bias_add_input_13_signal : PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_13_SIGNAL;
    -- sfix(10, -12)
    signal bias_add_input_14_signal : PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_14_SIGNAL;
    -- sfix(10, -12)
    signal bias_add_input_15_signal : PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_15_SIGNAL;
    -- sfix(10, -12)
    signal bias_add_input_16_signal : PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_16_SIGNAL;
    -- sfix(10, -12)
    signal bias_add_input_17_signal : PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_17_SIGNAL;
    -- sfix(10, -12)
    signal bias_add_input_18_signal : PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_18_SIGNAL;
    -- sfix(10, -12)
    signal bias_add_input_19_signal : PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_19_SIGNAL;
    -- sfix(10, -12)
    signal bias_add_input_20_signal : PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_20_SIGNAL;
    -- sfix(10, -12)
    signal bias_add_input_21_signal : PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_21_SIGNAL;
    -- sfix(10, -12)
    signal bias_add_input_22_signal : PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_22_SIGNAL;
    -- sfix(10, -12)
    signal bias_add_input_23_signal : PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_23_SIGNAL;
    -- sfix(10, -12)
    signal bias_add_input_24_signal : PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_24_SIGNAL;
    -- sfix(10, -12)
    signal bias_add_input_25_signal : PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_25_SIGNAL;
    -- sfix(10, -12)
    signal bias_add_input_26_signal : PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_26_SIGNAL;
    -- sfix(10, -12)
    signal bias_add_input_27_signal : PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_27_SIGNAL;
    -- sfix(10, -12)
    signal bias_add_input_28_signal : PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_28_SIGNAL;
    -- sfix(10, -12)
    signal bias_add_input_29_signal : PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_29_SIGNAL;
    -- sfix(10, -12)
    signal bias_add_input_30_signal : PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_30_SIGNAL;
    -- sfix(10, -12)
    signal bias_add_input_31_signal : PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_31_SIGNAL;
    -- sfix(10, -12)
    signal bias_add_input_32_signal : PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_32_SIGNAL;


    -- sfix(3, -12) biggest values in sum are: [[0.] [0.] [0.]]
    signal accu_1_signal        : PIPELINE_TYPE_FOR_ACCU_1_SIGNAL;
    -- sfix(5, -12) biggest values in sum are: [[ 8.] [11.] [ 4.]]
    signal accu_2_signal        : PIPELINE_TYPE_FOR_ACCU_2_SIGNAL;
    -- sfix(7, -12) biggest values in sum are: [[29.] [10.] [13.]]
    signal accu_3_signal        : PIPELINE_TYPE_FOR_ACCU_3_SIGNAL;
    -- sfix(3, -12) biggest values in sum are: [[0.] [0.] [0.]]
    signal accu_4_signal        : PIPELINE_TYPE_FOR_ACCU_4_SIGNAL;
    -- sfix(10, -12) biggest values in sum are: [[45.] [65.] [20.]]
    signal accu_5_signal        : PIPELINE_TYPE_FOR_ACCU_5_SIGNAL;
    -- sfix(9, -12) biggest values in sum are: [[17.] [23.] [ 7.]]
    signal accu_6_signal        : PIPELINE_TYPE_FOR_ACCU_6_SIGNAL;
    -- sfix(6, -12) biggest values in sum are: [[ 8.] [10.] [ 8.]]
    signal accu_7_signal        : PIPELINE_TYPE_FOR_ACCU_7_SIGNAL;
    -- sfix(6, -12) biggest values in sum are: [[ 3.] [ 3.] [10.]]
    signal accu_8_signal        : PIPELINE_TYPE_FOR_ACCU_8_SIGNAL;
    -- sfix(3, -12) biggest values in sum are: [[0.] [0.] [0.]]
    signal accu_9_signal        : PIPELINE_TYPE_FOR_ACCU_9_SIGNAL;
    -- sfix(3, -12) biggest values in sum are: [[0.] [0.] [0.]]
    signal accu_10_signal       : PIPELINE_TYPE_FOR_ACCU_10_SIGNAL;
    -- sfix(3, -12) biggest values in sum are: [[0.] [0.] [0.]]
    signal accu_11_signal       : PIPELINE_TYPE_FOR_ACCU_11_SIGNAL;
    -- sfix(9, -12) biggest values in sum are: [[44.] [69.] [20.]]
    signal accu_12_signal       : PIPELINE_TYPE_FOR_ACCU_12_SIGNAL;
    -- sfix(8, -12) biggest values in sum are: [[40.] [ 6.] [33.]]
    signal accu_13_signal       : PIPELINE_TYPE_FOR_ACCU_13_SIGNAL;
    -- sfix(7, -12) biggest values in sum are: [[ 8.] [17.] [ 9.]]
    signal accu_14_signal       : PIPELINE_TYPE_FOR_ACCU_14_SIGNAL;
    -- sfix(3, -12) biggest values in sum are: [[1.] [1.] [1.]]
    signal accu_15_signal       : PIPELINE_TYPE_FOR_ACCU_15_SIGNAL;
    -- sfix(7, -12) biggest values in sum are: [[25.] [36.] [13.]]
    signal accu_16_signal       : PIPELINE_TYPE_FOR_ACCU_16_SIGNAL;
    -- sfix(7, -12) biggest values in sum are: [[36.] [43.] [23.]]
    signal accu_17_signal       : PIPELINE_TYPE_FOR_ACCU_17_SIGNAL;
    -- sfix(8, -12) biggest values in sum are: [[16.] [ 7.] [ 6.]]
    signal accu_18_signal       : PIPELINE_TYPE_FOR_ACCU_18_SIGNAL;
    -- sfix(9, -12) biggest values in sum are: [[46.] [10.] [53.]]
    signal accu_19_signal       : PIPELINE_TYPE_FOR_ACCU_19_SIGNAL;
    -- sfix(7, -12) biggest values in sum are: [[17.] [26.] [15.]]
    signal accu_20_signal       : PIPELINE_TYPE_FOR_ACCU_20_SIGNAL;
    -- sfix(3, -12) biggest values in sum are: [[0.] [0.] [0.]]
    signal accu_21_signal       : PIPELINE_TYPE_FOR_ACCU_21_SIGNAL;
    -- sfix(8, -12) biggest values in sum are: [[55.] [56.] [32.]]
    signal accu_22_signal       : PIPELINE_TYPE_FOR_ACCU_22_SIGNAL;
    -- sfix(3, -12) biggest values in sum are: [[0.] [0.] [0.]]
    signal accu_23_signal       : PIPELINE_TYPE_FOR_ACCU_23_SIGNAL;
    -- sfix(6, -12) biggest values in sum are: [[14.] [19.] [ 6.]]
    signal accu_24_signal       : PIPELINE_TYPE_FOR_ACCU_24_SIGNAL;
    -- sfix(3, -12) biggest values in sum are: [[0.] [0.] [0.]]
    signal accu_25_signal       : PIPELINE_TYPE_FOR_ACCU_25_SIGNAL;
    -- sfix(7, -12) biggest values in sum are: [[ 8.] [11.] [ 9.]]
    signal accu_26_signal       : PIPELINE_TYPE_FOR_ACCU_26_SIGNAL;
    -- sfix(7, -12) biggest values in sum are: [[ 5.] [16.] [ 5.]]
    signal accu_27_signal       : PIPELINE_TYPE_FOR_ACCU_27_SIGNAL;
    -- sfix(3, -12) biggest values in sum are: [[0.] [0.] [0.]]
    signal accu_28_signal       : PIPELINE_TYPE_FOR_ACCU_28_SIGNAL;
    -- sfix(9, -12) biggest values in sum are: [[53.] [90.] [24.]]
    signal accu_29_signal       : PIPELINE_TYPE_FOR_ACCU_29_SIGNAL;
    -- sfix(6, -12) biggest values in sum are: [[ 5.] [15.] [10.]]
    signal accu_30_signal       : PIPELINE_TYPE_FOR_ACCU_30_SIGNAL;
    -- sfix(3, -12) biggest values in sum are: [[0.] [0.] [0.]]
    signal accu_31_signal       : PIPELINE_TYPE_FOR_ACCU_31_SIGNAL;
    -- sfix(7, -12) biggest values in sum are: [[17.] [21.] [ 9.]]
    signal accu_32_signal       : PIPELINE_TYPE_FOR_ACCU_32_SIGNAL;


begin

-- "Initialize" stuff

    layer_xi_1_signal(0) <= layer_xi_1;
    layer_xi_2_signal(0) <= layer_xi_2;
    layer_xi_3_signal(0) <= layer_xi_3;

-- # # # Stage 1: Produce all control signals! # # #
-- # # # IN:  x_is_valid, sel_config
-- # # # OUT: y_is_valid_signal, pad_[3], big_buffer_delay_counter_signal, small_buffer_delay_counter_signal, interleave_counter_signal, buffer_enable_signal

    sliding_window_ctrl : entity work.conv1_SlidingWindowController
        port map
        (
            clk,
            reset,

            x_is_valid,

            buffer_enable_signal(0),
            y_is_valid_signal(0),
            pad_1(0), pad_2(0), pad_3(0),
            big_buffer_delay_counter_signal(0),
            small_buffer_delay_counter_signal(0),
            interleave_counter_signal(0)
        );

-- # # # Stage 2: Produce all coefficients # # #
-- # # # IN:  layer_xi[3] y_is_valid_signal, pad_[3], big_buffer_delay_counter_signal(0), small_buffer_delay_counter_signal(0), interleave_counter_signal(0)
-- # # # OUT: signal_core_[]_yo_3

-- We have to delay everything except the rmcm_select_config_signal_pl. This is because the weights are loaded from BRAM, and it will take one clock cycle to do so.
-- TODO hey, maybe we can do better? Maybe we can preload the next weights before or something... Ikd...


 -- This is always needed. The sliding window controller forces this.
 -- This is always needed. The sliding window controller forces this.

-- Add a pipeline step
    PL_STEP_0_for_layer_xi_1_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_1_signal(0), layer_xi_1_signal(1));
    PL_STEP_0_for_layer_xi_2_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_2_signal(0), layer_xi_2_signal(1));
    PL_STEP_0_for_layer_xi_3_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_3_signal(0), layer_xi_3_signal(1)); -- This is always needed. The sliding window controller forces this.
-- Add a pipeline step
    PL_STEP_1_for_layer_xi_1_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_1_signal(1), layer_xi_1_signal(2));
    PL_STEP_1_for_layer_xi_2_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_2_signal(1), layer_xi_2_signal(2));
    PL_STEP_1_for_layer_xi_3_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_3_signal(1), layer_xi_3_signal(2));
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








    conv_core1 : entity work.conv1_core1
        generic map
        (
            PIPELINE_STEPS => RMCM_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,

            layer_xi_1_signal(2),
            pad_1(2), pad_2(2), pad_3(2), 

    
            core_1_kpu_1_input_1(0) , 
            core_1_kpu_1_input_2(0) , 
            core_1_kpu_1_input_3(0) , 
            core_1_kpu_1_input_4(0) , 
            core_1_kpu_1_input_5(0) , 
            core_1_kpu_1_input_6(0) , 
            core_1_kpu_1_input_7(0) , 
            core_1_kpu_1_input_8(0) , 
            core_1_kpu_1_input_9(0) , 
            core_1_kpu_2_input_1(0) , 
            core_1_kpu_2_input_2(0) , 
            core_1_kpu_2_input_3(0) , 
            core_1_kpu_2_input_4(0) , 
            core_1_kpu_2_input_5(0) , 
            core_1_kpu_2_input_6(0) , 
            core_1_kpu_2_input_7(0) , 
            core_1_kpu_2_input_8(0) , 
            core_1_kpu_2_input_9(0) , 
            core_1_kpu_3_input_1(0) , 
            core_1_kpu_3_input_2(0) , 
            core_1_kpu_3_input_3(0) , 
            core_1_kpu_3_input_4(0) , 
            core_1_kpu_3_input_5(0) , 
            core_1_kpu_3_input_6(0) , 
            core_1_kpu_3_input_7(0) , 
            core_1_kpu_3_input_8(0) , 
            core_1_kpu_3_input_9(0) , 
            core_1_kpu_4_input_1(0) , 
            core_1_kpu_4_input_2(0) , 
            core_1_kpu_4_input_3(0) , 
            core_1_kpu_4_input_4(0) , 
            core_1_kpu_4_input_5(0) , 
            core_1_kpu_4_input_6(0) , 
            core_1_kpu_4_input_7(0) , 
            core_1_kpu_4_input_8(0) , 
            core_1_kpu_4_input_9(0) , 
            core_1_kpu_5_input_1(0) , 
            core_1_kpu_5_input_2(0) , 
            core_1_kpu_5_input_3(0) , 
            core_1_kpu_5_input_4(0) , 
            core_1_kpu_5_input_5(0) , 
            core_1_kpu_5_input_6(0) , 
            core_1_kpu_5_input_7(0) , 
            core_1_kpu_5_input_8(0) , 
            core_1_kpu_5_input_9(0) , 
            core_1_kpu_6_input_1(0) , 
            core_1_kpu_6_input_2(0) , 
            core_1_kpu_6_input_3(0) , 
            core_1_kpu_6_input_4(0) , 
            core_1_kpu_6_input_5(0) , 
            core_1_kpu_6_input_6(0) , 
            core_1_kpu_6_input_7(0) , 
            core_1_kpu_6_input_8(0) , 
            core_1_kpu_6_input_9(0) , 
            core_1_kpu_7_input_1(0) , 
            core_1_kpu_7_input_2(0) , 
            core_1_kpu_7_input_3(0) , 
            core_1_kpu_7_input_4(0) , 
            core_1_kpu_7_input_5(0) , 
            core_1_kpu_7_input_6(0) , 
            core_1_kpu_7_input_7(0) , 
            core_1_kpu_7_input_8(0) , 
            core_1_kpu_7_input_9(0) , 
            core_1_kpu_8_input_1(0) , 
            core_1_kpu_8_input_2(0) , 
            core_1_kpu_8_input_3(0) , 
            core_1_kpu_8_input_4(0) , 
            core_1_kpu_8_input_5(0) , 
            core_1_kpu_8_input_6(0) , 
            core_1_kpu_8_input_7(0) , 
            core_1_kpu_8_input_8(0) , 
            core_1_kpu_8_input_9(0) , 
            core_1_kpu_9_input_1(0) , 
            core_1_kpu_9_input_2(0) , 
            core_1_kpu_9_input_3(0) , 
            core_1_kpu_9_input_4(0) , 
            core_1_kpu_9_input_5(0) , 
            core_1_kpu_9_input_6(0) , 
            core_1_kpu_9_input_7(0) , 
            core_1_kpu_9_input_8(0) , 
            core_1_kpu_9_input_9(0) , 
            core_1_kpu_10_input_1(0) , 
            core_1_kpu_10_input_2(0) , 
            core_1_kpu_10_input_3(0) , 
            core_1_kpu_10_input_4(0) , 
            core_1_kpu_10_input_5(0) , 
            core_1_kpu_10_input_6(0) , 
            core_1_kpu_10_input_7(0) , 
            core_1_kpu_10_input_8(0) , 
            core_1_kpu_10_input_9(0) , 
            core_1_kpu_11_input_1(0) , 
            core_1_kpu_11_input_2(0) , 
            core_1_kpu_11_input_3(0) , 
            core_1_kpu_11_input_4(0) , 
            core_1_kpu_11_input_5(0) , 
            core_1_kpu_11_input_6(0) , 
            core_1_kpu_11_input_7(0) , 
            core_1_kpu_11_input_8(0) , 
            core_1_kpu_11_input_9(0) , 
            core_1_kpu_12_input_1(0) , 
            core_1_kpu_12_input_2(0) , 
            core_1_kpu_12_input_3(0) , 
            core_1_kpu_12_input_4(0) , 
            core_1_kpu_12_input_5(0) , 
            core_1_kpu_12_input_6(0) , 
            core_1_kpu_12_input_7(0) , 
            core_1_kpu_12_input_8(0) , 
            core_1_kpu_12_input_9(0) , 
            core_1_kpu_13_input_1(0) , 
            core_1_kpu_13_input_2(0) , 
            core_1_kpu_13_input_3(0) , 
            core_1_kpu_13_input_4(0) , 
            core_1_kpu_13_input_5(0) , 
            core_1_kpu_13_input_6(0) , 
            core_1_kpu_13_input_7(0) , 
            core_1_kpu_13_input_8(0) , 
            core_1_kpu_13_input_9(0) , 
            core_1_kpu_14_input_1(0) , 
            core_1_kpu_14_input_2(0) , 
            core_1_kpu_14_input_3(0) , 
            core_1_kpu_14_input_4(0) , 
            core_1_kpu_14_input_5(0) , 
            core_1_kpu_14_input_6(0) , 
            core_1_kpu_14_input_7(0) , 
            core_1_kpu_14_input_8(0) , 
            core_1_kpu_14_input_9(0) , 
            core_1_kpu_15_input_1(0) , 
            core_1_kpu_15_input_2(0) , 
            core_1_kpu_15_input_3(0) , 
            core_1_kpu_15_input_4(0) , 
            core_1_kpu_15_input_5(0) , 
            core_1_kpu_15_input_6(0) , 
            core_1_kpu_15_input_7(0) , 
            core_1_kpu_15_input_8(0) , 
            core_1_kpu_15_input_9(0) , 
            core_1_kpu_16_input_1(0) , 
            core_1_kpu_16_input_2(0) , 
            core_1_kpu_16_input_3(0) , 
            core_1_kpu_16_input_4(0) , 
            core_1_kpu_16_input_5(0) , 
            core_1_kpu_16_input_6(0) , 
            core_1_kpu_16_input_7(0) , 
            core_1_kpu_16_input_8(0) , 
            core_1_kpu_16_input_9(0) , 
            core_1_kpu_17_input_1(0) , 
            core_1_kpu_17_input_2(0) , 
            core_1_kpu_17_input_3(0) , 
            core_1_kpu_17_input_4(0) , 
            core_1_kpu_17_input_5(0) , 
            core_1_kpu_17_input_6(0) , 
            core_1_kpu_17_input_7(0) , 
            core_1_kpu_17_input_8(0) , 
            core_1_kpu_17_input_9(0) , 
            core_1_kpu_18_input_1(0) , 
            core_1_kpu_18_input_2(0) , 
            core_1_kpu_18_input_3(0) , 
            core_1_kpu_18_input_4(0) , 
            core_1_kpu_18_input_5(0) , 
            core_1_kpu_18_input_6(0) , 
            core_1_kpu_18_input_7(0) , 
            core_1_kpu_18_input_8(0) , 
            core_1_kpu_18_input_9(0) , 
            core_1_kpu_19_input_1(0) , 
            core_1_kpu_19_input_2(0) , 
            core_1_kpu_19_input_3(0) , 
            core_1_kpu_19_input_4(0) , 
            core_1_kpu_19_input_5(0) , 
            core_1_kpu_19_input_6(0) , 
            core_1_kpu_19_input_7(0) , 
            core_1_kpu_19_input_8(0) , 
            core_1_kpu_19_input_9(0) , 
            core_1_kpu_20_input_1(0) , 
            core_1_kpu_20_input_2(0) , 
            core_1_kpu_20_input_3(0) , 
            core_1_kpu_20_input_4(0) , 
            core_1_kpu_20_input_5(0) , 
            core_1_kpu_20_input_6(0) , 
            core_1_kpu_20_input_7(0) , 
            core_1_kpu_20_input_8(0) , 
            core_1_kpu_20_input_9(0) , 
            core_1_kpu_21_input_1(0) , 
            core_1_kpu_21_input_2(0) , 
            core_1_kpu_21_input_3(0) , 
            core_1_kpu_21_input_4(0) , 
            core_1_kpu_21_input_5(0) , 
            core_1_kpu_21_input_6(0) , 
            core_1_kpu_21_input_7(0) , 
            core_1_kpu_21_input_8(0) , 
            core_1_kpu_21_input_9(0) , 
            core_1_kpu_22_input_1(0) , 
            core_1_kpu_22_input_2(0) , 
            core_1_kpu_22_input_3(0) , 
            core_1_kpu_22_input_4(0) , 
            core_1_kpu_22_input_5(0) , 
            core_1_kpu_22_input_6(0) , 
            core_1_kpu_22_input_7(0) , 
            core_1_kpu_22_input_8(0) , 
            core_1_kpu_22_input_9(0) , 
            core_1_kpu_23_input_1(0) , 
            core_1_kpu_23_input_2(0) , 
            core_1_kpu_23_input_3(0) , 
            core_1_kpu_23_input_4(0) , 
            core_1_kpu_23_input_5(0) , 
            core_1_kpu_23_input_6(0) , 
            core_1_kpu_23_input_7(0) , 
            core_1_kpu_23_input_8(0) , 
            core_1_kpu_23_input_9(0) , 
            core_1_kpu_24_input_1(0) , 
            core_1_kpu_24_input_2(0) , 
            core_1_kpu_24_input_3(0) , 
            core_1_kpu_24_input_4(0) , 
            core_1_kpu_24_input_5(0) , 
            core_1_kpu_24_input_6(0) , 
            core_1_kpu_24_input_7(0) , 
            core_1_kpu_24_input_8(0) , 
            core_1_kpu_24_input_9(0) , 
            core_1_kpu_25_input_1(0) , 
            core_1_kpu_25_input_2(0) , 
            core_1_kpu_25_input_3(0) , 
            core_1_kpu_25_input_4(0) , 
            core_1_kpu_25_input_5(0) , 
            core_1_kpu_25_input_6(0) , 
            core_1_kpu_25_input_7(0) , 
            core_1_kpu_25_input_8(0) , 
            core_1_kpu_25_input_9(0) , 
            core_1_kpu_26_input_1(0) , 
            core_1_kpu_26_input_2(0) , 
            core_1_kpu_26_input_3(0) , 
            core_1_kpu_26_input_4(0) , 
            core_1_kpu_26_input_5(0) , 
            core_1_kpu_26_input_6(0) , 
            core_1_kpu_26_input_7(0) , 
            core_1_kpu_26_input_8(0) , 
            core_1_kpu_26_input_9(0) , 
            core_1_kpu_27_input_1(0) , 
            core_1_kpu_27_input_2(0) , 
            core_1_kpu_27_input_3(0) , 
            core_1_kpu_27_input_4(0) , 
            core_1_kpu_27_input_5(0) , 
            core_1_kpu_27_input_6(0) , 
            core_1_kpu_27_input_7(0) , 
            core_1_kpu_27_input_8(0) , 
            core_1_kpu_27_input_9(0) , 
            core_1_kpu_28_input_1(0) , 
            core_1_kpu_28_input_2(0) , 
            core_1_kpu_28_input_3(0) , 
            core_1_kpu_28_input_4(0) , 
            core_1_kpu_28_input_5(0) , 
            core_1_kpu_28_input_6(0) , 
            core_1_kpu_28_input_7(0) , 
            core_1_kpu_28_input_8(0) , 
            core_1_kpu_28_input_9(0) , 
            core_1_kpu_29_input_1(0) , 
            core_1_kpu_29_input_2(0) , 
            core_1_kpu_29_input_3(0) , 
            core_1_kpu_29_input_4(0) , 
            core_1_kpu_29_input_5(0) , 
            core_1_kpu_29_input_6(0) , 
            core_1_kpu_29_input_7(0) , 
            core_1_kpu_29_input_8(0) , 
            core_1_kpu_29_input_9(0) , 
            core_1_kpu_30_input_1(0) , 
            core_1_kpu_30_input_2(0) , 
            core_1_kpu_30_input_3(0) , 
            core_1_kpu_30_input_4(0) , 
            core_1_kpu_30_input_5(0) , 
            core_1_kpu_30_input_6(0) , 
            core_1_kpu_30_input_7(0) , 
            core_1_kpu_30_input_8(0) , 
            core_1_kpu_30_input_9(0) , 
            core_1_kpu_31_input_1(0) , 
            core_1_kpu_31_input_2(0) , 
            core_1_kpu_31_input_3(0) , 
            core_1_kpu_31_input_4(0) , 
            core_1_kpu_31_input_5(0) , 
            core_1_kpu_31_input_6(0) , 
            core_1_kpu_31_input_7(0) , 
            core_1_kpu_31_input_8(0) , 
            core_1_kpu_31_input_9(0) , 
            core_1_kpu_32_input_1(0) , 
            core_1_kpu_32_input_2(0) , 
            core_1_kpu_32_input_3(0) , 
            core_1_kpu_32_input_4(0) , 
            core_1_kpu_32_input_5(0) , 
            core_1_kpu_32_input_6(0) , 
            core_1_kpu_32_input_7(0) , 
            core_1_kpu_32_input_8(0) , 
            core_1_kpu_32_input_9(0) 
        );

    conv_core2 : entity work.conv1_core2
        generic map
        (
            PIPELINE_STEPS => RMCM_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,

            layer_xi_2_signal(2),
            pad_1(2), pad_2(2), pad_3(2), 

    
            core_2_kpu_1_input_1(0) , 
            core_2_kpu_1_input_2(0) , 
            core_2_kpu_1_input_3(0) , 
            core_2_kpu_1_input_4(0) , 
            core_2_kpu_1_input_5(0) , 
            core_2_kpu_1_input_6(0) , 
            core_2_kpu_1_input_7(0) , 
            core_2_kpu_1_input_8(0) , 
            core_2_kpu_1_input_9(0) , 
            core_2_kpu_2_input_1(0) , 
            core_2_kpu_2_input_2(0) , 
            core_2_kpu_2_input_3(0) , 
            core_2_kpu_2_input_4(0) , 
            core_2_kpu_2_input_5(0) , 
            core_2_kpu_2_input_6(0) , 
            core_2_kpu_2_input_7(0) , 
            core_2_kpu_2_input_8(0) , 
            core_2_kpu_2_input_9(0) , 
            core_2_kpu_3_input_1(0) , 
            core_2_kpu_3_input_2(0) , 
            core_2_kpu_3_input_3(0) , 
            core_2_kpu_3_input_4(0) , 
            core_2_kpu_3_input_5(0) , 
            core_2_kpu_3_input_6(0) , 
            core_2_kpu_3_input_7(0) , 
            core_2_kpu_3_input_8(0) , 
            core_2_kpu_3_input_9(0) , 
            core_2_kpu_4_input_1(0) , 
            core_2_kpu_4_input_2(0) , 
            core_2_kpu_4_input_3(0) , 
            core_2_kpu_4_input_4(0) , 
            core_2_kpu_4_input_5(0) , 
            core_2_kpu_4_input_6(0) , 
            core_2_kpu_4_input_7(0) , 
            core_2_kpu_4_input_8(0) , 
            core_2_kpu_4_input_9(0) , 
            core_2_kpu_5_input_1(0) , 
            core_2_kpu_5_input_2(0) , 
            core_2_kpu_5_input_3(0) , 
            core_2_kpu_5_input_4(0) , 
            core_2_kpu_5_input_5(0) , 
            core_2_kpu_5_input_6(0) , 
            core_2_kpu_5_input_7(0) , 
            core_2_kpu_5_input_8(0) , 
            core_2_kpu_5_input_9(0) , 
            core_2_kpu_6_input_1(0) , 
            core_2_kpu_6_input_2(0) , 
            core_2_kpu_6_input_3(0) , 
            core_2_kpu_6_input_4(0) , 
            core_2_kpu_6_input_5(0) , 
            core_2_kpu_6_input_6(0) , 
            core_2_kpu_6_input_7(0) , 
            core_2_kpu_6_input_8(0) , 
            core_2_kpu_6_input_9(0) , 
            core_2_kpu_7_input_1(0) , 
            core_2_kpu_7_input_2(0) , 
            core_2_kpu_7_input_3(0) , 
            core_2_kpu_7_input_4(0) , 
            core_2_kpu_7_input_5(0) , 
            core_2_kpu_7_input_6(0) , 
            core_2_kpu_7_input_7(0) , 
            core_2_kpu_7_input_8(0) , 
            core_2_kpu_7_input_9(0) , 
            core_2_kpu_8_input_1(0) , 
            core_2_kpu_8_input_2(0) , 
            core_2_kpu_8_input_3(0) , 
            core_2_kpu_8_input_4(0) , 
            core_2_kpu_8_input_5(0) , 
            core_2_kpu_8_input_6(0) , 
            core_2_kpu_8_input_7(0) , 
            core_2_kpu_8_input_8(0) , 
            core_2_kpu_8_input_9(0) , 
            core_2_kpu_9_input_1(0) , 
            core_2_kpu_9_input_2(0) , 
            core_2_kpu_9_input_3(0) , 
            core_2_kpu_9_input_4(0) , 
            core_2_kpu_9_input_5(0) , 
            core_2_kpu_9_input_6(0) , 
            core_2_kpu_9_input_7(0) , 
            core_2_kpu_9_input_8(0) , 
            core_2_kpu_9_input_9(0) , 
            core_2_kpu_10_input_1(0) , 
            core_2_kpu_10_input_2(0) , 
            core_2_kpu_10_input_3(0) , 
            core_2_kpu_10_input_4(0) , 
            core_2_kpu_10_input_5(0) , 
            core_2_kpu_10_input_6(0) , 
            core_2_kpu_10_input_7(0) , 
            core_2_kpu_10_input_8(0) , 
            core_2_kpu_10_input_9(0) , 
            core_2_kpu_11_input_1(0) , 
            core_2_kpu_11_input_2(0) , 
            core_2_kpu_11_input_3(0) , 
            core_2_kpu_11_input_4(0) , 
            core_2_kpu_11_input_5(0) , 
            core_2_kpu_11_input_6(0) , 
            core_2_kpu_11_input_7(0) , 
            core_2_kpu_11_input_8(0) , 
            core_2_kpu_11_input_9(0) , 
            core_2_kpu_12_input_1(0) , 
            core_2_kpu_12_input_2(0) , 
            core_2_kpu_12_input_3(0) , 
            core_2_kpu_12_input_4(0) , 
            core_2_kpu_12_input_5(0) , 
            core_2_kpu_12_input_6(0) , 
            core_2_kpu_12_input_7(0) , 
            core_2_kpu_12_input_8(0) , 
            core_2_kpu_12_input_9(0) , 
            core_2_kpu_13_input_1(0) , 
            core_2_kpu_13_input_2(0) , 
            core_2_kpu_13_input_3(0) , 
            core_2_kpu_13_input_4(0) , 
            core_2_kpu_13_input_5(0) , 
            core_2_kpu_13_input_6(0) , 
            core_2_kpu_13_input_7(0) , 
            core_2_kpu_13_input_8(0) , 
            core_2_kpu_13_input_9(0) , 
            core_2_kpu_14_input_1(0) , 
            core_2_kpu_14_input_2(0) , 
            core_2_kpu_14_input_3(0) , 
            core_2_kpu_14_input_4(0) , 
            core_2_kpu_14_input_5(0) , 
            core_2_kpu_14_input_6(0) , 
            core_2_kpu_14_input_7(0) , 
            core_2_kpu_14_input_8(0) , 
            core_2_kpu_14_input_9(0) , 
            core_2_kpu_15_input_1(0) , 
            core_2_kpu_15_input_2(0) , 
            core_2_kpu_15_input_3(0) , 
            core_2_kpu_15_input_4(0) , 
            core_2_kpu_15_input_5(0) , 
            core_2_kpu_15_input_6(0) , 
            core_2_kpu_15_input_7(0) , 
            core_2_kpu_15_input_8(0) , 
            core_2_kpu_15_input_9(0) , 
            core_2_kpu_16_input_1(0) , 
            core_2_kpu_16_input_2(0) , 
            core_2_kpu_16_input_3(0) , 
            core_2_kpu_16_input_4(0) , 
            core_2_kpu_16_input_5(0) , 
            core_2_kpu_16_input_6(0) , 
            core_2_kpu_16_input_7(0) , 
            core_2_kpu_16_input_8(0) , 
            core_2_kpu_16_input_9(0) , 
            core_2_kpu_17_input_1(0) , 
            core_2_kpu_17_input_2(0) , 
            core_2_kpu_17_input_3(0) , 
            core_2_kpu_17_input_4(0) , 
            core_2_kpu_17_input_5(0) , 
            core_2_kpu_17_input_6(0) , 
            core_2_kpu_17_input_7(0) , 
            core_2_kpu_17_input_8(0) , 
            core_2_kpu_17_input_9(0) , 
            core_2_kpu_18_input_1(0) , 
            core_2_kpu_18_input_2(0) , 
            core_2_kpu_18_input_3(0) , 
            core_2_kpu_18_input_4(0) , 
            core_2_kpu_18_input_5(0) , 
            core_2_kpu_18_input_6(0) , 
            core_2_kpu_18_input_7(0) , 
            core_2_kpu_18_input_8(0) , 
            core_2_kpu_18_input_9(0) , 
            core_2_kpu_19_input_1(0) , 
            core_2_kpu_19_input_2(0) , 
            core_2_kpu_19_input_3(0) , 
            core_2_kpu_19_input_4(0) , 
            core_2_kpu_19_input_5(0) , 
            core_2_kpu_19_input_6(0) , 
            core_2_kpu_19_input_7(0) , 
            core_2_kpu_19_input_8(0) , 
            core_2_kpu_19_input_9(0) , 
            core_2_kpu_20_input_1(0) , 
            core_2_kpu_20_input_2(0) , 
            core_2_kpu_20_input_3(0) , 
            core_2_kpu_20_input_4(0) , 
            core_2_kpu_20_input_5(0) , 
            core_2_kpu_20_input_6(0) , 
            core_2_kpu_20_input_7(0) , 
            core_2_kpu_20_input_8(0) , 
            core_2_kpu_20_input_9(0) , 
            core_2_kpu_21_input_1(0) , 
            core_2_kpu_21_input_2(0) , 
            core_2_kpu_21_input_3(0) , 
            core_2_kpu_21_input_4(0) , 
            core_2_kpu_21_input_5(0) , 
            core_2_kpu_21_input_6(0) , 
            core_2_kpu_21_input_7(0) , 
            core_2_kpu_21_input_8(0) , 
            core_2_kpu_21_input_9(0) , 
            core_2_kpu_22_input_1(0) , 
            core_2_kpu_22_input_2(0) , 
            core_2_kpu_22_input_3(0) , 
            core_2_kpu_22_input_4(0) , 
            core_2_kpu_22_input_5(0) , 
            core_2_kpu_22_input_6(0) , 
            core_2_kpu_22_input_7(0) , 
            core_2_kpu_22_input_8(0) , 
            core_2_kpu_22_input_9(0) , 
            core_2_kpu_23_input_1(0) , 
            core_2_kpu_23_input_2(0) , 
            core_2_kpu_23_input_3(0) , 
            core_2_kpu_23_input_4(0) , 
            core_2_kpu_23_input_5(0) , 
            core_2_kpu_23_input_6(0) , 
            core_2_kpu_23_input_7(0) , 
            core_2_kpu_23_input_8(0) , 
            core_2_kpu_23_input_9(0) , 
            core_2_kpu_24_input_1(0) , 
            core_2_kpu_24_input_2(0) , 
            core_2_kpu_24_input_3(0) , 
            core_2_kpu_24_input_4(0) , 
            core_2_kpu_24_input_5(0) , 
            core_2_kpu_24_input_6(0) , 
            core_2_kpu_24_input_7(0) , 
            core_2_kpu_24_input_8(0) , 
            core_2_kpu_24_input_9(0) , 
            core_2_kpu_25_input_1(0) , 
            core_2_kpu_25_input_2(0) , 
            core_2_kpu_25_input_3(0) , 
            core_2_kpu_25_input_4(0) , 
            core_2_kpu_25_input_5(0) , 
            core_2_kpu_25_input_6(0) , 
            core_2_kpu_25_input_7(0) , 
            core_2_kpu_25_input_8(0) , 
            core_2_kpu_25_input_9(0) , 
            core_2_kpu_26_input_1(0) , 
            core_2_kpu_26_input_2(0) , 
            core_2_kpu_26_input_3(0) , 
            core_2_kpu_26_input_4(0) , 
            core_2_kpu_26_input_5(0) , 
            core_2_kpu_26_input_6(0) , 
            core_2_kpu_26_input_7(0) , 
            core_2_kpu_26_input_8(0) , 
            core_2_kpu_26_input_9(0) , 
            core_2_kpu_27_input_1(0) , 
            core_2_kpu_27_input_2(0) , 
            core_2_kpu_27_input_3(0) , 
            core_2_kpu_27_input_4(0) , 
            core_2_kpu_27_input_5(0) , 
            core_2_kpu_27_input_6(0) , 
            core_2_kpu_27_input_7(0) , 
            core_2_kpu_27_input_8(0) , 
            core_2_kpu_27_input_9(0) , 
            core_2_kpu_28_input_1(0) , 
            core_2_kpu_28_input_2(0) , 
            core_2_kpu_28_input_3(0) , 
            core_2_kpu_28_input_4(0) , 
            core_2_kpu_28_input_5(0) , 
            core_2_kpu_28_input_6(0) , 
            core_2_kpu_28_input_7(0) , 
            core_2_kpu_28_input_8(0) , 
            core_2_kpu_28_input_9(0) , 
            core_2_kpu_29_input_1(0) , 
            core_2_kpu_29_input_2(0) , 
            core_2_kpu_29_input_3(0) , 
            core_2_kpu_29_input_4(0) , 
            core_2_kpu_29_input_5(0) , 
            core_2_kpu_29_input_6(0) , 
            core_2_kpu_29_input_7(0) , 
            core_2_kpu_29_input_8(0) , 
            core_2_kpu_29_input_9(0) , 
            core_2_kpu_30_input_1(0) , 
            core_2_kpu_30_input_2(0) , 
            core_2_kpu_30_input_3(0) , 
            core_2_kpu_30_input_4(0) , 
            core_2_kpu_30_input_5(0) , 
            core_2_kpu_30_input_6(0) , 
            core_2_kpu_30_input_7(0) , 
            core_2_kpu_30_input_8(0) , 
            core_2_kpu_30_input_9(0) , 
            core_2_kpu_31_input_1(0) , 
            core_2_kpu_31_input_2(0) , 
            core_2_kpu_31_input_3(0) , 
            core_2_kpu_31_input_4(0) , 
            core_2_kpu_31_input_5(0) , 
            core_2_kpu_31_input_6(0) , 
            core_2_kpu_31_input_7(0) , 
            core_2_kpu_31_input_8(0) , 
            core_2_kpu_31_input_9(0) , 
            core_2_kpu_32_input_1(0) , 
            core_2_kpu_32_input_2(0) , 
            core_2_kpu_32_input_3(0) , 
            core_2_kpu_32_input_4(0) , 
            core_2_kpu_32_input_5(0) , 
            core_2_kpu_32_input_6(0) , 
            core_2_kpu_32_input_7(0) , 
            core_2_kpu_32_input_8(0) , 
            core_2_kpu_32_input_9(0) 
        );

    conv_core3 : entity work.conv1_core3
        generic map
        (
            PIPELINE_STEPS => RMCM_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,

            layer_xi_3_signal(2),
            pad_1(2), pad_2(2), pad_3(2), 

    
            core_3_kpu_1_input_1(0) , 
            core_3_kpu_1_input_2(0) , 
            core_3_kpu_1_input_3(0) , 
            core_3_kpu_1_input_4(0) , 
            core_3_kpu_1_input_5(0) , 
            core_3_kpu_1_input_6(0) , 
            core_3_kpu_1_input_7(0) , 
            core_3_kpu_1_input_8(0) , 
            core_3_kpu_1_input_9(0) , 
            core_3_kpu_2_input_1(0) , 
            core_3_kpu_2_input_2(0) , 
            core_3_kpu_2_input_3(0) , 
            core_3_kpu_2_input_4(0) , 
            core_3_kpu_2_input_5(0) , 
            core_3_kpu_2_input_6(0) , 
            core_3_kpu_2_input_7(0) , 
            core_3_kpu_2_input_8(0) , 
            core_3_kpu_2_input_9(0) , 
            core_3_kpu_3_input_1(0) , 
            core_3_kpu_3_input_2(0) , 
            core_3_kpu_3_input_3(0) , 
            core_3_kpu_3_input_4(0) , 
            core_3_kpu_3_input_5(0) , 
            core_3_kpu_3_input_6(0) , 
            core_3_kpu_3_input_7(0) , 
            core_3_kpu_3_input_8(0) , 
            core_3_kpu_3_input_9(0) , 
            core_3_kpu_4_input_1(0) , 
            core_3_kpu_4_input_2(0) , 
            core_3_kpu_4_input_3(0) , 
            core_3_kpu_4_input_4(0) , 
            core_3_kpu_4_input_5(0) , 
            core_3_kpu_4_input_6(0) , 
            core_3_kpu_4_input_7(0) , 
            core_3_kpu_4_input_8(0) , 
            core_3_kpu_4_input_9(0) , 
            core_3_kpu_5_input_1(0) , 
            core_3_kpu_5_input_2(0) , 
            core_3_kpu_5_input_3(0) , 
            core_3_kpu_5_input_4(0) , 
            core_3_kpu_5_input_5(0) , 
            core_3_kpu_5_input_6(0) , 
            core_3_kpu_5_input_7(0) , 
            core_3_kpu_5_input_8(0) , 
            core_3_kpu_5_input_9(0) , 
            core_3_kpu_6_input_1(0) , 
            core_3_kpu_6_input_2(0) , 
            core_3_kpu_6_input_3(0) , 
            core_3_kpu_6_input_4(0) , 
            core_3_kpu_6_input_5(0) , 
            core_3_kpu_6_input_6(0) , 
            core_3_kpu_6_input_7(0) , 
            core_3_kpu_6_input_8(0) , 
            core_3_kpu_6_input_9(0) , 
            core_3_kpu_7_input_1(0) , 
            core_3_kpu_7_input_2(0) , 
            core_3_kpu_7_input_3(0) , 
            core_3_kpu_7_input_4(0) , 
            core_3_kpu_7_input_5(0) , 
            core_3_kpu_7_input_6(0) , 
            core_3_kpu_7_input_7(0) , 
            core_3_kpu_7_input_8(0) , 
            core_3_kpu_7_input_9(0) , 
            core_3_kpu_8_input_1(0) , 
            core_3_kpu_8_input_2(0) , 
            core_3_kpu_8_input_3(0) , 
            core_3_kpu_8_input_4(0) , 
            core_3_kpu_8_input_5(0) , 
            core_3_kpu_8_input_6(0) , 
            core_3_kpu_8_input_7(0) , 
            core_3_kpu_8_input_8(0) , 
            core_3_kpu_8_input_9(0) , 
            core_3_kpu_9_input_1(0) , 
            core_3_kpu_9_input_2(0) , 
            core_3_kpu_9_input_3(0) , 
            core_3_kpu_9_input_4(0) , 
            core_3_kpu_9_input_5(0) , 
            core_3_kpu_9_input_6(0) , 
            core_3_kpu_9_input_7(0) , 
            core_3_kpu_9_input_8(0) , 
            core_3_kpu_9_input_9(0) , 
            core_3_kpu_10_input_1(0) , 
            core_3_kpu_10_input_2(0) , 
            core_3_kpu_10_input_3(0) , 
            core_3_kpu_10_input_4(0) , 
            core_3_kpu_10_input_5(0) , 
            core_3_kpu_10_input_6(0) , 
            core_3_kpu_10_input_7(0) , 
            core_3_kpu_10_input_8(0) , 
            core_3_kpu_10_input_9(0) , 
            core_3_kpu_11_input_1(0) , 
            core_3_kpu_11_input_2(0) , 
            core_3_kpu_11_input_3(0) , 
            core_3_kpu_11_input_4(0) , 
            core_3_kpu_11_input_5(0) , 
            core_3_kpu_11_input_6(0) , 
            core_3_kpu_11_input_7(0) , 
            core_3_kpu_11_input_8(0) , 
            core_3_kpu_11_input_9(0) , 
            core_3_kpu_12_input_1(0) , 
            core_3_kpu_12_input_2(0) , 
            core_3_kpu_12_input_3(0) , 
            core_3_kpu_12_input_4(0) , 
            core_3_kpu_12_input_5(0) , 
            core_3_kpu_12_input_6(0) , 
            core_3_kpu_12_input_7(0) , 
            core_3_kpu_12_input_8(0) , 
            core_3_kpu_12_input_9(0) , 
            core_3_kpu_13_input_1(0) , 
            core_3_kpu_13_input_2(0) , 
            core_3_kpu_13_input_3(0) , 
            core_3_kpu_13_input_4(0) , 
            core_3_kpu_13_input_5(0) , 
            core_3_kpu_13_input_6(0) , 
            core_3_kpu_13_input_7(0) , 
            core_3_kpu_13_input_8(0) , 
            core_3_kpu_13_input_9(0) , 
            core_3_kpu_14_input_1(0) , 
            core_3_kpu_14_input_2(0) , 
            core_3_kpu_14_input_3(0) , 
            core_3_kpu_14_input_4(0) , 
            core_3_kpu_14_input_5(0) , 
            core_3_kpu_14_input_6(0) , 
            core_3_kpu_14_input_7(0) , 
            core_3_kpu_14_input_8(0) , 
            core_3_kpu_14_input_9(0) , 
            core_3_kpu_15_input_1(0) , 
            core_3_kpu_15_input_2(0) , 
            core_3_kpu_15_input_3(0) , 
            core_3_kpu_15_input_4(0) , 
            core_3_kpu_15_input_5(0) , 
            core_3_kpu_15_input_6(0) , 
            core_3_kpu_15_input_7(0) , 
            core_3_kpu_15_input_8(0) , 
            core_3_kpu_15_input_9(0) , 
            core_3_kpu_16_input_1(0) , 
            core_3_kpu_16_input_2(0) , 
            core_3_kpu_16_input_3(0) , 
            core_3_kpu_16_input_4(0) , 
            core_3_kpu_16_input_5(0) , 
            core_3_kpu_16_input_6(0) , 
            core_3_kpu_16_input_7(0) , 
            core_3_kpu_16_input_8(0) , 
            core_3_kpu_16_input_9(0) , 
            core_3_kpu_17_input_1(0) , 
            core_3_kpu_17_input_2(0) , 
            core_3_kpu_17_input_3(0) , 
            core_3_kpu_17_input_4(0) , 
            core_3_kpu_17_input_5(0) , 
            core_3_kpu_17_input_6(0) , 
            core_3_kpu_17_input_7(0) , 
            core_3_kpu_17_input_8(0) , 
            core_3_kpu_17_input_9(0) , 
            core_3_kpu_18_input_1(0) , 
            core_3_kpu_18_input_2(0) , 
            core_3_kpu_18_input_3(0) , 
            core_3_kpu_18_input_4(0) , 
            core_3_kpu_18_input_5(0) , 
            core_3_kpu_18_input_6(0) , 
            core_3_kpu_18_input_7(0) , 
            core_3_kpu_18_input_8(0) , 
            core_3_kpu_18_input_9(0) , 
            core_3_kpu_19_input_1(0) , 
            core_3_kpu_19_input_2(0) , 
            core_3_kpu_19_input_3(0) , 
            core_3_kpu_19_input_4(0) , 
            core_3_kpu_19_input_5(0) , 
            core_3_kpu_19_input_6(0) , 
            core_3_kpu_19_input_7(0) , 
            core_3_kpu_19_input_8(0) , 
            core_3_kpu_19_input_9(0) , 
            core_3_kpu_20_input_1(0) , 
            core_3_kpu_20_input_2(0) , 
            core_3_kpu_20_input_3(0) , 
            core_3_kpu_20_input_4(0) , 
            core_3_kpu_20_input_5(0) , 
            core_3_kpu_20_input_6(0) , 
            core_3_kpu_20_input_7(0) , 
            core_3_kpu_20_input_8(0) , 
            core_3_kpu_20_input_9(0) , 
            core_3_kpu_21_input_1(0) , 
            core_3_kpu_21_input_2(0) , 
            core_3_kpu_21_input_3(0) , 
            core_3_kpu_21_input_4(0) , 
            core_3_kpu_21_input_5(0) , 
            core_3_kpu_21_input_6(0) , 
            core_3_kpu_21_input_7(0) , 
            core_3_kpu_21_input_8(0) , 
            core_3_kpu_21_input_9(0) , 
            core_3_kpu_22_input_1(0) , 
            core_3_kpu_22_input_2(0) , 
            core_3_kpu_22_input_3(0) , 
            core_3_kpu_22_input_4(0) , 
            core_3_kpu_22_input_5(0) , 
            core_3_kpu_22_input_6(0) , 
            core_3_kpu_22_input_7(0) , 
            core_3_kpu_22_input_8(0) , 
            core_3_kpu_22_input_9(0) , 
            core_3_kpu_23_input_1(0) , 
            core_3_kpu_23_input_2(0) , 
            core_3_kpu_23_input_3(0) , 
            core_3_kpu_23_input_4(0) , 
            core_3_kpu_23_input_5(0) , 
            core_3_kpu_23_input_6(0) , 
            core_3_kpu_23_input_7(0) , 
            core_3_kpu_23_input_8(0) , 
            core_3_kpu_23_input_9(0) , 
            core_3_kpu_24_input_1(0) , 
            core_3_kpu_24_input_2(0) , 
            core_3_kpu_24_input_3(0) , 
            core_3_kpu_24_input_4(0) , 
            core_3_kpu_24_input_5(0) , 
            core_3_kpu_24_input_6(0) , 
            core_3_kpu_24_input_7(0) , 
            core_3_kpu_24_input_8(0) , 
            core_3_kpu_24_input_9(0) , 
            core_3_kpu_25_input_1(0) , 
            core_3_kpu_25_input_2(0) , 
            core_3_kpu_25_input_3(0) , 
            core_3_kpu_25_input_4(0) , 
            core_3_kpu_25_input_5(0) , 
            core_3_kpu_25_input_6(0) , 
            core_3_kpu_25_input_7(0) , 
            core_3_kpu_25_input_8(0) , 
            core_3_kpu_25_input_9(0) , 
            core_3_kpu_26_input_1(0) , 
            core_3_kpu_26_input_2(0) , 
            core_3_kpu_26_input_3(0) , 
            core_3_kpu_26_input_4(0) , 
            core_3_kpu_26_input_5(0) , 
            core_3_kpu_26_input_6(0) , 
            core_3_kpu_26_input_7(0) , 
            core_3_kpu_26_input_8(0) , 
            core_3_kpu_26_input_9(0) , 
            core_3_kpu_27_input_1(0) , 
            core_3_kpu_27_input_2(0) , 
            core_3_kpu_27_input_3(0) , 
            core_3_kpu_27_input_4(0) , 
            core_3_kpu_27_input_5(0) , 
            core_3_kpu_27_input_6(0) , 
            core_3_kpu_27_input_7(0) , 
            core_3_kpu_27_input_8(0) , 
            core_3_kpu_27_input_9(0) , 
            core_3_kpu_28_input_1(0) , 
            core_3_kpu_28_input_2(0) , 
            core_3_kpu_28_input_3(0) , 
            core_3_kpu_28_input_4(0) , 
            core_3_kpu_28_input_5(0) , 
            core_3_kpu_28_input_6(0) , 
            core_3_kpu_28_input_7(0) , 
            core_3_kpu_28_input_8(0) , 
            core_3_kpu_28_input_9(0) , 
            core_3_kpu_29_input_1(0) , 
            core_3_kpu_29_input_2(0) , 
            core_3_kpu_29_input_3(0) , 
            core_3_kpu_29_input_4(0) , 
            core_3_kpu_29_input_5(0) , 
            core_3_kpu_29_input_6(0) , 
            core_3_kpu_29_input_7(0) , 
            core_3_kpu_29_input_8(0) , 
            core_3_kpu_29_input_9(0) , 
            core_3_kpu_30_input_1(0) , 
            core_3_kpu_30_input_2(0) , 
            core_3_kpu_30_input_3(0) , 
            core_3_kpu_30_input_4(0) , 
            core_3_kpu_30_input_5(0) , 
            core_3_kpu_30_input_6(0) , 
            core_3_kpu_30_input_7(0) , 
            core_3_kpu_30_input_8(0) , 
            core_3_kpu_30_input_9(0) , 
            core_3_kpu_31_input_1(0) , 
            core_3_kpu_31_input_2(0) , 
            core_3_kpu_31_input_3(0) , 
            core_3_kpu_31_input_4(0) , 
            core_3_kpu_31_input_5(0) , 
            core_3_kpu_31_input_6(0) , 
            core_3_kpu_31_input_7(0) , 
            core_3_kpu_31_input_8(0) , 
            core_3_kpu_31_input_9(0) , 
            core_3_kpu_32_input_1(0) , 
            core_3_kpu_32_input_2(0) , 
            core_3_kpu_32_input_3(0) , 
            core_3_kpu_32_input_4(0) , 
            core_3_kpu_32_input_5(0) , 
            core_3_kpu_32_input_6(0) , 
            core_3_kpu_32_input_7(0) , 
            core_3_kpu_32_input_8(0) , 
            core_3_kpu_32_input_9(0) 
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




-- Add a pipeline step
    PL_STEP_1_for_y_is_valid_signal: entity work.Pipe GENERIC MAP(STEPS => RMCM_PIPELINE_STEPS+1) PORT MAP(clk, '1', y_is_valid_signal(1), y_is_valid_signal(2));
    PL_STEP_1_for_buffer_enable_signal: entity work.Pipe GENERIC MAP(STEPS => RMCM_PIPELINE_STEPS+1) PORT MAP(clk, '1', buffer_enable_signal(1), buffer_enable_signal(2));
    PL_STEP_0_for_big_buffer_delay_counter_signal: entity work.Pipe_Vector GENERIC MAP(STEPS => RMCM_PIPELINE_STEPS+1) PORT MAP(clk, '1', big_buffer_delay_counter_signal(0), big_buffer_delay_counter_signal(1));
    PL_STEP_0_for_small_buffer_delay_counter_signal: entity work.Pipe_Vector GENERIC MAP(STEPS => RMCM_PIPELINE_STEPS+1) PORT MAP(clk, '1', small_buffer_delay_counter_signal(0), small_buffer_delay_counter_signal(1));
    PL_STEP_0_for_interleave_counter_signal: entity work.Pipe_Vector GENERIC MAP(STEPS => RMCM_PIPELINE_STEPS+1) PORT MAP(clk, '1', interleave_counter_signal(0), interleave_counter_signal(1));






  
    -- KPU big buffer delays
    -- Delay the single huge std_logic_vector
    core_1_concat_big_delay: entity work.BufferedDelay GENERIC MAP(WL => core_1_concat_big_undelayed_array'length, BL => BIG_BUFFER_DELAY_COUNTER_MAX )
        PORT MAP(reset, clk, buffer_enable_signal(2), big_buffer_delay_counter_signal(1), core_1_concat_big_undelayed_array, core_1_concat_big_delayed_array);


    -- KPU small buffer delays
    -- Delay the single huge std_logic_vector
    core_1_concat_small_delay: entity work.BufferedDelay GENERIC MAP(WL => core_1_concat_small_undelayed_array'length, BL => SMALL_BUFFER_DELAY_COUNTER_MAX )
        PORT MAP(reset, clk, buffer_enable_signal(2), small_buffer_delay_counter_signal(1), core_1_concat_small_undelayed_array, core_1_concat_small_delayed_array);
  

  
    core_1_KPU_1 : entity work.conv1_core1_KPU1
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_1_kpu_1_input_1(0), --	sfix(1, -12)
            core_1_kpu_1_input_2(0), --	sfix(1, -12)
            core_1_kpu_1_input_3(0), --	sfix(1, -12)
            core_1_kpu_1_input_4(0), --	sfix(1, -12)
            core_1_kpu_1_input_5(0), --	sfix(1, -12)
            core_1_kpu_1_input_6(0), --	sfix(1, -12)
            core_1_kpu_1_input_7(0), --	sfix(1, -12)
            core_1_kpu_1_input_8(0), --	sfix(1, -12)
            core_1_kpu_1_input_9(0), --	sfix(1, -12)

        
            core_1_concat_big_undelayed_array(13-1 downto 0),
            core_1_concat_big_delayed_array(13-1 downto 0),
            core_1_concat_big_undelayed_array(26-1 downto 13),
            core_1_concat_big_delayed_array(26-1 downto 13),

        
            core_1_concat_small_undelayed_array(13-1 downto 0),
            core_1_concat_small_delayed_array(13-1 downto 0),
            core_1_concat_small_undelayed_array(26-1 downto 13),
            core_1_concat_small_delayed_array(26-1 downto 13),
            core_1_concat_small_undelayed_array(39-1 downto 26),
            core_1_concat_small_delayed_array(39-1 downto 26),
            core_1_concat_small_undelayed_array(52-1 downto 39),
            core_1_concat_small_delayed_array(52-1 downto 39),
            core_1_concat_small_undelayed_array(65-1 downto 52),
            core_1_concat_small_delayed_array(65-1 downto 52),
            core_1_concat_small_undelayed_array(78-1 downto 65),
            core_1_concat_small_delayed_array(78-1 downto 65),

            -- like this: yo_1
            signal_core_1_yo_1(0)
        );
    core_1_KPU_2 : entity work.conv1_core1_KPU2
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_1_kpu_2_input_1(0), --	sfix(0, -12)
            core_1_kpu_2_input_2(0), --	sfix(0, -12)
            core_1_kpu_2_input_3(0), --	sfix(0, -12)
            core_1_kpu_2_input_4(0), --	sfix(-3, -12)
            core_1_kpu_2_input_5(0), --	sfix(-1, -12)
            core_1_kpu_2_input_6(0), --	sfix(-3, -12)
            core_1_kpu_2_input_7(0), --	sfix(1, -12)
            core_1_kpu_2_input_8(0), --	sfix(-3, -12)
            core_1_kpu_2_input_9(0), --	sfix(-2, -12)

        
            core_1_concat_big_undelayed_array(41-1 downto 26),
            core_1_concat_big_delayed_array(41-1 downto 26),
            core_1_concat_big_undelayed_array(56-1 downto 41),
            core_1_concat_big_delayed_array(56-1 downto 41),

        
            core_1_concat_small_undelayed_array(90-1 downto 78),
            core_1_concat_small_delayed_array(90-1 downto 78),
            core_1_concat_small_undelayed_array(104-1 downto 90),
            core_1_concat_small_delayed_array(104-1 downto 90),
            core_1_concat_small_undelayed_array(119-1 downto 104),
            core_1_concat_small_delayed_array(119-1 downto 104),
            core_1_concat_small_undelayed_array(134-1 downto 119),
            core_1_concat_small_delayed_array(134-1 downto 119),
            core_1_concat_small_undelayed_array(149-1 downto 134),
            core_1_concat_small_delayed_array(149-1 downto 134),
            core_1_concat_small_undelayed_array(164-1 downto 149),
            core_1_concat_small_delayed_array(164-1 downto 149),

            -- like this: yo_1
            signal_core_1_yo_2(0)
        );
    core_1_KPU_3 : entity work.conv1_core1_KPU3
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_1_kpu_3_input_1(0), --	sfix(1, -12)
            core_1_kpu_3_input_2(0), --	sfix(2, -12)
            core_1_kpu_3_input_3(0), --	sfix(0, -12)
            core_1_kpu_3_input_4(0), --	sfix(2, -12)
            core_1_kpu_3_input_5(0), --	sfix(2, -12)
            core_1_kpu_3_input_6(0), --	sfix(0, -12)
            core_1_kpu_3_input_7(0), --	sfix(1, -12)
            core_1_kpu_3_input_8(0), --	sfix(1, -12)
            core_1_kpu_3_input_9(0), --	sfix(-1, -12)

        
            core_1_concat_big_undelayed_array(72-1 downto 56),
            core_1_concat_big_delayed_array(72-1 downto 56),
            core_1_concat_big_undelayed_array(89-1 downto 72),
            core_1_concat_big_delayed_array(89-1 downto 72),

        
            core_1_concat_small_undelayed_array(177-1 downto 164),
            core_1_concat_small_delayed_array(177-1 downto 164),
            core_1_concat_small_undelayed_array(192-1 downto 177),
            core_1_concat_small_delayed_array(192-1 downto 177),
            core_1_concat_small_undelayed_array(209-1 downto 192),
            core_1_concat_small_delayed_array(209-1 downto 192),
            core_1_concat_small_undelayed_array(226-1 downto 209),
            core_1_concat_small_delayed_array(226-1 downto 209),
            core_1_concat_small_undelayed_array(243-1 downto 226),
            core_1_concat_small_delayed_array(243-1 downto 226),
            core_1_concat_small_undelayed_array(260-1 downto 243),
            core_1_concat_small_delayed_array(260-1 downto 243),

            -- like this: yo_1
            signal_core_1_yo_3(0)
        );
    core_1_KPU_4 : entity work.conv1_core1_KPU4
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_1_kpu_4_input_1(0), --	sfix(1, -12)
            core_1_kpu_4_input_2(0), --	sfix(1, -12)
            core_1_kpu_4_input_3(0), --	sfix(1, -12)
            core_1_kpu_4_input_4(0), --	sfix(1, -12)
            core_1_kpu_4_input_5(0), --	sfix(1, -12)
            core_1_kpu_4_input_6(0), --	sfix(1, -12)
            core_1_kpu_4_input_7(0), --	sfix(1, -12)
            core_1_kpu_4_input_8(0), --	sfix(1, -12)
            core_1_kpu_4_input_9(0), --	sfix(1, -12)

        
            core_1_concat_big_undelayed_array(102-1 downto 89),
            core_1_concat_big_delayed_array(102-1 downto 89),
            core_1_concat_big_undelayed_array(115-1 downto 102),
            core_1_concat_big_delayed_array(115-1 downto 102),

        
            core_1_concat_small_undelayed_array(273-1 downto 260),
            core_1_concat_small_delayed_array(273-1 downto 260),
            core_1_concat_small_undelayed_array(286-1 downto 273),
            core_1_concat_small_delayed_array(286-1 downto 273),
            core_1_concat_small_undelayed_array(299-1 downto 286),
            core_1_concat_small_delayed_array(299-1 downto 286),
            core_1_concat_small_undelayed_array(312-1 downto 299),
            core_1_concat_small_delayed_array(312-1 downto 299),
            core_1_concat_small_undelayed_array(325-1 downto 312),
            core_1_concat_small_delayed_array(325-1 downto 312),
            core_1_concat_small_undelayed_array(338-1 downto 325),
            core_1_concat_small_delayed_array(338-1 downto 325),

            -- like this: yo_1
            signal_core_1_yo_4(0)
        );
    core_1_KPU_5 : entity work.conv1_core1_KPU5
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_1_kpu_5_input_1(0), --	sfix(-3, -12)
            core_1_kpu_5_input_2(0), --	sfix(0, -12)
            core_1_kpu_5_input_3(0), --	sfix(2, -12)
            core_1_kpu_5_input_4(0), --	sfix(1, -12)
            core_1_kpu_5_input_5(0), --	sfix(3, -12)
            core_1_kpu_5_input_6(0), --	sfix(2, -12)
            core_1_kpu_5_input_7(0), --	sfix(1, -12)
            core_1_kpu_5_input_8(0), --	sfix(2, -12)
            core_1_kpu_5_input_9(0), --	sfix(1, -12)

        
            core_1_concat_big_undelayed_array(129-1 downto 115),
            core_1_concat_big_delayed_array(129-1 downto 115),
            core_1_concat_big_undelayed_array(147-1 downto 129),
            core_1_concat_big_delayed_array(147-1 downto 129),

        
            core_1_concat_small_undelayed_array(347-1 downto 338),
            core_1_concat_small_delayed_array(347-1 downto 338),
            core_1_concat_small_undelayed_array(359-1 downto 347),
            core_1_concat_small_delayed_array(359-1 downto 347),
            core_1_concat_small_undelayed_array(376-1 downto 359),
            core_1_concat_small_delayed_array(376-1 downto 359),
            core_1_concat_small_undelayed_array(393-1 downto 376),
            core_1_concat_small_delayed_array(393-1 downto 376),
            core_1_concat_small_undelayed_array(411-1 downto 393),
            core_1_concat_small_delayed_array(411-1 downto 393),
            core_1_concat_small_undelayed_array(429-1 downto 411),
            core_1_concat_small_delayed_array(429-1 downto 411),

            -- like this: yo_1
            signal_core_1_yo_5(0)
        );
    core_1_KPU_6 : entity work.conv1_core1_KPU6
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_1_kpu_6_input_1(0), --	sfix(-3, -12)
            core_1_kpu_6_input_2(0), --	sfix(1, -12)
            core_1_kpu_6_input_3(0), --	sfix(-1, -12)
            core_1_kpu_6_input_4(0), --	sfix(-1, -12)
            core_1_kpu_6_input_5(0), --	sfix(2, -12)
            core_1_kpu_6_input_6(0), --	sfix(1, -12)
            core_1_kpu_6_input_7(0), --	sfix(0, -12)
            core_1_kpu_6_input_8(0), --	sfix(1, -12)
            core_1_kpu_6_input_9(0), --	sfix(1, -12)

        
            core_1_concat_big_undelayed_array(162-1 downto 147),
            core_1_concat_big_delayed_array(162-1 downto 147),
            core_1_concat_big_undelayed_array(177-1 downto 162),
            core_1_concat_big_delayed_array(177-1 downto 162),

        
            core_1_concat_small_undelayed_array(438-1 downto 429),
            core_1_concat_small_delayed_array(438-1 downto 429),
            core_1_concat_small_undelayed_array(451-1 downto 438),
            core_1_concat_small_delayed_array(451-1 downto 438),
            core_1_concat_small_undelayed_array(466-1 downto 451),
            core_1_concat_small_delayed_array(466-1 downto 451),
            core_1_concat_small_undelayed_array(481-1 downto 466),
            core_1_concat_small_delayed_array(481-1 downto 466),
            core_1_concat_small_undelayed_array(496-1 downto 481),
            core_1_concat_small_delayed_array(496-1 downto 481),
            core_1_concat_small_undelayed_array(511-1 downto 496),
            core_1_concat_small_delayed_array(511-1 downto 496),

            -- like this: yo_1
            signal_core_1_yo_6(0)
        );
    core_1_KPU_7 : entity work.conv1_core1_KPU7
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_1_kpu_7_input_1(0), --	sfix(-3, -12)
            core_1_kpu_7_input_2(0), --	sfix(0, -12)
            core_1_kpu_7_input_3(0), --	sfix(1, -12)
            core_1_kpu_7_input_4(0), --	sfix(1, -12)
            core_1_kpu_7_input_5(0), --	sfix(0, -12)
            core_1_kpu_7_input_6(0), --	sfix(-1, -12)
            core_1_kpu_7_input_7(0), --	sfix(0, -12)
            core_1_kpu_7_input_8(0), --	sfix(-2, -12)
            core_1_kpu_7_input_9(0), --	sfix(1, -12)

        
            core_1_concat_big_undelayed_array(191-1 downto 177),
            core_1_concat_big_delayed_array(191-1 downto 177),
            core_1_concat_big_undelayed_array(206-1 downto 191),
            core_1_concat_big_delayed_array(206-1 downto 191),

        
            core_1_concat_small_undelayed_array(520-1 downto 511),
            core_1_concat_small_delayed_array(520-1 downto 511),
            core_1_concat_small_undelayed_array(532-1 downto 520),
            core_1_concat_small_delayed_array(532-1 downto 520),
            core_1_concat_small_undelayed_array(546-1 downto 532),
            core_1_concat_small_delayed_array(546-1 downto 532),
            core_1_concat_small_undelayed_array(560-1 downto 546),
            core_1_concat_small_delayed_array(560-1 downto 546),
            core_1_concat_small_undelayed_array(575-1 downto 560),
            core_1_concat_small_delayed_array(575-1 downto 560),
            core_1_concat_small_undelayed_array(590-1 downto 575),
            core_1_concat_small_delayed_array(590-1 downto 575),

            -- like this: yo_1
            signal_core_1_yo_7(0)
        );
    core_1_KPU_8 : entity work.conv1_core1_KPU8
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_1_kpu_8_input_1(0), --	sfix(-3, -12)
            core_1_kpu_8_input_2(0), --	sfix(-3, -12)
            core_1_kpu_8_input_3(0), --	sfix(-3, -12)
            core_1_kpu_8_input_4(0), --	sfix(-3, -12)
            core_1_kpu_8_input_5(0), --	sfix(-3, -12)
            core_1_kpu_8_input_6(0), --	sfix(1, -12)
            core_1_kpu_8_input_7(0), --	sfix(-1, -12)
            core_1_kpu_8_input_8(0), --	sfix(-3, -12)
            core_1_kpu_8_input_9(0), --	sfix(1, -12)

        
            core_1_concat_big_undelayed_array(218-1 downto 206),
            core_1_concat_big_delayed_array(218-1 downto 206),
            core_1_concat_big_undelayed_array(232-1 downto 218),
            core_1_concat_big_delayed_array(232-1 downto 218),

        
            core_1_concat_small_undelayed_array(599-1 downto 590),
            core_1_concat_small_delayed_array(599-1 downto 590),
            core_1_concat_small_undelayed_array(610-1 downto 599),
            core_1_concat_small_delayed_array(610-1 downto 599),
            core_1_concat_small_undelayed_array(623-1 downto 610),
            core_1_concat_small_delayed_array(623-1 downto 610),
            core_1_concat_small_undelayed_array(636-1 downto 623),
            core_1_concat_small_delayed_array(636-1 downto 623),
            core_1_concat_small_undelayed_array(650-1 downto 636),
            core_1_concat_small_delayed_array(650-1 downto 636),
            core_1_concat_small_undelayed_array(664-1 downto 650),
            core_1_concat_small_delayed_array(664-1 downto 650),

            -- like this: yo_1
            signal_core_1_yo_8(0)
        );
    core_1_KPU_9 : entity work.conv1_core1_KPU9
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_1_kpu_9_input_1(0), --	sfix(1, -12)
            core_1_kpu_9_input_2(0), --	sfix(1, -12)
            core_1_kpu_9_input_3(0), --	sfix(1, -12)
            core_1_kpu_9_input_4(0), --	sfix(1, -12)
            core_1_kpu_9_input_5(0), --	sfix(1, -12)
            core_1_kpu_9_input_6(0), --	sfix(1, -12)
            core_1_kpu_9_input_7(0), --	sfix(1, -12)
            core_1_kpu_9_input_8(0), --	sfix(1, -12)
            core_1_kpu_9_input_9(0), --	sfix(1, -12)

        
            core_1_concat_big_undelayed_array(245-1 downto 232),
            core_1_concat_big_delayed_array(245-1 downto 232),
            core_1_concat_big_undelayed_array(258-1 downto 245),
            core_1_concat_big_delayed_array(258-1 downto 245),

        
            core_1_concat_small_undelayed_array(677-1 downto 664),
            core_1_concat_small_delayed_array(677-1 downto 664),
            core_1_concat_small_undelayed_array(690-1 downto 677),
            core_1_concat_small_delayed_array(690-1 downto 677),
            core_1_concat_small_undelayed_array(703-1 downto 690),
            core_1_concat_small_delayed_array(703-1 downto 690),
            core_1_concat_small_undelayed_array(716-1 downto 703),
            core_1_concat_small_delayed_array(716-1 downto 703),
            core_1_concat_small_undelayed_array(729-1 downto 716),
            core_1_concat_small_delayed_array(729-1 downto 716),
            core_1_concat_small_undelayed_array(742-1 downto 729),
            core_1_concat_small_delayed_array(742-1 downto 729),

            -- like this: yo_1
            signal_core_1_yo_9(0)
        );
    core_1_KPU_10 : entity work.conv1_core1_KPU10
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_1_kpu_10_input_1(0), --	sfix(1, -12)
            core_1_kpu_10_input_2(0), --	sfix(1, -12)
            core_1_kpu_10_input_3(0), --	sfix(1, -12)
            core_1_kpu_10_input_4(0), --	sfix(1, -12)
            core_1_kpu_10_input_5(0), --	sfix(1, -12)
            core_1_kpu_10_input_6(0), --	sfix(1, -12)
            core_1_kpu_10_input_7(0), --	sfix(1, -12)
            core_1_kpu_10_input_8(0), --	sfix(1, -12)
            core_1_kpu_10_input_9(0), --	sfix(1, -12)

        
            core_1_concat_big_undelayed_array(271-1 downto 258),
            core_1_concat_big_delayed_array(271-1 downto 258),
            core_1_concat_big_undelayed_array(284-1 downto 271),
            core_1_concat_big_delayed_array(284-1 downto 271),

        
            core_1_concat_small_undelayed_array(755-1 downto 742),
            core_1_concat_small_delayed_array(755-1 downto 742),
            core_1_concat_small_undelayed_array(768-1 downto 755),
            core_1_concat_small_delayed_array(768-1 downto 755),
            core_1_concat_small_undelayed_array(781-1 downto 768),
            core_1_concat_small_delayed_array(781-1 downto 768),
            core_1_concat_small_undelayed_array(794-1 downto 781),
            core_1_concat_small_delayed_array(794-1 downto 781),
            core_1_concat_small_undelayed_array(807-1 downto 794),
            core_1_concat_small_delayed_array(807-1 downto 794),
            core_1_concat_small_undelayed_array(820-1 downto 807),
            core_1_concat_small_delayed_array(820-1 downto 807),

            -- like this: yo_1
            signal_core_1_yo_10(0)
        );
    core_1_KPU_11 : entity work.conv1_core1_KPU11
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_1_kpu_11_input_1(0), --	sfix(1, -12)
            core_1_kpu_11_input_2(0), --	sfix(1, -12)
            core_1_kpu_11_input_3(0), --	sfix(1, -12)
            core_1_kpu_11_input_4(0), --	sfix(1, -12)
            core_1_kpu_11_input_5(0), --	sfix(1, -12)
            core_1_kpu_11_input_6(0), --	sfix(1, -12)
            core_1_kpu_11_input_7(0), --	sfix(1, -12)
            core_1_kpu_11_input_8(0), --	sfix(1, -12)
            core_1_kpu_11_input_9(0), --	sfix(1, -12)

        
            core_1_concat_big_undelayed_array(297-1 downto 284),
            core_1_concat_big_delayed_array(297-1 downto 284),
            core_1_concat_big_undelayed_array(310-1 downto 297),
            core_1_concat_big_delayed_array(310-1 downto 297),

        
            core_1_concat_small_undelayed_array(833-1 downto 820),
            core_1_concat_small_delayed_array(833-1 downto 820),
            core_1_concat_small_undelayed_array(846-1 downto 833),
            core_1_concat_small_delayed_array(846-1 downto 833),
            core_1_concat_small_undelayed_array(859-1 downto 846),
            core_1_concat_small_delayed_array(859-1 downto 846),
            core_1_concat_small_undelayed_array(872-1 downto 859),
            core_1_concat_small_delayed_array(872-1 downto 859),
            core_1_concat_small_undelayed_array(885-1 downto 872),
            core_1_concat_small_delayed_array(885-1 downto 872),
            core_1_concat_small_undelayed_array(898-1 downto 885),
            core_1_concat_small_delayed_array(898-1 downto 885),

            -- like this: yo_1
            signal_core_1_yo_11(0)
        );
    core_1_KPU_12 : entity work.conv1_core1_KPU12
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_1_kpu_12_input_1(0), --	sfix(3, -12)
            core_1_kpu_12_input_2(0), --	sfix(3, -12)
            core_1_kpu_12_input_3(0), --	sfix(-1, -12)
            core_1_kpu_12_input_4(0), --	sfix(3, -12)
            core_1_kpu_12_input_5(0), --	sfix(3, -12)
            core_1_kpu_12_input_6(0), --	sfix(-2, -12)
            core_1_kpu_12_input_7(0), --	sfix(0, -12)
            core_1_kpu_12_input_8(0), --	sfix(1, -12)
            core_1_kpu_12_input_9(0), --	sfix(0, -12)

        
            core_1_concat_big_undelayed_array(328-1 downto 310),
            core_1_concat_big_delayed_array(328-1 downto 310),
            core_1_concat_big_undelayed_array(346-1 downto 328),
            core_1_concat_big_delayed_array(346-1 downto 328),

        
            core_1_concat_small_undelayed_array(913-1 downto 898),
            core_1_concat_small_delayed_array(913-1 downto 898),
            core_1_concat_small_undelayed_array(930-1 downto 913),
            core_1_concat_small_delayed_array(930-1 downto 913),
            core_1_concat_small_undelayed_array(948-1 downto 930),
            core_1_concat_small_delayed_array(948-1 downto 930),
            core_1_concat_small_undelayed_array(966-1 downto 948),
            core_1_concat_small_delayed_array(966-1 downto 948),
            core_1_concat_small_undelayed_array(984-1 downto 966),
            core_1_concat_small_delayed_array(984-1 downto 966),
            core_1_concat_small_undelayed_array(1002-1 downto 984),
            core_1_concat_small_delayed_array(1002-1 downto 984),

            -- like this: yo_1
            signal_core_1_yo_12(0)
        );
    core_1_KPU_13 : entity work.conv1_core1_KPU13
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_1_kpu_13_input_1(0), --	sfix(2, -12)
            core_1_kpu_13_input_2(0), --	sfix(2, -12)
            core_1_kpu_13_input_3(0), --	sfix(2, -12)
            core_1_kpu_13_input_4(0), --	sfix(3, -12)
            core_1_kpu_13_input_5(0), --	sfix(3, -12)
            core_1_kpu_13_input_6(0), --	sfix(2, -12)
            core_1_kpu_13_input_7(0), --	sfix(1, -12)
            core_1_kpu_13_input_8(0), --	sfix(2, -12)
            core_1_kpu_13_input_9(0), --	sfix(1, -12)

        
            core_1_concat_big_undelayed_array(363-1 downto 346),
            core_1_concat_big_delayed_array(363-1 downto 346),
            core_1_concat_big_undelayed_array(381-1 downto 363),
            core_1_concat_big_delayed_array(381-1 downto 363),

        
            core_1_concat_small_undelayed_array(1016-1 downto 1002),
            core_1_concat_small_delayed_array(1016-1 downto 1002),
            core_1_concat_small_undelayed_array(1032-1 downto 1016),
            core_1_concat_small_delayed_array(1032-1 downto 1016),
            core_1_concat_small_undelayed_array(1050-1 downto 1032),
            core_1_concat_small_delayed_array(1050-1 downto 1032),
            core_1_concat_small_undelayed_array(1068-1 downto 1050),
            core_1_concat_small_delayed_array(1068-1 downto 1050),
            core_1_concat_small_undelayed_array(1086-1 downto 1068),
            core_1_concat_small_delayed_array(1086-1 downto 1068),
            core_1_concat_small_undelayed_array(1104-1 downto 1086),
            core_1_concat_small_delayed_array(1104-1 downto 1086),

            -- like this: yo_1
            signal_core_1_yo_13(0)
        );
    core_1_KPU_14 : entity work.conv1_core1_KPU14
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_1_kpu_14_input_1(0), --	sfix(0, -12)
            core_1_kpu_14_input_2(0), --	sfix(0, -12)
            core_1_kpu_14_input_3(0), --	sfix(-1, -12)
            core_1_kpu_14_input_4(0), --	sfix(0, -12)
            core_1_kpu_14_input_5(0), --	sfix(1, -12)
            core_1_kpu_14_input_6(0), --	sfix(1, -12)
            core_1_kpu_14_input_7(0), --	sfix(0, -12)
            core_1_kpu_14_input_8(0), --	sfix(0, -12)
            core_1_kpu_14_input_9(0), --	sfix(-3, -12)

        
            core_1_concat_big_undelayed_array(396-1 downto 381),
            core_1_concat_big_delayed_array(396-1 downto 381),
            core_1_concat_big_undelayed_array(412-1 downto 396),
            core_1_concat_big_delayed_array(412-1 downto 396),

        
            core_1_concat_small_undelayed_array(1116-1 downto 1104),
            core_1_concat_small_delayed_array(1116-1 downto 1104),
            core_1_concat_small_undelayed_array(1130-1 downto 1116),
            core_1_concat_small_delayed_array(1130-1 downto 1116),
            core_1_concat_small_undelayed_array(1145-1 downto 1130),
            core_1_concat_small_delayed_array(1145-1 downto 1130),
            core_1_concat_small_undelayed_array(1161-1 downto 1145),
            core_1_concat_small_delayed_array(1161-1 downto 1145),
            core_1_concat_small_undelayed_array(1177-1 downto 1161),
            core_1_concat_small_delayed_array(1177-1 downto 1161),
            core_1_concat_small_undelayed_array(1193-1 downto 1177),
            core_1_concat_small_delayed_array(1193-1 downto 1177),

            -- like this: yo_1
            signal_core_1_yo_14(0)
        );
    core_1_KPU_15 : entity work.conv1_core1_KPU15
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_1_kpu_15_input_1(0), --	sfix(-3, -12)
            core_1_kpu_15_input_2(0), --	sfix(1, -12)
            core_1_kpu_15_input_3(0), --	sfix(-3, -12)
            core_1_kpu_15_input_4(0), --	sfix(-3, -12)
            core_1_kpu_15_input_5(0), --	sfix(-3, -12)
            core_1_kpu_15_input_6(0), --	sfix(-3, -12)
            core_1_kpu_15_input_7(0), --	sfix(-3, -12)
            core_1_kpu_15_input_8(0), --	sfix(1, -12)
            core_1_kpu_15_input_9(0), --	sfix(1, -12)

        
            core_1_concat_big_undelayed_array(425-1 downto 412),
            core_1_concat_big_delayed_array(425-1 downto 412),
            core_1_concat_big_undelayed_array(438-1 downto 425),
            core_1_concat_big_delayed_array(438-1 downto 425),

        
            core_1_concat_small_undelayed_array(1202-1 downto 1193),
            core_1_concat_small_delayed_array(1202-1 downto 1193),
            core_1_concat_small_undelayed_array(1215-1 downto 1202),
            core_1_concat_small_delayed_array(1215-1 downto 1202),
            core_1_concat_small_undelayed_array(1228-1 downto 1215),
            core_1_concat_small_delayed_array(1228-1 downto 1215),
            core_1_concat_small_undelayed_array(1241-1 downto 1228),
            core_1_concat_small_delayed_array(1241-1 downto 1228),
            core_1_concat_small_undelayed_array(1254-1 downto 1241),
            core_1_concat_small_delayed_array(1254-1 downto 1241),
            core_1_concat_small_undelayed_array(1267-1 downto 1254),
            core_1_concat_small_delayed_array(1267-1 downto 1254),

            -- like this: yo_1
            signal_core_1_yo_15(0)
        );
    core_1_KPU_16 : entity work.conv1_core1_KPU16
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_1_kpu_16_input_1(0), --	sfix(0, -12)
            core_1_kpu_16_input_2(0), --	sfix(0, -12)
            core_1_kpu_16_input_3(0), --	sfix(-2, -12)
            core_1_kpu_16_input_4(0), --	sfix(2, -12)
            core_1_kpu_16_input_5(0), --	sfix(2, -12)
            core_1_kpu_16_input_6(0), --	sfix(-1, -12)
            core_1_kpu_16_input_7(0), --	sfix(0, -12)
            core_1_kpu_16_input_8(0), --	sfix(1, -12)
            core_1_kpu_16_input_9(0), --	sfix(-2, -12)

        
            core_1_concat_big_undelayed_array(453-1 downto 438),
            core_1_concat_big_delayed_array(453-1 downto 438),
            core_1_concat_big_undelayed_array(470-1 downto 453),
            core_1_concat_big_delayed_array(470-1 downto 453),

        
            core_1_concat_small_undelayed_array(1279-1 downto 1267),
            core_1_concat_small_delayed_array(1279-1 downto 1267),
            core_1_concat_small_undelayed_array(1293-1 downto 1279),
            core_1_concat_small_delayed_array(1293-1 downto 1279),
            core_1_concat_small_undelayed_array(1308-1 downto 1293),
            core_1_concat_small_delayed_array(1308-1 downto 1293),
            core_1_concat_small_undelayed_array(1325-1 downto 1308),
            core_1_concat_small_delayed_array(1325-1 downto 1308),
            core_1_concat_small_undelayed_array(1342-1 downto 1325),
            core_1_concat_small_delayed_array(1342-1 downto 1325),
            core_1_concat_small_undelayed_array(1359-1 downto 1342),
            core_1_concat_small_delayed_array(1359-1 downto 1342),

            -- like this: yo_1
            signal_core_1_yo_16(0)
        );
    core_1_KPU_17 : entity work.conv1_core1_KPU17
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_1_kpu_17_input_1(0), --	sfix(1, -12)
            core_1_kpu_17_input_2(0), --	sfix(3, -12)
            core_1_kpu_17_input_3(0), --	sfix(-1, -12)
            core_1_kpu_17_input_4(0), --	sfix(-1, -12)
            core_1_kpu_17_input_5(0), --	sfix(2, -12)
            core_1_kpu_17_input_6(0), --	sfix(1, -12)
            core_1_kpu_17_input_7(0), --	sfix(0, -12)
            core_1_kpu_17_input_8(0), --	sfix(-2, -12)
            core_1_kpu_17_input_9(0), --	sfix(-1, -12)

        
            core_1_concat_big_undelayed_array(487-1 downto 470),
            core_1_concat_big_delayed_array(487-1 downto 470),
            core_1_concat_big_undelayed_array(504-1 downto 487),
            core_1_concat_big_delayed_array(504-1 downto 487),

        
            core_1_concat_small_undelayed_array(1372-1 downto 1359),
            core_1_concat_small_delayed_array(1372-1 downto 1359),
            core_1_concat_small_undelayed_array(1387-1 downto 1372),
            core_1_concat_small_delayed_array(1387-1 downto 1372),
            core_1_concat_small_undelayed_array(1404-1 downto 1387),
            core_1_concat_small_delayed_array(1404-1 downto 1387),
            core_1_concat_small_undelayed_array(1421-1 downto 1404),
            core_1_concat_small_delayed_array(1421-1 downto 1404),
            core_1_concat_small_undelayed_array(1438-1 downto 1421),
            core_1_concat_small_delayed_array(1438-1 downto 1421),
            core_1_concat_small_undelayed_array(1455-1 downto 1438),
            core_1_concat_small_delayed_array(1455-1 downto 1438),

            -- like this: yo_1
            signal_core_1_yo_17(0)
        );
    core_1_KPU_18 : entity work.conv1_core1_KPU18
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_1_kpu_18_input_1(0), --	sfix(2, -12)
            core_1_kpu_18_input_2(0), --	sfix(1, -12)
            core_1_kpu_18_input_3(0), --	sfix(1, -12)
            core_1_kpu_18_input_4(0), --	sfix(1, -12)
            core_1_kpu_18_input_5(0), --	sfix(1, -12)
            core_1_kpu_18_input_6(0), --	sfix(0, -12)
            core_1_kpu_18_input_7(0), --	sfix(0, -12)
            core_1_kpu_18_input_8(0), --	sfix(0, -12)
            core_1_kpu_18_input_9(0), --	sfix(0, -12)

        
            core_1_concat_big_undelayed_array(521-1 downto 504),
            core_1_concat_big_delayed_array(521-1 downto 504),
            core_1_concat_big_undelayed_array(539-1 downto 521),
            core_1_concat_big_delayed_array(539-1 downto 521),

        
            core_1_concat_small_undelayed_array(1469-1 downto 1455),
            core_1_concat_small_delayed_array(1469-1 downto 1455),
            core_1_concat_small_undelayed_array(1485-1 downto 1469),
            core_1_concat_small_delayed_array(1485-1 downto 1469),
            core_1_concat_small_undelayed_array(1503-1 downto 1485),
            core_1_concat_small_delayed_array(1503-1 downto 1485),
            core_1_concat_small_undelayed_array(1521-1 downto 1503),
            core_1_concat_small_delayed_array(1521-1 downto 1503),
            core_1_concat_small_undelayed_array(1539-1 downto 1521),
            core_1_concat_small_delayed_array(1539-1 downto 1521),
            core_1_concat_small_undelayed_array(1557-1 downto 1539),
            core_1_concat_small_delayed_array(1557-1 downto 1539),

            -- like this: yo_1
            signal_core_1_yo_18(0)
        );
    core_1_KPU_19 : entity work.conv1_core1_KPU19
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_1_kpu_19_input_1(0), --	sfix(2, -12)
            core_1_kpu_19_input_2(0), --	sfix(3, -12)
            core_1_kpu_19_input_3(0), --	sfix(3, -12)
            core_1_kpu_19_input_4(0), --	sfix(3, -12)
            core_1_kpu_19_input_5(0), --	sfix(3, -12)
            core_1_kpu_19_input_6(0), --	sfix(3, -12)
            core_1_kpu_19_input_7(0), --	sfix(3, -12)
            core_1_kpu_19_input_8(0), --	sfix(3, -12)
            core_1_kpu_19_input_9(0), --	sfix(2, -12)

        
            core_1_concat_big_undelayed_array(557-1 downto 539),
            core_1_concat_big_delayed_array(557-1 downto 539),
            core_1_concat_big_undelayed_array(576-1 downto 557),
            core_1_concat_big_delayed_array(576-1 downto 557),

        
            core_1_concat_small_undelayed_array(1571-1 downto 1557),
            core_1_concat_small_delayed_array(1571-1 downto 1557),
            core_1_concat_small_undelayed_array(1587-1 downto 1571),
            core_1_concat_small_delayed_array(1587-1 downto 1571),
            core_1_concat_small_undelayed_array(1605-1 downto 1587),
            core_1_concat_small_delayed_array(1605-1 downto 1587),
            core_1_concat_small_undelayed_array(1624-1 downto 1605),
            core_1_concat_small_delayed_array(1624-1 downto 1605),
            core_1_concat_small_undelayed_array(1643-1 downto 1624),
            core_1_concat_small_delayed_array(1643-1 downto 1624),
            core_1_concat_small_undelayed_array(1662-1 downto 1643),
            core_1_concat_small_delayed_array(1662-1 downto 1643),

            -- like this: yo_1
            signal_core_1_yo_19(0)
        );
    core_1_KPU_20 : entity work.conv1_core1_KPU20
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_1_kpu_20_input_1(0), --	sfix(0, -12)
            core_1_kpu_20_input_2(0), --	sfix(0, -12)
            core_1_kpu_20_input_3(0), --	sfix(1, -12)
            core_1_kpu_20_input_4(0), --	sfix(1, -12)
            core_1_kpu_20_input_5(0), --	sfix(2, -12)
            core_1_kpu_20_input_6(0), --	sfix(-1, -12)
            core_1_kpu_20_input_7(0), --	sfix(1, -12)
            core_1_kpu_20_input_8(0), --	sfix(1, -12)
            core_1_kpu_20_input_9(0), --	sfix(0, -12)

        
            core_1_concat_big_undelayed_array(591-1 downto 576),
            core_1_concat_big_delayed_array(591-1 downto 576),
            core_1_concat_big_undelayed_array(608-1 downto 591),
            core_1_concat_big_delayed_array(608-1 downto 591),

        
            core_1_concat_small_undelayed_array(1674-1 downto 1662),
            core_1_concat_small_delayed_array(1674-1 downto 1662),
            core_1_concat_small_undelayed_array(1688-1 downto 1674),
            core_1_concat_small_delayed_array(1688-1 downto 1674),
            core_1_concat_small_undelayed_array(1703-1 downto 1688),
            core_1_concat_small_delayed_array(1703-1 downto 1688),
            core_1_concat_small_undelayed_array(1719-1 downto 1703),
            core_1_concat_small_delayed_array(1719-1 downto 1703),
            core_1_concat_small_undelayed_array(1736-1 downto 1719),
            core_1_concat_small_delayed_array(1736-1 downto 1719),
            core_1_concat_small_undelayed_array(1753-1 downto 1736),
            core_1_concat_small_delayed_array(1753-1 downto 1736),

            -- like this: yo_1
            signal_core_1_yo_20(0)
        );
    core_1_KPU_21 : entity work.conv1_core1_KPU21
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_1_kpu_21_input_1(0), --	sfix(1, -12)
            core_1_kpu_21_input_2(0), --	sfix(1, -12)
            core_1_kpu_21_input_3(0), --	sfix(1, -12)
            core_1_kpu_21_input_4(0), --	sfix(1, -12)
            core_1_kpu_21_input_5(0), --	sfix(1, -12)
            core_1_kpu_21_input_6(0), --	sfix(1, -12)
            core_1_kpu_21_input_7(0), --	sfix(1, -12)
            core_1_kpu_21_input_8(0), --	sfix(1, -12)
            core_1_kpu_21_input_9(0), --	sfix(1, -12)

        
            core_1_concat_big_undelayed_array(621-1 downto 608),
            core_1_concat_big_delayed_array(621-1 downto 608),
            core_1_concat_big_undelayed_array(634-1 downto 621),
            core_1_concat_big_delayed_array(634-1 downto 621),

        
            core_1_concat_small_undelayed_array(1766-1 downto 1753),
            core_1_concat_small_delayed_array(1766-1 downto 1753),
            core_1_concat_small_undelayed_array(1779-1 downto 1766),
            core_1_concat_small_delayed_array(1779-1 downto 1766),
            core_1_concat_small_undelayed_array(1792-1 downto 1779),
            core_1_concat_small_delayed_array(1792-1 downto 1779),
            core_1_concat_small_undelayed_array(1805-1 downto 1792),
            core_1_concat_small_delayed_array(1805-1 downto 1792),
            core_1_concat_small_undelayed_array(1818-1 downto 1805),
            core_1_concat_small_delayed_array(1818-1 downto 1805),
            core_1_concat_small_undelayed_array(1831-1 downto 1818),
            core_1_concat_small_delayed_array(1831-1 downto 1818),

            -- like this: yo_1
            signal_core_1_yo_21(0)
        );
    core_1_KPU_22 : entity work.conv1_core1_KPU22
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_1_kpu_22_input_1(0), --	sfix(1, -12)
            core_1_kpu_22_input_2(0), --	sfix(3, -12)
            core_1_kpu_22_input_3(0), --	sfix(2, -12)
            core_1_kpu_22_input_4(0), --	sfix(3, -12)
            core_1_kpu_22_input_5(0), --	sfix(2, -12)
            core_1_kpu_22_input_6(0), --	sfix(3, -12)
            core_1_kpu_22_input_7(0), --	sfix(2, -12)
            core_1_kpu_22_input_8(0), --	sfix(1, -12)
            core_1_kpu_22_input_9(0), --	sfix(2, -12)

        
            core_1_concat_big_undelayed_array(651-1 downto 634),
            core_1_concat_big_delayed_array(651-1 downto 634),
            core_1_concat_big_undelayed_array(669-1 downto 651),
            core_1_concat_big_delayed_array(669-1 downto 651),

        
            core_1_concat_small_undelayed_array(1844-1 downto 1831),
            core_1_concat_small_delayed_array(1844-1 downto 1831),
            core_1_concat_small_undelayed_array(1859-1 downto 1844),
            core_1_concat_small_delayed_array(1859-1 downto 1844),
            core_1_concat_small_undelayed_array(1877-1 downto 1859),
            core_1_concat_small_delayed_array(1877-1 downto 1859),
            core_1_concat_small_undelayed_array(1895-1 downto 1877),
            core_1_concat_small_delayed_array(1895-1 downto 1877),
            core_1_concat_small_undelayed_array(1913-1 downto 1895),
            core_1_concat_small_delayed_array(1913-1 downto 1895),
            core_1_concat_small_undelayed_array(1931-1 downto 1913),
            core_1_concat_small_delayed_array(1931-1 downto 1913),

            -- like this: yo_1
            signal_core_1_yo_22(0)
        );
    core_1_KPU_23 : entity work.conv1_core1_KPU23
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_1_kpu_23_input_1(0), --	sfix(1, -12)
            core_1_kpu_23_input_2(0), --	sfix(1, -12)
            core_1_kpu_23_input_3(0), --	sfix(1, -12)
            core_1_kpu_23_input_4(0), --	sfix(1, -12)
            core_1_kpu_23_input_5(0), --	sfix(1, -12)
            core_1_kpu_23_input_6(0), --	sfix(1, -12)
            core_1_kpu_23_input_7(0), --	sfix(1, -12)
            core_1_kpu_23_input_8(0), --	sfix(1, -12)
            core_1_kpu_23_input_9(0), --	sfix(1, -12)

        
            core_1_concat_big_undelayed_array(682-1 downto 669),
            core_1_concat_big_delayed_array(682-1 downto 669),
            core_1_concat_big_undelayed_array(695-1 downto 682),
            core_1_concat_big_delayed_array(695-1 downto 682),

        
            core_1_concat_small_undelayed_array(1944-1 downto 1931),
            core_1_concat_small_delayed_array(1944-1 downto 1931),
            core_1_concat_small_undelayed_array(1957-1 downto 1944),
            core_1_concat_small_delayed_array(1957-1 downto 1944),
            core_1_concat_small_undelayed_array(1970-1 downto 1957),
            core_1_concat_small_delayed_array(1970-1 downto 1957),
            core_1_concat_small_undelayed_array(1983-1 downto 1970),
            core_1_concat_small_delayed_array(1983-1 downto 1970),
            core_1_concat_small_undelayed_array(1996-1 downto 1983),
            core_1_concat_small_delayed_array(1996-1 downto 1983),
            core_1_concat_small_undelayed_array(2009-1 downto 1996),
            core_1_concat_small_delayed_array(2009-1 downto 1996),

            -- like this: yo_1
            signal_core_1_yo_23(0)
        );
    core_1_KPU_24 : entity work.conv1_core1_KPU24
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_1_kpu_24_input_1(0), --	sfix(1, -12)
            core_1_kpu_24_input_2(0), --	sfix(1, -12)
            core_1_kpu_24_input_3(0), --	sfix(1, -12)
            core_1_kpu_24_input_4(0), --	sfix(1, -12)
            core_1_kpu_24_input_5(0), --	sfix(0, -12)
            core_1_kpu_24_input_6(0), --	sfix(1, -12)
            core_1_kpu_24_input_7(0), --	sfix(-1, -12)
            core_1_kpu_24_input_8(0), --	sfix(-1, -12)
            core_1_kpu_24_input_9(0), --	sfix(1, -12)

        
            core_1_concat_big_undelayed_array(711-1 downto 695),
            core_1_concat_big_delayed_array(711-1 downto 695),
            core_1_concat_big_undelayed_array(727-1 downto 711),
            core_1_concat_big_delayed_array(727-1 downto 711),

        
            core_1_concat_small_undelayed_array(2022-1 downto 2009),
            core_1_concat_small_delayed_array(2022-1 downto 2009),
            core_1_concat_small_undelayed_array(2037-1 downto 2022),
            core_1_concat_small_delayed_array(2037-1 downto 2022),
            core_1_concat_small_undelayed_array(2053-1 downto 2037),
            core_1_concat_small_delayed_array(2053-1 downto 2037),
            core_1_concat_small_undelayed_array(2069-1 downto 2053),
            core_1_concat_small_delayed_array(2069-1 downto 2053),
            core_1_concat_small_undelayed_array(2085-1 downto 2069),
            core_1_concat_small_delayed_array(2085-1 downto 2069),
            core_1_concat_small_undelayed_array(2101-1 downto 2085),
            core_1_concat_small_delayed_array(2101-1 downto 2085),

            -- like this: yo_1
            signal_core_1_yo_24(0)
        );
    core_1_KPU_25 : entity work.conv1_core1_KPU25
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_1_kpu_25_input_1(0), --	sfix(1, -12)
            core_1_kpu_25_input_2(0), --	sfix(1, -12)
            core_1_kpu_25_input_3(0), --	sfix(1, -12)
            core_1_kpu_25_input_4(0), --	sfix(1, -12)
            core_1_kpu_25_input_5(0), --	sfix(1, -12)
            core_1_kpu_25_input_6(0), --	sfix(1, -12)
            core_1_kpu_25_input_7(0), --	sfix(1, -12)
            core_1_kpu_25_input_8(0), --	sfix(1, -12)
            core_1_kpu_25_input_9(0), --	sfix(1, -12)

        
            core_1_concat_big_undelayed_array(740-1 downto 727),
            core_1_concat_big_delayed_array(740-1 downto 727),
            core_1_concat_big_undelayed_array(753-1 downto 740),
            core_1_concat_big_delayed_array(753-1 downto 740),

        
            core_1_concat_small_undelayed_array(2114-1 downto 2101),
            core_1_concat_small_delayed_array(2114-1 downto 2101),
            core_1_concat_small_undelayed_array(2127-1 downto 2114),
            core_1_concat_small_delayed_array(2127-1 downto 2114),
            core_1_concat_small_undelayed_array(2140-1 downto 2127),
            core_1_concat_small_delayed_array(2140-1 downto 2127),
            core_1_concat_small_undelayed_array(2153-1 downto 2140),
            core_1_concat_small_delayed_array(2153-1 downto 2140),
            core_1_concat_small_undelayed_array(2166-1 downto 2153),
            core_1_concat_small_delayed_array(2166-1 downto 2153),
            core_1_concat_small_undelayed_array(2179-1 downto 2166),
            core_1_concat_small_delayed_array(2179-1 downto 2166),

            -- like this: yo_1
            signal_core_1_yo_25(0)
        );
    core_1_KPU_26 : entity work.conv1_core1_KPU26
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_1_kpu_26_input_1(0), --	sfix(-2, -12)
            core_1_kpu_26_input_2(0), --	sfix(-2, -12)
            core_1_kpu_26_input_3(0), --	sfix(-1, -12)
            core_1_kpu_26_input_4(0), --	sfix(-1, -12)
            core_1_kpu_26_input_5(0), --	sfix(1, -12)
            core_1_kpu_26_input_6(0), --	sfix(0, -12)
            core_1_kpu_26_input_7(0), --	sfix(-3, -12)
            core_1_kpu_26_input_8(0), --	sfix(-1, -12)
            core_1_kpu_26_input_9(0), --	sfix(-1, -12)

        
            core_1_concat_big_undelayed_array(766-1 downto 753),
            core_1_concat_big_delayed_array(766-1 downto 753),
            core_1_concat_big_undelayed_array(781-1 downto 766),
            core_1_concat_big_delayed_array(781-1 downto 766),

        
            core_1_concat_small_undelayed_array(2189-1 downto 2179),
            core_1_concat_small_delayed_array(2189-1 downto 2179),
            core_1_concat_small_undelayed_array(2201-1 downto 2189),
            core_1_concat_small_delayed_array(2201-1 downto 2189),
            core_1_concat_small_undelayed_array(2215-1 downto 2201),
            core_1_concat_small_delayed_array(2215-1 downto 2201),
            core_1_concat_small_undelayed_array(2229-1 downto 2215),
            core_1_concat_small_delayed_array(2229-1 downto 2215),
            core_1_concat_small_undelayed_array(2244-1 downto 2229),
            core_1_concat_small_delayed_array(2244-1 downto 2229),
            core_1_concat_small_undelayed_array(2259-1 downto 2244),
            core_1_concat_small_delayed_array(2259-1 downto 2244),

            -- like this: yo_1
            signal_core_1_yo_26(0)
        );
    core_1_KPU_27 : entity work.conv1_core1_KPU27
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_1_kpu_27_input_1(0), --	sfix(-1, -12)
            core_1_kpu_27_input_2(0), --	sfix(0, -12)
            core_1_kpu_27_input_3(0), --	sfix(-1, -12)
            core_1_kpu_27_input_4(0), --	sfix(0, -12)
            core_1_kpu_27_input_5(0), --	sfix(0, -12)
            core_1_kpu_27_input_6(0), --	sfix(0, -12)
            core_1_kpu_27_input_7(0), --	sfix(-1, -12)
            core_1_kpu_27_input_8(0), --	sfix(0, -12)
            core_1_kpu_27_input_9(0), --	sfix(-1, -12)

        
            core_1_concat_big_undelayed_array(795-1 downto 781),
            core_1_concat_big_delayed_array(795-1 downto 781),
            core_1_concat_big_undelayed_array(810-1 downto 795),
            core_1_concat_big_delayed_array(810-1 downto 795),

        
            core_1_concat_small_undelayed_array(2270-1 downto 2259),
            core_1_concat_small_delayed_array(2270-1 downto 2259),
            core_1_concat_small_undelayed_array(2283-1 downto 2270),
            core_1_concat_small_delayed_array(2283-1 downto 2270),
            core_1_concat_small_undelayed_array(2298-1 downto 2283),
            core_1_concat_small_delayed_array(2298-1 downto 2283),
            core_1_concat_small_undelayed_array(2313-1 downto 2298),
            core_1_concat_small_delayed_array(2313-1 downto 2298),
            core_1_concat_small_undelayed_array(2328-1 downto 2313),
            core_1_concat_small_delayed_array(2328-1 downto 2313),
            core_1_concat_small_undelayed_array(2343-1 downto 2328),
            core_1_concat_small_delayed_array(2343-1 downto 2328),

            -- like this: yo_1
            signal_core_1_yo_27(0)
        );
    core_1_KPU_28 : entity work.conv1_core1_KPU28
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_1_kpu_28_input_1(0), --	sfix(1, -12)
            core_1_kpu_28_input_2(0), --	sfix(1, -12)
            core_1_kpu_28_input_3(0), --	sfix(1, -12)
            core_1_kpu_28_input_4(0), --	sfix(1, -12)
            core_1_kpu_28_input_5(0), --	sfix(1, -12)
            core_1_kpu_28_input_6(0), --	sfix(1, -12)
            core_1_kpu_28_input_7(0), --	sfix(1, -12)
            core_1_kpu_28_input_8(0), --	sfix(1, -12)
            core_1_kpu_28_input_9(0), --	sfix(1, -12)

        
            core_1_concat_big_undelayed_array(823-1 downto 810),
            core_1_concat_big_delayed_array(823-1 downto 810),
            core_1_concat_big_undelayed_array(836-1 downto 823),
            core_1_concat_big_delayed_array(836-1 downto 823),

        
            core_1_concat_small_undelayed_array(2356-1 downto 2343),
            core_1_concat_small_delayed_array(2356-1 downto 2343),
            core_1_concat_small_undelayed_array(2369-1 downto 2356),
            core_1_concat_small_delayed_array(2369-1 downto 2356),
            core_1_concat_small_undelayed_array(2382-1 downto 2369),
            core_1_concat_small_delayed_array(2382-1 downto 2369),
            core_1_concat_small_undelayed_array(2395-1 downto 2382),
            core_1_concat_small_delayed_array(2395-1 downto 2382),
            core_1_concat_small_undelayed_array(2408-1 downto 2395),
            core_1_concat_small_delayed_array(2408-1 downto 2395),
            core_1_concat_small_undelayed_array(2421-1 downto 2408),
            core_1_concat_small_delayed_array(2421-1 downto 2408),

            -- like this: yo_1
            signal_core_1_yo_28(0)
        );
    core_1_KPU_29 : entity work.conv1_core1_KPU29
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_1_kpu_29_input_1(0), --	sfix(3, -12)
            core_1_kpu_29_input_2(0), --	sfix(3, -12)
            core_1_kpu_29_input_3(0), --	sfix(2, -12)
            core_1_kpu_29_input_4(0), --	sfix(3, -12)
            core_1_kpu_29_input_5(0), --	sfix(0, -12)
            core_1_kpu_29_input_6(0), --	sfix(-2, -12)
            core_1_kpu_29_input_7(0), --	sfix(2, -12)
            core_1_kpu_29_input_8(0), --	sfix(3, -12)
            core_1_kpu_29_input_9(0), --	sfix(2, -12)

        
            core_1_concat_big_undelayed_array(854-1 downto 836),
            core_1_concat_big_delayed_array(854-1 downto 836),
            core_1_concat_big_undelayed_array(872-1 downto 854),
            core_1_concat_big_delayed_array(872-1 downto 854),

        
            core_1_concat_small_undelayed_array(2436-1 downto 2421),
            core_1_concat_small_delayed_array(2436-1 downto 2421),
            core_1_concat_small_undelayed_array(2453-1 downto 2436),
            core_1_concat_small_delayed_array(2453-1 downto 2436),
            core_1_concat_small_undelayed_array(2471-1 downto 2453),
            core_1_concat_small_delayed_array(2471-1 downto 2453),
            core_1_concat_small_undelayed_array(2489-1 downto 2471),
            core_1_concat_small_delayed_array(2489-1 downto 2471),
            core_1_concat_small_undelayed_array(2507-1 downto 2489),
            core_1_concat_small_delayed_array(2507-1 downto 2489),
            core_1_concat_small_undelayed_array(2525-1 downto 2507),
            core_1_concat_small_delayed_array(2525-1 downto 2507),

            -- like this: yo_1
            signal_core_1_yo_29(0)
        );
    core_1_KPU_30 : entity work.conv1_core1_KPU30
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_1_kpu_30_input_1(0), --	sfix(0, -12)
            core_1_kpu_30_input_2(0), --	sfix(-2, -12)
            core_1_kpu_30_input_3(0), --	sfix(-1, -12)
            core_1_kpu_30_input_4(0), --	sfix(-3, -12)
            core_1_kpu_30_input_5(0), --	sfix(-2, -12)
            core_1_kpu_30_input_6(0), --	sfix(-1, -12)
            core_1_kpu_30_input_7(0), --	sfix(-1, -12)
            core_1_kpu_30_input_8(0), --	sfix(0, -12)
            core_1_kpu_30_input_9(0), --	sfix(0, -12)

        
            core_1_concat_big_undelayed_array(886-1 downto 872),
            core_1_concat_big_delayed_array(886-1 downto 872),
            core_1_concat_big_undelayed_array(901-1 downto 886),
            core_1_concat_big_delayed_array(901-1 downto 886),

        
            core_1_concat_small_undelayed_array(2537-1 downto 2525),
            core_1_concat_small_delayed_array(2537-1 downto 2525),
            core_1_concat_small_undelayed_array(2551-1 downto 2537),
            core_1_concat_small_delayed_array(2551-1 downto 2537),
            core_1_concat_small_undelayed_array(2566-1 downto 2551),
            core_1_concat_small_delayed_array(2566-1 downto 2551),
            core_1_concat_small_undelayed_array(2581-1 downto 2566),
            core_1_concat_small_delayed_array(2581-1 downto 2566),
            core_1_concat_small_undelayed_array(2596-1 downto 2581),
            core_1_concat_small_delayed_array(2596-1 downto 2581),
            core_1_concat_small_undelayed_array(2611-1 downto 2596),
            core_1_concat_small_delayed_array(2611-1 downto 2596),

            -- like this: yo_1
            signal_core_1_yo_30(0)
        );
    core_1_KPU_31 : entity work.conv1_core1_KPU31
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_1_kpu_31_input_1(0), --	sfix(1, -12)
            core_1_kpu_31_input_2(0), --	sfix(1, -12)
            core_1_kpu_31_input_3(0), --	sfix(1, -12)
            core_1_kpu_31_input_4(0), --	sfix(1, -12)
            core_1_kpu_31_input_5(0), --	sfix(1, -12)
            core_1_kpu_31_input_6(0), --	sfix(1, -12)
            core_1_kpu_31_input_7(0), --	sfix(1, -12)
            core_1_kpu_31_input_8(0), --	sfix(1, -12)
            core_1_kpu_31_input_9(0), --	sfix(1, -12)

        
            core_1_concat_big_undelayed_array(914-1 downto 901),
            core_1_concat_big_delayed_array(914-1 downto 901),
            core_1_concat_big_undelayed_array(927-1 downto 914),
            core_1_concat_big_delayed_array(927-1 downto 914),

        
            core_1_concat_small_undelayed_array(2624-1 downto 2611),
            core_1_concat_small_delayed_array(2624-1 downto 2611),
            core_1_concat_small_undelayed_array(2637-1 downto 2624),
            core_1_concat_small_delayed_array(2637-1 downto 2624),
            core_1_concat_small_undelayed_array(2650-1 downto 2637),
            core_1_concat_small_delayed_array(2650-1 downto 2637),
            core_1_concat_small_undelayed_array(2663-1 downto 2650),
            core_1_concat_small_delayed_array(2663-1 downto 2650),
            core_1_concat_small_undelayed_array(2676-1 downto 2663),
            core_1_concat_small_delayed_array(2676-1 downto 2663),
            core_1_concat_small_undelayed_array(2689-1 downto 2676),
            core_1_concat_small_delayed_array(2689-1 downto 2676),

            -- like this: yo_1
            signal_core_1_yo_31(0)
        );
    core_1_KPU_32 : entity work.conv1_core1_KPU32
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_1_kpu_32_input_1(0), --	sfix(0, -12)
            core_1_kpu_32_input_2(0), --	sfix(2, -12)
            core_1_kpu_32_input_3(0), --	sfix(2, -12)
            core_1_kpu_32_input_4(0), --	sfix(-3, -12)
            core_1_kpu_32_input_5(0), --	sfix(-2, -12)
            core_1_kpu_32_input_6(0), --	sfix(-1, -12)
            core_1_kpu_32_input_7(0), --	sfix(1, -12)
            core_1_kpu_32_input_8(0), --	sfix(-3, -12)
            core_1_kpu_32_input_9(0), --	sfix(-3, -12)

        
            core_1_concat_big_undelayed_array(944-1 downto 927),
            core_1_concat_big_delayed_array(944-1 downto 927),
            core_1_concat_big_undelayed_array(961-1 downto 944),
            core_1_concat_big_delayed_array(961-1 downto 944),

        
            core_1_concat_small_undelayed_array(2701-1 downto 2689),
            core_1_concat_small_delayed_array(2701-1 downto 2689),
            core_1_concat_small_undelayed_array(2715-1 downto 2701),
            core_1_concat_small_delayed_array(2715-1 downto 2701),
            core_1_concat_small_undelayed_array(2732-1 downto 2715),
            core_1_concat_small_delayed_array(2732-1 downto 2715),
            core_1_concat_small_undelayed_array(2749-1 downto 2732),
            core_1_concat_small_delayed_array(2749-1 downto 2732),
            core_1_concat_small_undelayed_array(2766-1 downto 2749),
            core_1_concat_small_delayed_array(2766-1 downto 2749),
            core_1_concat_small_undelayed_array(2783-1 downto 2766),
            core_1_concat_small_delayed_array(2783-1 downto 2766),

            -- like this: yo_1
            signal_core_1_yo_32(0)
        );
  
    -- KPU big buffer delays
    -- Delay the single huge std_logic_vector
    core_2_concat_big_delay: entity work.BufferedDelay GENERIC MAP(WL => core_2_concat_big_undelayed_array'length, BL => BIG_BUFFER_DELAY_COUNTER_MAX )
        PORT MAP(reset, clk, buffer_enable_signal(2), big_buffer_delay_counter_signal(1), core_2_concat_big_undelayed_array, core_2_concat_big_delayed_array);


    -- KPU small buffer delays
    -- Delay the single huge std_logic_vector
    core_2_concat_small_delay: entity work.BufferedDelay GENERIC MAP(WL => core_2_concat_small_undelayed_array'length, BL => SMALL_BUFFER_DELAY_COUNTER_MAX )
        PORT MAP(reset, clk, buffer_enable_signal(2), small_buffer_delay_counter_signal(1), core_2_concat_small_undelayed_array, core_2_concat_small_delayed_array);
  

  
    core_2_KPU_1 : entity work.conv1_core2_KPU1
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_2_kpu_1_input_1(0), --	sfix(1, -12)
            core_2_kpu_1_input_2(0), --	sfix(1, -12)
            core_2_kpu_1_input_3(0), --	sfix(1, -12)
            core_2_kpu_1_input_4(0), --	sfix(1, -12)
            core_2_kpu_1_input_5(0), --	sfix(1, -12)
            core_2_kpu_1_input_6(0), --	sfix(1, -12)
            core_2_kpu_1_input_7(0), --	sfix(1, -12)
            core_2_kpu_1_input_8(0), --	sfix(1, -12)
            core_2_kpu_1_input_9(0), --	sfix(1, -12)

        
            core_2_concat_big_undelayed_array(13-1 downto 0),
            core_2_concat_big_delayed_array(13-1 downto 0),
            core_2_concat_big_undelayed_array(26-1 downto 13),
            core_2_concat_big_delayed_array(26-1 downto 13),

        
            core_2_concat_small_undelayed_array(13-1 downto 0),
            core_2_concat_small_delayed_array(13-1 downto 0),
            core_2_concat_small_undelayed_array(26-1 downto 13),
            core_2_concat_small_delayed_array(26-1 downto 13),
            core_2_concat_small_undelayed_array(39-1 downto 26),
            core_2_concat_small_delayed_array(39-1 downto 26),
            core_2_concat_small_undelayed_array(52-1 downto 39),
            core_2_concat_small_delayed_array(52-1 downto 39),
            core_2_concat_small_undelayed_array(65-1 downto 52),
            core_2_concat_small_delayed_array(65-1 downto 52),
            core_2_concat_small_undelayed_array(78-1 downto 65),
            core_2_concat_small_delayed_array(78-1 downto 65),

            -- like this: yo_1
            signal_core_2_yo_1(0)
        );
    core_2_KPU_2 : entity work.conv1_core2_KPU2
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_2_kpu_2_input_1(0), --	sfix(1, -12)
            core_2_kpu_2_input_2(0), --	sfix(1, -12)
            core_2_kpu_2_input_3(0), --	sfix(-1, -12)
            core_2_kpu_2_input_4(0), --	sfix(-3, -12)
            core_2_kpu_2_input_5(0), --	sfix(-1, -12)
            core_2_kpu_2_input_6(0), --	sfix(-2, -12)
            core_2_kpu_2_input_7(0), --	sfix(-3, -12)
            core_2_kpu_2_input_8(0), --	sfix(-2, -12)
            core_2_kpu_2_input_9(0), --	sfix(1, -12)

        
            core_2_concat_big_undelayed_array(41-1 downto 26),
            core_2_concat_big_delayed_array(41-1 downto 26),
            core_2_concat_big_undelayed_array(56-1 downto 41),
            core_2_concat_big_delayed_array(56-1 downto 41),

        
            core_2_concat_small_undelayed_array(91-1 downto 78),
            core_2_concat_small_delayed_array(91-1 downto 78),
            core_2_concat_small_undelayed_array(106-1 downto 91),
            core_2_concat_small_delayed_array(106-1 downto 91),
            core_2_concat_small_undelayed_array(121-1 downto 106),
            core_2_concat_small_delayed_array(121-1 downto 106),
            core_2_concat_small_undelayed_array(136-1 downto 121),
            core_2_concat_small_delayed_array(136-1 downto 121),
            core_2_concat_small_undelayed_array(151-1 downto 136),
            core_2_concat_small_delayed_array(151-1 downto 136),
            core_2_concat_small_undelayed_array(166-1 downto 151),
            core_2_concat_small_delayed_array(166-1 downto 151),

            -- like this: yo_1
            signal_core_2_yo_2(0)
        );
    core_2_KPU_3 : entity work.conv1_core2_KPU3
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_2_kpu_3_input_1(0), --	sfix(0, -12)
            core_2_kpu_3_input_2(0), --	sfix(1, -12)
            core_2_kpu_3_input_3(0), --	sfix(-2, -12)
            core_2_kpu_3_input_4(0), --	sfix(1, -12)
            core_2_kpu_3_input_5(0), --	sfix(1, -12)
            core_2_kpu_3_input_6(0), --	sfix(0, -12)
            core_2_kpu_3_input_7(0), --	sfix(0, -12)
            core_2_kpu_3_input_8(0), --	sfix(0, -12)
            core_2_kpu_3_input_9(0), --	sfix(-2, -12)

        
            core_2_concat_big_undelayed_array(72-1 downto 56),
            core_2_concat_big_delayed_array(72-1 downto 56),
            core_2_concat_big_undelayed_array(88-1 downto 72),
            core_2_concat_big_delayed_array(88-1 downto 72),

        
            core_2_concat_small_undelayed_array(178-1 downto 166),
            core_2_concat_small_delayed_array(178-1 downto 166),
            core_2_concat_small_undelayed_array(192-1 downto 178),
            core_2_concat_small_delayed_array(192-1 downto 178),
            core_2_concat_small_undelayed_array(208-1 downto 192),
            core_2_concat_small_delayed_array(208-1 downto 192),
            core_2_concat_small_undelayed_array(224-1 downto 208),
            core_2_concat_small_delayed_array(224-1 downto 208),
            core_2_concat_small_undelayed_array(240-1 downto 224),
            core_2_concat_small_delayed_array(240-1 downto 224),
            core_2_concat_small_undelayed_array(256-1 downto 240),
            core_2_concat_small_delayed_array(256-1 downto 240),

            -- like this: yo_1
            signal_core_2_yo_3(0)
        );
    core_2_KPU_4 : entity work.conv1_core2_KPU4
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_2_kpu_4_input_1(0), --	sfix(1, -12)
            core_2_kpu_4_input_2(0), --	sfix(1, -12)
            core_2_kpu_4_input_3(0), --	sfix(1, -12)
            core_2_kpu_4_input_4(0), --	sfix(1, -12)
            core_2_kpu_4_input_5(0), --	sfix(1, -12)
            core_2_kpu_4_input_6(0), --	sfix(1, -12)
            core_2_kpu_4_input_7(0), --	sfix(1, -12)
            core_2_kpu_4_input_8(0), --	sfix(1, -12)
            core_2_kpu_4_input_9(0), --	sfix(1, -12)

        
            core_2_concat_big_undelayed_array(101-1 downto 88),
            core_2_concat_big_delayed_array(101-1 downto 88),
            core_2_concat_big_undelayed_array(114-1 downto 101),
            core_2_concat_big_delayed_array(114-1 downto 101),

        
            core_2_concat_small_undelayed_array(269-1 downto 256),
            core_2_concat_small_delayed_array(269-1 downto 256),
            core_2_concat_small_undelayed_array(282-1 downto 269),
            core_2_concat_small_delayed_array(282-1 downto 269),
            core_2_concat_small_undelayed_array(295-1 downto 282),
            core_2_concat_small_delayed_array(295-1 downto 282),
            core_2_concat_small_undelayed_array(308-1 downto 295),
            core_2_concat_small_delayed_array(308-1 downto 295),
            core_2_concat_small_undelayed_array(321-1 downto 308),
            core_2_concat_small_delayed_array(321-1 downto 308),
            core_2_concat_small_undelayed_array(334-1 downto 321),
            core_2_concat_small_delayed_array(334-1 downto 321),

            -- like this: yo_1
            signal_core_2_yo_4(0)
        );
    core_2_KPU_5 : entity work.conv1_core2_KPU5
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_2_kpu_5_input_1(0), --	sfix(-2, -12)
            core_2_kpu_5_input_2(0), --	sfix(0, -12)
            core_2_kpu_5_input_3(0), --	sfix(3, -12)
            core_2_kpu_5_input_4(0), --	sfix(-2, -12)
            core_2_kpu_5_input_5(0), --	sfix(4, -12)
            core_2_kpu_5_input_6(0), --	sfix(2, -12)
            core_2_kpu_5_input_7(0), --	sfix(1, -12)
            core_2_kpu_5_input_8(0), --	sfix(2, -12)
            core_2_kpu_5_input_9(0), --	sfix(1, -12)

        
            core_2_concat_big_undelayed_array(130-1 downto 114),
            core_2_concat_big_delayed_array(130-1 downto 114),
            core_2_concat_big_undelayed_array(149-1 downto 130),
            core_2_concat_big_delayed_array(149-1 downto 130),

        
            core_2_concat_small_undelayed_array(344-1 downto 334),
            core_2_concat_small_delayed_array(344-1 downto 334),
            core_2_concat_small_undelayed_array(356-1 downto 344),
            core_2_concat_small_delayed_array(356-1 downto 344),
            core_2_concat_small_undelayed_array(374-1 downto 356),
            core_2_concat_small_delayed_array(374-1 downto 356),
            core_2_concat_small_undelayed_array(392-1 downto 374),
            core_2_concat_small_delayed_array(392-1 downto 374),
            core_2_concat_small_undelayed_array(411-1 downto 392),
            core_2_concat_small_delayed_array(411-1 downto 392),
            core_2_concat_small_undelayed_array(430-1 downto 411),
            core_2_concat_small_delayed_array(430-1 downto 411),

            -- like this: yo_1
            signal_core_2_yo_5(0)
        );
    core_2_KPU_6 : entity work.conv1_core2_KPU6
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_2_kpu_6_input_1(0), --	sfix(-3, -12)
            core_2_kpu_6_input_2(0), --	sfix(1, -12)
            core_2_kpu_6_input_3(0), --	sfix(0, -12)
            core_2_kpu_6_input_4(0), --	sfix(0, -12)
            core_2_kpu_6_input_5(0), --	sfix(2, -12)
            core_2_kpu_6_input_6(0), --	sfix(1, -12)
            core_2_kpu_6_input_7(0), --	sfix(-2, -12)
            core_2_kpu_6_input_8(0), --	sfix(1, -12)
            core_2_kpu_6_input_9(0), --	sfix(0, -12)

        
            core_2_concat_big_undelayed_array(164-1 downto 149),
            core_2_concat_big_delayed_array(164-1 downto 149),
            core_2_concat_big_undelayed_array(181-1 downto 164),
            core_2_concat_big_delayed_array(181-1 downto 164),

        
            core_2_concat_small_undelayed_array(439-1 downto 430),
            core_2_concat_small_delayed_array(439-1 downto 430),
            core_2_concat_small_undelayed_array(452-1 downto 439),
            core_2_concat_small_delayed_array(452-1 downto 439),
            core_2_concat_small_undelayed_array(468-1 downto 452),
            core_2_concat_small_delayed_array(468-1 downto 452),
            core_2_concat_small_undelayed_array(484-1 downto 468),
            core_2_concat_small_delayed_array(484-1 downto 468),
            core_2_concat_small_undelayed_array(501-1 downto 484),
            core_2_concat_small_delayed_array(501-1 downto 484),
            core_2_concat_small_undelayed_array(518-1 downto 501),
            core_2_concat_small_delayed_array(518-1 downto 501),

            -- like this: yo_1
            signal_core_2_yo_6(0)
        );
    core_2_KPU_7 : entity work.conv1_core2_KPU7
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_2_kpu_7_input_1(0), --	sfix(-1, -12)
            core_2_kpu_7_input_2(0), --	sfix(1, -12)
            core_2_kpu_7_input_3(0), --	sfix(0, -12)
            core_2_kpu_7_input_4(0), --	sfix(-2, -12)
            core_2_kpu_7_input_5(0), --	sfix(1, -12)
            core_2_kpu_7_input_6(0), --	sfix(-1, -12)
            core_2_kpu_7_input_7(0), --	sfix(-1, -12)
            core_2_kpu_7_input_8(0), --	sfix(-2, -12)
            core_2_kpu_7_input_9(0), --	sfix(1, -12)

        
            core_2_concat_big_undelayed_array(196-1 downto 181),
            core_2_concat_big_delayed_array(196-1 downto 181),
            core_2_concat_big_undelayed_array(212-1 downto 196),
            core_2_concat_big_delayed_array(212-1 downto 196),

        
            core_2_concat_small_undelayed_array(529-1 downto 518),
            core_2_concat_small_delayed_array(529-1 downto 518),
            core_2_concat_small_undelayed_array(542-1 downto 529),
            core_2_concat_small_delayed_array(542-1 downto 529),
            core_2_concat_small_undelayed_array(558-1 downto 542),
            core_2_concat_small_delayed_array(558-1 downto 542),
            core_2_concat_small_undelayed_array(574-1 downto 558),
            core_2_concat_small_delayed_array(574-1 downto 558),
            core_2_concat_small_undelayed_array(590-1 downto 574),
            core_2_concat_small_delayed_array(590-1 downto 574),
            core_2_concat_small_undelayed_array(606-1 downto 590),
            core_2_concat_small_delayed_array(606-1 downto 590),

            -- like this: yo_1
            signal_core_2_yo_7(0)
        );
    core_2_KPU_8 : entity work.conv1_core2_KPU8
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_2_kpu_8_input_1(0), --	sfix(-3, -12)
            core_2_kpu_8_input_2(0), --	sfix(-2, -12)
            core_2_kpu_8_input_3(0), --	sfix(-2, -12)
            core_2_kpu_8_input_4(0), --	sfix(-3, -12)
            core_2_kpu_8_input_5(0), --	sfix(-2, -12)
            core_2_kpu_8_input_6(0), --	sfix(-1, -12)
            core_2_kpu_8_input_7(0), --	sfix(-3, -12)
            core_2_kpu_8_input_8(0), --	sfix(-1, -12)
            core_2_kpu_8_input_9(0), --	sfix(-2, -12)

        
            core_2_concat_big_undelayed_array(225-1 downto 212),
            core_2_concat_big_delayed_array(225-1 downto 212),
            core_2_concat_big_undelayed_array(239-1 downto 225),
            core_2_concat_big_delayed_array(239-1 downto 225),

        
            core_2_concat_small_undelayed_array(615-1 downto 606),
            core_2_concat_small_delayed_array(615-1 downto 606),
            core_2_concat_small_undelayed_array(626-1 downto 615),
            core_2_concat_small_delayed_array(626-1 downto 615),
            core_2_concat_small_undelayed_array(640-1 downto 626),
            core_2_concat_small_delayed_array(640-1 downto 626),
            core_2_concat_small_undelayed_array(654-1 downto 640),
            core_2_concat_small_delayed_array(654-1 downto 640),
            core_2_concat_small_undelayed_array(668-1 downto 654),
            core_2_concat_small_delayed_array(668-1 downto 654),
            core_2_concat_small_undelayed_array(682-1 downto 668),
            core_2_concat_small_delayed_array(682-1 downto 668),

            -- like this: yo_1
            signal_core_2_yo_8(0)
        );
    core_2_KPU_9 : entity work.conv1_core2_KPU9
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_2_kpu_9_input_1(0), --	sfix(1, -12)
            core_2_kpu_9_input_2(0), --	sfix(1, -12)
            core_2_kpu_9_input_3(0), --	sfix(1, -12)
            core_2_kpu_9_input_4(0), --	sfix(1, -12)
            core_2_kpu_9_input_5(0), --	sfix(1, -12)
            core_2_kpu_9_input_6(0), --	sfix(1, -12)
            core_2_kpu_9_input_7(0), --	sfix(1, -12)
            core_2_kpu_9_input_8(0), --	sfix(1, -12)
            core_2_kpu_9_input_9(0), --	sfix(1, -12)

        
            core_2_concat_big_undelayed_array(252-1 downto 239),
            core_2_concat_big_delayed_array(252-1 downto 239),
            core_2_concat_big_undelayed_array(265-1 downto 252),
            core_2_concat_big_delayed_array(265-1 downto 252),

        
            core_2_concat_small_undelayed_array(695-1 downto 682),
            core_2_concat_small_delayed_array(695-1 downto 682),
            core_2_concat_small_undelayed_array(708-1 downto 695),
            core_2_concat_small_delayed_array(708-1 downto 695),
            core_2_concat_small_undelayed_array(721-1 downto 708),
            core_2_concat_small_delayed_array(721-1 downto 708),
            core_2_concat_small_undelayed_array(734-1 downto 721),
            core_2_concat_small_delayed_array(734-1 downto 721),
            core_2_concat_small_undelayed_array(747-1 downto 734),
            core_2_concat_small_delayed_array(747-1 downto 734),
            core_2_concat_small_undelayed_array(760-1 downto 747),
            core_2_concat_small_delayed_array(760-1 downto 747),

            -- like this: yo_1
            signal_core_2_yo_9(0)
        );
    core_2_KPU_10 : entity work.conv1_core2_KPU10
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_2_kpu_10_input_1(0), --	sfix(1, -12)
            core_2_kpu_10_input_2(0), --	sfix(1, -12)
            core_2_kpu_10_input_3(0), --	sfix(1, -12)
            core_2_kpu_10_input_4(0), --	sfix(1, -12)
            core_2_kpu_10_input_5(0), --	sfix(1, -12)
            core_2_kpu_10_input_6(0), --	sfix(1, -12)
            core_2_kpu_10_input_7(0), --	sfix(1, -12)
            core_2_kpu_10_input_8(0), --	sfix(1, -12)
            core_2_kpu_10_input_9(0), --	sfix(1, -12)

        
            core_2_concat_big_undelayed_array(278-1 downto 265),
            core_2_concat_big_delayed_array(278-1 downto 265),
            core_2_concat_big_undelayed_array(291-1 downto 278),
            core_2_concat_big_delayed_array(291-1 downto 278),

        
            core_2_concat_small_undelayed_array(773-1 downto 760),
            core_2_concat_small_delayed_array(773-1 downto 760),
            core_2_concat_small_undelayed_array(786-1 downto 773),
            core_2_concat_small_delayed_array(786-1 downto 773),
            core_2_concat_small_undelayed_array(799-1 downto 786),
            core_2_concat_small_delayed_array(799-1 downto 786),
            core_2_concat_small_undelayed_array(812-1 downto 799),
            core_2_concat_small_delayed_array(812-1 downto 799),
            core_2_concat_small_undelayed_array(825-1 downto 812),
            core_2_concat_small_delayed_array(825-1 downto 812),
            core_2_concat_small_undelayed_array(838-1 downto 825),
            core_2_concat_small_delayed_array(838-1 downto 825),

            -- like this: yo_1
            signal_core_2_yo_10(0)
        );
    core_2_KPU_11 : entity work.conv1_core2_KPU11
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_2_kpu_11_input_1(0), --	sfix(1, -12)
            core_2_kpu_11_input_2(0), --	sfix(1, -12)
            core_2_kpu_11_input_3(0), --	sfix(1, -12)
            core_2_kpu_11_input_4(0), --	sfix(1, -12)
            core_2_kpu_11_input_5(0), --	sfix(1, -12)
            core_2_kpu_11_input_6(0), --	sfix(1, -12)
            core_2_kpu_11_input_7(0), --	sfix(1, -12)
            core_2_kpu_11_input_8(0), --	sfix(1, -12)
            core_2_kpu_11_input_9(0), --	sfix(1, -12)

        
            core_2_concat_big_undelayed_array(304-1 downto 291),
            core_2_concat_big_delayed_array(304-1 downto 291),
            core_2_concat_big_undelayed_array(317-1 downto 304),
            core_2_concat_big_delayed_array(317-1 downto 304),

        
            core_2_concat_small_undelayed_array(851-1 downto 838),
            core_2_concat_small_delayed_array(851-1 downto 838),
            core_2_concat_small_undelayed_array(864-1 downto 851),
            core_2_concat_small_delayed_array(864-1 downto 851),
            core_2_concat_small_undelayed_array(877-1 downto 864),
            core_2_concat_small_delayed_array(877-1 downto 864),
            core_2_concat_small_undelayed_array(890-1 downto 877),
            core_2_concat_small_delayed_array(890-1 downto 877),
            core_2_concat_small_undelayed_array(903-1 downto 890),
            core_2_concat_small_delayed_array(903-1 downto 890),
            core_2_concat_small_undelayed_array(916-1 downto 903),
            core_2_concat_small_delayed_array(916-1 downto 903),

            -- like this: yo_1
            signal_core_2_yo_11(0)
        );
    core_2_KPU_12 : entity work.conv1_core2_KPU12
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_2_kpu_12_input_1(0), --	sfix(4, -12)
            core_2_kpu_12_input_2(0), --	sfix(3, -12)
            core_2_kpu_12_input_3(0), --	sfix(0, -12)
            core_2_kpu_12_input_4(0), --	sfix(3, -12)
            core_2_kpu_12_input_5(0), --	sfix(3, -12)
            core_2_kpu_12_input_6(0), --	sfix(0, -12)
            core_2_kpu_12_input_7(0), --	sfix(0, -12)
            core_2_kpu_12_input_8(0), --	sfix(0, -12)
            core_2_kpu_12_input_9(0), --	sfix(0, -12)

        
            core_2_concat_big_undelayed_array(335-1 downto 317),
            core_2_concat_big_delayed_array(335-1 downto 317),
            core_2_concat_big_undelayed_array(354-1 downto 335),
            core_2_concat_big_delayed_array(354-1 downto 335),

        
            core_2_concat_small_undelayed_array(932-1 downto 916),
            core_2_concat_small_delayed_array(932-1 downto 916),
            core_2_concat_small_undelayed_array(950-1 downto 932),
            core_2_concat_small_delayed_array(950-1 downto 932),
            core_2_concat_small_undelayed_array(969-1 downto 950),
            core_2_concat_small_delayed_array(969-1 downto 950),
            core_2_concat_small_undelayed_array(988-1 downto 969),
            core_2_concat_small_delayed_array(988-1 downto 969),
            core_2_concat_small_undelayed_array(1007-1 downto 988),
            core_2_concat_small_delayed_array(1007-1 downto 988),
            core_2_concat_small_undelayed_array(1026-1 downto 1007),
            core_2_concat_small_delayed_array(1026-1 downto 1007),

            -- like this: yo_1
            signal_core_2_yo_12(0)
        );
    core_2_KPU_13 : entity work.conv1_core2_KPU13
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_2_kpu_13_input_1(0), --	sfix(0, -12)
            core_2_kpu_13_input_2(0), --	sfix(0, -12)
            core_2_kpu_13_input_3(0), --	sfix(1, -12)
            core_2_kpu_13_input_4(0), --	sfix(-2, -12)
            core_2_kpu_13_input_5(0), --	sfix(-2, -12)
            core_2_kpu_13_input_6(0), --	sfix(-2, -12)
            core_2_kpu_13_input_7(0), --	sfix(-1, -12)
            core_2_kpu_13_input_8(0), --	sfix(1, -12)
            core_2_kpu_13_input_9(0), --	sfix(-3, -12)

        
            core_2_concat_big_undelayed_array(369-1 downto 354),
            core_2_concat_big_delayed_array(369-1 downto 354),
            core_2_concat_big_undelayed_array(384-1 downto 369),
            core_2_concat_big_delayed_array(384-1 downto 369),

        
            core_2_concat_small_undelayed_array(1038-1 downto 1026),
            core_2_concat_small_delayed_array(1038-1 downto 1026),
            core_2_concat_small_undelayed_array(1052-1 downto 1038),
            core_2_concat_small_delayed_array(1052-1 downto 1038),
            core_2_concat_small_undelayed_array(1067-1 downto 1052),
            core_2_concat_small_delayed_array(1067-1 downto 1052),
            core_2_concat_small_undelayed_array(1082-1 downto 1067),
            core_2_concat_small_delayed_array(1082-1 downto 1067),
            core_2_concat_small_undelayed_array(1097-1 downto 1082),
            core_2_concat_small_delayed_array(1097-1 downto 1082),
            core_2_concat_small_undelayed_array(1112-1 downto 1097),
            core_2_concat_small_delayed_array(1112-1 downto 1097),

            -- like this: yo_1
            signal_core_2_yo_13(0)
        );
    core_2_KPU_14 : entity work.conv1_core2_KPU14
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_2_kpu_14_input_1(0), --	sfix(1, -12)
            core_2_kpu_14_input_2(0), --	sfix(1, -12)
            core_2_kpu_14_input_3(0), --	sfix(0, -12)
            core_2_kpu_14_input_4(0), --	sfix(2, -12)
            core_2_kpu_14_input_5(0), --	sfix(1, -12)
            core_2_kpu_14_input_6(0), --	sfix(-1, -12)
            core_2_kpu_14_input_7(0), --	sfix(1, -12)
            core_2_kpu_14_input_8(0), --	sfix(1, -12)
            core_2_kpu_14_input_9(0), --	sfix(-3, -12)

        
            core_2_concat_big_undelayed_array(400-1 downto 384),
            core_2_concat_big_delayed_array(400-1 downto 384),
            core_2_concat_big_undelayed_array(417-1 downto 400),
            core_2_concat_big_delayed_array(417-1 downto 400),

        
            core_2_concat_small_undelayed_array(1125-1 downto 1112),
            core_2_concat_small_delayed_array(1125-1 downto 1112),
            core_2_concat_small_undelayed_array(1140-1 downto 1125),
            core_2_concat_small_delayed_array(1140-1 downto 1125),
            core_2_concat_small_undelayed_array(1157-1 downto 1140),
            core_2_concat_small_delayed_array(1157-1 downto 1140),
            core_2_concat_small_undelayed_array(1174-1 downto 1157),
            core_2_concat_small_delayed_array(1174-1 downto 1157),
            core_2_concat_small_undelayed_array(1191-1 downto 1174),
            core_2_concat_small_delayed_array(1191-1 downto 1174),
            core_2_concat_small_undelayed_array(1208-1 downto 1191),
            core_2_concat_small_delayed_array(1208-1 downto 1191),

            -- like this: yo_1
            signal_core_2_yo_14(0)
        );
    core_2_KPU_15 : entity work.conv1_core2_KPU15
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_2_kpu_15_input_1(0), --	sfix(-3, -12)
            core_2_kpu_15_input_2(0), --	sfix(-3, -12)
            core_2_kpu_15_input_3(0), --	sfix(-3, -12)
            core_2_kpu_15_input_4(0), --	sfix(-3, -12)
            core_2_kpu_15_input_5(0), --	sfix(-3, -12)
            core_2_kpu_15_input_6(0), --	sfix(-3, -12)
            core_2_kpu_15_input_7(0), --	sfix(1, -12)
            core_2_kpu_15_input_8(0), --	sfix(1, -12)
            core_2_kpu_15_input_9(0), --	sfix(1, -12)

        
            core_2_concat_big_undelayed_array(429-1 downto 417),
            core_2_concat_big_delayed_array(429-1 downto 417),
            core_2_concat_big_undelayed_array(442-1 downto 429),
            core_2_concat_big_delayed_array(442-1 downto 429),

        
            core_2_concat_small_undelayed_array(1217-1 downto 1208),
            core_2_concat_small_delayed_array(1217-1 downto 1208),
            core_2_concat_small_undelayed_array(1228-1 downto 1217),
            core_2_concat_small_delayed_array(1228-1 downto 1217),
            core_2_concat_small_undelayed_array(1241-1 downto 1228),
            core_2_concat_small_delayed_array(1241-1 downto 1228),
            core_2_concat_small_undelayed_array(1254-1 downto 1241),
            core_2_concat_small_delayed_array(1254-1 downto 1241),
            core_2_concat_small_undelayed_array(1267-1 downto 1254),
            core_2_concat_small_delayed_array(1267-1 downto 1254),
            core_2_concat_small_undelayed_array(1280-1 downto 1267),
            core_2_concat_small_delayed_array(1280-1 downto 1267),

            -- like this: yo_1
            signal_core_2_yo_15(0)
        );
    core_2_KPU_16 : entity work.conv1_core2_KPU16
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_2_kpu_16_input_1(0), --	sfix(1, -12)
            core_2_kpu_16_input_2(0), --	sfix(1, -12)
            core_2_kpu_16_input_3(0), --	sfix(1, -12)
            core_2_kpu_16_input_4(0), --	sfix(3, -12)
            core_2_kpu_16_input_5(0), --	sfix(3, -12)
            core_2_kpu_16_input_6(0), --	sfix(0, -12)
            core_2_kpu_16_input_7(0), --	sfix(0, -12)
            core_2_kpu_16_input_8(0), --	sfix(1, -12)
            core_2_kpu_16_input_9(0), --	sfix(-1, -12)

        
            core_2_concat_big_undelayed_array(458-1 downto 442),
            core_2_concat_big_delayed_array(458-1 downto 442),
            core_2_concat_big_undelayed_array(475-1 downto 458),
            core_2_concat_big_delayed_array(475-1 downto 458),

        
            core_2_concat_small_undelayed_array(1293-1 downto 1280),
            core_2_concat_small_delayed_array(1293-1 downto 1280),
            core_2_concat_small_undelayed_array(1308-1 downto 1293),
            core_2_concat_small_delayed_array(1308-1 downto 1293),
            core_2_concat_small_undelayed_array(1324-1 downto 1308),
            core_2_concat_small_delayed_array(1324-1 downto 1308),
            core_2_concat_small_undelayed_array(1341-1 downto 1324),
            core_2_concat_small_delayed_array(1341-1 downto 1324),
            core_2_concat_small_undelayed_array(1358-1 downto 1341),
            core_2_concat_small_delayed_array(1358-1 downto 1341),
            core_2_concat_small_undelayed_array(1375-1 downto 1358),
            core_2_concat_small_delayed_array(1375-1 downto 1358),

            -- like this: yo_1
            signal_core_2_yo_16(0)
        );
    core_2_KPU_17 : entity work.conv1_core2_KPU17
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_2_kpu_17_input_1(0), --	sfix(0, -12)
            core_2_kpu_17_input_2(0), --	sfix(3, -12)
            core_2_kpu_17_input_3(0), --	sfix(-1, -12)
            core_2_kpu_17_input_4(0), --	sfix(0, -12)
            core_2_kpu_17_input_5(0), --	sfix(2, -12)
            core_2_kpu_17_input_6(0), --	sfix(-3, -12)
            core_2_kpu_17_input_7(0), --	sfix(-1, -12)
            core_2_kpu_17_input_8(0), --	sfix(2, -12)
            core_2_kpu_17_input_9(0), --	sfix(1, -12)

        
            core_2_concat_big_undelayed_array(492-1 downto 475),
            core_2_concat_big_delayed_array(492-1 downto 475),
            core_2_concat_big_undelayed_array(509-1 downto 492),
            core_2_concat_big_delayed_array(509-1 downto 492),

        
            core_2_concat_small_undelayed_array(1387-1 downto 1375),
            core_2_concat_small_delayed_array(1387-1 downto 1375),
            core_2_concat_small_undelayed_array(1402-1 downto 1387),
            core_2_concat_small_delayed_array(1402-1 downto 1387),
            core_2_concat_small_undelayed_array(1419-1 downto 1402),
            core_2_concat_small_delayed_array(1419-1 downto 1402),
            core_2_concat_small_undelayed_array(1436-1 downto 1419),
            core_2_concat_small_delayed_array(1436-1 downto 1419),
            core_2_concat_small_undelayed_array(1453-1 downto 1436),
            core_2_concat_small_delayed_array(1453-1 downto 1436),
            core_2_concat_small_undelayed_array(1470-1 downto 1453),
            core_2_concat_small_delayed_array(1470-1 downto 1453),

            -- like this: yo_1
            signal_core_2_yo_17(0)
        );
    core_2_KPU_18 : entity work.conv1_core2_KPU18
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_2_kpu_18_input_1(0), --	sfix(-3, -12)
            core_2_kpu_18_input_2(0), --	sfix(0, -12)
            core_2_kpu_18_input_3(0), --	sfix(-1, -12)
            core_2_kpu_18_input_4(0), --	sfix(-1, -12)
            core_2_kpu_18_input_5(0), --	sfix(0, -12)
            core_2_kpu_18_input_6(0), --	sfix(-1, -12)
            core_2_kpu_18_input_7(0), --	sfix(-1, -12)
            core_2_kpu_18_input_8(0), --	sfix(-1, -12)
            core_2_kpu_18_input_9(0), --	sfix(-1, -12)

        
            core_2_concat_big_undelayed_array(523-1 downto 509),
            core_2_concat_big_delayed_array(523-1 downto 509),
            core_2_concat_big_undelayed_array(538-1 downto 523),
            core_2_concat_big_delayed_array(538-1 downto 523),

        
            core_2_concat_small_undelayed_array(1479-1 downto 1470),
            core_2_concat_small_delayed_array(1479-1 downto 1470),
            core_2_concat_small_undelayed_array(1491-1 downto 1479),
            core_2_concat_small_delayed_array(1491-1 downto 1479),
            core_2_concat_small_undelayed_array(1506-1 downto 1491),
            core_2_concat_small_delayed_array(1506-1 downto 1491),
            core_2_concat_small_undelayed_array(1521-1 downto 1506),
            core_2_concat_small_delayed_array(1521-1 downto 1506),
            core_2_concat_small_undelayed_array(1536-1 downto 1521),
            core_2_concat_small_delayed_array(1536-1 downto 1521),
            core_2_concat_small_undelayed_array(1551-1 downto 1536),
            core_2_concat_small_delayed_array(1551-1 downto 1536),

            -- like this: yo_1
            signal_core_2_yo_18(0)
        );
    core_2_KPU_19 : entity work.conv1_core2_KPU19
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_2_kpu_19_input_1(0), --	sfix(-3, -12)
            core_2_kpu_19_input_2(0), --	sfix(0, -12)
            core_2_kpu_19_input_3(0), --	sfix(1, -12)
            core_2_kpu_19_input_4(0), --	sfix(0, -12)
            core_2_kpu_19_input_5(0), --	sfix(1, -12)
            core_2_kpu_19_input_6(0), --	sfix(-2, -12)
            core_2_kpu_19_input_7(0), --	sfix(-1, -12)
            core_2_kpu_19_input_8(0), --	sfix(0, -12)
            core_2_kpu_19_input_9(0), --	sfix(0, -12)

        
            core_2_concat_big_undelayed_array(552-1 downto 538),
            core_2_concat_big_delayed_array(552-1 downto 538),
            core_2_concat_big_undelayed_array(568-1 downto 552),
            core_2_concat_big_delayed_array(568-1 downto 552),

        
            core_2_concat_small_undelayed_array(1560-1 downto 1551),
            core_2_concat_small_delayed_array(1560-1 downto 1551),
            core_2_concat_small_undelayed_array(1572-1 downto 1560),
            core_2_concat_small_delayed_array(1572-1 downto 1560),
            core_2_concat_small_undelayed_array(1588-1 downto 1572),
            core_2_concat_small_delayed_array(1588-1 downto 1572),
            core_2_concat_small_undelayed_array(1604-1 downto 1588),
            core_2_concat_small_delayed_array(1604-1 downto 1588),
            core_2_concat_small_undelayed_array(1620-1 downto 1604),
            core_2_concat_small_delayed_array(1620-1 downto 1604),
            core_2_concat_small_undelayed_array(1636-1 downto 1620),
            core_2_concat_small_delayed_array(1636-1 downto 1620),

            -- like this: yo_1
            signal_core_2_yo_19(0)
        );
    core_2_KPU_20 : entity work.conv1_core2_KPU20
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_2_kpu_20_input_1(0), --	sfix(0, -12)
            core_2_kpu_20_input_2(0), --	sfix(1, -12)
            core_2_kpu_20_input_3(0), --	sfix(-2, -12)
            core_2_kpu_20_input_4(0), --	sfix(2, -12)
            core_2_kpu_20_input_5(0), --	sfix(2, -12)
            core_2_kpu_20_input_6(0), --	sfix(0, -12)
            core_2_kpu_20_input_7(0), --	sfix(1, -12)
            core_2_kpu_20_input_8(0), --	sfix(2, -12)
            core_2_kpu_20_input_9(0), --	sfix(1, -12)

        
            core_2_concat_big_undelayed_array(583-1 downto 568),
            core_2_concat_big_delayed_array(583-1 downto 568),
            core_2_concat_big_undelayed_array(600-1 downto 583),
            core_2_concat_big_delayed_array(600-1 downto 583),

        
            core_2_concat_small_undelayed_array(1648-1 downto 1636),
            core_2_concat_small_delayed_array(1648-1 downto 1636),
            core_2_concat_small_undelayed_array(1662-1 downto 1648),
            core_2_concat_small_delayed_array(1662-1 downto 1648),
            core_2_concat_small_undelayed_array(1678-1 downto 1662),
            core_2_concat_small_delayed_array(1678-1 downto 1662),
            core_2_concat_small_undelayed_array(1695-1 downto 1678),
            core_2_concat_small_delayed_array(1695-1 downto 1678),
            core_2_concat_small_undelayed_array(1712-1 downto 1695),
            core_2_concat_small_delayed_array(1712-1 downto 1695),
            core_2_concat_small_undelayed_array(1729-1 downto 1712),
            core_2_concat_small_delayed_array(1729-1 downto 1712),

            -- like this: yo_1
            signal_core_2_yo_20(0)
        );
    core_2_KPU_21 : entity work.conv1_core2_KPU21
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_2_kpu_21_input_1(0), --	sfix(1, -12)
            core_2_kpu_21_input_2(0), --	sfix(1, -12)
            core_2_kpu_21_input_3(0), --	sfix(1, -12)
            core_2_kpu_21_input_4(0), --	sfix(1, -12)
            core_2_kpu_21_input_5(0), --	sfix(1, -12)
            core_2_kpu_21_input_6(0), --	sfix(1, -12)
            core_2_kpu_21_input_7(0), --	sfix(1, -12)
            core_2_kpu_21_input_8(0), --	sfix(1, -12)
            core_2_kpu_21_input_9(0), --	sfix(1, -12)

        
            core_2_concat_big_undelayed_array(613-1 downto 600),
            core_2_concat_big_delayed_array(613-1 downto 600),
            core_2_concat_big_undelayed_array(626-1 downto 613),
            core_2_concat_big_delayed_array(626-1 downto 613),

        
            core_2_concat_small_undelayed_array(1742-1 downto 1729),
            core_2_concat_small_delayed_array(1742-1 downto 1729),
            core_2_concat_small_undelayed_array(1755-1 downto 1742),
            core_2_concat_small_delayed_array(1755-1 downto 1742),
            core_2_concat_small_undelayed_array(1768-1 downto 1755),
            core_2_concat_small_delayed_array(1768-1 downto 1755),
            core_2_concat_small_undelayed_array(1781-1 downto 1768),
            core_2_concat_small_delayed_array(1781-1 downto 1768),
            core_2_concat_small_undelayed_array(1794-1 downto 1781),
            core_2_concat_small_delayed_array(1794-1 downto 1781),
            core_2_concat_small_undelayed_array(1807-1 downto 1794),
            core_2_concat_small_delayed_array(1807-1 downto 1794),

            -- like this: yo_1
            signal_core_2_yo_21(0)
        );
    core_2_KPU_22 : entity work.conv1_core2_KPU22
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_2_kpu_22_input_1(0), --	sfix(2, -12)
            core_2_kpu_22_input_2(0), --	sfix(2, -12)
            core_2_kpu_22_input_3(0), --	sfix(2, -12)
            core_2_kpu_22_input_4(0), --	sfix(3, -12)
            core_2_kpu_22_input_5(0), --	sfix(2, -12)
            core_2_kpu_22_input_6(0), --	sfix(3, -12)
            core_2_kpu_22_input_7(0), --	sfix(2, -12)
            core_2_kpu_22_input_8(0), --	sfix(-2, -12)
            core_2_kpu_22_input_9(0), --	sfix(2, -12)

        
            core_2_concat_big_undelayed_array(643-1 downto 626),
            core_2_concat_big_delayed_array(643-1 downto 626),
            core_2_concat_big_undelayed_array(661-1 downto 643),
            core_2_concat_big_delayed_array(661-1 downto 643),

        
            core_2_concat_small_undelayed_array(1821-1 downto 1807),
            core_2_concat_small_delayed_array(1821-1 downto 1807),
            core_2_concat_small_undelayed_array(1837-1 downto 1821),
            core_2_concat_small_delayed_array(1837-1 downto 1821),
            core_2_concat_small_undelayed_array(1855-1 downto 1837),
            core_2_concat_small_delayed_array(1855-1 downto 1837),
            core_2_concat_small_undelayed_array(1873-1 downto 1855),
            core_2_concat_small_delayed_array(1873-1 downto 1855),
            core_2_concat_small_undelayed_array(1891-1 downto 1873),
            core_2_concat_small_delayed_array(1891-1 downto 1873),
            core_2_concat_small_undelayed_array(1909-1 downto 1891),
            core_2_concat_small_delayed_array(1909-1 downto 1891),

            -- like this: yo_1
            signal_core_2_yo_22(0)
        );
    core_2_KPU_23 : entity work.conv1_core2_KPU23
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_2_kpu_23_input_1(0), --	sfix(1, -12)
            core_2_kpu_23_input_2(0), --	sfix(1, -12)
            core_2_kpu_23_input_3(0), --	sfix(1, -12)
            core_2_kpu_23_input_4(0), --	sfix(1, -12)
            core_2_kpu_23_input_5(0), --	sfix(1, -12)
            core_2_kpu_23_input_6(0), --	sfix(1, -12)
            core_2_kpu_23_input_7(0), --	sfix(1, -12)
            core_2_kpu_23_input_8(0), --	sfix(1, -12)
            core_2_kpu_23_input_9(0), --	sfix(1, -12)

        
            core_2_concat_big_undelayed_array(674-1 downto 661),
            core_2_concat_big_delayed_array(674-1 downto 661),
            core_2_concat_big_undelayed_array(687-1 downto 674),
            core_2_concat_big_delayed_array(687-1 downto 674),

        
            core_2_concat_small_undelayed_array(1922-1 downto 1909),
            core_2_concat_small_delayed_array(1922-1 downto 1909),
            core_2_concat_small_undelayed_array(1935-1 downto 1922),
            core_2_concat_small_delayed_array(1935-1 downto 1922),
            core_2_concat_small_undelayed_array(1948-1 downto 1935),
            core_2_concat_small_delayed_array(1948-1 downto 1935),
            core_2_concat_small_undelayed_array(1961-1 downto 1948),
            core_2_concat_small_delayed_array(1961-1 downto 1948),
            core_2_concat_small_undelayed_array(1974-1 downto 1961),
            core_2_concat_small_delayed_array(1974-1 downto 1961),
            core_2_concat_small_undelayed_array(1987-1 downto 1974),
            core_2_concat_small_delayed_array(1987-1 downto 1974),

            -- like this: yo_1
            signal_core_2_yo_23(0)
        );
    core_2_KPU_24 : entity work.conv1_core2_KPU24
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_2_kpu_24_input_1(0), --	sfix(2, -12)
            core_2_kpu_24_input_2(0), --	sfix(1, -12)
            core_2_kpu_24_input_3(0), --	sfix(-3, -12)
            core_2_kpu_24_input_4(0), --	sfix(1, -12)
            core_2_kpu_24_input_5(0), --	sfix(0, -12)
            core_2_kpu_24_input_6(0), --	sfix(-3, -12)
            core_2_kpu_24_input_7(0), --	sfix(-1, -12)
            core_2_kpu_24_input_8(0), --	sfix(-2, -12)
            core_2_kpu_24_input_9(0), --	sfix(1, -12)

        
            core_2_concat_big_undelayed_array(703-1 downto 687),
            core_2_concat_big_delayed_array(703-1 downto 687),
            core_2_concat_big_undelayed_array(719-1 downto 703),
            core_2_concat_big_delayed_array(719-1 downto 703),

        
            core_2_concat_small_undelayed_array(2001-1 downto 1987),
            core_2_concat_small_delayed_array(2001-1 downto 1987),
            core_2_concat_small_undelayed_array(2017-1 downto 2001),
            core_2_concat_small_delayed_array(2017-1 downto 2001),
            core_2_concat_small_undelayed_array(2033-1 downto 2017),
            core_2_concat_small_delayed_array(2033-1 downto 2017),
            core_2_concat_small_undelayed_array(2049-1 downto 2033),
            core_2_concat_small_delayed_array(2049-1 downto 2033),
            core_2_concat_small_undelayed_array(2065-1 downto 2049),
            core_2_concat_small_delayed_array(2065-1 downto 2049),
            core_2_concat_small_undelayed_array(2081-1 downto 2065),
            core_2_concat_small_delayed_array(2081-1 downto 2065),

            -- like this: yo_1
            signal_core_2_yo_24(0)
        );
    core_2_KPU_25 : entity work.conv1_core2_KPU25
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_2_kpu_25_input_1(0), --	sfix(1, -12)
            core_2_kpu_25_input_2(0), --	sfix(1, -12)
            core_2_kpu_25_input_3(0), --	sfix(1, -12)
            core_2_kpu_25_input_4(0), --	sfix(1, -12)
            core_2_kpu_25_input_5(0), --	sfix(1, -12)
            core_2_kpu_25_input_6(0), --	sfix(1, -12)
            core_2_kpu_25_input_7(0), --	sfix(1, -12)
            core_2_kpu_25_input_8(0), --	sfix(1, -12)
            core_2_kpu_25_input_9(0), --	sfix(1, -12)

        
            core_2_concat_big_undelayed_array(732-1 downto 719),
            core_2_concat_big_delayed_array(732-1 downto 719),
            core_2_concat_big_undelayed_array(745-1 downto 732),
            core_2_concat_big_delayed_array(745-1 downto 732),

        
            core_2_concat_small_undelayed_array(2094-1 downto 2081),
            core_2_concat_small_delayed_array(2094-1 downto 2081),
            core_2_concat_small_undelayed_array(2107-1 downto 2094),
            core_2_concat_small_delayed_array(2107-1 downto 2094),
            core_2_concat_small_undelayed_array(2120-1 downto 2107),
            core_2_concat_small_delayed_array(2120-1 downto 2107),
            core_2_concat_small_undelayed_array(2133-1 downto 2120),
            core_2_concat_small_delayed_array(2133-1 downto 2120),
            core_2_concat_small_undelayed_array(2146-1 downto 2133),
            core_2_concat_small_delayed_array(2146-1 downto 2133),
            core_2_concat_small_undelayed_array(2159-1 downto 2146),
            core_2_concat_small_delayed_array(2159-1 downto 2146),

            -- like this: yo_1
            signal_core_2_yo_25(0)
        );
    core_2_KPU_26 : entity work.conv1_core2_KPU26
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_2_kpu_26_input_1(0), --	sfix(-2, -12)
            core_2_kpu_26_input_2(0), --	sfix(0, -12)
            core_2_kpu_26_input_3(0), --	sfix(1, -12)
            core_2_kpu_26_input_4(0), --	sfix(-1, -12)
            core_2_kpu_26_input_5(0), --	sfix(1, -12)
            core_2_kpu_26_input_6(0), --	sfix(1, -12)
            core_2_kpu_26_input_7(0), --	sfix(-2, -12)
            core_2_kpu_26_input_8(0), --	sfix(1, -12)
            core_2_kpu_26_input_9(0), --	sfix(0, -12)

        
            core_2_concat_big_undelayed_array(760-1 downto 745),
            core_2_concat_big_delayed_array(760-1 downto 745),
            core_2_concat_big_undelayed_array(777-1 downto 760),
            core_2_concat_big_delayed_array(777-1 downto 760),

        
            core_2_concat_small_undelayed_array(2169-1 downto 2159),
            core_2_concat_small_delayed_array(2169-1 downto 2159),
            core_2_concat_small_undelayed_array(2181-1 downto 2169),
            core_2_concat_small_delayed_array(2181-1 downto 2169),
            core_2_concat_small_undelayed_array(2198-1 downto 2181),
            core_2_concat_small_delayed_array(2198-1 downto 2181),
            core_2_concat_small_undelayed_array(2215-1 downto 2198),
            core_2_concat_small_delayed_array(2215-1 downto 2198),
            core_2_concat_small_undelayed_array(2232-1 downto 2215),
            core_2_concat_small_delayed_array(2232-1 downto 2215),
            core_2_concat_small_undelayed_array(2249-1 downto 2232),
            core_2_concat_small_delayed_array(2249-1 downto 2232),

            -- like this: yo_1
            signal_core_2_yo_26(0)
        );
    core_2_KPU_27 : entity work.conv1_core2_KPU27
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_2_kpu_27_input_1(0), --	sfix(1, -12)
            core_2_kpu_27_input_2(0), --	sfix(1, -12)
            core_2_kpu_27_input_3(0), --	sfix(0, -12)
            core_2_kpu_27_input_4(0), --	sfix(1, -12)
            core_2_kpu_27_input_5(0), --	sfix(1, -12)
            core_2_kpu_27_input_6(0), --	sfix(0, -12)
            core_2_kpu_27_input_7(0), --	sfix(-1, -12)
            core_2_kpu_27_input_8(0), --	sfix(0, -12)
            core_2_kpu_27_input_9(0), --	sfix(-2, -12)

        
            core_2_concat_big_undelayed_array(793-1 downto 777),
            core_2_concat_big_delayed_array(793-1 downto 777),
            core_2_concat_big_undelayed_array(810-1 downto 793),
            core_2_concat_big_delayed_array(810-1 downto 793),

        
            core_2_concat_small_undelayed_array(2262-1 downto 2249),
            core_2_concat_small_delayed_array(2262-1 downto 2249),
            core_2_concat_small_undelayed_array(2277-1 downto 2262),
            core_2_concat_small_delayed_array(2277-1 downto 2262),
            core_2_concat_small_undelayed_array(2293-1 downto 2277),
            core_2_concat_small_delayed_array(2293-1 downto 2277),
            core_2_concat_small_undelayed_array(2310-1 downto 2293),
            core_2_concat_small_delayed_array(2310-1 downto 2293),
            core_2_concat_small_undelayed_array(2327-1 downto 2310),
            core_2_concat_small_delayed_array(2327-1 downto 2310),
            core_2_concat_small_undelayed_array(2344-1 downto 2327),
            core_2_concat_small_delayed_array(2344-1 downto 2327),

            -- like this: yo_1
            signal_core_2_yo_27(0)
        );
    core_2_KPU_28 : entity work.conv1_core2_KPU28
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_2_kpu_28_input_1(0), --	sfix(1, -12)
            core_2_kpu_28_input_2(0), --	sfix(1, -12)
            core_2_kpu_28_input_3(0), --	sfix(1, -12)
            core_2_kpu_28_input_4(0), --	sfix(1, -12)
            core_2_kpu_28_input_5(0), --	sfix(1, -12)
            core_2_kpu_28_input_6(0), --	sfix(1, -12)
            core_2_kpu_28_input_7(0), --	sfix(1, -12)
            core_2_kpu_28_input_8(0), --	sfix(1, -12)
            core_2_kpu_28_input_9(0), --	sfix(1, -12)

        
            core_2_concat_big_undelayed_array(823-1 downto 810),
            core_2_concat_big_delayed_array(823-1 downto 810),
            core_2_concat_big_undelayed_array(836-1 downto 823),
            core_2_concat_big_delayed_array(836-1 downto 823),

        
            core_2_concat_small_undelayed_array(2357-1 downto 2344),
            core_2_concat_small_delayed_array(2357-1 downto 2344),
            core_2_concat_small_undelayed_array(2370-1 downto 2357),
            core_2_concat_small_delayed_array(2370-1 downto 2357),
            core_2_concat_small_undelayed_array(2383-1 downto 2370),
            core_2_concat_small_delayed_array(2383-1 downto 2370),
            core_2_concat_small_undelayed_array(2396-1 downto 2383),
            core_2_concat_small_delayed_array(2396-1 downto 2383),
            core_2_concat_small_undelayed_array(2409-1 downto 2396),
            core_2_concat_small_delayed_array(2409-1 downto 2396),
            core_2_concat_small_undelayed_array(2422-1 downto 2409),
            core_2_concat_small_delayed_array(2422-1 downto 2409),

            -- like this: yo_1
            signal_core_2_yo_28(0)
        );
    core_2_KPU_29 : entity work.conv1_core2_KPU29
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_2_kpu_29_input_1(0), --	sfix(4, -12)
            core_2_kpu_29_input_2(0), --	sfix(4, -12)
            core_2_kpu_29_input_3(0), --	sfix(3, -12)
            core_2_kpu_29_input_4(0), --	sfix(4, -12)
            core_2_kpu_29_input_5(0), --	sfix(2, -12)
            core_2_kpu_29_input_6(0), --	sfix(1, -12)
            core_2_kpu_29_input_7(0), --	sfix(2, -12)
            core_2_kpu_29_input_8(0), --	sfix(3, -12)
            core_2_kpu_29_input_9(0), --	sfix(2, -12)

        
            core_2_concat_big_undelayed_array(855-1 downto 836),
            core_2_concat_big_delayed_array(855-1 downto 836),
            core_2_concat_big_undelayed_array(874-1 downto 855),
            core_2_concat_big_delayed_array(874-1 downto 855),

        
            core_2_concat_small_undelayed_array(2438-1 downto 2422),
            core_2_concat_small_delayed_array(2438-1 downto 2422),
            core_2_concat_small_undelayed_array(2456-1 downto 2438),
            core_2_concat_small_delayed_array(2456-1 downto 2438),
            core_2_concat_small_undelayed_array(2475-1 downto 2456),
            core_2_concat_small_delayed_array(2475-1 downto 2456),
            core_2_concat_small_undelayed_array(2494-1 downto 2475),
            core_2_concat_small_delayed_array(2494-1 downto 2475),
            core_2_concat_small_undelayed_array(2513-1 downto 2494),
            core_2_concat_small_delayed_array(2513-1 downto 2494),
            core_2_concat_small_undelayed_array(2532-1 downto 2513),
            core_2_concat_small_delayed_array(2532-1 downto 2513),

            -- like this: yo_1
            signal_core_2_yo_29(0)
        );
    core_2_KPU_30 : entity work.conv1_core2_KPU30
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_2_kpu_30_input_1(0), --	sfix(-2, -12)
            core_2_kpu_30_input_2(0), --	sfix(-1, -12)
            core_2_kpu_30_input_3(0), --	sfix(0, -12)
            core_2_kpu_30_input_4(0), --	sfix(0, -12)
            core_2_kpu_30_input_5(0), --	sfix(1, -12)
            core_2_kpu_30_input_6(0), --	sfix(-1, -12)
            core_2_kpu_30_input_7(0), --	sfix(1, -12)
            core_2_kpu_30_input_8(0), --	sfix(1, -12)
            core_2_kpu_30_input_9(0), --	sfix(1, -12)

        
            core_2_concat_big_undelayed_array(888-1 downto 874),
            core_2_concat_big_delayed_array(888-1 downto 874),
            core_2_concat_big_undelayed_array(904-1 downto 888),
            core_2_concat_big_delayed_array(904-1 downto 888),

        
            core_2_concat_small_undelayed_array(2542-1 downto 2532),
            core_2_concat_small_delayed_array(2542-1 downto 2532),
            core_2_concat_small_undelayed_array(2554-1 downto 2542),
            core_2_concat_small_delayed_array(2554-1 downto 2542),
            core_2_concat_small_undelayed_array(2569-1 downto 2554),
            core_2_concat_small_delayed_array(2569-1 downto 2554),
            core_2_concat_small_undelayed_array(2585-1 downto 2569),
            core_2_concat_small_delayed_array(2585-1 downto 2569),
            core_2_concat_small_undelayed_array(2601-1 downto 2585),
            core_2_concat_small_delayed_array(2601-1 downto 2585),
            core_2_concat_small_undelayed_array(2617-1 downto 2601),
            core_2_concat_small_delayed_array(2617-1 downto 2601),

            -- like this: yo_1
            signal_core_2_yo_30(0)
        );
    core_2_KPU_31 : entity work.conv1_core2_KPU31
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_2_kpu_31_input_1(0), --	sfix(1, -12)
            core_2_kpu_31_input_2(0), --	sfix(1, -12)
            core_2_kpu_31_input_3(0), --	sfix(1, -12)
            core_2_kpu_31_input_4(0), --	sfix(1, -12)
            core_2_kpu_31_input_5(0), --	sfix(1, -12)
            core_2_kpu_31_input_6(0), --	sfix(1, -12)
            core_2_kpu_31_input_7(0), --	sfix(1, -12)
            core_2_kpu_31_input_8(0), --	sfix(1, -12)
            core_2_kpu_31_input_9(0), --	sfix(1, -12)

        
            core_2_concat_big_undelayed_array(917-1 downto 904),
            core_2_concat_big_delayed_array(917-1 downto 904),
            core_2_concat_big_undelayed_array(930-1 downto 917),
            core_2_concat_big_delayed_array(930-1 downto 917),

        
            core_2_concat_small_undelayed_array(2630-1 downto 2617),
            core_2_concat_small_delayed_array(2630-1 downto 2617),
            core_2_concat_small_undelayed_array(2643-1 downto 2630),
            core_2_concat_small_delayed_array(2643-1 downto 2630),
            core_2_concat_small_undelayed_array(2656-1 downto 2643),
            core_2_concat_small_delayed_array(2656-1 downto 2643),
            core_2_concat_small_undelayed_array(2669-1 downto 2656),
            core_2_concat_small_delayed_array(2669-1 downto 2656),
            core_2_concat_small_undelayed_array(2682-1 downto 2669),
            core_2_concat_small_delayed_array(2682-1 downto 2669),
            core_2_concat_small_undelayed_array(2695-1 downto 2682),
            core_2_concat_small_delayed_array(2695-1 downto 2682),

            -- like this: yo_1
            signal_core_2_yo_31(0)
        );
    core_2_KPU_32 : entity work.conv1_core2_KPU32
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_2_kpu_32_input_1(0), --	sfix(0, -12)
            core_2_kpu_32_input_2(0), --	sfix(2, -12)
            core_2_kpu_32_input_3(0), --	sfix(2, -12)
            core_2_kpu_32_input_4(0), --	sfix(-3, -12)
            core_2_kpu_32_input_5(0), --	sfix(0, -12)
            core_2_kpu_32_input_6(0), --	sfix(-1, -12)
            core_2_kpu_32_input_7(0), --	sfix(-2, -12)
            core_2_kpu_32_input_8(0), --	sfix(-3, -12)
            core_2_kpu_32_input_9(0), --	sfix(-3, -12)

        
            core_2_concat_big_undelayed_array(946-1 downto 930),
            core_2_concat_big_delayed_array(946-1 downto 930),
            core_2_concat_big_undelayed_array(962-1 downto 946),
            core_2_concat_big_delayed_array(962-1 downto 946),

        
            core_2_concat_small_undelayed_array(2707-1 downto 2695),
            core_2_concat_small_delayed_array(2707-1 downto 2695),
            core_2_concat_small_undelayed_array(2721-1 downto 2707),
            core_2_concat_small_delayed_array(2721-1 downto 2707),
            core_2_concat_small_undelayed_array(2737-1 downto 2721),
            core_2_concat_small_delayed_array(2737-1 downto 2721),
            core_2_concat_small_undelayed_array(2753-1 downto 2737),
            core_2_concat_small_delayed_array(2753-1 downto 2737),
            core_2_concat_small_undelayed_array(2769-1 downto 2753),
            core_2_concat_small_delayed_array(2769-1 downto 2753),
            core_2_concat_small_undelayed_array(2785-1 downto 2769),
            core_2_concat_small_delayed_array(2785-1 downto 2769),

            -- like this: yo_1
            signal_core_2_yo_32(0)
        );
  
    -- KPU big buffer delays
    -- Delay the single huge std_logic_vector
    core_3_concat_big_delay: entity work.BufferedDelay GENERIC MAP(WL => core_3_concat_big_undelayed_array'length, BL => BIG_BUFFER_DELAY_COUNTER_MAX )
        PORT MAP(reset, clk, buffer_enable_signal(2), big_buffer_delay_counter_signal(1), core_3_concat_big_undelayed_array, core_3_concat_big_delayed_array);


    -- KPU small buffer delays
    -- Delay the single huge std_logic_vector
    core_3_concat_small_delay: entity work.BufferedDelay GENERIC MAP(WL => core_3_concat_small_undelayed_array'length, BL => SMALL_BUFFER_DELAY_COUNTER_MAX )
        PORT MAP(reset, clk, buffer_enable_signal(2), small_buffer_delay_counter_signal(1), core_3_concat_small_undelayed_array, core_3_concat_small_delayed_array);
  

  
    core_3_KPU_1 : entity work.conv1_core3_KPU1
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_3_kpu_1_input_1(0), --	sfix(1, -12)
            core_3_kpu_1_input_2(0), --	sfix(1, -12)
            core_3_kpu_1_input_3(0), --	sfix(1, -12)
            core_3_kpu_1_input_4(0), --	sfix(1, -12)
            core_3_kpu_1_input_5(0), --	sfix(1, -12)
            core_3_kpu_1_input_6(0), --	sfix(1, -12)
            core_3_kpu_1_input_7(0), --	sfix(1, -12)
            core_3_kpu_1_input_8(0), --	sfix(1, -12)
            core_3_kpu_1_input_9(0), --	sfix(1, -12)

        
            core_3_concat_big_undelayed_array(13-1 downto 0),
            core_3_concat_big_delayed_array(13-1 downto 0),
            core_3_concat_big_undelayed_array(26-1 downto 13),
            core_3_concat_big_delayed_array(26-1 downto 13),

        
            core_3_concat_small_undelayed_array(13-1 downto 0),
            core_3_concat_small_delayed_array(13-1 downto 0),
            core_3_concat_small_undelayed_array(26-1 downto 13),
            core_3_concat_small_delayed_array(26-1 downto 13),
            core_3_concat_small_undelayed_array(39-1 downto 26),
            core_3_concat_small_delayed_array(39-1 downto 26),
            core_3_concat_small_undelayed_array(52-1 downto 39),
            core_3_concat_small_delayed_array(52-1 downto 39),
            core_3_concat_small_undelayed_array(65-1 downto 52),
            core_3_concat_small_delayed_array(65-1 downto 52),
            core_3_concat_small_undelayed_array(78-1 downto 65),
            core_3_concat_small_delayed_array(78-1 downto 65),

            -- like this: yo_1
            signal_core_3_yo_1(0)
        );
    core_3_KPU_2 : entity work.conv1_core3_KPU2
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_3_kpu_2_input_1(0), --	sfix(-1, -12)
            core_3_kpu_2_input_2(0), --	sfix(-1, -12)
            core_3_kpu_2_input_3(0), --	sfix(-2, -12)
            core_3_kpu_2_input_4(0), --	sfix(1, -12)
            core_3_kpu_2_input_5(0), --	sfix(-2, -12)
            core_3_kpu_2_input_6(0), --	sfix(-3, -12)
            core_3_kpu_2_input_7(0), --	sfix(-3, -12)
            core_3_kpu_2_input_8(0), --	sfix(1, -12)
            core_3_kpu_2_input_9(0), --	sfix(-2, -12)

        
            core_3_concat_big_undelayed_array(40-1 downto 26),
            core_3_concat_big_delayed_array(40-1 downto 26),
            core_3_concat_big_undelayed_array(54-1 downto 40),
            core_3_concat_big_delayed_array(54-1 downto 40),

        
            core_3_concat_small_undelayed_array(89-1 downto 78),
            core_3_concat_small_delayed_array(89-1 downto 78),
            core_3_concat_small_undelayed_array(102-1 downto 89),
            core_3_concat_small_delayed_array(102-1 downto 89),
            core_3_concat_small_undelayed_array(116-1 downto 102),
            core_3_concat_small_delayed_array(116-1 downto 102),
            core_3_concat_small_undelayed_array(130-1 downto 116),
            core_3_concat_small_delayed_array(130-1 downto 116),
            core_3_concat_small_undelayed_array(144-1 downto 130),
            core_3_concat_small_delayed_array(144-1 downto 130),
            core_3_concat_small_undelayed_array(158-1 downto 144),
            core_3_concat_small_delayed_array(158-1 downto 144),

            -- like this: yo_1
            signal_core_3_yo_2(0)
        );
    core_3_KPU_3 : entity work.conv1_core3_KPU3
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_3_kpu_3_input_1(0), --	sfix(1, -12)
            core_3_kpu_3_input_2(0), --	sfix(1, -12)
            core_3_kpu_3_input_3(0), --	sfix(0, -12)
            core_3_kpu_3_input_4(0), --	sfix(1, -12)
            core_3_kpu_3_input_5(0), --	sfix(1, -12)
            core_3_kpu_3_input_6(0), --	sfix(0, -12)
            core_3_kpu_3_input_7(0), --	sfix(1, -12)
            core_3_kpu_3_input_8(0), --	sfix(0, -12)
            core_3_kpu_3_input_9(0), --	sfix(0, -12)

        
            core_3_concat_big_undelayed_array(70-1 downto 54),
            core_3_concat_big_delayed_array(70-1 downto 54),
            core_3_concat_big_undelayed_array(87-1 downto 70),
            core_3_concat_big_delayed_array(87-1 downto 70),

        
            core_3_concat_small_undelayed_array(171-1 downto 158),
            core_3_concat_small_delayed_array(171-1 downto 158),
            core_3_concat_small_undelayed_array(186-1 downto 171),
            core_3_concat_small_delayed_array(186-1 downto 171),
            core_3_concat_small_undelayed_array(202-1 downto 186),
            core_3_concat_small_delayed_array(202-1 downto 186),
            core_3_concat_small_undelayed_array(219-1 downto 202),
            core_3_concat_small_delayed_array(219-1 downto 202),
            core_3_concat_small_undelayed_array(236-1 downto 219),
            core_3_concat_small_delayed_array(236-1 downto 219),
            core_3_concat_small_undelayed_array(253-1 downto 236),
            core_3_concat_small_delayed_array(253-1 downto 236),

            -- like this: yo_1
            signal_core_3_yo_3(0)
        );
    core_3_KPU_4 : entity work.conv1_core3_KPU4
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_3_kpu_4_input_1(0), --	sfix(1, -12)
            core_3_kpu_4_input_2(0), --	sfix(1, -12)
            core_3_kpu_4_input_3(0), --	sfix(1, -12)
            core_3_kpu_4_input_4(0), --	sfix(1, -12)
            core_3_kpu_4_input_5(0), --	sfix(1, -12)
            core_3_kpu_4_input_6(0), --	sfix(1, -12)
            core_3_kpu_4_input_7(0), --	sfix(1, -12)
            core_3_kpu_4_input_8(0), --	sfix(1, -12)
            core_3_kpu_4_input_9(0), --	sfix(1, -12)

        
            core_3_concat_big_undelayed_array(100-1 downto 87),
            core_3_concat_big_delayed_array(100-1 downto 87),
            core_3_concat_big_undelayed_array(113-1 downto 100),
            core_3_concat_big_delayed_array(113-1 downto 100),

        
            core_3_concat_small_undelayed_array(266-1 downto 253),
            core_3_concat_small_delayed_array(266-1 downto 253),
            core_3_concat_small_undelayed_array(279-1 downto 266),
            core_3_concat_small_delayed_array(279-1 downto 266),
            core_3_concat_small_undelayed_array(292-1 downto 279),
            core_3_concat_small_delayed_array(292-1 downto 279),
            core_3_concat_small_undelayed_array(305-1 downto 292),
            core_3_concat_small_delayed_array(305-1 downto 292),
            core_3_concat_small_undelayed_array(318-1 downto 305),
            core_3_concat_small_delayed_array(318-1 downto 305),
            core_3_concat_small_undelayed_array(331-1 downto 318),
            core_3_concat_small_delayed_array(331-1 downto 318),

            -- like this: yo_1
            signal_core_3_yo_4(0)
        );
    core_3_KPU_5 : entity work.conv1_core3_KPU5
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_3_kpu_5_input_1(0), --	sfix(1, -12)
            core_3_kpu_5_input_2(0), --	sfix(-1, -12)
            core_3_kpu_5_input_3(0), --	sfix(1, -12)
            core_3_kpu_5_input_4(0), --	sfix(-3, -12)
            core_3_kpu_5_input_5(0), --	sfix(2, -12)
            core_3_kpu_5_input_6(0), --	sfix(1, -12)
            core_3_kpu_5_input_7(0), --	sfix(0, -12)
            core_3_kpu_5_input_8(0), --	sfix(0, -12)
            core_3_kpu_5_input_9(0), --	sfix(0, -12)

        
            core_3_concat_big_undelayed_array(130-1 downto 113),
            core_3_concat_big_delayed_array(130-1 downto 113),
            core_3_concat_big_undelayed_array(150-1 downto 130),
            core_3_concat_big_delayed_array(150-1 downto 130),

        
            core_3_concat_small_undelayed_array(344-1 downto 331),
            core_3_concat_small_delayed_array(344-1 downto 331),
            core_3_concat_small_undelayed_array(359-1 downto 344),
            core_3_concat_small_delayed_array(359-1 downto 344),
            core_3_concat_small_undelayed_array(378-1 downto 359),
            core_3_concat_small_delayed_array(378-1 downto 359),
            core_3_concat_small_undelayed_array(398-1 downto 378),
            core_3_concat_small_delayed_array(398-1 downto 378),
            core_3_concat_small_undelayed_array(418-1 downto 398),
            core_3_concat_small_delayed_array(418-1 downto 398),
            core_3_concat_small_undelayed_array(438-1 downto 418),
            core_3_concat_small_delayed_array(438-1 downto 418),

            -- like this: yo_1
            signal_core_3_yo_5(0)
        );
    core_3_KPU_6 : entity work.conv1_core3_KPU6
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_3_kpu_6_input_1(0), --	sfix(1, -12)
            core_3_kpu_6_input_2(0), --	sfix(0, -12)
            core_3_kpu_6_input_3(0), --	sfix(-2, -12)
            core_3_kpu_6_input_4(0), --	sfix(0, -12)
            core_3_kpu_6_input_5(0), --	sfix(0, -12)
            core_3_kpu_6_input_6(0), --	sfix(0, -12)
            core_3_kpu_6_input_7(0), --	sfix(-1, -12)
            core_3_kpu_6_input_8(0), --	sfix(0, -12)
            core_3_kpu_6_input_9(0), --	sfix(-1, -12)

        
            core_3_concat_big_undelayed_array(168-1 downto 150),
            core_3_concat_big_delayed_array(168-1 downto 150),
            core_3_concat_big_undelayed_array(187-1 downto 168),
            core_3_concat_big_delayed_array(187-1 downto 168),

        
            core_3_concat_small_undelayed_array(451-1 downto 438),
            core_3_concat_small_delayed_array(451-1 downto 438),
            core_3_concat_small_undelayed_array(466-1 downto 451),
            core_3_concat_small_delayed_array(466-1 downto 451),
            core_3_concat_small_undelayed_array(484-1 downto 466),
            core_3_concat_small_delayed_array(484-1 downto 466),
            core_3_concat_small_undelayed_array(503-1 downto 484),
            core_3_concat_small_delayed_array(503-1 downto 484),
            core_3_concat_small_undelayed_array(522-1 downto 503),
            core_3_concat_small_delayed_array(522-1 downto 503),
            core_3_concat_small_undelayed_array(541-1 downto 522),
            core_3_concat_small_delayed_array(541-1 downto 522),

            -- like this: yo_1
            signal_core_3_yo_6(0)
        );
    core_3_KPU_7 : entity work.conv1_core3_KPU7
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_3_kpu_7_input_1(0), --	sfix(-1, -12)
            core_3_kpu_7_input_2(0), --	sfix(0, -12)
            core_3_kpu_7_input_3(0), --	sfix(0, -12)
            core_3_kpu_7_input_4(0), --	sfix(-2, -12)
            core_3_kpu_7_input_5(0), --	sfix(0, -12)
            core_3_kpu_7_input_6(0), --	sfix(-1, -12)
            core_3_kpu_7_input_7(0), --	sfix(-3, -12)
            core_3_kpu_7_input_8(0), --	sfix(-1, -12)
            core_3_kpu_7_input_9(0), --	sfix(-1, -12)

        
            core_3_concat_big_undelayed_array(202-1 downto 187),
            core_3_concat_big_delayed_array(202-1 downto 187),
            core_3_concat_big_undelayed_array(218-1 downto 202),
            core_3_concat_big_delayed_array(218-1 downto 202),

        
            core_3_concat_small_undelayed_array(552-1 downto 541),
            core_3_concat_small_delayed_array(552-1 downto 541),
            core_3_concat_small_undelayed_array(565-1 downto 552),
            core_3_concat_small_delayed_array(565-1 downto 552),
            core_3_concat_small_undelayed_array(581-1 downto 565),
            core_3_concat_small_delayed_array(581-1 downto 565),
            core_3_concat_small_undelayed_array(597-1 downto 581),
            core_3_concat_small_delayed_array(597-1 downto 581),
            core_3_concat_small_undelayed_array(613-1 downto 597),
            core_3_concat_small_delayed_array(613-1 downto 597),
            core_3_concat_small_undelayed_array(629-1 downto 613),
            core_3_concat_small_delayed_array(629-1 downto 613),

            -- like this: yo_1
            signal_core_3_yo_7(0)
        );
    core_3_KPU_8 : entity work.conv1_core3_KPU8
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_3_kpu_8_input_1(0), --	sfix(0, -12)
            core_3_kpu_8_input_2(0), --	sfix(1, -12)
            core_3_kpu_8_input_3(0), --	sfix(-1, -12)
            core_3_kpu_8_input_4(0), --	sfix(1, -12)
            core_3_kpu_8_input_5(0), --	sfix(1, -12)
            core_3_kpu_8_input_6(0), --	sfix(-1, -12)
            core_3_kpu_8_input_7(0), --	sfix(0, -12)
            core_3_kpu_8_input_8(0), --	sfix(0, -12)
            core_3_kpu_8_input_9(0), --	sfix(-2, -12)

        
            core_3_concat_big_undelayed_array(233-1 downto 218),
            core_3_concat_big_delayed_array(233-1 downto 218),
            core_3_concat_big_undelayed_array(249-1 downto 233),
            core_3_concat_big_delayed_array(249-1 downto 233),

        
            core_3_concat_small_undelayed_array(641-1 downto 629),
            core_3_concat_small_delayed_array(641-1 downto 629),
            core_3_concat_small_undelayed_array(655-1 downto 641),
            core_3_concat_small_delayed_array(655-1 downto 641),
            core_3_concat_small_undelayed_array(671-1 downto 655),
            core_3_concat_small_delayed_array(671-1 downto 655),
            core_3_concat_small_undelayed_array(687-1 downto 671),
            core_3_concat_small_delayed_array(687-1 downto 671),
            core_3_concat_small_undelayed_array(703-1 downto 687),
            core_3_concat_small_delayed_array(703-1 downto 687),
            core_3_concat_small_undelayed_array(719-1 downto 703),
            core_3_concat_small_delayed_array(719-1 downto 703),

            -- like this: yo_1
            signal_core_3_yo_8(0)
        );
    core_3_KPU_9 : entity work.conv1_core3_KPU9
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_3_kpu_9_input_1(0), --	sfix(1, -12)
            core_3_kpu_9_input_2(0), --	sfix(1, -12)
            core_3_kpu_9_input_3(0), --	sfix(1, -12)
            core_3_kpu_9_input_4(0), --	sfix(1, -12)
            core_3_kpu_9_input_5(0), --	sfix(1, -12)
            core_3_kpu_9_input_6(0), --	sfix(1, -12)
            core_3_kpu_9_input_7(0), --	sfix(1, -12)
            core_3_kpu_9_input_8(0), --	sfix(1, -12)
            core_3_kpu_9_input_9(0), --	sfix(1, -12)

        
            core_3_concat_big_undelayed_array(262-1 downto 249),
            core_3_concat_big_delayed_array(262-1 downto 249),
            core_3_concat_big_undelayed_array(275-1 downto 262),
            core_3_concat_big_delayed_array(275-1 downto 262),

        
            core_3_concat_small_undelayed_array(732-1 downto 719),
            core_3_concat_small_delayed_array(732-1 downto 719),
            core_3_concat_small_undelayed_array(745-1 downto 732),
            core_3_concat_small_delayed_array(745-1 downto 732),
            core_3_concat_small_undelayed_array(758-1 downto 745),
            core_3_concat_small_delayed_array(758-1 downto 745),
            core_3_concat_small_undelayed_array(771-1 downto 758),
            core_3_concat_small_delayed_array(771-1 downto 758),
            core_3_concat_small_undelayed_array(784-1 downto 771),
            core_3_concat_small_delayed_array(784-1 downto 771),
            core_3_concat_small_undelayed_array(797-1 downto 784),
            core_3_concat_small_delayed_array(797-1 downto 784),

            -- like this: yo_1
            signal_core_3_yo_9(0)
        );
    core_3_KPU_10 : entity work.conv1_core3_KPU10
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_3_kpu_10_input_1(0), --	sfix(1, -12)
            core_3_kpu_10_input_2(0), --	sfix(1, -12)
            core_3_kpu_10_input_3(0), --	sfix(1, -12)
            core_3_kpu_10_input_4(0), --	sfix(1, -12)
            core_3_kpu_10_input_5(0), --	sfix(1, -12)
            core_3_kpu_10_input_6(0), --	sfix(1, -12)
            core_3_kpu_10_input_7(0), --	sfix(1, -12)
            core_3_kpu_10_input_8(0), --	sfix(1, -12)
            core_3_kpu_10_input_9(0), --	sfix(1, -12)

        
            core_3_concat_big_undelayed_array(288-1 downto 275),
            core_3_concat_big_delayed_array(288-1 downto 275),
            core_3_concat_big_undelayed_array(301-1 downto 288),
            core_3_concat_big_delayed_array(301-1 downto 288),

        
            core_3_concat_small_undelayed_array(810-1 downto 797),
            core_3_concat_small_delayed_array(810-1 downto 797),
            core_3_concat_small_undelayed_array(823-1 downto 810),
            core_3_concat_small_delayed_array(823-1 downto 810),
            core_3_concat_small_undelayed_array(836-1 downto 823),
            core_3_concat_small_delayed_array(836-1 downto 823),
            core_3_concat_small_undelayed_array(849-1 downto 836),
            core_3_concat_small_delayed_array(849-1 downto 836),
            core_3_concat_small_undelayed_array(862-1 downto 849),
            core_3_concat_small_delayed_array(862-1 downto 849),
            core_3_concat_small_undelayed_array(875-1 downto 862),
            core_3_concat_small_delayed_array(875-1 downto 862),

            -- like this: yo_1
            signal_core_3_yo_10(0)
        );
    core_3_KPU_11 : entity work.conv1_core3_KPU11
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_3_kpu_11_input_1(0), --	sfix(1, -12)
            core_3_kpu_11_input_2(0), --	sfix(1, -12)
            core_3_kpu_11_input_3(0), --	sfix(1, -12)
            core_3_kpu_11_input_4(0), --	sfix(1, -12)
            core_3_kpu_11_input_5(0), --	sfix(1, -12)
            core_3_kpu_11_input_6(0), --	sfix(1, -12)
            core_3_kpu_11_input_7(0), --	sfix(1, -12)
            core_3_kpu_11_input_8(0), --	sfix(1, -12)
            core_3_kpu_11_input_9(0), --	sfix(1, -12)

        
            core_3_concat_big_undelayed_array(314-1 downto 301),
            core_3_concat_big_delayed_array(314-1 downto 301),
            core_3_concat_big_undelayed_array(327-1 downto 314),
            core_3_concat_big_delayed_array(327-1 downto 314),

        
            core_3_concat_small_undelayed_array(888-1 downto 875),
            core_3_concat_small_delayed_array(888-1 downto 875),
            core_3_concat_small_undelayed_array(901-1 downto 888),
            core_3_concat_small_delayed_array(901-1 downto 888),
            core_3_concat_small_undelayed_array(914-1 downto 901),
            core_3_concat_small_delayed_array(914-1 downto 901),
            core_3_concat_small_undelayed_array(927-1 downto 914),
            core_3_concat_small_delayed_array(927-1 downto 914),
            core_3_concat_small_undelayed_array(940-1 downto 927),
            core_3_concat_small_delayed_array(940-1 downto 927),
            core_3_concat_small_undelayed_array(953-1 downto 940),
            core_3_concat_small_delayed_array(953-1 downto 940),

            -- like this: yo_1
            signal_core_3_yo_11(0)
        );
    core_3_KPU_12 : entity work.conv1_core3_KPU12
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_3_kpu_12_input_1(0), --	sfix(2, -12)
            core_3_kpu_12_input_2(0), --	sfix(2, -12)
            core_3_kpu_12_input_3(0), --	sfix(-1, -12)
            core_3_kpu_12_input_4(0), --	sfix(1, -12)
            core_3_kpu_12_input_5(0), --	sfix(2, -12)
            core_3_kpu_12_input_6(0), --	sfix(-2, -12)
            core_3_kpu_12_input_7(0), --	sfix(-2, -12)
            core_3_kpu_12_input_8(0), --	sfix(-1, -12)
            core_3_kpu_12_input_9(0), --	sfix(-1, -12)

        
            core_3_concat_big_undelayed_array(344-1 downto 327),
            core_3_concat_big_delayed_array(344-1 downto 327),
            core_3_concat_big_undelayed_array(361-1 downto 344),
            core_3_concat_big_delayed_array(361-1 downto 344),

        
            core_3_concat_small_undelayed_array(967-1 downto 953),
            core_3_concat_small_delayed_array(967-1 downto 953),
            core_3_concat_small_undelayed_array(983-1 downto 967),
            core_3_concat_small_delayed_array(983-1 downto 967),
            core_3_concat_small_undelayed_array(1000-1 downto 983),
            core_3_concat_small_delayed_array(1000-1 downto 983),
            core_3_concat_small_undelayed_array(1017-1 downto 1000),
            core_3_concat_small_delayed_array(1017-1 downto 1000),
            core_3_concat_small_undelayed_array(1034-1 downto 1017),
            core_3_concat_small_delayed_array(1034-1 downto 1017),
            core_3_concat_small_undelayed_array(1051-1 downto 1034),
            core_3_concat_small_delayed_array(1051-1 downto 1034),

            -- like this: yo_1
            signal_core_3_yo_12(0)
        );
    core_3_KPU_13 : entity work.conv1_core3_KPU13
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_3_kpu_13_input_1(0), --	sfix(3, -12)
            core_3_kpu_13_input_2(0), --	sfix(2, -12)
            core_3_kpu_13_input_3(0), --	sfix(2, -12)
            core_3_kpu_13_input_4(0), --	sfix(2, -12)
            core_3_kpu_13_input_5(0), --	sfix(2, -12)
            core_3_kpu_13_input_6(0), --	sfix(2, -12)
            core_3_kpu_13_input_7(0), --	sfix(2, -12)
            core_3_kpu_13_input_8(0), --	sfix(2, -12)
            core_3_kpu_13_input_9(0), --	sfix(2, -12)

        
            core_3_concat_big_undelayed_array(378-1 downto 361),
            core_3_concat_big_delayed_array(378-1 downto 361),
            core_3_concat_big_undelayed_array(396-1 downto 378),
            core_3_concat_big_delayed_array(396-1 downto 378),

        
            core_3_concat_small_undelayed_array(1066-1 downto 1051),
            core_3_concat_small_delayed_array(1066-1 downto 1051),
            core_3_concat_small_undelayed_array(1083-1 downto 1066),
            core_3_concat_small_delayed_array(1083-1 downto 1066),
            core_3_concat_small_undelayed_array(1101-1 downto 1083),
            core_3_concat_small_delayed_array(1101-1 downto 1083),
            core_3_concat_small_undelayed_array(1119-1 downto 1101),
            core_3_concat_small_delayed_array(1119-1 downto 1101),
            core_3_concat_small_undelayed_array(1137-1 downto 1119),
            core_3_concat_small_delayed_array(1137-1 downto 1119),
            core_3_concat_small_undelayed_array(1155-1 downto 1137),
            core_3_concat_small_delayed_array(1155-1 downto 1137),

            -- like this: yo_1
            signal_core_3_yo_13(0)
        );
    core_3_KPU_14 : entity work.conv1_core3_KPU14
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_3_kpu_14_input_1(0), --	sfix(1, -12)
            core_3_kpu_14_input_2(0), --	sfix(0, -12)
            core_3_kpu_14_input_3(0), --	sfix(-1, -12)
            core_3_kpu_14_input_4(0), --	sfix(1, -12)
            core_3_kpu_14_input_5(0), --	sfix(0, -12)
            core_3_kpu_14_input_6(0), --	sfix(0, -12)
            core_3_kpu_14_input_7(0), --	sfix(1, -12)
            core_3_kpu_14_input_8(0), --	sfix(0, -12)
            core_3_kpu_14_input_9(0), --	sfix(-1, -12)

        
            core_3_concat_big_undelayed_array(411-1 downto 396),
            core_3_concat_big_delayed_array(411-1 downto 396),
            core_3_concat_big_undelayed_array(427-1 downto 411),
            core_3_concat_big_delayed_array(427-1 downto 411),

        
            core_3_concat_small_undelayed_array(1168-1 downto 1155),
            core_3_concat_small_delayed_array(1168-1 downto 1155),
            core_3_concat_small_undelayed_array(1183-1 downto 1168),
            core_3_concat_small_delayed_array(1183-1 downto 1168),
            core_3_concat_small_undelayed_array(1199-1 downto 1183),
            core_3_concat_small_delayed_array(1199-1 downto 1183),
            core_3_concat_small_undelayed_array(1215-1 downto 1199),
            core_3_concat_small_delayed_array(1215-1 downto 1199),
            core_3_concat_small_undelayed_array(1231-1 downto 1215),
            core_3_concat_small_delayed_array(1231-1 downto 1215),
            core_3_concat_small_undelayed_array(1247-1 downto 1231),
            core_3_concat_small_delayed_array(1247-1 downto 1231),

            -- like this: yo_1
            signal_core_3_yo_14(0)
        );
    core_3_KPU_15 : entity work.conv1_core3_KPU15
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_3_kpu_15_input_1(0), --	sfix(-3, -12)
            core_3_kpu_15_input_2(0), --	sfix(-3, -12)
            core_3_kpu_15_input_3(0), --	sfix(-3, -12)
            core_3_kpu_15_input_4(0), --	sfix(-3, -12)
            core_3_kpu_15_input_5(0), --	sfix(-3, -12)
            core_3_kpu_15_input_6(0), --	sfix(-3, -12)
            core_3_kpu_15_input_7(0), --	sfix(1, -12)
            core_3_kpu_15_input_8(0), --	sfix(1, -12)
            core_3_kpu_15_input_9(0), --	sfix(1, -12)

        
            core_3_concat_big_undelayed_array(439-1 downto 427),
            core_3_concat_big_delayed_array(439-1 downto 427),
            core_3_concat_big_undelayed_array(452-1 downto 439),
            core_3_concat_big_delayed_array(452-1 downto 439),

        
            core_3_concat_small_undelayed_array(1256-1 downto 1247),
            core_3_concat_small_delayed_array(1256-1 downto 1247),
            core_3_concat_small_undelayed_array(1267-1 downto 1256),
            core_3_concat_small_delayed_array(1267-1 downto 1256),
            core_3_concat_small_undelayed_array(1280-1 downto 1267),
            core_3_concat_small_delayed_array(1280-1 downto 1267),
            core_3_concat_small_undelayed_array(1293-1 downto 1280),
            core_3_concat_small_delayed_array(1293-1 downto 1280),
            core_3_concat_small_undelayed_array(1306-1 downto 1293),
            core_3_concat_small_delayed_array(1306-1 downto 1293),
            core_3_concat_small_undelayed_array(1319-1 downto 1306),
            core_3_concat_small_delayed_array(1319-1 downto 1306),

            -- like this: yo_1
            signal_core_3_yo_15(0)
        );
    core_3_KPU_16 : entity work.conv1_core3_KPU16
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_3_kpu_16_input_1(0), --	sfix(0, -12)
            core_3_kpu_16_input_2(0), --	sfix(0, -12)
            core_3_kpu_16_input_3(0), --	sfix(-1, -12)
            core_3_kpu_16_input_4(0), --	sfix(1, -12)
            core_3_kpu_16_input_5(0), --	sfix(1, -12)
            core_3_kpu_16_input_6(0), --	sfix(-1, -12)
            core_3_kpu_16_input_7(0), --	sfix(-1, -12)
            core_3_kpu_16_input_8(0), --	sfix(-1, -12)
            core_3_kpu_16_input_9(0), --	sfix(-2, -12)

        
            core_3_concat_big_undelayed_array(467-1 downto 452),
            core_3_concat_big_delayed_array(467-1 downto 452),
            core_3_concat_big_undelayed_array(484-1 downto 467),
            core_3_concat_big_delayed_array(484-1 downto 467),

        
            core_3_concat_small_undelayed_array(1331-1 downto 1319),
            core_3_concat_small_delayed_array(1331-1 downto 1319),
            core_3_concat_small_undelayed_array(1345-1 downto 1331),
            core_3_concat_small_delayed_array(1345-1 downto 1331),
            core_3_concat_small_undelayed_array(1361-1 downto 1345),
            core_3_concat_small_delayed_array(1361-1 downto 1345),
            core_3_concat_small_undelayed_array(1378-1 downto 1361),
            core_3_concat_small_delayed_array(1378-1 downto 1361),
            core_3_concat_small_undelayed_array(1395-1 downto 1378),
            core_3_concat_small_delayed_array(1395-1 downto 1378),
            core_3_concat_small_undelayed_array(1412-1 downto 1395),
            core_3_concat_small_delayed_array(1412-1 downto 1395),

            -- like this: yo_1
            signal_core_3_yo_16(0)
        );
    core_3_KPU_17 : entity work.conv1_core3_KPU17
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_3_kpu_17_input_1(0), --	sfix(0, -12)
            core_3_kpu_17_input_2(0), --	sfix(2, -12)
            core_3_kpu_17_input_3(0), --	sfix(0, -12)
            core_3_kpu_17_input_4(0), --	sfix(0, -12)
            core_3_kpu_17_input_5(0), --	sfix(0, -12)
            core_3_kpu_17_input_6(0), --	sfix(-2, -12)
            core_3_kpu_17_input_7(0), --	sfix(0, -12)
            core_3_kpu_17_input_8(0), --	sfix(1, -12)
            core_3_kpu_17_input_9(0), --	sfix(-1, -12)

        
            core_3_concat_big_undelayed_array(500-1 downto 484),
            core_3_concat_big_delayed_array(500-1 downto 484),
            core_3_concat_big_undelayed_array(517-1 downto 500),
            core_3_concat_big_delayed_array(517-1 downto 500),

        
            core_3_concat_small_undelayed_array(1424-1 downto 1412),
            core_3_concat_small_delayed_array(1424-1 downto 1412),
            core_3_concat_small_undelayed_array(1438-1 downto 1424),
            core_3_concat_small_delayed_array(1438-1 downto 1424),
            core_3_concat_small_undelayed_array(1455-1 downto 1438),
            core_3_concat_small_delayed_array(1455-1 downto 1438),
            core_3_concat_small_undelayed_array(1472-1 downto 1455),
            core_3_concat_small_delayed_array(1472-1 downto 1455),
            core_3_concat_small_undelayed_array(1489-1 downto 1472),
            core_3_concat_small_delayed_array(1489-1 downto 1472),
            core_3_concat_small_undelayed_array(1506-1 downto 1489),
            core_3_concat_small_delayed_array(1506-1 downto 1489),

            -- like this: yo_1
            signal_core_3_yo_17(0)
        );
    core_3_KPU_18 : entity work.conv1_core3_KPU18
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_3_kpu_18_input_1(0), --	sfix(-2, -12)
            core_3_kpu_18_input_2(0), --	sfix(0, -12)
            core_3_kpu_18_input_3(0), --	sfix(-1, -12)
            core_3_kpu_18_input_4(0), --	sfix(0, -12)
            core_3_kpu_18_input_5(0), --	sfix(0, -12)
            core_3_kpu_18_input_6(0), --	sfix(-1, -12)
            core_3_kpu_18_input_7(0), --	sfix(-1, -12)
            core_3_kpu_18_input_8(0), --	sfix(-2, -12)
            core_3_kpu_18_input_9(0), --	sfix(1, -12)

        
            core_3_concat_big_undelayed_array(531-1 downto 517),
            core_3_concat_big_delayed_array(531-1 downto 517),
            core_3_concat_big_undelayed_array(546-1 downto 531),
            core_3_concat_big_delayed_array(546-1 downto 531),

        
            core_3_concat_small_undelayed_array(1516-1 downto 1506),
            core_3_concat_small_delayed_array(1516-1 downto 1506),
            core_3_concat_small_undelayed_array(1528-1 downto 1516),
            core_3_concat_small_delayed_array(1528-1 downto 1516),
            core_3_concat_small_undelayed_array(1543-1 downto 1528),
            core_3_concat_small_delayed_array(1543-1 downto 1528),
            core_3_concat_small_undelayed_array(1558-1 downto 1543),
            core_3_concat_small_delayed_array(1558-1 downto 1543),
            core_3_concat_small_undelayed_array(1573-1 downto 1558),
            core_3_concat_small_delayed_array(1573-1 downto 1558),
            core_3_concat_small_undelayed_array(1588-1 downto 1573),
            core_3_concat_small_delayed_array(1588-1 downto 1573),

            -- like this: yo_1
            signal_core_3_yo_18(0)
        );
    core_3_KPU_19 : entity work.conv1_core3_KPU19
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_3_kpu_19_input_1(0), --	sfix(3, -12)
            core_3_kpu_19_input_2(0), --	sfix(3, -12)
            core_3_kpu_19_input_3(0), --	sfix(2, -12)
            core_3_kpu_19_input_4(0), --	sfix(3, -12)
            core_3_kpu_19_input_5(0), --	sfix(3, -12)
            core_3_kpu_19_input_6(0), --	sfix(3, -12)
            core_3_kpu_19_input_7(0), --	sfix(2, -12)
            core_3_kpu_19_input_8(0), --	sfix(2, -12)
            core_3_kpu_19_input_9(0), --	sfix(3, -12)

        
            core_3_concat_big_undelayed_array(564-1 downto 546),
            core_3_concat_big_delayed_array(564-1 downto 546),
            core_3_concat_big_undelayed_array(583-1 downto 564),
            core_3_concat_big_delayed_array(583-1 downto 564),

        
            core_3_concat_small_undelayed_array(1603-1 downto 1588),
            core_3_concat_small_delayed_array(1603-1 downto 1588),
            core_3_concat_small_undelayed_array(1620-1 downto 1603),
            core_3_concat_small_delayed_array(1620-1 downto 1603),
            core_3_concat_small_undelayed_array(1638-1 downto 1620),
            core_3_concat_small_delayed_array(1638-1 downto 1620),
            core_3_concat_small_undelayed_array(1657-1 downto 1638),
            core_3_concat_small_delayed_array(1657-1 downto 1638),
            core_3_concat_small_undelayed_array(1676-1 downto 1657),
            core_3_concat_small_delayed_array(1676-1 downto 1657),
            core_3_concat_small_undelayed_array(1695-1 downto 1676),
            core_3_concat_small_delayed_array(1695-1 downto 1676),

            -- like this: yo_1
            signal_core_3_yo_19(0)
        );
    core_3_KPU_20 : entity work.conv1_core3_KPU20
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_3_kpu_20_input_1(0), --	sfix(-2, -12)
            core_3_kpu_20_input_2(0), --	sfix(-1, -12)
            core_3_kpu_20_input_3(0), --	sfix(-3, -12)
            core_3_kpu_20_input_4(0), --	sfix(1, -12)
            core_3_kpu_20_input_5(0), --	sfix(1, -12)
            core_3_kpu_20_input_6(0), --	sfix(0, -12)
            core_3_kpu_20_input_7(0), --	sfix(1, -12)
            core_3_kpu_20_input_8(0), --	sfix(-3, -12)
            core_3_kpu_20_input_9(0), --	sfix(-2, -12)

        
            core_3_concat_big_undelayed_array(597-1 downto 583),
            core_3_concat_big_delayed_array(597-1 downto 583),
            core_3_concat_big_undelayed_array(613-1 downto 597),
            core_3_concat_big_delayed_array(613-1 downto 597),

        
            core_3_concat_small_undelayed_array(1705-1 downto 1695),
            core_3_concat_small_delayed_array(1705-1 downto 1695),
            core_3_concat_small_undelayed_array(1717-1 downto 1705),
            core_3_concat_small_delayed_array(1717-1 downto 1705),
            core_3_concat_small_undelayed_array(1731-1 downto 1717),
            core_3_concat_small_delayed_array(1731-1 downto 1717),
            core_3_concat_small_undelayed_array(1747-1 downto 1731),
            core_3_concat_small_delayed_array(1747-1 downto 1731),
            core_3_concat_small_undelayed_array(1763-1 downto 1747),
            core_3_concat_small_delayed_array(1763-1 downto 1747),
            core_3_concat_small_undelayed_array(1779-1 downto 1763),
            core_3_concat_small_delayed_array(1779-1 downto 1763),

            -- like this: yo_1
            signal_core_3_yo_20(0)
        );
    core_3_KPU_21 : entity work.conv1_core3_KPU21
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_3_kpu_21_input_1(0), --	sfix(1, -12)
            core_3_kpu_21_input_2(0), --	sfix(1, -12)
            core_3_kpu_21_input_3(0), --	sfix(1, -12)
            core_3_kpu_21_input_4(0), --	sfix(1, -12)
            core_3_kpu_21_input_5(0), --	sfix(1, -12)
            core_3_kpu_21_input_6(0), --	sfix(1, -12)
            core_3_kpu_21_input_7(0), --	sfix(1, -12)
            core_3_kpu_21_input_8(0), --	sfix(1, -12)
            core_3_kpu_21_input_9(0), --	sfix(1, -12)

        
            core_3_concat_big_undelayed_array(626-1 downto 613),
            core_3_concat_big_delayed_array(626-1 downto 613),
            core_3_concat_big_undelayed_array(639-1 downto 626),
            core_3_concat_big_delayed_array(639-1 downto 626),

        
            core_3_concat_small_undelayed_array(1792-1 downto 1779),
            core_3_concat_small_delayed_array(1792-1 downto 1779),
            core_3_concat_small_undelayed_array(1805-1 downto 1792),
            core_3_concat_small_delayed_array(1805-1 downto 1792),
            core_3_concat_small_undelayed_array(1818-1 downto 1805),
            core_3_concat_small_delayed_array(1818-1 downto 1805),
            core_3_concat_small_undelayed_array(1831-1 downto 1818),
            core_3_concat_small_delayed_array(1831-1 downto 1818),
            core_3_concat_small_undelayed_array(1844-1 downto 1831),
            core_3_concat_small_delayed_array(1844-1 downto 1831),
            core_3_concat_small_undelayed_array(1857-1 downto 1844),
            core_3_concat_small_delayed_array(1857-1 downto 1844),

            -- like this: yo_1
            signal_core_3_yo_21(0)
        );
    core_3_KPU_22 : entity work.conv1_core3_KPU22
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_3_kpu_22_input_1(0), --	sfix(2, -12)
            core_3_kpu_22_input_2(0), --	sfix(1, -12)
            core_3_kpu_22_input_3(0), --	sfix(1, -12)
            core_3_kpu_22_input_4(0), --	sfix(3, -12)
            core_3_kpu_22_input_5(0), --	sfix(0, -12)
            core_3_kpu_22_input_6(0), --	sfix(2, -12)
            core_3_kpu_22_input_7(0), --	sfix(1, -12)
            core_3_kpu_22_input_8(0), --	sfix(0, -12)
            core_3_kpu_22_input_9(0), --	sfix(1, -12)

        
            core_3_concat_big_undelayed_array(656-1 downto 639),
            core_3_concat_big_delayed_array(656-1 downto 639),
            core_3_concat_big_undelayed_array(673-1 downto 656),
            core_3_concat_big_delayed_array(673-1 downto 656),

        
            core_3_concat_small_undelayed_array(1871-1 downto 1857),
            core_3_concat_small_delayed_array(1871-1 downto 1857),
            core_3_concat_small_undelayed_array(1887-1 downto 1871),
            core_3_concat_small_delayed_array(1887-1 downto 1871),
            core_3_concat_small_undelayed_array(1904-1 downto 1887),
            core_3_concat_small_delayed_array(1904-1 downto 1887),
            core_3_concat_small_undelayed_array(1921-1 downto 1904),
            core_3_concat_small_delayed_array(1921-1 downto 1904),
            core_3_concat_small_undelayed_array(1938-1 downto 1921),
            core_3_concat_small_delayed_array(1938-1 downto 1921),
            core_3_concat_small_undelayed_array(1955-1 downto 1938),
            core_3_concat_small_delayed_array(1955-1 downto 1938),

            -- like this: yo_1
            signal_core_3_yo_22(0)
        );
    core_3_KPU_23 : entity work.conv1_core3_KPU23
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_3_kpu_23_input_1(0), --	sfix(1, -12)
            core_3_kpu_23_input_2(0), --	sfix(1, -12)
            core_3_kpu_23_input_3(0), --	sfix(1, -12)
            core_3_kpu_23_input_4(0), --	sfix(1, -12)
            core_3_kpu_23_input_5(0), --	sfix(1, -12)
            core_3_kpu_23_input_6(0), --	sfix(1, -12)
            core_3_kpu_23_input_7(0), --	sfix(1, -12)
            core_3_kpu_23_input_8(0), --	sfix(1, -12)
            core_3_kpu_23_input_9(0), --	sfix(1, -12)

        
            core_3_concat_big_undelayed_array(686-1 downto 673),
            core_3_concat_big_delayed_array(686-1 downto 673),
            core_3_concat_big_undelayed_array(699-1 downto 686),
            core_3_concat_big_delayed_array(699-1 downto 686),

        
            core_3_concat_small_undelayed_array(1968-1 downto 1955),
            core_3_concat_small_delayed_array(1968-1 downto 1955),
            core_3_concat_small_undelayed_array(1981-1 downto 1968),
            core_3_concat_small_delayed_array(1981-1 downto 1968),
            core_3_concat_small_undelayed_array(1994-1 downto 1981),
            core_3_concat_small_delayed_array(1994-1 downto 1981),
            core_3_concat_small_undelayed_array(2007-1 downto 1994),
            core_3_concat_small_delayed_array(2007-1 downto 1994),
            core_3_concat_small_undelayed_array(2020-1 downto 2007),
            core_3_concat_small_delayed_array(2020-1 downto 2007),
            core_3_concat_small_undelayed_array(2033-1 downto 2020),
            core_3_concat_small_delayed_array(2033-1 downto 2020),

            -- like this: yo_1
            signal_core_3_yo_23(0)
        );
    core_3_KPU_24 : entity work.conv1_core3_KPU24
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_3_kpu_24_input_1(0), --	sfix(0, -12)
            core_3_kpu_24_input_2(0), --	sfix(-1, -12)
            core_3_kpu_24_input_3(0), --	sfix(-3, -12)
            core_3_kpu_24_input_4(0), --	sfix(-1, -12)
            core_3_kpu_24_input_5(0), --	sfix(-1, -12)
            core_3_kpu_24_input_6(0), --	sfix(1, -12)
            core_3_kpu_24_input_7(0), --	sfix(-2, -12)
            core_3_kpu_24_input_8(0), --	sfix(1, -12)
            core_3_kpu_24_input_9(0), --	sfix(-1, -12)

        
            core_3_concat_big_undelayed_array(714-1 downto 699),
            core_3_concat_big_delayed_array(714-1 downto 699),
            core_3_concat_big_undelayed_array(729-1 downto 714),
            core_3_concat_big_delayed_array(729-1 downto 714),

        
            core_3_concat_small_undelayed_array(2045-1 downto 2033),
            core_3_concat_small_delayed_array(2045-1 downto 2033),
            core_3_concat_small_undelayed_array(2059-1 downto 2045),
            core_3_concat_small_delayed_array(2059-1 downto 2045),
            core_3_concat_small_undelayed_array(2074-1 downto 2059),
            core_3_concat_small_delayed_array(2074-1 downto 2059),
            core_3_concat_small_undelayed_array(2089-1 downto 2074),
            core_3_concat_small_delayed_array(2089-1 downto 2074),
            core_3_concat_small_undelayed_array(2104-1 downto 2089),
            core_3_concat_small_delayed_array(2104-1 downto 2089),
            core_3_concat_small_undelayed_array(2119-1 downto 2104),
            core_3_concat_small_delayed_array(2119-1 downto 2104),

            -- like this: yo_1
            signal_core_3_yo_24(0)
        );
    core_3_KPU_25 : entity work.conv1_core3_KPU25
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_3_kpu_25_input_1(0), --	sfix(1, -12)
            core_3_kpu_25_input_2(0), --	sfix(1, -12)
            core_3_kpu_25_input_3(0), --	sfix(1, -12)
            core_3_kpu_25_input_4(0), --	sfix(1, -12)
            core_3_kpu_25_input_5(0), --	sfix(1, -12)
            core_3_kpu_25_input_6(0), --	sfix(1, -12)
            core_3_kpu_25_input_7(0), --	sfix(1, -12)
            core_3_kpu_25_input_8(0), --	sfix(1, -12)
            core_3_kpu_25_input_9(0), --	sfix(1, -12)

        
            core_3_concat_big_undelayed_array(742-1 downto 729),
            core_3_concat_big_delayed_array(742-1 downto 729),
            core_3_concat_big_undelayed_array(755-1 downto 742),
            core_3_concat_big_delayed_array(755-1 downto 742),

        
            core_3_concat_small_undelayed_array(2132-1 downto 2119),
            core_3_concat_small_delayed_array(2132-1 downto 2119),
            core_3_concat_small_undelayed_array(2145-1 downto 2132),
            core_3_concat_small_delayed_array(2145-1 downto 2132),
            core_3_concat_small_undelayed_array(2158-1 downto 2145),
            core_3_concat_small_delayed_array(2158-1 downto 2145),
            core_3_concat_small_undelayed_array(2171-1 downto 2158),
            core_3_concat_small_delayed_array(2171-1 downto 2158),
            core_3_concat_small_undelayed_array(2184-1 downto 2171),
            core_3_concat_small_delayed_array(2184-1 downto 2171),
            core_3_concat_small_undelayed_array(2197-1 downto 2184),
            core_3_concat_small_delayed_array(2197-1 downto 2184),

            -- like this: yo_1
            signal_core_3_yo_25(0)
        );
    core_3_KPU_26 : entity work.conv1_core3_KPU26
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_3_kpu_26_input_1(0), --	sfix(-2, -12)
            core_3_kpu_26_input_2(0), --	sfix(0, -12)
            core_3_kpu_26_input_3(0), --	sfix(1, -12)
            core_3_kpu_26_input_4(0), --	sfix(-2, -12)
            core_3_kpu_26_input_5(0), --	sfix(0, -12)
            core_3_kpu_26_input_6(0), --	sfix(0, -12)
            core_3_kpu_26_input_7(0), --	sfix(-2, -12)
            core_3_kpu_26_input_8(0), --	sfix(1, -12)
            core_3_kpu_26_input_9(0), --	sfix(0, -12)

        
            core_3_concat_big_undelayed_array(770-1 downto 755),
            core_3_concat_big_delayed_array(770-1 downto 755),
            core_3_concat_big_undelayed_array(786-1 downto 770),
            core_3_concat_big_delayed_array(786-1 downto 770),

        
            core_3_concat_small_undelayed_array(2207-1 downto 2197),
            core_3_concat_small_delayed_array(2207-1 downto 2197),
            core_3_concat_small_undelayed_array(2219-1 downto 2207),
            core_3_concat_small_delayed_array(2219-1 downto 2207),
            core_3_concat_small_undelayed_array(2235-1 downto 2219),
            core_3_concat_small_delayed_array(2235-1 downto 2219),
            core_3_concat_small_undelayed_array(2251-1 downto 2235),
            core_3_concat_small_delayed_array(2251-1 downto 2235),
            core_3_concat_small_undelayed_array(2267-1 downto 2251),
            core_3_concat_small_delayed_array(2267-1 downto 2251),
            core_3_concat_small_undelayed_array(2283-1 downto 2267),
            core_3_concat_small_delayed_array(2283-1 downto 2267),

            -- like this: yo_1
            signal_core_3_yo_26(0)
        );
    core_3_KPU_27 : entity work.conv1_core3_KPU27
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_3_kpu_27_input_1(0), --	sfix(-2, -12)
            core_3_kpu_27_input_2(0), --	sfix(0, -12)
            core_3_kpu_27_input_3(0), --	sfix(0, -12)
            core_3_kpu_27_input_4(0), --	sfix(-2, -12)
            core_3_kpu_27_input_5(0), --	sfix(0, -12)
            core_3_kpu_27_input_6(0), --	sfix(0, -12)
            core_3_kpu_27_input_7(0), --	sfix(1, -12)
            core_3_kpu_27_input_8(0), --	sfix(0, -12)
            core_3_kpu_27_input_9(0), --	sfix(0, -12)

        
            core_3_concat_big_undelayed_array(801-1 downto 786),
            core_3_concat_big_delayed_array(801-1 downto 786),
            core_3_concat_big_undelayed_array(817-1 downto 801),
            core_3_concat_big_delayed_array(817-1 downto 801),

        
            core_3_concat_small_undelayed_array(2293-1 downto 2283),
            core_3_concat_small_delayed_array(2293-1 downto 2283),
            core_3_concat_small_undelayed_array(2305-1 downto 2293),
            core_3_concat_small_delayed_array(2305-1 downto 2293),
            core_3_concat_small_undelayed_array(2321-1 downto 2305),
            core_3_concat_small_delayed_array(2321-1 downto 2305),
            core_3_concat_small_undelayed_array(2337-1 downto 2321),
            core_3_concat_small_delayed_array(2337-1 downto 2321),
            core_3_concat_small_undelayed_array(2353-1 downto 2337),
            core_3_concat_small_delayed_array(2353-1 downto 2337),
            core_3_concat_small_undelayed_array(2369-1 downto 2353),
            core_3_concat_small_delayed_array(2369-1 downto 2353),

            -- like this: yo_1
            signal_core_3_yo_27(0)
        );
    core_3_KPU_28 : entity work.conv1_core3_KPU28
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_3_kpu_28_input_1(0), --	sfix(1, -12)
            core_3_kpu_28_input_2(0), --	sfix(1, -12)
            core_3_kpu_28_input_3(0), --	sfix(1, -12)
            core_3_kpu_28_input_4(0), --	sfix(1, -12)
            core_3_kpu_28_input_5(0), --	sfix(1, -12)
            core_3_kpu_28_input_6(0), --	sfix(1, -12)
            core_3_kpu_28_input_7(0), --	sfix(1, -12)
            core_3_kpu_28_input_8(0), --	sfix(1, -12)
            core_3_kpu_28_input_9(0), --	sfix(1, -12)

        
            core_3_concat_big_undelayed_array(830-1 downto 817),
            core_3_concat_big_delayed_array(830-1 downto 817),
            core_3_concat_big_undelayed_array(843-1 downto 830),
            core_3_concat_big_delayed_array(843-1 downto 830),

        
            core_3_concat_small_undelayed_array(2382-1 downto 2369),
            core_3_concat_small_delayed_array(2382-1 downto 2369),
            core_3_concat_small_undelayed_array(2395-1 downto 2382),
            core_3_concat_small_delayed_array(2395-1 downto 2382),
            core_3_concat_small_undelayed_array(2408-1 downto 2395),
            core_3_concat_small_delayed_array(2408-1 downto 2395),
            core_3_concat_small_undelayed_array(2421-1 downto 2408),
            core_3_concat_small_delayed_array(2421-1 downto 2408),
            core_3_concat_small_undelayed_array(2434-1 downto 2421),
            core_3_concat_small_delayed_array(2434-1 downto 2421),
            core_3_concat_small_undelayed_array(2447-1 downto 2434),
            core_3_concat_small_delayed_array(2447-1 downto 2434),

            -- like this: yo_1
            signal_core_3_yo_28(0)
        );
    core_3_KPU_29 : entity work.conv1_core3_KPU29
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_3_kpu_29_input_1(0), --	sfix(2, -12)
            core_3_kpu_29_input_2(0), --	sfix(2, -12)
            core_3_kpu_29_input_3(0), --	sfix(1, -12)
            core_3_kpu_29_input_4(0), --	sfix(2, -12)
            core_3_kpu_29_input_5(0), --	sfix(1, -12)
            core_3_kpu_29_input_6(0), --	sfix(-2, -12)
            core_3_kpu_29_input_7(0), --	sfix(-1, -12)
            core_3_kpu_29_input_8(0), --	sfix(1, -12)
            core_3_kpu_29_input_9(0), --	sfix(1, -12)

        
            core_3_concat_big_undelayed_array(860-1 downto 843),
            core_3_concat_big_delayed_array(860-1 downto 843),
            core_3_concat_big_undelayed_array(877-1 downto 860),
            core_3_concat_big_delayed_array(877-1 downto 860),

        
            core_3_concat_small_undelayed_array(2461-1 downto 2447),
            core_3_concat_small_delayed_array(2461-1 downto 2447),
            core_3_concat_small_undelayed_array(2477-1 downto 2461),
            core_3_concat_small_delayed_array(2477-1 downto 2461),
            core_3_concat_small_undelayed_array(2494-1 downto 2477),
            core_3_concat_small_delayed_array(2494-1 downto 2477),
            core_3_concat_small_undelayed_array(2511-1 downto 2494),
            core_3_concat_small_delayed_array(2511-1 downto 2494),
            core_3_concat_small_undelayed_array(2528-1 downto 2511),
            core_3_concat_small_delayed_array(2528-1 downto 2511),
            core_3_concat_small_undelayed_array(2545-1 downto 2528),
            core_3_concat_small_delayed_array(2545-1 downto 2528),

            -- like this: yo_1
            signal_core_3_yo_29(0)
        );
    core_3_KPU_30 : entity work.conv1_core3_KPU30
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_3_kpu_30_input_1(0), --	sfix(-1, -12)
            core_3_kpu_30_input_2(0), --	sfix(-1, -12)
            core_3_kpu_30_input_3(0), --	sfix(-2, -12)
            core_3_kpu_30_input_4(0), --	sfix(0, -12)
            core_3_kpu_30_input_5(0), --	sfix(0, -12)
            core_3_kpu_30_input_6(0), --	sfix(-2, -12)
            core_3_kpu_30_input_7(0), --	sfix(-2, -12)
            core_3_kpu_30_input_8(0), --	sfix(1, -12)
            core_3_kpu_30_input_9(0), --	sfix(1, -12)

        
            core_3_concat_big_undelayed_array(891-1 downto 877),
            core_3_concat_big_delayed_array(891-1 downto 877),
            core_3_concat_big_undelayed_array(906-1 downto 891),
            core_3_concat_big_delayed_array(906-1 downto 891),

        
            core_3_concat_small_undelayed_array(2556-1 downto 2545),
            core_3_concat_small_delayed_array(2556-1 downto 2545),
            core_3_concat_small_undelayed_array(2569-1 downto 2556),
            core_3_concat_small_delayed_array(2569-1 downto 2556),
            core_3_concat_small_undelayed_array(2583-1 downto 2569),
            core_3_concat_small_delayed_array(2583-1 downto 2569),
            core_3_concat_small_undelayed_array(2598-1 downto 2583),
            core_3_concat_small_delayed_array(2598-1 downto 2583),
            core_3_concat_small_undelayed_array(2613-1 downto 2598),
            core_3_concat_small_delayed_array(2613-1 downto 2598),
            core_3_concat_small_undelayed_array(2628-1 downto 2613),
            core_3_concat_small_delayed_array(2628-1 downto 2613),

            -- like this: yo_1
            signal_core_3_yo_30(0)
        );
    core_3_KPU_31 : entity work.conv1_core3_KPU31
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_3_kpu_31_input_1(0), --	sfix(1, -12)
            core_3_kpu_31_input_2(0), --	sfix(1, -12)
            core_3_kpu_31_input_3(0), --	sfix(1, -12)
            core_3_kpu_31_input_4(0), --	sfix(1, -12)
            core_3_kpu_31_input_5(0), --	sfix(1, -12)
            core_3_kpu_31_input_6(0), --	sfix(1, -12)
            core_3_kpu_31_input_7(0), --	sfix(1, -12)
            core_3_kpu_31_input_8(0), --	sfix(1, -12)
            core_3_kpu_31_input_9(0), --	sfix(1, -12)

        
            core_3_concat_big_undelayed_array(919-1 downto 906),
            core_3_concat_big_delayed_array(919-1 downto 906),
            core_3_concat_big_undelayed_array(932-1 downto 919),
            core_3_concat_big_delayed_array(932-1 downto 919),

        
            core_3_concat_small_undelayed_array(2641-1 downto 2628),
            core_3_concat_small_delayed_array(2641-1 downto 2628),
            core_3_concat_small_undelayed_array(2654-1 downto 2641),
            core_3_concat_small_delayed_array(2654-1 downto 2641),
            core_3_concat_small_undelayed_array(2667-1 downto 2654),
            core_3_concat_small_delayed_array(2667-1 downto 2654),
            core_3_concat_small_undelayed_array(2680-1 downto 2667),
            core_3_concat_small_delayed_array(2680-1 downto 2667),
            core_3_concat_small_undelayed_array(2693-1 downto 2680),
            core_3_concat_small_delayed_array(2693-1 downto 2680),
            core_3_concat_small_undelayed_array(2706-1 downto 2693),
            core_3_concat_small_delayed_array(2706-1 downto 2693),

            -- like this: yo_1
            signal_core_3_yo_31(0)
        );
    core_3_KPU_32 : entity work.conv1_core3_KPU32
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_3_kpu_32_input_1(0), --	sfix(-1, -12)
            core_3_kpu_32_input_2(0), --	sfix(1, -12)
            core_3_kpu_32_input_3(0), --	sfix(1, -12)
            core_3_kpu_32_input_4(0), --	sfix(-3, -12)
            core_3_kpu_32_input_5(0), --	sfix(-2, -12)
            core_3_kpu_32_input_6(0), --	sfix(-2, -12)
            core_3_kpu_32_input_7(0), --	sfix(-1, -12)
            core_3_kpu_32_input_8(0), --	sfix(-3, -12)
            core_3_kpu_32_input_9(0), --	sfix(1, -12)

        
            core_3_concat_big_undelayed_array(948-1 downto 932),
            core_3_concat_big_delayed_array(948-1 downto 932),
            core_3_concat_big_undelayed_array(964-1 downto 948),
            core_3_concat_big_delayed_array(964-1 downto 948),

        
            core_3_concat_small_undelayed_array(2717-1 downto 2706),
            core_3_concat_small_delayed_array(2717-1 downto 2706),
            core_3_concat_small_undelayed_array(2730-1 downto 2717),
            core_3_concat_small_delayed_array(2730-1 downto 2717),
            core_3_concat_small_undelayed_array(2746-1 downto 2730),
            core_3_concat_small_delayed_array(2746-1 downto 2730),
            core_3_concat_small_undelayed_array(2762-1 downto 2746),
            core_3_concat_small_delayed_array(2762-1 downto 2746),
            core_3_concat_small_undelayed_array(2778-1 downto 2762),
            core_3_concat_small_delayed_array(2778-1 downto 2762),
            core_3_concat_small_undelayed_array(2794-1 downto 2778),
            core_3_concat_small_delayed_array(2794-1 downto 2778),

            -- like this: yo_1
            signal_core_3_yo_32(0)
        );

-- # # # Stage 3 (if classical conv): Accumulate KPU outputs # # #
-- # # # IN:  signal_core_[]_yo_3
-- # # # OUT: bias_add_input_[32]_signal

-- Add a pipeline step after the KPUs

-- Add a pipeline step
    PL_STEP_2_for_y_is_valid_signal: entity work.Pipe GENERIC MAP(STEPS => KPU_PIPELINE_STEPS) PORT MAP(clk, '1', y_is_valid_signal(2), y_is_valid_signal(3));
    PL_STEP_2_for_buffer_enable_signal: entity work.Pipe GENERIC MAP(STEPS => KPU_PIPELINE_STEPS) PORT MAP(clk, '1', buffer_enable_signal(2), buffer_enable_signal(3));
    PL_STEP_1_for_interleave_counter_signal: entity work.Pipe_Vector GENERIC MAP(STEPS => KPU_PIPELINE_STEPS) PORT MAP(clk, '1', interleave_counter_signal(1), interleave_counter_signal(2));


-- Add a pipeline step
    PL_STEP_3_for_y_is_valid_signal: entity work.Pipe PORT MAP(clk, '1', y_is_valid_signal(3), y_is_valid_signal(4));
    PL_STEP_3_for_buffer_enable_signal: entity work.Pipe PORT MAP(clk, '1', buffer_enable_signal(3), buffer_enable_signal(4));
    PL_STEP_2_for_interleave_counter_signal: entity work.Pipe_Vector PORT MAP(clk, '1', interleave_counter_signal(2), interleave_counter_signal(3));
    PL_STEP_0_for_signal_core_1_yo_1: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_1_yo_1(0), signal_core_1_yo_1(1));
    PL_STEP_0_for_signal_core_1_yo_2: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_1_yo_2(0), signal_core_1_yo_2(1));
    PL_STEP_0_for_signal_core_1_yo_3: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_1_yo_3(0), signal_core_1_yo_3(1));
    PL_STEP_0_for_signal_core_1_yo_4: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_1_yo_4(0), signal_core_1_yo_4(1));
    PL_STEP_0_for_signal_core_1_yo_5: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_1_yo_5(0), signal_core_1_yo_5(1));
    PL_STEP_0_for_signal_core_1_yo_6: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_1_yo_6(0), signal_core_1_yo_6(1));
    PL_STEP_0_for_signal_core_1_yo_7: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_1_yo_7(0), signal_core_1_yo_7(1));
    PL_STEP_0_for_signal_core_1_yo_8: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_1_yo_8(0), signal_core_1_yo_8(1));
    PL_STEP_0_for_signal_core_1_yo_9: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_1_yo_9(0), signal_core_1_yo_9(1));
    PL_STEP_0_for_signal_core_1_yo_10: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_1_yo_10(0), signal_core_1_yo_10(1));
    PL_STEP_0_for_signal_core_1_yo_11: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_1_yo_11(0), signal_core_1_yo_11(1));
    PL_STEP_0_for_signal_core_1_yo_12: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_1_yo_12(0), signal_core_1_yo_12(1));
    PL_STEP_0_for_signal_core_1_yo_13: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_1_yo_13(0), signal_core_1_yo_13(1));
    PL_STEP_0_for_signal_core_1_yo_14: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_1_yo_14(0), signal_core_1_yo_14(1));
    PL_STEP_0_for_signal_core_1_yo_15: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_1_yo_15(0), signal_core_1_yo_15(1));
    PL_STEP_0_for_signal_core_1_yo_16: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_1_yo_16(0), signal_core_1_yo_16(1));
    PL_STEP_0_for_signal_core_1_yo_17: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_1_yo_17(0), signal_core_1_yo_17(1));
    PL_STEP_0_for_signal_core_1_yo_18: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_1_yo_18(0), signal_core_1_yo_18(1));
    PL_STEP_0_for_signal_core_1_yo_19: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_1_yo_19(0), signal_core_1_yo_19(1));
    PL_STEP_0_for_signal_core_1_yo_20: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_1_yo_20(0), signal_core_1_yo_20(1));
    PL_STEP_0_for_signal_core_1_yo_21: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_1_yo_21(0), signal_core_1_yo_21(1));
    PL_STEP_0_for_signal_core_1_yo_22: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_1_yo_22(0), signal_core_1_yo_22(1));
    PL_STEP_0_for_signal_core_1_yo_23: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_1_yo_23(0), signal_core_1_yo_23(1));
    PL_STEP_0_for_signal_core_1_yo_24: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_1_yo_24(0), signal_core_1_yo_24(1));
    PL_STEP_0_for_signal_core_1_yo_25: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_1_yo_25(0), signal_core_1_yo_25(1));
    PL_STEP_0_for_signal_core_1_yo_26: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_1_yo_26(0), signal_core_1_yo_26(1));
    PL_STEP_0_for_signal_core_1_yo_27: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_1_yo_27(0), signal_core_1_yo_27(1));
    PL_STEP_0_for_signal_core_1_yo_28: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_1_yo_28(0), signal_core_1_yo_28(1));
    PL_STEP_0_for_signal_core_1_yo_29: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_1_yo_29(0), signal_core_1_yo_29(1));
    PL_STEP_0_for_signal_core_1_yo_30: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_1_yo_30(0), signal_core_1_yo_30(1));
    PL_STEP_0_for_signal_core_1_yo_31: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_1_yo_31(0), signal_core_1_yo_31(1));
    PL_STEP_0_for_signal_core_1_yo_32: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_1_yo_32(0), signal_core_1_yo_32(1));
    PL_STEP_0_for_signal_core_2_yo_1: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_2_yo_1(0), signal_core_2_yo_1(1));
    PL_STEP_0_for_signal_core_2_yo_2: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_2_yo_2(0), signal_core_2_yo_2(1));
    PL_STEP_0_for_signal_core_2_yo_3: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_2_yo_3(0), signal_core_2_yo_3(1));
    PL_STEP_0_for_signal_core_2_yo_4: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_2_yo_4(0), signal_core_2_yo_4(1));
    PL_STEP_0_for_signal_core_2_yo_5: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_2_yo_5(0), signal_core_2_yo_5(1));
    PL_STEP_0_for_signal_core_2_yo_6: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_2_yo_6(0), signal_core_2_yo_6(1));
    PL_STEP_0_for_signal_core_2_yo_7: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_2_yo_7(0), signal_core_2_yo_7(1));
    PL_STEP_0_for_signal_core_2_yo_8: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_2_yo_8(0), signal_core_2_yo_8(1));
    PL_STEP_0_for_signal_core_2_yo_9: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_2_yo_9(0), signal_core_2_yo_9(1));
    PL_STEP_0_for_signal_core_2_yo_10: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_2_yo_10(0), signal_core_2_yo_10(1));
    PL_STEP_0_for_signal_core_2_yo_11: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_2_yo_11(0), signal_core_2_yo_11(1));
    PL_STEP_0_for_signal_core_2_yo_12: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_2_yo_12(0), signal_core_2_yo_12(1));
    PL_STEP_0_for_signal_core_2_yo_13: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_2_yo_13(0), signal_core_2_yo_13(1));
    PL_STEP_0_for_signal_core_2_yo_14: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_2_yo_14(0), signal_core_2_yo_14(1));
    PL_STEP_0_for_signal_core_2_yo_15: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_2_yo_15(0), signal_core_2_yo_15(1));
    PL_STEP_0_for_signal_core_2_yo_16: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_2_yo_16(0), signal_core_2_yo_16(1));
    PL_STEP_0_for_signal_core_2_yo_17: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_2_yo_17(0), signal_core_2_yo_17(1));
    PL_STEP_0_for_signal_core_2_yo_18: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_2_yo_18(0), signal_core_2_yo_18(1));
    PL_STEP_0_for_signal_core_2_yo_19: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_2_yo_19(0), signal_core_2_yo_19(1));
    PL_STEP_0_for_signal_core_2_yo_20: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_2_yo_20(0), signal_core_2_yo_20(1));
    PL_STEP_0_for_signal_core_2_yo_21: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_2_yo_21(0), signal_core_2_yo_21(1));
    PL_STEP_0_for_signal_core_2_yo_22: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_2_yo_22(0), signal_core_2_yo_22(1));
    PL_STEP_0_for_signal_core_2_yo_23: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_2_yo_23(0), signal_core_2_yo_23(1));
    PL_STEP_0_for_signal_core_2_yo_24: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_2_yo_24(0), signal_core_2_yo_24(1));
    PL_STEP_0_for_signal_core_2_yo_25: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_2_yo_25(0), signal_core_2_yo_25(1));
    PL_STEP_0_for_signal_core_2_yo_26: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_2_yo_26(0), signal_core_2_yo_26(1));
    PL_STEP_0_for_signal_core_2_yo_27: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_2_yo_27(0), signal_core_2_yo_27(1));
    PL_STEP_0_for_signal_core_2_yo_28: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_2_yo_28(0), signal_core_2_yo_28(1));
    PL_STEP_0_for_signal_core_2_yo_29: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_2_yo_29(0), signal_core_2_yo_29(1));
    PL_STEP_0_for_signal_core_2_yo_30: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_2_yo_30(0), signal_core_2_yo_30(1));
    PL_STEP_0_for_signal_core_2_yo_31: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_2_yo_31(0), signal_core_2_yo_31(1));
    PL_STEP_0_for_signal_core_2_yo_32: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_2_yo_32(0), signal_core_2_yo_32(1));
    PL_STEP_0_for_signal_core_3_yo_1: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_3_yo_1(0), signal_core_3_yo_1(1));
    PL_STEP_0_for_signal_core_3_yo_2: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_3_yo_2(0), signal_core_3_yo_2(1));
    PL_STEP_0_for_signal_core_3_yo_3: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_3_yo_3(0), signal_core_3_yo_3(1));
    PL_STEP_0_for_signal_core_3_yo_4: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_3_yo_4(0), signal_core_3_yo_4(1));
    PL_STEP_0_for_signal_core_3_yo_5: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_3_yo_5(0), signal_core_3_yo_5(1));
    PL_STEP_0_for_signal_core_3_yo_6: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_3_yo_6(0), signal_core_3_yo_6(1));
    PL_STEP_0_for_signal_core_3_yo_7: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_3_yo_7(0), signal_core_3_yo_7(1));
    PL_STEP_0_for_signal_core_3_yo_8: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_3_yo_8(0), signal_core_3_yo_8(1));
    PL_STEP_0_for_signal_core_3_yo_9: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_3_yo_9(0), signal_core_3_yo_9(1));
    PL_STEP_0_for_signal_core_3_yo_10: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_3_yo_10(0), signal_core_3_yo_10(1));
    PL_STEP_0_for_signal_core_3_yo_11: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_3_yo_11(0), signal_core_3_yo_11(1));
    PL_STEP_0_for_signal_core_3_yo_12: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_3_yo_12(0), signal_core_3_yo_12(1));
    PL_STEP_0_for_signal_core_3_yo_13: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_3_yo_13(0), signal_core_3_yo_13(1));
    PL_STEP_0_for_signal_core_3_yo_14: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_3_yo_14(0), signal_core_3_yo_14(1));
    PL_STEP_0_for_signal_core_3_yo_15: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_3_yo_15(0), signal_core_3_yo_15(1));
    PL_STEP_0_for_signal_core_3_yo_16: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_3_yo_16(0), signal_core_3_yo_16(1));
    PL_STEP_0_for_signal_core_3_yo_17: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_3_yo_17(0), signal_core_3_yo_17(1));
    PL_STEP_0_for_signal_core_3_yo_18: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_3_yo_18(0), signal_core_3_yo_18(1));
    PL_STEP_0_for_signal_core_3_yo_19: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_3_yo_19(0), signal_core_3_yo_19(1));
    PL_STEP_0_for_signal_core_3_yo_20: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_3_yo_20(0), signal_core_3_yo_20(1));
    PL_STEP_0_for_signal_core_3_yo_21: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_3_yo_21(0), signal_core_3_yo_21(1));
    PL_STEP_0_for_signal_core_3_yo_22: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_3_yo_22(0), signal_core_3_yo_22(1));
    PL_STEP_0_for_signal_core_3_yo_23: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_3_yo_23(0), signal_core_3_yo_23(1));
    PL_STEP_0_for_signal_core_3_yo_24: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_3_yo_24(0), signal_core_3_yo_24(1));
    PL_STEP_0_for_signal_core_3_yo_25: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_3_yo_25(0), signal_core_3_yo_25(1));
    PL_STEP_0_for_signal_core_3_yo_26: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_3_yo_26(0), signal_core_3_yo_26(1));
    PL_STEP_0_for_signal_core_3_yo_27: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_3_yo_27(0), signal_core_3_yo_27(1));
    PL_STEP_0_for_signal_core_3_yo_28: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_3_yo_28(0), signal_core_3_yo_28(1));
    PL_STEP_0_for_signal_core_3_yo_29: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_3_yo_29(0), signal_core_3_yo_29(1));
    PL_STEP_0_for_signal_core_3_yo_30: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_3_yo_30(0), signal_core_3_yo_30(1));
    PL_STEP_0_for_signal_core_3_yo_31: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_3_yo_31(0), signal_core_3_yo_31(1));
    PL_STEP_0_for_signal_core_3_yo_32: entity work.Pipe_Vector PORT MAP(clk, '1', signal_core_3_yo_32(0), signal_core_3_yo_32(1));

    -- Accumulate all KPUs together (This is only done in a classical conv layer. Depthwise layers do not have this)
    accumulator_for_yo_1 : entity work.conv1_accumulator1
        generic map(PIPELINE_STEPS => ACCU_PIPELINE_STEPS)
        port map
        (
            clk,
            reset,

            interleave_counter_signal(3),
            buffer_enable_signal(4),
            signal_core_1_yo_1(1),
            signal_core_2_yo_1(1),
            signal_core_3_yo_1(1),

            accu_1_signal(0) -- goes to bias_add_input_1_signal
        );

    accumulator_for_yo_2 : entity work.conv1_accumulator2
        generic map(PIPELINE_STEPS => ACCU_PIPELINE_STEPS)
        port map
        (
            clk,
            reset,

            interleave_counter_signal(3),
            buffer_enable_signal(4),
            signal_core_1_yo_2(1),
            signal_core_2_yo_2(1),
            signal_core_3_yo_2(1),

            accu_2_signal(0) -- goes to bias_add_input_2_signal
        );

    accumulator_for_yo_3 : entity work.conv1_accumulator3
        generic map(PIPELINE_STEPS => ACCU_PIPELINE_STEPS)
        port map
        (
            clk,
            reset,

            interleave_counter_signal(3),
            buffer_enable_signal(4),
            signal_core_1_yo_3(1),
            signal_core_2_yo_3(1),
            signal_core_3_yo_3(1),

            accu_3_signal(0) -- goes to bias_add_input_3_signal
        );

    accumulator_for_yo_4 : entity work.conv1_accumulator4
        generic map(PIPELINE_STEPS => ACCU_PIPELINE_STEPS)
        port map
        (
            clk,
            reset,

            interleave_counter_signal(3),
            buffer_enable_signal(4),
            signal_core_1_yo_4(1),
            signal_core_2_yo_4(1),
            signal_core_3_yo_4(1),

            accu_4_signal(0) -- goes to bias_add_input_4_signal
        );

    accumulator_for_yo_5 : entity work.conv1_accumulator5
        generic map(PIPELINE_STEPS => ACCU_PIPELINE_STEPS)
        port map
        (
            clk,
            reset,

            interleave_counter_signal(3),
            buffer_enable_signal(4),
            signal_core_1_yo_5(1),
            signal_core_2_yo_5(1),
            signal_core_3_yo_5(1),

            accu_5_signal(0) -- goes to bias_add_input_5_signal
        );

    accumulator_for_yo_6 : entity work.conv1_accumulator6
        generic map(PIPELINE_STEPS => ACCU_PIPELINE_STEPS)
        port map
        (
            clk,
            reset,

            interleave_counter_signal(3),
            buffer_enable_signal(4),
            signal_core_1_yo_6(1),
            signal_core_2_yo_6(1),
            signal_core_3_yo_6(1),

            accu_6_signal(0) -- goes to bias_add_input_6_signal
        );

    accumulator_for_yo_7 : entity work.conv1_accumulator7
        generic map(PIPELINE_STEPS => ACCU_PIPELINE_STEPS)
        port map
        (
            clk,
            reset,

            interleave_counter_signal(3),
            buffer_enable_signal(4),
            signal_core_1_yo_7(1),
            signal_core_2_yo_7(1),
            signal_core_3_yo_7(1),

            accu_7_signal(0) -- goes to bias_add_input_7_signal
        );

    accumulator_for_yo_8 : entity work.conv1_accumulator8
        generic map(PIPELINE_STEPS => ACCU_PIPELINE_STEPS)
        port map
        (
            clk,
            reset,

            interleave_counter_signal(3),
            buffer_enable_signal(4),
            signal_core_1_yo_8(1),
            signal_core_2_yo_8(1),
            signal_core_3_yo_8(1),

            accu_8_signal(0) -- goes to bias_add_input_8_signal
        );

    accumulator_for_yo_9 : entity work.conv1_accumulator9
        generic map(PIPELINE_STEPS => ACCU_PIPELINE_STEPS)
        port map
        (
            clk,
            reset,

            interleave_counter_signal(3),
            buffer_enable_signal(4),
            signal_core_1_yo_9(1),
            signal_core_2_yo_9(1),
            signal_core_3_yo_9(1),

            accu_9_signal(0) -- goes to bias_add_input_9_signal
        );

    accumulator_for_yo_10 : entity work.conv1_accumulator10
        generic map(PIPELINE_STEPS => ACCU_PIPELINE_STEPS)
        port map
        (
            clk,
            reset,

            interleave_counter_signal(3),
            buffer_enable_signal(4),
            signal_core_1_yo_10(1),
            signal_core_2_yo_10(1),
            signal_core_3_yo_10(1),

            accu_10_signal(0) -- goes to bias_add_input_10_signal
        );

    accumulator_for_yo_11 : entity work.conv1_accumulator11
        generic map(PIPELINE_STEPS => ACCU_PIPELINE_STEPS)
        port map
        (
            clk,
            reset,

            interleave_counter_signal(3),
            buffer_enable_signal(4),
            signal_core_1_yo_11(1),
            signal_core_2_yo_11(1),
            signal_core_3_yo_11(1),

            accu_11_signal(0) -- goes to bias_add_input_11_signal
        );

    accumulator_for_yo_12 : entity work.conv1_accumulator12
        generic map(PIPELINE_STEPS => ACCU_PIPELINE_STEPS)
        port map
        (
            clk,
            reset,

            interleave_counter_signal(3),
            buffer_enable_signal(4),
            signal_core_1_yo_12(1),
            signal_core_2_yo_12(1),
            signal_core_3_yo_12(1),

            accu_12_signal(0) -- goes to bias_add_input_12_signal
        );

    accumulator_for_yo_13 : entity work.conv1_accumulator13
        generic map(PIPELINE_STEPS => ACCU_PIPELINE_STEPS)
        port map
        (
            clk,
            reset,

            interleave_counter_signal(3),
            buffer_enable_signal(4),
            signal_core_1_yo_13(1),
            signal_core_2_yo_13(1),
            signal_core_3_yo_13(1),

            accu_13_signal(0) -- goes to bias_add_input_13_signal
        );

    accumulator_for_yo_14 : entity work.conv1_accumulator14
        generic map(PIPELINE_STEPS => ACCU_PIPELINE_STEPS)
        port map
        (
            clk,
            reset,

            interleave_counter_signal(3),
            buffer_enable_signal(4),
            signal_core_1_yo_14(1),
            signal_core_2_yo_14(1),
            signal_core_3_yo_14(1),

            accu_14_signal(0) -- goes to bias_add_input_14_signal
        );

    accumulator_for_yo_15 : entity work.conv1_accumulator15
        generic map(PIPELINE_STEPS => ACCU_PIPELINE_STEPS)
        port map
        (
            clk,
            reset,

            interleave_counter_signal(3),
            buffer_enable_signal(4),
            signal_core_1_yo_15(1),
            signal_core_2_yo_15(1),
            signal_core_3_yo_15(1),

            accu_15_signal(0) -- goes to bias_add_input_15_signal
        );

    accumulator_for_yo_16 : entity work.conv1_accumulator16
        generic map(PIPELINE_STEPS => ACCU_PIPELINE_STEPS)
        port map
        (
            clk,
            reset,

            interleave_counter_signal(3),
            buffer_enable_signal(4),
            signal_core_1_yo_16(1),
            signal_core_2_yo_16(1),
            signal_core_3_yo_16(1),

            accu_16_signal(0) -- goes to bias_add_input_16_signal
        );

    accumulator_for_yo_17 : entity work.conv1_accumulator17
        generic map(PIPELINE_STEPS => ACCU_PIPELINE_STEPS)
        port map
        (
            clk,
            reset,

            interleave_counter_signal(3),
            buffer_enable_signal(4),
            signal_core_1_yo_17(1),
            signal_core_2_yo_17(1),
            signal_core_3_yo_17(1),

            accu_17_signal(0) -- goes to bias_add_input_17_signal
        );

    accumulator_for_yo_18 : entity work.conv1_accumulator18
        generic map(PIPELINE_STEPS => ACCU_PIPELINE_STEPS)
        port map
        (
            clk,
            reset,

            interleave_counter_signal(3),
            buffer_enable_signal(4),
            signal_core_1_yo_18(1),
            signal_core_2_yo_18(1),
            signal_core_3_yo_18(1),

            accu_18_signal(0) -- goes to bias_add_input_18_signal
        );

    accumulator_for_yo_19 : entity work.conv1_accumulator19
        generic map(PIPELINE_STEPS => ACCU_PIPELINE_STEPS)
        port map
        (
            clk,
            reset,

            interleave_counter_signal(3),
            buffer_enable_signal(4),
            signal_core_1_yo_19(1),
            signal_core_2_yo_19(1),
            signal_core_3_yo_19(1),

            accu_19_signal(0) -- goes to bias_add_input_19_signal
        );

    accumulator_for_yo_20 : entity work.conv1_accumulator20
        generic map(PIPELINE_STEPS => ACCU_PIPELINE_STEPS)
        port map
        (
            clk,
            reset,

            interleave_counter_signal(3),
            buffer_enable_signal(4),
            signal_core_1_yo_20(1),
            signal_core_2_yo_20(1),
            signal_core_3_yo_20(1),

            accu_20_signal(0) -- goes to bias_add_input_20_signal
        );

    accumulator_for_yo_21 : entity work.conv1_accumulator21
        generic map(PIPELINE_STEPS => ACCU_PIPELINE_STEPS)
        port map
        (
            clk,
            reset,

            interleave_counter_signal(3),
            buffer_enable_signal(4),
            signal_core_1_yo_21(1),
            signal_core_2_yo_21(1),
            signal_core_3_yo_21(1),

            accu_21_signal(0) -- goes to bias_add_input_21_signal
        );

    accumulator_for_yo_22 : entity work.conv1_accumulator22
        generic map(PIPELINE_STEPS => ACCU_PIPELINE_STEPS)
        port map
        (
            clk,
            reset,

            interleave_counter_signal(3),
            buffer_enable_signal(4),
            signal_core_1_yo_22(1),
            signal_core_2_yo_22(1),
            signal_core_3_yo_22(1),

            accu_22_signal(0) -- goes to bias_add_input_22_signal
        );

    accumulator_for_yo_23 : entity work.conv1_accumulator23
        generic map(PIPELINE_STEPS => ACCU_PIPELINE_STEPS)
        port map
        (
            clk,
            reset,

            interleave_counter_signal(3),
            buffer_enable_signal(4),
            signal_core_1_yo_23(1),
            signal_core_2_yo_23(1),
            signal_core_3_yo_23(1),

            accu_23_signal(0) -- goes to bias_add_input_23_signal
        );

    accumulator_for_yo_24 : entity work.conv1_accumulator24
        generic map(PIPELINE_STEPS => ACCU_PIPELINE_STEPS)
        port map
        (
            clk,
            reset,

            interleave_counter_signal(3),
            buffer_enable_signal(4),
            signal_core_1_yo_24(1),
            signal_core_2_yo_24(1),
            signal_core_3_yo_24(1),

            accu_24_signal(0) -- goes to bias_add_input_24_signal
        );

    accumulator_for_yo_25 : entity work.conv1_accumulator25
        generic map(PIPELINE_STEPS => ACCU_PIPELINE_STEPS)
        port map
        (
            clk,
            reset,

            interleave_counter_signal(3),
            buffer_enable_signal(4),
            signal_core_1_yo_25(1),
            signal_core_2_yo_25(1),
            signal_core_3_yo_25(1),

            accu_25_signal(0) -- goes to bias_add_input_25_signal
        );

    accumulator_for_yo_26 : entity work.conv1_accumulator26
        generic map(PIPELINE_STEPS => ACCU_PIPELINE_STEPS)
        port map
        (
            clk,
            reset,

            interleave_counter_signal(3),
            buffer_enable_signal(4),
            signal_core_1_yo_26(1),
            signal_core_2_yo_26(1),
            signal_core_3_yo_26(1),

            accu_26_signal(0) -- goes to bias_add_input_26_signal
        );

    accumulator_for_yo_27 : entity work.conv1_accumulator27
        generic map(PIPELINE_STEPS => ACCU_PIPELINE_STEPS)
        port map
        (
            clk,
            reset,

            interleave_counter_signal(3),
            buffer_enable_signal(4),
            signal_core_1_yo_27(1),
            signal_core_2_yo_27(1),
            signal_core_3_yo_27(1),

            accu_27_signal(0) -- goes to bias_add_input_27_signal
        );

    accumulator_for_yo_28 : entity work.conv1_accumulator28
        generic map(PIPELINE_STEPS => ACCU_PIPELINE_STEPS)
        port map
        (
            clk,
            reset,

            interleave_counter_signal(3),
            buffer_enable_signal(4),
            signal_core_1_yo_28(1),
            signal_core_2_yo_28(1),
            signal_core_3_yo_28(1),

            accu_28_signal(0) -- goes to bias_add_input_28_signal
        );

    accumulator_for_yo_29 : entity work.conv1_accumulator29
        generic map(PIPELINE_STEPS => ACCU_PIPELINE_STEPS)
        port map
        (
            clk,
            reset,

            interleave_counter_signal(3),
            buffer_enable_signal(4),
            signal_core_1_yo_29(1),
            signal_core_2_yo_29(1),
            signal_core_3_yo_29(1),

            accu_29_signal(0) -- goes to bias_add_input_29_signal
        );

    accumulator_for_yo_30 : entity work.conv1_accumulator30
        generic map(PIPELINE_STEPS => ACCU_PIPELINE_STEPS)
        port map
        (
            clk,
            reset,

            interleave_counter_signal(3),
            buffer_enable_signal(4),
            signal_core_1_yo_30(1),
            signal_core_2_yo_30(1),
            signal_core_3_yo_30(1),

            accu_30_signal(0) -- goes to bias_add_input_30_signal
        );

    accumulator_for_yo_31 : entity work.conv1_accumulator31
        generic map(PIPELINE_STEPS => ACCU_PIPELINE_STEPS)
        port map
        (
            clk,
            reset,

            interleave_counter_signal(3),
            buffer_enable_signal(4),
            signal_core_1_yo_31(1),
            signal_core_2_yo_31(1),
            signal_core_3_yo_31(1),

            accu_31_signal(0) -- goes to bias_add_input_31_signal
        );

    accumulator_for_yo_32 : entity work.conv1_accumulator32
        generic map(PIPELINE_STEPS => ACCU_PIPELINE_STEPS)
        port map
        (
            clk,
            reset,

            interleave_counter_signal(3),
            buffer_enable_signal(4),
            signal_core_1_yo_32(1),
            signal_core_2_yo_32(1),
            signal_core_3_yo_32(1),

            accu_32_signal(0) -- goes to bias_add_input_32_signal
        );


    -- Reshape all the outputs, so they are all the same shape
    Reshape_for_adder_1_input_sum: entity work.FxPReshape
        generic map (
            XI_MSB => 3, XI_LSB => -12,
            YO_MSB => 10, YO_LSB => -12 )
        port map ( accu_1_signal(0), bias_add_input_1_signal(0) );

    Reshape_for_adder_2_input_sum: entity work.FxPReshape
        generic map (
            XI_MSB => 5, XI_LSB => -12,
            YO_MSB => 10, YO_LSB => -12 )
        port map ( accu_2_signal(0), bias_add_input_2_signal(0) );

    Reshape_for_adder_3_input_sum: entity work.FxPReshape
        generic map (
            XI_MSB => 7, XI_LSB => -12,
            YO_MSB => 10, YO_LSB => -12 )
        port map ( accu_3_signal(0), bias_add_input_3_signal(0) );

    Reshape_for_adder_4_input_sum: entity work.FxPReshape
        generic map (
            XI_MSB => 3, XI_LSB => -12,
            YO_MSB => 10, YO_LSB => -12 )
        port map ( accu_4_signal(0), bias_add_input_4_signal(0) );

    Reshape_for_adder_5_input_sum: entity work.FxPReshape
        generic map (
            XI_MSB => 10, XI_LSB => -12,
            YO_MSB => 10, YO_LSB => -12 )
        port map ( accu_5_signal(0), bias_add_input_5_signal(0) );

    Reshape_for_adder_6_input_sum: entity work.FxPReshape
        generic map (
            XI_MSB => 9, XI_LSB => -12,
            YO_MSB => 10, YO_LSB => -12 )
        port map ( accu_6_signal(0), bias_add_input_6_signal(0) );

    Reshape_for_adder_7_input_sum: entity work.FxPReshape
        generic map (
            XI_MSB => 6, XI_LSB => -12,
            YO_MSB => 10, YO_LSB => -12 )
        port map ( accu_7_signal(0), bias_add_input_7_signal(0) );

    Reshape_for_adder_8_input_sum: entity work.FxPReshape
        generic map (
            XI_MSB => 6, XI_LSB => -12,
            YO_MSB => 10, YO_LSB => -12 )
        port map ( accu_8_signal(0), bias_add_input_8_signal(0) );

    Reshape_for_adder_9_input_sum: entity work.FxPReshape
        generic map (
            XI_MSB => 3, XI_LSB => -12,
            YO_MSB => 10, YO_LSB => -12 )
        port map ( accu_9_signal(0), bias_add_input_9_signal(0) );

    Reshape_for_adder_10_input_sum: entity work.FxPReshape
        generic map (
            XI_MSB => 3, XI_LSB => -12,
            YO_MSB => 10, YO_LSB => -12 )
        port map ( accu_10_signal(0), bias_add_input_10_signal(0) );

    Reshape_for_adder_11_input_sum: entity work.FxPReshape
        generic map (
            XI_MSB => 3, XI_LSB => -12,
            YO_MSB => 10, YO_LSB => -12 )
        port map ( accu_11_signal(0), bias_add_input_11_signal(0) );

    Reshape_for_adder_12_input_sum: entity work.FxPReshape
        generic map (
            XI_MSB => 9, XI_LSB => -12,
            YO_MSB => 10, YO_LSB => -12 )
        port map ( accu_12_signal(0), bias_add_input_12_signal(0) );

    Reshape_for_adder_13_input_sum: entity work.FxPReshape
        generic map (
            XI_MSB => 8, XI_LSB => -12,
            YO_MSB => 10, YO_LSB => -12 )
        port map ( accu_13_signal(0), bias_add_input_13_signal(0) );

    Reshape_for_adder_14_input_sum: entity work.FxPReshape
        generic map (
            XI_MSB => 7, XI_LSB => -12,
            YO_MSB => 10, YO_LSB => -12 )
        port map ( accu_14_signal(0), bias_add_input_14_signal(0) );

    Reshape_for_adder_15_input_sum: entity work.FxPReshape
        generic map (
            XI_MSB => 3, XI_LSB => -12,
            YO_MSB => 10, YO_LSB => -12 )
        port map ( accu_15_signal(0), bias_add_input_15_signal(0) );

    Reshape_for_adder_16_input_sum: entity work.FxPReshape
        generic map (
            XI_MSB => 7, XI_LSB => -12,
            YO_MSB => 10, YO_LSB => -12 )
        port map ( accu_16_signal(0), bias_add_input_16_signal(0) );

    Reshape_for_adder_17_input_sum: entity work.FxPReshape
        generic map (
            XI_MSB => 7, XI_LSB => -12,
            YO_MSB => 10, YO_LSB => -12 )
        port map ( accu_17_signal(0), bias_add_input_17_signal(0) );

    Reshape_for_adder_18_input_sum: entity work.FxPReshape
        generic map (
            XI_MSB => 8, XI_LSB => -12,
            YO_MSB => 10, YO_LSB => -12 )
        port map ( accu_18_signal(0), bias_add_input_18_signal(0) );

    Reshape_for_adder_19_input_sum: entity work.FxPReshape
        generic map (
            XI_MSB => 9, XI_LSB => -12,
            YO_MSB => 10, YO_LSB => -12 )
        port map ( accu_19_signal(0), bias_add_input_19_signal(0) );

    Reshape_for_adder_20_input_sum: entity work.FxPReshape
        generic map (
            XI_MSB => 7, XI_LSB => -12,
            YO_MSB => 10, YO_LSB => -12 )
        port map ( accu_20_signal(0), bias_add_input_20_signal(0) );

    Reshape_for_adder_21_input_sum: entity work.FxPReshape
        generic map (
            XI_MSB => 3, XI_LSB => -12,
            YO_MSB => 10, YO_LSB => -12 )
        port map ( accu_21_signal(0), bias_add_input_21_signal(0) );

    Reshape_for_adder_22_input_sum: entity work.FxPReshape
        generic map (
            XI_MSB => 8, XI_LSB => -12,
            YO_MSB => 10, YO_LSB => -12 )
        port map ( accu_22_signal(0), bias_add_input_22_signal(0) );

    Reshape_for_adder_23_input_sum: entity work.FxPReshape
        generic map (
            XI_MSB => 3, XI_LSB => -12,
            YO_MSB => 10, YO_LSB => -12 )
        port map ( accu_23_signal(0), bias_add_input_23_signal(0) );

    Reshape_for_adder_24_input_sum: entity work.FxPReshape
        generic map (
            XI_MSB => 6, XI_LSB => -12,
            YO_MSB => 10, YO_LSB => -12 )
        port map ( accu_24_signal(0), bias_add_input_24_signal(0) );

    Reshape_for_adder_25_input_sum: entity work.FxPReshape
        generic map (
            XI_MSB => 3, XI_LSB => -12,
            YO_MSB => 10, YO_LSB => -12 )
        port map ( accu_25_signal(0), bias_add_input_25_signal(0) );

    Reshape_for_adder_26_input_sum: entity work.FxPReshape
        generic map (
            XI_MSB => 7, XI_LSB => -12,
            YO_MSB => 10, YO_LSB => -12 )
        port map ( accu_26_signal(0), bias_add_input_26_signal(0) );

    Reshape_for_adder_27_input_sum: entity work.FxPReshape
        generic map (
            XI_MSB => 7, XI_LSB => -12,
            YO_MSB => 10, YO_LSB => -12 )
        port map ( accu_27_signal(0), bias_add_input_27_signal(0) );

    Reshape_for_adder_28_input_sum: entity work.FxPReshape
        generic map (
            XI_MSB => 3, XI_LSB => -12,
            YO_MSB => 10, YO_LSB => -12 )
        port map ( accu_28_signal(0), bias_add_input_28_signal(0) );

    Reshape_for_adder_29_input_sum: entity work.FxPReshape
        generic map (
            XI_MSB => 9, XI_LSB => -12,
            YO_MSB => 10, YO_LSB => -12 )
        port map ( accu_29_signal(0), bias_add_input_29_signal(0) );

    Reshape_for_adder_30_input_sum: entity work.FxPReshape
        generic map (
            XI_MSB => 6, XI_LSB => -12,
            YO_MSB => 10, YO_LSB => -12 )
        port map ( accu_30_signal(0), bias_add_input_30_signal(0) );

    Reshape_for_adder_31_input_sum: entity work.FxPReshape
        generic map (
            XI_MSB => 3, XI_LSB => -12,
            YO_MSB => 10, YO_LSB => -12 )
        port map ( accu_31_signal(0), bias_add_input_31_signal(0) );

    Reshape_for_adder_32_input_sum: entity work.FxPReshape
        generic map (
            XI_MSB => 7, XI_LSB => -12,
            YO_MSB => 10, YO_LSB => -12 )
        port map ( accu_32_signal(0), bias_add_input_32_signal(0) );


-- # # # Stage 4 (optional): Add the bias # # #
-- # # # IN:  bias_add_input_[32]_signal
-- # # # OUT: layer_yo_[32]_pre

-- Delay the signals because of the pipelined accumulator.
-- Add a pipeline step
    PL_STEP_4_for_y_is_valid_signal: entity work.Pipe GENERIC MAP(STEPS => ACCU_PIPELINE_STEPS) PORT MAP(clk, '1', y_is_valid_signal(4), y_is_valid_signal(5));
    PL_STEP_4_for_buffer_enable_signal: entity work.Pipe GENERIC MAP(STEPS => ACCU_PIPELINE_STEPS) PORT MAP(clk, '1', buffer_enable_signal(4), buffer_enable_signal(5));


-- Add a pipeline step after the accumulator
     -- This is always needed. The rom memory enforces this.
    -- Add a pipeline step
    PL_STEP_5_for_y_is_valid_signal: entity work.Pipe PORT MAP(clk, '1', y_is_valid_signal(5), y_is_valid_signal(6));
    PL_STEP_5_for_buffer_enable_signal: entity work.Pipe PORT MAP(clk, '1', buffer_enable_signal(5), buffer_enable_signal(6));
    PL_STEP_0_for_bias_add_input_1_signal: entity work.Pipe_Vector PORT MAP(clk, '1', bias_add_input_1_signal(0), bias_add_input_1_signal(1));
    PL_STEP_0_for_bias_add_input_2_signal: entity work.Pipe_Vector PORT MAP(clk, '1', bias_add_input_2_signal(0), bias_add_input_2_signal(1));
    PL_STEP_0_for_bias_add_input_3_signal: entity work.Pipe_Vector PORT MAP(clk, '1', bias_add_input_3_signal(0), bias_add_input_3_signal(1));
    PL_STEP_0_for_bias_add_input_4_signal: entity work.Pipe_Vector PORT MAP(clk, '1', bias_add_input_4_signal(0), bias_add_input_4_signal(1));
    PL_STEP_0_for_bias_add_input_5_signal: entity work.Pipe_Vector PORT MAP(clk, '1', bias_add_input_5_signal(0), bias_add_input_5_signal(1));
    PL_STEP_0_for_bias_add_input_6_signal: entity work.Pipe_Vector PORT MAP(clk, '1', bias_add_input_6_signal(0), bias_add_input_6_signal(1));
    PL_STEP_0_for_bias_add_input_7_signal: entity work.Pipe_Vector PORT MAP(clk, '1', bias_add_input_7_signal(0), bias_add_input_7_signal(1));
    PL_STEP_0_for_bias_add_input_8_signal: entity work.Pipe_Vector PORT MAP(clk, '1', bias_add_input_8_signal(0), bias_add_input_8_signal(1));
    PL_STEP_0_for_bias_add_input_9_signal: entity work.Pipe_Vector PORT MAP(clk, '1', bias_add_input_9_signal(0), bias_add_input_9_signal(1));
    PL_STEP_0_for_bias_add_input_10_signal: entity work.Pipe_Vector PORT MAP(clk, '1', bias_add_input_10_signal(0), bias_add_input_10_signal(1));
    PL_STEP_0_for_bias_add_input_11_signal: entity work.Pipe_Vector PORT MAP(clk, '1', bias_add_input_11_signal(0), bias_add_input_11_signal(1));
    PL_STEP_0_for_bias_add_input_12_signal: entity work.Pipe_Vector PORT MAP(clk, '1', bias_add_input_12_signal(0), bias_add_input_12_signal(1));
    PL_STEP_0_for_bias_add_input_13_signal: entity work.Pipe_Vector PORT MAP(clk, '1', bias_add_input_13_signal(0), bias_add_input_13_signal(1));
    PL_STEP_0_for_bias_add_input_14_signal: entity work.Pipe_Vector PORT MAP(clk, '1', bias_add_input_14_signal(0), bias_add_input_14_signal(1));
    PL_STEP_0_for_bias_add_input_15_signal: entity work.Pipe_Vector PORT MAP(clk, '1', bias_add_input_15_signal(0), bias_add_input_15_signal(1));
    PL_STEP_0_for_bias_add_input_16_signal: entity work.Pipe_Vector PORT MAP(clk, '1', bias_add_input_16_signal(0), bias_add_input_16_signal(1));
    PL_STEP_0_for_bias_add_input_17_signal: entity work.Pipe_Vector PORT MAP(clk, '1', bias_add_input_17_signal(0), bias_add_input_17_signal(1));
    PL_STEP_0_for_bias_add_input_18_signal: entity work.Pipe_Vector PORT MAP(clk, '1', bias_add_input_18_signal(0), bias_add_input_18_signal(1));
    PL_STEP_0_for_bias_add_input_19_signal: entity work.Pipe_Vector PORT MAP(clk, '1', bias_add_input_19_signal(0), bias_add_input_19_signal(1));
    PL_STEP_0_for_bias_add_input_20_signal: entity work.Pipe_Vector PORT MAP(clk, '1', bias_add_input_20_signal(0), bias_add_input_20_signal(1));
    PL_STEP_0_for_bias_add_input_21_signal: entity work.Pipe_Vector PORT MAP(clk, '1', bias_add_input_21_signal(0), bias_add_input_21_signal(1));
    PL_STEP_0_for_bias_add_input_22_signal: entity work.Pipe_Vector PORT MAP(clk, '1', bias_add_input_22_signal(0), bias_add_input_22_signal(1));
    PL_STEP_0_for_bias_add_input_23_signal: entity work.Pipe_Vector PORT MAP(clk, '1', bias_add_input_23_signal(0), bias_add_input_23_signal(1));
    PL_STEP_0_for_bias_add_input_24_signal: entity work.Pipe_Vector PORT MAP(clk, '1', bias_add_input_24_signal(0), bias_add_input_24_signal(1));
    PL_STEP_0_for_bias_add_input_25_signal: entity work.Pipe_Vector PORT MAP(clk, '1', bias_add_input_25_signal(0), bias_add_input_25_signal(1));
    PL_STEP_0_for_bias_add_input_26_signal: entity work.Pipe_Vector PORT MAP(clk, '1', bias_add_input_26_signal(0), bias_add_input_26_signal(1));
    PL_STEP_0_for_bias_add_input_27_signal: entity work.Pipe_Vector PORT MAP(clk, '1', bias_add_input_27_signal(0), bias_add_input_27_signal(1));
    PL_STEP_0_for_bias_add_input_28_signal: entity work.Pipe_Vector PORT MAP(clk, '1', bias_add_input_28_signal(0), bias_add_input_28_signal(1));
    PL_STEP_0_for_bias_add_input_29_signal: entity work.Pipe_Vector PORT MAP(clk, '1', bias_add_input_29_signal(0), bias_add_input_29_signal(1));
    PL_STEP_0_for_bias_add_input_30_signal: entity work.Pipe_Vector PORT MAP(clk, '1', bias_add_input_30_signal(0), bias_add_input_30_signal(1));
    PL_STEP_0_for_bias_add_input_31_signal: entity work.Pipe_Vector PORT MAP(clk, '1', bias_add_input_31_signal(0), bias_add_input_31_signal(1));
    PL_STEP_0_for_bias_add_input_32_signal: entity work.Pipe_Vector PORT MAP(clk, '1', bias_add_input_32_signal(0), bias_add_input_32_signal(1));

    bias_add : entity work.conv1_bias_add
        Port map (
            clk,
            buffer_enable_signal(6),
        
            bias_add_input_1_signal(1),
            bias_add_input_2_signal(1),
            bias_add_input_3_signal(1),
            bias_add_input_4_signal(1),
            bias_add_input_5_signal(1),
            bias_add_input_6_signal(1),
            bias_add_input_7_signal(1),
            bias_add_input_8_signal(1),
            bias_add_input_9_signal(1),
            bias_add_input_10_signal(1),
            bias_add_input_11_signal(1),
            bias_add_input_12_signal(1),
            bias_add_input_13_signal(1),
            bias_add_input_14_signal(1),
            bias_add_input_15_signal(1),
            bias_add_input_16_signal(1),
            bias_add_input_17_signal(1),
            bias_add_input_18_signal(1),
            bias_add_input_19_signal(1),
            bias_add_input_20_signal(1),
            bias_add_input_21_signal(1),
            bias_add_input_22_signal(1),
            bias_add_input_23_signal(1),
            bias_add_input_24_signal(1),
            bias_add_input_25_signal(1),
            bias_add_input_26_signal(1),
            bias_add_input_27_signal(1),
            bias_add_input_28_signal(1),
            bias_add_input_29_signal(1),
            bias_add_input_30_signal(1),
            bias_add_input_31_signal(1),
            bias_add_input_32_signal(1),
        
            layer_yo_1_pre(0) , 
            layer_yo_2_pre(0) , 
            layer_yo_3_pre(0) , 
            layer_yo_4_pre(0) , 
            layer_yo_5_pre(0) , 
            layer_yo_6_pre(0) , 
            layer_yo_7_pre(0) , 
            layer_yo_8_pre(0) , 
            layer_yo_9_pre(0) , 
            layer_yo_10_pre(0) , 
            layer_yo_11_pre(0) , 
            layer_yo_12_pre(0) , 
            layer_yo_13_pre(0) , 
            layer_yo_14_pre(0) , 
            layer_yo_15_pre(0) , 
            layer_yo_16_pre(0) , 
            layer_yo_17_pre(0) , 
            layer_yo_18_pre(0) , 
            layer_yo_19_pre(0) , 
            layer_yo_20_pre(0) , 
            layer_yo_21_pre(0) , 
            layer_yo_22_pre(0) , 
            layer_yo_23_pre(0) , 
            layer_yo_24_pre(0) , 
            layer_yo_25_pre(0) , 
            layer_yo_26_pre(0) , 
            layer_yo_27_pre(0) , 
            layer_yo_28_pre(0) , 
            layer_yo_29_pre(0) , 
            layer_yo_30_pre(0) , 
            layer_yo_31_pre(0) , 
            layer_yo_32_pre(0) 
        );


    -- Add a pipeline step
    PL_STEP_6_for_y_is_valid_signal: entity work.Pipe GENERIC MAP(STEPS => 0) PORT MAP(clk, '1', y_is_valid_signal(6), y_is_valid_signal(7));


-- # # # Stage 5 (optional): Clip msbs if the real input sample says so # # #
-- # # # IN:  layer_yo_[32]_pre
-- # # # OUT: layer_yo_[32]

-- Add a pipeline step after the bias add / the accumulator
-- Add a pipeline step
    PL_STEP_7_for_y_is_valid_signal: entity work.Pipe PORT MAP(clk, '1', y_is_valid_signal(7), y_is_valid_signal(8));
    PL_STEP_0_for_layer_yo_1_pre: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_1_pre(0), layer_yo_1_pre(1));
    PL_STEP_0_for_layer_yo_2_pre: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_2_pre(0), layer_yo_2_pre(1));
    PL_STEP_0_for_layer_yo_3_pre: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_3_pre(0), layer_yo_3_pre(1));
    PL_STEP_0_for_layer_yo_4_pre: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_4_pre(0), layer_yo_4_pre(1));
    PL_STEP_0_for_layer_yo_5_pre: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_5_pre(0), layer_yo_5_pre(1));
    PL_STEP_0_for_layer_yo_6_pre: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_6_pre(0), layer_yo_6_pre(1));
    PL_STEP_0_for_layer_yo_7_pre: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_7_pre(0), layer_yo_7_pre(1));
    PL_STEP_0_for_layer_yo_8_pre: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_8_pre(0), layer_yo_8_pre(1));
    PL_STEP_0_for_layer_yo_9_pre: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_9_pre(0), layer_yo_9_pre(1));
    PL_STEP_0_for_layer_yo_10_pre: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_10_pre(0), layer_yo_10_pre(1));
    PL_STEP_0_for_layer_yo_11_pre: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_11_pre(0), layer_yo_11_pre(1));
    PL_STEP_0_for_layer_yo_12_pre: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_12_pre(0), layer_yo_12_pre(1));
    PL_STEP_0_for_layer_yo_13_pre: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_13_pre(0), layer_yo_13_pre(1));
    PL_STEP_0_for_layer_yo_14_pre: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_14_pre(0), layer_yo_14_pre(1));
    PL_STEP_0_for_layer_yo_15_pre: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_15_pre(0), layer_yo_15_pre(1));
    PL_STEP_0_for_layer_yo_16_pre: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_16_pre(0), layer_yo_16_pre(1));
    PL_STEP_0_for_layer_yo_17_pre: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_17_pre(0), layer_yo_17_pre(1));
    PL_STEP_0_for_layer_yo_18_pre: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_18_pre(0), layer_yo_18_pre(1));
    PL_STEP_0_for_layer_yo_19_pre: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_19_pre(0), layer_yo_19_pre(1));
    PL_STEP_0_for_layer_yo_20_pre: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_20_pre(0), layer_yo_20_pre(1));
    PL_STEP_0_for_layer_yo_21_pre: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_21_pre(0), layer_yo_21_pre(1));
    PL_STEP_0_for_layer_yo_22_pre: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_22_pre(0), layer_yo_22_pre(1));
    PL_STEP_0_for_layer_yo_23_pre: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_23_pre(0), layer_yo_23_pre(1));
    PL_STEP_0_for_layer_yo_24_pre: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_24_pre(0), layer_yo_24_pre(1));
    PL_STEP_0_for_layer_yo_25_pre: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_25_pre(0), layer_yo_25_pre(1));
    PL_STEP_0_for_layer_yo_26_pre: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_26_pre(0), layer_yo_26_pre(1));
    PL_STEP_0_for_layer_yo_27_pre: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_27_pre(0), layer_yo_27_pre(1));
    PL_STEP_0_for_layer_yo_28_pre: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_28_pre(0), layer_yo_28_pre(1));
    PL_STEP_0_for_layer_yo_29_pre: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_29_pre(0), layer_yo_29_pre(1));
    PL_STEP_0_for_layer_yo_30_pre: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_30_pre(0), layer_yo_30_pre(1));
    PL_STEP_0_for_layer_yo_31_pre: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_31_pre(0), layer_yo_31_pre(1));
    PL_STEP_0_for_layer_yo_32_pre: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_32_pre(0), layer_yo_32_pre(1));


    layer_yo_1_unclipped(0) <= layer_yo_1_pre(1)(layer_yo_1_pre(1)'length-1 downto layer_yo_1_pre(1)'length - layer_yo_1_unclipped(0)'length);
  
    layer_yo_2_unclipped(0) <= layer_yo_2_pre(1)(layer_yo_2_pre(1)'length-1 downto layer_yo_2_pre(1)'length - layer_yo_2_unclipped(0)'length);
  
    layer_yo_3_unclipped(0) <= layer_yo_3_pre(1)(layer_yo_3_pre(1)'length-1 downto layer_yo_3_pre(1)'length - layer_yo_3_unclipped(0)'length);
  
    layer_yo_4_unclipped(0) <= layer_yo_4_pre(1)(layer_yo_4_pre(1)'length-1 downto layer_yo_4_pre(1)'length - layer_yo_4_unclipped(0)'length);
  
    layer_yo_5_unclipped(0) <= layer_yo_5_pre(1)(layer_yo_5_pre(1)'length-1 downto layer_yo_5_pre(1)'length - layer_yo_5_unclipped(0)'length);
  
    layer_yo_6_unclipped(0) <= layer_yo_6_pre(1)(layer_yo_6_pre(1)'length-1 downto layer_yo_6_pre(1)'length - layer_yo_6_unclipped(0)'length);
  
    layer_yo_7_unclipped(0) <= layer_yo_7_pre(1)(layer_yo_7_pre(1)'length-1 downto layer_yo_7_pre(1)'length - layer_yo_7_unclipped(0)'length);
  
    layer_yo_8_unclipped(0) <= layer_yo_8_pre(1)(layer_yo_8_pre(1)'length-1 downto layer_yo_8_pre(1)'length - layer_yo_8_unclipped(0)'length);
  
    layer_yo_9_unclipped(0) <= layer_yo_9_pre(1)(layer_yo_9_pre(1)'length-1 downto layer_yo_9_pre(1)'length - layer_yo_9_unclipped(0)'length);
  
    layer_yo_10_unclipped(0) <= layer_yo_10_pre(1)(layer_yo_10_pre(1)'length-1 downto layer_yo_10_pre(1)'length - layer_yo_10_unclipped(0)'length);
  
    layer_yo_11_unclipped(0) <= layer_yo_11_pre(1)(layer_yo_11_pre(1)'length-1 downto layer_yo_11_pre(1)'length - layer_yo_11_unclipped(0)'length);
  
    layer_yo_12_unclipped(0) <= layer_yo_12_pre(1)(layer_yo_12_pre(1)'length-1 downto layer_yo_12_pre(1)'length - layer_yo_12_unclipped(0)'length);
  
    layer_yo_13_unclipped(0) <= layer_yo_13_pre(1)(layer_yo_13_pre(1)'length-1 downto layer_yo_13_pre(1)'length - layer_yo_13_unclipped(0)'length);
  
    layer_yo_14_unclipped(0) <= layer_yo_14_pre(1)(layer_yo_14_pre(1)'length-1 downto layer_yo_14_pre(1)'length - layer_yo_14_unclipped(0)'length);
  
    layer_yo_15_unclipped(0) <= layer_yo_15_pre(1)(layer_yo_15_pre(1)'length-1 downto layer_yo_15_pre(1)'length - layer_yo_15_unclipped(0)'length);
  
    layer_yo_16_unclipped(0) <= layer_yo_16_pre(1)(layer_yo_16_pre(1)'length-1 downto layer_yo_16_pre(1)'length - layer_yo_16_unclipped(0)'length);
  
    layer_yo_17_unclipped(0) <= layer_yo_17_pre(1)(layer_yo_17_pre(1)'length-1 downto layer_yo_17_pre(1)'length - layer_yo_17_unclipped(0)'length);
  
    layer_yo_18_unclipped(0) <= layer_yo_18_pre(1)(layer_yo_18_pre(1)'length-1 downto layer_yo_18_pre(1)'length - layer_yo_18_unclipped(0)'length);
  
    layer_yo_19_unclipped(0) <= layer_yo_19_pre(1)(layer_yo_19_pre(1)'length-1 downto layer_yo_19_pre(1)'length - layer_yo_19_unclipped(0)'length);
  
    layer_yo_20_unclipped(0) <= layer_yo_20_pre(1)(layer_yo_20_pre(1)'length-1 downto layer_yo_20_pre(1)'length - layer_yo_20_unclipped(0)'length);
  
    layer_yo_21_unclipped(0) <= layer_yo_21_pre(1)(layer_yo_21_pre(1)'length-1 downto layer_yo_21_pre(1)'length - layer_yo_21_unclipped(0)'length);
  
    layer_yo_22_unclipped(0) <= layer_yo_22_pre(1)(layer_yo_22_pre(1)'length-1 downto layer_yo_22_pre(1)'length - layer_yo_22_unclipped(0)'length);
  
    layer_yo_23_unclipped(0) <= layer_yo_23_pre(1)(layer_yo_23_pre(1)'length-1 downto layer_yo_23_pre(1)'length - layer_yo_23_unclipped(0)'length);
  
    layer_yo_24_unclipped(0) <= layer_yo_24_pre(1)(layer_yo_24_pre(1)'length-1 downto layer_yo_24_pre(1)'length - layer_yo_24_unclipped(0)'length);
  
    layer_yo_25_unclipped(0) <= layer_yo_25_pre(1)(layer_yo_25_pre(1)'length-1 downto layer_yo_25_pre(1)'length - layer_yo_25_unclipped(0)'length);
  
    layer_yo_26_unclipped(0) <= layer_yo_26_pre(1)(layer_yo_26_pre(1)'length-1 downto layer_yo_26_pre(1)'length - layer_yo_26_unclipped(0)'length);
  
    layer_yo_27_unclipped(0) <= layer_yo_27_pre(1)(layer_yo_27_pre(1)'length-1 downto layer_yo_27_pre(1)'length - layer_yo_27_unclipped(0)'length);
  
    layer_yo_28_unclipped(0) <= layer_yo_28_pre(1)(layer_yo_28_pre(1)'length-1 downto layer_yo_28_pre(1)'length - layer_yo_28_unclipped(0)'length);
  
    layer_yo_29_unclipped(0) <= layer_yo_29_pre(1)(layer_yo_29_pre(1)'length-1 downto layer_yo_29_pre(1)'length - layer_yo_29_unclipped(0)'length);
  
    layer_yo_30_unclipped(0) <= layer_yo_30_pre(1)(layer_yo_30_pre(1)'length-1 downto layer_yo_30_pre(1)'length - layer_yo_30_unclipped(0)'length);
  
    layer_yo_31_unclipped(0) <= layer_yo_31_pre(1)(layer_yo_31_pre(1)'length-1 downto layer_yo_31_pre(1)'length - layer_yo_31_unclipped(0)'length);
  
    layer_yo_32_unclipped(0) <= layer_yo_32_pre(1)(layer_yo_32_pre(1)'length-1 downto layer_yo_32_pre(1)'length - layer_yo_32_unclipped(0)'length);
  
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
  
    clip_max_5: entity work.ClipTruncation
        generic map (
            MIN_VALUE => -(2**(layer_yo_5'length-1)),
            MAX_VALUE => (2**(layer_yo_5'length-1))-1
        )
        Port map (
            layer_yo_5_unclipped(0),
            layer_yo_5_signal
        );
  
    clip_max_6: entity work.ClipTruncation
        generic map (
            MIN_VALUE => -(2**(layer_yo_6'length-1)),
            MAX_VALUE => (2**(layer_yo_6'length-1))-1
        )
        Port map (
            layer_yo_6_unclipped(0),
            layer_yo_6_signal
        );
  
    clip_max_7: entity work.ClipTruncation
        generic map (
            MIN_VALUE => -(2**(layer_yo_7'length-1)),
            MAX_VALUE => (2**(layer_yo_7'length-1))-1
        )
        Port map (
            layer_yo_7_unclipped(0),
            layer_yo_7_signal
        );
  
    clip_max_8: entity work.ClipTruncation
        generic map (
            MIN_VALUE => -(2**(layer_yo_8'length-1)),
            MAX_VALUE => (2**(layer_yo_8'length-1))-1
        )
        Port map (
            layer_yo_8_unclipped(0),
            layer_yo_8_signal
        );
  
    clip_max_9: entity work.ClipTruncation
        generic map (
            MIN_VALUE => -(2**(layer_yo_9'length-1)),
            MAX_VALUE => (2**(layer_yo_9'length-1))-1
        )
        Port map (
            layer_yo_9_unclipped(0),
            layer_yo_9_signal
        );
  
    clip_max_10: entity work.ClipTruncation
        generic map (
            MIN_VALUE => -(2**(layer_yo_10'length-1)),
            MAX_VALUE => (2**(layer_yo_10'length-1))-1
        )
        Port map (
            layer_yo_10_unclipped(0),
            layer_yo_10_signal
        );
  
    clip_max_11: entity work.ClipTruncation
        generic map (
            MIN_VALUE => -(2**(layer_yo_11'length-1)),
            MAX_VALUE => (2**(layer_yo_11'length-1))-1
        )
        Port map (
            layer_yo_11_unclipped(0),
            layer_yo_11_signal
        );
  
    clip_max_12: entity work.ClipTruncation
        generic map (
            MIN_VALUE => -(2**(layer_yo_12'length-1)),
            MAX_VALUE => (2**(layer_yo_12'length-1))-1
        )
        Port map (
            layer_yo_12_unclipped(0),
            layer_yo_12_signal
        );
  
    clip_max_13: entity work.ClipTruncation
        generic map (
            MIN_VALUE => -(2**(layer_yo_13'length-1)),
            MAX_VALUE => (2**(layer_yo_13'length-1))-1
        )
        Port map (
            layer_yo_13_unclipped(0),
            layer_yo_13_signal
        );
  
    clip_max_14: entity work.ClipTruncation
        generic map (
            MIN_VALUE => -(2**(layer_yo_14'length-1)),
            MAX_VALUE => (2**(layer_yo_14'length-1))-1
        )
        Port map (
            layer_yo_14_unclipped(0),
            layer_yo_14_signal
        );
  
    clip_max_15: entity work.ClipTruncation
        generic map (
            MIN_VALUE => -(2**(layer_yo_15'length-1)),
            MAX_VALUE => (2**(layer_yo_15'length-1))-1
        )
        Port map (
            layer_yo_15_unclipped(0),
            layer_yo_15_signal
        );
  
    clip_max_16: entity work.ClipTruncation
        generic map (
            MIN_VALUE => -(2**(layer_yo_16'length-1)),
            MAX_VALUE => (2**(layer_yo_16'length-1))-1
        )
        Port map (
            layer_yo_16_unclipped(0),
            layer_yo_16_signal
        );
  
    clip_max_17: entity work.ClipTruncation
        generic map (
            MIN_VALUE => -(2**(layer_yo_17'length-1)),
            MAX_VALUE => (2**(layer_yo_17'length-1))-1
        )
        Port map (
            layer_yo_17_unclipped(0),
            layer_yo_17_signal
        );
  
    clip_max_18: entity work.ClipTruncation
        generic map (
            MIN_VALUE => -(2**(layer_yo_18'length-1)),
            MAX_VALUE => (2**(layer_yo_18'length-1))-1
        )
        Port map (
            layer_yo_18_unclipped(0),
            layer_yo_18_signal
        );
  
    clip_max_19: entity work.ClipTruncation
        generic map (
            MIN_VALUE => -(2**(layer_yo_19'length-1)),
            MAX_VALUE => (2**(layer_yo_19'length-1))-1
        )
        Port map (
            layer_yo_19_unclipped(0),
            layer_yo_19_signal
        );
  
    clip_max_20: entity work.ClipTruncation
        generic map (
            MIN_VALUE => -(2**(layer_yo_20'length-1)),
            MAX_VALUE => (2**(layer_yo_20'length-1))-1
        )
        Port map (
            layer_yo_20_unclipped(0),
            layer_yo_20_signal
        );
  
    clip_max_21: entity work.ClipTruncation
        generic map (
            MIN_VALUE => -(2**(layer_yo_21'length-1)),
            MAX_VALUE => (2**(layer_yo_21'length-1))-1
        )
        Port map (
            layer_yo_21_unclipped(0),
            layer_yo_21_signal
        );
  
    clip_max_22: entity work.ClipTruncation
        generic map (
            MIN_VALUE => -(2**(layer_yo_22'length-1)),
            MAX_VALUE => (2**(layer_yo_22'length-1))-1
        )
        Port map (
            layer_yo_22_unclipped(0),
            layer_yo_22_signal
        );
  
    clip_max_23: entity work.ClipTruncation
        generic map (
            MIN_VALUE => -(2**(layer_yo_23'length-1)),
            MAX_VALUE => (2**(layer_yo_23'length-1))-1
        )
        Port map (
            layer_yo_23_unclipped(0),
            layer_yo_23_signal
        );
  
    clip_max_24: entity work.ClipTruncation
        generic map (
            MIN_VALUE => -(2**(layer_yo_24'length-1)),
            MAX_VALUE => (2**(layer_yo_24'length-1))-1
        )
        Port map (
            layer_yo_24_unclipped(0),
            layer_yo_24_signal
        );
  
    clip_max_25: entity work.ClipTruncation
        generic map (
            MIN_VALUE => -(2**(layer_yo_25'length-1)),
            MAX_VALUE => (2**(layer_yo_25'length-1))-1
        )
        Port map (
            layer_yo_25_unclipped(0),
            layer_yo_25_signal
        );
  
    clip_max_26: entity work.ClipTruncation
        generic map (
            MIN_VALUE => -(2**(layer_yo_26'length-1)),
            MAX_VALUE => (2**(layer_yo_26'length-1))-1
        )
        Port map (
            layer_yo_26_unclipped(0),
            layer_yo_26_signal
        );
  
    clip_max_27: entity work.ClipTruncation
        generic map (
            MIN_VALUE => -(2**(layer_yo_27'length-1)),
            MAX_VALUE => (2**(layer_yo_27'length-1))-1
        )
        Port map (
            layer_yo_27_unclipped(0),
            layer_yo_27_signal
        );
  
    clip_max_28: entity work.ClipTruncation
        generic map (
            MIN_VALUE => -(2**(layer_yo_28'length-1)),
            MAX_VALUE => (2**(layer_yo_28'length-1))-1
        )
        Port map (
            layer_yo_28_unclipped(0),
            layer_yo_28_signal
        );
  
    clip_max_29: entity work.ClipTruncation
        generic map (
            MIN_VALUE => -(2**(layer_yo_29'length-1)),
            MAX_VALUE => (2**(layer_yo_29'length-1))-1
        )
        Port map (
            layer_yo_29_unclipped(0),
            layer_yo_29_signal
        );
  
    clip_max_30: entity work.ClipTruncation
        generic map (
            MIN_VALUE => -(2**(layer_yo_30'length-1)),
            MAX_VALUE => (2**(layer_yo_30'length-1))-1
        )
        Port map (
            layer_yo_30_unclipped(0),
            layer_yo_30_signal
        );
  
    clip_max_31: entity work.ClipTruncation
        generic map (
            MIN_VALUE => -(2**(layer_yo_31'length-1)),
            MAX_VALUE => (2**(layer_yo_31'length-1))-1
        )
        Port map (
            layer_yo_31_unclipped(0),
            layer_yo_31_signal
        );
  
    clip_max_32: entity work.ClipTruncation
        generic map (
            MIN_VALUE => -(2**(layer_yo_32'length-1)),
            MAX_VALUE => (2**(layer_yo_32'length-1))-1
        )
        Port map (
            layer_yo_32_unclipped(0),
            layer_yo_32_signal
        );
  
    layer_yo_1 <= layer_yo_1_signal; --	sfix(5, -3)
    layer_yo_2 <= layer_yo_2_signal; --	sfix(5, -3)
    layer_yo_3 <= layer_yo_3_signal; --	sfix(5, -3)
    layer_yo_4 <= layer_yo_4_signal; --	sfix(5, -3)
    layer_yo_5 <= layer_yo_5_signal; --	sfix(5, -3)
    layer_yo_6 <= layer_yo_6_signal; --	sfix(5, -3)
    layer_yo_7 <= layer_yo_7_signal; --	sfix(5, -3)
    layer_yo_8 <= layer_yo_8_signal; --	sfix(5, -3)
    layer_yo_9 <= layer_yo_9_signal; --	sfix(5, -3)
    layer_yo_10 <= layer_yo_10_signal; --	sfix(5, -3)
    layer_yo_11 <= layer_yo_11_signal; --	sfix(5, -3)
    layer_yo_12 <= layer_yo_12_signal; --	sfix(5, -3)
    layer_yo_13 <= layer_yo_13_signal; --	sfix(5, -3)
    layer_yo_14 <= layer_yo_14_signal; --	sfix(5, -3)
    layer_yo_15 <= layer_yo_15_signal; --	sfix(5, -3)
    layer_yo_16 <= layer_yo_16_signal; --	sfix(5, -3)
    layer_yo_17 <= layer_yo_17_signal; --	sfix(5, -3)
    layer_yo_18 <= layer_yo_18_signal; --	sfix(5, -3)
    layer_yo_19 <= layer_yo_19_signal; --	sfix(5, -3)
    layer_yo_20 <= layer_yo_20_signal; --	sfix(5, -3)
    layer_yo_21 <= layer_yo_21_signal; --	sfix(5, -3)
    layer_yo_22 <= layer_yo_22_signal; --	sfix(5, -3)
    layer_yo_23 <= layer_yo_23_signal; --	sfix(5, -3)
    layer_yo_24 <= layer_yo_24_signal; --	sfix(5, -3)
    layer_yo_25 <= layer_yo_25_signal; --	sfix(5, -3)
    layer_yo_26 <= layer_yo_26_signal; --	sfix(5, -3)
    layer_yo_27 <= layer_yo_27_signal; --	sfix(5, -3)
    layer_yo_28 <= layer_yo_28_signal; --	sfix(5, -3)
    layer_yo_29 <= layer_yo_29_signal; --	sfix(5, -3)
    layer_yo_30 <= layer_yo_30_signal; --	sfix(5, -3)
    layer_yo_31 <= layer_yo_31_signal; --	sfix(5, -3)
    layer_yo_32 <= layer_yo_32_signal; --	sfix(5, -3)

    y_valid <= y_is_valid_signal(8);

    -- FOR DEBUGGING: When producing a valid output -> Check if the output is correct with the TF simulation!
    simulation_validation: entity work.conv1_sim_validator
        Port map (
            clk,
            reset,
            layer_xi_1, --	sfix(1, -7)
            layer_xi_2, --	sfix(1, -7)
            layer_xi_3, --	sfix(1, -7)
            x_is_valid,
            layer_yo_1_signal, --	sfix(5, -3)
            layer_yo_2_signal, --	sfix(5, -3)
            layer_yo_3_signal, --	sfix(5, -3)
            layer_yo_4_signal, --	sfix(5, -3)
            layer_yo_5_signal, --	sfix(5, -3)
            layer_yo_6_signal, --	sfix(5, -3)
            layer_yo_7_signal, --	sfix(5, -3)
            layer_yo_8_signal, --	sfix(5, -3)
            layer_yo_9_signal, --	sfix(5, -3)
            layer_yo_10_signal, --	sfix(5, -3)
            layer_yo_11_signal, --	sfix(5, -3)
            layer_yo_12_signal, --	sfix(5, -3)
            layer_yo_13_signal, --	sfix(5, -3)
            layer_yo_14_signal, --	sfix(5, -3)
            layer_yo_15_signal, --	sfix(5, -3)
            layer_yo_16_signal, --	sfix(5, -3)
            layer_yo_17_signal, --	sfix(5, -3)
            layer_yo_18_signal, --	sfix(5, -3)
            layer_yo_19_signal, --	sfix(5, -3)
            layer_yo_20_signal, --	sfix(5, -3)
            layer_yo_21_signal, --	sfix(5, -3)
            layer_yo_22_signal, --	sfix(5, -3)
            layer_yo_23_signal, --	sfix(5, -3)
            layer_yo_24_signal, --	sfix(5, -3)
            layer_yo_25_signal, --	sfix(5, -3)
            layer_yo_26_signal, --	sfix(5, -3)
            layer_yo_27_signal, --	sfix(5, -3)
            layer_yo_28_signal, --	sfix(5, -3)
            layer_yo_29_signal, --	sfix(5, -3)
            layer_yo_30_signal, --	sfix(5, -3)
            layer_yo_31_signal, --	sfix(5, -3)
            layer_yo_32_signal, --	sfix(5, -3)
            y_is_valid_signal(8)
        );

end Behavioral;