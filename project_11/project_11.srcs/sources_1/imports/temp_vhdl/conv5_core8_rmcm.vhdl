library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv5_core8_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        R_c16c5c19c1cm7cm5cm23c0c9cm2cm2cm3cm7c6c3c0 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm49cm2cm1c4c0c8cm3cm5cm20c0cm1c2c2c26cm7cm12 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c1c43c6c2c5cm45c1c0cm2cm19c5c0c3cm5c0cm2 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c0cm5c1c0c7c7cm1c1cm1cm6c1c6c0cm4c0cm23 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm5c2c1c2cm5c0cm1cm3cm23c1cm3c0c9c2c7c0 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c3cm11c0cm4cm7c8cm1c9c127c3c0c5cm2c34c2cm12 : out std_logic_vector(15-1 downto 0);   --	sfix(7, -8)
        R_c1cm8c0cm2c1c1c5cm3c0c23c1c0c6c1c8c1 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c3c13cm1cm8cm5cm8c8cm2c0cm5c3c4c5cm6cm12cm8 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm2c3c15cm2c4cm3cm10c6cm2c2c2c6cm7cm3cm12c12 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm17cm7c3cm1c7c4cm24cm2cm3c2cm2c3c1c8cm20c1 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c1cm4c1c0cm1cm13c11c2c4cm3cm6c2cm1cm9cm9c7 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c0c6cm1c52cm7c1cm2c6cm13c1cm4cm3cm13cm11c1c6 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c2c3c6c0c2cm1cm2c0cm11c6c11c1cm1cm6c20c2 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c3c0c8cm3c4c1cm5cm2c0c0cm3c0c0c0c1c0 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm1c3cm7cm26cm1cm4c9cm3c2c5c2cm19c1c0cm2cm2 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c4c4cm1cm5cm2c2cm5cm2c2c0cm2c0cm5c2cm8c2 : out std_logic_vector(11-1 downto 0);   --	sfix(3, -8)
        R_cm6cm2c1cm8c1cm2cm3cm5cm12c0c1c4cm1cm1cm3c0 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c3c6cm7cm7cm1cm5c2cm16c2cm4c20c0c7cm10c2c3 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm3c10c6cm14cm1cm1c1c6cm1cm1cm7c12cm1c1c7c4 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c2c1cm7cm8c3cm2c2cm4c1cm6c7cm6cm3c0cm20c9 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c0c0cm4c0cm2c0c6cm2c0c2cm1c4c3cm1c2c4 : out std_logic_vector(11-1 downto 0);   --	sfix(3, -8)
        R_cm8cm2c1cm11c15cm3c0c47c7cm3c74cm10c7c3cm2cm24 : out std_logic_vector(15-1 downto 0);   --	sfix(7, -8)
        R_c5c0cm3cm7c8c10cm1c4cm8cm7c2c5cm1cm6cm14c3 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm7c4cm4cm2c1c1cm2cm1c3cm5cm7cm1cm1cm17cm17cm10 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c21cm5c3c4cm10cm6c0cm7cm12c0cm2c3cm6cm2cm11cm14 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c0cm5c0c2c1c2cm1c1c0cm4cm1c0cm3c2cm1cm1 : out std_logic_vector(11-1 downto 0);   --	sfix(3, -8)
        R_cm4cm5cm4c1c2c4cm1cm1c2c1c2c0cm5cm16cm21c4 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm10cm2cm13c2c1cm2cm1c1c0cm3cm2c1cm20cm5c1cm3 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c5cm11cm11cm1c7cm1c8c4c0c4c3c5c0cm16c21c26 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm15c6c3c19c5cm2cm7cm67c7c11c3cm8c20c0cm6c14 : out std_logic_vector(15-1 downto 0);   --	sfix(7, -8)
        R_c0cm2cm7c2cm2cm4cm20cm5c7c2cm16cm2cm7c9c4cm6 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c0cm8c5c3c0c0cm4c0c1c5c2c5c1cm28c3c0 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(9-1 downto 0)  --	sfix(1, -8)
    );
end conv5_core8_rmcm;

architecture arch of conv5_core8_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_C16C5C19C1CM7CM5CM23C0C9CM2CM2CM3CM7C6C3C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM49CM2CM1C4C0C8CM3CM5CM20C0CM1C2C2C26CM7CM12_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C43C6C2C5CM45C1C0CM2CM19C5C0C3CM5C0CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM5C1C0C7C7CM1C1CM1CM6C1C6C0CM4C0CM23_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5C2C1C2CM5C0CM1CM3CM23C1CM3C0C9C2C7C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3CM11C0CM4CM7C8CM1C9C127C3C0C5CM2C34C2CM12_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM8C0CM2C1C1C5CM3C0C23C1C0C6C1C8C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C13CM1CM8CM5CM8C8CM2C0CM5C3C4C5CM6CM12CM8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C3C15CM2C4CM3CM10C6CM2C2C2C6CM7CM3CM12C12_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM17CM7C3CM1C7C4CM24CM2CM3C2CM2C3C1C8CM20C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM4C1C0CM1CM13C11C2C4CM3CM6C2CM1CM9CM9C7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C6CM1C52CM7C1CM2C6CM13C1CM4CM3CM13CM11C1C6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C3C6C0C2CM1CM2C0CM11C6C11C1CM1CM6C20C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C0C8CM3C4C1CM5CM2C0C0CM3C0C0C0C1C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C3CM7CM26CM1CM4C9CM3C2C5C2CM19C1C0CM2CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4C4CM1CM5CM2C2CM5CM2C2C0CM2C0CM5C2CM8C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM6CM2C1CM8C1CM2CM3CM5CM12C0C1C4CM1CM1CM3C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C6CM7CM7CM1CM5C2CM16C2CM4C20C0C7CM10C2C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3C10C6CM14CM1CM1C1C6CM1CM1CM7C12CM1C1C7C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C1CM7CM8C3CM2C2CM4C1CM6C7CM6CM3C0CM20C9_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0CM4C0CM2C0C6CM2C0C2CM1C4C3CM1C2C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM8CM2C1CM11C15CM3C0C47C7CM3C74CM10C7C3CM2CM24_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5C0CM3CM7C8C10CM1C4CM8CM7C2C5CM1CM6CM14C3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM7C4CM4CM2C1C1CM2CM1C3CM5CM7CM1CM1CM17CM17CM10_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C21CM5C3C4CM10CM6C0CM7CM12C0CM2C3CM6CM2CM11CM14_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM5C0C2C1C2CM1C1C0CM4CM1C0CM3C2CM1CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4CM5CM4C1C2C4CM1CM1C2C1C2C0CM5CM16CM21C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM10CM2CM13C2C1CM2CM1C1C0CM3CM2C1CM20CM5C1CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5CM11CM11CM1C7CM1C8C4C0C4C3C5C0CM16C21C26_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM15C6C3C19C5CM2CM7CM67C7C11C3CM8C20C0CM6C14_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM2CM7C2CM2CM4CM20CM5C7C2CM16CM2CM7C9C4CM6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0CM8C5C3C0C0CM4C0C1C5C2C5C1CM28C3C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(5, -2)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(2, -6)
    signal c16c5c19c1cm7cm5cm23c0c9cm2cm2cm3cm7c6c3c0_weight : PIPELINE_TYPE_FOR_C16C5C19C1CM7CM5CM23C0C9CM2CM2CM3CM7C6C3C0_WEIGHT;
    -- sfix(2, -6)
    signal cm49cm2cm1c4c0c8cm3cm5cm20c0cm1c2c2c26cm7cm12_weight : PIPELINE_TYPE_FOR_CM49CM2CM1C4C0C8CM3CM5CM20C0CM1C2C2C26CM7CM12_WEIGHT;
    -- sfix(2, -6)
    signal c1c43c6c2c5cm45c1c0cm2cm19c5c0c3cm5c0cm2_weight : PIPELINE_TYPE_FOR_C1C43C6C2C5CM45C1C0CM2CM19C5C0C3CM5C0CM2_WEIGHT;
    -- sfix(2, -6)
    signal c0cm5c1c0c7c7cm1c1cm1cm6c1c6c0cm4c0cm23_weight : PIPELINE_TYPE_FOR_C0CM5C1C0C7C7CM1C1CM1CM6C1C6C0CM4C0CM23_WEIGHT;
    -- sfix(2, -6)
    signal cm5c2c1c2cm5c0cm1cm3cm23c1cm3c0c9c2c7c0_weight : PIPELINE_TYPE_FOR_CM5C2C1C2CM5C0CM1CM3CM23C1CM3C0C9C2C7C0_WEIGHT;
    -- sfix(2, -6)
    signal c3cm11c0cm4cm7c8cm1c9c127c3c0c5cm2c34c2cm12_weight : PIPELINE_TYPE_FOR_C3CM11C0CM4CM7C8CM1C9C127C3C0C5CM2C34C2CM12_WEIGHT;
    -- sfix(2, -6)
    signal c1cm8c0cm2c1c1c5cm3c0c23c1c0c6c1c8c1_weight : PIPELINE_TYPE_FOR_C1CM8C0CM2C1C1C5CM3C0C23C1C0C6C1C8C1_WEIGHT;
    -- sfix(2, -6)
    signal c3c13cm1cm8cm5cm8c8cm2c0cm5c3c4c5cm6cm12cm8_weight : PIPELINE_TYPE_FOR_C3C13CM1CM8CM5CM8C8CM2C0CM5C3C4C5CM6CM12CM8_WEIGHT;
    -- sfix(2, -6)
    signal cm2c3c15cm2c4cm3cm10c6cm2c2c2c6cm7cm3cm12c12_weight : PIPELINE_TYPE_FOR_CM2C3C15CM2C4CM3CM10C6CM2C2C2C6CM7CM3CM12C12_WEIGHT;
    -- sfix(2, -6)
    signal cm17cm7c3cm1c7c4cm24cm2cm3c2cm2c3c1c8cm20c1_weight : PIPELINE_TYPE_FOR_CM17CM7C3CM1C7C4CM24CM2CM3C2CM2C3C1C8CM20C1_WEIGHT;
    -- sfix(2, -6)
    signal c1cm4c1c0cm1cm13c11c2c4cm3cm6c2cm1cm9cm9c7_weight : PIPELINE_TYPE_FOR_C1CM4C1C0CM1CM13C11C2C4CM3CM6C2CM1CM9CM9C7_WEIGHT;
    -- sfix(2, -6)
    signal c0c6cm1c52cm7c1cm2c6cm13c1cm4cm3cm13cm11c1c6_weight : PIPELINE_TYPE_FOR_C0C6CM1C52CM7C1CM2C6CM13C1CM4CM3CM13CM11C1C6_WEIGHT;
    -- sfix(2, -6)
    signal c2c3c6c0c2cm1cm2c0cm11c6c11c1cm1cm6c20c2_weight : PIPELINE_TYPE_FOR_C2C3C6C0C2CM1CM2C0CM11C6C11C1CM1CM6C20C2_WEIGHT;
    -- sfix(2, -6)
    signal c3c0c8cm3c4c1cm5cm2c0c0cm3c0c0c0c1c0_weight : PIPELINE_TYPE_FOR_C3C0C8CM3C4C1CM5CM2C0C0CM3C0C0C0C1C0_WEIGHT;
    -- sfix(2, -6)
    signal cm1c3cm7cm26cm1cm4c9cm3c2c5c2cm19c1c0cm2cm2_weight : PIPELINE_TYPE_FOR_CM1C3CM7CM26CM1CM4C9CM3C2C5C2CM19C1C0CM2CM2_WEIGHT;
    -- sfix(2, -6)
    signal c4c4cm1cm5cm2c2cm5cm2c2c0cm2c0cm5c2cm8c2_weight : PIPELINE_TYPE_FOR_C4C4CM1CM5CM2C2CM5CM2C2C0CM2C0CM5C2CM8C2_WEIGHT;
    -- sfix(2, -6)
    signal cm6cm2c1cm8c1cm2cm3cm5cm12c0c1c4cm1cm1cm3c0_weight : PIPELINE_TYPE_FOR_CM6CM2C1CM8C1CM2CM3CM5CM12C0C1C4CM1CM1CM3C0_WEIGHT;
    -- sfix(2, -6)
    signal c3c6cm7cm7cm1cm5c2cm16c2cm4c20c0c7cm10c2c3_weight : PIPELINE_TYPE_FOR_C3C6CM7CM7CM1CM5C2CM16C2CM4C20C0C7CM10C2C3_WEIGHT;
    -- sfix(2, -6)
    signal cm3c10c6cm14cm1cm1c1c6cm1cm1cm7c12cm1c1c7c4_weight : PIPELINE_TYPE_FOR_CM3C10C6CM14CM1CM1C1C6CM1CM1CM7C12CM1C1C7C4_WEIGHT;
    -- sfix(2, -6)
    signal c2c1cm7cm8c3cm2c2cm4c1cm6c7cm6cm3c0cm20c9_weight : PIPELINE_TYPE_FOR_C2C1CM7CM8C3CM2C2CM4C1CM6C7CM6CM3C0CM20C9_WEIGHT;
    -- sfix(2, -6)
    signal c0c0cm4c0cm2c0c6cm2c0c2cm1c4c3cm1c2c4_weight : PIPELINE_TYPE_FOR_C0C0CM4C0CM2C0C6CM2C0C2CM1C4C3CM1C2C4_WEIGHT;
    -- sfix(2, -6)
    signal cm8cm2c1cm11c15cm3c0c47c7cm3c74cm10c7c3cm2cm24_weight : PIPELINE_TYPE_FOR_CM8CM2C1CM11C15CM3C0C47C7CM3C74CM10C7C3CM2CM24_WEIGHT;
    -- sfix(2, -6)
    signal c5c0cm3cm7c8c10cm1c4cm8cm7c2c5cm1cm6cm14c3_weight : PIPELINE_TYPE_FOR_C5C0CM3CM7C8C10CM1C4CM8CM7C2C5CM1CM6CM14C3_WEIGHT;
    -- sfix(2, -6)
    signal cm7c4cm4cm2c1c1cm2cm1c3cm5cm7cm1cm1cm17cm17cm10_weight : PIPELINE_TYPE_FOR_CM7C4CM4CM2C1C1CM2CM1C3CM5CM7CM1CM1CM17CM17CM10_WEIGHT;
    -- sfix(2, -6)
    signal c21cm5c3c4cm10cm6c0cm7cm12c0cm2c3cm6cm2cm11cm14_weight : PIPELINE_TYPE_FOR_C21CM5C3C4CM10CM6C0CM7CM12C0CM2C3CM6CM2CM11CM14_WEIGHT;
    -- sfix(2, -6)
    signal c0cm5c0c2c1c2cm1c1c0cm4cm1c0cm3c2cm1cm1_weight : PIPELINE_TYPE_FOR_C0CM5C0C2C1C2CM1C1C0CM4CM1C0CM3C2CM1CM1_WEIGHT;
    -- sfix(2, -6)
    signal cm4cm5cm4c1c2c4cm1cm1c2c1c2c0cm5cm16cm21c4_weight : PIPELINE_TYPE_FOR_CM4CM5CM4C1C2C4CM1CM1C2C1C2C0CM5CM16CM21C4_WEIGHT;
    -- sfix(2, -6)
    signal cm10cm2cm13c2c1cm2cm1c1c0cm3cm2c1cm20cm5c1cm3_weight : PIPELINE_TYPE_FOR_CM10CM2CM13C2C1CM2CM1C1C0CM3CM2C1CM20CM5C1CM3_WEIGHT;
    -- sfix(2, -6)
    signal c5cm11cm11cm1c7cm1c8c4c0c4c3c5c0cm16c21c26_weight : PIPELINE_TYPE_FOR_C5CM11CM11CM1C7CM1C8C4C0C4C3C5C0CM16C21C26_WEIGHT;
    -- sfix(2, -6)
    signal cm15c6c3c19c5cm2cm7cm67c7c11c3cm8c20c0cm6c14_weight : PIPELINE_TYPE_FOR_CM15C6C3C19C5CM2CM7CM67C7C11C3CM8C20C0CM6C14_WEIGHT;
    -- sfix(2, -6)
    signal c0cm2cm7c2cm2cm4cm20cm5c7c2cm16cm2cm7c9c4cm6_weight : PIPELINE_TYPE_FOR_C0CM2CM7C2CM2CM4CM20CM5C7C2CM16CM2CM7C9C4CM6_WEIGHT;
    -- sfix(2, -6)
    signal c0cm8c5c3c0c0cm4c0c1c5c2c5c1cm28c3c0_weight : PIPELINE_TYPE_FOR_C0CM8C5C3C0C0CM4C0C1C5C2C5C1CM28C3C0_WEIGHT;
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



    WEIGHT_ROM: entity work.conv5_core8_rmcm_weightsconstant_memory
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
        
            dout1   => c16c5c19c1cm7cm5cm23c0c9cm2cm2cm3cm7c6c3c0_weight(0), 
            dout2   => cm49cm2cm1c4c0c8cm3cm5cm20c0cm1c2c2c26cm7cm12_weight(0), 
            dout3   => c1c43c6c2c5cm45c1c0cm2cm19c5c0c3cm5c0cm2_weight(0), 
            dout4   => c0cm5c1c0c7c7cm1c1cm1cm6c1c6c0cm4c0cm23_weight(0), 
            dout5   => cm5c2c1c2cm5c0cm1cm3cm23c1cm3c0c9c2c7c0_weight(0), 
            dout6   => c3cm11c0cm4cm7c8cm1c9c127c3c0c5cm2c34c2cm12_weight(0), 
            dout7   => c1cm8c0cm2c1c1c5cm3c0c23c1c0c6c1c8c1_weight(0), 
            dout8   => c3c13cm1cm8cm5cm8c8cm2c0cm5c3c4c5cm6cm12cm8_weight(0), 
            dout9   => cm2c3c15cm2c4cm3cm10c6cm2c2c2c6cm7cm3cm12c12_weight(0), 
            dout10   => cm17cm7c3cm1c7c4cm24cm2cm3c2cm2c3c1c8cm20c1_weight(0), 
            dout11   => c1cm4c1c0cm1cm13c11c2c4cm3cm6c2cm1cm9cm9c7_weight(0), 
            dout12   => c0c6cm1c52cm7c1cm2c6cm13c1cm4cm3cm13cm11c1c6_weight(0), 
            dout13   => c2c3c6c0c2cm1cm2c0cm11c6c11c1cm1cm6c20c2_weight(0), 
            dout14   => c3c0c8cm3c4c1cm5cm2c0c0cm3c0c0c0c1c0_weight(0), 
            dout15   => cm1c3cm7cm26cm1cm4c9cm3c2c5c2cm19c1c0cm2cm2_weight(0), 
            dout16   => c4c4cm1cm5cm2c2cm5cm2c2c0cm2c0cm5c2cm8c2_weight(0), 
            dout17   => cm6cm2c1cm8c1cm2cm3cm5cm12c0c1c4cm1cm1cm3c0_weight(0), 
            dout18   => c3c6cm7cm7cm1cm5c2cm16c2cm4c20c0c7cm10c2c3_weight(0), 
            dout19   => cm3c10c6cm14cm1cm1c1c6cm1cm1cm7c12cm1c1c7c4_weight(0), 
            dout20   => c2c1cm7cm8c3cm2c2cm4c1cm6c7cm6cm3c0cm20c9_weight(0), 
            dout21   => c0c0cm4c0cm2c0c6cm2c0c2cm1c4c3cm1c2c4_weight(0), 
            dout22   => cm8cm2c1cm11c15cm3c0c47c7cm3c74cm10c7c3cm2cm24_weight(0), 
            dout23   => c5c0cm3cm7c8c10cm1c4cm8cm7c2c5cm1cm6cm14c3_weight(0), 
            dout24   => cm7c4cm4cm2c1c1cm2cm1c3cm5cm7cm1cm1cm17cm17cm10_weight(0), 
            dout25   => c21cm5c3c4cm10cm6c0cm7cm12c0cm2c3cm6cm2cm11cm14_weight(0), 
            dout26   => c0cm5c0c2c1c2cm1c1c0cm4cm1c0cm3c2cm1cm1_weight(0), 
            dout27   => cm4cm5cm4c1c2c4cm1cm1c2c1c2c0cm5cm16cm21c4_weight(0), 
            dout28   => cm10cm2cm13c2c1cm2cm1c1c0cm3cm2c1cm20cm5c1cm3_weight(0), 
            dout29   => c5cm11cm11cm1c7cm1c8c4c0c4c3c5c0cm16c21c26_weight(0), 
            dout30   => cm15c6c3c19c5cm2cm7cm67c7c11c3cm8c20c0cm6c14_weight(0), 
            dout31   => c0cm2cm7c2cm2cm4cm20cm5c7c2cm16cm2cm7c9c4cm6_weight(0), 
            dout32   => c0cm8c5c3c0c0cm4c0c1c5c2c5c1cm28c3c0_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_c16c5c19c1cm7cm5cm23c0c9cm2cm2cm3cm7c6c3c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c16c5c19c1cm7cm5cm23c0c9cm2cm2cm3cm7c6c3c0_weight(0), c16c5c19c1cm7cm5cm23c0c9cm2cm2cm3cm7c6c3c0_weight(1));
    PL_STEP_0_for_cm49cm2cm1c4c0c8cm3cm5cm20c0cm1c2c2c26cm7cm12_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm49cm2cm1c4c0c8cm3cm5cm20c0cm1c2c2c26cm7cm12_weight(0), cm49cm2cm1c4c0c8cm3cm5cm20c0cm1c2c2c26cm7cm12_weight(1));
    PL_STEP_0_for_c1c43c6c2c5cm45c1c0cm2cm19c5c0c3cm5c0cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c43c6c2c5cm45c1c0cm2cm19c5c0c3cm5c0cm2_weight(0), c1c43c6c2c5cm45c1c0cm2cm19c5c0c3cm5c0cm2_weight(1));
    PL_STEP_0_for_c0cm5c1c0c7c7cm1c1cm1cm6c1c6c0cm4c0cm23_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm5c1c0c7c7cm1c1cm1cm6c1c6c0cm4c0cm23_weight(0), c0cm5c1c0c7c7cm1c1cm1cm6c1c6c0cm4c0cm23_weight(1));
    PL_STEP_0_for_cm5c2c1c2cm5c0cm1cm3cm23c1cm3c0c9c2c7c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5c2c1c2cm5c0cm1cm3cm23c1cm3c0c9c2c7c0_weight(0), cm5c2c1c2cm5c0cm1cm3cm23c1cm3c0c9c2c7c0_weight(1));
    PL_STEP_0_for_c3cm11c0cm4cm7c8cm1c9c127c3c0c5cm2c34c2cm12_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3cm11c0cm4cm7c8cm1c9c127c3c0c5cm2c34c2cm12_weight(0), c3cm11c0cm4cm7c8cm1c9c127c3c0c5cm2c34c2cm12_weight(1));
    PL_STEP_0_for_c1cm8c0cm2c1c1c5cm3c0c23c1c0c6c1c8c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm8c0cm2c1c1c5cm3c0c23c1c0c6c1c8c1_weight(0), c1cm8c0cm2c1c1c5cm3c0c23c1c0c6c1c8c1_weight(1));
    PL_STEP_0_for_c3c13cm1cm8cm5cm8c8cm2c0cm5c3c4c5cm6cm12cm8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c13cm1cm8cm5cm8c8cm2c0cm5c3c4c5cm6cm12cm8_weight(0), c3c13cm1cm8cm5cm8c8cm2c0cm5c3c4c5cm6cm12cm8_weight(1));
    PL_STEP_0_for_cm2c3c15cm2c4cm3cm10c6cm2c2c2c6cm7cm3cm12c12_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c3c15cm2c4cm3cm10c6cm2c2c2c6cm7cm3cm12c12_weight(0), cm2c3c15cm2c4cm3cm10c6cm2c2c2c6cm7cm3cm12c12_weight(1));
    PL_STEP_0_for_cm17cm7c3cm1c7c4cm24cm2cm3c2cm2c3c1c8cm20c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm17cm7c3cm1c7c4cm24cm2cm3c2cm2c3c1c8cm20c1_weight(0), cm17cm7c3cm1c7c4cm24cm2cm3c2cm2c3c1c8cm20c1_weight(1));
    PL_STEP_0_for_c1cm4c1c0cm1cm13c11c2c4cm3cm6c2cm1cm9cm9c7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm4c1c0cm1cm13c11c2c4cm3cm6c2cm1cm9cm9c7_weight(0), c1cm4c1c0cm1cm13c11c2c4cm3cm6c2cm1cm9cm9c7_weight(1));
    PL_STEP_0_for_c0c6cm1c52cm7c1cm2c6cm13c1cm4cm3cm13cm11c1c6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c6cm1c52cm7c1cm2c6cm13c1cm4cm3cm13cm11c1c6_weight(0), c0c6cm1c52cm7c1cm2c6cm13c1cm4cm3cm13cm11c1c6_weight(1));
    PL_STEP_0_for_c2c3c6c0c2cm1cm2c0cm11c6c11c1cm1cm6c20c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c3c6c0c2cm1cm2c0cm11c6c11c1cm1cm6c20c2_weight(0), c2c3c6c0c2cm1cm2c0cm11c6c11c1cm1cm6c20c2_weight(1));
    PL_STEP_0_for_c3c0c8cm3c4c1cm5cm2c0c0cm3c0c0c0c1c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c0c8cm3c4c1cm5cm2c0c0cm3c0c0c0c1c0_weight(0), c3c0c8cm3c4c1cm5cm2c0c0cm3c0c0c0c1c0_weight(1));
    PL_STEP_0_for_cm1c3cm7cm26cm1cm4c9cm3c2c5c2cm19c1c0cm2cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c3cm7cm26cm1cm4c9cm3c2c5c2cm19c1c0cm2cm2_weight(0), cm1c3cm7cm26cm1cm4c9cm3c2c5c2cm19c1c0cm2cm2_weight(1));
    PL_STEP_0_for_c4c4cm1cm5cm2c2cm5cm2c2c0cm2c0cm5c2cm8c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4c4cm1cm5cm2c2cm5cm2c2c0cm2c0cm5c2cm8c2_weight(0), c4c4cm1cm5cm2c2cm5cm2c2c0cm2c0cm5c2cm8c2_weight(1));
    PL_STEP_0_for_cm6cm2c1cm8c1cm2cm3cm5cm12c0c1c4cm1cm1cm3c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm6cm2c1cm8c1cm2cm3cm5cm12c0c1c4cm1cm1cm3c0_weight(0), cm6cm2c1cm8c1cm2cm3cm5cm12c0c1c4cm1cm1cm3c0_weight(1));
    PL_STEP_0_for_c3c6cm7cm7cm1cm5c2cm16c2cm4c20c0c7cm10c2c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c6cm7cm7cm1cm5c2cm16c2cm4c20c0c7cm10c2c3_weight(0), c3c6cm7cm7cm1cm5c2cm16c2cm4c20c0c7cm10c2c3_weight(1));
    PL_STEP_0_for_cm3c10c6cm14cm1cm1c1c6cm1cm1cm7c12cm1c1c7c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3c10c6cm14cm1cm1c1c6cm1cm1cm7c12cm1c1c7c4_weight(0), cm3c10c6cm14cm1cm1c1c6cm1cm1cm7c12cm1c1c7c4_weight(1));
    PL_STEP_0_for_c2c1cm7cm8c3cm2c2cm4c1cm6c7cm6cm3c0cm20c9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c1cm7cm8c3cm2c2cm4c1cm6c7cm6cm3c0cm20c9_weight(0), c2c1cm7cm8c3cm2c2cm4c1cm6c7cm6cm3c0cm20c9_weight(1));
    PL_STEP_0_for_c0c0cm4c0cm2c0c6cm2c0c2cm1c4c3cm1c2c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0cm4c0cm2c0c6cm2c0c2cm1c4c3cm1c2c4_weight(0), c0c0cm4c0cm2c0c6cm2c0c2cm1c4c3cm1c2c4_weight(1));
    PL_STEP_0_for_cm8cm2c1cm11c15cm3c0c47c7cm3c74cm10c7c3cm2cm24_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm8cm2c1cm11c15cm3c0c47c7cm3c74cm10c7c3cm2cm24_weight(0), cm8cm2c1cm11c15cm3c0c47c7cm3c74cm10c7c3cm2cm24_weight(1));
    PL_STEP_0_for_c5c0cm3cm7c8c10cm1c4cm8cm7c2c5cm1cm6cm14c3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5c0cm3cm7c8c10cm1c4cm8cm7c2c5cm1cm6cm14c3_weight(0), c5c0cm3cm7c8c10cm1c4cm8cm7c2c5cm1cm6cm14c3_weight(1));
    PL_STEP_0_for_cm7c4cm4cm2c1c1cm2cm1c3cm5cm7cm1cm1cm17cm17cm10_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm7c4cm4cm2c1c1cm2cm1c3cm5cm7cm1cm1cm17cm17cm10_weight(0), cm7c4cm4cm2c1c1cm2cm1c3cm5cm7cm1cm1cm17cm17cm10_weight(1));
    PL_STEP_0_for_c21cm5c3c4cm10cm6c0cm7cm12c0cm2c3cm6cm2cm11cm14_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c21cm5c3c4cm10cm6c0cm7cm12c0cm2c3cm6cm2cm11cm14_weight(0), c21cm5c3c4cm10cm6c0cm7cm12c0cm2c3cm6cm2cm11cm14_weight(1));
    PL_STEP_0_for_c0cm5c0c2c1c2cm1c1c0cm4cm1c0cm3c2cm1cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm5c0c2c1c2cm1c1c0cm4cm1c0cm3c2cm1cm1_weight(0), c0cm5c0c2c1c2cm1c1c0cm4cm1c0cm3c2cm1cm1_weight(1));
    PL_STEP_0_for_cm4cm5cm4c1c2c4cm1cm1c2c1c2c0cm5cm16cm21c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4cm5cm4c1c2c4cm1cm1c2c1c2c0cm5cm16cm21c4_weight(0), cm4cm5cm4c1c2c4cm1cm1c2c1c2c0cm5cm16cm21c4_weight(1));
    PL_STEP_0_for_cm10cm2cm13c2c1cm2cm1c1c0cm3cm2c1cm20cm5c1cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm10cm2cm13c2c1cm2cm1c1c0cm3cm2c1cm20cm5c1cm3_weight(0), cm10cm2cm13c2c1cm2cm1c1c0cm3cm2c1cm20cm5c1cm3_weight(1));
    PL_STEP_0_for_c5cm11cm11cm1c7cm1c8c4c0c4c3c5c0cm16c21c26_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5cm11cm11cm1c7cm1c8c4c0c4c3c5c0cm16c21c26_weight(0), c5cm11cm11cm1c7cm1c8c4c0c4c3c5c0cm16c21c26_weight(1));
    PL_STEP_0_for_cm15c6c3c19c5cm2cm7cm67c7c11c3cm8c20c0cm6c14_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm15c6c3c19c5cm2cm7cm67c7c11c3cm8c20c0cm6c14_weight(0), cm15c6c3c19c5cm2cm7cm67c7c11c3cm8c20c0cm6c14_weight(1));
    PL_STEP_0_for_c0cm2cm7c2cm2cm4cm20cm5c7c2cm16cm2cm7c9c4cm6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm2cm7c2cm2cm4cm20cm5c7c2cm16cm2cm7c9c4cm6_weight(0), c0cm2cm7c2cm2cm4cm20cm5c7c2cm16cm2cm7c9c4cm6_weight(1));
    PL_STEP_0_for_c0cm8c5c3c0c0cm4c0c1c5c2c5c1cm28c3c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0cm8c5c3c0c0cm4c0c1c5c2c5c1cm28c3c0_weight(0), c0cm8c5c3c0c0cm4c0c1c5c2c5c1cm28c3c0_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    c3cm11c0cm4cm7c8cm1c9c127c3c0c5cm2c34c2cm12_c0cm5c0c2c1c2cm1c1c0cm4cm1c0cm3c2cm1cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c3cm11c0cm4cm7c8cm1c9c127c3c0c5cm2c34c2cm12_weight(1)(8-1 downto 0),
			B	=> c0cm5c0c2c1c2cm1c1c0cm4cm1c0cm3c2cm1cm1_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c3cm11c0cm4cm7c8cm1c9c127c3c0c5cm2c34c2cm12,
			CxB => R_c0cm5c0c2c1c2cm1c1c0cm4cm1c0cm3c2cm1cm1
		);

    cm8cm2c1cm11c15cm3c0c47c7cm3c74cm10c7c3cm2cm24_c0c0cm4c0cm2c0c6cm2c0c2cm1c4c3cm1c2c4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm8cm2c1cm11c15cm3c0c47c7cm3c74cm10c7c3cm2cm24_weight(1)(8-1 downto 0),
			B	=> c0c0cm4c0cm2c0c6cm2c0c2cm1c4c3cm1c2c4_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm8cm2c1cm11c15cm3c0c47c7cm3c74cm10c7c3cm2cm24,
			CxB => R_c0c0cm4c0cm2c0c6cm2c0c2cm1c4c3cm1c2c4
		);

    cm15c6c3c19c5cm2cm7cm67c7c11c3cm8c20c0cm6c14_c4c4cm1cm5cm2c2cm5cm2c2c0cm2c0cm5c2cm8c2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm15c6c3c19c5cm2cm7cm67c7c11c3cm8c20c0cm6c14_weight(1)(8-1 downto 0),
			B	=> c4c4cm1cm5cm2c2cm5cm2c2c0cm2c0cm5c2cm8c2_weight(1)(4-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm15c6c3c19c5cm2cm7cm67c7c11c3cm8c20c0cm6c14,
			CxB => R_c4c4cm1cm5cm2c2cm5cm2c2c0cm2c0cm5c2cm8c2
		);

    cm49cm2cm1c4c0c8cm3cm5cm20c0cm1c2c2c26cm7cm12_c5c0cm3cm7c8c10cm1c4cm8cm7c2c5cm1cm6cm14c3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm49cm2cm1c4c0c8cm3cm5cm20c0cm1c2c2c26cm7cm12_weight(1)(7-1 downto 0),
			B	=> c5c0cm3cm7c8c10cm1c4cm8cm7c2c5cm1cm6cm14c3_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm49cm2cm1c4c0c8cm3cm5cm20c0cm1c2c2c26cm7cm12,
			CxB => R_c5c0cm3cm7c8c10cm1c4cm8cm7c2c5cm1cm6cm14c3
		);

    c1c43c6c2c5cm45c1c0cm2cm19c5c0c3cm5c0cm2_cm3c10c6cm14cm1cm1c1c6cm1cm1cm7c12cm1c1c7c4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c1c43c6c2c5cm45c1c0cm2cm19c5c0c3cm5c0cm2_weight(1)(7-1 downto 0),
			B	=> cm3c10c6cm14cm1cm1c1c6cm1cm1cm7c12cm1c1c7c4_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1c43c6c2c5cm45c1c0cm2cm19c5c0c3cm5c0cm2,
			CxB => R_cm3c10c6cm14cm1cm1c1c6cm1cm1cm7c12cm1c1c7c4
		);

    c0c6cm1c52cm7c1cm2c6cm13c1cm4cm3cm13cm11c1c6_cm6cm2c1cm8c1cm2cm3cm5cm12c0c1c4cm1cm1cm3c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0c6cm1c52cm7c1cm2c6cm13c1cm4cm3cm13cm11c1c6_weight(1)(7-1 downto 0),
			B	=> cm6cm2c1cm8c1cm2cm3cm5cm12c0c1c4cm1cm1cm3c0_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c6cm1c52cm7c1cm2c6cm13c1cm4cm3cm13cm11c1c6,
			CxB => R_cm6cm2c1cm8c1cm2cm3cm5cm12c0c1c4cm1cm1cm3c0
		);

    c16c5c19c1cm7cm5cm23c0c9cm2cm2cm3cm7c6c3c0_c3c0c8cm3c4c1cm5cm2c0c0cm3c0c0c0c1c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c16c5c19c1cm7cm5cm23c0c9cm2cm2cm3cm7c6c3c0_weight(1)(6-1 downto 0),
			B	=> c3c0c8cm3c4c1cm5cm2c0c0cm3c0c0c0c1c0_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c16c5c19c1cm7cm5cm23c0c9cm2cm2cm3cm7c6c3c0,
			CxB => R_c3c0c8cm3c4c1cm5cm2c0c0cm3c0c0c0c1c0
		);

    c0cm5c1c0c7c7cm1c1cm1cm6c1c6c0cm4c0cm23_c1cm4c1c0cm1cm13c11c2c4cm3cm6c2cm1cm9cm9c7_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0cm5c1c0c7c7cm1c1cm1cm6c1c6c0cm4c0cm23_weight(1)(6-1 downto 0),
			B	=> c1cm4c1c0cm1cm13c11c2c4cm3cm6c2cm1cm9cm9c7_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0cm5c1c0c7c7cm1c1cm1cm6c1c6c0cm4c0cm23,
			CxB => R_c1cm4c1c0cm1cm13c11c2c4cm3cm6c2cm1cm9cm9c7
		);

    cm5c2c1c2cm5c0cm1cm3cm23c1cm3c0c9c2c7c0_cm2c3c15cm2c4cm3cm10c6cm2c2c2c6cm7cm3cm12c12_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm5c2c1c2cm5c0cm1cm3cm23c1cm3c0c9c2c7c0_weight(1)(6-1 downto 0),
			B	=> cm2c3c15cm2c4cm3cm10c6cm2c2c2c6cm7cm3cm12c12_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm5c2c1c2cm5c0cm1cm3cm23c1cm3c0c9c2c7c0,
			CxB => R_cm2c3c15cm2c4cm3cm10c6cm2c2c2c6cm7cm3cm12c12
		);

    c1cm8c0cm2c1c1c5cm3c0c23c1c0c6c1c8c1_c3c13cm1cm8cm5cm8c8cm2c0cm5c3c4c5cm6cm12cm8_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c1cm8c0cm2c1c1c5cm3c0c23c1c0c6c1c8c1_weight(1)(6-1 downto 0),
			B	=> c3c13cm1cm8cm5cm8c8cm2c0cm5c3c4c5cm6cm12cm8_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1cm8c0cm2c1c1c5cm3c0c23c1c0c6c1c8c1,
			CxB => R_c3c13cm1cm8cm5cm8c8cm2c0cm5c3c4c5cm6cm12cm8
		);

    cm17cm7c3cm1c7c4cm24cm2cm3c2cm2c3c1c8cm20c1_c0cm8c5c3c0c0cm4c0c1c5c2c5c1cm28c3c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm17cm7c3cm1c7c4cm24cm2cm3c2cm2c3c1c8cm20c1_weight(1)(6-1 downto 0),
			B	=> c0cm8c5c3c0c0cm4c0c1c5c2c5c1cm28c3c0_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm17cm7c3cm1c7c4cm24cm2cm3c2cm2c3c1c8cm20c1,
			CxB => R_c0cm8c5c3c0c0cm4c0c1c5c2c5c1cm28c3c0
		);

    c2c3c6c0c2cm1cm2c0cm11c6c11c1cm1cm6c20c2_c0cm2cm7c2cm2cm4cm20cm5c7c2cm16cm2cm7c9c4cm6_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c2c3c6c0c2cm1cm2c0cm11c6c11c1cm1cm6c20c2_weight(1)(6-1 downto 0),
			B	=> c0cm2cm7c2cm2cm4cm20cm5c7c2cm16cm2cm7c9c4cm6_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c2c3c6c0c2cm1cm2c0cm11c6c11c1cm1cm6c20c2,
			CxB => R_c0cm2cm7c2cm2cm4cm20cm5c7c2cm16cm2cm7c9c4cm6
		);

    cm1c3cm7cm26cm1cm4c9cm3c2c5c2cm19c1c0cm2cm2_c5cm11cm11cm1c7cm1c8c4c0c4c3c5c0cm16c21c26_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm1c3cm7cm26cm1cm4c9cm3c2c5c2cm19c1c0cm2cm2_weight(1)(6-1 downto 0),
			B	=> c5cm11cm11cm1c7cm1c8c4c0c4c3c5c0cm16c21c26_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1c3cm7cm26cm1cm4c9cm3c2c5c2cm19c1c0cm2cm2,
			CxB => R_c5cm11cm11cm1c7cm1c8c4c0c4c3c5c0cm16c21c26
		);

    c3c6cm7cm7cm1cm5c2cm16c2cm4c20c0c7cm10c2c3_cm10cm2cm13c2c1cm2cm1c1c0cm3cm2c1cm20cm5c1cm3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c3c6cm7cm7cm1cm5c2cm16c2cm4c20c0c7cm10c2c3_weight(1)(6-1 downto 0),
			B	=> cm10cm2cm13c2c1cm2cm1c1c0cm3cm2c1cm20cm5c1cm3_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c3c6cm7cm7cm1cm5c2cm16c2cm4c20c0c7cm10c2c3,
			CxB => R_cm10cm2cm13c2c1cm2cm1c1c0cm3cm2c1cm20cm5c1cm3
		);

    c2c1cm7cm8c3cm2c2cm4c1cm6c7cm6cm3c0cm20c9_cm4cm5cm4c1c2c4cm1cm1c2c1c2c0cm5cm16cm21c4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c2c1cm7cm8c3cm2c2cm4c1cm6c7cm6cm3c0cm20c9_weight(1)(6-1 downto 0),
			B	=> cm4cm5cm4c1c2c4cm1cm1c2c1c2c0cm5cm16cm21c4_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c2c1cm7cm8c3cm2c2cm4c1cm6c7cm6cm3c0cm20c9,
			CxB => R_cm4cm5cm4c1c2c4cm1cm1c2c1c2c0cm5cm16cm21c4
		);

    cm7c4cm4cm2c1c1cm2cm1c3cm5cm7cm1cm1cm17cm17cm10_c21cm5c3c4cm10cm6c0cm7cm12c0cm2c3cm6cm2cm11cm14_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm7c4cm4cm2c1c1cm2cm1c3cm5cm7cm1cm1cm17cm17cm10_weight(1)(6-1 downto 0),
			B	=> c21cm5c3c4cm10cm6c0cm7cm12c0cm2c3cm6cm2cm11cm14_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm7c4cm4cm2c1c1cm2cm1c3cm5cm7cm1cm1cm17cm17cm10,
			CxB => R_c21cm5c3c4cm10cm6c0cm7cm12c0cm2c3cm6cm2cm11cm14
		);




end architecture;
