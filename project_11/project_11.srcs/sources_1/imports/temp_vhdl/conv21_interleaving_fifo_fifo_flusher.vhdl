library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv21_interleaving_fifo_fifo_flusher is
    Port (
        clk    : in std_logic;
        rst    : in std_logic;
        enable : in std_logic;
    
        data_in_1   : in std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_in_2   : in std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_in_3   : in std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_in_4   : in std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_in_5   : in std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_in_6   : in std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_in_7   : in std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_in_8   : in std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_in_is_valid : in std_logic;
    
        data_out_1  : out std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_out_2  : out std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_out_3  : out std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_out_4  : out std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_out_5  : out std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_out_6  : out std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_out_7  : out std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_out_8  : out std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_out_is_valid : out std_logic;
        data_is_available  : out std_logic
    );
end conv21_interleaving_fifo_fifo_flusher;

architecture Behavioral of conv21_interleaving_fifo_fifo_flusher is
    constant AMOUNT_OF_INPUTS : natural := 8;
    constant XI_WIDTH : natural := 7;
    constant FIFO_SIZE : natural := 4;
    constant AMOUNT_OF_FLUSH_STEPS : natural := 4;

    type state_type is (NO_DATA_AVAILABLE_OR_DISABLED, FLUSH_DATA);
    signal state : state_type;

    signal flush_step_counter         : integer range 0 to AMOUNT_OF_FLUSH_STEPS+1; -- Multiplexer select signal
    signal DEBUG_flush_step_counter   : unsigned(bits(AMOUNT_OF_FLUSH_STEPS-1)-1 downto 0);

    signal fifo_input_signal   : std_logic_vector((XI_WIDTH*AMOUNT_OF_INPUTS-1) downto 0);
    signal fifo_output_signal  : std_logic_vector((XI_WIDTH*AMOUNT_OF_INPUTS-1) downto 0);
    signal fifo_output_signal_buffered  : std_logic_vector((XI_WIDTH*AMOUNT_OF_INPUTS-1) downto 0);

    signal data_next              : std_logic;
    signal data_available         : std_logic;
    signal data_out_is_valid_signal : std_logic;
    signal data_out_is_valid_signal_buffered : std_logic;
begin
    DEBUG_flush_step_counter <= to_unsigned(flush_step_counter, DEBUG_flush_step_counter'length);
    data_is_available <= data_available;

    fifo_input_signal    <= data_in_1 & data_in_2 & data_in_3 & data_in_4 & data_in_5 & data_in_6 & data_in_7 & data_in_8 ;

    data_out_1 <= fifo_output_signal((XI_WIDTH*8)-1 downto (XI_WIDTH*7));
    data_out_2 <= fifo_output_signal((XI_WIDTH*7)-1 downto (XI_WIDTH*6));
    data_out_3 <= fifo_output_signal((XI_WIDTH*6)-1 downto (XI_WIDTH*5));
    data_out_4 <= fifo_output_signal((XI_WIDTH*5)-1 downto (XI_WIDTH*4));
    data_out_5 <= fifo_output_signal((XI_WIDTH*4)-1 downto (XI_WIDTH*3));
    data_out_6 <= fifo_output_signal((XI_WIDTH*3)-1 downto (XI_WIDTH*2));
    data_out_7 <= fifo_output_signal((XI_WIDTH*2)-1 downto (XI_WIDTH*1));
    data_out_8 <= fifo_output_signal((XI_WIDTH*1)-1 downto (XI_WIDTH*0));

    SYNC_OUTPUT:process(clk)
    begin
        if rising_edge(clk) then
            fifo_output_signal <= fifo_output_signal_buffered;
            data_out_is_valid_signal_buffered <= data_out_is_valid_signal;
            data_out_is_valid <= data_out_is_valid_signal_buffered;
        end if;
    end process;


    INPUT_FIFO: entity work.fifo_master_generator generic map(XI_WIDTH => XI_WIDTH*AMOUNT_OF_INPUTS, XI_DEPTH => FIFO_SIZE)
    port map
    (
        reset => rst,
        clk   => clk,
        write_en   => data_in_is_valid,
        data_in    => fifo_input_signal,
        full_flag  => open,
        read_en    => data_next,
        data_out   => fifo_output_signal_buffered,
        empty_flag => open,
        data_available => data_available
    );

    STATE_MACHINE: process(clk, rst)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                data_next <= '0';
                flush_step_counter <= AMOUNT_OF_FLUSH_STEPS - 1;
                state <= NO_DATA_AVAILABLE_OR_DISABLED;
                data_out_is_valid_signal <= '0';
            else
                case state is
                    when NO_DATA_AVAILABLE_OR_DISABLED =>
                        if (data_available = '1' or data_in_is_valid = '1') and enable = '1' then
                            state <= FLUSH_DATA;
                            data_next <= '1';
                            flush_step_counter <= 0;
                            data_out_is_valid_signal <= '1';
                        else
                            state <= NO_DATA_AVAILABLE_OR_DISABLED;
                            data_next <= '0';
                            flush_step_counter <= AMOUNT_OF_FLUSH_STEPS - 1;
                            data_out_is_valid_signal <= '0';
                        end if;
                    when FLUSH_DATA =>
                        if flush_step_counter = AMOUNT_OF_FLUSH_STEPS - 1 then
                            if data_available = '1' and enable = '1' then
                                data_next <= '1';
                                state <= FLUSH_DATA;
                                data_out_is_valid_signal <= '1';
                            else
                                data_next <= '0';
                                state <= NO_DATA_AVAILABLE_OR_DISABLED;
                                data_out_is_valid_signal <= '0';
                            end if;
                            flush_step_counter <= 0;
                        else
                            data_next <= '0';
                            state <= FLUSH_DATA;
                            flush_step_counter <= flush_step_counter + 1;
                            data_out_is_valid_signal <= '1';
                        end if;
                end case;
            end if;
        end if;
    end process;
end Behavioral;