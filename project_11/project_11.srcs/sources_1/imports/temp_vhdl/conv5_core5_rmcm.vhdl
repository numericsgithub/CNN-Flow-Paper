library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv5_core5_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        R_cm3c0c2cm1cm8cm4c28cm1c13cm3cm23c0cm15c3c7c2 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm19c2c1c5c3cm8c3c1c20cm22c3cm10c17c8c1cm4 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c1cm2cm2c3cm6cm11c11c1c3cm15cm15c6cm1cm5c3c1 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c15c8cm2c3c5cm23cm7cm1cm5cm7c12c23cm2cm11c0cm8 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c18c0cm6cm1c1c0cm7cm1c0c1c6c3c12c0cm7c1 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c9c2c0cm26cm4cm8cm4c4c1cm24cm4c6c7cm5c0c9 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm1cm10c0cm1c3cm9cm3c3c4cm8cm5cm7c3c57c1cm1 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c5cm2c9c1c0cm12c5c0cm3c17c6cm6c0cm2c5c1 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm1c6cm4c2c2c2cm9cm6c10cm10c17cm26c0c7c13cm2 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c8cm4c2c3cm12c1c7cm2c6cm8cm2cm1cm3c0c23c0 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c1c6cm4c1cm3c0c13cm5c1c10c52cm7cm5c4cm2c2 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm7c1c13c1c0cm2c3cm10c19cm23c1cm3cm6cm1c2c2 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c0c0c2cm1cm1cm3c8c1c5c8cm30cm1c20cm13cm14c2 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c15c0c0cm2cm1c0cm11c2cm3c0cm2cm7cm5c0c2c0 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm1cm6c0cm12c1cm3cm4cm4c1cm14c6cm5c0c12cm6c17 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c10c0c3c7cm1c5c2cm3cm8cm2c2c1c3c5c1c4 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c12c0c0c18c10c3cm1cm2c6cm2cm3cm3c3c0c1cm13 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm1cm4c1c12cm3cm9c0c0cm1c6cm8c2c2c3cm7cm5 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c1c3c26c8c3cm3c5c7c3cm1c12cm20c2cm3c0c2 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c2cm30c2c3c2c0c15cm10c0cm2c13c32cm3c1cm7c0 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm1cm3cm2c1c0c0cm3cm2c0c0cm23cm2cm1cm2c8c1 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm2cm6cm47cm21c12cm5c4c21c2c14cm5c24cm1cm3cm11cm57 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm10c6c2c23c3c0c2cm4c2c3cm14cm3cm7c3cm2cm9 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm29c3cm2c2c0c3c5c5c2c1c10c15cm9c2c23c1 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm1c8c1cm2cm11cm2c4cm3c16c2cm2cm3c5c6c3cm5 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c0cm2cm4c0c0c5cm1c0c0cm5c1c3c0c4cm3cm1 : out std_logic_vector(11-1 downto 0);   --	sfix(3, -8)
        R_c0c1cm7cm2c5c6c12cm2c0c10c24cm10cm3c2c9c4 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm5cm2c4c0c5cm3c8cm3cm10c1cm11cm4cm15c6c1cm1 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c4c1c4c1cm8c10c10cm1c2c25cm41cm20c4cm1c2cm2 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm2c0cm1c1cm4cm8cm4cm23c6c6cm11cm18cm1cm10c7c1 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c1cm3cm2c6cm12cm6c6c2c10cm9cm13c7cm1cm1c6cm1 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c1c1c10c2c2c11c0cm3c2c21cm20c0c1cm7c2cm3 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(9-1 downto 0)  --	sfix(1, -8)
    );
end conv5_core5_rmcm;

architecture arch of conv5_core5_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3C0C2CM1CM8CM4C28CM1C13CM3CM23C0CM15C3C7C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM19C2C1C5C3CM8C3C1C20CM22C3CM10C17C8C1CM4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM2CM2C3CM6CM11C11C1C3CM15CM15C6CM1CM5C3C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C15C8CM2C3C5CM23CM7CM1CM5CM7C12C23CM2CM11C0CM8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C18C0CM6CM1C1C0CM7CM1C0C1C6C3C12C0CM7C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C9C2C0CM26CM4CM8CM4C4C1CM24CM4C6C7CM5C0C9_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM10C0CM1C3CM9CM3C3C4CM8CM5CM7C3C57C1CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5CM2C9C1C0CM12C5C0CM3C17C6CM6C0CM2C5C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C6CM4C2C2C2CM9CM6C10CM10C17CM26C0C7C13CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C8CM4C2C3CM12C1C7CM2C6CM8CM2CM1CM3C0C23C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C6CM4C1CM3C0C13CM5C1C10C52CM7CM5C4CM2C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM7C1C13C1C0CM2C3CM10C19CM23C1CM3CM6CM1C2C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C2CM1CM1CM3C8C1C5C8CM30CM1C20CM13CM14C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C15C0C0CM2CM1C0CM11C2CM3C0CM2CM7CM5C0C2C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM6C0CM12C1CM3CM4CM4C1CM14C6CM5C0C12CM6C17_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C10C0C3C7CM1C5C2CM3CM8CM2C2C1C3C5C1C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C12C0C0C18C10C3CM1CM2C6CM2CM3CM3C3C0C1CM13_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM4C1C12CM3CM9C0C0CM1C6CM8C2C2C3CM7CM5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C3C26C8C3CM3C5C7C3CM1C12CM20C2CM3C0C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2CM30C2C3C2C0C15CM10C0CM2C13C32CM3C1CM7C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM3CM2C1C0C0CM3CM2C0C0CM23CM2CM1CM2C8C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM6CM47CM21C12CM5C4C21C2C14CM5C24CM1CM3CM11CM57_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM10C6C2C23C3C0C2CM4C2C3CM14CM3CM7C3CM2CM9_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM29C3CM2C2C0C3C5C5C2C1C10C15CM9C2C23C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C8C1CM2CM11CM2C4CM3C16C2CM2CM3C5C6C3CM5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM2CM4C0C0C5CM1C0C0CM5C1C3C0C4CM3CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C1CM7CM2C5C6C12CM2C0C10C24CM10CM3C2C9C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5CM2C4C0C5CM3C8CM3CM10C1CM11CM4CM15C6C1CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4C1C4C1CM8C10C10CM1C2C25CM41CM20C4CM1C2CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C0CM1C1CM4CM8CM4CM23C6C6CM11CM18CM1CM10C7C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM3CM2C6CM12CM6C6C2C10CM9CM13C7CM1CM1C6CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C1C10C2C2C11C0CM3C2C21CM20C0C1CM7C2CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(5, -2)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(2, -6)
    signal cm3c0c2cm1cm8cm4c28cm1c13cm3cm23c0cm15c3c7c2_weight : PIPELINE_TYPE_FOR_CM3C0C2CM1CM8CM4C28CM1C13CM3CM23C0CM15C3C7C2_WEIGHT;
    -- sfix(2, -6)
    signal cm19c2c1c5c3cm8c3c1c20cm22c3cm10c17c8c1cm4_weight : PIPELINE_TYPE_FOR_CM19C2C1C5C3CM8C3C1C20CM22C3CM10C17C8C1CM4_WEIGHT;
    -- sfix(2, -6)
    signal c1cm2cm2c3cm6cm11c11c1c3cm15cm15c6cm1cm5c3c1_weight : PIPELINE_TYPE_FOR_C1CM2CM2C3CM6CM11C11C1C3CM15CM15C6CM1CM5C3C1_WEIGHT;
    -- sfix(2, -6)
    signal c15c8cm2c3c5cm23cm7cm1cm5cm7c12c23cm2cm11c0cm8_weight : PIPELINE_TYPE_FOR_C15C8CM2C3C5CM23CM7CM1CM5CM7C12C23CM2CM11C0CM8_WEIGHT;
    -- sfix(2, -6)
    signal c18c0cm6cm1c1c0cm7cm1c0c1c6c3c12c0cm7c1_weight : PIPELINE_TYPE_FOR_C18C0CM6CM1C1C0CM7CM1C0C1C6C3C12C0CM7C1_WEIGHT;
    -- sfix(2, -6)
    signal c9c2c0cm26cm4cm8cm4c4c1cm24cm4c6c7cm5c0c9_weight : PIPELINE_TYPE_FOR_C9C2C0CM26CM4CM8CM4C4C1CM24CM4C6C7CM5C0C9_WEIGHT;
    -- sfix(2, -6)
    signal cm1cm10c0cm1c3cm9cm3c3c4cm8cm5cm7c3c57c1cm1_weight : PIPELINE_TYPE_FOR_CM1CM10C0CM1C3CM9CM3C3C4CM8CM5CM7C3C57C1CM1_WEIGHT;
    -- sfix(2, -6)
    signal c5cm2c9c1c0cm12c5c0cm3c17c6cm6c0cm2c5c1_weight : PIPELINE_TYPE_FOR_C5CM2C9C1C0CM12C5C0CM3C17C6CM6C0CM2C5C1_WEIGHT;
    -- sfix(2, -6)
    signal cm1c6cm4c2c2c2cm9cm6c10cm10c17cm26c0c7c13cm2_weight : PIPELINE_TYPE_FOR_CM1C6CM4C2C2C2CM9CM6C10CM10C17CM26C0C7C13CM2_WEIGHT;
    -- sfix(2, -6)
    signal c8cm4c2c3cm12c1c7cm2c6cm8cm2cm1cm3c0c23c0_weight : PIPELINE_TYPE_FOR_C8CM4C2C3CM12C1C7CM2C6CM8CM2CM1CM3C0C23C0_WEIGHT;
    -- sfix(2, -6)
    signal c1c6cm4c1cm3c0c13cm5c1c10c52cm7cm5c4cm2c2_weight : PIPELINE_TYPE_FOR_C1C6CM4C1CM3C0C13CM5C1C10C52CM7CM5C4CM2C2_WEIGHT;
    -- sfix(2, -6)
    signal cm7c1c13c1c0cm2c3cm10c19cm23c1cm3cm6cm1c2c2_weight : PIPELINE_TYPE_FOR_CM7C1C13C1C0CM2C3CM10C19CM23C1CM3CM6CM1C2C2_WEIGHT;
    -- sfix(2, -6)
    signal c0c0c2cm1cm1cm3c8c1c5c8cm30cm1c20cm13cm14c2_weight : PIPELINE_TYPE_FOR_C0C0C2CM1CM1CM3C8C1C5C8CM30CM1C20CM13CM14C2_WEIGHT;
    -- sfix(2, -6)
    signal c15c0c0cm2cm1c0cm11c2cm3c0cm2cm7cm5c0c2c0_weight : PIPELINE_TYPE_FOR_C15C0C0CM2CM1C0CM11C2CM3C0CM2CM7CM5C0C2C0_WEIGHT;
    -- sfix(2, -6)
    signal cm1cm6c0cm12c1cm3cm4cm4c1cm14c6cm5c0c12cm6c17_weight : PIPELINE_TYPE_FOR_CM1CM6C0CM12C1CM3CM4CM4C1CM14C6CM5C0C12CM6C17_WEIGHT;
    -- sfix(2, -6)
    signal c10c0c3c7cm1c5c2cm3cm8cm2c2c1c3c5c1c4_weight : PIPELINE_TYPE_FOR_C10C0C3C7CM1C5C2CM3CM8CM2C2C1C3C5C1C4_WEIGHT;
    -- sfix(2, -6)
    signal c12c0c0c18c10c3cm1cm2c6cm2cm3cm3c3c0c1cm13_weight : PIPELINE_TYPE_FOR_C12C0C0C18C10C3CM1CM2C6CM2CM3CM3C3C0C1CM13_WEIGHT;
    -- sfix(2, -6)
    signal cm1cm4c1c12cm3cm9c0c0cm1c6cm8c2c2c3cm7cm5_weight : PIPELINE_TYPE_FOR_CM1CM4C1C12CM3CM9C0C0CM1C6CM8C2C2C3CM7CM5_WEIGHT;
    -- sfix(2, -6)
    signal c1c3c26c8c3cm3c5c7c3cm1c12cm20c2cm3c0c2_weight : PIPELINE_TYPE_FOR_C1C3C26C8C3CM3C5C7C3CM1C12CM20C2CM3C0C2_WEIGHT;
    -- sfix(2, -6)
    signal c2cm30c2c3c2c0c15cm10c0cm2c13c32cm3c1cm7c0_weight : PIPELINE_TYPE_FOR_C2CM30C2C3C2C0C15CM10C0CM2C13C32CM3C1CM7C0_WEIGHT;
    -- sfix(2, -6)
    signal cm1cm3cm2c1c0c0cm3cm2c0c0cm23cm2cm1cm2c8c1_weight : PIPELINE_TYPE_FOR_CM1CM3CM2C1C0C0CM3CM2C0C0CM23CM2CM1CM2C8C1_WEIGHT;
    -- sfix(2, -6)
    signal cm2cm6cm47cm21c12cm5c4c21c2c14cm5c24cm1cm3cm11cm57_weight : PIPELINE_TYPE_FOR_CM2CM6CM47CM21C12CM5C4C21C2C14CM5C24CM1CM3CM11CM57_WEIGHT;
    -- sfix(2, -6)
    signal cm10c6c2c23c3c0c2cm4c2c3cm14cm3cm7c3cm2cm9_weight : PIPELINE_TYPE_FOR_CM10C6C2C23C3C0C2CM4C2C3CM14CM3CM7C3CM2CM9_WEIGHT;
    -- sfix(2, -6)
    signal cm29c3cm2c2c0c3c5c5c2c1c10c15cm9c2c23c1_weight : PIPELINE_TYPE_FOR_CM29C3CM2C2C0C3C5C5C2C1C10C15CM9C2C23C1_WEIGHT;
    -- sfix(2, -6)
    signal cm1c8c1cm2cm11cm2c4cm3c16c2cm2cm3c5c6c3cm5_weight : PIPELINE_TYPE_FOR_CM1C8C1CM2CM11CM2C4CM3C16C2CM2CM3C5C6C3CM5_WEIGHT;
    -- sfix(2, -6)
    signal c0cm2cm4c0c0c5cm1c0c0cm5c1c3c0c4cm3cm1_weight : PIPELINE_TYPE_FOR_C0CM2CM4C0C0C5CM1C0C0CM5C1C3C0C4CM3CM1_WEIGHT;
    -- sfix(2, -6)
    signal c0c1cm7cm2c5c6c12cm2c0c10c24cm10cm3c2c9c4_weight : PIPELINE_TYPE_FOR_C0C1CM7CM2C5C6C12CM2C0C10C24CM10CM3C2C9C4_WEIGHT;
    -- sfix(2, -6)
    signal cm5cm2c4c0c5cm3c8cm3cm10c1cm11cm4cm15c6c1cm1_weight : PIPELINE_TYPE_FOR_CM5CM2C4C0C5CM3C8CM3CM10C1CM11CM4CM15C6C1CM1_WEIGHT;
    -- sfix(2, -6)
    signal c4c1c4c1cm8c10c10cm1c2c25cm41cm20c4cm1c2cm2_weight : PIPELINE_TYPE_FOR_C4C1C4C1CM8C10C10CM1C2C25CM41CM20C4CM1C2CM2_WEIGHT;
    -- sfix(2, -6)
    signal cm2c0cm1c1cm4cm8cm4cm23c6c6cm11cm18cm1cm10c7c1_weight : PIPELINE_TYPE_FOR_CM2C0CM1C1CM4CM8CM4CM23C6C6CM11CM18CM1CM10C7C1_WEIGHT;
    -- sfix(2, -6)
    signal c1cm3cm2c6cm12cm6c6c2c10cm9cm13c7cm1cm1c6cm1_weight : PIPELINE_TYPE_FOR_C1CM3CM2C6CM12CM6C6C2C10CM9CM13C7CM1CM1C6CM1_WEIGHT;
    -- sfix(2, -6)
    signal c1c1c10c2c2c11c0cm3c2c21cm20c0c1cm7c2cm3_weight : PIPELINE_TYPE_FOR_C1C1C10C2C2C11C0CM3C2C21CM20C0C1CM7C2CM3_WEIGHT;
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



    WEIGHT_ROM: entity work.conv5_core5_rmcm_weightsconstant_memory
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
        
            dout1   => cm3c0c2cm1cm8cm4c28cm1c13cm3cm23c0cm15c3c7c2_weight(0), 
            dout2   => cm19c2c1c5c3cm8c3c1c20cm22c3cm10c17c8c1cm4_weight(0), 
            dout3   => c1cm2cm2c3cm6cm11c11c1c3cm15cm15c6cm1cm5c3c1_weight(0), 
            dout4   => c15c8cm2c3c5cm23cm7cm1cm5cm7c12c23cm2cm11c0cm8_weight(0), 
            dout5   => c18c0cm6cm1c1c0cm7cm1c0c1c6c3c12c0cm7c1_weight(0), 
            dout6   => c9c2c0cm26cm4cm8cm4c4c1cm24cm4c6c7cm5c0c9_weight(0), 
            dout7   => cm1cm10c0cm1c3cm9cm3c3c4cm8cm5cm7c3c57c1cm1_weight(0), 
            dout8   => c5cm2c9c1c0cm12c5c0cm3c17c6cm6c0cm2c5c1_weight(0), 
            dout9   => cm1c6cm4c2c2c2cm9cm6c10cm10c17cm26c0c7c13cm2_weight(0), 
            dout10   => c8cm4c2c3cm12c1c7cm2c6cm8cm2cm1cm3c0c23c0_weight(0), 
            dout11   => c1c6cm4c1cm3c0c13cm5c1c10c52cm7cm5c4cm2c2_weight(0), 
            dout12   => cm7c1c13c1c0cm2c3cm10c19cm23c1cm3cm6cm1c2c2_weight(0), 
            dout13   => c0c0c2cm1cm1cm3c8c1c5c8cm30cm1c20cm13cm14c2_weight(0), 
            dout14   => c15c0c0cm2cm1c0cm11c2cm3c0cm2cm7cm5c0c2c0_weight(0), 
            dout15   => cm1cm6c0cm12c1cm3cm4cm4c1cm14c6cm5c0c12cm6c17_weight(0), 
            dout16   => c10c0c3c7cm1c5c2cm3cm8cm2c2c1c3c5c1c4_weight(0), 
            dout17   => c12c0c0c18c10c3cm1cm2c6cm2cm3cm3c3c0c1cm13_weight(0), 
            dout18   => cm1cm4c1c12cm3cm9c0c0cm1c6cm8c2c2c3cm7cm5_weight(0), 
            dout19   => c1c3c26c8c3cm3c5c7c3cm1c12cm20c2cm3c0c2_weight(0), 
            dout20   => c2cm30c2c3c2c0c15cm10c0cm2c13c32cm3c1cm7c0_weight(0), 
            dout21   => cm1cm3cm2c1c0c0cm3cm2c0c0cm23cm2cm1cm2c8c1_weight(0), 
            dout22   => cm2cm6cm47cm21c12cm5c4c21c2c14cm5c24cm1cm3cm11cm57_weight(0), 
            dout23   => cm10c6c2c23c3c0c2cm4c2c3cm14cm3cm7c3cm2cm9_weight(0), 
            dout24   => cm29c3cm2c2c0c3c5c5c2c1c10c15cm9c2c23c1_weight(0), 
            dout25   => cm1c8c1cm2cm11cm2c4cm3c16c2cm2cm3c5c6c3cm5_weight(0), 
            dout26   => c0cm2cm4c0c0c5cm1c0c0cm5c1c3c0c4cm3cm1_weight(0), 
            dout27   => c0c1cm7cm2c5c6c12cm2c0c10c24cm10cm3c2c9c4_weight(0), 
            dout28   => cm5cm2c4c0c5cm3c8cm3cm10c1cm11cm4cm15c6c1cm1_weight(0), 
            dout29   => c4c1c4c1cm8c10c10cm1c2c25cm41cm20c4cm1c2cm2_weight(0), 
            dout30   => cm2c0cm1c1cm4cm8cm4cm23c6c6cm11cm18cm1cm10c7c1_weight(0), 
            dout31   => c1cm3cm2c6cm12cm6c6c2c10cm9cm13c7cm1cm1c6cm1_weight(0), 
            dout32   => c1c1c10c2c2c11c0cm3c2c21cm20c0c1cm7c2cm3_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_cm3c0c2cm1cm8cm4c28cm1c13cm3cm23c0cm15c3c7c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3c0c2cm1cm8cm4c28cm1c13cm3cm23c0cm15c3c7c2_weight(0), cm3c0c2cm1cm8cm4c28cm1c13cm3cm23c0cm15c3c7c2_weight(1));
    PL_STEP_0_for_cm19c2c1c5c3cm8c3c1c20cm22c3cm10c17c8c1cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm19c2c1c5c3cm8c3c1c20cm22c3cm10c17c8c1cm4_weight(0), cm19c2c1c5c3cm8c3c1c20cm22c3cm10c17c8c1cm4_weight(1));
    PL_STEP_0_for_c1cm2cm2c3cm6cm11c11c1c3cm15cm15c6cm1cm5c3c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm2cm2c3cm6cm11c11c1c3cm15cm15c6cm1cm5c3c1_weight(0), c1cm2cm2c3cm6cm11c11c1c3cm15cm15c6cm1cm5c3c1_weight(1));
    PL_STEP_0_for_c15c8cm2c3c5cm23cm7cm1cm5cm7c12c23cm2cm11c0cm8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c15c8cm2c3c5cm23cm7cm1cm5cm7c12c23cm2cm11c0cm8_weight(0), c15c8cm2c3c5cm23cm7cm1cm5cm7c12c23cm2cm11c0cm8_weight(1));
    PL_STEP_0_for_c18c0cm6cm1c1c0cm7cm1c0c1c6c3c12c0cm7c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c18c0cm6cm1c1c0cm7cm1c0c1c6c3c12c0cm7c1_weight(0), c18c0cm6cm1c1c0cm7cm1c0c1c6c3c12c0cm7c1_weight(1));
    PL_STEP_0_for_c9c2c0cm26cm4cm8cm4c4c1cm24cm4c6c7cm5c0c9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c9c2c0cm26cm4cm8cm4c4c1cm24cm4c6c7cm5c0c9_weight(0), c9c2c0cm26cm4cm8cm4c4c1cm24cm4c6c7cm5c0c9_weight(1));
    PL_STEP_0_for_cm1cm10c0cm1c3cm9cm3c3c4cm8cm5cm7c3c57c1cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm10c0cm1c3cm9cm3c3c4cm8cm5cm7c3c57c1cm1_weight(0), cm1cm10c0cm1c3cm9cm3c3c4cm8cm5cm7c3c57c1cm1_weight(1));
    PL_STEP_0_for_c5cm2c9c1c0cm12c5c0cm3c17c6cm6c0cm2c5c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5cm2c9c1c0cm12c5c0cm3c17c6cm6c0cm2c5c1_weight(0), c5cm2c9c1c0cm12c5c0cm3c17c6cm6c0cm2c5c1_weight(1));
    PL_STEP_0_for_cm1c6cm4c2c2c2cm9cm6c10cm10c17cm26c0c7c13cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c6cm4c2c2c2cm9cm6c10cm10c17cm26c0c7c13cm2_weight(0), cm1c6cm4c2c2c2cm9cm6c10cm10c17cm26c0c7c13cm2_weight(1));
    PL_STEP_0_for_c8cm4c2c3cm12c1c7cm2c6cm8cm2cm1cm3c0c23c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c8cm4c2c3cm12c1c7cm2c6cm8cm2cm1cm3c0c23c0_weight(0), c8cm4c2c3cm12c1c7cm2c6cm8cm2cm1cm3c0c23c0_weight(1));
    PL_STEP_0_for_c1c6cm4c1cm3c0c13cm5c1c10c52cm7cm5c4cm2c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c6cm4c1cm3c0c13cm5c1c10c52cm7cm5c4cm2c2_weight(0), c1c6cm4c1cm3c0c13cm5c1c10c52cm7cm5c4cm2c2_weight(1));
    PL_STEP_0_for_cm7c1c13c1c0cm2c3cm10c19cm23c1cm3cm6cm1c2c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm7c1c13c1c0cm2c3cm10c19cm23c1cm3cm6cm1c2c2_weight(0), cm7c1c13c1c0cm2c3cm10c19cm23c1cm3cm6cm1c2c2_weight(1));
    PL_STEP_0_for_c0c0c2cm1cm1cm3c8c1c5c8cm30cm1c20cm13cm14c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c2cm1cm1cm3c8c1c5c8cm30cm1c20cm13cm14c2_weight(0), c0c0c2cm1cm1cm3c8c1c5c8cm30cm1c20cm13cm14c2_weight(1));
    PL_STEP_0_for_c15c0c0cm2cm1c0cm11c2cm3c0cm2cm7cm5c0c2c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c15c0c0cm2cm1c0cm11c2cm3c0cm2cm7cm5c0c2c0_weight(0), c15c0c0cm2cm1c0cm11c2cm3c0cm2cm7cm5c0c2c0_weight(1));
    PL_STEP_0_for_cm1cm6c0cm12c1cm3cm4cm4c1cm14c6cm5c0c12cm6c17_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm6c0cm12c1cm3cm4cm4c1cm14c6cm5c0c12cm6c17_weight(0), cm1cm6c0cm12c1cm3cm4cm4c1cm14c6cm5c0c12cm6c17_weight(1));
    PL_STEP_0_for_c10c0c3c7cm1c5c2cm3cm8cm2c2c1c3c5c1c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c10c0c3c7cm1c5c2cm3cm8cm2c2c1c3c5c1c4_weight(0), c10c0c3c7cm1c5c2cm3cm8cm2c2c1c3c5c1c4_weight(1));
    PL_STEP_0_for_c12c0c0c18c10c3cm1cm2c6cm2cm3cm3c3c0c1cm13_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c12c0c0c18c10c3cm1cm2c6cm2cm3cm3c3c0c1cm13_weight(0), c12c0c0c18c10c3cm1cm2c6cm2cm3cm3c3c0c1cm13_weight(1));
    PL_STEP_0_for_cm1cm4c1c12cm3cm9c0c0cm1c6cm8c2c2c3cm7cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm4c1c12cm3cm9c0c0cm1c6cm8c2c2c3cm7cm5_weight(0), cm1cm4c1c12cm3cm9c0c0cm1c6cm8c2c2c3cm7cm5_weight(1));
    PL_STEP_0_for_c1c3c26c8c3cm3c5c7c3cm1c12cm20c2cm3c0c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c3c26c8c3cm3c5c7c3cm1c12cm20c2cm3c0c2_weight(0), c1c3c26c8c3cm3c5c7c3cm1c12cm20c2cm3c0c2_weight(1));
    PL_STEP_0_for_c2cm30c2c3c2c0c15cm10c0cm2c13c32cm3c1cm7c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2cm30c2c3c2c0c15cm10c0cm2c13c32cm3c1cm7c0_weight(0), c2cm30c2c3c2c0c15cm10c0cm2c13c32cm3c1cm7c0_weight(1));
    PL_STEP_0_for_cm1cm3cm2c1c0c0cm3cm2c0c0cm23cm2cm1cm2c8c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm3cm2c1c0c0cm3cm2c0c0cm23cm2cm1cm2c8c1_weight(0), cm1cm3cm2c1c0c0cm3cm2c0c0cm23cm2cm1cm2c8c1_weight(1));
    PL_STEP_0_for_cm2cm6cm47cm21c12cm5c4c21c2c14cm5c24cm1cm3cm11cm57_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm6cm47cm21c12cm5c4c21c2c14cm5c24cm1cm3cm11cm57_weight(0), cm2cm6cm47cm21c12cm5c4c21c2c14cm5c24cm1cm3cm11cm57_weight(1));
    PL_STEP_0_for_cm10c6c2c23c3c0c2cm4c2c3cm14cm3cm7c3cm2cm9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm10c6c2c23c3c0c2cm4c2c3cm14cm3cm7c3cm2cm9_weight(0), cm10c6c2c23c3c0c2cm4c2c3cm14cm3cm7c3cm2cm9_weight(1));
    PL_STEP_0_for_cm29c3cm2c2c0c3c5c5c2c1c10c15cm9c2c23c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm29c3cm2c2c0c3c5c5c2c1c10c15cm9c2c23c1_weight(0), cm29c3cm2c2c0c3c5c5c2c1c10c15cm9c2c23c1_weight(1));
    PL_STEP_0_for_cm1c8c1cm2cm11cm2c4cm3c16c2cm2cm3c5c6c3cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c8c1cm2cm11cm2c4cm3c16c2cm2cm3c5c6c3cm5_weight(0), cm1c8c1cm2cm11cm2c4cm3c16c2cm2cm3c5c6c3cm5_weight(1));
    PL_STEP_0_for_c0cm2cm4c0c0c5cm1c0c0cm5c1c3c0c4cm3cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm2cm4c0c0c5cm1c0c0cm5c1c3c0c4cm3cm1_weight(0), c0cm2cm4c0c0c5cm1c0c0cm5c1c3c0c4cm3cm1_weight(1));
    PL_STEP_0_for_c0c1cm7cm2c5c6c12cm2c0c10c24cm10cm3c2c9c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c1cm7cm2c5c6c12cm2c0c10c24cm10cm3c2c9c4_weight(0), c0c1cm7cm2c5c6c12cm2c0c10c24cm10cm3c2c9c4_weight(1));
    PL_STEP_0_for_cm5cm2c4c0c5cm3c8cm3cm10c1cm11cm4cm15c6c1cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5cm2c4c0c5cm3c8cm3cm10c1cm11cm4cm15c6c1cm1_weight(0), cm5cm2c4c0c5cm3c8cm3cm10c1cm11cm4cm15c6c1cm1_weight(1));
    PL_STEP_0_for_c4c1c4c1cm8c10c10cm1c2c25cm41cm20c4cm1c2cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4c1c4c1cm8c10c10cm1c2c25cm41cm20c4cm1c2cm2_weight(0), c4c1c4c1cm8c10c10cm1c2c25cm41cm20c4cm1c2cm2_weight(1));
    PL_STEP_0_for_cm2c0cm1c1cm4cm8cm4cm23c6c6cm11cm18cm1cm10c7c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c0cm1c1cm4cm8cm4cm23c6c6cm11cm18cm1cm10c7c1_weight(0), cm2c0cm1c1cm4cm8cm4cm23c6c6cm11cm18cm1cm10c7c1_weight(1));
    PL_STEP_0_for_c1cm3cm2c6cm12cm6c6c2c10cm9cm13c7cm1cm1c6cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm3cm2c6cm12cm6c6c2c10cm9cm13c7cm1cm1c6cm1_weight(0), c1cm3cm2c6cm12cm6c6c2c10cm9cm13c7cm1cm1c6cm1_weight(1));
    PL_STEP_0_for_c1c1c10c2c2c11c0cm3c2c21cm20c0c1cm7c2cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c1c10c2c2c11c0cm3c2c21cm20c0c1cm7c2cm3_weight(0), c1c1c10c2c2c11c0cm3c2c21cm20c0c1cm7c2cm3_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    cm1cm10c0cm1c3cm9cm3c3c4cm8cm5cm7c3c57c1cm1_c0cm2cm4c0c0c5cm1c0c0cm5c1c3c0c4cm3cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm1cm10c0cm1c3cm9cm3c3c4cm8cm5cm7c3c57c1cm1_weight(1)(7-1 downto 0),
			B	=> c0cm2cm4c0c0c5cm1c0c0cm5c1c3c0c4cm3cm1_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1cm10c0cm1c3cm9cm3c3c4cm8cm5cm7c3c57c1cm1,
			CxB => R_c0cm2cm4c0c0c5cm1c0c0cm5c1c3c0c4cm3cm1
		);

    c1c6cm4c1cm3c0c13cm5c1c10c52cm7cm5c4cm2c2_c1cm3cm2c6cm12cm6c6c2c10cm9cm13c7cm1cm1c6cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c1c6cm4c1cm3c0c13cm5c1c10c52cm7cm5c4cm2c2_weight(1)(7-1 downto 0),
			B	=> c1cm3cm2c6cm12cm6c6c2c10cm9cm13c7cm1cm1c6cm1_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1c6cm4c1cm3c0c13cm5c1c10c52cm7cm5c4cm2c2,
			CxB => R_c1cm3cm2c6cm12cm6c6c2c10cm9cm13c7cm1cm1c6cm1
		);

    c2cm30c2c3c2c0c15cm10c0cm2c13c32cm3c1cm7c0_cm5cm2c4c0c5cm3c8cm3cm10c1cm11cm4cm15c6c1cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c2cm30c2c3c2c0c15cm10c0cm2c13c32cm3c1cm7c0_weight(1)(7-1 downto 0),
			B	=> cm5cm2c4c0c5cm3c8cm3cm10c1cm11cm4cm15c6c1cm1_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c2cm30c2c3c2c0c15cm10c0cm2c13c32cm3c1cm7c0,
			CxB => R_cm5cm2c4c0c5cm3c8cm3cm10c1cm11cm4cm15c6c1cm1
		);

    cm2cm6cm47cm21c12cm5c4c21c2c14cm5c24cm1cm3cm11cm57_cm1cm4c1c12cm3cm9c0c0cm1c6cm8c2c2c3cm7cm5_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2cm6cm47cm21c12cm5c4c21c2c14cm5c24cm1cm3cm11cm57_weight(1)(7-1 downto 0),
			B	=> cm1cm4c1c12cm3cm9c0c0cm1c6cm8c2c2c3cm7cm5_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2cm6cm47cm21c12cm5c4c21c2c14cm5c24cm1cm3cm11cm57,
			CxB => R_cm1cm4c1c12cm3cm9c0c0cm1c6cm8c2c2c3cm7cm5
		);

    c4c1c4c1cm8c10c10cm1c2c25cm41cm20c4cm1c2cm2_c10c0c3c7cm1c5c2cm3cm8cm2c2c1c3c5c1c4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c4c1c4c1cm8c10c10cm1c2c25cm41cm20c4cm1c2cm2_weight(1)(7-1 downto 0),
			B	=> c10c0c3c7cm1c5c2cm3cm8cm2c2c1c3c5c1c4_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c4c1c4c1cm8c10c10cm1c2c25cm41cm20c4cm1c2cm2,
			CxB => R_c10c0c3c7cm1c5c2cm3cm8cm2c2c1c3c5c1c4
		);

    cm3c0c2cm1cm8cm4c28cm1c13cm3cm23c0cm15c3c7c2_c15c0c0cm2cm1c0cm11c2cm3c0cm2cm7cm5c0c2c0_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 6,
			B_WIDTH => 5,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm3c0c2cm1cm8cm4c28cm1c13cm3cm23c0cm15c3c7c2_weight(1)(6-1 downto 0),
			B	=> c15c0c0cm2cm1c0cm11c2cm3c0cm2cm7cm5c0c2c0_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm3c0c2cm1cm8cm4c28cm1c13cm3cm23c0cm15c3c7c2,
			CxB => R_c15c0c0cm2cm1c0cm11c2cm3c0cm2cm7cm5c0c2c0
		);

    cm19c2c1c5c3cm8c3c1c20cm22c3cm10c17c8c1cm4_c1cm2cm2c3cm6cm11c11c1c3cm15cm15c6cm1cm5c3c1_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 6,
			B_WIDTH => 5,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> cm19c2c1c5c3cm8c3c1c20cm22c3cm10c17c8c1cm4_weight(1)(6-1 downto 0),
			B	=> c1cm2cm2c3cm6cm11c11c1c3cm15cm15c6cm1cm5c3c1_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm19c2c1c5c3cm8c3c1c20cm22c3cm10c17c8c1cm4,
			CxB => R_c1cm2cm2c3cm6cm11c11c1c3cm15cm15c6cm1cm5c3c1
		);

    c15c8cm2c3c5cm23cm7cm1cm5cm7c12c23cm2cm11c0cm8_c1c1c10c2c2c11c0cm3c2c21cm20c0c1cm7c2cm3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c15c8cm2c3c5cm23cm7cm1cm5cm7c12c23cm2cm11c0cm8_weight(1)(6-1 downto 0),
			B	=> c1c1c10c2c2c11c0cm3c2c21cm20c0c1cm7c2cm3_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c15c8cm2c3c5cm23cm7cm1cm5cm7c12c23cm2cm11c0cm8,
			CxB => R_c1c1c10c2c2c11c0cm3c2c21cm20c0c1cm7c2cm3
		);

    c18c0cm6cm1c1c0cm7cm1c0c1c6c3c12c0cm7c1_cm2c0cm1c1cm4cm8cm4cm23c6c6cm11cm18cm1cm10c7c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c18c0cm6cm1c1c0cm7cm1c0c1c6c3c12c0cm7c1_weight(1)(6-1 downto 0),
			B	=> cm2c0cm1c1cm4cm8cm4cm23c6c6cm11cm18cm1cm10c7c1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c18c0cm6cm1c1c0cm7cm1c0c1c6c3c12c0cm7c1,
			CxB => R_cm2c0cm1c1cm4cm8cm4cm23c6c6cm11cm18cm1cm10c7c1
		);

    c9c2c0cm26cm4cm8cm4c4c1cm24cm4c6c7cm5c0c9_c0c1cm7cm2c5c6c12cm2c0c10c24cm10cm3c2c9c4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c9c2c0cm26cm4cm8cm4c4c1cm24cm4c6c7cm5c0c9_weight(1)(6-1 downto 0),
			B	=> c0c1cm7cm2c5c6c12cm2c0c10c24cm10cm3c2c9c4_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c9c2c0cm26cm4cm8cm4c4c1cm24cm4c6c7cm5c0c9,
			CxB => R_c0c1cm7cm2c5c6c12cm2c0c10c24cm10cm3c2c9c4
		);

    c5cm2c9c1c0cm12c5c0cm3c17c6cm6c0cm2c5c1_cm1c8c1cm2cm11cm2c4cm3c16c2cm2cm3c5c6c3cm5_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c5cm2c9c1c0cm12c5c0cm3c17c6cm6c0cm2c5c1_weight(1)(6-1 downto 0),
			B	=> cm1c8c1cm2cm11cm2c4cm3c16c2cm2cm3c5c6c3cm5_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c5cm2c9c1c0cm12c5c0cm3c17c6cm6c0cm2c5c1,
			CxB => R_cm1c8c1cm2cm11cm2c4cm3c16c2cm2cm3c5c6c3cm5
		);

    cm1c6cm4c2c2c2cm9cm6c10cm10c17cm26c0c7c13cm2_cm29c3cm2c2c0c3c5c5c2c1c10c15cm9c2c23c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm1c6cm4c2c2c2cm9cm6c10cm10c17cm26c0c7c13cm2_weight(1)(6-1 downto 0),
			B	=> cm29c3cm2c2c0c3c5c5c2c1c10c15cm9c2c23c1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1c6cm4c2c2c2cm9cm6c10cm10c17cm26c0c7c13cm2,
			CxB => R_cm29c3cm2c2c0c3c5c5c2c1c10c15cm9c2c23c1
		);

    c8cm4c2c3cm12c1c7cm2c6cm8cm2cm1cm3c0c23c0_cm10c6c2c23c3c0c2cm4c2c3cm14cm3cm7c3cm2cm9_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c8cm4c2c3cm12c1c7cm2c6cm8cm2cm1cm3c0c23c0_weight(1)(6-1 downto 0),
			B	=> cm10c6c2c23c3c0c2cm4c2c3cm14cm3cm7c3cm2cm9_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c8cm4c2c3cm12c1c7cm2c6cm8cm2cm1cm3c0c23c0,
			CxB => R_cm10c6c2c23c3c0c2cm4c2c3cm14cm3cm7c3cm2cm9
		);

    cm7c1c13c1c0cm2c3cm10c19cm23c1cm3cm6cm1c2c2_cm1cm3cm2c1c0c0cm3cm2c0c0cm23cm2cm1cm2c8c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm7c1c13c1c0cm2c3cm10c19cm23c1cm3cm6cm1c2c2_weight(1)(6-1 downto 0),
			B	=> cm1cm3cm2c1c0c0cm3cm2c0c0cm23cm2cm1cm2c8c1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm7c1c13c1c0cm2c3cm10c19cm23c1cm3cm6cm1c2c2,
			CxB => R_cm1cm3cm2c1c0c0cm3cm2c0c0cm23cm2cm1cm2c8c1
		);

    c0c0c2cm1cm1cm3c8c1c5c8cm30cm1c20cm13cm14c2_c1c3c26c8c3cm3c5c7c3cm1c12cm20c2cm3c0c2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0c0c2cm1cm1cm3c8c1c5c8cm30cm1c20cm13cm14c2_weight(1)(6-1 downto 0),
			B	=> c1c3c26c8c3cm3c5c7c3cm1c12cm20c2cm3c0c2_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c0c2cm1cm1cm3c8c1c5c8cm30cm1c20cm13cm14c2,
			CxB => R_c1c3c26c8c3cm3c5c7c3cm1c12cm20c2cm3c0c2
		);

    cm1cm6c0cm12c1cm3cm4cm4c1cm14c6cm5c0c12cm6c17_c12c0c0c18c10c3cm1cm2c6cm2cm3cm3c3c0c1cm13_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm1cm6c0cm12c1cm3cm4cm4c1cm14c6cm5c0c12cm6c17_weight(1)(6-1 downto 0),
			B	=> c12c0c0c18c10c3cm1cm2c6cm2cm3cm3c3c0c1cm13_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1cm6c0cm12c1cm3cm4cm4c1cm14c6cm5c0c12cm6c17,
			CxB => R_c12c0c0c18c10c3cm1cm2c6cm2cm3cm3c3c0c1cm13
		);




end architecture;
