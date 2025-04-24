library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core16_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        R_cm6c11cm22c1c103c7c15c9c4c0c0c2cm4c3cm14c2 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_cm5cm12cm3cm3cm24cm4cm17c0c12c2cm10cm1c7c17c18cm1 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm2cm11c6c4c4c8c2c11c60c1cm4cm3cm4cm8cm8cm1 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm2c1c29c10c7cm2cm40cm35cm7c5c1c10c10c6c10c7 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c13c20c0cm17c8c11cm10cm19cm4c1c12cm1c0cm15cm43c10 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm3c4cm15cm1cm16cm4c17c11cm15cm2cm1cm6cm7c3c13c3 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c12cm13cm2c0cm25c20c7cm28cm7cm4c3c2c7c4cm1cm16 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c20c5c43cm15cm11c10c0cm10cm9cm7cm2c1c26c11c29c0 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c0cm19c10cm6cm2c11cm7c8c3cm4c7c8cm2c44c7cm26 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm3cm5cm2c9cm30cm4c1c11cm4cm2c3cm15c6cm2cm5cm7 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm72c0cm1cm6c29c5c3cm7cm1c7c7cm1cm11c3cm2c0 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_cm3cm3c6cm14cm2c6c10cm2c3c6cm5c1c8c1cm8cm14 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_c11cm23cm9cm1cm1c14c15c0cm8c3c25c2cm2cm4c6cm3 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c23c0c1c0c2c10c3cm4c1cm4cm1c3cm14c3c7cm4 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c2c9c3c0cm1cm50c23c6c6c5cm4c4c0c16c2cm5 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c1c2cm1c9cm31c11c10c3cm3cm2c9cm1c0cm9cm2c10 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c26c13cm4cm3cm8c11c1c3cm9cm4cm3c12c10c10cm4cm18 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm12c0cm2c8c30c7cm12c2c8c3c6cm1c5cm1c2c2 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm32c3cm1cm6cm20c2cm10cm56c2cm2cm1cm59c11c9c2c1 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c4c4cm1cm6c26cm1c9cm12cm27cm1c4cm51c4cm12c2c4 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm6c26c8c6cm7cm1cm3c3c0c4c4cm2cm2c3c7cm2 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm21c8cm23cm17c7cm6c1c0cm2c2cm2c7cm3c3c1c3 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c17cm19cm1cm5c8cm8c7c0c8cm56c6cm2c7c9c13cm1 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c4cm23c9cm3c9c15c1cm3c0cm10c7c2c4c81c4c3 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_cm2cm2cm2cm2cm6c24c5cm5c2cm10c5cm5c14c4c7c7 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm4cm29c12c1c5c29c4c5c2c2c0c0c8cm18c1c2 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c7cm9cm10cm1c3cm10cm28c33cm12cm12cm13c1cm14c7c0c1 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm3cm28c14c4cm6cm12c4c5c12cm1cm17c3cm1cm8cm2cm29 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c2c32cm4c21c12cm1c6c6cm6cm2c1cm1cm7c15c1c1 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c0c7cm3c4c15c13c37c6c4cm2cm5c1c68c0c25c0 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_cm25c7cm1c2c17c3c2c4c22c3c2cm40c3c23cm4cm20 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c0c27c13cm22c3cm24cm32c48cm1c7cm6c3c8cm45c8cm13 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(11-1 downto 0)  --	sfix(1, -10)
    );
end conv7_core16_rmcm;

architecture arch of conv7_core16_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6C11CM22C1C103C7C15C9C4C0C0C2CM4C3CM14C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5CM12CM3CM3CM24CM4CM17C0C12C2CM10CM1C7C17C18CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM11C6C4C4C8C2C11C60C1CM4CM3CM4CM8CM8CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C1C29C10C7CM2CM40CM35CM7C5C1C10C10C6C10C7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C13C20C0CM17C8C11CM10CM19CM4C1C12CM1C0CM15CM43C10_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3C4CM15CM1CM16CM4C17C11CM15CM2CM1CM6CM7C3C13C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C12CM13CM2C0CM25C20C7CM28CM7CM4C3C2C7C4CM1CM16_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C20C5C43CM15CM11C10C0CM10CM9CM7CM2C1C26C11C29C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM19C10CM6CM2C11CM7C8C3CM4C7C8CM2C44C7CM26_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3CM5CM2C9CM30CM4C1C11CM4CM2C3CM15C6CM2CM5CM7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM72C0CM1CM6C29C5C3CM7CM1C7C7CM1CM11C3CM2C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3CM3C6CM14CM2C6C10CM2C3C6CM5C1C8C1CM8CM14_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C11CM23CM9CM1CM1C14C15C0CM8C3C25C2CM2CM4C6CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C23C0C1C0C2C10C3CM4C1CM4CM1C3CM14C3C7CM4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C9C3C0CM1CM50C23C6C6C5CM4C4C0C16C2CM5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C2CM1C9CM31C11C10C3CM3CM2C9CM1C0CM9CM2C10_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C26C13CM4CM3CM8C11C1C3CM9CM4CM3C12C10C10CM4CM18_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM12C0CM2C8C30C7CM12C2C8C3C6CM1C5CM1C2C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM32C3CM1CM6CM20C2CM10CM56C2CM2CM1CM59C11C9C2C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4C4CM1CM6C26CM1C9CM12CM27CM1C4CM51C4CM12C2C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6C26C8C6CM7CM1CM3C3C0C4C4CM2CM2C3C7CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM21C8CM23CM17C7CM6C1C0CM2C2CM2C7CM3C3C1C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C17CM19CM1CM5C8CM8C7C0C8CM56C6CM2C7C9C13CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4CM23C9CM3C9C15C1CM3C0CM10C7C2C4C81C4C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM2CM2CM2CM6C24C5CM5C2CM10C5CM5C14C4C7C7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4CM29C12C1C5C29C4C5C2C2C0C0C8CM18C1C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C7CM9CM10CM1C3CM10CM28C33CM12CM12CM13C1CM14C7C0C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3CM28C14C4CM6CM12C4C5C12CM1CM17C3CM1CM8CM2CM29_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C32CM4C21C12CM1C6C6CM6CM2C1CM1CM7C15C1C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C7CM3C4C15C13C37C6C4CM2CM5C1C68C0C25C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM25C7CM1C2C17C3C2C4C22C3C2CM40C3C23CM4CM20_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C27C13CM22C3CM24CM32C48CM1C7CM6C3C8CM45C8CM13_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(4, -3)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(1, -7)
    signal cm6c11cm22c1c103c7c15c9c4c0c0c2cm4c3cm14c2_weight : PIPELINE_TYPE_FOR_CM6C11CM22C1C103C7C15C9C4C0C0C2CM4C3CM14C2_WEIGHT;
    -- sfix(1, -7)
    signal cm5cm12cm3cm3cm24cm4cm17c0c12c2cm10cm1c7c17c18cm1_weight : PIPELINE_TYPE_FOR_CM5CM12CM3CM3CM24CM4CM17C0C12C2CM10CM1C7C17C18CM1_WEIGHT;
    -- sfix(1, -7)
    signal cm2cm11c6c4c4c8c2c11c60c1cm4cm3cm4cm8cm8cm1_weight : PIPELINE_TYPE_FOR_CM2CM11C6C4C4C8C2C11C60C1CM4CM3CM4CM8CM8CM1_WEIGHT;
    -- sfix(1, -7)
    signal cm2c1c29c10c7cm2cm40cm35cm7c5c1c10c10c6c10c7_weight : PIPELINE_TYPE_FOR_CM2C1C29C10C7CM2CM40CM35CM7C5C1C10C10C6C10C7_WEIGHT;
    -- sfix(1, -7)
    signal c13c20c0cm17c8c11cm10cm19cm4c1c12cm1c0cm15cm43c10_weight : PIPELINE_TYPE_FOR_C13C20C0CM17C8C11CM10CM19CM4C1C12CM1C0CM15CM43C10_WEIGHT;
    -- sfix(1, -7)
    signal cm3c4cm15cm1cm16cm4c17c11cm15cm2cm1cm6cm7c3c13c3_weight : PIPELINE_TYPE_FOR_CM3C4CM15CM1CM16CM4C17C11CM15CM2CM1CM6CM7C3C13C3_WEIGHT;
    -- sfix(1, -7)
    signal c12cm13cm2c0cm25c20c7cm28cm7cm4c3c2c7c4cm1cm16_weight : PIPELINE_TYPE_FOR_C12CM13CM2C0CM25C20C7CM28CM7CM4C3C2C7C4CM1CM16_WEIGHT;
    -- sfix(1, -7)
    signal c20c5c43cm15cm11c10c0cm10cm9cm7cm2c1c26c11c29c0_weight : PIPELINE_TYPE_FOR_C20C5C43CM15CM11C10C0CM10CM9CM7CM2C1C26C11C29C0_WEIGHT;
    -- sfix(1, -7)
    signal c0cm19c10cm6cm2c11cm7c8c3cm4c7c8cm2c44c7cm26_weight : PIPELINE_TYPE_FOR_C0CM19C10CM6CM2C11CM7C8C3CM4C7C8CM2C44C7CM26_WEIGHT;
    -- sfix(1, -7)
    signal cm3cm5cm2c9cm30cm4c1c11cm4cm2c3cm15c6cm2cm5cm7_weight : PIPELINE_TYPE_FOR_CM3CM5CM2C9CM30CM4C1C11CM4CM2C3CM15C6CM2CM5CM7_WEIGHT;
    -- sfix(1, -7)
    signal cm72c0cm1cm6c29c5c3cm7cm1c7c7cm1cm11c3cm2c0_weight : PIPELINE_TYPE_FOR_CM72C0CM1CM6C29C5C3CM7CM1C7C7CM1CM11C3CM2C0_WEIGHT;
    -- sfix(1, -7)
    signal cm3cm3c6cm14cm2c6c10cm2c3c6cm5c1c8c1cm8cm14_weight : PIPELINE_TYPE_FOR_CM3CM3C6CM14CM2C6C10CM2C3C6CM5C1C8C1CM8CM14_WEIGHT;
    -- sfix(1, -7)
    signal c11cm23cm9cm1cm1c14c15c0cm8c3c25c2cm2cm4c6cm3_weight : PIPELINE_TYPE_FOR_C11CM23CM9CM1CM1C14C15C0CM8C3C25C2CM2CM4C6CM3_WEIGHT;
    -- sfix(1, -7)
    signal c23c0c1c0c2c10c3cm4c1cm4cm1c3cm14c3c7cm4_weight : PIPELINE_TYPE_FOR_C23C0C1C0C2C10C3CM4C1CM4CM1C3CM14C3C7CM4_WEIGHT;
    -- sfix(1, -7)
    signal c2c9c3c0cm1cm50c23c6c6c5cm4c4c0c16c2cm5_weight : PIPELINE_TYPE_FOR_C2C9C3C0CM1CM50C23C6C6C5CM4C4C0C16C2CM5_WEIGHT;
    -- sfix(1, -7)
    signal c1c2cm1c9cm31c11c10c3cm3cm2c9cm1c0cm9cm2c10_weight : PIPELINE_TYPE_FOR_C1C2CM1C9CM31C11C10C3CM3CM2C9CM1C0CM9CM2C10_WEIGHT;
    -- sfix(1, -7)
    signal c26c13cm4cm3cm8c11c1c3cm9cm4cm3c12c10c10cm4cm18_weight : PIPELINE_TYPE_FOR_C26C13CM4CM3CM8C11C1C3CM9CM4CM3C12C10C10CM4CM18_WEIGHT;
    -- sfix(1, -7)
    signal cm12c0cm2c8c30c7cm12c2c8c3c6cm1c5cm1c2c2_weight : PIPELINE_TYPE_FOR_CM12C0CM2C8C30C7CM12C2C8C3C6CM1C5CM1C2C2_WEIGHT;
    -- sfix(1, -7)
    signal cm32c3cm1cm6cm20c2cm10cm56c2cm2cm1cm59c11c9c2c1_weight : PIPELINE_TYPE_FOR_CM32C3CM1CM6CM20C2CM10CM56C2CM2CM1CM59C11C9C2C1_WEIGHT;
    -- sfix(1, -7)
    signal c4c4cm1cm6c26cm1c9cm12cm27cm1c4cm51c4cm12c2c4_weight : PIPELINE_TYPE_FOR_C4C4CM1CM6C26CM1C9CM12CM27CM1C4CM51C4CM12C2C4_WEIGHT;
    -- sfix(1, -7)
    signal cm6c26c8c6cm7cm1cm3c3c0c4c4cm2cm2c3c7cm2_weight : PIPELINE_TYPE_FOR_CM6C26C8C6CM7CM1CM3C3C0C4C4CM2CM2C3C7CM2_WEIGHT;
    -- sfix(1, -7)
    signal cm21c8cm23cm17c7cm6c1c0cm2c2cm2c7cm3c3c1c3_weight : PIPELINE_TYPE_FOR_CM21C8CM23CM17C7CM6C1C0CM2C2CM2C7CM3C3C1C3_WEIGHT;
    -- sfix(1, -7)
    signal c17cm19cm1cm5c8cm8c7c0c8cm56c6cm2c7c9c13cm1_weight : PIPELINE_TYPE_FOR_C17CM19CM1CM5C8CM8C7C0C8CM56C6CM2C7C9C13CM1_WEIGHT;
    -- sfix(1, -7)
    signal c4cm23c9cm3c9c15c1cm3c0cm10c7c2c4c81c4c3_weight : PIPELINE_TYPE_FOR_C4CM23C9CM3C9C15C1CM3C0CM10C7C2C4C81C4C3_WEIGHT;
    -- sfix(1, -7)
    signal cm2cm2cm2cm2cm6c24c5cm5c2cm10c5cm5c14c4c7c7_weight : PIPELINE_TYPE_FOR_CM2CM2CM2CM2CM6C24C5CM5C2CM10C5CM5C14C4C7C7_WEIGHT;
    -- sfix(1, -7)
    signal cm4cm29c12c1c5c29c4c5c2c2c0c0c8cm18c1c2_weight : PIPELINE_TYPE_FOR_CM4CM29C12C1C5C29C4C5C2C2C0C0C8CM18C1C2_WEIGHT;
    -- sfix(1, -7)
    signal c7cm9cm10cm1c3cm10cm28c33cm12cm12cm13c1cm14c7c0c1_weight : PIPELINE_TYPE_FOR_C7CM9CM10CM1C3CM10CM28C33CM12CM12CM13C1CM14C7C0C1_WEIGHT;
    -- sfix(1, -7)
    signal cm3cm28c14c4cm6cm12c4c5c12cm1cm17c3cm1cm8cm2cm29_weight : PIPELINE_TYPE_FOR_CM3CM28C14C4CM6CM12C4C5C12CM1CM17C3CM1CM8CM2CM29_WEIGHT;
    -- sfix(1, -7)
    signal c2c32cm4c21c12cm1c6c6cm6cm2c1cm1cm7c15c1c1_weight : PIPELINE_TYPE_FOR_C2C32CM4C21C12CM1C6C6CM6CM2C1CM1CM7C15C1C1_WEIGHT;
    -- sfix(1, -7)
    signal c0c7cm3c4c15c13c37c6c4cm2cm5c1c68c0c25c0_weight : PIPELINE_TYPE_FOR_C0C7CM3C4C15C13C37C6C4CM2CM5C1C68C0C25C0_WEIGHT;
    -- sfix(1, -7)
    signal cm25c7cm1c2c17c3c2c4c22c3c2cm40c3c23cm4cm20_weight : PIPELINE_TYPE_FOR_CM25C7CM1C2C17C3C2C4C22C3C2CM40C3C23CM4CM20_WEIGHT;
    -- sfix(1, -7)
    signal c0c27c13cm22c3cm24cm32c48cm1c7cm6c3c8cm45c8cm13_weight : PIPELINE_TYPE_FOR_C0C27C13CM22C3CM24CM32C48CM1C7CM6C3C8CM45C8CM13_WEIGHT;
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



    WEIGHT_ROM: entity work.conv7_core16_rmcm_weightsconstant_memory
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
        
            dout1   => cm6c11cm22c1c103c7c15c9c4c0c0c2cm4c3cm14c2_weight(0), 
            dout2   => cm5cm12cm3cm3cm24cm4cm17c0c12c2cm10cm1c7c17c18cm1_weight(0), 
            dout3   => cm2cm11c6c4c4c8c2c11c60c1cm4cm3cm4cm8cm8cm1_weight(0), 
            dout4   => cm2c1c29c10c7cm2cm40cm35cm7c5c1c10c10c6c10c7_weight(0), 
            dout5   => c13c20c0cm17c8c11cm10cm19cm4c1c12cm1c0cm15cm43c10_weight(0), 
            dout6   => cm3c4cm15cm1cm16cm4c17c11cm15cm2cm1cm6cm7c3c13c3_weight(0), 
            dout7   => c12cm13cm2c0cm25c20c7cm28cm7cm4c3c2c7c4cm1cm16_weight(0), 
            dout8   => c20c5c43cm15cm11c10c0cm10cm9cm7cm2c1c26c11c29c0_weight(0), 
            dout9   => c0cm19c10cm6cm2c11cm7c8c3cm4c7c8cm2c44c7cm26_weight(0), 
            dout10   => cm3cm5cm2c9cm30cm4c1c11cm4cm2c3cm15c6cm2cm5cm7_weight(0), 
            dout11   => cm72c0cm1cm6c29c5c3cm7cm1c7c7cm1cm11c3cm2c0_weight(0), 
            dout12   => cm3cm3c6cm14cm2c6c10cm2c3c6cm5c1c8c1cm8cm14_weight(0), 
            dout13   => c11cm23cm9cm1cm1c14c15c0cm8c3c25c2cm2cm4c6cm3_weight(0), 
            dout14   => c23c0c1c0c2c10c3cm4c1cm4cm1c3cm14c3c7cm4_weight(0), 
            dout15   => c2c9c3c0cm1cm50c23c6c6c5cm4c4c0c16c2cm5_weight(0), 
            dout16   => c1c2cm1c9cm31c11c10c3cm3cm2c9cm1c0cm9cm2c10_weight(0), 
            dout17   => c26c13cm4cm3cm8c11c1c3cm9cm4cm3c12c10c10cm4cm18_weight(0), 
            dout18   => cm12c0cm2c8c30c7cm12c2c8c3c6cm1c5cm1c2c2_weight(0), 
            dout19   => cm32c3cm1cm6cm20c2cm10cm56c2cm2cm1cm59c11c9c2c1_weight(0), 
            dout20   => c4c4cm1cm6c26cm1c9cm12cm27cm1c4cm51c4cm12c2c4_weight(0), 
            dout21   => cm6c26c8c6cm7cm1cm3c3c0c4c4cm2cm2c3c7cm2_weight(0), 
            dout22   => cm21c8cm23cm17c7cm6c1c0cm2c2cm2c7cm3c3c1c3_weight(0), 
            dout23   => c17cm19cm1cm5c8cm8c7c0c8cm56c6cm2c7c9c13cm1_weight(0), 
            dout24   => c4cm23c9cm3c9c15c1cm3c0cm10c7c2c4c81c4c3_weight(0), 
            dout25   => cm2cm2cm2cm2cm6c24c5cm5c2cm10c5cm5c14c4c7c7_weight(0), 
            dout26   => cm4cm29c12c1c5c29c4c5c2c2c0c0c8cm18c1c2_weight(0), 
            dout27   => c7cm9cm10cm1c3cm10cm28c33cm12cm12cm13c1cm14c7c0c1_weight(0), 
            dout28   => cm3cm28c14c4cm6cm12c4c5c12cm1cm17c3cm1cm8cm2cm29_weight(0), 
            dout29   => c2c32cm4c21c12cm1c6c6cm6cm2c1cm1cm7c15c1c1_weight(0), 
            dout30   => c0c7cm3c4c15c13c37c6c4cm2cm5c1c68c0c25c0_weight(0), 
            dout31   => cm25c7cm1c2c17c3c2c4c22c3c2cm40c3c23cm4cm20_weight(0), 
            dout32   => c0c27c13cm22c3cm24cm32c48cm1c7cm6c3c8cm45c8cm13_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_cm6c11cm22c1c103c7c15c9c4c0c0c2cm4c3cm14c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6c11cm22c1c103c7c15c9c4c0c0c2cm4c3cm14c2_weight(0), cm6c11cm22c1c103c7c15c9c4c0c0c2cm4c3cm14c2_weight(1));
    PL_STEP_0_for_cm5cm12cm3cm3cm24cm4cm17c0c12c2cm10cm1c7c17c18cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5cm12cm3cm3cm24cm4cm17c0c12c2cm10cm1c7c17c18cm1_weight(0), cm5cm12cm3cm3cm24cm4cm17c0c12c2cm10cm1c7c17c18cm1_weight(1));
    PL_STEP_0_for_cm2cm11c6c4c4c8c2c11c60c1cm4cm3cm4cm8cm8cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm11c6c4c4c8c2c11c60c1cm4cm3cm4cm8cm8cm1_weight(0), cm2cm11c6c4c4c8c2c11c60c1cm4cm3cm4cm8cm8cm1_weight(1));
    PL_STEP_0_for_cm2c1c29c10c7cm2cm40cm35cm7c5c1c10c10c6c10c7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c1c29c10c7cm2cm40cm35cm7c5c1c10c10c6c10c7_weight(0), cm2c1c29c10c7cm2cm40cm35cm7c5c1c10c10c6c10c7_weight(1));
    PL_STEP_0_for_c13c20c0cm17c8c11cm10cm19cm4c1c12cm1c0cm15cm43c10_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c13c20c0cm17c8c11cm10cm19cm4c1c12cm1c0cm15cm43c10_weight(0), c13c20c0cm17c8c11cm10cm19cm4c1c12cm1c0cm15cm43c10_weight(1));
    PL_STEP_0_for_cm3c4cm15cm1cm16cm4c17c11cm15cm2cm1cm6cm7c3c13c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3c4cm15cm1cm16cm4c17c11cm15cm2cm1cm6cm7c3c13c3_weight(0), cm3c4cm15cm1cm16cm4c17c11cm15cm2cm1cm6cm7c3c13c3_weight(1));
    PL_STEP_0_for_c12cm13cm2c0cm25c20c7cm28cm7cm4c3c2c7c4cm1cm16_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c12cm13cm2c0cm25c20c7cm28cm7cm4c3c2c7c4cm1cm16_weight(0), c12cm13cm2c0cm25c20c7cm28cm7cm4c3c2c7c4cm1cm16_weight(1));
    PL_STEP_0_for_c20c5c43cm15cm11c10c0cm10cm9cm7cm2c1c26c11c29c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c20c5c43cm15cm11c10c0cm10cm9cm7cm2c1c26c11c29c0_weight(0), c20c5c43cm15cm11c10c0cm10cm9cm7cm2c1c26c11c29c0_weight(1));
    PL_STEP_0_for_c0cm19c10cm6cm2c11cm7c8c3cm4c7c8cm2c44c7cm26_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm19c10cm6cm2c11cm7c8c3cm4c7c8cm2c44c7cm26_weight(0), c0cm19c10cm6cm2c11cm7c8c3cm4c7c8cm2c44c7cm26_weight(1));
    PL_STEP_0_for_cm3cm5cm2c9cm30cm4c1c11cm4cm2c3cm15c6cm2cm5cm7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3cm5cm2c9cm30cm4c1c11cm4cm2c3cm15c6cm2cm5cm7_weight(0), cm3cm5cm2c9cm30cm4c1c11cm4cm2c3cm15c6cm2cm5cm7_weight(1));
    PL_STEP_0_for_cm72c0cm1cm6c29c5c3cm7cm1c7c7cm1cm11c3cm2c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm72c0cm1cm6c29c5c3cm7cm1c7c7cm1cm11c3cm2c0_weight(0), cm72c0cm1cm6c29c5c3cm7cm1c7c7cm1cm11c3cm2c0_weight(1));
    PL_STEP_0_for_cm3cm3c6cm14cm2c6c10cm2c3c6cm5c1c8c1cm8cm14_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3cm3c6cm14cm2c6c10cm2c3c6cm5c1c8c1cm8cm14_weight(0), cm3cm3c6cm14cm2c6c10cm2c3c6cm5c1c8c1cm8cm14_weight(1));
    PL_STEP_0_for_c11cm23cm9cm1cm1c14c15c0cm8c3c25c2cm2cm4c6cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c11cm23cm9cm1cm1c14c15c0cm8c3c25c2cm2cm4c6cm3_weight(0), c11cm23cm9cm1cm1c14c15c0cm8c3c25c2cm2cm4c6cm3_weight(1));
    PL_STEP_0_for_c23c0c1c0c2c10c3cm4c1cm4cm1c3cm14c3c7cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c23c0c1c0c2c10c3cm4c1cm4cm1c3cm14c3c7cm4_weight(0), c23c0c1c0c2c10c3cm4c1cm4cm1c3cm14c3c7cm4_weight(1));
    PL_STEP_0_for_c2c9c3c0cm1cm50c23c6c6c5cm4c4c0c16c2cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c9c3c0cm1cm50c23c6c6c5cm4c4c0c16c2cm5_weight(0), c2c9c3c0cm1cm50c23c6c6c5cm4c4c0c16c2cm5_weight(1));
    PL_STEP_0_for_c1c2cm1c9cm31c11c10c3cm3cm2c9cm1c0cm9cm2c10_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c2cm1c9cm31c11c10c3cm3cm2c9cm1c0cm9cm2c10_weight(0), c1c2cm1c9cm31c11c10c3cm3cm2c9cm1c0cm9cm2c10_weight(1));
    PL_STEP_0_for_c26c13cm4cm3cm8c11c1c3cm9cm4cm3c12c10c10cm4cm18_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c26c13cm4cm3cm8c11c1c3cm9cm4cm3c12c10c10cm4cm18_weight(0), c26c13cm4cm3cm8c11c1c3cm9cm4cm3c12c10c10cm4cm18_weight(1));
    PL_STEP_0_for_cm12c0cm2c8c30c7cm12c2c8c3c6cm1c5cm1c2c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm12c0cm2c8c30c7cm12c2c8c3c6cm1c5cm1c2c2_weight(0), cm12c0cm2c8c30c7cm12c2c8c3c6cm1c5cm1c2c2_weight(1));
    PL_STEP_0_for_cm32c3cm1cm6cm20c2cm10cm56c2cm2cm1cm59c11c9c2c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm32c3cm1cm6cm20c2cm10cm56c2cm2cm1cm59c11c9c2c1_weight(0), cm32c3cm1cm6cm20c2cm10cm56c2cm2cm1cm59c11c9c2c1_weight(1));
    PL_STEP_0_for_c4c4cm1cm6c26cm1c9cm12cm27cm1c4cm51c4cm12c2c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4c4cm1cm6c26cm1c9cm12cm27cm1c4cm51c4cm12c2c4_weight(0), c4c4cm1cm6c26cm1c9cm12cm27cm1c4cm51c4cm12c2c4_weight(1));
    PL_STEP_0_for_cm6c26c8c6cm7cm1cm3c3c0c4c4cm2cm2c3c7cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6c26c8c6cm7cm1cm3c3c0c4c4cm2cm2c3c7cm2_weight(0), cm6c26c8c6cm7cm1cm3c3c0c4c4cm2cm2c3c7cm2_weight(1));
    PL_STEP_0_for_cm21c8cm23cm17c7cm6c1c0cm2c2cm2c7cm3c3c1c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm21c8cm23cm17c7cm6c1c0cm2c2cm2c7cm3c3c1c3_weight(0), cm21c8cm23cm17c7cm6c1c0cm2c2cm2c7cm3c3c1c3_weight(1));
    PL_STEP_0_for_c17cm19cm1cm5c8cm8c7c0c8cm56c6cm2c7c9c13cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c17cm19cm1cm5c8cm8c7c0c8cm56c6cm2c7c9c13cm1_weight(0), c17cm19cm1cm5c8cm8c7c0c8cm56c6cm2c7c9c13cm1_weight(1));
    PL_STEP_0_for_c4cm23c9cm3c9c15c1cm3c0cm10c7c2c4c81c4c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4cm23c9cm3c9c15c1cm3c0cm10c7c2c4c81c4c3_weight(0), c4cm23c9cm3c9c15c1cm3c0cm10c7c2c4c81c4c3_weight(1));
    PL_STEP_0_for_cm2cm2cm2cm2cm6c24c5cm5c2cm10c5cm5c14c4c7c7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm2cm2cm2cm6c24c5cm5c2cm10c5cm5c14c4c7c7_weight(0), cm2cm2cm2cm2cm6c24c5cm5c2cm10c5cm5c14c4c7c7_weight(1));
    PL_STEP_0_for_cm4cm29c12c1c5c29c4c5c2c2c0c0c8cm18c1c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4cm29c12c1c5c29c4c5c2c2c0c0c8cm18c1c2_weight(0), cm4cm29c12c1c5c29c4c5c2c2c0c0c8cm18c1c2_weight(1));
    PL_STEP_0_for_c7cm9cm10cm1c3cm10cm28c33cm12cm12cm13c1cm14c7c0c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c7cm9cm10cm1c3cm10cm28c33cm12cm12cm13c1cm14c7c0c1_weight(0), c7cm9cm10cm1c3cm10cm28c33cm12cm12cm13c1cm14c7c0c1_weight(1));
    PL_STEP_0_for_cm3cm28c14c4cm6cm12c4c5c12cm1cm17c3cm1cm8cm2cm29_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3cm28c14c4cm6cm12c4c5c12cm1cm17c3cm1cm8cm2cm29_weight(0), cm3cm28c14c4cm6cm12c4c5c12cm1cm17c3cm1cm8cm2cm29_weight(1));
    PL_STEP_0_for_c2c32cm4c21c12cm1c6c6cm6cm2c1cm1cm7c15c1c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c32cm4c21c12cm1c6c6cm6cm2c1cm1cm7c15c1c1_weight(0), c2c32cm4c21c12cm1c6c6cm6cm2c1cm1cm7c15c1c1_weight(1));
    PL_STEP_0_for_c0c7cm3c4c15c13c37c6c4cm2cm5c1c68c0c25c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c7cm3c4c15c13c37c6c4cm2cm5c1c68c0c25c0_weight(0), c0c7cm3c4c15c13c37c6c4cm2cm5c1c68c0c25c0_weight(1));
    PL_STEP_0_for_cm25c7cm1c2c17c3c2c4c22c3c2cm40c3c23cm4cm20_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm25c7cm1c2c17c3c2c4c22c3c2cm40c3c23cm4cm20_weight(0), cm25c7cm1c2c17c3c2c4c22c3c2cm40c3c23cm4cm20_weight(1));
    PL_STEP_0_for_c0c27c13cm22c3cm24cm32c48cm1c7cm6c3c8cm45c8cm13_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c27c13cm22c3cm24cm32c48cm1c7cm6c3c8cm45c8cm13_weight(0), c0c27c13cm22c3cm24cm32c48cm1c7cm6c3c8cm45c8cm13_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    cm6c11cm22c1c103c7c15c9c4c0c0c2cm4c3cm14c2_cm3cm3c6cm14cm2c6c10cm2c3c6cm5c1c8c1cm8cm14_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm6c11cm22c1c103c7c15c9c4c0c0c2cm4c3cm14c2_weight(1)(8-1 downto 0),
			B	=> cm3cm3c6cm14cm2c6c10cm2c3c6cm5c1c8c1cm8cm14_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm6c11cm22c1c103c7c15c9c4c0c0c2cm4c3cm14c2,
			CxB => R_cm3cm3c6cm14cm2c6c10cm2c3c6cm5c1c8c1cm8cm14
		);

    cm72c0cm1cm6c29c5c3cm7cm1c7c7cm1cm11c3cm2c0_cm3cm28c14c4cm6cm12c4c5c12cm1cm17c3cm1cm8cm2cm29_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 8,
			B_WIDTH => 6,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm72c0cm1cm6c29c5c3cm7cm1c7c7cm1cm11c3cm2c0_weight(1)(8-1 downto 0),
			B	=> cm3cm28c14c4cm6cm12c4c5c12cm1cm17c3cm1cm8cm2cm29_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm72c0cm1cm6c29c5c3cm7cm1c7c7cm1cm11c3cm2c0,
			CxB => R_cm3cm28c14c4cm6cm12c4c5c12cm1cm17c3cm1cm8cm2cm29
		);

    c4cm23c9cm3c9c15c1cm3c0cm10c7c2c4c81c4c3_cm4cm29c12c1c5c29c4c5c2c2c0c0c8cm18c1c2_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 8,
			B_WIDTH => 6,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c4cm23c9cm3c9c15c1cm3c0cm10c7c2c4c81c4c3_weight(1)(8-1 downto 0),
			B	=> cm4cm29c12c1c5c29c4c5c2c2c0c0c8cm18c1c2_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c4cm23c9cm3c9c15c1cm3c0cm10c7c2c4c81c4c3,
			CxB => R_cm4cm29c12c1c5c29c4c5c2c2c0c0c8cm18c1c2
		);

    c0c7cm3c4c15c13c37c6c4cm2cm5c1c68c0c25c0_cm2cm2cm2cm2cm6c24c5cm5c2cm10c5cm5c14c4c7c7_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 8,
			B_WIDTH => 6,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c0c7cm3c4c15c13c37c6c4cm2cm5c1c68c0c25c0_weight(1)(8-1 downto 0),
			B	=> cm2cm2cm2cm2cm6c24c5cm5c2cm10c5cm5c14c4c7c7_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c7cm3c4c15c13c37c6c4cm2cm5c1c68c0c25c0,
			CxB => R_cm2cm2cm2cm2cm6c24c5cm5c2cm10c5cm5c14c4c7c7
		);

    cm2cm11c6c4c4c8c2c11c60c1cm4cm3cm4cm8cm8cm1_cm21c8cm23cm17c7cm6c1c0cm2c2cm2c7cm3c3c1c3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2cm11c6c4c4c8c2c11c60c1cm4cm3cm4cm8cm8cm1_weight(1)(7-1 downto 0),
			B	=> cm21c8cm23cm17c7cm6c1c0cm2c2cm2c7cm3c3c1c3_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2cm11c6c4c4c8c2c11c60c1cm4cm3cm4cm8cm8cm1,
			CxB => R_cm21c8cm23cm17c7cm6c1c0cm2c2cm2c7cm3c3c1c3
		);

    cm2c1c29c10c7cm2cm40cm35cm7c5c1c10c10c6c10c7_cm6c26c8c6cm7cm1cm3c3c0c4c4cm2cm2c3c7cm2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2c1c29c10c7cm2cm40cm35cm7c5c1c10c10c6c10c7_weight(1)(7-1 downto 0),
			B	=> cm6c26c8c6cm7cm1cm3c3c0c4c4cm2cm2c3c7cm2_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2c1c29c10c7cm2cm40cm35cm7c5c1c10c10c6c10c7,
			CxB => R_cm6c26c8c6cm7cm1cm3c3c0c4c4cm2cm2c3c7cm2
		);

    c13c20c0cm17c8c11cm10cm19cm4c1c12cm1c0cm15cm43c10_cm12c0cm2c8c30c7cm12c2c8c3c6cm1c5cm1c2c2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c13c20c0cm17c8c11cm10cm19cm4c1c12cm1c0cm15cm43c10_weight(1)(7-1 downto 0),
			B	=> cm12c0cm2c8c30c7cm12c2c8c3c6cm1c5cm1c2c2_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c13c20c0cm17c8c11cm10cm19cm4c1c12cm1c0cm15cm43c10,
			CxB => R_cm12c0cm2c8c30c7cm12c2c8c3c6cm1c5cm1c2c2
		);

    c20c5c43cm15cm11c10c0cm10cm9cm7cm2c1c26c11c29c0_c26c13cm4cm3cm8c11c1c3cm9cm4cm3c12c10c10cm4cm18_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c20c5c43cm15cm11c10c0cm10cm9cm7cm2c1c26c11c29c0_weight(1)(7-1 downto 0),
			B	=> c26c13cm4cm3cm8c11c1c3cm9cm4cm3c12c10c10cm4cm18_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c20c5c43cm15cm11c10c0cm10cm9cm7cm2c1c26c11c29c0,
			CxB => R_c26c13cm4cm3cm8c11c1c3cm9cm4cm3c12c10c10cm4cm18
		);

    c0cm19c10cm6cm2c11cm7c8c3cm4c7c8cm2c44c7cm26_c1c2cm1c9cm31c11c10c3cm3cm2c9cm1c0cm9cm2c10_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0cm19c10cm6cm2c11cm7c8c3cm4c7c8cm2c44c7cm26_weight(1)(7-1 downto 0),
			B	=> c1c2cm1c9cm31c11c10c3cm3cm2c9cm1c0cm9cm2c10_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0cm19c10cm6cm2c11cm7c8c3cm4c7c8cm2c44c7cm26,
			CxB => R_c1c2cm1c9cm31c11c10c3cm3cm2c9cm1c0cm9cm2c10
		);

    c2c9c3c0cm1cm50c23c6c6c5cm4c4c0c16c2cm5_c23c0c1c0c2c10c3cm4c1cm4cm1c3cm14c3c7cm4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c2c9c3c0cm1cm50c23c6c6c5cm4c4c0c16c2cm5_weight(1)(7-1 downto 0),
			B	=> c23c0c1c0c2c10c3cm4c1cm4cm1c3cm14c3c7cm4_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c2c9c3c0cm1cm50c23c6c6c5cm4c4c0c16c2cm5,
			CxB => R_c23c0c1c0c2c10c3cm4c1cm4cm1c3cm14c3c7cm4
		);

    cm32c3cm1cm6cm20c2cm10cm56c2cm2cm1cm59c11c9c2c1_c11cm23cm9cm1cm1c14c15c0cm8c3c25c2cm2cm4c6cm3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm32c3cm1cm6cm20c2cm10cm56c2cm2cm1cm59c11c9c2c1_weight(1)(7-1 downto 0),
			B	=> c11cm23cm9cm1cm1c14c15c0cm8c3c25c2cm2cm4c6cm3_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm32c3cm1cm6cm20c2cm10cm56c2cm2cm1cm59c11c9c2c1,
			CxB => R_c11cm23cm9cm1cm1c14c15c0cm8c3c25c2cm2cm4c6cm3
		);

    c4c4cm1cm6c26cm1c9cm12cm27cm1c4cm51c4cm12c2c4_cm3cm5cm2c9cm30cm4c1c11cm4cm2c3cm15c6cm2cm5cm7_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c4c4cm1cm6c26cm1c9cm12cm27cm1c4cm51c4cm12c2c4_weight(1)(7-1 downto 0),
			B	=> cm3cm5cm2c9cm30cm4c1c11cm4cm2c3cm15c6cm2cm5cm7_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c4c4cm1cm6c26cm1c9cm12cm27cm1c4cm51c4cm12c2c4,
			CxB => R_cm3cm5cm2c9cm30cm4c1c11cm4cm2c3cm15c6cm2cm5cm7
		);

    c17cm19cm1cm5c8cm8c7c0c8cm56c6cm2c7c9c13cm1_c12cm13cm2c0cm25c20c7cm28cm7cm4c3c2c7c4cm1cm16_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c17cm19cm1cm5c8cm8c7c0c8cm56c6cm2c7c9c13cm1_weight(1)(7-1 downto 0),
			B	=> c12cm13cm2c0cm25c20c7cm28cm7cm4c3c2c7c4cm1cm16_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c17cm19cm1cm5c8cm8c7c0c8cm56c6cm2c7c9c13cm1,
			CxB => R_c12cm13cm2c0cm25c20c7cm28cm7cm4c3c2c7c4cm1cm16
		);

    c7cm9cm10cm1c3cm10cm28c33cm12cm12cm13c1cm14c7c0c1_cm3c4cm15cm1cm16cm4c17c11cm15cm2cm1cm6cm7c3c13c3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c7cm9cm10cm1c3cm10cm28c33cm12cm12cm13c1cm14c7c0c1_weight(1)(7-1 downto 0),
			B	=> cm3c4cm15cm1cm16cm4c17c11cm15cm2cm1cm6cm7c3c13c3_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c7cm9cm10cm1c3cm10cm28c33cm12cm12cm13c1cm14c7c0c1,
			CxB => R_cm3c4cm15cm1cm16cm4c17c11cm15cm2cm1cm6cm7c3c13c3
		);

    c2c32cm4c21c12cm1c6c6cm6cm2c1cm1cm7c15c1c1_cm5cm12cm3cm3cm24cm4cm17c0c12c2cm10cm1c7c17c18cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c2c32cm4c21c12cm1c6c6cm6cm2c1cm1cm7c15c1c1_weight(1)(7-1 downto 0),
			B	=> cm5cm12cm3cm3cm24cm4cm17c0c12c2cm10cm1c7c17c18cm1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c2c32cm4c21c12cm1c6c6cm6cm2c1cm1cm7c15c1c1,
			CxB => R_cm5cm12cm3cm3cm24cm4cm17c0c12c2cm10cm1c7c17c18cm1
		);

    cm25c7cm1c2c17c3c2c4c22c3c2cm40c3c23cm4cm20_c0c27c13cm22c3cm24cm32c48cm1c7cm6c3c8cm45c8cm13_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm25c7cm1c2c17c3c2c4c22c3c2cm40c3c23cm4cm20_weight(1)(7-1 downto 0),
			B	=> c0c27c13cm22c3cm24cm32c48cm1c7cm6c3c8cm45c8cm13_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm25c7cm1c2c17c3c2c4c22c3c2cm40c3c23cm4cm20,
			CxB => R_c0c27c13cm22c3cm24cm32c48cm1c7cm6c3c8cm45c8cm13
		);




end architecture;
