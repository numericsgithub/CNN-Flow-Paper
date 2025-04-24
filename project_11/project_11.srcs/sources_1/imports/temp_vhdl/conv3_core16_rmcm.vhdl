library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv3_core16_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(4-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        R_cm9c10cm30c0 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_c1cm2c0c0 : out std_logic_vector(9-1 downto 0);   --	sfix(2, -7)
        R_c6c0c0c7 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_c0c1c3cm3 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_cm2c85cm1cm1 : out std_logic_vector(15-1 downto 0);   --	sfix(8, -7)
        R_c4cm1c0c0 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_cm1c1c1cm8 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_c43cm73c3cm26 : out std_logic_vector(15-1 downto 0);   --	sfix(8, -7)
        R_cm24c0cm8c4 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_cm49cm1c0c0 : out std_logic_vector(14-1 downto 0);   --	sfix(7, -7)
        R_cm3cm4cm1c2 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_c0c0c0c8 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_cm12c4c0c0 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_cm2cm1cm3c18 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_c2c7c2cm27 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_cm4cm1c0c8 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_c0c0c0c0 : out std_logic_vector(8-1 downto 0)  --	sfix(1, -7)
    );
end conv3_core16_rmcm;

architecture arch of conv3_core16_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_CM9C10CM30C0_WEIGHT  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM2C0C0_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6C0C0C7_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C1C3CM3_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C85CM1CM1_WEIGHT  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4CM1C0C0_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C1C1CM8_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C43CM73C3CM26_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM24C0CM8C4_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM49CM1C0C0_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3CM4CM1C2_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C8_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM12C4C0C0_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM1CM3C18_WEIGHT  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C7C2CM27_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4CM1C0C8_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(5, -2)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(3, -5)
    signal cm9c10cm30c0_weight  : PIPELINE_TYPE_FOR_CM9C10CM30C0_WEIGHT;
    -- sfix(3, -5)
    signal c1cm2c0c0_weight     : PIPELINE_TYPE_FOR_C1CM2C0C0_WEIGHT;
    -- sfix(3, -5)
    signal c6c0c0c7_weight      : PIPELINE_TYPE_FOR_C6C0C0C7_WEIGHT;
    -- sfix(3, -5)
    signal c0c1c3cm3_weight     : PIPELINE_TYPE_FOR_C0C1C3CM3_WEIGHT;
    -- sfix(3, -5)
    signal cm2c85cm1cm1_weight  : PIPELINE_TYPE_FOR_CM2C85CM1CM1_WEIGHT;
    -- sfix(3, -5)
    signal c4cm1c0c0_weight     : PIPELINE_TYPE_FOR_C4CM1C0C0_WEIGHT;
    -- sfix(3, -5)
    signal cm1c1c1cm8_weight    : PIPELINE_TYPE_FOR_CM1C1C1CM8_WEIGHT;
    -- sfix(3, -5)
    signal c43cm73c3cm26_weight : PIPELINE_TYPE_FOR_C43CM73C3CM26_WEIGHT;
    -- sfix(3, -5)
    signal cm24c0cm8c4_weight   : PIPELINE_TYPE_FOR_CM24C0CM8C4_WEIGHT;
    -- sfix(3, -5)
    signal cm49cm1c0c0_weight   : PIPELINE_TYPE_FOR_CM49CM1C0C0_WEIGHT;
    -- sfix(3, -5)
    signal cm3cm4cm1c2_weight   : PIPELINE_TYPE_FOR_CM3CM4CM1C2_WEIGHT;
    -- sfix(3, -5)
    signal c0c0c0c8_weight      : PIPELINE_TYPE_FOR_C0C0C0C8_WEIGHT;
    -- sfix(3, -5)
    signal cm12c4c0c0_weight    : PIPELINE_TYPE_FOR_CM12C4C0C0_WEIGHT;
    -- sfix(3, -5)
    signal cm2cm1cm3c18_weight  : PIPELINE_TYPE_FOR_CM2CM1CM3C18_WEIGHT;
    -- sfix(3, -5)
    signal c2c7c2cm27_weight    : PIPELINE_TYPE_FOR_C2C7C2CM27_WEIGHT;
    -- sfix(3, -5)
    signal cm4cm1c0c8_weight    : PIPELINE_TYPE_FOR_CM4CM1C0C8_WEIGHT;
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



    WEIGHT_ROM: entity work.conv3_core16_rmcm_weightsconstant_memory
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
        
            dout1   => cm9c10cm30c0_weight(0), 
            dout2   => c1cm2c0c0_weight(0), 
            dout3   => c6c0c0c7_weight(0), 
            dout4   => c0c1c3cm3_weight(0), 
            dout5   => cm2c85cm1cm1_weight(0), 
            dout6   => c4cm1c0c0_weight(0), 
            dout7   => cm1c1c1cm8_weight(0), 
            dout8   => c43cm73c3cm26_weight(0), 
            dout9   => cm24c0cm8c4_weight(0), 
            dout10   => cm49cm1c0c0_weight(0), 
            dout11   => cm3cm4cm1c2_weight(0), 
            dout12   => c0c0c0c8_weight(0), 
            dout13   => cm12c4c0c0_weight(0), 
            dout14   => cm2cm1cm3c18_weight(0), 
            dout15   => c2c7c2cm27_weight(0), 
            dout16   => cm4cm1c0c8_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_cm9c10cm30c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm9c10cm30c0_weight(0), cm9c10cm30c0_weight(1));
    PL_STEP_0_for_c1cm2c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm2c0c0_weight(0), c1cm2c0c0_weight(1));
    PL_STEP_0_for_c6c0c0c7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6c0c0c7_weight(0), c6c0c0c7_weight(1));
    PL_STEP_0_for_c0c1c3cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c1c3cm3_weight(0), c0c1c3cm3_weight(1));
    PL_STEP_0_for_cm2c85cm1cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c85cm1cm1_weight(0), cm2c85cm1cm1_weight(1));
    PL_STEP_0_for_c4cm1c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4cm1c0c0_weight(0), c4cm1c0c0_weight(1));
    PL_STEP_0_for_cm1c1c1cm8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c1c1cm8_weight(0), cm1c1c1cm8_weight(1));
    PL_STEP_0_for_c43cm73c3cm26_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c43cm73c3cm26_weight(0), c43cm73c3cm26_weight(1));
    PL_STEP_0_for_cm24c0cm8c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm24c0cm8c4_weight(0), cm24c0cm8c4_weight(1));
    PL_STEP_0_for_cm49cm1c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm49cm1c0c0_weight(0), cm49cm1c0c0_weight(1));
    PL_STEP_0_for_cm3cm4cm1c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3cm4cm1c2_weight(0), cm3cm4cm1c2_weight(1));
    PL_STEP_0_for_c0c0c0c8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c8_weight(0), c0c0c0c8_weight(1));
    PL_STEP_0_for_cm12c4c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm12c4c0c0_weight(0), cm12c4c0c0_weight(1));
    PL_STEP_0_for_cm2cm1cm3c18_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm1cm3c18_weight(0), cm2cm1cm3c18_weight(1));
    PL_STEP_0_for_c2c7c2cm27_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c7c2cm27_weight(0), c2c7c2cm27_weight(1));
    PL_STEP_0_for_cm4cm1c0c8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4cm1c0c8_weight(0), cm4cm1c0c8_weight(1));
    PL_STEP_0_for_c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0_weight(0), c0c0c0c0_weight(1));


    cm2c85cm1cm1_c1cm2c0c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2c85cm1cm1_weight(1)(8-1 downto 0),
			B	=> c1cm2c0c0_weight(1)(2-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2c85cm1cm1,
			CxB => R_c1cm2c0c0
		);

    c43cm73c3cm26_cm3cm4cm1c2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c43cm73c3cm26_weight(1)(8-1 downto 0),
			B	=> cm3cm4cm1c2_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c43cm73c3cm26,
			CxB => R_cm3cm4cm1c2
		);

    cm49cm1c0c0_c0c1c3cm3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm49cm1c0c0_weight(1)(7-1 downto 0),
			B	=> c0c1c3cm3_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm49cm1c0c0,
			CxB => R_c0c1c3cm3
		);

    cm9c10cm30c0_cm1c1c1cm8_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm9c10cm30c0_weight(1)(6-1 downto 0),
			B	=> cm1c1c1cm8_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm9c10cm30c0,
			CxB => R_cm1c1c1cm8
		);

    cm24c0cm8c4_c4cm1c0c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm24c0cm8c4_weight(1)(6-1 downto 0),
			B	=> c4cm1c0c0_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm24c0cm8c4,
			CxB => R_c4cm1c0c0
		);

    cm2cm1cm3c18_c6c0c0c7_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2cm1cm3c18_weight(1)(6-1 downto 0),
			B	=> c6c0c0c7_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2cm1cm3c18,
			CxB => R_c6c0c0c7
		);

    c2c7c2cm27_cm4cm1c0c8_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c2c7c2cm27_weight(1)(6-1 downto 0),
			B	=> cm4cm1c0c8_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c2c7c2cm27,
			CxB => R_cm4cm1c0c8
		);

    c0c0c0c8_cm12c4c0c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0c0c0c8_weight(1)(5-1 downto 0),
			B	=> cm12c4c0c0_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c0c0c8,
			CxB => R_cm12c4c0c0
		);




end architecture;
