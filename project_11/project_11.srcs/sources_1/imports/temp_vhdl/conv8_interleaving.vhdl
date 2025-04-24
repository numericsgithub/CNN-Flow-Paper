LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv8_interleaving is
    generic
    (
        XI_WIDTH        	: natural := 7;
		CONFIGURATIONS      : natural := 16;
		INTERLEAVINGS       : natural := 1;
		INPUTS_PER_MUX      : natural := 4
    );
    port
    (
        clk   : in std_logic;
        reset : in std_logic;
    
        layer_xi_1    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_2    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_3    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_4    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_5    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_6    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_7    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_8    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_9    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_10    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_11    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_12    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_13    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_14    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_15    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_16    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_17    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_18    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_19    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_20    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_21    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_22    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_23    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_24    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_25    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_26    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_27    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_28    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_29    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_30    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_31    : in std_logic_vector((XI_WIDTH-1) downto 0);
        layer_xi_32    : in std_logic_vector((XI_WIDTH-1) downto 0);
        x_is_valid    : in std_logic;

        y_valid       : out std_logic;
        sel_config    : out std_logic_vector(bits(CONFIGURATIONS-1)-1 downto 0);
        layer_yo_1 : out std_logic_vector((XI_WIDTH-1) downto 0); 
        layer_yo_2 : out std_logic_vector((XI_WIDTH-1) downto 0); 
        layer_yo_3 : out std_logic_vector((XI_WIDTH-1) downto 0); 
        layer_yo_4 : out std_logic_vector((XI_WIDTH-1) downto 0); 
        layer_yo_5 : out std_logic_vector((XI_WIDTH-1) downto 0); 
        layer_yo_6 : out std_logic_vector((XI_WIDTH-1) downto 0); 
        layer_yo_7 : out std_logic_vector((XI_WIDTH-1) downto 0); 
        layer_yo_8 : out std_logic_vector((XI_WIDTH-1) downto 0)
    ) ;
end conv8_interleaving;

architecture Behavioral of conv8_interleaving is


    attribute KEEP_HIERARCHY : string;
    attribute KEEP_HIERARCHY of conv8_interleaving : entity is "yes";


	constant FIFO_START_THR     : natural := 2;
    constant FIFO_LAST_READ_MAX : natural := INPUTS_PER_MUX - 1;
    constant FIFO_SIZE          : natural := 5;
    constant FIFO_HOLD_CYCLES   : natural := INTERLEAVINGS * INPUTS_PER_MUX;
    constant AMOUNT_OF_LAYER_OUTPUTS          : natural := 8;

    type state_type is (FLUSH_DATA, LOAD_FIRST, AWAIT_THRESHOLD);
    signal state : state_type;
    signal debug_state_signal : unsigned(2 downto 0);

    type PIPELINE_TYPE_FOR_Y_VALID_PL           is array(0 to 2) of std_logic;
    type PIPELINE_TYPE_FOR_SEL_CONFIG_PL        is array(0 to 2) of std_logic_vector(bits(CONFIGURATIONS-1)-1 downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_1_PL        is array(0 to 1) of std_logic_vector((XI_WIDTH-1) downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_2_PL        is array(0 to 1) of std_logic_vector((XI_WIDTH-1) downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_3_PL        is array(0 to 1) of std_logic_vector((XI_WIDTH-1) downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_4_PL        is array(0 to 1) of std_logic_vector((XI_WIDTH-1) downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_5_PL        is array(0 to 1) of std_logic_vector((XI_WIDTH-1) downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_6_PL        is array(0 to 1) of std_logic_vector((XI_WIDTH-1) downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_7_PL        is array(0 to 1) of std_logic_vector((XI_WIDTH-1) downto 0);
    type PIPELINE_TYPE_FOR_LAYER_YO_8_PL        is array(0 to 1) of std_logic_vector((XI_WIDTH-1) downto 0);
    type PIPELINE_TYPE_FOR_MUX_SELECT_SIGNAL_PL is array(0 to 1) of std_logic_vector((bits(INPUTS_PER_MUX - 1) - 1) downto 0);
    type PIPELINE_TYPE_FOR_FIFO_MAIN_OUTPUT_SIGNAL_PL is array(0 to 1) of std_logic_vector((XI_WIDTH*32-1) downto 0);

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
    signal layer_yo_4_pl        : PIPELINE_TYPE_FOR_LAYER_YO_4_PL;
    -- 
    signal layer_yo_5_pl        : PIPELINE_TYPE_FOR_LAYER_YO_5_PL;
    -- 
    signal layer_yo_6_pl        : PIPELINE_TYPE_FOR_LAYER_YO_6_PL;
    -- 
    signal layer_yo_7_pl        : PIPELINE_TYPE_FOR_LAYER_YO_7_PL;
    -- 
    signal layer_yo_8_pl        : PIPELINE_TYPE_FOR_LAYER_YO_8_PL;
    -- 
    signal mux_select_signal_pl : PIPELINE_TYPE_FOR_MUX_SELECT_SIGNAL_PL;
    signal mux_select_signal        : unsigned((bits(INPUTS_PER_MUX - 1) - 1) downto 0);
    signal config_out_select_signal : unsigned((bits(CONFIGURATIONS - 1) - 1) downto 0);
    signal fifo_hold_counter        : unsigned((bits(FIFO_HOLD_CYCLES - 1) - 1) downto 0);
    signal data_next                : std_logic;
    signal fifo_data_counter        : unsigned(bits(FIFO_SIZE) downto 0);
    signal y_valid_signal           : std_logic;

    -- All fifo flags
    signal full_flag_MAIN_signal          : std_logic;
    signal empty_flag_MAIN_signal         : std_logic;

    -- All fifo outputs
    signal fifo_MAIN_input_signal         : std_logic_vector((XI_WIDTH*32-1) downto 0);
    -- 
    signal fifo_MAIN_output_signal_pl : PIPELINE_TYPE_FOR_FIFO_MAIN_OUTPUT_SIGNAL_PL;
    --signal fifo_MAIN_output_signal        : std_logic_vector((XI_WIDTH*32-1) downto 0);
    signal fifo_1_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_2_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_3_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_4_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_5_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_6_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_7_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_8_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_9_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_10_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_11_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_12_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_13_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_14_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_15_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_16_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_17_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_18_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_19_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_20_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_21_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_22_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_23_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_24_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_25_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_26_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_27_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_28_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_29_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_30_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_31_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);
    signal fifo_32_output_signal        : std_logic_vector((XI_WIDTH-1) downto 0);

begin

    fifo_MAIN_input_signal <= layer_xi_1  & layer_xi_2  & layer_xi_3  & layer_xi_4  & layer_xi_5  & layer_xi_6  & layer_xi_7  & layer_xi_8  & layer_xi_9  & layer_xi_10  & layer_xi_11  & layer_xi_12  & layer_xi_13  & layer_xi_14  & layer_xi_15  & layer_xi_16  & layer_xi_17  & layer_xi_18  & layer_xi_19  & layer_xi_20  & layer_xi_21  & layer_xi_22  & layer_xi_23  & layer_xi_24  & layer_xi_25  & layer_xi_26  & layer_xi_27  & layer_xi_28  & layer_xi_29  & layer_xi_30  & layer_xi_31  & layer_xi_32 ;


    FIFO_1: entity work.fifo_master_generator generic map(XI_WIDTH => XI_WIDTH*32, XI_DEPTH => FIFO_SIZE)
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
    mux_select_signal_pl(0) <= std_logic_vector(mux_select_signal);

    -- Add a pipeline step
    PL_STEP_0_for_mux_select_signal_pl: entity work.Pipe_Vector PORT MAP(clk, '1', mux_select_signal_pl(0), mux_select_signal_pl(1));
    PL_STEP_0_for_fifo_MAIN_output_signal_pl: entity work.Pipe_Vector PORT MAP(clk, '1', fifo_MAIN_output_signal_pl(0), fifo_MAIN_output_signal_pl(1));


    fifo_1_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*32)-1 downto (XI_WIDTH*31));
    fifo_2_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*31)-1 downto (XI_WIDTH*30));
    fifo_3_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*30)-1 downto (XI_WIDTH*29));
    fifo_4_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*29)-1 downto (XI_WIDTH*28));
    fifo_5_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*28)-1 downto (XI_WIDTH*27));
    fifo_6_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*27)-1 downto (XI_WIDTH*26));
    fifo_7_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*26)-1 downto (XI_WIDTH*25));
    fifo_8_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*25)-1 downto (XI_WIDTH*24));
    fifo_9_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*24)-1 downto (XI_WIDTH*23));
    fifo_10_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*23)-1 downto (XI_WIDTH*22));
    fifo_11_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*22)-1 downto (XI_WIDTH*21));
    fifo_12_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*21)-1 downto (XI_WIDTH*20));
    fifo_13_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*20)-1 downto (XI_WIDTH*19));
    fifo_14_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*19)-1 downto (XI_WIDTH*18));
    fifo_15_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*18)-1 downto (XI_WIDTH*17));
    fifo_16_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*17)-1 downto (XI_WIDTH*16));
    fifo_17_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*16)-1 downto (XI_WIDTH*15));
    fifo_18_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*15)-1 downto (XI_WIDTH*14));
    fifo_19_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*14)-1 downto (XI_WIDTH*13));
    fifo_20_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*13)-1 downto (XI_WIDTH*12));
    fifo_21_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*12)-1 downto (XI_WIDTH*11));
    fifo_22_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*11)-1 downto (XI_WIDTH*10));
    fifo_23_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*10)-1 downto (XI_WIDTH*9));
    fifo_24_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*9)-1 downto (XI_WIDTH*8));
    fifo_25_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*8)-1 downto (XI_WIDTH*7));
    fifo_26_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*7)-1 downto (XI_WIDTH*6));
    fifo_27_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*6)-1 downto (XI_WIDTH*5));
    fifo_28_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*5)-1 downto (XI_WIDTH*4));
    fifo_29_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*4)-1 downto (XI_WIDTH*3));
    fifo_30_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*3)-1 downto (XI_WIDTH*2));
    fifo_31_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*2)-1 downto (XI_WIDTH*1));
    fifo_32_output_signal <= fifo_MAIN_output_signal_pl(1)((XI_WIDTH*1)-1 downto (XI_WIDTH*0));



    MUX_0: entity work.muxB_4to1 generic map(DATA_WIDTH => (XI_WIDTH))
                               port map(fifo_1_output_signal, fifo_9_output_signal, fifo_17_output_signal, fifo_25_output_signal, mux_select_signal_pl(1), layer_yo_1_pl(0));

    MUX_1: entity work.muxB_4to1 generic map(DATA_WIDTH => (XI_WIDTH))
                               port map(fifo_2_output_signal, fifo_10_output_signal, fifo_18_output_signal, fifo_26_output_signal, mux_select_signal_pl(1), layer_yo_2_pl(0));

    MUX_2: entity work.muxB_4to1 generic map(DATA_WIDTH => (XI_WIDTH))
                               port map(fifo_3_output_signal, fifo_11_output_signal, fifo_19_output_signal, fifo_27_output_signal, mux_select_signal_pl(1), layer_yo_3_pl(0));

    MUX_3: entity work.muxB_4to1 generic map(DATA_WIDTH => (XI_WIDTH))
                               port map(fifo_4_output_signal, fifo_12_output_signal, fifo_20_output_signal, fifo_28_output_signal, mux_select_signal_pl(1), layer_yo_4_pl(0));

    MUX_4: entity work.muxB_4to1 generic map(DATA_WIDTH => (XI_WIDTH))
                               port map(fifo_5_output_signal, fifo_13_output_signal, fifo_21_output_signal, fifo_29_output_signal, mux_select_signal_pl(1), layer_yo_5_pl(0));

    MUX_5: entity work.muxB_4to1 generic map(DATA_WIDTH => (XI_WIDTH))
                               port map(fifo_6_output_signal, fifo_14_output_signal, fifo_22_output_signal, fifo_30_output_signal, mux_select_signal_pl(1), layer_yo_6_pl(0));

    MUX_6: entity work.muxB_4to1 generic map(DATA_WIDTH => (XI_WIDTH))
                               port map(fifo_7_output_signal, fifo_15_output_signal, fifo_23_output_signal, fifo_31_output_signal, mux_select_signal_pl(1), layer_yo_7_pl(0));

    MUX_7: entity work.muxB_4to1 generic map(DATA_WIDTH => (XI_WIDTH))
                               port map(fifo_8_output_signal, fifo_16_output_signal, fifo_24_output_signal, fifo_32_output_signal, mux_select_signal_pl(1), layer_yo_8_pl(0));


    y_valid_pl(0) <= y_valid_signal;
    sel_config_pl(0) <= std_logic_vector(config_out_select_signal);

     state_output: process(clk, reset)
    begin
        if reset = '1' then
            mux_select_signal <= (others => '0');
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
                        mux_select_signal <= (others => '0');
                        data_next <= '1';
                    else
                        state <= AWAIT_THRESHOLD;
                        debug_state_signal <= to_unsigned(0, debug_state_signal'length);
                        data_next <= '0';
                    end if;

                when LOAD_FIRST =>data_next <= '0';
                    y_valid_signal <= '1';
                    state <= FLUSH_DATA;
                    debug_state_signal <= to_unsigned(2, debug_state_signal'length);

                when FLUSH_DATA =>
                    if fifo_data_counter > 0 and fifo_hold_counter = FIFO_HOLD_CYCLES - 2  then
                        data_next <= '1'; -- Not when the next layer interleaves data! This would be the case when r_in < 1
                    else
                        data_next <= '0';
                    end if;

                    if fifo_hold_counter = to_unsigned(FIFO_HOLD_CYCLES - 1, fifo_hold_counter'length) then
                        fifo_hold_counter <= (others =>'0');
                    else
                        fifo_hold_counter <= fifo_hold_counter + 1;
                    end if;
                    
                        if mux_select_signal = to_unsigned(INPUTS_PER_MUX - 1, mux_select_signal'length) then
                            mux_select_signal <= (others =>'0');
                        else
                            mux_select_signal <= mux_select_signal + 1;
                        end if;

                    if config_out_select_signal = to_unsigned(CONFIGURATIONS - 1, config_out_select_signal'length) then
                        config_out_select_signal <= (others =>'0');
                    else
                        config_out_select_signal <= config_out_select_signal + 1;
                    end if;

                    if data_next = '0' and mux_select_signal = INPUTS_PER_MUX - 1  then
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
                report "Interleaving layer conv8_interleaving: FIFO Overflow!"
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
    PL_STEP_0_for_layer_yo_4_pl: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_4_pl(0), layer_yo_4_pl(1));
    PL_STEP_0_for_layer_yo_5_pl: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_5_pl(0), layer_yo_5_pl(1));
    PL_STEP_0_for_layer_yo_6_pl: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_6_pl(0), layer_yo_6_pl(1));
    PL_STEP_0_for_layer_yo_7_pl: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_7_pl(0), layer_yo_7_pl(1));
    PL_STEP_0_for_layer_yo_8_pl: entity work.Pipe_Vector PORT MAP(clk, '1', layer_yo_8_pl(0), layer_yo_8_pl(1));
    -- Add a pipeline step
    PL_STEP_1_for_y_valid_pl: entity work.Pipe PORT MAP(clk, '1', y_valid_pl(1), y_valid_pl(2));
    PL_STEP_1_for_sel_config_pl: entity work.Pipe_Vector PORT MAP(clk, '1', sel_config_pl(1), sel_config_pl(2));

    y_valid <= y_valid_pl(2);
    sel_config <= sel_config_pl(2);
    layer_yo_1 <= layer_yo_1_pl(1);
    layer_yo_2 <= layer_yo_2_pl(1);
    layer_yo_3 <= layer_yo_3_pl(1);
    layer_yo_4 <= layer_yo_4_pl(1);
    layer_yo_5 <= layer_yo_5_pl(1);
    layer_yo_6 <= layer_yo_6_pl(1);
    layer_yo_7 <= layer_yo_7_pl(1);
    layer_yo_8 <= layer_yo_8_pl(1);

end Behavioral;