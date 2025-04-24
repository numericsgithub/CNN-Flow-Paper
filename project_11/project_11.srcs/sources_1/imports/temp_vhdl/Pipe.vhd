library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library std;

LIBRARY work;
USE work.ALL;

entity Pipe is
  generic
    (
        STEPS        	: natural := 1
    );
    Port (
        clk    : in std_logic;
        enable : in std_logic;
        xi     : in std_logic;
        yo     : out std_logic
    );
end Pipe;

architecture Behavioral of Pipe is

    --attribute KEEP_HIERARCHY : string;
    --attribute KEEP_HIERARCHY of Pipe : entity is "yes";

begin

    PIPELINING_DEACTIVATED: if STEPS = 0 generate
        yo <= xi;
    end generate;

    PIPELINING_ACTIVATED: if STEPS > 0 generate
        RegBuffer: entity work.Delay1Bit
            generic map(
                BL => STEPS)
            port map(
                clk  => clk,
                clearOutputOnHigh => '0',
                enable => enable,
                Din  => xi,
                Dout => yo
            );
    end generate;
end Behavioral;
