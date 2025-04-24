library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv3_core20_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(4-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        R_c1c1c1c40 : out std_logic_vector(14-1 downto 0);   --	sfix(7, -7)
        R_cm1cm81c20cm1 : out std_logic_vector(15-1 downto 0);   --	sfix(8, -7)
        R_cm2c1c0cm2 : out std_logic_vector(9-1 downto 0);   --	sfix(2, -7)
        R_c1c2c1c0 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_cm1c6c1cm21 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_c1c0c1c14 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_cm3c5c34c1 : out std_logic_vector(14-1 downto 0);   --	sfix(7, -7)
        R_c1c0cm11cm3 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_c0c0c0cm1 : out std_logic_vector(8-1 downto 0);   --	sfix(1, -7)
        R_cm4cm31c0c3 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_c1c0c0c31 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_cm4c5c0c0 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_cm2cm6cm9cm2 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_cm1cm5c1c19 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_cm1c0cm1cm1 : out std_logic_vector(8-1 downto 0);   --	sfix(1, -7)
        R_c0c0c0c0 : out std_logic_vector(8-1 downto 0)  --	sfix(1, -7)
    );
end conv3_core20_rmcm;

architecture arch of conv3_core20_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C1C1C40_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM81C20CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C1C0CM2_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C2C1C0_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C6C1CM21_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C0C1C14_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3C5C34C1_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C0CM11CM3_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0CM1_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4CM31C0C3_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C0C0C31_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4C5C0C0_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM6CM9CM2_WEIGHT  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM5C1C19_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C0CM1CM1_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(5, -2)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(3, -5)
    signal c1c1c1c40_weight     : PIPELINE_TYPE_FOR_C1C1C1C40_WEIGHT;
    -- sfix(3, -5)
    signal cm1cm81c20cm1_weight : PIPELINE_TYPE_FOR_CM1CM81C20CM1_WEIGHT;
    -- sfix(3, -5)
    signal cm2c1c0cm2_weight    : PIPELINE_TYPE_FOR_CM2C1C0CM2_WEIGHT;
    -- sfix(3, -5)
    signal c1c2c1c0_weight      : PIPELINE_TYPE_FOR_C1C2C1C0_WEIGHT;
    -- sfix(3, -5)
    signal cm1c6c1cm21_weight   : PIPELINE_TYPE_FOR_CM1C6C1CM21_WEIGHT;
    -- sfix(3, -5)
    signal c1c0c1c14_weight     : PIPELINE_TYPE_FOR_C1C0C1C14_WEIGHT;
    -- sfix(3, -5)
    signal cm3c5c34c1_weight    : PIPELINE_TYPE_FOR_CM3C5C34C1_WEIGHT;
    -- sfix(3, -5)
    signal c1c0cm11cm3_weight   : PIPELINE_TYPE_FOR_C1C0CM11CM3_WEIGHT;
    -- sfix(3, -5)
    signal c0c0c0cm1_weight     : PIPELINE_TYPE_FOR_C0C0C0CM1_WEIGHT;
    -- sfix(3, -5)
    signal cm4cm31c0c3_weight   : PIPELINE_TYPE_FOR_CM4CM31C0C3_WEIGHT;
    -- sfix(3, -5)
    signal c1c0c0c31_weight     : PIPELINE_TYPE_FOR_C1C0C0C31_WEIGHT;
    -- sfix(3, -5)
    signal cm4c5c0c0_weight     : PIPELINE_TYPE_FOR_CM4C5C0C0_WEIGHT;
    -- sfix(3, -5)
    signal cm2cm6cm9cm2_weight  : PIPELINE_TYPE_FOR_CM2CM6CM9CM2_WEIGHT;
    -- sfix(3, -5)
    signal cm1cm5c1c19_weight   : PIPELINE_TYPE_FOR_CM1CM5C1C19_WEIGHT;
    -- sfix(3, -5)
    signal cm1c0cm1cm1_weight   : PIPELINE_TYPE_FOR_CM1C0CM1CM1_WEIGHT;
    -- sfix(3, -5)
    signal c0c0c0c0_weight      : PIPELINE_TYPE_FOR_C0C0C0C0_WEIGHT;

    -- The zero output
    signal c0c0c0c0 : std_logic_vector(8-1 downto 0); --	sfix(1, -7)

    -- If we use LUT multiplier and the input is unsigned, we have to cut away the msb of the result
    -- If this is the case, the temporary results are stored in the signals below.

    signal R_c1c0c1c14_undelayed : std_logic_vector(12-1 downto 0);


begin
    c0c0c0c0 <= (others => '0');
    R_c0c0c0c0 <= c0c0c0c0;
    X0_signal(0) <= X0;



    WEIGHT_ROM: entity work.conv3_core20_rmcm_weightsconstant_memory
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
        
            dout1   => c1c1c1c40_weight(0), 
            dout2   => cm1cm81c20cm1_weight(0), 
            dout3   => cm2c1c0cm2_weight(0), 
            dout4   => c1c2c1c0_weight(0), 
            dout5   => cm1c6c1cm21_weight(0), 
            dout6   => c1c0c1c14_weight(0), 
            dout7   => cm3c5c34c1_weight(0), 
            dout8   => c1c0cm11cm3_weight(0), 
            dout9   => c0c0c0cm1_weight(0), 
            dout10   => cm4cm31c0c3_weight(0), 
            dout11   => c1c0c0c31_weight(0), 
            dout12   => cm4c5c0c0_weight(0), 
            dout13   => cm2cm6cm9cm2_weight(0), 
            dout14   => cm1cm5c1c19_weight(0), 
            dout15   => cm1c0cm1cm1_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_c1c1c1c40_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c1c1c40_weight(0), c1c1c1c40_weight(1));
    PL_STEP_0_for_cm1cm81c20cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm81c20cm1_weight(0), cm1cm81c20cm1_weight(1));
    PL_STEP_0_for_cm2c1c0cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c1c0cm2_weight(0), cm2c1c0cm2_weight(1));
    PL_STEP_0_for_c1c2c1c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c2c1c0_weight(0), c1c2c1c0_weight(1));
    PL_STEP_0_for_cm1c6c1cm21_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c6c1cm21_weight(0), cm1c6c1cm21_weight(1));
    PL_STEP_0_for_c1c0c1c14_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c0c1c14_weight(0), c1c0c1c14_weight(1));
    PL_STEP_0_for_cm3c5c34c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3c5c34c1_weight(0), cm3c5c34c1_weight(1));
    PL_STEP_0_for_c1c0cm11cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c0cm11cm3_weight(0), c1c0cm11cm3_weight(1));
    PL_STEP_0_for_c0c0c0cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0cm1_weight(0), c0c0c0cm1_weight(1));
    PL_STEP_0_for_cm4cm31c0c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4cm31c0c3_weight(0), cm4cm31c0c3_weight(1));
    PL_STEP_0_for_c1c0c0c31_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c0c0c31_weight(0), c1c0c0c31_weight(1));
    PL_STEP_0_for_cm4c5c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4c5c0c0_weight(0), cm4c5c0c0_weight(1));
    PL_STEP_0_for_cm2cm6cm9cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm6cm9cm2_weight(0), cm2cm6cm9cm2_weight(1));
    PL_STEP_0_for_cm1cm5c1c19_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm5c1c19_weight(0), cm1cm5c1c19_weight(1));
    PL_STEP_0_for_cm1c0cm1cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c0cm1cm1_weight(0), cm1c0cm1cm1_weight(1));
    PL_STEP_0_for_c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0_weight(0), c0c0c0c0_weight(1));


    cm1cm81c20cm1_cm1c0cm1cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm1cm81c20cm1_weight(1)(8-1 downto 0),
			B	=> cm1c0cm1cm1_weight(1)(1-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1cm81c20cm1,
			CxB => R_cm1c0cm1cm1
		);

    c1c1c1c40_c0c0c0cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c1c1c1c40_weight(1)(7-1 downto 0),
			B	=> c0c0c0cm1_weight(1)(1-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1c1c1c40,
			CxB => R_c0c0c0cm1
		);

    cm3c5c34c1_cm2c1c0cm2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm3c5c34c1_weight(1)(7-1 downto 0),
			B	=> cm2c1c0cm2_weight(1)(2-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm3c5c34c1,
			CxB => R_cm2c1c0cm2
		);

    cm1c6c1cm21_c1c2c1c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm1c6c1cm21_weight(1)(6-1 downto 0),
			B	=> c1c2c1c0_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1c6c1cm21,
			CxB => R_c1c2c1c0
		);

    cm4cm31c0c3_cm4c5c0c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm4cm31c0c3_weight(1)(6-1 downto 0),
			B	=> cm4c5c0c0_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm4cm31c0c3,
			CxB => R_cm4c5c0c0
		);

    c1c0c0c31_cm2cm6cm9cm2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c1c0c0c31_weight(1)(6-1 downto 0),
			B	=> cm2cm6cm9cm2_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1c0c0c31,
			CxB => R_cm2cm6cm9cm2
		);

    cm1cm5c1c19_c1c0cm11cm3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm1cm5c1c19_weight(1)(6-1 downto 0),
			B	=> c1c0cm11cm3_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1cm5c1c19,
			CxB => R_c1c0cm11cm3
		);




    c1c0c1c14_MULT: entity work.TruncatedSingleMult
	generic map
		(
            A_WIDTH           => 8, --	sfix(3, -5)
            A_TRUNCATED_WIDTH => 5, -- This would be the MSB position of the weight
            B_WIDTH           => 7, --	ufix(5, -2)
            AxB_WIDTH         => 12, --	sfix(5, -7)
            AxB_FRAC_TRUNCATION => 0,
            B_IS_SIGNED       => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c1c0c1c14_weight(1),
			B	=> X0_signal(1),
			AxB	=> R_c1c0c1c14
		);

end architecture;
