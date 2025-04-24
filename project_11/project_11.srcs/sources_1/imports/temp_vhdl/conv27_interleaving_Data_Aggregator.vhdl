library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

package conv27_interleaving_Data_Aggregator_pkg is
    type conv27_interleaving_Data_Aggregator_output is array(4-1 downto 0) of std_logic_vector(7-1 downto 0);
end package;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.conv27_interleaving_Data_Aggregator_pkg.all;

entity conv27_interleaving_Data_Aggregator is
    Port (
        clk         : in std_logic;                          -- Taktsignal
        reset         : in std_logic;                          -- Reset-Signal
        input_1   : in std_logic_vector(7-1 downto 0);
        input_is_valid : in  std_logic;

        output_array   : out conv27_interleaving_Data_Aggregator_output;
        valid_out      : out std_logic
    );
end conv27_interleaving_Data_Aggregator;

architecture Behavioral of conv27_interleaving_Data_Aggregator is
    constant AMOUNT_OF_INPUTS : natural := 1;

    signal output_is_valid      : std_logic;                         -- Interne Valid-Flag für den Output
    signal output_array_signal  : conv27_interleaving_Data_Aggregator_output;          -- Zwischenspeicher für 8 Daten
    signal counter        : integer range 0 to output_array_signal'length;                -- Zähler für die gesammelten Daten
begin
    output_array  <= output_array_signal;



    process(clk, reset)
    begin
        if reset = '1' then
            counter         <= 0;
            output_is_valid <= '0';
            valid_out       <= '0';
        elsif rising_edge(clk) then
            assert (output_array_signal'length mod AMOUNT_OF_INPUTS = 0)
                report "Error: Total number of inputs is not divisible by the number of items in the output array!"
                severity failure;

            if input_is_valid = '1' then

                -- Daten in den Buffer schreiben
                output_array_signal(counter + 0) <= input_1;

                -- Prüfen, ob das Paket vollständig ist
                if counter >= output_array_signal'length - AMOUNT_OF_INPUTS then
                    valid_out <= '1';
                    counter   <= 0;
                else
                    counter <= counter + AMOUNT_OF_INPUTS;
                    valid_out <= '0';
                end if;
            else
                valid_out <= '0';
            end if;
        end if;
    end process;








end Behavioral;