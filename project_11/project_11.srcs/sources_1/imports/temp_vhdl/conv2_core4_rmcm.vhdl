library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv2_core4_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(4-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        R_cm13c0c1c7 : out std_logic_vector(12-1 downto 0);   --	sfix(8, -4)
        R_cm13c0c7c1 : out std_logic_vector(12-1 downto 0);   --	sfix(8, -4)
        R_cm15c0c0cm25 : out std_logic_vector(13-1 downto 0);   --	sfix(9, -4)
        R_cm6c1cm1cm17 : out std_logic_vector(13-1 downto 0);   --	sfix(9, -4)
        R_cm11cm2cm6cm22 : out std_logic_vector(13-1 downto 0);   --	sfix(9, -4)
        R_cm9c0c0cm37 : out std_logic_vector(14-1 downto 0);   --	sfix(10, -4)
        R_cm8c0c0cm21 : out std_logic_vector(13-1 downto 0);   --	sfix(9, -4)
        R_cm11c0c0cm38 : out std_logic_vector(14-1 downto 0);   --	sfix(10, -4)
        R_cm7c0c0cm5 : out std_logic_vector(11-1 downto 0);   --	sfix(7, -4)
        R_c0c0c0c0 : out std_logic_vector(5-1 downto 0)  --	sfix(1, -4)
    );
end conv2_core4_rmcm;

architecture arch of conv2_core4_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_CM13C0C1C7_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM13C0C7C1_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM15C0C0CM25_WEIGHT  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6C1CM1CM17_WEIGHT  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM11CM2CM6CM22_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM9C0C0CM37_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM8C0C0CM21_WEIGHT   is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM11C0C0CM38_WEIGHT  is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM7C0C0CM5_WEIGHT    is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0_WEIGHT      is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(4, -3)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(7, -1)
    signal cm13c0c1c7_weight    : PIPELINE_TYPE_FOR_CM13C0C1C7_WEIGHT;
    -- sfix(7, -1)
    signal cm13c0c7c1_weight    : PIPELINE_TYPE_FOR_CM13C0C7C1_WEIGHT;
    -- sfix(7, -1)
    signal cm15c0c0cm25_weight  : PIPELINE_TYPE_FOR_CM15C0C0CM25_WEIGHT;
    -- sfix(7, -1)
    signal cm6c1cm1cm17_weight  : PIPELINE_TYPE_FOR_CM6C1CM1CM17_WEIGHT;
    -- sfix(7, -1)
    signal cm11cm2cm6cm22_weight : PIPELINE_TYPE_FOR_CM11CM2CM6CM22_WEIGHT;
    -- sfix(7, -1)
    signal cm9c0c0cm37_weight   : PIPELINE_TYPE_FOR_CM9C0C0CM37_WEIGHT;
    -- sfix(7, -1)
    signal cm8c0c0cm21_weight   : PIPELINE_TYPE_FOR_CM8C0C0CM21_WEIGHT;
    -- sfix(7, -1)
    signal cm11c0c0cm38_weight  : PIPELINE_TYPE_FOR_CM11C0C0CM38_WEIGHT;
    -- sfix(7, -1)
    signal cm7c0c0cm5_weight    : PIPELINE_TYPE_FOR_CM7C0C0CM5_WEIGHT;
    -- sfix(7, -1)
    signal c0c0c0c0_weight      : PIPELINE_TYPE_FOR_C0C0C0C0_WEIGHT;

    -- The zero output
    signal c0c0c0c0 : std_logic_vector(5-1 downto 0); --	sfix(1, -4)

    -- If we use LUT multiplier and the input is unsigned, we have to cut away the msb of the result
    -- If this is the case, the temporary results are stored in the signals below.

    signal R_cm11cm2cm6cm22_undelayed : std_logic_vector(13-1 downto 0);


begin
    c0c0c0c0 <= (others => '0');
    R_c0c0c0c0 <= c0c0c0c0;
    X0_signal(0) <= X0;



    WEIGHT_ROM: entity work.conv2_core4_rmcm_weightsconstant_memory
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
        
            dout1   => cm13c0c1c7_weight(0), 
            dout2   => cm13c0c7c1_weight(0), 
            dout3   => cm15c0c0cm25_weight(0), 
            dout4   => cm6c1cm1cm17_weight(0), 
            dout5   => cm11cm2cm6cm22_weight(0), 
            dout6   => cm9c0c0cm37_weight(0), 
            dout7   => cm8c0c0cm21_weight(0), 
            dout8   => cm11c0c0cm38_weight(0), 
            dout9   => cm7c0c0cm5_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_cm13c0c1c7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm13c0c1c7_weight(0), cm13c0c1c7_weight(1));
    PL_STEP_0_for_cm13c0c7c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm13c0c7c1_weight(0), cm13c0c7c1_weight(1));
    PL_STEP_0_for_cm15c0c0cm25_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm15c0c0cm25_weight(0), cm15c0c0cm25_weight(1));
    PL_STEP_0_for_cm6c1cm1cm17_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6c1cm1cm17_weight(0), cm6c1cm1cm17_weight(1));
    PL_STEP_0_for_cm11cm2cm6cm22_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm11cm2cm6cm22_weight(0), cm11cm2cm6cm22_weight(1));
    PL_STEP_0_for_cm9c0c0cm37_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm9c0c0cm37_weight(0), cm9c0c0cm37_weight(1));
    PL_STEP_0_for_cm8c0c0cm21_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm8c0c0cm21_weight(0), cm8c0c0cm21_weight(1));
    PL_STEP_0_for_cm11c0c0cm38_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm11c0c0cm38_weight(0), cm11c0c0cm38_weight(1));
    PL_STEP_0_for_cm7c0c0cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm7c0c0cm5_weight(0), cm7c0c0cm5_weight(1));
    PL_STEP_0_for_c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0_weight(0), c0c0c0c0_weight(1));


    cm9c0c0cm37_cm7c0c0cm5_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm9c0c0cm37_weight(1)(7-1 downto 0),
			B	=> cm7c0c0cm5_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm9c0c0cm37,
			CxB => R_cm7c0c0cm5
		);

    cm11c0c0cm38_cm13c0c7c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm11c0c0cm38_weight(1)(7-1 downto 0),
			B	=> cm13c0c7c1_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm11c0c0cm38,
			CxB => R_cm13c0c7c1
		);

    cm15c0c0cm25_cm13c0c1c7_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 6,
			B_WIDTH => 5,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm15c0c0cm25_weight(1)(6-1 downto 0),
			B	=> cm13c0c1c7_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm15c0c0cm25,
			CxB => R_cm13c0c1c7
		);

    cm6c1cm1cm17_cm8c0c0cm21_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 6,
			B_WIDTH => 6,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm6c1cm1cm17_weight(1)(6-1 downto 0),
			B	=> cm8c0c0cm21_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm6c1cm1cm17,
			CxB => R_cm8c0c0cm21
		);




    cm11cm2cm6cm22_MULT: entity work.TruncatedSingleMult
	generic map
		(
            A_WIDTH           => 8, --	sfix(7, -1)
            A_TRUNCATED_WIDTH => 6, -- This would be the MSB position of the weight
            B_WIDTH           => 7, --	ufix(4, -3)
            AxB_WIDTH         => 13, --	sfix(9, -4)
            AxB_FRAC_TRUNCATION => 0,
            B_IS_SIGNED       => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm11cm2cm6cm22_weight(1),
			B	=> X0_signal(1),
			AxB	=> R_cm11cm2cm6cm22
		);

end architecture;
