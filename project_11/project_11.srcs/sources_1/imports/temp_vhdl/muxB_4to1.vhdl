library IEEE;
use IEEE.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity muxB_4to1 is
	generic
			(
				DATA_WIDTH : natural := 31;
				N          : natural := 4
			);
	port
		(
			signal xi_1  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_2  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_3  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_4  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal sel 	: in std_logic_vector((bits(N - 1) - 1) downto 0);

			signal yo   : out std_logic_vector((DATA_WIDTH-1) downto 0)
		);
end muxB_4to1;

architecture rtl of muxB_4to1 is
begin
	process(xi_1,xi_2,xi_3,xi_4, sel)
	begin
		case to_integer(unsigned(sel)) is
            when 0 =>  yo <= xi_1;
            when 1 =>  yo <= xi_2;
            when 2 =>  yo <= xi_3;
            when 3 =>  yo <= xi_4;
			when others =>  yo <= (others => '0');
		end case;
	end process;
end rtl;