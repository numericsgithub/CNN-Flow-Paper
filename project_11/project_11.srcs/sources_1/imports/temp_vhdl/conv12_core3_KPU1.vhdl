LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;
use work.conv12_settings.all;

ENTITY conv12_core3_KPU1 IS
    GENERIC
    (
        PIPELINE_STEPS : natural := 0
    );
	PORT (
		clk    : in std_logic;
		rst    : in std_logic;
		x_is_valid : in std_logic;
        kpu_xi_1 : in std_logic_vector(15-1 downto 0); --	sfix(5, -10)
        kpu_xi_2 : in std_logic_vector(15-1 downto 0); --	sfix(5, -10)
        kpu_xi_3 : in std_logic_vector(14-1 downto 0); --	sfix(4, -10)
        kpu_xi_4 : in std_logic_vector(15-1 downto 0); --	sfix(5, -10)
        kpu_xi_5 : in std_logic_vector(15-1 downto 0); --	sfix(5, -10)
        kpu_xi_6 : in std_logic_vector(14-1 downto 0); --	sfix(4, -10)
        kpu_xi_7 : in std_logic_vector(14-1 downto 0); --	sfix(4, -10)
        kpu_xi_8 : in std_logic_vector(14-1 downto 0); --	sfix(4, -10)
        kpu_xi_9 : in std_logic_vector(14-1 downto 0); --	sfix(4, -10)

    
        big_undelayed_out_1 : out std_logic_vector(18-1 downto 0); --	sfix(8, -10)
        big_delayed_in_1 : in std_logic_vector(18-1 downto 0); --	sfix(8, -10)
        big_undelayed_out_2 : out std_logic_vector(18-1 downto 0); --	sfix(8, -10)
        big_delayed_in_2 : in std_logic_vector(18-1 downto 0); --	sfix(8, -10)

    
        small_undelayed_out_1 : out std_logic_vector(15-1 downto 0); --	sfix(5, -10)
        small_delayed_in_1 : in std_logic_vector(15-1 downto 0); --	sfix(5, -10)
        small_undelayed_out_2 : out std_logic_vector(17-1 downto 0); --	sfix(7, -10)
        small_delayed_in_2 : in std_logic_vector(17-1 downto 0); --	sfix(7, -10)
        small_undelayed_out_3 : out std_logic_vector(18-1 downto 0); --	sfix(8, -10)
        small_delayed_in_3 : in std_logic_vector(18-1 downto 0); --	sfix(8, -10)
        small_undelayed_out_4 : out std_logic_vector(18-1 downto 0); --	sfix(8, -10)
        small_delayed_in_4 : in std_logic_vector(18-1 downto 0); --	sfix(8, -10)
        small_undelayed_out_5 : out std_logic_vector(18-1 downto 0); --	sfix(8, -10)
        small_delayed_in_5 : in std_logic_vector(18-1 downto 0); --	sfix(8, -10)
        small_undelayed_out_6 : out std_logic_vector(18-1 downto 0); --	sfix(8, -10)
        small_delayed_in_6 : in std_logic_vector(18-1 downto 0); --	sfix(8, -10)

		yo : OUT std_logic_vector(18-1 downto 0) --	sfix(8, -10)
	);
END conv12_core3_KPU1;

ARCHITECTURE structural OF conv12_core3_KPU1 IS

    -- All all_additional_output_int_bits are:         [0, 2, 3, 3, 2, 2, 2, 2, 2]
    -- All all_additional_output_int_bits_weights are: [[18.0, -17.0, 11.0, -12.0, -21.0, 31.0, -24.0, 14.0, 27.0, 10.0, 20.0, -15.0, 23.0, 18.0, 11.0, -19.0, 66.0, 28.0, 19.0, -21.0, -18.0, -18.0, -17.0, -55.0, 13.0, 13.0, 14.0, -16.0, 11.0, -11.0, -6.0, 26.0, -15.0, -17.0, -14.0, -48.0, 45.0, 16.0, -24.0, -24.0, 20.0, -21.0, 30.0, 38.0, 13.0, -19.0, -14.0, 24.0, 8.0, 25.0, -10.0, -41.0, -21.0, -40.0, -20.0, -25.0, 18.0, 13.0, 2.0, -19.0, 15.0, -14.0, 30.0, -21.0], [40.0, -24.0, 19.0, -14.0, -30.0, 39.0, -26.0, 18.0, 32.0, 25.0, 28.0, -20.0, 29.0, 25.0, 15.0, -18.0, 76.0, 48.0, 25.0, -27.0, -26.0, -26.0, -24.0, -52.0, 19.0, 27.0, 16.0, -20.0, 14.0, -15.0, -14.0, 36.0, -21.0, -23.0, -22.0, -24.0, -9.0, 20.0, -26.0, -13.0, 27.0, -27.0, 36.0, 46.0, 16.0, -27.0, -19.0, 34.0, 12.0, 26.0, -15.0, 20.0, -31.0, -47.0, -26.0, -31.0, 25.0, 16.0, -20.0, -26.0, 18.0, -20.0, 34.0, -26.0], [33.0, -10.0, 13.0, -6.0, -14.0, 19.0, -14.0, 8.0, 13.0, 18.0, 14.0, -9.0, 14.0, 10.0, 8.0, -7.0, 46.0, 24.0, 12.0, -20.0, -15.0, -9.0, -14.0, -12.0, 10.0, 20.0, 6.0, -11.0, 6.0, -9.0, -7.0, 17.0, -10.0, -11.0, -12.0, 12.0, -19.0, 9.0, -14.0, 2.0, 14.0, -12.0, 17.0, 23.0, 8.0, -12.0, -9.0, 18.0, 8.0, 9.0, -7.0, 31.0, -18.0, -26.0, -14.0, -15.0, 14.0, 9.0, -19.0, -12.0, 9.0, -10.0, 15.0, -14.0], [-4.0, -28.0, 18.0, -16.0, -26.0, 41.0, -28.0, 21.0, 33.0, 25.0, 27.0, -19.0, 30.0, 27.0, 16.0, -22.0, 82.0, 20.0, 25.0, -27.0, -28.0, -27.0, -22.0, -46.0, 19.0, 27.0, 15.0, -22.0, 16.0, -15.0, -14.0, 34.0, -23.0, -22.0, -18.0, -51.0, 67.0, 20.0, -27.0, -25.0, 27.0, -32.0, 38.0, 45.0, 16.0, -26.0, -24.0, 31.0, 14.0, 31.0, -16.0, -74.0, -29.0, -54.0, -26.0, -31.0, 26.0, 25.0, 7.0, -26.0, 17.0, -23.0, 33.0, -31.0], [31.0, -29.0, 27.0, -21.0, -36.0, 53.0, -29.0, 28.0, 41.0, 38.0, 35.0, -27.0, 36.0, 33.0, 21.0, -30.0, 88.0, 47.0, 32.0, -31.0, -36.0, -39.0, -31.0, -84.0, 30.0, 38.0, 22.0, -25.0, 20.0, -20.0, -26.0, 46.0, -29.0, -29.0, -23.0, 21.0, -21.0, 25.0, -31.0, -8.0, 35.0, -44.0, 45.0, 54.0, 19.0, -29.0, -29.0, 46.0, 21.0, 44.0, -23.0, 22.0, -40.0, -62.0, -32.0, -38.0, 34.0, 32.0, -17.0, -34.0, 23.0, -32.0, 48.0, -42.0], [32.0, -12.0, 16.0, -9.0, -19.0, 25.0, -18.0, 14.0, 17.0, 20.0, 18.0, -12.0, 17.0, 13.0, 10.0, -16.0, 42.0, 37.0, 15.0, -25.0, -23.0, -14.0, -18.0, -50.0, 12.0, 20.0, 10.0, -14.0, 9.0, -10.0, -12.0, 22.0, -12.0, -14.0, -14.0, 48.0, -51.0, 11.0, -19.0, 7.0, 19.0, -19.0, 22.0, 28.0, 9.0, -19.0, -17.0, 24.0, 12.0, 25.0, -12.0, 46.0, -24.0, -39.0, -19.0, -22.0, 19.0, 13.0, -17.0, -18.0, 11.0, -15.0, 30.0, -21.0], [-20.0, -16.0, 10.0, -7.0, -12.0, 22.0, -16.0, 10.0, 16.0, 20.0, 13.0, -8.0, 15.0, 14.0, 9.0, -12.0, 47.0, 0.0, 12.0, -22.0, -15.0, -12.0, -12.0, -7.0, 10.0, 19.0, 6.0, -12.0, 8.0, -7.0, -9.0, 19.0, -13.0, -11.0, -10.0, -25.0, 44.0, 11.0, -14.0, -9.0, 14.0, -15.0, 21.0, 24.0, 8.0, -13.0, -21.0, 15.0, 8.0, 14.0, -8.0, -41.0, -16.0, -32.0, -15.0, -16.0, 15.0, 15.0, 0.0, -15.0, 9.0, -11.0, 10.0, -15.0], [5.0, -14.0, 12.0, -8.0, -17.0, 28.0, -19.0, 15.0, 19.0, 20.0, 18.0, -12.0, 18.0, 16.0, 11.0, -21.0, 58.0, 12.0, 17.0, -27.0, -22.0, -17.0, -17.0, -44.0, 13.0, 21.0, 12.0, -15.0, 11.0, -6.0, -14.0, 24.0, -16.0, -15.0, -13.0, 35.0, -19.0, 12.0, -18.0, 1.0, 18.0, -21.0, 26.0, 29.0, 11.0, -19.0, -24.0, 23.0, 12.0, 30.0, -12.0, 13.0, -24.0, -38.0, -19.0, -21.0, 21.0, 18.0, -7.0, -19.0, 11.0, -16.0, 25.0, -24.0], [16.0, -7.0, 7.0, -4.0, -9.0, 14.0, -7.0, 9.0, 7.0, 5.0, 11.0, -6.0, 9.0, 6.0, 6.0, -12.0, 11.0, 16.0, 9.0, -18.0, -13.0, -4.0, -9.0, -31.0, 8.0, 7.0, 7.0, -7.0, 5.0, -3.0, -6.0, 12.0, -6.0, -7.0, -8.0, 26.0, -37.0, 6.0, -11.0, 4.0, 11.0, -13.0, 12.0, 15.0, 5.0, -8.0, -11.0, 12.0, 7.0, 19.0, -7.0, 23.0, -13.0, -22.0, -9.0, -9.0, 13.0, 6.0, -2.0, -10.0, 6.0, -8.0, 19.0, -9.0]]
    signal adder_1_input_xi  : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal adder_2_input_xi  : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal adder_3_input_xi  : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal adder_4_input_xi  : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal adder_5_input_xi  : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal adder_6_input_xi  : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal adder_7_input_xi  : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal adder_8_input_xi  : std_logic_vector(14-1 downto 0); --	sfix(4, -10)
    signal adder_9_input_xi  : std_logic_vector(14-1 downto 0); --	sfix(4, -10)

    -- To keep things simple, we add an bogus adder at the start. But there is none. This is just a small simplification.
    -- Unreshaped Adder would be: sfix(5, -10) + nothing = sfix(5, -10)
    -- Reshaped Adder would be:   sfix(5, -10) + sfix(5, -10) = sfix(5, -10)
    -- 
    signal adder_1_output    : std_logic_vector(15-1 downto 0); --	sfix(5, -10)
    signal adder_2_input_sum : std_logic_vector(15-1 downto 0); --	sfix(5, -10)



    -- Unreshaped Adder would be: sfix(5, -10) + sfix(5, -10) = sfix(7, -10)
    -- Reshaped Adder would be:   sfix(5, -10) + sfix(5, -10) = sfix(7, -10)
    -- 
    signal adder_2_output    : std_logic_vector(17-1 downto 0); --	sfix(7, -10)
    signal adder_3_input_sum : std_logic_vector(17-1 downto 0); --	sfix(7, -10)



    -- Unreshaped Adder would be: sfix(4, -10) + sfix(7, -10) = sfix(8, -10)
    -- Reshaped Adder would be:   sfix(7, -10) + sfix(7, -10) = sfix(8, -10)
    -- 
    signal adder_3_output    : std_logic_vector(18-1 downto 0); --	sfix(8, -10)
    signal adder_4_input_sum : std_logic_vector(18-1 downto 0); --	sfix(8, -10)



    -- Unreshaped Adder would be: sfix(5, -10) + sfix(8, -10) = sfix(8, -10)
    -- Reshaped Adder would be:   sfix(8, -10) + sfix(8, -10) = sfix(8, -10)
    -- 
    signal adder_4_output    : std_logic_vector(18-1 downto 0); --	sfix(8, -10)
    signal adder_5_input_sum : std_logic_vector(18-1 downto 0); --	sfix(8, -10)



    -- Unreshaped Adder would be: sfix(5, -10) + sfix(8, -10) = sfix(8, -10)
    -- Reshaped Adder would be:   sfix(8, -10) + sfix(8, -10) = sfix(8, -10)
    -- 
    signal adder_5_output    : std_logic_vector(18-1 downto 0); --	sfix(8, -10)
    signal adder_6_input_sum : std_logic_vector(18-1 downto 0); --	sfix(8, -10)



    -- Unreshaped Adder would be: sfix(4, -10) + sfix(8, -10) = sfix(8, -10)
    -- Reshaped Adder would be:   sfix(8, -10) + sfix(8, -10) = sfix(8, -10)
    -- 
    signal adder_6_output    : std_logic_vector(18-1 downto 0); --	sfix(8, -10)
    signal adder_7_input_sum : std_logic_vector(18-1 downto 0); --	sfix(8, -10)



    -- Unreshaped Adder would be: sfix(4, -10) + sfix(8, -10) = sfix(8, -10)
    -- Reshaped Adder would be:   sfix(8, -10) + sfix(8, -10) = sfix(8, -10)
    -- 
    signal adder_7_output    : std_logic_vector(18-1 downto 0); --	sfix(8, -10)
    signal adder_8_input_sum : std_logic_vector(18-1 downto 0); --	sfix(8, -10)



    -- Unreshaped Adder would be: sfix(4, -10) + sfix(8, -10) = sfix(8, -10)
    -- Reshaped Adder would be:   sfix(8, -10) + sfix(8, -10) = sfix(8, -10)
    -- 
    signal adder_8_output    : std_logic_vector(18-1 downto 0); --	sfix(8, -10)
    signal adder_9_input_sum : std_logic_vector(18-1 downto 0); --	sfix(8, -10)



    -- Unreshaped Adder would be: sfix(4, -10) + sfix(8, -10) = sfix(8, -10)
    -- Reshaped Adder would be:   sfix(8, -10) + sfix(8, -10) = sfix(8, -10)
    -- 
    signal adder_9_output    : std_logic_vector(18-1 downto 0); --	sfix(8, -10)
    signal adder_10_input_sum : std_logic_vector(18-1 downto 0); --	sfix(8, -10)




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
	adder_2: entity work.IntMultiAdder_S_in5_m10_5_m10_out7_m10_wrapper_wrapper 
        generic map(ADDER_LOCATION => "conv12_core3_KPU1_adder2", PIPELINE_STEPS => PIPELINE_STEPS) 
        PORT MAP(clk, '0', x_is_valid, adder_2_input_xi, adder_2_input_sum, small_undelayed_out_2);
	adder_2_output <= small_delayed_in_2;

    line_adder_3: entity work.IntMultiAdder_S_in4_m10_7_m10_out8_m10_wrapper_wrapper 
        generic map(ADDER_LOCATION => "conv12_core3_KPU1_adder3", PIPELINE_STEPS => PIPELINE_STEPS) 
        PORT MAP(clk, '0', x_is_valid, adder_3_input_xi, adder_3_input_sum, big_undelayed_out_1);
	adder_3_output <= big_delayed_in_1;
	adder_4: entity work.IntMultiAdder_S_in5_m10_8_m10_out8_m10_wrapper_wrapper 
        generic map(ADDER_LOCATION => "conv12_core3_KPU1_adder4", PIPELINE_STEPS => PIPELINE_STEPS) 
        PORT MAP(clk, '0', x_is_valid, adder_4_input_xi, adder_4_input_sum, small_undelayed_out_3);
	adder_4_output <= small_delayed_in_3;
	adder_5: entity work.IntMultiAdder_S_in5_m10_8_m10_out8_m10_wrapper_wrapper 
        generic map(ADDER_LOCATION => "conv12_core3_KPU1_adder5", PIPELINE_STEPS => PIPELINE_STEPS) 
        PORT MAP(clk, '0', x_is_valid, adder_5_input_xi, adder_5_input_sum, small_undelayed_out_4);
	adder_5_output <= small_delayed_in_4;

    line_adder_6: entity work.IntMultiAdder_S_in4_m10_8_m10_out8_m10_wrapper_wrapper 
        generic map(ADDER_LOCATION => "conv12_core3_KPU1_adder6", PIPELINE_STEPS => PIPELINE_STEPS) 
        PORT MAP(clk, '0', x_is_valid, adder_6_input_xi, adder_6_input_sum, big_undelayed_out_2);
	adder_6_output <= big_delayed_in_2;
	adder_7: entity work.IntMultiAdder_S_in4_m10_8_m10_out8_m10_wrapper_wrapper 
        generic map(ADDER_LOCATION => "conv12_core3_KPU1_adder7", PIPELINE_STEPS => PIPELINE_STEPS) 
        PORT MAP(clk, '0', x_is_valid, adder_7_input_xi, adder_7_input_sum, small_undelayed_out_5);
	adder_7_output <= small_delayed_in_5;
	adder_8: entity work.IntMultiAdder_S_in4_m10_8_m10_out8_m10_wrapper_wrapper 
        generic map(ADDER_LOCATION => "conv12_core3_KPU1_adder8", PIPELINE_STEPS => PIPELINE_STEPS) 
        PORT MAP(clk, '0', x_is_valid, adder_8_input_xi, adder_8_input_sum, small_undelayed_out_6);
	adder_8_output <= small_delayed_in_6;

    last_stage: entity work.IntMultiAdder_S_in4_m10_8_m10_out8_m10_wrapper_wrapper
        generic map(ADDER_LOCATION => "conv12_core3_KPU1_adder9", PIPELINE_STEPS => PIPELINE_STEPS) 
        PORT MAP(clk, '0', x_is_valid, adder_9_input_xi, adder_9_input_sum, yo );
	--last_stage : entity work.conv_stage_last GENERIC MAP(XI_WIDTH => XI_WIDTH, WI_WIDTH => WI_WIDTH)
	--PORT MAP(kpu_xi_9, adder_output_8, adder_output_9);


    -- yo <= adder_output_9;
	-- add_bias : entity work. PORT MAP(yo, adder_output_9, bias_extend);

	-- yi_array(0) <= (OTHERS => '0');--input of 1st stage's adder.

END structural;