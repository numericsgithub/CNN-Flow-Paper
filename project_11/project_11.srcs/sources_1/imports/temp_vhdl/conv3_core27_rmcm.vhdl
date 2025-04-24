library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv3_core27_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(4-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        R_cm1cm6cm1cm4 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_cm3c6c11c27 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_c0cm17c0c1 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_c6cm14c9c16 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_c2c5cm3c4 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_c70c0c0c0 : out std_logic_vector(15-1 downto 0);   --	sfix(8, -7)
        R_c2c33c1c0 : out std_logic_vector(14-1 downto 0);   --	sfix(7, -7)
        R_c0c1c0c1 : out std_logic_vector(9-1 downto 0);   --	sfix(2, -7)
        R_c1c13cm2cm7 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_c11cm19c0cm1 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_c4cm25c30c2 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_c6cm5c0c6 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_c2cm2c0c0 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_c2cm33cm3cm8 : out std_logic_vector(14-1 downto 0);   --	sfix(7, -7)
        R_c1c2c7c2 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_cm1cm11c0c1 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_c0c0c0c0 : out std_logic_vector(8-1 downto 0)  --	sfix(1, -7)
    );
end conv3_core27_rmcm;

architecture arch of conv3_core27_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM6CM1CM4_WEIGHT  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3C6C11C27_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM17C0C1_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6CM14C9C16_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C5CM3C4_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C70C0C0C0_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C33C1C0_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C1C0C1_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C13CM2CM7_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C11CM19C0CM1_WEIGHT  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4CM25C30C2_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6CM5C0C6_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2CM2C0C0_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2CM33CM3CM8_WEIGHT  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C2C7C2_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM11C0C1_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(5, -2)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(3, -5)
    signal cm1cm6cm1cm4_weight  : PIPELINE_TYPE_FOR_CM1CM6CM1CM4_WEIGHT;
    -- sfix(3, -5)
    signal cm3c6c11c27_weight   : PIPELINE_TYPE_FOR_CM3C6C11C27_WEIGHT;
    -- sfix(3, -5)
    signal c0cm17c0c1_weight    : PIPELINE_TYPE_FOR_C0CM17C0C1_WEIGHT;
    -- sfix(3, -5)
    signal c6cm14c9c16_weight   : PIPELINE_TYPE_FOR_C6CM14C9C16_WEIGHT;
    -- sfix(3, -5)
    signal c2c5cm3c4_weight     : PIPELINE_TYPE_FOR_C2C5CM3C4_WEIGHT;
    -- sfix(3, -5)
    signal c70c0c0c0_weight     : PIPELINE_TYPE_FOR_C70C0C0C0_WEIGHT;
    -- sfix(3, -5)
    signal c2c33c1c0_weight     : PIPELINE_TYPE_FOR_C2C33C1C0_WEIGHT;
    -- sfix(3, -5)
    signal c0c1c0c1_weight      : PIPELINE_TYPE_FOR_C0C1C0C1_WEIGHT;
    -- sfix(3, -5)
    signal c1c13cm2cm7_weight   : PIPELINE_TYPE_FOR_C1C13CM2CM7_WEIGHT;
    -- sfix(3, -5)
    signal c11cm19c0cm1_weight  : PIPELINE_TYPE_FOR_C11CM19C0CM1_WEIGHT;
    -- sfix(3, -5)
    signal c4cm25c30c2_weight   : PIPELINE_TYPE_FOR_C4CM25C30C2_WEIGHT;
    -- sfix(3, -5)
    signal c6cm5c0c6_weight     : PIPELINE_TYPE_FOR_C6CM5C0C6_WEIGHT;
    -- sfix(3, -5)
    signal c2cm2c0c0_weight     : PIPELINE_TYPE_FOR_C2CM2C0C0_WEIGHT;
    -- sfix(3, -5)
    signal c2cm33cm3cm8_weight  : PIPELINE_TYPE_FOR_C2CM33CM3CM8_WEIGHT;
    -- sfix(3, -5)
    signal c1c2c7c2_weight      : PIPELINE_TYPE_FOR_C1C2C7C2_WEIGHT;
    -- sfix(3, -5)
    signal cm1cm11c0c1_weight   : PIPELINE_TYPE_FOR_CM1CM11C0C1_WEIGHT;
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



    WEIGHT_ROM: entity work.conv3_core27_rmcm_weightsconstant_memory
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
        
            dout1   => cm1cm6cm1cm4_weight(0), 
            dout2   => cm3c6c11c27_weight(0), 
            dout3   => c0cm17c0c1_weight(0), 
            dout4   => c6cm14c9c16_weight(0), 
            dout5   => c2c5cm3c4_weight(0), 
            dout6   => c70c0c0c0_weight(0), 
            dout7   => c2c33c1c0_weight(0), 
            dout8   => c0c1c0c1_weight(0), 
            dout9   => c1c13cm2cm7_weight(0), 
            dout10   => c11cm19c0cm1_weight(0), 
            dout11   => c4cm25c30c2_weight(0), 
            dout12   => c6cm5c0c6_weight(0), 
            dout13   => c2cm2c0c0_weight(0), 
            dout14   => c2cm33cm3cm8_weight(0), 
            dout15   => c1c2c7c2_weight(0), 
            dout16   => cm1cm11c0c1_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_cm1cm6cm1cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm6cm1cm4_weight(0), cm1cm6cm1cm4_weight(1));
    PL_STEP_0_for_cm3c6c11c27_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3c6c11c27_weight(0), cm3c6c11c27_weight(1));
    PL_STEP_0_for_c0cm17c0c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm17c0c1_weight(0), c0cm17c0c1_weight(1));
    PL_STEP_0_for_c6cm14c9c16_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6cm14c9c16_weight(0), c6cm14c9c16_weight(1));
    PL_STEP_0_for_c2c5cm3c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c5cm3c4_weight(0), c2c5cm3c4_weight(1));
    PL_STEP_0_for_c70c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c70c0c0c0_weight(0), c70c0c0c0_weight(1));
    PL_STEP_0_for_c2c33c1c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c33c1c0_weight(0), c2c33c1c0_weight(1));
    PL_STEP_0_for_c0c1c0c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c1c0c1_weight(0), c0c1c0c1_weight(1));
    PL_STEP_0_for_c1c13cm2cm7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c13cm2cm7_weight(0), c1c13cm2cm7_weight(1));
    PL_STEP_0_for_c11cm19c0cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c11cm19c0cm1_weight(0), c11cm19c0cm1_weight(1));
    PL_STEP_0_for_c4cm25c30c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4cm25c30c2_weight(0), c4cm25c30c2_weight(1));
    PL_STEP_0_for_c6cm5c0c6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6cm5c0c6_weight(0), c6cm5c0c6_weight(1));
    PL_STEP_0_for_c2cm2c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2cm2c0c0_weight(0), c2cm2c0c0_weight(1));
    PL_STEP_0_for_c2cm33cm3cm8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2cm33cm3cm8_weight(0), c2cm33cm3cm8_weight(1));
    PL_STEP_0_for_c1c2c7c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c2c7c2_weight(0), c1c2c7c2_weight(1));
    PL_STEP_0_for_cm1cm11c0c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm11c0c1_weight(0), cm1cm11c0c1_weight(1));
    PL_STEP_0_for_c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0_weight(0), c0c0c0c0_weight(1));


    c70c0c0c0_c0c1c0c1_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 8,
			B_WIDTH => 2,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c70c0c0c0_weight(1)(8-1 downto 0),
			B	=> c0c1c0c1_weight(1)(2-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c70c0c0c0,
			CxB => R_c0c1c0c1
		);

    c2c33c1c0_c2cm2c0c0_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 3,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c2c33c1c0_weight(1)(7-1 downto 0),
			B	=> c2cm2c0c0_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c2c33c1c0,
			CxB => R_c2cm2c0c0
		);

    c2cm33cm3cm8_c1c2c7c2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c2cm33cm3cm8_weight(1)(7-1 downto 0),
			B	=> c1c2c7c2_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c2cm33cm3cm8,
			CxB => R_c1c2c7c2
		);

    cm3c6c11c27_c6cm5c0c6_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm3c6c11c27_weight(1)(6-1 downto 0),
			B	=> c6cm5c0c6_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm3c6c11c27,
			CxB => R_c6cm5c0c6
		);

    c0cm17c0c1_c2c5cm3c4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0cm17c0c1_weight(1)(6-1 downto 0),
			B	=> c2c5cm3c4_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0cm17c0c1,
			CxB => R_c2c5cm3c4
		);

    c6cm14c9c16_cm1cm6cm1cm4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c6cm14c9c16_weight(1)(6-1 downto 0),
			B	=> cm1cm6cm1cm4_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c6cm14c9c16,
			CxB => R_cm1cm6cm1cm4
		);

    c11cm19c0cm1_cm1cm11c0c1_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 6,
			B_WIDTH => 5,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c11cm19c0cm1_weight(1)(6-1 downto 0),
			B	=> cm1cm11c0c1_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c11cm19c0cm1,
			CxB => R_cm1cm11c0c1
		);

    c4cm25c30c2_c1c13cm2cm7_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 6,
			B_WIDTH => 5,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c4cm25c30c2_weight(1)(6-1 downto 0),
			B	=> c1c13cm2cm7_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c4cm25c30c2,
			CxB => R_c1c13cm2cm7
		);




end architecture;
