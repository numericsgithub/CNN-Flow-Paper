library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv6_core7_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        R_c15cm3c1cm3c48cm6c3c7cm9c1c4c1c9cm5cm3c32 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm18c8cm4c19cm46cm5c14cm20c14c0c36cm8cm9cm2c40cm83 : out std_logic_vector(15-1 downto 0);   --	sfix(7, -8)
        R_cm9cm6c3cm8cm4cm6c0cm2c5cm2cm6c7c1cm4cm3c24 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c28c1cm4cm18cm88c0c2c33c2cm16cm13cm18cm22cm16cm10cm30 : out std_logic_vector(15-1 downto 0);   --	sfix(7, -8)
        R_cm30c42cm10c7c97c55c40c9c37c35cm4c46cm99c1cm13c42 : out std_logic_vector(15-1 downto 0);   --	sfix(7, -8)
        R_cm15cm12c1c8cm6cm2c0cm5cm8cm5c2cm28cm10cm2c2cm5 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c22cm5cm2c3c40cm3c1cm14c5c1cm7cm1c7cm4c9cm9 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm4cm6cm3cm7cm44cm6cm1c5cm5cm3cm15cm4cm1cm5cm12c35 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c2cm3c4c1c7cm3cm9cm3cm6cm2c0c3c6cm2c1cm21 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(9-1 downto 0)  --	sfix(1, -8)
    );
end conv6_core7_rmcm;

architecture arch of conv6_core7_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_C15CM3C1CM3C48CM6C3C7CM9C1C4C1C9CM5CM3C32_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM18C8CM4C19CM46CM5C14CM20C14C0C36CM8CM9CM2C40CM83_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM9CM6C3CM8CM4CM6C0CM2C5CM2CM6C7C1CM4CM3C24_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C28C1CM4CM18CM88C0C2C33C2CM16CM13CM18CM22CM16CM10CM30_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM30C42CM10C7C97C55C40C9C37C35CM4C46CM99C1CM13C42_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM15CM12C1C8CM6CM2C0CM5CM8CM5C2CM28CM10CM2C2CM5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C22CM5CM2C3C40CM3C1CM14C5C1CM7CM1C7CM4C9CM9_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4CM6CM3CM7CM44CM6CM1C5CM5CM3CM15CM4CM1CM5CM12C35_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2CM3C4C1C7CM3CM9CM3CM6CM2C0C3C6CM2C1CM21_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(4, -3)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(3, -5)
    signal c15cm3c1cm3c48cm6c3c7cm9c1c4c1c9cm5cm3c32_weight : PIPELINE_TYPE_FOR_C15CM3C1CM3C48CM6C3C7CM9C1C4C1C9CM5CM3C32_WEIGHT;
    -- sfix(3, -5)
    signal cm18c8cm4c19cm46cm5c14cm20c14c0c36cm8cm9cm2c40cm83_weight : PIPELINE_TYPE_FOR_CM18C8CM4C19CM46CM5C14CM20C14C0C36CM8CM9CM2C40CM83_WEIGHT;
    -- sfix(3, -5)
    signal cm9cm6c3cm8cm4cm6c0cm2c5cm2cm6c7c1cm4cm3c24_weight : PIPELINE_TYPE_FOR_CM9CM6C3CM8CM4CM6C0CM2C5CM2CM6C7C1CM4CM3C24_WEIGHT;
    -- sfix(3, -5)
    signal c28c1cm4cm18cm88c0c2c33c2cm16cm13cm18cm22cm16cm10cm30_weight : PIPELINE_TYPE_FOR_C28C1CM4CM18CM88C0C2C33C2CM16CM13CM18CM22CM16CM10CM30_WEIGHT;
    -- sfix(3, -5)
    signal cm30c42cm10c7c97c55c40c9c37c35cm4c46cm99c1cm13c42_weight : PIPELINE_TYPE_FOR_CM30C42CM10C7C97C55C40C9C37C35CM4C46CM99C1CM13C42_WEIGHT;
    -- sfix(3, -5)
    signal cm15cm12c1c8cm6cm2c0cm5cm8cm5c2cm28cm10cm2c2cm5_weight : PIPELINE_TYPE_FOR_CM15CM12C1C8CM6CM2C0CM5CM8CM5C2CM28CM10CM2C2CM5_WEIGHT;
    -- sfix(3, -5)
    signal c22cm5cm2c3c40cm3c1cm14c5c1cm7cm1c7cm4c9cm9_weight : PIPELINE_TYPE_FOR_C22CM5CM2C3C40CM3C1CM14C5C1CM7CM1C7CM4C9CM9_WEIGHT;
    -- sfix(3, -5)
    signal cm4cm6cm3cm7cm44cm6cm1c5cm5cm3cm15cm4cm1cm5cm12c35_weight : PIPELINE_TYPE_FOR_CM4CM6CM3CM7CM44CM6CM1C5CM5CM3CM15CM4CM1CM5CM12C35_WEIGHT;
    -- sfix(3, -5)
    signal c2cm3c4c1c7cm3cm9cm3cm6cm2c0c3c6cm2c1cm21_weight : PIPELINE_TYPE_FOR_C2CM3C4C1C7CM3CM9CM3CM6CM2C0C3C6CM2C1CM21_WEIGHT;
    -- sfix(3, -5)
    signal c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT;

    -- The zero output
    signal c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : std_logic_vector(9-1 downto 0); --	sfix(1, -8)

    -- If we use LUT multiplier and the input is unsigned, we have to cut away the msb of the result
    -- If this is the case, the temporary results are stored in the signals below.

    signal R_c22cm5cm2c3c40cm3c1cm14c5c1cm7cm1c7cm4c9cm9_undelayed : std_logic_vector(14-1 downto 0);


begin
    c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 <= (others => '0');
    R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 <= c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0;
    X0_signal(0) <= X0;



    WEIGHT_ROM: entity work.conv6_core7_rmcm_weightsconstant_memory
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
        
            dout1   => c15cm3c1cm3c48cm6c3c7cm9c1c4c1c9cm5cm3c32_weight(0), 
            dout2   => cm18c8cm4c19cm46cm5c14cm20c14c0c36cm8cm9cm2c40cm83_weight(0), 
            dout3   => cm9cm6c3cm8cm4cm6c0cm2c5cm2cm6c7c1cm4cm3c24_weight(0), 
            dout4   => c28c1cm4cm18cm88c0c2c33c2cm16cm13cm18cm22cm16cm10cm30_weight(0), 
            dout5   => cm30c42cm10c7c97c55c40c9c37c35cm4c46cm99c1cm13c42_weight(0), 
            dout6   => cm15cm12c1c8cm6cm2c0cm5cm8cm5c2cm28cm10cm2c2cm5_weight(0), 
            dout7   => c22cm5cm2c3c40cm3c1cm14c5c1cm7cm1c7cm4c9cm9_weight(0), 
            dout8   => cm4cm6cm3cm7cm44cm6cm1c5cm5cm3cm15cm4cm1cm5cm12c35_weight(0), 
            dout9   => c2cm3c4c1c7cm3cm9cm3cm6cm2c0c3c6cm2c1cm21_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_c15cm3c1cm3c48cm6c3c7cm9c1c4c1c9cm5cm3c32_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c15cm3c1cm3c48cm6c3c7cm9c1c4c1c9cm5cm3c32_weight(0), c15cm3c1cm3c48cm6c3c7cm9c1c4c1c9cm5cm3c32_weight(1));
    PL_STEP_0_for_cm18c8cm4c19cm46cm5c14cm20c14c0c36cm8cm9cm2c40cm83_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm18c8cm4c19cm46cm5c14cm20c14c0c36cm8cm9cm2c40cm83_weight(0), cm18c8cm4c19cm46cm5c14cm20c14c0c36cm8cm9cm2c40cm83_weight(1));
    PL_STEP_0_for_cm9cm6c3cm8cm4cm6c0cm2c5cm2cm6c7c1cm4cm3c24_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm9cm6c3cm8cm4cm6c0cm2c5cm2cm6c7c1cm4cm3c24_weight(0), cm9cm6c3cm8cm4cm6c0cm2c5cm2cm6c7c1cm4cm3c24_weight(1));
    PL_STEP_0_for_c28c1cm4cm18cm88c0c2c33c2cm16cm13cm18cm22cm16cm10cm30_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c28c1cm4cm18cm88c0c2c33c2cm16cm13cm18cm22cm16cm10cm30_weight(0), c28c1cm4cm18cm88c0c2c33c2cm16cm13cm18cm22cm16cm10cm30_weight(1));
    PL_STEP_0_for_cm30c42cm10c7c97c55c40c9c37c35cm4c46cm99c1cm13c42_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm30c42cm10c7c97c55c40c9c37c35cm4c46cm99c1cm13c42_weight(0), cm30c42cm10c7c97c55c40c9c37c35cm4c46cm99c1cm13c42_weight(1));
    PL_STEP_0_for_cm15cm12c1c8cm6cm2c0cm5cm8cm5c2cm28cm10cm2c2cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm15cm12c1c8cm6cm2c0cm5cm8cm5c2cm28cm10cm2c2cm5_weight(0), cm15cm12c1c8cm6cm2c0cm5cm8cm5c2cm28cm10cm2c2cm5_weight(1));
    PL_STEP_0_for_c22cm5cm2c3c40cm3c1cm14c5c1cm7cm1c7cm4c9cm9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c22cm5cm2c3c40cm3c1cm14c5c1cm7cm1c7cm4c9cm9_weight(0), c22cm5cm2c3c40cm3c1cm14c5c1cm7cm1c7cm4c9cm9_weight(1));
    PL_STEP_0_for_cm4cm6cm3cm7cm44cm6cm1c5cm5cm3cm15cm4cm1cm5cm12c35_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4cm6cm3cm7cm44cm6cm1c5cm5cm3cm15cm4cm1cm5cm12c35_weight(0), cm4cm6cm3cm7cm44cm6cm1c5cm5cm3cm15cm4cm1cm5cm12c35_weight(1));
    PL_STEP_0_for_c2cm3c4c1c7cm3cm9cm3cm6cm2c0c3c6cm2c1cm21_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2cm3c4c1c7cm3cm9cm3cm6cm2c0c3c6cm2c1cm21_weight(0), c2cm3c4c1c7cm3cm9cm3cm6cm2c0c3c6cm2c1cm21_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    cm18c8cm4c19cm46cm5c14cm20c14c0c36cm8cm9cm2c40cm83_c2cm3c4c1c7cm3cm9cm3cm6cm2c0c3c6cm2c1cm21_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm18c8cm4c19cm46cm5c14cm20c14c0c36cm8cm9cm2c40cm83_weight(1)(8-1 downto 0),
			B	=> c2cm3c4c1c7cm3cm9cm3cm6cm2c0c3c6cm2c1cm21_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm18c8cm4c19cm46cm5c14cm20c14c0c36cm8cm9cm2c40cm83,
			CxB => R_c2cm3c4c1c7cm3cm9cm3cm6cm2c0c3c6cm2c1cm21
		);

    c28c1cm4cm18cm88c0c2c33c2cm16cm13cm18cm22cm16cm10cm30_cm15cm12c1c8cm6cm2c0cm5cm8cm5c2cm28cm10cm2c2cm5_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c28c1cm4cm18cm88c0c2c33c2cm16cm13cm18cm22cm16cm10cm30_weight(1)(8-1 downto 0),
			B	=> cm15cm12c1c8cm6cm2c0cm5cm8cm5c2cm28cm10cm2c2cm5_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c28c1cm4cm18cm88c0c2c33c2cm16cm13cm18cm22cm16cm10cm30,
			CxB => R_cm15cm12c1c8cm6cm2c0cm5cm8cm5c2cm28cm10cm2c2cm5
		);

    cm30c42cm10c7c97c55c40c9c37c35cm4c46cm99c1cm13c42_cm9cm6c3cm8cm4cm6c0cm2c5cm2cm6c7c1cm4cm3c24_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm30c42cm10c7c97c55c40c9c37c35cm4c46cm99c1cm13c42_weight(1)(8-1 downto 0),
			B	=> cm9cm6c3cm8cm4cm6c0cm2c5cm2cm6c7c1cm4cm3c24_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm30c42cm10c7c97c55c40c9c37c35cm4c46cm99c1cm13c42,
			CxB => R_cm9cm6c3cm8cm4cm6c0cm2c5cm2cm6c7c1cm4cm3c24
		);

    c15cm3c1cm3c48cm6c3c7cm9c1c4c1c9cm5cm3c32_cm4cm6cm3cm7cm44cm6cm1c5cm5cm3cm15cm4cm1cm5cm12c35_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c15cm3c1cm3c48cm6c3c7cm9c1c4c1c9cm5cm3c32_weight(1)(7-1 downto 0),
			B	=> cm4cm6cm3cm7cm44cm6cm1c5cm5cm3cm15cm4cm1cm5cm12c35_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c15cm3c1cm3c48cm6c3c7cm9c1c4c1c9cm5cm3c32,
			CxB => R_cm4cm6cm3cm7cm44cm6cm1c5cm5cm3cm15cm4cm1cm5cm12c35
		);




    c22cm5cm2c3c40cm3c1cm14c5c1cm7cm1c7cm4c9cm9_MULT: entity work.TruncatedSingleMult
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
			A	=> c22cm5cm2c3c40cm3c1cm14c5c1cm7cm1c7cm4c9cm9_weight(1),
			B	=> X0_signal(1),
			AxB	=> R_c22cm5cm2c3c40cm3c1cm14c5c1cm7cm1c7cm4c9cm9
		);

end architecture;
