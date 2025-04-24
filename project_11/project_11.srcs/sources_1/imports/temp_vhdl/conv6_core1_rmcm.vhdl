library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv6_core1_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        R_cm3c2c6c22cm4c66c0cm5c6cm3cm6c46cm9cm4cm3cm8 : out std_logic_vector(15-1 downto 0);   --	sfix(7, -8)
        R_c4cm5cm31cm27c9cm48cm3cm1c22cm36cm3cm11cm14cm14c9cm16 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm5cm1c2c3cm4cm18c1cm4c0c17c4cm30cm16cm5cm5c0 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm1cm14cm1c24c54cm39cm6c39cm5cm3cm38cm4cm4c6cm13c16 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c54cm18c36cm26cm5c8cm22c20cm30cm9c50cm11c123c47c32c20 : out std_logic_vector(15-1 downto 0);   --	sfix(7, -8)
        R_cm14c2cm2c23cm44c23c8cm16cm1c4cm1c8cm19c7cm16cm13 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm5c1cm4cm5cm2cm17c0c13c1cm1c3c2cm15cm5cm3cm2 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm11c3c2cm14cm14c26cm11c3c2cm7cm6c2cm17cm11c6c10 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c3c0cm2c12c9cm6c8cm7c0cm2c0c1cm2cm6cm2cm5 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(9-1 downto 0)  --	sfix(1, -8)
    );
end conv6_core1_rmcm;

architecture arch of conv6_core1_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3C2C6C22CM4C66C0CM5C6CM3CM6C46CM9CM4CM3CM8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4CM5CM31CM27C9CM48CM3CM1C22CM36CM3CM11CM14CM14C9CM16_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5CM1C2C3CM4CM18C1CM4C0C17C4CM30CM16CM5CM5C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM14CM1C24C54CM39CM6C39CM5CM3CM38CM4CM4C6CM13C16_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C54CM18C36CM26CM5C8CM22C20CM30CM9C50CM11C123C47C32C20_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM14C2CM2C23CM44C23C8CM16CM1C4CM1C8CM19C7CM16CM13_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5C1CM4CM5CM2CM17C0C13C1CM1C3C2CM15CM5CM3CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM11C3C2CM14CM14C26CM11C3C2CM7CM6C2CM17CM11C6C10_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C0CM2C12C9CM6C8CM7C0CM2C0C1CM2CM6CM2CM5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(4, -3)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(3, -5)
    signal cm3c2c6c22cm4c66c0cm5c6cm3cm6c46cm9cm4cm3cm8_weight : PIPELINE_TYPE_FOR_CM3C2C6C22CM4C66C0CM5C6CM3CM6C46CM9CM4CM3CM8_WEIGHT;
    -- sfix(3, -5)
    signal c4cm5cm31cm27c9cm48cm3cm1c22cm36cm3cm11cm14cm14c9cm16_weight : PIPELINE_TYPE_FOR_C4CM5CM31CM27C9CM48CM3CM1C22CM36CM3CM11CM14CM14C9CM16_WEIGHT;
    -- sfix(3, -5)
    signal cm5cm1c2c3cm4cm18c1cm4c0c17c4cm30cm16cm5cm5c0_weight : PIPELINE_TYPE_FOR_CM5CM1C2C3CM4CM18C1CM4C0C17C4CM30CM16CM5CM5C0_WEIGHT;
    -- sfix(3, -5)
    signal cm1cm14cm1c24c54cm39cm6c39cm5cm3cm38cm4cm4c6cm13c16_weight : PIPELINE_TYPE_FOR_CM1CM14CM1C24C54CM39CM6C39CM5CM3CM38CM4CM4C6CM13C16_WEIGHT;
    -- sfix(3, -5)
    signal c54cm18c36cm26cm5c8cm22c20cm30cm9c50cm11c123c47c32c20_weight : PIPELINE_TYPE_FOR_C54CM18C36CM26CM5C8CM22C20CM30CM9C50CM11C123C47C32C20_WEIGHT;
    -- sfix(3, -5)
    signal cm14c2cm2c23cm44c23c8cm16cm1c4cm1c8cm19c7cm16cm13_weight : PIPELINE_TYPE_FOR_CM14C2CM2C23CM44C23C8CM16CM1C4CM1C8CM19C7CM16CM13_WEIGHT;
    -- sfix(3, -5)
    signal cm5c1cm4cm5cm2cm17c0c13c1cm1c3c2cm15cm5cm3cm2_weight : PIPELINE_TYPE_FOR_CM5C1CM4CM5CM2CM17C0C13C1CM1C3C2CM15CM5CM3CM2_WEIGHT;
    -- sfix(3, -5)
    signal cm11c3c2cm14cm14c26cm11c3c2cm7cm6c2cm17cm11c6c10_weight : PIPELINE_TYPE_FOR_CM11C3C2CM14CM14C26CM11C3C2CM7CM6C2CM17CM11C6C10_WEIGHT;
    -- sfix(3, -5)
    signal c3c0cm2c12c9cm6c8cm7c0cm2c0c1cm2cm6cm2cm5_weight : PIPELINE_TYPE_FOR_C3C0CM2C12C9CM6C8CM7C0CM2C0C1CM2CM6CM2CM5_WEIGHT;
    -- sfix(3, -5)
    signal c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT;

    -- The zero output
    signal c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : std_logic_vector(9-1 downto 0); --	sfix(1, -8)

    -- If we use LUT multiplier and the input is unsigned, we have to cut away the msb of the result
    -- If this is the case, the temporary results are stored in the signals below.

    signal R_cm14c2cm2c23cm44c23c8cm16cm1c4cm1c8cm19c7cm16cm13_undelayed : std_logic_vector(14-1 downto 0);


begin
    c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 <= (others => '0');
    R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 <= c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0;
    X0_signal(0) <= X0;



    WEIGHT_ROM: entity work.conv6_core1_rmcm_weightsconstant_memory
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
        
            dout1   => cm3c2c6c22cm4c66c0cm5c6cm3cm6c46cm9cm4cm3cm8_weight(0), 
            dout2   => c4cm5cm31cm27c9cm48cm3cm1c22cm36cm3cm11cm14cm14c9cm16_weight(0), 
            dout3   => cm5cm1c2c3cm4cm18c1cm4c0c17c4cm30cm16cm5cm5c0_weight(0), 
            dout4   => cm1cm14cm1c24c54cm39cm6c39cm5cm3cm38cm4cm4c6cm13c16_weight(0), 
            dout5   => c54cm18c36cm26cm5c8cm22c20cm30cm9c50cm11c123c47c32c20_weight(0), 
            dout6   => cm14c2cm2c23cm44c23c8cm16cm1c4cm1c8cm19c7cm16cm13_weight(0), 
            dout7   => cm5c1cm4cm5cm2cm17c0c13c1cm1c3c2cm15cm5cm3cm2_weight(0), 
            dout8   => cm11c3c2cm14cm14c26cm11c3c2cm7cm6c2cm17cm11c6c10_weight(0), 
            dout9   => c3c0cm2c12c9cm6c8cm7c0cm2c0c1cm2cm6cm2cm5_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_cm3c2c6c22cm4c66c0cm5c6cm3cm6c46cm9cm4cm3cm8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3c2c6c22cm4c66c0cm5c6cm3cm6c46cm9cm4cm3cm8_weight(0), cm3c2c6c22cm4c66c0cm5c6cm3cm6c46cm9cm4cm3cm8_weight(1));
    PL_STEP_0_for_c4cm5cm31cm27c9cm48cm3cm1c22cm36cm3cm11cm14cm14c9cm16_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4cm5cm31cm27c9cm48cm3cm1c22cm36cm3cm11cm14cm14c9cm16_weight(0), c4cm5cm31cm27c9cm48cm3cm1c22cm36cm3cm11cm14cm14c9cm16_weight(1));
    PL_STEP_0_for_cm5cm1c2c3cm4cm18c1cm4c0c17c4cm30cm16cm5cm5c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5cm1c2c3cm4cm18c1cm4c0c17c4cm30cm16cm5cm5c0_weight(0), cm5cm1c2c3cm4cm18c1cm4c0c17c4cm30cm16cm5cm5c0_weight(1));
    PL_STEP_0_for_cm1cm14cm1c24c54cm39cm6c39cm5cm3cm38cm4cm4c6cm13c16_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm14cm1c24c54cm39cm6c39cm5cm3cm38cm4cm4c6cm13c16_weight(0), cm1cm14cm1c24c54cm39cm6c39cm5cm3cm38cm4cm4c6cm13c16_weight(1));
    PL_STEP_0_for_c54cm18c36cm26cm5c8cm22c20cm30cm9c50cm11c123c47c32c20_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c54cm18c36cm26cm5c8cm22c20cm30cm9c50cm11c123c47c32c20_weight(0), c54cm18c36cm26cm5c8cm22c20cm30cm9c50cm11c123c47c32c20_weight(1));
    PL_STEP_0_for_cm14c2cm2c23cm44c23c8cm16cm1c4cm1c8cm19c7cm16cm13_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm14c2cm2c23cm44c23c8cm16cm1c4cm1c8cm19c7cm16cm13_weight(0), cm14c2cm2c23cm44c23c8cm16cm1c4cm1c8cm19c7cm16cm13_weight(1));
    PL_STEP_0_for_cm5c1cm4cm5cm2cm17c0c13c1cm1c3c2cm15cm5cm3cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5c1cm4cm5cm2cm17c0c13c1cm1c3c2cm15cm5cm3cm2_weight(0), cm5c1cm4cm5cm2cm17c0c13c1cm1c3c2cm15cm5cm3cm2_weight(1));
    PL_STEP_0_for_cm11c3c2cm14cm14c26cm11c3c2cm7cm6c2cm17cm11c6c10_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm11c3c2cm14cm14c26cm11c3c2cm7cm6c2cm17cm11c6c10_weight(0), cm11c3c2cm14cm14c26cm11c3c2cm7cm6c2cm17cm11c6c10_weight(1));
    PL_STEP_0_for_c3c0cm2c12c9cm6c8cm7c0cm2c0c1cm2cm6cm2cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c0cm2c12c9cm6c8cm7c0cm2c0c1cm2cm6cm2cm5_weight(0), c3c0cm2c12c9cm6c8cm7c0cm2c0c1cm2cm6cm2cm5_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    cm3c2c6c22cm4c66c0cm5c6cm3cm6c46cm9cm4cm3cm8_c3c0cm2c12c9cm6c8cm7c0cm2c0c1cm2cm6cm2cm5_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm3c2c6c22cm4c66c0cm5c6cm3cm6c46cm9cm4cm3cm8_weight(1)(8-1 downto 0),
			B	=> c3c0cm2c12c9cm6c8cm7c0cm2c0c1cm2cm6cm2cm5_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm3c2c6c22cm4c66c0cm5c6cm3cm6c46cm9cm4cm3cm8,
			CxB => R_c3c0cm2c12c9cm6c8cm7c0cm2c0c1cm2cm6cm2cm5
		);

    c54cm18c36cm26cm5c8cm22c20cm30cm9c50cm11c123c47c32c20_cm11c3c2cm14cm14c26cm11c3c2cm7cm6c2cm17cm11c6c10_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c54cm18c36cm26cm5c8cm22c20cm30cm9c50cm11c123c47c32c20_weight(1)(8-1 downto 0),
			B	=> cm11c3c2cm14cm14c26cm11c3c2cm7cm6c2cm17cm11c6c10_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c54cm18c36cm26cm5c8cm22c20cm30cm9c50cm11c123c47c32c20,
			CxB => R_cm11c3c2cm14cm14c26cm11c3c2cm7cm6c2cm17cm11c6c10
		);

    c4cm5cm31cm27c9cm48cm3cm1c22cm36cm3cm11cm14cm14c9cm16_cm5c1cm4cm5cm2cm17c0c13c1cm1c3c2cm15cm5cm3cm2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c4cm5cm31cm27c9cm48cm3cm1c22cm36cm3cm11cm14cm14c9cm16_weight(1)(7-1 downto 0),
			B	=> cm5c1cm4cm5cm2cm17c0c13c1cm1c3c2cm15cm5cm3cm2_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c4cm5cm31cm27c9cm48cm3cm1c22cm36cm3cm11cm14cm14c9cm16,
			CxB => R_cm5c1cm4cm5cm2cm17c0c13c1cm1c3c2cm15cm5cm3cm2
		);

    cm1cm14cm1c24c54cm39cm6c39cm5cm3cm38cm4cm4c6cm13c16_cm5cm1c2c3cm4cm18c1cm4c0c17c4cm30cm16cm5cm5c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm1cm14cm1c24c54cm39cm6c39cm5cm3cm38cm4cm4c6cm13c16_weight(1)(7-1 downto 0),
			B	=> cm5cm1c2c3cm4cm18c1cm4c0c17c4cm30cm16cm5cm5c0_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1cm14cm1c24c54cm39cm6c39cm5cm3cm38cm4cm4c6cm13c16,
			CxB => R_cm5cm1c2c3cm4cm18c1cm4c0c17c4cm30cm16cm5cm5c0
		);




    cm14c2cm2c23cm44c23c8cm16cm1c4cm1c8cm19c7cm16cm13_MULT: entity work.TruncatedSingleMult
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
			A	=> cm14c2cm2c23cm44c23c8cm16cm1c4cm1c8cm19c7cm16cm13_weight(1),
			B	=> X0_signal(1),
			AxB	=> R_cm14c2cm2c23cm44c23c8cm16cm1c4cm1c8cm19c7cm16cm13
		);

end architecture;
