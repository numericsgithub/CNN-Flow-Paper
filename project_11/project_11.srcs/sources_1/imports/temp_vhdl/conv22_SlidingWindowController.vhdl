LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;
use work.conv22_settings.all;

entity conv22_SlidingWindowController is
	port
	(
		clk  		: in std_logic;
		reset		: in std_logic;

		x_is_valid  : in std_logic;
        out_select_signal : out SEL_CONFIGURATIONS_TYPE;
        buffer_enable : out std_logic;
		y_is_valid    : out std_logic;
		pad_1, pad_2, pad_3 : out std_logic;
        big_buffer_delay_counter   : out std_logic_vector(bits((FEATURE_MAP_SIZE - KERNEL_SIZE + 1) * CONFIGURATIONS - 0   - 1 - 2) - 1 downto 0);
        small_buffer_delay_counter : out std_logic_vector(bits(CONFIGURATIONS - 0 - 1 - 2) - 1 downto 0);
        interleave_counter : out SEL_INTERLEAVINGS_TYPE
	);
end conv22_SlidingWindowController;

architecture structural of conv22_SlidingWindowController is


    attribute KEEP_HIERARCHY : string;
    attribute KEEP_HIERARCHY of conv22_SlidingWindowController : entity is "yes";


    constant KPU_PIPELINE_STEPS : natural := 0;

    constant BIG_BUFFER_DELAY_COUNTER_MAX : NATURAL := (FEATURE_MAP_SIZE - KERNEL_SIZE + 1) * CONFIGURATIONS - KPU_PIPELINE_STEPS;
    constant SMALL_BUFFER_DELAY_COUNTER_MAX : NATURAL := CONFIGURATIONS - KPU_PIPELINE_STEPS;
	constant PADDING_SIZE               : integer range 0 to KERNEL_SIZE := (KERNEL_SIZE - 1) / 2;
	constant PADDING_TOP_OFFSET         : integer range 0 to KERNEL_SIZE := PADDING_SIZE - 1;
	constant PADDING_LEFT_OFFSET        : integer range 0 to KERNEL_SIZE := PADDING_SIZE - 1;


    signal buffer_enable_signal : std_logic;
	signal y_is_valid_signal    : std_logic;
	signal y_is_vld_swcon_debug    : std_logic;
    signal delay_mem_counter_big_signal     : unsigned(bits(BIG_BUFFER_DELAY_COUNTER_MAX   - 1 - 2) - 1 downto 0);
    signal delay_mem_counter_small_signal   : unsigned(bits(SMALL_BUFFER_DELAY_COUNTER_MAX - 1 - 2) - 1 downto 0);
    signal interleave_counter_signal        : unsigned(bits(1-1) - 1 downto 0);

	signal column, row                      : integer range -PADDING_SIZE to FEATURE_MAP_SIZE := 0;
    signal config_out_select_signal         : SEL_CONFIGURATIONS_TYPE;
    signal col_and_row_zero                 : std_logic;
    signal has_not_started_yet              : std_logic;
    signal is_in_after_padding              : std_logic;

    -- Debugging signals
	signal d_column, d_row                  : signed(bits(FEATURE_MAP_SIZE) downto 0);
	signal pad_column                   : integer range 0 to FEATURE_MAP_SIZE := 0;
    constant EXPLICIT_ZERO_PAD_CYCLES   : integer range 0 to FEATURE_MAP_SIZE * KERNEL_SIZE := ((FEATURE_MAP_SIZE + 1)*(KERNEL_SIZE - 1))/2;
	signal padding_step_counter         : integer range 0 to FEATURE_MAP_SIZE * FEATURE_MAP_SIZE + EXPLICIT_ZERO_PAD_CYCLES := 0;  --signed(bits(FEATURE_MAP_SIZE * FEATURE_MAP_SIZE - 1) + 1 downto 0);

    -- Debugging signals
    signal d_padding_step_counter       : signed(bits(FEATURE_MAP_SIZE * FEATURE_MAP_SIZE + EXPLICIT_ZERO_PAD_CYCLES) downto 0);
	signal pad_col                      : signed(bits(FEATURE_MAP_SIZE) downto 0);
    signal pad_1_signal           : std_logic;
    signal pad_2_signal           : std_logic;
    signal pad_3_signal           : std_logic;
begin
    pad_col <= to_signed(pad_column, pad_col'length);
    d_padding_step_counter <= to_signed(padding_step_counter, d_padding_step_counter'length);
    d_column <= to_signed(column, d_column'length);
    d_row <= to_signed(row, d_row'length);


    SYNC_ALL_OUTPUTS: process(clk)
    begin
        if rising_edge(clk) then
        
            pad_1 <= pad_1_signal; -- async
            pad_2 <= pad_2_signal; -- async
            pad_3 <= pad_3_signal; -- async

            y_is_valid <= y_is_valid_signal; -- async
            y_is_vld_swcon_debug <= y_is_valid_signal;
            buffer_enable <= x_is_valid or (has_not_started_yet and col_and_row_zero) or is_in_after_padding; -- async

            big_buffer_delay_counter <= std_logic_vector(delay_mem_counter_big_signal); -- sync
            small_buffer_delay_counter <= std_logic_vector(delay_mem_counter_small_signal); -- sync
            interleave_counter <= std_logic_vector(interleave_counter_signal); -- sync
                out_select_signal <= config_out_select_signal; -- async
        end if;
    end process;

    track_col_and_row_zero: process(row, column, config_out_select_signal, padding_step_counter)
    begin
        if (row = 0) and (column = -PADDING_SIZE) then
            col_and_row_zero <= '1';
        else
            col_and_row_zero <= '0';
        end if;


        if (unsigned(config_out_select_signal) = 0)  then
            has_not_started_yet <= '1';
        else
            has_not_started_yet <= '0';
        end if;

    
        if (padding_step_counter >= FEATURE_MAP_SIZE * FEATURE_MAP_SIZE) then
            is_in_after_padding <= '1';
        else
            is_in_after_padding <= '0';
        end if;
    end process;

    track_interleave_counter: process(reset, clk)
    begin
        if reset = '1' then
            interleave_counter_signal <= (others => '0');
        elsif rising_edge(clk) and buffer_enable = '1' then
        
        end if;
    end process;

    track_small_counter: process(reset, clk, buffer_enable)
    begin
        if reset = '1' then
            delay_mem_counter_small_signal <= (others => '0');
        elsif rising_edge(clk) and buffer_enable = '1' then
        
            if delay_mem_counter_small_signal = to_unsigned(SMALL_BUFFER_DELAY_COUNTER_MAX - 2 - 2, delay_mem_counter_small_signal'length) then
                delay_mem_counter_small_signal <= (others =>'0');
            else
                delay_mem_counter_small_signal <= delay_mem_counter_small_signal + 1;
            end if;
        
        end if;
    end process;

    track_big_counter: process(reset, clk, buffer_enable)
    begin
        if reset = '1' then
            delay_mem_counter_big_signal <= (others => '0');
        elsif rising_edge(clk) and buffer_enable = '1' then
            if delay_mem_counter_big_signal = to_unsigned(BIG_BUFFER_DELAY_COUNTER_MAX - 2 - 2, delay_mem_counter_big_signal'length) then
                delay_mem_counter_big_signal <= (others =>'0');
            else
                delay_mem_counter_big_signal <= delay_mem_counter_big_signal + 1;
            end if;
        end if;
    end process;



	track_row_and_column: process(clk, reset)
    begin
        if reset = '1' then
            column <= -PADDING_SIZE;
            row <= 0;
            pad_column <= 0;
            padding_step_counter <= 0;
            config_out_select_signal <= (others => '0');
        elsif rising_edge(clk) then
            if x_is_valid = '1' or (padding_step_counter >= FEATURE_MAP_SIZE * FEATURE_MAP_SIZE) then
                if unsigned(config_out_select_signal) = CONFIGURATIONS - 1 then
                    config_out_select_signal <= (others =>'0');
                else
                    config_out_select_signal <= config_out_select_signal + 1;
                end if;

                -- Track the row and column index of the current input pixel
                -- We are starting from the top left corner.
                -- Increment the column after each clock cycle
                -- Switch to the next row after reaching the last column pixel
                if unsigned(config_out_select_signal) = CONFIGURATIONS - 1  then -- After all configurations, we switch to the next pixel
                    if padding_step_counter < FEATURE_MAP_SIZE * FEATURE_MAP_SIZE + EXPLICIT_ZERO_PAD_CYCLES - 1 then
                        padding_step_counter <= padding_step_counter + 1;
                        if pad_column < FEATURE_MAP_SIZE - 1 then
                            pad_column <= pad_column + 1;
                        else
                            pad_column <= 0;
                        end if;
                        if column < FEATURE_MAP_SIZE - 1 then
                            column <= column + 1;
                        else
                            column <= 0;
                            row <= row + 1;
                        end if;
                    else
                        row <= 0;
                        column <= -PADDING_SIZE;
                        pad_column <= 0;
                        padding_step_counter <= 0;
                    end if;
                end if;
            end if;
        end if;
    end process;


	pad_and_detect_y_valid_case: process(interleave_counter_signal,config_out_select_signal, padding_step_counter, pad_column, column, row, x_is_valid)
    begin
        if x_is_valid = '1' or (padding_step_counter >= FEATURE_MAP_SIZE * FEATURE_MAP_SIZE) then

            -- All three conditions have to be met!
            -- The output is valid when the accumulation is finished, the current input pixels fills the last pixel in a sliding window, and the sliding winow is contained in the stride

            -- The last INTERLEAVINGS accumulation steps produce valid outputs.
            -- If you accumulate over 8 steps and interleave 2 channels, the last two steps produce a valid output
            if (True)
                -- All pixels at the bottom right corner of the feature map that fill the bottom right pixel of a sliding window produce a valid output
                -- Simply: Determine which pixels fill the last pixel in a sliding window.
                and (padding_step_counter >= EXPLICIT_ZERO_PAD_CYCLES)

                -- Check for the stride
                -- The column and row index has to be multiples of the stride. So if the stride is 1 this check is trivial.
                and True then
                y_is_valid_signal <= '1';
            else
                y_is_valid_signal <= '0';
            end if;
        else
            y_is_valid_signal <= '0';
        end if;

        -- Now, we manage the padding signals.
        if x_is_valid = '1' then
        
            if (pad_column >= FEATURE_MAP_SIZE - PADDING_SIZE + 1 - 1) then
                pad_1_signal <= '0';
            else
                pad_1_signal <= '1';
            end if;
        
            pad_2_signal <= '1';
        
            if (pad_column < PADDING_SIZE - KERNEL_SIZE + 3) then
                pad_3_signal <= '0';
            else
                pad_3_signal <= '1';
            end if;
        else
            pad_1_signal <= '0';
            pad_2_signal <= '0';
            pad_3_signal <= '0';
        end if;
    end process;
end structural;