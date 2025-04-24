library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv8_core8_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        R_c8c8c7c11c9cm5cm7c8cm11c10c13cm7c6cm17cm18cm20 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c10c12c12c17c13cm8cm7c13cm16c15c18cm9c11cm21cm26cm23 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c5c5c6c8c6cm4cm3c6cm9c8c7cm4c6cm10cm17cm10 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c11c11c14c17c13cm9cm8c11cm14c13c19cm9c11cm20cm28cm25 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c16c17c19c23c18cm13cm10c16cm20c18c25cm12c16cm32cm31cm30 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c8c8c9c10c8cm6cm5c8cm13c10c10cm7c8cm22cm14cm15 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c4c5c9c9c6cm5cm4c4cm6c5c8cm6c6cm9cm10cm10 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c8c8c11c11c8cm7cm5c6cm9c8c10cm7c8cm20cm7cm14 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c5c4c3c5c5cm3cm2c3cm5c5c2cm4c3cm12c0cm7 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(9-1 downto 0)  --	sfix(1, -8)
    );
end conv8_core8_rmcm;

architecture arch of conv8_core8_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_C8C8C7C11C9CM5CM7C8CM11C10C13CM7C6CM17CM18CM20_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C10C12C12C17C13CM8CM7C13CM16C15C18CM9C11CM21CM26CM23_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5C5C6C8C6CM4CM3C6CM9C8C7CM4C6CM10CM17CM10_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C11C11C14C17C13CM9CM8C11CM14C13C19CM9C11CM20CM28CM25_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C16C17C19C23C18CM13CM10C16CM20C18C25CM12C16CM32CM31CM30_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C8C8C9C10C8CM6CM5C8CM13C10C10CM7C8CM22CM14CM15_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4C5C9C9C6CM5CM4C4CM6C5C8CM6C6CM9CM10CM10_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C8C8C11C11C8CM7CM5C6CM9C8C10CM7C8CM20CM7CM14_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5C4C3C5C5CM3CM2C3CM5C5C2CM4C3CM12C0CM7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(4, -3)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(3, -5)
    signal c8c8c7c11c9cm5cm7c8cm11c10c13cm7c6cm17cm18cm20_weight : PIPELINE_TYPE_FOR_C8C8C7C11C9CM5CM7C8CM11C10C13CM7C6CM17CM18CM20_WEIGHT;
    -- sfix(3, -5)
    signal c10c12c12c17c13cm8cm7c13cm16c15c18cm9c11cm21cm26cm23_weight : PIPELINE_TYPE_FOR_C10C12C12C17C13CM8CM7C13CM16C15C18CM9C11CM21CM26CM23_WEIGHT;
    -- sfix(3, -5)
    signal c5c5c6c8c6cm4cm3c6cm9c8c7cm4c6cm10cm17cm10_weight : PIPELINE_TYPE_FOR_C5C5C6C8C6CM4CM3C6CM9C8C7CM4C6CM10CM17CM10_WEIGHT;
    -- sfix(3, -5)
    signal c11c11c14c17c13cm9cm8c11cm14c13c19cm9c11cm20cm28cm25_weight : PIPELINE_TYPE_FOR_C11C11C14C17C13CM9CM8C11CM14C13C19CM9C11CM20CM28CM25_WEIGHT;
    -- sfix(3, -5)
    signal c16c17c19c23c18cm13cm10c16cm20c18c25cm12c16cm32cm31cm30_weight : PIPELINE_TYPE_FOR_C16C17C19C23C18CM13CM10C16CM20C18C25CM12C16CM32CM31CM30_WEIGHT;
    -- sfix(3, -5)
    signal c8c8c9c10c8cm6cm5c8cm13c10c10cm7c8cm22cm14cm15_weight : PIPELINE_TYPE_FOR_C8C8C9C10C8CM6CM5C8CM13C10C10CM7C8CM22CM14CM15_WEIGHT;
    -- sfix(3, -5)
    signal c4c5c9c9c6cm5cm4c4cm6c5c8cm6c6cm9cm10cm10_weight : PIPELINE_TYPE_FOR_C4C5C9C9C6CM5CM4C4CM6C5C8CM6C6CM9CM10CM10_WEIGHT;
    -- sfix(3, -5)
    signal c8c8c11c11c8cm7cm5c6cm9c8c10cm7c8cm20cm7cm14_weight : PIPELINE_TYPE_FOR_C8C8C11C11C8CM7CM5C6CM9C8C10CM7C8CM20CM7CM14_WEIGHT;
    -- sfix(3, -5)
    signal c5c4c3c5c5cm3cm2c3cm5c5c2cm4c3cm12c0cm7_weight : PIPELINE_TYPE_FOR_C5C4C3C5C5CM3CM2C3CM5C5C2CM4C3CM12C0CM7_WEIGHT;
    -- sfix(3, -5)
    signal c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT;

    -- The zero output
    signal c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : std_logic_vector(9-1 downto 0); --	sfix(1, -8)

    -- If we use LUT multiplier and the input is unsigned, we have to cut away the msb of the result
    -- If this is the case, the temporary results are stored in the signals below.

    signal R_c16c17c19c23c18cm13cm10c16cm20c18c25cm12c16cm32cm31cm30_undelayed : std_logic_vector(13-1 downto 0);


begin
    c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 <= (others => '0');
    R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 <= c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0;
    X0_signal(0) <= X0;



    WEIGHT_ROM: entity work.conv8_core8_rmcm_weightsconstant_memory
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
        
            dout1   => c8c8c7c11c9cm5cm7c8cm11c10c13cm7c6cm17cm18cm20_weight(0), 
            dout2   => c10c12c12c17c13cm8cm7c13cm16c15c18cm9c11cm21cm26cm23_weight(0), 
            dout3   => c5c5c6c8c6cm4cm3c6cm9c8c7cm4c6cm10cm17cm10_weight(0), 
            dout4   => c11c11c14c17c13cm9cm8c11cm14c13c19cm9c11cm20cm28cm25_weight(0), 
            dout5   => c16c17c19c23c18cm13cm10c16cm20c18c25cm12c16cm32cm31cm30_weight(0), 
            dout6   => c8c8c9c10c8cm6cm5c8cm13c10c10cm7c8cm22cm14cm15_weight(0), 
            dout7   => c4c5c9c9c6cm5cm4c4cm6c5c8cm6c6cm9cm10cm10_weight(0), 
            dout8   => c8c8c11c11c8cm7cm5c6cm9c8c10cm7c8cm20cm7cm14_weight(0), 
            dout9   => c5c4c3c5c5cm3cm2c3cm5c5c2cm4c3cm12c0cm7_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_c8c8c7c11c9cm5cm7c8cm11c10c13cm7c6cm17cm18cm20_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c8c8c7c11c9cm5cm7c8cm11c10c13cm7c6cm17cm18cm20_weight(0), c8c8c7c11c9cm5cm7c8cm11c10c13cm7c6cm17cm18cm20_weight(1));
    PL_STEP_0_for_c10c12c12c17c13cm8cm7c13cm16c15c18cm9c11cm21cm26cm23_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c10c12c12c17c13cm8cm7c13cm16c15c18cm9c11cm21cm26cm23_weight(0), c10c12c12c17c13cm8cm7c13cm16c15c18cm9c11cm21cm26cm23_weight(1));
    PL_STEP_0_for_c5c5c6c8c6cm4cm3c6cm9c8c7cm4c6cm10cm17cm10_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5c5c6c8c6cm4cm3c6cm9c8c7cm4c6cm10cm17cm10_weight(0), c5c5c6c8c6cm4cm3c6cm9c8c7cm4c6cm10cm17cm10_weight(1));
    PL_STEP_0_for_c11c11c14c17c13cm9cm8c11cm14c13c19cm9c11cm20cm28cm25_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c11c11c14c17c13cm9cm8c11cm14c13c19cm9c11cm20cm28cm25_weight(0), c11c11c14c17c13cm9cm8c11cm14c13c19cm9c11cm20cm28cm25_weight(1));
    PL_STEP_0_for_c16c17c19c23c18cm13cm10c16cm20c18c25cm12c16cm32cm31cm30_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c16c17c19c23c18cm13cm10c16cm20c18c25cm12c16cm32cm31cm30_weight(0), c16c17c19c23c18cm13cm10c16cm20c18c25cm12c16cm32cm31cm30_weight(1));
    PL_STEP_0_for_c8c8c9c10c8cm6cm5c8cm13c10c10cm7c8cm22cm14cm15_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c8c8c9c10c8cm6cm5c8cm13c10c10cm7c8cm22cm14cm15_weight(0), c8c8c9c10c8cm6cm5c8cm13c10c10cm7c8cm22cm14cm15_weight(1));
    PL_STEP_0_for_c4c5c9c9c6cm5cm4c4cm6c5c8cm6c6cm9cm10cm10_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4c5c9c9c6cm5cm4c4cm6c5c8cm6c6cm9cm10cm10_weight(0), c4c5c9c9c6cm5cm4c4cm6c5c8cm6c6cm9cm10cm10_weight(1));
    PL_STEP_0_for_c8c8c11c11c8cm7cm5c6cm9c8c10cm7c8cm20cm7cm14_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c8c8c11c11c8cm7cm5c6cm9c8c10cm7c8cm20cm7cm14_weight(0), c8c8c11c11c8cm7cm5c6cm9c8c10cm7c8cm20cm7cm14_weight(1));
    PL_STEP_0_for_c5c4c3c5c5cm3cm2c3cm5c5c2cm4c3cm12c0cm7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5c4c3c5c5cm3cm2c3cm5c5c2cm4c3cm12c0cm7_weight(0), c5c4c3c5c5cm3cm2c3cm5c5c2cm4c3cm12c0cm7_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    c8c8c7c11c9cm5cm7c8cm11c10c13cm7c6cm17cm18cm20_c5c4c3c5c5cm3cm2c3cm5c5c2cm4c3cm12c0cm7_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 6,
			B_WIDTH => 5,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c8c8c7c11c9cm5cm7c8cm11c10c13cm7c6cm17cm18cm20_weight(1)(6-1 downto 0),
			B	=> c5c4c3c5c5cm3cm2c3cm5c5c2cm4c3cm12c0cm7_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c8c8c7c11c9cm5cm7c8cm11c10c13cm7c6cm17cm18cm20,
			CxB => R_c5c4c3c5c5cm3cm2c3cm5c5c2cm4c3cm12c0cm7
		);

    c10c12c12c17c13cm8cm7c13cm16c15c18cm9c11cm21cm26cm23_c4c5c9c9c6cm5cm4c4cm6c5c8cm6c6cm9cm10cm10_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 6,
			B_WIDTH => 5,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c10c12c12c17c13cm8cm7c13cm16c15c18cm9c11cm21cm26cm23_weight(1)(6-1 downto 0),
			B	=> c4c5c9c9c6cm5cm4c4cm6c5c8cm6c6cm9cm10cm10_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c10c12c12c17c13cm8cm7c13cm16c15c18cm9c11cm21cm26cm23,
			CxB => R_c4c5c9c9c6cm5cm4c4cm6c5c8cm6c6cm9cm10cm10
		);

    c5c5c6c8c6cm4cm3c6cm9c8c7cm4c6cm10cm17cm10_c8c8c11c11c8cm7cm5c6cm9c8c10cm7c8cm20cm7cm14_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c5c5c6c8c6cm4cm3c6cm9c8c7cm4c6cm10cm17cm10_weight(1)(6-1 downto 0),
			B	=> c8c8c11c11c8cm7cm5c6cm9c8c10cm7c8cm20cm7cm14_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c5c5c6c8c6cm4cm3c6cm9c8c7cm4c6cm10cm17cm10,
			CxB => R_c8c8c11c11c8cm7cm5c6cm9c8c10cm7c8cm20cm7cm14
		);

    c11c11c14c17c13cm9cm8c11cm14c13c19cm9c11cm20cm28cm25_c8c8c9c10c8cm6cm5c8cm13c10c10cm7c8cm22cm14cm15_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c11c11c14c17c13cm9cm8c11cm14c13c19cm9c11cm20cm28cm25_weight(1)(6-1 downto 0),
			B	=> c8c8c9c10c8cm6cm5c8cm13c10c10cm7c8cm22cm14cm15_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c11c11c14c17c13cm9cm8c11cm14c13c19cm9c11cm20cm28cm25,
			CxB => R_c8c8c9c10c8cm6cm5c8cm13c10c10cm7c8cm22cm14cm15
		);




    c16c17c19c23c18cm13cm10c16cm20c18c25cm12c16cm32cm31cm30_MULT: entity work.TruncatedSingleMult
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
			A	=> c16c17c19c23c18cm13cm10c16cm20c18c25cm12c16cm32cm31cm30_weight(1),
			B	=> X0_signal(1),
			AxB	=> R_c16c17c19c23c18cm13cm10c16cm20c18c25cm12c16cm32cm31cm30
		);

end architecture;
