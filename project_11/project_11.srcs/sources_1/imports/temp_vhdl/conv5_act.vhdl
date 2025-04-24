LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
use work.ActivationFunctions.all;
use work.conv5_act_settings.all;

entity conv5_act is
    port
    (
        clk   : in std_logic;
        reset : in std_logic;
    
        layer_xi_1    : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_xi_2    : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_xi_3    : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_xi_4    : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_xi_5    : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_xi_6    : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_xi_7    : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_xi_8    : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_xi_9    : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_xi_10    : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_xi_11    : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_xi_12    : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_xi_13    : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_xi_14    : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_xi_15    : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_xi_16    : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_xi_17    : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_xi_18    : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_xi_19    : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_xi_20    : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_xi_21    : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_xi_22    : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_xi_23    : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_xi_24    : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_xi_25    : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_xi_26    : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_xi_27    : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_xi_28    : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_xi_29    : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_xi_30    : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_xi_31    : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        layer_xi_32    : in std_logic_vector(8-1 downto 0); --	sfix(5, -3)
        x_is_valid    : in std_logic;

        y_valid    : out std_logic;
        layer_yo_1 : out std_logic_vector(7-1 downto 0);  --	ufix(4, -3)
        layer_yo_2 : out std_logic_vector(7-1 downto 0);  --	ufix(4, -3)
        layer_yo_3 : out std_logic_vector(7-1 downto 0);  --	ufix(4, -3)
        layer_yo_4 : out std_logic_vector(7-1 downto 0);  --	ufix(4, -3)
        layer_yo_5 : out std_logic_vector(7-1 downto 0);  --	ufix(4, -3)
        layer_yo_6 : out std_logic_vector(7-1 downto 0);  --	ufix(4, -3)
        layer_yo_7 : out std_logic_vector(7-1 downto 0);  --	ufix(4, -3)
        layer_yo_8 : out std_logic_vector(7-1 downto 0);  --	ufix(4, -3)
        layer_yo_9 : out std_logic_vector(7-1 downto 0);  --	ufix(4, -3)
        layer_yo_10 : out std_logic_vector(7-1 downto 0);  --	ufix(4, -3)
        layer_yo_11 : out std_logic_vector(7-1 downto 0);  --	ufix(4, -3)
        layer_yo_12 : out std_logic_vector(7-1 downto 0);  --	ufix(4, -3)
        layer_yo_13 : out std_logic_vector(7-1 downto 0);  --	ufix(4, -3)
        layer_yo_14 : out std_logic_vector(7-1 downto 0);  --	ufix(4, -3)
        layer_yo_15 : out std_logic_vector(7-1 downto 0);  --	ufix(4, -3)
        layer_yo_16 : out std_logic_vector(7-1 downto 0);  --	ufix(4, -3)
        layer_yo_17 : out std_logic_vector(7-1 downto 0);  --	ufix(4, -3)
        layer_yo_18 : out std_logic_vector(7-1 downto 0);  --	ufix(4, -3)
        layer_yo_19 : out std_logic_vector(7-1 downto 0);  --	ufix(4, -3)
        layer_yo_20 : out std_logic_vector(7-1 downto 0);  --	ufix(4, -3)
        layer_yo_21 : out std_logic_vector(7-1 downto 0);  --	ufix(4, -3)
        layer_yo_22 : out std_logic_vector(7-1 downto 0);  --	ufix(4, -3)
        layer_yo_23 : out std_logic_vector(7-1 downto 0);  --	ufix(4, -3)
        layer_yo_24 : out std_logic_vector(7-1 downto 0);  --	ufix(4, -3)
        layer_yo_25 : out std_logic_vector(7-1 downto 0);  --	ufix(4, -3)
        layer_yo_26 : out std_logic_vector(7-1 downto 0);  --	ufix(4, -3)
        layer_yo_27 : out std_logic_vector(7-1 downto 0);  --	ufix(4, -3)
        layer_yo_28 : out std_logic_vector(7-1 downto 0);  --	ufix(4, -3)
        layer_yo_29 : out std_logic_vector(7-1 downto 0);  --	ufix(4, -3)
        layer_yo_30 : out std_logic_vector(7-1 downto 0);  --	ufix(4, -3)
        layer_yo_31 : out std_logic_vector(7-1 downto 0);  --	ufix(4, -3)
        layer_yo_32 : out std_logic_vector(7-1 downto 0) --	ufix(4, -3)
    ) ;
end conv5_act;

architecture Behavioral of conv5_act is


    attribute KEEP_HIERARCHY : string;
    attribute KEEP_HIERARCHY of conv5_act : entity is "yes";

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
    type PIPELINE_TYPE_FOR_X_IS_VALID_SIGNAL    is array(0 to 1) of std_logic;


    -- sfix(5, -3)
    signal layer_xi_1_signal    : PIPELINE_TYPE_FOR_LAYER_XI_1_SIGNAL;
    -- sfix(5, -3)
    signal layer_xi_2_signal    : PIPELINE_TYPE_FOR_LAYER_XI_2_SIGNAL;
    -- sfix(5, -3)
    signal layer_xi_3_signal    : PIPELINE_TYPE_FOR_LAYER_XI_3_SIGNAL;
    -- sfix(5, -3)
    signal layer_xi_4_signal    : PIPELINE_TYPE_FOR_LAYER_XI_4_SIGNAL;
    -- sfix(5, -3)
    signal layer_xi_5_signal    : PIPELINE_TYPE_FOR_LAYER_XI_5_SIGNAL;
    -- sfix(5, -3)
    signal layer_xi_6_signal    : PIPELINE_TYPE_FOR_LAYER_XI_6_SIGNAL;
    -- sfix(5, -3)
    signal layer_xi_7_signal    : PIPELINE_TYPE_FOR_LAYER_XI_7_SIGNAL;
    -- sfix(5, -3)
    signal layer_xi_8_signal    : PIPELINE_TYPE_FOR_LAYER_XI_8_SIGNAL;
    -- sfix(5, -3)
    signal layer_xi_9_signal    : PIPELINE_TYPE_FOR_LAYER_XI_9_SIGNAL;
    -- sfix(5, -3)
    signal layer_xi_10_signal   : PIPELINE_TYPE_FOR_LAYER_XI_10_SIGNAL;
    -- sfix(5, -3)
    signal layer_xi_11_signal   : PIPELINE_TYPE_FOR_LAYER_XI_11_SIGNAL;
    -- sfix(5, -3)
    signal layer_xi_12_signal   : PIPELINE_TYPE_FOR_LAYER_XI_12_SIGNAL;
    -- sfix(5, -3)
    signal layer_xi_13_signal   : PIPELINE_TYPE_FOR_LAYER_XI_13_SIGNAL;
    -- sfix(5, -3)
    signal layer_xi_14_signal   : PIPELINE_TYPE_FOR_LAYER_XI_14_SIGNAL;
    -- sfix(5, -3)
    signal layer_xi_15_signal   : PIPELINE_TYPE_FOR_LAYER_XI_15_SIGNAL;
    -- sfix(5, -3)
    signal layer_xi_16_signal   : PIPELINE_TYPE_FOR_LAYER_XI_16_SIGNAL;
    -- sfix(5, -3)
    signal layer_xi_17_signal   : PIPELINE_TYPE_FOR_LAYER_XI_17_SIGNAL;
    -- sfix(5, -3)
    signal layer_xi_18_signal   : PIPELINE_TYPE_FOR_LAYER_XI_18_SIGNAL;
    -- sfix(5, -3)
    signal layer_xi_19_signal   : PIPELINE_TYPE_FOR_LAYER_XI_19_SIGNAL;
    -- sfix(5, -3)
    signal layer_xi_20_signal   : PIPELINE_TYPE_FOR_LAYER_XI_20_SIGNAL;
    -- sfix(5, -3)
    signal layer_xi_21_signal   : PIPELINE_TYPE_FOR_LAYER_XI_21_SIGNAL;
    -- sfix(5, -3)
    signal layer_xi_22_signal   : PIPELINE_TYPE_FOR_LAYER_XI_22_SIGNAL;
    -- sfix(5, -3)
    signal layer_xi_23_signal   : PIPELINE_TYPE_FOR_LAYER_XI_23_SIGNAL;
    -- sfix(5, -3)
    signal layer_xi_24_signal   : PIPELINE_TYPE_FOR_LAYER_XI_24_SIGNAL;
    -- sfix(5, -3)
    signal layer_xi_25_signal   : PIPELINE_TYPE_FOR_LAYER_XI_25_SIGNAL;
    -- sfix(5, -3)
    signal layer_xi_26_signal   : PIPELINE_TYPE_FOR_LAYER_XI_26_SIGNAL;
    -- sfix(5, -3)
    signal layer_xi_27_signal   : PIPELINE_TYPE_FOR_LAYER_XI_27_SIGNAL;
    -- sfix(5, -3)
    signal layer_xi_28_signal   : PIPELINE_TYPE_FOR_LAYER_XI_28_SIGNAL;
    -- sfix(5, -3)
    signal layer_xi_29_signal   : PIPELINE_TYPE_FOR_LAYER_XI_29_SIGNAL;
    -- sfix(5, -3)
    signal layer_xi_30_signal   : PIPELINE_TYPE_FOR_LAYER_XI_30_SIGNAL;
    -- sfix(5, -3)
    signal layer_xi_31_signal   : PIPELINE_TYPE_FOR_LAYER_XI_31_SIGNAL;
    -- sfix(5, -3)
    signal layer_xi_32_signal   : PIPELINE_TYPE_FOR_LAYER_XI_32_SIGNAL;




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
            elsif signed(layer_xi_1_signal(1)) > to_signed(48, layer_xi_1_signal(1)'length) then
                layer_yo_1 <= std_logic_vector(to_unsigned(48, layer_yo_1'length));
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
            elsif signed(layer_xi_2_signal(1)) > to_signed(48, layer_xi_2_signal(1)'length) then
                layer_yo_2 <= std_logic_vector(to_unsigned(48, layer_yo_2'length));
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
            elsif signed(layer_xi_3_signal(1)) > to_signed(48, layer_xi_3_signal(1)'length) then
                layer_yo_3 <= std_logic_vector(to_unsigned(48, layer_yo_3'length));
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
            elsif signed(layer_xi_4_signal(1)) > to_signed(48, layer_xi_4_signal(1)'length) then
                layer_yo_4 <= std_logic_vector(to_unsigned(48, layer_yo_4'length));
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
            elsif signed(layer_xi_5_signal(1)) > to_signed(48, layer_xi_5_signal(1)'length) then
                layer_yo_5 <= std_logic_vector(to_unsigned(48, layer_yo_5'length));
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
            elsif signed(layer_xi_6_signal(1)) > to_signed(48, layer_xi_6_signal(1)'length) then
                layer_yo_6 <= std_logic_vector(to_unsigned(48, layer_yo_6'length));
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
            elsif signed(layer_xi_7_signal(1)) > to_signed(48, layer_xi_7_signal(1)'length) then
                layer_yo_7 <= std_logic_vector(to_unsigned(48, layer_yo_7'length));
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
            elsif signed(layer_xi_8_signal(1)) > to_signed(48, layer_xi_8_signal(1)'length) then
                layer_yo_8 <= std_logic_vector(to_unsigned(48, layer_yo_8'length));
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
            elsif signed(layer_xi_9_signal(1)) > to_signed(48, layer_xi_9_signal(1)'length) then
                layer_yo_9 <= std_logic_vector(to_unsigned(48, layer_yo_9'length));
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
            elsif signed(layer_xi_10_signal(1)) > to_signed(48, layer_xi_10_signal(1)'length) then
                layer_yo_10 <= std_logic_vector(to_unsigned(48, layer_yo_10'length));
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
            elsif signed(layer_xi_11_signal(1)) > to_signed(48, layer_xi_11_signal(1)'length) then
                layer_yo_11 <= std_logic_vector(to_unsigned(48, layer_yo_11'length));
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
            elsif signed(layer_xi_12_signal(1)) > to_signed(48, layer_xi_12_signal(1)'length) then
                layer_yo_12 <= std_logic_vector(to_unsigned(48, layer_yo_12'length));
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
            elsif signed(layer_xi_13_signal(1)) > to_signed(48, layer_xi_13_signal(1)'length) then
                layer_yo_13 <= std_logic_vector(to_unsigned(48, layer_yo_13'length));
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
            elsif signed(layer_xi_14_signal(1)) > to_signed(48, layer_xi_14_signal(1)'length) then
                layer_yo_14 <= std_logic_vector(to_unsigned(48, layer_yo_14'length));
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
            elsif signed(layer_xi_15_signal(1)) > to_signed(48, layer_xi_15_signal(1)'length) then
                layer_yo_15 <= std_logic_vector(to_unsigned(48, layer_yo_15'length));
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
            elsif signed(layer_xi_16_signal(1)) > to_signed(48, layer_xi_16_signal(1)'length) then
                layer_yo_16 <= std_logic_vector(to_unsigned(48, layer_yo_16'length));
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
            elsif signed(layer_xi_17_signal(1)) > to_signed(48, layer_xi_17_signal(1)'length) then
                layer_yo_17 <= std_logic_vector(to_unsigned(48, layer_yo_17'length));
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
            elsif signed(layer_xi_18_signal(1)) > to_signed(48, layer_xi_18_signal(1)'length) then
                layer_yo_18 <= std_logic_vector(to_unsigned(48, layer_yo_18'length));
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
            elsif signed(layer_xi_19_signal(1)) > to_signed(48, layer_xi_19_signal(1)'length) then
                layer_yo_19 <= std_logic_vector(to_unsigned(48, layer_yo_19'length));
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
            elsif signed(layer_xi_20_signal(1)) > to_signed(48, layer_xi_20_signal(1)'length) then
                layer_yo_20 <= std_logic_vector(to_unsigned(48, layer_yo_20'length));
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
            elsif signed(layer_xi_21_signal(1)) > to_signed(48, layer_xi_21_signal(1)'length) then
                layer_yo_21 <= std_logic_vector(to_unsigned(48, layer_yo_21'length));
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
            elsif signed(layer_xi_22_signal(1)) > to_signed(48, layer_xi_22_signal(1)'length) then
                layer_yo_22 <= std_logic_vector(to_unsigned(48, layer_yo_22'length));
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
            elsif signed(layer_xi_23_signal(1)) > to_signed(48, layer_xi_23_signal(1)'length) then
                layer_yo_23 <= std_logic_vector(to_unsigned(48, layer_yo_23'length));
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
            elsif signed(layer_xi_24_signal(1)) > to_signed(48, layer_xi_24_signal(1)'length) then
                layer_yo_24 <= std_logic_vector(to_unsigned(48, layer_yo_24'length));
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
            elsif signed(layer_xi_25_signal(1)) > to_signed(48, layer_xi_25_signal(1)'length) then
                layer_yo_25 <= std_logic_vector(to_unsigned(48, layer_yo_25'length));
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
            elsif signed(layer_xi_26_signal(1)) > to_signed(48, layer_xi_26_signal(1)'length) then
                layer_yo_26 <= std_logic_vector(to_unsigned(48, layer_yo_26'length));
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
            elsif signed(layer_xi_27_signal(1)) > to_signed(48, layer_xi_27_signal(1)'length) then
                layer_yo_27 <= std_logic_vector(to_unsigned(48, layer_yo_27'length));
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
            elsif signed(layer_xi_28_signal(1)) > to_signed(48, layer_xi_28_signal(1)'length) then
                layer_yo_28 <= std_logic_vector(to_unsigned(48, layer_yo_28'length));
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
            elsif signed(layer_xi_29_signal(1)) > to_signed(48, layer_xi_29_signal(1)'length) then
                layer_yo_29 <= std_logic_vector(to_unsigned(48, layer_yo_29'length));
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
            elsif signed(layer_xi_30_signal(1)) > to_signed(48, layer_xi_30_signal(1)'length) then
                layer_yo_30 <= std_logic_vector(to_unsigned(48, layer_yo_30'length));
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
            elsif signed(layer_xi_31_signal(1)) > to_signed(48, layer_xi_31_signal(1)'length) then
                layer_yo_31 <= std_logic_vector(to_unsigned(48, layer_yo_31'length));
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
            elsif signed(layer_xi_32_signal(1)) > to_signed(48, layer_xi_32_signal(1)'length) then
                layer_yo_32 <= std_logic_vector(to_unsigned(48, layer_yo_32'length));
            else
                layer_yo_32 <= std_logic_vector(layer_xi_32_signal(1)(layer_xi_32_signal(1)'length-2 downto 0));  -- Keep x_n unchanged if not negative
            end if;
        end if;
    end process;



end Behavioral;