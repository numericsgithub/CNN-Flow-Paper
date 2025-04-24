library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv3_core8_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(4-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        R_c4cm1c2cm1 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_c1cm1cm7c14 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_c0cm47c0c0 : out std_logic_vector(14-1 downto 0);   --	sfix(7, -7)
        R_c10cm12c14c19 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_cm5c0c1cm2 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_cm3c2c0c0 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_cm8cm5c10c1 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_cm1c3c0c0 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_c0cm11c0cm7 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_c7c42c0cm13 : out std_logic_vector(14-1 downto 0);   --	sfix(7, -7)
        R_c1c9cm27cm1 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_c15cm4c14cm4 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_cm2c2c0c0 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_cm1c21cm4cm8 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_cm6cm1c62cm1 : out std_logic_vector(14-1 downto 0);   --	sfix(7, -7)
        R_c1c4c9cm2 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_c0c0c0c0 : out std_logic_vector(8-1 downto 0)  --	sfix(1, -7)
    );
end conv3_core8_rmcm;

architecture arch of conv3_core8_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_C4CM1C2CM1_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM1CM7C14_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM47C0C0_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C10CM12C14C19_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5C0C1CM2_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3C2C0C0_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM8CM5C10C1_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C3C0C0_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM11C0CM7_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C7C42C0CM13_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C9CM27CM1_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C15CM4C14CM4_WEIGHT  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C2C0C0_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C21CM4CM8_WEIGHT  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6CM1C62CM1_WEIGHT  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C4C9CM2_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(5, -2)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(3, -5)
    signal c4cm1c2cm1_weight    : PIPELINE_TYPE_FOR_C4CM1C2CM1_WEIGHT;
    -- sfix(3, -5)
    signal c1cm1cm7c14_weight   : PIPELINE_TYPE_FOR_C1CM1CM7C14_WEIGHT;
    -- sfix(3, -5)
    signal c0cm47c0c0_weight    : PIPELINE_TYPE_FOR_C0CM47C0C0_WEIGHT;
    -- sfix(3, -5)
    signal c10cm12c14c19_weight : PIPELINE_TYPE_FOR_C10CM12C14C19_WEIGHT;
    -- sfix(3, -5)
    signal cm5c0c1cm2_weight    : PIPELINE_TYPE_FOR_CM5C0C1CM2_WEIGHT;
    -- sfix(3, -5)
    signal cm3c2c0c0_weight     : PIPELINE_TYPE_FOR_CM3C2C0C0_WEIGHT;
    -- sfix(3, -5)
    signal cm8cm5c10c1_weight   : PIPELINE_TYPE_FOR_CM8CM5C10C1_WEIGHT;
    -- sfix(3, -5)
    signal cm1c3c0c0_weight     : PIPELINE_TYPE_FOR_CM1C3C0C0_WEIGHT;
    -- sfix(3, -5)
    signal c0cm11c0cm7_weight   : PIPELINE_TYPE_FOR_C0CM11C0CM7_WEIGHT;
    -- sfix(3, -5)
    signal c7c42c0cm13_weight   : PIPELINE_TYPE_FOR_C7C42C0CM13_WEIGHT;
    -- sfix(3, -5)
    signal c1c9cm27cm1_weight   : PIPELINE_TYPE_FOR_C1C9CM27CM1_WEIGHT;
    -- sfix(3, -5)
    signal c15cm4c14cm4_weight  : PIPELINE_TYPE_FOR_C15CM4C14CM4_WEIGHT;
    -- sfix(3, -5)
    signal cm2c2c0c0_weight     : PIPELINE_TYPE_FOR_CM2C2C0C0_WEIGHT;
    -- sfix(3, -5)
    signal cm1c21cm4cm8_weight  : PIPELINE_TYPE_FOR_CM1C21CM4CM8_WEIGHT;
    -- sfix(3, -5)
    signal cm6cm1c62cm1_weight  : PIPELINE_TYPE_FOR_CM6CM1C62CM1_WEIGHT;
    -- sfix(3, -5)
    signal c1c4c9cm2_weight     : PIPELINE_TYPE_FOR_C1C4C9CM2_WEIGHT;
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



    WEIGHT_ROM: entity work.conv3_core8_rmcm_weightsconstant_memory
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
        
            dout1   => c4cm1c2cm1_weight(0), 
            dout2   => c1cm1cm7c14_weight(0), 
            dout3   => c0cm47c0c0_weight(0), 
            dout4   => c10cm12c14c19_weight(0), 
            dout5   => cm5c0c1cm2_weight(0), 
            dout6   => cm3c2c0c0_weight(0), 
            dout7   => cm8cm5c10c1_weight(0), 
            dout8   => cm1c3c0c0_weight(0), 
            dout9   => c0cm11c0cm7_weight(0), 
            dout10   => c7c42c0cm13_weight(0), 
            dout11   => c1c9cm27cm1_weight(0), 
            dout12   => c15cm4c14cm4_weight(0), 
            dout13   => cm2c2c0c0_weight(0), 
            dout14   => cm1c21cm4cm8_weight(0), 
            dout15   => cm6cm1c62cm1_weight(0), 
            dout16   => c1c4c9cm2_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_c4cm1c2cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4cm1c2cm1_weight(0), c4cm1c2cm1_weight(1));
    PL_STEP_0_for_c1cm1cm7c14_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm1cm7c14_weight(0), c1cm1cm7c14_weight(1));
    PL_STEP_0_for_c0cm47c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm47c0c0_weight(0), c0cm47c0c0_weight(1));
    PL_STEP_0_for_c10cm12c14c19_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c10cm12c14c19_weight(0), c10cm12c14c19_weight(1));
    PL_STEP_0_for_cm5c0c1cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5c0c1cm2_weight(0), cm5c0c1cm2_weight(1));
    PL_STEP_0_for_cm3c2c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3c2c0c0_weight(0), cm3c2c0c0_weight(1));
    PL_STEP_0_for_cm8cm5c10c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm8cm5c10c1_weight(0), cm8cm5c10c1_weight(1));
    PL_STEP_0_for_cm1c3c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c3c0c0_weight(0), cm1c3c0c0_weight(1));
    PL_STEP_0_for_c0cm11c0cm7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm11c0cm7_weight(0), c0cm11c0cm7_weight(1));
    PL_STEP_0_for_c7c42c0cm13_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c7c42c0cm13_weight(0), c7c42c0cm13_weight(1));
    PL_STEP_0_for_c1c9cm27cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c9cm27cm1_weight(0), c1c9cm27cm1_weight(1));
    PL_STEP_0_for_c15cm4c14cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c15cm4c14cm4_weight(0), c15cm4c14cm4_weight(1));
    PL_STEP_0_for_cm2c2c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c2c0c0_weight(0), cm2c2c0c0_weight(1));
    PL_STEP_0_for_cm1c21cm4cm8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c21cm4cm8_weight(0), cm1c21cm4cm8_weight(1));
    PL_STEP_0_for_cm6cm1c62cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6cm1c62cm1_weight(0), cm6cm1c62cm1_weight(1));
    PL_STEP_0_for_c1c4c9cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c4c9cm2_weight(0), c1c4c9cm2_weight(1));
    PL_STEP_0_for_c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0_weight(0), c0c0c0c0_weight(1));


    c0cm47c0c0_cm2c2c0c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0cm47c0c0_weight(1)(7-1 downto 0),
			B	=> cm2c2c0c0_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0cm47c0c0,
			CxB => R_cm2c2c0c0
		);

    c7c42c0cm13_cm1c3c0c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c7c42c0cm13_weight(1)(7-1 downto 0),
			B	=> cm1c3c0c0_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c7c42c0cm13,
			CxB => R_cm1c3c0c0
		);

    cm6cm1c62cm1_cm3c2c0c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm6cm1c62cm1_weight(1)(7-1 downto 0),
			B	=> cm3c2c0c0_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm6cm1c62cm1,
			CxB => R_cm3c2c0c0
		);

    c10cm12c14c19_cm5c0c1cm2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c10cm12c14c19_weight(1)(6-1 downto 0),
			B	=> cm5c0c1cm2_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c10cm12c14c19,
			CxB => R_cm5c0c1cm2
		);

    c1c9cm27cm1_c4cm1c2cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c1c9cm27cm1_weight(1)(6-1 downto 0),
			B	=> c4cm1c2cm1_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1c9cm27cm1,
			CxB => R_c4cm1c2cm1
		);

    cm1c21cm4cm8_c1c4c9cm2_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 6,
			B_WIDTH => 5,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm1c21cm4cm8_weight(1)(6-1 downto 0),
			B	=> c1c4c9cm2_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1c21cm4cm8,
			CxB => R_c1c4c9cm2
		);

    c1cm1cm7c14_c15cm4c14cm4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c1cm1cm7c14_weight(1)(5-1 downto 0),
			B	=> c15cm4c14cm4_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1cm1cm7c14,
			CxB => R_c15cm4c14cm4
		);

    cm8cm5c10c1_c0cm11c0cm7_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm8cm5c10c1_weight(1)(5-1 downto 0),
			B	=> c0cm11c0cm7_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm8cm5c10c1,
			CxB => R_c0cm11c0cm7
		);




end architecture;
