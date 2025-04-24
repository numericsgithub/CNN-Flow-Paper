library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv3_core13_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(4-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        R_c3c0c0cm3 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_cm2cm1cm3cm2 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_c0cm4c0c0 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_cm2c8c2c0 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_c2c1cm2c1 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_cm18c3c0c0 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_c4cm5c5c1 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_cm1cm1c0c0 : out std_logic_vector(8-1 downto 0);   --	sfix(1, -7)
        R_cm1cm1c0cm3 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_c0cm7c0c14 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_c1cm11c20c0 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_cm8c9cm14cm7 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_cm1c0c0c0 : out std_logic_vector(8-1 downto 0);   --	sfix(1, -7)
        R_c1cm28c0cm1 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_c0cm1cm7c0 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_cm2cm1cm13c0 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_c0c0c0c0 : out std_logic_vector(8-1 downto 0)  --	sfix(1, -7)
    );
end conv3_core13_rmcm;

architecture arch of conv3_core13_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C0C0CM3_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM1CM3CM2_WEIGHT  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM4C0C0_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C8C2C0_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C1CM2C1_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM18C3C0C0_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4CM5C5C1_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM1C0C0_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM1C0CM3_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM7C0C14_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM11C20C0_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM8C9CM14CM7_WEIGHT  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C0C0C0_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM28C0CM1_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM1CM7C0_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM1CM13C0_WEIGHT  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(5, -2)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(3, -5)
    signal c3c0c0cm3_weight     : PIPELINE_TYPE_FOR_C3C0C0CM3_WEIGHT;
    -- sfix(3, -5)
    signal cm2cm1cm3cm2_weight  : PIPELINE_TYPE_FOR_CM2CM1CM3CM2_WEIGHT;
    -- sfix(3, -5)
    signal c0cm4c0c0_weight     : PIPELINE_TYPE_FOR_C0CM4C0C0_WEIGHT;
    -- sfix(3, -5)
    signal cm2c8c2c0_weight     : PIPELINE_TYPE_FOR_CM2C8C2C0_WEIGHT;
    -- sfix(3, -5)
    signal c2c1cm2c1_weight     : PIPELINE_TYPE_FOR_C2C1CM2C1_WEIGHT;
    -- sfix(3, -5)
    signal cm18c3c0c0_weight    : PIPELINE_TYPE_FOR_CM18C3C0C0_WEIGHT;
    -- sfix(3, -5)
    signal c4cm5c5c1_weight     : PIPELINE_TYPE_FOR_C4CM5C5C1_WEIGHT;
    -- sfix(3, -5)
    signal cm1cm1c0c0_weight    : PIPELINE_TYPE_FOR_CM1CM1C0C0_WEIGHT;
    -- sfix(3, -5)
    signal cm1cm1c0cm3_weight   : PIPELINE_TYPE_FOR_CM1CM1C0CM3_WEIGHT;
    -- sfix(3, -5)
    signal c0cm7c0c14_weight    : PIPELINE_TYPE_FOR_C0CM7C0C14_WEIGHT;
    -- sfix(3, -5)
    signal c1cm11c20c0_weight   : PIPELINE_TYPE_FOR_C1CM11C20C0_WEIGHT;
    -- sfix(3, -5)
    signal cm8c9cm14cm7_weight  : PIPELINE_TYPE_FOR_CM8C9CM14CM7_WEIGHT;
    -- sfix(3, -5)
    signal cm1c0c0c0_weight     : PIPELINE_TYPE_FOR_CM1C0C0C0_WEIGHT;
    -- sfix(3, -5)
    signal c1cm28c0cm1_weight   : PIPELINE_TYPE_FOR_C1CM28C0CM1_WEIGHT;
    -- sfix(3, -5)
    signal c0cm1cm7c0_weight    : PIPELINE_TYPE_FOR_C0CM1CM7C0_WEIGHT;
    -- sfix(3, -5)
    signal cm2cm1cm13c0_weight  : PIPELINE_TYPE_FOR_CM2CM1CM13C0_WEIGHT;
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



    WEIGHT_ROM: entity work.conv3_core13_rmcm_weightsconstant_memory
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
        
            dout1   => c3c0c0cm3_weight(0), 
            dout2   => cm2cm1cm3cm2_weight(0), 
            dout3   => c0cm4c0c0_weight(0), 
            dout4   => cm2c8c2c0_weight(0), 
            dout5   => c2c1cm2c1_weight(0), 
            dout6   => cm18c3c0c0_weight(0), 
            dout7   => c4cm5c5c1_weight(0), 
            dout8   => cm1cm1c0c0_weight(0), 
            dout9   => cm1cm1c0cm3_weight(0), 
            dout10   => c0cm7c0c14_weight(0), 
            dout11   => c1cm11c20c0_weight(0), 
            dout12   => cm8c9cm14cm7_weight(0), 
            dout13   => cm1c0c0c0_weight(0), 
            dout14   => c1cm28c0cm1_weight(0), 
            dout15   => c0cm1cm7c0_weight(0), 
            dout16   => cm2cm1cm13c0_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_c3c0c0cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c0c0cm3_weight(0), c3c0c0cm3_weight(1));
    PL_STEP_0_for_cm2cm1cm3cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm1cm3cm2_weight(0), cm2cm1cm3cm2_weight(1));
    PL_STEP_0_for_c0cm4c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm4c0c0_weight(0), c0cm4c0c0_weight(1));
    PL_STEP_0_for_cm2c8c2c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c8c2c0_weight(0), cm2c8c2c0_weight(1));
    PL_STEP_0_for_c2c1cm2c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c1cm2c1_weight(0), c2c1cm2c1_weight(1));
    PL_STEP_0_for_cm18c3c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm18c3c0c0_weight(0), cm18c3c0c0_weight(1));
    PL_STEP_0_for_c4cm5c5c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4cm5c5c1_weight(0), c4cm5c5c1_weight(1));
    PL_STEP_0_for_cm1cm1c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm1c0c0_weight(0), cm1cm1c0c0_weight(1));
    PL_STEP_0_for_cm1cm1c0cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm1c0cm3_weight(0), cm1cm1c0cm3_weight(1));
    PL_STEP_0_for_c0cm7c0c14_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm7c0c14_weight(0), c0cm7c0c14_weight(1));
    PL_STEP_0_for_c1cm11c20c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm11c20c0_weight(0), c1cm11c20c0_weight(1));
    PL_STEP_0_for_cm8c9cm14cm7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm8c9cm14cm7_weight(0), cm8c9cm14cm7_weight(1));
    PL_STEP_0_for_cm1c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c0c0c0_weight(0), cm1c0c0c0_weight(1));
    PL_STEP_0_for_c1cm28c0cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm28c0cm1_weight(0), c1cm28c0cm1_weight(1));
    PL_STEP_0_for_c0cm1cm7c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm1cm7c0_weight(0), c0cm1cm7c0_weight(1));
    PL_STEP_0_for_cm2cm1cm13c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm1cm13c0_weight(0), cm2cm1cm13c0_weight(1));
    PL_STEP_0_for_c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0_weight(0), c0c0c0c0_weight(1));


    cm18c3c0c0_cm1c0c0c0_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 6,
			B_WIDTH => 1,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm18c3c0c0_weight(1)(6-1 downto 0),
			B	=> cm1c0c0c0_weight(1)(1-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm18c3c0c0,
			CxB => R_cm1c0c0c0
		);

    c1cm11c20c0_cm1cm1c0c0_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 6,
			B_WIDTH => 1,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c1cm11c20c0_weight(1)(6-1 downto 0),
			B	=> cm1cm1c0c0_weight(1)(1-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1cm11c20c0,
			CxB => R_cm1cm1c0c0
		);

    c1cm28c0cm1_cm1cm1c0cm3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c1cm28c0cm1_weight(1)(6-1 downto 0),
			B	=> cm1cm1c0cm3_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1cm28c0cm1,
			CxB => R_cm1cm1c0cm3
		);

    cm2c8c2c0_c2c1cm2c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2c8c2c0_weight(1)(5-1 downto 0),
			B	=> c2c1cm2c1_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2c8c2c0,
			CxB => R_c2c1cm2c1
		);

    c0cm7c0c14_c0cm4c0c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0cm7c0c14_weight(1)(5-1 downto 0),
			B	=> c0cm4c0c0_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0cm7c0c14,
			CxB => R_c0cm4c0c0
		);

    cm8c9cm14cm7_cm2cm1cm3cm2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm8c9cm14cm7_weight(1)(5-1 downto 0),
			B	=> cm2cm1cm3cm2_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm8c9cm14cm7,
			CxB => R_cm2cm1cm3cm2
		);

    cm2cm1cm13c0_c3c0c0cm3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2cm1cm13c0_weight(1)(5-1 downto 0),
			B	=> c3c0c0cm3_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2cm1cm13c0,
			CxB => R_c3c0c0cm3
		);

    c4cm5c5c1_c0cm1cm7c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c4cm5c5c1_weight(1)(4-1 downto 0),
			B	=> c0cm1cm7c0_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c4cm5c5c1,
			CxB => R_c0cm1cm7c0
		);




end architecture;
