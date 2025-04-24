library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

LIBRARY work;
USE work.Components.ALL;

-- This entity interleaves 8 input signals to 8 output signals
-- using 1 different configurations.
-- Lets say you have 6 input signals and 2 output signals.
-- This entity would map:
--     output1 to input1, input3, input5
--     output2 to input2, input4, input6
-- So at the first clock cycle we would get input1 and input2. The next clock cycle we get input3 and input4 ...
-- The enable flag halts the process and prevents switching to the next set of inputs.
-- The is_last flag marks the last set. So in the example the flag is set the moment input5 and input6 are set.
-- The is_done flag comes one cycle after it and marks when the process has wrapped around from the last back to first again.
-- So is_done is set in the example right at the moment when it wraps around where input1 and input2 are set again.

entity conv15_interleaving_fifo_interleaver is
    generic (KEEP_AT_FIRST_RUN : std_logic := '1');
    Port (
        clk      : in  std_logic;
        rst      : in  std_logic;
        enable   : in  std_logic;
    
        data_in_1   : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_in_2   : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_in_3   : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_in_4   : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_in_5   : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_in_6   : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_in_7   : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_in_8   : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
    
        data_out_1  : out std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_out_2  : out std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_out_3  : out std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_out_4  : out std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_out_5  : out std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_out_6  : out std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_out_7  : out std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_out_8  : out std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        is_last     : out std_logic; -- Is one when the last set was reached
        is_done     : out std_logic  -- Is set when the last set was finished and it wrapped around to the first set of inputs. (So is_done comes right at the next clock cycle after is_last basically)
    );
end conv15_interleaving_fifo_interleaver;

architecture Behavioral of conv15_interleaving_fifo_interleaver is
    constant AMOUNT_OF_MUX_INPUTS : natural := 1;

    signal mux_select         : integer range 0 to AMOUNT_OF_MUX_INPUTS; -- Multiplexer select signal
    signal DEBUG_mux_select   : unsigned(bits(AMOUNT_OF_MUX_INPUTS-1)-1 downto 0); -- Multiplexer select signal (for debugging using vcd)
    signal is_first_run       : std_logic; -- Is used to hold the output the very first time after a reset.
begin
    DEBUG_mux_select <= to_unsigned(mux_select, DEBUG_mux_select'length);

    data_out_1 <= data_in_1;
    data_out_2 <= data_in_2;
    data_out_3 <= data_in_3;
    data_out_4 <= data_in_4;
    data_out_5 <= data_in_5;
    data_out_6 <= data_in_6;
    data_out_7 <= data_in_7;
    data_out_8 <= data_in_8;
    is_last <= '1';
    is_done <= '1';
    --process_mux_select: process(clk, rst, enable)
    --begin
    --    if rst = '1' then
    --        is_last <= '0';
    --        is_done <= '0';
    --    elsif rising_edge(clk) and enable = '1' then
    --        is_last <= '1';
    --        is_done <= '1';
    --    end if;
    --end process;

end Behavioral;