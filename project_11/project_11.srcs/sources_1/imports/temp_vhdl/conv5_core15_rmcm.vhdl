library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv5_core15_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(5, -2)
        R_cm1cm13c40c0c7c4c17c0cm2c1cm2cm1c9cm4cm2c2 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c5cm4c1c2c22c11cm2c0cm11c1c8cm11cm7c1c1cm1 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c0c29c6cm1c0cm5cm6cm1c42cm2c4c11cm1cm3c7c0 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm4c18c0c2cm13cm3c0cm4c3cm4cm7cm3cm4c9c3c0 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm1c1cm5c1cm10c0cm3cm3cm6cm1c2c4c6c0cm2cm2 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c3cm11cm1c4c2cm8c2cm64c0cm3c6cm5c29c7cm1cm6 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm1cm3cm2c9c1cm7c10c1c15cm5c6c1c3cm10cm1c1 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c0c6c5c8c1c4cm1c10cm11c0cm18cm78c2cm3c2c2 : out std_logic_vector(15-1 downto 0);   --	sfix(7, -8)
        R_c2cm4c1c6cm9cm2c8c3cm5cm7c4cm2cm5cm2c1c1 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm17cm1c26c0c0c0cm4c0cm3c6cm1cm8c1c4c8cm1 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm2c21c28cm4c1cm30cm4c9c2c2c8cm2cm2cm6c5cm2 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm3c6c2c36c26cm5cm8c5c1c8c2c4c8c0c5c1 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c3c1c13c0c0c11c8c1cm1c2c3c15cm25c6c7c1 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c5c0c3c1c7cm1cm7cm2c4c0c0cm9cm5cm1cm11cm2 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm2c3cm23cm5c1cm16c26c25cm30cm2c1c0c2c11c6cm4 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c4c1cm1cm3cm9c2c2cm9cm1c22c7cm2c8c0c1c4 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c6cm2c1cm9cm3cm1cm3c16c0c8cm3cm4c4cm4c0cm15 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm14c0cm1c3cm4cm7cm1cm1c6c2c0cm40cm10cm8cm18c11 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm4cm10c2c0c3c10cm9cm3c16cm1c4c0c0c13cm11cm17 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm1c2c3cm47c4cm4c1c2c10c0c2c3cm8c2c3c2 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c0c0cm1c0c1cm1c9c3c10cm1cm26c47c0c0cm9c0 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c1cm7c7cm1c5c7c3cm18cm1cm13c1cm9cm2c2cm7cm35 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_c7c3cm3cm7c3c0c5c15c13c5c2c1c0cm5c1cm5 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_cm3c1c9c3c1cm10cm22cm3cm3c0c3cm3cm8cm4cm4cm7 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c6c3c20c8cm1c3cm6cm3cm2cm9cm1cm10cm1cm6c4cm9 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c1c1cm1cm2c0c0c0cm2c3c1c0c17c0c5c2cm3 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c3c4c5c5c4cm13cm8cm4c13cm7c1c0c2c2cm4c4 : out std_logic_vector(12-1 downto 0);   --	sfix(4, -8)
        R_c0c4cm4c4cm4cm16c1cm2cm14c1c0cm38cm9cm1c0cm3 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm24c12cm1cm12c0cm8cm4cm7c7c1c2cm3c3cm4c1c2 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm28c1cm1cm45cm4c2c10cm10c6c2cm2cm3c4cm9c8cm1 : out std_logic_vector(14-1 downto 0);   --	sfix(6, -8)
        R_cm1c0c6cm2cm3c3cm1cm3c31cm4c6cm6cm2c3c6cm6 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_cm1cm1c0c2cm1cm6cm19c1cm1cm1c26c0c0cm6cm5cm3 : out std_logic_vector(13-1 downto 0);   --	sfix(5, -8)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(9-1 downto 0)  --	sfix(1, -8)
    );
end conv5_core15_rmcm;

architecture arch of conv5_core15_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM13C40C0C7C4C17C0CM2C1CM2CM1C9CM4CM2C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5CM4C1C2C22C11CM2C0CM11C1C8CM11CM7C1C1CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C29C6CM1C0CM5CM6CM1C42CM2C4C11CM1CM3C7C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4C18C0C2CM13CM3C0CM4C3CM4CM7CM3CM4C9C3C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C1CM5C1CM10C0CM3CM3CM6CM1C2C4C6C0CM2CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3CM11CM1C4C2CM8C2CM64C0CM3C6CM5C29C7CM1CM6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM3CM2C9C1CM7C10C1C15CM5C6C1C3CM10CM1C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C6C5C8C1C4CM1C10CM11C0CM18CM78C2CM3C2C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2CM4C1C6CM9CM2C8C3CM5CM7C4CM2CM5CM2C1C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM17CM1C26C0C0C0CM4C0CM3C6CM1CM8C1C4C8CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C21C28CM4C1CM30CM4C9C2C2C8CM2CM2CM6C5CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3C6C2C36C26CM5CM8C5C1C8C2C4C8C0C5C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C1C13C0C0C11C8C1CM1C2C3C15CM25C6C7C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5C0C3C1C7CM1CM7CM2C4C0C0CM9CM5CM1CM11CM2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2C3CM23CM5C1CM16C26C25CM30CM2C1C0C2C11C6CM4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C4C1CM1CM3CM9C2C2CM9CM1C22C7CM2C8C0C1C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6CM2C1CM9CM3CM1CM3C16C0C8CM3CM4C4CM4C0CM15_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM14C0CM1C3CM4CM7CM1CM1C6C2C0CM40CM10CM8CM18C11_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM4CM10C2C0C3C10CM9CM3C16CM1C4C0C0C13CM11CM17_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C2C3CM47C4CM4C1C2C10C0C2C3CM8C2C3C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0CM1C0C1CM1C9C3C10CM1CM26C47C0C0CM9C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM7C7CM1C5C7C3CM18CM1CM13C1CM9CM2C2CM7CM35_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C7C3CM3CM7C3C0C5C15C13C5C2C1C0CM5C1CM5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3C1C9C3C1CM10CM22CM3CM3C0C3CM3CM8CM4CM4CM7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6C3C20C8CM1C3CM6CM3CM2CM9CM1CM10CM1CM6C4CM9_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C1CM1CM2C0C0C0CM2C3C1C0C17C0C5C2CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C4C5C5C4CM13CM8CM4C13CM7C1C0C2C2CM4C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C4CM4C4CM4CM16C1CM2CM14C1C0CM38CM9CM1C0CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM24C12CM1CM12C0CM8CM4CM7C7C1C2CM3C3CM4C1C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM28C1CM1CM45CM4C2C10CM10C6C2CM2CM3C4CM9C8CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1C0C6CM2CM3C3CM1CM3C31CM4C6CM6CM2C3C6CM6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM1C0C2CM1CM6CM19C1CM1CM1C26C0C0CM6CM5CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(5, -2)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(2, -6)
    signal cm1cm13c40c0c7c4c17c0cm2c1cm2cm1c9cm4cm2c2_weight : PIPELINE_TYPE_FOR_CM1CM13C40C0C7C4C17C0CM2C1CM2CM1C9CM4CM2C2_WEIGHT;
    -- sfix(2, -6)
    signal c5cm4c1c2c22c11cm2c0cm11c1c8cm11cm7c1c1cm1_weight : PIPELINE_TYPE_FOR_C5CM4C1C2C22C11CM2C0CM11C1C8CM11CM7C1C1CM1_WEIGHT;
    -- sfix(2, -6)
    signal c0c29c6cm1c0cm5cm6cm1c42cm2c4c11cm1cm3c7c0_weight : PIPELINE_TYPE_FOR_C0C29C6CM1C0CM5CM6CM1C42CM2C4C11CM1CM3C7C0_WEIGHT;
    -- sfix(2, -6)
    signal cm4c18c0c2cm13cm3c0cm4c3cm4cm7cm3cm4c9c3c0_weight : PIPELINE_TYPE_FOR_CM4C18C0C2CM13CM3C0CM4C3CM4CM7CM3CM4C9C3C0_WEIGHT;
    -- sfix(2, -6)
    signal cm1c1cm5c1cm10c0cm3cm3cm6cm1c2c4c6c0cm2cm2_weight : PIPELINE_TYPE_FOR_CM1C1CM5C1CM10C0CM3CM3CM6CM1C2C4C6C0CM2CM2_WEIGHT;
    -- sfix(2, -6)
    signal c3cm11cm1c4c2cm8c2cm64c0cm3c6cm5c29c7cm1cm6_weight : PIPELINE_TYPE_FOR_C3CM11CM1C4C2CM8C2CM64C0CM3C6CM5C29C7CM1CM6_WEIGHT;
    -- sfix(2, -6)
    signal cm1cm3cm2c9c1cm7c10c1c15cm5c6c1c3cm10cm1c1_weight : PIPELINE_TYPE_FOR_CM1CM3CM2C9C1CM7C10C1C15CM5C6C1C3CM10CM1C1_WEIGHT;
    -- sfix(2, -6)
    signal c0c6c5c8c1c4cm1c10cm11c0cm18cm78c2cm3c2c2_weight : PIPELINE_TYPE_FOR_C0C6C5C8C1C4CM1C10CM11C0CM18CM78C2CM3C2C2_WEIGHT;
    -- sfix(2, -6)
    signal c2cm4c1c6cm9cm2c8c3cm5cm7c4cm2cm5cm2c1c1_weight : PIPELINE_TYPE_FOR_C2CM4C1C6CM9CM2C8C3CM5CM7C4CM2CM5CM2C1C1_WEIGHT;
    -- sfix(2, -6)
    signal cm17cm1c26c0c0c0cm4c0cm3c6cm1cm8c1c4c8cm1_weight : PIPELINE_TYPE_FOR_CM17CM1C26C0C0C0CM4C0CM3C6CM1CM8C1C4C8CM1_WEIGHT;
    -- sfix(2, -6)
    signal cm2c21c28cm4c1cm30cm4c9c2c2c8cm2cm2cm6c5cm2_weight : PIPELINE_TYPE_FOR_CM2C21C28CM4C1CM30CM4C9C2C2C8CM2CM2CM6C5CM2_WEIGHT;
    -- sfix(2, -6)
    signal cm3c6c2c36c26cm5cm8c5c1c8c2c4c8c0c5c1_weight : PIPELINE_TYPE_FOR_CM3C6C2C36C26CM5CM8C5C1C8C2C4C8C0C5C1_WEIGHT;
    -- sfix(2, -6)
    signal c3c1c13c0c0c11c8c1cm1c2c3c15cm25c6c7c1_weight : PIPELINE_TYPE_FOR_C3C1C13C0C0C11C8C1CM1C2C3C15CM25C6C7C1_WEIGHT;
    -- sfix(2, -6)
    signal c5c0c3c1c7cm1cm7cm2c4c0c0cm9cm5cm1cm11cm2_weight : PIPELINE_TYPE_FOR_C5C0C3C1C7CM1CM7CM2C4C0C0CM9CM5CM1CM11CM2_WEIGHT;
    -- sfix(2, -6)
    signal cm2c3cm23cm5c1cm16c26c25cm30cm2c1c0c2c11c6cm4_weight : PIPELINE_TYPE_FOR_CM2C3CM23CM5C1CM16C26C25CM30CM2C1C0C2C11C6CM4_WEIGHT;
    -- sfix(2, -6)
    signal c4c1cm1cm3cm9c2c2cm9cm1c22c7cm2c8c0c1c4_weight : PIPELINE_TYPE_FOR_C4C1CM1CM3CM9C2C2CM9CM1C22C7CM2C8C0C1C4_WEIGHT;
    -- sfix(2, -6)
    signal c6cm2c1cm9cm3cm1cm3c16c0c8cm3cm4c4cm4c0cm15_weight : PIPELINE_TYPE_FOR_C6CM2C1CM9CM3CM1CM3C16C0C8CM3CM4C4CM4C0CM15_WEIGHT;
    -- sfix(2, -6)
    signal cm14c0cm1c3cm4cm7cm1cm1c6c2c0cm40cm10cm8cm18c11_weight : PIPELINE_TYPE_FOR_CM14C0CM1C3CM4CM7CM1CM1C6C2C0CM40CM10CM8CM18C11_WEIGHT;
    -- sfix(2, -6)
    signal cm4cm10c2c0c3c10cm9cm3c16cm1c4c0c0c13cm11cm17_weight : PIPELINE_TYPE_FOR_CM4CM10C2C0C3C10CM9CM3C16CM1C4C0C0C13CM11CM17_WEIGHT;
    -- sfix(2, -6)
    signal cm1c2c3cm47c4cm4c1c2c10c0c2c3cm8c2c3c2_weight : PIPELINE_TYPE_FOR_CM1C2C3CM47C4CM4C1C2C10C0C2C3CM8C2C3C2_WEIGHT;
    -- sfix(2, -6)
    signal c0c0cm1c0c1cm1c9c3c10cm1cm26c47c0c0cm9c0_weight : PIPELINE_TYPE_FOR_C0C0CM1C0C1CM1C9C3C10CM1CM26C47C0C0CM9C0_WEIGHT;
    -- sfix(2, -6)
    signal c1cm7c7cm1c5c7c3cm18cm1cm13c1cm9cm2c2cm7cm35_weight : PIPELINE_TYPE_FOR_C1CM7C7CM1C5C7C3CM18CM1CM13C1CM9CM2C2CM7CM35_WEIGHT;
    -- sfix(2, -6)
    signal c7c3cm3cm7c3c0c5c15c13c5c2c1c0cm5c1cm5_weight : PIPELINE_TYPE_FOR_C7C3CM3CM7C3C0C5C15C13C5C2C1C0CM5C1CM5_WEIGHT;
    -- sfix(2, -6)
    signal cm3c1c9c3c1cm10cm22cm3cm3c0c3cm3cm8cm4cm4cm7_weight : PIPELINE_TYPE_FOR_CM3C1C9C3C1CM10CM22CM3CM3C0C3CM3CM8CM4CM4CM7_WEIGHT;
    -- sfix(2, -6)
    signal c6c3c20c8cm1c3cm6cm3cm2cm9cm1cm10cm1cm6c4cm9_weight : PIPELINE_TYPE_FOR_C6C3C20C8CM1C3CM6CM3CM2CM9CM1CM10CM1CM6C4CM9_WEIGHT;
    -- sfix(2, -6)
    signal c1c1cm1cm2c0c0c0cm2c3c1c0c17c0c5c2cm3_weight : PIPELINE_TYPE_FOR_C1C1CM1CM2C0C0C0CM2C3C1C0C17C0C5C2CM3_WEIGHT;
    -- sfix(2, -6)
    signal c3c4c5c5c4cm13cm8cm4c13cm7c1c0c2c2cm4c4_weight : PIPELINE_TYPE_FOR_C3C4C5C5C4CM13CM8CM4C13CM7C1C0C2C2CM4C4_WEIGHT;
    -- sfix(2, -6)
    signal c0c4cm4c4cm4cm16c1cm2cm14c1c0cm38cm9cm1c0cm3_weight : PIPELINE_TYPE_FOR_C0C4CM4C4CM4CM16C1CM2CM14C1C0CM38CM9CM1C0CM3_WEIGHT;
    -- sfix(2, -6)
    signal cm24c12cm1cm12c0cm8cm4cm7c7c1c2cm3c3cm4c1c2_weight : PIPELINE_TYPE_FOR_CM24C12CM1CM12C0CM8CM4CM7C7C1C2CM3C3CM4C1C2_WEIGHT;
    -- sfix(2, -6)
    signal cm28c1cm1cm45cm4c2c10cm10c6c2cm2cm3c4cm9c8cm1_weight : PIPELINE_TYPE_FOR_CM28C1CM1CM45CM4C2C10CM10C6C2CM2CM3C4CM9C8CM1_WEIGHT;
    -- sfix(2, -6)
    signal cm1c0c6cm2cm3c3cm1cm3c31cm4c6cm6cm2c3c6cm6_weight : PIPELINE_TYPE_FOR_CM1C0C6CM2CM3C3CM1CM3C31CM4C6CM6CM2C3C6CM6_WEIGHT;
    -- sfix(2, -6)
    signal cm1cm1c0c2cm1cm6cm19c1cm1cm1c26c0c0cm6cm5cm3_weight : PIPELINE_TYPE_FOR_CM1CM1C0C2CM1CM6CM19C1CM1CM1C26C0C0CM6CM5CM3_WEIGHT;
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



    WEIGHT_ROM: entity work.conv5_core15_rmcm_weightsconstant_memory
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
        
            dout1   => cm1cm13c40c0c7c4c17c0cm2c1cm2cm1c9cm4cm2c2_weight(0), 
            dout2   => c5cm4c1c2c22c11cm2c0cm11c1c8cm11cm7c1c1cm1_weight(0), 
            dout3   => c0c29c6cm1c0cm5cm6cm1c42cm2c4c11cm1cm3c7c0_weight(0), 
            dout4   => cm4c18c0c2cm13cm3c0cm4c3cm4cm7cm3cm4c9c3c0_weight(0), 
            dout5   => cm1c1cm5c1cm10c0cm3cm3cm6cm1c2c4c6c0cm2cm2_weight(0), 
            dout6   => c3cm11cm1c4c2cm8c2cm64c0cm3c6cm5c29c7cm1cm6_weight(0), 
            dout7   => cm1cm3cm2c9c1cm7c10c1c15cm5c6c1c3cm10cm1c1_weight(0), 
            dout8   => c0c6c5c8c1c4cm1c10cm11c0cm18cm78c2cm3c2c2_weight(0), 
            dout9   => c2cm4c1c6cm9cm2c8c3cm5cm7c4cm2cm5cm2c1c1_weight(0), 
            dout10   => cm17cm1c26c0c0c0cm4c0cm3c6cm1cm8c1c4c8cm1_weight(0), 
            dout11   => cm2c21c28cm4c1cm30cm4c9c2c2c8cm2cm2cm6c5cm2_weight(0), 
            dout12   => cm3c6c2c36c26cm5cm8c5c1c8c2c4c8c0c5c1_weight(0), 
            dout13   => c3c1c13c0c0c11c8c1cm1c2c3c15cm25c6c7c1_weight(0), 
            dout14   => c5c0c3c1c7cm1cm7cm2c4c0c0cm9cm5cm1cm11cm2_weight(0), 
            dout15   => cm2c3cm23cm5c1cm16c26c25cm30cm2c1c0c2c11c6cm4_weight(0), 
            dout16   => c4c1cm1cm3cm9c2c2cm9cm1c22c7cm2c8c0c1c4_weight(0), 
            dout17   => c6cm2c1cm9cm3cm1cm3c16c0c8cm3cm4c4cm4c0cm15_weight(0), 
            dout18   => cm14c0cm1c3cm4cm7cm1cm1c6c2c0cm40cm10cm8cm18c11_weight(0), 
            dout19   => cm4cm10c2c0c3c10cm9cm3c16cm1c4c0c0c13cm11cm17_weight(0), 
            dout20   => cm1c2c3cm47c4cm4c1c2c10c0c2c3cm8c2c3c2_weight(0), 
            dout21   => c0c0cm1c0c1cm1c9c3c10cm1cm26c47c0c0cm9c0_weight(0), 
            dout22   => c1cm7c7cm1c5c7c3cm18cm1cm13c1cm9cm2c2cm7cm35_weight(0), 
            dout23   => c7c3cm3cm7c3c0c5c15c13c5c2c1c0cm5c1cm5_weight(0), 
            dout24   => cm3c1c9c3c1cm10cm22cm3cm3c0c3cm3cm8cm4cm4cm7_weight(0), 
            dout25   => c6c3c20c8cm1c3cm6cm3cm2cm9cm1cm10cm1cm6c4cm9_weight(0), 
            dout26   => c1c1cm1cm2c0c0c0cm2c3c1c0c17c0c5c2cm3_weight(0), 
            dout27   => c3c4c5c5c4cm13cm8cm4c13cm7c1c0c2c2cm4c4_weight(0), 
            dout28   => c0c4cm4c4cm4cm16c1cm2cm14c1c0cm38cm9cm1c0cm3_weight(0), 
            dout29   => cm24c12cm1cm12c0cm8cm4cm7c7c1c2cm3c3cm4c1c2_weight(0), 
            dout30   => cm28c1cm1cm45cm4c2c10cm10c6c2cm2cm3c4cm9c8cm1_weight(0), 
            dout31   => cm1c0c6cm2cm3c3cm1cm3c31cm4c6cm6cm2c3c6cm6_weight(0), 
            dout32   => cm1cm1c0c2cm1cm6cm19c1cm1cm1c26c0c0cm6cm5cm3_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_cm1cm13c40c0c7c4c17c0cm2c1cm2cm1c9cm4cm2c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm13c40c0c7c4c17c0cm2c1cm2cm1c9cm4cm2c2_weight(0), cm1cm13c40c0c7c4c17c0cm2c1cm2cm1c9cm4cm2c2_weight(1));
    PL_STEP_0_for_c5cm4c1c2c22c11cm2c0cm11c1c8cm11cm7c1c1cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5cm4c1c2c22c11cm2c0cm11c1c8cm11cm7c1c1cm1_weight(0), c5cm4c1c2c22c11cm2c0cm11c1c8cm11cm7c1c1cm1_weight(1));
    PL_STEP_0_for_c0c29c6cm1c0cm5cm6cm1c42cm2c4c11cm1cm3c7c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c29c6cm1c0cm5cm6cm1c42cm2c4c11cm1cm3c7c0_weight(0), c0c29c6cm1c0cm5cm6cm1c42cm2c4c11cm1cm3c7c0_weight(1));
    PL_STEP_0_for_cm4c18c0c2cm13cm3c0cm4c3cm4cm7cm3cm4c9c3c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4c18c0c2cm13cm3c0cm4c3cm4cm7cm3cm4c9c3c0_weight(0), cm4c18c0c2cm13cm3c0cm4c3cm4cm7cm3cm4c9c3c0_weight(1));
    PL_STEP_0_for_cm1c1cm5c1cm10c0cm3cm3cm6cm1c2c4c6c0cm2cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c1cm5c1cm10c0cm3cm3cm6cm1c2c4c6c0cm2cm2_weight(0), cm1c1cm5c1cm10c0cm3cm3cm6cm1c2c4c6c0cm2cm2_weight(1));
    PL_STEP_0_for_c3cm11cm1c4c2cm8c2cm64c0cm3c6cm5c29c7cm1cm6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3cm11cm1c4c2cm8c2cm64c0cm3c6cm5c29c7cm1cm6_weight(0), c3cm11cm1c4c2cm8c2cm64c0cm3c6cm5c29c7cm1cm6_weight(1));
    PL_STEP_0_for_cm1cm3cm2c9c1cm7c10c1c15cm5c6c1c3cm10cm1c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm3cm2c9c1cm7c10c1c15cm5c6c1c3cm10cm1c1_weight(0), cm1cm3cm2c9c1cm7c10c1c15cm5c6c1c3cm10cm1c1_weight(1));
    PL_STEP_0_for_c0c6c5c8c1c4cm1c10cm11c0cm18cm78c2cm3c2c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c6c5c8c1c4cm1c10cm11c0cm18cm78c2cm3c2c2_weight(0), c0c6c5c8c1c4cm1c10cm11c0cm18cm78c2cm3c2c2_weight(1));
    PL_STEP_0_for_c2cm4c1c6cm9cm2c8c3cm5cm7c4cm2cm5cm2c1c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2cm4c1c6cm9cm2c8c3cm5cm7c4cm2cm5cm2c1c1_weight(0), c2cm4c1c6cm9cm2c8c3cm5cm7c4cm2cm5cm2c1c1_weight(1));
    PL_STEP_0_for_cm17cm1c26c0c0c0cm4c0cm3c6cm1cm8c1c4c8cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm17cm1c26c0c0c0cm4c0cm3c6cm1cm8c1c4c8cm1_weight(0), cm17cm1c26c0c0c0cm4c0cm3c6cm1cm8c1c4c8cm1_weight(1));
    PL_STEP_0_for_cm2c21c28cm4c1cm30cm4c9c2c2c8cm2cm2cm6c5cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c21c28cm4c1cm30cm4c9c2c2c8cm2cm2cm6c5cm2_weight(0), cm2c21c28cm4c1cm30cm4c9c2c2c8cm2cm2cm6c5cm2_weight(1));
    PL_STEP_0_for_cm3c6c2c36c26cm5cm8c5c1c8c2c4c8c0c5c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3c6c2c36c26cm5cm8c5c1c8c2c4c8c0c5c1_weight(0), cm3c6c2c36c26cm5cm8c5c1c8c2c4c8c0c5c1_weight(1));
    PL_STEP_0_for_c3c1c13c0c0c11c8c1cm1c2c3c15cm25c6c7c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c1c13c0c0c11c8c1cm1c2c3c15cm25c6c7c1_weight(0), c3c1c13c0c0c11c8c1cm1c2c3c15cm25c6c7c1_weight(1));
    PL_STEP_0_for_c5c0c3c1c7cm1cm7cm2c4c0c0cm9cm5cm1cm11cm2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5c0c3c1c7cm1cm7cm2c4c0c0cm9cm5cm1cm11cm2_weight(0), c5c0c3c1c7cm1cm7cm2c4c0c0cm9cm5cm1cm11cm2_weight(1));
    PL_STEP_0_for_cm2c3cm23cm5c1cm16c26c25cm30cm2c1c0c2c11c6cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2c3cm23cm5c1cm16c26c25cm30cm2c1c0c2c11c6cm4_weight(0), cm2c3cm23cm5c1cm16c26c25cm30cm2c1c0c2c11c6cm4_weight(1));
    PL_STEP_0_for_c4c1cm1cm3cm9c2c2cm9cm1c22c7cm2c8c0c1c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c4c1cm1cm3cm9c2c2cm9cm1c22c7cm2c8c0c1c4_weight(0), c4c1cm1cm3cm9c2c2cm9cm1c22c7cm2c8c0c1c4_weight(1));
    PL_STEP_0_for_c6cm2c1cm9cm3cm1cm3c16c0c8cm3cm4c4cm4c0cm15_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6cm2c1cm9cm3cm1cm3c16c0c8cm3cm4c4cm4c0cm15_weight(0), c6cm2c1cm9cm3cm1cm3c16c0c8cm3cm4c4cm4c0cm15_weight(1));
    PL_STEP_0_for_cm14c0cm1c3cm4cm7cm1cm1c6c2c0cm40cm10cm8cm18c11_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm14c0cm1c3cm4cm7cm1cm1c6c2c0cm40cm10cm8cm18c11_weight(0), cm14c0cm1c3cm4cm7cm1cm1c6c2c0cm40cm10cm8cm18c11_weight(1));
    PL_STEP_0_for_cm4cm10c2c0c3c10cm9cm3c16cm1c4c0c0c13cm11cm17_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm4cm10c2c0c3c10cm9cm3c16cm1c4c0c0c13cm11cm17_weight(0), cm4cm10c2c0c3c10cm9cm3c16cm1c4c0c0c13cm11cm17_weight(1));
    PL_STEP_0_for_cm1c2c3cm47c4cm4c1c2c10c0c2c3cm8c2c3c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c2c3cm47c4cm4c1c2c10c0c2c3cm8c2c3c2_weight(0), cm1c2c3cm47c4cm4c1c2c10c0c2c3cm8c2c3c2_weight(1));
    PL_STEP_0_for_c0c0cm1c0c1cm1c9c3c10cm1cm26c47c0c0cm9c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0cm1c0c1cm1c9c3c10cm1cm26c47c0c0cm9c0_weight(0), c0c0cm1c0c1cm1c9c3c10cm1cm26c47c0c0cm9c0_weight(1));
    PL_STEP_0_for_c1cm7c7cm1c5c7c3cm18cm1cm13c1cm9cm2c2cm7cm35_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm7c7cm1c5c7c3cm18cm1cm13c1cm9cm2c2cm7cm35_weight(0), c1cm7c7cm1c5c7c3cm18cm1cm13c1cm9cm2c2cm7cm35_weight(1));
    PL_STEP_0_for_c7c3cm3cm7c3c0c5c15c13c5c2c1c0cm5c1cm5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c7c3cm3cm7c3c0c5c15c13c5c2c1c0cm5c1cm5_weight(0), c7c3cm3cm7c3c0c5c15c13c5c2c1c0cm5c1cm5_weight(1));
    PL_STEP_0_for_cm3c1c9c3c1cm10cm22cm3cm3c0c3cm3cm8cm4cm4cm7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3c1c9c3c1cm10cm22cm3cm3c0c3cm3cm8cm4cm4cm7_weight(0), cm3c1c9c3c1cm10cm22cm3cm3c0c3cm3cm8cm4cm4cm7_weight(1));
    PL_STEP_0_for_c6c3c20c8cm1c3cm6cm3cm2cm9cm1cm10cm1cm6c4cm9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6c3c20c8cm1c3cm6cm3cm2cm9cm1cm10cm1cm6c4cm9_weight(0), c6c3c20c8cm1c3cm6cm3cm2cm9cm1cm10cm1cm6c4cm9_weight(1));
    PL_STEP_0_for_c1c1cm1cm2c0c0c0cm2c3c1c0c17c0c5c2cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c1cm1cm2c0c0c0cm2c3c1c0c17c0c5c2cm3_weight(0), c1c1cm1cm2c0c0c0cm2c3c1c0c17c0c5c2cm3_weight(1));
    PL_STEP_0_for_c3c4c5c5c4cm13cm8cm4c13cm7c1c0c2c2cm4c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c4c5c5c4cm13cm8cm4c13cm7c1c0c2c2cm4c4_weight(0), c3c4c5c5c4cm13cm8cm4c13cm7c1c0c2c2cm4c4_weight(1));
    PL_STEP_0_for_c0c4cm4c4cm4cm16c1cm2cm14c1c0cm38cm9cm1c0cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c4cm4c4cm4cm16c1cm2cm14c1c0cm38cm9cm1c0cm3_weight(0), c0c4cm4c4cm4cm16c1cm2cm14c1c0cm38cm9cm1c0cm3_weight(1));
    PL_STEP_0_for_cm24c12cm1cm12c0cm8cm4cm7c7c1c2cm3c3cm4c1c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm24c12cm1cm12c0cm8cm4cm7c7c1c2cm3c3cm4c1c2_weight(0), cm24c12cm1cm12c0cm8cm4cm7c7c1c2cm3c3cm4c1c2_weight(1));
    PL_STEP_0_for_cm28c1cm1cm45cm4c2c10cm10c6c2cm2cm3c4cm9c8cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm28c1cm1cm45cm4c2c10cm10c6c2cm2cm3c4cm9c8cm1_weight(0), cm28c1cm1cm45cm4c2c10cm10c6c2cm2cm3c4cm9c8cm1_weight(1));
    PL_STEP_0_for_cm1c0c6cm2cm3c3cm1cm3c31cm4c6cm6cm2c3c6cm6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1c0c6cm2cm3c3cm1cm3c31cm4c6cm6cm2c3c6cm6_weight(0), cm1c0c6cm2cm3c3cm1cm3c31cm4c6cm6cm2c3c6cm6_weight(1));
    PL_STEP_0_for_cm1cm1c0c2cm1cm6cm19c1cm1cm1c26c0c0cm6cm5cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm1c0c2cm1cm6cm19c1cm1cm1c26c0c0cm6cm5cm3_weight(0), cm1cm1c0c2cm1cm6cm19c1cm1cm1c26c0c0cm6cm5cm3_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    c0c6c5c8c1c4cm1c10cm11c0cm18cm78c2cm3c2c2_c3c4c5c5c4cm13cm8cm4c13cm7c1c0c2c2cm4c4_DUAL_MULT: entity work.DualMultDSP
	generic map
		(
			A_WIDTH => 8,
			B_WIDTH => 5,
			C_WIDTH => 7, --	ufix(5, -2)
            FRAC_TRUNCATION => 0,
            C_IS_SIGNED => False,
            DISABLE_PIPELINING => False
		)
	port map
		(
            clk => clk,
			A	=> c0c6c5c8c1c4cm1c10cm11c0cm18cm78c2cm3c2c2_weight(1)(8-1 downto 0),
			B	=> c3c4c5c5c4cm13cm8cm4c13cm7c1c0c2c2cm4c4_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c6c5c8c1c4cm1c10cm11c0cm18cm78c2cm3c2c2,
			CxB => R_c3c4c5c5c4cm13cm8cm4c13cm7c1c0c2c2cm4c4
		);

    cm1cm13c40c0c7c4c17c0cm2c1cm2cm1c9cm4cm2c2_c7c3cm3cm7c3c0c5c15c13c5c2c1c0cm5c1cm5_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm1cm13c40c0c7c4c17c0cm2c1cm2cm1c9cm4cm2c2_weight(1)(7-1 downto 0),
			B	=> c7c3cm3cm7c3c0c5c15c13c5c2c1c0cm5c1cm5_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1cm13c40c0c7c4c17c0cm2c1cm2cm1c9cm4cm2c2,
			CxB => R_c7c3cm3cm7c3c0c5c15c13c5c2c1c0cm5c1cm5
		);

    c0c29c6cm1c0cm5cm6cm1c42cm2c4c11cm1cm3c7c0_c5c0c3c1c7cm1cm7cm2c4c0c0cm9cm5cm1cm11cm2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0c29c6cm1c0cm5cm6cm1c42cm2c4c11cm1cm3c7c0_weight(1)(7-1 downto 0),
			B	=> c5c0c3c1c7cm1cm7cm2c4c0c0cm9cm5cm1cm11cm2_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c29c6cm1c0cm5cm6cm1c42cm2c4c11cm1cm3c7c0,
			CxB => R_c5c0c3c1c7cm1cm7cm2c4c0c0cm9cm5cm1cm11cm2
		);

    c3cm11cm1c4c2cm8c2cm64c0cm3c6cm5c29c7cm1cm6_c2cm4c1c6cm9cm2c8c3cm5cm7c4cm2cm5cm2c1c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c3cm11cm1c4c2cm8c2cm64c0cm3c6cm5c29c7cm1cm6_weight(1)(7-1 downto 0),
			B	=> c2cm4c1c6cm9cm2c8c3cm5cm7c4cm2cm5cm2c1c1_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c3cm11cm1c4c2cm8c2cm64c0cm3c6cm5c29c7cm1cm6,
			CxB => R_c2cm4c1c6cm9cm2c8c3cm5cm7c4cm2cm5cm2c1c1
		);

    cm3c6c2c36c26cm5cm8c5c1c8c2c4c8c0c5c1_cm1cm3cm2c9c1cm7c10c1c15cm5c6c1c3cm10cm1c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm3c6c2c36c26cm5cm8c5c1c8c2c4c8c0c5c1_weight(1)(7-1 downto 0),
			B	=> cm1cm3cm2c9c1cm7c10c1c15cm5c6c1c3cm10cm1c1_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm3c6c2c36c26cm5cm8c5c1c8c2c4c8c0c5c1,
			CxB => R_cm1cm3cm2c9c1cm7c10c1c15cm5c6c1c3cm10cm1c1
		);

    cm14c0cm1c3cm4cm7cm1cm1c6c2c0cm40cm10cm8cm18c11_cm1c1cm5c1cm10c0cm3cm3cm6cm1c2c4c6c0cm2cm2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm14c0cm1c3cm4cm7cm1cm1c6c2c0cm40cm10cm8cm18c11_weight(1)(7-1 downto 0),
			B	=> cm1c1cm5c1cm10c0cm3cm3cm6cm1c2c4c6c0cm2cm2_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm14c0cm1c3cm4cm7cm1cm1c6c2c0cm40cm10cm8cm18c11,
			CxB => R_cm1c1cm5c1cm10c0cm3cm3cm6cm1c2c4c6c0cm2cm2
		);

    cm1c2c3cm47c4cm4c1c2c10c0c2c3cm8c2c3c2_cm1cm1c0c2cm1cm6cm19c1cm1cm1c26c0c0cm6cm5cm3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm1c2c3cm47c4cm4c1c2c10c0c2c3cm8c2c3c2_weight(1)(7-1 downto 0),
			B	=> cm1cm1c0c2cm1cm6cm19c1cm1cm1c26c0c0cm6cm5cm3_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm1c2c3cm47c4cm4c1c2c10c0c2c3cm8c2c3c2,
			CxB => R_cm1cm1c0c2cm1cm6cm19c1cm1cm1c26c0c0cm6cm5cm3
		);

    c0c0cm1c0c1cm1c9c3c10cm1cm26c47c0c0cm9c0_cm1c0c6cm2cm3c3cm1cm3c31cm4c6cm6cm2c3c6cm6_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0c0cm1c0c1cm1c9c3c10cm1cm26c47c0c0cm9c0_weight(1)(7-1 downto 0),
			B	=> cm1c0c6cm2cm3c3cm1cm3c31cm4c6cm6cm2c3c6cm6_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c0cm1c0c1cm1c9c3c10cm1cm26c47c0c0cm9c0,
			CxB => R_cm1c0c6cm2cm3c3cm1cm3c31cm4c6cm6cm2c3c6cm6
		);

    c1cm7c7cm1c5c7c3cm18cm1cm13c1cm9cm2c2cm7cm35_cm24c12cm1cm12c0cm8cm4cm7c7c1c2cm3c3cm4c1c2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c1cm7c7cm1c5c7c3cm18cm1cm13c1cm9cm2c2cm7cm35_weight(1)(7-1 downto 0),
			B	=> cm24c12cm1cm12c0cm8cm4cm7c7c1c2cm3c3cm4c1c2_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1cm7c7cm1c5c7c3cm18cm1cm13c1cm9cm2c2cm7cm35,
			CxB => R_cm24c12cm1cm12c0cm8cm4cm7c7c1c2cm3c3cm4c1c2
		);

    c0c4cm4c4cm4cm16c1cm2cm14c1c0cm38cm9cm1c0cm3_c1c1cm1cm2c0c0c0cm2c3c1c0c17c0c5c2cm3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0c4cm4c4cm4cm16c1cm2cm14c1c0cm38cm9cm1c0cm3_weight(1)(7-1 downto 0),
			B	=> c1c1cm1cm2c0c0c0cm2c3c1c0c17c0c5c2cm3_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c4cm4c4cm4cm16c1cm2cm14c1c0cm38cm9cm1c0cm3,
			CxB => R_c1c1cm1cm2c0c0c0cm2c3c1c0c17c0c5c2cm3
		);

    cm28c1cm1cm45cm4c2c10cm10c6c2cm2cm3c4cm9c8cm1_c6c3c20c8cm1c3cm6cm3cm2cm9cm1cm10cm1cm6c4cm9_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm28c1cm1cm45cm4c2c10cm10c6c2cm2cm3c4cm9c8cm1_weight(1)(7-1 downto 0),
			B	=> c6c3c20c8cm1c3cm6cm3cm2cm9cm1cm10cm1cm6c4cm9_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm28c1cm1cm45cm4c2c10cm10c6c2cm2cm3c4cm9c8cm1,
			CxB => R_c6c3c20c8cm1c3cm6cm3cm2cm9cm1cm10cm1cm6c4cm9
		);

    c5cm4c1c2c22c11cm2c0cm11c1c8cm11cm7c1c1cm1_cm3c1c9c3c1cm10cm22cm3cm3c0c3cm3cm8cm4cm4cm7_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c5cm4c1c2c22c11cm2c0cm11c1c8cm11cm7c1c1cm1_weight(1)(6-1 downto 0),
			B	=> cm3c1c9c3c1cm10cm22cm3cm3c0c3cm3cm8cm4cm4cm7_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c5cm4c1c2c22c11cm2c0cm11c1c8cm11cm7c1c1cm1,
			CxB => R_cm3c1c9c3c1cm10cm22cm3cm3c0c3cm3cm8cm4cm4cm7
		);

    cm4c18c0c2cm13cm3c0cm4c3cm4cm7cm3cm4c9c3c0_cm4cm10c2c0c3c10cm9cm3c16cm1c4c0c0c13cm11cm17_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm4c18c0c2cm13cm3c0cm4c3cm4cm7cm3cm4c9c3c0_weight(1)(6-1 downto 0),
			B	=> cm4cm10c2c0c3c10cm9cm3c16cm1c4c0c0c13cm11cm17_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm4c18c0c2cm13cm3c0cm4c3cm4cm7cm3cm4c9c3c0,
			CxB => R_cm4cm10c2c0c3c10cm9cm3c16cm1c4c0c0c13cm11cm17
		);

    cm17cm1c26c0c0c0cm4c0cm3c6cm1cm8c1c4c8cm1_c6cm2c1cm9cm3cm1cm3c16c0c8cm3cm4c4cm4c0cm15_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm17cm1c26c0c0c0cm4c0cm3c6cm1cm8c1c4c8cm1_weight(1)(6-1 downto 0),
			B	=> c6cm2c1cm9cm3cm1cm3c16c0c8cm3cm4c4cm4c0cm15_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm17cm1c26c0c0c0cm4c0cm3c6cm1cm8c1c4c8cm1,
			CxB => R_c6cm2c1cm9cm3cm1cm3c16c0c8cm3cm4c4cm4c0cm15
		);

    cm2c21c28cm4c1cm30cm4c9c2c2c8cm2cm2cm6c5cm2_c4c1cm1cm3cm9c2c2cm9cm1c22c7cm2c8c0c1c4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2c21c28cm4c1cm30cm4c9c2c2c8cm2cm2cm6c5cm2_weight(1)(6-1 downto 0),
			B	=> c4c1cm1cm3cm9c2c2cm9cm1c22c7cm2c8c0c1c4_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2c21c28cm4c1cm30cm4c9c2c2c8cm2cm2cm6c5cm2,
			CxB => R_c4c1cm1cm3cm9c2c2cm9cm1c22c7cm2c8c0c1c4
		);

    c3c1c13c0c0c11c8c1cm1c2c3c15cm25c6c7c1_cm2c3cm23cm5c1cm16c26c25cm30cm2c1c0c2c11c6cm4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c3c1c13c0c0c11c8c1cm1c2c3c15cm25c6c7c1_weight(1)(6-1 downto 0),
			B	=> cm2c3cm23cm5c1cm16c26c25cm30cm2c1c0c2c11c6cm4_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c3c1c13c0c0c11c8c1cm1c2c3c15cm25c6c7c1,
			CxB => R_cm2c3cm23cm5c1cm16c26c25cm30cm2c1c0c2c11c6cm4
		);




end architecture;
