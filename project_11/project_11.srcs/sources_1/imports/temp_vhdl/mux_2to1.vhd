library IEEE;
use IEEE.std_logic_1164.all;
USE ieee.std_logic_signed.all;	

entity mux_2to1 is
	generic 
			(
				DATA_WIDTH : natural := 31
			);
	port
		(	
			signal a 	: 	in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal b 	: 	in std_logic_vector((DATA_WIDTH-1) downto 0);
			signal sel 	:	in std_logic;--select signal
			signal o    :	out std_logic_vector((DATA_WIDTH-1) downto 0)
		);
end mux_2to1;

architecture rtl of mux_2to1 is
begin
	process(a, b, sel)
	begin
		case sel is
			when '1' =>  o <= a;
			when others =>  o <= b;	
		end case;
	end process;
end rtl;
