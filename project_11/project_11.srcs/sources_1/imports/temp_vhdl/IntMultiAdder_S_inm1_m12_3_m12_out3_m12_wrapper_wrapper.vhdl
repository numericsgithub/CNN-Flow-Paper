library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.ALL;
USE IEEE.std_logic_signed.ALL;
use ieee.std_logic_arith.CONV_STD_LOGIC_VECTOR;
use std.textio.all;

-- For layer conv1
-- Inputs are:
-- 	sfix(-1, -12)
-- 	sfix(3, -12)
-- Output is: sfix(3, -12)

entity IntMultiAdder_S_inm1_m12_3_m12_out3_m12_wrapper_wrapper is
    generic
    (
        ADDER_LOCATION                       : string  := "not specified";
        PIPELINE_STEPS                       : natural := 0;
        ADDITIONAL_PIPELINE_STEP_AT_INPUT    : boolean := FALSE;
        ADDITIONAL_PIPELINE_STEP_AT_OUTPUT   : boolean := FALSE
    );
    port 
    (
        clk    : in std_logic;
        rst    : in std_logic;
        enable : in std_logic;
        xi_1 : in std_logic_vector(11-1 downto 0); --	sfix(-1, -12)
        xi_2 : in std_logic_vector(15-1 downto 0); --	sfix(3, -12)
        yo : out std_logic_vector(15-1 downto 0) --	sfix(3, -12)
    );
end IntMultiAdder_S_inm1_m12_3_m12_out3_m12_wrapper_wrapper;

architecture Behavioral of IntMultiAdder_S_inm1_m12_3_m12_out3_m12_wrapper_wrapper is


    attribute KEEP_HIERARCHY : string;
    attribute KEEP_HIERARCHY of IntMultiAdder_S_inm1_m12_3_m12_out3_m12_wrapper_wrapper : entity is "yes";

    signal yo_signal : std_logic_vector(15-1 downto 0); --	sfix(3, -12)
    signal xi_1_reshaped :  std_logic_vector(15-1 downto 0); --	sfix(3, -12)
    signal xi_2_reshaped :  std_logic_vector(15-1 downto 0); --	sfix(3, -12)

    -- All that follows after here is just for debugging in the simulation
    -- to catch overflows and log measured min/max values of yo
    subtype DEBUG_TYPE is std_logic_vector(17 downto 0);
    constant allowed_min : integer := -16384;
    constant allowed_max : integer := 16383;

    signal yo_debug : DEBUG_TYPE; -- Holds the exact same result as yo but has additional msb bits to detect overflows!
    
    -- All input and output signals with added msb bits to detect overflows
    signal yo_resized_debug : DEBUG_TYPE;
    signal xi_1_resized_debug : DEBUG_TYPE;
    signal xi_2_resized_debug : DEBUG_TYPE;

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
            XI_MSB => -1, XI_LSB => -12,
            YO_MSB => 3, YO_LSB => -12 )
        port map ( xi_1,  xi_1_reshaped );

    Reshape_input_2: entity work.FxPReshape
        generic map (
            XI_MSB => 3, XI_LSB => -12,
            YO_MSB => 3, YO_LSB => -12 )
        port map ( xi_2,  xi_2_reshaped );


    -- This is the flopoco entity wrapper of the adder
    adder : entity work.IntMultiAdder_S_inm1_m12_3_m12_out3_m12_wrapper
        generic map
        (
            PIPELINE_STEPS                      => PIPELINE_STEPS,
            ADDITIONAL_PIPELINE_STEP_AT_INPUT   => ADDITIONAL_PIPELINE_STEP_AT_INPUT,
            ADDITIONAL_PIPELINE_STEP_AT_OUTPUT  => ADDITIONAL_PIPELINE_STEP_AT_OUTPUT
        )
        port map
        (
            clk, rst, enable,
            xi_1_reshaped, --	sfix(3, -12)
            xi_2_reshaped, --	sfix(3, -12)
            yo_signal
        );

    yo <= yo_signal;

    -- # # # EVERYTHING DOWN BELOW IST JUST DEBUGGING STUFF TO DETECT OVERFLOWS! # # #

    yo_debug <= xi_1_resized_debug  + xi_2_resized_debug ;
    yo_resized_debug <= std_logic_vector(resize(signed(yo_signal), DEBUG_TYPE'length));
    xi_1_resized_debug <= std_logic_vector(resize(signed(xi_1), DEBUG_TYPE'length));
    xi_2_resized_debug <= std_logic_vector(resize(signed(xi_2), DEBUG_TYPE'length));

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