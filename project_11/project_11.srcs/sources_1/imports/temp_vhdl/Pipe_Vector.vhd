library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library std;

LIBRARY work;
USE work.ALL;

entity Pipe_Vector is
  generic
    (
        STEPS        	: natural := 1
    );
    Port (
        clk    : in std_logic;
        enable : in std_logic;
        xi     : in std_logic_vector;
        yo     : out std_logic_vector
    );
end Pipe_Vector;

architecture Behavioral of Pipe_Vector is

    --attribute KEEP_HIERARCHY : string;
    --attribute KEEP_HIERARCHY of Pipe_Vector : entity is "yes";

begin

    PIPELINING_DEACTIVATED: if STEPS = 0 generate
        yo <= xi;
    end generate;

    PIPELINING_ACTIVATED: if STEPS > 0 generate
        RegBuffer: entity work.DelayReg
            generic map(
                WL => xi'length,
                BL => STEPS)
            port map(
                clk  => clk,
                clearOnHigh => '0',
                enable => enable,
                Din  => xi,
                Dout => yo
            );
    end generate;
end Behavioral;
