library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core21_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        R_cm5cm7cm2cm3cm5c10cm1c14c8c2cm13c6cm8cm7cm5cm11 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_c3cm1cm12c4cm1cm13cm13cm12cm28cm7cm4cm1c34c0cm74c0 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c50c5cm13cm56cm8cm30cm5c4cm9cm6c13cm5cm12c1cm20c19 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c3cm10c2cm4c3cm3c9cm3cm7c23cm13cm2c7c40c8c5 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm3cm5c5c8c10cm12c9c8cm3cm9c0c11c3cm8c2cm5 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_cm29c1cm1c1cm5c15cm3c25c9c0cm9cm4cm32c3cm2c8 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm2cm2c0c0cm4cm5c1cm17c11c8c2c6cm11cm2cm2cm16 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm1cm14cm8cm4cm3c24c12c0c4c14c17c8c1cm13cm9c0 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm1c1c12cm10cm12cm2cm45c18cm12cm41cm2c3c5cm3cm12cm3 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm9c1c7cm10c5cm6c38c12c8c1cm2c22c15c2c2cm15 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm6c8cm5c0cm4cm1cm6c19cm8cm18cm4cm7c1cm7cm1c1 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c4c40c8c5cm2cm1c1cm7c8c0cm2c4cm6cm8cm3c5 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c0cm8c32c4cm5c0c3cm1cm3cm12cm8c4cm3c2cm29cm9 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm3c3cm2c1cm14c4c3c1cm17c0c1c0c8c7cm9c4 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c0c7c6cm1c2cm16c1c3cm6cm7cm14c0c2c8cm11cm6 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_cm17c0c33cm5cm3c15cm1cm2cm4cm14c10c0cm20c0c31cm1 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm7cm7cm1c2cm6cm5cm24c3c4cm2c4cm12cm4cm2c0cm5 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c6c11cm2cm1c7c10cm4c9cm5c1c46c2cm5c0cm23c1 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c1cm6c10cm23cm10cm4c3cm3cm17c1c3c2c15cm2cm5cm29 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c4c6c8cm5c1c1cm14c1c6c3c5cm16c2cm5c2cm17 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm10c3c17c6c1c3cm7cm25c0cm12c2c9cm12cm4c15cm5 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm1cm1c1c6cm7cm11cm2cm25c1cm2c8cm23c4c1cm7c0 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm2cm4c3c4c1c5c3cm15cm15cm14cm5c1c0cm3cm3c5 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_cm6c10cm4cm2cm2c3cm1cm4c0cm22cm16c2c3c3cm1c1 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c0cm10cm2cm11c6c0c9cm2cm2c3c4c2c3c1cm13c3 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_c2cm4cm1c1cm21c3cm10cm3cm2cm7c7c0c3c3cm2c3 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c11cm7cm17cm14cm8c1c0c2cm18c7cm17cm4c5cm6c11c28 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c3c14c2cm2cm12cm5cm5cm4cm5cm46c6c16cm1c10cm10c4 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c2c4cm4cm1cm1c9cm2cm9cm5c10c1c17cm2c5cm14c0 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm2c8c7cm5c2cm6cm1c19c6cm8cm22cm2c10cm3cm13c1 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c16c6c2c0c1c2cm1c3cm21cm30c5cm40c6c4cm6cm18 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm1cm2cm1cm4cm5cm1cm8c10cm13cm10c20c18c4c10cm24c1 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(11-1 downto 0)  --	sfix(1, -10)
    );
end conv7_core21_rmcm;

architecture arch of conv7_core21_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5CM7CM2CM3CM5C10CM1C14C8C2CM13C6CM8CM7CM5CM11_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3CM1CM12C4CM1CM13CM13CM12CM28CM7CM4CM1C34C0CM74C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C50C5CM13CM56CM8CM30CM5C4CM9CM6C13CM5CM12C1CM20C19_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3CM10C2CM4C3CM3C9CM3CM7C23CM13CM2C7C40C8C5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3CM5C5C8C10CM12C9C8CM3CM9C0C11C3CM8C2CM5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM29C1CM1C1CM5C15CM3C25C9C0CM9CM4CM32C3CM2C8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM2C0C0CM4CM5C1CM17C11C8C2C6CM11CM2CM2CM16_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM14CM8CM4CM3C24C12C0C4C14C17C8C1CM13CM9C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C1C12CM10CM12CM2CM45C18CM12CM41CM2C3C5CM3CM12CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM9C1C7CM10C5CM6C38C12C8C1CM2C22C15C2C2CM15_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6C8CM5C0CM4CM1CM6C19CM8CM18CM4CM7C1CM7CM1C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4C40C8C5CM2CM1C1CM7C8C0CM2C4CM6CM8CM3C5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM8C32C4CM5C0C3CM1CM3CM12CM8C4CM3C2CM29CM9_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3C3CM2C1CM14C4C3C1CM17C0C1C0C8C7CM9C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C7C6CM1C2CM16C1C3CM6CM7CM14C0C2C8CM11CM6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM17C0C33CM5CM3C15CM1CM2CM4CM14C10C0CM20C0C31CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM7CM7CM1C2CM6CM5CM24C3C4CM2C4CM12CM4CM2C0CM5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6C11CM2CM1C7C10CM4C9CM5C1C46C2CM5C0CM23C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM6C10CM23CM10CM4C3CM3CM17C1C3C2C15CM2CM5CM29_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4C6C8CM5C1C1CM14C1C6C3C5CM16C2CM5C2CM17_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM10C3C17C6C1C3CM7CM25C0CM12C2C9CM12CM4C15CM5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM1C1C6CM7CM11CM2CM25C1CM2C8CM23C4C1CM7C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM4C3C4C1C5C3CM15CM15CM14CM5C1C0CM3CM3C5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6C10CM4CM2CM2C3CM1CM4C0CM22CM16C2C3C3CM1C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM10CM2CM11C6C0C9CM2CM2C3C4C2C3C1CM13C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2CM4CM1C1CM21C3CM10CM3CM2CM7C7C0C3C3CM2C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C11CM7CM17CM14CM8C1C0C2CM18C7CM17CM4C5CM6C11C28_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C14C2CM2CM12CM5CM5CM4CM5CM46C6C16CM1C10CM10C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C4CM4CM1CM1C9CM2CM9CM5C10C1C17CM2C5CM14C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C8C7CM5C2CM6CM1C19C6CM8CM22CM2C10CM3CM13C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C16C6C2C0C1C2CM1C3CM21CM30C5CM40C6C4CM6CM18_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM2CM1CM4CM5CM1CM8C10CM13CM10C20C18C4C10CM24C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(4, -3)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(1, -7)
    signal cm5cm7cm2cm3cm5c10cm1c14c8c2cm13c6cm8cm7cm5cm11_weight : PIPELINE_TYPE_FOR_CM5CM7CM2CM3CM5C10CM1C14C8C2CM13C6CM8CM7CM5CM11_WEIGHT;
    -- sfix(1, -7)
    signal c3cm1cm12c4cm1cm13cm13cm12cm28cm7cm4cm1c34c0cm74c0_weight : PIPELINE_TYPE_FOR_C3CM1CM12C4CM1CM13CM13CM12CM28CM7CM4CM1C34C0CM74C0_WEIGHT;
    -- sfix(1, -7)
    signal c50c5cm13cm56cm8cm30cm5c4cm9cm6c13cm5cm12c1cm20c19_weight : PIPELINE_TYPE_FOR_C50C5CM13CM56CM8CM30CM5C4CM9CM6C13CM5CM12C1CM20C19_WEIGHT;
    -- sfix(1, -7)
    signal c3cm10c2cm4c3cm3c9cm3cm7c23cm13cm2c7c40c8c5_weight : PIPELINE_TYPE_FOR_C3CM10C2CM4C3CM3C9CM3CM7C23CM13CM2C7C40C8C5_WEIGHT;
    -- sfix(1, -7)
    signal cm3cm5c5c8c10cm12c9c8cm3cm9c0c11c3cm8c2cm5_weight : PIPELINE_TYPE_FOR_CM3CM5C5C8C10CM12C9C8CM3CM9C0C11C3CM8C2CM5_WEIGHT;
    -- sfix(1, -7)
    signal cm29c1cm1c1cm5c15cm3c25c9c0cm9cm4cm32c3cm2c8_weight : PIPELINE_TYPE_FOR_CM29C1CM1C1CM5C15CM3C25C9C0CM9CM4CM32C3CM2C8_WEIGHT;
    -- sfix(1, -7)
    signal cm2cm2c0c0cm4cm5c1cm17c11c8c2c6cm11cm2cm2cm16_weight : PIPELINE_TYPE_FOR_CM2CM2C0C0CM4CM5C1CM17C11C8C2C6CM11CM2CM2CM16_WEIGHT;
    -- sfix(1, -7)
    signal cm1cm14cm8cm4cm3c24c12c0c4c14c17c8c1cm13cm9c0_weight : PIPELINE_TYPE_FOR_CM1CM14CM8CM4CM3C24C12C0C4C14C17C8C1CM13CM9C0_WEIGHT;
    -- sfix(1, -7)
    signal cm1c1c12cm10cm12cm2cm45c18cm12cm41cm2c3c5cm3cm12cm3_weight : PIPELINE_TYPE_FOR_CM1C1C12CM10CM12CM2CM45C18CM12CM41CM2C3C5CM3CM12CM3_WEIGHT;
    -- sfix(1, -7)
    signal cm9c1c7cm10c5cm6c38c12c8c1cm2c22c15c2c2cm15_weight : PIPELINE_TYPE_FOR_CM9C1C7CM10C5CM6C38C12C8C1CM2C22C15C2C2CM15_WEIGHT;
    -- sfix(1, -7)
    signal cm6c8cm5c0cm4cm1cm6c19cm8cm18cm4cm7c1cm7cm1c1_weight : PIPELINE_TYPE_FOR_CM6C8CM5C0CM4CM1CM6C19CM8CM18CM4CM7C1CM7CM1C1_WEIGHT;
    -- sfix(1, -7)
    signal c4c40c8c5cm2cm1c1cm7c8c0cm2c4cm6cm8cm3c5_weight : PIPELINE_TYPE_FOR_C4C40C8C5CM2CM1C1CM7C8C0CM2C4CM6CM8CM3C5_WEIGHT;
    -- sfix(1, -7)
    signal c0cm8c32c4cm5c0c3cm1cm3cm12cm8c4cm3c2cm29cm9_weight : PIPELINE_TYPE_FOR_C0CM8C32C4CM5C0C3CM1CM3CM12CM8C4CM3C2CM29CM9_WEIGHT;
    -- sfix(1, -7)
    signal cm3c3cm2c1cm14c4c3c1cm17c0c1c0c8c7cm9c4_weight : PIPELINE_TYPE_FOR_CM3C3CM2C1CM14C4C3C1CM17C0C1C0C8C7CM9C4_WEIGHT;
    -- sfix(1, -7)
    signal c0c7c6cm1c2cm16c1c3cm6cm7cm14c0c2c8cm11cm6_weight : PIPELINE_TYPE_FOR_C0C7C6CM1C2CM16C1C3CM6CM7CM14C0C2C8CM11CM6_WEIGHT;
    -- sfix(1, -7)
    signal cm17c0c33cm5cm3c15cm1cm2cm4cm14c10c0cm20c0c31cm1_weight : PIPELINE_TYPE_FOR_CM17C0C33CM5CM3C15CM1CM2CM4CM14C10C0CM20C0C31CM1_WEIGHT;
    -- sfix(1, -7)
    signal cm7cm7cm1c2cm6cm5cm24c3c4cm2c4cm12cm4cm2c0cm5_weight : PIPELINE_TYPE_FOR_CM7CM7CM1C2CM6CM5CM24C3C4CM2C4CM12CM4CM2C0CM5_WEIGHT;
    -- sfix(1, -7)
    signal c6c11cm2cm1c7c10cm4c9cm5c1c46c2cm5c0cm23c1_weight : PIPELINE_TYPE_FOR_C6C11CM2CM1C7C10CM4C9CM5C1C46C2CM5C0CM23C1_WEIGHT;
    -- sfix(1, -7)
    signal c1cm6c10cm23cm10cm4c3cm3cm17c1c3c2c15cm2cm5cm29_weight : PIPELINE_TYPE_FOR_C1CM6C10CM23CM10CM4C3CM3CM17C1C3C2C15CM2CM5CM29_WEIGHT;
    -- sfix(1, -7)
    signal c4c6c8cm5c1c1cm14c1c6c3c5cm16c2cm5c2cm17_weight : PIPELINE_TYPE_FOR_C4C6C8CM5C1C1CM14C1C6C3C5CM16C2CM5C2CM17_WEIGHT;
    -- sfix(1, -7)
    signal cm10c3c17c6c1c3cm7cm25c0cm12c2c9cm12cm4c15cm5_weight : PIPELINE_TYPE_FOR_CM10C3C17C6C1C3CM7CM25C0CM12C2C9CM12CM4C15CM5_WEIGHT;
    -- sfix(1, -7)
    signal cm1cm1c1c6cm7cm11cm2cm25c1cm2c8cm23c4c1cm7c0_weight : PIPELINE_TYPE_FOR_CM1CM1C1C6CM7CM11CM2CM25C1CM2C8CM23C4C1CM7C0_WEIGHT;
    -- sfix(1, -7)
    signal cm2cm4c3c4c1c5c3cm15cm15cm14cm5c1c0cm3cm3c5_weight : PIPELINE_TYPE_FOR_CM2CM4C3C4C1C5C3CM15CM15CM14CM5C1C0CM3CM3C5_WEIGHT;
    -- sfix(1, -7)
    signal cm6c10cm4cm2cm2c3cm1cm4c0cm22cm16c2c3c3cm1c1_weight : PIPELINE_TYPE_FOR_CM6C10CM4CM2CM2C3CM1CM4C0CM22CM16C2C3C3CM1C1_WEIGHT;
    -- sfix(1, -7)
    signal c0cm10cm2cm11c6c0c9cm2cm2c3c4c2c3c1cm13c3_weight : PIPELINE_TYPE_FOR_C0CM10CM2CM11C6C0C9CM2CM2C3C4C2C3C1CM13C3_WEIGHT;
    -- sfix(1, -7)
    signal c2cm4cm1c1cm21c3cm10cm3cm2cm7c7c0c3c3cm2c3_weight : PIPELINE_TYPE_FOR_C2CM4CM1C1CM21C3CM10CM3CM2CM7C7C0C3C3CM2C3_WEIGHT;
    -- sfix(1, -7)
    signal c11cm7cm17cm14cm8c1c0c2cm18c7cm17cm4c5cm6c11c28_weight : PIPELINE_TYPE_FOR_C11CM7CM17CM14CM8C1C0C2CM18C7CM17CM4C5CM6C11C28_WEIGHT;
    -- sfix(1, -7)
    signal c3c14c2cm2cm12cm5cm5cm4cm5cm46c6c16cm1c10cm10c4_weight : PIPELINE_TYPE_FOR_C3C14C2CM2CM12CM5CM5CM4CM5CM46C6C16CM1C10CM10C4_WEIGHT;
    -- sfix(1, -7)
    signal c2c4cm4cm1cm1c9cm2cm9cm5c10c1c17cm2c5cm14c0_weight : PIPELINE_TYPE_FOR_C2C4CM4CM1CM1C9CM2CM9CM5C10C1C17CM2C5CM14C0_WEIGHT;
    -- sfix(1, -7)
    signal cm2c8c7cm5c2cm6cm1c19c6cm8cm22cm2c10cm3cm13c1_weight : PIPELINE_TYPE_FOR_CM2C8C7CM5C2CM6CM1C19C6CM8CM22CM2C10CM3CM13C1_WEIGHT;
    -- sfix(1, -7)
    signal c16c6c2c0c1c2cm1c3cm21cm30c5cm40c6c4cm6cm18_weight : PIPELINE_TYPE_FOR_C16C6C2C0C1C2CM1C3CM21CM30C5CM40C6C4CM6CM18_WEIGHT;
    -- sfix(1, -7)
    signal cm1cm2cm1cm4cm5cm1cm8c10cm13cm10c20c18c4c10cm24c1_weight : PIPELINE_TYPE_FOR_CM1CM2CM1CM4CM5CM1CM8C10CM13CM10C20C18C4C10CM24C1_WEIGHT;
    -- sfix(1, -7)
    signal c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT;

    -- The zero output
    signal c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : std_logic_vector(11-1 downto 0); --	sfix(1, -10)

    -- If we use LUT multiplier and the input is unsigned, we have to cut away the msb of the result
    -- If this is the case, the temporary results are stored in the signals below.


begin
    c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 <= (others => '0');
    R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 <= c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0;
    X0_signal(0) <= X0;



    WEIGHT_ROM: entity work.conv7_core21_rmcm_weightsconstant_memory
        generic map
        (
            XI_WIDTH        	          => 8, 
            ARRAY_SIZE                    => 16,
            WORDS_PER_ADDR                => 32
        )
        port map
        (
            clk => clk,
            data_index => unsigned(SEL),
        
            dout1   => cm5cm7cm2cm3cm5c10cm1c14c8c2cm13c6cm8cm7cm5cm11_weight(0), 
            dout2   => c3cm1cm12c4cm1cm13cm13cm12cm28cm7cm4cm1c34c0cm74c0_weight(0), 
            dout3   => c50c5cm13cm56cm8cm30cm5c4cm9cm6c13cm5cm12c1cm20c19_weight(0), 
            dout4   => c3cm10c2cm4c3cm3c9cm3cm7c23cm13cm2c7c40c8c5_weight(0), 
            dout5   => cm3cm5c5c8c10cm12c9c8cm3cm9c0c11c3cm8c2cm5_weight(0), 
            dout6   => cm29c1cm1c1cm5c15cm3c25c9c0cm9cm4cm32c3cm2c8_weight(0), 
            dout7   => cm2cm2c0c0cm4cm5c1cm17c11c8c2c6cm11cm2cm2cm16_weight(0), 
            dout8   => cm1cm14cm8cm4cm3c24c12c0c4c14c17c8c1cm13cm9c0_weight(0), 
            dout9   => cm1c1c12cm10cm12cm2cm45c18cm12cm41cm2c3c5cm3cm12cm3_weight(0), 
            dout10   => cm9c1c7cm10c5cm6c38c12c8c1cm2c22c15c2c2cm15_weight(0), 
            dout11   => cm6c8cm5c0cm4cm1cm6c19cm8cm18cm4cm7c1cm7cm1c1_weight(0), 
            dout12   => c4c40c8c5cm2cm1c1cm7c8c0cm2c4cm6cm8cm3c5_weight(0), 
            dout13   => c0cm8c32c4cm5c0c3cm1cm3cm12cm8c4cm3c2cm29cm9_weight(0), 
            dout14   => cm3c3cm2c1cm14c4c3c1cm17c0c1c0c8c7cm9c4_weight(0), 
            dout15   => c0c7c6cm1c2cm16c1c3cm6cm7cm14c0c2c8cm11cm6_weight(0), 
            dout16   => cm17c0c33cm5cm3c15cm1cm2cm4cm14c10c0cm20c0c31cm1_weight(0), 
            dout17   => cm7cm7cm1c2cm6cm5cm24c3c4cm2c4cm12cm4cm2c0cm5_weight(0), 
            dout18   => c6c11cm2cm1c7c10cm4c9cm5c1c46c2cm5c0cm23c1_weight(0), 
            dout19   => c1cm6c10cm23cm10cm4c3cm3cm17c1c3c2c15cm2cm5cm29_weight(0), 
            dout20   => c4c6c8cm5c1c1cm14c1c6c3c5cm16c2cm5c2cm17_weight(0), 
            dout21   => cm10c3c17c6c1c3cm7cm25c0cm12c2c9cm12cm4c15cm5_weight(0), 
            dout22   => cm1cm1c1c6cm7cm11cm2cm25c1cm2c8cm23c4c1cm7c0_weight(0), 
            dout23   => cm2cm4c3c4c1c5c3cm15cm15cm14cm5c1c0cm3cm3c5_weight(0), 
            dout24   => cm6c10cm4cm2cm2c3cm1cm4c0cm22cm16c2c3c3cm1c1_weight(0), 
            dout25   => c0cm10cm2cm11c6c0c9cm2cm2c3c4c2c3c1cm13c3_weight(0), 
            dout26   => c2cm4cm1c1cm21c3cm10cm3cm2cm7c7c0c3c3cm2c3_weight(0), 
            dout27   => c11cm7cm17cm14cm8c1c0c2cm18c7cm17cm4c5cm6c11c28_weight(0), 
            dout28   => c3c14c2cm2cm12cm5cm5cm4cm5cm46c6c16cm1c10cm10c4_weight(0), 
            dout29   => c2c4cm4cm1cm1c9cm2cm9cm5c10c1c17cm2c5cm14c0_weight(0), 
            dout30   => cm2c8c7cm5c2cm6cm1c19c6cm8cm22cm2c10cm3cm13c1_weight(0), 
            dout31   => c16c6c2c0c1c2cm1c3cm21cm30c5cm40c6c4cm6cm18_weight(0), 
            dout32   => cm1cm2cm1cm4cm5cm1cm8c10cm13cm10c20c18c4c10cm24c1_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_cm5cm7cm2cm3cm5c10cm1c14c8c2cm13c6cm8cm7cm5cm11_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5cm7cm2cm3cm5c10cm1c14c8c2cm13c6cm8cm7cm5cm11_weight(0), cm5cm7cm2cm3cm5c10cm1c14c8c2cm13c6cm8cm7cm5cm11_weight(1));
    PL_STEP_0_for_c3cm1cm12c4cm1cm13cm13cm12cm28cm7cm4cm1c34c0cm74c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3cm1cm12c4cm1cm13cm13cm12cm28cm7cm4cm1c34c0cm74c0_weight(0), c3cm1cm12c4cm1cm13cm13cm12cm28cm7cm4cm1c34c0cm74c0_weight(1));
    PL_STEP_0_for_c50c5cm13cm56cm8cm30cm5c4cm9cm6c13cm5cm12c1cm20c19_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c50c5cm13cm56cm8cm30cm5c4cm9cm6c13cm5cm12c1cm20c19_weight(0), c50c5cm13cm56cm8cm30cm5c4cm9cm6c13cm5cm12c1cm20c19_weight(1));
    PL_STEP_0_for_c3cm10c2cm4c3cm3c9cm3cm7c23cm13cm2c7c40c8c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3cm10c2cm4c3cm3c9cm3cm7c23cm13cm2c7c40c8c5_weight(0), c3cm10c2cm4c3cm3c9cm3cm7c23cm13cm2c7c40c8c5_weight(1));
    PL_STEP_0_for_cm3cm5c5c8c10cm12c9c8cm3cm9c0c11c3cm8c2cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3cm5c5c8c10cm12c9c8cm3cm9c0c11c3cm8c2cm5_weight(0), cm3cm5c5c8c10cm12c9c8cm3cm9c0c11c3cm8c2cm5_weight(1));
    PL_STEP_0_for_cm29c1cm1c1cm5c15cm3c25c9c0cm9cm4cm32c3cm2c8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm29c1cm1c1cm5c15cm3c25c9c0cm9cm4cm32c3cm2c8_weight(0), cm29c1cm1c1cm5c15cm3c25c9c0cm9cm4cm32c3cm2c8_weight(1));
    PL_STEP_0_for_cm2cm2c0c0cm4cm5c1cm17c11c8c2c6cm11cm2cm2cm16_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm2c0c0cm4cm5c1cm17c11c8c2c6cm11cm2cm2cm16_weight(0), cm2cm2c0c0cm4cm5c1cm17c11c8c2c6cm11cm2cm2cm16_weight(1));
    PL_STEP_0_for_cm1cm14cm8cm4cm3c24c12c0c4c14c17c8c1cm13cm9c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm14cm8cm4cm3c24c12c0c4c14c17c8c1cm13cm9c0_weight(0), cm1cm14cm8cm4cm3c24c12c0c4c14c17c8c1cm13cm9c0_weight(1));
    PL_STEP_0_for_cm1c1c12cm10cm12cm2cm45c18cm12cm41cm2c3c5cm3cm12cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c1c12cm10cm12cm2cm45c18cm12cm41cm2c3c5cm3cm12cm3_weight(0), cm1c1c12cm10cm12cm2cm45c18cm12cm41cm2c3c5cm3cm12cm3_weight(1));
    PL_STEP_0_for_cm9c1c7cm10c5cm6c38c12c8c1cm2c22c15c2c2cm15_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm9c1c7cm10c5cm6c38c12c8c1cm2c22c15c2c2cm15_weight(0), cm9c1c7cm10c5cm6c38c12c8c1cm2c22c15c2c2cm15_weight(1));
    PL_STEP_0_for_cm6c8cm5c0cm4cm1cm6c19cm8cm18cm4cm7c1cm7cm1c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6c8cm5c0cm4cm1cm6c19cm8cm18cm4cm7c1cm7cm1c1_weight(0), cm6c8cm5c0cm4cm1cm6c19cm8cm18cm4cm7c1cm7cm1c1_weight(1));
    PL_STEP_0_for_c4c40c8c5cm2cm1c1cm7c8c0cm2c4cm6cm8cm3c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4c40c8c5cm2cm1c1cm7c8c0cm2c4cm6cm8cm3c5_weight(0), c4c40c8c5cm2cm1c1cm7c8c0cm2c4cm6cm8cm3c5_weight(1));
    PL_STEP_0_for_c0cm8c32c4cm5c0c3cm1cm3cm12cm8c4cm3c2cm29cm9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm8c32c4cm5c0c3cm1cm3cm12cm8c4cm3c2cm29cm9_weight(0), c0cm8c32c4cm5c0c3cm1cm3cm12cm8c4cm3c2cm29cm9_weight(1));
    PL_STEP_0_for_cm3c3cm2c1cm14c4c3c1cm17c0c1c0c8c7cm9c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3c3cm2c1cm14c4c3c1cm17c0c1c0c8c7cm9c4_weight(0), cm3c3cm2c1cm14c4c3c1cm17c0c1c0c8c7cm9c4_weight(1));
    PL_STEP_0_for_c0c7c6cm1c2cm16c1c3cm6cm7cm14c0c2c8cm11cm6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c7c6cm1c2cm16c1c3cm6cm7cm14c0c2c8cm11cm6_weight(0), c0c7c6cm1c2cm16c1c3cm6cm7cm14c0c2c8cm11cm6_weight(1));
    PL_STEP_0_for_cm17c0c33cm5cm3c15cm1cm2cm4cm14c10c0cm20c0c31cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm17c0c33cm5cm3c15cm1cm2cm4cm14c10c0cm20c0c31cm1_weight(0), cm17c0c33cm5cm3c15cm1cm2cm4cm14c10c0cm20c0c31cm1_weight(1));
    PL_STEP_0_for_cm7cm7cm1c2cm6cm5cm24c3c4cm2c4cm12cm4cm2c0cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm7cm7cm1c2cm6cm5cm24c3c4cm2c4cm12cm4cm2c0cm5_weight(0), cm7cm7cm1c2cm6cm5cm24c3c4cm2c4cm12cm4cm2c0cm5_weight(1));
    PL_STEP_0_for_c6c11cm2cm1c7c10cm4c9cm5c1c46c2cm5c0cm23c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6c11cm2cm1c7c10cm4c9cm5c1c46c2cm5c0cm23c1_weight(0), c6c11cm2cm1c7c10cm4c9cm5c1c46c2cm5c0cm23c1_weight(1));
    PL_STEP_0_for_c1cm6c10cm23cm10cm4c3cm3cm17c1c3c2c15cm2cm5cm29_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm6c10cm23cm10cm4c3cm3cm17c1c3c2c15cm2cm5cm29_weight(0), c1cm6c10cm23cm10cm4c3cm3cm17c1c3c2c15cm2cm5cm29_weight(1));
    PL_STEP_0_for_c4c6c8cm5c1c1cm14c1c6c3c5cm16c2cm5c2cm17_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4c6c8cm5c1c1cm14c1c6c3c5cm16c2cm5c2cm17_weight(0), c4c6c8cm5c1c1cm14c1c6c3c5cm16c2cm5c2cm17_weight(1));
    PL_STEP_0_for_cm10c3c17c6c1c3cm7cm25c0cm12c2c9cm12cm4c15cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm10c3c17c6c1c3cm7cm25c0cm12c2c9cm12cm4c15cm5_weight(0), cm10c3c17c6c1c3cm7cm25c0cm12c2c9cm12cm4c15cm5_weight(1));
    PL_STEP_0_for_cm1cm1c1c6cm7cm11cm2cm25c1cm2c8cm23c4c1cm7c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm1c1c6cm7cm11cm2cm25c1cm2c8cm23c4c1cm7c0_weight(0), cm1cm1c1c6cm7cm11cm2cm25c1cm2c8cm23c4c1cm7c0_weight(1));
    PL_STEP_0_for_cm2cm4c3c4c1c5c3cm15cm15cm14cm5c1c0cm3cm3c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm4c3c4c1c5c3cm15cm15cm14cm5c1c0cm3cm3c5_weight(0), cm2cm4c3c4c1c5c3cm15cm15cm14cm5c1c0cm3cm3c5_weight(1));
    PL_STEP_0_for_cm6c10cm4cm2cm2c3cm1cm4c0cm22cm16c2c3c3cm1c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6c10cm4cm2cm2c3cm1cm4c0cm22cm16c2c3c3cm1c1_weight(0), cm6c10cm4cm2cm2c3cm1cm4c0cm22cm16c2c3c3cm1c1_weight(1));
    PL_STEP_0_for_c0cm10cm2cm11c6c0c9cm2cm2c3c4c2c3c1cm13c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm10cm2cm11c6c0c9cm2cm2c3c4c2c3c1cm13c3_weight(0), c0cm10cm2cm11c6c0c9cm2cm2c3c4c2c3c1cm13c3_weight(1));
    PL_STEP_0_for_c2cm4cm1c1cm21c3cm10cm3cm2cm7c7c0c3c3cm2c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2cm4cm1c1cm21c3cm10cm3cm2cm7c7c0c3c3cm2c3_weight(0), c2cm4cm1c1cm21c3cm10cm3cm2cm7c7c0c3c3cm2c3_weight(1));
    PL_STEP_0_for_c11cm7cm17cm14cm8c1c0c2cm18c7cm17cm4c5cm6c11c28_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c11cm7cm17cm14cm8c1c0c2cm18c7cm17cm4c5cm6c11c28_weight(0), c11cm7cm17cm14cm8c1c0c2cm18c7cm17cm4c5cm6c11c28_weight(1));
    PL_STEP_0_for_c3c14c2cm2cm12cm5cm5cm4cm5cm46c6c16cm1c10cm10c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c14c2cm2cm12cm5cm5cm4cm5cm46c6c16cm1c10cm10c4_weight(0), c3c14c2cm2cm12cm5cm5cm4cm5cm46c6c16cm1c10cm10c4_weight(1));
    PL_STEP_0_for_c2c4cm4cm1cm1c9cm2cm9cm5c10c1c17cm2c5cm14c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c4cm4cm1cm1c9cm2cm9cm5c10c1c17cm2c5cm14c0_weight(0), c2c4cm4cm1cm1c9cm2cm9cm5c10c1c17cm2c5cm14c0_weight(1));
    PL_STEP_0_for_cm2c8c7cm5c2cm6cm1c19c6cm8cm22cm2c10cm3cm13c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c8c7cm5c2cm6cm1c19c6cm8cm22cm2c10cm3cm13c1_weight(0), cm2c8c7cm5c2cm6cm1c19c6cm8cm22cm2c10cm3cm13c1_weight(1));
    PL_STEP_0_for_c16c6c2c0c1c2cm1c3cm21cm30c5cm40c6c4cm6cm18_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c16c6c2c0c1c2cm1c3cm21cm30c5cm40c6c4cm6cm18_weight(0), c16c6c2c0c1c2cm1c3cm21cm30c5cm40c6c4cm6cm18_weight(1));
    PL_STEP_0_for_cm1cm2cm1cm4cm5cm1cm8c10cm13cm10c20c18c4c10cm24c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm2cm1cm4cm5cm1cm8c10cm13cm10c20c18c4c10cm24c1_weight(0), cm1cm2cm1cm4cm5cm1cm8c10cm13cm10c20c18c4c10cm24c1_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    c3cm1cm12c4cm1cm13cm13cm12cm28cm7cm4cm1c34c0cm74c0_c0cm10cm2cm11c6c0c9cm2cm2c3c4c2c3c1cm13c3_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 8,
			B_WIDTH => 5,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c3cm1cm12c4cm1cm13cm13cm12cm28cm7cm4cm1c34c0cm74c0_weight(1)(8-1 downto 0),
			B	=> c0cm10cm2cm11c6c0c9cm2cm2c3c4c2c3c1cm13c3_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c3cm1cm12c4cm1cm13cm13cm12cm28cm7cm4cm1c34c0cm74c0,
			CxB => R_c0cm10cm2cm11c6c0c9cm2cm2c3c4c2c3c1cm13c3
		);

    c50c5cm13cm56cm8cm30cm5c4cm9cm6c13cm5cm12c1cm20c19_cm2cm4c3c4c1c5c3cm15cm15cm14cm5c1c0cm3cm3c5_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c50c5cm13cm56cm8cm30cm5c4cm9cm6c13cm5cm12c1cm20c19_weight(1)(7-1 downto 0),
			B	=> cm2cm4c3c4c1c5c3cm15cm15cm14cm5c1c0cm3cm3c5_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c50c5cm13cm56cm8cm30cm5c4cm9cm6c13cm5cm12c1cm20c19,
			CxB => R_cm2cm4c3c4c1c5c3cm15cm15cm14cm5c1c0cm3cm3c5
		);

    c3cm10c2cm4c3cm3c9cm3cm7c23cm13cm2c7c40c8c5_c0c7c6cm1c2cm16c1c3cm6cm7cm14c0c2c8cm11cm6_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c3cm10c2cm4c3cm3c9cm3cm7c23cm13cm2c7c40c8c5_weight(1)(7-1 downto 0),
			B	=> c0c7c6cm1c2cm16c1c3cm6cm7cm14c0c2c8cm11cm6_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c3cm10c2cm4c3cm3c9cm3cm7c23cm13cm2c7c40c8c5,
			CxB => R_c0c7c6cm1c2cm16c1c3cm6cm7cm14c0c2c8cm11cm6
		);

    cm1c1c12cm10cm12cm2cm45c18cm12cm41cm2c3c5cm3cm12cm3_cm3cm5c5c8c10cm12c9c8cm3cm9c0c11c3cm8c2cm5_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm1c1c12cm10cm12cm2cm45c18cm12cm41cm2c3c5cm3cm12cm3_weight(1)(7-1 downto 0),
			B	=> cm3cm5c5c8c10cm12c9c8cm3cm9c0c11c3cm8c2cm5_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1c1c12cm10cm12cm2cm45c18cm12cm41cm2c3c5cm3cm12cm3,
			CxB => R_cm3cm5c5c8c10cm12c9c8cm3cm9c0c11c3cm8c2cm5
		);

    cm9c1c7cm10c5cm6c38c12c8c1cm2c22c15c2c2cm15_cm5cm7cm2cm3cm5c10cm1c14c8c2cm13c6cm8cm7cm5cm11_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm9c1c7cm10c5cm6c38c12c8c1cm2c22c15c2c2cm15_weight(1)(7-1 downto 0),
			B	=> cm5cm7cm2cm3cm5c10cm1c14c8c2cm13c6cm8cm7cm5cm11_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm9c1c7cm10c5cm6c38c12c8c1cm2c22c15c2c2cm15,
			CxB => R_cm5cm7cm2cm3cm5c10cm1c14c8c2cm13c6cm8cm7cm5cm11
		);

    c4c40c8c5cm2cm1c1cm7c8c0cm2c4cm6cm8cm3c5_cm1cm2cm1cm4cm5cm1cm8c10cm13cm10c20c18c4c10cm24c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c4c40c8c5cm2cm1c1cm7c8c0cm2c4cm6cm8cm3c5_weight(1)(7-1 downto 0),
			B	=> cm1cm2cm1cm4cm5cm1cm8c10cm13cm10c20c18c4c10cm24c1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c4c40c8c5cm2cm1c1cm7c8c0cm2c4cm6cm8cm3c5,
			CxB => R_cm1cm2cm1cm4cm5cm1cm8c10cm13cm10c20c18c4c10cm24c1
		);

    c0cm8c32c4cm5c0c3cm1cm3cm12cm8c4cm3c2cm29cm9_cm2c8c7cm5c2cm6cm1c19c6cm8cm22cm2c10cm3cm13c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0cm8c32c4cm5c0c3cm1cm3cm12cm8c4cm3c2cm29cm9_weight(1)(7-1 downto 0),
			B	=> cm2c8c7cm5c2cm6cm1c19c6cm8cm22cm2c10cm3cm13c1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0cm8c32c4cm5c0c3cm1cm3cm12cm8c4cm3c2cm29cm9,
			CxB => R_cm2c8c7cm5c2cm6cm1c19c6cm8cm22cm2c10cm3cm13c1
		);

    cm17c0c33cm5cm3c15cm1cm2cm4cm14c10c0cm20c0c31cm1_c2c4cm4cm1cm1c9cm2cm9cm5c10c1c17cm2c5cm14c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm17c0c33cm5cm3c15cm1cm2cm4cm14c10c0cm20c0c31cm1_weight(1)(7-1 downto 0),
			B	=> c2c4cm4cm1cm1c9cm2cm9cm5c10c1c17cm2c5cm14c0_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm17c0c33cm5cm3c15cm1cm2cm4cm14c10c0cm20c0c31cm1,
			CxB => R_c2c4cm4cm1cm1c9cm2cm9cm5c10c1c17cm2c5cm14c0
		);

    c6c11cm2cm1c7c10cm4c9cm5c1c46c2cm5c0cm23c1_c11cm7cm17cm14cm8c1c0c2cm18c7cm17cm4c5cm6c11c28_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c6c11cm2cm1c7c10cm4c9cm5c1c46c2cm5c0cm23c1_weight(1)(7-1 downto 0),
			B	=> c11cm7cm17cm14cm8c1c0c2cm18c7cm17cm4c5cm6c11c28_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c6c11cm2cm1c7c10cm4c9cm5c1c46c2cm5c0cm23c1,
			CxB => R_c11cm7cm17cm14cm8c1c0c2cm18c7cm17cm4c5cm6c11c28
		);

    c3c14c2cm2cm12cm5cm5cm4cm5cm46c6c16cm1c10cm10c4_c2cm4cm1c1cm21c3cm10cm3cm2cm7c7c0c3c3cm2c3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c3c14c2cm2cm12cm5cm5cm4cm5cm46c6c16cm1c10cm10c4_weight(1)(7-1 downto 0),
			B	=> c2cm4cm1c1cm21c3cm10cm3cm2cm7c7c0c3c3cm2c3_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c3c14c2cm2cm12cm5cm5cm4cm5cm46c6c16cm1c10cm10c4,
			CxB => R_c2cm4cm1c1cm21c3cm10cm3cm2cm7c7c0c3c3cm2c3
		);

    c16c6c2c0c1c2cm1c3cm21cm30c5cm40c6c4cm6cm18_cm6c10cm4cm2cm2c3cm1cm4c0cm22cm16c2c3c3cm1c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c16c6c2c0c1c2cm1c3cm21cm30c5cm40c6c4cm6cm18_weight(1)(7-1 downto 0),
			B	=> cm6c10cm4cm2cm2c3cm1cm4c0cm22cm16c2c3c3cm1c1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c16c6c2c0c1c2cm1c3cm21cm30c5cm40c6c4cm6cm18,
			CxB => R_cm6c10cm4cm2cm2c3cm1cm4c0cm22cm16c2c3c3cm1c1
		);

    cm29c1cm1c1cm5c15cm3c25c9c0cm9cm4cm32c3cm2c8_cm1cm1c1c6cm7cm11cm2cm25c1cm2c8cm23c4c1cm7c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm29c1cm1c1cm5c15cm3c25c9c0cm9cm4cm32c3cm2c8_weight(1)(6-1 downto 0),
			B	=> cm1cm1c1c6cm7cm11cm2cm25c1cm2c8cm23c4c1cm7c0_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm29c1cm1c1cm5c15cm3c25c9c0cm9cm4cm32c3cm2c8,
			CxB => R_cm1cm1c1c6cm7cm11cm2cm25c1cm2c8cm23c4c1cm7c0
		);

    cm2cm2c0c0cm4cm5c1cm17c11c8c2c6cm11cm2cm2cm16_cm10c3c17c6c1c3cm7cm25c0cm12c2c9cm12cm4c15cm5_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2cm2c0c0cm4cm5c1cm17c11c8c2c6cm11cm2cm2cm16_weight(1)(6-1 downto 0),
			B	=> cm10c3c17c6c1c3cm7cm25c0cm12c2c9cm12cm4c15cm5_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2cm2c0c0cm4cm5c1cm17c11c8c2c6cm11cm2cm2cm16,
			CxB => R_cm10c3c17c6c1c3cm7cm25c0cm12c2c9cm12cm4c15cm5
		);

    cm1cm14cm8cm4cm3c24c12c0c4c14c17c8c1cm13cm9c0_c4c6c8cm5c1c1cm14c1c6c3c5cm16c2cm5c2cm17_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm1cm14cm8cm4cm3c24c12c0c4c14c17c8c1cm13cm9c0_weight(1)(6-1 downto 0),
			B	=> c4c6c8cm5c1c1cm14c1c6c3c5cm16c2cm5c2cm17_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1cm14cm8cm4cm3c24c12c0c4c14c17c8c1cm13cm9c0,
			CxB => R_c4c6c8cm5c1c1cm14c1c6c3c5cm16c2cm5c2cm17
		);

    cm6c8cm5c0cm4cm1cm6c19cm8cm18cm4cm7c1cm7cm1c1_c1cm6c10cm23cm10cm4c3cm3cm17c1c3c2c15cm2cm5cm29_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm6c8cm5c0cm4cm1cm6c19cm8cm18cm4cm7c1cm7cm1c1_weight(1)(6-1 downto 0),
			B	=> c1cm6c10cm23cm10cm4c3cm3cm17c1c3c2c15cm2cm5cm29_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm6c8cm5c0cm4cm1cm6c19cm8cm18cm4cm7c1cm7cm1c1,
			CxB => R_c1cm6c10cm23cm10cm4c3cm3cm17c1c3c2c15cm2cm5cm29
		);

    cm3c3cm2c1cm14c4c3c1cm17c0c1c0c8c7cm9c4_cm7cm7cm1c2cm6cm5cm24c3c4cm2c4cm12cm4cm2c0cm5_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm3c3cm2c1cm14c4c3c1cm17c0c1c0c8c7cm9c4_weight(1)(6-1 downto 0),
			B	=> cm7cm7cm1c2cm6cm5cm24c3c4cm2c4cm12cm4cm2c0cm5_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm3c3cm2c1cm14c4c3c1cm17c0c1c0c8c7cm9c4,
			CxB => R_cm7cm7cm1c2cm6cm5cm24c3c4cm2c4cm12cm4cm2c0cm5
		);




end architecture;
