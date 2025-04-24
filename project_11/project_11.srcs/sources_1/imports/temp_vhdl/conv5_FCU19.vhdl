LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

-- amount_of_sums5    h_max4

entity conv5_FCU19 is
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
        xi_1 : in std_logic_vector(12-1 downto 0); --	sfix(4, -8)
        xi_2 : in std_logic_vector(13-1 downto 0); --	sfix(5, -8)
        xi_3 : in std_logic_vector(14-1 downto 0); --	sfix(6, -8)
        xi_4 : in std_logic_vector(13-1 downto 0); --	sfix(5, -8)
        xi_5 : in std_logic_vector(13-1 downto 0); --	sfix(5, -8)
        xi_6 : in std_logic_vector(12-1 downto 0); --	sfix(4, -8)
        xi_7 : in std_logic_vector(13-1 downto 0); --	sfix(5, -8)
        xi_8 : in std_logic_vector(12-1 downto 0); --	sfix(4, -8)
        xi_9 : in std_logic_vector(13-1 downto 0); --	sfix(5, -8)
        xi_10 : in std_logic_vector(12-1 downto 0); --	sfix(4, -8)
        xi_11 : in std_logic_vector(13-1 downto 0); --	sfix(5, -8)
        xi_12 : in std_logic_vector(11-1 downto 0); --	sfix(3, -8)
        xi_13 : in std_logic_vector(13-1 downto 0); --	sfix(5, -8)
        xi_14 : in std_logic_vector(12-1 downto 0); --	sfix(4, -8)
        xi_15 : in std_logic_vector(13-1 downto 0); --	sfix(5, -8)
        xi_16 : in std_logic_vector(14-1 downto 0); --	sfix(6, -8)

		yo : out std_logic_vector(19-1 downto 0) --	sfix(11, -8)
	);
end conv5_FCU19;

architecture structural of conv5_FCU19 is

    -- If we have more than one input, here are all signals we need for the subtotals of all adders
    signal xi_1_reshaped : std_logic_vector(19-1 downto 0); --	sfix(11, -8)
    signal xi_2_reshaped : std_logic_vector(19-1 downto 0); --	sfix(11, -8)
    signal xi_3_reshaped : std_logic_vector(19-1 downto 0); --	sfix(11, -8)
    signal xi_4_reshaped : std_logic_vector(19-1 downto 0); --	sfix(11, -8)
    signal xi_5_reshaped : std_logic_vector(19-1 downto 0); --	sfix(11, -8)
    signal xi_6_reshaped : std_logic_vector(19-1 downto 0); --	sfix(11, -8)
    signal xi_7_reshaped : std_logic_vector(19-1 downto 0); --	sfix(11, -8)
    signal xi_8_reshaped : std_logic_vector(19-1 downto 0); --	sfix(11, -8)
    signal xi_9_reshaped : std_logic_vector(19-1 downto 0); --	sfix(11, -8)
    signal xi_10_reshaped : std_logic_vector(19-1 downto 0); --	sfix(11, -8)
    signal xi_11_reshaped : std_logic_vector(19-1 downto 0); --	sfix(11, -8)
    signal xi_12_reshaped : std_logic_vector(19-1 downto 0); --	sfix(11, -8)
    signal xi_13_reshaped : std_logic_vector(19-1 downto 0); --	sfix(11, -8)
    signal xi_14_reshaped : std_logic_vector(19-1 downto 0); --	sfix(11, -8)
    signal xi_15_reshaped : std_logic_vector(19-1 downto 0); --	sfix(11, -8)
    signal xi_16_reshaped : std_logic_vector(19-1 downto 0); --	sfix(11, -8)
    -- All internal data signals
	signal partial_sum   				: std_logic_vector(19-1 downto 0); --	sfix(11, -8) The current partial sum
	signal buffer_output				: std_logic_vector(19-1 downto 0); --	sfix(11, -8) The current partial sum
	signal zeros_or_buffer_output		: std_logic_vector(19-1 downto 0); --	sfix(11, -8) Either the current partial sum, or zero if en_overwrite is set
	signal zeros						: std_logic_vector(19-1 downto 0); --	sfix(11, -8)

begin

    accumulation : entity work.FixMultiAdder_S_17_lsbOut_m8_uid68_wrapper_wrapper generic map(ADDER_LOCATION => "conv5_FCU19", PIPELINE_STEPS => PIPELINE_STEPS-1, ADDITIONAL_PIPELINE_STEP_AT_OUTPUT => TRUE)
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
            zeros_or_buffer_output,
            partial_sum
        );

    mux	: entity work.mux_2to1 generic map(DATA_WIDTH => 19) port map(zeros, buffer_output, en_overwrite, zeros_or_buffer_output);

    undelayed_partial_sum <= partial_sum;
    buffer_output <= delayed_buffer_output;

	zeros <= (others => '0');
    yo <= partial_sum;
end structural;


