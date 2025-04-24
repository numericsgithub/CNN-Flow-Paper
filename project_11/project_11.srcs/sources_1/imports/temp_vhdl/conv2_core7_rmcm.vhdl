library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv2_core7_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(4-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        R_c0c0c71cm17 : out std_logic_vector(15-1 downto 0);   --	sfix(11, -4)
        R_c0c0c67cm20 : out std_logic_vector(15-1 downto 0);   --	sfix(11, -4)
        R_c0c0c49cm9 : out std_logic_vector(14-1 downto 0);   --	sfix(10, -4)
        R_cm1c0c85cm20 : out std_logic_vector(15-1 downto 0);   --	sfix(11, -4)
        R_c0c0c62cm31 : out std_logic_vector(14-1 downto 0);   --	sfix(10, -4)
        R_c0c0c38cm23 : out std_logic_vector(14-1 downto 0);   --	sfix(10, -4)
        R_c0cm1c40cm29 : out std_logic_vector(14-1 downto 0);   --	sfix(10, -4)
        R_c0c0c35cm34 : out std_logic_vector(14-1 downto 0);   --	sfix(10, -4)
        R_c0c0cm3cm17 : out std_logic_vector(13-1 downto 0);   --	sfix(9, -4)
        R_c0c0c0c0 : out std_logic_vector(5-1 downto 0)  --	sfix(1, -4)
    );
end conv2_core7_rmcm;

architecture arch of conv2_core7_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C71CM17_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C67CM20_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C49CM9_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C0C85CM20_WEIGHT  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C62CM31_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C38CM23_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM1C40CM29_WEIGHT  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C35CM34_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0CM3CM17_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(4, -3)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(7, -1)
    signal c0c0c71cm17_weight   : PIPELINE_TYPE_FOR_C0C0C71CM17_WEIGHT;
    -- sfix(7, -1)
    signal c0c0c67cm20_weight   : PIPELINE_TYPE_FOR_C0C0C67CM20_WEIGHT;
    -- sfix(7, -1)
    signal c0c0c49cm9_weight    : PIPELINE_TYPE_FOR_C0C0C49CM9_WEIGHT;
    -- sfix(7, -1)
    signal cm1c0c85cm20_weight  : PIPELINE_TYPE_FOR_CM1C0C85CM20_WEIGHT;
    -- sfix(7, -1)
    signal c0c0c62cm31_weight   : PIPELINE_TYPE_FOR_C0C0C62CM31_WEIGHT;
    -- sfix(7, -1)
    signal c0c0c38cm23_weight   : PIPELINE_TYPE_FOR_C0C0C38CM23_WEIGHT;
    -- sfix(7, -1)
    signal c0cm1c40cm29_weight  : PIPELINE_TYPE_FOR_C0CM1C40CM29_WEIGHT;
    -- sfix(7, -1)
    signal c0c0c35cm34_weight   : PIPELINE_TYPE_FOR_C0C0C35CM34_WEIGHT;
    -- sfix(7, -1)
    signal c0c0cm3cm17_weight   : PIPELINE_TYPE_FOR_C0C0CM3CM17_WEIGHT;
    -- sfix(7, -1)
    signal c0c0c0c0_weight      : PIPELINE_TYPE_FOR_C0C0C0C0_WEIGHT;

    -- The zero output
    signal c0c0c0c0 : std_logic_vector(5-1 downto 0); --	sfix(1, -4)

    -- If we use LUT multiplier and the input is unsigned, we have to cut away the msb of the result
    -- If this is the case, the temporary results are stored in the signals below.

    signal R_c0c0c62cm31_undelayed : std_logic_vector(14-1 downto 0);


begin
    c0c0c0c0 <= (others => '0');
    R_c0c0c0c0 <= c0c0c0c0;
    X0_signal(0) <= X0;



    WEIGHT_ROM: entity work.conv2_core7_rmcm_weightsconstant_memory
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
        
            dout1   => c0c0c71cm17_weight(0), 
            dout2   => c0c0c67cm20_weight(0), 
            dout3   => c0c0c49cm9_weight(0), 
            dout4   => cm1c0c85cm20_weight(0), 
            dout5   => c0c0c62cm31_weight(0), 
            dout6   => c0c0c38cm23_weight(0), 
            dout7   => c0cm1c40cm29_weight(0), 
            dout8   => c0c0c35cm34_weight(0), 
            dout9   => c0c0cm3cm17_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_c0c0c71cm17_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c71cm17_weight(0), c0c0c71cm17_weight(1));
    PL_STEP_0_for_c0c0c67cm20_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c67cm20_weight(0), c0c0c67cm20_weight(1));
    PL_STEP_0_for_c0c0c49cm9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c49cm9_weight(0), c0c0c49cm9_weight(1));
    PL_STEP_0_for_cm1c0c85cm20_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c0c85cm20_weight(0), cm1c0c85cm20_weight(1));
    PL_STEP_0_for_c0c0c62cm31_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c62cm31_weight(0), c0c0c62cm31_weight(1));
    PL_STEP_0_for_c0c0c38cm23_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c38cm23_weight(0), c0c0c38cm23_weight(1));
    PL_STEP_0_for_c0cm1c40cm29_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm1c40cm29_weight(0), c0cm1c40cm29_weight(1));
    PL_STEP_0_for_c0c0c35cm34_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c35cm34_weight(0), c0c0c35cm34_weight(1));
    PL_STEP_0_for_c0c0cm3cm17_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0cm3cm17_weight(0), c0c0cm3cm17_weight(1));
    PL_STEP_0_for_c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0_weight(0), c0c0c0c0_weight(1));


    c0c0c71cm17_c0c0cm3cm17_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 8,
			B_WIDTH => 6,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c0c0c71cm17_weight(1)(8-1 downto 0),
			B	=> c0c0cm3cm17_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c0c71cm17,
			CxB => R_c0c0cm3cm17
		);

    c0c0c67cm20_c0c0c35cm34_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 8,
			B_WIDTH => 7,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c0c0c67cm20_weight(1)(8-1 downto 0),
			B	=> c0c0c35cm34_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c0c67cm20,
			CxB => R_c0c0c35cm34
		);

    cm1c0c85cm20_c0cm1c40cm29_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 8,
			B_WIDTH => 7,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm1c0c85cm20_weight(1)(8-1 downto 0),
			B	=> c0cm1c40cm29_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1c0c85cm20,
			CxB => R_c0cm1c40cm29
		);

    c0c0c49cm9_c0c0c38cm23_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0c0c49cm9_weight(1)(7-1 downto 0),
			B	=> c0c0c38cm23_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c0c49cm9,
			CxB => R_c0c0c38cm23
		);




    c0c0c62cm31_MULT: entity work.TruncatedSingleMult
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
			A	=> c0c0c62cm31_weight(1),
			B	=> X0_signal(1),
			AxB	=> R_c0c0c62cm31
		);

end architecture;
