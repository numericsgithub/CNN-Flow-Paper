library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv8_core5_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        R_cm6cm13c6cm14c8cm9cm7cm6cm7c19c15cm23c6cm49cm11cm18 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm10cm15c9cm14c9cm11cm11cm21cm7c18c16cm28c11c27cm16c14 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm5cm5c4cm6c2cm5cm6cm5cm4c7c5cm17c6c19cm7c11 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm10cm19c8cm15c12cm10cm13cm9cm9c22c17c30c11cm62cm16cm31 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm17cm22c13cm22c16cm16cm18cm33cm9c15c18c40c15c5cm23c15 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm9cm10c6cm15c6cm8cm9cm8cm3c2c5c22c7c15cm10c17 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm6cm11c4cm4c6cm4cm8cm7cm2c10c5cm16c7cm26cm7cm21 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm10cm14c6cm13c9cm7cm11cm16cm3c4c4cm21c8cm10cm10c3 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm4cm5c2cm11c5cm4cm5cm4cm1cm1c1cm12c3c6cm4c9 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(9-1 downto 0)  --	sfix(1, -8)
    );
end conv8_core5_rmcm;

architecture arch of conv8_core5_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6CM13C6CM14C8CM9CM7CM6CM7C19C15CM23C6CM49CM11CM18_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM10CM15C9CM14C9CM11CM11CM21CM7C18C16CM28C11C27CM16C14_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5CM5C4CM6C2CM5CM6CM5CM4C7C5CM17C6C19CM7C11_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM10CM19C8CM15C12CM10CM13CM9CM9C22C17C30C11CM62CM16CM31_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM17CM22C13CM22C16CM16CM18CM33CM9C15C18C40C15C5CM23C15_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM9CM10C6CM15C6CM8CM9CM8CM3C2C5C22C7C15CM10C17_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6CM11C4CM4C6CM4CM8CM7CM2C10C5CM16C7CM26CM7CM21_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM10CM14C6CM13C9CM7CM11CM16CM3C4C4CM21C8CM10CM10C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4CM5C2CM11C5CM4CM5CM4CM1CM1C1CM12C3C6CM4C9_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(4, -3)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(3, -5)
    signal cm6cm13c6cm14c8cm9cm7cm6cm7c19c15cm23c6cm49cm11cm18_weight : PIPELINE_TYPE_FOR_CM6CM13C6CM14C8CM9CM7CM6CM7C19C15CM23C6CM49CM11CM18_WEIGHT;
    -- sfix(3, -5)
    signal cm10cm15c9cm14c9cm11cm11cm21cm7c18c16cm28c11c27cm16c14_weight : PIPELINE_TYPE_FOR_CM10CM15C9CM14C9CM11CM11CM21CM7C18C16CM28C11C27CM16C14_WEIGHT;
    -- sfix(3, -5)
    signal cm5cm5c4cm6c2cm5cm6cm5cm4c7c5cm17c6c19cm7c11_weight : PIPELINE_TYPE_FOR_CM5CM5C4CM6C2CM5CM6CM5CM4C7C5CM17C6C19CM7C11_WEIGHT;
    -- sfix(3, -5)
    signal cm10cm19c8cm15c12cm10cm13cm9cm9c22c17c30c11cm62cm16cm31_weight : PIPELINE_TYPE_FOR_CM10CM19C8CM15C12CM10CM13CM9CM9C22C17C30C11CM62CM16CM31_WEIGHT;
    -- sfix(3, -5)
    signal cm17cm22c13cm22c16cm16cm18cm33cm9c15c18c40c15c5cm23c15_weight : PIPELINE_TYPE_FOR_CM17CM22C13CM22C16CM16CM18CM33CM9C15C18C40C15C5CM23C15_WEIGHT;
    -- sfix(3, -5)
    signal cm9cm10c6cm15c6cm8cm9cm8cm3c2c5c22c7c15cm10c17_weight : PIPELINE_TYPE_FOR_CM9CM10C6CM15C6CM8CM9CM8CM3C2C5C22C7C15CM10C17_WEIGHT;
    -- sfix(3, -5)
    signal cm6cm11c4cm4c6cm4cm8cm7cm2c10c5cm16c7cm26cm7cm21_weight : PIPELINE_TYPE_FOR_CM6CM11C4CM4C6CM4CM8CM7CM2C10C5CM16C7CM26CM7CM21_WEIGHT;
    -- sfix(3, -5)
    signal cm10cm14c6cm13c9cm7cm11cm16cm3c4c4cm21c8cm10cm10c3_weight : PIPELINE_TYPE_FOR_CM10CM14C6CM13C9CM7CM11CM16CM3C4C4CM21C8CM10CM10C3_WEIGHT;
    -- sfix(3, -5)
    signal cm4cm5c2cm11c5cm4cm5cm4cm1cm1c1cm12c3c6cm4c9_weight : PIPELINE_TYPE_FOR_CM4CM5C2CM11C5CM4CM5CM4CM1CM1C1CM12C3C6CM4C9_WEIGHT;
    -- sfix(3, -5)
    signal c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT;

    -- The zero output
    signal c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : std_logic_vector(9-1 downto 0); --	sfix(1, -8)

    -- If we use LUT multiplier and the input is unsigned, we have to cut away the msb of the result
    -- If this is the case, the temporary results are stored in the signals below.

    signal R_cm5cm5c4cm6c2cm5cm6cm5cm4c7c5cm17c6c19cm7c11_undelayed : std_logic_vector(13-1 downto 0);


begin
    c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 <= (others => '0');
    R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 <= c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0;
    X0_signal(0) <= X0;



    WEIGHT_ROM: entity work.conv8_core5_rmcm_weightsconstant_memory
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
        
            dout1   => cm6cm13c6cm14c8cm9cm7cm6cm7c19c15cm23c6cm49cm11cm18_weight(0), 
            dout2   => cm10cm15c9cm14c9cm11cm11cm21cm7c18c16cm28c11c27cm16c14_weight(0), 
            dout3   => cm5cm5c4cm6c2cm5cm6cm5cm4c7c5cm17c6c19cm7c11_weight(0), 
            dout4   => cm10cm19c8cm15c12cm10cm13cm9cm9c22c17c30c11cm62cm16cm31_weight(0), 
            dout5   => cm17cm22c13cm22c16cm16cm18cm33cm9c15c18c40c15c5cm23c15_weight(0), 
            dout6   => cm9cm10c6cm15c6cm8cm9cm8cm3c2c5c22c7c15cm10c17_weight(0), 
            dout7   => cm6cm11c4cm4c6cm4cm8cm7cm2c10c5cm16c7cm26cm7cm21_weight(0), 
            dout8   => cm10cm14c6cm13c9cm7cm11cm16cm3c4c4cm21c8cm10cm10c3_weight(0), 
            dout9   => cm4cm5c2cm11c5cm4cm5cm4cm1cm1c1cm12c3c6cm4c9_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_cm6cm13c6cm14c8cm9cm7cm6cm7c19c15cm23c6cm49cm11cm18_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6cm13c6cm14c8cm9cm7cm6cm7c19c15cm23c6cm49cm11cm18_weight(0), cm6cm13c6cm14c8cm9cm7cm6cm7c19c15cm23c6cm49cm11cm18_weight(1));
    PL_STEP_0_for_cm10cm15c9cm14c9cm11cm11cm21cm7c18c16cm28c11c27cm16c14_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm10cm15c9cm14c9cm11cm11cm21cm7c18c16cm28c11c27cm16c14_weight(0), cm10cm15c9cm14c9cm11cm11cm21cm7c18c16cm28c11c27cm16c14_weight(1));
    PL_STEP_0_for_cm5cm5c4cm6c2cm5cm6cm5cm4c7c5cm17c6c19cm7c11_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5cm5c4cm6c2cm5cm6cm5cm4c7c5cm17c6c19cm7c11_weight(0), cm5cm5c4cm6c2cm5cm6cm5cm4c7c5cm17c6c19cm7c11_weight(1));
    PL_STEP_0_for_cm10cm19c8cm15c12cm10cm13cm9cm9c22c17c30c11cm62cm16cm31_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm10cm19c8cm15c12cm10cm13cm9cm9c22c17c30c11cm62cm16cm31_weight(0), cm10cm19c8cm15c12cm10cm13cm9cm9c22c17c30c11cm62cm16cm31_weight(1));
    PL_STEP_0_for_cm17cm22c13cm22c16cm16cm18cm33cm9c15c18c40c15c5cm23c15_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm17cm22c13cm22c16cm16cm18cm33cm9c15c18c40c15c5cm23c15_weight(0), cm17cm22c13cm22c16cm16cm18cm33cm9c15c18c40c15c5cm23c15_weight(1));
    PL_STEP_0_for_cm9cm10c6cm15c6cm8cm9cm8cm3c2c5c22c7c15cm10c17_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm9cm10c6cm15c6cm8cm9cm8cm3c2c5c22c7c15cm10c17_weight(0), cm9cm10c6cm15c6cm8cm9cm8cm3c2c5c22c7c15cm10c17_weight(1));
    PL_STEP_0_for_cm6cm11c4cm4c6cm4cm8cm7cm2c10c5cm16c7cm26cm7cm21_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6cm11c4cm4c6cm4cm8cm7cm2c10c5cm16c7cm26cm7cm21_weight(0), cm6cm11c4cm4c6cm4cm8cm7cm2c10c5cm16c7cm26cm7cm21_weight(1));
    PL_STEP_0_for_cm10cm14c6cm13c9cm7cm11cm16cm3c4c4cm21c8cm10cm10c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm10cm14c6cm13c9cm7cm11cm16cm3c4c4cm21c8cm10cm10c3_weight(0), cm10cm14c6cm13c9cm7cm11cm16cm3c4c4cm21c8cm10cm10c3_weight(1));
    PL_STEP_0_for_cm4cm5c2cm11c5cm4cm5cm4cm1cm1c1cm12c3c6cm4c9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4cm5c2cm11c5cm4cm5cm4cm1cm1c1cm12c3c6cm4c9_weight(0), cm4cm5c2cm11c5cm4cm5cm4cm1cm1c1cm12c3c6cm4c9_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    cm6cm13c6cm14c8cm9cm7cm6cm7c19c15cm23c6cm49cm11cm18_cm4cm5c2cm11c5cm4cm5cm4cm1cm1c1cm12c3c6cm4c9_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm6cm13c6cm14c8cm9cm7cm6cm7c19c15cm23c6cm49cm11cm18_weight(1)(7-1 downto 0),
			B	=> cm4cm5c2cm11c5cm4cm5cm4cm1cm1c1cm12c3c6cm4c9_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm6cm13c6cm14c8cm9cm7cm6cm7c19c15cm23c6cm49cm11cm18,
			CxB => R_cm4cm5c2cm11c5cm4cm5cm4cm1cm1c1cm12c3c6cm4c9
		);

    cm10cm19c8cm15c12cm10cm13cm9cm9c22c17c30c11cm62cm16cm31_cm10cm14c6cm13c9cm7cm11cm16cm3c4c4cm21c8cm10cm10c3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm10cm19c8cm15c12cm10cm13cm9cm9c22c17c30c11cm62cm16cm31_weight(1)(7-1 downto 0),
			B	=> cm10cm14c6cm13c9cm7cm11cm16cm3c4c4cm21c8cm10cm10c3_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm10cm19c8cm15c12cm10cm13cm9cm9c22c17c30c11cm62cm16cm31,
			CxB => R_cm10cm14c6cm13c9cm7cm11cm16cm3c4c4cm21c8cm10cm10c3
		);

    cm17cm22c13cm22c16cm16cm18cm33cm9c15c18c40c15c5cm23c15_cm6cm11c4cm4c6cm4cm8cm7cm2c10c5cm16c7cm26cm7cm21_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm17cm22c13cm22c16cm16cm18cm33cm9c15c18c40c15c5cm23c15_weight(1)(7-1 downto 0),
			B	=> cm6cm11c4cm4c6cm4cm8cm7cm2c10c5cm16c7cm26cm7cm21_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm17cm22c13cm22c16cm16cm18cm33cm9c15c18c40c15c5cm23c15,
			CxB => R_cm6cm11c4cm4c6cm4cm8cm7cm2c10c5cm16c7cm26cm7cm21
		);

    cm10cm15c9cm14c9cm11cm11cm21cm7c18c16cm28c11c27cm16c14_cm9cm10c6cm15c6cm8cm9cm8cm3c2c5c22c7c15cm10c17_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm10cm15c9cm14c9cm11cm11cm21cm7c18c16cm28c11c27cm16c14_weight(1)(6-1 downto 0),
			B	=> cm9cm10c6cm15c6cm8cm9cm8cm3c2c5c22c7c15cm10c17_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm10cm15c9cm14c9cm11cm11cm21cm7c18c16cm28c11c27cm16c14,
			CxB => R_cm9cm10c6cm15c6cm8cm9cm8cm3c2c5c22c7c15cm10c17
		);




    cm5cm5c4cm6c2cm5cm6cm5cm4c7c5cm17c6c19cm7c11_MULT: entity work.TruncatedSingleMult
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
			A	=> cm5cm5c4cm6c2cm5cm6cm5cm4c7c5cm17c6c19cm7c11_weight(1),
			B	=> X0_signal(1),
			AxB	=> R_cm5cm5c4cm6c2cm5cm6cm5cm4c7c5cm17c6c19cm7c11
		);

end architecture;
