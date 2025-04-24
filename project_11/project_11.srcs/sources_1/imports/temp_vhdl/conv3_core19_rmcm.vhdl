library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv3_core19_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(4-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        R_c1c0cm1cm4 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_c0c1c1cm5 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_c0cm54c0cm1 : out std_logic_vector(14-1 downto 0);   --	sfix(7, -7)
        R_c4cm44cm1c4 : out std_logic_vector(14-1 downto 0);   --	sfix(7, -7)
        R_cm1cm1cm1c1 : out std_logic_vector(9-1 downto 0);   --	sfix(2, -7)
        R_cm40c1c0c0 : out std_logic_vector(14-1 downto 0);   --	sfix(7, -7)
        R_c3c5cm1c1 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_cm1c2c0c0 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_c1c1c0cm1 : out std_logic_vector(9-1 downto 0);   --	sfix(2, -7)
        R_c6cm10c0c1 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_c2c5c16c1 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_cm5c1cm7c2 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_cm6c10cm3cm4 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_cm3cm1cm2c1 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_c0cm3c1cm2 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_c0c0c0c0 : out std_logic_vector(8-1 downto 0)  --	sfix(1, -7)
    );
end conv3_core19_rmcm;

architecture arch of conv3_core19_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C0CM1CM4_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C1C1CM5_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM54C0CM1_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4CM44CM1C4_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM1CM1C1_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM40C1C0C0_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C5CM1C1_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C2C0C0_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C1C0CM1_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6CM10C0C1_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C5C16C1_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5C1CM7C2_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6C10CM3CM4_WEIGHT  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3CM1CM2C1_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM3C1CM2_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(5, -2)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(3, -5)
    signal c1c0cm1cm4_weight    : PIPELINE_TYPE_FOR_C1C0CM1CM4_WEIGHT;
    -- sfix(3, -5)
    signal c0c1c1cm5_weight     : PIPELINE_TYPE_FOR_C0C1C1CM5_WEIGHT;
    -- sfix(3, -5)
    signal c0cm54c0cm1_weight   : PIPELINE_TYPE_FOR_C0CM54C0CM1_WEIGHT;
    -- sfix(3, -5)
    signal c4cm44cm1c4_weight   : PIPELINE_TYPE_FOR_C4CM44CM1C4_WEIGHT;
    -- sfix(3, -5)
    signal cm1cm1cm1c1_weight   : PIPELINE_TYPE_FOR_CM1CM1CM1C1_WEIGHT;
    -- sfix(3, -5)
    signal cm40c1c0c0_weight    : PIPELINE_TYPE_FOR_CM40C1C0C0_WEIGHT;
    -- sfix(3, -5)
    signal c3c5cm1c1_weight     : PIPELINE_TYPE_FOR_C3C5CM1C1_WEIGHT;
    -- sfix(3, -5)
    signal cm1c2c0c0_weight     : PIPELINE_TYPE_FOR_CM1C2C0C0_WEIGHT;
    -- sfix(3, -5)
    signal c1c1c0cm1_weight     : PIPELINE_TYPE_FOR_C1C1C0CM1_WEIGHT;
    -- sfix(3, -5)
    signal c6cm10c0c1_weight    : PIPELINE_TYPE_FOR_C6CM10C0C1_WEIGHT;
    -- sfix(3, -5)
    signal c2c5c16c1_weight     : PIPELINE_TYPE_FOR_C2C5C16C1_WEIGHT;
    -- sfix(3, -5)
    signal cm5c1cm7c2_weight    : PIPELINE_TYPE_FOR_CM5C1CM7C2_WEIGHT;
    -- sfix(3, -5)
    signal cm6c10cm3cm4_weight  : PIPELINE_TYPE_FOR_CM6C10CM3CM4_WEIGHT;
    -- sfix(3, -5)
    signal cm3cm1cm2c1_weight   : PIPELINE_TYPE_FOR_CM3CM1CM2C1_WEIGHT;
    -- sfix(3, -5)
    signal c0cm3c1cm2_weight    : PIPELINE_TYPE_FOR_C0CM3C1CM2_WEIGHT;
    -- sfix(3, -5)
    signal c0c0c0c0_weight      : PIPELINE_TYPE_FOR_C0C0C0C0_WEIGHT;

    -- The zero output
    signal c0c0c0c0 : std_logic_vector(8-1 downto 0); --	sfix(1, -7)

    -- If we use LUT multiplier and the input is unsigned, we have to cut away the msb of the result
    -- If this is the case, the temporary results are stored in the signals below.

    signal R_c3c5cm1c1_undelayed : std_logic_vector(11-1 downto 0);


begin
    c0c0c0c0 <= (others => '0');
    R_c0c0c0c0 <= c0c0c0c0;
    X0_signal(0) <= X0;



    WEIGHT_ROM: entity work.conv3_core19_rmcm_weightsconstant_memory
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
        
            dout1   => c1c0cm1cm4_weight(0), 
            dout2   => c0c1c1cm5_weight(0), 
            dout3   => c0cm54c0cm1_weight(0), 
            dout4   => c4cm44cm1c4_weight(0), 
            dout5   => cm1cm1cm1c1_weight(0), 
            dout6   => cm40c1c0c0_weight(0), 
            dout7   => c3c5cm1c1_weight(0), 
            dout8   => cm1c2c0c0_weight(0), 
            dout9   => c1c1c0cm1_weight(0), 
            dout10   => c6cm10c0c1_weight(0), 
            dout11   => c2c5c16c1_weight(0), 
            dout12   => cm5c1cm7c2_weight(0), 
            dout13   => cm6c10cm3cm4_weight(0), 
            dout14   => cm3cm1cm2c1_weight(0), 
            dout15   => c0cm3c1cm2_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_c1c0cm1cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c0cm1cm4_weight(0), c1c0cm1cm4_weight(1));
    PL_STEP_0_for_c0c1c1cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c1c1cm5_weight(0), c0c1c1cm5_weight(1));
    PL_STEP_0_for_c0cm54c0cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm54c0cm1_weight(0), c0cm54c0cm1_weight(1));
    PL_STEP_0_for_c4cm44cm1c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4cm44cm1c4_weight(0), c4cm44cm1c4_weight(1));
    PL_STEP_0_for_cm1cm1cm1c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm1cm1c1_weight(0), cm1cm1cm1c1_weight(1));
    PL_STEP_0_for_cm40c1c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm40c1c0c0_weight(0), cm40c1c0c0_weight(1));
    PL_STEP_0_for_c3c5cm1c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c5cm1c1_weight(0), c3c5cm1c1_weight(1));
    PL_STEP_0_for_cm1c2c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c2c0c0_weight(0), cm1c2c0c0_weight(1));
    PL_STEP_0_for_c1c1c0cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c1c0cm1_weight(0), c1c1c0cm1_weight(1));
    PL_STEP_0_for_c6cm10c0c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6cm10c0c1_weight(0), c6cm10c0c1_weight(1));
    PL_STEP_0_for_c2c5c16c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c5c16c1_weight(0), c2c5c16c1_weight(1));
    PL_STEP_0_for_cm5c1cm7c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5c1cm7c2_weight(0), cm5c1cm7c2_weight(1));
    PL_STEP_0_for_cm6c10cm3cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6c10cm3cm4_weight(0), cm6c10cm3cm4_weight(1));
    PL_STEP_0_for_cm3cm1cm2c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3cm1cm2c1_weight(0), cm3cm1cm2c1_weight(1));
    PL_STEP_0_for_c0cm3c1cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm3c1cm2_weight(0), c0cm3c1cm2_weight(1));
    PL_STEP_0_for_c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0_weight(0), c0c0c0c0_weight(1));


    c0cm54c0cm1_c1c1c0cm1_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 2,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c0cm54c0cm1_weight(1)(7-1 downto 0),
			B	=> c1c1c0cm1_weight(1)(2-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0cm54c0cm1,
			CxB => R_c1c1c0cm1
		);

    c4cm44cm1c4_cm1cm1cm1c1_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 2,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c4cm44cm1c4_weight(1)(7-1 downto 0),
			B	=> cm1cm1cm1c1_weight(1)(2-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c4cm44cm1c4,
			CxB => R_cm1cm1cm1c1
		);

    cm40c1c0c0_c0cm3c1cm2_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 3,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm40c1c0c0_weight(1)(7-1 downto 0),
			B	=> c0cm3c1cm2_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm40c1c0c0,
			CxB => R_c0cm3c1cm2
		);

    c2c5c16c1_cm3cm1cm2c1_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 6,
			B_WIDTH => 3,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c2c5c16c1_weight(1)(6-1 downto 0),
			B	=> cm3cm1cm2c1_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c2c5c16c1,
			CxB => R_cm3cm1cm2c1
		);

    c6cm10c0c1_cm1c2c0c0_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 5,
			B_WIDTH => 3,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c6cm10c0c1_weight(1)(5-1 downto 0),
			B	=> cm1c2c0c0_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c6cm10c0c1,
			CxB => R_cm1c2c0c0
		);

    cm6c10cm3cm4_c1c0cm1cm4_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 5,
			B_WIDTH => 3,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm6c10cm3cm4_weight(1)(5-1 downto 0),
			B	=> c1c0cm1cm4_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm6c10cm3cm4,
			CxB => R_c1c0cm1cm4
		);

    c0c1c1cm5_cm5c1cm7c2_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 4,
			B_WIDTH => 4,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c0c1c1cm5_weight(1)(4-1 downto 0),
			B	=> cm5c1cm7c2_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c1c1cm5,
			CxB => R_cm5c1cm7c2
		);




    c3c5cm1c1_MULT: entity work.TruncatedSingleMult
	generic map
		(
            A_WIDTH           => 8, --	sfix(3, -5)
            A_TRUNCATED_WIDTH => 4, -- This would be the MSB position of the weight
            B_WIDTH           => 7, --	ufix(5, -2)
            AxB_WIDTH         => 11, --	sfix(4, -7)
            AxB_FRAC_TRUNCATION => 0,
            B_IS_SIGNED       => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c3c5cm1c1_weight(1),
			B	=> X0_signal(1),
			AxB	=> R_c3c5cm1c1
		);

end architecture;
