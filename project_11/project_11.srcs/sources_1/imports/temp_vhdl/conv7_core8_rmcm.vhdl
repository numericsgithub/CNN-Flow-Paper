library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core8_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        R_c11c7c13c6c3cm5c2c1c16cm1cm17c6cm19cm8cm11cm10 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c3c2c49c1cm3cm8cm1cm4cm23c4c16c5c3c7cm44c1 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm22c6c15cm33cm7cm9cm3cm4cm24cm5c19c3cm14c5cm9c6 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c0c15cm11c11c8c5c9c1cm16c47c2cm13c0cm14cm4cm7 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm3cm3cm9c1c9cm6cm1cm10c1c10cm3c10cm5c4cm14cm1 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_cm57cm4c6c2c2cm2c9cm10cm6cm1cm12c3cm4cm1c0c0 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm13c15cm3c4c15c7c13c6c19c4c2c3cm18cm2cm6c4 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm4cm7cm5cm3cm10c6c10c34c0c16c18c8c5c2cm6c5 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm2c3c6cm10c16c6c2cm7cm12cm26cm2c5c3c4cm7cm3 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm17cm4c0cm6cm1c3cm4cm3c2c0c0c4cm21c5cm3cm19 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c9cm2c1c4c14c8c46c2cm7cm12cm11cm11c12c10c3cm3 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c1c24c7c1c7c0cm27c14cm5c0c3c2cm15cm9cm4c9 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c0cm3cm32c1c32cm10cm4c18c7cm16cm19cm1cm5cm9cm7c3 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c8c13c7c0c29c4cm6c5cm57c3cm1c3c19cm10c6c2 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c2cm5c7cm3c5cm6cm14c40cm6c0c32c0cm3cm5cm17c2 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c23cm4cm16cm2c1c7cm3c3cm29cm17c3cm8c2cm6c10cm7 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c2cm4c0cm1c3c9cm10c4c4c1c3c4cm6cm13c8cm12 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_cm2c2c10c2cm30c5c2cm2cm15c3c41c6cm9cm3cm48c1 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm2cm10cm7c31c15cm43cm23cm4cm14cm21cm3cm13c9c5cm2c7 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm1cm11c8cm4cm1cm19cm1c9cm9cm3c0cm37c7cm3cm1cm20 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c25c0c0cm2cm1c9c2c6c4c1c5cm6cm17cm3c1c3 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm4c4c4cm5cm3cm4cm17cm7cm16cm2c13cm2cm4cm2cm6cm4 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm8c16c7cm3c49cm7cm8c7c3cm9cm15c4c10c6cm1c2 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm1cm2c1cm1c18c6c19cm4cm1cm1cm13cm6cm5cm7c1cm1 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm11cm27cm6c2cm13c5c11c3c2cm3c18cm1cm3c16cm15c0 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c2c1c5c2c11c2cm11c1c0cm18c12cm3cm1cm5c6c2 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm3cm1c3cm15cm30cm7c7cm8c11cm10cm20cm3cm1c0c16c1 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm1c1c12c11cm5cm1c9cm5cm2cm53c6cm47c1c11cm4c6 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c4c2cm2cm2cm2c0c15c14cm9cm2c12c18cm4cm3cm8cm1 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm1c4c9c6c11cm36cm4cm7cm1cm11cm18cm3c0cm8c20cm4 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm24cm4c0cm1cm3c5c10cm10cm12c16c4cm25c3cm8cm2c5 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c1c1c16cm19cm10c8cm6c2c7cm7c5c22cm2c4cm4cm9 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(11-1 downto 0)  --	sfix(1, -10)
    );
end conv7_core8_rmcm;

architecture arch of conv7_core8_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_C11C7C13C6C3CM5C2C1C16CM1CM17C6CM19CM8CM11CM10_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C2C49C1CM3CM8CM1CM4CM23C4C16C5C3C7CM44C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM22C6C15CM33CM7CM9CM3CM4CM24CM5C19C3CM14C5CM9C6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C15CM11C11C8C5C9C1CM16C47C2CM13C0CM14CM4CM7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3CM3CM9C1C9CM6CM1CM10C1C10CM3C10CM5C4CM14CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM57CM4C6C2C2CM2C9CM10CM6CM1CM12C3CM4CM1C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM13C15CM3C4C15C7C13C6C19C4C2C3CM18CM2CM6C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4CM7CM5CM3CM10C6C10C34C0C16C18C8C5C2CM6C5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C3C6CM10C16C6C2CM7CM12CM26CM2C5C3C4CM7CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM17CM4C0CM6CM1C3CM4CM3C2C0C0C4CM21C5CM3CM19_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C9CM2C1C4C14C8C46C2CM7CM12CM11CM11C12C10C3CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C24C7C1C7C0CM27C14CM5C0C3C2CM15CM9CM4C9_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM3CM32C1C32CM10CM4C18C7CM16CM19CM1CM5CM9CM7C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C8C13C7C0C29C4CM6C5CM57C3CM1C3C19CM10C6C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2CM5C7CM3C5CM6CM14C40CM6C0C32C0CM3CM5CM17C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C23CM4CM16CM2C1C7CM3C3CM29CM17C3CM8C2CM6C10CM7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2CM4C0CM1C3C9CM10C4C4C1C3C4CM6CM13C8CM12_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C2C10C2CM30C5C2CM2CM15C3C41C6CM9CM3CM48C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM10CM7C31C15CM43CM23CM4CM14CM21CM3CM13C9C5CM2C7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM11C8CM4CM1CM19CM1C9CM9CM3C0CM37C7CM3CM1CM20_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C25C0C0CM2CM1C9C2C6C4C1C5CM6CM17CM3C1C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4C4C4CM5CM3CM4CM17CM7CM16CM2C13CM2CM4CM2CM6CM4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM8C16C7CM3C49CM7CM8C7C3CM9CM15C4C10C6CM1C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM2C1CM1C18C6C19CM4CM1CM1CM13CM6CM5CM7C1CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM11CM27CM6C2CM13C5C11C3C2CM3C18CM1CM3C16CM15C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C1C5C2C11C2CM11C1C0CM18C12CM3CM1CM5C6C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3CM1C3CM15CM30CM7C7CM8C11CM10CM20CM3CM1C0C16C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C1C12C11CM5CM1C9CM5CM2CM53C6CM47C1C11CM4C6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4C2CM2CM2CM2C0C15C14CM9CM2C12C18CM4CM3CM8CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C4C9C6C11CM36CM4CM7CM1CM11CM18CM3C0CM8C20CM4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM24CM4C0CM1CM3C5C10CM10CM12C16C4CM25C3CM8CM2C5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C1C16CM19CM10C8CM6C2C7CM7C5C22CM2C4CM4CM9_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(4, -3)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(1, -7)
    signal c11c7c13c6c3cm5c2c1c16cm1cm17c6cm19cm8cm11cm10_weight : PIPELINE_TYPE_FOR_C11C7C13C6C3CM5C2C1C16CM1CM17C6CM19CM8CM11CM10_WEIGHT;
    -- sfix(1, -7)
    signal c3c2c49c1cm3cm8cm1cm4cm23c4c16c5c3c7cm44c1_weight : PIPELINE_TYPE_FOR_C3C2C49C1CM3CM8CM1CM4CM23C4C16C5C3C7CM44C1_WEIGHT;
    -- sfix(1, -7)
    signal cm22c6c15cm33cm7cm9cm3cm4cm24cm5c19c3cm14c5cm9c6_weight : PIPELINE_TYPE_FOR_CM22C6C15CM33CM7CM9CM3CM4CM24CM5C19C3CM14C5CM9C6_WEIGHT;
    -- sfix(1, -7)
    signal c0c15cm11c11c8c5c9c1cm16c47c2cm13c0cm14cm4cm7_weight : PIPELINE_TYPE_FOR_C0C15CM11C11C8C5C9C1CM16C47C2CM13C0CM14CM4CM7_WEIGHT;
    -- sfix(1, -7)
    signal cm3cm3cm9c1c9cm6cm1cm10c1c10cm3c10cm5c4cm14cm1_weight : PIPELINE_TYPE_FOR_CM3CM3CM9C1C9CM6CM1CM10C1C10CM3C10CM5C4CM14CM1_WEIGHT;
    -- sfix(1, -7)
    signal cm57cm4c6c2c2cm2c9cm10cm6cm1cm12c3cm4cm1c0c0_weight : PIPELINE_TYPE_FOR_CM57CM4C6C2C2CM2C9CM10CM6CM1CM12C3CM4CM1C0C0_WEIGHT;
    -- sfix(1, -7)
    signal cm13c15cm3c4c15c7c13c6c19c4c2c3cm18cm2cm6c4_weight : PIPELINE_TYPE_FOR_CM13C15CM3C4C15C7C13C6C19C4C2C3CM18CM2CM6C4_WEIGHT;
    -- sfix(1, -7)
    signal cm4cm7cm5cm3cm10c6c10c34c0c16c18c8c5c2cm6c5_weight : PIPELINE_TYPE_FOR_CM4CM7CM5CM3CM10C6C10C34C0C16C18C8C5C2CM6C5_WEIGHT;
    -- sfix(1, -7)
    signal cm2c3c6cm10c16c6c2cm7cm12cm26cm2c5c3c4cm7cm3_weight : PIPELINE_TYPE_FOR_CM2C3C6CM10C16C6C2CM7CM12CM26CM2C5C3C4CM7CM3_WEIGHT;
    -- sfix(1, -7)
    signal cm17cm4c0cm6cm1c3cm4cm3c2c0c0c4cm21c5cm3cm19_weight : PIPELINE_TYPE_FOR_CM17CM4C0CM6CM1C3CM4CM3C2C0C0C4CM21C5CM3CM19_WEIGHT;
    -- sfix(1, -7)
    signal c9cm2c1c4c14c8c46c2cm7cm12cm11cm11c12c10c3cm3_weight : PIPELINE_TYPE_FOR_C9CM2C1C4C14C8C46C2CM7CM12CM11CM11C12C10C3CM3_WEIGHT;
    -- sfix(1, -7)
    signal c1c24c7c1c7c0cm27c14cm5c0c3c2cm15cm9cm4c9_weight : PIPELINE_TYPE_FOR_C1C24C7C1C7C0CM27C14CM5C0C3C2CM15CM9CM4C9_WEIGHT;
    -- sfix(1, -7)
    signal c0cm3cm32c1c32cm10cm4c18c7cm16cm19cm1cm5cm9cm7c3_weight : PIPELINE_TYPE_FOR_C0CM3CM32C1C32CM10CM4C18C7CM16CM19CM1CM5CM9CM7C3_WEIGHT;
    -- sfix(1, -7)
    signal c8c13c7c0c29c4cm6c5cm57c3cm1c3c19cm10c6c2_weight : PIPELINE_TYPE_FOR_C8C13C7C0C29C4CM6C5CM57C3CM1C3C19CM10C6C2_WEIGHT;
    -- sfix(1, -7)
    signal c2cm5c7cm3c5cm6cm14c40cm6c0c32c0cm3cm5cm17c2_weight : PIPELINE_TYPE_FOR_C2CM5C7CM3C5CM6CM14C40CM6C0C32C0CM3CM5CM17C2_WEIGHT;
    -- sfix(1, -7)
    signal c23cm4cm16cm2c1c7cm3c3cm29cm17c3cm8c2cm6c10cm7_weight : PIPELINE_TYPE_FOR_C23CM4CM16CM2C1C7CM3C3CM29CM17C3CM8C2CM6C10CM7_WEIGHT;
    -- sfix(1, -7)
    signal c2cm4c0cm1c3c9cm10c4c4c1c3c4cm6cm13c8cm12_weight : PIPELINE_TYPE_FOR_C2CM4C0CM1C3C9CM10C4C4C1C3C4CM6CM13C8CM12_WEIGHT;
    -- sfix(1, -7)
    signal cm2c2c10c2cm30c5c2cm2cm15c3c41c6cm9cm3cm48c1_weight : PIPELINE_TYPE_FOR_CM2C2C10C2CM30C5C2CM2CM15C3C41C6CM9CM3CM48C1_WEIGHT;
    -- sfix(1, -7)
    signal cm2cm10cm7c31c15cm43cm23cm4cm14cm21cm3cm13c9c5cm2c7_weight : PIPELINE_TYPE_FOR_CM2CM10CM7C31C15CM43CM23CM4CM14CM21CM3CM13C9C5CM2C7_WEIGHT;
    -- sfix(1, -7)
    signal cm1cm11c8cm4cm1cm19cm1c9cm9cm3c0cm37c7cm3cm1cm20_weight : PIPELINE_TYPE_FOR_CM1CM11C8CM4CM1CM19CM1C9CM9CM3C0CM37C7CM3CM1CM20_WEIGHT;
    -- sfix(1, -7)
    signal c25c0c0cm2cm1c9c2c6c4c1c5cm6cm17cm3c1c3_weight : PIPELINE_TYPE_FOR_C25C0C0CM2CM1C9C2C6C4C1C5CM6CM17CM3C1C3_WEIGHT;
    -- sfix(1, -7)
    signal cm4c4c4cm5cm3cm4cm17cm7cm16cm2c13cm2cm4cm2cm6cm4_weight : PIPELINE_TYPE_FOR_CM4C4C4CM5CM3CM4CM17CM7CM16CM2C13CM2CM4CM2CM6CM4_WEIGHT;
    -- sfix(1, -7)
    signal cm8c16c7cm3c49cm7cm8c7c3cm9cm15c4c10c6cm1c2_weight : PIPELINE_TYPE_FOR_CM8C16C7CM3C49CM7CM8C7C3CM9CM15C4C10C6CM1C2_WEIGHT;
    -- sfix(1, -7)
    signal cm1cm2c1cm1c18c6c19cm4cm1cm1cm13cm6cm5cm7c1cm1_weight : PIPELINE_TYPE_FOR_CM1CM2C1CM1C18C6C19CM4CM1CM1CM13CM6CM5CM7C1CM1_WEIGHT;
    -- sfix(1, -7)
    signal cm11cm27cm6c2cm13c5c11c3c2cm3c18cm1cm3c16cm15c0_weight : PIPELINE_TYPE_FOR_CM11CM27CM6C2CM13C5C11C3C2CM3C18CM1CM3C16CM15C0_WEIGHT;
    -- sfix(1, -7)
    signal c2c1c5c2c11c2cm11c1c0cm18c12cm3cm1cm5c6c2_weight : PIPELINE_TYPE_FOR_C2C1C5C2C11C2CM11C1C0CM18C12CM3CM1CM5C6C2_WEIGHT;
    -- sfix(1, -7)
    signal cm3cm1c3cm15cm30cm7c7cm8c11cm10cm20cm3cm1c0c16c1_weight : PIPELINE_TYPE_FOR_CM3CM1C3CM15CM30CM7C7CM8C11CM10CM20CM3CM1C0C16C1_WEIGHT;
    -- sfix(1, -7)
    signal cm1c1c12c11cm5cm1c9cm5cm2cm53c6cm47c1c11cm4c6_weight : PIPELINE_TYPE_FOR_CM1C1C12C11CM5CM1C9CM5CM2CM53C6CM47C1C11CM4C6_WEIGHT;
    -- sfix(1, -7)
    signal c4c2cm2cm2cm2c0c15c14cm9cm2c12c18cm4cm3cm8cm1_weight : PIPELINE_TYPE_FOR_C4C2CM2CM2CM2C0C15C14CM9CM2C12C18CM4CM3CM8CM1_WEIGHT;
    -- sfix(1, -7)
    signal cm1c4c9c6c11cm36cm4cm7cm1cm11cm18cm3c0cm8c20cm4_weight : PIPELINE_TYPE_FOR_CM1C4C9C6C11CM36CM4CM7CM1CM11CM18CM3C0CM8C20CM4_WEIGHT;
    -- sfix(1, -7)
    signal cm24cm4c0cm1cm3c5c10cm10cm12c16c4cm25c3cm8cm2c5_weight : PIPELINE_TYPE_FOR_CM24CM4C0CM1CM3C5C10CM10CM12C16C4CM25C3CM8CM2C5_WEIGHT;
    -- sfix(1, -7)
    signal c1c1c16cm19cm10c8cm6c2c7cm7c5c22cm2c4cm4cm9_weight : PIPELINE_TYPE_FOR_C1C1C16CM19CM10C8CM6C2C7CM7C5C22CM2C4CM4CM9_WEIGHT;
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



    WEIGHT_ROM: entity work.conv7_core8_rmcm_weightsconstant_memory
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
        
            dout1   => c11c7c13c6c3cm5c2c1c16cm1cm17c6cm19cm8cm11cm10_weight(0), 
            dout2   => c3c2c49c1cm3cm8cm1cm4cm23c4c16c5c3c7cm44c1_weight(0), 
            dout3   => cm22c6c15cm33cm7cm9cm3cm4cm24cm5c19c3cm14c5cm9c6_weight(0), 
            dout4   => c0c15cm11c11c8c5c9c1cm16c47c2cm13c0cm14cm4cm7_weight(0), 
            dout5   => cm3cm3cm9c1c9cm6cm1cm10c1c10cm3c10cm5c4cm14cm1_weight(0), 
            dout6   => cm57cm4c6c2c2cm2c9cm10cm6cm1cm12c3cm4cm1c0c0_weight(0), 
            dout7   => cm13c15cm3c4c15c7c13c6c19c4c2c3cm18cm2cm6c4_weight(0), 
            dout8   => cm4cm7cm5cm3cm10c6c10c34c0c16c18c8c5c2cm6c5_weight(0), 
            dout9   => cm2c3c6cm10c16c6c2cm7cm12cm26cm2c5c3c4cm7cm3_weight(0), 
            dout10   => cm17cm4c0cm6cm1c3cm4cm3c2c0c0c4cm21c5cm3cm19_weight(0), 
            dout11   => c9cm2c1c4c14c8c46c2cm7cm12cm11cm11c12c10c3cm3_weight(0), 
            dout12   => c1c24c7c1c7c0cm27c14cm5c0c3c2cm15cm9cm4c9_weight(0), 
            dout13   => c0cm3cm32c1c32cm10cm4c18c7cm16cm19cm1cm5cm9cm7c3_weight(0), 
            dout14   => c8c13c7c0c29c4cm6c5cm57c3cm1c3c19cm10c6c2_weight(0), 
            dout15   => c2cm5c7cm3c5cm6cm14c40cm6c0c32c0cm3cm5cm17c2_weight(0), 
            dout16   => c23cm4cm16cm2c1c7cm3c3cm29cm17c3cm8c2cm6c10cm7_weight(0), 
            dout17   => c2cm4c0cm1c3c9cm10c4c4c1c3c4cm6cm13c8cm12_weight(0), 
            dout18   => cm2c2c10c2cm30c5c2cm2cm15c3c41c6cm9cm3cm48c1_weight(0), 
            dout19   => cm2cm10cm7c31c15cm43cm23cm4cm14cm21cm3cm13c9c5cm2c7_weight(0), 
            dout20   => cm1cm11c8cm4cm1cm19cm1c9cm9cm3c0cm37c7cm3cm1cm20_weight(0), 
            dout21   => c25c0c0cm2cm1c9c2c6c4c1c5cm6cm17cm3c1c3_weight(0), 
            dout22   => cm4c4c4cm5cm3cm4cm17cm7cm16cm2c13cm2cm4cm2cm6cm4_weight(0), 
            dout23   => cm8c16c7cm3c49cm7cm8c7c3cm9cm15c4c10c6cm1c2_weight(0), 
            dout24   => cm1cm2c1cm1c18c6c19cm4cm1cm1cm13cm6cm5cm7c1cm1_weight(0), 
            dout25   => cm11cm27cm6c2cm13c5c11c3c2cm3c18cm1cm3c16cm15c0_weight(0), 
            dout26   => c2c1c5c2c11c2cm11c1c0cm18c12cm3cm1cm5c6c2_weight(0), 
            dout27   => cm3cm1c3cm15cm30cm7c7cm8c11cm10cm20cm3cm1c0c16c1_weight(0), 
            dout28   => cm1c1c12c11cm5cm1c9cm5cm2cm53c6cm47c1c11cm4c6_weight(0), 
            dout29   => c4c2cm2cm2cm2c0c15c14cm9cm2c12c18cm4cm3cm8cm1_weight(0), 
            dout30   => cm1c4c9c6c11cm36cm4cm7cm1cm11cm18cm3c0cm8c20cm4_weight(0), 
            dout31   => cm24cm4c0cm1cm3c5c10cm10cm12c16c4cm25c3cm8cm2c5_weight(0), 
            dout32   => c1c1c16cm19cm10c8cm6c2c7cm7c5c22cm2c4cm4cm9_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_c11c7c13c6c3cm5c2c1c16cm1cm17c6cm19cm8cm11cm10_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c11c7c13c6c3cm5c2c1c16cm1cm17c6cm19cm8cm11cm10_weight(0), c11c7c13c6c3cm5c2c1c16cm1cm17c6cm19cm8cm11cm10_weight(1));
    PL_STEP_0_for_c3c2c49c1cm3cm8cm1cm4cm23c4c16c5c3c7cm44c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c2c49c1cm3cm8cm1cm4cm23c4c16c5c3c7cm44c1_weight(0), c3c2c49c1cm3cm8cm1cm4cm23c4c16c5c3c7cm44c1_weight(1));
    PL_STEP_0_for_cm22c6c15cm33cm7cm9cm3cm4cm24cm5c19c3cm14c5cm9c6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm22c6c15cm33cm7cm9cm3cm4cm24cm5c19c3cm14c5cm9c6_weight(0), cm22c6c15cm33cm7cm9cm3cm4cm24cm5c19c3cm14c5cm9c6_weight(1));
    PL_STEP_0_for_c0c15cm11c11c8c5c9c1cm16c47c2cm13c0cm14cm4cm7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c15cm11c11c8c5c9c1cm16c47c2cm13c0cm14cm4cm7_weight(0), c0c15cm11c11c8c5c9c1cm16c47c2cm13c0cm14cm4cm7_weight(1));
    PL_STEP_0_for_cm3cm3cm9c1c9cm6cm1cm10c1c10cm3c10cm5c4cm14cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3cm3cm9c1c9cm6cm1cm10c1c10cm3c10cm5c4cm14cm1_weight(0), cm3cm3cm9c1c9cm6cm1cm10c1c10cm3c10cm5c4cm14cm1_weight(1));
    PL_STEP_0_for_cm57cm4c6c2c2cm2c9cm10cm6cm1cm12c3cm4cm1c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm57cm4c6c2c2cm2c9cm10cm6cm1cm12c3cm4cm1c0c0_weight(0), cm57cm4c6c2c2cm2c9cm10cm6cm1cm12c3cm4cm1c0c0_weight(1));
    PL_STEP_0_for_cm13c15cm3c4c15c7c13c6c19c4c2c3cm18cm2cm6c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm13c15cm3c4c15c7c13c6c19c4c2c3cm18cm2cm6c4_weight(0), cm13c15cm3c4c15c7c13c6c19c4c2c3cm18cm2cm6c4_weight(1));
    PL_STEP_0_for_cm4cm7cm5cm3cm10c6c10c34c0c16c18c8c5c2cm6c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4cm7cm5cm3cm10c6c10c34c0c16c18c8c5c2cm6c5_weight(0), cm4cm7cm5cm3cm10c6c10c34c0c16c18c8c5c2cm6c5_weight(1));
    PL_STEP_0_for_cm2c3c6cm10c16c6c2cm7cm12cm26cm2c5c3c4cm7cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c3c6cm10c16c6c2cm7cm12cm26cm2c5c3c4cm7cm3_weight(0), cm2c3c6cm10c16c6c2cm7cm12cm26cm2c5c3c4cm7cm3_weight(1));
    PL_STEP_0_for_cm17cm4c0cm6cm1c3cm4cm3c2c0c0c4cm21c5cm3cm19_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm17cm4c0cm6cm1c3cm4cm3c2c0c0c4cm21c5cm3cm19_weight(0), cm17cm4c0cm6cm1c3cm4cm3c2c0c0c4cm21c5cm3cm19_weight(1));
    PL_STEP_0_for_c9cm2c1c4c14c8c46c2cm7cm12cm11cm11c12c10c3cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c9cm2c1c4c14c8c46c2cm7cm12cm11cm11c12c10c3cm3_weight(0), c9cm2c1c4c14c8c46c2cm7cm12cm11cm11c12c10c3cm3_weight(1));
    PL_STEP_0_for_c1c24c7c1c7c0cm27c14cm5c0c3c2cm15cm9cm4c9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c24c7c1c7c0cm27c14cm5c0c3c2cm15cm9cm4c9_weight(0), c1c24c7c1c7c0cm27c14cm5c0c3c2cm15cm9cm4c9_weight(1));
    PL_STEP_0_for_c0cm3cm32c1c32cm10cm4c18c7cm16cm19cm1cm5cm9cm7c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm3cm32c1c32cm10cm4c18c7cm16cm19cm1cm5cm9cm7c3_weight(0), c0cm3cm32c1c32cm10cm4c18c7cm16cm19cm1cm5cm9cm7c3_weight(1));
    PL_STEP_0_for_c8c13c7c0c29c4cm6c5cm57c3cm1c3c19cm10c6c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c8c13c7c0c29c4cm6c5cm57c3cm1c3c19cm10c6c2_weight(0), c8c13c7c0c29c4cm6c5cm57c3cm1c3c19cm10c6c2_weight(1));
    PL_STEP_0_for_c2cm5c7cm3c5cm6cm14c40cm6c0c32c0cm3cm5cm17c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2cm5c7cm3c5cm6cm14c40cm6c0c32c0cm3cm5cm17c2_weight(0), c2cm5c7cm3c5cm6cm14c40cm6c0c32c0cm3cm5cm17c2_weight(1));
    PL_STEP_0_for_c23cm4cm16cm2c1c7cm3c3cm29cm17c3cm8c2cm6c10cm7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c23cm4cm16cm2c1c7cm3c3cm29cm17c3cm8c2cm6c10cm7_weight(0), c23cm4cm16cm2c1c7cm3c3cm29cm17c3cm8c2cm6c10cm7_weight(1));
    PL_STEP_0_for_c2cm4c0cm1c3c9cm10c4c4c1c3c4cm6cm13c8cm12_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2cm4c0cm1c3c9cm10c4c4c1c3c4cm6cm13c8cm12_weight(0), c2cm4c0cm1c3c9cm10c4c4c1c3c4cm6cm13c8cm12_weight(1));
    PL_STEP_0_for_cm2c2c10c2cm30c5c2cm2cm15c3c41c6cm9cm3cm48c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c2c10c2cm30c5c2cm2cm15c3c41c6cm9cm3cm48c1_weight(0), cm2c2c10c2cm30c5c2cm2cm15c3c41c6cm9cm3cm48c1_weight(1));
    PL_STEP_0_for_cm2cm10cm7c31c15cm43cm23cm4cm14cm21cm3cm13c9c5cm2c7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm10cm7c31c15cm43cm23cm4cm14cm21cm3cm13c9c5cm2c7_weight(0), cm2cm10cm7c31c15cm43cm23cm4cm14cm21cm3cm13c9c5cm2c7_weight(1));
    PL_STEP_0_for_cm1cm11c8cm4cm1cm19cm1c9cm9cm3c0cm37c7cm3cm1cm20_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm11c8cm4cm1cm19cm1c9cm9cm3c0cm37c7cm3cm1cm20_weight(0), cm1cm11c8cm4cm1cm19cm1c9cm9cm3c0cm37c7cm3cm1cm20_weight(1));
    PL_STEP_0_for_c25c0c0cm2cm1c9c2c6c4c1c5cm6cm17cm3c1c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c25c0c0cm2cm1c9c2c6c4c1c5cm6cm17cm3c1c3_weight(0), c25c0c0cm2cm1c9c2c6c4c1c5cm6cm17cm3c1c3_weight(1));
    PL_STEP_0_for_cm4c4c4cm5cm3cm4cm17cm7cm16cm2c13cm2cm4cm2cm6cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4c4c4cm5cm3cm4cm17cm7cm16cm2c13cm2cm4cm2cm6cm4_weight(0), cm4c4c4cm5cm3cm4cm17cm7cm16cm2c13cm2cm4cm2cm6cm4_weight(1));
    PL_STEP_0_for_cm8c16c7cm3c49cm7cm8c7c3cm9cm15c4c10c6cm1c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm8c16c7cm3c49cm7cm8c7c3cm9cm15c4c10c6cm1c2_weight(0), cm8c16c7cm3c49cm7cm8c7c3cm9cm15c4c10c6cm1c2_weight(1));
    PL_STEP_0_for_cm1cm2c1cm1c18c6c19cm4cm1cm1cm13cm6cm5cm7c1cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm2c1cm1c18c6c19cm4cm1cm1cm13cm6cm5cm7c1cm1_weight(0), cm1cm2c1cm1c18c6c19cm4cm1cm1cm13cm6cm5cm7c1cm1_weight(1));
    PL_STEP_0_for_cm11cm27cm6c2cm13c5c11c3c2cm3c18cm1cm3c16cm15c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm11cm27cm6c2cm13c5c11c3c2cm3c18cm1cm3c16cm15c0_weight(0), cm11cm27cm6c2cm13c5c11c3c2cm3c18cm1cm3c16cm15c0_weight(1));
    PL_STEP_0_for_c2c1c5c2c11c2cm11c1c0cm18c12cm3cm1cm5c6c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c1c5c2c11c2cm11c1c0cm18c12cm3cm1cm5c6c2_weight(0), c2c1c5c2c11c2cm11c1c0cm18c12cm3cm1cm5c6c2_weight(1));
    PL_STEP_0_for_cm3cm1c3cm15cm30cm7c7cm8c11cm10cm20cm3cm1c0c16c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3cm1c3cm15cm30cm7c7cm8c11cm10cm20cm3cm1c0c16c1_weight(0), cm3cm1c3cm15cm30cm7c7cm8c11cm10cm20cm3cm1c0c16c1_weight(1));
    PL_STEP_0_for_cm1c1c12c11cm5cm1c9cm5cm2cm53c6cm47c1c11cm4c6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c1c12c11cm5cm1c9cm5cm2cm53c6cm47c1c11cm4c6_weight(0), cm1c1c12c11cm5cm1c9cm5cm2cm53c6cm47c1c11cm4c6_weight(1));
    PL_STEP_0_for_c4c2cm2cm2cm2c0c15c14cm9cm2c12c18cm4cm3cm8cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4c2cm2cm2cm2c0c15c14cm9cm2c12c18cm4cm3cm8cm1_weight(0), c4c2cm2cm2cm2c0c15c14cm9cm2c12c18cm4cm3cm8cm1_weight(1));
    PL_STEP_0_for_cm1c4c9c6c11cm36cm4cm7cm1cm11cm18cm3c0cm8c20cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c4c9c6c11cm36cm4cm7cm1cm11cm18cm3c0cm8c20cm4_weight(0), cm1c4c9c6c11cm36cm4cm7cm1cm11cm18cm3c0cm8c20cm4_weight(1));
    PL_STEP_0_for_cm24cm4c0cm1cm3c5c10cm10cm12c16c4cm25c3cm8cm2c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm24cm4c0cm1cm3c5c10cm10cm12c16c4cm25c3cm8cm2c5_weight(0), cm24cm4c0cm1cm3c5c10cm10cm12c16c4cm25c3cm8cm2c5_weight(1));
    PL_STEP_0_for_c1c1c16cm19cm10c8cm6c2c7cm7c5c22cm2c4cm4cm9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c1c16cm19cm10c8cm6c2c7cm7c5c22cm2c4cm4cm9_weight(0), c1c1c16cm19cm10c8cm6c2c7cm7c5c22cm2c4cm4cm9_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    c3c2c49c1cm3cm8cm1cm4cm23c4c16c5c3c7cm44c1_c2cm4c0cm1c3c9cm10c4c4c1c3c4cm6cm13c8cm12_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c3c2c49c1cm3cm8cm1cm4cm23c4c16c5c3c7cm44c1_weight(1)(7-1 downto 0),
			B	=> c2cm4c0cm1c3c9cm10c4c4c1c3c4cm6cm13c8cm12_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c3c2c49c1cm3cm8cm1cm4cm23c4c16c5c3c7cm44c1,
			CxB => R_c2cm4c0cm1c3c9cm10c4c4c1c3c4cm6cm13c8cm12
		);

    cm22c6c15cm33cm7cm9cm3cm4cm24cm5c19c3cm14c5cm9c6_cm3cm3cm9c1c9cm6cm1cm10c1c10cm3c10cm5c4cm14cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm22c6c15cm33cm7cm9cm3cm4cm24cm5c19c3cm14c5cm9c6_weight(1)(7-1 downto 0),
			B	=> cm3cm3cm9c1c9cm6cm1cm10c1c10cm3c10cm5c4cm14cm1_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm22c6c15cm33cm7cm9cm3cm4cm24cm5c19c3cm14c5cm9c6,
			CxB => R_cm3cm3cm9c1c9cm6cm1cm10c1c10cm3c10cm5c4cm14cm1
		);

    c0c15cm11c11c8c5c9c1cm16c47c2cm13c0cm14cm4cm7_c1c1c16cm19cm10c8cm6c2c7cm7c5c22cm2c4cm4cm9_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0c15cm11c11c8c5c9c1cm16c47c2cm13c0cm14cm4cm7_weight(1)(7-1 downto 0),
			B	=> c1c1c16cm19cm10c8cm6c2c7cm7c5c22cm2c4cm4cm9_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c15cm11c11c8c5c9c1cm16c47c2cm13c0cm14cm4cm7,
			CxB => R_c1c1c16cm19cm10c8cm6c2c7cm7c5c22cm2c4cm4cm9
		);

    cm57cm4c6c2c2cm2c9cm10cm6cm1cm12c3cm4cm1c0c0_cm24cm4c0cm1cm3c5c10cm10cm12c16c4cm25c3cm8cm2c5_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm57cm4c6c2c2cm2c9cm10cm6cm1cm12c3cm4cm1c0c0_weight(1)(7-1 downto 0),
			B	=> cm24cm4c0cm1cm3c5c10cm10cm12c16c4cm25c3cm8cm2c5_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm57cm4c6c2c2cm2c9cm10cm6cm1cm12c3cm4cm1c0c0,
			CxB => R_cm24cm4c0cm1cm3c5c10cm10cm12c16c4cm25c3cm8cm2c5
		);

    cm4cm7cm5cm3cm10c6c10c34c0c16c18c8c5c2cm6c5_c4c2cm2cm2cm2c0c15c14cm9cm2c12c18cm4cm3cm8cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm4cm7cm5cm3cm10c6c10c34c0c16c18c8c5c2cm6c5_weight(1)(7-1 downto 0),
			B	=> c4c2cm2cm2cm2c0c15c14cm9cm2c12c18cm4cm3cm8cm1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm4cm7cm5cm3cm10c6c10c34c0c16c18c8c5c2cm6c5,
			CxB => R_c4c2cm2cm2cm2c0c15c14cm9cm2c12c18cm4cm3cm8cm1
		);

    c9cm2c1c4c14c8c46c2cm7cm12cm11cm11c12c10c3cm3_cm3cm1c3cm15cm30cm7c7cm8c11cm10cm20cm3cm1c0c16c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c9cm2c1c4c14c8c46c2cm7cm12cm11cm11c12c10c3cm3_weight(1)(7-1 downto 0),
			B	=> cm3cm1c3cm15cm30cm7c7cm8c11cm10cm20cm3cm1c0c16c1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c9cm2c1c4c14c8c46c2cm7cm12cm11cm11c12c10c3cm3,
			CxB => R_cm3cm1c3cm15cm30cm7c7cm8c11cm10cm20cm3cm1c0c16c1
		);

    c0cm3cm32c1c32cm10cm4c18c7cm16cm19cm1cm5cm9cm7c3_c2c1c5c2c11c2cm11c1c0cm18c12cm3cm1cm5c6c2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0cm3cm32c1c32cm10cm4c18c7cm16cm19cm1cm5cm9cm7c3_weight(1)(7-1 downto 0),
			B	=> c2c1c5c2c11c2cm11c1c0cm18c12cm3cm1cm5c6c2_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0cm3cm32c1c32cm10cm4c18c7cm16cm19cm1cm5cm9cm7c3,
			CxB => R_c2c1c5c2c11c2cm11c1c0cm18c12cm3cm1cm5c6c2
		);

    c8c13c7c0c29c4cm6c5cm57c3cm1c3c19cm10c6c2_cm11cm27cm6c2cm13c5c11c3c2cm3c18cm1cm3c16cm15c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c8c13c7c0c29c4cm6c5cm57c3cm1c3c19cm10c6c2_weight(1)(7-1 downto 0),
			B	=> cm11cm27cm6c2cm13c5c11c3c2cm3c18cm1cm3c16cm15c0_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c8c13c7c0c29c4cm6c5cm57c3cm1c3c19cm10c6c2,
			CxB => R_cm11cm27cm6c2cm13c5c11c3c2cm3c18cm1cm3c16cm15c0
		);

    c2cm5c7cm3c5cm6cm14c40cm6c0c32c0cm3cm5cm17c2_cm1cm2c1cm1c18c6c19cm4cm1cm1cm13cm6cm5cm7c1cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c2cm5c7cm3c5cm6cm14c40cm6c0c32c0cm3cm5cm17c2_weight(1)(7-1 downto 0),
			B	=> cm1cm2c1cm1c18c6c19cm4cm1cm1cm13cm6cm5cm7c1cm1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c2cm5c7cm3c5cm6cm14c40cm6c0c32c0cm3cm5cm17c2,
			CxB => R_cm1cm2c1cm1c18c6c19cm4cm1cm1cm13cm6cm5cm7c1cm1
		);

    cm2c2c10c2cm30c5c2cm2cm15c3c41c6cm9cm3cm48c1_cm4c4c4cm5cm3cm4cm17cm7cm16cm2c13cm2cm4cm2cm6cm4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2c2c10c2cm30c5c2cm2cm15c3c41c6cm9cm3cm48c1_weight(1)(7-1 downto 0),
			B	=> cm4c4c4cm5cm3cm4cm17cm7cm16cm2c13cm2cm4cm2cm6cm4_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2c2c10c2cm30c5c2cm2cm15c3c41c6cm9cm3cm48c1,
			CxB => R_cm4c4c4cm5cm3cm4cm17cm7cm16cm2c13cm2cm4cm2cm6cm4
		);

    cm2cm10cm7c31c15cm43cm23cm4cm14cm21cm3cm13c9c5cm2c7_c25c0c0cm2cm1c9c2c6c4c1c5cm6cm17cm3c1c3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2cm10cm7c31c15cm43cm23cm4cm14cm21cm3cm13c9c5cm2c7_weight(1)(7-1 downto 0),
			B	=> c25c0c0cm2cm1c9c2c6c4c1c5cm6cm17cm3c1c3_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2cm10cm7c31c15cm43cm23cm4cm14cm21cm3cm13c9c5cm2c7,
			CxB => R_c25c0c0cm2cm1c9c2c6c4c1c5cm6cm17cm3c1c3
		);

    cm1cm11c8cm4cm1cm19cm1c9cm9cm3c0cm37c7cm3cm1cm20_c23cm4cm16cm2c1c7cm3c3cm29cm17c3cm8c2cm6c10cm7_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm1cm11c8cm4cm1cm19cm1c9cm9cm3c0cm37c7cm3cm1cm20_weight(1)(7-1 downto 0),
			B	=> c23cm4cm16cm2c1c7cm3c3cm29cm17c3cm8c2cm6c10cm7_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1cm11c8cm4cm1cm19cm1c9cm9cm3c0cm37c7cm3cm1cm20,
			CxB => R_c23cm4cm16cm2c1c7cm3c3cm29cm17c3cm8c2cm6c10cm7
		);

    cm8c16c7cm3c49cm7cm8c7c3cm9cm15c4c10c6cm1c2_c1c24c7c1c7c0cm27c14cm5c0c3c2cm15cm9cm4c9_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm8c16c7cm3c49cm7cm8c7c3cm9cm15c4c10c6cm1c2_weight(1)(7-1 downto 0),
			B	=> c1c24c7c1c7c0cm27c14cm5c0c3c2cm15cm9cm4c9_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm8c16c7cm3c49cm7cm8c7c3cm9cm15c4c10c6cm1c2,
			CxB => R_c1c24c7c1c7c0cm27c14cm5c0c3c2cm15cm9cm4c9
		);

    cm1c1c12c11cm5cm1c9cm5cm2cm53c6cm47c1c11cm4c6_cm17cm4c0cm6cm1c3cm4cm3c2c0c0c4cm21c5cm3cm19_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm1c1c12c11cm5cm1c9cm5cm2cm53c6cm47c1c11cm4c6_weight(1)(7-1 downto 0),
			B	=> cm17cm4c0cm6cm1c3cm4cm3c2c0c0c4cm21c5cm3cm19_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1c1c12c11cm5cm1c9cm5cm2cm53c6cm47c1c11cm4c6,
			CxB => R_cm17cm4c0cm6cm1c3cm4cm3c2c0c0c4cm21c5cm3cm19
		);

    cm1c4c9c6c11cm36cm4cm7cm1cm11cm18cm3c0cm8c20cm4_cm2c3c6cm10c16c6c2cm7cm12cm26cm2c5c3c4cm7cm3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm1c4c9c6c11cm36cm4cm7cm1cm11cm18cm3c0cm8c20cm4_weight(1)(7-1 downto 0),
			B	=> cm2c3c6cm10c16c6c2cm7cm12cm26cm2c5c3c4cm7cm3_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1c4c9c6c11cm36cm4cm7cm1cm11cm18cm3c0cm8c20cm4,
			CxB => R_cm2c3c6cm10c16c6c2cm7cm12cm26cm2c5c3c4cm7cm3
		);

    c11c7c13c6c3cm5c2c1c16cm1cm17c6cm19cm8cm11cm10_cm13c15cm3c4c15c7c13c6c19c4c2c3cm18cm2cm6c4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c11c7c13c6c3cm5c2c1c16cm1cm17c6cm19cm8cm11cm10_weight(1)(6-1 downto 0),
			B	=> cm13c15cm3c4c15c7c13c6c19c4c2c3cm18cm2cm6c4_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c11c7c13c6c3cm5c2c1c16cm1cm17c6cm19cm8cm11cm10,
			CxB => R_cm13c15cm3c4c15c7c13c6c19c4c2c3cm18cm2cm6c4
		);




end architecture;
