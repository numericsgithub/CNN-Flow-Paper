library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv4_core6_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(4-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        R_c0c3c39cm73 : out std_logic_vector(15-1 downto 0);   --	sfix(11, -4)
        R_c0c3c22cm50 : out std_logic_vector(14-1 downto 0);   --	sfix(10, -4)
        R_c0cm1c3cm47 : out std_logic_vector(14-1 downto 0);   --	sfix(10, -4)
        R_cm1c1c14cm105 : out std_logic_vector(15-1 downto 0);   --	sfix(11, -4)
        R_c0c0c10cm64 : out std_logic_vector(14-1 downto 0);   --	sfix(10, -4)
        R_c0c0c3cm58 : out std_logic_vector(14-1 downto 0);   --	sfix(10, -4)
        R_c0cm2c22cm69 : out std_logic_vector(15-1 downto 0);   --	sfix(11, -4)
        R_c0cm3c29cm62 : out std_logic_vector(14-1 downto 0);   --	sfix(10, -4)
        R_c0c0c6cm37 : out std_logic_vector(14-1 downto 0);   --	sfix(10, -4)
        R_c0c0c0c0 : out std_logic_vector(5-1 downto 0)  --	sfix(1, -4)
    );
end conv4_core6_rmcm;

architecture arch of conv4_core6_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C3C39CM73_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C3C22CM50_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM1C3CM47_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C1C14CM105_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C10CM64_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C3CM58_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM2C22CM69_WEIGHT  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM3C29CM62_WEIGHT  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C6CM37_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(4, -3)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(7, -1)
    signal c0c3c39cm73_weight   : PIPELINE_TYPE_FOR_C0C3C39CM73_WEIGHT;
    -- sfix(7, -1)
    signal c0c3c22cm50_weight   : PIPELINE_TYPE_FOR_C0C3C22CM50_WEIGHT;
    -- sfix(7, -1)
    signal c0cm1c3cm47_weight   : PIPELINE_TYPE_FOR_C0CM1C3CM47_WEIGHT;
    -- sfix(7, -1)
    signal cm1c1c14cm105_weight : PIPELINE_TYPE_FOR_CM1C1C14CM105_WEIGHT;
    -- sfix(7, -1)
    signal c0c0c10cm64_weight   : PIPELINE_TYPE_FOR_C0C0C10CM64_WEIGHT;
    -- sfix(7, -1)
    signal c0c0c3cm58_weight    : PIPELINE_TYPE_FOR_C0C0C3CM58_WEIGHT;
    -- sfix(7, -1)
    signal c0cm2c22cm69_weight  : PIPELINE_TYPE_FOR_C0CM2C22CM69_WEIGHT;
    -- sfix(7, -1)
    signal c0cm3c29cm62_weight  : PIPELINE_TYPE_FOR_C0CM3C29CM62_WEIGHT;
    -- sfix(7, -1)
    signal c0c0c6cm37_weight    : PIPELINE_TYPE_FOR_C0C0C6CM37_WEIGHT;
    -- sfix(7, -1)
    signal c0c0c0c0_weight      : PIPELINE_TYPE_FOR_C0C0C0C0_WEIGHT;

    -- The zero output
    signal c0c0c0c0 : std_logic_vector(5-1 downto 0); --	sfix(1, -4)

    -- If we use LUT multiplier and the input is unsigned, we have to cut away the msb of the result
    -- If this is the case, the temporary results are stored in the signals below.

    signal R_c0cm1c3cm47_undelayed : std_logic_vector(14-1 downto 0);


begin
    c0c0c0c0 <= (others => '0');
    R_c0c0c0c0 <= c0c0c0c0;
    X0_signal(0) <= X0;



    WEIGHT_ROM: entity work.conv4_core6_rmcm_weightsconstant_memory
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
        
            dout1   => c0c3c39cm73_weight(0), 
            dout2   => c0c3c22cm50_weight(0), 
            dout3   => c0cm1c3cm47_weight(0), 
            dout4   => cm1c1c14cm105_weight(0), 
            dout5   => c0c0c10cm64_weight(0), 
            dout6   => c0c0c3cm58_weight(0), 
            dout7   => c0cm2c22cm69_weight(0), 
            dout8   => c0cm3c29cm62_weight(0), 
            dout9   => c0c0c6cm37_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_c0c3c39cm73_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c3c39cm73_weight(0), c0c3c39cm73_weight(1));
    PL_STEP_0_for_c0c3c22cm50_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c3c22cm50_weight(0), c0c3c22cm50_weight(1));
    PL_STEP_0_for_c0cm1c3cm47_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm1c3cm47_weight(0), c0cm1c3cm47_weight(1));
    PL_STEP_0_for_cm1c1c14cm105_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c1c14cm105_weight(0), cm1c1c14cm105_weight(1));
    PL_STEP_0_for_c0c0c10cm64_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c10cm64_weight(0), c0c0c10cm64_weight(1));
    PL_STEP_0_for_c0c0c3cm58_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c3cm58_weight(0), c0c0c3cm58_weight(1));
    PL_STEP_0_for_c0cm2c22cm69_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm2c22cm69_weight(0), c0cm2c22cm69_weight(1));
    PL_STEP_0_for_c0cm3c29cm62_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm3c29cm62_weight(0), c0cm3c29cm62_weight(1));
    PL_STEP_0_for_c0c0c6cm37_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c6cm37_weight(0), c0c0c6cm37_weight(1));
    PL_STEP_0_for_c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0_weight(0), c0c0c0c0_weight(1));


    c0c3c39cm73_c0c0c6cm37_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0c3c39cm73_weight(1)(8-1 downto 0),
			B	=> c0c0c6cm37_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c3c39cm73,
			CxB => R_c0c0c6cm37
		);

    cm1c1c14cm105_c0cm3c29cm62_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm1c1c14cm105_weight(1)(8-1 downto 0),
			B	=> c0cm3c29cm62_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1c1c14cm105,
			CxB => R_c0cm3c29cm62
		);

    c0cm2c22cm69_c0c0c3cm58_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0cm2c22cm69_weight(1)(8-1 downto 0),
			B	=> c0c0c3cm58_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0cm2c22cm69,
			CxB => R_c0c0c3cm58
		);

    c0c3c22cm50_c0c0c10cm64_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0c3c22cm50_weight(1)(7-1 downto 0),
			B	=> c0c0c10cm64_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c3c22cm50,
			CxB => R_c0c0c10cm64
		);




    c0cm1c3cm47_MULT: entity work.TruncatedSingleMult
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
			A	=> c0cm1c3cm47_weight(1),
			B	=> X0_signal(1),
			AxB	=> R_c0cm1c3cm47
		);

end architecture;
