LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;
use work.conv12_settings.all;

ENTITY conv12_core2_KPU1 IS
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
END conv12_core2_KPU1;

ARCHITECTURE structural OF conv12_core2_KPU1 IS

    -- All all_additional_output_int_bits are:         [0, 2, 3, 3, 3, 2, 2, 2, 2]
    -- All all_additional_output_int_bits_weights are: [[-3.0, -3.0, -20.0, -35.0, -19.0, -46.0, 31.0, 19.0, -12.0, -15.0, 22.0, 13.0, -19.0, -16.0, 17.0, 49.0, 42.0, -52.0, 27.0, -39.0, -26.0, -21.0, -24.0, 29.0, 13.0, 27.0, 37.0, -78.0, 20.0, 28.0, -16.0, 20.0, -34.0, 12.0, 15.0, -16.0, -12.0, 30.0, -15.0, 18.0, 20.0, -28.0, 22.0, 13.0, 34.0, -16.0, 29.0, 39.0, 18.0, -13.0, 25.0, -13.0, 17.0, -16.0, 20.0, 36.0, -12.0, 17.0, 28.0, -16.0, 18.0, -19.0, -82.0, 19.0], [-17.0, -22.0, -28.0, -43.0, -27.0, -42.0, 34.0, 25.0, -16.0, -22.0, 28.0, 23.0, -26.0, -17.0, 19.0, 59.0, 14.0, -65.0, 29.0, -70.0, -35.0, -26.0, -30.0, 35.0, 19.0, 37.0, 38.0, 57.0, 30.0, 36.0, -23.0, 27.0, -43.0, 16.0, 16.0, -23.0, -42.0, 38.0, -19.0, 22.0, 27.0, -33.0, 28.0, 17.0, -22.0, -18.0, 34.0, 17.0, 25.0, -22.0, 32.0, -20.0, 24.0, -36.0, 25.0, 44.0, -20.0, 23.0, 32.0, -20.0, 22.0, -25.0, -44.0, 26.0], [-16.0, -19.0, -13.0, -17.0, -12.0, -12.0, 15.0, 11.0, -7.0, -9.0, 12.0, 15.0, -14.0, -7.0, 9.0, 35.0, -30.0, -20.0, 10.0, -53.0, -20.0, -9.0, -19.0, 16.0, 9.0, 19.0, 18.0, 7.0, 14.0, 15.0, -11.0, 12.0, -18.0, 6.0, 7.0, -10.0, -5.0, 17.0, -8.0, 9.0, 12.0, -15.0, 13.0, 8.0, -32.0, -8.0, 21.0, -7.0, 13.0, -15.0, 11.0, -10.0, 11.0, -30.0, 10.0, 22.0, -20.0, 12.0, 7.0, -13.0, 11.0, -12.0, 19.0, 13.0], [-18.0, -21.0, -28.0, -46.0, -29.0, -54.0, 29.0, 26.0, -17.0, -24.0, 31.0, 20.0, -30.0, -15.0, 18.0, 60.0, 50.0, -51.0, 29.0, -81.0, -34.0, -26.0, -29.0, 35.0, 19.0, 37.0, 46.0, -105.0, 29.0, 37.0, -18.0, 29.0, -36.0, 16.0, 20.0, -24.0, -38.0, 39.0, -20.0, 23.0, 20.0, -34.0, 28.0, 14.0, 51.0, -21.0, 35.0, 38.0, 25.0, -22.0, -7.0, -18.0, 24.0, -18.0, 23.0, 9.0, -25.0, 22.0, 34.0, -22.0, 22.0, -23.0, -51.0, 26.0], [-27.0, -57.0, -36.0, -58.0, -39.0, -66.0, 43.0, 32.0, -22.0, -31.0, 40.0, 28.0, -44.0, -16.0, 25.0, 75.0, -11.0, -73.0, 42.0, -88.0, -40.0, -29.0, -36.0, 44.0, 27.0, 53.0, 26.0, 83.0, 38.0, 49.0, -22.0, 39.0, -43.0, 26.0, 19.0, -31.0, -30.0, 51.0, -25.0, 27.0, 32.0, -42.0, 37.0, 21.0, -2.0, -23.0, 39.0, -12.0, 34.0, -31.0, -14.0, -24.0, 31.0, -39.0, 29.0, 6.0, -37.0, 30.0, 46.0, -28.0, 29.0, -31.0, 27.0, 33.0], [-15.0, -33.0, -21.0, -29.0, -16.0, -33.0, 26.0, 14.0, -9.0, -20.0, 18.0, 18.0, -23.0, -7.0, 13.0, 45.0, -25.0, -27.0, 24.0, -36.0, -27.0, -16.0, -24.0, 22.0, 13.0, 28.0, -24.0, 22.0, 20.0, 23.0, -9.0, 16.0, -11.0, 13.0, 5.0, -14.0, 21.0, 23.0, -10.0, 12.0, 19.0, -17.0, 18.0, 7.0, -55.0, -9.0, 22.0, -42.0, 17.0, -19.0, -2.0, -13.0, 15.0, -31.0, 11.0, -4.0, -27.0, 15.0, 24.0, -17.0, 15.0, -17.0, 58.0, 16.0], [-15.0, -14.0, -13.0, -23.0, -14.0, -18.0, 8.0, 13.0, -9.0, -14.0, 18.0, 14.0, -17.0, -8.0, 8.0, 40.0, 31.0, -18.0, 12.0, -39.0, -17.0, -12.0, -16.0, 22.0, 9.0, 17.0, 16.0, -64.0, 15.0, 18.0, -8.0, 17.0, -10.0, 8.0, 10.0, -13.0, -12.0, 21.0, -7.0, 10.0, 4.0, -16.0, 13.0, 3.0, 30.0, -9.0, 18.0, 17.0, 12.0, -12.0, -16.0, -11.0, 11.0, -5.0, 8.0, -46.0, -21.0, 11.0, 13.0, -16.0, 12.0, -14.0, 17.0, 14.0], [-13.0, -31.0, -21.0, -32.0, -16.0, -34.0, 23.0, 16.0, -10.0, -22.0, 23.0, 14.0, -25.0, -7.0, 13.0, 50.0, -19.0, -25.0, 25.0, -26.0, -25.0, -15.0, -24.0, 24.0, 13.0, 27.0, 3.0, 37.0, 19.0, 26.0, -8.0, 19.0, -10.0, 15.0, 7.0, -17.0, 15.0, 26.0, -8.0, 12.0, 13.0, -18.0, 17.0, 6.0, 13.0, -10.0, 21.0, -26.0, 17.0, -17.0, -27.0, -14.0, 14.0, -12.0, 9.0, -52.0, -28.0, 16.0, 27.0, -18.0, 15.0, -19.0, 55.0, 17.0], [-3.0, -12.0, -10.0, -12.0, -7.0, -30.0, 17.0, 6.0, -5.0, -13.0, 11.0, 7.0, -11.0, -3.0, 9.0, 26.0, -8.0, -11.0, 17.0, -1.0, -13.0, -7.0, -14.0, 11.0, 7.0, 13.0, -20.0, 8.0, 9.0, 13.0, -3.0, 7.0, -1.0, 8.0, 4.0, -6.0, 26.0, 13.0, -1.0, 6.0, 10.0, -7.0, 10.0, 3.0, -38.0, -3.0, 11.0, -23.0, 8.0, -10.0, -8.0, -8.0, 6.0, -9.0, 5.0, -29.0, -13.0, 8.0, 19.0, -11.0, 8.0, -9.0, 31.0, 8.0]]
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
        generic map(ADDER_LOCATION => "conv12_core2_KPU1_adder2", PIPELINE_STEPS => PIPELINE_STEPS) 
        PORT MAP(clk, '0', x_is_valid, adder_2_input_xi, adder_2_input_sum, small_undelayed_out_2);
	adder_2_output <= small_delayed_in_2;

    line_adder_3: entity work.IntMultiAdder_S_in4_m10_7_m10_out8_m10_wrapper_wrapper 
        generic map(ADDER_LOCATION => "conv12_core2_KPU1_adder3", PIPELINE_STEPS => PIPELINE_STEPS) 
        PORT MAP(clk, '0', x_is_valid, adder_3_input_xi, adder_3_input_sum, big_undelayed_out_1);
	adder_3_output <= big_delayed_in_1;
	adder_4: entity work.IntMultiAdder_S_in5_m10_8_m10_out8_m10_wrapper_wrapper 
        generic map(ADDER_LOCATION => "conv12_core2_KPU1_adder4", PIPELINE_STEPS => PIPELINE_STEPS) 
        PORT MAP(clk, '0', x_is_valid, adder_4_input_xi, adder_4_input_sum, small_undelayed_out_3);
	adder_4_output <= small_delayed_in_3;
	adder_5: entity work.IntMultiAdder_S_in5_m10_8_m10_out8_m10_wrapper_wrapper 
        generic map(ADDER_LOCATION => "conv12_core2_KPU1_adder5", PIPELINE_STEPS => PIPELINE_STEPS) 
        PORT MAP(clk, '0', x_is_valid, adder_5_input_xi, adder_5_input_sum, small_undelayed_out_4);
	adder_5_output <= small_delayed_in_4;

    line_adder_6: entity work.IntMultiAdder_S_in4_m10_8_m10_out8_m10_wrapper_wrapper 
        generic map(ADDER_LOCATION => "conv12_core2_KPU1_adder6", PIPELINE_STEPS => PIPELINE_STEPS) 
        PORT MAP(clk, '0', x_is_valid, adder_6_input_xi, adder_6_input_sum, big_undelayed_out_2);
	adder_6_output <= big_delayed_in_2;
	adder_7: entity work.IntMultiAdder_S_in4_m10_8_m10_out8_m10_wrapper_wrapper 
        generic map(ADDER_LOCATION => "conv12_core2_KPU1_adder7", PIPELINE_STEPS => PIPELINE_STEPS) 
        PORT MAP(clk, '0', x_is_valid, adder_7_input_xi, adder_7_input_sum, small_undelayed_out_5);
	adder_7_output <= small_delayed_in_5;
	adder_8: entity work.IntMultiAdder_S_in4_m10_8_m10_out8_m10_wrapper_wrapper 
        generic map(ADDER_LOCATION => "conv12_core2_KPU1_adder8", PIPELINE_STEPS => PIPELINE_STEPS) 
        PORT MAP(clk, '0', x_is_valid, adder_8_input_xi, adder_8_input_sum, small_undelayed_out_6);
	adder_8_output <= small_delayed_in_6;

    last_stage: entity work.IntMultiAdder_S_in4_m10_8_m10_out8_m10_wrapper_wrapper
        generic map(ADDER_LOCATION => "conv12_core2_KPU1_adder9", PIPELINE_STEPS => PIPELINE_STEPS) 
        PORT MAP(clk, '0', x_is_valid, adder_9_input_xi, adder_9_input_sum, yo );
	--last_stage : entity work.conv_stage_last GENERIC MAP(XI_WIDTH => XI_WIDTH, WI_WIDTH => WI_WIDTH)
	--PORT MAP(kpu_xi_9, adder_output_8, adder_output_9);


    -- yo <= adder_output_9;
	-- add_bias : entity work. PORT MAP(yo, adder_output_9, bias_extend);

	-- yi_array(0) <= (OTHERS => '0');--input of 1st stage's adder.

END structural;