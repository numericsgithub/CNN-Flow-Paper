library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core20_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        R_cm11c8cm64c3c13c22cm7c19cm6c0c15c3c2c0cm2c2 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c7cm5cm8cm3c1c9c5cm24c6c11c11c24c2c4cm1c42 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c7cm14cm6c3cm4cm60c5c1cm2c4cm5c2c1c8c5c2 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm13c4cm15c30cm12cm3cm4cm2cm35c8c22c10c81c6c14c4 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c22cm6cm27cm12c3cm24cm13cm6c37cm13cm8cm13cm3cm21cm4cm11 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c4c6cm45c9cm3c23c8c35c1cm3c7cm11cm1cm9cm10cm8 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c4c3cm1cm4c6c26c0cm24c8cm8c5c7c11cm5c0cm1 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c21cm15c48cm1cm9cm5c30cm6cm40c4cm12c3cm1cm4c2c0 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm3c15c9cm14cm3cm12cm6cm12cm1c26c3c21c37c4c16cm24 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm6cm4cm11cm2c3cm10c7c16c0c1c6c0cm1c0cm7c3 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm80c11c8cm20cm19cm5cm9c50cm32cm40c0cm3cm13cm2cm2cm9 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_cm6c2cm2cm8cm2c0cm3cm16cm10cm3c10c2cm4c1c4c0 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_cm2cm56cm4c0cm5c21c5c2cm14cm4cm6c4cm1cm4c5c0 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c11c0c2c1cm14c2c3c3cm13cm5cm4c9cm3cm4cm7c6 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_c1c55c7cm5cm5cm37cm6c0cm16c6cm3c4c8cm9cm2c0 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c2cm9c2cm7cm5cm15c6c5cm6cm8cm2cm28c6cm5c7c0 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c41c28cm9cm6c32c12cm29c11c27c5c7cm13c4cm1c8cm1 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c7cm3c6c9c14cm1c6cm3c1c4c7cm7c2cm4c3c0 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_c7c20c7c6cm45c4c4cm2c9c8cm15cm1c3c5cm7cm3 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c18c6cm9cm29cm6cm26cm21c5cm33cm18c3cm16cm4cm5c7c0 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c1cm4c1c4cm1cm6cm4cm5c0cm5cm1cm2c0c0cm5c68 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_cm14cm12cm17cm14c12cm7cm9cm53cm20cm25c68cm13c8cm7cm2cm7 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c9cm7c6c4c11c4cm12cm18c24cm7c14c4c2c3cm8cm26 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c13c51c7c14cm6cm20c6c38cm26cm4cm11cm8c2c2cm23cm8 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c5cm5cm2c13cm21cm3c11c2cm4c0c1c9c34cm2c2c15 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm10cm57cm1cm2cm24cm4cm20cm5cm3c13c10cm12cm26cm1cm35c0 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm13cm7cm2cm2cm7c5cm5c0cm6cm5c1cm12c9cm1c2c0 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_c22cm39c3cm32c1cm50cm13cm1c26cm23cm16c7cm3cm8c1cm3 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm23c24cm6c2cm12c6cm4cm9cm10cm7c18c2c1cm7c6cm9 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c36c2c4c8cm2c16cm15c23c8cm1c1cm5cm1c5c6cm4 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm28c2cm1cm7cm4c6cm1cm8cm8c3c1cm3c3cm4c1cm2 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c13cm36c16cm31cm30cm19cm7c27cm12cm4c8cm7c7c1c1c5 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(11-1 downto 0)  --	sfix(1, -10)
    );
end conv7_core20_rmcm;

architecture arch of conv7_core20_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_CM11C8CM64C3C13C22CM7C19CM6C0C15C3C2C0CM2C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C7CM5CM8CM3C1C9C5CM24C6C11C11C24C2C4CM1C42_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C7CM14CM6C3CM4CM60C5C1CM2C4CM5C2C1C8C5C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM13C4CM15C30CM12CM3CM4CM2CM35C8C22C10C81C6C14C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C22CM6CM27CM12C3CM24CM13CM6C37CM13CM8CM13CM3CM21CM4CM11_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4C6CM45C9CM3C23C8C35C1CM3C7CM11CM1CM9CM10CM8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4C3CM1CM4C6C26C0CM24C8CM8C5C7C11CM5C0CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C21CM15C48CM1CM9CM5C30CM6CM40C4CM12C3CM1CM4C2C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3C15C9CM14CM3CM12CM6CM12CM1C26C3C21C37C4C16CM24_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6CM4CM11CM2C3CM10C7C16C0C1C6C0CM1C0CM7C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM80C11C8CM20CM19CM5CM9C50CM32CM40C0CM3CM13CM2CM2CM9_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6C2CM2CM8CM2C0CM3CM16CM10CM3C10C2CM4C1C4C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM56CM4C0CM5C21C5C2CM14CM4CM6C4CM1CM4C5C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C11C0C2C1CM14C2C3C3CM13CM5CM4C9CM3CM4CM7C6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C55C7CM5CM5CM37CM6C0CM16C6CM3C4C8CM9CM2C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2CM9C2CM7CM5CM15C6C5CM6CM8CM2CM28C6CM5C7C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C41C28CM9CM6C32C12CM29C11C27C5C7CM13C4CM1C8CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C7CM3C6C9C14CM1C6CM3C1C4C7CM7C2CM4C3C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C7C20C7C6CM45C4C4CM2C9C8CM15CM1C3C5CM7CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C18C6CM9CM29CM6CM26CM21C5CM33CM18C3CM16CM4CM5C7C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM4C1C4CM1CM6CM4CM5C0CM5CM1CM2C0C0CM5C68_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM14CM12CM17CM14C12CM7CM9CM53CM20CM25C68CM13C8CM7CM2CM7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C9CM7C6C4C11C4CM12CM18C24CM7C14C4C2C3CM8CM26_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C13C51C7C14CM6CM20C6C38CM26CM4CM11CM8C2C2CM23CM8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5CM5CM2C13CM21CM3C11C2CM4C0C1C9C34CM2C2C15_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM10CM57CM1CM2CM24CM4CM20CM5CM3C13C10CM12CM26CM1CM35C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM13CM7CM2CM2CM7C5CM5C0CM6CM5C1CM12C9CM1C2C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C22CM39C3CM32C1CM50CM13CM1C26CM23CM16C7CM3CM8C1CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM23C24CM6C2CM12C6CM4CM9CM10CM7C18C2C1CM7C6CM9_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C36C2C4C8CM2C16CM15C23C8CM1C1CM5CM1C5C6CM4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM28C2CM1CM7CM4C6CM1CM8CM8C3C1CM3C3CM4C1CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C13CM36C16CM31CM30CM19CM7C27CM12CM4C8CM7C7C1C1C5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(4, -3)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(1, -7)
    signal cm11c8cm64c3c13c22cm7c19cm6c0c15c3c2c0cm2c2_weight : PIPELINE_TYPE_FOR_CM11C8CM64C3C13C22CM7C19CM6C0C15C3C2C0CM2C2_WEIGHT;
    -- sfix(1, -7)
    signal c7cm5cm8cm3c1c9c5cm24c6c11c11c24c2c4cm1c42_weight : PIPELINE_TYPE_FOR_C7CM5CM8CM3C1C9C5CM24C6C11C11C24C2C4CM1C42_WEIGHT;
    -- sfix(1, -7)
    signal c7cm14cm6c3cm4cm60c5c1cm2c4cm5c2c1c8c5c2_weight : PIPELINE_TYPE_FOR_C7CM14CM6C3CM4CM60C5C1CM2C4CM5C2C1C8C5C2_WEIGHT;
    -- sfix(1, -7)
    signal cm13c4cm15c30cm12cm3cm4cm2cm35c8c22c10c81c6c14c4_weight : PIPELINE_TYPE_FOR_CM13C4CM15C30CM12CM3CM4CM2CM35C8C22C10C81C6C14C4_WEIGHT;
    -- sfix(1, -7)
    signal c22cm6cm27cm12c3cm24cm13cm6c37cm13cm8cm13cm3cm21cm4cm11_weight : PIPELINE_TYPE_FOR_C22CM6CM27CM12C3CM24CM13CM6C37CM13CM8CM13CM3CM21CM4CM11_WEIGHT;
    -- sfix(1, -7)
    signal c4c6cm45c9cm3c23c8c35c1cm3c7cm11cm1cm9cm10cm8_weight : PIPELINE_TYPE_FOR_C4C6CM45C9CM3C23C8C35C1CM3C7CM11CM1CM9CM10CM8_WEIGHT;
    -- sfix(1, -7)
    signal c4c3cm1cm4c6c26c0cm24c8cm8c5c7c11cm5c0cm1_weight : PIPELINE_TYPE_FOR_C4C3CM1CM4C6C26C0CM24C8CM8C5C7C11CM5C0CM1_WEIGHT;
    -- sfix(1, -7)
    signal c21cm15c48cm1cm9cm5c30cm6cm40c4cm12c3cm1cm4c2c0_weight : PIPELINE_TYPE_FOR_C21CM15C48CM1CM9CM5C30CM6CM40C4CM12C3CM1CM4C2C0_WEIGHT;
    -- sfix(1, -7)
    signal cm3c15c9cm14cm3cm12cm6cm12cm1c26c3c21c37c4c16cm24_weight : PIPELINE_TYPE_FOR_CM3C15C9CM14CM3CM12CM6CM12CM1C26C3C21C37C4C16CM24_WEIGHT;
    -- sfix(1, -7)
    signal cm6cm4cm11cm2c3cm10c7c16c0c1c6c0cm1c0cm7c3_weight : PIPELINE_TYPE_FOR_CM6CM4CM11CM2C3CM10C7C16C0C1C6C0CM1C0CM7C3_WEIGHT;
    -- sfix(1, -7)
    signal cm80c11c8cm20cm19cm5cm9c50cm32cm40c0cm3cm13cm2cm2cm9_weight : PIPELINE_TYPE_FOR_CM80C11C8CM20CM19CM5CM9C50CM32CM40C0CM3CM13CM2CM2CM9_WEIGHT;
    -- sfix(1, -7)
    signal cm6c2cm2cm8cm2c0cm3cm16cm10cm3c10c2cm4c1c4c0_weight : PIPELINE_TYPE_FOR_CM6C2CM2CM8CM2C0CM3CM16CM10CM3C10C2CM4C1C4C0_WEIGHT;
    -- sfix(1, -7)
    signal cm2cm56cm4c0cm5c21c5c2cm14cm4cm6c4cm1cm4c5c0_weight : PIPELINE_TYPE_FOR_CM2CM56CM4C0CM5C21C5C2CM14CM4CM6C4CM1CM4C5C0_WEIGHT;
    -- sfix(1, -7)
    signal c11c0c2c1cm14c2c3c3cm13cm5cm4c9cm3cm4cm7c6_weight : PIPELINE_TYPE_FOR_C11C0C2C1CM14C2C3C3CM13CM5CM4C9CM3CM4CM7C6_WEIGHT;
    -- sfix(1, -7)
    signal c1c55c7cm5cm5cm37cm6c0cm16c6cm3c4c8cm9cm2c0_weight : PIPELINE_TYPE_FOR_C1C55C7CM5CM5CM37CM6C0CM16C6CM3C4C8CM9CM2C0_WEIGHT;
    -- sfix(1, -7)
    signal c2cm9c2cm7cm5cm15c6c5cm6cm8cm2cm28c6cm5c7c0_weight : PIPELINE_TYPE_FOR_C2CM9C2CM7CM5CM15C6C5CM6CM8CM2CM28C6CM5C7C0_WEIGHT;
    -- sfix(1, -7)
    signal c41c28cm9cm6c32c12cm29c11c27c5c7cm13c4cm1c8cm1_weight : PIPELINE_TYPE_FOR_C41C28CM9CM6C32C12CM29C11C27C5C7CM13C4CM1C8CM1_WEIGHT;
    -- sfix(1, -7)
    signal c7cm3c6c9c14cm1c6cm3c1c4c7cm7c2cm4c3c0_weight : PIPELINE_TYPE_FOR_C7CM3C6C9C14CM1C6CM3C1C4C7CM7C2CM4C3C0_WEIGHT;
    -- sfix(1, -7)
    signal c7c20c7c6cm45c4c4cm2c9c8cm15cm1c3c5cm7cm3_weight : PIPELINE_TYPE_FOR_C7C20C7C6CM45C4C4CM2C9C8CM15CM1C3C5CM7CM3_WEIGHT;
    -- sfix(1, -7)
    signal c18c6cm9cm29cm6cm26cm21c5cm33cm18c3cm16cm4cm5c7c0_weight : PIPELINE_TYPE_FOR_C18C6CM9CM29CM6CM26CM21C5CM33CM18C3CM16CM4CM5C7C0_WEIGHT;
    -- sfix(1, -7)
    signal c1cm4c1c4cm1cm6cm4cm5c0cm5cm1cm2c0c0cm5c68_weight : PIPELINE_TYPE_FOR_C1CM4C1C4CM1CM6CM4CM5C0CM5CM1CM2C0C0CM5C68_WEIGHT;
    -- sfix(1, -7)
    signal cm14cm12cm17cm14c12cm7cm9cm53cm20cm25c68cm13c8cm7cm2cm7_weight : PIPELINE_TYPE_FOR_CM14CM12CM17CM14C12CM7CM9CM53CM20CM25C68CM13C8CM7CM2CM7_WEIGHT;
    -- sfix(1, -7)
    signal c9cm7c6c4c11c4cm12cm18c24cm7c14c4c2c3cm8cm26_weight : PIPELINE_TYPE_FOR_C9CM7C6C4C11C4CM12CM18C24CM7C14C4C2C3CM8CM26_WEIGHT;
    -- sfix(1, -7)
    signal c13c51c7c14cm6cm20c6c38cm26cm4cm11cm8c2c2cm23cm8_weight : PIPELINE_TYPE_FOR_C13C51C7C14CM6CM20C6C38CM26CM4CM11CM8C2C2CM23CM8_WEIGHT;
    -- sfix(1, -7)
    signal c5cm5cm2c13cm21cm3c11c2cm4c0c1c9c34cm2c2c15_weight : PIPELINE_TYPE_FOR_C5CM5CM2C13CM21CM3C11C2CM4C0C1C9C34CM2C2C15_WEIGHT;
    -- sfix(1, -7)
    signal cm10cm57cm1cm2cm24cm4cm20cm5cm3c13c10cm12cm26cm1cm35c0_weight : PIPELINE_TYPE_FOR_CM10CM57CM1CM2CM24CM4CM20CM5CM3C13C10CM12CM26CM1CM35C0_WEIGHT;
    -- sfix(1, -7)
    signal cm13cm7cm2cm2cm7c5cm5c0cm6cm5c1cm12c9cm1c2c0_weight : PIPELINE_TYPE_FOR_CM13CM7CM2CM2CM7C5CM5C0CM6CM5C1CM12C9CM1C2C0_WEIGHT;
    -- sfix(1, -7)
    signal c22cm39c3cm32c1cm50cm13cm1c26cm23cm16c7cm3cm8c1cm3_weight : PIPELINE_TYPE_FOR_C22CM39C3CM32C1CM50CM13CM1C26CM23CM16C7CM3CM8C1CM3_WEIGHT;
    -- sfix(1, -7)
    signal cm23c24cm6c2cm12c6cm4cm9cm10cm7c18c2c1cm7c6cm9_weight : PIPELINE_TYPE_FOR_CM23C24CM6C2CM12C6CM4CM9CM10CM7C18C2C1CM7C6CM9_WEIGHT;
    -- sfix(1, -7)
    signal c36c2c4c8cm2c16cm15c23c8cm1c1cm5cm1c5c6cm4_weight : PIPELINE_TYPE_FOR_C36C2C4C8CM2C16CM15C23C8CM1C1CM5CM1C5C6CM4_WEIGHT;
    -- sfix(1, -7)
    signal cm28c2cm1cm7cm4c6cm1cm8cm8c3c1cm3c3cm4c1cm2_weight : PIPELINE_TYPE_FOR_CM28C2CM1CM7CM4C6CM1CM8CM8C3C1CM3C3CM4C1CM2_WEIGHT;
    -- sfix(1, -7)
    signal c13cm36c16cm31cm30cm19cm7c27cm12cm4c8cm7c7c1c1c5_weight : PIPELINE_TYPE_FOR_C13CM36C16CM31CM30CM19CM7C27CM12CM4C8CM7C7C1C1C5_WEIGHT;
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



    WEIGHT_ROM: entity work.conv7_core20_rmcm_weightsconstant_memory
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
        
            dout1   => cm11c8cm64c3c13c22cm7c19cm6c0c15c3c2c0cm2c2_weight(0), 
            dout2   => c7cm5cm8cm3c1c9c5cm24c6c11c11c24c2c4cm1c42_weight(0), 
            dout3   => c7cm14cm6c3cm4cm60c5c1cm2c4cm5c2c1c8c5c2_weight(0), 
            dout4   => cm13c4cm15c30cm12cm3cm4cm2cm35c8c22c10c81c6c14c4_weight(0), 
            dout5   => c22cm6cm27cm12c3cm24cm13cm6c37cm13cm8cm13cm3cm21cm4cm11_weight(0), 
            dout6   => c4c6cm45c9cm3c23c8c35c1cm3c7cm11cm1cm9cm10cm8_weight(0), 
            dout7   => c4c3cm1cm4c6c26c0cm24c8cm8c5c7c11cm5c0cm1_weight(0), 
            dout8   => c21cm15c48cm1cm9cm5c30cm6cm40c4cm12c3cm1cm4c2c0_weight(0), 
            dout9   => cm3c15c9cm14cm3cm12cm6cm12cm1c26c3c21c37c4c16cm24_weight(0), 
            dout10   => cm6cm4cm11cm2c3cm10c7c16c0c1c6c0cm1c0cm7c3_weight(0), 
            dout11   => cm80c11c8cm20cm19cm5cm9c50cm32cm40c0cm3cm13cm2cm2cm9_weight(0), 
            dout12   => cm6c2cm2cm8cm2c0cm3cm16cm10cm3c10c2cm4c1c4c0_weight(0), 
            dout13   => cm2cm56cm4c0cm5c21c5c2cm14cm4cm6c4cm1cm4c5c0_weight(0), 
            dout14   => c11c0c2c1cm14c2c3c3cm13cm5cm4c9cm3cm4cm7c6_weight(0), 
            dout15   => c1c55c7cm5cm5cm37cm6c0cm16c6cm3c4c8cm9cm2c0_weight(0), 
            dout16   => c2cm9c2cm7cm5cm15c6c5cm6cm8cm2cm28c6cm5c7c0_weight(0), 
            dout17   => c41c28cm9cm6c32c12cm29c11c27c5c7cm13c4cm1c8cm1_weight(0), 
            dout18   => c7cm3c6c9c14cm1c6cm3c1c4c7cm7c2cm4c3c0_weight(0), 
            dout19   => c7c20c7c6cm45c4c4cm2c9c8cm15cm1c3c5cm7cm3_weight(0), 
            dout20   => c18c6cm9cm29cm6cm26cm21c5cm33cm18c3cm16cm4cm5c7c0_weight(0), 
            dout21   => c1cm4c1c4cm1cm6cm4cm5c0cm5cm1cm2c0c0cm5c68_weight(0), 
            dout22   => cm14cm12cm17cm14c12cm7cm9cm53cm20cm25c68cm13c8cm7cm2cm7_weight(0), 
            dout23   => c9cm7c6c4c11c4cm12cm18c24cm7c14c4c2c3cm8cm26_weight(0), 
            dout24   => c13c51c7c14cm6cm20c6c38cm26cm4cm11cm8c2c2cm23cm8_weight(0), 
            dout25   => c5cm5cm2c13cm21cm3c11c2cm4c0c1c9c34cm2c2c15_weight(0), 
            dout26   => cm10cm57cm1cm2cm24cm4cm20cm5cm3c13c10cm12cm26cm1cm35c0_weight(0), 
            dout27   => cm13cm7cm2cm2cm7c5cm5c0cm6cm5c1cm12c9cm1c2c0_weight(0), 
            dout28   => c22cm39c3cm32c1cm50cm13cm1c26cm23cm16c7cm3cm8c1cm3_weight(0), 
            dout29   => cm23c24cm6c2cm12c6cm4cm9cm10cm7c18c2c1cm7c6cm9_weight(0), 
            dout30   => c36c2c4c8cm2c16cm15c23c8cm1c1cm5cm1c5c6cm4_weight(0), 
            dout31   => cm28c2cm1cm7cm4c6cm1cm8cm8c3c1cm3c3cm4c1cm2_weight(0), 
            dout32   => c13cm36c16cm31cm30cm19cm7c27cm12cm4c8cm7c7c1c1c5_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_cm11c8cm64c3c13c22cm7c19cm6c0c15c3c2c0cm2c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm11c8cm64c3c13c22cm7c19cm6c0c15c3c2c0cm2c2_weight(0), cm11c8cm64c3c13c22cm7c19cm6c0c15c3c2c0cm2c2_weight(1));
    PL_STEP_0_for_c7cm5cm8cm3c1c9c5cm24c6c11c11c24c2c4cm1c42_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c7cm5cm8cm3c1c9c5cm24c6c11c11c24c2c4cm1c42_weight(0), c7cm5cm8cm3c1c9c5cm24c6c11c11c24c2c4cm1c42_weight(1));
    PL_STEP_0_for_c7cm14cm6c3cm4cm60c5c1cm2c4cm5c2c1c8c5c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c7cm14cm6c3cm4cm60c5c1cm2c4cm5c2c1c8c5c2_weight(0), c7cm14cm6c3cm4cm60c5c1cm2c4cm5c2c1c8c5c2_weight(1));
    PL_STEP_0_for_cm13c4cm15c30cm12cm3cm4cm2cm35c8c22c10c81c6c14c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm13c4cm15c30cm12cm3cm4cm2cm35c8c22c10c81c6c14c4_weight(0), cm13c4cm15c30cm12cm3cm4cm2cm35c8c22c10c81c6c14c4_weight(1));
    PL_STEP_0_for_c22cm6cm27cm12c3cm24cm13cm6c37cm13cm8cm13cm3cm21cm4cm11_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c22cm6cm27cm12c3cm24cm13cm6c37cm13cm8cm13cm3cm21cm4cm11_weight(0), c22cm6cm27cm12c3cm24cm13cm6c37cm13cm8cm13cm3cm21cm4cm11_weight(1));
    PL_STEP_0_for_c4c6cm45c9cm3c23c8c35c1cm3c7cm11cm1cm9cm10cm8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4c6cm45c9cm3c23c8c35c1cm3c7cm11cm1cm9cm10cm8_weight(0), c4c6cm45c9cm3c23c8c35c1cm3c7cm11cm1cm9cm10cm8_weight(1));
    PL_STEP_0_for_c4c3cm1cm4c6c26c0cm24c8cm8c5c7c11cm5c0cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4c3cm1cm4c6c26c0cm24c8cm8c5c7c11cm5c0cm1_weight(0), c4c3cm1cm4c6c26c0cm24c8cm8c5c7c11cm5c0cm1_weight(1));
    PL_STEP_0_for_c21cm15c48cm1cm9cm5c30cm6cm40c4cm12c3cm1cm4c2c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c21cm15c48cm1cm9cm5c30cm6cm40c4cm12c3cm1cm4c2c0_weight(0), c21cm15c48cm1cm9cm5c30cm6cm40c4cm12c3cm1cm4c2c0_weight(1));
    PL_STEP_0_for_cm3c15c9cm14cm3cm12cm6cm12cm1c26c3c21c37c4c16cm24_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3c15c9cm14cm3cm12cm6cm12cm1c26c3c21c37c4c16cm24_weight(0), cm3c15c9cm14cm3cm12cm6cm12cm1c26c3c21c37c4c16cm24_weight(1));
    PL_STEP_0_for_cm6cm4cm11cm2c3cm10c7c16c0c1c6c0cm1c0cm7c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6cm4cm11cm2c3cm10c7c16c0c1c6c0cm1c0cm7c3_weight(0), cm6cm4cm11cm2c3cm10c7c16c0c1c6c0cm1c0cm7c3_weight(1));
    PL_STEP_0_for_cm80c11c8cm20cm19cm5cm9c50cm32cm40c0cm3cm13cm2cm2cm9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm80c11c8cm20cm19cm5cm9c50cm32cm40c0cm3cm13cm2cm2cm9_weight(0), cm80c11c8cm20cm19cm5cm9c50cm32cm40c0cm3cm13cm2cm2cm9_weight(1));
    PL_STEP_0_for_cm6c2cm2cm8cm2c0cm3cm16cm10cm3c10c2cm4c1c4c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6c2cm2cm8cm2c0cm3cm16cm10cm3c10c2cm4c1c4c0_weight(0), cm6c2cm2cm8cm2c0cm3cm16cm10cm3c10c2cm4c1c4c0_weight(1));
    PL_STEP_0_for_cm2cm56cm4c0cm5c21c5c2cm14cm4cm6c4cm1cm4c5c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm56cm4c0cm5c21c5c2cm14cm4cm6c4cm1cm4c5c0_weight(0), cm2cm56cm4c0cm5c21c5c2cm14cm4cm6c4cm1cm4c5c0_weight(1));
    PL_STEP_0_for_c11c0c2c1cm14c2c3c3cm13cm5cm4c9cm3cm4cm7c6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c11c0c2c1cm14c2c3c3cm13cm5cm4c9cm3cm4cm7c6_weight(0), c11c0c2c1cm14c2c3c3cm13cm5cm4c9cm3cm4cm7c6_weight(1));
    PL_STEP_0_for_c1c55c7cm5cm5cm37cm6c0cm16c6cm3c4c8cm9cm2c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c55c7cm5cm5cm37cm6c0cm16c6cm3c4c8cm9cm2c0_weight(0), c1c55c7cm5cm5cm37cm6c0cm16c6cm3c4c8cm9cm2c0_weight(1));
    PL_STEP_0_for_c2cm9c2cm7cm5cm15c6c5cm6cm8cm2cm28c6cm5c7c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2cm9c2cm7cm5cm15c6c5cm6cm8cm2cm28c6cm5c7c0_weight(0), c2cm9c2cm7cm5cm15c6c5cm6cm8cm2cm28c6cm5c7c0_weight(1));
    PL_STEP_0_for_c41c28cm9cm6c32c12cm29c11c27c5c7cm13c4cm1c8cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c41c28cm9cm6c32c12cm29c11c27c5c7cm13c4cm1c8cm1_weight(0), c41c28cm9cm6c32c12cm29c11c27c5c7cm13c4cm1c8cm1_weight(1));
    PL_STEP_0_for_c7cm3c6c9c14cm1c6cm3c1c4c7cm7c2cm4c3c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c7cm3c6c9c14cm1c6cm3c1c4c7cm7c2cm4c3c0_weight(0), c7cm3c6c9c14cm1c6cm3c1c4c7cm7c2cm4c3c0_weight(1));
    PL_STEP_0_for_c7c20c7c6cm45c4c4cm2c9c8cm15cm1c3c5cm7cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c7c20c7c6cm45c4c4cm2c9c8cm15cm1c3c5cm7cm3_weight(0), c7c20c7c6cm45c4c4cm2c9c8cm15cm1c3c5cm7cm3_weight(1));
    PL_STEP_0_for_c18c6cm9cm29cm6cm26cm21c5cm33cm18c3cm16cm4cm5c7c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c18c6cm9cm29cm6cm26cm21c5cm33cm18c3cm16cm4cm5c7c0_weight(0), c18c6cm9cm29cm6cm26cm21c5cm33cm18c3cm16cm4cm5c7c0_weight(1));
    PL_STEP_0_for_c1cm4c1c4cm1cm6cm4cm5c0cm5cm1cm2c0c0cm5c68_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm4c1c4cm1cm6cm4cm5c0cm5cm1cm2c0c0cm5c68_weight(0), c1cm4c1c4cm1cm6cm4cm5c0cm5cm1cm2c0c0cm5c68_weight(1));
    PL_STEP_0_for_cm14cm12cm17cm14c12cm7cm9cm53cm20cm25c68cm13c8cm7cm2cm7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm14cm12cm17cm14c12cm7cm9cm53cm20cm25c68cm13c8cm7cm2cm7_weight(0), cm14cm12cm17cm14c12cm7cm9cm53cm20cm25c68cm13c8cm7cm2cm7_weight(1));
    PL_STEP_0_for_c9cm7c6c4c11c4cm12cm18c24cm7c14c4c2c3cm8cm26_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c9cm7c6c4c11c4cm12cm18c24cm7c14c4c2c3cm8cm26_weight(0), c9cm7c6c4c11c4cm12cm18c24cm7c14c4c2c3cm8cm26_weight(1));
    PL_STEP_0_for_c13c51c7c14cm6cm20c6c38cm26cm4cm11cm8c2c2cm23cm8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c13c51c7c14cm6cm20c6c38cm26cm4cm11cm8c2c2cm23cm8_weight(0), c13c51c7c14cm6cm20c6c38cm26cm4cm11cm8c2c2cm23cm8_weight(1));
    PL_STEP_0_for_c5cm5cm2c13cm21cm3c11c2cm4c0c1c9c34cm2c2c15_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5cm5cm2c13cm21cm3c11c2cm4c0c1c9c34cm2c2c15_weight(0), c5cm5cm2c13cm21cm3c11c2cm4c0c1c9c34cm2c2c15_weight(1));
    PL_STEP_0_for_cm10cm57cm1cm2cm24cm4cm20cm5cm3c13c10cm12cm26cm1cm35c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm10cm57cm1cm2cm24cm4cm20cm5cm3c13c10cm12cm26cm1cm35c0_weight(0), cm10cm57cm1cm2cm24cm4cm20cm5cm3c13c10cm12cm26cm1cm35c0_weight(1));
    PL_STEP_0_for_cm13cm7cm2cm2cm7c5cm5c0cm6cm5c1cm12c9cm1c2c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm13cm7cm2cm2cm7c5cm5c0cm6cm5c1cm12c9cm1c2c0_weight(0), cm13cm7cm2cm2cm7c5cm5c0cm6cm5c1cm12c9cm1c2c0_weight(1));
    PL_STEP_0_for_c22cm39c3cm32c1cm50cm13cm1c26cm23cm16c7cm3cm8c1cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c22cm39c3cm32c1cm50cm13cm1c26cm23cm16c7cm3cm8c1cm3_weight(0), c22cm39c3cm32c1cm50cm13cm1c26cm23cm16c7cm3cm8c1cm3_weight(1));
    PL_STEP_0_for_cm23c24cm6c2cm12c6cm4cm9cm10cm7c18c2c1cm7c6cm9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm23c24cm6c2cm12c6cm4cm9cm10cm7c18c2c1cm7c6cm9_weight(0), cm23c24cm6c2cm12c6cm4cm9cm10cm7c18c2c1cm7c6cm9_weight(1));
    PL_STEP_0_for_c36c2c4c8cm2c16cm15c23c8cm1c1cm5cm1c5c6cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c36c2c4c8cm2c16cm15c23c8cm1c1cm5cm1c5c6cm4_weight(0), c36c2c4c8cm2c16cm15c23c8cm1c1cm5cm1c5c6cm4_weight(1));
    PL_STEP_0_for_cm28c2cm1cm7cm4c6cm1cm8cm8c3c1cm3c3cm4c1cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm28c2cm1cm7cm4c6cm1cm8cm8c3c1cm3c3cm4c1cm2_weight(0), cm28c2cm1cm7cm4c6cm1cm8cm8c3c1cm3c3cm4c1cm2_weight(1));
    PL_STEP_0_for_c13cm36c16cm31cm30cm19cm7c27cm12cm4c8cm7c7c1c1c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c13cm36c16cm31cm30cm19cm7c27cm12cm4c8cm7c7c1c1c5_weight(0), c13cm36c16cm31cm30cm19cm7c27cm12cm4c8cm7c7c1c1c5_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    cm13c4cm15c30cm12cm3cm4cm2cm35c8c22c10c81c6c14c4_cm13cm7cm2cm2cm7c5cm5c0cm6cm5c1cm12c9cm1c2c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm13c4cm15c30cm12cm3cm4cm2cm35c8c22c10c81c6c14c4_weight(1)(8-1 downto 0),
			B	=> cm13cm7cm2cm2cm7c5cm5c0cm6cm5c1cm12c9cm1c2c0_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm13c4cm15c30cm12cm3cm4cm2cm35c8c22c10c81c6c14c4,
			CxB => R_cm13cm7cm2cm2cm7c5cm5c0cm6cm5c1cm12c9cm1c2c0
		);

    cm80c11c8cm20cm19cm5cm9c50cm32cm40c0cm3cm13cm2cm2cm9_c7cm3c6c9c14cm1c6cm3c1c4c7cm7c2cm4c3c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm80c11c8cm20cm19cm5cm9c50cm32cm40c0cm3cm13cm2cm2cm9_weight(1)(8-1 downto 0),
			B	=> c7cm3c6c9c14cm1c6cm3c1c4c7cm7c2cm4c3c0_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm80c11c8cm20cm19cm5cm9c50cm32cm40c0cm3cm13cm2cm2cm9,
			CxB => R_c7cm3c6c9c14cm1c6cm3c1c4c7cm7c2cm4c3c0
		);

    c1cm4c1c4cm1cm6cm4cm5c0cm5cm1cm2c0c0cm5c68_c11c0c2c1cm14c2c3c3cm13cm5cm4c9cm3cm4cm7c6_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c1cm4c1c4cm1cm6cm4cm5c0cm5cm1cm2c0c0cm5c68_weight(1)(8-1 downto 0),
			B	=> c11c0c2c1cm14c2c3c3cm13cm5cm4c9cm3cm4cm7c6_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1cm4c1c4cm1cm6cm4cm5c0cm5cm1cm2c0c0cm5c68,
			CxB => R_c11c0c2c1cm14c2c3c3cm13cm5cm4c9cm3cm4cm7c6
		);

    cm14cm12cm17cm14c12cm7cm9cm53cm20cm25c68cm13c8cm7cm2cm7_cm6c2cm2cm8cm2c0cm3cm16cm10cm3c10c2cm4c1c4c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm14cm12cm17cm14c12cm7cm9cm53cm20cm25c68cm13c8cm7cm2cm7_weight(1)(8-1 downto 0),
			B	=> cm6c2cm2cm8cm2c0cm3cm16cm10cm3c10c2cm4c1c4c0_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm14cm12cm17cm14c12cm7cm9cm53cm20cm25c68cm13c8cm7cm2cm7,
			CxB => R_cm6c2cm2cm8cm2c0cm3cm16cm10cm3c10c2cm4c1c4c0
		);

    cm11c8cm64c3c13c22cm7c19cm6c0c15c3c2c0cm2c2_cm28c2cm1cm7cm4c6cm1cm8cm8c3c1cm3c3cm4c1cm2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm11c8cm64c3c13c22cm7c19cm6c0c15c3c2c0cm2c2_weight(1)(7-1 downto 0),
			B	=> cm28c2cm1cm7cm4c6cm1cm8cm8c3c1cm3c3cm4c1cm2_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm11c8cm64c3c13c22cm7c19cm6c0c15c3c2c0cm2c2,
			CxB => R_cm28c2cm1cm7cm4c6cm1cm8cm8c3c1cm3c3cm4c1cm2
		);

    c7cm5cm8cm3c1c9c5cm24c6c11c11c24c2c4cm1c42_cm23c24cm6c2cm12c6cm4cm9cm10cm7c18c2c1cm7c6cm9_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c7cm5cm8cm3c1c9c5cm24c6c11c11c24c2c4cm1c42_weight(1)(7-1 downto 0),
			B	=> cm23c24cm6c2cm12c6cm4cm9cm10cm7c18c2c1cm7c6cm9_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c7cm5cm8cm3c1c9c5cm24c6c11c11c24c2c4cm1c42,
			CxB => R_cm23c24cm6c2cm12c6cm4cm9cm10cm7c18c2c1cm7c6cm9
		);

    c7cm14cm6c3cm4cm60c5c1cm2c4cm5c2c1c8c5c2_c9cm7c6c4c11c4cm12cm18c24cm7c14c4c2c3cm8cm26_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c7cm14cm6c3cm4cm60c5c1cm2c4cm5c2c1c8c5c2_weight(1)(7-1 downto 0),
			B	=> c9cm7c6c4c11c4cm12cm18c24cm7c14c4c2c3cm8cm26_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c7cm14cm6c3cm4cm60c5c1cm2c4cm5c2c1c8c5c2,
			CxB => R_c9cm7c6c4c11c4cm12cm18c24cm7c14c4c2c3cm8cm26
		);

    c22cm6cm27cm12c3cm24cm13cm6c37cm13cm8cm13cm3cm21cm4cm11_c2cm9c2cm7cm5cm15c6c5cm6cm8cm2cm28c6cm5c7c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c22cm6cm27cm12c3cm24cm13cm6c37cm13cm8cm13cm3cm21cm4cm11_weight(1)(7-1 downto 0),
			B	=> c2cm9c2cm7cm5cm15c6c5cm6cm8cm2cm28c6cm5c7c0_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c22cm6cm27cm12c3cm24cm13cm6c37cm13cm8cm13cm3cm21cm4cm11,
			CxB => R_c2cm9c2cm7cm5cm15c6c5cm6cm8cm2cm28c6cm5c7c0
		);

    c4c6cm45c9cm3c23c8c35c1cm3c7cm11cm1cm9cm10cm8_cm6cm4cm11cm2c3cm10c7c16c0c1c6c0cm1c0cm7c3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c4c6cm45c9cm3c23c8c35c1cm3c7cm11cm1cm9cm10cm8_weight(1)(7-1 downto 0),
			B	=> cm6cm4cm11cm2c3cm10c7c16c0c1c6c0cm1c0cm7c3_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c4c6cm45c9cm3c23c8c35c1cm3c7cm11cm1cm9cm10cm8,
			CxB => R_cm6cm4cm11cm2c3cm10c7c16c0c1c6c0cm1c0cm7c3
		);

    c21cm15c48cm1cm9cm5c30cm6cm40c4cm12c3cm1cm4c2c0_c4c3cm1cm4c6c26c0cm24c8cm8c5c7c11cm5c0cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c21cm15c48cm1cm9cm5c30cm6cm40c4cm12c3cm1cm4c2c0_weight(1)(7-1 downto 0),
			B	=> c4c3cm1cm4c6c26c0cm24c8cm8c5c7c11cm5c0cm1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c21cm15c48cm1cm9cm5c30cm6cm40c4cm12c3cm1cm4c2c0,
			CxB => R_c4c3cm1cm4c6c26c0cm24c8cm8c5c7c11cm5c0cm1
		);

    cm3c15c9cm14cm3cm12cm6cm12cm1c26c3c21c37c4c16cm24_c13cm36c16cm31cm30cm19cm7c27cm12cm4c8cm7c7c1c1c5_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 7,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm3c15c9cm14cm3cm12cm6cm12cm1c26c3c21c37c4c16cm24_weight(1)(7-1 downto 0),
			B	=> c13cm36c16cm31cm30cm19cm7c27cm12cm4c8cm7c7c1c1c5_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm3c15c9cm14cm3cm12cm6cm12cm1c26c3c21c37c4c16cm24,
			CxB => R_c13cm36c16cm31cm30cm19cm7c27cm12cm4c8cm7c7c1c1c5
		);

    cm2cm56cm4c0cm5c21c5c2cm14cm4cm6c4cm1cm4c5c0_c36c2c4c8cm2c16cm15c23c8cm1c1cm5cm1c5c6cm4_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 7,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm2cm56cm4c0cm5c21c5c2cm14cm4cm6c4cm1cm4c5c0_weight(1)(7-1 downto 0),
			B	=> c36c2c4c8cm2c16cm15c23c8cm1c1cm5cm1c5c6cm4_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2cm56cm4c0cm5c21c5c2cm14cm4cm6c4cm1cm4c5c0,
			CxB => R_c36c2c4c8cm2c16cm15c23c8cm1c1cm5cm1c5c6cm4
		);

    c1c55c7cm5cm5cm37cm6c0cm16c6cm3c4c8cm9cm2c0_c22cm39c3cm32c1cm50cm13cm1c26cm23cm16c7cm3cm8c1cm3_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 7,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c1c55c7cm5cm5cm37cm6c0cm16c6cm3c4c8cm9cm2c0_weight(1)(7-1 downto 0),
			B	=> c22cm39c3cm32c1cm50cm13cm1c26cm23cm16c7cm3cm8c1cm3_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1c55c7cm5cm5cm37cm6c0cm16c6cm3c4c8cm9cm2c0,
			CxB => R_c22cm39c3cm32c1cm50cm13cm1c26cm23cm16c7cm3cm8c1cm3
		);

    c41c28cm9cm6c32c12cm29c11c27c5c7cm13c4cm1c8cm1_cm10cm57cm1cm2cm24cm4cm20cm5cm3c13c10cm12cm26cm1cm35c0_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 7,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c41c28cm9cm6c32c12cm29c11c27c5c7cm13c4cm1c8cm1_weight(1)(7-1 downto 0),
			B	=> cm10cm57cm1cm2cm24cm4cm20cm5cm3c13c10cm12cm26cm1cm35c0_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c41c28cm9cm6c32c12cm29c11c27c5c7cm13c4cm1c8cm1,
			CxB => R_cm10cm57cm1cm2cm24cm4cm20cm5cm3c13c10cm12cm26cm1cm35c0
		);

    c7c20c7c6cm45c4c4cm2c9c8cm15cm1c3c5cm7cm3_c5cm5cm2c13cm21cm3c11c2cm4c0c1c9c34cm2c2c15_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 7,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c7c20c7c6cm45c4c4cm2c9c8cm15cm1c3c5cm7cm3_weight(1)(7-1 downto 0),
			B	=> c5cm5cm2c13cm21cm3c11c2cm4c0c1c9c34cm2c2c15_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c7c20c7c6cm45c4c4cm2c9c8cm15cm1c3c5cm7cm3,
			CxB => R_c5cm5cm2c13cm21cm3c11c2cm4c0c1c9c34cm2c2c15
		);

    c18c6cm9cm29cm6cm26cm21c5cm33cm18c3cm16cm4cm5c7c0_c13c51c7c14cm6cm20c6c38cm26cm4cm11cm8c2c2cm23cm8_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 7,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c18c6cm9cm29cm6cm26cm21c5cm33cm18c3cm16cm4cm5c7c0_weight(1)(7-1 downto 0),
			B	=> c13c51c7c14cm6cm20c6c38cm26cm4cm11cm8c2c2cm23cm8_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c18c6cm9cm29cm6cm26cm21c5cm33cm18c3cm16cm4cm5c7c0,
			CxB => R_c13c51c7c14cm6cm20c6c38cm26cm4cm11cm8c2c2cm23cm8
		);




end architecture;
