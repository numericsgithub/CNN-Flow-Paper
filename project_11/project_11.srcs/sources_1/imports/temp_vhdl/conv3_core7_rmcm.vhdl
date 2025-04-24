library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv3_core7_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(4-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        R_c0c0c0cm5 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_cm1c2cm1c2 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_c2cm4c0c0 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_c6c1c3c8 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_c0c3c0c3 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_c2cm1c0c0 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_c0c1c1c1 : out std_logic_vector(9-1 downto 0);   --	sfix(2, -7)
        R_c1c3cm1c6 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_c0c3cm2cm8 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_c0cm2c0cm3 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_cm1cm5cm1cm2 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_c2cm1c2c1 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_c3cm7cm2cm2 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_c0cm1cm3cm1 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_c0cm2c3cm3 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_c0c0c0c0 : out std_logic_vector(8-1 downto 0)  --	sfix(1, -7)
    );
end conv3_core7_rmcm;

architecture arch of conv3_core7_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0CM5_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C2CM1C2_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2CM4C0C0_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6C1C3C8_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C3C0C3_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2CM1C0C0_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C1C1C1_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C3CM1C6_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C3CM2CM8_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM2C0CM3_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM5CM1CM2_WEIGHT  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2CM1C2C1_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3CM7CM2CM2_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM1CM3CM1_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM2C3CM3_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(5, -2)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(3, -5)
    signal c0c0c0cm5_weight     : PIPELINE_TYPE_FOR_C0C0C0CM5_WEIGHT;
    -- sfix(3, -5)
    signal cm1c2cm1c2_weight    : PIPELINE_TYPE_FOR_CM1C2CM1C2_WEIGHT;
    -- sfix(3, -5)
    signal c2cm4c0c0_weight     : PIPELINE_TYPE_FOR_C2CM4C0C0_WEIGHT;
    -- sfix(3, -5)
    signal c6c1c3c8_weight      : PIPELINE_TYPE_FOR_C6C1C3C8_WEIGHT;
    -- sfix(3, -5)
    signal c0c3c0c3_weight      : PIPELINE_TYPE_FOR_C0C3C0C3_WEIGHT;
    -- sfix(3, -5)
    signal c2cm1c0c0_weight     : PIPELINE_TYPE_FOR_C2CM1C0C0_WEIGHT;
    -- sfix(3, -5)
    signal c0c1c1c1_weight      : PIPELINE_TYPE_FOR_C0C1C1C1_WEIGHT;
    -- sfix(3, -5)
    signal c1c3cm1c6_weight     : PIPELINE_TYPE_FOR_C1C3CM1C6_WEIGHT;
    -- sfix(3, -5)
    signal c0c3cm2cm8_weight    : PIPELINE_TYPE_FOR_C0C3CM2CM8_WEIGHT;
    -- sfix(3, -5)
    signal c0cm2c0cm3_weight    : PIPELINE_TYPE_FOR_C0CM2C0CM3_WEIGHT;
    -- sfix(3, -5)
    signal cm1cm5cm1cm2_weight  : PIPELINE_TYPE_FOR_CM1CM5CM1CM2_WEIGHT;
    -- sfix(3, -5)
    signal c2cm1c2c1_weight     : PIPELINE_TYPE_FOR_C2CM1C2C1_WEIGHT;
    -- sfix(3, -5)
    signal c3cm7cm2cm2_weight   : PIPELINE_TYPE_FOR_C3CM7CM2CM2_WEIGHT;
    -- sfix(3, -5)
    signal c0cm1cm3cm1_weight   : PIPELINE_TYPE_FOR_C0CM1CM3CM1_WEIGHT;
    -- sfix(3, -5)
    signal c0cm2c3cm3_weight    : PIPELINE_TYPE_FOR_C0CM2C3CM3_WEIGHT;
    -- sfix(3, -5)
    signal c0c0c0c0_weight      : PIPELINE_TYPE_FOR_C0C0C0C0_WEIGHT;

    -- The zero output
    signal c0c0c0c0 : std_logic_vector(8-1 downto 0); --	sfix(1, -7)

    -- If we use LUT multiplier and the input is unsigned, we have to cut away the msb of the result
    -- If this is the case, the temporary results are stored in the signals below.

    signal R_c2cm4c0c0_undelayed : std_logic_vector(10-1 downto 0);


begin
    c0c0c0c0 <= (others => '0');
    R_c0c0c0c0 <= c0c0c0c0;
    X0_signal(0) <= X0;



    WEIGHT_ROM: entity work.conv3_core7_rmcm_weightsconstant_memory
        generic map
        (
            XI_WIDTH        	          => 8, 
            ARRAY_SIZE                    => 4,
            WORDS_PER_ADDR                => 15
        )
        port map
        (
            clk => clk,
            data_index => unsigned(SEL),
        
            dout1   => c0c0c0cm5_weight(0), 
            dout2   => cm1c2cm1c2_weight(0), 
            dout3   => c2cm4c0c0_weight(0), 
            dout4   => c6c1c3c8_weight(0), 
            dout5   => c0c3c0c3_weight(0), 
            dout6   => c2cm1c0c0_weight(0), 
            dout7   => c0c1c1c1_weight(0), 
            dout8   => c1c3cm1c6_weight(0), 
            dout9   => c0c3cm2cm8_weight(0), 
            dout10   => c0cm2c0cm3_weight(0), 
            dout11   => cm1cm5cm1cm2_weight(0), 
            dout12   => c2cm1c2c1_weight(0), 
            dout13   => c3cm7cm2cm2_weight(0), 
            dout14   => c0cm1cm3cm1_weight(0), 
            dout15   => c0cm2c3cm3_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_c0c0c0cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0cm5_weight(0), c0c0c0cm5_weight(1));
    PL_STEP_0_for_cm1c2cm1c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c2cm1c2_weight(0), cm1c2cm1c2_weight(1));
    PL_STEP_0_for_c2cm4c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2cm4c0c0_weight(0), c2cm4c0c0_weight(1));
    PL_STEP_0_for_c6c1c3c8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6c1c3c8_weight(0), c6c1c3c8_weight(1));
    PL_STEP_0_for_c0c3c0c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c3c0c3_weight(0), c0c3c0c3_weight(1));
    PL_STEP_0_for_c2cm1c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2cm1c0c0_weight(0), c2cm1c0c0_weight(1));
    PL_STEP_0_for_c0c1c1c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c1c1c1_weight(0), c0c1c1c1_weight(1));
    PL_STEP_0_for_c1c3cm1c6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c3cm1c6_weight(0), c1c3cm1c6_weight(1));
    PL_STEP_0_for_c0c3cm2cm8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c3cm2cm8_weight(0), c0c3cm2cm8_weight(1));
    PL_STEP_0_for_c0cm2c0cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm2c0cm3_weight(0), c0cm2c0cm3_weight(1));
    PL_STEP_0_for_cm1cm5cm1cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm5cm1cm2_weight(0), cm1cm5cm1cm2_weight(1));
    PL_STEP_0_for_c2cm1c2c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2cm1c2c1_weight(0), c2cm1c2c1_weight(1));
    PL_STEP_0_for_c3cm7cm2cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3cm7cm2cm2_weight(0), c3cm7cm2cm2_weight(1));
    PL_STEP_0_for_c0cm1cm3cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm1cm3cm1_weight(0), c0cm1cm3cm1_weight(1));
    PL_STEP_0_for_c0cm2c3cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm2c3cm3_weight(0), c0cm2c3cm3_weight(1));
    PL_STEP_0_for_c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0_weight(0), c0c0c0c0_weight(1));


    c6c1c3c8_c0c1c1c1_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 5,
			B_WIDTH => 2,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c6c1c3c8_weight(1)(5-1 downto 0),
			B	=> c0c1c1c1_weight(1)(2-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c6c1c3c8,
			CxB => R_c0c1c1c1
		);

    c0c0c0cm5_c0cm2c3cm3_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 4,
			B_WIDTH => 3,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c0c0c0cm5_weight(1)(4-1 downto 0),
			B	=> c0cm2c3cm3_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c0c0cm5,
			CxB => R_c0cm2c3cm3
		);

    c1c3cm1c6_c0cm1cm3cm1_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 4,
			B_WIDTH => 3,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c1c3cm1c6_weight(1)(4-1 downto 0),
			B	=> c0cm1cm3cm1_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1c3cm1c6,
			CxB => R_c0cm1cm3cm1
		);

    c0c3cm2cm8_c2cm1c2c1_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 4,
			B_WIDTH => 3,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c0c3cm2cm8_weight(1)(4-1 downto 0),
			B	=> c2cm1c2c1_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c3cm2cm8,
			CxB => R_c2cm1c2c1
		);

    cm1cm5cm1cm2_c0cm2c0cm3_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 4,
			B_WIDTH => 3,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm1cm5cm1cm2_weight(1)(4-1 downto 0),
			B	=> c0cm2c0cm3_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1cm5cm1cm2,
			CxB => R_c0cm2c0cm3
		);

    c3cm7cm2cm2_c2cm1c0c0_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 4,
			B_WIDTH => 3,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c3cm7cm2cm2_weight(1)(4-1 downto 0),
			B	=> c2cm1c0c0_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c3cm7cm2cm2,
			CxB => R_c2cm1c0c0
		);

    cm1c2cm1c2_c0c3c0c3_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 3,
			B_WIDTH => 3,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm1c2cm1c2_weight(1)(3-1 downto 0),
			B	=> c0c3c0c3_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1c2cm1c2,
			CxB => R_c0c3c0c3
		);




    c2cm4c0c0_MULT: entity work.TruncatedSingleMult
	generic map
		(
            A_WIDTH           => 8, --	sfix(3, -5)
            A_TRUNCATED_WIDTH => 3, -- This would be the MSB position of the weight
            B_WIDTH           => 7, --	ufix(5, -2)
            AxB_WIDTH         => 10, --	sfix(3, -7)
            AxB_FRAC_TRUNCATION => 0,
            B_IS_SIGNED       => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c2cm4c0c0_weight(1),
			B	=> X0_signal(1),
			AxB	=> R_c2cm4c0c0
		);

end architecture;
