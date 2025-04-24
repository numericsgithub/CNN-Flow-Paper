library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv6_core8_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        R_cm7cm5cm1c7c21cm5c3c7cm7cm17c9cm2cm4cm5cm7c37 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm10c2cm32cm48c71cm14cm13c20cm9cm10c9c0cm6cm7c23c98 : out std_logic_vector(15-1 downto 0);   --	sfix(7, -8)
        R_c5c5c2c28cm8cm2c4cm3cm8cm9cm5c6c5cm1cm21c1 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm5cm5c1cm33cm27cm7cm17cm5cm11c17c29cm3cm5cm23cm45cm55 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm5cm5c39cm73cm38c63c53c20c35c20c0cm12cm2cm6c24cm71 : out std_logic_vector(15-1 downto 0);   --	sfix(7, -8)
        R_c2c38c0c65cm17cm21cm20cm1c4cm8cm21c3cm9c5c36cm24 : out std_logic_vector(15-1 downto 0);   --	sfix(7, -8)
        R_c0cm4cm1c4cm13cm7c0cm21cm8c12cm4cm1c2cm1c8c10 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm2cm11cm6c8c3c11cm1cm14c5c14cm16cm2cm3c2cm17c6 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c3cm5cm2c45c2cm9cm2cm7c2cm8c7c2c1c3c0c13 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(9-1 downto 0)  --	sfix(1, -8)
    );
end conv6_core8_rmcm;

architecture arch of conv6_core8_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_CM7CM5CM1C7C21CM5C3C7CM7CM17C9CM2CM4CM5CM7C37_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM10C2CM32CM48C71CM14CM13C20CM9CM10C9C0CM6CM7C23C98_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5C5C2C28CM8CM2C4CM3CM8CM9CM5C6C5CM1CM21C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5CM5C1CM33CM27CM7CM17CM5CM11C17C29CM3CM5CM23CM45CM55_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5CM5C39CM73CM38C63C53C20C35C20C0CM12CM2CM6C24CM71_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C38C0C65CM17CM21CM20CM1C4CM8CM21C3CM9C5C36CM24_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM4CM1C4CM13CM7C0CM21CM8C12CM4CM1C2CM1C8C10_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM11CM6C8C3C11CM1CM14C5C14CM16CM2CM3C2CM17C6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3CM5CM2C45C2CM9CM2CM7C2CM8C7C2C1C3C0C13_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(4, -3)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(3, -5)
    signal cm7cm5cm1c7c21cm5c3c7cm7cm17c9cm2cm4cm5cm7c37_weight : PIPELINE_TYPE_FOR_CM7CM5CM1C7C21CM5C3C7CM7CM17C9CM2CM4CM5CM7C37_WEIGHT;
    -- sfix(3, -5)
    signal cm10c2cm32cm48c71cm14cm13c20cm9cm10c9c0cm6cm7c23c98_weight : PIPELINE_TYPE_FOR_CM10C2CM32CM48C71CM14CM13C20CM9CM10C9C0CM6CM7C23C98_WEIGHT;
    -- sfix(3, -5)
    signal c5c5c2c28cm8cm2c4cm3cm8cm9cm5c6c5cm1cm21c1_weight : PIPELINE_TYPE_FOR_C5C5C2C28CM8CM2C4CM3CM8CM9CM5C6C5CM1CM21C1_WEIGHT;
    -- sfix(3, -5)
    signal cm5cm5c1cm33cm27cm7cm17cm5cm11c17c29cm3cm5cm23cm45cm55_weight : PIPELINE_TYPE_FOR_CM5CM5C1CM33CM27CM7CM17CM5CM11C17C29CM3CM5CM23CM45CM55_WEIGHT;
    -- sfix(3, -5)
    signal cm5cm5c39cm73cm38c63c53c20c35c20c0cm12cm2cm6c24cm71_weight : PIPELINE_TYPE_FOR_CM5CM5C39CM73CM38C63C53C20C35C20C0CM12CM2CM6C24CM71_WEIGHT;
    -- sfix(3, -5)
    signal c2c38c0c65cm17cm21cm20cm1c4cm8cm21c3cm9c5c36cm24_weight : PIPELINE_TYPE_FOR_C2C38C0C65CM17CM21CM20CM1C4CM8CM21C3CM9C5C36CM24_WEIGHT;
    -- sfix(3, -5)
    signal c0cm4cm1c4cm13cm7c0cm21cm8c12cm4cm1c2cm1c8c10_weight : PIPELINE_TYPE_FOR_C0CM4CM1C4CM13CM7C0CM21CM8C12CM4CM1C2CM1C8C10_WEIGHT;
    -- sfix(3, -5)
    signal cm2cm11cm6c8c3c11cm1cm14c5c14cm16cm2cm3c2cm17c6_weight : PIPELINE_TYPE_FOR_CM2CM11CM6C8C3C11CM1CM14C5C14CM16CM2CM3C2CM17C6_WEIGHT;
    -- sfix(3, -5)
    signal c3cm5cm2c45c2cm9cm2cm7c2cm8c7c2c1c3c0c13_weight : PIPELINE_TYPE_FOR_C3CM5CM2C45C2CM9CM2CM7C2CM8C7C2C1C3C0C13_WEIGHT;
    -- sfix(3, -5)
    signal c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT;

    -- The zero output
    signal c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : std_logic_vector(9-1 downto 0); --	sfix(1, -8)

    -- If we use LUT multiplier and the input is unsigned, we have to cut away the msb of the result
    -- If this is the case, the temporary results are stored in the signals below.

    signal R_cm5cm5c1cm33cm27cm7cm17cm5cm11c17c29cm3cm5cm23cm45cm55_undelayed : std_logic_vector(14-1 downto 0);


begin
    c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 <= (others => '0');
    R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 <= c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0;
    X0_signal(0) <= X0;



    WEIGHT_ROM: entity work.conv6_core8_rmcm_weightsconstant_memory
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
        
            dout1   => cm7cm5cm1c7c21cm5c3c7cm7cm17c9cm2cm4cm5cm7c37_weight(0), 
            dout2   => cm10c2cm32cm48c71cm14cm13c20cm9cm10c9c0cm6cm7c23c98_weight(0), 
            dout3   => c5c5c2c28cm8cm2c4cm3cm8cm9cm5c6c5cm1cm21c1_weight(0), 
            dout4   => cm5cm5c1cm33cm27cm7cm17cm5cm11c17c29cm3cm5cm23cm45cm55_weight(0), 
            dout5   => cm5cm5c39cm73cm38c63c53c20c35c20c0cm12cm2cm6c24cm71_weight(0), 
            dout6   => c2c38c0c65cm17cm21cm20cm1c4cm8cm21c3cm9c5c36cm24_weight(0), 
            dout7   => c0cm4cm1c4cm13cm7c0cm21cm8c12cm4cm1c2cm1c8c10_weight(0), 
            dout8   => cm2cm11cm6c8c3c11cm1cm14c5c14cm16cm2cm3c2cm17c6_weight(0), 
            dout9   => c3cm5cm2c45c2cm9cm2cm7c2cm8c7c2c1c3c0c13_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_cm7cm5cm1c7c21cm5c3c7cm7cm17c9cm2cm4cm5cm7c37_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm7cm5cm1c7c21cm5c3c7cm7cm17c9cm2cm4cm5cm7c37_weight(0), cm7cm5cm1c7c21cm5c3c7cm7cm17c9cm2cm4cm5cm7c37_weight(1));
    PL_STEP_0_for_cm10c2cm32cm48c71cm14cm13c20cm9cm10c9c0cm6cm7c23c98_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm10c2cm32cm48c71cm14cm13c20cm9cm10c9c0cm6cm7c23c98_weight(0), cm10c2cm32cm48c71cm14cm13c20cm9cm10c9c0cm6cm7c23c98_weight(1));
    PL_STEP_0_for_c5c5c2c28cm8cm2c4cm3cm8cm9cm5c6c5cm1cm21c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5c5c2c28cm8cm2c4cm3cm8cm9cm5c6c5cm1cm21c1_weight(0), c5c5c2c28cm8cm2c4cm3cm8cm9cm5c6c5cm1cm21c1_weight(1));
    PL_STEP_0_for_cm5cm5c1cm33cm27cm7cm17cm5cm11c17c29cm3cm5cm23cm45cm55_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5cm5c1cm33cm27cm7cm17cm5cm11c17c29cm3cm5cm23cm45cm55_weight(0), cm5cm5c1cm33cm27cm7cm17cm5cm11c17c29cm3cm5cm23cm45cm55_weight(1));
    PL_STEP_0_for_cm5cm5c39cm73cm38c63c53c20c35c20c0cm12cm2cm6c24cm71_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5cm5c39cm73cm38c63c53c20c35c20c0cm12cm2cm6c24cm71_weight(0), cm5cm5c39cm73cm38c63c53c20c35c20c0cm12cm2cm6c24cm71_weight(1));
    PL_STEP_0_for_c2c38c0c65cm17cm21cm20cm1c4cm8cm21c3cm9c5c36cm24_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c38c0c65cm17cm21cm20cm1c4cm8cm21c3cm9c5c36cm24_weight(0), c2c38c0c65cm17cm21cm20cm1c4cm8cm21c3cm9c5c36cm24_weight(1));
    PL_STEP_0_for_c0cm4cm1c4cm13cm7c0cm21cm8c12cm4cm1c2cm1c8c10_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm4cm1c4cm13cm7c0cm21cm8c12cm4cm1c2cm1c8c10_weight(0), c0cm4cm1c4cm13cm7c0cm21cm8c12cm4cm1c2cm1c8c10_weight(1));
    PL_STEP_0_for_cm2cm11cm6c8c3c11cm1cm14c5c14cm16cm2cm3c2cm17c6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm11cm6c8c3c11cm1cm14c5c14cm16cm2cm3c2cm17c6_weight(0), cm2cm11cm6c8c3c11cm1cm14c5c14cm16cm2cm3c2cm17c6_weight(1));
    PL_STEP_0_for_c3cm5cm2c45c2cm9cm2cm7c2cm8c7c2c1c3c0c13_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3cm5cm2c45c2cm9cm2cm7c2cm8c7c2c1c3c0c13_weight(0), c3cm5cm2c45c2cm9cm2cm7c2cm8c7c2c1c3c0c13_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    cm10c2cm32cm48c71cm14cm13c20cm9cm10c9c0cm6cm7c23c98_cm2cm11cm6c8c3c11cm1cm14c5c14cm16cm2cm3c2cm17c6_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm10c2cm32cm48c71cm14cm13c20cm9cm10c9c0cm6cm7c23c98_weight(1)(8-1 downto 0),
			B	=> cm2cm11cm6c8c3c11cm1cm14c5c14cm16cm2cm3c2cm17c6_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm10c2cm32cm48c71cm14cm13c20cm9cm10c9c0cm6cm7c23c98,
			CxB => R_cm2cm11cm6c8c3c11cm1cm14c5c14cm16cm2cm3c2cm17c6
		);

    cm5cm5c39cm73cm38c63c53c20c35c20c0cm12cm2cm6c24cm71_c0cm4cm1c4cm13cm7c0cm21cm8c12cm4cm1c2cm1c8c10_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm5cm5c39cm73cm38c63c53c20c35c20c0cm12cm2cm6c24cm71_weight(1)(8-1 downto 0),
			B	=> c0cm4cm1c4cm13cm7c0cm21cm8c12cm4cm1c2cm1c8c10_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm5cm5c39cm73cm38c63c53c20c35c20c0cm12cm2cm6c24cm71,
			CxB => R_c0cm4cm1c4cm13cm7c0cm21cm8c12cm4cm1c2cm1c8c10
		);

    c2c38c0c65cm17cm21cm20cm1c4cm8cm21c3cm9c5c36cm24_c5c5c2c28cm8cm2c4cm3cm8cm9cm5c6c5cm1cm21c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c2c38c0c65cm17cm21cm20cm1c4cm8cm21c3cm9c5c36cm24_weight(1)(8-1 downto 0),
			B	=> c5c5c2c28cm8cm2c4cm3cm8cm9cm5c6c5cm1cm21c1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c2c38c0c65cm17cm21cm20cm1c4cm8cm21c3cm9c5c36cm24,
			CxB => R_c5c5c2c28cm8cm2c4cm3cm8cm9cm5c6c5cm1cm21c1
		);

    cm7cm5cm1c7c21cm5c3c7cm7cm17c9cm2cm4cm5cm7c37_c3cm5cm2c45c2cm9cm2cm7c2cm8c7c2c1c3c0c13_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm7cm5cm1c7c21cm5c3c7cm7cm17c9cm2cm4cm5cm7c37_weight(1)(7-1 downto 0),
			B	=> c3cm5cm2c45c2cm9cm2cm7c2cm8c7c2c1c3c0c13_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm7cm5cm1c7c21cm5c3c7cm7cm17c9cm2cm4cm5cm7c37,
			CxB => R_c3cm5cm2c45c2cm9cm2cm7c2cm8c7c2c1c3c0c13
		);




    cm5cm5c1cm33cm27cm7cm17cm5cm11c17c29cm3cm5cm23cm45cm55_MULT: entity work.TruncatedSingleMult
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
			A	=> cm5cm5c1cm33cm27cm7cm17cm5cm11c17c29cm3cm5cm23cm45cm55_weight(1),
			B	=> X0_signal(1),
			AxB	=> R_cm5cm5c1cm33cm27cm7cm17cm5cm11c17c29cm3cm5cm23cm45cm55
		);

end architecture;
