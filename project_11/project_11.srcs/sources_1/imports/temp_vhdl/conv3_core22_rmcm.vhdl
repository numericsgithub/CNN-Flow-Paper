library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv3_core22_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(4-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        R_cm5cm2cm33cm4 : out std_logic_vector(14-1 downto 0);   --	sfix(7, -7)
        R_c4c8c12cm1 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_c3cm7c0cm1 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_c2cm1c3c3 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_cm1cm6c3c7 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_cm1c1c0c0 : out std_logic_vector(9-1 downto 0);   --	sfix(2, -7)
        R_cm1c0cm1c2 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_cm4c5c2c8 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_cm5c0cm5cm11 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_cm13cm1c0cm1 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_c18cm10c0c6 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_c0c0c0c6 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_c6cm7c0c0 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_cm1c12cm1cm5 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_c14cm8cm1c10 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_c3cm1c0c0 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_c0c0c0c0 : out std_logic_vector(8-1 downto 0)  --	sfix(1, -7)
    );
end conv3_core22_rmcm;

architecture arch of conv3_core22_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5CM2CM33CM4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4C8C12CM1_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3CM7C0CM1_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2CM1C3C3_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM6C3C7_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C1C0C0_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C0CM1C2_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4C5C2C8_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5C0CM5CM11_WEIGHT  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM13CM1C0CM1_WEIGHT  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C18CM10C0C6_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C6_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6CM7C0C0_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C12CM1CM5_WEIGHT  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C14CM8CM1C10_WEIGHT  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3CM1C0C0_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(5, -2)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(3, -5)
    signal cm5cm2cm33cm4_weight : PIPELINE_TYPE_FOR_CM5CM2CM33CM4_WEIGHT;
    -- sfix(3, -5)
    signal c4c8c12cm1_weight    : PIPELINE_TYPE_FOR_C4C8C12CM1_WEIGHT;
    -- sfix(3, -5)
    signal c3cm7c0cm1_weight    : PIPELINE_TYPE_FOR_C3CM7C0CM1_WEIGHT;
    -- sfix(3, -5)
    signal c2cm1c3c3_weight     : PIPELINE_TYPE_FOR_C2CM1C3C3_WEIGHT;
    -- sfix(3, -5)
    signal cm1cm6c3c7_weight    : PIPELINE_TYPE_FOR_CM1CM6C3C7_WEIGHT;
    -- sfix(3, -5)
    signal cm1c1c0c0_weight     : PIPELINE_TYPE_FOR_CM1C1C0C0_WEIGHT;
    -- sfix(3, -5)
    signal cm1c0cm1c2_weight    : PIPELINE_TYPE_FOR_CM1C0CM1C2_WEIGHT;
    -- sfix(3, -5)
    signal cm4c5c2c8_weight     : PIPELINE_TYPE_FOR_CM4C5C2C8_WEIGHT;
    -- sfix(3, -5)
    signal cm5c0cm5cm11_weight  : PIPELINE_TYPE_FOR_CM5C0CM5CM11_WEIGHT;
    -- sfix(3, -5)
    signal cm13cm1c0cm1_weight  : PIPELINE_TYPE_FOR_CM13CM1C0CM1_WEIGHT;
    -- sfix(3, -5)
    signal c18cm10c0c6_weight   : PIPELINE_TYPE_FOR_C18CM10C0C6_WEIGHT;
    -- sfix(3, -5)
    signal c0c0c0c6_weight      : PIPELINE_TYPE_FOR_C0C0C0C6_WEIGHT;
    -- sfix(3, -5)
    signal c6cm7c0c0_weight     : PIPELINE_TYPE_FOR_C6CM7C0C0_WEIGHT;
    -- sfix(3, -5)
    signal cm1c12cm1cm5_weight  : PIPELINE_TYPE_FOR_CM1C12CM1CM5_WEIGHT;
    -- sfix(3, -5)
    signal c14cm8cm1c10_weight  : PIPELINE_TYPE_FOR_C14CM8CM1C10_WEIGHT;
    -- sfix(3, -5)
    signal c3cm1c0c0_weight     : PIPELINE_TYPE_FOR_C3CM1C0C0_WEIGHT;
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



    WEIGHT_ROM: entity work.conv3_core22_rmcm_weightsconstant_memory
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
        
            dout1   => cm5cm2cm33cm4_weight(0), 
            dout2   => c4c8c12cm1_weight(0), 
            dout3   => c3cm7c0cm1_weight(0), 
            dout4   => c2cm1c3c3_weight(0), 
            dout5   => cm1cm6c3c7_weight(0), 
            dout6   => cm1c1c0c0_weight(0), 
            dout7   => cm1c0cm1c2_weight(0), 
            dout8   => cm4c5c2c8_weight(0), 
            dout9   => cm5c0cm5cm11_weight(0), 
            dout10   => cm13cm1c0cm1_weight(0), 
            dout11   => c18cm10c0c6_weight(0), 
            dout12   => c0c0c0c6_weight(0), 
            dout13   => c6cm7c0c0_weight(0), 
            dout14   => cm1c12cm1cm5_weight(0), 
            dout15   => c14cm8cm1c10_weight(0), 
            dout16   => c3cm1c0c0_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_cm5cm2cm33cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5cm2cm33cm4_weight(0), cm5cm2cm33cm4_weight(1));
    PL_STEP_0_for_c4c8c12cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4c8c12cm1_weight(0), c4c8c12cm1_weight(1));
    PL_STEP_0_for_c3cm7c0cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3cm7c0cm1_weight(0), c3cm7c0cm1_weight(1));
    PL_STEP_0_for_c2cm1c3c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2cm1c3c3_weight(0), c2cm1c3c3_weight(1));
    PL_STEP_0_for_cm1cm6c3c7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm6c3c7_weight(0), cm1cm6c3c7_weight(1));
    PL_STEP_0_for_cm1c1c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c1c0c0_weight(0), cm1c1c0c0_weight(1));
    PL_STEP_0_for_cm1c0cm1c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c0cm1c2_weight(0), cm1c0cm1c2_weight(1));
    PL_STEP_0_for_cm4c5c2c8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4c5c2c8_weight(0), cm4c5c2c8_weight(1));
    PL_STEP_0_for_cm5c0cm5cm11_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5c0cm5cm11_weight(0), cm5c0cm5cm11_weight(1));
    PL_STEP_0_for_cm13cm1c0cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm13cm1c0cm1_weight(0), cm13cm1c0cm1_weight(1));
    PL_STEP_0_for_c18cm10c0c6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c18cm10c0c6_weight(0), c18cm10c0c6_weight(1));
    PL_STEP_0_for_c0c0c0c6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c6_weight(0), c0c0c0c6_weight(1));
    PL_STEP_0_for_c6cm7c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6cm7c0c0_weight(0), c6cm7c0c0_weight(1));
    PL_STEP_0_for_cm1c12cm1cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c12cm1cm5_weight(0), cm1c12cm1cm5_weight(1));
    PL_STEP_0_for_c14cm8cm1c10_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c14cm8cm1c10_weight(0), c14cm8cm1c10_weight(1));
    PL_STEP_0_for_c3cm1c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3cm1c0c0_weight(0), c3cm1c0c0_weight(1));
    PL_STEP_0_for_c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0_weight(0), c0c0c0c0_weight(1));


    cm5cm2cm33cm4_cm1c1c0c0_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 2,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm5cm2cm33cm4_weight(1)(7-1 downto 0),
			B	=> cm1c1c0c0_weight(1)(2-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm5cm2cm33cm4,
			CxB => R_cm1c1c0c0
		);

    c18cm10c0c6_c3cm1c0c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c18cm10c0c6_weight(1)(6-1 downto 0),
			B	=> c3cm1c0c0_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c18cm10c0c6,
			CxB => R_c3cm1c0c0
		);

    c4c8c12cm1_cm1c0cm1c2_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 5,
			B_WIDTH => 3,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c4c8c12cm1_weight(1)(5-1 downto 0),
			B	=> cm1c0cm1c2_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c4c8c12cm1,
			CxB => R_cm1c0cm1c2
		);

    cm4c5c2c8_c2cm1c3c3_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 5,
			B_WIDTH => 3,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm4c5c2c8_weight(1)(5-1 downto 0),
			B	=> c2cm1c3c3_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm4c5c2c8,
			CxB => R_c2cm1c3c3
		);

    cm5c0cm5cm11_c6cm7c0c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm5c0cm5cm11_weight(1)(5-1 downto 0),
			B	=> c6cm7c0c0_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm5c0cm5cm11,
			CxB => R_c6cm7c0c0
		);

    cm13cm1c0cm1_c0c0c0c6_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm13cm1c0cm1_weight(1)(5-1 downto 0),
			B	=> c0c0c0c6_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm13cm1c0cm1,
			CxB => R_c0c0c0c6
		);

    cm1c12cm1cm5_cm1cm6c3c7_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm1c12cm1cm5_weight(1)(5-1 downto 0),
			B	=> cm1cm6c3c7_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1c12cm1cm5,
			CxB => R_cm1cm6c3c7
		);

    c14cm8cm1c10_c3cm7c0cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c14cm8cm1c10_weight(1)(5-1 downto 0),
			B	=> c3cm7c0cm1_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c14cm8cm1c10,
			CxB => R_c3cm7c0cm1
		);




end architecture;
