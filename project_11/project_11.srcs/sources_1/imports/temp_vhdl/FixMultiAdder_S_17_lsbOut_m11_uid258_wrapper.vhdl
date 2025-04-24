library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
USE ieee.std_logic_signed.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

-- Flopoco wrapper for: ./flopoco writeEnable=1 ilpTimeout=300 compression=optimal_minStages tiling=optimalTilingAndCompression allRegistersWithAsyncReset=1 target=VirtexUltrascalePlus useTargetOpt=1 frequency=950 name=entity_place_holder_name FixMultiAdder signedIn=1 n=17 msbIn=2:2:0:2:1:1:1:1:2:1:1:1:1:1:2:2:8 lsbIn=-11:-11:-11:-11:-11:-11:-11:-11:-11:-11:-11:-11:-11:-11:-11:-11:-11 lsbOut=-11

entity FixMultiAdder_S_17_lsbOut_m11_uid258_wrapper is
    generic
    (
        PIPELINE_STEPS             : natural := 3;
        ADDITIONAL_PIPELINE_STEP_AT_INPUT    : boolean := FALSE;
        ADDITIONAL_PIPELINE_STEP_AT_OUTPUT   : boolean := FALSE
    );
    Port (
        clk    : in std_logic;
        rst    : in std_logic;
        enable : in std_logic;
    
        xi_1 : in std_logic_vector(14-1 downto 0); --	sfix(3, -11)
        xi_2 : in std_logic_vector(14-1 downto 0); --	sfix(3, -11)
        xi_3 : in std_logic_vector(12-1 downto 0); --	sfix(1, -11)
        xi_4 : in std_logic_vector(14-1 downto 0); --	sfix(3, -11)
        xi_5 : in std_logic_vector(13-1 downto 0); --	sfix(2, -11)
        xi_6 : in std_logic_vector(13-1 downto 0); --	sfix(2, -11)
        xi_7 : in std_logic_vector(13-1 downto 0); --	sfix(2, -11)
        xi_8 : in std_logic_vector(13-1 downto 0); --	sfix(2, -11)
        xi_9 : in std_logic_vector(14-1 downto 0); --	sfix(3, -11)
        xi_10 : in std_logic_vector(13-1 downto 0); --	sfix(2, -11)
        xi_11 : in std_logic_vector(13-1 downto 0); --	sfix(2, -11)
        xi_12 : in std_logic_vector(13-1 downto 0); --	sfix(2, -11)
        xi_13 : in std_logic_vector(13-1 downto 0); --	sfix(2, -11)
        xi_14 : in std_logic_vector(13-1 downto 0); --	sfix(2, -11)
        xi_15 : in std_logic_vector(14-1 downto 0); --	sfix(3, -11)
        xi_16 : in std_logic_vector(14-1 downto 0); --	sfix(3, -11)
        xi_17 : in std_logic_vector(20-1 downto 0); --	sfix(9, -11)
        yo  : out std_logic_vector(20-1 downto 0) --	sfix(9, -11)
    );
end FixMultiAdder_S_17_lsbOut_m11_uid258_wrapper;

architecture Behavioral of FixMultiAdder_S_17_lsbOut_m11_uid258_wrapper is



    constant MIN_PIPELINE_STEPS : natural := 3;
    constant TOTAL_PIPELINE_STEPS : natural := PIPELINE_STEPS - MIN_PIPELINE_STEPS;

    function BoolToNatural(B : boolean) return natural is
    begin
      if B then
        return 1;
      else
        return 0;
      end if;
    end function;

    constant PIPELINE_STEPS_AT_INPUT : natural := BoolToNatural(ADDITIONAL_PIPELINE_STEP_AT_INPUT);
    constant PIPELINE_STEPS_AT_OUTPUT : natural := BoolToNatural(ADDITIONAL_PIPELINE_STEP_AT_OUTPUT);

    type PIPELINE_TYPE_FOR_XI_1_PL              is array(0 to 1) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_XI_2_PL              is array(0 to 1) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_XI_3_PL              is array(0 to 1) of std_logic_vector(12-1 downto 0);
    type PIPELINE_TYPE_FOR_XI_4_PL              is array(0 to 1) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_XI_5_PL              is array(0 to 1) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_XI_6_PL              is array(0 to 1) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_XI_7_PL              is array(0 to 1) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_XI_8_PL              is array(0 to 1) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_XI_9_PL              is array(0 to 1) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_XI_10_PL             is array(0 to 1) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_XI_11_PL             is array(0 to 1) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_XI_12_PL             is array(0 to 1) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_XI_13_PL             is array(0 to 1) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_XI_14_PL             is array(0 to 1) of std_logic_vector(13-1 downto 0);
    type PIPELINE_TYPE_FOR_XI_15_PL             is array(0 to 1) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_XI_16_PL             is array(0 to 1) of std_logic_vector(14-1 downto 0);
    type PIPELINE_TYPE_FOR_XI_17_PL             is array(0 to 1) of std_logic_vector(20-1 downto 0);
    type PIPELINE_TYPE_FOR_YO_PL                is array(0 to 1) of std_logic_vector(20-1 downto 0);

    
        -- sfix(3, -11)
    signal xi_1_pl              : PIPELINE_TYPE_FOR_XI_1_PL;
        -- sfix(3, -11)
    signal xi_2_pl              : PIPELINE_TYPE_FOR_XI_2_PL;
        -- sfix(1, -11)
    signal xi_3_pl              : PIPELINE_TYPE_FOR_XI_3_PL;
        -- sfix(3, -11)
    signal xi_4_pl              : PIPELINE_TYPE_FOR_XI_4_PL;
        -- sfix(2, -11)
    signal xi_5_pl              : PIPELINE_TYPE_FOR_XI_5_PL;
        -- sfix(2, -11)
    signal xi_6_pl              : PIPELINE_TYPE_FOR_XI_6_PL;
        -- sfix(2, -11)
    signal xi_7_pl              : PIPELINE_TYPE_FOR_XI_7_PL;
        -- sfix(2, -11)
    signal xi_8_pl              : PIPELINE_TYPE_FOR_XI_8_PL;
        -- sfix(3, -11)
    signal xi_9_pl              : PIPELINE_TYPE_FOR_XI_9_PL;
        -- sfix(2, -11)
    signal xi_10_pl             : PIPELINE_TYPE_FOR_XI_10_PL;
        -- sfix(2, -11)
    signal xi_11_pl             : PIPELINE_TYPE_FOR_XI_11_PL;
        -- sfix(2, -11)
    signal xi_12_pl             : PIPELINE_TYPE_FOR_XI_12_PL;
        -- sfix(2, -11)
    signal xi_13_pl             : PIPELINE_TYPE_FOR_XI_13_PL;
        -- sfix(2, -11)
    signal xi_14_pl             : PIPELINE_TYPE_FOR_XI_14_PL;
        -- sfix(3, -11)
    signal xi_15_pl             : PIPELINE_TYPE_FOR_XI_15_PL;
        -- sfix(3, -11)
    signal xi_16_pl             : PIPELINE_TYPE_FOR_XI_16_PL;
        -- sfix(9, -11)
    signal xi_17_pl             : PIPELINE_TYPE_FOR_XI_17_PL;

    -- sfix(9, -11)
    signal yo_pl                : PIPELINE_TYPE_FOR_YO_PL;

    signal yo_flopoco : std_logic_vector(20-1 downto 0);

begin


    xi_1_pl(0) <= xi_1;

    xi_2_pl(0) <= xi_2;

    xi_3_pl(0) <= xi_3;

    xi_4_pl(0) <= xi_4;

    xi_5_pl(0) <= xi_5;

    xi_6_pl(0) <= xi_6;

    xi_7_pl(0) <= xi_7;

    xi_8_pl(0) <= xi_8;

    xi_9_pl(0) <= xi_9;

    xi_10_pl(0) <= xi_10;

    xi_11_pl(0) <= xi_11;

    xi_12_pl(0) <= xi_12;

    xi_13_pl(0) <= xi_13;

    xi_14_pl(0) <= xi_14;

    xi_15_pl(0) <= xi_15;

    xi_16_pl(0) <= xi_16;

    xi_17_pl(0) <= xi_17;



    -- Add a pipeline step
    PL_STEP_0_for_xi_1_pl: entity work.Pipe_Vector GENERIC MAP(STEPS => PIPELINE_STEPS_AT_INPUT) PORT MAP(clk, enable, xi_1_pl(0), xi_1_pl(1));

    -- Add a pipeline step
    PL_STEP_0_for_xi_2_pl: entity work.Pipe_Vector GENERIC MAP(STEPS => PIPELINE_STEPS_AT_INPUT) PORT MAP(clk, enable, xi_2_pl(0), xi_2_pl(1));

    -- Add a pipeline step
    PL_STEP_0_for_xi_3_pl: entity work.Pipe_Vector GENERIC MAP(STEPS => PIPELINE_STEPS_AT_INPUT) PORT MAP(clk, enable, xi_3_pl(0), xi_3_pl(1));

    -- Add a pipeline step
    PL_STEP_0_for_xi_4_pl: entity work.Pipe_Vector GENERIC MAP(STEPS => PIPELINE_STEPS_AT_INPUT) PORT MAP(clk, enable, xi_4_pl(0), xi_4_pl(1));

    -- Add a pipeline step
    PL_STEP_0_for_xi_5_pl: entity work.Pipe_Vector GENERIC MAP(STEPS => PIPELINE_STEPS_AT_INPUT) PORT MAP(clk, enable, xi_5_pl(0), xi_5_pl(1));

    -- Add a pipeline step
    PL_STEP_0_for_xi_6_pl: entity work.Pipe_Vector GENERIC MAP(STEPS => PIPELINE_STEPS_AT_INPUT) PORT MAP(clk, enable, xi_6_pl(0), xi_6_pl(1));

    -- Add a pipeline step
    PL_STEP_0_for_xi_7_pl: entity work.Pipe_Vector GENERIC MAP(STEPS => PIPELINE_STEPS_AT_INPUT) PORT MAP(clk, enable, xi_7_pl(0), xi_7_pl(1));

    -- Add a pipeline step
    PL_STEP_0_for_xi_8_pl: entity work.Pipe_Vector GENERIC MAP(STEPS => PIPELINE_STEPS_AT_INPUT) PORT MAP(clk, enable, xi_8_pl(0), xi_8_pl(1));

    -- Add a pipeline step
    PL_STEP_0_for_xi_9_pl: entity work.Pipe_Vector GENERIC MAP(STEPS => PIPELINE_STEPS_AT_INPUT) PORT MAP(clk, enable, xi_9_pl(0), xi_9_pl(1));

    -- Add a pipeline step
    PL_STEP_0_for_xi_10_pl: entity work.Pipe_Vector GENERIC MAP(STEPS => PIPELINE_STEPS_AT_INPUT) PORT MAP(clk, enable, xi_10_pl(0), xi_10_pl(1));

    -- Add a pipeline step
    PL_STEP_0_for_xi_11_pl: entity work.Pipe_Vector GENERIC MAP(STEPS => PIPELINE_STEPS_AT_INPUT) PORT MAP(clk, enable, xi_11_pl(0), xi_11_pl(1));

    -- Add a pipeline step
    PL_STEP_0_for_xi_12_pl: entity work.Pipe_Vector GENERIC MAP(STEPS => PIPELINE_STEPS_AT_INPUT) PORT MAP(clk, enable, xi_12_pl(0), xi_12_pl(1));

    -- Add a pipeline step
    PL_STEP_0_for_xi_13_pl: entity work.Pipe_Vector GENERIC MAP(STEPS => PIPELINE_STEPS_AT_INPUT) PORT MAP(clk, enable, xi_13_pl(0), xi_13_pl(1));

    -- Add a pipeline step
    PL_STEP_0_for_xi_14_pl: entity work.Pipe_Vector GENERIC MAP(STEPS => PIPELINE_STEPS_AT_INPUT) PORT MAP(clk, enable, xi_14_pl(0), xi_14_pl(1));

    -- Add a pipeline step
    PL_STEP_0_for_xi_15_pl: entity work.Pipe_Vector GENERIC MAP(STEPS => PIPELINE_STEPS_AT_INPUT) PORT MAP(clk, enable, xi_15_pl(0), xi_15_pl(1));

    -- Add a pipeline step
    PL_STEP_0_for_xi_16_pl: entity work.Pipe_Vector GENERIC MAP(STEPS => PIPELINE_STEPS_AT_INPUT) PORT MAP(clk, enable, xi_16_pl(0), xi_16_pl(1));

    -- Add a pipeline step
    PL_STEP_0_for_xi_17_pl: entity work.Pipe_Vector GENERIC MAP(STEPS => PIPELINE_STEPS_AT_INPUT) PORT MAP(clk, enable, xi_17_pl(0), xi_17_pl(1));


    FLOPOCO_ENTITY: entity work.FixMultiAdder_S_17_lsbOut_m11_uid258
        port map
        (
            clk, rst,  enable, enable, enable,
            yo_flopoco , 
            xi_1_pl(1) , 
            xi_2_pl(1) , 
            xi_3_pl(1) , 
            xi_4_pl(1) , 
            xi_5_pl(1) , 
            xi_6_pl(1) , 
            xi_7_pl(1) , 
            xi_8_pl(1) , 
            xi_9_pl(1) , 
            xi_10_pl(1) , 
            xi_11_pl(1) , 
            xi_12_pl(1) , 
            xi_13_pl(1) , 
            xi_14_pl(1) , 
            xi_15_pl(1) , 
            xi_16_pl(1) , 
            xi_17_pl(1) );
    yo_pl(0) <= yo_flopoco(yo_pl(0)'length-1 downto 0);
    -- Add a pipeline step
    PL_STEP_0_for_yo_pl: entity work.Pipe_Vector GENERIC MAP(STEPS => TOTAL_PIPELINE_STEPS + PIPELINE_STEPS_AT_OUTPUT) PORT MAP(clk, enable, yo_pl(0), yo_pl(1));

    yo <= yo_pl(1);
end Behavioral;