-------------------------------------------------------------------------------
-- File Downloaded from http://www.nandland.com
--
-- Description: Creates a Synchronous FIFO made out of registers.
--              Generic: XI_WIDTH sets the width of the FIFO created.
--              Generic: XI_DEPTH sets the depth of the FIFO created.
--
--              Total FIFO register usage will be width * depth
--              Note that this fifo should not be used to cross clock domains.
--              (Read and write clocks NEED TO BE the same clock domain)
--
--              FIFO Full Flag will assert as soon as last word is written.
--              FIFO Empty Flag will assert as soon as last word is read.
--
--              FIFO is 100% synthesizable.  It uses assert statements which do
--              not synthesize, but will cause your simulation to crash if you
--              are doing something you shouldn't be doing (reading from an
--              empty FIFO or writing to a full FIFO).
--
--              No Flags = No Almost Full (AF)/Almost Empty (AE) Flags
--              There is a separate module that has programmable AF/AE flags.
-------------------------------------------------------------------------------
 
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity fifo_master_generator is
  generic (
    XI_WIDTH : natural := 8;
    XI_DEPTH : natural := 32
    );
  port (
    reset           : in std_logic;
    clk             : in std_logic;
    -- FIFO Write Interface
    write_en        : in  std_logic;
    data_in         : in  std_logic_vector(XI_WIDTH-1 downto 0);
    full_flag       : out std_logic;
    -- FIFO Read Interface
    read_en         : in  std_logic;
    data_out        : out std_logic_vector(XI_WIDTH-1 downto 0);
    empty_flag      : out std_logic;
    data_available      : out std_logic
    );
end fifo_master_generator;

architecture fifo_arch of fifo_master_generator is

  type t_FIFO_DATA is array (0 to XI_DEPTH-1) of std_logic_vector(XI_WIDTH-1 downto 0);
  signal data_bank_register : t_FIFO_DATA;

  attribute ram_style : string;
  attribute ram_style of data_bank_register : signal is "BLOCK";

  signal write_index   : integer range 0 to XI_DEPTH-1;
  signal read_index   : integer range 0 to XI_DEPTH-1;

  signal fifo_words_count : integer range 0 to XI_DEPTH-1;

  signal full_signal  : std_logic;
  signal empty_signal : std_logic;

begin

    DEBUG_DETECT_ERRORS: process (clk) is -- , fifo_words_count, write_en, read_en, empty_signal, full_signal
    begin
        if rising_edge(clk) then
            if read_en = '1' and empty_signal = '1' then
                report "READING EMPTY FIFO" severity FAILURE;
            end if;
            if write_en = '1' and full_signal = '1' then
                report "WRITING INTO FULL FIFO" severity FAILURE;
            end if;
        end if;
    end process;


    MAIN_CRONTOL_LOGIC : process (clk) is
    begin
        if rising_edge(clk) then
            if reset = '1'  then
                fifo_words_count <= 0;
                write_index <= 0;
                read_index  <= 0;
                data_out    <= (others => '0');
            else
                -- Keeps track of the total number of words in the FIFO
                if write_en = '1' and read_en = '1' then
                    fifo_words_count <= fifo_words_count;
                elsif write_en = '1' and read_en = '0' then
                    if full_signal = '0' then
                        fifo_words_count <= fifo_words_count + 1;
                    end if;
                elsif write_en = '0' and read_en = '1' then
                    if empty_signal = '0' then
                        fifo_words_count <= fifo_words_count - 1;
                    end if;
                else
                    fifo_words_count <= fifo_words_count;
                end if;
                -- Keeps track of the write index (and controls roll-over)
                if write_en = '1' and full_signal = '0' then
                    if write_index = XI_DEPTH-1 then
                        write_index <= 0;
                    else
                        write_index <= write_index + 1;
                    end if;
                end if;
                -- Keeps track of the read index (and controls roll-over)
                if read_en = '1' and empty_signal = '0' then
                    if read_index = XI_DEPTH-1 then
                        read_index <= 0;
                    else
                        read_index <= read_index + 1;
                    end if;
                end if;
                -- Registers the input data when there is a write
                if write_en = '1' and full_signal = '0' then
                    data_bank_register(write_index) <= data_in;
                end if;
                -- Set the output data when there is a read request
                if read_en = '1' and empty_signal = '0' then
                    data_out <= data_bank_register(read_index);
                end if;
            end if;
        end if;
    end process;

    full_signal  <= '1' when fifo_words_count = XI_DEPTH else '0';
    empty_signal <= '1' when fifo_words_count = 0        else '0';
    --data_available <= '0' when fifo_words_count = 0 else '1';

    DETECT_AVAILABLE: process(fifo_words_count, read_en, write_en)
    begin
        if fifo_words_count = 0 then
            data_available <= '0';
        else
            if fifo_words_count = 1 and read_en = '1' and write_en = '0' then
                data_available <= '0';
            else
                data_available <= '1';
            end if;
        end if;
    end process;

    full_flag  <= full_signal;
    empty_flag <= empty_signal;

end fifo_arch;