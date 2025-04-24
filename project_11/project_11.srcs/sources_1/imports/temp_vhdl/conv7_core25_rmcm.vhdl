library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core25_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        R_cm6c6cm14cm5c10cm1c9c2c1c0c2cm2cm5cm1c10cm3 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_c8cm8cm6c2cm21cm1cm14cm3c0c1c1c2cm6c2cm23c0 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c0cm22c4cm1c10cm9cm3c2c4c2c2c0c59c1cm9cm4 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm19cm4c12cm5cm7cm5c0cm3c15c0cm5cm3c0cm6cm8cm47 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c10c27c0cm2c1c3c6cm8c40cm5c2cm21c4cm7c8cm2 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c7cm13c77c24cm26c1c11cm2cm2c4c5c3cm4cm1cm3c1 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c0cm13c6c19c8cm4cm1cm7c3cm1c1c4cm11c4c0c5 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c39c35cm19cm16c8cm5c3c2cm4cm2cm2cm14c1cm3c3cm7 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm6c6cm13cm8c2cm5c4cm2cm1cm10cm4cm1c2cm4c7cm4 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_cm4cm3c5c8c5cm3c2c7c1c0cm8cm3c1c0c1cm2 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_cm36cm2cm68cm14c4cm2c5c1cm4cm1cm3c0c7cm16c5c2 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c2c0cm1c6c2c1c1cm5cm1c0c6cm2cm7c6c6c1 : out std_logic_vector(11-1 downto 0);   --	sfix(1, -10)
        R_cm15c45cm8cm2cm2c17cm9c0c16c6c0cm1c6c1c37cm3 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c0c3cm9cm4cm1c10c2cm2c11c0cm3c0c8c0c1c2 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_cm19c6c0c1cm3cm2cm6cm3c5c0cm1cm2c5cm3cm7cm5 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c6cm38c5cm3cm24c7c6cm3cm3c19cm3cm31c38cm2c2cm1 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c3c14c1cm32cm1c10cm5c4c18c0cm4c7cm2c3c7c12 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm25c7c1cm13cm1c1c24cm2cm3c0c1c6c3c1c10c1 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm17c7cm21cm5cm3c0c4cm31c3c3c0cm1c14cm15cm4cm42 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c6cm1cm12c4cm17cm5c2cm9c5c7cm2cm2c52cm12c2c63 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c1c5c0cm10cm14c7cm3c1cm1cm74c3c1c6cm2cm3c2 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c6cm9c25c25c7c5c3cm4cm34cm5c7c1c1c7cm17c1 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm17cm9cm15c1c12cm4cm5cm4c11cm2c0c12c0cm47c11cm1 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm15cm16c20cm14cm7cm12c1cm1c70cm6c5c2c9c1c3cm1 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c2cm3cm70cm25cm6c2cm2c1cm28c3cm3c80c7cm3c6cm5 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_cm10cm11cm1c4c0c1cm1c0cm4c1c1c1c1cm1cm1c3 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_c2c3cm3cm3c2cm20cm29cm15cm2c0c2c2c1cm8cm36cm8 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm5cm23c73c8cm7cm11cm17c2c3cm4cm2c3c2c17c11c1 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_cm11cm5c4c22c8c0cm5cm7c18cm3c4c2c3cm1cm4c6 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c8cm7cm6c9c3c0cm16c7cm13cm3cm1cm1cm1cm1c16cm1 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm7cm6cm3cm3cm9c2c0cm26c8c0cm1cm3c2cm6cm1c52 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm5cm24cm3cm29c6c0cm20c3c8c2c1cm2c1c17c28cm7 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(11-1 downto 0)  --	sfix(1, -10)
    );
end conv7_core25_rmcm;

architecture arch of conv7_core25_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6C6CM14CM5C10CM1C9C2C1C0C2CM2CM5CM1C10CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C8CM8CM6C2CM21CM1CM14CM3C0C1C1C2CM6C2CM23C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM22C4CM1C10CM9CM3C2C4C2C2C0C59C1CM9CM4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM19CM4C12CM5CM7CM5C0CM3C15C0CM5CM3C0CM6CM8CM47_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C10C27C0CM2C1C3C6CM8C40CM5C2CM21C4CM7C8CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C7CM13C77C24CM26C1C11CM2CM2C4C5C3CM4CM1CM3C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM13C6C19C8CM4CM1CM7C3CM1C1C4CM11C4C0C5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C39C35CM19CM16C8CM5C3C2CM4CM2CM2CM14C1CM3C3CM7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6C6CM13CM8C2CM5C4CM2CM1CM10CM4CM1C2CM4C7CM4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4CM3C5C8C5CM3C2C7C1C0CM8CM3C1C0C1CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM36CM2CM68CM14C4CM2C5C1CM4CM1CM3C0C7CM16C5C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C0CM1C6C2C1C1CM5CM1C0C6CM2CM7C6C6C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM15C45CM8CM2CM2C17CM9C0C16C6C0CM1C6C1C37CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C3CM9CM4CM1C10C2CM2C11C0CM3C0C8C0C1C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM19C6C0C1CM3CM2CM6CM3C5C0CM1CM2C5CM3CM7CM5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6CM38C5CM3CM24C7C6CM3CM3C19CM3CM31C38CM2C2CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C14C1CM32CM1C10CM5C4C18C0CM4C7CM2C3C7C12_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM25C7C1CM13CM1C1C24CM2CM3C0C1C6C3C1C10C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM17C7CM21CM5CM3C0C4CM31C3C3C0CM1C14CM15CM4CM42_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6CM1CM12C4CM17CM5C2CM9C5C7CM2CM2C52CM12C2C63_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C5C0CM10CM14C7CM3C1CM1CM74C3C1C6CM2CM3C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6CM9C25C25C7C5C3CM4CM34CM5C7C1C1C7CM17C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM17CM9CM15C1C12CM4CM5CM4C11CM2C0C12C0CM47C11CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM15CM16C20CM14CM7CM12C1CM1C70CM6C5C2C9C1C3CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2CM3CM70CM25CM6C2CM2C1CM28C3CM3C80C7CM3C6CM5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM10CM11CM1C4C0C1CM1C0CM4C1C1C1C1CM1CM1C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C3CM3CM3C2CM20CM29CM15CM2C0C2C2C1CM8CM36CM8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5CM23C73C8CM7CM11CM17C2C3CM4CM2C3C2C17C11C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM11CM5C4C22C8C0CM5CM7C18CM3C4C2C3CM1CM4C6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C8CM7CM6C9C3C0CM16C7CM13CM3CM1CM1CM1CM1C16CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM7CM6CM3CM3CM9C2C0CM26C8C0CM1CM3C2CM6CM1C52_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5CM24CM3CM29C6C0CM20C3C8C2C1CM2C1C17C28CM7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(4, -3)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(1, -7)
    signal cm6c6cm14cm5c10cm1c9c2c1c0c2cm2cm5cm1c10cm3_weight : PIPELINE_TYPE_FOR_CM6C6CM14CM5C10CM1C9C2C1C0C2CM2CM5CM1C10CM3_WEIGHT;
    -- sfix(1, -7)
    signal c8cm8cm6c2cm21cm1cm14cm3c0c1c1c2cm6c2cm23c0_weight : PIPELINE_TYPE_FOR_C8CM8CM6C2CM21CM1CM14CM3C0C1C1C2CM6C2CM23C0_WEIGHT;
    -- sfix(1, -7)
    signal c0cm22c4cm1c10cm9cm3c2c4c2c2c0c59c1cm9cm4_weight : PIPELINE_TYPE_FOR_C0CM22C4CM1C10CM9CM3C2C4C2C2C0C59C1CM9CM4_WEIGHT;
    -- sfix(1, -7)
    signal cm19cm4c12cm5cm7cm5c0cm3c15c0cm5cm3c0cm6cm8cm47_weight : PIPELINE_TYPE_FOR_CM19CM4C12CM5CM7CM5C0CM3C15C0CM5CM3C0CM6CM8CM47_WEIGHT;
    -- sfix(1, -7)
    signal c10c27c0cm2c1c3c6cm8c40cm5c2cm21c4cm7c8cm2_weight : PIPELINE_TYPE_FOR_C10C27C0CM2C1C3C6CM8C40CM5C2CM21C4CM7C8CM2_WEIGHT;
    -- sfix(1, -7)
    signal c7cm13c77c24cm26c1c11cm2cm2c4c5c3cm4cm1cm3c1_weight : PIPELINE_TYPE_FOR_C7CM13C77C24CM26C1C11CM2CM2C4C5C3CM4CM1CM3C1_WEIGHT;
    -- sfix(1, -7)
    signal c0cm13c6c19c8cm4cm1cm7c3cm1c1c4cm11c4c0c5_weight : PIPELINE_TYPE_FOR_C0CM13C6C19C8CM4CM1CM7C3CM1C1C4CM11C4C0C5_WEIGHT;
    -- sfix(1, -7)
    signal c39c35cm19cm16c8cm5c3c2cm4cm2cm2cm14c1cm3c3cm7_weight : PIPELINE_TYPE_FOR_C39C35CM19CM16C8CM5C3C2CM4CM2CM2CM14C1CM3C3CM7_WEIGHT;
    -- sfix(1, -7)
    signal cm6c6cm13cm8c2cm5c4cm2cm1cm10cm4cm1c2cm4c7cm4_weight : PIPELINE_TYPE_FOR_CM6C6CM13CM8C2CM5C4CM2CM1CM10CM4CM1C2CM4C7CM4_WEIGHT;
    -- sfix(1, -7)
    signal cm4cm3c5c8c5cm3c2c7c1c0cm8cm3c1c0c1cm2_weight : PIPELINE_TYPE_FOR_CM4CM3C5C8C5CM3C2C7C1C0CM8CM3C1C0C1CM2_WEIGHT;
    -- sfix(1, -7)
    signal cm36cm2cm68cm14c4cm2c5c1cm4cm1cm3c0c7cm16c5c2_weight : PIPELINE_TYPE_FOR_CM36CM2CM68CM14C4CM2C5C1CM4CM1CM3C0C7CM16C5C2_WEIGHT;
    -- sfix(1, -7)
    signal c2c0cm1c6c2c1c1cm5cm1c0c6cm2cm7c6c6c1_weight : PIPELINE_TYPE_FOR_C2C0CM1C6C2C1C1CM5CM1C0C6CM2CM7C6C6C1_WEIGHT;
    -- sfix(1, -7)
    signal cm15c45cm8cm2cm2c17cm9c0c16c6c0cm1c6c1c37cm3_weight : PIPELINE_TYPE_FOR_CM15C45CM8CM2CM2C17CM9C0C16C6C0CM1C6C1C37CM3_WEIGHT;
    -- sfix(1, -7)
    signal c0c3cm9cm4cm1c10c2cm2c11c0cm3c0c8c0c1c2_weight : PIPELINE_TYPE_FOR_C0C3CM9CM4CM1C10C2CM2C11C0CM3C0C8C0C1C2_WEIGHT;
    -- sfix(1, -7)
    signal cm19c6c0c1cm3cm2cm6cm3c5c0cm1cm2c5cm3cm7cm5_weight : PIPELINE_TYPE_FOR_CM19C6C0C1CM3CM2CM6CM3C5C0CM1CM2C5CM3CM7CM5_WEIGHT;
    -- sfix(1, -7)
    signal c6cm38c5cm3cm24c7c6cm3cm3c19cm3cm31c38cm2c2cm1_weight : PIPELINE_TYPE_FOR_C6CM38C5CM3CM24C7C6CM3CM3C19CM3CM31C38CM2C2CM1_WEIGHT;
    -- sfix(1, -7)
    signal c3c14c1cm32cm1c10cm5c4c18c0cm4c7cm2c3c7c12_weight : PIPELINE_TYPE_FOR_C3C14C1CM32CM1C10CM5C4C18C0CM4C7CM2C3C7C12_WEIGHT;
    -- sfix(1, -7)
    signal cm25c7c1cm13cm1c1c24cm2cm3c0c1c6c3c1c10c1_weight : PIPELINE_TYPE_FOR_CM25C7C1CM13CM1C1C24CM2CM3C0C1C6C3C1C10C1_WEIGHT;
    -- sfix(1, -7)
    signal cm17c7cm21cm5cm3c0c4cm31c3c3c0cm1c14cm15cm4cm42_weight : PIPELINE_TYPE_FOR_CM17C7CM21CM5CM3C0C4CM31C3C3C0CM1C14CM15CM4CM42_WEIGHT;
    -- sfix(1, -7)
    signal c6cm1cm12c4cm17cm5c2cm9c5c7cm2cm2c52cm12c2c63_weight : PIPELINE_TYPE_FOR_C6CM1CM12C4CM17CM5C2CM9C5C7CM2CM2C52CM12C2C63_WEIGHT;
    -- sfix(1, -7)
    signal c1c5c0cm10cm14c7cm3c1cm1cm74c3c1c6cm2cm3c2_weight : PIPELINE_TYPE_FOR_C1C5C0CM10CM14C7CM3C1CM1CM74C3C1C6CM2CM3C2_WEIGHT;
    -- sfix(1, -7)
    signal c6cm9c25c25c7c5c3cm4cm34cm5c7c1c1c7cm17c1_weight : PIPELINE_TYPE_FOR_C6CM9C25C25C7C5C3CM4CM34CM5C7C1C1C7CM17C1_WEIGHT;
    -- sfix(1, -7)
    signal cm17cm9cm15c1c12cm4cm5cm4c11cm2c0c12c0cm47c11cm1_weight : PIPELINE_TYPE_FOR_CM17CM9CM15C1C12CM4CM5CM4C11CM2C0C12C0CM47C11CM1_WEIGHT;
    -- sfix(1, -7)
    signal cm15cm16c20cm14cm7cm12c1cm1c70cm6c5c2c9c1c3cm1_weight : PIPELINE_TYPE_FOR_CM15CM16C20CM14CM7CM12C1CM1C70CM6C5C2C9C1C3CM1_WEIGHT;
    -- sfix(1, -7)
    signal c2cm3cm70cm25cm6c2cm2c1cm28c3cm3c80c7cm3c6cm5_weight : PIPELINE_TYPE_FOR_C2CM3CM70CM25CM6C2CM2C1CM28C3CM3C80C7CM3C6CM5_WEIGHT;
    -- sfix(1, -7)
    signal cm10cm11cm1c4c0c1cm1c0cm4c1c1c1c1cm1cm1c3_weight : PIPELINE_TYPE_FOR_CM10CM11CM1C4C0C1CM1C0CM4C1C1C1C1CM1CM1C3_WEIGHT;
    -- sfix(1, -7)
    signal c2c3cm3cm3c2cm20cm29cm15cm2c0c2c2c1cm8cm36cm8_weight : PIPELINE_TYPE_FOR_C2C3CM3CM3C2CM20CM29CM15CM2C0C2C2C1CM8CM36CM8_WEIGHT;
    -- sfix(1, -7)
    signal cm5cm23c73c8cm7cm11cm17c2c3cm4cm2c3c2c17c11c1_weight : PIPELINE_TYPE_FOR_CM5CM23C73C8CM7CM11CM17C2C3CM4CM2C3C2C17C11C1_WEIGHT;
    -- sfix(1, -7)
    signal cm11cm5c4c22c8c0cm5cm7c18cm3c4c2c3cm1cm4c6_weight : PIPELINE_TYPE_FOR_CM11CM5C4C22C8C0CM5CM7C18CM3C4C2C3CM1CM4C6_WEIGHT;
    -- sfix(1, -7)
    signal c8cm7cm6c9c3c0cm16c7cm13cm3cm1cm1cm1cm1c16cm1_weight : PIPELINE_TYPE_FOR_C8CM7CM6C9C3C0CM16C7CM13CM3CM1CM1CM1CM1C16CM1_WEIGHT;
    -- sfix(1, -7)
    signal cm7cm6cm3cm3cm9c2c0cm26c8c0cm1cm3c2cm6cm1c52_weight : PIPELINE_TYPE_FOR_CM7CM6CM3CM3CM9C2C0CM26C8C0CM1CM3C2CM6CM1C52_WEIGHT;
    -- sfix(1, -7)
    signal cm5cm24cm3cm29c6c0cm20c3c8c2c1cm2c1c17c28cm7_weight : PIPELINE_TYPE_FOR_CM5CM24CM3CM29C6C0CM20C3C8C2C1CM2C1C17C28CM7_WEIGHT;
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



    WEIGHT_ROM: entity work.conv7_core25_rmcm_weightsconstant_memory
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
        
            dout1   => cm6c6cm14cm5c10cm1c9c2c1c0c2cm2cm5cm1c10cm3_weight(0), 
            dout2   => c8cm8cm6c2cm21cm1cm14cm3c0c1c1c2cm6c2cm23c0_weight(0), 
            dout3   => c0cm22c4cm1c10cm9cm3c2c4c2c2c0c59c1cm9cm4_weight(0), 
            dout4   => cm19cm4c12cm5cm7cm5c0cm3c15c0cm5cm3c0cm6cm8cm47_weight(0), 
            dout5   => c10c27c0cm2c1c3c6cm8c40cm5c2cm21c4cm7c8cm2_weight(0), 
            dout6   => c7cm13c77c24cm26c1c11cm2cm2c4c5c3cm4cm1cm3c1_weight(0), 
            dout7   => c0cm13c6c19c8cm4cm1cm7c3cm1c1c4cm11c4c0c5_weight(0), 
            dout8   => c39c35cm19cm16c8cm5c3c2cm4cm2cm2cm14c1cm3c3cm7_weight(0), 
            dout9   => cm6c6cm13cm8c2cm5c4cm2cm1cm10cm4cm1c2cm4c7cm4_weight(0), 
            dout10   => cm4cm3c5c8c5cm3c2c7c1c0cm8cm3c1c0c1cm2_weight(0), 
            dout11   => cm36cm2cm68cm14c4cm2c5c1cm4cm1cm3c0c7cm16c5c2_weight(0), 
            dout12   => c2c0cm1c6c2c1c1cm5cm1c0c6cm2cm7c6c6c1_weight(0), 
            dout13   => cm15c45cm8cm2cm2c17cm9c0c16c6c0cm1c6c1c37cm3_weight(0), 
            dout14   => c0c3cm9cm4cm1c10c2cm2c11c0cm3c0c8c0c1c2_weight(0), 
            dout15   => cm19c6c0c1cm3cm2cm6cm3c5c0cm1cm2c5cm3cm7cm5_weight(0), 
            dout16   => c6cm38c5cm3cm24c7c6cm3cm3c19cm3cm31c38cm2c2cm1_weight(0), 
            dout17   => c3c14c1cm32cm1c10cm5c4c18c0cm4c7cm2c3c7c12_weight(0), 
            dout18   => cm25c7c1cm13cm1c1c24cm2cm3c0c1c6c3c1c10c1_weight(0), 
            dout19   => cm17c7cm21cm5cm3c0c4cm31c3c3c0cm1c14cm15cm4cm42_weight(0), 
            dout20   => c6cm1cm12c4cm17cm5c2cm9c5c7cm2cm2c52cm12c2c63_weight(0), 
            dout21   => c1c5c0cm10cm14c7cm3c1cm1cm74c3c1c6cm2cm3c2_weight(0), 
            dout22   => c6cm9c25c25c7c5c3cm4cm34cm5c7c1c1c7cm17c1_weight(0), 
            dout23   => cm17cm9cm15c1c12cm4cm5cm4c11cm2c0c12c0cm47c11cm1_weight(0), 
            dout24   => cm15cm16c20cm14cm7cm12c1cm1c70cm6c5c2c9c1c3cm1_weight(0), 
            dout25   => c2cm3cm70cm25cm6c2cm2c1cm28c3cm3c80c7cm3c6cm5_weight(0), 
            dout26   => cm10cm11cm1c4c0c1cm1c0cm4c1c1c1c1cm1cm1c3_weight(0), 
            dout27   => c2c3cm3cm3c2cm20cm29cm15cm2c0c2c2c1cm8cm36cm8_weight(0), 
            dout28   => cm5cm23c73c8cm7cm11cm17c2c3cm4cm2c3c2c17c11c1_weight(0), 
            dout29   => cm11cm5c4c22c8c0cm5cm7c18cm3c4c2c3cm1cm4c6_weight(0), 
            dout30   => c8cm7cm6c9c3c0cm16c7cm13cm3cm1cm1cm1cm1c16cm1_weight(0), 
            dout31   => cm7cm6cm3cm3cm9c2c0cm26c8c0cm1cm3c2cm6cm1c52_weight(0), 
            dout32   => cm5cm24cm3cm29c6c0cm20c3c8c2c1cm2c1c17c28cm7_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_cm6c6cm14cm5c10cm1c9c2c1c0c2cm2cm5cm1c10cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6c6cm14cm5c10cm1c9c2c1c0c2cm2cm5cm1c10cm3_weight(0), cm6c6cm14cm5c10cm1c9c2c1c0c2cm2cm5cm1c10cm3_weight(1));
    PL_STEP_0_for_c8cm8cm6c2cm21cm1cm14cm3c0c1c1c2cm6c2cm23c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c8cm8cm6c2cm21cm1cm14cm3c0c1c1c2cm6c2cm23c0_weight(0), c8cm8cm6c2cm21cm1cm14cm3c0c1c1c2cm6c2cm23c0_weight(1));
    PL_STEP_0_for_c0cm22c4cm1c10cm9cm3c2c4c2c2c0c59c1cm9cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm22c4cm1c10cm9cm3c2c4c2c2c0c59c1cm9cm4_weight(0), c0cm22c4cm1c10cm9cm3c2c4c2c2c0c59c1cm9cm4_weight(1));
    PL_STEP_0_for_cm19cm4c12cm5cm7cm5c0cm3c15c0cm5cm3c0cm6cm8cm47_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm19cm4c12cm5cm7cm5c0cm3c15c0cm5cm3c0cm6cm8cm47_weight(0), cm19cm4c12cm5cm7cm5c0cm3c15c0cm5cm3c0cm6cm8cm47_weight(1));
    PL_STEP_0_for_c10c27c0cm2c1c3c6cm8c40cm5c2cm21c4cm7c8cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c10c27c0cm2c1c3c6cm8c40cm5c2cm21c4cm7c8cm2_weight(0), c10c27c0cm2c1c3c6cm8c40cm5c2cm21c4cm7c8cm2_weight(1));
    PL_STEP_0_for_c7cm13c77c24cm26c1c11cm2cm2c4c5c3cm4cm1cm3c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c7cm13c77c24cm26c1c11cm2cm2c4c5c3cm4cm1cm3c1_weight(0), c7cm13c77c24cm26c1c11cm2cm2c4c5c3cm4cm1cm3c1_weight(1));
    PL_STEP_0_for_c0cm13c6c19c8cm4cm1cm7c3cm1c1c4cm11c4c0c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm13c6c19c8cm4cm1cm7c3cm1c1c4cm11c4c0c5_weight(0), c0cm13c6c19c8cm4cm1cm7c3cm1c1c4cm11c4c0c5_weight(1));
    PL_STEP_0_for_c39c35cm19cm16c8cm5c3c2cm4cm2cm2cm14c1cm3c3cm7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c39c35cm19cm16c8cm5c3c2cm4cm2cm2cm14c1cm3c3cm7_weight(0), c39c35cm19cm16c8cm5c3c2cm4cm2cm2cm14c1cm3c3cm7_weight(1));
    PL_STEP_0_for_cm6c6cm13cm8c2cm5c4cm2cm1cm10cm4cm1c2cm4c7cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6c6cm13cm8c2cm5c4cm2cm1cm10cm4cm1c2cm4c7cm4_weight(0), cm6c6cm13cm8c2cm5c4cm2cm1cm10cm4cm1c2cm4c7cm4_weight(1));
    PL_STEP_0_for_cm4cm3c5c8c5cm3c2c7c1c0cm8cm3c1c0c1cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4cm3c5c8c5cm3c2c7c1c0cm8cm3c1c0c1cm2_weight(0), cm4cm3c5c8c5cm3c2c7c1c0cm8cm3c1c0c1cm2_weight(1));
    PL_STEP_0_for_cm36cm2cm68cm14c4cm2c5c1cm4cm1cm3c0c7cm16c5c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm36cm2cm68cm14c4cm2c5c1cm4cm1cm3c0c7cm16c5c2_weight(0), cm36cm2cm68cm14c4cm2c5c1cm4cm1cm3c0c7cm16c5c2_weight(1));
    PL_STEP_0_for_c2c0cm1c6c2c1c1cm5cm1c0c6cm2cm7c6c6c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c0cm1c6c2c1c1cm5cm1c0c6cm2cm7c6c6c1_weight(0), c2c0cm1c6c2c1c1cm5cm1c0c6cm2cm7c6c6c1_weight(1));
    PL_STEP_0_for_cm15c45cm8cm2cm2c17cm9c0c16c6c0cm1c6c1c37cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm15c45cm8cm2cm2c17cm9c0c16c6c0cm1c6c1c37cm3_weight(0), cm15c45cm8cm2cm2c17cm9c0c16c6c0cm1c6c1c37cm3_weight(1));
    PL_STEP_0_for_c0c3cm9cm4cm1c10c2cm2c11c0cm3c0c8c0c1c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c3cm9cm4cm1c10c2cm2c11c0cm3c0c8c0c1c2_weight(0), c0c3cm9cm4cm1c10c2cm2c11c0cm3c0c8c0c1c2_weight(1));
    PL_STEP_0_for_cm19c6c0c1cm3cm2cm6cm3c5c0cm1cm2c5cm3cm7cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm19c6c0c1cm3cm2cm6cm3c5c0cm1cm2c5cm3cm7cm5_weight(0), cm19c6c0c1cm3cm2cm6cm3c5c0cm1cm2c5cm3cm7cm5_weight(1));
    PL_STEP_0_for_c6cm38c5cm3cm24c7c6cm3cm3c19cm3cm31c38cm2c2cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6cm38c5cm3cm24c7c6cm3cm3c19cm3cm31c38cm2c2cm1_weight(0), c6cm38c5cm3cm24c7c6cm3cm3c19cm3cm31c38cm2c2cm1_weight(1));
    PL_STEP_0_for_c3c14c1cm32cm1c10cm5c4c18c0cm4c7cm2c3c7c12_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c14c1cm32cm1c10cm5c4c18c0cm4c7cm2c3c7c12_weight(0), c3c14c1cm32cm1c10cm5c4c18c0cm4c7cm2c3c7c12_weight(1));
    PL_STEP_0_for_cm25c7c1cm13cm1c1c24cm2cm3c0c1c6c3c1c10c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm25c7c1cm13cm1c1c24cm2cm3c0c1c6c3c1c10c1_weight(0), cm25c7c1cm13cm1c1c24cm2cm3c0c1c6c3c1c10c1_weight(1));
    PL_STEP_0_for_cm17c7cm21cm5cm3c0c4cm31c3c3c0cm1c14cm15cm4cm42_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm17c7cm21cm5cm3c0c4cm31c3c3c0cm1c14cm15cm4cm42_weight(0), cm17c7cm21cm5cm3c0c4cm31c3c3c0cm1c14cm15cm4cm42_weight(1));
    PL_STEP_0_for_c6cm1cm12c4cm17cm5c2cm9c5c7cm2cm2c52cm12c2c63_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6cm1cm12c4cm17cm5c2cm9c5c7cm2cm2c52cm12c2c63_weight(0), c6cm1cm12c4cm17cm5c2cm9c5c7cm2cm2c52cm12c2c63_weight(1));
    PL_STEP_0_for_c1c5c0cm10cm14c7cm3c1cm1cm74c3c1c6cm2cm3c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c5c0cm10cm14c7cm3c1cm1cm74c3c1c6cm2cm3c2_weight(0), c1c5c0cm10cm14c7cm3c1cm1cm74c3c1c6cm2cm3c2_weight(1));
    PL_STEP_0_for_c6cm9c25c25c7c5c3cm4cm34cm5c7c1c1c7cm17c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6cm9c25c25c7c5c3cm4cm34cm5c7c1c1c7cm17c1_weight(0), c6cm9c25c25c7c5c3cm4cm34cm5c7c1c1c7cm17c1_weight(1));
    PL_STEP_0_for_cm17cm9cm15c1c12cm4cm5cm4c11cm2c0c12c0cm47c11cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm17cm9cm15c1c12cm4cm5cm4c11cm2c0c12c0cm47c11cm1_weight(0), cm17cm9cm15c1c12cm4cm5cm4c11cm2c0c12c0cm47c11cm1_weight(1));
    PL_STEP_0_for_cm15cm16c20cm14cm7cm12c1cm1c70cm6c5c2c9c1c3cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm15cm16c20cm14cm7cm12c1cm1c70cm6c5c2c9c1c3cm1_weight(0), cm15cm16c20cm14cm7cm12c1cm1c70cm6c5c2c9c1c3cm1_weight(1));
    PL_STEP_0_for_c2cm3cm70cm25cm6c2cm2c1cm28c3cm3c80c7cm3c6cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2cm3cm70cm25cm6c2cm2c1cm28c3cm3c80c7cm3c6cm5_weight(0), c2cm3cm70cm25cm6c2cm2c1cm28c3cm3c80c7cm3c6cm5_weight(1));
    PL_STEP_0_for_cm10cm11cm1c4c0c1cm1c0cm4c1c1c1c1cm1cm1c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm10cm11cm1c4c0c1cm1c0cm4c1c1c1c1cm1cm1c3_weight(0), cm10cm11cm1c4c0c1cm1c0cm4c1c1c1c1cm1cm1c3_weight(1));
    PL_STEP_0_for_c2c3cm3cm3c2cm20cm29cm15cm2c0c2c2c1cm8cm36cm8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c3cm3cm3c2cm20cm29cm15cm2c0c2c2c1cm8cm36cm8_weight(0), c2c3cm3cm3c2cm20cm29cm15cm2c0c2c2c1cm8cm36cm8_weight(1));
    PL_STEP_0_for_cm5cm23c73c8cm7cm11cm17c2c3cm4cm2c3c2c17c11c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5cm23c73c8cm7cm11cm17c2c3cm4cm2c3c2c17c11c1_weight(0), cm5cm23c73c8cm7cm11cm17c2c3cm4cm2c3c2c17c11c1_weight(1));
    PL_STEP_0_for_cm11cm5c4c22c8c0cm5cm7c18cm3c4c2c3cm1cm4c6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm11cm5c4c22c8c0cm5cm7c18cm3c4c2c3cm1cm4c6_weight(0), cm11cm5c4c22c8c0cm5cm7c18cm3c4c2c3cm1cm4c6_weight(1));
    PL_STEP_0_for_c8cm7cm6c9c3c0cm16c7cm13cm3cm1cm1cm1cm1c16cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c8cm7cm6c9c3c0cm16c7cm13cm3cm1cm1cm1cm1c16cm1_weight(0), c8cm7cm6c9c3c0cm16c7cm13cm3cm1cm1cm1cm1c16cm1_weight(1));
    PL_STEP_0_for_cm7cm6cm3cm3cm9c2c0cm26c8c0cm1cm3c2cm6cm1c52_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm7cm6cm3cm3cm9c2c0cm26c8c0cm1cm3c2cm6cm1c52_weight(0), cm7cm6cm3cm3cm9c2c0cm26c8c0cm1cm3c2cm6cm1c52_weight(1));
    PL_STEP_0_for_cm5cm24cm3cm29c6c0cm20c3c8c2c1cm2c1c17c28cm7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5cm24cm3cm29c6c0cm20c3c8c2c1cm2c1c17c28cm7_weight(0), cm5cm24cm3cm29c6c0cm20c3c8c2c1cm2c1c17c28cm7_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    c7cm13c77c24cm26c1c11cm2cm2c4c5c3cm4cm1cm3c1_c2c0cm1c6c2c1c1cm5cm1c0c6cm2cm7c6c6c1_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 8,
			B_WIDTH => 4,
			C_WIDTH => 7, --	ufix(4, -3)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c7cm13c77c24cm26c1c11cm2cm2c4c5c3cm4cm1cm3c1_weight(1)(8-1 downto 0),
			B	=> c2c0cm1c6c2c1c1cm5cm1c0c6cm2cm7c6c6c1_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c7cm13c77c24cm26c1c11cm2cm2c4c5c3cm4cm1cm3c1,
			CxB => R_c2c0cm1c6c2c1c1cm5cm1c0c6cm2cm7c6c6c1
		);

    cm36cm2cm68cm14c4cm2c5c1cm4cm1cm3c0c7cm16c5c2_cm10cm11cm1c4c0c1cm1c0cm4c1c1c1c1cm1cm1c3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm36cm2cm68cm14c4cm2c5c1cm4cm1cm3c0c7cm16c5c2_weight(1)(8-1 downto 0),
			B	=> cm10cm11cm1c4c0c1cm1c0cm4c1c1c1c1cm1cm1c3_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm36cm2cm68cm14c4cm2c5c1cm4cm1cm3c0c7cm16c5c2,
			CxB => R_cm10cm11cm1c4c0c1cm1c0cm4c1c1c1c1cm1cm1c3
		);

    c1c5c0cm10cm14c7cm3c1cm1cm74c3c1c6cm2cm3c2_c0c3cm9cm4cm1c10c2cm2c11c0cm3c0c8c0c1c2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c1c5c0cm10cm14c7cm3c1cm1cm74c3c1c6cm2cm3c2_weight(1)(8-1 downto 0),
			B	=> c0c3cm9cm4cm1c10c2cm2c11c0cm3c0c8c0c1c2_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1c5c0cm10cm14c7cm3c1cm1cm74c3c1c6cm2cm3c2,
			CxB => R_c0c3cm9cm4cm1c10c2cm2c11c0cm3c0c8c0c1c2
		);

    cm15cm16c20cm14cm7cm12c1cm1c70cm6c5c2c9c1c3cm1_cm4cm3c5c8c5cm3c2c7c1c0cm8cm3c1c0c1cm2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm15cm16c20cm14cm7cm12c1cm1c70cm6c5c2c9c1c3cm1_weight(1)(8-1 downto 0),
			B	=> cm4cm3c5c8c5cm3c2c7c1c0cm8cm3c1c0c1cm2_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm15cm16c20cm14cm7cm12c1cm1c70cm6c5c2c9c1c3cm1,
			CxB => R_cm4cm3c5c8c5cm3c2c7c1c0cm8cm3c1c0c1cm2
		);

    c2cm3cm70cm25cm6c2cm2c1cm28c3cm3c80c7cm3c6cm5_cm6c6cm13cm8c2cm5c4cm2cm1cm10cm4cm1c2cm4c7cm4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c2cm3cm70cm25cm6c2cm2c1cm28c3cm3c80c7cm3c6cm5_weight(1)(8-1 downto 0),
			B	=> cm6c6cm13cm8c2cm5c4cm2cm1cm10cm4cm1c2cm4c7cm4_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c2cm3cm70cm25cm6c2cm2c1cm28c3cm3c80c7cm3c6cm5,
			CxB => R_cm6c6cm13cm8c2cm5c4cm2cm1cm10cm4cm1c2cm4c7cm4
		);

    cm5cm23c73c8cm7cm11cm17c2c3cm4cm2c3c2c17c11c1_cm6c6cm14cm5c10cm1c9c2c1c0c2cm2cm5cm1c10cm3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm5cm23c73c8cm7cm11cm17c2c3cm4cm2c3c2c17c11c1_weight(1)(8-1 downto 0),
			B	=> cm6c6cm14cm5c10cm1c9c2c1c0c2cm2cm5cm1c10cm3_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm5cm23c73c8cm7cm11cm17c2c3cm4cm2c3c2c17c11c1,
			CxB => R_cm6c6cm14cm5c10cm1c9c2c1c0c2cm2cm5cm1c10cm3
		);

    c0cm22c4cm1c10cm9cm3c2c4c2c2c0c59c1cm9cm4_cm5cm24cm3cm29c6c0cm20c3c8c2c1cm2c1c17c28cm7_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0cm22c4cm1c10cm9cm3c2c4c2c2c0c59c1cm9cm4_weight(1)(7-1 downto 0),
			B	=> cm5cm24cm3cm29c6c0cm20c3c8c2c1cm2c1c17c28cm7_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0cm22c4cm1c10cm9cm3c2c4c2c2c0c59c1cm9cm4,
			CxB => R_cm5cm24cm3cm29c6c0cm20c3c8c2c1cm2c1c17c28cm7
		);

    cm19cm4c12cm5cm7cm5c0cm3c15c0cm5cm3c0cm6cm8cm47_c8cm7cm6c9c3c0cm16c7cm13cm3cm1cm1cm1cm1c16cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm19cm4c12cm5cm7cm5c0cm3c15c0cm5cm3c0cm6cm8cm47_weight(1)(7-1 downto 0),
			B	=> c8cm7cm6c9c3c0cm16c7cm13cm3cm1cm1cm1cm1c16cm1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm19cm4c12cm5cm7cm5c0cm3c15c0cm5cm3c0cm6cm8cm47,
			CxB => R_c8cm7cm6c9c3c0cm16c7cm13cm3cm1cm1cm1cm1c16cm1
		);

    c10c27c0cm2c1c3c6cm8c40cm5c2cm21c4cm7c8cm2_cm11cm5c4c22c8c0cm5cm7c18cm3c4c2c3cm1cm4c6_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c10c27c0cm2c1c3c6cm8c40cm5c2cm21c4cm7c8cm2_weight(1)(7-1 downto 0),
			B	=> cm11cm5c4c22c8c0cm5cm7c18cm3c4c2c3cm1cm4c6_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c10c27c0cm2c1c3c6cm8c40cm5c2cm21c4cm7c8cm2,
			CxB => R_cm11cm5c4c22c8c0cm5cm7c18cm3c4c2c3cm1cm4c6
		);

    c39c35cm19cm16c8cm5c3c2cm4cm2cm2cm14c1cm3c3cm7_cm25c7c1cm13cm1c1c24cm2cm3c0c1c6c3c1c10c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c39c35cm19cm16c8cm5c3c2cm4cm2cm2cm14c1cm3c3cm7_weight(1)(7-1 downto 0),
			B	=> cm25c7c1cm13cm1c1c24cm2cm3c0c1c6c3c1c10c1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c39c35cm19cm16c8cm5c3c2cm4cm2cm2cm14c1cm3c3cm7,
			CxB => R_cm25c7c1cm13cm1c1c24cm2cm3c0c1c6c3c1c10c1
		);

    cm15c45cm8cm2cm2c17cm9c0c16c6c0cm1c6c1c37cm3_c3c14c1cm32cm1c10cm5c4c18c0cm4c7cm2c3c7c12_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm15c45cm8cm2cm2c17cm9c0c16c6c0cm1c6c1c37cm3_weight(1)(7-1 downto 0),
			B	=> c3c14c1cm32cm1c10cm5c4c18c0cm4c7cm2c3c7c12_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm15c45cm8cm2cm2c17cm9c0c16c6c0cm1c6c1c37cm3,
			CxB => R_c3c14c1cm32cm1c10cm5c4c18c0cm4c7cm2c3c7c12
		);

    c6cm38c5cm3cm24c7c6cm3cm3c19cm3cm31c38cm2c2cm1_cm19c6c0c1cm3cm2cm6cm3c5c0cm1cm2c5cm3cm7cm5_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c6cm38c5cm3cm24c7c6cm3cm3c19cm3cm31c38cm2c2cm1_weight(1)(7-1 downto 0),
			B	=> cm19c6c0c1cm3cm2cm6cm3c5c0cm1cm2c5cm3cm7cm5_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c6cm38c5cm3cm24c7c6cm3cm3c19cm3cm31c38cm2c2cm1,
			CxB => R_cm19c6c0c1cm3cm2cm6cm3c5c0cm1cm2c5cm3cm7cm5
		);

    cm17c7cm21cm5cm3c0c4cm31c3c3c0cm1c14cm15cm4cm42_c0cm13c6c19c8cm4cm1cm7c3cm1c1c4cm11c4c0c5_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm17c7cm21cm5cm3c0c4cm31c3c3c0cm1c14cm15cm4cm42_weight(1)(7-1 downto 0),
			B	=> c0cm13c6c19c8cm4cm1cm7c3cm1c1c4cm11c4c0c5_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm17c7cm21cm5cm3c0c4cm31c3c3c0cm1c14cm15cm4cm42,
			CxB => R_c0cm13c6c19c8cm4cm1cm7c3cm1c1c4cm11c4c0c5
		);

    c6cm1cm12c4cm17cm5c2cm9c5c7cm2cm2c52cm12c2c63_c8cm8cm6c2cm21cm1cm14cm3c0c1c1c2cm6c2cm23c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c6cm1cm12c4cm17cm5c2cm9c5c7cm2cm2c52cm12c2c63_weight(1)(7-1 downto 0),
			B	=> c8cm8cm6c2cm21cm1cm14cm3c0c1c1c2cm6c2cm23c0_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c6cm1cm12c4cm17cm5c2cm9c5c7cm2cm2c52cm12c2c63,
			CxB => R_c8cm8cm6c2cm21cm1cm14cm3c0c1c1c2cm6c2cm23c0
		);

    c6cm9c25c25c7c5c3cm4cm34cm5c7c1c1c7cm17c1_cm7cm6cm3cm3cm9c2c0cm26c8c0cm1cm3c2cm6cm1c52_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c6cm9c25c25c7c5c3cm4cm34cm5c7c1c1c7cm17c1_weight(1)(7-1 downto 0),
			B	=> cm7cm6cm3cm3cm9c2c0cm26c8c0cm1cm3c2cm6cm1c52_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c6cm9c25c25c7c5c3cm4cm34cm5c7c1c1c7cm17c1,
			CxB => R_cm7cm6cm3cm3cm9c2c0cm26c8c0cm1cm3c2cm6cm1c52
		);

    cm17cm9cm15c1c12cm4cm5cm4c11cm2c0c12c0cm47c11cm1_c2c3cm3cm3c2cm20cm29cm15cm2c0c2c2c1cm8cm36cm8_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm17cm9cm15c1c12cm4cm5cm4c11cm2c0c12c0cm47c11cm1_weight(1)(7-1 downto 0),
			B	=> c2c3cm3cm3c2cm20cm29cm15cm2c0c2c2c1cm8cm36cm8_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm17cm9cm15c1c12cm4cm5cm4c11cm2c0c12c0cm47c11cm1,
			CxB => R_c2c3cm3cm3c2cm20cm29cm15cm2c0c2c2c1cm8cm36cm8
		);




end architecture;
