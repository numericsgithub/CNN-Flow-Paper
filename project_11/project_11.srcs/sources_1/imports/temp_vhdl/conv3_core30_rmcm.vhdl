library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv3_core30_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(4-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        R_cm1c2cm1c1 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_c4cm2c12c5 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_cm1c14c0c7 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_cm7cm1cm1cm7 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_cm3cm5c6cm3 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_cm19cm3c0c0 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_cm1c7c5c2 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_c0c4c1cm6 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_cm2cm2c2c18 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_c1c9c0c2 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_cm5cm2cm1c4 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_cm7c0c0c9 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_c3c0c0c0 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_c0c20cm2cm2 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_c4c3cm2c3 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_c8c10cm3c9 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_c0c0c0c0 : out std_logic_vector(8-1 downto 0)  --	sfix(1, -7)
    );
end conv3_core30_rmcm;

architecture arch of conv3_core30_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C2CM1C1_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4CM2C12C5_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C14C0C7_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM7CM1CM1CM7_WEIGHT  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3CM5C6CM3_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM19CM3C0C0_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C7C5C2_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C4C1CM6_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM2C2C18_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C9C0C2_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5CM2CM1C4_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM7C0C0C9_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C0C0C0_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C20CM2CM2_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4C3CM2C3_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C8C10CM3C9_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(5, -2)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(3, -5)
    signal cm1c2cm1c1_weight    : PIPELINE_TYPE_FOR_CM1C2CM1C1_WEIGHT;
    -- sfix(3, -5)
    signal c4cm2c12c5_weight    : PIPELINE_TYPE_FOR_C4CM2C12C5_WEIGHT;
    -- sfix(3, -5)
    signal cm1c14c0c7_weight    : PIPELINE_TYPE_FOR_CM1C14C0C7_WEIGHT;
    -- sfix(3, -5)
    signal cm7cm1cm1cm7_weight  : PIPELINE_TYPE_FOR_CM7CM1CM1CM7_WEIGHT;
    -- sfix(3, -5)
    signal cm3cm5c6cm3_weight   : PIPELINE_TYPE_FOR_CM3CM5C6CM3_WEIGHT;
    -- sfix(3, -5)
    signal cm19cm3c0c0_weight   : PIPELINE_TYPE_FOR_CM19CM3C0C0_WEIGHT;
    -- sfix(3, -5)
    signal cm1c7c5c2_weight     : PIPELINE_TYPE_FOR_CM1C7C5C2_WEIGHT;
    -- sfix(3, -5)
    signal c0c4c1cm6_weight     : PIPELINE_TYPE_FOR_C0C4C1CM6_WEIGHT;
    -- sfix(3, -5)
    signal cm2cm2c2c18_weight   : PIPELINE_TYPE_FOR_CM2CM2C2C18_WEIGHT;
    -- sfix(3, -5)
    signal c1c9c0c2_weight      : PIPELINE_TYPE_FOR_C1C9C0C2_WEIGHT;
    -- sfix(3, -5)
    signal cm5cm2cm1c4_weight   : PIPELINE_TYPE_FOR_CM5CM2CM1C4_WEIGHT;
    -- sfix(3, -5)
    signal cm7c0c0c9_weight     : PIPELINE_TYPE_FOR_CM7C0C0C9_WEIGHT;
    -- sfix(3, -5)
    signal c3c0c0c0_weight      : PIPELINE_TYPE_FOR_C3C0C0C0_WEIGHT;
    -- sfix(3, -5)
    signal c0c20cm2cm2_weight   : PIPELINE_TYPE_FOR_C0C20CM2CM2_WEIGHT;
    -- sfix(3, -5)
    signal c4c3cm2c3_weight     : PIPELINE_TYPE_FOR_C4C3CM2C3_WEIGHT;
    -- sfix(3, -5)
    signal c8c10cm3c9_weight    : PIPELINE_TYPE_FOR_C8C10CM3C9_WEIGHT;
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



    WEIGHT_ROM: entity work.conv3_core30_rmcm_weightsconstant_memory
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
        
            dout1   => cm1c2cm1c1_weight(0), 
            dout2   => c4cm2c12c5_weight(0), 
            dout3   => cm1c14c0c7_weight(0), 
            dout4   => cm7cm1cm1cm7_weight(0), 
            dout5   => cm3cm5c6cm3_weight(0), 
            dout6   => cm19cm3c0c0_weight(0), 
            dout7   => cm1c7c5c2_weight(0), 
            dout8   => c0c4c1cm6_weight(0), 
            dout9   => cm2cm2c2c18_weight(0), 
            dout10   => c1c9c0c2_weight(0), 
            dout11   => cm5cm2cm1c4_weight(0), 
            dout12   => cm7c0c0c9_weight(0), 
            dout13   => c3c0c0c0_weight(0), 
            dout14   => c0c20cm2cm2_weight(0), 
            dout15   => c4c3cm2c3_weight(0), 
            dout16   => c8c10cm3c9_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_cm1c2cm1c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c2cm1c1_weight(0), cm1c2cm1c1_weight(1));
    PL_STEP_0_for_c4cm2c12c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4cm2c12c5_weight(0), c4cm2c12c5_weight(1));
    PL_STEP_0_for_cm1c14c0c7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c14c0c7_weight(0), cm1c14c0c7_weight(1));
    PL_STEP_0_for_cm7cm1cm1cm7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm7cm1cm1cm7_weight(0), cm7cm1cm1cm7_weight(1));
    PL_STEP_0_for_cm3cm5c6cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3cm5c6cm3_weight(0), cm3cm5c6cm3_weight(1));
    PL_STEP_0_for_cm19cm3c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm19cm3c0c0_weight(0), cm19cm3c0c0_weight(1));
    PL_STEP_0_for_cm1c7c5c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c7c5c2_weight(0), cm1c7c5c2_weight(1));
    PL_STEP_0_for_c0c4c1cm6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c4c1cm6_weight(0), c0c4c1cm6_weight(1));
    PL_STEP_0_for_cm2cm2c2c18_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm2c2c18_weight(0), cm2cm2c2c18_weight(1));
    PL_STEP_0_for_c1c9c0c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c9c0c2_weight(0), c1c9c0c2_weight(1));
    PL_STEP_0_for_cm5cm2cm1c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5cm2cm1c4_weight(0), cm5cm2cm1c4_weight(1));
    PL_STEP_0_for_cm7c0c0c9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm7c0c0c9_weight(0), cm7c0c0c9_weight(1));
    PL_STEP_0_for_c3c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c0c0c0_weight(0), c3c0c0c0_weight(1));
    PL_STEP_0_for_c0c20cm2cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c20cm2cm2_weight(0), c0c20cm2cm2_weight(1));
    PL_STEP_0_for_c4c3cm2c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4c3cm2c3_weight(0), c4c3cm2c3_weight(1));
    PL_STEP_0_for_c8c10cm3c9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c8c10cm3c9_weight(0), c8c10cm3c9_weight(1));
    PL_STEP_0_for_c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0_weight(0), c0c0c0c0_weight(1));


    cm19cm3c0c0_c3c0c0c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm19cm3c0c0_weight(1)(6-1 downto 0),
			B	=> c3c0c0c0_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm19cm3c0c0,
			CxB => R_c3c0c0c0
		);

    cm2cm2c2c18_cm1c2cm1c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2cm2c2c18_weight(1)(6-1 downto 0),
			B	=> cm1c2cm1c1_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2cm2c2c18,
			CxB => R_cm1c2cm1c1
		);

    c0c20cm2cm2_c4c3cm2c3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0c20cm2cm2_weight(1)(6-1 downto 0),
			B	=> c4c3cm2c3_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c20cm2cm2,
			CxB => R_c4c3cm2c3
		);

    c4cm2c12c5_cm5cm2cm1c4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c4cm2c12c5_weight(1)(5-1 downto 0),
			B	=> cm5cm2cm1c4_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c4cm2c12c5,
			CxB => R_cm5cm2cm1c4
		);

    cm1c14c0c7_c0c4c1cm6_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm1c14c0c7_weight(1)(5-1 downto 0),
			B	=> c0c4c1cm6_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1c14c0c7,
			CxB => R_c0c4c1cm6
		);

    c1c9c0c2_cm1c7c5c2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c1c9c0c2_weight(1)(5-1 downto 0),
			B	=> cm1c7c5c2_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1c9c0c2,
			CxB => R_cm1c7c5c2
		);

    cm7c0c0c9_cm3cm5c6cm3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm7c0c0c9_weight(1)(5-1 downto 0),
			B	=> cm3cm5c6cm3_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm7c0c0c9,
			CxB => R_cm3cm5c6cm3
		);

    c8c10cm3c9_cm7cm1cm1cm7_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c8c10cm3c9_weight(1)(5-1 downto 0),
			B	=> cm7cm1cm1cm7_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c8c10cm3c9,
			CxB => R_cm7cm1cm1cm7
		);




end architecture;
