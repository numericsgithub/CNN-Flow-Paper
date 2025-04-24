library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv3_core17_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(4-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        R_c0cm4cm2cm2 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_cm2c4cm8c25 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_c2c57c0c4 : out std_logic_vector(14-1 downto 0);   --	sfix(7, -7)
        R_c8c13cm1c8 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_c2c6c1c2 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_c0cm4c0c0 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_cm11c2c17c0 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_c3cm2c0c5 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_cm1cm2cm1c8 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_c4c11c0cm1 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_cm4c7c4c2 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_c9c1c1c3 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_c2c0c0c0 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_c4c10c7c0 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_c11c1c10cm1 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_c0cm1cm1cm3 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_c0c0c0c0 : out std_logic_vector(8-1 downto 0)  --	sfix(1, -7)
    );
end conv3_core17_rmcm;

architecture arch of conv3_core17_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM4CM2CM2_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C4CM8C25_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C57C0C4_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C8C13CM1C8_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C6C1C2_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM4C0C0_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM11C2C17C0_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3CM2C0C5_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM2CM1C8_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4C11C0CM1_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4C7C4C2_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C9C1C1C3_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C0C0C0_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4C10C7C0_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C11C1C10CM1_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM1CM1CM3_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(5, -2)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(3, -5)
    signal c0cm4cm2cm2_weight   : PIPELINE_TYPE_FOR_C0CM4CM2CM2_WEIGHT;
    -- sfix(3, -5)
    signal cm2c4cm8c25_weight   : PIPELINE_TYPE_FOR_CM2C4CM8C25_WEIGHT;
    -- sfix(3, -5)
    signal c2c57c0c4_weight     : PIPELINE_TYPE_FOR_C2C57C0C4_WEIGHT;
    -- sfix(3, -5)
    signal c8c13cm1c8_weight    : PIPELINE_TYPE_FOR_C8C13CM1C8_WEIGHT;
    -- sfix(3, -5)
    signal c2c6c1c2_weight      : PIPELINE_TYPE_FOR_C2C6C1C2_WEIGHT;
    -- sfix(3, -5)
    signal c0cm4c0c0_weight     : PIPELINE_TYPE_FOR_C0CM4C0C0_WEIGHT;
    -- sfix(3, -5)
    signal cm11c2c17c0_weight   : PIPELINE_TYPE_FOR_CM11C2C17C0_WEIGHT;
    -- sfix(3, -5)
    signal c3cm2c0c5_weight     : PIPELINE_TYPE_FOR_C3CM2C0C5_WEIGHT;
    -- sfix(3, -5)
    signal cm1cm2cm1c8_weight   : PIPELINE_TYPE_FOR_CM1CM2CM1C8_WEIGHT;
    -- sfix(3, -5)
    signal c4c11c0cm1_weight    : PIPELINE_TYPE_FOR_C4C11C0CM1_WEIGHT;
    -- sfix(3, -5)
    signal cm4c7c4c2_weight     : PIPELINE_TYPE_FOR_CM4C7C4C2_WEIGHT;
    -- sfix(3, -5)
    signal c9c1c1c3_weight      : PIPELINE_TYPE_FOR_C9C1C1C3_WEIGHT;
    -- sfix(3, -5)
    signal c2c0c0c0_weight      : PIPELINE_TYPE_FOR_C2C0C0C0_WEIGHT;
    -- sfix(3, -5)
    signal c4c10c7c0_weight     : PIPELINE_TYPE_FOR_C4C10C7C0_WEIGHT;
    -- sfix(3, -5)
    signal c11c1c10cm1_weight   : PIPELINE_TYPE_FOR_C11C1C10CM1_WEIGHT;
    -- sfix(3, -5)
    signal c0cm1cm1cm3_weight   : PIPELINE_TYPE_FOR_C0CM1CM1CM3_WEIGHT;
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



    WEIGHT_ROM: entity work.conv3_core17_rmcm_weightsconstant_memory
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
        
            dout1   => c0cm4cm2cm2_weight(0), 
            dout2   => cm2c4cm8c25_weight(0), 
            dout3   => c2c57c0c4_weight(0), 
            dout4   => c8c13cm1c8_weight(0), 
            dout5   => c2c6c1c2_weight(0), 
            dout6   => c0cm4c0c0_weight(0), 
            dout7   => cm11c2c17c0_weight(0), 
            dout8   => c3cm2c0c5_weight(0), 
            dout9   => cm1cm2cm1c8_weight(0), 
            dout10   => c4c11c0cm1_weight(0), 
            dout11   => cm4c7c4c2_weight(0), 
            dout12   => c9c1c1c3_weight(0), 
            dout13   => c2c0c0c0_weight(0), 
            dout14   => c4c10c7c0_weight(0), 
            dout15   => c11c1c10cm1_weight(0), 
            dout16   => c0cm1cm1cm3_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_c0cm4cm2cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm4cm2cm2_weight(0), c0cm4cm2cm2_weight(1));
    PL_STEP_0_for_cm2c4cm8c25_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c4cm8c25_weight(0), cm2c4cm8c25_weight(1));
    PL_STEP_0_for_c2c57c0c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c57c0c4_weight(0), c2c57c0c4_weight(1));
    PL_STEP_0_for_c8c13cm1c8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c8c13cm1c8_weight(0), c8c13cm1c8_weight(1));
    PL_STEP_0_for_c2c6c1c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c6c1c2_weight(0), c2c6c1c2_weight(1));
    PL_STEP_0_for_c0cm4c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm4c0c0_weight(0), c0cm4c0c0_weight(1));
    PL_STEP_0_for_cm11c2c17c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm11c2c17c0_weight(0), cm11c2c17c0_weight(1));
    PL_STEP_0_for_c3cm2c0c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3cm2c0c5_weight(0), c3cm2c0c5_weight(1));
    PL_STEP_0_for_cm1cm2cm1c8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm2cm1c8_weight(0), cm1cm2cm1c8_weight(1));
    PL_STEP_0_for_c4c11c0cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4c11c0cm1_weight(0), c4c11c0cm1_weight(1));
    PL_STEP_0_for_cm4c7c4c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4c7c4c2_weight(0), cm4c7c4c2_weight(1));
    PL_STEP_0_for_c9c1c1c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c9c1c1c3_weight(0), c9c1c1c3_weight(1));
    PL_STEP_0_for_c2c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c0c0c0_weight(0), c2c0c0c0_weight(1));
    PL_STEP_0_for_c4c10c7c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4c10c7c0_weight(0), c4c10c7c0_weight(1));
    PL_STEP_0_for_c11c1c10cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c11c1c10cm1_weight(0), c11c1c10cm1_weight(1));
    PL_STEP_0_for_c0cm1cm1cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm1cm1cm3_weight(0), c0cm1cm1cm3_weight(1));
    PL_STEP_0_for_c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0_weight(0), c0c0c0c0_weight(1));


    c2c57c0c4_c0cm1cm1cm3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c2c57c0c4_weight(1)(7-1 downto 0),
			B	=> c0cm1cm1cm3_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c2c57c0c4,
			CxB => R_c0cm1cm1cm3
		);

    cm2c4cm8c25_c2c0c0c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2c4cm8c25_weight(1)(6-1 downto 0),
			B	=> c2c0c0c0_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2c4cm8c25,
			CxB => R_c2c0c0c0
		);

    cm11c2c17c0_c0cm4c0c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm11c2c17c0_weight(1)(6-1 downto 0),
			B	=> c0cm4c0c0_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm11c2c17c0,
			CxB => R_c0cm4c0c0
		);

    c8c13cm1c8_c0cm4cm2cm2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c8c13cm1c8_weight(1)(5-1 downto 0),
			B	=> c0cm4cm2cm2_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c8c13cm1c8,
			CxB => R_c0cm4cm2cm2
		);

    cm1cm2cm1c8_cm4c7c4c2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm1cm2cm1c8_weight(1)(5-1 downto 0),
			B	=> cm4c7c4c2_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1cm2cm1c8,
			CxB => R_cm4c7c4c2
		);

    c4c11c0cm1_c3cm2c0c5_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c4c11c0cm1_weight(1)(5-1 downto 0),
			B	=> c3cm2c0c5_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c4c11c0cm1,
			CxB => R_c3cm2c0c5
		);

    c9c1c1c3_c2c6c1c2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c9c1c1c3_weight(1)(5-1 downto 0),
			B	=> c2c6c1c2_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c9c1c1c3,
			CxB => R_c2c6c1c2
		);

    c4c10c7c0_c11c1c10cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c4c10c7c0_weight(1)(5-1 downto 0),
			B	=> c11c1c10cm1_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c4c10c7c0,
			CxB => R_c11c1c10cm1
		);




end architecture;
