library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv3_core6_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(4-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        R_c1c1cm2c61 : out std_logic_vector(14-1 downto 0);   --	sfix(7, -7)
        R_c34c0cm11cm8 : out std_logic_vector(14-1 downto 0);   --	sfix(7, -7)
        R_cm5c8c0c9 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_cm2c6c6cm3 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_c34c1cm1cm31 : out std_logic_vector(14-1 downto 0);   --	sfix(7, -7)
        R_cm3cm2c0c0 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_c16c1c2cm7 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_c2c4cm7cm1 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_c0c0cm3c0 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_cm8c2c0c0 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_cm21c12c1c1 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_cm2c0c0cm19 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_c6c1c0c0 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_cm34cm128cm2cm3 : out std_logic_vector(15-1 downto 0);   --	sfix(8, -7)
        R_cm2c1c1cm20 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_cm14cm1c0c0 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_c0c0c0c0 : out std_logic_vector(8-1 downto 0)  --	sfix(1, -7)
    );
end conv3_core6_rmcm;

architecture arch of conv3_core6_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C1CM2C61_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C34C0CM11CM8_WEIGHT  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5C8C0C9_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C6C6CM3_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C34C1CM1CM31_WEIGHT  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3CM2C0C0_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C16C1C2CM7_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C4CM7CM1_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0CM3C0_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM8C2C0C0_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM21C12C1C1_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C0C0CM19_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6C1C0C0_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM34CM128CM2CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C1C1CM20_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM14CM1C0C0_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(5, -2)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(3, -5)
    signal c1c1cm2c61_weight    : PIPELINE_TYPE_FOR_C1C1CM2C61_WEIGHT;
    -- sfix(3, -5)
    signal c34c0cm11cm8_weight  : PIPELINE_TYPE_FOR_C34C0CM11CM8_WEIGHT;
    -- sfix(3, -5)
    signal cm5c8c0c9_weight     : PIPELINE_TYPE_FOR_CM5C8C0C9_WEIGHT;
    -- sfix(3, -5)
    signal cm2c6c6cm3_weight    : PIPELINE_TYPE_FOR_CM2C6C6CM3_WEIGHT;
    -- sfix(3, -5)
    signal c34c1cm1cm31_weight  : PIPELINE_TYPE_FOR_C34C1CM1CM31_WEIGHT;
    -- sfix(3, -5)
    signal cm3cm2c0c0_weight    : PIPELINE_TYPE_FOR_CM3CM2C0C0_WEIGHT;
    -- sfix(3, -5)
    signal c16c1c2cm7_weight    : PIPELINE_TYPE_FOR_C16C1C2CM7_WEIGHT;
    -- sfix(3, -5)
    signal c2c4cm7cm1_weight    : PIPELINE_TYPE_FOR_C2C4CM7CM1_WEIGHT;
    -- sfix(3, -5)
    signal c0c0cm3c0_weight     : PIPELINE_TYPE_FOR_C0C0CM3C0_WEIGHT;
    -- sfix(3, -5)
    signal cm8c2c0c0_weight     : PIPELINE_TYPE_FOR_CM8C2C0C0_WEIGHT;
    -- sfix(3, -5)
    signal cm21c12c1c1_weight   : PIPELINE_TYPE_FOR_CM21C12C1C1_WEIGHT;
    -- sfix(3, -5)
    signal cm2c0c0cm19_weight   : PIPELINE_TYPE_FOR_CM2C0C0CM19_WEIGHT;
    -- sfix(3, -5)
    signal c6c1c0c0_weight      : PIPELINE_TYPE_FOR_C6C1C0C0_WEIGHT;
    -- sfix(3, -5)
    signal cm34cm128cm2cm3_weight : PIPELINE_TYPE_FOR_CM34CM128CM2CM3_WEIGHT;
    -- sfix(3, -5)
    signal cm2c1c1cm20_weight   : PIPELINE_TYPE_FOR_CM2C1C1CM20_WEIGHT;
    -- sfix(3, -5)
    signal cm14cm1c0c0_weight   : PIPELINE_TYPE_FOR_CM14CM1C0C0_WEIGHT;
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



    WEIGHT_ROM: entity work.conv3_core6_rmcm_weightsconstant_memory
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
        
            dout1   => c1c1cm2c61_weight(0), 
            dout2   => c34c0cm11cm8_weight(0), 
            dout3   => cm5c8c0c9_weight(0), 
            dout4   => cm2c6c6cm3_weight(0), 
            dout5   => c34c1cm1cm31_weight(0), 
            dout6   => cm3cm2c0c0_weight(0), 
            dout7   => c16c1c2cm7_weight(0), 
            dout8   => c2c4cm7cm1_weight(0), 
            dout9   => c0c0cm3c0_weight(0), 
            dout10   => cm8c2c0c0_weight(0), 
            dout11   => cm21c12c1c1_weight(0), 
            dout12   => cm2c0c0cm19_weight(0), 
            dout13   => c6c1c0c0_weight(0), 
            dout14   => cm34cm128cm2cm3_weight(0), 
            dout15   => cm2c1c1cm20_weight(0), 
            dout16   => cm14cm1c0c0_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_c1c1cm2c61_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c1cm2c61_weight(0), c1c1cm2c61_weight(1));
    PL_STEP_0_for_c34c0cm11cm8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c34c0cm11cm8_weight(0), c34c0cm11cm8_weight(1));
    PL_STEP_0_for_cm5c8c0c9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5c8c0c9_weight(0), cm5c8c0c9_weight(1));
    PL_STEP_0_for_cm2c6c6cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c6c6cm3_weight(0), cm2c6c6cm3_weight(1));
    PL_STEP_0_for_c34c1cm1cm31_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c34c1cm1cm31_weight(0), c34c1cm1cm31_weight(1));
    PL_STEP_0_for_cm3cm2c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3cm2c0c0_weight(0), cm3cm2c0c0_weight(1));
    PL_STEP_0_for_c16c1c2cm7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c16c1c2cm7_weight(0), c16c1c2cm7_weight(1));
    PL_STEP_0_for_c2c4cm7cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c4cm7cm1_weight(0), c2c4cm7cm1_weight(1));
    PL_STEP_0_for_c0c0cm3c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0cm3c0_weight(0), c0c0cm3c0_weight(1));
    PL_STEP_0_for_cm8c2c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm8c2c0c0_weight(0), cm8c2c0c0_weight(1));
    PL_STEP_0_for_cm21c12c1c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm21c12c1c1_weight(0), cm21c12c1c1_weight(1));
    PL_STEP_0_for_cm2c0c0cm19_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c0c0cm19_weight(0), cm2c0c0cm19_weight(1));
    PL_STEP_0_for_c6c1c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6c1c0c0_weight(0), c6c1c0c0_weight(1));
    PL_STEP_0_for_cm34cm128cm2cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm34cm128cm2cm3_weight(0), cm34cm128cm2cm3_weight(1));
    PL_STEP_0_for_cm2c1c1cm20_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c1c1cm20_weight(0), cm2c1c1cm20_weight(1));
    PL_STEP_0_for_cm14cm1c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm14cm1c0c0_weight(0), cm14cm1c0c0_weight(1));
    PL_STEP_0_for_c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0_weight(0), c0c0c0c0_weight(1));


    cm34cm128cm2cm3_c0c0cm3c0_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 8,
			B_WIDTH => 3,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm34cm128cm2cm3_weight(1)(8-1 downto 0),
			B	=> c0c0cm3c0_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm34cm128cm2cm3,
			CxB => R_c0c0cm3c0
		);

    c1c1cm2c61_cm3cm2c0c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c1c1cm2c61_weight(1)(7-1 downto 0),
			B	=> cm3cm2c0c0_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1c1cm2c61,
			CxB => R_cm3cm2c0c0
		);

    c34c0cm11cm8_c6c1c0c0_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 4,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c34c0cm11cm8_weight(1)(7-1 downto 0),
			B	=> c6c1c0c0_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c34c0cm11cm8,
			CxB => R_c6c1c0c0
		);

    c34c1cm1cm31_cm8c2c0c0_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 4,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c34c1cm1cm31_weight(1)(7-1 downto 0),
			B	=> cm8c2c0c0_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c34c1cm1cm31,
			CxB => R_cm8c2c0c0
		);

    c16c1c2cm7_c2c4cm7cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c16c1c2cm7_weight(1)(6-1 downto 0),
			B	=> c2c4cm7cm1_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c16c1c2cm7,
			CxB => R_c2c4cm7cm1
		);

    cm21c12c1c1_cm2c6c6cm3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm21c12c1c1_weight(1)(6-1 downto 0),
			B	=> cm2c6c6cm3_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm21c12c1c1,
			CxB => R_cm2c6c6cm3
		);

    cm2c0c0cm19_cm14cm1c0c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2c0c0cm19_weight(1)(6-1 downto 0),
			B	=> cm14cm1c0c0_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2c0c0cm19,
			CxB => R_cm14cm1c0c0
		);

    cm2c1c1cm20_cm5c8c0c9_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2c1c1cm20_weight(1)(6-1 downto 0),
			B	=> cm5c8c0c9_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2c1c1cm20,
			CxB => R_cm5c8c0c9
		);




end architecture;
