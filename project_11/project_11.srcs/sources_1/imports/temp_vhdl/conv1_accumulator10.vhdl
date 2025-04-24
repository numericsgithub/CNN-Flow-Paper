LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;
use work.conv1_settings.all;

entity conv1_accumulator10 is
    generic
    (
        PIPELINE_STEPS             : natural := 0
    );
	port
	(
		clk     : in std_logic;
		reset   : in std_logic;

        interleave_counter : in SEL_INTERLEAVINGS_TYPE;
        x_is_valid : in std_logic;
        xi_1  		: in std_logic_vector(13-1 downto 0); --	sfix(1, -12)
        xi_2  		: in std_logic_vector(13-1 downto 0); --	sfix(1, -12)
        xi_3  		: in std_logic_vector(13-1 downto 0); --	sfix(1, -12)

		yo   		: out std_logic_vector(15-1 downto 0) --	sfix(3, -12)
	);
end conv1_accumulator10;

architecture structural of conv1_accumulator10 is

    -- All internal data signals
	signal partial_sum   				: std_logic_vector(15-1 downto 0); -- The current partial sum
	signal buffer_output				: std_logic_vector(15-1 downto 0); -- The current partial sum
	signal zeros_or_buffer_output		: std_logic_vector(15-1 downto 0); -- Either the current partial sum, or zero if en_overwrite is set
	signal zeros						: std_logic_vector(15-1 downto 0);

	-- All control signals for the internal procedure
	signal en_overwrite                : std_logic;



begin





    accumulation : entity work.FixMultiAdder_S_4_lsbOut_m12_uid0_wrapper_wrapper generic map(ADDER_LOCATION => "conv1_accumulator10", PIPELINE_STEPS => PIPELINE_STEPS, ADDITIONAL_PIPELINE_STEP_AT_INPUT => FALSE)
        port map
        (
            clk, '0', x_is_valid,
            xi_1,
            xi_2,
            xi_3,
            zeros_or_buffer_output,
            partial_sum
        );

    mux			 : entity work.mux_2to1	generic map(DATA_WIDTH => 15)
                        port map(zeros, buffer_output, en_overwrite, zeros_or_buffer_output);

    delay_buffer : entity work.Delay GENERIC MAP(WL => 15, BL => INTERLEAVINGS - PIPELINE_STEPS)
                        port map(reset, clk, x_is_valid, interleave_counter, partial_sum, buffer_output);

	zeros <= (others => '0');
    yo <= partial_sum;

    process(clk, reset)
    begin
        en_overwrite <= '1';--end if;
    end process;
end structural;


