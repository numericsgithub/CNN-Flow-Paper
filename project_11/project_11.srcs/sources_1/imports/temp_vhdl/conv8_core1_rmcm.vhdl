library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv8_core1_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        R_c11cm9cm10cm8cm11c6c10c5cm11c4cm10c17cm40cm8cm6cm10 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c14cm14cm23cm11c25c7c11c10cm15c7cm7c20cm51cm9cm9cm12 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c8cm6cm18cm4cm18c3c3c5cm9c4cm1c10cm18cm3cm4cm4 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c13cm13cm25cm10cm13c6c12c11cm13c7cm21c20c15cm10cm10cm14 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c14cm17cm29cm16c39c9c15c19cm19c10cm13c28c10cm12cm15cm19 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c7cm7cm14cm8cm32c6c6c9cm12c5cm1c15cm5cm5cm7cm9 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c6cm8cm16cm3cm4c2c4c6cm5c3cm19c8c26cm4cm6cm6 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c6cm10cm13cm7c18c5c7c10cm9c5cm10c15c27cm5cm8cm10 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c3cm5cm3cm4cm20c3c4c5cm5c3c0c7c11cm3cm3cm7 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(9-1 downto 0)  --	sfix(1, -8)
    );
end conv8_core1_rmcm;

architecture arch of conv8_core1_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_C11CM9CM10CM8CM11C6C10C5CM11C4CM10C17CM40CM8CM6CM10_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C14CM14CM23CM11C25C7C11C10CM15C7CM7C20CM51CM9CM9CM12_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C8CM6CM18CM4CM18C3C3C5CM9C4CM1C10CM18CM3CM4CM4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C13CM13CM25CM10CM13C6C12C11CM13C7CM21C20C15CM10CM10CM14_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C14CM17CM29CM16C39C9C15C19CM19C10CM13C28C10CM12CM15CM19_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C7CM7CM14CM8CM32C6C6C9CM12C5CM1C15CM5CM5CM7CM9_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6CM8CM16CM3CM4C2C4C6CM5C3CM19C8C26CM4CM6CM6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6CM10CM13CM7C18C5C7C10CM9C5CM10C15C27CM5CM8CM10_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3CM5CM3CM4CM20C3C4C5CM5C3C0C7C11CM3CM3CM7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(4, -3)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(3, -5)
    signal c11cm9cm10cm8cm11c6c10c5cm11c4cm10c17cm40cm8cm6cm10_weight : PIPELINE_TYPE_FOR_C11CM9CM10CM8CM11C6C10C5CM11C4CM10C17CM40CM8CM6CM10_WEIGHT;
    -- sfix(3, -5)
    signal c14cm14cm23cm11c25c7c11c10cm15c7cm7c20cm51cm9cm9cm12_weight : PIPELINE_TYPE_FOR_C14CM14CM23CM11C25C7C11C10CM15C7CM7C20CM51CM9CM9CM12_WEIGHT;
    -- sfix(3, -5)
    signal c8cm6cm18cm4cm18c3c3c5cm9c4cm1c10cm18cm3cm4cm4_weight : PIPELINE_TYPE_FOR_C8CM6CM18CM4CM18C3C3C5CM9C4CM1C10CM18CM3CM4CM4_WEIGHT;
    -- sfix(3, -5)
    signal c13cm13cm25cm10cm13c6c12c11cm13c7cm21c20c15cm10cm10cm14_weight : PIPELINE_TYPE_FOR_C13CM13CM25CM10CM13C6C12C11CM13C7CM21C20C15CM10CM10CM14_WEIGHT;
    -- sfix(3, -5)
    signal c14cm17cm29cm16c39c9c15c19cm19c10cm13c28c10cm12cm15cm19_weight : PIPELINE_TYPE_FOR_C14CM17CM29CM16C39C9C15C19CM19C10CM13C28C10CM12CM15CM19_WEIGHT;
    -- sfix(3, -5)
    signal c7cm7cm14cm8cm32c6c6c9cm12c5cm1c15cm5cm5cm7cm9_weight : PIPELINE_TYPE_FOR_C7CM7CM14CM8CM32C6C6C9CM12C5CM1C15CM5CM5CM7CM9_WEIGHT;
    -- sfix(3, -5)
    signal c6cm8cm16cm3cm4c2c4c6cm5c3cm19c8c26cm4cm6cm6_weight : PIPELINE_TYPE_FOR_C6CM8CM16CM3CM4C2C4C6CM5C3CM19C8C26CM4CM6CM6_WEIGHT;
    -- sfix(3, -5)
    signal c6cm10cm13cm7c18c5c7c10cm9c5cm10c15c27cm5cm8cm10_weight : PIPELINE_TYPE_FOR_C6CM10CM13CM7C18C5C7C10CM9C5CM10C15C27CM5CM8CM10_WEIGHT;
    -- sfix(3, -5)
    signal c3cm5cm3cm4cm20c3c4c5cm5c3c0c7c11cm3cm3cm7_weight : PIPELINE_TYPE_FOR_C3CM5CM3CM4CM20C3C4C5CM5C3C0C7C11CM3CM3CM7_WEIGHT;
    -- sfix(3, -5)
    signal c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT;

    -- The zero output
    signal c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : std_logic_vector(9-1 downto 0); --	sfix(1, -8)

    -- If we use LUT multiplier and the input is unsigned, we have to cut away the msb of the result
    -- If this is the case, the temporary results are stored in the signals below.

    signal R_c13cm13cm25cm10cm13c6c12c11cm13c7cm21c20c15cm10cm10cm14_undelayed : std_logic_vector(13-1 downto 0);


begin
    c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 <= (others => '0');
    R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 <= c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0;
    X0_signal(0) <= X0;



    WEIGHT_ROM: entity work.conv8_core1_rmcm_weightsconstant_memory
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
        
            dout1   => c11cm9cm10cm8cm11c6c10c5cm11c4cm10c17cm40cm8cm6cm10_weight(0), 
            dout2   => c14cm14cm23cm11c25c7c11c10cm15c7cm7c20cm51cm9cm9cm12_weight(0), 
            dout3   => c8cm6cm18cm4cm18c3c3c5cm9c4cm1c10cm18cm3cm4cm4_weight(0), 
            dout4   => c13cm13cm25cm10cm13c6c12c11cm13c7cm21c20c15cm10cm10cm14_weight(0), 
            dout5   => c14cm17cm29cm16c39c9c15c19cm19c10cm13c28c10cm12cm15cm19_weight(0), 
            dout6   => c7cm7cm14cm8cm32c6c6c9cm12c5cm1c15cm5cm5cm7cm9_weight(0), 
            dout7   => c6cm8cm16cm3cm4c2c4c6cm5c3cm19c8c26cm4cm6cm6_weight(0), 
            dout8   => c6cm10cm13cm7c18c5c7c10cm9c5cm10c15c27cm5cm8cm10_weight(0), 
            dout9   => c3cm5cm3cm4cm20c3c4c5cm5c3c0c7c11cm3cm3cm7_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_c11cm9cm10cm8cm11c6c10c5cm11c4cm10c17cm40cm8cm6cm10_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c11cm9cm10cm8cm11c6c10c5cm11c4cm10c17cm40cm8cm6cm10_weight(0), c11cm9cm10cm8cm11c6c10c5cm11c4cm10c17cm40cm8cm6cm10_weight(1));
    PL_STEP_0_for_c14cm14cm23cm11c25c7c11c10cm15c7cm7c20cm51cm9cm9cm12_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c14cm14cm23cm11c25c7c11c10cm15c7cm7c20cm51cm9cm9cm12_weight(0), c14cm14cm23cm11c25c7c11c10cm15c7cm7c20cm51cm9cm9cm12_weight(1));
    PL_STEP_0_for_c8cm6cm18cm4cm18c3c3c5cm9c4cm1c10cm18cm3cm4cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c8cm6cm18cm4cm18c3c3c5cm9c4cm1c10cm18cm3cm4cm4_weight(0), c8cm6cm18cm4cm18c3c3c5cm9c4cm1c10cm18cm3cm4cm4_weight(1));
    PL_STEP_0_for_c13cm13cm25cm10cm13c6c12c11cm13c7cm21c20c15cm10cm10cm14_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c13cm13cm25cm10cm13c6c12c11cm13c7cm21c20c15cm10cm10cm14_weight(0), c13cm13cm25cm10cm13c6c12c11cm13c7cm21c20c15cm10cm10cm14_weight(1));
    PL_STEP_0_for_c14cm17cm29cm16c39c9c15c19cm19c10cm13c28c10cm12cm15cm19_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c14cm17cm29cm16c39c9c15c19cm19c10cm13c28c10cm12cm15cm19_weight(0), c14cm17cm29cm16c39c9c15c19cm19c10cm13c28c10cm12cm15cm19_weight(1));
    PL_STEP_0_for_c7cm7cm14cm8cm32c6c6c9cm12c5cm1c15cm5cm5cm7cm9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c7cm7cm14cm8cm32c6c6c9cm12c5cm1c15cm5cm5cm7cm9_weight(0), c7cm7cm14cm8cm32c6c6c9cm12c5cm1c15cm5cm5cm7cm9_weight(1));
    PL_STEP_0_for_c6cm8cm16cm3cm4c2c4c6cm5c3cm19c8c26cm4cm6cm6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6cm8cm16cm3cm4c2c4c6cm5c3cm19c8c26cm4cm6cm6_weight(0), c6cm8cm16cm3cm4c2c4c6cm5c3cm19c8c26cm4cm6cm6_weight(1));
    PL_STEP_0_for_c6cm10cm13cm7c18c5c7c10cm9c5cm10c15c27cm5cm8cm10_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6cm10cm13cm7c18c5c7c10cm9c5cm10c15c27cm5cm8cm10_weight(0), c6cm10cm13cm7c18c5c7c10cm9c5cm10c15c27cm5cm8cm10_weight(1));
    PL_STEP_0_for_c3cm5cm3cm4cm20c3c4c5cm5c3c0c7c11cm3cm3cm7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3cm5cm3cm4cm20c3c4c5cm5c3c0c7c11cm3cm3cm7_weight(0), c3cm5cm3cm4cm20c3c4c5cm5c3c0c7c11cm3cm3cm7_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    c11cm9cm10cm8cm11c6c10c5cm11c4cm10c17cm40cm8cm6cm10_c3cm5cm3cm4cm20c3c4c5cm5c3c0c7c11cm3cm3cm7_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c11cm9cm10cm8cm11c6c10c5cm11c4cm10c17cm40cm8cm6cm10_weight(1)(7-1 downto 0),
			B	=> c3cm5cm3cm4cm20c3c4c5cm5c3c0c7c11cm3cm3cm7_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c11cm9cm10cm8cm11c6c10c5cm11c4cm10c17cm40cm8cm6cm10,
			CxB => R_c3cm5cm3cm4cm20c3c4c5cm5c3c0c7c11cm3cm3cm7
		);

    c14cm14cm23cm11c25c7c11c10cm15c7cm7c20cm51cm9cm9cm12_c6cm10cm13cm7c18c5c7c10cm9c5cm10c15c27cm5cm8cm10_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c14cm14cm23cm11c25c7c11c10cm15c7cm7c20cm51cm9cm9cm12_weight(1)(7-1 downto 0),
			B	=> c6cm10cm13cm7c18c5c7c10cm9c5cm10c15c27cm5cm8cm10_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c14cm14cm23cm11c25c7c11c10cm15c7cm7c20cm51cm9cm9cm12,
			CxB => R_c6cm10cm13cm7c18c5c7c10cm9c5cm10c15c27cm5cm8cm10
		);

    c14cm17cm29cm16c39c9c15c19cm19c10cm13c28c10cm12cm15cm19_c6cm8cm16cm3cm4c2c4c6cm5c3cm19c8c26cm4cm6cm6_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c14cm17cm29cm16c39c9c15c19cm19c10cm13c28c10cm12cm15cm19_weight(1)(7-1 downto 0),
			B	=> c6cm8cm16cm3cm4c2c4c6cm5c3cm19c8c26cm4cm6cm6_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c14cm17cm29cm16c39c9c15c19cm19c10cm13c28c10cm12cm15cm19,
			CxB => R_c6cm8cm16cm3cm4c2c4c6cm5c3cm19c8c26cm4cm6cm6
		);

    c8cm6cm18cm4cm18c3c3c5cm9c4cm1c10cm18cm3cm4cm4_c7cm7cm14cm8cm32c6c6c9cm12c5cm1c15cm5cm5cm7cm9_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c8cm6cm18cm4cm18c3c3c5cm9c4cm1c10cm18cm3cm4cm4_weight(1)(6-1 downto 0),
			B	=> c7cm7cm14cm8cm32c6c6c9cm12c5cm1c15cm5cm5cm7cm9_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c8cm6cm18cm4cm18c3c3c5cm9c4cm1c10cm18cm3cm4cm4,
			CxB => R_c7cm7cm14cm8cm32c6c6c9cm12c5cm1c15cm5cm5cm7cm9
		);




    c13cm13cm25cm10cm13c6c12c11cm13c7cm21c20c15cm10cm10cm14_MULT: entity work.TruncatedSingleMult
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
			A	=> c13cm13cm25cm10cm13c6c12c11cm13c7cm21c20c15cm10cm10cm14_weight(1),
			B	=> X0_signal(1),
			AxB	=> R_c13cm13cm25cm10cm13c6c12c11cm13c7cm21c20c15cm10cm10cm14
		);

end architecture;
