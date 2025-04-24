LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;
use work.conv23_interleaving_Data_Aggregator_pkg.all;

entity conv23_interleaving is
    generic
    (
        XI_WIDTH        	: natural := 7;
		IN_INTERLEAVINGS    : natural := 1;
		INPUT_HOLD_CYCLES   : natural := 4;
		INPUTS_PER_MUX      : natural := 1
    );
    port
    (
        clk   : in std_logic;
        reset : in std_logic;
    
        layer_xi_1    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_2    : in std_logic_vector((XI_WIDTH-1) downto 0);
        x_is_valid    : in std_logic;

        y_valid       : out std_logic;
        input_hold_counter    : out std_logic_vector(bits(INPUT_HOLD_CYCLES-1)-1 downto 0);
        layer_yo_1 : out std_logic_vector((XI_WIDTH-1) downto 0); 
        layer_yo_2 : out std_logic_vector((XI_WIDTH-1) downto 0); 
        layer_yo_3 : out std_logic_vector((XI_WIDTH-1) downto 0); 
        layer_yo_4 : out std_logic_vector((XI_WIDTH-1) downto 0); 
        layer_yo_5 : out std_logic_vector((XI_WIDTH-1) downto 0); 
        layer_yo_6 : out std_logic_vector((XI_WIDTH-1) downto 0); 
        layer_yo_7 : out std_logic_vector((XI_WIDTH-1) downto 0); 
        layer_yo_8 : out std_logic_vector((XI_WIDTH-1) downto 0)
    ) ;
end conv23_interleaving;

architecture Behavioral of conv23_interleaving is


    attribute KEEP_HIERARCHY : string;
    attribute KEEP_HIERARCHY of conv23_interleaving : entity is "yes";

	constant FIFO_START_THR     : natural := 2; -- todo well, maybe 4 is not always the best value here? But it is quite nice :D
    constant FIFO_SIZE          : natural := 4;
    constant AMOUNT_OF_LAYER_OUTPUTS          : natural := 8;

    type PIPELINE_TYPE_FOR_Y_VALID_PL           is array(0 to 2) of std_logic;
    type PIPELINE_TYPE_FOR_INPUT_HOLD_COUNTER_PL is array(0 to 2) of std_logic_vector(bits(INPUT_HOLD_CYCLES-1)-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_1_PL        is array(0 to 1) of std_logic_vector((XI_WIDTH-1) downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_2_PL        is array(0 to 1) of std_logic_vector((XI_WIDTH-1) downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_3_PL        is array(0 to 1) of std_logic_vector((XI_WIDTH-1) downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_4_PL        is array(0 to 1) of std_logic_vector((XI_WIDTH-1) downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_5_PL        is array(0 to 1) of std_logic_vector((XI_WIDTH-1) downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_6_PL        is array(0 to 1) of std_logic_vector((XI_WIDTH-1) downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_7_PL        is array(0 to 1) of std_logic_vector((XI_WIDTH-1) downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_8_PL        is array(0 to 1) of std_logic_vector((XI_WIDTH-1) downto 0);
    type PIPELINE_TYPE_FOR_MUX_SELECT_SIGNAL_PL is array(0 to 1) of std_logic_vector((bits(INPUTS_PER_MUX - 1) - 1) downto 0);
    type PIPELINE_TYPE_FOR_FIFO_MAIN_OUTPUT_SIGNAL_PL is array(0 to 1) of std_logic_vector((XI_WIDTH*AMOUNT_OF_LAYER_OUTPUTS-1) downto 0);

    -- 
    signal y_valid_pl           : PIPELINE_TYPE_FOR_Y_VALID_PL;
    -- 
    signal input_hold_counter_pl : PIPELINE_TYPE_FOR_INPUT_HOLD_COUNTER_PL;
    -- 
    signal layer_yo_1_pl        : PIPELINE_TYPE_FOR_LAYER_YO_1_PL;
    -- 
    signal layer_yo_2_pl        : PIPELINE_TYPE_FOR_LAYER_YO_2_PL;
    -- 
    signal layer_yo_3_pl        : PIPELINE_TYPE_FOR_LAYER_YO_3_PL;
    -- 
    signal layer_yo_4_pl        : PIPELINE_TYPE_FOR_LAYER_YO_4_PL;
    -- 
    signal layer_yo_5_pl        : PIPELINE_TYPE_FOR_LAYER_YO_5_PL;
    -- 
    signal layer_yo_6_pl        : PIPELINE_TYPE_FOR_LAYER_YO_6_PL;
    -- 
    signal layer_yo_7_pl        : PIPELINE_TYPE_FOR_LAYER_YO_7_PL;
    -- 
    signal layer_yo_8_pl        : PIPELINE_TYPE_FOR_LAYER_YO_8_PL;


    signal input_hold_counter_signal  : unsigned((bits(INPUT_HOLD_CYCLES - 1) - 1) downto 0);
    -- 
    signal mux_select_signal_pl : PIPELINE_TYPE_FOR_MUX_SELECT_SIGNAL_PL;
    signal data_ready                 : std_logic;
    signal data_next                  : std_logic;
    signal y_valid_signal           : std_logic;
    signal fifo_data_counter          : unsigned(bits(FIFO_SIZE) downto 0);

    type state_type is (FLUSH_DATA, LOAD_FIRST, AWAIT_THRESHOLD);
    signal state : state_type;
    signal debug_state_signal : unsigned(2 downto 0);

    -- All data aggregator flags & signals
    signal is_data_aggregator_output_valid : std_logic;
    signal data_aggregator_output          : conv23_interleaving_Data_Aggregator_output;

    -- All fifo flags
    signal full_flag_MAIN_signal          : std_logic;
    signal empty_flag_MAIN_signal         : std_logic;

    -- All fifo outputs
    signal fifo_MAIN_input_signal         : std_logic_vector((XI_WIDTH*AMOUNT_OF_LAYER_OUTPUTS-1) downto 0);
    -- 
    signal fifo_MAIN_output_signal_pl : PIPELINE_TYPE_FOR_FIFO_MAIN_OUTPUT_SIGNAL_PL;
    --signal fifo_MAIN_output_signal        : std_logic_vector((XI_WIDTH*AMOUNT_OF_LAYER_OUTPUTS-1) downto 0);
    signal fifo_1_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_2_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_3_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_4_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_5_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_6_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_7_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_8_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);

    signal x_is_valid_counter, y_valid_counter    : integer := 0; -- This is only used for debugging.
begin

    fifo_MAIN_input_signal <=data_aggregator_output(0)  & data_aggregator_output(1)  & data_aggregator_output(2)  & data_aggregator_output(3)  & data_aggregator_output(4)  & data_aggregator_output(5)  & data_aggregator_output(6)  & data_aggregator_output(7) ;


    Data_Aggregator_for_FIFO: entity work.conv23_interleaving_Data_Aggregator
        port map
        (
            clk   => clk,
            reset => reset,

        
            input_1 => layer_xi_1,
            input_2 => layer_xi_2,
            input_is_valid => x_is_valid,

            output_array => data_aggregator_output,
            valid_out    => is_data_aggregator_output_valid
        );

    FIFO: entity work.fifo_master_generator generic map(XI_WIDTH => XI_WIDTH*AMOUNT_OF_LAYER_OUTPUTS, XI_DEPTH => FIFO_SIZE)
        port map
        (
            reset => reset,
            clk   => clk,
            write_en   => is_data_aggregator_output_valid,
            data_in    => fifo_MAIN_input_signal,
            full_flag  => full_flag_MAIN_signal,
            read_en    => data_next,
            data_out   => fifo_MAIN_output_signal_pl(0),
            empty_flag => empty_flag_MAIN_signal,
            data_available => open
        );

    -- Add a pipeline step
    PL_STEP_0_for_mux_select_signal_pl: entity work.Pipe_Vector PORT MAP(clk, '1', mux_select_signal_pl(0), mux_select_signal_pl(1));
    PL_STEP_0_for_fifo_MAIN_output_signal_pl: entity work.Pipe_Vector PORT MAP(clk, '1', fifo_MAIN_output_signal_pl(0), fifo_MAIN_output_signal_pl(1));
    fifo_1_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*8)-1 downto (XI_WIDTH*7));

    fifo_2_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*7)-1 downto (XI_WIDTH*6));

    fifo_3_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*6)-1 downto (XI_WIDTH*5));

    fifo_4_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*5)-1 downto (XI_WIDTH*4));

    fifo_5_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*4)-1 downto (XI_WIDTH*3));

    fifo_6_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*3)-1 downto (XI_WIDTH*2));

    fifo_7_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*2)-1 downto (XI_WIDTH*1));

    fifo_8_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*1)-1 downto (XI_WIDTH*0));



    layer_yo_1_pl(0) <= fifo_1_output_signal;
    layer_yo_2_pl(0) <= fifo_2_output_signal;
    layer_yo_3_pl(0) <= fifo_3_output_signal;
    layer_yo_4_pl(0) <= fifo_4_output_signal;
    layer_yo_5_pl(0) <= fifo_5_output_signal;
    layer_yo_6_pl(0) <= fifo_6_output_signal;
    layer_yo_7_pl(0) <= fifo_7_output_signal;
    layer_yo_8_pl(0) <= fifo_8_output_signal;

    y_valid_pl(0) <= y_valid_signal;
    input_hold_counter_pl(0) <= std_logic_vector(input_hold_counter_signal);


    state_output: process(clk, reset)
    begin
        if reset = '1' then
            input_hold_counter_signal <= (others => '0');
            fifo_data_counter <= (others => '0');
            state <= AWAIT_THRESHOLD;
            debug_state_signal <= to_unsigned(0, debug_state_signal'length);
        elsif rising_edge(clk) then

            -- This is only for debugging!
            if x_is_valid = '1' then
                x_is_valid_counter <= x_is_valid_counter + 1;
            end if;

            case state is
                when AWAIT_THRESHOLD =>
                    data_next <= '0';
                    y_valid_signal <= '0';

                    if fifo_data_counter >= FIFO_START_THR then
                        state <= LOAD_FIRST;
                        debug_state_signal <= to_unsigned(1, debug_state_signal'length);
                        input_hold_counter_signal <= (others => '0');
                        data_next <= '1';
                    else
                        state <= AWAIT_THRESHOLD;
                        debug_state_signal <= to_unsigned(0, debug_state_signal'length);
                    end if;

                when LOAD_FIRST =>data_next <= '0';
                    y_valid_signal <= '1';
                    y_valid_counter <= y_valid_counter + 1;
                    state <= FLUSH_DATA;
                    debug_state_signal <= to_unsigned(2, debug_state_signal'length);

                when FLUSH_DATA =>
                    if fifo_data_counter > 0 and input_hold_counter_signal = INPUT_HOLD_CYCLES - 2  then
                        data_next <= '1';

                    else
                        data_next <= '0';
                    end if;

                
					if input_hold_counter_signal = to_unsigned(INPUT_HOLD_CYCLES - 1, input_hold_counter_signal'length) then
						input_hold_counter_signal <= (others =>'0');

                
					else
						input_hold_counter_signal <= input_hold_counter_signal + 1;
					end if;

                    if fifo_data_counter = 0  and input_hold_counter_signal = INPUT_HOLD_CYCLES - 1    then
                        state <= AWAIT_THRESHOLD;
                        debug_state_signal <= to_unsigned(0, debug_state_signal'length);
                        y_valid_signal <= '0';
                    else
                        state <= FLUSH_DATA;
                        debug_state_signal <= to_unsigned(2, debug_state_signal'length);
                        y_valid_signal <= '1';
                        y_valid_counter <= y_valid_counter + 1;
                    end if;

                when others =>
                    data_next <= '0';
                    y_valid_signal <= '0';
            end case;

            if is_data_aggregator_output_valid = '0' and data_next = '1' then
                fifo_data_counter <= fifo_data_counter - 1;
            elsif is_data_aggregator_output_valid = '1' and data_next = '0' then
                fifo_data_counter <= fifo_data_counter + 1;
            end if;

        end if;
    end process;

    -- Simulation: Raise exception on buffer overflow!
    process(clk)
    begin
        if rising_edge(clk) then
            if fifo_data_counter >= FIFO_SIZE then
                assert false
                report "Interleaving layer conv23_interleaving: FIFO Overflow!"
                severity warning;
            end if;
        end if;
    end process;

    -- Add a pipeline step
    PL_STEP_0_for_y_valid_pl: entity work.Pipe PORT MAP(clk, '1', y_valid_pl(0), y_valid_pl(1));
    PL_STEP_0_for_input_hold_counter_pl: entity work.Pipe_Vector PORT MAP(clk, '1', input_hold_counter_pl(0), input_hold_counter_pl(1));
    PL_STEP_0_for_layer_yo_1_pl: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_1_pl(0), layer_yo_1_pl(1));
    PL_STEP_0_for_layer_yo_2_pl: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_2_pl(0), layer_yo_2_pl(1));
    PL_STEP_0_for_layer_yo_3_pl: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_3_pl(0), layer_yo_3_pl(1));
    PL_STEP_0_for_layer_yo_4_pl: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_4_pl(0), layer_yo_4_pl(1));
    PL_STEP_0_for_layer_yo_5_pl: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_5_pl(0), layer_yo_5_pl(1));
    PL_STEP_0_for_layer_yo_6_pl: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_6_pl(0), layer_yo_6_pl(1));
    PL_STEP_0_for_layer_yo_7_pl: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_7_pl(0), layer_yo_7_pl(1));
    PL_STEP_0_for_layer_yo_8_pl: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_8_pl(0), layer_yo_8_pl(1));
    -- Add a pipeline step
    PL_STEP_1_for_y_valid_pl: entity work.Pipe PORT MAP(clk, '1', y_valid_pl(1), y_valid_pl(2));
    PL_STEP_1_for_input_hold_counter_pl: entity work.Pipe_Vector PORT MAP(clk, '1', input_hold_counter_pl(1), input_hold_counter_pl(2));

    y_valid <= y_valid_pl(2);
    input_hold_counter <= input_hold_counter_pl(2);

    layer_yo_1 <= layer_yo_1_pl(1);
    layer_yo_2 <= layer_yo_2_pl(1);
    layer_yo_3 <= layer_yo_3_pl(1);
    layer_yo_4 <= layer_yo_4_pl(1);
    layer_yo_5 <= layer_yo_5_pl(1);
    layer_yo_6 <= layer_yo_6_pl(1);
    layer_yo_7 <= layer_yo_7_pl(1);
    layer_yo_8 <= layer_yo_8_pl(1);

end Behavioral;