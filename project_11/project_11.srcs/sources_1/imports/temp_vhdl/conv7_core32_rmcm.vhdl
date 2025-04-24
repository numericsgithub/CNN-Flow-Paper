library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core32_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        R_cm6c8c2c5c11cm3cm11cm1cm4cm5cm5c4c3c11c2c4 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_c19cm3cm51c1c0c14cm17c2cm11c6c41cm6c0c21c6c1 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c127c2c8cm24c13cm3c1cm2c8cm1c6cm11c4c26cm7cm4 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c4cm1cm3c2c0cm5cm40cm11c5c1cm3cm8cm17cm1c34cm7 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c2c0c11c6cm14cm2c14cm12c31c2cm43cm1cm19c3c6c1 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm7c0c3c10cm2c3cm26cm15c11cm3c3cm4c1c1c4c4 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm11c3c2cm4cm12cm9c2cm13cm54cm1cm2c12cm73c9cm1c77 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c3c6cm1c1c18c4c25cm27cm8cm8c8cm1cm8cm19c16cm25 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c3c9c7cm2cm5c25c7c6cm9cm3c14c8c1c53c4c3 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c10cm4cm2c7cm4c1cm4c18c9c3c3cm4cm2cm7cm1cm20 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c7cm5cm2cm2cm14c30cm4cm2cm8cm18cm4cm7cm6c5cm20cm6 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c9cm7c0cm3c0c5c0c5cm24c1c19c9cm3c1cm32cm5 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c0c2c39cm3c27c5c6cm1c1cm16cm3c1cm9cm15c0c2 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm12c15c2c2c10cm6cm4c7c3c7c8cm7c95c4c0c0 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c0c6c6c1c4c17cm17c12c1cm4cm2cm3c8cm23cm36cm13 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c10c3cm13c3cm9c9cm4c8cm5cm16cm1cm10c0cm16cm7cm17 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c1c1c1cm5c7c22c5c12cm10cm5c7cm2c0c2cm5c7 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c2cm1c5cm2cm27c1c1c1c9c0c16cm3cm4c0c1c3 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm7cm10c6cm93cm4cm4cm6cm16c37cm27cm3c4c6cm91cm3cm13 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_cm8c10cm1cm10c51c1cm2cm7c1c21c3cm6cm8c2cm2cm1 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm4cm4c8cm3c6cm5c3c9c16c1cm9cm5cm1c1c6cm10 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c3cm2c0c0c15cm7cm15cm17cm2c0c8c7cm1c1cm36c18 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm10cm58c0c2c8cm2c7c2c14c2c2cm1cm14cm8c3cm2 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c0c10cm1c0cm8cm10c3c2cm7c2c0cm6c1cm2c7cm4 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_cm6c13cm2c3c31c7c6c4cm10cm5cm6c3c19c6cm56cm6 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c3c4c2c2c3cm18c7cm3c2cm8c0cm4cm9c1cm1cm1 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm2cm37cm29cm2cm5cm6cm14c9c1c0c1cm14cm63cm4c0cm6 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm10c1c13cm8c15c14cm4cm3cm5cm8cm1cm11c7cm7c17c13 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c0cm1c6cm2cm10c24c1c0c8c0cm2c12c15c2c5c6 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm12cm1cm6c1cm12c3cm6cm1c16cm23cm5c2cm5cm50cm4c0 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c37c4c2cm28c20cm8c3c11cm3c3c0cm20cm6cm49c4cm18 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm4cm5c13cm5cm1cm3cm32c4c2cm9c18c27cm1cm7cm3cm23 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(11-1 downto 0)  --	sfix(1, -10)
    );
end conv7_core32_rmcm;

architecture arch of conv7_core32_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6C8C2C5C11CM3CM11CM1CM4CM5CM5C4C3C11C2C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C19CM3CM51C1C0C14CM17C2CM11C6C41CM6C0C21C6C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C127C2C8CM24C13CM3C1CM2C8CM1C6CM11C4C26CM7CM4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4CM1CM3C2C0CM5CM40CM11C5C1CM3CM8CM17CM1C34CM7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C0C11C6CM14CM2C14CM12C31C2CM43CM1CM19C3C6C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM7C0C3C10CM2C3CM26CM15C11CM3C3CM4C1C1C4C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM11C3C2CM4CM12CM9C2CM13CM54CM1CM2C12CM73C9CM1C77_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C6CM1C1C18C4C25CM27CM8CM8C8CM1CM8CM19C16CM25_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C9C7CM2CM5C25C7C6CM9CM3C14C8C1C53C4C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C10CM4CM2C7CM4C1CM4C18C9C3C3CM4CM2CM7CM1CM20_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C7CM5CM2CM2CM14C30CM4CM2CM8CM18CM4CM7CM6C5CM20CM6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C9CM7C0CM3C0C5C0C5CM24C1C19C9CM3C1CM32CM5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C2C39CM3C27C5C6CM1C1CM16CM3C1CM9CM15C0C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM12C15C2C2C10CM6CM4C7C3C7C8CM7C95C4C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C6C6C1C4C17CM17C12C1CM4CM2CM3C8CM23CM36CM13_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C10C3CM13C3CM9C9CM4C8CM5CM16CM1CM10C0CM16CM7CM17_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C1C1CM5C7C22C5C12CM10CM5C7CM2C0C2CM5C7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2CM1C5CM2CM27C1C1C1C9C0C16CM3CM4C0C1C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM7CM10C6CM93CM4CM4CM6CM16C37CM27CM3C4C6CM91CM3CM13_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM8C10CM1CM10C51C1CM2CM7C1C21C3CM6CM8C2CM2CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4CM4C8CM3C6CM5C3C9C16C1CM9CM5CM1C1C6CM10_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3CM2C0C0C15CM7CM15CM17CM2C0C8C7CM1C1CM36C18_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM10CM58C0C2C8CM2C7C2C14C2C2CM1CM14CM8C3CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C10CM1C0CM8CM10C3C2CM7C2C0CM6C1CM2C7CM4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6C13CM2C3C31C7C6C4CM10CM5CM6C3C19C6CM56CM6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C4C2C2C3CM18C7CM3C2CM8C0CM4CM9C1CM1CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM37CM29CM2CM5CM6CM14C9C1C0C1CM14CM63CM4C0CM6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM10C1C13CM8C15C14CM4CM3CM5CM8CM1CM11C7CM7C17C13_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM1C6CM2CM10C24C1C0C8C0CM2C12C15C2C5C6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM12CM1CM6C1CM12C3CM6CM1C16CM23CM5C2CM5CM50CM4C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C37C4C2CM28C20CM8C3C11CM3C3C0CM20CM6CM49C4CM18_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4CM5C13CM5CM1CM3CM32C4C2CM9C18C27CM1CM7CM3CM23_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(4, -3)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(1, -7)
    signal cm6c8c2c5c11cm3cm11cm1cm4cm5cm5c4c3c11c2c4_weight : PIPELINE_TYPE_FOR_CM6C8C2C5C11CM3CM11CM1CM4CM5CM5C4C3C11C2C4_WEIGHT;
    -- sfix(1, -7)
    signal c19cm3cm51c1c0c14cm17c2cm11c6c41cm6c0c21c6c1_weight : PIPELINE_TYPE_FOR_C19CM3CM51C1C0C14CM17C2CM11C6C41CM6C0C21C6C1_WEIGHT;
    -- sfix(1, -7)
    signal c127c2c8cm24c13cm3c1cm2c8cm1c6cm11c4c26cm7cm4_weight : PIPELINE_TYPE_FOR_C127C2C8CM24C13CM3C1CM2C8CM1C6CM11C4C26CM7CM4_WEIGHT;
    -- sfix(1, -7)
    signal c4cm1cm3c2c0cm5cm40cm11c5c1cm3cm8cm17cm1c34cm7_weight : PIPELINE_TYPE_FOR_C4CM1CM3C2C0CM5CM40CM11C5C1CM3CM8CM17CM1C34CM7_WEIGHT;
    -- sfix(1, -7)
    signal c2c0c11c6cm14cm2c14cm12c31c2cm43cm1cm19c3c6c1_weight : PIPELINE_TYPE_FOR_C2C0C11C6CM14CM2C14CM12C31C2CM43CM1CM19C3C6C1_WEIGHT;
    -- sfix(1, -7)
    signal cm7c0c3c10cm2c3cm26cm15c11cm3c3cm4c1c1c4c4_weight : PIPELINE_TYPE_FOR_CM7C0C3C10CM2C3CM26CM15C11CM3C3CM4C1C1C4C4_WEIGHT;
    -- sfix(1, -7)
    signal cm11c3c2cm4cm12cm9c2cm13cm54cm1cm2c12cm73c9cm1c77_weight : PIPELINE_TYPE_FOR_CM11C3C2CM4CM12CM9C2CM13CM54CM1CM2C12CM73C9CM1C77_WEIGHT;
    -- sfix(1, -7)
    signal c3c6cm1c1c18c4c25cm27cm8cm8c8cm1cm8cm19c16cm25_weight : PIPELINE_TYPE_FOR_C3C6CM1C1C18C4C25CM27CM8CM8C8CM1CM8CM19C16CM25_WEIGHT;
    -- sfix(1, -7)
    signal c3c9c7cm2cm5c25c7c6cm9cm3c14c8c1c53c4c3_weight : PIPELINE_TYPE_FOR_C3C9C7CM2CM5C25C7C6CM9CM3C14C8C1C53C4C3_WEIGHT;
    -- sfix(1, -7)
    signal c10cm4cm2c7cm4c1cm4c18c9c3c3cm4cm2cm7cm1cm20_weight : PIPELINE_TYPE_FOR_C10CM4CM2C7CM4C1CM4C18C9C3C3CM4CM2CM7CM1CM20_WEIGHT;
    -- sfix(1, -7)
    signal c7cm5cm2cm2cm14c30cm4cm2cm8cm18cm4cm7cm6c5cm20cm6_weight : PIPELINE_TYPE_FOR_C7CM5CM2CM2CM14C30CM4CM2CM8CM18CM4CM7CM6C5CM20CM6_WEIGHT;
    -- sfix(1, -7)
    signal c9cm7c0cm3c0c5c0c5cm24c1c19c9cm3c1cm32cm5_weight : PIPELINE_TYPE_FOR_C9CM7C0CM3C0C5C0C5CM24C1C19C9CM3C1CM32CM5_WEIGHT;
    -- sfix(1, -7)
    signal c0c2c39cm3c27c5c6cm1c1cm16cm3c1cm9cm15c0c2_weight : PIPELINE_TYPE_FOR_C0C2C39CM3C27C5C6CM1C1CM16CM3C1CM9CM15C0C2_WEIGHT;
    -- sfix(1, -7)
    signal cm12c15c2c2c10cm6cm4c7c3c7c8cm7c95c4c0c0_weight : PIPELINE_TYPE_FOR_CM12C15C2C2C10CM6CM4C7C3C7C8CM7C95C4C0C0_WEIGHT;
    -- sfix(1, -7)
    signal c0c6c6c1c4c17cm17c12c1cm4cm2cm3c8cm23cm36cm13_weight : PIPELINE_TYPE_FOR_C0C6C6C1C4C17CM17C12C1CM4CM2CM3C8CM23CM36CM13_WEIGHT;
    -- sfix(1, -7)
    signal c10c3cm13c3cm9c9cm4c8cm5cm16cm1cm10c0cm16cm7cm17_weight : PIPELINE_TYPE_FOR_C10C3CM13C3CM9C9CM4C8CM5CM16CM1CM10C0CM16CM7CM17_WEIGHT;
    -- sfix(1, -7)
    signal c1c1c1cm5c7c22c5c12cm10cm5c7cm2c0c2cm5c7_weight : PIPELINE_TYPE_FOR_C1C1C1CM5C7C22C5C12CM10CM5C7CM2C0C2CM5C7_WEIGHT;
    -- sfix(1, -7)
    signal c2cm1c5cm2cm27c1c1c1c9c0c16cm3cm4c0c1c3_weight : PIPELINE_TYPE_FOR_C2CM1C5CM2CM27C1C1C1C9C0C16CM3CM4C0C1C3_WEIGHT;
    -- sfix(1, -7)
    signal cm7cm10c6cm93cm4cm4cm6cm16c37cm27cm3c4c6cm91cm3cm13_weight : PIPELINE_TYPE_FOR_CM7CM10C6CM93CM4CM4CM6CM16C37CM27CM3C4C6CM91CM3CM13_WEIGHT;
    -- sfix(1, -7)
    signal cm8c10cm1cm10c51c1cm2cm7c1c21c3cm6cm8c2cm2cm1_weight : PIPELINE_TYPE_FOR_CM8C10CM1CM10C51C1CM2CM7C1C21C3CM6CM8C2CM2CM1_WEIGHT;
    -- sfix(1, -7)
    signal cm4cm4c8cm3c6cm5c3c9c16c1cm9cm5cm1c1c6cm10_weight : PIPELINE_TYPE_FOR_CM4CM4C8CM3C6CM5C3C9C16C1CM9CM5CM1C1C6CM10_WEIGHT;
    -- sfix(1, -7)
    signal c3cm2c0c0c15cm7cm15cm17cm2c0c8c7cm1c1cm36c18_weight : PIPELINE_TYPE_FOR_C3CM2C0C0C15CM7CM15CM17CM2C0C8C7CM1C1CM36C18_WEIGHT;
    -- sfix(1, -7)
    signal cm10cm58c0c2c8cm2c7c2c14c2c2cm1cm14cm8c3cm2_weight : PIPELINE_TYPE_FOR_CM10CM58C0C2C8CM2C7C2C14C2C2CM1CM14CM8C3CM2_WEIGHT;
    -- sfix(1, -7)
    signal c0c10cm1c0cm8cm10c3c2cm7c2c0cm6c1cm2c7cm4_weight : PIPELINE_TYPE_FOR_C0C10CM1C0CM8CM10C3C2CM7C2C0CM6C1CM2C7CM4_WEIGHT;
    -- sfix(1, -7)
    signal cm6c13cm2c3c31c7c6c4cm10cm5cm6c3c19c6cm56cm6_weight : PIPELINE_TYPE_FOR_CM6C13CM2C3C31C7C6C4CM10CM5CM6C3C19C6CM56CM6_WEIGHT;
    -- sfix(1, -7)
    signal c3c4c2c2c3cm18c7cm3c2cm8c0cm4cm9c1cm1cm1_weight : PIPELINE_TYPE_FOR_C3C4C2C2C3CM18C7CM3C2CM8C0CM4CM9C1CM1CM1_WEIGHT;
    -- sfix(1, -7)
    signal cm2cm37cm29cm2cm5cm6cm14c9c1c0c1cm14cm63cm4c0cm6_weight : PIPELINE_TYPE_FOR_CM2CM37CM29CM2CM5CM6CM14C9C1C0C1CM14CM63CM4C0CM6_WEIGHT;
    -- sfix(1, -7)
    signal cm10c1c13cm8c15c14cm4cm3cm5cm8cm1cm11c7cm7c17c13_weight : PIPELINE_TYPE_FOR_CM10C1C13CM8C15C14CM4CM3CM5CM8CM1CM11C7CM7C17C13_WEIGHT;
    -- sfix(1, -7)
    signal c0cm1c6cm2cm10c24c1c0c8c0cm2c12c15c2c5c6_weight : PIPELINE_TYPE_FOR_C0CM1C6CM2CM10C24C1C0C8C0CM2C12C15C2C5C6_WEIGHT;
    -- sfix(1, -7)
    signal cm12cm1cm6c1cm12c3cm6cm1c16cm23cm5c2cm5cm50cm4c0_weight : PIPELINE_TYPE_FOR_CM12CM1CM6C1CM12C3CM6CM1C16CM23CM5C2CM5CM50CM4C0_WEIGHT;
    -- sfix(1, -7)
    signal c37c4c2cm28c20cm8c3c11cm3c3c0cm20cm6cm49c4cm18_weight : PIPELINE_TYPE_FOR_C37C4C2CM28C20CM8C3C11CM3C3C0CM20CM6CM49C4CM18_WEIGHT;
    -- sfix(1, -7)
    signal cm4cm5c13cm5cm1cm3cm32c4c2cm9c18c27cm1cm7cm3cm23_weight : PIPELINE_TYPE_FOR_CM4CM5C13CM5CM1CM3CM32C4C2CM9C18C27CM1CM7CM3CM23_WEIGHT;
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



    WEIGHT_ROM: entity work.conv7_core32_rmcm_weightsconstant_memory
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
        
            dout1   => cm6c8c2c5c11cm3cm11cm1cm4cm5cm5c4c3c11c2c4_weight(0), 
            dout2   => c19cm3cm51c1c0c14cm17c2cm11c6c41cm6c0c21c6c1_weight(0), 
            dout3   => c127c2c8cm24c13cm3c1cm2c8cm1c6cm11c4c26cm7cm4_weight(0), 
            dout4   => c4cm1cm3c2c0cm5cm40cm11c5c1cm3cm8cm17cm1c34cm7_weight(0), 
            dout5   => c2c0c11c6cm14cm2c14cm12c31c2cm43cm1cm19c3c6c1_weight(0), 
            dout6   => cm7c0c3c10cm2c3cm26cm15c11cm3c3cm4c1c1c4c4_weight(0), 
            dout7   => cm11c3c2cm4cm12cm9c2cm13cm54cm1cm2c12cm73c9cm1c77_weight(0), 
            dout8   => c3c6cm1c1c18c4c25cm27cm8cm8c8cm1cm8cm19c16cm25_weight(0), 
            dout9   => c3c9c7cm2cm5c25c7c6cm9cm3c14c8c1c53c4c3_weight(0), 
            dout10   => c10cm4cm2c7cm4c1cm4c18c9c3c3cm4cm2cm7cm1cm20_weight(0), 
            dout11   => c7cm5cm2cm2cm14c30cm4cm2cm8cm18cm4cm7cm6c5cm20cm6_weight(0), 
            dout12   => c9cm7c0cm3c0c5c0c5cm24c1c19c9cm3c1cm32cm5_weight(0), 
            dout13   => c0c2c39cm3c27c5c6cm1c1cm16cm3c1cm9cm15c0c2_weight(0), 
            dout14   => cm12c15c2c2c10cm6cm4c7c3c7c8cm7c95c4c0c0_weight(0), 
            dout15   => c0c6c6c1c4c17cm17c12c1cm4cm2cm3c8cm23cm36cm13_weight(0), 
            dout16   => c10c3cm13c3cm9c9cm4c8cm5cm16cm1cm10c0cm16cm7cm17_weight(0), 
            dout17   => c1c1c1cm5c7c22c5c12cm10cm5c7cm2c0c2cm5c7_weight(0), 
            dout18   => c2cm1c5cm2cm27c1c1c1c9c0c16cm3cm4c0c1c3_weight(0), 
            dout19   => cm7cm10c6cm93cm4cm4cm6cm16c37cm27cm3c4c6cm91cm3cm13_weight(0), 
            dout20   => cm8c10cm1cm10c51c1cm2cm7c1c21c3cm6cm8c2cm2cm1_weight(0), 
            dout21   => cm4cm4c8cm3c6cm5c3c9c16c1cm9cm5cm1c1c6cm10_weight(0), 
            dout22   => c3cm2c0c0c15cm7cm15cm17cm2c0c8c7cm1c1cm36c18_weight(0), 
            dout23   => cm10cm58c0c2c8cm2c7c2c14c2c2cm1cm14cm8c3cm2_weight(0), 
            dout24   => c0c10cm1c0cm8cm10c3c2cm7c2c0cm6c1cm2c7cm4_weight(0), 
            dout25   => cm6c13cm2c3c31c7c6c4cm10cm5cm6c3c19c6cm56cm6_weight(0), 
            dout26   => c3c4c2c2c3cm18c7cm3c2cm8c0cm4cm9c1cm1cm1_weight(0), 
            dout27   => cm2cm37cm29cm2cm5cm6cm14c9c1c0c1cm14cm63cm4c0cm6_weight(0), 
            dout28   => cm10c1c13cm8c15c14cm4cm3cm5cm8cm1cm11c7cm7c17c13_weight(0), 
            dout29   => c0cm1c6cm2cm10c24c1c0c8c0cm2c12c15c2c5c6_weight(0), 
            dout30   => cm12cm1cm6c1cm12c3cm6cm1c16cm23cm5c2cm5cm50cm4c0_weight(0), 
            dout31   => c37c4c2cm28c20cm8c3c11cm3c3c0cm20cm6cm49c4cm18_weight(0), 
            dout32   => cm4cm5c13cm5cm1cm3cm32c4c2cm9c18c27cm1cm7cm3cm23_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_cm6c8c2c5c11cm3cm11cm1cm4cm5cm5c4c3c11c2c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6c8c2c5c11cm3cm11cm1cm4cm5cm5c4c3c11c2c4_weight(0), cm6c8c2c5c11cm3cm11cm1cm4cm5cm5c4c3c11c2c4_weight(1));
    PL_STEP_0_for_c19cm3cm51c1c0c14cm17c2cm11c6c41cm6c0c21c6c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c19cm3cm51c1c0c14cm17c2cm11c6c41cm6c0c21c6c1_weight(0), c19cm3cm51c1c0c14cm17c2cm11c6c41cm6c0c21c6c1_weight(1));
    PL_STEP_0_for_c127c2c8cm24c13cm3c1cm2c8cm1c6cm11c4c26cm7cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c127c2c8cm24c13cm3c1cm2c8cm1c6cm11c4c26cm7cm4_weight(0), c127c2c8cm24c13cm3c1cm2c8cm1c6cm11c4c26cm7cm4_weight(1));
    PL_STEP_0_for_c4cm1cm3c2c0cm5cm40cm11c5c1cm3cm8cm17cm1c34cm7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4cm1cm3c2c0cm5cm40cm11c5c1cm3cm8cm17cm1c34cm7_weight(0), c4cm1cm3c2c0cm5cm40cm11c5c1cm3cm8cm17cm1c34cm7_weight(1));
    PL_STEP_0_for_c2c0c11c6cm14cm2c14cm12c31c2cm43cm1cm19c3c6c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c0c11c6cm14cm2c14cm12c31c2cm43cm1cm19c3c6c1_weight(0), c2c0c11c6cm14cm2c14cm12c31c2cm43cm1cm19c3c6c1_weight(1));
    PL_STEP_0_for_cm7c0c3c10cm2c3cm26cm15c11cm3c3cm4c1c1c4c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm7c0c3c10cm2c3cm26cm15c11cm3c3cm4c1c1c4c4_weight(0), cm7c0c3c10cm2c3cm26cm15c11cm3c3cm4c1c1c4c4_weight(1));
    PL_STEP_0_for_cm11c3c2cm4cm12cm9c2cm13cm54cm1cm2c12cm73c9cm1c77_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm11c3c2cm4cm12cm9c2cm13cm54cm1cm2c12cm73c9cm1c77_weight(0), cm11c3c2cm4cm12cm9c2cm13cm54cm1cm2c12cm73c9cm1c77_weight(1));
    PL_STEP_0_for_c3c6cm1c1c18c4c25cm27cm8cm8c8cm1cm8cm19c16cm25_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c6cm1c1c18c4c25cm27cm8cm8c8cm1cm8cm19c16cm25_weight(0), c3c6cm1c1c18c4c25cm27cm8cm8c8cm1cm8cm19c16cm25_weight(1));
    PL_STEP_0_for_c3c9c7cm2cm5c25c7c6cm9cm3c14c8c1c53c4c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c9c7cm2cm5c25c7c6cm9cm3c14c8c1c53c4c3_weight(0), c3c9c7cm2cm5c25c7c6cm9cm3c14c8c1c53c4c3_weight(1));
    PL_STEP_0_for_c10cm4cm2c7cm4c1cm4c18c9c3c3cm4cm2cm7cm1cm20_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c10cm4cm2c7cm4c1cm4c18c9c3c3cm4cm2cm7cm1cm20_weight(0), c10cm4cm2c7cm4c1cm4c18c9c3c3cm4cm2cm7cm1cm20_weight(1));
    PL_STEP_0_for_c7cm5cm2cm2cm14c30cm4cm2cm8cm18cm4cm7cm6c5cm20cm6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c7cm5cm2cm2cm14c30cm4cm2cm8cm18cm4cm7cm6c5cm20cm6_weight(0), c7cm5cm2cm2cm14c30cm4cm2cm8cm18cm4cm7cm6c5cm20cm6_weight(1));
    PL_STEP_0_for_c9cm7c0cm3c0c5c0c5cm24c1c19c9cm3c1cm32cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c9cm7c0cm3c0c5c0c5cm24c1c19c9cm3c1cm32cm5_weight(0), c9cm7c0cm3c0c5c0c5cm24c1c19c9cm3c1cm32cm5_weight(1));
    PL_STEP_0_for_c0c2c39cm3c27c5c6cm1c1cm16cm3c1cm9cm15c0c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c2c39cm3c27c5c6cm1c1cm16cm3c1cm9cm15c0c2_weight(0), c0c2c39cm3c27c5c6cm1c1cm16cm3c1cm9cm15c0c2_weight(1));
    PL_STEP_0_for_cm12c15c2c2c10cm6cm4c7c3c7c8cm7c95c4c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm12c15c2c2c10cm6cm4c7c3c7c8cm7c95c4c0c0_weight(0), cm12c15c2c2c10cm6cm4c7c3c7c8cm7c95c4c0c0_weight(1));
    PL_STEP_0_for_c0c6c6c1c4c17cm17c12c1cm4cm2cm3c8cm23cm36cm13_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c6c6c1c4c17cm17c12c1cm4cm2cm3c8cm23cm36cm13_weight(0), c0c6c6c1c4c17cm17c12c1cm4cm2cm3c8cm23cm36cm13_weight(1));
    PL_STEP_0_for_c10c3cm13c3cm9c9cm4c8cm5cm16cm1cm10c0cm16cm7cm17_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c10c3cm13c3cm9c9cm4c8cm5cm16cm1cm10c0cm16cm7cm17_weight(0), c10c3cm13c3cm9c9cm4c8cm5cm16cm1cm10c0cm16cm7cm17_weight(1));
    PL_STEP_0_for_c1c1c1cm5c7c22c5c12cm10cm5c7cm2c0c2cm5c7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c1c1cm5c7c22c5c12cm10cm5c7cm2c0c2cm5c7_weight(0), c1c1c1cm5c7c22c5c12cm10cm5c7cm2c0c2cm5c7_weight(1));
    PL_STEP_0_for_c2cm1c5cm2cm27c1c1c1c9c0c16cm3cm4c0c1c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2cm1c5cm2cm27c1c1c1c9c0c16cm3cm4c0c1c3_weight(0), c2cm1c5cm2cm27c1c1c1c9c0c16cm3cm4c0c1c3_weight(1));
    PL_STEP_0_for_cm7cm10c6cm93cm4cm4cm6cm16c37cm27cm3c4c6cm91cm3cm13_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm7cm10c6cm93cm4cm4cm6cm16c37cm27cm3c4c6cm91cm3cm13_weight(0), cm7cm10c6cm93cm4cm4cm6cm16c37cm27cm3c4c6cm91cm3cm13_weight(1));
    PL_STEP_0_for_cm8c10cm1cm10c51c1cm2cm7c1c21c3cm6cm8c2cm2cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm8c10cm1cm10c51c1cm2cm7c1c21c3cm6cm8c2cm2cm1_weight(0), cm8c10cm1cm10c51c1cm2cm7c1c21c3cm6cm8c2cm2cm1_weight(1));
    PL_STEP_0_for_cm4cm4c8cm3c6cm5c3c9c16c1cm9cm5cm1c1c6cm10_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4cm4c8cm3c6cm5c3c9c16c1cm9cm5cm1c1c6cm10_weight(0), cm4cm4c8cm3c6cm5c3c9c16c1cm9cm5cm1c1c6cm10_weight(1));
    PL_STEP_0_for_c3cm2c0c0c15cm7cm15cm17cm2c0c8c7cm1c1cm36c18_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3cm2c0c0c15cm7cm15cm17cm2c0c8c7cm1c1cm36c18_weight(0), c3cm2c0c0c15cm7cm15cm17cm2c0c8c7cm1c1cm36c18_weight(1));
    PL_STEP_0_for_cm10cm58c0c2c8cm2c7c2c14c2c2cm1cm14cm8c3cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm10cm58c0c2c8cm2c7c2c14c2c2cm1cm14cm8c3cm2_weight(0), cm10cm58c0c2c8cm2c7c2c14c2c2cm1cm14cm8c3cm2_weight(1));
    PL_STEP_0_for_c0c10cm1c0cm8cm10c3c2cm7c2c0cm6c1cm2c7cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c10cm1c0cm8cm10c3c2cm7c2c0cm6c1cm2c7cm4_weight(0), c0c10cm1c0cm8cm10c3c2cm7c2c0cm6c1cm2c7cm4_weight(1));
    PL_STEP_0_for_cm6c13cm2c3c31c7c6c4cm10cm5cm6c3c19c6cm56cm6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6c13cm2c3c31c7c6c4cm10cm5cm6c3c19c6cm56cm6_weight(0), cm6c13cm2c3c31c7c6c4cm10cm5cm6c3c19c6cm56cm6_weight(1));
    PL_STEP_0_for_c3c4c2c2c3cm18c7cm3c2cm8c0cm4cm9c1cm1cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c4c2c2c3cm18c7cm3c2cm8c0cm4cm9c1cm1cm1_weight(0), c3c4c2c2c3cm18c7cm3c2cm8c0cm4cm9c1cm1cm1_weight(1));
    PL_STEP_0_for_cm2cm37cm29cm2cm5cm6cm14c9c1c0c1cm14cm63cm4c0cm6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm37cm29cm2cm5cm6cm14c9c1c0c1cm14cm63cm4c0cm6_weight(0), cm2cm37cm29cm2cm5cm6cm14c9c1c0c1cm14cm63cm4c0cm6_weight(1));
    PL_STEP_0_for_cm10c1c13cm8c15c14cm4cm3cm5cm8cm1cm11c7cm7c17c13_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm10c1c13cm8c15c14cm4cm3cm5cm8cm1cm11c7cm7c17c13_weight(0), cm10c1c13cm8c15c14cm4cm3cm5cm8cm1cm11c7cm7c17c13_weight(1));
    PL_STEP_0_for_c0cm1c6cm2cm10c24c1c0c8c0cm2c12c15c2c5c6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm1c6cm2cm10c24c1c0c8c0cm2c12c15c2c5c6_weight(0), c0cm1c6cm2cm10c24c1c0c8c0cm2c12c15c2c5c6_weight(1));
    PL_STEP_0_for_cm12cm1cm6c1cm12c3cm6cm1c16cm23cm5c2cm5cm50cm4c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm12cm1cm6c1cm12c3cm6cm1c16cm23cm5c2cm5cm50cm4c0_weight(0), cm12cm1cm6c1cm12c3cm6cm1c16cm23cm5c2cm5cm50cm4c0_weight(1));
    PL_STEP_0_for_c37c4c2cm28c20cm8c3c11cm3c3c0cm20cm6cm49c4cm18_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c37c4c2cm28c20cm8c3c11cm3c3c0cm20cm6cm49c4cm18_weight(0), c37c4c2cm28c20cm8c3c11cm3c3c0cm20cm6cm49c4cm18_weight(1));
    PL_STEP_0_for_cm4cm5c13cm5cm1cm3cm32c4c2cm9c18c27cm1cm7cm3cm23_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4cm5c13cm5cm1cm3cm32c4c2cm9c18c27cm1cm7cm3cm23_weight(0), cm4cm5c13cm5cm1cm3cm32c4c2cm9c18c27cm1cm7cm3cm23_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    c127c2c8cm24c13cm3c1cm2c8cm1c6cm11c4c26cm7cm4_c0c10cm1c0cm8cm10c3c2cm7c2c0cm6c1cm2c7cm4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c127c2c8cm24c13cm3c1cm2c8cm1c6cm11c4c26cm7cm4_weight(1)(8-1 downto 0),
			B	=> c0c10cm1c0cm8cm10c3c2cm7c2c0cm6c1cm2c7cm4_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c127c2c8cm24c13cm3c1cm2c8cm1c6cm11c4c26cm7cm4,
			CxB => R_c0c10cm1c0cm8cm10c3c2cm7c2c0cm6c1cm2c7cm4
		);

    cm11c3c2cm4cm12cm9c2cm13cm54cm1cm2c12cm73c9cm1c77_cm6c8c2c5c11cm3cm11cm1cm4cm5cm5c4c3c11c2c4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm11c3c2cm4cm12cm9c2cm13cm54cm1cm2c12cm73c9cm1c77_weight(1)(8-1 downto 0),
			B	=> cm6c8c2c5c11cm3cm11cm1cm4cm5cm5c4c3c11c2c4_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm11c3c2cm4cm12cm9c2cm13cm54cm1cm2c12cm73c9cm1c77,
			CxB => R_cm6c8c2c5c11cm3cm11cm1cm4cm5cm5c4c3c11c2c4
		);

    cm12c15c2c2c10cm6cm4c7c3c7c8cm7c95c4c0c0_cm4cm5c13cm5cm1cm3cm32c4c2cm9c18c27cm1cm7cm3cm23_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm12c15c2c2c10cm6cm4c7c3c7c8cm7c95c4c0c0_weight(1)(8-1 downto 0),
			B	=> cm4cm5c13cm5cm1cm3cm32c4c2cm9c18c27cm1cm7cm3cm23_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm12c15c2c2c10cm6cm4c7c3c7c8cm7c95c4c0c0,
			CxB => R_cm4cm5c13cm5cm1cm3cm32c4c2cm9c18c27cm1cm7cm3cm23
		);

    cm7cm10c6cm93cm4cm4cm6cm16c37cm27cm3c4c6cm91cm3cm13_c0cm1c6cm2cm10c24c1c0c8c0cm2c12c15c2c5c6_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm7cm10c6cm93cm4cm4cm6cm16c37cm27cm3c4c6cm91cm3cm13_weight(1)(8-1 downto 0),
			B	=> c0cm1c6cm2cm10c24c1c0c8c0cm2c12c15c2c5c6_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm7cm10c6cm93cm4cm4cm6cm16c37cm27cm3c4c6cm91cm3cm13,
			CxB => R_c0cm1c6cm2cm10c24c1c0c8c0cm2c12c15c2c5c6
		);

    c19cm3cm51c1c0c14cm17c2cm11c6c41cm6c0c21c6c1_cm10c1c13cm8c15c14cm4cm3cm5cm8cm1cm11c7cm7c17c13_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c19cm3cm51c1c0c14cm17c2cm11c6c41cm6c0c21c6c1_weight(1)(7-1 downto 0),
			B	=> cm10c1c13cm8c15c14cm4cm3cm5cm8cm1cm11c7cm7c17c13_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c19cm3cm51c1c0c14cm17c2cm11c6c41cm6c0c21c6c1,
			CxB => R_cm10c1c13cm8c15c14cm4cm3cm5cm8cm1cm11c7cm7c17c13
		);

    c4cm1cm3c2c0cm5cm40cm11c5c1cm3cm8cm17cm1c34cm7_c3c4c2c2c3cm18c7cm3c2cm8c0cm4cm9c1cm1cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c4cm1cm3c2c0cm5cm40cm11c5c1cm3cm8cm17cm1c34cm7_weight(1)(7-1 downto 0),
			B	=> c3c4c2c2c3cm18c7cm3c2cm8c0cm4cm9c1cm1cm1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c4cm1cm3c2c0cm5cm40cm11c5c1cm3cm8cm17cm1c34cm7,
			CxB => R_c3c4c2c2c3cm18c7cm3c2cm8c0cm4cm9c1cm1cm1
		);

    c2c0c11c6cm14cm2c14cm12c31c2cm43cm1cm19c3c6c1_cm4cm4c8cm3c6cm5c3c9c16c1cm9cm5cm1c1c6cm10_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c2c0c11c6cm14cm2c14cm12c31c2cm43cm1cm19c3c6c1_weight(1)(7-1 downto 0),
			B	=> cm4cm4c8cm3c6cm5c3c9c16c1cm9cm5cm1c1c6cm10_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c2c0c11c6cm14cm2c14cm12c31c2cm43cm1cm19c3c6c1,
			CxB => R_cm4cm4c8cm3c6cm5c3c9c16c1cm9cm5cm1c1c6cm10
		);

    c3c9c7cm2cm5c25c7c6cm9cm3c14c8c1c53c4c3_c2cm1c5cm2cm27c1c1c1c9c0c16cm3cm4c0c1c3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c3c9c7cm2cm5c25c7c6cm9cm3c14c8c1c53c4c3_weight(1)(7-1 downto 0),
			B	=> c2cm1c5cm2cm27c1c1c1c9c0c16cm3cm4c0c1c3_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c3c9c7cm2cm5c25c7c6cm9cm3c14c8c1c53c4c3,
			CxB => R_c2cm1c5cm2cm27c1c1c1c9c0c16cm3cm4c0c1c3
		);

    c0c2c39cm3c27c5c6cm1c1cm16cm3c1cm9cm15c0c2_c1c1c1cm5c7c22c5c12cm10cm5c7cm2c0c2cm5c7_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0c2c39cm3c27c5c6cm1c1cm16cm3c1cm9cm15c0c2_weight(1)(7-1 downto 0),
			B	=> c1c1c1cm5c7c22c5c12cm10cm5c7cm2c0c2cm5c7_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c2c39cm3c27c5c6cm1c1cm16cm3c1cm9cm15c0c2,
			CxB => R_c1c1c1cm5c7c22c5c12cm10cm5c7cm2c0c2cm5c7
		);

    c0c6c6c1c4c17cm17c12c1cm4cm2cm3c8cm23cm36cm13_c10c3cm13c3cm9c9cm4c8cm5cm16cm1cm10c0cm16cm7cm17_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0c6c6c1c4c17cm17c12c1cm4cm2cm3c8cm23cm36cm13_weight(1)(7-1 downto 0),
			B	=> c10c3cm13c3cm9c9cm4c8cm5cm16cm1cm10c0cm16cm7cm17_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c6c6c1c4c17cm17c12c1cm4cm2cm3c8cm23cm36cm13,
			CxB => R_c10c3cm13c3cm9c9cm4c8cm5cm16cm1cm10c0cm16cm7cm17
		);

    cm8c10cm1cm10c51c1cm2cm7c1c21c3cm6cm8c2cm2cm1_c9cm7c0cm3c0c5c0c5cm24c1c19c9cm3c1cm32cm5_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm8c10cm1cm10c51c1cm2cm7c1c21c3cm6cm8c2cm2cm1_weight(1)(7-1 downto 0),
			B	=> c9cm7c0cm3c0c5c0c5cm24c1c19c9cm3c1cm32cm5_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm8c10cm1cm10c51c1cm2cm7c1c21c3cm6cm8c2cm2cm1,
			CxB => R_c9cm7c0cm3c0c5c0c5cm24c1c19c9cm3c1cm32cm5
		);

    c3cm2c0c0c15cm7cm15cm17cm2c0c8c7cm1c1cm36c18_c7cm5cm2cm2cm14c30cm4cm2cm8cm18cm4cm7cm6c5cm20cm6_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c3cm2c0c0c15cm7cm15cm17cm2c0c8c7cm1c1cm36c18_weight(1)(7-1 downto 0),
			B	=> c7cm5cm2cm2cm14c30cm4cm2cm8cm18cm4cm7cm6c5cm20cm6_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c3cm2c0c0c15cm7cm15cm17cm2c0c8c7cm1c1cm36c18,
			CxB => R_c7cm5cm2cm2cm14c30cm4cm2cm8cm18cm4cm7cm6c5cm20cm6
		);

    cm10cm58c0c2c8cm2c7c2c14c2c2cm1cm14cm8c3cm2_c10cm4cm2c7cm4c1cm4c18c9c3c3cm4cm2cm7cm1cm20_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm10cm58c0c2c8cm2c7c2c14c2c2cm1cm14cm8c3cm2_weight(1)(7-1 downto 0),
			B	=> c10cm4cm2c7cm4c1cm4c18c9c3c3cm4cm2cm7cm1cm20_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm10cm58c0c2c8cm2c7c2c14c2c2cm1cm14cm8c3cm2,
			CxB => R_c10cm4cm2c7cm4c1cm4c18c9c3c3cm4cm2cm7cm1cm20
		);

    cm6c13cm2c3c31c7c6c4cm10cm5cm6c3c19c6cm56cm6_c3c6cm1c1c18c4c25cm27cm8cm8c8cm1cm8cm19c16cm25_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm6c13cm2c3c31c7c6c4cm10cm5cm6c3c19c6cm56cm6_weight(1)(7-1 downto 0),
			B	=> c3c6cm1c1c18c4c25cm27cm8cm8c8cm1cm8cm19c16cm25_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm6c13cm2c3c31c7c6c4cm10cm5cm6c3c19c6cm56cm6,
			CxB => R_c3c6cm1c1c18c4c25cm27cm8cm8c8cm1cm8cm19c16cm25
		);

    cm2cm37cm29cm2cm5cm6cm14c9c1c0c1cm14cm63cm4c0cm6_cm7c0c3c10cm2c3cm26cm15c11cm3c3cm4c1c1c4c4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2cm37cm29cm2cm5cm6cm14c9c1c0c1cm14cm63cm4c0cm6_weight(1)(7-1 downto 0),
			B	=> cm7c0c3c10cm2c3cm26cm15c11cm3c3cm4c1c1c4c4_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2cm37cm29cm2cm5cm6cm14c9c1c0c1cm14cm63cm4c0cm6,
			CxB => R_cm7c0c3c10cm2c3cm26cm15c11cm3c3cm4c1c1c4c4
		);

    cm12cm1cm6c1cm12c3cm6cm1c16cm23cm5c2cm5cm50cm4c0_c37c4c2cm28c20cm8c3c11cm3c3c0cm20cm6cm49c4cm18_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm12cm1cm6c1cm12c3cm6cm1c16cm23cm5c2cm5cm50cm4c0_weight(1)(7-1 downto 0),
			B	=> c37c4c2cm28c20cm8c3c11cm3c3c0cm20cm6cm49c4cm18_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm12cm1cm6c1cm12c3cm6cm1c16cm23cm5c2cm5cm50cm4c0,
			CxB => R_c37c4c2cm28c20cm8c3c11cm3c3c0cm20cm6cm49c4cm18
		);




end architecture;
