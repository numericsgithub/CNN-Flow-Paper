library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_signed.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

-- Computues a single product in one DSP: A * B

entity TruncatedSingleMult is
    generic
    (
        A_WIDTH             : natural := 8;
        A_TRUNCATED_WIDTH   : natural := 4; -- This would be the MSB position of the weight
        B_WIDTH             : natural := 8;
        AxB_WIDTH           : natural := 12;
        AxB_FRAC_TRUNCATION : natural := 0;
        B_IS_SIGNED         : boolean := TRUE;
        DISABLE_PIPELINING : boolean := FALSE
    );
    Port (
        clk : in std_logic;
        A : in std_logic_vector(A_WIDTH-1 downto 0);
        B : in std_logic_vector(B_WIDTH-1 downto 0);
        AxB : out std_logic_vector(AxB_WIDTH-1 downto 0)
    );
end TruncatedSingleMult;

architecture Behavioral of TruncatedSingleMult is

    function set_axb_width(is_signed:boolean)
        return integer is
    begin
        if is_signed = TRUE then
            return 0;
        else
            return 1;
        end if;
    end function;

    constant AxB_SIGNAL_WIDTH :natural := set_axb_width(B_IS_SIGNED) + A_TRUNCATED_WIDTH + B_WIDTH;

    signal A_truncated_signal : std_logic_vector(A_TRUNCATED_WIDTH-1 downto 0);

    signal AxB_signal : std_logic_vector(AxB_SIGNAL_WIDTH-1 downto 0);

    signal AxB_signal_fra_truncated : std_logic_vector(A_TRUNCATED_WIDTH+B_WIDTH-AxB_FRAC_TRUNCATION-1 downto 0);

    -- All buffered signals
    signal A_truncated_buffered : std_logic_vector(A_TRUNCATED_WIDTH-1 downto 0);
    signal B_buffered : std_logic_vector(B_WIDTH-1 downto 0);

    attribute use_dsp : string;
   	attribute use_dsp of AxB_signal : signal is "yes";
begin
    A_truncated_signal <= A(A_truncated_signal'length-1 downto 0); -- Take the lower bits


    PIPELINED_MULT: if DISABLE_PIPELINING = FALSE generate
    SIGNED_CORRECTION_LOGIC: if B_IS_SIGNED = TRUE generate
        process(clk) begin
            if rising_edge(clk) then
                A_truncated_buffered <= A_truncated_signal; -- Pre adder buffer
                B_buffered <= B;
                AxB_signal <= A_truncated_buffered * B_buffered;
                AxB_signal_fra_truncated <= AxB_signal(AxB_signal'length-1 downto AxB_FRAC_TRUNCATION);
            end if;
        end process;
        AxB <= AxB_signal_fra_truncated;
        --AxB_signal <= A_truncated_signal * B;
    end generate;

    UNSIGNED_CORRECTION_LOGIC: if B_IS_SIGNED = FALSE generate
        process(clk) begin
            if rising_edge(clk) then
                A_truncated_buffered <= A_truncated_signal; -- Pre adder buffer
                B_buffered <= B;
                AxB_signal <= A_truncated_buffered * ('0' & B_buffered);
                AxB_signal_fra_truncated <= AxB_signal(AxB_signal'length-2 downto AxB_FRAC_TRUNCATION);
            end if;
        end process;
        AxB <= AxB_signal_fra_truncated;
        -- Just add a additional zero so we can still just use signed x signed multiplication instead.
        --AxB_signal <= A_truncated_signal * ('0' & B);
        -- But we have to cut off an msb after that.
    end generate;
    end generate;


    NOT_PIPELINED_MULT: if DISABLE_PIPELINING = TRUE generate
    SIGNED_CORRECTION_LOGIC: if B_IS_SIGNED = TRUE generate
        A_truncated_buffered <= A_truncated_signal; -- Pre adder buffer
        AxB_signal <= A_truncated_buffered * B;
        AxB_signal_fra_truncated <= AxB_signal(AxB_signal'length-1 downto AxB_FRAC_TRUNCATION);
        AxB <= AxB_signal_fra_truncated;
    end generate;

    UNSIGNED_CORRECTION_LOGIC: if B_IS_SIGNED = FALSE generate
        A_truncated_buffered <= A_truncated_signal; -- Pre adder buffer
        AxB_signal <= A_truncated_buffered * ('0' & B);
        AxB_signal_fra_truncated <= AxB_signal(AxB_signal'length-2 downto AxB_FRAC_TRUNCATION);
        AxB <= AxB_signal_fra_truncated;
    end generate;
    end generate;


end Behavioral;
