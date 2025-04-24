library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv6_core4_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        R_cm1cm3c6c4c3c2cm2c6cm8cm1cm15cm14c4c10c0c1 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm29c10cm18cm11c22c29c6c6c26c9cm18cm6c7c23cm1cm8 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c6c13cm1cm1c0cm10cm1c12cm15cm1cm9cm8cm3cm3c0c3 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm4cm23c72c16cm11c7cm1cm8cm27c4c19c9c0c3cm32cm5 : out std_logic_vector(15-1 downto 0);   --	sfix(7, -8)
        R_c45c0cm50c95cm26cm27c31cm18c30c36c31c64c13c10c45cm17 : out std_logic_vector(15-1 downto 0);   --	sfix(7, -8)
        R_cm3c15c5cm23cm7c3c1cm19c0c1cm5c1c1cm3cm11c8 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c2cm8c2c2c3cm10cm1c4c0c0cm7cm15cm2c0c0c5 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm7cm2cm7c23c1cm1c6cm4cm1c3c8cm12c1c1cm1cm2 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm5c1cm7cm28c4c0cm1cm5cm3cm3cm2cm8cm1cm1c0c1 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(9-1 downto 0)  --	sfix(1, -8)
    );
end conv6_core4_rmcm;

architecture arch of conv6_core4_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM3C6C4C3C2CM2C6CM8CM1CM15CM14C4C10C0C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM29C10CM18CM11C22C29C6C6C26C9CM18CM6C7C23CM1CM8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6C13CM1CM1C0CM10CM1C12CM15CM1CM9CM8CM3CM3C0C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4CM23C72C16CM11C7CM1CM8CM27C4C19C9C0C3CM32CM5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C45C0CM50C95CM26CM27C31CM18C30C36C31C64C13C10C45CM17_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3C15C5CM23CM7C3C1CM19C0C1CM5C1C1CM3CM11C8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2CM8C2C2C3CM10CM1C4C0C0CM7CM15CM2C0C0C5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM7CM2CM7C23C1CM1C6CM4CM1C3C8CM12C1C1CM1CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5C1CM7CM28C4C0CM1CM5CM3CM3CM2CM8CM1CM1C0C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(4, -3)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(3, -5)
    signal cm1cm3c6c4c3c2cm2c6cm8cm1cm15cm14c4c10c0c1_weight : PIPELINE_TYPE_FOR_CM1CM3C6C4C3C2CM2C6CM8CM1CM15CM14C4C10C0C1_WEIGHT;
    -- sfix(3, -5)
    signal cm29c10cm18cm11c22c29c6c6c26c9cm18cm6c7c23cm1cm8_weight : PIPELINE_TYPE_FOR_CM29C10CM18CM11C22C29C6C6C26C9CM18CM6C7C23CM1CM8_WEIGHT;
    -- sfix(3, -5)
    signal c6c13cm1cm1c0cm10cm1c12cm15cm1cm9cm8cm3cm3c0c3_weight : PIPELINE_TYPE_FOR_C6C13CM1CM1C0CM10CM1C12CM15CM1CM9CM8CM3CM3C0C3_WEIGHT;
    -- sfix(3, -5)
    signal cm4cm23c72c16cm11c7cm1cm8cm27c4c19c9c0c3cm32cm5_weight : PIPELINE_TYPE_FOR_CM4CM23C72C16CM11C7CM1CM8CM27C4C19C9C0C3CM32CM5_WEIGHT;
    -- sfix(3, -5)
    signal c45c0cm50c95cm26cm27c31cm18c30c36c31c64c13c10c45cm17_weight : PIPELINE_TYPE_FOR_C45C0CM50C95CM26CM27C31CM18C30C36C31C64C13C10C45CM17_WEIGHT;
    -- sfix(3, -5)
    signal cm3c15c5cm23cm7c3c1cm19c0c1cm5c1c1cm3cm11c8_weight : PIPELINE_TYPE_FOR_CM3C15C5CM23CM7C3C1CM19C0C1CM5C1C1CM3CM11C8_WEIGHT;
    -- sfix(3, -5)
    signal c2cm8c2c2c3cm10cm1c4c0c0cm7cm15cm2c0c0c5_weight : PIPELINE_TYPE_FOR_C2CM8C2C2C3CM10CM1C4C0C0CM7CM15CM2C0C0C5_WEIGHT;
    -- sfix(3, -5)
    signal cm7cm2cm7c23c1cm1c6cm4cm1c3c8cm12c1c1cm1cm2_weight : PIPELINE_TYPE_FOR_CM7CM2CM7C23C1CM1C6CM4CM1C3C8CM12C1C1CM1CM2_WEIGHT;
    -- sfix(3, -5)
    signal cm5c1cm7cm28c4c0cm1cm5cm3cm3cm2cm8cm1cm1c0c1_weight : PIPELINE_TYPE_FOR_CM5C1CM7CM28C4C0CM1CM5CM3CM3CM2CM8CM1CM1C0C1_WEIGHT;
    -- sfix(3, -5)
    signal c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT;

    -- The zero output
    signal c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : std_logic_vector(9-1 downto 0); --	sfix(1, -8)

    -- If we use LUT multiplier and the input is unsigned, we have to cut away the msb of the result
    -- If this is the case, the temporary results are stored in the signals below.

    signal R_cm7cm2cm7c23c1cm1c6cm4cm1c3c8cm12c1c1cm1cm2_undelayed : std_logic_vector(13-1 downto 0);


begin
    c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 <= (others => '0');
    R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 <= c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0;
    X0_signal(0) <= X0;



    WEIGHT_ROM: entity work.conv6_core4_rmcm_weightsconstant_memory
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
        
            dout1   => cm1cm3c6c4c3c2cm2c6cm8cm1cm15cm14c4c10c0c1_weight(0), 
            dout2   => cm29c10cm18cm11c22c29c6c6c26c9cm18cm6c7c23cm1cm8_weight(0), 
            dout3   => c6c13cm1cm1c0cm10cm1c12cm15cm1cm9cm8cm3cm3c0c3_weight(0), 
            dout4   => cm4cm23c72c16cm11c7cm1cm8cm27c4c19c9c0c3cm32cm5_weight(0), 
            dout5   => c45c0cm50c95cm26cm27c31cm18c30c36c31c64c13c10c45cm17_weight(0), 
            dout6   => cm3c15c5cm23cm7c3c1cm19c0c1cm5c1c1cm3cm11c8_weight(0), 
            dout7   => c2cm8c2c2c3cm10cm1c4c0c0cm7cm15cm2c0c0c5_weight(0), 
            dout8   => cm7cm2cm7c23c1cm1c6cm4cm1c3c8cm12c1c1cm1cm2_weight(0), 
            dout9   => cm5c1cm7cm28c4c0cm1cm5cm3cm3cm2cm8cm1cm1c0c1_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_cm1cm3c6c4c3c2cm2c6cm8cm1cm15cm14c4c10c0c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm3c6c4c3c2cm2c6cm8cm1cm15cm14c4c10c0c1_weight(0), cm1cm3c6c4c3c2cm2c6cm8cm1cm15cm14c4c10c0c1_weight(1));
    PL_STEP_0_for_cm29c10cm18cm11c22c29c6c6c26c9cm18cm6c7c23cm1cm8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm29c10cm18cm11c22c29c6c6c26c9cm18cm6c7c23cm1cm8_weight(0), cm29c10cm18cm11c22c29c6c6c26c9cm18cm6c7c23cm1cm8_weight(1));
    PL_STEP_0_for_c6c13cm1cm1c0cm10cm1c12cm15cm1cm9cm8cm3cm3c0c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6c13cm1cm1c0cm10cm1c12cm15cm1cm9cm8cm3cm3c0c3_weight(0), c6c13cm1cm1c0cm10cm1c12cm15cm1cm9cm8cm3cm3c0c3_weight(1));
    PL_STEP_0_for_cm4cm23c72c16cm11c7cm1cm8cm27c4c19c9c0c3cm32cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4cm23c72c16cm11c7cm1cm8cm27c4c19c9c0c3cm32cm5_weight(0), cm4cm23c72c16cm11c7cm1cm8cm27c4c19c9c0c3cm32cm5_weight(1));
    PL_STEP_0_for_c45c0cm50c95cm26cm27c31cm18c30c36c31c64c13c10c45cm17_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c45c0cm50c95cm26cm27c31cm18c30c36c31c64c13c10c45cm17_weight(0), c45c0cm50c95cm26cm27c31cm18c30c36c31c64c13c10c45cm17_weight(1));
    PL_STEP_0_for_cm3c15c5cm23cm7c3c1cm19c0c1cm5c1c1cm3cm11c8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3c15c5cm23cm7c3c1cm19c0c1cm5c1c1cm3cm11c8_weight(0), cm3c15c5cm23cm7c3c1cm19c0c1cm5c1c1cm3cm11c8_weight(1));
    PL_STEP_0_for_c2cm8c2c2c3cm10cm1c4c0c0cm7cm15cm2c0c0c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2cm8c2c2c3cm10cm1c4c0c0cm7cm15cm2c0c0c5_weight(0), c2cm8c2c2c3cm10cm1c4c0c0cm7cm15cm2c0c0c5_weight(1));
    PL_STEP_0_for_cm7cm2cm7c23c1cm1c6cm4cm1c3c8cm12c1c1cm1cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm7cm2cm7c23c1cm1c6cm4cm1c3c8cm12c1c1cm1cm2_weight(0), cm7cm2cm7c23c1cm1c6cm4cm1c3c8cm12c1c1cm1cm2_weight(1));
    PL_STEP_0_for_cm5c1cm7cm28c4c0cm1cm5cm3cm3cm2cm8cm1cm1c0c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5c1cm7cm28c4c0cm1cm5cm3cm3cm2cm8cm1cm1c0c1_weight(0), cm5c1cm7cm28c4c0cm1cm5cm3cm3cm2cm8cm1cm1c0c1_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    cm4cm23c72c16cm11c7cm1cm8cm27c4c19c9c0c3cm32cm5_c2cm8c2c2c3cm10cm1c4c0c0cm7cm15cm2c0c0c5_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm4cm23c72c16cm11c7cm1cm8cm27c4c19c9c0c3cm32cm5_weight(1)(8-1 downto 0),
			B	=> c2cm8c2c2c3cm10cm1c4c0c0cm7cm15cm2c0c0c5_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm4cm23c72c16cm11c7cm1cm8cm27c4c19c9c0c3cm32cm5,
			CxB => R_c2cm8c2c2c3cm10cm1c4c0c0cm7cm15cm2c0c0c5
		);

    c45c0cm50c95cm26cm27c31cm18c30c36c31c64c13c10c45cm17_c6c13cm1cm1c0cm10cm1c12cm15cm1cm9cm8cm3cm3c0c3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c45c0cm50c95cm26cm27c31cm18c30c36c31c64c13c10c45cm17_weight(1)(8-1 downto 0),
			B	=> c6c13cm1cm1c0cm10cm1c12cm15cm1cm9cm8cm3cm3c0c3_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c45c0cm50c95cm26cm27c31cm18c30c36c31c64c13c10c45cm17,
			CxB => R_c6c13cm1cm1c0cm10cm1c12cm15cm1cm9cm8cm3cm3c0c3
		);

    cm29c10cm18cm11c22c29c6c6c26c9cm18cm6c7c23cm1cm8_cm1cm3c6c4c3c2cm2c6cm8cm1cm15cm14c4c10c0c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm29c10cm18cm11c22c29c6c6c26c9cm18cm6c7c23cm1cm8_weight(1)(6-1 downto 0),
			B	=> cm1cm3c6c4c3c2cm2c6cm8cm1cm15cm14c4c10c0c1_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm29c10cm18cm11c22c29c6c6c26c9cm18cm6c7c23cm1cm8,
			CxB => R_cm1cm3c6c4c3c2cm2c6cm8cm1cm15cm14c4c10c0c1
		);

    cm3c15c5cm23cm7c3c1cm19c0c1cm5c1c1cm3cm11c8_cm5c1cm7cm28c4c0cm1cm5cm3cm3cm2cm8cm1cm1c0c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm3c15c5cm23cm7c3c1cm19c0c1cm5c1c1cm3cm11c8_weight(1)(6-1 downto 0),
			B	=> cm5c1cm7cm28c4c0cm1cm5cm3cm3cm2cm8cm1cm1c0c1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm3c15c5cm23cm7c3c1cm19c0c1cm5c1c1cm3cm11c8,
			CxB => R_cm5c1cm7cm28c4c0cm1cm5cm3cm3cm2cm8cm1cm1c0c1
		);




    cm7cm2cm7c23c1cm1c6cm4cm1c3c8cm12c1c1cm1cm2_MULT: entity work.TruncatedSingleMult
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
			A	=> cm7cm2cm7c23c1cm1c6cm4cm1c3c8cm12c1c1cm1cm2_weight(1),
			B	=> X0_signal(1),
			AxB	=> R_cm7cm2cm7c23c1cm1c6cm4cm1c3c8cm12c1c1cm1cm2
		);

end architecture;
