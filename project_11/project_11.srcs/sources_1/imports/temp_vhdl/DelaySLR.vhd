-- 1-bit buffer.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity DelaySRL is
    generic(
        BL:   integer:= 16); -- Buffer Length
    port(
        clk:  in std_logic;
        enable: in std_logic;
        Din:  in std_logic;
        Dout: out std_logic);
end DelaySRL;

architecture arch of DelaySRL is

    signal b: std_logic_vector(BL-1 downto 0) := (others => '0'); -- We assume that the first input sample is used to initialize all delays

    attribute srl_style : string;
    attribute srl_style of b : signal is "srl";
begin

    NoDelay: if BL = 0 generate
        Dout <= Din;
    end generate;

    RegBuffer: if BL > 0 generate

        process(clk, enable)
        begin
            if rising_edge(clk) and enable = '1' then
                b(0) <= Din;
                if (BL > 1) then
                    for i in 1 to BL -1 loop
                        b(i) <= b(i-1);
                    end loop;
                end if;
            end if;
        end process;

        Dout <= b(BL -1);

    end generate;

end arch;
