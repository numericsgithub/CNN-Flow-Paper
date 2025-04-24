library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv8_core3_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        R_cm6c10c9c5c13cm10cm6c9cm14c9c12c7cm8cm13c11c6 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm9c11c12c10c16cm14cm9c13cm25c12c22c13cm11cm15c15c9 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm6c4c5c5c7cm6cm4c7cm5c5c14c7cm5cm6c8c4 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm8c10c11c9c18cm15cm5c13cm22c12cm15c11cm10cm15c16c10 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm11c15c16c14c22cm18cm11c17cm38c18c3c18cm15cm21c20c14 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm7c8c7c7c9cm9cm7c8cm5c8c10c10cm7cm11c9c5 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm5c2c3c6c8cm8cm2c8cm3c5cm18c5cm3cm6c9c4 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm7c7c6c7c9cm11cm4c8cm4c7cm21c8cm6cm9c12c5 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm4c5c3c4c4cm4cm3c3cm1c5cm12c3cm4cm6c5c2 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(9-1 downto 0)  --	sfix(1, -8)
    );
end conv8_core3_rmcm;

architecture arch of conv8_core3_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6C10C9C5C13CM10CM6C9CM14C9C12C7CM8CM13C11C6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM9C11C12C10C16CM14CM9C13CM25C12C22C13CM11CM15C15C9_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6C4C5C5C7CM6CM4C7CM5C5C14C7CM5CM6C8C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM8C10C11C9C18CM15CM5C13CM22C12CM15C11CM10CM15C16C10_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM11C15C16C14C22CM18CM11C17CM38C18C3C18CM15CM21C20C14_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM7C8C7C7C9CM9CM7C8CM5C8C10C10CM7CM11C9C5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5C2C3C6C8CM8CM2C8CM3C5CM18C5CM3CM6C9C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM7C7C6C7C9CM11CM4C8CM4C7CM21C8CM6CM9C12C5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4C5C3C4C4CM4CM3C3CM1C5CM12C3CM4CM6C5C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(4, -3)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(3, -5)
    signal cm6c10c9c5c13cm10cm6c9cm14c9c12c7cm8cm13c11c6_weight : PIPELINE_TYPE_FOR_CM6C10C9C5C13CM10CM6C9CM14C9C12C7CM8CM13C11C6_WEIGHT;
    -- sfix(3, -5)
    signal cm9c11c12c10c16cm14cm9c13cm25c12c22c13cm11cm15c15c9_weight : PIPELINE_TYPE_FOR_CM9C11C12C10C16CM14CM9C13CM25C12C22C13CM11CM15C15C9_WEIGHT;
    -- sfix(3, -5)
    signal cm6c4c5c5c7cm6cm4c7cm5c5c14c7cm5cm6c8c4_weight : PIPELINE_TYPE_FOR_CM6C4C5C5C7CM6CM4C7CM5C5C14C7CM5CM6C8C4_WEIGHT;
    -- sfix(3, -5)
    signal cm8c10c11c9c18cm15cm5c13cm22c12cm15c11cm10cm15c16c10_weight : PIPELINE_TYPE_FOR_CM8C10C11C9C18CM15CM5C13CM22C12CM15C11CM10CM15C16C10_WEIGHT;
    -- sfix(3, -5)
    signal cm11c15c16c14c22cm18cm11c17cm38c18c3c18cm15cm21c20c14_weight : PIPELINE_TYPE_FOR_CM11C15C16C14C22CM18CM11C17CM38C18C3C18CM15CM21C20C14_WEIGHT;
    -- sfix(3, -5)
    signal cm7c8c7c7c9cm9cm7c8cm5c8c10c10cm7cm11c9c5_weight : PIPELINE_TYPE_FOR_CM7C8C7C7C9CM9CM7C8CM5C8C10C10CM7CM11C9C5_WEIGHT;
    -- sfix(3, -5)
    signal cm5c2c3c6c8cm8cm2c8cm3c5cm18c5cm3cm6c9c4_weight : PIPELINE_TYPE_FOR_CM5C2C3C6C8CM8CM2C8CM3C5CM18C5CM3CM6C9C4_WEIGHT;
    -- sfix(3, -5)
    signal cm7c7c6c7c9cm11cm4c8cm4c7cm21c8cm6cm9c12c5_weight : PIPELINE_TYPE_FOR_CM7C7C6C7C9CM11CM4C8CM4C7CM21C8CM6CM9C12C5_WEIGHT;
    -- sfix(3, -5)
    signal cm4c5c3c4c4cm4cm3c3cm1c5cm12c3cm4cm6c5c2_weight : PIPELINE_TYPE_FOR_CM4C5C3C4C4CM4CM3C3CM1C5CM12C3CM4CM6C5C2_WEIGHT;
    -- sfix(3, -5)
    signal c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT;

    -- The zero output
    signal c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : std_logic_vector(9-1 downto 0); --	sfix(1, -8)

    -- If we use LUT multiplier and the input is unsigned, we have to cut away the msb of the result
    -- If this is the case, the temporary results are stored in the signals below.

    signal R_cm7c7c6c7c9cm11cm4c8cm4c7cm21c8cm6cm9c12c5_undelayed : std_logic_vector(13-1 downto 0);


begin
    c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 <= (others => '0');
    R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 <= c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0;
    X0_signal(0) <= X0;



    WEIGHT_ROM: entity work.conv8_core3_rmcm_weightsconstant_memory
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
        
            dout1   => cm6c10c9c5c13cm10cm6c9cm14c9c12c7cm8cm13c11c6_weight(0), 
            dout2   => cm9c11c12c10c16cm14cm9c13cm25c12c22c13cm11cm15c15c9_weight(0), 
            dout3   => cm6c4c5c5c7cm6cm4c7cm5c5c14c7cm5cm6c8c4_weight(0), 
            dout4   => cm8c10c11c9c18cm15cm5c13cm22c12cm15c11cm10cm15c16c10_weight(0), 
            dout5   => cm11c15c16c14c22cm18cm11c17cm38c18c3c18cm15cm21c20c14_weight(0), 
            dout6   => cm7c8c7c7c9cm9cm7c8cm5c8c10c10cm7cm11c9c5_weight(0), 
            dout7   => cm5c2c3c6c8cm8cm2c8cm3c5cm18c5cm3cm6c9c4_weight(0), 
            dout8   => cm7c7c6c7c9cm11cm4c8cm4c7cm21c8cm6cm9c12c5_weight(0), 
            dout9   => cm4c5c3c4c4cm4cm3c3cm1c5cm12c3cm4cm6c5c2_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_cm6c10c9c5c13cm10cm6c9cm14c9c12c7cm8cm13c11c6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6c10c9c5c13cm10cm6c9cm14c9c12c7cm8cm13c11c6_weight(0), cm6c10c9c5c13cm10cm6c9cm14c9c12c7cm8cm13c11c6_weight(1));
    PL_STEP_0_for_cm9c11c12c10c16cm14cm9c13cm25c12c22c13cm11cm15c15c9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm9c11c12c10c16cm14cm9c13cm25c12c22c13cm11cm15c15c9_weight(0), cm9c11c12c10c16cm14cm9c13cm25c12c22c13cm11cm15c15c9_weight(1));
    PL_STEP_0_for_cm6c4c5c5c7cm6cm4c7cm5c5c14c7cm5cm6c8c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6c4c5c5c7cm6cm4c7cm5c5c14c7cm5cm6c8c4_weight(0), cm6c4c5c5c7cm6cm4c7cm5c5c14c7cm5cm6c8c4_weight(1));
    PL_STEP_0_for_cm8c10c11c9c18cm15cm5c13cm22c12cm15c11cm10cm15c16c10_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm8c10c11c9c18cm15cm5c13cm22c12cm15c11cm10cm15c16c10_weight(0), cm8c10c11c9c18cm15cm5c13cm22c12cm15c11cm10cm15c16c10_weight(1));
    PL_STEP_0_for_cm11c15c16c14c22cm18cm11c17cm38c18c3c18cm15cm21c20c14_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm11c15c16c14c22cm18cm11c17cm38c18c3c18cm15cm21c20c14_weight(0), cm11c15c16c14c22cm18cm11c17cm38c18c3c18cm15cm21c20c14_weight(1));
    PL_STEP_0_for_cm7c8c7c7c9cm9cm7c8cm5c8c10c10cm7cm11c9c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm7c8c7c7c9cm9cm7c8cm5c8c10c10cm7cm11c9c5_weight(0), cm7c8c7c7c9cm9cm7c8cm5c8c10c10cm7cm11c9c5_weight(1));
    PL_STEP_0_for_cm5c2c3c6c8cm8cm2c8cm3c5cm18c5cm3cm6c9c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5c2c3c6c8cm8cm2c8cm3c5cm18c5cm3cm6c9c4_weight(0), cm5c2c3c6c8cm8cm2c8cm3c5cm18c5cm3cm6c9c4_weight(1));
    PL_STEP_0_for_cm7c7c6c7c9cm11cm4c8cm4c7cm21c8cm6cm9c12c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm7c7c6c7c9cm11cm4c8cm4c7cm21c8cm6cm9c12c5_weight(0), cm7c7c6c7c9cm11cm4c8cm4c7cm21c8cm6cm9c12c5_weight(1));
    PL_STEP_0_for_cm4c5c3c4c4cm4cm3c3cm1c5cm12c3cm4cm6c5c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4c5c3c4c4cm4cm3c3cm1c5cm12c3cm4cm6c5c2_weight(0), cm4c5c3c4c4cm4cm3c3cm1c5cm12c3cm4cm6c5c2_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    cm11c15c16c14c22cm18cm11c17cm38c18c3c18cm15cm21c20c14_cm4c5c3c4c4cm4cm3c3cm1c5cm12c3cm4cm6c5c2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm11c15c16c14c22cm18cm11c17cm38c18c3c18cm15cm21c20c14_weight(1)(7-1 downto 0),
			B	=> cm4c5c3c4c4cm4cm3c3cm1c5cm12c3cm4cm6c5c2_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm11c15c16c14c22cm18cm11c17cm38c18c3c18cm15cm21c20c14,
			CxB => R_cm4c5c3c4c4cm4cm3c3cm1c5cm12c3cm4cm6c5c2
		);

    cm9c11c12c10c16cm14cm9c13cm25c12c22c13cm11cm15c15c9_cm7c8c7c7c9cm9cm7c8cm5c8c10c10cm7cm11c9c5_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm9c11c12c10c16cm14cm9c13cm25c12c22c13cm11cm15c15c9_weight(1)(6-1 downto 0),
			B	=> cm7c8c7c7c9cm9cm7c8cm5c8c10c10cm7cm11c9c5_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm9c11c12c10c16cm14cm9c13cm25c12c22c13cm11cm15c15c9,
			CxB => R_cm7c8c7c7c9cm9cm7c8cm5c8c10c10cm7cm11c9c5
		);

    cm8c10c11c9c18cm15cm5c13cm22c12cm15c11cm10cm15c16c10_cm6c4c5c5c7cm6cm4c7cm5c5c14c7cm5cm6c8c4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm8c10c11c9c18cm15cm5c13cm22c12cm15c11cm10cm15c16c10_weight(1)(6-1 downto 0),
			B	=> cm6c4c5c5c7cm6cm4c7cm5c5c14c7cm5cm6c8c4_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm8c10c11c9c18cm15cm5c13cm22c12cm15c11cm10cm15c16c10,
			CxB => R_cm6c4c5c5c7cm6cm4c7cm5c5c14c7cm5cm6c8c4
		);

    cm5c2c3c6c8cm8cm2c8cm3c5cm18c5cm3cm6c9c4_cm6c10c9c5c13cm10cm6c9cm14c9c12c7cm8cm13c11c6_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm5c2c3c6c8cm8cm2c8cm3c5cm18c5cm3cm6c9c4_weight(1)(6-1 downto 0),
			B	=> cm6c10c9c5c13cm10cm6c9cm14c9c12c7cm8cm13c11c6_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm5c2c3c6c8cm8cm2c8cm3c5cm18c5cm3cm6c9c4,
			CxB => R_cm6c10c9c5c13cm10cm6c9cm14c9c12c7cm8cm13c11c6
		);




    cm7c7c6c7c9cm11cm4c8cm4c7cm21c8cm6cm9c12c5_MULT: entity work.TruncatedSingleMult
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
			A	=> cm7c7c6c7c9cm11cm4c8cm4c7cm21c8cm6cm9c12c5_weight(1),
			B	=> X0_signal(1),
			AxB	=> R_cm7c7c6c7c9cm11cm4c8cm4c7cm21c8cm6cm9c12c5
		);

end architecture;
