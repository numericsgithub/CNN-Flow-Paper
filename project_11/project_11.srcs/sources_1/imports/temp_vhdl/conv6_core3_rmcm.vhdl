library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv6_core3_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        R_c2c8c10c11c6cm1cm6c3cm13cm22c4cm8c23cm11c38cm2 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c18cm16cm17c33cm15c12cm1c64cm19cm19cm13cm17cm33c20cm10cm5 : out std_logic_vector(15-1 downto 0);   --	sfix(7, -8)
        R_cm15c3c5c1c2cm3cm1c3cm30cm20c9c0c9c5cm12cm3 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c22cm27cm10cm3cm8c5cm5cm11c26cm7c26cm2cm29c10cm38cm15 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c54cm80cm15cm22cm25c22cm8cm42c127c45cm61c50c40c37c0cm10 : out std_logic_vector(15-1 downto 0);   --	sfix(7, -8)
        R_cm17cm19c2cm6c2cm3cm4cm11c23cm13c29cm4cm8cm7cm23cm7 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm10c14c0cm7c1cm1c1cm2cm13cm12c3cm2c3c3cm18c3 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm15c112cm5cm10c3cm3cm1cm2cm30c2cm8c0cm4cm11c16c3 : out std_logic_vector(15-1 downto 0);   --	sfix(7, -8)
        R_cm10c15c0cm3cm1c0cm1cm1cm26cm7c4cm2cm3cm10c19c1 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(9-1 downto 0)  --	sfix(1, -8)
    );
end conv6_core3_rmcm;

architecture arch of conv6_core3_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C8C10C11C6CM1CM6C3CM13CM22C4CM8C23CM11C38CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C18CM16CM17C33CM15C12CM1C64CM19CM19CM13CM17CM33C20CM10CM5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM15C3C5C1C2CM3CM1C3CM30CM20C9C0C9C5CM12CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C22CM27CM10CM3CM8C5CM5CM11C26CM7C26CM2CM29C10CM38CM15_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C54CM80CM15CM22CM25C22CM8CM42C127C45CM61C50C40C37C0CM10_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM17CM19C2CM6C2CM3CM4CM11C23CM13C29CM4CM8CM7CM23CM7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM10C14C0CM7C1CM1C1CM2CM13CM12C3CM2C3C3CM18C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM15C112CM5CM10C3CM3CM1CM2CM30C2CM8C0CM4CM11C16C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM10C15C0CM3CM1C0CM1CM1CM26CM7C4CM2CM3CM10C19C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(4, -3)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(3, -5)
    signal c2c8c10c11c6cm1cm6c3cm13cm22c4cm8c23cm11c38cm2_weight : PIPELINE_TYPE_FOR_C2C8C10C11C6CM1CM6C3CM13CM22C4CM8C23CM11C38CM2_WEIGHT;
    -- sfix(3, -5)
    signal c18cm16cm17c33cm15c12cm1c64cm19cm19cm13cm17cm33c20cm10cm5_weight : PIPELINE_TYPE_FOR_C18CM16CM17C33CM15C12CM1C64CM19CM19CM13CM17CM33C20CM10CM5_WEIGHT;
    -- sfix(3, -5)
    signal cm15c3c5c1c2cm3cm1c3cm30cm20c9c0c9c5cm12cm3_weight : PIPELINE_TYPE_FOR_CM15C3C5C1C2CM3CM1C3CM30CM20C9C0C9C5CM12CM3_WEIGHT;
    -- sfix(3, -5)
    signal c22cm27cm10cm3cm8c5cm5cm11c26cm7c26cm2cm29c10cm38cm15_weight : PIPELINE_TYPE_FOR_C22CM27CM10CM3CM8C5CM5CM11C26CM7C26CM2CM29C10CM38CM15_WEIGHT;
    -- sfix(3, -5)
    signal c54cm80cm15cm22cm25c22cm8cm42c127c45cm61c50c40c37c0cm10_weight : PIPELINE_TYPE_FOR_C54CM80CM15CM22CM25C22CM8CM42C127C45CM61C50C40C37C0CM10_WEIGHT;
    -- sfix(3, -5)
    signal cm17cm19c2cm6c2cm3cm4cm11c23cm13c29cm4cm8cm7cm23cm7_weight : PIPELINE_TYPE_FOR_CM17CM19C2CM6C2CM3CM4CM11C23CM13C29CM4CM8CM7CM23CM7_WEIGHT;
    -- sfix(3, -5)
    signal cm10c14c0cm7c1cm1c1cm2cm13cm12c3cm2c3c3cm18c3_weight : PIPELINE_TYPE_FOR_CM10C14C0CM7C1CM1C1CM2CM13CM12C3CM2C3C3CM18C3_WEIGHT;
    -- sfix(3, -5)
    signal cm15c112cm5cm10c3cm3cm1cm2cm30c2cm8c0cm4cm11c16c3_weight : PIPELINE_TYPE_FOR_CM15C112CM5CM10C3CM3CM1CM2CM30C2CM8C0CM4CM11C16C3_WEIGHT;
    -- sfix(3, -5)
    signal cm10c15c0cm3cm1c0cm1cm1cm26cm7c4cm2cm3cm10c19c1_weight : PIPELINE_TYPE_FOR_CM10C15C0CM3CM1C0CM1CM1CM26CM7C4CM2CM3CM10C19C1_WEIGHT;
    -- sfix(3, -5)
    signal c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT;

    -- The zero output
    signal c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : std_logic_vector(9-1 downto 0); --	sfix(1, -8)

    -- If we use LUT multiplier and the input is unsigned, we have to cut away the msb of the result
    -- If this is the case, the temporary results are stored in the signals below.

    signal R_c22cm27cm10cm3cm8c5cm5cm11c26cm7c26cm2cm29c10cm38cm15_undelayed : std_logic_vector(14-1 downto 0);


begin
    c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 <= (others => '0');
    R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 <= c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0;
    X0_signal(0) <= X0;



    WEIGHT_ROM: entity work.conv6_core3_rmcm_weightsconstant_memory
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
        
            dout1   => c2c8c10c11c6cm1cm6c3cm13cm22c4cm8c23cm11c38cm2_weight(0), 
            dout2   => c18cm16cm17c33cm15c12cm1c64cm19cm19cm13cm17cm33c20cm10cm5_weight(0), 
            dout3   => cm15c3c5c1c2cm3cm1c3cm30cm20c9c0c9c5cm12cm3_weight(0), 
            dout4   => c22cm27cm10cm3cm8c5cm5cm11c26cm7c26cm2cm29c10cm38cm15_weight(0), 
            dout5   => c54cm80cm15cm22cm25c22cm8cm42c127c45cm61c50c40c37c0cm10_weight(0), 
            dout6   => cm17cm19c2cm6c2cm3cm4cm11c23cm13c29cm4cm8cm7cm23cm7_weight(0), 
            dout7   => cm10c14c0cm7c1cm1c1cm2cm13cm12c3cm2c3c3cm18c3_weight(0), 
            dout8   => cm15c112cm5cm10c3cm3cm1cm2cm30c2cm8c0cm4cm11c16c3_weight(0), 
            dout9   => cm10c15c0cm3cm1c0cm1cm1cm26cm7c4cm2cm3cm10c19c1_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_c2c8c10c11c6cm1cm6c3cm13cm22c4cm8c23cm11c38cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c8c10c11c6cm1cm6c3cm13cm22c4cm8c23cm11c38cm2_weight(0), c2c8c10c11c6cm1cm6c3cm13cm22c4cm8c23cm11c38cm2_weight(1));
    PL_STEP_0_for_c18cm16cm17c33cm15c12cm1c64cm19cm19cm13cm17cm33c20cm10cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c18cm16cm17c33cm15c12cm1c64cm19cm19cm13cm17cm33c20cm10cm5_weight(0), c18cm16cm17c33cm15c12cm1c64cm19cm19cm13cm17cm33c20cm10cm5_weight(1));
    PL_STEP_0_for_cm15c3c5c1c2cm3cm1c3cm30cm20c9c0c9c5cm12cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm15c3c5c1c2cm3cm1c3cm30cm20c9c0c9c5cm12cm3_weight(0), cm15c3c5c1c2cm3cm1c3cm30cm20c9c0c9c5cm12cm3_weight(1));
    PL_STEP_0_for_c22cm27cm10cm3cm8c5cm5cm11c26cm7c26cm2cm29c10cm38cm15_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c22cm27cm10cm3cm8c5cm5cm11c26cm7c26cm2cm29c10cm38cm15_weight(0), c22cm27cm10cm3cm8c5cm5cm11c26cm7c26cm2cm29c10cm38cm15_weight(1));
    PL_STEP_0_for_c54cm80cm15cm22cm25c22cm8cm42c127c45cm61c50c40c37c0cm10_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c54cm80cm15cm22cm25c22cm8cm42c127c45cm61c50c40c37c0cm10_weight(0), c54cm80cm15cm22cm25c22cm8cm42c127c45cm61c50c40c37c0cm10_weight(1));
    PL_STEP_0_for_cm17cm19c2cm6c2cm3cm4cm11c23cm13c29cm4cm8cm7cm23cm7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm17cm19c2cm6c2cm3cm4cm11c23cm13c29cm4cm8cm7cm23cm7_weight(0), cm17cm19c2cm6c2cm3cm4cm11c23cm13c29cm4cm8cm7cm23cm7_weight(1));
    PL_STEP_0_for_cm10c14c0cm7c1cm1c1cm2cm13cm12c3cm2c3c3cm18c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm10c14c0cm7c1cm1c1cm2cm13cm12c3cm2c3c3cm18c3_weight(0), cm10c14c0cm7c1cm1c1cm2cm13cm12c3cm2c3c3cm18c3_weight(1));
    PL_STEP_0_for_cm15c112cm5cm10c3cm3cm1cm2cm30c2cm8c0cm4cm11c16c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm15c112cm5cm10c3cm3cm1cm2cm30c2cm8c0cm4cm11c16c3_weight(0), cm15c112cm5cm10c3cm3cm1cm2cm30c2cm8c0cm4cm11c16c3_weight(1));
    PL_STEP_0_for_cm10c15c0cm3cm1c0cm1cm1cm26cm7c4cm2cm3cm10c19c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm10c15c0cm3cm1c0cm1cm1cm26cm7c4cm2cm3cm10c19c1_weight(0), cm10c15c0cm3cm1c0cm1cm1cm26cm7c4cm2cm3cm10c19c1_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    c18cm16cm17c33cm15c12cm1c64cm19cm19cm13cm17cm33c20cm10cm5_cm10c15c0cm3cm1c0cm1cm1cm26cm7c4cm2cm3cm10c19c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c18cm16cm17c33cm15c12cm1c64cm19cm19cm13cm17cm33c20cm10cm5_weight(1)(8-1 downto 0),
			B	=> cm10c15c0cm3cm1c0cm1cm1cm26cm7c4cm2cm3cm10c19c1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c18cm16cm17c33cm15c12cm1c64cm19cm19cm13cm17cm33c20cm10cm5,
			CxB => R_cm10c15c0cm3cm1c0cm1cm1cm26cm7c4cm2cm3cm10c19c1
		);

    c54cm80cm15cm22cm25c22cm8cm42c127c45cm61c50c40c37c0cm10_cm10c14c0cm7c1cm1c1cm2cm13cm12c3cm2c3c3cm18c3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c54cm80cm15cm22cm25c22cm8cm42c127c45cm61c50c40c37c0cm10_weight(1)(8-1 downto 0),
			B	=> cm10c14c0cm7c1cm1c1cm2cm13cm12c3cm2c3c3cm18c3_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c54cm80cm15cm22cm25c22cm8cm42c127c45cm61c50c40c37c0cm10,
			CxB => R_cm10c14c0cm7c1cm1c1cm2cm13cm12c3cm2c3c3cm18c3
		);

    cm15c112cm5cm10c3cm3cm1cm2cm30c2cm8c0cm4cm11c16c3_cm17cm19c2cm6c2cm3cm4cm11c23cm13c29cm4cm8cm7cm23cm7_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm15c112cm5cm10c3cm3cm1cm2cm30c2cm8c0cm4cm11c16c3_weight(1)(8-1 downto 0),
			B	=> cm17cm19c2cm6c2cm3cm4cm11c23cm13c29cm4cm8cm7cm23cm7_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm15c112cm5cm10c3cm3cm1cm2cm30c2cm8c0cm4cm11c16c3,
			CxB => R_cm17cm19c2cm6c2cm3cm4cm11c23cm13c29cm4cm8cm7cm23cm7
		);

    c2c8c10c11c6cm1cm6c3cm13cm22c4cm8c23cm11c38cm2_cm15c3c5c1c2cm3cm1c3cm30cm20c9c0c9c5cm12cm3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c2c8c10c11c6cm1cm6c3cm13cm22c4cm8c23cm11c38cm2_weight(1)(7-1 downto 0),
			B	=> cm15c3c5c1c2cm3cm1c3cm30cm20c9c0c9c5cm12cm3_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c2c8c10c11c6cm1cm6c3cm13cm22c4cm8c23cm11c38cm2,
			CxB => R_cm15c3c5c1c2cm3cm1c3cm30cm20c9c0c9c5cm12cm3
		);




    c22cm27cm10cm3cm8c5cm5cm11c26cm7c26cm2cm29c10cm38cm15_MULT: entity work.TruncatedSingleMult
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
			A	=> c22cm27cm10cm3cm8c5cm5cm11c26cm7c26cm2cm29c10cm38cm15_weight(1),
			B	=> X0_signal(1),
			AxB	=> R_c22cm27cm10cm3cm8c5cm5cm11c26cm7c26cm2cm29c10cm38cm15
		);

end architecture;
