library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv3_core5_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(4-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        R_cm3c6cm8c16 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_cm1c6c0c6 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_cm18cm7c0c0 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_c1cm3c1c0 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_cm3c15cm2cm21 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_c4c0c0c0 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_cm4c1c1c23 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_c5cm12cm16c3 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_c2c0c14c1 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_cm6c1c0c0 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_c2c0c0c2 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_c2c0c0cm14 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_cm6cm5c0c0 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_c5c20cm3cm8 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_cm4c1c2c97 : out std_logic_vector(15-1 downto 0);   --	sfix(8, -7)
        R_c4c0c0cm4 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_c0c0c0c0 : out std_logic_vector(8-1 downto 0)  --	sfix(1, -7)
    );
end conv3_core5_rmcm;

architecture arch of conv3_core5_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3C6CM8C16_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C6C0C6_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM18CM7C0C0_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM3C1C0_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3C15CM2CM21_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4C0C0C0_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4C1C1C23_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5CM12CM16C3_WEIGHT  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C0C14C1_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6C1C0C0_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C0C0C2_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C0C0CM14_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6CM5C0C0_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5C20CM3CM8_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4C1C2C97_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4C0C0CM4_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(5, -2)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(3, -5)
    signal cm3c6cm8c16_weight   : PIPELINE_TYPE_FOR_CM3C6CM8C16_WEIGHT;
    -- sfix(3, -5)
    signal cm1c6c0c6_weight     : PIPELINE_TYPE_FOR_CM1C6C0C6_WEIGHT;
    -- sfix(3, -5)
    signal cm18cm7c0c0_weight   : PIPELINE_TYPE_FOR_CM18CM7C0C0_WEIGHT;
    -- sfix(3, -5)
    signal c1cm3c1c0_weight     : PIPELINE_TYPE_FOR_C1CM3C1C0_WEIGHT;
    -- sfix(3, -5)
    signal cm3c15cm2cm21_weight : PIPELINE_TYPE_FOR_CM3C15CM2CM21_WEIGHT;
    -- sfix(3, -5)
    signal c4c0c0c0_weight      : PIPELINE_TYPE_FOR_C4C0C0C0_WEIGHT;
    -- sfix(3, -5)
    signal cm4c1c1c23_weight    : PIPELINE_TYPE_FOR_CM4C1C1C23_WEIGHT;
    -- sfix(3, -5)
    signal c5cm12cm16c3_weight  : PIPELINE_TYPE_FOR_C5CM12CM16C3_WEIGHT;
    -- sfix(3, -5)
    signal c2c0c14c1_weight     : PIPELINE_TYPE_FOR_C2C0C14C1_WEIGHT;
    -- sfix(3, -5)
    signal cm6c1c0c0_weight     : PIPELINE_TYPE_FOR_CM6C1C0C0_WEIGHT;
    -- sfix(3, -5)
    signal c2c0c0c2_weight      : PIPELINE_TYPE_FOR_C2C0C0C2_WEIGHT;
    -- sfix(3, -5)
    signal c2c0c0cm14_weight    : PIPELINE_TYPE_FOR_C2C0C0CM14_WEIGHT;
    -- sfix(3, -5)
    signal cm6cm5c0c0_weight    : PIPELINE_TYPE_FOR_CM6CM5C0C0_WEIGHT;
    -- sfix(3, -5)
    signal c5c20cm3cm8_weight   : PIPELINE_TYPE_FOR_C5C20CM3CM8_WEIGHT;
    -- sfix(3, -5)
    signal cm4c1c2c97_weight    : PIPELINE_TYPE_FOR_CM4C1C2C97_WEIGHT;
    -- sfix(3, -5)
    signal c4c0c0cm4_weight     : PIPELINE_TYPE_FOR_C4C0C0CM4_WEIGHT;
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



    WEIGHT_ROM: entity work.conv3_core5_rmcm_weightsconstant_memory
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
        
            dout1   => cm3c6cm8c16_weight(0), 
            dout2   => cm1c6c0c6_weight(0), 
            dout3   => cm18cm7c0c0_weight(0), 
            dout4   => c1cm3c1c0_weight(0), 
            dout5   => cm3c15cm2cm21_weight(0), 
            dout6   => c4c0c0c0_weight(0), 
            dout7   => cm4c1c1c23_weight(0), 
            dout8   => c5cm12cm16c3_weight(0), 
            dout9   => c2c0c14c1_weight(0), 
            dout10   => cm6c1c0c0_weight(0), 
            dout11   => c2c0c0c2_weight(0), 
            dout12   => c2c0c0cm14_weight(0), 
            dout13   => cm6cm5c0c0_weight(0), 
            dout14   => c5c20cm3cm8_weight(0), 
            dout15   => cm4c1c2c97_weight(0), 
            dout16   => c4c0c0cm4_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_cm3c6cm8c16_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3c6cm8c16_weight(0), cm3c6cm8c16_weight(1));
    PL_STEP_0_for_cm1c6c0c6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c6c0c6_weight(0), cm1c6c0c6_weight(1));
    PL_STEP_0_for_cm18cm7c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm18cm7c0c0_weight(0), cm18cm7c0c0_weight(1));
    PL_STEP_0_for_c1cm3c1c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm3c1c0_weight(0), c1cm3c1c0_weight(1));
    PL_STEP_0_for_cm3c15cm2cm21_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3c15cm2cm21_weight(0), cm3c15cm2cm21_weight(1));
    PL_STEP_0_for_c4c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4c0c0c0_weight(0), c4c0c0c0_weight(1));
    PL_STEP_0_for_cm4c1c1c23_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4c1c1c23_weight(0), cm4c1c1c23_weight(1));
    PL_STEP_0_for_c5cm12cm16c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5cm12cm16c3_weight(0), c5cm12cm16c3_weight(1));
    PL_STEP_0_for_c2c0c14c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c0c14c1_weight(0), c2c0c14c1_weight(1));
    PL_STEP_0_for_cm6c1c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6c1c0c0_weight(0), cm6c1c0c0_weight(1));
    PL_STEP_0_for_c2c0c0c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c0c0c2_weight(0), c2c0c0c2_weight(1));
    PL_STEP_0_for_c2c0c0cm14_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c0c0cm14_weight(0), c2c0c0cm14_weight(1));
    PL_STEP_0_for_cm6cm5c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6cm5c0c0_weight(0), cm6cm5c0c0_weight(1));
    PL_STEP_0_for_c5c20cm3cm8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5c20cm3cm8_weight(0), c5c20cm3cm8_weight(1));
    PL_STEP_0_for_cm4c1c2c97_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4c1c2c97_weight(0), cm4c1c2c97_weight(1));
    PL_STEP_0_for_c4c0c0cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4c0c0cm4_weight(0), c4c0c0cm4_weight(1));
    PL_STEP_0_for_c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0_weight(0), c0c0c0c0_weight(1));


    cm4c1c2c97_c2c0c0c2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm4c1c2c97_weight(1)(8-1 downto 0),
			B	=> c2c0c0c2_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm4c1c2c97,
			CxB => R_c2c0c0c2
		);

    cm3c6cm8c16_c1cm3c1c0_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 6,
			B_WIDTH => 3,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm3c6cm8c16_weight(1)(6-1 downto 0),
			B	=> c1cm3c1c0_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm3c6cm8c16,
			CxB => R_c1cm3c1c0
		);

    cm18cm7c0c0_c4c0c0cm4_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 6,
			B_WIDTH => 4,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm18cm7c0c0_weight(1)(6-1 downto 0),
			B	=> c4c0c0cm4_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm18cm7c0c0,
			CxB => R_c4c0c0cm4
		);

    cm3c15cm2cm21_cm6cm5c0c0_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 6,
			B_WIDTH => 4,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm3c15cm2cm21_weight(1)(6-1 downto 0),
			B	=> cm6cm5c0c0_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm3c15cm2cm21,
			CxB => R_cm6cm5c0c0
		);

    cm4c1c1c23_cm6c1c0c0_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 6,
			B_WIDTH => 4,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm4c1c1c23_weight(1)(6-1 downto 0),
			B	=> cm6c1c0c0_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm4c1c1c23,
			CxB => R_cm6c1c0c0
		);

    c5c20cm3cm8_c4c0c0c0_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 6,
			B_WIDTH => 4,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c5c20cm3cm8_weight(1)(6-1 downto 0),
			B	=> c4c0c0c0_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c5c20cm3cm8,
			CxB => R_c4c0c0c0
		);

    c5cm12cm16c3_cm1c6c0c6_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 5,
			B_WIDTH => 4,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c5cm12cm16c3_weight(1)(5-1 downto 0),
			B	=> cm1c6c0c6_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c5cm12cm16c3,
			CxB => R_cm1c6c0c6
		);

    c2c0c14c1_c2c0c0cm14_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 5,
			B_WIDTH => 5,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c2c0c14c1_weight(1)(5-1 downto 0),
			B	=> c2c0c0cm14_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c2c0c14c1,
			CxB => R_c2c0c0cm14
		);




end architecture;
