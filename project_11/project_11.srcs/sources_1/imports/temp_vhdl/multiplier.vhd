library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity multiplier is
	generic
		(
			A_WIDTH : natural := 18;
			B_WIDTH : natural := 18
		);
	port
		(
			a	   : in 	std_logic_vector	((A_WIDTH-1) downto 0);
			b	   : in 	std_logic_vector	((B_WIDTH-1) downto 0);
			p	   : out std_logic_vector 	((A_WIDTH+B_WIDTH-1) downto 0)
		);
end entity;

architecture use_dsp of multiplier is
--   attribute multstyle : string;
--   attribute multstyle of use_dsp : architecture is "dsp";
	attribute use_dsp : string; 
   	attribute use_dsp of p : signal is "yes";
begin
	p <= a * b;
end use_dsp;

architecture use_logic of multiplier is
--   attribute multstyle : string;
--   attribute multstyle of use_logic : architecture is "logic";
	attribute use_dsp : string; 
   	attribute use_dsp of p : signal is "no";
begin
	p <= a * b;
end use_logic;
