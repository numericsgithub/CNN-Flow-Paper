LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY reg IS
	GENERIC (
		DATA_WIDTH : NATURAL := 9
	);
	PORT (
		SIGNAL clk : IN STD_LOGIC;
		SIGNAL reset : IN STD_LOGIC;
		SIGNAL d : IN STD_LOGIC_VECTOR((DATA_WIDTH - 1) DOWNTO 0);
		SIGNAL q : OUT STD_LOGIC_VECTOR((DATA_WIDTH - 1) DOWNTO 0)
	);
END reg;

ARCHITECTURE structural OF reg IS
BEGIN
	PROCESS (clk, reset)
	BEGIN
		IF reset = '1' THEN
			q <= (OTHERS => '0');
		ELSIF rising_edge(clk) THEN
			q <= d;
		END IF;
	END PROCESS;
END structural;