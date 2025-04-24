library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv3_core18_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(4-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        R_cm1c0cm3cm2 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_cm3c1cm3cm9 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_cm1c53c0c1 : out std_logic_vector(14-1 downto 0);   --	sfix(7, -7)
        R_cm10c7cm9cm10 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_c2c1cm2c1 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_c82cm7c0c0 : out std_logic_vector(15-1 downto 0);   --	sfix(8, -7)
        R_c0c9cm39c0 : out std_logic_vector(14-1 downto 0);   --	sfix(7, -7)
        R_c0cm3cm1cm1 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_cm1c8cm1c8 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_c12c20c0cm17 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_cm1cm5cm1c0 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_cm4cm22c14c2 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_cm1c0c0c0 : out std_logic_vector(8-1 downto 0);   --	sfix(1, -7)
        R_cm1cm1c3c1 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_cm1c0cm4c1 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_cm2c1c20c1 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_c0c0c0c0 : out std_logic_vector(8-1 downto 0)  --	sfix(1, -7)
    );
end conv3_core18_rmcm;

architecture arch of conv3_core18_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C0CM3CM2_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3C1CM3CM9_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C53C0C1_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM10C7CM9CM10_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C1CM2C1_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C82CM7C0C0_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C9CM39C0_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM3CM1CM1_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C8CM1C8_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C12C20C0CM17_WEIGHT  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM5CM1C0_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4CM22C14C2_WEIGHT  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C0C0C0_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM1C3C1_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C0CM4C1_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C1C20C1_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(5, -2)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(3, -5)
    signal cm1c0cm3cm2_weight   : PIPELINE_TYPE_FOR_CM1C0CM3CM2_WEIGHT;
    -- sfix(3, -5)
    signal cm3c1cm3cm9_weight   : PIPELINE_TYPE_FOR_CM3C1CM3CM9_WEIGHT;
    -- sfix(3, -5)
    signal cm1c53c0c1_weight    : PIPELINE_TYPE_FOR_CM1C53C0C1_WEIGHT;
    -- sfix(3, -5)
    signal cm10c7cm9cm10_weight : PIPELINE_TYPE_FOR_CM10C7CM9CM10_WEIGHT;
    -- sfix(3, -5)
    signal c2c1cm2c1_weight     : PIPELINE_TYPE_FOR_C2C1CM2C1_WEIGHT;
    -- sfix(3, -5)
    signal c82cm7c0c0_weight    : PIPELINE_TYPE_FOR_C82CM7C0C0_WEIGHT;
    -- sfix(3, -5)
    signal c0c9cm39c0_weight    : PIPELINE_TYPE_FOR_C0C9CM39C0_WEIGHT;
    -- sfix(3, -5)
    signal c0cm3cm1cm1_weight   : PIPELINE_TYPE_FOR_C0CM3CM1CM1_WEIGHT;
    -- sfix(3, -5)
    signal cm1c8cm1c8_weight    : PIPELINE_TYPE_FOR_CM1C8CM1C8_WEIGHT;
    -- sfix(3, -5)
    signal c12c20c0cm17_weight  : PIPELINE_TYPE_FOR_C12C20C0CM17_WEIGHT;
    -- sfix(3, -5)
    signal cm1cm5cm1c0_weight   : PIPELINE_TYPE_FOR_CM1CM5CM1C0_WEIGHT;
    -- sfix(3, -5)
    signal cm4cm22c14c2_weight  : PIPELINE_TYPE_FOR_CM4CM22C14C2_WEIGHT;
    -- sfix(3, -5)
    signal cm1c0c0c0_weight     : PIPELINE_TYPE_FOR_CM1C0C0C0_WEIGHT;
    -- sfix(3, -5)
    signal cm1cm1c3c1_weight    : PIPELINE_TYPE_FOR_CM1CM1C3C1_WEIGHT;
    -- sfix(3, -5)
    signal cm1c0cm4c1_weight    : PIPELINE_TYPE_FOR_CM1C0CM4C1_WEIGHT;
    -- sfix(3, -5)
    signal cm2c1c20c1_weight    : PIPELINE_TYPE_FOR_CM2C1C20C1_WEIGHT;
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



    WEIGHT_ROM: entity work.conv3_core18_rmcm_weightsconstant_memory
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
        
            dout1   => cm1c0cm3cm2_weight(0), 
            dout2   => cm3c1cm3cm9_weight(0), 
            dout3   => cm1c53c0c1_weight(0), 
            dout4   => cm10c7cm9cm10_weight(0), 
            dout5   => c2c1cm2c1_weight(0), 
            dout6   => c82cm7c0c0_weight(0), 
            dout7   => c0c9cm39c0_weight(0), 
            dout8   => c0cm3cm1cm1_weight(0), 
            dout9   => cm1c8cm1c8_weight(0), 
            dout10   => c12c20c0cm17_weight(0), 
            dout11   => cm1cm5cm1c0_weight(0), 
            dout12   => cm4cm22c14c2_weight(0), 
            dout13   => cm1c0c0c0_weight(0), 
            dout14   => cm1cm1c3c1_weight(0), 
            dout15   => cm1c0cm4c1_weight(0), 
            dout16   => cm2c1c20c1_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_cm1c0cm3cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c0cm3cm2_weight(0), cm1c0cm3cm2_weight(1));
    PL_STEP_0_for_cm3c1cm3cm9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3c1cm3cm9_weight(0), cm3c1cm3cm9_weight(1));
    PL_STEP_0_for_cm1c53c0c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c53c0c1_weight(0), cm1c53c0c1_weight(1));
    PL_STEP_0_for_cm10c7cm9cm10_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm10c7cm9cm10_weight(0), cm10c7cm9cm10_weight(1));
    PL_STEP_0_for_c2c1cm2c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c1cm2c1_weight(0), c2c1cm2c1_weight(1));
    PL_STEP_0_for_c82cm7c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c82cm7c0c0_weight(0), c82cm7c0c0_weight(1));
    PL_STEP_0_for_c0c9cm39c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c9cm39c0_weight(0), c0c9cm39c0_weight(1));
    PL_STEP_0_for_c0cm3cm1cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm3cm1cm1_weight(0), c0cm3cm1cm1_weight(1));
    PL_STEP_0_for_cm1c8cm1c8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c8cm1c8_weight(0), cm1c8cm1c8_weight(1));
    PL_STEP_0_for_c12c20c0cm17_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c12c20c0cm17_weight(0), c12c20c0cm17_weight(1));
    PL_STEP_0_for_cm1cm5cm1c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm5cm1c0_weight(0), cm1cm5cm1c0_weight(1));
    PL_STEP_0_for_cm4cm22c14c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4cm22c14c2_weight(0), cm4cm22c14c2_weight(1));
    PL_STEP_0_for_cm1c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c0c0c0_weight(0), cm1c0c0c0_weight(1));
    PL_STEP_0_for_cm1cm1c3c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm1c3c1_weight(0), cm1cm1c3c1_weight(1));
    PL_STEP_0_for_cm1c0cm4c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c0cm4c1_weight(0), cm1c0cm4c1_weight(1));
    PL_STEP_0_for_cm2c1c20c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c1c20c1_weight(0), cm2c1c20c1_weight(1));
    PL_STEP_0_for_c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0_weight(0), c0c0c0c0_weight(1));


    c82cm7c0c0_cm1c0c0c0_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 8,
			B_WIDTH => 1,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c82cm7c0c0_weight(1)(8-1 downto 0),
			B	=> cm1c0c0c0_weight(1)(1-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c82cm7c0c0,
			CxB => R_cm1c0c0c0
		);

    cm1c53c0c1_cm1c0cm4c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm1c53c0c1_weight(1)(7-1 downto 0),
			B	=> cm1c0cm4c1_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1c53c0c1,
			CxB => R_cm1c0cm4c1
		);

    c0c9cm39c0_cm1cm1c3c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0c9cm39c0_weight(1)(7-1 downto 0),
			B	=> cm1cm1c3c1_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c9cm39c0,
			CxB => R_cm1cm1c3c1
		);

    c12c20c0cm17_c0cm3cm1cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c12c20c0cm17_weight(1)(6-1 downto 0),
			B	=> c0cm3cm1cm1_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c12c20c0cm17,
			CxB => R_c0cm3cm1cm1
		);

    cm4cm22c14c2_c2c1cm2c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm4cm22c14c2_weight(1)(6-1 downto 0),
			B	=> c2c1cm2c1_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm4cm22c14c2,
			CxB => R_c2c1cm2c1
		);

    cm2c1c20c1_cm1c0cm3cm2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2c1c20c1_weight(1)(6-1 downto 0),
			B	=> cm1c0cm3cm2_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2c1c20c1,
			CxB => R_cm1c0cm3cm2
		);

    cm3c1cm3cm9_cm1cm5cm1c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm3c1cm3cm9_weight(1)(5-1 downto 0),
			B	=> cm1cm5cm1c0_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm3c1cm3cm9,
			CxB => R_cm1cm5cm1c0
		);

    cm10c7cm9cm10_cm1c8cm1c8_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm10c7cm9cm10_weight(1)(5-1 downto 0),
			B	=> cm1c8cm1c8_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm10c7cm9cm10,
			CxB => R_cm1c8cm1c8
		);




end architecture;
