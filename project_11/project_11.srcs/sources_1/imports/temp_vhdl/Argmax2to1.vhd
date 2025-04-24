library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Argmax2to1 is
    generic (
        VALUE_WIDTH : natural := 8;
        INDEX_WIDTH: natural := 6
    );
    Port (
        clk   : in std_logic;

        a_value   : in  std_logic_vector(VALUE_WIDTH-1 downto 0);
        b_value   : in  std_logic_vector(VALUE_WIDTH-1 downto 0);
        a_index   : in  unsigned(INDEX_WIDTH-1 downto 0);
        b_index   : in  unsigned(INDEX_WIDTH-1 downto 0);

        max_value : out  std_logic_vector(VALUE_WIDTH-1 downto 0);
        max_index : out unsigned(INDEX_WIDTH-1 downto 0)
    );
end Argmax2to1;

architecture Behavioral of Argmax2to1 is
begin
    check_max: process(clk, a_value, b_value, a_index, b_index)
    begin
        if rising_edge(clk) then
            if signed(a_value) > signed(b_value) then
                max_index <= a_index;
                max_value <= a_value;
            else
                max_index <= b_index;
                max_value <= b_value;
            end if;
        end if;
    end process;

end Behavioral;
