library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

LIBRARY work;
USE work.ALL;
USE work.Components.ALL;

entity conv7_core5_rmcm is
    generic
    (
        PIPELINE_STEPS             : natural := 3
    );
    port
    (
        clk : in std_logic;
    
        SEL : in  std_logic_vector(bits(16-1)-1 downto 0);
    
        X0 : in  std_logic_vector(7-1 downto 0); --	ufix(4, -3)
        R_cm9c7cm7c9cm5cm11c7cm6c0cm7c5cm3c2c0c66c8 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c0c0cm2cm14cm10cm2cm82c2c15cm6cm38cm4c29cm5c30cm1 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c1cm45cm7c4cm15c7c9c5cm18c1c27c10cm51c6cm9c16 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c2c1c8c2c0cm6cm7c3c5c13cm2cm3c4cm4cm12c49 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c13cm22c11cm1c1cm10cm10cm15cm8cm6c4cm9cm8cm8cm19cm8 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm3c16cm7c31c40c2cm7c1c6c5c2c12cm4c9c2c21 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm2cm7c1cm12cm42cm8cm6c5cm29c3cm3c10c6c15cm1cm9 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c6c14c11c1cm2cm16cm12c1cm1cm1cm2c7c3c8c2c1 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_cm12cm3cm42c16cm3cm7cm1cm9cm1c5c2cm12cm5c0c0cm18 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c5cm5c29c7cm2c3c3cm14c4c0cm3cm9c3c0c1cm3 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm14c1c1c42c6c2c1cm1c5cm10c0cm6cm6cm13cm3c5 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm1cm1c2cm6cm23cm27c9c7cm6cm27cm20c1cm2c2c0cm7 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm3cm1c1cm2cm7cm4cm13c0c15cm14cm21cm1c9c3cm22cm3 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm5c1cm3c1c17cm16cm4c3cm11cm4c14c0cm17c1c6c2 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm3cm11c6c2c1cm1cm3cm3cm3c10c2cm3cm13cm6c5cm4 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_c1c6c1cm2cm25cm5c31c1c24c7cm14c2cm3c5cm3cm1 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm3c2cm28c3cm2cm3cm1c0c6c4cm5cm2c2c1cm9c9 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c10c13c0cm2cm4c5cm5cm3c18cm7cm11c5c26c1cm2cm7 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c1cm8c5c3c6cm3c20c29c5cm16cm2cm28cm2cm6c3cm1 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm2cm7cm12cm4c7cm23cm5cm3c2cm13cm3c14c20cm12c4cm76 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_c2c7cm7cm8cm47c5c11cm1c4c8cm8c0c3c1c16c4 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm10cm3cm9cm23cm7cm4cm7cm2c8cm1c19c0c2cm2c6c5 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c9c4c5cm27cm3c0c1c0cm4cm28c5c5c7cm4c1c8 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_c2cm3c9c2cm3cm1c2cm2cm4c7cm9cm2cm3cm8c3c0 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_c7cm2c2c1c1c19cm20cm7cm10c7c1cm2cm6cm3c5c2 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm14cm5cm6cm6c1cm3c1c0cm3cm4c0c2cm1cm77cm4c2 : out std_logic_vector(15-1 downto 0);   --	sfix(5, -10)
        R_cm3cm4c2cm2cm20c11c25cm23c9c7cm8c10c0cm28c43c7 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm13c3c2cm12c1c14cm20c12c11c4cm12cm7c3cm1c3c2 : out std_logic_vector(13-1 downto 0);   --	sfix(3, -10)
        R_cm5c5cm2cm9cm7cm1cm5cm7c5c9cm6cm3cm5c3cm1cm7 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_c2cm3c5c14c9cm3cm11c11cm2cm6c9c8cm3c7cm6c6 : out std_logic_vector(12-1 downto 0);   --	sfix(2, -10)
        R_c3c6cm2cm2cm25cm21cm4cm22c39c5c0c10c12c2cm1cm44 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_cm7c3cm1cm1cm1c7c0cm10c6c6cm13c19c4c4cm61c0 : out std_logic_vector(14-1 downto 0);   --	sfix(4, -10)
        R_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0 : out std_logic_vector(11-1 downto 0)  --	sfix(1, -10)
    );
end conv7_core5_rmcm;

architecture arch of conv7_core5_rmcm is

    type PIPELINE_TYPE_FOR_X0_SIGNAL            is array(0 to 1) of std_logic_vector(7-1 downto 0);
    type PIPELINE_TYPE_FOR_CM9C7CM7C9CM5CM11C7CM6C0CM7C5CM3C2C0C66C8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0CM2CM14CM10CM2CM82C2C15CM6CM38CM4C29CM5C30CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM45CM7C4CM15C7C9C5CM18C1C27C10CM51C6CM9C16_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C1C8C2C0CM6CM7C3C5C13CM2CM3C4CM4CM12C49_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C13CM22C11CM1C1CM10CM10CM15CM8CM6C4CM9CM8CM8CM19CM8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3C16CM7C31C40C2CM7C1C6C5C2C12CM4C9C2C21_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM7C1CM12CM42CM8CM6C5CM29C3CM3C10C6C15CM1CM9_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C6C14C11C1CM2CM16CM12C1CM1CM1CM2C7C3C8C2C1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM12CM3CM42C16CM3CM7CM1CM9CM1C5C2CM12CM5C0C0CM18_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C5CM5C29C7CM2C3C3CM14C4C0CM3CM9C3C0C1CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM14C1C1C42C6C2C1CM1C5CM10C0CM6CM6CM13CM3C5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM1CM1C2CM6CM23CM27C9C7CM6CM27CM20C1CM2C2C0CM7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3CM1C1CM2CM7CM4CM13C0C15CM14CM21CM1C9C3CM22CM3_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5C1CM3C1C17CM16CM4C3CM11CM4C14C0CM17C1C6C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3CM11C6C2C1CM1CM3CM3CM3C10C2CM3CM13CM6C5CM4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1C6C1CM2CM25CM5C31C1C24C7CM14C2CM3C5CM3CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3C2CM28C3CM2CM3CM1C0C6C4CM5CM2C2C1CM9C9_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C10C13C0CM2CM4C5CM5CM3C18CM7CM11C5C26C1CM2CM7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C1CM8C5C3C6CM3C20C29C5CM16CM2CM28CM2CM6C3CM1_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM2CM7CM12CM4C7CM23CM5CM3C2CM13CM3C14C20CM12C4CM76_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2C7CM7CM8CM47C5C11CM1C4C8CM8C0C3C1C16C4_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM10CM3CM9CM23CM7CM4CM7CM2C8CM1C19C0C2CM2C6C5_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C9C4C5CM27CM3C0C1C0CM4CM28C5C5C7CM4C1C8_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2CM3C9C2CM3CM1C2CM2CM4C7CM9CM2CM3CM8C3C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C7CM2C2C1C1C19CM20CM7CM10C7C1CM2CM6CM3C5C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM14CM5CM6CM6C1CM3C1C0CM3CM4C0C2CM1CM77CM4C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM3CM4C2CM2CM20C11C25CM23C9C7CM8C10C0CM28C43C7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM13C3C2CM12C1C14CM20C12C11C4CM12CM7C3CM1C3C2_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM5C5CM2CM9CM7CM1CM5CM7C5C9CM6CM3CM5C3CM1CM7_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C2CM3C5C14C9CM3CM11C11CM2CM6C9C8CM3C7CM6C6_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C3C6CM2CM2CM25CM21CM4CM22C39C5C0C10C12C2CM1CM44_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_CM7C3CM1CM1CM1C7C0CM10C6C6CM13C19C4C4CM61C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);
    type PIPELINE_TYPE_FOR_C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0_WEIGHT is array(0 to 1) of std_logic_vector(8-1 downto 0);

    -- The input to the RMCM
    -- ufix(4, -3)
    signal X0_signal            : PIPELINE_TYPE_FOR_X0_SIGNAL;

    -- All weights

    -- sfix(1, -7)
    signal cm9c7cm7c9cm5cm11c7cm6c0cm7c5cm3c2c0c66c8_weight : PIPELINE_TYPE_FOR_CM9C7CM7C9CM5CM11C7CM6C0CM7C5CM3C2C0C66C8_WEIGHT;
    -- sfix(1, -7)
    signal c0c0cm2cm14cm10cm2cm82c2c15cm6cm38cm4c29cm5c30cm1_weight : PIPELINE_TYPE_FOR_C0C0CM2CM14CM10CM2CM82C2C15CM6CM38CM4C29CM5C30CM1_WEIGHT;
    -- sfix(1, -7)
    signal c1cm45cm7c4cm15c7c9c5cm18c1c27c10cm51c6cm9c16_weight : PIPELINE_TYPE_FOR_C1CM45CM7C4CM15C7C9C5CM18C1C27C10CM51C6CM9C16_WEIGHT;
    -- sfix(1, -7)
    signal c2c1c8c2c0cm6cm7c3c5c13cm2cm3c4cm4cm12c49_weight : PIPELINE_TYPE_FOR_C2C1C8C2C0CM6CM7C3C5C13CM2CM3C4CM4CM12C49_WEIGHT;
    -- sfix(1, -7)
    signal c13cm22c11cm1c1cm10cm10cm15cm8cm6c4cm9cm8cm8cm19cm8_weight : PIPELINE_TYPE_FOR_C13CM22C11CM1C1CM10CM10CM15CM8CM6C4CM9CM8CM8CM19CM8_WEIGHT;
    -- sfix(1, -7)
    signal cm3c16cm7c31c40c2cm7c1c6c5c2c12cm4c9c2c21_weight : PIPELINE_TYPE_FOR_CM3C16CM7C31C40C2CM7C1C6C5C2C12CM4C9C2C21_WEIGHT;
    -- sfix(1, -7)
    signal cm2cm7c1cm12cm42cm8cm6c5cm29c3cm3c10c6c15cm1cm9_weight : PIPELINE_TYPE_FOR_CM2CM7C1CM12CM42CM8CM6C5CM29C3CM3C10C6C15CM1CM9_WEIGHT;
    -- sfix(1, -7)
    signal c6c14c11c1cm2cm16cm12c1cm1cm1cm2c7c3c8c2c1_weight : PIPELINE_TYPE_FOR_C6C14C11C1CM2CM16CM12C1CM1CM1CM2C7C3C8C2C1_WEIGHT;
    -- sfix(1, -7)
    signal cm12cm3cm42c16cm3cm7cm1cm9cm1c5c2cm12cm5c0c0cm18_weight : PIPELINE_TYPE_FOR_CM12CM3CM42C16CM3CM7CM1CM9CM1C5C2CM12CM5C0C0CM18_WEIGHT;
    -- sfix(1, -7)
    signal c5cm5c29c7cm2c3c3cm14c4c0cm3cm9c3c0c1cm3_weight : PIPELINE_TYPE_FOR_C5CM5C29C7CM2C3C3CM14C4C0CM3CM9C3C0C1CM3_WEIGHT;
    -- sfix(1, -7)
    signal cm14c1c1c42c6c2c1cm1c5cm10c0cm6cm6cm13cm3c5_weight : PIPELINE_TYPE_FOR_CM14C1C1C42C6C2C1CM1C5CM10C0CM6CM6CM13CM3C5_WEIGHT;
    -- sfix(1, -7)
    signal cm1cm1c2cm6cm23cm27c9c7cm6cm27cm20c1cm2c2c0cm7_weight : PIPELINE_TYPE_FOR_CM1CM1C2CM6CM23CM27C9C7CM6CM27CM20C1CM2C2C0CM7_WEIGHT;
    -- sfix(1, -7)
    signal cm3cm1c1cm2cm7cm4cm13c0c15cm14cm21cm1c9c3cm22cm3_weight : PIPELINE_TYPE_FOR_CM3CM1C1CM2CM7CM4CM13C0C15CM14CM21CM1C9C3CM22CM3_WEIGHT;
    -- sfix(1, -7)
    signal cm5c1cm3c1c17cm16cm4c3cm11cm4c14c0cm17c1c6c2_weight : PIPELINE_TYPE_FOR_CM5C1CM3C1C17CM16CM4C3CM11CM4C14C0CM17C1C6C2_WEIGHT;
    -- sfix(1, -7)
    signal cm3cm11c6c2c1cm1cm3cm3cm3c10c2cm3cm13cm6c5cm4_weight : PIPELINE_TYPE_FOR_CM3CM11C6C2C1CM1CM3CM3CM3C10C2CM3CM13CM6C5CM4_WEIGHT;
    -- sfix(1, -7)
    signal c1c6c1cm2cm25cm5c31c1c24c7cm14c2cm3c5cm3cm1_weight : PIPELINE_TYPE_FOR_C1C6C1CM2CM25CM5C31C1C24C7CM14C2CM3C5CM3CM1_WEIGHT;
    -- sfix(1, -7)
    signal cm3c2cm28c3cm2cm3cm1c0c6c4cm5cm2c2c1cm9c9_weight : PIPELINE_TYPE_FOR_CM3C2CM28C3CM2CM3CM1C0C6C4CM5CM2C2C1CM9C9_WEIGHT;
    -- sfix(1, -7)
    signal c10c13c0cm2cm4c5cm5cm3c18cm7cm11c5c26c1cm2cm7_weight : PIPELINE_TYPE_FOR_C10C13C0CM2CM4C5CM5CM3C18CM7CM11C5C26C1CM2CM7_WEIGHT;
    -- sfix(1, -7)
    signal c1cm8c5c3c6cm3c20c29c5cm16cm2cm28cm2cm6c3cm1_weight : PIPELINE_TYPE_FOR_C1CM8C5C3C6CM3C20C29C5CM16CM2CM28CM2CM6C3CM1_WEIGHT;
    -- sfix(1, -7)
    signal cm2cm7cm12cm4c7cm23cm5cm3c2cm13cm3c14c20cm12c4cm76_weight : PIPELINE_TYPE_FOR_CM2CM7CM12CM4C7CM23CM5CM3C2CM13CM3C14C20CM12C4CM76_WEIGHT;
    -- sfix(1, -7)
    signal c2c7cm7cm8cm47c5c11cm1c4c8cm8c0c3c1c16c4_weight : PIPELINE_TYPE_FOR_C2C7CM7CM8CM47C5C11CM1C4C8CM8C0C3C1C16C4_WEIGHT;
    -- sfix(1, -7)
    signal cm10cm3cm9cm23cm7cm4cm7cm2c8cm1c19c0c2cm2c6c5_weight : PIPELINE_TYPE_FOR_CM10CM3CM9CM23CM7CM4CM7CM2C8CM1C19C0C2CM2C6C5_WEIGHT;
    -- sfix(1, -7)
    signal c9c4c5cm27cm3c0c1c0cm4cm28c5c5c7cm4c1c8_weight : PIPELINE_TYPE_FOR_C9C4C5CM27CM3C0C1C0CM4CM28C5C5C7CM4C1C8_WEIGHT;
    -- sfix(1, -7)
    signal c2cm3c9c2cm3cm1c2cm2cm4c7cm9cm2cm3cm8c3c0_weight : PIPELINE_TYPE_FOR_C2CM3C9C2CM3CM1C2CM2CM4C7CM9CM2CM3CM8C3C0_WEIGHT;
    -- sfix(1, -7)
    signal c7cm2c2c1c1c19cm20cm7cm10c7c1cm2cm6cm3c5c2_weight : PIPELINE_TYPE_FOR_C7CM2C2C1C1C19CM20CM7CM10C7C1CM2CM6CM3C5C2_WEIGHT;
    -- sfix(1, -7)
    signal cm14cm5cm6cm6c1cm3c1c0cm3cm4c0c2cm1cm77cm4c2_weight : PIPELINE_TYPE_FOR_CM14CM5CM6CM6C1CM3C1C0CM3CM4C0C2CM1CM77CM4C2_WEIGHT;
    -- sfix(1, -7)
    signal cm3cm4c2cm2cm20c11c25cm23c9c7cm8c10c0cm28c43c7_weight : PIPELINE_TYPE_FOR_CM3CM4C2CM2CM20C11C25CM23C9C7CM8C10C0CM28C43C7_WEIGHT;
    -- sfix(1, -7)
    signal cm13c3c2cm12c1c14cm20c12c11c4cm12cm7c3cm1c3c2_weight : PIPELINE_TYPE_FOR_CM13C3C2CM12C1C14CM20C12C11C4CM12CM7C3CM1C3C2_WEIGHT;
    -- sfix(1, -7)
    signal cm5c5cm2cm9cm7cm1cm5cm7c5c9cm6cm3cm5c3cm1cm7_weight : PIPELINE_TYPE_FOR_CM5C5CM2CM9CM7CM1CM5CM7C5C9CM6CM3CM5C3CM1CM7_WEIGHT;
    -- sfix(1, -7)
    signal c2cm3c5c14c9cm3cm11c11cm2cm6c9c8cm3c7cm6c6_weight : PIPELINE_TYPE_FOR_C2CM3C5C14C9CM3CM11C11CM2CM6C9C8CM3C7CM6C6_WEIGHT;
    -- sfix(1, -7)
    signal c3c6cm2cm2cm25cm21cm4cm22c39c5c0c10c12c2cm1cm44_weight : PIPELINE_TYPE_FOR_C3C6CM2CM2CM25CM21CM4CM22C39C5C0C10C12C2CM1CM44_WEIGHT;
    -- sfix(1, -7)
    signal cm7c3cm1cm1cm1c7c0cm10c6c6cm13c19c4c4cm61c0_weight : PIPELINE_TYPE_FOR_CM7C3CM1CM1CM1C7C0CM10C6C6CM13C19C4C4CM61C0_WEIGHT;
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



    WEIGHT_ROM: entity work.conv7_core5_rmcm_weightsconstant_memory
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
        
            dout1   => cm9c7cm7c9cm5cm11c7cm6c0cm7c5cm3c2c0c66c8_weight(0), 
            dout2   => c0c0cm2cm14cm10cm2cm82c2c15cm6cm38cm4c29cm5c30cm1_weight(0), 
            dout3   => c1cm45cm7c4cm15c7c9c5cm18c1c27c10cm51c6cm9c16_weight(0), 
            dout4   => c2c1c8c2c0cm6cm7c3c5c13cm2cm3c4cm4cm12c49_weight(0), 
            dout5   => c13cm22c11cm1c1cm10cm10cm15cm8cm6c4cm9cm8cm8cm19cm8_weight(0), 
            dout6   => cm3c16cm7c31c40c2cm7c1c6c5c2c12cm4c9c2c21_weight(0), 
            dout7   => cm2cm7c1cm12cm42cm8cm6c5cm29c3cm3c10c6c15cm1cm9_weight(0), 
            dout8   => c6c14c11c1cm2cm16cm12c1cm1cm1cm2c7c3c8c2c1_weight(0), 
            dout9   => cm12cm3cm42c16cm3cm7cm1cm9cm1c5c2cm12cm5c0c0cm18_weight(0), 
            dout10   => c5cm5c29c7cm2c3c3cm14c4c0cm3cm9c3c0c1cm3_weight(0), 
            dout11   => cm14c1c1c42c6c2c1cm1c5cm10c0cm6cm6cm13cm3c5_weight(0), 
            dout12   => cm1cm1c2cm6cm23cm27c9c7cm6cm27cm20c1cm2c2c0cm7_weight(0), 
            dout13   => cm3cm1c1cm2cm7cm4cm13c0c15cm14cm21cm1c9c3cm22cm3_weight(0), 
            dout14   => cm5c1cm3c1c17cm16cm4c3cm11cm4c14c0cm17c1c6c2_weight(0), 
            dout15   => cm3cm11c6c2c1cm1cm3cm3cm3c10c2cm3cm13cm6c5cm4_weight(0), 
            dout16   => c1c6c1cm2cm25cm5c31c1c24c7cm14c2cm3c5cm3cm1_weight(0), 
            dout17   => cm3c2cm28c3cm2cm3cm1c0c6c4cm5cm2c2c1cm9c9_weight(0), 
            dout18   => c10c13c0cm2cm4c5cm5cm3c18cm7cm11c5c26c1cm2cm7_weight(0), 
            dout19   => c1cm8c5c3c6cm3c20c29c5cm16cm2cm28cm2cm6c3cm1_weight(0), 
            dout20   => cm2cm7cm12cm4c7cm23cm5cm3c2cm13cm3c14c20cm12c4cm76_weight(0), 
            dout21   => c2c7cm7cm8cm47c5c11cm1c4c8cm8c0c3c1c16c4_weight(0), 
            dout22   => cm10cm3cm9cm23cm7cm4cm7cm2c8cm1c19c0c2cm2c6c5_weight(0), 
            dout23   => c9c4c5cm27cm3c0c1c0cm4cm28c5c5c7cm4c1c8_weight(0), 
            dout24   => c2cm3c9c2cm3cm1c2cm2cm4c7cm9cm2cm3cm8c3c0_weight(0), 
            dout25   => c7cm2c2c1c1c19cm20cm7cm10c7c1cm2cm6cm3c5c2_weight(0), 
            dout26   => cm14cm5cm6cm6c1cm3c1c0cm3cm4c0c2cm1cm77cm4c2_weight(0), 
            dout27   => cm3cm4c2cm2cm20c11c25cm23c9c7cm8c10c0cm28c43c7_weight(0), 
            dout28   => cm13c3c2cm12c1c14cm20c12c11c4cm12cm7c3cm1c3c2_weight(0), 
            dout29   => cm5c5cm2cm9cm7cm1cm5cm7c5c9cm6cm3cm5c3cm1cm7_weight(0), 
            dout30   => c2cm3c5c14c9cm3cm11c11cm2cm6c9c8cm3c7cm6c6_weight(0), 
            dout31   => c3c6cm2cm2cm25cm21cm4cm22c39c5c0c10c12c2cm1cm44_weight(0), 
            dout32   => cm7c3cm1cm1cm1c7c0cm10c6c6cm13c19c4c4cm61c0_weight(0)
        );



    -- Add a pipeline step
    PL_STEP_0_for_X0_signal: entity work.Pipe_Vector PORT MAP(clk, '1', X0_signal(0), X0_signal(1));
    PL_STEP_0_for_cm9c7cm7c9cm5cm11c7cm6c0cm7c5cm3c2c0c66c8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm9c7cm7c9cm5cm11c7cm6c0cm7c5cm3c2c0c66c8_weight(0), cm9c7cm7c9cm5cm11c7cm6c0cm7c5cm3c2c0c66c8_weight(1));
    PL_STEP_0_for_c0c0cm2cm14cm10cm2cm82c2c15cm6cm38cm4c29cm5c30cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0cm2cm14cm10cm2cm82c2c15cm6cm38cm4c29cm5c30cm1_weight(0), c0c0cm2cm14cm10cm2cm82c2c15cm6cm38cm4c29cm5c30cm1_weight(1));
    PL_STEP_0_for_c1cm45cm7c4cm15c7c9c5cm18c1c27c10cm51c6cm9c16_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm45cm7c4cm15c7c9c5cm18c1c27c10cm51c6cm9c16_weight(0), c1cm45cm7c4cm15c7c9c5cm18c1c27c10cm51c6cm9c16_weight(1));
    PL_STEP_0_for_c2c1c8c2c0cm6cm7c3c5c13cm2cm3c4cm4cm12c49_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c1c8c2c0cm6cm7c3c5c13cm2cm3c4cm4cm12c49_weight(0), c2c1c8c2c0cm6cm7c3c5c13cm2cm3c4cm4cm12c49_weight(1));
    PL_STEP_0_for_c13cm22c11cm1c1cm10cm10cm15cm8cm6c4cm9cm8cm8cm19cm8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c13cm22c11cm1c1cm10cm10cm15cm8cm6c4cm9cm8cm8cm19cm8_weight(0), c13cm22c11cm1c1cm10cm10cm15cm8cm6c4cm9cm8cm8cm19cm8_weight(1));
    PL_STEP_0_for_cm3c16cm7c31c40c2cm7c1c6c5c2c12cm4c9c2c21_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3c16cm7c31c40c2cm7c1c6c5c2c12cm4c9c2c21_weight(0), cm3c16cm7c31c40c2cm7c1c6c5c2c12cm4c9c2c21_weight(1));
    PL_STEP_0_for_cm2cm7c1cm12cm42cm8cm6c5cm29c3cm3c10c6c15cm1cm9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm7c1cm12cm42cm8cm6c5cm29c3cm3c10c6c15cm1cm9_weight(0), cm2cm7c1cm12cm42cm8cm6c5cm29c3cm3c10c6c15cm1cm9_weight(1));
    PL_STEP_0_for_c6c14c11c1cm2cm16cm12c1cm1cm1cm2c7c3c8c2c1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c6c14c11c1cm2cm16cm12c1cm1cm1cm2c7c3c8c2c1_weight(0), c6c14c11c1cm2cm16cm12c1cm1cm1cm2c7c3c8c2c1_weight(1));
    PL_STEP_0_for_cm12cm3cm42c16cm3cm7cm1cm9cm1c5c2cm12cm5c0c0cm18_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm12cm3cm42c16cm3cm7cm1cm9cm1c5c2cm12cm5c0c0cm18_weight(0), cm12cm3cm42c16cm3cm7cm1cm9cm1c5c2cm12cm5c0c0cm18_weight(1));
    PL_STEP_0_for_c5cm5c29c7cm2c3c3cm14c4c0cm3cm9c3c0c1cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c5cm5c29c7cm2c3c3cm14c4c0cm3cm9c3c0c1cm3_weight(0), c5cm5c29c7cm2c3c3cm14c4c0cm3cm9c3c0c1cm3_weight(1));
    PL_STEP_0_for_cm14c1c1c42c6c2c1cm1c5cm10c0cm6cm6cm13cm3c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm14c1c1c42c6c2c1cm1c5cm10c0cm6cm6cm13cm3c5_weight(0), cm14c1c1c42c6c2c1cm1c5cm10c0cm6cm6cm13cm3c5_weight(1));
    PL_STEP_0_for_cm1cm1c2cm6cm23cm27c9c7cm6cm27cm20c1cm2c2c0cm7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm1cm1c2cm6cm23cm27c9c7cm6cm27cm20c1cm2c2c0cm7_weight(0), cm1cm1c2cm6cm23cm27c9c7cm6cm27cm20c1cm2c2c0cm7_weight(1));
    PL_STEP_0_for_cm3cm1c1cm2cm7cm4cm13c0c15cm14cm21cm1c9c3cm22cm3_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3cm1c1cm2cm7cm4cm13c0c15cm14cm21cm1c9c3cm22cm3_weight(0), cm3cm1c1cm2cm7cm4cm13c0c15cm14cm21cm1c9c3cm22cm3_weight(1));
    PL_STEP_0_for_cm5c1cm3c1c17cm16cm4c3cm11cm4c14c0cm17c1c6c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5c1cm3c1c17cm16cm4c3cm11cm4c14c0cm17c1c6c2_weight(0), cm5c1cm3c1c17cm16cm4c3cm11cm4c14c0cm17c1c6c2_weight(1));
    PL_STEP_0_for_cm3cm11c6c2c1cm1cm3cm3cm3c10c2cm3cm13cm6c5cm4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3cm11c6c2c1cm1cm3cm3cm3c10c2cm3cm13cm6c5cm4_weight(0), cm3cm11c6c2c1cm1cm3cm3cm3c10c2cm3cm13cm6c5cm4_weight(1));
    PL_STEP_0_for_c1c6c1cm2cm25cm5c31c1c24c7cm14c2cm3c5cm3cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1c6c1cm2cm25cm5c31c1c24c7cm14c2cm3c5cm3cm1_weight(0), c1c6c1cm2cm25cm5c31c1c24c7cm14c2cm3c5cm3cm1_weight(1));
    PL_STEP_0_for_cm3c2cm28c3cm2cm3cm1c0c6c4cm5cm2c2c1cm9c9_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3c2cm28c3cm2cm3cm1c0c6c4cm5cm2c2c1cm9c9_weight(0), cm3c2cm28c3cm2cm3cm1c0c6c4cm5cm2c2c1cm9c9_weight(1));
    PL_STEP_0_for_c10c13c0cm2cm4c5cm5cm3c18cm7cm11c5c26c1cm2cm7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c10c13c0cm2cm4c5cm5cm3c18cm7cm11c5c26c1cm2cm7_weight(0), c10c13c0cm2cm4c5cm5cm3c18cm7cm11c5c26c1cm2cm7_weight(1));
    PL_STEP_0_for_c1cm8c5c3c6cm3c20c29c5cm16cm2cm28cm2cm6c3cm1_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c1cm8c5c3c6cm3c20c29c5cm16cm2cm28cm2cm6c3cm1_weight(0), c1cm8c5c3c6cm3c20c29c5cm16cm2cm28cm2cm6c3cm1_weight(1));
    PL_STEP_0_for_cm2cm7cm12cm4c7cm23cm5cm3c2cm13cm3c14c20cm12c4cm76_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm2cm7cm12cm4c7cm23cm5cm3c2cm13cm3c14c20cm12c4cm76_weight(0), cm2cm7cm12cm4c7cm23cm5cm3c2cm13cm3c14c20cm12c4cm76_weight(1));
    PL_STEP_0_for_c2c7cm7cm8cm47c5c11cm1c4c8cm8c0c3c1c16c4_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2c7cm7cm8cm47c5c11cm1c4c8cm8c0c3c1c16c4_weight(0), c2c7cm7cm8cm47c5c11cm1c4c8cm8c0c3c1c16c4_weight(1));
    PL_STEP_0_for_cm10cm3cm9cm23cm7cm4cm7cm2c8cm1c19c0c2cm2c6c5_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm10cm3cm9cm23cm7cm4cm7cm2c8cm1c19c0c2cm2c6c5_weight(0), cm10cm3cm9cm23cm7cm4cm7cm2c8cm1c19c0c2cm2c6c5_weight(1));
    PL_STEP_0_for_c9c4c5cm27cm3c0c1c0cm4cm28c5c5c7cm4c1c8_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c9c4c5cm27cm3c0c1c0cm4cm28c5c5c7cm4c1c8_weight(0), c9c4c5cm27cm3c0c1c0cm4cm28c5c5c7cm4c1c8_weight(1));
    PL_STEP_0_for_c2cm3c9c2cm3cm1c2cm2cm4c7cm9cm2cm3cm8c3c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2cm3c9c2cm3cm1c2cm2cm4c7cm9cm2cm3cm8c3c0_weight(0), c2cm3c9c2cm3cm1c2cm2cm4c7cm9cm2cm3cm8c3c0_weight(1));
    PL_STEP_0_for_c7cm2c2c1c1c19cm20cm7cm10c7c1cm2cm6cm3c5c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c7cm2c2c1c1c19cm20cm7cm10c7c1cm2cm6cm3c5c2_weight(0), c7cm2c2c1c1c19cm20cm7cm10c7c1cm2cm6cm3c5c2_weight(1));
    PL_STEP_0_for_cm14cm5cm6cm6c1cm3c1c0cm3cm4c0c2cm1cm77cm4c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm14cm5cm6cm6c1cm3c1c0cm3cm4c0c2cm1cm77cm4c2_weight(0), cm14cm5cm6cm6c1cm3c1c0cm3cm4c0c2cm1cm77cm4c2_weight(1));
    PL_STEP_0_for_cm3cm4c2cm2cm20c11c25cm23c9c7cm8c10c0cm28c43c7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm3cm4c2cm2cm20c11c25cm23c9c7cm8c10c0cm28c43c7_weight(0), cm3cm4c2cm2cm20c11c25cm23c9c7cm8c10c0cm28c43c7_weight(1));
    PL_STEP_0_for_cm13c3c2cm12c1c14cm20c12c11c4cm12cm7c3cm1c3c2_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm13c3c2cm12c1c14cm20c12c11c4cm12cm7c3cm1c3c2_weight(0), cm13c3c2cm12c1c14cm20c12c11c4cm12cm7c3cm1c3c2_weight(1));
    PL_STEP_0_for_cm5c5cm2cm9cm7cm1cm5cm7c5c9cm6cm3cm5c3cm1cm7_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm5c5cm2cm9cm7cm1cm5cm7c5c9cm6cm3cm5c3cm1cm7_weight(0), cm5c5cm2cm9cm7cm1cm5cm7c5c9cm6cm3cm5c3cm1cm7_weight(1));
    PL_STEP_0_for_c2cm3c5c14c9cm3cm11c11cm2cm6c9c8cm3c7cm6c6_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c2cm3c5c14c9cm3cm11c11cm2cm6c9c8cm3c7cm6c6_weight(0), c2cm3c5c14c9cm3cm11c11cm2cm6c9c8cm3c7cm6c6_weight(1));
    PL_STEP_0_for_c3c6cm2cm2cm25cm21cm4cm22c39c5c0c10c12c2cm1cm44_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c3c6cm2cm2cm25cm21cm4cm22c39c5c0c10c12c2cm1cm44_weight(0), c3c6cm2cm2cm25cm21cm4cm22c39c5c0c10c12c2cm1cm44_weight(1));
    PL_STEP_0_for_cm7c3cm1cm1cm1c7c0cm10c6c6cm13c19c4c4cm61c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', cm7c3cm1cm1cm1c7c0cm10c6c6cm13c19c4c4cm61c0_weight(0), cm7c3cm1cm1cm1c7c0cm10c6c6cm13c19c4c4cm61c0_weight(1));
    PL_STEP_0_for_c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight: entity work.Pipe_Vector PORT MAP(clk, '1', c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(0), c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0_weight(1));


    cm9c7cm7c9cm5cm11c7cm6c0cm7c5cm3c2c0c66c8_c2cm3c5c14c9cm3cm11c11cm2cm6c9c8cm3c7cm6c6_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm9c7cm7c9cm5cm11c7cm6c0cm7c5cm3c2c0c66c8_weight(1)(8-1 downto 0),
			B	=> c2cm3c5c14c9cm3cm11c11cm2cm6c9c8cm3c7cm6c6_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm9c7cm7c9cm5cm11c7cm6c0cm7c5cm3c2c0c66c8,
			CxB => R_c2cm3c5c14c9cm3cm11c11cm2cm6c9c8cm3c7cm6c6
		);

    c0c0cm2cm14cm10cm2cm82c2c15cm6cm38cm4c29cm5c30cm1_cm5c5cm2cm9cm7cm1cm5cm7c5c9cm6cm3cm5c3cm1cm7_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c0c0cm2cm14cm10cm2cm82c2c15cm6cm38cm4c29cm5c30cm1_weight(1)(8-1 downto 0),
			B	=> cm5c5cm2cm9cm7cm1cm5cm7c5c9cm6cm3cm5c3cm1cm7_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c0c0cm2cm14cm10cm2cm82c2c15cm6cm38cm4c29cm5c30cm1,
			CxB => R_cm5c5cm2cm9cm7cm1cm5cm7c5c9cm6cm3cm5c3cm1cm7
		);

    cm2cm7cm12cm4c7cm23cm5cm3c2cm13cm3c14c20cm12c4cm76_c2cm3c9c2cm3cm1c2cm2cm4c7cm9cm2cm3cm8c3c0_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2cm7cm12cm4c7cm23cm5cm3c2cm13cm3c14c20cm12c4cm76_weight(1)(8-1 downto 0),
			B	=> c2cm3c9c2cm3cm1c2cm2cm4c7cm9cm2cm3cm8c3c0_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2cm7cm12cm4c7cm23cm5cm3c2cm13cm3c14c20cm12c4cm76,
			CxB => R_c2cm3c9c2cm3cm1c2cm2cm4c7cm9cm2cm3cm8c3c0
		);

    cm14cm5cm6cm6c1cm3c1c0cm3cm4c0c2cm1cm77cm4c2_cm3cm11c6c2c1cm1cm3cm3cm3c10c2cm3cm13cm6c5cm4_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm14cm5cm6cm6c1cm3c1c0cm3cm4c0c2cm1cm77cm4c2_weight(1)(8-1 downto 0),
			B	=> cm3cm11c6c2c1cm1cm3cm3cm3c10c2cm3cm13cm6c5cm4_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm14cm5cm6cm6c1cm3c1c0cm3cm4c0c2cm1cm77cm4c2,
			CxB => R_cm3cm11c6c2c1cm1cm3cm3cm3c10c2cm3cm13cm6c5cm4
		);

    c1cm45cm7c4cm15c7c9c5cm18c1c27c10cm51c6cm9c16_c6c14c11c1cm2cm16cm12c1cm1cm1cm2c7c3c8c2c1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c1cm45cm7c4cm15c7c9c5cm18c1c27c10cm51c6cm9c16_weight(1)(7-1 downto 0),
			B	=> c6c14c11c1cm2cm16cm12c1cm1cm1cm2c7c3c8c2c1_weight(1)(5-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c1cm45cm7c4cm15c7c9c5cm18c1c27c10cm51c6cm9c16,
			CxB => R_c6c14c11c1cm2cm16cm12c1cm1cm1cm2c7c3c8c2c1
		);

    c2c1c8c2c0cm6cm7c3c5c13cm2cm3c4cm4cm12c49_cm13c3c2cm12c1c14cm20c12c11c4cm12cm7c3cm1c3c2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c2c1c8c2c0cm6cm7c3c5c13cm2cm3c4cm4cm12c49_weight(1)(7-1 downto 0),
			B	=> cm13c3c2cm12c1c14cm20c12c11c4cm12cm7c3cm1c3c2_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c2c1c8c2c0cm6cm7c3c5c13cm2cm3c4cm4cm12c49,
			CxB => R_cm13c3c2cm12c1c14cm20c12c11c4cm12cm7c3cm1c3c2
		);

    cm3c16cm7c31c40c2cm7c1c6c5c2c12cm4c9c2c21_c7cm2c2c1c1c19cm20cm7cm10c7c1cm2cm6cm3c5c2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm3c16cm7c31c40c2cm7c1c6c5c2c12cm4c9c2c21_weight(1)(7-1 downto 0),
			B	=> c7cm2c2c1c1c19cm20cm7cm10c7c1cm2cm6cm3c5c2_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm3c16cm7c31c40c2cm7c1c6c5c2c12cm4c9c2c21,
			CxB => R_c7cm2c2c1c1c19cm20cm7cm10c7c1cm2cm6cm3c5c2
		);

    cm2cm7c1cm12cm42cm8cm6c5cm29c3cm3c10c6c15cm1cm9_c9c4c5cm27cm3c0c1c0cm4cm28c5c5c7cm4c1c8_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm2cm7c1cm12cm42cm8cm6c5cm29c3cm3c10c6c15cm1cm9_weight(1)(7-1 downto 0),
			B	=> c9c4c5cm27cm3c0c1c0cm4cm28c5c5c7cm4c1c8_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm2cm7c1cm12cm42cm8cm6c5cm29c3cm3c10c6c15cm1cm9,
			CxB => R_c9c4c5cm27cm3c0c1c0cm4cm28c5c5c7cm4c1c8
		);

    cm12cm3cm42c16cm3cm7cm1cm9cm1c5c2cm12cm5c0c0cm18_cm10cm3cm9cm23cm7cm4cm7cm2c8cm1c19c0c2cm2c6c5_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm12cm3cm42c16cm3cm7cm1cm9cm1c5c2cm12cm5c0c0cm18_weight(1)(7-1 downto 0),
			B	=> cm10cm3cm9cm23cm7cm4cm7cm2c8cm1c19c0c2cm2c6c5_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm12cm3cm42c16cm3cm7cm1cm9cm1c5c2cm12cm5c0c0cm18,
			CxB => R_cm10cm3cm9cm23cm7cm4cm7cm2c8cm1c19c0c2cm2c6c5
		);

    cm14c1c1c42c6c2c1cm1c5cm10c0cm6cm6cm13cm3c5_c1cm8c5c3c6cm3c20c29c5cm16cm2cm28cm2cm6c3cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm14c1c1c42c6c2c1cm1c5cm10c0cm6cm6cm13cm3c5_weight(1)(7-1 downto 0),
			B	=> c1cm8c5c3c6cm3c20c29c5cm16cm2cm28cm2cm6c3cm1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm14c1c1c42c6c2c1cm1c5cm10c0cm6cm6cm13cm3c5,
			CxB => R_c1cm8c5c3c6cm3c20c29c5cm16cm2cm28cm2cm6c3cm1
		);

    c2c7cm7cm8cm47c5c11cm1c4c8cm8c0c3c1c16c4_c10c13c0cm2cm4c5cm5cm3c18cm7cm11c5c26c1cm2cm7_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c2c7cm7cm8cm47c5c11cm1c4c8cm8c0c3c1c16c4_weight(1)(7-1 downto 0),
			B	=> c10c13c0cm2cm4c5cm5cm3c18cm7cm11c5c26c1cm2cm7_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c2c7cm7cm8cm47c5c11cm1c4c8cm8c0c3c1c16c4,
			CxB => R_c10c13c0cm2cm4c5cm5cm3c18cm7cm11c5c26c1cm2cm7
		);

    cm3cm4c2cm2cm20c11c25cm23c9c7cm8c10c0cm28c43c7_cm3c2cm28c3cm2cm3cm1c0c6c4cm5cm2c2c1cm9c9_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm3cm4c2cm2cm20c11c25cm23c9c7cm8c10c0cm28c43c7_weight(1)(7-1 downto 0),
			B	=> cm3c2cm28c3cm2cm3cm1c0c6c4cm5cm2c2c1cm9c9_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm3cm4c2cm2cm20c11c25cm23c9c7cm8c10c0cm28c43c7,
			CxB => R_cm3c2cm28c3cm2cm3cm1c0c6c4cm5cm2c2c1cm9c9
		);

    c3c6cm2cm2cm25cm21cm4cm22c39c5c0c10c12c2cm1cm44_c1c6c1cm2cm25cm5c31c1c24c7cm14c2cm3c5cm3cm1_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c3c6cm2cm2cm25cm21cm4cm22c39c5c0c10c12c2cm1cm44_weight(1)(7-1 downto 0),
			B	=> c1c6c1cm2cm25cm5c31c1c24c7cm14c2cm3c5cm3cm1_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c3c6cm2cm2cm25cm21cm4cm22c39c5c0c10c12c2cm1cm44,
			CxB => R_c1c6c1cm2cm25cm5c31c1c24c7cm14c2cm3c5cm3cm1
		);

    cm7c3cm1cm1cm1c7c0cm10c6c6cm13c19c4c4cm61c0_cm5c1cm3c1c17cm16cm4c3cm11cm4c14c0cm17c1c6c2_DUAL_MULT: entity work.DualMultDSP
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
			A	=> cm7c3cm1cm1cm1c7c0cm10c6c6cm13c19c4c4cm61c0_weight(1)(7-1 downto 0),
			B	=> cm5c1cm3c1c17cm16cm4c3cm11cm4c14c0cm17c1c6c2_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_cm7c3cm1cm1cm1c7c0cm10c6c6cm13c19c4c4cm61c0,
			CxB => R_cm5c1cm3c1c17cm16cm4c3cm11cm4c14c0cm17c1c6c2
		);

    c13cm22c11cm1c1cm10cm10cm15cm8cm6c4cm9cm8cm8cm19cm8_cm3cm1c1cm2cm7cm4cm13c0c15cm14cm21cm1c9c3cm22cm3_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c13cm22c11cm1c1cm10cm10cm15cm8cm6c4cm9cm8cm8cm19cm8_weight(1)(6-1 downto 0),
			B	=> cm3cm1c1cm2cm7cm4cm13c0c15cm14cm21cm1c9c3cm22cm3_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c13cm22c11cm1c1cm10cm10cm15cm8cm6c4cm9cm8cm8cm19cm8,
			CxB => R_cm3cm1c1cm2cm7cm4cm13c0c15cm14cm21cm1c9c3cm22cm3
		);

    c5cm5c29c7cm2c3c3cm14c4c0cm3cm9c3c0c1cm3_cm1cm1c2cm6cm23cm27c9c7cm6cm27cm20c1cm2c2c0cm7_DUAL_MULT: entity work.DualMultDSP
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
			A	=> c5cm5c29c7cm2c3c3cm14c4c0cm3cm9c3c0c1cm3_weight(1)(6-1 downto 0),
			B	=> cm1cm1c2cm6cm23cm27c9c7cm6cm27cm20c1cm2c2c0cm7_weight(1)(6-1 downto 0),
			C	=> X0_signal(1),
			CxA => R_c5cm5c29c7cm2c3c3cm14c4c0cm3cm9c3c0c1cm3,
			CxB => R_cm1cm1c2cm6cm23cm27c9c7cm6cm27cm20c1cm2c2c0cm7
		);




end architecture;
