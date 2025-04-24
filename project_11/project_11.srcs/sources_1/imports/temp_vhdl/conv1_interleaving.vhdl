LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv1_interleaving is
    generic
    (
        XI_WIDTH        	: natural := 8;
		CONFIGURATIONS      : natural := 1;
		INTERLEAVINGS       : natural := 1;
		INPUTS_PER_MUX      : natural := 1
    );
    port
    (
        clk   : in std_logic;
        reset : in std_logic;
    
        layer_xi_1    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_2    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_3    : in std_logic_vector((XI_WIDTH-1) downto 0);
        x_is_valid    : in std_logic;

        y_valid       : out std_logic;
        sel_config    : out std_logic_vector(bits(CONFIGURATIONS-1)-1 downto 0);
        layer_yo_1 : out std_logic_vector((XI_WIDTH-1) downto 0); 
        layer_yo_2 : out std_logic_vector((XI_WIDTH-1) downto 0); 
        layer_yo_3 : out std_logic_vector((XI_WIDTH-1) downto 0)
    ) ;
end conv1_interleaving;

architecture Behavioral of conv1_interleaving is


    attribute KEEP_HIERARCHY : string;
    attribute KEEP_HIERARCHY of conv1_interleaving : entity is "yes";


	constant FIFO_START_THR     : natural := 2;
    constant FIFO_SIZE          : natural := 5;
    constant FIFO_HOLD_CYCLES   : natural := INTERLEAVINGS * INPUTS_PER_MUX;
    constant AMOUNT_OF_LAYER_OUTPUTS          : natural := 3;

    type state_type is (FLUSH_DATA, LOAD_FIRST, AWAIT_THRESHOLD);
    signal state : state_type;
    signal debug_state_signal : unsigned(2 downto 0);

    type PIPELINE_TYPE_FOR_Y_VALID_PL           is array(0 to 2) of std_logic;
    type PIPELINE_TYPE_FOR_SEL_CONFIG_PL        is array(0 to 2) of std_logic_vector(bits(CONFIGURATIONS-1)-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_1_PL        is array(0 to 1) of std_logic_vector((XI_WIDTH-1) downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_2_PL        is array(0 to 1) of std_logic_vector((XI_WIDTH-1) downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_3_PL        is array(0 to 1) of std_logic_vector((XI_WIDTH-1) downto 0);
    type PIPELINE_TYPE_FOR_MUX_SELECT_SIGNAL_PL is array(0 to 1) of std_logic_vector((bits(INPUTS_PER_MUX - 1) - 1) downto 0);
    type PIPELINE_TYPE_FOR_FIFO_MAIN_OUTPUT_SIGNAL_PL is array(0 to 1) of std_logic_vector((XI_WIDTH*3-1) downto 0);

    -- 
    signal y_valid_pl           : PIPELINE_TYPE_FOR_Y_VALID_PL;
    -- 
    signal sel_config_pl        : PIPELINE_TYPE_FOR_SEL_CONFIG_PL;
    -- 
    signal layer_yo_1_pl        : PIPELINE_TYPE_FOR_LAYER_YO_1_PL;
    -- 
    signal layer_yo_2_pl        : PIPELINE_TYPE_FOR_LAYER_YO_2_PL;
    -- 
    signal layer_yo_3_pl        : PIPELINE_TYPE_FOR_LAYER_YO_3_PL;
    -- 
    signal mux_select_signal_pl : PIPELINE_TYPE_FOR_MUX_SELECT_SIGNAL_PL;
    signal config_out_select_signal : unsigned((bits(CONFIGURATIONS - 1) - 1) downto 0);
    signal fifo_hold_counter        : unsigned((bits(FIFO_HOLD_CYCLES - 1) - 1) downto 0);
    signal data_next                : std_logic;
    signal fifo_data_counter        : unsigned(bits(FIFO_SIZE) downto 0);
    signal y_valid_signal           : std_logic;

    -- All fifo flags
    signal full_flag_MAIN_signal          : std_logic;
    signal empty_flag_MAIN_signal         : std_logic;

    -- All fifo outputs
    signal fifo_MAIN_input_signal         : std_logic_vector((XI_WIDTH*3-1) downto 0);
    -- 
    signal fifo_MAIN_output_signal_pl : PIPELINE_TYPE_FOR_FIFO_MAIN_OUTPUT_SIGNAL_PL;
    --signal fifo_MAIN_output_signal        : std_logic_vector((XI_WIDTH*3-1) downto 0);
    signal fifo_1_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_2_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_3_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);

begin

    fifo_MAIN_input_signal <= layer_xi_1  & layer_xi_2  & layer_xi_3 ;


    FIFO_1: entity work.fifo_master_generator generic map(XI_WIDTH => XI_WIDTH*3, XI_DEPTH => FIFO_SIZE)
        port map
        (
            reset => reset,
            clk   => clk,
            write_en   => x_is_valid,
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


    fifo_1_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*3)-1 downto (XI_WIDTH*2));
    fifo_2_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*2)-1 downto (XI_WIDTH*1));
    fifo_3_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*1)-1 downto (XI_WIDTH*0));



    layer_yo_1_pl(0) <= fifo_1_output_signal;
    layer_yo_2_pl(0) <= fifo_2_output_signal;
    layer_yo_3_pl(0) <= fifo_3_output_signal;

    y_valid_pl(0) <= y_valid_signal;
    sel_config_pl(0) <= std_logic_vector(config_out_select_signal);

     state_output: process(clk, reset)
    begin
        if reset = '1' then
            config_out_select_signal <= (others => '0');
            fifo_data_counter <= (others => '0');
            state <= AWAIT_THRESHOLD;
            debug_state_signal <= to_unsigned(0, debug_state_signal'length);
            y_valid_signal <= '0';
            fifo_hold_counter <= (others => '0');
            data_next <= '0';
        elsif rising_edge(clk) then
            case state is
                when AWAIT_THRESHOLD =>
                    y_valid_signal <= '0';

                    if fifo_data_counter >= FIFO_START_THR then
                        state <= LOAD_FIRST;
                        debug_state_signal <= to_unsigned(1, debug_state_signal'length);
                        data_next <= '1';
                    else
                        state <= AWAIT_THRESHOLD;
                        debug_state_signal <= to_unsigned(0, debug_state_signal'length);
                        data_next <= '0';
                    end if;

                when LOAD_FIRST =>
                    data_next <= '1';
                    y_valid_signal <= '1';
                    state <= FLUSH_DATA;
                    debug_state_signal <= to_unsigned(2, debug_state_signal'length);

                when FLUSH_DATA =>
                    if fifo_data_counter > 1 then
                        data_next <= '1'; -- Not when the next layer interleaves data! This would be the case when r_in < 1
                    else
                        data_next <= '0';
                    end if;

                    

                    if config_out_select_signal = to_unsigned(CONFIGURATIONS - 1, config_out_select_signal'length) then
                        config_out_select_signal <= (others =>'0');
                    else
                        config_out_select_signal <= config_out_select_signal + 1;
                    end if;

                    if data_next = '0'   then
                        state <= AWAIT_THRESHOLD;
                        debug_state_signal <= to_unsigned(0, debug_state_signal'length);
                        y_valid_signal <= '0';
                    else
                        state <= FLUSH_DATA;
                        debug_state_signal <= to_unsigned(2, debug_state_signal'length);
                        y_valid_signal <= '1';
                    end if;

                when others =>
                    data_next <= '0';
                    y_valid_signal <= '0';
            end case;

            if x_is_valid = '0' and data_next = '1' then
                fifo_data_counter <= fifo_data_counter - 1;
            elsif x_is_valid = '1' and data_next = '0' then
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
                report "Interleaving layer conv1_interleaving: FIFO Overflow!"
                severity warning;
            end if;
        end if;
    end process;

    -- Add a pipeline step
    PL_STEP_0_for_y_valid_pl: entity work.Pipe PORT MAP(clk, '1', y_valid_pl(0), y_valid_pl(1));
    PL_STEP_0_for_sel_config_pl: entity work.Pipe_Vector PORT MAP(clk, '1', sel_config_pl(0), sel_config_pl(1));
    PL_STEP_0_for_layer_yo_1_pl: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_1_pl(0), layer_yo_1_pl(1));
    PL_STEP_0_for_layer_yo_2_pl: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_2_pl(0), layer_yo_2_pl(1));
    PL_STEP_0_for_layer_yo_3_pl: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_3_pl(0), layer_yo_3_pl(1));
    -- Add a pipeline step
    PL_STEP_1_for_y_valid_pl: entity work.Pipe PORT MAP(clk, '1', y_valid_pl(1), y_valid_pl(2));
    PL_STEP_1_for_sel_config_pl: entity work.Pipe_Vector PORT MAP(clk, '1', sel_config_pl(1), sel_config_pl(2));

    y_valid <= y_valid_pl(2);
    sel_config <= sel_config_pl(2);
    layer_yo_1 <= layer_yo_1_pl(1);
    layer_yo_2 <= layer_yo_2_pl(1);
    layer_yo_3 <= layer_yo_3_pl(1);

end Behavioral;