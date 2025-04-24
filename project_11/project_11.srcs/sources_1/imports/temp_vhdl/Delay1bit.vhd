Library UNISIM;
use UNISIM.vcomponents.all;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity Delay1Bit is
    generic(
        BL:   integer:= 16); -- Buffer Length
    port(
        clk               : in std_logic;
	    clearOutputOnHigh : in  std_logic;
        enable            : in std_logic;
        Din               : in std_logic;

        Dout              : out std_logic);
end Delay1Bit;

architecture arch of Delay1Bit is

    signal b: std_logic_vector(BL-1 downto 0) := (others => '0'); -- We assume that the first input sample is used to initialize all delays

    attribute srl_style : string;
    attribute srl_style of b : signal is "reg_srl_reg";
begin

    NoDelay: if BL = 0 generate
        Dout <= Din;
    end generate;

    SingleRegBuffer: if BL = 1 generate
        OnlyRegister: FDCE
            generic map ( INIT => '0') -- Initial value of register ('0' or '1')
            port map ( Q => Dout, -- Data output
                C => clk, -- Clock input
                CE => enable, -- Clock enable input
                CLR => clearOutputOnHigh, -- Asynchronous clear input
                D => Din -- Data input
            );
    end generate;

    TwoRegBuffer: if BL = 2 generate
        FIRST_Register: FDCE
            generic map ( INIT => '0') -- Initial value of register ('0' or '1')
            port map ( Q => b(0), -- Data output
                C => clk, -- Clock input
                CE => enable, -- Clock enable input
                CLR => clearOutputOnHigh, -- Asynchronous clear input
                D => Din -- Data input
            );
        LAST_Register: FDCE
            generic map ( INIT => '0') -- Initial value of register ('0' or '1')
            port map ( Q => Dout, -- Data output
                C => clk, -- Clock input
                CE => enable, -- Clock enable input
                CLR => clearOutputOnHigh, -- Asynchronous clear input
                D => b(0) -- Data input
            );
    end generate;

    RegBuffer: if BL > 2 generate

        --GenBuffer: for i in 0 to BL-1 generate
            First_Register: FDCE
                generic map ( INIT => '0') -- Initial value of register ('0' or '1')
                port map ( Q => b(0), -- Data output
                    C => clk, -- Clock input
                    CE => enable, -- Clock enable input
                    CLR => '0', --resetInput, -- Asynchronous clear input
                    D => Din -- Data input
                );

            Rest_buffers: entity work.DelaySRL
                generic map (
                    BL => BL-2)
                port map(
                    clk,
                    enable,
                    b(0),
                    b(BL-1)
                    );
            --Middle_Register_Mapping: if i /= BL-1 and i /= 0 generate
            --    Middle_Register: FDCE
            --        generic map ( INIT => '0') -- Initial value of register ('0' or '1')
            --        port map ( Q => b(i), -- Data output
            --            C => clk, -- Clock input
            --            CE => enable, -- Clock enable input
            --            CLR => '0', -- Asynchronous clear input
            --            D => b(i-1) -- Data input
            --        );
            --end generate;
            --
            Last_Register: FDCE
                generic map ( INIT => '0') -- Initial value of register ('0' or '1')
                port map ( Q => Dout, -- Data output
                    C => clk, -- Clock input
                    CE => enable, -- Clock enable input
                    CLR => clearOutputOnHigh, -- Asynchronous clear input
                    D => b(BL-1) -- Data input
                );

    end generate;

end arch;
