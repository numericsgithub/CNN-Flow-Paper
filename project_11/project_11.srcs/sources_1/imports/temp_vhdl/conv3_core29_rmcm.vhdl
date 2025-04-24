library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv3_core29_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(4-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        R_c5cm3c12c34 : out std_logic_vector(14-1 downto 0);   --	sfix(7, -7)
        R_c5c1c16c3 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_cm19cm3c0cm6 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_c1c0c1c1 : out std_logic_vector(9-1 downto 0);   --	sfix(2, -7)
        R_c5cm9c25cm37 : out std_logic_vector(14-1 downto 0);   --	sfix(7, -7)
        R_cm10c0c0c0 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_c4c2c1cm25 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_c8cm39cm3c5 : out std_logic_vector(14-1 downto 0);   --	sfix(7, -7)
        R_cm17c0c12c5 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_c2c1c0cm1 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_cm18cm13c0cm22 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_c0c0c1cm16 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_c14cm47c0c0 : out std_logic_vector(14-1 downto 0);   --	sfix(7, -7)
        R_c8cm14cm1c27 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_c21cm8c3c2 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_c0c0c0cm8 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_c0c0c0c0 : out std_logic_vector(8-1 downto 0)  --	sfix(1, -7)
    );
end conv3_core29_rmcm;

architecture arch of conv3_core29_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_C5CM3C12C34_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5C1C16C3_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM19CM3C0CM6_WEIGHT  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C0C1C1_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5CM9C25CM37_WEIGHT  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM10C0C0C0_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4C2C1CM25_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C8CM39CM3C5_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM17C0C12C5_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C1C0CM1_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM18CM13C0CM22_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C1CM16_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C14CM47C0C0_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C8CM14CM1C27_WEIGHT  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C21CM8C3C2_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0CM8_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(5, -2)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(3, -5)
    signal c5cm3c12c34_weight   : PIPELINE_TYPE_FOR_C5CM3C12C34_WEIGHT;
    -- sfix(3, -5)
    signal c5c1c16c3_weight     : PIPELINE_TYPE_FOR_C5C1C16C3_WEIGHT;
    -- sfix(3, -5)
    signal cm19cm3c0cm6_weight  : PIPELINE_TYPE_FOR_CM19CM3C0CM6_WEIGHT;
    -- sfix(3, -5)
    signal c1c0c1c1_weight      : PIPELINE_TYPE_FOR_C1C0C1C1_WEIGHT;
    -- sfix(3, -5)
    signal c5cm9c25cm37_weight  : PIPELINE_TYPE_FOR_C5CM9C25CM37_WEIGHT;
    -- sfix(3, -5)
    signal cm10c0c0c0_weight    : PIPELINE_TYPE_FOR_CM10C0C0C0_WEIGHT;
    -- sfix(3, -5)
    signal c4c2c1cm25_weight    : PIPELINE_TYPE_FOR_C4C2C1CM25_WEIGHT;
    -- sfix(3, -5)
    signal c8cm39cm3c5_weight   : PIPELINE_TYPE_FOR_C8CM39CM3C5_WEIGHT;
    -- sfix(3, -5)
    signal cm17c0c12c5_weight   : PIPELINE_TYPE_FOR_CM17C0C12C5_WEIGHT;
    -- sfix(3, -5)
    signal c2c1c0cm1_weight     : PIPELINE_TYPE_FOR_C2C1C0CM1_WEIGHT;
    -- sfix(3, -5)
    signal cm18cm13c0cm22_weight : PIPELINE_TYPE_FOR_CM18CM13C0CM22_WEIGHT;
    -- sfix(3, -5)
    signal c0c0c1cm16_weight    : PIPELINE_TYPE_FOR_C0C0C1CM16_WEIGHT;
    -- sfix(3, -5)
    signal c14cm47c0c0_weight   : PIPELINE_TYPE_FOR_C14CM47C0C0_WEIGHT;
    -- sfix(3, -5)
    signal c8cm14cm1c27_weight  : PIPELINE_TYPE_FOR_C8CM14CM1C27_WEIGHT;
    -- sfix(3, -5)
    signal c21cm8c3c2_weight    : PIPELINE_TYPE_FOR_C21CM8C3C2_WEIGHT;
    -- sfix(3, -5)
    signal c0c0c0cm8_weight     : PIPELINE_TYPE_FOR_C0C0C0CM8_WEIGHT;
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



    WEIGHT_ROM: entity work.conv3_core29_rmcm_weightsconstant_memory
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
        
            dout1   => c5cm3c12c34_weight(0), 
            dout2   => c5c1c16c3_weight(0), 
            dout3   => cm19cm3c0cm6_weight(0), 
            dout4   => c1c0c1c1_weight(0), 
            dout5   => c5cm9c25cm37_weight(0), 
            dout6   => cm10c0c0c0_weight(0), 
            dout7   => c4c2c1cm25_weight(0), 
            dout8   => c8cm39cm3c5_weight(0), 
            dout9   => cm17c0c12c5_weight(0), 
            dout10   => c2c1c0cm1_weight(0), 
            dout11   => cm18cm13c0cm22_weight(0), 
            dout12   => c0c0c1cm16_weight(0), 
            dout13   => c14cm47c0c0_weight(0), 
            dout14   => c8cm14cm1c27_weight(0), 
            dout15   => c21cm8c3c2_weight(0), 
            dout16   => c0c0c0cm8_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_c5cm3c12c34_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5cm3c12c34_weight(0), c5cm3c12c34_weight(1));
    PL_STEP_0_for_c5c1c16c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5c1c16c3_weight(0), c5c1c16c3_weight(1));
    PL_STEP_0_for_cm19cm3c0cm6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm19cm3c0cm6_weight(0), cm19cm3c0cm6_weight(1));
    PL_STEP_0_for_c1c0c1c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c0c1c1_weight(0), c1c0c1c1_weight(1));
    PL_STEP_0_for_c5cm9c25cm37_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5cm9c25cm37_weight(0), c5cm9c25cm37_weight(1));
    PL_STEP_0_for_cm10c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm10c0c0c0_weight(0), cm10c0c0c0_weight(1));
    PL_STEP_0_for_c4c2c1cm25_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4c2c1cm25_weight(0), c4c2c1cm25_weight(1));
    PL_STEP_0_for_c8cm39cm3c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c8cm39cm3c5_weight(0), c8cm39cm3c5_weight(1));
    PL_STEP_0_for_cm17c0c12c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm17c0c12c5_weight(0), cm17c0c12c5_weight(1));
    PL_STEP_0_for_c2c1c0cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c1c0cm1_weight(0), c2c1c0cm1_weight(1));
    PL_STEP_0_for_cm18cm13c0cm22_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm18cm13c0cm22_weight(0), cm18cm13c0cm22_weight(1));
    PL_STEP_0_for_c0c0c1cm16_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c1cm16_weight(0), c0c0c1cm16_weight(1));
    PL_STEP_0_for_c14cm47c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c14cm47c0c0_weight(0), c14cm47c0c0_weight(1));
    PL_STEP_0_for_c8cm14cm1c27_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c8cm14cm1c27_weight(0), c8cm14cm1c27_weight(1));
    PL_STEP_0_for_c21cm8c3c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c21cm8c3c2_weight(0), c21cm8c3c2_weight(1));
    PL_STEP_0_for_c0c0c0cm8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0cm8_weight(0), c0c0c0cm8_weight(1));
    PL_STEP_0_for_c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0_weight(0), c0c0c0c0_weight(1));


    c5cm3c12c34_c1c0c1c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c5cm3c12c34_weight(1)(7-1 downto 0),
			B	=> c1c0c1c1_weight(1)(2-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c5cm3c12c34,
			CxB => R_c1c0c1c1
		);

    c5cm9c25cm37_c2c1c0cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c5cm9c25cm37_weight(1)(7-1 downto 0),
			B	=> c2c1c0cm1_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c5cm9c25cm37,
			CxB => R_c2c1c0cm1
		);

    c8cm39cm3c5_c0c0c0cm8_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c8cm39cm3c5_weight(1)(7-1 downto 0),
			B	=> c0c0c0cm8_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c8cm39cm3c5,
			CxB => R_c0c0c0cm8
		);

    c14cm47c0c0_c0c0c1cm16_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 5,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c14cm47c0c0_weight(1)(7-1 downto 0),
			B	=> c0c0c1cm16_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c14cm47c0c0,
			CxB => R_c0c0c1cm16
		);

    c5c1c16c3_cm10c0c0c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c5c1c16c3_weight(1)(6-1 downto 0),
			B	=> cm10c0c0c0_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c5c1c16c3,
			CxB => R_cm10c0c0c0
		);

    cm19cm3c0cm6_c21cm8c3c2_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 6,
			B_WIDTH => 6,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm19cm3c0cm6_weight(1)(6-1 downto 0),
			B	=> c21cm8c3c2_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm19cm3c0cm6,
			CxB => R_c21cm8c3c2
		);

    c4c2c1cm25_c8cm14cm1c27_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 6,
			B_WIDTH => 6,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c4c2c1cm25_weight(1)(6-1 downto 0),
			B	=> c8cm14cm1c27_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c4c2c1cm25,
			CxB => R_c8cm14cm1c27
		);

    cm17c0c12c5_cm18cm13c0cm22_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 6,
			B_WIDTH => 6,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm17c0c12c5_weight(1)(6-1 downto 0),
			B	=> cm18cm13c0cm22_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm17c0c12c5,
			CxB => R_cm18cm13c0cm22
		);




end architecture;
