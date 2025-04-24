library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv3_core26_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(4-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        R_cm4c8cm1c2 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_c3cm2c4c4 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_cm1c6c0c2 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_cm6c91cm1cm10 : out std_logic_vector(15-1 downto 0);   --	sfix(8, -7)
        R_c2cm4c0c0 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_cm3cm5c0c0 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_c1cm2c3c1 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_c0c6c1cm3 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_c0cm1c1c14 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_cm7c12c0c3 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_c5c1cm2c0 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_c0c1cm3cm4 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_c1c4c0c0 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_c3cm6c0c10 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_c6c0c12c5 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_c4c1cm1c5 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_c0c0c0c0 : out std_logic_vector(8-1 downto 0)  --	sfix(1, -7)
    );
end conv3_core26_rmcm;

architecture arch of conv3_core26_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4C8CM1C2_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3CM2C4C4_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C6C0C2_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6C91CM1CM10_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2CM4C0C0_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3CM5C0C0_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM2C3C1_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C6C1CM3_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM1C1C14_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM7C12C0C3_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5C1CM2C0_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C1CM3CM4_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C4C0C0_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3CM6C0C10_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6C0C12C5_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4C1CM1C5_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(5, -2)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(3, -5)
    signal cm4c8cm1c2_weight    : PIPELINE_TYPE_FOR_CM4C8CM1C2_WEIGHT;
    -- sfix(3, -5)
    signal c3cm2c4c4_weight     : PIPELINE_TYPE_FOR_C3CM2C4C4_WEIGHT;
    -- sfix(3, -5)
    signal cm1c6c0c2_weight     : PIPELINE_TYPE_FOR_CM1C6C0C2_WEIGHT;
    -- sfix(3, -5)
    signal cm6c91cm1cm10_weight : PIPELINE_TYPE_FOR_CM6C91CM1CM10_WEIGHT;
    -- sfix(3, -5)
    signal c2cm4c0c0_weight     : PIPELINE_TYPE_FOR_C2CM4C0C0_WEIGHT;
    -- sfix(3, -5)
    signal cm3cm5c0c0_weight    : PIPELINE_TYPE_FOR_CM3CM5C0C0_WEIGHT;
    -- sfix(3, -5)
    signal c1cm2c3c1_weight     : PIPELINE_TYPE_FOR_C1CM2C3C1_WEIGHT;
    -- sfix(3, -5)
    signal c0c6c1cm3_weight     : PIPELINE_TYPE_FOR_C0C6C1CM3_WEIGHT;
    -- sfix(3, -5)
    signal c0cm1c1c14_weight    : PIPELINE_TYPE_FOR_C0CM1C1C14_WEIGHT;
    -- sfix(3, -5)
    signal cm7c12c0c3_weight    : PIPELINE_TYPE_FOR_CM7C12C0C3_WEIGHT;
    -- sfix(3, -5)
    signal c5c1cm2c0_weight     : PIPELINE_TYPE_FOR_C5C1CM2C0_WEIGHT;
    -- sfix(3, -5)
    signal c0c1cm3cm4_weight    : PIPELINE_TYPE_FOR_C0C1CM3CM4_WEIGHT;
    -- sfix(3, -5)
    signal c1c4c0c0_weight      : PIPELINE_TYPE_FOR_C1C4C0C0_WEIGHT;
    -- sfix(3, -5)
    signal c3cm6c0c10_weight    : PIPELINE_TYPE_FOR_C3CM6C0C10_WEIGHT;
    -- sfix(3, -5)
    signal c6c0c12c5_weight     : PIPELINE_TYPE_FOR_C6C0C12C5_WEIGHT;
    -- sfix(3, -5)
    signal c4c1cm1c5_weight     : PIPELINE_TYPE_FOR_C4C1CM1C5_WEIGHT;
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



    WEIGHT_ROM: entity work.conv3_core26_rmcm_weightsconstant_memory
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
        
            dout1   => cm4c8cm1c2_weight(0), 
            dout2   => c3cm2c4c4_weight(0), 
            dout3   => cm1c6c0c2_weight(0), 
            dout4   => cm6c91cm1cm10_weight(0), 
            dout5   => c2cm4c0c0_weight(0), 
            dout6   => cm3cm5c0c0_weight(0), 
            dout7   => c1cm2c3c1_weight(0), 
            dout8   => c0c6c1cm3_weight(0), 
            dout9   => c0cm1c1c14_weight(0), 
            dout10   => cm7c12c0c3_weight(0), 
            dout11   => c5c1cm2c0_weight(0), 
            dout12   => c0c1cm3cm4_weight(0), 
            dout13   => c1c4c0c0_weight(0), 
            dout14   => c3cm6c0c10_weight(0), 
            dout15   => c6c0c12c5_weight(0), 
            dout16   => c4c1cm1c5_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_cm4c8cm1c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4c8cm1c2_weight(0), cm4c8cm1c2_weight(1));
    PL_STEP_0_for_c3cm2c4c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3cm2c4c4_weight(0), c3cm2c4c4_weight(1));
    PL_STEP_0_for_cm1c6c0c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c6c0c2_weight(0), cm1c6c0c2_weight(1));
    PL_STEP_0_for_cm6c91cm1cm10_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6c91cm1cm10_weight(0), cm6c91cm1cm10_weight(1));
    PL_STEP_0_for_c2cm4c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2cm4c0c0_weight(0), c2cm4c0c0_weight(1));
    PL_STEP_0_for_cm3cm5c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3cm5c0c0_weight(0), cm3cm5c0c0_weight(1));
    PL_STEP_0_for_c1cm2c3c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm2c3c1_weight(0), c1cm2c3c1_weight(1));
    PL_STEP_0_for_c0c6c1cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c6c1cm3_weight(0), c0c6c1cm3_weight(1));
    PL_STEP_0_for_c0cm1c1c14_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm1c1c14_weight(0), c0cm1c1c14_weight(1));
    PL_STEP_0_for_cm7c12c0c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm7c12c0c3_weight(0), cm7c12c0c3_weight(1));
    PL_STEP_0_for_c5c1cm2c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5c1cm2c0_weight(0), c5c1cm2c0_weight(1));
    PL_STEP_0_for_c0c1cm3cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c1cm3cm4_weight(0), c0c1cm3cm4_weight(1));
    PL_STEP_0_for_c1c4c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c4c0c0_weight(0), c1c4c0c0_weight(1));
    PL_STEP_0_for_c3cm6c0c10_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3cm6c0c10_weight(0), c3cm6c0c10_weight(1));
    PL_STEP_0_for_c6c0c12c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6c0c12c5_weight(0), c6c0c12c5_weight(1));
    PL_STEP_0_for_c4c1cm1c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4c1cm1c5_weight(0), c4c1cm1c5_weight(1));
    PL_STEP_0_for_c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0_weight(0), c0c0c0c0_weight(1));


    cm6c91cm1cm10_c0c1cm3cm4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm6c91cm1cm10_weight(1)(8-1 downto 0),
			B	=> c0c1cm3cm4_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm6c91cm1cm10,
			CxB => R_c0c1cm3cm4
		);

    cm4c8cm1c2_c1cm2c3c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm4c8cm1c2_weight(1)(5-1 downto 0),
			B	=> c1cm2c3c1_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm4c8cm1c2,
			CxB => R_c1cm2c3c1
		);

    c0cm1c1c14_c2cm4c0c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0cm1c1c14_weight(1)(5-1 downto 0),
			B	=> c2cm4c0c0_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0cm1c1c14,
			CxB => R_c2cm4c0c0
		);

    cm7c12c0c3_c4c1cm1c5_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm7c12c0c3_weight(1)(5-1 downto 0),
			B	=> c4c1cm1c5_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm7c12c0c3,
			CxB => R_c4c1cm1c5
		);

    c3cm6c0c10_c1c4c0c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c3cm6c0c10_weight(1)(5-1 downto 0),
			B	=> c1c4c0c0_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c3cm6c0c10,
			CxB => R_c1c4c0c0
		);

    c6c0c12c5_c5c1cm2c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c6c0c12c5_weight(1)(5-1 downto 0),
			B	=> c5c1cm2c0_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c6c0c12c5,
			CxB => R_c5c1cm2c0
		);

    c3cm2c4c4_c0c6c1cm3_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 4,
			B_WIDTH => 4,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c3cm2c4c4_weight(1)(4-1 downto 0),
			B	=> c0c6c1cm3_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c3cm2c4c4,
			CxB => R_c0c6c1cm3
		);

    cm1c6c0c2_cm3cm5c0c0_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 4,
			B_WIDTH => 4,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm1c6c0c2_weight(1)(4-1 downto 0),
			B	=> cm3cm5c0c0_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1c6c0c2,
			CxB => R_cm3cm5c0c0
		);




end architecture;
