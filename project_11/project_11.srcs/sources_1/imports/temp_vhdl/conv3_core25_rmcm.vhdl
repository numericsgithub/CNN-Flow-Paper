library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv3_core25_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(4-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        R_c1c0c0cm3 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_c0c2c0c2 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_c0cm3c0c1 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_c3cm1c2c3 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_cm1cm1cm1c1 : out std_logic_vector(9-1 downto 0);   --	sfix(2, -7)
        R_c0cm1c0c0 : out std_logic_vector(8-1 downto 0);   --	sfix(1, -7)
        R_cm4c1c1c1 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_c0c0cm1cm1 : out std_logic_vector(8-1 downto 0);   --	sfix(1, -7)
        R_c0c1cm1cm1 : out std_logic_vector(9-1 downto 0);   --	sfix(2, -7)
        R_c1cm1c0cm11 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_c1cm3c0c0 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_c0cm7c0cm1 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_c0c1c0c0 : out std_logic_vector(9-1 downto 0);   --	sfix(2, -7)
        R_cm1cm1cm1cm1 : out std_logic_vector(8-1 downto 0);   --	sfix(1, -7)
        R_cm1c0c2c2 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_cm1cm1c7c0 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_c0c0c0c0 : out std_logic_vector(8-1 downto 0)  --	sfix(1, -7)
    );
end conv3_core25_rmcm;

architecture arch of conv3_core25_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C0C0CM3_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C2C0C2_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM3C0C1_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3CM1C2C3_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM1CM1C1_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM1C0C0_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4C1C1C1_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0CM1CM1_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C1CM1CM1_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM1C0CM11_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM3C0C0_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM7C0CM1_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C1C0C0_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM1CM1CM1_WEIGHT  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C0C2C2_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM1C7C0_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(5, -2)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(3, -5)
    signal c1c0c0cm3_weight     : PIPELINE_TYPE_FOR_C1C0C0CM3_WEIGHT;
    -- sfix(3, -5)
    signal c0c2c0c2_weight      : PIPELINE_TYPE_FOR_C0C2C0C2_WEIGHT;
    -- sfix(3, -5)
    signal c0cm3c0c1_weight     : PIPELINE_TYPE_FOR_C0CM3C0C1_WEIGHT;
    -- sfix(3, -5)
    signal c3cm1c2c3_weight     : PIPELINE_TYPE_FOR_C3CM1C2C3_WEIGHT;
    -- sfix(3, -5)
    signal cm1cm1cm1c1_weight   : PIPELINE_TYPE_FOR_CM1CM1CM1C1_WEIGHT;
    -- sfix(3, -5)
    signal c0cm1c0c0_weight     : PIPELINE_TYPE_FOR_C0CM1C0C0_WEIGHT;
    -- sfix(3, -5)
    signal cm4c1c1c1_weight     : PIPELINE_TYPE_FOR_CM4C1C1C1_WEIGHT;
    -- sfix(3, -5)
    signal c0c0cm1cm1_weight    : PIPELINE_TYPE_FOR_C0C0CM1CM1_WEIGHT;
    -- sfix(3, -5)
    signal c0c1cm1cm1_weight    : PIPELINE_TYPE_FOR_C0C1CM1CM1_WEIGHT;
    -- sfix(3, -5)
    signal c1cm1c0cm11_weight   : PIPELINE_TYPE_FOR_C1CM1C0CM11_WEIGHT;
    -- sfix(3, -5)
    signal c1cm3c0c0_weight     : PIPELINE_TYPE_FOR_C1CM3C0C0_WEIGHT;
    -- sfix(3, -5)
    signal c0cm7c0cm1_weight    : PIPELINE_TYPE_FOR_C0CM7C0CM1_WEIGHT;
    -- sfix(3, -5)
    signal c0c1c0c0_weight      : PIPELINE_TYPE_FOR_C0C1C0C0_WEIGHT;
    -- sfix(3, -5)
    signal cm1cm1cm1cm1_weight  : PIPELINE_TYPE_FOR_CM1CM1CM1CM1_WEIGHT;
    -- sfix(3, -5)
    signal cm1c0c2c2_weight     : PIPELINE_TYPE_FOR_CM1C0C2C2_WEIGHT;
    -- sfix(3, -5)
    signal cm1cm1c7c0_weight    : PIPELINE_TYPE_FOR_CM1CM1C7C0_WEIGHT;
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



    WEIGHT_ROM: entity work.conv3_core25_rmcm_weightsconstant_memory
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
        
            dout1   => c1c0c0cm3_weight(0), 
            dout2   => c0c2c0c2_weight(0), 
            dout3   => c0cm3c0c1_weight(0), 
            dout4   => c3cm1c2c3_weight(0), 
            dout5   => cm1cm1cm1c1_weight(0), 
            dout6   => c0cm1c0c0_weight(0), 
            dout7   => cm4c1c1c1_weight(0), 
            dout8   => c0c0cm1cm1_weight(0), 
            dout9   => c0c1cm1cm1_weight(0), 
            dout10   => c1cm1c0cm11_weight(0), 
            dout11   => c1cm3c0c0_weight(0), 
            dout12   => c0cm7c0cm1_weight(0), 
            dout13   => c0c1c0c0_weight(0), 
            dout14   => cm1cm1cm1cm1_weight(0), 
            dout15   => cm1c0c2c2_weight(0), 
            dout16   => cm1cm1c7c0_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_c1c0c0cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c0c0cm3_weight(0), c1c0c0cm3_weight(1));
    PL_STEP_0_for_c0c2c0c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c2c0c2_weight(0), c0c2c0c2_weight(1));
    PL_STEP_0_for_c0cm3c0c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm3c0c1_weight(0), c0cm3c0c1_weight(1));
    PL_STEP_0_for_c3cm1c2c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3cm1c2c3_weight(0), c3cm1c2c3_weight(1));
    PL_STEP_0_for_cm1cm1cm1c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm1cm1c1_weight(0), cm1cm1cm1c1_weight(1));
    PL_STEP_0_for_c0cm1c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm1c0c0_weight(0), c0cm1c0c0_weight(1));
    PL_STEP_0_for_cm4c1c1c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4c1c1c1_weight(0), cm4c1c1c1_weight(1));
    PL_STEP_0_for_c0c0cm1cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0cm1cm1_weight(0), c0c0cm1cm1_weight(1));
    PL_STEP_0_for_c0c1cm1cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c1cm1cm1_weight(0), c0c1cm1cm1_weight(1));
    PL_STEP_0_for_c1cm1c0cm11_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm1c0cm11_weight(0), c1cm1c0cm11_weight(1));
    PL_STEP_0_for_c1cm3c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm3c0c0_weight(0), c1cm3c0c0_weight(1));
    PL_STEP_0_for_c0cm7c0cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm7c0cm1_weight(0), c0cm7c0cm1_weight(1));
    PL_STEP_0_for_c0c1c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c1c0c0_weight(0), c0c1c0c0_weight(1));
    PL_STEP_0_for_cm1cm1cm1cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm1cm1cm1_weight(0), cm1cm1cm1cm1_weight(1));
    PL_STEP_0_for_cm1c0c2c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c0c2c2_weight(0), cm1c0c2c2_weight(1));
    PL_STEP_0_for_cm1cm1c7c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm1c7c0_weight(0), cm1cm1c7c0_weight(1));
    PL_STEP_0_for_c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0_weight(0), c0c0c0c0_weight(1));


    c1cm1c0cm11_cm1cm1cm1cm1_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 5,
			B_WIDTH => 1,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c1cm1c0cm11_weight(1)(5-1 downto 0),
			B	=> cm1cm1cm1cm1_weight(1)(1-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1cm1c0cm11,
			CxB => R_cm1cm1cm1cm1
		);

    c0cm7c0cm1_c0c0cm1cm1_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 4,
			B_WIDTH => 1,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c0cm7c0cm1_weight(1)(4-1 downto 0),
			B	=> c0c0cm1cm1_weight(1)(1-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0cm7c0cm1,
			CxB => R_c0c0cm1cm1
		);

    cm1cm1c7c0_c0cm1c0c0_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 4,
			B_WIDTH => 1,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm1cm1c7c0_weight(1)(4-1 downto 0),
			B	=> c0cm1c0c0_weight(1)(1-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1cm1c7c0,
			CxB => R_c0cm1c0c0
		);

    c1c0c0cm3_c0c1c0c0_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 3,
			B_WIDTH => 2,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c1c0c0cm3_weight(1)(3-1 downto 0),
			B	=> c0c1c0c0_weight(1)(2-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1c0c0cm3,
			CxB => R_c0c1c0c0
		);

    c0c2c0c2_c0c1cm1cm1_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 3,
			B_WIDTH => 2,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c0c2c0c2_weight(1)(3-1 downto 0),
			B	=> c0c1cm1cm1_weight(1)(2-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c2c0c2,
			CxB => R_c0c1cm1cm1
		);

    c0cm3c0c1_cm1cm1cm1c1_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 3,
			B_WIDTH => 2,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c0cm3c0c1_weight(1)(3-1 downto 0),
			B	=> cm1cm1cm1c1_weight(1)(2-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0cm3c0c1,
			CxB => R_cm1cm1cm1c1
		);

    c3cm1c2c3_cm1c0c2c2_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 3,
			B_WIDTH => 3,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c3cm1c2c3_weight(1)(3-1 downto 0),
			B	=> cm1c0c2c2_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c3cm1c2c3,
			CxB => R_cm1c0c2c2
		);

    cm4c1c1c1_c1cm3c0c0_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 3,
			B_WIDTH => 3,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm4c1c1c1_weight(1)(3-1 downto 0),
			B	=> c1cm3c0c0_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm4c1c1c1,
			CxB => R_c1cm3c0c0
		);




end architecture;
