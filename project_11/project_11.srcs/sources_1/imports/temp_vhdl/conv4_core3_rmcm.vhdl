library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv4_core3_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(4-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        R_c1c1cm22c0 : out std_logic_vector(13-1 downto 0);   --	sfix(9, -4)
        R_c1c1cm32c1 : out std_logic_vector(13-1 downto 0);   --	sfix(9, -4)
        R_c0c0cm17c0 : out std_logic_vector(13-1 downto 0);   --	sfix(9, -4)
        R_c1c0cm2c0 : out std_logic_vector(9-1 downto 0);   --	sfix(5, -4)
        R_c1c0cm21c0 : out std_logic_vector(13-1 downto 0);   --	sfix(9, -4)
        R_c1c0cm1c0 : out std_logic_vector(9-1 downto 0);   --	sfix(5, -4)
        R_c0c0cm20c0 : out std_logic_vector(13-1 downto 0);   --	sfix(9, -4)
        R_c1c0cm18c0 : out std_logic_vector(13-1 downto 0);   --	sfix(9, -4)
        R_c0c0cm27c0 : out std_logic_vector(13-1 downto 0);   --	sfix(9, -4)
        R_c0c0c0c0 : out std_logic_vector(5-1 downto 0)  --	sfix(1, -4)
    );
end conv4_core3_rmcm;

architecture arch of conv4_core3_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C1CM22C0_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C1CM32C1_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0CM17C0_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C0CM2C0_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C0CM21C0_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C0CM1C0_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0CM20C0_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C0CM18C0_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0CM27C0_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(4, -3)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(7, -1)
    signal c1c1cm22c0_weight    : PIPELINE_TYPE_FOR_C1C1CM22C0_WEIGHT;
    -- sfix(7, -1)
    signal c1c1cm32c1_weight    : PIPELINE_TYPE_FOR_C1C1CM32C1_WEIGHT;
    -- sfix(7, -1)
    signal c0c0cm17c0_weight    : PIPELINE_TYPE_FOR_C0C0CM17C0_WEIGHT;
    -- sfix(7, -1)
    signal c1c0cm2c0_weight     : PIPELINE_TYPE_FOR_C1C0CM2C0_WEIGHT;
    -- sfix(7, -1)
    signal c1c0cm21c0_weight    : PIPELINE_TYPE_FOR_C1C0CM21C0_WEIGHT;
    -- sfix(7, -1)
    signal c1c0cm1c0_weight     : PIPELINE_TYPE_FOR_C1C0CM1C0_WEIGHT;
    -- sfix(7, -1)
    signal c0c0cm20c0_weight    : PIPELINE_TYPE_FOR_C0C0CM20C0_WEIGHT;
    -- sfix(7, -1)
    signal c1c0cm18c0_weight    : PIPELINE_TYPE_FOR_C1C0CM18C0_WEIGHT;
    -- sfix(7, -1)
    signal c0c0cm27c0_weight    : PIPELINE_TYPE_FOR_C0C0CM27C0_WEIGHT;
    -- sfix(7, -1)
    signal c0c0c0c0_weight      : PIPELINE_TYPE_FOR_C0C0C0C0_WEIGHT;

    -- The zero output
    signal c0c0c0c0 : std_logic_vector(5-1 downto 0); --	sfix(1, -4)

    -- If we use LUT multiplier and the input is unsigned, we have to cut away the msb of the result
    -- If this is the case, the temporary results are stored in the signals below.

    signal R_c0c0cm20c0_undelayed : std_logic_vector(13-1 downto 0);


begin
    c0c0c0c0 <= (others => '0');
    R_c0c0c0c0 <= c0c0c0c0;
    X0_signal(0) <= X0;



    WEIGHT_ROM: entity work.conv4_core3_rmcm_weightsconstant_memory
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
        
            dout1   => c1c1cm22c0_weight(0), 
            dout2   => c1c1cm32c1_weight(0), 
            dout3   => c0c0cm17c0_weight(0), 
            dout4   => c1c0cm2c0_weight(0), 
            dout5   => c1c0cm21c0_weight(0), 
            dout6   => c1c0cm1c0_weight(0), 
            dout7   => c0c0cm20c0_weight(0), 
            dout8   => c1c0cm18c0_weight(0), 
            dout9   => c0c0cm27c0_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_c1c1cm22c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c1cm22c0_weight(0), c1c1cm22c0_weight(1));
    PL_STEP_0_for_c1c1cm32c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c1cm32c1_weight(0), c1c1cm32c1_weight(1));
    PL_STEP_0_for_c0c0cm17c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0cm17c0_weight(0), c0c0cm17c0_weight(1));
    PL_STEP_0_for_c1c0cm2c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c0cm2c0_weight(0), c1c0cm2c0_weight(1));
    PL_STEP_0_for_c1c0cm21c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c0cm21c0_weight(0), c1c0cm21c0_weight(1));
    PL_STEP_0_for_c1c0cm1c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c0cm1c0_weight(0), c1c0cm1c0_weight(1));
    PL_STEP_0_for_c0c0cm20c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0cm20c0_weight(0), c0c0cm20c0_weight(1));
    PL_STEP_0_for_c1c0cm18c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c0cm18c0_weight(0), c1c0cm18c0_weight(1));
    PL_STEP_0_for_c0c0cm27c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0cm27c0_weight(0), c0c0cm27c0_weight(1));
    PL_STEP_0_for_c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0_weight(0), c0c0c0c0_weight(1));


    c1c1cm22c0_c1c0cm1c0_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 6,
			B_WIDTH => 2,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c1c1cm22c0_weight(1)(6-1 downto 0),
			B	=> c1c0cm1c0_weight(1)(2-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1c1cm22c0,
			CxB => R_c1c0cm1c0
		);

    c1c1cm32c1_c1c0cm2c0_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 6,
			B_WIDTH => 2,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c1c1cm32c1_weight(1)(6-1 downto 0),
			B	=> c1c0cm2c0_weight(1)(2-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1c1cm32c1,
			CxB => R_c1c0cm2c0
		);

    c0c0cm17c0_c0c0cm27c0_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 6,
			B_WIDTH => 6,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c0c0cm17c0_weight(1)(6-1 downto 0),
			B	=> c0c0cm27c0_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c0cm17c0,
			CxB => R_c0c0cm27c0
		);

    c1c0cm21c0_c1c0cm18c0_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 6,
			B_WIDTH => 6,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c1c0cm21c0_weight(1)(6-1 downto 0),
			B	=> c1c0cm18c0_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1c0cm21c0,
			CxB => R_c1c0cm18c0
		);




    c0c0cm20c0_MULT: entity work.TruncatedSingleMult
	generic map
		(
            A_WIDTH           => 8, --	sfix(7, -1)
            A_TRUNCATED_WIDTH => 6, -- This would be the MSB position of the weight
            B_WIDTH           => 7, --	ufix(4, -3)
            AxB_WIDTH         => 13, --	sfix(9, -4)
            AxB_FRAC_TRUNCATION => 0,
            B_IS_SIGNED       => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c0c0cm20c0_weight(1),
			B	=> X0_signal(1),
			AxB	=> R_c0c0cm20c0
		);

end architecture;
