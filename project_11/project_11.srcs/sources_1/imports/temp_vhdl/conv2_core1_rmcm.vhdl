library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv2_core1_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(4-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        R_cm2c4c0cm36 : out std_logic_vector(14-1 downto 0);   --	sfix(10, -4)
        R_cm2c5c0cm35 : out std_logic_vector(14-1 downto 0);   --	sfix(10, -4)
        R_cm3c5c0cm28 : out std_logic_vector(13-1 downto 0);   --	sfix(9, -4)
        R_cm1c6c0c18 : out std_logic_vector(13-1 downto 0);   --	sfix(9, -4)
        R_cm1c4c1c37 : out std_logic_vector(14-1 downto 0);   --	sfix(10, -4)
        R_cm2c6c0cm2 : out std_logic_vector(11-1 downto 0);   --	sfix(7, -4)
        R_cm2c1c0c45 : out std_logic_vector(14-1 downto 0);   --	sfix(10, -4)
        R_cm1c3c1c39 : out std_logic_vector(14-1 downto 0);   --	sfix(10, -4)
        R_cm2c4c0cm15 : out std_logic_vector(12-1 downto 0);   --	sfix(8, -4)
        R_c0c0c0c0 : out std_logic_vector(5-1 downto 0)  --	sfix(1, -4)
    );
end conv2_core1_rmcm;

architecture arch of conv2_core1_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C4C0CM36_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C5C0CM35_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3C5C0CM28_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C6C0C18_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C4C1C37_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C6C0CM2_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C1C0C45_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C3C1C39_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C4C0CM15_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(4, -3)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(7, -1)
    signal cm2c4c0cm36_weight   : PIPELINE_TYPE_FOR_CM2C4C0CM36_WEIGHT;
    -- sfix(7, -1)
    signal cm2c5c0cm35_weight   : PIPELINE_TYPE_FOR_CM2C5C0CM35_WEIGHT;
    -- sfix(7, -1)
    signal cm3c5c0cm28_weight   : PIPELINE_TYPE_FOR_CM3C5C0CM28_WEIGHT;
    -- sfix(7, -1)
    signal cm1c6c0c18_weight    : PIPELINE_TYPE_FOR_CM1C6C0C18_WEIGHT;
    -- sfix(7, -1)
    signal cm1c4c1c37_weight    : PIPELINE_TYPE_FOR_CM1C4C1C37_WEIGHT;
    -- sfix(7, -1)
    signal cm2c6c0cm2_weight    : PIPELINE_TYPE_FOR_CM2C6C0CM2_WEIGHT;
    -- sfix(7, -1)
    signal cm2c1c0c45_weight    : PIPELINE_TYPE_FOR_CM2C1C0C45_WEIGHT;
    -- sfix(7, -1)
    signal cm1c3c1c39_weight    : PIPELINE_TYPE_FOR_CM1C3C1C39_WEIGHT;
    -- sfix(7, -1)
    signal cm2c4c0cm15_weight   : PIPELINE_TYPE_FOR_CM2C4C0CM15_WEIGHT;
    -- sfix(7, -1)
    signal c0c0c0c0_weight      : PIPELINE_TYPE_FOR_C0C0C0C0_WEIGHT;

    -- The zero output
    signal c0c0c0c0 : std_logic_vector(5-1 downto 0); --	sfix(1, -4)

    -- If we use LUT multiplier and the input is unsigned, we have to cut away the msb of the result
    -- If this is the case, the temporary results are stored in the signals below.

    signal R_cm1c3c1c39_undelayed : std_logic_vector(14-1 downto 0);


begin
    c0c0c0c0 <= (others => '0');
    R_c0c0c0c0 <= c0c0c0c0;
    X0_signal(0) <= X0;



    WEIGHT_ROM: entity work.conv2_core1_rmcm_weightsconstant_memory
        generic map
        (
            XI_WIDTH        	          => 8, 
            ARRAY_SIZE                    => 4,
            WORDS_PER_ADDR                => 9
        )
        port map
        (
            clk => clk,
            data_index => unsigned(SEL),
        
            dout1   => cm2c4c0cm36_weight(0), 
            dout2   => cm2c5c0cm35_weight(0), 
            dout3   => cm3c5c0cm28_weight(0), 
            dout4   => cm1c6c0c18_weight(0), 
            dout5   => cm1c4c1c37_weight(0), 
            dout6   => cm2c6c0cm2_weight(0), 
            dout7   => cm2c1c0c45_weight(0), 
            dout8   => cm1c3c1c39_weight(0), 
            dout9   => cm2c4c0cm15_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_cm2c4c0cm36_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c4c0cm36_weight(0), cm2c4c0cm36_weight(1));
    PL_STEP_0_for_cm2c5c0cm35_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c5c0cm35_weight(0), cm2c5c0cm35_weight(1));
    PL_STEP_0_for_cm3c5c0cm28_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3c5c0cm28_weight(0), cm3c5c0cm28_weight(1));
    PL_STEP_0_for_cm1c6c0c18_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c6c0c18_weight(0), cm1c6c0c18_weight(1));
    PL_STEP_0_for_cm1c4c1c37_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c4c1c37_weight(0), cm1c4c1c37_weight(1));
    PL_STEP_0_for_cm2c6c0cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c6c0cm2_weight(0), cm2c6c0cm2_weight(1));
    PL_STEP_0_for_cm2c1c0c45_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c1c0c45_weight(0), cm2c1c0c45_weight(1));
    PL_STEP_0_for_cm1c3c1c39_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c3c1c39_weight(0), cm1c3c1c39_weight(1));
    PL_STEP_0_for_cm2c4c0cm15_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c4c0cm15_weight(0), cm2c4c0cm15_weight(1));
    PL_STEP_0_for_c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0_weight(0), c0c0c0c0_weight(1));


    cm2c4c0cm36_cm2c6c0cm2_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 4,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm2c4c0cm36_weight(1)(7-1 downto 0),
			B	=> cm2c6c0cm2_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2c4c0cm36,
			CxB => R_cm2c6c0cm2
		);

    cm2c5c0cm35_cm2c4c0cm15_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 5,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm2c5c0cm35_weight(1)(7-1 downto 0),
			B	=> cm2c4c0cm15_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2c5c0cm35,
			CxB => R_cm2c4c0cm15
		);

    cm1c4c1c37_cm1c6c0c18_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 6,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm1c4c1c37_weight(1)(7-1 downto 0),
			B	=> cm1c6c0c18_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1c4c1c37,
			CxB => R_cm1c6c0c18
		);

    cm2c1c0c45_cm3c5c0cm28_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 6,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm2c1c0c45_weight(1)(7-1 downto 0),
			B	=> cm3c5c0cm28_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2c1c0c45,
			CxB => R_cm3c5c0cm28
		);




    cm1c3c1c39_MULT: entity work.TruncatedSingleMult
	generic map
		(
            A_WIDTH           => 8, --	sfix(7, -1)
            A_TRUNCATED_WIDTH => 7, -- This would be the MSB position of the weight
            B_WIDTH           => 7, --	ufix(4, -3)
            AxB_WIDTH         => 14, --	sfix(10, -4)
            AxB_FRAC_TRUNCATION => 0,
            B_IS_SIGNED       => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm1c3c1c39_weight(1),
			B	=> X0_signal(1),
			AxB	=> R_cm1c3c1c39
		);

end architecture;
