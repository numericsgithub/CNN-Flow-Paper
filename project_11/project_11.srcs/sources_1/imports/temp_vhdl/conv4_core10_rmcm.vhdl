library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv4_core10_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(4-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        R_c0cm2c0c5 : out std_logic_vector(11-1 downto 0);   --	sfix(7, -4)
        R_c0cm2c7c0 : out std_logic_vector(11-1 downto 0);   --	sfix(7, -4)
        R_c0c0c5cm5 : out std_logic_vector(11-1 downto 0);   --	sfix(7, -4)
        R_c1c0c7c7 : out std_logic_vector(11-1 downto 0);   --	sfix(7, -4)
        R_c0c0c2c0 : out std_logic_vector(10-1 downto 0);   --	sfix(6, -4)
        R_c0c0c1cm8 : out std_logic_vector(11-1 downto 0);   --	sfix(7, -4)
        R_cm1c2c3c2 : out std_logic_vector(10-1 downto 0);   --	sfix(6, -4)
        R_cm1c2cm3c0 : out std_logic_vector(10-1 downto 0);   --	sfix(6, -4)
        R_c0c0c3cm1 : out std_logic_vector(10-1 downto 0);   --	sfix(6, -4)
        R_c0c0c0c0 : out std_logic_vector(5-1 downto 0)  --	sfix(1, -4)
    );
end conv4_core10_rmcm;

architecture arch of conv4_core10_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM2C0C5_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM2C7C0_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C5CM5_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C0C7C7_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C2C0_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C1CM8_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C2C3C2_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C2CM3C0_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C3CM1_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(4, -3)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(7, -1)
    signal c0cm2c0c5_weight     : PIPELINE_TYPE_FOR_C0CM2C0C5_WEIGHT;
    -- sfix(7, -1)
    signal c0cm2c7c0_weight     : PIPELINE_TYPE_FOR_C0CM2C7C0_WEIGHT;
    -- sfix(7, -1)
    signal c0c0c5cm5_weight     : PIPELINE_TYPE_FOR_C0C0C5CM5_WEIGHT;
    -- sfix(7, -1)
    signal c1c0c7c7_weight      : PIPELINE_TYPE_FOR_C1C0C7C7_WEIGHT;
    -- sfix(7, -1)
    signal c0c0c2c0_weight      : PIPELINE_TYPE_FOR_C0C0C2C0_WEIGHT;
    -- sfix(7, -1)
    signal c0c0c1cm8_weight     : PIPELINE_TYPE_FOR_C0C0C1CM8_WEIGHT;
    -- sfix(7, -1)
    signal cm1c2c3c2_weight     : PIPELINE_TYPE_FOR_CM1C2C3C2_WEIGHT;
    -- sfix(7, -1)
    signal cm1c2cm3c0_weight    : PIPELINE_TYPE_FOR_CM1C2CM3C0_WEIGHT;
    -- sfix(7, -1)
    signal c0c0c3cm1_weight     : PIPELINE_TYPE_FOR_C0C0C3CM1_WEIGHT;
    -- sfix(7, -1)
    signal c0c0c0c0_weight      : PIPELINE_TYPE_FOR_C0C0C0C0_WEIGHT;

    -- The zero output
    signal c0c0c0c0 : std_logic_vector(5-1 downto 0); --	sfix(1, -4)

    -- If we use LUT multiplier and the input is unsigned, we have to cut away the msb of the result
    -- If this is the case, the temporary results are stored in the signals below.

    signal R_c0c0c1cm8_undelayed : std_logic_vector(11-1 downto 0);


begin
    c0c0c0c0 <= (others => '0');
    R_c0c0c0c0 <= c0c0c0c0;
    X0_signal(0) <= X0;



    WEIGHT_ROM: entity work.conv4_core10_rmcm_weightsconstant_memory
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
        
            dout1   => c0cm2c0c5_weight(0), 
            dout2   => c0cm2c7c0_weight(0), 
            dout3   => c0c0c5cm5_weight(0), 
            dout4   => c1c0c7c7_weight(0), 
            dout5   => c0c0c2c0_weight(0), 
            dout6   => c0c0c1cm8_weight(0), 
            dout7   => cm1c2c3c2_weight(0), 
            dout8   => cm1c2cm3c0_weight(0), 
            dout9   => c0c0c3cm1_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_c0cm2c0c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm2c0c5_weight(0), c0cm2c0c5_weight(1));
    PL_STEP_0_for_c0cm2c7c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm2c7c0_weight(0), c0cm2c7c0_weight(1));
    PL_STEP_0_for_c0c0c5cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c5cm5_weight(0), c0c0c5cm5_weight(1));
    PL_STEP_0_for_c1c0c7c7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c0c7c7_weight(0), c1c0c7c7_weight(1));
    PL_STEP_0_for_c0c0c2c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c2c0_weight(0), c0c0c2c0_weight(1));
    PL_STEP_0_for_c0c0c1cm8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c1cm8_weight(0), c0c0c1cm8_weight(1));
    PL_STEP_0_for_cm1c2c3c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c2c3c2_weight(0), cm1c2c3c2_weight(1));
    PL_STEP_0_for_cm1c2cm3c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c2cm3c0_weight(0), cm1c2cm3c0_weight(1));
    PL_STEP_0_for_c0c0c3cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c3cm1_weight(0), c0c0c3cm1_weight(1));
    PL_STEP_0_for_c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0_weight(0), c0c0c0c0_weight(1));


    c0cm2c0c5_c0c0c3cm1_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 4,
			B_WIDTH => 3,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c0cm2c0c5_weight(1)(4-1 downto 0),
			B	=> c0c0c3cm1_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0cm2c0c5,
			CxB => R_c0c0c3cm1
		);

    c0cm2c7c0_cm1c2cm3c0_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 4,
			B_WIDTH => 3,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c0cm2c7c0_weight(1)(4-1 downto 0),
			B	=> cm1c2cm3c0_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0cm2c7c0,
			CxB => R_cm1c2cm3c0
		);

    c0c0c5cm5_cm1c2c3c2_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 4,
			B_WIDTH => 3,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c0c0c5cm5_weight(1)(4-1 downto 0),
			B	=> cm1c2c3c2_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c0c5cm5,
			CxB => R_cm1c2c3c2
		);

    c1c0c7c7_c0c0c2c0_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 4,
			B_WIDTH => 3,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c1c0c7c7_weight(1)(4-1 downto 0),
			B	=> c0c0c2c0_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1c0c7c7,
			CxB => R_c0c0c2c0
		);




    c0c0c1cm8_MULT: entity work.TruncatedSingleMult
	generic map
		(
            A_WIDTH           => 8, --	sfix(7, -1)
            A_TRUNCATED_WIDTH => 4, -- This would be the MSB position of the weight
            B_WIDTH           => 7, --	ufix(4, -3)
            AxB_WIDTH         => 11, --	sfix(7, -4)
            AxB_FRAC_TRUNCATION => 0,
            B_IS_SIGNED       => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c0c0c1cm8_weight(1),
			B	=> X0_signal(1),
			AxB	=> R_c0c0c1cm8
		);

end architecture;
