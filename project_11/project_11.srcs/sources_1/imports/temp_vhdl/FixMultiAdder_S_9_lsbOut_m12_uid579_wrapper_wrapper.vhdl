library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.ALL;
USE IEEE.std_logic_signed.ALL;
use ieee.std_logic_arith.CONV_STD_LOGIC_VECTOR;
use std.textio.all;

-- For layer conv17
-- Inputs are:
-- 	sfix(2, -12)
-- 	sfix(2, -12)
-- 	sfix(2, -12)
-- 	sfix(3, -12)
-- 	sfix(2, -12)
-- 	sfix(3, -12)
-- 	sfix(2, -12)
-- 	sfix(3, -12)
-- 	sfix(9, -12)
-- Output is: sfix(9, -12)

entity FixMultiAdder_S_9_lsbOut_m12_uid579_wrapper_wrapper is
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
        xi_1 : in std_logic_vector(14-1 downto 0); --	sfix(2, -12)
        xi_2 : in std_logic_vector(14-1 downto 0); --	sfix(2, -12)
        xi_3 : in std_logic_vector(14-1 downto 0); --	sfix(2, -12)
        xi_4 : in std_logic_vector(15-1 downto 0); --	sfix(3, -12)
        xi_5 : in std_logic_vector(14-1 downto 0); --	sfix(2, -12)
        xi_6 : in std_logic_vector(15-1 downto 0); --	sfix(3, -12)
        xi_7 : in std_logic_vector(14-1 downto 0); --	sfix(2, -12)
        xi_8 : in std_logic_vector(15-1 downto 0); --	sfix(3, -12)
        xi_9 : in std_logic_vector(21-1 downto 0); --	sfix(9, -12)
        yo : out std_logic_vector(21-1 downto 0) --	sfix(9, -12)
    );
end FixMultiAdder_S_9_lsbOut_m12_uid579_wrapper_wrapper;

architecture Behavioral of FixMultiAdder_S_9_lsbOut_m12_uid579_wrapper_wrapper is


    attribute KEEP_HIERARCHY : string;
    attribute KEEP_HIERARCHY of FixMultiAdder_S_9_lsbOut_m12_uid579_wrapper_wrapper : entity is "yes";

    signal yo_signal : std_logic_vector(21-1 downto 0); --	sfix(9, -12)
    signal xi_1_reshaped :  std_logic_vector(14-1 downto 0); --	sfix(2, -12)
    signal xi_2_reshaped :  std_logic_vector(14-1 downto 0); --	sfix(2, -12)
    signal xi_3_reshaped :  std_logic_vector(14-1 downto 0); --	sfix(2, -12)
    signal xi_4_reshaped :  std_logic_vector(15-1 downto 0); --	sfix(3, -12)
    signal xi_5_reshaped :  std_logic_vector(14-1 downto 0); --	sfix(2, -12)
    signal xi_6_reshaped :  std_logic_vector(15-1 downto 0); --	sfix(3, -12)
    signal xi_7_reshaped :  std_logic_vector(14-1 downto 0); --	sfix(2, -12)
    signal xi_8_reshaped :  std_logic_vector(15-1 downto 0); --	sfix(3, -12)
    signal xi_9_reshaped :  std_logic_vector(21-1 downto 0); --	sfix(9, -12)

    -- All that follows after here is just for debugging in the simulation
    -- to catch overflows and log measured min/max values of yo
    subtype DEBUG_TYPE is std_logic_vector(25 downto 0);
    constant allowed_min : integer := -1048576;
    constant allowed_max : integer := 1048575;

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
            XI_MSB => 2, XI_LSB => -12,
            YO_MSB => 2, YO_LSB => -12 )
        port map ( xi_1,  xi_1_reshaped );

    Reshape_input_2: entity work.FxPReshape
        generic map (
            XI_MSB => 2, XI_LSB => -12,
            YO_MSB => 2, YO_LSB => -12 )
        port map ( xi_2,  xi_2_reshaped );

    Reshape_input_3: entity work.FxPReshape
        generic map (
            XI_MSB => 2, XI_LSB => -12,
            YO_MSB => 2, YO_LSB => -12 )
        port map ( xi_3,  xi_3_reshaped );

    Reshape_input_4: entity work.FxPReshape
        generic map (
            XI_MSB => 3, XI_LSB => -12,
            YO_MSB => 3, YO_LSB => -12 )
        port map ( xi_4,  xi_4_reshaped );

    Reshape_input_5: entity work.FxPReshape
        generic map (
            XI_MSB => 2, XI_LSB => -12,
            YO_MSB => 2, YO_LSB => -12 )
        port map ( xi_5,  xi_5_reshaped );

    Reshape_input_6: entity work.FxPReshape
        generic map (
            XI_MSB => 3, XI_LSB => -12,
            YO_MSB => 3, YO_LSB => -12 )
        port map ( xi_6,  xi_6_reshaped );

    Reshape_input_7: entity work.FxPReshape
        generic map (
            XI_MSB => 2, XI_LSB => -12,
            YO_MSB => 2, YO_LSB => -12 )
        port map ( xi_7,  xi_7_reshaped );

    Reshape_input_8: entity work.FxPReshape
        generic map (
            XI_MSB => 3, XI_LSB => -12,
            YO_MSB => 3, YO_LSB => -12 )
        port map ( xi_8,  xi_8_reshaped );

    Reshape_input_9: entity work.FxPReshape
        generic map (
            XI_MSB => 9, XI_LSB => -12,
            YO_MSB => 9, YO_LSB => -12 )
        port map ( xi_9,  xi_9_reshaped );


    -- This is the flopoco entity wrapper of the adder
    adder : entity work.FixMultiAdder_S_9_lsbOut_m12_uid579_wrapper
        generic map
        (
            PIPELINE_STEPS                      => PIPELINE_STEPS,
            ADDITIONAL_PIPELINE_STEP_AT_INPUT   => ADDITIONAL_PIPELINE_STEP_AT_INPUT,
            ADDITIONAL_PIPELINE_STEP_AT_OUTPUT  => ADDITIONAL_PIPELINE_STEP_AT_OUTPUT
        )
        port map
        (
            clk, rst, enable,
            xi_1_reshaped, --	sfix(2, -12)
            xi_2_reshaped, --	sfix(2, -12)
            xi_3_reshaped, --	sfix(2, -12)
            xi_4_reshaped, --	sfix(3, -12)
            xi_5_reshaped, --	sfix(2, -12)
            xi_6_reshaped, --	sfix(3, -12)
            xi_7_reshaped, --	sfix(2, -12)
            xi_8_reshaped, --	sfix(3, -12)
            xi_9_reshaped, --	sfix(9, -12)
            yo_signal
        );

    yo <= yo_signal;

    -- # # # EVERYTHING DOWN BELOW IST JUST DEBUGGING STUFF TO DETECT OVERFLOWS! # # #

    yo_debug <= xi_1_resized_debug  + xi_2_resized_debug  + xi_3_resized_debug  + xi_4_resized_debug  + xi_5_resized_debug  + xi_6_resized_debug  + xi_7_resized_debug  + xi_8_resized_debug  + xi_9_resized_debug ;
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