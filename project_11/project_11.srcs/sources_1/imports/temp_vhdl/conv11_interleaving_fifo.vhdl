library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv11_interleaving_fifo is
    Port (
        clk    : in  std_logic;
        rst    : in  std_logic;
        enable : in  std_logic;

    
        data_in_1   : in std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_in_2   : in std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_in_3   : in std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_in_4   : in std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_in_5   : in std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_in_6   : in std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_in_7   : in std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_in_8   : in std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_in_9   : in std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_in_10   : in std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_in_11   : in std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_in_12   : in std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_in_13   : in std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_in_14   : in std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_in_15   : in std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_in_16   : in std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_in_is_valid : in  std_logic;
    
        data_out_1  : out std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_out_2  : out std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_out_3  : out std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_out_4  : out std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_out_5  : out std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_out_6  : out std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_out_7  : out std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_out_8  : out std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_out_9  : out std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_out_10  : out std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_out_11  : out std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_out_12  : out std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_out_13  : out std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_out_14  : out std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_out_15  : out std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_out_16  : out std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_out_is_valid : out  std_logic;
        data_is_available : out  std_logic
    );
end conv11_interleaving_fifo;

architecture Behavioral of conv11_interleaving_fifo is
    constant AMOUNT_OF_MUX_INPUTS : natural := 1;
    constant AMOUNT_OF_HOLD_CYCLES : natural := 4;
    constant AMOUNT_OF_INPUTS : natural := 16;
    constant XI_WIDTH : natural := 7;
    constant FIFO_SIZE : natural := 4;

    signal inter_and_holder_enable   : std_logic;

    signal fifo_1_output_signal   : std_logic_vector(7-1 downto 0); --	ufix(3, -4)
    signal fifo_2_output_signal   : std_logic_vector(7-1 downto 0); --	ufix(3, -4)
    signal fifo_3_output_signal   : std_logic_vector(7-1 downto 0); --	ufix(3, -4)
    signal fifo_4_output_signal   : std_logic_vector(7-1 downto 0); --	ufix(3, -4)
    signal fifo_5_output_signal   : std_logic_vector(7-1 downto 0); --	ufix(3, -4)
    signal fifo_6_output_signal   : std_logic_vector(7-1 downto 0); --	ufix(3, -4)
    signal fifo_7_output_signal   : std_logic_vector(7-1 downto 0); --	ufix(3, -4)
    signal fifo_8_output_signal   : std_logic_vector(7-1 downto 0); --	ufix(3, -4)
    signal fifo_9_output_signal   : std_logic_vector(7-1 downto 0); --	ufix(3, -4)
    signal fifo_10_output_signal   : std_logic_vector(7-1 downto 0); --	ufix(3, -4)
    signal fifo_11_output_signal   : std_logic_vector(7-1 downto 0); --	ufix(3, -4)
    signal fifo_12_output_signal   : std_logic_vector(7-1 downto 0); --	ufix(3, -4)
    signal fifo_13_output_signal   : std_logic_vector(7-1 downto 0); --	ufix(3, -4)
    signal fifo_14_output_signal   : std_logic_vector(7-1 downto 0); --	ufix(3, -4)
    signal fifo_15_output_signal   : std_logic_vector(7-1 downto 0); --	ufix(3, -4)
    signal fifo_16_output_signal   : std_logic_vector(7-1 downto 0); --	ufix(3, -4)

    signal interleaved_data_1   : std_logic_vector(7-1 downto 0); --	ufix(3, -4)
    signal interleaved_data_2   : std_logic_vector(7-1 downto 0); --	ufix(3, -4)
    signal interleaved_data_3   : std_logic_vector(7-1 downto 0); --	ufix(3, -4)
    signal interleaved_data_4   : std_logic_vector(7-1 downto 0); --	ufix(3, -4)
    signal interleaved_data_5   : std_logic_vector(7-1 downto 0); --	ufix(3, -4)
    signal interleaved_data_6   : std_logic_vector(7-1 downto 0); --	ufix(3, -4)
    signal interleaved_data_7   : std_logic_vector(7-1 downto 0); --	ufix(3, -4)
    signal interleaved_data_8   : std_logic_vector(7-1 downto 0); --	ufix(3, -4)
    signal interleaved_data_9   : std_logic_vector(7-1 downto 0); --	ufix(3, -4)
    signal interleaved_data_10   : std_logic_vector(7-1 downto 0); --	ufix(3, -4)
    signal interleaved_data_11   : std_logic_vector(7-1 downto 0); --	ufix(3, -4)
    signal interleaved_data_12   : std_logic_vector(7-1 downto 0); --	ufix(3, -4)
    signal interleaved_data_13   : std_logic_vector(7-1 downto 0); --	ufix(3, -4)
    signal interleaved_data_14   : std_logic_vector(7-1 downto 0); --	ufix(3, -4)
    signal interleaved_data_15   : std_logic_vector(7-1 downto 0); --	ufix(3, -4)
    signal interleaved_data_16   : std_logic_vector(7-1 downto 0); --	ufix(3, -4)
begin


    data_out_is_valid <= inter_and_holder_enable;
    data_out_1 <= interleaved_data_1;
    data_out_is_valid <= inter_and_holder_enable;
    data_out_2 <= interleaved_data_2;
    data_out_is_valid <= inter_and_holder_enable;
    data_out_3 <= interleaved_data_3;
    data_out_is_valid <= inter_and_holder_enable;
    data_out_4 <= interleaved_data_4;
    data_out_is_valid <= inter_and_holder_enable;
    data_out_5 <= interleaved_data_5;
    data_out_is_valid <= inter_and_holder_enable;
    data_out_6 <= interleaved_data_6;
    data_out_is_valid <= inter_and_holder_enable;
    data_out_7 <= interleaved_data_7;
    data_out_is_valid <= inter_and_holder_enable;
    data_out_8 <= interleaved_data_8;
    data_out_is_valid <= inter_and_holder_enable;
    data_out_9 <= interleaved_data_9;
    data_out_is_valid <= inter_and_holder_enable;
    data_out_10 <= interleaved_data_10;
    data_out_is_valid <= inter_and_holder_enable;
    data_out_11 <= interleaved_data_11;
    data_out_is_valid <= inter_and_holder_enable;
    data_out_12 <= interleaved_data_12;
    data_out_is_valid <= inter_and_holder_enable;
    data_out_13 <= interleaved_data_13;
    data_out_is_valid <= inter_and_holder_enable;
    data_out_14 <= interleaved_data_14;
    data_out_is_valid <= inter_and_holder_enable;
    data_out_15 <= interleaved_data_15;
    data_out_is_valid <= inter_and_holder_enable;
    data_out_16 <= interleaved_data_16;

    INPUT_FIFO: entity work.conv11_interleaving_fifo_fifo_flusher
    port map
    (
        clk => clk,
        rst => rst,
        enable => enable,
        data_in_1 => data_in_1,
        data_in_2 => data_in_2,
        data_in_3 => data_in_3,
        data_in_4 => data_in_4,
        data_in_5 => data_in_5,
        data_in_6 => data_in_6,
        data_in_7 => data_in_7,
        data_in_8 => data_in_8,
        data_in_9 => data_in_9,
        data_in_10 => data_in_10,
        data_in_11 => data_in_11,
        data_in_12 => data_in_12,
        data_in_13 => data_in_13,
        data_in_14 => data_in_14,
        data_in_15 => data_in_15,
        data_in_16 => data_in_16,
        data_in_is_valid => data_in_is_valid,
    
        data_out_1 => fifo_1_output_signal,
        data_out_2 => fifo_2_output_signal,
        data_out_3 => fifo_3_output_signal,
        data_out_4 => fifo_4_output_signal,
        data_out_5 => fifo_5_output_signal,
        data_out_6 => fifo_6_output_signal,
        data_out_7 => fifo_7_output_signal,
        data_out_8 => fifo_8_output_signal,
        data_out_9 => fifo_9_output_signal,
        data_out_10 => fifo_10_output_signal,
        data_out_11 => fifo_11_output_signal,
        data_out_12 => fifo_12_output_signal,
        data_out_13 => fifo_13_output_signal,
        data_out_14 => fifo_14_output_signal,
        data_out_15 => fifo_15_output_signal,
        data_out_16 => fifo_16_output_signal,
        data_out_is_valid => inter_and_holder_enable,
        data_is_available => data_is_available
    );

    INTERLEAVER_AND_HOLDER: entity work.conv11_interleaving_fifo_interleaver_and_holder
    port map
    (
        clk => clk,
        rst => rst,
        enable => inter_and_holder_enable,
    
        data_in_1 => fifo_1_output_signal,
        data_in_2 => fifo_2_output_signal,
        data_in_3 => fifo_3_output_signal,
        data_in_4 => fifo_4_output_signal,
        data_in_5 => fifo_5_output_signal,
        data_in_6 => fifo_6_output_signal,
        data_in_7 => fifo_7_output_signal,
        data_in_8 => fifo_8_output_signal,
        data_in_9 => fifo_9_output_signal,
        data_in_10 => fifo_10_output_signal,
        data_in_11 => fifo_11_output_signal,
        data_in_12 => fifo_12_output_signal,
        data_in_13 => fifo_13_output_signal,
        data_in_14 => fifo_14_output_signal,
        data_in_15 => fifo_15_output_signal,
        data_in_16 => fifo_16_output_signal,
    
        data_out_1 => interleaved_data_1,
        data_out_2 => interleaved_data_2,
        data_out_3 => interleaved_data_3,
        data_out_4 => interleaved_data_4,
        data_out_5 => interleaved_data_5,
        data_out_6 => interleaved_data_6,
        data_out_7 => interleaved_data_7,
        data_out_8 => interleaved_data_8,
        data_out_9 => interleaved_data_9,
        data_out_10 => interleaved_data_10,
        data_out_11 => interleaved_data_11,
        data_out_12 => interleaved_data_12,
        data_out_13 => interleaved_data_13,
        data_out_14 => interleaved_data_14,
        data_out_15 => interleaved_data_15,
        data_out_16 => interleaved_data_16,

        is_last => open,
        is_done => open
    );
end Behavioral;