LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
use work.ActivationFunctions.all;
use work.conv11_act_settings.all;

entity conv11_act is
    port
    (
        clk   : in std_logic;
        reset : in std_logic;
    
        layer_xi_1    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_2    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_3    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_4    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_5    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_6    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_7    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_8    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_9    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_10    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_11    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_12    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_13    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_14    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_15    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_16    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_17    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_18    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_19    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_20    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_21    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_22    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_23    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_24    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_25    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_26    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_27    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_28    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_29    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_30    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_31    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_32    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_33    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_34    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_35    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_36    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_37    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_38    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_39    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_40    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_41    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_42    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_43    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_44    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_45    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_46    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_47    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_48    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_49    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_50    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_51    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_52    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_53    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_54    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_55    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_56    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_57    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_58    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_59    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_60    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_61    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_62    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_63    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        layer_xi_64    : in std_logic_vector(8-1 downto 0); --	sfix(4, -4)
        x_is_valid    : in std_logic;

        y_valid    : out std_logic;
        layer_yo_1 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_2 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_3 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_4 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_5 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_6 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_7 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_8 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_9 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_10 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_11 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_12 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_13 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_14 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_15 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_16 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_17 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_18 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_19 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_20 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_21 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_22 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_23 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_24 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_25 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_26 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_27 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_28 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_29 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_30 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_31 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_32 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_33 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_34 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_35 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_36 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_37 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_38 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_39 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_40 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_41 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_42 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_43 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_44 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_45 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_46 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_47 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_48 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_49 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_50 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_51 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_52 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_53 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_54 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_55 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_56 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_57 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_58 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_59 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_60 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_61 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_62 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_63 : out std_logic_vector(7-1 downto 0);  --	ufix(3, -4)
        layer_yo_64 : out std_logic_vector(7-1 downto 0) --	ufix(3, -4)
    ) ;
end conv11_act;

architecture Behavioral of conv11_act is


    attribute KEEP_HIERARCHY : string;
    attribute KEEP_HIERARCHY of conv11_act : entity is "yes";

    type PIPELINE_TYPE_FOR_LAYER_XI_1_SIGNAL    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_2_SIGNAL    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_3_SIGNAL    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_4_SIGNAL    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_5_SIGNAL    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_6_SIGNAL    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_7_SIGNAL    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_8_SIGNAL    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_9_SIGNAL    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_10_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_11_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_12_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_13_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_14_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_15_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_16_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_17_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_18_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_19_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_20_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_21_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_22_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_23_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_24_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_25_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_26_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_27_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_28_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_29_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_30_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_31_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_32_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_33_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_34_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_35_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_36_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_37_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_38_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_39_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_40_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_41_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_42_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_43_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_44_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_45_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_46_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_47_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_48_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_49_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_50_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_51_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_52_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_53_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_54_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_55_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_56_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_57_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_58_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_59_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_60_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_61_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_62_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_63_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_XI_64_SIGNAL   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_X_IS_VALID_SIGNAL    is array(0 to 1) of std_logic;


    -- sfix(4, -4)
    signal layer_xi_1_signal    : PIPELINE_TYPE_FOR_LAYER_XI_1_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_2_signal    : PIPELINE_TYPE_FOR_LAYER_XI_2_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_3_signal    : PIPELINE_TYPE_FOR_LAYER_XI_3_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_4_signal    : PIPELINE_TYPE_FOR_LAYER_XI_4_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_5_signal    : PIPELINE_TYPE_FOR_LAYER_XI_5_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_6_signal    : PIPELINE_TYPE_FOR_LAYER_XI_6_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_7_signal    : PIPELINE_TYPE_FOR_LAYER_XI_7_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_8_signal    : PIPELINE_TYPE_FOR_LAYER_XI_8_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_9_signal    : PIPELINE_TYPE_FOR_LAYER_XI_9_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_10_signal   : PIPELINE_TYPE_FOR_LAYER_XI_10_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_11_signal   : PIPELINE_TYPE_FOR_LAYER_XI_11_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_12_signal   : PIPELINE_TYPE_FOR_LAYER_XI_12_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_13_signal   : PIPELINE_TYPE_FOR_LAYER_XI_13_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_14_signal   : PIPELINE_TYPE_FOR_LAYER_XI_14_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_15_signal   : PIPELINE_TYPE_FOR_LAYER_XI_15_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_16_signal   : PIPELINE_TYPE_FOR_LAYER_XI_16_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_17_signal   : PIPELINE_TYPE_FOR_LAYER_XI_17_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_18_signal   : PIPELINE_TYPE_FOR_LAYER_XI_18_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_19_signal   : PIPELINE_TYPE_FOR_LAYER_XI_19_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_20_signal   : PIPELINE_TYPE_FOR_LAYER_XI_20_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_21_signal   : PIPELINE_TYPE_FOR_LAYER_XI_21_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_22_signal   : PIPELINE_TYPE_FOR_LAYER_XI_22_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_23_signal   : PIPELINE_TYPE_FOR_LAYER_XI_23_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_24_signal   : PIPELINE_TYPE_FOR_LAYER_XI_24_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_25_signal   : PIPELINE_TYPE_FOR_LAYER_XI_25_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_26_signal   : PIPELINE_TYPE_FOR_LAYER_XI_26_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_27_signal   : PIPELINE_TYPE_FOR_LAYER_XI_27_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_28_signal   : PIPELINE_TYPE_FOR_LAYER_XI_28_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_29_signal   : PIPELINE_TYPE_FOR_LAYER_XI_29_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_30_signal   : PIPELINE_TYPE_FOR_LAYER_XI_30_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_31_signal   : PIPELINE_TYPE_FOR_LAYER_XI_31_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_32_signal   : PIPELINE_TYPE_FOR_LAYER_XI_32_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_33_signal   : PIPELINE_TYPE_FOR_LAYER_XI_33_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_34_signal   : PIPELINE_TYPE_FOR_LAYER_XI_34_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_35_signal   : PIPELINE_TYPE_FOR_LAYER_XI_35_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_36_signal   : PIPELINE_TYPE_FOR_LAYER_XI_36_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_37_signal   : PIPELINE_TYPE_FOR_LAYER_XI_37_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_38_signal   : PIPELINE_TYPE_FOR_LAYER_XI_38_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_39_signal   : PIPELINE_TYPE_FOR_LAYER_XI_39_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_40_signal   : PIPELINE_TYPE_FOR_LAYER_XI_40_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_41_signal   : PIPELINE_TYPE_FOR_LAYER_XI_41_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_42_signal   : PIPELINE_TYPE_FOR_LAYER_XI_42_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_43_signal   : PIPELINE_TYPE_FOR_LAYER_XI_43_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_44_signal   : PIPELINE_TYPE_FOR_LAYER_XI_44_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_45_signal   : PIPELINE_TYPE_FOR_LAYER_XI_45_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_46_signal   : PIPELINE_TYPE_FOR_LAYER_XI_46_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_47_signal   : PIPELINE_TYPE_FOR_LAYER_XI_47_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_48_signal   : PIPELINE_TYPE_FOR_LAYER_XI_48_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_49_signal   : PIPELINE_TYPE_FOR_LAYER_XI_49_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_50_signal   : PIPELINE_TYPE_FOR_LAYER_XI_50_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_51_signal   : PIPELINE_TYPE_FOR_LAYER_XI_51_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_52_signal   : PIPELINE_TYPE_FOR_LAYER_XI_52_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_53_signal   : PIPELINE_TYPE_FOR_LAYER_XI_53_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_54_signal   : PIPELINE_TYPE_FOR_LAYER_XI_54_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_55_signal   : PIPELINE_TYPE_FOR_LAYER_XI_55_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_56_signal   : PIPELINE_TYPE_FOR_LAYER_XI_56_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_57_signal   : PIPELINE_TYPE_FOR_LAYER_XI_57_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_58_signal   : PIPELINE_TYPE_FOR_LAYER_XI_58_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_59_signal   : PIPELINE_TYPE_FOR_LAYER_XI_59_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_60_signal   : PIPELINE_TYPE_FOR_LAYER_XI_60_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_61_signal   : PIPELINE_TYPE_FOR_LAYER_XI_61_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_62_signal   : PIPELINE_TYPE_FOR_LAYER_XI_62_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_63_signal   : PIPELINE_TYPE_FOR_LAYER_XI_63_SIGNAL;
    -- sfix(4, -4)
    signal layer_xi_64_signal   : PIPELINE_TYPE_FOR_LAYER_XI_64_SIGNAL;




    -- 
    signal x_is_valid_signal    : PIPELINE_TYPE_FOR_X_IS_VALID_SIGNAL;

begin

-- "Initialize" stuff
    x_is_valid_signal(0) <= x_is_valid;

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
    layer_xi_17_signal(0) <= layer_xi_17;
    layer_xi_18_signal(0) <= layer_xi_18;
    layer_xi_19_signal(0) <= layer_xi_19;
    layer_xi_20_signal(0) <= layer_xi_20;
    layer_xi_21_signal(0) <= layer_xi_21;
    layer_xi_22_signal(0) <= layer_xi_22;
    layer_xi_23_signal(0) <= layer_xi_23;
    layer_xi_24_signal(0) <= layer_xi_24;
    layer_xi_25_signal(0) <= layer_xi_25;
    layer_xi_26_signal(0) <= layer_xi_26;
    layer_xi_27_signal(0) <= layer_xi_27;
    layer_xi_28_signal(0) <= layer_xi_28;
    layer_xi_29_signal(0) <= layer_xi_29;
    layer_xi_30_signal(0) <= layer_xi_30;
    layer_xi_31_signal(0) <= layer_xi_31;
    layer_xi_32_signal(0) <= layer_xi_32;
    layer_xi_33_signal(0) <= layer_xi_33;
    layer_xi_34_signal(0) <= layer_xi_34;
    layer_xi_35_signal(0) <= layer_xi_35;
    layer_xi_36_signal(0) <= layer_xi_36;
    layer_xi_37_signal(0) <= layer_xi_37;
    layer_xi_38_signal(0) <= layer_xi_38;
    layer_xi_39_signal(0) <= layer_xi_39;
    layer_xi_40_signal(0) <= layer_xi_40;
    layer_xi_41_signal(0) <= layer_xi_41;
    layer_xi_42_signal(0) <= layer_xi_42;
    layer_xi_43_signal(0) <= layer_xi_43;
    layer_xi_44_signal(0) <= layer_xi_44;
    layer_xi_45_signal(0) <= layer_xi_45;
    layer_xi_46_signal(0) <= layer_xi_46;
    layer_xi_47_signal(0) <= layer_xi_47;
    layer_xi_48_signal(0) <= layer_xi_48;
    layer_xi_49_signal(0) <= layer_xi_49;
    layer_xi_50_signal(0) <= layer_xi_50;
    layer_xi_51_signal(0) <= layer_xi_51;
    layer_xi_52_signal(0) <= layer_xi_52;
    layer_xi_53_signal(0) <= layer_xi_53;
    layer_xi_54_signal(0) <= layer_xi_54;
    layer_xi_55_signal(0) <= layer_xi_55;
    layer_xi_56_signal(0) <= layer_xi_56;
    layer_xi_57_signal(0) <= layer_xi_57;
    layer_xi_58_signal(0) <= layer_xi_58;
    layer_xi_59_signal(0) <= layer_xi_59;
    layer_xi_60_signal(0) <= layer_xi_60;
    layer_xi_61_signal(0) <= layer_xi_61;
    layer_xi_62_signal(0) <= layer_xi_62;
    layer_xi_63_signal(0) <= layer_xi_63;
    layer_xi_64_signal(0) <= layer_xi_64;

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
    PL_STEP_0_for_layer_xi_16_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_16_signal(0), layer_xi_16_signal(1));
    PL_STEP_0_for_layer_xi_17_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_17_signal(0), layer_xi_17_signal(1));
    PL_STEP_0_for_layer_xi_18_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_18_signal(0), layer_xi_18_signal(1));
    PL_STEP_0_for_layer_xi_19_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_19_signal(0), layer_xi_19_signal(1));
    PL_STEP_0_for_layer_xi_20_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_20_signal(0), layer_xi_20_signal(1));
    PL_STEP_0_for_layer_xi_21_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_21_signal(0), layer_xi_21_signal(1));
    PL_STEP_0_for_layer_xi_22_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_22_signal(0), layer_xi_22_signal(1));
    PL_STEP_0_for_layer_xi_23_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_23_signal(0), layer_xi_23_signal(1));
    PL_STEP_0_for_layer_xi_24_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_24_signal(0), layer_xi_24_signal(1));
    PL_STEP_0_for_layer_xi_25_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_25_signal(0), layer_xi_25_signal(1));
    PL_STEP_0_for_layer_xi_26_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_26_signal(0), layer_xi_26_signal(1));
    PL_STEP_0_for_layer_xi_27_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_27_signal(0), layer_xi_27_signal(1));
    PL_STEP_0_for_layer_xi_28_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_28_signal(0), layer_xi_28_signal(1));
    PL_STEP_0_for_layer_xi_29_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_29_signal(0), layer_xi_29_signal(1));
    PL_STEP_0_for_layer_xi_30_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_30_signal(0), layer_xi_30_signal(1));
    PL_STEP_0_for_layer_xi_31_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_31_signal(0), layer_xi_31_signal(1));
    PL_STEP_0_for_layer_xi_32_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_32_signal(0), layer_xi_32_signal(1));
    PL_STEP_0_for_layer_xi_33_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_33_signal(0), layer_xi_33_signal(1));
    PL_STEP_0_for_layer_xi_34_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_34_signal(0), layer_xi_34_signal(1));
    PL_STEP_0_for_layer_xi_35_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_35_signal(0), layer_xi_35_signal(1));
    PL_STEP_0_for_layer_xi_36_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_36_signal(0), layer_xi_36_signal(1));
    PL_STEP_0_for_layer_xi_37_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_37_signal(0), layer_xi_37_signal(1));
    PL_STEP_0_for_layer_xi_38_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_38_signal(0), layer_xi_38_signal(1));
    PL_STEP_0_for_layer_xi_39_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_39_signal(0), layer_xi_39_signal(1));
    PL_STEP_0_for_layer_xi_40_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_40_signal(0), layer_xi_40_signal(1));
    PL_STEP_0_for_layer_xi_41_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_41_signal(0), layer_xi_41_signal(1));
    PL_STEP_0_for_layer_xi_42_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_42_signal(0), layer_xi_42_signal(1));
    PL_STEP_0_for_layer_xi_43_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_43_signal(0), layer_xi_43_signal(1));
    PL_STEP_0_for_layer_xi_44_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_44_signal(0), layer_xi_44_signal(1));
    PL_STEP_0_for_layer_xi_45_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_45_signal(0), layer_xi_45_signal(1));
    PL_STEP_0_for_layer_xi_46_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_46_signal(0), layer_xi_46_signal(1));
    PL_STEP_0_for_layer_xi_47_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_47_signal(0), layer_xi_47_signal(1));
    PL_STEP_0_for_layer_xi_48_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_48_signal(0), layer_xi_48_signal(1));
    PL_STEP_0_for_layer_xi_49_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_49_signal(0), layer_xi_49_signal(1));
    PL_STEP_0_for_layer_xi_50_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_50_signal(0), layer_xi_50_signal(1));
    PL_STEP_0_for_layer_xi_51_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_51_signal(0), layer_xi_51_signal(1));
    PL_STEP_0_for_layer_xi_52_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_52_signal(0), layer_xi_52_signal(1));
    PL_STEP_0_for_layer_xi_53_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_53_signal(0), layer_xi_53_signal(1));
    PL_STEP_0_for_layer_xi_54_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_54_signal(0), layer_xi_54_signal(1));
    PL_STEP_0_for_layer_xi_55_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_55_signal(0), layer_xi_55_signal(1));
    PL_STEP_0_for_layer_xi_56_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_56_signal(0), layer_xi_56_signal(1));
    PL_STEP_0_for_layer_xi_57_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_57_signal(0), layer_xi_57_signal(1));
    PL_STEP_0_for_layer_xi_58_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_58_signal(0), layer_xi_58_signal(1));
    PL_STEP_0_for_layer_xi_59_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_59_signal(0), layer_xi_59_signal(1));
    PL_STEP_0_for_layer_xi_60_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_60_signal(0), layer_xi_60_signal(1));
    PL_STEP_0_for_layer_xi_61_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_61_signal(0), layer_xi_61_signal(1));
    PL_STEP_0_for_layer_xi_62_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_62_signal(0), layer_xi_62_signal(1));
    PL_STEP_0_for_layer_xi_63_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_63_signal(0), layer_xi_63_signal(1));
    PL_STEP_0_for_layer_xi_64_signal: entity work.Pipe_Vector PORT MAP(clk, '1', layer_xi_64_signal(0), layer_xi_64_signal(1));
    PL_STEP_0_for_x_is_valid_signal: entity work.Pipe PORT MAP(clk, '1', x_is_valid_signal(0), x_is_valid_signal(1));



    set_y_valid: process(reset, clk)
    begin
        if reset = '1' then
            y_valid <= '0';
        elsif rising_edge(clk) then
            y_valid <= x_is_valid_signal(1);
        end if;
    end process;


    relu6_input1: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_1 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_1_signal(1)) < 0 then
                layer_yo_1 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_1_signal(1)) > to_signed(96, layer_xi_1_signal(1)'length) then
                layer_yo_1 <= std_logic_vector(to_unsigned(96, layer_yo_1'length));
            else
                layer_yo_1 <= std_logic_vector(layer_xi_1_signal(1)(layer_xi_1_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input2: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_2 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_2_signal(1)) < 0 then
                layer_yo_2 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_2_signal(1)) > to_signed(96, layer_xi_2_signal(1)'length) then
                layer_yo_2 <= std_logic_vector(to_unsigned(96, layer_yo_2'length));
            else
                layer_yo_2 <= std_logic_vector(layer_xi_2_signal(1)(layer_xi_2_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input3: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_3 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_3_signal(1)) < 0 then
                layer_yo_3 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_3_signal(1)) > to_signed(96, layer_xi_3_signal(1)'length) then
                layer_yo_3 <= std_logic_vector(to_unsigned(96, layer_yo_3'length));
            else
                layer_yo_3 <= std_logic_vector(layer_xi_3_signal(1)(layer_xi_3_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input4: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_4 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_4_signal(1)) < 0 then
                layer_yo_4 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_4_signal(1)) > to_signed(96, layer_xi_4_signal(1)'length) then
                layer_yo_4 <= std_logic_vector(to_unsigned(96, layer_yo_4'length));
            else
                layer_yo_4 <= std_logic_vector(layer_xi_4_signal(1)(layer_xi_4_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input5: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_5 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_5_signal(1)) < 0 then
                layer_yo_5 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_5_signal(1)) > to_signed(96, layer_xi_5_signal(1)'length) then
                layer_yo_5 <= std_logic_vector(to_unsigned(96, layer_yo_5'length));
            else
                layer_yo_5 <= std_logic_vector(layer_xi_5_signal(1)(layer_xi_5_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input6: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_6 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_6_signal(1)) < 0 then
                layer_yo_6 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_6_signal(1)) > to_signed(96, layer_xi_6_signal(1)'length) then
                layer_yo_6 <= std_logic_vector(to_unsigned(96, layer_yo_6'length));
            else
                layer_yo_6 <= std_logic_vector(layer_xi_6_signal(1)(layer_xi_6_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input7: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_7 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_7_signal(1)) < 0 then
                layer_yo_7 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_7_signal(1)) > to_signed(96, layer_xi_7_signal(1)'length) then
                layer_yo_7 <= std_logic_vector(to_unsigned(96, layer_yo_7'length));
            else
                layer_yo_7 <= std_logic_vector(layer_xi_7_signal(1)(layer_xi_7_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input8: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_8 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_8_signal(1)) < 0 then
                layer_yo_8 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_8_signal(1)) > to_signed(96, layer_xi_8_signal(1)'length) then
                layer_yo_8 <= std_logic_vector(to_unsigned(96, layer_yo_8'length));
            else
                layer_yo_8 <= std_logic_vector(layer_xi_8_signal(1)(layer_xi_8_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input9: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_9 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_9_signal(1)) < 0 then
                layer_yo_9 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_9_signal(1)) > to_signed(96, layer_xi_9_signal(1)'length) then
                layer_yo_9 <= std_logic_vector(to_unsigned(96, layer_yo_9'length));
            else
                layer_yo_9 <= std_logic_vector(layer_xi_9_signal(1)(layer_xi_9_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input10: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_10 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_10_signal(1)) < 0 then
                layer_yo_10 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_10_signal(1)) > to_signed(96, layer_xi_10_signal(1)'length) then
                layer_yo_10 <= std_logic_vector(to_unsigned(96, layer_yo_10'length));
            else
                layer_yo_10 <= std_logic_vector(layer_xi_10_signal(1)(layer_xi_10_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input11: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_11 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_11_signal(1)) < 0 then
                layer_yo_11 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_11_signal(1)) > to_signed(96, layer_xi_11_signal(1)'length) then
                layer_yo_11 <= std_logic_vector(to_unsigned(96, layer_yo_11'length));
            else
                layer_yo_11 <= std_logic_vector(layer_xi_11_signal(1)(layer_xi_11_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input12: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_12 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_12_signal(1)) < 0 then
                layer_yo_12 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_12_signal(1)) > to_signed(96, layer_xi_12_signal(1)'length) then
                layer_yo_12 <= std_logic_vector(to_unsigned(96, layer_yo_12'length));
            else
                layer_yo_12 <= std_logic_vector(layer_xi_12_signal(1)(layer_xi_12_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input13: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_13 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_13_signal(1)) < 0 then
                layer_yo_13 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_13_signal(1)) > to_signed(96, layer_xi_13_signal(1)'length) then
                layer_yo_13 <= std_logic_vector(to_unsigned(96, layer_yo_13'length));
            else
                layer_yo_13 <= std_logic_vector(layer_xi_13_signal(1)(layer_xi_13_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input14: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_14 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_14_signal(1)) < 0 then
                layer_yo_14 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_14_signal(1)) > to_signed(96, layer_xi_14_signal(1)'length) then
                layer_yo_14 <= std_logic_vector(to_unsigned(96, layer_yo_14'length));
            else
                layer_yo_14 <= std_logic_vector(layer_xi_14_signal(1)(layer_xi_14_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input15: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_15 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_15_signal(1)) < 0 then
                layer_yo_15 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_15_signal(1)) > to_signed(96, layer_xi_15_signal(1)'length) then
                layer_yo_15 <= std_logic_vector(to_unsigned(96, layer_yo_15'length));
            else
                layer_yo_15 <= std_logic_vector(layer_xi_15_signal(1)(layer_xi_15_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input16: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_16 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_16_signal(1)) < 0 then
                layer_yo_16 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_16_signal(1)) > to_signed(96, layer_xi_16_signal(1)'length) then
                layer_yo_16 <= std_logic_vector(to_unsigned(96, layer_yo_16'length));
            else
                layer_yo_16 <= std_logic_vector(layer_xi_16_signal(1)(layer_xi_16_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input17: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_17 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_17_signal(1)) < 0 then
                layer_yo_17 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_17_signal(1)) > to_signed(96, layer_xi_17_signal(1)'length) then
                layer_yo_17 <= std_logic_vector(to_unsigned(96, layer_yo_17'length));
            else
                layer_yo_17 <= std_logic_vector(layer_xi_17_signal(1)(layer_xi_17_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input18: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_18 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_18_signal(1)) < 0 then
                layer_yo_18 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_18_signal(1)) > to_signed(96, layer_xi_18_signal(1)'length) then
                layer_yo_18 <= std_logic_vector(to_unsigned(96, layer_yo_18'length));
            else
                layer_yo_18 <= std_logic_vector(layer_xi_18_signal(1)(layer_xi_18_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input19: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_19 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_19_signal(1)) < 0 then
                layer_yo_19 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_19_signal(1)) > to_signed(96, layer_xi_19_signal(1)'length) then
                layer_yo_19 <= std_logic_vector(to_unsigned(96, layer_yo_19'length));
            else
                layer_yo_19 <= std_logic_vector(layer_xi_19_signal(1)(layer_xi_19_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input20: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_20 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_20_signal(1)) < 0 then
                layer_yo_20 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_20_signal(1)) > to_signed(96, layer_xi_20_signal(1)'length) then
                layer_yo_20 <= std_logic_vector(to_unsigned(96, layer_yo_20'length));
            else
                layer_yo_20 <= std_logic_vector(layer_xi_20_signal(1)(layer_xi_20_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input21: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_21 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_21_signal(1)) < 0 then
                layer_yo_21 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_21_signal(1)) > to_signed(96, layer_xi_21_signal(1)'length) then
                layer_yo_21 <= std_logic_vector(to_unsigned(96, layer_yo_21'length));
            else
                layer_yo_21 <= std_logic_vector(layer_xi_21_signal(1)(layer_xi_21_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input22: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_22 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_22_signal(1)) < 0 then
                layer_yo_22 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_22_signal(1)) > to_signed(96, layer_xi_22_signal(1)'length) then
                layer_yo_22 <= std_logic_vector(to_unsigned(96, layer_yo_22'length));
            else
                layer_yo_22 <= std_logic_vector(layer_xi_22_signal(1)(layer_xi_22_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input23: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_23 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_23_signal(1)) < 0 then
                layer_yo_23 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_23_signal(1)) > to_signed(96, layer_xi_23_signal(1)'length) then
                layer_yo_23 <= std_logic_vector(to_unsigned(96, layer_yo_23'length));
            else
                layer_yo_23 <= std_logic_vector(layer_xi_23_signal(1)(layer_xi_23_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input24: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_24 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_24_signal(1)) < 0 then
                layer_yo_24 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_24_signal(1)) > to_signed(96, layer_xi_24_signal(1)'length) then
                layer_yo_24 <= std_logic_vector(to_unsigned(96, layer_yo_24'length));
            else
                layer_yo_24 <= std_logic_vector(layer_xi_24_signal(1)(layer_xi_24_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input25: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_25 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_25_signal(1)) < 0 then
                layer_yo_25 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_25_signal(1)) > to_signed(96, layer_xi_25_signal(1)'length) then
                layer_yo_25 <= std_logic_vector(to_unsigned(96, layer_yo_25'length));
            else
                layer_yo_25 <= std_logic_vector(layer_xi_25_signal(1)(layer_xi_25_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input26: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_26 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_26_signal(1)) < 0 then
                layer_yo_26 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_26_signal(1)) > to_signed(96, layer_xi_26_signal(1)'length) then
                layer_yo_26 <= std_logic_vector(to_unsigned(96, layer_yo_26'length));
            else
                layer_yo_26 <= std_logic_vector(layer_xi_26_signal(1)(layer_xi_26_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input27: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_27 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_27_signal(1)) < 0 then
                layer_yo_27 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_27_signal(1)) > to_signed(96, layer_xi_27_signal(1)'length) then
                layer_yo_27 <= std_logic_vector(to_unsigned(96, layer_yo_27'length));
            else
                layer_yo_27 <= std_logic_vector(layer_xi_27_signal(1)(layer_xi_27_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input28: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_28 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_28_signal(1)) < 0 then
                layer_yo_28 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_28_signal(1)) > to_signed(96, layer_xi_28_signal(1)'length) then
                layer_yo_28 <= std_logic_vector(to_unsigned(96, layer_yo_28'length));
            else
                layer_yo_28 <= std_logic_vector(layer_xi_28_signal(1)(layer_xi_28_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input29: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_29 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_29_signal(1)) < 0 then
                layer_yo_29 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_29_signal(1)) > to_signed(96, layer_xi_29_signal(1)'length) then
                layer_yo_29 <= std_logic_vector(to_unsigned(96, layer_yo_29'length));
            else
                layer_yo_29 <= std_logic_vector(layer_xi_29_signal(1)(layer_xi_29_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input30: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_30 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_30_signal(1)) < 0 then
                layer_yo_30 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_30_signal(1)) > to_signed(96, layer_xi_30_signal(1)'length) then
                layer_yo_30 <= std_logic_vector(to_unsigned(96, layer_yo_30'length));
            else
                layer_yo_30 <= std_logic_vector(layer_xi_30_signal(1)(layer_xi_30_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input31: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_31 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_31_signal(1)) < 0 then
                layer_yo_31 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_31_signal(1)) > to_signed(96, layer_xi_31_signal(1)'length) then
                layer_yo_31 <= std_logic_vector(to_unsigned(96, layer_yo_31'length));
            else
                layer_yo_31 <= std_logic_vector(layer_xi_31_signal(1)(layer_xi_31_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input32: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_32 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_32_signal(1)) < 0 then
                layer_yo_32 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_32_signal(1)) > to_signed(96, layer_xi_32_signal(1)'length) then
                layer_yo_32 <= std_logic_vector(to_unsigned(96, layer_yo_32'length));
            else
                layer_yo_32 <= std_logic_vector(layer_xi_32_signal(1)(layer_xi_32_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input33: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_33 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_33_signal(1)) < 0 then
                layer_yo_33 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_33_signal(1)) > to_signed(96, layer_xi_33_signal(1)'length) then
                layer_yo_33 <= std_logic_vector(to_unsigned(96, layer_yo_33'length));
            else
                layer_yo_33 <= std_logic_vector(layer_xi_33_signal(1)(layer_xi_33_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input34: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_34 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_34_signal(1)) < 0 then
                layer_yo_34 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_34_signal(1)) > to_signed(96, layer_xi_34_signal(1)'length) then
                layer_yo_34 <= std_logic_vector(to_unsigned(96, layer_yo_34'length));
            else
                layer_yo_34 <= std_logic_vector(layer_xi_34_signal(1)(layer_xi_34_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input35: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_35 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_35_signal(1)) < 0 then
                layer_yo_35 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_35_signal(1)) > to_signed(96, layer_xi_35_signal(1)'length) then
                layer_yo_35 <= std_logic_vector(to_unsigned(96, layer_yo_35'length));
            else
                layer_yo_35 <= std_logic_vector(layer_xi_35_signal(1)(layer_xi_35_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input36: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_36 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_36_signal(1)) < 0 then
                layer_yo_36 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_36_signal(1)) > to_signed(96, layer_xi_36_signal(1)'length) then
                layer_yo_36 <= std_logic_vector(to_unsigned(96, layer_yo_36'length));
            else
                layer_yo_36 <= std_logic_vector(layer_xi_36_signal(1)(layer_xi_36_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input37: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_37 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_37_signal(1)) < 0 then
                layer_yo_37 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_37_signal(1)) > to_signed(96, layer_xi_37_signal(1)'length) then
                layer_yo_37 <= std_logic_vector(to_unsigned(96, layer_yo_37'length));
            else
                layer_yo_37 <= std_logic_vector(layer_xi_37_signal(1)(layer_xi_37_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input38: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_38 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_38_signal(1)) < 0 then
                layer_yo_38 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_38_signal(1)) > to_signed(96, layer_xi_38_signal(1)'length) then
                layer_yo_38 <= std_logic_vector(to_unsigned(96, layer_yo_38'length));
            else
                layer_yo_38 <= std_logic_vector(layer_xi_38_signal(1)(layer_xi_38_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input39: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_39 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_39_signal(1)) < 0 then
                layer_yo_39 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_39_signal(1)) > to_signed(96, layer_xi_39_signal(1)'length) then
                layer_yo_39 <= std_logic_vector(to_unsigned(96, layer_yo_39'length));
            else
                layer_yo_39 <= std_logic_vector(layer_xi_39_signal(1)(layer_xi_39_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input40: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_40 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_40_signal(1)) < 0 then
                layer_yo_40 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_40_signal(1)) > to_signed(96, layer_xi_40_signal(1)'length) then
                layer_yo_40 <= std_logic_vector(to_unsigned(96, layer_yo_40'length));
            else
                layer_yo_40 <= std_logic_vector(layer_xi_40_signal(1)(layer_xi_40_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input41: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_41 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_41_signal(1)) < 0 then
                layer_yo_41 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_41_signal(1)) > to_signed(96, layer_xi_41_signal(1)'length) then
                layer_yo_41 <= std_logic_vector(to_unsigned(96, layer_yo_41'length));
            else
                layer_yo_41 <= std_logic_vector(layer_xi_41_signal(1)(layer_xi_41_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input42: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_42 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_42_signal(1)) < 0 then
                layer_yo_42 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_42_signal(1)) > to_signed(96, layer_xi_42_signal(1)'length) then
                layer_yo_42 <= std_logic_vector(to_unsigned(96, layer_yo_42'length));
            else
                layer_yo_42 <= std_logic_vector(layer_xi_42_signal(1)(layer_xi_42_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input43: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_43 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_43_signal(1)) < 0 then
                layer_yo_43 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_43_signal(1)) > to_signed(96, layer_xi_43_signal(1)'length) then
                layer_yo_43 <= std_logic_vector(to_unsigned(96, layer_yo_43'length));
            else
                layer_yo_43 <= std_logic_vector(layer_xi_43_signal(1)(layer_xi_43_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input44: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_44 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_44_signal(1)) < 0 then
                layer_yo_44 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_44_signal(1)) > to_signed(96, layer_xi_44_signal(1)'length) then
                layer_yo_44 <= std_logic_vector(to_unsigned(96, layer_yo_44'length));
            else
                layer_yo_44 <= std_logic_vector(layer_xi_44_signal(1)(layer_xi_44_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input45: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_45 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_45_signal(1)) < 0 then
                layer_yo_45 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_45_signal(1)) > to_signed(96, layer_xi_45_signal(1)'length) then
                layer_yo_45 <= std_logic_vector(to_unsigned(96, layer_yo_45'length));
            else
                layer_yo_45 <= std_logic_vector(layer_xi_45_signal(1)(layer_xi_45_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input46: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_46 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_46_signal(1)) < 0 then
                layer_yo_46 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_46_signal(1)) > to_signed(96, layer_xi_46_signal(1)'length) then
                layer_yo_46 <= std_logic_vector(to_unsigned(96, layer_yo_46'length));
            else
                layer_yo_46 <= std_logic_vector(layer_xi_46_signal(1)(layer_xi_46_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input47: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_47 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_47_signal(1)) < 0 then
                layer_yo_47 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_47_signal(1)) > to_signed(96, layer_xi_47_signal(1)'length) then
                layer_yo_47 <= std_logic_vector(to_unsigned(96, layer_yo_47'length));
            else
                layer_yo_47 <= std_logic_vector(layer_xi_47_signal(1)(layer_xi_47_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input48: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_48 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_48_signal(1)) < 0 then
                layer_yo_48 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_48_signal(1)) > to_signed(96, layer_xi_48_signal(1)'length) then
                layer_yo_48 <= std_logic_vector(to_unsigned(96, layer_yo_48'length));
            else
                layer_yo_48 <= std_logic_vector(layer_xi_48_signal(1)(layer_xi_48_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input49: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_49 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_49_signal(1)) < 0 then
                layer_yo_49 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_49_signal(1)) > to_signed(96, layer_xi_49_signal(1)'length) then
                layer_yo_49 <= std_logic_vector(to_unsigned(96, layer_yo_49'length));
            else
                layer_yo_49 <= std_logic_vector(layer_xi_49_signal(1)(layer_xi_49_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input50: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_50 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_50_signal(1)) < 0 then
                layer_yo_50 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_50_signal(1)) > to_signed(96, layer_xi_50_signal(1)'length) then
                layer_yo_50 <= std_logic_vector(to_unsigned(96, layer_yo_50'length));
            else
                layer_yo_50 <= std_logic_vector(layer_xi_50_signal(1)(layer_xi_50_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input51: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_51 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_51_signal(1)) < 0 then
                layer_yo_51 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_51_signal(1)) > to_signed(96, layer_xi_51_signal(1)'length) then
                layer_yo_51 <= std_logic_vector(to_unsigned(96, layer_yo_51'length));
            else
                layer_yo_51 <= std_logic_vector(layer_xi_51_signal(1)(layer_xi_51_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input52: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_52 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_52_signal(1)) < 0 then
                layer_yo_52 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_52_signal(1)) > to_signed(96, layer_xi_52_signal(1)'length) then
                layer_yo_52 <= std_logic_vector(to_unsigned(96, layer_yo_52'length));
            else
                layer_yo_52 <= std_logic_vector(layer_xi_52_signal(1)(layer_xi_52_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input53: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_53 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_53_signal(1)) < 0 then
                layer_yo_53 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_53_signal(1)) > to_signed(96, layer_xi_53_signal(1)'length) then
                layer_yo_53 <= std_logic_vector(to_unsigned(96, layer_yo_53'length));
            else
                layer_yo_53 <= std_logic_vector(layer_xi_53_signal(1)(layer_xi_53_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input54: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_54 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_54_signal(1)) < 0 then
                layer_yo_54 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_54_signal(1)) > to_signed(96, layer_xi_54_signal(1)'length) then
                layer_yo_54 <= std_logic_vector(to_unsigned(96, layer_yo_54'length));
            else
                layer_yo_54 <= std_logic_vector(layer_xi_54_signal(1)(layer_xi_54_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input55: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_55 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_55_signal(1)) < 0 then
                layer_yo_55 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_55_signal(1)) > to_signed(96, layer_xi_55_signal(1)'length) then
                layer_yo_55 <= std_logic_vector(to_unsigned(96, layer_yo_55'length));
            else
                layer_yo_55 <= std_logic_vector(layer_xi_55_signal(1)(layer_xi_55_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input56: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_56 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_56_signal(1)) < 0 then
                layer_yo_56 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_56_signal(1)) > to_signed(96, layer_xi_56_signal(1)'length) then
                layer_yo_56 <= std_logic_vector(to_unsigned(96, layer_yo_56'length));
            else
                layer_yo_56 <= std_logic_vector(layer_xi_56_signal(1)(layer_xi_56_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input57: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_57 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_57_signal(1)) < 0 then
                layer_yo_57 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_57_signal(1)) > to_signed(96, layer_xi_57_signal(1)'length) then
                layer_yo_57 <= std_logic_vector(to_unsigned(96, layer_yo_57'length));
            else
                layer_yo_57 <= std_logic_vector(layer_xi_57_signal(1)(layer_xi_57_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input58: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_58 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_58_signal(1)) < 0 then
                layer_yo_58 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_58_signal(1)) > to_signed(96, layer_xi_58_signal(1)'length) then
                layer_yo_58 <= std_logic_vector(to_unsigned(96, layer_yo_58'length));
            else
                layer_yo_58 <= std_logic_vector(layer_xi_58_signal(1)(layer_xi_58_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input59: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_59 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_59_signal(1)) < 0 then
                layer_yo_59 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_59_signal(1)) > to_signed(96, layer_xi_59_signal(1)'length) then
                layer_yo_59 <= std_logic_vector(to_unsigned(96, layer_yo_59'length));
            else
                layer_yo_59 <= std_logic_vector(layer_xi_59_signal(1)(layer_xi_59_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input60: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_60 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_60_signal(1)) < 0 then
                layer_yo_60 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_60_signal(1)) > to_signed(96, layer_xi_60_signal(1)'length) then
                layer_yo_60 <= std_logic_vector(to_unsigned(96, layer_yo_60'length));
            else
                layer_yo_60 <= std_logic_vector(layer_xi_60_signal(1)(layer_xi_60_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input61: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_61 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_61_signal(1)) < 0 then
                layer_yo_61 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_61_signal(1)) > to_signed(96, layer_xi_61_signal(1)'length) then
                layer_yo_61 <= std_logic_vector(to_unsigned(96, layer_yo_61'length));
            else
                layer_yo_61 <= std_logic_vector(layer_xi_61_signal(1)(layer_xi_61_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input62: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_62 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_62_signal(1)) < 0 then
                layer_yo_62 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_62_signal(1)) > to_signed(96, layer_xi_62_signal(1)'length) then
                layer_yo_62 <= std_logic_vector(to_unsigned(96, layer_yo_62'length));
            else
                layer_yo_62 <= std_logic_vector(layer_xi_62_signal(1)(layer_xi_62_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input63: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_63 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_63_signal(1)) < 0 then
                layer_yo_63 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_63_signal(1)) > to_signed(96, layer_xi_63_signal(1)'length) then
                layer_yo_63 <= std_logic_vector(to_unsigned(96, layer_yo_63'length));
            else
                layer_yo_63 <= std_logic_vector(layer_xi_63_signal(1)(layer_xi_63_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;
    relu6_input64: process(reset, clk)
    begin
        if reset = '1' then
            layer_yo_64 <= (others => '0');
        elsif rising_edge(clk) then
            if signed(layer_xi_64_signal(1)) < 0 then
                layer_yo_64 <= (others => '0');  -- Set all bits to '0' if negative
            elsif signed(layer_xi_64_signal(1)) > to_signed(96, layer_xi_64_signal(1)'length) then
                layer_yo_64 <= std_logic_vector(to_unsigned(96, layer_yo_64'length));
            else
                layer_yo_64 <= std_logic_vector(layer_xi_64_signal(1)(layer_xi_64_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;



end Behavioral;