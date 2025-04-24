library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv3_core2_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(4-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        R_cm2cm19cm3cm4 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_c1c0cm1c6 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_c0cm9c0cm6 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_cm1cm5c0cm1 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_c2c18c13cm1 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_c3cm1c0c0 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_cm1c2c2cm4 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_c7cm8c0c19 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_c2c0cm5c9 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_cm2c1c0cm1 : out std_logic_vector(9-1 downto 0);   --	sfix(2, -7)
        R_cm14cm2c0c1 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_c1c0c0cm4 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_c2cm29c0c0 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_c4c3c2cm1 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_c12c0c6cm7 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_cm3cm1c0cm38 : out std_logic_vector(14-1 downto 0);   --	sfix(7, -7)
        R_c0c0c0c0 : out std_logic_vector(8-1 downto 0)  --	sfix(1, -7)
    );
end conv3_core2_rmcm;

architecture arch of conv3_core2_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM19CM3CM4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C0CM1C6_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM9C0CM6_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM5C0CM1_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C18C13CM1_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3CM1C0C0_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C2C2CM4_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C7CM8C0C19_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C0CM5C9_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C1C0CM1_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM14CM2C0C1_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C0C0CM4_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2CM29C0C0_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4C3C2CM1_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C12C0C6CM7_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3CM1C0CM38_WEIGHT  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(5, -2)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(3, -5)
    signal cm2cm19cm3cm4_weight : PIPELINE_TYPE_FOR_CM2CM19CM3CM4_WEIGHT;
    -- sfix(3, -5)
    signal c1c0cm1c6_weight     : PIPELINE_TYPE_FOR_C1C0CM1C6_WEIGHT;
    -- sfix(3, -5)
    signal c0cm9c0cm6_weight    : PIPELINE_TYPE_FOR_C0CM9C0CM6_WEIGHT;
    -- sfix(3, -5)
    signal cm1cm5c0cm1_weight   : PIPELINE_TYPE_FOR_CM1CM5C0CM1_WEIGHT;
    -- sfix(3, -5)
    signal c2c18c13cm1_weight   : PIPELINE_TYPE_FOR_C2C18C13CM1_WEIGHT;
    -- sfix(3, -5)
    signal c3cm1c0c0_weight     : PIPELINE_TYPE_FOR_C3CM1C0C0_WEIGHT;
    -- sfix(3, -5)
    signal cm1c2c2cm4_weight    : PIPELINE_TYPE_FOR_CM1C2C2CM4_WEIGHT;
    -- sfix(3, -5)
    signal c7cm8c0c19_weight    : PIPELINE_TYPE_FOR_C7CM8C0C19_WEIGHT;
    -- sfix(3, -5)
    signal c2c0cm5c9_weight     : PIPELINE_TYPE_FOR_C2C0CM5C9_WEIGHT;
    -- sfix(3, -5)
    signal cm2c1c0cm1_weight    : PIPELINE_TYPE_FOR_CM2C1C0CM1_WEIGHT;
    -- sfix(3, -5)
    signal cm14cm2c0c1_weight   : PIPELINE_TYPE_FOR_CM14CM2C0C1_WEIGHT;
    -- sfix(3, -5)
    signal c1c0c0cm4_weight     : PIPELINE_TYPE_FOR_C1C0C0CM4_WEIGHT;
    -- sfix(3, -5)
    signal c2cm29c0c0_weight    : PIPELINE_TYPE_FOR_C2CM29C0C0_WEIGHT;
    -- sfix(3, -5)
    signal c4c3c2cm1_weight     : PIPELINE_TYPE_FOR_C4C3C2CM1_WEIGHT;
    -- sfix(3, -5)
    signal c12c0c6cm7_weight    : PIPELINE_TYPE_FOR_C12C0C6CM7_WEIGHT;
    -- sfix(3, -5)
    signal cm3cm1c0cm38_weight  : PIPELINE_TYPE_FOR_CM3CM1C0CM38_WEIGHT;
    -- sfix(3, -5)
    signal c0c0c0c0_weight      : PIPELINE_TYPE_FOR_C0C0C0C0_WEIGHT;

    -- The zero output
    signal c0c0c0c0 : std_logic_vector(8-1 downto 0); --	sfix(1, -7)

    -- If we use LUT multiplier and the input is unsigned, we have to cut away the msb of the result
    -- If this is the case, the temporary results are stored in the signals below.


begin
    c0c0c0c0 <= (others => '0');
    R_c0c0c0c0 <= c0c0c0c0;
    X0_signal(0) <= X0;



    WEIGHT_ROM: entity work.conv3_core2_rmcm_weightsconstant_memory
        generic map
        (
            XI_WIDTH        	          => 8, 
            ARRAY_SIZE                    => 4,
            WORDS_PER_ADDR                => 16
        )
        port map
        (
            clk => clk,
            data_index => unsigned(SEL),
        
            dout1   => cm2cm19cm3cm4_weight(0), 
            dout2   => c1c0cm1c6_weight(0), 
            dout3   => c0cm9c0cm6_weight(0), 
            dout4   => cm1cm5c0cm1_weight(0), 
            dout5   => c2c18c13cm1_weight(0), 
            dout6   => c3cm1c0c0_weight(0), 
            dout7   => cm1c2c2cm4_weight(0), 
            dout8   => c7cm8c0c19_weight(0), 
            dout9   => c2c0cm5c9_weight(0), 
            dout10   => cm2c1c0cm1_weight(0), 
            dout11   => cm14cm2c0c1_weight(0), 
            dout12   => c1c0c0cm4_weight(0), 
            dout13   => c2cm29c0c0_weight(0), 
            dout14   => c4c3c2cm1_weight(0), 
            dout15   => c12c0c6cm7_weight(0), 
            dout16   => cm3cm1c0cm38_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_cm2cm19cm3cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm19cm3cm4_weight(0), cm2cm19cm3cm4_weight(1));
    PL_STEP_0_for_c1c0cm1c6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c0cm1c6_weight(0), c1c0cm1c6_weight(1));
    PL_STEP_0_for_c0cm9c0cm6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm9c0cm6_weight(0), c0cm9c0cm6_weight(1));
    PL_STEP_0_for_cm1cm5c0cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm5c0cm1_weight(0), cm1cm5c0cm1_weight(1));
    PL_STEP_0_for_c2c18c13cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c18c13cm1_weight(0), c2c18c13cm1_weight(1));
    PL_STEP_0_for_c3cm1c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3cm1c0c0_weight(0), c3cm1c0c0_weight(1));
    PL_STEP_0_for_cm1c2c2cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c2c2cm4_weight(0), cm1c2c2cm4_weight(1));
    PL_STEP_0_for_c7cm8c0c19_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c7cm8c0c19_weight(0), c7cm8c0c19_weight(1));
    PL_STEP_0_for_c2c0cm5c9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c0cm5c9_weight(0), c2c0cm5c9_weight(1));
    PL_STEP_0_for_cm2c1c0cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c1c0cm1_weight(0), cm2c1c0cm1_weight(1));
    PL_STEP_0_for_cm14cm2c0c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm14cm2c0c1_weight(0), cm14cm2c0c1_weight(1));
    PL_STEP_0_for_c1c0c0cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c0c0cm4_weight(0), c1c0c0cm4_weight(1));
    PL_STEP_0_for_c2cm29c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2cm29c0c0_weight(0), c2cm29c0c0_weight(1));
    PL_STEP_0_for_c4c3c2cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4c3c2cm1_weight(0), c4c3c2cm1_weight(1));
    PL_STEP_0_for_c12c0c6cm7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c12c0c6cm7_weight(0), c12c0c6cm7_weight(1));
    PL_STEP_0_for_cm3cm1c0cm38_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3cm1c0cm38_weight(0), cm3cm1c0cm38_weight(1));
    PL_STEP_0_for_c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0_weight(0), c0c0c0c0_weight(1));


    cm3cm1c0cm38_cm2c1c0cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm3cm1c0cm38_weight(1)(7-1 downto 0),
			B	=> cm2c1c0cm1_weight(1)(2-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm3cm1c0cm38,
			CxB => R_cm2c1c0cm1
		);

    cm2cm19cm3cm4_c1c0c0cm4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2cm19cm3cm4_weight(1)(6-1 downto 0),
			B	=> c1c0c0cm4_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2cm19cm3cm4,
			CxB => R_c1c0c0cm4
		);

    c2c18c13cm1_cm1c2c2cm4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c2c18c13cm1_weight(1)(6-1 downto 0),
			B	=> cm1c2c2cm4_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c2c18c13cm1,
			CxB => R_cm1c2c2cm4
		);

    c7cm8c0c19_c3cm1c0c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c7cm8c0c19_weight(1)(6-1 downto 0),
			B	=> c3cm1c0c0_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c7cm8c0c19,
			CxB => R_c3cm1c0c0
		);

    c2cm29c0c0_c4c3c2cm1_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 6,
			B_WIDTH => 4,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c2cm29c0c0_weight(1)(6-1 downto 0),
			B	=> c4c3c2cm1_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c2cm29c0c0,
			CxB => R_c4c3c2cm1
		);

    c0cm9c0cm6_cm1cm5c0cm1_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 5,
			B_WIDTH => 4,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c0cm9c0cm6_weight(1)(5-1 downto 0),
			B	=> cm1cm5c0cm1_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0cm9c0cm6,
			CxB => R_cm1cm5c0cm1
		);

    c2c0cm5c9_c1c0cm1c6_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 5,
			B_WIDTH => 4,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c2c0cm5c9_weight(1)(5-1 downto 0),
			B	=> c1c0cm1c6_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c2c0cm5c9,
			CxB => R_c1c0cm1c6
		);

    cm14cm2c0c1_c12c0c6cm7_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 5,
			B_WIDTH => 5,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm14cm2c0c1_weight(1)(5-1 downto 0),
			B	=> c12c0c6cm7_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm14cm2c0c1,
			CxB => R_c12c0c6cm7
		);




end architecture;
