LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

-- amount_of_sums5    h_max4

entity conv3_FCU11 is
	generic
	(
		AMOUNT_OF_SUMS : natural := 5; -- Number of neurons + 1 (the dummy accumulator)
        PIPELINE_STEPS : natural := 4
	);
	port
	(
		clk  		  : in std_logic;
		reset		  : in std_logic;

        buffer_enable : in std_logic;
        en_overwrite  : in std_logic;
        undelayed_partial_sum : out std_logic_vector(19-1 downto 0); -- The current partial sum
        delayed_buffer_output : in  std_logic_vector(19-1 downto 0); -- The current partial sum
        xi_1 : in std_logic_vector(8-1 downto 0); --	sfix(1, -7)
        xi_2 : in std_logic_vector(12-1 downto 0); --	sfix(5, -7)
        xi_3 : in std_logic_vector(12-1 downto 0); --	sfix(5, -7)
        xi_4 : in std_logic_vector(8-1 downto 0); --	sfix(1, -7)
        xi_5 : in std_logic_vector(10-1 downto 0); --	sfix(3, -7)
        xi_6 : in std_logic_vector(13-1 downto 0); --	sfix(6, -7)
        xi_7 : in std_logic_vector(11-1 downto 0); --	sfix(4, -7)
        xi_8 : in std_logic_vector(13-1 downto 0); --	sfix(6, -7)
        xi_9 : in std_logic_vector(8-1 downto 0); --	sfix(1, -7)
        xi_10 : in std_logic_vector(8-1 downto 0); --	sfix(1, -7)
        xi_11 : in std_logic_vector(8-1 downto 0); --	sfix(1, -7)
        xi_12 : in std_logic_vector(15-1 downto 0); --	sfix(8, -7)
        xi_13 : in std_logic_vector(13-1 downto 0); --	sfix(6, -7)
        xi_14 : in std_logic_vector(13-1 downto 0); --	sfix(6, -7)
        xi_15 : in std_logic_vector(8-1 downto 0); --	sfix(1, -7)
        xi_16 : in std_logic_vector(10-1 downto 0); --	sfix(3, -7)
        xi_17 : in std_logic_vector(11-1 downto 0); --	sfix(4, -7)
        xi_18 : in std_logic_vector(11-1 downto 0); --	sfix(4, -7)
        xi_19 : in std_logic_vector(13-1 downto 0); --	sfix(6, -7)
        xi_20 : in std_logic_vector(13-1 downto 0); --	sfix(6, -7)
        xi_21 : in std_logic_vector(8-1 downto 0); --	sfix(1, -7)
        xi_22 : in std_logic_vector(13-1 downto 0); --	sfix(6, -7)
        xi_23 : in std_logic_vector(8-1 downto 0); --	sfix(1, -7)
        xi_24 : in std_logic_vector(12-1 downto 0); --	sfix(5, -7)
        xi_25 : in std_logic_vector(10-1 downto 0); --	sfix(3, -7)
        xi_26 : in std_logic_vector(11-1 downto 0); --	sfix(4, -7)
        xi_27 : in std_logic_vector(13-1 downto 0); --	sfix(6, -7)
        xi_28 : in std_logic_vector(8-1 downto 0); --	sfix(1, -7)
        xi_29 : in std_logic_vector(13-1 downto 0); --	sfix(6, -7)
        xi_30 : in std_logic_vector(11-1 downto 0); --	sfix(4, -7)
        xi_31 : in std_logic_vector(8-1 downto 0); --	sfix(1, -7)
        xi_32 : in std_logic_vector(13-1 downto 0); --	sfix(6, -7)

		yo : out std_logic_vector(19-1 downto 0) --	sfix(12, -7)
	);
end conv3_FCU11;

architecture structural of conv3_FCU11 is

    -- If we have more than one input, here are all signals we need for the subtotals of all adders
    signal xi_1_reshaped : std_logic_vector(19-1 downto 0); --	sfix(12, -7)
    signal xi_2_reshaped : std_logic_vector(19-1 downto 0); --	sfix(12, -7)
    signal xi_3_reshaped : std_logic_vector(19-1 downto 0); --	sfix(12, -7)
    signal xi_4_reshaped : std_logic_vector(19-1 downto 0); --	sfix(12, -7)
    signal xi_5_reshaped : std_logic_vector(19-1 downto 0); --	sfix(12, -7)
    signal xi_6_reshaped : std_logic_vector(19-1 downto 0); --	sfix(12, -7)
    signal xi_7_reshaped : std_logic_vector(19-1 downto 0); --	sfix(12, -7)
    signal xi_8_reshaped : std_logic_vector(19-1 downto 0); --	sfix(12, -7)
    signal xi_9_reshaped : std_logic_vector(19-1 downto 0); --	sfix(12, -7)
    signal xi_10_reshaped : std_logic_vector(19-1 downto 0); --	sfix(12, -7)
    signal xi_11_reshaped : std_logic_vector(19-1 downto 0); --	sfix(12, -7)
    signal xi_12_reshaped : std_logic_vector(19-1 downto 0); --	sfix(12, -7)
    signal xi_13_reshaped : std_logic_vector(19-1 downto 0); --	sfix(12, -7)
    signal xi_14_reshaped : std_logic_vector(19-1 downto 0); --	sfix(12, -7)
    signal xi_15_reshaped : std_logic_vector(19-1 downto 0); --	sfix(12, -7)
    signal xi_16_reshaped : std_logic_vector(19-1 downto 0); --	sfix(12, -7)
    signal xi_17_reshaped : std_logic_vector(19-1 downto 0); --	sfix(12, -7)
    signal xi_18_reshaped : std_logic_vector(19-1 downto 0); --	sfix(12, -7)
    signal xi_19_reshaped : std_logic_vector(19-1 downto 0); --	sfix(12, -7)
    signal xi_20_reshaped : std_logic_vector(19-1 downto 0); --	sfix(12, -7)
    signal xi_21_reshaped : std_logic_vector(19-1 downto 0); --	sfix(12, -7)
    signal xi_22_reshaped : std_logic_vector(19-1 downto 0); --	sfix(12, -7)
    signal xi_23_reshaped : std_logic_vector(19-1 downto 0); --	sfix(12, -7)
    signal xi_24_reshaped : std_logic_vector(19-1 downto 0); --	sfix(12, -7)
    signal xi_25_reshaped : std_logic_vector(19-1 downto 0); --	sfix(12, -7)
    signal xi_26_reshaped : std_logic_vector(19-1 downto 0); --	sfix(12, -7)
    signal xi_27_reshaped : std_logic_vector(19-1 downto 0); --	sfix(12, -7)
    signal xi_28_reshaped : std_logic_vector(19-1 downto 0); --	sfix(12, -7)
    signal xi_29_reshaped : std_logic_vector(19-1 downto 0); --	sfix(12, -7)
    signal xi_30_reshaped : std_logic_vector(19-1 downto 0); --	sfix(12, -7)
    signal xi_31_reshaped : std_logic_vector(19-1 downto 0); --	sfix(12, -7)
    signal xi_32_reshaped : std_logic_vector(19-1 downto 0); --	sfix(12, -7)
    -- All internal data signals
	signal partial_sum   				: std_logic_vector(19-1 downto 0); --	sfix(12, -7) The current partial sum
	signal buffer_output				: std_logic_vector(19-1 downto 0); --	sfix(12, -7) The current partial sum
	signal zeros_or_buffer_output		: std_logic_vector(19-1 downto 0); --	sfix(12, -7) Either the current partial sum, or zero if en_overwrite is set
	signal zeros						: std_logic_vector(19-1 downto 0); --	sfix(12, -7)

begin

    accumulation : entity work.FixMultiAdder_S_33_lsbOut_m7_uid40_wrapper_wrapper generic map(ADDER_LOCATION => "conv3_FCU11", PIPELINE_STEPS => PIPELINE_STEPS-1, ADDITIONAL_PIPELINE_STEP_AT_OUTPUT => TRUE)
        port map
        (
            clk, '0', buffer_enable,
            xi_1,
            xi_2,
            xi_3,
            xi_4,
            xi_5,
            xi_6,
            xi_7,
            xi_8,
            xi_9,
            xi_10,
            xi_11,
            xi_12,
            xi_13,
            xi_14,
            xi_15,
            xi_16,
            xi_17,
            xi_18,
            xi_19,
            xi_20,
            xi_21,
            xi_22,
            xi_23,
            xi_24,
            xi_25,
            xi_26,
            xi_27,
            xi_28,
            xi_29,
            xi_30,
            xi_31,
            xi_32,
            zeros_or_buffer_output,
            partial_sum
        );

    mux	: entity work.mux_2to1 generic map(DATA_WIDTH => 19) port map(zeros, buffer_output, en_overwrite, zeros_or_buffer_output);

    undelayed_partial_sum <= partial_sum;
    buffer_output <= delayed_buffer_output;

	zeros <= (others => '0');
    yo <= partial_sum;
end structural;


