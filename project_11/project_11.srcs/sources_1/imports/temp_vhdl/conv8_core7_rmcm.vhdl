library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv8_core7_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        R_c1cm5cm6cm8c5cm10cm10cm7cm32c8cm7c8c8cm8c9c5 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm3cm7cm11cm12c8cm14cm13cm4cm51c12cm11cm64c11cm15c14c6 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm4cm3cm6cm7c3cm6cm7c4cm34c6cm6c16c5cm9c7c4 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c8cm7cm9cm13c7cm16cm14cm4cm35c12cm13c49c13cm13c13c8 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c2cm11cm13cm18c11cm19cm18c5cm26c16cm18cm65c17cm21c21c9 : out std_logic_vector(15-1 downto 0);   --	sfix(7, -8)
        R_cm4cm5cm6cm9c4cm8cm9c10cm10c8cm9cm16c7cm11c10c4 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c8cm3cm5cm7c2cm8cm7c2c63c6cm8c44c7cm4c6c5 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c5cm5cm5cm10c4cm9cm10c8c71c7cm10cm30c8cm6c9c5 : out std_logic_vector(15-1 downto 0);   --	sfix(7, -8)
        R_c0cm3cm1cm4c1cm3cm4c8c35c3cm4cm41c3cm3c4c1 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(9-1 downto 0)  --	sfix(1, -8)
    );
end conv8_core7_rmcm;

architecture arch of conv8_core7_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM5CM6CM8C5CM10CM10CM7CM32C8CM7C8C8CM8C9C5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3CM7CM11CM12C8CM14CM13CM4CM51C12CM11CM64C11CM15C14C6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4CM3CM6CM7C3CM6CM7C4CM34C6CM6C16C5CM9C7C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C8CM7CM9CM13C7CM16CM14CM4CM35C12CM13C49C13CM13C13C8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2CM11CM13CM18C11CM19CM18C5CM26C16CM18CM65C17CM21C21C9_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4CM5CM6CM9C4CM8CM9C10CM10C8CM9CM16C7CM11C10C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C8CM3CM5CM7C2CM8CM7C2C63C6CM8C44C7CM4C6C5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5CM5CM5CM10C4CM9CM10C8C71C7CM10CM30C8CM6C9C5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM3CM1CM4C1CM3CM4C8C35C3CM4CM41C3CM3C4C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(4, -3)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(3, -5)
    signal c1cm5cm6cm8c5cm10cm10cm7cm32c8cm7c8c8cm8c9c5_weight : PIPELINE_TYPE_FOR_C1CM5CM6CM8C5CM10CM10CM7CM32C8CM7C8C8CM8C9C5_WEIGHT;
    -- sfix(3, -5)
    signal cm3cm7cm11cm12c8cm14cm13cm4cm51c12cm11cm64c11cm15c14c6_weight : PIPELINE_TYPE_FOR_CM3CM7CM11CM12C8CM14CM13CM4CM51C12CM11CM64C11CM15C14C6_WEIGHT;
    -- sfix(3, -5)
    signal cm4cm3cm6cm7c3cm6cm7c4cm34c6cm6c16c5cm9c7c4_weight : PIPELINE_TYPE_FOR_CM4CM3CM6CM7C3CM6CM7C4CM34C6CM6C16C5CM9C7C4_WEIGHT;
    -- sfix(3, -5)
    signal c8cm7cm9cm13c7cm16cm14cm4cm35c12cm13c49c13cm13c13c8_weight : PIPELINE_TYPE_FOR_C8CM7CM9CM13C7CM16CM14CM4CM35C12CM13C49C13CM13C13C8_WEIGHT;
    -- sfix(3, -5)
    signal c2cm11cm13cm18c11cm19cm18c5cm26c16cm18cm65c17cm21c21c9_weight : PIPELINE_TYPE_FOR_C2CM11CM13CM18C11CM19CM18C5CM26C16CM18CM65C17CM21C21C9_WEIGHT;
    -- sfix(3, -5)
    signal cm4cm5cm6cm9c4cm8cm9c10cm10c8cm9cm16c7cm11c10c4_weight : PIPELINE_TYPE_FOR_CM4CM5CM6CM9C4CM8CM9C10CM10C8CM9CM16C7CM11C10C4_WEIGHT;
    -- sfix(3, -5)
    signal c8cm3cm5cm7c2cm8cm7c2c63c6cm8c44c7cm4c6c5_weight : PIPELINE_TYPE_FOR_C8CM3CM5CM7C2CM8CM7C2C63C6CM8C44C7CM4C6C5_WEIGHT;
    -- sfix(3, -5)
    signal c5cm5cm5cm10c4cm9cm10c8c71c7cm10cm30c8cm6c9c5_weight : PIPELINE_TYPE_FOR_C5CM5CM5CM10C4CM9CM10C8C71C7CM10CM30C8CM6C9C5_WEIGHT;
    -- sfix(3, -5)
    signal c0cm3cm1cm4c1cm3cm4c8c35c3cm4cm41c3cm3c4c1_weight : PIPELINE_TYPE_FOR_C0CM3CM1CM4C1CM3CM4C8C35C3CM4CM41C3CM3C4C1_WEIGHT;
    -- sfix(3, -5)
    signal c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT;

    -- The zero output
    signal c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : std_logic_vector(9-1 downto 0); --	sfix(1, -8)

    -- If we use LUT multiplier and the input is unsigned, we have to cut away the msb of the result
    -- If this is the case, the temporary results are stored in the signals below.

    signal R_c8cm7cm9cm13c7cm16cm14cm4cm35c12cm13c49c13cm13c13c8_undelayed : std_logic_vector(14-1 downto 0);


begin
    c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 <= (others => '0');
    R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 <= c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0;
    X0_signal(0) <= X0;



    WEIGHT_ROM: entity work.conv8_core7_rmcm_weightsconstant_memory
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
        
            dout1   => c1cm5cm6cm8c5cm10cm10cm7cm32c8cm7c8c8cm8c9c5_weight(0), 
            dout2   => cm3cm7cm11cm12c8cm14cm13cm4cm51c12cm11cm64c11cm15c14c6_weight(0), 
            dout3   => cm4cm3cm6cm7c3cm6cm7c4cm34c6cm6c16c5cm9c7c4_weight(0), 
            dout4   => c8cm7cm9cm13c7cm16cm14cm4cm35c12cm13c49c13cm13c13c8_weight(0), 
            dout5   => c2cm11cm13cm18c11cm19cm18c5cm26c16cm18cm65c17cm21c21c9_weight(0), 
            dout6   => cm4cm5cm6cm9c4cm8cm9c10cm10c8cm9cm16c7cm11c10c4_weight(0), 
            dout7   => c8cm3cm5cm7c2cm8cm7c2c63c6cm8c44c7cm4c6c5_weight(0), 
            dout8   => c5cm5cm5cm10c4cm9cm10c8c71c7cm10cm30c8cm6c9c5_weight(0), 
            dout9   => c0cm3cm1cm4c1cm3cm4c8c35c3cm4cm41c3cm3c4c1_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_c1cm5cm6cm8c5cm10cm10cm7cm32c8cm7c8c8cm8c9c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm5cm6cm8c5cm10cm10cm7cm32c8cm7c8c8cm8c9c5_weight(0), c1cm5cm6cm8c5cm10cm10cm7cm32c8cm7c8c8cm8c9c5_weight(1));
    PL_STEP_0_for_cm3cm7cm11cm12c8cm14cm13cm4cm51c12cm11cm64c11cm15c14c6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3cm7cm11cm12c8cm14cm13cm4cm51c12cm11cm64c11cm15c14c6_weight(0), cm3cm7cm11cm12c8cm14cm13cm4cm51c12cm11cm64c11cm15c14c6_weight(1));
    PL_STEP_0_for_cm4cm3cm6cm7c3cm6cm7c4cm34c6cm6c16c5cm9c7c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4cm3cm6cm7c3cm6cm7c4cm34c6cm6c16c5cm9c7c4_weight(0), cm4cm3cm6cm7c3cm6cm7c4cm34c6cm6c16c5cm9c7c4_weight(1));
    PL_STEP_0_for_c8cm7cm9cm13c7cm16cm14cm4cm35c12cm13c49c13cm13c13c8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c8cm7cm9cm13c7cm16cm14cm4cm35c12cm13c49c13cm13c13c8_weight(0), c8cm7cm9cm13c7cm16cm14cm4cm35c12cm13c49c13cm13c13c8_weight(1));
    PL_STEP_0_for_c2cm11cm13cm18c11cm19cm18c5cm26c16cm18cm65c17cm21c21c9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2cm11cm13cm18c11cm19cm18c5cm26c16cm18cm65c17cm21c21c9_weight(0), c2cm11cm13cm18c11cm19cm18c5cm26c16cm18cm65c17cm21c21c9_weight(1));
    PL_STEP_0_for_cm4cm5cm6cm9c4cm8cm9c10cm10c8cm9cm16c7cm11c10c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4cm5cm6cm9c4cm8cm9c10cm10c8cm9cm16c7cm11c10c4_weight(0), cm4cm5cm6cm9c4cm8cm9c10cm10c8cm9cm16c7cm11c10c4_weight(1));
    PL_STEP_0_for_c8cm3cm5cm7c2cm8cm7c2c63c6cm8c44c7cm4c6c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c8cm3cm5cm7c2cm8cm7c2c63c6cm8c44c7cm4c6c5_weight(0), c8cm3cm5cm7c2cm8cm7c2c63c6cm8c44c7cm4c6c5_weight(1));
    PL_STEP_0_for_c5cm5cm5cm10c4cm9cm10c8c71c7cm10cm30c8cm6c9c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5cm5cm5cm10c4cm9cm10c8c71c7cm10cm30c8cm6c9c5_weight(0), c5cm5cm5cm10c4cm9cm10c8c71c7cm10cm30c8cm6c9c5_weight(1));
    PL_STEP_0_for_c0cm3cm1cm4c1cm3cm4c8c35c3cm4cm41c3cm3c4c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm3cm1cm4c1cm3cm4c8c35c3cm4cm41c3cm3c4c1_weight(0), c0cm3cm1cm4c1cm3cm4c8c35c3cm4cm41c3cm3c4c1_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    c2cm11cm13cm18c11cm19cm18c5cm26c16cm18cm65c17cm21c21c9_cm4cm5cm6cm9c4cm8cm9c10cm10c8cm9cm16c7cm11c10c4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c2cm11cm13cm18c11cm19cm18c5cm26c16cm18cm65c17cm21c21c9_weight(1)(8-1 downto 0),
			B	=> cm4cm5cm6cm9c4cm8cm9c10cm10c8cm9cm16c7cm11c10c4_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c2cm11cm13cm18c11cm19cm18c5cm26c16cm18cm65c17cm21c21c9,
			CxB => R_cm4cm5cm6cm9c4cm8cm9c10cm10c8cm9cm16c7cm11c10c4
		);

    c5cm5cm5cm10c4cm9cm10c8c71c7cm10cm30c8cm6c9c5_c1cm5cm6cm8c5cm10cm10cm7cm32c8cm7c8c8cm8c9c5_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c5cm5cm5cm10c4cm9cm10c8c71c7cm10cm30c8cm6c9c5_weight(1)(8-1 downto 0),
			B	=> c1cm5cm6cm8c5cm10cm10cm7cm32c8cm7c8c8cm8c9c5_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c5cm5cm5cm10c4cm9cm10c8c71c7cm10cm30c8cm6c9c5,
			CxB => R_c1cm5cm6cm8c5cm10cm10cm7cm32c8cm7c8c8cm8c9c5
		);

    cm3cm7cm11cm12c8cm14cm13cm4cm51c12cm11cm64c11cm15c14c6_c0cm3cm1cm4c1cm3cm4c8c35c3cm4cm41c3cm3c4c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm3cm7cm11cm12c8cm14cm13cm4cm51c12cm11cm64c11cm15c14c6_weight(1)(7-1 downto 0),
			B	=> c0cm3cm1cm4c1cm3cm4c8c35c3cm4cm41c3cm3c4c1_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm3cm7cm11cm12c8cm14cm13cm4cm51c12cm11cm64c11cm15c14c6,
			CxB => R_c0cm3cm1cm4c1cm3cm4c8c35c3cm4cm41c3cm3c4c1
		);

    cm4cm3cm6cm7c3cm6cm7c4cm34c6cm6c16c5cm9c7c4_c8cm3cm5cm7c2cm8cm7c2c63c6cm8c44c7cm4c6c5_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm4cm3cm6cm7c3cm6cm7c4cm34c6cm6c16c5cm9c7c4_weight(1)(7-1 downto 0),
			B	=> c8cm3cm5cm7c2cm8cm7c2c63c6cm8c44c7cm4c6c5_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm4cm3cm6cm7c3cm6cm7c4cm34c6cm6c16c5cm9c7c4,
			CxB => R_c8cm3cm5cm7c2cm8cm7c2c63c6cm8c44c7cm4c6c5
		);




    c8cm7cm9cm13c7cm16cm14cm4cm35c12cm13c49c13cm13c13c8_MULT: entity work.TruncatedSingleMult
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
			A	=> c8cm7cm9cm13c7cm16cm14cm4cm35c12cm13c49c13cm13c13c8_weight(1),
			B	=> X0_signal(1),
			AxB	=> R_c8cm7cm9cm13c7cm16cm14cm4cm35c12cm13c49c13cm13c13c8
		);

end architecture;
