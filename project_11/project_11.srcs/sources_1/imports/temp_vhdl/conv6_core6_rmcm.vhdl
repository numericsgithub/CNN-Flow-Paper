library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv6_core6_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        R_cm11cm3cm1cm11cm3c7cm4c5c19cm21c3cm5c5c2cm3c2 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm6c12cm9cm26c26c9cm10cm20c38c22cm4cm2cm24cm7cm7c18 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm2cm4cm1cm3c2cm3c0c7c6c21cm3cm5c7cm4c0cm3 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm11cm12c12c14cm12c54cm5cm33cm16c28cm4c6cm12cm4cm1c0 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c1c43c33c37c13c66cm11c72cm31cm77c48c57c33cm11cm3c8 : out std_logic_vector(15-1 downto 0);   --	sfix(7, -8)
        R_cm10cm13c6cm4c1c17c6cm43cm10c14cm4cm1cm6c2c0cm3 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm8cm4c2cm5cm9c2c2c9cm5c9cm4cm4c0cm5c0c1 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm5c2cm5c7cm12cm1cm5cm24c8c19cm1cm8cm1c2cm2cm1 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm1cm3cm2cm1cm3cm6c1c11cm4cm12cm3cm4cm2cm4c1c0 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(9-1 downto 0)  --	sfix(1, -8)
    );
end conv6_core6_rmcm;

architecture arch of conv6_core6_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_CM11CM3CM1CM11CM3C7CM4C5C19CM21C3CM5C5C2CM3C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6C12CM9CM26C26C9CM10CM20C38C22CM4CM2CM24CM7CM7C18_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM4CM1CM3C2CM3C0C7C6C21CM3CM5C7CM4C0CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM11CM12C12C14CM12C54CM5CM33CM16C28CM4C6CM12CM4CM1C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C43C33C37C13C66CM11C72CM31CM77C48C57C33CM11CM3C8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM10CM13C6CM4C1C17C6CM43CM10C14CM4CM1CM6C2C0CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM8CM4C2CM5CM9C2C2C9CM5C9CM4CM4C0CM5C0C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5C2CM5C7CM12CM1CM5CM24C8C19CM1CM8CM1C2CM2CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM3CM2CM1CM3CM6C1C11CM4CM12CM3CM4CM2CM4C1C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(4, -3)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(3, -5)
    signal cm11cm3cm1cm11cm3c7cm4c5c19cm21c3cm5c5c2cm3c2_weight : PIPELINE_TYPE_FOR_CM11CM3CM1CM11CM3C7CM4C5C19CM21C3CM5C5C2CM3C2_WEIGHT;
    -- sfix(3, -5)
    signal cm6c12cm9cm26c26c9cm10cm20c38c22cm4cm2cm24cm7cm7c18_weight : PIPELINE_TYPE_FOR_CM6C12CM9CM26C26C9CM10CM20C38C22CM4CM2CM24CM7CM7C18_WEIGHT;
    -- sfix(3, -5)
    signal cm2cm4cm1cm3c2cm3c0c7c6c21cm3cm5c7cm4c0cm3_weight : PIPELINE_TYPE_FOR_CM2CM4CM1CM3C2CM3C0C7C6C21CM3CM5C7CM4C0CM3_WEIGHT;
    -- sfix(3, -5)
    signal cm11cm12c12c14cm12c54cm5cm33cm16c28cm4c6cm12cm4cm1c0_weight : PIPELINE_TYPE_FOR_CM11CM12C12C14CM12C54CM5CM33CM16C28CM4C6CM12CM4CM1C0_WEIGHT;
    -- sfix(3, -5)
    signal c1c43c33c37c13c66cm11c72cm31cm77c48c57c33cm11cm3c8_weight : PIPELINE_TYPE_FOR_C1C43C33C37C13C66CM11C72CM31CM77C48C57C33CM11CM3C8_WEIGHT;
    -- sfix(3, -5)
    signal cm10cm13c6cm4c1c17c6cm43cm10c14cm4cm1cm6c2c0cm3_weight : PIPELINE_TYPE_FOR_CM10CM13C6CM4C1C17C6CM43CM10C14CM4CM1CM6C2C0CM3_WEIGHT;
    -- sfix(3, -5)
    signal cm8cm4c2cm5cm9c2c2c9cm5c9cm4cm4c0cm5c0c1_weight : PIPELINE_TYPE_FOR_CM8CM4C2CM5CM9C2C2C9CM5C9CM4CM4C0CM5C0C1_WEIGHT;
    -- sfix(3, -5)
    signal cm5c2cm5c7cm12cm1cm5cm24c8c19cm1cm8cm1c2cm2cm1_weight : PIPELINE_TYPE_FOR_CM5C2CM5C7CM12CM1CM5CM24C8C19CM1CM8CM1C2CM2CM1_WEIGHT;
    -- sfix(3, -5)
    signal cm1cm3cm2cm1cm3cm6c1c11cm4cm12cm3cm4cm2cm4c1c0_weight : PIPELINE_TYPE_FOR_CM1CM3CM2CM1CM3CM6C1C11CM4CM12CM3CM4CM2CM4C1C0_WEIGHT;
    -- sfix(3, -5)
    signal c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT;

    -- The zero output
    signal c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : std_logic_vector(9-1 downto 0); --	sfix(1, -8)

    -- If we use LUT multiplier and the input is unsigned, we have to cut away the msb of the result
    -- If this is the case, the temporary results are stored in the signals below.

    signal R_cm11cm3cm1cm11cm3c7cm4c5c19cm21c3cm5c5c2cm3c2_undelayed : std_logic_vector(13-1 downto 0);


begin
    c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 <= (others => '0');
    R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 <= c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0;
    X0_signal(0) <= X0;



    WEIGHT_ROM: entity work.conv6_core6_rmcm_weightsconstant_memory
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
        
            dout1   => cm11cm3cm1cm11cm3c7cm4c5c19cm21c3cm5c5c2cm3c2_weight(0), 
            dout2   => cm6c12cm9cm26c26c9cm10cm20c38c22cm4cm2cm24cm7cm7c18_weight(0), 
            dout3   => cm2cm4cm1cm3c2cm3c0c7c6c21cm3cm5c7cm4c0cm3_weight(0), 
            dout4   => cm11cm12c12c14cm12c54cm5cm33cm16c28cm4c6cm12cm4cm1c0_weight(0), 
            dout5   => c1c43c33c37c13c66cm11c72cm31cm77c48c57c33cm11cm3c8_weight(0), 
            dout6   => cm10cm13c6cm4c1c17c6cm43cm10c14cm4cm1cm6c2c0cm3_weight(0), 
            dout7   => cm8cm4c2cm5cm9c2c2c9cm5c9cm4cm4c0cm5c0c1_weight(0), 
            dout8   => cm5c2cm5c7cm12cm1cm5cm24c8c19cm1cm8cm1c2cm2cm1_weight(0), 
            dout9   => cm1cm3cm2cm1cm3cm6c1c11cm4cm12cm3cm4cm2cm4c1c0_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_cm11cm3cm1cm11cm3c7cm4c5c19cm21c3cm5c5c2cm3c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm11cm3cm1cm11cm3c7cm4c5c19cm21c3cm5c5c2cm3c2_weight(0), cm11cm3cm1cm11cm3c7cm4c5c19cm21c3cm5c5c2cm3c2_weight(1));
    PL_STEP_0_for_cm6c12cm9cm26c26c9cm10cm20c38c22cm4cm2cm24cm7cm7c18_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6c12cm9cm26c26c9cm10cm20c38c22cm4cm2cm24cm7cm7c18_weight(0), cm6c12cm9cm26c26c9cm10cm20c38c22cm4cm2cm24cm7cm7c18_weight(1));
    PL_STEP_0_for_cm2cm4cm1cm3c2cm3c0c7c6c21cm3cm5c7cm4c0cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm4cm1cm3c2cm3c0c7c6c21cm3cm5c7cm4c0cm3_weight(0), cm2cm4cm1cm3c2cm3c0c7c6c21cm3cm5c7cm4c0cm3_weight(1));
    PL_STEP_0_for_cm11cm12c12c14cm12c54cm5cm33cm16c28cm4c6cm12cm4cm1c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm11cm12c12c14cm12c54cm5cm33cm16c28cm4c6cm12cm4cm1c0_weight(0), cm11cm12c12c14cm12c54cm5cm33cm16c28cm4c6cm12cm4cm1c0_weight(1));
    PL_STEP_0_for_c1c43c33c37c13c66cm11c72cm31cm77c48c57c33cm11cm3c8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c43c33c37c13c66cm11c72cm31cm77c48c57c33cm11cm3c8_weight(0), c1c43c33c37c13c66cm11c72cm31cm77c48c57c33cm11cm3c8_weight(1));
    PL_STEP_0_for_cm10cm13c6cm4c1c17c6cm43cm10c14cm4cm1cm6c2c0cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm10cm13c6cm4c1c17c6cm43cm10c14cm4cm1cm6c2c0cm3_weight(0), cm10cm13c6cm4c1c17c6cm43cm10c14cm4cm1cm6c2c0cm3_weight(1));
    PL_STEP_0_for_cm8cm4c2cm5cm9c2c2c9cm5c9cm4cm4c0cm5c0c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm8cm4c2cm5cm9c2c2c9cm5c9cm4cm4c0cm5c0c1_weight(0), cm8cm4c2cm5cm9c2c2c9cm5c9cm4cm4c0cm5c0c1_weight(1));
    PL_STEP_0_for_cm5c2cm5c7cm12cm1cm5cm24c8c19cm1cm8cm1c2cm2cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5c2cm5c7cm12cm1cm5cm24c8c19cm1cm8cm1c2cm2cm1_weight(0), cm5c2cm5c7cm12cm1cm5cm24c8c19cm1cm8cm1c2cm2cm1_weight(1));
    PL_STEP_0_for_cm1cm3cm2cm1cm3cm6c1c11cm4cm12cm3cm4cm2cm4c1c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm3cm2cm1cm3cm6c1c11cm4cm12cm3cm4cm2cm4c1c0_weight(0), cm1cm3cm2cm1cm3cm6c1c11cm4cm12cm3cm4cm2cm4c1c0_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    c1c43c33c37c13c66cm11c72cm31cm77c48c57c33cm11cm3c8_cm1cm3cm2cm1cm3cm6c1c11cm4cm12cm3cm4cm2cm4c1c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c1c43c33c37c13c66cm11c72cm31cm77c48c57c33cm11cm3c8_weight(1)(8-1 downto 0),
			B	=> cm1cm3cm2cm1cm3cm6c1c11cm4cm12cm3cm4cm2cm4c1c0_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1c43c33c37c13c66cm11c72cm31cm77c48c57c33cm11cm3c8,
			CxB => R_cm1cm3cm2cm1cm3cm6c1c11cm4cm12cm3cm4cm2cm4c1c0
		);

    cm6c12cm9cm26c26c9cm10cm20c38c22cm4cm2cm24cm7cm7c18_cm8cm4c2cm5cm9c2c2c9cm5c9cm4cm4c0cm5c0c1_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 5,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm6c12cm9cm26c26c9cm10cm20c38c22cm4cm2cm24cm7cm7c18_weight(1)(7-1 downto 0),
			B	=> cm8cm4c2cm5cm9c2c2c9cm5c9cm4cm4c0cm5c0c1_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm6c12cm9cm26c26c9cm10cm20c38c22cm4cm2cm24cm7cm7c18,
			CxB => R_cm8cm4c2cm5cm9c2c2c9cm5c9cm4cm4c0cm5c0c1
		);

    cm11cm12c12c14cm12c54cm5cm33cm16c28cm4c6cm12cm4cm1c0_cm5c2cm5c7cm12cm1cm5cm24c8c19cm1cm8cm1c2cm2cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm11cm12c12c14cm12c54cm5cm33cm16c28cm4c6cm12cm4cm1c0_weight(1)(7-1 downto 0),
			B	=> cm5c2cm5c7cm12cm1cm5cm24c8c19cm1cm8cm1c2cm2cm1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm11cm12c12c14cm12c54cm5cm33cm16c28cm4c6cm12cm4cm1c0,
			CxB => R_cm5c2cm5c7cm12cm1cm5cm24c8c19cm1cm8cm1c2cm2cm1
		);

    cm10cm13c6cm4c1c17c6cm43cm10c14cm4cm1cm6c2c0cm3_cm2cm4cm1cm3c2cm3c0c7c6c21cm3cm5c7cm4c0cm3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm10cm13c6cm4c1c17c6cm43cm10c14cm4cm1cm6c2c0cm3_weight(1)(7-1 downto 0),
			B	=> cm2cm4cm1cm3c2cm3c0c7c6c21cm3cm5c7cm4c0cm3_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm10cm13c6cm4c1c17c6cm43cm10c14cm4cm1cm6c2c0cm3,
			CxB => R_cm2cm4cm1cm3c2cm3c0c7c6c21cm3cm5c7cm4c0cm3
		);




    cm11cm3cm1cm11cm3c7cm4c5c19cm21c3cm5c5c2cm3c2_MULT: entity work.TruncatedSingleMult
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
			A	=> cm11cm3cm1cm11cm3c7cm4c5c19cm21c3cm5c5c2cm3c2_weight(1),
			B	=> X0_signal(1),
			AxB	=> R_cm11cm3cm1cm11cm3c7cm4c5c19cm21c3cm5c5c2cm3c2
		);

end architecture;
