library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv3_core12_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(4-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        R_cm2cm5cm3cm82 : out std_logic_vector(15-1 downto 0);   --	sfix(8, -7)
        R_cm2cm1c115c18 : out std_logic_vector(15-1 downto 0);   --	sfix(8, -7)
        R_cm35cm14c0c15 : out std_logic_vector(14-1 downto 0);   --	sfix(7, -7)
        R_cm2cm11c16c4 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_cm9cm3cm7c60 : out std_logic_vector(14-1 downto 0);   --	sfix(7, -7)
        R_c3cm1c0c0 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_c7c0c0c0 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_cm2c2c6c0 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_c0c0cm40c4 : out std_logic_vector(14-1 downto 0);   --	sfix(7, -7)
        R_c2c0c0c0 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_c5cm111c0c1 : out std_logic_vector(15-1 downto 0);   --	sfix(8, -7)
        R_c3c0c0c58 : out std_logic_vector(14-1 downto 0);   --	sfix(7, -7)
        R_c19c5c0c0 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_c3c29cm32cm6 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_cm1c15c1c86 : out std_logic_vector(15-1 downto 0);   --	sfix(8, -7)
        R_cm8cm2c0cm1 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_c0c0c0c0 : out std_logic_vector(8-1 downto 0)  --	sfix(1, -7)
    );
end conv3_core12_rmcm;

architecture arch of conv3_core12_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM5CM3CM82_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM1C115C18_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM35CM14C0C15_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM11C16C4_WEIGHT  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM9CM3CM7C60_WEIGHT  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3CM1C0C0_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C7C0C0C0_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C2C6C0_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0CM40C4_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C0C0C0_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5CM111C0C1_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C0C0C58_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C19C5C0C0_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C29CM32CM6_WEIGHT  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C15C1C86_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM8CM2C0CM1_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(5, -2)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(3, -5)
    signal cm2cm5cm3cm82_weight : PIPELINE_TYPE_FOR_CM2CM5CM3CM82_WEIGHT;
    -- sfix(3, -5)
    signal cm2cm1c115c18_weight : PIPELINE_TYPE_FOR_CM2CM1C115C18_WEIGHT;
    -- sfix(3, -5)
    signal cm35cm14c0c15_weight : PIPELINE_TYPE_FOR_CM35CM14C0C15_WEIGHT;
    -- sfix(3, -5)
    signal cm2cm11c16c4_weight  : PIPELINE_TYPE_FOR_CM2CM11C16C4_WEIGHT;
    -- sfix(3, -5)
    signal cm9cm3cm7c60_weight  : PIPELINE_TYPE_FOR_CM9CM3CM7C60_WEIGHT;
    -- sfix(3, -5)
    signal c3cm1c0c0_weight     : PIPELINE_TYPE_FOR_C3CM1C0C0_WEIGHT;
    -- sfix(3, -5)
    signal c7c0c0c0_weight      : PIPELINE_TYPE_FOR_C7C0C0C0_WEIGHT;
    -- sfix(3, -5)
    signal cm2c2c6c0_weight     : PIPELINE_TYPE_FOR_CM2C2C6C0_WEIGHT;
    -- sfix(3, -5)
    signal c0c0cm40c4_weight    : PIPELINE_TYPE_FOR_C0C0CM40C4_WEIGHT;
    -- sfix(3, -5)
    signal c2c0c0c0_weight      : PIPELINE_TYPE_FOR_C2C0C0C0_WEIGHT;
    -- sfix(3, -5)
    signal c5cm111c0c1_weight   : PIPELINE_TYPE_FOR_C5CM111C0C1_WEIGHT;
    -- sfix(3, -5)
    signal c3c0c0c58_weight     : PIPELINE_TYPE_FOR_C3C0C0C58_WEIGHT;
    -- sfix(3, -5)
    signal c19c5c0c0_weight     : PIPELINE_TYPE_FOR_C19C5C0C0_WEIGHT;
    -- sfix(3, -5)
    signal c3c29cm32cm6_weight  : PIPELINE_TYPE_FOR_C3C29CM32CM6_WEIGHT;
    -- sfix(3, -5)
    signal cm1c15c1c86_weight   : PIPELINE_TYPE_FOR_CM1C15C1C86_WEIGHT;
    -- sfix(3, -5)
    signal cm8cm2c0cm1_weight   : PIPELINE_TYPE_FOR_CM8CM2C0CM1_WEIGHT;
    -- sfix(3, -5)
    signal c0c0c0c0_weight      : PIPELINE_TYPE_FOR_C0C0C0C0_WEIGHT;

    -- The zero output
    signal c0c0c0c0 : std_logic_vector(8-1 downto 0); --	sfix(1, -7)

    -- If we use LUT multiplier and the input is unsigned, we have to cut away the msb of the result
    -- If this is the case, the temporary results are stored in the signals below.


begin
    c0c0c0c0 <= (others => '0');
    R_c0c0c0c0 <= c0c0c0c0;
    X0_signal(0) <= X0;



    WEIGHT_ROM: entity work.conv3_core12_rmcm_weightsconstant_memory
        generic map
        (
            XI_WIDTH        	          => 8, 
            ARRAY_SIZE                    => 4,
            WORDS_PER_ADDR                => 16
        )
        port map
        (
            clk => clk,
            data_index => unsigned(SEL),
        
            dout1   => cm2cm5cm3cm82_weight(0), 
            dout2   => cm2cm1c115c18_weight(0), 
            dout3   => cm35cm14c0c15_weight(0), 
            dout4   => cm2cm11c16c4_weight(0), 
            dout5   => cm9cm3cm7c60_weight(0), 
            dout6   => c3cm1c0c0_weight(0), 
            dout7   => c7c0c0c0_weight(0), 
            dout8   => cm2c2c6c0_weight(0), 
            dout9   => c0c0cm40c4_weight(0), 
            dout10   => c2c0c0c0_weight(0), 
            dout11   => c5cm111c0c1_weight(0), 
            dout12   => c3c0c0c58_weight(0), 
            dout13   => c19c5c0c0_weight(0), 
            dout14   => c3c29cm32cm6_weight(0), 
            dout15   => cm1c15c1c86_weight(0), 
            dout16   => cm8cm2c0cm1_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_cm2cm5cm3cm82_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm5cm3cm82_weight(0), cm2cm5cm3cm82_weight(1));
    PL_STEP_0_for_cm2cm1c115c18_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm1c115c18_weight(0), cm2cm1c115c18_weight(1));
    PL_STEP_0_for_cm35cm14c0c15_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm35cm14c0c15_weight(0), cm35cm14c0c15_weight(1));
    PL_STEP_0_for_cm2cm11c16c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm11c16c4_weight(0), cm2cm11c16c4_weight(1));
    PL_STEP_0_for_cm9cm3cm7c60_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm9cm3cm7c60_weight(0), cm9cm3cm7c60_weight(1));
    PL_STEP_0_for_c3cm1c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3cm1c0c0_weight(0), c3cm1c0c0_weight(1));
    PL_STEP_0_for_c7c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c7c0c0c0_weight(0), c7c0c0c0_weight(1));
    PL_STEP_0_for_cm2c2c6c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c2c6c0_weight(0), cm2c2c6c0_weight(1));
    PL_STEP_0_for_c0c0cm40c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0cm40c4_weight(0), c0c0cm40c4_weight(1));
    PL_STEP_0_for_c2c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c0c0c0_weight(0), c2c0c0c0_weight(1));
    PL_STEP_0_for_c5cm111c0c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5cm111c0c1_weight(0), c5cm111c0c1_weight(1));
    PL_STEP_0_for_c3c0c0c58_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c0c0c58_weight(0), c3c0c0c58_weight(1));
    PL_STEP_0_for_c19c5c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c19c5c0c0_weight(0), c19c5c0c0_weight(1));
    PL_STEP_0_for_c3c29cm32cm6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c29cm32cm6_weight(0), c3c29cm32cm6_weight(1));
    PL_STEP_0_for_cm1c15c1c86_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c15c1c86_weight(0), cm1c15c1c86_weight(1));
    PL_STEP_0_for_cm8cm2c0cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm8cm2c0cm1_weight(0), cm8cm2c0cm1_weight(1));
    PL_STEP_0_for_c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0_weight(0), c0c0c0c0_weight(1));


    cm2cm5cm3cm82_c2c0c0c0_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 8,
			B_WIDTH => 3,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm2cm5cm3cm82_weight(1)(8-1 downto 0),
			B	=> c2c0c0c0_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2cm5cm3cm82,
			CxB => R_c2c0c0c0
		);

    cm2cm1c115c18_c3cm1c0c0_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 8,
			B_WIDTH => 3,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm2cm1c115c18_weight(1)(8-1 downto 0),
			B	=> c3cm1c0c0_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2cm1c115c18,
			CxB => R_c3cm1c0c0
		);

    c5cm111c0c1_cm8cm2c0cm1_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 8,
			B_WIDTH => 4,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c5cm111c0c1_weight(1)(8-1 downto 0),
			B	=> cm8cm2c0cm1_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c5cm111c0c1,
			CxB => R_cm8cm2c0cm1
		);

    cm1c15c1c86_cm2c2c6c0_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 8,
			B_WIDTH => 4,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm1c15c1c86_weight(1)(8-1 downto 0),
			B	=> cm2c2c6c0_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1c15c1c86,
			CxB => R_cm2c2c6c0
		);

    cm35cm14c0c15_c7c0c0c0_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 4,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm35cm14c0c15_weight(1)(7-1 downto 0),
			B	=> c7c0c0c0_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm35cm14c0c15,
			CxB => R_c7c0c0c0
		);

    cm9cm3cm7c60_c3c29cm32cm6_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 6,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm9cm3cm7c60_weight(1)(7-1 downto 0),
			B	=> c3c29cm32cm6_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm9cm3cm7c60,
			CxB => R_c3c29cm32cm6
		);

    c0c0cm40c4_c19c5c0c0_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 6,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c0c0cm40c4_weight(1)(7-1 downto 0),
			B	=> c19c5c0c0_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c0cm40c4,
			CxB => R_c19c5c0c0
		);

    c3c0c0c58_cm2cm11c16c4_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 6,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c3c0c0c58_weight(1)(7-1 downto 0),
			B	=> cm2cm11c16c4_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c3c0c0c58,
			CxB => R_cm2cm11c16c4
		);




end architecture;
