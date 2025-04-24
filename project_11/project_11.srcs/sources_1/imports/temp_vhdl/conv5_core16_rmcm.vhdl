library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv5_core16_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        R_c0c1c10cm5cm1cm2c4cm2cm3c0c2cm1c9c0c4c0 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c4cm13c3cm1c5c3cm12cm30c6cm6cm30cm1c13c25cm8cm16 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c9c2cm18c0cm17c1c0cm23c3c1cm2c0c3cm4cm17c5 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c0c1cm10cm17c3cm2cm77c0cm3c2c2cm47c0cm12c0cm29 : out std_logic_vector(15-1 downto 0);   --	sfix(7, -8)
        R_cm18c2cm5cm3c2cm11cm3c10cm2cm1c0cm46c4c2cm4c5 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c3c0c0c6c1c0cm6cm4c1cm2c0c1cm1c29c4cm12 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm2c2cm7c1cm7cm2cm1c0cm1c1cm24c0c0cm3c7c4 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm1cm1c9cm1cm38c3c12c22c1cm1cm8cm3cm3c14cm14c2 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c3cm7cm7cm4cm4c4cm2cm1c39c1cm8c0cm6c8c23c30 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c2c10cm6cm1c0cm8cm1cm30cm2c32cm5cm1c12c7c16c2 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c5cm5cm1cm5c1cm3cm1cm2c3cm2c4c12c1cm5cm18c6 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm7c1cm1c1c4cm4c0cm1cm8cm11cm3c1cm7cm3c1cm13 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c1c2cm19cm1c0c0c1c18c0c2cm4cm2c5c4cm23c1 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c6c1c2cm1cm2cm1c1c10c2cm30c1c6cm2c1c5c0 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c4c29c4cm2cm4cm3c4c0c2cm5c2c3cm1cm3c9cm10 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c14cm1c2c17c6cm6c38cm1cm1c0c3cm16cm3c5cm14c4 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c4cm6c3c3cm2cm5c1cm2cm5cm3c23c5c1c0c3c0 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c2c3cm4c20c0cm1cm1c26cm1c0c0cm1c12c8cm7cm9 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c1c45cm19c18cm21cm4c4cm2c0c7cm9c9c1cm3c0cm7 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm3cm14cm7cm3cm3c1c5c1cm2cm2c0cm1c2c5cm16cm5 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c2c1cm17cm2c46c0c14c26c1c1c1c6c0c0c5c3 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c1cm3c8cm11c1c1c1c5cm1cm1c1cm10c10c4c2c10 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c15c13c4c5cm23c0c1c3c0c2c1c0c13c5cm14cm1 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c0c1c20cm13c2c0c0cm1c1c1cm5c1c0c2cm9cm14 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm7cm4c0cm2cm1c24c1c36cm3c2cm1cm11c20cm7c1c3 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm1cm3c3c4cm1cm1cm2cm6c2cm2c1c0cm3cm6c1c5 : out std_logic_vector(11-1 downto 0);   --	sfix(3, -8)
        R_c7cm1c10c15c5c3c2c1c0cm1cm2c54cm4cm20cm20c0 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm39c6c24cm3cm20c0c0cm32cm4cm9c1cm6cm30c3cm5cm2 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c0c1c7cm3c2c0c1c2c0cm1c3c1c25cm31cm38c40 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c5c1cm19c0cm3cm1c2cm1c3c0cm4c3c5c3cm7cm8 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm23c0c2cm3c50cm2c0c1c20cm39c1c2cm11c6cm14cm2 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c1cm10c20c6cm26c1cm11c1c0c4c33c2c1cm23c7c2 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(9-1 downto 0)  --	sfix(1, -8)
    );
end conv5_core16_rmcm;

architecture arch of conv5_core16_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C1C10CM5CM1CM2C4CM2CM3C0C2CM1C9C0C4C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4CM13C3CM1C5C3CM12CM30C6CM6CM30CM1C13C25CM8CM16_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C9C2CM18C0CM17C1C0CM23C3C1CM2C0C3CM4CM17C5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C1CM10CM17C3CM2CM77C0CM3C2C2CM47C0CM12C0CM29_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM18C2CM5CM3C2CM11CM3C10CM2CM1C0CM46C4C2CM4C5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C0C0C6C1C0CM6CM4C1CM2C0C1CM1C29C4CM12_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C2CM7C1CM7CM2CM1C0CM1C1CM24C0C0CM3C7C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM1C9CM1CM38C3C12C22C1CM1CM8CM3CM3C14CM14C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3CM7CM7CM4CM4C4CM2CM1C39C1CM8C0CM6C8C23C30_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C10CM6CM1C0CM8CM1CM30CM2C32CM5CM1C12C7C16C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5CM5CM1CM5C1CM3CM1CM2C3CM2C4C12C1CM5CM18C6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM7C1CM1C1C4CM4C0CM1CM8CM11CM3C1CM7CM3C1CM13_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C2CM19CM1C0C0C1C18C0C2CM4CM2C5C4CM23C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6C1C2CM1CM2CM1C1C10C2CM30C1C6CM2C1C5C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4C29C4CM2CM4CM3C4C0C2CM5C2C3CM1CM3C9CM10_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C14CM1C2C17C6CM6C38CM1CM1C0C3CM16CM3C5CM14C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4CM6C3C3CM2CM5C1CM2CM5CM3C23C5C1C0C3C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C3CM4C20C0CM1CM1C26CM1C0C0CM1C12C8CM7CM9_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C45CM19C18CM21CM4C4CM2C0C7CM9C9C1CM3C0CM7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3CM14CM7CM3CM3C1C5C1CM2CM2C0CM1C2C5CM16CM5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C1CM17CM2C46C0C14C26C1C1C1C6C0C0C5C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM3C8CM11C1C1C1C5CM1CM1C1CM10C10C4C2C10_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C15C13C4C5CM23C0C1C3C0C2C1C0C13C5CM14CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C1C20CM13C2C0C0CM1C1C1CM5C1C0C2CM9CM14_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM7CM4C0CM2CM1C24C1C36CM3C2CM1CM11C20CM7C1C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM3C3C4CM1CM1CM2CM6C2CM2C1C0CM3CM6C1C5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C7CM1C10C15C5C3C2C1C0CM1CM2C54CM4CM20CM20C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM39C6C24CM3CM20C0C0CM32CM4CM9C1CM6CM30C3CM5CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C1C7CM3C2C0C1C2C0CM1C3C1C25CM31CM38C40_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5C1CM19C0CM3CM1C2CM1C3C0CM4C3C5C3CM7CM8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM23C0C2CM3C50CM2C0C1C20CM39C1C2CM11C6CM14CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM10C20C6CM26C1CM11C1C0C4C33C2C1CM23C7C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(5, -2)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(2, -6)
    signal c0c1c10cm5cm1cm2c4cm2cm3c0c2cm1c9c0c4c0_weight : PIPELINE_TYPE_FOR_C0C1C10CM5CM1CM2C4CM2CM3C0C2CM1C9C0C4C0_WEIGHT;
    -- sfix(2, -6)
    signal c4cm13c3cm1c5c3cm12cm30c6cm6cm30cm1c13c25cm8cm16_weight : PIPELINE_TYPE_FOR_C4CM13C3CM1C5C3CM12CM30C6CM6CM30CM1C13C25CM8CM16_WEIGHT;
    -- sfix(2, -6)
    signal c9c2cm18c0cm17c1c0cm23c3c1cm2c0c3cm4cm17c5_weight : PIPELINE_TYPE_FOR_C9C2CM18C0CM17C1C0CM23C3C1CM2C0C3CM4CM17C5_WEIGHT;
    -- sfix(2, -6)
    signal c0c1cm10cm17c3cm2cm77c0cm3c2c2cm47c0cm12c0cm29_weight : PIPELINE_TYPE_FOR_C0C1CM10CM17C3CM2CM77C0CM3C2C2CM47C0CM12C0CM29_WEIGHT;
    -- sfix(2, -6)
    signal cm18c2cm5cm3c2cm11cm3c10cm2cm1c0cm46c4c2cm4c5_weight : PIPELINE_TYPE_FOR_CM18C2CM5CM3C2CM11CM3C10CM2CM1C0CM46C4C2CM4C5_WEIGHT;
    -- sfix(2, -6)
    signal c3c0c0c6c1c0cm6cm4c1cm2c0c1cm1c29c4cm12_weight : PIPELINE_TYPE_FOR_C3C0C0C6C1C0CM6CM4C1CM2C0C1CM1C29C4CM12_WEIGHT;
    -- sfix(2, -6)
    signal cm2c2cm7c1cm7cm2cm1c0cm1c1cm24c0c0cm3c7c4_weight : PIPELINE_TYPE_FOR_CM2C2CM7C1CM7CM2CM1C0CM1C1CM24C0C0CM3C7C4_WEIGHT;
    -- sfix(2, -6)
    signal cm1cm1c9cm1cm38c3c12c22c1cm1cm8cm3cm3c14cm14c2_weight : PIPELINE_TYPE_FOR_CM1CM1C9CM1CM38C3C12C22C1CM1CM8CM3CM3C14CM14C2_WEIGHT;
    -- sfix(2, -6)
    signal c3cm7cm7cm4cm4c4cm2cm1c39c1cm8c0cm6c8c23c30_weight : PIPELINE_TYPE_FOR_C3CM7CM7CM4CM4C4CM2CM1C39C1CM8C0CM6C8C23C30_WEIGHT;
    -- sfix(2, -6)
    signal c2c10cm6cm1c0cm8cm1cm30cm2c32cm5cm1c12c7c16c2_weight : PIPELINE_TYPE_FOR_C2C10CM6CM1C0CM8CM1CM30CM2C32CM5CM1C12C7C16C2_WEIGHT;
    -- sfix(2, -6)
    signal c5cm5cm1cm5c1cm3cm1cm2c3cm2c4c12c1cm5cm18c6_weight : PIPELINE_TYPE_FOR_C5CM5CM1CM5C1CM3CM1CM2C3CM2C4C12C1CM5CM18C6_WEIGHT;
    -- sfix(2, -6)
    signal cm7c1cm1c1c4cm4c0cm1cm8cm11cm3c1cm7cm3c1cm13_weight : PIPELINE_TYPE_FOR_CM7C1CM1C1C4CM4C0CM1CM8CM11CM3C1CM7CM3C1CM13_WEIGHT;
    -- sfix(2, -6)
    signal c1c2cm19cm1c0c0c1c18c0c2cm4cm2c5c4cm23c1_weight : PIPELINE_TYPE_FOR_C1C2CM19CM1C0C0C1C18C0C2CM4CM2C5C4CM23C1_WEIGHT;
    -- sfix(2, -6)
    signal c6c1c2cm1cm2cm1c1c10c2cm30c1c6cm2c1c5c0_weight : PIPELINE_TYPE_FOR_C6C1C2CM1CM2CM1C1C10C2CM30C1C6CM2C1C5C0_WEIGHT;
    -- sfix(2, -6)
    signal c4c29c4cm2cm4cm3c4c0c2cm5c2c3cm1cm3c9cm10_weight : PIPELINE_TYPE_FOR_C4C29C4CM2CM4CM3C4C0C2CM5C2C3CM1CM3C9CM10_WEIGHT;
    -- sfix(2, -6)
    signal c14cm1c2c17c6cm6c38cm1cm1c0c3cm16cm3c5cm14c4_weight : PIPELINE_TYPE_FOR_C14CM1C2C17C6CM6C38CM1CM1C0C3CM16CM3C5CM14C4_WEIGHT;
    -- sfix(2, -6)
    signal c4cm6c3c3cm2cm5c1cm2cm5cm3c23c5c1c0c3c0_weight : PIPELINE_TYPE_FOR_C4CM6C3C3CM2CM5C1CM2CM5CM3C23C5C1C0C3C0_WEIGHT;
    -- sfix(2, -6)
    signal c2c3cm4c20c0cm1cm1c26cm1c0c0cm1c12c8cm7cm9_weight : PIPELINE_TYPE_FOR_C2C3CM4C20C0CM1CM1C26CM1C0C0CM1C12C8CM7CM9_WEIGHT;
    -- sfix(2, -6)
    signal c1c45cm19c18cm21cm4c4cm2c0c7cm9c9c1cm3c0cm7_weight : PIPELINE_TYPE_FOR_C1C45CM19C18CM21CM4C4CM2C0C7CM9C9C1CM3C0CM7_WEIGHT;
    -- sfix(2, -6)
    signal cm3cm14cm7cm3cm3c1c5c1cm2cm2c0cm1c2c5cm16cm5_weight : PIPELINE_TYPE_FOR_CM3CM14CM7CM3CM3C1C5C1CM2CM2C0CM1C2C5CM16CM5_WEIGHT;
    -- sfix(2, -6)
    signal c2c1cm17cm2c46c0c14c26c1c1c1c6c0c0c5c3_weight : PIPELINE_TYPE_FOR_C2C1CM17CM2C46C0C14C26C1C1C1C6C0C0C5C3_WEIGHT;
    -- sfix(2, -6)
    signal c1cm3c8cm11c1c1c1c5cm1cm1c1cm10c10c4c2c10_weight : PIPELINE_TYPE_FOR_C1CM3C8CM11C1C1C1C5CM1CM1C1CM10C10C4C2C10_WEIGHT;
    -- sfix(2, -6)
    signal c15c13c4c5cm23c0c1c3c0c2c1c0c13c5cm14cm1_weight : PIPELINE_TYPE_FOR_C15C13C4C5CM23C0C1C3C0C2C1C0C13C5CM14CM1_WEIGHT;
    -- sfix(2, -6)
    signal c0c1c20cm13c2c0c0cm1c1c1cm5c1c0c2cm9cm14_weight : PIPELINE_TYPE_FOR_C0C1C20CM13C2C0C0CM1C1C1CM5C1C0C2CM9CM14_WEIGHT;
    -- sfix(2, -6)
    signal cm7cm4c0cm2cm1c24c1c36cm3c2cm1cm11c20cm7c1c3_weight : PIPELINE_TYPE_FOR_CM7CM4C0CM2CM1C24C1C36CM3C2CM1CM11C20CM7C1C3_WEIGHT;
    -- sfix(2, -6)
    signal cm1cm3c3c4cm1cm1cm2cm6c2cm2c1c0cm3cm6c1c5_weight : PIPELINE_TYPE_FOR_CM1CM3C3C4CM1CM1CM2CM6C2CM2C1C0CM3CM6C1C5_WEIGHT;
    -- sfix(2, -6)
    signal c7cm1c10c15c5c3c2c1c0cm1cm2c54cm4cm20cm20c0_weight : PIPELINE_TYPE_FOR_C7CM1C10C15C5C3C2C1C0CM1CM2C54CM4CM20CM20C0_WEIGHT;
    -- sfix(2, -6)
    signal cm39c6c24cm3cm20c0c0cm32cm4cm9c1cm6cm30c3cm5cm2_weight : PIPELINE_TYPE_FOR_CM39C6C24CM3CM20C0C0CM32CM4CM9C1CM6CM30C3CM5CM2_WEIGHT;
    -- sfix(2, -6)
    signal c0c1c7cm3c2c0c1c2c0cm1c3c1c25cm31cm38c40_weight : PIPELINE_TYPE_FOR_C0C1C7CM3C2C0C1C2C0CM1C3C1C25CM31CM38C40_WEIGHT;
    -- sfix(2, -6)
    signal c5c1cm19c0cm3cm1c2cm1c3c0cm4c3c5c3cm7cm8_weight : PIPELINE_TYPE_FOR_C5C1CM19C0CM3CM1C2CM1C3C0CM4C3C5C3CM7CM8_WEIGHT;
    -- sfix(2, -6)
    signal cm23c0c2cm3c50cm2c0c1c20cm39c1c2cm11c6cm14cm2_weight : PIPELINE_TYPE_FOR_CM23C0C2CM3C50CM2C0C1C20CM39C1C2CM11C6CM14CM2_WEIGHT;
    -- sfix(2, -6)
    signal c1cm10c20c6cm26c1cm11c1c0c4c33c2c1cm23c7c2_weight : PIPELINE_TYPE_FOR_C1CM10C20C6CM26C1CM11C1C0C4C33C2C1CM23C7C2_WEIGHT;
    -- sfix(2, -6)
    signal c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight : PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT;

    -- The zero output
    signal c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : std_logic_vector(9-1 downto 0); --	sfix(1, -8)

    -- If we use LUT multiplier and the input is unsigned, we have to cut away the msb of the result
    -- If this is the case, the temporary results are stored in the signals below.


begin
    c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 <= (others => '0');
    R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 <= c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0;
    X0_signal(0) <= X0;



    WEIGHT_ROM: entity work.conv5_core16_rmcm_weightsconstant_memory
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
        
            dout1   => c0c1c10cm5cm1cm2c4cm2cm3c0c2cm1c9c0c4c0_weight(0), 
            dout2   => c4cm13c3cm1c5c3cm12cm30c6cm6cm30cm1c13c25cm8cm16_weight(0), 
            dout3   => c9c2cm18c0cm17c1c0cm23c3c1cm2c0c3cm4cm17c5_weight(0), 
            dout4   => c0c1cm10cm17c3cm2cm77c0cm3c2c2cm47c0cm12c0cm29_weight(0), 
            dout5   => cm18c2cm5cm3c2cm11cm3c10cm2cm1c0cm46c4c2cm4c5_weight(0), 
            dout6   => c3c0c0c6c1c0cm6cm4c1cm2c0c1cm1c29c4cm12_weight(0), 
            dout7   => cm2c2cm7c1cm7cm2cm1c0cm1c1cm24c0c0cm3c7c4_weight(0), 
            dout8   => cm1cm1c9cm1cm38c3c12c22c1cm1cm8cm3cm3c14cm14c2_weight(0), 
            dout9   => c3cm7cm7cm4cm4c4cm2cm1c39c1cm8c0cm6c8c23c30_weight(0), 
            dout10   => c2c10cm6cm1c0cm8cm1cm30cm2c32cm5cm1c12c7c16c2_weight(0), 
            dout11   => c5cm5cm1cm5c1cm3cm1cm2c3cm2c4c12c1cm5cm18c6_weight(0), 
            dout12   => cm7c1cm1c1c4cm4c0cm1cm8cm11cm3c1cm7cm3c1cm13_weight(0), 
            dout13   => c1c2cm19cm1c0c0c1c18c0c2cm4cm2c5c4cm23c1_weight(0), 
            dout14   => c6c1c2cm1cm2cm1c1c10c2cm30c1c6cm2c1c5c0_weight(0), 
            dout15   => c4c29c4cm2cm4cm3c4c0c2cm5c2c3cm1cm3c9cm10_weight(0), 
            dout16   => c14cm1c2c17c6cm6c38cm1cm1c0c3cm16cm3c5cm14c4_weight(0), 
            dout17   => c4cm6c3c3cm2cm5c1cm2cm5cm3c23c5c1c0c3c0_weight(0), 
            dout18   => c2c3cm4c20c0cm1cm1c26cm1c0c0cm1c12c8cm7cm9_weight(0), 
            dout19   => c1c45cm19c18cm21cm4c4cm2c0c7cm9c9c1cm3c0cm7_weight(0), 
            dout20   => cm3cm14cm7cm3cm3c1c5c1cm2cm2c0cm1c2c5cm16cm5_weight(0), 
            dout21   => c2c1cm17cm2c46c0c14c26c1c1c1c6c0c0c5c3_weight(0), 
            dout22   => c1cm3c8cm11c1c1c1c5cm1cm1c1cm10c10c4c2c10_weight(0), 
            dout23   => c15c13c4c5cm23c0c1c3c0c2c1c0c13c5cm14cm1_weight(0), 
            dout24   => c0c1c20cm13c2c0c0cm1c1c1cm5c1c0c2cm9cm14_weight(0), 
            dout25   => cm7cm4c0cm2cm1c24c1c36cm3c2cm1cm11c20cm7c1c3_weight(0), 
            dout26   => cm1cm3c3c4cm1cm1cm2cm6c2cm2c1c0cm3cm6c1c5_weight(0), 
            dout27   => c7cm1c10c15c5c3c2c1c0cm1cm2c54cm4cm20cm20c0_weight(0), 
            dout28   => cm39c6c24cm3cm20c0c0cm32cm4cm9c1cm6cm30c3cm5cm2_weight(0), 
            dout29   => c0c1c7cm3c2c0c1c2c0cm1c3c1c25cm31cm38c40_weight(0), 
            dout30   => c5c1cm19c0cm3cm1c2cm1c3c0cm4c3c5c3cm7cm8_weight(0), 
            dout31   => cm23c0c2cm3c50cm2c0c1c20cm39c1c2cm11c6cm14cm2_weight(0), 
            dout32   => c1cm10c20c6cm26c1cm11c1c0c4c33c2c1cm23c7c2_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_c0c1c10cm5cm1cm2c4cm2cm3c0c2cm1c9c0c4c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c1c10cm5cm1cm2c4cm2cm3c0c2cm1c9c0c4c0_weight(0), c0c1c10cm5cm1cm2c4cm2cm3c0c2cm1c9c0c4c0_weight(1));
    PL_STEP_0_for_c4cm13c3cm1c5c3cm12cm30c6cm6cm30cm1c13c25cm8cm16_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4cm13c3cm1c5c3cm12cm30c6cm6cm30cm1c13c25cm8cm16_weight(0), c4cm13c3cm1c5c3cm12cm30c6cm6cm30cm1c13c25cm8cm16_weight(1));
    PL_STEP_0_for_c9c2cm18c0cm17c1c0cm23c3c1cm2c0c3cm4cm17c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c9c2cm18c0cm17c1c0cm23c3c1cm2c0c3cm4cm17c5_weight(0), c9c2cm18c0cm17c1c0cm23c3c1cm2c0c3cm4cm17c5_weight(1));
    PL_STEP_0_for_c0c1cm10cm17c3cm2cm77c0cm3c2c2cm47c0cm12c0cm29_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c1cm10cm17c3cm2cm77c0cm3c2c2cm47c0cm12c0cm29_weight(0), c0c1cm10cm17c3cm2cm77c0cm3c2c2cm47c0cm12c0cm29_weight(1));
    PL_STEP_0_for_cm18c2cm5cm3c2cm11cm3c10cm2cm1c0cm46c4c2cm4c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm18c2cm5cm3c2cm11cm3c10cm2cm1c0cm46c4c2cm4c5_weight(0), cm18c2cm5cm3c2cm11cm3c10cm2cm1c0cm46c4c2cm4c5_weight(1));
    PL_STEP_0_for_c3c0c0c6c1c0cm6cm4c1cm2c0c1cm1c29c4cm12_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c0c0c6c1c0cm6cm4c1cm2c0c1cm1c29c4cm12_weight(0), c3c0c0c6c1c0cm6cm4c1cm2c0c1cm1c29c4cm12_weight(1));
    PL_STEP_0_for_cm2c2cm7c1cm7cm2cm1c0cm1c1cm24c0c0cm3c7c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c2cm7c1cm7cm2cm1c0cm1c1cm24c0c0cm3c7c4_weight(0), cm2c2cm7c1cm7cm2cm1c0cm1c1cm24c0c0cm3c7c4_weight(1));
    PL_STEP_0_for_cm1cm1c9cm1cm38c3c12c22c1cm1cm8cm3cm3c14cm14c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm1c9cm1cm38c3c12c22c1cm1cm8cm3cm3c14cm14c2_weight(0), cm1cm1c9cm1cm38c3c12c22c1cm1cm8cm3cm3c14cm14c2_weight(1));
    PL_STEP_0_for_c3cm7cm7cm4cm4c4cm2cm1c39c1cm8c0cm6c8c23c30_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3cm7cm7cm4cm4c4cm2cm1c39c1cm8c0cm6c8c23c30_weight(0), c3cm7cm7cm4cm4c4cm2cm1c39c1cm8c0cm6c8c23c30_weight(1));
    PL_STEP_0_for_c2c10cm6cm1c0cm8cm1cm30cm2c32cm5cm1c12c7c16c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c10cm6cm1c0cm8cm1cm30cm2c32cm5cm1c12c7c16c2_weight(0), c2c10cm6cm1c0cm8cm1cm30cm2c32cm5cm1c12c7c16c2_weight(1));
    PL_STEP_0_for_c5cm5cm1cm5c1cm3cm1cm2c3cm2c4c12c1cm5cm18c6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5cm5cm1cm5c1cm3cm1cm2c3cm2c4c12c1cm5cm18c6_weight(0), c5cm5cm1cm5c1cm3cm1cm2c3cm2c4c12c1cm5cm18c6_weight(1));
    PL_STEP_0_for_cm7c1cm1c1c4cm4c0cm1cm8cm11cm3c1cm7cm3c1cm13_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm7c1cm1c1c4cm4c0cm1cm8cm11cm3c1cm7cm3c1cm13_weight(0), cm7c1cm1c1c4cm4c0cm1cm8cm11cm3c1cm7cm3c1cm13_weight(1));
    PL_STEP_0_for_c1c2cm19cm1c0c0c1c18c0c2cm4cm2c5c4cm23c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c2cm19cm1c0c0c1c18c0c2cm4cm2c5c4cm23c1_weight(0), c1c2cm19cm1c0c0c1c18c0c2cm4cm2c5c4cm23c1_weight(1));
    PL_STEP_0_for_c6c1c2cm1cm2cm1c1c10c2cm30c1c6cm2c1c5c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6c1c2cm1cm2cm1c1c10c2cm30c1c6cm2c1c5c0_weight(0), c6c1c2cm1cm2cm1c1c10c2cm30c1c6cm2c1c5c0_weight(1));
    PL_STEP_0_for_c4c29c4cm2cm4cm3c4c0c2cm5c2c3cm1cm3c9cm10_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4c29c4cm2cm4cm3c4c0c2cm5c2c3cm1cm3c9cm10_weight(0), c4c29c4cm2cm4cm3c4c0c2cm5c2c3cm1cm3c9cm10_weight(1));
    PL_STEP_0_for_c14cm1c2c17c6cm6c38cm1cm1c0c3cm16cm3c5cm14c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c14cm1c2c17c6cm6c38cm1cm1c0c3cm16cm3c5cm14c4_weight(0), c14cm1c2c17c6cm6c38cm1cm1c0c3cm16cm3c5cm14c4_weight(1));
    PL_STEP_0_for_c4cm6c3c3cm2cm5c1cm2cm5cm3c23c5c1c0c3c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4cm6c3c3cm2cm5c1cm2cm5cm3c23c5c1c0c3c0_weight(0), c4cm6c3c3cm2cm5c1cm2cm5cm3c23c5c1c0c3c0_weight(1));
    PL_STEP_0_for_c2c3cm4c20c0cm1cm1c26cm1c0c0cm1c12c8cm7cm9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c3cm4c20c0cm1cm1c26cm1c0c0cm1c12c8cm7cm9_weight(0), c2c3cm4c20c0cm1cm1c26cm1c0c0cm1c12c8cm7cm9_weight(1));
    PL_STEP_0_for_c1c45cm19c18cm21cm4c4cm2c0c7cm9c9c1cm3c0cm7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c45cm19c18cm21cm4c4cm2c0c7cm9c9c1cm3c0cm7_weight(0), c1c45cm19c18cm21cm4c4cm2c0c7cm9c9c1cm3c0cm7_weight(1));
    PL_STEP_0_for_cm3cm14cm7cm3cm3c1c5c1cm2cm2c0cm1c2c5cm16cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3cm14cm7cm3cm3c1c5c1cm2cm2c0cm1c2c5cm16cm5_weight(0), cm3cm14cm7cm3cm3c1c5c1cm2cm2c0cm1c2c5cm16cm5_weight(1));
    PL_STEP_0_for_c2c1cm17cm2c46c0c14c26c1c1c1c6c0c0c5c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c1cm17cm2c46c0c14c26c1c1c1c6c0c0c5c3_weight(0), c2c1cm17cm2c46c0c14c26c1c1c1c6c0c0c5c3_weight(1));
    PL_STEP_0_for_c1cm3c8cm11c1c1c1c5cm1cm1c1cm10c10c4c2c10_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm3c8cm11c1c1c1c5cm1cm1c1cm10c10c4c2c10_weight(0), c1cm3c8cm11c1c1c1c5cm1cm1c1cm10c10c4c2c10_weight(1));
    PL_STEP_0_for_c15c13c4c5cm23c0c1c3c0c2c1c0c13c5cm14cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c15c13c4c5cm23c0c1c3c0c2c1c0c13c5cm14cm1_weight(0), c15c13c4c5cm23c0c1c3c0c2c1c0c13c5cm14cm1_weight(1));
    PL_STEP_0_for_c0c1c20cm13c2c0c0cm1c1c1cm5c1c0c2cm9cm14_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c1c20cm13c2c0c0cm1c1c1cm5c1c0c2cm9cm14_weight(0), c0c1c20cm13c2c0c0cm1c1c1cm5c1c0c2cm9cm14_weight(1));
    PL_STEP_0_for_cm7cm4c0cm2cm1c24c1c36cm3c2cm1cm11c20cm7c1c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm7cm4c0cm2cm1c24c1c36cm3c2cm1cm11c20cm7c1c3_weight(0), cm7cm4c0cm2cm1c24c1c36cm3c2cm1cm11c20cm7c1c3_weight(1));
    PL_STEP_0_for_cm1cm3c3c4cm1cm1cm2cm6c2cm2c1c0cm3cm6c1c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm3c3c4cm1cm1cm2cm6c2cm2c1c0cm3cm6c1c5_weight(0), cm1cm3c3c4cm1cm1cm2cm6c2cm2c1c0cm3cm6c1c5_weight(1));
    PL_STEP_0_for_c7cm1c10c15c5c3c2c1c0cm1cm2c54cm4cm20cm20c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c7cm1c10c15c5c3c2c1c0cm1cm2c54cm4cm20cm20c0_weight(0), c7cm1c10c15c5c3c2c1c0cm1cm2c54cm4cm20cm20c0_weight(1));
    PL_STEP_0_for_cm39c6c24cm3cm20c0c0cm32cm4cm9c1cm6cm30c3cm5cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm39c6c24cm3cm20c0c0cm32cm4cm9c1cm6cm30c3cm5cm2_weight(0), cm39c6c24cm3cm20c0c0cm32cm4cm9c1cm6cm30c3cm5cm2_weight(1));
    PL_STEP_0_for_c0c1c7cm3c2c0c1c2c0cm1c3c1c25cm31cm38c40_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c1c7cm3c2c0c1c2c0cm1c3c1c25cm31cm38c40_weight(0), c0c1c7cm3c2c0c1c2c0cm1c3c1c25cm31cm38c40_weight(1));
    PL_STEP_0_for_c5c1cm19c0cm3cm1c2cm1c3c0cm4c3c5c3cm7cm8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5c1cm19c0cm3cm1c2cm1c3c0cm4c3c5c3cm7cm8_weight(0), c5c1cm19c0cm3cm1c2cm1c3c0cm4c3c5c3cm7cm8_weight(1));
    PL_STEP_0_for_cm23c0c2cm3c50cm2c0c1c20cm39c1c2cm11c6cm14cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm23c0c2cm3c50cm2c0c1c20cm39c1c2cm11c6cm14cm2_weight(0), cm23c0c2cm3c50cm2c0c1c20cm39c1c2cm11c6cm14cm2_weight(1));
    PL_STEP_0_for_c1cm10c20c6cm26c1cm11c1c0c4c33c2c1cm23c7c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm10c20c6cm26c1cm11c1c0c4c33c2c1cm23c7c2_weight(0), c1cm10c20c6cm26c1cm11c1c0c4c33c2c1cm23c7c2_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    c0c1cm10cm17c3cm2cm77c0cm3c2c2cm47c0cm12c0cm29_cm1cm3c3c4cm1cm1cm2cm6c2cm2c1c0cm3cm6c1c5_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 8,
			B_WIDTH => 4,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c0c1cm10cm17c3cm2cm77c0cm3c2c2cm47c0cm12c0cm29_weight(1)(8-1 downto 0),
			B	=> cm1cm3c3c4cm1cm1cm2cm6c2cm2c1c0cm3cm6c1c5_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c1cm10cm17c3cm2cm77c0cm3c2c2cm47c0cm12c0cm29,
			CxB => R_cm1cm3c3c4cm1cm1cm2cm6c2cm2c1c0cm3cm6c1c5
		);

    cm18c2cm5cm3c2cm11cm3c10cm2cm1c0cm46c4c2cm4c5_c1cm3c8cm11c1c1c1c5cm1cm1c1cm10c10c4c2c10_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 5,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm18c2cm5cm3c2cm11cm3c10cm2cm1c0cm46c4c2cm4c5_weight(1)(7-1 downto 0),
			B	=> c1cm3c8cm11c1c1c1c5cm1cm1c1cm10c10c4c2c10_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm18c2cm5cm3c2cm11cm3c10cm2cm1c0cm46c4c2cm4c5,
			CxB => R_c1cm3c8cm11c1c1c1c5cm1cm1c1cm10c10c4c2c10
		);

    cm1cm1c9cm1cm38c3c12c22c1cm1cm8cm3cm3c14cm14c2_cm3cm14cm7cm3cm3c1c5c1cm2cm2c0cm1c2c5cm16cm5_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 5,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm1cm1c9cm1cm38c3c12c22c1cm1cm8cm3cm3c14cm14c2_weight(1)(7-1 downto 0),
			B	=> cm3cm14cm7cm3cm3c1c5c1cm2cm2c0cm1c2c5cm16cm5_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1cm1c9cm1cm38c3c12c22c1cm1cm8cm3cm3c14cm14c2,
			CxB => R_cm3cm14cm7cm3cm3c1c5c1cm2cm2c0cm1c2c5cm16cm5
		);

    c3cm7cm7cm4cm4c4cm2cm1c39c1cm8c0cm6c8c23c30_cm7c1cm1c1c4cm4c0cm1cm8cm11cm3c1cm7cm3c1cm13_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 5,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c3cm7cm7cm4cm4c4cm2cm1c39c1cm8c0cm6c8c23c30_weight(1)(7-1 downto 0),
			B	=> cm7c1cm1c1c4cm4c0cm1cm8cm11cm3c1cm7cm3c1cm13_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c3cm7cm7cm4cm4c4cm2cm1c39c1cm8c0cm6c8c23c30,
			CxB => R_cm7c1cm1c1c4cm4c0cm1cm8cm11cm3c1cm7cm3c1cm13
		);

    c2c10cm6cm1c0cm8cm1cm30cm2c32cm5cm1c12c7c16c2_c0c1c10cm5cm1cm2c4cm2cm3c0c2cm1c9c0c4c0_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 5,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c2c10cm6cm1c0cm8cm1cm30cm2c32cm5cm1c12c7c16c2_weight(1)(7-1 downto 0),
			B	=> c0c1c10cm5cm1cm2c4cm2cm3c0c2cm1c9c0c4c0_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c2c10cm6cm1c0cm8cm1cm30cm2c32cm5cm1c12c7c16c2,
			CxB => R_c0c1c10cm5cm1cm2c4cm2cm3c0c2cm1c9c0c4c0
		);

    c14cm1c2c17c6cm6c38cm1cm1c0c3cm16cm3c5cm14c4_c5c1cm19c0cm3cm1c2cm1c3c0cm4c3c5c3cm7cm8_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 6,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c14cm1c2c17c6cm6c38cm1cm1c0c3cm16cm3c5cm14c4_weight(1)(7-1 downto 0),
			B	=> c5c1cm19c0cm3cm1c2cm1c3c0cm4c3c5c3cm7cm8_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c14cm1c2c17c6cm6c38cm1cm1c0c3cm16cm3c5cm14c4,
			CxB => R_c5c1cm19c0cm3cm1c2cm1c3c0cm4c3c5c3cm7cm8
		);

    c1c45cm19c18cm21cm4c4cm2c0c7cm9c9c1cm3c0cm7_c0c1c20cm13c2c0c0cm1c1c1cm5c1c0c2cm9cm14_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 6,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c1c45cm19c18cm21cm4c4cm2c0c7cm9c9c1cm3c0cm7_weight(1)(7-1 downto 0),
			B	=> c0c1c20cm13c2c0c0cm1c1c1cm5c1c0c2cm9cm14_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1c45cm19c18cm21cm4c4cm2c0c7cm9c9c1cm3c0cm7,
			CxB => R_c0c1c20cm13c2c0c0cm1c1c1cm5c1c0c2cm9cm14
		);

    c2c1cm17cm2c46c0c14c26c1c1c1c6c0c0c5c3_c15c13c4c5cm23c0c1c3c0c2c1c0c13c5cm14cm1_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 6,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c2c1cm17cm2c46c0c14c26c1c1c1c6c0c0c5c3_weight(1)(7-1 downto 0),
			B	=> c15c13c4c5cm23c0c1c3c0c2c1c0c13c5cm14cm1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c2c1cm17cm2c46c0c14c26c1c1c1c6c0c0c5c3,
			CxB => R_c15c13c4c5cm23c0c1c3c0c2c1c0c13c5cm14cm1
		);

    cm7cm4c0cm2cm1c24c1c36cm3c2cm1cm11c20cm7c1c3_c2c3cm4c20c0cm1cm1c26cm1c0c0cm1c12c8cm7cm9_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 6,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm7cm4c0cm2cm1c24c1c36cm3c2cm1cm11c20cm7c1c3_weight(1)(7-1 downto 0),
			B	=> c2c3cm4c20c0cm1cm1c26cm1c0c0cm1c12c8cm7cm9_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm7cm4c0cm2cm1c24c1c36cm3c2cm1cm11c20cm7c1c3,
			CxB => R_c2c3cm4c20c0cm1cm1c26cm1c0c0cm1c12c8cm7cm9
		);

    c7cm1c10c15c5c3c2c1c0cm1cm2c54cm4cm20cm20c0_c4cm6c3c3cm2cm5c1cm2cm5cm3c23c5c1c0c3c0_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 6,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c7cm1c10c15c5c3c2c1c0cm1cm2c54cm4cm20cm20c0_weight(1)(7-1 downto 0),
			B	=> c4cm6c3c3cm2cm5c1cm2cm5cm3c23c5c1c0c3c0_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c7cm1c10c15c5c3c2c1c0cm1cm2c54cm4cm20cm20c0,
			CxB => R_c4cm6c3c3cm2cm5c1cm2cm5cm3c23c5c1c0c3c0
		);

    cm39c6c24cm3cm20c0c0cm32cm4cm9c1cm6cm30c3cm5cm2_c4c29c4cm2cm4cm3c4c0c2cm5c2c3cm1cm3c9cm10_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 6,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm39c6c24cm3cm20c0c0cm32cm4cm9c1cm6cm30c3cm5cm2_weight(1)(7-1 downto 0),
			B	=> c4c29c4cm2cm4cm3c4c0c2cm5c2c3cm1cm3c9cm10_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm39c6c24cm3cm20c0c0cm32cm4cm9c1cm6cm30c3cm5cm2,
			CxB => R_c4c29c4cm2cm4cm3c4c0c2cm5c2c3cm1cm3c9cm10
		);

    c0c1c7cm3c2c0c1c2c0cm1c3c1c25cm31cm38c40_c6c1c2cm1cm2cm1c1c10c2cm30c1c6cm2c1c5c0_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 6,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c0c1c7cm3c2c0c1c2c0cm1c3c1c25cm31cm38c40_weight(1)(7-1 downto 0),
			B	=> c6c1c2cm1cm2cm1c1c10c2cm30c1c6cm2c1c5c0_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c1c7cm3c2c0c1c2c0cm1c3c1c25cm31cm38c40,
			CxB => R_c6c1c2cm1cm2cm1c1c10c2cm30c1c6cm2c1c5c0
		);

    cm23c0c2cm3c50cm2c0c1c20cm39c1c2cm11c6cm14cm2_c1c2cm19cm1c0c0c1c18c0c2cm4cm2c5c4cm23c1_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 6,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm23c0c2cm3c50cm2c0c1c20cm39c1c2cm11c6cm14cm2_weight(1)(7-1 downto 0),
			B	=> c1c2cm19cm1c0c0c1c18c0c2cm4cm2c5c4cm23c1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm23c0c2cm3c50cm2c0c1c20cm39c1c2cm11c6cm14cm2,
			CxB => R_c1c2cm19cm1c0c0c1c18c0c2cm4cm2c5c4cm23c1
		);

    c1cm10c20c6cm26c1cm11c1c0c4c33c2c1cm23c7c2_c5cm5cm1cm5c1cm3cm1cm2c3cm2c4c12c1cm5cm18c6_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 6,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c1cm10c20c6cm26c1cm11c1c0c4c33c2c1cm23c7c2_weight(1)(7-1 downto 0),
			B	=> c5cm5cm1cm5c1cm3cm1cm2c3cm2c4c12c1cm5cm18c6_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1cm10c20c6cm26c1cm11c1c0c4c33c2c1cm23c7c2,
			CxB => R_c5cm5cm1cm5c1cm3cm1cm2c3cm2c4c12c1cm5cm18c6
		);

    c4cm13c3cm1c5c3cm12cm30c6cm6cm30cm1c13c25cm8cm16_cm2c2cm7c1cm7cm2cm1c0cm1c1cm24c0c0cm3c7c4_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 6,
			B_WIDTH => 6,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c4cm13c3cm1c5c3cm12cm30c6cm6cm30cm1c13c25cm8cm16_weight(1)(6-1 downto 0),
			B	=> cm2c2cm7c1cm7cm2cm1c0cm1c1cm24c0c0cm3c7c4_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c4cm13c3cm1c5c3cm12cm30c6cm6cm30cm1c13c25cm8cm16,
			CxB => R_cm2c2cm7c1cm7cm2cm1c0cm1c1cm24c0c0cm3c7c4
		);

    c9c2cm18c0cm17c1c0cm23c3c1cm2c0c3cm4cm17c5_c3c0c0c6c1c0cm6cm4c1cm2c0c1cm1c29c4cm12_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 6,
			B_WIDTH => 6,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c9c2cm18c0cm17c1c0cm23c3c1cm2c0c3cm4cm17c5_weight(1)(6-1 downto 0),
			B	=> c3c0c0c6c1c0cm6cm4c1cm2c0c1cm1c29c4cm12_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c9c2cm18c0cm17c1c0cm23c3c1cm2c0c3cm4cm17c5,
			CxB => R_c3c0c0c6c1c0cm6cm4c1cm2c0c1cm1c29c4cm12
		);




end architecture;
