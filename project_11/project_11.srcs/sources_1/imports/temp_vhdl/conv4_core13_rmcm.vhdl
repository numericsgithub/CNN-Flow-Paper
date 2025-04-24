library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv4_core13_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(4-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        R_c0cm1c39cm46 : out std_logic_vector(14-1 downto 0);   --	sfix(10, -4)
        R_c1cm1c4cm4 : out std_logic_vector(11-1 downto 0);   --	sfix(7, -4)
        R_c0c0c36c15 : out std_logic_vector(14-1 downto 0);   --	sfix(10, -4)
        R_c1cm1c21c46 : out std_logic_vector(14-1 downto 0);   --	sfix(10, -4)
        R_c1cm1cm6c31 : out std_logic_vector(13-1 downto 0);   --	sfix(9, -4)
        R_c1cm1c101c59 : out std_logic_vector(15-1 downto 0);   --	sfix(11, -4)
        R_c0cm1c4c34 : out std_logic_vector(14-1 downto 0);   --	sfix(10, -4)
        R_c1cm1cm25c63 : out std_logic_vector(14-1 downto 0);   --	sfix(10, -4)
        R_c0c0c22cm1 : out std_logic_vector(13-1 downto 0);   --	sfix(9, -4)
        R_c0c0c0c0 : out std_logic_vector(5-1 downto 0)  --	sfix(1, -4)
    );
end conv4_core13_rmcm;

architecture arch of conv4_core13_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM1C39CM46_WEIGHT  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM1C4CM4_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C36C15_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM1C21C46_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM1CM6C31_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM1C101C59_WEIGHT  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM1C4C34_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM1CM25C63_WEIGHT  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C22CM1_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(4, -3)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(7, -1)
    signal c0cm1c39cm46_weight  : PIPELINE_TYPE_FOR_C0CM1C39CM46_WEIGHT;
    -- sfix(7, -1)
    signal c1cm1c4cm4_weight    : PIPELINE_TYPE_FOR_C1CM1C4CM4_WEIGHT;
    -- sfix(7, -1)
    signal c0c0c36c15_weight    : PIPELINE_TYPE_FOR_C0C0C36C15_WEIGHT;
    -- sfix(7, -1)
    signal c1cm1c21c46_weight   : PIPELINE_TYPE_FOR_C1CM1C21C46_WEIGHT;
    -- sfix(7, -1)
    signal c1cm1cm6c31_weight   : PIPELINE_TYPE_FOR_C1CM1CM6C31_WEIGHT;
    -- sfix(7, -1)
    signal c1cm1c101c59_weight  : PIPELINE_TYPE_FOR_C1CM1C101C59_WEIGHT;
    -- sfix(7, -1)
    signal c0cm1c4c34_weight    : PIPELINE_TYPE_FOR_C0CM1C4C34_WEIGHT;
    -- sfix(7, -1)
    signal c1cm1cm25c63_weight  : PIPELINE_TYPE_FOR_C1CM1CM25C63_WEIGHT;
    -- sfix(7, -1)
    signal c0c0c22cm1_weight    : PIPELINE_TYPE_FOR_C0C0C22CM1_WEIGHT;
    -- sfix(7, -1)
    signal c0c0c0c0_weight      : PIPELINE_TYPE_FOR_C0C0C0C0_WEIGHT;

    -- The zero output
    signal c0c0c0c0 : std_logic_vector(5-1 downto 0); --	sfix(1, -4)

    -- If we use LUT multiplier and the input is unsigned, we have to cut away the msb of the result
    -- If this is the case, the temporary results are stored in the signals below.

    signal R_c0cm1c4c34_undelayed : std_logic_vector(14-1 downto 0);


begin
    c0c0c0c0 <= (others => '0');
    R_c0c0c0c0 <= c0c0c0c0;
    X0_signal(0) <= X0;



    WEIGHT_ROM: entity work.conv4_core13_rmcm_weightsconstant_memory
        generic map
        (
            XI_WIDTH        	          => 8, 
            ARRAY_SIZE                    => 4,
            WORDS_PER_ADDR                => 9
        )
        port map
        (
            clk => clk,
            data_index => unsigned(SEL),
        
            dout1   => c0cm1c39cm46_weight(0), 
            dout2   => c1cm1c4cm4_weight(0), 
            dout3   => c0c0c36c15_weight(0), 
            dout4   => c1cm1c21c46_weight(0), 
            dout5   => c1cm1cm6c31_weight(0), 
            dout6   => c1cm1c101c59_weight(0), 
            dout7   => c0cm1c4c34_weight(0), 
            dout8   => c1cm1cm25c63_weight(0), 
            dout9   => c0c0c22cm1_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_c0cm1c39cm46_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm1c39cm46_weight(0), c0cm1c39cm46_weight(1));
    PL_STEP_0_for_c1cm1c4cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm1c4cm4_weight(0), c1cm1c4cm4_weight(1));
    PL_STEP_0_for_c0c0c36c15_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c36c15_weight(0), c0c0c36c15_weight(1));
    PL_STEP_0_for_c1cm1c21c46_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm1c21c46_weight(0), c1cm1c21c46_weight(1));
    PL_STEP_0_for_c1cm1cm6c31_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm1cm6c31_weight(0), c1cm1cm6c31_weight(1));
    PL_STEP_0_for_c1cm1c101c59_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm1c101c59_weight(0), c1cm1c101c59_weight(1));
    PL_STEP_0_for_c0cm1c4c34_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm1c4c34_weight(0), c0cm1c4c34_weight(1));
    PL_STEP_0_for_c1cm1cm25c63_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm1cm25c63_weight(0), c1cm1cm25c63_weight(1));
    PL_STEP_0_for_c0c0c22cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c22cm1_weight(0), c0c0c22cm1_weight(1));
    PL_STEP_0_for_c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0_weight(0), c0c0c0c0_weight(1));


    c1cm1c101c59_c1cm1c4cm4_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 8,
			B_WIDTH => 4,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c1cm1c101c59_weight(1)(8-1 downto 0),
			B	=> c1cm1c4cm4_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1cm1c101c59,
			CxB => R_c1cm1c4cm4
		);

    c0cm1c39cm46_c0c0c22cm1_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 6,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c0cm1c39cm46_weight(1)(7-1 downto 0),
			B	=> c0c0c22cm1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0cm1c39cm46,
			CxB => R_c0c0c22cm1
		);

    c0c0c36c15_c1cm1cm6c31_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 6,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c0c0c36c15_weight(1)(7-1 downto 0),
			B	=> c1cm1cm6c31_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c0c36c15,
			CxB => R_c1cm1cm6c31
		);

    c1cm1c21c46_c1cm1cm25c63_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 7,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c1cm1c21c46_weight(1)(7-1 downto 0),
			B	=> c1cm1cm25c63_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1cm1c21c46,
			CxB => R_c1cm1cm25c63
		);




    c0cm1c4c34_MULT: entity work.TruncatedSingleMult
	generic map
		(
            A_WIDTH           => 8, --	sfix(7, -1)
            A_TRUNCATED_WIDTH => 7, -- This would be the MSB position of the weight
            B_WIDTH           => 7, --	ufix(4, -3)
            AxB_WIDTH         => 14, --	sfix(10, -4)
            AxB_FRAC_TRUNCATION => 0,
            B_IS_SIGNED       => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c0cm1c4c34_weight(1),
			B	=> X0_signal(1),
			AxB	=> R_c0cm1c4c34
		);

end architecture;
