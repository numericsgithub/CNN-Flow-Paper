library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv8_core4_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        R_cm8cm9cm7c4c8cm37c9cm8c7c8c7c6cm11c16cm9c7 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm11cm18cm10cm7c11cm33c13cm10c9c12c10c11cm14cm6cm12c12 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm5cm8cm4cm9c4cm9c7cm5c3c6c4c7cm7cm13cm5c7 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm13cm15cm10cm5c10cm30c12cm11c7c13c11c11cm14c26cm13c11 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm17cm25cm13cm13c13c21c17cm15c11c19c15c15cm18cm4cm19c14 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm8cm11cm6cm7c6c30c9cm7c6c8c6c6cm10cm26cm9c6 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm6cm4cm6cm7c5cm4c7cm5c2c7c6c6cm7c15cm6c5 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm9cm6cm8cm6c6c34c7cm7c6c9c7c6cm10c1cm9c5 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm4c0cm3c1c3c25c2cm3c3c3c3c0cm5cm17cm5c1 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(9-1 downto 0)  --	sfix(1, -8)
    );
end conv8_core4_rmcm;

architecture arch of conv8_core4_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_CM8CM9CM7C4C8CM37C9CM8C7C8C7C6CM11C16CM9C7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM11CM18CM10CM7C11CM33C13CM10C9C12C10C11CM14CM6CM12C12_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5CM8CM4CM9C4CM9C7CM5C3C6C4C7CM7CM13CM5C7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM13CM15CM10CM5C10CM30C12CM11C7C13C11C11CM14C26CM13C11_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM17CM25CM13CM13C13C21C17CM15C11C19C15C15CM18CM4CM19C14_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM8CM11CM6CM7C6C30C9CM7C6C8C6C6CM10CM26CM9C6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6CM4CM6CM7C5CM4C7CM5C2C7C6C6CM7C15CM6C5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM9CM6CM8CM6C6C34C7CM7C6C9C7C6CM10C1CM9C5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4C0CM3C1C3C25C2CM3C3C3C3C0CM5CM17CM5C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(4, -3)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(3, -5)
    signal cm8cm9cm7c4c8cm37c9cm8c7c8c7c6cm11c16cm9c7_weight : PIPELINE_TYPE_FOR_CM8CM9CM7C4C8CM37C9CM8C7C8C7C6CM11C16CM9C7_WEIGHT;
    -- sfix(3, -5)
    signal cm11cm18cm10cm7c11cm33c13cm10c9c12c10c11cm14cm6cm12c12_weight : PIPELINE_TYPE_FOR_CM11CM18CM10CM7C11CM33C13CM10C9C12C10C11CM14CM6CM12C12_WEIGHT;
    -- sfix(3, -5)
    signal cm5cm8cm4cm9c4cm9c7cm5c3c6c4c7cm7cm13cm5c7_weight : PIPELINE_TYPE_FOR_CM5CM8CM4CM9C4CM9C7CM5C3C6C4C7CM7CM13CM5C7_WEIGHT;
    -- sfix(3, -5)
    signal cm13cm15cm10cm5c10cm30c12cm11c7c13c11c11cm14c26cm13c11_weight : PIPELINE_TYPE_FOR_CM13CM15CM10CM5C10CM30C12CM11C7C13C11C11CM14C26CM13C11_WEIGHT;
    -- sfix(3, -5)
    signal cm17cm25cm13cm13c13c21c17cm15c11c19c15c15cm18cm4cm19c14_weight : PIPELINE_TYPE_FOR_CM17CM25CM13CM13C13C21C17CM15C11C19C15C15CM18CM4CM19C14_WEIGHT;
    -- sfix(3, -5)
    signal cm8cm11cm6cm7c6c30c9cm7c6c8c6c6cm10cm26cm9c6_weight : PIPELINE_TYPE_FOR_CM8CM11CM6CM7C6C30C9CM7C6C8C6C6CM10CM26CM9C6_WEIGHT;
    -- sfix(3, -5)
    signal cm6cm4cm6cm7c5cm4c7cm5c2c7c6c6cm7c15cm6c5_weight : PIPELINE_TYPE_FOR_CM6CM4CM6CM7C5CM4C7CM5C2C7C6C6CM7C15CM6C5_WEIGHT;
    -- sfix(3, -5)
    signal cm9cm6cm8cm6c6c34c7cm7c6c9c7c6cm10c1cm9c5_weight : PIPELINE_TYPE_FOR_CM9CM6CM8CM6C6C34C7CM7C6C9C7C6CM10C1CM9C5_WEIGHT;
    -- sfix(3, -5)
    signal cm4c0cm3c1c3c25c2cm3c3c3c3c0cm5cm17cm5c1_weight : PIPELINE_TYPE_FOR_CM4C0CM3C1C3C25C2CM3C3C3C3C0CM5CM17CM5C1_WEIGHT;
    -- sfix(3, -5)
    signal c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT;

    -- The zero output
    signal c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : std_logic_vector(9-1 downto 0); --	sfix(1, -8)

    -- If we use LUT multiplier and the input is unsigned, we have to cut away the msb of the result
    -- If this is the case, the temporary results are stored in the signals below.

    signal R_cm17cm25cm13cm13c13c21c17cm15c11c19c15c15cm18cm4cm19c14_undelayed : std_logic_vector(13-1 downto 0);


begin
    c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 <= (others => '0');
    R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 <= c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0;
    X0_signal(0) <= X0;



    WEIGHT_ROM: entity work.conv8_core4_rmcm_weightsconstant_memory
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
        
            dout1   => cm8cm9cm7c4c8cm37c9cm8c7c8c7c6cm11c16cm9c7_weight(0), 
            dout2   => cm11cm18cm10cm7c11cm33c13cm10c9c12c10c11cm14cm6cm12c12_weight(0), 
            dout3   => cm5cm8cm4cm9c4cm9c7cm5c3c6c4c7cm7cm13cm5c7_weight(0), 
            dout4   => cm13cm15cm10cm5c10cm30c12cm11c7c13c11c11cm14c26cm13c11_weight(0), 
            dout5   => cm17cm25cm13cm13c13c21c17cm15c11c19c15c15cm18cm4cm19c14_weight(0), 
            dout6   => cm8cm11cm6cm7c6c30c9cm7c6c8c6c6cm10cm26cm9c6_weight(0), 
            dout7   => cm6cm4cm6cm7c5cm4c7cm5c2c7c6c6cm7c15cm6c5_weight(0), 
            dout8   => cm9cm6cm8cm6c6c34c7cm7c6c9c7c6cm10c1cm9c5_weight(0), 
            dout9   => cm4c0cm3c1c3c25c2cm3c3c3c3c0cm5cm17cm5c1_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_cm8cm9cm7c4c8cm37c9cm8c7c8c7c6cm11c16cm9c7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm8cm9cm7c4c8cm37c9cm8c7c8c7c6cm11c16cm9c7_weight(0), cm8cm9cm7c4c8cm37c9cm8c7c8c7c6cm11c16cm9c7_weight(1));
    PL_STEP_0_for_cm11cm18cm10cm7c11cm33c13cm10c9c12c10c11cm14cm6cm12c12_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm11cm18cm10cm7c11cm33c13cm10c9c12c10c11cm14cm6cm12c12_weight(0), cm11cm18cm10cm7c11cm33c13cm10c9c12c10c11cm14cm6cm12c12_weight(1));
    PL_STEP_0_for_cm5cm8cm4cm9c4cm9c7cm5c3c6c4c7cm7cm13cm5c7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5cm8cm4cm9c4cm9c7cm5c3c6c4c7cm7cm13cm5c7_weight(0), cm5cm8cm4cm9c4cm9c7cm5c3c6c4c7cm7cm13cm5c7_weight(1));
    PL_STEP_0_for_cm13cm15cm10cm5c10cm30c12cm11c7c13c11c11cm14c26cm13c11_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm13cm15cm10cm5c10cm30c12cm11c7c13c11c11cm14c26cm13c11_weight(0), cm13cm15cm10cm5c10cm30c12cm11c7c13c11c11cm14c26cm13c11_weight(1));
    PL_STEP_0_for_cm17cm25cm13cm13c13c21c17cm15c11c19c15c15cm18cm4cm19c14_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm17cm25cm13cm13c13c21c17cm15c11c19c15c15cm18cm4cm19c14_weight(0), cm17cm25cm13cm13c13c21c17cm15c11c19c15c15cm18cm4cm19c14_weight(1));
    PL_STEP_0_for_cm8cm11cm6cm7c6c30c9cm7c6c8c6c6cm10cm26cm9c6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm8cm11cm6cm7c6c30c9cm7c6c8c6c6cm10cm26cm9c6_weight(0), cm8cm11cm6cm7c6c30c9cm7c6c8c6c6cm10cm26cm9c6_weight(1));
    PL_STEP_0_for_cm6cm4cm6cm7c5cm4c7cm5c2c7c6c6cm7c15cm6c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6cm4cm6cm7c5cm4c7cm5c2c7c6c6cm7c15cm6c5_weight(0), cm6cm4cm6cm7c5cm4c7cm5c2c7c6c6cm7c15cm6c5_weight(1));
    PL_STEP_0_for_cm9cm6cm8cm6c6c34c7cm7c6c9c7c6cm10c1cm9c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm9cm6cm8cm6c6c34c7cm7c6c9c7c6cm10c1cm9c5_weight(0), cm9cm6cm8cm6c6c34c7cm7c6c9c7c6cm10c1cm9c5_weight(1));
    PL_STEP_0_for_cm4c0cm3c1c3c25c2cm3c3c3c3c0cm5cm17cm5c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4c0cm3c1c3c25c2cm3c3c3c3c0cm5cm17cm5c1_weight(0), cm4c0cm3c1c3c25c2cm3c3c3c3c0cm5cm17cm5c1_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    cm8cm9cm7c4c8cm37c9cm8c7c8c7c6cm11c16cm9c7_cm6cm4cm6cm7c5cm4c7cm5c2c7c6c6cm7c15cm6c5_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm8cm9cm7c4c8cm37c9cm8c7c8c7c6cm11c16cm9c7_weight(1)(7-1 downto 0),
			B	=> cm6cm4cm6cm7c5cm4c7cm5c2c7c6c6cm7c15cm6c5_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm8cm9cm7c4c8cm37c9cm8c7c8c7c6cm11c16cm9c7,
			CxB => R_cm6cm4cm6cm7c5cm4c7cm5c2c7c6c6cm7c15cm6c5
		);

    cm11cm18cm10cm7c11cm33c13cm10c9c12c10c11cm14cm6cm12c12_cm5cm8cm4cm9c4cm9c7cm5c3c6c4c7cm7cm13cm5c7_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm11cm18cm10cm7c11cm33c13cm10c9c12c10c11cm14cm6cm12c12_weight(1)(7-1 downto 0),
			B	=> cm5cm8cm4cm9c4cm9c7cm5c3c6c4c7cm7cm13cm5c7_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm11cm18cm10cm7c11cm33c13cm10c9c12c10c11cm14cm6cm12c12,
			CxB => R_cm5cm8cm4cm9c4cm9c7cm5c3c6c4c7cm7cm13cm5c7
		);

    cm9cm6cm8cm6c6c34c7cm7c6c9c7c6cm10c1cm9c5_cm4c0cm3c1c3c25c2cm3c3c3c3c0cm5cm17cm5c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm9cm6cm8cm6c6c34c7cm7c6c9c7c6cm10c1cm9c5_weight(1)(7-1 downto 0),
			B	=> cm4c0cm3c1c3c25c2cm3c3c3c3c0cm5cm17cm5c1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm9cm6cm8cm6c6c34c7cm7c6c9c7c6cm10c1cm9c5,
			CxB => R_cm4c0cm3c1c3c25c2cm3c3c3c3c0cm5cm17cm5c1
		);

    cm13cm15cm10cm5c10cm30c12cm11c7c13c11c11cm14c26cm13c11_cm8cm11cm6cm7c6c30c9cm7c6c8c6c6cm10cm26cm9c6_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm13cm15cm10cm5c10cm30c12cm11c7c13c11c11cm14c26cm13c11_weight(1)(6-1 downto 0),
			B	=> cm8cm11cm6cm7c6c30c9cm7c6c8c6c6cm10cm26cm9c6_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm13cm15cm10cm5c10cm30c12cm11c7c13c11c11cm14c26cm13c11,
			CxB => R_cm8cm11cm6cm7c6c30c9cm7c6c8c6c6cm10cm26cm9c6
		);




    cm17cm25cm13cm13c13c21c17cm15c11c19c15c15cm18cm4cm19c14_MULT: entity work.TruncatedSingleMult
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
			A	=> cm17cm25cm13cm13c13c21c17cm15c11c19c15c15cm18cm4cm19c14_weight(1),
			B	=> X0_signal(1),
			AxB	=> R_cm17cm25cm13cm13c13c21c17cm15c11c19c15c15cm18cm4cm19c14
		);

end architecture;
