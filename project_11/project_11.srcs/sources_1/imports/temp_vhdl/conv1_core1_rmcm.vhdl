library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv1_core1_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        X0 : in  std_logic_vector(8-1 downto 0); --	sfix(1, -7)
        R_cm8 : out std_logic_vector(12-1 downto 0);   --	sfix(0, -12)
        R_cm6 : out std_logic_vector(12-1 downto 0);   --	sfix(0, -12)
        R_c4 : out std_logic_vector(12-1 downto 0);   --	sfix(0, -12)
        R_cm1 : out std_logic_vector(9-1 downto 0);   --	sfix(-3, -12)
        R_cm3 : out std_logic_vector(11-1 downto 0);   --	sfix(-1, -12)
        R_c1 : out std_logic_vector(10-1 downto 0);   --	sfix(-2, -12)
        R_c12 : out std_logic_vector(13-1 downto 0);   --	sfix(1, -12)
        R_c19 : out std_logic_vector(14-1 downto 0);   --	sfix(2, -12)
        R_c7 : out std_logic_vector(12-1 downto 0);   --	sfix(0, -12)
        R_c22 : out std_logic_vector(14-1 downto 0);   --	sfix(2, -12)
        R_c29 : out std_logic_vector(14-1 downto 0);   --	sfix(2, -12)
        R_c8 : out std_logic_vector(13-1 downto 0);   --	sfix(1, -12)
        R_cm7 : out std_logic_vector(12-1 downto 0);   --	sfix(0, -12)
        R_c27 : out std_logic_vector(14-1 downto 0);   --	sfix(2, -12)
        R_cm45 : out std_logic_vector(15-1 downto 0);   --	sfix(3, -12)
        R_c18 : out std_logic_vector(14-1 downto 0);   --	sfix(2, -12)
        R_c9 : out std_logic_vector(13-1 downto 0);   --	sfix(1, -12)
        R_cm23 : out std_logic_vector(14-1 downto 0);   --	sfix(2, -12)
        R_c15 : out std_logic_vector(13-1 downto 0);   --	sfix(1, -12)
        R_cm4 : out std_logic_vector(11-1 downto 0);   --	sfix(-1, -12)
        R_c3 : out std_logic_vector(11-1 downto 0);   --	sfix(-1, -12)
        R_c17 : out std_logic_vector(14-1 downto 0);   --	sfix(2, -12)
        R_cm14 : out std_logic_vector(13-1 downto 0);   --	sfix(1, -12)
        R_c13 : out std_logic_vector(13-1 downto 0);   --	sfix(1, -12)
        R_cm9 : out std_logic_vector(13-1 downto 0);   --	sfix(1, -12)
        R_c5 : out std_logic_vector(12-1 downto 0);   --	sfix(0, -12)
        R_cm44 : out std_logic_vector(15-1 downto 0);   --	sfix(3, -12)
        R_c39 : out std_logic_vector(15-1 downto 0);   --	sfix(3, -12)
        R_cm37 : out std_logic_vector(15-1 downto 0);   --	sfix(3, -12)
        R_c42 : out std_logic_vector(15-1 downto 0);   --	sfix(3, -12)
        R_cm5 : out std_logic_vector(12-1 downto 0);   --	sfix(0, -12)
        R_cm26 : out std_logic_vector(14-1 downto 0);   --	sfix(2, -12)
        R_cm31 : out std_logic_vector(14-1 downto 0);   --	sfix(2, -12)
        R_cm21 : out std_logic_vector(14-1 downto 0);   --	sfix(2, -12)
        R_cm36 : out std_logic_vector(15-1 downto 0);   --	sfix(3, -12)
        R_cm40 : out std_logic_vector(15-1 downto 0);   --	sfix(3, -12)
        R_cm20 : out std_logic_vector(14-1 downto 0);   --	sfix(2, -12)
        R_cm16 : out std_logic_vector(13-1 downto 0);   --	sfix(1, -12)
        R_cm11 : out std_logic_vector(13-1 downto 0);   --	sfix(1, -12)
        R_c6 : out std_logic_vector(12-1 downto 0);   --	sfix(0, -12)
        R_cm25 : out std_logic_vector(14-1 downto 0);   --	sfix(2, -12)
        R_cm24 : out std_logic_vector(14-1 downto 0);   --	sfix(2, -12)
        R_cm10 : out std_logic_vector(13-1 downto 0);   --	sfix(1, -12)
        R_c36 : out std_logic_vector(15-1 downto 0);   --	sfix(3, -12)
        R_c16 : out std_logic_vector(14-1 downto 0);   --	sfix(2, -12)
        R_cm35 : out std_logic_vector(15-1 downto 0);   --	sfix(3, -12)
        R_cm46 : out std_logic_vector(15-1 downto 0);   --	sfix(3, -12)
        R_cm17 : out std_logic_vector(14-1 downto 0);   --	sfix(2, -12)
        R_c2 : out std_logic_vector(11-1 downto 0);   --	sfix(-1, -12)
        R_c33 : out std_logic_vector(15-1 downto 0);   --	sfix(3, -12)
        R_c30 : out std_logic_vector(14-1 downto 0);   --	sfix(2, -12)
        R_cm55 : out std_logic_vector(15-1 downto 0);   --	sfix(3, -12)
        R_cm18 : out std_logic_vector(14-1 downto 0);   --	sfix(2, -12)
        R_c23 : out std_logic_vector(14-1 downto 0);   --	sfix(2, -12)
        R_cm2 : out std_logic_vector(10-1 downto 0);   --	sfix(-2, -12)
        R_cm53 : out std_logic_vector(15-1 downto 0);   --	sfix(3, -12)
        R_cm41 : out std_logic_vector(15-1 downto 0);   --	sfix(3, -12)
        R_c38 : out std_logic_vector(15-1 downto 0);   --	sfix(3, -12)
        R_c21 : out std_logic_vector(14-1 downto 0);   --	sfix(2, -12)
        R_c32 : out std_logic_vector(15-1 downto 0);   --	sfix(3, -12)
        R_c0 : out std_logic_vector(13-1 downto 0)  --	sfix(1, -12)
    );
end conv1_core1_rmcm;

architecture arch of conv1_core1_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM8_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4_WEIGHT            is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1_WEIGHT            is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C12_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C19_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C7_WEIGHT            is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C22_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C29_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C8_WEIGHT            is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM7_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C27_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM45_WEIGHT          is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C18_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C9_WEIGHT            is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM23_WEIGHT          is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C15_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3_WEIGHT            is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C17_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM14_WEIGHT          is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C13_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM9_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5_WEIGHT            is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM44_WEIGHT          is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C39_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM37_WEIGHT          is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C42_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM26_WEIGHT          is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM31_WEIGHT          is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM21_WEIGHT          is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM36_WEIGHT          is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM40_WEIGHT          is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM20_WEIGHT          is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM16_WEIGHT          is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM11_WEIGHT          is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6_WEIGHT            is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM25_WEIGHT          is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM24_WEIGHT          is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM10_WEIGHT          is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C36_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C16_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM35_WEIGHT          is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM46_WEIGHT          is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM17_WEIGHT          is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2_WEIGHT            is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C33_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C30_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM55_WEIGHT          is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM18_WEIGHT          is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C23_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM53_WEIGHT          is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM41_WEIGHT          is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C38_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C21_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C32_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0_WEIGHT            is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- sfix(1, -7)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(3, -5)
    signal cm8_weight           : PIPELINE_TYPE_FOR_CM8_WEIGHT;
    -- sfix(3, -5)
    signal cm6_weight           : PIPELINE_TYPE_FOR_CM6_WEIGHT;
    -- sfix(3, -5)
    signal c4_weight            : PIPELINE_TYPE_FOR_C4_WEIGHT;
    -- sfix(3, -5)
    signal cm1_weight           : PIPELINE_TYPE_FOR_CM1_WEIGHT;
    -- sfix(3, -5)
    signal cm3_weight           : PIPELINE_TYPE_FOR_CM3_WEIGHT;
    -- sfix(3, -5)
    signal c1_weight            : PIPELINE_TYPE_FOR_C1_WEIGHT;
    -- sfix(3, -5)
    signal c12_weight           : PIPELINE_TYPE_FOR_C12_WEIGHT;
    -- sfix(3, -5)
    signal c19_weight           : PIPELINE_TYPE_FOR_C19_WEIGHT;
    -- sfix(3, -5)
    signal c7_weight            : PIPELINE_TYPE_FOR_C7_WEIGHT;
    -- sfix(3, -5)
    signal c22_weight           : PIPELINE_TYPE_FOR_C22_WEIGHT;
    -- sfix(3, -5)
    signal c29_weight           : PIPELINE_TYPE_FOR_C29_WEIGHT;
    -- sfix(3, -5)
    signal c8_weight            : PIPELINE_TYPE_FOR_C8_WEIGHT;
    -- sfix(3, -5)
    signal cm7_weight           : PIPELINE_TYPE_FOR_CM7_WEIGHT;
    -- sfix(3, -5)
    signal c27_weight           : PIPELINE_TYPE_FOR_C27_WEIGHT;
    -- sfix(3, -5)
    signal cm45_weight          : PIPELINE_TYPE_FOR_CM45_WEIGHT;
    -- sfix(3, -5)
    signal c18_weight           : PIPELINE_TYPE_FOR_C18_WEIGHT;
    -- sfix(3, -5)
    signal c9_weight            : PIPELINE_TYPE_FOR_C9_WEIGHT;
    -- sfix(3, -5)
    signal cm23_weight          : PIPELINE_TYPE_FOR_CM23_WEIGHT;
    -- sfix(3, -5)
    signal c15_weight           : PIPELINE_TYPE_FOR_C15_WEIGHT;
    -- sfix(3, -5)
    signal cm4_weight           : PIPELINE_TYPE_FOR_CM4_WEIGHT;
    -- sfix(3, -5)
    signal c3_weight            : PIPELINE_TYPE_FOR_C3_WEIGHT;
    -- sfix(3, -5)
    signal c17_weight           : PIPELINE_TYPE_FOR_C17_WEIGHT;
    -- sfix(3, -5)
    signal cm14_weight          : PIPELINE_TYPE_FOR_CM14_WEIGHT;
    -- sfix(3, -5)
    signal c13_weight           : PIPELINE_TYPE_FOR_C13_WEIGHT;
    -- sfix(3, -5)
    signal cm9_weight           : PIPELINE_TYPE_FOR_CM9_WEIGHT;
    -- sfix(3, -5)
    signal c5_weight            : PIPELINE_TYPE_FOR_C5_WEIGHT;
    -- sfix(3, -5)
    signal cm44_weight          : PIPELINE_TYPE_FOR_CM44_WEIGHT;
    -- sfix(3, -5)
    signal c39_weight           : PIPELINE_TYPE_FOR_C39_WEIGHT;
    -- sfix(3, -5)
    signal cm37_weight          : PIPELINE_TYPE_FOR_CM37_WEIGHT;
    -- sfix(3, -5)
    signal c42_weight           : PIPELINE_TYPE_FOR_C42_WEIGHT;
    -- sfix(3, -5)
    signal cm5_weight           : PIPELINE_TYPE_FOR_CM5_WEIGHT;
    -- sfix(3, -5)
    signal cm26_weight          : PIPELINE_TYPE_FOR_CM26_WEIGHT;
    -- sfix(3, -5)
    signal cm31_weight          : PIPELINE_TYPE_FOR_CM31_WEIGHT;
    -- sfix(3, -5)
    signal cm21_weight          : PIPELINE_TYPE_FOR_CM21_WEIGHT;
    -- sfix(3, -5)
    signal cm36_weight          : PIPELINE_TYPE_FOR_CM36_WEIGHT;
    -- sfix(3, -5)
    signal cm40_weight          : PIPELINE_TYPE_FOR_CM40_WEIGHT;
    -- sfix(3, -5)
    signal cm20_weight          : PIPELINE_TYPE_FOR_CM20_WEIGHT;
    -- sfix(3, -5)
    signal cm16_weight          : PIPELINE_TYPE_FOR_CM16_WEIGHT;
    -- sfix(3, -5)
    signal cm11_weight          : PIPELINE_TYPE_FOR_CM11_WEIGHT;
    -- sfix(3, -5)
    signal c6_weight            : PIPELINE_TYPE_FOR_C6_WEIGHT;
    -- sfix(3, -5)
    signal cm25_weight          : PIPELINE_TYPE_FOR_CM25_WEIGHT;
    -- sfix(3, -5)
    signal cm24_weight          : PIPELINE_TYPE_FOR_CM24_WEIGHT;
    -- sfix(3, -5)
    signal cm10_weight          : PIPELINE_TYPE_FOR_CM10_WEIGHT;
    -- sfix(3, -5)
    signal c36_weight           : PIPELINE_TYPE_FOR_C36_WEIGHT;
    -- sfix(3, -5)
    signal c16_weight           : PIPELINE_TYPE_FOR_C16_WEIGHT;
    -- sfix(3, -5)
    signal cm35_weight          : PIPELINE_TYPE_FOR_CM35_WEIGHT;
    -- sfix(3, -5)
    signal cm46_weight          : PIPELINE_TYPE_FOR_CM46_WEIGHT;
    -- sfix(3, -5)
    signal cm17_weight          : PIPELINE_TYPE_FOR_CM17_WEIGHT;
    -- sfix(3, -5)
    signal c2_weight            : PIPELINE_TYPE_FOR_C2_WEIGHT;
    -- sfix(3, -5)
    signal c33_weight           : PIPELINE_TYPE_FOR_C33_WEIGHT;
    -- sfix(3, -5)
    signal c30_weight           : PIPELINE_TYPE_FOR_C30_WEIGHT;
    -- sfix(3, -5)
    signal cm55_weight          : PIPELINE_TYPE_FOR_CM55_WEIGHT;
    -- sfix(3, -5)
    signal cm18_weight          : PIPELINE_TYPE_FOR_CM18_WEIGHT;
    -- sfix(3, -5)
    signal c23_weight           : PIPELINE_TYPE_FOR_C23_WEIGHT;
    -- sfix(3, -5)
    signal cm2_weight           : PIPELINE_TYPE_FOR_CM2_WEIGHT;
    -- sfix(3, -5)
    signal cm53_weight          : PIPELINE_TYPE_FOR_CM53_WEIGHT;
    -- sfix(3, -5)
    signal cm41_weight          : PIPELINE_TYPE_FOR_CM41_WEIGHT;
    -- sfix(3, -5)
    signal c38_weight           : PIPELINE_TYPE_FOR_C38_WEIGHT;
    -- sfix(3, -5)
    signal c21_weight           : PIPELINE_TYPE_FOR_C21_WEIGHT;
    -- sfix(3, -5)
    signal c32_weight           : PIPELINE_TYPE_FOR_C32_WEIGHT;
    -- sfix(3, -5)
    signal c0_weight            : PIPELINE_TYPE_FOR_C0_WEIGHT;

    -- The zero output
    signal c0 : std_logic_vector(13-1 downto 0); --	sfix(1, -12)

    -- If we use LUT multiplier and the input is unsigned, we have to cut away the msb of the result
    -- If this is the case, the temporary results are stored in the signals below.


begin
    c0 <= (others => '0');
    R_c0 <= c0;
    X0_signal(0) <= X0;



    WEIGHT_ROM: entity work.conv1_core1_rmcm_weightsconstant_memory
        generic map
        (
            XI_WIDTH        	          => 8, 
            ARRAY_SIZE                    => 1,
            WORDS_PER_ADDR                => 60
        )
        port map
        (
            clk => clk,
            data_index => (others => '0'),
        
            dout1   => cm8_weight(0), 
            dout2   => cm6_weight(0), 
            dout3   => c4_weight(0), 
            dout4   => cm1_weight(0), 
            dout5   => cm3_weight(0), 
            dout6   => c1_weight(0), 
            dout7   => c12_weight(0), 
            dout8   => c19_weight(0), 
            dout9   => c7_weight(0), 
            dout10   => c22_weight(0), 
            dout11   => c29_weight(0), 
            dout12   => c8_weight(0), 
            dout13   => cm7_weight(0), 
            dout14   => c27_weight(0), 
            dout15   => cm45_weight(0), 
            dout16   => c18_weight(0), 
            dout17   => c9_weight(0), 
            dout18   => cm23_weight(0), 
            dout19   => c15_weight(0), 
            dout20   => cm4_weight(0), 
            dout21   => c3_weight(0), 
            dout22   => c17_weight(0), 
            dout23   => cm14_weight(0), 
            dout24   => c13_weight(0), 
            dout25   => cm9_weight(0), 
            dout26   => c5_weight(0), 
            dout27   => cm44_weight(0), 
            dout28   => c39_weight(0), 
            dout29   => cm37_weight(0), 
            dout30   => c42_weight(0), 
            dout31   => cm5_weight(0), 
            dout32   => cm26_weight(0), 
            dout33   => cm31_weight(0), 
            dout34   => cm21_weight(0), 
            dout35   => cm36_weight(0), 
            dout36   => cm40_weight(0), 
            dout37   => cm20_weight(0), 
            dout38   => cm16_weight(0), 
            dout39   => cm11_weight(0), 
            dout40   => c6_weight(0), 
            dout41   => cm25_weight(0), 
            dout42   => cm24_weight(0), 
            dout43   => cm10_weight(0), 
            dout44   => c36_weight(0), 
            dout45   => c16_weight(0), 
            dout46   => cm35_weight(0), 
            dout47   => cm46_weight(0), 
            dout48   => cm17_weight(0), 
            dout49   => c2_weight(0), 
            dout50   => c33_weight(0), 
            dout51   => c30_weight(0), 
            dout52   => cm55_weight(0), 
            dout53   => cm18_weight(0), 
            dout54   => c23_weight(0), 
            dout55   => cm2_weight(0), 
            dout56   => cm53_weight(0), 
            dout57   => cm41_weight(0), 
            dout58   => c38_weight(0), 
            dout59   => c21_weight(0), 
            dout60   => c32_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_cm8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm8_weight(0), cm8_weight(1));
    PL_STEP_0_for_cm6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6_weight(0), cm6_weight(1));
    PL_STEP_0_for_c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4_weight(0), c4_weight(1));
    PL_STEP_0_for_cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1_weight(0), cm1_weight(1));
    PL_STEP_0_for_cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3_weight(0), cm3_weight(1));
    PL_STEP_0_for_c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1_weight(0), c1_weight(1));
    PL_STEP_0_for_c12_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c12_weight(0), c12_weight(1));
    PL_STEP_0_for_c19_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c19_weight(0), c19_weight(1));
    PL_STEP_0_for_c7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c7_weight(0), c7_weight(1));
    PL_STEP_0_for_c22_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c22_weight(0), c22_weight(1));
    PL_STEP_0_for_c29_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c29_weight(0), c29_weight(1));
    PL_STEP_0_for_c8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c8_weight(0), c8_weight(1));
    PL_STEP_0_for_cm7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm7_weight(0), cm7_weight(1));
    PL_STEP_0_for_c27_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c27_weight(0), c27_weight(1));
    PL_STEP_0_for_cm45_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm45_weight(0), cm45_weight(1));
    PL_STEP_0_for_c18_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c18_weight(0), c18_weight(1));
    PL_STEP_0_for_c9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c9_weight(0), c9_weight(1));
    PL_STEP_0_for_cm23_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm23_weight(0), cm23_weight(1));
    PL_STEP_0_for_c15_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c15_weight(0), c15_weight(1));
    PL_STEP_0_for_cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4_weight(0), cm4_weight(1));
    PL_STEP_0_for_c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3_weight(0), c3_weight(1));
    PL_STEP_0_for_c17_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c17_weight(0), c17_weight(1));
    PL_STEP_0_for_cm14_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm14_weight(0), cm14_weight(1));
    PL_STEP_0_for_c13_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c13_weight(0), c13_weight(1));
    PL_STEP_0_for_cm9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm9_weight(0), cm9_weight(1));
    PL_STEP_0_for_c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5_weight(0), c5_weight(1));
    PL_STEP_0_for_cm44_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm44_weight(0), cm44_weight(1));
    PL_STEP_0_for_c39_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c39_weight(0), c39_weight(1));
    PL_STEP_0_for_cm37_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm37_weight(0), cm37_weight(1));
    PL_STEP_0_for_c42_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c42_weight(0), c42_weight(1));
    PL_STEP_0_for_cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5_weight(0), cm5_weight(1));
    PL_STEP_0_for_cm26_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm26_weight(0), cm26_weight(1));
    PL_STEP_0_for_cm31_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm31_weight(0), cm31_weight(1));
    PL_STEP_0_for_cm21_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm21_weight(0), cm21_weight(1));
    PL_STEP_0_for_cm36_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm36_weight(0), cm36_weight(1));
    PL_STEP_0_for_cm40_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm40_weight(0), cm40_weight(1));
    PL_STEP_0_for_cm20_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm20_weight(0), cm20_weight(1));
    PL_STEP_0_for_cm16_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm16_weight(0), cm16_weight(1));
    PL_STEP_0_for_cm11_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm11_weight(0), cm11_weight(1));
    PL_STEP_0_for_c6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6_weight(0), c6_weight(1));
    PL_STEP_0_for_cm25_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm25_weight(0), cm25_weight(1));
    PL_STEP_0_for_cm24_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm24_weight(0), cm24_weight(1));
    PL_STEP_0_for_cm10_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm10_weight(0), cm10_weight(1));
    PL_STEP_0_for_c36_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c36_weight(0), c36_weight(1));
    PL_STEP_0_for_c16_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c16_weight(0), c16_weight(1));
    PL_STEP_0_for_cm35_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm35_weight(0), cm35_weight(1));
    PL_STEP_0_for_cm46_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm46_weight(0), cm46_weight(1));
    PL_STEP_0_for_cm17_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm17_weight(0), cm17_weight(1));
    PL_STEP_0_for_c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2_weight(0), c2_weight(1));
    PL_STEP_0_for_c33_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c33_weight(0), c33_weight(1));
    PL_STEP_0_for_c30_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c30_weight(0), c30_weight(1));
    PL_STEP_0_for_cm55_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm55_weight(0), cm55_weight(1));
    PL_STEP_0_for_cm18_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm18_weight(0), cm18_weight(1));
    PL_STEP_0_for_c23_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c23_weight(0), c23_weight(1));
    PL_STEP_0_for_cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2_weight(0), cm2_weight(1));
    PL_STEP_0_for_cm53_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm53_weight(0), cm53_weight(1));
    PL_STEP_0_for_cm41_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm41_weight(0), cm41_weight(1));
    PL_STEP_0_for_c38_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c38_weight(0), c38_weight(1));
    PL_STEP_0_for_c21_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c21_weight(0), c21_weight(1));
    PL_STEP_0_for_c32_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c32_weight(0), c32_weight(1));
    PL_STEP_0_for_c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0_weight(0), c0_weight(1));


    cm45_cm1_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 1,
			C_WIDTH => 8, --	sfix(1, -7)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => True,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm45_weight(1)(7-1 downto 0),
			B	=> cm1_weight(1)(1-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm45,
			CxB => R_cm1
		);

    cm44_cm2_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 2,
			C_WIDTH => 8, --	sfix(1, -7)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => True,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm44_weight(1)(7-1 downto 0),
			B	=> cm2_weight(1)(2-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm44,
			CxB => R_cm2
		);

    c39_c1_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 2,
			C_WIDTH => 8, --	sfix(1, -7)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => True,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c39_weight(1)(7-1 downto 0),
			B	=> c1_weight(1)(2-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c39,
			CxB => R_c1
		);

    cm37_c2_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 3,
			C_WIDTH => 8, --	sfix(1, -7)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => True,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm37_weight(1)(7-1 downto 0),
			B	=> c2_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm37,
			CxB => R_c2
		);

    c42_c3_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 3,
			C_WIDTH => 8, --	sfix(1, -7)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => True,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c42_weight(1)(7-1 downto 0),
			B	=> c3_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c42,
			CxB => R_c3
		);

    cm36_cm4_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 3,
			C_WIDTH => 8, --	sfix(1, -7)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => True,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm36_weight(1)(7-1 downto 0),
			B	=> cm4_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm36,
			CxB => R_cm4
		);

    cm40_cm3_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 3,
			C_WIDTH => 8, --	sfix(1, -7)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => True,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm40_weight(1)(7-1 downto 0),
			B	=> cm3_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm40,
			CxB => R_cm3
		);

    c36_c6_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 4,
			C_WIDTH => 8, --	sfix(1, -7)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => True,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c36_weight(1)(7-1 downto 0),
			B	=> c6_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c36,
			CxB => R_c6
		);

    cm35_cm5_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 4,
			C_WIDTH => 8, --	sfix(1, -7)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => True,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm35_weight(1)(7-1 downto 0),
			B	=> cm5_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm35,
			CxB => R_cm5
		);

    cm46_c5_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 4,
			C_WIDTH => 8, --	sfix(1, -7)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => True,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm46_weight(1)(7-1 downto 0),
			B	=> c5_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm46,
			CxB => R_c5
		);

    c33_cm7_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 4,
			C_WIDTH => 8, --	sfix(1, -7)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => True,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c33_weight(1)(7-1 downto 0),
			B	=> cm7_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c33,
			CxB => R_cm7
		);

    cm55_c7_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 4,
			C_WIDTH => 8, --	sfix(1, -7)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => True,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm55_weight(1)(7-1 downto 0),
			B	=> c7_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm55,
			CxB => R_c7
		);

    cm53_c4_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 4,
			C_WIDTH => 8, --	sfix(1, -7)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => True,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm53_weight(1)(7-1 downto 0),
			B	=> c4_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm53,
			CxB => R_c4
		);

    cm41_cm6_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 4,
			C_WIDTH => 8, --	sfix(1, -7)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => True,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm41_weight(1)(7-1 downto 0),
			B	=> cm6_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm41,
			CxB => R_cm6
		);

    c38_cm8_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 4,
			C_WIDTH => 8, --	sfix(1, -7)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => True,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c38_weight(1)(7-1 downto 0),
			B	=> cm8_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c38,
			CxB => R_cm8
		);

    c32_cm10_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 5,
			C_WIDTH => 8, --	sfix(1, -7)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => True,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c32_weight(1)(7-1 downto 0),
			B	=> cm10_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c32,
			CxB => R_cm10
		);

    c19_cm11_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 6,
			B_WIDTH => 5,
			C_WIDTH => 8, --	sfix(1, -7)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => True,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c19_weight(1)(6-1 downto 0),
			B	=> cm11_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c19,
			CxB => R_cm11
		);

    c22_cm16_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 6,
			B_WIDTH => 5,
			C_WIDTH => 8, --	sfix(1, -7)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => True,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c22_weight(1)(6-1 downto 0),
			B	=> cm16_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c22,
			CxB => R_cm16
		);

    c29_cm9_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 6,
			B_WIDTH => 5,
			C_WIDTH => 8, --	sfix(1, -7)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => True,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c29_weight(1)(6-1 downto 0),
			B	=> cm9_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c29,
			CxB => R_cm9
		);

    c27_c13_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 6,
			B_WIDTH => 5,
			C_WIDTH => 8, --	sfix(1, -7)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => True,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c27_weight(1)(6-1 downto 0),
			B	=> c13_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c27,
			CxB => R_c13
		);

    c18_cm14_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 6,
			B_WIDTH => 5,
			C_WIDTH => 8, --	sfix(1, -7)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => True,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c18_weight(1)(6-1 downto 0),
			B	=> cm14_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c18,
			CxB => R_cm14
		);

    cm23_c15_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 6,
			B_WIDTH => 5,
			C_WIDTH => 8, --	sfix(1, -7)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => True,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm23_weight(1)(6-1 downto 0),
			B	=> c15_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm23,
			CxB => R_c15
		);

    c17_c9_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 6,
			B_WIDTH => 5,
			C_WIDTH => 8, --	sfix(1, -7)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => True,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c17_weight(1)(6-1 downto 0),
			B	=> c9_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c17,
			CxB => R_c9
		);

    cm26_c8_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 6,
			B_WIDTH => 5,
			C_WIDTH => 8, --	sfix(1, -7)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => True,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm26_weight(1)(6-1 downto 0),
			B	=> c8_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm26,
			CxB => R_c8
		);

    cm31_c12_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 6,
			B_WIDTH => 5,
			C_WIDTH => 8, --	sfix(1, -7)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => True,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm31_weight(1)(6-1 downto 0),
			B	=> c12_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm31,
			CxB => R_c12
		);

    cm21_c21_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 6,
			B_WIDTH => 6,
			C_WIDTH => 8, --	sfix(1, -7)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => True,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm21_weight(1)(6-1 downto 0),
			B	=> c21_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm21,
			CxB => R_c21
		);

    cm20_c23_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 6,
			B_WIDTH => 6,
			C_WIDTH => 8, --	sfix(1, -7)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => True,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm20_weight(1)(6-1 downto 0),
			B	=> c23_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm20,
			CxB => R_c23
		);

    cm25_cm18_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 6,
			B_WIDTH => 6,
			C_WIDTH => 8, --	sfix(1, -7)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => True,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm25_weight(1)(6-1 downto 0),
			B	=> cm18_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm25,
			CxB => R_cm18
		);

    cm24_c30_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 6,
			B_WIDTH => 6,
			C_WIDTH => 8, --	sfix(1, -7)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => True,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm24_weight(1)(6-1 downto 0),
			B	=> c30_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm24,
			CxB => R_c30
		);

    c16_cm17_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 6,
			B_WIDTH => 6,
			C_WIDTH => 8, --	sfix(1, -7)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => True,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c16_weight(1)(6-1 downto 0),
			B	=> cm17_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c16,
			CxB => R_cm17
		);




end architecture;
