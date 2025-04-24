library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_signed.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

-- Computues two products in one DSP: C * A and C * B
-- In this project, A and B are always weights and C is always the layer input.
-- So A and B are always signed. C can be signed but does not have to.
-- Most of the inner workings are described in "Application-Specific Arithmetic: Computing Just Right for the Reconfigurable Computer and the Dark Silicon Era" (978-3-031-42807-4 978-3-031-42808-1) Pages 224-226
--

entity DualMultDSP is
  generic
    (
        A_WIDTH        	: natural := 8; -- Amount of bits for A
        B_WIDTH        	: natural := 7; -- Amount of bits for B
        C_WIDTH        	: natural := 8; -- Amount of bits for C
        FRAC_TRUNCATION : natural := 4; -- Truncate FRAC_TRUNCATION lsb bits from the mult result
        C_IS_SIGNED     : boolean := FALSE;   -- Wether C is a signed input. A and B are always signed!
        DISABLE_PIPELINING : boolean := FALSE -- Do not pipeline the DSP in anyway. This makes the whole entity async.
    );
  Port (
      clk : in std_logic;
      A : in std_logic_vector(A_WIDTH-1 downto 0);
      B : in std_logic_vector(B_WIDTH-1 downto 0);
      C : in std_logic_vector(C_WIDTH-1 downto 0);
      CxA : out std_logic_vector(A_WIDTH + C_WIDTH - FRAC_TRUNCATION-1 downto 0);
      CxB : out std_logic_vector(B_WIDTH + C_WIDTH - FRAC_TRUNCATION-1 downto 0)
  );
end DualMultDSP;

architecture Behavioral of DualMultDSP is

    --attribute KEEP_HIERARCHY : string;
    --attribute KEEP_HIERARCHY of DualMultDSP : entity is "yes";

    function max(a, b : integer) return integer is
    begin
        if a > b then
            return a;
        else
            return b;
        end if;
    end function;

    constant K           : natural := A_WIDTH + C_WIDTH;         -- The start of the second result (Q in the book)
    constant DSP_X_WIDTH : natural := max(25, A_WIDTH + B_WIDTH + C_WIDTH); -- 25 comes from the DSP48E1 see UG369_c1_01_052109
    constant DSP_Y_WIDTH : natural := max(18, C_WIDTH);                     -- 18 comes from the DSP48E1 see UG369_c1_01_052109
    constant DSP_R_WIDTH : natural := DSP_X_WIDTH + DSP_Y_WIDTH;
    constant P_WIDHT     : natural := 1 + A_WIDTH + C_WIDTH;     -- The lsb position of the second result (CxB)

    -- [        SE A         |  A  ]   This means: Sign extension of A followed by A
    -- Stores the prepared A signal.
    signal X_1_signal : std_logic_vector(DSP_X_WIDTH-1 downto 0);
    -- [  SE B  |  B  |            ]   This means: Sign extension of B followed by B followed by empty space
    -- Stores the prepared B signal.
    signal X_2_signal : std_logic_vector(DSP_X_WIDTH-1 downto 0);
    -- [      SE C      |  C  ]   This means: Sign extension of C followed by C
    -- Stores the prepared C signal.
    signal Y_signal : std_logic_vector(DSP_Y_WIDTH-1 downto 0);
    -- [        |    Q'    |  P = A * C  ]   This means: Empty space followed by the unfixed second result Q' (B * C) followed by P (The result of A * C).
    signal R_signal : std_logic_vector(DSP_R_WIDTH-1 downto 0);

    -- Both multiplication results untruncated.
    signal AxC_full_precision : std_logic_vector(A_WIDTH + C_WIDTH-1 downto 0);
    signal BxC_full_precision : std_logic_vector(B_WIDTH + C_WIDTH-1 downto 0);

    -- Helper signals to fix the sign bit for the second result
    signal P_bit : std_logic_vector(P_WIDHT downto 0); -- The correction for the second result (CxB). It is either 0 or '100...0' to either add 0 or 1 to the second result.
    signal P_bit_xor : std_logic_vector(0 downto 0); -- This is a small helper signal used to split up the computation of P_bit

    -- All buffered signals used to pipeline the entity
    signal X_1_plus_X_2_buffered : std_logic_vector(DSP_X_WIDTH-1 downto 0);
    signal Y_signal_buffered : std_logic_vector(DSP_Y_WIDTH-1 downto 0);
    signal R_buffered : std_logic_vector(DSP_R_WIDTH-1 downto 0);
    signal P_bit_buffered : std_logic_vector(P_WIDHT downto 0);
    signal P_bit_buffered_buffered : std_logic_vector(P_WIDHT downto 0);

    attribute use_dsp : string;
   	attribute use_dsp of R_signal : signal is "yes";

begin
    CxA <= AxC_full_precision(AxC_full_precision'length-1 downto FRAC_TRUNCATION); -- Cut away FRAC_TRUNCATION lsb bits from the result
    CxB <= BxC_full_precision(BxC_full_precision'length-1 downto FRAC_TRUNCATION); -- Cut away FRAC_TRUNCATION lsb bits from the result

    -- Approach described in "Application-Specific Arithmetic: Computing Just Right for the Reconfigurable Computer and the Dark Silicon Era" (978-3-031-42807-4 978-3-031-42808-1) Pages 224-226
    X_1_signal <= std_logic_vector(resize(signed(A), X_1_signal'length));                -- Repeat the signed bit | A
    X_2_signal <= std_logic_vector(shift_left(resize(signed(B), X_2_signal'length), K)); -- Repeat the signed bit | B | Fill with K zeros

    -- Resize C to the length of the Y_signal
    UNSIGNED_Y_SIGNAL: if C_IS_SIGNED = FALSE generate
        -- No sign extension. Just fill up with zeros.
        Y_signal <= std_logic_vector(resize(unsigned(C), Y_signal'length));
    end generate;

    SIGNED_Y_SIGNAL: if C_IS_SIGNED = TRUE generate
        -- With sign extension. So fill up with ones if negative.
        Y_signal <= std_logic_vector(resize(signed(C), Y_signal'length));
    end generate;

    -- The hearth of the operation.
    -- Using the pre-adder and post-adder.
    -- Either sync. or async.
    -- In the following, the sync. case is explained.
    -- The async. case is not explained because nothing changes except that the registers are not used.
    PIPELINED_MULT: if DISABLE_PIPELINING = FALSE generate
    process(clk) begin
        if rising_edge(clk) then
            -- Use the Pre-Adder of the DSP here (Port mapping on the DSP: X_1_signal = "A" and X_2_signal = "D" and Y_signal = "B" and P_bit = "C")
            X_1_plus_X_2_buffered <= X_1_signal + X_2_signal; -- Use the "AD" register in the DSP48E1 Inside of the "Dual A, D, and Pre-adder" (See UG369_c1_02_072209 page 10 Figure 1-2 at the bottom right)
            Y_signal_buffered <= Y_signal;                    -- Use the "B1/B2" register in the DSP48E1 Inside of the "Dual B Register" (See UG369_c1_02_072209 page 10 Figure 1-2 at the top)
            -- Use the Mult of the DSP here
            R_buffered <= X_1_plus_X_2_buffered * Y_signal_buffered; -- Use the "M" register in the DSP48E1 after the "MULT 25 X 18" (See UG369_c1_02_072209 page 8 Figure 1-1)
            P_bit_buffered <= P_bit;                          -- Use the ??? register in the DSP48E1 ??? (There is no register before the "C" register. See one line below here)
            P_bit_buffered_buffered <= P_bit_buffered;        -- Use the "C" register in the DSP48E1 (See UG369_c1_02_072209 page 8 Figure 1-1)

            -- (Hopefully) use the Post-Adder of the DSP
            R_signal <= R_buffered + P_bit_buffered_buffered; -- Use the "P" register in the DSP48E1 (See UG369_c1_02_072209 page 8 Figure 1-1)
        end if;
    end process;
    end generate;

    -- Do the same as in the PIPELINED_MULT block but async.
    NOT_PIPELINED_MULT: if DISABLE_PIPELINING = TRUE generate
        X_1_plus_X_2_buffered <= X_1_signal + X_2_signal;
        R_buffered <= X_1_plus_X_2_buffered * Y_signal;
        P_bit_buffered <= P_bit;
        R_signal <= R_buffered + P_bit_buffered;
    end generate;

    -- We can then directly read out both multiplications :-)
    AxC_full_precision <= R_signal(A_WIDTH + C_WIDTH-1 downto 0);
    BxC_full_precision <= R_signal(A_WIDTH + C_WIDTH + C_WIDTH + B_WIDTH-1 downto A_WIDTH + C_WIDTH);

    UNSIGNED_CORRECTION_LOGIC: if C_IS_SIGNED = FALSE generate
        calc_P_bit_correction: process(A,B,P_bit_xor,C)
        begin
            -- This is from "A High-Performance Pixel-Level Fully Pipelined Hardware Accelerator for Neural Networks" doi: 10.1109/TNNLS.2024.3423664 https://ieeexplore.ieee.org/document/10596957
            -- See page 8 Table 2

            -- For the second result (CxB) we have to add 1 if the first result (CxA) is negative.
            -- This whould be the case if A or C is negative.
            -- But C is always postive because it is unsigned by design! (See the SIGNED_CORRECTION_LOGIC block for the other case)
            -- So we dont have to xor the signed bits of A and C! We can just check if A is negative.
            -- But there is a special case!
            -- If A or C is zero, the result is always positive because CxA is then zero
            if signed(A) < 0 and unsigned(C) /= 0 then
                P_bit <= std_logic_vector(shift_left(to_unsigned(1, P_bit'length), P_WIDHT-1));
            else
                P_bit <= std_logic_vector(to_signed(0, P_bit'length));
            end if;
        end process;
    end generate;

    SIGNED_CORRECTION_LOGIC: if C_IS_SIGNED = TRUE generate
        calc_P_bit_correction: process(A,C,P_bit_xor)
        begin
            -- This is from Approach described in "Application-Specific Arithmetic: Computing Just Right for the Reconfigurable Computer and the Dark Silicon Era" (978-3-031-42807-4 978-3-031-42808-1) Pages 224-226
            -- For the second result (CxB) we have to add 1 if the first result (CxA) is negative.
            -- This whould be the case if A or C is negative.
            -- So we just xor the signed bits of A and C.
            -- But there is a special case!
            -- If A or C is zero, the result is always positive because CxA is then zero.
            if signed(C) /= 0 and signed(A) /= 0 then
                P_bit_xor(0) <= C(C'length-1) xor A(A'length-1);
            else
                P_bit_xor(0) <= '0';
            end if;
            P_bit <= std_logic_vector(shift_left(resize(unsigned(P_bit_xor), P_bit'length), P_WIDHT-1));
        end process;
    end generate;

end Behavioral;
