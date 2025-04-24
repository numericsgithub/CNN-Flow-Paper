library ieee;
use ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

entity adder is
	generic
		(
			DATA_WIDTH : natural := 36
		);
	port 
		(
			a	   	: in	std_logic_vector ((DATA_WIDTH-1) downto 0);
			b	   	: in 	std_logic_vector ((DATA_WIDTH-1) downto 0);
			result 	: out std_logic_vector ((DATA_WIDTH-1) downto 0)
		);
end entity;

architecture rtl of adder is
	--attribute use_dsp48 : string; 
   	--attribute use_dsp48 of result : signal is "yes";
begin

	result <= a + b;

end rtl;
