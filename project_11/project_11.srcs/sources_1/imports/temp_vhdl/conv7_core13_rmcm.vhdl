library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core13_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        R_cm2cm2c1c0cm7c6c0cm4c5c4cm8c5cm2c13c3c8 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_c9cm11c0c44c6cm9cm3cm7c10cm22cm1c36cm36c0cm9cm1 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c2c9c2cm8c1c2c1c5cm4c4c0c1cm33c5c11c5 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c66c3cm1c1cm7cm2c30cm3c4c1c12c9c7cm9cm17cm1 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c12cm20c4cm3cm13cm6cm3c45cm4c7c0c24c4c0c15c6 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c9cm16cm34cm29c8cm2c32c2c0cm2cm8c3c4c3c7c10 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c5c20cm1cm20c35cm2c3c36cm5c6c1c2cm14c4c2cm4 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm33cm1c8c15c5c25cm1cm37cm11c1c4c10c1c3cm8cm1 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm6cm1c0cm7cm7c17cm34cm2c21c7cm5cm10cm5c10c11cm12 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm5c2c16cm4cm11cm3cm2cm8cm7cm2cm10c22c5cm6c5c3 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm29c11cm17c10cm43cm3c11cm18c4cm13cm16cm5c11cm10c3cm2 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c3c1c14c12c5c0c4c2cm1cm2c15cm5c14cm6cm4cm6 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_c5c5cm4cm3c7c16cm11cm17cm20c10c7c0c5c1cm40cm3 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm4cm18cm23c22c17cm1cm9cm2cm16cm2c1c3cm12c21c2c4 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm3cm1c12c3cm6cm2c10cm10c0cm7c9c1cm1c1c8c0 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_c1cm74cm5cm14c4cm2cm3cm15c0c12cm2c12c2cm4cm5cm7 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c15c55c18c8c3cm22cm6cm19c14c13c3cm26cm6c5cm5cm11 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm6cm12c7cm4cm38c4c4cm13cm18c0c9c1c7c0c8c3 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c4cm1cm22cm1cm22cm2cm18cm6cm24cm9cm8c8cm4cm22c8c48 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c8cm5c21cm9c5c52c0cm5cm1c14c1cm9cm10c7c4c19 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c2cm8c6cm9c3cm4c8cm3cm2cm23c3c18c6c1c13cm1 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm5cm22c7cm12c3c2cm12c14cm12cm3c22cm27c4cm3cm4c3 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c13c4cm19cm30cm38cm9c5c13cm10cm5c1c4c1c38cm5c2 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm6cm16cm17c1cm4cm24cm9c4c34cm16cm18c0c0c26c8c0 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm8c0cm5cm12cm1cm8cm81cm3c9c1c7cm6cm16c4cm1c5 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_cm104c1c2c32cm33cm4cm18c9cm11cm6cm18c1c2c25c1c0 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_cm4c0c3c3c3c0cm9cm1cm1c1c3c6c6c21cm11cm1 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c53c0cm53cm2c21c0c116c4c6cm21c14c7cm8c6c13cm3 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_cm13cm5cm4cm5cm14cm14c11c2cm8c3c2cm1c6c1c3cm8 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_c1cm4c3c2c1cm16c1c0cm12cm5c5cm1cm3cm2c1c0 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_c3cm10c0c8cm17c18cm15cm13cm5cm16c1c6cm49c6c3cm23 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c33cm8c0c2cm8cm31c3cm27cm4cm21cm6cm1cm1cm11c15cm8 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(11-1 downto 0)  --	sfix(1, -10)
    );
end conv7_core13_rmcm;

architecture arch of conv7_core13_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM2C1C0CM7C6C0CM4C5C4CM8C5CM2C13C3C8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C9CM11C0C44C6CM9CM3CM7C10CM22CM1C36CM36C0CM9CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C9C2CM8C1C2C1C5CM4C4C0C1CM33C5C11C5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C66C3CM1C1CM7CM2C30CM3C4C1C12C9C7CM9CM17CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C12CM20C4CM3CM13CM6CM3C45CM4C7C0C24C4C0C15C6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C9CM16CM34CM29C8CM2C32C2C0CM2CM8C3C4C3C7C10_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5C20CM1CM20C35CM2C3C36CM5C6C1C2CM14C4C2CM4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM33CM1C8C15C5C25CM1CM37CM11C1C4C10C1C3CM8CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6CM1C0CM7CM7C17CM34CM2C21C7CM5CM10CM5C10C11CM12_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5C2C16CM4CM11CM3CM2CM8CM7CM2CM10C22C5CM6C5C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM29C11CM17C10CM43CM3C11CM18C4CM13CM16CM5C11CM10C3CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C1C14C12C5C0C4C2CM1CM2C15CM5C14CM6CM4CM6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5C5CM4CM3C7C16CM11CM17CM20C10C7C0C5C1CM40CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4CM18CM23C22C17CM1CM9CM2CM16CM2C1C3CM12C21C2C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3CM1C12C3CM6CM2C10CM10C0CM7C9C1CM1C1C8C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM74CM5CM14C4CM2CM3CM15C0C12CM2C12C2CM4CM5CM7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C15C55C18C8C3CM22CM6CM19C14C13C3CM26CM6C5CM5CM11_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6CM12C7CM4CM38C4C4CM13CM18C0C9C1C7C0C8C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4CM1CM22CM1CM22CM2CM18CM6CM24CM9CM8C8CM4CM22C8C48_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C8CM5C21CM9C5C52C0CM5CM1C14C1CM9CM10C7C4C19_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2CM8C6CM9C3CM4C8CM3CM2CM23C3C18C6C1C13CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5CM22C7CM12C3C2CM12C14CM12CM3C22CM27C4CM3CM4C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C13C4CM19CM30CM38CM9C5C13CM10CM5C1C4C1C38CM5C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6CM16CM17C1CM4CM24CM9C4C34CM16CM18C0C0C26C8C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM8C0CM5CM12CM1CM8CM81CM3C9C1C7CM6CM16C4CM1C5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM104C1C2C32CM33CM4CM18C9CM11CM6CM18C1C2C25C1C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4C0C3C3C3C0CM9CM1CM1C1C3C6C6C21CM11CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C53C0CM53CM2C21C0C116C4C6CM21C14C7CM8C6C13CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM13CM5CM4CM5CM14CM14C11C2CM8C3C2CM1C6C1C3CM8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM4C3C2C1CM16C1C0CM12CM5C5CM1CM3CM2C1C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3CM10C0C8CM17C18CM15CM13CM5CM16C1C6CM49C6C3CM23_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C33CM8C0C2CM8CM31C3CM27CM4CM21CM6CM1CM1CM11C15CM8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(4, -3)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(1, -7)
    signal cm2cm2c1c0cm7c6c0cm4c5c4cm8c5cm2c13c3c8_weight : PIPELINE_TYPE_FOR_CM2CM2C1C0CM7C6C0CM4C5C4CM8C5CM2C13C3C8_WEIGHT;
    -- sfix(1, -7)
    signal c9cm11c0c44c6cm9cm3cm7c10cm22cm1c36cm36c0cm9cm1_weight : PIPELINE_TYPE_FOR_C9CM11C0C44C6CM9CM3CM7C10CM22CM1C36CM36C0CM9CM1_WEIGHT;
    -- sfix(1, -7)
    signal c2c9c2cm8c1c2c1c5cm4c4c0c1cm33c5c11c5_weight : PIPELINE_TYPE_FOR_C2C9C2CM8C1C2C1C5CM4C4C0C1CM33C5C11C5_WEIGHT;
    -- sfix(1, -7)
    signal c66c3cm1c1cm7cm2c30cm3c4c1c12c9c7cm9cm17cm1_weight : PIPELINE_TYPE_FOR_C66C3CM1C1CM7CM2C30CM3C4C1C12C9C7CM9CM17CM1_WEIGHT;
    -- sfix(1, -7)
    signal c12cm20c4cm3cm13cm6cm3c45cm4c7c0c24c4c0c15c6_weight : PIPELINE_TYPE_FOR_C12CM20C4CM3CM13CM6CM3C45CM4C7C0C24C4C0C15C6_WEIGHT;
    -- sfix(1, -7)
    signal c9cm16cm34cm29c8cm2c32c2c0cm2cm8c3c4c3c7c10_weight : PIPELINE_TYPE_FOR_C9CM16CM34CM29C8CM2C32C2C0CM2CM8C3C4C3C7C10_WEIGHT;
    -- sfix(1, -7)
    signal c5c20cm1cm20c35cm2c3c36cm5c6c1c2cm14c4c2cm4_weight : PIPELINE_TYPE_FOR_C5C20CM1CM20C35CM2C3C36CM5C6C1C2CM14C4C2CM4_WEIGHT;
    -- sfix(1, -7)
    signal cm33cm1c8c15c5c25cm1cm37cm11c1c4c10c1c3cm8cm1_weight : PIPELINE_TYPE_FOR_CM33CM1C8C15C5C25CM1CM37CM11C1C4C10C1C3CM8CM1_WEIGHT;
    -- sfix(1, -7)
    signal cm6cm1c0cm7cm7c17cm34cm2c21c7cm5cm10cm5c10c11cm12_weight : PIPELINE_TYPE_FOR_CM6CM1C0CM7CM7C17CM34CM2C21C7CM5CM10CM5C10C11CM12_WEIGHT;
    -- sfix(1, -7)
    signal cm5c2c16cm4cm11cm3cm2cm8cm7cm2cm10c22c5cm6c5c3_weight : PIPELINE_TYPE_FOR_CM5C2C16CM4CM11CM3CM2CM8CM7CM2CM10C22C5CM6C5C3_WEIGHT;
    -- sfix(1, -7)
    signal cm29c11cm17c10cm43cm3c11cm18c4cm13cm16cm5c11cm10c3cm2_weight : PIPELINE_TYPE_FOR_CM29C11CM17C10CM43CM3C11CM18C4CM13CM16CM5C11CM10C3CM2_WEIGHT;
    -- sfix(1, -7)
    signal c3c1c14c12c5c0c4c2cm1cm2c15cm5c14cm6cm4cm6_weight : PIPELINE_TYPE_FOR_C3C1C14C12C5C0C4C2CM1CM2C15CM5C14CM6CM4CM6_WEIGHT;
    -- sfix(1, -7)
    signal c5c5cm4cm3c7c16cm11cm17cm20c10c7c0c5c1cm40cm3_weight : PIPELINE_TYPE_FOR_C5C5CM4CM3C7C16CM11CM17CM20C10C7C0C5C1CM40CM3_WEIGHT;
    -- sfix(1, -7)
    signal cm4cm18cm23c22c17cm1cm9cm2cm16cm2c1c3cm12c21c2c4_weight : PIPELINE_TYPE_FOR_CM4CM18CM23C22C17CM1CM9CM2CM16CM2C1C3CM12C21C2C4_WEIGHT;
    -- sfix(1, -7)
    signal cm3cm1c12c3cm6cm2c10cm10c0cm7c9c1cm1c1c8c0_weight : PIPELINE_TYPE_FOR_CM3CM1C12C3CM6CM2C10CM10C0CM7C9C1CM1C1C8C0_WEIGHT;
    -- sfix(1, -7)
    signal c1cm74cm5cm14c4cm2cm3cm15c0c12cm2c12c2cm4cm5cm7_weight : PIPELINE_TYPE_FOR_C1CM74CM5CM14C4CM2CM3CM15C0C12CM2C12C2CM4CM5CM7_WEIGHT;
    -- sfix(1, -7)
    signal c15c55c18c8c3cm22cm6cm19c14c13c3cm26cm6c5cm5cm11_weight : PIPELINE_TYPE_FOR_C15C55C18C8C3CM22CM6CM19C14C13C3CM26CM6C5CM5CM11_WEIGHT;
    -- sfix(1, -7)
    signal cm6cm12c7cm4cm38c4c4cm13cm18c0c9c1c7c0c8c3_weight : PIPELINE_TYPE_FOR_CM6CM12C7CM4CM38C4C4CM13CM18C0C9C1C7C0C8C3_WEIGHT;
    -- sfix(1, -7)
    signal c4cm1cm22cm1cm22cm2cm18cm6cm24cm9cm8c8cm4cm22c8c48_weight : PIPELINE_TYPE_FOR_C4CM1CM22CM1CM22CM2CM18CM6CM24CM9CM8C8CM4CM22C8C48_WEIGHT;
    -- sfix(1, -7)
    signal c8cm5c21cm9c5c52c0cm5cm1c14c1cm9cm10c7c4c19_weight : PIPELINE_TYPE_FOR_C8CM5C21CM9C5C52C0CM5CM1C14C1CM9CM10C7C4C19_WEIGHT;
    -- sfix(1, -7)
    signal c2cm8c6cm9c3cm4c8cm3cm2cm23c3c18c6c1c13cm1_weight : PIPELINE_TYPE_FOR_C2CM8C6CM9C3CM4C8CM3CM2CM23C3C18C6C1C13CM1_WEIGHT;
    -- sfix(1, -7)
    signal cm5cm22c7cm12c3c2cm12c14cm12cm3c22cm27c4cm3cm4c3_weight : PIPELINE_TYPE_FOR_CM5CM22C7CM12C3C2CM12C14CM12CM3C22CM27C4CM3CM4C3_WEIGHT;
    -- sfix(1, -7)
    signal c13c4cm19cm30cm38cm9c5c13cm10cm5c1c4c1c38cm5c2_weight : PIPELINE_TYPE_FOR_C13C4CM19CM30CM38CM9C5C13CM10CM5C1C4C1C38CM5C2_WEIGHT;
    -- sfix(1, -7)
    signal cm6cm16cm17c1cm4cm24cm9c4c34cm16cm18c0c0c26c8c0_weight : PIPELINE_TYPE_FOR_CM6CM16CM17C1CM4CM24CM9C4C34CM16CM18C0C0C26C8C0_WEIGHT;
    -- sfix(1, -7)
    signal cm8c0cm5cm12cm1cm8cm81cm3c9c1c7cm6cm16c4cm1c5_weight : PIPELINE_TYPE_FOR_CM8C0CM5CM12CM1CM8CM81CM3C9C1C7CM6CM16C4CM1C5_WEIGHT;
    -- sfix(1, -7)
    signal cm104c1c2c32cm33cm4cm18c9cm11cm6cm18c1c2c25c1c0_weight : PIPELINE_TYPE_FOR_CM104C1C2C32CM33CM4CM18C9CM11CM6CM18C1C2C25C1C0_WEIGHT;
    -- sfix(1, -7)
    signal cm4c0c3c3c3c0cm9cm1cm1c1c3c6c6c21cm11cm1_weight : PIPELINE_TYPE_FOR_CM4C0C3C3C3C0CM9CM1CM1C1C3C6C6C21CM11CM1_WEIGHT;
    -- sfix(1, -7)
    signal c53c0cm53cm2c21c0c116c4c6cm21c14c7cm8c6c13cm3_weight : PIPELINE_TYPE_FOR_C53C0CM53CM2C21C0C116C4C6CM21C14C7CM8C6C13CM3_WEIGHT;
    -- sfix(1, -7)
    signal cm13cm5cm4cm5cm14cm14c11c2cm8c3c2cm1c6c1c3cm8_weight : PIPELINE_TYPE_FOR_CM13CM5CM4CM5CM14CM14C11C2CM8C3C2CM1C6C1C3CM8_WEIGHT;
    -- sfix(1, -7)
    signal c1cm4c3c2c1cm16c1c0cm12cm5c5cm1cm3cm2c1c0_weight : PIPELINE_TYPE_FOR_C1CM4C3C2C1CM16C1C0CM12CM5C5CM1CM3CM2C1C0_WEIGHT;
    -- sfix(1, -7)
    signal c3cm10c0c8cm17c18cm15cm13cm5cm16c1c6cm49c6c3cm23_weight : PIPELINE_TYPE_FOR_C3CM10C0C8CM17C18CM15CM13CM5CM16C1C6CM49C6C3CM23_WEIGHT;
    -- sfix(1, -7)
    signal c33cm8c0c2cm8cm31c3cm27cm4cm21cm6cm1cm1cm11c15cm8_weight : PIPELINE_TYPE_FOR_C33CM8C0C2CM8CM31C3CM27CM4CM21CM6CM1CM1CM11C15CM8_WEIGHT;
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



    WEIGHT_ROM: entity work.conv7_core13_rmcm_weightsconstant_memory
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
        
            dout1   => cm2cm2c1c0cm7c6c0cm4c5c4cm8c5cm2c13c3c8_weight(0), 
            dout2   => c9cm11c0c44c6cm9cm3cm7c10cm22cm1c36cm36c0cm9cm1_weight(0), 
            dout3   => c2c9c2cm8c1c2c1c5cm4c4c0c1cm33c5c11c5_weight(0), 
            dout4   => c66c3cm1c1cm7cm2c30cm3c4c1c12c9c7cm9cm17cm1_weight(0), 
            dout5   => c12cm20c4cm3cm13cm6cm3c45cm4c7c0c24c4c0c15c6_weight(0), 
            dout6   => c9cm16cm34cm29c8cm2c32c2c0cm2cm8c3c4c3c7c10_weight(0), 
            dout7   => c5c20cm1cm20c35cm2c3c36cm5c6c1c2cm14c4c2cm4_weight(0), 
            dout8   => cm33cm1c8c15c5c25cm1cm37cm11c1c4c10c1c3cm8cm1_weight(0), 
            dout9   => cm6cm1c0cm7cm7c17cm34cm2c21c7cm5cm10cm5c10c11cm12_weight(0), 
            dout10   => cm5c2c16cm4cm11cm3cm2cm8cm7cm2cm10c22c5cm6c5c3_weight(0), 
            dout11   => cm29c11cm17c10cm43cm3c11cm18c4cm13cm16cm5c11cm10c3cm2_weight(0), 
            dout12   => c3c1c14c12c5c0c4c2cm1cm2c15cm5c14cm6cm4cm6_weight(0), 
            dout13   => c5c5cm4cm3c7c16cm11cm17cm20c10c7c0c5c1cm40cm3_weight(0), 
            dout14   => cm4cm18cm23c22c17cm1cm9cm2cm16cm2c1c3cm12c21c2c4_weight(0), 
            dout15   => cm3cm1c12c3cm6cm2c10cm10c0cm7c9c1cm1c1c8c0_weight(0), 
            dout16   => c1cm74cm5cm14c4cm2cm3cm15c0c12cm2c12c2cm4cm5cm7_weight(0), 
            dout17   => c15c55c18c8c3cm22cm6cm19c14c13c3cm26cm6c5cm5cm11_weight(0), 
            dout18   => cm6cm12c7cm4cm38c4c4cm13cm18c0c9c1c7c0c8c3_weight(0), 
            dout19   => c4cm1cm22cm1cm22cm2cm18cm6cm24cm9cm8c8cm4cm22c8c48_weight(0), 
            dout20   => c8cm5c21cm9c5c52c0cm5cm1c14c1cm9cm10c7c4c19_weight(0), 
            dout21   => c2cm8c6cm9c3cm4c8cm3cm2cm23c3c18c6c1c13cm1_weight(0), 
            dout22   => cm5cm22c7cm12c3c2cm12c14cm12cm3c22cm27c4cm3cm4c3_weight(0), 
            dout23   => c13c4cm19cm30cm38cm9c5c13cm10cm5c1c4c1c38cm5c2_weight(0), 
            dout24   => cm6cm16cm17c1cm4cm24cm9c4c34cm16cm18c0c0c26c8c0_weight(0), 
            dout25   => cm8c0cm5cm12cm1cm8cm81cm3c9c1c7cm6cm16c4cm1c5_weight(0), 
            dout26   => cm104c1c2c32cm33cm4cm18c9cm11cm6cm18c1c2c25c1c0_weight(0), 
            dout27   => cm4c0c3c3c3c0cm9cm1cm1c1c3c6c6c21cm11cm1_weight(0), 
            dout28   => c53c0cm53cm2c21c0c116c4c6cm21c14c7cm8c6c13cm3_weight(0), 
            dout29   => cm13cm5cm4cm5cm14cm14c11c2cm8c3c2cm1c6c1c3cm8_weight(0), 
            dout30   => c1cm4c3c2c1cm16c1c0cm12cm5c5cm1cm3cm2c1c0_weight(0), 
            dout31   => c3cm10c0c8cm17c18cm15cm13cm5cm16c1c6cm49c6c3cm23_weight(0), 
            dout32   => c33cm8c0c2cm8cm31c3cm27cm4cm21cm6cm1cm1cm11c15cm8_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_cm2cm2c1c0cm7c6c0cm4c5c4cm8c5cm2c13c3c8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm2c1c0cm7c6c0cm4c5c4cm8c5cm2c13c3c8_weight(0), cm2cm2c1c0cm7c6c0cm4c5c4cm8c5cm2c13c3c8_weight(1));
    PL_STEP_0_for_c9cm11c0c44c6cm9cm3cm7c10cm22cm1c36cm36c0cm9cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c9cm11c0c44c6cm9cm3cm7c10cm22cm1c36cm36c0cm9cm1_weight(0), c9cm11c0c44c6cm9cm3cm7c10cm22cm1c36cm36c0cm9cm1_weight(1));
    PL_STEP_0_for_c2c9c2cm8c1c2c1c5cm4c4c0c1cm33c5c11c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c9c2cm8c1c2c1c5cm4c4c0c1cm33c5c11c5_weight(0), c2c9c2cm8c1c2c1c5cm4c4c0c1cm33c5c11c5_weight(1));
    PL_STEP_0_for_c66c3cm1c1cm7cm2c30cm3c4c1c12c9c7cm9cm17cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c66c3cm1c1cm7cm2c30cm3c4c1c12c9c7cm9cm17cm1_weight(0), c66c3cm1c1cm7cm2c30cm3c4c1c12c9c7cm9cm17cm1_weight(1));
    PL_STEP_0_for_c12cm20c4cm3cm13cm6cm3c45cm4c7c0c24c4c0c15c6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c12cm20c4cm3cm13cm6cm3c45cm4c7c0c24c4c0c15c6_weight(0), c12cm20c4cm3cm13cm6cm3c45cm4c7c0c24c4c0c15c6_weight(1));
    PL_STEP_0_for_c9cm16cm34cm29c8cm2c32c2c0cm2cm8c3c4c3c7c10_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c9cm16cm34cm29c8cm2c32c2c0cm2cm8c3c4c3c7c10_weight(0), c9cm16cm34cm29c8cm2c32c2c0cm2cm8c3c4c3c7c10_weight(1));
    PL_STEP_0_for_c5c20cm1cm20c35cm2c3c36cm5c6c1c2cm14c4c2cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5c20cm1cm20c35cm2c3c36cm5c6c1c2cm14c4c2cm4_weight(0), c5c20cm1cm20c35cm2c3c36cm5c6c1c2cm14c4c2cm4_weight(1));
    PL_STEP_0_for_cm33cm1c8c15c5c25cm1cm37cm11c1c4c10c1c3cm8cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm33cm1c8c15c5c25cm1cm37cm11c1c4c10c1c3cm8cm1_weight(0), cm33cm1c8c15c5c25cm1cm37cm11c1c4c10c1c3cm8cm1_weight(1));
    PL_STEP_0_for_cm6cm1c0cm7cm7c17cm34cm2c21c7cm5cm10cm5c10c11cm12_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6cm1c0cm7cm7c17cm34cm2c21c7cm5cm10cm5c10c11cm12_weight(0), cm6cm1c0cm7cm7c17cm34cm2c21c7cm5cm10cm5c10c11cm12_weight(1));
    PL_STEP_0_for_cm5c2c16cm4cm11cm3cm2cm8cm7cm2cm10c22c5cm6c5c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5c2c16cm4cm11cm3cm2cm8cm7cm2cm10c22c5cm6c5c3_weight(0), cm5c2c16cm4cm11cm3cm2cm8cm7cm2cm10c22c5cm6c5c3_weight(1));
    PL_STEP_0_for_cm29c11cm17c10cm43cm3c11cm18c4cm13cm16cm5c11cm10c3cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm29c11cm17c10cm43cm3c11cm18c4cm13cm16cm5c11cm10c3cm2_weight(0), cm29c11cm17c10cm43cm3c11cm18c4cm13cm16cm5c11cm10c3cm2_weight(1));
    PL_STEP_0_for_c3c1c14c12c5c0c4c2cm1cm2c15cm5c14cm6cm4cm6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c1c14c12c5c0c4c2cm1cm2c15cm5c14cm6cm4cm6_weight(0), c3c1c14c12c5c0c4c2cm1cm2c15cm5c14cm6cm4cm6_weight(1));
    PL_STEP_0_for_c5c5cm4cm3c7c16cm11cm17cm20c10c7c0c5c1cm40cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5c5cm4cm3c7c16cm11cm17cm20c10c7c0c5c1cm40cm3_weight(0), c5c5cm4cm3c7c16cm11cm17cm20c10c7c0c5c1cm40cm3_weight(1));
    PL_STEP_0_for_cm4cm18cm23c22c17cm1cm9cm2cm16cm2c1c3cm12c21c2c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4cm18cm23c22c17cm1cm9cm2cm16cm2c1c3cm12c21c2c4_weight(0), cm4cm18cm23c22c17cm1cm9cm2cm16cm2c1c3cm12c21c2c4_weight(1));
    PL_STEP_0_for_cm3cm1c12c3cm6cm2c10cm10c0cm7c9c1cm1c1c8c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3cm1c12c3cm6cm2c10cm10c0cm7c9c1cm1c1c8c0_weight(0), cm3cm1c12c3cm6cm2c10cm10c0cm7c9c1cm1c1c8c0_weight(1));
    PL_STEP_0_for_c1cm74cm5cm14c4cm2cm3cm15c0c12cm2c12c2cm4cm5cm7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm74cm5cm14c4cm2cm3cm15c0c12cm2c12c2cm4cm5cm7_weight(0), c1cm74cm5cm14c4cm2cm3cm15c0c12cm2c12c2cm4cm5cm7_weight(1));
    PL_STEP_0_for_c15c55c18c8c3cm22cm6cm19c14c13c3cm26cm6c5cm5cm11_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c15c55c18c8c3cm22cm6cm19c14c13c3cm26cm6c5cm5cm11_weight(0), c15c55c18c8c3cm22cm6cm19c14c13c3cm26cm6c5cm5cm11_weight(1));
    PL_STEP_0_for_cm6cm12c7cm4cm38c4c4cm13cm18c0c9c1c7c0c8c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6cm12c7cm4cm38c4c4cm13cm18c0c9c1c7c0c8c3_weight(0), cm6cm12c7cm4cm38c4c4cm13cm18c0c9c1c7c0c8c3_weight(1));
    PL_STEP_0_for_c4cm1cm22cm1cm22cm2cm18cm6cm24cm9cm8c8cm4cm22c8c48_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4cm1cm22cm1cm22cm2cm18cm6cm24cm9cm8c8cm4cm22c8c48_weight(0), c4cm1cm22cm1cm22cm2cm18cm6cm24cm9cm8c8cm4cm22c8c48_weight(1));
    PL_STEP_0_for_c8cm5c21cm9c5c52c0cm5cm1c14c1cm9cm10c7c4c19_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c8cm5c21cm9c5c52c0cm5cm1c14c1cm9cm10c7c4c19_weight(0), c8cm5c21cm9c5c52c0cm5cm1c14c1cm9cm10c7c4c19_weight(1));
    PL_STEP_0_for_c2cm8c6cm9c3cm4c8cm3cm2cm23c3c18c6c1c13cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2cm8c6cm9c3cm4c8cm3cm2cm23c3c18c6c1c13cm1_weight(0), c2cm8c6cm9c3cm4c8cm3cm2cm23c3c18c6c1c13cm1_weight(1));
    PL_STEP_0_for_cm5cm22c7cm12c3c2cm12c14cm12cm3c22cm27c4cm3cm4c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5cm22c7cm12c3c2cm12c14cm12cm3c22cm27c4cm3cm4c3_weight(0), cm5cm22c7cm12c3c2cm12c14cm12cm3c22cm27c4cm3cm4c3_weight(1));
    PL_STEP_0_for_c13c4cm19cm30cm38cm9c5c13cm10cm5c1c4c1c38cm5c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c13c4cm19cm30cm38cm9c5c13cm10cm5c1c4c1c38cm5c2_weight(0), c13c4cm19cm30cm38cm9c5c13cm10cm5c1c4c1c38cm5c2_weight(1));
    PL_STEP_0_for_cm6cm16cm17c1cm4cm24cm9c4c34cm16cm18c0c0c26c8c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6cm16cm17c1cm4cm24cm9c4c34cm16cm18c0c0c26c8c0_weight(0), cm6cm16cm17c1cm4cm24cm9c4c34cm16cm18c0c0c26c8c0_weight(1));
    PL_STEP_0_for_cm8c0cm5cm12cm1cm8cm81cm3c9c1c7cm6cm16c4cm1c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm8c0cm5cm12cm1cm8cm81cm3c9c1c7cm6cm16c4cm1c5_weight(0), cm8c0cm5cm12cm1cm8cm81cm3c9c1c7cm6cm16c4cm1c5_weight(1));
    PL_STEP_0_for_cm104c1c2c32cm33cm4cm18c9cm11cm6cm18c1c2c25c1c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm104c1c2c32cm33cm4cm18c9cm11cm6cm18c1c2c25c1c0_weight(0), cm104c1c2c32cm33cm4cm18c9cm11cm6cm18c1c2c25c1c0_weight(1));
    PL_STEP_0_for_cm4c0c3c3c3c0cm9cm1cm1c1c3c6c6c21cm11cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4c0c3c3c3c0cm9cm1cm1c1c3c6c6c21cm11cm1_weight(0), cm4c0c3c3c3c0cm9cm1cm1c1c3c6c6c21cm11cm1_weight(1));
    PL_STEP_0_for_c53c0cm53cm2c21c0c116c4c6cm21c14c7cm8c6c13cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c53c0cm53cm2c21c0c116c4c6cm21c14c7cm8c6c13cm3_weight(0), c53c0cm53cm2c21c0c116c4c6cm21c14c7cm8c6c13cm3_weight(1));
    PL_STEP_0_for_cm13cm5cm4cm5cm14cm14c11c2cm8c3c2cm1c6c1c3cm8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm13cm5cm4cm5cm14cm14c11c2cm8c3c2cm1c6c1c3cm8_weight(0), cm13cm5cm4cm5cm14cm14c11c2cm8c3c2cm1c6c1c3cm8_weight(1));
    PL_STEP_0_for_c1cm4c3c2c1cm16c1c0cm12cm5c5cm1cm3cm2c1c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm4c3c2c1cm16c1c0cm12cm5c5cm1cm3cm2c1c0_weight(0), c1cm4c3c2c1cm16c1c0cm12cm5c5cm1cm3cm2c1c0_weight(1));
    PL_STEP_0_for_c3cm10c0c8cm17c18cm15cm13cm5cm16c1c6cm49c6c3cm23_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3cm10c0c8cm17c18cm15cm13cm5cm16c1c6cm49c6c3cm23_weight(0), c3cm10c0c8cm17c18cm15cm13cm5cm16c1c6cm49c6c3cm23_weight(1));
    PL_STEP_0_for_c33cm8c0c2cm8cm31c3cm27cm4cm21cm6cm1cm1cm11c15cm8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c33cm8c0c2cm8cm31c3cm27cm4cm21cm6cm1cm1cm11c15cm8_weight(0), c33cm8c0c2cm8cm31c3cm27cm4cm21cm6cm1cm1cm11c15cm8_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    c66c3cm1c1cm7cm2c30cm3c4c1c12c9c7cm9cm17cm1_c1cm4c3c2c1cm16c1c0cm12cm5c5cm1cm3cm2c1c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c66c3cm1c1cm7cm2c30cm3c4c1c12c9c7cm9cm17cm1_weight(1)(8-1 downto 0),
			B	=> c1cm4c3c2c1cm16c1c0cm12cm5c5cm1cm3cm2c1c0_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c66c3cm1c1cm7cm2c30cm3c4c1c12c9c7cm9cm17cm1,
			CxB => R_c1cm4c3c2c1cm16c1c0cm12cm5c5cm1cm3cm2c1c0
		);

    c1cm74cm5cm14c4cm2cm3cm15c0c12cm2c12c2cm4cm5cm7_cm13cm5cm4cm5cm14cm14c11c2cm8c3c2cm1c6c1c3cm8_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c1cm74cm5cm14c4cm2cm3cm15c0c12cm2c12c2cm4cm5cm7_weight(1)(8-1 downto 0),
			B	=> cm13cm5cm4cm5cm14cm14c11c2cm8c3c2cm1c6c1c3cm8_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1cm74cm5cm14c4cm2cm3cm15c0c12cm2c12c2cm4cm5cm7,
			CxB => R_cm13cm5cm4cm5cm14cm14c11c2cm8c3c2cm1c6c1c3cm8
		);

    cm8c0cm5cm12cm1cm8cm81cm3c9c1c7cm6cm16c4cm1c5_cm3cm1c12c3cm6cm2c10cm10c0cm7c9c1cm1c1c8c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm8c0cm5cm12cm1cm8cm81cm3c9c1c7cm6cm16c4cm1c5_weight(1)(8-1 downto 0),
			B	=> cm3cm1c12c3cm6cm2c10cm10c0cm7c9c1cm1c1c8c0_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm8c0cm5cm12cm1cm8cm81cm3c9c1c7cm6cm16c4cm1c5,
			CxB => R_cm3cm1c12c3cm6cm2c10cm10c0cm7c9c1cm1c1c8c0
		);

    cm104c1c2c32cm33cm4cm18c9cm11cm6cm18c1c2c25c1c0_c3c1c14c12c5c0c4c2cm1cm2c15cm5c14cm6cm4cm6_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm104c1c2c32cm33cm4cm18c9cm11cm6cm18c1c2c25c1c0_weight(1)(8-1 downto 0),
			B	=> c3c1c14c12c5c0c4c2cm1cm2c15cm5c14cm6cm4cm6_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm104c1c2c32cm33cm4cm18c9cm11cm6cm18c1c2c25c1c0,
			CxB => R_c3c1c14c12c5c0c4c2cm1cm2c15cm5c14cm6cm4cm6
		);

    c53c0cm53cm2c21c0c116c4c6cm21c14c7cm8c6c13cm3_cm2cm2c1c0cm7c6c0cm4c5c4cm8c5cm2c13c3c8_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c53c0cm53cm2c21c0c116c4c6cm21c14c7cm8c6c13cm3_weight(1)(8-1 downto 0),
			B	=> cm2cm2c1c0cm7c6c0cm4c5c4cm8c5cm2c13c3c8_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c53c0cm53cm2c21c0c116c4c6cm21c14c7cm8c6c13cm3,
			CxB => R_cm2cm2c1c0cm7c6c0cm4c5c4cm8c5cm2c13c3c8
		);

    c9cm11c0c44c6cm9cm3cm7c10cm22cm1c36cm36c0cm9cm1_cm4c0c3c3c3c0cm9cm1cm1c1c3c6c6c21cm11cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c9cm11c0c44c6cm9cm3cm7c10cm22cm1c36cm36c0cm9cm1_weight(1)(7-1 downto 0),
			B	=> cm4c0c3c3c3c0cm9cm1cm1c1c3c6c6c21cm11cm1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c9cm11c0c44c6cm9cm3cm7c10cm22cm1c36cm36c0cm9cm1,
			CxB => R_cm4c0c3c3c3c0cm9cm1cm1c1c3c6c6c21cm11cm1
		);

    c2c9c2cm8c1c2c1c5cm4c4c0c1cm33c5c11c5_cm5cm22c7cm12c3c2cm12c14cm12cm3c22cm27c4cm3cm4c3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c2c9c2cm8c1c2c1c5cm4c4c0c1cm33c5c11c5_weight(1)(7-1 downto 0),
			B	=> cm5cm22c7cm12c3c2cm12c14cm12cm3c22cm27c4cm3cm4c3_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c2c9c2cm8c1c2c1c5cm4c4c0c1cm33c5c11c5,
			CxB => R_cm5cm22c7cm12c3c2cm12c14cm12cm3c22cm27c4cm3cm4c3
		);

    c12cm20c4cm3cm13cm6cm3c45cm4c7c0c24c4c0c15c6_c2cm8c6cm9c3cm4c8cm3cm2cm23c3c18c6c1c13cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c12cm20c4cm3cm13cm6cm3c45cm4c7c0c24c4c0c15c6_weight(1)(7-1 downto 0),
			B	=> c2cm8c6cm9c3cm4c8cm3cm2cm23c3c18c6c1c13cm1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c12cm20c4cm3cm13cm6cm3c45cm4c7c0c24c4c0c15c6,
			CxB => R_c2cm8c6cm9c3cm4c8cm3cm2cm23c3c18c6c1c13cm1
		);

    c9cm16cm34cm29c8cm2c32c2c0cm2cm8c3c4c3c7c10_cm4cm18cm23c22c17cm1cm9cm2cm16cm2c1c3cm12c21c2c4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c9cm16cm34cm29c8cm2c32c2c0cm2cm8c3c4c3c7c10_weight(1)(7-1 downto 0),
			B	=> cm4cm18cm23c22c17cm1cm9cm2cm16cm2c1c3cm12c21c2c4_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c9cm16cm34cm29c8cm2c32c2c0cm2cm8c3c4c3c7c10,
			CxB => R_cm4cm18cm23c22c17cm1cm9cm2cm16cm2c1c3cm12c21c2c4
		);

    c5c20cm1cm20c35cm2c3c36cm5c6c1c2cm14c4c2cm4_cm5c2c16cm4cm11cm3cm2cm8cm7cm2cm10c22c5cm6c5c3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c5c20cm1cm20c35cm2c3c36cm5c6c1c2cm14c4c2cm4_weight(1)(7-1 downto 0),
			B	=> cm5c2c16cm4cm11cm3cm2cm8cm7cm2cm10c22c5cm6c5c3_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c5c20cm1cm20c35cm2c3c36cm5c6c1c2cm14c4c2cm4,
			CxB => R_cm5c2c16cm4cm11cm3cm2cm8cm7cm2cm10c22c5cm6c5c3
		);

    cm33cm1c8c15c5c25cm1cm37cm11c1c4c10c1c3cm8cm1_c33cm8c0c2cm8cm31c3cm27cm4cm21cm6cm1cm1cm11c15cm8_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm33cm1c8c15c5c25cm1cm37cm11c1c4c10c1c3cm8cm1_weight(1)(7-1 downto 0),
			B	=> c33cm8c0c2cm8cm31c3cm27cm4cm21cm6cm1cm1cm11c15cm8_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm33cm1c8c15c5c25cm1cm37cm11c1c4c10c1c3cm8cm1,
			CxB => R_c33cm8c0c2cm8cm31c3cm27cm4cm21cm6cm1cm1cm11c15cm8
		);

    cm6cm1c0cm7cm7c17cm34cm2c21c7cm5cm10cm5c10c11cm12_c3cm10c0c8cm17c18cm15cm13cm5cm16c1c6cm49c6c3cm23_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm6cm1c0cm7cm7c17cm34cm2c21c7cm5cm10cm5c10c11cm12_weight(1)(7-1 downto 0),
			B	=> c3cm10c0c8cm17c18cm15cm13cm5cm16c1c6cm49c6c3cm23_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm6cm1c0cm7cm7c17cm34cm2c21c7cm5cm10cm5c10c11cm12,
			CxB => R_c3cm10c0c8cm17c18cm15cm13cm5cm16c1c6cm49c6c3cm23
		);

    cm29c11cm17c10cm43cm3c11cm18c4cm13cm16cm5c11cm10c3cm2_cm6cm16cm17c1cm4cm24cm9c4c34cm16cm18c0c0c26c8c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm29c11cm17c10cm43cm3c11cm18c4cm13cm16cm5c11cm10c3cm2_weight(1)(7-1 downto 0),
			B	=> cm6cm16cm17c1cm4cm24cm9c4c34cm16cm18c0c0c26c8c0_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm29c11cm17c10cm43cm3c11cm18c4cm13cm16cm5c11cm10c3cm2,
			CxB => R_cm6cm16cm17c1cm4cm24cm9c4c34cm16cm18c0c0c26c8c0
		);

    c5c5cm4cm3c7c16cm11cm17cm20c10c7c0c5c1cm40cm3_c13c4cm19cm30cm38cm9c5c13cm10cm5c1c4c1c38cm5c2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c5c5cm4cm3c7c16cm11cm17cm20c10c7c0c5c1cm40cm3_weight(1)(7-1 downto 0),
			B	=> c13c4cm19cm30cm38cm9c5c13cm10cm5c1c4c1c38cm5c2_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c5c5cm4cm3c7c16cm11cm17cm20c10c7c0c5c1cm40cm3,
			CxB => R_c13c4cm19cm30cm38cm9c5c13cm10cm5c1c4c1c38cm5c2
		);

    c15c55c18c8c3cm22cm6cm19c14c13c3cm26cm6c5cm5cm11_c8cm5c21cm9c5c52c0cm5cm1c14c1cm9cm10c7c4c19_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c15c55c18c8c3cm22cm6cm19c14c13c3cm26cm6c5cm5cm11_weight(1)(7-1 downto 0),
			B	=> c8cm5c21cm9c5c52c0cm5cm1c14c1cm9cm10c7c4c19_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c15c55c18c8c3cm22cm6cm19c14c13c3cm26cm6c5cm5cm11,
			CxB => R_c8cm5c21cm9c5c52c0cm5cm1c14c1cm9cm10c7c4c19
		);

    cm6cm12c7cm4cm38c4c4cm13cm18c0c9c1c7c0c8c3_c4cm1cm22cm1cm22cm2cm18cm6cm24cm9cm8c8cm4cm22c8c48_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm6cm12c7cm4cm38c4c4cm13cm18c0c9c1c7c0c8c3_weight(1)(7-1 downto 0),
			B	=> c4cm1cm22cm1cm22cm2cm18cm6cm24cm9cm8c8cm4cm22c8c48_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm6cm12c7cm4cm38c4c4cm13cm18c0c9c1c7c0c8c3,
			CxB => R_c4cm1cm22cm1cm22cm2cm18cm6cm24cm9cm8c8cm4cm22c8c48
		);




end architecture;
