LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

-- amount_of_sums9    h_max8

entity conv25_FCU80 is
	generic
	(
		AMOUNT_OF_SUMS : natural := 9; -- Number of neurons + 1 (the dummy accumulator)
        PIPELINE_STEPS : natural := 3
	);
	port
	(
		clk  		  : in std_logic;
		reset		  : in std_logic;

        buffer_enable : in std_logic;
        en_overwrite  : in std_logic;
        undelayed_partial_sum : out std_logic_vector(20-1 downto 0); -- The current partial sum
        delayed_buffer_output : in  std_logic_vector(20-1 downto 0); -- The current partial sum
        xi_1 : in std_logic_vector(15-1 downto 0); --	sfix(3, -12)
        xi_2 : in std_logic_vector(14-1 downto 0); --	sfix(2, -12)
        xi_3 : in std_logic_vector(14-1 downto 0); --	sfix(2, -12)
        xi_4 : in std_logic_vector(15-1 downto 0); --	sfix(3, -12)

		yo : out std_logic_vector(20-1 downto 0) --	sfix(8, -12)
	);
end conv25_FCU80;

architecture structural of conv25_FCU80 is

    -- If we have more than one input, here are all signals we need for the subtotals of all adders
    signal xi_1_reshaped : std_logic_vector(20-1 downto 0); --	sfix(8, -12)
    signal xi_2_reshaped : std_logic_vector(20-1 downto 0); --	sfix(8, -12)
    signal xi_3_reshaped : std_logic_vector(20-1 downto 0); --	sfix(8, -12)
    signal xi_4_reshaped : std_logic_vector(20-1 downto 0); --	sfix(8, -12)
    -- All internal data signals
	signal partial_sum   				: std_logic_vector(20-1 downto 0); --	sfix(8, -12) The current partial sum
	signal buffer_output				: std_logic_vector(20-1 downto 0); --	sfix(8, -12) The current partial sum
	signal zeros_or_buffer_output		: std_logic_vector(20-1 downto 0); --	sfix(8, -12) Either the current partial sum, or zero if en_overwrite is set
	signal zeros						: std_logic_vector(20-1 downto 0); --	sfix(8, -12)

begin

    accumulation : entity work.FixMultiAdder_S_5_lsbOut_m12_uid1225_wrapper_wrapper generic map(ADDER_LOCATION => "conv25_FCU80", PIPELINE_STEPS => PIPELINE_STEPS-1, ADDITIONAL_PIPELINE_STEP_AT_OUTPUT => TRUE)
        port map
        (
            clk, '0', buffer_enable,
            xi_1,
            xi_2,
            xi_3,
            xi_4,
            zeros_or_buffer_output,
            partial_sum
        );

    mux	: entity work.mux_2to1 generic map(DATA_WIDTH => 20) port map(zeros, buffer_output, en_overwrite, zeros_or_buffer_output);

    undelayed_partial_sum <= partial_sum;
    buffer_output <= delayed_buffer_output;

	zeros <= (others => '0');
    yo <= partial_sum;
end structural;


