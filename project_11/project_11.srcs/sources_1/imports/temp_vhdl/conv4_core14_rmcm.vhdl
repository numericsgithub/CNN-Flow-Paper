library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv4_core14_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(4-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        R_c0c0c1c1 : out std_logic_vector(9-1 downto 0);   --	sfix(5, -4)
        R_c0c0c0c1 : out std_logic_vector(9-1 downto 0);   --	sfix(5, -4)
        R_c0c0cm1c0 : out std_logic_vector(8-1 downto 0);   --	sfix(4, -4)
        R_cm1c0c2cm1 : out std_logic_vector(10-1 downto 0);   --	sfix(6, -4)
        R_cm1c1c1cm1 : out std_logic_vector(9-1 downto 0);   --	sfix(5, -4)
        R_cm1cm1cm1c0 : out std_logic_vector(8-1 downto 0);   --	sfix(4, -4)
        R_c0c0c1c0 : out std_logic_vector(9-1 downto 0);   --	sfix(5, -4)
        R_c0c1c0c0 : out std_logic_vector(9-1 downto 0);   --	sfix(5, -4)
        R_c0c0c0c0 : out std_logic_vector(5-1 downto 0)  --	sfix(1, -4)
    );
end conv4_core14_rmcm;

architecture arch of conv4_core14_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C1C1_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C1_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0CM1C0_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C0C2CM1_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C1C1CM1_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM1CM1C0_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C1C0_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C1C0C0_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(4, -3)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(7, -1)
    signal c0c0c1c1_weight      : PIPELINE_TYPE_FOR_C0C0C1C1_WEIGHT;
    -- sfix(7, -1)
    signal c0c0c0c1_weight      : PIPELINE_TYPE_FOR_C0C0C0C1_WEIGHT;
    -- sfix(7, -1)
    signal c0c0cm1c0_weight     : PIPELINE_TYPE_FOR_C0C0CM1C0_WEIGHT;
    -- sfix(7, -1)
    signal cm1c0c2cm1_weight    : PIPELINE_TYPE_FOR_CM1C0C2CM1_WEIGHT;
    -- sfix(7, -1)
    signal cm1c1c1cm1_weight    : PIPELINE_TYPE_FOR_CM1C1C1CM1_WEIGHT;
    -- sfix(7, -1)
    signal cm1cm1cm1c0_weight   : PIPELINE_TYPE_FOR_CM1CM1CM1C0_WEIGHT;
    -- sfix(7, -1)
    signal c0c0c1c0_weight      : PIPELINE_TYPE_FOR_C0C0C1C0_WEIGHT;
    -- sfix(7, -1)
    signal c0c1c0c0_weight      : PIPELINE_TYPE_FOR_C0C1C0C0_WEIGHT;
    -- sfix(7, -1)
    signal c0c0c0c0_weight      : PIPELINE_TYPE_FOR_C0C0C0C0_WEIGHT;

    -- The zero output
    signal c0c0c0c0 : std_logic_vector(5-1 downto 0); --	sfix(1, -4)

    -- If we use LUT multiplier and the input is unsigned, we have to cut away the msb of the result
    -- If this is the case, the temporary results are stored in the signals below.


begin
    c0c0c0c0 <= (others => '0');
    R_c0c0c0c0 <= c0c0c0c0;
    X0_signal(0) <= X0;



    WEIGHT_ROM: entity work.conv4_core14_rmcm_weightsconstant_memory
        generic map
        (
            XI_WIDTH        	          => 8, 
            ARRAY_SIZE                    => 4,
            WORDS_PER_ADDR                => 8
        )
        port map
        (
            clk => clk,
            data_index => unsigned(SEL),
        
            dout1   => c0c0c1c1_weight(0), 
            dout2   => c0c0c0c1_weight(0), 
            dout3   => c0c0cm1c0_weight(0), 
            dout4   => cm1c0c2cm1_weight(0), 
            dout5   => cm1c1c1cm1_weight(0), 
            dout6   => cm1cm1cm1c0_weight(0), 
            dout7   => c0c0c1c0_weight(0), 
            dout8   => c0c1c0c0_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_c0c0c1c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c1c1_weight(0), c0c0c1c1_weight(1));
    PL_STEP_0_for_c0c0c0c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c1_weight(0), c0c0c0c1_weight(1));
    PL_STEP_0_for_c0c0cm1c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0cm1c0_weight(0), c0c0cm1c0_weight(1));
    PL_STEP_0_for_cm1c0c2cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c0c2cm1_weight(0), cm1c0c2cm1_weight(1));
    PL_STEP_0_for_cm1c1c1cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c1c1cm1_weight(0), cm1c1c1cm1_weight(1));
    PL_STEP_0_for_cm1cm1cm1c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm1cm1c0_weight(0), cm1cm1cm1c0_weight(1));
    PL_STEP_0_for_c0c0c1c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c1c0_weight(0), c0c0c1c0_weight(1));
    PL_STEP_0_for_c0c1c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c1c0c0_weight(0), c0c1c0c0_weight(1));
    PL_STEP_0_for_c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0_weight(0), c0c0c0c0_weight(1));


    cm1c0c2cm1_cm1cm1cm1c0_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 3,
			B_WIDTH => 1,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm1c0c2cm1_weight(1)(3-1 downto 0),
			B	=> cm1cm1cm1c0_weight(1)(1-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1c0c2cm1,
			CxB => R_cm1cm1cm1c0
		);

    c0c0c1c1_c0c0cm1c0_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 2,
			B_WIDTH => 1,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c0c0c1c1_weight(1)(2-1 downto 0),
			B	=> c0c0cm1c0_weight(1)(1-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c0c1c1,
			CxB => R_c0c0cm1c0
		);

    c0c0c0c1_c0c1c0c0_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 2,
			B_WIDTH => 2,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c0c0c0c1_weight(1)(2-1 downto 0),
			B	=> c0c1c0c0_weight(1)(2-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c0c0c1,
			CxB => R_c0c1c0c0
		);

    cm1c1c1cm1_c0c0c1c0_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 2,
			B_WIDTH => 2,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm1c1c1cm1_weight(1)(2-1 downto 0),
			B	=> c0c0c1c0_weight(1)(2-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1c1c1cm1,
			CxB => R_c0c0c1c0
		);




end architecture;
