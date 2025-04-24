library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv6_core5_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        R_c0cm8cm5c3cm6cm40cm2cm1cm13cm15c7c25cm7c2c0c1 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c6c9c21c50c13cm3cm6c17cm10c12c6c51c7cm44cm2c12 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c0c2cm11c2cm11c38c14cm4cm1c9cm12c2c3c21cm4cm2 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c4c4c21cm12cm6c3c21cm1cm7c14c14cm26cm35cm17c6cm2 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c19c58c25cm27c66c9cm128c33cm9cm51c19cm51c41cm68c32c29 : out std_logic_vector(15-1 downto 0);   --	sfix(7, -8)
        R_cm1cm13cm17cm10cm3cm11c71cm1c0c10cm11cm2c3c58cm13cm5 : out std_logic_vector(15-1 downto 0);   --	sfix(7, -8)
        R_cm2cm1cm10cm5cm13c32c13cm1cm1c3cm10c1c0cm1cm6c1 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c0cm8c5c6c11cm12cm17c2cm3c14cm9c23cm3c9c11c2 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c1cm1cm8cm4cm2cm21c14cm1c5c0cm1cm5cm1c36cm9c1 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(9-1 downto 0)  --	sfix(1, -8)
    );
end conv6_core5_rmcm;

architecture arch of conv6_core5_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM8CM5C3CM6CM40CM2CM1CM13CM15C7C25CM7C2C0C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6C9C21C50C13CM3CM6C17CM10C12C6C51C7CM44CM2C12_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C2CM11C2CM11C38C14CM4CM1C9CM12C2C3C21CM4CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4C4C21CM12CM6C3C21CM1CM7C14C14CM26CM35CM17C6CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C19C58C25CM27C66C9CM128C33CM9CM51C19CM51C41CM68C32C29_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM13CM17CM10CM3CM11C71CM1C0C10CM11CM2C3C58CM13CM5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM1CM10CM5CM13C32C13CM1CM1C3CM10C1C0CM1CM6C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM8C5C6C11CM12CM17C2CM3C14CM9C23CM3C9C11C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM1CM8CM4CM2CM21C14CM1C5C0CM1CM5CM1C36CM9C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(4, -3)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(3, -5)
    signal c0cm8cm5c3cm6cm40cm2cm1cm13cm15c7c25cm7c2c0c1_weight : PIPELINE_TYPE_FOR_C0CM8CM5C3CM6CM40CM2CM1CM13CM15C7C25CM7C2C0C1_WEIGHT;
    -- sfix(3, -5)
    signal c6c9c21c50c13cm3cm6c17cm10c12c6c51c7cm44cm2c12_weight : PIPELINE_TYPE_FOR_C6C9C21C50C13CM3CM6C17CM10C12C6C51C7CM44CM2C12_WEIGHT;
    -- sfix(3, -5)
    signal c0c2cm11c2cm11c38c14cm4cm1c9cm12c2c3c21cm4cm2_weight : PIPELINE_TYPE_FOR_C0C2CM11C2CM11C38C14CM4CM1C9CM12C2C3C21CM4CM2_WEIGHT;
    -- sfix(3, -5)
    signal c4c4c21cm12cm6c3c21cm1cm7c14c14cm26cm35cm17c6cm2_weight : PIPELINE_TYPE_FOR_C4C4C21CM12CM6C3C21CM1CM7C14C14CM26CM35CM17C6CM2_WEIGHT;
    -- sfix(3, -5)
    signal c19c58c25cm27c66c9cm128c33cm9cm51c19cm51c41cm68c32c29_weight : PIPELINE_TYPE_FOR_C19C58C25CM27C66C9CM128C33CM9CM51C19CM51C41CM68C32C29_WEIGHT;
    -- sfix(3, -5)
    signal cm1cm13cm17cm10cm3cm11c71cm1c0c10cm11cm2c3c58cm13cm5_weight : PIPELINE_TYPE_FOR_CM1CM13CM17CM10CM3CM11C71CM1C0C10CM11CM2C3C58CM13CM5_WEIGHT;
    -- sfix(3, -5)
    signal cm2cm1cm10cm5cm13c32c13cm1cm1c3cm10c1c0cm1cm6c1_weight : PIPELINE_TYPE_FOR_CM2CM1CM10CM5CM13C32C13CM1CM1C3CM10C1C0CM1CM6C1_WEIGHT;
    -- sfix(3, -5)
    signal c0cm8c5c6c11cm12cm17c2cm3c14cm9c23cm3c9c11c2_weight : PIPELINE_TYPE_FOR_C0CM8C5C6C11CM12CM17C2CM3C14CM9C23CM3C9C11C2_WEIGHT;
    -- sfix(3, -5)
    signal c1cm1cm8cm4cm2cm21c14cm1c5c0cm1cm5cm1c36cm9c1_weight : PIPELINE_TYPE_FOR_C1CM1CM8CM4CM2CM21C14CM1C5C0CM1CM5CM1C36CM9C1_WEIGHT;
    -- sfix(3, -5)
    signal c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT;

    -- The zero output
    signal c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : std_logic_vector(9-1 downto 0); --	sfix(1, -8)

    -- If we use LUT multiplier and the input is unsigned, we have to cut away the msb of the result
    -- If this is the case, the temporary results are stored in the signals below.

    signal R_c0c2cm11c2cm11c38c14cm4cm1c9cm12c2c3c21cm4cm2_undelayed : std_logic_vector(14-1 downto 0);


begin
    c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 <= (others => '0');
    R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 <= c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0;
    X0_signal(0) <= X0;



    WEIGHT_ROM: entity work.conv6_core5_rmcm_weightsconstant_memory
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
        
            dout1   => c0cm8cm5c3cm6cm40cm2cm1cm13cm15c7c25cm7c2c0c1_weight(0), 
            dout2   => c6c9c21c50c13cm3cm6c17cm10c12c6c51c7cm44cm2c12_weight(0), 
            dout3   => c0c2cm11c2cm11c38c14cm4cm1c9cm12c2c3c21cm4cm2_weight(0), 
            dout4   => c4c4c21cm12cm6c3c21cm1cm7c14c14cm26cm35cm17c6cm2_weight(0), 
            dout5   => c19c58c25cm27c66c9cm128c33cm9cm51c19cm51c41cm68c32c29_weight(0), 
            dout6   => cm1cm13cm17cm10cm3cm11c71cm1c0c10cm11cm2c3c58cm13cm5_weight(0), 
            dout7   => cm2cm1cm10cm5cm13c32c13cm1cm1c3cm10c1c0cm1cm6c1_weight(0), 
            dout8   => c0cm8c5c6c11cm12cm17c2cm3c14cm9c23cm3c9c11c2_weight(0), 
            dout9   => c1cm1cm8cm4cm2cm21c14cm1c5c0cm1cm5cm1c36cm9c1_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_c0cm8cm5c3cm6cm40cm2cm1cm13cm15c7c25cm7c2c0c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm8cm5c3cm6cm40cm2cm1cm13cm15c7c25cm7c2c0c1_weight(0), c0cm8cm5c3cm6cm40cm2cm1cm13cm15c7c25cm7c2c0c1_weight(1));
    PL_STEP_0_for_c6c9c21c50c13cm3cm6c17cm10c12c6c51c7cm44cm2c12_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6c9c21c50c13cm3cm6c17cm10c12c6c51c7cm44cm2c12_weight(0), c6c9c21c50c13cm3cm6c17cm10c12c6c51c7cm44cm2c12_weight(1));
    PL_STEP_0_for_c0c2cm11c2cm11c38c14cm4cm1c9cm12c2c3c21cm4cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c2cm11c2cm11c38c14cm4cm1c9cm12c2c3c21cm4cm2_weight(0), c0c2cm11c2cm11c38c14cm4cm1c9cm12c2c3c21cm4cm2_weight(1));
    PL_STEP_0_for_c4c4c21cm12cm6c3c21cm1cm7c14c14cm26cm35cm17c6cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4c4c21cm12cm6c3c21cm1cm7c14c14cm26cm35cm17c6cm2_weight(0), c4c4c21cm12cm6c3c21cm1cm7c14c14cm26cm35cm17c6cm2_weight(1));
    PL_STEP_0_for_c19c58c25cm27c66c9cm128c33cm9cm51c19cm51c41cm68c32c29_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c19c58c25cm27c66c9cm128c33cm9cm51c19cm51c41cm68c32c29_weight(0), c19c58c25cm27c66c9cm128c33cm9cm51c19cm51c41cm68c32c29_weight(1));
    PL_STEP_0_for_cm1cm13cm17cm10cm3cm11c71cm1c0c10cm11cm2c3c58cm13cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm13cm17cm10cm3cm11c71cm1c0c10cm11cm2c3c58cm13cm5_weight(0), cm1cm13cm17cm10cm3cm11c71cm1c0c10cm11cm2c3c58cm13cm5_weight(1));
    PL_STEP_0_for_cm2cm1cm10cm5cm13c32c13cm1cm1c3cm10c1c0cm1cm6c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm1cm10cm5cm13c32c13cm1cm1c3cm10c1c0cm1cm6c1_weight(0), cm2cm1cm10cm5cm13c32c13cm1cm1c3cm10c1c0cm1cm6c1_weight(1));
    PL_STEP_0_for_c0cm8c5c6c11cm12cm17c2cm3c14cm9c23cm3c9c11c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm8c5c6c11cm12cm17c2cm3c14cm9c23cm3c9c11c2_weight(0), c0cm8c5c6c11cm12cm17c2cm3c14cm9c23cm3c9c11c2_weight(1));
    PL_STEP_0_for_c1cm1cm8cm4cm2cm21c14cm1c5c0cm1cm5cm1c36cm9c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm1cm8cm4cm2cm21c14cm1c5c0cm1cm5cm1c36cm9c1_weight(0), c1cm1cm8cm4cm2cm21c14cm1c5c0cm1cm5cm1c36cm9c1_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    c19c58c25cm27c66c9cm128c33cm9cm51c19cm51c41cm68c32c29_c0cm8c5c6c11cm12cm17c2cm3c14cm9c23cm3c9c11c2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c19c58c25cm27c66c9cm128c33cm9cm51c19cm51c41cm68c32c29_weight(1)(8-1 downto 0),
			B	=> c0cm8c5c6c11cm12cm17c2cm3c14cm9c23cm3c9c11c2_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c19c58c25cm27c66c9cm128c33cm9cm51c19cm51c41cm68c32c29,
			CxB => R_c0cm8c5c6c11cm12cm17c2cm3c14cm9c23cm3c9c11c2
		);

    cm1cm13cm17cm10cm3cm11c71cm1c0c10cm11cm2c3c58cm13cm5_c1cm1cm8cm4cm2cm21c14cm1c5c0cm1cm5cm1c36cm9c1_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 8,
			B_WIDTH => 7,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm1cm13cm17cm10cm3cm11c71cm1c0c10cm11cm2c3c58cm13cm5_weight(1)(8-1 downto 0),
			B	=> c1cm1cm8cm4cm2cm21c14cm1c5c0cm1cm5cm1c36cm9c1_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1cm13cm17cm10cm3cm11c71cm1c0c10cm11cm2c3c58cm13cm5,
			CxB => R_c1cm1cm8cm4cm2cm21c14cm1c5c0cm1cm5cm1c36cm9c1
		);

    c0cm8cm5c3cm6cm40cm2cm1cm13cm15c7c25cm7c2c0c1_cm2cm1cm10cm5cm13c32c13cm1cm1c3cm10c1c0cm1cm6c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0cm8cm5c3cm6cm40cm2cm1cm13cm15c7c25cm7c2c0c1_weight(1)(7-1 downto 0),
			B	=> cm2cm1cm10cm5cm13c32c13cm1cm1c3cm10c1c0cm1cm6c1_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0cm8cm5c3cm6cm40cm2cm1cm13cm15c7c25cm7c2c0c1,
			CxB => R_cm2cm1cm10cm5cm13c32c13cm1cm1c3cm10c1c0cm1cm6c1
		);

    c6c9c21c50c13cm3cm6c17cm10c12c6c51c7cm44cm2c12_c4c4c21cm12cm6c3c21cm1cm7c14c14cm26cm35cm17c6cm2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c6c9c21c50c13cm3cm6c17cm10c12c6c51c7cm44cm2c12_weight(1)(7-1 downto 0),
			B	=> c4c4c21cm12cm6c3c21cm1cm7c14c14cm26cm35cm17c6cm2_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c6c9c21c50c13cm3cm6c17cm10c12c6c51c7cm44cm2c12,
			CxB => R_c4c4c21cm12cm6c3c21cm1cm7c14c14cm26cm35cm17c6cm2
		);




    c0c2cm11c2cm11c38c14cm4cm1c9cm12c2c3c21cm4cm2_MULT: entity work.TruncatedSingleMult
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
			A	=> c0c2cm11c2cm11c38c14cm4cm1c9cm12c2c3c21cm4cm2_weight(1),
			B	=> X0_signal(1),
			AxB	=> R_c0c2cm11c2cm11c38c14cm4cm1c9cm12c2c3c21cm4cm2
		);

end architecture;
