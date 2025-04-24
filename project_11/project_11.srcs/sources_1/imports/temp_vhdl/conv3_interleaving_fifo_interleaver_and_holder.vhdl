library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv3_interleaving_fifo_interleaver_and_holder is
    Port (
        clk        : in  std_logic;
        rst        : in  std_logic;
        enable     : in  std_logic;
    
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
        is_last     : out std_logic;
        is_done     : out std_logic
    );
end conv3_interleaving_fifo_interleaver_and_holder;

architecture Behavioral of conv3_interleaving_fifo_interleaver_and_holder is
    constant AMOUNT_OF_MUX_INPUTS : natural := 1;
    constant AMOUNT_OF_HOLD_CYCLES : natural := 4;


    signal interleaved_data_1  : std_logic_vector(7-1 downto 0); --	ufix(5, -2)
    signal interleaved_data_2  : std_logic_vector(7-1 downto 0); --	ufix(5, -2)
    signal interleaved_data_3  : std_logic_vector(7-1 downto 0); --	ufix(5, -2)
    signal interleaved_data_4  : std_logic_vector(7-1 downto 0); --	ufix(5, -2)
    signal interleaved_data_5  : std_logic_vector(7-1 downto 0); --	ufix(5, -2)
    signal interleaved_data_6  : std_logic_vector(7-1 downto 0); --	ufix(5, -2)
    signal interleaved_data_7  : std_logic_vector(7-1 downto 0); --	ufix(5, -2)
    signal interleaved_data_8  : std_logic_vector(7-1 downto 0); --	ufix(5, -2)
    signal interleaved_data_9  : std_logic_vector(7-1 downto 0); --	ufix(5, -2)
    signal interleaved_data_10  : std_logic_vector(7-1 downto 0); --	ufix(5, -2)
    signal interleaved_data_11  : std_logic_vector(7-1 downto 0); --	ufix(5, -2)
    signal interleaved_data_12  : std_logic_vector(7-1 downto 0); --	ufix(5, -2)
    signal interleaved_data_13  : std_logic_vector(7-1 downto 0); --	ufix(5, -2)
    signal interleaved_data_14  : std_logic_vector(7-1 downto 0); --	ufix(5, -2)
    signal interleaved_data_15  : std_logic_vector(7-1 downto 0); --	ufix(5, -2)
    signal interleaved_data_16  : std_logic_vector(7-1 downto 0); --	ufix(5, -2)
    signal interleaved_data_17  : std_logic_vector(7-1 downto 0); --	ufix(5, -2)
    signal interleaved_data_18  : std_logic_vector(7-1 downto 0); --	ufix(5, -2)
    signal interleaved_data_19  : std_logic_vector(7-1 downto 0); --	ufix(5, -2)
    signal interleaved_data_20  : std_logic_vector(7-1 downto 0); --	ufix(5, -2)
    signal interleaved_data_21  : std_logic_vector(7-1 downto 0); --	ufix(5, -2)
    signal interleaved_data_22  : std_logic_vector(7-1 downto 0); --	ufix(5, -2)
    signal interleaved_data_23  : std_logic_vector(7-1 downto 0); --	ufix(5, -2)
    signal interleaved_data_24  : std_logic_vector(7-1 downto 0); --	ufix(5, -2)
    signal interleaved_data_25  : std_logic_vector(7-1 downto 0); --	ufix(5, -2)
    signal interleaved_data_26  : std_logic_vector(7-1 downto 0); --	ufix(5, -2)
    signal interleaved_data_27  : std_logic_vector(7-1 downto 0); --	ufix(5, -2)
    signal interleaved_data_28  : std_logic_vector(7-1 downto 0); --	ufix(5, -2)
    signal interleaved_data_29  : std_logic_vector(7-1 downto 0); --	ufix(5, -2)
    signal interleaved_data_30  : std_logic_vector(7-1 downto 0); --	ufix(5, -2)
    signal interleaved_data_31  : std_logic_vector(7-1 downto 0); --	ufix(5, -2)
    signal interleaved_data_32  : std_logic_vector(7-1 downto 0); --	ufix(5, -2)

    signal interleaver_enable  : std_logic;
    signal interleaver_is_last  : std_logic;
    signal interleaver_is_done  : std_logic;

    signal holder_enable  : std_logic;
    signal holder_is_last  : std_logic;
    signal holder_is_done  : std_logic;
begin
    holder_enable <= enable;

    INTERLEAVER: entity work.conv3_interleaving_fifo_interleaver
    generic map (KEEP_AT_FIRST_RUN => '0')
    port map
    (
        clk => clk,
        rst => rst,
        enable => interleaver_enable,
    
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
        data_in_17 => data_in_17,
        data_in_18 => data_in_18,
        data_in_19 => data_in_19,
        data_in_20 => data_in_20,
        data_in_21 => data_in_21,
        data_in_22 => data_in_22,
        data_in_23 => data_in_23,
        data_in_24 => data_in_24,
        data_in_25 => data_in_25,
        data_in_26 => data_in_26,
        data_in_27 => data_in_27,
        data_in_28 => data_in_28,
        data_in_29 => data_in_29,
        data_in_30 => data_in_30,
        data_in_31 => data_in_31,
        data_in_32 => data_in_32,
    
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
        data_out_17 => interleaved_data_17,
        data_out_18 => interleaved_data_18,
        data_out_19 => interleaved_data_19,
        data_out_20 => interleaved_data_20,
        data_out_21 => interleaved_data_21,
        data_out_22 => interleaved_data_22,
        data_out_23 => interleaved_data_23,
        data_out_24 => interleaved_data_24,
        data_out_25 => interleaved_data_25,
        data_out_26 => interleaved_data_26,
        data_out_27 => interleaved_data_27,
        data_out_28 => interleaved_data_28,
        data_out_29 => interleaved_data_29,
        data_out_30 => interleaved_data_30,
        data_out_31 => interleaved_data_31,
        data_out_32 => interleaved_data_32,

        is_last => interleaver_is_last,
        is_done => interleaver_is_done
    );

    HOLDER: entity work.conv3_interleaving_fifo_holder
    generic map (KEEP_AT_FIRST_RUN => '0')
    port map
    (
        clk => clk,
        rst => rst,
        enable => enable,
    
        data_in_1 => interleaved_data_1,
        data_in_2 => interleaved_data_2,
        data_in_3 => interleaved_data_3,
        data_in_4 => interleaved_data_4,
        data_in_5 => interleaved_data_5,
        data_in_6 => interleaved_data_6,
        data_in_7 => interleaved_data_7,
        data_in_8 => interleaved_data_8,
        data_in_9 => interleaved_data_9,
        data_in_10 => interleaved_data_10,
        data_in_11 => interleaved_data_11,
        data_in_12 => interleaved_data_12,
        data_in_13 => interleaved_data_13,
        data_in_14 => interleaved_data_14,
        data_in_15 => interleaved_data_15,
        data_in_16 => interleaved_data_16,
        data_in_17 => interleaved_data_17,
        data_in_18 => interleaved_data_18,
        data_in_19 => interleaved_data_19,
        data_in_20 => interleaved_data_20,
        data_in_21 => interleaved_data_21,
        data_in_22 => interleaved_data_22,
        data_in_23 => interleaved_data_23,
        data_in_24 => interleaved_data_24,
        data_in_25 => interleaved_data_25,
        data_in_26 => interleaved_data_26,
        data_in_27 => interleaved_data_27,
        data_in_28 => interleaved_data_28,
        data_in_29 => interleaved_data_29,
        data_in_30 => interleaved_data_30,
        data_in_31 => interleaved_data_31,
        data_in_32 => interleaved_data_32,
    
        data_out_1 => data_out_1,
        data_out_2 => data_out_2,
        data_out_3 => data_out_3,
        data_out_4 => data_out_4,
        data_out_5 => data_out_5,
        data_out_6 => data_out_6,
        data_out_7 => data_out_7,
        data_out_8 => data_out_8,
        data_out_9 => data_out_9,
        data_out_10 => data_out_10,
        data_out_11 => data_out_11,
        data_out_12 => data_out_12,
        data_out_13 => data_out_13,
        data_out_14 => data_out_14,
        data_out_15 => data_out_15,
        data_out_16 => data_out_16,
        data_out_17 => data_out_17,
        data_out_18 => data_out_18,
        data_out_19 => data_out_19,
        data_out_20 => data_out_20,
        data_out_21 => data_out_21,
        data_out_22 => data_out_22,
        data_out_23 => data_out_23,
        data_out_24 => data_out_24,
        data_out_25 => data_out_25,
        data_out_26 => data_out_26,
        data_out_27 => data_out_27,
        data_out_28 => data_out_28,
        data_out_29 => data_out_29,
        data_out_30 => data_out_30,
        data_out_31 => data_out_31,
        data_out_32 => data_out_32,

        is_last => holder_is_last,
        is_done => holder_is_done
    );

    process_interleaver_enable: process(holder_is_last, enable)
    begin
        if (holder_is_last = '1') and enable = '1' then
            interleaver_enable <= '1';
        else
            interleaver_enable <= '0';
        end if;
    end process;

    process_is_last: process(interleaver_is_last, holder_is_last, enable)
    begin
        if interleaver_is_last = '1' and holder_is_last = '1' and enable = '1' then
            is_last <= '1';
        else
            is_last <= '0';
        end if;
    end process;

    process_is_done: process(interleaver_is_done, holder_is_done, enable)
    begin
        if interleaver_is_done = '1' and holder_is_done = '1' and enable = '1' then
            is_done <= '1';
        else
            is_done <= '0';
        end if;
    end process;

end Behavioral;