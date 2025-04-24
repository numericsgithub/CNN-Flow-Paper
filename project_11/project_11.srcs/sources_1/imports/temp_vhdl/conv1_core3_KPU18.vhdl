LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;
use work.conv1_settings.all;

ENTITY conv1_core3_KPU18 IS
    GENERIC
    (
        PIPELINE_STEPS : natural := 0
    );
	PORT (
		clk    : in std_logic;
		rst    : in std_logic;
		x_is_valid : in std_logic;
        kpu_xi_1 : in std_logic_vector(10-1 downto 0); --	sfix(-2, -12)
        kpu_xi_2 : in std_logic_vector(12-1 downto 0); --	sfix(0, -12)
        kpu_xi_3 : in std_logic_vector(11-1 downto 0); --	sfix(-1, -12)
        kpu_xi_4 : in std_logic_vector(12-1 downto 0); --	sfix(0, -12)
        kpu_xi_5 : in std_logic_vector(12-1 downto 0); --	sfix(0, -12)
        kpu_xi_6 : in std_logic_vector(11-1 downto 0); --	sfix(-1, -12)
        kpu_xi_7 : in std_logic_vector(11-1 downto 0); --	sfix(-1, -12)
        kpu_xi_8 : in std_logic_vector(10-1 downto 0); --	sfix(-2, -12)
        kpu_xi_9 : in std_logic_vector(13-1 downto 0); --	sfix(1, -12)

    
        big_undelayed_out_1 : out std_logic_vector(14-1 downto 0); --	sfix(2, -12)
        big_delayed_in_1 : in std_logic_vector(14-1 downto 0); --	sfix(2, -12)
        big_undelayed_out_2 : out std_logic_vector(15-1 downto 0); --	sfix(3, -12)
        big_delayed_in_2 : in std_logic_vector(15-1 downto 0); --	sfix(3, -12)

    
        small_undelayed_out_1 : out std_logic_vector(10-1 downto 0); --	sfix(-2, -12)
        small_delayed_in_1 : in std_logic_vector(10-1 downto 0); --	sfix(-2, -12)
        small_undelayed_out_2 : out std_logic_vector(12-1 downto 0); --	sfix(0, -12)
        small_delayed_in_2 : in std_logic_vector(12-1 downto 0); --	sfix(0, -12)
        small_undelayed_out_3 : out std_logic_vector(15-1 downto 0); --	sfix(3, -12)
        small_delayed_in_3 : in std_logic_vector(15-1 downto 0); --	sfix(3, -12)
        small_undelayed_out_4 : out std_logic_vector(15-1 downto 0); --	sfix(3, -12)
        small_delayed_in_4 : in std_logic_vector(15-1 downto 0); --	sfix(3, -12)
        small_undelayed_out_5 : out std_logic_vector(15-1 downto 0); --	sfix(3, -12)
        small_delayed_in_5 : in std_logic_vector(15-1 downto 0); --	sfix(3, -12)
        small_undelayed_out_6 : out std_logic_vector(15-1 downto 0); --	sfix(3, -12)
        small_delayed_in_6 : in std_logic_vector(15-1 downto 0); --	sfix(3, -12)

		yo : OUT std_logic_vector(15-1 downto 0) --	sfix(3, -12)
	);
END conv1_core3_KPU18;

ARCHITECTURE structural OF conv1_core3_KPU18 IS

    -- All all_additional_output_int_bits are:         [0, 2, 4, 5, 4, 4, 4, 4, 4]
    -- All all_additional_output_int_bits_weights are: [[-2.0], [-5.0], [-4.0], [-6.0], [-6.0], [-3.0], [-4.0], [-2.0], [0.0]]
    signal adder_1_input_xi  : std_logic_vector(10-1 downto 0); --	sfix(-2, -12)
    signal adder_2_input_xi  : std_logic_vector(12-1 downto 0); --	sfix(0, -12)
    signal adder_3_input_xi  : std_logic_vector(11-1 downto 0); --	sfix(-1, -12)
    signal adder_4_input_xi  : std_logic_vector(12-1 downto 0); --	sfix(0, -12)
    signal adder_5_input_xi  : std_logic_vector(12-1 downto 0); --	sfix(0, -12)
    signal adder_6_input_xi  : std_logic_vector(11-1 downto 0); --	sfix(-1, -12)
    signal adder_7_input_xi  : std_logic_vector(11-1 downto 0); --	sfix(-1, -12)
    signal adder_8_input_xi  : std_logic_vector(10-1 downto 0); --	sfix(-2, -12)
    signal adder_9_input_xi  : std_logic_vector(13-1 downto 0); --	sfix(1, -12)

    -- To keep things simple, we add an bogus adder at the start. But there is none. This is just a small simplification.
    -- Unreshaped Adder would be: sfix(-2, -12) + nothing = sfix(-2, -12)
    -- Reshaped Adder would be:   sfix(-2, -12) + sfix(-2, -12) = sfix(-2, -12)
    -- 
    signal adder_1_output    : std_logic_vector(10-1 downto 0); --	sfix(-2, -12)
    signal adder_2_input_sum : std_logic_vector(10-1 downto 0); --	sfix(-2, -12)



    -- Unreshaped Adder would be: sfix(0, -12) + sfix(-2, -12) = sfix(0, -12)
    -- Reshaped Adder would be:   sfix(0, -12) + sfix(0, -12) = sfix(0, -12)
    -- 
    signal adder_2_output    : std_logic_vector(12-1 downto 0); --	sfix(0, -12)
    signal adder_3_input_sum : std_logic_vector(12-1 downto 0); --	sfix(0, -12)



    -- Unreshaped Adder would be: sfix(-1, -12) + sfix(0, -12) = sfix(2, -12)
    -- Reshaped Adder would be:   sfix(0, -12) + sfix(0, -12) = sfix(2, -12)
    -- 
    signal adder_3_output    : std_logic_vector(14-1 downto 0); --	sfix(2, -12)
    signal adder_4_input_sum : std_logic_vector(14-1 downto 0); --	sfix(2, -12)



    -- Unreshaped Adder would be: sfix(0, -12) + sfix(2, -12) = sfix(3, -12)
    -- Reshaped Adder would be:   sfix(2, -12) + sfix(2, -12) = sfix(3, -12)
    -- 
    signal adder_4_output    : std_logic_vector(15-1 downto 0); --	sfix(3, -12)
    signal adder_5_input_sum : std_logic_vector(15-1 downto 0); --	sfix(3, -12)



    -- Unreshaped Adder would be: sfix(0, -12) + sfix(3, -12) = sfix(3, -12)
    -- Reshaped Adder would be:   sfix(3, -12) + sfix(3, -12) = sfix(3, -12)
    -- 
    signal adder_5_output    : std_logic_vector(15-1 downto 0); --	sfix(3, -12)
    signal adder_6_input_sum : std_logic_vector(15-1 downto 0); --	sfix(3, -12)



    -- Unreshaped Adder would be: sfix(-1, -12) + sfix(3, -12) = sfix(3, -12)
    -- Reshaped Adder would be:   sfix(3, -12) + sfix(3, -12) = sfix(3, -12)
    -- 
    signal adder_6_output    : std_logic_vector(15-1 downto 0); --	sfix(3, -12)
    signal adder_7_input_sum : std_logic_vector(15-1 downto 0); --	sfix(3, -12)



    -- Unreshaped Adder would be: sfix(-1, -12) + sfix(3, -12) = sfix(3, -12)
    -- Reshaped Adder would be:   sfix(3, -12) + sfix(3, -12) = sfix(3, -12)
    -- 
    signal adder_7_output    : std_logic_vector(15-1 downto 0); --	sfix(3, -12)
    signal adder_8_input_sum : std_logic_vector(15-1 downto 0); --	sfix(3, -12)



    -- Unreshaped Adder would be: sfix(-2, -12) + sfix(3, -12) = sfix(3, -12)
    -- Reshaped Adder would be:   sfix(3, -12) + sfix(3, -12) = sfix(3, -12)
    -- 
    signal adder_8_output    : std_logic_vector(15-1 downto 0); --	sfix(3, -12)
    signal adder_9_input_sum : std_logic_vector(15-1 downto 0); --	sfix(3, -12)



    -- Unreshaped Adder would be: sfix(1, -12) + sfix(3, -12) = sfix(3, -12)
    -- Reshaped Adder would be:   sfix(3, -12) + sfix(3, -12) = sfix(3, -12)
    -- 
    signal adder_9_output    : std_logic_vector(15-1 downto 0); --	sfix(3, -12)
    signal adder_10_input_sum : std_logic_vector(15-1 downto 0); --	sfix(3, -12)




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
	adder_2: entity work.IntMultiAdder_S_in0_m12_m2_m12_out0_m12_wrapper_wrapper 
        generic map(ADDER_LOCATION => "conv1_core3_KPU18_adder2", PIPELINE_STEPS => PIPELINE_STEPS) 
        PORT MAP(clk, '0', x_is_valid, adder_2_input_xi, adder_2_input_sum, small_undelayed_out_2);
	adder_2_output <= small_delayed_in_2;

    line_adder_3: entity work.IntMultiAdder_S_inm1_m12_0_m12_out2_m12_wrapper_wrapper 
        generic map(ADDER_LOCATION => "conv1_core3_KPU18_adder3", PIPELINE_STEPS => PIPELINE_STEPS) 
        PORT MAP(clk, '0', x_is_valid, adder_3_input_xi, adder_3_input_sum, big_undelayed_out_1);
	adder_3_output <= big_delayed_in_1;
	adder_4: entity work.IntMultiAdder_S_in0_m12_2_m12_out3_m12_wrapper_wrapper 
        generic map(ADDER_LOCATION => "conv1_core3_KPU18_adder4", PIPELINE_STEPS => PIPELINE_STEPS) 
        PORT MAP(clk, '0', x_is_valid, adder_4_input_xi, adder_4_input_sum, small_undelayed_out_3);
	adder_4_output <= small_delayed_in_3;
	adder_5: entity work.IntMultiAdder_S_in0_m12_3_m12_out3_m12_wrapper_wrapper 
        generic map(ADDER_LOCATION => "conv1_core3_KPU18_adder5", PIPELINE_STEPS => PIPELINE_STEPS) 
        PORT MAP(clk, '0', x_is_valid, adder_5_input_xi, adder_5_input_sum, small_undelayed_out_4);
	adder_5_output <= small_delayed_in_4;

    line_adder_6: entity work.IntMultiAdder_S_inm1_m12_3_m12_out3_m12_wrapper_wrapper 
        generic map(ADDER_LOCATION => "conv1_core3_KPU18_adder6", PIPELINE_STEPS => PIPELINE_STEPS) 
        PORT MAP(clk, '0', x_is_valid, adder_6_input_xi, adder_6_input_sum, big_undelayed_out_2);
	adder_6_output <= big_delayed_in_2;
	adder_7: entity work.IntMultiAdder_S_inm1_m12_3_m12_out3_m12_wrapper_wrapper 
        generic map(ADDER_LOCATION => "conv1_core3_KPU18_adder7", PIPELINE_STEPS => PIPELINE_STEPS) 
        PORT MAP(clk, '0', x_is_valid, adder_7_input_xi, adder_7_input_sum, small_undelayed_out_5);
	adder_7_output <= small_delayed_in_5;
	adder_8: entity work.IntMultiAdder_S_inm2_m12_3_m12_out3_m12_wrapper_wrapper 
        generic map(ADDER_LOCATION => "conv1_core3_KPU18_adder8", PIPELINE_STEPS => PIPELINE_STEPS) 
        PORT MAP(clk, '0', x_is_valid, adder_8_input_xi, adder_8_input_sum, small_undelayed_out_6);
	adder_8_output <= small_delayed_in_6;

    last_stage: entity work.IntMultiAdder_S_in1_m12_3_m12_out3_m12_wrapper_wrapper
        generic map(ADDER_LOCATION => "conv1_core3_KPU18_adder9", PIPELINE_STEPS => PIPELINE_STEPS) 
        PORT MAP(clk, '0', x_is_valid, adder_9_input_xi, adder_9_input_sum, yo );
	--last_stage : entity work.conv_stage_last GENERIC MAP(XI_WIDTH => XI_WIDTH, WI_WIDTH => WI_WIDTH)
	--PORT MAP(kpu_xi_9, adder_output_8, adder_output_9);


    -- yo <= adder_output_9;
	-- add_bias : entity work. PORT MAP(yo, adder_output_9, bias_extend);

	-- yi_array(0) <= (OTHERS => '0');--input of 1st stage's adder.

END structural;