library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv6_core2_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        R_cm1cm2cm18c32c2c5cm16c48cm16c2cm4c1c2cm10cm1cm20 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm6cm9c55c37c17cm27c4cm32cm19c20c10c44c19c38cm2cm1 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c0c1cm17c2cm3c5c20cm8c1c6cm9cm3c2cm14cm1c15 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm2cm15c24c35c25c23cm9c101cm10cm4c0c0cm17c26cm2cm36 : out std_logic_vector(15-1 downto 0);   --	sfix(7, -8)
        R_cm10c45cm90c45c0c21cm42cm93c45c14c58cm73cm9c23cm3c0 : out std_logic_vector(15-1 downto 0);   --	sfix(7, -8)
        R_c1cm11c40c2cm18cm12cm16cm18c4cm25cm10c3c7cm28cm2c53 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm1c2cm3c1cm7cm20c19cm7cm2c1cm6c1cm6cm7cm2cm15 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm3cm8c14c12cm20c6c40c3c8c8cm7c30cm9cm14cm1cm5 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c2c0cm8cm2c5c1c0c6c2cm2cm3c0c1cm9c0c13 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(9-1 downto 0)  --	sfix(1, -8)
    );
end conv6_core2_rmcm;

architecture arch of conv6_core2_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM2CM18C32C2C5CM16C48CM16C2CM4C1C2CM10CM1CM20_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6CM9C55C37C17CM27C4CM32CM19C20C10C44C19C38CM2CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C1CM17C2CM3C5C20CM8C1C6CM9CM3C2CM14CM1C15_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM15C24C35C25C23CM9C101CM10CM4C0C0CM17C26CM2CM36_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM10C45CM90C45C0C21CM42CM93C45C14C58CM73CM9C23CM3C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM11C40C2CM18CM12CM16CM18C4CM25CM10C3C7CM28CM2C53_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C2CM3C1CM7CM20C19CM7CM2C1CM6C1CM6CM7CM2CM15_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3CM8C14C12CM20C6C40C3C8C8CM7C30CM9CM14CM1CM5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C0CM8CM2C5C1C0C6C2CM2CM3C0C1CM9C0C13_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(4, -3)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(3, -5)
    signal cm1cm2cm18c32c2c5cm16c48cm16c2cm4c1c2cm10cm1cm20_weight : PIPELINE_TYPE_FOR_CM1CM2CM18C32C2C5CM16C48CM16C2CM4C1C2CM10CM1CM20_WEIGHT;
    -- sfix(3, -5)
    signal cm6cm9c55c37c17cm27c4cm32cm19c20c10c44c19c38cm2cm1_weight : PIPELINE_TYPE_FOR_CM6CM9C55C37C17CM27C4CM32CM19C20C10C44C19C38CM2CM1_WEIGHT;
    -- sfix(3, -5)
    signal c0c1cm17c2cm3c5c20cm8c1c6cm9cm3c2cm14cm1c15_weight : PIPELINE_TYPE_FOR_C0C1CM17C2CM3C5C20CM8C1C6CM9CM3C2CM14CM1C15_WEIGHT;
    -- sfix(3, -5)
    signal cm2cm15c24c35c25c23cm9c101cm10cm4c0c0cm17c26cm2cm36_weight : PIPELINE_TYPE_FOR_CM2CM15C24C35C25C23CM9C101CM10CM4C0C0CM17C26CM2CM36_WEIGHT;
    -- sfix(3, -5)
    signal cm10c45cm90c45c0c21cm42cm93c45c14c58cm73cm9c23cm3c0_weight : PIPELINE_TYPE_FOR_CM10C45CM90C45C0C21CM42CM93C45C14C58CM73CM9C23CM3C0_WEIGHT;
    -- sfix(3, -5)
    signal c1cm11c40c2cm18cm12cm16cm18c4cm25cm10c3c7cm28cm2c53_weight : PIPELINE_TYPE_FOR_C1CM11C40C2CM18CM12CM16CM18C4CM25CM10C3C7CM28CM2C53_WEIGHT;
    -- sfix(3, -5)
    signal cm1c2cm3c1cm7cm20c19cm7cm2c1cm6c1cm6cm7cm2cm15_weight : PIPELINE_TYPE_FOR_CM1C2CM3C1CM7CM20C19CM7CM2C1CM6C1CM6CM7CM2CM15_WEIGHT;
    -- sfix(3, -5)
    signal cm3cm8c14c12cm20c6c40c3c8c8cm7c30cm9cm14cm1cm5_weight : PIPELINE_TYPE_FOR_CM3CM8C14C12CM20C6C40C3C8C8CM7C30CM9CM14CM1CM5_WEIGHT;
    -- sfix(3, -5)
    signal c2c0cm8cm2c5c1c0c6c2cm2cm3c0c1cm9c0c13_weight : PIPELINE_TYPE_FOR_C2C0CM8CM2C5C1C0C6C2CM2CM3C0C1CM9C0C13_WEIGHT;
    -- sfix(3, -5)
    signal c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT;

    -- The zero output
    signal c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : std_logic_vector(9-1 downto 0); --	sfix(1, -8)

    -- If we use LUT multiplier and the input is unsigned, we have to cut away the msb of the result
    -- If this is the case, the temporary results are stored in the signals below.

    signal R_c1cm11c40c2cm18cm12cm16cm18c4cm25cm10c3c7cm28cm2c53_undelayed : std_logic_vector(14-1 downto 0);


begin
    c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 <= (others => '0');
    R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 <= c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0;
    X0_signal(0) <= X0;



    WEIGHT_ROM: entity work.conv6_core2_rmcm_weightsconstant_memory
        generic map
        (
            XI_WIDTH        	          => 8, 
            ARRAY_SIZE                    => 16,
            WORDS_PER_ADDR                => 9
        )
        port map
        (
            clk => clk,
            data_index => unsigned(SEL),
        
            dout1   => cm1cm2cm18c32c2c5cm16c48cm16c2cm4c1c2cm10cm1cm20_weight(0), 
            dout2   => cm6cm9c55c37c17cm27c4cm32cm19c20c10c44c19c38cm2cm1_weight(0), 
            dout3   => c0c1cm17c2cm3c5c20cm8c1c6cm9cm3c2cm14cm1c15_weight(0), 
            dout4   => cm2cm15c24c35c25c23cm9c101cm10cm4c0c0cm17c26cm2cm36_weight(0), 
            dout5   => cm10c45cm90c45c0c21cm42cm93c45c14c58cm73cm9c23cm3c0_weight(0), 
            dout6   => c1cm11c40c2cm18cm12cm16cm18c4cm25cm10c3c7cm28cm2c53_weight(0), 
            dout7   => cm1c2cm3c1cm7cm20c19cm7cm2c1cm6c1cm6cm7cm2cm15_weight(0), 
            dout8   => cm3cm8c14c12cm20c6c40c3c8c8cm7c30cm9cm14cm1cm5_weight(0), 
            dout9   => c2c0cm8cm2c5c1c0c6c2cm2cm3c0c1cm9c0c13_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_cm1cm2cm18c32c2c5cm16c48cm16c2cm4c1c2cm10cm1cm20_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm2cm18c32c2c5cm16c48cm16c2cm4c1c2cm10cm1cm20_weight(0), cm1cm2cm18c32c2c5cm16c48cm16c2cm4c1c2cm10cm1cm20_weight(1));
    PL_STEP_0_for_cm6cm9c55c37c17cm27c4cm32cm19c20c10c44c19c38cm2cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6cm9c55c37c17cm27c4cm32cm19c20c10c44c19c38cm2cm1_weight(0), cm6cm9c55c37c17cm27c4cm32cm19c20c10c44c19c38cm2cm1_weight(1));
    PL_STEP_0_for_c0c1cm17c2cm3c5c20cm8c1c6cm9cm3c2cm14cm1c15_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c1cm17c2cm3c5c20cm8c1c6cm9cm3c2cm14cm1c15_weight(0), c0c1cm17c2cm3c5c20cm8c1c6cm9cm3c2cm14cm1c15_weight(1));
    PL_STEP_0_for_cm2cm15c24c35c25c23cm9c101cm10cm4c0c0cm17c26cm2cm36_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm15c24c35c25c23cm9c101cm10cm4c0c0cm17c26cm2cm36_weight(0), cm2cm15c24c35c25c23cm9c101cm10cm4c0c0cm17c26cm2cm36_weight(1));
    PL_STEP_0_for_cm10c45cm90c45c0c21cm42cm93c45c14c58cm73cm9c23cm3c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm10c45cm90c45c0c21cm42cm93c45c14c58cm73cm9c23cm3c0_weight(0), cm10c45cm90c45c0c21cm42cm93c45c14c58cm73cm9c23cm3c0_weight(1));
    PL_STEP_0_for_c1cm11c40c2cm18cm12cm16cm18c4cm25cm10c3c7cm28cm2c53_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm11c40c2cm18cm12cm16cm18c4cm25cm10c3c7cm28cm2c53_weight(0), c1cm11c40c2cm18cm12cm16cm18c4cm25cm10c3c7cm28cm2c53_weight(1));
    PL_STEP_0_for_cm1c2cm3c1cm7cm20c19cm7cm2c1cm6c1cm6cm7cm2cm15_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c2cm3c1cm7cm20c19cm7cm2c1cm6c1cm6cm7cm2cm15_weight(0), cm1c2cm3c1cm7cm20c19cm7cm2c1cm6c1cm6cm7cm2cm15_weight(1));
    PL_STEP_0_for_cm3cm8c14c12cm20c6c40c3c8c8cm7c30cm9cm14cm1cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3cm8c14c12cm20c6c40c3c8c8cm7c30cm9cm14cm1cm5_weight(0), cm3cm8c14c12cm20c6c40c3c8c8cm7c30cm9cm14cm1cm5_weight(1));
    PL_STEP_0_for_c2c0cm8cm2c5c1c0c6c2cm2cm3c0c1cm9c0c13_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c0cm8cm2c5c1c0c6c2cm2cm3c0c1cm9c0c13_weight(0), c2c0cm8cm2c5c1c0c6c2cm2cm3c0c1cm9c0c13_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    cm2cm15c24c35c25c23cm9c101cm10cm4c0c0cm17c26cm2cm36_c2c0cm8cm2c5c1c0c6c2cm2cm3c0c1cm9c0c13_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 8,
			B_WIDTH => 5,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm2cm15c24c35c25c23cm9c101cm10cm4c0c0cm17c26cm2cm36_weight(1)(8-1 downto 0),
			B	=> c2c0cm8cm2c5c1c0c6c2cm2cm3c0c1cm9c0c13_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2cm15c24c35c25c23cm9c101cm10cm4c0c0cm17c26cm2cm36,
			CxB => R_c2c0cm8cm2c5c1c0c6c2cm2cm3c0c1cm9c0c13
		);

    cm10c45cm90c45c0c21cm42cm93c45c14c58cm73cm9c23cm3c0_cm1c2cm3c1cm7cm20c19cm7cm2c1cm6c1cm6cm7cm2cm15_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 8,
			B_WIDTH => 6,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm10c45cm90c45c0c21cm42cm93c45c14c58cm73cm9c23cm3c0_weight(1)(8-1 downto 0),
			B	=> cm1c2cm3c1cm7cm20c19cm7cm2c1cm6c1cm6cm7cm2cm15_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm10c45cm90c45c0c21cm42cm93c45c14c58cm73cm9c23cm3c0,
			CxB => R_cm1c2cm3c1cm7cm20c19cm7cm2c1cm6c1cm6cm7cm2cm15
		);

    cm1cm2cm18c32c2c5cm16c48cm16c2cm4c1c2cm10cm1cm20_c0c1cm17c2cm3c5c20cm8c1c6cm9cm3c2cm14cm1c15_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 6,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm1cm2cm18c32c2c5cm16c48cm16c2cm4c1c2cm10cm1cm20_weight(1)(7-1 downto 0),
			B	=> c0c1cm17c2cm3c5c20cm8c1c6cm9cm3c2cm14cm1c15_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1cm2cm18c32c2c5cm16c48cm16c2cm4c1c2cm10cm1cm20,
			CxB => R_c0c1cm17c2cm3c5c20cm8c1c6cm9cm3c2cm14cm1c15
		);

    cm6cm9c55c37c17cm27c4cm32cm19c20c10c44c19c38cm2cm1_cm3cm8c14c12cm20c6c40c3c8c8cm7c30cm9cm14cm1cm5_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 7,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm6cm9c55c37c17cm27c4cm32cm19c20c10c44c19c38cm2cm1_weight(1)(7-1 downto 0),
			B	=> cm3cm8c14c12cm20c6c40c3c8c8cm7c30cm9cm14cm1cm5_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm6cm9c55c37c17cm27c4cm32cm19c20c10c44c19c38cm2cm1,
			CxB => R_cm3cm8c14c12cm20c6c40c3c8c8cm7c30cm9cm14cm1cm5
		);




    c1cm11c40c2cm18cm12cm16cm18c4cm25cm10c3c7cm28cm2c53_MULT: entity work.TruncatedSingleMult
	generic map
		(
            A_WIDTH           => 8, --	sfix(3, -5)
            A_TRUNCATED_WIDTH => 7, -- This would be the MSB position of the weight
            B_WIDTH           => 7, --	ufix(4, -3)
            AxB_WIDTH         => 14, --	sfix(6, -8)
            AxB_FRAC_TRUNCATION => 0,
            B_IS_SIGNED       => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c1cm11c40c2cm18cm12cm16cm18c4cm25cm10c3c7cm28cm2c53_weight(1),
			B	=> X0_signal(1),
			AxB	=> R_c1cm11c40c2cm18cm12cm16cm18c4cm25cm10c3c7cm28cm2c53
		);

end architecture;
