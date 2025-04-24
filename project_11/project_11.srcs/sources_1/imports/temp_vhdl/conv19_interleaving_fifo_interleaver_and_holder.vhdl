library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv19_interleaving_fifo_interleaver_and_holder is
    Port (
        clk        : in  std_logic;
        rst        : in  std_logic;
        enable     : in  std_logic;
    
        data_in_1   : in std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_in_2   : in std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_in_3   : in std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_in_4   : in std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_in_5   : in std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_in_6   : in std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_in_7   : in std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_in_8   : in std_logic_vector(7-1 downto 0); --	ufix(3, -4)
    
        data_out_1  : out std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_out_2  : out std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_out_3  : out std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_out_4  : out std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_out_5  : out std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_out_6  : out std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_out_7  : out std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        data_out_8  : out std_logic_vector(7-1 downto 0); --	ufix(3, -4)
        is_last     : out std_logic;
        is_done     : out std_logic
    );
end conv19_interleaving_fifo_interleaver_and_holder;

architecture Behavioral of conv19_interleaving_fifo_interleaver_and_holder is
    constant AMOUNT_OF_MUX_INPUTS : natural := 1;
    constant AMOUNT_OF_HOLD_CYCLES : natural := 4;


    signal interleaved_data_1  : std_logic_vector(7-1 downto 0); --	ufix(3, -4)
    signal interleaved_data_2  : std_logic_vector(7-1 downto 0); --	ufix(3, -4)
    signal interleaved_data_3  : std_logic_vector(7-1 downto 0); --	ufix(3, -4)
    signal interleaved_data_4  : std_logic_vector(7-1 downto 0); --	ufix(3, -4)
    signal interleaved_data_5  : std_logic_vector(7-1 downto 0); --	ufix(3, -4)
    signal interleaved_data_6  : std_logic_vector(7-1 downto 0); --	ufix(3, -4)
    signal interleaved_data_7  : std_logic_vector(7-1 downto 0); --	ufix(3, -4)
    signal interleaved_data_8  : std_logic_vector(7-1 downto 0); --	ufix(3, -4)

    signal interleaver_enable  : std_logic;
    signal interleaver_is_last  : std_logic;
    signal interleaver_is_done  : std_logic;

    signal holder_enable  : std_logic;
    signal holder_is_last  : std_logic;
    signal holder_is_done  : std_logic;
begin
    holder_enable <= enable;

    INTERLEAVER: entity work.conv19_interleaving_fifo_interleaver
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
    
        data_out_1 => interleaved_data_1,
        data_out_2 => interleaved_data_2,
        data_out_3 => interleaved_data_3,
        data_out_4 => interleaved_data_4,
        data_out_5 => interleaved_data_5,
        data_out_6 => interleaved_data_6,
        data_out_7 => interleaved_data_7,
        data_out_8 => interleaved_data_8,

        is_last => interleaver_is_last,
        is_done => interleaver_is_done
    );

    HOLDER: entity work.conv19_interleaving_fifo_holder
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
    
        data_out_1 => data_out_1,
        data_out_2 => data_out_2,
        data_out_3 => data_out_3,
        data_out_4 => data_out_4,
        data_out_5 => data_out_5,
        data_out_6 => data_out_6,
        data_out_7 => data_out_7,
        data_out_8 => data_out_8,

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