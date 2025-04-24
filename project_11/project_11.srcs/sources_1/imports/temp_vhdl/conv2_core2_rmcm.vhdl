library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv2_core2_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(4-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        R_c2c79c0c0 : out std_logic_vector(15-1 downto 0);   --	sfix(11, -4)
        R_c3c66c0c0 : out std_logic_vector(15-1 downto 0);   --	sfix(11, -4)
        R_c1c61c0c0 : out std_logic_vector(14-1 downto 0);   --	sfix(10, -4)
        R_c1c68c0cm3 : out std_logic_vector(15-1 downto 0);   --	sfix(11, -4)
        R_c0c58cm1cm2 : out std_logic_vector(14-1 downto 0);   --	sfix(10, -4)
        R_c1c42c0c0 : out std_logic_vector(14-1 downto 0);   --	sfix(10, -4)
        R_cm2c13c0c0 : out std_logic_vector(12-1 downto 0);   --	sfix(8, -4)
        R_cm3c4cm1c1 : out std_logic_vector(11-1 downto 0);   --	sfix(7, -4)
        R_cm2cm10c0c0 : out std_logic_vector(12-1 downto 0);   --	sfix(8, -4)
        R_c0c0c0c0 : out std_logic_vector(5-1 downto 0)  --	sfix(1, -4)
    );
end conv2_core2_rmcm;

architecture arch of conv2_core2_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C79C0C0_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C66C0C0_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C61C0C0_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C68C0CM3_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C58CM1CM2_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C42C0C0_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C13C0C0_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3C4CM1C1_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM10C0C0_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(4, -3)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(7, -1)
    signal c2c79c0c0_weight     : PIPELINE_TYPE_FOR_C2C79C0C0_WEIGHT;
    -- sfix(7, -1)
    signal c3c66c0c0_weight     : PIPELINE_TYPE_FOR_C3C66C0C0_WEIGHT;
    -- sfix(7, -1)
    signal c1c61c0c0_weight     : PIPELINE_TYPE_FOR_C1C61C0C0_WEIGHT;
    -- sfix(7, -1)
    signal c1c68c0cm3_weight    : PIPELINE_TYPE_FOR_C1C68C0CM3_WEIGHT;
    -- sfix(7, -1)
    signal c0c58cm1cm2_weight   : PIPELINE_TYPE_FOR_C0C58CM1CM2_WEIGHT;
    -- sfix(7, -1)
    signal c1c42c0c0_weight     : PIPELINE_TYPE_FOR_C1C42C0C0_WEIGHT;
    -- sfix(7, -1)
    signal cm2c13c0c0_weight    : PIPELINE_TYPE_FOR_CM2C13C0C0_WEIGHT;
    -- sfix(7, -1)
    signal cm3c4cm1c1_weight    : PIPELINE_TYPE_FOR_CM3C4CM1C1_WEIGHT;
    -- sfix(7, -1)
    signal cm2cm10c0c0_weight   : PIPELINE_TYPE_FOR_CM2CM10C0C0_WEIGHT;
    -- sfix(7, -1)
    signal c0c0c0c0_weight      : PIPELINE_TYPE_FOR_C0C0C0C0_WEIGHT;

    -- The zero output
    signal c0c0c0c0 : std_logic_vector(5-1 downto 0); --	sfix(1, -4)

    -- If we use LUT multiplier and the input is unsigned, we have to cut away the msb of the result
    -- If this is the case, the temporary results are stored in the signals below.

    signal R_c0c58cm1cm2_undelayed : std_logic_vector(14-1 downto 0);


begin
    c0c0c0c0 <= (others => '0');
    R_c0c0c0c0 <= c0c0c0c0;
    X0_signal(0) <= X0;



    WEIGHT_ROM: entity work.conv2_core2_rmcm_weightsconstant_memory
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
        
            dout1   => c2c79c0c0_weight(0), 
            dout2   => c3c66c0c0_weight(0), 
            dout3   => c1c61c0c0_weight(0), 
            dout4   => c1c68c0cm3_weight(0), 
            dout5   => c0c58cm1cm2_weight(0), 
            dout6   => c1c42c0c0_weight(0), 
            dout7   => cm2c13c0c0_weight(0), 
            dout8   => cm3c4cm1c1_weight(0), 
            dout9   => cm2cm10c0c0_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_c2c79c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c79c0c0_weight(0), c2c79c0c0_weight(1));
    PL_STEP_0_for_c3c66c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c66c0c0_weight(0), c3c66c0c0_weight(1));
    PL_STEP_0_for_c1c61c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c61c0c0_weight(0), c1c61c0c0_weight(1));
    PL_STEP_0_for_c1c68c0cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c68c0cm3_weight(0), c1c68c0cm3_weight(1));
    PL_STEP_0_for_c0c58cm1cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c58cm1cm2_weight(0), c0c58cm1cm2_weight(1));
    PL_STEP_0_for_c1c42c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c42c0c0_weight(0), c1c42c0c0_weight(1));
    PL_STEP_0_for_cm2c13c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c13c0c0_weight(0), cm2c13c0c0_weight(1));
    PL_STEP_0_for_cm3c4cm1c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3c4cm1c1_weight(0), cm3c4cm1c1_weight(1));
    PL_STEP_0_for_cm2cm10c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm10c0c0_weight(0), cm2cm10c0c0_weight(1));
    PL_STEP_0_for_c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0_weight(0), c0c0c0c0_weight(1));


    c2c79c0c0_cm3c4cm1c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c2c79c0c0_weight(1)(8-1 downto 0),
			B	=> cm3c4cm1c1_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c2c79c0c0,
			CxB => R_cm3c4cm1c1
		);

    c3c66c0c0_cm2cm10c0c0_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 8,
			B_WIDTH => 5,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c3c66c0c0_weight(1)(8-1 downto 0),
			B	=> cm2cm10c0c0_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c3c66c0c0,
			CxB => R_cm2cm10c0c0
		);

    c1c68c0cm3_cm2c13c0c0_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 8,
			B_WIDTH => 5,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c1c68c0cm3_weight(1)(8-1 downto 0),
			B	=> cm2c13c0c0_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1c68c0cm3,
			CxB => R_cm2c13c0c0
		);

    c1c61c0c0_c1c42c0c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c1c61c0c0_weight(1)(7-1 downto 0),
			B	=> c1c42c0c0_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1c61c0c0,
			CxB => R_c1c42c0c0
		);




    c0c58cm1cm2_MULT: entity work.TruncatedSingleMult
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
			A	=> c0c58cm1cm2_weight(1),
			B	=> X0_signal(1),
			AxB	=> R_c0c58cm1cm2
		);

end architecture;
