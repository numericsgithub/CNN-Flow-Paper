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

entity conv13_interleaving_fifo_holder is
    Generic (KEEP_AT_FIRST_RUN : std_logic := '1');
    Port (
        clk        : in  std_logic;
        rst        : in  std_logic;
        enable     : in  std_logic;
    
        data_in_1   : in std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_in_2   : in std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_in_3   : in std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_in_4   : in std_logic_vector(7-1 downto 0); --	ufix(3, -4)
    
        data_out_1  : out std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_out_2  : out std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_out_3  : out std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_out_4  : out std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        is_last     : out std_logic; -- is set when the time to hold the signal is almost over. It is set when the last hold cycle is reached.
        is_done     : out std_logic -- is set when the last hold cycle is over.
    );
end conv13_interleaving_fifo_holder;

architecture Behavioral of conv13_interleaving_fifo_holder is
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