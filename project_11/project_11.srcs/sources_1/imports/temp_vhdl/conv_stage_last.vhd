library IEEE;
use IEEE.std_logic_1164.all;
USE ieee.std_logic_signed.all;
use ieee.numeric_std.all;

LIBRARY work;
USE work.ALL;

entity conv_stage_last is
	generic
			(
				XI_WIDTH	: natural:= 9;
				WI_WIDTH : natural:= 16
			);
	port
		(
			xi: in 	std_logic_vector((XI_WIDTH+WI_WIDTH-1) downto 0);--input range 0-255, 9 bits are needed in 2s complement.  sign extension is needed before multiplication
			yi: in 	std_logic_vector((XI_WIDTH+WI_WIDTH-1) downto 0);--the output of multiplier is 32 bits.
			yo: out 	std_logic_vector((XI_WIDTH+WI_WIDTH-1) downto 0)
		);
end conv_stage_last;

architecture structural of conv_stage_last is 
	component adder
		generic
		(
			DATA_WIDTH : natural := 25
		);

		port 
		(
			a	   	: in 	std_logic_vector	((DATA_WIDTH-1) downto 0);
			b	   	: in 	std_logic_vector	((DATA_WIDTH-1) downto 0);
			result 	: out std_logic_vector 	((DATA_WIDTH-1) downto 0)
		);
	end component;
begin		
	block_1	:	adder	generic map(DATA_WIDTH => (XI_WIDTH+WI_WIDTH))
							port map(yi, xi, yo);
end structural;