library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv2_core3_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(4-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        R_c0c11c0c0 : out std_logic_vector(12-1 downto 0);   --	sfix(8, -4)
        R_c0cm5c0c0 : out std_logic_vector(11-1 downto 0);   --	sfix(7, -4)
        R_c0c2c0c0 : out std_logic_vector(10-1 downto 0);   --	sfix(6, -4)
        R_c0c4c0cm1 : out std_logic_vector(11-1 downto 0);   --	sfix(7, -4)
        R_c1c15c0cm2 : out std_logic_vector(12-1 downto 0);   --	sfix(8, -4)
        R_c0c4c0c0 : out std_logic_vector(11-1 downto 0);   --	sfix(7, -4)
        R_c0c23c0c0 : out std_logic_vector(13-1 downto 0);   --	sfix(9, -4)
        R_c0c3c0c0 : out std_logic_vector(10-1 downto 0);   --	sfix(6, -4)
        R_c0c0c0c0 : out std_logic_vector(5-1 downto 0)  --	sfix(1, -4)
    );
end conv2_core3_rmcm;

architecture arch of conv2_core3_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C11C0C0_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM5C0C0_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C2C0C0_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C4C0CM1_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C15C0CM2_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C4C0C0_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C23C0C0_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C3C0C0_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(4, -3)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(7, -1)
    signal c0c11c0c0_weight     : PIPELINE_TYPE_FOR_C0C11C0C0_WEIGHT;
    -- sfix(7, -1)
    signal c0cm5c0c0_weight     : PIPELINE_TYPE_FOR_C0CM5C0C0_WEIGHT;
    -- sfix(7, -1)
    signal c0c2c0c0_weight      : PIPELINE_TYPE_FOR_C0C2C0C0_WEIGHT;
    -- sfix(7, -1)
    signal c0c4c0cm1_weight     : PIPELINE_TYPE_FOR_C0C4C0CM1_WEIGHT;
    -- sfix(7, -1)
    signal c1c15c0cm2_weight    : PIPELINE_TYPE_FOR_C1C15C0CM2_WEIGHT;
    -- sfix(7, -1)
    signal c0c4c0c0_weight      : PIPELINE_TYPE_FOR_C0C4C0C0_WEIGHT;
    -- sfix(7, -1)
    signal c0c23c0c0_weight     : PIPELINE_TYPE_FOR_C0C23C0C0_WEIGHT;
    -- sfix(7, -1)
    signal c0c3c0c0_weight      : PIPELINE_TYPE_FOR_C0C3C0C0_WEIGHT;
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



    WEIGHT_ROM: entity work.conv2_core3_rmcm_weightsconstant_memory
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
        
            dout1   => c0c11c0c0_weight(0), 
            dout2   => c0cm5c0c0_weight(0), 
            dout3   => c0c2c0c0_weight(0), 
            dout4   => c0c4c0cm1_weight(0), 
            dout5   => c1c15c0cm2_weight(0), 
            dout6   => c0c4c0c0_weight(0), 
            dout7   => c0c23c0c0_weight(0), 
            dout8   => c0c3c0c0_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_c0c11c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c11c0c0_weight(0), c0c11c0c0_weight(1));
    PL_STEP_0_for_c0cm5c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm5c0c0_weight(0), c0cm5c0c0_weight(1));
    PL_STEP_0_for_c0c2c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c2c0c0_weight(0), c0c2c0c0_weight(1));
    PL_STEP_0_for_c0c4c0cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c4c0cm1_weight(0), c0c4c0cm1_weight(1));
    PL_STEP_0_for_c1c15c0cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c15c0cm2_weight(0), c1c15c0cm2_weight(1));
    PL_STEP_0_for_c0c4c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c4c0c0_weight(0), c0c4c0c0_weight(1));
    PL_STEP_0_for_c0c23c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c23c0c0_weight(0), c0c23c0c0_weight(1));
    PL_STEP_0_for_c0c3c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c3c0c0_weight(0), c0c3c0c0_weight(1));
    PL_STEP_0_for_c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0_weight(0), c0c0c0c0_weight(1));


    c0c23c0c0_c0c3c0c0_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 6,
			B_WIDTH => 3,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c0c23c0c0_weight(1)(6-1 downto 0),
			B	=> c0c3c0c0_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c23c0c0,
			CxB => R_c0c3c0c0
		);

    c0c11c0c0_c0c2c0c0_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 5,
			B_WIDTH => 3,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c0c11c0c0_weight(1)(5-1 downto 0),
			B	=> c0c2c0c0_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c11c0c0,
			CxB => R_c0c2c0c0
		);

    c1c15c0cm2_c0c4c0c0_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 5,
			B_WIDTH => 4,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c1c15c0cm2_weight(1)(5-1 downto 0),
			B	=> c0c4c0c0_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1c15c0cm2,
			CxB => R_c0c4c0c0
		);

    c0cm5c0c0_c0c4c0cm1_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 4,
			B_WIDTH => 4,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c0cm5c0c0_weight(1)(4-1 downto 0),
			B	=> c0c4c0cm1_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0cm5c0c0,
			CxB => R_c0c4c0cm1
		);




end architecture;
