library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

LIBRARY work;
USE work.Components.ALL;

-- This entity interleaves 32 input signals to 32 output signals
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

entity conv3_interleaving_fifo_interleaver is
    generic (KEEP_AT_FIRST_RUN : std_logic := '1');
    Port (
        clk      : in  std_logic;
        rst      : in  std_logic;
        enable   : in  std_logic;
    
        data_in_1   : in std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_in_2   : in std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_in_3   : in std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_in_4   : in std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_in_5   : in std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_in_6   : in std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_in_7   : in std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_in_8   : in std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_in_9   : in std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_in_10   : in std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_in_11   : in std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_in_12   : in std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_in_13   : in std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_in_14   : in std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_in_15   : in std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_in_16   : in std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_in_17   : in std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_in_18   : in std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_in_19   : in std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_in_20   : in std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_in_21   : in std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_in_22   : in std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_in_23   : in std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_in_24   : in std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_in_25   : in std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_in_26   : in std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_in_27   : in std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_in_28   : in std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_in_29   : in std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_in_30   : in std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_in_31   : in std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_in_32   : in std_logic_vector(7-1 downto 0); --	ufix(5, -2)
    
        data_out_1  : out std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_out_2  : out std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_out_3  : out std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_out_4  : out std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_out_5  : out std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_out_6  : out std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_out_7  : out std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_out_8  : out std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_out_9  : out std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_out_10  : out std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_out_11  : out std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_out_12  : out std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_out_13  : out std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_out_14  : out std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_out_15  : out std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_out_16  : out std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_out_17  : out std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_out_18  : out std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_out_19  : out std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_out_20  : out std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_out_21  : out std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_out_22  : out std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_out_23  : out std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_out_24  : out std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_out_25  : out std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_out_26  : out std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_out_27  : out std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_out_28  : out std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_out_29  : out std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_out_30  : out std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_out_31  : out std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        data_out_32  : out std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        is_last     : out std_logic; -- Is one when the last set was reached
        is_done     : out std_logic  -- Is set when the last set was finished and it wrapped around to the first set of inputs. (So is_done comes right at the next clock cycle after is_last basically)
    );
end conv3_interleaving_fifo_interleaver;

architecture Behavioral of conv3_interleaving_fifo_interleaver is
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
    data_out_9 <= data_in_9;
    data_out_10 <= data_in_10;
    data_out_11 <= data_in_11;
    data_out_12 <= data_in_12;
    data_out_13 <= data_in_13;
    data_out_14 <= data_in_14;
    data_out_15 <= data_in_15;
    data_out_16 <= data_in_16;
    data_out_17 <= data_in_17;
    data_out_18 <= data_in_18;
    data_out_19 <= data_in_19;
    data_out_20 <= data_in_20;
    data_out_21 <= data_in_21;
    data_out_22 <= data_in_22;
    data_out_23 <= data_in_23;
    data_out_24 <= data_in_24;
    data_out_25 <= data_in_25;
    data_out_26 <= data_in_26;
    data_out_27 <= data_in_27;
    data_out_28 <= data_in_28;
    data_out_29 <= data_in_29;
    data_out_30 <= data_in_30;
    data_out_31 <= data_in_31;
    data_out_32 <= data_in_32;
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