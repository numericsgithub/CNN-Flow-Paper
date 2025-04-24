library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv3_core3_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(4-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        R_c4cm3cm1cm1 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_cm2c4cm9cm11 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_cm2cm72c0c1 : out std_logic_vector(15-1 downto 0);   --	sfix(8, -7)
        R_c5c5c4c14 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_cm7cm1c0cm2 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_cm10c3c0c0 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_cm14c3c6c0 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_cm2c0cm1c0 : out std_logic_vector(9-1 downto 0);   --	sfix(2, -7)
        R_c0c0cm2c6 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_c24cm5c0c9 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_c0c9c4cm1 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_cm5c10cm6c6 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_cm2c1c0c0 : out std_logic_vector(9-1 downto 0);   --	sfix(2, -7)
        R_cm3c40c1cm7 : out std_logic_vector(14-1 downto 0);   --	sfix(7, -7)
        R_c1c0c3c1 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_c0cm7cm5c0 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_c0c0c0c0 : out std_logic_vector(8-1 downto 0)  --	sfix(1, -7)
    );
end conv3_core3_rmcm;

architecture arch of conv3_core3_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_C4CM3CM1CM1_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C4CM9CM11_WEIGHT  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM72C0C1_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5C5C4C14_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM7CM1C0CM2_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM10C3C0C0_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM14C3C6C0_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C0CM1C0_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0CM2C6_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C24CM5C0C9_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C9C4CM1_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5C10CM6C6_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C1C0C0_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3C40C1CM7_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C0C3C1_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM7CM5C0_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(5, -2)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(3, -5)
    signal c4cm3cm1cm1_weight   : PIPELINE_TYPE_FOR_C4CM3CM1CM1_WEIGHT;
    -- sfix(3, -5)
    signal cm2c4cm9cm11_weight  : PIPELINE_TYPE_FOR_CM2C4CM9CM11_WEIGHT;
    -- sfix(3, -5)
    signal cm2cm72c0c1_weight   : PIPELINE_TYPE_FOR_CM2CM72C0C1_WEIGHT;
    -- sfix(3, -5)
    signal c5c5c4c14_weight     : PIPELINE_TYPE_FOR_C5C5C4C14_WEIGHT;
    -- sfix(3, -5)
    signal cm7cm1c0cm2_weight   : PIPELINE_TYPE_FOR_CM7CM1C0CM2_WEIGHT;
    -- sfix(3, -5)
    signal cm10c3c0c0_weight    : PIPELINE_TYPE_FOR_CM10C3C0C0_WEIGHT;
    -- sfix(3, -5)
    signal cm14c3c6c0_weight    : PIPELINE_TYPE_FOR_CM14C3C6C0_WEIGHT;
    -- sfix(3, -5)
    signal cm2c0cm1c0_weight    : PIPELINE_TYPE_FOR_CM2C0CM1C0_WEIGHT;
    -- sfix(3, -5)
    signal c0c0cm2c6_weight     : PIPELINE_TYPE_FOR_C0C0CM2C6_WEIGHT;
    -- sfix(3, -5)
    signal c24cm5c0c9_weight    : PIPELINE_TYPE_FOR_C24CM5C0C9_WEIGHT;
    -- sfix(3, -5)
    signal c0c9c4cm1_weight     : PIPELINE_TYPE_FOR_C0C9C4CM1_WEIGHT;
    -- sfix(3, -5)
    signal cm5c10cm6c6_weight   : PIPELINE_TYPE_FOR_CM5C10CM6C6_WEIGHT;
    -- sfix(3, -5)
    signal cm2c1c0c0_weight     : PIPELINE_TYPE_FOR_CM2C1C0C0_WEIGHT;
    -- sfix(3, -5)
    signal cm3c40c1cm7_weight   : PIPELINE_TYPE_FOR_CM3C40C1CM7_WEIGHT;
    -- sfix(3, -5)
    signal c1c0c3c1_weight      : PIPELINE_TYPE_FOR_C1C0C3C1_WEIGHT;
    -- sfix(3, -5)
    signal c0cm7cm5c0_weight    : PIPELINE_TYPE_FOR_C0CM7CM5C0_WEIGHT;
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



    WEIGHT_ROM: entity work.conv3_core3_rmcm_weightsconstant_memory
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
        
            dout1   => c4cm3cm1cm1_weight(0), 
            dout2   => cm2c4cm9cm11_weight(0), 
            dout3   => cm2cm72c0c1_weight(0), 
            dout4   => c5c5c4c14_weight(0), 
            dout5   => cm7cm1c0cm2_weight(0), 
            dout6   => cm10c3c0c0_weight(0), 
            dout7   => cm14c3c6c0_weight(0), 
            dout8   => cm2c0cm1c0_weight(0), 
            dout9   => c0c0cm2c6_weight(0), 
            dout10   => c24cm5c0c9_weight(0), 
            dout11   => c0c9c4cm1_weight(0), 
            dout12   => cm5c10cm6c6_weight(0), 
            dout13   => cm2c1c0c0_weight(0), 
            dout14   => cm3c40c1cm7_weight(0), 
            dout15   => c1c0c3c1_weight(0), 
            dout16   => c0cm7cm5c0_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_c4cm3cm1cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4cm3cm1cm1_weight(0), c4cm3cm1cm1_weight(1));
    PL_STEP_0_for_cm2c4cm9cm11_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c4cm9cm11_weight(0), cm2c4cm9cm11_weight(1));
    PL_STEP_0_for_cm2cm72c0c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm72c0c1_weight(0), cm2cm72c0c1_weight(1));
    PL_STEP_0_for_c5c5c4c14_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5c5c4c14_weight(0), c5c5c4c14_weight(1));
    PL_STEP_0_for_cm7cm1c0cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm7cm1c0cm2_weight(0), cm7cm1c0cm2_weight(1));
    PL_STEP_0_for_cm10c3c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm10c3c0c0_weight(0), cm10c3c0c0_weight(1));
    PL_STEP_0_for_cm14c3c6c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm14c3c6c0_weight(0), cm14c3c6c0_weight(1));
    PL_STEP_0_for_cm2c0cm1c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c0cm1c0_weight(0), cm2c0cm1c0_weight(1));
    PL_STEP_0_for_c0c0cm2c6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0cm2c6_weight(0), c0c0cm2c6_weight(1));
    PL_STEP_0_for_c24cm5c0c9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c24cm5c0c9_weight(0), c24cm5c0c9_weight(1));
    PL_STEP_0_for_c0c9c4cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c9c4cm1_weight(0), c0c9c4cm1_weight(1));
    PL_STEP_0_for_cm5c10cm6c6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5c10cm6c6_weight(0), cm5c10cm6c6_weight(1));
    PL_STEP_0_for_cm2c1c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c1c0c0_weight(0), cm2c1c0c0_weight(1));
    PL_STEP_0_for_cm3c40c1cm7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3c40c1cm7_weight(0), cm3c40c1cm7_weight(1));
    PL_STEP_0_for_c1c0c3c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c0c3c1_weight(0), c1c0c3c1_weight(1));
    PL_STEP_0_for_c0cm7cm5c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm7cm5c0_weight(0), c0cm7cm5c0_weight(1));
    PL_STEP_0_for_c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0_weight(0), c0c0c0c0_weight(1));


    cm2cm72c0c1_cm2c1c0c0_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 8,
			B_WIDTH => 2,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm2cm72c0c1_weight(1)(8-1 downto 0),
			B	=> cm2c1c0c0_weight(1)(2-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2cm72c0c1,
			CxB => R_cm2c1c0c0
		);

    cm3c40c1cm7_cm2c0cm1c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm3c40c1cm7_weight(1)(7-1 downto 0),
			B	=> cm2c0cm1c0_weight(1)(2-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm3c40c1cm7,
			CxB => R_cm2c0cm1c0
		);

    c24cm5c0c9_c1c0c3c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c24cm5c0c9_weight(1)(6-1 downto 0),
			B	=> c1c0c3c1_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c24cm5c0c9,
			CxB => R_c1c0c3c1
		);

    cm2c4cm9cm11_c0cm7cm5c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2c4cm9cm11_weight(1)(5-1 downto 0),
			B	=> c0cm7cm5c0_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2c4cm9cm11,
			CxB => R_c0cm7cm5c0
		);

    c5c5c4c14_c0c0cm2c6_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c5c5c4c14_weight(1)(5-1 downto 0),
			B	=> c0c0cm2c6_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c5c5c4c14,
			CxB => R_c0c0cm2c6
		);

    cm10c3c0c0_cm7cm1c0cm2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm10c3c0c0_weight(1)(5-1 downto 0),
			B	=> cm7cm1c0cm2_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm10c3c0c0,
			CxB => R_cm7cm1c0cm2
		);

    cm14c3c6c0_c4cm3cm1cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm14c3c6c0_weight(1)(5-1 downto 0),
			B	=> c4cm3cm1cm1_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm14c3c6c0,
			CxB => R_c4cm3cm1cm1
		);

    c0c9c4cm1_cm5c10cm6c6_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0c9c4cm1_weight(1)(5-1 downto 0),
			B	=> cm5c10cm6c6_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c9c4cm1,
			CxB => R_cm5c10cm6c6
		);




end architecture;
