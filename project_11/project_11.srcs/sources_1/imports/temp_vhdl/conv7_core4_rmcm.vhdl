library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core4_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        R_c0c4cm1c2cm6cm1c2cm1c2c7c4c8c4c7c3c6 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_cm1cm11cm6cm8cm4cm11cm1c3cm3c4cm12c4cm12c2cm38c6 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c7cm19cm2cm2c1cm4c3cm9c86c7c3c28cm7c7cm4c2 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c84c3cm14cm2cm4c5cm9c4cm5c3c12cm4cm11c1c52cm34 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c9c32c2c8cm9c7c3cm26cm2c0c7cm3cm29cm7cm22cm8 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm2cm4cm11cm25c0cm4c2cm1cm2c3cm3c11cm6c0cm15c0 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c7c4c0c0c13c4cm2c9c8c1cm1cm4c28c9c0cm12 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm9c6c6cm2c7cm8c2c16cm7c3c2cm1cm23c6cm3cm3 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm11cm9cm2c3cm14cm5cm4cm5cm9c12c3cm14c2c39c1c6 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c3cm1cm9c3c4c0cm1cm14cm1cm4c7c6c4cm4cm6c6 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_cm7c1c4c27cm5cm9c31cm1cm2cm7cm3cm2c0c16cm17cm3 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c4c0c1cm6cm1c1c0c2cm4c0c1cm6c17c4c15cm3 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm6c28c2cm1c31c3c0cm1c4c7c24c0cm6cm1cm2c0 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c1cm3cm1c3cm4cm5c4c8cm16c1cm1c5cm1cm8cm11c5 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_c1cm13c3cm6c4cm3cm2c4cm6cm3cm2cm2c4cm2c3c7 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_c4c19c1cm19c1cm1c2c5cm9cm2c4c0c21c11c3cm2 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm10c37c15cm4c0c13c1c6cm2c11cm7c0c9c29c0cm33 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm5cm1c1cm13cm8cm3cm2c3c4c2c11cm4cm43cm5cm2c4 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c3cm6cm3c3c3c3cm1cm4c1cm3cm8c2cm4c18cm20cm31 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c0cm7c9cm2cm6cm21cm2c6c0cm9c8c8cm26cm19cm2c30 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c0cm7cm3c38cm2cm37cm2c0cm8c7c15c4cm2c11c8cm1 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c12cm13cm10cm4c6c4cm9c18cm13cm1c4cm4cm11c1cm7cm12 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c5c2cm1c0c22cm1c22c7c9cm14cm8c2cm9c20c3c4 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c1cm2cm2c10c6cm2c20c0c3cm6c6cm9cm4cm28cm4c0 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm1c3c1cm2cm9c3cm1cm9c6c0c0cm3c30cm2cm14cm6 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm25c0cm21c1c5c2c11c3cm11cm9cm4cm1cm14cm25cm1cm6 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c1c2c2cm2c3cm2c4cm2c1cm23cm21cm9cm3c7c22c29 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c9cm1cm5c2c4c16c5c2c6cm18cm7cm3c34cm1cm32cm9 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm6c7c1cm6c12c3cm9cm6cm5c10c1cm6c5c6c8cm14 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_c0cm5cm2c2c1c9cm8c6cm3c2cm8c8cm14c5c4c2 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_cm4cm5c0c0cm5c0cm3c0c24c5c0cm6c14c17c2c7 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c11c4cm1cm3c8c3c10cm17cm2cm3cm2cm9c5cm10c51cm19 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(11-1 downto 0)  --	sfix(1, -10)
    );
end conv7_core4_rmcm;

architecture arch of conv7_core4_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C4CM1C2CM6CM1C2CM1C2C7C4C8C4C7C3C6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM11CM6CM8CM4CM11CM1C3CM3C4CM12C4CM12C2CM38C6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C7CM19CM2CM2C1CM4C3CM9C86C7C3C28CM7C7CM4C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C84C3CM14CM2CM4C5CM9C4CM5C3C12CM4CM11C1C52CM34_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C9C32C2C8CM9C7C3CM26CM2C0C7CM3CM29CM7CM22CM8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM4CM11CM25C0CM4C2CM1CM2C3CM3C11CM6C0CM15C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C7C4C0C0C13C4CM2C9C8C1CM1CM4C28C9C0CM12_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM9C6C6CM2C7CM8C2C16CM7C3C2CM1CM23C6CM3CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM11CM9CM2C3CM14CM5CM4CM5CM9C12C3CM14C2C39C1C6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3CM1CM9C3C4C0CM1CM14CM1CM4C7C6C4CM4CM6C6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM7C1C4C27CM5CM9C31CM1CM2CM7CM3CM2C0C16CM17CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4C0C1CM6CM1C1C0C2CM4C0C1CM6C17C4C15CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6C28C2CM1C31C3C0CM1C4C7C24C0CM6CM1CM2C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM3CM1C3CM4CM5C4C8CM16C1CM1C5CM1CM8CM11C5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM13C3CM6C4CM3CM2C4CM6CM3CM2CM2C4CM2C3C7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4C19C1CM19C1CM1C2C5CM9CM2C4C0C21C11C3CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM10C37C15CM4C0C13C1C6CM2C11CM7C0C9C29C0CM33_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5CM1C1CM13CM8CM3CM2C3C4C2C11CM4CM43CM5CM2C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3CM6CM3C3C3C3CM1CM4C1CM3CM8C2CM4C18CM20CM31_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM7C9CM2CM6CM21CM2C6C0CM9C8C8CM26CM19CM2C30_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM7CM3C38CM2CM37CM2C0CM8C7C15C4CM2C11C8CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C12CM13CM10CM4C6C4CM9C18CM13CM1C4CM4CM11C1CM7CM12_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5C2CM1C0C22CM1C22C7C9CM14CM8C2CM9C20C3C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM2CM2C10C6CM2C20C0C3CM6C6CM9CM4CM28CM4C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C3C1CM2CM9C3CM1CM9C6C0C0CM3C30CM2CM14CM6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM25C0CM21C1C5C2C11C3CM11CM9CM4CM1CM14CM25CM1CM6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C2C2CM2C3CM2C4CM2C1CM23CM21CM9CM3C7C22C29_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C9CM1CM5C2C4C16C5C2C6CM18CM7CM3C34CM1CM32CM9_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6C7C1CM6C12C3CM9CM6CM5C10C1CM6C5C6C8CM14_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM5CM2C2C1C9CM8C6CM3C2CM8C8CM14C5C4C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4CM5C0C0CM5C0CM3C0C24C5C0CM6C14C17C2C7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C11C4CM1CM3C8C3C10CM17CM2CM3CM2CM9C5CM10C51CM19_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(4, -3)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(1, -7)
    signal c0c4cm1c2cm6cm1c2cm1c2c7c4c8c4c7c3c6_weight : PIPELINE_TYPE_FOR_C0C4CM1C2CM6CM1C2CM1C2C7C4C8C4C7C3C6_WEIGHT;
    -- sfix(1, -7)
    signal cm1cm11cm6cm8cm4cm11cm1c3cm3c4cm12c4cm12c2cm38c6_weight : PIPELINE_TYPE_FOR_CM1CM11CM6CM8CM4CM11CM1C3CM3C4CM12C4CM12C2CM38C6_WEIGHT;
    -- sfix(1, -7)
    signal c7cm19cm2cm2c1cm4c3cm9c86c7c3c28cm7c7cm4c2_weight : PIPELINE_TYPE_FOR_C7CM19CM2CM2C1CM4C3CM9C86C7C3C28CM7C7CM4C2_WEIGHT;
    -- sfix(1, -7)
    signal c84c3cm14cm2cm4c5cm9c4cm5c3c12cm4cm11c1c52cm34_weight : PIPELINE_TYPE_FOR_C84C3CM14CM2CM4C5CM9C4CM5C3C12CM4CM11C1C52CM34_WEIGHT;
    -- sfix(1, -7)
    signal c9c32c2c8cm9c7c3cm26cm2c0c7cm3cm29cm7cm22cm8_weight : PIPELINE_TYPE_FOR_C9C32C2C8CM9C7C3CM26CM2C0C7CM3CM29CM7CM22CM8_WEIGHT;
    -- sfix(1, -7)
    signal cm2cm4cm11cm25c0cm4c2cm1cm2c3cm3c11cm6c0cm15c0_weight : PIPELINE_TYPE_FOR_CM2CM4CM11CM25C0CM4C2CM1CM2C3CM3C11CM6C0CM15C0_WEIGHT;
    -- sfix(1, -7)
    signal c7c4c0c0c13c4cm2c9c8c1cm1cm4c28c9c0cm12_weight : PIPELINE_TYPE_FOR_C7C4C0C0C13C4CM2C9C8C1CM1CM4C28C9C0CM12_WEIGHT;
    -- sfix(1, -7)
    signal cm9c6c6cm2c7cm8c2c16cm7c3c2cm1cm23c6cm3cm3_weight : PIPELINE_TYPE_FOR_CM9C6C6CM2C7CM8C2C16CM7C3C2CM1CM23C6CM3CM3_WEIGHT;
    -- sfix(1, -7)
    signal cm11cm9cm2c3cm14cm5cm4cm5cm9c12c3cm14c2c39c1c6_weight : PIPELINE_TYPE_FOR_CM11CM9CM2C3CM14CM5CM4CM5CM9C12C3CM14C2C39C1C6_WEIGHT;
    -- sfix(1, -7)
    signal c3cm1cm9c3c4c0cm1cm14cm1cm4c7c6c4cm4cm6c6_weight : PIPELINE_TYPE_FOR_C3CM1CM9C3C4C0CM1CM14CM1CM4C7C6C4CM4CM6C6_WEIGHT;
    -- sfix(1, -7)
    signal cm7c1c4c27cm5cm9c31cm1cm2cm7cm3cm2c0c16cm17cm3_weight : PIPELINE_TYPE_FOR_CM7C1C4C27CM5CM9C31CM1CM2CM7CM3CM2C0C16CM17CM3_WEIGHT;
    -- sfix(1, -7)
    signal c4c0c1cm6cm1c1c0c2cm4c0c1cm6c17c4c15cm3_weight : PIPELINE_TYPE_FOR_C4C0C1CM6CM1C1C0C2CM4C0C1CM6C17C4C15CM3_WEIGHT;
    -- sfix(1, -7)
    signal cm6c28c2cm1c31c3c0cm1c4c7c24c0cm6cm1cm2c0_weight : PIPELINE_TYPE_FOR_CM6C28C2CM1C31C3C0CM1C4C7C24C0CM6CM1CM2C0_WEIGHT;
    -- sfix(1, -7)
    signal c1cm3cm1c3cm4cm5c4c8cm16c1cm1c5cm1cm8cm11c5_weight : PIPELINE_TYPE_FOR_C1CM3CM1C3CM4CM5C4C8CM16C1CM1C5CM1CM8CM11C5_WEIGHT;
    -- sfix(1, -7)
    signal c1cm13c3cm6c4cm3cm2c4cm6cm3cm2cm2c4cm2c3c7_weight : PIPELINE_TYPE_FOR_C1CM13C3CM6C4CM3CM2C4CM6CM3CM2CM2C4CM2C3C7_WEIGHT;
    -- sfix(1, -7)
    signal c4c19c1cm19c1cm1c2c5cm9cm2c4c0c21c11c3cm2_weight : PIPELINE_TYPE_FOR_C4C19C1CM19C1CM1C2C5CM9CM2C4C0C21C11C3CM2_WEIGHT;
    -- sfix(1, -7)
    signal cm10c37c15cm4c0c13c1c6cm2c11cm7c0c9c29c0cm33_weight : PIPELINE_TYPE_FOR_CM10C37C15CM4C0C13C1C6CM2C11CM7C0C9C29C0CM33_WEIGHT;
    -- sfix(1, -7)
    signal cm5cm1c1cm13cm8cm3cm2c3c4c2c11cm4cm43cm5cm2c4_weight : PIPELINE_TYPE_FOR_CM5CM1C1CM13CM8CM3CM2C3C4C2C11CM4CM43CM5CM2C4_WEIGHT;
    -- sfix(1, -7)
    signal c3cm6cm3c3c3c3cm1cm4c1cm3cm8c2cm4c18cm20cm31_weight : PIPELINE_TYPE_FOR_C3CM6CM3C3C3C3CM1CM4C1CM3CM8C2CM4C18CM20CM31_WEIGHT;
    -- sfix(1, -7)
    signal c0cm7c9cm2cm6cm21cm2c6c0cm9c8c8cm26cm19cm2c30_weight : PIPELINE_TYPE_FOR_C0CM7C9CM2CM6CM21CM2C6C0CM9C8C8CM26CM19CM2C30_WEIGHT;
    -- sfix(1, -7)
    signal c0cm7cm3c38cm2cm37cm2c0cm8c7c15c4cm2c11c8cm1_weight : PIPELINE_TYPE_FOR_C0CM7CM3C38CM2CM37CM2C0CM8C7C15C4CM2C11C8CM1_WEIGHT;
    -- sfix(1, -7)
    signal c12cm13cm10cm4c6c4cm9c18cm13cm1c4cm4cm11c1cm7cm12_weight : PIPELINE_TYPE_FOR_C12CM13CM10CM4C6C4CM9C18CM13CM1C4CM4CM11C1CM7CM12_WEIGHT;
    -- sfix(1, -7)
    signal c5c2cm1c0c22cm1c22c7c9cm14cm8c2cm9c20c3c4_weight : PIPELINE_TYPE_FOR_C5C2CM1C0C22CM1C22C7C9CM14CM8C2CM9C20C3C4_WEIGHT;
    -- sfix(1, -7)
    signal c1cm2cm2c10c6cm2c20c0c3cm6c6cm9cm4cm28cm4c0_weight : PIPELINE_TYPE_FOR_C1CM2CM2C10C6CM2C20C0C3CM6C6CM9CM4CM28CM4C0_WEIGHT;
    -- sfix(1, -7)
    signal cm1c3c1cm2cm9c3cm1cm9c6c0c0cm3c30cm2cm14cm6_weight : PIPELINE_TYPE_FOR_CM1C3C1CM2CM9C3CM1CM9C6C0C0CM3C30CM2CM14CM6_WEIGHT;
    -- sfix(1, -7)
    signal cm25c0cm21c1c5c2c11c3cm11cm9cm4cm1cm14cm25cm1cm6_weight : PIPELINE_TYPE_FOR_CM25C0CM21C1C5C2C11C3CM11CM9CM4CM1CM14CM25CM1CM6_WEIGHT;
    -- sfix(1, -7)
    signal c1c2c2cm2c3cm2c4cm2c1cm23cm21cm9cm3c7c22c29_weight : PIPELINE_TYPE_FOR_C1C2C2CM2C3CM2C4CM2C1CM23CM21CM9CM3C7C22C29_WEIGHT;
    -- sfix(1, -7)
    signal c9cm1cm5c2c4c16c5c2c6cm18cm7cm3c34cm1cm32cm9_weight : PIPELINE_TYPE_FOR_C9CM1CM5C2C4C16C5C2C6CM18CM7CM3C34CM1CM32CM9_WEIGHT;
    -- sfix(1, -7)
    signal cm6c7c1cm6c12c3cm9cm6cm5c10c1cm6c5c6c8cm14_weight : PIPELINE_TYPE_FOR_CM6C7C1CM6C12C3CM9CM6CM5C10C1CM6C5C6C8CM14_WEIGHT;
    -- sfix(1, -7)
    signal c0cm5cm2c2c1c9cm8c6cm3c2cm8c8cm14c5c4c2_weight : PIPELINE_TYPE_FOR_C0CM5CM2C2C1C9CM8C6CM3C2CM8C8CM14C5C4C2_WEIGHT;
    -- sfix(1, -7)
    signal cm4cm5c0c0cm5c0cm3c0c24c5c0cm6c14c17c2c7_weight : PIPELINE_TYPE_FOR_CM4CM5C0C0CM5C0CM3C0C24C5C0CM6C14C17C2C7_WEIGHT;
    -- sfix(1, -7)
    signal c11c4cm1cm3c8c3c10cm17cm2cm3cm2cm9c5cm10c51cm19_weight : PIPELINE_TYPE_FOR_C11C4CM1CM3C8C3C10CM17CM2CM3CM2CM9C5CM10C51CM19_WEIGHT;
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



    WEIGHT_ROM: entity work.conv7_core4_rmcm_weightsconstant_memory
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
        
            dout1   => c0c4cm1c2cm6cm1c2cm1c2c7c4c8c4c7c3c6_weight(0), 
            dout2   => cm1cm11cm6cm8cm4cm11cm1c3cm3c4cm12c4cm12c2cm38c6_weight(0), 
            dout3   => c7cm19cm2cm2c1cm4c3cm9c86c7c3c28cm7c7cm4c2_weight(0), 
            dout4   => c84c3cm14cm2cm4c5cm9c4cm5c3c12cm4cm11c1c52cm34_weight(0), 
            dout5   => c9c32c2c8cm9c7c3cm26cm2c0c7cm3cm29cm7cm22cm8_weight(0), 
            dout6   => cm2cm4cm11cm25c0cm4c2cm1cm2c3cm3c11cm6c0cm15c0_weight(0), 
            dout7   => c7c4c0c0c13c4cm2c9c8c1cm1cm4c28c9c0cm12_weight(0), 
            dout8   => cm9c6c6cm2c7cm8c2c16cm7c3c2cm1cm23c6cm3cm3_weight(0), 
            dout9   => cm11cm9cm2c3cm14cm5cm4cm5cm9c12c3cm14c2c39c1c6_weight(0), 
            dout10   => c3cm1cm9c3c4c0cm1cm14cm1cm4c7c6c4cm4cm6c6_weight(0), 
            dout11   => cm7c1c4c27cm5cm9c31cm1cm2cm7cm3cm2c0c16cm17cm3_weight(0), 
            dout12   => c4c0c1cm6cm1c1c0c2cm4c0c1cm6c17c4c15cm3_weight(0), 
            dout13   => cm6c28c2cm1c31c3c0cm1c4c7c24c0cm6cm1cm2c0_weight(0), 
            dout14   => c1cm3cm1c3cm4cm5c4c8cm16c1cm1c5cm1cm8cm11c5_weight(0), 
            dout15   => c1cm13c3cm6c4cm3cm2c4cm6cm3cm2cm2c4cm2c3c7_weight(0), 
            dout16   => c4c19c1cm19c1cm1c2c5cm9cm2c4c0c21c11c3cm2_weight(0), 
            dout17   => cm10c37c15cm4c0c13c1c6cm2c11cm7c0c9c29c0cm33_weight(0), 
            dout18   => cm5cm1c1cm13cm8cm3cm2c3c4c2c11cm4cm43cm5cm2c4_weight(0), 
            dout19   => c3cm6cm3c3c3c3cm1cm4c1cm3cm8c2cm4c18cm20cm31_weight(0), 
            dout20   => c0cm7c9cm2cm6cm21cm2c6c0cm9c8c8cm26cm19cm2c30_weight(0), 
            dout21   => c0cm7cm3c38cm2cm37cm2c0cm8c7c15c4cm2c11c8cm1_weight(0), 
            dout22   => c12cm13cm10cm4c6c4cm9c18cm13cm1c4cm4cm11c1cm7cm12_weight(0), 
            dout23   => c5c2cm1c0c22cm1c22c7c9cm14cm8c2cm9c20c3c4_weight(0), 
            dout24   => c1cm2cm2c10c6cm2c20c0c3cm6c6cm9cm4cm28cm4c0_weight(0), 
            dout25   => cm1c3c1cm2cm9c3cm1cm9c6c0c0cm3c30cm2cm14cm6_weight(0), 
            dout26   => cm25c0cm21c1c5c2c11c3cm11cm9cm4cm1cm14cm25cm1cm6_weight(0), 
            dout27   => c1c2c2cm2c3cm2c4cm2c1cm23cm21cm9cm3c7c22c29_weight(0), 
            dout28   => c9cm1cm5c2c4c16c5c2c6cm18cm7cm3c34cm1cm32cm9_weight(0), 
            dout29   => cm6c7c1cm6c12c3cm9cm6cm5c10c1cm6c5c6c8cm14_weight(0), 
            dout30   => c0cm5cm2c2c1c9cm8c6cm3c2cm8c8cm14c5c4c2_weight(0), 
            dout31   => cm4cm5c0c0cm5c0cm3c0c24c5c0cm6c14c17c2c7_weight(0), 
            dout32   => c11c4cm1cm3c8c3c10cm17cm2cm3cm2cm9c5cm10c51cm19_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_c0c4cm1c2cm6cm1c2cm1c2c7c4c8c4c7c3c6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c4cm1c2cm6cm1c2cm1c2c7c4c8c4c7c3c6_weight(0), c0c4cm1c2cm6cm1c2cm1c2c7c4c8c4c7c3c6_weight(1));
    PL_STEP_0_for_cm1cm11cm6cm8cm4cm11cm1c3cm3c4cm12c4cm12c2cm38c6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm11cm6cm8cm4cm11cm1c3cm3c4cm12c4cm12c2cm38c6_weight(0), cm1cm11cm6cm8cm4cm11cm1c3cm3c4cm12c4cm12c2cm38c6_weight(1));
    PL_STEP_0_for_c7cm19cm2cm2c1cm4c3cm9c86c7c3c28cm7c7cm4c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c7cm19cm2cm2c1cm4c3cm9c86c7c3c28cm7c7cm4c2_weight(0), c7cm19cm2cm2c1cm4c3cm9c86c7c3c28cm7c7cm4c2_weight(1));
    PL_STEP_0_for_c84c3cm14cm2cm4c5cm9c4cm5c3c12cm4cm11c1c52cm34_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c84c3cm14cm2cm4c5cm9c4cm5c3c12cm4cm11c1c52cm34_weight(0), c84c3cm14cm2cm4c5cm9c4cm5c3c12cm4cm11c1c52cm34_weight(1));
    PL_STEP_0_for_c9c32c2c8cm9c7c3cm26cm2c0c7cm3cm29cm7cm22cm8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c9c32c2c8cm9c7c3cm26cm2c0c7cm3cm29cm7cm22cm8_weight(0), c9c32c2c8cm9c7c3cm26cm2c0c7cm3cm29cm7cm22cm8_weight(1));
    PL_STEP_0_for_cm2cm4cm11cm25c0cm4c2cm1cm2c3cm3c11cm6c0cm15c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm4cm11cm25c0cm4c2cm1cm2c3cm3c11cm6c0cm15c0_weight(0), cm2cm4cm11cm25c0cm4c2cm1cm2c3cm3c11cm6c0cm15c0_weight(1));
    PL_STEP_0_for_c7c4c0c0c13c4cm2c9c8c1cm1cm4c28c9c0cm12_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c7c4c0c0c13c4cm2c9c8c1cm1cm4c28c9c0cm12_weight(0), c7c4c0c0c13c4cm2c9c8c1cm1cm4c28c9c0cm12_weight(1));
    PL_STEP_0_for_cm9c6c6cm2c7cm8c2c16cm7c3c2cm1cm23c6cm3cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm9c6c6cm2c7cm8c2c16cm7c3c2cm1cm23c6cm3cm3_weight(0), cm9c6c6cm2c7cm8c2c16cm7c3c2cm1cm23c6cm3cm3_weight(1));
    PL_STEP_0_for_cm11cm9cm2c3cm14cm5cm4cm5cm9c12c3cm14c2c39c1c6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm11cm9cm2c3cm14cm5cm4cm5cm9c12c3cm14c2c39c1c6_weight(0), cm11cm9cm2c3cm14cm5cm4cm5cm9c12c3cm14c2c39c1c6_weight(1));
    PL_STEP_0_for_c3cm1cm9c3c4c0cm1cm14cm1cm4c7c6c4cm4cm6c6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3cm1cm9c3c4c0cm1cm14cm1cm4c7c6c4cm4cm6c6_weight(0), c3cm1cm9c3c4c0cm1cm14cm1cm4c7c6c4cm4cm6c6_weight(1));
    PL_STEP_0_for_cm7c1c4c27cm5cm9c31cm1cm2cm7cm3cm2c0c16cm17cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm7c1c4c27cm5cm9c31cm1cm2cm7cm3cm2c0c16cm17cm3_weight(0), cm7c1c4c27cm5cm9c31cm1cm2cm7cm3cm2c0c16cm17cm3_weight(1));
    PL_STEP_0_for_c4c0c1cm6cm1c1c0c2cm4c0c1cm6c17c4c15cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4c0c1cm6cm1c1c0c2cm4c0c1cm6c17c4c15cm3_weight(0), c4c0c1cm6cm1c1c0c2cm4c0c1cm6c17c4c15cm3_weight(1));
    PL_STEP_0_for_cm6c28c2cm1c31c3c0cm1c4c7c24c0cm6cm1cm2c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6c28c2cm1c31c3c0cm1c4c7c24c0cm6cm1cm2c0_weight(0), cm6c28c2cm1c31c3c0cm1c4c7c24c0cm6cm1cm2c0_weight(1));
    PL_STEP_0_for_c1cm3cm1c3cm4cm5c4c8cm16c1cm1c5cm1cm8cm11c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm3cm1c3cm4cm5c4c8cm16c1cm1c5cm1cm8cm11c5_weight(0), c1cm3cm1c3cm4cm5c4c8cm16c1cm1c5cm1cm8cm11c5_weight(1));
    PL_STEP_0_for_c1cm13c3cm6c4cm3cm2c4cm6cm3cm2cm2c4cm2c3c7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm13c3cm6c4cm3cm2c4cm6cm3cm2cm2c4cm2c3c7_weight(0), c1cm13c3cm6c4cm3cm2c4cm6cm3cm2cm2c4cm2c3c7_weight(1));
    PL_STEP_0_for_c4c19c1cm19c1cm1c2c5cm9cm2c4c0c21c11c3cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4c19c1cm19c1cm1c2c5cm9cm2c4c0c21c11c3cm2_weight(0), c4c19c1cm19c1cm1c2c5cm9cm2c4c0c21c11c3cm2_weight(1));
    PL_STEP_0_for_cm10c37c15cm4c0c13c1c6cm2c11cm7c0c9c29c0cm33_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm10c37c15cm4c0c13c1c6cm2c11cm7c0c9c29c0cm33_weight(0), cm10c37c15cm4c0c13c1c6cm2c11cm7c0c9c29c0cm33_weight(1));
    PL_STEP_0_for_cm5cm1c1cm13cm8cm3cm2c3c4c2c11cm4cm43cm5cm2c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5cm1c1cm13cm8cm3cm2c3c4c2c11cm4cm43cm5cm2c4_weight(0), cm5cm1c1cm13cm8cm3cm2c3c4c2c11cm4cm43cm5cm2c4_weight(1));
    PL_STEP_0_for_c3cm6cm3c3c3c3cm1cm4c1cm3cm8c2cm4c18cm20cm31_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3cm6cm3c3c3c3cm1cm4c1cm3cm8c2cm4c18cm20cm31_weight(0), c3cm6cm3c3c3c3cm1cm4c1cm3cm8c2cm4c18cm20cm31_weight(1));
    PL_STEP_0_for_c0cm7c9cm2cm6cm21cm2c6c0cm9c8c8cm26cm19cm2c30_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm7c9cm2cm6cm21cm2c6c0cm9c8c8cm26cm19cm2c30_weight(0), c0cm7c9cm2cm6cm21cm2c6c0cm9c8c8cm26cm19cm2c30_weight(1));
    PL_STEP_0_for_c0cm7cm3c38cm2cm37cm2c0cm8c7c15c4cm2c11c8cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm7cm3c38cm2cm37cm2c0cm8c7c15c4cm2c11c8cm1_weight(0), c0cm7cm3c38cm2cm37cm2c0cm8c7c15c4cm2c11c8cm1_weight(1));
    PL_STEP_0_for_c12cm13cm10cm4c6c4cm9c18cm13cm1c4cm4cm11c1cm7cm12_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c12cm13cm10cm4c6c4cm9c18cm13cm1c4cm4cm11c1cm7cm12_weight(0), c12cm13cm10cm4c6c4cm9c18cm13cm1c4cm4cm11c1cm7cm12_weight(1));
    PL_STEP_0_for_c5c2cm1c0c22cm1c22c7c9cm14cm8c2cm9c20c3c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5c2cm1c0c22cm1c22c7c9cm14cm8c2cm9c20c3c4_weight(0), c5c2cm1c0c22cm1c22c7c9cm14cm8c2cm9c20c3c4_weight(1));
    PL_STEP_0_for_c1cm2cm2c10c6cm2c20c0c3cm6c6cm9cm4cm28cm4c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm2cm2c10c6cm2c20c0c3cm6c6cm9cm4cm28cm4c0_weight(0), c1cm2cm2c10c6cm2c20c0c3cm6c6cm9cm4cm28cm4c0_weight(1));
    PL_STEP_0_for_cm1c3c1cm2cm9c3cm1cm9c6c0c0cm3c30cm2cm14cm6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c3c1cm2cm9c3cm1cm9c6c0c0cm3c30cm2cm14cm6_weight(0), cm1c3c1cm2cm9c3cm1cm9c6c0c0cm3c30cm2cm14cm6_weight(1));
    PL_STEP_0_for_cm25c0cm21c1c5c2c11c3cm11cm9cm4cm1cm14cm25cm1cm6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm25c0cm21c1c5c2c11c3cm11cm9cm4cm1cm14cm25cm1cm6_weight(0), cm25c0cm21c1c5c2c11c3cm11cm9cm4cm1cm14cm25cm1cm6_weight(1));
    PL_STEP_0_for_c1c2c2cm2c3cm2c4cm2c1cm23cm21cm9cm3c7c22c29_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c2c2cm2c3cm2c4cm2c1cm23cm21cm9cm3c7c22c29_weight(0), c1c2c2cm2c3cm2c4cm2c1cm23cm21cm9cm3c7c22c29_weight(1));
    PL_STEP_0_for_c9cm1cm5c2c4c16c5c2c6cm18cm7cm3c34cm1cm32cm9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c9cm1cm5c2c4c16c5c2c6cm18cm7cm3c34cm1cm32cm9_weight(0), c9cm1cm5c2c4c16c5c2c6cm18cm7cm3c34cm1cm32cm9_weight(1));
    PL_STEP_0_for_cm6c7c1cm6c12c3cm9cm6cm5c10c1cm6c5c6c8cm14_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6c7c1cm6c12c3cm9cm6cm5c10c1cm6c5c6c8cm14_weight(0), cm6c7c1cm6c12c3cm9cm6cm5c10c1cm6c5c6c8cm14_weight(1));
    PL_STEP_0_for_c0cm5cm2c2c1c9cm8c6cm3c2cm8c8cm14c5c4c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm5cm2c2c1c9cm8c6cm3c2cm8c8cm14c5c4c2_weight(0), c0cm5cm2c2c1c9cm8c6cm3c2cm8c8cm14c5c4c2_weight(1));
    PL_STEP_0_for_cm4cm5c0c0cm5c0cm3c0c24c5c0cm6c14c17c2c7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4cm5c0c0cm5c0cm3c0c24c5c0cm6c14c17c2c7_weight(0), cm4cm5c0c0cm5c0cm3c0c24c5c0cm6c14c17c2c7_weight(1));
    PL_STEP_0_for_c11c4cm1cm3c8c3c10cm17cm2cm3cm2cm9c5cm10c51cm19_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c11c4cm1cm3c8c3c10cm17cm2cm3cm2cm9c5cm10c51cm19_weight(0), c11c4cm1cm3c8c3c10cm17cm2cm3cm2cm9c5cm10c51cm19_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    c7cm19cm2cm2c1cm4c3cm9c86c7c3c28cm7c7cm4c2_c0cm5cm2c2c1c9cm8c6cm3c2cm8c8cm14c5c4c2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c7cm19cm2cm2c1cm4c3cm9c86c7c3c28cm7c7cm4c2_weight(1)(8-1 downto 0),
			B	=> c0cm5cm2c2c1c9cm8c6cm3c2cm8c8cm14c5c4c2_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c7cm19cm2cm2c1cm4c3cm9c86c7c3c28cm7c7cm4c2,
			CxB => R_c0cm5cm2c2c1c9cm8c6cm3c2cm8c8cm14c5c4c2
		);

    c84c3cm14cm2cm4c5cm9c4cm5c3c12cm4cm11c1c52cm34_cm6c7c1cm6c12c3cm9cm6cm5c10c1cm6c5c6c8cm14_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c84c3cm14cm2cm4c5cm9c4cm5c3c12cm4cm11c1c52cm34_weight(1)(8-1 downto 0),
			B	=> cm6c7c1cm6c12c3cm9cm6cm5c10c1cm6c5c6c8cm14_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c84c3cm14cm2cm4c5cm9c4cm5c3c12cm4cm11c1c52cm34,
			CxB => R_cm6c7c1cm6c12c3cm9cm6cm5c10c1cm6c5c6c8cm14
		);

    cm1cm11cm6cm8cm4cm11cm1c3cm3c4cm12c4cm12c2cm38c6_c1cm13c3cm6c4cm3cm2c4cm6cm3cm2cm2c4cm2c3c7_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm1cm11cm6cm8cm4cm11cm1c3cm3c4cm12c4cm12c2cm38c6_weight(1)(7-1 downto 0),
			B	=> c1cm13c3cm6c4cm3cm2c4cm6cm3cm2cm2c4cm2c3c7_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1cm11cm6cm8cm4cm11cm1c3cm3c4cm12c4cm12c2cm38c6,
			CxB => R_c1cm13c3cm6c4cm3cm2c4cm6cm3cm2cm2c4cm2c3c7
		);

    c9c32c2c8cm9c7c3cm26cm2c0c7cm3cm29cm7cm22cm8_c1cm3cm1c3cm4cm5c4c8cm16c1cm1c5cm1cm8cm11c5_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c9c32c2c8cm9c7c3cm26cm2c0c7cm3cm29cm7cm22cm8_weight(1)(7-1 downto 0),
			B	=> c1cm3cm1c3cm4cm5c4c8cm16c1cm1c5cm1cm8cm11c5_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c9c32c2c8cm9c7c3cm26cm2c0c7cm3cm29cm7cm22cm8,
			CxB => R_c1cm3cm1c3cm4cm5c4c8cm16c1cm1c5cm1cm8cm11c5
		);

    cm11cm9cm2c3cm14cm5cm4cm5cm9c12c3cm14c2c39c1c6_c3cm1cm9c3c4c0cm1cm14cm1cm4c7c6c4cm4cm6c6_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm11cm9cm2c3cm14cm5cm4cm5cm9c12c3cm14c2c39c1c6_weight(1)(7-1 downto 0),
			B	=> c3cm1cm9c3c4c0cm1cm14cm1cm4c7c6c4cm4cm6c6_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm11cm9cm2c3cm14cm5cm4cm5cm9c12c3cm14c2c39c1c6,
			CxB => R_c3cm1cm9c3c4c0cm1cm14cm1cm4c7c6c4cm4cm6c6
		);

    cm10c37c15cm4c0c13c1c6cm2c11cm7c0c9c29c0cm33_c0c4cm1c2cm6cm1c2cm1c2c7c4c8c4c7c3c6_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm10c37c15cm4c0c13c1c6cm2c11cm7c0c9c29c0cm33_weight(1)(7-1 downto 0),
			B	=> c0c4cm1c2cm6cm1c2cm1c2c7c4c8c4c7c3c6_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm10c37c15cm4c0c13c1c6cm2c11cm7c0c9c29c0cm33,
			CxB => R_c0c4cm1c2cm6cm1c2cm1c2c7c4c8c4c7c3c6
		);

    cm5cm1c1cm13cm8cm3cm2c3c4c2c11cm4cm43cm5cm2c4_cm4cm5c0c0cm5c0cm3c0c24c5c0cm6c14c17c2c7_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm5cm1c1cm13cm8cm3cm2c3c4c2c11cm4cm43cm5cm2c4_weight(1)(7-1 downto 0),
			B	=> cm4cm5c0c0cm5c0cm3c0c24c5c0cm6c14c17c2c7_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm5cm1c1cm13cm8cm3cm2c3c4c2c11cm4cm43cm5cm2c4,
			CxB => R_cm4cm5c0c0cm5c0cm3c0c24c5c0cm6c14c17c2c7
		);

    c0cm7cm3c38cm2cm37cm2c0cm8c7c15c4cm2c11c8cm1_c1c2c2cm2c3cm2c4cm2c1cm23cm21cm9cm3c7c22c29_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0cm7cm3c38cm2cm37cm2c0cm8c7c15c4cm2c11c8cm1_weight(1)(7-1 downto 0),
			B	=> c1c2c2cm2c3cm2c4cm2c1cm23cm21cm9cm3c7c22c29_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0cm7cm3c38cm2cm37cm2c0cm8c7c15c4cm2c11c8cm1,
			CxB => R_c1c2c2cm2c3cm2c4cm2c1cm23cm21cm9cm3c7c22c29
		);

    c9cm1cm5c2c4c16c5c2c6cm18cm7cm3c34cm1cm32cm9_cm25c0cm21c1c5c2c11c3cm11cm9cm4cm1cm14cm25cm1cm6_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c9cm1cm5c2c4c16c5c2c6cm18cm7cm3c34cm1cm32cm9_weight(1)(7-1 downto 0),
			B	=> cm25c0cm21c1c5c2c11c3cm11cm9cm4cm1cm14cm25cm1cm6_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c9cm1cm5c2c4c16c5c2c6cm18cm7cm3c34cm1cm32cm9,
			CxB => R_cm25c0cm21c1c5c2c11c3cm11cm9cm4cm1cm14cm25cm1cm6
		);

    c11c4cm1cm3c8c3c10cm17cm2cm3cm2cm9c5cm10c51cm19_cm1c3c1cm2cm9c3cm1cm9c6c0c0cm3c30cm2cm14cm6_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c11c4cm1cm3c8c3c10cm17cm2cm3cm2cm9c5cm10c51cm19_weight(1)(7-1 downto 0),
			B	=> cm1c3c1cm2cm9c3cm1cm9c6c0c0cm3c30cm2cm14cm6_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c11c4cm1cm3c8c3c10cm17cm2cm3cm2cm9c5cm10c51cm19,
			CxB => R_cm1c3c1cm2cm9c3cm1cm9c6c0c0cm3c30cm2cm14cm6
		);

    cm2cm4cm11cm25c0cm4c2cm1cm2c3cm3c11cm6c0cm15c0_c1cm2cm2c10c6cm2c20c0c3cm6c6cm9cm4cm28cm4c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2cm4cm11cm25c0cm4c2cm1cm2c3cm3c11cm6c0cm15c0_weight(1)(6-1 downto 0),
			B	=> c1cm2cm2c10c6cm2c20c0c3cm6c6cm9cm4cm28cm4c0_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2cm4cm11cm25c0cm4c2cm1cm2c3cm3c11cm6c0cm15c0,
			CxB => R_c1cm2cm2c10c6cm2c20c0c3cm6c6cm9cm4cm28cm4c0
		);

    c7c4c0c0c13c4cm2c9c8c1cm1cm4c28c9c0cm12_c5c2cm1c0c22cm1c22c7c9cm14cm8c2cm9c20c3c4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c7c4c0c0c13c4cm2c9c8c1cm1cm4c28c9c0cm12_weight(1)(6-1 downto 0),
			B	=> c5c2cm1c0c22cm1c22c7c9cm14cm8c2cm9c20c3c4_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c7c4c0c0c13c4cm2c9c8c1cm1cm4c28c9c0cm12,
			CxB => R_c5c2cm1c0c22cm1c22c7c9cm14cm8c2cm9c20c3c4
		);

    cm9c6c6cm2c7cm8c2c16cm7c3c2cm1cm23c6cm3cm3_c12cm13cm10cm4c6c4cm9c18cm13cm1c4cm4cm11c1cm7cm12_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm9c6c6cm2c7cm8c2c16cm7c3c2cm1cm23c6cm3cm3_weight(1)(6-1 downto 0),
			B	=> c12cm13cm10cm4c6c4cm9c18cm13cm1c4cm4cm11c1cm7cm12_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm9c6c6cm2c7cm8c2c16cm7c3c2cm1cm23c6cm3cm3,
			CxB => R_c12cm13cm10cm4c6c4cm9c18cm13cm1c4cm4cm11c1cm7cm12
		);

    cm7c1c4c27cm5cm9c31cm1cm2cm7cm3cm2c0c16cm17cm3_c0cm7c9cm2cm6cm21cm2c6c0cm9c8c8cm26cm19cm2c30_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm7c1c4c27cm5cm9c31cm1cm2cm7cm3cm2c0c16cm17cm3_weight(1)(6-1 downto 0),
			B	=> c0cm7c9cm2cm6cm21cm2c6c0cm9c8c8cm26cm19cm2c30_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm7c1c4c27cm5cm9c31cm1cm2cm7cm3cm2c0c16cm17cm3,
			CxB => R_c0cm7c9cm2cm6cm21cm2c6c0cm9c8c8cm26cm19cm2c30
		);

    c4c0c1cm6cm1c1c0c2cm4c0c1cm6c17c4c15cm3_c3cm6cm3c3c3c3cm1cm4c1cm3cm8c2cm4c18cm20cm31_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c4c0c1cm6cm1c1c0c2cm4c0c1cm6c17c4c15cm3_weight(1)(6-1 downto 0),
			B	=> c3cm6cm3c3c3c3cm1cm4c1cm3cm8c2cm4c18cm20cm31_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c4c0c1cm6cm1c1c0c2cm4c0c1cm6c17c4c15cm3,
			CxB => R_c3cm6cm3c3c3c3cm1cm4c1cm3cm8c2cm4c18cm20cm31
		);

    cm6c28c2cm1c31c3c0cm1c4c7c24c0cm6cm1cm2c0_c4c19c1cm19c1cm1c2c5cm9cm2c4c0c21c11c3cm2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm6c28c2cm1c31c3c0cm1c4c7c24c0cm6cm1cm2c0_weight(1)(6-1 downto 0),
			B	=> c4c19c1cm19c1cm1c2c5cm9cm2c4c0c21c11c3cm2_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm6c28c2cm1c31c3c0cm1c4c7c24c0cm6cm1cm2c0,
			CxB => R_c4c19c1cm19c1cm1c2c5cm9cm2c4c0c21c11c3cm2
		);




end architecture;
