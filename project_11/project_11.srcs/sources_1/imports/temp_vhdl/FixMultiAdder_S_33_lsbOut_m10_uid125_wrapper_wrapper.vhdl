library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.ALL;
USE IEEE.std_logic_signed.ALL;
use ieee.std_logic_arith.CONV_STD_LOGIC_VECTOR;
use std.textio.all;

-- For layer conv7
-- Inputs are:
-- 	sfix(4, -10)
-- 	sfix(3, -10)
-- 	sfix(4, -10)
-- 	sfix(3, -10)
-- 	sfix(3, -10)
-- 	sfix(4, -10)
-- 	sfix(3, -10)
-- 	sfix(3, -10)
-- 	sfix(5, -10)
-- 	sfix(3, -10)
-- 	sfix(4, -10)
-- 	sfix(4, -10)
-- 	sfix(3, -10)
-- 	sfix(3, -10)
-- 	sfix(4, -10)
-- 	sfix(3, -10)
-- 	sfix(4, -10)
-- 	sfix(4, -10)
-- 	sfix(4, -10)
-- 	sfix(5, -10)
-- 	sfix(3, -10)
-- 	sfix(4, -10)
-- 	sfix(3, -10)
-- 	sfix(5, -10)
-- 	sfix(4, -10)
-- 	sfix(3, -10)
-- 	sfix(4, -10)
-- 	sfix(2, -10)
-- 	sfix(4, -10)
-- 	sfix(5, -10)
-- 	sfix(4, -10)
-- 	sfix(4, -10)
-- 	sfix(10, -10)
-- Output is: sfix(10, -10)

entity FixMultiAdder_S_33_lsbOut_m10_uid125_wrapper_wrapper is
    generic
    (
        ADDER_LOCATION                       : string  := "not specified";
        PIPELINE_STEPS                       : natural := 3;
        ADDITIONAL_PIPELINE_STEP_AT_INPUT    : boolean := FALSE;
        ADDITIONAL_PIPELINE_STEP_AT_OUTPUT   : boolean := FALSE
    );
    port 
    (
        clk    : in std_logic;
        rst    : in std_logic;
        enable : in std_logic;
        xi_1 : in std_logic_vector(14-1 downto 0); --	sfix(4, -10)
        xi_2 : in std_logic_vector(13-1 downto 0); --	sfix(3, -10)
        xi_3 : in std_logic_vector(14-1 downto 0); --	sfix(4, -10)
        xi_4 : in std_logic_vector(13-1 downto 0); --	sfix(3, -10)
        xi_5 : in std_logic_vector(13-1 downto 0); --	sfix(3, -10)
        xi_6 : in std_logic_vector(14-1 downto 0); --	sfix(4, -10)
        xi_7 : in std_logic_vector(13-1 downto 0); --	sfix(3, -10)
        xi_8 : in std_logic_vector(13-1 downto 0); --	sfix(3, -10)
        xi_9 : in std_logic_vector(15-1 downto 0); --	sfix(5, -10)
        xi_10 : in std_logic_vector(13-1 downto 0); --	sfix(3, -10)
        xi_11 : in std_logic_vector(14-1 downto 0); --	sfix(4, -10)
        xi_12 : in std_logic_vector(14-1 downto 0); --	sfix(4, -10)
        xi_13 : in std_logic_vector(13-1 downto 0); --	sfix(3, -10)
        xi_14 : in std_logic_vector(13-1 downto 0); --	sfix(3, -10)
        xi_15 : in std_logic_vector(14-1 downto 0); --	sfix(4, -10)
        xi_16 : in std_logic_vector(13-1 downto 0); --	sfix(3, -10)
        xi_17 : in std_logic_vector(14-1 downto 0); --	sfix(4, -10)
        xi_18 : in std_logic_vector(14-1 downto 0); --	sfix(4, -10)
        xi_19 : in std_logic_vector(14-1 downto 0); --	sfix(4, -10)
        xi_20 : in std_logic_vector(15-1 downto 0); --	sfix(5, -10)
        xi_21 : in std_logic_vector(13-1 downto 0); --	sfix(3, -10)
        xi_22 : in std_logic_vector(14-1 downto 0); --	sfix(4, -10)
        xi_23 : in std_logic_vector(13-1 downto 0); --	sfix(3, -10)
        xi_24 : in std_logic_vector(15-1 downto 0); --	sfix(5, -10)
        xi_25 : in std_logic_vector(14-1 downto 0); --	sfix(4, -10)
        xi_26 : in std_logic_vector(13-1 downto 0); --	sfix(3, -10)
        xi_27 : in std_logic_vector(14-1 downto 0); --	sfix(4, -10)
        xi_28 : in std_logic_vector(12-1 downto 0); --	sfix(2, -10)
        xi_29 : in std_logic_vector(14-1 downto 0); --	sfix(4, -10)
        xi_30 : in std_logic_vector(15-1 downto 0); --	sfix(5, -10)
        xi_31 : in std_logic_vector(14-1 downto 0); --	sfix(4, -10)
        xi_32 : in std_logic_vector(14-1 downto 0); --	sfix(4, -10)
        xi_33 : in std_logic_vector(20-1 downto 0); --	sfix(10, -10)
        yo : out std_logic_vector(20-1 downto 0) --	sfix(10, -10)
    );
end FixMultiAdder_S_33_lsbOut_m10_uid125_wrapper_wrapper;

architecture Behavioral of FixMultiAdder_S_33_lsbOut_m10_uid125_wrapper_wrapper is


    attribute KEEP_HIERARCHY : string;
    attribute KEEP_HIERARCHY of FixMultiAdder_S_33_lsbOut_m10_uid125_wrapper_wrapper : entity is "yes";

    signal yo_signal : std_logic_vector(20-1 downto 0); --	sfix(10, -10)
    signal xi_1_reshaped :  std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal xi_2_reshaped :  std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal xi_3_reshaped :  std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal xi_4_reshaped :  std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal xi_5_reshaped :  std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal xi_6_reshaped :  std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal xi_7_reshaped :  std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal xi_8_reshaped :  std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal xi_9_reshaped :  std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal xi_10_reshaped :  std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal xi_11_reshaped :  std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal xi_12_reshaped :  std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal xi_13_reshaped :  std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal xi_14_reshaped :  std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal xi_15_reshaped :  std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal xi_16_reshaped :  std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal xi_17_reshaped :  std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal xi_18_reshaped :  std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal xi_19_reshaped :  std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal xi_20_reshaped :  std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal xi_21_reshaped :  std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal xi_22_reshaped :  std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal xi_23_reshaped :  std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal xi_24_reshaped :  std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal xi_25_reshaped :  std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal xi_26_reshaped :  std_logic_vector(13-1 downto 0); --	sfix(3, -10)
    signal xi_27_reshaped :  std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal xi_28_reshaped :  std_logic_vector(12-1 downto 0); --	sfix(2, -10)
    signal xi_29_reshaped :  std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal xi_30_reshaped :  std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal xi_31_reshaped :  std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal xi_32_reshaped :  std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal xi_33_reshaped :  std_logic_vector(20-1 downto 0); --	sfix(10, -10)

    -- All that follows after here is just for debugging in the simulation
    -- to catch overflows and log measured min/max values of yo
    subtype DEBUG_TYPE is std_logic_vector(24 downto 0);
    constant allowed_min : integer := -524288;
    constant allowed_max : integer := 524287;

    signal yo_debug : DEBUG_TYPE; -- Holds the exact same result as yo but has additional msb bits to detect overflows!
    
    -- All input and output signals with added msb bits to detect overflows
    signal yo_resized_debug : DEBUG_TYPE;
    signal xi_1_resized_debug : DEBUG_TYPE;
    signal xi_2_resized_debug : DEBUG_TYPE;
    signal xi_3_resized_debug : DEBUG_TYPE;
    signal xi_4_resized_debug : DEBUG_TYPE;
    signal xi_5_resized_debug : DEBUG_TYPE;
    signal xi_6_resized_debug : DEBUG_TYPE;
    signal xi_7_resized_debug : DEBUG_TYPE;
    signal xi_8_resized_debug : DEBUG_TYPE;
    signal xi_9_resized_debug : DEBUG_TYPE;
    signal xi_10_resized_debug : DEBUG_TYPE;
    signal xi_11_resized_debug : DEBUG_TYPE;
    signal xi_12_resized_debug : DEBUG_TYPE;
    signal xi_13_resized_debug : DEBUG_TYPE;
    signal xi_14_resized_debug : DEBUG_TYPE;
    signal xi_15_resized_debug : DEBUG_TYPE;
    signal xi_16_resized_debug : DEBUG_TYPE;
    signal xi_17_resized_debug : DEBUG_TYPE;
    signal xi_18_resized_debug : DEBUG_TYPE;
    signal xi_19_resized_debug : DEBUG_TYPE;
    signal xi_20_resized_debug : DEBUG_TYPE;
    signal xi_21_resized_debug : DEBUG_TYPE;
    signal xi_22_resized_debug : DEBUG_TYPE;
    signal xi_23_resized_debug : DEBUG_TYPE;
    signal xi_24_resized_debug : DEBUG_TYPE;
    signal xi_25_resized_debug : DEBUG_TYPE;
    signal xi_26_resized_debug : DEBUG_TYPE;
    signal xi_27_resized_debug : DEBUG_TYPE;
    signal xi_28_resized_debug : DEBUG_TYPE;
    signal xi_29_resized_debug : DEBUG_TYPE;
    signal xi_30_resized_debug : DEBUG_TYPE;
    signal xi_31_resized_debug : DEBUG_TYPE;
    signal xi_32_resized_debug : DEBUG_TYPE;
    signal xi_33_resized_debug : DEBUG_TYPE;

    -- All constant min/max values of yo as signals (This is done so they can be grabbed by vcd)
    signal DEBUG_allowed_min : DEBUG_TYPE;
    signal DEBUG_allowed_max : DEBUG_TYPE;
    
    -- All measured min/max values of yo to show how well yo was sized
    signal DEBUG_measured_min : DEBUG_TYPE := std_logic_vector(to_signed(allowed_max, DEBUG_TYPE'length));
    signal DEBUG_measured_max : DEBUG_TYPE := std_logic_vector(to_signed(allowed_min, DEBUG_TYPE'length));
    signal DEBUG_overflow_flag : std_logic := '0'; -- Detect overflows!

begin

    -- Reshape all the inputs, so it matches with the flopoco inputs. (Usually done for IntMultiAdder)
    Reshape_input_1: entity work.FxPReshape
        generic map (
            XI_MSB => 4, XI_LSB => -10,
            YO_MSB => 4, YO_LSB => -10 )
        port map ( xi_1,  xi_1_reshaped );

    Reshape_input_2: entity work.FxPReshape
        generic map (
            XI_MSB => 3, XI_LSB => -10,
            YO_MSB => 3, YO_LSB => -10 )
        port map ( xi_2,  xi_2_reshaped );

    Reshape_input_3: entity work.FxPReshape
        generic map (
            XI_MSB => 4, XI_LSB => -10,
            YO_MSB => 4, YO_LSB => -10 )
        port map ( xi_3,  xi_3_reshaped );

    Reshape_input_4: entity work.FxPReshape
        generic map (
            XI_MSB => 3, XI_LSB => -10,
            YO_MSB => 3, YO_LSB => -10 )
        port map ( xi_4,  xi_4_reshaped );

    Reshape_input_5: entity work.FxPReshape
        generic map (
            XI_MSB => 3, XI_LSB => -10,
            YO_MSB => 3, YO_LSB => -10 )
        port map ( xi_5,  xi_5_reshaped );

    Reshape_input_6: entity work.FxPReshape
        generic map (
            XI_MSB => 4, XI_LSB => -10,
            YO_MSB => 4, YO_LSB => -10 )
        port map ( xi_6,  xi_6_reshaped );

    Reshape_input_7: entity work.FxPReshape
        generic map (
            XI_MSB => 3, XI_LSB => -10,
            YO_MSB => 3, YO_LSB => -10 )
        port map ( xi_7,  xi_7_reshaped );

    Reshape_input_8: entity work.FxPReshape
        generic map (
            XI_MSB => 3, XI_LSB => -10,
            YO_MSB => 3, YO_LSB => -10 )
        port map ( xi_8,  xi_8_reshaped );

    Reshape_input_9: entity work.FxPReshape
        generic map (
            XI_MSB => 5, XI_LSB => -10,
            YO_MSB => 5, YO_LSB => -10 )
        port map ( xi_9,  xi_9_reshaped );

    Reshape_input_10: entity work.FxPReshape
        generic map (
            XI_MSB => 3, XI_LSB => -10,
            YO_MSB => 3, YO_LSB => -10 )
        port map ( xi_10,  xi_10_reshaped );

    Reshape_input_11: entity work.FxPReshape
        generic map (
            XI_MSB => 4, XI_LSB => -10,
            YO_MSB => 4, YO_LSB => -10 )
        port map ( xi_11,  xi_11_reshaped );

    Reshape_input_12: entity work.FxPReshape
        generic map (
            XI_MSB => 4, XI_LSB => -10,
            YO_MSB => 4, YO_LSB => -10 )
        port map ( xi_12,  xi_12_reshaped );

    Reshape_input_13: entity work.FxPReshape
        generic map (
            XI_MSB => 3, XI_LSB => -10,
            YO_MSB => 3, YO_LSB => -10 )
        port map ( xi_13,  xi_13_reshaped );

    Reshape_input_14: entity work.FxPReshape
        generic map (
            XI_MSB => 3, XI_LSB => -10,
            YO_MSB => 3, YO_LSB => -10 )
        port map ( xi_14,  xi_14_reshaped );

    Reshape_input_15: entity work.FxPReshape
        generic map (
            XI_MSB => 4, XI_LSB => -10,
            YO_MSB => 4, YO_LSB => -10 )
        port map ( xi_15,  xi_15_reshaped );

    Reshape_input_16: entity work.FxPReshape
        generic map (
            XI_MSB => 3, XI_LSB => -10,
            YO_MSB => 3, YO_LSB => -10 )
        port map ( xi_16,  xi_16_reshaped );

    Reshape_input_17: entity work.FxPReshape
        generic map (
            XI_MSB => 4, XI_LSB => -10,
            YO_MSB => 4, YO_LSB => -10 )
        port map ( xi_17,  xi_17_reshaped );

    Reshape_input_18: entity work.FxPReshape
        generic map (
            XI_MSB => 4, XI_LSB => -10,
            YO_MSB => 4, YO_LSB => -10 )
        port map ( xi_18,  xi_18_reshaped );

    Reshape_input_19: entity work.FxPReshape
        generic map (
            XI_MSB => 4, XI_LSB => -10,
            YO_MSB => 4, YO_LSB => -10 )
        port map ( xi_19,  xi_19_reshaped );

    Reshape_input_20: entity work.FxPReshape
        generic map (
            XI_MSB => 5, XI_LSB => -10,
            YO_MSB => 5, YO_LSB => -10 )
        port map ( xi_20,  xi_20_reshaped );

    Reshape_input_21: entity work.FxPReshape
        generic map (
            XI_MSB => 3, XI_LSB => -10,
            YO_MSB => 3, YO_LSB => -10 )
        port map ( xi_21,  xi_21_reshaped );

    Reshape_input_22: entity work.FxPReshape
        generic map (
            XI_MSB => 4, XI_LSB => -10,
            YO_MSB => 4, YO_LSB => -10 )
        port map ( xi_22,  xi_22_reshaped );

    Reshape_input_23: entity work.FxPReshape
        generic map (
            XI_MSB => 3, XI_LSB => -10,
            YO_MSB => 3, YO_LSB => -10 )
        port map ( xi_23,  xi_23_reshaped );

    Reshape_input_24: entity work.FxPReshape
        generic map (
            XI_MSB => 5, XI_LSB => -10,
            YO_MSB => 5, YO_LSB => -10 )
        port map ( xi_24,  xi_24_reshaped );

    Reshape_input_25: entity work.FxPReshape
        generic map (
            XI_MSB => 4, XI_LSB => -10,
            YO_MSB => 4, YO_LSB => -10 )
        port map ( xi_25,  xi_25_reshaped );

    Reshape_input_26: entity work.FxPReshape
        generic map (
            XI_MSB => 3, XI_LSB => -10,
            YO_MSB => 3, YO_LSB => -10 )
        port map ( xi_26,  xi_26_reshaped );

    Reshape_input_27: entity work.FxPReshape
        generic map (
            XI_MSB => 4, XI_LSB => -10,
            YO_MSB => 4, YO_LSB => -10 )
        port map ( xi_27,  xi_27_reshaped );

    Reshape_input_28: entity work.FxPReshape
        generic map (
            XI_MSB => 2, XI_LSB => -10,
            YO_MSB => 2, YO_LSB => -10 )
        port map ( xi_28,  xi_28_reshaped );

    Reshape_input_29: entity work.FxPReshape
        generic map (
            XI_MSB => 4, XI_LSB => -10,
            YO_MSB => 4, YO_LSB => -10 )
        port map ( xi_29,  xi_29_reshaped );

    Reshape_input_30: entity work.FxPReshape
        generic map (
            XI_MSB => 5, XI_LSB => -10,
            YO_MSB => 5, YO_LSB => -10 )
        port map ( xi_30,  xi_30_reshaped );

    Reshape_input_31: entity work.FxPReshape
        generic map (
            XI_MSB => 4, XI_LSB => -10,
            YO_MSB => 4, YO_LSB => -10 )
        port map ( xi_31,  xi_31_reshaped );

    Reshape_input_32: entity work.FxPReshape
        generic map (
            XI_MSB => 4, XI_LSB => -10,
            YO_MSB => 4, YO_LSB => -10 )
        port map ( xi_32,  xi_32_reshaped );

    Reshape_input_33: entity work.FxPReshape
        generic map (
            XI_MSB => 10, XI_LSB => -10,
            YO_MSB => 10, YO_LSB => -10 )
        port map ( xi_33,  xi_33_reshaped );


    -- This is the flopoco entity wrapper of the adder
    adder : entity work.FixMultiAdder_S_33_lsbOut_m10_uid125_wrapper
        generic map
        (
            PIPELINE_STEPS                      => PIPELINE_STEPS,
            ADDITIONAL_PIPELINE_STEP_AT_INPUT   => ADDITIONAL_PIPELINE_STEP_AT_INPUT,
            ADDITIONAL_PIPELINE_STEP_AT_OUTPUT  => ADDITIONAL_PIPELINE_STEP_AT_OUTPUT
        )
        port map
        (
            clk, rst, enable,
            xi_1_reshaped, --	sfix(4, -10)
            xi_2_reshaped, --	sfix(3, -10)
            xi_3_reshaped, --	sfix(4, -10)
            xi_4_reshaped, --	sfix(3, -10)
            xi_5_reshaped, --	sfix(3, -10)
            xi_6_reshaped, --	sfix(4, -10)
            xi_7_reshaped, --	sfix(3, -10)
            xi_8_reshaped, --	sfix(3, -10)
            xi_9_reshaped, --	sfix(5, -10)
            xi_10_reshaped, --	sfix(3, -10)
            xi_11_reshaped, --	sfix(4, -10)
            xi_12_reshaped, --	sfix(4, -10)
            xi_13_reshaped, --	sfix(3, -10)
            xi_14_reshaped, --	sfix(3, -10)
            xi_15_reshaped, --	sfix(4, -10)
            xi_16_reshaped, --	sfix(3, -10)
            xi_17_reshaped, --	sfix(4, -10)
            xi_18_reshaped, --	sfix(4, -10)
            xi_19_reshaped, --	sfix(4, -10)
            xi_20_reshaped, --	sfix(5, -10)
            xi_21_reshaped, --	sfix(3, -10)
            xi_22_reshaped, --	sfix(4, -10)
            xi_23_reshaped, --	sfix(3, -10)
            xi_24_reshaped, --	sfix(5, -10)
            xi_25_reshaped, --	sfix(4, -10)
            xi_26_reshaped, --	sfix(3, -10)
            xi_27_reshaped, --	sfix(4, -10)
            xi_28_reshaped, --	sfix(2, -10)
            xi_29_reshaped, --	sfix(4, -10)
            xi_30_reshaped, --	sfix(5, -10)
            xi_31_reshaped, --	sfix(4, -10)
            xi_32_reshaped, --	sfix(4, -10)
            xi_33_reshaped, --	sfix(10, -10)
            yo_signal
        );

    yo <= yo_signal;

    -- # # # EVERYTHING DOWN BELOW IST JUST DEBUGGING STUFF TO DETECT OVERFLOWS! # # #

    yo_debug <= xi_1_resized_debug  + xi_2_resized_debug  + xi_3_resized_debug  + xi_4_resized_debug  + xi_5_resized_debug  + xi_6_resized_debug  + xi_7_resized_debug  + xi_8_resized_debug  + xi_9_resized_debug  + xi_10_resized_debug  + xi_11_resized_debug  + xi_12_resized_debug  + xi_13_resized_debug  + xi_14_resized_debug  + xi_15_resized_debug  + xi_16_resized_debug  + xi_17_resized_debug  + xi_18_resized_debug  + xi_19_resized_debug  + xi_20_resized_debug  + xi_21_resized_debug  + xi_22_resized_debug  + xi_23_resized_debug  + xi_24_resized_debug  + xi_25_resized_debug  + xi_26_resized_debug  + xi_27_resized_debug  + xi_28_resized_debug  + xi_29_resized_debug  + xi_30_resized_debug  + xi_31_resized_debug  + xi_32_resized_debug  + xi_33_resized_debug ;
    yo_resized_debug <= std_logic_vector(resize(signed(yo_signal), DEBUG_TYPE'length));
    xi_1_resized_debug <= std_logic_vector(resize(signed(xi_1), DEBUG_TYPE'length));
    xi_2_resized_debug <= std_logic_vector(resize(signed(xi_2), DEBUG_TYPE'length));
    xi_3_resized_debug <= std_logic_vector(resize(signed(xi_3), DEBUG_TYPE'length));
    xi_4_resized_debug <= std_logic_vector(resize(signed(xi_4), DEBUG_TYPE'length));
    xi_5_resized_debug <= std_logic_vector(resize(signed(xi_5), DEBUG_TYPE'length));
    xi_6_resized_debug <= std_logic_vector(resize(signed(xi_6), DEBUG_TYPE'length));
    xi_7_resized_debug <= std_logic_vector(resize(signed(xi_7), DEBUG_TYPE'length));
    xi_8_resized_debug <= std_logic_vector(resize(signed(xi_8), DEBUG_TYPE'length));
    xi_9_resized_debug <= std_logic_vector(resize(signed(xi_9), DEBUG_TYPE'length));
    xi_10_resized_debug <= std_logic_vector(resize(signed(xi_10), DEBUG_TYPE'length));
    xi_11_resized_debug <= std_logic_vector(resize(signed(xi_11), DEBUG_TYPE'length));
    xi_12_resized_debug <= std_logic_vector(resize(signed(xi_12), DEBUG_TYPE'length));
    xi_13_resized_debug <= std_logic_vector(resize(signed(xi_13), DEBUG_TYPE'length));
    xi_14_resized_debug <= std_logic_vector(resize(signed(xi_14), DEBUG_TYPE'length));
    xi_15_resized_debug <= std_logic_vector(resize(signed(xi_15), DEBUG_TYPE'length));
    xi_16_resized_debug <= std_logic_vector(resize(signed(xi_16), DEBUG_TYPE'length));
    xi_17_resized_debug <= std_logic_vector(resize(signed(xi_17), DEBUG_TYPE'length));
    xi_18_resized_debug <= std_logic_vector(resize(signed(xi_18), DEBUG_TYPE'length));
    xi_19_resized_debug <= std_logic_vector(resize(signed(xi_19), DEBUG_TYPE'length));
    xi_20_resized_debug <= std_logic_vector(resize(signed(xi_20), DEBUG_TYPE'length));
    xi_21_resized_debug <= std_logic_vector(resize(signed(xi_21), DEBUG_TYPE'length));
    xi_22_resized_debug <= std_logic_vector(resize(signed(xi_22), DEBUG_TYPE'length));
    xi_23_resized_debug <= std_logic_vector(resize(signed(xi_23), DEBUG_TYPE'length));
    xi_24_resized_debug <= std_logic_vector(resize(signed(xi_24), DEBUG_TYPE'length));
    xi_25_resized_debug <= std_logic_vector(resize(signed(xi_25), DEBUG_TYPE'length));
    xi_26_resized_debug <= std_logic_vector(resize(signed(xi_26), DEBUG_TYPE'length));
    xi_27_resized_debug <= std_logic_vector(resize(signed(xi_27), DEBUG_TYPE'length));
    xi_28_resized_debug <= std_logic_vector(resize(signed(xi_28), DEBUG_TYPE'length));
    xi_29_resized_debug <= std_logic_vector(resize(signed(xi_29), DEBUG_TYPE'length));
    xi_30_resized_debug <= std_logic_vector(resize(signed(xi_30), DEBUG_TYPE'length));
    xi_31_resized_debug <= std_logic_vector(resize(signed(xi_31), DEBUG_TYPE'length));
    xi_32_resized_debug <= std_logic_vector(resize(signed(xi_32), DEBUG_TYPE'length));
    xi_33_resized_debug <= std_logic_vector(resize(signed(xi_33), DEBUG_TYPE'length));

    DEBUG_allowed_min <= std_logic_vector(to_signed(allowed_min, DEBUG_TYPE'length));
    DEBUG_allowed_max <= std_logic_vector(to_signed(allowed_max, DEBUG_TYPE'length));

    DEBUG_detect_limits_and_overflow: process(yo_debug, enable, DEBUG_allowed_max, DEBUG_allowed_min, DEBUG_overflow_flag, DEBUG_measured_max, DEBUG_measured_min)
    begin
        if enable = '1' then
            if signed(yo_debug) > signed(DEBUG_allowed_max) then
                DEBUG_overflow_flag <= '1';
                report
                    "overflow detected in " & ADDER_LOCATION & "! Value would be " &
                    integer'image(to_integer(signed(yo_debug))) &
                    " this would be " &
                    integer'image(to_integer(signed(yo_debug)-signed(DEBUG_allowed_max))) &
                    " over the maximum of " &
                    integer'image(to_integer(signed(DEBUG_allowed_max))) & ". BUT REMEMBER! THIS COULD ALSO BE CAUSED BY INVALID DATA! So maybe it is so not serious!"
                    severity ERROR;
            elsif signed(yo_debug) < signed(DEBUG_allowed_min) then
                DEBUG_overflow_flag <= '1';
                report
                    "overflow detected in " & ADDER_LOCATION & "! Value would be " &
                    integer'image(to_integer(signed(yo_debug))) &
                    " this would be " &
                    integer'image(to_integer(signed(yo_debug)-signed(DEBUG_allowed_min))) &
                    " under the minimum of " &
                    integer'image(to_integer(signed(DEBUG_allowed_min))) & ". BUT REMEMBER! THIS COULD ALSO BE CAUSED BY INVALID DATA! So maybe it is so not serious!"
                    severity ERROR;
            else
                DEBUG_overflow_flag <= DEBUG_overflow_flag;
            end if;

            if signed(yo_debug) < signed(DEBUG_measured_min) then
                DEBUG_measured_min <= yo_debug;
            else
                DEBUG_measured_min <= DEBUG_measured_min;
            end if;

            if signed(yo_debug) > signed(DEBUG_measured_max) then
                DEBUG_measured_max <= yo_debug;
            else
                DEBUG_measured_max <= DEBUG_measured_max;
            end if;
        end if;
    end process;
end Behavioral;