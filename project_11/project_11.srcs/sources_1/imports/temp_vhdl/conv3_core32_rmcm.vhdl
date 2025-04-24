library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv3_core32_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(4-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        R_c7cm6cm4c8 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_c0cm2cm4cm2 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_c4c0c0cm3 : out std_logic_vector(11-1 downto 0);   --	sfix(4, -7)
        R_c1cm2c3cm2 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_c0c18c21c2 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_c3c0c0c0 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_c0cm1c0c3 : out std_logic_vector(10-1 downto 0);   --	sfix(3, -7)
        R_c22cm57c1c26 : out std_logic_vector(14-1 downto 0);   --	sfix(7, -7)
        R_cm24c0c0cm4 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_c7c1c1cm25 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_c1c0c0cm10 : out std_logic_vector(12-1 downto 0);   --	sfix(5, -7)
        R_c8cm42c0c0 : out std_logic_vector(14-1 downto 0);   --	sfix(7, -7)
        R_cm3c0cm2c30 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_c24cm3cm1cm8 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_c5cm1c0cm20 : out std_logic_vector(13-1 downto 0);   --	sfix(6, -7)
        R_c0c0c0c0 : out std_logic_vector(8-1 downto 0)  --	sfix(1, -7)
    );
end conv3_core32_rmcm;

architecture arch of conv3_core32_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_C7CM6CM4C8_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM2CM4CM2_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4C0C0CM3_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM2C3CM2_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C18C21C2_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C0C0C0_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM1C0C3_WEIGHT     is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C22CM57C1C26_WEIGHT  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM24C0C0CM4_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C7C1C1CM25_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C0C0CM10_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C8CM42C0C0_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3C0CM2C30_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C24CM3CM1CM8_WEIGHT  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5CM1C0CM20_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(5, -2)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(3, -5)
    signal c7cm6cm4c8_weight    : PIPELINE_TYPE_FOR_C7CM6CM4C8_WEIGHT;
    -- sfix(3, -5)
    signal c0cm2cm4cm2_weight   : PIPELINE_TYPE_FOR_C0CM2CM4CM2_WEIGHT;
    -- sfix(3, -5)
    signal c4c0c0cm3_weight     : PIPELINE_TYPE_FOR_C4C0C0CM3_WEIGHT;
    -- sfix(3, -5)
    signal c1cm2c3cm2_weight    : PIPELINE_TYPE_FOR_C1CM2C3CM2_WEIGHT;
    -- sfix(3, -5)
    signal c0c18c21c2_weight    : PIPELINE_TYPE_FOR_C0C18C21C2_WEIGHT;
    -- sfix(3, -5)
    signal c3c0c0c0_weight      : PIPELINE_TYPE_FOR_C3C0C0C0_WEIGHT;
    -- sfix(3, -5)
    signal c0cm1c0c3_weight     : PIPELINE_TYPE_FOR_C0CM1C0C3_WEIGHT;
    -- sfix(3, -5)
    signal c22cm57c1c26_weight  : PIPELINE_TYPE_FOR_C22CM57C1C26_WEIGHT;
    -- sfix(3, -5)
    signal cm24c0c0cm4_weight   : PIPELINE_TYPE_FOR_CM24C0C0CM4_WEIGHT;
    -- sfix(3, -5)
    signal c7c1c1cm25_weight    : PIPELINE_TYPE_FOR_C7C1C1CM25_WEIGHT;
    -- sfix(3, -5)
    signal c1c0c0cm10_weight    : PIPELINE_TYPE_FOR_C1C0C0CM10_WEIGHT;
    -- sfix(3, -5)
    signal c8cm42c0c0_weight    : PIPELINE_TYPE_FOR_C8CM42C0C0_WEIGHT;
    -- sfix(3, -5)
    signal cm3c0cm2c30_weight   : PIPELINE_TYPE_FOR_CM3C0CM2C30_WEIGHT;
    -- sfix(3, -5)
    signal c24cm3cm1cm8_weight  : PIPELINE_TYPE_FOR_C24CM3CM1CM8_WEIGHT;
    -- sfix(3, -5)
    signal c5cm1c0cm20_weight   : PIPELINE_TYPE_FOR_C5CM1C0CM20_WEIGHT;
    -- sfix(3, -5)
    signal c0c0c0c0_weight      : PIPELINE_TYPE_FOR_C0C0C0C0_WEIGHT;

    -- The zero output
    signal c0c0c0c0 : std_logic_vector(8-1 downto 0); --	sfix(1, -7)

    -- If we use LUT multiplier and the input is unsigned, we have to cut away the msb of the result
    -- If this is the case, the temporary results are stored in the signals below.

    signal R_c5cm1c0cm20_undelayed : std_logic_vector(13-1 downto 0);


begin
    c0c0c0c0 <= (others => '0');
    R_c0c0c0c0 <= c0c0c0c0;
    X0_signal(0) <= X0;



    WEIGHT_ROM: entity work.conv3_core32_rmcm_weightsconstant_memory
        generic map
        (
            XI_WIDTH        	          => 8, 
            ARRAY_SIZE                    => 4,
            WORDS_PER_ADDR                => 15
        )
        port map
        (
            clk => clk,
            data_index => unsigned(SEL),
        
            dout1   => c7cm6cm4c8_weight(0), 
            dout2   => c0cm2cm4cm2_weight(0), 
            dout3   => c4c0c0cm3_weight(0), 
            dout4   => c1cm2c3cm2_weight(0), 
            dout5   => c0c18c21c2_weight(0), 
            dout6   => c3c0c0c0_weight(0), 
            dout7   => c0cm1c0c3_weight(0), 
            dout8   => c22cm57c1c26_weight(0), 
            dout9   => cm24c0c0cm4_weight(0), 
            dout10   => c7c1c1cm25_weight(0), 
            dout11   => c1c0c0cm10_weight(0), 
            dout12   => c8cm42c0c0_weight(0), 
            dout13   => cm3c0cm2c30_weight(0), 
            dout14   => c24cm3cm1cm8_weight(0), 
            dout15   => c5cm1c0cm20_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_c7cm6cm4c8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c7cm6cm4c8_weight(0), c7cm6cm4c8_weight(1));
    PL_STEP_0_for_c0cm2cm4cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm2cm4cm2_weight(0), c0cm2cm4cm2_weight(1));
    PL_STEP_0_for_c4c0c0cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4c0c0cm3_weight(0), c4c0c0cm3_weight(1));
    PL_STEP_0_for_c1cm2c3cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm2c3cm2_weight(0), c1cm2c3cm2_weight(1));
    PL_STEP_0_for_c0c18c21c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c18c21c2_weight(0), c0c18c21c2_weight(1));
    PL_STEP_0_for_c3c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c0c0c0_weight(0), c3c0c0c0_weight(1));
    PL_STEP_0_for_c0cm1c0c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm1c0c3_weight(0), c0cm1c0c3_weight(1));
    PL_STEP_0_for_c22cm57c1c26_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c22cm57c1c26_weight(0), c22cm57c1c26_weight(1));
    PL_STEP_0_for_cm24c0c0cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm24c0c0cm4_weight(0), cm24c0c0cm4_weight(1));
    PL_STEP_0_for_c7c1c1cm25_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c7c1c1cm25_weight(0), c7c1c1cm25_weight(1));
    PL_STEP_0_for_c1c0c0cm10_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c0c0cm10_weight(0), c1c0c0cm10_weight(1));
    PL_STEP_0_for_c8cm42c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c8cm42c0c0_weight(0), c8cm42c0c0_weight(1));
    PL_STEP_0_for_cm3c0cm2c30_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3c0cm2c30_weight(0), cm3c0cm2c30_weight(1));
    PL_STEP_0_for_c24cm3cm1cm8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c24cm3cm1cm8_weight(0), c24cm3cm1cm8_weight(1));
    PL_STEP_0_for_c5cm1c0cm20_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5cm1c0cm20_weight(0), c5cm1c0cm20_weight(1));
    PL_STEP_0_for_c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0_weight(0), c0c0c0c0_weight(1));


    c22cm57c1c26_c0cm1c0c3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c22cm57c1c26_weight(1)(7-1 downto 0),
			B	=> c0cm1c0c3_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c22cm57c1c26,
			CxB => R_c0cm1c0c3
		);

    c8cm42c0c0_c3c0c0c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c8cm42c0c0_weight(1)(7-1 downto 0),
			B	=> c3c0c0c0_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c8cm42c0c0,
			CxB => R_c3c0c0c0
		);

    c0c18c21c2_c1cm2c3cm2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0c18c21c2_weight(1)(6-1 downto 0),
			B	=> c1cm2c3cm2_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c18c21c2,
			CxB => R_c1cm2c3cm2
		);

    cm24c0c0cm4_c0cm2cm4cm2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm24c0c0cm4_weight(1)(6-1 downto 0),
			B	=> c0cm2cm4cm2_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm24c0c0cm4,
			CxB => R_c0cm2cm4cm2
		);

    c7c1c1cm25_c4c0c0cm3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c7c1c1cm25_weight(1)(6-1 downto 0),
			B	=> c4c0c0cm3_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c7c1c1cm25,
			CxB => R_c4c0c0cm3
		);

    cm3c0cm2c30_c1c0c0cm10_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm3c0cm2c30_weight(1)(6-1 downto 0),
			B	=> c1c0c0cm10_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm3c0cm2c30,
			CxB => R_c1c0c0cm10
		);

    c24cm3cm1cm8_c7cm6cm4c8_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c24cm3cm1cm8_weight(1)(6-1 downto 0),
			B	=> c7cm6cm4c8_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c24cm3cm1cm8,
			CxB => R_c7cm6cm4c8
		);




    c5cm1c0cm20_MULT: entity work.TruncatedSingleMult
	generic map
		(
            A_WIDTH           => 8, --	sfix(3, -5)
            A_TRUNCATED_WIDTH => 6, -- This would be the MSB position of the weight
            B_WIDTH           => 7, --	ufix(5, -2)
            AxB_WIDTH         => 13, --	sfix(6, -7)
            AxB_FRAC_TRUNCATION => 0,
            B_IS_SIGNED       => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c5cm1c0cm20_weight(1),
			B	=> X0_signal(1),
			AxB	=> R_c5cm1c0cm20
		);

end architecture;
