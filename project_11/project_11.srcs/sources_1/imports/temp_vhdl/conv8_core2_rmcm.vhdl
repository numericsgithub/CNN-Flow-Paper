library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv8_core2_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        R_c7c8cm5c9c7cm48c14cm10c13c8c7c41c11c14c9cm14 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c9c10cm7c11c14c49c21cm12c18c12c9c49c12c16c13cm18 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c5c3cm3c4c9c7c9cm7c8c4c4c22c4c5c5cm7 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c9c11cm8c10c14cm62c21cm10c17c12c10c41c14c16c13cm18 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c12c15cm12c15c22c68c31cm14c20c16c12c49c18c19c19cm26 : out std_logic_vector(15-1 downto 0);   --	sfix(7, -8)
        R_c5c4cm5c6c11c4c13cm9c8c6c4c17c8c7c8cm12 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c5c5cm4c4c9cm25c10cm4c7c5c5c12c6c5c6cm6 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c6c7cm6c6c11c27c13cm6c8c6c5c2c9c7c8cm12 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c3c2cm2c3c4cm1c5cm3c3c2c2c1c5c3c3cm7 : out std_logic_vector(11-1 downto 0);   --	sfix(3, -8)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(9-1 downto 0)  --	sfix(1, -8)
    );
end conv8_core2_rmcm;

architecture arch of conv8_core2_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_C7C8CM5C9C7CM48C14CM10C13C8C7C41C11C14C9CM14_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C9C10CM7C11C14C49C21CM12C18C12C9C49C12C16C13CM18_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5C3CM3C4C9C7C9CM7C8C4C4C22C4C5C5CM7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C9C11CM8C10C14CM62C21CM10C17C12C10C41C14C16C13CM18_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C12C15CM12C15C22C68C31CM14C20C16C12C49C18C19C19CM26_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5C4CM5C6C11C4C13CM9C8C6C4C17C8C7C8CM12_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5C5CM4C4C9CM25C10CM4C7C5C5C12C6C5C6CM6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6C7CM6C6C11C27C13CM6C8C6C5C2C9C7C8CM12_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C2CM2C3C4CM1C5CM3C3C2C2C1C5C3C3CM7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(4, -3)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(3, -5)
    signal c7c8cm5c9c7cm48c14cm10c13c8c7c41c11c14c9cm14_weight : PIPELINE_TYPE_FOR_C7C8CM5C9C7CM48C14CM10C13C8C7C41C11C14C9CM14_WEIGHT;
    -- sfix(3, -5)
    signal c9c10cm7c11c14c49c21cm12c18c12c9c49c12c16c13cm18_weight : PIPELINE_TYPE_FOR_C9C10CM7C11C14C49C21CM12C18C12C9C49C12C16C13CM18_WEIGHT;
    -- sfix(3, -5)
    signal c5c3cm3c4c9c7c9cm7c8c4c4c22c4c5c5cm7_weight : PIPELINE_TYPE_FOR_C5C3CM3C4C9C7C9CM7C8C4C4C22C4C5C5CM7_WEIGHT;
    -- sfix(3, -5)
    signal c9c11cm8c10c14cm62c21cm10c17c12c10c41c14c16c13cm18_weight : PIPELINE_TYPE_FOR_C9C11CM8C10C14CM62C21CM10C17C12C10C41C14C16C13CM18_WEIGHT;
    -- sfix(3, -5)
    signal c12c15cm12c15c22c68c31cm14c20c16c12c49c18c19c19cm26_weight : PIPELINE_TYPE_FOR_C12C15CM12C15C22C68C31CM14C20C16C12C49C18C19C19CM26_WEIGHT;
    -- sfix(3, -5)
    signal c5c4cm5c6c11c4c13cm9c8c6c4c17c8c7c8cm12_weight : PIPELINE_TYPE_FOR_C5C4CM5C6C11C4C13CM9C8C6C4C17C8C7C8CM12_WEIGHT;
    -- sfix(3, -5)
    signal c5c5cm4c4c9cm25c10cm4c7c5c5c12c6c5c6cm6_weight : PIPELINE_TYPE_FOR_C5C5CM4C4C9CM25C10CM4C7C5C5C12C6C5C6CM6_WEIGHT;
    -- sfix(3, -5)
    signal c6c7cm6c6c11c27c13cm6c8c6c5c2c9c7c8cm12_weight : PIPELINE_TYPE_FOR_C6C7CM6C6C11C27C13CM6C8C6C5C2C9C7C8CM12_WEIGHT;
    -- sfix(3, -5)
    signal c3c2cm2c3c4cm1c5cm3c3c2c2c1c5c3c3cm7_weight : PIPELINE_TYPE_FOR_C3C2CM2C3C4CM1C5CM3C3C2C2C1C5C3C3CM7_WEIGHT;
    -- sfix(3, -5)
    signal c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT;

    -- The zero output
    signal c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : std_logic_vector(9-1 downto 0); --	sfix(1, -8)

    -- If we use LUT multiplier and the input is unsigned, we have to cut away the msb of the result
    -- If this is the case, the temporary results are stored in the signals below.

    signal R_c5c3cm3c4c9c7c9cm7c8c4c4c22c4c5c5cm7_undelayed : std_logic_vector(13-1 downto 0);


begin
    c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 <= (others => '0');
    R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 <= c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0;
    X0_signal(0) <= X0;



    WEIGHT_ROM: entity work.conv8_core2_rmcm_weightsconstant_memory
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
        
            dout1   => c7c8cm5c9c7cm48c14cm10c13c8c7c41c11c14c9cm14_weight(0), 
            dout2   => c9c10cm7c11c14c49c21cm12c18c12c9c49c12c16c13cm18_weight(0), 
            dout3   => c5c3cm3c4c9c7c9cm7c8c4c4c22c4c5c5cm7_weight(0), 
            dout4   => c9c11cm8c10c14cm62c21cm10c17c12c10c41c14c16c13cm18_weight(0), 
            dout5   => c12c15cm12c15c22c68c31cm14c20c16c12c49c18c19c19cm26_weight(0), 
            dout6   => c5c4cm5c6c11c4c13cm9c8c6c4c17c8c7c8cm12_weight(0), 
            dout7   => c5c5cm4c4c9cm25c10cm4c7c5c5c12c6c5c6cm6_weight(0), 
            dout8   => c6c7cm6c6c11c27c13cm6c8c6c5c2c9c7c8cm12_weight(0), 
            dout9   => c3c2cm2c3c4cm1c5cm3c3c2c2c1c5c3c3cm7_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_c7c8cm5c9c7cm48c14cm10c13c8c7c41c11c14c9cm14_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c7c8cm5c9c7cm48c14cm10c13c8c7c41c11c14c9cm14_weight(0), c7c8cm5c9c7cm48c14cm10c13c8c7c41c11c14c9cm14_weight(1));
    PL_STEP_0_for_c9c10cm7c11c14c49c21cm12c18c12c9c49c12c16c13cm18_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c9c10cm7c11c14c49c21cm12c18c12c9c49c12c16c13cm18_weight(0), c9c10cm7c11c14c49c21cm12c18c12c9c49c12c16c13cm18_weight(1));
    PL_STEP_0_for_c5c3cm3c4c9c7c9cm7c8c4c4c22c4c5c5cm7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5c3cm3c4c9c7c9cm7c8c4c4c22c4c5c5cm7_weight(0), c5c3cm3c4c9c7c9cm7c8c4c4c22c4c5c5cm7_weight(1));
    PL_STEP_0_for_c9c11cm8c10c14cm62c21cm10c17c12c10c41c14c16c13cm18_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c9c11cm8c10c14cm62c21cm10c17c12c10c41c14c16c13cm18_weight(0), c9c11cm8c10c14cm62c21cm10c17c12c10c41c14c16c13cm18_weight(1));
    PL_STEP_0_for_c12c15cm12c15c22c68c31cm14c20c16c12c49c18c19c19cm26_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c12c15cm12c15c22c68c31cm14c20c16c12c49c18c19c19cm26_weight(0), c12c15cm12c15c22c68c31cm14c20c16c12c49c18c19c19cm26_weight(1));
    PL_STEP_0_for_c5c4cm5c6c11c4c13cm9c8c6c4c17c8c7c8cm12_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5c4cm5c6c11c4c13cm9c8c6c4c17c8c7c8cm12_weight(0), c5c4cm5c6c11c4c13cm9c8c6c4c17c8c7c8cm12_weight(1));
    PL_STEP_0_for_c5c5cm4c4c9cm25c10cm4c7c5c5c12c6c5c6cm6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5c5cm4c4c9cm25c10cm4c7c5c5c12c6c5c6cm6_weight(0), c5c5cm4c4c9cm25c10cm4c7c5c5c12c6c5c6cm6_weight(1));
    PL_STEP_0_for_c6c7cm6c6c11c27c13cm6c8c6c5c2c9c7c8cm12_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6c7cm6c6c11c27c13cm6c8c6c5c2c9c7c8cm12_weight(0), c6c7cm6c6c11c27c13cm6c8c6c5c2c9c7c8cm12_weight(1));
    PL_STEP_0_for_c3c2cm2c3c4cm1c5cm3c3c2c2c1c5c3c3cm7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c2cm2c3c4cm1c5cm3c3c2c2c1c5c3c3cm7_weight(0), c3c2cm2c3c4cm1c5cm3c3c2c2c1c5c3c3cm7_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    c12c15cm12c15c22c68c31cm14c20c16c12c49c18c19c19cm26_c3c2cm2c3c4cm1c5cm3c3c2c2c1c5c3c3cm7_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 8,
			B_WIDTH => 4,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c12c15cm12c15c22c68c31cm14c20c16c12c49c18c19c19cm26_weight(1)(8-1 downto 0),
			B	=> c3c2cm2c3c4cm1c5cm3c3c2c2c1c5c3c3cm7_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c12c15cm12c15c22c68c31cm14c20c16c12c49c18c19c19cm26,
			CxB => R_c3c2cm2c3c4cm1c5cm3c3c2c2c1c5c3c3cm7
		);

    c7c8cm5c9c7cm48c14cm10c13c8c7c41c11c14c9cm14_c6c7cm6c6c11c27c13cm6c8c6c5c2c9c7c8cm12_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c7c8cm5c9c7cm48c14cm10c13c8c7c41c11c14c9cm14_weight(1)(7-1 downto 0),
			B	=> c6c7cm6c6c11c27c13cm6c8c6c5c2c9c7c8cm12_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c7c8cm5c9c7cm48c14cm10c13c8c7c41c11c14c9cm14,
			CxB => R_c6c7cm6c6c11c27c13cm6c8c6c5c2c9c7c8cm12
		);

    c9c10cm7c11c14c49c21cm12c18c12c9c49c12c16c13cm18_c5c5cm4c4c9cm25c10cm4c7c5c5c12c6c5c6cm6_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c9c10cm7c11c14c49c21cm12c18c12c9c49c12c16c13cm18_weight(1)(7-1 downto 0),
			B	=> c5c5cm4c4c9cm25c10cm4c7c5c5c12c6c5c6cm6_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c9c10cm7c11c14c49c21cm12c18c12c9c49c12c16c13cm18,
			CxB => R_c5c5cm4c4c9cm25c10cm4c7c5c5c12c6c5c6cm6
		);

    c9c11cm8c10c14cm62c21cm10c17c12c10c41c14c16c13cm18_c5c4cm5c6c11c4c13cm9c8c6c4c17c8c7c8cm12_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c9c11cm8c10c14cm62c21cm10c17c12c10c41c14c16c13cm18_weight(1)(7-1 downto 0),
			B	=> c5c4cm5c6c11c4c13cm9c8c6c4c17c8c7c8cm12_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c9c11cm8c10c14cm62c21cm10c17c12c10c41c14c16c13cm18,
			CxB => R_c5c4cm5c6c11c4c13cm9c8c6c4c17c8c7c8cm12
		);




    c5c3cm3c4c9c7c9cm7c8c4c4c22c4c5c5cm7_MULT: entity work.TruncatedSingleMult
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
			A	=> c5c3cm3c4c9c7c9cm7c8c4c4c22c4c5c5cm7_weight(1),
			B	=> X0_signal(1),
			AxB	=> R_c5c3cm3c4c9c7c9cm7c8c4c4c22c4c5c5cm7
		);

end architecture;
