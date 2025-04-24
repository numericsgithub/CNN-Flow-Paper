LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

-- amount_of_sums5    h_max4

entity conv27_FCU181 is
	generic
	(
		AMOUNT_OF_SUMS : natural := 5; -- Number of neurons + 1 (the dummy accumulator)
        PIPELINE_STEPS : natural := 3
	);
	port
	(
		clk  		  : in std_logic;
		reset		  : in std_logic;

        buffer_enable : in std_logic;
        en_overwrite  : in std_logic;
        undelayed_partial_sum : out std_logic_vector(23-1 downto 0); -- The current partial sum
        delayed_buffer_output : in  std_logic_vector(23-1 downto 0); -- The current partial sum
        xi_1 : in std_logic_vector(14-1 downto 0); --	sfix(5, -9)
        xi_2 : in std_logic_vector(15-1 downto 0); --	sfix(6, -9)
        xi_3 : in std_logic_vector(14-1 downto 0); --	sfix(5, -9)
        xi_4 : in std_logic_vector(15-1 downto 0); --	sfix(6, -9)

		yo : out std_logic_vector(23-1 downto 0) --	sfix(14, -9)
	);
end conv27_FCU181;

architecture structural of conv27_FCU181 is

    -- If we have more than one input, here are all signals we need for the subtotals of all adders
    signal xi_1_reshaped : std_logic_vector(23-1 downto 0); --	sfix(14, -9)
    signal xi_2_reshaped : std_logic_vector(23-1 downto 0); --	sfix(14, -9)
    signal xi_3_reshaped : std_logic_vector(23-1 downto 0); --	sfix(14, -9)
    signal xi_4_reshaped : std_logic_vector(23-1 downto 0); --	sfix(14, -9)
    -- All internal data signals
	signal partial_sum   				: std_logic_vector(23-1 downto 0); --	sfix(14, -9) The current partial sum
	signal buffer_output				: std_logic_vector(23-1 downto 0); --	sfix(14, -9) The current partial sum
	signal zeros_or_buffer_output		: std_logic_vector(23-1 downto 0); --	sfix(14, -9) Either the current partial sum, or zero if en_overwrite is set
	signal zeros						: std_logic_vector(23-1 downto 0); --	sfix(14, -9)

begin

    accumulation : entity work.FixMultiAdder_S_5_lsbOut_m9_uid1241_wrapper_wrapper generic map(ADDER_LOCATION => "conv27_FCU181", PIPELINE_STEPS => PIPELINE_STEPS-1, ADDITIONAL_PIPELINE_STEP_AT_OUTPUT => TRUE)
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

    mux	: entity work.mux_2to1 generic map(DATA_WIDTH => 23) port map(zeros, buffer_output, en_overwrite, zeros_or_buffer_output);

    undelayed_partial_sum <= partial_sum;
    buffer_output <= delayed_buffer_output;

	zeros <= (others => '0');
    yo <= partial_sum;
end structural;


