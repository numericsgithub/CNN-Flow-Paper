library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core10_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        R_c16c1c14c6c2c3c4c4c6cm5c2cm2cm2c0c2c1 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm2cm28cm2cm34c17c8c15c11c15cm12c11c5cm10cm3cm39cm3 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c4c0cm15cm5cm3c2cm3c2c5c8cm4cm2c34c0c16c33 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm9c4c4cm6c16c4c48c3cm7c14c9c10c0c1cm7cm9 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c34c9cm2c15cm8c14c5cm12cm27c28cm8cm3c5c1c3c7 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c0cm12c11cm19c4cm4cm15cm17c6cm1cm34cm3c38cm1c8c0 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c0c7c0cm12c23c10c0cm6cm7c4c9cm12cm8cm5c3cm2 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c1cm13cm4cm12cm16c6cm5cm4c19cm3cm14c0cm2cm7cm5cm8 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm9c3c15cm23cm2cm24c4cm13cm3cm3c17c1cm2cm8c9cm4 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c2c0c14cm1c2c0c4c9c5c1c11c14cm5c1c5c7 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_c11c3c5cm3cm1c45cm3cm3cm19cm6c24cm2cm2cm4cm1c4 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm6c2cm13c0cm13c1c1cm2c4c1c5c8c11cm15c3c11 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_c36cm21c3c8cm11c16c4c0c23cm18c1cm2cm1c6c6c4 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm2c11c13cm11cm8cm7cm7c8cm6cm2cm4c2cm26c17c1cm1 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm11cm7c6cm2c8cm19c10cm7cm12c16cm22c5c0cm3c3cm1 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c4c105c9cm27c0c14c9cm3cm5cm12cm1c20cm5cm1c17cm6 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_cm24cm27c20c12c2c14c15c0c14c7c5c0cm2cm9cm6cm2 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c2cm17c0cm2c20c3cm3c0c9cm3c13c2c1c7cm12c1 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c1c14c15cm2cm5c12cm1c11c13cm11cm14c5cm3cm7c20cm6 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm1c34c5cm1cm27cm11c1c14cm5c6cm9cm1c5c18c7c6 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c0cm50cm3cm25c2c0c5cm11c2c14c3cm10cm24cm7c13c0 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm9c11cm17cm22c26cm1c5c2cm5cm17cm21cm10c1c7cm2c12 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm37c16cm8c9cm5c12cm3c8c2cm8cm7c12cm10cm2cm1cm1 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c16cm16cm8cm3cm6cm7c1c4cm29c3cm18c1c0c8c2c0 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm28c0c1cm15c19c1c4cm2c14cm3c15cm36cm2cm2cm9cm4 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c24c13cm15c3cm18cm6cm6c1cm4cm4c5c1c1c9c1cm3 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm5c5cm2cm2c3c3c25cm3c4cm3c2c2c27cm10c5c7 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm33cm14c23cm2c15cm4c4c3c0cm9c2cm19cm4c11c13cm11 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c5cm4cm2c12c6cm2cm5cm11cm4c8c21c7c10c0cm8cm8 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c9c13c4cm6c0c11cm6c2c6cm15cm3c1cm12c13cm1cm2 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_c15c11c7c6cm6c1cm1c54cm4c14cm3c7cm21c16c7cm32 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c9cm11cm8c18c4c3cm4c2c5cm3c7cm14c3cm9c3cm8 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(11-1 downto 0)  --	sfix(1, -10)
    );
end conv7_core10_rmcm;

architecture arch of conv7_core10_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_C16C1C14C6C2C3C4C4C6CM5C2CM2CM2C0C2C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM28CM2CM34C17C8C15C11C15CM12C11C5CM10CM3CM39CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4C0CM15CM5CM3C2CM3C2C5C8CM4CM2C34C0C16C33_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM9C4C4CM6C16C4C48C3CM7C14C9C10C0C1CM7CM9_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C34C9CM2C15CM8C14C5CM12CM27C28CM8CM3C5C1C3C7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM12C11CM19C4CM4CM15CM17C6CM1CM34CM3C38CM1C8C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C7C0CM12C23C10C0CM6CM7C4C9CM12CM8CM5C3CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM13CM4CM12CM16C6CM5CM4C19CM3CM14C0CM2CM7CM5CM8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM9C3C15CM23CM2CM24C4CM13CM3CM3C17C1CM2CM8C9CM4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C0C14CM1C2C0C4C9C5C1C11C14CM5C1C5C7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C11C3C5CM3CM1C45CM3CM3CM19CM6C24CM2CM2CM4CM1C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6C2CM13C0CM13C1C1CM2C4C1C5C8C11CM15C3C11_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C36CM21C3C8CM11C16C4C0C23CM18C1CM2CM1C6C6C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C11C13CM11CM8CM7CM7C8CM6CM2CM4C2CM26C17C1CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM11CM7C6CM2C8CM19C10CM7CM12C16CM22C5C0CM3C3CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4C105C9CM27C0C14C9CM3CM5CM12CM1C20CM5CM1C17CM6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM24CM27C20C12C2C14C15C0C14C7C5C0CM2CM9CM6CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2CM17C0CM2C20C3CM3C0C9CM3C13C2C1C7CM12C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C14C15CM2CM5C12CM1C11C13CM11CM14C5CM3CM7C20CM6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C34C5CM1CM27CM11C1C14CM5C6CM9CM1C5C18C7C6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM50CM3CM25C2C0C5CM11C2C14C3CM10CM24CM7C13C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM9C11CM17CM22C26CM1C5C2CM5CM17CM21CM10C1C7CM2C12_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM37C16CM8C9CM5C12CM3C8C2CM8CM7C12CM10CM2CM1CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C16CM16CM8CM3CM6CM7C1C4CM29C3CM18C1C0C8C2C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM28C0C1CM15C19C1C4CM2C14CM3C15CM36CM2CM2CM9CM4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C24C13CM15C3CM18CM6CM6C1CM4CM4C5C1C1C9C1CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5C5CM2CM2C3C3C25CM3C4CM3C2C2C27CM10C5C7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM33CM14C23CM2C15CM4C4C3C0CM9C2CM19CM4C11C13CM11_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5CM4CM2C12C6CM2CM5CM11CM4C8C21C7C10C0CM8CM8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C9C13C4CM6C0C11CM6C2C6CM15CM3C1CM12C13CM1CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C15C11C7C6CM6C1CM1C54CM4C14CM3C7CM21C16C7CM32_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C9CM11CM8C18C4C3CM4C2C5CM3C7CM14C3CM9C3CM8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(4, -3)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(1, -7)
    signal c16c1c14c6c2c3c4c4c6cm5c2cm2cm2c0c2c1_weight : PIPELINE_TYPE_FOR_C16C1C14C6C2C3C4C4C6CM5C2CM2CM2C0C2C1_WEIGHT;
    -- sfix(1, -7)
    signal cm2cm28cm2cm34c17c8c15c11c15cm12c11c5cm10cm3cm39cm3_weight : PIPELINE_TYPE_FOR_CM2CM28CM2CM34C17C8C15C11C15CM12C11C5CM10CM3CM39CM3_WEIGHT;
    -- sfix(1, -7)
    signal c4c0cm15cm5cm3c2cm3c2c5c8cm4cm2c34c0c16c33_weight : PIPELINE_TYPE_FOR_C4C0CM15CM5CM3C2CM3C2C5C8CM4CM2C34C0C16C33_WEIGHT;
    -- sfix(1, -7)
    signal cm9c4c4cm6c16c4c48c3cm7c14c9c10c0c1cm7cm9_weight : PIPELINE_TYPE_FOR_CM9C4C4CM6C16C4C48C3CM7C14C9C10C0C1CM7CM9_WEIGHT;
    -- sfix(1, -7)
    signal c34c9cm2c15cm8c14c5cm12cm27c28cm8cm3c5c1c3c7_weight : PIPELINE_TYPE_FOR_C34C9CM2C15CM8C14C5CM12CM27C28CM8CM3C5C1C3C7_WEIGHT;
    -- sfix(1, -7)
    signal c0cm12c11cm19c4cm4cm15cm17c6cm1cm34cm3c38cm1c8c0_weight : PIPELINE_TYPE_FOR_C0CM12C11CM19C4CM4CM15CM17C6CM1CM34CM3C38CM1C8C0_WEIGHT;
    -- sfix(1, -7)
    signal c0c7c0cm12c23c10c0cm6cm7c4c9cm12cm8cm5c3cm2_weight : PIPELINE_TYPE_FOR_C0C7C0CM12C23C10C0CM6CM7C4C9CM12CM8CM5C3CM2_WEIGHT;
    -- sfix(1, -7)
    signal c1cm13cm4cm12cm16c6cm5cm4c19cm3cm14c0cm2cm7cm5cm8_weight : PIPELINE_TYPE_FOR_C1CM13CM4CM12CM16C6CM5CM4C19CM3CM14C0CM2CM7CM5CM8_WEIGHT;
    -- sfix(1, -7)
    signal cm9c3c15cm23cm2cm24c4cm13cm3cm3c17c1cm2cm8c9cm4_weight : PIPELINE_TYPE_FOR_CM9C3C15CM23CM2CM24C4CM13CM3CM3C17C1CM2CM8C9CM4_WEIGHT;
    -- sfix(1, -7)
    signal c2c0c14cm1c2c0c4c9c5c1c11c14cm5c1c5c7_weight : PIPELINE_TYPE_FOR_C2C0C14CM1C2C0C4C9C5C1C11C14CM5C1C5C7_WEIGHT;
    -- sfix(1, -7)
    signal c11c3c5cm3cm1c45cm3cm3cm19cm6c24cm2cm2cm4cm1c4_weight : PIPELINE_TYPE_FOR_C11C3C5CM3CM1C45CM3CM3CM19CM6C24CM2CM2CM4CM1C4_WEIGHT;
    -- sfix(1, -7)
    signal cm6c2cm13c0cm13c1c1cm2c4c1c5c8c11cm15c3c11_weight : PIPELINE_TYPE_FOR_CM6C2CM13C0CM13C1C1CM2C4C1C5C8C11CM15C3C11_WEIGHT;
    -- sfix(1, -7)
    signal c36cm21c3c8cm11c16c4c0c23cm18c1cm2cm1c6c6c4_weight : PIPELINE_TYPE_FOR_C36CM21C3C8CM11C16C4C0C23CM18C1CM2CM1C6C6C4_WEIGHT;
    -- sfix(1, -7)
    signal cm2c11c13cm11cm8cm7cm7c8cm6cm2cm4c2cm26c17c1cm1_weight : PIPELINE_TYPE_FOR_CM2C11C13CM11CM8CM7CM7C8CM6CM2CM4C2CM26C17C1CM1_WEIGHT;
    -- sfix(1, -7)
    signal cm11cm7c6cm2c8cm19c10cm7cm12c16cm22c5c0cm3c3cm1_weight : PIPELINE_TYPE_FOR_CM11CM7C6CM2C8CM19C10CM7CM12C16CM22C5C0CM3C3CM1_WEIGHT;
    -- sfix(1, -7)
    signal c4c105c9cm27c0c14c9cm3cm5cm12cm1c20cm5cm1c17cm6_weight : PIPELINE_TYPE_FOR_C4C105C9CM27C0C14C9CM3CM5CM12CM1C20CM5CM1C17CM6_WEIGHT;
    -- sfix(1, -7)
    signal cm24cm27c20c12c2c14c15c0c14c7c5c0cm2cm9cm6cm2_weight : PIPELINE_TYPE_FOR_CM24CM27C20C12C2C14C15C0C14C7C5C0CM2CM9CM6CM2_WEIGHT;
    -- sfix(1, -7)
    signal c2cm17c0cm2c20c3cm3c0c9cm3c13c2c1c7cm12c1_weight : PIPELINE_TYPE_FOR_C2CM17C0CM2C20C3CM3C0C9CM3C13C2C1C7CM12C1_WEIGHT;
    -- sfix(1, -7)
    signal c1c14c15cm2cm5c12cm1c11c13cm11cm14c5cm3cm7c20cm6_weight : PIPELINE_TYPE_FOR_C1C14C15CM2CM5C12CM1C11C13CM11CM14C5CM3CM7C20CM6_WEIGHT;
    -- sfix(1, -7)
    signal cm1c34c5cm1cm27cm11c1c14cm5c6cm9cm1c5c18c7c6_weight : PIPELINE_TYPE_FOR_CM1C34C5CM1CM27CM11C1C14CM5C6CM9CM1C5C18C7C6_WEIGHT;
    -- sfix(1, -7)
    signal c0cm50cm3cm25c2c0c5cm11c2c14c3cm10cm24cm7c13c0_weight : PIPELINE_TYPE_FOR_C0CM50CM3CM25C2C0C5CM11C2C14C3CM10CM24CM7C13C0_WEIGHT;
    -- sfix(1, -7)
    signal cm9c11cm17cm22c26cm1c5c2cm5cm17cm21cm10c1c7cm2c12_weight : PIPELINE_TYPE_FOR_CM9C11CM17CM22C26CM1C5C2CM5CM17CM21CM10C1C7CM2C12_WEIGHT;
    -- sfix(1, -7)
    signal cm37c16cm8c9cm5c12cm3c8c2cm8cm7c12cm10cm2cm1cm1_weight : PIPELINE_TYPE_FOR_CM37C16CM8C9CM5C12CM3C8C2CM8CM7C12CM10CM2CM1CM1_WEIGHT;
    -- sfix(1, -7)
    signal c16cm16cm8cm3cm6cm7c1c4cm29c3cm18c1c0c8c2c0_weight : PIPELINE_TYPE_FOR_C16CM16CM8CM3CM6CM7C1C4CM29C3CM18C1C0C8C2C0_WEIGHT;
    -- sfix(1, -7)
    signal cm28c0c1cm15c19c1c4cm2c14cm3c15cm36cm2cm2cm9cm4_weight : PIPELINE_TYPE_FOR_CM28C0C1CM15C19C1C4CM2C14CM3C15CM36CM2CM2CM9CM4_WEIGHT;
    -- sfix(1, -7)
    signal c24c13cm15c3cm18cm6cm6c1cm4cm4c5c1c1c9c1cm3_weight : PIPELINE_TYPE_FOR_C24C13CM15C3CM18CM6CM6C1CM4CM4C5C1C1C9C1CM3_WEIGHT;
    -- sfix(1, -7)
    signal cm5c5cm2cm2c3c3c25cm3c4cm3c2c2c27cm10c5c7_weight : PIPELINE_TYPE_FOR_CM5C5CM2CM2C3C3C25CM3C4CM3C2C2C27CM10C5C7_WEIGHT;
    -- sfix(1, -7)
    signal cm33cm14c23cm2c15cm4c4c3c0cm9c2cm19cm4c11c13cm11_weight : PIPELINE_TYPE_FOR_CM33CM14C23CM2C15CM4C4C3C0CM9C2CM19CM4C11C13CM11_WEIGHT;
    -- sfix(1, -7)
    signal c5cm4cm2c12c6cm2cm5cm11cm4c8c21c7c10c0cm8cm8_weight : PIPELINE_TYPE_FOR_C5CM4CM2C12C6CM2CM5CM11CM4C8C21C7C10C0CM8CM8_WEIGHT;
    -- sfix(1, -7)
    signal c9c13c4cm6c0c11cm6c2c6cm15cm3c1cm12c13cm1cm2_weight : PIPELINE_TYPE_FOR_C9C13C4CM6C0C11CM6C2C6CM15CM3C1CM12C13CM1CM2_WEIGHT;
    -- sfix(1, -7)
    signal c15c11c7c6cm6c1cm1c54cm4c14cm3c7cm21c16c7cm32_weight : PIPELINE_TYPE_FOR_C15C11C7C6CM6C1CM1C54CM4C14CM3C7CM21C16C7CM32_WEIGHT;
    -- sfix(1, -7)
    signal c9cm11cm8c18c4c3cm4c2c5cm3c7cm14c3cm9c3cm8_weight : PIPELINE_TYPE_FOR_C9CM11CM8C18C4C3CM4C2C5CM3C7CM14C3CM9C3CM8_WEIGHT;
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



    WEIGHT_ROM: entity work.conv7_core10_rmcm_weightsconstant_memory
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
        
            dout1   => c16c1c14c6c2c3c4c4c6cm5c2cm2cm2c0c2c1_weight(0), 
            dout2   => cm2cm28cm2cm34c17c8c15c11c15cm12c11c5cm10cm3cm39cm3_weight(0), 
            dout3   => c4c0cm15cm5cm3c2cm3c2c5c8cm4cm2c34c0c16c33_weight(0), 
            dout4   => cm9c4c4cm6c16c4c48c3cm7c14c9c10c0c1cm7cm9_weight(0), 
            dout5   => c34c9cm2c15cm8c14c5cm12cm27c28cm8cm3c5c1c3c7_weight(0), 
            dout6   => c0cm12c11cm19c4cm4cm15cm17c6cm1cm34cm3c38cm1c8c0_weight(0), 
            dout7   => c0c7c0cm12c23c10c0cm6cm7c4c9cm12cm8cm5c3cm2_weight(0), 
            dout8   => c1cm13cm4cm12cm16c6cm5cm4c19cm3cm14c0cm2cm7cm5cm8_weight(0), 
            dout9   => cm9c3c15cm23cm2cm24c4cm13cm3cm3c17c1cm2cm8c9cm4_weight(0), 
            dout10   => c2c0c14cm1c2c0c4c9c5c1c11c14cm5c1c5c7_weight(0), 
            dout11   => c11c3c5cm3cm1c45cm3cm3cm19cm6c24cm2cm2cm4cm1c4_weight(0), 
            dout12   => cm6c2cm13c0cm13c1c1cm2c4c1c5c8c11cm15c3c11_weight(0), 
            dout13   => c36cm21c3c8cm11c16c4c0c23cm18c1cm2cm1c6c6c4_weight(0), 
            dout14   => cm2c11c13cm11cm8cm7cm7c8cm6cm2cm4c2cm26c17c1cm1_weight(0), 
            dout15   => cm11cm7c6cm2c8cm19c10cm7cm12c16cm22c5c0cm3c3cm1_weight(0), 
            dout16   => c4c105c9cm27c0c14c9cm3cm5cm12cm1c20cm5cm1c17cm6_weight(0), 
            dout17   => cm24cm27c20c12c2c14c15c0c14c7c5c0cm2cm9cm6cm2_weight(0), 
            dout18   => c2cm17c0cm2c20c3cm3c0c9cm3c13c2c1c7cm12c1_weight(0), 
            dout19   => c1c14c15cm2cm5c12cm1c11c13cm11cm14c5cm3cm7c20cm6_weight(0), 
            dout20   => cm1c34c5cm1cm27cm11c1c14cm5c6cm9cm1c5c18c7c6_weight(0), 
            dout21   => c0cm50cm3cm25c2c0c5cm11c2c14c3cm10cm24cm7c13c0_weight(0), 
            dout22   => cm9c11cm17cm22c26cm1c5c2cm5cm17cm21cm10c1c7cm2c12_weight(0), 
            dout23   => cm37c16cm8c9cm5c12cm3c8c2cm8cm7c12cm10cm2cm1cm1_weight(0), 
            dout24   => c16cm16cm8cm3cm6cm7c1c4cm29c3cm18c1c0c8c2c0_weight(0), 
            dout25   => cm28c0c1cm15c19c1c4cm2c14cm3c15cm36cm2cm2cm9cm4_weight(0), 
            dout26   => c24c13cm15c3cm18cm6cm6c1cm4cm4c5c1c1c9c1cm3_weight(0), 
            dout27   => cm5c5cm2cm2c3c3c25cm3c4cm3c2c2c27cm10c5c7_weight(0), 
            dout28   => cm33cm14c23cm2c15cm4c4c3c0cm9c2cm19cm4c11c13cm11_weight(0), 
            dout29   => c5cm4cm2c12c6cm2cm5cm11cm4c8c21c7c10c0cm8cm8_weight(0), 
            dout30   => c9c13c4cm6c0c11cm6c2c6cm15cm3c1cm12c13cm1cm2_weight(0), 
            dout31   => c15c11c7c6cm6c1cm1c54cm4c14cm3c7cm21c16c7cm32_weight(0), 
            dout32   => c9cm11cm8c18c4c3cm4c2c5cm3c7cm14c3cm9c3cm8_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_c16c1c14c6c2c3c4c4c6cm5c2cm2cm2c0c2c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c16c1c14c6c2c3c4c4c6cm5c2cm2cm2c0c2c1_weight(0), c16c1c14c6c2c3c4c4c6cm5c2cm2cm2c0c2c1_weight(1));
    PL_STEP_0_for_cm2cm28cm2cm34c17c8c15c11c15cm12c11c5cm10cm3cm39cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm28cm2cm34c17c8c15c11c15cm12c11c5cm10cm3cm39cm3_weight(0), cm2cm28cm2cm34c17c8c15c11c15cm12c11c5cm10cm3cm39cm3_weight(1));
    PL_STEP_0_for_c4c0cm15cm5cm3c2cm3c2c5c8cm4cm2c34c0c16c33_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4c0cm15cm5cm3c2cm3c2c5c8cm4cm2c34c0c16c33_weight(0), c4c0cm15cm5cm3c2cm3c2c5c8cm4cm2c34c0c16c33_weight(1));
    PL_STEP_0_for_cm9c4c4cm6c16c4c48c3cm7c14c9c10c0c1cm7cm9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm9c4c4cm6c16c4c48c3cm7c14c9c10c0c1cm7cm9_weight(0), cm9c4c4cm6c16c4c48c3cm7c14c9c10c0c1cm7cm9_weight(1));
    PL_STEP_0_for_c34c9cm2c15cm8c14c5cm12cm27c28cm8cm3c5c1c3c7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c34c9cm2c15cm8c14c5cm12cm27c28cm8cm3c5c1c3c7_weight(0), c34c9cm2c15cm8c14c5cm12cm27c28cm8cm3c5c1c3c7_weight(1));
    PL_STEP_0_for_c0cm12c11cm19c4cm4cm15cm17c6cm1cm34cm3c38cm1c8c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm12c11cm19c4cm4cm15cm17c6cm1cm34cm3c38cm1c8c0_weight(0), c0cm12c11cm19c4cm4cm15cm17c6cm1cm34cm3c38cm1c8c0_weight(1));
    PL_STEP_0_for_c0c7c0cm12c23c10c0cm6cm7c4c9cm12cm8cm5c3cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c7c0cm12c23c10c0cm6cm7c4c9cm12cm8cm5c3cm2_weight(0), c0c7c0cm12c23c10c0cm6cm7c4c9cm12cm8cm5c3cm2_weight(1));
    PL_STEP_0_for_c1cm13cm4cm12cm16c6cm5cm4c19cm3cm14c0cm2cm7cm5cm8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm13cm4cm12cm16c6cm5cm4c19cm3cm14c0cm2cm7cm5cm8_weight(0), c1cm13cm4cm12cm16c6cm5cm4c19cm3cm14c0cm2cm7cm5cm8_weight(1));
    PL_STEP_0_for_cm9c3c15cm23cm2cm24c4cm13cm3cm3c17c1cm2cm8c9cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm9c3c15cm23cm2cm24c4cm13cm3cm3c17c1cm2cm8c9cm4_weight(0), cm9c3c15cm23cm2cm24c4cm13cm3cm3c17c1cm2cm8c9cm4_weight(1));
    PL_STEP_0_for_c2c0c14cm1c2c0c4c9c5c1c11c14cm5c1c5c7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c0c14cm1c2c0c4c9c5c1c11c14cm5c1c5c7_weight(0), c2c0c14cm1c2c0c4c9c5c1c11c14cm5c1c5c7_weight(1));
    PL_STEP_0_for_c11c3c5cm3cm1c45cm3cm3cm19cm6c24cm2cm2cm4cm1c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c11c3c5cm3cm1c45cm3cm3cm19cm6c24cm2cm2cm4cm1c4_weight(0), c11c3c5cm3cm1c45cm3cm3cm19cm6c24cm2cm2cm4cm1c4_weight(1));
    PL_STEP_0_for_cm6c2cm13c0cm13c1c1cm2c4c1c5c8c11cm15c3c11_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6c2cm13c0cm13c1c1cm2c4c1c5c8c11cm15c3c11_weight(0), cm6c2cm13c0cm13c1c1cm2c4c1c5c8c11cm15c3c11_weight(1));
    PL_STEP_0_for_c36cm21c3c8cm11c16c4c0c23cm18c1cm2cm1c6c6c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c36cm21c3c8cm11c16c4c0c23cm18c1cm2cm1c6c6c4_weight(0), c36cm21c3c8cm11c16c4c0c23cm18c1cm2cm1c6c6c4_weight(1));
    PL_STEP_0_for_cm2c11c13cm11cm8cm7cm7c8cm6cm2cm4c2cm26c17c1cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c11c13cm11cm8cm7cm7c8cm6cm2cm4c2cm26c17c1cm1_weight(0), cm2c11c13cm11cm8cm7cm7c8cm6cm2cm4c2cm26c17c1cm1_weight(1));
    PL_STEP_0_for_cm11cm7c6cm2c8cm19c10cm7cm12c16cm22c5c0cm3c3cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm11cm7c6cm2c8cm19c10cm7cm12c16cm22c5c0cm3c3cm1_weight(0), cm11cm7c6cm2c8cm19c10cm7cm12c16cm22c5c0cm3c3cm1_weight(1));
    PL_STEP_0_for_c4c105c9cm27c0c14c9cm3cm5cm12cm1c20cm5cm1c17cm6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4c105c9cm27c0c14c9cm3cm5cm12cm1c20cm5cm1c17cm6_weight(0), c4c105c9cm27c0c14c9cm3cm5cm12cm1c20cm5cm1c17cm6_weight(1));
    PL_STEP_0_for_cm24cm27c20c12c2c14c15c0c14c7c5c0cm2cm9cm6cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm24cm27c20c12c2c14c15c0c14c7c5c0cm2cm9cm6cm2_weight(0), cm24cm27c20c12c2c14c15c0c14c7c5c0cm2cm9cm6cm2_weight(1));
    PL_STEP_0_for_c2cm17c0cm2c20c3cm3c0c9cm3c13c2c1c7cm12c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2cm17c0cm2c20c3cm3c0c9cm3c13c2c1c7cm12c1_weight(0), c2cm17c0cm2c20c3cm3c0c9cm3c13c2c1c7cm12c1_weight(1));
    PL_STEP_0_for_c1c14c15cm2cm5c12cm1c11c13cm11cm14c5cm3cm7c20cm6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c14c15cm2cm5c12cm1c11c13cm11cm14c5cm3cm7c20cm6_weight(0), c1c14c15cm2cm5c12cm1c11c13cm11cm14c5cm3cm7c20cm6_weight(1));
    PL_STEP_0_for_cm1c34c5cm1cm27cm11c1c14cm5c6cm9cm1c5c18c7c6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c34c5cm1cm27cm11c1c14cm5c6cm9cm1c5c18c7c6_weight(0), cm1c34c5cm1cm27cm11c1c14cm5c6cm9cm1c5c18c7c6_weight(1));
    PL_STEP_0_for_c0cm50cm3cm25c2c0c5cm11c2c14c3cm10cm24cm7c13c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm50cm3cm25c2c0c5cm11c2c14c3cm10cm24cm7c13c0_weight(0), c0cm50cm3cm25c2c0c5cm11c2c14c3cm10cm24cm7c13c0_weight(1));
    PL_STEP_0_for_cm9c11cm17cm22c26cm1c5c2cm5cm17cm21cm10c1c7cm2c12_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm9c11cm17cm22c26cm1c5c2cm5cm17cm21cm10c1c7cm2c12_weight(0), cm9c11cm17cm22c26cm1c5c2cm5cm17cm21cm10c1c7cm2c12_weight(1));
    PL_STEP_0_for_cm37c16cm8c9cm5c12cm3c8c2cm8cm7c12cm10cm2cm1cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm37c16cm8c9cm5c12cm3c8c2cm8cm7c12cm10cm2cm1cm1_weight(0), cm37c16cm8c9cm5c12cm3c8c2cm8cm7c12cm10cm2cm1cm1_weight(1));
    PL_STEP_0_for_c16cm16cm8cm3cm6cm7c1c4cm29c3cm18c1c0c8c2c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c16cm16cm8cm3cm6cm7c1c4cm29c3cm18c1c0c8c2c0_weight(0), c16cm16cm8cm3cm6cm7c1c4cm29c3cm18c1c0c8c2c0_weight(1));
    PL_STEP_0_for_cm28c0c1cm15c19c1c4cm2c14cm3c15cm36cm2cm2cm9cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm28c0c1cm15c19c1c4cm2c14cm3c15cm36cm2cm2cm9cm4_weight(0), cm28c0c1cm15c19c1c4cm2c14cm3c15cm36cm2cm2cm9cm4_weight(1));
    PL_STEP_0_for_c24c13cm15c3cm18cm6cm6c1cm4cm4c5c1c1c9c1cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c24c13cm15c3cm18cm6cm6c1cm4cm4c5c1c1c9c1cm3_weight(0), c24c13cm15c3cm18cm6cm6c1cm4cm4c5c1c1c9c1cm3_weight(1));
    PL_STEP_0_for_cm5c5cm2cm2c3c3c25cm3c4cm3c2c2c27cm10c5c7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5c5cm2cm2c3c3c25cm3c4cm3c2c2c27cm10c5c7_weight(0), cm5c5cm2cm2c3c3c25cm3c4cm3c2c2c27cm10c5c7_weight(1));
    PL_STEP_0_for_cm33cm14c23cm2c15cm4c4c3c0cm9c2cm19cm4c11c13cm11_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm33cm14c23cm2c15cm4c4c3c0cm9c2cm19cm4c11c13cm11_weight(0), cm33cm14c23cm2c15cm4c4c3c0cm9c2cm19cm4c11c13cm11_weight(1));
    PL_STEP_0_for_c5cm4cm2c12c6cm2cm5cm11cm4c8c21c7c10c0cm8cm8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5cm4cm2c12c6cm2cm5cm11cm4c8c21c7c10c0cm8cm8_weight(0), c5cm4cm2c12c6cm2cm5cm11cm4c8c21c7c10c0cm8cm8_weight(1));
    PL_STEP_0_for_c9c13c4cm6c0c11cm6c2c6cm15cm3c1cm12c13cm1cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c9c13c4cm6c0c11cm6c2c6cm15cm3c1cm12c13cm1cm2_weight(0), c9c13c4cm6c0c11cm6c2c6cm15cm3c1cm12c13cm1cm2_weight(1));
    PL_STEP_0_for_c15c11c7c6cm6c1cm1c54cm4c14cm3c7cm21c16c7cm32_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c15c11c7c6cm6c1cm1c54cm4c14cm3c7cm21c16c7cm32_weight(0), c15c11c7c6cm6c1cm1c54cm4c14cm3c7cm21c16c7cm32_weight(1));
    PL_STEP_0_for_c9cm11cm8c18c4c3cm4c2c5cm3c7cm14c3cm9c3cm8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c9cm11cm8c18c4c3cm4c2c5cm3c7cm14c3cm9c3cm8_weight(0), c9cm11cm8c18c4c3cm4c2c5cm3c7cm14c3cm9c3cm8_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    c4c105c9cm27c0c14c9cm3cm5cm12cm1c20cm5cm1c17cm6_c9c13c4cm6c0c11cm6c2c6cm15cm3c1cm12c13cm1cm2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c4c105c9cm27c0c14c9cm3cm5cm12cm1c20cm5cm1c17cm6_weight(1)(8-1 downto 0),
			B	=> c9c13c4cm6c0c11cm6c2c6cm15cm3c1cm12c13cm1cm2_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c4c105c9cm27c0c14c9cm3cm5cm12cm1c20cm5cm1c17cm6,
			CxB => R_c9c13c4cm6c0c11cm6c2c6cm15cm3c1cm12c13cm1cm2
		);

    cm2cm28cm2cm34c17c8c15c11c15cm12c11c5cm10cm3cm39cm3_cm6c2cm13c0cm13c1c1cm2c4c1c5c8c11cm15c3c11_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2cm28cm2cm34c17c8c15c11c15cm12c11c5cm10cm3cm39cm3_weight(1)(7-1 downto 0),
			B	=> cm6c2cm13c0cm13c1c1cm2c4c1c5c8c11cm15c3c11_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2cm28cm2cm34c17c8c15c11c15cm12c11c5cm10cm3cm39cm3,
			CxB => R_cm6c2cm13c0cm13c1c1cm2c4c1c5c8c11cm15c3c11
		);

    c4c0cm15cm5cm3c2cm3c2c5c8cm4cm2c34c0c16c33_c2c0c14cm1c2c0c4c9c5c1c11c14cm5c1c5c7_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c4c0cm15cm5cm3c2cm3c2c5c8cm4cm2c34c0c16c33_weight(1)(7-1 downto 0),
			B	=> c2c0c14cm1c2c0c4c9c5c1c11c14cm5c1c5c7_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c4c0cm15cm5cm3c2cm3c2c5c8cm4cm2c34c0c16c33,
			CxB => R_c2c0c14cm1c2c0c4c9c5c1c11c14cm5c1c5c7
		);

    cm9c4c4cm6c16c4c48c3cm7c14c9c10c0c1cm7cm9_c9cm11cm8c18c4c3cm4c2c5cm3c7cm14c3cm9c3cm8_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm9c4c4cm6c16c4c48c3cm7c14c9c10c0c1cm7cm9_weight(1)(7-1 downto 0),
			B	=> c9cm11cm8c18c4c3cm4c2c5cm3c7cm14c3cm9c3cm8_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm9c4c4cm6c16c4c48c3cm7c14c9c10c0c1cm7cm9,
			CxB => R_c9cm11cm8c18c4c3cm4c2c5cm3c7cm14c3cm9c3cm8
		);

    c34c9cm2c15cm8c14c5cm12cm27c28cm8cm3c5c1c3c7_c5cm4cm2c12c6cm2cm5cm11cm4c8c21c7c10c0cm8cm8_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c34c9cm2c15cm8c14c5cm12cm27c28cm8cm3c5c1c3c7_weight(1)(7-1 downto 0),
			B	=> c5cm4cm2c12c6cm2cm5cm11cm4c8c21c7c10c0cm8cm8_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c34c9cm2c15cm8c14c5cm12cm27c28cm8cm3c5c1c3c7,
			CxB => R_c5cm4cm2c12c6cm2cm5cm11cm4c8c21c7c10c0cm8cm8
		);

    c0cm12c11cm19c4cm4cm15cm17c6cm1cm34cm3c38cm1c8c0_cm5c5cm2cm2c3c3c25cm3c4cm3c2c2c27cm10c5c7_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0cm12c11cm19c4cm4cm15cm17c6cm1cm34cm3c38cm1c8c0_weight(1)(7-1 downto 0),
			B	=> cm5c5cm2cm2c3c3c25cm3c4cm3c2c2c27cm10c5c7_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0cm12c11cm19c4cm4cm15cm17c6cm1cm34cm3c38cm1c8c0,
			CxB => R_cm5c5cm2cm2c3c3c25cm3c4cm3c2c2c27cm10c5c7
		);

    c11c3c5cm3cm1c45cm3cm3cm19cm6c24cm2cm2cm4cm1c4_c24c13cm15c3cm18cm6cm6c1cm4cm4c5c1c1c9c1cm3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c11c3c5cm3cm1c45cm3cm3cm19cm6c24cm2cm2cm4cm1c4_weight(1)(7-1 downto 0),
			B	=> c24c13cm15c3cm18cm6cm6c1cm4cm4c5c1c1c9c1cm3_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c11c3c5cm3cm1c45cm3cm3cm19cm6c24cm2cm2cm4cm1c4,
			CxB => R_c24c13cm15c3cm18cm6cm6c1cm4cm4c5c1c1c9c1cm3
		);

    c36cm21c3c8cm11c16c4c0c23cm18c1cm2cm1c6c6c4_c16cm16cm8cm3cm6cm7c1c4cm29c3cm18c1c0c8c2c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c36cm21c3c8cm11c16c4c0c23cm18c1cm2cm1c6c6c4_weight(1)(7-1 downto 0),
			B	=> c16cm16cm8cm3cm6cm7c1c4cm29c3cm18c1c0c8c2c0_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c36cm21c3c8cm11c16c4c0c23cm18c1cm2cm1c6c6c4,
			CxB => R_c16cm16cm8cm3cm6cm7c1c4cm29c3cm18c1c0c8c2c0
		);

    cm1c34c5cm1cm27cm11c1c14cm5c6cm9cm1c5c18c7c6_cm9c11cm17cm22c26cm1c5c2cm5cm17cm21cm10c1c7cm2c12_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm1c34c5cm1cm27cm11c1c14cm5c6cm9cm1c5c18c7c6_weight(1)(7-1 downto 0),
			B	=> cm9c11cm17cm22c26cm1c5c2cm5cm17cm21cm10c1c7cm2c12_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1c34c5cm1cm27cm11c1c14cm5c6cm9cm1c5c18c7c6,
			CxB => R_cm9c11cm17cm22c26cm1c5c2cm5cm17cm21cm10c1c7cm2c12
		);

    c0cm50cm3cm25c2c0c5cm11c2c14c3cm10cm24cm7c13c0_c1c14c15cm2cm5c12cm1c11c13cm11cm14c5cm3cm7c20cm6_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0cm50cm3cm25c2c0c5cm11c2c14c3cm10cm24cm7c13c0_weight(1)(7-1 downto 0),
			B	=> c1c14c15cm2cm5c12cm1c11c13cm11cm14c5cm3cm7c20cm6_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0cm50cm3cm25c2c0c5cm11c2c14c3cm10cm24cm7c13c0,
			CxB => R_c1c14c15cm2cm5c12cm1c11c13cm11cm14c5cm3cm7c20cm6
		);

    cm37c16cm8c9cm5c12cm3c8c2cm8cm7c12cm10cm2cm1cm1_c2cm17c0cm2c20c3cm3c0c9cm3c13c2c1c7cm12c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm37c16cm8c9cm5c12cm3c8c2cm8cm7c12cm10cm2cm1cm1_weight(1)(7-1 downto 0),
			B	=> c2cm17c0cm2c20c3cm3c0c9cm3c13c2c1c7cm12c1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm37c16cm8c9cm5c12cm3c8c2cm8cm7c12cm10cm2cm1cm1,
			CxB => R_c2cm17c0cm2c20c3cm3c0c9cm3c13c2c1c7cm12c1
		);

    cm28c0c1cm15c19c1c4cm2c14cm3c15cm36cm2cm2cm9cm4_cm24cm27c20c12c2c14c15c0c14c7c5c0cm2cm9cm6cm2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm28c0c1cm15c19c1c4cm2c14cm3c15cm36cm2cm2cm9cm4_weight(1)(7-1 downto 0),
			B	=> cm24cm27c20c12c2c14c15c0c14c7c5c0cm2cm9cm6cm2_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm28c0c1cm15c19c1c4cm2c14cm3c15cm36cm2cm2cm9cm4,
			CxB => R_cm24cm27c20c12c2c14c15c0c14c7c5c0cm2cm9cm6cm2
		);

    cm33cm14c23cm2c15cm4c4c3c0cm9c2cm19cm4c11c13cm11_cm11cm7c6cm2c8cm19c10cm7cm12c16cm22c5c0cm3c3cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm33cm14c23cm2c15cm4c4c3c0cm9c2cm19cm4c11c13cm11_weight(1)(7-1 downto 0),
			B	=> cm11cm7c6cm2c8cm19c10cm7cm12c16cm22c5c0cm3c3cm1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm33cm14c23cm2c15cm4c4c3c0cm9c2cm19cm4c11c13cm11,
			CxB => R_cm11cm7c6cm2c8cm19c10cm7cm12c16cm22c5c0cm3c3cm1
		);

    c15c11c7c6cm6c1cm1c54cm4c14cm3c7cm21c16c7cm32_cm2c11c13cm11cm8cm7cm7c8cm6cm2cm4c2cm26c17c1cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c15c11c7c6cm6c1cm1c54cm4c14cm3c7cm21c16c7cm32_weight(1)(7-1 downto 0),
			B	=> cm2c11c13cm11cm8cm7cm7c8cm6cm2cm4c2cm26c17c1cm1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c15c11c7c6cm6c1cm1c54cm4c14cm3c7cm21c16c7cm32,
			CxB => R_cm2c11c13cm11cm8cm7cm7c8cm6cm2cm4c2cm26c17c1cm1
		);

    c16c1c14c6c2c3c4c4c6cm5c2cm2cm2c0c2c1_cm9c3c15cm23cm2cm24c4cm13cm3cm3c17c1cm2cm8c9cm4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c16c1c14c6c2c3c4c4c6cm5c2cm2cm2c0c2c1_weight(1)(6-1 downto 0),
			B	=> cm9c3c15cm23cm2cm24c4cm13cm3cm3c17c1cm2cm8c9cm4_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c16c1c14c6c2c3c4c4c6cm5c2cm2cm2c0c2c1,
			CxB => R_cm9c3c15cm23cm2cm24c4cm13cm3cm3c17c1cm2cm8c9cm4
		);

    c0c7c0cm12c23c10c0cm6cm7c4c9cm12cm8cm5c3cm2_c1cm13cm4cm12cm16c6cm5cm4c19cm3cm14c0cm2cm7cm5cm8_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0c7c0cm12c23c10c0cm6cm7c4c9cm12cm8cm5c3cm2_weight(1)(6-1 downto 0),
			B	=> c1cm13cm4cm12cm16c6cm5cm4c19cm3cm14c0cm2cm7cm5cm8_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c7c0cm12c23c10c0cm6cm7c4c9cm12cm8cm5c3cm2,
			CxB => R_c1cm13cm4cm12cm16c6cm5cm4c19cm3cm14c0cm2cm7cm5cm8
		);




end architecture;
