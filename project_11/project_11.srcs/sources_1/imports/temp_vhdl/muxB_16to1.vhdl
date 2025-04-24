library IEEE;
use IEEE.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE IEEE.numeric_std.ALL;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity muxB_16to1 is
	generic
			(
				DATA_WIDTH : natural := 31;
				N          : natural := 16
			);
	port
		(
			signal xi_1  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_2  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_3  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_4  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_5  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_6  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_7  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_8  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_9  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_10  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_11  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_12  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_13  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_14  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_15  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal xi_16  : in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal sel 	: in std_logic_vector((bits(N - 1) - 1) downto 0);

			signal yo   : out std_logic_vector((DATA_WIDTH-1) downto 0)
		);
end muxB_16to1;

architecture rtl of muxB_16to1 is
begin
	process(xi_1,xi_2,xi_3,xi_4,xi_5,xi_6,xi_7,xi_8,xi_9,xi_10,xi_11,xi_12,xi_13,xi_14,xi_15,xi_16, sel)
	begin
		case to_integer(unsigned(sel)) is
            when 0 =>  yo <= xi_1;
            when 1 =>  yo <= xi_2;
            when 2 =>  yo <= xi_3;
            when 3 =>  yo <= xi_4;
            when 4 =>  yo <= xi_5;
            when 5 =>  yo <= xi_6;
            when 6 =>  yo <= xi_7;
            when 7 =>  yo <= xi_8;
            when 8 =>  yo <= xi_9;
            when 9 =>  yo <= xi_10;
            when 10 =>  yo <= xi_11;
            when 11 =>  yo <= xi_12;
            when 12 =>  yo <= xi_13;
            when 13 =>  yo <= xi_14;
            when 14 =>  yo <= xi_15;
            when 15 =>  yo <= xi_16;
			when others =>  yo <= (others => '0');
		end case;
	end process;
end rtl;