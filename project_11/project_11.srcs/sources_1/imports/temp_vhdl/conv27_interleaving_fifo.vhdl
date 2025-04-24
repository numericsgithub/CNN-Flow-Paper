library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv27_interleaving_fifo is
    Port (
        clk    : in  std_logic;
        rst    : in  std_logic;
        enable : in  std_logic;

    
        data_in_1   : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_in_2   : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_in_3   : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_in_4   : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_in_is_valid : in  std_logic;
    
        data_out_1  : out std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_out_2  : out std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_out_3  : out std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_out_4  : out std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_out_is_valid : out  std_logic;
        data_is_available : out  std_logic
    );
end conv27_interleaving_fifo;

architecture Behavioral of conv27_interleaving_fifo is
    constant AMOUNT_OF_MUX_INPUTS : natural := 1;
    constant AMOUNT_OF_HOLD_CYCLES : natural := 4;
    constant AMOUNT_OF_INPUTS : natural := 4;
    constant XI_WIDTH : natural := 7;
    constant FIFO_SIZE : natural := 4;

    signal inter_and_holder_enable   : std_logic;

    signal fifo_1_output_signal   : std_logic_vector(7-1 downto 0); --	ufix(4, -3)
    signal fifo_2_output_signal   : std_logic_vector(7-1 downto 0); --	ufix(4, -3)
    signal fifo_3_output_signal   : std_logic_vector(7-1 downto 0); --	ufix(4, -3)
    signal fifo_4_output_signal   : std_logic_vector(7-1 downto 0); --	ufix(4, -3)

    signal interleaved_data_1   : std_logic_vector(7-1 downto 0); --	ufix(4, -3)
    signal interleaved_data_2   : std_logic_vector(7-1 downto 0); --	ufix(4, -3)
    signal interleaved_data_3   : std_logic_vector(7-1 downto 0); --	ufix(4, -3)
    signal interleaved_data_4   : std_logic_vector(7-1 downto 0); --	ufix(4, -3)
begin


    data_out_is_valid <= inter_and_holder_enable;
    data_out_1 <= interleaved_data_1;
    data_out_is_valid <= inter_and_holder_enable;
    data_out_2 <= interleaved_data_2;
    data_out_is_valid <= inter_and_holder_enable;
    data_out_3 <= interleaved_data_3;
    data_out_is_valid <= inter_and_holder_enable;
    data_out_4 <= interleaved_data_4;

    INPUT_FIFO: entity work.conv27_interleaving_fifo_fifo_flusher
    port map
    (
        clk => clk,
        rst => rst,
        enable => enable,
        data_in_1 => data_in_1,
        data_in_2 => data_in_2,
        data_in_3 => data_in_3,
        data_in_4 => data_in_4,
        data_in_is_valid => data_in_is_valid,
    
        data_out_1 => fifo_1_output_signal,
        data_out_2 => fifo_2_output_signal,
        data_out_3 => fifo_3_output_signal,
        data_out_4 => fifo_4_output_signal,
        data_out_is_valid => inter_and_holder_enable,
        data_is_available => data_is_available
    );

    INTERLEAVER_AND_HOLDER: entity work.conv27_interleaving_fifo_interleaver_and_holder
    port map
    (
        clk => clk,
        rst => rst,
        enable => inter_and_holder_enable,
    
        data_in_1 => fifo_1_output_signal,
        data_in_2 => fifo_2_output_signal,
        data_in_3 => fifo_3_output_signal,
        data_in_4 => fifo_4_output_signal,
    
        data_out_1 => interleaved_data_1,
        data_out_2 => interleaved_data_2,
        data_out_3 => interleaved_data_3,
        data_out_4 => interleaved_data_4,

        is_last => open,
        is_done => open
    );
end Behavioral;