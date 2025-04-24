library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv3_core24_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(4-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        R_c1c6c0c5 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_c2c0cm5cm1 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_cm2cm3c0cm50 : out std_logic_vector(14-1 downto 0);   --	sfix(7, -7)
        R_c3c1cm28cm1 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_c4c0cm1cm2 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_cm7c1c1cm1 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_cm1c0c0cm1 : out std_logic_vector(8-1 downto 0);   --	sfix(1, -7)
        R_cm1c0cm3c1 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_c1c0c0c0 : out std_logic_vector(9-1 downto 0);   --	sfix(2, -7)
        R_cm10cm3c2cm1 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_c1c0c0cm8 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_cm22c2c0c0 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_c123cm6c1c1 : out std_logic_vector(15-1 downto 0);   --	sfix(8, -7)
        R_cm3cm26c1c1 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_c25c0c0c0 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_c0c0c0c0 : out std_logic_vector(8-1 downto 0)  --	sfix(1, -7)
    );
end conv3_core24_rmcm;

architecture arch of conv3_core24_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C6C0C5_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C0CM5CM1_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM3C0CM50_WEIGHT  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C1CM28CM1_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4C0CM1CM2_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM7C1C1CM1_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C0C0CM1_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C0CM3C1_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C0C0C0_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM10CM3C2CM1_WEIGHT  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C0C0CM8_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM22C2C0C0_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C123CM6C1C1_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3CM26C1C1_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C25C0C0C0_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(5, -2)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(3, -5)
    signal c1c6c0c5_weight      : PIPELINE_TYPE_FOR_C1C6C0C5_WEIGHT;
    -- sfix(3, -5)
    signal c2c0cm5cm1_weight    : PIPELINE_TYPE_FOR_C2C0CM5CM1_WEIGHT;
    -- sfix(3, -5)
    signal cm2cm3c0cm50_weight  : PIPELINE_TYPE_FOR_CM2CM3C0CM50_WEIGHT;
    -- sfix(3, -5)
    signal c3c1cm28cm1_weight   : PIPELINE_TYPE_FOR_C3C1CM28CM1_WEIGHT;
    -- sfix(3, -5)
    signal c4c0cm1cm2_weight    : PIPELINE_TYPE_FOR_C4C0CM1CM2_WEIGHT;
    -- sfix(3, -5)
    signal cm7c1c1cm1_weight    : PIPELINE_TYPE_FOR_CM7C1C1CM1_WEIGHT;
    -- sfix(3, -5)
    signal cm1c0c0cm1_weight    : PIPELINE_TYPE_FOR_CM1C0C0CM1_WEIGHT;
    -- sfix(3, -5)
    signal cm1c0cm3c1_weight    : PIPELINE_TYPE_FOR_CM1C0CM3C1_WEIGHT;
    -- sfix(3, -5)
    signal c1c0c0c0_weight      : PIPELINE_TYPE_FOR_C1C0C0C0_WEIGHT;
    -- sfix(3, -5)
    signal cm10cm3c2cm1_weight  : PIPELINE_TYPE_FOR_CM10CM3C2CM1_WEIGHT;
    -- sfix(3, -5)
    signal c1c0c0cm8_weight     : PIPELINE_TYPE_FOR_C1C0C0CM8_WEIGHT;
    -- sfix(3, -5)
    signal cm22c2c0c0_weight    : PIPELINE_TYPE_FOR_CM22C2C0C0_WEIGHT;
    -- sfix(3, -5)
    signal c123cm6c1c1_weight   : PIPELINE_TYPE_FOR_C123CM6C1C1_WEIGHT;
    -- sfix(3, -5)
    signal cm3cm26c1c1_weight   : PIPELINE_TYPE_FOR_CM3CM26C1C1_WEIGHT;
    -- sfix(3, -5)
    signal c25c0c0c0_weight     : PIPELINE_TYPE_FOR_C25C0C0C0_WEIGHT;
    -- sfix(3, -5)
    signal c0c0c0c0_weight      : PIPELINE_TYPE_FOR_C0C0C0C0_WEIGHT;

    -- The zero output
    signal c0c0c0c0 : std_logic_vector(8-1 downto 0); --	sfix(1, -7)

    -- If we use LUT multiplier and the input is unsigned, we have to cut away the msb of the result
    -- If this is the case, the temporary results are stored in the signals below.

    signal R_c1c6c0c5_undelayed : std_logic_vector(11-1 downto 0);


begin
    c0c0c0c0 <= (others => '0');
    R_c0c0c0c0 <= c0c0c0c0;
    X0_signal(0) <= X0;



    WEIGHT_ROM: entity work.conv3_core24_rmcm_weightsconstant_memory
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
        
            dout1   => c1c6c0c5_weight(0), 
            dout2   => c2c0cm5cm1_weight(0), 
            dout3   => cm2cm3c0cm50_weight(0), 
            dout4   => c3c1cm28cm1_weight(0), 
            dout5   => c4c0cm1cm2_weight(0), 
            dout6   => cm7c1c1cm1_weight(0), 
            dout7   => cm1c0c0cm1_weight(0), 
            dout8   => cm1c0cm3c1_weight(0), 
            dout9   => c1c0c0c0_weight(0), 
            dout10   => cm10cm3c2cm1_weight(0), 
            dout11   => c1c0c0cm8_weight(0), 
            dout12   => cm22c2c0c0_weight(0), 
            dout13   => c123cm6c1c1_weight(0), 
            dout14   => cm3cm26c1c1_weight(0), 
            dout15   => c25c0c0c0_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_c1c6c0c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c6c0c5_weight(0), c1c6c0c5_weight(1));
    PL_STEP_0_for_c2c0cm5cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c0cm5cm1_weight(0), c2c0cm5cm1_weight(1));
    PL_STEP_0_for_cm2cm3c0cm50_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm3c0cm50_weight(0), cm2cm3c0cm50_weight(1));
    PL_STEP_0_for_c3c1cm28cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c1cm28cm1_weight(0), c3c1cm28cm1_weight(1));
    PL_STEP_0_for_c4c0cm1cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4c0cm1cm2_weight(0), c4c0cm1cm2_weight(1));
    PL_STEP_0_for_cm7c1c1cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm7c1c1cm1_weight(0), cm7c1c1cm1_weight(1));
    PL_STEP_0_for_cm1c0c0cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c0c0cm1_weight(0), cm1c0c0cm1_weight(1));
    PL_STEP_0_for_cm1c0cm3c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c0cm3c1_weight(0), cm1c0cm3c1_weight(1));
    PL_STEP_0_for_c1c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c0c0c0_weight(0), c1c0c0c0_weight(1));
    PL_STEP_0_for_cm10cm3c2cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm10cm3c2cm1_weight(0), cm10cm3c2cm1_weight(1));
    PL_STEP_0_for_c1c0c0cm8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c0c0cm8_weight(0), c1c0c0cm8_weight(1));
    PL_STEP_0_for_cm22c2c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm22c2c0c0_weight(0), cm22c2c0c0_weight(1));
    PL_STEP_0_for_c123cm6c1c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c123cm6c1c1_weight(0), c123cm6c1c1_weight(1));
    PL_STEP_0_for_cm3cm26c1c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3cm26c1c1_weight(0), cm3cm26c1c1_weight(1));
    PL_STEP_0_for_c25c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c25c0c0c0_weight(0), c25c0c0c0_weight(1));
    PL_STEP_0_for_c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0_weight(0), c0c0c0c0_weight(1));


    c123cm6c1c1_cm1c0c0cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c123cm6c1c1_weight(1)(8-1 downto 0),
			B	=> cm1c0c0cm1_weight(1)(1-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c123cm6c1c1,
			CxB => R_cm1c0c0cm1
		);

    cm2cm3c0cm50_c1c0c0c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2cm3c0cm50_weight(1)(7-1 downto 0),
			B	=> c1c0c0c0_weight(1)(2-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2cm3c0cm50,
			CxB => R_c1c0c0c0
		);

    c3c1cm28cm1_cm1c0cm3c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c3c1cm28cm1_weight(1)(6-1 downto 0),
			B	=> cm1c0cm3c1_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c3c1cm28cm1,
			CxB => R_cm1c0cm3c1
		);

    cm22c2c0c0_c1c0c0cm8_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm22c2c0c0_weight(1)(6-1 downto 0),
			B	=> c1c0c0cm8_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm22c2c0c0,
			CxB => R_c1c0c0cm8
		);

    cm3cm26c1c1_cm7c1c1cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm3cm26c1c1_weight(1)(6-1 downto 0),
			B	=> cm7c1c1cm1_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm3cm26c1c1,
			CxB => R_cm7c1c1cm1
		);

    c25c0c0c0_c4c0cm1cm2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c25c0c0c0_weight(1)(6-1 downto 0),
			B	=> c4c0cm1cm2_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c25c0c0c0,
			CxB => R_c4c0cm1cm2
		);

    cm10cm3c2cm1_c2c0cm5cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm10cm3c2cm1_weight(1)(5-1 downto 0),
			B	=> c2c0cm5cm1_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm10cm3c2cm1,
			CxB => R_c2c0cm5cm1
		);




    c1c6c0c5_MULT: entity work.TruncatedSingleMult
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
			A	=> c1c6c0c5_weight(1),
			B	=> X0_signal(1),
			AxB	=> R_c1c6c0c5
		);

end architecture;
