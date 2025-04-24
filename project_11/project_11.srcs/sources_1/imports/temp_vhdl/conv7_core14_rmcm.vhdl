library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core14_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        R_c2c17c22c14cm12c20cm6c12cm8cm6cm3cm6cm32cm10c6cm4 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c7c24cm5cm8cm5cm15c12cm1cm7cm7c2cm61c17c0cm67c1 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_cm2cm37c6c1cm35cm9cm16c1c2cm1c19c6cm9cm5cm5c11 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm27c1cm8cm16cm5cm27cm17cm2cm8c3cm29cm4cm1c34cm3c24 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm22cm39cm5cm8cm4c0c120cm5cm32c15c18c21cm3c2cm8c5 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c6c10c31c18cm12cm3c13cm7cm9cm4c15c6cm10cm1c5cm8 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm2c12c1cm18c17c6c2cm20cm23cm18c1c0cm8c0cm2c4 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm25cm11cm40cm6c9c4cm21c2c33cm9c1cm8c4c7c2c7 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm1c3c16cm12cm13c3c6cm22c5c11c12cm2c8cm8cm12cm5 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm5cm7cm5c32c13cm7cm3c7cm2cm1c4cm4c3c0cm5cm5 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c9cm2c11c31c4cm8c10cm1c17c1c35cm1cm1c24c6cm1 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm1c1c2cm17c49c1c0cm19c3c0c1c9cm14cm13c9c1 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c1c27cm1c3c1c8cm22c1c1cm22cm2cm4c2cm3cm33c3 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm18c2c3cm1cm22c15c0cm2cm13cm12cm4c8cm3c3c16cm1 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c0cm32c9c1cm6c17c5cm9c16c15c4c8cm3c1cm7cm3 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm5cm11c4cm16c0cm1cm4cm6c5c19c4cm5cm18cm4c8cm2 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c8c3cm23c9cm4cm2c2cm39cm9cm48c10c16c3cm3cm1cm10 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm4cm7cm2c8cm25cm7cm4c7c8cm4c1c9cm22cm4cm36cm1 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm40cm11c7cm12cm29c8cm1cm12c29cm17c4cm7c11cm11c2cm5 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm4cm5cm7cm5cm18cm5cm2c72c0c46c0cm11cm1c1c4cm36 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c2cm9c3cm7cm5c8c9cm1cm2cm29c0c3cm37cm2c4c4 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm3cm4c2cm26c2cm6c0c9c3c10cm26c9cm1c6c4c3 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c10c5cm13cm2cm4c3cm2cm8cm23cm7c19cm14c2c5cm6c0 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c1cm15c5c44c2c52c10c2c8cm15c10c0c6cm3c0c5 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm24cm6c4cm2cm5c9cm8c0cm73c1c14c3cm1c10c6c5 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c3c17cm31c3cm5c15c1cm2c60cm3c10c1cm1cm4c0cm3 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c7cm2cm6c4cm5cm22cm9cm5c0cm5c4cm2cm4cm11c18c6 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c1cm21c4c2cm2c4c1cm1cm6c15c30cm4cm7c6c4cm6 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c9c3c3cm10cm2cm6c7cm17cm30c2cm8cm1cm3c1cm9c4 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm15c23cm1c14cm9c0c18c8cm1cm15cm2c1cm5cm14cm23c5 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c6c12c2c2cm8c11cm2cm67cm4c18cm1cm6cm5c18c0cm10 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_cm8cm40cm4c21cm5cm25cm6cm34cm12c12cm2c2cm1c2c9c4 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(11-1 downto 0)  --	sfix(1, -10)
    );
end conv7_core14_rmcm;

architecture arch of conv7_core14_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C17C22C14CM12C20CM6C12CM8CM6CM3CM6CM32CM10C6CM4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C7C24CM5CM8CM5CM15C12CM1CM7CM7C2CM61C17C0CM67C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM37C6C1CM35CM9CM16C1C2CM1C19C6CM9CM5CM5C11_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM27C1CM8CM16CM5CM27CM17CM2CM8C3CM29CM4CM1C34CM3C24_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM22CM39CM5CM8CM4C0C120CM5CM32C15C18C21CM3C2CM8C5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6C10C31C18CM12CM3C13CM7CM9CM4C15C6CM10CM1C5CM8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C12C1CM18C17C6C2CM20CM23CM18C1C0CM8C0CM2C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM25CM11CM40CM6C9C4CM21C2C33CM9C1CM8C4C7C2C7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C3C16CM12CM13C3C6CM22C5C11C12CM2C8CM8CM12CM5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5CM7CM5C32C13CM7CM3C7CM2CM1C4CM4C3C0CM5CM5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C9CM2C11C31C4CM8C10CM1C17C1C35CM1CM1C24C6CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C1C2CM17C49C1C0CM19C3C0C1C9CM14CM13C9C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C27CM1C3C1C8CM22C1C1CM22CM2CM4C2CM3CM33C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM18C2C3CM1CM22C15C0CM2CM13CM12CM4C8CM3C3C16CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM32C9C1CM6C17C5CM9C16C15C4C8CM3C1CM7CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5CM11C4CM16C0CM1CM4CM6C5C19C4CM5CM18CM4C8CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C8C3CM23C9CM4CM2C2CM39CM9CM48C10C16C3CM3CM1CM10_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4CM7CM2C8CM25CM7CM4C7C8CM4C1C9CM22CM4CM36CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM40CM11C7CM12CM29C8CM1CM12C29CM17C4CM7C11CM11C2CM5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4CM5CM7CM5CM18CM5CM2C72C0C46C0CM11CM1C1C4CM36_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2CM9C3CM7CM5C8C9CM1CM2CM29C0C3CM37CM2C4C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3CM4C2CM26C2CM6C0C9C3C10CM26C9CM1C6C4C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C10C5CM13CM2CM4C3CM2CM8CM23CM7C19CM14C2C5CM6C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM15C5C44C2C52C10C2C8CM15C10C0C6CM3C0C5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM24CM6C4CM2CM5C9CM8C0CM73C1C14C3CM1C10C6C5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C17CM31C3CM5C15C1CM2C60CM3C10C1CM1CM4C0CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C7CM2CM6C4CM5CM22CM9CM5C0CM5C4CM2CM4CM11C18C6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM21C4C2CM2C4C1CM1CM6C15C30CM4CM7C6C4CM6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C9C3C3CM10CM2CM6C7CM17CM30C2CM8CM1CM3C1CM9C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM15C23CM1C14CM9C0C18C8CM1CM15CM2C1CM5CM14CM23C5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6C12C2C2CM8C11CM2CM67CM4C18CM1CM6CM5C18C0CM10_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM8CM40CM4C21CM5CM25CM6CM34CM12C12CM2C2CM1C2C9C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(4, -3)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(1, -7)
    signal c2c17c22c14cm12c20cm6c12cm8cm6cm3cm6cm32cm10c6cm4_weight : PIPELINE_TYPE_FOR_C2C17C22C14CM12C20CM6C12CM8CM6CM3CM6CM32CM10C6CM4_WEIGHT;
    -- sfix(1, -7)
    signal c7c24cm5cm8cm5cm15c12cm1cm7cm7c2cm61c17c0cm67c1_weight : PIPELINE_TYPE_FOR_C7C24CM5CM8CM5CM15C12CM1CM7CM7C2CM61C17C0CM67C1_WEIGHT;
    -- sfix(1, -7)
    signal cm2cm37c6c1cm35cm9cm16c1c2cm1c19c6cm9cm5cm5c11_weight : PIPELINE_TYPE_FOR_CM2CM37C6C1CM35CM9CM16C1C2CM1C19C6CM9CM5CM5C11_WEIGHT;
    -- sfix(1, -7)
    signal cm27c1cm8cm16cm5cm27cm17cm2cm8c3cm29cm4cm1c34cm3c24_weight : PIPELINE_TYPE_FOR_CM27C1CM8CM16CM5CM27CM17CM2CM8C3CM29CM4CM1C34CM3C24_WEIGHT;
    -- sfix(1, -7)
    signal cm22cm39cm5cm8cm4c0c120cm5cm32c15c18c21cm3c2cm8c5_weight : PIPELINE_TYPE_FOR_CM22CM39CM5CM8CM4C0C120CM5CM32C15C18C21CM3C2CM8C5_WEIGHT;
    -- sfix(1, -7)
    signal c6c10c31c18cm12cm3c13cm7cm9cm4c15c6cm10cm1c5cm8_weight : PIPELINE_TYPE_FOR_C6C10C31C18CM12CM3C13CM7CM9CM4C15C6CM10CM1C5CM8_WEIGHT;
    -- sfix(1, -7)
    signal cm2c12c1cm18c17c6c2cm20cm23cm18c1c0cm8c0cm2c4_weight : PIPELINE_TYPE_FOR_CM2C12C1CM18C17C6C2CM20CM23CM18C1C0CM8C0CM2C4_WEIGHT;
    -- sfix(1, -7)
    signal cm25cm11cm40cm6c9c4cm21c2c33cm9c1cm8c4c7c2c7_weight : PIPELINE_TYPE_FOR_CM25CM11CM40CM6C9C4CM21C2C33CM9C1CM8C4C7C2C7_WEIGHT;
    -- sfix(1, -7)
    signal cm1c3c16cm12cm13c3c6cm22c5c11c12cm2c8cm8cm12cm5_weight : PIPELINE_TYPE_FOR_CM1C3C16CM12CM13C3C6CM22C5C11C12CM2C8CM8CM12CM5_WEIGHT;
    -- sfix(1, -7)
    signal cm5cm7cm5c32c13cm7cm3c7cm2cm1c4cm4c3c0cm5cm5_weight : PIPELINE_TYPE_FOR_CM5CM7CM5C32C13CM7CM3C7CM2CM1C4CM4C3C0CM5CM5_WEIGHT;
    -- sfix(1, -7)
    signal c9cm2c11c31c4cm8c10cm1c17c1c35cm1cm1c24c6cm1_weight : PIPELINE_TYPE_FOR_C9CM2C11C31C4CM8C10CM1C17C1C35CM1CM1C24C6CM1_WEIGHT;
    -- sfix(1, -7)
    signal cm1c1c2cm17c49c1c0cm19c3c0c1c9cm14cm13c9c1_weight : PIPELINE_TYPE_FOR_CM1C1C2CM17C49C1C0CM19C3C0C1C9CM14CM13C9C1_WEIGHT;
    -- sfix(1, -7)
    signal c1c27cm1c3c1c8cm22c1c1cm22cm2cm4c2cm3cm33c3_weight : PIPELINE_TYPE_FOR_C1C27CM1C3C1C8CM22C1C1CM22CM2CM4C2CM3CM33C3_WEIGHT;
    -- sfix(1, -7)
    signal cm18c2c3cm1cm22c15c0cm2cm13cm12cm4c8cm3c3c16cm1_weight : PIPELINE_TYPE_FOR_CM18C2C3CM1CM22C15C0CM2CM13CM12CM4C8CM3C3C16CM1_WEIGHT;
    -- sfix(1, -7)
    signal c0cm32c9c1cm6c17c5cm9c16c15c4c8cm3c1cm7cm3_weight : PIPELINE_TYPE_FOR_C0CM32C9C1CM6C17C5CM9C16C15C4C8CM3C1CM7CM3_WEIGHT;
    -- sfix(1, -7)
    signal cm5cm11c4cm16c0cm1cm4cm6c5c19c4cm5cm18cm4c8cm2_weight : PIPELINE_TYPE_FOR_CM5CM11C4CM16C0CM1CM4CM6C5C19C4CM5CM18CM4C8CM2_WEIGHT;
    -- sfix(1, -7)
    signal c8c3cm23c9cm4cm2c2cm39cm9cm48c10c16c3cm3cm1cm10_weight : PIPELINE_TYPE_FOR_C8C3CM23C9CM4CM2C2CM39CM9CM48C10C16C3CM3CM1CM10_WEIGHT;
    -- sfix(1, -7)
    signal cm4cm7cm2c8cm25cm7cm4c7c8cm4c1c9cm22cm4cm36cm1_weight : PIPELINE_TYPE_FOR_CM4CM7CM2C8CM25CM7CM4C7C8CM4C1C9CM22CM4CM36CM1_WEIGHT;
    -- sfix(1, -7)
    signal cm40cm11c7cm12cm29c8cm1cm12c29cm17c4cm7c11cm11c2cm5_weight : PIPELINE_TYPE_FOR_CM40CM11C7CM12CM29C8CM1CM12C29CM17C4CM7C11CM11C2CM5_WEIGHT;
    -- sfix(1, -7)
    signal cm4cm5cm7cm5cm18cm5cm2c72c0c46c0cm11cm1c1c4cm36_weight : PIPELINE_TYPE_FOR_CM4CM5CM7CM5CM18CM5CM2C72C0C46C0CM11CM1C1C4CM36_WEIGHT;
    -- sfix(1, -7)
    signal c2cm9c3cm7cm5c8c9cm1cm2cm29c0c3cm37cm2c4c4_weight : PIPELINE_TYPE_FOR_C2CM9C3CM7CM5C8C9CM1CM2CM29C0C3CM37CM2C4C4_WEIGHT;
    -- sfix(1, -7)
    signal cm3cm4c2cm26c2cm6c0c9c3c10cm26c9cm1c6c4c3_weight : PIPELINE_TYPE_FOR_CM3CM4C2CM26C2CM6C0C9C3C10CM26C9CM1C6C4C3_WEIGHT;
    -- sfix(1, -7)
    signal c10c5cm13cm2cm4c3cm2cm8cm23cm7c19cm14c2c5cm6c0_weight : PIPELINE_TYPE_FOR_C10C5CM13CM2CM4C3CM2CM8CM23CM7C19CM14C2C5CM6C0_WEIGHT;
    -- sfix(1, -7)
    signal c1cm15c5c44c2c52c10c2c8cm15c10c0c6cm3c0c5_weight : PIPELINE_TYPE_FOR_C1CM15C5C44C2C52C10C2C8CM15C10C0C6CM3C0C5_WEIGHT;
    -- sfix(1, -7)
    signal cm24cm6c4cm2cm5c9cm8c0cm73c1c14c3cm1c10c6c5_weight : PIPELINE_TYPE_FOR_CM24CM6C4CM2CM5C9CM8C0CM73C1C14C3CM1C10C6C5_WEIGHT;
    -- sfix(1, -7)
    signal c3c17cm31c3cm5c15c1cm2c60cm3c10c1cm1cm4c0cm3_weight : PIPELINE_TYPE_FOR_C3C17CM31C3CM5C15C1CM2C60CM3C10C1CM1CM4C0CM3_WEIGHT;
    -- sfix(1, -7)
    signal c7cm2cm6c4cm5cm22cm9cm5c0cm5c4cm2cm4cm11c18c6_weight : PIPELINE_TYPE_FOR_C7CM2CM6C4CM5CM22CM9CM5C0CM5C4CM2CM4CM11C18C6_WEIGHT;
    -- sfix(1, -7)
    signal c1cm21c4c2cm2c4c1cm1cm6c15c30cm4cm7c6c4cm6_weight : PIPELINE_TYPE_FOR_C1CM21C4C2CM2C4C1CM1CM6C15C30CM4CM7C6C4CM6_WEIGHT;
    -- sfix(1, -7)
    signal c9c3c3cm10cm2cm6c7cm17cm30c2cm8cm1cm3c1cm9c4_weight : PIPELINE_TYPE_FOR_C9C3C3CM10CM2CM6C7CM17CM30C2CM8CM1CM3C1CM9C4_WEIGHT;
    -- sfix(1, -7)
    signal cm15c23cm1c14cm9c0c18c8cm1cm15cm2c1cm5cm14cm23c5_weight : PIPELINE_TYPE_FOR_CM15C23CM1C14CM9C0C18C8CM1CM15CM2C1CM5CM14CM23C5_WEIGHT;
    -- sfix(1, -7)
    signal c6c12c2c2cm8c11cm2cm67cm4c18cm1cm6cm5c18c0cm10_weight : PIPELINE_TYPE_FOR_C6C12C2C2CM8C11CM2CM67CM4C18CM1CM6CM5C18C0CM10_WEIGHT;
    -- sfix(1, -7)
    signal cm8cm40cm4c21cm5cm25cm6cm34cm12c12cm2c2cm1c2c9c4_weight : PIPELINE_TYPE_FOR_CM8CM40CM4C21CM5CM25CM6CM34CM12C12CM2C2CM1C2C9C4_WEIGHT;
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



    WEIGHT_ROM: entity work.conv7_core14_rmcm_weightsconstant_memory
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
        
            dout1   => c2c17c22c14cm12c20cm6c12cm8cm6cm3cm6cm32cm10c6cm4_weight(0), 
            dout2   => c7c24cm5cm8cm5cm15c12cm1cm7cm7c2cm61c17c0cm67c1_weight(0), 
            dout3   => cm2cm37c6c1cm35cm9cm16c1c2cm1c19c6cm9cm5cm5c11_weight(0), 
            dout4   => cm27c1cm8cm16cm5cm27cm17cm2cm8c3cm29cm4cm1c34cm3c24_weight(0), 
            dout5   => cm22cm39cm5cm8cm4c0c120cm5cm32c15c18c21cm3c2cm8c5_weight(0), 
            dout6   => c6c10c31c18cm12cm3c13cm7cm9cm4c15c6cm10cm1c5cm8_weight(0), 
            dout7   => cm2c12c1cm18c17c6c2cm20cm23cm18c1c0cm8c0cm2c4_weight(0), 
            dout8   => cm25cm11cm40cm6c9c4cm21c2c33cm9c1cm8c4c7c2c7_weight(0), 
            dout9   => cm1c3c16cm12cm13c3c6cm22c5c11c12cm2c8cm8cm12cm5_weight(0), 
            dout10   => cm5cm7cm5c32c13cm7cm3c7cm2cm1c4cm4c3c0cm5cm5_weight(0), 
            dout11   => c9cm2c11c31c4cm8c10cm1c17c1c35cm1cm1c24c6cm1_weight(0), 
            dout12   => cm1c1c2cm17c49c1c0cm19c3c0c1c9cm14cm13c9c1_weight(0), 
            dout13   => c1c27cm1c3c1c8cm22c1c1cm22cm2cm4c2cm3cm33c3_weight(0), 
            dout14   => cm18c2c3cm1cm22c15c0cm2cm13cm12cm4c8cm3c3c16cm1_weight(0), 
            dout15   => c0cm32c9c1cm6c17c5cm9c16c15c4c8cm3c1cm7cm3_weight(0), 
            dout16   => cm5cm11c4cm16c0cm1cm4cm6c5c19c4cm5cm18cm4c8cm2_weight(0), 
            dout17   => c8c3cm23c9cm4cm2c2cm39cm9cm48c10c16c3cm3cm1cm10_weight(0), 
            dout18   => cm4cm7cm2c8cm25cm7cm4c7c8cm4c1c9cm22cm4cm36cm1_weight(0), 
            dout19   => cm40cm11c7cm12cm29c8cm1cm12c29cm17c4cm7c11cm11c2cm5_weight(0), 
            dout20   => cm4cm5cm7cm5cm18cm5cm2c72c0c46c0cm11cm1c1c4cm36_weight(0), 
            dout21   => c2cm9c3cm7cm5c8c9cm1cm2cm29c0c3cm37cm2c4c4_weight(0), 
            dout22   => cm3cm4c2cm26c2cm6c0c9c3c10cm26c9cm1c6c4c3_weight(0), 
            dout23   => c10c5cm13cm2cm4c3cm2cm8cm23cm7c19cm14c2c5cm6c0_weight(0), 
            dout24   => c1cm15c5c44c2c52c10c2c8cm15c10c0c6cm3c0c5_weight(0), 
            dout25   => cm24cm6c4cm2cm5c9cm8c0cm73c1c14c3cm1c10c6c5_weight(0), 
            dout26   => c3c17cm31c3cm5c15c1cm2c60cm3c10c1cm1cm4c0cm3_weight(0), 
            dout27   => c7cm2cm6c4cm5cm22cm9cm5c0cm5c4cm2cm4cm11c18c6_weight(0), 
            dout28   => c1cm21c4c2cm2c4c1cm1cm6c15c30cm4cm7c6c4cm6_weight(0), 
            dout29   => c9c3c3cm10cm2cm6c7cm17cm30c2cm8cm1cm3c1cm9c4_weight(0), 
            dout30   => cm15c23cm1c14cm9c0c18c8cm1cm15cm2c1cm5cm14cm23c5_weight(0), 
            dout31   => c6c12c2c2cm8c11cm2cm67cm4c18cm1cm6cm5c18c0cm10_weight(0), 
            dout32   => cm8cm40cm4c21cm5cm25cm6cm34cm12c12cm2c2cm1c2c9c4_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_c2c17c22c14cm12c20cm6c12cm8cm6cm3cm6cm32cm10c6cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c17c22c14cm12c20cm6c12cm8cm6cm3cm6cm32cm10c6cm4_weight(0), c2c17c22c14cm12c20cm6c12cm8cm6cm3cm6cm32cm10c6cm4_weight(1));
    PL_STEP_0_for_c7c24cm5cm8cm5cm15c12cm1cm7cm7c2cm61c17c0cm67c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c7c24cm5cm8cm5cm15c12cm1cm7cm7c2cm61c17c0cm67c1_weight(0), c7c24cm5cm8cm5cm15c12cm1cm7cm7c2cm61c17c0cm67c1_weight(1));
    PL_STEP_0_for_cm2cm37c6c1cm35cm9cm16c1c2cm1c19c6cm9cm5cm5c11_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm37c6c1cm35cm9cm16c1c2cm1c19c6cm9cm5cm5c11_weight(0), cm2cm37c6c1cm35cm9cm16c1c2cm1c19c6cm9cm5cm5c11_weight(1));
    PL_STEP_0_for_cm27c1cm8cm16cm5cm27cm17cm2cm8c3cm29cm4cm1c34cm3c24_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm27c1cm8cm16cm5cm27cm17cm2cm8c3cm29cm4cm1c34cm3c24_weight(0), cm27c1cm8cm16cm5cm27cm17cm2cm8c3cm29cm4cm1c34cm3c24_weight(1));
    PL_STEP_0_for_cm22cm39cm5cm8cm4c0c120cm5cm32c15c18c21cm3c2cm8c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm22cm39cm5cm8cm4c0c120cm5cm32c15c18c21cm3c2cm8c5_weight(0), cm22cm39cm5cm8cm4c0c120cm5cm32c15c18c21cm3c2cm8c5_weight(1));
    PL_STEP_0_for_c6c10c31c18cm12cm3c13cm7cm9cm4c15c6cm10cm1c5cm8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6c10c31c18cm12cm3c13cm7cm9cm4c15c6cm10cm1c5cm8_weight(0), c6c10c31c18cm12cm3c13cm7cm9cm4c15c6cm10cm1c5cm8_weight(1));
    PL_STEP_0_for_cm2c12c1cm18c17c6c2cm20cm23cm18c1c0cm8c0cm2c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c12c1cm18c17c6c2cm20cm23cm18c1c0cm8c0cm2c4_weight(0), cm2c12c1cm18c17c6c2cm20cm23cm18c1c0cm8c0cm2c4_weight(1));
    PL_STEP_0_for_cm25cm11cm40cm6c9c4cm21c2c33cm9c1cm8c4c7c2c7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm25cm11cm40cm6c9c4cm21c2c33cm9c1cm8c4c7c2c7_weight(0), cm25cm11cm40cm6c9c4cm21c2c33cm9c1cm8c4c7c2c7_weight(1));
    PL_STEP_0_for_cm1c3c16cm12cm13c3c6cm22c5c11c12cm2c8cm8cm12cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c3c16cm12cm13c3c6cm22c5c11c12cm2c8cm8cm12cm5_weight(0), cm1c3c16cm12cm13c3c6cm22c5c11c12cm2c8cm8cm12cm5_weight(1));
    PL_STEP_0_for_cm5cm7cm5c32c13cm7cm3c7cm2cm1c4cm4c3c0cm5cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5cm7cm5c32c13cm7cm3c7cm2cm1c4cm4c3c0cm5cm5_weight(0), cm5cm7cm5c32c13cm7cm3c7cm2cm1c4cm4c3c0cm5cm5_weight(1));
    PL_STEP_0_for_c9cm2c11c31c4cm8c10cm1c17c1c35cm1cm1c24c6cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c9cm2c11c31c4cm8c10cm1c17c1c35cm1cm1c24c6cm1_weight(0), c9cm2c11c31c4cm8c10cm1c17c1c35cm1cm1c24c6cm1_weight(1));
    PL_STEP_0_for_cm1c1c2cm17c49c1c0cm19c3c0c1c9cm14cm13c9c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c1c2cm17c49c1c0cm19c3c0c1c9cm14cm13c9c1_weight(0), cm1c1c2cm17c49c1c0cm19c3c0c1c9cm14cm13c9c1_weight(1));
    PL_STEP_0_for_c1c27cm1c3c1c8cm22c1c1cm22cm2cm4c2cm3cm33c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c27cm1c3c1c8cm22c1c1cm22cm2cm4c2cm3cm33c3_weight(0), c1c27cm1c3c1c8cm22c1c1cm22cm2cm4c2cm3cm33c3_weight(1));
    PL_STEP_0_for_cm18c2c3cm1cm22c15c0cm2cm13cm12cm4c8cm3c3c16cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm18c2c3cm1cm22c15c0cm2cm13cm12cm4c8cm3c3c16cm1_weight(0), cm18c2c3cm1cm22c15c0cm2cm13cm12cm4c8cm3c3c16cm1_weight(1));
    PL_STEP_0_for_c0cm32c9c1cm6c17c5cm9c16c15c4c8cm3c1cm7cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm32c9c1cm6c17c5cm9c16c15c4c8cm3c1cm7cm3_weight(0), c0cm32c9c1cm6c17c5cm9c16c15c4c8cm3c1cm7cm3_weight(1));
    PL_STEP_0_for_cm5cm11c4cm16c0cm1cm4cm6c5c19c4cm5cm18cm4c8cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5cm11c4cm16c0cm1cm4cm6c5c19c4cm5cm18cm4c8cm2_weight(0), cm5cm11c4cm16c0cm1cm4cm6c5c19c4cm5cm18cm4c8cm2_weight(1));
    PL_STEP_0_for_c8c3cm23c9cm4cm2c2cm39cm9cm48c10c16c3cm3cm1cm10_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c8c3cm23c9cm4cm2c2cm39cm9cm48c10c16c3cm3cm1cm10_weight(0), c8c3cm23c9cm4cm2c2cm39cm9cm48c10c16c3cm3cm1cm10_weight(1));
    PL_STEP_0_for_cm4cm7cm2c8cm25cm7cm4c7c8cm4c1c9cm22cm4cm36cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4cm7cm2c8cm25cm7cm4c7c8cm4c1c9cm22cm4cm36cm1_weight(0), cm4cm7cm2c8cm25cm7cm4c7c8cm4c1c9cm22cm4cm36cm1_weight(1));
    PL_STEP_0_for_cm40cm11c7cm12cm29c8cm1cm12c29cm17c4cm7c11cm11c2cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm40cm11c7cm12cm29c8cm1cm12c29cm17c4cm7c11cm11c2cm5_weight(0), cm40cm11c7cm12cm29c8cm1cm12c29cm17c4cm7c11cm11c2cm5_weight(1));
    PL_STEP_0_for_cm4cm5cm7cm5cm18cm5cm2c72c0c46c0cm11cm1c1c4cm36_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4cm5cm7cm5cm18cm5cm2c72c0c46c0cm11cm1c1c4cm36_weight(0), cm4cm5cm7cm5cm18cm5cm2c72c0c46c0cm11cm1c1c4cm36_weight(1));
    PL_STEP_0_for_c2cm9c3cm7cm5c8c9cm1cm2cm29c0c3cm37cm2c4c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2cm9c3cm7cm5c8c9cm1cm2cm29c0c3cm37cm2c4c4_weight(0), c2cm9c3cm7cm5c8c9cm1cm2cm29c0c3cm37cm2c4c4_weight(1));
    PL_STEP_0_for_cm3cm4c2cm26c2cm6c0c9c3c10cm26c9cm1c6c4c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3cm4c2cm26c2cm6c0c9c3c10cm26c9cm1c6c4c3_weight(0), cm3cm4c2cm26c2cm6c0c9c3c10cm26c9cm1c6c4c3_weight(1));
    PL_STEP_0_for_c10c5cm13cm2cm4c3cm2cm8cm23cm7c19cm14c2c5cm6c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c10c5cm13cm2cm4c3cm2cm8cm23cm7c19cm14c2c5cm6c0_weight(0), c10c5cm13cm2cm4c3cm2cm8cm23cm7c19cm14c2c5cm6c0_weight(1));
    PL_STEP_0_for_c1cm15c5c44c2c52c10c2c8cm15c10c0c6cm3c0c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm15c5c44c2c52c10c2c8cm15c10c0c6cm3c0c5_weight(0), c1cm15c5c44c2c52c10c2c8cm15c10c0c6cm3c0c5_weight(1));
    PL_STEP_0_for_cm24cm6c4cm2cm5c9cm8c0cm73c1c14c3cm1c10c6c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm24cm6c4cm2cm5c9cm8c0cm73c1c14c3cm1c10c6c5_weight(0), cm24cm6c4cm2cm5c9cm8c0cm73c1c14c3cm1c10c6c5_weight(1));
    PL_STEP_0_for_c3c17cm31c3cm5c15c1cm2c60cm3c10c1cm1cm4c0cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c17cm31c3cm5c15c1cm2c60cm3c10c1cm1cm4c0cm3_weight(0), c3c17cm31c3cm5c15c1cm2c60cm3c10c1cm1cm4c0cm3_weight(1));
    PL_STEP_0_for_c7cm2cm6c4cm5cm22cm9cm5c0cm5c4cm2cm4cm11c18c6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c7cm2cm6c4cm5cm22cm9cm5c0cm5c4cm2cm4cm11c18c6_weight(0), c7cm2cm6c4cm5cm22cm9cm5c0cm5c4cm2cm4cm11c18c6_weight(1));
    PL_STEP_0_for_c1cm21c4c2cm2c4c1cm1cm6c15c30cm4cm7c6c4cm6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm21c4c2cm2c4c1cm1cm6c15c30cm4cm7c6c4cm6_weight(0), c1cm21c4c2cm2c4c1cm1cm6c15c30cm4cm7c6c4cm6_weight(1));
    PL_STEP_0_for_c9c3c3cm10cm2cm6c7cm17cm30c2cm8cm1cm3c1cm9c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c9c3c3cm10cm2cm6c7cm17cm30c2cm8cm1cm3c1cm9c4_weight(0), c9c3c3cm10cm2cm6c7cm17cm30c2cm8cm1cm3c1cm9c4_weight(1));
    PL_STEP_0_for_cm15c23cm1c14cm9c0c18c8cm1cm15cm2c1cm5cm14cm23c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm15c23cm1c14cm9c0c18c8cm1cm15cm2c1cm5cm14cm23c5_weight(0), cm15c23cm1c14cm9c0c18c8cm1cm15cm2c1cm5cm14cm23c5_weight(1));
    PL_STEP_0_for_c6c12c2c2cm8c11cm2cm67cm4c18cm1cm6cm5c18c0cm10_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6c12c2c2cm8c11cm2cm67cm4c18cm1cm6cm5c18c0cm10_weight(0), c6c12c2c2cm8c11cm2cm67cm4c18cm1cm6cm5c18c0cm10_weight(1));
    PL_STEP_0_for_cm8cm40cm4c21cm5cm25cm6cm34cm12c12cm2c2cm1c2c9c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm8cm40cm4c21cm5cm25cm6cm34cm12c12cm2c2cm1c2c9c4_weight(0), cm8cm40cm4c21cm5cm25cm6cm34cm12c12cm2c2cm1c2c9c4_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    c7c24cm5cm8cm5cm15c12cm1cm7cm7c2cm61c17c0cm67c1_cm15c23cm1c14cm9c0c18c8cm1cm15cm2c1cm5cm14cm23c5_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c7c24cm5cm8cm5cm15c12cm1cm7cm7c2cm61c17c0cm67c1_weight(1)(8-1 downto 0),
			B	=> cm15c23cm1c14cm9c0c18c8cm1cm15cm2c1cm5cm14cm23c5_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c7c24cm5cm8cm5cm15c12cm1cm7cm7c2cm61c17c0cm67c1,
			CxB => R_cm15c23cm1c14cm9c0c18c8cm1cm15cm2c1cm5cm14cm23c5
		);

    cm22cm39cm5cm8cm4c0c120cm5cm32c15c18c21cm3c2cm8c5_c9c3c3cm10cm2cm6c7cm17cm30c2cm8cm1cm3c1cm9c4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm22cm39cm5cm8cm4c0c120cm5cm32c15c18c21cm3c2cm8c5_weight(1)(8-1 downto 0),
			B	=> c9c3c3cm10cm2cm6c7cm17cm30c2cm8cm1cm3c1cm9c4_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm22cm39cm5cm8cm4c0c120cm5cm32c15c18c21cm3c2cm8c5,
			CxB => R_c9c3c3cm10cm2cm6c7cm17cm30c2cm8cm1cm3c1cm9c4
		);

    cm4cm5cm7cm5cm18cm5cm2c72c0c46c0cm11cm1c1c4cm36_c1cm21c4c2cm2c4c1cm1cm6c15c30cm4cm7c6c4cm6_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm4cm5cm7cm5cm18cm5cm2c72c0c46c0cm11cm1c1c4cm36_weight(1)(8-1 downto 0),
			B	=> c1cm21c4c2cm2c4c1cm1cm6c15c30cm4cm7c6c4cm6_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm4cm5cm7cm5cm18cm5cm2c72c0c46c0cm11cm1c1c4cm36,
			CxB => R_c1cm21c4c2cm2c4c1cm1cm6c15c30cm4cm7c6c4cm6
		);

    cm24cm6c4cm2cm5c9cm8c0cm73c1c14c3cm1c10c6c5_c7cm2cm6c4cm5cm22cm9cm5c0cm5c4cm2cm4cm11c18c6_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm24cm6c4cm2cm5c9cm8c0cm73c1c14c3cm1c10c6c5_weight(1)(8-1 downto 0),
			B	=> c7cm2cm6c4cm5cm22cm9cm5c0cm5c4cm2cm4cm11c18c6_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm24cm6c4cm2cm5c9cm8c0cm73c1c14c3cm1c10c6c5,
			CxB => R_c7cm2cm6c4cm5cm22cm9cm5c0cm5c4cm2cm4cm11c18c6
		);

    c6c12c2c2cm8c11cm2cm67cm4c18cm1cm6cm5c18c0cm10_c10c5cm13cm2cm4c3cm2cm8cm23cm7c19cm14c2c5cm6c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c6c12c2c2cm8c11cm2cm67cm4c18cm1cm6cm5c18c0cm10_weight(1)(8-1 downto 0),
			B	=> c10c5cm13cm2cm4c3cm2cm8cm23cm7c19cm14c2c5cm6c0_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c6c12c2c2cm8c11cm2cm67cm4c18cm1cm6cm5c18c0cm10,
			CxB => R_c10c5cm13cm2cm4c3cm2cm8cm23cm7c19cm14c2c5cm6c0
		);

    cm2cm37c6c1cm35cm9cm16c1c2cm1c19c6cm9cm5cm5c11_cm3cm4c2cm26c2cm6c0c9c3c10cm26c9cm1c6c4c3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2cm37c6c1cm35cm9cm16c1c2cm1c19c6cm9cm5cm5c11_weight(1)(7-1 downto 0),
			B	=> cm3cm4c2cm26c2cm6c0c9c3c10cm26c9cm1c6c4c3_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2cm37c6c1cm35cm9cm16c1c2cm1c19c6cm9cm5cm5c11,
			CxB => R_cm3cm4c2cm26c2cm6c0c9c3c10cm26c9cm1c6c4c3
		);

    cm27c1cm8cm16cm5cm27cm17cm2cm8c3cm29cm4cm1c34cm3c24_cm5cm11c4cm16c0cm1cm4cm6c5c19c4cm5cm18cm4c8cm2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm27c1cm8cm16cm5cm27cm17cm2cm8c3cm29cm4cm1c34cm3c24_weight(1)(7-1 downto 0),
			B	=> cm5cm11c4cm16c0cm1cm4cm6c5c19c4cm5cm18cm4c8cm2_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm27c1cm8cm16cm5cm27cm17cm2cm8c3cm29cm4cm1c34cm3c24,
			CxB => R_cm5cm11c4cm16c0cm1cm4cm6c5c19c4cm5cm18cm4c8cm2
		);

    cm25cm11cm40cm6c9c4cm21c2c33cm9c1cm8c4c7c2c7_c0cm32c9c1cm6c17c5cm9c16c15c4c8cm3c1cm7cm3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm25cm11cm40cm6c9c4cm21c2c33cm9c1cm8c4c7c2c7_weight(1)(7-1 downto 0),
			B	=> c0cm32c9c1cm6c17c5cm9c16c15c4c8cm3c1cm7cm3_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm25cm11cm40cm6c9c4cm21c2c33cm9c1cm8c4c7c2c7,
			CxB => R_c0cm32c9c1cm6c17c5cm9c16c15c4c8cm3c1cm7cm3
		);

    cm5cm7cm5c32c13cm7cm3c7cm2cm1c4cm4c3c0cm5cm5_cm18c2c3cm1cm22c15c0cm2cm13cm12cm4c8cm3c3c16cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm5cm7cm5c32c13cm7cm3c7cm2cm1c4cm4c3c0cm5cm5_weight(1)(7-1 downto 0),
			B	=> cm18c2c3cm1cm22c15c0cm2cm13cm12cm4c8cm3c3c16cm1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm5cm7cm5c32c13cm7cm3c7cm2cm1c4cm4c3c0cm5cm5,
			CxB => R_cm18c2c3cm1cm22c15c0cm2cm13cm12cm4c8cm3c3c16cm1
		);

    c9cm2c11c31c4cm8c10cm1c17c1c35cm1cm1c24c6cm1_cm1c3c16cm12cm13c3c6cm22c5c11c12cm2c8cm8cm12cm5_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c9cm2c11c31c4cm8c10cm1c17c1c35cm1cm1c24c6cm1_weight(1)(7-1 downto 0),
			B	=> cm1c3c16cm12cm13c3c6cm22c5c11c12cm2c8cm8cm12cm5_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c9cm2c11c31c4cm8c10cm1c17c1c35cm1cm1c24c6cm1,
			CxB => R_cm1c3c16cm12cm13c3c6cm22c5c11c12cm2c8cm8cm12cm5
		);

    cm1c1c2cm17c49c1c0cm19c3c0c1c9cm14cm13c9c1_cm2c12c1cm18c17c6c2cm20cm23cm18c1c0cm8c0cm2c4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm1c1c2cm17c49c1c0cm19c3c0c1c9cm14cm13c9c1_weight(1)(7-1 downto 0),
			B	=> cm2c12c1cm18c17c6c2cm20cm23cm18c1c0cm8c0cm2c4_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1c1c2cm17c49c1c0cm19c3c0c1c9cm14cm13c9c1,
			CxB => R_cm2c12c1cm18c17c6c2cm20cm23cm18c1c0cm8c0cm2c4
		);

    c1c27cm1c3c1c8cm22c1c1cm22cm2cm4c2cm3cm33c3_c6c10c31c18cm12cm3c13cm7cm9cm4c15c6cm10cm1c5cm8_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c1c27cm1c3c1c8cm22c1c1cm22cm2cm4c2cm3cm33c3_weight(1)(7-1 downto 0),
			B	=> c6c10c31c18cm12cm3c13cm7cm9cm4c15c6cm10cm1c5cm8_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1c27cm1c3c1c8cm22c1c1cm22cm2cm4c2cm3cm33c3,
			CxB => R_c6c10c31c18cm12cm3c13cm7cm9cm4c15c6cm10cm1c5cm8
		);

    c8c3cm23c9cm4cm2c2cm39cm9cm48c10c16c3cm3cm1cm10_c2c17c22c14cm12c20cm6c12cm8cm6cm3cm6cm32cm10c6cm4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c8c3cm23c9cm4cm2c2cm39cm9cm48c10c16c3cm3cm1cm10_weight(1)(7-1 downto 0),
			B	=> c2c17c22c14cm12c20cm6c12cm8cm6cm3cm6cm32cm10c6cm4_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c8c3cm23c9cm4cm2c2cm39cm9cm48c10c16c3cm3cm1cm10,
			CxB => R_c2c17c22c14cm12c20cm6c12cm8cm6cm3cm6cm32cm10c6cm4
		);

    cm4cm7cm2c8cm25cm7cm4c7c8cm4c1c9cm22cm4cm36cm1_cm8cm40cm4c21cm5cm25cm6cm34cm12c12cm2c2cm1c2c9c4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm4cm7cm2c8cm25cm7cm4c7c8cm4c1c9cm22cm4cm36cm1_weight(1)(7-1 downto 0),
			B	=> cm8cm40cm4c21cm5cm25cm6cm34cm12c12cm2c2cm1c2c9c4_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm4cm7cm2c8cm25cm7cm4c7c8cm4c1c9cm22cm4cm36cm1,
			CxB => R_cm8cm40cm4c21cm5cm25cm6cm34cm12c12cm2c2cm1c2c9c4
		);

    cm40cm11c7cm12cm29c8cm1cm12c29cm17c4cm7c11cm11c2cm5_c3c17cm31c3cm5c15c1cm2c60cm3c10c1cm1cm4c0cm3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm40cm11c7cm12cm29c8cm1cm12c29cm17c4cm7c11cm11c2cm5_weight(1)(7-1 downto 0),
			B	=> c3c17cm31c3cm5c15c1cm2c60cm3c10c1cm1cm4c0cm3_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm40cm11c7cm12cm29c8cm1cm12c29cm17c4cm7c11cm11c2cm5,
			CxB => R_c3c17cm31c3cm5c15c1cm2c60cm3c10c1cm1cm4c0cm3
		);

    c2cm9c3cm7cm5c8c9cm1cm2cm29c0c3cm37cm2c4c4_c1cm15c5c44c2c52c10c2c8cm15c10c0c6cm3c0c5_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c2cm9c3cm7cm5c8c9cm1cm2cm29c0c3cm37cm2c4c4_weight(1)(7-1 downto 0),
			B	=> c1cm15c5c44c2c52c10c2c8cm15c10c0c6cm3c0c5_weight(1)(7-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c2cm9c3cm7cm5c8c9cm1cm2cm29c0c3cm37cm2c4c4,
			CxB => R_c1cm15c5c44c2c52c10c2c8cm15c10c0c6cm3c0c5
		);




end architecture;
