library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv3_core14_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(4-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        R_cm1cm2cm1cm5 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_cm3c4c11c2 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_cm1c20c0cm1 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_cm2cm5cm4cm1 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_c4c2cm4c5 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_cm36c30c0c0 : out std_logic_vector(14-1 downto 0);   --	sfix(7, -7)
        R_cm1cm19cm1c0 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_cm1cm1c0cm1 : out std_logic_vector(8-1 downto 0);   --	sfix(1, -7)
        R_c0cm17cm2cm1 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_c4c52c0c0 : out std_logic_vector(14-1 downto 0);   --	sfix(7, -7)
        R_c0cm20cm22c1 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_c5c3c0c4 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_c2c1c0c0 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_c0cm28cm1cm1 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_c2c1c6c4 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_cm3c51c0c1 : out std_logic_vector(14-1 downto 0);   --	sfix(7, -7)
        R_c0c0c0c0 : out std_logic_vector(8-1 downto 0)  --	sfix(1, -7)
    );
end conv3_core14_rmcm;

architecture arch of conv3_core14_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM2CM1CM5_WEIGHT  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3C4C11C2_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C20C0CM1_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM5CM4CM1_WEIGHT  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4C2CM4C5_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM36C30C0C0_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM19CM1C0_WEIGHT  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM1C0CM1_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM17CM2CM1_WEIGHT  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4C52C0C0_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM20CM22C1_WEIGHT  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5C3C0C4_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C1C0C0_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM28CM1CM1_WEIGHT  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C1C6C4_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3C51C0C1_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(5, -2)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(3, -5)
    signal cm1cm2cm1cm5_weight  : PIPELINE_TYPE_FOR_CM1CM2CM1CM5_WEIGHT;
    -- sfix(3, -5)
    signal cm3c4c11c2_weight    : PIPELINE_TYPE_FOR_CM3C4C11C2_WEIGHT;
    -- sfix(3, -5)
    signal cm1c20c0cm1_weight   : PIPELINE_TYPE_FOR_CM1C20C0CM1_WEIGHT;
    -- sfix(3, -5)
    signal cm2cm5cm4cm1_weight  : PIPELINE_TYPE_FOR_CM2CM5CM4CM1_WEIGHT;
    -- sfix(3, -5)
    signal c4c2cm4c5_weight     : PIPELINE_TYPE_FOR_C4C2CM4C5_WEIGHT;
    -- sfix(3, -5)
    signal cm36c30c0c0_weight   : PIPELINE_TYPE_FOR_CM36C30C0C0_WEIGHT;
    -- sfix(3, -5)
    signal cm1cm19cm1c0_weight  : PIPELINE_TYPE_FOR_CM1CM19CM1C0_WEIGHT;
    -- sfix(3, -5)
    signal cm1cm1c0cm1_weight   : PIPELINE_TYPE_FOR_CM1CM1C0CM1_WEIGHT;
    -- sfix(3, -5)
    signal c0cm17cm2cm1_weight  : PIPELINE_TYPE_FOR_C0CM17CM2CM1_WEIGHT;
    -- sfix(3, -5)
    signal c4c52c0c0_weight     : PIPELINE_TYPE_FOR_C4C52C0C0_WEIGHT;
    -- sfix(3, -5)
    signal c0cm20cm22c1_weight  : PIPELINE_TYPE_FOR_C0CM20CM22C1_WEIGHT;
    -- sfix(3, -5)
    signal c5c3c0c4_weight      : PIPELINE_TYPE_FOR_C5C3C0C4_WEIGHT;
    -- sfix(3, -5)
    signal c2c1c0c0_weight      : PIPELINE_TYPE_FOR_C2C1C0C0_WEIGHT;
    -- sfix(3, -5)
    signal c0cm28cm1cm1_weight  : PIPELINE_TYPE_FOR_C0CM28CM1CM1_WEIGHT;
    -- sfix(3, -5)
    signal c2c1c6c4_weight      : PIPELINE_TYPE_FOR_C2C1C6C4_WEIGHT;
    -- sfix(3, -5)
    signal cm3c51c0c1_weight    : PIPELINE_TYPE_FOR_CM3C51C0C1_WEIGHT;
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



    WEIGHT_ROM: entity work.conv3_core14_rmcm_weightsconstant_memory
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
        
            dout1   => cm1cm2cm1cm5_weight(0), 
            dout2   => cm3c4c11c2_weight(0), 
            dout3   => cm1c20c0cm1_weight(0), 
            dout4   => cm2cm5cm4cm1_weight(0), 
            dout5   => c4c2cm4c5_weight(0), 
            dout6   => cm36c30c0c0_weight(0), 
            dout7   => cm1cm19cm1c0_weight(0), 
            dout8   => cm1cm1c0cm1_weight(0), 
            dout9   => c0cm17cm2cm1_weight(0), 
            dout10   => c4c52c0c0_weight(0), 
            dout11   => c0cm20cm22c1_weight(0), 
            dout12   => c5c3c0c4_weight(0), 
            dout13   => c2c1c0c0_weight(0), 
            dout14   => c0cm28cm1cm1_weight(0), 
            dout15   => c2c1c6c4_weight(0), 
            dout16   => cm3c51c0c1_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_cm1cm2cm1cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm2cm1cm5_weight(0), cm1cm2cm1cm5_weight(1));
    PL_STEP_0_for_cm3c4c11c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3c4c11c2_weight(0), cm3c4c11c2_weight(1));
    PL_STEP_0_for_cm1c20c0cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c20c0cm1_weight(0), cm1c20c0cm1_weight(1));
    PL_STEP_0_for_cm2cm5cm4cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm5cm4cm1_weight(0), cm2cm5cm4cm1_weight(1));
    PL_STEP_0_for_c4c2cm4c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4c2cm4c5_weight(0), c4c2cm4c5_weight(1));
    PL_STEP_0_for_cm36c30c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm36c30c0c0_weight(0), cm36c30c0c0_weight(1));
    PL_STEP_0_for_cm1cm19cm1c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm19cm1c0_weight(0), cm1cm19cm1c0_weight(1));
    PL_STEP_0_for_cm1cm1c0cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm1c0cm1_weight(0), cm1cm1c0cm1_weight(1));
    PL_STEP_0_for_c0cm17cm2cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm17cm2cm1_weight(0), c0cm17cm2cm1_weight(1));
    PL_STEP_0_for_c4c52c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4c52c0c0_weight(0), c4c52c0c0_weight(1));
    PL_STEP_0_for_c0cm20cm22c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm20cm22c1_weight(0), c0cm20cm22c1_weight(1));
    PL_STEP_0_for_c5c3c0c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5c3c0c4_weight(0), c5c3c0c4_weight(1));
    PL_STEP_0_for_c2c1c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c1c0c0_weight(0), c2c1c0c0_weight(1));
    PL_STEP_0_for_c0cm28cm1cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm28cm1cm1_weight(0), c0cm28cm1cm1_weight(1));
    PL_STEP_0_for_c2c1c6c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c1c6c4_weight(0), c2c1c6c4_weight(1));
    PL_STEP_0_for_cm3c51c0c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3c51c0c1_weight(0), cm3c51c0c1_weight(1));
    PL_STEP_0_for_c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0_weight(0), c0c0c0c0_weight(1));


    cm36c30c0c0_cm1cm1c0cm1_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 1,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm36c30c0c0_weight(1)(7-1 downto 0),
			B	=> cm1cm1c0cm1_weight(1)(1-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm36c30c0c0,
			CxB => R_cm1cm1c0cm1
		);

    c4c52c0c0_c2c1c0c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c4c52c0c0_weight(1)(7-1 downto 0),
			B	=> c2c1c0c0_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c4c52c0c0,
			CxB => R_c2c1c0c0
		);

    cm3c51c0c1_c2c1c6c4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm3c51c0c1_weight(1)(7-1 downto 0),
			B	=> c2c1c6c4_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm3c51c0c1,
			CxB => R_c2c1c6c4
		);

    cm1c20c0cm1_c5c3c0c4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm1c20c0cm1_weight(1)(6-1 downto 0),
			B	=> c5c3c0c4_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1c20c0cm1,
			CxB => R_c5c3c0c4
		);

    cm1cm19cm1c0_c4c2cm4c5_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm1cm19cm1c0_weight(1)(6-1 downto 0),
			B	=> c4c2cm4c5_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1cm19cm1c0,
			CxB => R_c4c2cm4c5
		);

    c0cm17cm2cm1_cm2cm5cm4cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0cm17cm2cm1_weight(1)(6-1 downto 0),
			B	=> cm2cm5cm4cm1_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0cm17cm2cm1,
			CxB => R_cm2cm5cm4cm1
		);

    c0cm20cm22c1_cm1cm2cm1cm5_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0cm20cm22c1_weight(1)(6-1 downto 0),
			B	=> cm1cm2cm1cm5_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0cm20cm22c1,
			CxB => R_cm1cm2cm1cm5
		);

    c0cm28cm1cm1_cm3c4c11c2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0cm28cm1cm1_weight(1)(6-1 downto 0),
			B	=> cm3c4c11c2_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0cm28cm1cm1,
			CxB => R_cm3c4c11c2
		);




end architecture;
