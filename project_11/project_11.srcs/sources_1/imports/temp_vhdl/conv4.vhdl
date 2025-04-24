LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;
use work.conv4_settings.all;

entity conv4 is
    port
    (
        clk   : in std_logic;
        reset : in std_logic;
    
        layer_xi_1    : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        layer_xi_2    : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        layer_xi_3    : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        layer_xi_4    : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        layer_xi_5    : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        layer_xi_6    : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        layer_xi_7    : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        layer_xi_8    : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        layer_xi_9    : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        layer_xi_10    : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        layer_xi_11    : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        layer_xi_12    : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        layer_xi_13    : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        layer_xi_14    : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        layer_xi_15    : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        layer_xi_16    : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        x_is_valid    : in std_logic;
        sel_config    : in SEL_CONFIGURATIONS_TYPE;

        y_valid    : out std_logic;
        layer_yo_1 : out std_logic_vector(8-1 downto 0);  --	sfix(6, -2)
        layer_yo_2 : out std_logic_vector(8-1 downto 0);  --	sfix(6, -2)
        layer_yo_3 : out std_logic_vector(8-1 downto 0);  --	sfix(6, -2)
        layer_yo_4 : out std_logic_vector(8-1 downto 0);  --	sfix(6, -2)
        layer_yo_5 : out std_logic_vector(8-1 downto 0);  --	sfix(6, -2)
        layer_yo_6 : out std_logic_vector(8-1 downto 0);  --	sfix(6, -2)
        layer_yo_7 : out std_logic_vector(8-1 downto 0);  --	sfix(6, -2)
        layer_yo_8 : out std_logic_vector(8-1 downto 0);  --	sfix(6, -2)
        layer_yo_9 : out std_logic_vector(8-1 downto 0);  --	sfix(6, -2)
        layer_yo_10 : out std_logic_vector(8-1 downto 0);  --	sfix(6, -2)
        layer_yo_11 : out std_logic_vector(8-1 downto 0);  --	sfix(6, -2)
        layer_yo_12 : out std_logic_vector(8-1 downto 0);  --	sfix(6, -2)
        layer_yo_13 : out std_logic_vector(8-1 downto 0);  --	sfix(6, -2)
        layer_yo_14 : out std_logic_vector(8-1 downto 0);  --	sfix(6, -2)
        layer_yo_15 : out std_logic_vector(8-1 downto 0);  --	sfix(6, -2)
        layer_yo_16 : out std_logic_vector(8-1 downto 0) --	sfix(6, -2)
    ) ;
end conv4;

architecture Behavioral of conv4 is


    attribute KEEP_HIERARCHY : string;
    attribute KEEP_HIERARCHY of conv4 : entity is "yes";

    constant ACCU_PIPELINE_STEPS : natural := 0;
    constant RMCM_PIPELINE_STEPS : natural := 3;
    constant KPU_PIPELINE_STEPS : natural := 0;

    constant BIG_BUFFER_DELAY_COUNTER_MAX : NATURAL := (FEATURE_MAP_SIZE - KERNEL_SIZE + 1) * CONFIGURATIONS - KPU_PIPELINE_STEPS;
    constant SMALL_BUFFER_DELAY_COUNTER_MAX : NATURAL := CONFIGURATIONS - KPU_PIPELINE_STEPS;



    type PIPELINE_TYPE_FOR_LAYER_XI_1_SIGNAL    is array(0 to 2) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_2_SIGNAL    is array(0 to 2) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_3_SIGNAL    is array(0 to 2) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_4_SIGNAL    is array(0 to 2) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_5_SIGNAL    is array(0 to 2) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_6_SIGNAL    is array(0 to 2) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_7_SIGNAL    is array(0 to 2) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_8_SIGNAL    is array(0 to 2) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_9_SIGNAL    is array(0 to 2) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_10_SIGNAL   is array(0 to 2) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_11_SIGNAL   is array(0 to 2) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_12_SIGNAL   is array(0 to 2) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_13_SIGNAL   is array(0 to 2) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_14_SIGNAL   is array(0 to 2) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_15_SIGNAL   is array(0 to 2) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_16_SIGNAL   is array(0 to 2) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_Y_IS_VALID_SIGNAL    is array(0 to 7) of std_logic;
    type PIPELINE_TYPE_FOR_BUFFER_ENABLE_SIGNAL is array(0 to 5) of std_logic;
    type PIPELINE_TYPE_FOR_PAD_1                is array(0 to 2) of std_logic;
    type PIPELINE_TYPE_FOR_PAD_2                is array(0 to 2) of std_logic;
    type PIPELINE_TYPE_FOR_PAD_3                is array(0 to 2) of std_logic;
    type PIPELINE_TYPE_FOR_BIG_BUFFER_DELAY_COUNTER_SIGNAL is array(0 to 1) of std_logic_vector(bits(BIG_BUFFER_DELAY_COUNTER_MAX-1-2)-1 downto 0);
    type PIPELINE_TYPE_FOR_SMALL_BUFFER_DELAY_COUNTER_SIGNAL is array(0 to 1) of std_logic_vector(bits(SMALL_BUFFER_DELAY_COUNTER_MAX-1-2)-1 downto 0);
    type PIPELINE_TYPE_FOR_INTERLEAVE_COUNTER_SIGNAL is array(0 to 2) of std_logic_vector(bits(INTERLEAVINGS-1)-1 downto 0);
    type PIPELINE_TYPE_FOR_RMCM_SELECT_CONFIG_SIGNAL_PL is array(0 to 5) of std_logic_vector(bits(CONFIGURATIONS-1)-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_1 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_2 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_3 is array(0 to 0) of std_logic_vector(5-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_4 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_5 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_6 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_7 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_8 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_9 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_1_INPUT_1 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_1_INPUT_2 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_1_INPUT_3 is array(0 to 0) of std_logic_vector(5-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_1_INPUT_4 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_1_INPUT_5 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_1_INPUT_6 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_1_INPUT_7 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_1_INPUT_8 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_2_KPU_1_INPUT_9 is array(0 to 0) of std_logic_vector(5-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_1_INPUT_1 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_1_INPUT_2 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_1_INPUT_3 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_1_INPUT_4 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_1_INPUT_5 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_1_INPUT_6 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_1_INPUT_7 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_1_INPUT_8 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_3_KPU_1_INPUT_9 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_4_KPU_1_INPUT_1 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_4_KPU_1_INPUT_2 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_4_KPU_1_INPUT_3 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_4_KPU_1_INPUT_4 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_4_KPU_1_INPUT_5 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_4_KPU_1_INPUT_6 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_4_KPU_1_INPUT_7 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_4_KPU_1_INPUT_8 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_4_KPU_1_INPUT_9 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_5_KPU_1_INPUT_1 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_5_KPU_1_INPUT_2 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_5_KPU_1_INPUT_3 is array(0 to 0) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_5_KPU_1_INPUT_4 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_5_KPU_1_INPUT_5 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_5_KPU_1_INPUT_6 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_5_KPU_1_INPUT_7 is array(0 to 0) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_5_KPU_1_INPUT_8 is array(0 to 0) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_5_KPU_1_INPUT_9 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_6_KPU_1_INPUT_1 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_6_KPU_1_INPUT_2 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_6_KPU_1_INPUT_3 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_6_KPU_1_INPUT_4 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_6_KPU_1_INPUT_5 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_6_KPU_1_INPUT_6 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_6_KPU_1_INPUT_7 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_6_KPU_1_INPUT_8 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_6_KPU_1_INPUT_9 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_7_KPU_1_INPUT_1 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_7_KPU_1_INPUT_2 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_7_KPU_1_INPUT_3 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_7_KPU_1_INPUT_4 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_7_KPU_1_INPUT_5 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_7_KPU_1_INPUT_6 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_7_KPU_1_INPUT_7 is array(0 to 0) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_7_KPU_1_INPUT_8 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_7_KPU_1_INPUT_9 is array(0 to 0) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_8_KPU_1_INPUT_1 is array(0 to 0) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_8_KPU_1_INPUT_2 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_8_KPU_1_INPUT_3 is array(0 to 0) of std_logic_vector(5-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_8_KPU_1_INPUT_4 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_8_KPU_1_INPUT_5 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_8_KPU_1_INPUT_6 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_8_KPU_1_INPUT_7 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_8_KPU_1_INPUT_8 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_8_KPU_1_INPUT_9 is array(0 to 0) of std_logic_vector(5-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_9_KPU_1_INPUT_1 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_9_KPU_1_INPUT_2 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_9_KPU_1_INPUT_3 is array(0 to 0) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_9_KPU_1_INPUT_4 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_9_KPU_1_INPUT_5 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_9_KPU_1_INPUT_6 is array(0 to 0) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_9_KPU_1_INPUT_7 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_9_KPU_1_INPUT_8 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_9_KPU_1_INPUT_9 is array(0 to 0) of std_logic_vector(5-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_10_KPU_1_INPUT_1 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_10_KPU_1_INPUT_2 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_10_KPU_1_INPUT_3 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_10_KPU_1_INPUT_4 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_10_KPU_1_INPUT_5 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_10_KPU_1_INPUT_6 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_10_KPU_1_INPUT_7 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_10_KPU_1_INPUT_8 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_10_KPU_1_INPUT_9 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_11_KPU_1_INPUT_1 is array(0 to 0) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_11_KPU_1_INPUT_2 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_11_KPU_1_INPUT_3 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_11_KPU_1_INPUT_4 is array(0 to 0) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_11_KPU_1_INPUT_5 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_11_KPU_1_INPUT_6 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_11_KPU_1_INPUT_7 is array(0 to 0) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_11_KPU_1_INPUT_8 is array(0 to 0) of std_logic_vector(5-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_11_KPU_1_INPUT_9 is array(0 to 0) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_12_KPU_1_INPUT_1 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_12_KPU_1_INPUT_2 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_12_KPU_1_INPUT_3 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_12_KPU_1_INPUT_4 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_12_KPU_1_INPUT_5 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_12_KPU_1_INPUT_6 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_12_KPU_1_INPUT_7 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_12_KPU_1_INPUT_8 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_12_KPU_1_INPUT_9 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_13_KPU_1_INPUT_1 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_13_KPU_1_INPUT_2 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_13_KPU_1_INPUT_3 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_13_KPU_1_INPUT_4 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_13_KPU_1_INPUT_5 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_13_KPU_1_INPUT_6 is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_13_KPU_1_INPUT_7 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_13_KPU_1_INPUT_8 is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_13_KPU_1_INPUT_9 is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_14_KPU_1_INPUT_1 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_14_KPU_1_INPUT_2 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_14_KPU_1_INPUT_3 is array(0 to 0) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_14_KPU_1_INPUT_4 is array(0 to 0) of std_logic_vector(10-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_14_KPU_1_INPUT_5 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_14_KPU_1_INPUT_6 is array(0 to 0) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_14_KPU_1_INPUT_7 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_14_KPU_1_INPUT_8 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_14_KPU_1_INPUT_9 is array(0 to 0) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_15_KPU_1_INPUT_1 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_15_KPU_1_INPUT_2 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_15_KPU_1_INPUT_3 is array(0 to 0) of std_logic_vector(5-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_15_KPU_1_INPUT_4 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_15_KPU_1_INPUT_5 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_15_KPU_1_INPUT_6 is array(0 to 0) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_15_KPU_1_INPUT_7 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_15_KPU_1_INPUT_8 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_15_KPU_1_INPUT_9 is array(0 to 0) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_16_KPU_1_INPUT_1 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_16_KPU_1_INPUT_2 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_16_KPU_1_INPUT_3 is array(0 to 0) of std_logic_vector(11-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_16_KPU_1_INPUT_4 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_16_KPU_1_INPUT_5 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_16_KPU_1_INPUT_6 is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_16_KPU_1_INPUT_7 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_16_KPU_1_INPUT_8 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_CORE_16_KPU_1_INPUT_9 is array(0 to 0) of std_logic_vector(9-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_1   is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_1   is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_1   is array(0 to 0) of std_logic_vector(17-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_4_YO_1   is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_5_YO_1   is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_6_YO_1   is array(0 to 0) of std_logic_vector(19-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_7_YO_1   is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_8_YO_1   is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_9_YO_1   is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_10_YO_1  is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_11_YO_1  is array(0 to 0) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_12_YO_1  is array(0 to 0) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_13_YO_1  is array(0 to 0) of std_logic_vector(18-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_14_YO_1  is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_15_YO_1  is array(0 to 0) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_SIGNAL_CORE_16_YO_1  is array(0 to 0) of std_logic_vector(15-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_1_PRE       is array(0 to 1) of std_logic_vector(19-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_2_PRE       is array(0 to 1) of std_logic_vector(19-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_3_PRE       is array(0 to 1) of std_logic_vector(19-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_4_PRE       is array(0 to 1) of std_logic_vector(19-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_5_PRE       is array(0 to 1) of std_logic_vector(19-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_6_PRE       is array(0 to 1) of std_logic_vector(19-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_7_PRE       is array(0 to 1) of std_logic_vector(19-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_8_PRE       is array(0 to 1) of std_logic_vector(19-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_9_PRE       is array(0 to 1) of std_logic_vector(19-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_10_PRE      is array(0 to 1) of std_logic_vector(19-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_11_PRE      is array(0 to 1) of std_logic_vector(19-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_12_PRE      is array(0 to 1) of std_logic_vector(19-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_13_PRE      is array(0 to 1) of std_logic_vector(19-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_14_PRE      is array(0 to 1) of std_logic_vector(19-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_15_PRE      is array(0 to 1) of std_logic_vector(19-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_16_PRE      is array(0 to 1) of std_logic_vector(19-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_1_UNCLIPPED is array(0 to 0) of std_logic_vector(17-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_2_UNCLIPPED is array(0 to 0) of std_logic_vector(17-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_3_UNCLIPPED is array(0 to 0) of std_logic_vector(17-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_4_UNCLIPPED is array(0 to 0) of std_logic_vector(17-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_5_UNCLIPPED is array(0 to 0) of std_logic_vector(17-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_6_UNCLIPPED is array(0 to 0) of std_logic_vector(17-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_7_UNCLIPPED is array(0 to 0) of std_logic_vector(17-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_8_UNCLIPPED is array(0 to 0) of std_logic_vector(17-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_9_UNCLIPPED is array(0 to 0) of std_logic_vector(17-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_10_UNCLIPPED is array(0 to 0) of std_logic_vector(17-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_11_UNCLIPPED is array(0 to 0) of std_logic_vector(17-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_12_UNCLIPPED is array(0 to 0) of std_logic_vector(17-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_13_UNCLIPPED is array(0 to 0) of std_logic_vector(17-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_14_UNCLIPPED is array(0 to 0) of std_logic_vector(17-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_15_UNCLIPPED is array(0 to 0) of std_logic_vector(17-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_16_UNCLIPPED is array(0 to 0) of std_logic_vector(17-1 downto 0);
    type PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_1_SIGNAL is array(0 to 1) of std_logic_vector(19-1 downto 0);
    type PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_2_SIGNAL is array(0 to 1) of std_logic_vector(19-1 downto 0);
    type PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_3_SIGNAL is array(0 to 1) of std_logic_vector(19-1 downto 0);
    type PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_4_SIGNAL is array(0 to 1) of std_logic_vector(19-1 downto 0);
    type PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_5_SIGNAL is array(0 to 1) of std_logic_vector(19-1 downto 0);
    type PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_6_SIGNAL is array(0 to 1) of std_logic_vector(19-1 downto 0);
    type PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_7_SIGNAL is array(0 to 1) of std_logic_vector(19-1 downto 0);
    type PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_8_SIGNAL is array(0 to 1) of std_logic_vector(19-1 downto 0);
    type PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_9_SIGNAL is array(0 to 1) of std_logic_vector(19-1 downto 0);
    type PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_10_SIGNAL is array(0 to 1) of std_logic_vector(19-1 downto 0);
    type PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_11_SIGNAL is array(0 to 1) of std_logic_vector(19-1 downto 0);
    type PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_12_SIGNAL is array(0 to 1) of std_logic_vector(19-1 downto 0);
    type PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_13_SIGNAL is array(0 to 1) of std_logic_vector(19-1 downto 0);
    type PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_14_SIGNAL is array(0 to 1) of std_logic_vector(19-1 downto 0);
    type PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_15_SIGNAL is array(0 to 1) of std_logic_vector(19-1 downto 0);
    type PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_16_SIGNAL is array(0 to 1) of std_logic_vector(19-1 downto 0);

    -- All layer outputs
        signal layer_yo_1_signal : std_logic_vector(8-1 downto 0); --	sfix(6, -2)
        signal layer_yo_2_signal : std_logic_vector(8-1 downto 0); --	sfix(6, -2)
        signal layer_yo_3_signal : std_logic_vector(8-1 downto 0); --	sfix(6, -2)
        signal layer_yo_4_signal : std_logic_vector(8-1 downto 0); --	sfix(6, -2)
        signal layer_yo_5_signal : std_logic_vector(8-1 downto 0); --	sfix(6, -2)
        signal layer_yo_6_signal : std_logic_vector(8-1 downto 0); --	sfix(6, -2)
        signal layer_yo_7_signal : std_logic_vector(8-1 downto 0); --	sfix(6, -2)
        signal layer_yo_8_signal : std_logic_vector(8-1 downto 0); --	sfix(6, -2)
        signal layer_yo_9_signal : std_logic_vector(8-1 downto 0); --	sfix(6, -2)
        signal layer_yo_10_signal : std_logic_vector(8-1 downto 0); --	sfix(6, -2)
        signal layer_yo_11_signal : std_logic_vector(8-1 downto 0); --	sfix(6, -2)
        signal layer_yo_12_signal : std_logic_vector(8-1 downto 0); --	sfix(6, -2)
        signal layer_yo_13_signal : std_logic_vector(8-1 downto 0); --	sfix(6, -2)
        signal layer_yo_14_signal : std_logic_vector(8-1 downto 0); --	sfix(6, -2)
        signal layer_yo_15_signal : std_logic_vector(8-1 downto 0); --	sfix(6, -2)
        signal layer_yo_16_signal : std_logic_vector(8-1 downto 0); --	sfix(6, -2)

    -- All pipelines xi_inputs

    -- ufix(4, -3)
    signal layer_xi_1_signal    : PIPELINE_TYPE_FOR_LAYER_XI_1_SIGNAL;
    -- ufix(4, -3)
    signal layer_xi_2_signal    : PIPELINE_TYPE_FOR_LAYER_XI_2_SIGNAL;
    -- ufix(4, -3)
    signal layer_xi_3_signal    : PIPELINE_TYPE_FOR_LAYER_XI_3_SIGNAL;
    -- ufix(4, -3)
    signal layer_xi_4_signal    : PIPELINE_TYPE_FOR_LAYER_XI_4_SIGNAL;
    -- ufix(4, -3)
    signal layer_xi_5_signal    : PIPELINE_TYPE_FOR_LAYER_XI_5_SIGNAL;
    -- ufix(4, -3)
    signal layer_xi_6_signal    : PIPELINE_TYPE_FOR_LAYER_XI_6_SIGNAL;
    -- ufix(4, -3)
    signal layer_xi_7_signal    : PIPELINE_TYPE_FOR_LAYER_XI_7_SIGNAL;
    -- ufix(4, -3)
    signal layer_xi_8_signal    : PIPELINE_TYPE_FOR_LAYER_XI_8_SIGNAL;
    -- ufix(4, -3)
    signal layer_xi_9_signal    : PIPELINE_TYPE_FOR_LAYER_XI_9_SIGNAL;
    -- ufix(4, -3)
    signal layer_xi_10_signal   : PIPELINE_TYPE_FOR_LAYER_XI_10_SIGNAL;
    -- ufix(4, -3)
    signal layer_xi_11_signal   : PIPELINE_TYPE_FOR_LAYER_XI_11_SIGNAL;
    -- ufix(4, -3)
    signal layer_xi_12_signal   : PIPELINE_TYPE_FOR_LAYER_XI_12_SIGNAL;
    -- ufix(4, -3)
    signal layer_xi_13_signal   : PIPELINE_TYPE_FOR_LAYER_XI_13_SIGNAL;
    -- ufix(4, -3)
    signal layer_xi_14_signal   : PIPELINE_TYPE_FOR_LAYER_XI_14_SIGNAL;
    -- ufix(4, -3)
    signal layer_xi_15_signal   : PIPELINE_TYPE_FOR_LAYER_XI_15_SIGNAL;
    -- ufix(4, -3)
    signal layer_xi_16_signal   : PIPELINE_TYPE_FOR_LAYER_XI_16_SIGNAL;

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
    subtype CORE_1_CONCAT_BIG_DELAY_ARRAY_TYPE is std_logic_vector(26-1 downto 0);
    signal core_1_concat_big_undelayed_array : CORE_1_CONCAT_BIG_DELAY_ARRAY_TYPE;
    signal core_1_concat_big_delayed_array : CORE_1_CONCAT_BIG_DELAY_ARRAY_TYPE;

    -- All KPU small buffer delays
    -- The one std_logic_vector to delay
    subtype CORE_1_CONCAT_SMALL_DELAY_ARRAY_TYPE is std_logic_vector(73-1 downto 0);
    signal core_1_concat_small_undelayed_array : CORE_1_CONCAT_SMALL_DELAY_ARRAY_TYPE;
    signal core_1_concat_small_delayed_array : CORE_1_CONCAT_SMALL_DELAY_ARRAY_TYPE;
    -- All KPU big buffer (line buffer) delays
    -- The one std_logic_vector to delay
    subtype CORE_2_CONCAT_BIG_DELAY_ARRAY_TYPE is std_logic_vector(25-1 downto 0);
    signal core_2_concat_big_undelayed_array : CORE_2_CONCAT_BIG_DELAY_ARRAY_TYPE;
    signal core_2_concat_big_delayed_array : CORE_2_CONCAT_BIG_DELAY_ARRAY_TYPE;

    -- All KPU small buffer delays
    -- The one std_logic_vector to delay
    subtype CORE_2_CONCAT_SMALL_DELAY_ARRAY_TYPE is std_logic_vector(71-1 downto 0);
    signal core_2_concat_small_undelayed_array : CORE_2_CONCAT_SMALL_DELAY_ARRAY_TYPE;
    signal core_2_concat_small_delayed_array : CORE_2_CONCAT_SMALL_DELAY_ARRAY_TYPE;
    -- All KPU big buffer (line buffer) delays
    -- The one std_logic_vector to delay
    subtype CORE_3_CONCAT_BIG_DELAY_ARRAY_TYPE is std_logic_vector(33-1 downto 0);
    signal core_3_concat_big_undelayed_array : CORE_3_CONCAT_BIG_DELAY_ARRAY_TYPE;
    signal core_3_concat_big_delayed_array : CORE_3_CONCAT_BIG_DELAY_ARRAY_TYPE;

    -- All KPU small buffer delays
    -- The one std_logic_vector to delay
    subtype CORE_3_CONCAT_SMALL_DELAY_ARRAY_TYPE is std_logic_vector(96-1 downto 0);
    signal core_3_concat_small_undelayed_array : CORE_3_CONCAT_SMALL_DELAY_ARRAY_TYPE;
    signal core_3_concat_small_delayed_array : CORE_3_CONCAT_SMALL_DELAY_ARRAY_TYPE;
    -- All KPU big buffer (line buffer) delays
    -- The one std_logic_vector to delay
    subtype CORE_4_CONCAT_BIG_DELAY_ARRAY_TYPE is std_logic_vector(29-1 downto 0);
    signal core_4_concat_big_undelayed_array : CORE_4_CONCAT_BIG_DELAY_ARRAY_TYPE;
    signal core_4_concat_big_delayed_array : CORE_4_CONCAT_BIG_DELAY_ARRAY_TYPE;

    -- All KPU small buffer delays
    -- The one std_logic_vector to delay
    subtype CORE_4_CONCAT_SMALL_DELAY_ARRAY_TYPE is std_logic_vector(81-1 downto 0);
    signal core_4_concat_small_undelayed_array : CORE_4_CONCAT_SMALL_DELAY_ARRAY_TYPE;
    signal core_4_concat_small_delayed_array : CORE_4_CONCAT_SMALL_DELAY_ARRAY_TYPE;
    -- All KPU big buffer (line buffer) delays
    -- The one std_logic_vector to delay
    subtype CORE_5_CONCAT_BIG_DELAY_ARRAY_TYPE is std_logic_vector(25-1 downto 0);
    signal core_5_concat_big_undelayed_array : CORE_5_CONCAT_BIG_DELAY_ARRAY_TYPE;
    signal core_5_concat_big_delayed_array : CORE_5_CONCAT_BIG_DELAY_ARRAY_TYPE;

    -- All KPU small buffer delays
    -- The one std_logic_vector to delay
    subtype CORE_5_CONCAT_SMALL_DELAY_ARRAY_TYPE is std_logic_vector(72-1 downto 0);
    signal core_5_concat_small_undelayed_array : CORE_5_CONCAT_SMALL_DELAY_ARRAY_TYPE;
    signal core_5_concat_small_delayed_array : CORE_5_CONCAT_SMALL_DELAY_ARRAY_TYPE;
    -- All KPU big buffer (line buffer) delays
    -- The one std_logic_vector to delay
    subtype CORE_6_CONCAT_BIG_DELAY_ARRAY_TYPE is std_logic_vector(36-1 downto 0);
    signal core_6_concat_big_undelayed_array : CORE_6_CONCAT_BIG_DELAY_ARRAY_TYPE;
    signal core_6_concat_big_delayed_array : CORE_6_CONCAT_BIG_DELAY_ARRAY_TYPE;

    -- All KPU small buffer delays
    -- The one std_logic_vector to delay
    subtype CORE_6_CONCAT_SMALL_DELAY_ARRAY_TYPE is std_logic_vector(107-1 downto 0);
    signal core_6_concat_small_undelayed_array : CORE_6_CONCAT_SMALL_DELAY_ARRAY_TYPE;
    signal core_6_concat_small_delayed_array : CORE_6_CONCAT_SMALL_DELAY_ARRAY_TYPE;
    -- All KPU big buffer (line buffer) delays
    -- The one std_logic_vector to delay
    subtype CORE_7_CONCAT_BIG_DELAY_ARRAY_TYPE is std_logic_vector(27-1 downto 0);
    signal core_7_concat_big_undelayed_array : CORE_7_CONCAT_BIG_DELAY_ARRAY_TYPE;
    signal core_7_concat_big_delayed_array : CORE_7_CONCAT_BIG_DELAY_ARRAY_TYPE;

    -- All KPU small buffer delays
    -- The one std_logic_vector to delay
    subtype CORE_7_CONCAT_SMALL_DELAY_ARRAY_TYPE is std_logic_vector(76-1 downto 0);
    signal core_7_concat_small_undelayed_array : CORE_7_CONCAT_SMALL_DELAY_ARRAY_TYPE;
    signal core_7_concat_small_delayed_array : CORE_7_CONCAT_SMALL_DELAY_ARRAY_TYPE;
    -- All KPU big buffer (line buffer) delays
    -- The one std_logic_vector to delay
    subtype CORE_8_CONCAT_BIG_DELAY_ARRAY_TYPE is std_logic_vector(23-1 downto 0);
    signal core_8_concat_big_undelayed_array : CORE_8_CONCAT_BIG_DELAY_ARRAY_TYPE;
    signal core_8_concat_big_delayed_array : CORE_8_CONCAT_BIG_DELAY_ARRAY_TYPE;

    -- All KPU small buffer delays
    -- The one std_logic_vector to delay
    subtype CORE_8_CONCAT_SMALL_DELAY_ARRAY_TYPE is std_logic_vector(65-1 downto 0);
    signal core_8_concat_small_undelayed_array : CORE_8_CONCAT_SMALL_DELAY_ARRAY_TYPE;
    signal core_8_concat_small_delayed_array : CORE_8_CONCAT_SMALL_DELAY_ARRAY_TYPE;
    -- All KPU big buffer (line buffer) delays
    -- The one std_logic_vector to delay
    subtype CORE_9_CONCAT_BIG_DELAY_ARRAY_TYPE is std_logic_vector(28-1 downto 0);
    signal core_9_concat_big_undelayed_array : CORE_9_CONCAT_BIG_DELAY_ARRAY_TYPE;
    signal core_9_concat_big_delayed_array : CORE_9_CONCAT_BIG_DELAY_ARRAY_TYPE;

    -- All KPU small buffer delays
    -- The one std_logic_vector to delay
    subtype CORE_9_CONCAT_SMALL_DELAY_ARRAY_TYPE is std_logic_vector(78-1 downto 0);
    signal core_9_concat_small_undelayed_array : CORE_9_CONCAT_SMALL_DELAY_ARRAY_TYPE;
    signal core_9_concat_small_delayed_array : CORE_9_CONCAT_SMALL_DELAY_ARRAY_TYPE;
    -- All KPU big buffer (line buffer) delays
    -- The one std_logic_vector to delay
    subtype CORE_10_CONCAT_BIG_DELAY_ARRAY_TYPE is std_logic_vector(27-1 downto 0);
    signal core_10_concat_big_undelayed_array : CORE_10_CONCAT_BIG_DELAY_ARRAY_TYPE;
    signal core_10_concat_big_delayed_array : CORE_10_CONCAT_BIG_DELAY_ARRAY_TYPE;

    -- All KPU small buffer delays
    -- The one std_logic_vector to delay
    subtype CORE_10_CONCAT_SMALL_DELAY_ARRAY_TYPE is std_logic_vector(80-1 downto 0);
    signal core_10_concat_small_undelayed_array : CORE_10_CONCAT_SMALL_DELAY_ARRAY_TYPE;
    signal core_10_concat_small_delayed_array : CORE_10_CONCAT_SMALL_DELAY_ARRAY_TYPE;
    -- All KPU big buffer (line buffer) delays
    -- The one std_logic_vector to delay
    subtype CORE_11_CONCAT_BIG_DELAY_ARRAY_TYPE is std_logic_vector(23-1 downto 0);
    signal core_11_concat_big_undelayed_array : CORE_11_CONCAT_BIG_DELAY_ARRAY_TYPE;
    signal core_11_concat_big_delayed_array : CORE_11_CONCAT_BIG_DELAY_ARRAY_TYPE;

    -- All KPU small buffer delays
    -- The one std_logic_vector to delay
    subtype CORE_11_CONCAT_SMALL_DELAY_ARRAY_TYPE is std_logic_vector(66-1 downto 0);
    signal core_11_concat_small_undelayed_array : CORE_11_CONCAT_SMALL_DELAY_ARRAY_TYPE;
    signal core_11_concat_small_delayed_array : CORE_11_CONCAT_SMALL_DELAY_ARRAY_TYPE;
    -- All KPU big buffer (line buffer) delays
    -- The one std_logic_vector to delay
    subtype CORE_12_CONCAT_BIG_DELAY_ARRAY_TYPE is std_logic_vector(28-1 downto 0);
    signal core_12_concat_big_undelayed_array : CORE_12_CONCAT_BIG_DELAY_ARRAY_TYPE;
    signal core_12_concat_big_delayed_array : CORE_12_CONCAT_BIG_DELAY_ARRAY_TYPE;

    -- All KPU small buffer delays
    -- The one std_logic_vector to delay
    subtype CORE_12_CONCAT_SMALL_DELAY_ARRAY_TYPE is std_logic_vector(80-1 downto 0);
    signal core_12_concat_small_undelayed_array : CORE_12_CONCAT_SMALL_DELAY_ARRAY_TYPE;
    signal core_12_concat_small_delayed_array : CORE_12_CONCAT_SMALL_DELAY_ARRAY_TYPE;
    -- All KPU big buffer (line buffer) delays
    -- The one std_logic_vector to delay
    subtype CORE_13_CONCAT_BIG_DELAY_ARRAY_TYPE is std_logic_vector(34-1 downto 0);
    signal core_13_concat_big_undelayed_array : CORE_13_CONCAT_BIG_DELAY_ARRAY_TYPE;
    signal core_13_concat_big_delayed_array : CORE_13_CONCAT_BIG_DELAY_ARRAY_TYPE;

    -- All KPU small buffer delays
    -- The one std_logic_vector to delay
    subtype CORE_13_CONCAT_SMALL_DELAY_ARRAY_TYPE is std_logic_vector(100-1 downto 0);
    signal core_13_concat_small_undelayed_array : CORE_13_CONCAT_SMALL_DELAY_ARRAY_TYPE;
    signal core_13_concat_small_delayed_array : CORE_13_CONCAT_SMALL_DELAY_ARRAY_TYPE;
    -- All KPU big buffer (line buffer) delays
    -- The one std_logic_vector to delay
    subtype CORE_14_CONCAT_BIG_DELAY_ARRAY_TYPE is std_logic_vector(25-1 downto 0);
    signal core_14_concat_big_undelayed_array : CORE_14_CONCAT_BIG_DELAY_ARRAY_TYPE;
    signal core_14_concat_big_delayed_array : CORE_14_CONCAT_BIG_DELAY_ARRAY_TYPE;

    -- All KPU small buffer delays
    -- The one std_logic_vector to delay
    subtype CORE_14_CONCAT_SMALL_DELAY_ARRAY_TYPE is std_logic_vector(71-1 downto 0);
    signal core_14_concat_small_undelayed_array : CORE_14_CONCAT_SMALL_DELAY_ARRAY_TYPE;
    signal core_14_concat_small_delayed_array : CORE_14_CONCAT_SMALL_DELAY_ARRAY_TYPE;
    -- All KPU big buffer (line buffer) delays
    -- The one std_logic_vector to delay
    subtype CORE_15_CONCAT_BIG_DELAY_ARRAY_TYPE is std_logic_vector(25-1 downto 0);
    signal core_15_concat_big_undelayed_array : CORE_15_CONCAT_BIG_DELAY_ARRAY_TYPE;
    signal core_15_concat_big_delayed_array : CORE_15_CONCAT_BIG_DELAY_ARRAY_TYPE;

    -- All KPU small buffer delays
    -- The one std_logic_vector to delay
    subtype CORE_15_CONCAT_SMALL_DELAY_ARRAY_TYPE is std_logic_vector(71-1 downto 0);
    signal core_15_concat_small_undelayed_array : CORE_15_CONCAT_SMALL_DELAY_ARRAY_TYPE;
    signal core_15_concat_small_delayed_array : CORE_15_CONCAT_SMALL_DELAY_ARRAY_TYPE;
    -- All KPU big buffer (line buffer) delays
    -- The one std_logic_vector to delay
    subtype CORE_16_CONCAT_BIG_DELAY_ARRAY_TYPE is std_logic_vector(28-1 downto 0);
    signal core_16_concat_big_undelayed_array : CORE_16_CONCAT_BIG_DELAY_ARRAY_TYPE;
    signal core_16_concat_big_delayed_array : CORE_16_CONCAT_BIG_DELAY_ARRAY_TYPE;

    -- All KPU small buffer delays
    -- The one std_logic_vector to delay
    subtype CORE_16_CONCAT_SMALL_DELAY_ARRAY_TYPE is std_logic_vector(83-1 downto 0);
    signal core_16_concat_small_undelayed_array : CORE_16_CONCAT_SMALL_DELAY_ARRAY_TYPE;
    signal core_16_concat_small_delayed_array : CORE_16_CONCAT_SMALL_DELAY_ARRAY_TYPE;

    -- All KPU inputs

 
    -- sfix(5, -4)
    signal core_1_kpu_1_input_1 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_1;
    -- sfix(5, -4)
    signal core_1_kpu_1_input_2 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_2;
    -- sfix(1, -4)
    signal core_1_kpu_1_input_3 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_3;
    -- sfix(5, -4)
    signal core_1_kpu_1_input_4 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_4;
    -- sfix(6, -4)
    signal core_1_kpu_1_input_5 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_5;
    -- sfix(6, -4)
    signal core_1_kpu_1_input_6 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_6;
    -- sfix(5, -4)
    signal core_1_kpu_1_input_7 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_7;
    -- sfix(5, -4)
    signal core_1_kpu_1_input_8 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_8;
    -- sfix(5, -4)
    signal core_1_kpu_1_input_9 : PIPELINE_TYPE_FOR_CORE_1_KPU_1_INPUT_9;
 
    -- sfix(5, -4)
    signal core_2_kpu_1_input_1 : PIPELINE_TYPE_FOR_CORE_2_KPU_1_INPUT_1;
    -- sfix(5, -4)
    signal core_2_kpu_1_input_2 : PIPELINE_TYPE_FOR_CORE_2_KPU_1_INPUT_2;
    -- sfix(1, -4)
    signal core_2_kpu_1_input_3 : PIPELINE_TYPE_FOR_CORE_2_KPU_1_INPUT_3;
    -- sfix(5, -4)
    signal core_2_kpu_1_input_4 : PIPELINE_TYPE_FOR_CORE_2_KPU_1_INPUT_4;
    -- sfix(6, -4)
    signal core_2_kpu_1_input_5 : PIPELINE_TYPE_FOR_CORE_2_KPU_1_INPUT_5;
    -- sfix(5, -4)
    signal core_2_kpu_1_input_6 : PIPELINE_TYPE_FOR_CORE_2_KPU_1_INPUT_6;
    -- sfix(5, -4)
    signal core_2_kpu_1_input_7 : PIPELINE_TYPE_FOR_CORE_2_KPU_1_INPUT_7;
    -- sfix(5, -4)
    signal core_2_kpu_1_input_8 : PIPELINE_TYPE_FOR_CORE_2_KPU_1_INPUT_8;
    -- sfix(1, -4)
    signal core_2_kpu_1_input_9 : PIPELINE_TYPE_FOR_CORE_2_KPU_1_INPUT_9;
 
    -- sfix(9, -4)
    signal core_3_kpu_1_input_1 : PIPELINE_TYPE_FOR_CORE_3_KPU_1_INPUT_1;
    -- sfix(9, -4)
    signal core_3_kpu_1_input_2 : PIPELINE_TYPE_FOR_CORE_3_KPU_1_INPUT_2;
    -- sfix(9, -4)
    signal core_3_kpu_1_input_3 : PIPELINE_TYPE_FOR_CORE_3_KPU_1_INPUT_3;
    -- sfix(5, -4)
    signal core_3_kpu_1_input_4 : PIPELINE_TYPE_FOR_CORE_3_KPU_1_INPUT_4;
    -- sfix(9, -4)
    signal core_3_kpu_1_input_5 : PIPELINE_TYPE_FOR_CORE_3_KPU_1_INPUT_5;
    -- sfix(5, -4)
    signal core_3_kpu_1_input_6 : PIPELINE_TYPE_FOR_CORE_3_KPU_1_INPUT_6;
    -- sfix(9, -4)
    signal core_3_kpu_1_input_7 : PIPELINE_TYPE_FOR_CORE_3_KPU_1_INPUT_7;
    -- sfix(9, -4)
    signal core_3_kpu_1_input_8 : PIPELINE_TYPE_FOR_CORE_3_KPU_1_INPUT_8;
    -- sfix(9, -4)
    signal core_3_kpu_1_input_9 : PIPELINE_TYPE_FOR_CORE_3_KPU_1_INPUT_9;
 
    -- sfix(6, -4)
    signal core_4_kpu_1_input_1 : PIPELINE_TYPE_FOR_CORE_4_KPU_1_INPUT_1;
    -- sfix(7, -4)
    signal core_4_kpu_1_input_2 : PIPELINE_TYPE_FOR_CORE_4_KPU_1_INPUT_2;
    -- sfix(6, -4)
    signal core_4_kpu_1_input_3 : PIPELINE_TYPE_FOR_CORE_4_KPU_1_INPUT_3;
    -- sfix(6, -4)
    signal core_4_kpu_1_input_4 : PIPELINE_TYPE_FOR_CORE_4_KPU_1_INPUT_4;
    -- sfix(7, -4)
    signal core_4_kpu_1_input_5 : PIPELINE_TYPE_FOR_CORE_4_KPU_1_INPUT_5;
    -- sfix(6, -4)
    signal core_4_kpu_1_input_6 : PIPELINE_TYPE_FOR_CORE_4_KPU_1_INPUT_6;
    -- sfix(6, -4)
    signal core_4_kpu_1_input_7 : PIPELINE_TYPE_FOR_CORE_4_KPU_1_INPUT_7;
    -- sfix(6, -4)
    signal core_4_kpu_1_input_8 : PIPELINE_TYPE_FOR_CORE_4_KPU_1_INPUT_8;
    -- sfix(5, -4)
    signal core_4_kpu_1_input_9 : PIPELINE_TYPE_FOR_CORE_4_KPU_1_INPUT_9;
 
    -- sfix(5, -4)
    signal core_5_kpu_1_input_1 : PIPELINE_TYPE_FOR_CORE_5_KPU_1_INPUT_1;
    -- sfix(5, -4)
    signal core_5_kpu_1_input_2 : PIPELINE_TYPE_FOR_CORE_5_KPU_1_INPUT_2;
    -- sfix(4, -4)
    signal core_5_kpu_1_input_3 : PIPELINE_TYPE_FOR_CORE_5_KPU_1_INPUT_3;
    -- sfix(5, -4)
    signal core_5_kpu_1_input_4 : PIPELINE_TYPE_FOR_CORE_5_KPU_1_INPUT_4;
    -- sfix(5, -4)
    signal core_5_kpu_1_input_5 : PIPELINE_TYPE_FOR_CORE_5_KPU_1_INPUT_5;
    -- sfix(5, -4)
    signal core_5_kpu_1_input_6 : PIPELINE_TYPE_FOR_CORE_5_KPU_1_INPUT_6;
    -- sfix(4, -4)
    signal core_5_kpu_1_input_7 : PIPELINE_TYPE_FOR_CORE_5_KPU_1_INPUT_7;
    -- sfix(4, -4)
    signal core_5_kpu_1_input_8 : PIPELINE_TYPE_FOR_CORE_5_KPU_1_INPUT_8;
    -- sfix(5, -4)
    signal core_5_kpu_1_input_9 : PIPELINE_TYPE_FOR_CORE_5_KPU_1_INPUT_9;
 
    -- sfix(11, -4)
    signal core_6_kpu_1_input_1 : PIPELINE_TYPE_FOR_CORE_6_KPU_1_INPUT_1;
    -- sfix(10, -4)
    signal core_6_kpu_1_input_2 : PIPELINE_TYPE_FOR_CORE_6_KPU_1_INPUT_2;
    -- sfix(10, -4)
    signal core_6_kpu_1_input_3 : PIPELINE_TYPE_FOR_CORE_6_KPU_1_INPUT_3;
    -- sfix(11, -4)
    signal core_6_kpu_1_input_4 : PIPELINE_TYPE_FOR_CORE_6_KPU_1_INPUT_4;
    -- sfix(10, -4)
    signal core_6_kpu_1_input_5 : PIPELINE_TYPE_FOR_CORE_6_KPU_1_INPUT_5;
    -- sfix(10, -4)
    signal core_6_kpu_1_input_6 : PIPELINE_TYPE_FOR_CORE_6_KPU_1_INPUT_6;
    -- sfix(11, -4)
    signal core_6_kpu_1_input_7 : PIPELINE_TYPE_FOR_CORE_6_KPU_1_INPUT_7;
    -- sfix(10, -4)
    signal core_6_kpu_1_input_8 : PIPELINE_TYPE_FOR_CORE_6_KPU_1_INPUT_8;
    -- sfix(10, -4)
    signal core_6_kpu_1_input_9 : PIPELINE_TYPE_FOR_CORE_6_KPU_1_INPUT_9;
 
    -- sfix(5, -4)
    signal core_7_kpu_1_input_1 : PIPELINE_TYPE_FOR_CORE_7_KPU_1_INPUT_1;
    -- sfix(6, -4)
    signal core_7_kpu_1_input_2 : PIPELINE_TYPE_FOR_CORE_7_KPU_1_INPUT_2;
    -- sfix(6, -4)
    signal core_7_kpu_1_input_3 : PIPELINE_TYPE_FOR_CORE_7_KPU_1_INPUT_3;
    -- sfix(6, -4)
    signal core_7_kpu_1_input_4 : PIPELINE_TYPE_FOR_CORE_7_KPU_1_INPUT_4;
    -- sfix(5, -4)
    signal core_7_kpu_1_input_5 : PIPELINE_TYPE_FOR_CORE_7_KPU_1_INPUT_5;
    -- sfix(5, -4)
    signal core_7_kpu_1_input_6 : PIPELINE_TYPE_FOR_CORE_7_KPU_1_INPUT_6;
    -- sfix(4, -4)
    signal core_7_kpu_1_input_7 : PIPELINE_TYPE_FOR_CORE_7_KPU_1_INPUT_7;
    -- sfix(5, -4)
    signal core_7_kpu_1_input_8 : PIPELINE_TYPE_FOR_CORE_7_KPU_1_INPUT_8;
    -- sfix(4, -4)
    signal core_7_kpu_1_input_9 : PIPELINE_TYPE_FOR_CORE_7_KPU_1_INPUT_9;
 
    -- sfix(4, -4)
    signal core_8_kpu_1_input_1 : PIPELINE_TYPE_FOR_CORE_8_KPU_1_INPUT_1;
    -- sfix(5, -4)
    signal core_8_kpu_1_input_2 : PIPELINE_TYPE_FOR_CORE_8_KPU_1_INPUT_2;
    -- sfix(1, -4)
    signal core_8_kpu_1_input_3 : PIPELINE_TYPE_FOR_CORE_8_KPU_1_INPUT_3;
    -- sfix(5, -4)
    signal core_8_kpu_1_input_4 : PIPELINE_TYPE_FOR_CORE_8_KPU_1_INPUT_4;
    -- sfix(5, -4)
    signal core_8_kpu_1_input_5 : PIPELINE_TYPE_FOR_CORE_8_KPU_1_INPUT_5;
    -- sfix(5, -4)
    signal core_8_kpu_1_input_6 : PIPELINE_TYPE_FOR_CORE_8_KPU_1_INPUT_6;
    -- sfix(5, -4)
    signal core_8_kpu_1_input_7 : PIPELINE_TYPE_FOR_CORE_8_KPU_1_INPUT_7;
    -- sfix(5, -4)
    signal core_8_kpu_1_input_8 : PIPELINE_TYPE_FOR_CORE_8_KPU_1_INPUT_8;
    -- sfix(1, -4)
    signal core_8_kpu_1_input_9 : PIPELINE_TYPE_FOR_CORE_8_KPU_1_INPUT_9;
 
    -- sfix(6, -4)
    signal core_9_kpu_1_input_1 : PIPELINE_TYPE_FOR_CORE_9_KPU_1_INPUT_1;
    -- sfix(7, -4)
    signal core_9_kpu_1_input_2 : PIPELINE_TYPE_FOR_CORE_9_KPU_1_INPUT_2;
    -- sfix(4, -4)
    signal core_9_kpu_1_input_3 : PIPELINE_TYPE_FOR_CORE_9_KPU_1_INPUT_3;
    -- sfix(6, -4)
    signal core_9_kpu_1_input_4 : PIPELINE_TYPE_FOR_CORE_9_KPU_1_INPUT_4;
    -- sfix(5, -4)
    signal core_9_kpu_1_input_5 : PIPELINE_TYPE_FOR_CORE_9_KPU_1_INPUT_5;
    -- sfix(4, -4)
    signal core_9_kpu_1_input_6 : PIPELINE_TYPE_FOR_CORE_9_KPU_1_INPUT_6;
    -- sfix(7, -4)
    signal core_9_kpu_1_input_7 : PIPELINE_TYPE_FOR_CORE_9_KPU_1_INPUT_7;
    -- sfix(7, -4)
    signal core_9_kpu_1_input_8 : PIPELINE_TYPE_FOR_CORE_9_KPU_1_INPUT_8;
    -- sfix(1, -4)
    signal core_9_kpu_1_input_9 : PIPELINE_TYPE_FOR_CORE_9_KPU_1_INPUT_9;
 
    -- sfix(7, -4)
    signal core_10_kpu_1_input_1 : PIPELINE_TYPE_FOR_CORE_10_KPU_1_INPUT_1;
    -- sfix(7, -4)
    signal core_10_kpu_1_input_2 : PIPELINE_TYPE_FOR_CORE_10_KPU_1_INPUT_2;
    -- sfix(7, -4)
    signal core_10_kpu_1_input_3 : PIPELINE_TYPE_FOR_CORE_10_KPU_1_INPUT_3;
    -- sfix(7, -4)
    signal core_10_kpu_1_input_4 : PIPELINE_TYPE_FOR_CORE_10_KPU_1_INPUT_4;
    -- sfix(6, -4)
    signal core_10_kpu_1_input_5 : PIPELINE_TYPE_FOR_CORE_10_KPU_1_INPUT_5;
    -- sfix(7, -4)
    signal core_10_kpu_1_input_6 : PIPELINE_TYPE_FOR_CORE_10_KPU_1_INPUT_6;
    -- sfix(6, -4)
    signal core_10_kpu_1_input_7 : PIPELINE_TYPE_FOR_CORE_10_KPU_1_INPUT_7;
    -- sfix(6, -4)
    signal core_10_kpu_1_input_8 : PIPELINE_TYPE_FOR_CORE_10_KPU_1_INPUT_8;
    -- sfix(6, -4)
    signal core_10_kpu_1_input_9 : PIPELINE_TYPE_FOR_CORE_10_KPU_1_INPUT_9;
 
    -- sfix(4, -4)
    signal core_11_kpu_1_input_1 : PIPELINE_TYPE_FOR_CORE_11_KPU_1_INPUT_1;
    -- sfix(5, -4)
    signal core_11_kpu_1_input_2 : PIPELINE_TYPE_FOR_CORE_11_KPU_1_INPUT_2;
    -- sfix(5, -4)
    signal core_11_kpu_1_input_3 : PIPELINE_TYPE_FOR_CORE_11_KPU_1_INPUT_3;
    -- sfix(4, -4)
    signal core_11_kpu_1_input_4 : PIPELINE_TYPE_FOR_CORE_11_KPU_1_INPUT_4;
    -- sfix(5, -4)
    signal core_11_kpu_1_input_5 : PIPELINE_TYPE_FOR_CORE_11_KPU_1_INPUT_5;
    -- sfix(5, -4)
    signal core_11_kpu_1_input_6 : PIPELINE_TYPE_FOR_CORE_11_KPU_1_INPUT_6;
    -- sfix(4, -4)
    signal core_11_kpu_1_input_7 : PIPELINE_TYPE_FOR_CORE_11_KPU_1_INPUT_7;
    -- sfix(1, -4)
    signal core_11_kpu_1_input_8 : PIPELINE_TYPE_FOR_CORE_11_KPU_1_INPUT_8;
    -- sfix(4, -4)
    signal core_11_kpu_1_input_9 : PIPELINE_TYPE_FOR_CORE_11_KPU_1_INPUT_9;
 
    -- sfix(7, -4)
    signal core_12_kpu_1_input_1 : PIPELINE_TYPE_FOR_CORE_12_KPU_1_INPUT_1;
    -- sfix(8, -4)
    signal core_12_kpu_1_input_2 : PIPELINE_TYPE_FOR_CORE_12_KPU_1_INPUT_2;
    -- sfix(6, -4)
    signal core_12_kpu_1_input_3 : PIPELINE_TYPE_FOR_CORE_12_KPU_1_INPUT_3;
    -- sfix(5, -4)
    signal core_12_kpu_1_input_4 : PIPELINE_TYPE_FOR_CORE_12_KPU_1_INPUT_4;
    -- sfix(5, -4)
    signal core_12_kpu_1_input_5 : PIPELINE_TYPE_FOR_CORE_12_KPU_1_INPUT_5;
    -- sfix(5, -4)
    signal core_12_kpu_1_input_6 : PIPELINE_TYPE_FOR_CORE_12_KPU_1_INPUT_6;
    -- sfix(7, -4)
    signal core_12_kpu_1_input_7 : PIPELINE_TYPE_FOR_CORE_12_KPU_1_INPUT_7;
    -- sfix(8, -4)
    signal core_12_kpu_1_input_8 : PIPELINE_TYPE_FOR_CORE_12_KPU_1_INPUT_8;
    -- sfix(6, -4)
    signal core_12_kpu_1_input_9 : PIPELINE_TYPE_FOR_CORE_12_KPU_1_INPUT_9;
 
    -- sfix(10, -4)
    signal core_13_kpu_1_input_1 : PIPELINE_TYPE_FOR_CORE_13_KPU_1_INPUT_1;
    -- sfix(7, -4)
    signal core_13_kpu_1_input_2 : PIPELINE_TYPE_FOR_CORE_13_KPU_1_INPUT_2;
    -- sfix(10, -4)
    signal core_13_kpu_1_input_3 : PIPELINE_TYPE_FOR_CORE_13_KPU_1_INPUT_3;
    -- sfix(10, -4)
    signal core_13_kpu_1_input_4 : PIPELINE_TYPE_FOR_CORE_13_KPU_1_INPUT_4;
    -- sfix(9, -4)
    signal core_13_kpu_1_input_5 : PIPELINE_TYPE_FOR_CORE_13_KPU_1_INPUT_5;
    -- sfix(11, -4)
    signal core_13_kpu_1_input_6 : PIPELINE_TYPE_FOR_CORE_13_KPU_1_INPUT_6;
    -- sfix(10, -4)
    signal core_13_kpu_1_input_7 : PIPELINE_TYPE_FOR_CORE_13_KPU_1_INPUT_7;
    -- sfix(10, -4)
    signal core_13_kpu_1_input_8 : PIPELINE_TYPE_FOR_CORE_13_KPU_1_INPUT_8;
    -- sfix(9, -4)
    signal core_13_kpu_1_input_9 : PIPELINE_TYPE_FOR_CORE_13_KPU_1_INPUT_9;
 
    -- sfix(5, -4)
    signal core_14_kpu_1_input_1 : PIPELINE_TYPE_FOR_CORE_14_KPU_1_INPUT_1;
    -- sfix(5, -4)
    signal core_14_kpu_1_input_2 : PIPELINE_TYPE_FOR_CORE_14_KPU_1_INPUT_2;
    -- sfix(4, -4)
    signal core_14_kpu_1_input_3 : PIPELINE_TYPE_FOR_CORE_14_KPU_1_INPUT_3;
    -- sfix(6, -4)
    signal core_14_kpu_1_input_4 : PIPELINE_TYPE_FOR_CORE_14_KPU_1_INPUT_4;
    -- sfix(5, -4)
    signal core_14_kpu_1_input_5 : PIPELINE_TYPE_FOR_CORE_14_KPU_1_INPUT_5;
    -- sfix(4, -4)
    signal core_14_kpu_1_input_6 : PIPELINE_TYPE_FOR_CORE_14_KPU_1_INPUT_6;
    -- sfix(5, -4)
    signal core_14_kpu_1_input_7 : PIPELINE_TYPE_FOR_CORE_14_KPU_1_INPUT_7;
    -- sfix(5, -4)
    signal core_14_kpu_1_input_8 : PIPELINE_TYPE_FOR_CORE_14_KPU_1_INPUT_8;
    -- sfix(4, -4)
    signal core_14_kpu_1_input_9 : PIPELINE_TYPE_FOR_CORE_14_KPU_1_INPUT_9;
 
    -- sfix(5, -4)
    signal core_15_kpu_1_input_1 : PIPELINE_TYPE_FOR_CORE_15_KPU_1_INPUT_1;
    -- sfix(5, -4)
    signal core_15_kpu_1_input_2 : PIPELINE_TYPE_FOR_CORE_15_KPU_1_INPUT_2;
    -- sfix(1, -4)
    signal core_15_kpu_1_input_3 : PIPELINE_TYPE_FOR_CORE_15_KPU_1_INPUT_3;
    -- sfix(5, -4)
    signal core_15_kpu_1_input_4 : PIPELINE_TYPE_FOR_CORE_15_KPU_1_INPUT_4;
    -- sfix(5, -4)
    signal core_15_kpu_1_input_5 : PIPELINE_TYPE_FOR_CORE_15_KPU_1_INPUT_5;
    -- sfix(4, -4)
    signal core_15_kpu_1_input_6 : PIPELINE_TYPE_FOR_CORE_15_KPU_1_INPUT_6;
    -- sfix(5, -4)
    signal core_15_kpu_1_input_7 : PIPELINE_TYPE_FOR_CORE_15_KPU_1_INPUT_7;
    -- sfix(5, -4)
    signal core_15_kpu_1_input_8 : PIPELINE_TYPE_FOR_CORE_15_KPU_1_INPUT_8;
    -- sfix(4, -4)
    signal core_15_kpu_1_input_9 : PIPELINE_TYPE_FOR_CORE_15_KPU_1_INPUT_9;
 
    -- sfix(7, -4)
    signal core_16_kpu_1_input_1 : PIPELINE_TYPE_FOR_CORE_16_KPU_1_INPUT_1;
    -- sfix(5, -4)
    signal core_16_kpu_1_input_2 : PIPELINE_TYPE_FOR_CORE_16_KPU_1_INPUT_2;
    -- sfix(7, -4)
    signal core_16_kpu_1_input_3 : PIPELINE_TYPE_FOR_CORE_16_KPU_1_INPUT_3;
    -- sfix(8, -4)
    signal core_16_kpu_1_input_4 : PIPELINE_TYPE_FOR_CORE_16_KPU_1_INPUT_4;
    -- sfix(5, -4)
    signal core_16_kpu_1_input_5 : PIPELINE_TYPE_FOR_CORE_16_KPU_1_INPUT_5;
    -- sfix(8, -4)
    signal core_16_kpu_1_input_6 : PIPELINE_TYPE_FOR_CORE_16_KPU_1_INPUT_6;
    -- sfix(5, -4)
    signal core_16_kpu_1_input_7 : PIPELINE_TYPE_FOR_CORE_16_KPU_1_INPUT_7;
    -- sfix(5, -4)
    signal core_16_kpu_1_input_8 : PIPELINE_TYPE_FOR_CORE_16_KPU_1_INPUT_8;
    -- sfix(5, -4)
    signal core_16_kpu_1_input_9 : PIPELINE_TYPE_FOR_CORE_16_KPU_1_INPUT_9;

    -- All KPU outputs
    -- sfix(10, -4)
    signal signal_core_1_yo_1   : PIPELINE_TYPE_FOR_SIGNAL_CORE_1_YO_1;
    -- sfix(9, -4)
    signal signal_core_2_yo_1   : PIPELINE_TYPE_FOR_SIGNAL_CORE_2_YO_1;
    -- sfix(13, -4)
    signal signal_core_3_yo_1   : PIPELINE_TYPE_FOR_SIGNAL_CORE_3_YO_1;
    -- sfix(11, -4)
    signal signal_core_4_yo_1   : PIPELINE_TYPE_FOR_SIGNAL_CORE_4_YO_1;
    -- sfix(9, -4)
    signal signal_core_5_yo_1   : PIPELINE_TYPE_FOR_SIGNAL_CORE_5_YO_1;
    -- sfix(15, -4)
    signal signal_core_6_yo_1   : PIPELINE_TYPE_FOR_SIGNAL_CORE_6_YO_1;
    -- sfix(10, -4)
    signal signal_core_7_yo_1   : PIPELINE_TYPE_FOR_SIGNAL_CORE_7_YO_1;
    -- sfix(8, -4)
    signal signal_core_8_yo_1   : PIPELINE_TYPE_FOR_SIGNAL_CORE_8_YO_1;
    -- sfix(10, -4)
    signal signal_core_9_yo_1   : PIPELINE_TYPE_FOR_SIGNAL_CORE_9_YO_1;
    -- sfix(10, -4)
    signal signal_core_10_yo_1  : PIPELINE_TYPE_FOR_SIGNAL_CORE_10_YO_1;
    -- sfix(8, -4)
    signal signal_core_11_yo_1  : PIPELINE_TYPE_FOR_SIGNAL_CORE_11_YO_1;
    -- sfix(10, -4)
    signal signal_core_12_yo_1  : PIPELINE_TYPE_FOR_SIGNAL_CORE_12_YO_1;
    -- sfix(14, -4)
    signal signal_core_13_yo_1  : PIPELINE_TYPE_FOR_SIGNAL_CORE_13_YO_1;
    -- sfix(9, -4)
    signal signal_core_14_yo_1  : PIPELINE_TYPE_FOR_SIGNAL_CORE_14_YO_1;
    -- sfix(9, -4)
    signal signal_core_15_yo_1  : PIPELINE_TYPE_FOR_SIGNAL_CORE_15_YO_1;
    -- sfix(11, -4)
    signal signal_core_16_yo_1  : PIPELINE_TYPE_FOR_SIGNAL_CORE_16_YO_1;

    -- All pre layer outputs
    -- sfix(15, -4)
    signal layer_yo_1_pre       : PIPELINE_TYPE_FOR_LAYER_YO_1_PRE;
    -- sfix(15, -4)
    signal layer_yo_2_pre       : PIPELINE_TYPE_FOR_LAYER_YO_2_PRE;
    -- sfix(15, -4)
    signal layer_yo_3_pre       : PIPELINE_TYPE_FOR_LAYER_YO_3_PRE;
    -- sfix(15, -4)
    signal layer_yo_4_pre       : PIPELINE_TYPE_FOR_LAYER_YO_4_PRE;
    -- sfix(15, -4)
    signal layer_yo_5_pre       : PIPELINE_TYPE_FOR_LAYER_YO_5_PRE;
    -- sfix(15, -4)
    signal layer_yo_6_pre       : PIPELINE_TYPE_FOR_LAYER_YO_6_PRE;
    -- sfix(15, -4)
    signal layer_yo_7_pre       : PIPELINE_TYPE_FOR_LAYER_YO_7_PRE;
    -- sfix(15, -4)
    signal layer_yo_8_pre       : PIPELINE_TYPE_FOR_LAYER_YO_8_PRE;
    -- sfix(15, -4)
    signal layer_yo_9_pre       : PIPELINE_TYPE_FOR_LAYER_YO_9_PRE;
    -- sfix(15, -4)
    signal layer_yo_10_pre      : PIPELINE_TYPE_FOR_LAYER_YO_10_PRE;
    -- sfix(15, -4)
    signal layer_yo_11_pre      : PIPELINE_TYPE_FOR_LAYER_YO_11_PRE;
    -- sfix(15, -4)
    signal layer_yo_12_pre      : PIPELINE_TYPE_FOR_LAYER_YO_12_PRE;
    -- sfix(15, -4)
    signal layer_yo_13_pre      : PIPELINE_TYPE_FOR_LAYER_YO_13_PRE;
    -- sfix(15, -4)
    signal layer_yo_14_pre      : PIPELINE_TYPE_FOR_LAYER_YO_14_PRE;
    -- sfix(15, -4)
    signal layer_yo_15_pre      : PIPELINE_TYPE_FOR_LAYER_YO_15_PRE;
    -- sfix(15, -4)
    signal layer_yo_16_pre      : PIPELINE_TYPE_FOR_LAYER_YO_16_PRE;

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
    -- sfix(15, -4)
    signal bias_add_input_1_signal : PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_1_SIGNAL;
    -- sfix(15, -4)
    signal bias_add_input_2_signal : PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_2_SIGNAL;
    -- sfix(15, -4)
    signal bias_add_input_3_signal : PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_3_SIGNAL;
    -- sfix(15, -4)
    signal bias_add_input_4_signal : PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_4_SIGNAL;
    -- sfix(15, -4)
    signal bias_add_input_5_signal : PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_5_SIGNAL;
    -- sfix(15, -4)
    signal bias_add_input_6_signal : PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_6_SIGNAL;
    -- sfix(15, -4)
    signal bias_add_input_7_signal : PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_7_SIGNAL;
    -- sfix(15, -4)
    signal bias_add_input_8_signal : PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_8_SIGNAL;
    -- sfix(15, -4)
    signal bias_add_input_9_signal : PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_9_SIGNAL;
    -- sfix(15, -4)
    signal bias_add_input_10_signal : PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_10_SIGNAL;
    -- sfix(15, -4)
    signal bias_add_input_11_signal : PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_11_SIGNAL;
    -- sfix(15, -4)
    signal bias_add_input_12_signal : PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_12_SIGNAL;
    -- sfix(15, -4)
    signal bias_add_input_13_signal : PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_13_SIGNAL;
    -- sfix(15, -4)
    signal bias_add_input_14_signal : PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_14_SIGNAL;
    -- sfix(15, -4)
    signal bias_add_input_15_signal : PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_15_SIGNAL;
    -- sfix(15, -4)
    signal bias_add_input_16_signal : PIPELINE_TYPE_FOR_BIAS_ADD_INPUT_16_SIGNAL;



begin

-- "Initialize" stuff

    layer_xi_1_signal(0) <= layer_xi_1;
    layer_xi_2_signal(0) <= layer_xi_2;
    layer_xi_3_signal(0) <= layer_xi_3;
    layer_xi_4_signal(0) <= layer_xi_4;
    layer_xi_5_signal(0) <= layer_xi_5;
    layer_xi_6_signal(0) <= layer_xi_6;
    layer_xi_7_signal(0) <= layer_xi_7;
    layer_xi_8_signal(0) <= layer_xi_8;
    layer_xi_9_signal(0) <= layer_xi_9;
    layer_xi_10_signal(0) <= layer_xi_10;
    layer_xi_11_signal(0) <= layer_xi_11;
    layer_xi_12_signal(0) <= layer_xi_12;
    layer_xi_13_signal(0) <= layer_xi_13;
    layer_xi_14_signal(0) <= layer_xi_14;
    layer_xi_15_signal(0) <= layer_xi_15;
    layer_xi_16_signal(0) <= layer_xi_16;

-- # # # Stage 1: Produce all control signals! # # #
-- # # # IN:  x_is_valid, sel_config
-- # # # OUT: y_is_valid_signal, pad_[3], big_buffer_delay_counter_signal, small_buffer_delay_counter_signal, interleave_counter_signal, buffer_enable_signal

    sliding_window_ctrl : entity work.conv4_SlidingWindowController
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
-- # # # IN:  layer_xi[16] y_is_valid_signal, pad_[3], big_buffer_delay_counter_signal(0), small_buffer_delay_counter_signal(0), interleave_counter_signal(0)
-- # # # OUT: signal_core_[]_yo_16

-- We have to delay everything except the rmcm_select_config_signal_pl. This is because the weights are loaded from BRAM, and it will take one clock cycle to do so.
-- TODO hey, maybe we can do better? Maybe we can preload the next weights before or something... Ikd...


 -- This is always needed. The sliding window controller forces this.
 -- This is always needed. The sliding window controller forces this.

-- Add a pipeline step
    PL_STEP_0_for_layer_xi_1_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_1_signal(0), layer_xi_1_signal(1));
    PL_STEP_0_for_layer_xi_2_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_2_signal(0), layer_xi_2_signal(1));
    PL_STEP_0_for_layer_xi_3_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_3_signal(0), layer_xi_3_signal(1));
    PL_STEP_0_for_layer_xi_4_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_4_signal(0), layer_xi_4_signal(1));
    PL_STEP_0_for_layer_xi_5_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_5_signal(0), layer_xi_5_signal(1));
    PL_STEP_0_for_layer_xi_6_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_6_signal(0), layer_xi_6_signal(1));
    PL_STEP_0_for_layer_xi_7_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_7_signal(0), layer_xi_7_signal(1));
    PL_STEP_0_for_layer_xi_8_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_8_signal(0), layer_xi_8_signal(1));
    PL_STEP_0_for_layer_xi_9_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_9_signal(0), layer_xi_9_signal(1));
    PL_STEP_0_for_layer_xi_10_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_10_signal(0), layer_xi_10_signal(1));
    PL_STEP_0_for_layer_xi_11_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_11_signal(0), layer_xi_11_signal(1));
    PL_STEP_0_for_layer_xi_12_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_12_signal(0), layer_xi_12_signal(1));
    PL_STEP_0_for_layer_xi_13_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_13_signal(0), layer_xi_13_signal(1));
    PL_STEP_0_for_layer_xi_14_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_14_signal(0), layer_xi_14_signal(1));
    PL_STEP_0_for_layer_xi_15_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_15_signal(0), layer_xi_15_signal(1));
    PL_STEP_0_for_layer_xi_16_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_16_signal(0), layer_xi_16_signal(1)); -- This is always needed. The sliding window controller forces this.
-- Add a pipeline step
    PL_STEP_1_for_layer_xi_1_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_1_signal(1), layer_xi_1_signal(2));
    PL_STEP_1_for_layer_xi_2_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_2_signal(1), layer_xi_2_signal(2));
    PL_STEP_1_for_layer_xi_3_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_3_signal(1), layer_xi_3_signal(2));
    PL_STEP_1_for_layer_xi_4_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_4_signal(1), layer_xi_4_signal(2));
    PL_STEP_1_for_layer_xi_5_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_5_signal(1), layer_xi_5_signal(2));
    PL_STEP_1_for_layer_xi_6_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_6_signal(1), layer_xi_6_signal(2));
    PL_STEP_1_for_layer_xi_7_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_7_signal(1), layer_xi_7_signal(2));
    PL_STEP_1_for_layer_xi_8_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_8_signal(1), layer_xi_8_signal(2));
    PL_STEP_1_for_layer_xi_9_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_9_signal(1), layer_xi_9_signal(2));
    PL_STEP_1_for_layer_xi_10_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_10_signal(1), layer_xi_10_signal(2));
    PL_STEP_1_for_layer_xi_11_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_11_signal(1), layer_xi_11_signal(2));
    PL_STEP_1_for_layer_xi_12_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_12_signal(1), layer_xi_12_signal(2));
    PL_STEP_1_for_layer_xi_13_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_13_signal(1), layer_xi_13_signal(2));
    PL_STEP_1_for_layer_xi_14_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_14_signal(1), layer_xi_14_signal(2));
    PL_STEP_1_for_layer_xi_15_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_15_signal(1), layer_xi_15_signal(2));
    PL_STEP_1_for_layer_xi_16_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_16_signal(1), layer_xi_16_signal(2));
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








    conv_core1 : entity work.conv4_core1
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

    conv_core2 : entity work.conv4_core2
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

    conv_core3 : entity work.conv4_core3
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

    conv_core4 : entity work.conv4_core4
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

    conv_core5 : entity work.conv4_core5
        generic map
        (
            PIPELINE_STEPS => RMCM_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,

            layer_xi_5_signal(2),
            rmcm_select_config_signal_pl(0),
            pad_1(2), pad_2(2), pad_3(2), 

    
            core_5_kpu_1_input_1(0) , 
            core_5_kpu_1_input_2(0) , 
            core_5_kpu_1_input_3(0) , 
            core_5_kpu_1_input_4(0) , 
            core_5_kpu_1_input_5(0) , 
            core_5_kpu_1_input_6(0) , 
            core_5_kpu_1_input_7(0) , 
            core_5_kpu_1_input_8(0) , 
            core_5_kpu_1_input_9(0) 
        );

    conv_core6 : entity work.conv4_core6
        generic map
        (
            PIPELINE_STEPS => RMCM_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,

            layer_xi_6_signal(2),
            rmcm_select_config_signal_pl(0),
            pad_1(2), pad_2(2), pad_3(2), 

    
            core_6_kpu_1_input_1(0) , 
            core_6_kpu_1_input_2(0) , 
            core_6_kpu_1_input_3(0) , 
            core_6_kpu_1_input_4(0) , 
            core_6_kpu_1_input_5(0) , 
            core_6_kpu_1_input_6(0) , 
            core_6_kpu_1_input_7(0) , 
            core_6_kpu_1_input_8(0) , 
            core_6_kpu_1_input_9(0) 
        );

    conv_core7 : entity work.conv4_core7
        generic map
        (
            PIPELINE_STEPS => RMCM_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,

            layer_xi_7_signal(2),
            rmcm_select_config_signal_pl(0),
            pad_1(2), pad_2(2), pad_3(2), 

    
            core_7_kpu_1_input_1(0) , 
            core_7_kpu_1_input_2(0) , 
            core_7_kpu_1_input_3(0) , 
            core_7_kpu_1_input_4(0) , 
            core_7_kpu_1_input_5(0) , 
            core_7_kpu_1_input_6(0) , 
            core_7_kpu_1_input_7(0) , 
            core_7_kpu_1_input_8(0) , 
            core_7_kpu_1_input_9(0) 
        );

    conv_core8 : entity work.conv4_core8
        generic map
        (
            PIPELINE_STEPS => RMCM_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,

            layer_xi_8_signal(2),
            rmcm_select_config_signal_pl(0),
            pad_1(2), pad_2(2), pad_3(2), 

    
            core_8_kpu_1_input_1(0) , 
            core_8_kpu_1_input_2(0) , 
            core_8_kpu_1_input_3(0) , 
            core_8_kpu_1_input_4(0) , 
            core_8_kpu_1_input_5(0) , 
            core_8_kpu_1_input_6(0) , 
            core_8_kpu_1_input_7(0) , 
            core_8_kpu_1_input_8(0) , 
            core_8_kpu_1_input_9(0) 
        );

    conv_core9 : entity work.conv4_core9
        generic map
        (
            PIPELINE_STEPS => RMCM_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,

            layer_xi_9_signal(2),
            rmcm_select_config_signal_pl(0),
            pad_1(2), pad_2(2), pad_3(2), 

    
            core_9_kpu_1_input_1(0) , 
            core_9_kpu_1_input_2(0) , 
            core_9_kpu_1_input_3(0) , 
            core_9_kpu_1_input_4(0) , 
            core_9_kpu_1_input_5(0) , 
            core_9_kpu_1_input_6(0) , 
            core_9_kpu_1_input_7(0) , 
            core_9_kpu_1_input_8(0) , 
            core_9_kpu_1_input_9(0) 
        );

    conv_core10 : entity work.conv4_core10
        generic map
        (
            PIPELINE_STEPS => RMCM_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,

            layer_xi_10_signal(2),
            rmcm_select_config_signal_pl(0),
            pad_1(2), pad_2(2), pad_3(2), 

    
            core_10_kpu_1_input_1(0) , 
            core_10_kpu_1_input_2(0) , 
            core_10_kpu_1_input_3(0) , 
            core_10_kpu_1_input_4(0) , 
            core_10_kpu_1_input_5(0) , 
            core_10_kpu_1_input_6(0) , 
            core_10_kpu_1_input_7(0) , 
            core_10_kpu_1_input_8(0) , 
            core_10_kpu_1_input_9(0) 
        );

    conv_core11 : entity work.conv4_core11
        generic map
        (
            PIPELINE_STEPS => RMCM_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,

            layer_xi_11_signal(2),
            rmcm_select_config_signal_pl(0),
            pad_1(2), pad_2(2), pad_3(2), 

    
            core_11_kpu_1_input_1(0) , 
            core_11_kpu_1_input_2(0) , 
            core_11_kpu_1_input_3(0) , 
            core_11_kpu_1_input_4(0) , 
            core_11_kpu_1_input_5(0) , 
            core_11_kpu_1_input_6(0) , 
            core_11_kpu_1_input_7(0) , 
            core_11_kpu_1_input_8(0) , 
            core_11_kpu_1_input_9(0) 
        );

    conv_core12 : entity work.conv4_core12
        generic map
        (
            PIPELINE_STEPS => RMCM_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,

            layer_xi_12_signal(2),
            rmcm_select_config_signal_pl(0),
            pad_1(2), pad_2(2), pad_3(2), 

    
            core_12_kpu_1_input_1(0) , 
            core_12_kpu_1_input_2(0) , 
            core_12_kpu_1_input_3(0) , 
            core_12_kpu_1_input_4(0) , 
            core_12_kpu_1_input_5(0) , 
            core_12_kpu_1_input_6(0) , 
            core_12_kpu_1_input_7(0) , 
            core_12_kpu_1_input_8(0) , 
            core_12_kpu_1_input_9(0) 
        );

    conv_core13 : entity work.conv4_core13
        generic map
        (
            PIPELINE_STEPS => RMCM_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,

            layer_xi_13_signal(2),
            rmcm_select_config_signal_pl(0),
            pad_1(2), pad_2(2), pad_3(2), 

    
            core_13_kpu_1_input_1(0) , 
            core_13_kpu_1_input_2(0) , 
            core_13_kpu_1_input_3(0) , 
            core_13_kpu_1_input_4(0) , 
            core_13_kpu_1_input_5(0) , 
            core_13_kpu_1_input_6(0) , 
            core_13_kpu_1_input_7(0) , 
            core_13_kpu_1_input_8(0) , 
            core_13_kpu_1_input_9(0) 
        );

    conv_core14 : entity work.conv4_core14
        generic map
        (
            PIPELINE_STEPS => RMCM_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,

            layer_xi_14_signal(2),
            rmcm_select_config_signal_pl(0),
            pad_1(2), pad_2(2), pad_3(2), 

    
            core_14_kpu_1_input_1(0) , 
            core_14_kpu_1_input_2(0) , 
            core_14_kpu_1_input_3(0) , 
            core_14_kpu_1_input_4(0) , 
            core_14_kpu_1_input_5(0) , 
            core_14_kpu_1_input_6(0) , 
            core_14_kpu_1_input_7(0) , 
            core_14_kpu_1_input_8(0) , 
            core_14_kpu_1_input_9(0) 
        );

    conv_core15 : entity work.conv4_core15
        generic map
        (
            PIPELINE_STEPS => RMCM_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,

            layer_xi_15_signal(2),
            rmcm_select_config_signal_pl(0),
            pad_1(2), pad_2(2), pad_3(2), 

    
            core_15_kpu_1_input_1(0) , 
            core_15_kpu_1_input_2(0) , 
            core_15_kpu_1_input_3(0) , 
            core_15_kpu_1_input_4(0) , 
            core_15_kpu_1_input_5(0) , 
            core_15_kpu_1_input_6(0) , 
            core_15_kpu_1_input_7(0) , 
            core_15_kpu_1_input_8(0) , 
            core_15_kpu_1_input_9(0) 
        );

    conv_core16 : entity work.conv4_core16
        generic map
        (
            PIPELINE_STEPS => RMCM_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,

            layer_xi_16_signal(2),
            rmcm_select_config_signal_pl(0),
            pad_1(2), pad_2(2), pad_3(2), 

    
            core_16_kpu_1_input_1(0) , 
            core_16_kpu_1_input_2(0) , 
            core_16_kpu_1_input_3(0) , 
            core_16_kpu_1_input_4(0) , 
            core_16_kpu_1_input_5(0) , 
            core_16_kpu_1_input_6(0) , 
            core_16_kpu_1_input_7(0) , 
            core_16_kpu_1_input_8(0) , 
            core_16_kpu_1_input_9(0) 
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
  

  
    core_1_KPU_1 : entity work.conv4_core1_KPU1
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_1_kpu_1_input_1(0), --	sfix(5, -4)
            core_1_kpu_1_input_2(0), --	sfix(5, -4)
            core_1_kpu_1_input_3(0), --	sfix(1, -4)
            core_1_kpu_1_input_4(0), --	sfix(5, -4)
            core_1_kpu_1_input_5(0), --	sfix(6, -4)
            core_1_kpu_1_input_6(0), --	sfix(6, -4)
            core_1_kpu_1_input_7(0), --	sfix(5, -4)
            core_1_kpu_1_input_8(0), --	sfix(5, -4)
            core_1_kpu_1_input_9(0), --	sfix(5, -4)

        
            core_1_concat_big_undelayed_array(12-1 downto 0),
            core_1_concat_big_delayed_array(12-1 downto 0),
            core_1_concat_big_undelayed_array(26-1 downto 12),
            core_1_concat_big_delayed_array(26-1 downto 12),

        
            core_1_concat_small_undelayed_array(9-1 downto 0),
            core_1_concat_small_delayed_array(9-1 downto 0),
            core_1_concat_small_undelayed_array(20-1 downto 9),
            core_1_concat_small_delayed_array(20-1 downto 9),
            core_1_concat_small_undelayed_array(32-1 downto 20),
            core_1_concat_small_delayed_array(32-1 downto 20),
            core_1_concat_small_undelayed_array(45-1 downto 32),
            core_1_concat_small_delayed_array(45-1 downto 32),
            core_1_concat_small_undelayed_array(59-1 downto 45),
            core_1_concat_small_delayed_array(59-1 downto 45),
            core_1_concat_small_undelayed_array(73-1 downto 59),
            core_1_concat_small_delayed_array(73-1 downto 59),

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
  

  
    core_2_KPU_1 : entity work.conv4_core2_KPU1
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_2_kpu_1_input_1(0), --	sfix(5, -4)
            core_2_kpu_1_input_2(0), --	sfix(5, -4)
            core_2_kpu_1_input_3(0), --	sfix(1, -4)
            core_2_kpu_1_input_4(0), --	sfix(5, -4)
            core_2_kpu_1_input_5(0), --	sfix(6, -4)
            core_2_kpu_1_input_6(0), --	sfix(5, -4)
            core_2_kpu_1_input_7(0), --	sfix(5, -4)
            core_2_kpu_1_input_8(0), --	sfix(5, -4)
            core_2_kpu_1_input_9(0), --	sfix(1, -4)

        
            core_2_concat_big_undelayed_array(12-1 downto 0),
            core_2_concat_big_delayed_array(12-1 downto 0),
            core_2_concat_big_undelayed_array(25-1 downto 12),
            core_2_concat_big_delayed_array(25-1 downto 12),

        
            core_2_concat_small_undelayed_array(9-1 downto 0),
            core_2_concat_small_delayed_array(9-1 downto 0),
            core_2_concat_small_undelayed_array(20-1 downto 9),
            core_2_concat_small_delayed_array(20-1 downto 9),
            core_2_concat_small_undelayed_array(32-1 downto 20),
            core_2_concat_small_delayed_array(32-1 downto 20),
            core_2_concat_small_undelayed_array(45-1 downto 32),
            core_2_concat_small_delayed_array(45-1 downto 32),
            core_2_concat_small_undelayed_array(58-1 downto 45),
            core_2_concat_small_delayed_array(58-1 downto 45),
            core_2_concat_small_undelayed_array(71-1 downto 58),
            core_2_concat_small_delayed_array(71-1 downto 58),

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
  

  
    core_3_KPU_1 : entity work.conv4_core3_KPU1
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_3_kpu_1_input_1(0), --	sfix(9, -4)
            core_3_kpu_1_input_2(0), --	sfix(9, -4)
            core_3_kpu_1_input_3(0), --	sfix(9, -4)
            core_3_kpu_1_input_4(0), --	sfix(5, -4)
            core_3_kpu_1_input_5(0), --	sfix(9, -4)
            core_3_kpu_1_input_6(0), --	sfix(5, -4)
            core_3_kpu_1_input_7(0), --	sfix(9, -4)
            core_3_kpu_1_input_8(0), --	sfix(9, -4)
            core_3_kpu_1_input_9(0), --	sfix(9, -4)

        
            core_3_concat_big_undelayed_array(16-1 downto 0),
            core_3_concat_big_delayed_array(16-1 downto 0),
            core_3_concat_big_undelayed_array(33-1 downto 16),
            core_3_concat_big_delayed_array(33-1 downto 16),

        
            core_3_concat_small_undelayed_array(13-1 downto 0),
            core_3_concat_small_delayed_array(13-1 downto 0),
            core_3_concat_small_undelayed_array(28-1 downto 13),
            core_3_concat_small_delayed_array(28-1 downto 13),
            core_3_concat_small_undelayed_array(45-1 downto 28),
            core_3_concat_small_delayed_array(45-1 downto 28),
            core_3_concat_small_undelayed_array(62-1 downto 45),
            core_3_concat_small_delayed_array(62-1 downto 45),
            core_3_concat_small_undelayed_array(79-1 downto 62),
            core_3_concat_small_delayed_array(79-1 downto 62),
            core_3_concat_small_undelayed_array(96-1 downto 79),
            core_3_concat_small_delayed_array(96-1 downto 79),

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
  

  
    core_4_KPU_1 : entity work.conv4_core4_KPU1
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_4_kpu_1_input_1(0), --	sfix(6, -4)
            core_4_kpu_1_input_2(0), --	sfix(7, -4)
            core_4_kpu_1_input_3(0), --	sfix(6, -4)
            core_4_kpu_1_input_4(0), --	sfix(6, -4)
            core_4_kpu_1_input_5(0), --	sfix(7, -4)
            core_4_kpu_1_input_6(0), --	sfix(6, -4)
            core_4_kpu_1_input_7(0), --	sfix(6, -4)
            core_4_kpu_1_input_8(0), --	sfix(6, -4)
            core_4_kpu_1_input_9(0), --	sfix(5, -4)

        
            core_4_concat_big_undelayed_array(14-1 downto 0),
            core_4_concat_big_delayed_array(14-1 downto 0),
            core_4_concat_big_undelayed_array(29-1 downto 14),
            core_4_concat_big_delayed_array(29-1 downto 14),

        
            core_4_concat_small_undelayed_array(10-1 downto 0),
            core_4_concat_small_delayed_array(10-1 downto 0),
            core_4_concat_small_undelayed_array(22-1 downto 10),
            core_4_concat_small_delayed_array(22-1 downto 10),
            core_4_concat_small_undelayed_array(36-1 downto 22),
            core_4_concat_small_delayed_array(36-1 downto 22),
            core_4_concat_small_undelayed_array(51-1 downto 36),
            core_4_concat_small_delayed_array(51-1 downto 36),
            core_4_concat_small_undelayed_array(66-1 downto 51),
            core_4_concat_small_delayed_array(66-1 downto 51),
            core_4_concat_small_undelayed_array(81-1 downto 66),
            core_4_concat_small_delayed_array(81-1 downto 66),

            -- like this: yo_1
            signal_core_4_yo_1(0)
        );
  
    -- KPU big buffer delays
    -- Delay the single huge std_logic_vector
    core_5_concat_big_delay: entity work.BufferedDelay GENERIC MAP(WL => core_5_concat_big_undelayed_array'length, BL => BIG_BUFFER_DELAY_COUNTER_MAX )
        PORT MAP(reset, clk, buffer_enable_signal(2), big_buffer_delay_counter_signal(1), core_5_concat_big_undelayed_array, core_5_concat_big_delayed_array);


    -- KPU small buffer delays
    -- Delay the single huge std_logic_vector
    core_5_concat_small_delay: entity work.BufferedDelay GENERIC MAP(WL => core_5_concat_small_undelayed_array'length, BL => SMALL_BUFFER_DELAY_COUNTER_MAX )
        PORT MAP(reset, clk, buffer_enable_signal(2), small_buffer_delay_counter_signal(1), core_5_concat_small_undelayed_array, core_5_concat_small_delayed_array);
  

  
    core_5_KPU_1 : entity work.conv4_core5_KPU1
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_5_kpu_1_input_1(0), --	sfix(5, -4)
            core_5_kpu_1_input_2(0), --	sfix(5, -4)
            core_5_kpu_1_input_3(0), --	sfix(4, -4)
            core_5_kpu_1_input_4(0), --	sfix(5, -4)
            core_5_kpu_1_input_5(0), --	sfix(5, -4)
            core_5_kpu_1_input_6(0), --	sfix(5, -4)
            core_5_kpu_1_input_7(0), --	sfix(4, -4)
            core_5_kpu_1_input_8(0), --	sfix(4, -4)
            core_5_kpu_1_input_9(0), --	sfix(5, -4)

        
            core_5_concat_big_undelayed_array(12-1 downto 0),
            core_5_concat_big_delayed_array(12-1 downto 0),
            core_5_concat_big_undelayed_array(25-1 downto 12),
            core_5_concat_big_delayed_array(25-1 downto 12),

        
            core_5_concat_small_undelayed_array(9-1 downto 0),
            core_5_concat_small_delayed_array(9-1 downto 0),
            core_5_concat_small_undelayed_array(20-1 downto 9),
            core_5_concat_small_delayed_array(20-1 downto 9),
            core_5_concat_small_undelayed_array(33-1 downto 20),
            core_5_concat_small_delayed_array(33-1 downto 20),
            core_5_concat_small_undelayed_array(46-1 downto 33),
            core_5_concat_small_delayed_array(46-1 downto 33),
            core_5_concat_small_undelayed_array(59-1 downto 46),
            core_5_concat_small_delayed_array(59-1 downto 46),
            core_5_concat_small_undelayed_array(72-1 downto 59),
            core_5_concat_small_delayed_array(72-1 downto 59),

            -- like this: yo_1
            signal_core_5_yo_1(0)
        );
  
    -- KPU big buffer delays
    -- Delay the single huge std_logic_vector
    core_6_concat_big_delay: entity work.BufferedDelay GENERIC MAP(WL => core_6_concat_big_undelayed_array'length, BL => BIG_BUFFER_DELAY_COUNTER_MAX )
        PORT MAP(reset, clk, buffer_enable_signal(2), big_buffer_delay_counter_signal(1), core_6_concat_big_undelayed_array, core_6_concat_big_delayed_array);


    -- KPU small buffer delays
    -- Delay the single huge std_logic_vector
    core_6_concat_small_delay: entity work.BufferedDelay GENERIC MAP(WL => core_6_concat_small_undelayed_array'length, BL => SMALL_BUFFER_DELAY_COUNTER_MAX )
        PORT MAP(reset, clk, buffer_enable_signal(2), small_buffer_delay_counter_signal(1), core_6_concat_small_undelayed_array, core_6_concat_small_delayed_array);
  

  
    core_6_KPU_1 : entity work.conv4_core6_KPU1
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_6_kpu_1_input_1(0), --	sfix(11, -4)
            core_6_kpu_1_input_2(0), --	sfix(10, -4)
            core_6_kpu_1_input_3(0), --	sfix(10, -4)
            core_6_kpu_1_input_4(0), --	sfix(11, -4)
            core_6_kpu_1_input_5(0), --	sfix(10, -4)
            core_6_kpu_1_input_6(0), --	sfix(10, -4)
            core_6_kpu_1_input_7(0), --	sfix(11, -4)
            core_6_kpu_1_input_8(0), --	sfix(10, -4)
            core_6_kpu_1_input_9(0), --	sfix(10, -4)

        
            core_6_concat_big_undelayed_array(17-1 downto 0),
            core_6_concat_big_delayed_array(17-1 downto 0),
            core_6_concat_big_undelayed_array(36-1 downto 17),
            core_6_concat_big_delayed_array(36-1 downto 17),

        
            core_6_concat_small_undelayed_array(15-1 downto 0),
            core_6_concat_small_delayed_array(15-1 downto 0),
            core_6_concat_small_undelayed_array(32-1 downto 15),
            core_6_concat_small_delayed_array(32-1 downto 15),
            core_6_concat_small_undelayed_array(50-1 downto 32),
            core_6_concat_small_delayed_array(50-1 downto 32),
            core_6_concat_small_undelayed_array(69-1 downto 50),
            core_6_concat_small_delayed_array(69-1 downto 50),
            core_6_concat_small_undelayed_array(88-1 downto 69),
            core_6_concat_small_delayed_array(88-1 downto 69),
            core_6_concat_small_undelayed_array(107-1 downto 88),
            core_6_concat_small_delayed_array(107-1 downto 88),

            -- like this: yo_1
            signal_core_6_yo_1(0)
        );
  
    -- KPU big buffer delays
    -- Delay the single huge std_logic_vector
    core_7_concat_big_delay: entity work.BufferedDelay GENERIC MAP(WL => core_7_concat_big_undelayed_array'length, BL => BIG_BUFFER_DELAY_COUNTER_MAX )
        PORT MAP(reset, clk, buffer_enable_signal(2), big_buffer_delay_counter_signal(1), core_7_concat_big_undelayed_array, core_7_concat_big_delayed_array);


    -- KPU small buffer delays
    -- Delay the single huge std_logic_vector
    core_7_concat_small_delay: entity work.BufferedDelay GENERIC MAP(WL => core_7_concat_small_undelayed_array'length, BL => SMALL_BUFFER_DELAY_COUNTER_MAX )
        PORT MAP(reset, clk, buffer_enable_signal(2), small_buffer_delay_counter_signal(1), core_7_concat_small_undelayed_array, core_7_concat_small_delayed_array);
  

  
    core_7_KPU_1 : entity work.conv4_core7_KPU1
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_7_kpu_1_input_1(0), --	sfix(5, -4)
            core_7_kpu_1_input_2(0), --	sfix(6, -4)
            core_7_kpu_1_input_3(0), --	sfix(6, -4)
            core_7_kpu_1_input_4(0), --	sfix(6, -4)
            core_7_kpu_1_input_5(0), --	sfix(5, -4)
            core_7_kpu_1_input_6(0), --	sfix(5, -4)
            core_7_kpu_1_input_7(0), --	sfix(4, -4)
            core_7_kpu_1_input_8(0), --	sfix(5, -4)
            core_7_kpu_1_input_9(0), --	sfix(4, -4)

        
            core_7_concat_big_undelayed_array(13-1 downto 0),
            core_7_concat_big_delayed_array(13-1 downto 0),
            core_7_concat_big_undelayed_array(27-1 downto 13),
            core_7_concat_big_delayed_array(27-1 downto 13),

        
            core_7_concat_small_undelayed_array(9-1 downto 0),
            core_7_concat_small_delayed_array(9-1 downto 0),
            core_7_concat_small_undelayed_array(20-1 downto 9),
            core_7_concat_small_delayed_array(20-1 downto 9),
            core_7_concat_small_undelayed_array(34-1 downto 20),
            core_7_concat_small_delayed_array(34-1 downto 20),
            core_7_concat_small_undelayed_array(48-1 downto 34),
            core_7_concat_small_delayed_array(48-1 downto 34),
            core_7_concat_small_undelayed_array(62-1 downto 48),
            core_7_concat_small_delayed_array(62-1 downto 48),
            core_7_concat_small_undelayed_array(76-1 downto 62),
            core_7_concat_small_delayed_array(76-1 downto 62),

            -- like this: yo_1
            signal_core_7_yo_1(0)
        );
  
    -- KPU big buffer delays
    -- Delay the single huge std_logic_vector
    core_8_concat_big_delay: entity work.BufferedDelay GENERIC MAP(WL => core_8_concat_big_undelayed_array'length, BL => BIG_BUFFER_DELAY_COUNTER_MAX )
        PORT MAP(reset, clk, buffer_enable_signal(2), big_buffer_delay_counter_signal(1), core_8_concat_big_undelayed_array, core_8_concat_big_delayed_array);


    -- KPU small buffer delays
    -- Delay the single huge std_logic_vector
    core_8_concat_small_delay: entity work.BufferedDelay GENERIC MAP(WL => core_8_concat_small_undelayed_array'length, BL => SMALL_BUFFER_DELAY_COUNTER_MAX )
        PORT MAP(reset, clk, buffer_enable_signal(2), small_buffer_delay_counter_signal(1), core_8_concat_small_undelayed_array, core_8_concat_small_delayed_array);
  

  
    core_8_KPU_1 : entity work.conv4_core8_KPU1
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_8_kpu_1_input_1(0), --	sfix(4, -4)
            core_8_kpu_1_input_2(0), --	sfix(5, -4)
            core_8_kpu_1_input_3(0), --	sfix(1, -4)
            core_8_kpu_1_input_4(0), --	sfix(5, -4)
            core_8_kpu_1_input_5(0), --	sfix(5, -4)
            core_8_kpu_1_input_6(0), --	sfix(5, -4)
            core_8_kpu_1_input_7(0), --	sfix(5, -4)
            core_8_kpu_1_input_8(0), --	sfix(5, -4)
            core_8_kpu_1_input_9(0), --	sfix(1, -4)

        
            core_8_concat_big_undelayed_array(11-1 downto 0),
            core_8_concat_big_delayed_array(11-1 downto 0),
            core_8_concat_big_undelayed_array(23-1 downto 11),
            core_8_concat_big_delayed_array(23-1 downto 11),

        
            core_8_concat_small_undelayed_array(8-1 downto 0),
            core_8_concat_small_delayed_array(8-1 downto 0),
            core_8_concat_small_undelayed_array(18-1 downto 8),
            core_8_concat_small_delayed_array(18-1 downto 8),
            core_8_concat_small_undelayed_array(29-1 downto 18),
            core_8_concat_small_delayed_array(29-1 downto 18),
            core_8_concat_small_undelayed_array(41-1 downto 29),
            core_8_concat_small_delayed_array(41-1 downto 29),
            core_8_concat_small_undelayed_array(53-1 downto 41),
            core_8_concat_small_delayed_array(53-1 downto 41),
            core_8_concat_small_undelayed_array(65-1 downto 53),
            core_8_concat_small_delayed_array(65-1 downto 53),

            -- like this: yo_1
            signal_core_8_yo_1(0)
        );
  
    -- KPU big buffer delays
    -- Delay the single huge std_logic_vector
    core_9_concat_big_delay: entity work.BufferedDelay GENERIC MAP(WL => core_9_concat_big_undelayed_array'length, BL => BIG_BUFFER_DELAY_COUNTER_MAX )
        PORT MAP(reset, clk, buffer_enable_signal(2), big_buffer_delay_counter_signal(1), core_9_concat_big_undelayed_array, core_9_concat_big_delayed_array);


    -- KPU small buffer delays
    -- Delay the single huge std_logic_vector
    core_9_concat_small_delay: entity work.BufferedDelay GENERIC MAP(WL => core_9_concat_small_undelayed_array'length, BL => SMALL_BUFFER_DELAY_COUNTER_MAX )
        PORT MAP(reset, clk, buffer_enable_signal(2), small_buffer_delay_counter_signal(1), core_9_concat_small_undelayed_array, core_9_concat_small_delayed_array);
  

  
    core_9_KPU_1 : entity work.conv4_core9_KPU1
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_9_kpu_1_input_1(0), --	sfix(6, -4)
            core_9_kpu_1_input_2(0), --	sfix(7, -4)
            core_9_kpu_1_input_3(0), --	sfix(4, -4)
            core_9_kpu_1_input_4(0), --	sfix(6, -4)
            core_9_kpu_1_input_5(0), --	sfix(5, -4)
            core_9_kpu_1_input_6(0), --	sfix(4, -4)
            core_9_kpu_1_input_7(0), --	sfix(7, -4)
            core_9_kpu_1_input_8(0), --	sfix(7, -4)
            core_9_kpu_1_input_9(0), --	sfix(1, -4)

        
            core_9_concat_big_undelayed_array(14-1 downto 0),
            core_9_concat_big_delayed_array(14-1 downto 0),
            core_9_concat_big_undelayed_array(28-1 downto 14),
            core_9_concat_big_delayed_array(28-1 downto 14),

        
            core_9_concat_small_undelayed_array(10-1 downto 0),
            core_9_concat_small_delayed_array(10-1 downto 0),
            core_9_concat_small_undelayed_array(22-1 downto 10),
            core_9_concat_small_delayed_array(22-1 downto 10),
            core_9_concat_small_undelayed_array(36-1 downto 22),
            core_9_concat_small_delayed_array(36-1 downto 22),
            core_9_concat_small_undelayed_array(50-1 downto 36),
            core_9_concat_small_delayed_array(50-1 downto 36),
            core_9_concat_small_undelayed_array(64-1 downto 50),
            core_9_concat_small_delayed_array(64-1 downto 50),
            core_9_concat_small_undelayed_array(78-1 downto 64),
            core_9_concat_small_delayed_array(78-1 downto 64),

            -- like this: yo_1
            signal_core_9_yo_1(0)
        );
  
    -- KPU big buffer delays
    -- Delay the single huge std_logic_vector
    core_10_concat_big_delay: entity work.BufferedDelay GENERIC MAP(WL => core_10_concat_big_undelayed_array'length, BL => BIG_BUFFER_DELAY_COUNTER_MAX )
        PORT MAP(reset, clk, buffer_enable_signal(2), big_buffer_delay_counter_signal(1), core_10_concat_big_undelayed_array, core_10_concat_big_delayed_array);


    -- KPU small buffer delays
    -- Delay the single huge std_logic_vector
    core_10_concat_small_delay: entity work.BufferedDelay GENERIC MAP(WL => core_10_concat_small_undelayed_array'length, BL => SMALL_BUFFER_DELAY_COUNTER_MAX )
        PORT MAP(reset, clk, buffer_enable_signal(2), small_buffer_delay_counter_signal(1), core_10_concat_small_undelayed_array, core_10_concat_small_delayed_array);
  

  
    core_10_KPU_1 : entity work.conv4_core10_KPU1
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_10_kpu_1_input_1(0), --	sfix(7, -4)
            core_10_kpu_1_input_2(0), --	sfix(7, -4)
            core_10_kpu_1_input_3(0), --	sfix(7, -4)
            core_10_kpu_1_input_4(0), --	sfix(7, -4)
            core_10_kpu_1_input_5(0), --	sfix(6, -4)
            core_10_kpu_1_input_6(0), --	sfix(7, -4)
            core_10_kpu_1_input_7(0), --	sfix(6, -4)
            core_10_kpu_1_input_8(0), --	sfix(6, -4)
            core_10_kpu_1_input_9(0), --	sfix(6, -4)

        
            core_10_concat_big_undelayed_array(13-1 downto 0),
            core_10_concat_big_delayed_array(13-1 downto 0),
            core_10_concat_big_undelayed_array(27-1 downto 13),
            core_10_concat_big_delayed_array(27-1 downto 13),

        
            core_10_concat_small_undelayed_array(11-1 downto 0),
            core_10_concat_small_delayed_array(11-1 downto 0),
            core_10_concat_small_undelayed_array(24-1 downto 11),
            core_10_concat_small_delayed_array(24-1 downto 11),
            core_10_concat_small_undelayed_array(38-1 downto 24),
            core_10_concat_small_delayed_array(38-1 downto 24),
            core_10_concat_small_undelayed_array(52-1 downto 38),
            core_10_concat_small_delayed_array(52-1 downto 38),
            core_10_concat_small_undelayed_array(66-1 downto 52),
            core_10_concat_small_delayed_array(66-1 downto 52),
            core_10_concat_small_undelayed_array(80-1 downto 66),
            core_10_concat_small_delayed_array(80-1 downto 66),

            -- like this: yo_1
            signal_core_10_yo_1(0)
        );
  
    -- KPU big buffer delays
    -- Delay the single huge std_logic_vector
    core_11_concat_big_delay: entity work.BufferedDelay GENERIC MAP(WL => core_11_concat_big_undelayed_array'length, BL => BIG_BUFFER_DELAY_COUNTER_MAX )
        PORT MAP(reset, clk, buffer_enable_signal(2), big_buffer_delay_counter_signal(1), core_11_concat_big_undelayed_array, core_11_concat_big_delayed_array);


    -- KPU small buffer delays
    -- Delay the single huge std_logic_vector
    core_11_concat_small_delay: entity work.BufferedDelay GENERIC MAP(WL => core_11_concat_small_undelayed_array'length, BL => SMALL_BUFFER_DELAY_COUNTER_MAX )
        PORT MAP(reset, clk, buffer_enable_signal(2), small_buffer_delay_counter_signal(1), core_11_concat_small_undelayed_array, core_11_concat_small_delayed_array);
  

  
    core_11_KPU_1 : entity work.conv4_core11_KPU1
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_11_kpu_1_input_1(0), --	sfix(4, -4)
            core_11_kpu_1_input_2(0), --	sfix(5, -4)
            core_11_kpu_1_input_3(0), --	sfix(5, -4)
            core_11_kpu_1_input_4(0), --	sfix(4, -4)
            core_11_kpu_1_input_5(0), --	sfix(5, -4)
            core_11_kpu_1_input_6(0), --	sfix(5, -4)
            core_11_kpu_1_input_7(0), --	sfix(4, -4)
            core_11_kpu_1_input_8(0), --	sfix(1, -4)
            core_11_kpu_1_input_9(0), --	sfix(4, -4)

        
            core_11_concat_big_undelayed_array(11-1 downto 0),
            core_11_concat_big_delayed_array(11-1 downto 0),
            core_11_concat_big_undelayed_array(23-1 downto 11),
            core_11_concat_big_delayed_array(23-1 downto 11),

        
            core_11_concat_small_undelayed_array(8-1 downto 0),
            core_11_concat_small_delayed_array(8-1 downto 0),
            core_11_concat_small_undelayed_array(18-1 downto 8),
            core_11_concat_small_delayed_array(18-1 downto 8),
            core_11_concat_small_undelayed_array(30-1 downto 18),
            core_11_concat_small_delayed_array(30-1 downto 18),
            core_11_concat_small_undelayed_array(42-1 downto 30),
            core_11_concat_small_delayed_array(42-1 downto 30),
            core_11_concat_small_undelayed_array(54-1 downto 42),
            core_11_concat_small_delayed_array(54-1 downto 42),
            core_11_concat_small_undelayed_array(66-1 downto 54),
            core_11_concat_small_delayed_array(66-1 downto 54),

            -- like this: yo_1
            signal_core_11_yo_1(0)
        );
  
    -- KPU big buffer delays
    -- Delay the single huge std_logic_vector
    core_12_concat_big_delay: entity work.BufferedDelay GENERIC MAP(WL => core_12_concat_big_undelayed_array'length, BL => BIG_BUFFER_DELAY_COUNTER_MAX )
        PORT MAP(reset, clk, buffer_enable_signal(2), big_buffer_delay_counter_signal(1), core_12_concat_big_undelayed_array, core_12_concat_big_delayed_array);


    -- KPU small buffer delays
    -- Delay the single huge std_logic_vector
    core_12_concat_small_delay: entity work.BufferedDelay GENERIC MAP(WL => core_12_concat_small_undelayed_array'length, BL => SMALL_BUFFER_DELAY_COUNTER_MAX )
        PORT MAP(reset, clk, buffer_enable_signal(2), small_buffer_delay_counter_signal(1), core_12_concat_small_undelayed_array, core_12_concat_small_delayed_array);
  

  
    core_12_KPU_1 : entity work.conv4_core12_KPU1
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_12_kpu_1_input_1(0), --	sfix(7, -4)
            core_12_kpu_1_input_2(0), --	sfix(8, -4)
            core_12_kpu_1_input_3(0), --	sfix(6, -4)
            core_12_kpu_1_input_4(0), --	sfix(5, -4)
            core_12_kpu_1_input_5(0), --	sfix(5, -4)
            core_12_kpu_1_input_6(0), --	sfix(5, -4)
            core_12_kpu_1_input_7(0), --	sfix(7, -4)
            core_12_kpu_1_input_8(0), --	sfix(8, -4)
            core_12_kpu_1_input_9(0), --	sfix(6, -4)

        
            core_12_concat_big_undelayed_array(14-1 downto 0),
            core_12_concat_big_delayed_array(14-1 downto 0),
            core_12_concat_big_undelayed_array(28-1 downto 14),
            core_12_concat_big_delayed_array(28-1 downto 14),

        
            core_12_concat_small_undelayed_array(11-1 downto 0),
            core_12_concat_small_delayed_array(11-1 downto 0),
            core_12_concat_small_undelayed_array(24-1 downto 11),
            core_12_concat_small_delayed_array(24-1 downto 11),
            core_12_concat_small_undelayed_array(38-1 downto 24),
            core_12_concat_small_delayed_array(38-1 downto 24),
            core_12_concat_small_undelayed_array(52-1 downto 38),
            core_12_concat_small_delayed_array(52-1 downto 38),
            core_12_concat_small_undelayed_array(66-1 downto 52),
            core_12_concat_small_delayed_array(66-1 downto 52),
            core_12_concat_small_undelayed_array(80-1 downto 66),
            core_12_concat_small_delayed_array(80-1 downto 66),

            -- like this: yo_1
            signal_core_12_yo_1(0)
        );
  
    -- KPU big buffer delays
    -- Delay the single huge std_logic_vector
    core_13_concat_big_delay: entity work.BufferedDelay GENERIC MAP(WL => core_13_concat_big_undelayed_array'length, BL => BIG_BUFFER_DELAY_COUNTER_MAX )
        PORT MAP(reset, clk, buffer_enable_signal(2), big_buffer_delay_counter_signal(1), core_13_concat_big_undelayed_array, core_13_concat_big_delayed_array);


    -- KPU small buffer delays
    -- Delay the single huge std_logic_vector
    core_13_concat_small_delay: entity work.BufferedDelay GENERIC MAP(WL => core_13_concat_small_undelayed_array'length, BL => SMALL_BUFFER_DELAY_COUNTER_MAX )
        PORT MAP(reset, clk, buffer_enable_signal(2), small_buffer_delay_counter_signal(1), core_13_concat_small_undelayed_array, core_13_concat_small_delayed_array);
  

  
    core_13_KPU_1 : entity work.conv4_core13_KPU1
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_13_kpu_1_input_1(0), --	sfix(10, -4)
            core_13_kpu_1_input_2(0), --	sfix(7, -4)
            core_13_kpu_1_input_3(0), --	sfix(10, -4)
            core_13_kpu_1_input_4(0), --	sfix(10, -4)
            core_13_kpu_1_input_5(0), --	sfix(9, -4)
            core_13_kpu_1_input_6(0), --	sfix(11, -4)
            core_13_kpu_1_input_7(0), --	sfix(10, -4)
            core_13_kpu_1_input_8(0), --	sfix(10, -4)
            core_13_kpu_1_input_9(0), --	sfix(9, -4)

        
            core_13_concat_big_undelayed_array(16-1 downto 0),
            core_13_concat_big_delayed_array(16-1 downto 0),
            core_13_concat_big_undelayed_array(34-1 downto 16),
            core_13_concat_big_delayed_array(34-1 downto 16),

        
            core_13_concat_small_undelayed_array(14-1 downto 0),
            core_13_concat_small_delayed_array(14-1 downto 0),
            core_13_concat_small_undelayed_array(30-1 downto 14),
            core_13_concat_small_delayed_array(30-1 downto 14),
            core_13_concat_small_undelayed_array(47-1 downto 30),
            core_13_concat_small_delayed_array(47-1 downto 30),
            core_13_concat_small_undelayed_array(64-1 downto 47),
            core_13_concat_small_delayed_array(64-1 downto 47),
            core_13_concat_small_undelayed_array(82-1 downto 64),
            core_13_concat_small_delayed_array(82-1 downto 64),
            core_13_concat_small_undelayed_array(100-1 downto 82),
            core_13_concat_small_delayed_array(100-1 downto 82),

            -- like this: yo_1
            signal_core_13_yo_1(0)
        );
  
    -- KPU big buffer delays
    -- Delay the single huge std_logic_vector
    core_14_concat_big_delay: entity work.BufferedDelay GENERIC MAP(WL => core_14_concat_big_undelayed_array'length, BL => BIG_BUFFER_DELAY_COUNTER_MAX )
        PORT MAP(reset, clk, buffer_enable_signal(2), big_buffer_delay_counter_signal(1), core_14_concat_big_undelayed_array, core_14_concat_big_delayed_array);


    -- KPU small buffer delays
    -- Delay the single huge std_logic_vector
    core_14_concat_small_delay: entity work.BufferedDelay GENERIC MAP(WL => core_14_concat_small_undelayed_array'length, BL => SMALL_BUFFER_DELAY_COUNTER_MAX )
        PORT MAP(reset, clk, buffer_enable_signal(2), small_buffer_delay_counter_signal(1), core_14_concat_small_undelayed_array, core_14_concat_small_delayed_array);
  

  
    core_14_KPU_1 : entity work.conv4_core14_KPU1
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_14_kpu_1_input_1(0), --	sfix(5, -4)
            core_14_kpu_1_input_2(0), --	sfix(5, -4)
            core_14_kpu_1_input_3(0), --	sfix(4, -4)
            core_14_kpu_1_input_4(0), --	sfix(6, -4)
            core_14_kpu_1_input_5(0), --	sfix(5, -4)
            core_14_kpu_1_input_6(0), --	sfix(4, -4)
            core_14_kpu_1_input_7(0), --	sfix(5, -4)
            core_14_kpu_1_input_8(0), --	sfix(5, -4)
            core_14_kpu_1_input_9(0), --	sfix(4, -4)

        
            core_14_concat_big_undelayed_array(12-1 downto 0),
            core_14_concat_big_delayed_array(12-1 downto 0),
            core_14_concat_big_undelayed_array(25-1 downto 12),
            core_14_concat_big_delayed_array(25-1 downto 12),

        
            core_14_concat_small_undelayed_array(9-1 downto 0),
            core_14_concat_small_delayed_array(9-1 downto 0),
            core_14_concat_small_undelayed_array(20-1 downto 9),
            core_14_concat_small_delayed_array(20-1 downto 9),
            core_14_concat_small_undelayed_array(32-1 downto 20),
            core_14_concat_small_delayed_array(32-1 downto 20),
            core_14_concat_small_undelayed_array(45-1 downto 32),
            core_14_concat_small_delayed_array(45-1 downto 32),
            core_14_concat_small_undelayed_array(58-1 downto 45),
            core_14_concat_small_delayed_array(58-1 downto 45),
            core_14_concat_small_undelayed_array(71-1 downto 58),
            core_14_concat_small_delayed_array(71-1 downto 58),

            -- like this: yo_1
            signal_core_14_yo_1(0)
        );
  
    -- KPU big buffer delays
    -- Delay the single huge std_logic_vector
    core_15_concat_big_delay: entity work.BufferedDelay GENERIC MAP(WL => core_15_concat_big_undelayed_array'length, BL => BIG_BUFFER_DELAY_COUNTER_MAX )
        PORT MAP(reset, clk, buffer_enable_signal(2), big_buffer_delay_counter_signal(1), core_15_concat_big_undelayed_array, core_15_concat_big_delayed_array);


    -- KPU small buffer delays
    -- Delay the single huge std_logic_vector
    core_15_concat_small_delay: entity work.BufferedDelay GENERIC MAP(WL => core_15_concat_small_undelayed_array'length, BL => SMALL_BUFFER_DELAY_COUNTER_MAX )
        PORT MAP(reset, clk, buffer_enable_signal(2), small_buffer_delay_counter_signal(1), core_15_concat_small_undelayed_array, core_15_concat_small_delayed_array);
  

  
    core_15_KPU_1 : entity work.conv4_core15_KPU1
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_15_kpu_1_input_1(0), --	sfix(5, -4)
            core_15_kpu_1_input_2(0), --	sfix(5, -4)
            core_15_kpu_1_input_3(0), --	sfix(1, -4)
            core_15_kpu_1_input_4(0), --	sfix(5, -4)
            core_15_kpu_1_input_5(0), --	sfix(5, -4)
            core_15_kpu_1_input_6(0), --	sfix(4, -4)
            core_15_kpu_1_input_7(0), --	sfix(5, -4)
            core_15_kpu_1_input_8(0), --	sfix(5, -4)
            core_15_kpu_1_input_9(0), --	sfix(4, -4)

        
            core_15_concat_big_undelayed_array(12-1 downto 0),
            core_15_concat_big_delayed_array(12-1 downto 0),
            core_15_concat_big_undelayed_array(25-1 downto 12),
            core_15_concat_big_delayed_array(25-1 downto 12),

        
            core_15_concat_small_undelayed_array(9-1 downto 0),
            core_15_concat_small_delayed_array(9-1 downto 0),
            core_15_concat_small_undelayed_array(20-1 downto 9),
            core_15_concat_small_delayed_array(20-1 downto 9),
            core_15_concat_small_undelayed_array(32-1 downto 20),
            core_15_concat_small_delayed_array(32-1 downto 20),
            core_15_concat_small_undelayed_array(45-1 downto 32),
            core_15_concat_small_delayed_array(45-1 downto 32),
            core_15_concat_small_undelayed_array(58-1 downto 45),
            core_15_concat_small_delayed_array(58-1 downto 45),
            core_15_concat_small_undelayed_array(71-1 downto 58),
            core_15_concat_small_delayed_array(71-1 downto 58),

            -- like this: yo_1
            signal_core_15_yo_1(0)
        );
  
    -- KPU big buffer delays
    -- Delay the single huge std_logic_vector
    core_16_concat_big_delay: entity work.BufferedDelay GENERIC MAP(WL => core_16_concat_big_undelayed_array'length, BL => BIG_BUFFER_DELAY_COUNTER_MAX )
        PORT MAP(reset, clk, buffer_enable_signal(2), big_buffer_delay_counter_signal(1), core_16_concat_big_undelayed_array, core_16_concat_big_delayed_array);


    -- KPU small buffer delays
    -- Delay the single huge std_logic_vector
    core_16_concat_small_delay: entity work.BufferedDelay GENERIC MAP(WL => core_16_concat_small_undelayed_array'length, BL => SMALL_BUFFER_DELAY_COUNTER_MAX )
        PORT MAP(reset, clk, buffer_enable_signal(2), small_buffer_delay_counter_signal(1), core_16_concat_small_undelayed_array, core_16_concat_small_delayed_array);
  

  
    core_16_KPU_1 : entity work.conv4_core16_KPU1
        generic map
        (
            PIPELINE_STEPS => KPU_PIPELINE_STEPS
        )
        port map
        (
            clk,
            reset,
            buffer_enable_signal(2),
            core_16_kpu_1_input_1(0), --	sfix(7, -4)
            core_16_kpu_1_input_2(0), --	sfix(5, -4)
            core_16_kpu_1_input_3(0), --	sfix(7, -4)
            core_16_kpu_1_input_4(0), --	sfix(8, -4)
            core_16_kpu_1_input_5(0), --	sfix(5, -4)
            core_16_kpu_1_input_6(0), --	sfix(8, -4)
            core_16_kpu_1_input_7(0), --	sfix(5, -4)
            core_16_kpu_1_input_8(0), --	sfix(5, -4)
            core_16_kpu_1_input_9(0), --	sfix(5, -4)

        
            core_16_concat_big_undelayed_array(13-1 downto 0),
            core_16_concat_big_delayed_array(13-1 downto 0),
            core_16_concat_big_undelayed_array(28-1 downto 13),
            core_16_concat_big_delayed_array(28-1 downto 13),

        
            core_16_concat_small_undelayed_array(11-1 downto 0),
            core_16_concat_small_delayed_array(11-1 downto 0),
            core_16_concat_small_undelayed_array(24-1 downto 11),
            core_16_concat_small_delayed_array(24-1 downto 11),
            core_16_concat_small_undelayed_array(38-1 downto 24),
            core_16_concat_small_delayed_array(38-1 downto 24),
            core_16_concat_small_undelayed_array(53-1 downto 38),
            core_16_concat_small_delayed_array(53-1 downto 38),
            core_16_concat_small_undelayed_array(68-1 downto 53),
            core_16_concat_small_delayed_array(68-1 downto 53),
            core_16_concat_small_undelayed_array(83-1 downto 68),
            core_16_concat_small_delayed_array(83-1 downto 68),

            -- like this: yo_1
            signal_core_16_yo_1(0)
        );

-- # # # Stage 3 (if classical conv): Accumulate KPU outputs # # #
-- # # # IN:  signal_core_[]_yo_16
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
            XI_MSB => 10, XI_LSB => -4,
            YO_MSB => 15, YO_LSB => -4 )
        port map ( signal_core_1_yo_1(0), bias_add_input_1_signal(0) );
    
    Reshape_for_core_2_output_1: entity work.FxPReshape
        generic map (
            XI_MSB => 9, XI_LSB => -4,
            YO_MSB => 15, YO_LSB => -4 )
        port map ( signal_core_2_yo_1(0), bias_add_input_2_signal(0) );
    
    Reshape_for_core_3_output_1: entity work.FxPReshape
        generic map (
            XI_MSB => 13, XI_LSB => -4,
            YO_MSB => 15, YO_LSB => -4 )
        port map ( signal_core_3_yo_1(0), bias_add_input_3_signal(0) );
    
    Reshape_for_core_4_output_1: entity work.FxPReshape
        generic map (
            XI_MSB => 11, XI_LSB => -4,
            YO_MSB => 15, YO_LSB => -4 )
        port map ( signal_core_4_yo_1(0), bias_add_input_4_signal(0) );
    
    Reshape_for_core_5_output_1: entity work.FxPReshape
        generic map (
            XI_MSB => 9, XI_LSB => -4,
            YO_MSB => 15, YO_LSB => -4 )
        port map ( signal_core_5_yo_1(0), bias_add_input_5_signal(0) );
    
    Reshape_for_core_6_output_1: entity work.FxPReshape
        generic map (
            XI_MSB => 15, XI_LSB => -4,
            YO_MSB => 15, YO_LSB => -4 )
        port map ( signal_core_6_yo_1(0), bias_add_input_6_signal(0) );
    
    Reshape_for_core_7_output_1: entity work.FxPReshape
        generic map (
            XI_MSB => 10, XI_LSB => -4,
            YO_MSB => 15, YO_LSB => -4 )
        port map ( signal_core_7_yo_1(0), bias_add_input_7_signal(0) );
    
    Reshape_for_core_8_output_1: entity work.FxPReshape
        generic map (
            XI_MSB => 8, XI_LSB => -4,
            YO_MSB => 15, YO_LSB => -4 )
        port map ( signal_core_8_yo_1(0), bias_add_input_8_signal(0) );
    
    Reshape_for_core_9_output_1: entity work.FxPReshape
        generic map (
            XI_MSB => 10, XI_LSB => -4,
            YO_MSB => 15, YO_LSB => -4 )
        port map ( signal_core_9_yo_1(0), bias_add_input_9_signal(0) );
    
    Reshape_for_core_10_output_1: entity work.FxPReshape
        generic map (
            XI_MSB => 10, XI_LSB => -4,
            YO_MSB => 15, YO_LSB => -4 )
        port map ( signal_core_10_yo_1(0), bias_add_input_10_signal(0) );
    
    Reshape_for_core_11_output_1: entity work.FxPReshape
        generic map (
            XI_MSB => 8, XI_LSB => -4,
            YO_MSB => 15, YO_LSB => -4 )
        port map ( signal_core_11_yo_1(0), bias_add_input_11_signal(0) );
    
    Reshape_for_core_12_output_1: entity work.FxPReshape
        generic map (
            XI_MSB => 10, XI_LSB => -4,
            YO_MSB => 15, YO_LSB => -4 )
        port map ( signal_core_12_yo_1(0), bias_add_input_12_signal(0) );
    
    Reshape_for_core_13_output_1: entity work.FxPReshape
        generic map (
            XI_MSB => 14, XI_LSB => -4,
            YO_MSB => 15, YO_LSB => -4 )
        port map ( signal_core_13_yo_1(0), bias_add_input_13_signal(0) );
    
    Reshape_for_core_14_output_1: entity work.FxPReshape
        generic map (
            XI_MSB => 9, XI_LSB => -4,
            YO_MSB => 15, YO_LSB => -4 )
        port map ( signal_core_14_yo_1(0), bias_add_input_14_signal(0) );
    
    Reshape_for_core_15_output_1: entity work.FxPReshape
        generic map (
            XI_MSB => 9, XI_LSB => -4,
            YO_MSB => 15, YO_LSB => -4 )
        port map ( signal_core_15_yo_1(0), bias_add_input_15_signal(0) );
    
    Reshape_for_core_16_output_1: entity work.FxPReshape
        generic map (
            XI_MSB => 11, XI_LSB => -4,
            YO_MSB => 15, YO_LSB => -4 )
        port map ( signal_core_16_yo_1(0), bias_add_input_16_signal(0) );
    

-- # # # Stage 4 (optional): Add the bias # # #
-- # # # IN:  bias_add_input_[1]_signal
-- # # # OUT: layer_yo_[16]_pre

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

    bias_add : entity work.conv4_bias_add
        Port map (
            clk,
            buffer_enable_signal(5),
        
            rmcm_select_config_signal_pl(5),
        
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
            layer_yo_16_pre(0) 
        );


    -- Add a pipeline step
    PL_STEP_5_for_y_is_valid_signal: entity work.Pipe GENERIC MAP(STEPS => 0) PORT MAP(clk, '1', y_is_valid_signal(5), y_is_valid_signal(6));


-- # # # Stage 5 (optional): Clip msbs if the real input sample says so # # #
-- # # # IN:  layer_yo_[16]_pre
-- # # # OUT: layer_yo_[16]

-- Add a pipeline step after the bias add / the accumulator
-- Add a pipeline step
    PL_STEP_6_for_y_is_valid_signal: entity work.Pipe PORT MAP(clk, '1', y_is_valid_signal(6), y_is_valid_signal(7));
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
  
    layer_yo_1 <= layer_yo_1_signal; --	sfix(6, -2)
    layer_yo_2 <= layer_yo_2_signal; --	sfix(6, -2)
    layer_yo_3 <= layer_yo_3_signal; --	sfix(6, -2)
    layer_yo_4 <= layer_yo_4_signal; --	sfix(6, -2)
    layer_yo_5 <= layer_yo_5_signal; --	sfix(6, -2)
    layer_yo_6 <= layer_yo_6_signal; --	sfix(6, -2)
    layer_yo_7 <= layer_yo_7_signal; --	sfix(6, -2)
    layer_yo_8 <= layer_yo_8_signal; --	sfix(6, -2)
    layer_yo_9 <= layer_yo_9_signal; --	sfix(6, -2)
    layer_yo_10 <= layer_yo_10_signal; --	sfix(6, -2)
    layer_yo_11 <= layer_yo_11_signal; --	sfix(6, -2)
    layer_yo_12 <= layer_yo_12_signal; --	sfix(6, -2)
    layer_yo_13 <= layer_yo_13_signal; --	sfix(6, -2)
    layer_yo_14 <= layer_yo_14_signal; --	sfix(6, -2)
    layer_yo_15 <= layer_yo_15_signal; --	sfix(6, -2)
    layer_yo_16 <= layer_yo_16_signal; --	sfix(6, -2)

    y_valid <= y_is_valid_signal(7);

    -- FOR DEBUGGING: When producing a valid output -> Check if the output is correct with the TF simulation!
    simulation_validation: entity work.conv4_sim_validator
        Port map (
            clk,
            reset,
            layer_xi_1, --	ufix(4, -3)
            layer_xi_2, --	ufix(4, -3)
            layer_xi_3, --	ufix(4, -3)
            layer_xi_4, --	ufix(4, -3)
            layer_xi_5, --	ufix(4, -3)
            layer_xi_6, --	ufix(4, -3)
            layer_xi_7, --	ufix(4, -3)
            layer_xi_8, --	ufix(4, -3)
            layer_xi_9, --	ufix(4, -3)
            layer_xi_10, --	ufix(4, -3)
            layer_xi_11, --	ufix(4, -3)
            layer_xi_12, --	ufix(4, -3)
            layer_xi_13, --	ufix(4, -3)
            layer_xi_14, --	ufix(4, -3)
            layer_xi_15, --	ufix(4, -3)
            layer_xi_16, --	ufix(4, -3)
            x_is_valid,
            layer_yo_1_signal, --	sfix(6, -2)
            layer_yo_2_signal, --	sfix(6, -2)
            layer_yo_3_signal, --	sfix(6, -2)
            layer_yo_4_signal, --	sfix(6, -2)
            layer_yo_5_signal, --	sfix(6, -2)
            layer_yo_6_signal, --	sfix(6, -2)
            layer_yo_7_signal, --	sfix(6, -2)
            layer_yo_8_signal, --	sfix(6, -2)
            layer_yo_9_signal, --	sfix(6, -2)
            layer_yo_10_signal, --	sfix(6, -2)
            layer_yo_11_signal, --	sfix(6, -2)
            layer_yo_12_signal, --	sfix(6, -2)
            layer_yo_13_signal, --	sfix(6, -2)
            layer_yo_14_signal, --	sfix(6, -2)
            layer_yo_15_signal, --	sfix(6, -2)
            layer_yo_16_signal, --	sfix(6, -2)
            y_is_valid_signal(7)
        );

end Behavioral;