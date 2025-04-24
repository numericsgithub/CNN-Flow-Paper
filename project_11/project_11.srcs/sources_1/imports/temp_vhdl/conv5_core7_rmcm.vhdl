library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv5_core7_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        R_cm1c0c2cm1c0c2c6cm2cm3c2cm5cm3cm4c0cm11cm1 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm21c1c1cm1cm11c6c7c30cm12cm2cm18cm13cm15c10c1c6 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c2cm1c0c1c0cm5cm17c4cm11cm3c29cm1cm1c12cm1c3 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm77c5cm5c2c0cm16c56cm18c3cm4cm2c12cm5cm12cm1cm3 : out std_logic_vector(15-1 downto 0);   --	sfix(7, -8)
        R_cm2cm1c0cm2cm5c11cm10cm5cm1cm11c2cm8cm19c0cm3c0 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c14cm1c0cm16c0c6c7cm5c3c1cm9cm7cm42c0c1cm4 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c0cm9c2c1c7cm4cm4c0c24cm9cm6cm2cm1cm2c6c0 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c2cm1cm2cm3c45c3cm12cm20cm12c7cm13c27c1c1c9cm3 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm5c2cm4c1cm2cm7cm1c2c3cm7c4c1cm3c0cm4cm4 : out std_logic_vector(11-1 downto 0);   --	sfix(3, -8)
        R_c1c3cm5c1cm9cm9cm3c55c7cm5cm7cm21cm15c7cm18c1 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c2c2c1c2cm1c0cm1cm2cm1c2c8c6c5cm13c1c6 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm5cm1cm10c2c6cm6cm1c1c1cm24c0c1cm2c3cm7c1 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c0c1c6cm1cm2c1c6cm4cm2c0c0cm3c32cm16cm5c2 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm9c0c0cm1c6cm1c1c10c6cm1c1c31c1cm1c22cm1 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c0cm2c1c47c13c2c6c0c54cm1c1c0cm1c1cm16cm13 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm8c1c0c6c8c16cm5cm1c8c33cm8cm5c2c1c4cm7 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm13cm3c0cm7cm5c2c3cm11cm3c17c9c0c2cm1c1c0 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm6c2c2cm5c2c2c2cm9c5c7c2cm5cm8c3c11cm10 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm1c5cm22c2c28cm12c3c2cm29cm5c5cm1cm2cm14cm30c22 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c4c34cm4c2c8c0cm4c4c13c1c6c3c1cm7cm4c13 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c0c2c0cm1cm23c0cm4c26c15cm1cm19cm47c0c2c11c1 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm1c0c2cm10c1c1cm1cm1cm3c3cm3cm2cm7cm4cm12c12 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm5c2c0c8c3c2cm6c2c32c11c7c0c6c12c0cm5 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c18cm12c1c0c2cm2c7cm4cm5c7cm2c0cm5c3c10c3 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm3cm6cm4c1cm2cm25cm3cm12cm3cm14cm1c21c8cm8c5c4 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c0cm2c4cm1c0c1cm1c9cm3cm1cm1c25cm1cm4cm4c1 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm1c0c1cm2cm8cm2c3c0cm1cm6c6cm2c3cm1cm3c1 : out std_logic_vector(11-1 downto 0);   --	sfix(3, -8)
        R_c5cm3c0cm1cm6c7cm4cm21cm23c1c0c39cm15c3cm17c1 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c0cm1c1c1c4c1c3c1c15cm1c3cm1cm2c2cm3cm2 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c0c2cm2c1cm1cm3c1c0c5c1cm3c0cm2c13c0cm8 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c1c1c0cm7cm27c0cm2cm4cm21c0c7cm3cm9c2c1cm1 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c0c1cm3c1c34c3c5c0cm17c5c6c0c1cm1c3c4 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(9-1 downto 0)  --	sfix(1, -8)
    );
end conv5_core7_rmcm;

architecture arch of conv5_core7_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C0C2CM1C0C2C6CM2CM3C2CM5CM3CM4C0CM11CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM21C1C1CM1CM11C6C7C30CM12CM2CM18CM13CM15C10C1C6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2CM1C0C1C0CM5CM17C4CM11CM3C29CM1CM1C12CM1C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM77C5CM5C2C0CM16C56CM18C3CM4CM2C12CM5CM12CM1CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM1C0CM2CM5C11CM10CM5CM1CM11C2CM8CM19C0CM3C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C14CM1C0CM16C0C6C7CM5C3C1CM9CM7CM42C0C1CM4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM9C2C1C7CM4CM4C0C24CM9CM6CM2CM1CM2C6C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2CM1CM2CM3C45C3CM12CM20CM12C7CM13C27C1C1C9CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5C2CM4C1CM2CM7CM1C2C3CM7C4C1CM3C0CM4CM4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C3CM5C1CM9CM9CM3C55C7CM5CM7CM21CM15C7CM18C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C2C1C2CM1C0CM1CM2CM1C2C8C6C5CM13C1C6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5CM1CM10C2C6CM6CM1C1C1CM24C0C1CM2C3CM7C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C1C6CM1CM2C1C6CM4CM2C0C0CM3C32CM16CM5C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM9C0C0CM1C6CM1C1C10C6CM1C1C31C1CM1C22CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM2C1C47C13C2C6C0C54CM1C1C0CM1C1CM16CM13_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM8C1C0C6C8C16CM5CM1C8C33CM8CM5C2C1C4CM7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM13CM3C0CM7CM5C2C3CM11CM3C17C9C0C2CM1C1C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6C2C2CM5C2C2C2CM9C5C7C2CM5CM8C3C11CM10_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C5CM22C2C28CM12C3C2CM29CM5C5CM1CM2CM14CM30C22_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4C34CM4C2C8C0CM4C4C13C1C6C3C1CM7CM4C13_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C2C0CM1CM23C0CM4C26C15CM1CM19CM47C0C2C11C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C0C2CM10C1C1CM1CM1CM3C3CM3CM2CM7CM4CM12C12_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5C2C0C8C3C2CM6C2C32C11C7C0C6C12C0CM5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C18CM12C1C0C2CM2C7CM4CM5C7CM2C0CM5C3C10C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3CM6CM4C1CM2CM25CM3CM12CM3CM14CM1C21C8CM8C5C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM2C4CM1C0C1CM1C9CM3CM1CM1C25CM1CM4CM4C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C0C1CM2CM8CM2C3C0CM1CM6C6CM2C3CM1CM3C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5CM3C0CM1CM6C7CM4CM21CM23C1C0C39CM15C3CM17C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM1C1C1C4C1C3C1C15CM1C3CM1CM2C2CM3CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C2CM2C1CM1CM3C1C0C5C1CM3C0CM2C13C0CM8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C1C0CM7CM27C0CM2CM4CM21C0C7CM3CM9C2C1CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C1CM3C1C34C3C5C0CM17C5C6C0C1CM1C3C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(5, -2)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(2, -6)
    signal cm1c0c2cm1c0c2c6cm2cm3c2cm5cm3cm4c0cm11cm1_weight : PIPELINE_TYPE_FOR_CM1C0C2CM1C0C2C6CM2CM3C2CM5CM3CM4C0CM11CM1_WEIGHT;
    -- sfix(2, -6)
    signal cm21c1c1cm1cm11c6c7c30cm12cm2cm18cm13cm15c10c1c6_weight : PIPELINE_TYPE_FOR_CM21C1C1CM1CM11C6C7C30CM12CM2CM18CM13CM15C10C1C6_WEIGHT;
    -- sfix(2, -6)
    signal c2cm1c0c1c0cm5cm17c4cm11cm3c29cm1cm1c12cm1c3_weight : PIPELINE_TYPE_FOR_C2CM1C0C1C0CM5CM17C4CM11CM3C29CM1CM1C12CM1C3_WEIGHT;
    -- sfix(2, -6)
    signal cm77c5cm5c2c0cm16c56cm18c3cm4cm2c12cm5cm12cm1cm3_weight : PIPELINE_TYPE_FOR_CM77C5CM5C2C0CM16C56CM18C3CM4CM2C12CM5CM12CM1CM3_WEIGHT;
    -- sfix(2, -6)
    signal cm2cm1c0cm2cm5c11cm10cm5cm1cm11c2cm8cm19c0cm3c0_weight : PIPELINE_TYPE_FOR_CM2CM1C0CM2CM5C11CM10CM5CM1CM11C2CM8CM19C0CM3C0_WEIGHT;
    -- sfix(2, -6)
    signal c14cm1c0cm16c0c6c7cm5c3c1cm9cm7cm42c0c1cm4_weight : PIPELINE_TYPE_FOR_C14CM1C0CM16C0C6C7CM5C3C1CM9CM7CM42C0C1CM4_WEIGHT;
    -- sfix(2, -6)
    signal c0cm9c2c1c7cm4cm4c0c24cm9cm6cm2cm1cm2c6c0_weight : PIPELINE_TYPE_FOR_C0CM9C2C1C7CM4CM4C0C24CM9CM6CM2CM1CM2C6C0_WEIGHT;
    -- sfix(2, -6)
    signal c2cm1cm2cm3c45c3cm12cm20cm12c7cm13c27c1c1c9cm3_weight : PIPELINE_TYPE_FOR_C2CM1CM2CM3C45C3CM12CM20CM12C7CM13C27C1C1C9CM3_WEIGHT;
    -- sfix(2, -6)
    signal cm5c2cm4c1cm2cm7cm1c2c3cm7c4c1cm3c0cm4cm4_weight : PIPELINE_TYPE_FOR_CM5C2CM4C1CM2CM7CM1C2C3CM7C4C1CM3C0CM4CM4_WEIGHT;
    -- sfix(2, -6)
    signal c1c3cm5c1cm9cm9cm3c55c7cm5cm7cm21cm15c7cm18c1_weight : PIPELINE_TYPE_FOR_C1C3CM5C1CM9CM9CM3C55C7CM5CM7CM21CM15C7CM18C1_WEIGHT;
    -- sfix(2, -6)
    signal c2c2c1c2cm1c0cm1cm2cm1c2c8c6c5cm13c1c6_weight : PIPELINE_TYPE_FOR_C2C2C1C2CM1C0CM1CM2CM1C2C8C6C5CM13C1C6_WEIGHT;
    -- sfix(2, -6)
    signal cm5cm1cm10c2c6cm6cm1c1c1cm24c0c1cm2c3cm7c1_weight : PIPELINE_TYPE_FOR_CM5CM1CM10C2C6CM6CM1C1C1CM24C0C1CM2C3CM7C1_WEIGHT;
    -- sfix(2, -6)
    signal c0c1c6cm1cm2c1c6cm4cm2c0c0cm3c32cm16cm5c2_weight : PIPELINE_TYPE_FOR_C0C1C6CM1CM2C1C6CM4CM2C0C0CM3C32CM16CM5C2_WEIGHT;
    -- sfix(2, -6)
    signal cm9c0c0cm1c6cm1c1c10c6cm1c1c31c1cm1c22cm1_weight : PIPELINE_TYPE_FOR_CM9C0C0CM1C6CM1C1C10C6CM1C1C31C1CM1C22CM1_WEIGHT;
    -- sfix(2, -6)
    signal c0cm2c1c47c13c2c6c0c54cm1c1c0cm1c1cm16cm13_weight : PIPELINE_TYPE_FOR_C0CM2C1C47C13C2C6C0C54CM1C1C0CM1C1CM16CM13_WEIGHT;
    -- sfix(2, -6)
    signal cm8c1c0c6c8c16cm5cm1c8c33cm8cm5c2c1c4cm7_weight : PIPELINE_TYPE_FOR_CM8C1C0C6C8C16CM5CM1C8C33CM8CM5C2C1C4CM7_WEIGHT;
    -- sfix(2, -6)
    signal cm13cm3c0cm7cm5c2c3cm11cm3c17c9c0c2cm1c1c0_weight : PIPELINE_TYPE_FOR_CM13CM3C0CM7CM5C2C3CM11CM3C17C9C0C2CM1C1C0_WEIGHT;
    -- sfix(2, -6)
    signal cm6c2c2cm5c2c2c2cm9c5c7c2cm5cm8c3c11cm10_weight : PIPELINE_TYPE_FOR_CM6C2C2CM5C2C2C2CM9C5C7C2CM5CM8C3C11CM10_WEIGHT;
    -- sfix(2, -6)
    signal cm1c5cm22c2c28cm12c3c2cm29cm5c5cm1cm2cm14cm30c22_weight : PIPELINE_TYPE_FOR_CM1C5CM22C2C28CM12C3C2CM29CM5C5CM1CM2CM14CM30C22_WEIGHT;
    -- sfix(2, -6)
    signal c4c34cm4c2c8c0cm4c4c13c1c6c3c1cm7cm4c13_weight : PIPELINE_TYPE_FOR_C4C34CM4C2C8C0CM4C4C13C1C6C3C1CM7CM4C13_WEIGHT;
    -- sfix(2, -6)
    signal c0c2c0cm1cm23c0cm4c26c15cm1cm19cm47c0c2c11c1_weight : PIPELINE_TYPE_FOR_C0C2C0CM1CM23C0CM4C26C15CM1CM19CM47C0C2C11C1_WEIGHT;
    -- sfix(2, -6)
    signal cm1c0c2cm10c1c1cm1cm1cm3c3cm3cm2cm7cm4cm12c12_weight : PIPELINE_TYPE_FOR_CM1C0C2CM10C1C1CM1CM1CM3C3CM3CM2CM7CM4CM12C12_WEIGHT;
    -- sfix(2, -6)
    signal cm5c2c0c8c3c2cm6c2c32c11c7c0c6c12c0cm5_weight : PIPELINE_TYPE_FOR_CM5C2C0C8C3C2CM6C2C32C11C7C0C6C12C0CM5_WEIGHT;
    -- sfix(2, -6)
    signal c18cm12c1c0c2cm2c7cm4cm5c7cm2c0cm5c3c10c3_weight : PIPELINE_TYPE_FOR_C18CM12C1C0C2CM2C7CM4CM5C7CM2C0CM5C3C10C3_WEIGHT;
    -- sfix(2, -6)
    signal cm3cm6cm4c1cm2cm25cm3cm12cm3cm14cm1c21c8cm8c5c4_weight : PIPELINE_TYPE_FOR_CM3CM6CM4C1CM2CM25CM3CM12CM3CM14CM1C21C8CM8C5C4_WEIGHT;
    -- sfix(2, -6)
    signal c0cm2c4cm1c0c1cm1c9cm3cm1cm1c25cm1cm4cm4c1_weight : PIPELINE_TYPE_FOR_C0CM2C4CM1C0C1CM1C9CM3CM1CM1C25CM1CM4CM4C1_WEIGHT;
    -- sfix(2, -6)
    signal cm1c0c1cm2cm8cm2c3c0cm1cm6c6cm2c3cm1cm3c1_weight : PIPELINE_TYPE_FOR_CM1C0C1CM2CM8CM2C3C0CM1CM6C6CM2C3CM1CM3C1_WEIGHT;
    -- sfix(2, -6)
    signal c5cm3c0cm1cm6c7cm4cm21cm23c1c0c39cm15c3cm17c1_weight : PIPELINE_TYPE_FOR_C5CM3C0CM1CM6C7CM4CM21CM23C1C0C39CM15C3CM17C1_WEIGHT;
    -- sfix(2, -6)
    signal c0cm1c1c1c4c1c3c1c15cm1c3cm1cm2c2cm3cm2_weight : PIPELINE_TYPE_FOR_C0CM1C1C1C4C1C3C1C15CM1C3CM1CM2C2CM3CM2_WEIGHT;
    -- sfix(2, -6)
    signal c0c2cm2c1cm1cm3c1c0c5c1cm3c0cm2c13c0cm8_weight : PIPELINE_TYPE_FOR_C0C2CM2C1CM1CM3C1C0C5C1CM3C0CM2C13C0CM8_WEIGHT;
    -- sfix(2, -6)
    signal c1c1c0cm7cm27c0cm2cm4cm21c0c7cm3cm9c2c1cm1_weight : PIPELINE_TYPE_FOR_C1C1C0CM7CM27C0CM2CM4CM21C0C7CM3CM9C2C1CM1_WEIGHT;
    -- sfix(2, -6)
    signal c0c1cm3c1c34c3c5c0cm17c5c6c0c1cm1c3c4_weight : PIPELINE_TYPE_FOR_C0C1CM3C1C34C3C5C0CM17C5C6C0C1CM1C3C4_WEIGHT;
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



    WEIGHT_ROM: entity work.conv5_core7_rmcm_weightsconstant_memory
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
        
            dout1   => cm1c0c2cm1c0c2c6cm2cm3c2cm5cm3cm4c0cm11cm1_weight(0), 
            dout2   => cm21c1c1cm1cm11c6c7c30cm12cm2cm18cm13cm15c10c1c6_weight(0), 
            dout3   => c2cm1c0c1c0cm5cm17c4cm11cm3c29cm1cm1c12cm1c3_weight(0), 
            dout4   => cm77c5cm5c2c0cm16c56cm18c3cm4cm2c12cm5cm12cm1cm3_weight(0), 
            dout5   => cm2cm1c0cm2cm5c11cm10cm5cm1cm11c2cm8cm19c0cm3c0_weight(0), 
            dout6   => c14cm1c0cm16c0c6c7cm5c3c1cm9cm7cm42c0c1cm4_weight(0), 
            dout7   => c0cm9c2c1c7cm4cm4c0c24cm9cm6cm2cm1cm2c6c0_weight(0), 
            dout8   => c2cm1cm2cm3c45c3cm12cm20cm12c7cm13c27c1c1c9cm3_weight(0), 
            dout9   => cm5c2cm4c1cm2cm7cm1c2c3cm7c4c1cm3c0cm4cm4_weight(0), 
            dout10   => c1c3cm5c1cm9cm9cm3c55c7cm5cm7cm21cm15c7cm18c1_weight(0), 
            dout11   => c2c2c1c2cm1c0cm1cm2cm1c2c8c6c5cm13c1c6_weight(0), 
            dout12   => cm5cm1cm10c2c6cm6cm1c1c1cm24c0c1cm2c3cm7c1_weight(0), 
            dout13   => c0c1c6cm1cm2c1c6cm4cm2c0c0cm3c32cm16cm5c2_weight(0), 
            dout14   => cm9c0c0cm1c6cm1c1c10c6cm1c1c31c1cm1c22cm1_weight(0), 
            dout15   => c0cm2c1c47c13c2c6c0c54cm1c1c0cm1c1cm16cm13_weight(0), 
            dout16   => cm8c1c0c6c8c16cm5cm1c8c33cm8cm5c2c1c4cm7_weight(0), 
            dout17   => cm13cm3c0cm7cm5c2c3cm11cm3c17c9c0c2cm1c1c0_weight(0), 
            dout18   => cm6c2c2cm5c2c2c2cm9c5c7c2cm5cm8c3c11cm10_weight(0), 
            dout19   => cm1c5cm22c2c28cm12c3c2cm29cm5c5cm1cm2cm14cm30c22_weight(0), 
            dout20   => c4c34cm4c2c8c0cm4c4c13c1c6c3c1cm7cm4c13_weight(0), 
            dout21   => c0c2c0cm1cm23c0cm4c26c15cm1cm19cm47c0c2c11c1_weight(0), 
            dout22   => cm1c0c2cm10c1c1cm1cm1cm3c3cm3cm2cm7cm4cm12c12_weight(0), 
            dout23   => cm5c2c0c8c3c2cm6c2c32c11c7c0c6c12c0cm5_weight(0), 
            dout24   => c18cm12c1c0c2cm2c7cm4cm5c7cm2c0cm5c3c10c3_weight(0), 
            dout25   => cm3cm6cm4c1cm2cm25cm3cm12cm3cm14cm1c21c8cm8c5c4_weight(0), 
            dout26   => c0cm2c4cm1c0c1cm1c9cm3cm1cm1c25cm1cm4cm4c1_weight(0), 
            dout27   => cm1c0c1cm2cm8cm2c3c0cm1cm6c6cm2c3cm1cm3c1_weight(0), 
            dout28   => c5cm3c0cm1cm6c7cm4cm21cm23c1c0c39cm15c3cm17c1_weight(0), 
            dout29   => c0cm1c1c1c4c1c3c1c15cm1c3cm1cm2c2cm3cm2_weight(0), 
            dout30   => c0c2cm2c1cm1cm3c1c0c5c1cm3c0cm2c13c0cm8_weight(0), 
            dout31   => c1c1c0cm7cm27c0cm2cm4cm21c0c7cm3cm9c2c1cm1_weight(0), 
            dout32   => c0c1cm3c1c34c3c5c0cm17c5c6c0c1cm1c3c4_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_cm1c0c2cm1c0c2c6cm2cm3c2cm5cm3cm4c0cm11cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c0c2cm1c0c2c6cm2cm3c2cm5cm3cm4c0cm11cm1_weight(0), cm1c0c2cm1c0c2c6cm2cm3c2cm5cm3cm4c0cm11cm1_weight(1));
    PL_STEP_0_for_cm21c1c1cm1cm11c6c7c30cm12cm2cm18cm13cm15c10c1c6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm21c1c1cm1cm11c6c7c30cm12cm2cm18cm13cm15c10c1c6_weight(0), cm21c1c1cm1cm11c6c7c30cm12cm2cm18cm13cm15c10c1c6_weight(1));
    PL_STEP_0_for_c2cm1c0c1c0cm5cm17c4cm11cm3c29cm1cm1c12cm1c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2cm1c0c1c0cm5cm17c4cm11cm3c29cm1cm1c12cm1c3_weight(0), c2cm1c0c1c0cm5cm17c4cm11cm3c29cm1cm1c12cm1c3_weight(1));
    PL_STEP_0_for_cm77c5cm5c2c0cm16c56cm18c3cm4cm2c12cm5cm12cm1cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm77c5cm5c2c0cm16c56cm18c3cm4cm2c12cm5cm12cm1cm3_weight(0), cm77c5cm5c2c0cm16c56cm18c3cm4cm2c12cm5cm12cm1cm3_weight(1));
    PL_STEP_0_for_cm2cm1c0cm2cm5c11cm10cm5cm1cm11c2cm8cm19c0cm3c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm1c0cm2cm5c11cm10cm5cm1cm11c2cm8cm19c0cm3c0_weight(0), cm2cm1c0cm2cm5c11cm10cm5cm1cm11c2cm8cm19c0cm3c0_weight(1));
    PL_STEP_0_for_c14cm1c0cm16c0c6c7cm5c3c1cm9cm7cm42c0c1cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c14cm1c0cm16c0c6c7cm5c3c1cm9cm7cm42c0c1cm4_weight(0), c14cm1c0cm16c0c6c7cm5c3c1cm9cm7cm42c0c1cm4_weight(1));
    PL_STEP_0_for_c0cm9c2c1c7cm4cm4c0c24cm9cm6cm2cm1cm2c6c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm9c2c1c7cm4cm4c0c24cm9cm6cm2cm1cm2c6c0_weight(0), c0cm9c2c1c7cm4cm4c0c24cm9cm6cm2cm1cm2c6c0_weight(1));
    PL_STEP_0_for_c2cm1cm2cm3c45c3cm12cm20cm12c7cm13c27c1c1c9cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2cm1cm2cm3c45c3cm12cm20cm12c7cm13c27c1c1c9cm3_weight(0), c2cm1cm2cm3c45c3cm12cm20cm12c7cm13c27c1c1c9cm3_weight(1));
    PL_STEP_0_for_cm5c2cm4c1cm2cm7cm1c2c3cm7c4c1cm3c0cm4cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5c2cm4c1cm2cm7cm1c2c3cm7c4c1cm3c0cm4cm4_weight(0), cm5c2cm4c1cm2cm7cm1c2c3cm7c4c1cm3c0cm4cm4_weight(1));
    PL_STEP_0_for_c1c3cm5c1cm9cm9cm3c55c7cm5cm7cm21cm15c7cm18c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c3cm5c1cm9cm9cm3c55c7cm5cm7cm21cm15c7cm18c1_weight(0), c1c3cm5c1cm9cm9cm3c55c7cm5cm7cm21cm15c7cm18c1_weight(1));
    PL_STEP_0_for_c2c2c1c2cm1c0cm1cm2cm1c2c8c6c5cm13c1c6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c2c1c2cm1c0cm1cm2cm1c2c8c6c5cm13c1c6_weight(0), c2c2c1c2cm1c0cm1cm2cm1c2c8c6c5cm13c1c6_weight(1));
    PL_STEP_0_for_cm5cm1cm10c2c6cm6cm1c1c1cm24c0c1cm2c3cm7c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5cm1cm10c2c6cm6cm1c1c1cm24c0c1cm2c3cm7c1_weight(0), cm5cm1cm10c2c6cm6cm1c1c1cm24c0c1cm2c3cm7c1_weight(1));
    PL_STEP_0_for_c0c1c6cm1cm2c1c6cm4cm2c0c0cm3c32cm16cm5c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c1c6cm1cm2c1c6cm4cm2c0c0cm3c32cm16cm5c2_weight(0), c0c1c6cm1cm2c1c6cm4cm2c0c0cm3c32cm16cm5c2_weight(1));
    PL_STEP_0_for_cm9c0c0cm1c6cm1c1c10c6cm1c1c31c1cm1c22cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm9c0c0cm1c6cm1c1c10c6cm1c1c31c1cm1c22cm1_weight(0), cm9c0c0cm1c6cm1c1c10c6cm1c1c31c1cm1c22cm1_weight(1));
    PL_STEP_0_for_c0cm2c1c47c13c2c6c0c54cm1c1c0cm1c1cm16cm13_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm2c1c47c13c2c6c0c54cm1c1c0cm1c1cm16cm13_weight(0), c0cm2c1c47c13c2c6c0c54cm1c1c0cm1c1cm16cm13_weight(1));
    PL_STEP_0_for_cm8c1c0c6c8c16cm5cm1c8c33cm8cm5c2c1c4cm7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm8c1c0c6c8c16cm5cm1c8c33cm8cm5c2c1c4cm7_weight(0), cm8c1c0c6c8c16cm5cm1c8c33cm8cm5c2c1c4cm7_weight(1));
    PL_STEP_0_for_cm13cm3c0cm7cm5c2c3cm11cm3c17c9c0c2cm1c1c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm13cm3c0cm7cm5c2c3cm11cm3c17c9c0c2cm1c1c0_weight(0), cm13cm3c0cm7cm5c2c3cm11cm3c17c9c0c2cm1c1c0_weight(1));
    PL_STEP_0_for_cm6c2c2cm5c2c2c2cm9c5c7c2cm5cm8c3c11cm10_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6c2c2cm5c2c2c2cm9c5c7c2cm5cm8c3c11cm10_weight(0), cm6c2c2cm5c2c2c2cm9c5c7c2cm5cm8c3c11cm10_weight(1));
    PL_STEP_0_for_cm1c5cm22c2c28cm12c3c2cm29cm5c5cm1cm2cm14cm30c22_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c5cm22c2c28cm12c3c2cm29cm5c5cm1cm2cm14cm30c22_weight(0), cm1c5cm22c2c28cm12c3c2cm29cm5c5cm1cm2cm14cm30c22_weight(1));
    PL_STEP_0_for_c4c34cm4c2c8c0cm4c4c13c1c6c3c1cm7cm4c13_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4c34cm4c2c8c0cm4c4c13c1c6c3c1cm7cm4c13_weight(0), c4c34cm4c2c8c0cm4c4c13c1c6c3c1cm7cm4c13_weight(1));
    PL_STEP_0_for_c0c2c0cm1cm23c0cm4c26c15cm1cm19cm47c0c2c11c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c2c0cm1cm23c0cm4c26c15cm1cm19cm47c0c2c11c1_weight(0), c0c2c0cm1cm23c0cm4c26c15cm1cm19cm47c0c2c11c1_weight(1));
    PL_STEP_0_for_cm1c0c2cm10c1c1cm1cm1cm3c3cm3cm2cm7cm4cm12c12_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c0c2cm10c1c1cm1cm1cm3c3cm3cm2cm7cm4cm12c12_weight(0), cm1c0c2cm10c1c1cm1cm1cm3c3cm3cm2cm7cm4cm12c12_weight(1));
    PL_STEP_0_for_cm5c2c0c8c3c2cm6c2c32c11c7c0c6c12c0cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5c2c0c8c3c2cm6c2c32c11c7c0c6c12c0cm5_weight(0), cm5c2c0c8c3c2cm6c2c32c11c7c0c6c12c0cm5_weight(1));
    PL_STEP_0_for_c18cm12c1c0c2cm2c7cm4cm5c7cm2c0cm5c3c10c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c18cm12c1c0c2cm2c7cm4cm5c7cm2c0cm5c3c10c3_weight(0), c18cm12c1c0c2cm2c7cm4cm5c7cm2c0cm5c3c10c3_weight(1));
    PL_STEP_0_for_cm3cm6cm4c1cm2cm25cm3cm12cm3cm14cm1c21c8cm8c5c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3cm6cm4c1cm2cm25cm3cm12cm3cm14cm1c21c8cm8c5c4_weight(0), cm3cm6cm4c1cm2cm25cm3cm12cm3cm14cm1c21c8cm8c5c4_weight(1));
    PL_STEP_0_for_c0cm2c4cm1c0c1cm1c9cm3cm1cm1c25cm1cm4cm4c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm2c4cm1c0c1cm1c9cm3cm1cm1c25cm1cm4cm4c1_weight(0), c0cm2c4cm1c0c1cm1c9cm3cm1cm1c25cm1cm4cm4c1_weight(1));
    PL_STEP_0_for_cm1c0c1cm2cm8cm2c3c0cm1cm6c6cm2c3cm1cm3c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c0c1cm2cm8cm2c3c0cm1cm6c6cm2c3cm1cm3c1_weight(0), cm1c0c1cm2cm8cm2c3c0cm1cm6c6cm2c3cm1cm3c1_weight(1));
    PL_STEP_0_for_c5cm3c0cm1cm6c7cm4cm21cm23c1c0c39cm15c3cm17c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5cm3c0cm1cm6c7cm4cm21cm23c1c0c39cm15c3cm17c1_weight(0), c5cm3c0cm1cm6c7cm4cm21cm23c1c0c39cm15c3cm17c1_weight(1));
    PL_STEP_0_for_c0cm1c1c1c4c1c3c1c15cm1c3cm1cm2c2cm3cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm1c1c1c4c1c3c1c15cm1c3cm1cm2c2cm3cm2_weight(0), c0cm1c1c1c4c1c3c1c15cm1c3cm1cm2c2cm3cm2_weight(1));
    PL_STEP_0_for_c0c2cm2c1cm1cm3c1c0c5c1cm3c0cm2c13c0cm8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c2cm2c1cm1cm3c1c0c5c1cm3c0cm2c13c0cm8_weight(0), c0c2cm2c1cm1cm3c1c0c5c1cm3c0cm2c13c0cm8_weight(1));
    PL_STEP_0_for_c1c1c0cm7cm27c0cm2cm4cm21c0c7cm3cm9c2c1cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c1c0cm7cm27c0cm2cm4cm21c0c7cm3cm9c2c1cm1_weight(0), c1c1c0cm7cm27c0cm2cm4cm21c0c7cm3cm9c2c1cm1_weight(1));
    PL_STEP_0_for_c0c1cm3c1c34c3c5c0cm17c5c6c0c1cm1c3c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c1cm3c1c34c3c5c0cm17c5c6c0c1cm1c3c4_weight(0), c0c1cm3c1c34c3c5c0cm17c5c6c0c1cm1c3c4_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    cm77c5cm5c2c0cm16c56cm18c3cm4cm2c12cm5cm12cm1cm3_cm1c0c1cm2cm8cm2c3c0cm1cm6c6cm2c3cm1cm3c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm77c5cm5c2c0cm16c56cm18c3cm4cm2c12cm5cm12cm1cm3_weight(1)(8-1 downto 0),
			B	=> cm1c0c1cm2cm8cm2c3c0cm1cm6c6cm2c3cm1cm3c1_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm77c5cm5c2c0cm16c56cm18c3cm4cm2c12cm5cm12cm1cm3,
			CxB => R_cm1c0c1cm2cm8cm2c3c0cm1cm6c6cm2c3cm1cm3c1
		);

    c14cm1c0cm16c0c6c7cm5c3c1cm9cm7cm42c0c1cm4_cm5c2cm4c1cm2cm7cm1c2c3cm7c4c1cm3c0cm4cm4_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 7,
			B_WIDTH => 4,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c14cm1c0cm16c0c6c7cm5c3c1cm9cm7cm42c0c1cm4_weight(1)(7-1 downto 0),
			B	=> cm5c2cm4c1cm2cm7cm1c2c3cm7c4c1cm3c0cm4cm4_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c14cm1c0cm16c0c6c7cm5c3c1cm9cm7cm42c0c1cm4,
			CxB => R_cm5c2cm4c1cm2cm7cm1c2c3cm7c4c1cm3c0cm4cm4
		);

    c2cm1cm2cm3c45c3cm12cm20cm12c7cm13c27c1c1c9cm3_c0c2cm2c1cm1cm3c1c0c5c1cm3c0cm2c13c0cm8_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c2cm1cm2cm3c45c3cm12cm20cm12c7cm13c27c1c1c9cm3_weight(1)(7-1 downto 0),
			B	=> c0c2cm2c1cm1cm3c1c0c5c1cm3c0cm2c13c0cm8_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c2cm1cm2cm3c45c3cm12cm20cm12c7cm13c27c1c1c9cm3,
			CxB => R_c0c2cm2c1cm1cm3c1c0c5c1cm3c0cm2c13c0cm8
		);

    c1c3cm5c1cm9cm9cm3c55c7cm5cm7cm21cm15c7cm18c1_c0cm1c1c1c4c1c3c1c15cm1c3cm1cm2c2cm3cm2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c1c3cm5c1cm9cm9cm3c55c7cm5cm7cm21cm15c7cm18c1_weight(1)(7-1 downto 0),
			B	=> c0cm1c1c1c4c1c3c1c15cm1c3cm1cm2c2cm3cm2_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1c3cm5c1cm9cm9cm3c55c7cm5cm7cm21cm15c7cm18c1,
			CxB => R_c0cm1c1c1c4c1c3c1c15cm1c3cm1cm2c2cm3cm2
		);

    c0c1c6cm1cm2c1c6cm4cm2c0c0cm3c32cm16cm5c2_cm1c0c2cm10c1c1cm1cm1cm3c3cm3cm2cm7cm4cm12c12_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0c1c6cm1cm2c1c6cm4cm2c0c0cm3c32cm16cm5c2_weight(1)(7-1 downto 0),
			B	=> cm1c0c2cm10c1c1cm1cm1cm3c3cm3cm2cm7cm4cm12c12_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c1c6cm1cm2c1c6cm4cm2c0c0cm3c32cm16cm5c2,
			CxB => R_cm1c0c2cm10c1c1cm1cm1cm3c3cm3cm2cm7cm4cm12c12
		);

    c0cm2c1c47c13c2c6c0c54cm1c1c0cm1c1cm16cm13_cm6c2c2cm5c2c2c2cm9c5c7c2cm5cm8c3c11cm10_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0cm2c1c47c13c2c6c0c54cm1c1c0cm1c1cm16cm13_weight(1)(7-1 downto 0),
			B	=> cm6c2c2cm5c2c2c2cm9c5c7c2cm5cm8c3c11cm10_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0cm2c1c47c13c2c6c0c54cm1c1c0cm1c1cm16cm13,
			CxB => R_cm6c2c2cm5c2c2c2cm9c5c7c2cm5cm8c3c11cm10
		);

    cm8c1c0c6c8c16cm5cm1c8c33cm8cm5c2c1c4cm7_c2c2c1c2cm1c0cm1cm2cm1c2c8c6c5cm13c1c6_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm8c1c0c6c8c16cm5cm1c8c33cm8cm5c2c1c4cm7_weight(1)(7-1 downto 0),
			B	=> c2c2c1c2cm1c0cm1cm2cm1c2c8c6c5cm13c1c6_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm8c1c0c6c8c16cm5cm1c8c33cm8cm5c2c1c4cm7,
			CxB => R_c2c2c1c2cm1c0cm1cm2cm1c2c8c6c5cm13c1c6
		);

    c4c34cm4c2c8c0cm4c4c13c1c6c3c1cm7cm4c13_cm1c0c2cm1c0c2c6cm2cm3c2cm5cm3cm4c0cm11cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c4c34cm4c2c8c0cm4c4c13c1c6c3c1cm7cm4c13_weight(1)(7-1 downto 0),
			B	=> cm1c0c2cm1c0c2c6cm2cm3c2cm5cm3cm4c0cm11cm1_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c4c34cm4c2c8c0cm4c4c13c1c6c3c1cm7cm4c13,
			CxB => R_cm1c0c2cm1c0c2c6cm2cm3c2cm5cm3cm4c0cm11cm1
		);

    c0c2c0cm1cm23c0cm4c26c15cm1cm19cm47c0c2c11c1_c1c1c0cm7cm27c0cm2cm4cm21c0c7cm3cm9c2c1cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0c2c0cm1cm23c0cm4c26c15cm1cm19cm47c0c2c11c1_weight(1)(7-1 downto 0),
			B	=> c1c1c0cm7cm27c0cm2cm4cm21c0c7cm3cm9c2c1cm1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c2c0cm1cm23c0cm4c26c15cm1cm19cm47c0c2c11c1,
			CxB => R_c1c1c0cm7cm27c0cm2cm4cm21c0c7cm3cm9c2c1cm1
		);

    cm5c2c0c8c3c2cm6c2c32c11c7c0c6c12c0cm5_c0cm2c4cm1c0c1cm1c9cm3cm1cm1c25cm1cm4cm4c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm5c2c0c8c3c2cm6c2c32c11c7c0c6c12c0cm5_weight(1)(7-1 downto 0),
			B	=> c0cm2c4cm1c0c1cm1c9cm3cm1cm1c25cm1cm4cm4c1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm5c2c0c8c3c2cm6c2c32c11c7c0c6c12c0cm5,
			CxB => R_c0cm2c4cm1c0c1cm1c9cm3cm1cm1c25cm1cm4cm4c1
		);

    c5cm3c0cm1cm6c7cm4cm21cm23c1c0c39cm15c3cm17c1_cm3cm6cm4c1cm2cm25cm3cm12cm3cm14cm1c21c8cm8c5c4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c5cm3c0cm1cm6c7cm4cm21cm23c1c0c39cm15c3cm17c1_weight(1)(7-1 downto 0),
			B	=> cm3cm6cm4c1cm2cm25cm3cm12cm3cm14cm1c21c8cm8c5c4_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c5cm3c0cm1cm6c7cm4cm21cm23c1c0c39cm15c3cm17c1,
			CxB => R_cm3cm6cm4c1cm2cm25cm3cm12cm3cm14cm1c21c8cm8c5c4
		);

    c0c1cm3c1c34c3c5c0cm17c5c6c0c1cm1c3c4_c18cm12c1c0c2cm2c7cm4cm5c7cm2c0cm5c3c10c3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0c1cm3c1c34c3c5c0cm17c5c6c0c1cm1c3c4_weight(1)(7-1 downto 0),
			B	=> c18cm12c1c0c2cm2c7cm4cm5c7cm2c0cm5c3c10c3_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c1cm3c1c34c3c5c0cm17c5c6c0c1cm1c3c4,
			CxB => R_c18cm12c1c0c2cm2c7cm4cm5c7cm2c0cm5c3c10c3
		);

    cm21c1c1cm1cm11c6c7c30cm12cm2cm18cm13cm15c10c1c6_cm1c5cm22c2c28cm12c3c2cm29cm5c5cm1cm2cm14cm30c22_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm21c1c1cm1cm11c6c7c30cm12cm2cm18cm13cm15c10c1c6_weight(1)(6-1 downto 0),
			B	=> cm1c5cm22c2c28cm12c3c2cm29cm5c5cm1cm2cm14cm30c22_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm21c1c1cm1cm11c6c7c30cm12cm2cm18cm13cm15c10c1c6,
			CxB => R_cm1c5cm22c2c28cm12c3c2cm29cm5c5cm1cm2cm14cm30c22
		);

    c2cm1c0c1c0cm5cm17c4cm11cm3c29cm1cm1c12cm1c3_cm13cm3c0cm7cm5c2c3cm11cm3c17c9c0c2cm1c1c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c2cm1c0c1c0cm5cm17c4cm11cm3c29cm1cm1c12cm1c3_weight(1)(6-1 downto 0),
			B	=> cm13cm3c0cm7cm5c2c3cm11cm3c17c9c0c2cm1c1c0_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c2cm1c0c1c0cm5cm17c4cm11cm3c29cm1cm1c12cm1c3,
			CxB => R_cm13cm3c0cm7cm5c2c3cm11cm3c17c9c0c2cm1c1c0
		);

    cm2cm1c0cm2cm5c11cm10cm5cm1cm11c2cm8cm19c0cm3c0_cm9c0c0cm1c6cm1c1c10c6cm1c1c31c1cm1c22cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2cm1c0cm2cm5c11cm10cm5cm1cm11c2cm8cm19c0cm3c0_weight(1)(6-1 downto 0),
			B	=> cm9c0c0cm1c6cm1c1c10c6cm1c1c31c1cm1c22cm1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2cm1c0cm2cm5c11cm10cm5cm1cm11c2cm8cm19c0cm3c0,
			CxB => R_cm9c0c0cm1c6cm1c1c10c6cm1c1c31c1cm1c22cm1
		);

    c0cm9c2c1c7cm4cm4c0c24cm9cm6cm2cm1cm2c6c0_cm5cm1cm10c2c6cm6cm1c1c1cm24c0c1cm2c3cm7c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0cm9c2c1c7cm4cm4c0c24cm9cm6cm2cm1cm2c6c0_weight(1)(6-1 downto 0),
			B	=> cm5cm1cm10c2c6cm6cm1c1c1cm24c0c1cm2c3cm7c1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0cm9c2c1c7cm4cm4c0c24cm9cm6cm2cm1cm2c6c0,
			CxB => R_cm5cm1cm10c2c6cm6cm1c1c1cm24c0c1cm2c3cm7c1
		);




end architecture;
