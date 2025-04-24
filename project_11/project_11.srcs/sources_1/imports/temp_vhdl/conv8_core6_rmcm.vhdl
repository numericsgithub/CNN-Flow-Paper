library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv8_core6_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        R_c5c6cm12c7cm10c27c12c4cm5cm20cm8c16c6c22c10c17 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c9c8cm32c11cm13c19c17c3cm10cm32cm14c11c11c14c15c22 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c5c4cm24c5cm5cm10c7cm1cm6cm24cm7c1c7cm10c7c8 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c7c10cm30c9cm18c26c16c12cm9c22cm14c15c6c26c15cm2 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c13c14cm43c14cm24cm8c24c17cm14c10cm18c9c14cm9c21cm6 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c7c6cm27c5cm9cm23c12c6cm8cm7cm8c0c9cm31c10cm9 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c3c5cm25c4cm9c11c8c8cm4c24cm11c4c2c11c8cm10 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c6c7cm26c5cm11cm22c12c15cm7c23cm13c0c6cm25c10cm14 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c4c3cm10c2cm3cm16c6c7cm3c8cm3cm4c4cm23c4cm6 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(9-1 downto 0)  --	sfix(1, -8)
    );
end conv8_core6_rmcm;

architecture arch of conv8_core6_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_C5C6CM12C7CM10C27C12C4CM5CM20CM8C16C6C22C10C17_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C9C8CM32C11CM13C19C17C3CM10CM32CM14C11C11C14C15C22_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5C4CM24C5CM5CM10C7CM1CM6CM24CM7C1C7CM10C7C8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C7C10CM30C9CM18C26C16C12CM9C22CM14C15C6C26C15CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C13C14CM43C14CM24CM8C24C17CM14C10CM18C9C14CM9C21CM6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C7C6CM27C5CM9CM23C12C6CM8CM7CM8C0C9CM31C10CM9_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C5CM25C4CM9C11C8C8CM4C24CM11C4C2C11C8CM10_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6C7CM26C5CM11CM22C12C15CM7C23CM13C0C6CM25C10CM14_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4C3CM10C2CM3CM16C6C7CM3C8CM3CM4C4CM23C4CM6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(4, -3)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(3, -5)
    signal c5c6cm12c7cm10c27c12c4cm5cm20cm8c16c6c22c10c17_weight : PIPELINE_TYPE_FOR_C5C6CM12C7CM10C27C12C4CM5CM20CM8C16C6C22C10C17_WEIGHT;
    -- sfix(3, -5)
    signal c9c8cm32c11cm13c19c17c3cm10cm32cm14c11c11c14c15c22_weight : PIPELINE_TYPE_FOR_C9C8CM32C11CM13C19C17C3CM10CM32CM14C11C11C14C15C22_WEIGHT;
    -- sfix(3, -5)
    signal c5c4cm24c5cm5cm10c7cm1cm6cm24cm7c1c7cm10c7c8_weight : PIPELINE_TYPE_FOR_C5C4CM24C5CM5CM10C7CM1CM6CM24CM7C1C7CM10C7C8_WEIGHT;
    -- sfix(3, -5)
    signal c7c10cm30c9cm18c26c16c12cm9c22cm14c15c6c26c15cm2_weight : PIPELINE_TYPE_FOR_C7C10CM30C9CM18C26C16C12CM9C22CM14C15C6C26C15CM2_WEIGHT;
    -- sfix(3, -5)
    signal c13c14cm43c14cm24cm8c24c17cm14c10cm18c9c14cm9c21cm6_weight : PIPELINE_TYPE_FOR_C13C14CM43C14CM24CM8C24C17CM14C10CM18C9C14CM9C21CM6_WEIGHT;
    -- sfix(3, -5)
    signal c7c6cm27c5cm9cm23c12c6cm8cm7cm8c0c9cm31c10cm9_weight : PIPELINE_TYPE_FOR_C7C6CM27C5CM9CM23C12C6CM8CM7CM8C0C9CM31C10CM9_WEIGHT;
    -- sfix(3, -5)
    signal c3c5cm25c4cm9c11c8c8cm4c24cm11c4c2c11c8cm10_weight : PIPELINE_TYPE_FOR_C3C5CM25C4CM9C11C8C8CM4C24CM11C4C2C11C8CM10_WEIGHT;
    -- sfix(3, -5)
    signal c6c7cm26c5cm11cm22c12c15cm7c23cm13c0c6cm25c10cm14_weight : PIPELINE_TYPE_FOR_C6C7CM26C5CM11CM22C12C15CM7C23CM13C0C6CM25C10CM14_WEIGHT;
    -- sfix(3, -5)
    signal c4c3cm10c2cm3cm16c6c7cm3c8cm3cm4c4cm23c4cm6_weight : PIPELINE_TYPE_FOR_C4C3CM10C2CM3CM16C6C7CM3C8CM3CM4C4CM23C4CM6_WEIGHT;
    -- sfix(3, -5)
    signal c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT;

    -- The zero output
    signal c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : std_logic_vector(9-1 downto 0); --	sfix(1, -8)

    -- If we use LUT multiplier and the input is unsigned, we have to cut away the msb of the result
    -- If this is the case, the temporary results are stored in the signals below.

    signal R_c7c10cm30c9cm18c26c16c12cm9c22cm14c15c6c26c15cm2_undelayed : std_logic_vector(13-1 downto 0);


begin
    c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 <= (others => '0');
    R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 <= c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0;
    X0_signal(0) <= X0;



    WEIGHT_ROM: entity work.conv8_core6_rmcm_weightsconstant_memory
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
        
            dout1   => c5c6cm12c7cm10c27c12c4cm5cm20cm8c16c6c22c10c17_weight(0), 
            dout2   => c9c8cm32c11cm13c19c17c3cm10cm32cm14c11c11c14c15c22_weight(0), 
            dout3   => c5c4cm24c5cm5cm10c7cm1cm6cm24cm7c1c7cm10c7c8_weight(0), 
            dout4   => c7c10cm30c9cm18c26c16c12cm9c22cm14c15c6c26c15cm2_weight(0), 
            dout5   => c13c14cm43c14cm24cm8c24c17cm14c10cm18c9c14cm9c21cm6_weight(0), 
            dout6   => c7c6cm27c5cm9cm23c12c6cm8cm7cm8c0c9cm31c10cm9_weight(0), 
            dout7   => c3c5cm25c4cm9c11c8c8cm4c24cm11c4c2c11c8cm10_weight(0), 
            dout8   => c6c7cm26c5cm11cm22c12c15cm7c23cm13c0c6cm25c10cm14_weight(0), 
            dout9   => c4c3cm10c2cm3cm16c6c7cm3c8cm3cm4c4cm23c4cm6_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_c5c6cm12c7cm10c27c12c4cm5cm20cm8c16c6c22c10c17_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5c6cm12c7cm10c27c12c4cm5cm20cm8c16c6c22c10c17_weight(0), c5c6cm12c7cm10c27c12c4cm5cm20cm8c16c6c22c10c17_weight(1));
    PL_STEP_0_for_c9c8cm32c11cm13c19c17c3cm10cm32cm14c11c11c14c15c22_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c9c8cm32c11cm13c19c17c3cm10cm32cm14c11c11c14c15c22_weight(0), c9c8cm32c11cm13c19c17c3cm10cm32cm14c11c11c14c15c22_weight(1));
    PL_STEP_0_for_c5c4cm24c5cm5cm10c7cm1cm6cm24cm7c1c7cm10c7c8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5c4cm24c5cm5cm10c7cm1cm6cm24cm7c1c7cm10c7c8_weight(0), c5c4cm24c5cm5cm10c7cm1cm6cm24cm7c1c7cm10c7c8_weight(1));
    PL_STEP_0_for_c7c10cm30c9cm18c26c16c12cm9c22cm14c15c6c26c15cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c7c10cm30c9cm18c26c16c12cm9c22cm14c15c6c26c15cm2_weight(0), c7c10cm30c9cm18c26c16c12cm9c22cm14c15c6c26c15cm2_weight(1));
    PL_STEP_0_for_c13c14cm43c14cm24cm8c24c17cm14c10cm18c9c14cm9c21cm6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c13c14cm43c14cm24cm8c24c17cm14c10cm18c9c14cm9c21cm6_weight(0), c13c14cm43c14cm24cm8c24c17cm14c10cm18c9c14cm9c21cm6_weight(1));
    PL_STEP_0_for_c7c6cm27c5cm9cm23c12c6cm8cm7cm8c0c9cm31c10cm9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c7c6cm27c5cm9cm23c12c6cm8cm7cm8c0c9cm31c10cm9_weight(0), c7c6cm27c5cm9cm23c12c6cm8cm7cm8c0c9cm31c10cm9_weight(1));
    PL_STEP_0_for_c3c5cm25c4cm9c11c8c8cm4c24cm11c4c2c11c8cm10_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c5cm25c4cm9c11c8c8cm4c24cm11c4c2c11c8cm10_weight(0), c3c5cm25c4cm9c11c8c8cm4c24cm11c4c2c11c8cm10_weight(1));
    PL_STEP_0_for_c6c7cm26c5cm11cm22c12c15cm7c23cm13c0c6cm25c10cm14_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6c7cm26c5cm11cm22c12c15cm7c23cm13c0c6cm25c10cm14_weight(0), c6c7cm26c5cm11cm22c12c15cm7c23cm13c0c6cm25c10cm14_weight(1));
    PL_STEP_0_for_c4c3cm10c2cm3cm16c6c7cm3c8cm3cm4c4cm23c4cm6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4c3cm10c2cm3cm16c6c7cm3c8cm3cm4c4cm23c4cm6_weight(0), c4c3cm10c2cm3cm16c6c7cm3c8cm3cm4c4cm23c4cm6_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    c13c14cm43c14cm24cm8c24c17cm14c10cm18c9c14cm9c21cm6_c4c3cm10c2cm3cm16c6c7cm3c8cm3cm4c4cm23c4cm6_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c13c14cm43c14cm24cm8c24c17cm14c10cm18c9c14cm9c21cm6_weight(1)(7-1 downto 0),
			B	=> c4c3cm10c2cm3cm16c6c7cm3c8cm3cm4c4cm23c4cm6_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c13c14cm43c14cm24cm8c24c17cm14c10cm18c9c14cm9c21cm6,
			CxB => R_c4c3cm10c2cm3cm16c6c7cm3c8cm3cm4c4cm23c4cm6
		);

    c5c6cm12c7cm10c27c12c4cm5cm20cm8c16c6c22c10c17_c6c7cm26c5cm11cm22c12c15cm7c23cm13c0c6cm25c10cm14_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 6,
			B_WIDTH => 6,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c5c6cm12c7cm10c27c12c4cm5cm20cm8c16c6c22c10c17_weight(1)(6-1 downto 0),
			B	=> c6c7cm26c5cm11cm22c12c15cm7c23cm13c0c6cm25c10cm14_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c5c6cm12c7cm10c27c12c4cm5cm20cm8c16c6c22c10c17,
			CxB => R_c6c7cm26c5cm11cm22c12c15cm7c23cm13c0c6cm25c10cm14
		);

    c9c8cm32c11cm13c19c17c3cm10cm32cm14c11c11c14c15c22_c3c5cm25c4cm9c11c8c8cm4c24cm11c4c2c11c8cm10_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 6,
			B_WIDTH => 6,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c9c8cm32c11cm13c19c17c3cm10cm32cm14c11c11c14c15c22_weight(1)(6-1 downto 0),
			B	=> c3c5cm25c4cm9c11c8c8cm4c24cm11c4c2c11c8cm10_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c9c8cm32c11cm13c19c17c3cm10cm32cm14c11c11c14c15c22,
			CxB => R_c3c5cm25c4cm9c11c8c8cm4c24cm11c4c2c11c8cm10
		);

    c5c4cm24c5cm5cm10c7cm1cm6cm24cm7c1c7cm10c7c8_c7c6cm27c5cm9cm23c12c6cm8cm7cm8c0c9cm31c10cm9_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 6,
			B_WIDTH => 6,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c5c4cm24c5cm5cm10c7cm1cm6cm24cm7c1c7cm10c7c8_weight(1)(6-1 downto 0),
			B	=> c7c6cm27c5cm9cm23c12c6cm8cm7cm8c0c9cm31c10cm9_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c5c4cm24c5cm5cm10c7cm1cm6cm24cm7c1c7cm10c7c8,
			CxB => R_c7c6cm27c5cm9cm23c12c6cm8cm7cm8c0c9cm31c10cm9
		);




    c7c10cm30c9cm18c26c16c12cm9c22cm14c15c6c26c15cm2_MULT: entity work.TruncatedSingleMult
	generic map
		(
            A_WIDTH           => 8, --	sfix(3, -5)
            A_TRUNCATED_WIDTH => 6, -- This would be the MSB position of the weight
            B_WIDTH           => 7, --	ufix(4, -3)
            AxB_WIDTH         => 13, --	sfix(5, -8)
            AxB_FRAC_TRUNCATION => 0,
            B_IS_SIGNED       => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c7c10cm30c9cm18c26c16c12cm9c22cm14c15c6c26c15cm2_weight(1),
			B	=> X0_signal(1),
			AxB	=> R_c7c10cm30c9cm18c26c16c12cm9c22cm14c15c6c26c15cm2
		);

end architecture;
