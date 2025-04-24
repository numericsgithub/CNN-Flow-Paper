LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;
use work.conv2_settings.all;

ENTITY conv2_core7_KPU1 IS
    GENERIC
    (
        PIPELINE_STEPS : natural := 0
    );
	PORT (
		clk    : in std_logic;
		rst    : in std_logic;
		x_is_valid : in std_logic;
        kpu_xi_1 : in std_logic_vector(15-1 downto 0); --	sfix(11, -4)
        kpu_xi_2 : in std_logic_vector(15-1 downto 0); --	sfix(11, -4)
        kpu_xi_3 : in std_logic_vector(14-1 downto 0); --	sfix(10, -4)
        kpu_xi_4 : in std_logic_vector(15-1 downto 0); --	sfix(11, -4)
        kpu_xi_5 : in std_logic_vector(14-1 downto 0); --	sfix(10, -4)
        kpu_xi_6 : in std_logic_vector(14-1 downto 0); --	sfix(10, -4)
        kpu_xi_7 : in std_logic_vector(14-1 downto 0); --	sfix(10, -4)
        kpu_xi_8 : in std_logic_vector(14-1 downto 0); --	sfix(10, -4)
        kpu_xi_9 : in std_logic_vector(13-1 downto 0); --	sfix(9, -4)

    
        big_undelayed_out_1 : out std_logic_vector(18-1 downto 0); --	sfix(14, -4)
        big_delayed_in_1 : in std_logic_vector(18-1 downto 0); --	sfix(14, -4)
        big_undelayed_out_2 : out std_logic_vector(18-1 downto 0); --	sfix(14, -4)
        big_delayed_in_2 : in std_logic_vector(18-1 downto 0); --	sfix(14, -4)

    
        small_undelayed_out_1 : out std_logic_vector(15-1 downto 0); --	sfix(11, -4)
        small_delayed_in_1 : in std_logic_vector(15-1 downto 0); --	sfix(11, -4)
        small_undelayed_out_2 : out std_logic_vector(17-1 downto 0); --	sfix(13, -4)
        small_delayed_in_2 : in std_logic_vector(17-1 downto 0); --	sfix(13, -4)
        small_undelayed_out_3 : out std_logic_vector(18-1 downto 0); --	sfix(14, -4)
        small_delayed_in_3 : in std_logic_vector(18-1 downto 0); --	sfix(14, -4)
        small_undelayed_out_4 : out std_logic_vector(18-1 downto 0); --	sfix(14, -4)
        small_delayed_in_4 : in std_logic_vector(18-1 downto 0); --	sfix(14, -4)
        small_undelayed_out_5 : out std_logic_vector(18-1 downto 0); --	sfix(14, -4)
        small_delayed_in_5 : in std_logic_vector(18-1 downto 0); --	sfix(14, -4)
        small_undelayed_out_6 : out std_logic_vector(18-1 downto 0); --	sfix(14, -4)
        small_delayed_in_6 : in std_logic_vector(18-1 downto 0); --	sfix(14, -4)

		yo : OUT std_logic_vector(18-1 downto 0) --	sfix(14, -4)
	);
END conv2_core7_KPU1;

ARCHITECTURE structural OF conv2_core7_KPU1 IS

    -- All all_additional_output_int_bits are:         [0, 2, 3, 3, 2, 2, 2, 2, 2]
    -- All all_additional_output_int_bits_weights are: [[0.0, 0.0, 71.0, -17.0], [0.0, 0.0, 67.0, -20.0], [0.0, 0.0, 49.0, -9.0], [-1.0, 0.0, 85.0, -20.0], [0.0, 0.0, 62.0, -31.0], [0.0, 0.0, 38.0, -23.0], [0.0, -1.0, 40.0, -29.0], [0.0, 0.0, 35.0, -34.0], [0.0, 0.0, -3.0, -17.0]]
    signal adder_1_input_xi  : std_logic_vector(15-1 downto 0); --	sfix(11, -4)
    signal adder_2_input_xi  : std_logic_vector(15-1 downto 0); --	sfix(11, -4)
    signal adder_3_input_xi  : std_logic_vector(14-1 downto 0); --	sfix(10, -4)
    signal adder_4_input_xi  : std_logic_vector(15-1 downto 0); --	sfix(11, -4)
    signal adder_5_input_xi  : std_logic_vector(14-1 downto 0); --	sfix(10, -4)
    signal adder_6_input_xi  : std_logic_vector(14-1 downto 0); --	sfix(10, -4)
    signal adder_7_input_xi  : std_logic_vector(14-1 downto 0); --	sfix(10, -4)
    signal adder_8_input_xi  : std_logic_vector(14-1 downto 0); --	sfix(10, -4)
    signal adder_9_input_xi  : std_logic_vector(13-1 downto 0); --	sfix(9, -4)

    -- To keep things simple, we add an bogus adder at the start. But there is none. This is just a small simplification.
    -- Unreshaped Adder would be: sfix(11, -4) + nothing = sfix(11, -4)
    -- Reshaped Adder would be:   sfix(11, -4) + sfix(11, -4) = sfix(11, -4)
    -- 
    signal adder_1_output    : std_logic_vector(15-1 downto 0); --	sfix(11, -4)
    signal adder_2_input_sum : std_logic_vector(15-1 downto 0); --	sfix(11, -4)



    -- Unreshaped Adder would be: sfix(11, -4) + sfix(11, -4) = sfix(13, -4)
    -- Reshaped Adder would be:   sfix(11, -4) + sfix(11, -4) = sfix(13, -4)
    -- 
    signal adder_2_output    : std_logic_vector(17-1 downto 0); --	sfix(13, -4)
    signal adder_3_input_sum : std_logic_vector(17-1 downto 0); --	sfix(13, -4)



    -- Unreshaped Adder would be: sfix(10, -4) + sfix(13, -4) = sfix(14, -4)
    -- Reshaped Adder would be:   sfix(13, -4) + sfix(13, -4) = sfix(14, -4)
    -- 
    signal adder_3_output    : std_logic_vector(18-1 downto 0); --	sfix(14, -4)
    signal adder_4_input_sum : std_logic_vector(18-1 downto 0); --	sfix(14, -4)



    -- Unreshaped Adder would be: sfix(11, -4) + sfix(14, -4) = sfix(14, -4)
    -- Reshaped Adder would be:   sfix(14, -4) + sfix(14, -4) = sfix(14, -4)
    -- 
    signal adder_4_output    : std_logic_vector(18-1 downto 0); --	sfix(14, -4)
    signal adder_5_input_sum : std_logic_vector(18-1 downto 0); --	sfix(14, -4)



    -- Unreshaped Adder would be: sfix(10, -4) + sfix(14, -4) = sfix(14, -4)
    -- Reshaped Adder would be:   sfix(14, -4) + sfix(14, -4) = sfix(14, -4)
    -- 
    signal adder_5_output    : std_logic_vector(18-1 downto 0); --	sfix(14, -4)
    signal adder_6_input_sum : std_logic_vector(18-1 downto 0); --	sfix(14, -4)



    -- Unreshaped Adder would be: sfix(10, -4) + sfix(14, -4) = sfix(14, -4)
    -- Reshaped Adder would be:   sfix(14, -4) + sfix(14, -4) = sfix(14, -4)
    -- 
    signal adder_6_output    : std_logic_vector(18-1 downto 0); --	sfix(14, -4)
    signal adder_7_input_sum : std_logic_vector(18-1 downto 0); --	sfix(14, -4)



    -- Unreshaped Adder would be: sfix(10, -4) + sfix(14, -4) = sfix(14, -4)
    -- Reshaped Adder would be:   sfix(14, -4) + sfix(14, -4) = sfix(14, -4)
    -- 
    signal adder_7_output    : std_logic_vector(18-1 downto 0); --	sfix(14, -4)
    signal adder_8_input_sum : std_logic_vector(18-1 downto 0); --	sfix(14, -4)



    -- Unreshaped Adder would be: sfix(10, -4) + sfix(14, -4) = sfix(14, -4)
    -- Reshaped Adder would be:   sfix(14, -4) + sfix(14, -4) = sfix(14, -4)
    -- 
    signal adder_8_output    : std_logic_vector(18-1 downto 0); --	sfix(14, -4)
    signal adder_9_input_sum : std_logic_vector(18-1 downto 0); --	sfix(14, -4)



    -- Unreshaped Adder would be: sfix(9, -4) + sfix(14, -4) = sfix(14, -4)
    -- Reshaped Adder would be:   sfix(14, -4) + sfix(14, -4) = sfix(14, -4)
    -- 
    signal adder_9_output    : std_logic_vector(18-1 downto 0); --	sfix(14, -4)
    signal adder_10_input_sum : std_logic_vector(18-1 downto 0); --	sfix(14, -4)




BEGIN


    adder_1_input_xi <= kpu_xi_1;






    adder_2_input_xi <= kpu_xi_2;






    adder_2_input_sum <= adder_1_output;






    adder_3_input_xi <= kpu_xi_3;






    adder_3_input_sum <= adder_2_output;






    adder_4_input_xi <= kpu_xi_4;






    adder_4_input_sum <= adder_3_output;






    adder_5_input_xi <= kpu_xi_5;






    adder_5_input_sum <= adder_4_output;






    adder_6_input_xi <= kpu_xi_6;






    adder_6_input_sum <= adder_5_output;






    adder_7_input_xi <= kpu_xi_7;






    adder_7_input_sum <= adder_6_output;






    adder_8_input_xi <= kpu_xi_8;






    adder_8_input_sum <= adder_7_output;






    adder_9_input_xi <= kpu_xi_9;






    adder_9_input_sum <= adder_8_output;









    small_undelayed_out_1 <= adder_1_input_xi;
    PL_STEP_FOR_FIRST_INPUT: entity work.DelayReg 
        generic map(WL => small_delayed_in_1'length, BL => PIPELINE_STEPS)
        PORT MAP(clk, '0', x_is_valid, small_delayed_in_1, adder_1_output);
	--adder_1_output <= small_delayed_in_1;
	adder_2: entity work.IntMultiAdder_S_in11_m4_11_m4_out13_m4_wrapper_wrapper 
        generic map(ADDER_LOCATION => "conv2_core7_KPU1_adder2", PIPELINE_STEPS => PIPELINE_STEPS) 
        PORT MAP(clk, '0', x_is_valid, adder_2_input_xi, adder_2_input_sum, small_undelayed_out_2);
	adder_2_output <= small_delayed_in_2;

    line_adder_3: entity work.IntMultiAdder_S_in10_m4_13_m4_out14_m4_wrapper_wrapper 
        generic map(ADDER_LOCATION => "conv2_core7_KPU1_adder3", PIPELINE_STEPS => PIPELINE_STEPS) 
        PORT MAP(clk, '0', x_is_valid, adder_3_input_xi, adder_3_input_sum, big_undelayed_out_1);
	adder_3_output <= big_delayed_in_1;
	adder_4: entity work.IntMultiAdder_S_in11_m4_14_m4_out14_m4_wrapper_wrapper 
        generic map(ADDER_LOCATION => "conv2_core7_KPU1_adder4", PIPELINE_STEPS => PIPELINE_STEPS) 
        PORT MAP(clk, '0', x_is_valid, adder_4_input_xi, adder_4_input_sum, small_undelayed_out_3);
	adder_4_output <= small_delayed_in_3;
	adder_5: entity work.IntMultiAdder_S_in10_m4_14_m4_out14_m4_wrapper_wrapper 
        generic map(ADDER_LOCATION => "conv2_core7_KPU1_adder5", PIPELINE_STEPS => PIPELINE_STEPS) 
        PORT MAP(clk, '0', x_is_valid, adder_5_input_xi, adder_5_input_sum, small_undelayed_out_4);
	adder_5_output <= small_delayed_in_4;

    line_adder_6: entity work.IntMultiAdder_S_in10_m4_14_m4_out14_m4_wrapper_wrapper 
        generic map(ADDER_LOCATION => "conv2_core7_KPU1_adder6", PIPELINE_STEPS => PIPELINE_STEPS) 
        PORT MAP(clk, '0', x_is_valid, adder_6_input_xi, adder_6_input_sum, big_undelayed_out_2);
	adder_6_output <= big_delayed_in_2;
	adder_7: entity work.IntMultiAdder_S_in10_m4_14_m4_out14_m4_wrapper_wrapper 
        generic map(ADDER_LOCATION => "conv2_core7_KPU1_adder7", PIPELINE_STEPS => PIPELINE_STEPS) 
        PORT MAP(clk, '0', x_is_valid, adder_7_input_xi, adder_7_input_sum, small_undelayed_out_5);
	adder_7_output <= small_delayed_in_5;
	adder_8: entity work.IntMultiAdder_S_in10_m4_14_m4_out14_m4_wrapper_wrapper 
        generic map(ADDER_LOCATION => "conv2_core7_KPU1_adder8", PIPELINE_STEPS => PIPELINE_STEPS) 
        PORT MAP(clk, '0', x_is_valid, adder_8_input_xi, adder_8_input_sum, small_undelayed_out_6);
	adder_8_output <= small_delayed_in_6;

    last_stage: entity work.IntMultiAdder_S_in9_m4_14_m4_out14_m4_wrapper_wrapper
        generic map(ADDER_LOCATION => "conv2_core7_KPU1_adder9", PIPELINE_STEPS => PIPELINE_STEPS) 
        PORT MAP(clk, '0', x_is_valid, adder_9_input_xi, adder_9_input_sum, yo );
	--last_stage : entity work.conv_stage_last GENERIC MAP(XI_WIDTH => XI_WIDTH, WI_WIDTH => WI_WIDTH)
	--PORT MAP(kpu_xi_9, adder_output_8, adder_output_9);


    -- yo <= adder_output_9;
	-- add_bias : entity work. PORT MAP(yo, adder_output_9, bias_extend);

	-- yi_array(0) <= (OTHERS => '0');--input of 1st stage's adder.

END structural;