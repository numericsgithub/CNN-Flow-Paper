library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

-- This entity does pretty much nothing actually!
-- The input should hold the inputs for AMOUNT_OF_HOLD_CYCLES cycles.
-- This entity is not really holding the inputs. There are no registers involved!
-- It is assumed that the inputs are kept. But what does this entity then?
-- This entity keeps track of the holding process!
-- The is_last and is_done flag are set to allow the parent entity to actually keep the input.
-- is_last is set when the time to hold the signal is almost over. It is set when the last hold cycle is reached.
-- is_done is set when the last hold cycle is over.

entity conv7_interleaving_fifo_holder is
    Generic (KEEP_AT_FIRST_RUN : std_logic := '1');
    Port (
        clk        : in  std_logic;
        rst        : in  std_logic;
        enable     : in  std_logic;
    
        data_in_1   : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_in_2   : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_in_3   : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_in_4   : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_in_5   : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_in_6   : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_in_7   : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_in_8   : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_in_9   : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_in_10   : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_in_11   : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_in_12   : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_in_13   : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_in_14   : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_in_15   : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_in_16   : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_in_17   : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_in_18   : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_in_19   : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_in_20   : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_in_21   : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_in_22   : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_in_23   : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_in_24   : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_in_25   : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_in_26   : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_in_27   : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_in_28   : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_in_29   : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_in_30   : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_in_31   : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_in_32   : in std_logic_vector(7-1 downto 0); --	ufix(4, -3)
    
        data_out_1  : out std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_out_2  : out std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_out_3  : out std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_out_4  : out std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_out_5  : out std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_out_6  : out std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_out_7  : out std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_out_8  : out std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_out_9  : out std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_out_10  : out std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_out_11  : out std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_out_12  : out std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_out_13  : out std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_out_14  : out std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_out_15  : out std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_out_16  : out std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_out_17  : out std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_out_18  : out std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_out_19  : out std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_out_20  : out std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_out_21  : out std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_out_22  : out std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_out_23  : out std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_out_24  : out std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_out_25  : out std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_out_26  : out std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_out_27  : out std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_out_28  : out std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_out_29  : out std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_out_30  : out std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_out_31  : out std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        data_out_32  : out std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        is_last     : out std_logic; -- is set when the time to hold the signal is almost over. It is set when the last hold cycle is reached.
        is_done     : out std_logic -- is set when the last hold cycle is over.
    );
end conv7_interleaving_fifo_holder;

architecture Behavioral of conv7_interleaving_fifo_holder is
    constant AMOUNT_OF_HOLD_CYCLES : natural := 4;

    signal hold_counter         : integer range 0 to AMOUNT_OF_HOLD_CYCLES; -- keeps track of the amount cycles the input was already holded.
    signal DEBUG_hold_counter   : unsigned(bits(AMOUNT_OF_HOLD_CYCLES-1)-1 downto 0);
    signal is_first_run         : std_logic;
begin
    DEBUG_hold_counter <= to_unsigned(hold_counter, DEBUG_hold_counter'length);
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
    process_hold_counter: process(clk, rst, enable)
    begin
        if rst = '1' then
            hold_counter  <= 0;
            is_last <= '0';
            is_done <= '0';
            is_first_run <= KEEP_AT_FIRST_RUN;
        elsif rising_edge(clk) and enable = '1' then
            is_first_run <= '0';
            if hold_counter = AMOUNT_OF_HOLD_CYCLES - 1 then
                hold_counter <= 0;
                if is_first_run = '0' then
                    is_done <= '1';
                else
                    is_done <= '0';
                end if;
            else
                hold_counter <= hold_counter + 1;
                is_done <= '0';
            end if;

            if hold_counter = AMOUNT_OF_HOLD_CYCLES - 2 then
                is_last <= '1';
            else
                is_last <= '0';
            end if;
        end if;
    end process;
end Behavioral;