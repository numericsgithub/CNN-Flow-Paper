library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv1_core2_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        X0 : in  std_logic_vector(8-1 downto 0); --	sfix(1, -7)
        R_cm11 : out std_logic_vector(13-1 downto 0);   --	sfix(1, -12)
        R_cm9 : out std_logic_vector(13-1 downto 0);   --	sfix(1, -12)
        R_c2 : out std_logic_vector(11-1 downto 0);   --	sfix(-1, -12)
        R_cm1 : out std_logic_vector(9-1 downto 0);   --	sfix(-3, -12)
        R_cm4 : out std_logic_vector(11-1 downto 0);   --	sfix(-1, -12)
        R_cm2 : out std_logic_vector(10-1 downto 0);   --	sfix(-2, -12)
        R_cm8 : out std_logic_vector(12-1 downto 0);   --	sfix(0, -12)
        R_cm10 : out std_logic_vector(13-1 downto 0);   --	sfix(1, -12)
        R_cm7 : out std_logic_vector(12-1 downto 0);   --	sfix(0, -12)
        R_cm6 : out std_logic_vector(12-1 downto 0);   --	sfix(0, -12)
        R_c1 : out std_logic_vector(10-1 downto 0);   --	sfix(-2, -12)
        R_c34 : out std_logic_vector(15-1 downto 0);   --	sfix(3, -12)
        R_cm65 : out std_logic_vector(16-1 downto 0);   --	sfix(4, -12)
        R_c24 : out std_logic_vector(14-1 downto 0);   --	sfix(2, -12)
        R_c13 : out std_logic_vector(13-1 downto 0);   --	sfix(1, -12)
        R_cm25 : out std_logic_vector(14-1 downto 0);   --	sfix(2, -12)
        R_c15 : out std_logic_vector(13-1 downto 0);   --	sfix(1, -12)
        R_c4 : out std_logic_vector(12-1 downto 0);   --	sfix(0, -12)
        R_c23 : out std_logic_vector(14-1 downto 0);   --	sfix(2, -12)
        R_cm16 : out std_logic_vector(13-1 downto 0);   --	sfix(1, -12)
        R_c14 : out std_logic_vector(13-1 downto 0);   --	sfix(1, -12)
        R_cm3 : out std_logic_vector(11-1 downto 0);   --	sfix(-1, -12)
        R_cm69 : out std_logic_vector(16-1 downto 0);   --	sfix(4, -12)
        R_c55 : out std_logic_vector(15-1 downto 0);   --	sfix(3, -12)
        R_c7 : out std_logic_vector(12-1 downto 0);   --	sfix(0, -12)
        R_cm53 : out std_logic_vector(15-1 downto 0);   --	sfix(3, -12)
        R_c6 : out std_logic_vector(12-1 downto 0);   --	sfix(0, -12)
        R_c5 : out std_logic_vector(12-1 downto 0);   --	sfix(0, -12)
        R_c3 : out std_logic_vector(11-1 downto 0);   --	sfix(-1, -12)
        R_cm15 : out std_logic_vector(13-1 downto 0);   --	sfix(1, -12)
        R_cm17 : out std_logic_vector(14-1 downto 0);   --	sfix(2, -12)
        R_cm14 : out std_logic_vector(13-1 downto 0);   --	sfix(1, -12)
        R_cm13 : out std_logic_vector(13-1 downto 0);   --	sfix(1, -12)
        R_c9 : out std_logic_vector(13-1 downto 0);   --	sfix(1, -12)
        R_c10 : out std_logic_vector(13-1 downto 0);   --	sfix(1, -12)
        R_cm36 : out std_logic_vector(15-1 downto 0);   --	sfix(3, -12)
        R_cm35 : out std_logic_vector(15-1 downto 0);   --	sfix(3, -12)
        R_c12 : out std_logic_vector(13-1 downto 0);   --	sfix(1, -12)
        R_cm5 : out std_logic_vector(12-1 downto 0);   --	sfix(0, -12)
        R_c43 : out std_logic_vector(15-1 downto 0);   --	sfix(3, -12)
        R_c18 : out std_logic_vector(14-1 downto 0);   --	sfix(2, -12)
        R_cm18 : out std_logic_vector(14-1 downto 0);   --	sfix(2, -12)
        R_c8 : out std_logic_vector(13-1 downto 0);   --	sfix(1, -12)
        R_cm26 : out std_logic_vector(14-1 downto 0);   --	sfix(2, -12)
        R_cm20 : out std_logic_vector(14-1 downto 0);   --	sfix(2, -12)
        R_c30 : out std_logic_vector(14-1 downto 0);   --	sfix(2, -12)
        R_c26 : out std_logic_vector(14-1 downto 0);   --	sfix(2, -12)
        R_c35 : out std_logic_vector(15-1 downto 0);   --	sfix(3, -12)
        R_cm24 : out std_logic_vector(14-1 downto 0);   --	sfix(2, -12)
        R_cm56 : out std_logic_vector(15-1 downto 0);   --	sfix(3, -12)
        R_c28 : out std_logic_vector(14-1 downto 0);   --	sfix(2, -12)
        R_cm19 : out std_logic_vector(14-1 downto 0);   --	sfix(2, -12)
        R_c11 : out std_logic_vector(13-1 downto 0);   --	sfix(1, -12)
        R_cm12 : out std_logic_vector(13-1 downto 0);   --	sfix(1, -12)
        R_cm90 : out std_logic_vector(16-1 downto 0);   --	sfix(4, -12)
        R_c40 : out std_logic_vector(15-1 downto 0);   --	sfix(3, -12)
        R_c66 : out std_logic_vector(16-1 downto 0);   --	sfix(4, -12)
        R_c17 : out std_logic_vector(14-1 downto 0);   --	sfix(2, -12)
        R_c25 : out std_logic_vector(14-1 downto 0);   --	sfix(2, -12)
        R_c49 : out std_logic_vector(15-1 downto 0);   --	sfix(3, -12)
        R_c21 : out std_logic_vector(14-1 downto 0);   --	sfix(2, -12)
        R_c19 : out std_logic_vector(14-1 downto 0);   --	sfix(2, -12)
        R_c0 : out std_logic_vector(13-1 downto 0)  --	sfix(1, -12)
    );
end conv1_core2_rmcm;

architecture arch of conv1_core2_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM11_WEIGHT          is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM9_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2_WEIGHT            is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM8_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM10_WEIGHT          is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM7_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1_WEIGHT            is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C34_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM65_WEIGHT          is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C24_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C13_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM25_WEIGHT          is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C15_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4_WEIGHT            is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C23_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM16_WEIGHT          is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C14_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM69_WEIGHT          is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C55_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C7_WEIGHT            is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM53_WEIGHT          is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6_WEIGHT            is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5_WEIGHT            is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3_WEIGHT            is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM15_WEIGHT          is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM17_WEIGHT          is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM14_WEIGHT          is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM13_WEIGHT          is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C9_WEIGHT            is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C10_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM36_WEIGHT          is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM35_WEIGHT          is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C12_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C43_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C18_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM18_WEIGHT          is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C8_WEIGHT            is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM26_WEIGHT          is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM20_WEIGHT          is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C30_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C26_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C35_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM24_WEIGHT          is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM56_WEIGHT          is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C28_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM19_WEIGHT          is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C11_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM12_WEIGHT          is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM90_WEIGHT          is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C40_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C66_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C17_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C25_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C49_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C21_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C19_WEIGHT           is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0_WEIGHT            is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- sfix(1, -7)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(3, -5)
    signal cm11_weight          : PIPELINE_TYPE_FOR_CM11_WEIGHT;
    -- sfix(3, -5)
    signal cm9_weight           : PIPELINE_TYPE_FOR_CM9_WEIGHT;
    -- sfix(3, -5)
    signal c2_weight            : PIPELINE_TYPE_FOR_C2_WEIGHT;
    -- sfix(3, -5)
    signal cm1_weight           : PIPELINE_TYPE_FOR_CM1_WEIGHT;
    -- sfix(3, -5)
    signal cm4_weight           : PIPELINE_TYPE_FOR_CM4_WEIGHT;
    -- sfix(3, -5)
    signal cm2_weight           : PIPELINE_TYPE_FOR_CM2_WEIGHT;
    -- sfix(3, -5)
    signal cm8_weight           : PIPELINE_TYPE_FOR_CM8_WEIGHT;
    -- sfix(3, -5)
    signal cm10_weight          : PIPELINE_TYPE_FOR_CM10_WEIGHT;
    -- sfix(3, -5)
    signal cm7_weight           : PIPELINE_TYPE_FOR_CM7_WEIGHT;
    -- sfix(3, -5)
    signal cm6_weight           : PIPELINE_TYPE_FOR_CM6_WEIGHT;
    -- sfix(3, -5)
    signal c1_weight            : PIPELINE_TYPE_FOR_C1_WEIGHT;
    -- sfix(3, -5)
    signal c34_weight           : PIPELINE_TYPE_FOR_C34_WEIGHT;
    -- sfix(3, -5)
    signal cm65_weight          : PIPELINE_TYPE_FOR_CM65_WEIGHT;
    -- sfix(3, -5)
    signal c24_weight           : PIPELINE_TYPE_FOR_C24_WEIGHT;
    -- sfix(3, -5)
    signal c13_weight           : PIPELINE_TYPE_FOR_C13_WEIGHT;
    -- sfix(3, -5)
    signal cm25_weight          : PIPELINE_TYPE_FOR_CM25_WEIGHT;
    -- sfix(3, -5)
    signal c15_weight           : PIPELINE_TYPE_FOR_C15_WEIGHT;
    -- sfix(3, -5)
    signal c4_weight            : PIPELINE_TYPE_FOR_C4_WEIGHT;
    -- sfix(3, -5)
    signal c23_weight           : PIPELINE_TYPE_FOR_C23_WEIGHT;
    -- sfix(3, -5)
    signal cm16_weight          : PIPELINE_TYPE_FOR_CM16_WEIGHT;
    -- sfix(3, -5)
    signal c14_weight           : PIPELINE_TYPE_FOR_C14_WEIGHT;
    -- sfix(3, -5)
    signal cm3_weight           : PIPELINE_TYPE_FOR_CM3_WEIGHT;
    -- sfix(3, -5)
    signal cm69_weight          : PIPELINE_TYPE_FOR_CM69_WEIGHT;
    -- sfix(3, -5)
    signal c55_weight           : PIPELINE_TYPE_FOR_C55_WEIGHT;
    -- sfix(3, -5)
    signal c7_weight            : PIPELINE_TYPE_FOR_C7_WEIGHT;
    -- sfix(3, -5)
    signal cm53_weight          : PIPELINE_TYPE_FOR_CM53_WEIGHT;
    -- sfix(3, -5)
    signal c6_weight            : PIPELINE_TYPE_FOR_C6_WEIGHT;
    -- sfix(3, -5)
    signal c5_weight            : PIPELINE_TYPE_FOR_C5_WEIGHT;
    -- sfix(3, -5)
    signal c3_weight            : PIPELINE_TYPE_FOR_C3_WEIGHT;
    -- sfix(3, -5)
    signal cm15_weight          : PIPELINE_TYPE_FOR_CM15_WEIGHT;
    -- sfix(3, -5)
    signal cm17_weight          : PIPELINE_TYPE_FOR_CM17_WEIGHT;
    -- sfix(3, -5)
    signal cm14_weight          : PIPELINE_TYPE_FOR_CM14_WEIGHT;
    -- sfix(3, -5)
    signal cm13_weight          : PIPELINE_TYPE_FOR_CM13_WEIGHT;
    -- sfix(3, -5)
    signal c9_weight            : PIPELINE_TYPE_FOR_C9_WEIGHT;
    -- sfix(3, -5)
    signal c10_weight           : PIPELINE_TYPE_FOR_C10_WEIGHT;
    -- sfix(3, -5)
    signal cm36_weight          : PIPELINE_TYPE_FOR_CM36_WEIGHT;
    -- sfix(3, -5)
    signal cm35_weight          : PIPELINE_TYPE_FOR_CM35_WEIGHT;
    -- sfix(3, -5)
    signal c12_weight           : PIPELINE_TYPE_FOR_C12_WEIGHT;
    -- sfix(3, -5)
    signal cm5_weight           : PIPELINE_TYPE_FOR_CM5_WEIGHT;
    -- sfix(3, -5)
    signal c43_weight           : PIPELINE_TYPE_FOR_C43_WEIGHT;
    -- sfix(3, -5)
    signal c18_weight           : PIPELINE_TYPE_FOR_C18_WEIGHT;
    -- sfix(3, -5)
    signal cm18_weight          : PIPELINE_TYPE_FOR_CM18_WEIGHT;
    -- sfix(3, -5)
    signal c8_weight            : PIPELINE_TYPE_FOR_C8_WEIGHT;
    -- sfix(3, -5)
    signal cm26_weight          : PIPELINE_TYPE_FOR_CM26_WEIGHT;
    -- sfix(3, -5)
    signal cm20_weight          : PIPELINE_TYPE_FOR_CM20_WEIGHT;
    -- sfix(3, -5)
    signal c30_weight           : PIPELINE_TYPE_FOR_C30_WEIGHT;
    -- sfix(3, -5)
    signal c26_weight           : PIPELINE_TYPE_FOR_C26_WEIGHT;
    -- sfix(3, -5)
    signal c35_weight           : PIPELINE_TYPE_FOR_C35_WEIGHT;
    -- sfix(3, -5)
    signal cm24_weight          : PIPELINE_TYPE_FOR_CM24_WEIGHT;
    -- sfix(3, -5)
    signal cm56_weight          : PIPELINE_TYPE_FOR_CM56_WEIGHT;
    -- sfix(3, -5)
    signal c28_weight           : PIPELINE_TYPE_FOR_C28_WEIGHT;
    -- sfix(3, -5)
    signal cm19_weight          : PIPELINE_TYPE_FOR_CM19_WEIGHT;
    -- sfix(3, -5)
    signal c11_weight           : PIPELINE_TYPE_FOR_C11_WEIGHT;
    -- sfix(3, -5)
    signal cm12_weight          : PIPELINE_TYPE_FOR_CM12_WEIGHT;
    -- sfix(3, -5)
    signal cm90_weight          : PIPELINE_TYPE_FOR_CM90_WEIGHT;
    -- sfix(3, -5)
    signal c40_weight           : PIPELINE_TYPE_FOR_C40_WEIGHT;
    -- sfix(3, -5)
    signal c66_weight           : PIPELINE_TYPE_FOR_C66_WEIGHT;
    -- sfix(3, -5)
    signal c17_weight           : PIPELINE_TYPE_FOR_C17_WEIGHT;
    -- sfix(3, -5)
    signal c25_weight           : PIPELINE_TYPE_FOR_C25_WEIGHT;
    -- sfix(3, -5)
    signal c49_weight           : PIPELINE_TYPE_FOR_C49_WEIGHT;
    -- sfix(3, -5)
    signal c21_weight           : PIPELINE_TYPE_FOR_C21_WEIGHT;
    -- sfix(3, -5)
    signal c19_weight           : PIPELINE_TYPE_FOR_C19_WEIGHT;
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



    WEIGHT_ROM: entity work.conv1_core2_rmcm_weightsconstant_memory
        generic map
        (
            XI_WIDTH        	          => 8, 
            ARRAY_SIZE                    => 1,
            WORDS_PER_ADDR                => 62
        )
        port map
        (
            clk => clk,
            data_index => (others => '0'),
        
            dout1   => cm11_weight(0), 
            dout2   => cm9_weight(0), 
            dout3   => c2_weight(0), 
            dout4   => cm1_weight(0), 
            dout5   => cm4_weight(0), 
            dout6   => cm2_weight(0), 
            dout7   => cm8_weight(0), 
            dout8   => cm10_weight(0), 
            dout9   => cm7_weight(0), 
            dout10   => cm6_weight(0), 
            dout11   => c1_weight(0), 
            dout12   => c34_weight(0), 
            dout13   => cm65_weight(0), 
            dout14   => c24_weight(0), 
            dout15   => c13_weight(0), 
            dout16   => cm25_weight(0), 
            dout17   => c15_weight(0), 
            dout18   => c4_weight(0), 
            dout19   => c23_weight(0), 
            dout20   => cm16_weight(0), 
            dout21   => c14_weight(0), 
            dout22   => cm3_weight(0), 
            dout23   => cm69_weight(0), 
            dout24   => c55_weight(0), 
            dout25   => c7_weight(0), 
            dout26   => cm53_weight(0), 
            dout27   => c6_weight(0), 
            dout28   => c5_weight(0), 
            dout29   => c3_weight(0), 
            dout30   => cm15_weight(0), 
            dout31   => cm17_weight(0), 
            dout32   => cm14_weight(0), 
            dout33   => cm13_weight(0), 
            dout34   => c9_weight(0), 
            dout35   => c10_weight(0), 
            dout36   => cm36_weight(0), 
            dout37   => cm35_weight(0), 
            dout38   => c12_weight(0), 
            dout39   => cm5_weight(0), 
            dout40   => c43_weight(0), 
            dout41   => c18_weight(0), 
            dout42   => cm18_weight(0), 
            dout43   => c8_weight(0), 
            dout44   => cm26_weight(0), 
            dout45   => cm20_weight(0), 
            dout46   => c30_weight(0), 
            dout47   => c26_weight(0), 
            dout48   => c35_weight(0), 
            dout49   => cm24_weight(0), 
            dout50   => cm56_weight(0), 
            dout51   => c28_weight(0), 
            dout52   => cm19_weight(0), 
            dout53   => c11_weight(0), 
            dout54   => cm12_weight(0), 
            dout55   => cm90_weight(0), 
            dout56   => c40_weight(0), 
            dout57   => c66_weight(0), 
            dout58   => c17_weight(0), 
            dout59   => c25_weight(0), 
            dout60   => c49_weight(0), 
            dout61   => c21_weight(0), 
            dout62   => c19_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_cm11_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm11_weight(0), cm11_weight(1));
    PL_STEP_0_for_cm9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm9_weight(0), cm9_weight(1));
    PL_STEP_0_for_c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2_weight(0), c2_weight(1));
    PL_STEP_0_for_cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1_weight(0), cm1_weight(1));
    PL_STEP_0_for_cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4_weight(0), cm4_weight(1));
    PL_STEP_0_for_cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2_weight(0), cm2_weight(1));
    PL_STEP_0_for_cm8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm8_weight(0), cm8_weight(1));
    PL_STEP_0_for_cm10_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm10_weight(0), cm10_weight(1));
    PL_STEP_0_for_cm7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm7_weight(0), cm7_weight(1));
    PL_STEP_0_for_cm6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6_weight(0), cm6_weight(1));
    PL_STEP_0_for_c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1_weight(0), c1_weight(1));
    PL_STEP_0_for_c34_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c34_weight(0), c34_weight(1));
    PL_STEP_0_for_cm65_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm65_weight(0), cm65_weight(1));
    PL_STEP_0_for_c24_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c24_weight(0), c24_weight(1));
    PL_STEP_0_for_c13_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c13_weight(0), c13_weight(1));
    PL_STEP_0_for_cm25_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm25_weight(0), cm25_weight(1));
    PL_STEP_0_for_c15_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c15_weight(0), c15_weight(1));
    PL_STEP_0_for_c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4_weight(0), c4_weight(1));
    PL_STEP_0_for_c23_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c23_weight(0), c23_weight(1));
    PL_STEP_0_for_cm16_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm16_weight(0), cm16_weight(1));
    PL_STEP_0_for_c14_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c14_weight(0), c14_weight(1));
    PL_STEP_0_for_cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3_weight(0), cm3_weight(1));
    PL_STEP_0_for_cm69_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm69_weight(0), cm69_weight(1));
    PL_STEP_0_for_c55_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c55_weight(0), c55_weight(1));
    PL_STEP_0_for_c7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c7_weight(0), c7_weight(1));
    PL_STEP_0_for_cm53_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm53_weight(0), cm53_weight(1));
    PL_STEP_0_for_c6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6_weight(0), c6_weight(1));
    PL_STEP_0_for_c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5_weight(0), c5_weight(1));
    PL_STEP_0_for_c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3_weight(0), c3_weight(1));
    PL_STEP_0_for_cm15_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm15_weight(0), cm15_weight(1));
    PL_STEP_0_for_cm17_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm17_weight(0), cm17_weight(1));
    PL_STEP_0_for_cm14_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm14_weight(0), cm14_weight(1));
    PL_STEP_0_for_cm13_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm13_weight(0), cm13_weight(1));
    PL_STEP_0_for_c9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c9_weight(0), c9_weight(1));
    PL_STEP_0_for_c10_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c10_weight(0), c10_weight(1));
    PL_STEP_0_for_cm36_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm36_weight(0), cm36_weight(1));
    PL_STEP_0_for_cm35_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm35_weight(0), cm35_weight(1));
    PL_STEP_0_for_c12_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c12_weight(0), c12_weight(1));
    PL_STEP_0_for_cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5_weight(0), cm5_weight(1));
    PL_STEP_0_for_c43_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c43_weight(0), c43_weight(1));
    PL_STEP_0_for_c18_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c18_weight(0), c18_weight(1));
    PL_STEP_0_for_cm18_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm18_weight(0), cm18_weight(1));
    PL_STEP_0_for_c8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c8_weight(0), c8_weight(1));
    PL_STEP_0_for_cm26_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm26_weight(0), cm26_weight(1));
    PL_STEP_0_for_cm20_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm20_weight(0), cm20_weight(1));
    PL_STEP_0_for_c30_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c30_weight(0), c30_weight(1));
    PL_STEP_0_for_c26_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c26_weight(0), c26_weight(1));
    PL_STEP_0_for_c35_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c35_weight(0), c35_weight(1));
    PL_STEP_0_for_cm24_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm24_weight(0), cm24_weight(1));
    PL_STEP_0_for_cm56_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm56_weight(0), cm56_weight(1));
    PL_STEP_0_for_c28_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c28_weight(0), c28_weight(1));
    PL_STEP_0_for_cm19_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm19_weight(0), cm19_weight(1));
    PL_STEP_0_for_c11_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c11_weight(0), c11_weight(1));
    PL_STEP_0_for_cm12_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm12_weight(0), cm12_weight(1));
    PL_STEP_0_for_cm90_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm90_weight(0), cm90_weight(1));
    PL_STEP_0_for_c40_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c40_weight(0), c40_weight(1));
    PL_STEP_0_for_c66_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c66_weight(0), c66_weight(1));
    PL_STEP_0_for_c17_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c17_weight(0), c17_weight(1));
    PL_STEP_0_for_c25_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c25_weight(0), c25_weight(1));
    PL_STEP_0_for_c49_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c49_weight(0), c49_weight(1));
    PL_STEP_0_for_c21_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c21_weight(0), c21_weight(1));
    PL_STEP_0_for_c19_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c19_weight(0), c19_weight(1));
    PL_STEP_0_for_c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0_weight(0), c0_weight(1));


    cm65_cm1_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 8,
			B_WIDTH => 1,
			C_WIDTH => 8, --	sfix(1, -7)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => True,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm65_weight(1)(8-1 downto 0),
			B	=> cm1_weight(1)(1-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm65,
			CxB => R_cm1
		);

    cm69_c1_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 8,
			B_WIDTH => 2,
			C_WIDTH => 8, --	sfix(1, -7)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => True,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm69_weight(1)(8-1 downto 0),
			B	=> c1_weight(1)(2-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm69,
			CxB => R_c1
		);

    cm90_cm2_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 8,
			B_WIDTH => 2,
			C_WIDTH => 8, --	sfix(1, -7)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => True,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm90_weight(1)(8-1 downto 0),
			B	=> cm2_weight(1)(2-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm90,
			CxB => R_cm2
		);

    c66_c3_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 8,
			B_WIDTH => 3,
			C_WIDTH => 8, --	sfix(1, -7)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => True,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c66_weight(1)(8-1 downto 0),
			B	=> c3_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c66,
			CxB => R_c3
		);

    c34_cm3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c34_weight(1)(7-1 downto 0),
			B	=> cm3_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c34,
			CxB => R_cm3
		);

    c55_cm4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c55_weight(1)(7-1 downto 0),
			B	=> cm4_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c55,
			CxB => R_cm4
		);

    cm53_c2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm53_weight(1)(7-1 downto 0),
			B	=> c2_weight(1)(3-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm53,
			CxB => R_c2
		);

    cm36_cm5_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm36_weight(1)(7-1 downto 0),
			B	=> cm5_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm36,
			CxB => R_cm5
		);

    cm35_c5_DUAL_MULT: entity work.DualMultDSP
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
			B	=> c5_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm35,
			CxB => R_c5
		);

    c43_c6_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c43_weight(1)(7-1 downto 0),
			B	=> c6_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c43,
			CxB => R_c6
		);

    c35_c7_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c35_weight(1)(7-1 downto 0),
			B	=> c7_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c35,
			CxB => R_c7
		);

    cm56_c4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm56_weight(1)(7-1 downto 0),
			B	=> c4_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm56,
			CxB => R_c4
		);

    c40_cm6_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c40_weight(1)(7-1 downto 0),
			B	=> cm6_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c40,
			CxB => R_cm6
		);

    c49_cm7_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c49_weight(1)(7-1 downto 0),
			B	=> cm7_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c49,
			CxB => R_cm7
		);

    c24_cm8_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 6,
			B_WIDTH => 4,
			C_WIDTH => 8, --	sfix(1, -7)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => True,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c24_weight(1)(6-1 downto 0),
			B	=> cm8_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c24,
			CxB => R_cm8
		);

    cm25_cm12_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm25_weight(1)(6-1 downto 0),
			B	=> cm12_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm25,
			CxB => R_cm12
		);

    c23_c11_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c23_weight(1)(6-1 downto 0),
			B	=> c11_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c23,
			CxB => R_c11
		);

    cm17_c8_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm17_weight(1)(6-1 downto 0),
			B	=> c8_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm17,
			CxB => R_c8
		);

    c18_c12_DUAL_MULT: entity work.DualMultDSP
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
			B	=> c12_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c18,
			CxB => R_c12
		);

    cm18_c10_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm18_weight(1)(6-1 downto 0),
			B	=> c10_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm18,
			CxB => R_c10
		);

    cm26_c9_DUAL_MULT: entity work.DualMultDSP
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
			B	=> c9_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm26,
			CxB => R_c9
		);

    cm20_cm13_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm20_weight(1)(6-1 downto 0),
			B	=> cm13_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm20,
			CxB => R_cm13
		);

    c30_cm14_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c30_weight(1)(6-1 downto 0),
			B	=> cm14_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c30,
			CxB => R_cm14
		);

    c26_cm15_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c26_weight(1)(6-1 downto 0),
			B	=> cm15_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c26,
			CxB => R_cm15
		);

    cm24_c14_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm24_weight(1)(6-1 downto 0),
			B	=> c14_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm24,
			CxB => R_c14
		);

    c28_cm16_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c28_weight(1)(6-1 downto 0),
			B	=> cm16_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c28,
			CxB => R_cm16
		);

    cm19_c15_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm19_weight(1)(6-1 downto 0),
			B	=> c15_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm19,
			CxB => R_c15
		);

    c17_c13_DUAL_MULT: entity work.DualMultDSP
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
			B	=> c13_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c17,
			CxB => R_c13
		);

    c25_cm10_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c25_weight(1)(6-1 downto 0),
			B	=> cm10_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c25,
			CxB => R_cm10
		);

    c21_cm9_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c21_weight(1)(6-1 downto 0),
			B	=> cm9_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c21,
			CxB => R_cm9
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




end architecture;
